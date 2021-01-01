module Prelude (for, io, module Relude, module Relude.Extra.Map) where

import           Relude
import           Relude.Extra.Map (lookup)

io :: MonadIO m => IO a -> m a
io = liftIO

for :: [a] -> (a -> b) -> [b]
for = flip map
