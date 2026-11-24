module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.CourantFischer
public import TauCeti.Analysis.InnerProductSpace.KyFan
public import TauCeti.Combinatorics.Graph.Serre.Cycle.Basic
public import TauCeti.Combinatorics.SimpleGraph.Connectivity.EdgeConnectivity
public import TauCeti.Combinatorics.SimpleGraph.Connectivity.VertexConnectivity
public import TauCeti.LinearAlgebra.ExteriorPower.Plucker
public import TauCeti.LinearAlgebra.FreeModule.CardQuotient
public import TauCeti.LinearAlgebra.Matrix.PerronFrobenius.Irreducible
public import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation

/-!
# Laplacian spectra and spanning trees: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (forms of a
headline, defining lemmas, lemmas on a proof route and corollaries) are stated there in prose
with their locators or proof routes, and are not stated here.

Conventions (README, Conventions): `lapEigenvalues G i` is `ν_{i+1}`, Mathlib's `eigenvalues₀`
of `G.lapMatrix ℝ` in nonincreasing order; `largestLapEigenvalue G` is `ν₁` and
`algebraicConnectivity G` is `ν_{n-1}`, at the index `n - 2`; `signlessLapEigenvalues G i` is
`q_{i+1}`. An orientation is Tau Ceti's `TauCeti.DoubledQuiver.Orientation G`, and the oriented
incidence matrix has column `e_{d.fst} - e_{d.snd}` at the chosen dart `d`. Spanning trees and
rooted forests are finite sets of edges.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted Laplacian eigenvalues, the largest one,
the algebraic connectivity and the unit network of LaplacianEigenvaluesOfGraphs 1.1 and 7.1, the
signless Laplacian of GraphSpectra 1.1, the weighted graphs, normalized Laplacian and spectral gap
of KernelsAndSpectralMethods 1.1, 1.2 and 2.1, and the networks and effective resistance of
ElectricalNetworksAndRandomWalks 1.1 and 2.1. Minors of simple graphs are this roadmap's own
definitions, by minor models (branch sets), with `G.IsMinor H` saying that `H` is a minor of `G`.
-/

@[expose] public section

noncomputable section

open SimpleGraph Matrix Finset

namespace TauCetiRoadmap.LaplacianSpectraAndSpanningTrees

/-! ## Local copy: LaplacianEigenvaluesOfGraphs, 1.1 -/

namespace LaplacianEigenvaluesOfGraphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one and index `n - 1` the smallest. -/
def lapEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_lapMatrix ℝ).eigenvalues₀

/-- 1.1 The largest Laplacian eigenvalue of a graph on a nonempty vertex type. -/
def largestLapEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  lapEigenvalues G ⟨0, Fintype.card_pos⟩

