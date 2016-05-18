import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class TrackerSpec: QuickSpec {

    override func spec() {

        describe("Tracker") {

            var sut: Tracker!
            var gaiTrackerSpy: GAITrackerSpy!

            beforeEach {
                gaiTrackerSpy = GAITrackerSpy()
                sut = Tracker(gaiTracker: gaiTrackerSpy)
                sut.gaiDictionaryFactory = GAIDictionaryFactoryFake()
            }

            afterEach {
                sut = nil
            }

            it("should be initialized") {
                expect(sut).notTo(beNil())
            }

            describe("initially") {
                it("data shouldn't be sent") {
                    expect(gaiTrackerSpy.dataWasSend).to(beFalse())
                }

                it("parameter shouldn't be sent") {
                    expect(gaiTrackerSpy.parameterNameWasSet).to(beFalse())
                }
            }

            describe("track screen") {
                beforeEach {
                    sut.trackScreenWithName(screenName: "screen-name")
                }

                it("should send data") {
                    expect(gaiTrackerSpy.dataWasSend).to(beTrue())
                }

                it("should set parameter") {
                    expect(gaiTrackerSpy.parameterNameWasSet).to(beTrue())
                }
            }

            describe("track start event") {
                it("should send data") {
                    sut.trackGameStartEvent()
                    expect(gaiTrackerSpy.dataWasSend).to(beTrue())
                }
            }

            describe("track event end") {
                it("should send data with score") {
                    sut.trackGameEndEvent(score: 46)
                    expect(gaiTrackerSpy.dataWasSend).to(beTrue())
                    expect(gaiTrackerSpy.capturedData["value"] as? NSNumber).to(equal(46))
                }
            }

            describe("track game scored event") {
                it("should send data with score") {
                    sut.trackGameScoredEvent(scoredValue: 73)
                    expect(gaiTrackerSpy.dataWasSend).to(beTrue())
                    expect(gaiTrackerSpy.capturedData["value"] as? NSNumber).to(equal(73))
                }
            }
         }
    }

}
