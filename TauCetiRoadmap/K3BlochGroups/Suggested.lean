import Mathlib

/-!
# K3BlochGroups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap’s headline
theorems against the pinned APIs: the integral diagonal of the antisymmetric tensor cokernel,
the stability of general linear and symmetric groups, the power-map action on cyclic homology,
the integral and characteristic-localized third homology of finite SL₂, the cyclic order of
the finite-field Bloch group and the formally-real order-six theorem. The tensor cokernel,
pre-Bloch presentation and symbols, and block inclusion are simple definitions on native carriers.

The homological Quillen K₃ comparison and its Hopf kernel lack a Quillen K-group carrier and
plus-construction maps at the pins. The Milnor injection and motivic edge lack the shared
Milnor and motivic carriers. The Suslin exact sequence, its finite-to-infinite compatibility,
transcendental rigidity and arithmetic quotient theorems lack Quillen K₃, the Bloch boundary
and enhanced Tor, and the configuration spectral sequences. The algebraically closed integral torsion comparison likewise lacks the shared K-group carriers.
The finite Chern isomorphism also lacks finite-coefficient K-theory and its étale Chern map. The Rogers detector lacks
the supplier’s interval Rogers function and its descent map. These headline results remain in
the README with their full hypotheses. Finite-support certificates and generic kernel-fibre
identities are elementary interfaces, not substitute headlines.
-/

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

/-- The unreduced free symbol on nonzero field elements, extended by zero at zero.
In particular the raw symbol of one is still a free generator. -/
noncomputable def preBlochRawSymbol {F : Type*} [Field F] (x : F) : FreeAbelianGroup Fˣ := by
  classical
  exact if h : x ≠ 0 then FreeAbelianGroup.of (Units.mk0 x h) else 0

/-- Suslin’s pre-Bloch presentation for any field: kill the symbol of one and precisely
five-term expressions at admissible pairs, retaining integral diagonal torsion in its boundary. -/
abbrev preBloch (F : Type*) [Field F] :=
  (FreeAbelianGroup Fˣ) ⧸ AddSubgroup.closure
    {r : FreeAbelianGroup Fˣ | r = preBlochRawSymbol (1 : F) ∨
      ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y ∧
        r = preBlochRawSymbol x - preBlochRawSymbol y + preBlochRawSymbol (y / x) -
          preBlochRawSymbol ((1 - x⁻¹) / (1 - y⁻¹)) +
          preBlochRawSymbol ((1 - x) / (1 - y))}

/-- The pre-Bloch symbol, including its zero extension at zero; the presentation kills one. -/
noncomputable def preBlochSymbol {F : Type*} [Field F] (x : F) : preBloch F :=
  QuotientAddGroup.mk (preBlochRawSymbol x)

/-! ## Layer 4: Configuration homology and the Suslin sequence -/

/-- AlgebraicKTheory A1's block inclusion on native field matrices, sending a matrix to
`diag(g,1)`. The inverse block is `diag(g⁻¹,1)`; the sum of index types is reindexed by
`finSumFinEquiv`. This adapter supplies the map in the stability headline below. -/
def generalLinearStabilization (F : Type u) [Field F] (n : ℕ) :
    Matrix.GeneralLinearGroup (Fin n) F →*
      Matrix.GeneralLinearGroup (Fin (n + 1)) F :=
  (Units.map (Matrix.reindexRingEquiv F (finSumFinEquiv :
    Fin n ⊕ Fin 1 ≃ Fin (n + 1))).toMonoidHom).comp
    { toFun := fun g =>
        { val := Matrix.fromBlocks g.val 0 0 (1 : Matrix (Fin 1) (Fin 1) F)
          inv := Matrix.fromBlocks g.inv 0 0 (1 : Matrix (Fin 1) (Fin 1) F)
          val_inv := by simp [Matrix.fromBlocks_multiply, ← Matrix.fromBlocks_one]
          inv_val := by simp [Matrix.fromBlocks_multiply, ← Matrix.fromBlocks_one] }
      map_one' := by apply Units.ext; exact Matrix.fromBlocks_one
      map_mul' := fun g h => by
        apply Units.ext
        simp [Matrix.fromBlocks_multiply] }

