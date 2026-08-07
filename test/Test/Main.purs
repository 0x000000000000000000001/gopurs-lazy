module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assert)
import Data.Lazy (defer, force)

main :: Effect Unit
main = do
  log "Testing Data.Lazy..."

  let l1 = defer \_ -> 42
  assert $ force l1 == 42

  let l2 = defer \_ -> "hello"
  assert $ force l2 == "hello"

  -- Test functor
  let l3 = map (_ + 1) l1
  assert $ force l3 == 43

  -- Test apply
  let l4 = apply (defer \_ -> \x -> x * 2) l1
  assert $ force l4 == 84

  -- Test bind
  let l5 = bind l1 (\x -> defer \_ -> x + 10)
  assert $ force l5 == 52

  log "All tests passed!"
