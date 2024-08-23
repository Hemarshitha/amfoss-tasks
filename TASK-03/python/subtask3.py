n = int(input("Enter an odd number: "))

# Upper part
for i in range(n // 2 + 1):
    print(" " * (n // 2 - i) + "*" * (2 * i + 1))

# Lower part
for i in range(n // 2 - 1, -1, -1):
    print(" " * (n // 2 - i) + "*" * (2 * i + 1))
