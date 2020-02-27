-- James Caldwell
--   University of Wyoming, Department of Computer Science, Laramie WY
--   COSC 4780 -- Principles of Programming Languages.
--   Copyright 2020
--
-- base code for Chapters 3 and 4 of Hans Huttel's Transitions and Trees: An Introduction to Structural
-- Operational Semantic, Cambridge Press, 2010
--


module Bims where

data AExp = V String
          | Num Int
          | Plus AExp AExp
          | Mult AExp AExp
          | Minus AExp AExp
          | AParent AExp
 deriving (Read, Show, Eq)


data BExp = Equals  AExp   AExp
          |  GreaterThan AExp AExp
          |  Not BExp
          |  BExpParen BExp
          |  And BExp BExp
 deriving (Read, Show, Eq)

-- Simplified (no variables) Big Step Semantics for AExp (pp. 33)
big_step_a :: AExp -> Int

big_step_a (Num x) = x

big_step_a (Plus a1 a2) = v1 + v2
    where v1 = (big_step_a a1)
          v2 = (big_step_a a2)

big_step_a  (Mult a1 a2) = v1 * v2
    where v1 = (big_step_a a1)
          v2 = (big_step_a a2)


big_step_a  (Minus a1 a2) = v1 - v2
    where v1 = (big_step_a a1)
          v2 = (big_step_a a2)

big_step_a  (AParent a) = (big_step_a a)



-- A type of derivations for Simplified AExp BSS

data BSS_AExp = ANumD (AExp, Int)
               | APlusD (AExp, Int) BSS_AExp BSS_AExp
               | AMultD (AExp, Int) BSS_AExp BSS_AExp
               | AMinusD (AExp, Int) BSS_AExp BSS_AExp
               | AParentD (AExp, Int) BSS_AExp
    deriving (Eq,Show)

concl (ANumD c)  = c
concl (APlusD c _ _) = c
concl (AMultD c _ _) = c
concl (AMinusD c _ _) = c
concl (AParentD c _) = c

value  = snd . concl

prove_a :: AExp -> BSS_AExp

prove_a (Num x) =  ANumD (Num x, x)
prove_a (Plus a1 a2) = APlusD (Plus a1 a2, v) d1 d2
  where d1 = prove_a a1
        d2 = prove_a a2
        v = value d1 +  value d2

prove_a (Mult a1 a2) = AMultD (Mult a1 a2, v) d1 d2
  where d1 = prove_a a1
        d2 = prove_a a2
        v = value d1 * value d2

prove_a (Minus a1 a2) = AMinusD (Minus a1 a2, v) d1 d2
  where d1 = prove_a a1
        d2 = prove_a a2
        v = value d1 - value d2

prove_a (AParent a1) = AParentD (a1, v) d
  where d = prove_a a1
        v = value d

-- big-step-b work
big_step_b :: BExp -> Bool

big_step_b (Equals a1 a2) = (big_step_a a1) == (big_step_a a2)

big_step_b (GreaterThan a1 a2) = (big_step_a a1) > (big_step_a a2)

big_step_b (Not b) = not (big_step_b b)

big_step_b (BExpParen b) = (big_step_b b)

big_step_b (And b1 b2) = (big_step_b b1) && (big_step_b b2)


-- A set of derivations for Big Step Semantic BExpressions

data BSS_BExp = BEqualsD (BExp, Bool) BSS_AExp BSS_AExp
                | BGreaterThanD (BExp, Bool) BSS_AExp BSS_AExp
                | BNotD (BExp, Bool) BSS_BExp
                | BExpParenD (BExp, Bool) BSS_BExp
                | BAndD (BExp, Bool) BSS_BExp BSS_BExp
    deriving (Eq,Show)

prove_b :: BExp -> BSS_BExp

prove_b (Equals a1 a2) = BEqualsD (Equals a1 a2, v) d1 d2
    where d1 = prove_a a1
          d2 = prove_a a2
          v = big_step_b (Equals a1 a2)

prove_b (GreaterThan a1 a2) = BGreaterThanD (GreaterThan a1 a2, v) d1 d2
    where d1 = prove_a a1
          d2 = prove_a a2
          v = big_step_b (GreaterThan a1 a2)

prove_b (Not b) = BNotD (Not b, v) d
    where d = prove_b b
          v = big_step_b (Not b)

prove_b (BExpParen b) = BExpParenD (b, v) d
    where d = prove_b b
          v = big_step_b b

prove_b (And b1 b2) = BAndD (And b1 b2, v) d1 d2
    where d1 = prove_b b1
          d2 = prove_b b2
          v = big_step_b (And b1 b2)
