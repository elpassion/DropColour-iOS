//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol GAIDictionaryCreating {
    func createEventWithCategory(category: String, action: String, value: NSNumber?) -> [NSObject: AnyObject]
}

class GAIDictionaryFactory: GAIDictionaryCreating {

    func createEventWithCategory(category: String, action: String, value: NSNumber?) -> [NSObject: AnyObject] {
        return GAIDictionaryBuilder.createEventWithCategory(category, action: action, label: nil, value: value)
            .build() as [NSObject: AnyObject]
    }

}
