/-
Copyright (c) 2026 Emiel Lorist. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.Analysis.Normed.Module.DoubleDual
public import Mathlib.MeasureTheory.Function.LpSpace.Complete
public import Mathlib.MeasureTheory.Function.StronglyMeasurable.Lp
public import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
public import Mathlib.MeasureTheory.Integral.Prod
public import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
public import Mathlib.MeasureTheory.VectorMeasure.WithDensityVec
public import Mathlib.Topology.Algebra.Module.LinearPMap
public import TauCeti.MeasureTheory.Function.Holder

/-!
# Bochner spaces: suggested interfaces

The roadmap is `README.md`; this file is not the roadmap. These are representative suggested
definitions and target signatures, not an exhaustive checklist. Proofs admitted with `sorry`
are mathematical targets, not completed mathematics. Discharging this file does not complete
the roadmap.

The carriers are Mathlib's `Lp`, `LinearPMap`, `StrongDual`, `VectorMeasure` and `Submodule`.
In particular, the duality map below is Mathlib's existing `ContinuousLinearMap.lpPairing`;
Tau Ceti's `MemLp.integrable_apply` supplies its scalar integrability. The predicates for
weak/Pettis integrability and the Radon–Nikodým property have explicit mathematical content.
The support-restricted infinity space is a submodule of native `Lp`, not another quotient.

BS4's completed projective-tensor identification needs the carrier constructed by
BanachSpaceTheory B4, which is not provided at the dependency pin. Its signature is therefore
specified in the README rather than against a private replacement here. The mixed-norm,
convolution, series-criterion, measure-algebra and example APIs are likewise specified in full
in the README; the signatures here select their principal integration and duality interfaces.

All dual pairings are bilinear, including over `ℂ`. Real scalar structures used for Bochner
integration are compatible with the declared `RCLike` scalar structure. Completeness,
exponent bounds, and finite/σ-finite measure assumptions are explicit where needed.
-/

@[expose] public section

noncomputable section

set_option autoImplicit false

open MeasureTheory Filter Set TopologicalSpace
open scoped ENNReal Topology

namespace TauCetiRoadmap.BochnerSpaces

universe u v w

variable {𝕜 : Type*} [RCLike 𝕜]
variable {S : Type u} [MeasurableSpace S] {μ : Measure S}
variable {X : Type v} [NormedAddCommGroup X] [NormedSpace 𝕜 X]

/-! ## BS1. Scalar tests for measurability -/

/-- BS1.1: the general Pettis measurability theorem, with a closed separable linear range.
The whole target need not be separable, and no measure on the source is required. -/
theorem stronglyMeasurable_iff_scalar_tests (f : S → X) :
    StronglyMeasurable f ↔
      (∃ E : Submodule 𝕜 X, IsClosed (E : Set X) ∧ IsSeparable (E : Set X) ∧
        ∀ s, f s ∈ E) ∧
      ∀ x' : StrongDual 𝕜 X, Measurable (fun s => x' (f s)) := by
  sorry

/-- BS1.2: essential separability and scalar a.e. measurability. The scalar tests can have
different exceptional sets; the theorem constructs a vector-valued representative. -/
theorem aestronglyMeasurable_iff_scalar_tests (f : S → X) :
    AEStronglyMeasurable f μ ↔
      (∃ E : Submodule 𝕜 X, IsClosed (E : Set X) ∧ IsSeparable (E : Set X) ∧
        ∀ᵐ s ∂μ, f s ∈ E) ∧
      ∀ x' : StrongDual 𝕜 X, AEMeasurable (fun s => x' (f s)) μ := by
  sorry

/-- BS1.2: the stronger finite-support convention uses the same convention in its scalar
tests. It does not silently replace `AEFinStronglyMeasurable` by `AEStronglyMeasurable`. -/
theorem aefinStronglyMeasurable_iff_scalar_tests (f : S → X) :
    AEFinStronglyMeasurable f μ ↔
      (∃ E : Submodule 𝕜 X, IsClosed (E : Set X) ∧ IsSeparable (E : Set X) ∧
        ∀ᵐ s ∂μ, f s ∈ E) ∧
      ∀ x' : StrongDual 𝕜 X, AEFinStronglyMeasurable (fun s => x' (f s)) μ := by
  sorry

/-! ## BS2. Closed operators and Bochner integration -/

section BochnerIntegral

