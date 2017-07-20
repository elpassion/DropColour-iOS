import Foundation

extension Array {

    var random: Element? {
        guard !isEmpty else { return nil }
        return self[Int(arc4random_uniform(UInt32(count)))]
    }

}
