/*
 Jigsaw
 Implement an NxN jigsaw puzzle. Design the data structures and explain an algorithm to solve the puzzle. You can assume that you have a `fitsWidth` method which, when passed two puzzle edges returns true if two edges belong together.
*/

class Box {
    var puzzle: JigsawPuzzle?
}

class JigsawPuzzle {
    var allTiles: [Tile]?
    var columns: Int?
    var rows: Int?
    var currentLayout: [[Tile]]?
}

enum Edge: Int {
    case top = 0
    case right = 1
    case bottom = 2
    case left = 3
}

class Tile {
    var correctSpot: (x: Int, y: Int)?
    var heading: Edge?
    func canConnectTo(_ tile: Tile) -> Bool { return true }
    func connectTo(_ tile: Tile) {}
}

class Player {
    func pick(_ tile: Tile) {}
    func rotate(_ tile: Tile) {}
    func fitsWidth(_ first: Tile, _ second: Tile) -> Bool { return true }
    func testCompatibility(_ first: Tile, _ second: Tile) -> Bool { return true }
    
    func solvePuzzle(_ tiles: [Tile], _ layout: inout [[Tile]]) {
        let myTiles = tiles
        
        for t in myTiles {
            for z in myTiles {
                if testCompatibility(t, z) {
                    for i in 0..<3 {
                        for j in 0..<3 {
                            if t.canConnectTo(z) {
                                t.connectTo(z)
                            } else {
                                rotate(t)
                            }
                        }
                        rotate(z)
                    }
                }
            }
        }
    }
}
