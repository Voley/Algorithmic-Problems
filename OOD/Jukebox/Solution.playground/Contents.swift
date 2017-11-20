/*
  Jukebox
    Design a musical jukebox using object-oriented principles
*/

class Data {
    
}

class Record {
    var title: String?
    var length: Int?
    var data: Data?
}

class Disc {
    var records: [Record]?
    var artist: String?
    var title: String?
    var artwork: Data?
    var playtime: Int?
}

class Jukebox {
    var discs: [Disc]?
    var currentDiscIndex: Int?
    var currentDisc: Disc?
    var queue: Array<JukeboxQueueItem>?
    var powerState: PowerState?
    var player: CDPlayer?
    
    func turnOn() {}
    func turnOff() {}
    func unloadAll() {}
    func switchToDiskAt(_ index: Int) {}
    func startPlaying() {}
    func stopPlaying() {}
    func enqueueTrack(_ on: Disc, _ index: Int) {}
    func playNext() {}
    func acceptCredits() {}
    
    enum PowerState {
        case bootingUp
        case on
        case playing
        case off
    }
    
    class JukeboxQueueItem {
        var disc: Disc?
        var track: Int?
    }
    
    class CDPlayer {
        func turnOn() {}
        func turnOff() {}
        func unload() {}
        func insert(_ disc: Disc) {}
        func selectTrackAt(_ index: Int) {}
    }
}
