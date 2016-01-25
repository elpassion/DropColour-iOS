//
// Created by Mateusz Szklarek on 23/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit
import Spring

enum Color: String {
    case LightPurple7D75C7  = "#7D75C7"
    case DarkPurple383357   = "#383357"
    case DarkPurple3D3B5E   = "#3D3B5E"
    case Gray202B39         = "#202B39"
    case Green6BE01A        = "#6BE01A"
    case Turquoise54C7C7    = "#54C7C7"
    case Blue3023AE         = "#3023AE"
    case Blue0091FC         = "#0091FC"
    case RedE82654          = "#E82654"
    case White              = "#FFFFFF"
    case PurpleC86DD7       = "#C86DD7"
    case Purple906DD7       = "#906DD7"
    case Blue00C7FF         = "#00C7FF"
    case Blue0076FF         = "#0076FF"
    case OrangeFAD961       = "#FAD961"
    case OrangeF7821C       = "#F7821C"
    case RedE92578          = "#E92578"
    case RedE9253D          = "#E9253D"
    case Turquoise3CFFB7    = "#3CFFB7"
    case Turquoise50CFE3    = "#50CFE3"
    case GreenA5E01A        = "#A5E01A"
    case Green32E01A        = "#32E01A"
}

extension UIColor {
    convenience init(color: Color) {
        self.init(hex: color.rawValue)
    }
}
