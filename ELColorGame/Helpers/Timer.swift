//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class Timer: NSObject {

    typealias Action = () -> ()
    let action: Action

    var interval: NSTimeInterval? {
        didSet {
            if let interval = interval {
                updateTimeInterval(interval)
            }
        }
    }

    init(interval: NSTimeInterval, action: Action) {
        self.action = action
        self.interval = interval
        super.init()
        timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: #selector(Timer.timerTick), userInfo: nil, repeats: true)
    }

    deinit {
        invalidate()
    }

    func invalidate() {
        timer?.invalidate()
        timer = nil
    }

    private var timer: NSTimer?

    func timerTick() {
        action()
    }

    private func updateTimeInterval(timeInterval: NSTimeInterval) {
        guard let timer = timer else { return }
        timer.fireDate = timer.fireDate.dateByAddingTimeInterval(timeInterval)
    }

}
