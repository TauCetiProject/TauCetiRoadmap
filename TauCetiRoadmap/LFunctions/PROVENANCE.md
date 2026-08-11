# L-functions: provenance and ecosystem notes

This file supports [`README.md`](README.md), which is the normative roadmap. Everything here is
dated context: source revisions, nearby formalizations, licensing, and corrections learned while
the roadmap was developed.
This file is explicitly non-normative: no roadmap milestone or dependency depends on it.

## Source revision and retained history

The retained roadmap branch was refactored from
`a070739ff7c026723e1ef67477fe206dfdf28455` on 2026-08-10. That revision is the exact source for
the completed-L-function record, normalization translation, Poisson/theta programme, Dedekind and
Hecke targets, Grossencharacter conventions, regression examples, and corrections summarized
below. The branch history before that commit remains the provenance of those targets.

The refactoring changed ownership, not the mathematical source:

- generic ideal weights, norm regrouping, Euler products, density, Abel/Perron summation, Landau,
  Wiener--Ikehara, and generic prime-counting transfer were extracted to
  `ArithmeticDirichletSeries`;
- Frobenius prime sets, cyclotomic crossing, fixed-field reduction, Chebotarev density, Frobenius
  von Mangoldt coefficients, and qualitative Chebotarev counting were extracted to `Chebotarev`;
- moduli, ray classes, ray-class characters, and the Hecke-character carrier are now consumed from
  `GlobalNumberFields`;
- zero-distribution promises were removed in favour of exact exports to `ZerosOfLFunctions`;
- Artin representations, local reciprocal polynomials, conductors, Brauer induction, and Artin
  L-functions were moved to the future `ArtinRepresentations` roadmap after the coefficient
  carrier audit described below.

No code from those extracted sections is an independent prerequisite of this roadmap. Their new
owners provide named contracts.

## Ecosystem snapshot

Audit date: **2026-08-07**. The project pinned Mathlib at
`9caeba1000ef8f302920981f4a08651d325abc81` (2026-06-03).

At that pin Mathlib contained the `LSeries` and abstract functional-equation libraries, completed
Riemann zeta, Hurwitz zeta, continued Dirichlet-character L-functions, gamma factors, Euler-product
infrastructure, and Roblot's real one-sided Dedekind-zeta residue theorem. It did not contain a
general completed-L-function record, continuation or a functional equation for Dedekind zeta, or
analytic Hecke or Grossencharacter L-functions.

Relevant post-pin work at the audit date included:

- Mathlib #41329, which recast the strong abstract functional equation around
  `IsStrongFEPair`;
- Mathlib #41097, logarithms of Euler products;
- Mathlib #40735 at `ba5cc46884`, the idele class group;
- Mathlib #40736 at `0355daa48a`, Thomas Browning's formal Hecke-character L-function carrier;
- Mathlib #41765 at `7478e24828`, the number-field Dirichlet-density predicate.

The latter three informed carrier vocabulary but supplied no continuation or functional equation
used as a hidden premise here. Global Number Fields owns the Tau Ceti Hecke-character carrier.

## Corrections preserved from the source roadmap

These corrections are mathematically load-bearing and remain acceptance tests after the ownership
split.

### Completed-function data

- Regularity away from a polar divisor is `AnalyticAt`, not merely
  `0 ≤ meromorphicOrderAt`; punctured-germ order does not determine the value of a total function.
- A non-self-dual functional equation names a complete dual card, not just a conjugated function.
- Degree is determined by gamma data and is not implied by Dirichlet-series agreement.
- Arithmetic-to-analytic gamma shifts move by `+w/2`; the completion acquires the forced factor
  `N^(-w/4)`. Weight zero cannot detect the sign, so the weight-12 discriminant form is retained as
  a regression.
- Coefficient zero is a junk slot for Mathlib's `LSeries`; cross-construction card comparisons use
  `EqOffZero` while comparing every other field.

### Ideal lattices and theta transformations

- The Euclidean dual of a mixed-embedded ideal is the image of its trace dual under the map that
  is the identity at real places and `z ↦ 2 conj z` at complex places.
- One complex coordinate has real determinant `-4`, not `2`; the absolute determinant is
  `4^r₂`. The field `ℚ(i)` with its self-dual Euclidean lattice is the smallest check.

