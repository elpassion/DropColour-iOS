import Foundation

protocol TrackerProtocol {
    var gaiDictionaryFactory: GAIDictionaryCreating { get set }
    func trackScreenWithName(screenName name: String)
    func trackGameStartEvent()
    func trackGameEndEvent(score: Int)
    func trackGameScoredEvent(scoredValue value: Int)
}

class Tracker: TrackerProtocol {

    var gaiDictionaryFactory: GAIDictionaryCreating
    private let gaiTracker: GAITracker

    init(gaiTracker: GAITracker) {
        self.gaiTracker = gaiTracker
        self.gaiDictionaryFactory = GAIDictionaryFactory()
    }

    func trackScreenWithName(screenName name: String) {
        gaiTracker.set(kGAIScreenName, value: name)
        gaiTracker.send(GAIDictionaryBuilder.createScreenView().buildDict())
    }

    func trackGameStartEvent() {
        let params = createEvent(withCategory: "event", action: "dropcolour.event.game-start")
        gaiTracker.send(params)
    }

    func trackGameEndEvent(score: Int) {
        let params = createEvent(withCategory: "event", action: "dropcolour.event.game-end", value: score)
        gaiTracker.send(params)
    }

    func trackGameScoredEvent(scoredValue value: Int) {
        let params = createEvent(withCategory: "event", action: "dropcolour.event.game-scored", value: value)
        gaiTracker.send(params)
    }

    private func createEvent(withCategory category: String, action: String, value: Int? = nil) -> [AnyHashable: Any] {
        return gaiDictionaryFactory.createEvent(withCategory: category, action: action, value: value?.number)
    }

}

private extension Int {

    var number: NSNumber {
        return NSNumber(value: self)
    }

}
