//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

protocol AlertControllerCreating {

    func createAlertControllerWithTitle(title: String?, message: String?, preferredStyle: UIAlertControllerStyle) -> UIAlertController

}

class AlertControllerFactory: AlertControllerCreating {

    func createAlertControllerWithTitle(title: String?, message: String?, preferredStyle: UIAlertControllerStyle) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }

}
