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
