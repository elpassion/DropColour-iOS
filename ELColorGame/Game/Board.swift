//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class Board {
    
    let size: BoardSize
    weak var delegate: BoardDelegate?
    
    init(size: BoardSize) {
        self.size = size
        _slots = Board.createSlots(size, slotDelegate: self)
    }
    
    // MARK: Slots
    
    private class func createSlots(size: BoardSize, slotDelegate: SlotDelegate?) -> [Slot] {
        var slots = [Slot]()
        for column in 0..<size.columns {
            for row in 0..<size.rows {
                let location = SlotLocation(column: column, row: row)
                let slot = Slot(location: location, delegate: slotDelegate)
                slots.append(slot)
            }
        }
        return slots
    }
    
    private var _slots: [Slot]?
    
    var slots: [Slot] {
        return _slots ?? []
    }

    var emptySlots: [Slot] {
        return slots.filter { $0.isEmpty }
    }
    
    var nonEmptySlots: [Slot] {
        return slots.filter { !$0.isEmpty }
    }
    
    var emptyLocations: [SlotLocation] {
        return emptySlots.map { $0.location }
    }
    
    var nonEmptyLocations: [SlotLocation] {
        return nonEmptySlots.map { $0.location }
    }
    
    func slot(atLocation location: SlotLocation) -> Slot? {
        guard location.column < size.columns else { return nil }
        guard location.row < size.rows else { return nil }
        return slots.filter({ $0.location == location }).first
    }
    
    func slot(forCircle circle: Circle) -> Slot? {
        return slots.filter({ $0.circle === circle }).first
    }
    
    // MARK: Circles
    
    func circle(atLocation location: SlotLocation) -> Circle? {
        return slot(atLocation: location)?.circle
    }
    
    func canMoveCircle(from from: SlotLocation, to: SlotLocation) -> Bool {
        guard from != to else { return false }
        guard let movingCircle = circle(atLocation: from) else { return false }
        guard let targetCircle = circle(atLocation: to) else { return false }
        return movingCircle.type == targetCircle.type
    }
    
    func moveCircle(from from: SlotLocation, to: SlotLocation) {
        guard canMoveCircle(from: from, to: to) else { return }
        slot(atLocation: from)?.circle = nil
        slot(atLocation: to)?.circle = nil
    }
    
}
