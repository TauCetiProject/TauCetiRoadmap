module

public import Mathlib

/-!
# K3BlochGroups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap’s headline
theorems against the pinned APIs: the integral diagonal of the antisymmetric tensor cokernel,
the stability of symmetric groups, the power-map action on cyclic homology,
Bloch rigidity under rational-function extension, the comparison of the Bloch groups of a
discrete valuation ring and of its fraction field,
the integral and characteristic-localized third homology of finite SL₂, the cyclic order of
the finite-field Bloch group and the formally-real order-six theorem. The tensor cokernel
and the pre-Bloch presentation of a commutative ring and its symbols are simple definitions
on native carriers.

The homological Quillen K₃ comparison and its Hopf kernel lack a Quillen K-group carrier and
plus-construction maps at the pins. The Milnor injection and motivic edge lack the shared
Milnor and motivic carriers. The Suslin exact sequence, its finite-to-infinite compatibility,
K₃ transcendental rigidity and arithmetic quotient theorems lack Quillen K₃, the Bloch boundary
and enhanced Tor, and the configuration spectral sequences. The algebraically closed integral torsion comparison likewise lacks the shared K-group carriers.
The Bloch–Wigner sequences over rings with many units and over local rings, and the comparison
of the coinvariants of third homology of SL₂ of a local domain with indecomposable K₃, lack
Quillen K₃ of a ring; the refined sequence for a local domain lacks the edge map from third
homology of SL₂ to the refined Bloch group, built from the configuration spectral sequence.
The finite Chern isomorphism also lacks finite-coefficient K-theory and its étale Chern map. The Rogers detector lacks
the supplier’s interval Rogers function and its descent map. These headline results remain in
the README with their full hypotheses. Finite-support certificates and generic kernel-fibre
identities are elementary interfaces, not substitute headlines.
-/

@[expose] public section

namespace TauCetiRoadmap.K3BlochGroups

universe u

open CategoryTheory TensorProduct

/-! ## Layer 3: Bloch presentations with integral conventions -/

