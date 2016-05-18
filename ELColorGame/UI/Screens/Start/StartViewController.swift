//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import GameKit

class StartViewController: UIViewController, StartViewDelegate, GKGameCenterControllerDelegate {

    let tracker: TrackerProtocol

    init(tracker: TrackerProtocol) {
        self.tracker = tracker
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "StartViewController")
    }

    override func loadView() {
        self.view = StartView(delegate: self)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticatePlayer()
    }

    func authenticatePlayer() {
        GKLocalPlayer.localPlayer().authenticateHandler = { (viewController, error) -> Void in
            guard let vc = viewController else { return }
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }

    // MARK: StartViewDelegate

    func startViewDidTapNewGame(startView: StartView) {
        let gameViewController = GameViewController(tracker: tracker)
        presentViewController(gameViewController, animated: true, completion: nil)
    }

    func startViewDidTapRanking(startView: StartView) {
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        presentViewController(gc, animated: true, completion: nil)
    }

    func startViewDidTapInfo(startView: StartView) {
        presentViewController(InfoViewController(tracker: tracker), animated: true, completion: nil)
    }

    // MARK: GKGameCenterControllerDelegate

    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }

}
