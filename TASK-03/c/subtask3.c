#include <stdio.h>

int main() {
    int n;
    printf("Enter an odd number: ");
    scanf("%d", &n);

    // Upper part
    for (int i = 0; i <= n / 2; i++) {
        for (int j = 0; j < n / 2 - i; j++) printf(" ");
        for (int j = 0; j < 2 * i + 1; j++) printf("*");
        printf("\n");
    }

    // Lower part
    for (int i = n / 2 - 1; i >= 0; i--) {
        for (int j = 0; j < n / 2 - i; j++) printf(" ");
        for (int j = 0; j < 2 * i + 1; j++) printf("*");
