//
//  BoardViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let grid_x = 6
        let grid_y = 9
        let dimensionSingleCell = 50
        for var y = 0; y < grid_y; y++ {
            for var x = 0; x < grid_x; x++ {
                let ballView = CircleView(frame: CGRectMake(CGFloat(x * dimensionSingleCell + 5), CGFloat(y * dimensionSingleCell + 5),CGFloat(dimensionSingleCell), CGFloat(dimensionSingleCell)))
                ballView.layer.cornerRadius = 50 / 2
                self.view.addSubview(ballView)
            }
        }

    }
}

