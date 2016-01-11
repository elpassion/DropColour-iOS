//
//  CircleViewType.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation
import UIKit

protocol _CircleViewType {
    
    var topColor: UIColor { get }
    var bottomColor: UIColor { get }
    
}

struct CircleViewType: _CircleViewType {

    let topColor: UIColor 
    let bottomColor: UIColor

}

let CircleViewTypePurple = CircleViewType(topColor: UIColor(hex: "#C86DD7"), bottomColor: UIColor(hex: "#906DD7"))
let CircleViewTypeBlue = CircleViewType(topColor: UIColor(hex: "#00C7FF"), bottomColor: UIColor(hex: "#0076FF"))
let CircleViewTypeOrange = CircleViewType(topColor: UIColor(hex: "#FAD961"), bottomColor: UIColor(hex: "#F7821C"))
let CircleViewTypeRed = CircleViewType(topColor: UIColor(hex: "#E92578"), bottomColor: UIColor(hex: "#E9253D"))
let CircleViewTypeTurquoise = CircleViewType(topColor: UIColor(hex: "#3CFFB7"), bottomColor: UIColor(hex: "#50CFE3"))
let CircleViewTypeGreen = CircleViewType(topColor: UIColor(hex: "#A5E01A"), bottomColor: UIColor(hex: "#32E01A"))

let CircleViewTypes = [
    CircleViewTypePurple,
    CircleViewTypeBlue,
    CircleViewTypeOrange,
    CircleViewTypeRed,
    CircleViewTypeTurquoise,
    CircleViewTypeGreen
]

extension Array where Element: _CircleViewType {

    var randomType: Element {
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
}
