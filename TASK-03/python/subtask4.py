with open("input.txt", "r") as infile:
    n = int(infile.read().strip())

with open("output.txt", "w") as outfile:
    for i in range(n // 2 + 1):
        outfile.write(" " * (n // 2 - i) + "*" * (2 * i + 1) + "\n")
    for i in range(n // 2 - 1, -1, -1):
        outfile.write(" " * (n // 2 - i) + "*" * (2 * i + 1) + "\n")
