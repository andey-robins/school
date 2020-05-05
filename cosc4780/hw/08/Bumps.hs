-- James Caldwell                                    `
--  University of Wyoming, Department of Computer Science, Laramie WY
--  COSC 4780 -- Principles of Programming Languages.
--  Copyright 2019, 2020
--
--  Code for Chapter 7 of Hans Huttel's Transitions and Trees:
--  An Introduction to Structural Operational Semantics, Cambridge
--  Press, 2010
--

module Bumps where

-- We use the static scoping rules for procedure calls.

--------------------------------------------------------------------------------
-- We use Maps to represent Stores and Environments.
--------------------------------------------------------------------------------
import Data.Map.Strict hiding ((!))

-- (!) :: a -> Map a b -> Stm -> Env -> Sto -> b
(m ! x) stm env sto = case (m !? x) of
                     Just x -> x
                     Nothing -> error ("Bad lookup: evaluating " ++ show stm ++ "\n"
                                       ++ "looking for " ++ (show x) ++ " in " ++ (show m) ++ "\n"
                                       ++ (show env) ++ "\n"
                                       ++ (show sto))


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


data BExp = Equals  AExp   AExp
          | GreaterThan AExp AExp
          | Not BExp
          | BExpParen BExp
          | And BExp BExp
 deriving (Show, Eq)

--------------------------------------------------------------------------------
-- Statements and Declarations
--------------------------------------------------------------------------------


data CallType = CBR | CBV | CBN deriving (Eq, Show  )

--               ref : x        name : x      val : x
data Arg = Pointer String | Aexp AExp  deriving Show

-- Note: we use lists of declarations in the Begin construct as
-- oppose to Huttel's presentation which uses a sequence of Var
-- Declaraions and then a sequence of Proc declarions.

data Stm =   Assign String AExp
           | Skip
           | Seq Stm Stm
           | IfTheElse BExp Stm Stm
           | While BExp Stm
           | Begin Decl Stm
           | Call String Arg  -- reference -- call p(x)

  deriving (Show)

-- We great simplify declarations by combining them into one syntactic
-- class - without loss of expressivity.  Also, we add a ";" (Compose)
-- operators that eliminates the different uses of semicolons in the
-- Decl and Stm languages. CallType allows us to fold all the
-- different kinds of parameter passing mechanisms into one program.

data Decl = VarD String AExp | Proc String CallType String Stm | DSemi Decl Decl | DEmpty deriving Show


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
   where loc = ((s ! nextLoc) Skip env0 s)
         s1 = insert loc 0 s
         s2 = insert nextLoc (loc + 1) s1
         s3 = insert maxStoreSize (max (loc + 1) ((s!maxStoreSize) Skip env0 s)) s2

s1 `resizedAs` s2 = insert nextLoc k s1
    where k = (s2!nextLoc) Skip env0 s1



--------------------------------------------------------------------------------
-- Variable and Procedure environments as a record of type Env
--------------------------------------------------------------------------------
data Env = Env { var :: Map String Loc,
                 proc :: Map String (CallType, String, Stm, Env)} deriving Show

-- an empty (initial) environment
env0 = Env { var = empty, proc = empty}


apEnv op1 op2 env1 env2 = Env {var = (var env1) `op1` (var env2),
                               proc = (proc env1) `op2` (proc env2)}


unionE :: Env -> Env -> Env
unionE = apEnv union union



--------------------------------------------------------------------------------
-- Big Step Semantics for AExp
--------------------------------------------------------------------------------

big_step_a :: Env -> Sto -> AExp -> Int
big_step_a env sto (V x) = (sto!(((var env)!x) Skip env sto)) Skip env0 sto
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
big_step_stm env (s @(Assign x a, sto))  = insert (((var env)!x) s env sto) (big_step_a env sto a) sto
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

big_step_stm env (stm @ (Call p arg, sto)) =
     let (cty, x, body, env') = (((proc env)!p) stm env sto) in
       case (cty, arg) of
         (CBR, Pointer y) -> let l = (((var env)!y) stm env sto)
                                 env'' = env{var = (insert x l (var env')) `union` (var env)}
                             in
                               big_step_stm env'' (body, sto)

         (CBV, Aexp a1) -> let (l, sto''') = alloc sto
                               v = big_step_a env sto a1
                               env'' = env{var = insert x l (var env') `union` (var env)}
                               sto'' = big_step_stm env'' (body, insert l v sto''')
                           in
                             sto'' `resizedAs` sto

         (CBN, Aexp a1) -> let vars = x : (vars_a a1) ++ (vars_s body)
                               (body',_) = subst_stm (x,a1) body vars
                               env'' = env{var = (var env') `union` (var env)}
                           in
                             big_step_stm env'' (body', sto)

         _ -> error ("big_step_stm: call "
                      ++ p
                      ++ "("
                      ++ (show arg)
                      ++ ")"
                      ++ " -- called as "
                      ++ (show cty)
                      ++ ".")

--
-- So we currently have everything except for jensen_device_value.txt and jensen_device.txt and name_clash.txt
--

--------------------------------------------------------------------------------
-- big step semantics for variable and procedure declarations
--------------------------------------------------------------------------------

big_step_Decl :: (Decl, Env, Sto) -> (Env, Sto)

big_step_Decl ((VarD x a1), env, sto) = (env', sto')
   where v = big_step_a env sto a1
         (l, sto'') = alloc sto
         env' = env {var = insert x l empty}
         sto' = insert l v sto''

big_step_Decl ((Proc p ct x s), env, sto) = (env', sto)
   where env' = env {proc = insert p (ct, x, s, env) empty}

big_step_Decl ((d1 `DSemi` d2), env, sto) = (env2 `unionE` env1, sto2)
   where (env1, sto1) = big_step_Decl (d1, env, sto)
         (env2, sto2) = big_step_Decl (d2, env1, sto1)

big_step_Decl (DEmpty, env, sto) = (env, sto)

--------------------------------------------------------------------------------
-- Substitution for call-by-name
--------------------------------------------------------------------------------
vars_a :: AExp -> [String]
vars_a (V y) = [y]
vars_a (Num _) = []
vars_a (Plus a1 a2)  = (vars_a  a1) ++ (vars_a  a2)
vars_a  (Mult a1 a2)  = (vars_a  a1) ++ (vars_a  a2)
vars_a  (Minus a1 a2)  = (vars_a  a1) ++ (vars_a  a2)
vars_a  (Div a1 a2)  = (vars_a  a1) ++ (vars_a  a2)
vars_a  (AExpParen a1)  =  (vars_a  a1)

subst_a :: (String, AExp) -> AExp ->  AExp
subst_a (x, a) (V y)  = if x == y then (AExpParen a) else (V y)
subst_a (x, a) (Num j)  = Num j
subst_a (x, a) (Plus a1 a2)  = Plus (subst_a (x,a) a1) (subst_a (x,a) a2)
subst_a (x, a) (Mult a1 a2)  = Mult (subst_a (x,a) a1) (subst_a (x,a) a2)
subst_a (x, a) (Minus a1 a2)  = Minus (subst_a (x,a) a1) (subst_a (x,a) a2)
subst_a (x, a) (Div a1 a2)  = Div (subst_a (x,a) a1) (subst_a (x,a) a2)
subst_a (x, a) (AExpParen a1)  =AExpParen (subst_a (x,a) a1)

--------------------------------------------------------------------------------
-- Substitution for BExp
--------------------------------------------------------------------------------

vars_b :: BExp -> [String]
vars_b (Equals a1 a2) = (vars_a a1) ++ (vars_a a2)
vars_b (GreaterThan a1 a2) = (vars_a a1) ++ (vars_a a2)
vars_b (Not b) = (vars_b b)
vars_b (And b1 b2) = (vars_b b1) ++ (vars_b b2)
vars_b (BExpParen b) = (vars_b b)

subst_b :: (String, AExp) -> BExp -> BExp
subst_b (x, a) (Equals a1 a2) = Equals (subst_a (x, a) a1) (subst_a (x, a) a2)
subst_b (x, a) (GreaterThan a1 a2) = GreaterThan (subst_a (x, a) a1)   (subst_a (x, a) a2)
subst_b (x, a) (Not b) = Not (subst_b (x, a) b)
subst_b (x, a) (And b1 b2) = And (subst_b (x, a) b1)(subst_b (x, a) b2)
subst_b (x, a) (BExpParen b) = BExpParen (subst_b (x, a) b)

--------------------------------------------------------------------------------
-- Substitution for Statements, DeclV, and DeclP
--------------------------------------------------------------------------------

vars_s :: Stm -> [String]
vars_s  (Assign y a1) = y : (vars_a a1)
vars_s  (Skip)  =  []
vars_s  (Seq s1 s2)  = (vars_s s1) ++ (vars_s s2)
vars_s  (IfTheElse b s1 s2)  = (vars_b  b) ++ (vars_s s1) ++ (vars_s s2)
vars_s  (While b s)  = (vars_b  b) ++ (vars_s s)
vars_s  (Begin d s)  = (vars_d d) ++ (vars_s s)
vars_s  (Call p (Aexp a1))  = (vars_a a1)
vars_s  (Call p (Pointer y))  = [y]

subst_stm :: (String, AExp) -> Stm -> [String] -> (Stm, [String])
subst_stm (x, a) (Assign y a1) vars  = (Assign y (subst_a (x,a) a1), vars)
subst_stm (x, a) (Skip) vars =  (Skip, vars)
subst_stm (x, a) (Seq s1 s2) vars = (Seq s1' s2', vars')
  where(s1',vars'') = (subst_stm (x, a) s1 vars)
       (s2', vars') = (subst_stm (x, a) s2 vars)
subst_stm (x, a) (IfTheElse b s1 s2) vars = (IfTheElse (subst_b (x, a) b) s1' s2', vars')
  where (s1', vars'') = subst_stm (x, a) s1 vars
        (s2', vars') = subst_stm (x, a) s2 vars''
subst_stm (x, a) (While b s) vars = (While (subst_b (x, a) b) s', vars')
  where (s',vars') = subst_stm (x, a) s vars
subst_stm (x, a) (Begin d s) vars = (Begin d' s', vars')
  where (d',vars'') = subst_decl (x, a) d vars
        (s',vars') = subst_stm (x, a) s vars''
subst_stm (x, a) (Call p (Aexp a1)) vars = (Call p (Aexp a'), vars)
  where  a' = subst_a (x, a) a1
subst_stm (x, a) (Call p (Pointer y)) vars = (Call p (Pointer y), vars)

--------------------------------------------------------------------------------
-- big step semantics for variable and procedure declarations
--------------------------------------------------------------------------------

fresh x xs = if x `elem` xs then fresh (x ++ "'") xs else x

vars_d :: Decl ->  [String]
vars_d (VarD x a1) = x : (vars_a a1)
vars_d (Proc _ _ x s) = x : (vars_s s)
vars_d (d1 `DSemi` d2) = (vars_d d1) ++ (vars_d d2)

subst_decl :: (String, AExp) -> Decl -> [String] -> (Decl, [String])

subst_decl (y, a) (VarD x a1) vars =
  if x == y then
    let z = fresh "z" vars
        a1' = subst_a (y, a1) a1  in
      (VarD z a1', (z: vars))
  else
    let a1' = subst_a (y, a) a1   in
      (VarD x a1', vars)

subst_decl (y, a) (Proc p CBN x s) vars =
  if (x == y) then
    (Proc p CBN y s, vars)
  else
    let(s', vars') = subst_stm (y, a) s vars in
      (Proc p CBN x s', vars')


subst_decl (y, a) (Proc p cty x s) vars =
  if (x == y) then
    (Proc p cty x s, vars)
  else
    let(s',vars') = subst_stm (y, a) s vars in
      (Proc p cty x s', vars')

subst_decl (y, a) (d1 `DSemi` d2) vars = (d1' `DSemi` d2', vars')
   where (d1', vars'') = subst_decl (y, a) d1 vars
         (d2', vars') = subst_decl (y, a) d2 vars''

subst_decl (y, a) DEmpty vars = (DEmpty, vars)
