//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation
import GameAnalytics

extension GameViewController: GameDelegate {
    
    func gameDidStart(game: Game) {
        trackGameStartEvent()
    }
    
    func game(game: Game, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        slotView(forSlot: slot)?.circleView = CircleView(circle: circle)
    }
    
    func game(game: Game, didRemoveCircle circle: Circle, fromSlot slot: Slot) {
        slotView(forSlot: slot)?.circleView = nil
    }
    
    func gameOver(game: Game) {
        trackGameCompleteEvent(score: game.scoreNumber)
        synchronizeHighestScore()
        let viewController = GameOverViewController(score: game.scoreNumber, delegate: self, tracker: tracker)
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    func gameDidUpdateScore(score: Int) {
        guard let gameView = view as? GameView else { return }
        gameView.updateScore(score)
    }
    
    // MARK: Helpers
    
    private func slotView(forSlot slot: Slot) -> GameBoardSlotView? {
        guard let view = view as? GameView else { return nil }
        guard let boardView = view.boardView else { return nil }
        return boardView.slotViewAtLocation(column: slot.location.column, row: slot.location.row)
    }
    
}
