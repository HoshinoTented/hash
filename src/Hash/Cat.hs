module Hash.Cat (
    cat
  , CatOptions(..)
) where

import Hash.Shell

data CatOptions = Help
    deriving (Show, Eq)

cat :: FilePath -> [CatOptions] -> Shell String
cat path opts = do
    if elem Help opts
        then return "Usage: cat <FILE> [OPTIONS]\n\
                    \  -h --help    Show help document"
        else do
            path' <- relativePath path

            liftIO $ readFile path'
