#include <iostream>
#include <unordered_map>

class Logger {
public:
    /** Initialize your data structure here. */
    std::unordered_map<std::string, int> storage;
    Logger() {
        
    }
    
    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
     If this method returns false, the message will not be printed.
     The timestamp is in seconds granularity. */
    bool shouldPrintMessage(int timestamp, std::string message) {
        if (storage.find(message) == storage.end()) {
            storage[message] = timestamp;
            return true;
        } else {
            if ((timestamp - storage[message]) >= 10) {
                storage[message] = timestamp;
                return true;
            }
        }
        return false;
    }
};

/**
 * Your Logger object will be instantiated and called as such:
 * Logger obj = new Logger();
 * bool param_1 = obj.shouldPrintMessage(timestamp,message);
 */
int main() {
    return 0;
}