variable [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X] [CompleteSpace X]
variable {Y : Type w} [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]
  [NormedSpace ℝ Y] [IsScalarTower ℝ 𝕜 Y] [CompleteSpace Y]

/-- BS2.1: Hille's theorem in graph form. There is no dense-domain hypothesis. -/
theorem integral_mem_graph (T : X →ₗ.[𝕜] Y) (hT : T.IsClosed)
    {f : S → X} {g : S → Y} (hf : Integrable f μ) (hg : Integrable g μ)
    (hfg : ∀ᵐ s ∂μ, (f s, g s) ∈ T.graph) :
    (∫ s, f s ∂μ, ∫ s, g s ∂μ) ∈ T.graph := by
  sorry

/-- BS2.1: the domain-membership and commutation form of Hille's theorem. -/
theorem integral_mem_domain_and_map (T : X →ₗ.[𝕜] Y) (hT : T.IsClosed)
    {f : S → X} {g : S → Y} (hf : Integrable f μ) (hg : Integrable g μ)
    (hfg : ∀ᵐ s ∂μ, (f s, g s) ∈ T.graph) :
    ∃ hx : (∫ s, f s ∂μ) ∈ T.domain,
      T ⟨∫ s, f s ∂μ, hx⟩ = ∫ s, g s ∂μ := by
  sorry

/-- BS2.3: finite-positive-measure averages detect a closed convex constraint on a
σ-finite space. The zero-measure case does not require the set to be nonempty. -/
theorem ae_mem_of_set_averages [SigmaFinite μ] {f : S → X} (hf : Integrable f μ)
    {C : Set X} (hC : IsClosed C) (hconv : Convex ℝ C)
    (havg : ∀ A : Set S, MeasurableSet A → 0 < μ A → μ A < ∞ →
      (μ A).toReal⁻¹ • (∫ s in A, f s ∂μ) ∈ C) :
    ∀ᵐ s ∂μ, f s ∈ C := by
  sorry

end BochnerIntegral

/-! ## BS3. The support-restricted infinity endpoint -/

/-- BS3.1: `L∞_σ(μ; X)` with global a.e. equivalence, as a submodule of native `Lp`.
The closure obligations concern representatives only through a.e.-invariant membership. -/
def linftySigma (𝕜 : Type*) [RCLike 𝕜] (X : Type v) [NormedAddCommGroup X]
    [NormedSpace 𝕜 X] (μ : Measure S) : Submodule 𝕜 (Lp X ∞ μ) where
  carrier := {f | AEFinStronglyMeasurable (f : S → X) μ}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- The carrier condition is the specified finite-support measurability condition. -/
theorem mem_linftySigma (f : Lp X ∞ μ) :
    f ∈ linftySigma 𝕜 X μ ↔ AEFinStronglyMeasurable (f : S → X) μ := Iff.rfl

/-- BS3.1: this carrier inherits a complete norm when `X` is Banach. -/
theorem isClosed_linftySigma : IsClosed (linftySigma 𝕜 X μ : Set (Lp X ∞ μ)) := by
  sorry

/-- BS3.1: on a σ-finite space the two infinity conventions agree. -/
theorem linftySigma_eq_top [SigmaFinite μ] : linftySigma 𝕜 X μ = ⊤ := by
  sorry

/-! ## BS4. The finite-exponent Bochner Fubini identification -/

section Fubini

variable [CompleteSpace X]
variable {T : Type w} [MeasurableSpace T] (ν : Measure T)
variable (p : ℝ≥0∞) [Fact (1 ≤ p)]

/-- BS4.2: the isometric equivalence includes a representative-level section formula.
The a.e. equality in the inner variable is nested under an a.e. outer quantifier. -/
theorem exists_fubiniEquiv [SigmaFinite μ] [SigmaFinite ν] (hp : p ≠ ∞) :
    ∃ e : Lp X p (μ.prod ν) ≃ₗᵢ[𝕜] Lp (Lp X p ν) p μ,
      ∀ F : Lp X p (μ.prod ν),
        ∀ᵐ s ∂μ, ∀ᵐ t ∂ν, ((e F) s) t = F (s, t) := by
  sorry

end Fubini

/-! ## BS6. Weak integrability, Dunford integrals, and Pettis integrals -/

/-- BS6.1: all continuous scalar tests are integrable. No strong measurability is included. -/
def WeaklyIntegrable (f : S → X) (μ : Measure S) : Prop :=
  ∀ x' : StrongDual 𝕜 X, Integrable (fun s => x' (f s)) μ

