import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class TrackerSpec: QuickSpec {

    override func spec() {
        describe("InfoViewController") {

            var sut: Tracker!

            beforeEach {
                sut = Tracker(gaiTracker: GAITrackerSpy())
            }

            afterEach {
                sut = nil
            }

            it("should be initialized") {
                expect(sut).notTo(beNil())
            }

        }
    }

}
