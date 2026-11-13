/-
Copyright (c) 2026 Emiel Lorist. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Normed.Module.TensorProduct.Completion

/-!
# Bochner spaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states headline theorems against
the pinned Mathlib and Tau Ceti APIs. These are suggested forms, not an exhaustive checklist;
the README remains the definitive specification. Proofs admitted with `sorry` are targets.

The carriers are Mathlib's `Lp`, `LinearPMap`, `StrongDual`, `VectorMeasure` and `Submodule`.
The completed projective tensor product is Tau Ceti's `CompletedProjectiveTensor`.
The duality map is Mathlib's existing `ContinuousLinearMap.lpPairing`. The predicates for
weak/Pettis integrability and the Radon–Nikodým property have explicit mathematical content.
The support-restricted infinity space is a submodule of native `Lp`, not another quotient.

The principal milestones named in the README summary have signatures below. Supporting
approximation, convolution, series, measure-algebra and example APIs remain in the README.

All dual pairings are bilinear, including over `ℂ`. Real scalar structures used for Bochner
integration are compatible with the declared `RCLike` scalar structure. Completeness,
exponent bounds, and finite/σ-finite measure assumptions are explicit where needed.
-/

noncomputable section

open MeasureTheory Filter Set TopologicalSpace
open scoped ENNReal Topology TensorProduct

namespace TauCetiRoadmap.BochnerSpaces

universe u v w

variable {𝕜 : Type*} [RCLike 𝕜]
variable {S : Type u} [MeasurableSpace S] {μ : Measure S}
variable {X : Type v} [NormedAddCommGroup X] [NormedSpace 𝕜 X]

/-! ## Layer 1: Measurability -/

/-- §1.1: the general Pettis measurability theorem, with a closed separable linear range.
The whole target need not be separable, and no measure on the source is required. -/
theorem stronglyMeasurable_iff_scalar_tests (f : S → X) :
    StronglyMeasurable f ↔
      (∃ E : Submodule 𝕜 X, IsClosed (E : Set X) ∧ IsSeparable (E : Set X) ∧
        ∀ s, f s ∈ E) ∧
      ∀ x' : StrongDual 𝕜 X, Measurable (fun s => x' (f s)) := by
  sorry

/-- §1.2: essential separability and scalar a.e. measurability. The scalar tests can have
different exceptional sets; the theorem constructs a vector-valued representative. -/
theorem aestronglyMeasurable_iff_scalar_tests (f : S → X) :
    AEStronglyMeasurable f μ ↔
      (∃ E : Submodule 𝕜 X, IsClosed (E : Set X) ∧ IsSeparable (E : Set X) ∧
        ∀ᵐ s ∂μ, f s ∈ E) ∧
      ∀ x' : StrongDual 𝕜 X, AEMeasurable (fun s => x' (f s)) μ := by
  sorry

/-- §1.2: the stronger finite-support convention uses the same convention in its scalar
tests. It does not silently replace `AEFinStronglyMeasurable` by `AEStronglyMeasurable`. -/
theorem aefinStronglyMeasurable_iff_scalar_tests (f : S → X) :
    AEFinStronglyMeasurable f μ ↔
      (∃ E : Submodule 𝕜 X, IsClosed (E : Set X) ∧ IsSeparable (E : Set X) ∧
        ∀ᵐ s ∂μ, f s ∈ E) ∧
      ∀ x' : StrongDual 𝕜 X, AEFinStronglyMeasurable (fun s => x' (f s)) μ := by
  sorry

/-! ## Layer 2: The Bochner integral -/

section BochnerIntegral

variable [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X]
variable {Y : Type w} [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]
  [NormedSpace ℝ Y] [IsScalarTower ℝ 𝕜 Y]

