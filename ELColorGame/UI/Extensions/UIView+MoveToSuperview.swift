import UIKit

extension UIView {

    func moveTo(superview newSuperview: UIView) {
        guard let currentSuperview = self.superview else {
            newSuperview.addSubview(self)
            return
        }
        guard currentSuperview != newSuperview else { return }
        removeFromSuperview()
        center = currentSuperview.convert(center, to: newSuperview)
        newSuperview.addSubview(self)
    }

}
