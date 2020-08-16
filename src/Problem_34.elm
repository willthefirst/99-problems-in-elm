module Problem_34 exposing (..)
-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p34.html

import Html
import List

coprime :  Int -> Int -> Bool
coprime a b = 
    gcd a b == 1


gcd : Int -> Int -> Int 
gcd a b =
    if b == 0 then  
        abs a
    else
        gcd b (modBy b a)

totient :  Int -> Int
totient n = 
    List.length <| List.filter (\x -> coprime n x) (List.range 1 n)

main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            n ->
                "Your implementation failed " ++ (Debug.toString n) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ totient 10 == 4
            , totient 25 == 20
            , totient 120 == 32
            , totient 0 == 0
            , totient 1600 == 640
            , totient 37 == 36
            , totient 330 == 80
            , totient 65934 == 19440
            , totient 1313 == 1200
            , totient 45 == 24
            , totient -23 == 0
            ]