/-- Over every infinite field, block inclusion induces an integral homology isomorphism
in degree `i ≤ n`. Suslin 1984, Theorem 3.4, pp.196–198. Coefficients are transported to
the field's universe, and the coefficient morphism is the identity. -/
theorem generalLinear_homology_stable (F : Type u) [Field F] [Infinite F]
    (n i : ℕ) (hi : i ≤ n)
    (φ : Rep.trivial (ULift.{u} ℤ) (Matrix.GeneralLinearGroup (Fin n) F) (ULift.{u} ℤ) ⟶
      Rep.res (generalLinearStabilization F n)
        (Rep.trivial (ULift.{u} ℤ) (Matrix.GeneralLinearGroup (Fin (n + 1)) F)
          (ULift.{u} ℤ)))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    Function.Bijective (groupHomology.map (generalLinearStabilization F n) φ i) := by
  sorry

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

/-! ## Layer 5: Finite fields and arithmetic examples -/

/-- The prime-to-characteristic part of unstable SL₂ homology is cyclic of order q²−1.
Hutchinson, Corollary 3.6, arXiv v2, pp14–15. -/
theorem finite_sl2_localized_homology (F : Type u) [Field F] [Fintype F]
    (p : ℕ) [Fact p.Prime] [CharP F p] :
    Nonempty (groupHomology
      (Rep.trivial (ULift.{u} (Localization (Submonoid.powers (p : ℤ))))
        (Matrix.SpecialLinearGroup (Fin 2) F)
        (ULift.{u} (Localization (Submonoid.powers (p : ℤ))))) 3 ≃+
      ZMod (Fintype.card F ^ 2 - 1)) := by
  sorry

/-- Integral third homology of finite SL₂ is cyclic. Its characteristic-primary part is
`ℤ/p` exactly at cardinalities 2,3,4,5,8,9,27. Hutchinson, Corollary 3.6 and Lemma 3.14,
arXiv v2, pp.14,17–18. Integral coefficients are transported to the field's universe. -/
theorem finite_sl2_integral_homology (F : Type u) [Field F] [Fintype F]
    (p : ℕ) [Fact p.Prime] [CharP F p] :
    Nonempty (groupHomology
      (Rep.trivial (ULift.{u} ℤ) (Matrix.SpecialLinearGroup (Fin 2) F) (ULift.{u} ℤ)) 3 ≃+
      ZMod (if Fintype.card F ∈ ({2, 3, 4, 5, 8, 9, 27} : Finset ℕ)
        then p * (Fintype.card F ^ 2 - 1) else Fintype.card F ^ 2 - 1)) := by
  sorry

/-- For a finite field of cardinality `q ≥ 4`, the kernel of the boundary
`[x] ↦ x ∧ (1-x)` is cyclic of order `q+1` for even q and `(q+1)/2` for odd q.
The displayed generator rule determines the boundary. Hutchinson, Lemma 7.4 and
Corollary 7.5, arXiv v2, pp.34–35. -/
theorem finiteBloch_order (F : Type u) [Field F] [Fintype F]
    (hF : 4 ≤ Fintype.card F) :
    ∃ d : preBloch F →+ antisymSquare ℤ (Additive Fˣ),
      (∀ (x : F) (hx : x ≠ 0) (hx1 : 1 - x ≠ 0),
        d (preBlochSymbol x) = Submodule.Quotient.mk
          (Additive.ofMul (Units.mk0 x hx) ⊗ₜ[ℤ]
            Additive.ofMul (Units.mk0 (1 - x) hx1))) ∧
      Nonempty (d.ker ≃+ ZMod (if Even (Fintype.card F) then Fintype.card F + 1
        else (Fintype.card F + 1) / 2)) := by
  sorry

/-- For every formally real field, the universal Bloch cycle [2]+[−1] has exact
additive order six. Its order in the Bloch subgroup equals its order in the pre-Bloch group. -/
theorem blochC_order_six (F : Type*) [Field F] [IsFormallyReal F] :
    addOrderOf (preBlochSymbol (2 : F) + preBlochSymbol (-1 : F)) = 6 := by
  sorry

end TauCetiRoadmap.K3BlochGroups
