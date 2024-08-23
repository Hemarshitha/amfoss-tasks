IO.puts "Enter an odd number: "
{n, _} = IO.gets("") |> Integer.parse()

# Upper part
for i <- 0..div(n, 2) do
  IO.puts String.duplicate(" ", div(n, 2) - i) <> String.duplicate("*", 2 * i + 1)
end

# Lower part
for i <- (div(n, 2) - 1)..0 do
  IO.puts String.duplicate(" ", div(n, 2) - i) <> String.duplicate("*", 2 * i + 1)
end
