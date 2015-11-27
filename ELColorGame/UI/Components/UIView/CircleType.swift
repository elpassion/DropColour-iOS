//
//  CircleType.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation
import UIKit

protocol _CircleType {}

struct CircleType: _CircleType {
    
    let color: UIColor
    
}

let CircleTypeRed = CircleType(color: UIColor.redColor())
let CircleTypeGreen = CircleType(color: UIColor.greenColor())
let CircleTypeBlue = CircleType(color: UIColor.blueColor())

let CircleTypes = [
    CircleTypeRed,
    CircleTypeGreen,
    CircleTypeBlue
]

extension Array where Element: _CircleType {

    var randomType: Element? {
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
}
