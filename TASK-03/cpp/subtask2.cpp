#include <iostream>
#include <fstream>
#include <string>
int main() {
    std::ifstream inputFile("input.txt");
    std::ofstream outputFile("output.txt");
    std::string line;
    if (inputFile.is_open() && outputFile.is_open()) {
        while (getline(inputFile, line)) {
            outputFile << line << std::endl;
        }
    } else {
        std::cerr << "Unable to open file" << std::endl;
    }
    inputFile.close();
    outputFile.close();
    return 0;
