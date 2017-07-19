import UIKit

protocol AlertControllerCreating {

    func createAlertController(withTitle title: String?, message: String?, preferredStyle: UIAlertControllerStyle) -> UIAlertController

}

class AlertControllerFactory: AlertControllerCreating {

    func createAlertController(withTitle title: String?, message: String?, preferredStyle: UIAlertControllerStyle) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }

}
