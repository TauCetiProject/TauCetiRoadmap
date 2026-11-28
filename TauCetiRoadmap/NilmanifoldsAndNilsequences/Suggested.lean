/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Nilmanifolds, polynomial sequences and nilsequences: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's key definitions and headline theorems, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. Each is statable against the pinned Mathlib, with `sorry`, and
every definition has its real body.

The headline statements are:

* Layer 0: filtered groups, polynomial maps, the Lazard–Leibman theorem, Taylor expansions and
  the horizontal Taylor coefficient homomorphism;
* Layer 2: Mal'cev presentations (README 2.4), compactness of the quotient and the fundamental
  domain;
* Layer 3: chain metrics, the Green–Tao metric on `G` and its quotient metric on `G/Γ`, their
  coordinate comparison, approximate left invariance, diameter and covering bounds;
* Layer 4: the coordinate description of polynomial sequences (Green–Tao, Lemma 6.7);
* Layer 5: nilsequences, vertical frequencies, the vertical Fourier decomposition and the
  existence of nilcharacters;
* Layer 6: nilsequences on `ZMod N`.

The BCH group belongs to the roadmap ScatteringDiagrams (§0.4), which neither pin implements, so
the rational filtered nilmanifolds of README 2.1–2.3 and the logarithmic description of README 1.3
are not prototyped. Layers 3–6 are stated, as in the README, for a `MalcevPresentation`: a
group with Mal'cev coordinates of the second kind in which the product is a triangular polynomial
map with rational coefficients. README 2.4 derives one from every rational filtered nilmanifold.

Conventions: `∂_h g n = g (n + h) * (g n)⁻¹`; iterated derivatives are applied right to left;
filtrations are those of Green–Tao–Ziegler (no condition on the layer at `0`); norms on
`Fin d → ℝ` are sup norms; a function on `G/Γ` is a right-`Γ`-invariant function on `G`;
complexity is a natural number `M ≥ 2` bounding heights of coefficients, and constants `C`, `E`
depend only on the dimension `d`, the degree `s` and the number of variables.
-/

open MvPolynomial

namespace TauCetiRoadmap.NilmanifoldsAndNilsequences

/-! ### Layer 0: filtered groups and polynomial maps -/

section Layer0

/-- An `I`-filtration of a group (GTZ, Definition 6.8): antitone subgroups with
`⁅G_i, G_j⁆ ≤ G_{i+j}`. -/
structure GroupFiltration (I G : Type*) [AddCommMonoid I] [PartialOrder I] [Group G] where
  /-- The layer `G_i`. -/
  layer : I → Subgroup G
  antitone : Antitone layer
  commutator_le : ∀ i j, ⁅layer i, layer j⁆ ≤ layer (i + j)

/-- An `I`-filtration of an additive commutative group (the commutator condition is empty). -/
structure AddGroupFiltration (I H : Type*) [AddCommMonoid I] [PartialOrder I]
    [AddCommGroup H] where
  /-- The layer `H_i`. -/
  layer : I → AddSubgroup H
  antitone : Antitone layer

variable {I G H : Type*} [AddCommMonoid I] [PartialOrder I] [Group G] [AddCommGroup H]

/-- The lower central filtration, 1-based: `G_n = lowerCentralSeries (n - 1)`, so `G_0 = G_1 = G`
(README 0.1). -/
def lowerCentralFiltration (G : Type*) [Group G] : GroupFiltration ℕ G where
  layer n := (⊤ : Subgroup G).lowerCentralSeries (n - 1)
  antitone := sorry
  commutator_le := sorry

/-- The derivative `∂_h g n = g (n + h) * (g n)⁻¹` (GT, Definition 1.8). -/
def deriv (h : H) (g : H → G) : H → G := fun n => g (n + h) * (g n)⁻¹

/-- Iterated derivatives, applied right to left: `iterDeriv g [h₁, …, h_m] = ∂_{h₁} ⋯ ∂_{h_m} g`. -/
def iterDeriv (g : H → G) : List H → H → G
  | [] => g
  | h :: l => deriv h (iterDeriv g l)

