module

import Mathlib
import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
import TauCetiRoadmap.SobolevMapsBetweenManifolds.Suggested

/-!
# Quasiregular maps: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's two central
definitions and those of its headline theorems that are statable against the pinned Mathlib and
Tau Ceti and the target signatures of SobolevMapsBetweenManifolds, each with `sorry`, together
with the few definitions they need. The README carries every target, API list and Check.

Stated here, on Euclidean domains, which is the setting of Martio, Rickman and Väisälä, against
Mathlib and Tau Ceti alone:

* the sharp comparison of inner and outer distortion, `K_I ≤ K_O^{n−1}` and `K_O ≤ K_I^{n−1}`
  (Martio–Rickman–Väisälä (2.25); README §3.2, Euclidean form), as
  `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow` and
  `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow`;
* a continuous map of a Euclidean domain is `ACL^p` if and only if it has a weak derivative that
  is locally `L^p`, and a weak derivative of a continuous map is, almost everywhere, its derivative
  along the coordinate lines (README §5.2), as `isACLpOn_iff_exists_hasWeakFDerivOn` and
  `ae_hasLineDerivAt_of_hasWeakFDerivOn`;
* the agreement of the Sobolev definition of a `K`-quasiregular map with Definition 2.20 of
  Martio–Rickman–Väisälä (README §5.3), as `isQuasiregularOn_iff_isACLpOn`.

Stated here, between oriented Riemannian manifolds. Neither Mathlib nor Tau Ceti has, at the
pins, the continuous Sobolev class `W^{1,n}_loc(M, N)` of maps between manifolds, its weak
differential `Df` or its oriented Jacobian `J_f` (Tau Ceti's Sobolev spaces are Euclidean, and
its manifold Sobolev inequality is for scalar `C¹` functions). The README consumes them from
SobolevMapsBetweenManifolds, and this file imports that roadmap's target signatures
`IsSobolevMap`, `HasWeakMFDeriv` and `orientedJacobian`, with its instance setup: tangent spaces
of dimension `n` through `Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)`, continuous metrics
through `Bundle.RiemannianBundle` and `IsContinuousRiemannianBundle`.

* `K`-quasiregular maps (README §2.1), as `IsQuasiregularMap`;
* the outer distortion quotient of a linear map (README §1.2) and the outer distortion of a map
  (README §2.2), as `outerQuotient` and `outerDistortion`, with the attainment of the outer
  distortion (README §2.3), as `isQuasiregularMap_iff_outerDistortion_le`;
* the comparison `K_I(f) ≤ K_O(f)^{n−1}`, `K_O(f) ≤ K_I(f)^{n−1}` for quasiregular maps between
  manifolds (README §3.2), through the inequalities that define the two distortions, as
  `IsQuasiregularMap.orientedJacobian_le_pow_mul_minimalStretch_pow` and
  `IsQuasiregularMap.of_orientedJacobian_le_mul_minimalStretch_pow`;
* `K`-quasiregularly elliptic and quasiregularly elliptic manifolds (README §7.1), as
  `IsQuasiregularlyEllipticWith` and `IsQuasiregularlyElliptic`, and the independence of the
  orientation (README §7.2), as `isQuasiregularlyEllipticWith_neg`.

Not stated here. The README specifies each of the following. Like the statements above, each
needs the Sobolev class of maps between manifolds, which the pins lack and this file takes from
the imported signatures. Each also needs carriers that the pins have and that the definitions
above do not use: Tau Ceti's smooth triangulations `TauCeti.IsSmoothTriangulation` with
simplicial maps and their realizations (§6.4, §7.7), Tau Ceti's copy `TauCeti.WithMetric` of a
manifold carrying a second metric (§7.3), and Mathlib's
`CovariantDerivative.leviCivitaConnection` with Tau Ceti's
`CovariantDerivative.HasConstantSectionalCurvature` for flatness (§7.6). This file builds on the
imported signatures only the definitions above and the statements that need no further carrier,
and nothing is stated in place of these:

