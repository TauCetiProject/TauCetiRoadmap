/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Claude (Anthropic); Codex (OpenAI)
-/
import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.TateCurve.Specialization

/-!
# ModularIwasawaMainConjectures: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs: the integral unipotent quotient,
Serre's rank-two lifting theorem, and the p-adic Mahler–Manin theorem on the native Tate curve.

The ordinary and multiplicative main conjectures lack the cyclotomic Selmer and normalized
modular p-adic L-function carriers. The period-defect dictionary between Kato's good pairs and
canonical periods (README §0.9) lacks the Galois representation of a newform with its
Betti–étale lattice and Kato's p-adic zeta function of a pair (ω, γ). The source Betti/full-symbol
period comparison of §§0.9 and 1.3 lacks those integral realization and period-lattice carriers. The Hida approximation of a
p-new weight-two form (README §1.6) lacks the Galois lattices of newforms with their ordinary
lines, the ordinary Hida family through the form, and the canonical p-adic L-functions and
integral family periods whose ideals it compares. Kato's main conjecture, its ordinary and signed comparisons,
and the Fouquet–Wan pointwise and family theorems lack modular zeta morphisms, arithmetic
Iwasawa complexes and their fundamental lines; the signed results also lack integral Coleman
maps and their image lattices. The elliptic main conjectures lack these same Selmer and
analytic carriers with their Tate-lattice and Néron-period comparisons. Schneider's elliptic
and abelian leading-term theorems lack the flat arithmetic complexes and the normalized
p-adic height pairings. The rank-zero converse and its centralCriticalComparison (README §§2.1, 5.4) lack the modular
Tate-twisted Iwasawa complex, its twisted Betti factor and zeta morphism, and the discrete
Bloch–Kato Selmer carrier.
The Greenberg–Stevens derivative theorem and the p-adic BSD implications lack the modular
p-adic L-function, global Tate parameter and height-regulator carriers. None of these headline
statements is replaced by an abstract predicate or an equality on arbitrary scalar data.
-/

namespace TauCetiRoadmap.ModularIwasawaMainConjectures

/-! ## Layer 0: the three cyclotomic formulations -/

/-- An integral endomorphism has free rank-one coinvariants when its cokernel is linearly
isomorphic to the coefficient ring. -/
def HasRankOneCoinvariants {O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]
    (σ : T →ₗ[O] T) : Prop :=
  Nonempty ((T ⧸ LinearMap.range (σ - LinearMap.id)) ≃ₗ[O] O)

/-- Over a DVR, a square-zero difference from the identity that remains nonzero modulo the
maximal ideal has free rank-one coinvariants on the rank-two lattice (README §0.8).
This uses actual unipotence on the lattice, rather than unipotence only after reduction. -/
theorem hasRankOneCoinvariants_of_unipotent {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] (u : (Fin 2 → O) →ₗ[O] (Fin 2 → O))
    (hu : (u - LinearMap.id) ∘ₗ (u - LinearMap.id) = 0)
    (hnt : ¬ LinearMap.range (u - LinearMap.id) ≤
      (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O (Fin 2 → O))) :
    HasRankOneCoinvariants u := by
  sorry

/-! ## Layer 3: elliptic curves, heights and leading terms -/

/-- For p ≥ 5, a closed subgroup of SL₂(ℤ_p) surjecting onto SL₂(𝔽_p) is the full group.
This is Serre's rank-two lifting theorem (README §3.6; Serre IV.3.4, Lemma 3). -/
theorem sl2Zp_closedSubgroup_eq_top (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p)
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]))
    (hH : IsClosed (H : Set (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p])))
    (hsurj : H.map (Matrix.SpecialLinearGroup.map (PadicInt.toZMod (p := p))) = ⊤) :
    H = ⊤ := by
  sorry

/-- The p-adic Mahler–Manin theorem: a Tate parameter of norm below one with algebraic
j-invariant is transcendental over ℚ, for every prime p (README §3.7; Waldschmidt,
Théorème 2, p.108). Equivalently, algebraic nonzero q of norm below one has transcendental j. -/
theorem tateParameter_transcendental_of_isAlgebraic_j (p : ℕ) [Fact p.Prime]
    (q : (PadicComplex p)ˣ) (hq : ‖(q : PadicComplex p)‖ < 1)
    (hj : IsAlgebraic ℚ (TauCeti.tateCurveAt q hq).j) :
    Transcendental ℚ (q : PadicComplex p) := by
  sorry

end TauCetiRoadmap.ModularIwasawaMainConjectures
