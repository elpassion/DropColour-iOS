import Foundation

class Slot {

    let location: SlotLocation
    private weak var delegate: SlotDelegate?

    init(location: SlotLocation, delegate: SlotDelegate?) {
        self.location = location
        self.delegate = delegate
    }

    var circle: Circle? {
        didSet {
            if let oldValue = oldValue {
                delegate?.slot(self, didRemoveCirlce: oldValue)
            }
            if let circle = circle {
                delegate?.slot(self, didInsertCircle: circle)
            }
        }
    }

    var isEmpty: Bool {
        return circle == nil
    }

}
