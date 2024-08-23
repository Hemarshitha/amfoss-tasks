use std::fs;

fn main() {
    let n: usize = fs::read_to_string("input.txt")
        .expect("Failed to read file")
        .trim()
        .parse()
        .expect("Please enter a valid number");

    let mut output = String::new();
    for i in 0..=n / 2 {
        output.push_str(&format!("{}{}\\n", " ".repeat(n / 2 - i), "*".repeat(2 * i + 1)));
    }
    for i in (0..n / 2).rev() {
        output.push_str(&format!("{}{}\\n", " ".repeat(n / 2 - i), "*".repeat(2 * i + 1)));
    }
    fs::write("output.txt", output).expect("Unable to write file");
}
