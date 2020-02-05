{-# LANGUAGE TypeSynonymInstances, FlexibleInstances, UndecidableInstances #-}

module Hash.Cpp.Standard (
  module Data.IORef
, Cin
, Cout
, Cerr
, ToString
, OutStream
, cin'
, cout'
, cerr'
, cin
, cout
, cerr
, endl
, (<<)
, (>>)
) where

import System.IO
import Data.IORef
import Debug.Trace
import Prelude hiding ((>>))

newtype Cin = Cin Handle
newtype Cout = Cout Handle
newtype Cerr = Cerr Handle

class ToString a where
    toString :: a -> IO String

class FromString a where
    fromString :: String -> a

class OutStream a where
    (<<) :: (ToString s) => IO a -> s -> IO a

class InStream a where
    (>>) :: (FromString s) => IO a -> IORef s -> IO a

instance ToString String where
    toString = return

instance (ToString a) => ToString (IORef a) where
    toString ref = do
        str <- readIORef ref
        toString str

instance ToString Int where
    toString = return . show

instance FromString String where
    fromString s = read $ "\"" ++ s ++ "\""

instance (Read r) => FromString r where
    fromString = read

instance OutStream Cout where
    cout << str = do
        (Cout handle) <- cout
        s <- toString str
        hPutStr handle s

        return (Cout handle)

instance InStream Cin where
    cin >> ref = do
        (Cin handle) <- cin
        next <- readNext [] handle
        writeIORef ref (fromString next)

        return (Cin handle)
        where
            readNext :: String -> Handle -> IO String
            readNext tmp handle = do
                ifEOF <- hIsEOF handle

                if ifEOF
                    then return $ reverse tmp
                    else do
                        char <- hGetChar handle

                        if char == ' ' || char == '\n'
                            then return $ reverse tmp
                            else readNext (char:tmp) handle

cin' :: Cin
cin' = Cin stdin

cout' :: Cout
cout' = Cout stdout

cerr' :: Cerr
cerr' = Cerr stderr

cin :: IO Cin
cin = return cin'

cout :: IO Cout
cout = return cout'

cerr :: IO Cerr
cerr = return cerr'

endl :: String
endl = "\n"