/-- Polynomial maps between filtered groups (GTZ, Definitions 6.18 and B.1): every iterated
derivative along `h_j ∈ H_{i_j}` takes `H_0` into `G_{i₁ + ⋯ + i_m}`. -/
def IsPolynomialMap (HF : AddGroupFiltration I H) (GF : GroupFiltration I G) (g : H → G) :
    Prop :=
  ∀ l : List (I × H), (∀ p ∈ l, p.2 ∈ HF.layer p.1) → ∀ n ∈ HF.layer 0,
    iterDeriv g (l.map Prod.snd) n ∈ GF.layer (l.map Prod.fst).sum

variable {HF : AddGroupFiltration I H} {GF : GroupFiltration I G}

theorem isPolynomialMap_one : IsPolynomialMap HF GF 1 := by
  sorry

/-- **Lazard–Leibman** (GT, Proposition 6.2; GTZ, Corollary B.4): products of polynomial maps
are polynomial. -/
theorem IsPolynomialMap.mul {g g' : H → G} (hg : IsPolynomialMap HF GF g)
    (hg' : IsPolynomialMap HF GF g') : IsPolynomialMap HF GF (g * g') := by
  sorry

/-- **Lazard–Leibman**, inverses. -/
theorem IsPolynomialMap.inv {g : H → G} (hg : IsPolynomialMap HF GF g) :
    IsPolynomialMap HF GF g⁻¹ := by
  sorry

/-- The Lazard–Leibman group `poly(H → G)` (README 0.3). -/
def polyMap (HF : AddGroupFiltration I H) (GF : GroupFiltration I G) : Subgroup (H → G) where
  carrier := {g | IsPolynomialMap HF GF g}
  mul_mem' ha hb := ha.mul hb
  one_mem' := isPolynomialMap_one
  inv_mem' ha := ha.inv

/-- Composition with a filtered homomorphism (GTZ, example after Corollary B.5). -/
theorem IsPolynomialMap.comp_addMonoidHom {H' : Type*} [AddCommGroup H']
    {HF' : AddGroupFiltration I H'} {g : H → G} (hg : IsPolynomialMap HF GF g) (φ : H' →+ H)
    (hφ : ∀ i, (HF'.layer i).map φ ≤ HF.layer i) : IsPolynomialMap HF' GF (g ∘ φ) := by
  sorry

/-- The weighted filtration of `ℤ^σ`: `(ℤ^σ)_0 = ℤ^σ` and `(ℤ^σ)_i` is spanned by the `e_a` with
`w a ≥ i` (README Convention 4; `w = 1` is GTZ's degree filtration). -/
def weightedFiltration {σ : Type*} [DecidableEq σ] (w : σ → ℕ) :
    AddGroupFiltration ℕ (σ → ℤ) where
  layer i := if i = 0 then ⊤ else AddSubgroup.closure {x | ∃ a, i ≤ w a ∧ x = Pi.single a 1}
  antitone := sorry

/-- GTZ's multidegree filtration of `ℤ^σ` (Definition 6.17): `ℤ^σ` at `0`, `ℤ e_a` at `e_a`,
and `0` elsewhere. -/
noncomputable def multidegreeFiltration (σ : Type*) [DecidableEq σ] :
    AddGroupFiltration (σ → ℕ) (σ → ℤ) where
  layer a := haveI := Classical.propDecidable (a = 0)
    if a = 0 then ⊤ else AddSubgroup.closure {x | ∃ i, a = Pi.single i 1 ∧ x = Pi.single i 1}
  antitone := sorry

/-- **Taylor expansion** in one variable (GTZ, Lemma B.9; README 0.4): for a full filtration of
degree at most `s`, polynomial sequences are exactly the products `∏_{i ≤ s} c_i ^ binom(n, i)`
with `c_i ∈ G_i`, and the coefficients are unique. -/
theorem isPolynomialMap_iff_existsUnique_taylor (GF : GroupFiltration ℕ G) (s : ℕ)
    (h0 : GF.layer 0 = ⊤) (h1 : GF.layer 1 = ⊤) (hs : GF.layer (s + 1) = ⊥)
    (g : (Unit → ℤ) → G) :
    IsPolynomialMap (weightedFiltration fun _ : Unit => 1) GF g ↔
      ∃! c : Fin (s + 1) → G, (∀ i : Fin (s + 1), c i ∈ GF.layer i) ∧
        ∀ n : Unit → ℤ,
          g n = (List.ofFn fun i : Fin (s + 1) => c i ^ Ring.choose (n ()) i).prod := by
  sorry

/-- The subgroup `K_i = G_{i+1} · ∏_{0<j<i} ⁅G_j, G_{i−j}⁆`, so that `Horiz_i(G) = G_i / K_i`
(GTZ, Definition 9.6; README 0.5). -/
def horizKernel (GF : GroupFiltration ℕ G) (i : ℕ) : Subgroup G :=
  GF.layer (i + 1) ⊔ ⨆ j ∈ Finset.Ioo 0 i, ⁅GF.layer j, GF.layer (i - j)⁆

/-- The `i`-th Taylor coefficient `∂_1 ⋯ ∂_1 g (0)` of a sequence. -/
def taylorCoeff (g : (Unit → ℤ) → G) (i : ℕ) : G :=
  iterDeriv g (List.replicate i fun _ => 1) 0

/-- **Horizontal Taylor coefficients are homomorphic** (GTZ, remark after Definition 9.6): modulo
`K_i`, the `i`-th Taylor coefficient of a product is the product of the coefficients. -/
theorem taylorCoeff_mul_mem_horizKernel (GF : GroupFiltration ℕ G) (h0 : GF.layer 0 = ⊤)
    (h1 : GF.layer 1 = ⊤) {g g' : (Unit → ℤ) → G}
    (hg : IsPolynomialMap (weightedFiltration fun _ : Unit => 1) GF g)
    (hg' : IsPolynomialMap (weightedFiltration fun _ : Unit => 1) GF g') {i : ℕ} (hi : 1 ≤ i) :
    taylorCoeff (g * g') i * (taylorCoeff g i * taylorCoeff g' i)⁻¹ ∈ horizKernel GF i := by
  sorry

end Layer0

/-! ### Layer 2: Mal'cev presentations -/

section Layer2

/-- A Mal'cev presentation of degree `s` and dimension `d` (README 2.4): Mal'cev coordinates of
the second kind `coord : G ≃ₜ ℝ^d` in which the layers of a full filtration are coordinate
subspaces cut out by weights, the lattice is `coord⁻¹(ℤ^d)`, and the product is a triangular
polynomial map with rational coefficients of weighted degree at most the weight (GT, Definition
2.1 and Lemma A.3). -/
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
  /-- The product polynomials `P_l`, in the variables `t_{0,·}` and `t_{1,·}`. -/
  mulPoly : Fin d → MvPolynomial (Fin 2 × Fin d) ℚ
  coord_mul : ∀ x y l, coord (x * y) l =
    aeval (fun v : Fin 2 × Fin d => (![coord x, coord y] v.1) v.2) (mulPoly l)
  weightedTotalDegree_le : ∀ l,
    (mulPoly l).weightedTotalDegree (fun v : Fin 2 × Fin d => weight v.2) ≤ weight l
  triangular : ∀ l, ∀ v ∈ (mulPoly l - X (0, l) - X (1, l)).vars, v.2 < l

namespace MalcevPresentation

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ} (P : MalcevPresentation G d s)

/-- Complexity at most `M`: every coefficient of every product polynomial has height at most
`M`. -/
def ComplexityLE (M : ℕ) : Prop :=
  ∀ l m, Height.mulHeight₁ ((P.mulPoly l).coeff m) ≤ M

theorem isTopologicalGroup : IsTopologicalGroup G := by
  sorry

theorem discreteTopology_lattice : DiscreteTopology P.lattice := by
  sorry

/-- The nilmanifold `G/Γ` is compact (README 2.4). -/
theorem compactSpace_quotient : CompactSpace (G ⧸ P.lattice) := by
  sorry

/-- **Fundamental domain** (GT, Lemma A.14): `x = {x}[x]` uniquely, with `ψ({x}) ∈ [0, 1)^d` and
`[x] ∈ Γ`. -/
theorem existsUnique_fundamentalDomain (x : G) :
    ∃! p : G × P.lattice, x = p.1 * p.2 ∧ ∀ l, P.coord p.1 l ∈ Set.Ico (0 : ℝ) 1 := by
  sorry

/-- The top layer is central (README 2.4). -/
theorem layer_degree_le_center (x : G) (hx : x ∈ P.filtration.layer s) (y : G) :
    x * y = y * x := by
  sorry

end MalcevPresentation

end Layer2

/-! ### Layer 3: metrics -/

section Layer3

variable {G : Type*} [Group G]

/-- The cost of the chain `x, l₁, …, l_k, y` for a size function `ν`. -/
noncomputable def chainCost (ν : G → ℝ) (x : G) (l : List G) (y : G) : ℝ :=
  (((x :: l).zip (l ++ [y])).map fun p => min (ν (p.1 * p.2⁻¹)) (ν (p.2 * p.1⁻¹))).sum

/-- The chain distance: the infimum of chain costs (README 3.1; GT, Definition 2.2). -/
noncomputable def chainDist (ν : G → ℝ) (x y : G) : ℝ :=
  ⨅ l : List G, chainCost ν x l y

/-- Chain distances are right-invariant. -/
theorem chainDist_mul_right (ν : G → ℝ) (x y z : G) :
    chainDist ν (x * z) (y * z) = chainDist ν x y := by
  sorry

variable [TopologicalSpace G] {d s : ℕ}

namespace MalcevPresentation

variable (P : MalcevPresentation G d s)

/-- The Green–Tao metric on `G` (GT, Definition 2.2; LSS, Definition 3.4). -/
noncomputable def malcevDist (x y : G) : ℝ :=
  chainDist (fun g => ‖P.coord g‖) x y

/-- The quotient metric `d(xΓ, yΓ) = inf_γ d(x, yγ)`, as a function on `G` (GT, Definition 2.2). -/
noncomputable def nilDist (x y : G) : ℝ :=
  ⨅ γ : P.lattice, P.malcevDist x (y * γ)

/-- The Green–Tao metric is a metric inducing the topology of `G` (README 3.2). -/
theorem exists_metricSpace :
    ∃ m : MetricSpace G, m.toUniformSpace.toTopologicalSpace = ‹TopologicalSpace G› ∧
      ∀ x y, @dist G m.toDist x y = P.malcevDist x y := by
  sorry

/-- The quotient metric is a metric inducing the quotient topology (GT, Lemma A.15). -/
theorem exists_quotient_metricSpace :
    ∃ m : MetricSpace (G ⧸ P.lattice),
      m.toUniformSpace.toTopologicalSpace = QuotientGroup.instTopologicalSpace P.lattice ∧
      ∀ x y : G, @dist _ m.toDist (QuotientGroup.mk x) (QuotientGroup.mk y) = P.nilDist x y := by
  sorry

end MalcevPresentation

/-- **Coordinates versus the metric** (GT, Lemma A.4; README 3.2). -/
theorem malcevDist_comparison (d s : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M T : ℕ), 2 ≤ M → 1 ≤ T → P.ComplexityLE M → ∀ x y : G,
        ‖P.coord x‖ ≤ T → ‖P.coord y‖ ≤ T →
        P.malcevDist x y ≤ C * ((M * T : ℕ) : ℝ) ^ E * ‖P.coord x - P.coord y‖ ∧
        ‖P.coord x - P.coord y‖ ≤ C * ((M * T : ℕ) : ℝ) ^ E * P.malcevDist x y := by
  sorry

/-- **Approximate left invariance** (GT, Lemma A.5; README 3.2), for all `x` and `y`. -/
theorem malcevDist_mul_left_le (d s : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M : ℕ), 2 ≤ M → P.ComplexityLE M → ∀ g x y : G,
        P.malcevDist (g * x) (g * y) ≤
          C * ((M : ℝ) * (1 + ‖P.coord g‖)) ^ E * P.malcevDist x y := by
  sorry

/-- **Diameter** (GT, Lemma A.16) and **covering numbers** of `G/Γ` (README 3.3). -/
theorem nilDist_le_and_covering (d s : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M : ℕ), 2 ≤ M → P.ComplexityLE M →
        (∀ x y : G, P.nilDist x y ≤ C * (M : ℝ) ^ E) ∧
        ∀ δ : ℝ, 0 < δ → δ ≤ 1 → ∃ S : Finset G, (S.card : ℝ) ≤ (C * (M : ℝ) ^ E / δ) ^ d ∧
          ∀ x : G, ∃ y ∈ S, P.nilDist x y ≤ δ := by
  sorry

/-- **Lipschitz partitions of unity** on `G/Γ` (README 3.4), as right-`Γ`-invariant functions. -/
theorem exists_partitionOfUnity (d s : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M : ℕ), 2 ≤ M → P.ComplexityLE M → ∀ ρ : ℝ, 0 < ρ → ρ ≤ 1 →
        ∃ (n : ℕ) (φ : Fin n → G → ℝ), (n : ℝ) ≤ (C * (M : ℝ) ^ E / ρ) ^ d ∧
          (∀ i x (γ : P.lattice), φ i (x * γ) = φ i x) ∧ (∀ i x, φ i x ∈ Set.Icc (0 : ℝ) 1) ∧
          (∀ x, ∑ i, φ i x = 1) ∧
          (∀ i x y, |φ i x - φ i y| ≤ C * (M : ℝ) ^ E / ρ * P.nilDist x y) ∧
          ∀ i x y, 0 < φ i x → 0 < φ i y → P.nilDist x y ≤ ρ := by
  sorry

end Layer3

/-! ### Layer 4: polynomial sequences in coordinates -/

section Layer4

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ}

/-- **Polynomial sequences in Mal'cev coordinates** (GT, Lemma 6.7; README 4.1): `g` is
polynomial for the weighted filtration if and only if each coordinate is
`Σ_j binom(n, j) t_{j,l}` with `t_{j,l} = 0` unless `|j|_w ≤ ω l`. -/
theorem isPolynomialMap_iff_coord (P : MalcevPresentation G d s) {σ : Type*} [Fintype σ]
    [DecidableEq σ] (w : σ → ℕ) (hw : ∀ a, 1 ≤ w a) (g : (σ → ℤ) → G) :
    IsPolynomialMap (weightedFiltration w) P.filtration g ↔
      ∃ t : (σ → Fin (s + 1)) → Fin d → ℝ,
        (∀ j l, t j l ≠ 0 → ∑ a, w a * (j a : ℕ) ≤ P.weight l) ∧
        ∀ n l, P.coord (g n) l = ∑ j, ((∏ a, Ring.choose (n a) (j a) : ℤ) : ℝ) * t j l := by
  sorry

end Layer4

/-! ### Layer 5: nilsequences and nilcharacters -/

section Layer5

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ}

/-- `f` is a nilsequence on `ℤ^σ` with weights `w` on the presented nilmanifold, with observable
bounded by `K` and `K`-Lipschitz for the quotient metric (README 5.1; GTZ, Definition 6.19). -/
def IsNilsequence (P : MalcevPresentation G d s) {σ : Type*} [DecidableEq σ] (w : σ → ℕ)
    (K : ℝ) (f : (σ → ℤ) → ℂ) : Prop :=
  ∃ g : (σ → ℤ) → G, IsPolynomialMap (weightedFiltration w) P.filtration g ∧
    ∃ F : G → ℂ, (∀ x (γ : P.lattice), F (x * γ) = F x) ∧ (∀ x, ‖F x‖ ≤ K) ∧
      (∀ x y, ‖F x - F y‖ ≤ K * P.nilDist x y) ∧ ∀ n, f n = F (g n)

/-- `F` has vertical frequency `k`: `F (u x) = e(k · ψ(u)) F x` for `u` in the top layer (GT,
Definition 3.5; GTZ, Definition 6.1). -/
def HasVerticalFrequency (P : MalcevPresentation G d s) (F : G → ℂ) (k : Fin d → ℤ) : Prop :=
  ∀ u ∈ P.filtration.layer s, ∀ x,
    F (u * x) = Complex.exp (2 * Real.pi * Complex.I * ∑ l, (k l : ℂ) * (P.coord u l : ℂ)) * F x

/-- Complex conjugates of nilsequences are nilsequences with the same bounds (README 5.2). -/
theorem IsNilsequence.conj (P : MalcevPresentation G d s) {σ : Type*} [DecidableEq σ]
    (w : σ → ℕ) {K : ℝ} {f : (σ → ℤ) → ℂ} (hf : IsNilsequence P w K f) :
    IsNilsequence P w K fun n => starRingEnd ℂ (f n) := by
  sorry

/-- **Vertical Fourier decomposition** (README 5.3; compare GT, Lemma 3.7, and GTZ, Lemma E.5). -/
theorem exists_verticalFrequency_decomposition (d s : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M : ℕ) (K ε : ℝ), 2 ≤ M → P.ComplexityLE M → 1 ≤ K → 0 < ε → ε ≤ 1 →
      ∀ F : G → ℂ, (∀ x (γ : P.lattice), F (x * γ) = F x) → (∀ x, ‖F x‖ ≤ K) →
        (∀ x y, ‖F x - F y‖ ≤ K * P.nilDist x y) →
        ∃ (S : Finset (Fin d → ℤ)) (F' : (Fin d → ℤ) → G → ℂ),
          (∀ k ∈ S, (‖k‖ : ℝ) ≤ C * ((M : ℝ) * K / ε) ^ E) ∧
          (∀ k ∈ S, HasVerticalFrequency P (F' k) k ∧
            (∀ x (γ : P.lattice), F' k (x * γ) = F' k x) ∧
            ∀ x y, ‖F' k x - F' k y‖ ≤ C * ((M : ℝ) * K / ε) ^ E * P.nilDist x y) ∧
          ∀ x, ‖F x - ∑ k ∈ S, F' k x‖ ≤ ε := by
  sorry

/-- **Existence of nilcharacters** (README 5.4; GTZ, §6 and the proof of Lemma E.5): every
vertical frequency is the frequency of a unit-vector-valued Lipschitz function of polynomially
bounded output dimension and Lipschitz constant. -/
theorem exists_nilcharacter (d s : ℕ) :
    ∃ C E : ℕ, ∀ {G : Type*} [Group G] [TopologicalSpace G] (P : MalcevPresentation G d s)
      (M : ℕ), 2 ≤ M → P.ComplexityLE M → ∀ k : Fin d → ℤ, (∀ l, P.weight l < s → k l = 0) →
        ∃ (D : ℕ) (F : G → Fin D → ℂ), (D : ℝ) ≤ C * (M : ℝ) ^ E ∧
          (∀ x (γ : P.lattice), F (x * γ) = F x) ∧ (∀ x, ∑ i, ‖F x i‖ ^ 2 = 1) ∧
          (∀ i, HasVerticalFrequency P (fun x => F x i) k) ∧
          ∀ i x y, ‖F x i - F y i‖ ≤ C * ((M : ℝ) * (1 + ‖k‖)) ^ E * P.nilDist x y := by
  sorry

end Layer5

/-! ### Layer 6: nilsequences on `ZMod N` -/

section Layer6

variable {G : Type*} [Group G] [TopologicalSpace G] {d s : ℕ}

/-- A nilsequence on `ZMod N`, evaluated at the representatives `ZMod.val` (README 6.1). -/
def IsCyclicNilsequence (P : MalcevPresentation G d s) (K : ℝ) {N : ℕ} (f : ZMod N → ℂ) :
    Prop :=
  ∃ ψ : (Unit → ℤ) → ℂ, IsNilsequence P (fun _ => 1) K ψ ∧ ∀ x, f x = ψ fun _ => (x.val : ℤ)

end Layer6

end TauCetiRoadmap.NilmanifoldsAndNilsequences
