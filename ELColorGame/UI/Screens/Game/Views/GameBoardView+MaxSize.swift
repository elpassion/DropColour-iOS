import UIKit

extension GameBoardView {

    class func maxBoardSize(forViewSize viewSize: CGSize,
                            slotSize: CGSize,
                            spacing: CGFloat) -> (rows: Int, columns: Int) {
        let rows = Int(floor((viewSize.height + spacing) / (slotSize.height + spacing)))
        let columns = Int(floor((viewSize.width + spacing) / (slotSize.width + spacing)))
        return (rows, columns)
    }

}
