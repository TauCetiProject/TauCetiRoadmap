module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.CourantFischer
public import TauCeti.Analysis.Matrix.Eigenvalues.Basic
public import TauCeti.Analysis.Matrix.GramFactorization

/-!
# Cocliques, colourings and theta: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (defining
lemmas, basic API, corollaries and the lemmas on a proof route) are stated there in prose with
their locators or proof routes, and are not stated here.

Conventions (README, Conventions): a graph is `G : SimpleGraph V` on a finite type with decidable
equality and adjacency; `adjEigenvalues G i` is `θ_{i+1}` in nonincreasing order, with
`largestEigenvalue G = θ₁` and `smallestEigenvalue G = θₙ` on a nonempty vertex type;
`α = G.indepNum`, `ω = G.cliqueNum` and `χ = G.chromaticNumber` are Mathlib's, and real-valued
statements about `χ` use `G.chromaticNumber.toNat`. Chromatic polynomials are in `ℤ[X]`.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section and in a namespace named after its owner: the sorted
adjacency eigenvalues of SpectralGraphBounds 1.1, the Kneser graphs of TopologicalCombinatorics
3.1, the adjacency spectrum and the decidability of adjacency in Kneser graphs and disjoint unions
of GraphSpectra 1.2, 2.4 and 1.7,
vertex- and edge-transitivity of GraphSymmetryAndCayleyGraphs 1.1, the odd-cycle predicate of
GraphColouring 2.1, the theta function, strong powers and the Shannon capacity of
LovaszThetaFunction 1.1, 3.1 and 5.1, and the component count and the chromatic polynomial of
TuttePolynomialAndArrangements 4.1 and 4.2.
-/

@[expose] public section

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.CocliquesColouringsAndTheta

/-! ## Local copy: SpectralGraphBounds, 1.1 -/

namespace SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

/-- 1.1 The largest adjacency eigenvalue `λ₁` of a graph on a nonempty vertex type. -/
def largestEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  adjEigenvalues G ⟨0, Fintype.card_pos⟩

/-- 1.1 The smallest adjacency eigenvalue `λₙ` of a graph on a nonempty vertex type. -/
def smallestEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  adjEigenvalues G ⟨Fintype.card V - 1, Nat.sub_lt Fintype.card_pos Nat.one_pos⟩

end SpectralGraphBounds

/-! ## Local copy: TopologicalCombinatorics, 3.1 -/

namespace TopologicalCombinatorics

/-- 3.1 The Kneser graph of a family `𝓕` of finite sets: its vertices are the members of `𝓕`,
two of them adjacent when they are distinct and disjoint. -/
def kneserGraphOf {α : Type*} (𝓕 : Set (Finset α)) : _root_.SimpleGraph 𝓕 where
  Adj A B := A ≠ B ∧ Disjoint (A : Finset α) B
  symm := ⟨fun _ _ h => ⟨h.1.symm, h.2.symm⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- 3.1 The Kneser graph `KG(α, k)`: the `k`-element subsets of `α`, two adjacent when they are
distinct and disjoint. -/
def kneserGraph (α : Type*) (k : ℕ) : _root_.SimpleGraph {s : Finset α | s.card = k} :=
  kneserGraphOf {s : Finset α | s.card = k}

end TopologicalCombinatorics

open SpectralGraphBounds TopologicalCombinatorics

/-! ## Local copy: GraphSpectra, 1.2, 1.7 and 2.4 -/

namespace GraphSpectra

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The adjacency spectrum, as a multiset of real numbers. -/
def adjSpectrum : Multiset ℝ := Multiset.map (adjEigenvalues G) Finset.univ.val

instance {α : Type*} [DecidableEq α] {k : ℕ} : DecidableRel (kneserGraph α k).Adj :=
  fun s t ↦ inferInstanceAs (Decidable (s ≠ t ∧ Disjoint (s : Finset α) t))

