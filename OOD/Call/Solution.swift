/*
 Call Center
 Imagine you have call center with three levels of employees: respondent, manager and director. An incoming telephone call must be first allocated to a respondent who is free. If the respondent can't handle the call, he or she must escalate the call to a manager. If the manager is not free or not able to handle it, then the call should be escalated to a director. Design the classes and data structures for this problem. Implement a method dispatchCall() which assigns a call to the first available employee.
 */

class CallCenter {
    var availableResponders: Array<Employee> = []
    var availableManagers: Array<Employee> = []
    var availableDirectors: Array<Employee> = []
    var busyEmployees: Array<Employee> = []
    
    var waitingCalls: Array<Call> = []
    
    func dispatch(_ call: Call) {
        if let employee = findEmployee(call.rank) {
            employee.accept(call)
        } else {
            enqueue(call)
        }
    }
    
    func enqueue(_ call: Call) {
        waitingCalls.append(call)
    }
    
    private func findEmployee(_ type: EmployeeType) -> Employee? {
        switch type {
        case .respondent:
            return availableResponders.first ?? availableManagers.first ?? availableDirectors.first ?? nil
            break
        case .manager:
            return availableManagers.first ?? availableDirectors.first ?? nil
            break
        case .director:
            return availableDirectors.first ?? nil
            break
            
        default:
            break
        }
        return nil
    }
    
}

enum EmployeeType {
    case respondent
    case manager
    case director
}

class Employee {
    var type: EmployeeType
    var onCallCompleted: ((Call) -> Void)?
    var isFree: Bool = true
    
    init(_ type: EmployeeType) {
        self.type = type
    }
    
    func accept(_ call: Call) { }
    func redirect(_ call: Call) { }
}

class Call {
    var origin: String = ""
    var rank: EmployeeType = .respondent
}
