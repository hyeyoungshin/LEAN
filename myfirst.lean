/- 
Lean is an implementation of a logical foundation known as dependent type theory. 

Specifically, it implements a version of dependent type theory known as the 
Calculus of Inductive Constructions. 

Dependent type theory serves as a foundational language, allowing us to describe 
all sorts of objects and prove things about them. The foundational language fixes 
the meaning of the objects we introduce, and the small carefully written kernel 
"type checks" these objects, meaning it ensures the things we prove are correct. 
-/

a#check "hello world!"

inductive nat : Type
| zero : nat
| succ : nat -> nat

def add : nat -> nat -> nat
| m nat.zero     := m
| m (nat.succ n) := nat.succ (add m n)

def double (n : ℕ) : ℕ := n + n

#check (27 + 9) * 33
#check[(1,2), (3,4), (5,6)] ++ [(7,8), (9,10)]

#check double
#print double

/- 
Lean can reason about abstract objects as well as it can reason about concrete 
ones.

Putting the declarations in a `section` delimits their scope. 
-/

section
  variables (G : Type) [group G]
  variables g1 g2 : G

  #check g2^-1 * g1 * g2
end


/-
An important feature of dependent type theory is that every expression has a
computational interpretation, which is to say, there are rules that specify 
how they can be *reduced* to a normal form. 

Moreover, expressions in a computationally pure fragment of the language 
evaluate to values in the way you would expect.

For example, assuming the definition does not depend on nonconstructive 
components in an essential way, every closed term of type ℕ evalutates to a
numeral.
-/

#eval (27+9)*33





