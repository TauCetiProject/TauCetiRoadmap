/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# The quasi-polynomial inverse theorem for the Gowers norms: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's key definitions and headline theorems, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. Each is statable against the pinned Mathlib, with `sorry`, and
every definition has its real body.

The headline statements are:

* Layer 0: every bounded function on `[N]` is a degree-1 nilsequence of complexity `O(N)`;
* Layer 1: equivalence of nilcharacters (degree filtration), its reflexivity and transitivity,
  and the transfer of correlations between equivalent nilcharacters;
* Layer 2: the converse inverse theorem on `[N]` and on `ZMod N`;
* Layer 3: graphs with many additive quadruples are bracket-linear on a dense subset;
* Layer 8: the quasi-polynomial inverse theorem on `[N]` and on `ZMod N`.

Not stated here: multidegree and degree–rank nilsequences and the results of Layers 1 and 4–7
that need them (splitting, multilinearisation, correlation structures, the sunflower and
linearisation steps, universal nilmanifolds), since the prototype of NilmanifoldsAndNilsequences
presents only `ℕ`-filtered nilmanifolds; and the symbol group of README 1.4.

The first section prototypes objects of the roadmaps GowersUniformityNorms (discrete cubes,
cubes in a finite set, relative Gowers norms), NilmanifoldsAndNilsequences (filtrations,
polynomial maps, Mal'cev presentations, the quotient metric, nilsequences, vertical frequencies)
and NilsequenceEquidistribution (the signed fractional part), copied from their `Suggested.lean`
files. They are written out only so that the signatures below
elaborate; those roadmaps' declarations replace them.

Conventions: `[N] = Finset.Ico 0 N` in `ℤ`; averages are written as sums divided by `N`; the
`U^k[N]` norm is `relGowersNorm k (interval N)`, and the `U^k(ℤ/N)` norm is
`relGowersNorm k Finset.univ`, which is the Gowers norm for the uniform measure; a nilsequence
of complexity `(M, d)` has dimension at most `d`, Mal'cev complexity at most `⌊M⌋₊` and an
`M`-bounded, `M`-Lipschitz function; `L = log (1/δ)`; constants depend only on `s`.
-/

open scoped ComplexConjugate

namespace TauCetiRoadmap.GowersInverseTheorem

/-! ### Prototypes of supplier objects -/

section Supplier

/-! GowersUniformityNorms, Layers 0 and 6. -/

namespace DiscreteCube

variable {k : ℕ}

/-- The number of coordinates of `ω` equal to `true`. -/
def weight (ω : Fin k → Bool) : ℕ := (Finset.univ.filter fun i ↦ ω i = true).card

/-- Conjugate `z` if the weight of `ω` is odd. -/
def conjPow (ω : Fin k → Bool) (z : ℂ) : ℂ := if Even (weight ω) then z else conj z

/-- `ω · h`: the sum of the `h i` over the coordinates where `ω` is `true`. -/
def shift {G : Type*} [AddCommMonoid G] (ω : Fin k → Bool) (h : Fin k → G) : G :=
  ∑ i, if ω i then h i else 0

end DiscreteCube

open DiscreteCube

variable {A : Type*} [AddCommGroup A] [DecidableEq A]

/-- The `k`-dimensional cubes `(x, h)` with all vertices `x + ω · h` in `Q`
(GowersUniformityNorms 6.1). -/
def cubes (k : ℕ) (Q : Finset A) : Finset (A × (Fin k → A)) :=
  ((Q ×ˢ Fintype.piFinset fun _ : Fin k ↦ Q).filter fun p ↦
      ∀ ω : Fin k → Bool, p.1 + shift ω (fun i ↦ p.2 i - p.1) ∈ Q).image
    fun p ↦ (p.1, fun i ↦ p.2 i - p.1)

/-- The Gowers inner product relative to `Q`, normalised by the number of cubes of `Q`. -/
noncomputable def relGowersInner (k : ℕ) (Q : Finset A) (F : (Fin k → Bool) → A → ℂ) : ℂ :=
  (∑ p ∈ cubes k Q, ∏ ω, conjPow ω (F ω (p.1 + shift ω p.2))) / (cubes k Q).card

/-- The Gowers norm relative to `Q` (GowersUniformityNorms 6.2). -/
noncomputable def relGowersNorm (k : ℕ) (Q : Finset A) (f : A → ℂ) : ℝ :=
  (relGowersInner k Q fun _ ↦ f).re ^ ((2 ^ k : ℝ)⁻¹)

/-! NilmanifoldsAndNilsequences, Layers 0, 2, 3 and 5. -/

/-- An `I`-filtration of a group (GTZ, Definition 6.8). -/
structure GroupFiltration (I G : Type*) [AddCommMonoid I] [PartialOrder I] [Group G] where
  /-- The layer `G_i`. -/
  layer : I → Subgroup G
  antitone : Antitone layer
  commutator_le : ∀ i j, ⁅layer i, layer j⁆ ≤ layer (i + j)

/-- An `I`-filtration of an additive commutative group. -/
structure AddGroupFiltration (I H : Type*) [AddCommMonoid I] [PartialOrder I]
    [AddCommGroup H] where
  /-- The layer `H_i`. -/
  layer : I → AddSubgroup H
  antitone : Antitone layer

section Poly

variable {I G H : Type*} [AddCommMonoid I] [PartialOrder I] [Group G] [AddCommGroup H]

/-- The derivative `∂_h g n = g (n + h) * (g n)⁻¹`. -/
def deriv (h : H) (g : H → G) : H → G := fun n => g (n + h) * (g n)⁻¹

/-- Iterated derivatives, applied right to left. -/
def iterDeriv (g : H → G) : List H → H → G
  | [] => g
  | h :: l => deriv h (iterDeriv g l)

/-- Polynomial maps between filtered groups (GTZ, Definitions 6.18 and B.1). -/
def IsPolynomialMap (HF : AddGroupFiltration I H) (GF : GroupFiltration I G) (g : H → G) :
    Prop :=
  ∀ l : List (I × H), (∀ p ∈ l, p.2 ∈ HF.layer p.1) → ∀ n ∈ HF.layer 0,
    iterDeriv g (l.map Prod.snd) n ∈ GF.layer (l.map Prod.fst).sum

end Poly

/-- The weighted filtration of `ℤ^σ`; `w = 1` is the degree filtration. -/
def weightedFiltration {σ : Type*} [DecidableEq σ] (w : σ → ℕ) :
    AddGroupFiltration ℕ (σ → ℤ) where
  layer i := if i = 0 then ⊤ else AddSubgroup.closure {x | ∃ a, i ≤ w a ∧ x = Pi.single a 1}
  antitone := sorry

/-- A Mal'cev presentation of a filtered nilmanifold of dimension `d` and degree `s`
(NilmanifoldsAndNilsequences 2.4). -/
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
  /-- The product polynomials. -/
  mulPoly : Fin d → MvPolynomial (Fin 2 × Fin d) ℚ
  coord_mul : ∀ x y l, coord (x * y) l =
    MvPolynomial.aeval (fun v : Fin 2 × Fin d => (![coord x, coord y] v.1) v.2) (mulPoly l)
  weightedTotalDegree_le : ∀ l,
    (mulPoly l).weightedTotalDegree (fun v : Fin 2 × Fin d => weight v.2) ≤ weight l
  triangular : ∀ l, ∀ v ∈ (mulPoly l - MvPolynomial.X (0, l) - MvPolynomial.X (1, l)).vars,
    v.2 < l

namespace MalcevPresentation

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ} (P : MalcevPresentation G d s)

