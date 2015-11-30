//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension GameViewController: GameDelegate {
    
    func game(game: Game, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        print("circle inserted into \(slot.location.column)x\(slot.location.row)")
    }
    
    func game(game: Game, didRemoveCircle circle: Circle, fromSlot slot: Slot) {
        print("circle removed from \(slot.location.column)x\(slot.location.row)")
    }
    
    func gameOver(game: Game) {
        print("game over")
    }
    
}
