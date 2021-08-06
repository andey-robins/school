import System.IO
import System.Directory
import System.Environment

main = do x <- getCurrentDirectory
          y <- getDirectoryContents x
          printDirs (reverse y)

printDirs [] = putStrLn ""
printDirs (x:xs) = do putStrLn x
                      printDirs xs