/-- Complexity at most `M`: every coefficient of every product polynomial has height at most
`M`. -/
def ComplexityLE (M : ℕ) : Prop :=
  ∀ l m, Height.mulHeight₁ ((P.mulPoly l).coeff m) ≤ M

/-- The cost of a chain `x, l₁, …, l_k, y` for a size function `ν`. -/
noncomputable def chainCost (ν : G → ℝ) (x : G) (l : List G) (y : G) : ℝ :=
  (((x :: l).zip (l ++ [y])).map fun p => min (ν (p.1 * p.2⁻¹)) (ν (p.2 * p.1⁻¹))).sum

/-- The Green–Tao metric on `G` (NilmanifoldsAndNilsequences 3.2). -/
noncomputable def malcevDist (x y : G) : ℝ :=
  ⨅ l : List G, chainCost (fun g => ‖P.coord g‖) x l y

/-- The quotient metric on `G/Γ`, as a function on `G` (NilmanifoldsAndNilsequences 3.3). -/
noncomputable def nilDist (x y : G) : ℝ :=
  ⨅ γ : P.lattice, P.malcevDist x (y * γ)

end MalcevPresentation

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ}

/-- `f` is a nilsequence on `ℤ^σ` on the presented nilmanifold, with function bounded by `K` and
`K`-Lipschitz (NilmanifoldsAndNilsequences 5.1). -/
def IsNilsequence (P : MalcevPresentation G d s) {σ : Type*} [DecidableEq σ] (w : σ → ℕ)
    (K : ℝ) (f : (σ → ℤ) → ℂ) : Prop :=
  ∃ g : (σ → ℤ) → G, IsPolynomialMap (weightedFiltration w) P.filtration g ∧
    ∃ F : G → ℂ, (∀ x (γ : P.lattice), F (x * γ) = F x) ∧ (∀ x, ‖F x‖ ≤ K) ∧
      (∀ x y, ‖F x - F y‖ ≤ K * P.nilDist x y) ∧ ∀ n, f n = F (g n)

