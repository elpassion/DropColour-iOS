//
// Created by Mateusz Szklarek on 22/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class DifficultyLevel {

    private let initialTimeInterval: NSTimeInterval = 0.75
    private let pointsTimeChanges: Double = 2000
    private let initialValueForNextLevel: Double = 0.85
    private let difficlutyRatio: Double = 2500
    
    typealias ScoreClosure = () -> Int
    
    var scoreClosure: ScoreClosure?
    
    func intervalTime() -> NSTimeInterval {
        let floorFromScore = floor(Double(score) / pointsTimeChanges) * pointsTimeChanges
        return initialTimeInterval / (1 + ( (Double(score) - (floorFromScore * initialValueForNextLevel)) / difficlutyRatio ))
    }
    
    func actionPoints() -> Int {
        return 10
    }
    
    private var score: Int {
        guard let score = scoreClosure?() else { return 0 }
        return score
    }

}
