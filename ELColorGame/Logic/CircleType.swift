//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

enum CircleType {

    case Purple
    case Blue
    case Orange
    case Red
    case Turquoise
    case Green

}

extension CircleType {

    static var allTypes: [CircleType] {
        var types = [CircleType]()
        for value in iterateEnum(CircleType) {
            types.append(value)
        }
        return types
    }

}

private func iterateEnum<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    var i = 0
    return AnyGenerator {
        let next = withUnsafePointer(&i) { UnsafePointer<T>($0).memory }
        defer { i = i + 1 }
        return next.hashValue == i ? next : nil
    }
}
