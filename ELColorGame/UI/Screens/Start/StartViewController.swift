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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "StartViewController")
    }

    override func loadView() {
        self.view = StartView(delegate: self)
        self.modalTransitionStyle = .crossDissolve
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticatePlayer()
    }

    func authenticatePlayer() {
        GKLocalPlayer.localPlayer().authenticateHandler = { (viewController, error) -> Void in
            guard let vc = viewController else { return }
            self.present(vc, animated: true)
        }
    }

    // MARK: StartViewDelegate

    func startViewDidTapNewGame(_ startView: StartView) {
        let gameViewController = GameViewController(tracker: tracker)
        present(gameViewController, animated: true, completion: nil)
    }

    func startViewDidTapRanking(_ startView: StartView) {
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        present(gc, animated: true, completion: nil)
    }

    func startViewDidTapInfo(_ startView: StartView) {
        present(InfoViewController(tracker: tracker), animated: true, completion: nil)
    }

    // MARK: GKGameCenterControllerDelegate

    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }

}
