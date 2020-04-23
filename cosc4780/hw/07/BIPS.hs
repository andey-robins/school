-- James Caldwell                                    `
--  University of Wyoming, Department of Computer Science, Laramie WY
--  COSC 4780 -- Principles of Programming Languages.
--  Copyright 2019, 2020
--
--  Base code for Chapter 6 of Hans Huttel's Transitions and Trees:
--  An Introduction to Structural Operational Semantics, Cambridge
--  Press, 2010
--


module BIPs where

--------------------------------------------------------------------------------
-- We use Maps to represent Stores and Environments.
--------------------------------------------------------------------------------
import Data.Map


--------------------------------------------------------------------------------
-- Expression Syntax
--------------------------------------------------------------------------------

data AExp = V String
          | Num Int
          | Plus AExp AExp
          | Mult AExp AExp
          | Minus AExp AExp
          | AExpParen AExp
 deriving (Show, Eq)


data BExp = Equals  AExp   AExp
          | GreaterThan AExp AExp
          | Not BExp
          | BExpParen BExp
          | And BExp BExp
 deriving (Show, Eq)

--------------------------------------------------------------------------------
-- Statements and Declarations
--------------------------------------------------------------------------------

-- Note: we use lists of declarations in the Begin construct as
-- oppose to Huttel's presentation which uses a sequence of Var
-- Declaraions and then a sequence of Proc declarions.


data Stm =   Assign String AExp
           | Skip
           | Seq Stm Stm
           | IfTheElse BExp Stm Stm
           | While BExp Stm
           | Begin [Decl] Stm
           | Call String
  deriving (Show)

-- We great simplify declarations by combining them - without loosing expressivity.

data Decl = VarD String AExp | Proc String Stm deriving Show


--------------------------------------------------------------------------------
-- Locations
--------------------------------------------------------------------------------
type Loc = Int   -- we assume Loc's are >0 except that we reserve two special
                 -- locations nextLoc = (-1) and maxStoreSize = (-2).
                 --

--------------------------------------------------------------------------------
-- Stores
--------------------------------------------------------------------------------

type Sto = Map Loc Int

-- a couple of constants
nextLoc = (-1)         -- location (-1) holds the next avaliable location to allocate.
maxStoreSize = (-2)    -- location (-2) keeps track of the maximum extent of the store allocated so far.

-- s0 is an empty store with correctly initialized nextLoc and maxStoreSize
s0 :: Sto
s0  = fromList [(nextLoc, 0), (maxStoreSize, 0)]

-- this function returns a (loc,store) pair with loc addressing a new location (initialized to 0) in the new store.

alloc :: Sto -> (Loc,Sto)
alloc s = (loc, s3)
   where loc = s!nextLoc
         s1 = insert loc 0 s
         s2 = insert nextLoc (loc + 1) s1
         s3 = insert maxStoreSize (max (loc + 1) (s!maxStoreSize)) s2

--------------------------------------------------------------------------------
-- Variable and Procedure environments as a record of type Env
--------------------------------------------------------------------------------
data Env = Env {var :: Map String Loc, proc :: Map String (Stm, Env)} deriving Show

-- an empty (initial) environment
env0 = Env { var = empty, proc = empty}
stm0 = Skip

--------------------------------------------------------------------------------
-- Big Step Semantics for AExp
--------------------------------------------------------------------------------

big_step_a :: Env -> Sto -> AExp -> Int
big_step_a env sto (V x) = sto ! ((var env) ! x)
big_step_a env sto (Num x) = x
big_step_a env sto (Plus a1 a2) = (big_step_a env sto a1) + (big_step_a env sto a2)
big_step_a env sto (Mult a1 a2) = (big_step_a env sto a1) * (big_step_a env sto a2)
big_step_a env sto (Minus a1 a2) = (big_step_a env sto a1) - (big_step_a env sto a2)
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
-- Big Step Semantics for Statements, DeclV, and DeclP
--------------------------------------------------------------------------------
big_step_stm :: (Stm, Env)  -> ((Stm, Env),Sto) -> Sto
big_step_stm (mStm, env) ((Assign x a, e), sto)  = insert ((var env)!x) (big_step_a env sto a) sto
big_step_stm (mStm, env) ((Skip, e), sto) = sto
big_step_stm (mStm, env) ((Seq s1 s2, e), sto) = big_step_stm (mStm, env) ((s2, e), sto')
       where sto' = big_step_stm (mStm, env) ((s1, e), sto)
big_step_stm (mStm, env) ((IfTheElse b s1 s2, e), sto) =
       case (big_step_b env sto b) of
          True -> big_step_stm (mStm, env) ((s1, e), sto)
          False ->   big_step_stm (mStm, env) ((s2, e), sto)
big_step_stm (mStm, env) ((While b s, e), sto) =
       case (big_step_b env sto b) of
          True -> big_step_stm (mStm, env) ((Seq s (While b s), e), sto)
          False -> sto
big_step_stm (mStm, env) ((Begin decls s, e), sto) = sto'
   where (env',sto''') = big_step_Decls (decls, (mStm, env), sto)
         sto'' = big_step_stm env' ((s, e), sto''')
         sto' = insert nextLoc (sto ! nextLoc) sto''  -- reset sto!nextLoc back to what it was.

big_step_stm (mStm, env) ((Call p, e), sto) = big_step_stm (mStm, env) ((proc env)!p, sto)


--------------------------------------------------------------------------------
-- big step semantics for variable and procedure declarations
--------------------------------------------------------------------------------

big_step_Decls :: ([Decl], (Stm, Env), Sto) -> ((Stm, Env), Sto)
big_step_Decls ([], env, sto) = (env, sto)
big_step_Decls ((VarD x a): more_decls, (mStm, env), sto) = (env', sto')
   where v = big_step_a env sto a
         (l, sto'') = alloc sto
         env'' = env {var = insert x l (var env)}
         (env', sto') = big_step_Decls (more_decls, (mStm, env''), insert l v sto'')

-- proc-bip_bss
big_step_Decls ((Proc p s): more_decls, (mStm, env), sto) = (env',sto')
   where env''  = env {proc = (insert p (s, env) (proc env))}
         (env', sto') = big_step_Decls (more_decls, (mStm, env''), sto)
