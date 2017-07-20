import UIKit

class Button: UIButton {

    typealias ButtonActionClosure = () -> ()
    var buttonActionClosure: ButtonActionClosure?

    init(title: String, color: UIColor) {
        super.init(frame: .zero)

        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(font: FontFamily.BebasNeue.bold, size: 22)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 25.0
        backgroundColor = color
        setBackgroundColor(UIColor.black.withAlphaComponent(0.25), forUIControlState: .highlighted)
        configureButtonAction()
    }

    init(image: UIImage?) {
        super.init(frame: .zero)

        setImage(image, for: .normal)
        configureButtonAction()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard var titleFrame = titleLabel?.frame else { return }
        titleFrame.size.height = bounds.height
        titleFrame.origin.y = titleEdgeInsets.top + 2.0
        titleLabel?.frame = titleFrame
        clipsToBounds = true
    }

    private func configureButtonAction() {
        addTarget(self, action: #selector(Button.didTapOnButton(_:)), for: .touchUpInside)
    }

    func didTapOnButton(_ sender: UIButton) {
        buttonActionClosure?()
    }

}
