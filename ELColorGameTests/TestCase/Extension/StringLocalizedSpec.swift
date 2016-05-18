import Foundation
import Quick
import Nimble

@testable
import ELColorGame

class StringLocalizedSpec: QuickSpec {

    override func spec() {

        describe("String extension for localized string") {

            var sut: String!

            context("key NOT exist for localized string") {
                beforeEach {
                    sut = "undefined_key".localized
                }

                afterEach {
                    sut = nil
                }

                it("should have key instead of value") {
                    expect(sut).to(equal("undefined_key"))
                }
            }

            context("key exist for localized string") {
                beforeEach {
                    sut = newGame.localized
                }

                afterEach {
                    sut = nil
                }

                it("should have proper value for key") {
                    expect(sut).to(equal(newGame.localized))
                }
            }
        }
    }

}
