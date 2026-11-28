/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Quantitative equidistribution and factorisation of polynomial nilsequences: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's key definitions and headline theorems, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. Each is statable against the pinned Mathlib, with `sorry`, and
every definition has its real body.

The headline statements are:

* Layer 0: binomial coefficients and smoothness norms of polynomial phases on `ℤ^ℓ`, slow
  variation, the multiparameter Vinogradov lemma, and Weyl's theorem for Lipschitz functions on
  tori;
* Layer 1: the refined bracket polynomial lemma;
* Layer 2: equidistribution at a scale, smooth and rational sequences, products of smooth
  sequences;
* Layer 3: Leng's efficient equidistribution theorem and the quantitative Leibman theorem;
* Layer 4: the factorisation along a central frequency and the Green–Tao factorisation theorem.

Not stated here: the progressions in lattice points of convex bodies (README 1.1), the
normalisations, character factorisations and Leibman-square bounds of README 2.3–2.6, the
Ratner-type decomposition (README 4.4) and the transfer statements of README 4.5.

The first section prototypes objects of the roadmaps NilmanifoldsAndNilsequences (filtrations,
polynomial maps, Mal'cev presentations, metrics) and PolynomialOrbitsAndCubeGroups (horizontal
characters), in the shapes of their `Suggested.lean` files. They are written out only so that the
signatures below elaborate; those roadmaps' declarations replace them.

Conventions: boxes are `[N⃗] = ∏ i, {0, …, N i - 1}`; `‖x‖` on `UnitAddCircle` is the distance
to the nearest integer; a function on `G/Γ` is a function on `G ⧸ Γ`, its Lipschitz condition
read through representatives with the quotient metric `nilDist`; an *efficient bound* is
`(M/δ)^(C d^E)` with `C`, `E` depending only on the degree `s` and the number `ℓ` of parameters.
-/

open MeasureTheory MvPolynomial
open scoped commutatorElement

namespace TauCetiRoadmap.NilsequenceEquidistribution

/-! ### Prototypes of supplier objects -/

section Supplier

/-- An `I`-filtration of a group (NilmanifoldsAndNilsequences 0.1). -/
structure GroupFiltration (I G : Type*) [AddCommMonoid I] [PartialOrder I] [Group G] where
  /-- The layer `G_i`. -/
  layer : I → Subgroup G
  antitone : Antitone layer
  commutator_le : ∀ i j, ⁅layer i, layer j⁆ ≤ layer (i + j)

/-- An `I`-filtration of an additive commutative group (NilmanifoldsAndNilsequences 0.1). -/
structure AddGroupFiltration (I H : Type*) [AddCommMonoid I] [PartialOrder I]
    [AddCommGroup H] where
  /-- The layer `H_i`. -/
  layer : I → AddSubgroup H
  antitone : Antitone layer

variable {I G H : Type*} [AddCommMonoid I] [PartialOrder I] [Group G] [AddCommGroup H]

/-- The derivative `∂_h g n = g (n + h) * (g n)⁻¹`. -/
def deriv (h : H) (g : H → G) : H → G := fun n => g (n + h) * (g n)⁻¹

/-- Iterated derivatives, applied right to left. -/
def iterDeriv (g : H → G) : List H → H → G
  | [] => g
  | h :: l => deriv h (iterDeriv g l)

/-- Polynomial maps between filtered groups (NilmanifoldsAndNilsequences 0.2). -/
def IsPolynomialMap (HF : AddGroupFiltration I H) (GF : GroupFiltration I G) (g : H → G) :
    Prop :=
  ∀ l : List (I × H), (∀ p ∈ l, p.2 ∈ HF.layer p.1) → ∀ n ∈ HF.layer 0,
    iterDeriv g (l.map Prod.snd) n ∈ GF.layer (l.map Prod.fst).sum

/-- The weighted filtration of `ℤ^σ`; `w = 1` is the degree filtration. -/
def weightedFiltration {σ : Type*} [DecidableEq σ] (w : σ → ℕ) :
    AddGroupFiltration ℕ (σ → ℤ) where
  layer i := if i = 0 then ⊤ else AddSubgroup.closure {x | ∃ a, i ≤ w a ∧ x = Pi.single a 1}
  antitone := sorry

