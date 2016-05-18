import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class MenuViewControllerSpec: QuickSpec {

    override func spec() {

        describe("MenuViewController") {

            var sut: MenuViewController!
            var trackerSpy: TrackerSpy!

            beforeEach {
                trackerSpy = TrackerSpy(gaiTracker: GAITrackerSpy())
                sut = MenuViewController(delegate: nil, tracker: trackerSpy)
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