/-- §2.1: Hille's theorem in graph form. There is no dense-domain hypothesis. -/
theorem integral_mem_graph [CompleteSpace X] [CompleteSpace Y]
    (T : X →ₗ.[𝕜] Y) (hT : T.IsClosed)
    {f : S → X} {g : S → Y} (hf : Integrable f μ) (hg : Integrable g μ)
    (hfg : ∀ᵐ s ∂μ, (f s, g s) ∈ T.graph) :
    (∫ s, f s ∂μ, ∫ s, g s ∂μ) ∈ T.graph := by
  sorry

/-- §2.3: finite-positive-measure averages detect a closed convex constraint on a
σ-finite space. The zero-measure case does not require the set to be nonempty. -/
theorem ae_mem_of_set_averages [CompleteSpace X] [SigmaFinite μ]
    {f : S → X} (hf : Integrable f μ)
    {C : Set X} (hC : IsClosed C) (hconv : Convex ℝ C)
    (havg : ∀ A : Set S, MeasurableSet A → 0 < μ A → μ A < ∞ →
      (μ A).toReal⁻¹ • (∫ s in A, f s ∂μ) ∈ C) :
    ∀ᵐ s ∂μ, f s ∈ C := by
  sorry

end BochnerIntegral

/-! ## Layer 3: The Bochner spaces Lᵖ(S;X) -/

/-- §3.1: `L∞_σ(μ; X)` with global a.e. equivalence, as a submodule of native `Lp`.
The closure obligations concern representatives only through a.e.-invariant membership. -/
def linftySigma (𝕜 : Type*) [RCLike 𝕜] (X : Type v) [NormedAddCommGroup X]
    [NormedSpace 𝕜 X] (μ : Measure S) : Submodule 𝕜 (Lp X ∞ μ) where
  carrier := {f | AEFinStronglyMeasurable (f : S → X) μ}
  zero_mem' := let ⟨g, hg, h⟩ := aefinStronglyMeasurable_zero (α := S) (β := X) μ
    ⟨g, hg, (Lp.coeFn_zero X ∞ μ).trans h⟩
  add_mem' := fun {f g} hf hg => let ⟨k, hk, h⟩ := AEFinStronglyMeasurable.add hf hg
    ⟨k, hk, (Lp.coeFn_add f g).trans h⟩
  smul_mem' := fun c f hf => let ⟨k, hk, h⟩ := AEFinStronglyMeasurable.const_smul hf c
    ⟨k, hk, (Lp.coeFn_smul c f).trans h⟩

/-- §3.1: the submodule is closed in native `Lp`; it is therefore complete when `X` is. -/
theorem isClosed_linftySigma : IsClosed (linftySigma 𝕜 X μ : Set (Lp X ∞ μ)) := by
  sorry

/-! ## Layer 4: Minkowski's inequality, Fubini's theorem and projective tensor products -/

section Fubini

variable {T : Type w} [MeasurableSpace T] (ν : Measure T)
variable (p : ℝ≥0∞) [Fact (1 ≤ p)]

/-- §4.1: for finite exponents the mixed-norm interchange is an injective contraction
on arbitrary measure spaces, specified on finite-measure rectangle tensors. -/
theorem exists_minkowskiContraction [CompleteSpace X] (q : ℝ≥0∞) [Fact (1 ≤ q)]
    (hpq : p ≤ q) (hq : q ≠ ∞) :
    ∃ L : Lp (Lp X q ν) p μ →L[𝕜] Lp (Lp X p μ) q ν,
      ‖L‖ ≤ 1 ∧ Function.Injective L ∧
      ∀ (A : Set S) (B : Set T) (hA : MeasurableSet A) (hB : MeasurableSet B)
        (hμA : μ A ≠ ⊤) (hνB : ν B ≠ ⊤) (x : X),
        L (indicatorConstLp p hA hμA (indicatorConstLp q hB hνB x)) =
          indicatorConstLp q hB hνB (indicatorConstLp p hA hμA x) := by
  sorry

