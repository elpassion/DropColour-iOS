import Foundation

extension Game: BoardDelegate {

    func board(_ board: Board, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        delegate?.game(self, didInsertCircle: circle, intoSlot: slot)
    }

    func board(_ board: Board, didRemoveCircle circle: Circle, fromSlot slot: Slot) {
        delegate?.game(self, didRemoveCircle: circle, fromSlot: slot)
    }

    func boardBecameFull(_ board: Board) {
        end()
        delegate?.gameOver(self)
    }

}
