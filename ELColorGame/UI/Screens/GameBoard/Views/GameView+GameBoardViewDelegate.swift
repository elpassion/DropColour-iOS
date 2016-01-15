//
// Created by Mateusz Szklarek on 15/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

extension GameView: GameBoardViewDelegate {

    func gameBoardViewCanMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation) -> Bool {
        guard let delegate = delegate else { return false }
        return delegate.gameViewCanMoveCircle(fromLocation: from, toLocation: toLocation)
    }

    func gameBoardViewMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation) {
        delegate?.gameViewMoveCircle(fromLocation: from, toLocation: toLocation)
    }

}
