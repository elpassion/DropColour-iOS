//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension GameBoardView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.locationInView(self)
        guard let circleView = circleViewAtPoint(location) else { return }
        let dragger = CircleViewDragger(view: circleView, touch: touch)
        draggers.append(dragger)
        dragger.view.moveToSuperview(self)
        dragger.view.center = location
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let dragger = draggerForTouch(touch) else { return }
        let location = touch.locationInView(self)
        dragger.view.center = location
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let dragger = draggerForTouch(touch) else { return }
        draggers = draggers.filter { $0.view != dragger.view }
        guard let slotView = slotViewForCircleView(dragger.view) else { return }
        guard let slotSuperview = slotView.superview else { return }
        let slotLocationFrom = SlotLocation(column: slotView.column, row: slotView.row)

        guard let delegate = delegate else { return }
        let targetSlotViews = slotViewsAtRect(dragger.view.frame)
        for targetSlotView in targetSlotViews {
            let slotLocationTo = SlotLocation(column: targetSlotView.column, row: targetSlotView.row)
            if delegate.gameBoardViewCanMoveCircle(fromLocation: slotLocationFrom, toLocation: slotLocationTo) {
                delegate.gameBoardViewMoveCircle(fromLocation: slotLocationFrom, toLocation: slotLocationTo)
                playSound()
                return
            }
        }
        restoreCircleDraggerViewToInitialPosition(dragger, slotSuperview: slotSuperview, slotView: slotView)
    }

    private func draggerForTouch(touch: UITouch) -> CircleViewDragger? {
        return draggers.filter { $0.touch == touch }.first
    }

    private func restoreCircleDraggerViewToInitialPosition(circleViewDragger: CircleViewDragger, slotSuperview: UIView, slotView: GameBoardSlotView) {
        let targetCenter = slotSuperview.convertPoint(slotView.center, toView: self)
        UIView.animateWithDuration(0.2,
            animations: {
                circleViewDragger.view.center = targetCenter
                circleViewDragger.view.addBounceAnimation()
            },
            completion: { finished in
                circleViewDragger.view.moveToSuperview(slotView)
            }
        )
    }

}
