{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-partial-type-signatures #-}

module Main where

import Mu.GRpc.Server
import Mu.Server
import Schema

main :: IO ()
main = runGRpcApp msgProtoBuf 8080 server

server :: MonadServer m => SingleServerT i Service m _
server = singleService (method @"SayHello" sayHello)

sayHello :: (MonadServer m) => HelloRequestMessage -> m HelloReplyMessage
sayHello (HelloRequestMessage nm) =
  pure $ HelloReplyMessage ("hi, " <> nm)
