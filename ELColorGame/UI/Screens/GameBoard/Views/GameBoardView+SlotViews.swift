//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension GameBoardView {
    
    class func createSlotViews(rows rows: Int, columns: Int) -> [[GameBoardSlotView]] {
        var slotViews: [[GameBoardSlotView]] = []
        for _ in 0...(rows-1) {
            var column: [GameBoardSlotView] = []
            for _ in 0...(columns-1) {
                column.append(GameBoardSlotView())
            }
            slotViews.append(column)
        }
        return slotViews
    }
    
    typealias EnumerateSlotViewsBlock = (slotView: GameBoardSlotView, row: Int, column: Int) -> Void
    
    func enumerateSlotViewsUsingBlock(block: EnumerateSlotViewsBlock) {
        for row in 0...(rows-1) {
            for column in 0...(columns-1) {
                block(slotView: slotViews[row][column], row: row, column: column)
            }
        }
    }
    
    func slotViewAtPosition(row row: Int, column: Int) -> GameBoardSlotView {
        return slotViews[row][column]
    }
    
    func circleViewAtPoint(point: CGPoint) -> CircleView? {
        let circleViews = nonEmptySlotViews.map { $0.circleView! }
        for circleView in circleViews {
            let frame = circleView.convertRect(circleView.bounds, toView: self)
            if CGRectContainsPoint(frame, point) {
                return circleView
            }
        }
        return nil
    }
    
    var allSlotViews: [GameBoardSlotView] {
        var array = [GameBoardSlotView]()
        for column in slotViews {
            for slotView in column {
                array.append(slotView)
            }
        }
        return array
    }
    
    var emptySlotViews: [GameBoardSlotView] {
        return allSlotViews.filter { $0.circleView == nil }
    }
    
    var nonEmptySlotViews: [GameBoardSlotView] {
        return allSlotViews.filter { $0.circleView != nil }
    }
    
    func slotViewForCircleView(circleView: CircleView) -> GameBoardSlotView? {
        return allSlotViews.filter({ $0.circleView == circleView }).first
    }
    
}
