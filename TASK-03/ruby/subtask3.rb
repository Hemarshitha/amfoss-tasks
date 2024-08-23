print "Enter an odd number: "
n = gets.to_i

# Upper part
(0..n/2).each do |i|
  puts " " * (n / 2 - i) + "*" * (2 * i + 1)
end

# Lower part
(n/2 - 1).downto(0) do |i|
  puts " " * (n / 2 - i) + "*" * (2 * i + 1)
end
