/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Normed.Module.ApproximationProperty.Basic
import TauCeti.Analysis.Normed.Module.BanachMazur
import TauCeti.Analysis.Normed.Module.Complexification
import TauCeti.Analysis.Normed.Module.TensorProduct.Completion
import TauCeti.Analysis.Normed.Operator.AbsolutelySumming.Basic
import TauCeti.Analysis.Normed.Operator.DunfordPettis.Basic

/-!
# Banach space theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
two definitions needed to state the cotype-2 summing bound: the Rademacher second moment and
Rademacher cotype.

Headline theorems of the README that the pinned Tau Ceti already proves are consumed, not
restated; the README's supplier contracts name them. They include Eberlein–Šmulian, Milman–Pettis,
Krein–Šmulian, Bishop–Phelps, James's basis criterion, Grothendieck's compact-operator
characterization of the approximation property, Pietsch domination and factorization,
Grothendieck's inequality, local reflexivity and the Dunford–Pettis sequence criterion.

Headline theorems not statable at the pins, and what each lacks:

* Layer 5, the local-null Haar endpoint `LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ)`
  for an arbitrary regular left Haar measure `μ`: its carrier, the quotient of the locally
  essentially bounded Borel functions by the locally null ones with the local essential-bound
  norm, is a construction of the roadmap that neither library has. Only the σ-finite endpoint on
  the native `Lp 𝕜 ∞ μ` is stated here.
* Layer 4, Grothendieck's metric criterion `MAP(X) ↔ ∀ u, ‖Θ_X u‖ = ‖u‖_π`: the trace-pairing
  map `Θ_X : X* ⊗̂π X → (X ⊗̂ε X*)*` is a construction of the roadmap. Its reflexive consequence,
  that a reflexive space with the approximation property has the metric approximation property,
  is stated.
* Layer 4, Enflo's quantitative trace obstruction and the Argyros–Haydon space `X_K` themselves:
  both are constructions of the roadmap; only the existence theorems they prove are stated.
* Layer 5, the isometric equivalence of `StrongDual 𝕜 C(K, 𝕜)` with the normed space `M(K)` of
  finite regular scalar measures: `M(K)` with its total-variation norm is a construction of the
  roadmap. The representation theorem behind it is stated on the native `VectorMeasure K 𝕜`.
-/

noncomputable section
open Filter Topology MeasureTheory
open scoped ENNReal InnerProductSpace

namespace TauCetiRoadmap.BanachSpaceTheory

universe u v

variable {𝕜 : Type*} [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]

/-! ## Layer 2: weak compactness and reflexivity -/

/-- James's theorem (Layer 2): a nonempty norm-closed bounded convex subset `A` of a real or
complex Banach space is weakly compact iff every continuous linear functional `f` attains the
supremum of `Re f` on `A` (James, *Weakly compact sets*, 1964, Theorems 4–5). Convexity is real
convexity. -/
theorem james [CompleteSpace E] [Module ℝ E] [IsScalarTower ℝ 𝕜 E] (A : Set E)
    (hne : A.Nonempty) (hc : IsClosed A) (hb : Bornology.IsBounded A) (hconv : Convex ℝ A) :
    IsCompact (toWeakSpace 𝕜 E '' A) ↔
      ∀ f : StrongDual 𝕜 E, ∃ a ∈ A, ∀ b ∈ A, RCLike.re (f b) ≤ RCLike.re (f a) := by
  sorry

/-- James's reflexivity theorem (Layer 2): a Banach space is reflexive iff every continuous
functional attains its norm on the closed unit ball (Megginson, §2.9). Reflexivity is
surjectivity of the canonical map into the continuous bidual. -/
theorem surjective_inclusionInDoubleDual_iff_forall_exists_norm_apply_eq [CompleteSpace E] :
    Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 E) ↔
      ∀ f : StrongDual 𝕜 E, ∃ x : E, ‖x‖ ≤ 1 ∧ ‖f x‖ = ‖f‖ := by
  sorry

/-! ## Layer 4: approximation and Banach tensor products -/

/-- Grothendieck's tensor characterization (Layer 4): a Banach space `E` has the approximation
property iff for every Banach space `F` the contraction `F ⊗̂π E → F ⊗̂ε E` from the completed
projective to the completed injective tensor product is injective. -/
theorem hasApproximationProperty_iff_injective_toCompletedInjectiveTensor {E : Type u}
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] [CompleteSpace E] :
    TauCeti.HasApproximationProperty 𝕜 E ↔
      ∀ (F : Type u) [NormedAddCommGroup F] [NormedSpace 𝕜 F] [CompleteSpace F],
        Function.Injective (TauCeti.CompletedProjectiveTensor.toCompletedInjectiveTensor 𝕜 F E) := by
  sorry

