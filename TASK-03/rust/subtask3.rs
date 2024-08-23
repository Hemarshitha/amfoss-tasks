use std::io;

fn main() {
    let mut input = String::new();
    println!("Enter an odd number: ");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: usize = input.trim().parse().expect("Please enter a number");

    // Upper part
    for i in 0..=n / 2 {
        println!("{}{}", " ".repeat(n / 2 - i), "*".repeat(2 * i + 1));
    }

    // Lower part
    for i in (0..n / 2).rev() {
        println!("{}{}", " ".repeat(n / 2 - i), "*".repeat(2 * i + 1));
    }
}
