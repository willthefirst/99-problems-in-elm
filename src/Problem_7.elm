module Problem_7 exposing (..)
-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p17.html

import Html exposing (text)
import List 


split : List a -> Int -> (List a, List a)
split list count =
    ((List.take count list), (List.drop count list))


main =
    text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\(result, expect) -> result == expect)
        [ ( split (List.range 1 5) 0, ([], [1, 2, 3, 4, 5]) )
        , ( split (List.range 1 5) 2, ([1, 2], [3, 4, 5]) )
        , ( split (List.range 1 5) 3, ([1, 2, 3], [4, 5]) )
        , ( split (List.range 1 5) 4, ([1, 2, 3, 4], [5]) )
        , ( split (List.range 1 5) 5, ([1, 2, 3, 4, 5], []) )
        , ( split (List.range 1 5) 6, ([1, 2, 3, 4, 5], []) )
        , ( split (List.range 1 5) (-1), ([], [1, 2, 3, 4, 5]) )
        ]
        && List.all (\(result, expect) -> result == expect)
            [ ( split [ "aab", "b", "c", "aa" ] 2, ([ "aab", "b"],["c", "aa" ]))
            ]