instance {V W : Type*} (G : _root_.SimpleGraph V) [DecidableRel G.Adj]
    (H : _root_.SimpleGraph W) [DecidableRel H.Adj] : DecidableRel (G ⊕g H).Adj
  | Sum.inl x, Sum.inl y => inferInstanceAs (Decidable (G.Adj x y))
  | Sum.inr x, Sum.inr y => inferInstanceAs (Decidable (H.Adj x y))
  | Sum.inl _, Sum.inr _ => isFalse (by simp)
  | Sum.inr _, Sum.inl _ => isFalse (by simp)

end SimpleGraph

end GraphSpectra

open GraphSpectra.SimpleGraph

/-! ## Local copy: GraphSymmetryAndCayleyGraphs, 1.1 -/

namespace GraphSymmetryAndCayleyGraphs

namespace SimpleGraph

section Transitivity

variable {V : Type*} (G : _root_.SimpleGraph V)

/-- **1.1** A graph is vertex-transitive when its automorphism group acts transitively on its
vertices. -/
def IsVertexTransitive : Prop :=
  MulAction.IsPretransitive (G ≃g G) V

/-- **1.1** A graph is edge-transitive when its automorphism group acts transitively on its
edges. -/
def IsEdgeTransitive : Prop :=
  ∀ e ∈ G.edgeSet, ∀ e' ∈ G.edgeSet, ∃ φ : G ≃g G, Sym2.map φ e = e'

end Transitivity

end SimpleGraph

end GraphSymmetryAndCayleyGraphs

open GraphSymmetryAndCayleyGraphs.SimpleGraph

/-! ## Local copy: GraphColouring, 2.1 -/

namespace GraphColouring

open SimpleGraph

variable {V : Type*}

/-- 2.1 A graph is an odd cycle when it is isomorphic to Mathlib's cycle graph on an odd number,
at least three, of vertices. -/
def IsOddCycle (G : SimpleGraph V) : Prop :=
  ∃ n, 3 ≤ n ∧ Odd n ∧ Nonempty (G ≃g cycleGraph n)

end GraphColouring

open GraphColouring

/-! ## Local copy: LovaszThetaFunction, 1.1, 3.1 and 5.1 -/

namespace LovaszThetaFunction

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Lovász theta function in its semidefinite form: the supremum of the sum of the
entries of `B` over positive semidefinite real matrices `B` with trace `1` and `B i j = 0`
whenever `i` and `j` are adjacent. -/
def lovaszTheta (G : SimpleGraph V) : ℝ :=
  sSup {s : ℝ | ∃ B : Matrix V V ℝ, B.PosSemidef ∧ B.trace = 1 ∧
    (∀ i j, G.Adj i j → B i j = 0) ∧ ∑ i, ∑ j, B i j = s}

/-- 3.1 The `k`-th strong power of `G`, on words `Fin k → V`: distinct words are adjacent when
in every coordinate the letters are equal or adjacent. -/
def strongPow (G : SimpleGraph V) (k : ℕ) : SimpleGraph (Fin k → V) where
  Adj x y := x ≠ y ∧ ∀ i, x i = y i ∨ G.Adj (x i) (y i)
  symm.symm _ _ h := ⟨h.1.symm, fun i => (h.2 i).imp Eq.symm (fun h' => h'.symm)⟩
  loopless.irrefl _ h := h.1 rfl

/-- 5.1 The Shannon capacity: the supremum over `k ≥ 1` of `α(G^⊠k)^(1/k)`. -/
def shannonCapacity (G : SimpleGraph V) : ℝ :=
  ⨆ k : ℕ, ((strongPow G (k + 1)).indepNum : ℝ) ^ ((1 : ℝ) / (k + 1))

end LovaszThetaFunction

open LovaszThetaFunction

/-! ## Local copy: TuttePolynomialAndArrangements, 4.1 and 4.2 -/

namespace TuttePolynomialAndArrangements

section Graphs

variable {V : Type*}

/-- 4.1 The number of connected components of the spanning subgraph of the complete vertex set
`V` with edge set `A`. -/
def numComponents (A : Set (Sym2 V)) : ℕ :=
  Nat.card (SimpleGraph.fromEdgeSet A).ConnectedComponent

variable [Fintype V]

