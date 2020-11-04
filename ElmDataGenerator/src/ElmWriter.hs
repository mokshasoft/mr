{-
   Copyright 2020, Mokshasoft AB (mokshasoft.com)

   This software may be distributed and modified according to the terms of
   the GNU General Public License v3.0. Note that NO WARRANTY is provided.
   See "LICENSE" for details.
-}


module ElmWriter
    ( record2ElmData
    ) where

import Parser (Record)

data YearData = YearData
  { total :: Int
  , week  :: [Int]
  } deriving Show

data Country = Country
  { country :: String
  , year    :: [YearData]
  } deriving Show

{-
type alias YearData =
    { nbr : List Int
    }


type alias Year =
    { total : Int
    , data : YearData
    }


type alias Country =
    { name : String
    , data : D.Dict Int Year
    }
-}

genHeader :: String
genHeader =
  "{-\n\
  \    Copyright 2020, Mokshasoft AB (mokshasoft.com)\n\
  \\n\
  \    This software may be distributed and modified according to the terms of\n\
  \    the GNU General Public License v3.0. Note that NO WARRANTY is provided.\n\
  \    See \"LICENSE\" for details.\n\
  \-}\n\
  \\n\
  \\n\
  \module Gen.Data exposing (countries, defaultCountry)\n\
  \\n\
  \import DataTypes exposing (..)\n\
  \import Dict as D\n\
  \import List as L\n"


record2ElmData :: [Record] -> IO ()
record2ElmData rs = do
  putStrLn genHeader
  putStrLn $ show rs
