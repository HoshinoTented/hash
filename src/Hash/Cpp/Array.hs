module Hash.Cpp.Array (
   IOVector
 , array
 , arrayFromList
 , (^.)
 , (^=)
) where

import qualified Data.Vector.Mutable as MV
import           Data.Vector.Mutable (IOVector)
import           Control.Monad

array :: Int -> IO (IOVector a)
array len = MV.new len

arrayFromList :: [a] -> IO (IOVector a)
arrayFromList list = do
    let len = length list
    arr <- array (len)
    forM_ (zip list [0..len]) (\(elem, index) -> MV.write arr index elem)

    return arr

(^.) :: IOVector a -> Int -> IO a
vec ^. index = MV.read vec index

(^=) :: IOVector a -> (Int, a) -> IO ()
vec ^= (index, value) = MV.write vec index value

size :: IOVector a -> Int
size = MV.length