{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
import           Test.QuickCheck.Instances
import           Test.QuickCheck.Modifiers
import           Test.Tasty
import           Test.Tasty.QuickCheck

main :: IO ()
main = defaultMain $ testGroup "Properties"
  [ property
  ]


property :: TestTree
property = testProperty "property name" $ \input -> undefined === undefined
