//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

protocol SlotDelegate: class {

    func slot(slot: Slot, didInsertCircle circle: Circle)
    func slot(slot: Slot, didRemoveCirlce circle: Circle)

}
