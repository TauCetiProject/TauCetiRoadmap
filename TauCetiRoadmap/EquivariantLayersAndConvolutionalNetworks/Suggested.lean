import Mathlib
import TauCeti.Geometry.Neuromanifold.Basic
import TauCeti.Geometry.Neuromanifold.Convolution.Chain

/-!
# Equivariant layers and convolutional networks: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need. Every headline theorem of the README is statable at the pins and is stated
here. The linear convolutional networks of Layer 3 are Tau Ceti's `ConvolutionSpec` (the
convolutional constructor of the Neuromanifold library) with identity hidden activations and the
bias-free realization `ConvolutionSpec.realizeWeights`.
-/

namespace TauCetiRoadmap.EquivariantLayersAndConvolutionalNetworks

open Polynomial TauCeti.Neuromanifold

/-! ## Layer 1: equivariant linear layers on tensors -/

/-- 1.1 The permutation action on order-`k` tensors over `Fin n`: `(σ • x) a = x (σ⁻¹ ∘ a)`. -/
def tensorPerm (K : Type*) [Field K] (n k : ℕ) (σ : Equiv.Perm (Fin n)) :
    ((Fin k → Fin n) → K) →ₗ[K] ((Fin k → Fin n) → K) :=
  LinearMap.funLeft K K (fun a => σ.symm ∘ a)

/-- 1.1 The `S_n`-equivariant linear maps from order-`k` to order-`l` tensors over `Fin n`. -/
def equivariantMaps (K : Type*) [Field K] (n k l : ℕ) :
    Submodule K (((Fin k → Fin n) → K) →ₗ[K] ((Fin l → Fin n) → K)) where
  carrier := {T | ∀ σ, T ∘ₗ tensorPerm K n k σ = tensorPerm K n l σ ∘ₗ T}
  add_mem' := fun {S T} hS hT σ => by
    rw [LinearMap.add_comp, LinearMap.comp_add, hS σ, hT σ]
  zero_mem' := fun σ => by simp
  smul_mem' := fun c T hT σ => by
    rw [LinearMap.smul_comp, LinearMap.comp_smul, hT σ]

open Classical in
/-- 1.1 The pattern map of a set partition `γ` of `Fin (k + l)`: its matrix entry at
(output index `b`, input index `a`) is `1` when the equality pattern of `(a, b)` is `γ`,
else `0`. -/
noncomputable def patternMap (K : Type*) [Field K] (n k l : ℕ) (γ : Setoid (Fin (k + l))) :
    ((Fin k → Fin n) → K) →ₗ[K] ((Fin l → Fin n) → K) :=
  Matrix.mulVecLin (fun b a => if Setoid.ker (Fin.append a b) = γ then 1 else 0)

