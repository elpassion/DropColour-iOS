import Foundation

extension GameViewController: GameViewDelegate {

    func gameViewDidTapPause(_ gameView: GameView) {
        game?.pause()
    }

    func gameViewDidTapRestart(_ gameView: GameView) {
        guard let game = game else { return }
        game.restart()
        gameView.update(score: game.scoreNumber)
    }

    func gameViewCanMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation) -> Bool {
        guard let game = game else { return false }
        return game.canMoveCircle(fromLocation: fromLocation, toLocation: toLocation)
    }

    func gameViewMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation) {
        try? game?.moveCircle(fromLocation: fromLocation, toLocation: toLocation)
    }

}
