import Foundation

struct SlotLocation {

    let column: Int
    let row: Int

}

extension SlotLocation: Hashable {

    var hashValue: Int {
        return "\(column)x\(row)".hashValue
    }

}

func == (lhs: SlotLocation, rhs: SlotLocation) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
