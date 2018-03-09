module PdfMake.Table
    exposing
        ( Width
        , align
        , autoWidth
        , border
        , cell
        , cell_
        , colSpan
        , emptyCell
        , fillColor
        , fillWidth
        , rowSpan
        , width
        )

import Color
import Internal.Model.Node exposing (Node(TextNode), TableAttribute(..), TableCell(..))
import Internal.Model.Table as Table exposing (Width(..))
import PdfMake.Page exposing (TextAlignment)


type alias Width =
    Table.Width


align : TextAlignment -> TableAttribute
align =
    Alignment


autoWidth : Width
autoWidth =
    Auto


border : ( Bool, Bool, Bool, Bool ) -> TableAttribute
border =
    Border


cell : List TableAttribute -> Node -> TableCell
cell =
    Cell


cell_ : String -> TableCell
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


emptyCell : TableCell
emptyCell =
    EmptyCell


fillWidth : Width
fillWidth =
    Fill


fillColor : Color.Color -> TableAttribute
fillColor =
    FillColor


rowSpan : Int -> TableAttribute
rowSpan =
    RowSpan


width : Float -> Width
width =
    Inch