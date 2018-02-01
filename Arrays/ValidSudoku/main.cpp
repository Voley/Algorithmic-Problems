#include <iostream>
#include <vector>
#include <unordered_set>

class Solution {
public:
    bool isValidSudoku(std::vector<std::vector<char>>& board) {
        return verifyHorizontals(board) && verifyVerticals(board) && verifySquares(board);
    }
    
    bool verifyHorizontals(std::vector<std::vector<char>>& board) {
        std::unordered_set<char> storage;
        for (int row = 0; row < 9; row++) {
            for (int col = 0; col < 9; col++) {
                if (board[row][col] != '.') {
                    char value = board[row][col];
                    if (storage.count(value) > 0) {
                        return false;
                    }
                    storage.insert(value);
                }
            }
            storage.clear();
        }
        return true;
    }
    
    bool verifyVerticals(std::vector<std::vector<char>>& board) {
        std::unordered_set<char> storage;
        for (int row = 0; row < 9; row++) {
            for (int col = 0; col < 9; col++) {
                if (board[col][row] != '.') {
                    char value = board[col][row];
                    if (storage.count(value) > 0) {
                        return false;
                    }
                    storage.insert(value);
                }
            }
            storage.clear();
        }
        return true;
    }
    
    bool verifySquares(std::vector<std::vector<char>>& board) {
        std::unordered_set<char> storage;
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                for (int rowIn = 0; rowIn < 3; rowIn++) {
                    for (int colIn = 0; colIn < 3; colIn++) {
                        char value = board[row * 3 + rowIn][col * 3 + colIn];
                        if (value != '.') {
                            if (storage.count(value) > 0) {
                                return false;
                            }
                            storage.insert(value);
                        }
                    }
                }
                storage.clear();
            }
        }
        return true;
    }
};

int main() {
    return 0;
}
