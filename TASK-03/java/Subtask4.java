import java.io.*;

public class Subtask4 {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("input.txt"));
        int n = Integer.parseInt(reader.readLine().trim());
        reader.close();

        BufferedWriter writer = new BufferedWriter(new FileWriter("output.txt"));
        for (int i = 0; i <= n / 2; i++) {
            writer.write(" ".repeat(n / 2 - i) + "*".repeat(2 * i + 1));
            writer.newLine();
        }
        for (int i = n / 2 - 1; i >= 0; i--) {
            writer.write(" ".repeat(n / 2 - i) + "*".repeat(2 * i + 1));
            writer.newLine();
        }
        writer.close();
    }
}
