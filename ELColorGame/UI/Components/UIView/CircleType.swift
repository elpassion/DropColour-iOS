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
    
    let topColor: UIColor
    let bottomColor: UIColor
    
}

let CircleTypePurple = CircleType(topColor: UIColor(hex: "#C86DD7"), bottomColor: UIColor(hex: "#906DD7"))
let CircleTypeBlue = CircleType(topColor: UIColor(hex: "#00C7FF"), bottomColor: UIColor(hex: "#0076FF"))
let CircleTypeOrange = CircleType(topColor: UIColor(hex: "#FAD961"), bottomColor: UIColor(hex: "#F7821C"))
let CircleTypeRed = CircleType(topColor: UIColor(hex: "#E92578"), bottomColor: UIColor(hex: "#E9253D"))
let CircleTypeTurquoise = CircleType(topColor: UIColor(hex: "#3CFFB7"), bottomColor: UIColor(hex: "#50CFE3"))
let CircleTypeGreen = CircleType(topColor: UIColor(hex: "#A5E01A"), bottomColor: UIColor(hex: "#32E01A"))

let CircleTypes = [
    CircleTypePurple,
    CircleTypeBlue,
    CircleTypeOrange,
    CircleTypeRed,
    CircleTypeTurquoise,
    CircleTypeGreen
]

extension Array where Element: _CircleType {

    var randomType: Element? {
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
}
