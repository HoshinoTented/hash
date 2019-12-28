module Hash.Cd where

import Hash.Shell
import System.Directory

cd :: FilePath -> Shell ()
cd path = do
    path' <- relativePath path
    exist <- liftIO $ doesDirectoryExist path'

    if exist
        then put path'
        else fail $ "No Such Directory: " ++ path
