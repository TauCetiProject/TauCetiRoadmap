/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Normed.Module.Complexification

/-!
# Banach space theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them: the approximation property, shrinking and boundedly complete
bases, the weak `p`-norm and the absolutely `p`-summing bound, the weak-star dual ball, and the
Rademacher second moment with type and cotype.

Headline theorems not statable at the pins, and what each lacks:

* B5.LocalHaarDual, `LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ)` for an arbitrary
  regular left Haar measure `μ`: its carrier, the quotient of the locally essentially bounded Borel
  functions by the locally null ones with the local essential-bound norm, is a construction the
  roadmap builds and neither library has. Only the σ-finite endpoint on the native `Lp 𝕜 ∞ μ` is
  stated here.
* B4's Grothendieck metric criterion `MAP(X) ↔ ∀ u, ‖Θ_X u‖ = ‖u‖_π` and the nuclear/integral
  comparisons: the projective and injective tensor norms are targets (the pinned
  `injectiveSeminorm` is not the classical `ε` norm).
* B5's dual identification `C(K,𝕜)* ≃ M(K)` and the Dunford–Pettis criterion: the normed space of
  finite regular scalar Borel measures with the total-variation norm is a target carrier.
* Pietsch factorization through `Lᵖ(ν)`: the factor through the closure of the canonical image needs
  the domination measure as data; only the domination theorem is stated.
* Enflo's quantitative trace obstruction and the Argyros–Haydon space `X_K` themselves: only the
  existence theorems they prove are stated.
* John's ellipsoid theorem: ellipsoids and volume of convex bodies are B7 targets.
-/

noncomputable section
open Filter Topology MeasureTheory
open scoped ENNReal InnerProductSpace

namespace TauCetiRoadmap.BanachSpaceTheory

universe u v

/-! ## B1–B2: duality, weak compactness and reflexivity -/

variable {𝕜 : Type*} [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]

/-- Eberlein–Šmulian (B2): a subset of a normed space over `ℝ` or `ℂ` is weakly compact iff it is
weakly sequentially compact. No completeness, separability or metrizability hypothesis. -/
theorem eberlein_smulian (K : Set E) :
    IsCompact (toWeakSpace 𝕜 E '' K) ↔ IsSeqCompact (toWeakSpace 𝕜 E '' K) := by
  sorry

/-- James (B2): a Banach space is reflexive iff every continuous functional attains its norm on
the closed unit ball. Reflexivity is surjectivity of the canonical map into the continuous bidual. -/
theorem james [CompleteSpace E] :
    Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 E) ↔
      ∀ f : StrongDual 𝕜 E, ∃ x : E, ‖x‖ ≤ 1 ∧ ‖f x‖ = ‖f‖ := by
  sorry

/-- Milman–Pettis (B2): a complete uniformly convex space over `ℝ` or `ℂ` is reflexive. -/
theorem milman_pettis [UniformConvexSpace E] [CompleteSpace E] :
    Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 E) := by
  sorry

/-- Krein–Šmulian (B2): a convex subset of the dual of a Banach space is weak-star closed iff its
intersection with every closed ball centred at zero is weak-star closed. -/
theorem krein_smulian [CompleteSpace E] (C : Set (StrongDual 𝕜 E)) (hC : Convex ℝ C) :
    IsClosed (StrongDual.toWeakDual '' C) ↔
      ∀ r : ℝ, IsClosed (StrongDual.toWeakDual '' (C ∩ Metric.closedBall 0 r)) := by
  sorry

/-- Bishop–Phelps (B2): the norm-attaining functionals are norm dense in the dual of a Banach
space. -/
theorem bishop_phelps [CompleteSpace E] :
    Dense {f : StrongDual 𝕜 E | ∃ x : E, ‖x‖ ≤ 1 ∧ ‖f x‖ = ‖f‖} := by
  sorry

/-! ## B3: Schauder bases -/

namespace SchauderBasis

/-- A basis is shrinking when its coordinate functionals span a norm-dense subspace of the strong
dual (B3). -/
def IsShrinking (b : _root_.SchauderBasis 𝕜 E) : Prop :=
  (Submodule.span 𝕜 (Set.range b.coord)).topologicalClosure = ⊤

