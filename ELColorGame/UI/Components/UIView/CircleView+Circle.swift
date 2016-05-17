//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension CircleView {

    convenience init(circle: Circle) {
        let colors = CircleView.colorsForCircle(circle)
        self.init(topColor: colors.top, bottomColor: colors.bottom)
    }

    private class func colorsForCircle(circle: Circle) -> (top: UIColor, bottom: UIColor) {
        switch circle.type {
        case .Purple:
            return (UIColor(color: .PurpleC86DD7), UIColor(color: .Purple906DD7))
        case .Blue:
            return (UIColor(color: .Blue00C7FF), UIColor(color: .Blue0076FF))
        case .Orange:
            return (UIColor(color: .OrangeFAD961), UIColor(color: .OrangeF7821C))
        case .Red:
            return (UIColor(color: .RedE92578), UIColor(color: .RedE9253D))
        case .Turquoise:
            return (UIColor(color: .Turquoise3CFFB7), UIColor(color: .Turquoise50CFE3))
        case .Green:
            return (UIColor(color: .GreenA5E01A), UIColor(color: .Green32E01A))
        }
    }

}
