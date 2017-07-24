import Foundation

class DifficultyLevel {

    var scoreClosure: (() -> Int)?

    func intervalTime() -> TimeInterval {
        let min = minInterval(forScore: currentScore)
        let max = maxInterval(forScore: currentScore)
        return max - (max - min) * currentLevelProgress
    }

    func actionPoints() -> Int {
        return 10
    }

    // MARK: Private

    private let initialTimeInterval: TimeInterval = 0.75
    private let scorePerLevel: Double = 200
    private let minTimeIntervalRatio: Double = 200
    private let maxTimeIntervalRatio: Double = 800

    private var currentScore: Int {
        return scoreClosure?() ?? 0
    }

    private func minInterval(forScore score: Int) -> Double {
        return initialTimeInterval / (1 + (Double(score) / minTimeIntervalRatio))
    }

    private func maxInterval(forScore score: Int) -> Double {
        return initialTimeInterval / (1 + (Double(score) / maxTimeIntervalRatio))
    }

    private var currentLevelProgress: Double {
        return Double(currentScore).truncatingRemainder(dividingBy: scorePerLevel) / scorePerLevel
    }

}
