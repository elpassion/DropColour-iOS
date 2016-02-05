import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class InfoViewControllerSpec: QuickSpec {

    override func spec() {

        describe("InfoViewController") {

            var sut: InfoViewController!

            var spyPresenter: ViewControllerPresenterSpy!
            var infoView: InfoView!

            var trackerSpy: TrackerSpy!

            beforeEach {
                trackerSpy = TrackerSpy(gaiTracker: GAITrackerSpy())
                spyPresenter = ViewControllerPresenterSpy()
                sut = InfoViewController(tracker: trackerSpy)
                sut.viewControllerPresenter = spyPresenter
                infoView = sut.view as! InfoView
            }

            afterEach {
                trackerSpy = nil
                spyPresenter = nil
                sut = nil
                infoView = nil
            }

            it("should be initialized") {
                expect(sut).notTo(beNil())
                expect(trackerSpy.screenWasTracked).to(beFalse())
            }

            it("should have InfoView") {
                expect(infoView).notTo(beNil())
            }

            describe("viewWillAppear") {
                it("should send data") {
                    sut.viewWillAppear(false)
                    expect(trackerSpy.screenWasTracked).to(beTrue())
                }
            }

            describe("tap on quit") {
                it("should be dismissed") {
                    sut.infoViewDidTapQuit()
                    expect(spyPresenter.capturedDismissedViewController).to(beAKindOf(InfoViewController))
                }
            }

            describe("tap on author") {

                context("with type .Developer") {

                    context("with 1 correct url") {
                        it("should present alert") {
                            sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithProffessionUrl(nil))
                            expect(spyPresenter.capturedPresentedViewController as? UIAlertController).notTo(beNil())
                        }

                        it("should show correct title for alert") {
                            sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithProffessionUrl(nil))
                            let alertController = spyPresenter.capturedPresentedViewController as! UIAlertController
                            expect(alertController.title).to(equal("John Apple show profile on"))
                        }

                        it("should have alert with 2 actions") {
                            sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithProffessionUrl(nil))
                            let alertController = spyPresenter.capturedPresentedViewController as! UIAlertController
                            expect(alertController.actions.count).to(equal(2))
                            expect(alertController.actions[0].title).to(equal("Twitter"))
                            expect(alertController.actions[1].title).to(equal("Cancel"))
                        }
                    }

                    context("with 2 correct urls") {
                        it("should present alert") {
                            sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithType(.Developer))
                            expect(spyPresenter.capturedPresentedViewController as? UIAlertController).notTo(beNil())
                        }

                        it("should show correct title for alert") {
                            sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithType(.Developer))
                            let alertController = spyPresenter.capturedPresentedViewController as! UIAlertController
                            expect(alertController.title).to(equal("John Apple show profile on"))
                        }

                        it("should have alert with 3 actions") {
                            sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithType(.Developer))
                            let alertController = spyPresenter.capturedPresentedViewController as! UIAlertController
                            expect(alertController.actions.count).to(equal(3))
                            expect(alertController.actions[0].title).to(equal("Github"))
                            expect(alertController.actions[1].title).to(equal("Twitter"))
                            expect(alertController.actions[2].title).to(equal("Cancel"))
                        }
                    }

                }
                
                context("with type .Designer") {

                    it("should present alert") {
                        sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithType(.Designer))
                        expect(spyPresenter.capturedPresentedViewController as? UIAlertController).notTo(beNil())
                    }

                    it("should show correct title for alert") {
                        sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithType(.Designer))
                        let alertController = spyPresenter.capturedPresentedViewController as! UIAlertController
                        expect(alertController.title).to(equal("John Apple show profile on"))
                    }

                    it("should have alert with 3 actions") {
                        sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithType(.Designer))
                        let alertController = spyPresenter.capturedPresentedViewController as! UIAlertController
                        expect(alertController.actions.count).to(equal(3))
                        expect(alertController.actions[0].title).to(equal("Dribbble"))
                        expect(alertController.actions[1].title).to(equal("Twitter"))
                        expect(alertController.actions[2].title).to(equal("Cancel"))
                    }
                }
                
                context("without urls") {

                    it("should NOT present alert") {
                        sut.infoViewDidTapAuthor(FakeAuthorProvider().authors.first!.copyWithoutUrls())
                        expect(spyPresenter.capturedPresentedViewController as? UIAlertController).to(beNil())
                    }
                }
            }
        }
    }

}
