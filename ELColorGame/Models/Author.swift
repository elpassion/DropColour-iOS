//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

enum AuthorType: String {
    case Developer = "Developer"
    case Designer = "Designer"
}

struct Author {

    let name: String
    let surname: String
    let type: AuthorType
    let avatarUrl: NSURL?
    let professionUrl: NSURL?
    let twitterUrl: NSURL?

}

extension Author {

    var fullName: String {
        return "\(name) \(surname)"
    }

    func loginFromUrl(url: NSURL) -> String? {
        let urlString = url.absoluteString
        guard urlString.containsString("/") else { return nil }
        return urlString.componentsSeparatedByString("/").last
    }

}
