module Problem_15 exposing (..)

-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p15.html

import Html
import List


repeatElements_firstAttempt : Int -> List a -> List a
repeatElements_firstAttempt count list =
    case list of
        [] ->
            []

        x :: xs ->
            if count < 1 then
                []

            else
                x :: List.concat [ repeatElements_firstAttempt (count - 1) [ x ], repeatElements_firstAttempt count xs ]


repeatElements_withRepeat : Int -> List a -> List a
repeatElements_withRepeat count list =
    case list of
        [] ->
            []

        x :: xs ->
            List.repeat count x ++ repeatElements_withRepeat count xs


repeatElements_concatMap : Int -> List a -> List a
repeatElements_concatMap count list =
    case list of
        [] ->
            []

        xs ->
            List.concatMap (\a -> List.repeat count a) xs


repeatElements : Int -> List a -> List a
repeatElements count list =
    case list of
        [] ->
            []

        xs ->
            List.foldr (\x newList -> List.append (List.repeat count x) newList) [] xs


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ Debug.toString x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ repeatElements 2 [ 1, 2, 5, 5, 2, 1 ] == [ 1, 1, 2, 2, 5, 5, 5, 5, 2, 2, 1, 1 ]
            , repeatElements 4 [ 1, 2 ] == [ 1, 1, 1, 1, 2, 2, 2, 2 ]
            , repeatElements 4 [] == []
            , repeatElements 0 [ 1, 2 ] == []
            , repeatElements -1 [ 1, 2 ] == []
            , repeatElements 40 [ 1 ] == [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
            , repeatElements 4 [ "1", "2" ] == [ "1", "1", "1", "1", "2", "2", "2", "2" ]
            ]
