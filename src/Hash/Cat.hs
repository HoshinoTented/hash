module Hash.Cat (
    cat
  , cat'
  , CatOptions(..)
) where

import Hash.Shell

data CatOptions
--    deriving (Show, Eq)

cat' = flip cat []

cat :: FilePath -> [CatOptions] -> Shell String
cat path opts = do
    path' <- relativePath path

    liftIO $ readFile path'
