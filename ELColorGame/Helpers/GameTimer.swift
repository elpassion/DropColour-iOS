import Foundation

class GameTimer: NSObject {

    typealias Action = () -> Void
    let action: Action

    var interval: TimeInterval? {
        didSet {
            if let interval = interval {
                updateTimeInterval(interval)
            }
        }
    }

    init(interval: TimeInterval, action: @escaping Action) {
        self.interval = interval
        self.action = action
        super.init()
        timer = Timer.scheduledTimer(timeInterval: interval,
                                     target: self,
                                     selector: #selector(GameTimer.timerTick),
                                     userInfo: nil,
                                     repeats: true)
    }

    deinit {
        invalidate()
    }

    func invalidate() {
        timer?.invalidate()
        timer = nil
    }

    func timerTick() {
        action()
    }

    // MARK: Private

    private var timer: Timer?

    private func updateTimeInterval(_ timeInterval: TimeInterval) {
        guard let timer = timer else { return }
        timer.fireDate = timer.fireDate.addingTimeInterval(timeInterval)
    }

}
