import UIKit

extension Button {

    func setBackgroundColor(_ backgroundColor: UIColor, forUIControlState state: UIControlState) {
        setBackgroundImage(imageFromColor(backgroundColor), for: state)
    }

    private func imageFromColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
