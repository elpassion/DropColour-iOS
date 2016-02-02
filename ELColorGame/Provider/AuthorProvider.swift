//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol AuthorProviding {
    var authors: [Author] { get }
}

class AuthorProvider: AuthorProviding {

    let authors = [
        Author(
            name: "Mateusz",
            surname: "Szklarek",
            type: AuthorType.Developer,
            avatarUrl: NSURL(string: "ms"),
            professionUrl: NSURL(string: "https://github.com/mateuszszklarek"),
            twitterUrl: NSURL(string: "https://twitter.com/SzklarekMateusz")
        ),
        Author(
            name: "Dariusz",
            surname: "Rybicki",
            type: AuthorType.Developer,
            avatarUrl: NSURL(string: "dr"),
            professionUrl: NSURL(string: "https://github.com/darrarski"),
            twitterUrl: NSURL(string: "https://twitter.com/darrarski")
        ),
        Author(
            name: "Dawid",
            surname: "Dapszus",
            type: AuthorType.Designer,
            avatarUrl: NSURL(string: "dd"),
            professionUrl: NSURL(string: "https://dribbble.com/dashoo"),
            twitterUrl: NSURL(string: "https://twitter.com/dapszus")
        )
    ]

}
