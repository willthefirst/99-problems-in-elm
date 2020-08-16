module Problem_31 exposing (..)
-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p31.html

import Html

isPrime : Int -> Bool
isPrime n =
    let
        nums = List.range 2 n
    in
        removeCompositeNumbers n nums

removeCompositeNumbers : Int -> List Int -> Bool
removeCompositeNumbers n nums =
    case nums of
        [] -> False
        [x] -> n == x
        x::xs ->
            Debug.log "list" (List.filter (\num -> modBy x num /= 0) xs)
                |> removeCompositeNumbers n

-- Works! but not with big numbers. Need to make some optimizations.

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
        List.filter (\( result, expect ) -> result /= expect)
            [ ( isPrime 7, True )
            -- , ( isPrime 10, False )
            -- , ( isPrime -1, False )
            -- , ( isPrime 1, False )
            -- , ( isPrime 0, False )
            -- , ( isPrime 120, False )
            -- , ( isPrime 2, True )
            -- , ( isPrime 36, False )
            -- , ( isPrime 23, True )
            -- , ( isPrime 6000, False )
            -- , ( isPrime 7919, True )
            -- , ( isPrime 7911, False )
            -- , ( isPrime 63247, True )
            , ( isPrime 63249, False )
            ]