/-- Grothendieck (Layer 4): a reflexive real or complex Banach space with the approximation
property has the metric approximation property. -/
theorem hasMetricApproximationProperty_of_surjective_inclusionInDoubleDual
    (hE : Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 E))
    (hAP : TauCeti.HasApproximationProperty 𝕜 E) :
    TauCeti.HasMetricApproximationProperty 𝕜 E := by
  sorry

/-- Enflo (Layer 4): a separable reflexive real Banach space without the approximation property. -/
theorem exists_reflexive_not_hasApproximationProperty :
    ∃ (E : Type) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E),
      CompleteSpace E ∧ TopologicalSpace.SeparableSpace E ∧
      Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ E) ∧
      ¬ TauCeti.HasApproximationProperty ℝ E := by
  sorry

/-- Argyros–Haydon (Layer 4): an infinite-dimensional real Banach space on which every bounded
operator is a scalar plus a compact operator. -/
theorem exists_scalarPlusCompact :
    ∃ (E : Type) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E),
      CompleteSpace E ∧ ¬ FiniteDimensional ℝ E ∧
      ∀ T : E →L[ℝ] E, ∃ (c : ℝ) (K : E →L[ℝ] E),
        IsCompactOperator K ∧ T = c • ContinuousLinearMap.id ℝ E + K := by
  sorry

/-- Layer 4: the real strong dual of `E`, complexified with the native Taylor complexification, is
boundedly complex-linearly equivalent to the complex strong dual of the complexification of `E`,
by the complex-linear extension `φ(x+iy)=g(x)−h(y)+i(h(x)+g(y))` of `g+ih`. The formula determines
the equivalence; no isometry is asserted. -/
theorem exists_complexificationStrongDualEquiv {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] :
    ∃ e : TauCeti.Complexification (StrongDual ℝ E) ≃L[ℂ]
        StrongDual ℂ (TauCeti.Complexification E),
      ∀ (g h : StrongDual ℝ E) (x y : E),
        e ⟨g, h⟩ ⟨x, y⟩ = (g x : ℂ) - (h y : ℂ) + Complex.I * ((h x : ℂ) + (g y : ℂ)) := by
  sorry

/-! ## Layer 5: Hilbert dimension, function spaces and dualities -/

section Hilbert

variable {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]
  [NormedAddCommGroup K] [InnerProductSpace 𝕜 K] [CompleteSpace K] {ι : Type u} {κ : Type v}

/-- Hilbert dimension (Layer 5): any two Hilbert bases of a complete inner product space have
index types of the same cardinality, so the cardinality of a Hilbert basis is an invariant. -/
theorem hilbertBasis_lift_mk_eq (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 H) :
    Cardinal.lift.{v} (Cardinal.mk ι) = Cardinal.lift.{u} (Cardinal.mk κ) := by
  sorry

/-- Unitary classification (Layer 5): two complete inner product spaces over the same field are
linearly isometrically equivalent iff their Hilbert dimensions agree. -/
theorem nonempty_linearIsometryEquiv_iff_lift_mk_eq (b : HilbertBasis ι 𝕜 H)
    (c : HilbertBasis κ 𝕜 K) :
    Nonempty (H ≃ₗᵢ[𝕜] K) ↔ Cardinal.lift.{v} (Cardinal.mk ι) = Cardinal.lift.{u} (Cardinal.mk κ) := by
  sorry

/-- Basis-preserving unitaries (Layer 5): an equivalence of index types is realised by a linear
isometric equivalence sending the one Hilbert basis to the other. -/
theorem exists_linearIsometryEquiv_hilbertBasis (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 K)
    (e : ι ≃ κ) : ∃ U : H ≃ₗᵢ[𝕜] K, ∀ i, U (b i) = c (e i) := by
  sorry

end Hilbert

section FunctionSpaces

variable {X : Type*} [MeasurableSpace X]

/-- Riesz representation of `C(K, 𝕜)*` (Layer 5): on a compact Hausdorff space with its Borel
σ-algebra, every continuous linear functional on `C(K, 𝕜)` is integration against a unique scalar
measure of regular variation, and its norm is the total variation of that measure. -/
theorem exists_unique_vectorMeasure_regular {K : Type*} [TopologicalSpace K] [CompactSpace K]
    [T2Space K] [MeasurableSpace K] [BorelSpace K] (φ : StrongDual 𝕜 C(K, 𝕜)) :
    ∃! μ : VectorMeasure K 𝕜, μ.variation.Regular ∧
      (∀ f : C(K, 𝕜), φ f = ∫ᵛ x, f x ∂[ContinuousLinearMap.mul ℝ 𝕜; μ]) ∧
      ‖φ‖ = (μ.variation Set.univ).toReal := by
  sorry

