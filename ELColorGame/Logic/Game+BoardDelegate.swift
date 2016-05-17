//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension Game: BoardDelegate {

    func board(board: Board, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        delegate?.game(self, didInsertCircle: circle, intoSlot: slot)
    }

    func board(board: Board, didRemoveCircle circle: Circle, fromSlot slot: Slot) {
        delegate?.game(self, didRemoveCircle: circle, fromSlot: slot)
    }

    func boardBecameFull(board: Board) {
        end()
        delegate?.gameOver(self)
    }

}
