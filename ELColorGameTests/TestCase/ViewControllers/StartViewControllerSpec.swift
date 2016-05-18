import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class StartViewControllerSpec: QuickSpec {

    override func spec() {

        describe("StartViewController") {

            var sut: StartViewController!
            var trackerSpy: TrackerSpy!

            beforeEach {
                trackerSpy = TrackerSpy(gaiTracker: GAITrackerSpy())
                sut = StartViewController(tracker: trackerSpy)
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
