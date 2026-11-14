module

public import Mathlib

/-!
# Lefschetz pencils and vanishing cycles, Part II: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
one definition they need: the Kronecker substitution `polynomialGraph`. The README carries every
other target, the API lists and the Checks.

The headline theorems, all stated below:

* `polynomialGraph_coeff` (README §1.2): Kronecker substitution with a base exceeding every
  exponent preserves every coefficient; this specialises Tau Ceti's general coefficient theorem
  `MvPolynomial.coeff_aeval_X_pow_weight` to the weights `B^i`, the added step being injectivity
  of the base-`B` weight on exponent vectors with entries `< B`;
* `exists_avoiding_graph` (README §1.3): a nonzero polynomial in `m > 0` variables pulls back to
  a nonzero polynomial along a Kronecker graph, which is a closed immersion of the affine line;
* `exists_marked_etale_curve` (README §2.3): the marked étale curve over a fixed étale chart;
* `exists_same_field_curve` (README §2.4): a smooth affine geometrically integral curve over the
  same field through a smooth rational point, meeting a prescribed dense open.

Affine spaces are written as spectra of polynomial rings, `Spec k[X_0, …, X_{m-1}]` and
`Spec k[T]`; the origin is the spectrum of the constant-coefficient map. The marked component
of the graph pullback, which carries the construction of README §2.2, is heavy data and stays a
README target; the theorems below quantify over its existence on Mathlib's carriers.
-/

@[expose] public section

universe u

namespace TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII

open CategoryTheory AlgebraicGeometry

noncomputable section

/-! ## Layer 1: Kronecker substitution -/

/-- The **Kronecker substitution** `k[X_0, …, X_{m-1}] → k[T]`, `X_i ↦ T^(B^i)`, the identity on
coefficients. Variables are numbered from zero, so `X_0 ↦ T`. Its spectrum is the graph
`a_B : 𝔸¹_k → 𝔸^m_k`, `T ↦ (T, T^B, …, T^(B^(m-1)))`. It is the ring map underlying
`MvPolynomial.aeval (fun i ↦ T ^ (B ^ i))`, Tau Ceti's Kronecker substitution
(`TauCeti/RingTheory/MvPolynomial/Kronecker.lean`) for the weight `i ↦ B ^ i`. -/
def polynomialGraph (k : Type*) [CommRing k] (m B : ℕ) :
    MvPolynomial (Fin m) k →+* Polynomial k :=
  MvPolynomial.eval₂Hom Polynomial.C fun i => Polynomial.X ^ (B ^ (i : ℕ))

/-- **Coefficients survive bounded Kronecker substitution.** Over any commutative ring, if every
exponent `d_i` of every monomial in the support of `h` is `< B`, then for every exponent vector
`e` with all `e_i < B` the coefficient of `T^(Σ e_i B^i)` in the substituted polynomial is the
coefficient of `X^e` in `h`. In particular a nonzero `h` has a nonzero image. This is Tau Ceti's
`MvPolynomial.coeff_aeval_X_pow_weight` for the weight `i ↦ B ^ i` on the box of exponent vectors
with entries `< B`; what it adds is the injectivity of that weight on the box (uniqueness of
base-`B` digits for `B ≥ 2`; the box is a subsingleton for `B ≤ 1`). -/
theorem polynomialGraph_coeff {k : Type*} [CommRing k] {m B : ℕ} (h : MvPolynomial (Fin m) k)
    (hh : ∀ d ∈ h.support, ∀ i, d i < B) (e : Fin m →₀ ℕ) (he : ∀ i, e i < B) :
    (polynomialGraph k m B h).coeff (Finsupp.weight (fun i : Fin m => B ^ (i : ℕ)) e) =
      h.coeff e := by
  sorry

/-- **A Kronecker graph avoiding a hypersurface.** For `m > 0` and a nonzero polynomial `h` in
`m` variables over a commutative ring `k`, there is a base `B ≥ 2` exceeding every exponent in
the support of `h` such that the substituted polynomial is nonzero and the graph
`Spec k[T] → Spec k[X_0, …, X_{m-1}]` is a closed immersion. Over a field, the preimage of
`D(h)` is therefore the nonempty dense open `D(φ(h))` of the affine line. -/
theorem exists_avoiding_graph {k : Type*} [CommRing k] {m : ℕ} (hm : 0 < m)
    {h : MvPolynomial (Fin m) k} (hh : h ≠ 0) :
    ∃ B : ℕ, 2 ≤ B ∧ (∀ d ∈ h.support, ∀ i, d i < B) ∧ polynomialGraph k m B h ≠ 0 ∧
      IsClosedImmersion (Spec.map (CommRingCat.ofHom (polynomialGraph k m B))) := by
  sorry