/-- A Mal'cev presentation of degree `s` and dimension `d` (NilmanifoldsAndNilsequences 2.4). -/
structure MalcevPresentation (G : Type*) [Group G] [TopologicalSpace G] (d s : ℕ) where
  /-- The Mal'cev coordinate map `ψ`. -/
  coord : G ≃ₜ (Fin d → ℝ)
  /-- The filtration `G_•`. -/
  filtration : GroupFiltration ℕ G
  /-- The weight of each coordinate. -/
  weight : Fin d → ℕ
  weight_mono : Monotone weight
  one_le_weight : ∀ l, 1 ≤ weight l
  weight_le : ∀ l, weight l ≤ s
  layer_eq : ∀ i, (filtration.layer i : Set G) = coord ⁻¹' {t | ∀ l, weight l < i → t l = 0}
  /-- The lattice `Γ`. -/
  lattice : Subgroup G
  mem_lattice : ∀ x, x ∈ lattice ↔ ∀ l, ∃ z : ℤ, coord x l = z
  /-- The product polynomials `P_l`. -/
  mulPoly : Fin d → MvPolynomial (Fin 2 × Fin d) ℚ
  coord_mul : ∀ x y l, coord (x * y) l =
    aeval (fun v : Fin 2 × Fin d => (![coord x, coord y] v.1) v.2) (mulPoly l)
  weightedTotalDegree_le : ∀ l,
    (mulPoly l).weightedTotalDegree (fun v : Fin 2 × Fin d => weight v.2) ≤ weight l
  triangular : ∀ l, ∀ v ∈ (mulPoly l - X (0, l) - X (1, l)).vars, v.2 < l

namespace MalcevPresentation

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ} (P : MalcevPresentation G d s)

/-- Complexity at most `M`. -/
def ComplexityLE (M : ℕ) : Prop :=
  ∀ l m, Height.mulHeight₁ ((P.mulPoly l).coeff m) ≤ M

end MalcevPresentation

/-- The cost of the chain `x, l₁, …, l_k, y`. -/
noncomputable def chainCost (ν : G → ℝ) (x : G) (l : List G) (y : G) : ℝ :=
  (((x :: l).zip (l ++ [y])).map fun p => min (ν (p.1 * p.2⁻¹)) (ν (p.2 * p.1⁻¹))).sum

/-- The chain distance (NilmanifoldsAndNilsequences 3.1). -/
noncomputable def chainDist (ν : G → ℝ) (x y : G) : ℝ :=
  ⨅ l : List G, chainCost ν x l y

namespace MalcevPresentation

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ} (P : MalcevPresentation G d s)

/-- The Green–Tao metric on `G` (NilmanifoldsAndNilsequences 3.2). -/
noncomputable def malcevDist (x y : G) : ℝ :=
  chainDist (fun g => ‖P.coord g‖) x y

/-- The quotient metric, as a function on `G` (NilmanifoldsAndNilsequences 3.3). -/
noncomputable def nilDist (x y : G) : ℝ :=
  ⨅ γ : P.lattice, P.malcevDist x (y * γ)

end MalcevPresentation

/-- A horizontal character: continuous, trivial on `Γ` (PolynomialOrbitsAndCubeGroups). -/
def IsHorizontalCharacter [TopologicalSpace G] (Γ : Subgroup G)
    (η : G →* Multiplicative UnitAddCircle) : Prop :=
  Continuous η ∧ ∀ γ ∈ Γ, η γ = 1

end Supplier

/-! ### Layer 0: polynomial phases at a single scale -/

section Layer0

variable {ℓ : ℕ}

/-- The box `[N⃗] = ∏ i, {0, …, N i - 1}` in `ℤ^ℓ` (README Convention 2). -/
def box (N : Fin ℓ → ℕ) : Finset (Fin ℓ → ℤ) :=
  Fintype.piFinset fun i => Finset.Ico 0 (N i : ℤ)

/-- The multi-binomial coefficient `binom(n, j) = ∏ i, Ring.choose (n i) (j i)`. -/
def multiChoose (n : Fin ℓ → ℤ) (j : Fin ℓ → ℕ) : ℤ :=
  ∏ i, Ring.choose (n i) (j i)

