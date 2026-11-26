import Mathlib

/-!
# Illumination and covering by smaller homothets: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, with the five definitions they need; every theorem is
`sorry` and every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here.

The ambient space `E` is a real normed space with no finite-dimensionality hypothesis: a real
normed space that contains a compact set with nonempty interior is finite-dimensional, so every
theorem about a convex body with nonempty interior is about a finite-dimensional space. Bodies are
Mathlib's `ConvexBody E` (nonempty, compact, convex) with the separate hypothesis that the
interior is nonempty; the definitions are on `Set E`. A smaller homothet of `K` is the image of
`K` under `AffineMap.homothety c t` with `0 < t < 1`; directions are a `Finset E`.
-/

open Set Pointwise Module Filter Topology

namespace TauCetiRoadmap.IlluminationAndCoveringByHomothets

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-! ## Layer 1: illumination, Boltyanski's equivalence, extreme points -/

/-- 1.0 `K` is covered by `m` images of itself under homotheties with ratios in `(0, 1)`. -/
def IsCoveredBySmallerHomothets (K : Set E) (m : ℕ) : Prop :=
  ∃ (c : Fin m → E) (t : Fin m → ℝ), (∀ i, t i ∈ Ioo (0 : ℝ) 1) ∧
    K ⊆ ⋃ i, AffineMap.homothety (c i) (t i) '' K

/-- 1.0 The points `x` illuminated by the direction `u`: some point `x + s • u` with `s > 0`
lies in the interior of `K`. -/
def illuminatedRegion (K : Set E) (u : E) : Set E :=
  {x | ∃ s : ℝ, 0 < s ∧ x + s • u ∈ interior K}

/-- 1.0 Every frontier point of `K` is illuminated by some direction of `U`. -/
def IsIlluminatedBy (K : Set E) (U : Finset E) : Prop :=
  frontier K ⊆ ⋃ u ∈ U, illuminatedRegion K u

/-- 1.0 The least number of smaller homothets covering `K` (the value is `0` when no finite
family covers `K`; by 2.1 this does not happen for a convex body with nonempty interior). -/
noncomputable def homothetyCoveringNumber (K : Set E) : ℕ :=
  sInf {m | IsCoveredBySmallerHomothets K m}

/-- 1.0 Any two nonzero continuous linear functionals that attain their maximum over `K` at `x`
are positive multiples of each other (`K` has a unique supporting hyperplane at `x`). -/
def HasUniqueSupportAt (K : Set E) (x : E) : Prop :=
  ∀ f g : StrongDual ℝ E, f ≠ 0 → g ≠ 0 → (∀ y ∈ K, f y ≤ f x) → (∀ y ∈ K, g y ≤ g x) →
    ∃ c : ℝ, 0 < c ∧ g = c • f

/-- 1.1 Illumination criterion: for a convex set with nonempty interior, the direction `u`
illuminates `x` exactly when `f u < 0` for every nonzero continuous linear functional `f` with
`f y ≤ f x` on `K`. -/
theorem mem_illuminatedRegion_iff_forall_support {K : Set E} (hKc : Convex ℝ K)
    (hK : (interior K).Nonempty) (x u : E) :
    x ∈ illuminatedRegion K u ↔
      ∀ f : StrongDual ℝ E, f ≠ 0 → (∀ y ∈ K, f y ≤ f x) → f u < 0 := by
  sorry

/-- 1.2 Boltyanski's equivalence: for a convex body with nonempty interior and `0 < m`, being
covered by `m` smaller homothets, by `m` translates of one smaller homothet, by `m` translates of
the interior, and being illuminated by at most `m` directions are equivalent. -/
theorem isCoveredBySmallerHomothets_tfae (K : ConvexBody E)
    (hK : (interior (K : Set E)).Nonempty) {m : ℕ} (hm : 0 < m) :
    List.TFAE [IsCoveredBySmallerHomothets (K : Set E) m,
      ∃ t ∈ Ioo (0 : ℝ) 1, ∃ v : Fin m → E, (K : Set E) ⊆ ⋃ i, v i +ᵥ t • (K : Set E),
      ∃ w : Fin m → E, (K : Set E) ⊆ ⋃ i, w i +ᵥ interior (K : Set E),
      ∃ U : Finset E, U.card ≤ m ∧ IsIlluminatedBy (K : Set E) U] := by
  sorry

/-- 1.3 In a nontrivial space, a finite set of directions illuminates a convex body exactly when
it illuminates every extreme point. -/
theorem isIlluminatedBy_iff_extremePoints [Nontrivial E] (K : ConvexBody E) (U : Finset E) :
    IsIlluminatedBy (K : Set E) U ↔
      ∀ x ∈ (K : Set E).extremePoints ℝ, ∃ u ∈ U, x ∈ illuminatedRegion (K : Set E) u := by
  sorry

/-! ## Layer 2: the bounds `d + 1` and `2 ^ d`, smooth bodies -/

/-- 2.1 A convex body with nonempty interior is covered by `homothetyCoveringNumber K` smaller
homothets, and this number is at least `finrank ℝ E + 1`. -/
theorem isCoveredBySmallerHomothets_homothetyCoveringNumber (K : ConvexBody E)
    (hK : (interior (K : Set E)).Nonempty) :
    IsCoveredBySmallerHomothets (K : Set E) (homothetyCoveringNumber (K : Set E)) ∧
      finrank ℝ E + 1 ≤ homothetyCoveringNumber (K : Set E) := by
  sorry

