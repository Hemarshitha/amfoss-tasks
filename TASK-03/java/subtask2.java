import java.nio.file.*;
public class subtask2 {
    public static void main(String[] args) {
        try {
            String data = Files.readString(Path.of("input.txt"));
            Files.writeString(Path.of("output.txt"), data);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
