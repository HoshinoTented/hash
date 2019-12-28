module Hash.Echo (
    echo
  , EchoOptions(..)
) where

import Hash.Shell

data EchoOptions =
    NoNewLine
  | Help
  deriving (Show, Eq)

echo :: Shell String -> [EchoOptions] -> Shell ()
echo str opts = do
    str <- str
    liftIO $ if elem Help opts
        then putStrLn "Usage echo <Shell String> [OPTIONS]\n\
                      \  NoNewLine     do not output the trailing newline\n\
                      \  Help         show help document"
        else if elem NoNewLine opts
            then putStr str
            else putStrLn str