import Foundation
import GameAnalytics

extension GameViewController {

    func gameAnalyticsStartEvent() {
        GameAnalytics.addProgressionEvent(with: GAProgressionStatusStart, progression01: "New game", progression02: nil, progression03: nil)
    }

    func gameAnalyticsCompleteEventWithScore(_ score: Int) {
        GameAnalytics.addProgressionEvent(with: GAProgressionStatusComplete, progression01: "Complete game", progression02: nil, progression03: nil, score: score)
    }

}
