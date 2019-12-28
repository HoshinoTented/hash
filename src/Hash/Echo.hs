module Hash.Echo (
    echo
  , echo'
  , EchoOptions(..)
) where

import Hash.Shell

data EchoOptions =
    NoNewLine
  deriving (Show, Eq)

echo' = flip echo []

echo :: Shell String -> [EchoOptions] -> Shell ()
echo str opts = do
            str <- str
            liftIO $ if elem NoNewLine opts
                then putStr str
                else putStrLn str