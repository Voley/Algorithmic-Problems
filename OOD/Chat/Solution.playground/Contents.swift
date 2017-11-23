/*
 Chat Server
    Explain how you would design a chat server. In particular, provide details about the various backend components, classes and methods. What would be the hardest problems to solve?
*/

protocol Conversation {
    var id: String { get set }
    var participants: [User] { get set }
    var message: [Message] { get set }
    func add(_ message: Message)
}

class Message {
    var content: String?
    var date: Int?
}

class PrivateChat: Conversation {
    var id: String = ""
    var participants: [User] = []
    var message: [Message] = []
    func add(_ message: Message) {}
}

class GroupChat: Conversation {
    var id: String = ""
    var participants: [User] = []
    var message: [Message] = []
    func add(_ message: Message) {}
}

class User: Comparable {
    var id: Int?
    var status: UserStatus?
    var privateChats: Dictionary<Int, PrivateChat>?
    var groupChats: Dictionary<Int, GroupChat>?
    var sentRequests: Dictionary<Int, AddRequest>?
    var receivedRequests: Dictionary<Int, AddRequest>?
    var contacts: Dictionary<Int, User>?
    var name: String?
    var accountName: String?
    
    func sendMessageTo(_ user: User, _ text: String) {}
    func sendMessageTo(_ chat: Conversation, _ text: String) {}
    func received(_ addRequest: AddRequest) {}
    func sent(_ addRequest: AddRequest) {}
    
    public static func <(lhs: User, rhs: User) -> Bool { return true }
    public static func ==(lhs: User, rhs: User) -> Bool { return true }
}

enum RequestStatus {
    case inProgress
    case declined
    case accepted
}

enum UserStatus {
    case offline
    case online
    case away
    case busy
}

class AddRequest {
    var from: User?
    var to: User?
    var timeStamp: Int?
    var status: RequestStatus?
}

class UserManager {
    var userById: Dictionary<Int, User>?
    var userByAccountName: Dictionary<String, User>?
    var onlineUsers: Dictionary<Int, User>?
    
    func add(_ user: User, _ to: String) {}
    func acceptAddRequest(_ req: AddRequest) {}
    func rejectAddRequest(_ req: AddRequest) {}
    func signedOn(_ user: User) {}
    func signedOff(_ user: User) {}
}