/-- §4.2: the isometric equivalence includes a representative-level section formula.
The a.e. equality in the inner variable is nested under an a.e. outer quantifier. -/
theorem exists_fubiniEquiv [CompleteSpace X] [SigmaFinite μ] [SigmaFinite ν]
    (hp : p ≠ ∞) :
    ∃ e : Lp X p (μ.prod ν) ≃ₗᵢ[𝕜] Lp (Lp X p ν) p μ,
      ∀ F : Lp X p (μ.prod ν),
        ∀ᵐ s ∂μ, ∀ᵐ t ∂ν, ((e F) s) t = F (s, t) := by
  sorry

end Fubini

/-- §4.4: the native completed projective tensor product represents Bochner L¹,
with the canonical a.e. formula on pure tensors, for an arbitrary measure. -/
theorem exists_lpOneTensorEquiv [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X]
    [CompleteSpace X] :
    ∃ e : TauCeti.CompletedProjectiveTensor 𝕜 (Lp 𝕜 1 μ) X ≃ₗᵢ[𝕜] Lp X 1 μ,
      ∀ (φ : Lp 𝕜 1 μ) (x : X),
        (e ((⟨φ ⊗ₜ x⟩ : TauCeti.ProjectiveTensor 𝕜 (Lp 𝕜 1 μ) X) :
          TauCeti.CompletedProjectiveTensor 𝕜 (Lp 𝕜 1 μ) X) : S → X) =ᵐ[μ]
            fun s => φ s • x := by
  sorry

/-! ## Layer 6: The Pettis integral -/

/-- §6.1: all continuous scalar tests are integrable. No strong measurability is included. -/
def WeaklyIntegrable (f : S → X) (μ : Measure S) : Prop :=
  ∀ x' : StrongDual 𝕜 X, Integrable (fun s => x' (f s)) μ

/-- §6.2: every measurable set integral is represented by a vector in `X`.
Requiring representation just for the whole space would be weaker and incorrect here. -/
def PettisIntegrable (f : S → X) (μ : Measure S) : Prop :=
  WeaklyIntegrable (𝕜 := 𝕜) f μ ∧
    ∀ A : Set S, MeasurableSet A →
      ∃ x : X, ∀ x' : StrongDual 𝕜 X, x' x = ∫ s in A, x' (f s) ∂μ

section BanachPettis

/-- §6.3: Pettis set integrals form a native norm-countably additive vector measure.
No assertion of finite total variation is made. -/
theorem exists_pettisVectorMeasure [CompleteSpace X]
    (f : S → X) (hf : PettisIntegrable (𝕜 := 𝕜) f μ) :
    ∃ m : VectorMeasure S X, ∀ A : Set S, MeasurableSet A →
      ∀ x' : StrongDual 𝕜 X, x' (m A) = ∫ s in A, x' (f s) ∂μ := by
  sorry

/-- §6.4: reflexivity suffices for weakly integrable functions to be Pettis integrable. -/
theorem pettisIntegrable_of_reflexive [CompleteSpace X]
    (hX : Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 X))
    {f : S → X} (hf : WeaklyIntegrable (𝕜 := 𝕜) f μ) :
    PettisIntegrable (𝕜 := 𝕜) f μ := by
  sorry

/-- §6.4: scalar Lᵖ bounds with p > 1 give Pettis integrability after multiplication
by an Lᑫ scalar function. The finite exponent q permits localization to its σ-finite support. -/
theorem pettisIntegrable_smul_of_weak_memLp [CompleteSpace X]
    (p q : ℝ≥0∞) [p.HolderConjugate q] (hp : 1 < p)
    {f : S → X} (hf : AEStronglyMeasurable f μ)
    (hw : ∀ x' : StrongDual 𝕜 X, MemLp (fun s => x' (f s)) p μ)
    {φ : S → 𝕜} (hφ : MemLp φ q μ) :
    PettisIntegrable (𝕜 := 𝕜) (fun s => φ s • f s) μ := by
  sorry

