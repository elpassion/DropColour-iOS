//
//  StartViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    let backgroundImage:UIImageView = UIImageView()
    let newGameButton = UIButton(frame: CGRectZero)
    
    override func loadView() {
        self.view = UIView()
        configureBackgroundImageView()
        configureNewGameButton()
    }
    
    func configureBackgroundImageView() {
        backgroundImage.image = UIImage(named: "background")
        self.view.addSubview(backgroundImage)
        backgroundImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func configureNewGameButton() {
        newGameButton.setTitle("NEW GAME", forState: UIControlState.Normal)
        newGameButton.titleLabel?.font = UIFont(name: BebasNeueBold, size: 20)
        newGameButton.addTarget(self, action: Selector("didTapOnButtonStart"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(newGameButton)
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
            make.centerY.equalTo(80)
        }
        newGameButton.setTitleColor(UIColor(hue:0.66, saturation:0.81, brightness:0.33, alpha:1), forState: UIControlState.Normal)
        newGameButton.layer.cornerRadius = 27.5
        newGameButton.backgroundColor = UIColor(red:0.42, green:0.88, blue:0.1, alpha:1)
    }
    
    func didTapOnButtonStart() {
        let boardViewController = BoardViewController()
        presentViewController(boardViewController, animated: true, completion: nil)
    }
}
