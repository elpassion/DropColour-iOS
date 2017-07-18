//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class GAIDictionaryFactoryFake: GAIDictionaryCreating {

    func createEventWithCategory(_ category: String, action: String, value: NSNumber?) -> [AnyHashable: Any] {
        return [
            "category": category,
            "action": action,
            "value": value ?? 0
        ]
    }

}
