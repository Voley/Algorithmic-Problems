#include <iostream>
#include <vector>
#include <algorithm>

class Person {
public:
    int birth;
    int death;
    
    Person(int b, int d) {
        birth = b;
        death = d;
    }
};

std::vector<int> buildDeltas(std::vector<Person> people, int min, int max);
int maxAliveYear(std::vector<Person> people, int min, int max);
int maxAliveYear(std::vector<int> deltas);

std::vector<int> buildDeltas(std::vector<Person> people, int min, int max) {
    std::vector<int> deltas;
    deltas.assign(max - min + 2, 0);
    for (const auto& person: people) {
        int birth = person.birth - min;
        deltas[birth]++;
        int death = person.death - min;
        deltas[death + 1]--;
    }
    return deltas;
}

int maxAliveYear(std::vector<Person> people, int min, int max) {
    auto deltas = buildDeltas(people, min, max);
    return maxAliveYear(deltas) + min;
}

int maxAliveYear(std::vector<int> deltas) {
    int maxYear = 0;
    int maxAlive = 0;
    int currentAlive = 0;
    
    for (int i = 0; i < deltas.size(); i++) {
        currentAlive += deltas[i];
        if (currentAlive > maxAlive) {
            maxAlive = currentAlive;
            maxYear = i;
        }
    }
    return maxYear;
}

int main() {
    Person p1 = Person(1900, 1950);
    Person p2 = Person(1925, 1975);
    Person p3 = Person(1925, 1980);
    Person p4 = Person(1951, 1999);
    std::vector<Person> people {p1, p2, p3, p4};
    std::cout << maxAliveYear(people, 1900, 2000) << std::endl;
    return 0;
}
