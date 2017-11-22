/*
  Othello
    Othello is played as follows: Each Othello piece is white on one side and black on the other. When a piece is surrounded by its opponents on both the left and right sides, or both the top and bottom, it is said to be captured and its color is flipped. On your turn, you must capture at least one of your opponent's pieces. The game ends when either user has no more valid moves. The win is assigned to the person with the most pieces. Implement the object-oriented design for Othello.
*/

class Game {
    var board: Board?
    var player1: Player?
    var player2: Player?
    
    func setupGame() {}
    func resetGame() {}
    func finishGame() {}
}

class Board {
    var array: [Disc]?
    func flipDiscsFrom(_ d1: Disc, _ d2: Disc, _ toColor: Color) {}
    func canPlace(_ disc: Disc, _ toSpot: (Int, Int)) -> Bool { return false }
    
}

enum Color {
    case black
    case white
}

class Disc {
    var type: Color?
    var owner: Player?
    var coords: (Int, Int)?
    func flip() {}
}

class Player {
    var pieces: [Disc]?
    var color: Color?
    func playPiece(_ position: (Int, Int)) {}
}

