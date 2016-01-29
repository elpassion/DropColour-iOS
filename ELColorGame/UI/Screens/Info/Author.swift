//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

public enum AuthorType: String {
    case Developer = "Developer"
    case Designer = "Designer"
}

struct Author {

    let name: String
    let surname: String
    let type: AuthorType
    let avatar: NSURL
    let proffesionUrl: NSURL
    let twitterUrl: NSURL

}

extension Author {
    func loginFromUrl(url: NSURL) -> String {
        let urlString = url.absoluteString
        let login = urlString.componentsSeparatedByString("/").last
        return login ?? ""
    }
}
