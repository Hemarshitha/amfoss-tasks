import System.IO

main :: IO ()
main = do
    inputHandle <- openFile "input.txt" ReadMode
    content <- hGetContents inputHandle
    outputHandle <- openFile "output.txt" WriteMode
    hPutStr outputHandle content
    hClose inputHandle
    hClose outputHandle
