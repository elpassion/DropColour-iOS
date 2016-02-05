//
// Created by Mateusz Szklarek on 22/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class DifficultyLevel {

    private let initialTimeInterval: NSTimeInterval = 0.75
    private let pointsTimeChanges: Double = 200
    private let minTimeIntervalRatio: Double = 200
    private let maxTimeIntervalRatio: Double = 800

    var scoreClosure: (() -> Int)?

    func intervalTime() -> NSTimeInterval {
        let minInterval = initialTimeInterval / (1 + (score / minTimeIntervalRatio))
        let maxInterval = initialTimeInterval / (1 + (score / maxTimeIntervalRatio))
        let interval = maxInterval - (maxInterval - minInterval) * (score % pointsTimeChanges) / pointsTimeChanges
        return interval
    }
    
    func actionPoints() -> Int {
        return 10
    }
    
    private var score: Double {
        guard let score = scoreClosure?() else { return 0 }
        return Double(score)
    }

}
