module Jelly where

{-
Jelly のテンプレート
-}

import Prelude

import Data.Foldable (traverse_)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Jelly.Aff (awaitBody)
import Jelly.Component (Component, text)
import Jelly.Element as JE
import Jelly.Hooks (runHooks_)
import Jelly.Hydrate (mount)
import Jelly.Prop ((:=))

main :: Effect Unit
main = launchAff_ do
  bodyMaybe <- awaitBody
  liftEffect $ traverse_ (runHooks_ <<< mount component) bodyMaybe

component :: forall m. Component m
component =
  JE.div [ "class" := "w-screen h-screen text-5xl flex justify-center items-center" ] do
    text "Hello Jelly!"
