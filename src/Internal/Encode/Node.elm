module Internal.Encode.Node exposing (value)

import Internal.Encode.Attribute as Attribute
import Internal.Encode.Style as Style
import Internal.Model.Node exposing (Node(..))
import Internal.Object exposing (Value, float, list, object, string)
import PdfMake.Page exposing (PageBreak(..))


value : Node -> Value
value node =
    object <|
        case node of
            ColumnsNode columns ->
                ( "columns", list <| List.map value columns.columns )
                    :: List.concatMap Attribute.values columns.attrs

            StackNode stack ->
                ( "stack", list <| List.map value stack.stack )
                    :: List.concatMap Attribute.values stack.attrs

            OrderedListNode list_ ->
                ( "ol", list <| List.map value list_.ol )
                    :: List.concatMap Attribute.values list_.attrs

            UnorderedListNode list_ ->
                ( "ul", list <| List.map value list_.ul )
                    :: List.concatMap Attribute.values list_.attrs

            TableNode ->
                [ ( "unimplemented", string "<TableNode>" ) ]

            TextNode text ->
                ( "text", string text.text )
                    :: List.concatMap Attribute.values text.attrs
                    ++ Style.values text.style

            TableOfContentsNode ->
                [ ( "unimplemented", string "<TableOfContentsNode>" ) ]

            ImageSizeNode image ->
                [ ( "image", string image.image )
                , ( "width", float image.width )
                , ( "height", float image.height )
                ]
                    ++ List.concatMap Attribute.values image.attrs

            ImageFitNode image ->
                [ ( "image", string image.image )
                , ( "fit", list [ float image.width, float image.height ] )
                ]
                    ++ List.concatMap Attribute.values image.attrs

            CanvasNode ->
                [ ( "unimplemented", string "<CanvasNode>" ) ]

            ReferenceNode ->
                [ ( "unimplemented", string "<ReferenceNode>" ) ]
