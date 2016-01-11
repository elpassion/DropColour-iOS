//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class Timer: NSObject {
    
    typealias Action = () -> ()
    let action: Action
    
    init(interval: NSTimeInterval, action: Action) {
        self.action = action
        super.init()
        timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "timerTick", userInfo: nil, repeats: true)
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
    
}
