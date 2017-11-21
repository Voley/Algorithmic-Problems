/*
 Online Book Reader
    Design the data structures for an online book reader system.
*/

class Database {
    func itemsBy(_ name: String) -> [LibraryItem]? { return nil }
    func add(_ item: LibraryItem) {}
    func remove(_ item: LibraryItem) {}
    func item(_ id: String) -> LibraryItem? { return nil }
}

enum LibraryItemType {
    case book
    case magazine
}

class LibraryItem {
    var id: String?
    var type: LibraryItemType?
    var title: String?
    var length: Int?
}

class OnlineReader {
    var currentItem: LibraryItem?
    func open(_ item: LibraryItem) {}
}

class UserManager {
    var accounts: Dictionary<String, Account>?
    func addUser(_ user: Account) {}
    func removeUser(_ user: Account) {}
    func findUser(_ name: String) {}
}


class Account {
    var name: String?
    var login: String?
    var password: String?
    var items: LibraryItem?
}

class Website {
    var db: Database?
    var reader: OnlineReader?
    var userManager: UserManager?
}
