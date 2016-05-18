//
//  Created by Mateusz Szklarek on 26/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import GameKit

class GameOverViewController: UIViewController, GKGameCenterControllerDelegate, GameOverViewDelegate {

    private weak var delegate: GameOverViewControllerDelegate?
    private let scoreNumber: Int
    let tracker: TrackerProtocol

    init(score: Int, delegate: GameOverViewControllerDelegate?, tracker: TrackerProtocol) {
        self.scoreNumber = score
        self.delegate = delegate
        self.tracker = tracker
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = GameOverView(score: scoreNumber, delegate: self)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "GameOverViewController")
    }

    // MARK: GameOverViewDelegate

    func gameOverViewDidTapRetry(gameOverView: GameOverView) {
        self.dismissViewControllerAnimated(true) {
            self.delegate?.gameOverViewControllerDidTapRetry(self)
        }
    }

    func gameOverViewDidTapShowLeaders(gameOverView: GameOverView) {
        showLeaders()
    }

    func gameOverViewDidTapQuit(gameOverView: GameOverView) {
        self.dismissViewControllerAnimated(true) {
            self.delegate?.gameOverViewControllerDidTapQuit(self)
        }
    }

    // MARK: GameCenter

    func showLeaders() {
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        presentViewController(gc, animated: true, completion: nil)
    }

    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }

}

// MARK: - Delegate

protocol GameOverViewControllerDelegate: class {

    func gameOverViewControllerDidTapRetry(gameOverViewController: GameOverViewController)
    func gameOverViewControllerDidTapQuit(gameOverViewController: GameOverViewController)

}
