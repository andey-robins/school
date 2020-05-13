-- James Caldwell                                    `
--  University of Wyoming, Department of Computer Science, Laramie WY
--  COSC 4780 -- Principles of Programming Languages.
--  Copyright 2019, 2020
--
--  Code for COSC 4780 Final Exam
--

module Bumps where

-- We use the static scoping rules for procedure calls.

--------------------------------------------------------------------------------
-- We use Haskell Maps to represent Stores and Environments.
--------------------------------------------------------------------------------

import Data.Map.Strict

--------------------------------------------------------------------------------
-- Expression Syntax
--------------------------------------------------------------------------------

data AExp = V String
          | Num Int
          | Plus AExp AExp
          | Mult AExp AExp
          | Minus AExp AExp
          | Div AExp AExp
          | AExpParen AExp
 deriving (Show, Eq)


data BExp = Equals AExp AExp
          | GreaterThan AExp AExp
          | Not BExp
          | BExpParen BExp
          | And BExp BExp
 deriving (Show, Eq)

--------------------------------------------------------------------------------
-- Statements, Arguments, and Declarations
--------------------------------------------------------------------------------

data CallType = CBR | CBV deriving (Eq, Show  )

--                 &x          x
data Arg = Pointer String | Aexp AExp  deriving Show

data Stm =   Assign String AExp
           | Skip
           | Seq Stm Stm
           | IfTheElse BExp Stm Stm
           | While BExp Stm
           | Begin Decl Stm
           | Call String Arg  -- reference -- call p(&x) or call p(a1)
  deriving (Show)

data Decl = VarD String AExp | Proc String CallType String Stm | DSemi Decl Decl | DEmpty deriving Show

--------------------------------------------------------------------------------
-- Locations
--------------------------------------------------------------------------------

type Loc = Int   -- we assume Loc's are >0 except that we reserve two
                 -- special locations nextLoc = (-1) and maxStoreSize
                 -- = (-2).  Please note that Loc and Int are type
                 -- synonyms - they are the same type.

--------------------------------------------------------------------------------
-- Stores
--------------------------------------------------------------------------------

type Sto = Map Loc Int

-- Sto:: (Loc -> Int) -> [Loc] -> Int
-- Sto is the binding that takes a list of Locations and returns their values

-- a couple of special reserved locations in a store,
nextLoc = (-1)       -- nextLoc (-1) ... is the next avaliable
                     -- location to be allocated.
maxStoreSize = (-2)  -- is the maximum extent of the space that has
                     -- ever been allocated in the store.

-- s0 is an empty store with correctly initialized nextLoc and maxStoreSize
s0 :: Sto
s0  = fromList [(nextLoc, 0), (maxStoreSize, 0)]

-- this function returns a (loc,store) pair with loc addressing a new location (initialized to 0) in the new store.
alloc :: Sto -> (Loc,Sto)
alloc s = (loc, s3)
   where loc = s ! nextLoc
         s1 = insert loc 0 s
         s2 = insert nextLoc (loc + 1) s1
         s3 = insert maxStoreSize (max (loc + 1) (s ! maxStoreSize)) s2

-- this bit of code sets (s1 ! nextLoc) to have the value of (s2 !
-- nextLoc).  Good latex notation for this operation is
--           $(s1 \downarrow s2)$.
-- As it turns out, s1 is always larger than s2.

s1 `resizedAs` s2 = insert nextLoc (s2 ! nextLoc)  s1


--------------------------------------------------------------------------------
-- Variable and Procedure environments as a record of type Env
--------------------------------------------------------------------------------
data Env = Env { var :: Map String Loc,
                 proc :: Map String (CallType, String, Stm, Env)} deriving Show

-- an empty (initial) environment
env0 = Env { var = empty, proc = empty}


-- The expression (env1 `unionE` env2) evaluates to a new evironment
-- that looks up in env1 first and then, if not found, looks in env2.
-- This means that (key,value) pairs from env1 take precedence over
-- (key, value) pairs from env2.
--

unionE :: Env -> Env -> Env
env1 `unionE` env2 = Env {var = (var env1) `union` (var env2),
                          proc = (proc env1) `union` (proc env2)}


--------------------------------------------------------------------------------
-- Big Step Semantics for AExp
--------------------------------------------------------------------------------

big_step_a :: Env -> Sto -> AExp -> Int
big_step_a env sto (V x) = sto ! ((var env) ! x)
big_step_a env sto (Num x) = x
big_step_a env sto (Plus a1 a2) = (big_step_a env sto a1) + (big_step_a env sto a2)
big_step_a env sto (Mult a1 a2) = (big_step_a env sto a1) * (big_step_a env sto a2)
big_step_a env sto (Minus a1 a2) = (big_step_a env sto a1) - (big_step_a env sto a2)
big_step_a env sto (Div a1 a2) = (big_step_a env sto a1) `div` (big_step_a env sto a2)
big_step_a env sto (AExpParen a) = (big_step_a env sto a)

--------------------------------------------------------------------------------
-- Big Step Semantics for BExp
--------------------------------------------------------------------------------
big_step_b :: Env -> Sto -> BExp -> Bool
big_step_b env sto (Equals a1 a2) = (big_step_a env sto a1) == (big_step_a env sto a2)
big_step_b env sto (GreaterThan a1 a2) = (big_step_a env sto a1) >  (big_step_a env sto a2)
big_step_b env sto (Not b) = not (big_step_b env sto b)
big_step_b env sto (And b1 b2) = (big_step_b env sto b1) && (big_step_b env sto b2)
big_step_b env sto (BExpParen b) = big_step_b env sto b

--------------------------------------------------------------------------------
-- Big Step Semantics for Statements --
--------------------------------------------------------------------------------

big_step_stm :: Env  -> (Stm,Sto) -> Sto
big_step_stm env (s @ (Assign x a), sto)  = insert ((var env) ! x) (big_step_a env sto a) sto
big_step_stm env (Skip, sto) = sto
big_step_stm env (Seq s1 s2, sto) = big_step_stm env (s2, sto')
       where sto' = big_step_stm env (s1, sto)
big_step_stm env(IfTheElse b s1 s2, sto) =
       case (big_step_b env sto b) of
            True -> big_step_stm env (s1, sto)
            False ->   big_step_stm env (s2, sto)
big_step_stm env (While b s, sto) =
       case (big_step_b env sto b) of
             True -> big_step_stm env (Seq s (While b s), sto)
             False -> sto
big_step_stm env (Begin decl s, sto) = sto'
       where (env1,sto3) = big_step_Decl (decl, env, sto)
             sto2 = big_step_stm (env1 `unionE` env) (s, sto3)
             sto' = sto2 `resizedAs` sto
-- Two rules for call -= one for call by reference (call p (&y)) and one for call by value (call p(a1)).
big_step_stm env (Call p (Pointer y), sto) =
     let (cty, x, body, env') = ((proc env) ! p) in
       case cty of
         CBR -> let l = (var env) ! y
                    env'' = env'{var = (insert x l (var env')) `union` (var env)}
                in
                  big_step_stm env'' (body, sto)
         _ -> error ("big_step_stm: expecting CBR, got" ++ (show cty) ++ ".")

big_step_stm env (Call p (Aexp a1), sto) =
     let (cty, x, body, env') = ((proc env) ! p) in
       case cty of
         CBV -> let (l, sto''') = alloc sto
                    v = big_step_a env sto a1
                    env'' = env'{var = (insert x l (var env')) `union` (var env)}
                    sto'' = big_step_stm env'' (body, insert l v sto''')
                in
                  sto'' `resizedAs` sto
         _ -> error ("big_step_stm: expecting CBV, got" ++ (show cty) ++ ".")


--------------------------------------------------------------------------------
-- big step semantics for variable and procedure declarations
--------------------------------------------------------------------------------

big_step_Decl :: (Decl, Env, Sto) -> (Env, Sto)
-- note the use of the empty map in both the VarD and Proc cases.
big_step_Decl ((VarD x a1), env, sto) = (env', sto')
   where v = big_step_a env sto a1
         (l, sto'') = alloc sto
         env' = env {var = insert x l empty}
         sto' = insert l v sto''
big_step_Decl ((Proc p ct x s), env, sto) = (env', sto)
   where env' = env {proc = insert p (ct, x, s, env) empty}
-- DSemi does not appear in Huttel - here is it's defintion.  It makes
-- the ";" in the syntax a real operator like Seq is in the statem,ent
-- language.
big_step_Decl ((d1 `DSemi` d2), env, sto) = (env2 `unionE` env1, sto2)
   where (env1, sto1) = big_step_Decl (d1, env, sto)
         (env2, sto2) = big_step_Decl (d2, env1, sto1)
-- we need DEmpty (an empty declaration) so that we can implement a
-- Begin statement with no declarations can be implemented.
big_step_Decl (DEmpty, env, sto) = (env, sto)
