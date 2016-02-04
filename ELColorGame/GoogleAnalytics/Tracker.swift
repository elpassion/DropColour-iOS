//
// Created by Mateusz Szklarek on 04/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

class Tracker {

    let gaiTracker: GAITracker
    
    init(gaiTracker: GAITracker) {
        self.gaiTracker = gaiTracker
    }
    
    func trackScreenWithName(screenName name: String) {
        gaiTracker.set(kGAIScreenName, value: name)
        gaiTracker.send(GAIDictionaryBuilder.createScreenView().build() as [NSObject : AnyObject])
    }

}
