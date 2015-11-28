//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension Game: BoardDelegate {
    
    func board(board: Board, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        print("circle inserted into \(slot.location.column)x\(slot.location.row)")
    }
    
    func board(board: Board, didRemoveCircle ciecle: Circle, fromSlot slot: Slot) {
        print("circle removed from \(slot.location.column)x\(slot.location.row)")
    }
    
    func boardBecameFull(board: Board) {
        print("board became full")
    }
    
}
