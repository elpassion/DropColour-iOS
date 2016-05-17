//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

protocol ViewControllerPresenting {

    var viewController: UIViewController? { get set }

    func presentViewController(viewController: UIViewController)
    func dismissViewController(viewController: UIViewController)

}

class ViewControllerPresenter: ViewControllerPresenting {

    weak var viewController: UIViewController?

    func presentViewController(viewController: UIViewController) {
        self.viewController?.presentViewController(viewController, animated: true, completion: nil)
    }

    func dismissViewController(viewController: UIViewController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }

}
