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
