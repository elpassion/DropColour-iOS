//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol GAIDictionaryCreating {
    func createEventWithCategory(_ category: String, action: String, value: NSNumber?) -> [AnyHashable: Any]
}

class GAIDictionaryFactory: GAIDictionaryCreating {

    func createEventWithCategory(_ category: String, action: String, value: NSNumber?) -> [AnyHashable: Any] {
        return GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: nil, value: value).buildDict()
    }

}
