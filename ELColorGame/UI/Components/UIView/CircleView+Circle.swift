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
            return (UIColor(hex: "#C86DD7"), UIColor(hex: "#906DD7"))
        case .Blue:
            return (UIColor(hex: "#00C7FF"), UIColor(hex: "#0076FF"))
        case .Orange:
            return (UIColor(hex: "#FAD961"), UIColor(hex: "#F7821C"))
        case .Red:
            return (UIColor(hex: "#E92578"), UIColor(hex: "#E9253D"))
        case .Turquoise:
            return (UIColor(hex: "#3CFFB7"), UIColor(hex: "#50CFE3"))
        case .Green:
            return (UIColor(hex: "#A5E01A"), UIColor(hex: "#32E01A"))
        }
    }
    
}
