module Hash.Cat (
    cat
  , cat'
  , CatOptions(..)
) where

import Hash.Shell

data CatOptions
--    deriving (Show, Eq)

cat' = cat []

{-|
Usage: cat [OPTIONS] <FilePath>
-}
cat :: [CatOptions] -> FilePath -> Shell String
cat opts path = do
    path' <- relativePath path

    liftIO $ readFile path'
