/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Gowers uniformity norms and box norms: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's key definitions and headline theorems, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. Each is statable against the pinned Mathlib, with `sorry`, and
every definition has its real body.

The headline theorems are:

* Layer 1: Gowers–Cauchy–Schwarz and definiteness for box norms on products of probability
  spaces;
* Layer 2: Gowers–Cauchy–Schwarz and the smoothing inequality for directional box norms;
* Layer 3: Gowers–Cauchy–Schwarz, the triangle inequality, the inductive formula, nesting, phase
  invariance and pullback for Gowers norms, and the popularity of large derivatives;
* Layer 4: the Fourier identity for `U²` on finite and compact abelian groups, definiteness for
  `k ≥ 2`, and the coset bound;
* Layer 5: the generalised von Neumann theorem;
* Layer 6: Freiman invariance of relative Gowers norms, and finite models;
* Layer 7: one concatenation step and the iterated concatenation theorem.

The compact Fourier identity is stated with the Fourier coefficient written out; the roadmap
takes it from AlmostPeriodicityAndBohrSets §5.1 (`cft`).

Conventions: the cube is `Fin k → Bool`; `mulDeriv f h x = f x * conj (f (x + h))`; norms are
`2 ^ k`-th roots of real parts of inner products of constant families; groups carry an invariant
probability measure and measurable addition.
-/

open MeasureTheory Filter Pointwise
open scoped ENNReal NNReal ComplexConjugate

universe u

namespace TauCetiRoadmap.GowersUniformityNorms

/-! ### Layer 0: discrete cubes -/

namespace DiscreteCube

variable {k : ℕ}

/-- The number of coordinates of `ω` equal to `true`. -/
def weight (ω : Fin k → Bool) : ℕ := (Finset.univ.filter fun i ↦ ω i = true).card

/-- Conjugate `z` if the weight of `ω` is odd. -/
def conjPow (ω : Fin k → Bool) (z : ℂ) : ℂ := if Even (weight ω) then z else conj z

/-- `ω · h`: the sum of the `h i` over the coordinates where `ω` is `true`. -/
def shift {G : Type*} [AddCommMonoid G] (ω : Fin k → Bool) (h : Fin k → G) : G :=
  ∑ i, if ω i then h i else 0

/-- The vertex of the box spanned by `x⁰` and `x¹` selected by `ω`. -/
def select {X : Fin k → Type*} (ω : Fin k → Bool) (x₀ x₁ : ∀ i, X i) : ∀ i, X i :=
  fun i ↦ if ω i then x₁ i else x₀ i

end DiscreteCube

open DiscreteCube

/-! ### Layer 0: measured abelian groups -/

section MeasuredGroup

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]

