//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension GameViewController: MenuViewControllerDelegate {

    func menuViewControllerDidResumeGame(_ menuViewController: MenuViewController) {
        game?.start()
    }

    func menuViewControllerDidTapNewGame(_ menuViewController: MenuViewController) {
        game?.restart()
    }

    func menuViewControllerDidTapQuit(_ menuViewController: MenuViewController) {
        dismiss(animated: true, completion: nil)
    }

}
