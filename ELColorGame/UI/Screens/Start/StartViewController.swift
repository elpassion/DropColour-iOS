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

class StartViewController: UIViewController, StartViewDelegate, GKGameCenterControllerDelegate {

    override func loadView() {
        self.view = StartView(delegate: self)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticatePlayer()
    }
    
    func authenticatePlayer() {
        GKLocalPlayer.localPlayer().authenticateHandler = {(viewController, error) -> Void in
            guard let vc = viewController else { return }
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    // MARK: StartViewDelegate

    func startViewDidTapNewGame(startView: StartView) {
        let gameBoardViewController = GameViewController()
        presentViewController(gameBoardViewController, animated: true, completion: nil)
    }

    func startViewDidTapTopPlayers(startView: StartView) {
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        presentViewController(gc, animated: true, completion: nil)
    }
    
    func startViewDidTapInfo(startView: StartView) {
        presentViewController(InfoViewController(), animated: true, completion: nil)
    }

    // MARK: GKGameCenterControllerDelegate

    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }

}
