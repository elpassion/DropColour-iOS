//
// Created by Mateusz Szklarek on 22/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

class DifficultyLevel {

    private let initialNumberOfLevel = 0
    private let initialIntervalTime = 0.75
    private let initialSingleActionPoints = 10
    private let initialTimeIntervalChangeState = true
    private let extraTime = 0.25

    private var numberOfLevel = 0
    private var intervalTime = 0.75
    private(set) var calculatedSingleActionPoints = 10
    private var timeIntervalShouldBeChanged = true

    func calculatedIntervalTime(score: Int) -> Double {
        if score % 100 == 0 && score != 0 && timeIntervalShouldBeChanged {
            intervalTime = intervalTime * 0.85
            disableTimeIntervalChanged()
            calculatedSingleActionPoints = increasedTwice(calculatedSingleActionPoints)
        }
        addExtraTimeAfterEveryThousandPoints(score)
        return intervalTime
    }

    func enableTimeIntervalChanged() {
        timeIntervalShouldBeChanged = true
    }

    func reset() {
        numberOfLevel = initialNumberOfLevel
        intervalTime = initialIntervalTime
        calculatedSingleActionPoints = initialSingleActionPoints
        timeIntervalShouldBeChanged = initialTimeIntervalChangeState
    }

    // MARK: Helpers
    
    private func addExtraTimeAfterEveryThousandPoints(score: Int) {
        guard score / 1000 > numberOfLevel else { return }
        increaseIntervalTimeWithExtraTime()
        increaseNumberOfLevel()
        resetSingleActionPoints()
    }
    
    private func increasedTwice(number: Int) -> Int {
        return number * 2
    }

    private func increaseNumberOfLevel() {
        numberOfLevel += 1
    }

    private func increaseIntervalTimeWithExtraTime() {
        intervalTime += extraTime
    }

    private func resetSingleActionPoints() {
        calculatedSingleActionPoints = initialSingleActionPoints
    }
    
    private func disableTimeIntervalChanged() {
        timeIntervalShouldBeChanged = false
    }
    
}
