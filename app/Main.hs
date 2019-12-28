module Main where

import Hash.Shell
import Hash.Echo
import Hash.Cd
import Hash.Cat
import Hash.Path
import Hash.Ls

main :: IO ((), FilePath)
main = sh "C:/Users/Administrator" $ do
    echo' pwd
    cd "Desktop"
    echo' $ show <$> l
    echo' $ cat' "text.txt"
