module BinaryTree where


-- | Declaring Binary Tree Data type

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

-- | Insert data into binary tree. If data is greater than the current node it goes to right else left.
-- | Leaf being the empty tree case.
insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
    | a == b = (Node left a right)
    | a < b  = (Node left a (insert' b right))
    | a > b  = (Node (insert' b left) a right )

-- | Map function for binary tree

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree f Leaf                = Leaf
mapTree f (Node left a right) = (Node (mapTree f left) (f a) (mapTree f right))

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected :: BinaryTree Integer -> BinaryTree Integer
mapExpected = mapTree (+1)

-- | Convert Binary tree to List

preOrder :: BinaryTree Integer -> [Integer]
preOrder Leaf =  []
preOrder (Node left a right) = a : (preOrder left) ++ (preOrder right)

inOrder :: BinaryTree Integer -> [Integer]
inOrder Leaf = []
inOrder (Node left a right) = (inOrder left) ++ [a] ++ (inOrder right)

testPreOrder :: IO ()
testPreOrder = if preOrder testTree' == [1,3,4] then putStrLn "Hurreeyy sucess" else putStrLn  "No luck!"

-- | fold function for binary tree. any traversal would be fine.

foldTree :: (a -> b -> b) -> BinaryTree a -> b -> b
foldTree f Leaf b  =  b
foldTree f (Node left a right) b = 
    let leftb = foldTree f left b 
        nodeb = f a leftb 
    in foldTree f right nodeb 