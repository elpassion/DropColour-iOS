//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class FakeAuthorRepository {

    var authorWithDeveloperType: Author {
        return Author(
                name: "John",
                surname: "Apple",
                type: .Developer,
                avatarUrl: NSURL(string: "www.google.pl/avatar"),
                proffesionUrl: NSURL(string: "www.github.com/johnapple"),
                twitterUrl: NSURL(string: "www.twitter.com/johnapple")
        )
    }

}

extension Author {
    func copyWithType(type: AuthorType) -> Author {
        return Author(
                name: self.name,
                surname: self.surname,
                type: type,
                avatarUrl: self.avatarUrl,
                proffesionUrl: self.proffesionUrl,
                twitterUrl: self.twitterUrl
        )
    }

    func copyWithoutUrls() -> Author {
        return Author(
                name: self.name,
                surname: self.surname,
                type: type,
                avatarUrl: nil,
                proffesionUrl: nil,
                twitterUrl: nil
        )
    }

    func copyWithProffessionUrl(url: NSURL) -> Author {
        return Author(
                name: self.name,
                surname: self.surname,
                type: self.type,
                avatarUrl: nil,
                proffesionUrl: url,
                twitterUrl: nil
        )
    }

}