/-- Layer 0.2: an invariant probability measure is unique. -/
theorem eq_of_isAddLeftInvariant (μ μ' : Measure G) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure μ'] [μ.IsAddLeftInvariant] [μ'.IsAddLeftInvariant] : μ' = μ := by
  sorry

/-- Layer 0.2: on a finite group the uniform probability measure integrates as the average. -/
theorem integral_uniformOn_univ {H : Type*} [Fintype H] [Nonempty H] [MeasurableSpace H]
    [DiscreteMeasurableSpace H] (f : H → ℂ) :
    ∫ x, f x ∂(ProbabilityTheory.uniformOn (Set.univ : Set H)) = Finset.univ.expect f := by
  sorry

end MeasuredGroup

/-! ### Layer 1: box norms on a product of probability spaces -/

section Box

variable {k : ℕ} {X : Fin k → Type*} [∀ i, MeasurableSpace (X i)]

/-- The box inner product of a family indexed by the vertices of the cube. -/
noncomputable def boxInner (μ : ∀ i, Measure (X i)) (F : (Fin k → Bool) → (∀ i, X i) → ℂ) : ℂ :=
  ∫ p : (∀ i, X i) × (∀ i, X i), ∏ ω, conjPow ω (F ω (select ω p.1 p.2))
    ∂((Measure.pi μ).prod (Measure.pi μ))

/-- The box norm: the `2 ^ k`-th root of the box inner product of the constant family. -/
noncomputable def boxNorm (μ : ∀ i, Measure (X i)) (F : (∀ i, X i) → ℂ) : ℝ :=
  (boxInner μ fun _ ↦ F).re ^ ((2 ^ k : ℝ)⁻¹)

variable (μ : ∀ i, Measure (X i)) [∀ i, IsProbabilityMeasure (μ i)]

/-- Layer 1.3: the Gowers–Cauchy–Schwarz inequality for box norms. -/
theorem norm_boxInner_le (hk : 1 ≤ k) (F : (Fin k → Bool) → (∀ i, X i) → ℂ)
    (hF : ∀ ω, MemLp (F ω) (2 ^ k : ℝ≥0∞) (Measure.pi μ)) :
    ‖boxInner μ F‖ ≤ ∏ ω, boxNorm μ (F ω) := by
  sorry

/-- Layer 1.4: control of the cut norm by the box norm. -/
theorem norm_integral_mul_prod_le_boxNorm (hk : 1 ≤ k) (F : (∀ i, X i) → ℂ)
    (hF : MemLp F (2 ^ k : ℝ≥0∞) (Measure.pi μ)) (u : Fin k → (∀ i, X i) → ℂ)
    (hu : ∀ j, Measurable (u j)) (hu1 : ∀ j x, ‖u j x‖ ≤ 1)
    (hdep : ∀ j x y, (∀ i, i ≠ j → x i = y i) → u j x = u j y) :
    ‖∫ x, F x * ∏ j, u j x ∂(Measure.pi μ)‖ ≤ boxNorm μ F := by
  sorry

/-- Layer 1.4: box norms of dimension at least two are definite. -/
theorem boxNorm_eq_zero_iff (hk : 2 ≤ k) (F : (∀ i, X i) → ℂ)
    (hF : MemLp F (2 ^ k : ℝ≥0∞) (Measure.pi μ)) :
    boxNorm μ F = 0 ↔ F =ᵐ[Measure.pi μ] 0 := by
  sorry

/-- Check of Layer 1.4: box norms of tensor products. -/
theorem boxNorm_tensor (hk : 2 ≤ k) (f : ∀ i, X i → ℂ)
    (hf : ∀ i, MemLp (f i) (2 ^ (k - 1) : ℝ≥0∞) (μ i)) :
    boxNorm μ (fun x ↦ ∏ i, f i (x i)) =
      ∏ i, (eLpNorm (f i) (2 ^ (k - 1) : ℝ≥0∞) (μ i)).toReal := by
  sorry

end Box

/-! ### Layer 2: directional box norms -/

section Directional

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]
  {k : ℕ}

/-- The directional box inner product along directions `ν`: the `μ`-average over `x` of the box
inner product on `∏ i, (G, ν i)` of the functions `y ↦ f ω (x + ∑ i, y i)`. -/
noncomputable def dirBoxInner (μ : Measure G) (ν : Fin k → Measure G)
    (f : (Fin k → Bool) → G → ℂ) : ℂ :=
  ∫ x, boxInner ν (fun ω y ↦ f ω (x + ∑ i, y i)) ∂μ

/-- The directional box norm. -/
noncomputable def dirBoxNorm (μ : Measure G) (ν : Fin k → Measure G) (f : G → ℂ) : ℝ :=
  (dirBoxInner μ ν fun _ ↦ f).re ^ ((2 ^ k : ℝ)⁻¹)

/-- A Haar direction: a measure equal to its difference law. -/
def IsHaarDirection (ν : Measure G) : Prop := ν ∗ ν.neg = ν

variable (μ : Measure G) [IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]

/-- Layer 2.2: the Gowers–Cauchy–Schwarz inequality for directional box norms. -/
theorem norm_dirBoxInner_le (hk : 1 ≤ k) (ν : Fin k → Measure G)
    (hν : ∀ i, IsProbabilityMeasure (ν i)) (f : (Fin k → Bool) → G → ℂ)
    (hf : ∀ ω, MemLp (f ω) (2 ^ k : ℝ≥0∞) μ) :
    ‖dirBoxInner μ ν f‖ ≤ ∏ ω, dirBoxNorm μ ν (f ω) := by
  sorry