/-- A basis is boundedly complete when every scalar sequence with bounded initial partial sums
gives a norm-convergent series along initial segments, not an unconditional `tsum` (B3). -/
def IsBoundedlyComplete (b : _root_.SchauderBasis 𝕜 E) : Prop :=
  ∀ a : ℕ → 𝕜,
    Bornology.IsBounded (Set.range (fun n ↦ ∑ i ∈ Finset.range n, a i • b i)) →
    ∃ x : E, Tendsto (fun n ↦ ∑ i ∈ Finset.range n, a i • b i) atTop (𝓝 x)

/-- James's basis criterion (B3): a Banach space with a Schauder basis is reflexive iff the basis
is shrinking and boundedly complete. -/
theorem reflexive_iff [CompleteSpace E] (b : _root_.SchauderBasis 𝕜 E) :
    Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 E) ↔
      IsShrinking b ∧ IsBoundedlyComplete b := by
  sorry

end SchauderBasis

/-! ## B4: approximation -/

/-- The approximation property (B4): the identity is uniformly approximable on every norm-compact
set by bounded operators of finite algebraic rank. -/
def HasApproximationProperty (𝕜 E : Type*) [RCLike 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] :
    Prop :=
  ∀ K : Set E, IsCompact K → ∀ ε : ℝ, 0 < ε →
    ∃ T : E →L[𝕜] E, FiniteDimensional 𝕜 (LinearMap.range T.toLinearMap) ∧
      ∀ x ∈ K, ‖T x - x‖ < ε

/-- A Banach space with a Schauder basis has the approximation property (B4), through the bounded
approximation property with the basis constant. -/
theorem SchauderBasis.approximationProperty [CompleteSpace E] (b : _root_.SchauderBasis 𝕜 E) :
    HasApproximationProperty 𝕜 E := by
  sorry

/-- Enflo (B4.0): a separable reflexive real Banach space without the approximation property. -/
theorem exists_reflexive_not_hasApproximationProperty :
    ∃ (E : Type) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E),
      CompleteSpace E ∧ TopologicalSpace.SeparableSpace E ∧
      Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ E) ∧
      ¬ HasApproximationProperty ℝ E := by
  sorry

/-- Argyros–Haydon (B4.1): an infinite-dimensional real Banach space on which every bounded
operator is a scalar plus a compact operator. -/
theorem exists_scalarPlusCompact :
    ∃ (E : Type) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E),
      CompleteSpace E ∧ ¬ FiniteDimensional ℝ E ∧
      ∀ T : E →L[ℝ] E, ∃ (c : ℝ) (K : E →L[ℝ] E),
        IsCompactOperator K ∧ T = c • ContinuousLinearMap.id ℝ E + K := by
  sorry

/-- B4.C: the real strong dual of `E`, complexified with the native Taylor complexification, is
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

/-! ## B5: Hilbert dimension, function spaces and dualities -/

section Hilbert

variable {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]
  [NormedAddCommGroup K] [InnerProductSpace 𝕜 K] [CompleteSpace K] {ι : Type u} {κ : Type v}

/-- Hilbert dimension (B5): any two Hilbert bases of a complete inner product space have index
types of the same cardinality, so the cardinality of a Hilbert basis is an invariant. -/
theorem hilbertBasis_lift_mk_eq (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 H) :
    Cardinal.lift.{v} (Cardinal.mk ι) = Cardinal.lift.{u} (Cardinal.mk κ) := by
  sorry

/-- Unitary classification (B5): two complete inner product spaces over the same field are
linearly isometrically equivalent iff their Hilbert dimensions agree. -/
theorem nonempty_linearIsometryEquiv_iff_lift_mk_eq (b : HilbertBasis ι 𝕜 H)
    (c : HilbertBasis κ 𝕜 K) :
    Nonempty (H ≃ₗᵢ[𝕜] K) ↔ Cardinal.lift.{v} (Cardinal.mk ι) = Cardinal.lift.{u} (Cardinal.mk κ) := by
  sorry

