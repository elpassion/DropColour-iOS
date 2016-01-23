//
// Created by Mateusz Szklarek on 19/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

extension Array where Element: Slot {

    var emptySlots: [Slot] {
        return filter { $0.isEmpty }
    }

    var nonEmptySlots: [Slot] {
        return filter { !$0.isEmpty }
    }

    var emptyLocations: [SlotLocation] {
        return emptySlots.map { $0.location }
    }

    var nonEmptyLocations: [SlotLocation] {
        return nonEmptySlots.map { $0.location }
    }

}