/-- Layer 2.4: smoothing the directions decreases the directional box norm. -/
theorem dirBoxNorm_conv_le (hk : 1 ≤ k) (ν ρ : Fin k → Measure G)
    (hν : ∀ i, IsProbabilityMeasure (ν i)) (hρ : ∀ i, IsProbabilityMeasure (ρ i)) (f : G → ℂ)
    (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) :
    dirBoxNorm μ (fun i ↦ ν i ∗ ρ i) f ≤ dirBoxNorm μ ν f := by
  sorry

end Directional

/-! ### Layer 3: Gowers norms -/

section Gowers

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]

/-- The multiplicative derivative `Δ_h f x = f x * conj (f (x + h))`. -/
def mulDeriv (f : G → ℂ) (h : G) : G → ℂ := fun x ↦ f x * conj (f (x + h))

/-- The Gowers inner product of a family indexed by the vertices of the cube. -/
noncomputable def gowersInner (μ : Measure G) (k : ℕ) (f : (Fin k → Bool) → G → ℂ) : ℂ :=
  ∫ p : G × (Fin k → G), ∏ ω, conjPow ω (f ω (p.1 + shift ω p.2))
    ∂(μ.prod (Measure.pi fun _ ↦ μ))

/-- The Gowers `U^k` norm. -/
noncomputable def gowersNorm (μ : Measure G) (k : ℕ) (f : G → ℂ) : ℝ :=
  (gowersInner μ k fun _ ↦ f).re ^ ((2 ^ k : ℝ)⁻¹)

/-- The dual function of `f`: the cube product of `f` over the vertices other than `0`,
conjugated and averaged over the directions. -/
noncomputable def gowersDual (μ : Measure G) (k : ℕ) (f : G → ℂ) (x : G) : ℂ :=
  ∫ h, ∏ ω ∈ Finset.univ.erase (fun _ ↦ false), conjPow ω (conj (f (x + shift ω h)))
    ∂(Measure.pi fun _ : Fin k ↦ μ)

variable (μ : Measure G) [IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]

/-- Layer 3.2: the Gowers inner product is the directional box inner product along `μ`. -/
theorem gowersInner_eq_dirBoxInner (k : ℕ) (f : (Fin k → Bool) → G → ℂ)
    (hf : ∀ ω, MemLp (f ω) (2 ^ k : ℝ≥0∞) μ) :
    gowersInner μ k f = dirBoxInner μ (fun _ ↦ μ) f := by
  sorry

/-- Layer 3.2: the Gowers–Cauchy–Schwarz inequality. -/
theorem norm_gowersInner_le {k : ℕ} (hk : 1 ≤ k) (f : (Fin k → Bool) → G → ℂ)
    (hf : ∀ ω, MemLp (f ω) (2 ^ k : ℝ≥0∞) μ) :
    ‖gowersInner μ k f‖ ≤ ∏ ω, gowersNorm μ k (f ω) := by
  sorry

/-- Layer 3.2: the triangle inequality. -/
theorem gowersNorm_add_le {k : ℕ} (hk : 1 ≤ k) (f g : G → ℂ)
    (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) (hg : MemLp g (2 ^ k : ℝ≥0∞) μ) :
    gowersNorm μ k (f + g) ≤ gowersNorm μ k f + gowersNorm μ k g := by
  sorry

/-- Layer 3.2: the `U¹` norm is the modulus of the mean. -/
theorem gowersNorm_one (f : G → ℂ) (hf : MemLp f 2 μ) :
    gowersNorm μ 1 f = ‖∫ x, f x ∂μ‖ := by
  sorry

/-- Layer 3.2: the inductive formula. -/
theorem gowersNorm_succ_pow {k : ℕ} (hk : 1 ≤ k) (f : G → ℂ)
    (hf : MemLp f (2 ^ (k + 1) : ℝ≥0∞) μ) :
    gowersNorm μ (k + 1) f ^ 2 ^ (k + 1) = ∫ h, gowersNorm μ k (mulDeriv f h) ^ 2 ^ k ∂μ := by
  sorry

