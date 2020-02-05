module Hash.Cpp.Reference where

import Data.IORef
import Data.STRef

a += b = modifyIORef a (+b)
a -= b = modifyIORef a (subtract b)
a *= b = modifyIORef a (*b)

var = newIORef
get = readIORef
set = writeIORef

varE = newSTRef
getE = readSTRef
setE = writeSTRef