//
// Created by Mateusz Szklarek on 11/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol GameBoardViewDelegate: class {

    func gameBoardViewCanMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation) -> Bool
    func gameBoardViewMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation)

}
