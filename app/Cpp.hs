{-# LANGUAGE ScopedTypeVariables #-}

module Cpp where

import Prelude hiding ((>>))
import Hash.Cpp.Standard
import Hash.Cpp.Loop
import Hash.Cpp.Reference
import Hash.Cpp.Array
import Debug.Trace
import Data.Functor ((<&>))

main :: IO Int
main = do {
    arr :: IOVector Int <- arrayFromList [1, 2, 3, 4, 5];
    i <- var 0;

    while (get i <&> (< 5)) $ do {
        e <- (arr ^.) =<< get i;

        cout << e << endl;

        i += 1;
    };

    return 0;
}