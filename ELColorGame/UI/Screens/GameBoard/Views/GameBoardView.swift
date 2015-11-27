//
//  GameBoardView.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    
    let rows: Int
    let columns: Int
    let slotSize: CGSize
    let spacing: CGFloat
    
    init(slotSize: CGSize, rows: Int, columns: Int, spacing: CGFloat) {
        self.slotSize = slotSize
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
        slotViews = GameBoardView.createSlotViews(rows, columns: columns)
        super.init(frame: CGRectZero)
        loadSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func boardSize(viewSize viewSize: CGSize, slotSize: CGSize, spacing: CGFloat) -> (rows: Int, columns: Int) {
        let rows = Int(floor((viewSize.height + spacing) / (slotSize.height + spacing)))
        let columns = Int(floor((viewSize.width + spacing) / (slotSize.width + spacing)))
        return (rows, columns)
    }
    
    // MARK: View
    
    private func loadSubviews() {
        enumerateSlotViewsUsingBlock({ (slotView, _, _) in
            self.addSubview(slotView)
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        enumerateSlotViewsUsingBlock({ (slotView, x, y) in
            var frame = CGRectZero
            frame.size = self.slotSize
            frame.origin.x = CGFloat(x) * (self.slotSize.width + self.spacing) + self.boardHorizontalMargin()
            frame.origin.y = CGFloat(y) * (self.slotSize.height + self.spacing) + self.boardVerticalMargin()
            slotView.frame = frame
        })
    }
    
    private func boardHorizontalMargin() -> CGFloat {
        return (frame.size.width - (self.slotSize.width * CGFloat(columns)) - (spacing * CGFloat(columns - 1))) / 2
    }
    
    private func boardVerticalMargin() -> CGFloat {
        return (frame.size.height - (self.slotSize.height * CGFloat(rows)) - (spacing * CGFloat(rows - 1))) / 2
    }
    
    // MARK: Slots
    
    private let slotViews: [GameBoardSlotViewsArray]
    
    class private func createSlotViews(rows: Int, columns: Int) -> [GameBoardSlotViewsArray] {
        var slotViews: [GameBoardSlotViewsArray] = []
        for _ in 0...(rows-1) {
            var column: GameBoardSlotViewsArray = []
            for _ in 0...(columns-1) {
                column.append(GameBoardSlotView())
            }
            slotViews.append(column)
        }
        return slotViews
    }
    
    typealias EnumerateSlotViewsBlock = (slotView: GameBoardSlotView, x: Int, y: Int) -> Void
    
    func enumerateSlotViewsUsingBlock(block: EnumerateSlotViewsBlock) {
        for y in 0...(rows-1) {
            for x in 0...(columns-1) {
                block(slotView: slotViews[y][x], x: x, y: y)
            }
        }
    }
    
    func slotViewAtPosition(x: Int, y: Int) -> GameBoardSlotView {
        return slotViews[y][x]
    }
    
    func circleViewAtPoint(point: CGPoint) -> CircleView? {
        let circleViews = allSlotViews.nonEmptySlotViews.map { $0.circleView! }
        for circleView in circleViews {
            let frame = circleView.convertRect(circleView.bounds, toView: self)
            if CGRectContainsPoint(frame, point) {
                return circleView
            }
        }
        return nil
    }
    
    var allSlotViews: GameBoardSlotViewsArray {
        var array: GameBoardSlotViewsArray = []
        for column in slotViews {
            for slotView in column {
                array.append(slotView)
            }
        }
        return array
    }
    
    func slotViewForCircleView(circleView: CircleView) -> GameBoardSlotView? {
        return allSlotViews.filter({ $0.circleView == circleView }).first
    }
    
    // MARK: Touch handling
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.locationInView(self)
        guard let circleView = circleViewAtPoint(location) else { return }
        let dragger = CircleViewDragger(view: circleView, touch: touch)
        dragger.view.removeFromSuperview()
        var frame = dragger.view.frame
        frame.origin = CGPoint(x: location.x - frame.width / 2, y: location.y - frame.height / 2)
        dragger.view.frame = frame
        addSubview(dragger.view)
        draggers.append(dragger)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let dragger = draggerForTouch(touch) else { return }
        let location = touch.locationInView(self)
        var frame = dragger.view.frame
        frame.origin = CGPoint(x: location.x - frame.width / 2, y: location.y - frame.height / 2)
        dragger.view.frame = frame
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let dragger = draggerForTouch(touch) else { return }
        guard let slotView = slotViewForCircleView(dragger.view) else { return }
        UIView.animateWithDuration(0.2,
            animations: { () -> Void in
                var frame = dragger.view.frame
                frame.origin = CGPoint(x: slotView.center.x - frame.width / 2, y: slotView.center.y - frame.height / 2)
                dragger.view.frame = frame
                dragger.view.addBounceAnimation()
            },
            completion: { (finished) -> Void in
                dragger.view.removeFromSuperview()
                var frame = dragger.view.frame
                frame.origin = CGPoint(x: (slotView.frame.width - frame.width) / 2, y: (slotView.frame.height - frame.height) / 2)
                dragger.view.frame = frame
                slotView.addSubview(dragger.view)
                self.draggers = self.draggers.filter { $0.touch != dragger.touch }
            }
        )
    }
    
    private var draggers = [CircleViewDragger]()
    
    private func draggerForTouch(touch: UITouch) -> CircleViewDragger? {
        return draggers.filter({ $0.touch == touch }).first
    }
    
}
