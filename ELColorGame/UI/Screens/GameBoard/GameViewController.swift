//
//  GameViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation
import GameKit

class GameViewController: UIViewController, GameViewDelegate, MenuViewControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View
    
    override func loadView() {
        let view = GameView()
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGameIfNeeded()
    }
    
    // MARK: Game
    
    var game: Game?
    
    private func setupGameIfNeeded() {
        guard self.game == nil else { return }
        guard let gameView = view as? GameView else { return }
        let boardView = createGameBoardView(gameView: gameView)
        gameView.boardView = boardView
        let game = Game(boardSize: BoardSize(columns: boardView.columns, rows: boardView.rows))
        game.delegate = self
        self.game = game
        game.start()
    }
    
    private func createGameBoardView(gameView gameView: GameView) -> GameBoardView {
        let slotSize = CGSize(width: 44, height: 44)
        let spacing = CGFloat(15.5)
        let (rows, columns) = GameBoardView.maxBoardSize(forViewSize: gameView.boardContainerView.frame.size, slotSize: slotSize, spacing: spacing)
        return GameBoardView(slotSize: slotSize, rows: rows, columns: columns, spacing: spacing)
    }
    
    // MARK: Sound
    
    func playSound() {
        if let soundURL = NSBundle.mainBundle().URLForResource("bubble_pop_sound", withExtension: "m4a") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
    func playBombSound() {
        if let soundURL = NSBundle.mainBundle().URLForResource("bomb_explosion", withExtension: "m4a") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
    // MARK: GameCenter
    
    func synchronizeHighestScore() {
        if GKLocalPlayer.localPlayer().authenticated {
            let score = GKScore(leaderboardIdentifier: "drag_and_drop_color_leaderboard_01")
            score.value = Int64(0) // TODO: set score
            GKScore.reportScores([score], withCompletionHandler: { (error) -> Void in
                if error != nil {
                    print("error")
                }
            })
        }
    }

    // MARK: GameViewDelegate
    
    func gameViewDidTapPause(gameView: GameView) {
        game?.pause()
        let menuViewController = MenuViewController(delegate: self)
        presentViewController(menuViewController, animated: true, completion: nil)
    }

    func gameViewDidTapRestart(gameView: GameView) {
        game?.restart()
    }
    
    // MARK: MenuViewControllerDelegate
    
    func menuViewControllerDidResumeGame(menuViewController: MenuViewController) {
        game?.start()
    }
    
    func menuViewControllerDidTapNewGame(menuViewController: MenuViewController) {
        game?.restart()
    }
    
    func menuViewControllerDidTapQuit(menuViewController: MenuViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
