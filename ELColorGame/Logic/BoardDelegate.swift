//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

protocol BoardDelegate: class {

    func board(board: Board, didInsertCircle circle: Circle, intoSlot slot: Slot)
    func board(board: Board, didRemoveCircle circle: Circle, fromSlot slot: Slot)
    func boardBecameFull(board: Board)

}
