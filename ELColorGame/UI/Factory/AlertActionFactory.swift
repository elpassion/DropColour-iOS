//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

protocol AlertActionCreating {

    func createActionWithTitle(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction

}

class AlertActionFactory: AlertActionCreating {

    func createActionWithTitle(title: String?, style: UIAlertActionStyle, handler: (UIAlertAction -> Void)?) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler: handler)
    }

}
