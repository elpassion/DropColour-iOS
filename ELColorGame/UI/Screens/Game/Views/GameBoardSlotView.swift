//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameBoardSlotView: UIView {

    let column: Int
    let row: Int

    init(column: Int, row: Int) {
        self.column = column
        self.row = row
        super.init(frame: CGRectZero)
        userInteractionEnabled = false
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
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor(color: .DarkPurple3D3B5E)
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

    private func addCircleViewWithAnimation(circleView: CircleView) {
        circleView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        circleView.frame = bounds
        circleView.addAppearAnimation()
        addSubview(circleView)
    }

    private func removeCircleViewWithAnimation(circleView: CircleView) {
        circleView.animation = "zoomOut"
        circleView.animateNext { circleView.removeFromSuperview() }
    }

}
