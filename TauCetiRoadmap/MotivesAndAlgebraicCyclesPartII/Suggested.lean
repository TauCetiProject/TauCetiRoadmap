module

import Mathlib

/-!
# Algebraic cycles, pure and mixed motives, Part II: Berkovich motives: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test:
it states, against the pinned Mathlib and Tau Ceti, those headline theorems of the roadmap that
are statable at the pins.

None of the headline theorems is statable at the pins, so this file states nothing. Every one of
them is a statement about the stable ∞-categories `Deff_mot(X)` and `Dmot(X)` of motivic sheaves
on small arc-stacks, about motivic K-theory `Kmot`, or about integral étale motives, and the pinned
libraries lack the carriers these are built from: the Berkovich spectrum of a Banach ring, the
arc-site of Banach rings and its arc-sheafification, presentable stable ∞-categories of
(hyper)sheaves of complexes or spectra on a site, formal inversion of an object in a presentably
symmetric monoidal ∞-category, and the algebraic K-theory spectrum of a ring. Mathlib has
quasicategories (`SSet.Quasicategory`) and Grothendieck topologies but none of these
constructions; Tau Ceti adds none of them.

The headline theorems, with what each lacks:

* Cancellation (README §5.3): for every small arc-stack `X`, `− ⊗ ℤ(1)` is fully faithful on
  `Deff_mot(X)`. Lacks the arc-site of Banach rings, `Dfin` and `Deff_mot` as ∞-categories, and
  the Tate object.
* Motivic K-theory (README §§6.1, 6.3): `Kmot` is finitary and
  `Kmot ⊗ ℚ ≃ ⊕_{n≥0} ℚ(n)[2n]`, split by Adams eigenvalues. Lacks the K-theory spectrum of a ring,
  sheaves of spectra on the arc-site and the spectral ball localization.
* Explicit motivic K-theory (README §7.6): on a nondiscrete algebraically closed nonarchimedean
  field `C` of residue-characteristic exponent `p`, `Kmot(C) ≃ cofib(K(C_{<1}) → K(C))[1/p]`.
  Lacks nonunital K-theory spectra and `Kmot`.
* Torsion and tilting comparisons (README §§4.8, 4.9, 8.3). Lacks `Dfin`, its étale subcategory
  `Det` (README §1.8), `Deff_mot` and `Dmot`.
* Six operations and proper base change (README §§8.5, 9.4). Lacks `Dmot` and six-functor
  formalisms.
* Rigidity (README §§9.1, 9.6): `Dmot(C)` is compactly generated with compact objects the
  dualizable ones at a geometric point, and `Dmot(Marc(A))` is rigid for analytic `A` of finite
  cohomological dimension. Lacks `Dmot` and rigid presentable ∞-categories.
* Comparison with étale motives (README §10.6): `DM_et(k, ℤ) ≃ Dmot(k)` for an algebraically
  closed discrete field `k`. Lacks both categories.
* Monodromy equivalence (README §11.8): over the completed algebraic closure `C` of
  `𝔽̄_p((T))`, `Dmot(C)` is equivalent to pairs `(A, N)` with `A ∈ Dmot(𝔽̄_p)` and
  `N : A → A ⊗ ℚ(−1)` locally nilpotent. Lacks `Dmot` and the motivic Galois stacks.
* Overconvergent comparison (README §12.3): prime-to-`p` torsion motives on `a′^* X` are the
  overconvergent étale sheaves on a small v-stack `X`. Lacks small v-stacks, their étale derived
  ∞-categories `D_ét`, and `Det` and `Dmot` of arc-stacks.
-/

namespace TauCetiRoadmap.MotivesAndAlgebraicCyclesPartII

end TauCetiRoadmap.MotivesAndAlgebraicCyclesPartII
