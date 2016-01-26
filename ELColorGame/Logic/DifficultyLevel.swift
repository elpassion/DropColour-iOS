//
// Created by Mateusz Szklarek on 22/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

class DifficultyLevel {
    
    typealias ScoreDidChange = () -> (Int)
    var scoreDidChange: ScoreDidChange?
    
    private let extraTime = 0.2
    private(set) var calculatedSingleActionPoints = 10

    private var numberOfLevel = 0
    private var intervalTime = 0.75
    private var scoreNumber: Int = 0

    func calculatedIntervalTime(score: Int) -> Double {
        guard let gameScore = scoreDidChange?() else { return intervalTime }
        guard scoreNumber != gameScore else { return intervalTime }
        scoreNumber = gameScore
        guard scoreNumber % 100 == 0 && scoreNumber != 0 else { return intervalTime }
        intervalTime = intervalTime * 0.85
        calculatedSingleActionPoints = calculatedSingleActionPoints * 2
        addExtraTimeAfterEveryThousandPoints(scoreNumber)
        return intervalTime
    }

    // MARK: Helpers
    
    private func addExtraTimeAfterEveryThousandPoints(score: Int) {
        guard score / 1000 > numberOfLevel else { return }
        intervalTime += extraTime
        numberOfLevel++
        resetSingleActionPoints()
    }

    private func resetSingleActionPoints() {
        calculatedSingleActionPoints = 10
    }

}