/-- The polynomial phase `n ↦ Σ_j binom(n, j) α_j` of degree at most `s` in each variable
(README 0.1; GT, Definition 8.1). -/
def binomPhase (s : ℕ) (α : (Fin ℓ → Fin (s + 1)) → UnitAddCircle) (n : Fin ℓ → ℤ) :
    UnitAddCircle :=
  ∑ j, multiChoose n (fun i => (j i : ℕ)) • α j

/-- The smoothness norm `max_{j ≠ 0} N⃗^j ‖α_j‖` of a coefficient family (README 0.1; GT,
Definition 8.2; LSS, Definition 3.15). -/
noncomputable def cInftyNorm {s : ℕ} (N : Fin ℓ → ℕ) (α : (Fin ℓ → Fin (s + 1)) → UnitAddCircle) :
    ℝ :=
  ⨆ j : Fin ℓ → Fin (s + 1), if j = 0 then 0 else (∏ i, (N i : ℝ) ^ (j i : ℕ)) * ‖α j‖

/-- Taylor coefficients are unique (README 0.1). -/
theorem binomPhase_injective (s : ℕ) : Function.Injective (binomPhase (ℓ := ℓ) s) := by
  sorry

/-- **Smooth polynomials vary slowly** (GT, Lemmas 2.8 and 8.3; README 0.1). -/
theorem norm_binomPhase_sub_le (ℓ s : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (N : Fin ℓ → ℕ) (α : (Fin ℓ → Fin (s + 1)) → UnitAddCircle),
      ∀ n ∈ box N, ∀ i, ‖binomPhase s α (n + Pi.single i 1) - binomPhase s α n‖ ≤
        C * cInftyNorm N α / N i := by
  sorry

/-- **Recurrence forces structure** (README 0.2; GT, Lemma 4.5; Leng, Lemma A.11), with the
lower bound on the side lengths that the statement needs. -/
theorem exists_mul_cInftyNorm_le_of_many_small (ℓ s : ℕ) :
    ∃ C E : ℝ, 0 < C ∧ ∀ (N : Fin ℓ → ℕ) (α : (Fin ℓ → Fin (s + 1)) → UnitAddCircle) (ε δ : ℝ),
      0 < δ → δ ≤ 1 → 0 ≤ ε → ε < δ / 10 → (∀ i, C * δ ^ (-E) ≤ N i) →
      δ * (box N).card ≤ ((box N).filter fun n => ‖binomPhase s α n‖ ≤ ε).card →
      ∃ q : ℕ, 0 < q ∧ (q : ℝ) ≤ C * δ ^ (-E) ∧ cInftyNorm N (q • α) ≤ C * δ ^ (-E) * ε ∧
        ‖q • α 0‖ ≤ C * δ ^ (-E) * ε := by
  sorry

/-- **Weyl's theorem for Lipschitz functions on tori at a single scale** (README 0.4; GT,
Propositions 3.1 and 4.3, multiparameter and torus-valued). -/
theorem exists_frequency_of_not_equidistributed_torus (ℓ s : ℕ) :
    ∃ C E : ℕ, ∀ (m : ℕ) (N : Fin ℓ → ℕ) (α : Fin m → (Fin ℓ → Fin (s + 1)) → UnitAddCircle)
      (F : UnitAddTorus (Fin m) → ℂ) (A L δ : ℝ), 0 < δ → δ < 1 / 2 → (∀ i, 1 ≤ N i) →
      (∀ x, ‖F x‖ ≤ A) → (∀ x y, ‖F x - F y‖ ≤ L * dist x y) →
      δ * (A + L) < ‖((box N).card : ℂ)⁻¹ *
          ∑ n ∈ box N, F (fun k => binomPhase s (α k) n) - ∫ x, F x‖ →
      (∃ i, (N i : ℝ) ≤ (1 / δ) ^ (C * m ^ E)) ∨
        ∃ k : Fin m → ℤ, k ≠ 0 ∧ (‖k‖ : ℝ) ≤ (1 / δ) ^ (C * m ^ E) ∧
          cInftyNorm N (∑ r, k r • α r) ≤ (1 / δ) ^ (C * m ^ E) := by
  sorry

end Layer0

/-! ### Layer 1: the refined bracket polynomial lemma -/

section Layer1

/-- The signed fractional part `{x} = x - ⌈x - 1/2⌉ ∈ (-1/2, 1/2]` (README Convention 5). -/
noncomputable def signedFract (x : ℝ) : ℝ := x - ⌈x - 1 / 2⌉

