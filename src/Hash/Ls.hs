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

ls' = flip ls []

ls :: FilePath -> [LsOptions] -> Shell [FilePath]
ls path opts = do
    path' <- relativePath path

    liftIO $ getDirectoryContents path'