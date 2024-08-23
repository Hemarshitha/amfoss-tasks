#include <stdio.h>

int main() {
    int n;
    FILE *infile = fopen("input.txt", "r");
    fscanf(infile, "%d", &n);
    fclose(infile);

    FILE *outfile = fopen("output.txt", "w");
    for (int i = 0; i <= n / 2; i++) {
        fprintf(outfile, "%s%.*s\n", n / 2 - i, "", 2 * i + 1, "**********");
    }
    for (int i = n / 2 - 1; i >= 0; i--) {
        fprintf(outfile, "%s%.*s\n", n / 2 - i, "", 2 * i + 1, "**********");
    }
    fclose(outfile);
    return 0;
}