/-- Layer 3.2: nesting of the Gowers norms. -/
theorem gowersNorm_le_succ {k : ℕ} (hk : 1 ≤ k) (f : G → ℂ)
    (hf : MemLp f (2 ^ (k + 1) : ℝ≥0∞) μ) :
    gowersNorm μ k f ≤ gowersNorm μ (k + 1) f := by
  sorry

/-- Layer 3.2: invariance under phases whose cube products are trivial. -/
theorem gowersNorm_mul_phase {k : ℕ} (hk : 1 ≤ k) (q f : G → ℂ) (hq : Measurable q)
    (hq1 : ∀ x, ‖q x‖ = 1)
    (hcube : ∀ x (h : Fin k → G), ∏ ω, conjPow ω (q (x + shift ω h)) = 1)
    (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) :
    gowersNorm μ k (q * f) = gowersNorm μ k f := by
  sorry

/-- Layer 3.2: pullback along a measure-preserving homomorphism. -/
theorem gowersNorm_comp {H : Type*} [AddCommGroup H] [MeasurableSpace H] [MeasurableAdd₂ H]
    [MeasurableNeg H] (μH : Measure H) [IsProbabilityMeasure μH] [μH.IsAddLeftInvariant]
    (φ : G →+ H) (hφ : MeasurePreserving φ μ μH) (k : ℕ) (g : H → ℂ)
    (hg : MemLp g (2 ^ k : ℝ≥0∞) μH) :
    gowersNorm μ k (g ∘ φ) = gowersNorm μH k g := by
  sorry

/-- Layer 3.3: the dual function computes the `2 ^ k`-th power of the norm. -/
theorem integral_mul_conj_gowersDual {k : ℕ} (hk : 1 ≤ k) (f : G → ℂ)
    (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) :
    ∫ x, f x * conj (gowersDual μ k f x) ∂μ = ((gowersNorm μ k f ^ 2 ^ k : ℝ) : ℂ) := by
  sorry

/-- Layer 3.4: if `‖f‖_{U^{k+1}} ≥ η`, then many derivatives have large `U^k` norm. -/
theorem measure_large_mulDeriv {k : ℕ} (hk : 1 ≤ k) (f : G → ℂ) (hfm : Measurable f)
    (hf : ∀ x, ‖f x‖ ≤ 1) {η : ℝ} (hη : 0 ≤ η) (hη' : η ≤ gowersNorm μ (k + 1) f) :
    ENNReal.ofReal (η ^ 2 ^ (k + 1) / 2) ≤
      μ {h | η ^ 2 ^ (k + 1) / 2 ≤ gowersNorm μ k (mulDeriv f h) ^ 2 ^ k} := by
  sorry

/-- Layer 3.5: the Gowers norm is at most every directional box norm. -/
theorem gowersNorm_le_dirBoxNorm {k : ℕ} (hk : 1 ≤ k) (ν : Fin k → Measure G)
    (hν : ∀ i, IsProbabilityMeasure (ν i)) (f : G → ℂ) (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) :
    gowersNorm μ k f ≤ dirBoxNorm μ ν f := by
  sorry

end Gowers

/-! ### Layer 4: Fourier analysis, definiteness and cosets -/

section Fourier

/-- Layer 4.1: the Fourier identity for `U²` on a finite abelian group. -/
theorem gowersNorm_two_pow_four_finite {G : Type*} [AddCommGroup G] [Fintype G]
    [MeasurableSpace G] [DiscreteMeasurableSpace G] (f : G → ℂ) :
    gowersNorm (ProbabilityTheory.uniformOn (Set.univ : Set G)) 2 f ^ 4 =
      ∑ ψ : AddChar G ℂ, ‖Finset.univ.expect fun x ↦ f x * conj (ψ x)‖ ^ 4 := by
  sorry

variable {G : Type*} [AddCommGroup G] [TopologicalSpace G] [IsTopologicalAddGroup G]
  [CompactSpace G] [T2Space G] [SecondCountableTopology G] [MeasurableSpace G] [BorelSpace G]
  (μ : Measure G) [μ.IsAddHaarMeasure] [IsProbabilityMeasure μ]

/-- Layer 4.2: the Fourier identity for `U²` on a second-countable compact abelian group. -/
theorem gowersNorm_two_pow_four (f : G → ℂ) (hf : MemLp f 4 μ) :
    gowersNorm μ 2 f ^ 4 =
      ∑' ψ : {ψ : AddChar G Circle // Continuous ψ}, ‖∫ x, f x * conj (ψ.1 x : ℂ) ∂μ‖ ^ 4 := by
  sorry

/-- Layer 4.3: the Gowers norms of order at least two are definite on compact abelian groups. -/
theorem gowersNorm_eq_zero_iff {k : ℕ} (hk : 2 ≤ k) (f : G → ℂ)
    (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) :
    gowersNorm μ k f = 0 ↔ f =ᵐ[μ] 0 := by
  sorry

end Fourier

section Cosets

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]
  (μ : Measure G) [IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]

