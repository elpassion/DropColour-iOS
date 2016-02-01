import Quick
import Nimble
import UIKit

@testable
import ELColorGame

class AuthorLoginFromUrlSpec: QuickSpec {

    override func spec() {

        var sut: Author!

        describe("when url is correct") {

            beforeEach {
                let url = NSURL(string: "www.google.pl/LoginName")
                sut = FakeAuthorRepository().authorWithDeveloperType.copyWithProffessionUrl(url!)
            }

            afterEach {
                sut = nil
            }

            it("should get login from url") {

                expect(sut.loginFromUrl(sut.professionUrl!)).to(equal("LoginName"))
            }
        }

        describe("when url is incorrect") {

            beforeEach {
                let url = NSURL(string: "www.google.pl")
                sut = FakeAuthorRepository().authorWithDeveloperType.copyWithProffessionUrl(url!)
            }

            afterEach {
                sut = nil
            }

            it("should get empty string from url") {
                expect(sut.loginFromUrl(sut.professionUrl!)).to(equal(""))
            }
        }

    }

}
