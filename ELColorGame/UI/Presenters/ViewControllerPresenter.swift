//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

protocol ViewControllerPresenting {

    var viewController: UIViewController? { get set }

    func present(viewController: UIViewController)
    func dismiss(viewController: UIViewController)

}

class ViewControllerPresenter: ViewControllerPresenting {

    weak var viewController: UIViewController?

    func present(viewController: UIViewController) {
        self.viewController?.present(viewController, animated: true, completion: nil)
    }

    func dismiss(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }

}
