//
//  BoardViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit

class BoardViewController: UIViewController, CircleViewPointChangeDelegate {
    
    let diameterSingleCircle = 50
    var topView:UIView = UIView()
    var boardView:UIView = UIView()
    var backgroundBoardView = UIView()
    var circleViewsArray:[CircleView] = []
    var circleView:CircleView = CircleView()
    let pauseButton = UIButton(frame: CGRectZero)
    let restartButton = UIButton(frame: CGRectZero)
    let scoreTextLabel:UILabel = UILabel(frame: CGRectZero)
    let scoreNumberLabel:UILabel = UILabel(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.22, green:0.2, blue:0.34, alpha:1)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        configureTopView()
        configureBackgroundBoardView()
        configureBoardView()
        configureRestartButton()
        configurePauseButton()
        configureScoreTextLabel()
    }
    
    func configureTopView() {
        self.view.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(self.view).multipliedBy(0.12)
        }
    }
    
    func configureBoardView() {
        let sizeXscreen:Int = Int(self.view.frame.size.width)
        let sizeYscreen:Int = Int(self.view.frame.size.height) - Int(self.view.frame.size.height * 0.12)
        let possibleCircleOnX = (sizeXscreen - 100 - (sizeXscreen % diameterSingleCircle)) / diameterSingleCircle
        let possibleCircleOnY = (sizeYscreen - 150 - (sizeYscreen % diameterSingleCircle)) / diameterSingleCircle
        print("sizeXscreen\(sizeXscreen)")
        print("sizeYscreen\(sizeYscreen)")
        let grid_x = possibleCircleOnX
        let grid_y = possibleCircleOnY
        print("prossibleViewOnScreenHorizontally: \(possibleCircleOnX)")
        print("prossibleViewOnScreenVertically: \(possibleCircleOnY)")
        let spacing = (self.view.frame.size.width - CGFloat(diameterSingleCircle * grid_x)) / CGFloat(grid_x + 1)
        print("spacing\(spacing)")
        for var y = 0; y < grid_y; y++ {
            for var x = 0; x < grid_x; x++ {
                circleView = CircleView(frame: CGRectMake(CGFloat(x * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(y * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(diameterSingleCircle), CGFloat(diameterSingleCircle)))
                circleView.delegate = self
                circleView.layer.cornerRadius = CGFloat(diameterSingleCircle / 2)
                self.boardView.addSubview(circleView)
                circleViewsArray.append(circleView)
            }
        }
        self.view.addSubview(boardView)
        boardView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.topView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func configureBackgroundBoardView() {
        let sizeXscreen:Int = Int(self.view.frame.size.width)
        let sizeYscreen:Int = Int(self.view.frame.size.height) - Int(self.view.frame.size.height * 0.12)
        let possibleCircleOnX = (sizeXscreen - 100 - (sizeXscreen % diameterSingleCircle)) / diameterSingleCircle
        let possibleCircleOnY = (sizeYscreen - 150 - (sizeYscreen % diameterSingleCircle)) / diameterSingleCircle
        let grid_x = possibleCircleOnX
        let grid_y = possibleCircleOnY
        let spacing = (self.view.frame.size.width - CGFloat(diameterSingleCircle * grid_x)) / CGFloat(grid_x + 1)
        var backgroundCircleView:UIView
        for var y = 0; y < grid_y; y++ {
            for var x = 0; x < grid_x; x++ {
                backgroundCircleView = UIView(frame: CGRectMake(CGFloat(x * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(y * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(diameterSingleCircle), CGFloat(diameterSingleCircle)))
                backgroundCircleView.backgroundColor = UIColor(red:0.24, green:0.23, blue:0.37, alpha:1)
                backgroundCircleView.layer.cornerRadius = CGFloat(diameterSingleCircle / 2)
                self.backgroundBoardView.addSubview(backgroundCircleView)
            }
        }
        self.view.addSubview(backgroundBoardView)
        backgroundBoardView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.topView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func configureScoreTextLabel () {
        scoreNumberLabel.text = "250"
        scoreNumberLabel.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        scoreNumberLabel.font = UIFont(name: BebasNeueBold, size: 46)
        self.view.addSubview(scoreNumberLabel)
        
        scoreNumberLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.top.equalTo(30)
        }
        
        scoreTextLabel.text = "SCORE"
        scoreTextLabel.font = UIFont(name: BebasNeueBold, size: 17)
        scoreTextLabel.textColor = UIColor(red:0.49, green:0.46, blue:0.78, alpha:1)
        self.view.addSubview(scoreTextLabel)
        scoreTextLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(scoreNumberLabel.snp_bottom)
            make.centerX.equalTo(0)
        }
    }
    
    //Delegate method 
    
    func pointDidChanged(initialPoint: CGPoint, view: CircleView) {
        let possibleView = circleViewWith(view.center, overView: view)
        if let possibleView = possibleView {
            if let index = circleViewsArray.indexOf(possibleView) {
                circleViewsArray.removeAtIndex(index)
            }
            if let index = circleViewsArray.indexOf(view) {
                circleViewsArray.removeAtIndex(index)
            }
            possibleView.removeFromSuperview()
            view.removeFromSuperview()
        } else {
            view.center = initialPoint
        }
    }
    
    //Buttons
    
    func configureRestartButton() {
//        pauseButton.setTitle("Restart", forState: UIControlState.Normal)
        restartButton.setImage(UIImage(named: "restart"), forState: UIControlState.Normal)
        restartButton.addTarget(self, action: Selector("didTapOnRestartButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.topView.addSubview(restartButton)
        restartButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.right.equalTo(-40)
        }
    }
    
    func configurePauseButton() {
        pauseButton.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
        pauseButton.addTarget(self, action: Selector("didTapOnPauseButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.topView.addSubview(pauseButton)
        pauseButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.left.equalTo(40)
        }
    }
    
    func didTapOnRestartButton() {
        let boardViewController = BoardViewController()
        presentViewController(boardViewController, animated: true, completion: nil)
    }
    
    func didTapOnPauseButton() {
        let menuViewController = MenuViewController()
        presentViewController(menuViewController, animated: true, completion: nil)
    }
    
    //Logic
    
    func circleViewWith(point: CGPoint, overView: CircleView) -> CircleView? {
        for circleView in circleViewsArray {
            if CGRectContainsPoint(circleView.frame, point) && circleView != overView && overView.backgroundColor == circleView.backgroundColor {
                return circleView
            }
        }
        return nil
    }
}
