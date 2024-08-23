const readline = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout,
});

readline.question("Enter an odd number: ", n => {
    n = parseInt(n);

    // Upper part
    for (let i = 0; i <= Math.floor(n / 2); i++) {
        console.log(" ".repeat(Math.floor(n / 2) - i) + "*".repeat(2 * i + 1));
    }

    // Lower part
    for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
        console.log(" ".repeat(Math.floor(n / 2) - i) + "*".repeat(2 * i + 1));
    }

    readline.close();
});