/-- 4.2 The chromatic polynomial of `G` in Whitney's form,
`P_G(q) = ∑_{A ⊆ E(G)} (-1)^|A| q^(c(A))`. -/
def chromaticPolynomial (G : SimpleGraph V) [DecidableRel G.Adj] : Polynomial ℤ :=
  ∑ A ∈ G.edgeFinset.powerset, (-1) ^ #A * Polynomial.X ^ numComponents (A : Set (Sym2 V))

end Graphs

end TuttePolynomialAndArrangements

open TuttePolynomialAndArrangements

namespace SimpleGraph

/-! ## Layer 1: weighted coclique bounds and the clique–coclique bound -/

section Layer1

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- **1.1** A weighted adjacency matrix of `G`: a real symmetric matrix with zero diagonal that
vanishes at distinct nonadjacent pairs. -/
structure IsWeightedAdjMatrix (B : Matrix V V ℝ) : Prop where
  isHermitian : B.IsHermitian
  diag_eq_zero : ∀ x, B x x = 0
  eq_zero_of_not_adj : ∀ x y, x ≠ y → ¬ G.Adj x y → B x y = 0

/-- **1.1 (Brouwer–Haemers, Theorem 3.5.4).** The independence number is at most the number of
nonnegative and at most the number of nonpositive eigenvalues of a weighted adjacency matrix. -/
theorem IsWeightedAdjMatrix.indepNum_le {B : Matrix V V ℝ} (hB : IsWeightedAdjMatrix G B) :
    G.indepNum ≤ #{i | 0 ≤ hB.isHermitian.eigenvalues₀ i} ∧
      G.indepNum ≤ #{i | hB.isHermitian.eigenvalues₀ i ≤ 0} := by
  sorry

/-- **1.1 (Brouwer–Haemers, Theorem 3.5.5a).** If `B` is a weighted adjacency matrix and
`I + B - c⁻¹ J` is positive semidefinite for some `c > 0`, then `α ≤ c`. -/
theorem IsWeightedAdjMatrix.indepNum_le_of_posSemidef {B : Matrix V V ℝ}
    (hB : IsWeightedAdjMatrix G B) {c : ℝ} (hc : 0 < c)
    (h : (1 + B - c⁻¹ • Matrix.of (fun _ _ ↦ (1 : ℝ))).PosSemidef) :
    (G.indepNum : ℝ) ≤ c := by
  sorry

/-- **1.1 (Brouwer–Haemers, Theorem 3.5.5).** If a weighted adjacency matrix `B` has constant
row sums `b` and least eigenvalue `s < b`, then `α ≤ n (-s) / (b - s)`. -/
theorem IsWeightedAdjMatrix.indepNum_le_of_rowSum [Nonempty V] {B : Matrix V V ℝ}
    (hB : IsWeightedAdjMatrix G B) {b : ℝ} (hrow : ∀ x, ∑ y, B x y = b)
    (hsb : hB.isHermitian.eigenvalues₀
      ⟨Fintype.card V - 1, Nat.sub_lt Fintype.card_pos Nat.one_pos⟩ < b) :
    (G.indepNum : ℝ) ≤ Fintype.card V *
        (-hB.isHermitian.eigenvalues₀
          ⟨Fintype.card V - 1, Nat.sub_lt Fintype.card_pos Nat.one_pos⟩) /
      (b - hB.isHermitian.eigenvalues₀
        ⟨Fintype.card V - 1, Nat.sub_lt Fintype.card_pos Nat.one_pos⟩) := by
  sorry

variable {G}

/-- **1.2 (Godsil–Royle, §7.2).** A vertex-transitive graph has `α ω ≤ n`. -/
theorem IsVertexTransitive.indepNum_mul_cliqueNum_le (hG : IsVertexTransitive G) :
    G.indepNum * G.cliqueNum ≤ Fintype.card V := by
  sorry

end Layer1

/-! ## Layer 2: equality in Wilf's bound and biclique partitions -/

section Layer2

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- **2.1 (Brouwer–Haemers, Proposition 3.6.1).** A connected graph has `χ = 1 + θ₁` exactly
when it is complete or an odd cycle. -/
theorem Connected.chromaticNumber_eq_one_add_iff [Nonempty V] (hG : G.Connected) :
    (G.chromaticNumber.toNat : ℝ) = 1 + largestEigenvalue G ↔ G = ⊤ ∨ IsOddCycle G := by
  sorry