/-- `F` has vertical frequency `k` (NilmanifoldsAndNilsequences 4.4). -/
def HasVerticalFrequency (P : MalcevPresentation G d s) (F : G → ℂ) (k : Fin d → ℤ) : Prop :=
  ∀ u ∈ P.filtration.layer s, ∀ x,
    F (u * x) = Complex.exp (2 * Real.pi * Complex.I * ∑ l, (k l : ℂ) * (P.coord u l : ℂ)) * F x

/-! NilsequenceEquidistribution, Convention 5. -/

/-- The signed fractional part `{x} = x - ⌈x - 1/2⌉ ∈ (-1/2, 1/2]`. -/
noncomputable def signedFract (x : ℝ) : ℝ := x - ⌈x - 1 / 2⌉

end Supplier

/-! ### Conventions of this roadmap -/

section Conventions

/-- The interval `[N] = {0, …, N - 1}` in `ℤ` (README Convention 1). -/
def interval (N : ℕ) : Finset ℤ := Finset.Ico 0 N

/-- A presented nilmanifold of dimension `d` and degree `s`, bundled with its carrier. -/
structure PresentedNilmanifold (d s : ℕ) where
  /-- The group `G`. -/
  carrier : Type
  [group : Group carrier]
  [topology : TopologicalSpace carrier]
  /-- The Mal'cev presentation. -/
  pres : MalcevPresentation carrier d s

attribute [instance] PresentedNilmanifold.group PresentedNilmanifold.topology

/-- `ψ` is a nilsequence on `ℤ^σ` of degree `s` (degree filtration) and complexity `(M, d)`
(README Convention 3). -/
def IsNilseqLE (σ : Type*) [DecidableEq σ] (s d : ℕ) (M : ℝ) (ψ : (σ → ℤ) → ℂ) : Prop :=
  ∃ (d' : ℕ) (X : PresentedNilmanifold d' s), d' ≤ d ∧ X.pres.ComplexityLE ⌊M⌋₊ ∧
    IsNilsequence X.pres (fun _ => 1) M ψ