* a non-degenerate orientation-preserving simplicial map of `C¹`-triangulated manifolds with
  bounded simplexwise distortion is quasiregular, with its outer distortion computed simplex by
  simplex (README §6.4);
* quasiregular ellipticity of a closed connected orientable manifold is independent of the
  metric (README §7.3);
* every closed orientable flat manifold is `1`-quasiregularly elliptic (README §7.6);
* a connected oriented Riemannian manifold that receives a non-degenerate orientation-preserving
  simplicial map from a flat torus is quasiregularly elliptic (README §7.7).
-/

noncomputable section

open MeasureTheory Module TopologicalSpace
open scoped ENNReal Manifold

namespace TauCetiRoadmap.QuasiregularMaps

open TauCetiRoadmap.SobolevMapsBetweenManifolds

/-! ## Layer 1: linear distortion -/

/-- The **minimal stretch** `ℓ(A)` of a linear map `A : V → W` between finite-dimensional real
inner product spaces: the smallest of the `n = dim V` singular values, Mathlib's
`LinearMap.singularValues` at the zero-based index `n − 1`. For `V ≠ 0` it is the minimum of
`|A v|` over unit vectors `v`, the quantity `ℓ(T)` of MartioRickmanVaisala1969 2.1, p. 7; for
`V = 0` the index is `0` and the value is `0`. -/
def minimalStretch {V W : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
    [FiniteDimensional ℝ V] [NormedAddCommGroup W] [InnerProductSpace ℝ W]
    [FiniteDimensional ℝ W] (A : V →ₗ[ℝ] W) : ℝ :=
  A.singularValues (finrank ℝ V - 1)

open Classical in
/-- The **outer distortion quotient** `q_O(A) ∈ [0, ∞]` of a linear map `A : V → W` between
oriented inner product spaces of one dimension `n` (README §1.2), with the oriented Jacobian
`J(A)` of SobolevMapsBetweenManifolds §6.1: `‖A‖ⁿ / J(A)` when `J(A) > 0`, `0` when `A = 0`, and
`∞` when `A ≠ 0` and `J(A) ≤ 0`. The norm is the operator norm. In dimension `n ≥ 1` the zero
map has `J = 0`, so the three cases are exclusive; the first is tested first. -/
def outerQuotient {V W : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
    [FiniteDimensional ℝ V] [NormedAddCommGroup W] [InnerProductSpace ℝ W]
    [FiniteDimensional ℝ W] {n : ℕ} [Fact (finrank ℝ V = n)] [Fact (finrank ℝ W = n)]
    (oV : Orientation ℝ V (Fin n)) (oW : Orientation ℝ W (Fin n)) (A : V →L[ℝ] W) : ℝ≥0∞ :=
  if 0 < orientedJacobian oV oW (A : V →ₗ[ℝ] W) then
    ENNReal.ofReal (‖A‖ ^ n / orientedJacobian oV oW (A : V →ₗ[ℝ] W))
  else if A = 0 then 0 else ⊤

/-! ## Layer 2: quasiregular maps and the outer distortion -/

/-- **`K`-quasiregular maps of a Euclidean domain** (README §2.9). Let `E` be a
finite-dimensional real inner product space of dimension `n` with Lebesgue measure and `Ω ⊆ E`
open. A map `f` is `K`-quasiregular on `Ω` when `1 ≤ K`, `f` is continuous on `Ω`, and `f` has a
weak derivative `Du` on `Ω` with `‖Du‖ⁿ` locally integrable on `Ω` and
`‖Du(x)‖ⁿ ≤ K · det Du(x)` for almost every `x ∈ Ω`. The norm is the operator norm. This is the
definition of HeikkilaPankka2025 §1, p. 1, and Prywes2019 §1, p. 1, on the flat oriented
manifold `Ω`, and MartioRickmanVaisala1969 Definition 2.20 with `W^{1,n}_loc` in place of `ACLⁿ`
(`isQuasiregularOn_iff_isACLpOn`). -/
def IsQuasiregularOn {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (K : ℝ) (Ω : Opens E) (f : E → E) : Prop :=
  1 ≤ K ∧ ContinuousOn f Ω ∧
    ∃ Du : E → E →L[ℝ] E, TauCeti.HasWeakFDerivOn volume Ω f Du ∧
      LocallyIntegrableOn (fun x => ‖Du x‖ ^ finrank ℝ E) Ω volume ∧
      ∀ᵐ x ∂volume.restrict (Ω : Set E),
        ‖Du x‖ ^ finrank ℝ E ≤ K * LinearMap.det (Du x : E →ₗ[ℝ] E)

section Manifold

open Bundle

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) 1 M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') 1 N]

/-- **`K`-quasiregular maps between oriented Riemannian manifolds** (README §2.1). Let `M` and
`N` be manifolds of one dimension `n` with continuous Riemannian metrics and orientations `oM`,
`oN`. A map `f : M → N` is `K`-quasiregular when `1 ≤ K`, `f` is in the continuous Sobolev class
`W^{1,n}_loc(M, N)` (`IsSobolevMap`, which includes continuity), and some weak differential `Df`
of `f` (`HasWeakMFDeriv`) satisfies `‖Df(x)‖ⁿ ≤ K · J(Df(x))` for almost every `x`, for the
Riemannian volume of `M`. The norm is the operator norm for the two metrics and `J` is the
oriented Jacobian for the tangent orientations. Two weak differentials of a continuous map
differ on a null set (`HasWeakMFDeriv.ae_eq`), so "some" may be replaced by "every". -/
def IsQuasiregularMap
    [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
    [T2Space M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ x : M, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)]
    [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (K : ℝ) (oM : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n))
    (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)) (f : M → N) : Prop :=
  1 ≤ K ∧ IsSobolevMap E E' n f ∧
    ∃ Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x),
      HasWeakMFDeriv E E' f Df ∧
        ∀ᵐ x ∂TauCeti.riemannianVolume 𝓘(ℝ, E) M,
          ‖Df x‖ ^ n ≤ K * orientedJacobian (oM.orientationAt x) (oN.orientationAt (f x))
            (Df x : TangentSpace 𝓘(ℝ, E) x →ₗ[ℝ] TangentSpace 𝓘(ℝ, E') (f x))

/-- The **outer distortion** `K_O(f) ∈ [1, ∞]` of a map between oriented Riemannian manifolds of
one dimension `n` (README §2.2). For `f` in the continuous Sobolev class `W^{1,n}_loc(M, N)` it
is `max(1, ess sup_x q_O(Df(x)))`, the essential supremum for the Riemannian volume of `M` of
the outer distortion quotient of a weak differential `Df`; for every other map it is `∞`. The
infimum runs over the weak differentials of `f`. They agree off a null set, so all give one
value, and the infimum over none is `∞`. -/
def outerDistortion
    [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
    [T2Space M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ x : M, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)]
    [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (oM : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n))
    (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)) (f : M → N) : ℝ≥0∞ :=
  ⨅ (_ : IsSobolevMap E E' n f)
    (Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x))
    (_ : HasWeakMFDeriv E E' f Df),
    max 1 (essSup (fun x => outerQuotient (oM.orientationAt x) (oN.orientationAt (f x)) (Df x))
      (TauCeti.riemannianVolume 𝓘(ℝ, E) M))

/-- **Attainment of the outer distortion** (README §2.3). For `n ≥ 1` and every map `f : M → N`,
the real numbers `K` for which `f` is `K`-quasiregular are exactly those with `1 ≤ K` and
`K_O(f) ≤ K`. Off the continuous Sobolev class `W^{1,n}_loc(M, N)` both sets are empty, since
`K_O(f) = ∞` there. So `f` is quasiregular if and only if `K_O(f) < ∞`, and then it is
`K_O(f)`-quasiregular. In dimension `0`, which the roadmap excludes, the identity of a point with
opposite orientations has `Df = 0`, `q_O = 0` and `J = −1`, and the statement fails. -/
theorem isQuasiregularMap_iff_outerDistortion_le
    [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
    [T2Space M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ x : M, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)]
    [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (hn : n ≠ 0) (oM : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n))
    (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)) {f : M → N} (K : ℝ) :
    IsQuasiregularMap K oM oN f ↔ 1 ≤ K ∧ outerDistortion oM oN f ≤ ENNReal.ofReal K := by
  sorry

end Manifold

/-! ## Layer 3: inner, maximal and Hilbert–Schmidt distortion -/

/-- **Outer distortion bounds inner distortion** (MartioRickmanVaisala1969 (2.25),
second inequality, `K_I(f) ≤ K_O(f)^{n−1}`; README §3.2, Euclidean form). If `f` is
`K`-quasiregular on
`Ω ⊆ E`, `n = dim E`, then for every weak derivative `Du` of `f` on `Ω`,
`det Du(x) ≤ K^{n−1} ℓ(Du(x))ⁿ` for almost every `x ∈ Ω`. -/
theorem IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {K : ℝ} {Ω : Opens E} {f : E → E} (hf : IsQuasiregularOn K Ω f)
    {Du : E → E →L[ℝ] E} (hDu : TauCeti.HasWeakFDerivOn volume Ω f Du) :
    ∀ᵐ x ∂volume.restrict (Ω : Set E),
      LinearMap.det (Du x : E →ₗ[ℝ] E) ≤
        K ^ (finrank ℝ E - 1) * minimalStretch (Du x : E →ₗ[ℝ] E) ^ finrank ℝ E := by
  sorry

/-- **Inner distortion bounds outer distortion** (MartioRickmanVaisala1969 (2.25),
first inequality, `K_O(f) ≤ K_I(f)^{n−1}`; README §3.2, Euclidean form). If `f` is quasiregular on
`Ω ⊆ E`, `n = dim E`, `1 ≤ K`, and some weak derivative `Du` of `f` on `Ω` satisfies the inner
inequality `det Du(x) ≤ K ℓ(Du(x))ⁿ` almost everywhere on `Ω`, then `f` is
`K^{n−1}`-quasiregular on `Ω`. The quasiregularity of `f` is needed: the projection
`(x₁, …, xₙ) ↦ (x₁, …, x_{n−1}, 0)` satisfies the inner inequality with `K = 1` and is not
quasiregular (MartioRickmanVaisala1969 2.20, p. 14). -/
theorem IsQuasiregularOn.of_det_le_mul_minimalStretch_pow {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {K K' : ℝ} {Ω : Opens E} {f : E → E} (hf : IsQuasiregularOn K' Ω f) (hK : 1 ≤ K)
    {Du : E → E →L[ℝ] E} (hDu : TauCeti.HasWeakFDerivOn volume Ω f Du)
    (hI : ∀ᵐ x ∂volume.restrict (Ω : Set E),
      LinearMap.det (Du x : E →ₗ[ℝ] E) ≤ K * minimalStretch (Du x : E →ₗ[ℝ] E) ^ finrank ℝ E) :
    IsQuasiregularOn (K ^ (finrank ℝ E - 1)) Ω f := by
  sorry

section Manifold

open Bundle

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) 1 M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') 1 N]

/-- **Outer distortion bounds inner distortion, between manifolds** (README §3.2,
`K_I(f) ≤ K_O(f)^{n−1}`). If `f : M → N` is `K`-quasiregular, then every weak differential `Df`
of `f` satisfies `J(Df(x)) ≤ K^{n−1} ℓ(Df(x))ⁿ` for almost every `x`, the inner inequality with
constant `K^{n−1}`. -/
theorem IsQuasiregularMap.orientedJacobian_le_pow_mul_minimalStretch_pow
    [T2Space M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ x : M, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)]
    [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    {K : ℝ} {oM : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n)}
    {oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)} {f : M → N}
    (hf : IsQuasiregularMap K oM oN f)
    {Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hDf : HasWeakMFDeriv E E' f Df) :
    ∀ᵐ x ∂TauCeti.riemannianVolume 𝓘(ℝ, E) M,
      orientedJacobian (oM.orientationAt x) (oN.orientationAt (f x))
          (Df x : TangentSpace 𝓘(ℝ, E) x →ₗ[ℝ] TangentSpace 𝓘(ℝ, E') (f x)) ≤
        K ^ (n - 1) * minimalStretch
          (Df x : TangentSpace 𝓘(ℝ, E) x →ₗ[ℝ] TangentSpace 𝓘(ℝ, E') (f x)) ^ n := by
  sorry

/-- **Inner distortion bounds outer distortion, between manifolds** (README §3.2,
`K_O(f) ≤ K_I(f)^{n−1}`). If `f : M → N` is quasiregular, `1 ≤ K`, and some weak differential
`Df` of `f` satisfies the inner inequality `J(Df(x)) ≤ K ℓ(Df(x))ⁿ` for almost every `x`, then
`f` is `K^{n−1}`-quasiregular. The quasiregularity of `f` cannot be dropped (README §3.3). -/
theorem IsQuasiregularMap.of_orientedJacobian_le_mul_minimalStretch_pow
    [T2Space M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ x : M, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)]
    [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    {K K' : ℝ} {oM : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n)}
    {oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)} {f : M → N}
    (hf : IsQuasiregularMap K' oM oN f) (hK : 1 ≤ K)
    {Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hDf : HasWeakMFDeriv E E' f Df)
    (hI : ∀ᵐ x ∂TauCeti.riemannianVolume 𝓘(ℝ, E) M,
      orientedJacobian (oM.orientationAt x) (oN.orientationAt (f x))
          (Df x : TangentSpace 𝓘(ℝ, E) x →ₗ[ℝ] TangentSpace 𝓘(ℝ, E') (f x)) ≤
        K * minimalStretch
          (Df x : TangentSpace 𝓘(ℝ, E) x →ₗ[ℝ] TangentSpace 𝓘(ℝ, E') (f x)) ^ n) :
    IsQuasiregularMap (K ^ (n - 1)) oM oN f := by
  sorry

end Manifold

/-! ## Layer 5: `ACL^p` maps and the classical definition -/

/-- The **formal derivative** of `u : ℝⁿ → F` at `x` (MartioRickmanVaisala1969 2.1, p. 7):
the linear map sending the `i`-th standard basis vector `eᵢ` to the
partial derivative `∂ᵢu(x)`, Mathlib's `lineDeriv ℝ u x eᵢ`. Where a partial derivative does not
exist, `lineDeriv` is `0`; for an `ACL` map into finite-dimensional `F`, this happens only
on a null set. -/
def formalDeriv {n : ℕ} {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (u : EuclideanSpace ℝ (Fin n) → F) (x : EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin n) →L[ℝ] F :=
  LinearMap.toContinuousLinearMap <|
    (EuclideanSpace.basisFun (Fin n) ℝ).toBasis.constr ℝ fun i =>
      lineDeriv ℝ u x (EuclideanSpace.single i (1 : ℝ))

/-- **`ACL` maps** (MartioRickmanVaisala1969 Definition 2.16; README §5.1). A
map `u : ℝⁿ → F` is `ACL` on the open set `Ω` when it is continuous on `Ω` and, for every closed
coordinate box `Q = Π_j [a_j, b_j] ⊆ Ω` with `a_j < b_j` and every coordinate `i`, for almost
every `x ∈ Q` the function `t ↦ u(x + (t − xᵢ) eᵢ)`, the restriction of `u` to the segment of `Q`
through `x` parallel to the `i`-th axis, is absolutely continuous on `[aᵢ, bᵢ]`. By Fubini, this
is the condition of the source that the exceptional segments have `(n − 1)`-dimensional measure
zero. -/
def IsACLOn {n : ℕ} {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (Ω : Opens (EuclideanSpace ℝ (Fin n))) (u : EuclideanSpace ℝ (Fin n) → F) : Prop :=
  ContinuousOn u Ω ∧
    ∀ a b : Fin n → ℝ, (∀ j, a j < b j) →
      {x : EuclideanSpace ℝ (Fin n) | ∀ j, a j ≤ x j ∧ x j ≤ b j} ⊆ Ω →
      ∀ i : Fin n,
        ∀ᵐ x ∂volume.restrict {x : EuclideanSpace ℝ (Fin n) | ∀ j, a j ≤ x j ∧ x j ≤ b j},
          AbsolutelyContinuousOnInterval
            (fun t : ℝ => u (x + (t - x i) • EuclideanSpace.single i (1 : ℝ))) (a i) (b i)

/-- **`ACL^p` maps** (MartioRickmanVaisala1969 Definition 2.16; README §5.1). An `ACL`
map is `ACL^p` on `Ω` when its formal derivative, equivalently each of its partial derivatives,
lies in `L^p` on every compact subset of `Ω`. -/
def IsACLpOn {n : ℕ} {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (p : ℝ≥0∞) (Ω : Opens (EuclideanSpace ℝ (Fin n))) (u : EuclideanSpace ℝ (Fin n) → F) :
    Prop :=
  IsACLOn Ω u ∧
    ∀ C : Set (EuclideanSpace ℝ (Fin n)), IsCompact C → C ⊆ Ω →
      MemLp (formalDeriv u) p (volume.restrict C)

/-- **`ACL^p` maps are the continuous Sobolev maps** (Vaisala1971 Ch. 3; Rickman1993 Ch. I;
README §5.2). For `1 ≤ p ≤ ∞`, an open `Ω ⊆ ℝⁿ`, a finite-dimensional real normed space `F` and
`u` continuous on `Ω`: `u` is `ACL^p` on `Ω` if and only if `u` has a weak derivative `Du` on `Ω`
that lies in `L^p` on every compact subset of `Ω`. -/
theorem isACLpOn_iff_exists_hasWeakFDerivOn {n : ℕ} {F : Type*} [NormedAddCommGroup F]
    [NormedSpace ℝ F] [FiniteDimensional ℝ F] {p : ℝ≥0∞} (hp : 1 ≤ p)
    {Ω : Opens (EuclideanSpace ℝ (Fin n))} {u : EuclideanSpace ℝ (Fin n) → F}
    (hu : ContinuousOn u Ω) :
    IsACLpOn p Ω u ↔
      ∃ Du : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n) →L[ℝ] F,
        TauCeti.HasWeakFDerivOn volume Ω u Du ∧
          ∀ C : Set (EuclideanSpace ℝ (Fin n)), IsCompact C → C ⊆ Ω →
            MemLp Du p (volume.restrict C) := by
  sorry

/-- **The weak derivative of a continuous map is its derivative along coordinate lines**
(Vaisala1971 Ch. 3; Rickman1993 Ch. I; README §5.2). If `u` is continuous on the open set
`Ω ⊆ ℝⁿ`, with finite-dimensional real normed target `F`, and `Du` is a weak derivative of `u`
on `Ω`, then for almost every `x ∈ Ω` and every
coordinate `i` the partial derivative `∂ᵢu(x)` exists and equals `Du(x) eᵢ`. In particular `Du`
agrees almost everywhere on `Ω` with the formal derivative `formalDeriv u`. -/
theorem ae_hasLineDerivAt_of_hasWeakFDerivOn {n : ℕ} {F : Type*} [NormedAddCommGroup F]
    [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    {Ω : Opens (EuclideanSpace ℝ (Fin n))} {u : EuclideanSpace ℝ (Fin n) → F}
    {Du : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n) →L[ℝ] F}
    (hu : ContinuousOn u Ω) (hDu : TauCeti.HasWeakFDerivOn volume Ω u Du) :
    ∀ᵐ x ∂volume.restrict (Ω : Set (EuclideanSpace ℝ (Fin n))), ∀ i : Fin n,
      HasLineDerivAt ℝ u (Du x (EuclideanSpace.single i (1 : ℝ))) x
        (EuclideanSpace.single i (1 : ℝ)) := by
  sorry

/-- **Agreement with Martio–Rickman–Väisälä** (MartioRickmanVaisala1969 Definition 2.20 and
(2.21); README §5.3). For an open `G ⊆ ℝⁿ`, `f : ℝⁿ → ℝⁿ` and `1 ≤ K`, `f` is
`K`-quasiregular on `G` in the Sobolev sense if and only if `f` is `ACLⁿ` on `G` and its formal
derivative satisfies `‖f'(x)‖ⁿ ≤ K · det f'(x)` for almost every `x ∈ G`. -/
theorem isQuasiregularOn_iff_isACLpOn {n : ℕ} {K : ℝ} (hK : 1 ≤ K)
    {G : Opens (EuclideanSpace ℝ (Fin n))} {f : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n)} :
    IsQuasiregularOn K G f ↔
      IsACLpOn n G f ∧
        ∀ᵐ x ∂volume.restrict (G : Set (EuclideanSpace ℝ (Fin n))),
          ‖formalDeriv f x‖ ^ n ≤
            K * LinearMap.det (formalDeriv f x : EuclideanSpace ℝ (Fin n) →ₗ[ℝ] _) := by
  sorry

/-! ## Layer 7: quasiregularly elliptic manifolds -/

section Elliptic

open Bundle

variable {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') 1 N]

/-- **`K`-quasiregularly elliptic manifolds** (README §7.1). An oriented Riemannian
`n`-manifold `N` is `K`-quasiregularly elliptic when there is a non-constant `K`-quasiregular
map `ℝⁿ → N`. Here `ℝⁿ` is `EuclideanSpace ℝ (Fin n)` with its flat metric (Mathlib's
`riemannianMetricVectorSpace`, whose continuity is supplied as an instance in the body), Lebesgue
measure and the orientation of its standard basis, made a manifold orientation by
`TauCeti.Manifold.Orientation.model`. The roadmap applies the notion to connected `N`. -/
def IsQuasiregularlyEllipticWith
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (K : ℝ) (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)) : Prop :=
  haveI : ∀ x : EuclideanSpace ℝ (Fin n),
      Fact (finrank ℝ (TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) = n) :=
    fun _ => ⟨finrank_euclideanSpace_fin⟩
  haveI : IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin n))
      (fun x : EuclideanSpace ℝ (Fin n) ↦ TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) :=
    Bundle.instIsContinuousRiemannianBundle
      (riemannianMetricVectorSpace (EuclideanSpace ℝ (Fin n))).toContinuousRiemannianMetric
  ∃ f : EuclideanSpace ℝ (Fin n) → N, (¬ ∃ y, ∀ x, f x = y) ∧
    IsQuasiregularMap K
      (TauCeti.Manifold.Orientation.model (I := 𝓘(ℝ, EuclideanSpace ℝ (Fin n)))
        (EuclideanSpace.basisFun (Fin n) ℝ).toBasis.orientation (by simp)) oN f

/-- **Quasiregularly elliptic manifolds** (README §7.1): `K`-quasiregularly elliptic for some
`K`. -/
def IsQuasiregularlyElliptic
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)) : Prop :=
  ∃ K : ℝ, IsQuasiregularlyEllipticWith K oN

/-- **Quasiregular ellipticity does not depend on the orientation** (README §7.2). `N` is
`K`-quasiregularly elliptic for the orientation `−oN` if and only if it is for `oN`, with the
same `K`: precompose a witness with a reflection of `ℝⁿ`. -/
theorem isQuasiregularlyEllipticWith_neg
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (K : ℝ) (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n)) :
    IsQuasiregularlyEllipticWith K (-oN) ↔ IsQuasiregularlyEllipticWith K oN := by
  sorry

end Elliptic

end TauCetiRoadmap.QuasiregularMaps
