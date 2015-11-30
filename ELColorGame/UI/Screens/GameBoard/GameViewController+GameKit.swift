//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation
import GameKit

extension GameViewController {
    
    func synchronizeHighestScore() {
        if GKLocalPlayer.localPlayer().authenticated {
            let score = GKScore(leaderboardIdentifier: "drag_and_drop_color_leaderboard_01")
            score.value = Int64(0) // TODO: set score
            GKScore.reportScores([score], withCompletionHandler: { (error) -> Void in
                if error != nil {
                    print("error")
                }
            })
        }
    }
    
}
