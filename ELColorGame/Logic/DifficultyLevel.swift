//
// Created by Mateusz Szklarek on 22/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class DifficultyLevel {
    
    typealias ScoreClosure = () -> Int
    
    var scoreClosure: ScoreClosure?
    
    func intervalTime() -> NSTimeInterval {
        return 0.75 / (1 + (Double(score) / 3600))
    }
    
    func actionPoints() -> Int {
        return 10
    }
    
    private var score: Int {
        guard let score = scoreClosure?() else { return 0 }
        return score
    }

}
