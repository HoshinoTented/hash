module Hash.Shell (
    module Control.Monad.State
  , sh
  , relativePath
  , Shell
) where

import Control.Monad.State
import System.FilePath.Posix

type Shell = StateT FilePath IO

sh :: FilePath -> Shell a -> IO (a, FilePath)
sh = flip runStateT

relativePath :: FilePath -> Shell FilePath
relativePath path = (</> path) <$> get