//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation
import GameKit

let leaderboardIdentifier = "drop_colour_leaderboard"

extension GameViewController {

    func synchronizeHighestScore() {
        guard GKLocalPlayer.localPlayer().authenticated else { return }
        let score = GKScore(leaderboardIdentifier: leaderboardIdentifier)
        guard let game = game else { return }
        score.value = Int64(game.scoreNumber)
        GKScore.reportScores([score], withCompletionHandler: { (error) -> Void in
            if error != nil {
                print("error")
            }
        })
    }

}