/-- **The refined bracket polynomial lemma** (Leng, Lemma 3.1; README 1.2). -/
theorem refined_bracket_polynomial (d : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (N : ℕ) (δ M K β : ℝ) (α a : Fin d → ℝ),
      0 < δ → δ < 1 / 10 → 1 ≤ M → 2 ≤ K → 2 ≤ N → (∀ i, |a i| ≤ M) →
      δ * N ≤ ((Finset.range N).filter fun h : ℕ =>
        ‖((β + ∑ i, a i * signedFract (α i * h) : ℝ) : UnitAddCircle)‖ < K / N).card →
      (N : ℝ) ≤ C * (δ / ((d : ℝ) ^ d * M)) ^ (-C) ∨ 1 / 100 < K / N ∨
        ∃ (r : ℕ) (hr : r ≤ d) (w : Fin r → Fin d → ℤ) (η : Fin (d - r) → Fin d → ℤ),
          LinearIndependent ℤ w ∧ LinearIndependent ℤ η ∧
          (∏ i, (‖w i‖ : ℝ)) ≤ C * (δ / ((d : ℝ) ^ d * M)) ^ (-C) ∧
          (∀ j, (‖η j‖ : ℝ) ≤ C * (δ / ((d : ℝ) ^ d * M)) ^ (-C)) ∧
          (∀ i j, ∑ k, w i k * η j k = 0) ∧
          (∀ j, ‖((∑ k, (η j k : ℝ) * α k : ℝ) : UnitAddCircle)‖ ≤
            C * (δ / M) ^ (-C) * (d : ℝ) ^ (C * d) * K / N) ∧
          ∀ i, |∑ k, (w i k : ℝ) * a k| ≤ C * (δ / M) ^ (-C) * (d : ℝ) ^ (C * d) * K / N := by
  sorry

end Layer1

/-! ### Layer 2: quantitative notions on nilmanifolds -/

section Layer2

variable {G : Type*} [Group G] [TopologicalSpace G] {d s ℓ : ℕ}
  (P : MalcevPresentation G d s)

/-- `(g(n)Γ)_{n ∈ S}` is `δ`-equidistributed for `μ` (README 2.1; GT, Definitions 1.2 (iii) and
8.5): for every `F` with `‖F‖_∞ ≤ A` and Lipschitz constant `L`, the average misses the integral
by at most `δ (A + L)`. -/
def IsEquidistributedOn [MeasurableSpace (G ⧸ P.lattice)] (μ : Measure (G ⧸ P.lattice))
    (g : (Fin ℓ → ℤ) → G)
    (S : Finset (Fin ℓ → ℤ)) (δ : ℝ) : Prop :=
  ∀ (F : G ⧸ P.lattice → ℂ) (A L : ℝ), (∀ x, ‖F x‖ ≤ A) →
    (∀ x y : G, ‖F x - F y‖ ≤ L * P.nilDist x y) →
    ‖(S.card : ℂ)⁻¹ * ∑ n ∈ S, F (g n : G ⧸ P.lattice) - ∫ x, F x ∂μ‖ ≤ δ * (A + L)

/-- The arithmetic progression `{a + b k | k < m}` in `ℤ`. -/
def arithProg (a b : ℤ) (m : ℕ) : Finset ℤ :=
  (Finset.range m).image fun k : ℕ => a + b * (k : ℤ)

/-- Total `δ`-equidistribution on a box (README 2.1; GT, Definitions 1.2 (iv) and 8.5). -/
def IsTotallyEquidistributed [MeasurableSpace (G ⧸ P.lattice)] (μ : Measure (G ⧸ P.lattice))
    (g : (Fin ℓ → ℤ) → G)
    (N : Fin ℓ → ℕ) (δ : ℝ) : Prop :=
  ∀ (a b : Fin ℓ → ℤ) (m : Fin ℓ → ℕ), (∀ i, 1 ≤ b i) → (∀ i, δ * N i ≤ m i) →
    (∀ i, arithProg (a i) (b i) (m i) ⊆ Finset.Ico 0 (N i : ℤ)) →
    IsEquidistributedOn P μ g (Fintype.piFinset fun i => arithProg (a i) (b i) (m i)) δ

/-- `(K, N⃗)`-smooth sequences (README 2.2; LSS, Definition 3.16; Leng, Definition 2.6). -/
def IsSmooth (K : ℝ) (N : Fin ℓ → ℕ) (ε : (Fin ℓ → ℤ) → G) : Prop :=
  P.malcevDist (ε 0) 1 ≤ K ∧ ∀ n ∈ box N, ∀ i, P.malcevDist (ε (n + Pi.single i 1)) (ε n) ≤ K / N i

/-- `Q`-rational sequences: one denominator `q ≤ Q` for all coordinates of all values (README 2.2;
LSS, Definition 3.16). -/
def IsRationalSeq (Q : ℕ) (γ : (Fin ℓ → ℤ) → G) : Prop :=
  ∃ q : ℕ, 1 ≤ q ∧ q ≤ Q ∧ ∀ n l, ∃ z : ℤ, (q : ℝ) * P.coord (γ n) l = z

/-- **Products of smooth sequences are smooth** (GT, Lemma 10.1; README 2.2). -/
theorem IsSmooth.mul (d s ℓ : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M : ℕ) (K : ℝ) (N : Fin ℓ → ℕ) (ε₁ ε₂ : (Fin ℓ → ℤ) → G), 2 ≤ M → 1 ≤ K →
      P.ComplexityLE M → IsSmooth P K N ε₁ → IsSmooth P K N ε₂ →
      IsSmooth P (((M : ℝ) * K) ^ (C * d ^ E)) N (ε₁ * ε₂) := by
  sorry

/-- The size bound `|η| ≤ B` of a horizontal character: `η = k · ψ mod 1` with `‖k‖ ≤ B`
(README Convention 6; GT, Definition 2.6). -/
def HorizSizeLE (η : G →* Multiplicative UnitAddCircle) (B : ℝ) : Prop :=
  ∃ k : Fin d → ℤ, (‖k‖ : ℝ) ≤ B ∧
    ∀ x, (η x).toAdd = ((∑ l, (k l : ℝ) * P.coord x l : ℝ) : UnitAddCircle)

/-- `η ∘ g` is a polynomial phase of smoothness norm at most `B` on the box `[N⃗]`. -/
def SmoothNormLE (s : ℕ) (η : G →* Multiplicative UnitAddCircle) (g : (Fin ℓ → ℤ) → G)
    (N : Fin ℓ → ℕ) (B : ℝ) : Prop :=
  ∃ α : (Fin ℓ → Fin (s + 1)) → UnitAddCircle,
    (∀ n, (η (g n)).toAdd = binomPhase s α n) ∧ cInftyNorm N α ≤ B

end Layer2

/-! ### Layer 3: efficient equidistribution -/

section Layer3

/-- The left-normed commutator `[[[w₀, w₁], w₂], …]` of a nonempty list. -/
def leftNormedComm {G : Type*} [Group G] : List G → G
  | [] => 1
  | w :: l => l.foldl (fun a b => ⁅a, b⁆) w

/-- **Leng's efficient equidistribution theorem** (Leng, Theorem 4 of arXiv:2312.10772v5;
LSS, Theorem 5.2; README 3.1). `ξ` is a `G_(t)`-vertical frequency, given as a function on `G`
that is additive on `G_(t) = (⊤ : Subgroup G).lowerCentralSeries (t - 1)`. -/
theorem exists_horizontalCharacters_of_verticalFrequency (s ℓ : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] {d : ℕ}
      (P : MalcevPresentation G d s) (M : ℕ) (δ : ℝ) (t : ℕ) (N : Fin ℓ → ℕ)
      (g : (Fin ℓ → ℤ) → G) (F : G ⧸ P.lattice → ℂ) (ξ : G → ℝ),
      2 ≤ M → P.ComplexityLE M → 0 < δ → δ < 1 / 10 → 1 ≤ t →
      (⊤ : Subgroup G).lowerCentralSeries t = ⊥ →
      IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration g →
      (∀ x, ‖F x‖ ≤ M) → (∀ x y : G, ‖F x - F y‖ ≤ M * P.nilDist x y) →
      Continuous ξ →
      (∀ u ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1),
        ∀ v ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1), ξ (u * v) = ξ u + ξ v) →
      (∀ u ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1), u ∈ P.lattice → ∃ z : ℤ, ξ u = z) →
      (∃ u ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1), ξ u ≠ 0) →
      (∀ u ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1),
        ∀ v ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1),
        ‖((ξ u - ξ v : ℝ) : UnitAddCircle)‖ ≤ M / δ * P.nilDist u v) →
      (∀ u ∈ (⊤ : Subgroup G).lowerCentralSeries (t - 1), ∀ x : G,
        F (u * x : G) = Complex.exp (2 * Real.pi * Complex.I * ξ u) * F x) →
      δ ≤ ‖((box N).card : ℂ)⁻¹ * ∑ n ∈ box N, F (g n : G ⧸ P.lattice)‖ →
      (∃ i, (N i : ℝ) ≤ ((M : ℝ) / δ) ^ (C * d ^ E)) ∨
        ∃ (r : ℕ) (η : Fin r → G →* Multiplicative UnitAddCircle), 1 ≤ r ∧
          (∀ j, IsHorizontalCharacter P.lattice (η j) ∧
            HorizSizeLE P (η j) (((M : ℝ) / δ) ^ (C * d ^ E)) ∧
            SmoothNormLE s (η j) g N (((M : ℝ) / δ) ^ (C * d ^ E))) ∧
          ∀ w : Fin t → G, (∀ i j, η j (w i) = 1) → ξ (leftNormedComm (List.ofFn w)) = 0 := by
  sorry

