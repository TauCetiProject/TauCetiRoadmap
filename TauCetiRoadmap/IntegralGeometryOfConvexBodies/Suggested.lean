module

public import Mathlib
public import TauCeti.Geometry.Euclidean.Volume.OrthogonalGroup
public import TauCeti.LinearAlgebra.OrthogonalGroup
public import TauCeti.Geometry.Euclidean.Volume.Parallel
public import TauCeti.Analysis.BoundedVariation.ParallelVolume

/-!
# Integral geometry of convex bodies: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The bullets of the README without a
Lean name are definitions given in prose, results supplied by Tau Ceti or by other roadmaps, or
facts about a single definition that follow in one step from it; they are targets of the same
standing, stated in prose.

The conventions of the README are used throughout. The ambient space is `Eucl d`, Mathlib's
`EuclideanSpace ℝ (Fin d)`. Convex bodies are sets with explicit `IsCompact` and `Convex ℝ`
hypotheses, and nonemptiness is a separate hypothesis, so that intersections, which may be
empty, need no case split; Mathlib's `ConvexBody` carries the Hausdorff metric. Functionals are
defined on all sets. Rotations are orthogonal matrices acting through Tau Ceti's
`TauCeti.orthogonalGroupToLinearIsometryEquiv`, and the rotation-invariant probability is Tau
Ceti's Euclidean Haar measure `TauCeti.orthogonalGroupMeasure` divided by its mass. Affine
`k`-flats are parametrized as `ϑ (L₀ + y)` with `L₀` the span of the first `k` coordinate vectors,
`ϑ` a rotation and `y` a point of the complementary coordinates, so that the invariant measure
on flats is the product of the rotation probability and Lebesgue measure and no quotient space
is needed. Integrals of signed integrands are Bochner integrals, and every theorem that
integrates one asserts its integrability as a conclusion.

The support function is a local copy of the definition of `ConvexAnalysisAndDuality` §2.1, with
a docstring naming its owner. The implementation namespace of the README is `TauCeti`; the
prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory Metric Set Filter Topology Polynomial
open scoped ENNReal Pointwise ContDiff RealInnerProductSpace

namespace TauCetiRoadmap.IntegralGeometryOfConvexBodies

attribute [local instance] Classical.propDecidable

/-- The model Euclidean space `ℝ^d`. -/
abbrev Eucl (d : ℕ) := EuclideanSpace ℝ (Fin d)

/-! ## Local copy of vocabulary owned elsewhere -/

