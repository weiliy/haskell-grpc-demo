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

-- import Data.Text as T
-- import GHC.Generics

import Mu.Quasi.GRpc
import Mu.Schema

grpc "TheSchema" id "demo.proto"

-- A. Map to Haskell types
-- data Message
--   = Message { ... }
--   deriving ( Eq, Show, Generic
--            , ToSchema   TheSchema "Message"
--            , FromSchema TheSchema "Message" )

-- B. Use optics
type Message = Term TheSchema (TheSchema :/: "Message")