/-- Basis-preserving unitaries (B5): an equivalence of index types is realised by a linear isometric
equivalence sending the one Hilbert basis to the other. -/
theorem exists_linearIsometryEquiv_hilbertBasis (b : HilbertBasis ι 𝕜 H) (c : HilbertBasis κ 𝕜 K)
    (e : ι ≃ κ) : ∃ U : H ≃ₗᵢ[𝕜] K, ∀ i, U (b i) = c (e i) := by
  sorry

end Hilbert

section FunctionSpaces

variable {X : Type*} [MeasurableSpace X]

/-- σ-finite `L¹`–`L∞` duality (B5): for σ-finite `μ` the bilinear integral pairing, without
conjugation, is a linear isometric equivalence of the native `L∞(μ)` onto the dual of `L¹(μ)`. -/
theorem exists_lpInftyDualEquiv (μ : Measure X) [SigmaFinite μ] :
    ∃ e : Lp 𝕜 ∞ μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ),
      ∀ (g : Lp 𝕜 ∞ μ) (f : Lp 𝕜 1 μ), e g f = ∫ x, f x * g x ∂μ := by
  sorry

/-- `Lᵖ`–`Lᑫ` duality (B5): for `1 < p < ∞`, conjugate `q` and an arbitrary measure `μ`, the
bilinear integral pairing is a linear isometric equivalence of `L^q(μ)` onto the dual of `Lᵖ(μ)`. -/
theorem exists_lpDualEquiv (μ : Measure X) (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
    [p.HolderConjugate q] (hp : 1 < p) (hp' : p ≠ ∞) :
    ∃ e : Lp 𝕜 q μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 p μ),
      ∀ (g : Lp 𝕜 q μ) (f : Lp 𝕜 p μ), e g f = ∫ x, f x * g x ∂μ := by
  sorry

/-- Banach–Stone (B5): a surjective linear isometry between spaces of continuous functions on
compact Hausdorff spaces is a weighted composition with a homeomorphism and a unimodular weight. -/
theorem banach_stone {K L : Type*} [TopologicalSpace K] [CompactSpace K] [T2Space K]
    [TopologicalSpace L] [CompactSpace L] [T2Space L] (T : C(K, 𝕜) ≃ₗᵢ[𝕜] C(L, 𝕜)) :
    ∃ (φ : L ≃ₜ K) (h : C(L, 𝕜)), (∀ y, ‖h y‖ = 1) ∧
      ∀ (f : C(K, 𝕜)) (y : L), T f y = h y * f (φ y) := by
  sorry

end FunctionSpaces

/-! ## B6: summing operators, cotype and Grothendieck's inequality -/

/-- The weak `p`-norm of a finite family (B6): the supremum over the dual unit ball of the
`ℓᵖ` norm of the evaluations. -/
def weakNorm (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]
    (p : ℝ) {n : ℕ} (x : Fin n → E) : ℝ :=
  ⨆ f : {f : StrongDual 𝕜 E // ‖f‖ ≤ 1}, (∑ i, ‖f.1 (x i)‖ ^ p) ^ (1 / p)

/-- `T` is absolutely `p`-summing with constant `C` (B6): on every finite family the `ℓᵖ` norm of
the images is at most `C` times the weak `p`-norm of the family. `π_p(T)` is the least such `C`. -/
def IsAbsolutelySumming {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]
    (p : ℝ) (T : E →L[𝕜] F) (C : ℝ) : Prop :=
  ∀ (n : ℕ) (x : Fin n → E), (∑ i, ‖T (x i)‖ ^ p) ^ (1 / p) ≤ C * weakNorm 𝕜 p x

/-- The closed unit ball of the dual, as a subset of the weak-star dual (B6); compact by
Banach–Alaoglu. -/
def DualBall (𝕜 E : Type*) [RCLike 𝕜] [NormedAddCommGroup E] [NormedSpace 𝕜 E] :
    Set (WeakDual 𝕜 E) :=
  WeakDual.toStrongDual ⁻¹' Metric.closedBall 0 1

/-- The Borel measurable structure of the weak-star dual ball. -/
instance : MeasurableSpace (DualBall 𝕜 E) := borel _

instance : BorelSpace (DualBall 𝕜 E) := ⟨rfl⟩

/-- Pietsch domination (B6): `π_p(T) ≤ C` iff a regular Borel probability measure `ν` on the
weak-star dual unit ball dominates `T`: `‖T x‖ ≤ C (∫ |f(x)|ᵖ dν(f))^(1/p)` for every `x`. -/
theorem pietsch_domination {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]
    (p : ℝ) (hp : 1 ≤ p) (T : E →L[𝕜] F) (C : ℝ) (hC : 0 ≤ C) :
    IsAbsolutelySumming p T C ↔
      ∃ ν : Measure (DualBall 𝕜 E), IsProbabilityMeasure ν ∧ ν.Regular ∧
        ∀ x : E, ‖T x‖ ≤ C * (∫ f, ‖f.1 x‖ ^ p ∂ν) ^ (1 / p) := by
  sorry

/-- The Rademacher second moment `E_ε ‖Σ ε_i y_i‖²` of a finite family, averaged over the uniform
sign cube (B6.Cotype2); `R₂(y)` is its square root. -/
def rademacherSecondMoment {E : Type*} [NormedAddCommGroup E] {n : ℕ} (y : Fin n → E) : ℝ :=
  (∑ ε : Fin n → Bool, ‖∑ i, (if ε i then y i else -y i)‖ ^ 2) / 2 ^ n

/-- Rademacher cotype `q` with constant `C` (B6.Cotype2): `(Σ‖y_i‖^q)^(1/q) ≤ C R₂(y)` for every
finite family. -/
def HasCotype (E : Type*) [NormedAddCommGroup E] (q C : ℝ) : Prop :=
  ∀ (n : ℕ) (y : Fin n → E),
    (∑ i, ‖y i‖ ^ q) ^ (1 / q) ≤ C * Real.sqrt (rademacherSecondMoment y)

/-- Rademacher type `p` with constant `C` (B6.Cotype2): `R₂(y) ≤ C (Σ‖y_i‖^p)^(1/p)` for every
finite family. -/
def HasType (E : Type*) [NormedAddCommGroup E] (p C : ℝ) : Prop :=
  ∀ (n : ℕ) (y : Fin n → E),
    Real.sqrt (rademacherSecondMoment y) ≤ C * (∑ i, ‖y i‖ ^ p) ^ (1 / p)

/-- Pisier's cotype-2 summing bound (B6.Cotype2): for every cotype-2 constant `C` there is a
constant `K` depending only on `C` such that for every real space `Y` of cotype 2 with constant
`C` and every operator `U` from a finite-dimensional Euclidean space, `U` is 2-summing with
`π₂(U) ≤ K · R₂(U e_i)` on the standard basis. -/
theorem cotype2_summing_bound (C : ℝ) :
    ∃ K : ℝ, ∀ (Y : Type u) [NormedAddCommGroup Y] [NormedSpace ℝ Y], HasCotype Y 2 C →
      ∀ (n : ℕ) (U : EuclideanSpace ℝ (Fin n) →L[ℝ] Y),
        IsAbsolutelySumming 2 U
          (K * Real.sqrt (rademacherSecondMoment fun i ↦ U (EuclideanSpace.single i 1))) := by
  sorry

/-- Grothendieck's inequality, real case with constant 8 (B6): a bilinear form bounded by one on
scalar unit balls is bounded by 8 on Hilbert unit balls. -/
theorem grothendieck_real (m n : ℕ) (a : Matrix (Fin m) (Fin n) ℝ)
    (ha : ∀ (s : Fin m → ℝ) (t : Fin n → ℝ), (∀ i, |s i| ≤ 1) → (∀ j, |t j| ≤ 1) →
      |∑ i, ∑ j, a i j * s i * t j| ≤ 1)
    (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (u : Fin m → H) (v : Fin n → H) (hu : ∀ i, ‖u i‖ ≤ 1) (hv : ∀ j, ‖v j‖ ≤ 1) :
    |∑ i, ∑ j, a i j * ⟪u i, v j⟫_ℝ| ≤ 8 := by
  sorry

/-- Grothendieck's inequality, complex case with constant 16 (B6). -/
theorem grothendieck_complex (m n : ℕ) (a : Matrix (Fin m) (Fin n) ℂ)
    (ha : ∀ (s : Fin m → ℂ) (t : Fin n → ℂ), (∀ i, ‖s i‖ ≤ 1) → (∀ j, ‖t j‖ ≤ 1) →
      ‖∑ i, ∑ j, a i j * s i * t j‖ ≤ 1)
    (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (u : Fin m → H) (v : Fin n → H) (hu : ∀ i, ‖u i‖ ≤ 1) (hv : ∀ j, ‖v j‖ ≤ 1) :
    ‖∑ i, ∑ j, a i j * ⟪u i, v j⟫_ℂ‖ ≤ 16 := by
  sorry

/-! ## B7: local theory and Euclidean sections -/

section Local

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

-- Keep the normed instances of the iterated dual explicit so that the finite-dimensional
-- subspaces carry the operator norm at both stages.
local instance : NormedAddCommGroup (StrongDual ℝ E) := inferInstance
local instance : NormedSpace ℝ (StrongDual ℝ E) := inferInstance
local instance : NormedAddCommGroup (StrongDual ℝ (StrongDual ℝ E)) := inferInstance
local instance : NormedSpace ℝ (StrongDual ℝ (StrongDual ℝ E)) := inferInstance

/-- Local reflexivity (B7): a finite-dimensional subspace of the bidual embeds into the space with
two-sided `(1−ε,1+ε)` bounds, preserving the pairings with a finite-dimensional subspace of the
dual and fixing the vectors that come from the space. -/
theorem local_reflexivity [CompleteSpace E]
    (F : Submodule ℝ (StrongDual ℝ (StrongDual ℝ E))) [FiniteDimensional ℝ F]
    (G : Submodule ℝ (StrongDual ℝ E)) [FiniteDimensional ℝ G]
    (ε : ℝ) (hε : 0 < ε) (hε' : ε < 1) :
    ∃ T : F →L[ℝ] E,
      (∀ x : F, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖) ∧
      (∀ x : F, ∀ f : G, f.val (T x) = x.val f.val) ∧
      (∀ x : E, ∀ hx : NormedSpace.inclusionInDoubleDual ℝ E x ∈ F,
        T ⟨NormedSpace.inclusionInDoubleDual ℝ E x, hx⟩ = x) := by
  sorry

/-- Kadec–Snobar (B7): every `n`-dimensional subspace of a real normed space is the range of a
projection of norm at most `√n`. -/
theorem kadec_snobar (F : Submodule ℝ E) [FiniteDimensional ℝ F] :
    ∃ P : E →L[ℝ] E, LinearMap.range P.toLinearMap = F ∧ (∀ x ∈ F, P x = x) ∧
      ‖P‖ ≤ Real.sqrt (Module.finrank ℝ F) := by
  sorry

/-- Dvoretzky's theorem, quantitative form (B7): for every `k` and `ε > 0` there is `N` such that
every real normed space of dimension at least `N` contains a `k`-dimensional subspace
`(1+ε)`-equivalent to `ℓ²_k`. -/
theorem dvoretzky_finite (k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    ∃ N : ℕ, ∀ (E : Type u) [NormedAddCommGroup E] [NormedSpace ℝ E],
      FiniteDimensional ℝ E → N ≤ Module.finrank ℝ E →
      ∃ T : EuclideanSpace ℝ (Fin k) →L[ℝ] E,
        ∀ x, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖ := by
  sorry

/-- Dvoretzky's theorem, infinite-dimensional corollary (B7): `ℓ²` is finitely representable in
every infinite-dimensional real Banach space. -/
theorem dvoretzky [CompleteSpace E] (hE : ¬ FiniteDimensional ℝ E)
    (n : ℕ) (ε : ℝ) (hε : 0 < ε) (hε' : ε < 1) :
    ∃ T : EuclideanSpace ℝ (Fin n) →L[ℝ] E,
      ∀ x, (1 - ε) * ‖x‖ ≤ ‖T x‖ ∧ ‖T x‖ ≤ (1 + ε) * ‖x‖ := by
  sorry

end Local

end TauCetiRoadmap.BanachSpaceTheory