/-- σ-finite `L¹`–`L∞` duality (Layer 5): for σ-finite `μ` the bilinear integral pairing, without
conjugation, is a linear isometric equivalence of the native `L∞(μ)` onto the dual of `L¹(μ)`. -/
theorem exists_lpInftyDualEquiv (μ : Measure X) [SigmaFinite μ] :
    ∃ e : Lp 𝕜 ∞ μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ),
      ∀ (g : Lp 𝕜 ∞ μ) (f : Lp 𝕜 1 μ), e g f = ∫ x, f x * g x ∂μ := by
  sorry

/-- `Lᵖ`–`Lᑫ` duality (Layer 5): for `1 < p < ∞`, conjugate `q` and an arbitrary measure `μ`, the
bilinear integral pairing is a linear isometric equivalence of `L^q(μ)` onto the dual of
`Lᵖ(μ)`. -/
theorem exists_lpDualEquiv (μ : Measure X) (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
    [p.HolderConjugate q] (hp : 1 < p) (hp' : p ≠ ∞) :
    ∃ e : Lp 𝕜 q μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 p μ),
      ∀ (g : Lp 𝕜 q μ) (f : Lp 𝕜 p μ), e g f = ∫ x, f x * g x ∂μ := by
  sorry

/-- Dunford–Pettis weak compactness criterion (Layer 5): for a finite measure, a subset of
`L¹(μ)` is relatively weakly compact iff it is norm bounded and its integrals `∫_A ‖f‖ dμ` are
uniformly small on sets of small measure. -/
theorem isCompact_closure_toWeakSpace_lp_one_iff (μ : Measure X) [IsFiniteMeasure μ]
    (S : Set (Lp 𝕜 1 μ)) :
    IsCompact (closure (toWeakSpace 𝕜 (Lp 𝕜 1 μ) '' S)) ↔
      Bornology.IsBounded S ∧ ∀ ε > (0 : ℝ), ∃ δ > (0 : ℝ), ∀ A : Set X, MeasurableSet A →
        μ.real A ≤ δ → ∀ f ∈ S, ∫ x in A, ‖f x‖ ∂μ ≤ ε := by
  sorry

/-- The Dunford–Pettis property of `C(K)` (Layer 5): on a compact Hausdorff space every weakly
compact operator from `C(K, 𝕜)` into a Banach space maps weakly convergent sequences to norm
convergent ones. -/
theorem hasDunfordPettisProperty_continuousMap {K : Type*} [TopologicalSpace K] [CompactSpace K]
    [T2Space K] : TauCeti.HasDunfordPettisProperty 𝕜 C(K, 𝕜) := by
  sorry

/-- The Dunford–Pettis property of `L¹(μ)` (Layer 5), for an arbitrary measure. -/
theorem hasDunfordPettisProperty_lp_one (μ : Measure X) :
    TauCeti.HasDunfordPettisProperty 𝕜 (Lp 𝕜 1 μ) := by
  sorry

/-- Banach–Stone (Layer 5): a surjective linear isometry between spaces of continuous functions
on compact Hausdorff spaces is a weighted composition with a homeomorphism and a unimodular
weight. -/
theorem banach_stone {K L : Type*} [TopologicalSpace K] [CompactSpace K] [T2Space K]
    [TopologicalSpace L] [CompactSpace L] [T2Space L] (T : C(K, 𝕜) ≃ₗᵢ[𝕜] C(L, 𝕜)) :
    ∃ (φ : L ≃ₜ K) (h : C(L, 𝕜)), (∀ y, ‖h y‖ = 1) ∧
      ∀ (f : C(K, 𝕜)) (y : L), T f y = h y * f (φ y) := by
  sorry

end FunctionSpaces

/-! ## Layer 6: cotype and Grothendieck's theorem -/

/-- The Rademacher second moment `E_ε ‖Σ ε_i y_i‖²` of a finite family, averaged over the uniform
sign cube (Layer 6); `R₂(y)` is its square root. -/
def rademacherSecondMoment {E : Type*} [NormedAddCommGroup E] {n : ℕ} (y : Fin n → E) : ℝ :=
  (∑ ε : Fin n → Bool, ‖∑ i, (if ε i then y i else -y i)‖ ^ 2) / 2 ^ n

/-- Rademacher cotype `q` with constant `C` (Layer 6): `(Σ‖y_i‖^q)^(1/q) ≤ C R₂(y)` for every
finite family. -/
def HasCotype (E : Type*) [NormedAddCommGroup E] (q C : ℝ) : Prop :=
  ∀ (n : ℕ) (y : Fin n → E),
    (∑ i, ‖y i‖ ^ q) ^ (1 / q) ≤ C * Real.sqrt (rademacherSecondMoment y)

/-- Pisier's cotype-2 summing bound (Layer 6): for every cotype-2 constant `C` there is a
constant `K` depending only on `C` such that for every real space `Y` of cotype 2 with constant
`C` and every operator `U` from a finite-dimensional Euclidean space, the `2`-summing norm
`π₂(U)` is at most `K · R₂(U e_i)` on the standard basis. -/
theorem cotype2_summing_bound (C : ℝ) :
    ∃ K : ℝ, ∀ (Y : Type u) [NormedAddCommGroup Y] [NormedSpace ℝ Y], HasCotype Y 2 C →
      ∀ (n : ℕ) (U : EuclideanSpace ℝ (Fin n) →L[ℝ] Y),
        U.summingENorm 2 ≤
          ENNReal.ofReal (K * Real.sqrt (rademacherSecondMoment fun i ↦
            U (EuclideanSpace.single i 1))) := by
  sorry

/-- Grothendieck's theorem (Layer 6): every bounded operator from `L¹(μ)` into an inner product
space is absolutely summing, with `π₁(T) ≤ 16 ‖T‖` over `ℝ` or `ℂ`. -/
theorem summingENorm_one_le_of_lp_one {X : Type*} [MeasurableSpace X] (μ : Measure X)
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] (T : Lp 𝕜 1 μ →L[𝕜] H) :
    T.summingENorm 1 ≤ ENNReal.ofReal (16 * ‖T‖) := by
  sorry

