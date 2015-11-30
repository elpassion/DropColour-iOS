//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension GameViewController: GameDelegate {
    
    func game(game: Game, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        slotView(forSlot: slot)?.circleView = CircleView(circle: circle)
    }
    
    func game(game: Game, didRemoveCircle circle: Circle, fromSlot slot: Slot) {
        slotView(forSlot: slot)?.circleView = nil
    }
    
    func gameOver(game: Game) {
        print("game over")
    }
    
    // MARK: Helpers
    
    private func slotView(forSlot slot: Slot) -> GameBoardSlotView? {
        guard let view = view as? GameView else { return nil }
        guard let boardView = view.boardView else { return nil }
        return boardView.slotViewAtPosition(row: slot.location.row, column: slot.location.column)
    }
    
}
