{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
import           Test.QuickCheck.Instances
import           Test.QuickCheck.Modifiers
import           Test.Tasty
import           Test.Tasty.QuickCheck

main :: IO ()
main = defaultMain $ testGroup "Properties"
  [ property1
  ]


property1 :: TestTree
property1 = testProperty "property name" $ True === True
