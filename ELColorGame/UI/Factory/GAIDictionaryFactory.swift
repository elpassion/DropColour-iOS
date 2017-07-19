import Foundation

protocol GAIDictionaryCreating {
    func createEventWithCategory(_ category: String, action: String, value: NSNumber?) -> [AnyHashable: Any]
}

class GAIDictionaryFactory: GAIDictionaryCreating {

    func createEventWithCategory(_ category: String, action: String, value: NSNumber?) -> [AnyHashable: Any] {
        return GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: nil, value: value).buildDict()
    }

}
