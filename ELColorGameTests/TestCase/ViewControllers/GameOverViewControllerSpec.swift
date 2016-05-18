import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class GameOverViewControllerSpec: QuickSpec {

    override func spec() {

        describe("GameOverViewController") {

            var sut: GameOverViewController!
            var trackerSpy: TrackerSpy!

            beforeEach {
                trackerSpy = TrackerSpy(gaiTracker: GAITrackerSpy())
                sut = GameOverViewController(score: 93, delegate: nil, tracker: trackerSpy)
            }

            afterEach {
                trackerSpy = nil
                sut = nil
            }

            it("should be initialized") {
                expect(sut).notTo(beNil())
                expect(trackerSpy.screenWasTracked).to(beFalse())
            }

            describe("viewWillAppear") {
                it("should send data") {
                    sut.viewWillAppear(false)
                    expect(trackerSpy.screenWasTracked).to(beTrue())
                }
            }
        }
    }

}
