//
// Created by Mateusz Szklarek on 23/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit
import Spring

enum Color: String {
    case Green6BE019    = "#6BE019"
}

extension UIColor {
    convenience init(color: Color) {
        self.init(hex: color.rawValue)
    }
}
