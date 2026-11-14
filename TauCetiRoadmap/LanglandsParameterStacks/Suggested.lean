import Mathlib

/-!
# Parameter stacks, invariant theory and spectral coefficients: target signatures

The roadmap is `README.md`; this file is not the roadmap. This is its headline acceptance
test: it states the headline theorems against the pinned Mathlib and Tau Ceti APIs whenever
their carriers are available. API lists and Checks belong to the README.

At the dependency revisions locked by this repository's `lake-manifest.json`, none of the
headline theorems is statable. They lack the following objects:

* Layer 0: the trivial-centre theorem for the local Weil group in odd residue characteristic
  (0.7) needs the local Weil-group carrier of ClassFieldTheory layer 9, which is not available
  at these revisions. Finite wild ramification of every condensed L-parameter (0.3), the condensed extension
  comparison (0.4), and restriction of enhanced wild parameters (0.9) need the local Weil
  group with its condensed coefficient and finite-wild parameter interfaces, the relatively
  discrete coefficient functor, and classical admissible parameters with their enhancement
  groups.
* Layer 1: complete-intersection representability (1.5), derived classicality (1.9), cotangent
  duality (1.10–1.11), the Lie-invariant and coadjoint zero-fibre comparison (1.12),
  the Weil–Deligne comparison (1.15), and singular-support theorems (1.16–1.18) need finite-wild cocycle schemes, condensed Weil cochains, animated parameter
  stacks and their full cotangent complexes, coadjoint invariant quotients of reductive
  group schemes, and coherent-complex support theory.
* Layer 2: classification of coarse geometric points by semisimple parameters (2.6,
  Fargues–Scholze, Proposition VIII.3.2) needs cocycle schemes and algebraic complete reducibility
  for the L-group. The derived free-cocycle presentation (2.8) needs animated cocycle algebras.
  The abstract excursion centre map (2.15, Theorem VIII.4.1) needs the excursion algebra and
  coherent categorical Hecke data.
* Layer 3: generalized reductive reconstruction (3.3), the continuous semisimple character
  bijections (3.6, Proposition VIII.3.8), and parameters of Schur objects (3.9) need
  invariant-family pseudocharacters, semisimple parameter moduli and the categorical excursion
  action, together with the relatively discrete Weil-continuity convention.
* Layer 4: the good-filtration theorems (4.1), solvable fixed-group theorems (4.14–4.18),
  wild gerbe elimination (4.21) and tame reduction (4.22) need highest-weight modules and
  rational algebraic-group cohomology, as well as enhanced perfect categories of classifying
  and mapping stacks.
* Layer 5: the integral equivariant excursion comparison and invariant base change (5.1–5.2)
  need the cocycle algebra as an object of the stable infinity-category `Ind Perf(BĤ)` and its
  derived rational invariants.
* Layer 6: perfect generation (6.2) and the module comparison (6.3), Fargues–Scholze,
  Theorem VIII.5.1, need perfect complexes on parameter quotient stacks, their Ind-completions
  and module objects in `Ind Perf(BĤ)`.

Mathlib's semidirect products, matrix representations, coaction equalizers and category centres,
and Tau Ceti's reductive groups over fields and ordinary continuous cohomology, do not supply
these missing objects. None of these gaps is a definition of a few lines on the existing carriers.
-/

namespace TauCetiRoadmap.LanglandsParameterStacks


end TauCetiRoadmap.LanglandsParameterStacks