/-- 2.2 A parallelepiped spanned by a finite basis `b` is covered by `m` smaller homothets
exactly when `2 ^ card ι ≤ m`. -/
theorem isCoveredBySmallerHomothets_parallelepiped_iff {ι : Type*} [Fintype ι]
    (b : Basis ι ℝ E) (x₀ : E) (m : ℕ) :
    IsCoveredBySmallerHomothets (x₀ +ᵥ parallelepiped b) m ↔ 2 ^ Fintype.card ι ≤ m := by
  sorry

/-- 2.3 A convex body with nonempty interior and a unique supporting hyperplane at every
frontier point has covering number `finrank ℝ E + 1`. -/
theorem homothetyCoveringNumber_eq_of_hasUniqueSupportAt (K : ConvexBody E)
    (hK : (interior (K : Set E)).Nonempty)
    (hs : ∀ x ∈ frontier (K : Set E), HasUniqueSupportAt (K : Set E) x) :
    homothetyCoveringNumber (K : Set E) = finrank ℝ E + 1 := by
  sorry

/-! ## Layer 3: the plane -/

/-- 3.1 Levi's theorem: in a two-dimensional real normed space a convex body with nonempty
interior has covering number `4` if it is a parallelogram and `3` otherwise. -/
theorem homothetyCoveringNumber_of_finrank_eq_two (hE : finrank ℝ E = 2) (K : ConvexBody E)
    (hK : (interior (K : Set E)).Nonempty) :
    ((∃ (x₀ : E) (b : Basis (Fin 2) ℝ E), (K : Set E) = x₀ +ᵥ parallelepiped b) ∧
        homothetyCoveringNumber (K : Set E) = 4) ∨
      ((¬ ∃ (x₀ : E) (b : Basis (Fin 2) ℝ E), (K : Set E) = x₀ +ᵥ parallelepiped b) ∧
        homothetyCoveringNumber (K : Set E) = 3) := by
  sorry

/-! ## Layer 4: two directions along a line, and short curves -/

/-- 4.1 Let `π` be a surjective continuous linear map whose kernel is the line `ℝ ∙ w`. A
frontier point `x` of a convex body with nonempty interior is illuminated by `w` or by `-w`
exactly when `π x` lies in the interior of the projection `π '' K`. -/
theorem mem_illuminatedRegion_or_neg_iff {F : Type*} [NormedAddCommGroup F]
    [NormedSpace ℝ F] (K : ConvexBody E) (hK : (interior (K : Set E)).Nonempty)
    (π : E →L[ℝ] F) (hπ : Function.Surjective π) {w : E}
    (hker : LinearMap.ker (π : E →ₗ[ℝ] F) = ℝ ∙ w) {x : E} (hx : x ∈ frontier (K : Set E)) :
    (x ∈ illuminatedRegion (K : Set E) w ∨ x ∈ illuminatedRegion (K : Set E) (-w)) ↔
      π x ∈ interior (π '' (K : Set E)) := by
  sorry

/-- 4.2 Short curves: if every chain `a ≤ t₀ ≤ … ≤ tₙ ≤ b` has chord sum at most `lam` in the
gauge of the difference body `K - K`, then `γ '' [a, b]` lies in one translate of `lam • K`, and
for `lam < 1` one direction illuminates every point of `γ '' [a, b]` on the frontier of `K`. -/
theorem exists_subset_vadd_smul_of_variation_le (K : ConvexBody E)
    (hK : (interior (K : Set E)).Nonempty) (γ : ℝ → E) {a b lam : ℝ}
    (hvar : ∀ (n : ℕ) (t : ℕ → ℝ), Monotone t → (∀ i, t i ∈ Icc a b) →
      ∑ i ∈ Finset.range n, gauge ((K : Set E) - (K : Set E)) (γ (t (i + 1)) - γ (t i)) ≤ lam) :
    (∃ v : E, γ '' Icc a b ⊆ v +ᵥ lam • (K : Set E)) ∧
      (lam < 1 → ∃ u : E, ∀ s ∈ Icc a b, γ s ∈ frontier (K : Set E) →
        γ s ∈ illuminatedRegion (K : Set E) u) := by
  sorry

/-! ## Layer 5: continuity in the Hausdorff metric -/

/-- 5.1 Upper semicontinuity: if a convex body with nonempty interior is covered by `m` smaller
homothets, so is every convex body close enough to it in the Hausdorff metric. -/
theorem eventually_isCoveredBySmallerHomothets (K : ConvexBody E)
    (hK : (interior (K : Set E)).Nonempty) {m : ℕ}
    (h : IsCoveredBySmallerHomothets (K : Set E) m) :
    ∀ᶠ L : ConvexBody E in 𝓝 K, IsCoveredBySmallerHomothets (L : Set E) m := by
  sorry

/-- 5.2 Within every Hausdorff distance `ε > 0` of the unit cube of `EuclideanSpace ℝ (Fin d)`
there is a compact convex set with nonempty interior covered by `d + 1` smaller homothets. -/
theorem exists_hausdorffDist_lt_cube (d : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ L : Set (EuclideanSpace ℝ (Fin d)), IsCompact L ∧ Convex ℝ L ∧ (interior L).Nonempty ∧
      Metric.hausdorffDist L (parallelepiped (EuclideanSpace.basisFun (Fin d) ℝ)) < ε ∧
      IsCoveredBySmallerHomothets L (d + 1) := by
  sorry

end TauCetiRoadmap.IlluminationAndCoveringByHomothets