### Finite-order and general Hecke characters

- A primitive conductor is an arithmetic invariant. Primitivity is an argument of each primitive
  completion and card; an imprimitive presentation retains only its L-series and finite
  Euler-factor correction.
- The odd character modulo `4`, the even quadratic character modulo `5`, and the principal
  character at a nontrivial modulus are concrete constructed examples, not conditional examples.
- A Grossencharacter compatibility law cannot multiply a unitary ideal factor by a nonunitary
  archimedean factor.
- If `χ = χ_unit N^σ`, then the convergence boundary is `Re s = 1+σ`, the full completion is
  defined by recentering at `s-σ`, and the functional equation reflects against `χ⁻¹`, not merely
  `conj χ`.
- Root numbers satisfy `W(χ⁻¹)=W(χ)⁻¹`. The square twist in the `3-4-1` argument has three cases;
  when it is trivial, the zeta pole is essential and cannot be cancelled away.
- The infinity type relates to the real shift and angular exponents, not to parity alone.
- A vertical norm twist carries the two conductor constants forced by the completion and has poles
  at `iu` and `1+iu`.

### Artin boundary correction

The source roadmap tried to send an arbitrary finite-dimensional Artin representation to
`ArithmeticDirichletSeries.IdealWeight`. That carrier is completely multiplicative. General Artin
coefficients are only multiplicative on coprime ideals, and their prime-power coefficients come
from reciprocal local polynomials. For the two-dimensional trivial representation the local
factor `(1-T)⁻²` gives coefficients `a(𝔭)=2` and `a(𝔭²)=3`, whereas complete multiplicativity
would force `a(𝔭²)=4`.

The general Artin layer was therefore removed rather than weakening the degree-one character
carrier. Its reviewed local-factor, conductor, formalism, Brauer-induction, continuation, and
regression-test plans remain accounted for at source commit
`a070739ff7c026723e1ef67477fe206dfdf28455` in the internal portfolio migration records. A future
`ArtinRepresentations` roadmap must introduce coprime-multiplicative coefficients with independent
prime-power local data and may consume this roadmap's completed-function record.

Corrections specific to Frobenius fibre coefficients, tagged Chebotarev fibres, and density
normalization are recorded by the Chebotarev roadmap, their present owner.

## Prior art and coordination

The L-series design follows David Loeffler and Michael Stoll's Mathlib work and their paper
*Formalizing zeta and L-functions in Lean*. Dedekind-zeta arithmetic continues Xavier Roblot's
`NumberField.dedekindZeta` and ideal-counting work. The Hecke carrier vocabulary was compared with
Thomas Browning's Mathlib #40735 and #40736.

PrimeNumberTheoremAnd (Alex Kontorovich and collaborators) contains a sorry-free
Wiener--Ikehara theorem. That theorem is now cited by Arithmetic Dirichlet Series, not by this
roadmap. The external Chebotarev developments `CBirkbeck/AINTLIB` and
`CBirkbeck/chebotarev-density` are cited by the Chebotarev roadmap.

## Licence and contact ledger

| Source | Revision at audit | Licence | Material informing this roadmap | Coordination status |
| --- | --- | --- | --- | --- |
| Mathlib | `9caeba1000ef8f302920981f4a08651d325abc81` | Apache-2.0 | L-series, gamma factors, Riemann and Dirichlet L-functions, Dedekind residue | public upstream work |
| Mathlib #40735 | `ba5cc46884` | Apache-2.0 | idele-class vocabulary | open upstream PR at audit |
| Mathlib #40736 | `0355daa48a` | Apache-2.0 | formal Hecke-character local factors | open upstream PR at audit |
| TauCetiRoadmap retained L-functions branch | `a070739ff7c026723e1ef67477fe206dfdf28455` | repository licence | all retained roadmap text and regression corrections | same repository and author history |

Books and papers are mathematical references only. No prose or code is copied from them.

## Non-normative implementation map

A plausible file order is:

```text
Data/Basic
Data/Normalization
Theta/Poisson
Theta/NumberField
DedekindZeta/Partial
DedekindZeta/Continuation
Dirichlet/Completed
Hecke/FiniteOrder
Hecke/Grossencharacter
Hecke/Nonvanishing
```

The map is organizational only. The mathematical milestones and ownership boundaries in the
README are authoritative.