/-- Layer 4.4: restricting to a coset of a finite-index subgroup does not increase `U^k`. -/
theorem gowersNorm_mul_indicator_fiber_le {k : ℕ} (hk : 2 ≤ k) {H : Type*} [AddCommGroup H]
    [Fintype H] [MeasurableSpace H] [DiscreteMeasurableSpace H] (φ : G →+ H)
    (hφ : Measurable φ) (a : H) (f : G → ℂ) (hf : MemLp f (2 ^ k : ℝ≥0∞) μ) :
    gowersNorm μ k (f * (φ ⁻¹' {a}).indicator 1) ≤ gowersNorm μ k f := by
  sorry

end Cosets

/-! ### Layer 5: the generalised von Neumann theorem -/

section VonNeumann

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]

/-- The weighted count of `k`-term arithmetic progressions. -/
noncomputable def progressionCount (μ : Measure G) {k : ℕ} (f : Fin k → G → ℂ) : ℂ :=
  ∫ p : G × G, ∏ i, f i (p.1 + (i : ℕ) • p.2) ∂(μ.prod μ)

variable (μ : Measure G) [IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]

/-- **Generalised von Neumann theorem.** -/
theorem norm_progressionCount_le {k : ℕ} (hk : 2 ≤ k)
    (hmul : ∀ c : ℕ, 1 ≤ c → c < k → MeasurePreserving (fun x : G ↦ c • x) μ μ)
    (f : Fin k → G → ℂ) (hfm : ∀ i, Measurable (f i)) (hf : ∀ i x, ‖f i x‖ ≤ 1) (j : Fin k) :
    ‖progressionCount μ f‖ ≤ gowersNorm μ (k - 1) (f j) := by
  sorry

end VonNeumann

/-! ### Layer 6: Gowers norms relative to a finite set -/

section Relative

variable {A : Type*} [AddCommGroup A] [DecidableEq A]

/-- The `k`-dimensional cubes `(x, h)` with all vertices `x + ω · h` in `Q`. -/
def cubes (k : ℕ) (Q : Finset A) : Finset (A × (Fin k → A)) :=
  ((Q ×ˢ Fintype.piFinset fun _ : Fin k ↦ Q).filter fun p ↦
      ∀ ω : Fin k → Bool, p.1 + shift ω (fun i ↦ p.2 i - p.1) ∈ Q).image
    fun p ↦ (p.1, fun i ↦ p.2 i - p.1)

/-- The Gowers inner product relative to `Q`, normalised by the number of cubes of `Q`. -/
noncomputable def relGowersInner (k : ℕ) (Q : Finset A) (F : (Fin k → Bool) → A → ℂ) : ℂ :=
  (∑ p ∈ cubes k Q, ∏ ω, conjPow ω (F ω (p.1 + shift ω p.2))) / (cubes k Q).card

/-- The Gowers norm relative to `Q`. -/
noncomputable def relGowersNorm (k : ℕ) (Q : Finset A) (f : A → ℂ) : ℝ :=
  (relGowersInner k Q fun _ ↦ f).re ^ ((2 ^ k : ℝ)⁻¹)

/-- Layer 6.3: relative Gowers norms are invariant under Freiman isomorphisms of order 2. -/
theorem relGowersNorm_freimanIso {B : Type*} [AddCommGroup B] [DecidableEq B] (k : ℕ)
    (Q : Finset A) (R : Finset B) (φ : A → B) (hφ : IsAddFreimanIso 2 (Q : Set A) (R : Set B) φ)
    (g : B → ℂ) :
    relGowersNorm k R g = relGowersNorm k Q (g ∘ φ) := by
  sorry

/-- Layer 6.3: every finite subset of an abelian group has a finite model. -/
theorem exists_freimanIso_finite {A : Type u} [AddCommGroup A] (Q : Finset A) :
    ∃ (B : Type u) (_ : AddCommGroup B) (_ : Fintype B) (φ : A → B),
      IsAddFreimanIso 2 (Q : Set A) (φ '' Q) φ := by
  sorry

/-- Layer 6.2: comparison with the ambient Gowers norm on a finite group. -/
theorem gowersNorm_indicator_pow {G : Type*} [AddCommGroup G] [Fintype G] [DecidableEq G]
    [MeasurableSpace G] [DiscreteMeasurableSpace G] {k : ℕ} (hk : 1 ≤ k) (Q : Finset G)
    (f : G → ℂ) :
    gowersNorm (ProbabilityTheory.uniformOn (Set.univ : Set G)) k ((Q : Set G).indicator f) ^
        2 ^ k =
      (cubes k Q).card / (Fintype.card G : ℝ) ^ (k + 1) * relGowersNorm k Q f ^ 2 ^ k := by
  sorry

end Relative

/-! ### Layer 7: concatenation -/

section Concatenation

variable {G : Type u} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]