/-- §6.4: absence of a closed isomorphic copy of c₀ makes a.e. strongly measurable,
weakly integrable functions Pettis integrable. A bounded-below linear map detects such a copy. -/
theorem pettisIntegrable_of_forall_not_antilipschitz [CompleteSpace X]
    (hX : ∀ (T : ZeroAtInftyContinuousMap ℕ 𝕜 →L[𝕜] X) (K : NNReal),
      ¬ AntilipschitzWith K T)
    {f : S → X} (hf : AEStronglyMeasurable f μ)
    (hw : WeaklyIntegrable (𝕜 := 𝕜) f μ) :
    PettisIntegrable (𝕜 := 𝕜) f μ := by
  sorry

end BanachPettis

/-! ## Layer 7: The Radon–Nikodým property and representable operators -/

section RadonNikodym

-- RNP is a property of the underlying real Banach space, independent of a choice of
-- real or complex notation for duals. Complex spaces use restriction of scalars.
variable (X : Type v) [NormedAddCommGroup X] [NormedSpace ℝ X]

/-- §7.2: RNP with respect to a fixed measure, using native variation and vector densities. -/
def HasRNPWith (μ : Measure S) : Prop :=
  ∀ m : VectorMeasure S X, m.variation Set.univ < ∞ → m.variation ≪ μ →
    ∃ f : S → X, Integrable f μ ∧ m = μ.withDensityᵥ f

/-- §7.2: intrinsic RNP is defined using Lebesgue measure on the unit interval. -/
def HasRNP : Prop :=
  HasRNPWith X (volume.restrict (Set.Icc (0 : ℝ) 1))

/-- §7.2: the interval definition is universal for finite measure spaces. -/
theorem hasRNP_iff_finite_measures [CompleteSpace X] :
    HasRNP X ↔ ∀ (A : Type u) (_ : MeasurableSpace A) (ν : Measure A),
      IsFiniteMeasure ν → HasRNPWith X ν := by
  sorry

/-- §7.2: the same characterization holds for σ-finite spaces, not all positive measures. -/
theorem hasRNP_iff_sigmaFinite_measures [CompleteSpace X] :
    HasRNP X ↔ ∀ (A : Type u) (_ : MeasurableSpace A) (ν : Measure A),
      SigmaFinite ν → HasRNPWith X ν := by
  sorry

/-- §7.5: separability is required of the dual itself. -/
theorem hasRNP_strongDual_of_separable [CompleteSpace X]
    [SeparableSpace (StrongDual ℝ X)] :
    HasRNP (StrongDual ℝ X) := by
  sorry

end RadonNikodym

section RepresentableOperators

variable [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X]

/-- §7.3: the operator represented by an essentially bounded vector-valued density.
This uses the native bilinear pairing for scalar multiplication. -/
abbrev representableOperatorMap [CompleteSpace X] :
    Lp X ∞ μ →L[𝕜] (Lp 𝕜 1 μ →L[𝕜] X) :=
  (ContinuousLinearMap.lsmul 𝕜 𝕜 : 𝕜 →L[𝕜] X →L[𝕜] X).flip.lpPairing μ ∞ 1

/-- §7.3: the representing map is isometric on a σ-finite space. -/
theorem norm_representableOperatorMap [CompleteSpace X] [SigmaFinite μ] (g : Lp X ∞ μ) :
    ‖representableOperatorMap (𝕜 := 𝕜) g‖ = ‖g‖ := by
  sorry

/-- §7.3: every bounded operator on scalar `L¹` is represented exactly when the target
has RNP with respect to this measure. -/
theorem representableOperatorMap_surjective_iff [CompleteSpace X] [SigmaFinite μ] :
    Function.Surjective (representableOperatorMap (𝕜 := 𝕜) (X := X) (μ := μ)) ↔
      HasRNPWith X μ := by
  sorry

end RepresentableOperators

/-! ## Layer 8: Duality of Bochner spaces -/

