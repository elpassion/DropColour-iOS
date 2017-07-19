import Foundation

enum AuthorType: String {
    case developer = "Developer"
    case designer = "Designer"
}

struct Author {

    let name: String
    let surname: String
    let type: AuthorType
    let avatarUrl: URL?
    let professionUrl: URL?
    let twitterUrl: URL?

}

extension Author {

    var fullName: String {
        return "\(name) \(surname)"
    }

    func loginFromUrl(_ url: URL) -> String? {
        let urlString = url.absoluteString
        guard urlString.contains("/") else { return nil }
        return urlString.components(separatedBy: "/").last
    }

}
