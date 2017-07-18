//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class FakeAuthorProvider: AuthorProviding {

    var authors = [
            Author(
                name: "John",
                surname: "Apple",
                type: .developer,
                avatarUrl: URL(string: "https://google.pl/avatar"),
                professionUrl: URL(string: "https://github.com/johnapple"),
                twitterUrl: URL(string: "https://twitter.com/johnapple")
            )
    ]

}

extension Author {

    func copyWithType(_ type: AuthorType) -> Author {
        return Author(
                name: name,
                surname: surname,
                type: type,
                avatarUrl: avatarUrl,
                professionUrl: professionUrl,
                twitterUrl: twitterUrl
        )
    }

    func copyWithoutUrls() -> Author {
        return Author(
                name: name,
                surname: surname,
                type: type,
                avatarUrl: nil,
                professionUrl: nil,
                twitterUrl: nil
        )
    }

    func copyWithProffessionUrl(_ url: URL?) -> Author {
        return Author(
                name: name,
                surname: surname,
                type: type,
                avatarUrl: avatarUrl,
                professionUrl: url,
                twitterUrl: twitterUrl
        )
    }

}