/-! ## Layer 7: local theory and Euclidean sections -/

/-- John's distance bound (Layer 7): an `n`-dimensional normed space over `ℝ` or `ℂ` is at
Banach–Mazur distance at most `√n` from `ℓ₂ⁿ`. -/
theorem banachMazurDist_euclideanSpace_le_sqrt [FiniteDimensional 𝕜 E] (n : ℕ)
    (hn : Module.finrank 𝕜 E = n) :
    TauCeti.banachMazurDist 𝕜 E (EuclideanSpace 𝕜 (Fin n)) ≤ Real.sqrt n := by
  sorry

/-- Kadec–Snobar (Layer 7): every `n`-dimensional subspace of a normed space over `ℝ` or `ℂ` is
the range of a projection of norm at most `√n`. -/
theorem kadec_snobar (F : Submodule 𝕜 E) [FiniteDimensional 𝕜 F] :
    ∃ P : E →L[𝕜] E, LinearMap.range P.toLinearMap = F ∧ (∀ x ∈ F, P x = x) ∧
      ‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 F) := by
  sorry

/-- Garling–Gordon (Layer 7): for every `ε > 0`, a closed subspace `M` of finite codimension `n`
of a normed space over `ℝ` or `ℂ` is the kernel of a projection of norm at most `√n + ε`
(Garling–Gordon 1971; Pietsch, *Eigenvalues and s-Numbers*, 1987, 1.7.17), by John's
decomposition on the dual of the quotient. -/
theorem garling_gordon (M : Submodule 𝕜 E) (hM : IsClosed (M : Set E))
    [FiniteDimensional 𝕜 (E ⧸ M)] {ε : ℝ} (hε : 0 < ε) :
    ∃ P : E →L[𝕜] E, P.comp P = P ∧ LinearMap.ker P.toLinearMap = M ∧
      ‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 (E ⧸ M)) + ε := by
  sorry

/-- Dvoretzky's theorem, quantitative form (Layer 7): for every `k` and `ε > 0` there is `N` such
that every real normed space of dimension at least `N` contains a `k`-dimensional subspace
`(1+ε)`-equivalent to `ℓ²_k`. -/
theorem dvoretzky_finite (k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    ∃ N : ℕ, ∀ (E : Type u) [NormedAddCommGroup E] [NormedSpace ℝ E],
      FiniteDimensional ℝ E → N ≤ Module.finrank ℝ E →
      ∃ T : EuclideanSpace ℝ (Fin k) →L[ℝ] E,
        ∀ x, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖ := by
  sorry

/-- Dvoretzky's theorem, infinite-dimensional corollary (Layer 7): `ℓ²` is finitely representable
in every infinite-dimensional real Banach space. -/
theorem dvoretzky {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (hE : ¬ FiniteDimensional ℝ E) (n : ℕ) (ε : ℝ) (hε : 0 < ε) (hε' : ε < 1) :
    ∃ T : EuclideanSpace ℝ (Fin n) →L[ℝ] E,
      ∀ x, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖ := by
  sorry

end TauCetiRoadmap.BanachSpaceTheory
