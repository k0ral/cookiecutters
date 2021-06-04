{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = defaultMain $ testGroup "Unit tests"
  [ unit_test
  ]

unit_test :: TestTree
unit_test = testCase "Test name" $ do
  True @?= True
  False @?= False
