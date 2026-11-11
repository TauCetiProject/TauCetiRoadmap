# Exact penalties with a unit violation gap

## Purpose

Provide a small global exact-penalty API using Mathlib's existing minimization and set vocabulary. The API covers an arbitrary carrier and real-valued functions with a normalized positive violation gap. It has no hidden finiteness, topology, convexity, differentiability or attainment assumption. It does not cover continuous residual penalties without a positive gap, multiplier/error-bound theory, algorithms, QUBO compilation or a whole-thesis port.

## Conventions

Let `D : Set α`, let `P : α → Prop` express feasibility, and let `f,w : α → ℝ`. The feasible set is `F = {x | x ∈ D ∧ P x}`. Fix `B,ρ : ℝ` with:

- `0 ≤ B` and `B < ρ`;
- `w x = 0` for each feasible `x ∈ D`;
- `1 ≤ w x` for each infeasible `x ∈ D`;
- `f x - f y ≤ B` for all `x,y ∈ D`.

The penalized objective is `x ↦ f x + ρ * w x`. Do not introduce a new minimizer predicate or a structure wrapping the one-line range bound. Values outside `D` are unconstrained. A feasibility witness is an explicit premise for asserting that a penalized minimizer is feasible. Native [`IsMinOn`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Order/Filter/Extr.lean#L109) does not include membership of its candidate in the domain.

The unit-gap normalization is deliberate for this scope. General numerical gaps, rescaling and broader ordered scalar types are outside this roadmap. The specified scalar field is ℝ.

## Target 1: comparison, feasibility and minimizer equivalence

1. Prove that every feasible point has strictly smaller penalized objective than every infeasible point in D.
2. If `F.Nonempty`, prove that a penalized `IsMinOn` candidate **belonging to D** satisfies P.
3. Prove the membership- and feasibility-explicit equivalence, for every a:

   `(a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ∧ F.Nonempty)`

   `↔ (a ∈ F ∧ IsMinOn f F a)`.

The nonempty-feasibility conjunction on the left is part of the theorem, including when F is empty. This is not an unconditional equality with the penalized minimizer set on infeasible instances. When F is nonempty it yields the usual equality of the two membership-explicit minimizer sets. It asserts no existence of an optimum: bounded functions on infinite sets can have unattained infima.

The proof compares a feasible y with an infeasible x. Since `f y - f x ≤ B < ρ ≤ ρ*w x`, y wins strictly. On F the two objectives agree. These observations transfer the two minimizer directions.

## Target 2: sharpness and API boundary examples

- On Bool, take D=univ, P(x) iff x=false, f(false)=1, f(true)=0, w(false)=0 and w(true)=1. At B=ρ=1 both penalized values equal one. The infeasible point is a minimizer, so a weak threshold cannot replace the strict one.
- On a nonempty D with P always false, f=0, w=1, B=0 and ρ=1, a penalized minimizer exists and is infeasible. The other numeric premises hold. This explains the feasible-instance guard.
- A native `IsMinOn` comparison over an empty set is vacuous even for a point outside it. Keep membership explicit throughout the API.

These examples clarify the statement and do not count as additional research contributions.

## Dependencies and conventions for implementation

Use Mathlib's existing sets, real arithmetic, `IsMinOn` and `isMinOn_iff`.
These APIs are supplied by
`Mathlib.Basic.Real.Basic`, `Mathlib.Order.Filter.Extr` and
`Mathlib.Tactic.Linarith`. The minimization comparison and real ordered-field
arithmetic supply the prerequisites for Target 1; Target 2 uses finite Boolean
examples and the empty set. Neither target depends on an unimplemented roadmap
milestone or on a graph encoding.

Keep domain membership explicit alongside native `IsMinOn`. Use the existing set
intersection/predicate vocabulary for F, the explicit objective-difference bound,
and the ordinary function `fun x ↦ f x + ρ * w x`; do not add replacement
minimization predicates or bound structures. The complete scope is real-valued
unit-gap exactness and the boundary examples above. No algorithm, graph adapter,
QUBO compiler, continuous-residual theory, multiplier theory or broader scalar
generalization is a target of this roadmap.

## Secondary provenance

The existing Chapter 10 formalization is source material, not a prescriptive design. In particular, `Chapter10.Algebra.penalty_minimizers_exact` uses a custom minimizer predicate that includes membership. Implement this roadmap with Mathlib's native minimization API and the explicit membership conventions above.

Public source and scope records:

- [Complete retained library at 59c355eb14ed1eff9664736428ca02b4543200b8](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8)
- [Chapter 10 integer/QUBO package at 95f2a288a6c50ea6eaabde90c2515885197796cf](https://github.com/bernalde/routing-penalty-adapters/tree/95f2a288a6c50ea6eaabde90c2515885197796cf)
- [Palomar record PALOMAR-2026-11-08-000006 v1](https://palomar-registry.org/entry.html?id=PALOMAR-2026-11-08-000006&version=1)

The source formalization and this roadmap were prepared with AI assistance under David E. Bernal Neira's direction. The source and registry record establish provenance; they do not claim new mathematical discovery or endorse a particular Tau Ceti API design.
