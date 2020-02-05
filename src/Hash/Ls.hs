module Hash.Ls (
    ls
  , ls'
  , l
  , LsOptions
) where

import Hash.Shell
import Hash.Path
import System.Directory

data LsOptions
--    deriving (Show, Eq)

l = ls' "."

ls' = ls []

{-|
Usage: ls [OPTIONS] <FilePath>
-}
ls :: [LsOptions] -> FilePath -> Shell [FilePath]
ls opts path = do
    path' <- relativePath path

    liftIO $ getDirectoryContents path'