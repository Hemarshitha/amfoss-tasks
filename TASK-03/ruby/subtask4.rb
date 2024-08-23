n = File.read("input.txt").to_i

File.open("output.txt", "w") do |outfile|
  (0..n/2).each do |i|
    outfile.puts(" " * (n / 2 - i) + "*" * (2 * i + 1))
  end
  (n/2 - 1).downto(0) do |i|
    outfile.puts(" " * (n / 2 - i) + "*" * (2 * i + 1))
  end
end