section Duality

variable (𝕜 X μ) (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
  [q.HolderConjugate p]

/-- §8.1: the canonical map already exists as the native bilinear `Lp` pairing.
This abbreviation fixes orientation; it introduces no new carrier or integral. -/
abbrev bochnerDualMap : Lp (StrongDual 𝕜 X) q μ →L[𝕜] StrongDual 𝕜 (Lp X p μ) :=
  (ContinuousLinearMap.id 𝕜 (StrongDual 𝕜 X)).lpPairing μ q p

variable {𝕜 X μ p q}

/-- §8.1: all conjugate endpoints are included on σ-finite spaces. -/
theorem norm_bochnerDualMap [SigmaFinite μ] (g : Lp (StrongDual 𝕜 X) q μ) :
    ‖bochnerDualMap (X := X) 𝕜 μ p q g‖ = ‖g‖ := by
  sorry

/-- §8.1: the interior-exponent isometry does not require σ-finiteness. -/
theorem norm_bochnerDualMap_of_one_lt (hp : 1 < p) (hp_top : p ≠ ∞)
    (g : Lp (StrongDual 𝕜 X) q μ) :
    ‖bochnerDualMap (X := X) 𝕜 μ p q g‖ = ‖g‖ := by
  sorry

/-- §8.1: the dual-valued functions form a norming family, including at both endpoints. -/
theorem norm_le_of_dual_pairing_bound [SigmaFinite μ] (f : Lp X p μ)
    {C : ℝ} (hC : 0 ≤ C)
    (hbound : ∀ g : Lp (StrongDual 𝕜 X) q μ,
      ‖bochnerDualMap (X := X) 𝕜 μ p q g f‖ ≤ C * ‖g‖) : ‖f‖ ≤ C := by
  sorry

/-- §8.2: surjectivity characterizes the relative RNP of the dual, not of `X`. -/
theorem bochnerDualMap_surjective_iff [CompleteSpace X] [SigmaFinite μ] (hp : p ≠ ∞) :
    Function.Surjective (bochnerDualMap (X := X) 𝕜 μ p q) ↔
      HasRNPWith (StrongDual 𝕜 X) μ := by
  sorry

/-- §8.2: intrinsic RNP yields surjectivity for arbitrary measures at interior exponents. -/
theorem bochnerDualMap_surjective_of_hasRNP [CompleteSpace X]
    (hp : 1 < p) (hp_top : p ≠ ∞)
    (hX : HasRNP (StrongDual 𝕜 X)) :
    Function.Surjective (bochnerDualMap (X := X) 𝕜 μ p q) := by
  sorry

end Duality

/-- §8.1: on an arbitrary measure space the support-restricted infinity carrier still
embeds isometrically into the dual of `L¹`. The full native infinity carrier need not. -/
theorem norm_bochnerDualMap_linftySigma (g : linftySigma 𝕜 (StrongDual 𝕜 X) μ) :
    ‖bochnerDualMap (X := X) 𝕜 μ 1 ∞ (g : Lp (StrongDual 𝕜 X) ∞ μ)‖ = ‖g‖ := by
  sorry

/-- §8.3: vector-valued sequence duality on arbitrary index sets, including the
ℓ¹–ℓ∞ endpoint, with the coordinate formula and no RNP assumption. -/
theorem exists_lpDualEquiv [CompleteSpace X] {I : Type w} [DecidableEq I]
    (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)] [p.HolderConjugate q]
    (hp : p ≠ ∞) :
    ∃ e : StrongDual 𝕜 (lp (fun _ : I => X) p) ≃ₗᵢ[𝕜]
        lp (fun _ : I => StrongDual 𝕜 X) q,
      ∀ (Φ : StrongDual 𝕜 (lp (fun _ : I => X) p)) (i : I) (x : X),
        (e Φ) i x = Φ (lp.single p i x) := by
  sorry

end TauCetiRoadmap.BochnerSpaces
