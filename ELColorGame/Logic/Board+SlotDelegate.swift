//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension Board: SlotDelegate {

    func slot(slot: Slot, didInsertCircle circle: Circle) {
        delegate?.board(self, didInsertCircle: circle, intoSlot: slot)
        if slots.emptySlots.count == 0 {
            delegate?.boardBecameFull(self)
        }
    }

    func slot(slot: Slot, didRemoveCirlce circle: Circle) {
        delegate?.board(self, didRemoveCircle: circle, fromSlot: slot)
    }

}
