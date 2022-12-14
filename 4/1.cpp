#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <list>
#include <vector>

class Day1 {
    public:
        Day1() {
            std::ifstream input("input.txt");

            std::vector<std::vector<int>> ranges;
            
            int contains = 0;
            std::string line;
            while (std::getline(input, line)) {
                if (line == "") continue;

                std::string assignments1 = line.substr(0, line.find(','));
                std::string assignments2 = line.substr(line.find(',')+1, line.length());
                
                int assignment1 = (std::stoi(assignments1.substr(0, assignments1.find('-'))));
                int assignment2 = (std::stoi(assignments1.substr(assignments1.find('-')+1,assignments1.length())));
                int assignment3 = (std::stoi(assignments2.substr(0, assignments2.find('-'))));
                int assignment4 = (std::stoi(assignments2.substr(assignments2.find('-')+1,assignments2.length())));

                if (fitsIn(assignment1, assignment2, assignment3, assignment4) || fitsIn(assignment3, assignment4, assignment1, assignment2)) {
                    contains++;
                }
            }

            std::cout << contains;
            
        }

    bool fitsIn(int limit1, int limit2, int inner1, int inner2) {
        return (inner1 >= limit1 && inner2 <= limit2);
    }
};

int main() {
    Day1 day1;
    return 0;
}
