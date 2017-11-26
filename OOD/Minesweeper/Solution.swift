/*
 Minesweeper
 Design and implement a text-based Minesweeper game. Minesweeper is the classic single-player computer game where a NxN grid has B mines (or bombs) hidden across the grid. The remaining cells are either blank or have a number behind them. The numbers reflect the number of bombs in the surrounding eight cells. The user then uncovers a cell. If it is a bomb, the player loses. If it is a number, the number is exposed. If it is a blank cell, this cell and all adjacent blank cells (up to and including the surrounding numeric cells) are exposed. The player wins when all non-bomb cells are exposed. The player can also flag certain pieces as potential bombs. This doesn't affect game play, other than to block the user from accidentally clicking a cell that is thought to have a bomb.
 */

import Foundation

class Board {
    var cells: Array<Array<Cell>> = []
    var firstRevealHappened = false
    var bombsCount: Int
    var game: Game?
    
    init(_ bombs: Int) {
        bombsCount = bombs
        setupBoard()
    }
    
    func checkWin() -> Bool {
        var total = 0
        for i in 0..<8 {
            for j in 0..<8 {
                if !cells[j][i].isRevealed {
                    total += 1
                }
            }
        }
        
        if total == bombsCount {
            return true
        }
        return false
    }
    
    func setupBoard() {
        
        cells = [[], [], [], [], [], [], [], []]
        var bombs = Set<Int>()
        while bombs.count < bombsCount {
            bombs.insert(Int(arc4random_uniform(64)))
        }
        
        for i in 0..<8 {
            for j in 0..<8 {
                if bombs.contains(i * 8 + j) {
                    cells[i].append(Cell(true))
                } else {
                    cells[i].append(Cell(false))
                }
            }
        }
        
        for i in 0..<8 {
            for j in 0..<8 {
                if cells[j][i].isBomb {
                    updateSurroundingCells(i, j)
                }
            }
        }
    }
    
    func updateSurroundingCells(_ x: Int, _ y: Int) {
        
        if y + 1 < 8 {
            cells[y + 1][x].value += 1
        }
        if y - 1 >= 0 {
            cells[y - 1][x].value += 1
        }
        
        if x - 1 >= 0 {
            if y + 1 < 8 {
                cells[y + 1][x - 1].value += 1
            }
            cells[y][x - 1].value += 1
            if y - 1 >= 0 {
                cells[y - 1][x - 1].value += 1
            }
        }
        
        if x + 1 < 8 {
            if y + 1 < 8 {
                cells[y + 1][x + 1].value += 1
            }
            cells[y][x + 1].value += 1
            if y - 1 >= 0 {
                cells[y - 1][x + 1].value += 1
            }
        }
    }
    
    func render() {
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
        
        for i in -1..<8 {
            for j in -1..<8 {
                if j == -1 && i == -1 {
                    print("*", terminator: " ")
                } else if i == -1 {
                    print(letters[max(j, 0)], separator:" ", terminator: " ")
                } else if j == -1 {
                    print(numbers[max(i, 0)], separator:" ", terminator: " ")
                } else {
                    print(cells[i][j], separator:" ", terminator: " ")
                }
            }
            print("")
        }
        print(">")
    }
    
    func process(_ x: Int, _ y: Int) {
        if !cells[y][x].isRevealed {
            if !firstRevealHappened {
                if cells[y][x].isBomb {
                    setupBoard()
                    process(x, y)
                    return
                }
                
                firstReveal(x, y)
            } else {
                if cells[y][x].isBomb {
                    game?.loseGame()
                    return
                }
                cells[y][x].isRevealed = true
            }
        }
    }
    
    func firstReveal(_ x: Int, _ y: Int) {
        firstBfsReveal(x, y)
        firstRevealHappened = true
    }
    
    func firstBfsReveal(_ x: Int, _ y: Int) {
        cells[y][x].isRevealed = true
        
        if y + 1 < 8 {
            bfsReveal(x, y + 1)
        }
        if y - 1 >= 0 {
            bfsReveal(x, y - 1)
        }
        
        if x - 1 >= 0 {
            if y + 1 < 8 {
                bfsReveal(x - 1, y + 1)
            }
            bfsReveal(x - 1, y)
            if y - 1 >= 0 {
                bfsReveal(x - 1, y - 1)
            }
        }
        
        if x + 1 < 8 {
            if y + 1 < 8 {
                bfsReveal(x + 1, y + 1)
            }
            bfsReveal(x + 1, y)
            if y - 1 >= 0 {
                bfsReveal(x + 1, y - 1)
            }
        }
    }
    
    func bfsReveal(_ x: Int, _ y: Int) {
        if cells[y][x].isRevealed {
            return
        }
        if !cells[y][x].isBomb {
            cells[y][x].isRevealed = true
        } else {
            return
        }
        if cells[y][x].value > 0 {
            return
        }
        
        if y + 1 < 8 {
            bfsReveal(x, y + 1)
        }
        if y - 1 >= 0 {
            bfsReveal(x, y - 1)
        }
        
        if x - 1 >= 0 {
            if y + 1 < 8 {
                bfsReveal(x - 1, y + 1)
            }
            bfsReveal(x - 1, y)
            if y - 1 >= 0 {
                bfsReveal(x - 1, y - 1)
            }
        }
        
        if x + 1 < 8 {
            if y + 1 < 8 {
                bfsReveal(x + 1, y + 1)
            }
            bfsReveal(x + 1, y)
            if y - 1 >= 0 {
                bfsReveal(x + 1, y - 1)
            }
        }
    }
}

class Cell: CustomDebugStringConvertible {
    var isRevealed = false
    var isBomb = false
    init(_ bomb: Bool) {
        isBomb = bomb
    }
    var value: Int = 0
    
    var debugDescription: String {
        if !isRevealed {
            return "n"
        } else if isBomb {
            return "b"
        } else {
            return "\(value)"
        }
    }
}

class Game {
    var board: Board
    var finished = false
    
    init(_ bombs: Int) {
        self.board = Board(bombs)
        defer {
            self.board.game = self
        }
    }
    
    func update() {
        board.render()
        checkState()
        getInput()
    }
    
    func getInput() {
        guard let str = readLine() else {
            update()
            return
        }
        
        let values = str.split(separator: " ")
        guard values.count == 2 else { print("Incorrect input, aborting"); return }
        guard var f = Int(values[1]) else { print("Incorrect input, aborting"); return }
        f -= 1
        guard f < 8 else { print("Incorrect input, aborting"); return }
        let s = indexFromLetter(String(values[0]))
        guard s != -1 else { print("Incorrect input, aborting"); return }
        process(s, f)
    }
    
    func process(_ x: Int, _ y: Int) {
        board.process(x, y)
        update()
    }
    
    private func indexFromLetter(_ str: String) -> Int {
        switch str {
        case "a":
            return 0
        case "b":
            return 1
        case "c":
            return 2
        case "d":
            return 3
        case "e":
            return 4
        case "f":
            return 5
        case "g":
            return 6
        case "h":
            return 7
        default:
            return -1
        }
    }
    
    func loseGame() {
        print("Game Over")
        finished = true
    }
    
    func checkState() {
        if finished {
            exit(0)
        } else if board.checkWin() {
            print("You Win!")
            exit(0)
        }
    }
}

// bombs amount
let g = Game(6)
g.update()
