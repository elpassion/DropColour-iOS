//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension GameBoardView {

    class func createSlotViews(rows: Int, columns: Int) -> [GameBoardSlotView] {
        var views = [GameBoardSlotView]()
        for row in 0...(rows-1) {
            for column in 0...(columns-1) {
                views.append(GameBoardSlotView(column: column, row: row))
            }
        }
        return views
    }

    func slotViewAtLocation(column: Int, row: Int) -> GameBoardSlotView? {
        return slotViews.filter { $0.column == column && $0.row == row }.first
    }

    func circleView(atPoint point: CGPoint) -> CircleView? {
        let circleViews = slotViews.filter { $0.circleView != nil }.map { $0.circleView! }
        for circleView in circleViews {
            let frame = circleView.convert(circleView.bounds, to: self)
            if frame.contains(point) {
                return circleView
            }
        }
        return nil
    }

    func slotView(forCircleView circleView: CircleView) -> GameBoardSlotView? {
        return slotViews.filter { $0.circleView == circleView }.first
    }

    func slotViewsAtRect(_ rect: CGRect) -> [GameBoardSlotView] {
        var array = [GameBoardSlotView]()
        for slotView in slotViews {
            let frame = slotView.convert(slotView.bounds, to: self)
            if frame.intersects(rect) {
                array.append(slotView)
            }
        }
        return array
    }

}
