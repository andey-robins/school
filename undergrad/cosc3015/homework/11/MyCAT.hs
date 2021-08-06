import System.IO
import System.Directory
import System.Environment

main = do (f1:_) <- getArgs
          contents <- readFile f1
          putStrLn contents