/-- **The quantitative Leibman theorem** with efficient bounds (GT, Theorems 1.16, 2.9 and 8.6;
README 3.2): an orbit that is not `δ`-equidistributed on a box has a nontrivial horizontal
character of efficient size whose phase has efficiently bounded smoothness norm, unless some
side of the box is short. It makes PolynomialOrbitsAndCubeGroups'
`exists_finset_horizontalCharacter_of_discrepancy` explicit for Lipschitz test functions. -/
theorem exists_horizontalCharacter_of_not_equidistributed (s ℓ : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] {d : ℕ}
      (P : MalcevPresentation G d s) [MeasurableSpace (G ⧸ P.lattice)]
      [BorelSpace (G ⧸ P.lattice)] (μ : Measure (G ⧸ P.lattice)) [IsProbabilityMeasure μ]
      [SMulInvariantMeasure G (G ⧸ P.lattice) μ]
      (M : ℕ) (δ : ℝ) (N : Fin ℓ → ℕ) (g : (Fin ℓ → ℤ) → G),
      2 ≤ M → P.ComplexityLE M → 0 < δ → δ < 1 / 2 → (∀ i, 1 ≤ N i) →
      IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration g →
      ¬ IsEquidistributedOn P μ g (box N) δ →
      (∃ i, (N i : ℝ) ≤ ((M : ℝ) / δ) ^ (C * d ^ E)) ∨
        ∃ η : G →* Multiplicative UnitAddCircle, η ≠ 1 ∧ IsHorizontalCharacter P.lattice η ∧
          HorizSizeLE P η (((M : ℝ) / δ) ^ (C * d ^ E)) ∧
          SmoothNormLE s η g N (((M : ℝ) / δ) ^ (C * d ^ E)) := by
  sorry

