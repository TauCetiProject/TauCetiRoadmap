module

public import Mathlib
public import TauCeti.Algebra.CentralSimple.Index
public import TauCeti.Algebra.BrauerGroup.Group
public import TauCeti.Algebra.BrauerGroup.BaseChange
public import TauCeti.LinearAlgebra.QuadraticForm.TotallyIsotropic

/-!
# Period and index on real surfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the one
definition they need (`HasZeroTotalSignature`).

Conventions. The function field of an integral surface over `ℝ` is a field `K` with
`Algebra.EssFiniteType ℝ K` and `Algebra.trdeg ℝ K = 2`; `K` is nonreal when `¬ IsSemireal K`
(for a smooth projective model `S` of `K` this is `S(ℝ) = ∅`). The upper bound of Theorem 0.12
and the isotropy statements behind Theorems 0.10 and 0.13 hold for every field of the given
transcendence degree over `ℝ` and are stated without finite generation. The period of a central
simple `K`-algebra `A` is `orderOf (TauCeti.BrauerGroup.mk A)` in Tau Ceti's group structure on
Mathlib's `BrauerGroup`, and its index is `TauCeti.Algebra.index K A`; quantifying over all `A`
quantifies over all Brauer classes. The coefficient fields `k` and `R` of the first two
statements may live in a universe other than that of `K`.

Headline theorems stated here (B19 = Benoist, *The period-index problem for real surfaces*,
Publ. Math. IHÉS 130 (2019)):

* de Jong's theorem in characteristic zero (README §2.9), `index_eq_orderOf_of_isAlgClosed`;
* the norm bound over real closed fields (§2.10), `index_dvd_two_mul_orderOf_of_isRealClosed`;
* Theorem 0.3 (§7.4), `index_eq_orderOf_of_not_isSemireal`;
* Theorem 0.4 in its birational form (§7.6), `index_eq_orderOf_of_forall_isRealClosed`;
* Theorem 0.12 (§§7.8, 7.10), `not_anisotropic_of_hasZeroTotalSignature` and
  `exists_anisotropic_hasZeroTotalSignature`;
* Theorem 0.10 (§7.11), `not_anisotropic_of_not_isSemireal`;
* the pair-of-quadrics theorem behind Theorem 0.13 (§7.13), `exists_common_zero_of_not_isSemireal`.

Headline theorems not statable at the pins:

* Theorem 0.4 in its scheme form (classes of `Br(U)` on a smooth real surface `U` vanishing at
  every real point): Mathlib and Tau Ceti have no Brauer group of a scheme and no evaluation of a
  Brauer class at a real point. Its birational form above is equivalent (README §7.6).
* Theorem 0.5 (the topological criterion `ind = per` or `ind = 2 per` for `α ∈ Br(S)`): it needs
  `Br(S)`, the Borel equivariant cohomology `H²_G(S(ℂ), 𝔽₂)`, the real Kummer sequence and the
  canonical real-locus components `[ξ]₁ ∈ H¹(S(ℝ), 𝔽₂)`, none of which is at the pins.
* Theorem 0.6 (real Enriques surfaces with `ind ≠ per`): it needs real Enriques surfaces, the
  halves of their real locus, `w₁` of the real locus and `Br(S)`; none is at the pins.
* Proposition 0.7 (a K3 surface over the real Puiseux field with `H¹(S(K), 𝔽₂) = 0` and a class of
  `Br(S)[2]` of index 4): it needs K3 surfaces, semialgebraic cohomology over a non-archimedean
  real closed field and `Br(S)`.
* Theorem 0.13 in its stated form (degree-four del Pezzo surfaces over `ℝ(C)` have rational
  points): del Pezzo surfaces are not at the pins. The pair-of-quadrics theorem stated below
  implies it through the anticanonical model of README §7.12.
-/

@[expose] public section

open TensorProduct

namespace TauCetiRoadmap.RealSurfacePeriodIndex

universe u v

