module

import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Normal.Basic
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity

/-!
# Varifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished roadmap
proves, each with `sorry`, together with the few definitions those statements need.

Two carriers are used. On a Riemannian manifold `(M, g)` (boundaryless, second countable, with
its Riemannian extended distance), the Grassmann bundle `grassmannBundle I M k` is the set of
`g`-orthogonal projections of rank `k` in the total space of the endomorphism bundle of `TM`, and
a varifold is a measure on it, finite on compact sets; the statements take the open set `W` of
the README to be `M` itself, an open subset with the restricted metric being again a Riemannian
manifold. In a Euclidean space `F`, a varifold on an open `W ⊆ F` is a measure on
`W × Euclidean.grassmannian F k` (Allard1972, Section 3; Simon1983, §38).

Stated here:

* Layer 4: the Riesz decomposition of the first variation on a Riemannian manifold (§4.4);
* Layer 6: the Euclidean monotonicity identity (§6.1); the Riemannian monotonicity inequality
  and its exponential form (§6.2); the existence of densities almost everywhere, their existence
  everywhere and upper semicontinuity under a ratio bound, and the lower bound on the support
  (§6.3); the constancy theorem (§6.4);
* Layer 7: varifold tangents in Euclidean space (§7.2); Allard's rectifiability theorem (§7.3);
  the compactness theorems for rectifiable (§7.4) and for integral (§7.6) varifolds, for a fixed
  metric;
* Layer 8: rectifiable and integral tangent cones in Euclidean space (§8.1, §8.2).

Not statable at the pins, and not stated:

* the Riemannian forms of §7.2, §8.1 and §8.2 (varifold tangents and tangent cones at a point of
  a Riemannian manifold). They need the varifold push-forward of §3.1 along the normal-coordinate
  blow-up `λ⁻¹ log_x` into the Grassmann bundle of `(T_xM, g_x)`: the map sending a plane of
  `T_yM` to the orthogonal projection onto its image in `T_xM`, and the `k`-Jacobian weight between
  the two fibres. The pins have the logarithm (`TauCeti.Manifold.riemannianLog`) but no
  push-forward of measures on Grassmann bundles along differentials;
* the forms of §7.4 and §7.6 for metrics `g_i → g` in `C²`. A metric given as data is at the
  pins (`Bundle.ContMDiffRiemannianMetric`), with the copy `TauCeti.WithMetric g` of `M` that
  carries it as its `RiemannianBundle` instance, and with its Levi-Civita connection
  (`TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection`). Missing are an
  `EMetricSpace` instance on these copies, over which the definitions of this file are stated (the
  Riemannian distance of `IsRiemannianManifold`, the balls of `HasDensity`, the Hausdorff measure
  of `IsRectifiable`), and the identification of §1.2 between the Grassmann bundles of two
  metrics, through which `V_i → V` is read;
* the comparison §5.2 for an embedded `M ⊆ ℝ^L`: the push-forward `ι_#` of §3.1 into
  `W × G(ℝ^L, k)` (the image-plane map `P ↦ dι P dι*`) and the second fundamental form of `M` as a
  tensor on `TM` are not at the pins (`TauCeti.secondFundamentalForm` is the form of a map out of
  a normed space);
* the identification §9.3 of GeometricCurrents' auxiliary varifold of an integral current:
  neither integral currents nor that varifold are in Mathlib or Tau Ceti at the pins.
-/

namespace TauCetiRoadmap.Varifolds

open MeasureTheory Filter Topology Set Bundle Manifold TauCeti.Manifold
open scoped ENNReal NNReal ContDiff InnerProductSpace Pointwise CompactlySupported

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [SecondCountableTopology M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M] [MeasurableSpace M] [BorelSpace M]
  {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]
  {k : ℕ}

/-! ## Layer 1: the Grassmann bundle and the varifold carrier -/

variable (I M) in
/-- The **Grassmann bundle** `G_k(M)` of a Riemannian manifold (§1.2): the pairs `(x, P)` with
`P : T_xM → T_xM` a self-adjoint idempotent for the inner product `g_x` whose range has dimension
`k`, that is, the `g_x`-orthogonal projection onto a `k`-plane of `T_xM`, as a subset of the total
space of the endomorphism bundle of `TM` with the subspace topology (Simon1983, §38, for the
Euclidean case; AgnolettoCorreaHoyosDaSilvaNardulli2025, Section 2). -/
noncomputable def grassmannBundle (k : ℕ) :
    Set (TotalSpace (E →L[ℝ] E) (fun x : M ↦ TangentSpace I x →L[ℝ] TangentSpace I x)) :=
  {p | IsStarProjection p.snd ∧
    Module.finrank ℝ (LinearMap.range (p.snd : TangentSpace I p.proj →ₗ[ℝ] TangentSpace I p.proj))
      = k}

/-- The Borel σ-algebra of the Grassmann bundle, on which varifolds are measures (§1.2). -/
noncomputable instance grassmannBundle.instMeasurableSpace (k : ℕ) :
    MeasurableSpace (grassmannBundle I M k) :=
  borel _

/-- The **weight** `‖V‖ = π_* V` of a varifold `V` on `(M, g)`: the image of `V` under the
projection `(x, P) ↦ x` (§1.3; Simon1983, §38). -/
noncomputable def weight (V : Measure (grassmannBundle I M k)) : Measure M :=
  V.map fun p ↦ p.1.proj

namespace Euclidean

