import System.IO
import System.Directory
import System.Environment

main = do x <- getCurrentDirectory
          putStrLn x
