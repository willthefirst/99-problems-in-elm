module Problem_68a exposing (..)
-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p68a.html

import Html
import List

type Tree a
    = Empty
    | Node a (Tree a) (Tree a)


preorder : Tree a -> List a
preorder tree =
    case tree of
        Empty ->
            []
        Node a ->


main =
    Html.text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all ((==) True)
      [ preorder Empty == []
      , preorder tree67 == ['a', 'b', 'd', 'e', 'c', 'f', 'g'] 
    --   , preorder tree68 == (List.range 1 9) 
    --   , preorder tree69 == [6, 2, 1, 4, 3, 5, 7] 
      ]


tree67 = 
    Node 'a'
        (Node 'b'
            (Node 'd' Empty Empty)
            (Node 'e' Empty Empty))
        (Node 'c' 
            Empty 
            (Node 'f' 
                (Node 'g' Empty Empty) 
                Empty))

tree68 = 
    Node 1
        (Node 2
            (Node 3 Empty Empty)
            (Node 4 Empty Empty))
        (Node 5 
            Empty 
            (Node 6 
                (Node 7 
                    Empty 
                    (Node 8 
                        (Node 9 Empty Empty) 
                        Empty))
                Empty))

tree69 = 
    Node 6
        (Node 2
            (Node 1 Empty Empty)
            (Node 4 
                (Node 3 Empty Empty) 
                (Node 5 Empty Empty)))
        (Node 7 Empty Empty)