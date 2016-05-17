//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameBoardView: UIView {

    weak var delegate: GameBoardViewDelegate?

    let rows: Int
    let columns: Int
    let slotSize: CGSize
    let spacing: CGFloat

    init(slotSize: CGSize, rows: Int, columns: Int, spacing: CGFloat) {
        self.slotSize = slotSize
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
        slotViews = GameBoardView.createSlotViews(rows: rows, columns: columns)
        super.init(frame: CGRectZero)
        loadSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private func loadSubviews() {
        for slotView in slotViews {
            addSubview(slotView)
        }
    }

    // MARK: Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        for slotView in slotViews {
            var frame = CGRectZero
            frame.size = slotSize
            frame.origin.x = CGFloat(slotView.column) * (slotSize.width + spacing) + boardHorizontalMargin()
            frame.origin.y = CGFloat(slotView.row) * (slotSize.height + spacing) + boardVerticalMargin()
            slotView.frame = frame
        }
    }

    private func boardHorizontalMargin() -> CGFloat {
        return (frame.size.width - (slotSize.width * CGFloat(columns)) - (spacing * CGFloat(columns - 1))) / 2
    }

    private func boardVerticalMargin() -> CGFloat {
        return (frame.size.height - (slotSize.height * CGFloat(rows)) - (spacing * CGFloat(rows - 1))) / 2
    }

    // MARK: Components

    let slotViews: [GameBoardSlotView]

    var draggers = [CircleViewDragger]()

}
