module Problem_3 exposing (..)
-- https://github.com/wearsunscreen/ninety-nine-elm-problems/blob/master/p/p03.md

import Html         
import List
import Maybe


elementAt : List a -> Int -> Maybe a
elementAt xs n =
    case xs of 
        [] -> Nothing
        (y :: ys) ->
            case n of
                (a < 1) -> Nothing
                1 -> Just y
                x -> 
                    elementAt (List.drop (n - 1) (y :: ys)) 1


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (Debug.toString x) ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ elementAt [ 1, 2, 3, 4 ] 2 == Just 2
            , elementAt [ 1 ] 2 == Nothing
            , elementAt [ 1 ] 1 == Just 1
            , elementAt [] 2 == Nothing
            , elementAt [] (-1) == Nothing
            , elementAt [] 0 == Nothing
            , elementAt [ 1, 2, 3, 4 ] (-1) == Nothing
            -- , elementAt [ 1, 2, 3, 4 ] 0 == Nothing
            -- , elementAt [ 'a', 'b', 'c' ] 2 == Just 'b'
            ]