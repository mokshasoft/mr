{-
   Copyright 2020, Mokshasoft AB (mokshasoft.com)

   This software may be distributed and modified according to the terms of
   the GNU General Public License v3.0. Note that NO WARRANTY is provided.
   See "LICENSE" for details.
-}


module Lines exposing (chart)

import Analysis as A
import Color
import DataTypes exposing (..)
import Dict as D
import Gen.Data as Data
import Html
import LineChart
import LineChart.Dots as Dots
import List as L
import Maybe as M



-- DATA TYPES


type alias Selection =
    { country : String
    , year : Int
    }



-- FUNCTIONS


chart : String -> Html.Html msg
chart country =
    let
        analysis =
            A.maxAnalysis (Selection country 2020)
    in
    LineChart.view .x .y analysis.lines
