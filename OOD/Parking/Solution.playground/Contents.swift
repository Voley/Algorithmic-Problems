/*
 Parking Lot
    Design a parking lot using object-oriented principles.
*/

class Parking {
    var levels: Array<Level>?
    var emptySpots: Int?
    var zipcode: Int?
    
    func park(_ vehicle: Vehicle) {}
}

class Level {
    var lots: Array<Lot>?
    var emptySlots: Int?
    func accept(_ vehicle: Vehicle) {}
    func remove(_ vehicle: Vehicle) {}
}

class Lot {
    var id: String?
    var isEmpty: Bool?
    var occupiedLots: Array<Lot>?
    var spotsNeeded: Int?
    var size: VehicleSize?
    var level: Level?
    
    func canFit(_ vehicle: Vehicle) -> Bool { return true }
}

enum VehicleSize {
    case small
    case medium
    case large
}

class Vehicle {
    var licensePlate: String?
    var size: VehicleSize?
    func parkAt(_ lot: Lot) {}
}

class Car: Vehicle {
    override init() {
        super.init()
        size = .medium
    }
}

class Motorcycle: Vehicle {
    override init() {
        super.init()
        size = .small
    }
}

class Bus: Vehicle {
    override init() {
        super.init()
        size = .large
    }
}

class Exit {
    
}
