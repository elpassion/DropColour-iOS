import Foundation

protocol GAIDictionaryCreating {
    func createEvent(withCategory category: String, action: String, value: NSNumber?) -> [AnyHashable: Any]
}

class GAIDictionaryFactory: GAIDictionaryCreating {

    func createEvent(withCategory category: String, action: String, value: NSNumber?) -> [AnyHashable: Any] {
        return GAIDictionaryBuilder
            .createEvent(withCategory: category, action: action, label: nil, value: value)
            .buildDict()
    }

}
