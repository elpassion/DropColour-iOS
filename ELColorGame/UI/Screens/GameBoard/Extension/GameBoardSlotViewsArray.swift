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
        return filter { $0.circleView == nil }
    }

    var nonEmptySlotViews: GameBoardSlotViewsArray {
        return filter { $0.circleView != nil }
    }

    var randomSlotView: Element? {
        guard count > 0 else { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }

    func findFirstMatching<included: BooleanType>(predicate: Element -> included) -> Element? {
        for item in self {
            if predicate(item) {
                return item
            }
        }
        return nil
    }

}
