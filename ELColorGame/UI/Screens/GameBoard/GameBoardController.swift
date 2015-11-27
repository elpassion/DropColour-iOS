//
//  GameBoardController.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class GameBoardController {
    
    let view: GameBoardView
    
    init(view: GameBoardView) {
        self.view = view
    }
    
    func insertCircle() {
        guard let slot = view.allSlotViews.emptySlotViews.randomSlotView else { return }
        slot.circleView = CircleView()
    }
    
}
