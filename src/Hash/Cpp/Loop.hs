module Hash.Cpp.Loop (
  while
) where

import Control.Monad.Primitive

while :: (PrimMonad m) => m Bool -> m () -> m ()
while cond block = do
    condition <- cond

    if condition
        then do
            block
            while cond block
        else return ()