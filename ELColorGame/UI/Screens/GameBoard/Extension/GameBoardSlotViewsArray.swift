//
//  GameBoardSlotViewsArray.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

typealias GameBoardSlotViewsArray = [GameBoardSlotView]

extension Array where Element: GameBoardSlotView {

    var emptySlotViews: GameBoardSlotViewsArray {
        return filter { (slotView) -> Bool in
            return slotView.circleView == nil
        }
    }
    
    var randomSlotView: Element? {
        guard count > 0 else { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
}