/-! ## Layer 2: marked étale curves through rational points -/

/-- **The marked étale curve over a fixed chart.** Let `V` be an integral affine scheme with an
étale morphism `π : V → 𝔸^m_k` over a field `k`, let `y` be a `k`-point of `V` with `π(y) = 0`,
and let `U ⊆ V` be a dense open. Then for some base `B ≥ 2` there are an affine curve
`C`, an étale morphism `q : C → 𝔸¹_k`, a morphism `g : C → V` with `π ∘ g = a_B ∘ q`, and a
`k`-point `c` of `C` with `g(c) = y` and `q(c) = 0`, such that `C` is smooth of relative
dimension one and geometrically integral over `k` and `g⁻¹(U)` is nonempty and dense. The point
`y` may lie outside `U`. For `m = 0` the curve is `𝔸¹_k` with `g` constant. -/
theorem exists_marked_etale_curve {k : Type u} [Field k] {m : ℕ}
    (V : Scheme.{u}) [IsIntegral V] [IsAffine V]
    (π : V ⟶ Spec (.of (MvPolynomial (Fin m) k))) [Etale π]
    (y : Spec (.of k) ⟶ V)
    (hy : y ≫ π = Spec.map (CommRingCat.ofHom (MvPolynomial.constantCoeff (R := k))))
    (U : V.Opens) (hU : Dense (U : Set V)) :
    ∃ (B : ℕ) (C : Scheme.{u}) (q : C ⟶ Spec (.of (Polynomial k))) (g : C ⟶ V)
      (c : Spec (.of k) ⟶ C),
      2 ≤ B ∧ IsAffine C ∧ Etale q ∧
      g ≫ π = q ≫ Spec.map (CommRingCat.ofHom (polynomialGraph k m B)) ∧
      c ≫ g = y ∧ c ≫ q = Spec.map (CommRingCat.ofHom (Polynomial.constantCoeff (R := k))) ∧
      SmoothOfRelativeDimension 1
        (q ≫ Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))) ∧
      GeometricallyIntegral (q ≫ Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))) ∧
      (g ⁻¹ᵁ U : Set C).Nonempty ∧ Dense (g ⁻¹ᵁ U : Set C) := by
  sorry

/-- **A curve over the same field through a smooth rational point.** Let `Y` be a scheme over a
field `k` with a `k`-rational point `y`, let `V ⊆ Y` be an open neighbourhood of `y` smooth over
`k`, and let `U ⊆ Y` be open with `U ∩ V` dense in `V`. Then there are an affine curve `C` over
`k`, smooth of relative dimension one and geometrically integral, a `k`-point `c` of `C` and a
`k`-morphism `g : C → Y` with `g(c) = y` and `g⁻¹(U)` nonempty and dense. Over `k = 𝔽_q` the
residue fields at `c` and at `y` are both `𝔽_q`. This is the curve step of Kisin–Zhou,
arXiv:2103.09945v2, proofs of Corollary 5.2.7 (pp. 52–53) and Proposition 5.3.5 (p. 54). -/
theorem exists_same_field_curve {k : Type u} [Field k] {Y : Scheme.{u}} (f : Y ⟶ Spec (.of k))
    (y : Spec (.of k) ⟶ Y) (hy : y ≫ f = 𝟙 _) (V : Y.Opens) (hyV : Set.range y ⊆ V)
    [Smooth (V.ι ≫ f)] (U : Y.Opens) (hU : Dense (V.ι ⁻¹ᵁ U : Set V.toScheme)) :
    ∃ (C : Scheme.{u}) (sC : C ⟶ Spec (.of k)) (g : C ⟶ Y) (c : Spec (.of k) ⟶ C),
      IsAffine C ∧ SmoothOfRelativeDimension 1 sC ∧ GeometricallyIntegral sC ∧
      g ≫ f = sC ∧ c ≫ sC = 𝟙 _ ∧ c ≫ g = y ∧
      (g ⁻¹ᵁ U : Set C).Nonempty ∧ Dense (g ⁻¹ᵁ U : Set C) := by
  sorry

end

end TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII

end
