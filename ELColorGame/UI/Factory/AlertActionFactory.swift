import UIKit

protocol AlertActionCreating {

    func createAction(withTitle title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction

}

class AlertActionFactory: AlertActionCreating {

    func createAction(withTitle title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler: handler)
    }

}
