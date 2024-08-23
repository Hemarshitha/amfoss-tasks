import java.util.Scanner;

public class subtask3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter an odd number: ");
        int n = scanner.nextInt();

        // Upper part
        for (int i = 0; i <= n / 2; i++) {
            System.out.println(" ".repeat(n / 2 - i) + "*".repeat(2 * i + 1));
        }

        // Lower part
        for (int i = n / 2 - 1; i >= 0; i--) {
            System.out.println(" ".repeat(n / 2 - i) + "*".repeat(2 * i + 1));
       }
    }
}
