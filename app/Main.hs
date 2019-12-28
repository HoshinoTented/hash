module Main where

import Hash.Shell
import Hash.Echo
import Hash.Cd
import Hash.Cat
import Hash.Path

main :: IO ((), FilePath)
main = sh "C:/Users/Administrator" $ do
    echo pwd [Hash.Echo.NoNewLine]
    cd "Desktop"
    echo (cat "desktop.ini" []) []
