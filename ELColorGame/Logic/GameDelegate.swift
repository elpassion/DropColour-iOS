//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

protocol GameDelegate: class {
    
    func gameDidStart(game: Game)
    func game(game: Game, didInsertCircle circle: Circle, intoSlot slot: Slot)
    func game(game: Game, didRemoveCircle circle: Circle, fromSlot slot: Slot)
    func gameOver(game: Game)
    func gameDidUpdateScore(score: Int)
    
}
