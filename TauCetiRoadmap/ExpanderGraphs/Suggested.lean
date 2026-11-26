module

public import Mathlib
public import TauCeti.Analysis.Matrix.Eigenvalues.Basic
public import TauCeti.Analysis.Matrix.SpectralMeasure.RankPerturbation
public import TauCeti.Probability.Distributions.Semicircle.LocationScale

/-!
# Expander graphs: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (forms of a
headline, defining lemmas, lemmas on a proof route and corollaries) are stated there in prose
with their locators or proof routes, and are not stated here.

Conventions (README, Conventions): `G : SimpleGraph V` on a finite type; `G.interedges S T`
(Mathlib) counts ordered adjacent pairs in `S × T`; `adjEigenvalues G i` is `θ_{i+1}`, Mathlib's
`eigenvalues₀` of `G.adjMatrix ℝ` in nonincreasing order; `algebraicConnectivity G` is `ν_{n-1}`,
the Laplacian eigenvalue at the index `n - 2` of the nonincreasing enumeration, and `0` for
`n ≤ 1`. Operators on `ℓ²` of an infinite graph are tested on finitely supported functions.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues of
SpectralGraphBounds 1.1; the sorted Laplacian eigenvalues and the algebraic connectivity of
LaplacianEigenvaluesOfGraphs 1.1; the weighted degree, Laplacian, volume, cut weight, conductance
and Cheeger constant of KernelsAndSpectralMethods 1.1, 2.2 and 3.1; the non-backtracking cycles,
their counts, the zeta function and the Ramanujan property of IharaZetaFunction 1.2, 2.1 and 5.3;
the signed adjacency matrix of MatchingPolynomial 2.1; the `2`-lift and the tree walk numbers of
RamanujanGraphs 3.1 and 5.1; and almost invariant vectors and relative property (T) of
FactorRigidity 3.1.
-/

@[expose] public section

noncomputable section

universe w

open SimpleGraph Matrix Filter Topology MeasureTheory
open scoped BoundedContinuousFunction Pointwise

namespace TauCetiRoadmap.ExpanderGraphs

/-! ## Local copy: SpectralGraphBounds, 1.1 -/

namespace SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end SpectralGraphBounds

/-! ## Local copy: LaplacianEigenvaluesOfGraphs, 1.1 -/

namespace LaplacianEigenvaluesOfGraphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one and index `n - 1` the smallest. -/
def lapEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_lapMatrix ℝ).eigenvalues₀