/-- 1.1 The algebraic connectivity: the second smallest Laplacian eigenvalue, at index `n - 2`,
and `0` when `n ≤ 1`. -/
def algebraicConnectivity (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  if h : 2 ≤ Fintype.card V then lapEigenvalues G ⟨Fintype.card V - 2, by omega⟩ else 0

end LaplacianEigenvaluesOfGraphs

/-! ## Local copy: GraphSpectra, 1.1 -/

namespace GraphSpectra

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The signless Laplacian `Q = D + A` of a simple graph. -/
def signlessLapMatrix (R : Type*) [AddMonoidWithOne R] : Matrix V V R :=
  G.degMatrix R + G.adjMatrix R

/-- The real signless Laplacian is symmetric. -/
theorem isHermitian_signlessLapMatrix : (signlessLapMatrix G ℝ).IsHermitian :=
  (isHermitian_diagonal_of_self_adjoint _ (by ext; simp)).add (G.isHermitian_adjMatrix ℝ)

/-- The signless Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order
`q₁ ≥ ⋯ ≥ qₙ`: index `0` carries the largest one, as for `adjEigenvalues`. -/
def signlessLapEigenvalues : Fin (Fintype.card V) → ℝ :=
  (isHermitian_signlessLapMatrix G).eigenvalues₀

end SimpleGraph

end GraphSpectra

/-! ## Local copy: KernelsAndSpectralMethods, 1.1, 1.2 and 2.1 -/

namespace KernelsAndSpectralMethods

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **1.1** A weighted graph: a symmetric matrix with nonnegative entries. -/
structure IsWeightedGraph (W : Matrix V V ℝ) : Prop where
  symm : W.IsSymm
  nonneg : ∀ i j, 0 ≤ W i j

/-- **1.1** The weighted degree `dᵢ = ∑ⱼ Wᵢⱼ`; a loop counts once. -/
def degree (W : Matrix V V ℝ) (i : V) : ℝ := ∑ j, W i j

/-- **1.1** The combinatorial Laplacian `L = D - W`. -/
def laplacian (W : Matrix V V ℝ) : Matrix V V ℝ := Matrix.diagonal (degree W) - W

/-- **1.1** The normalized Laplacian `𝓛 = D^{-1/2} L D^{-1/2}`, with the convention
`0⁻¹ = 0`: a vertex of degree `0` gives a zero row and column. -/
def normalizedLaplacian (W : Matrix V V ℝ) : Matrix V V ℝ :=
  Matrix.diagonal (fun i ↦ (Real.sqrt (degree W i))⁻¹) * laplacian W *
    Matrix.diagonal (fun i ↦ (Real.sqrt (degree W i))⁻¹)

/-- **1.1** The simple graph of the positive weights; loops are dropped. -/
def positiveGraph (W : Matrix V V ℝ) : SimpleGraph V :=
  SimpleGraph.fromRel fun i j ↦ 0 < W i j

/-- **1.2** Auxiliary: the normalized Laplacian of a symmetric weight matrix is symmetric, which
names the eigenvalues of `𝓛`. -/
theorem isHermitian_normalizedLaplacian {W : Matrix V V ℝ} (hW : W.IsSymm) :
    (normalizedLaplacian W).IsHermitian := by
  simp [normalizedLaplacian, laplacian, Matrix.IsHermitian, Matrix.mul_assoc, hW.eq]

/-- **2.1** The spectral gap of `𝓛`, as the infimum of the Rayleigh quotient
`gᵀ L g / ∑ dᵢ gᵢ²` over nonzero `g` with `∑ dᵢ gᵢ = 0`. The quotient is nonnegative for a
weighted graph, so the infimum is bounded below. For `card V = 1` the value is `0`: with a loop
the index set is empty, and without one every nonzero `g` qualifies with quotient `0/0 = 0`. -/
def fiedlerValue (W : Matrix V V ℝ) : ℝ :=
  ⨅ g : {g : V → ℝ // g ≠ 0 ∧ ∑ i, degree W i * g i = 0},
    (g.1 ⬝ᵥ (laplacian W *ᵥ g.1)) / ∑ i, degree W i * g.1 i ^ 2

end KernelsAndSpectralMethods

/-! ## Local copy: ElectricalNetworksAndRandomWalks, 1.1 and 2.1 -/

namespace ElectricalNetworksAndRandomWalks

/-- 1.1 A network on `V`: a symmetric nonnegative conductance function. Loops `cond x x` are
allowed; a pair `x ≠ y` with `cond x y = 0` is not an edge. -/
structure Network (V : Type*) where
  /-- The conductance `c(x, y)` between `x` and `y`. -/
  cond : V → V → ℝ
  /-- Conductances are symmetric. -/
  symm : ∀ x y, cond x y = cond y x
  /-- Conductances are nonnegative. -/
  nonneg : ∀ x y, 0 ≤ cond x y

namespace Network

variable {V : Type*} [Fintype V] (N : Network V)

/-- 1.1 The weight `c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

/-- 1.1 The graph of the network: `x` and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

/-- 1.1 The conductance of an unordered pair. -/
def edgeCond : Sym2 V → ℝ := Sym2.lift ⟨N.cond, N.symm⟩

variable [DecidableEq V]

/-- 2.1 The Laplacian `diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 2.1 The Laplacian with the row and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 2.1 The voltage of the unit current from `a` to `z`, grounded at `z`: the column of `a` of the
inverse of the grounded Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 2.1 The effective resistance `R(a ↔ z)`: the voltage at `a` of the unit current from `a` to
`z`. -/
def effResistance (a z : V) : ℝ := N.voltage a z a

end Network

end ElectricalNetworksAndRandomWalks

/-! ## Local copy: LaplacianEigenvaluesOfGraphs, 7.1 -/

namespace LaplacianEigenvaluesOfGraphs

open ElectricalNetworksAndRandomWalks

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 7.1 The network of a simple graph with unit conductances: `c(x, y) = 1` when `x ~ y` and
`0` otherwise. -/
def unitNetwork (G : SimpleGraph V) [DecidableRel G.Adj] : Network V where
  cond x y := if G.Adj x y then 1 else 0
  symm x y := by simp only [G.adj_comm]
  nonneg x y := by split_ifs <;> norm_num

end LaplacianEigenvaluesOfGraphs

open TauCetiRoadmap.LaplacianSpectraAndSpanningTrees LaplacianEigenvaluesOfGraphs GraphSpectra
  GraphSpectra.SimpleGraph KernelsAndSpectralMethods ElectricalNetworksAndRandomWalks

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: the oriented incidence matrix -/

section Layer1

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]
variable (O : TauCeti.DoubledQuiver.Orientation G) [Fintype O.carrier]

/-- The oriented incidence matrix of an orientation: the column of the chosen dart `d` is
`e_{d.fst} - e_{d.snd}`. (README 1.1) -/
def orientedIncMatrix (R : Type*) [Ring R] : Matrix V O.carrier R :=
  fun x d ↦ if x = d.1.fst then 1 else if x = d.1.snd then -1 else 0

/-- **`L = B Bᵀ`** over any commutative ring. (README 1.1) -/
theorem orientedIncMatrix_mul_transpose (R : Type*) [CommRing R] :
    orientedIncMatrix G O R * (orientedIncMatrix G O R)ᵀ = G.lapMatrix R := by
  sorry

/-- **Bridge to Tau Ceti's incidence boundary**: the boundary of a chain of chosen darts of the
Serre graph of `G` is `-(B c)`. (README 1.1) Sanity check of the definitions. -/
theorem incidenceBoundary_eq_neg_mulVec (R : Type*) [CommRing R] (c : O.carrier → R) :
    ⇑(G.toSerreGraph.incidenceBoundary O.carrier R
        ((Finsupp.equivFunOnFinite (α := O.carrier) (M := R)).symm c)) =
      -(orientedIncMatrix G O R *ᵥ c) := by
  sorry

omit [DecidableRel G.Adj] [Fintype O.carrier] in
/-- **Cut vectors**: `Bᵀ 𝟙_S` is `1` on a chosen dart leaving `S`, `-1` on one entering `S`,
and `0` otherwise. (README 1.1) Sanity check of the definitions. -/
theorem transpose_orientedIncMatrix_mulVec_indicator (R : Type*) [CommRing R] (S : Finset V)
    (d : O.carrier) :
    ((orientedIncMatrix G O R)ᵀ *ᵥ fun x ↦ if x ∈ S then 1 else 0) d =
      (if d.1.fst ∈ S then 1 else 0) - (if d.1.snd ∈ S then 1 else 0) := by
  sorry

/-- **The rank of `B`** is `n - c`. (README 1.2) -/
theorem rank_orientedIncMatrix :
    (orientedIncMatrix G O ℝ).rank = Fintype.card V - Nat.card G.ConnectedComponent := by
  sorry

/-- **The cut space** `im Bᵀ` is the orthogonal complement of the cycle space `ker B`.
(README 1.2) -/
theorem mem_range_transpose_orientedIncMatrix_iff (f : O.carrier → ℝ) :
    f ∈ LinearMap.range (orientedIncMatrix G O ℝ)ᵀ.mulVecLin ↔
      ∀ g ∈ LinearMap.ker (orientedIncMatrix G O ℝ).mulVecLin, f ⬝ᵥ g = 0 := by
  sorry

end Layer1

/-! ## Layer 2: the matrix-tree theorems -/

section Layer2

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

open Classical in
/-- The spanning trees of `G`, as edge sets. (README 2.1) -/
def spanningTrees : Finset (Finset (Sym2 V)) :=
  G.edgeFinset.powerset.filter fun F ↦ (fromEdgeSet (F : Set (Sym2 V))).IsTree

/-- The number of spanning trees. (README 2.1) -/
def numSpanningTrees : ℕ := #G.spanningTrees

open Classical in
/-- The spanning forests rooted at `R`: acyclic edge sets in which every vertex is joined to
exactly one vertex of `R`. (README 2.1) -/
def rootedForests (R : Finset V) : Finset (Finset (Sym2 V)) :=
  G.edgeFinset.powerset.filter fun F ↦ (fromEdgeSet (F : Set (Sym2 V))).IsAcyclic ∧
    ∀ v, ∃! r, r ∈ R ∧ (fromEdgeSet (F : Set (Sym2 V))).Reachable v r

/-- The weight `∏_{e ∈ F} w e` of an edge set. (README 2.1) -/
def forestWeight (w : Sym2 V → ℝ) (F : Finset (Sym2 V)) : ℝ := ∏ e ∈ F, w e

/-- The weighted adjacency matrix of edge weights `w`: `w s(x, y)` on edges and `0` elsewhere.
(README 2.1) -/
def weightMatrix (w : Sym2 V → ℝ) : Matrix V V ℝ :=
  fun x y ↦ if G.Adj x y then w s(x, y) else 0

/-- **`L_w = B diag(w) Bᵀ`**. (README 2.1) Sanity check of the definitions. -/
theorem orientedIncMatrix_mul_diagonal_mul_transpose
    (O : TauCeti.DoubledQuiver.Orientation G) [Fintype O.carrier] (w : Sym2 V → ℝ) :
    orientedIncMatrix G O ℝ * Matrix.diagonal (fun d : O.carrier ↦ w d.1.edge) *
        (orientedIncMatrix G O ℝ)ᵀ =
      laplacian (G.weightMatrix w) := by
  sorry

/-- Nonnegative weights give a positive semidefinite Laplacian. (README 2.1) Sanity check of the
definitions. -/
theorem posSemidef_laplacian_weightMatrix {w : Sym2 V → ℝ} (hw : ∀ e ∈ G.edgeSet, 0 ≤ w e) :
    (laplacian (G.weightMatrix w)).PosSemidef := by
  sorry

/-- The forests rooted at a single vertex are the spanning trees. (README 2.1) Sanity check of
the definitions. -/
theorem rootedForests_singleton (q : V) : G.rootedForests {q} = G.spanningTrees := by
  sorry

/-- A graph on a nonempty vertex type has a spanning tree exactly when it is connected.
(README 2.1) -/
theorem numSpanningTrees_pos_iff [Nonempty V] : 0 < G.numSpanningTrees ↔ G.Connected := by
  sorry

/-- **The rooted-forest theorem**: for real edge weights and every `R`, the principal minor of
`L_w` off `R` is the total weight of the forests rooted at `R`. For `R = ∅` both sides vanish on
a nonempty vertex type, and for `R = V` both are `1`. (README 2.2) -/
theorem det_submatrix_laplacian_weightMatrix (w : Sym2 V → ℝ) (R : Finset V) :
    ((laplacian (G.weightMatrix w)).submatrix (fun x : {x // x ∉ R} ↦ x.1)
        (fun x ↦ x.1)).det = ∑ F ∈ G.rootedForests R, forestWeight w F := by
  sorry

/-- **Temperley's formula** `N = det(L + J/n²)`. (README 2.3) -/
theorem det_lapMatrix_add_smul_of_one [Nonempty V] :
    (G.lapMatrix ℝ + (1 / (Fintype.card V : ℝ) ^ 2) • of (fun _ _ : V ↦ (1 : ℝ))).det =
      G.numSpanningTrees := by
  sorry

/-- **The eigenvalue form** `n N = ν₁ ⋯ ν_{n-1}`: the product of the `n - 1` largest Laplacian
eigenvalues. For one vertex the product is empty. (README 2.3) -/
theorem card_mul_numSpanningTrees [Nonempty V] :
    (Fintype.card V : ℝ) * G.numSpanningTrees =
      ∏ i : Fin (Fintype.card V - 1), lapEigenvalues G ⟨i.1, by have := i.2; omega⟩ := by
  sorry

end Layer2

end SimpleGraph

/-! ## Layer 3: spanning trees and effective resistance -/

section Layer3

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The Laplacian of a network is the weighted Laplacian of its graph with the edge
conductances as weights; loops enter neither side. (README 3.1) Sanity check of the definitions. -/
theorem laplacian_eq_laplacian_weightMatrix (N : Network V) :
    N.laplacian = laplacian (N.graph.weightMatrix N.edgeCond) := by
  sorry

open Classical in
/-- **Kirchhoff's formula**: for `a ≠ z`, `R(a ↔ z)` is the weight of the spanning forests rooted
at `{a, z}` divided by the weight of the spanning trees. On a disconnected network both sides are
`0`. (README 3.1) -/
theorem effResistance_eq_sum_rootedForests_div (N : Network V) {a z : V} (haz : a ≠ z) :
    N.effResistance a z =
      (∑ F ∈ N.graph.rootedForests {a, z}, forestWeight N.edgeCond F) /
        ∑ T ∈ N.graph.spanningTrees, forestWeight N.edgeCond T := by
  sorry

open Classical in
/-- **Edge probabilities of a random spanning tree**: a spanning tree drawn with probability
proportional to its weight contains `s(a, z)` with probability `c(a, z) R(a ↔ z)`. For `a = z`,
for a non-edge and on a disconnected network both sides are `0`. (README 3.2) -/
theorem sum_forestWeight_mem_div (N : Network V) (a z : V) :
    (∑ T ∈ N.graph.spanningTrees with s(a, z) ∈ T, forestWeight N.edgeCond T) /
        ∑ T ∈ N.graph.spanningTrees, forestWeight N.edgeCond T =
      N.cond a z * N.effResistance a z := by
  sorry

/-- **Resistance in a tree is distance.** (README 3.3) -/
theorem SimpleGraph.IsTree.effResistance_unitNetwork {G : SimpleGraph V} [DecidableRel G.Adj]
    (hG : G.IsTree) (x y : V) :
    (unitNetwork G).effResistance x y = G.dist x y := by
  sorry

end Layer3

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 4: the critical group -/

section Layer4

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

variable (V) in
/-- The integer vectors with coordinate sum `0`. (README 4.1) -/
def sumZeroLattice : Submodule ℤ (V → ℤ) :=
  LinearMap.ker (∑ x, LinearMap.proj (R := ℤ) (φ := fun _ : V ↦ ℤ) x)

/-- The **critical group** `(ℤⱽ ∩ 𝟙^⊥) / L ℤⱽ`. (README 4.1) -/
abbrev criticalGroup : Type _ :=
  sumZeroLattice V ⧸
    (LinearMap.range (G.lapMatrix ℤ).mulVecLin).comap (sumZeroLattice V).subtype

/-- The reduced Laplacian at `q`. (README 4.1) -/
def reducedLapMatrix (q : V) : Matrix {x // x ≠ q} {x // x ≠ q} ℤ :=
  (G.lapMatrix ℤ).submatrix Subtype.val Subtype.val

/-- **The reduced-Laplacian presentation** of the critical group. (README 4.1) -/
theorem nonempty_criticalGroup_addEquiv_reduced (q : V) :
    Nonempty (G.criticalGroup ≃+
      (({x // x ≠ q} → ℤ) ⧸ LinearMap.range (G.reducedLapMatrix q).mulVecLin)) := by
  sorry

/-- **The order of the critical group** is the number of spanning trees, with `Nat.card = 0` for
an infinite group; for a disconnected graph both sides are `0`. (README 4.1) -/
theorem nat_card_criticalGroup [Nonempty V] : Nat.card G.criticalGroup = G.numSpanningTrees := by
  sorry

variable (O : TauCeti.DoubledQuiver.Orientation G) [Fintype O.carrier]

/-- The integer points of `ℚ^ι`. (README 4.2) -/
def integerPoints (ι : Type*) [DecidableEq ι] : Submodule ℤ (ι → ℚ) :=
  Submodule.span ℤ (Set.range fun i : ι ↦ Pi.single i (1 : ℚ))

/-- The dual `{x ∈ span_ℚ Λ : x ⬝ᵥ y ∈ ℤ for all y ∈ Λ}` of a lattice. (README 4.2) -/
def dualLattice {ι : Type*} [Fintype ι] [DecidableEq ι] (Λ : Submodule ℤ (ι → ℚ)) :
    Submodule ℤ (ι → ℚ) :=
  (toBilin' (1 : Matrix ι ι ℚ)).dualSubmodule Λ ⊓
    (Submodule.span ℚ (Λ : Set (ι → ℚ))).restrictScalars ℤ

/-- The cut lattice, spanned by the rows of `B`. (README 4.2) -/
def cutLattice : Submodule ℤ (O.carrier → ℚ) :=
  Submodule.span ℤ (Set.range fun x : V ↦ fun d ↦ orientedIncMatrix G O ℚ x d)

/-- The flow lattice, the integer points of `ker B`. (README 4.2) -/
def flowLattice : Submodule ℤ (O.carrier → ℚ) :=
  (LinearMap.ker (orientedIncMatrix G O ℚ).mulVecLin).restrictScalars ℤ ⊓
    integerPoints O.carrier

/-- **The lattice descriptions**: for a connected graph the critical group is the discriminant
group `C*/C` of the cut lattice and `F*/F` of the flow lattice. (README 4.2) -/
theorem nonempty_criticalGroup_addEquiv_dual (hG : G.Connected) :
    Nonempty (G.criticalGroup ≃+
        (dualLattice (cutLattice G O) ⧸ (cutLattice G O).comap
          (dualLattice (cutLattice G O)).subtype)) ∧
      Nonempty (G.criticalGroup ≃+
        (dualLattice (flowLattice G O) ⧸ (flowLattice G O).comap
          (dualLattice (flowLattice G O)).subtype)) := by
  sorry

end Layer4

/-! ## Layer 5: the distance matrix of a tree -/

section Layer5

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The distance matrix. (README 5.1) -/
def distMatrix : Matrix V V ℝ := of fun x y ↦ (G.dist x y : ℝ)

/-- The vector `τ x = 2 - d(x)`. (README 5.1) -/
def treeDegreeVec : V → ℝ := fun x ↦ 2 - G.degree x

omit [Fintype V] [DecidableEq V] [DecidableRel G.Adj] in
/-- The distance matrix is symmetric, which names its eigenvalues. (README 5.1) -/
theorem isHermitian_distMatrix : G.distMatrix.IsHermitian := by
  ext x y
  simp [distMatrix, SimpleGraph.dist_comm]

/-- **`L Δ = τ 𝟙ᵀ - 2 I`** for a tree. (README 5.1) -/
theorem IsTree.lapMatrix_mul_distMatrix (hG : G.IsTree) :
    G.lapMatrix ℝ * G.distMatrix =
      vecMulVec G.treeDegreeVec 1 - (2 : ℝ) • (1 : Matrix V V ℝ) := by
  sorry

/-- **`Δ τ = (n - 1) 𝟙`** for a tree. (README 5.1) -/
theorem IsTree.distMatrix_mulVec_treeDegreeVec (hG : G.IsTree) :
    G.distMatrix *ᵥ G.treeDegreeVec = fun _ ↦ (Fintype.card V : ℝ) - 1 := by
  sorry

/-- **The Graham–Lovász inverse.** (README 5.2) -/
theorem IsTree.inv_distMatrix (hG : G.IsTree) (h : 2 ≤ Fintype.card V) :
    G.distMatrix⁻¹ = -(1 / 2 : ℝ) • G.lapMatrix ℝ +
      (1 / (2 * ((Fintype.card V : ℝ) - 1))) • vecMulVec G.treeDegreeVec G.treeDegreeVec := by
  sorry

/-- **The Graham–Pollak determinant.** For one vertex both sides are `0`. (README 5.2) -/
theorem IsTree.det_distMatrix (hG : G.IsTree) :
    G.distMatrix.det =
      (-1) ^ (Fintype.card V - 1) * ((Fintype.card V : ℝ) - 1) * 2 ^ (Fintype.card V - 2) := by
  sorry

/-- **The inertia of `Δ`**: one positive and `n - 1` negative eigenvalues. (README 5.2) -/
theorem IsTree.inertia_distMatrix (hG : G.IsTree) (h : 2 ≤ Fintype.card V) :
    #{i | 0 < (G.isHermitian_distMatrix).eigenvalues i} = 1 ∧
      #{i | (G.isHermitian_distMatrix).eigenvalues i < 0} = Fintype.card V - 1 := by
  sorry

end Layer5

/-! ## Layer 6: Fiedler's bounds and sums of small eigenvalues -/

section Layer6

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- **Fiedler's upper bounds**: `ν_{n-1} ≤ n δ / (n - 1)` and, for a graph that is not complete,
`ν_{n-1} ≤ κ`. (README 6.1) -/
theorem algebraicConnectivity_le (h : 2 ≤ Fintype.card V) :
    algebraicConnectivity G ≤ Fintype.card V * G.minDegree / (Fintype.card V - 1 : ℝ) ∧
    (G ≠ ⊤ → algebraicConnectivity G ≤ G.vertexConnectivity.toNat) := by
  sorry

/-- **Fiedler's lower bound** `ν_{n-1} ≥ 2 κ' (1 - cos (π / n))`. (README 6.2) -/
theorem two_mul_edgeConnectivity_mul_le_algebraicConnectivity (h : 2 ≤ Fintype.card V) :
    2 * G.edgeConnectivity.toNat * (1 - Real.cos (Real.pi / Fintype.card V)) ≤
      algebraicConnectivity G := by
  sorry

/-- **Energy minimization**: over orthonormal families of `k ≤ n - 1` vectors orthogonal to `𝟙`,
the least value of `∑ᵢ xᵢᵀ L xᵢ` is `ν_{n-1} + ⋯ + ν_{n-k}`, at the indices
`n - 2, …, n - 1 - k`. (README 6.3) -/
theorem isLeast_sum_quadForm_lapMatrix {k : ℕ} (hk : k + 1 ≤ Fintype.card V) :
    IsLeast {t | ∃ x : Fin k → V → ℝ, (∀ i j, x i ⬝ᵥ x j = if i = j then 1 else 0) ∧
        (∀ i, x i ⬝ᵥ (fun _ ↦ 1) = 0) ∧ t = ∑ i, x i ⬝ᵥ (G.lapMatrix ℝ *ᵥ x i)}
      (∑ i : Fin k, lapEigenvalues G ⟨Fintype.card V - 2 - i.val, by omega⟩) := by
  sorry

/-- **The spectral gap of a weight with constant degree**: if `W` has constant degree `k > 0`
and Laplacian `G.lapMatrix ℝ`, then `fiedlerValue W = ν_{n-1} / k`. (README 6.4) -/
theorem fiedlerValue_eq_algebraicConnectivity_div {W : Matrix V V ℝ} {k : ℝ} (hk : 0 < k)
    (hD : degree W = fun _ ↦ k) (hL : laplacian W = G.lapMatrix ℝ)
    (h : 2 ≤ Fintype.card V) :
    fiedlerValue W = algebraicConnectivity G / k := by
  sorry

end Layer6

end SimpleGraph

/-! ## Layer 7: the normalized Laplacian -/

section Layer7

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **The multiplicity of `2`** for a weighted graph without loops: the number of bipartite
components of the positive graph with at least two vertices. No degree hypothesis: a vertex of
degree `0` is isolated in the positive graph and counts on neither side. (README 7.1) -/
theorem finrank_eigenspace_two_normalizedLaplacian {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hloop : ∀ x, W x x = 0) :
    Module.finrank ℝ (Module.End.eigenspace (toLin' (normalizedLaplacian W)) 2) =
      Nat.card {c : (positiveGraph W).ConnectedComponent //
        c.supp.Nontrivial ∧ ((positiveGraph W).induce c.supp).IsBipartite} := by
  sorry

/-- **The trace and the extreme normalized eigenvalues** of a simple graph without isolated
vertices on `n ≥ 2` vertices: `tr 𝓛 = n`, `λ₁ = n / (n - 1)` exactly for `Kₙ`, `λ₁ ≤ 1` otherwise,
and the largest eigenvalue is at least `n / (n - 1)`. (README 7.2) -/
theorem normalizedLaplacian_bounds (G : SimpleGraph V) [DecidableRel G.Adj]
    (h : ∀ v, 0 < G.degree v) (h2 : 2 ≤ Fintype.card V) :
    (normalizedLaplacian (G.adjMatrix ℝ)).trace = Fintype.card V ∧
      (fiedlerValue (G.adjMatrix ℝ) = Fintype.card V / ((Fintype.card V : ℝ) - 1) ↔ G = ⊤) ∧
      (G ≠ ⊤ → fiedlerValue (G.adjMatrix ℝ) ≤ 1) ∧
      ((Fintype.card V : ℝ) / ((Fintype.card V : ℝ) - 1) ≤
        ⨆ i, (isHermitian_normalizedLaplacian (G.isSymm_adjMatrix)).eigenvalues i) := by
  sorry

end Layer7

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 8: Laplacian bounds on cuts -/

section Layer8

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- **Spectral bounds on cuts**: for every `S`, the number of edges leaving `S` lies between
`ν_{n-1} |S| (n - |S|) / n` and `ν₁ |S| (n - |S|) / n`. (README 8.1) -/
theorem cut_bounds [Nonempty V] (S : Finset V) :
    algebraicConnectivity G * #S * (Fintype.card V - #S) / Fintype.card V ≤
      (#(G.interedges S Sᶜ) : ℝ) ∧
    (#(G.interedges S Sᶜ) : ℝ) ≤
      largestLapEigenvalue G * #S * (Fintype.card V - #S) / Fintype.card V := by
  sorry

end Layer8

/-! ## Layer 9: the largest Laplacian eigenvalue -/

section Layer9

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The largest edge-degree sum `max_{xy ∈ E} (d(x) + d(y))`, and `0` for an edgeless graph.
(README 9.2) -/
def maxEdgeDegreeSum : ℕ :=
  G.edgeFinset.sup (Sym2.lift ⟨fun x y ↦ G.degree x + G.degree y, fun _ _ ↦ Nat.add_comm _ _⟩)

/-- A graph is **bipartite semiregular** when it has a proper `2`-colouring whose colour classes
each have constant degree. (README 9.2) -/
def IsBipartiteSemiregular : Prop :=
  ∃ c : G.Coloring Bool, ∀ x y, c x = c y → G.degree x = G.degree y

/-- **Comparison with the signless Laplacian**: `ν₁ ≤ q₁`, with equality for a connected graph
exactly when it is bipartite. (README 9.1) -/
theorem largestLapEigenvalue_le_signlessLapEigenvalues [Nonempty V] :
    largestLapEigenvalue G ≤ signlessLapEigenvalues G ⟨0, Fintype.card_pos⟩ ∧
    (G.Connected → (largestLapEigenvalue G = signlessLapEigenvalues G ⟨0, Fintype.card_pos⟩ ↔
      G.IsBipartite)) := by
  sorry

/-- **Equality cases for the largest eigenvalue**: for a connected graph on at least two vertices,
`ν₁ = Δ + 1` iff `Δ = n - 1`; `ν₁ = max (d(x) + d(y))` iff bipartite semiregular; `ν₁ = 2 Δ`
iff bipartite and regular. (README 9.2) -/
theorem largestLapEigenvalue_eq_iff [Nonempty V] (hG : G.Connected) (h : 2 ≤ Fintype.card V) :
    (largestLapEigenvalue G = G.maxDegree + 1 ↔ G.maxDegree = Fintype.card V - 1) ∧
    (largestLapEigenvalue G = G.maxEdgeDegreeSum ↔ G.IsBipartiteSemiregular) ∧
    (largestLapEigenvalue G = 2 * G.maxDegree ↔
      G.IsBipartite ∧ G.IsRegularOfDegree G.maxDegree) := by
  sorry

end Layer9

/-! ## Layer 10: threshold graphs -/

section Layer10

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The **conjugate degree** `d*ᵢ = #{x | d(x) ≥ i}`. (README 10.1) -/
def conjDegree (i : ℕ) : ℕ := #{x | i ≤ G.degree x}

/-- A **threshold graph**: adjacency of distinct vertices is a threshold condition
`w x + w y > t` on real vertex weights. (README 10.1) -/
def IsThreshold : Prop :=
  ∃ (w : V → ℝ) (t : ℝ), ∀ x y, x ≠ y → (G.Adj x y ↔ t < w x + w y)

/-- **The conjugate degrees sum to `2m`.** (README 10.1) -/
theorem sum_conjDegree :
    ∑ i ∈ range (Fintype.card V), G.conjDegree (i + 1) = 2 * #G.edgeFinset := by
  sorry

/-- **Threshold graphs, recursively**: a graph is threshold exactly when every nonempty vertex
set contains a vertex isolated or dominating in it. (README 10.1) -/
theorem isThreshold_iff :
    G.IsThreshold ↔ ∀ S : Finset V, S.Nonempty → ∃ x ∈ S,
      (∀ y ∈ S, y ≠ x → ¬ G.Adj x y) ∨ (∀ y ∈ S, y ≠ x → G.Adj x y) := by
  sorry

/-- **The Laplacian spectrum of a threshold graph**: `νⱼ = d*ⱼ` for every `j`. (README 10.2) -/
theorem IsThreshold.lapEigenvalues_eq (hG : G.IsThreshold) (j : Fin (Fintype.card V)) :
    lapEigenvalues G j = G.conjDegree (j.val + 1) := by
  sorry

end Layer10

/-! ## Layer 11: generalized Laplacians, nodal domains and the Colin de Verdière invariant -/

section Layer11

/-- A **generalized Laplacian** of `G`: a real symmetric matrix with negative entries on edges and
zero entries at distinct nonadjacent pairs; the diagonal is arbitrary. (README 11.1) -/
structure IsGeneralizedLaplacian (G : _root_.SimpleGraph V) (M : Matrix V V ℝ) : Prop where
  isHermitian : M.IsHermitian
  neg_of_adj : ∀ x y, G.Adj x y → M x y < 0
  eq_zero_of_not_adj : ∀ x y, x ≠ y → ¬ G.Adj x y → M x y = 0

/-- Sanity check of the definition: the Laplacian is a generalized Laplacian. (README 11.1) -/
theorem isGeneralizedLaplacian_lapMatrix (G : _root_.SimpleGraph V) [DecidableRel G.Adj] :
    G.IsGeneralizedLaplacian (G.lapMatrix ℝ) := by
  sorry

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The number of **strong nodal domains** of `f`: the components of the subgraphs induced where
`f > 0` and where `f < 0`. (README 11.1) -/
def strongNodalDomainCount (f : V → ℝ) : ℕ :=
  Nat.card (G.induce {x | 0 < f x}).ConnectedComponent +
    Nat.card (G.induce {x | f x < 0}).ConnectedComponent

/-- The number of **weak nodal domains** of `f`: the components of the subgraph induced where
`f ≥ 0` that contain a vertex with `f > 0`, and those induced where `f ≤ 0` that contain a vertex
with `f < 0`. (README 11.1) -/
def weakNodalDomainCount (f : V → ℝ) : ℕ :=
  Nat.card {c : (G.induce {x | 0 ≤ f x}).ConnectedComponent //
      ∃ x : {x | 0 ≤ f x}, (G.induce {x | 0 ≤ f x}).connectedComponentMk x = c ∧ 0 < f x} +
    Nat.card {c : (G.induce {x | f x ≤ 0}).ConnectedComponent //
      ∃ x : {x | f x ≤ 0}, (G.induce {x | f x ≤ 0}).connectedComponentMk x = c ∧ f x < 0}

/-- **The discrete nodal domain theorem for generalized Laplacians**: a vector `f` with
`M f = θ f` has at most `#{λ ≤ θ}` strong nodal domains and at most `#{λ < θ} + c` weak nodal
domains, `c` the number of components of `G`. (README 11.1) -/
theorem IsGeneralizedLaplacian.nodalDomainCount_le {M : Matrix V V ℝ}
    (hM : G.IsGeneralizedLaplacian M) {θ : ℝ} {f : V → ℝ} (hMf : M *ᵥ f = θ • f) :
    G.strongNodalDomainCount f ≤ #{i | hM.isHermitian.eigenvalues i ≤ θ} ∧
      G.weakNodalDomainCount f ≤
        #{i | hM.isHermitian.eigenvalues i < θ} + Nat.card G.ConnectedComponent := by
  sorry

/-- The **strong Arnold hypothesis** for `M` relative to `G`: the only symmetric `X` with zero
diagonal, zero entries on the edges of `G`, and `M X = 0` is `X = 0`. (README 11.2) -/
def HasStrongArnold (M : Matrix V V ℝ) : Prop :=
  ∀ X : Matrix V V ℝ, X.IsSymm → (∀ x, X x x = 0) → (∀ x y, G.Adj x y → X x y = 0) →
    M * X = 0 → X = 0

/-- The **Colin de Verdière matrices** of `G`: generalized Laplacians with exactly one negative
eigenvalue, of multiplicity one, satisfying the strong Arnold hypothesis. (README 11.2) -/
def colinDeVerdiereMatrices : Set (Matrix V V ℝ) :=
  {M | ∃ hM : G.IsGeneralizedLaplacian M,
    #{i | hM.isHermitian.eigenvalues i < 0} = 1 ∧ G.HasStrongArnold M}

/-- The **Colin de Verdière invariant** `μ(G)`: the largest corank of a Colin de Verdière matrix;
it is `0` on the empty vertex type, where there is none. (README 11.2) -/
def colinDeVerdiere : ℕ :=
  sSup ((fun M : Matrix V V ℝ ↦ Fintype.card V - M.rank) '' G.colinDeVerdiereMatrices)

/-- **Values on complete and edgeless graphs**: `μ(Kₙ) = n - 1`, and `μ = 1` for an edgeless graph
on at least two vertices. (README 11.2) -/
theorem colinDeVerdiere_top_bot :
    (⊤ : _root_.SimpleGraph V).colinDeVerdiere = Fintype.card V - 1 ∧
    (2 ≤ Fintype.card V → (⊥ : _root_.SimpleGraph V).colinDeVerdiere = 1) := by
  sorry

/-- **Disjoint unions**: if one summand has an edge, `μ(G + H) = max (μ G) (μ H)`.
(README 11.2) -/
theorem colinDeVerdiere_sum {W : Type*} [Fintype W] [DecidableEq W]
    (H : _root_.SimpleGraph W) [DecidableRel H.Adj]
    (hE : G.edgeSet.Nonempty ∨ H.edgeSet.Nonempty) :
    (G ⊕g H).colinDeVerdiere = max G.colinDeVerdiere H.colinDeVerdiere := by
  sorry

/-! ### 11.3 Minors -/

/-- A **minor model** of `H` in `G`: disjoint connected (so nonempty) branch sets, one for each
vertex of `H`, with an edge of `G` between the branch sets of adjacent vertices of `H`.
(README 11.3) -/
structure MinorModel {W : Type*} (G : _root_.SimpleGraph V) (H : _root_.SimpleGraph W) where
  /-- The branch set of a vertex of `H`. -/
  branch : W → Set V
  pairwise_disjoint : Pairwise (Function.onFun Disjoint branch)
  connected : ∀ w, (G.induce (branch w)).Connected
  exists_adj : ∀ w w', H.Adj w w' → ∃ x ∈ branch w, ∃ y ∈ branch w', G.Adj x y

/-- `G.IsMinor H` says that `H` is a minor of `G`: it has a minor model in `G`. (README 11.3) -/
def IsMinor {W : Type*} (G : _root_.SimpleGraph V) (H : _root_.SimpleGraph W) : Prop :=
  Nonempty (MinorModel G H)

/-- **Subgraphs are minors**: an injective homomorphism `H →g G` makes `H` a minor of `G`; in
particular subgraphs of `G` and graphs isomorphic to `G` are minors of `G`. (README 11.3) -/
theorem IsMinor.of_injective {W : Type*} {H : _root_.SimpleGraph W} (f : H →g G)
    (hf : Function.Injective f) : G.IsMinor H := by
  sorry

/-- **Transitivity**: a minor of a minor of `G` is a minor of `G`. (README 11.3) -/
theorem IsMinor.trans {W U : Type*} {H : _root_.SimpleGraph W} {K : _root_.SimpleGraph U}
    (h₁ : G.IsMinor H) (h₂ : H.IsMinor K) : G.IsMinor K := by
  sorry

/-- **Minor monotonicity** of the Colin de Verdière invariant. (README 11.3) -/
theorem IsMinor.colinDeVerdiere_le {W : Type*} [Fintype W] [DecidableEq W]
    {H : _root_.SimpleGraph W} [DecidableRel H.Adj] (h : G.IsMinor H) :
    H.colinDeVerdiere ≤ G.colinDeVerdiere := by
  sorry

/-- **Linear forests**: `μ(G) ≤ 1` exactly when `G` is a disjoint union of paths, that is, a
forest of maximum degree at most `2`. (README 11.3) -/
theorem colinDeVerdiere_le_one_iff :
    G.colinDeVerdiere ≤ 1 ↔ G.IsAcyclic ∧ ∀ v, G.degree v ≤ 2 := by
  sorry

end Layer11

end SimpleGraph

/-! ## Layer 12: equilateral metric graphs -/

namespace MetricGraph

open Set

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
  (O : TauCeti.DoubledQuiver.Orientation G) (ℓ : O.carrier → ℝ)

open Classical in
/-- A **standard eigenfunction** with eigenvalue `lam` on the metric graph of `G`, whose oriented
edge `e` (from `e.fst` to `e.snd`) is the interval `[0, ℓ e]`: on each edge a `C²` solution of
`-u'' = lam u`, set to `0` off the interval, continuous at the vertices, with vanishing sum of
outgoing derivatives at each vertex (`u'(0)` at the tail, `-u'(ℓ e)` at the head).
(README 12.1) -/
structure IsStandardEigenfunction (lam : ℝ) (u : O.carrier → ℝ → ℝ) : Prop where
  contDiffOn : ∀ e, ContDiffOn ℝ 2 (u e) (Icc 0 (ℓ e))
  eigen : ∀ e, ∀ t ∈ Icc 0 (ℓ e),
    -derivWithin (derivWithin (u e) (Icc 0 (ℓ e))) (Icc 0 (ℓ e)) t = lam * u e t
  eq_zero : ∀ e, ∀ t ∉ Icc 0 (ℓ e), u e t = 0
  continuous_vertex : ∃ c : V → ℝ, ∀ e, u e 0 = c e.1.fst ∧ u e (ℓ e) = c e.1.snd
  kirchhoff : ∀ v,
    ∑ e : O.carrier with e.1.fst = v, derivWithin (u e) (Icc 0 (ℓ e)) 0 -
      ∑ e : O.carrier with e.1.snd = v, derivWithin (u e) (Icc 0 (ℓ e)) (ℓ e) = 0

/-- The **eigenspace** of the standard Laplacian for `lam`: the span of the standard
eigenfunctions, which already form a subspace (12.1). (README 12.1) -/
def standardEigenspace (lam : ℝ) : Submodule ℝ (O.carrier → ℝ → ℝ) :=
  Submodule.span ℝ {u | IsStandardEigenfunction G O ℓ lam u}

/-- The **multiplicity** of `lam` as an eigenvalue of the standard Laplacian. (README 12.1) -/
def standardMultiplicity (lam : ℝ) : ℕ := Module.finrank ℝ (standardEigenspace G O ℓ lam)

/-- The **eigenvalue counting function** `N(Λ)`: the dimension of the span of the eigenspaces for
eigenvalues at most `Λ`. (README 12.4) -/
def standardCount (Λ : ℝ) : ℕ :=
  Module.finrank ℝ
    ↥(⨆ (lam : ℝ) (_ : lam ≤ Λ), standardEigenspace G O ℓ lam : Submodule ℝ (O.carrier → ℝ → ℝ))

/-- **Basic spectral facts**: for positive lengths the eigenfunctions form a subspace, the
eigenspaces are finite-dimensional of dimension at most `2 |E|`, there are no negative
eigenvalues, and for a graph without isolated vertices the multiplicity of `0` is the number of
connected components. (README 12.1) -/
theorem standardEigenspace_basic (hℓ : ∀ e, 0 < ℓ e) (lam : ℝ) :
    {u | IsStandardEigenfunction G O ℓ lam u} = (standardEigenspace G O ℓ lam : Set _) ∧
    FiniteDimensional ℝ (standardEigenspace G O ℓ lam) ∧
    standardMultiplicity G O ℓ lam ≤ 2 * #G.edgeFinset ∧
    (lam < 0 → standardMultiplicity G O ℓ lam = 0) ∧
    ((∀ v, 0 < G.degree v) → standardMultiplicity G O ℓ 0 = Fintype.card G.ConnectedComponent) := by
  sorry

/-- **Discrete and metric spectra**: on the equilateral metric graph of a graph without isolated
vertices, a number `lam ≥ 0` that is not of the form `(π j)²` is an eigenvalue of the standard
Laplacian with the multiplicity that `1 - cos √lam` has for the normalized Laplacian.
(README 12.2) -/
theorem standardMultiplicity_eq_finrank_eigenspace (hdeg : ∀ v, 0 < G.degree v) {lam : ℝ}
    (hlam : 0 ≤ lam) (hexc : ∀ j : ℤ, lam ≠ (Real.pi * j) ^ 2) :
    standardMultiplicity G O (fun _ ↦ 1) lam =
      Module.finrank ℝ (Module.End.eigenspace (toLin' (normalizedLaplacian (G.adjMatrix ℝ)))
        (1 - Real.cos (Real.sqrt lam))) := by
  sorry

open Classical in
/-- **The exceptional eigenvalues**: on the equilateral metric graph of a connected graph with at
least two vertices and cycle rank `β₁ = |E| - |V| + 1`, the eigenvalue `(2πm)²`, `m ≥ 1`, has
multiplicity `β₁ + 1`, and `((2m+1)π)²` has multiplicity `β₁ + 1` or `β₁ - 1` as `G` is or is not
bipartite. (README 12.3) -/
theorem standardMultiplicity_exceptional (hG : G.Connected) (h : 2 ≤ Fintype.card V) (m : ℕ) :
    ((standardMultiplicity G O (fun _ ↦ 1) ((2 * Real.pi * (m + 1)) ^ 2) : ℤ) =
      #G.edgeFinset - Fintype.card V + 2) ∧
    ((standardMultiplicity G O (fun _ ↦ 1) ((Real.pi * (2 * m + 1)) ^ 2) : ℤ) =
      if G.IsBipartite then (#G.edgeFinset : ℤ) - Fintype.card V + 2
      else (#G.edgeFinset : ℤ) - Fintype.card V) := by
  sorry

/-- **Weyl's law on equilateral graphs**: for a graph without isolated vertices and total length
`|E|`, `N(Λ) = |E| √Λ / π + O(1)`. (README 12.4) -/
theorem exists_abs_standardCount_sub_le (hdeg : ∀ v, 0 < G.degree v) :
    ∃ C : ℝ, ∀ Λ : ℝ, 0 ≤ Λ →
      |(standardCount G O (fun _ ↦ 1) Λ : ℝ) - #G.edgeFinset * Real.sqrt Λ / Real.pi| ≤ C := by
  sorry

end MetricGraph

end TauCetiRoadmap.LaplacianSpectraAndSpanningTrees

/-! ## Library declarations consumed -/

-- Mathlib
#check @SimpleGraph.lapMatrix
#check @SimpleGraph.posSemidef_lapMatrix
#check @SimpleGraph.lapMatrix_toLinearMap₂'
#check @SimpleGraph.lapMatrix_mulVec_one_eq_zero
#check @SimpleGraph.lapMatrix_mulVec_apply'
#check @SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix
#check @SimpleGraph.interedges
#check @SimpleGraph.IsEdgeConnected
#check @SimpleGraph.induce
#check @SimpleGraph.Hom
#check @SimpleGraph.Connected
#check @SimpleGraph.ConnectedComponent
#check @SimpleGraph.IsTree
#check @SimpleGraph.IsAcyclic
#check @SimpleGraph.IsTree.card_edgeFinset
#check @SimpleGraph.Connected.exists_isTree_le
#check @SimpleGraph.IsTree.existsUnique_path
#check @SimpleGraph.dist
#check @SimpleGraph.IsBipartite
#check @SimpleGraph.Coloring
#check @SimpleGraph.lineGraph
#check @SimpleGraph.minDegree
#check @SimpleGraph.maxDegree
#check @SimpleGraph.IsRegularOfDegree
#check @SimpleGraph.exists_minimal_degree_vertex
#check @SimpleGraph.sum
#check @Matrix.adjugate
#check @Matrix.inv_def
#check @Matrix.nonsing_inv_apply_not_isUnit
#check @Matrix.det_fromBlocks₁₁
#check @Matrix.charpoly_coeff_eq_sum_minors
#check @Matrix.IsHermitian.charpoly_eq
#check @Matrix.IsHermitian.det_eq_prod_eigenvalues
#check @LinearMap.BilinForm.dualSubmodule
#check @Module.Basis.SmithNormalForm
#check @Matrix.PosSemidef
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.IsHermitian.eigenvalues
#check @ContinuousLinearMap.orthogonal_range
#check @derivWithin
#check @ContDiffOn
#check @Module.End.eigenspace
#check @Module.finrank
#check @Matrix.toLin'
-- Tau Ceti
#check @Matrix.det_mul_transpose_eq_sum_plucker_sq
#check @Matrix.card_quotient_range_mulVecLin_eq_card_quotient_span_det
#check @LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner
#check @LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues
#check @Matrix.IsIrreducible.exists_pos_eq_smul_of_mulVec_eq_smul
#check @SimpleGraph.vertexConnectivity
#check @SimpleGraph.edgeConnectivity
#check @SimpleGraph.isVertexConnected_iff
#check @SimpleGraph.isVertexConnected_iff_le_vertexConnectivity
#check @SimpleGraph.vertexConnectivity_ne_top
#check @SimpleGraph.vertexConnectivity_top
#check @SimpleGraph.edgeConnectivity_eq_top_iff
#check @SimpleGraph.vertexConnectivity_le_edgeConnectivity
#check @SimpleGraph.isEdgeConnected_iff_le_edgeConnectivity
#check @SimpleGraph.edgeConnectivity_le_minDegree
#check @TauCeti.DoubledQuiver.Orientation
#check @TauCeti.SerreGraph.incidenceBoundary
#check @TauCeti.SerreGraph.cycleLattice
#check @SimpleGraph.toSerreGraph
