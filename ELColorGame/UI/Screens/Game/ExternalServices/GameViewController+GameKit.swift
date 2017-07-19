import Foundation
import GameKit

let leaderboardIdentifier = "drop_colour_leaderboard"

extension GameViewController {

    func synchronizeHighestScore() {
        guard GKLocalPlayer.localPlayer().isAuthenticated else { return }
        let score = GKScore(leaderboardIdentifier: leaderboardIdentifier)
        guard let game = game else { return }
        score.value = Int64(game.scoreNumber)
        GKScore.report([score], withCompletionHandler: nil)
    }

}
