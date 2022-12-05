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
            
            std::string line;
            while (std::getline(input, line)) {
                std::string assignment1 = line.substr(0, line.find(','));
                std::string assignment2 = line.substr(line.find(',')+1, line.length());

                ranges = doStuff(assignment1, ranges);
                ranges = doStuff(assignment2, ranges);
            }

            int contains = 0;
            for (size_t i = 0; i < ranges.size(); i++)
            {
                std::vector<int> range = ranges[i];
                for (size_t i2 = 0; i2 < ranges.size(); i2++)
                {
                    if (i == i2) continue;
                    std::vector<int> range2 = ranges[i2];
                    //std::cout << "[" << range[0] << "," << range[1] << "] <- [" << range2[0] << "," << range2[1] << "]";
                    if (range2[0] >= range[0] && range2[1] <= range[1]) {
                        contains++;
                        //std::cout << " - true\n";
                    }
                    else {
                        //std::cout << " - false\n";
                    }
                }
            }

            std::cout << contains;
            
        }

    std::vector<std::vector<int>> doStuff(std::string assignment, std::vector<std::vector<int>> ranges) {
        std::vector<int> list = {0,0};

        list[0] = (std::stoi(assignment.substr(0, assignment.find('-'))));
        list[1] = (std::stoi(assignment.substr(assignment.find('-')+1,assignment.length())));

        ranges.push_back(list);
        return ranges;
    }
};

int main() {
    Day1 bruh;
    return 0;
}
