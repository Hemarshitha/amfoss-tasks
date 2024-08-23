{n, _} = File.read!("input.txt") |> Integer.parse()

File.write!("output.txt",
  Enum.map_join(0..div(n, 2), "\n", fn i ->
    String.duplicate(" ", div(n, 2) - i) <> String.duplicate("*", 2 * i + 1)
  end) <>
  Enum.map_join((div(n, 2) - 1)..0, "\n", fn i ->
    String.duplicate(" ", div(n, 2) - i) <> String.duplicate("*", 2 * i + 1)
  end) <> "\n")
