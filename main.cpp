#include <fstream>
#include <iostream>
#include <string>

int main() {
  std::ifstream inputFile("./README.md");

  if (!inputFile.is_open()) {
    std::cerr << "Error: could not open the file!" << std::endl;
    return 1;
  }

  std::string line;
  while (std::getline(inputFile, line)) {
    std::cout << line << std::endl;
  }

  inputFile.close();
  return 0;
}