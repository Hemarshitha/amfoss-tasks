#include <stdio.h>
#include <stdlib.h>
int main() {
    FILE *inputFile = fopen("input.txt", "r");
    FILE *outputFile = fopen("output.txt", "w");
    char buffer[256];
    if (inputFile == NULL || outputFile == NULL) {
        perror("Error opening file");
        return 1;
    }
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
    fclose(inputFile);
    fclose(outputFile);
    return 0;
}
