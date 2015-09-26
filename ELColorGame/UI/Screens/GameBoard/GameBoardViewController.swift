//
//  GameBoardViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

class GameBoardViewController: UIViewController, CircleViewDelegate, MenuViewControllerDelegate {
    
    var gridX:Int = Int()
    var gridY:Int = Int()
    var spacing:CGFloat = CGFloat()
    
    let menuViewController = MenuViewController()
    let diameterSingleCircle = 50
    var topView:UIView = UIView()
    var boardView:UIView = UIView()
    var backgroundBoardView = UIView()
    var circleViewsArray:[CircleView] = []
    var circlePointsArray: [CGPoint] = []
    var circleView:CircleView = CircleView()
    let pauseButton = UIButton(frame: CGRectZero)
    let restartButton = UIButton(frame: CGRectZero)
    let scoreTextLabel:UILabel = UILabel(frame: CGRectZero)
    let scoreNumberLabel:UILabel = UILabel(frame: CGRectZero)
    var scoreNumber:Int = Int()
    var myTimer: NSTimer?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let sizeXscreen:Int = Int(UIScreen.mainScreen().bounds.size.width)
        let sizeYscreen:Int = Int(UIScreen.mainScreen().bounds.size.height) - Int(UIScreen.mainScreen().bounds.size.height * 0.12)
        let possibleCircleOnX = (sizeXscreen - 100 - (sizeXscreen % diameterSingleCircle)) / diameterSingleCircle
        let possibleCircleOnY = (sizeYscreen - 150 - (sizeYscreen % diameterSingleCircle)) / diameterSingleCircle
        self.gridX = possibleCircleOnX
        self.gridY = possibleCircleOnY
        self.spacing = (UIScreen.mainScreen().bounds.size.width - CGFloat(diameterSingleCircle * gridX
            )) / CGFloat(gridX + 1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor(red:0.22, green:0.2, blue:0.34, alpha:1)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        configureTopView()
        configureBackgroundBoardView()
        configureBoardView()
        configureRestartButton()
        configurePauseButton()
        configureScoreTextLabel()
        startTimer()
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
    
    func generateCircleView() {
        let x = random() % gridX
        let y = random() % gridY
        
        circleView = CircleView(frame: CGRectMake(CGFloat(x * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(y * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(diameterSingleCircle), CGFloat(diameterSingleCircle)))
        circleView.delegate = self
        circleView.layer.cornerRadius = CGFloat(diameterSingleCircle / 2)
        
        if let point = contains(circlePointsArray, element: circleView.center) {
            print("Circle view with point: \(point) is in array, generate other point")
        }
        else {
            print("This element is first time in array")
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.addAppearAnimation(self.circleView.layer)
                self.boardView.addSubview(self.circleView)
            })
            circleViewsArray.append(circleView)
            circlePointsArray.append(circleView.center)
        }
    }
    
    func configureBoardView() {
        self.view.addSubview(boardView)
        boardView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.topView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func configureBackgroundBoardView() {
        var backgroundCircleView:UIView
        for var y = 0; y < gridY; y++ {
            for var x = 0; x < gridX; x++ {
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
        scoreNumberLabel.text = "0"
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
                circlePointsArray.removeAtIndex(index)
                circleViewsArray.removeAtIndex(index)
            }
            if let index = circleViewsArray.indexOf(view) {
                circlePointsArray.removeAtIndex(index)
                circleViewsArray.removeAtIndex(index)
            }
            possibleView.animation = "zoomOut"
            view.animation = "zoomOut"
            possibleView.animateNext({ () -> () in
                possibleView.removeFromSuperview()
            })
            view.animateNext({ () -> () in
                view.removeFromSuperview()
            })
        } else {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                view.center = initialPoint
                self.addBounceAnimation(view.layer)
            })
        }
    }
    
    //Buttons
    
    func configureRestartButton() {
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
        myTimer?.invalidate()
        let gameBoardViewController = GameBoardViewController()
        presentViewController(gameBoardViewController, animated: true, completion: nil)
    }
    
    func didTapOnPauseButton() {
        myTimer?.invalidate()
        menuViewController.delegate = self
        presentViewController(menuViewController, animated: true, completion: nil)
    }
    
    //Logic
    
    func circleViewWith(point: CGPoint, overView: CircleView) -> CircleView? {
        for circleView in circleViewsArray {
            if CGRectContainsPoint(circleView.frame, point) && circleView != overView && overView.backgroundColor == circleView.backgroundColor {
                playSound()
                scoreNumber += 4
                scoreNumberLabel.text = "\(scoreNumber)"
                return circleView
            }
        }
        return nil
    }
    
    //Sound
    
    func playSound() {
        if let soundURL = NSBundle.mainBundle().URLForResource("bubble_pop_sound", withExtension: "m4a") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
    //Animation
    
    func addBounceAnimation(layer: CALayer) {
        let keyFrame: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = [0.8, 0.9, 1.6, 1.0]
        keyFrame.keyTimes = [0, 0.3, 0.75, 1]
        keyFrame.duration = 0.3
        keyFrame.removedOnCompletion = false
        keyFrame.fillMode = kCAFillModeForwards
        keyFrame.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        layer.addAnimation(keyFrame, forKey: "transform.scale")
    }
    
    func addAppearAnimation(layer: CALayer) {
        let keyFrame: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = [0.0, 0.2, 0.5, 1.4, 1.0]
        keyFrame.keyTimes = [0, 0.3, 0.5, 0.75, 1]
        keyFrame.duration = 0.4
        keyFrame.removedOnCompletion = false
        keyFrame.fillMode = kCAFillModeForwards
        keyFrame.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        layer.addAnimation(keyFrame, forKey: "transform.scale")
    }
    
    //MenuViewController delegate method
    
    func resumeButtonPressed(menuViewController: MenuViewController) {
        startTimer()
    }
    
    //timer
    
    func startTimer() {
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerDidStart:", userInfo: nil, repeats: true)
    }

    func timerDidStart(timer: NSTimer) {
        if canFinishGame() {
            finishGame()
        }
        generateCircleView()
    }
    
    //Helper for points array
    
    func contains(values: [CGPoint], element: CGPoint) -> CGPoint? {
        for value in values {
            if value == element {
                return element
            }
        }
        return nil
    }
    
    //game over
    
    func canFinishGame () -> Bool {
        if circleViewsArray.count == gridX * gridY {
            return true
        }
        return false
    }
    
    func finishGame() {
        myTimer?.invalidate()
        let gameOverViewController = GameOverViewController(score: scoreNumber)
        presentViewController(gameOverViewController, animated: true, completion: nil)
    }
}
