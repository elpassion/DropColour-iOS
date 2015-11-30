//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension GameViewController: GameViewDelegate {
    
    func gameViewDidTapPause(gameView: GameView) {
        game?.pause()
        let menuViewController = MenuViewController(delegate: self)
        presentViewController(menuViewController, animated: true, completion: nil)
    }
    
    func gameViewDidTapRestart(gameView: GameView) {
        game?.restart()
    }
    
}
