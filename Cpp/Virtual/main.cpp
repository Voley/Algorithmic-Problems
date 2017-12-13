#include <iostream>

class Person {
public:
    virtual void print() {
        std::cout << "Person reporting." << std::endl;
    }
};

class Student: public Person {
    void print() {
        std::cout << "Student is here." << std::endl;
    }
};

int main() {
    
    Person *p2 = new Person();
    Person *s2 = new Student();
    p2->print();
    s2->print();
    
    return 0;
}