end Layer3

/-! ### Layer 4: factorisation theorems -/

section Layer4

/-- **Factorisation along a central frequency** (LSS, Theorem 5.4 and Corollary 5.5; README 4.1),
on cubes `[N]^ℓ`. `T` is a connected central subgroup, given by its coordinates; the frequency
`ξ` is additive on `T`, integral on `T ∩ Γ`, nonzero, and of size at most `M/δ` in the sense of
LSS, Definition 3.13. The output subgroup `H` is a closed
subgroup on which `ξ` vanishes on `H ∩ T`. The rationality of `T` and `H` relative to the Mal'cev
basis (README Convention 7) is part of the README statement and is not prototyped. -/
theorem exists_factorization_of_verticalFrequency (s ℓ : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] {d : ℕ}
      (P : MalcevPresentation G d s) (M : ℕ) (δ : ℝ) (N : ℕ) (T : Subgroup G)
      (g : (Fin ℓ → ℤ) → G) (F : G ⧸ P.lattice → ℂ) (ξ : G → ℝ),
      2 ≤ M → P.ComplexityLE M → 0 < δ → δ < 1 / 10 →
      ((M : ℝ) / δ) ^ (C * d ^ E) ≤ N → T ≤ Subgroup.center G →
      IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration g →
      (∀ x, ‖F x‖ ≤ M) → (∀ x y : G, ‖F x - F y‖ ≤ M * P.nilDist x y) →
      (∀ u ∈ T, ∀ v ∈ T, ξ (u * v) = ξ u + ξ v) →
      (∀ u ∈ T, u ∈ P.lattice → ∃ z : ℤ, ξ u = z) → (∃ u ∈ T, ξ u ≠ 0) →
      (∀ u ∈ T, ∀ v ∈ T, ‖((ξ u - ξ v : ℝ) : UnitAddCircle)‖ ≤ M / δ * P.nilDist u v) →
      (∀ u ∈ T, ∀ x : G, F (u * x : G) = Complex.exp (2 * Real.pi * Complex.I * ξ u) * F x) →
      δ ≤ ‖((box fun _ : Fin ℓ => N).card : ℂ)⁻¹ *
        ∑ n ∈ box (fun _ : Fin ℓ => N), F (g n : G ⧸ P.lattice)‖ →
      ∃ (ε g' γ : (Fin ℓ → ℤ) → G) (H : Subgroup G),
        g = ε * g' * γ ∧ IsClosed (H : Set G) ∧ (∀ u ∈ T, u ∈ H → ξ u = 0) ∧ (∀ n, g' n ∈ H) ∧
        IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration ε ∧
        IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration g' ∧
        IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration γ ∧
        IsSmooth P (((M : ℝ) / δ) ^ (C * d ^ E)) (fun _ => N) ε ∧
        IsRationalSeq P ⌈((M : ℝ) / δ) ^ (C * d ^ E)⌉₊ γ ∧
        (g 0 = 1 → ε 0 = 1 ∧ g' 0 = 1 ∧ γ 0 = 1) := by
  sorry

/-- **The Green–Tao factorisation theorem** (GT, Theorems 1.19 and 10.2; README 4.3). The
sub-nilmanifold is a closed subgroup `G'` carrying its own Mal'cev presentation `P'` with lattice
`Γ ∩ G'` and filtration `G_• ∩ G'`; `g'` is totally `M^(-A)`-equidistributed in `G' ⧸ Γ'` for
every invariant probability. For `ℓ ≥ 2` the side lengths are assumed at least `C M₀^E`. The
`M`-rationality of `G'` relative to the Mal'cev basis (README Convention 7) is part of the README
statement and is not prototyped. -/
theorem exists_factorization (s ℓ d : ℕ) (A : ℝ) (hA : 0 < A) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M₀ : ℕ) (N : Fin ℓ → ℕ) (g : (Fin ℓ → ℤ) → G),
      2 ≤ M₀ → P.ComplexityLE M₀ → (∀ i, 1 ≤ N i) → (2 ≤ ℓ → ∀ i, C * M₀ ^ E ≤ N i) →
      IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration g →
      ∃ (M : ℕ) (G' : Subgroup G) (d' : ℕ) (P' : MalcevPresentation G' d' s)
        (ε γ : (Fin ℓ → ℤ) → G) (g' : (Fin ℓ → ℤ) → G'),
        M₀ ≤ M ∧ M ≤ C * M₀ ^ E ∧ IsClosed (G' : Set G) ∧ P'.ComplexityLE M ∧
        (∀ x : G', x ∈ P'.lattice ↔ (x : G) ∈ P.lattice) ∧
        (∀ i (x : G'), x ∈ P'.filtration.layer i ↔ (x : G) ∈ P.filtration.layer i) ∧
        g = ε * (fun n => (g' n : G)) * γ ∧
        IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration ε ∧
        IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P'.filtration g' ∧
        IsPolynomialMap (weightedFiltration fun _ : Fin ℓ => 1) P.filtration γ ∧
        IsSmooth P M N ε ∧ IsRationalSeq P M γ ∧
        ∀ [MeasurableSpace (G' ⧸ P'.lattice)] [BorelSpace (G' ⧸ P'.lattice)]
          (μ' : Measure (G' ⧸ P'.lattice)),
          IsProbabilityMeasure μ' → SMulInvariantMeasure G' (G' ⧸ P'.lattice) μ' →
          IsTotallyEquidistributed P' μ' g' N ((M : ℝ) ^ (-A)) := by
  sorry

end Layer4

end TauCetiRoadmap.NilsequenceEquidistribution
