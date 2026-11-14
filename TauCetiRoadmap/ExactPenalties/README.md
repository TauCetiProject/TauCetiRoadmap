# Roadmap: exact penalties with a unit violation gap

**Summary.** Build a small global exact-penalty API for real-valued functions
whose penalty vanishes on feasible points and has a unit gap elsewhere. Use
Mathlib's native minimization vocabulary, with explicit domain membership and
feasible-instance conditions. The reusable steps are strict comparison,
feasibility of a minimizer, and exact minimizer correspondence.

## Scope and ownership

The carrier and domain are arbitrary. No finiteness, topology, convexity,
differentiability or attainment assumption is implicit. The scope is real-valued
unit-gap exactness with a global objective-difference bound. General numerical
gaps, rescaling, broader scalar types, continuous residual penalties without a
positive gap, multiplier/error-bound theory, algorithms and QUBO compilation
are outside this roadmap.

## Conventions

Let `D : Set α`, let `P : α → Prop` express feasibility, and let
`f,w : α → ℝ`. Write `F = {x | x ∈ D ∧ P x}` and let `B,ρ : ℝ` satisfy:

- `0 ≤ B` and `B < ρ`;
- `w x = 0` for every `x ∈ D` satisfying `P x`;
- `1 ≤ w x` for every `x ∈ D` not satisfying `P x`;
- `f x - f y ≤ B` for every ordered pair `x,y ∈ D`.

The penalized objective is `x ↦ f x + ρ * w x`. Values outside `D` are
unconstrained. Keep membership explicit alongside native `IsMinOn`.

## Exact supplier contracts

### From Mathlib

