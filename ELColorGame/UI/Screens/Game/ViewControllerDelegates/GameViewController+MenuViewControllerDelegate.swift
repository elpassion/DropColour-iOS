//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension GameViewController: MenuViewControllerDelegate {

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
