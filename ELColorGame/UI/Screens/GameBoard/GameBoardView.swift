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
    
    init(rows: Int, columns: Int) {
        slotViews = GameBoardView.createSlotViews(rows, columns: columns)
        self.rows = rows
        self.columns = columns
        super.init(frame: CGRectZero)
        loadSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View
    
    private func loadSubviews() {
        enumerateSlotViewsUsingBlock({ (slotView, _, _) in
            self.addSubview(slotView)
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let slotSize = CGSizeMake(frame.size.width / CGFloat(rows), frame.size.height / CGFloat(columns))
        enumerateSlotViewsUsingBlock({ (slotView, x, y) in
            var frame = CGRectZero
            frame.size = slotSize
            frame.origin.x = CGFloat(x) * slotSize.width
            frame.origin.y = CGFloat(y) * slotSize.height
            slotView.frame = frame
        })
    }
    
    // MARK: Slots
    
    private let slotViews: [[GameBoardSlotView]]
    
    class private func createSlotViews(rows: Int, columns: Int) -> [[GameBoardSlotView]] {
        var slotViews: [[GameBoardSlotView]] = []
        for _ in 0...rows {
            var column: [GameBoardSlotView] = []
            for _ in 0...columns {
                column.append(GameBoardSlotView())
            }
            slotViews.append(column)
        }
        return slotViews
    }
    
    func enumerateSlotViewsUsingBlock(block: (slotView: GameBoardSlotView, x: Int, y: Int) -> Void) {
        for x in 0...(rows-1) {
            for y in 0...(columns-1) {
                block(slotView: slotViews[x][y], x: x, y: y)
            }
        }
    }
    
    func slotViewAtPosition(x: Int, y: Int) -> GameBoardSlotView {
        return slotViews[x][y]
    }
    
}
