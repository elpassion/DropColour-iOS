//
// Created by Mateusz Szklarek on 22/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class DifficultyLevel {

    private let initialTimeInterval: NSTimeInterval = 0.75
    private let scorePerLevel: Double = 200
    private let minTimeIntervalRatio: Double = 200
    private let maxTimeIntervalRatio: Double = 800

    var scoreClosure: (() -> Int)?

    func intervalTime() -> NSTimeInterval {
        let min = minInterval(forScore: currentScore)
        let max = maxInterval(forScore: currentScore)
        return max - (max - min) * currentLevelProgress
    }

    func actionPoints() -> Int {
        return 10
    }

    private var currentScore: Int {
        guard let score = scoreClosure?() else { return 0 }
        return score
    }

    private func minInterval(forScore score: Int) -> Double {
        return initialTimeInterval / (1 + (Double(score) / minTimeIntervalRatio))
    }

    private func maxInterval(forScore score: Int) -> Double {
        return initialTimeInterval / (1 + (Double(score) / maxTimeIntervalRatio))
    }

    private var currentLevelProgress: Double {
        return (Double(currentScore) % scorePerLevel) / scorePerLevel
    }

}