open Classical in
/-- The weight of the pairs `(i, j)` whose concatenated direction is not `μ`. -/
noncomputable def badPairMass (μ : Measure G) {ι : Type*} [Fintype ι] (w : ι → ℝ)
    (H : ι → Measure G) : ℝ :=
  ∑ i, ∑ j, if H j ∗ (H i).neg = μ then 0 else w i * w j

variable (μ : Measure G) [IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]

/-- Layer 7.1: one concatenation step (Kravitz–Kuca–Leng, Lemma 6.1, with `B = G`). -/
theorem concat_step {ι : Type*} [Fintype ι] (w : ι → ℝ) (hw0 : ∀ i, 0 ≤ w i)
    (hw1 : ∑ i, w i = 1) {s : ℕ} (H : ι → Measure G) (K : ι → Fin s → Measure G)
    (hH : ∀ i, IsProbabilityMeasure (H i)) (hK : ∀ i j, IsProbabilityMeasure (K i j))
    (f : G → ℂ) (hfm : Measurable f) (hf : ∀ x, ‖f x‖ ≤ 1) {δ : ℝ} (hδ : 0 ≤ δ)
    (hyp : δ ≤ ∑ i, w i * dirBoxNorm μ (Fin.snoc (α := fun _ ↦ Measure G) (K i) (H i)) f ^
      2 ^ (s + 1)) :
    δ ^ 2 ^ (2 * s + 1) ≤ ∑ i, ∑ j, w i * w j *
      dirBoxNorm μ (Fin.snoc (α := fun _ ↦ Measure G) (Fin.append (K i) (K j))
        (H j ∗ (H i).neg)) f ^ 2 ^ (2 * s + 1) := by
  sorry

/-- Layer 7.3: concatenation of box norms along many directions, with constants depending only
on `k`. -/
theorem concatenation (k : ℕ) (hk : 1 ≤ k) :
    ∃ N C : ℕ, 1 ≤ N ∧ ∀ {G : Type u} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G]
      [MeasurableNeg G] (μ : Measure G) [IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]
      {ι : Type} [Fintype ι] (w : ι → ℝ), (∀ i, 0 ≤ w i) → ∑ i, w i = 1 →
      ∀ (H : ι → Measure G), (∀ i, IsProbabilityMeasure (H i)) →
      ∀ f : G → ℂ, Measurable f → (∀ x, ‖f x‖ ≤ 1) →
      (∑ i, w i * dirBoxNorm μ (fun _ : Fin k ↦ H i) f ^ 2 ^ k) ^ N - C * badPairMass μ w H ≤
        gowersNorm μ (2 ^ k - 1) f ^ 2 ^ (2 ^ k - 1) := by
  sorry

end Concatenation

end TauCetiRoadmap.GowersUniformityNorms
