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
    let slotSize = CGSize(width: 44, height: 44)
    
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
        let horizontalSpacing = columns > 1 ? (bounds.size.width - (slotSize.width * CGFloat(columns))) / (CGFloat(columns) - 1) : CGFloat(0)
        let verticalSpacing = rows > 1 ? (bounds.size.height - (slotSize.height * CGFloat(rows))) / (CGFloat(rows) - 1) : CGFloat(0)
        let spacing = max(min(horizontalSpacing, verticalSpacing), 16.0)
        let horizontalMargin = (frame.size.width - (self.slotSize.width * CGFloat(columns)) - (spacing * CGFloat(columns - 1))) / 2
        let verticalMargin = (frame.size.height - (self.slotSize.height * CGFloat(rows)) - (spacing * CGFloat(rows - 1))) / 2
        enumerateSlotViewsUsingBlock({ (slotView, x, y) in
            var frame = CGRectZero
            frame.size = self.slotSize
            frame.origin.x = CGFloat(x) * (self.slotSize.width + spacing) + horizontalMargin
            frame.origin.y = CGFloat(y) * (self.slotSize.height + spacing) + verticalMargin
            slotView.frame = frame
        })
    }
    
    // MARK: Slots
    
    private let slotViews: [[GameBoardSlotView]]
    
    class private func createSlotViews(rows: Int, columns: Int) -> [[GameBoardSlotView]] {
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
    
}
