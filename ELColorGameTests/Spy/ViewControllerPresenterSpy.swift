//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

@testable
import ELColorGame

class ViewControllerPresenterSpy: ViewControllerPresenting {

    var capturedPresentedViewController: UIViewController?
    var capturedDismissedViewController: UIViewController?

    // MARK: ViewControllerPresenting

    weak var viewController: UIViewController?

    func presentViewController(viewController: UIViewController) {
        capturedPresentedViewController = viewController
    }

    func dismissViewController(viewController: UIViewController) {
        capturedDismissedViewController = viewController
    }

}
