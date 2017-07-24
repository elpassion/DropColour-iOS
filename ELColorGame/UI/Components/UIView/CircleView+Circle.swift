import UIKit

extension CircleView {

    convenience init(circle: Circle) {
        let colors = CircleView.colorsFor(circle: circle)
        self.init(topColor: colors.top, bottomColor: colors.bottom)
    }

    private class func colorsFor(circle: Circle) -> (top: UIColor, bottom: UIColor) {
        switch circle.type {
        case .purple:
            return (UIColor(color: .purpleC86DD7), UIColor(color: .purple906DD7))
        case .blue:
            return (UIColor(color: .blue00C7FF), UIColor(color: .blue0076FF))
        case .orange:
            return (UIColor(color: .orangeFAD961), UIColor(color: .orangeF7821C))
        case .red:
            return (UIColor(color: .redE92578), UIColor(color: .redE9253D))
        case .turquoise:
            return (UIColor(color: .turquoise3CFFB7), UIColor(color: .turquoise50CFE3))
        case .green:
            return (UIColor(color: .greenA5E01A), UIColor(color: .green32E01A))
        }
    }

}
