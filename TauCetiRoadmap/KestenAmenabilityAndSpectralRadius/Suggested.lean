import Mathlib
import TauCeti.GroupTheory.Amenable.Basic
import TauCeti.GroupTheory.Amenable.Foelner

/-!
# Kesten's amenability criterion and the spectral radius: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's API lists, routes and Checks are not
restated.

A step measure on a group `G` is an element `μ` of Mathlib's `MonoidAlgebra ℝ G`, a finitely
supported real function on `G`, with nonnegative coefficients summing to `1` and `μ(g⁻¹) = μ(g)`.
Its convolution powers are the powers `μ ^ n` in `MonoidAlgebra ℝ G`, so the return probability
after `n` steps is the coefficient of `μ ^ n` at `1`. The spectral radius is the `limsup` of the
`n`-th roots of the return probabilities; the operator is left convolution `f ↦ μ * f` on
finitely supported `f`, with the `ℓ²` norm. Amenability is Tau Ceti's `TauCeti.Amenable` for the
discrete topology, and Følner sets are Tau Ceti's `TauCeti.HasFoelnerSets`. The free group of
rank `k` is `FreeGroup (Fin k)` with word length `FreeGroup.norm`.
-/

noncomputable section

open Filter Topology Finset
open scoped Pointwise

namespace TauCetiRoadmap.KestenAmenabilityAndSpectralRadius

/-! ## Layer 1: The spectral radius as an operator norm -/

section Walks

variable {G : Type*} [Group G]

/-- 1.1: a symmetric step measure: nonnegative coefficients, total mass `1`, and
`μ(g⁻¹) = μ(g)` for every `g`. -/
structure IsSymmetricStep (μ : MonoidAlgebra ℝ G) : Prop where
  nonneg : ∀ g, 0 ≤ μ.coeff g
  sum_eq_one : μ.coeff.sum (fun _ a => a) = 1
  symm : ∀ g, μ.coeff g⁻¹ = μ.coeff g

/-- 1.1: the return probability `p_n = μ^{*n}(1)` of the walk after `n` steps. -/
def returnProb (μ : MonoidAlgebra ℝ G) (n : ℕ) : ℝ :=
  (μ ^ n).coeff 1

/-- 1.1: the spectral radius `ρ(μ) = limsup_n p_n^(1/n)` of the walk. -/
def walkSpectralRadius (μ : MonoidAlgebra ℝ G) : ℝ :=
  limsup (fun n : ℕ => returnProb μ n ^ ((n : ℝ)⁻¹)) atTop

/-- 1.1: the `ℓ²` norm `(Σ_x f(x)²)^(1/2)` of a finitely supported function. -/
def l2Norm (f : MonoidAlgebra ℝ G) : ℝ :=
  √(f.coeff.sum fun _ a => a ^ 2)

/-- 1.2: for a nonnegative symmetric `μ`, the even return probabilities satisfy
`p_{2n}^(1/(2n)) → ρ(μ)`. -/
theorem tendsto_returnProb_two_mul_rpow (μ : MonoidAlgebra ℝ G) (h0 : ∀ g, 0 ≤ μ.coeff g)
    (hs : ∀ g, μ.coeff g⁻¹ = μ.coeff g) :
    Tendsto (fun n : ℕ => returnProb μ (2 * n) ^ (((2 * n : ℕ) : ℝ)⁻¹)) atTop
      (𝓝 (walkSpectralRadius μ)) := by
  sorry

/-- 1.3: for a nonnegative symmetric `μ`, `ρ(μ)` is the norm of `f ↦ μ * f` on finitely
supported functions with the `ℓ²` norm. -/
theorem isLUB_l2Norm_mul_div (μ : MonoidAlgebra ℝ G) (h0 : ∀ g, 0 ≤ μ.coeff g)
    (hs : ∀ g, μ.coeff g⁻¹ = μ.coeff g) :
    IsLUB {r | ∃ f : MonoidAlgebra ℝ G, f ≠ 0 ∧ r = l2Norm (μ * f) / l2Norm f}
      (walkSpectralRadius μ) := by
  sorry

end Walks

/-! ## Layer 2: Expansion and Kesten's criterion -/

section Expansion

variable {G : Type*} [Group G]

open scoped Classical in
/-- 2.1: the edge boundary `Σ_s μ(s) |sK \ K|` of a finite set `K`, the expected number of
steps from a uniform point of `K` that leave `K`, times `|K|`. -/
def edgeBoundary (μ : MonoidAlgebra ℝ G) (K : Finset G) : ℝ :=
  ∑ s ∈ μ.coeff.support, μ.coeff s * #((s • K) \ K)