/-- 1.1 The pattern maps of the set partitions of `Fin (k + l)` with at most `n` blocks form a
basis of the `S_n`-equivariant linear maps (Maron et al., Prop. 2 and Thm 1, corrected). -/
theorem exists_basis_patternMap (K : Type*) [Field K] (n k l : ℕ) :
    ∃ B : Module.Basis {γ : Setoid (Fin (k + l)) // Nat.card (Quotient γ) ≤ n} K
        (equivariantMaps K n k l),
      ∀ γ, (B γ : ((Fin k → Fin n) → K) →ₗ[K] ((Fin l → Fin n) → K)) = patternMap K n k l γ := by
  sorry

/-- 1.2 The dimension of the equivariant maps is `Σ_(j ≤ n) S(k + l, j)`; it equals the Bell
number `B(k + l)` exactly when `k + l ≤ n`. -/
theorem finrank_equivariantMaps (K : Type*) [Field K] (n k l : ℕ) :
    Module.finrank K (equivariantMaps K n k l) =
        ∑ j ∈ Finset.range (n + 1), Nat.stirlingSecond (k + l) j ∧
      (Module.finrank K (equivariantMaps K n k l) = Nat.bell (k + l) ↔ k + l ≤ n) := by
  sorry

/-! ## Layer 2: continuous functions of sets -/

/-- 2.1 The power-sum map `x ↦ (Σ_i x_i, Σ_i x_i², …, Σ_i x_i^M)` on `ℝ^M`. -/
def powerSum (M : ℕ) (x : Fin M → ℝ) : Fin M → ℝ :=
  fun q => ∑ i, x i ^ (q.val + 1)

/-- 2.1 On the closed cone of nondecreasing tuples `x₀ ≤ x₁ ≤ ⋯`, the power-sum map is a closed
embedding into `ℝ^M` (Zaheer et al., Lemmas 4 and 6 and the proof of Thm 7, there on `[0, 1]^M`). -/
theorem isClosedEmbedding_powerSum_monotone (M : ℕ) :
    Topology.IsClosedEmbedding (fun x : {x : Fin M → ℝ // Monotone x} => powerSum M x.1) := by
  sorry

/-- 2.2 A continuous `f : ℝ^M → ℝ` is permutation-invariant iff `f = ρ ∘ powerSum M` for a
continuous `ρ : ℝ^M → ℝ` (Wagstaff et al., Thm 4.3; Zaheer et al., Thm 7). -/
theorem invariant_iff_exists_continuous_comp_powerSum (M : ℕ) {f : (Fin M → ℝ) → ℝ}
    (hf : Continuous f) :
    (∀ (σ : Equiv.Perm (Fin M)) (x : Fin M → ℝ), f (x ∘ σ) = f x) ↔
      ∃ ρ : (Fin M → ℝ) → ℝ, Continuous ρ ∧ f = ρ ∘ powerSum M := by
  sorry

/-- 2.3 For `N < M` the maximum on `ℝ^M` is not of the form `ρ (Σ_i φ (x i))` with a continuous
`φ : ℝ → ℝ^N` and any `ρ` (Wagstaff et al., Thm 4.1). -/
theorem not_exists_sum_decomposition_iSup {M N : ℕ} (hNM : N < M) :
    ¬ ∃ (φ : ℝ → Fin N → ℝ) (ρ : (Fin N → ℝ) → ℝ), Continuous φ ∧
      ∀ x : Fin M → ℝ, (⨆ i, x i) = ρ (∑ i, φ (x i)) := by
  sorry

/-- 2.4 A continuous `F : ℝ^n → ℝ^n` is permutation-equivariant iff
`F x i = ρ (x i, Σ_(j ≠ i) (x j, x j², …, x j^(n-1)))` for one continuous `ρ`
(Sannai–Takai–Cordonnier, Cor. 3.1 and 3.2, here on all of `ℝ^n`). -/
theorem equivariant_iff_exists_continuous (n : ℕ) {F : (Fin n → ℝ) → Fin n → ℝ}
    (hF : Continuous F) :
    (∀ (σ : Equiv.Perm (Fin n)) (x : Fin n → ℝ), F (x ∘ σ) = F x ∘ σ) ↔
      ∃ ρ : ℝ × (Fin (n - 1) → ℝ) → ℝ, Continuous ρ ∧
        ∀ x i, F x i = ρ (x i, ∑ j ∈ Finset.univ.erase i,
          fun q : Fin (n - 1) => x j ^ (q.val + 1)) := by
  sorry

/-! ## Layer 3: linear convolutional networks -/

/-- 3.1 The filter polynomial `Σ_j w_j X^j` of a filter `w : Fin k → K`. -/
noncomputable def filterPoly {K : Type*} [CommRing K] {k : ℕ} (w : Fin k → K) : K[X] :=
  ∑ j, C (w j) * X ^ (j : ℕ)

/-- 3.1 The end-to-end filter length `1 + Σ_i (k_i − 1) s₁ ⋯ s_(i−1)` of a convolutional
specification (`k₁ + Σ_(i ≥ 2) (k_i − 1) s₁ ⋯ s_(i−1)` when `k₁ ≥ 1`). -/
def compositeLength {K : Type*} {L : ℕ} (A : ConvolutionSpec K L) : ℕ :=
  1 + ∑ i, (A.filterLength i - 1) * ∏ j ∈ Finset.Iio i, A.stride j

/-- 3.1 The end-to-end filter polynomial `Π_i π(w_i)(X^(s₁ ⋯ s_(i−1)))`. -/
noncomputable def compositeFilterPoly {K : Type*} [CommRing K] {L : ℕ} (A : ConvolutionSpec K L)
    (w : A.Weights) : K[X] :=
  ∏ i, (filterPoly (w i)).comp (X ^ ∏ j ∈ Finset.Iio i, A.stride j)

/-- 3.1 A linear convolutional network is one valid convolution: stride `Π_i s_i`, filter length
`compositeLength A`, and filter the coefficients of `compositeFilterPoly A w` (Kohn–Merkh–
Montúfar–Trager, Prop. 2.2 and Remark 2.8). -/
theorem realizeWeights_eq_convolution {K : Type*} [CommRing K] {L : ℕ} (A : ConvolutionSpec K L)
    (hact : ∀ j, A.activation j = id) (hk : ∀ i, 0 < A.filterLength i)
    (hm : 0 < A.width (Fin.last L)) (w : A.Weights) :
    ∃ h : A.width 0 = (∏ i, A.stride i) * (A.width (Fin.last L) - 1) + compositeLength A,
      A.realizeWeights w = convolution h (fun j => (compositeFilterPoly A w).coeff j) := by
  sorry

/-- 3.2 The number of layers whose filter length is even. -/
def evenFilterCount {K : Type*} {L : ℕ} (A : ConvolutionSpec K L) : ℕ :=
  (Finset.univ.filter fun i => Even (A.filterLength i)).card

/-- 3.2 The number of real roots on the projective line, with multiplicity, of the binary form of
degree `k − 1` attached to a filter `u : Fin k → ℝ`: real roots of `filterPoly u` plus the roots at
infinity, `k − 1 − natDegree`. -/
noncomputable def realRootCount {k : ℕ} (u : Fin k → ℝ) : ℕ :=
  Multiset.card (filterPoly u).roots + (k - 1 - (filterPoly u).natDegree)

/-- 3.2 Function space of a real stride-one linear convolutional network: the valid convolutions
whose filter is zero or has at least as many real roots on the projective line as there are even
filter lengths; the network is filling iff at most one filter length is even (Kohn–Merkh–
Montúfar–Trager, Cor. 2.7, Lemma 4.2, Thm 4.1). -/
theorem realizedFunctions_realizeWeights_of_stride_one {L : ℕ} (A : ConvolutionSpec ℝ L)
    (hL : 0 < L) (hact : ∀ j, A.activation j = id) (hs : ∀ i, A.stride i = 1)
    (hk : ∀ i, 0 < A.filterLength i) (hm : 0 < A.width (Fin.last L)) :
    ∃ h : A.width 0 = 1 * (A.width (Fin.last L) - 1) + compositeLength A,
      realizedFunctions A.realizeWeights =
          {f | ∃ u : Fin (compositeLength A) → ℝ,
            f = convolution h u ∧ (u = 0 ∨ evenFilterCount A ≤ realRootCount u)} ∧
        (realizedFunctions A.realizeWeights = Set.range (convolution h) ↔
          evenFilterCount A ≤ 1) := by
  sorry

end TauCetiRoadmap.EquivariantLayersAndConvolutionalNetworks
