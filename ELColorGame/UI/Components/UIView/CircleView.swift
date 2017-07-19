import UIKit
import Spring

class CircleView: SpringView {

    private let topColor: UIColor
    private let bottomColor: UIColor

    init(topColor: UIColor, bottomColor: UIColor) {
        self.topColor = topColor
        self.bottomColor = bottomColor
        super.init(frame: .zero)
        clipsToBounds = true
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        gradientLayer = createGradientLayer(withColors: [topColor, bottomColor])
    }

    // MARK: Gradient backgorund

    private var gradientLayer: CAGradientLayer? {
        didSet {
            if let oldValue = oldValue {
                oldValue.removeFromSuperlayer()
            }
            if let newValue = gradientLayer {
                layer.insertSublayer(newValue, at: 0)
            }
        }
    }

    private func createGradientLayer(withColors colors: [UIColor]) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = colors.map { $0.cgColor }
        return layer
    }

}
