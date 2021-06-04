{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
import           System.FilePath
import           Test.Tasty
import           Test.Tasty.Golden    (findByExtension, goldenVsString)


main :: IO ()
main = defaultMain =<< do
  input_files <- findByExtension [".input"] "."

  return $ testGroup "Golden tests" $ do
    input_file <- input_files
    let golden_file = replaceExtension input_file "expected"
    return $ goldenVsString input_file golden_file $ function_under_test input_file

function_under_test :: FilePath -> IO LByteString
function_under_test file = undefined
