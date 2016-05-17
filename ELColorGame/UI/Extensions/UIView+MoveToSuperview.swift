//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension UIView {

    func moveToSuperview(newSuperview: UIView) {
        guard let currentSuperview = self.superview else {
            newSuperview.addSubview(self)
            return
        }
        guard currentSuperview != newSuperview else { return }
        removeFromSuperview()
        center = currentSuperview.convertPoint(center, toView: newSuperview)
        newSuperview.addSubview(self)
    }

}
