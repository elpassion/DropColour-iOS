import Quick
import Nimble

@testable
import ELColorGame

class DifficultyLevelSpec: QuickSpec {

    override func spec() {
        describe("DifficultyLevel") {

            var sut: DifficultyLevel!

            let interval: (forScore: Int) -> Double = { score in
                sut.scoreClosure = { score }
                return sut.intervalTime()
            }

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
                for idx in 0..<(scoreArray.count-1) {
                    let previousInterval = interval(forScore: scoreArray[idx])
                    let nextInterval = interval(forScore: scoreArray[idx+1])
                    expect(previousInterval).to(beGreaterThan(nextInterval))
                }
            }

            it("should increase interval when level changes after 200 points") {
                expect(interval(forScore: 200)).to(beGreaterThan(interval(forScore: 190)))
            }
        }
    }

}
