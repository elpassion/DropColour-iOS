import UIKit

class GameBoardSlotView: UIView {

    let column: Int
    let row: Int

    init(column: Int, row: Int) {
        self.column = column
        self.row = row
        super.init(frame: .zero)
        isUserInteractionEnabled = false
        loadSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIView

    override func layoutSubviews() {
        backgroundView.frame = bounds
        backgroundView.layer.cornerRadius = CGFloat(backgroundView.frame.width / 2)
    }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(backgroundView)
    }

    private let backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(color: .darkPurple3D3B5E)
        return view
    }()

    var circleView: CircleView? {
        didSet {
            if let oldValue = oldValue {
                removeCircleViewWithAnimation(oldValue)
            }
            if let circleView = circleView {
                addCircleViewWithAnimation(circleView)
            }
        }
    }

    private func addCircleViewWithAnimation(_ circleView: CircleView) {
        circleView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        circleView.frame = bounds
        circleView.addAppearAnimation()
        addSubview(circleView)
    }

    private func removeCircleViewWithAnimation(_ circleView: CircleView) {
        circleView.animation = "zoomOut"
        circleView.animateNext { circleView.removeFromSuperview() }
    }

}
