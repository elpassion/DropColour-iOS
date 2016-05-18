//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

struct SlotLocation {

    let column: Int
    let row: Int

}

extension SlotLocation: Hashable {

    var hashValue: Int {
        return "\(column)x\(row)".hashValue
    }

}

func == (lhs: SlotLocation, rhs: SlotLocation) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
