module Problem_1 exposing (..)
-- https://github.com/wearsunscreen/ninety-nine-elm-problems/blob/master/p/p01.md


import Html
import List
import Maybe


last : List a -> Maybe a
last xs =
    case xs of
        [] -> Nothing
        nums -> nums
                |> List.reverse
                |> List.head 

main : Html.Html a
main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (Debug.toString x) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ last (List.range 1 4) == Just 4
            , last [ 1 ] == Just 1
            , last [] == Nothing
            , last [ 'a', 'b', 'c' ] == Just 'c'
            ]