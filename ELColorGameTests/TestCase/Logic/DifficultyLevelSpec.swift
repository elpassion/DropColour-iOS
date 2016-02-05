import Quick
import Nimble

@testable
import ELColorGame

class DifficultyLevelSpec: QuickSpec {

    override func spec() {
        describe("DifficultyLevel") {

            var sut: DifficultyLevel!

            beforeEach {
                sut = DifficultyLevel()
            }

            afterEach {
                sut = nil
            }

            it("should be initialized") {
                expect(sut).notTo(beNil())
            }

            it("should decrease interval when score increasing on the same level") {
                let scoreArray = [20, 50, 60, 90, 100, 130, 150, 190]
                for score in scoreArray {
                    let oldIntervalTime = sut.intervalTime()
                    sut.scoreClosure = { score }
                    expect(sut.intervalTime()).to(beLessThan(oldIntervalTime))
                }
            }

            it("should increase interval when level changes after 200 points") {
                let interval: (score:Int) -> Double = { score in
                    sut.scoreClosure = { score }
                    return sut.intervalTime()
                }
                expect(interval(score: 200)).to(beGreaterThan(interval(score: 190)))
            }
        }
    }
}