variable (F) in
/-- The **Grassmannian** `G(F, k)` of a finite-dimensional real inner product space (§1.1): the
self-adjoint idempotents of `F` with `k`-dimensional range, the orthogonal projections onto the
`k`-planes of `F` (Simon1983, §38). -/
def grassmannian (k : ℕ) : Set (F →L[ℝ] F) :=
  {P | IsStarProjection P ∧ Module.finrank ℝ (LinearMap.range (P : F →ₗ[ℝ] F)) = k}

/-- The **weight** of a varifold `V` on an open set `W` of a Euclidean space, read as a measure on
`F` carried by `W` (§1.3). -/
noncomputable def weight {W : TopologicalSpace.Opens F} (V : Measure (W × grassmannian F k)) :
    Measure F :=
  V.map fun p ↦ (p.1 : F)

end Euclidean

/-- **Varifold convergence** (§1.4): `∫ f dV_i → ∫ f dV'` for every compactly supported
continuous `f` (Simon1983, §38). -/
def VarifoldTendsto {Y : Type*} [TopologicalSpace Y] [MeasurableSpace Y]
    (V : ℕ → Measure Y) (V' : Measure Y) : Prop :=
  ∀ f : C_c(Y, ℝ), Tendsto (fun i ↦ ∫ p, f p ∂V i) atTop (𝓝 (∫ p, f p ∂V'))

/-! ## Layer 2: rectifiable and integral varifolds -/

/-- A varifold on `(M, g)` is **rectifiable** (§2.2, in the `C¹`-piece form): there are countably
many injective `C¹` immersions `f j` of open sets `U j ⊆ ℝ^k` into `M` and a density `θ` with
`‖V‖ = θ Hᵏ⌞(⋃ j, f j '' U j)`, and the plane of `V`-almost every `(x, P)` is the tangent plane
`df_j(t)(ℝ^k)` of some piece at some `t` with `f j t = x`. This is `V = v(Γ, θ)` for a countably
`k`-rectifiable `Γ` (Simon1983, Lemma 11.1 and §15). -/
def IsRectifiable (V : Measure (grassmannBundle I M k)) : Prop :=
  ∃ (f : ℕ → EuclideanSpace ℝ (Fin k) → M) (U : ℕ → Set (EuclideanSpace ℝ (Fin k)))
    (θ : M → ℝ≥0∞),
    (∀ j, IsOpen (U j) ∧ ContMDiffOn 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I 1 (f j) (U j) ∧
      InjOn (f j) (U j) ∧
      ∀ t ∈ U j, Function.Injective (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I (f j) t)) ∧
    weight V = (μHE[k].restrict (⋃ j, f j '' U j)).withDensity θ ∧
    ∀ᵐ p ∂V, ∃ j, ∃ t ∈ U j, f j t = p.1.proj ∧
      ∀ v : E, v ∈ Set.range p.1.snd ↔
        v ∈ Set.range (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I (f j) t)

/-- A varifold on `(M, g)` is **integral** (§2.2): it is rectifiable, in the form of
`IsRectifiable`, with a density `θ` taking values in `ℕ`. -/
def IsIntegral (V : Measure (grassmannBundle I M k)) : Prop :=
  ∃ (f : ℕ → EuclideanSpace ℝ (Fin k) → M) (U : ℕ → Set (EuclideanSpace ℝ (Fin k)))
    (θ : M → ℕ),
    (∀ j, IsOpen (U j) ∧ ContMDiffOn 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I 1 (f j) (U j) ∧
      InjOn (f j) (U j) ∧
      ∀ t ∈ U j, Function.Injective (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I (f j) t)) ∧
    weight V = (μHE[k].restrict (⋃ j, f j '' U j)).withDensity (fun x ↦ (θ x : ℝ≥0∞)) ∧
    ∀ᵐ p ∂V, ∃ j, ∃ t ∈ U j, f j t = p.1.proj ∧
      ∀ v : E, v ∈ Set.range p.1.snd ↔
        v ∈ Set.range (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I (f j) t)

namespace Euclidean

variable {W : TopologicalSpace.Opens F}

/-- A varifold on an open set of a Euclidean space is **rectifiable** (§2.2, in the `C¹`-piece
form of `IsRectifiable`; Simon1983, Lemma 11.1 and §15). -/
def IsRectifiable (V : Measure (W × grassmannian F k)) : Prop :=
  ∃ (f : ℕ → EuclideanSpace ℝ (Fin k) → F) (U : ℕ → Set (EuclideanSpace ℝ (Fin k)))
    (θ : F → ℝ≥0∞),
    (∀ j, IsOpen (U j) ∧ ContDiffOn ℝ 1 (f j) (U j) ∧ InjOn (f j) (U j) ∧
      ∀ t ∈ U j, Function.Injective (fderiv ℝ (f j) t)) ∧
    weight V = (μHE[k].restrict (⋃ j, f j '' U j)).withDensity θ ∧
    ∀ᵐ p ∂V, ∃ j, ∃ t ∈ U j, f j t = p.1 ∧
      Set.range (p.2 : F →L[ℝ] F) = Set.range (fderiv ℝ (f j) t)

/-- A varifold on an open set of a Euclidean space is **integral** (§2.2): rectifiable with a
density taking values in `ℕ`. -/
def IsIntegral (V : Measure (W × grassmannian F k)) : Prop :=
  ∃ (f : ℕ → EuclideanSpace ℝ (Fin k) → F) (U : ℕ → Set (EuclideanSpace ℝ (Fin k)))
    (θ : F → ℕ),
    (∀ j, IsOpen (U j) ∧ ContDiffOn ℝ 1 (f j) (U j) ∧ InjOn (f j) (U j) ∧
      ∀ t ∈ U j, Function.Injective (fderiv ℝ (f j) t)) ∧
    weight V = (μHE[k].restrict (⋃ j, f j '' U j)).withDensity (fun x ↦ (θ x : ℝ≥0∞)) ∧
    ∀ᵐ p ∂V, ∃ j, ∃ t ∈ U j, f j t = p.1 ∧
      Set.range (p.2 : F →L[ℝ] F) = Set.range (fderiv ℝ (f j) t)

/-! ## Layer 3: dilations -/

/-- The **dilation** `V_{x,λ} = (η_{x,λ})_# V` of a varifold on `W ⊆ F` by
`η_{x,λ}(y) = λ⁻¹(y − x)`: the image of `V` under `(y, P) ↦ (λ⁻¹(y − x), P)` multiplied by
`λ^{−k}`, read as a measure on `G_k(F)` carried by `η_{x,λ}(W)` (§3.2; Simon1983, §38). -/
noncomputable def blowUp (V : Measure (W × grassmannian F k)) (x : F) (s : ℝ) :
    Measure ((⊤ : TopologicalSpace.Opens F) × grassmannian F k) :=
  (ENNReal.ofReal (s ^ k))⁻¹ • V.map fun p ↦ (⟨s⁻¹ • ((p.1 : F) - x), trivial⟩, p.2)

end Euclidean

/-! ## Layer 4: the first variation -/

/-- The **first variation** `δV(X) = ∫ tr(P ∘ ∇X(x)) dV(x, P)` of a varifold on `(M, g)` along a
vector field `X`, with `∇` the Levi-Civita connection (§4.1; Simon1983, 39.2;
AgnolettoCorreaHoyosDaSilvaNardulli2025, Section 2). -/
noncomputable def firstVariation (V : Measure (grassmannBundle I M k))
    (X : Π x : M, TangentSpace I x) : ℝ :=
  ∫ p, LinearMap.trace ℝ (TangentSpace I p.1.proj)
    ((p.1.snd ∘L CovariantDerivative.leviCivitaConnection I M X p.1.proj :
      TangentSpace I p.1.proj →L[ℝ] TangentSpace I p.1.proj) :
        TangentSpace I p.1.proj →ₗ[ℝ] TangentSpace I p.1.proj) ∂V

/-- A varifold on `(M, g)` is **stationary** when its first variation vanishes on every `C¹`
vector field with compact support (§4.3; Simon1983, 39.3). -/
def IsStationary (V : Measure (grassmannBundle I M k)) : Prop :=
  ∀ X : Π x : M, TangentSpace I x, ContMDiff I I.tangent 1 (T% X) →
    HasCompactSupport (β := E) X → firstVariation V X = 0

/-- A varifold on `(M, g)` has **locally bounded first variation** when for each compact `K` there
is `C` with `|δV(X)| ≤ C` for every `C¹` field `X` supported in `K` with `|X| ≤ 1` pointwise
(§4.3; Simon1983, 39.3). -/
def HasLocallyBoundedFirstVariation (V : Measure (grassmannBundle I M k)) : Prop :=
  ∀ K : Set M, IsCompact K → ∃ C : ℝ, ∀ X : Π x : M, TangentSpace I x,
    ContMDiff I I.tangent 1 (T% X) → tsupport (α := E) X ⊆ K → (∀ x, ‖X x‖ ≤ 1) →
      |firstVariation V X| ≤ C

/-- The **total first variation** `‖δV‖(U) = sup {δV(X) : X ∈ C¹_c(U), |X| ≤ 1}` of a set `U`, in
`[0, ∞]`; on open sets it is the total variation measure of `δV` when `V` has locally bounded
first variation (§4.3). -/
noncomputable def firstVariationMass (V : Measure (grassmannBundle I M k)) (U : Set M) :
    ℝ≥0∞ :=
  ⨆ (X : Π x : M, TangentSpace I x) (_ : ContMDiff I I.tangent 1 (T% X))
    (_ : HasCompactSupport (β := E) X) (_ : tsupport (α := E) X ⊆ U) (_ : ∀ x, ‖X x‖ ≤ 1),
      ENNReal.ofReal (firstVariation V X)

namespace Euclidean

variable {W : TopologicalSpace.Opens F}

/-- The **first variation** `δV(X) = ∫ tr(P ∘ DX(y)) dV(y, P)` of a varifold on an open set of a
Euclidean space (§4.1; Simon1983, 39.2). -/
noncomputable def firstVariation (V : Measure (W × grassmannian F k)) (X : F → F) : ℝ :=
  ∫ p, LinearMap.trace ℝ F (((p.2 : F →L[ℝ] F) ∘L fderiv ℝ X p.1 : F →L[ℝ] F) : F →ₗ[ℝ] F) ∂V

/-- A varifold on an open `W ⊆ F` is **stationary** in `W` (§4.3; Simon1983, 39.3). -/
def IsStationary (V : Measure (W × grassmannian F k)) : Prop :=
  ∀ X : F → F, ContDiff ℝ 1 X → HasCompactSupport X → tsupport X ⊆ W → firstVariation V X = 0

/-- The **total first variation** `‖δV‖(U)` of a set `U`, the supremum of `δV(X)` over `C¹`
fields with compact support in `U ∩ W` and `|X| ≤ 1` (§4.3). -/
noncomputable def firstVariationMass (V : Measure (W × grassmannian F k)) (U : Set F) : ℝ≥0∞ :=
  ⨆ (X : F → F) (_ : ContDiff ℝ 1 X) (_ : HasCompactSupport X) (_ : tsupport X ⊆ U ∩ W)
    (_ : ∀ y, ‖X y‖ ≤ 1), ENNReal.ofReal (firstVariation V X)

end Euclidean

/-- **The Riesz decomposition of the first variation** (§4.4). A varifold `V` on `(M, g)` with
locally bounded first variation has a generalised mean curvature `H_V`, a section of `TM` that is
measurable and locally integrable for `‖V‖`, a generalised boundary measure `σ_V`, a Radon
measure singular to `‖V‖`, and a generalised co-normal `η_V`, a `σ_V`-measurable section of `TM`
of length one `σ_V`-a.e., with
`δV(X) = −∫ ⟨H_V, X⟩ d‖V‖ + ∫ ⟨η_V, X⟩ dσ_V` for every `C¹` field `X` with compact support, and
`‖δV‖(U) = ∫_U |H_V| d‖V‖ + σ_V(U)` for every open `U` (Simon1983, 39.3–39.4;
AgnolettoCorreaHoyosDaSilvaNardulli2025, Section 2). Measurability is that of the sections
`x ↦ (x, H_V(x))` and `x ↦ (x, η_V(x))` into the tangent bundle. -/
theorem exists_firstVariation_eq_riesz (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] (hV : HasLocallyBoundedFirstVariation V) :
    ∃ (Hv : Π x : M, TangentSpace I x) (σ : Measure M) (η : Π x : M, TangentSpace I x),
      IsFiniteMeasureOnCompacts σ ∧ σ ⟂ₘ weight V ∧
      AEStronglyMeasurable (T% Hv) (weight V) ∧ AEStronglyMeasurable (T% η) σ ∧
      (∀ᵐ x ∂σ, ‖η x‖ = 1) ∧
      (∀ K, IsCompact K → ∫⁻ x in K, ‖Hv x‖ₑ ∂weight V < ⊤) ∧
      (∀ X : Π x : M, TangentSpace I x, ContMDiff I I.tangent 1 (T% X) →
        HasCompactSupport (β := E) X →
        firstVariation V X = -∫ x, ⟪Hv x, X x⟫_ℝ ∂weight V + ∫ x, ⟪η x, X x⟫_ℝ ∂σ) ∧
      ∀ U, IsOpen U → firstVariationMass V U =
        ((weight V).withDensity fun x ↦ ‖Hv x‖ₑ) U + σ U := by
  sorry

/-! ## Layer 6: monotonicity, densities and constancy -/

/-- `ω_k`, the volume of the unit ball of `ℝ^k` (Conventions). -/
noncomputable def unitBallVolume (k : ℕ) : ℝ≥0∞ :=
  volume (Metric.ball (0 : EuclideanSpace ℝ (Fin k)) 1)

/-- The **density ratio** `μ(B_ρ(x)) / (ω_k ρ^k)` in `[0, ∞]` on an extended metric space
(Conventions). -/
noncomputable def densityRatio {X : Type*} [PseudoEMetricSpace X] [MeasurableSpace X]
    (μ : Measure X) (k : ℕ) (x : X) (ρ : ℝ) : ℝ≥0∞ :=
  μ (Metric.eball x (ENNReal.ofReal ρ)) / (unitBallVolume k * ENNReal.ofReal ρ ^ k)

/-- The `k`-dimensional **density** `Θ^k(μ, x)` exists and equals `θ ∈ [0, ∞]`: the density ratio
tends to `θ` as `ρ ↓ 0` (Conventions; Simon1983, §3). -/
def HasDensity {X : Type*} [PseudoEMetricSpace X] [MeasurableSpace X]
    (μ : Measure X) (k : ℕ) (x : X) (θ : ℝ≥0∞) : Prop :=
  Tendsto (densityRatio μ k x) (𝓝[>] 0) (𝓝 θ)

/-- The **upper density** `Θ^{*k}(μ, x) = lim sup_{ρ↓0} μ(B_ρ(x)) / (ω_k ρ^k)` (Conventions). -/
noncomputable def upperDensity {X : Type*} [PseudoEMetricSpace X] [MeasurableSpace X]
    (μ : Measure X) (k : ℕ) (x : X) : ℝ≥0∞ :=
  limsup (densityRatio μ k x) (𝓝[>] 0)

namespace Euclidean

variable {W : TopologicalSpace.Opens F}

/-- **The monotonicity identity** (§6.1). Let `V` be a varifold on an open `W ⊆ F` whose first
variation is represented as `δV(X) = −∫ ⟨H, X⟩ d‖V‖ + ∫ ⟨η, X⟩ dσ` on `C¹` fields with compact
support in `W`, with `H` locally integrable, `σ` finite on compact subsets of `W` and `|η| ≤ 1`
(4.4's decomposition is one such representation). If `B_{ρ₀}(x) ⊆ W` and `0 < σ < ρ < ρ₀`, then
`ρ^{−k}‖V‖(B_ρ(x)) − σ^{−k}‖V‖(B_σ(x))` equals the integral of `r^{−k−2}|P^⊥(y − x)|²` over the
annulus `σ ≤ r < ρ`, `r = |y − x|`, minus `∫_σ^ρ t^{−k−1} δV(1_{B_t(x)}(y − x)) dt`, the first
variation of the truncated radial field being read through the representation (Simon1983,
17.2–17.5 and 40.1–40.3). -/
theorem monotonicity_identity (hk : 1 ≤ k) (V : Measure (W × grassmannian F k))
    [IsFiniteMeasureOnCompacts V] (Hv : F → F) (σm : Measure F) (η : F → F)
    (hσm : ∀ K : Set F, IsCompact K → K ⊆ W → σm K < ⊤)
    (hη : AEStronglyMeasurable η σm) (hη1 : ∀ᵐ y ∂σm, ‖η y‖ ≤ 1)
    (hH : ∀ K : Set F, IsCompact K → K ⊆ W → IntegrableOn Hv K (weight V))
    (hrep : ∀ X : F → F, ContDiff ℝ 1 X → HasCompactSupport X → tsupport X ⊆ W →
      firstVariation V X = -∫ y, ⟪Hv y, X y⟫_ℝ ∂weight V + ∫ y, ⟪η y, X y⟫_ℝ ∂σm)
    {x : F} {σ ρ ρ₀ : ℝ} (hρ₀ : Metric.ball x ρ₀ ⊆ W) (hσ : 0 < σ) (hσρ : σ < ρ)
    (hρ : ρ < ρ₀) :
    (ρ ^ k)⁻¹ * (weight V (Metric.ball x ρ)).toReal -
        (σ ^ k)⁻¹ * (weight V (Metric.ball x σ)).toReal =
      ∫ p in {p : W × grassmannian F k | σ ≤ ‖(p.1 : F) - x‖ ∧ ‖(p.1 : F) - x‖ < ρ},
          ‖(p.1 : F) - x‖ ^ (-(k : ℤ) - 2) *
            ‖((p.1 : F) - x) - (p.2 : F →L[ℝ] F) ((p.1 : F) - x)‖ ^ 2 ∂V -
        ∫ t in σ..ρ, t ^ (-(k : ℤ) - 1) *
          (∫ y in Metric.ball x t, ⟪η y, y - x⟫_ℝ ∂σm -
            ∫ y in Metric.ball x t, ⟪Hv y, y - x⟫_ℝ ∂weight V) := by
  sorry

end Euclidean

/-- **The Riemannian monotonicity inequality** (§6.2). Let `V` have locally bounded first variation
on `(M, g)`, `κ ≥ 0`, let the tangent ball of radius `ρ₀` about `0` in `T_xM` be a normal domain,
so that `exp_x` maps it onto `B_{ρ₀}(x)`, let the sectional curvature be at most `κ` on `B_{ρ₀}(x)`
and `√κ ρ₀ ≤ π/2`. Then for `0 < σ < ρ < ρ₀`,
`σ^{−k}‖V‖(B_σ(x)) ≤ ρ^{−k}‖V‖(B_ρ(x)) + ∫_σ^ρ t^{−k} (‖δV‖(B_t(x)) + k√κ ‖V‖(B_t(x))) dt`
(Scharrer2022, Lemma 3.3 and Remark 3.4; compare AgnolettoCorreaHoyosDaSilvaNardulli2025,
Lemma 2.22, a differential form for a weighted, mollified ratio under a two-sided curvature
bound). -/
theorem monotonicity_inequality (hk : 1 ≤ k) (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] (hV : HasLocallyBoundedFirstVariation V) (x : M)
    {κ ρ₀ : ℝ} (hκ : 0 ≤ κ) (hnormal : IsNormalDomain I M x (Metric.ball 0 ρ₀))
    (hcurv : ∀ y ∈ Metric.eball x (ENNReal.ofReal ρ₀), ∀ u v : TangentSpace I y,
      (CovariantDerivative.leviCivitaConnection I M).sectionalCurvature
        (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) y u v ≤ κ)
    (hκρ₀ : √κ * ρ₀ ≤ Real.pi / 2) {σ ρ : ℝ} (hσ : 0 < σ) (hσρ : σ < ρ) (hρ : ρ < ρ₀) :
    ENNReal.ofReal (σ ^ k)⁻¹ * weight V (Metric.eball x (ENNReal.ofReal σ)) ≤
      ENNReal.ofReal (ρ ^ k)⁻¹ * weight V (Metric.eball x (ENNReal.ofReal ρ)) +
        ∫⁻ t in Ioo σ ρ, ENNReal.ofReal (t ^ k)⁻¹ *
          (firstVariationMass V (Metric.eball x (ENNReal.ofReal t)) +
            ENNReal.ofReal (k * √κ) * weight V (Metric.eball x (ENNReal.ofReal t))) := by
  sorry

/-- **Monotonicity of the density ratio** (§6.2). Under the hypotheses of
`monotonicity_inequality`, if `‖δV‖(B_t(x)) ≤ Λ ‖V‖(B_t(x))` for `0 < t < ρ₀`, then
`ρ ↦ e^{(Λ + k√κ)ρ} ‖V‖(B_ρ(x)) / (ω_k ρ^k)` is non-decreasing on `(0, ρ₀)` (Scharrer2022,
Lemma 3.3 and Remark 3.4, with Grönwall's inequality). -/
theorem monotoneOn_exp_mul_densityRatio (hk : 1 ≤ k) (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] (hV : HasLocallyBoundedFirstVariation V) (x : M)
    {κ ρ₀ : ℝ} (hκ : 0 ≤ κ) (hnormal : IsNormalDomain I M x (Metric.ball 0 ρ₀))
    (hcurv : ∀ y ∈ Metric.eball x (ENNReal.ofReal ρ₀), ∀ u v : TangentSpace I y,
      (CovariantDerivative.leviCivitaConnection I M).sectionalCurvature
        (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) y u v ≤ κ)
    (hκρ₀ : √κ * ρ₀ ≤ Real.pi / 2) {Λ : ℝ≥0}
    (hΛ : ∀ t : ℝ, 0 < t → t < ρ₀ → firstVariationMass V (Metric.eball x (ENNReal.ofReal t)) ≤
      Λ * weight V (Metric.eball x (ENNReal.ofReal t))) :
    MonotoneOn (fun ρ : ℝ ↦ ENNReal.ofReal (Real.exp ((Λ + k * √κ) * ρ)) *
      densityRatio (weight V) k x ρ) (Ioo 0 ρ₀) := by
  sorry

/-- **Densities exist almost everywhere** (§6.3). If `V` has locally bounded first variation on
`(M, g)`, then `Θ^k(‖V‖, x)` exists and is finite for `‖V‖`-a.e. `x` (Simon1983, 40.5;
AgnolettoCorreaHoyosDaSilvaNardulli2025, Theorem 2.30). -/
theorem ae_hasDensity (hk : 1 ≤ k) (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] (hV : HasLocallyBoundedFirstVariation V) :
    ∀ᵐ x ∂weight V, ∃ θ : ℝ≥0∞, θ ≠ ⊤ ∧ HasDensity (weight V) k x θ := by
  sorry

/-- **Densities under a ratio bound, and their upper semicontinuity** (§6.3). If
`‖δV‖ ≤ Λ ‖V‖` on an open `U` (on every open `U' ⊆ U`), then at every `x ∈ U` the density
`Θ^k(‖V‖, x)` exists, is finite and equals the upper density, and
`Θ^k(‖V‖, x) ≥ lim sup_{y → x} Θ^k(‖V‖, y)` (Simon1983, 17.8 and 40.5;
AgnolettoCorreaHoyosDaSilvaNardulli2025, Corollary 2.27). -/
theorem hasDensity_and_limsup_le_of_firstVariationMass_le (hk : 1 ≤ k)
    (V : Measure (grassmannBundle I M k)) [IsFiniteMeasureOnCompacts V] {U : Set M}
    (hU : IsOpen U) {Λ : ℝ≥0}
    (hΛ : ∀ U' ⊆ U, IsOpen U' → firstVariationMass V U' ≤ Λ * weight V U') {x : M}
    (hx : x ∈ U) :
    upperDensity (weight V) k x ≠ ⊤ ∧ HasDensity (weight V) k x (upperDensity (weight V) k x) ∧
      limsup (upperDensity (weight V) k) (𝓝 x) ≤ upperDensity (weight V) k x := by
  sorry

/-- **The lower density bound on the support** (§6.3). If `Θ^k(‖V‖, ·) ≥ 1` holds `‖V‖`-a.e. and
`‖δV‖ ≤ Λ ‖V‖` on an open `U`, then `Θ^k(‖V‖, x) ≥ 1` at every point `x ∈ U` of the support of
`‖V‖` (Simon1983, 17.9). -/
theorem one_le_upperDensity_of_mem_support (hk : 1 ≤ k) (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] {U : Set M} (hU : IsOpen U) {Λ : ℝ≥0}
    (hΛ : ∀ U' ⊆ U, IsOpen U' → firstVariationMass V U' ≤ Λ * weight V U')
    (hθ : ∀ᵐ y ∂weight V, 1 ≤ upperDensity (weight V) k y) {x : M} (hx : x ∈ U)
    (hxV : x ∈ (weight V).support) : 1 ≤ upperDensity (weight V) k x := by
  sorry

/-- **The constancy theorem** (§6.4). Let `V` be stationary on `(M, g)` with the support of `‖V‖`
inside `Σ = ι(N)`, the image of a `C²` embedding of a connected `k`-manifold `N`. Then
`‖V‖ = θ₀ Hᵏ⌞Σ` for a constant `θ₀ < ∞`, the plane of `V`-a.e. `(x, P)` is the tangent plane
`dι_n(T_nN)` of `Σ` at `x = ι(n)`, and `θ₀ = 0` or `Σ` is closed; that is, `V = 0` or `Σ` is
closed and `V = θ₀[Σ]` (Simon1983, 41.1–41.2). -/
theorem constancy (hk : 1 ≤ k) (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] (hV : IsStationary V)
    {N : Type*} [TopologicalSpace N] [ChartedSpace (EuclideanSpace ℝ (Fin k)) N]
    [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) 2 N] [ConnectedSpace N] {ι : N → M}
    (hι : IsSmoothEmbedding 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I 2 ι)
    (hspt : (weight V).support ⊆ range ι) :
    ∃ θ₀ : ℝ≥0∞, θ₀ ≠ ⊤ ∧ weight V = θ₀ • (μHE[k] : Measure M).restrict (range ι) ∧
      (∀ᵐ p ∂V, ∃ n, ι n = p.1.proj ∧ ∀ v : E, v ∈ Set.range p.1.snd ↔
        v ∈ Set.range (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin k)) I ι n)) ∧
      (θ₀ = 0 ∨ IsClosed (range ι)) := by
  sorry

/-! ## Layer 7: varifold tangents, rectifiability and compactness -/

namespace Euclidean

variable {W : TopologicalSpace.Opens F}

/-- `C ∈ VarTan(V, x)` (§7.2): `C` is a Radon measure on `G_k(F)` and the limit of the dilations
`V_{x,λ_j}` along some `λ_j ↓ 0` (Simon1983, 42.3). -/
def IsVarifoldTangent (V : Measure (W × grassmannian F k)) (x : F)
    (C : Measure ((⊤ : TopologicalSpace.Opens F) × grassmannian F k)) : Prop :=
  IsFiniteMeasureOnCompacts C ∧ ∃ s : ℕ → ℝ, (∀ j, 0 < s j) ∧ Tendsto s atTop (𝓝 0) ∧
    VarifoldTendsto (fun j ↦ blowUp V x (s j)) C

/-- **Existence of varifold tangents** (§7.2). If `Θ^k(‖V‖, x)` exists and is finite at `x ∈ W`,
then every sequence `λ_j ↓ 0` has a subsequence along which `V_{x,λ_j}` converges to a Radon
measure. Only the finiteness of the density is used: it bounds
`‖V_{x,λ}‖(B_R(0)) = λ^{−k}‖V‖(B_{λR}(x))` for small `λ`, and the compactness of Radon measures
under local mass bounds gives the subsequence; no first-variation hypothesis enters (Simon1983,
42.1, with the compactness theorem 4.4). -/
theorem exists_isVarifoldTangent (hk : 1 ≤ k) (V : Measure (W × grassmannian F k))
    [IsFiniteMeasureOnCompacts V] {x : F}
    (hx : x ∈ W) {θ : ℝ≥0∞} (hθ : θ ≠ ⊤) (hdens : HasDensity (weight V) k x θ)
    (s : ℕ → ℝ) (hs : ∀ j, 0 < s j) (hs0 : Tendsto s atTop (𝓝 0)) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ C, IsFiniteMeasureOnCompacts C ∧
      VarifoldTendsto (fun j ↦ blowUp V x (s (φ j))) C := by
  sorry

/-- **Varifold tangents are stationary with conical weight** (§7.2). If `Θ^k(‖V‖, x)` exists and
is finite at `x ∈ W` and `ρ^{1−k}‖δV‖(B_ρ(x)) → 0` as `ρ ↓ 0` (so that `‖δV‖` is finite on small
balls about `x`: `V` has bounded first variation near `x`), then every `C ∈ VarTan(V, x)` is
stationary in `F`, has `‖C‖(B_ρ(0)) = Θ^k(‖V‖, x) ω_k ρ^k` for every `ρ > 0`, and has a
dilation-invariant weight, `‖C‖(λA) = λ^k ‖C‖(A)` (Simon1983, 42.1–42.3). -/
theorem IsVarifoldTangent.isStationary (hk : 1 ≤ k) {V : Measure (W × grassmannian F k)}
    [IsFiniteMeasureOnCompacts V] {x : F}
    (hx : x ∈ W) {θ : ℝ≥0∞} (hθ : θ ≠ ⊤) (hdens : HasDensity (weight V) k x θ)
    (hδ : Tendsto (fun ρ : ℝ ↦ ENNReal.ofReal (ρ ^ (1 - (k : ℤ))) *
      firstVariationMass V (Metric.ball x ρ)) (𝓝[>] 0) (𝓝 0))
    {C : Measure ((⊤ : TopologicalSpace.Opens F) × grassmannian F k)}
    (hC : IsVarifoldTangent V x C) :
    IsStationary C ∧
      (∀ ρ : ℝ, 0 < ρ →
        weight C (Metric.ball 0 ρ) = θ * unitBallVolume k * ENNReal.ofReal ρ ^ k) ∧
      ∀ s : ℝ, 0 < s → ∀ A : Set F, weight C (s • A) = ENNReal.ofReal s ^ k * weight C A := by
  sorry

end Euclidean

/-- **Allard's rectifiability theorem** (§7.3). A varifold on `(M, g)` with locally bounded first
variation whose density `Θ^k(‖V‖, x)` exists and is positive at `‖V‖`-a.e. `x` is rectifiable
(Simon1983, 42.4; Allard1972, Section 5; AgnolettoCorreaHoyosDaSilvaNardulli2025,
Theorem 2.32). -/
theorem isRectifiable_of_ae_density_pos (hk : 1 ≤ k) (V : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V] (hV : HasLocallyBoundedFirstVariation V)
    (hθ : ∀ᵐ x ∂weight V, ∃ θ : ℝ≥0∞, 0 < θ ∧ HasDensity (weight V) k x θ) :
    IsRectifiable V := by
  sorry

/-- **Compactness of rectifiable varifolds** (§7.4, fixed metric). Let `V_i` be rectifiable
varifolds on `(M, g)` with locally bounded first variation, `sup_i (‖V_i‖(U) + ‖δV_i‖(U)) < ∞`
for every open `U` with compact closure, and `Θ^k(‖V_i‖, ·) ≥ 1` `‖V_i‖`-a.e. outside sets `B_i`
with `‖V_i‖(B_i ∩ K) → 0` for compact `K`. Then some subsequence converges to a Radon measure, and
every Radon subsequential limit is rectifiable, has locally bounded first variation and density at
least one almost everywhere, satisfies `‖δV‖(U) ≤ lim inf_j ‖δV_{i_j}‖(U)`, and is stationary when
every `V_i` is (Simon1983, 42.7; Allard1972, Section 6). -/
theorem rectifiable_compactness (hk : 1 ≤ k) (V : ℕ → Measure (grassmannBundle I M k))
    [∀ i, IsFiniteMeasureOnCompacts (V i)] (hrect : ∀ i, IsRectifiable (V i))
    (hbdd : ∀ i, HasLocallyBoundedFirstVariation (V i))
    (hmass : ∀ U : Set M, IsOpen U → IsCompact (closure U) →
      ⨆ i, (weight (V i) U + firstVariationMass (V i) U) < ⊤)
    (B : ℕ → Set M)
    (hB : ∀ K : Set M, IsCompact K → Tendsto (fun i ↦ weight (V i) (B i ∩ K)) atTop (𝓝 0))
    (hθ : ∀ i, ∀ᵐ x ∂weight (V i), x ∉ B i →
      ∃ θ : ℝ≥0∞, 1 ≤ θ ∧ HasDensity (weight (V i)) k x θ) :
    (∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ V' : Measure (grassmannBundle I M k),
      IsFiniteMeasureOnCompacts V' ∧ VarifoldTendsto (fun j ↦ V (φ j)) V') ∧
    ∀ φ : ℕ → ℕ, StrictMono φ → ∀ V' : Measure (grassmannBundle I M k),
      IsFiniteMeasureOnCompacts V' → VarifoldTendsto (fun j ↦ V (φ j)) V' →
      IsRectifiable V' ∧ HasLocallyBoundedFirstVariation V' ∧
      (∀ᵐ x ∂weight V', ∃ θ : ℝ≥0∞, 1 ≤ θ ∧ HasDensity (weight V') k x θ) ∧
      (∀ U : Set M, IsOpen U → IsCompact (closure U) →
        firstVariationMass V' U ≤ liminf (fun j ↦ firstVariationMass (V (φ j)) U) atTop) ∧
      ((∀ i, IsStationary (V i)) → IsStationary V') := by
  sorry

/-- **Allard's integral compactness theorem** (§7.6, fixed metric). If the `V_i` are integral
varifolds on `(M, g)` with locally bounded first variation and
`sup_i (‖V_i‖(U) + ‖δV_i‖(U)) < ∞` for every open `U` with compact closure, then every Radon
subsequential limit is integral (Simon1983, 42.8; Allard1972, Section 6). -/
theorem integral_compactness (hk : 1 ≤ k) (V : ℕ → Measure (grassmannBundle I M k))
    [∀ i, IsFiniteMeasureOnCompacts (V i)] (hint : ∀ i, IsIntegral (V i))
    (hbdd : ∀ i, HasLocallyBoundedFirstVariation (V i))
    (hmass : ∀ U : Set M, IsOpen U → IsCompact (closure U) →
      ⨆ i, (weight (V i) U + firstVariationMass (V i) U) < ⊤)
    (φ : ℕ → ℕ) (hφ : StrictMono φ) (V' : Measure (grassmannBundle I M k))
    [IsFiniteMeasureOnCompacts V'] (hV' : VarifoldTendsto (fun j ↦ V (φ j)) V') :
    IsIntegral V' := by
  sorry

/-! ## Layer 8: tangent cones -/

namespace Euclidean

variable {W : TopologicalSpace.Opens F}

/-- **Rectifiable tangent cones** (§8.1). Under the hypotheses of
`IsVarifoldTangent.isStationary` (a finite density at `x` and `ρ^{1−k}‖δV‖(B_ρ(x)) → 0`), if
moreover `ρ^{−k}‖V‖({y ∈ B_ρ(x) : Θ^{*k}(‖V‖, y) < 1}) → 0`, then every `C ∈ VarTan(V, x)` is
rectifiable and a cone, `(η_{0,λ})_# C = C` for `λ > 0` (Simon1983, 42.6). -/
theorem IsVarifoldTangent.isRectifiable (hk : 1 ≤ k) {V : Measure (W × grassmannian F k)}
    [IsFiniteMeasureOnCompacts V] {x : F}
    (hx : x ∈ W) {θ : ℝ≥0∞} (hθ : θ ≠ ⊤) (hdens : HasDensity (weight V) k x θ)
    (hδ : Tendsto (fun ρ : ℝ ↦ ENNReal.ofReal (ρ ^ (1 - (k : ℤ))) *
      firstVariationMass V (Metric.ball x ρ)) (𝓝[>] 0) (𝓝 0))
    (hlow : Tendsto (fun ρ : ℝ ↦ ENNReal.ofReal (ρ ^ (-(k : ℤ))) *
      weight V ({y | upperDensity (weight V) k y < 1} ∩ Metric.ball x ρ)) (𝓝[>] 0) (𝓝 0))
    {C : Measure ((⊤ : TopologicalSpace.Opens F) × grassmannian F k)}
    (hC : IsVarifoldTangent V x C) :
    IsRectifiable C ∧ ∀ s : ℝ, 0 < s → blowUp C 0 s = C := by
  sorry

/-- **Integral tangent cones** (§8.2). If `V` is integral and satisfies the hypotheses of
`IsVarifoldTangent.isStationary` at `x` (a finite density at `x` and
`ρ^{1−k}‖δV‖(B_ρ(x)) → 0`), every `C ∈ VarTan(V, x)` is an integral, stationary cone
(Simon1983, 42.6 and 42.8). -/
theorem IsVarifoldTangent.isIntegral (hk : 1 ≤ k) {V : Measure (W × grassmannian F k)}
    [IsFiniteMeasureOnCompacts V] (hint : IsIntegral V)
    {x : F} (hx : x ∈ W) {θ : ℝ≥0∞} (hθ : θ ≠ ⊤) (hdens : HasDensity (weight V) k x θ)
    (hδ : Tendsto (fun ρ : ℝ ↦ ENNReal.ofReal (ρ ^ (1 - (k : ℤ))) *
      firstVariationMass V (Metric.ball x ρ)) (𝓝[>] 0) (𝓝 0))
    {C : Measure ((⊤ : TopologicalSpace.Opens F) × grassmannian F k)}
    (hC : IsVarifoldTangent V x C) :
    IsIntegral C ∧ IsStationary C ∧ ∀ s : ℝ, 0 < s → blowUp C 0 s = C := by
  sorry

end Euclidean

end TauCetiRoadmap.Varifolds
