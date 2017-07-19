import Foundation

protocol GameBoardViewDelegate: class {

    func gameBoardViewCanMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation) -> Bool
    func gameBoardViewMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation)

}
