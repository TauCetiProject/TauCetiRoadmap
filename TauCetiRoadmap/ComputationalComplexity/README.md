# Roadmap: Computational Complexity Theory

This file lays out a roadmap for the formalization of basic computational complexity theory
based on Turing Machines that operate over binary strings. 
It focuses on complexity classes derived from polynomial time functions computed by Turing machines. By this, I mean not just the class `P` but also classes derived from `P` that can be stated without reference to space or computations that take superpolynomial time, or to other computational models. 

For example, `NP` would be covered, because it can be stated in terms of a polynomial-time witness verifying operation, 
but `EXP` would not be covered because it doesn't use polynomial time, `PSPACE` would not be covered because it references space, and `P/Poly` would not be covered because it references circuits.

This should be suitable task for AI, because while the descriptions of low-level Turing machines can be painful for a human to write, often the reasoning behind why such machines work is fairly simple, and so it should be possible for an AI to grind through the definition of many such machines, perhaps reaching the point where a human who wants to build on top of the development can begin to ignore the very lowest level of details and just use the API that the AI provides.

## Relevant prior work

Some relevant prior work in other languages is ["Mechanising Complexity Theory: The Cook-Levin
Theorem in Coq" by Gähler and Kunze](https://drops.dagstuhl.de/storage/00lipics/lipics-vol193-itp2021/LIPIcs.ITP.2021.20/LIPIcs.ITP.2021.20.pdf) or [this work in Isabelle by Balbach](https://isa-afp.org/browser_info/current/AFP/Cook_Levin/document.pdf). My sense of these works is that they often require a lot of casework / construction of low-level TMs to carry out certain tasks. My hope with this roadmap is that it might be possible to handle these tasks using AI, so that we can start working on higher level tasks once all of that is complete.

## Framework and preexisting material: Binary strings

Existing formalizations of computability theory or complexity theory in `/Mathlib/Computability/TuringMachine` or `/Cslib/Computability/Machines/Turing/SingleTape` tend to provide machines that operate over an arbitrary finite alphabet. This proposal, however, suggests using a specialized machine definition that operates over binary strings (i.e. `List Bool`) as its input and output type. The reasoning for this is that it is generally considered that alphabet choice does not affect most questions in complexity theory, and so it will perhaps be simpler to avoid the need to repeatedly include `variable` statements to specify the alphabet.

Suggested Lean forms for the definitions and milestones below are collected in
[`Suggested.lean`](Suggested.lean); the prose here is definitive.

In order to do this, it will be necessary to encode types as binary strings. This
development should do so using a typeclass `BitstringEncoding` (see `Suggested.lean`)
similar to Mathlib's `Computability.Encoding`, carrying an `encode : α → List Bool`, a
partial `decode : List Bool → Option α`, and a proof that decoding is a left inverse of
encoding.

The concept here is that, even though different references might construct encodings for a type in different ways, these ways should all be polynomial-time transcodable to each other, so it does not matter too much how we encode a type, as long as it is consistent and somewhat sensible.

We can then derive this class in a variety of ways:

1. Subtypes can be encoded as their base types. In general, encodings can be lifted through injections.
2. Composite types (Like `Prod`, `List`) can be encoded using a self-delimiting transformation that takes a `List Bool` and converts it to a format where it can be parsed as part of a larger block with information about where the delimitation starts and ends. This delimitation operation (see `delimit : List Bool → List Bool` in `Suggested.lean`) can then be applied to each suubcomponent.
3. Disjunctive type constructors (Like `Sum`, `Option`, `Bool`) can be encoded by having a prefix representing which case we are in, followed by the encoding of any additional information for that value (or a list of delimited pieces of information).
4. `Nat`s can be encoded in binary. Other numeric types like `Int`, `Rat`, can then be derived using principles above (Ints as disjunctively either negative, zero, or positive, and `Rat`s as a subtype of pair of an `Int` and `Nat`)
5. `Finset` and `Multisets` can be injectively converted to `List`s by sorting the encodings of the elements lexicographically, and then encoded through this injection.
6. Finite graphs can be encoded as a natural number to represent number of vertices, paired with a list of edges represented as pairs of vertices.
7. Constraint satisfaction problem instances can be represented as graphs or hypergraphs with additional data

## Construction of low-level Polynomial time Turing Machines

Once this class and the derivations are defined, we can write a definition `IsPolyTime` (see `Suggested.lean`) for
polynomial-time computability of a function `f : α → β` between `BitstringEncoding` types: it
asserts that some bitstring-encoded machine computes `f` within a polynomial step bound,
built on Mathlib's `Turing.TM2ComputableInPolyTime` specialized to the `Bool` alphabet.

Once this is in place, we can prove several facts about polynomial time computability of various encoding operations:

- For the types and type constructors above, their constructors and eliminators are often preserve polynomial time, in the sense that if the functional arguments are poly time, then the function that results from currying the non-functional arguments will also be poly time. Such functions should be proven polytime before proceeding as a checkpoint.
  - For example `Option.elim (x : Option α) (b : β) (f : α → β) : β`. If `f` is polytime, then a Turing machine to compute `fun (x, b) => Option.elim x b f` is also polynomial time. It can decode the pair, determine the case of `x`, and then either return `b` or operate `f` on `x`.
  - An exception is `List.foldl : {α : Type u} {β : Type v} (f : α → β → α) (init : α) : List β → α`, 
  If `f` doubles the length of the encoded `α`, it may run in exponential time in the length of the input list.
- Reassociation of pairs is polynomial time.

## Complexity Theory Basics

With this framework in place, we can start to define the basics of complexity theory. A
decision problem `BitstringDecisionProblem` is a predicate `Bitstring → Bool`, and a
`ComplexityClass` is a `Set BitstringDecisionProblem` (both in `Suggested.lean`).

And we can proceed to define a number of complexity classes:

- `P` as the set of decision problems decidable in polynomial time by a deterministic
  Turing machine.
- `∃ᴾ C`, the set of decision problems that can be decided using polynomially long
  membership witnesses over `C`.
- `∀ᴾ C`, the set of decision problems that can be decided using polynomially long
  non-membership witnesses over `C`.
- `NP` as `∃ᴾ P`
- `coNP` as `∀ᴾ P`
- `Σᴾ n` and `Πᴾ n` as the `n`th levels of the polynomial time hierarchy, defined inductively as
  `Σᴾ 0 = P`, `Σᴾ (n + 1) = ∃ᴾ (Πᴾ n)`, and `Πᴾ n = (Σᴾ n).complement`.
- `PH` as the union of all levels of the polynomial time hierarchy.
- A family of probabilistic classes `Prob a b` defined in terms of error rates for members and non-members.
  - `BPP` with two-sided error below `1/3`.
  - `RP` with one-sided error below `1/3` for members and 0 error for non-members.
  - `coRP` with one-sided error below `1/3` for non-members and 0 error for members.
  - `PP` with two-sided error below `1/2`.
- `ZPP` as the intersection of `RP` and `coRP`.
- `AM`/`AM[k]` and `MA`, the classes defined by [Arthur Merlin Protocols](https://en.wikipedia.org/wiki/Arthur%E2%80%93Merlin_protocol)

We can also define the notion of a complimentary class, being the class consisting of complements of decision problems from another class.

## Basic inclusions and identifications

We can then prove basic inclusions among these. The ["Complexity Zoo"](https://complexityzoo.net/Petting_Zoo) is a good reference for this.

* P is contained in NP, coNP, and BPP, by virtue of being able to make a trivial witness and ignore it.
* Changing the `1/3` constants in the definition of `BPP` is equivalent to any separated nonzero contstant error bounds.
* RP and coRP are contained in BPP because weakening the error requirements broadens the class.
* RP is the complimentary class to coRP, as defined above.
* NP is the complimentary class to coNP, as defined above.

## NP-Completeness, Cook-Levin, and the Karp Problems

With these definitions in place, we can define polynomial time many-one reductions between decision problems 
as polynomial time functions that preserve membership in the problem.
We can then define [NP Hardness](https://en.wikipedia.org/wiki/NP-hardness) as the class of problems that any problem in NP is reducible to,
and [NP-Completeness](https://en.wikipedia.org/wiki/NP-completeness) as the intersection of this class with NP.
We can then prove the [Cook-Levin theorem](https://en.wikipedia.org/wiki/Cook%E2%80%93Levin_theorem), 
and from there prove the NP-completeness of [the 21 Karp problems](https://en.wikipedia.org/wiki/Karp%27s_21_NP-complete_problems) by constructing the reductions.

## Advanced inclusions and separations

Once basic infrastructure on classes has been established, we can proceed to more advanced theorems:

- [Ladner's theorem](https://en.wikipedia.org/wiki/NP-intermediate)
- [Schaefer's dichotomy theorem](https://en.wikipedia.org/wiki/Schaefer%27s_dichotomy_theorem)
- The [Sipser-Lautemann theorem](https://en.wikipedia.org/wiki/Sipser%E2%80%93Lautemann_theorem), BPP is contained in `Πᴾ 2`/`Σᴾ 2`
- `NP` and `BPP` are contained in `MA`, which is contained in `AM`, which is contained in `Πᴾ 2`

## References

- [The Complexity Zoo: Petting Zoo](https://complexityzoo.net/Petting_Zoo)