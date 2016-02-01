//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class AuthorRepository {

    class func firstAuthor() -> Author {
        return Author(
            name: "Mateusz",
            surname: "Szklarek",
            type: AuthorType.Developer,
            avatarUrl: NSURL(string: "ms"),
            professionUrl: NSURL(string: "https://github.com/mateuszszklarek"),
            twitterUrl: NSURL(string: "https://twitter.com/SzklarekMateusz")
        )
    }
    
    class func secondAuthor() -> Author {
        return Author(
            name: "Dariusz",
            surname: "Rybicki",
            type: AuthorType.Developer,
            avatarUrl: NSURL(string: "dr"),
            professionUrl: NSURL(string: "https://github.com/darrarski"),
            twitterUrl: NSURL(string: "https://twitter.com/darrarski")
        )
    }
    
    class func thirdAuthor() -> Author {
        return Author(
            name: "Dawid",
            surname: "Dapszus",
            type: AuthorType.Designer,
            avatarUrl: NSURL(string: "dd"),
            professionUrl: NSURL(string: "https://dribbble.com/dashoo"),
            twitterUrl: NSURL(string: "https://twitter.com/dapszus")
        )
    }

}
