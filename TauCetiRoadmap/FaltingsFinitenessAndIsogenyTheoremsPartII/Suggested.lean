module

import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree

/-!
# Quantitative isogenies and uniform integral Tate bounds: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The period theorem, short-endomorphism spanning bound and endomorphism-discriminant
estimate require the polarized abelian complex-lattice realization and stable
Faltings height.
The polarized rational isogeny estimate also requires represented polarizations
and that height.
Polarization-free discriminant bounds, quantitative
simple factorization and the rational, relative and geometric isogeny bounds require
stable Faltings height and the abelian degree API.
The j-height bound of §6.1 is statable using native Weierstrass curves, isogenies
and absolute logarithmic Weil height, and is stated below. The adelic product
comparison, uniform residual Tate refinement, uniform integral number-field theorem,
finitely generated field Tate comparison, endomorphism-preserving specialization,
and the supported-image and full finitely generated field index theorems require
abelian Tate modules and their integral geometric-endomorphism action. These
headlines are not statable on those carriers at the pins and are not replaced by
abstract predicates or matrix estimates here.
-/

namespace TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII

/-! ## Layer 3: Order discriminants and class indices -/

/-- The signed regular-trace discriminant of an integral basis of an order.
The trace is that of left multiplication on the whole order, not reduced trace.
Masser–Wüstholz, Factorization estimates, §2, pp. 8–9. -/
noncomputable def regularOrderDiscriminant {D : Type*} [Ring D]
    (O : Subring D) {m : ℕ} (b : Module.Basis (Fin m) ℤ O) : ℤ :=
  Matrix.det (fun i j => Matrix.trace
    (LinearMap.toMatrix b b (LinearMap.mulLeft ℤ (b i * b j))))

/-- Every full order lattice in a finite-dimensional division rational algebra,
in every positive module rank, contains a free order sublattice whose finite
additive index is at most the absolute regular discriminant to the half-rank.
Right modules are obtained by applying this theorem to the opposite algebra.
Masser–Wüstholz, Factorization estimates, Class Index Lemma, pp. 8–10. -/
theorem class_index_bound
    (D : Type*) [DivisionRing D] [Algebra ℚ D] [FiniteDimensional ℚ D]
    (O : Subring D) {m : ℕ} (b : Module.Basis (Fin m) ℤ O)
    (hO : Submodule.span ℚ (O : Set D) = ⊤)
    (e : ℕ) (he : 0 < e) (M : Submodule O (Fin e → D))
    [Module.Finite ℤ M]
    (hM : Submodule.span ℚ (M : Set (Fin e → D)) = ⊤) :
    ∃ f : (Fin e → O) →ₗ[O] M, Function.Injective f ∧
      f.range.toAddSubgroup.index ≠ 0 ∧
      (f.range.toAddSubgroup.index : ℝ) ≤
        Real.rpow (|regularOrderDiscriminant O b| : ℝ) ((e : ℝ) / 2) := by
  sorry

/-! ## Layer 6: Quadratic elliptic isogeny estimates -/

/-- Geometrically isogenous elliptic curves over a number field `k` of degree `D` admit
a geometric isogeny of degree at most an absolute constant times
`D² max(1, log D)² (1 + h(j(E₁)))²`. This covers every `D ≥ 1`; for `D ≥ 2` it is the
form `D² (log D)² (1 + h(j(E₁)))²` after enlarging the constant. Both CM and non-CM
curves are included. Masser–Zannier, Lemma 2.2, p. 644; Gaudron–Rémond, Theorem 1.4,
p. 347. -/
theorem elliptic_isogeny_j_height_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ (k : Type*) [Field k] [NumberField k],
      ∀ (E₁ E₂ : WeierstrassCurve k) [E₁.IsElliptic] [E₂.IsElliptic],
        Nonempty (TauCeti.Isogeny (E₁.baseChange (AlgebraicClosure k)).toAffine
          (E₂.baseChange (AlgebraicClosure k)).toAffine) →
        ∃ φ : TauCeti.Isogeny (E₁.baseChange (AlgebraicClosure k)).toAffine
            (E₂.baseChange (AlgebraicClosure k)).toAffine,
          (φ.degree : ℝ) ≤ C * (Module.finrank ℚ k : ℝ) ^ 2 *
            max 1 (Real.log (Module.finrank ℚ k)) ^ 2 *
            (1 + NumberField.absLogHeight₁ E₁.j) ^ 2 := by
  sorry

end TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII
