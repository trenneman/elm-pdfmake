module PdfMake.Table exposing
    ( TableCell
    , TableWidth
    , align
    , autoWidth
    , border
    , cell
    , cellColor
    , cell_
    , colSpan
    , emptyCell
    , fillWidth
    , rowSpan
    , width
    )

import Color
import Internal.Encode exposing (dpi)
import Internal.Encode.Color as ColorEnc
import Internal.Encode.Node as Node
import Internal.Model.Node as Model exposing (Node(..), TableAttribute(..), TableCell(..), TableWidth(..))
import PdfMake.Page exposing (TextAlignment)


type alias TableWidth =
    Model.TableWidth


type alias TableCell layout image =
    Model.TableCell layout image


align : TextAlignment -> TableAttribute
align =
    Alignment


autoWidth : TableWidth
autoWidth =
    Auto


border : { left : Bool, top : Bool, right : Bool, bottom : Bool } -> TableAttribute
border =
    Border


cell : List TableAttribute -> Node layout image -> TableCell layout image
cell =
    Cell


cell_ : String -> TableCell layout image
cell_ text =
    Cell [] <|
        TextNode
            { text = text
            , style = []
            , attrs = []
            }


colSpan : Int -> TableAttribute
colSpan =
    ColSpan


emptyCell : TableCell layout image
emptyCell =
    EmptyCell


fillWidth : TableWidth
fillWidth =
    Fill


cellColor : Color.Color -> TableAttribute
cellColor =
    CellColor


rowSpan : Int -> TableAttribute
rowSpan =
    RowSpan


width : Float -> TableWidth
width =
    Inch
