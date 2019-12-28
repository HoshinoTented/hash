module Hash.Path where

import Hash.Shell
import System.Directory

pwd :: Shell FilePath
pwd = get

home :: Shell FilePath
home = liftIO getHomeDirectory