/-- **2.2** A partition of the edges of `G` into `m` complete bipartite graphs with sides `X k`
and `Y k`: the sides are disjoint, and two vertices are adjacent exactly when exactly one of the
bicliques joins them. -/
def IsBicliquePartition {m : ℕ} (X Y : Fin m → Finset V) : Prop :=
  (∀ k, Disjoint (X k) (Y k)) ∧
    ∀ u v : V, G.Adj u v ↔ ∃! k, (u ∈ X k ∧ v ∈ Y k) ∨ (v ∈ X k ∧ u ∈ Y k)

/-- **2.2 (Brouwer–Haemers, Proposition 1.5.1).** A partition of the edges into `m` complete
bipartite graphs has `m` at least the number of positive and at least the number of negative
eigenvalues. -/
theorem IsBicliquePartition.card_le {m : ℕ} {X Y : Fin m → Finset V}
    (h : IsBicliquePartition G X Y) :
    #{i | 0 < adjEigenvalues G i} ≤ m ∧ #{i | adjEigenvalues G i < 0} ≤ m := by
  sorry

end Layer2

/-! ## Layer 3: the chromatic polynomial -/

section Layer3

open Polynomial

variable {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
  (G : _root_.SimpleGraph V) [DecidableRel G.Adj] (H : _root_.SimpleGraph W) [DecidableRel H.Adj]

/-! ### 3.1 Contraction and deletion–contraction -/

/-- **3.1** The contraction of the pair `u, v` of a simple graph, on `{x // x ≠ v}`: `v` is
merged into `u`, a loop is discarded and parallel edges are merged. -/
def contract (u v : V) : _root_.SimpleGraph {x // x ≠ v} :=
  _root_.SimpleGraph.fromRel fun x y ↦ G.Adj x y ∨ ((x : V) = u ∧ G.Adj v y)

instance (u v : V) : DecidableRel (contract G u v).Adj := fun x y ↦ by
  unfold contract; infer_instance

/-- **3.1** The neighbours of the merged vertex are the neighbours of `u` and of `v` other than
`u`. -/
theorem contract_adj_iff {u v : V} (huv : u ≠ v) (y : {x // x ≠ v}) :
    (contract G u v).Adj ⟨u, huv⟩ y ↔ (y : V) ≠ u ∧ (G.Adj u y ∨ G.Adj v y) := by
  sorry

/-- **3.1 (Biggs, Proposition 9.3).** Deletion–contraction: for an edge `uv`,
`C_G = C_{G - uv} - C_{G / uv}`. -/
theorem chromaticPolynomial_eq_sub {u v : V} (huv : G.Adj u v)
    [DecidableRel (G.deleteEdges {s(u, v)}).Adj] :
    chromaticPolynomial G =
      chromaticPolynomial (G.deleteEdges {s(u, v)}) - chromaticPolynomial (contract G u v) := by
  sorry

/-! ### 3.2 Standard graphs -/

/-- **3.2** The chromatic polynomial depends only on the isomorphism class. -/
theorem Iso.chromaticPolynomial_eq (e : G ≃g H) :
    chromaticPolynomial G = chromaticPolynomial H := by
  sorry

/-- **3.2 (Biggs, p. 64).** The complete graph has the falling factorial `t(t-1)⋯(t-n+1)`. -/
theorem chromaticPolynomial_top :
    chromaticPolynomial (⊤ : _root_.SimpleGraph V) = descPochhammer ℤ (Fintype.card V) := by
  sorry

/-- **3.2 (Biggs, p. 64).** The chromatic polynomial of a disjoint union is the product. -/
theorem chromaticPolynomial_sum :
    chromaticPolynomial (G ⊕g H) = chromaticPolynomial G * chromaticPolynomial H := by
  sorry

/-- **3.2 (Biggs, Corollary 9.4).** A tree on `n` vertices has `C = t(t-1)^{n-1}`. -/
theorem IsTree.chromaticPolynomial_eq (hG : G.IsTree) :
    chromaticPolynomial G = X * (X - 1) ^ (Fintype.card V - 1) := by
  sorry

/-- **3.2 (Biggs, pp. 65–66).** The cycle `Cₙ`, `n ≥ 3`, has `C = (t-1)^n + (-1)^n (t-1)`. -/
theorem chromaticPolynomial_cycleGraph {n : ℕ} (hn : 3 ≤ n) :
    chromaticPolynomial (_root_.SimpleGraph.cycleGraph n) =
      (X - 1) ^ n + (-1) ^ n * (X - 1) := by
  sorry

/-! ### 3.3 Coefficients -/

/-- **3.3 (Biggs, p. 64 and Proposition 10.6).** `C_G` is monic of degree `n`, and for `n ≥ 1`
the coefficient of `t^{n-1}` is minus the number of edges. -/
theorem chromaticPolynomial_coeff :
    (chromaticPolynomial G).Monic ∧ (chromaticPolynomial G).natDegree = Fintype.card V ∧
      (1 ≤ Fintype.card V →
        (chromaticPolynomial G).coeff (Fintype.card V - 1) = -(#G.edgeFinset : ℤ)) := by
  sorry

/-- **3.3 (Biggs, p. 64 and Corollary 10.8).** With `c` the number of components, the
coefficient of `t^i` vanishes for `i < c`, and `(-1)^{n-i} [t^i] C_G > 0` for `c ≤ i ≤ n`. -/
theorem coeff_chromaticPolynomial_alternating (i : ℕ) :
    (i < Nat.card G.ConnectedComponent → (chromaticPolynomial G).coeff i = 0) ∧
      (Nat.card G.ConnectedComponent ≤ i → i ≤ Fintype.card V →
        0 < (-1) ^ (Fintype.card V - i) * (chromaticPolynomial G).coeff i) := by
  sorry

end Layer3

/-! ## Layer 4: homomorphisms and cores -/

section Layer4

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V)

/-- **4.1** A graph is a core when every endomorphism is bijective. -/
def IsCore {W : Type*} (H : _root_.SimpleGraph W) : Prop :=
  ∀ f : H →g H, Function.Bijective f

/-- **4.1** A core retract of `G`: a set `s` of vertices whose induced subgraph is a core and
onto which `G` retracts. -/
def IsCoreRetract (s : Finset V) : Prop :=
  IsCore (G.induce (s : Set V)) ∧
    ∃ r : G →g G.induce (s : Set V), ∀ x : (s : Set V), r x = x

/-- **4.1 (Godsil–Royle, Lemma 6.2.2).** Every finite graph has a core retract. -/
theorem exists_isCoreRetract : ∃ s : Finset V, IsCoreRetract G s := by
  sorry

/-- **4.1 (Godsil–Royle, Lemma 6.2.1).** Homomorphically equivalent finite cores are
isomorphic. -/
theorem IsCore.nonempty_iso {W : Type*} [Finite W] {H : _root_.SimpleGraph V}
    {K : _root_.SimpleGraph W} (hH : IsCore H) (hK : IsCore K) (f : H →g K) (g : K →g H) :
    Nonempty (H ≃g K) := by
  sorry

/-- **4.1 (Godsil–Royle, Lemmas 6.2.2 and 6.2.3).** Two graphs are homomorphically equivalent
exactly when their core retracts are isomorphic; in particular any two core retracts of `G` are
isomorphic. -/
theorem nonempty_hom_and_hom_iff {W : Type*} [Fintype W] [DecidableEq W]
    {H : _root_.SimpleGraph W} {s : Finset V} {t : Finset W} (hs : IsCoreRetract G s)
    (ht : IsCoreRetract H t) :
    (Nonempty (G →g H) ∧ Nonempty (H →g G)) ↔
      Nonempty (G.induce (s : Set V) ≃g H.induce (t : Set W)) := by
  sorry

variable {G}

/-- **4.2 (Godsil–Royle, Theorems 6.13.1 and 6.13.2).** A core retract of a vertex-transitive
graph is vertex-transitive, and its order divides the order of the graph. -/
theorem IsVertexTransitive.isCoreRetract {s : Finset V} (hG : IsVertexTransitive G)
    (hs : IsCoreRetract G s) :
    IsVertexTransitive (G.induce (s : Set V)) ∧ #s ∣ Fintype.card V := by
  sorry

/-- **4.2 (Godsil–Royle, Lemma 7.14.2).** The no-homomorphism lemma: if `G → H` and `H` is
vertex-transitive, then `|V(G)| / α(G) ≤ |V(H)| / α(H)`. -/
theorem card_div_indepNum_le_of_hom {W : Type*} [Fintype W] [DecidableEq W]
    {H : _root_.SimpleGraph W} (hH : IsVertexTransitive H) (f : G →g H) :
    (Fintype.card V : ℝ) / G.indepNum ≤ Fintype.card W / H.indepNum := by
  sorry

/-- **4.3 (Knauer–Knauer, Theorem 7.4.4).** Every finite monoid is the endomorphism monoid of a
finite simple graph. -/
theorem exists_mulEquiv_hom (M : Type) [Monoid M] [Finite M] :
    ∃ (W : Type) (_ : Fintype W) (H : _root_.SimpleGraph W), Nonempty (M ≃* (H →g H)) := by
  sorry

end Layer4

/-! ## Layer 5: fractional colourings -/

section Layer5

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V)

/-- **5.1** A fractional colouring of `G`: nonnegative weights on finsets, supported on
cocliques, giving every vertex total weight at least `1`. -/
def IsFractionalColouring (w : Finset V → ℝ) : Prop :=
  (∀ s, 0 ≤ w s) ∧ (∀ s, w s ≠ 0 → G.IsIndepSet (s : Set V)) ∧
    ∀ x, 1 ≤ ∑ s with x ∈ s, w s

/-- **5.1** The fractional chromatic number: the infimum of the total weights of the fractional
colourings. -/
def fractionalChromaticNumber : ℝ :=
  sInf {t | ∃ w, IsFractionalColouring G w ∧ ∑ s, w s = t}

/-- **5.2 (Godsil–Royle, Theorem 7.3.2).** The infimum is attained, at a rational weighting. -/
theorem exists_isFractionalColouring_sum_eq :
    ∃ w, IsFractionalColouring G w ∧ (∀ s, ∃ q : ℚ, w s = q) ∧
      ∑ s, w s = fractionalChromaticNumber G := by
  sorry

/-- **5.2 (Godsil–Royle, §7.5).** Linear-programming duality: `χ_f` is the supremum of the
total weights of nonnegative vertex weightings with weight at most `1` on every coclique. -/
theorem fractionalChromaticNumber_eq_sSup :
    fractionalChromaticNumber G =
      sSup {t | ∃ g : V → ℝ, (∀ x, 0 ≤ g x) ∧
        (∀ s : Finset V, G.IsIndepSet (s : Set V) → ∑ x ∈ s, g x ≤ 1) ∧ ∑ x, g x = t} := by
  sorry

/-- **5.3 (Godsil–Royle, §7.1 and Corollary 7.5.3).** `n / α ≤ χ_f ≤ χ`. -/
theorem card_div_indepNum_le_fractionalChromaticNumber :
    (Fintype.card V : ℝ) / G.indepNum ≤ fractionalChromaticNumber G ∧
      fractionalChromaticNumber G ≤ G.chromaticNumber.toNat := by
  sorry

variable {G}

/-- **5.3 (Godsil–Royle, Corollary 7.5.2).** A vertex-transitive graph has `χ_f = n / α`. -/
theorem IsVertexTransitive.fractionalChromaticNumber_eq (hG : IsVertexTransitive G) :
    fractionalChromaticNumber G = Fintype.card V / G.indepNum := by
  sorry

variable (G)

/-- **5.4 (Godsil–Royle, Theorem 7.4.5).** `χ_f` is the least `v / r` over the `r ≥ 1` and `v`
with a homomorphism from `G` to the Kneser graph `K(v, r)`. -/
theorem isLeast_fractionalChromaticNumber_kneser :
    IsLeast {q : ℝ | ∃ v r : ℕ, 0 < r ∧
        Nonempty (G →g kneserGraph (Fin v) r) ∧ q = (v : ℝ) / r}
      (fractionalChromaticNumber G) := by
  sorry

end Layer5

/-! ## Layer 6: theta values, Haemers' bound and vector colourings -/

section Layer6

variable {V : Type*} [Fintype V] [DecidableEq V] {G : _root_.SimpleGraph V} [DecidableRel G.Adj]

/-- **6.1 (Brouwer–Haemers, p. 45, after Proposition 3.7.5).** A `k`-regular edge-transitive
graph with `k > 0` has `ϑ = -n θₙ / (k - θₙ)`. -/
theorem IsRegularOfDegree.lovaszTheta_eq_of_isEdgeTransitive [Nonempty V] {k : ℕ}
    (hG : G.IsRegularOfDegree k) (hk : 0 < k) (he : IsEdgeTransitive G) :
    lovaszTheta G = -(Fintype.card V * smallestEigenvalue G) / (k - smallestEigenvalue G) := by
  sorry

/-- **6.1 (Brouwer–Haemers, p. 45, after Proposition 3.7.5).** A strongly regular graph of
degree `k > 0` has `ϑ = -n θₙ / (k - θₙ)`. -/
theorem IsSRGWith.lovaszTheta_eq [Nonempty V] {n k ℓ μ : ℕ} (hG : G.IsSRGWith n k ℓ μ)
    (hk : 0 < k) :
    lovaszTheta G = -(Fintype.card V * smallestEigenvalue G) / (k - smallestEigenvalue G) := by
  sorry

variable (G)

/-- **6.2 (Brouwer–Haemers, p. 43 and Theorem 3.7.8).** Haemers' bound: over any field, the
Shannon capacity is at most the rank of a matrix with nonzero diagonal that vanishes at distinct
nonadjacent pairs. -/
theorem shannonCapacity_le_rank {K : Type*} [Field K] (B : Matrix V V K)
    (hdiag : ∀ x, B x x ≠ 0) (hoff : ∀ x y, x ≠ y → ¬ G.Adj x y → B x y = 0) :
    shannonCapacity G ≤ B.rank := by
  sorry

/-- **6.3** A vector colouring of `G` with parameter `t ≥ 1`: unit vectors with
`(t - 1) ⟪u x, u y⟫ ≤ -1` at adjacent pairs. -/
def IsVectorColouring {d : ℕ} (u : V → EuclideanSpace ℝ (Fin d)) (t : ℝ) : Prop :=
  1 ≤ t ∧ (∀ x, ‖u x‖ = 1) ∧ ∀ x y, G.Adj x y → (t - 1) * inner ℝ (u x) (u y) ≤ -1

/-- **6.3** A strict vector colouring of `G` with parameter `t ≥ 1`: unit vectors with
`(t - 1) ⟪u x, u y⟫ = -1` at adjacent pairs. -/
def IsStrictVectorColouring {d : ℕ} (u : V → EuclideanSpace ℝ (Fin d)) (t : ℝ) : Prop :=
  1 ≤ t ∧ (∀ x, ‖u x‖ = 1) ∧ ∀ x y, G.Adj x y → (t - 1) * inner ℝ (u x) (u y) = -1

/-- **6.3** The vector chromatic number: the infimum of the parameters of vector colourings. -/
def vectorChromaticNumber : ℝ :=
  sInf {t | ∃ (d : ℕ) (u : V → EuclideanSpace ℝ (Fin d)), IsVectorColouring G u t}

/-- **6.3** The strict vector chromatic number: the infimum of the parameters of strict vector
colourings. -/
def strictVectorChromaticNumber : ℝ :=
  sInf {t | ∃ (d : ℕ) (u : V → EuclideanSpace ℝ (Fin d)), IsStrictVectorColouring G u t}

/-- **6.3** On a nonempty vertex type the strict vector chromatic number is `ϑ(Gᶜ)`, and
`χ_v ≤ χ_sv ≤ χ`. -/
theorem strictVectorChromaticNumber_eq [Nonempty V] :
    strictVectorChromaticNumber G = lovaszTheta Gᶜ ∧
      vectorChromaticNumber G ≤ strictVectorChromaticNumber G ∧
      strictVectorChromaticNumber G ≤ G.chromaticNumber.toNat := by
  sorry

end Layer6

/-! ## Layer 7: Kneser graphs -/

section Layer7

variable {α : Type*} [Fintype α] [DecidableEq α]

/-- **7.1 (Godsil–Royle, Theorem 9.4.3).** For `1 ≤ k` and `2k ≤ v`, the least adjacency
eigenvalue of `K(v, k)` is `-C(v - k - 1, k - 1)`. -/
theorem isLeast_adjSpectrum_kneserGraph {k : ℕ} (hk : 1 ≤ k) (hv : 2 * k ≤ Fintype.card α) :
    IsLeast {x | x ∈ adjSpectrum (kneserGraph α k)}
      (-((Fintype.card α - k - 1).choose (k - 1) : ℝ)) := by
  sorry

/-- **7.2 (Godsil–Royle, Theorem 7.9.1).** For `1 ≤ k` and `2k < v`, `K(v, k)` is a core. -/
theorem isCore_kneserGraph {k : ℕ} (hk : 1 ≤ k) (hv : 2 * k < Fintype.card α) :
    IsCore (kneserGraph α k) := by
  sorry

/-- **7.3 (Godsil–Royle, Corollary 7.7.3).** For `1 ≤ k` and `2k ≤ v`, `χ_f(K(v, k)) = v / k`. -/
theorem fractionalChromaticNumber_kneserGraph {k : ℕ} (hk : 1 ≤ k)
    (hv : 2 * k ≤ Fintype.card α) :
    fractionalChromaticNumber (kneserGraph α k) = (Fintype.card α : ℝ) / k := by
  sorry

/-- **7.3** For `1 ≤ k` and `2k ≤ v`, `ϑ(K(v, k)) = C(v - 1, k - 1)`. -/
theorem lovaszTheta_kneserGraph {k : ℕ} (hk : 1 ≤ k) (hv : 2 * k ≤ Fintype.card α) :
    lovaszTheta (kneserGraph α k) = (Fintype.card α - 1).choose (k - 1) := by
  sorry

end Layer7

end SimpleGraph

end TauCetiRoadmap.CocliquesColouringsAndTheta

/-! ## Library declarations consumed -/

#check @SimpleGraph.indepNum
#check @SimpleGraph.cliqueNum
#check @SimpleGraph.IsIndepSet
#check @SimpleGraph.Colorable
#check @SimpleGraph.chromaticNumber
#check @SimpleGraph.Hom
#check @SimpleGraph.Iso
#check @SimpleGraph.induce
#check @SimpleGraph.Embedding.induce
#check @SimpleGraph.IsRegularOfDegree
#check @SimpleGraph.IsSRGWith
#check @SimpleGraph.cycleGraph
#check @SimpleGraph.fromEdgeSet
#check @SimpleGraph.fromRel
#check @SimpleGraph.fromRel_adj
#check @SimpleGraph.deleteEdges
#check @SimpleGraph.sum
#check @SimpleGraph.Coloring
#check @SimpleGraph.Coloring.sumEquiv
#check @SimpleGraph.IsTree
#check @SimpleGraph.ConnectedComponent
#check @Matrix.PosSemidef
#check @Matrix.PosSemidef.kronecker
#check @Matrix.rank
#check @Matrix.kroneckerMap
#check @Matrix.toLin_kronecker
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.posSemidef_gram
#check @Matrix.gram
#check @EuclideanSpace
#check @MulAction.IsPretransitive
#check @MulAction.card_orbit_mul_card_stabilizer_eq_card_group
#check @Equiv.Perm.exists_map_finset_eq
#check @Finite.injective_iff_bijective
#check @Finset.erdos_ko_rado
#check @Polynomial.eq_of_infinite_eval_eq
#check @descPochhammer
#check @descPochhammer_eval_eq_descFactorial
#check @Fintype.card_embedding_eq
#check @LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner
#check @Matrix.posSemidef_iff_eq_conjTranspose_mul_self
#check @Matrix.IsHermitian.eigenvalues₀_add_le
#check @Matrix.rank_submatrix_le
#check @Matrix.cramer
#check @Matrix.mulVec_cramer
