extension GameViewController: GameOverViewControllerDelegate {

    func gameOverViewControllerDidTapRetry(_ gameOverViewController: GameOverViewController) {
        game?.restart()
    }

    func gameOverViewControllerDidTapQuit(_ gameOverViewController: GameOverViewController) {
        dismiss(animated: true, completion: nil)
    }

}
