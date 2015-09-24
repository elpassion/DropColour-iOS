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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopView()
        configureBackgroundBoardView()
        configureBoardView()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    }
    
    func configureTopView() {
        topView.backgroundColor = UIColor(red:0.22, green:0.2, blue:0.34, alpha:1)
        self.view.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(self.view).multipliedBy(0.12)
        }
    }
    
    func configureBoardView() {
        boardView.backgroundColor = UIColor(red:0.22, green:0.2, blue:0.34, alpha:1)
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
        var ballView: CircleView
        for var y = 0; y < grid_y; y++ {
            for var x = 0; x < grid_x; x++ {
                ballView = CircleView(frame: CGRectMake(CGFloat(x * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(y * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(diameterSingleCircle), CGFloat(diameterSingleCircle)))
                ballView.delegate = self
                ballView.layer.cornerRadius = CGFloat(diameterSingleCircle / 2)
                self.boardView.addSubview(ballView)
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
        var ballView:UIView
        for var y = 0; y < grid_y; y++ {
            for var x = 0; x < grid_x; x++ {
                ballView = UIView(frame: CGRectMake(CGFloat(x * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(y * (diameterSingleCircle + 10)) + spacing * 2, CGFloat(diameterSingleCircle), CGFloat(diameterSingleCircle)))
                ballView.backgroundColor = UIColor(red:0.24, green:0.23, blue:0.37, alpha:1)
                ballView.layer.cornerRadius = CGFloat(diameterSingleCircle / 2)
                self.boardView.addSubview(ballView)
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
    
    //Delegate method 
    
    func pointDidChanged(point: CGPoint) {
        print("point:\(point)")
    }
}
