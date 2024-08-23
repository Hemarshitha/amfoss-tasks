const fs = require("fs");

const n = parseInt(fs.readFileSync("input.txt", "utf8").trim(), 10);

let output = "";
for (let i = 0; i <= Math.floor(n / 2); i++) {
    output += " ".repeat(Math.floor(n / 2) - i) + "*".repeat(2 * i + 1) + "\n";
}
for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
    output += " ".repeat(Math.floor(n / 2) - i) + "*".repeat(2 * i + 1) + "\n";
}
fs.writeFileSync("output.txt", output);
