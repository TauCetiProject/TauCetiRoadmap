module

import Mathlib
import TauCeti.Analysis.Sobolev.WeakDeriv.Basic

/-!
# Quasiregular maps: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions they need. The README carries every target, API list and Check.

Stated here, on Euclidean domains, which is the setting of Martio, Rickman and Väisälä:

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

Not statable at the pins. Each of the following is a statement about quasiregular maps between
oriented Riemannian manifolds, or into one, and needs the continuous Sobolev class
`W^{1,n}_loc(M, N)` of maps between manifolds with its weak differential `Df`, its operator norm
`‖Df‖` and its oriented Jacobian `J_f`. Neither Mathlib nor Tau Ceti has that class at the pins
(Tau Ceti's Sobolev spaces are Euclidean, and its manifold Sobolev inequality is for scalar
`C¹` functions); the README consumes it from SobolevMapsBetweenManifolds.

* the comparison `K_I(f) ≤ K_O(f)^{n−1}`, `K_O(f) ≤ K_I(f)^{n−1}` for quasiregular maps
  between manifolds (README §3.2);
* a non-degenerate orientation-preserving simplicial map of `C¹`-triangulated manifolds with
  bounded simplexwise distortion is quasiregular, with its outer distortion computed simplex by
  simplex (README §6.4);
* quasiregular ellipticity of a closed connected orientable manifold is independent of the
  metric and of the orientation (README §7.2–§7.3);
* every closed orientable flat manifold is `1`-quasiregularly elliptic (README §7.6);
* a connected oriented Riemannian manifold that receives a non-degenerate orientation-preserving
  simplicial map from a flat torus is quasiregularly elliptic (README §7.7).
-/

noncomputable section

open MeasureTheory Module TopologicalSpace
open scoped ENNReal

namespace TauCetiRoadmap.QuasiregularMaps

/-! ## Layer 1: linear distortion -/

/-- The **minimal stretch** `ℓ(A)` of a linear map `A : V → W` between finite-dimensional real
inner product spaces: the smallest of the `n = dim V` singular values, Mathlib's
`LinearMap.singularValues` at the zero-based index `n − 1`. For `V ≠ 0` it is the minimum of
`|A v|` over unit vectors `v`, the quantity `ℓ(T)` of MartioRickmanVaisala1969 line 127; for
`V = 0` the index is `0` and the value is `0`. -/
def minimalStretch {V W : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
    [FiniteDimensional ℝ V] [NormedAddCommGroup W] [InnerProductSpace ℝ W]
    [FiniteDimensional ℝ W] (A : V →ₗ[ℝ] W) : ℝ :=
  A.singularValues (finrank ℝ V - 1)

/-! ## Layer 2: quasiregular maps and the outer distortion -/

/-- **`K`-quasiregular maps of a Euclidean domain** (README §2.9). Let `E` be a
finite-dimensional real inner product space of dimension `n` with Lebesgue measure and `Ω ⊆ E`
open. A map `f` is `K`-quasiregular on `Ω` when `1 ≤ K`, `f` is continuous on `Ω`, and `f` has a
weak derivative `Du` on `Ω` with `‖Du‖ⁿ` locally integrable on `Ω` and
`‖Du(x)‖ⁿ ≤ K · det Du(x)` for almost every `x ∈ Ω`. The norm is the operator norm. This is the
definition of HeikkilaPankka2025 lines 22–27 and Prywes2019 lines 22–26 on the flat oriented
manifold `Ω`, and MartioRickmanVaisala1969 Definition 2.20 (lines 409–412) with `W^{1,n}_loc` in
place of `ACLⁿ`
(`isQuasiregularOn_iff_isACLpOn`). -/
def IsQuasiregularOn {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (K : ℝ) (Ω : Opens E) (f : E → E) : Prop :=
  1 ≤ K ∧ ContinuousOn f Ω ∧
    ∃ Du : E → E →L[ℝ] E, TauCeti.HasWeakFDerivOn volume Ω f Du ∧
      LocallyIntegrableOn (fun x => ‖Du x‖ ^ finrank ℝ E) Ω volume ∧
      ∀ᵐ x ∂volume.restrict (Ω : Set E),
        ‖Du x‖ ^ finrank ℝ E ≤ K * LinearMap.det (Du x : E →ₗ[ℝ] E)

/-! ## Layer 3: inner, maximal and Hilbert–Schmidt distortion -/

/-- **Outer distortion bounds inner distortion** (MartioRickmanVaisala1969 (2.25),
line 438, second inequality, `K_I(f) ≤ K_O(f)^{n−1}`; README §3.2, Euclidean form). If `f` is `K`-quasiregular on
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
line 438, first inequality, `K_O(f) ≤ K_I(f)^{n−1}`; README §3.2, Euclidean form). If `f` is quasiregular on
`Ω ⊆ E`, `n = dim E`, `1 ≤ K`, and some weak derivative `Du` of `f` on `Ω` satisfies the inner
inequality `det Du(x) ≤ K ℓ(Du(x))ⁿ` almost everywhere on `Ω`, then `f` is
`K^{n−1}`-quasiregular on `Ω`. The quasiregularity of `f` is needed: the projection
`(x₁, …, xₙ) ↦ (x₁, …, x_{n−1}, 0)` satisfies the inner inequality with `K = 1` and is not
quasiregular (MartioRickmanVaisala1969 lines 423–425). -/
theorem IsQuasiregularOn.of_det_le_mul_minimalStretch_pow {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {K K' : ℝ} {Ω : Opens E} {f : E → E} (hf : IsQuasiregularOn K' Ω f) (hK : 1 ≤ K)
    {Du : E → E →L[ℝ] E} (hDu : TauCeti.HasWeakFDerivOn volume Ω f Du)
    (hI : ∀ᵐ x ∂volume.restrict (Ω : Set E),
      LinearMap.det (Du x : E →ₗ[ℝ] E) ≤ K * minimalStretch (Du x : E →ₗ[ℝ] E) ^ finrank ℝ E) :
    IsQuasiregularOn (K ^ (finrank ℝ E - 1)) Ω f := by
  sorry

/-! ## Layer 5: `ACL^p` maps and the classical definition -/

/-- The **formal derivative** of `u : ℝⁿ → F` at `x` (MartioRickmanVaisala1969 lines 118–121):
the linear map sending the `i`-th standard basis vector `eᵢ` to the
partial derivative `∂ᵢu(x)`, Mathlib's `lineDeriv ℝ u x eᵢ`. Where a partial derivative does not
exist, `lineDeriv` is `0`; for an `ACL` map this happens only on a null set. -/
def formalDeriv {n : ℕ} {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (u : EuclideanSpace ℝ (Fin n) → F) (x : EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin n) →L[ℝ] F :=
  LinearMap.toContinuousLinearMap <|
    (EuclideanSpace.basisFun (Fin n) ℝ).toBasis.constr ℝ fun i =>
      lineDeriv ℝ u x (EuclideanSpace.single i (1 : ℝ))

/-- **`ACL` maps** (MartioRickmanVaisala1969 Definition 2.16, lines 332–340; README §5.1). A
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

/-- **`ACL^p` maps** (MartioRickmanVaisala1969 Definition 2.16, lines 339–340; README §5.1). An `ACL`
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
`Ω ⊆ ℝⁿ` and `Du` is a weak derivative of `u` on `Ω`, then for almost every `x ∈ Ω` and every
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
(2.21), lines 409–411; README §5.3). For an open `G ⊆ ℝⁿ`, `f : ℝⁿ → ℝⁿ` and `1 ≤ K`, `f` is
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

end TauCetiRoadmap.QuasiregularMaps