/-- BS6.2: every measurable set integral is represented by a vector in `X`.
Requiring representation just for the whole space would be weaker and incorrect here. -/
def PettisIntegrable (f : S → X) (μ : Measure S) : Prop :=
  WeaklyIntegrable (𝕜 := 𝕜) f μ ∧
    ∀ A : Set S, MeasurableSet A →
      ∃ x : X, ∀ x' : StrongDual 𝕜 X, x' x = ∫ s in A, x' (f s) ∂μ

/-- BS6.1: scalar integration defines a continuous functional on the continuous dual.
The boundedness proof is a target; the value of the functional is fixed explicitly. -/
def dunfordIntegral (f : S → X) (hf : WeaklyIntegrable (𝕜 := 𝕜) f μ) (A : Set S) :
    StrongDual 𝕜 (StrongDual 𝕜 X) where
  toFun x' := ∫ s in A, x' (f s) ∂μ
  map_add' := by sorry
  map_smul' := by sorry
  cont := by sorry

/-- The Dunford integral is determined by its scalar evaluations. -/
theorem dunfordIntegral_apply (f : S → X) (hf : WeaklyIntegrable (𝕜 := 𝕜) f μ)
    (A : Set S) (x' : StrongDual 𝕜 X) :
    dunfordIntegral f hf A x' = ∫ s in A, x' (f s) ∂μ := rfl

/-- BS6.2: the Pettis set integral, selected only when its representation is known. -/
def pettisSetIntegral (f : S → X) (hf : PettisIntegrable (𝕜 := 𝕜) f μ)
    (A : Set S) (hA : MeasurableSet A) : X :=
  Classical.choose (hf.2 A hA)

/-- BS6.2: the defining scalar evaluation identity. -/
theorem apply_pettisSetIntegral (f : S → X) (hf : PettisIntegrable (𝕜 := 𝕜) f μ)
    (A : Set S) (hA : MeasurableSet A) (x' : StrongDual 𝕜 X) :
    x' (pettisSetIntegral f hf A hA) = ∫ s in A, x' (f s) ∂μ :=
  Classical.choose_spec (hf.2 A hA) x'

/-- BS6.2: uniqueness of the representing vector. -/
theorem pettisSetIntegral_unique (f : S → X) (hf : PettisIntegrable (𝕜 := 𝕜) f μ)
    (A : Set S) (hA : MeasurableSet A) {x : X}
    (hx : ∀ x' : StrongDual 𝕜 X, x' x = ∫ s in A, x' (f s) ∂μ) :
    x = pettisSetIntegral f hf A hA := by
  sorry

/-- BS6.2: representation in the bidual uses the native canonical embedding. -/
theorem inclusionInDoubleDual_pettisSetIntegral (f : S → X)
    (hf : PettisIntegrable (𝕜 := 𝕜) f μ) (A : Set S) (hA : MeasurableSet A) :
    NormedSpace.inclusionInDoubleDual 𝕜 X (pettisSetIntegral f hf A hA) =
      dunfordIntegral f hf.1 A := by
  sorry

section BanachPettis

variable [CompleteSpace X]

/-- BS6.3: Pettis set integrals form a native norm-countably additive vector measure.
No assertion of finite total variation is made. -/
theorem exists_pettisVectorMeasure (f : S → X) (hf : PettisIntegrable (𝕜 := 𝕜) f μ) :
    ∃ m : VectorMeasure S X,
      ∀ (A : Set S) (hA : MeasurableSet A), m A = pettisSetIntegral f hf A hA := by
  sorry

/-- BS6.4: reflexivity suffices for weakly integrable functions to be Pettis integrable. -/
theorem pettisIntegrable_of_reflexive
    (hX : Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 X))
    {f : S → X} (hf : WeaklyIntegrable (𝕜 := 𝕜) f μ) :
    PettisIntegrable (𝕜 := 𝕜) f μ := by
  sorry

variable [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X]

/-- BS6.2: Bochner integrability implies Pettis integrability. -/
theorem pettisIntegrable_of_integrable {f : S → X} (hf : Integrable f μ) :
    PettisIntegrable (𝕜 := 𝕜) f μ := by
  sorry

/-- BS6.2: the two integrals agree on every measurable set. -/
theorem pettisSetIntegral_eq_integral {f : S → X} (hf : Integrable f μ)
    (A : Set S) (hA : MeasurableSet A) :
    pettisSetIntegral f (pettisIntegrable_of_integrable (𝕜 := 𝕜) hf) A hA =
      ∫ s in A, f s ∂μ := by
  sorry

end BanachPettis

/-! ## BS7. Relative and intrinsic Radon–Nikodým properties -/

section RadonNikodym

-- RNP is a property of the underlying real Banach space, independent of a choice of
-- real or complex notation for duals. Complex spaces use restriction of scalars.
variable (X : Type v) [NormedAddCommGroup X] [NormedSpace ℝ X]

/-- BS7.2: RNP with respect to a fixed measure, using native variation and vector densities. -/
def HasRNPWith (μ : Measure S) : Prop :=
  ∀ m : VectorMeasure S X, m.variation Set.univ < ∞ → m.variation ≪ μ →
    ∃ f : S → X, Integrable f μ ∧ m = μ.withDensityᵥ f

/-- BS7.2: intrinsic RNP is defined using Lebesgue measure on the unit interval. -/
def HasRNP : Prop :=
  HasRNPWith X (volume.restrict (Set.Icc (0 : ℝ) 1))

variable [CompleteSpace X]

/-- BS7.2: the interval definition is universal for finite measure spaces. -/
theorem hasRNP_iff_finite_measures :
    HasRNP X ↔ ∀ (A : Type u) (_ : MeasurableSpace A) (ν : Measure A),
      IsFiniteMeasure ν → HasRNPWith X ν := by
  sorry

/-- BS7.2: the same characterization holds for σ-finite spaces, not all positive measures. -/
theorem hasRNP_iff_sigmaFinite_measures :
    HasRNP X ↔ ∀ (A : Type u) (_ : MeasurableSpace A) (ν : Measure A),
      SigmaFinite ν → HasRNPWith X ν := by
  sorry

/-- BS7.5: reflexive spaces have intrinsic RNP. The finite-measure density prerequisite is
owned by BanachSpaceTheory B4.0, as stated in the README. -/
theorem hasRNP_of_reflexive
    (hX : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ X)) : HasRNP X := by
  sorry

/-- BS7.5: separability is required of the dual itself. -/
theorem hasRNP_strongDual_of_separable [SeparableSpace (StrongDual ℝ X)] :
    HasRNP (StrongDual ℝ X) := by
  sorry

end RadonNikodym

section RepresentableOperators

variable [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X] [CompleteSpace X]

/-- BS7.3: the operator represented by an essentially bounded vector-valued density.
This uses the native bilinear pairing for scalar multiplication. -/
abbrev representableOperatorMap : Lp X ∞ μ →L[𝕜] (Lp 𝕜 1 μ →L[𝕜] X) :=
  (ContinuousLinearMap.lsmul 𝕜 𝕜 : 𝕜 →L[𝕜] X →L[𝕜] X).flip.lpPairing μ ∞ 1

/-- BS7.3: the actual Bochner-integral formula for a represented operator. -/
theorem representableOperatorMap_apply (g : Lp X ∞ μ) (f : Lp 𝕜 1 μ) :
    representableOperatorMap (𝕜 := 𝕜) g f = ∫ s, f s • g s ∂μ := by
  exact ContinuousLinearMap.lpPairing_eq_integral _ g f

/-- BS7.3: the representing map is isometric on a σ-finite space. -/
theorem norm_representableOperatorMap [SigmaFinite μ] (g : Lp X ∞ μ) :
    ‖representableOperatorMap (𝕜 := 𝕜) g‖ = ‖g‖ := by
  sorry

/-- BS7.3: every bounded operator on scalar `L¹` is represented exactly when the target
has RNP with respect to this measure. -/
theorem representableOperatorMap_surjective_iff [SigmaFinite μ] :
    Function.Surjective (representableOperatorMap (𝕜 := 𝕜) (X := X) (μ := μ)) ↔
      HasRNPWith X μ := by
  sorry

end RepresentableOperators

/-! ## BS8. The native pairing and Banach-valued duality -/

section Duality

variable (𝕜 X μ) (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
  [q.HolderConjugate p]

/-- BS8.1: the canonical map already exists as the native bilinear `Lp` pairing.
This abbreviation fixes orientation; it introduces no new carrier or integral. -/
abbrev bochnerDualMap : Lp (StrongDual 𝕜 X) q μ →L[𝕜] StrongDual 𝕜 (Lp X p μ) :=
  (ContinuousLinearMap.id 𝕜 (StrongDual 𝕜 X)).lpPairing μ q p

variable {𝕜 X μ p q}

omit [Fact (1 ≤ p)] [Fact (1 ≤ q)] in
/-- The scalar integrand is integrable, so the formula does not rely on totalized zeros. -/
theorem integrable_dual_pairing (g : Lp (StrongDual 𝕜 X) q μ) (f : Lp X p μ) :
    Integrable (fun s => g s (f s)) μ :=
  (Lp.memLp g).integrable_apply (Lp.memLp f)

/-- BS8.1: the pairing is bilinear, without complex conjugation. -/
theorem bochnerDualMap_apply (g : Lp (StrongDual 𝕜 X) q μ) (f : Lp X p μ) :
    bochnerDualMap (X := X) 𝕜 μ p q g f = ∫ s, g s (f s) ∂μ := by
  exact ContinuousLinearMap.lpPairing_eq_integral _ g f

/-- BS8.1: all conjugate endpoints are included on σ-finite spaces. -/
theorem norm_bochnerDualMap [SigmaFinite μ] (g : Lp (StrongDual 𝕜 X) q μ) :
    ‖bochnerDualMap (X := X) 𝕜 μ p q g‖ = ‖g‖ := by
  sorry

/-- BS8.1: the interior-exponent isometry does not require σ-finiteness. -/
theorem norm_bochnerDualMap_of_one_lt (hp : 1 < p) (hp_top : p ≠ ∞)
    (g : Lp (StrongDual 𝕜 X) q μ) :
    ‖bochnerDualMap (X := X) 𝕜 μ p q g‖ = ‖g‖ := by
  sorry

/-- BS8.1: the dual-valued functions form a norming family, including at both endpoints. -/
theorem norm_le_of_dual_pairing_bound [SigmaFinite μ] (f : Lp X p μ)
    {C : ℝ} (hC : 0 ≤ C)
    (hbound : ∀ g : Lp (StrongDual 𝕜 X) q μ,
      ‖bochnerDualMap (X := X) 𝕜 μ p q g f‖ ≤ C * ‖g‖) : ‖f‖ ≤ C := by
  sorry

variable [CompleteSpace X]

/-- BS8.2: surjectivity characterizes the relative RNP of the dual, not of `X`. -/
theorem bochnerDualMap_surjective_iff [SigmaFinite μ] (hp : p ≠ ∞) :
    Function.Surjective (bochnerDualMap (X := X) 𝕜 μ p q) ↔
      HasRNPWith (StrongDual 𝕜 X) μ := by
  sorry

/-- BS8.2: the bundled duality equivalence with its specified integral formula. -/
theorem exists_bochnerDualEquiv [SigmaFinite μ] (hp : p ≠ ∞)
    (hX : HasRNPWith (StrongDual 𝕜 X) μ) :
    ∃ e : Lp (StrongDual 𝕜 X) q μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp X p μ),
      ∀ (g : Lp (StrongDual 𝕜 X) q μ) (f : Lp X p μ),
        e g f = ∫ s, g s (f s) ∂μ := by
  sorry

/-- BS8.2: intrinsic RNP yields surjectivity for arbitrary measures at interior exponents. -/
theorem bochnerDualMap_surjective_of_hasRNP (hp : 1 < p) (hp_top : p ≠ ∞)
    (hX : HasRNP (StrongDual 𝕜 X)) :
    Function.Surjective (bochnerDualMap (X := X) 𝕜 μ p q) := by
  sorry

end Duality

/-- BS8.1: on an arbitrary measure space the support-restricted infinity carrier still
embeds isometrically into the dual of `L¹`. The full native infinity carrier need not. -/
theorem norm_bochnerDualMap_linftySigma (g : linftySigma 𝕜 (StrongDual 𝕜 X) μ) :
    ‖bochnerDualMap (X := X) 𝕜 μ 1 ∞ (g : Lp (StrongDual 𝕜 X) ∞ μ)‖ = ‖g‖ := by
  sorry

/-! ## BS9. An endpoint test of the finite-support convention -/

/-- BS9: a nonzero constant satisfies the finite-support convention exactly for σ-finite
measures. This distinguishes native `L∞` from the support-restricted submodule. -/
theorem aefinStronglyMeasurable_const_iff {x : X} (hx : x ≠ 0) :
    AEFinStronglyMeasurable (fun _ : S => x) μ ↔ SigmaFinite μ := by
  sorry

end TauCetiRoadmap.BochnerSpaces