/-! ## Layer 0: real function fields: orderings, real closures, Brauer index and the Elman–Lam invariant -/

/-- A quadratic form `q` on a finite-dimensional vector space `V` over a field `K` (with `2`
invertible) has **zero total signature**: for every real closed field `R` with a `K`-algebra
structure, the base change `q_R` has a totally isotropic `R`-subspace of `R ⊗[K] V` (one on which
`q_R` vanishes identically) of half the dimension of `V`. For nondegenerate `q` this says that the
signature of `q` vanishes at every ordering of `K` (Sylvester's law over the real closure); for
nonreal `K` it holds for every form. This is the condition in the Elman–Lam u-invariant (README
§0.6; B19 §0.5, p. 66; EKM §36, p. 161). -/
def HasZeroTotalSignature {K : Type u} [Field K] [Invertible (2 : K)] {V : Type v}
    [AddCommGroup V] [Module K V] [FiniteDimensional K V] (q : QuadraticForm K V) : Prop :=
  ∀ (R : Type u) [Field R] [IsRealClosed R] [Algebra K R],
    ∃ W : Submodule R (R ⊗[K] V), 2 * Module.finrank R W = Module.finrank K V ∧
      (q.baseChange R).IsTotallyIsotropic W

/-! ## Layer 2: de Jong's theorem by Hodge theory, and the norm bound over real closed fields -/

/-- **De Jong's period-index theorem in characteristic zero.** For `k` algebraically closed of
characteristic zero and `K` a finitely generated field extension of `k` of transcendence degree
`2`, every central simple `K`-algebra has index equal to the period of its Brauer class
(README §2.9; B19 Theorem 0.1, p. 63, and Theorem 1.1, p. 69; CT05 §3). -/
theorem index_eq_orderOf_of_isAlgClosed (k : Type v) [Field k] [IsAlgClosed k] [CharZero k]
    (K : Type u) [Field K] [Algebra k K] [Algebra.EssFiniteType k K]
    (htr : Algebra.trdeg k K = 2) (A : CSA.{u, u} K) :
    TauCeti.Algebra.index K A = orderOf (TauCeti.BrauerGroup.mk A) := by
  sorry

/-- **Norm bound over a real closed field.** For `R` real closed and `K` a finitely generated
field extension of `R` of transcendence degree `2`, the index of every central simple
`K`-algebra divides twice the period of its class (README §2.10; B19 §0.2, p. 63). -/
theorem index_dvd_two_mul_orderOf_of_isRealClosed (R : Type v) [Field R] [IsRealClosed R]
    (K : Type u) [Field K] [Algebra R K] [Algebra.EssFiniteType R K]
    (htr : Algebra.trdeg R K = 2) (A : CSA.{u, u} K) :
    TauCeti.Algebra.index K A ∣ 2 * orderOf (TauCeti.BrauerGroup.mk A) := by
  sorry

/-! ## Layer 7: period equals index: the main theorems and the u-invariant -/

/-- **Theorem 0.3.** If `K` is the function field of a real surface without real points, that is
a finitely generated field extension of `ℝ` of transcendence degree `2` in which `-1` is a sum of
squares, then every central simple `K`-algebra has index equal to the period of its class
(README §7.4; B19 Theorem 0.3, p. 64). -/
theorem index_eq_orderOf_of_not_isSemireal (K : Type u) [Field K] [Algebra ℝ K]
    [Algebra.EssFiniteType ℝ K] (htr : Algebra.trdeg ℝ K = 2) (hK : ¬ IsSemireal K)
    (A : CSA.{u, u} K) :
    TauCeti.Algebra.index K A = orderOf (TauCeti.BrauerGroup.mk A) := by
  sorry

/-- **Theorem 0.4, birational form.** Let `K` be a finitely generated field extension of `ℝ` of
transcendence degree `2` and `A` a central simple `K`-algebra whose class becomes trivial over
every real closed field `R` with a `K`-algebra structure. Then the index of `A` equals the period
of its class (README §§7.5, 7.6; B19 Theorem 0.4, p. 64, its proof in §6.3, p. 95, and the
passage from real closures to real points in §6.4, p. 96). -/
theorem index_eq_orderOf_of_forall_isRealClosed (K : Type u) [Field K] [Algebra ℝ K]
    [Algebra.EssFiniteType ℝ K] (htr : Algebra.trdeg ℝ K = 2) (A : CSA.{u, u} K)
    (hA : ∀ (R : Type u) [Field R] [IsRealClosed R] [Algebra K R],
      TauCeti.BrauerGroup.baseChange K R (TauCeti.BrauerGroup.mk A) = 1) :
    TauCeti.Algebra.index K A = orderOf (TauCeti.BrauerGroup.mk A) := by
  sorry

/-- **Theorem 0.12, upper bound.** For every field `K` of transcendence degree `2` over `ℝ`, not
necessarily finitely generated, the Elman–Lam invariant is at most `4`: every quadratic form over
`K` of dimension greater than `4` with zero total signature is isotropic (README §7.8; B19
Theorem 0.12, p. 66). -/
theorem not_anisotropic_of_hasZeroTotalSignature (K : Type u) [Field K] [Algebra ℝ K]
    [Invertible (2 : K)] (htr : Algebra.trdeg ℝ K = 2) {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] (hV : 4 < Module.finrank K V)
    (q : QuadraticForm K V) (hq : HasZeroTotalSignature q) :
    ¬ q.Anisotropic := by
  sorry

/-- **Theorem 0.12, sharpness.** For the function field `K` of an integral surface over `ℝ` there
is an anisotropic four-dimensional quadratic form with zero total signature, so the Elman–Lam
invariant of `K` is exactly `4` (README §7.10; B19 Theorem 0.12 and its proof, p. 96). -/
theorem exists_anisotropic_hasZeroTotalSignature (K : Type u) [Field K] [Algebra ℝ K]
    [Invertible (2 : K)] [Algebra.EssFiniteType ℝ K] (htr : Algebra.trdeg ℝ K = 2) :
    ∃ q : QuadraticForm K (Fin 4 → K), q.Anisotropic ∧ HasZeroTotalSignature q := by
  sorry

/-- **Theorem 0.10.** Over a field `K` of transcendence degree `2` over `ℝ`, not necessarily
finitely generated, in which `-1` is a sum of squares (for instance the function field of a real
surface without real points), every quadratic form of dimension at least `5` is isotropic
(README §7.11; B19 Theorem 0.10, p. 66, for function fields, and §6.4, p. 95, for its deduction
from Theorem 0.12). -/
theorem not_anisotropic_of_not_isSemireal (K : Type u) [Field K] [Algebra ℝ K]
    (htr : Algebra.trdeg ℝ K = 2) (hK : ¬ IsSemireal K)
    {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (hV : 5 ≤ Module.finrank K V) (q : QuadraticForm K V) :
    ¬ q.Anisotropic := by
  sorry

/-- **Pairs of quadrics over real curves without real points (Theorem 0.13).** Over a field `K`
of transcendence degree `1` over `ℝ`, not necessarily finitely generated, in which `-1` is a sum
of squares (for instance the function field of a real curve without real points), any two
quadratic forms on a space of dimension at least `5` have a common nonzero zero; in particular
every degree-four del Pezzo surface over `K` has a rational point (README §7.13; B19 Theorem 0.13
and its deduction from Theorem 0.10 by Amer–Brumer in §0.5, p. 66). -/
theorem exists_common_zero_of_not_isSemireal (K : Type u) [Field K] [Algebra ℝ K]
    (htr : Algebra.trdeg ℝ K = 1) (hK : ¬ IsSemireal K)
    {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (hV : 5 ≤ Module.finrank K V) (q₁ q₂ : QuadraticForm K V) :
    ∃ x : V, x ≠ 0 ∧ q₁ x = 0 ∧ q₂ x = 0 := by
  sorry

end TauCetiRoadmap.RealSurfacePeriodIndex
