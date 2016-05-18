//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension GameBoardView {

    class func createSlotViews(rows rows: Int, columns: Int) -> [GameBoardSlotView] {
        var views = [GameBoardSlotView]()
        for row in 0...(rows-1) {
            for column in 0...(columns-1) {
                views.append(GameBoardSlotView(column: column, row: row))
            }
        }
        return views
    }

    func slotViewAtLocation(column column: Int, row: Int) -> GameBoardSlotView? {
        return slotViews.filter { $0.column == column && $0.row == row }.first
    }

    func circleViewAtPoint(point: CGPoint) -> CircleView? {
        let circleViews = slotViews.filter { $0.circleView != nil }.map { $0.circleView! }
        for circleView in circleViews {
            let frame = circleView.convertRect(circleView.bounds, toView: self)
            if CGRectContainsPoint(frame, point) {
                return circleView
            }
        }
        return nil
    }

    func slotViewForCircleView(circleView: CircleView) -> GameBoardSlotView? {
        return slotViews.filter { $0.circleView == circleView }.first
    }

    func slotViewsAtRect(rect: CGRect) -> [GameBoardSlotView] {
        var array = [GameBoardSlotView]()
        for slotView in slotViews {
            let frame = slotView.convertRect(slotView.bounds, toView: self)
            if CGRectIntersectsRect(frame, rect) {
                array.append(slotView)
            }
        }
        return array
    }

}