/-- 2.1: the expansion constant `Φ(μ) = inf_K (Σ_s μ(s) |sK \ K|) / |K|` over finite nonempty
`K ⊆ G`. -/
def expansionConst (μ : MonoidAlgebra ℝ G) : ℝ :=
  ⨅ K : {K : Finset G // K.Nonempty}, edgeBoundary μ K.1 / #K.1

/-- 2.2: expansion and spectral radius: `1 − √(1 − Φ²) ≤ 1 − ρ ≤ Φ` for every symmetric
step measure on every group. -/
theorem walkSpectralRadius_expansion_bounds (μ : MonoidAlgebra ℝ G) (hμ : IsSymmetricStep μ) :
    1 - √(1 - expansionConst μ ^ 2) ≤ 1 - walkSpectralRadius μ ∧
      1 - walkSpectralRadius μ ≤ expansionConst μ := by
  sorry

/-- 2.3: if the support of a nonnegative `μ` generates `G`, then `Φ(μ) = 0` exactly when `G`
has Følner sets. -/
theorem expansionConst_eq_zero_iff_hasFoelnerSets (μ : MonoidAlgebra ℝ G)
    (h0 : ∀ g, 0 ≤ μ.coeff g) (hgen : Subgroup.closure (μ.coeff.support : Set G) = ⊤) :
    expansionConst μ = 0 ↔ TauCeti.HasFoelnerSets G := by
  sorry

/-- 2.4: Kesten's criterion: for a symmetric step measure whose support generates the discrete
group `G`, `ρ(μ) = 1` exactly when `G` is amenable. -/
theorem walkSpectralRadius_eq_one_iff_amenable [TopologicalSpace G] [DiscreteTopology G]
    (μ : MonoidAlgebra ℝ G) (hμ : IsSymmetricStep μ)
    (hgen : Subgroup.closure (μ.coeff.support : Set G) = ⊤) :
    walkSpectralRadius μ = 1 ↔ TauCeti.Amenable G := by
  sorry

end Expansion

/-! ## Layer 3: Free groups and cogrowth -/

section FreeGroups

/-- 3.1: the simple random walk on the free group of rank `k`: mass `1/(2k)` on each of the
`2k` generators and their inverses. -/
def freeGroupStep (k : ℕ) : MonoidAlgebra ℝ (FreeGroup (Fin k)) :=
  ∑ i : Fin k, (MonoidAlgebra.single (FreeGroup.of i) ((2 * k : ℝ)⁻¹) +
    MonoidAlgebra.single (FreeGroup.of i)⁻¹ ((2 * k : ℝ)⁻¹))

/-- 3.1: the spectral radius of the simple random walk on the free group of rank `k ≥ 1` is
`√(2k − 1)/k`. -/
theorem walkSpectralRadius_freeGroupStep (k : ℕ) (hk : 0 < k) :
    walkSpectralRadius (freeGroupStep k) = √(2 * k - 1) / k := by
  sorry

/-- 3.2: no image of the free walk beats the tree: for every homomorphism `φ` from the free
group of rank `k ≥ 1`, the pushed-forward walk has spectral radius at least `√(2k − 1)/k`. -/
theorem walkSpectralRadius_freeGroupStep_le_map {Γ : Type*} [Group Γ] (k : ℕ) (hk : 0 < k)
    (φ : FreeGroup (Fin k) →* Γ) :
    √(2 * k - 1) / k ≤ walkSpectralRadius (MonoidAlgebra.mapDomain φ (freeGroupStep k)) := by
  sorry

/-- 3.3: the cogrowth `limsup_n |{w ∈ ker φ : |w| = n}|^(1/n)` of a homomorphism out of the
free group of rank `k`, where `|w|` is the length of the reduced word. -/
def cogrowth {Γ : Type*} [Group Γ] {k : ℕ} (φ : FreeGroup (Fin k) →* Γ) : ℝ :=
  limsup (fun n : ℕ =>
    (Nat.card {w : FreeGroup (Fin k) // φ w = 1 ∧ w.norm = n} : ℝ) ^ ((n : ℝ)⁻¹)) atTop

/-- 3.3: the cogrowth formula (Grigorchuk): with `b = 2k − 1`, `ρ` the spectral radius of the
pushed-forward walk and `c` the cogrowth, `c > √b` exactly when `ρ > √b/k`; then
`2kρ = b/c + c`; otherwise `ρ = √b/k`. -/
theorem cogrowth_formula {Γ : Type*} [Group Γ] (k : ℕ) (hk : 0 < k)
    (φ : FreeGroup (Fin k) →* Γ) :
    (√(2 * k - 1) < cogrowth φ ↔
        √(2 * k - 1) / k < walkSpectralRadius (MonoidAlgebra.mapDomain φ (freeGroupStep k))) ∧
      (√(2 * k - 1) < cogrowth φ →
        2 * k * walkSpectralRadius (MonoidAlgebra.mapDomain φ (freeGroupStep k)) =
          (2 * k - 1) / cogrowth φ + cogrowth φ) ∧
      (cogrowth φ ≤ √(2 * k - 1) →
        walkSpectralRadius (MonoidAlgebra.mapDomain φ (freeGroupStep k)) = √(2 * k - 1) / k) := by
  sorry

/-- 3.4: Grigorchuk's criterion: a discrete group with a surjection `φ` from the free group of
rank `k ≥ 2` is amenable exactly when the cogrowth of `φ` is `2k − 1`. -/
theorem amenable_iff_cogrowth_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [DiscreteTopology Γ]
    (k : ℕ) (hk : 2 ≤ k) (φ : FreeGroup (Fin k) →* Γ) (hφ : Function.Surjective φ) :
    TauCeti.Amenable Γ ↔ cogrowth φ = 2 * k - 1 := by
  sorry

end FreeGroups

end TauCetiRoadmap.KestenAmenabilityAndSpectralRadius
