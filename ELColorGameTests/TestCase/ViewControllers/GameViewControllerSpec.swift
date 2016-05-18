import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class GameViewControllerSpec: QuickSpec {

    override func spec() {

        describe("GameViewController") {

            var sut: GameViewController!
            var trackerSpy: TrackerSpy!

            beforeEach {
                trackerSpy = TrackerSpy(gaiTracker: GAITrackerSpy())
                sut = GameViewController(tracker: trackerSpy)
            }

            afterEach {
                trackerSpy = nil
                sut = nil
            }

            describe("initially state") {
                it("should be initialized") {
                    expect(sut).notTo(beNil())
                    expect(trackerSpy.screenWasTracked).to(beFalse())
                    expect(trackerSpy.startEventWasTracked).to(beFalse())
                }
            }

            describe("viewWillAppear") {

                it("should send data") {
                    sut.viewWillAppear(false)
                    expect(trackerSpy.screenWasTracked).to(beTrue())
                }

                it("should send event start game when game start") {
                    sut.gameDidStart(Game(boardSize: BoardSize(columns: 5, rows: 5)))
                    expect(trackerSpy.startEventWasTracked).to(beTrue())
                }
            }
        }
    }

}
