import System.IO
import System.Directory
import System.Environment

main = do (f1:f2:_) <- getArgs
          cp f1 f2

cp f1 f2 = do copyFile f1 f2
