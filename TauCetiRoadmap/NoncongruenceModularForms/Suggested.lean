import Mathlib
import TauCeti.Algebra.GroupAction.PermutationRepresentation
import TauCeti.Combinatorics.PermutationTriple.Basic
import TauCeti.Combinatorics.PermutationTriple.EulerCharacteristic
import TauCeti.Combinatorics.PermutationTriple.IsoClass
import TauCeti.Combinatorics.PermutationTriple.Enumeration
import TauCeti.GroupTheory.Perm.OrbitCount.Basic
import TauCeti.GroupTheory.TriangleGroup.Basic
import TauCeti.GroupTheory.TriangleGroup.PermutationRepresentation
import TauCeti.NumberTheory.ModularForms.Cusps.Basic
import TauCeti.NumberTheory.ModularForms.SturmBound

/-!
# Noncongruence subgroups of the modular group: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: every
definition below has its real body, and only theorem proofs are `sorry`. The other targets —
among them the generated group and the cusp classes of a Farey symbol (5.2–5.4), the word map of
Wohlfahrt certificates (4.3), the double-coset operators `Tₚ` with Berger's theorem (7.4), and the
targets of Layer 6 and of 8.3 — are specified, with their definitions and Checks, in `README.md`
only.
Discharging every declaration here would finish neither a layer nor the roadmap.

The carrier of the combinatorial half is a subgroup `Γ' : Subgroup PSL(2, ℤ)` with
`[Γ'.FiniteIndex]`, where `PSL(2, ℤ)` is Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) ℤ`,
the quotient of `SL(2, ℤ)` by its center. Its permutation data is `modularTriple Γ' e`, a
`TauCeti.PermutationTriple n` read through a numbering `e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n` of the
**left** cosets, with the left-multiplication action and permutations composing as functions;
the components are `(σ0, σ1, σinf) = (ρ Ū, ρ S̄, ρ T̄)` for `ρ := e.permutationRepresentation`, with
`U := S * T⁻¹` of order three and `R := S * T` of order six in `SL(2, ℤ)`. The names `permS`,
`permT`, `permR` are the LMFDB's, for `σ1`, `σinf` and `ρ R̄ = permS * permT`; the LMFDB's rows
are in the opposite (right-coset) convention, satisfy `permR = permT * permS` in `Equiv.Perm`,
and give the modular triple `(permS * permT, permS, permT⁻¹)` (`README.md`, Pinned
conventions). Cusp widths are the cycle
lengths of `σinf` **with fixed points included**, so `cuspWidths` sums to the index; the elliptic
counts are the fixed-point counts of `σ1` and `σ0`; the genus is Tau Ceti's
`PermutationTriple.genus`; the general level is `orderOf σinf`. Congruence is Mathlib's
`IsCongruenceSubgroup` on `Subgroup SL(2, ℤ)`, applied to the preimage `lift Γ' := Γ'.comap toPSL`;
no second predicate is introduced. Hsu's test is stated in the generators `L := σinf` and
`R_H := σ0 * σ1` (the permutations of `T` and of `!![1, 0; 1, 1] = S⁻¹ T⁻¹ S`), exactly as in
the source, and its relations are an executable `Bool`.

The analytic half is stated for `Γ : Subgroup SL(2, ℤ)` with `[Γ.FiniteIndex]` and lives in
Mathlib's `ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k` and `CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k`; the expansion at
`∞` is `qExpansion w f` with `w` the **strict** width `(Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty`, and the
expansion at a cusp `σ ∞` is the expansion at `∞` of `f ∣[k] σ`, a form on `σ⁻¹ Γ σ`
(`ModularForm.translate`). "Bounded denominators" is the inline hypothesis
`∃ D ≠ 0, ∀ m, D · a_m ∈ ℤ`, never a named predicate.

Every proof below is `sorry` except the **bridge checks**, which are closed proof terms verifying
that Mathlib and Tau Ceti supply the promised instances and theorems on the stated carrier: the
matrix identities of Layer 0 (`decide`), the index of a lift (`Subgroup.index_comap_of_surjective`),
the finite-index instance of a lift, the matrix of the mirror automorphism, the
finite-dimensionality instances, the Sturm bound, the odd-weight vanishing and the injectivity of
restriction in Layer 7 (`TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z`,
`ModularForm.eq_zero_of_neg_one_mem`, `ModularForm.restrictₗ_injective`), the determinants of the
Farey-symbol generators, and the acceptance values of Hsu's test on the explicit index-`3`,
index-`7` and index-`8` permutations of the worked examples (`decide +kernel`).
-/

open Matrix MatrixGroups ModularGroup CongruenceSubgroup TauCeti UpperHalfPlane Equiv
open scoped ModularForm Pointwise

namespace TauCetiRoadmap.NoncongruenceModularForms

/-! ## Layer 0: the modular group as a triangle group -/

/-- `README.md`, Layer 0, 0.1. `R := S * T`, of order six in `SL(2, ℤ)`; its image fixes `ρ`. -/
def R : SL(2, ℤ) := S * T

/-- `README.md`, Layer 0, 0.1. `U := S * T⁻¹`, of order three in `SL(2, ℤ)`; its image fixes
`e^{πi/3}`. -/
def U : SL(2, ℤ) := S * T⁻¹

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem S_pow_two : S ^ 2 = -1 := by decide

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem R_pow_three : R ^ 3 = -1 := by decide

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem U_pow_three : U ^ 3 = 1 := by decide

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem S_mul_R_inv_mul_S_inv : S * R⁻¹ * S⁻¹ = -U := by decide

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem T_eq_S_inv_mul_R : T = S⁻¹ * R := by decide

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem T_inv_eq_S_inv_mul_U : T⁻¹ = S⁻¹ * U := by decide

/-- `README.md`, Layer 0, 0.1. The projection `SL(2, ℤ) → PSL(2, ℤ)`. -/
abbrev toPSL : SL(2, ℤ) →* PSL(2, ℤ) := QuotientGroup.mk' (Subgroup.center SL(2, ℤ))

/-- `README.md`, Layer 0, 0.1 (bridge check). -/
theorem neg_one_mem_center : (-1 : SL(2, ℤ)) ∈ Subgroup.center SL(2, ℤ) :=
  Subgroup.mem_center_iff.mpr fun g ↦ by simp

/-- `README.md`, Layer 0, 0.1. The center of `SL(2, ℤ)` is `{1, -1}`. -/
theorem card_center : Nat.card (Subgroup.center SL(2, ℤ)) = 2 := sorry

/-- `README.md`, Layer 0, 0.1. The image of `S`. -/
def Sbar : PSL(2, ℤ) := toPSL S

/-- `README.md`, Layer 0, 0.1. The image of `T`. -/
def Tbar : PSL(2, ℤ) := toPSL T

/-- `README.md`, Layer 0, 0.1. The image of `R = S * T`. -/
def Rbar : PSL(2, ℤ) := toPSL R

/-- `README.md`, Layer 0, 0.1. The image of `U = S * T⁻¹`. -/
def Ubar : PSL(2, ℤ) := toPSL U

