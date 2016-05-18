import Quick
import Nimble

@testable
import ELColorGame

class AuthorLoginFromUrlSpec: QuickSpec {

    override func spec() {

        var sut: Author!

        describe("Login from url extension for Author") {

            describe("when url has login") {

                beforeEach {
                    let url = NSURL(string: "www.google.pl/LoginName")
                    sut = FakeAuthorProvider().authors.first!.copyWithProffessionUrl(url!)
                }

                afterEach {
                    sut = nil
                }

                it("should get login from url") {
                    expect(sut.loginFromUrl(sut.professionUrl!)).to(equal("LoginName"))
                }
            }

            describe("when url has NOT login") {

                beforeEach {
                    let url = NSURL(string: "www.google.pl")
                    sut = FakeAuthorProvider().authors.first!.copyWithProffessionUrl(url!)
                }

                afterEach {
                    sut = nil
                }

                it("should get nil") {
                    expect(sut.loginFromUrl(sut.professionUrl!)).to(beNil())
                }
            }
        }
    }

}
