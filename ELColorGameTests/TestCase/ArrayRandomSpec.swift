import Quick
import Nimble

@testable import ELColorGame

class ArrayRandomSpec: QuickSpec {

    override func spec() {
        describe("Random element from array") {
            var sut: [Int]!

            context("when array contained several elements") {
                beforeEach {
                    sut = [4, 5, 8, 10, 20]
                }

                it("should get random element contained in array") {
                    expect(sut.contains(sut.random!)).to(beTrue())
                }
            }

            context("when array is empty") {
                beforeEach {
                    sut = []
                }

                it("should get nil") {
                    expect(sut.random).to(beNil())
                }
            }
        }
    }

}