/-- A sum of at most `M` nilsequences of degree `s` and complexity `(M, d)`. -/
def IsNilseqSumLE (σ : Type*) [DecidableEq σ] (s d : ℕ) (M : ℝ) (f : (σ → ℤ) → ℂ) : Prop :=
  ∃ l : List ((σ → ℤ) → ℂ), (l.length : ℝ) ≤ M ∧ (∀ ψ ∈ l, IsNilseqLE σ s d M ψ) ∧ f = l.sum

/-- `χ` is a nilcharacter on `ℤ^σ` of degree `s` and complexity `(M, d)`: output dimension,
complexity, Lipschitz constants and frequency height at most `M`, unit vector values and a
vertical frequency (README Convention 3; LSS, Definition 2.16). -/
def IsNilcharLE (σ : Type*) [DecidableEq σ] (s d : ℕ) (M : ℝ) {D : ℕ}
    (χ : (σ → ℤ) → Fin D → ℂ) : Prop :=
  (D : ℝ) ≤ M ∧ ∃ (d' : ℕ) (X : PresentedNilmanifold d' s), d' ≤ d ∧ X.pres.ComplexityLE ⌊M⌋₊ ∧
    ∃ (g : (σ → ℤ) → X.carrier) (F : X.carrier → Fin D → ℂ) (k : Fin d' → ℤ),
      IsPolynomialMap (weightedFiltration fun _ => 1) X.pres.filtration g ∧
      (∀ l, (|k l| : ℝ) ≤ M) ∧ (∀ x (γ : X.pres.lattice), F (x * γ) = F x) ∧
      (∀ x, ∑ i, ‖F x i‖ ^ 2 = 1) ∧ (∀ i, HasVerticalFrequency X.pres (fun x => F x i) k) ∧
      (∀ i x y, ‖F x i - F y i‖ ≤ M * X.pres.nilDist x y) ∧ ∀ n, χ n = F (g n)

/-- A nilsequence on `ZMod N` of degree `s` and complexity `(M, d)`, evaluated at the
representatives `ZMod.val` (NilmanifoldsAndNilsequences 6.1). -/
def IsCyclicNilseqLE (s d : ℕ) (M : ℝ) {N : ℕ} (f : ZMod N → ℂ) : Prop :=
  ∃ ψ : ℤ → ℂ, IsNilseqLE Unit s d M (fun n => ψ (n ())) ∧ ∀ x, f x = ψ (x.val : ℤ)

end Conventions

/-! ### Layer 0: small scales -/

/-- **Small scales** (README 0.2): every bounded function on `[N]` agrees there with a degree-1
nilsequence of complexity `(8N, 1)`. -/
theorem exists_isNilseqLE_eq_on_interval (N : ℕ) (hN : 1 ≤ N) (f : ℤ → ℂ)
    (hf : ∀ n, ‖f n‖ ≤ 1) :
    ∃ ψ : ℤ → ℂ, IsNilseqLE Unit 1 1 (8 * N) (fun n => ψ (n ())) ∧
      ∀ n ∈ interval N, ψ n = f n := by
  sorry

/-! ### Layer 1: equivalence of nilcharacters -/

section Layer1

variable {σ : Type*} [DecidableEq σ]

/-- `(M, D, d)`-equivalence of nilcharacters of degree `s`: output dimensions at most `D`, and
every coordinate of `χ ⊗ conj χ'` is a sum of at most `M` nilsequences of degree `s - 1` and
complexity `(M, d)` (README 1.4; LSS, Definition 7.3; GTZ, Definition 6.22). -/
def NilcharEquiv (σ : Type*) [DecidableEq σ] (s : ℕ) (M D : ℝ) (d : ℕ) {D₁ D₂ : ℕ}
    (χ : (σ → ℤ) → Fin D₁ → ℂ) (χ' : (σ → ℤ) → Fin D₂ → ℂ) : Prop :=
  (D₁ : ℝ) ≤ D ∧ (D₂ : ℝ) ≤ D ∧
    ∀ i j, IsNilseqSumLE σ (s - 1) d M fun n => χ n i * conj (χ' n j)

/-- **Reflexivity** (README 1.4; GTZ, proof of Lemma E.7). -/
theorem nilcharEquiv_refl (s : ℕ) (hs : 1 ≤ s) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (d : ℕ) (M : ℝ) {D : ℕ} (χ : (σ → ℤ) → Fin D → ℂ), 2 ≤ M →
      IsNilcharLE σ s d M χ → NilcharEquiv σ s (M ^ (C * (d : ℝ) ^ C)) M d χ χ := by
  sorry

/-- **Transitivity** (README 1.4; LSS, Lemma C.1; GTZ, Lemma E.7). -/
theorem nilcharEquiv_trans (s : ℕ) (hs : 1 ≤ s) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (d : ℕ) (M D : ℝ) {D₁ D₂ D₃ : ℕ} (χ₁ : (σ → ℤ) → Fin D₁ → ℂ)
      (χ₂ : (σ → ℤ) → Fin D₂ → ℂ) (χ₃ : (σ → ℤ) → Fin D₃ → ℂ), 2 ≤ M → 1 ≤ D →
      IsNilcharLE σ s d M χ₂ → NilcharEquiv σ s M D d χ₁ χ₂ → NilcharEquiv σ s M D d χ₂ χ₃ →
        NilcharEquiv σ s ((M * D) ^ C) ((M * D) ^ C) (⌈C⌉₊ * d) χ₁ χ₃ := by
  sorry

/-- **Transfer of correlation** (README 1.4; LSS, Lemma 7.4): a correlation with `χ` gives a
correlation with `χ'` times one of the lower-degree nilsequences witnessing the equivalence. -/
theorem exists_corr_of_nilcharEquiv (s : ℕ) (hs : 1 ≤ s) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (d : ℕ) (M D ρ : ℝ) {D₁ D₂ : ℕ} (χ : (σ → ℤ) → Fin D₁ → ℂ)
      (χ' : (σ → ℤ) → Fin D₂ → ℂ) (Ω : Finset (σ → ℤ)) (f : (σ → ℤ) → ℂ) (i : Fin D₁),
      2 ≤ M → 1 ≤ D → 0 < ρ → Ω.Nonempty → (∀ n, ‖f n‖ ≤ 1) →
      IsNilcharLE σ s d M χ' → NilcharEquiv σ s M D d χ χ' →
      ρ ≤ ‖(∑ n ∈ Ω, f n * χ n i) / Ω.card‖ →
        ∃ (ψ : (σ → ℤ) → ℂ) (j : Fin D₂), IsNilseqLE σ (s - 1) d M ψ ∧
          (ρ / (M * D)) ^ C ≤ ‖(∑ n ∈ Ω, f n * χ' n j * ψ n) / Ω.card‖ := by
  sorry

end Layer1

/-! ### Layer 2: the converse inverse theorem -/

/-- **Converse inverse theorem on `[N]`** (README 2.2; LSS, Lemma B.5; GTZ, Proposition 5.6). -/
theorem converse_interval (s : ℕ) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (N d : ℕ) (M ε : ℝ), 1 ≤ N → 2 ≤ M → 0 < ε → ε ≤ 1 →
      ∀ f ψ : ℤ → ℂ, (∀ n, ‖f n‖ ≤ 1) → IsNilseqLE Unit s d M (fun n => ψ (n ())) →
        ε ≤ ‖(∑ n ∈ interval N, f n * conj (ψ n)) / N‖ →
          (ε / M) ^ (C * ((d : ℝ) + 1) ^ C) ≤ relGowersNorm (s + 1) (interval N) f := by
  sorry

/-- **Converse inverse theorem on `ZMod N`** (README 2.2). -/
theorem converse_cyclic (s : ℕ) (hs : 1 ≤ s) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (N d : ℕ) [NeZero N] (M ε : ℝ), 2 ≤ M → 0 < ε → ε ≤ 1 →
      ∀ f ψ : ZMod N → ℂ, (∀ x, ‖f x‖ ≤ 1) → IsCyclicNilseqLE s d M ψ →
        ε ≤ ‖(∑ x, f x * conj (ψ x)) / N‖ →
          (ε / M) ^ (C * ((d : ℝ) + 1) ^ C) ≤ relGowersNorm (s + 1) Finset.univ f := by
  sorry

/-! ### Layer 3: approximate homomorphisms -/

open Classical in
/-- **Graphs with many additive quadruples are bracket-linear** (README 3.2; LSS, Lemma A.2). -/
theorem bracket_linear_of_energy :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (N d : ℕ) (δ : ℝ), 1 ≤ N → 0 < δ → δ ≤ 1 / 2 →
      ∀ (H : Fin 4 → Finset ℤ), (∀ i, H i ⊆ interval N) → ∀ f : Fin 4 → ℤ → Fin d → ℝ,
      δ * (N : ℝ) ^ 3 ≤ ((((H 0 ×ˢ H 1) ×ˢ (H 2 ×ˢ H 3)).filter fun q =>
          q.1.1 + q.1.2 = q.2.1 + q.2.2 ∧
          ∀ j, ∃ z : ℤ, f 0 q.1.1 j + f 1 q.1.2 j - f 2 q.2.1 j - f 3 q.2.2 j = z).card : ℝ) →
      ∀ N' : ℕ, N'.Prime → 100 * N ≤ N' → N' ≤ 200 * N →
        ∃ (H' : Finset ℤ) (d' : ℕ) (a : Fin d' → Fin d → ℝ) (b : Fin d → ℝ) (α : Fin d' → ℤ),
          H' ⊆ H 0 ∧ Real.exp (-(C * Real.log (1 / δ) ^ C)) * N ≤ H'.card ∧
          (d' : ℝ) ≤ C * Real.log (1 / δ) ^ C ∧
          ∀ h ∈ H', ∀ j, ∃ z : ℤ,
            f 0 h j - ∑ i, a i j * signedFract ((α i : ℝ) / N' * h) - b j = z := by
  sorry

/-! ### Layer 8: the inverse theorem -/

/-- **The quasi-polynomial inverse theorem on `[N]`** (README 8.3; LSS, Theorem 1.2). -/
theorem inverse_theorem_interval (s : ℕ) (hs : 1 ≤ s) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (N : ℕ) (δ : ℝ), 1 ≤ N → 0 < δ → δ ≤ 1 / 2 →
      ∀ f : ℤ → ℂ, (∀ n, ‖f n‖ ≤ 1) → δ ≤ relGowersNorm (s + 1) (interval N) f →
        ∃ ψ : ℤ → ℂ,
          IsNilseqLE Unit s ⌊C * Real.log (1 / δ) ^ C⌋₊ (Real.exp (C * Real.log (1 / δ) ^ C))
            (fun n => ψ (n ())) ∧
          Real.exp (-(C * Real.log (1 / δ) ^ C)) ≤
            ‖(∑ n ∈ interval N, f n * conj (ψ n)) / N‖ := by
  sorry

/-- **The quasi-polynomial inverse theorem on `ZMod N`** (README 8.4). -/
theorem inverse_theorem_cyclic (s : ℕ) (hs : 1 ≤ s) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (N : ℕ) [NeZero N] (δ : ℝ), 0 < δ → δ ≤ 1 / 2 →
      ∀ f : ZMod N → ℂ, (∀ x, ‖f x‖ ≤ 1) → δ ≤ relGowersNorm (s + 1) Finset.univ f →
        ∃ ψ : ZMod N → ℂ,
          IsCyclicNilseqLE s ⌊C * Real.log (1 / δ) ^ C⌋₊ (Real.exp (C * Real.log (1 / δ) ^ C))
            ψ ∧
          Real.exp (-(C * Real.log (1 / δ) ^ C)) ≤ ‖(∑ x, f x * conj (ψ x)) / N‖ := by
  sorry

end TauCetiRoadmap.GowersInverseTheorem
