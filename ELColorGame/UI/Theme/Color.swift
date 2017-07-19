import UIKit
import Spring

enum Color: String {
    case lightPurple7D75C7  = "#7D75C7"
    case darkPurple383357   = "#383357"
    case darkPurple3D3B5E   = "#3D3B5E"
    case gray202B39         = "#202B39"
    case green6BE01A        = "#6BE01A"
    case turquoise54C7C7    = "#54C7C7"
    case blue3023AE         = "#3023AE"
    case blue0091FC         = "#0091FC"
    case redE82654          = "#E82654"
    case white              = "#FFFFFF"
    case purpleC86DD7       = "#C86DD7"
    case purple906DD7       = "#906DD7"
    case blue00C7FF         = "#00C7FF"
    case blue0076FF         = "#0076FF"
    case orangeFAD961       = "#FAD961"
    case orangeF7821C       = "#F7821C"
    case redE92578          = "#E92578"
    case redE9253D          = "#E9253D"
    case turquoise3CFFB7    = "#3CFFB7"
    case turquoise50CFE3    = "#50CFE3"
    case greenA5E01A        = "#A5E01A"
    case green32E01A        = "#32E01A"
}

extension UIColor {
    convenience init(color: Color) {
        self.init(hex: color.rawValue)
    }
}
