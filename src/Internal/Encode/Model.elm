module Internal.Encode.Model exposing (value)

import Internal.Encode.Node as Node
import Internal.Encode.Page as Page
import Internal.Encode.Style as Style
import Internal.Model exposing (Model)
import Internal.Object exposing (Value, list, object)
import PdfMake.Page exposing (PageOrientation(..))


value : Model -> Value
value model =
    object
        [ ( "pageSize", Page.pageSize model.pageSize )
        , ( "pageOrientation", Page.pageOrientation <| Maybe.withDefault Portrait model.pageOrientation )
        , ( "pageMargins", Page.pageMargins <| Maybe.withDefault ( 1, 1, 1, 1 ) model.pageMargins )
        , ( "content", list <| List.map Node.value model.content )
        , ( "defaultStyle", Style.value <| Maybe.withDefault [] model.defaultStyle )
        ]
