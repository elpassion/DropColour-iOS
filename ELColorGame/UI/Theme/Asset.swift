//
// Created by Mateusz Szklarek on 23/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

enum Asset: String {
    case CircleBackground = "background-circles"
    case DropColourLogo   = "logo"
    case PauseIcon        = "pause_icon"
    case Pause            = "pause"
    case RestartIcon      = "restart"
}

extension UIImage {
    convenience init?(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