- [`IsMinOn`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Order/Filter/Extr.lean#L111-L113)
  compares the value at a candidate with every point of a set; it does not
  include membership of that candidate.
- [`isMinOn_iff`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Order/Filter/Extr.lean#L129-L130)
  gives the comparison as `∀ y ∈ D, f a ≤ f y`.
- `Set.Nonempty` supplies a witness belonging to a set. For
  `F = {x | x ∈ D ∧ P x}`, this means `∃ x ∈ D, P x`.
- The ordered-field arithmetic of ℝ supplies multiplication monotonicity and
  the strict and weak order comparisons used below.

These are existing suppliers; no unimplemented roadmap target is required.

## How to read the build

Layer 1 first compares a feasible point with an infeasible point (1.1), then
uses a feasible witness to establish feasibility of a penalized minimizer (1.2),
and combines these with equality of the objectives on the feasible set to obtain
exact minimizer correspondence (1.3). The examples test the strict threshold,
feasible-instance and membership conditions. `Suggested.lean` gives an admitted
signature prototype for the headline 1.3; it is not proof evidence.

## Layer 1: unit-gap penalties

### 1.1 Strict comparison

Prove that every feasible point of `D` has strictly smaller penalized objective
than every infeasible point of `D`.

The proof compares feasible `y` and infeasible `x`: positive `ρ` and the unit gap
give `f y - f x ≤ B < ρ ≤ ρ*w x`, while `w y = 0`.
(Source: abstraction of the comparison in [B21], Proposition 10.B.1, proof,
printed p. 415; [B21] states the finite binary incidence specialization.)

### 1.2 Feasibility of a minimizer

If `F.Nonempty`, prove that a penalized `IsMinOn` candidate belonging to `D`
satisfies `P`. Compare it with a feasible witness using 1.1.
(Source: abstraction of the converse argument in [B21], Proposition 10.B.1,
proof, printed pp. 415–416.)

### 1.3 Exact minimizer correspondence

For every `a`, prove `isMinOn_penalized_iff`:

`(a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ∧ F.Nonempty)`

`↔ (a ∈ F ∧ IsMinOn f F a)`.

On `F` the two objectives agree. Use 1.2 for the forward direction and 1.1
against infeasible competitors for the reverse direction. A feasible minimizer
itself supplies the feasible witness on the left.
(Source: abstraction of [B21], Proposition 10.B.1, statement and proof,
printed pp. 414–416; the explicit bound and unit gap replace its finite
incidence calculation.)

The feasible-instance conjunction is part of the equivalence, including when
`F` is empty. The result asserts no existence of an optimum. When `F` is
nonempty it gives equality of the two membership-explicit minimizer sets.

### Examples

**Checks.**

- On Bool, let `D=univ`, let `P x` mean `x=false`, and take
  `f false=1`, `f true=0`, `w false=0`, `w true=1`. At `B=ρ=1` both penalized
  values equal one. The infeasible point minimizes, so the threshold must be strict.
- On a nonempty domain with `P` always false, `f=0`, `w=1`, `B=0` and `ρ=1`,
  a penalized minimizer exists and is infeasible. The feasible-instance guard
  cannot be removed.
- Let `D={false} ⊆ Bool`, let `P` always hold, let `f false=0`, `f true=-1`,
  and take `w=0`, `B=0`, `ρ=1`. All domain-restricted hypotheses hold and `F`
  is nonempty, yet native `IsMinOn` holds at `true`. Dropping `a ∈ D` would
  admit that outside point.
- A nonvacuous Bool instance with `D=univ`, `P x` meaning `x=false`, `f=0`,
  `w false=0`, `w true=1`, `B=0` and `ρ=1` realizes every hypothesis and a
  feasible penalized minimizer.

### Dependencies

1.1 uses the real-order suppliers and the zero/gap/range assumptions. 1.2 uses
1.1, `isMinOn_iff`, and a witness in `F`. 1.3 uses 1.1–1.2 and equality of the
objectives on `F`. The examples use finite Boolean cases and the same suppliers.

## Downstream consumers

A finite binary model can consume this API after proving its own unit violation
gap and objective-difference bound. A signed-integer squared-residual penalty
and a sum-absolute-cost bound are motivating instances. Their matrix encodings,
fixed-coordinate transport and routing predicates remain separate mathematics;
this roadmap does not specify them or assert their completeness.

## References

[B21] David E. Bernal Neira, *Modern Computational Approaches to Nonlinear
Discrete Optimization and Applications in Process Systems Engineering*, PhD
thesis, Carnegie Mellon University, May 2021. Chapter 10, Appendix 10.B,
Proposition 10.B.1, printed pp. 414–416. This is the finite incidence source of
the proof argument; the arbitrary-domain statement above is its explicit
unit-gap/range-bound abstraction, not a quotation of the thesis proposition.

The [existing minimizer proof](https://github.com/bernalde/routing-penalty-adapters/blob/95f2a288a6c50ea6eaabde90c2515885197796cf/Chapter10IntegerPenalty.lean#L32)
uses a custom predicate that includes membership. This roadmap uses Mathlib's
native API and the explicit membership conventions above.

- [Complete retained library at 59c355eb14ed1eff9664736428ca02b4543200b8](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8)
- [Chapter 10 integer/QUBO package at 95f2a288a6c50ea6eaabde90c2515885197796cf](https://github.com/bernalde/routing-penalty-adapters/tree/95f2a288a6c50ea6eaabde90c2515885197796cf)
- [Palomar record PALOMAR-2026-11-08-000006 v1](https://palomar-registry.org/entry.html?id=PALOMAR-2026-11-08-000006&version=1)

[H21] Stuart Harwood, Claudio Gambella, Dimitar Trenev, Andrea Simonetto,
David Bernal and Donny Greenberg, *Formulating and Solving Routing Problems
on Quantum Computers*, IEEE Transactions on Quantum Engineering 2 (2021),
article 3100117, [doi:10.1109/TQE.2021.3049230](https://doi.org/10.1109/TQE.2021.3049230).
Appendix B, Proposition 1, PDF pp. 16–17 gives the corresponding finite
Boolean-incidence penalty statement and feasible/infeasible comparison proof.

[L14] Andrew Lucas, *Ising formulations of many NP problems*, Frontiers in
Physics 2 (2014), article 5, [doi:10.3389/fphy.2014.00005](https://doi.org/10.3389/fphy.2014.00005).
Sections 3 and 4.1 provide binary linear-program and exact-cover penalty context;
the explicit unit-gap and objective-difference hypotheses above fix this
roadmap's precise scope.

[G22] Marcos Díez García, Mayowa Ayodele and Alberto Moraglio, *Exact and
sequential penalty weights in quadratic unconstrained binary optimisation with
a digital annealer*, GECCO Companion (2022), 184–187,
[doi:10.1145/3520304.3528925](https://doi.org/10.1145/3520304.3528925).
Sections 2–3 give related finite-QUBO unit-gap and objective-range conditions.
