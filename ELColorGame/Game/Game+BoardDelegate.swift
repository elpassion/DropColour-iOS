//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension Game: BoardDelegate {
    
    func board(board: Board, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        delegate?.game(self, didInsertCircle: circle, intoSlot: slot)
    }
    
    func board(board: Board, didRemoveCircle ciecle: Circle, fromSlot slot: Slot) {
        delegate?.game(self, didRemoveCircle: ciecle, fromSlot: slot)
    }
    
    func boardBecameFull(board: Board) {
        self.pause()
        delegate?.gameOver(self)
    }
    
}
