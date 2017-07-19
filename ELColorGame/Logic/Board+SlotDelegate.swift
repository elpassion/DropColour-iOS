import Foundation

extension Board: SlotDelegate {

    func slot(_ slot: Slot, didInsertCircle circle: Circle) {
        delegate?.board(self, didInsertCircle: circle, intoSlot: slot)
        if slots.emptySlots.count == 0 {
            delegate?.boardBecameFull(self)
        }
    }

    func slot(_ slot: Slot, didRemoveCirlce circle: Circle) {
        delegate?.board(self, didRemoveCircle: circle, fromSlot: slot)
    }

}
