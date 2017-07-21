import UIKit

extension GameBoardView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        guard let circleView = circleView(atPoint: location) else { return }
        let dragger = CircleViewDragger(view: circleView, touch: touch)
        draggers.append(dragger)
        dragger.view.moveTo(superview: self)
        dragger.view.center = location
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let dragger = dragger(forTouch: touch) else { return }
        let location = touch.location(in: self)
        dragger.view.center = location
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let dragger = dragger(forTouch: touch) else { return }
        draggers = draggers.filter { $0.view != dragger.view }
        guard let slotView = slotView(forCircleView: dragger.view) else { return }
        guard let slotSuperview = slotView.superview else { return }
        let slotLocationFrom = SlotLocation(column: slotView.column, row: slotView.row)

        guard let delegate = delegate else { return }
        let targetSlotViews = slotViews(inRect: dragger.view.frame)
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

    private func dragger(forTouch touch: UITouch) -> CircleViewDragger? {
        return draggers.filter { $0.touch == touch }.first
    }

    private func restoreCircleDraggerViewToInitialPosition(_ circleViewDragger: CircleViewDragger,
                                                           slotSuperview: UIView,
                                                           slotView: GameBoardSlotView) {
        let targetCenter = slotSuperview.convert(slotView.center, to: self)
        UIView.animate(withDuration: 0.2,
            animations: {
                circleViewDragger.view.center = targetCenter
                circleViewDragger.view.addBounceAnimation()
            }, completion: { _ in
                circleViewDragger.view.moveTo(superview: slotView)
            }
        )
    }

}
