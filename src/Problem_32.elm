module Problem_32 exposing (..)
-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p32.html

import Html
import List
import Maybe


gcd : Int -> Int -> Int
gcd a b =
    case modBy (abs b) a of
        0 -> (abs b)
        remainder -> gcd b remainder


main =
    Html.text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( gcd 36 63, 9 )
        , ( gcd 10 25, 5 )
        , ( gcd 120 120, 120 )
        , ( gcd 2 12, 2 )
        , ( gcd 23 37, 1 )
        , ( gcd 45 330, 15 )
        , ( gcd 24528 65934, 6 )
        , ( gcd 120 -120, 120 )
        , ( gcd -2 12, 2 )
        , ( gcd 37 23, 1 )
        ]