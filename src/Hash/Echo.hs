module Hash.Echo (
    echo
  , echo'
  , EchoOptions(..)
) where

import Hash.Shell

data EchoOptions =
    NoNewLine
  deriving (Show, Eq)

echo' = echo []

{-|
Usage: echo [OPTIONS] <String>

Options:
  NoNewLine     do not append newline     
-}
echo :: [EchoOptions] -> Shell String -> Shell ()
echo opts str = do
            str <- str
            liftIO $ if elem NoNewLine opts
                then putStr str
                else putStrLn str