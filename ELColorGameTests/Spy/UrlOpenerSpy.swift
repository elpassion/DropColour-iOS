//
// Created by Mateusz Szklarek on 14/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class UrlOpenerSpy: UrlOpening {

    private(set) var urlWasOpened = false

    // MARK: UrlOpening

    func open(url: URL) -> Bool {
        urlWasOpened = true
        return true
    }

    func canOpen(url: URL?) -> Bool {
        guard url != nil else { return false }
        return true
    }

}