/-- `README.md`, Layer 0, 0.1. -/
theorem Sbar_pow_two : Sbar ^ 2 = 1 := by
  rw [Sbar, ← map_pow, S_pow_two, QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
  exact neg_one_mem_center

/-- `README.md`, Layer 0, 0.1. -/
theorem Rbar_pow_three : Rbar ^ 3 = 1 := by
  rw [Rbar, ← map_pow, R_pow_three, QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
  exact neg_one_mem_center

/-- `README.md`, Layer 0, 0.1. -/
theorem Ubar_pow_three : Ubar ^ 3 = 1 := by
  rw [Ubar, ← map_pow, U_pow_three, map_one]

/-- `README.md`, Layer 0, 0.1. The relation `T̄ S̄ Ū = 1`, the triangle-group relator
`z * y * x = 1` of `TauCeti.TriangleGroup 3 2 0`. -/
theorem Tbar_mul_Sbar_mul_Ubar : Tbar * Sbar * Ubar = 1 := by
  rw [Tbar, Sbar, Ubar, ← map_mul, ← map_mul]
  have h : T * S * U = -1 := by decide
  rw [h, QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
  exact neg_one_mem_center

/-- `README.md`, Layer 0, 0.1. -/
theorem Rbar_eq_Sbar_mul_Tbar : Rbar = Sbar * Tbar := by
  rw [Rbar, Sbar, Tbar, ← map_mul]; rfl

/-- `README.md`, Layer 0, 0.1. The translation between the two order-three generators. -/
theorem Ubar_eq : Ubar = Sbar * Rbar⁻¹ * Sbar⁻¹ := by
  have h1 : toPSL (-1 : SL(2, ℤ)) = 1 := (QuotientGroup.eq_one_iff _).mpr neg_one_mem_center
  rw [Ubar, Sbar, Rbar, ← map_inv, ← map_inv, ← map_mul, ← map_mul, S_mul_R_inv_mul_S_inv,
    neg_eq_neg_one_mul, map_mul, h1, one_mul]

/-- `README.md`, Layer 0, 0.1. `S̄` and `T̄` generate `PSL(2, ℤ)`
(the image of `SpecialLinearGroup.SL2Z_generators`). -/
theorem closure_Sbar_Tbar : Subgroup.closure {Sbar, Tbar} = ⊤ := sorry

/-- `README.md`, Layer 0, 0.1. -/
theorem orderOf_Sbar : orderOf Sbar = 2 := sorry

/-- `README.md`, Layer 0, 0.1. -/
theorem orderOf_Rbar : orderOf Rbar = 3 := sorry

/-- `README.md`, Layer 0, 0.1. `T̄` has infinite order. -/
theorem orderOf_Tbar : orderOf Tbar = 0 := sorry

/-- `README.md`, Layer 0, 0.2. The homomorphism `Δ(3, 2, ∞) → PSL(2, ℤ)`, `x ↦ Ū`, `y ↦ S̄`,
`z ↦ T̄`, through Tau Ceti's universal property `TriangleGroup.lift`. -/
def modularHom : TriangleGroup 3 2 0 →* PSL(2, ℤ) :=
  TriangleGroup.lift Ubar Sbar Tbar Ubar_pow_three Sbar_pow_two (pow_zero _) Tbar_mul_Sbar_mul_Ubar

/-- `README.md`, Layer 0, 0.2 (bridge check). -/
theorem modularHom_x : modularHom (TriangleGroup.x 3 2 0) = Ubar := TriangleGroup.lift_x ..

/-- `README.md`, Layer 0, 0.2 (bridge check). -/
theorem modularHom_y : modularHom (TriangleGroup.y 3 2 0) = Sbar := TriangleGroup.lift_y ..

/-- `README.md`, Layer 0, 0.2 (bridge check). -/
theorem modularHom_z : modularHom (TriangleGroup.z 3 2 0) = Tbar := TriangleGroup.lift_z ..

/-- `README.md`, Layer 0, 0.2. -/
theorem modularHom_surjective : Function.Surjective modularHom := sorry

/-- `README.md`, Layer 0, 0.3. **`PSL₂(ℤ) ≅ ℤ/2 ∗ ℤ/3`**: injectivity by the ping-pong lemma
on `ℙ¹(ℚ)` with `X₊ = {q > 0}`, `X₋ = {q < 0}`. -/
theorem modularHom_injective : Function.Injective modularHom := sorry

/-- `README.md`, Layer 0, 0.3. The identification of `PSL(2, ℤ)` with the triangle group
`Δ(3, 2, ∞)`. -/
noncomputable def modularEquiv : TriangleGroup 3 2 0 ≃* PSL(2, ℤ) :=
  MulEquiv.ofBijective modularHom ⟨modularHom_injective, modularHom_surjective⟩

/-- `README.md`, Layer 0, 0.3. Torsion in `PSL(2, ℤ)`: every element of finite order is
conjugate to `1`, `S̄`, `R̄` or `R̄²`. -/
theorem isConj_of_isOfFinOrder {g : PSL(2, ℤ)} (hg : IsOfFinOrder g) :
    g = 1 ∨ IsConj g Sbar ∨ IsConj g Rbar ∨ IsConj g (Rbar ^ 2) := sorry

/-- `README.md`, Layer 0, 0.3. A torsion-free subgroup of finite index `n` is free of rank
`1 + n / 6`, and `6 ∣ n`. -/
theorem exists_freeGroupBasis_of_torsionFree (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex]
    (h : ∀ g ∈ Γ', IsOfFinOrder g → g = 1) :
    6 ∣ Γ'.index ∧ Nonempty (FreeGroupBasis (Fin (1 + Γ'.index / 6)) Γ') := sorry

/-- `README.md`, Layer 0, 0.3. The abelianization of `PSL(2, ℤ)` is cyclic of order six. -/
theorem abelianization_equiv : Nonempty (Abelianization PSL(2, ℤ) ≃* Multiplicative (ZMod 6)) :=
  sorry

/-- `README.md`, Layer 0, 0.4. The lift `±Γ'` of a subgroup of `PSL(2, ℤ)` to `SL(2, ℤ)`. -/
def lift (Γ' : Subgroup PSL(2, ℤ)) : Subgroup SL(2, ℤ) := Γ'.comap toPSL

/-- `README.md`, Layer 0, 0.4 (bridge check). -/
theorem neg_one_mem_lift (Γ' : Subgroup PSL(2, ℤ)) : (-1 : SL(2, ℤ)) ∈ lift Γ' := by
  show toPSL (-1) ∈ Γ'
  rw [QuotientGroup.mk'_apply, (QuotientGroup.eq_one_iff _).mpr neg_one_mem_center]
  exact one_mem _

/-- `README.md`, Layer 0, 0.4 (bridge check): `[SL₂(ℤ) : ±Γ'] = [PSL₂(ℤ) : Γ']`. -/
theorem index_lift (Γ' : Subgroup PSL(2, ℤ)) : (lift Γ').index = Γ'.index :=
  Subgroup.index_comap_of_surjective _ (QuotientGroup.mk'_surjective _)

/-- `README.md`, Layer 0, 0.4 (bridge check). -/
instance (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] : (lift Γ').FiniteIndex :=
  ⟨by rw [index_lift]; exact Subgroup.FiniteIndex.index_ne_zero⟩

/-- `README.md`, Layer 0, 0.4. -/
theorem map_lift (Γ' : Subgroup PSL(2, ℤ)) : (lift Γ').map toPSL = Γ' :=
  Subgroup.map_comap_eq_self_of_surjective (QuotientGroup.mk'_surjective _) _

/-- `README.md`, Layer 0, 0.4. `lift` is an order embedding onto the subgroups containing `-1`. -/
theorem lift_map_eq_self_iff (Γ : Subgroup SL(2, ℤ)) : lift (Γ.map toPSL) = Γ ↔ (-1 : SL(2, ℤ)) ∈ Γ :=
  sorry

/-- `README.md`, Layer 0, 0.4. The LMFDB's `psl2z_index` of a subgroup of `SL(2, ℤ)`. -/
noncomputable def psl2Index (Γ : Subgroup SL(2, ℤ)) : ℕ := (Γ.map toPSL).index

/-- `README.md`, Layer 0, 0.4. -/
theorem psl2Index_eq_index (Γ : Subgroup SL(2, ℤ)) (h : (-1 : SL(2, ℤ)) ∈ Γ) :
    psl2Index Γ = Γ.index := sorry

/-- `README.md`, Layer 0, 0.4. -/
theorem two_mul_psl2Index (Γ : Subgroup SL(2, ℤ)) (h : (-1 : SL(2, ℤ)) ∉ Γ) :
    2 * psl2Index Γ = Γ.index := sorry

/-- `README.md`, Layer 0, 0.4 (bridge check): finite index descends to `PSL(2, ℤ)`. -/
instance (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] : (Γ.map toPSL).FiniteIndex :=
  Subgroup.FiniteIndex.map_of_surjective Γ (QuotientGroup.mk'_surjective _)

/-! ## Layer 1: the coset dictionary -/

section CosetDictionary

variable (Γ' : Subgroup PSL(2, ℤ)) {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 1, 1.1. The permutation representation of `PSL(2, ℤ)` on the left cosets
of `Γ'`, numbered by `e`: `ρ h (e (g Γ')) = e ((h g) Γ')`. -/
noncomputable abbrev ρ : PSL(2, ℤ) →* Perm (Fin n) := Equiv.permutationRepresentation (G := PSL(2, ℤ)) e

/-- `README.md`, Layer 1, 1.1. **The modular triple** `(σ0, σ1, σinf) = (ρ Ū, ρ S̄, ρ T̄)` of a
finite-index subgroup, a permutation triple in Tau Ceti's sense because `T̄ S̄ Ū = 1`. -/
noncomputable def modularTriple : PermutationTriple n where
  σ0 := ρ Γ' e Ubar
  σ1 := ρ Γ' e Sbar
  σinf := ρ Γ' e Tbar
  product_eq_one := by rw [← map_mul, ← map_mul, Tbar_mul_Sbar_mul_Ubar, map_one]

/-- `README.md`, Layer 1, 1.1. The LMFDB's `permS`. -/
noncomputable abbrev permS : Perm (Fin n) := (modularTriple Γ' e).σ1

/-- `README.md`, Layer 1, 1.1. The LMFDB's `permT`. -/
noncomputable abbrev permT : Perm (Fin n) := (modularTriple Γ' e).σinf

/-- `README.md`, Layer 1, 1.1. The LMFDB's `permR`, the permutation of `R̄ = S̄ T̄`. -/
noncomputable def permR : Perm (Fin n) := ρ Γ' e Rbar

/-- `README.md`, Layer 1, 1.1 (bridge check). The identity in this file's left-coset convention;
an LMFDB row, in the opposite convention, satisfies `permR = permT * permS` instead. -/
theorem permR_eq_permS_mul_permT : permR Γ' e = permS Γ' e * permT Γ' e := by
  rw [permR, Rbar_eq_Sbar_mul_Tbar, map_mul]; rfl

/-- `README.md`, Layer 1, 1.1. -/
theorem permR_eq_conj : permR Γ' e = (permS Γ' e)⁻¹ * (modularTriple Γ' e).σ0⁻¹ * permS Γ' e :=
  sorry

/-- `README.md`, Layer 1, 1.1 (bridge check). -/
theorem σ0_pow_three : (modularTriple Γ' e).σ0 ^ 3 = 1 := by
  rw [modularTriple, ← map_pow, Ubar_pow_three, map_one]

/-- `README.md`, Layer 1, 1.1 (bridge check). -/
theorem σ1_pow_two : (modularTriple Γ' e).σ1 ^ 2 = 1 := by
  rw [modularTriple, ← map_pow, Sbar_pow_two, map_one]

include e in
/-- `README.md`, Layer 1, 1.1. The degree of the triple is the index. -/
theorem eq_index : n = Γ'.index := sorry

/-- `README.md`, Layer 1, 1.1. The modular triple is connected. -/
theorem isConnected_modularTriple : (modularTriple Γ' e).IsConnected := sorry

/-- `README.md`, Layer 1, 1.1 (bridge check). The base point `e ⟦1⟧` has stabilizer `Γ'`. -/
theorem comap_stabilizer_ρ :
    (MulAction.stabilizer (Perm (Fin n)) (e ((1 : PSL(2, ℤ)) : PSL(2, ℤ) ⧸ Γ'))).comap (ρ Γ' e) =
      Γ' := by
  unfold ρ
  rw [Equiv.comap_stabilizer_permutationRepresentation, MulAction.stabilizer_quotient]

/-- `README.md`, Layer 1, 1.1 (bridge check). The kernel of `ρ` is the normal core of `Γ'`. -/
theorem ker_ρ : (ρ Γ' e).ker = Γ'.normalCore := by
  unfold ρ
  rw [Equiv.ker_permutationRepresentation, Subgroup.normalCore_eq_ker]

/-- `README.md`, Layer 1, 1.1. The preimage of `Γ'` in the triangle group maps onto `Γ'`. -/
theorem map_comap_modularHom : (Γ'.comap modularHom).map modularEquiv.toMonoidHom = Γ' := sorry

/-- `README.md`, Layer 1, 1.1. The left cosets of `Γ'.comap modularHom` in the triangle group
correspond to the left cosets of `Γ'` along `modularEquiv` (`Quotient.congr` on
`QuotientGroup.leftRel`; `Γ'` need not be normal). -/
noncomputable def cosetEquiv : TriangleGroup 3 2 0 ⧸ Γ'.comap modularHom ≃ PSL(2, ℤ) ⧸ Γ' :=
  Quotient.congr modularEquiv.toEquiv fun a b ↦ by
    rw [QuotientGroup.leftRel_apply, QuotientGroup.leftRel_apply, Subgroup.mem_comap]
    simp only [map_mul, map_inv]
    exact Iff.rfl

/-- `README.md`, Layer 1, 1.1. The modular triple is the coset triple of Tau Ceti's triangle
group, transported along `modularEquiv`. -/
theorem modularTriple_eq_cosetTriple :
    modularTriple Γ' e =
      TriangleGroup.cosetTriple (Γ'.comap modularHom) ((cosetEquiv Γ').trans e) :=
  sorry

/-- `README.md`, Layer 1, 1.1. The monodromy group is the image of `ρ`, of order
`[PSL₂(ℤ) : core(Γ')]`. -/
theorem monodromyGroup_modularTriple : (modularTriple Γ' e).monodromyGroup = (ρ Γ' e).range := sorry

/-- `README.md`, Layer 1, 1.1. -/
theorem card_monodromyGroup : Nat.card (modularTriple Γ' e).monodromyGroup = Γ'.normalCore.index :=
  sorry

/-- `README.md`, Layer 1, 1.1. Independence of the numbering. -/
theorem equivalent_modularTriple (e' : PSL(2, ℤ) ⧸ Γ' ≃ Fin n) :
    (modularTriple Γ' e).Equivalent (modularTriple Γ' e') := sorry

/-- `README.md`, Layer 1, 1.1. The isomorphism class of the modular triple, independent of the
numbering. -/
noncomputable def modularIsoClass [Γ'.FiniteIndex] :
    PermutationTriple.IsoClass (Nat.card (PSL(2, ℤ) ⧸ Γ')) :=
  PermutationTriple.IsoClass.mk (modularTriple Γ' (Finite.equivFin _))

/-- `README.md`, Layer 1, 1.1. The mirror automorphism of `SL(2, ℤ)`: conjugation by
`J = diag(1, −1) ∈ GL₂(ℤ)`, `!![a, b; c, d] ↦ !![a, −b; −c, d]`. -/
def mirrorAut : SL(2, ℤ) ≃* SL(2, ℤ) :=
  let f : SL(2, ℤ) → SL(2, ℤ) := fun g ↦ ⟨!![g 0 0, -g 0 1; -g 1 0, g 1 1], by
    have h := g.det_coe
    rw [Matrix.det_fin_two] at h
    rw [Matrix.det_fin_two_of]
    linear_combination h⟩
  have hf : ∀ g, f (f g) = g := fun g ↦ by
    ext i j; fin_cases i <;> fin_cases j <;> simp [f]
  { toFun := f
    invFun := f
    left_inv := hf
    right_inv := hf
    map_mul' := fun a b ↦ by
      apply Subtype.ext
      show _ = (f a).1 * (f b).1
      simp only [f, Matrix.mul_fin_two]
      ext i j
      fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two] <;> ring }

/-- `README.md`, Layer 1, 1.1 (bridge check). -/
theorem coe_mirrorAut (g : SL(2, ℤ)) :
    (mirrorAut g : Matrix (Fin 2) (Fin 2) ℤ) = !![g 0 0, -g 0 1; -g 1 0, g 1 1] := rfl

/-- `README.md`, Layer 1, 1.1. The mirror `J Γ' J⁻¹` has triple `(σ1 σ0⁻¹ σ1⁻¹, σ1, σinf⁻¹)`,
because `J⁻¹ S J = S⁻¹`, `J⁻¹ T J = T⁻¹` and `J⁻¹ U J = -R`. -/
theorem modularTriple_mirror (Γ'' : Subgroup PSL(2, ℤ)) [Γ''.FiniteIndex]
    (hΓ'' : lift Γ'' = (lift Γ').map mirrorAut.toMonoidHom) (e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n) :
    (modularTriple Γ'' e'').Equivalent
      (PermutationTriple.ofTwo (permS Γ' e * (modularTriple Γ' e).σ0⁻¹ * (permS Γ' e)⁻¹)
        (permS Γ' e)) := sorry

/-- `README.md`, Layer 1, 1.2. **Millington's theorem**: modular triples are isomorphic iff the
subgroups are conjugate. -/
theorem millington (Γ₁ Γ₂ : Subgroup PSL(2, ℤ)) [Γ₁.FiniteIndex] [Γ₂.FiniteIndex]
    (e₁ : PSL(2, ℤ) ⧸ Γ₁ ≃ Fin n) (e₂ : PSL(2, ℤ) ⧸ Γ₂ ≃ Fin n) :
    (modularTriple Γ₁ e₁).Equivalent (modularTriple Γ₂ e₂) ↔
      ∃ g : ConjAct PSL(2, ℤ), g • Γ₁ = Γ₂ := sorry

/-- `README.md`, Layer 1, 1.2. Every connected triple with `σ0 ^ 3 = σ1 ^ 2 = 1` is a modular
triple. -/
theorem exists_modularTriple_equivalent (t : PermutationTriple n) (ht : t.IsConnected)
    (h0 : t.σ0 ^ 3 = 1) (h1 : t.σ1 ^ 2 = 1) :
    ∃ (Γ'' : Subgroup PSL(2, ℤ)) (_ : Γ''.FiniteIndex) (e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n),
      (modularTriple Γ'' e'').Equivalent t := sorry

/-- `README.md`, Layer 1, 1.2. The number of subgroups of index `n` with a given modular triple
class is `n / #Aut`. -/
theorem card_subgroups_of_class :
    Nat.card {Γ'' : Subgroup PSL(2, ℤ) // ∃ e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n,
        (modularTriple Γ'' e'').Equivalent (modularTriple Γ' e)} *
      Nat.card (modularTriple Γ' e).automorphismGroup = n := sorry

end CosetDictionary

/-- `README.md`, Layer 1, 1.3. The isomorphism classes of connected triples of degree `n` with
`σ0 ^ 3 = σ1 ^ 2 = 1`: the conjugacy classes of subgroups of index `n`, as an executable
`Finset`. -/
def modularClasses (n : ℕ) : Finset (Finset (ConnectedTriple n)) :=
  (isoClasses n).filter fun c ↦ ∃ t ∈ c, t.1.σ0 ^ 3 = 1 ∧ t.1.σ1 ^ 2 = 1

/-- `README.md`, Layer 1, 1.3. The counts `1, 1, 2, 2, 1, 8, 6, 7` for `n = 1, …, 8`. -/
theorem card_modularClasses :
    (List.range 8).map (fun i ↦ (modularClasses (i + 1)).card) = [1, 1, 2, 2, 1, 8, 6, 7] := sorry

/-! ## Layer 2: the invariants read from the permutations -/

section Invariants

variable (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 2, 2.1. The cusp widths: cycle lengths of `σinf`, fixed points included
as cusps of width `1`. -/
noncomputable def cuspWidths : Multiset ℕ :=
  (permT Γ' e).cycleType + Multiset.replicate (n - (permT Γ' e).cycleType.sum) 1

/-- `README.md`, Layer 2, 2.1. The number of cusps, Tau Ceti's `orbitCount` of `σinf`. -/
noncomputable def cuspCount : ℕ := orbitCount (permT Γ' e)

/-- `README.md`, Layer 2, 2.1. -/
theorem sum_cuspWidths : (cuspWidths Γ' e).sum = n := sorry

/-- `README.md`, Layer 2, 2.1. -/
theorem card_cuspWidths : Multiset.card (cuspWidths Γ' e) = cuspCount Γ' e := sorry

/-- `README.md`, Layer 2, 2.1. -/
theorem pos_of_mem_cuspWidths {w : ℕ} (hw : w ∈ cuspWidths Γ' e) : 0 < w := sorry

/-- `README.md`, Layer 2, 2.1. The cycle of `σinf` through the base coset has length the integer
width of `±Γ'` at `∞` (Tau Ceti's `integerCuspWidth`), which is the strict width. -/
theorem period_permT_base :
    MulAction.period (permT Γ' e) (e (1 : PSL(2, ℤ))) =
      TauCeti.Subgroup.integerCuspWidth ((lift Γ').map (SpecialLinearGroup.mapGL ℝ)) := sorry

/-- `README.md`, Layer 2, 2.1. The cycle of `σinf` through `e ⟦σ̄⁻¹⟧` has length the least
`h > 0` with `σ T^h σ⁻¹ ∈ ±Γ'`: the width of the cusp `σ ∞`. -/
theorem period_permT_coset (σ : SL(2, ℤ)) :
    MulAction.period (permT Γ' e) (e (toPSL σ⁻¹ : PSL(2, ℤ))) =
      sInf {h : ℕ | 0 < h ∧ σ * T ^ h * σ⁻¹ ∈ lift Γ'} := sorry

/-- `README.md`, Layer 2, 2.1. **Cusps are cusp orbits**: the number of cycles of `σinf` is the
number of `±Γ'`-orbits of cusps in Mathlib's sense. -/
theorem cuspCount_eq_card_cuspOrbits :
    cuspCount Γ' e = Nat.card (CuspOrbits ((lift Γ').map (SpecialLinearGroup.mapGL ℝ))) := sorry

/-- `README.md`, Layer 2, 2.2. The number of elliptic points of order two: fixed points of `σ1`. -/
noncomputable def ellipticTwo : ℕ := (Finset.univ.filter fun i ↦ permS Γ' e i = i).card

/-- `README.md`, Layer 2, 2.2. The number of elliptic points of order three: fixed points of
`σ0`. -/
noncomputable def ellipticThree : ℕ :=
  (Finset.univ.filter fun i ↦ (modularTriple Γ' e).σ0 i = i).card

/-- `README.md`, Layer 2, 2.2. -/
theorem ellipticTwo_mod_two : ellipticTwo Γ' e ≡ n [MOD 2] := sorry

/-- `README.md`, Layer 2, 2.2. -/
theorem ellipticThree_mod_three : ellipticThree Γ' e ≡ n [MOD 3] := sorry

/-- `README.md`, Layer 2, 2.2. The coset `g Γ'` is fixed by `σ1` iff `g⁻¹ S̄ g ∈ Γ'`: the
fixed points of `σ1` are the `Γ'`-classes of elliptic elements of order two. -/
theorem permS_apply_eq_self_iff (g : PSL(2, ℤ)) :
    permS Γ' e (e g) = e g ↔ g⁻¹ * Sbar * g ∈ Γ' := sorry

/-- `README.md`, Layer 2, 2.3. The genus, Tau Ceti's genus of the modular triple. -/
noncomputable def genus : ℕ := (modularTriple Γ' e).genus

/-- `README.md`, Layer 2, 2.3. **The genus formula** in integral form
(Diamond–Shurman Theorem 3.1.1, read on the permutations). -/
theorem genus_formula :
    12 * genus Γ' e + 3 * ellipticTwo Γ' e + 4 * ellipticThree Γ' e + 6 * cuspCount Γ' e =
      12 + n := sorry

/-- `README.md`, Layer 2, 2.3. Torsion-free subgroups have index divisible by six. -/
theorem six_dvd_of_elliptic_eq_zero (h2 : ellipticTwo Γ' e = 0) (h3 : ellipticThree Γ' e = 0) :
    (n : ℤ) = 6 * (2 * genus Γ' e - 2 + cuspCount Γ' e) := sorry

/-- `README.md`, Layer 2, 2.4. The invariant vector `(n, g, ε₂, ε₃, cuspWidths)`. -/
noncomputable def invariants : ℕ × ℕ × ℕ × ℕ × Multiset ℕ :=
  (n, genus Γ' e, ellipticTwo Γ' e, ellipticThree Γ' e, cuspWidths Γ' e)

/-- `README.md`, Layer 2, 2.4. The invariant vector is a conjugacy invariant. -/
theorem invariants_eq_of_conj (Γ'' : Subgroup PSL(2, ℤ)) [Γ''.FiniteIndex]
    (e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n) (g : ConjAct PSL(2, ℤ)) (hg : g • Γ' = Γ'') :
    invariants Γ' e = invariants Γ'' e'' := sorry

end Invariants

/-- `README.md`, Layer 2, 2.4. The invariant vector does not determine the conjugacy class:
two non-conjugate subgroups of index `7` share `(7, 0, 1, 1, {6, 1})`. -/
theorem exists_invariants_eq_not_conj :
    ∃ (Γ₁ Γ₂ : Subgroup PSL(2, ℤ)) (_ : Γ₁.FiniteIndex) (_ : Γ₂.FiniteIndex)
      (e₁ : PSL(2, ℤ) ⧸ Γ₁ ≃ Fin 7) (e₂ : PSL(2, ℤ) ⧸ Γ₂ ≃ Fin 7),
      invariants Γ₁ e₁ = invariants Γ₂ e₂ ∧ invariants Γ₁ e₁ = (7, 0, 1, 1, {6, 1}) ∧
        ¬ ∃ g : ConjAct PSL(2, ℤ), g • Γ₁ = Γ₂ := sorry

/-- `README.md`, Layer 2, 2.5. The index of `Γ(N)` in `SL(2, ℤ)` is the order of `SL₂(ℤ/N)`. -/
theorem index_Gamma (N : ℕ) [NeZero N] : (Gamma N).index = Nat.card SL(2, ZMod N) := sorry

/-- `README.md`, Layer 2, 2.5. `|SL₂(ℤ/N)| = N³ ∏_{p ∣ N} (1 − p⁻²)`. -/
theorem card_SL_zmod (N : ℕ) [NeZero N] :
    (Nat.card SL(2, ZMod N) : ℚ) = N ^ 3 * ∏ p ∈ N.primeFactors, (1 - ((p : ℚ) ^ 2)⁻¹) := sorry

/-- `README.md`, Layer 2, 2.5. `[PSL₂(ℤ) : Γ̄(N)] = |SL₂(ℤ/N)| / 2` for `N ≥ 3`. -/
theorem index_Gamma_map_toPSL (N : ℕ) (hN : 3 ≤ N) :
    2 * ((Gamma N).map toPSL).index = Nat.card SL(2, ZMod N) := sorry

/-- `README.md`, Layer 2, 2.5. `Γ̄(N)` has `|SL₂(ℤ/N)| / (2N)` cusps, all of width `N`, for
`N ≥ 3`. -/
theorem cuspWidths_Gamma (N : ℕ) (hN : 3 ≤ N) {n : ℕ}
    (e : PSL(2, ℤ) ⧸ (Gamma N).map toPSL ≃ Fin n) :
    cuspWidths ((Gamma N).map toPSL) e = Multiset.replicate (n / N) N := sorry

/-- `README.md`, Layer 2, 2.5. `Γ̄(N)` has no elliptic points for `N ≥ 2`. -/
theorem elliptic_Gamma (N : ℕ) (hN : 2 ≤ N) {n : ℕ}
    (e : PSL(2, ℤ) ⧸ (Gamma N).map toPSL ≃ Fin n) :
    ellipticTwo ((Gamma N).map toPSL) e = 0 ∧ ellipticThree ((Gamma N).map toPSL) e = 0 := sorry

/-! ## Layer 3: the general level and Wohlfahrt's theorem -/

section Level

variable (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 3, 3.1. **The general level** `N(Γ') := orderOf σinf`. -/
noncomputable def generalLevel : ℕ := orderOf (permT Γ' e)

/-- `README.md`, Layer 3, 3.1. The level is the least common multiple of the cusp widths. -/
theorem generalLevel_eq_lcm : generalLevel Γ' e = (cuspWidths Γ' e).lcm := sorry

/-- `README.md`, Layer 3, 3.1. -/
theorem generalLevel_pos : 0 < generalLevel Γ' e := sorry

/-- `README.md`, Layer 3, 3.1. The level is the least `N > 0` whose power of `T` has normal
closure inside `±Γ'`. -/
theorem normalClosure_T_pow_le_lift_iff (N : ℕ) :
    Subgroup.normalClosure {T ^ N} ≤ lift Γ' ↔ generalLevel Γ' e ∣ N := sorry

/-- `README.md`, Layer 3, 3.1. The **strict level** of a subgroup of `SL(2, ℤ)`: the least `N > 0`
with `σ T^N σ⁻¹ ∈ Γ` for every `σ`. -/
noncomputable def strictLevel (Γ : Subgroup SL(2, ℤ)) : ℕ :=
  sInf {N : ℕ | 0 < N ∧ ∀ σ : SL(2, ℤ), σ * T ^ N * σ⁻¹ ∈ Γ}

/-- `README.md`, Layer 3, 3.1. -/
theorem strictLevel_pos (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] : 0 < strictLevel Γ := sorry

/-- `README.md`, Layer 3, 3.1. The strict level is the level or twice the level of the image. -/
theorem strictLevel_eq_or_eq_two_mul (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex]
    (e' : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) :
    strictLevel Γ = generalLevel (Γ.map toPSL) e' ∨
      strictLevel Γ = 2 * generalLevel (Γ.map toPSL) e' := sorry

/-- `README.md`, Layer 3, 3.1. -/
theorem strictLevel_eq_of_neg_one_mem (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex]
    (h : (-1 : SL(2, ℤ)) ∈ Γ) (e' : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) :
    strictLevel Γ = generalLevel (Γ.map toPSL) e' := sorry

/-- `README.md`, Layer 3, 3.1. The level of an intersection is the `lcm` of the levels. -/
theorem generalLevel_inf (Γ₁ Γ₂ : Subgroup PSL(2, ℤ)) [Γ₁.FiniteIndex] [Γ₂.FiniteIndex]
    {n₁ n₂ m : ℕ} (e₁ : PSL(2, ℤ) ⧸ Γ₁ ≃ Fin n₁) (e₂ : PSL(2, ℤ) ⧸ Γ₂ ≃ Fin n₂)
    (e₁₂ : PSL(2, ℤ) ⧸ (Γ₁ ⊓ Γ₂) ≃ Fin m) :
    generalLevel (Γ₁ ⊓ Γ₂) e₁₂ = Nat.lcm (generalLevel Γ₁ e₁) (generalLevel Γ₂ e₂) := sorry

/-- `README.md`, Layer 3, 3.1. The normal core has the same level. -/
theorem generalLevel_normalCore {m : ℕ} (e' : PSL(2, ℤ) ⧸ Γ'.normalCore ≃ Fin m) :
    generalLevel Γ'.normalCore e' = generalLevel Γ' e := sorry

/-- `README.md`, Layer 3, 3.1. The strict level of an intersection is the `lcm` of the strict
levels; no hypothesis on `-1`. -/
theorem strictLevel_inf (Γ₁ Γ₂ : Subgroup SL(2, ℤ)) [Γ₁.FiniteIndex] [Γ₂.FiniteIndex] :
    strictLevel (Γ₁ ⊓ Γ₂) = Nat.lcm (strictLevel Γ₁) (strictLevel Γ₂) := sorry

/-- `README.md`, Layer 3, 3.1. -/
theorem strictLevel_normalCore (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] :
    strictLevel Γ.normalCore = strictLevel Γ := sorry

/-- `README.md`, Layer 3, 3.2. **Wohlfahrt's lemma**: `Γ(N) = Γ(NM) · ⟪T^N⟫`. -/
theorem wohlfahrt_lemma (N M : ℕ) (hN : 0 < N) (hM : 0 < M) :
    Gamma N = Gamma (N * M) ⊔ Subgroup.normalClosure {T ^ N} := sorry

/-- `README.md`, Layer 3, 3.3. **Wohlfahrt's theorem**: `±Γ'` is a congruence subgroup iff it
contains `Γ(N)` for `N` the general level. -/
theorem wohlfahrt : IsCongruenceSubgroup (lift Γ') ↔ Gamma (generalLevel Γ' e) ≤ lift Γ' := sorry

/-- `README.md`, Layer 3, 3.3. The `SL₂` form, with the strict level. -/
theorem wohlfahrt_strict (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] :
    IsCongruenceSubgroup Γ ↔ Gamma (strictLevel Γ) ≤ Γ := sorry

/-- `README.md`, Layer 3, 3.3 (iii). A lift of a congruence subgroup of `PSL(2, ℤ)` need not be
congruence: Kiming–Schütt–Verrill's index-two subgroup of `Γ₀(6)`. -/
theorem exists_lift_not_isCongruenceSubgroup :
    ∃ Γ : Subgroup SL(2, ℤ), lift (Γ.map toPSL) = Gamma0 6 ∧ (-1 : SL(2, ℤ)) ∉ Γ ∧
      ¬ IsCongruenceSubgroup Γ := sorry

/-- `README.md`, Layer 3, 3.4. **The congruence closure**, the smallest congruence subgroup
containing `Γ`. -/
def congruenceClosure (Γ : Subgroup SL(2, ℤ)) : Subgroup SL(2, ℤ) :=
  ⨅ (Δ : Subgroup SL(2, ℤ)) (_ : IsCongruenceSubgroup Δ ∧ Γ ≤ Δ), Δ

/-- `README.md`, Layer 3, 3.4. -/
theorem le_congruenceClosure (Γ : Subgroup SL(2, ℤ)) : Γ ≤ congruenceClosure Γ := sorry

/-- `README.md`, Layer 3, 3.4. -/
theorem isCongruenceSubgroup_congruenceClosure (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] :
    IsCongruenceSubgroup (congruenceClosure Γ) := sorry

/-- `README.md`, Layer 3, 3.4. `Γ^c = Γ · Γ(N_s)`. -/
theorem congruenceClosure_eq_sup (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] :
    congruenceClosure Γ = Γ ⊔ Gamma (strictLevel Γ) := sorry

/-- `README.md`, Layer 3, 3.4. -/
theorem isCongruenceSubgroup_iff_congruenceClosure_eq (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] :
    IsCongruenceSubgroup Γ ↔ congruenceClosure Γ = Γ := sorry

/-- `README.md`, Layer 3, 3.5. **The order obstruction**: a congruence subgroup of level `N` has
index dividing `[PSL₂(ℤ) : Γ̄(N)]`. -/
theorem index_dvd_of_isCongruenceSubgroup (h : IsCongruenceSubgroup (lift Γ')) :
    Γ'.index ∣ ((Gamma (generalLevel Γ' e)).map toPSL).index := sorry

/-- `README.md`, Layer 3, 3.5. The product `σ1 σ0 = σinf⁻¹` has order the level. -/
theorem orderOf_σ1_mul_σ0 :
    orderOf (permS Γ' e * (modularTriple Γ' e).σ0) = generalLevel Γ' e := sorry

/-- `README.md`, Layer 3, 3.5. **The composition-factor obstruction**: when `±Γ'` is congruence,
every nonabelian simple composition factor `H ⧸ K` of the monodromy group (`H` subnormal, `K`
normal in `H`) is `PSL₂(𝔽_ℓ)` for a prime `ℓ ≥ 5` dividing the level. -/
theorem compositionFactor_of_isCongruenceSubgroup (h : IsCongruenceSubgroup (lift Γ'))
    {H K : Subgroup (modularTriple Γ' e).monodromyGroup} (hH : H.IsSubnormal) (hKH : K ≤ H)
    [(K.subgroupOf H).Normal] [IsSimpleGroup (H ⧸ K.subgroupOf H)]
    (hnc : ¬ IsMulCommutative (H ⧸ K.subgroupOf H)) :
    ∃ ℓ : ℕ, ℓ.Prime ∧ 5 ≤ ℓ ∧ ℓ ∣ generalLevel Γ' e ∧
      Nonempty ((H ⧸ K.subgroupOf H) ≃* PSL(2, ZMod ℓ)) := sorry

end Level

/-! ## Layer 4: Hsu's congruence test -/

section Hsu

variable {n : ℕ}

/-- `README.md`, Layer 4, 4.2. The odd part of `N`, by structural recursion on a fuel argument so
that `decide` can evaluate it. -/
def oddPartAux : ℕ → ℕ → ℕ
  | 0, m => m
  | k + 1, m => if m % 2 = 0 ∧ m ≠ 0 then oddPartAux k (m / 2) else m

/-- `README.md`, Layer 4, 4.2. The odd part `m` of `N = 2^k · m`. -/
def oddPart (N : ℕ) : ℕ := oddPartAux N N

/-- `README.md`, Layer 4, 4.2. The least `x < m` with `a x ≡ 1 (mod m)`, or `0` if none: the
inverse of `a` modulo `m`, by search so that `decide` can evaluate it. -/
def invMod (a m : ℕ) : ℕ := ((List.range m).find? fun x ↦ a * x % m = 1 % m).getD 0

/-- `README.md`, Layer 4, 4.2. The least `x < N` with `x ≡ r (mod m)` and `x ≡ s (mod e)`
(Chinese remainder), by search. -/
def crt (N m e r s : ℕ) : ℕ := ((List.range N).find? fun x ↦ x % m = r % m ∧ x % e = s % e).getD 0

/-- `README.md`, Layer 4, 4.2. **Hsu's test**, as an executable Boolean on the permutations
`L = σinf` (of `T`) and `R_H = σ0 * σ1` (of `!![1, 0; 1, 1]`) and the level `N`: the relations
of `PSL₂(ℤ/N)` in the three cases `N` odd, `N = 2^k`, `N = 2^k · m` with `m ≥ 3` odd. -/
def hsuTest (L RH : Perm (Fin n)) (N : ℕ) : Bool :=
  let m := oddPart N
  let e := N / m
  if e = 1 then
    -- `N` odd: `(R_H² L^{−1/2})³ = 1`.
    decide ((RH ^ 2 * (L ^ invMod 2 N)⁻¹) ^ 3 = 1)
  else if m = 1 then
    -- `N = 2^k`, with `S_H := L^{20} R_H^{1/5} L^{−4} R_H⁻¹`.
    let SH := L ^ 20 * RH ^ invMod 5 N * (L ^ 4)⁻¹ * RH⁻¹
    let X := L * RH⁻¹ * L
    decide (X⁻¹ * SH * X * SH = 1 ∧ SH⁻¹ * RH * SH = RH ^ 25 ∧ (SH * RH ^ 5 * X) ^ 3 = X ^ 2)
  else
    -- `N = e · m`, `e = 2^k ≥ 2`, `m ≥ 3` odd.
    let c := crt N m e 1 0
    let d := crt N m e 0 1
    let a := L ^ c
    let b := RH ^ c
    let l := L ^ d
    let r := RH ^ d
    let s := l ^ 20 * r ^ invMod 5 e * (l ^ 4)⁻¹ * r⁻¹
    let Y := l * r⁻¹ * l
    decide (a⁻¹ * r⁻¹ * a * r = 1 ∧ (a * b⁻¹ * a) ^ 4 = 1 ∧
      (a * b⁻¹ * a) ^ 2 * (a⁻¹ * b) ^ 3 = 1 ∧
      (a * b⁻¹ * a) ^ 2 = (b ^ 2 * (a ^ invMod 2 m)⁻¹) ^ 3 ∧
      Y⁻¹ * s * Y * s = 1 ∧ s⁻¹ * r * s = r ^ 25 ∧ Y ^ 2 = (s * r ^ 5 * Y) ^ 3)

variable (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 4, 4.2. **Hsu's theorem**: `±Γ'` is a congruence subgroup iff its
permutations pass the test at its level. -/
theorem hsu :
    IsCongruenceSubgroup (lift Γ') ↔
      hsuTest (permT Γ' e) ((modularTriple Γ' e).σ0 * permS Γ' e) (generalLevel Γ' e) = true :=
  sorry

/-- `README.md`, Layer 4, 4.1. The principle behind the test: congruence iff the normal core
contains `Γ̄(N)`. -/
theorem isCongruenceSubgroup_iff_normalCore :
    IsCongruenceSubgroup (lift Γ') ↔ (Gamma (generalLevel Γ' e)).map toPSL ≤ Γ'.normalCore := sorry

/-- `README.md`, Layer 4, 4.3. **Wohlfahrt certificate**: an element of `Γ(N)` outside `±Γ'`
witnesses noncongruence. -/
theorem not_isCongruenceSubgroup_of_certificate (g : SL(2, ℤ))
    (hg : g ∈ Gamma (generalLevel Γ' e)) (h : g ∉ lift Γ') : ¬ IsCongruenceSubgroup (lift Γ') :=
  fun hc ↦ h ((wohlfahrt Γ' e).mp hc hg)

/-- `README.md`, Layer 4, 4.4. **Subgroups not containing `−1`** (Hamilton–Loeffler): the test
applies, with its relations unchanged, at the even modulus `2 · strictLevel Γ` to the
permutations of `T` and `S⁻¹ T⁻¹ S` on `SL(2, ℤ) ⧸ Γ`. At the strict level itself the statement
is false when that level is odd (`Γ₁(5)`), because Hsu's odd-modulus relation is a relator of
`PSL₂(ℤ/N)` only. -/
theorem hsu_strict (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (f : SL(2, ℤ) ⧸ Γ ≃ Fin n) :
    IsCongruenceSubgroup Γ ↔
      hsuTest (Equiv.permutationRepresentation (G := SL(2, ℤ)) f T)
        (Equiv.permutationRepresentation (G := SL(2, ℤ)) f (S⁻¹ * T⁻¹ * S))
        (2 * strictLevel Γ) = true := sorry

end Hsu

/-! ### Acceptance values of Hsu's test on the worked examples

The permutations are those of `README.md`, *Worked examples*, in the pinned convention (left
cosets, functions composed right to left, points `1, …, n` written as `0, …, n − 1`). `L` is
`permT = permS * permR` and `R_H = σ0 * σ1 = permS * permT⁻¹ * permS`. -/

section Acceptance

/-- The three-cycle `(a b c)`. -/
def cyc3 {n : ℕ} (a b c : Fin n) : Perm (Fin n) := Equiv.swap a b * Equiv.swap b c

/-- `Γ̄₀(2)`: `permS = (1 2)`, `permR = (1 3 2)`. -/
def permS_Gamma0_two : Perm (Fin 3) := Equiv.swap 0 1
/-- `Γ̄₀(2)`: `permS = (1 2)`, `permR = (1 3 2)`. -/
def permR_Gamma0_two : Perm (Fin 3) := cyc3 0 2 1

/-- The index-`7`, level-`12` noncongruence class with cusp widths `{4, 3}`:
`permS = (2 3)(4 5)(6 7)`, `permR = (1 2 4)(3 5 6)`. -/
def permS_seven : Perm (Fin 7) := Equiv.swap 1 2 * Equiv.swap 3 4 * Equiv.swap 5 6
/-- The index-`7`, level-`12` noncongruence class with cusp widths `{4, 3}`. -/
def permR_seven : Perm (Fin 7) := cyc3 0 1 3 * cyc3 2 4 5

/-- The index-`7`, level-`7` congruence class: `permS = (3 4)(5 6)`, `permR = (1 2 3)(4 5 7)`. -/
def permS_seven_cong : Perm (Fin 7) := Equiv.swap 2 3 * Equiv.swap 4 5
/-- The index-`7`, level-`7` congruence class. -/
def permR_seven_cong : Perm (Fin 7) := cyc3 0 1 2 * cyc3 3 4 6

/-- The index-`8`, level-`8` noncongruence class: `permS = (3 4)(5 6)(7 8)`,
`permR = (1 2 3)(4 5 7)`. -/
def permS_eight : Perm (Fin 8) := Equiv.swap 2 3 * Equiv.swap 4 5 * Equiv.swap 6 7
/-- The index-`8`, level-`8` noncongruence class. -/
def permR_eight : Perm (Fin 8) := cyc3 0 1 2 * cyc3 3 4 6

/-- The index-`8`, level-`8` congruence class: `permS = (2 3)(4 6)(5 7)`,
`permR = (1 2 4)(3 5 8)`. -/
def permS_eight_cong : Perm (Fin 8) := Equiv.swap 1 2 * Equiv.swap 3 5 * Equiv.swap 4 6
/-- The index-`8`, level-`8` congruence class. -/
def permR_eight_cong : Perm (Fin 8) := cyc3 0 1 3 * cyc3 2 4 7

/-- `L = permT = permS * permR` and `R_H = permS * permT⁻¹ * permS` from a row `(permS, permR)`. -/
def hsuInputs {n : ℕ} (pS pR : Perm (Fin n)) : Perm (Fin n) × Perm (Fin n) :=
  (pS * pR, pS * (pS * pR)⁻¹ * pS)

-- `README.md`, Layer 4, 4.2 (bridge check): `Γ̄₀(2)` passes at level `2`.
example : hsuTest (hsuInputs permS_Gamma0_two permR_Gamma0_two).1
    (hsuInputs permS_Gamma0_two permR_Gamma0_two).2 2 = true := by decide +kernel

-- `README.md`, Layer 4, 4.2 (bridge check): the level-`7` index-`7` class passes (odd case).
example : hsuTest (hsuInputs permS_seven_cong permR_seven_cong).1
    (hsuInputs permS_seven_cong permR_seven_cong).2 7 = true := by decide +kernel

-- `README.md`, Layer 4, 4.2 (bridge check): the `{4, 3}` class fails at level `12` (mixed case).
example : hsuTest (hsuInputs permS_seven permR_seven).1
    (hsuInputs permS_seven permR_seven).2 12 = false := by decide +kernel

-- `README.md`, Layer 4, 4.2 (bridge check): the noncongruence index-`8` class fails at level `8`
-- (relation (A1)).
example : hsuTest (hsuInputs permS_eight permR_eight).1
    (hsuInputs permS_eight permR_eight).2 8 = false := by decide +kernel

-- `README.md`, Layer 4, 4.2 (bridge check): the congruence index-`8` class with the same
-- invariant vector passes at level `8`.
example : hsuTest (hsuInputs permS_eight_cong permR_eight_cong).1
    (hsuInputs permS_eight_cong permR_eight_cong).2 8 = true := by decide +kernel

-- `README.md`, Layer 3, 3.1 (bridge check): the level of the `{4, 3}` class is `12` and that
-- of the noncongruence index-`8` class is `8`: `permT ^ N = 1` with `N` the lcm of the widths.
example : (hsuInputs permS_seven permR_seven).1 ^ 12 = 1 ∧
    (hsuInputs permS_seven permR_seven).1 ^ 6 ≠ 1 ∧ (hsuInputs permS_seven permR_seven).1 ^ 4 ≠ 1 := by
  decide +kernel
example : (hsuInputs permS_eight permR_eight).1 ^ 8 = 1 ∧
    (hsuInputs permS_eight permR_eight).1 ^ 4 ≠ 1 := by decide +kernel

end Acceptance

/-! ## Layer 5: Farey symbols -/

/-- `README.md`, Layer 5, 5.1. The label of a side of a Farey symbol. -/
inductive SideLabel
  | even
  | odd
  | free (j : ℕ)
  deriving DecidableEq, Repr

/-- `README.md`, Layer 5, 5.1. **A Farey symbol**: reduced fractions `x_0 < ⋯ < x_m` with
`x_0`, `x_m` integers (unimodularity with the ends `−∞ = (−1)/0` and `∞ = 1/0`), consecutive
terms unimodular, and a label on each of the `m + 2` sides, every free label occurring exactly
twice. -/
structure FareySymbol where
  /-- The fractions `x_0 < ⋯ < x_m`. -/
  xs : List ℚ
  /-- The labels of the sides `(x_{i−1}, x_i)`, `0 ≤ i ≤ m + 1`. -/
  labels : List SideLabel
  ne_nil : xs ≠ []
  labels_length : labels.length = xs.length + 1
  sorted : xs.Pairwise (· < ·)
  head_den : (xs.head ne_nil).den = 1
  last_den : (xs.getLast ne_nil).den = 1
  unimodular : ∀ (i : ℕ) (h : i + 1 < xs.length),
    (xs[i + 1]'h).num * (xs[i]'(by omega)).den - (xs[i]'(by omega)).num * (xs[i + 1]'h).den = 1
  free_twice : ∀ j, labels.count (.free j) = 0 ∨ labels.count (.free j) = 2

/-- `README.md`, Layer 5, 5.1 (non-vacuity): the Farey symbol of `PSL(2, ℤ)` itself,
`x = [0]`, sides `(−∞, 0)` even and `(0, ∞)` odd. -/
def fareySymbolOne : FareySymbol where
  xs := [0]
  labels := [.even, .odd]
  ne_nil := by simp
  labels_length := rfl
  sorted := List.pairwise_singleton _ _
  head_den := rfl
  last_den := rfl
  unimodular := fun _ h ↦ by simp at h
  free_twice := fun _ ↦ Or.inl (List.count_eq_zero.mpr (by simp))

/-- `README.md`, Layer 5, 5.1 (non-vacuity): the Farey symbol of `Γ̄₀(2)`, `x = [0, 1]`, sides
`(free 1, even, free 1)`. -/
def fareySymbolGamma0Two : FareySymbol where
  xs := [0, 1]
  labels := [.free 1, .even, .free 1]
  ne_nil := by simp
  labels_length := rfl
  sorted := by norm_num [List.pairwise_cons]
  head_den := rfl
  last_den := rfl
  unimodular := fun i h ↦ by
    have hi : i = 0 := by simp at h; omega
    subst hi
    decide +revert
  free_twice := fun j ↦ by
    by_cases hj : j = 1
    · subst hj; exact Or.inr (by decide)
    · exact Or.inl (List.count_eq_zero.mpr (by simp [hj]))

namespace FareySymbol

/-- `README.md`, Layer 5, 5.1. The number `e₂` of even sides. -/
def evenCount (F : FareySymbol) : ℕ := F.labels.count .even

/-- `README.md`, Layer 5, 5.1. The number `e₃` of odd sides. -/
def oddCount (F : FareySymbol) : ℕ := F.labels.count .odd

/-- `README.md`, Layer 5, 5.1. The number `r` of free pairs. -/
def freePairs (F : FareySymbol) : ℕ := (F.labels.filter fun l ↦ l matches .free _).length / 2

/-- `README.md`, Layer 5, 5.2. The even generator of a side `(a/b, c/d)`:
`M S M⁻¹` for `M = !![a, c; b, d]`. -/
def evenGenerator (a b c d : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![-(a * b + c * d), a ^ 2 + c ^ 2; -(b ^ 2 + d ^ 2), a * b + c * d]

/-- `README.md`, Layer 5, 5.2. The odd generator of a side `(a/b, c/d)`:
`M !![1, -1; 1, 0] M⁻¹`. -/
def oddGenerator (a b c d : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![-(a * b + a * d + c * d), a ^ 2 + a * c + c ^ 2;
     -(b ^ 2 + b * d + d ^ 2), a * b + b * c + c * d]

/-- `README.md`, Layer 5, 5.2. The generator pairing the free sides `(a/b, c/d)` and
`(a'/b', c'/d')`: `M' S M⁻¹`. -/
def freeGenerator (a b c d a' b' c' d' : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![-(a' * b + c' * d), a * a' + c * c'; -(b * b' + d * d'), a * b' + c * d']

/-- `README.md`, Layer 5, 5.2 (bridge check). -/
theorem det_evenGenerator (a b c d : ℤ) (h : b * c - a * d = 1) : (evenGenerator a b c d).det = 1 := by
  simp only [evenGenerator, Matrix.det_fin_two_of]
  linear_combination (b * c - a * d + 1) * h

/-- `README.md`, Layer 5, 5.2 (bridge check). -/
theorem trace_evenGenerator (a b c d : ℤ) : (evenGenerator a b c d).trace = 0 := by
  simp [evenGenerator, Matrix.trace_fin_two_of]

/-- `README.md`, Layer 5, 5.2 (bridge check). -/
theorem det_oddGenerator (a b c d : ℤ) (h : b * c - a * d = 1) : (oddGenerator a b c d).det = 1 := by
  simp only [oddGenerator, Matrix.det_fin_two_of]
  linear_combination (b * c - a * d + 1) * h

/-- `README.md`, Layer 5, 5.2 (bridge check). -/
theorem trace_oddGenerator (a b c d : ℤ) (h : b * c - a * d = 1) :
    (oddGenerator a b c d).trace = 1 := by
  simp only [oddGenerator, Matrix.trace_fin_two_of]
  linear_combination h

/-- `README.md`, Layer 5, 5.2 (bridge check). -/
theorem det_freeGenerator (a b c d a' b' c' d' : ℤ) (h : b * c - a * d = 1)
    (h' : b' * c' - a' * d' = 1) : (freeGenerator a b c d a' b' c' d').det = 1 := by
  simp only [freeGenerator, Matrix.det_fin_two_of]
  linear_combination (b' * c' - a' * d') * h + h'

-- `README.md`, Layer 5, 5.1 (bridge check): the symbol of `PSL(2, ℤ)` has `r = 0`, `e₂ = 1`,
-- `e₃ = 1`, so the formula of 5.3 gives index `1`.
example : 6 * fareySymbolOne.freePairs + 3 * fareySymbolOne.evenCount +
    4 * fareySymbolOne.oddCount = 7 := by
  decide

-- `README.md`, Layer 5, 5.1 (bridge check): the symbol of `Γ̄₀(2)` has `r = 1`, `e₂ = 1`,
-- `e₃ = 0`, so the formula of 5.3 gives index `3`.
example : 6 * fareySymbolGamma0Two.freePairs + 3 * fareySymbolGamma0Two.evenCount +
    4 * fareySymbolGamma0Two.oddCount = 9 := by
  decide

end FareySymbol

/-! ## Layer 7: modular forms on finite-index subgroups -/

section Forms

variable (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (k : ℤ)

-- `README.md`, Layer 7, 7.1 (bridge check): the carrier is finite-dimensional, by Tau Ceti's
-- `finiteDimensional_modularForm_finiteIndex` through Mathlib's arithmetic-subgroup instances.
example : Module.Finite ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) := inferInstance

-- `README.md`, Layer 7, 7.1 (bridge check).
example : Module.Finite ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) := inferInstance

/-- `README.md`, Layer 7, 7.1 (bridge check): the Sturm bound at the index of `Γ`. -/
theorem sturm (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k)
    (h : (↑((k * Γ.index).toNat / 12) : ℕ∞) <
      (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f).order) : f = 0 :=
  TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z f h

/-- `README.md`, Layer 7, 7.1. The Sturm bound at the projective index, when `∞` is regular (for
instance when `-1 ∈ Γ`, by Mathlib's `isRegularAtInfty_of_neg_one_mem`). At an irregular `∞` the
strict-width order is twice the width-parameter order and the bound fails in every weight. -/
theorem sturm_psl2Index (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k)
    (hreg : (Γ.map (SpecialLinearGroup.mapGL ℝ)).IsRegularAtInfty)
    (h : (↑((k * psl2Index Γ).toNat / 12) : ℕ∞) <
      (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f).order) : f = 0 := sorry

/-- `README.md`, Layer 7, 7.1. The strict width at `∞` is Tau Ceti's integer cusp width. -/
theorem strictWidthInfty_eq_integerCuspWidth :
    (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty = TauCeti.Subgroup.integerCuspWidth (Γ.map (SpecialLinearGroup.mapGL ℝ)) :=
  sorry

omit [Γ.FiniteIndex] in
/-- `README.md`, Layer 7, 7.1 (bridge check): no odd-weight forms when `-1 ∈ Γ`, by Mathlib's
`ModularForm.eq_zero_of_neg_one_mem`. -/
theorem subsingleton_of_odd (hk : Odd k) (h : (-1 : SL(2, ℤ)) ∈ Γ) :
    Subsingleton (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) := by
  have h' : (-1 : GL (Fin 2) ℝ) ∈ Γ.map (SpecialLinearGroup.mapGL ℝ) :=
    ⟨-1, h, by ext i j; fin_cases i <;> fin_cases j <;> simp⟩
  exact ⟨fun f g ↦ by
    rw [ModularForm.eq_zero_of_neg_one_mem h' hk f, ModularForm.eq_zero_of_neg_one_mem h' hk g]⟩

/-- `README.md`, Layer 7, 7.2. **The expansion at the cusp `σ ∞`**: the `q`-expansion at `∞`, in
the strict width of the conjugate `σ⁻¹ Γ σ`, of `f ∣[k] σ` (Mathlib's `ModularForm.translate`). -/
noncomputable def cuspExpansion (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (σ : SL(2, ℤ)) :
    PowerSeries ℂ :=
  qExpansion (ConjAct.toConjAct (SpecialLinearGroup.mapGL ℝ σ)⁻¹ •
      Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty
    (ModularForm.translate f (SpecialLinearGroup.mapGL ℝ σ))

/-- `README.md`, Layer 7, 7.2. At `σ = 1` the cusp expansion is the expansion at `∞`. -/
theorem cuspExpansion_one (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) :
    cuspExpansion Γ k f 1 = qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f := sorry

/-- `README.md`, Layer 7, 7.2. A form vanishes iff its expansion at one cusp vanishes. -/
theorem eq_zero_iff_cuspExpansion_eq_zero (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (σ : SL(2, ℤ)) :
    f = 0 ↔ cuspExpansion Γ k f σ = 0 := sorry

/-- `README.md`, Layer 7, 7.2. Cusp forms are the forms with vanishing constant term at every
cusp. -/
theorem isCuspForm_iff (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) :
    ModularForm.IsCuspForm f ↔
      ∀ σ : SL(2, ℤ), PowerSeries.constantCoeff (cuspExpansion Γ k f σ) = 0 := sorry

/-- `README.md`, Layer 7, 7.2. Two representatives `σ, τ` of the same cusp of `Γ`
(`τ = ±γ σ T^j`, `γ ∈ Γ`) give expansions differing by a sign and a root-of-unity substitution
`q^{1/w} ↦ ζ q^{1/w}`, `w` the strict width. -/
theorem cuspExpansion_eq_of_same_cusp (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (σ τ : SL(2, ℤ))
    (h : ∃ γ ∈ Γ, ∃ j : ℤ, τ = γ * σ * T ^ j ∨ τ = -(γ * σ * T ^ j)) :
    ∃ (w : ℕ) (ε ζ : ℂ), (w : ℝ) = (ConjAct.toConjAct (SpecialLinearGroup.mapGL ℝ σ)⁻¹ •
        Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty ∧
      ε ^ 2 = 1 ∧ ζ ^ w = 1 ∧ ∀ m, PowerSeries.coeff m (cuspExpansion Γ k f τ) =
        ε * ζ ^ m * PowerSeries.coeff m (cuspExpansion Γ k f σ) := sorry

/-- `README.md`, Layer 7, 7.3. **The dimension of `S_k(Γ)`** for even `k ≥ 4` and every
finite-index `Γ` (ModularForms Layer 10C's argument, run here at finite index), on the invariants
of Layer 2. -/
theorem finrank_cuspForm {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) (hk : Even k) (hk4 : 4 ≤ k) :
    (Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) : ℤ) =
      (k - 1) * (genus (Γ.map toPSL) e - 1) + (k / 4) * ellipticTwo (Γ.map toPSL) e +
        (k / 3) * ellipticThree (Γ.map toPSL) e + (k / 2 - 1) * cuspCount (Γ.map toPSL) e := sorry

/-- `README.md`, Layer 7, 7.3. **The dimension of `M_k(Γ)`** for even `k ≥ 2`. -/
theorem finrank_modularForm {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) (hk : Even k)
    (hk2 : 2 ≤ k) :
    (Module.finrank ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) : ℤ) =
      (k - 1) * (genus (Γ.map toPSL) e - 1) + (k / 4) * ellipticTwo (Γ.map toPSL) e +
        (k / 3) * ellipticThree (Γ.map toPSL) e + (k / 2) * cuspCount (Γ.map toPSL) e := sorry

/-- `README.md`, Layer 7, 7.3. `dim S_2(Γ) = g`. -/
theorem finrank_cuspForm_two {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) :
    Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) 2) = genus (Γ.map toPSL) e := sorry

/-- `README.md`, Layer 7, 7.4. The restriction `M_k(Γ') → M_k(Γ)` along `Γ ≤ Γ'`. -/
def restrict (Γ₂ : Subgroup SL(2, ℤ)) (h : Γ ≤ Γ₂) :
    ModularForm (Γ₂.map (SpecialLinearGroup.mapGL ℝ)) k →ₗ[ℂ] ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k :=
  ModularForm.restrictₗ k ℂ (Subgroup.map_mono h)

omit [Γ.FiniteIndex] in
/-- `README.md`, Layer 7, 7.4 (bridge check). -/
theorem restrict_injective (Γ₂ : Subgroup SL(2, ℤ)) (h : Γ ≤ Γ₂) :
    Function.Injective (restrict Γ k Γ₂ h) :=
  ModularForm.restrictₗ_injective k ℂ _

/-- `README.md`, Layer 7, 7.4. The **congruence part** of `M_k(Γ)`: the forms on the congruence
closure. -/
noncomputable def congruencePart : Submodule ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) :=
  LinearMap.range (restrict Γ k (congruenceClosure Γ) (le_congruenceClosure Γ))

/-- `README.md`, Layer 7, 7.5. **Algebraic coefficients**: a basis of `M_k(Γ)` whose expansions
at every cusp have coefficients in a number field. -/
theorem exists_basis_coeff_mem_numberField :
    ∃ (K : IntermediateField ℚ ℂ) (_ : FiniteDimensional ℚ K) (ι : Type)
      (b : Module.Basis ι ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k)),
      ∀ i (σ : SL(2, ℤ)) (m : ℕ), PowerSeries.coeff m (cuspExpansion Γ k (b i) σ) ∈ K := sorry

end Forms

/-! ## Layer 8: unbounded denominators and the Atkin–Swinnerton-Dyer congruences -/

section Denominators

variable (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (k : ℤ)

/-- `README.md`, Layer 8, 8.1. **Bounded denominators for congruence forms** with coefficients
in a number field `K`. The rational case is AlgebraicModularFormsAndSerreWeights R15.2's
`TauCeti.KatzModularForms.boundedDenominators`, consumed and not restated here. -/
theorem exists_bounded_denominators_numberField (hΓ : IsCongruenceSubgroup Γ)
    (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k)
    (hf : ∀ m, PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) ∈ K) :
    ∃ D : ℕ, D ≠ 0 ∧ ∀ m, ∃ z : NumberField.RingOfIntegers K,
      (D : ℂ) * PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) = z := sorry

/-- `README.md`, Layer 8, 8.2. **The unbounded-denominators theorem** (Calegari–Dimitrov–Tang,
Theorem 1.0.1), stated with no proof specified: a form on a finite-index subgroup whose coefficients at `∞` have bounded
denominators is a form on a congruence subgroup. -/
theorem unbounded_denominators (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (D : ℕ) (hD : D ≠ 0)
    (h : ∀ m, ∃ z : ℤ,
      (D : ℂ) * PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) = z) :
    ∃ (Γ₂ : Subgroup SL(2, ℤ)) (_ : IsCongruenceSubgroup Γ₂)
      (g : ModularForm (Γ₂.map (SpecialLinearGroup.mapGL ℝ)) k), ⇑g = ⇑f := sorry

/-- `README.md`, Layer 8, 8.2. The number-field form: coefficients in a number field `K` with
denominators bounded at every place. -/
theorem unbounded_denominators_numberField (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (D : NumberField.RingOfIntegers K) (hD : D ≠ 0)
    (h : ∀ m, ∃ z : NumberField.RingOfIntegers K,
      (D : ℂ) * PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) = z) :
    ∃ (Γ₂ : Subgroup SL(2, ℤ)) (_ : IsCongruenceSubgroup Γ₂)
      (g : ModularForm (Γ₂.map (SpecialLinearGroup.mapGL ℝ)) k), ⇑g = ⇑f := sorry

end Denominators

-- `README.md`, Layer 8, 8.3 (the Atkin–Swinnerton-Dyer congruences) is not seeded: Scholl's
-- hypothesis, a model of `(X(Γ̄), J)` over `ℚ` with the cusp `∞` rational, lives on BelyiMaps'
-- algebraic carrier, and no condition on the coefficients of one weight replaces it.

/-- `README.md`, Layer 8, 8.4. The smallest noncongruence examples have `dim S_4 = 1` (all four
index-`7` noncongruence classes; Scholl's hypothesis holds for the classes with cusp widths
`{4, 3}` and `{5, 2}`, not for the mirror pair with widths `{6, 1}`). -/
theorem exists_index_seven_noncongruence_finrank_four :
    ∃ (Γ' : Subgroup PSL(2, ℤ)) (_ : Γ'.FiniteIndex), Γ'.index = 7 ∧
      ¬ IsCongruenceSubgroup (lift Γ') ∧
      Module.finrank ℂ (CuspForm ((lift Γ').map (SpecialLinearGroup.mapGL ℝ)) 4) = 1 := sorry

/-! ## Layer 9: the LMFDB invariant layer -/

section LMFDB

variable (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 9. **The intrinsic label prefix**, the signature
`(psl2z_index, genus, n_c, n_e2, n_e3)` a `noncong` label starts with (e.g. `15_1_2_1_0_2_a`), as a
conjugacy invariant. The passport index and Galois-orbit letter that follow it are not targets. -/
noncomputable def labelPrefix : ℕ × ℕ × ℕ × ℕ × ℕ :=
  (Γ'.index, genus Γ' e, cuspCount Γ' e, ellipticTwo Γ' e, ellipticThree Γ' e)

/-- `README.md`, Layer 9. The prefix is a conjugacy invariant. -/
theorem labelPrefix_eq_of_conj (Γ'' : Subgroup PSL(2, ℤ)) [Γ''.FiniteIndex]
    (e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n) (g : ConjAct PSL(2, ℤ)) (hg : g • Γ' = Γ'') :
    labelPrefix Γ' e = labelPrefix Γ'' e'' := sorry

/-- `README.md`, Layer 9. The congruence flag is not determined by the prefix: two index-`8`
classes with prefix `(8, 0, 1, 2, 2)` differ in `is_congruence`. -/
theorem exists_labelPrefix_eq_isCongruence_ne :
    ∃ (Γ₁ Γ₂ : Subgroup PSL(2, ℤ)) (_ : Γ₁.FiniteIndex) (_ : Γ₂.FiniteIndex)
      (e₁ : PSL(2, ℤ) ⧸ Γ₁ ≃ Fin 8) (e₂ : PSL(2, ℤ) ⧸ Γ₂ ≃ Fin 8),
      labelPrefix Γ₁ e₁ = labelPrefix Γ₂ e₂ ∧ labelPrefix Γ₁ e₁ = (8, 0, 1, 2, 2) ∧
        IsCongruenceSubgroup (lift Γ₁) ∧ ¬ IsCongruenceSubgroup (lift Γ₂) := sorry

end LMFDB

end TauCetiRoadmap.NoncongruenceModularForms
