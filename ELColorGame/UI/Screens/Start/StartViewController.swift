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
    let newGameButton:Button = Button(title: "NEW GAME", color: UIColor(red:0.42, green:0.88, blue:0.1, alpha:1))
    
    override func loadView() {
        self.view = UIView()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        configureBackgroundImageView()
        configureNewGameButton()
    }
    
    //Subviews
    
    func configureBackgroundImageView() {
        backgroundImage.image = UIImage(named: "background")
        setupBackgroundImageViewLayout()
    }
    
    func configureNewGameButton() {
        newGameButton.buttonActionClosure = { [weak self] in
            self?.didTapNewGameButton()
        }
        setupNewGameButtonLayout()
    }
    
    //Button actions
    
    func didTapNewGameButton() {
        let gameBoardViewController = GameBoardViewController()
        presentViewController(gameBoardViewController, animated: true, completion: nil)
    }
    
    //Layout 
    
    func setupBackgroundImageViewLayout() {
        self.view.addSubview(backgroundImage)
        backgroundImage.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
    }
    
    func setupNewGameButtonLayout() {
        self.view.addSubview(newGameButton)
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
            make.centerY.equalTo(80)
        }
    }
}