/-- Local copy of `ConvexAnalysisAndDuality` §2.1: the support function
`σ_C(y) = ⨆ x ∈ C, B x y`, equal to `⊥` for empty `C`. -/
def supportFunction {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]
    (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (C : Set E) (y : F) : EReal :=
  ⨆ x ∈ C, (B x y : EReal)

/-! ## Layer 1: the Steiner formula and the intrinsic volumes -/

section Layer1

/-- 1.1: `κ j`, the volume of the closed unit ball of `ℝ^j`. -/
def unitBallVolume (j : ℕ) : ℝ :=
  volume.real (closedBall (0 : Eucl j) 1)

/-- 1.1: the constant `c^r_s = r! κ_r / (s! κ_s)`. -/
def kinematicConst (r s : ℕ) : ℝ :=
  (r.factorial * unitBallVolume r) / (s.factorial * unitBallVolume s)

/-- 1.1: `κ_j = π^{j/2} / Γ(j/2 + 1)` and `c^r_s = (2 √π)^{r - s} Γ((r + 1)/2) / Γ((s + 1)/2)`. -/
theorem unitBallVolume_eq_and_kinematicConst_eq (j r s : ℕ) :
    unitBallVolume j = Real.sqrt Real.pi ^ j / Real.Gamma (j / 2 + 1) ∧
      kinematicConst r s = (2 * Real.sqrt Real.pi) ^ ((r : ℤ) - s) *
        Real.Gamma ((r + 1) / 2) / Real.Gamma ((s + 1) / 2) := by
  sorry

variable {d : ℕ}

/-- 1.2: the polynomial of degree at most `d` interpolating `ε ↦ V_d(K + ε B^d)` at
`ε = 0, 1, …, d`. -/
def steinerPolynomial (K : Set (Eucl d)) : ℝ[X] :=
  Lagrange.interpolate (Finset.range (d + 1)) (fun i : ℕ ↦ (i : ℝ))
    (fun i ↦ volume.real (K + closedBall (0 : Eucl d) (i : ℝ)))

/-- 1.2: the **intrinsic volume** `V_j(K)`, the coefficient of `ε^{d-j}` in the Steiner
polynomial divided by `κ_{d-j}`, and `0` for `j > d`. It is `0` on the empty set. -/
def intrinsicVolume (j : ℕ) (K : Set (Eucl d)) : ℝ :=
  if j ≤ d then (steinerPolynomial K).coeff (d - j) / unitBallVolume (d - j) else 0

/-- 1.2, **Steiner formula**: for a compact convex `K` and `ε ≥ 0`,
`V_d(K + ε B^d) = ∑_{j=0}^d ε^{d-j} κ_{d-j} V_j(K)`. -/
theorem steiner_formula {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) {ε : ℝ}
    (hε : 0 ≤ ε) :
    volume.real (K + closedBall (0 : Eucl d) ε) =
      ∑ j ∈ Finset.range (d + 1), ε ^ (d - j) * unitBallVolume (d - j) * intrinsicVolume j K := by
  sorry

/-- 1.2: `V_d` is the volume. -/
theorem intrinsicVolume_top {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) :
    intrinsicVolume d K = volume.real K := by
  sorry

/-- 1.3: `V_j` is invariant under every affine isometry, for every set. -/
theorem intrinsicVolume_image_affineIsometryEquiv (f : Eucl d ≃ᵃⁱ[ℝ] Eucl d) (j : ℕ)
    (K : Set (Eucl d)) : intrinsicVolume j (f '' K) = intrinsicVolume j K := by
  sorry

/-- 1.3: `V_j` is homogeneous of degree `j` on compact convex sets. -/
theorem intrinsicVolume_smul {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) (j : ℕ)
    {t : ℝ} (ht : 0 ≤ t) : intrinsicVolume j (t • K) = t ^ j * intrinsicVolume j K := by
  sorry

/-- 1.3: the intrinsic volumes of the unit ball, `V_j(B^d) = (d choose j) κ_d / κ_{d-j}`. -/
theorem intrinsicVolume_ball {j : ℕ} (hj : j ≤ d) :
    intrinsicVolume j (closedBall (0 : Eucl d) 1) =
      d.choose j * unitBallVolume d / unitBallVolume (d - j) := by
  sorry

/-- 1.3: `V_0` is `1` on nonempty compact convex sets. -/
theorem intrinsicVolume_zero {K : Set (Eucl d)} (hK : IsCompact K)
    (hKc : Convex ℝ K) (hKn : K.Nonempty) : intrinsicVolume 0 K = 1 := by
  sorry

/-- 1.3: `V_j` does not depend on the ambient dimension. -/
theorem intrinsicVolume_linearIsometry {n : ℕ} (e : Eucl d →ₗᵢ[ℝ] Eucl n)
    {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) (j : ℕ) :
    intrinsicVolume j (e '' K) = intrinsicVolume j K := by
  sorry

/-- 1.4: a compact convex set in an affine subspace of dimension `k` has `V_j = 0` for `j > k`,
and `V_k` is its `k`-dimensional Euclidean Hausdorff measure. -/
theorem intrinsicVolume_of_subset_affineSubspace {A : AffineSubspace ℝ (Eucl d)} {k : ℕ}
    (hA : Module.finrank ℝ A.direction = k) {K : Set (Eucl d)} (hK : IsCompact K)
    (hKc : Convex ℝ K) (hKA : K ⊆ A) :
    (∀ j, k < j → intrinsicVolume j K = 0) ∧
      intrinsicVolume k K = (MeasureTheory.Measure.euclideanHausdorffMeasure k K).toReal := by
  sorry

/-- 1.4: for a compact convex set with interior points, `2 V_{d-1}(K)` is the
`(d - 1)`-dimensional Euclidean Hausdorff measure of its boundary. -/
theorem surfaceArea_eq (hd : 1 ≤ d)
    {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) (hKi : (interior K).Nonempty) :
    2 * intrinsicVolume (d - 1) K =
      (MeasureTheory.Measure.euclideanHausdorffMeasure (d - 1) (frontier K)).toReal := by
  sorry

/-- 1.4: intrinsic volumes of an orthogonal sum, `V_j(K + M) = ∑_{i ≤ j} V_i(K) V_{j-i}(M)` for
`K ⊆ L` and `M ⊆ Lᗮ`. -/
theorem intrinsicVolume_add_of_subset_orthogonal (L : Submodule ℝ (Eucl d)) {K M : Set (Eucl d)}
    (hK : IsCompact K) (hKc : Convex ℝ K) (hKL : K ⊆ L) (hM : IsCompact M) (hMc : Convex ℝ M)
    (hML : M ⊆ Lᗮ) (j : ℕ) :
    intrinsicVolume j (K + M) =
      ∑ i ∈ Finset.range (j + 1), intrinsicVolume i K * intrinsicVolume (j - i) M := by
  sorry

/-- 1.4, the generalized Steiner formula:
`V_k(K + r B^d) = ∑_{j ≤ k} (d - j choose d - k) κ_{d-j} / κ_{d-k} V_j(K) r^{k-j}`. -/
theorem intrinsicVolume_add_closedBall {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K)
    {k : ℕ} (hk : k ≤ d) {r : ℝ} (hr : 0 ≤ r) :
    intrinsicVolume k (K + closedBall (0 : Eucl d) r) =
      ∑ j ∈ Finset.range (k + 1), ((d - j).choose (d - k) : ℝ) * unitBallVolume (d - j) /
        unitBallVolume (d - k) * intrinsicVolume j K * r ^ (k - j) := by
  sorry

end Layer1

/-! ## Layer 2: valuations and the convex ring -/

section Layer2

variable {d : ℕ}

/-- 2.1: `φ` is **additive** on compact convex sets:
`φ(K ∪ M) + φ(K ∩ M) = φ(K) + φ(M)` whenever `K`, `M` and `K ∪ M` are compact and convex. -/
def IsConvexValuation (φ : Set (Eucl d) → ℝ) : Prop :=
  ∀ K M, IsCompact K → Convex ℝ K → IsCompact M → Convex ℝ M → Convex ℝ (K ∪ M) →
    φ (K ∪ M) + φ (K ∩ M) = φ K + φ M

/-- 2.1: `φ` is **continuous** on nonempty compact convex sets for the Hausdorff metric. -/
def IsHausdorffContinuous (φ : Set (Eucl d) → ℝ) : Prop :=
  Continuous fun K : ConvexBody (Eucl d) ↦ φ (K : Set (Eucl d))

/-- 2.1: `φ` is **invariant under proper rigid motions** on compact convex sets. -/
def IsMotionInvariant (φ : Set (Eucl d) → ℝ) : Prop :=
  ∀ f : Eucl d ≃ᵃⁱ[ℝ] Eucl d, LinearMap.det (f.linear : Eucl d →ₗ[ℝ] Eucl d) = 1 →
    ∀ K, IsCompact K → Convex ℝ K → φ (f '' K) = φ K

/-- 2.1: the intrinsic volumes are additive on compact convex sets. -/
theorem isConvexValuation_intrinsicVolume (j : ℕ) :
    IsConvexValuation (intrinsicVolume (d := d) j) := by
  sorry

/-- 2.1: the intrinsic volumes are continuous for the Hausdorff metric. -/
theorem isHausdorffContinuous_intrinsicVolume (j : ℕ) :
    IsHausdorffContinuous (intrinsicVolume (d := d) j) := by
  sorry

/-- 2.2: a **polyconvex set**, a finite union of compact convex sets. -/
def IsPolyconvex (K : Set (Eucl d)) : Prop :=
  ∃ (m : ℕ) (C : Fin m → Set (Eucl d)), (∀ i, IsCompact (C i) ∧ Convex ℝ (C i)) ∧ K = ⋃ i, C i

/-- 2.2: the inclusion–exclusion sum `∑_{∅ ≠ v ⊆ {1,…,m}} (-1)^{|v|-1} φ(⋂_{i ∈ v} C_i)`. -/
def inclusionExclusion (φ : Set (Eucl d) → ℝ) {m : ℕ} (C : Fin m → Set (Eucl d)) : ℝ :=
  ∑ v ∈ (Finset.univ : Finset (Finset (Fin m))) with v.Nonempty,
    (-1) ^ (v.card + 1) * φ (⋂ i ∈ v, C i)

/-- 2.2: the **additive extension** of `φ` to the convex ring: the inclusion–exclusion sum over
a chosen representation of a polyconvex set, and `0` off the convex ring. It does not depend on
the representation when `φ` is a continuous valuation (Groemer's theorem, 2.2). -/
def convexRingExtension (φ : Set (Eucl d) → ℝ) (K : Set (Eucl d)) : ℝ :=
  if h : IsPolyconvex K then inclusionExclusion φ h.choose_spec.choose else 0

/-- 2.3: the **Euler characteristic** of a polyconvex set, the additive extension of the
functional that is `1` on nonempty sets and `0` on the empty set. -/
def eulerChar (K : Set (Eucl d)) : ℝ :=
  convexRingExtension (fun C ↦ if C.Nonempty then 1 else 0) K

/-- 2.3: the least number of nonempty compact convex sets whose union is `K`; it is `0` for the
empty set, and `0` (the infimum of the empty set) off the convex ring. -/
def convexRingIndex (K : Set (Eucl d)) : ℕ :=
  sInf {m | ∃ C : Fin m → Set (Eucl d),
    (∀ i, IsCompact (C i) ∧ Convex ℝ (C i) ∧ (C i).Nonempty) ∧ K = ⋃ i, C i}

/-- 2.2, **Groemer's extension theorem**: a continuous valuation with `φ ∅ = 0` has a unique
additive extension to the convex ring, given by inclusion–exclusion over every representation. -/
theorem groemer_extension {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hcont : IsHausdorffContinuous φ) (hφ0 : φ ∅ = 0) :
    (∀ (m : ℕ) (C : Fin m → Set (Eucl d)), (∀ i, IsCompact (C i) ∧ Convex ℝ (C i)) →
        convexRingExtension φ (⋃ i, C i) = inclusionExclusion φ C) ∧
      (∀ K, IsCompact K → Convex ℝ K → convexRingExtension φ K = φ K) ∧
      (∀ K M, IsPolyconvex K → IsPolyconvex M →
        convexRingExtension φ (K ∪ M) + convexRingExtension φ (K ∩ M) =
          convexRingExtension φ K + convexRingExtension φ M) ∧
      ∀ ψ : Set (Eucl d) → ℝ, ψ ∅ = 0 →
        (∀ K M, IsPolyconvex K → IsPolyconvex M → ψ (K ∪ M) + ψ (K ∩ M) = ψ K + ψ M) →
        (∀ K, IsCompact K → Convex ℝ K → ψ K = φ K) →
        ∀ K, IsPolyconvex K → ψ K = convexRingExtension φ K := by
  sorry

/-- 2.3: the Euler characteristic is the additive extension of `V_0`, and a union of `m` pairwise
disjoint nonempty compact convex sets has Euler characteristic `m`. -/
theorem eulerChar_spec :
    (∀ K : Set (Eucl d), IsPolyconvex K →
        eulerChar K = convexRingExtension (intrinsicVolume 0) K) ∧
      ∀ (m : ℕ) (C : Fin m → Set (Eucl d)),
        (∀ i, IsCompact (C i) ∧ Convex ℝ (C i) ∧ (C i).Nonempty) →
        Pairwise (Function.onFun Disjoint C) → eulerChar (⋃ i, C i) = m := by
  sorry

end Layer2

/-! ## Layer 3: Hadwiger's characterization theorem -/

section Layer3

variable {d : ℕ}

/-- 3.1: the **zonotope** `∑_i [0, a_i]` spanned by finitely many vectors. -/
def zonotope {m : ℕ} (a : Fin m → Eucl d) : Set (Eucl d) :=
  {x | ∃ t : Fin m → ℝ, (∀ i, t i ∈ Icc (0 : ℝ) 1) ∧ x = ∑ i, t i • a i}

/-- 3.1: a **zonoid**, a Hausdorff limit of translates of zonotopes. -/
def IsZonoid (Z : Set (Eucl d)) : Prop :=
  ∃ Zb : ConvexBody (Eucl d), (Zb : Set (Eucl d)) = Z ∧
    Zb ∈ closure {P : ConvexBody (Eucl d) |
      ∃ (m : ℕ) (a : Fin m → Eucl d) (x : Eucl d), (P : Set (Eucl d)) = x +ᵥ zonotope a}

/-- 3.1: an origin-symmetric compact convex set whose support function is smooth away from the
origin is a difference of zonoids: `K + Z₁ = Z₂` for zonoids `Z₁`, `Z₂`. -/
theorem exists_isZonoid_add_eq {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K)
    (hKn : K.Nonempty) (hsymm : ∀ x ∈ K, -x ∈ K)
    (hsmooth : ContDiffOn ℝ ∞ (fun u ↦ (supportFunction (innerₗ (Eucl d)) K u).toReal) {0}ᶜ) :
    ∃ Z₁ Z₂ : Set (Eucl d), IsZonoid Z₁ ∧ IsZonoid Z₂ ∧ K + Z₁ = Z₂ := by
  sorry

/-- 3.2: the unit cube `[0, 1]^d`. -/
def unitCube (d : ℕ) : Set (Eucl d) :=
  {x | ∀ i, x.ofLp i ∈ Icc (0 : ℝ) 1}

/-- 3.2: a continuous motion-invariant valuation that vanishes on compact convex sets without
interior points and on the unit cube vanishes on every compact convex set. -/
theorem eq_zero_of_isConvexValuation_of_simple {φ : Set (Eucl d) → ℝ}
    (hval : IsConvexValuation φ) (hcont : IsHausdorffContinuous φ) (hmot : IsMotionInvariant φ)
    (hsimple : ∀ K, IsCompact K → Convex ℝ K → interior K = ∅ → φ K = 0)
    (hcube : φ (unitCube d) = 0) :
    ∀ K, IsCompact K → Convex ℝ K → φ K = 0 := by
  sorry

/-- 3.3, **Hadwiger's characterization theorem**: a continuous motion-invariant valuation is a
linear combination of the intrinsic volumes on nonempty compact convex sets. -/
theorem hadwiger {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hcont : IsHausdorffContinuous φ) (hmot : IsMotionInvariant φ) :
    ∃ c : ℕ → ℝ, ∀ K, IsCompact K → Convex ℝ K → K.Nonempty →
      φ K = ∑ i ∈ Finset.range (d + 1), c i * intrinsicVolume i K := by
  sorry

/-- 3.3: for an increasing motion-invariant valuation, adding a segment acts linearly:
`φ(K + t [0, v]) = φ(K) + a t` for all `t ≥ 0`, with `a ≥ 0`. -/
theorem exists_apply_add_smul_segment_eq {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hmot : IsMotionInvariant φ)
    (hmono : ∀ K M, IsCompact K → Convex ℝ K → IsCompact M → Convex ℝ M → K ⊆ M → φ K ≤ φ M)
    {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) (v : Eucl d) :
    ∃ a : ℝ, 0 ≤ a ∧ ∀ t : ℝ, 0 ≤ t → φ (K + t • segment ℝ 0 v) = φ K + a * t := by
  sorry

/-- 3.3: a motion-invariant valuation that is increasing on compact convex sets is continuous. -/
theorem isHausdorffContinuous_of_monotone {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hmot : IsMotionInvariant φ)
    (hmono : ∀ K M, IsCompact K → Convex ℝ K → IsCompact M → Convex ℝ M → K ⊆ M → φ K ≤ φ M) :
    IsHausdorffContinuous φ := by
  sorry

/-- 3.3, **Hadwiger's theorem, monotone version**: an increasing motion-invariant valuation
with `φ ∅ = 0` is a linear combination of the intrinsic volumes with nonnegative
coefficients. -/
theorem hadwiger_monotone {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hmot : IsMotionInvariant φ) (hφ0 : φ ∅ = 0)
    (hmono : ∀ K M, IsCompact K → Convex ℝ K → IsCompact M → Convex ℝ M → K ⊆ M → φ K ≤ φ M) :
    ∃ c : ℕ → ℝ, (∀ i, 0 ≤ c i) ∧ ∀ K, IsCompact K → Convex ℝ K → K.Nonempty →
      φ K = ∑ i ∈ Finset.range (d + 1), c i * intrinsicVolume i K := by
  sorry

/-- 3.3: a continuous motion-invariant valuation homogeneous of degree `j ≤ d` is a multiple
of `V_j` on nonempty compact convex sets. -/
theorem eq_smul_intrinsicVolume_of_homogeneous {φ : Set (Eucl d) → ℝ}
    (hval : IsConvexValuation φ) (hcont : IsHausdorffContinuous φ) (hmot : IsMotionInvariant φ)
    {j : ℕ} (hj : j ≤ d)
    (hhom : ∀ K, IsCompact K → Convex ℝ K → ∀ t : ℝ, 0 < t → φ (t • K) = t ^ j * φ K) :
    ∃ c : ℝ, ∀ K, IsCompact K → Convex ℝ K → K.Nonempty → φ K = c * intrinsicVolume j K := by
  sorry

end Layer3

/-! ## Layer 4: invariant measures -/

section Layer4

variable {d : ℕ}

/-- 4.1: the rotation of `ℝ^d` given by an orthogonal matrix. -/
def rot (g : Matrix.orthogonalGroup (Fin d) ℝ) : Eucl d ≃ₗᵢ[ℝ] Eucl d :=
  TauCeti.orthogonalGroupToLinearIsometryEquiv g

/-- 4.1: the **rotation-invariant probability** on the orthogonal group, Tau Ceti's Euclidean
Haar measure divided by its total mass. -/
def rotationMeasure (d : ℕ) : Measure (Matrix.orthogonalGroup (Fin d) ℝ) :=
  (TauCeti.orthogonalGroupMeasure d univ)⁻¹ • TauCeti.orthogonalGroupMeasure d

/-- 4.1: the normalized surface measure of the unit sphere, as a measure on `ℝ^d`. -/
def uniformSphere (d : ℕ) : Measure (Eucl d) :=
  ((volume : Measure (Eucl d)).toSphere univ)⁻¹ •
    ((volume : Measure (Eucl d)).toSphere).map Subtype.val

/-- 4.1: the rotation measure is a probability, left and right invariant and inversion
invariant, and it is the only left-invariant probability on the orthogonal group. -/
theorem rotationMeasure_spec (d : ℕ) :
    IsProbabilityMeasure (rotationMeasure d) ∧ (rotationMeasure d).IsMulLeftInvariant ∧
      (rotationMeasure d).IsMulRightInvariant ∧ (rotationMeasure d).IsInvInvariant ∧
      ∀ μ : Measure (Matrix.orthogonalGroup (Fin d) ℝ), IsProbabilityMeasure μ →
        μ.IsMulLeftInvariant → μ = rotationMeasure d := by
  sorry

/-- 4.1: the image of the rotation probability under `ϑ ↦ ϑ e`, for a unit vector `e`, is the
normalized surface measure of the sphere. -/
theorem map_rotationMeasure_eq_uniformSphere {e : Eucl d} (he : ‖e‖ = 1) :
    (rotationMeasure d).map (fun g ↦ rot g e) = uniformSphere d := by
  sorry

/-- 4.2: the space of linear subspaces of `ℝ^d`, with the measurable structure of their
orthogonal projections. The Grassmannian `G(d, k)` is the part of dimension `k`. -/
def Subspaces (d : ℕ) : Type := Submodule ℝ (Eucl d)

/-- 4.2: a point of `Subspaces d` as a submodule. -/
def Subspaces.toSubmodule (L : Subspaces d) : Submodule ℝ (Eucl d) := L

/-- 4.2: a submodule as a point of `Subspaces d`. -/
def Subspaces.ofSubmodule (L : Submodule ℝ (Eucl d)) : Subspaces d := L

instance : MeasurableSpace (Subspaces d) :=
  MeasurableSpace.comap
    (fun L : Subspaces d ↦ (L.toSubmodule.starProjection : Eucl d →L[ℝ] Eucl d)) inferInstance

/-- 4.2: the image of a subspace under a rotation. -/
def rotateSubspace (g : Matrix.orthogonalGroup (Fin d) ℝ) (L : Subspaces d) : Subspaces d :=
  .ofSubmodule (L.toSubmodule.map ((rot g).toLinearEquiv : Eucl d →ₗ[ℝ] Eucl d))

/-- 4.2: the span `L_k` of the first `k` coordinate vectors. -/
def coordSubspace (d k : ℕ) : Subspaces d :=
  .ofSubmodule (⨅ i : {i : Fin d // k ≤ i.val}, LinearMap.ker (EuclideanSpace.projₗ (𝕜 := ℝ)
    (i : Fin d)))

/-- 4.2: the **invariant probability on the Grassmannian** `G(d, k)`, the image of the rotation
probability under `ϑ ↦ ϑ L_k`. -/
def grassmannianMeasure (d k : ℕ) : Measure (Subspaces d) :=
  (rotationMeasure d).map fun g ↦ rotateSubspace g (coordSubspace d k)

/-- 4.2: the rotation action on subspaces (jointly), orthogonal complementation and the
dimension are measurable. -/
theorem measurable_rotateSubspace_orthogonal_finrank :
    Measurable (fun p : Matrix.orthogonalGroup (Fin d) ℝ × Subspaces d ↦
        rotateSubspace p.1 p.2) ∧
      Measurable (fun L : Subspaces d ↦ Subspaces.ofSubmodule L.toSubmoduleᗮ) ∧
      Measurable (fun L : Subspaces d ↦ Module.finrank ℝ L.toSubmodule) := by
  sorry

/-- 4.2: `ν_k` is a rotation-invariant probability carried by the `k`-dimensional subspaces, it
is the image of the rotation probability under `ϑ ↦ ϑ L` for every `k`-dimensional `L`, and
orthogonal complementation carries it to `ν_{d-k}`. -/
theorem grassmannianMeasure_spec {k : ℕ} (hk : k ≤ d) :
    IsProbabilityMeasure (grassmannianMeasure d k) ∧
      (∀ᵐ L ∂grassmannianMeasure d k, Module.finrank ℝ L.toSubmodule = k) ∧
      (∀ g, (grassmannianMeasure d k).map (rotateSubspace g) = grassmannianMeasure d k) ∧
      (∀ L : Subspaces d, Module.finrank ℝ L.toSubmodule = k →
        (rotationMeasure d).map (fun g ↦ rotateSubspace g L) = grassmannianMeasure d k) ∧
      (grassmannianMeasure d k).map
          (fun L : Subspaces d ↦ Subspaces.ofSubmodule L.toSubmoduleᗮ) =
        grassmannianMeasure d (d - k) := by
  sorry

/-- 4.2: `ν_k` is the only rotation-invariant probability carried by the `k`-dimensional
subspaces. -/
theorem grassmannianMeasure_unique {k : ℕ} (hk : k ≤ d) (μ : Measure (Subspaces d))
    [IsProbabilityMeasure μ]
    (hμk : ∀ᵐ L ∂μ, Module.finrank ℝ L.toSubmodule = k)
    (hμ : ∀ g, μ.map (rotateSubspace g) = μ) : μ = grassmannianMeasure d k := by
  sorry

/-- 4.3: the coordinate flat `L_k + y` through the point with coordinates `y_i`, `i ≥ k`. -/
def standardFlat (k : ℕ) (y : {i : Fin d // k ≤ i.val} → ℝ) : Set (Eucl d) :=
  {x | ∀ i, x.ofLp i.1 = y i}

/-- 4.3: the affine `k`-flat `ϑ (L_k + y)`. -/
def affineFlat (k : ℕ) (g : Matrix.orthogonalGroup (Fin d) ℝ)
    (y : {i : Fin d // k ≤ i.val} → ℝ) : Set (Eucl d) :=
  rot g '' standardFlat k y

/-- 4.3: the **invariant measure on affine `k`-flats** in its parameters `(ϑ, y)`: the product of
the rotation probability and Lebesgue measure on the complementary coordinates. -/
def flatMeasure (d k : ℕ) :
    Measure (Matrix.orthogonalGroup (Fin d) ℝ × ({i : Fin d // k ≤ i.val} → ℝ)) :=
  (rotationMeasure d).prod volume

/-- 4.3: every affine isometry acts on the parameters of `k`-flats by a measure-preserving map,
and the flats hitting the unit ball have measure `κ_{d-k}`. -/
theorem flatMeasure_spec {k : ℕ} (hk : k ≤ d) :
    (∀ f : Eucl d ≃ᵃⁱ[ℝ] Eucl d, ∃ T, MeasurePreserving T (flatMeasure d k) (flatMeasure d k) ∧
      ∀ p, affineFlat k (T p).1 (T p).2 = f '' affineFlat k p.1 p.2) ∧
      flatMeasure d k {p | (affineFlat k p.1 p.2 ∩ closedBall 0 1).Nonempty} =
        ENNReal.ofReal (unitBallVolume (d - k)) := by
  sorry

/-- 4.4: the rigid motion `x ↦ ϑ x + t`. -/
def motion (g : Matrix.orthogonalGroup (Fin d) ℝ) (t : Eucl d) (x : Eucl d) : Eucl d :=
  rot g x + t

/-- 4.4: the **invariant measure on rigid motions** in its parameters `(ϑ, t)`. -/
def motionMeasure (d : ℕ) : Measure (Matrix.orthogonalGroup (Fin d) ℝ × Eucl d) :=
  (rotationMeasure d).prod volume

/-- 4.4: the motion measure is invariant under composition with a fixed motion on either side
and under inversion, and the motions that move a point into the unit ball have measure `κ_d`. -/
theorem motionMeasure_spec (h : Matrix.orthogonalGroup (Fin d) ℝ) (s x : Eucl d) :
    MeasurePreserving (fun p : Matrix.orthogonalGroup (Fin d) ℝ × Eucl d ↦
        (h * p.1, rot h p.2 + s)) (motionMeasure d) (motionMeasure d) ∧
      MeasurePreserving (fun p : Matrix.orthogonalGroup (Fin d) ℝ × Eucl d ↦
        (p.1 * h, rot p.1 s + p.2)) (motionMeasure d) (motionMeasure d) ∧
      MeasurePreserving (fun p : Matrix.orthogonalGroup (Fin d) ℝ × Eucl d ↦
        (p.1⁻¹, -(rot p.1⁻¹ p.2))) (motionMeasure d) (motionMeasure d) ∧
      motionMeasure d {p | motion p.1 p.2 x ∈ closedBall 0 1} =
        ENNReal.ofReal (unitBallVolume d) := by
  sorry

end Layer4

/-! ## Layer 5: Crofton, Cauchy and Kubota formulas -/

section Layer5

variable {d : ℕ}

/-- 5.1, **Crofton formula**: for `j ≤ k ≤ d`,
`∫_{A(d,k)} V_j(K ∩ F) μ_k(dF) = c^{k, d-k+j}_{j, d} V_{d-k+j}(K)`. -/
theorem crofton {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) {k j : ℕ}
    (hkd : k ≤ d) (hj : j ≤ k) :
    Integrable (fun p ↦ intrinsicVolume j (K ∩ affineFlat k p.1 p.2)) (flatMeasure d k) ∧
      ∫ p, intrinsicVolume j (K ∩ affineFlat k p.1 p.2) ∂flatMeasure d k =
        kinematicConst k j * kinematicConst (d - k + j) d * intrinsicVolume (d - k + j) K := by
  sorry

/-- 5.2: the intrinsic volumes are nonnegative and increasing on compact convex sets. -/
theorem intrinsicVolume_nonneg_and_mono {K M : Set (Eucl d)} (hK : IsCompact K)
    (hKc : Convex ℝ K) (hM : IsCompact M) (hMc : Convex ℝ M) (hKM : K ⊆ M) (j : ℕ) :
    0 ≤ intrinsicVolume j K ∧ intrinsicVolume j K ≤ intrinsicVolume j M := by
  sorry

/-- 5.3, **Kubota's formula**: `V_m(K) = c^{0,d}_{m,d-m} ∫_{G(d,m)} λ_m(K|L) ν_m(dL)`. -/
theorem kubota {K : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K) {m : ℕ} (hm : m ≤ d) :
    Integrable (fun L : Subspaces d ↦
        volume.real (L.toSubmodule.orthogonalProjectionOnto '' K))
        (grassmannianMeasure d m) ∧
      intrinsicVolume m K = kinematicConst 0 m * kinematicConst d (d - m) *
        ∫ L, volume.real (L.toSubmodule.orthogonalProjectionOnto '' K)
          ∂grassmannianMeasure d m := by
  sorry

/-- 5.3: the **mean width** `w(K)`, the mean of `h_K(u) + h_K(-u)` over the uniform law on the
unit sphere. -/
def meanWidth (K : Set (Eucl d)) : ℝ :=
  ∫ u, ((supportFunction (innerₗ (Eucl d)) K u).toReal +
    (supportFunction (innerₗ (Eucl d)) K (-u)).toReal) ∂uniformSphere d

/-- 5.3: `V_1(K) = d κ_d / (2 κ_{d-1}) w(K)` for nonempty compact convex `K`. -/
theorem intrinsicVolume_one_eq_meanWidth (hd : 1 ≤ d) {K : Set (Eucl d)} (hK : IsCompact K)
    (hKc : Convex ℝ K) (hKn : K.Nonempty) :
    intrinsicVolume 1 K = d * unitBallVolume d / (2 * unitBallVolume (d - 1)) * meanWidth K := by
  sorry

/-- 5.4: the Gram determinant `det (⟪v_i, v_{i'}⟫)`, the squared `j`-volume of the parallelepiped
spanned by `v_1, …, v_j`. -/
def gramDet {j : ℕ} (v : Fin j → Eucl d) : ℝ :=
  (Matrix.of fun i i' ↦ ⟪v i, v i'⟫).det

/-- 5.4: the intrinsic volumes of a zonotope,
`V_j(∑_i [0, a_i]) = ∑_{i_1 < ⋯ < i_j} vol_j(a_{i_1}, …, a_{i_j})`. -/
theorem intrinsicVolume_zonotope {m : ℕ} (a : Fin m → Eucl d) (j : ℕ) :
    intrinsicVolume j (zonotope a) =
      ∑ e ∈ (Finset.univ : Finset (Fin j → Fin m)) with StrictMono e,
        Real.sqrt (gramDet (a ∘ e)) := by
  sorry

/-- 5.4: the intrinsic volumes of a zonoid with generating measure `ρ`, an even finite measure
on the unit sphere with `h_Z(u) = ∫ |⟪u, v⟫| ρ(dv)`:
`V_j(Z) = 2^j / j! ∫ ⋯ ∫ vol_j(v_1, …, v_j) ρ(dv_1) ⋯ ρ(dv_j)`. -/
theorem intrinsicVolume_zonoid {ρ : Measure (Eucl d)} [IsFiniteMeasure ρ]
    (hρS : ∀ᵐ v ∂ρ, ‖v‖ = 1) (hρeven : ρ.map Neg.neg = ρ) {Z : Set (Eucl d)}
    (hZ : IsCompact Z) (hZc : Convex ℝ Z) (hZn : Z.Nonempty)
    (hh : ∀ u, (supportFunction (innerₗ (Eucl d)) Z u).toReal = ∫ v, |⟪u, v⟫| ∂ρ) (j : ℕ) :
    intrinsicVolume j Z = 2 ^ j / j.factorial *
      ∫ v, Real.sqrt (gramDet v) ∂Measure.pi (fun _ : Fin j ↦ ρ) := by
  sorry

end Layer5

/-! ## Layer 6: kinematic formulas -/

section Layer6

variable {d : ℕ}

/-- 6.1, **Hadwiger's general integral-geometric theorem**: for a continuous valuation `φ` with
`φ ∅ = 0`, `∫_{G_d} φ(K ∩ gM) μ(dg) = ∑_{k=0}^d φ_{d-k}(K) V_k(M)`, where
`φ_{d-k}(K) = ∫_{A(d,k)} φ(K ∩ F) μ_k(dF)`. -/
theorem kinematic_valuation {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hcont : IsHausdorffContinuous φ) (hφ0 : φ ∅ = 0) {K M : Set (Eucl d)} (hK : IsCompact K)
    (hKc : Convex ℝ K) (hM : IsCompact M) (hMc : Convex ℝ M) :
    Integrable (fun p ↦ φ (K ∩ motion p.1 p.2 '' M)) (motionMeasure d) ∧
      (∀ k ≤ d, Integrable (fun p ↦ φ (K ∩ affineFlat k p.1 p.2)) (flatMeasure d k)) ∧
      ∫ p, φ (K ∩ motion p.1 p.2 '' M) ∂motionMeasure d =
        ∑ k ∈ Finset.range (d + 1),
          (∫ p, φ (K ∩ affineFlat k p.1 p.2) ∂flatMeasure d k) * intrinsicVolume k M := by
  sorry

/-- 6.2, **principal kinematic formula**:
`∫_{G_d} V_j(K ∩ gM) μ(dg) = ∑_{k=j}^d c^{k, d-k+j}_{j, d} V_k(K) V_{d-k+j}(M)`. -/
theorem principal_kinematic {K M : Set (Eucl d)} (hK : IsCompact K) (hKc : Convex ℝ K)
    (hM : IsCompact M) (hMc : Convex ℝ M) {j : ℕ} (hj : j ≤ d) :
    Integrable (fun p ↦ intrinsicVolume j (K ∩ motion p.1 p.2 '' M)) (motionMeasure d) ∧
      ∫ p, intrinsicVolume j (K ∩ motion p.1 p.2 '' M) ∂motionMeasure d =
        ∑ k ∈ Finset.Icc j d, kinematicConst k j * kinematicConst (d - k + j) d *
          intrinsicVolume k K * intrinsicVolume (d - k + j) M := by
  sorry

/-- 6.3, **iterated kinematic formula**: for `K_0` fixed and `K_1, …, K_n` moved independently,
`∫ ⋯ ∫ V_j(K_0 ∩ g_1 K_1 ∩ ⋯ ∩ g_n K_n) = ∑ c^d_j ∏_i c^{m_i}_d V_{m_i}(K_i)`, the sum over
`j ≤ m_i ≤ d` with `m_0 + ⋯ + m_n = n d + j`. -/
theorem iterated_kinematic {n : ℕ} (hn : 1 ≤ n) {K : Fin (n + 1) → Set (Eucl d)}
    (hK : ∀ i, IsCompact (K i) ∧ Convex ℝ (K i)) {j : ℕ} (hj : j ≤ d) :
    Integrable (fun g : Fin n → Matrix.orthogonalGroup (Fin d) ℝ × Eucl d ↦
        intrinsicVolume j (K 0 ∩ ⋂ i : Fin n, motion (g i).1 (g i).2 '' K i.succ))
        (Measure.pi fun _ ↦ motionMeasure d) ∧
      ∫ g, intrinsicVolume j (K 0 ∩ ⋂ i : Fin n, motion (g i).1 (g i).2 '' K i.succ)
          ∂Measure.pi (fun _ : Fin n ↦ motionMeasure d) =
        ∑ m ∈ (Finset.univ : Finset (Fin (n + 1) → Fin (d + 1))) with
            (∀ i, j ≤ (m i : ℕ)) ∧ ∑ i, (m i : ℕ) = n * d + j,
          kinematicConst d j * ∏ i, kinematicConst (m i) d * intrinsicVolume (m i) (K i) := by
  sorry

/-- 6.4, **translative formulas** for `V_d` and `V_{d-1}`, without integration over rotations. -/
theorem translative_formula (hd : 1 ≤ d) {K M : Set (Eucl d)} (hK : IsCompact K)
    (hKc : Convex ℝ K) (hM : IsCompact M) (hMc : Convex ℝ M) :
    Integrable (fun t : Eucl d ↦ intrinsicVolume d (K ∩ (· + t) '' M)) ∧
      ∫ t, intrinsicVolume d (K ∩ (· + t) '' M) =
        intrinsicVolume d K * intrinsicVolume d M ∧
      Integrable (fun t : Eucl d ↦ intrinsicVolume (d - 1) (K ∩ (· + t) '' M)) ∧
      ∫ t, intrinsicVolume (d - 1) (K ∩ (· + t) '' M) =
        intrinsicVolume (d - 1) K * intrinsicVolume d M +
          intrinsicVolume d K * intrinsicVolume (d - 1) M := by
  sorry

end Layer6

/-! ## Layer 7: integral geometry of polyconvex sets -/

section Layer7

variable {d : ℕ}

/-- 7.1: Hadwiger's general theorem for polyconvex sets and the additive extension of a
continuous valuation. -/
theorem kinematic_valuation_polyconvex {φ : Set (Eucl d) → ℝ} (hval : IsConvexValuation φ)
    (hcont : IsHausdorffContinuous φ) (hφ0 : φ ∅ = 0) {K M : Set (Eucl d)}
    (hK : IsPolyconvex K) (hM : IsPolyconvex M) :
    Integrable (fun p ↦ convexRingExtension φ (K ∩ motion p.1 p.2 '' M)) (motionMeasure d) ∧
      (∀ k ≤ d, Integrable (fun p ↦ convexRingExtension φ (K ∩ affineFlat k p.1 p.2))
        (flatMeasure d k)) ∧
      ∫ p, convexRingExtension φ (K ∩ motion p.1 p.2 '' M) ∂motionMeasure d =
        ∑ k ∈ Finset.range (d + 1),
          (∫ p, convexRingExtension φ (K ∩ affineFlat k p.1 p.2) ∂flatMeasure d k) *
            convexRingExtension (intrinsicVolume k) M := by
  sorry

/-- 7.1: the Crofton formula for polyconvex sets. -/
theorem crofton_polyconvex {K : Set (Eucl d)} (hK : IsPolyconvex K) {k j : ℕ} (hkd : k ≤ d)
    (hj : j ≤ k) :
    Integrable (fun p ↦ convexRingExtension (intrinsicVolume j) (K ∩ affineFlat k p.1 p.2))
        (flatMeasure d k) ∧
      ∫ p, convexRingExtension (intrinsicVolume j) (K ∩ affineFlat k p.1 p.2) ∂flatMeasure d k =
        kinematicConst k j * kinematicConst (d - k + j) d *
          convexRingExtension (intrinsicVolume (d - k + j)) K := by
  sorry

/-- 7.1: the principal kinematic formula for polyconvex sets. -/
theorem principal_kinematic_polyconvex {K M : Set (Eucl d)} (hK : IsPolyconvex K)
    (hM : IsPolyconvex M) {j : ℕ} (hj : j ≤ d) :
    Integrable (fun p ↦ convexRingExtension (intrinsicVolume j) (K ∩ motion p.1 p.2 '' M))
        (motionMeasure d) ∧
      ∫ p, convexRingExtension (intrinsicVolume j) (K ∩ motion p.1 p.2 '' M) ∂motionMeasure d =
        ∑ k ∈ Finset.Icc j d, kinematicConst k j * kinematicConst (d - k + j) d *
          convexRingExtension (intrinsicVolume k) K *
            convexRingExtension (intrinsicVolume (d - k + j)) M := by
  sorry

/-- 7.2: a union of `m` compact convex sets inside a compact convex `W` has
`|V_j| ≤ (2^m - 1) V_j(W)`. -/
theorem abs_convexRingExtension_intrinsicVolume_le {m : ℕ} {C : Fin m → Set (Eucl d)}
    (hC : ∀ i, IsCompact (C i) ∧ Convex ℝ (C i)) {W : Set (Eucl d)} (hW : IsCompact W)
    (hWc : Convex ℝ W) (hCW : ∀ i, C i ⊆ W) (j : ℕ) :
    |convexRingExtension (intrinsicVolume j) (⋃ i, C i)| ≤
      (2 ^ m - 1) * intrinsicVolume j W := by
  sorry

end Layer7

/-! ## Results of Mathlib and Tau Ceti named in the README -/

#check @TauCeti.orthogonalGroupMeasure
#check @TauCeti.orthogonalGroupVolume_pos
#check @TauCeti.map_orthogonalGroupLastColumn_orthogonalGroupMeasure
#check @TauCeti.tendsto_volume_real_add_smul_closedBall_div
#check @Convex.hasDerivWithinAt_measureReal_add_smul_closedBall
#check @TauCeti.perimeter
#check @MeasureTheory.Measure.isMulLeftInvariant_eq_smul
#check @MeasureTheory.Measure.euclideanHausdorffMeasure
#check @MeasureTheory.Measure.toSphere
#check @EuclideanSpace.volume_closedBall
#check @Real.Gamma_mul_Gamma_add_half
#check @ConvexBody
#check @EReal.toReal
#check @LinearIsometryEquiv.measurePreserving

end TauCetiRoadmap.IntegralGeometryOfConvexBodies
