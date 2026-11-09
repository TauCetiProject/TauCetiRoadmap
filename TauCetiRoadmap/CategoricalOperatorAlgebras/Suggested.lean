/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Categorical operator algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti. None of them is statable at the pins, so the
file declares nothing. Mathlib has native categories, monoidal categories, `MonObj`,
`EndMonoidal`, `HalfBraiding`, `Center`, rigid categories, monoidal actions with their linear
functors, module and bimodule objects with the bicategory `Bimod.monBicategory`, `CStarModule`,
`VonNeumannAlgebra` and completely positive maps, and Tau Ceti has pivotal structures with their
traces, the universal grading group, the twist of a braided pivotal category, free modules and the
rigid, pivotal and abelian structures of the Drinfeld centre, but neither has a dagger category,
C*-category or W*-category, and the headline theorems are statements about those. Each headline
and the carrier it lacks:

* CA2a, the canonical bijections between pseudounitary pivotal structures, unitary dual functors
  and positive characters of the universal grading groupoid (Penneys, Theorem A): no
  C*-category, so no unitary multitensor category and no unitary dual functor, and no grading
  groupoid for a nonsimple unit (Tau Ceti's universal grading group is its one-object case).
* CA2b, the equivalence between shaded planar C*-algebras with finite-dimensional boxes and
  triples `(C, ∨, X)` (Penneys, Theorem C): no planar operad or planar algebra, and no unitary
  multitensor category.
* CA3, Q-system completeness of `QSys(C)`, the equivalence "complete iff every Q-system splits",
  `QSys(QSys(C)) ≃ QSys(C)` and the realization biequivalence with unital C*-algebras and right
  correspondences: no C*-bicategory, and no bicategory of C*-correspondences (Mathlib's
  `CStarModule` has no interior tensor product).
* CA4, compact connected W*-algebra objects equivalent to unit-isometric irreducible Q-systems:
  no W*-category and no category `Hilb(C)` of Hilbert-space objects.
* CA5, connected internal W*-objects equivalent to extremal irreducible discrete inclusions
  supported on `H(C)`: no II₁ factor, no faithful normal conditional expectation and no bifinite
  bimodule category.
* CA6, unitary anchored planar algebras equivalent to pointed unitary pivotal `V`-module
  multitensor categories: no anchored planar operad and no unitary braided pivotal category.
* CA7, the six-term sequence of `O_X` for every C*-correspondence X (Katsura, Theorem 8.6) and
  `K₀(S(Λ,μ)) ≅ ℤ^(V)`, `K₁(S(Λ,μ)) = 0`: no operator K-theory and no Cuntz–Pimsner algebra.
* CA8, the canonical planar C*-towers: weak closures II₁ factors of Jones index `δ²`,
  pairwise strong Morita equivalence of the `A_k` (and `A_(n,±) ∼ A_(n+1,∓)` in the shaded
  towers), `A₀` simple, uniquely tracial and of stable rank one, `K₀(A_k) ≅ ⊕_(v ∈ VΓ) ℤ` with
  `K₁(A_k) = 0`, the positive cone `K₀(A₀)^+` and scale `Σ(A₀)` given by the trace, Watatani
  index `δ²` and Pimsner–Popa bases of `N(δ²)` elements: no planar algebra, Jones or Watatani
  index, imprimitivity bimodule or strong Morita equivalence of C*-algebras, or operator
  K-theory.
* CA9, the biequivalence between von Neumann algebras with normal correspondences and complete
  W*-categories, existence of fully faithful representations of a unitary fusion category in
  every hyperfinite factor not of type I and their uniqueness in types II and III₁, and the
  factor case of Tomatsu's Theorem D: no W*-category, no normal correspondence or Connes fusion,
  and no hyperfinite factor.
* CA10, the bijection between conjugacy classes of finite-depth real objects in a fusion
  commutant and connected finite-depth unitary anchored planar algebras in `Z(C)^rev`: no
  bicommutant category and no anchored planar algebra.
-/

namespace TauCetiRoadmap.CategoricalOperatorAlgebras

end TauCetiRoadmap.CategoricalOperatorAlgebras
