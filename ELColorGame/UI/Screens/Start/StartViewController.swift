//
//  StartViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit
import GameKit

class StartViewController: UIViewController, GKGameCenterControllerDelegate {
    
    let backgroundImage:UIImageView = UIImageView()
    let newGameButton:Button = Button(title: "NEW GAME", color: UIColor(red:0.42, green:0.88, blue:0.1, alpha:1))
    let topPlayersButton = Button(title: "TOP PLAYERS", color: UIColor(red:0.33, green:0.78, blue:0.78, alpha:1))
    let localPlayer = GKLocalPlayer.localPlayer()
    
    override func loadView() {
        self.view = UIView()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        configureBackgroundImageView()
        configureNewGameButton()
        configureTopPlayersButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticatePlayer()
    }
    
    func authenticatePlayer() {
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            if let viewController = viewController {
                self.presentViewController(viewController, animated: true, completion: nil)
            }
            else {
                print("Local players\(GKLocalPlayer.localPlayer().authenticated)")
            }
        }
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
    
    func configureTopPlayersButtons() {
        topPlayersButton.buttonActionClosure = { [weak self] in
            self?.showLeaders()
        }
        setupTopPlayersButtonLayout()
    }
    
    //Action method
    
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
    
    func setupTopPlayersButtonLayout() {
        self.view.addSubview(topPlayersButton)
        topPlayersButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(newGameButton.snp_bottom).offset(15)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
    }
    
    //Game Center
    
    func showLeaders() {
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        presentViewController(gc, animated: true, completion: nil)
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
