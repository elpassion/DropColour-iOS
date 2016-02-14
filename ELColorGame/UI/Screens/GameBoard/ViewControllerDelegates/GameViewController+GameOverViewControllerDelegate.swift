//
// Created by Mateusz Szklarek on 23/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

extension GameViewController: GameOverViewControllerDelegate {

    func gameOverViewControllerDidTapRetry(gameOverViewController: GameOverViewController) {
        game?.restart()
    }

    func gameOverViewControllerDidTapQuit(gameOverViewController: GameOverViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
