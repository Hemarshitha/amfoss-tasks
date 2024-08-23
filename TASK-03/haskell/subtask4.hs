import System.IO

main :: IO ()
main = do
    contents <- readFile "input.txt"
    let n = read contents :: Int

    let upper = [0 .. div n 2]
        lower = reverse [0 .. div n 2 - 1]
        diamond = map (printLine n) upper ++ map (printLine n) lower

    writeFile "output.txt" (unlines diamond)

printLine :: Int -> Int -> String
printLine n i = replicate (div n 2 - i) " " ++ replicate (2 * i + 1) "*"
