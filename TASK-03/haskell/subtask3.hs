import Control.Monad
import Text.Read (readMaybe)

main :: IO ()
main = do
    putStrLn "Enter an odd number: "
    input <- getLine
    let maybeN = readMaybe input :: Maybe Int
    case maybeN of
        Just n -> when (odd n) $ do
            let upper = [0 .. div n 2]
            let lower = reverse [0 .. div n 2 - 1]
            mapM_ (printLine n) upper
            mapM_ (printLine n) lower
        _ -> putStrLn "Please enter a valid odd number."

printLine :: Int -> Int -> IO ()
