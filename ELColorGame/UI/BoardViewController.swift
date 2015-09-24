//
//  BoardViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit

class BoardViewController: UIViewController {
    
    var topView:UIView = UIView()
    var boardView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopView()
        configureBoardView()
    }
    
    func configureTopView() {
        topView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(self.view).multipliedBy(0.15)
        }
    }
    
    func configureBoardView() {
        boardView.backgroundColor = UIColor.purpleColor()
        let grid_x = 7
        let grid_y = 10
        let dimensionSingleCell = 50
        for var y = 0; y < grid_y; y++ {
            for var x = 0; x < grid_x; x++ {
                let ballView = CircleView(frame: CGRectMake(CGFloat(x * dimensionSingleCell + 5), CGFloat(y * dimensionSingleCell + 5),CGFloat(dimensionSingleCell), CGFloat(dimensionSingleCell)))
                ballView.layer.cornerRadius = 50 / 2
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
}

