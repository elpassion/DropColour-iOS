import Foundation

protocol FontConvertible {
    func font(size: CGFloat) -> UIFont!
}

extension FontConvertible where Self: RawRepresentable, Self.RawValue == String {
    func font(size: CGFloat) -> UIFont! {
        return UIFont(font: self, size: size)
    }
}

// swiftlint:disable force_unwrapping

extension UIFont {
    convenience init?<FontType: FontConvertible>(font: FontType, size: CGFloat)
        where FontType: RawRepresentable, FontType.RawValue == String {
            self.init(name: font.rawValue, size: size)!
    }
}

enum FontFamily {
    enum BebasNeue: String, FontConvertible {
        case bold = "BebasNeueBold"
    }
}
