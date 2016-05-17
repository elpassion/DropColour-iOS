//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

extension Array {

    var random: Element? {
        guard count > 0 else { return nil }
        return self[Int(arc4random_uniform(UInt32(count)))]
    }

}
