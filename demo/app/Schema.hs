{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Schema where

import Data.Text as T
import GHC.Generics
import Mu.Quasi.GRpc
import Mu.Schema

grpc "TheSchema" id "demo.proto"

data HelloRequestMessage = HelloRequestMessage {name :: T.Text}
  deriving
    ( Eq,
      Show,
      Generic,
      ToSchema TheSchema "HelloRequest",
      FromSchema TheSchema "HelloRequest"
    )

data HelloReplyMessage = HelloReplyMessage {message :: T.Text}
  deriving
    ( Eq,
      Show,
      Generic,
      ToSchema TheSchema "HelloReply",
      FromSchema TheSchema "HelloReply"
    )