/-- 1.1 The algebraic connectivity: the second smallest Laplacian eigenvalue, at index `n - 2`,
and `0` when `n ≤ 1`. -/
def algebraicConnectivity (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  if h : 2 ≤ Fintype.card V then lapEigenvalues G ⟨Fintype.card V - 2, by omega⟩ else 0

end LaplacianEigenvaluesOfGraphs

/-! ## Local copy: KernelsAndSpectralMethods, 1.1, 2.2 and 3.1 -/

namespace KernelsAndSpectralMethods

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **1.1** The weighted degree `dᵢ = ∑ⱼ Wᵢⱼ`; a loop counts once. -/
def degree (W : Matrix V V ℝ) (i : V) : ℝ := ∑ j, W i j

/-- **1.1** The combinatorial Laplacian `L = D - W`. -/
def laplacian (W : Matrix V V ℝ) : Matrix V V ℝ := Matrix.diagonal (degree W) - W

/-- **2.2** The volume `vol S = ∑_{i ∈ S} dᵢ`. -/
def graphVolume (W : Matrix V V ℝ) (S : Finset V) : ℝ := ∑ i ∈ S, degree W i

/-- **2.2** The weight of the cut between `S` and its complement. -/
def cutWeight (W : Matrix V V ℝ) (S : Finset V) : ℝ := ∑ i ∈ S, ∑ j ∈ Sᶜ, W i j

/-- **3.1** The conductance `cut(S) / min(vol S, vol Sᶜ)` of a vertex set. -/
def conductance (W : Matrix V V ℝ) (S : Finset V) : ℝ :=
  cutWeight W S / min (graphVolume W S) (graphVolume W Sᶜ)

/-- **3.1** The Cheeger constant: the least conductance of a nonempty proper vertex set. For
`card V = 1` the index set is empty and the value is `0`. -/
def cheegerConstant (W : Matrix V V ℝ) : ℝ :=
  ⨅ S : {S : Finset V // S.Nonempty ∧ S ≠ Finset.univ}, conductance W S.1

end KernelsAndSpectralMethods

/-! ## Local copy: IharaZetaFunction, 1.2, 2.1 and 5.3 -/

namespace IharaZetaFunction

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.2 A closed walk is a non-backtracking cycle when no dart of `p.darts ++ p.darts.take 1` is
followed by its reversal: no backtracking and no tail. -/
def IsNonBacktrackingCycle {G : SimpleGraph V} {u : V} (p : G.Walk u u) : Prop :=
  (p.darts ++ p.darts.take 1).IsChain fun d d' => d' ≠ d.symm

/-- 1.2 The number `N_m` of closed non-backtracking cycles of length `m`, each counted with its
starting vertex. -/
def closedNonBacktrackingCount (G : SimpleGraph V) (m : ℕ) : ℕ :=
  Nat.card {c : Σ u : V, G.Walk u u // c.2.length = m ∧ IsNonBacktrackingCycle c.2}

/-- 2.1 The Ihara zeta function `ζ(u) = exp(Σ_m N_m u^m / m)` in `ℚ⟦u⟧`. -/
def iharaZeta (G : SimpleGraph V) : PowerSeries ℚ :=
  (PowerSeries.exp ℚ).subst
    (PowerSeries.mk fun m => (closedNonBacktrackingCount G m : ℚ) / m)

/-- 5.3 The Ramanujan property: every adjacency eigenvalue `λ` with `|λ| ≠ q + 1` has
`|λ| ≤ 2√q`. -/
def IsRamanujan (q : ℕ) (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∀ v, |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≠ q + 1 →
    |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≤ 2 * Real.sqrt q

end IharaZetaFunction

/-! ## Local copy: MatchingPolynomial, 2.1 -/

namespace MatchingPolynomial

variable {V : Type*}

/-- 2.1 The signed adjacency matrix of a signing `s` of the edges of `G`: the entry at `(i, j)` is
`s` of the edge `ij` when `i ~ j`, and `0` otherwise. -/
def signedAdjMatrix [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : G.edgeSet → ℤˣ) : Matrix V V ℤ :=
  Matrix.of fun i j =>
    if h : G.Adj i j then ((s ⟨s(i, j), (SimpleGraph.mem_edgeSet G).2 h⟩ : ℤˣ) : ℤ) else 0

end MatchingPolynomial

/-! ## Local copy: RamanujanGraphs, 3.1 and 5.1 -/

namespace RamanujanGraphs

section Lifts

variable {V : Type*}

/-- 3.1 The 2-lift of `G` along a signing `s`, on `V × Bool`: an edge `uv` with `s(uv) = 1`
lifts to `(u, b) ~ (v, b)`, and one with `s(uv) = −1` lifts to `(u, b) ~ (v, !b)`. -/
def twoLift (G : SimpleGraph V) (s : G.edgeSet → ℤˣ) : SimpleGraph (V × Bool) :=
  SimpleGraph.fromRel fun x y =>
    ∃ h : G.Adj x.1 y.1, (s ⟨s(x.1, y.1), (SimpleGraph.mem_edgeSet G).2 h⟩ = 1 ↔ x.2 = y.2)

/-- 3.1 Adjacency in a 2-lift is decidable when adjacency in `G` is. -/
instance [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (s : G.edgeSet → ℤˣ) :
    DecidableRel (twoLift G s).Adj := fun x y => by
  unfold twoLift
  rw [SimpleGraph.fromRel_adj]
  infer_instance

end Lifts

/-- 5.1 Weighted counts of walks in the `d`-regular tree from its root: `treeWalkCount d ℓ h` is
the number of walks of length `ℓ` from the root that end at distance `h` from it, summed over
the vertices at distance `h`. A step away from the root has `d` choices at the root and `d − 1`
elsewhere; a step towards it has one. The tree numbers are `t_ℓ = treeWalkCount d ℓ 0`. -/
def treeWalkCount (d : ℕ) : ℕ → ℕ → ℕ
  | 0, h => if h = 0 then 1 else 0
  | ℓ + 1, 0 => treeWalkCount d ℓ 1
  | ℓ + 1, h + 1 => (if h = 0 then d else d - 1) * treeWalkCount d ℓ h + treeWalkCount d ℓ (h + 2)

end RamanujanGraphs

/-! ## Local copy: FactorRigidity, 3.1 -/

namespace FactorRigidity

/-- A representation of a discrete group has almost invariant vectors when for every finite set
`F` of group elements and every `ε > 0` some unit vector is moved by less than `ε` by each element
of `F`. -/
def HasAlmostInvariantVectors {Γ H : Type*} [Group Γ] [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (ρ : ContRepresentation ℂ Γ H) : Prop :=
  ∀ (F : Finset Γ) (ε : ℝ), 0 < ε → ∃ ξ : H, ‖ξ‖ = 1 ∧ ∀ g ∈ F, ‖ρ g ξ - ξ‖ < ε

/-- A subgroup `Λ` of a discrete group `Γ` has relative property (T) in `Γ` when every unitary
representation of `Γ` on a complex Hilbert space (in universe `u`) with almost invariant vectors
has a nonzero `Λ`-invariant vector (Anantharaman–Popa, Definition 14.1.1). -/
def RelativePropertyT.{u, v} {Γ : Type v} [Group Γ] (Λ : Subgroup Γ) : Prop :=
  ∀ (H : Type u) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (ρ : ContRepresentation ℂ Γ H), (∀ g v, ‖ρ g v‖ = ‖v‖) → HasAlmostInvariantVectors ρ →
      ∃ ξ : H, ξ ≠ 0 ∧ ∀ h ∈ Λ, ρ h ξ = ξ

end FactorRigidity

open SpectralGraphBounds LaplacianEigenvaluesOfGraphs KernelsAndSpectralMethods
  IharaZetaFunction MatchingPolynomial RamanujanGraphs FactorRigidity

/-! ## Layer 1: expansion constants and expander families -/

section Expansion

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]

/-- **1.1** The edge boundary `∂S`, as the ordered pairs `(x, y)` with `x ∈ S`, `y ∉ S` and
`x ~ y`; it is in bijection with the edges leaving `S`. -/
def edgeBoundary (S : Finset V) : Finset (V × V) := G.interedges S Sᶜ

/-- **1.1** The isoperimetric constant `h(Γ) = min |∂S| / |S|` over nonempty `S` with
`|S| ≤ n / 2`. On at most one vertex the index set is empty and the value is `0`. -/
def isoperimetricConstant : ℝ :=
  ⨅ S : {S : Finset V // S.Nonempty ∧ 2 * S.card ≤ Fintype.card V},
    ((edgeBoundary G S.1).card : ℝ) / S.1.card

/-- **1.2** The second-largest adjacency eigenvalue `θ₂`, and `0` on fewer than two vertices. -/
def secondAdjEigenvalue : ℝ :=
  if h : 2 ≤ Fintype.card V then adjEigenvalues G ⟨1, h⟩ else 0

/-- **1.2** `ρ(Γ) = max_{i ≥ 2} |θ_i|`, and `0` on at most one vertex. -/
def nontrivialSpectralRadius : ℝ :=
  ⨆ i : {i : Fin (Fintype.card V) // (i : ℕ) ≠ 0}, |adjEigenvalues G i|

/-- **1.1** On two or more vertices the isoperimetric constant is attained and bounds every
admissible set; the boundaries of a set and of its complement have the same size; and
`h(Γ) > 0` exactly when the graph is connected. -/
theorem isoperimetricConstant_spec (hV : 2 ≤ Fintype.card V) :
    (∃ S : Finset V, S.Nonempty ∧ 2 * S.card ≤ Fintype.card V ∧
      isoperimetricConstant G = (edgeBoundary G S).card / S.card) ∧
    (∀ S : Finset V, S.Nonempty → 2 * S.card ≤ Fintype.card V →
      isoperimetricConstant G ≤ (edgeBoundary G S).card / S.card) ∧
    (∀ S : Finset V, (edgeBoundary G Sᶜ).card = (edgeBoundary G S).card) ∧
    (0 < isoperimetricConstant G ↔ G.Connected) := by
  sorry

/-- **1.3** For the weight matrix `A + diag(c)`, the weighted degree of
KernelsAndSpectralMethods 1.1 is `deg + c`, its Laplacian is the Laplacian of `G`, and its cut
weights are the boundary sizes. -/
theorem cutWeight_adjMatrix_add_diagonal (c : V → ℝ) :
    degree (G.adjMatrix ℝ + Matrix.diagonal c) = (fun x ↦ (G.degree x : ℝ) + c x) ∧
      laplacian (G.adjMatrix ℝ + Matrix.diagonal c) = G.lapMatrix ℝ ∧
      ∀ S : Finset V,
        cutWeight (G.adjMatrix ℝ + Matrix.diagonal c) S = (edgeBoundary G S).card := by
  sorry

/-- **1.3** If a weight matrix has constant degree `k > 0` and its cut weights count the boundary
edges of `G`, its Cheeger constant (KernelsAndSpectralMethods 3.1) is `h(Γ) / k`. -/
theorem cheegerConstant_eq_isoperimetricConstant_div {W : Matrix V V ℝ} {k : ℝ}
    (hk : 0 < k) (hD : degree W = fun _ ↦ k)
    (hcut : ∀ S, cutWeight W S = (edgeBoundary G S).card) (hV : 2 ≤ Fintype.card V) :
    cheegerConstant W = isoperimetricConstant G / k := by
  sorry

end Expansion

/-- **1.2** An expander family of degree `k`: connected `k`-regular graphs whose orders tend to
infinity and whose isoperimetric constants are bounded below by one positive constant (on the
graphs with at least two vertices, where `h` is not the junk value `0`). -/
structure IsExpanderFamily (k : ℕ) {V : ℕ → Type*} [∀ m, Fintype (V m)] [∀ m, DecidableEq (V m)]
    (X : ∀ m, SimpleGraph (V m)) [∀ m, DecidableRel (X m).Adj] : Prop where
  connected : ∀ m, (X m).Connected
  regular : ∀ m, (X m).IsRegularOfDegree k
  tendsto_card : Tendsto (fun m ↦ Fintype.card (V m)) atTop atTop
  exists_pos_le : ∃ ε > 0, ∀ m, 2 ≤ Fintype.card (V m) → ε ≤ isoperimetricConstant (X m)

/-! ## Layer 2: the Cheeger inequality and the diameter -/

section Cheeger

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]

/-- **2.1** (Nica, Theorems 11.7 and 11.15) A graph on at least two vertices with maximum degree
`d` and algebraic connectivity `ν_{n-1}` has `ν_{n-1} / 2 ≤ h(Γ) ≤ √(2 d ν_{n-1})`. -/
theorem isoperimetricConstant_bounds (hV : 2 ≤ Fintype.card V) :
    algebraicConnectivity G / 2 ≤ isoperimetricConstant G ∧
      isoperimetricConstant G ≤ Real.sqrt (2 * G.maxDegree * algebraicConnectivity G) := by
  sorry

/-- **2.2** (Davidoff–Sarnak–Valette, Theorem 1.2.3) A `k`-regular graph on at least two
vertices has `(k - θ₂) / 2 ≤ h(Γ) ≤ √(2k(k - θ₂))`. -/
theorem isoperimetricConstant_bounds_of_isRegularOfDegree {k : ℕ} (hG : G.IsRegularOfDegree k)
    (hV : 2 ≤ Fintype.card V) :
    (k - secondAdjEigenvalue G) / 2 ≤ isoperimetricConstant G ∧
      isoperimetricConstant G ≤ Real.sqrt (2 * k * (k - secondAdjEigenvalue G)) := by
  sorry

/-- **2.3** (Krebs–Shaheen, Lemma 4.5 and Proposition 4.6, with the maximum degree) A graph on
at least two vertices with `0 < ε ≤ h(Γ)` and maximum degree `D` has diameter at most
`2 log n / log(1 + ε / D)`. -/
theorem diam_le_of_le_isoperimetricConstant (hV : 2 ≤ Fintype.card V) {ε : ℝ} (hε : 0 < ε)
    (hh : ε ≤ isoperimetricConstant G) :
    (G.diam : ℝ) ≤ 2 * Real.log (Fintype.card V) / Real.log (1 + ε / G.maxDegree) := by
  sorry

end Cheeger

/-- **2.2** A family of connected `k`-regular graphs with orders tending to infinity is an
expander family exactly when the spectral gaps `k - θ₂` are bounded below by one positive
constant. -/
theorem isExpanderFamily_iff_spectralGap {k : ℕ} {V : ℕ → Type*} [∀ m, Fintype (V m)]
    [∀ m, DecidableEq (V m)] (X : ∀ m, SimpleGraph (V m)) [∀ m, DecidableRel (X m).Adj]
    (hc : ∀ m, (X m).Connected) (hr : ∀ m, (X m).IsRegularOfDegree k)
    (hn : Tendsto (fun m ↦ Fintype.card (V m)) atTop atTop) :
    IsExpanderFamily k X ↔
      ∃ ε > 0, ∀ m, 2 ≤ Fintype.card (V m) → ε ≤ k - secondAdjEigenvalue (X m) := by
  sorry

/-! ## Layer 3: Ramanujan families -/

/-- **3.1** For `q ≥ 2`, a family of connected `(q + 1)`-regular Ramanujan graphs whose orders
tend to infinity is an expander family. -/
theorem isExpanderFamily_of_isRamanujan {q : ℕ} (hq : 2 ≤ q) {V : ℕ → Type*}
    [∀ m, Fintype (V m)] [∀ m, DecidableEq (V m)] (X : ∀ m, SimpleGraph (V m))
    [∀ m, DecidableRel (X m).Adj] (hc : ∀ m, (X m).Connected)
    (hr : ∀ m, (X m).IsRegularOfDegree (q + 1)) (hR : ∀ m, IsRamanujan q (X m))
    (hn : Tendsto (fun m ↦ Fintype.card (V m)) atTop atTop) :
    IsExpanderFamily (q + 1) X := by
  sorry

/-- **3.2** For every `d ≥ 3` there is an expander family of degree `d` whose `m`-th member has
`2 d 2^m` vertices. -/
theorem exists_isExpanderFamily {d : ℕ} (hd : 3 ≤ d) :
    ∃ (X : ∀ m : ℕ, SimpleGraph (Fin (2 * d * 2 ^ m))) (_ : ∀ m, DecidableRel (X m).Adj),
      IsExpanderFamily d X := by
  sorry

/-! ## Layer 4: the regular tree -/

/-- **4.1** The vertex set of the `k`-regular tree: reduced words over `Fin k`, with no two
equal adjacent letters. -/
def RegularTreeVertex (k : ℕ) : Type := {l : List (Fin k) // l.IsChain (· ≠ ·)}

/-- **4.1** Equality of reduced words is decidable. -/
instance (k : ℕ) : DecidableEq (RegularTreeVertex k) :=
  inferInstanceAs (DecidableEq {l : List (Fin k) // l.IsChain (· ≠ ·)})

/-- **4.1** The `k`-regular tree: a word is adjacent to the words obtained by prepending a letter
to it or removing its first letter. -/
def regularTree (k : ℕ) : SimpleGraph (RegularTreeVertex k) :=
  fromRel fun x y ↦ ∃ a, y.1 = a :: x.1

/-- **4.1** The root, the empty word. -/
def regularTreeRoot (k : ℕ) : RegularTreeVertex k := ⟨[], List.isChain_nil⟩

/-- **4.1** The regular tree is a tree, every vertex has exactly `k` neighbours, and every tree
in which each vertex has exactly `k` neighbours is isomorphic to it. Neighbourhoods are counted
with `Set.encard`, so that a vertex of infinite degree does not count as having `0` neighbours. -/
theorem regularTree_spec (k : ℕ) :
    (regularTree k).IsTree ∧ (∀ v, ((regularTree k).neighborSet v).encard = k) ∧
      ∀ {W : Type w} (T : SimpleGraph W), T.IsTree →
        (∀ v, (T.neighborSet v).encard = k) → Nonempty (T ≃g regularTree k) := by
  sorry

/-- **4.2** The closed walks of length `ℓ` at the root of the `k`-regular tree number
`treeWalkCount k ℓ 0` (RamanujanGraphs 5.1). -/
theorem card_walk_regularTreeRoot (k ℓ : ℕ) :
    Nat.card {w : (regularTree k).Walk (regularTreeRoot k) (regularTreeRoot k) //
      w.length = ℓ} = treeWalkCount k ℓ 0 := by
  sorry

/-- **4.3** (Lubotzky, Proposition 4.5.2, for the norm) For `k ≥ 2` and `r = 2√(k - 1)`, the
adjacency operator of the `k`-regular tree, `(A f)(x) = ∑_{y ∼ x} f(y)`, is a bounded operator on
`ℓ²` with norm `r` and spectrum `[-r, r]`. -/
theorem exists_adjacencyOperator_regularTree {k : ℕ} (hk : 2 ≤ k) :
    ∃ A : lp (fun _ : RegularTreeVertex k ↦ ℂ) 2 →L[ℂ] lp (fun _ : RegularTreeVertex k ↦ ℂ) 2,
      (∀ f x, (A f : RegularTreeVertex k → ℂ) x =
        ∑' y : (regularTree k).neighborSet x, (f : RegularTreeVertex k → ℂ) y) ∧
      ‖A‖ = 2 * Real.sqrt ((k : ℝ) - 1) ∧
      spectrum ℂ A = Complex.ofReal '' Set.Icc (-(2 * Real.sqrt ((k : ℝ) - 1)))
        (2 * Real.sqrt ((k : ℝ) - 1)) := by
  sorry

/-! ## Layer 5: coverings and switching -/

section Coverings

variable {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V} [DecidableRel G.Adj]

/-- **5.1** A covering of graphs: a surjective homomorphism that is a bijection from each
neighbourhood onto the neighbourhood of the image. -/
def IsCovering {V W : Type*} {G : SimpleGraph V} {H : SimpleGraph W} (f : G →g H) : Prop :=
  Function.Surjective f ∧ ∀ x, Set.BijOn f (G.neighborSet x) (H.neighborSet (f x))

/-- **5.1** (Brouwer–Haemers, §6.4) Pulling back an adjacency eigenvector along a covering gives
an eigenvector for the same eigenvalue. -/
theorem IsCovering.adjMatrix_mulVec_comp {W : Type*} [Fintype W] [DecidableEq W]
    {H : SimpleGraph W} [DecidableRel H.Adj] {f : G →g H} (hf : IsCovering f) {θ : ℝ}
    {u : W → ℝ} (hu : H.adjMatrix ℝ *ᵥ u = θ • u) :
    G.adjMatrix ℝ *ᵥ (u ∘ f) = θ • (u ∘ f) := by
  sorry

/-- **5.1** (Brouwer–Haemers, §6.4) The characteristic polynomial of the base of a covering
divides that of the cover: the spectrum of the base is contained in that of the cover, with
multiplicity. -/
theorem IsCovering.charpoly_dvd {W : Type*} [Fintype W] [DecidableEq W]
    {H : SimpleGraph W} [DecidableRel H.Adj] {f : G →g H} (hf : IsCovering f) :
    (H.adjMatrix ℤ).charpoly ∣ (G.adjMatrix ℤ).charpoly := by
  sorry

/-- **5.1** A covering of a connected graph has fibres of constant size. -/
theorem IsCovering.exists_card_fiber_eq {W : Type*} {H : SimpleGraph W} {f : G →g H}
    (hf : IsCovering f) (hH : H.Connected) :
    ∃ m : ℕ, ∀ y, Nat.card (f ⁻¹' {y}) = m := by
  sorry

variable (G) in
/-- **5.2** Switching a signing at `v` negates the signs of the edges at `v`. -/
def switchSigning (s : G.edgeSet → ℤˣ) (v : V) : G.edgeSet → ℤˣ :=
  fun e ↦ if v ∈ (e : Sym2 V) then -s e else s e

variable (G) in
/-- **5.2** Switching gives an isomorphic `2`-lift and leaves the characteristic polynomial of
the signed adjacency matrix unchanged. -/
theorem twoLift_switchSigning (s : G.edgeSet → ℤˣ) (v : V) :
    Nonempty (twoLift G (switchSigning G s v) ≃g twoLift G s) ∧
      (signedAdjMatrix G (switchSigning G s v)).charpoly = (signedAdjMatrix G s).charpoly := by
  sorry

end Coverings

/-! ## Layer 6: prime cycles and the Euler product -/

section Primes

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]

/-- **6.1** A cyclically reduced closed walk of length `m`, as a cyclic sequence: consecutive
vertices adjacent and `v_{i+2} ≠ v_i`, indices modulo `m`. -/
def IsCyclicallyReduced (m : ℕ) (a : Fin m → V) : Prop :=
  ∀ i, G.Adj (a i) (a (finRotate m i)) ∧ a i ≠ a (finRotate m (finRotate m i))

/-- **6.1** The number of cyclically reduced sequences of length `m`. -/
def cyclicallyReducedCount (m : ℕ) : ℕ :=
  Nat.card {a : Fin m → V // IsCyclicallyReduced G m a}

/-- **6.1** The number `P_m` of primitive ones: those fixed by no nontrivial rotation. It is `m`
times the number of prime cycles of length `m`. -/
def primitiveCount (m : ℕ) : ℕ :=
  Nat.card {a : Fin m → V // IsCyclicallyReduced G m a ∧
    ∀ d, 0 < d → d < m → a ∘ (finRotate m)^[d] ≠ a}

/-- **6.1** For `m ≥ 1` the cyclically reduced sequences of length `m` are the closed
non-backtracking cycles of IharaZetaFunction 1.2, read off by their vertices. -/
theorem cyclicallyReducedCount_eq {m : ℕ} (hm : 0 < m) :
    cyclicallyReducedCount G m = closedNonBacktrackingCount G m := by
  sorry

/-- **6.2** For `m ≥ 1`, `N_m = ∑_{d ∣ m} P_d`, and `m ∣ P_m`. -/
theorem cyclicallyReducedCount_eq_sum_primitiveCount {m : ℕ} (hm : 0 < m) :
    cyclicallyReducedCount G m = ∑ d ∈ m.divisors, primitiveCount G d ∧
      m ∣ primitiveCount G m := by
  sorry

/-- **6.3** (the Euler product; Lubotzky, p. 58) Modulo `u^{M + 1}` the zeta function of
IharaZetaFunction 2.1 is `∏_{d = 1}^{M} (1 - u^d)^{-P_d/d}`, where `P_d / d` is the number of
prime cycles of length `d`. -/
theorem trunc_iharaZeta (M : ℕ) :
    PowerSeries.trunc (M + 1) (iharaZeta G) =
      PowerSeries.trunc (M + 1) (∏ d ∈ Finset.Icc 1 M,
        PowerSeries.invOfUnit (1 - PowerSeries.X ^ d) 1 ^ (primitiveCount G d / d)) := by
  sorry

end Primes

/-! ## Layer 7: the Lubotzky–Phillips–Sarnak graphs -/

section LPS

/-- **7.1** The integral quaternions of norm `p` that are `≡ 1` or `≡ i + j + k` modulo `2`;
up to sign, one in each class of `8` associates. -/
def lpsQuaternions (p : ℕ) : Set (Quaternion ℤ) :=
  {α | Quaternion.normSq α = p ∧
    ((Odd α.re ∧ Even α.imI ∧ Even α.imJ ∧ Even α.imK) ∨
      (Even α.re ∧ Odd α.imI ∧ Odd α.imJ ∧ Odd α.imK))}

/-- **7.1** (Davidoff–Sarnak–Valette, Proposition 2.5.2) The splitting
`ψ : ℍ(𝔽_q) → M₂(𝔽_q)` attached to `x² + y² + 1 = 0`, applied to the reduction of an integral
quaternion. -/
def quaternionSplitting {q : ℕ} (x y : ZMod q) (α : Quaternion ℤ) :
    Matrix (Fin 2) (Fin 2) (ZMod q) :=
  !![α.re + α.imI * x + α.imK * y, -(α.imI * y) + α.imJ + α.imK * x;
    -(α.imI * y) - α.imJ + α.imK * x, α.re - α.imI * x - α.imK * y]

/-- **7.1** `PGL₂(𝔽_q)`, the quotient of `GL₂(𝔽_q)` by its centre. -/
abbrev PGL₂ (q : ℕ) : Type :=
  GL (Fin 2) (ZMod q) ⧸ Subgroup.center (GL (Fin 2) (ZMod q))

variable (p q : ℕ) [Fact q.Prime]

/-- **7.1** The image of `PSL₂(𝔽_q)` in `PGL₂(𝔽_q)`. -/
def pslInPGL : Subgroup (PGL₂ q) :=
  ((QuotientGroup.mk' _).comp Matrix.SpecialLinearGroup.toGL).range

/-- **7.1** The connection set `S_{p,q}`: the images in `PGL₂(𝔽_q)` of `lpsQuaternions p`. -/
def lpsSet (x y : ZMod q) : Set (PGL₂ q) :=
  (fun α ↦ if h : (quaternionSplitting x y α).det ≠ 0 then
    (QuotientGroup.mk (Matrix.GeneralLinearGroup.mkOfDetNeZero _ h) : PGL₂ q) else 1) ''
    lpsQuaternions p

/-- **7.1** The vertex group: `PSL₂(𝔽_q)` when `p` is a square modulo `q`, and `PGL₂(𝔽_q)`
otherwise. -/
def lpsGroup : Subgroup (PGL₂ q) := if IsSquare (p : ZMod q) then pslInPGL q else ⊤

/-- **7.1** The LPS graph `X^{p,q}`: the Cayley graph of `lpsGroup p q` with respect to
`S_{p,q}`. -/
def lpsGraph (x y : ZMod q) : SimpleGraph (lpsGroup p q) :=
  mulCayley (((↑) : lpsGroup p q → PGL₂ q) ⁻¹' lpsSet p q x y)

/-- **7.2** (Davidoff–Sarnak–Valette, Lemma 4.2.1, Remark 4.2.3(c), Proposition 4.3.3) For
distinct odd primes with `q > 2√p` and `x² + y² + 1 = 0` in `𝔽_q`: `S_{p,q}` lies in
`lpsGroup p q`, is symmetric, avoids `1` and has `p + 1` elements; every vertex has `p + 1`
neighbours; the vertex group has order `q (q² - 1) / 2` and the girth is at least `2 log_p q`
when `p` is a square modulo `q`; otherwise the vertex group has order `q (q² - 1)`, the graph is
bipartite and its girth is at least `4 log_p q - log_p 4`. -/
theorem lpsGraph_spec (hp : p.Prime) (hp2 : p ≠ 2) (hq2 : q ≠ 2) (hpq : p ≠ q)
    (hqp : 2 * Real.sqrt p < q) {x y : ZMod q} (hxy : x ^ 2 + y ^ 2 + 1 = 0) :
    lpsSet p q x y ⊆ lpsGroup p q ∧ (lpsSet p q x y)⁻¹ = lpsSet p q x y ∧
      (1 : PGL₂ q) ∉ lpsSet p q x y ∧ (lpsSet p q x y).ncard = p + 1 ∧
      (∀ v, ((lpsGraph p q x y).neighborSet v).ncard = p + 1) ∧
      (IsSquare (p : ZMod q) → Nat.card (lpsGroup p q) = q * (q ^ 2 - 1) / 2 ∧
        (⌈2 * Real.logb p q⌉₊ : ℕ∞) ≤ (lpsGraph p q x y).egirth) ∧
      (¬ IsSquare (p : ZMod q) → Nat.card (lpsGroup p q) = q * (q ^ 2 - 1) ∧
        (lpsGraph p q x y).IsBipartite ∧
        (⌈4 * Real.logb p q - Real.logb p 4⌉₊ : ℕ∞) ≤ (lpsGraph p q x y).egirth) := by
  sorry

end LPS

open scoped Classical in
/-- **7.3** (Davidoff–Sarnak–Valette, Theorem 4.3.5, Corollary 4.3.6 and Theorem 4.4.4) Let
`p ≥ 5` be prime. For `q > p⁸` the graph `X^{p,q}` is connected, and not bipartite when `p` is a
square modulo `q`; and for `0 < ε < 1/6` and `q` large, every adjacency eigenvalue `μ` with
`|μ| ≠ p + 1` has `|μ| ≤ p^{5/6 + ε} + p^{1/6 - ε}`. -/
theorem lpsGraph_connected_and_spectral_bound {p : ℕ} (hp : p.Prime) (hp5 : 5 ≤ p) :
    (∀ (q : ℕ) [Fact q.Prime] (x y : ZMod q), (p : ℝ) ^ 8 < q →
      x ^ 2 + y ^ 2 + 1 = 0 → (lpsGraph p q x y).Connected ∧
        (IsSquare (p : ZMod q) → ¬ (lpsGraph p q x y).IsBipartite)) ∧
    ∀ ε : ℝ, 0 < ε → ε < 1 / 6 → ∃ Q : ℕ, ∀ (q : ℕ) [Fact q.Prime] (x y : ZMod q), Q ≤ q →
      x ^ 2 + y ^ 2 + 1 = 0 → ∀ i, |adjEigenvalues (lpsGraph p q x y) i| ≠ p + 1 →
        |adjEigenvalues (lpsGraph p q x y) i| ≤
          (p : ℝ) ^ (5 / 6 + ε) + (p : ℝ) ^ (1 / 6 - ε) := by
  sorry

/-! ## Layer 8: groups and expanders -/

open scoped Classical in
/-- **8.1** (Lubotzky, Proposition 3.3.1) For a group with Kazhdan's property (T), in the form
of FactorRigidity 3.1, and a finite generating set `S`, the Cayley graphs of all finite quotients
with at least two elements, with respect to the image of `S`, have isoperimetric constants
bounded below by one `ε > 0`. -/
theorem exists_pos_le_isoperimetricConstant_of_propertyT {Γ : Type} [Group Γ]
    (hT : RelativePropertyT.{0, 0} (⊤ : Subgroup Γ)) (S : Finset Γ)
    (hS : Subgroup.closure (S : Set Γ) = ⊤) :
    ∃ ε > 0, ∀ (N : Subgroup Γ) [N.Normal] [Fintype (Γ ⧸ N)], 2 ≤ Fintype.card (Γ ⧸ N) →
      ε ≤ isoperimetricConstant
        (mulCayley ((QuotientGroup.mk : Γ → Γ ⧸ N) '' (S : Set Γ))) := by
  sorry

/-- **8.2** The four bijections of `ℤ/m × ℤ/m` defining the Margulis graphs:
`(a, b) ↦ (a + 1, b)`, `(a, b + 1)`, `(a, a + b)` and `(-b, a)`. -/
def margulisMap (m : ℕ) : Fin 4 → ZMod m × ZMod m → ZMod m × ZMod m :=
  ![fun w ↦ (w.1 + 1, w.2), fun w ↦ (w.1, w.2 + 1), fun w ↦ (w.1, w.1 + w.2),
    fun w ↦ (-w.2, w.1)]

/-- **8.2** The Margulis multigraph on `ℤ/m × ℤ/m`, as its adjacency matrix: `(a, b)` is joined
to its images under the four maps and to its preimages; every row sums to `8`. -/
def margulisMatrix (m : ℕ) : Matrix (ZMod m × ZMod m) (ZMod m × ZMod m) ℕ :=
  fun u v ↦ ∑ i, ((if v = margulisMap m i u then 1 else 0) +
    (if u = margulisMap m i v then 1 else 0))

/-- **8.2** Auxiliary: the Margulis matrix is symmetric, which names its eigenvalues. -/
theorem isHermitian_margulisMatrix (m : ℕ) [NeZero m] :
    ((margulisMatrix m).map ((↑) : ℕ → ℝ)).IsHermitian := by
  ext u v
  simp only [conjTranspose_apply, map_apply, star_trivial, margulisMatrix]
  exact congrArg _ (Finset.sum_congr rfl fun _ _ ↦ add_comm _ _)

/-- **8.2** (Margulis; Lubotzky, Proposition 3.3.5) The Margulis multigraphs form an expander
family: their second-largest eigenvalues are at most `8 - ε` for one `ε > 0`. -/
theorem exists_pos_eigenvalues₀_margulis_le :
    ∃ ε > 0, ∀ (m : ℕ) [NeZero m] (h : 2 ≤ Fintype.card (ZMod m × ZMod m)),
      (isHermitian_margulisMatrix m).eigenvalues₀ ⟨1, h⟩ ≤ 8 - ε := by
  sorry

/-- **8.3** (Krebs–Shaheen, proof of Proposition 4.25) A connected Cayley graph of a finite
abelian group `A` with a symmetric connection set of `d` elements has diameter at least
`|A|^{1/d} - 1`. -/
theorem diam_addCayley_ge {A : Type*} [AddCommGroup A] [Fintype A] [DecidableEq A]
    {S : Finset A} (hS : -S = S) (hc : (addCayley (S : Set A)).Connected) :
    (Fintype.card A : ℝ) ^ (1 / (S.card : ℝ)) - 1 ≤ (addCayley (S : Set A)).diam := by
  sorry

open scoped Classical in
/-- **8.3** (Krebs–Shaheen, Corollary 4.26; Lubotzky, Proposition 3.3.7) For every `k` and
`ε > 0`, every Cayley graph of a large enough finite abelian group with a connection set of at
most `k` elements has isoperimetric constant below `ε`. -/
theorem abelian_not_expander (k : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ N : ℕ, ∀ (A : Type w) [AddCommGroup A] [Fintype A] [DecidableEq A] (S : Finset A),
      S.card ≤ k → N ≤ Fintype.card A → isoperimetricConstant (addCayley (S : Set A)) < ε := by
  sorry

/-! ## Layer 9: spectra of random graphs -/

open scoped Classical in
/-- **9.1** (Van Mieghem, Theorems 50 and 52 and art. 190; Füredi–Komlós) For `0 < p < 1`, in
the binomial random graph `G(n, p)`: `θ₁ / (p n) → 1` in probability; for every `ε > 0`, with
probability tending to `1`, `max_{i ≥ 2} |θ_i| ≤ (2 + ε) √(p (1 - p) n)`; and the empirical
distribution of `θ_i / √n` converges weakly in probability to the semicircle law of variance
`p (1 - p)`. -/
theorem binomialRandom_spectrum {p : unitInterval} (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) :
    (∀ ε : ℝ, 0 < ε → Tendsto (fun n : ℕ ↦ binomialRandom (Fin n) p
      {G | ε < |(⨆ i, adjEigenvalues G i) / (p * n) - 1|}) atTop (𝓝 0)) ∧
    (∀ ε : ℝ, 0 < ε → Tendsto (fun n : ℕ ↦ binomialRandom (Fin n) p
      {G | (2 + ε) * Real.sqrt (p * (1 - p) * n) < nontrivialSpectralRadius G}) atTop (𝓝 0)) ∧
    ∀ (f : ℝ →ᵇ ℝ) (ε : ℝ), 0 < ε → Tendsto (fun n : ℕ ↦ binomialRandom (Fin n) p
      {G | ε < |(n : ℝ)⁻¹ * ∑ i, f (adjEigenvalues G i / Real.sqrt n) -
        ∫ x, f x ∂(TauCeti.Probability.semicircleReal 0 (Real.toNNReal (p * (1 - p))))|})
      atTop (𝓝 0) := by
  sorry

/-! ## Library declarations consumed -/

#check @SimpleGraph.interedges
#check @SimpleGraph.lapMatrix
#check @SimpleGraph.IsRegularOfDegree
#check @SimpleGraph.maxDegree
#check @SimpleGraph.diam
#check @SimpleGraph.egirth
#check @SimpleGraph.egirth_eq_top
#check @SimpleGraph.IsTree
#check @SimpleGraph.mulCayley
#check @SimpleGraph.addCayley
#check @SimpleGraph.binomialRandom
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.charpoly
#check @PowerSeries.exp
#check @PowerSeries.subst
#check @PowerSeries.invOfUnit
#check @PowerSeries.trunc
#check @Quaternion.normSq
#check @Nat.sum_four_squares
#check @Matrix.GeneralLinearGroup.mkOfDetNeZero
#check @Matrix.IsHermitian.eigenvalues₀_add_le
#check @Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card
#check @TauCeti.Probability.semicircleReal
#check @lp
#check @spectrum
#check @LinearMap.mkContinuous
#check @ContinuousLinearMap.extend
#check @IsSelfAdjoint.mem_spectrum_eq_re
#check @spectrum.subset_closedBall_norm

end TauCetiRoadmap.ExpanderGraphs
