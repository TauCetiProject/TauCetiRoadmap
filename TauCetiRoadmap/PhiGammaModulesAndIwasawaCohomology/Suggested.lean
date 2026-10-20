import Mathlib

/-!
# PhiGammaModulesAndIwasawaCohomology: representative target signatures

The roadmap is README.md. This file records light definitions and representative
milestones statable against the pinned Mathlib APIs; it is not exhaustive. The
specified algebra structure models Frobenius, whose source and target can differ
at a fixed radius. Herr differentials use the order (φ − 1, γ − 1). The comparison
to ψ has a minus sign on the first degree-one coordinate and on degree two.
All linearity in the operator sections is over fixed coefficients.
-/

noncomputable section

open scoped TensorProduct BigOperators

open CategoryTheory

universe u v

namespace TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

/-! ## Layer 2: ψ on modules and its one-variable complex -/

section Linearization

variable {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
variable {M : Type v} [AddCommGroup M] [Module R M]
variable {N : Type v} [AddCommGroup N] [Module S N] [Module R N]
  [IsScalarTower R S N]

/-- The balanced extension of a specified R-linear scalar functional. -/
def psiTensor (r : S →ₗ[R] R) : S ⊗[R] M →ₗ[R] M :=
  TensorProduct.lift
    { toFun := fun s => r s • (LinearMap.id : M →ₗ[R] M)
      map_add' := by intros; simp [add_smul]
      map_smul' := by intros; simp [smul_smul] }

/-- The inverse Frobenius linearization is followed by the scalar functional. -/
def psiOfLinearization (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) : N →ₗ[R] M :=
  (psiTensor r).comp (L.symm.toLinearMap.restrictScalars R)

/-- Pure tensors fix the operator, including when annular source and target differ. -/
theorem psiOfLinearization_spec (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) :
    (∀ s m, psiOfLinearization r L (L (s ⊗ₜ[R] m)) = r s • m) ∧
    (∀ q : N →ₗ[R] M, (∀ s m, q (L (s ⊗ₜ[R] m)) = r s • m) →
      q = psiOfLinearization r L) := by
  sorry

/-- A normalized scalar retraction gives a left inverse to Frobenius. -/
theorem psiOfLinearization_leftInverse (r : S →ₗ[R] R) (hr : r 1 = 1)
    (L : S ⊗[R] M ≃ₗ[S] N) (m : M) :
    psiOfLinearization r L (L ((1 : S) ⊗ₜ[R] m)) = m := by
  sorry

/-- Linearized equivariant maps commute with ψ. -/
theorem psiOfLinearization_natural
    {M' N' : Type v} [AddCommGroup M'] [Module R M'] [AddCommGroup N']
    [Module S N'] [Module R N'] [IsScalarTower R S N']
    (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N) (L' : S ⊗[R] M' ≃ₗ[S] N')
    (f : M →ₗ[R] M') (g : N →ₗ[S] N')
    (hg : ∀ s m, g (L (s ⊗ₜ[R] m)) = L' (s ⊗ₜ[R] f m)) (x : N) :
    psiOfLinearization r L' (g x) = f (psiOfLinearization r L x) := by
  sorry

/-- A commuting semilinear action is respected when it respects the scalar retraction. -/
theorem psiOfLinearization_semilinear
    (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N)
    (σR : R →+* R) (σS : S →+* S)
    (hσ : ∀ a, σS (algebraMap R S a) = algebraMap R S (σR a))
    (gM : M →ₛₗ[σR] M) (gN : N →ₛₗ[σS] N)
    (hr : ∀ s, r (σS s) = σR (r s))
    (hg : ∀ s m, gN (L (s ⊗ₜ[R] m)) = L (σS s ⊗ₜ[R] gM m)) (x : N) :
    psiOfLinearization r L (gN x) = gM (psiOfLinearization r L x) := by
  sorry

/-- Finite continuous coordinate projections suffice for continuity of ψ. -/
theorem psiOfLinearization_continuous
    [TopologicalSpace M] [IsTopologicalAddGroup M] [ContinuousConstSMul R M]
    [TopologicalSpace N] {ι : Type*} [Fintype ι]
    (r : S →ₗ[R] R) (L : S ⊗[R] M ≃ₗ[S] N)
    (b : ι → S) (c : ι → N → M) (hc : ∀ i, Continuous (c i))
    (hexp : ∀ x, x = ∑ i, L (b i ⊗ₜ[R] c i x)) :
    Continuous (psiOfLinearization r L) := by
  sorry

/-- A nonnormalized scalar functional need not recover the second tensor factor. -/
example (m : ℚ) : psiTensor (0 : ℚ →ₗ[ℚ] ℚ) ((1 : ℚ) ⊗ₜ[ℚ] m) = 0 ∧
    psiTensor (LinearMap.id : ℚ →ₗ[ℚ] ℚ) ((2 : ℚ) ⊗ₜ[ℚ] (3 : ℚ)) = 6 := by
  norm_num [psiTensor]

/-- A coordinate retraction is not multiplication of the two scalar coordinates. -/
example :
    psiTensor (LinearMap.fst ℚ ℚ ℚ) ((0, 1) ⊗ₜ[ℚ] (7 : ℚ)) = 0 ∧
    psiTensor (LinearMap.fst ℚ ℚ ℚ) ((1, 0) ⊗ₜ[ℚ] (7 : ℚ)) = 7 := by
  norm_num [psiTensor]

/-- Inverse linearization, rather than the forward map, determines ψ. -/
example (L : ℚ ⊗[ℚ] ℚ ≃ₗ[ℚ] ℚ) (hL : ∀ s m, L (s ⊗ₜ[ℚ] m) = 2 * s * m) :
    psiOfLinearization (LinearMap.id : ℚ →ₗ[ℚ] ℚ) L 6 = 3 := by
  have h : L ((1 : ℚ) ⊗ₜ[ℚ] (3 : ℚ)) = 6 := by norm_num [hL]
  rw [← h]
  simp [psiOfLinearization, psiTensor]

/-- Reducing an integral ψ does not mean dividing a reduced trace by p. -/
example (L : ℤ ⊗[ℤ] ZMod 5 ≃ₗ[ℤ] ZMod 5)
    (hL : ∀ s m, L (s ⊗ₜ[ℤ] m) = s • m) :
    psiOfLinearization (LinearMap.id : ℤ →ₗ[ℤ] ℤ) L 1 = 1 ∧
      (5 : ZMod 5) * 1 = 0 := by
  have h : L ((1 : ℤ) ⊗ₜ[ℤ] (1 : ZMod 5)) = 1 := by simp [hL]
  constructor
  · calc
      psiOfLinearization (LinearMap.id : ℤ →ₗ[ℤ] ℤ) L 1 =
          psiOfLinearization (LinearMap.id : ℤ →ₗ[ℤ] ℤ) L
            (L ((1 : ℤ) ⊗ₜ[ℤ] (1 : ZMod 5))) := congrArg _ h.symm
      _ = 1 := by
        change psiTensor (LinearMap.id : ℤ →ₗ[ℤ] ℤ)
          (L.symm (L ((1 : ℤ) ⊗ₜ[ℤ] (1 : ZMod 5)))) = 1
        rw [L.symm_apply_apply]
        simp [psiTensor]
  · decide

end Linearization

section RankOne

variable {A : Type*} [CommRing A]

/-- In the basis φ(e) = a e, ψ acts by ψ(a⁻¹f) on coefficients. -/
def rankOnePsi (ψ : A →+ A) (a : Aˣ) : A →+ A where
  toFun f := ψ ((↑a⁻¹ : A) * f)
  map_zero' := by simp
  map_add' := by intros; simp [mul_add]

/-- Basis change uses the projection formula, not scalar linearity over the period ring. -/
theorem rankOnePsi_changeBasis (φ : A →+* A) (ψ : A →+ A)
    (hproj : ∀ c f, ψ (φ c * f) = c * ψ f) (a b : Aˣ) (f : A) :
    rankOnePsi ψ (Units.map φ.toMonoidHom b * a * b⁻¹) ((↑b⁻¹ : A) * f) =
      (↑b⁻¹ : A) * rankOnePsi ψ a f := by
  sorry

/-- The inverse Frobenius coefficient appears even for constant scalar ψ. -/
example : rankOnePsi (AddMonoidHom.id ℚ) (Units.mk0 2 (by decide)) 6 = 3 := by
  norm_num [rankOnePsi]

/-- A swap-semilinear ψ cannot pull a nonfixed inverse basis coefficient outside. -/
example :
    let swap : (ℚ × ℚ) →+ (ℚ × ℚ) :=
      { toFun := fun x => (x.2, x.1)
        map_zero' := rfl
        map_add' := fun _ _ => rfl }
    let a : (ℚ × ℚ)ˣ :=
      { val := (2, 3), inv := (1/2, 1/3)
        val_inv := by norm_num
        inv_val := by norm_num }
    rankOnePsi swap a 1 = (1/3, 1/2) ∧
      rankOnePsi swap a 1 ≠ (↑a⁻¹ : ℚ × ℚ) * swap 1 := by
  norm_num [rankOnePsi]

end RankOne

section Operators

variable {C : Type u} [CommRing C] {M : Type v} [AddCommGroup M] [Module C M]

/-- The coefficient-linear projector 1 − φψ. Its image is ker ψ when ψφ = 1. -/
def psiProjection (φ ψ : M →ₗ[C] M) : M →ₗ[C] M :=
  LinearMap.id - φ.comp ψ

/-- The fixed submodule for ψ, on the native kernel carrier. -/
def psiFixed (ψ : M →ₗ[C] M) : Submodule C M :=
  LinearMap.ker (ψ - LinearMap.id)

/-- Degree-two ψ cohomology uses the actual cokernel carrier. -/
abbrev psiCokernel (ψ : M →ₗ[C] M) := M ⧸ LinearMap.range (ψ - LinearMap.id)

/-- Projection to ker ψ gives a unique splitting even when φ is not onto. -/
theorem psiProjection_uniqueSplit (φ ψ : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) (x : M) :
    ∃! mk : M × LinearMap.ker ψ, x = φ mk.1 + (mk.2 : M) := by
  sorry

/-- The coefficient-linear projector is idempotent under the left-inverse relation. -/
theorem psiProjection_idempotent (φ ψ : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) :
    (psiProjection φ ψ).comp (psiProjection φ ψ) = psiProjection φ ψ := by
  sorry

/-- The complementary projector has exactly the ψ-zero submodule as its range. -/
theorem psiProjection_range (φ ψ : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) :
    LinearMap.range (psiProjection φ ψ) = LinearMap.ker ψ := by
  sorry

/-- The map 1 − φ from ψ-fixed vectors to ψ-zero vectors. -/
def oneSubPhiOnPsiOne (φ ψ : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) : psiFixed ψ →ₗ[C] LinearMap.ker ψ :=
  ((LinearMap.id - φ).comp (psiFixed ψ).subtype).codRestrict _ (by
    intro x
    change ψ (x.val - φ x.val) = 0
    have hx : ψ x.val - x.val = 0 := x.property
    have hφ : ψ (φ x.val) = x.val := by
      simpa only [LinearMap.comp_apply, LinearMap.id_apply] using LinearMap.congr_fun hψφ x.val
    rw [map_sub, hφ]
    exact hx)

/-- Evaluation of 1 − φ and its zero criterion on ψ-fixed vectors. -/
theorem oneSubPhiOnPsiOne_spec (φ ψ : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) (x : psiFixed ψ) :
    (oneSubPhiOnPsiOne φ ψ hψφ x : M) = x.val - φ x.val ∧
      (oneSubPhiOnPsiOne φ ψ hψφ x = 0 ↔ φ x.val = x.val) := by
  sorry

/-- The kernel inside ψ-fixed vectors is the common Frobenius-fixed submodule. -/
theorem oneSubPhiOnPsiOne_kernel (φ ψ : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) :
    LinearMap.ker (oneSubPhiOnPsiOne φ ψ hψφ) =
      (LinearMap.ker (φ - LinearMap.id)).comap (psiFixed ψ).subtype := by
  sorry

namespace psiComplex

/-- The ψ complex has its module only in degrees one and two. -/
abbrev term (M : Type v) [AddCommGroup M] [Module C M] (i : ℤ) : ModuleCat.{v} C :=
  if i = 1 ∨ i = 2 then ModuleCat.of C M else ModuleCat.of C PUnit

/-- The sole nonzero differential of the ψ complex is ψ − 1 in degree one. -/
def differential (ψ : M →ₗ[C] M) (i : ℤ) :
    term (C := C) M i ⟶ term (C := C) M (i + 1) :=
  if hi : i = 1 then by
    subst i
    exact ModuleCat.ofHom (ψ - LinearMap.id)
  else 0

end psiComplex

/-- The native two-term ψ complex in cohomological degrees one and two. -/
def psiComplex (ψ : M →ₗ[C] M) : CochainComplex (ModuleCat.{v} C) ℤ :=
  CochainComplex.of (psiComplex.term M) (psiComplex.differential ψ) (by
    intro i
    by_cases hi : i = 1
    · subst i
      simp [psiComplex.differential]
    · simp [psiComplex.differential, hi])

/-- A commuting linear map acts in both nonzero degrees of the ψ complex. -/
def psiComplex.map {N : Type v} [AddCommGroup N] [Module C N]
    (ψ : M →ₗ[C] M) (ψ' : N →ₗ[C] N) (h : M →ₗ[C] N)
    (hh : h.comp ψ = ψ'.comp h) : psiComplex ψ ⟶ psiComplex ψ' :=
  CochainComplex.ofHom (fun i => by
    by_cases hi : i = 1 ∨ i = 2
    · change psiComplex.term M i ⟶ psiComplex.term N i
      simp only [psiComplex.term, ite_eq_left hi]
      exact ModuleCat.ofHom h
    · exact 0) (by
      intro i
      by_cases hi : i = 1
      · subst i
        apply ModuleCat.hom_ext
        change (ψ' - LinearMap.id).comp h = h.comp (ψ - LinearMap.id)
        apply LinearMap.ext
        intro x
        change ψ' (h x) - h x = h (ψ x - x)
        rw [map_sub]
        exact congrArg (fun y => y - h x) (LinearMap.congr_fun hh x).symm
      · simp [psiComplex, CochainComplex.of_d, psiComplex.differential, hi])

/-- Identity maps give the identity chain map. -/
theorem psiComplex_map_id (ψ : M →ₗ[C] M) :
    psiComplex.map ψ ψ LinearMap.id (by simp) = CategoryTheory.CategoryStruct.id _ := by
  sorry

/-- Composition of commuting maps agrees with composition of chain maps. -/
theorem psiComplex_map_comp {N P : Type v} [AddCommGroup N] [Module C N]
    [AddCommGroup P] [Module C P] (ψ : M →ₗ[C] M) (ψ' : N →ₗ[C] N)
    (ψ'' : P →ₗ[C] P) (h : M →ₗ[C] N) (k : N →ₗ[C] P)
    (hh : h.comp ψ = ψ'.comp h) (hk : k.comp ψ' = ψ''.comp k) :
    psiComplex.map ψ ψ'' (k.comp h) (by
      rw [LinearMap.comp_assoc, hh, ← LinearMap.comp_assoc, hk, LinearMap.comp_assoc]) =
      psiComplex.map ψ ψ' h hh ≫ psiComplex.map ψ' ψ'' k hk := by
  sorry

/-- Degree-one homology is the native ψ-fixed kernel. -/
theorem psiComplex_h1 (ψ : M →ₗ[C] M) :
    ∃ e : (psiComplex ψ).homology 1 ≅ ModuleCat.of C (psiFixed ψ),
      ∀ z : (psiComplex ψ).cycles 1,
        (e.hom ((psiComplex ψ).homologyπ 1 z) : M) = (psiComplex ψ).iCycles 1 z := by
  sorry

/-- Degree-two homology is the native quotient by the range of ψ − 1. -/
theorem psiComplex_h2 (ψ : M →ₗ[C] M) :
    ∃ e : (psiComplex ψ).homology 2 ≅ ModuleCat.of C (psiCokernel ψ),
      ∀ z : (psiComplex ψ).cycles 2,
        e.hom ((psiComplex ψ).homologyπ 2 z) =
          Submodule.Quotient.mk ((psiComplex ψ).iCycles 2 z) := by
  sorry

/-- The ψ complex has no homology outside degrees one and two. -/
theorem psiComplex_homology_isZero (ψ : M →ₗ[C] M) (i : ℤ) (hi : i ≠ 1) (hi' : i ≠ 2) :
    CategoryTheory.Limits.IsZero ((psiComplex ψ).homology i) := by
  sorry

/-- The identity operator gives homology in degrees one and two, with scalar chain-map composition. -/
example :
    Nonempty ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).homology 1 ≅ ModuleCat.of ℚ ℚ) ∧
    Nonempty ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).homology 2 ≅ ModuleCat.of ℚ ℚ) ∧
    CategoryTheory.Limits.IsZero ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).homology 0) ∧
    psiComplex.map LinearMap.id LinearMap.id (6 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp) =
      psiComplex.map LinearMap.id LinearMap.id (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp) ≫
      psiComplex.map LinearMap.id LinearMap.id (3 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp) ∧
    (∀ i : ℤ, HomologicalComplex.homologyMap
        (psiComplex.map LinearMap.id LinearMap.id (6 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp)) i =
      HomologicalComplex.homologyMap
        (psiComplex.map LinearMap.id LinearMap.id (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp)) i ≫
      HomologicalComplex.homologyMap
        (psiComplex.map LinearMap.id LinearMap.id (3 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp)) i) := by
  have hz (i j : ℤ) : (psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).d i j = 0 := by
    by_cases hij : i + 1 = j
    · subst j
      change CochainComplex.of.d _ _ i (i + 1) = 0
      rw [CochainComplex.of_d]
      by_cases hi : i = 1
      · subst i
        change ModuleCat.ofHom ((LinearMap.id : ℚ →ₗ[ℚ] ℚ) - LinearMap.id) = 0
        simp
      · simp only [psiComplex.differential, dite_eq_right hi]
        rfl
    · exact CochainComplex.of_d_ne _ _ hij
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact ⟨(ShortComplex.HomologyData.ofZeros
      ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).sc 1) (hz _ _) (hz _ _)).left.homologyIso⟩
  · exact ⟨(ShortComplex.HomologyData.ofZeros
      ((psiComplex (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).sc 2) (hz _ _) (hz _ _)).left.homologyIso⟩
  · apply HomologicalComplex.ExactAt.isZero_homology
    apply HomologicalComplex.ExactAt.of_isZero
    change CategoryTheory.Limits.IsZero (ModuleCat.of ℚ PUnit)
    exact ModuleCat.isZero_of_subsingleton _
  · have hc : psiComplex.map LinearMap.id LinearMap.id
          (6 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp) =
        psiComplex.map LinearMap.id LinearMap.id (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp) ≫
        psiComplex.map LinearMap.id LinearMap.id (3 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) (by simp) := by
      apply HomologicalComplex.Hom.ext
      funext i
      by_cases h1 : i = 1
      · subst i
        apply ModuleCat.hom_ext
        change (6 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) =
          (3 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).comp (2 • LinearMap.id)
        apply LinearMap.ext
        intro x
        change (6 : ℚ) * x = 3 * (2 * x)
        ring
      · by_cases h2 : i = 2
        · subst i
          apply ModuleCat.hom_ext
          change (6 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) =
            (3 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).comp (2 • LinearMap.id)
          apply LinearMap.ext
          intro x
          change (6 : ℚ) * x = 3 * (2 * x)
          ring
        · have hi : ¬ (i = 1 ∨ i = 2) := by tauto
          simp [psiComplex.map, hi]

    refine ⟨hc, ?_⟩
    intro i
    rw [hc, HomologicalComplex.homologyMap_comp]

/-- A zero ψ gives an acyclic native complex, including its terms outside degrees one and two. -/
example : ∀ i : ℤ, CategoryTheory.Limits.IsZero ((psiComplex (0 : ℚ →ₗ[ℚ] ℚ)).homology i) := by
  intro i
  apply HomologicalComplex.ExactAt.isZero_homology
  by_cases h1 : i = 1
  · subst i
    rw [HomologicalComplex.exactAt_iff' (psiComplex (0 : ℚ →ₗ[ℚ] ℚ)) 0 1 2
      (by simp) (by simp), ShortComplex.moduleCat_exact_iff]
    · change ∀ x : ℚ, (0 : ℚ) - x = 0 → ∃ _ : PUnit, (0 : ℚ) = x
      intro x hx
      have hx0 : x = 0 := by
        change (0 : ℚ) - x = 0 at hx
        simpa using hx
      exact ⟨0, by simpa using hx0.symm⟩
  · by_cases h2 : i = 2
    · subst i
      rw [HomologicalComplex.exactAt_iff' (psiComplex (0 : ℚ →ₗ[ℚ] ℚ)) 1 2 3
        (by simp) (by simp), ShortComplex.moduleCat_exact_iff]
      · change ∀ x : ℚ, (0 : PUnit) = 0 → ∃ y : ℚ, (0 : ℚ) - y = x
        intro x _
        exact ⟨-x, by simp⟩
    · apply HomologicalComplex.ExactAt.of_isZero
      have hi : ¬ (i = 1 ∨ i = 2) := by tauto
      simpa only [psiComplex, psiComplex.term, ite_eq_right hi] using
        (ModuleCat.isZero_of_subsingleton (ModuleCat.of ℚ PUnit))

/-- On the common fixed space of identity operators, the bundled 1 − φ map vanishes. -/
example : oneSubPhiOnPsiOne (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id (by simp) = 0 := by
  apply LinearMap.ext
  intro x
  apply Subtype.ext
  change x.val - x.val = 0
  exact sub_self _

/-- Polynomial coefficient extraction divides exponents divisible by three. -/
def polynomialPsi : Polynomial ℚ →ₗ[ℚ] Polynomial ℚ where
  toFun := Polynomial.contract 3
  map_add' := Polynomial.contract_add (by decide)
  map_smul' := by
    intro c f
    ext n
    simp [Polynomial.coeff_contract (by decide : 3 ≠ 0)]

/-- A nonmultiplicative Frobenius section makes 1 − φ nonzero on a ψ-fixed polynomial. -/
example :
    let φ : Polynomial ℚ →ₗ[ℚ] Polynomial ℚ :=
      (Polynomial.expand ℚ 3).toLinearMap +
        (Polynomial.lcoeff ℚ 0).smulRight Polynomial.X
    ∃ h : polynomialPsi.comp φ = LinearMap.id,
      ∃ x : psiFixed polynomialPsi,
        x.val = 1 ∧
        (oneSubPhiOnPsiOne φ polynomialPsi h x : Polynomial ℚ) = -Polynomial.X ∧
        oneSubPhiOnPsiOne φ polynomialPsi h x ≠ 0 := by
  dsimp only
  have hψX : polynomialPsi Polynomial.X = 0 := by
    ext n
    simp only [polynomialPsi, LinearMap.coe_mk, AddHom.coe_mk,
      Polynomial.coeff_contract (by decide : 3 ≠ 0), Polynomial.coeff_X,
      Polynomial.coeff_zero, ite_eq_right (by omega : ¬ (1 = n * 3))]
  have hψ1 : polynomialPsi 1 = 1 := by
    simpa [polynomialPsi] using
      (Polynomial.contract_expand (R := ℚ) (f := 1) 3 (by decide : 3 ≠ 0))
  have h : polynomialPsi.comp ((Polynomial.expand ℚ 3).toLinearMap +
      (Polynomial.lcoeff ℚ 0).smulRight Polynomial.X) =
        LinearMap.id := by
    apply LinearMap.ext
    intro f
    change polynomialPsi ((Polynomial.expand ℚ 3) f + f.coeff 0 • Polynomial.X) = f
    rw [map_add, map_smul, hψX, smul_zero, add_zero]
    exact Polynomial.contract_expand 3 (by decide : 3 ≠ 0)
  refine ⟨h, ⟨1, by change polynomialPsi 1 - 1 = 0; rw [hψ1]; simp⟩, rfl, ?_, ?_⟩
  · simp [oneSubPhiOnPsiOne, LinearMap.smulRight]
  · intro hz
    have hv := congrArg (fun y : LinearMap.ker polynomialPsi => (y : Polynomial ℚ)) hz
    simp [oneSubPhiOnPsiOne, LinearMap.smulRight] at hv


/-- The polynomial projector retains U, kills U³, and 1 − φ misses U on ψ-fixed vectors. -/
example :
    let φ := (Polynomial.expand ℚ 3).toLinearMap
    psiProjection φ polynomialPsi Polynomial.X = Polynomial.X ∧
    psiProjection φ polynomialPsi (Polynomial.X ^ 3) = 0 ∧
    ¬ ∃ x : psiFixed polynomialPsi, x.val - φ x.val = Polynomial.X := by
  dsimp only
  have hψX : polynomialPsi Polynomial.X = 0 := by
    apply Polynomial.ext
    intro n
    change (Polynomial.contract 3 (Polynomial.X : Polynomial ℚ)).coeff n =
      (0 : Polynomial ℚ).coeff n
    rw [Polynomial.coeff_contract (by decide : 3 ≠ 0), Polynomial.coeff_X,
      Polynomial.coeff_zero, ite_eq_right (by omega : ¬ (1 = n * 3))]
  have hψX3 : polynomialPsi (Polynomial.X ^ 3) = Polynomial.X := by
    simpa [polynomialPsi] using (Polynomial.contract_expand (R := ℚ) (f := Polynomial.X) 3
      (by decide : 3 ≠ 0))
  refine ⟨by simp [psiProjection, hψX], by simp [psiProjection, hψX3], ?_⟩
  rintro ⟨x, hx⟩
  have hfix : polynomialPsi x.val = x.val := sub_eq_zero.mp x.property
  have hdeg : x.val.natDegree = 0 := by
    by_contra hn
    have hc := congrArg (fun f : Polynomial ℚ => f.coeff x.val.natDegree) hfix
    have hz : x.val.coeff (x.val.natDegree * 3) = 0 :=
      Polynomial.coeff_eq_zero_of_natDegree_lt (by omega)
    have hc0 : x.val.leadingCoeff = 0 := by
      simpa only [polynomialPsi, LinearMap.coe_mk, AddHom.coe_mk,
        Polynomial.coeff_contract (by decide : 3 ≠ 0), hz, Polynomial.coeff_natDegree]
        using hc.symm
    have hx0 := Polynomial.leadingCoeff_eq_zero.mp hc0
    simp [hx0] at hn
  have hconst := Polynomial.eq_C_of_natDegree_le_zero (Nat.le_of_eq hdeg)
  rw [hconst] at hx
  have hz : (0 : Polynomial ℚ) = Polynomial.X := by simpa using hx
  exact Polynomial.X_ne_zero hz.symm

/-- If ψ = 0 then the fixed space vanishes, while its cokernel also vanishes. -/
example : psiFixed (0 : ℚ →ₗ[ℚ] ℚ) = ⊥ ∧
    Subsingleton (psiCokernel (0 : ℚ →ₗ[ℚ] ℚ)) := by
  constructor
  · ext x
    simp [psiFixed]
  · have h : LinearMap.range ((0 : ℚ →ₗ[ℚ] ℚ) - LinearMap.id) = ⊤ := by
      ext x
      simp only [LinearMap.mem_range, Submodule.mem_top, iff_true]
      exact ⟨-x, by simp⟩
    change Subsingleton (ℚ ⧸ LinearMap.range ((0 : ℚ →ₗ[ℚ] ℚ) - LinearMap.id))
    rw [h]
    infer_instance

/-! ## Layer 3: signed Herr comparison and arithmetic descent -/

/-- Degree zero of the Herr complex, in the order φ followed by γ. -/
def herrD0 (F G : M →ₗ[C] M) : M →ₗ[C] M × M :=
  (F - LinearMap.id).prod (G - LinearMap.id)

/-- The second differential is (γ − 1)a − (φ − 1)b. -/
def herrD1 (F G : M →ₗ[C] M) : M × M →ₗ[C] M :=
  (G - LinearMap.id).comp (LinearMap.fst C M M) -
    (F - LinearMap.id).comp (LinearMap.snd C M M)

/-- Commutation is exactly the condition needed for the square-zero relation. -/
theorem herrDifferentials_sq (F G : M →ₗ[C] M) (hFG : F.comp G = G.comp F) :
    (herrD1 F G).comp (herrD0 F G) = 0 := by
  sorry

/-- The forward degree-one comparison; degree zero is identity and degree two is −ψ. -/
def phiPsiOne (ψ : M →ₗ[C] M) : M × M →ₗ[C] M × M :=
  (-ψ).prodMap LinearMap.id

/-- The corrected degree-one section uses a resolvent q of γ − 1 on ker ψ. -/
def herrSectionOne (φ q : M →ₗ[C] M) : M × M →ₗ[C] M × M :=
  ((-φ).comp (LinearMap.fst C M M) - q.comp (LinearMap.snd C M M)).prod
    (LinearMap.snd C M M)

/-- Positive powers of a generator use the finite geometric-sum operator. -/
def herrGeneratorSum (G : Module.End C M) (n : ℕ) : Module.End C M :=
  ∑ i ∈ Finset.range n, G ^ i

/-- Both squares for the signed comparison use ψφ = 1 and γψ = ψγ. -/
theorem phiPsiComparison_squares (φ ψ G : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) (hGψ : G.comp ψ = ψ.comp G) :
    (phiPsiOne ψ).comp (herrD0 φ G) = herrD0 ψ G ∧
    (herrD1 ψ G).comp (phiPsiOne ψ) = (-ψ).comp (herrD1 φ G) := by
  sorry

/-- The corrected section is a chain map and a right inverse with its degree-two map −φ. -/
theorem herrComparisonSection (φ ψ G q : M →ₗ[C] M)
    (hψφ : ψ.comp φ = LinearMap.id) (hGφ : G.comp φ = φ.comp G)
    (hGψ : G.comp ψ = ψ.comp G)
    (hleft : (G - LinearMap.id).comp q = psiProjection φ ψ)
    (hright : q.comp (G - LinearMap.id) = psiProjection φ ψ)
    (hqφ : q.comp φ = 0) (hψq : ψ.comp q = 0) :
    (herrSectionOne φ q).comp (herrD0 ψ G) = herrD0 φ G ∧
    (herrD1 φ G).comp (herrSectionOne φ q) = (-φ).comp (herrD1 ψ G) ∧
    (phiPsiOne ψ).comp (herrSectionOne φ q) = LinearMap.id := by
  sorry

/-- The two nonzero components of id − SF = dH + Hd, for H²(c) = (qc, 0). -/
theorem herrComparisonHomotopy (φ ψ G q : M →ₗ[C] M)
    (hleft : (G - LinearMap.id).comp q = psiProjection φ ψ)
    (hright : q.comp (G - LinearMap.id) = psiProjection φ ψ)
    (hqφ : q.comp φ = 0) :
    LinearMap.id - (herrSectionOne φ q).comp (phiPsiOne ψ) =
      (q.prod (0 : M →ₗ[C] M)).comp (herrD1 φ G) ∧
    LinearMap.id - (-φ).comp (-ψ) =
      (herrD1 φ G).comp (q.prod (0 : M →ₗ[C] M)) := by
  sorry

/-- The numerical witness distinguishes the second differential from the opposite sign. -/
example : herrD0 (C := ℚ) (M := ℚ) (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
      (3 • LinearMap.id) 7 = (7, 14) ∧
    herrD1 (C := ℚ) (M := ℚ) (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
      (3 • LinearMap.id) (5, 11) = -1 := by
  norm_num [herrD0, herrD1]

/-- For φ = ψ = 1, the first coordinate is negated. -/
example : phiPsiOne (LinearMap.id : ℚ →ₗ[ℚ] ℚ) (5, 11) = (-5, 11) := by
  rfl

/-- The polynomial resolvent satisfies every section hypothesis and corrects (0,U). -/
example :
    let φ := (Polynomial.expand ℚ 3).toLinearMap
    let ψ := polynomialPsi
    let G := 2 • (LinearMap.id : Polynomial ℚ →ₗ[ℚ] Polynomial ℚ)
    let q := psiProjection φ ψ
    ψ.comp φ = LinearMap.id ∧
    G.comp φ = φ.comp G ∧ G.comp ψ = ψ.comp G ∧
    (G - LinearMap.id).comp q = psiProjection φ ψ ∧
    q.comp (G - LinearMap.id) = psiProjection φ ψ ∧
    q.comp φ = 0 ∧ ψ.comp q = 0 ∧
    herrSectionOne φ q (0, Polynomial.X) = (-Polynomial.X, Polynomial.X) := by
  dsimp only
  have hψφ : polynomialPsi.comp (Polynomial.expand ℚ 3).toLinearMap = LinearMap.id := by
    apply LinearMap.ext
    intro f
    exact Polynomial.contract_expand 3 (by decide : 3 ≠ 0)
  have hG : 2 • (LinearMap.id : Polynomial ℚ →ₗ[ℚ] Polynomial ℚ) - LinearMap.id =
      LinearMap.id := by
    ext f
    simp [two_smul]
  have hψX : polynomialPsi Polynomial.X = 0 := by
    apply Polynomial.ext
    intro n
    change (Polynomial.contract 3 (Polynomial.X : Polynomial ℚ)).coeff n =
      (0 : Polynomial ℚ).coeff n
    rw [Polynomial.coeff_contract (by decide : 3 ≠ 0), Polynomial.coeff_X,
      Polynomial.coeff_zero, ite_eq_right (by omega : ¬ (1 = n * 3))]
  refine ⟨hψφ, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · apply LinearMap.ext
    intro f
    change (2 : ℚ) • _ = (Polynomial.expand ℚ 3).toLinearMap ((2 : ℚ) • f)
    exact ((Polynomial.expand ℚ 3).toLinearMap.map_smul 2 f).symm
  · apply LinearMap.ext
    intro f
    change (2 : ℚ) • polynomialPsi f = polynomialPsi ((2 : ℚ) • f)
    exact (polynomialPsi.map_smul 2 f).symm
  · rw [hG]; simp
  · rw [hG]; simp
  · apply LinearMap.ext
    intro f
    have hf := LinearMap.congr_fun hψφ f
    change _ - (Polynomial.expand ℚ 3) (polynomialPsi ((Polynomial.expand ℚ 3) f)) = 0
    rw [show polynomialPsi ((Polynomial.expand ℚ 3) f) = f from hf]
    simp
  · apply LinearMap.ext
    intro f
    have hf := LinearMap.congr_fun hψφ (polynomialPsi f)
    change polynomialPsi (f - (Polynomial.expand ℚ 3) (polynomialPsi f)) = 0
    rw [map_sub, show polynomialPsi ((Polynomial.expand ℚ 3) (polynomialPsi f)) =
      polynomialPsi f from hf]
    simp
  · simp [herrSectionOne, psiProjection, hψX]

/-- Characteristic three makes the third generator sum zero at the identity. -/
example : herrGeneratorSum (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) 0 = 0 ∧
    herrGeneratorSum (2 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) 3 = 7 • LinearMap.id ∧
    herrGeneratorSum (C := ℤ) (M := ZMod 3) LinearMap.id 3 =
      (0 : ZMod 3 →ₗ[ℤ] ZMod 3) := by
  refine ⟨by simp [herrGeneratorSum], ?_, ?_⟩
  · apply LinearMap.ext
    intro x
    norm_num [herrGeneratorSum, Finset.sum_range_succ, pow_succ, Module.End.mul_apply]
    ring
  · apply LinearMap.ext
    intro x
    change (∑ i ∈ Finset.range 3, (LinearMap.id : Module.End ℤ (ZMod 3)) ^ i) x = 0
    norm_num [Finset.sum_range_succ, show (LinearMap.id : Module.End ℤ (ZMod 3)) = 1 from rfl,
      ← add_mul]
    left
    decide

end Operators

/-!
Definitions and constructions specified in README.md whose arithmetic carriers are not
present at the pins: PhiModule and its skew-ring cohomology; fixed-idempotent decomposition;
ASW basis torsors and descent; small BCH and Greenberg groups; all-component coefficients;
integral and extended étale modules; relative annuli and RelativePhiGammaModule;
integral overconvergent lattices; radius models and decompletion; equivariant period-sheaf
realizations; character-type lines over Q_p and general K; native Herr complexes, maps,
resolvents, chain sections, homotopies, generator changes, arithmetic Δ models and dyadic
derived descent; localized Herr complexes and their stable lattices; period ψ and module ψ;
relative analytic Γ rings and coadmissible modules;
cyclotomicDeformation on its affinoid exhaustion; the independent derived Iwasawa complex,
finite-character specialization and the residue-normalized Iwasawa pairing; H_e and its
exponential; the all-level exponential-image condition; unramified Wach base change,
good bases and their coordinate maps; CharacterWeights and the Sen adapter; rank-one
support graphs, coefficient line bundles, Triangulation, flattening modifications and
coherent flags with t-power defects; senModule and senPolynomial for arbitrary affinoid
relative modules; finiteDiscreteHochschildSerreRoof with its coherent quotient action. Their full API and checks are in README.md.

Additional README API targets for the light definitions are psiOfLinearization_unique;
rankOnePsi_apply, rankOnePsi_leftInverse, rankOnePsi_basisChange;
embeddingPeriodIdeal and embeddingPeriodIdeal_comaximal, embeddingPeriodIdeal_prod;
characterModule and characterModule_mul, characterModule_inv, characterModule_baseChange,
characterModule_reciprocity, characterModule_cohomology,
characterModule_deRham_iff_locallyAlgebraic.
Further milestones: psiCokernel_finite;
psiFixed_generation and psiFixed_pairingPerfect. Their arithmetic carriers and native
constructions are specified by the README.
-/

end TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology
