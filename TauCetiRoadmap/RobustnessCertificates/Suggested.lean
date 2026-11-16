import Mathlib
import TauCeti.Geometry.Neuromanifold.MLP.Basic

/-!
# Certified robustness: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. This file states the headline theorems of Layers 1–6 against the pinned Mathlib and
Tau Ceti APIs; discharging them finishes neither a milestone nor the roadmap. The `sorry` proofs
are targets, not completed results. The multilayer LipSDP condition of §3.3, the `ℓ∞` minimum of
§5.2, the decidable `LDLᵀ` check of §6.1 and the worked example of §6.2 are README targets not
stated here.
-/

noncomputable section

open Matrix

namespace TauCetiRoadmap.RobustnessCertificates

/-! ## Layer 1: margin certificates -/

/-- `f` predicts class `i` at every point of `S`. -/
def CertifiedOn {X : Type*} {k : ℕ} (f : X → Fin k → ℝ) (S : Set X) (i : Fin k) : Prop :=
  ∀ x ∈ S, ∀ j, j ≠ i → f x j < f x i

/-- Certification is antitone in the set. -/
theorem CertifiedOn.mono {X : Type*} {k : ℕ} {f : X → Fin k → ℝ} {S T : Set X} {i : Fin k}
    (h : CertifiedOn f T i) (hST : S ⊆ T) : CertifiedOn f S i := sorry

/-- Coordinate gaps of a Euclidean vector: `|v i - v j| ≤ √2 ‖v‖`. -/
theorem abs_sub_le_sqrt_two_mul_norm {k : ℕ} (v : EuclideanSpace ℝ (Fin k)) {i j : Fin k}
    (hij : i ≠ j) : |v i - v j| ≤ Real.sqrt 2 * ‖v‖ := sorry

/-- The Lipschitz-margin certificate (Tsuzuku–Sato–Sugiyama). -/
theorem certifiedOn_ball_of_lipschitzWith {X : Type*} [SeminormedAddCommGroup X] {k : ℕ}
    {f : X → EuclideanSpace ℝ (Fin k)} {L : NNReal} (hf : LipschitzWith L f)
    {x : X} {i : Fin k} {m ε : ℝ} (hm : 0 < m) (hgap : ∀ j, j ≠ i → m ≤ f x i - f x j)
    (hε : Real.sqrt 2 * L * ε ≤ m) :
    CertifiedOn (fun y => (f y : Fin k → ℝ)) (Metric.ball x ε) i := sorry

/-- The per-pair Lipschitz-margin certificate. -/
theorem certifiedOn_ball_of_lipschitzWith_gap {X : Type*} [SeminormedAddCommGroup X] {k : ℕ}
    {f : X → Fin k → ℝ} {i : Fin k} {L : Fin k → NNReal}
    (hf : ∀ j, j ≠ i → LipschitzWith (L j) (fun y => f y i - f y j))
    {x : X} {ε : ℝ} (hpos : ∀ j, j ≠ i → 0 < f x i - f x j)
    (hε : ∀ j, j ≠ i → (L j : ℝ) * ε ≤ f x i - f x j) :
    CertifiedOn f (Metric.ball x ε) i := sorry

/-- The exact certified radius of an affine classifier, in operator norm. -/
theorem certifiedOn_ball_affine_iff {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
    {k : ℕ} (φ : Fin k → X →L[ℝ] ℝ) (b : Fin k → ℝ) {x : X} {r : ℝ} (hr : 0 < r)
    (i : Fin k) :
    CertifiedOn (fun y j => φ j y + b j) (Metric.ball x r) i ↔
      ∀ j, j ≠ i → 0 < (φ i x + b i) - (φ j x + b j) ∧
        r * ‖φ i - φ j‖ ≤ (φ i x + b i) - (φ j x + b j) := sorry

/-- In `ℓ∞`, the dual norm of a row is its `ℓ¹` norm. -/
theorem norm_dotProduct_clm_eq_sum_abs {n : ℕ} (a : Fin n → ℝ) :
    ‖∑ q, a q • (ContinuousLinearMap.proj q : (Fin n → ℝ) →L[ℝ] ℝ)‖ = ∑ q, |a q| := sorry

/-! ## Layer 2: Lipschitz bounds for networks -/

section L2Operator

open scoped Matrix.Norms.L2Operator

/-- A semidefiniteness certificate for the square of the `ℓ²` operator norm. -/
theorem sq_l2_opNorm_le_iff {m n : ℕ} (W : Matrix (Fin m) (Fin n) ℝ) {lam : ℝ}
    (hlam : 0 ≤ lam) :
    ‖W‖ ^ 2 ≤ lam ↔ (lam • (1 : Matrix (Fin n) (Fin n) ℝ) - Wᵀ * W).PosSemidef := sorry

/-- The product bound for multilayer perceptrons in `ℓ²`, with `K`-Lipschitz activations. -/
theorem lipschitzWith_realize_prod {L : ℕ} (A : TauCeti.Neuromanifold.MLPSpec ℝ L)
    (θ : A.Parameters) (K : Fin (L - 1) → NNReal)
    (hK : ∀ j, LipschitzWith (K j) (A.activation j)) :
    LipschitzWith
      ((∏ i, ‖(θ i).1‖₊) * ∏ j, K j)
      (fun x : EuclideanSpace ℝ (Fin (A.width 0)) =>
        (WithLp.toLp 2 (A.realize θ x) : EuclideanSpace ℝ (Fin (A.width (Fin.last L))))) :=
  sorry

end L2Operator

/-! ## Layer 3: LipSDP -/

/-- `σ` is slope-restricted in `[α, β]`. -/
def SlopeRestricted (α β : ℝ) (σ : ℝ → ℝ) : Prop :=
  ∀ a b, 0 ≤ (σ a - σ b - α * (a - b)) * (β * (a - b) - (σ a - σ b))

/-- A monotone `K`-Lipschitz function is slope-restricted in `[0, K]`. -/
theorem slopeRestricted_of_monotone_of_lipschitzWith {σ : ℝ → ℝ} {K : NNReal}
    (hm : Monotone σ) (hl : LipschitzWith K σ) : SlopeRestricted 0 K σ := sorry

/-- ReLU is slope-restricted in `[0, 1]`. -/
theorem slopeRestricted_relu : SlopeRestricted 0 1 (fun t => max t 0) := sorry

/-- The LipSDP matrix of a one-hidden-layer network. -/
def lipSDPMatrix {n h k : ℕ} (W₁ : Matrix (Fin h) (Fin n) ℝ) (W₂ : Matrix (Fin k) (Fin h) ℝ)
    (α β ρ : ℝ) (t : Fin h → ℝ) : Matrix (Fin n ⊕ Fin h) (Fin n ⊕ Fin h) ℝ :=
  fromBlocks (ρ • 1 + (2 * α * β) • (W₁ᵀ * diagonal t * W₁)) (-(α + β) • (W₁ᵀ * diagonal t))
    (-(α + β) • (diagonal t * W₁)) ((2 : ℝ) • diagonal t - W₂ᵀ * W₂)

/-- One-hidden-layer network `x ↦ W₂ σ(W₁ x + b₁) + b₂`. -/
def oneHidden {n h k : ℕ} (W₁ : Matrix (Fin h) (Fin n) ℝ) (b₁ : Fin h → ℝ)
    (W₂ : Matrix (Fin k) (Fin h) ℝ) (b₂ : Fin k → ℝ) (σ : ℝ → ℝ) (x : Fin n → ℝ) :
    Fin k → ℝ :=
  W₂ *ᵥ (fun p => σ ((W₁ *ᵥ x + b₁) p)) + b₂

/-- LipSDP soundness for one hidden layer (Fazlyab–Robey–Hassani–Morari–Pappas). -/
theorem lipSDP_sound {n h k : ℕ} {W₁ : Matrix (Fin h) (Fin n) ℝ} {b₁ : Fin h → ℝ}
    {W₂ : Matrix (Fin k) (Fin h) ℝ} {b₂ : Fin k → ℝ} {σ : ℝ → ℝ} {α β ρ : ℝ}
    {t : Fin h → ℝ} (hσ : SlopeRestricted α β σ) (ht : 0 ≤ t)
    (hM : (lipSDPMatrix W₁ W₂ α β ρ t).PosSemidef) (x x' : Fin n → ℝ) :
    ∑ p, (oneHidden W₁ b₁ W₂ b₂ σ x p - oneHidden W₁ b₁ W₂ b₂ σ x' p) ^ 2 ≤
      ρ * ∑ q, (x q - x' q) ^ 2 := sorry

/-- The Schur form of the LipSDP condition for slopes in `[0, 1]`. -/
theorem lipSDPMatrix_posSemidef_iff {n h k : ℕ} (W₁ : Matrix (Fin h) (Fin n) ℝ)
    (W₂ : Matrix (Fin k) (Fin h) ℝ) {ρ : ℝ} (hρ : 0 < ρ) (t : Fin h → ℝ) :
    (lipSDPMatrix W₁ W₂ 0 1 ρ t).PosSemidef ↔
      ((2 : ℝ) • diagonal t - W₂ᵀ * W₂ - ρ⁻¹ • (diagonal t * W₁ * W₁ᵀ * diagonal t)).PosSemidef :=
  sorry

section L2Operator

open scoped Matrix.Norms.L2Operator

/-- LipSDP is never worse than the product bound. -/
theorem lipSDPMatrix_prod_posSemidef {n h k : ℕ} (W₁ : Matrix (Fin h) (Fin n) ℝ)
    (W₂ : Matrix (Fin k) (Fin h) ℝ) :
    (lipSDPMatrix W₁ W₂ 0 1 (‖W₁‖ ^ 2 * ‖W₂‖ ^ 2) (fun _ => ‖W₂‖ ^ 2)).PosSemidef := sorry

end L2Operator

/-! ## Layer 4: interval bound propagation -/

/-- Interval bounds through an affine layer, in center–radius form. -/
def ibpAffine {m n : ℕ} (W : Matrix (Fin m) (Fin n) ℝ) (b : Fin m → ℝ) (l u : Fin n → ℝ) :
    (Fin m → ℝ) × (Fin m → ℝ) :=
  let c := (1 / 2 : ℝ) • (l + u)
  let r := (1 / 2 : ℝ) • (u - l)
  (W *ᵥ c + b - W.map abs *ᵥ r, W *ᵥ c + b + W.map abs *ᵥ r)

/-- Soundness of interval bounds through an affine layer. -/
theorem mulVec_add_mem_ibpAffine {m n : ℕ} (W : Matrix (Fin m) (Fin n) ℝ) (b : Fin m → ℝ)
    {l u x : Fin n → ℝ} (hx : x ∈ Set.Icc l u) :
    W *ᵥ x + b ∈ Set.Icc (ibpAffine W b l u).1 (ibpAffine W b l u).2 := sorry

/-- Per-layer exactness of interval bounds. -/
theorem exists_eq_ibpAffine_fst {m n : ℕ} (W : Matrix (Fin m) (Fin n) ℝ) (b : Fin m → ℝ)
    {l u : Fin n → ℝ} (hlu : l ≤ u) (p : Fin m) :
    ∃ x ∈ Set.Icc l u, (W *ᵥ x + b) p = (ibpAffine W b l u).1 p := sorry

/-- Interval bounds of every prefix of a multilayer perceptron. -/
def ibpBounds {L : ℕ} (A : TauCeti.Neuromanifold.MLPSpec ℝ L) (θ : A.Parameters)
    (l u : Fin (A.width 0) → ℝ) :
    (i : Fin (L + 1)) → (Fin (A.width i) → ℝ) × (Fin (A.width i) → ℝ) :=
  Fin.induction (l, u) fun i B =>
    (A.layerActivation i ∘ (ibpAffine (θ i).1 (θ i).2 B.1 B.2).1,
      A.layerActivation i ∘ (ibpAffine (θ i).1 (θ i).2 B.1 B.2).2)

/-- Soundness of interval bound propagation through every prefix of an MLP. -/
theorem evalPrefix_mem_ibpBounds {L : ℕ} (A : TauCeti.Neuromanifold.MLPSpec ℝ L)
    (θ : A.Parameters) (hσ : ∀ j, Monotone (A.activation j)) {l u x : Fin (A.width 0) → ℝ}
    (hx : x ∈ Set.Icc l u) (i : Fin (L + 1)) :
    A.evalPrefix θ x i ∈ Set.Icc (ibpBounds A θ l u i).1 (ibpBounds A θ l u i).2 := sorry

/-- The elementary interval-bound margin certificate. -/
theorem certifiedOn_Icc_of_ibpBounds {L : ℕ} (A : TauCeti.Neuromanifold.MLPSpec ℝ L)
    (θ : A.Parameters) (hσ : ∀ j, Monotone (A.activation j)) {l u : Fin (A.width 0) → ℝ}
    {i : Fin (A.width (Fin.last L))}
    (hcert : ∀ j, j ≠ i →
      (ibpBounds A θ l u (Fin.last L)).2 j < (ibpBounds A θ l u (Fin.last L)).1 i) :
    CertifiedOn (A.realize θ) (Set.Icc l u) i := sorry

/-! ## Layer 5: linear relaxation -/

/-- The upper chord of ReLU on `[l, u]` with `l < 0 < u`. -/
theorem max_le_chord {l u z : ℝ} (hl : l < 0) (hu : 0 < u) (hz : z ∈ Set.Icc l u) :
    max z 0 ≤ u / (u - l) * (z - l) := sorry

/-- The lower lines of ReLU through the origin. -/
theorem mul_le_max {α : ℝ} (h₀ : 0 ≤ α) (h₁ : α ≤ 1) (z : ℝ) : α * z ≤ max z 0 := sorry

/-- The slope and intercept of the CROWN relaxation of one hidden neuron. -/
def crownRelax (a l u α : ℝ) : ℝ × ℝ :=
  if 0 ≤ l then (1, 0)
  else if u ≤ 0 then (0, 0)
  else if 0 ≤ a then (α, 0)
  else (u / (u - l), -(u / (u - l)) * l)

/-- One-hidden-layer CROWN soundness. -/
theorem crown_sound {n h k : ℕ} (W₁ : Matrix (Fin h) (Fin n) ℝ) (b₁ : Fin h → ℝ)
    (W₂ : Matrix (Fin k) (Fin h) ℝ) (b₂ : Fin k → ℝ) (c : Fin k → ℝ) {l u α : Fin h → ℝ}
    (hα : ∀ p, α p ∈ Set.Icc 0 1) {x : Fin n → ℝ}
    (hx : W₁ *ᵥ x + b₁ ∈ Set.Icc l u) :
    let a := W₂ᵀ *ᵥ c
    let lam := fun p => (crownRelax (a p) (l p) (u p) (α p)).1
    let mu := fun p => (crownRelax (a p) (l p) (u p) (α p)).2
    (W₁ᵀ *ᵥ (fun p => a p * lam p)) ⬝ᵥ x + ((fun p => a p * lam p) ⬝ᵥ b₁ + a ⬝ᵥ mu + c ⬝ᵥ b₂) ≤
      c ⬝ᵥ oneHidden W₁ b₁ W₂ b₂ (fun t => max t 0) x := sorry

/-! ## Layer 6: exact certificates -/

/-- An `LDLᵀ` factorization with nonnegative `d` certifies semidefiniteness. -/
theorem posSemidef_mul_diagonal_mul_transpose {n : ℕ} (L : Matrix (Fin n) (Fin n) ℝ)
    {d : Fin n → ℝ} (hd : 0 ≤ d) : (L * diagonal d * Lᵀ).PosSemidef := sorry

/-- Rational semidefiniteness transfers to the real cast. -/
theorem PosSemidef.map_ratCast {n : ℕ} {M : Matrix (Fin n) (Fin n) ℚ} (hM : M.PosSemidef) :
    (M.map ((↑) : ℚ → ℝ)).PosSemidef := sorry

end TauCetiRoadmap.RobustnessCertificates
