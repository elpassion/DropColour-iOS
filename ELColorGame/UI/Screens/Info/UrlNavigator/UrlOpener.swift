//
// Created by Mateusz Szklarek on 14/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol UrlOpening {
    func openURL(url: NSURL) -> Bool
    func canOpenURL(url: NSURL?) -> Bool
}

class UrlOpener: UrlOpening {

    func openURL(url: NSURL) -> Bool {
        guard UIApplication.sharedApplication().canOpenURL(url) else { return false }
        return UIApplication.sharedApplication().openURL(url)
    }

    func canOpenURL(url: NSURL?) -> Bool {
        guard let url = url else { return false }
        return UIApplication.sharedApplication().canOpenURL(url)
    }

}