/-- The antisymmetric tensor cokernel over any commutative ring, retaining diagonal 2-torsion. -/
abbrev antisymSquare (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  (M ⊗[R] M) ⧸ LinearMap.range
    ((LinearMap.id : (M ⊗[R] M) →ₗ[R] (M ⊗[R] M)) +
      (TensorProduct.comm R M M).toLinearMap)

/-- For any abelian group A, the canonical exterior projection is onto with kernel A/2A,
embedded by a ↦ a ∧ a. The final equivalence states exactly the relations on that diagonal. -/
theorem antisymSquare_diagonal_exact (A : Type*) [AddCommGroup A] :
    ∃ p : antisymSquare ℤ A →ₗ[ℤ] (⋀[ℤ]^2 A),
      Function.Surjective p ∧
      (∀ a b : A, p (Submodule.Quotient.mk (a ⊗ₜ[ℤ] b)) = exteriorPower.ιMulti ℤ 2 ![a, b]) ∧
      (∀ z : antisymSquare ℤ A, p z = 0 ↔ ∃ a : A,
        z = (Submodule.Quotient.mk (a ⊗ₜ[ℤ] a) : antisymSquare ℤ A)) ∧
      (∀ a b : A,
        (Submodule.Quotient.mk (a ⊗ₜ[ℤ] a) : antisymSquare ℤ A) =
          (Submodule.Quotient.mk (b ⊗ₜ[ℤ] b) : antisymSquare ℤ A) ↔
        ∃ c : A, a - b = 2 • c) := by
  sorry

/-- The unreduced free symbol on a commutative ring: the basis vector of the unit when `x` is a
unit, and zero otherwise. Over a field it is zero exactly at zero, and the raw symbol of one is
still a free generator. -/
noncomputable def preBlochRawSymbol {A : Type*} [CommRing A] (x : A) : FreeAbelianGroup Aˣ := by
  classical
  exact if h : IsUnit x then FreeAbelianGroup.of h.unit else 0

/-- The pre-Bloch presentation of a commutative ring: kill the symbols of the units `u` with
`1 - u` not a unit, and the five-term expressions at the admissible pairs, the pairs `x, y` with
`x, 1 - x, y, 1 - y, x - y` units. Over a field the first family is the symbol of one and the
second is Suslin's relation at `x ≠ y` in `F ∖ {0, 1}`. -/
abbrev preBloch (A : Type*) [CommRing A] :=
  (FreeAbelianGroup Aˣ) ⧸ AddSubgroup.closure
    {r : FreeAbelianGroup Aˣ |
      (∃ u : A, IsUnit u ∧ ¬ IsUnit (1 - u) ∧ r = preBlochRawSymbol u) ∨
      ∃ x y : A, IsUnit x ∧ IsUnit (1 - x) ∧ IsUnit y ∧ IsUnit (1 - y) ∧ IsUnit (x - y) ∧
        r = preBlochRawSymbol x - preBlochRawSymbol y +
          preBlochRawSymbol (y * Ring.inverse x) -
          preBlochRawSymbol ((1 - Ring.inverse x) * Ring.inverse (1 - Ring.inverse y)) +
          preBlochRawSymbol ((1 - x) * Ring.inverse (1 - y))}

/-- The pre-Bloch symbol, zero at every non-unit; the presentation kills it at every unit `u`
with `1 - u` not a unit. -/
noncomputable def preBlochSymbol {A : Type*} [CommRing A] (x : A) : preBloch A :=
  QuotientAddGroup.mk (preBlochRawSymbol x)

/-! ## Layer 4: Configuration homology and the Suslin sequence -/

/-- `cyclicHomology_maps` (§4.15): the power-`a` endomorphism of a cyclic group of order `m`
acts on `H_{2j-1}(C_m, ℤ) ≅ ℤ/m` by `a ^ j`, with the identity coefficient map. At `m = 7`,
`a = 2`, `j = 2` this is multiplication by `4` on `H₃`, the weight-two action of §4.18. -/
theorem cyclicHomology_power_map (m : ℕ) [NeZero m] (a j : ℕ) (hj : 1 ≤ j)
    (φ : Rep.trivial ℤ (Multiplicative (ZMod m)) ℤ ⟶
      Rep.res (powMonoidHom a) (Rep.trivial ℤ (Multiplicative (ZMod m)) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    ∃ e : groupHomology (Rep.trivial ℤ (Multiplicative (ZMod m)) ℤ) (2 * j - 1) ≃+
        ZMod m,
      ∀ z, e (groupHomology.map (powMonoidHom a) φ (2 * j - 1) z) = (a : ZMod m) ^ j * e z := by
  sorry

/-- The inclusion fixing the last letter induces an integral homology isomorphism
`H_i(Σ_n) → H_i(Σ_(n+1))` for `2*i ≤ n`, with the identity coefficient map.
Kerz, Theorem 2, pp.2–3. -/
theorem symmetricGroup_homology_stable (n i : ℕ) (hi : 2 * i ≤ n)
    (φ : Rep.trivial ℤ (Equiv.Perm (Fin n)) ℤ ⟶
      Rep.res (Equiv.Perm.viaEmbeddingHom ⟨Fin.castSucc, Fin.castSucc_injective n⟩)
        (Rep.trivial ℤ (Equiv.Perm (Fin (n + 1))) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    Function.Bijective (groupHomology.map
      (Equiv.Perm.viaEmbeddingHom ⟨Fin.castSucc, Fin.castSucc_injective n⟩) φ i) := by
  sorry

/-- For an infinite field or a finite field of cardinality at least four, the inclusion
into its rational-function field induces an isomorphism on Bloch groups. The boundary and
symbol-map rules determine the maps; the last three clauses express the induced kernel
bijection. Weibel, K-book VI, Exercise 5.8; README §§4.21 and 6.6. -/
theorem bloch_rationalFunctionField (F : Type u) [Field F]
    (hF : Infinite F ∨ 4 ≤ Nat.card F) :
    ∃ (dF : preBloch F →+ antisymSquare ℤ (Additive Fˣ))
      (dK : preBloch (RatFunc F) →+ antisymSquare ℤ (Additive (RatFunc F)ˣ))
      (φ : preBloch F →+ preBloch (RatFunc F)),
      (∀ (x : F) (hx : IsUnit x) (hx1 : IsUnit (1 - x)),
        dF (preBlochSymbol x) = Submodule.Quotient.mk
          (Additive.ofMul hx.unit ⊗ₜ[ℤ] Additive.ofMul hx1.unit)) ∧
      (∀ (x : RatFunc F) (hx : IsUnit x) (hx1 : IsUnit (1 - x)),
        dK (preBlochSymbol x) = Submodule.Quotient.mk
          (Additive.ofMul hx.unit ⊗ₜ[ℤ] Additive.ofMul hx1.unit)) ∧
      (∀ x : F, IsUnit x → IsUnit (1 - x) →
        φ (preBlochSymbol x) = preBlochSymbol (algebraMap F (RatFunc F) x)) ∧
      (∀ z, dF z = 0 → dK (φ z) = 0) ∧
      (∀ z, dF z = 0 → φ z = 0 → z = 0) ∧
      (∀ w, dK w = 0 → ∃ z, dF z = 0 ∧ φ z = w) := by
  sorry

/-- For a discrete valuation ring `R` with fraction field `K` and residue field `k`, where `k` is
infinite or has more than nine elements, and where `K` and `k` have equal characteristic or `k`
is finite, the map of pre-Bloch groups induced by `R → K` restricts to a bijection from the
kernel of the boundary `[x] ↦ x ∧ (1 - x)` of `R` onto that of `K`.
The displayed generator rules determine both
boundaries and the map. Mirzaii–Mokari, Corollary 5.4, arXiv v2, p.17; Mirzaii, Corollary 6.3,
arXiv v1, p.30. -/
theorem bloch_dvr_equiv (R : Type u) (K : Type*) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (hk : Infinite (IsLocalRing.ResidueField R) ∨ 9 < Nat.card (IsLocalRing.ResidueField R))
    (hc : ringChar K = ringChar (IsLocalRing.ResidueField R) ∨
      Finite (IsLocalRing.ResidueField R)) :
    ∃ (dR : preBloch R →+ antisymSquare ℤ (Additive Rˣ))
      (dK : preBloch K →+ antisymSquare ℤ (Additive Kˣ)) (φ : preBloch R →+ preBloch K),
      (∀ (x : R) (hx : IsUnit x) (hx1 : IsUnit (1 - x)),
        dR (preBlochSymbol x) = Submodule.Quotient.mk
          (Additive.ofMul hx.unit ⊗ₜ[ℤ] Additive.ofMul hx1.unit)) ∧
      (∀ (x : K) (hx : IsUnit x) (hx1 : IsUnit (1 - x)),
        dK (preBlochSymbol x) = Submodule.Quotient.mk
          (Additive.ofMul hx.unit ⊗ₜ[ℤ] Additive.ofMul hx1.unit)) ∧
      (∀ x : R, IsUnit x → IsUnit (1 - x) →
        φ (preBlochSymbol x) = preBlochSymbol (algebraMap R K x)) ∧
      (∀ z, dR z = 0 → dK (φ z) = 0) ∧
      (∀ z, dR z = 0 → φ z = 0 → z = 0) ∧
      (∀ w, dK w = 0 → ∃ z, dR z = 0 ∧ φ z = w) := by
  sorry

/-! ## Layer 5: Finite fields and arithmetic examples -/

/-- The prime-to-characteristic part of unstable SL₂ homology is cyclic of order q²−1.
Hutchinson, Corollary 3.6, arXiv v2, pp14–15. -/
theorem nonempty_finite_sl2_localized_homology_equiv (F : Type u) [Field F] [Finite F]
    (p : ℕ) [Fact p.Prime] [CharP F p] :
    Nonempty (groupHomology
      (Rep.trivial (ULift.{u} (Localization (Submonoid.powers (p : ℤ))))
        (Matrix.SpecialLinearGroup (Fin 2) F)
        (ULift.{u} (Localization (Submonoid.powers (p : ℤ))))) 3 ≃+
      ZMod (Nat.card F ^ 2 - 1)) := by
  sorry

/-- Integral third homology of finite SL₂ is cyclic. Its characteristic-primary part is
`ℤ/p` exactly at cardinalities 2,3,4,5,8,9,27. Hutchinson, Corollary 3.6 and Lemma 3.14,
arXiv v2, pp.14,17–18. Integral coefficients are transported to the field's universe. -/
theorem nonempty_finite_sl2_integral_homology_equiv (F : Type u) [Field F] [Finite F]
    (p : ℕ) [Fact p.Prime] [CharP F p] :
    Nonempty (groupHomology
      (Rep.trivial (ULift.{u} ℤ) (Matrix.SpecialLinearGroup (Fin 2) F) (ULift.{u} ℤ)) 3 ≃+
      ZMod (if Nat.card F ∈ ({2, 3, 4, 5, 8, 9, 27} : Finset ℕ)
        then p * (Nat.card F ^ 2 - 1) else Nat.card F ^ 2 - 1)) := by
  sorry

/-- For a finite field of cardinality `q ≥ 4`, the kernel of the boundary
`[x] ↦ x ∧ (1-x)` is cyclic of order `q+1` for even q and `(q+1)/2` for odd q.
The displayed generator rule determines the boundary. Hutchinson, Lemma 7.4 and
Corollary 7.5, arXiv v2, pp.34–35. -/
theorem finiteBloch_order (F : Type u) [Field F] [Finite F]
    (hF : 4 ≤ Nat.card F) :
    ∃ d : preBloch F →+ antisymSquare ℤ (Additive Fˣ),
      (∀ (x : F) (hx : x ≠ 0) (hx1 : 1 - x ≠ 0),
        d (preBlochSymbol x) = Submodule.Quotient.mk
          (Additive.ofMul (Units.mk0 x hx) ⊗ₜ[ℤ]
            Additive.ofMul (Units.mk0 (1 - x) hx1))) ∧
      Nonempty (d.ker ≃+ ZMod (if Even (Nat.card F) then Nat.card F + 1
        else (Nat.card F + 1) / 2)) := by
  sorry

/-- For every formally real field, the universal Bloch cycle [2]+[−1] has exact
additive order six. Its order in the Bloch subgroup equals its order in the pre-Bloch group. -/
theorem blochC_order_six (F : Type*) [Field F] [IsFormallyReal F] :
    addOrderOf (preBlochSymbol (2 : F) + preBlochSymbol (-1 : F)) = 6 := by
  sorry

end TauCetiRoadmap.K3BlochGroups
