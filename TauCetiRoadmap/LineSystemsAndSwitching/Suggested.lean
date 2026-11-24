module

public import Mathlib
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.SimpleGraph
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Diagram
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Star.Classification
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Classification
public import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Deletion
public import TauCeti.LinearAlgebra.RootSystem.NumberOfRoots
public import TauCeti.RepresentationTheory.Quiver.FiniteRepType.AffineSubgraph
public import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.Roots
public import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.Dynkin
public import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeA.ZeroSum
public import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeD.Basic
public import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.D8Plus.Isometry

/-!
# Line systems and switching: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (the basic API
of each section, the route lemmas and the spectral recognition lemmas of 5.1) are stated there in
prose with their locators or proof routes, and are not stated here.

Conventions (README, Conventions): `adjEigenvalues G i` is `θ_{i+1}` in nonincreasing order, so
index `0` carries the largest eigenvalue, and `largestEigenvalue G = θ₁` on a nonempty vertex
type. Spectra are multisets. The coordinate root systems `rootsA n`, `rootsD n` and `rootsE8` are
sets of rational coordinate vectors with the dot product. Dynkin and affine Dynkin types are Tau
Ceti's `TauCeti.DynkinType` and `TauCeti.AffineDynkinType`, and `2I - A` is Tau Ceti's
`SimpleGraph.graphCartanMatrix`.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues and the index of
SpectralGraphBounds 1.1, the sorted Laplacian eigenvalues of LaplacianEigenvaluesOfGraphs 1.1 and
the Kneser graph of TopologicalCombinatorics 3.1 (as GraphSpectra copies them), the signless
Laplacian, the three spectra, the Petersen graph and the `DecidableRel` instances of GraphSpectra
1.2 and 2.4, and the Seidel matrix, Seidel switching, odd triples, regular two-graphs,
equiangular families and sign graphs of EquiangularLinesAndTwoGraphs 1.1, 1.2, 2.1, 2.3 and 3.1.
-/

@[expose] public section

noncomputable section

open SimpleGraph Matrix Finset TauCeti

namespace TauCetiRoadmap.LineSystemsAndSwitching

open TauCetiRoadmap.LineSystemsAndSwitching

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

end SpectralGraphBounds

/-! ## Local copy: LaplacianEigenvaluesOfGraphs, 1.1 -/

namespace LaplacianEigenvaluesOfGraphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one and index `n - 1` the smallest. -/
def lapEigenvalues (G : _root_.SimpleGraph V) [DecidableRel G.Adj] :
    Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_lapMatrix ℝ).eigenvalues₀

end LaplacianEigenvaluesOfGraphs

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

open SpectralGraphBounds LaplacianEigenvaluesOfGraphs TopologicalCombinatorics

/-! ## Local copy: GraphSpectra, 1.2 and 2.4 -/

namespace GraphSpectra

namespace SimpleGraph

section Definitions

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

/-- The adjacency spectrum, as a multiset of real numbers. -/
def adjSpectrum : Multiset ℝ := Multiset.map (adjEigenvalues G) Finset.univ.val

/-- The Laplacian spectrum, as a multiset of real numbers. -/
def lapSpectrum : Multiset ℝ := Multiset.map (lapEigenvalues G) Finset.univ.val

/-- The signless Laplacian spectrum, as a multiset of real numbers. -/
def signlessLapSpectrum : Multiset ℝ := Multiset.map (signlessLapEigenvalues G) Finset.univ.val

end Definitions

/-- The Petersen graph `K(5, 2)`. -/
abbrev petersenGraph : _root_.SimpleGraph {s : Finset (Fin 5) | s.card = 2} :=
  kneserGraph (Fin 5) 2

instance {α : Type*} [DecidableEq α] {k : ℕ} : DecidableRel (kneserGraph α k).Adj :=
  fun s t ↦ inferInstanceAs (Decidable (s ≠ t ∧ Disjoint (s : Finset α) t))

instance {V W : Type*} : DecidableRel (completeBipartiteGraph V W).Adj := fun v w ↦
  inferInstanceAs (Decidable (v.isLeft ∧ w.isRight ∨ v.isRight ∧ w.isLeft))

instance {V W : Type*} [DecidableEq V] [DecidableEq W] (G : _root_.SimpleGraph V)
    [DecidableRel G.Adj] (H : _root_.SimpleGraph W) [DecidableRel H.Adj] :
    DecidableRel (G □ H).Adj := fun x y ↦
  inferInstanceAs (Decidable (G.Adj x.1 y.1 ∧ x.2 = y.2 ∨ H.Adj x.2 y.2 ∧ x.1 = y.1))

instance {V W : Type*} (G : _root_.SimpleGraph V) [DecidableRel G.Adj]
    (H : _root_.SimpleGraph W) [DecidableRel H.Adj] : DecidableRel (G ⊕g H).Adj
  | Sum.inl x, Sum.inl y => inferInstanceAs (Decidable (G.Adj x y))
  | Sum.inr x, Sum.inr y => inferInstanceAs (Decidable (H.Adj x y))
  | Sum.inl _, Sum.inr _ => isFalse (by simp)
  | Sum.inr _, Sum.inl _ => isFalse (by simp)

end SimpleGraph

end GraphSpectra

open GraphSpectra GraphSpectra.SimpleGraph

/-! ## Local copy: EquiangularLinesAndTwoGraphs, 1.1, 1.2, 2.1, 2.3 and 3.1 -/

namespace EquiangularLinesAndTwoGraphs

open scoped InnerProductSpace

section Seidel

variable {V : Type*}

/-- 1.1 The Seidel matrix `J − I − 2A` of a graph: `0` on the diagonal, `-1` for adjacent and
`1` for distinct nonadjacent vertices. -/
def seidelMatrix (R : Type*) [DecidableEq V] [Ring R] (G : _root_.SimpleGraph V)
    [DecidableRel G.Adj] : Matrix V V R :=
  Matrix.of fun u v => if u = v then 0 else if G.Adj u v then -1 else 1

/-- 1.2 Seidel switching of `G` with respect to `U`: adjacency is kept inside `U` and inside its
complement and is interchanged between `U` and its complement. -/
def switch (G : _root_.SimpleGraph V) (U : Set V) : _root_.SimpleGraph V where
  Adj u v := u ≠ v ∧ (G.Adj u v ↔ (u ∈ U ↔ v ∈ U))
  symm.symm u v h := ⟨h.1.symm, by rw [G.adj_comm, h.2]; exact Iff.comm⟩
  loopless.irrefl u h := h.1 rfl

/-- 1.2 Decidability of adjacency in a switched graph. -/
instance instDecidableRelSwitch [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]
    (U : Set V) [DecidablePred (· ∈ U)] : DecidableRel (switch G U).Adj :=
  fun u v => inferInstanceAs (Decidable (u ≠ v ∧ (G.Adj u v ↔ (u ∈ U ↔ v ∈ U))))

end Seidel

section TwoGraphs

variable {V : Type*} [DecidableEq V]

/-- 2.1 The triples of distinct vertices of `G` that span an odd number of edges. -/
def oddTriples (G : _root_.SimpleGraph V) : Set (Finset V) :=
  {t | ∃ x y z, x ≠ y ∧ x ≠ z ∧ y ≠ z ∧ t = {x, y, z} ∧
    Xor (G.Adj x y) (Xor (G.Adj x z) (G.Adj y z))}

/-- 2.3 The regularity condition of degree `a`: every pair of distinct points lies in exactly `a`
members of `Δ`. -/
def IsRegularTwoGraph (Δ : Set (Finset V)) (a : ℕ) : Prop :=
  ∀ x y : V, x ≠ y → {t ∈ Δ | x ∈ t ∧ y ∈ t}.ncard = a

end TwoGraphs

section Equiangular

variable {E : Type*} [NormedAddCommGroup E] {ι : Type*}

/-- 3.1 The family `x` of vectors is equiangular with angle `α` over `𝕜`: unit vectors whose
inner products between distinct members all have absolute value `α`. -/
def IsEquiangular (𝕜 : Type*) [RCLike 𝕜] [InnerProductSpace 𝕜 E] (x : ι → E) (α : ℝ) : Prop :=
  (∀ i, ‖x i‖ = 1) ∧ ∀ i j, i ≠ j → ‖⟪x i, x j⟫_𝕜‖ = α

/-- 3.1 The sign graph of a family of vectors of a real inner product space: `i` and `j` are
adjacent when `i ≠ j` and `⟪x i, x j⟫ < 0`. -/
def signGraph [InnerProductSpace ℝ E] (x : ι → E) : _root_.SimpleGraph ι where
  Adj i j := i ≠ j ∧ ⟪x i, x j⟫_ℝ < 0
  symm.symm i j h := ⟨h.1.symm, by rw [real_inner_comm]; exact h.2⟩
  loopless.irrefl i h := h.1 rfl

/-- 3.1 Adjacency in the sign graph is decided classically. -/
instance instDecidableRelSignGraph [InnerProductSpace ℝ E] (x : ι → E) :
    DecidableRel (signGraph x).Adj :=
  Classical.decRel _

end Equiangular

end EquiangularLinesAndTwoGraphs

open EquiangularLinesAndTwoGraphs

/-! ## Layer 1: cospectral graphs and Godsil–McKay switching -/

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 1.1 Small cospectral pairs -/

/-- **The smallest cospectral pair.** The star `K_{1,4}` and `K₁ ⊔ C₄` have the same adjacency
spectrum `2, 0, 0, 0, -2` and are not isomorphic. (README 1.1) -/
theorem adjSpectrum_star_eq_adjSpectrum_sum_cycle :
    (completeBipartiteGraph (Fin 1) (Fin 4)).adjSpectrum =
        ((⊥ : _root_.SimpleGraph (Fin 1)) ⊕g cycleGraph 4).adjSpectrum ∧
      (completeBipartiteGraph (Fin 1) (Fin 4)).adjSpectrum = {2, 0, 0, 0, -2} ∧
      IsEmpty (completeBipartiteGraph (Fin 1) (Fin 4) ≃g
        ((⊥ : _root_.SimpleGraph (Fin 1)) ⊕g cycleGraph 4)) := by
  sorry

/-- The first connected graph of the six-vertex cospectral pair: a vertex joined to all others,
with the two further edges `12` and `34`. -/
def cospectralSixFst : _root_.SimpleGraph (Fin 6) :=
  fromRel fun i j ↦ (i, j) ∈ [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (3, 4)]

/-- The second connected graph of the six-vertex cospectral pair: `K₄` minus the edge `23`, with
the pendant edges `24` and `35`. -/
def cospectralSixSnd : _root_.SimpleGraph (Fin 6) :=
  fromRel fun i j ↦ (i, j) ∈ [(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 4), (3, 5)]

/-- **A connected cospectral pair on six vertices.** Both graphs are connected, both have
characteristic polynomial `t⁶ - 7t⁴ - 4t³ + 7t² + 4t - 1`, and they are not isomorphic.
(README 1.1) -/
theorem cospectralSix :
    open scoped Classical in
    cospectralSixFst.Connected ∧ cospectralSixSnd.Connected ∧
      (cospectralSixFst.adjMatrix ℤ).charpoly =
        (Polynomial.X ^ 6 - 7 * Polynomial.X ^ 4 - 4 * Polynomial.X ^ 3 + 7 * Polynomial.X ^ 2 +
          4 * Polynomial.X - 1 : Polynomial ℤ) ∧
      (cospectralSixSnd.adjMatrix ℤ).charpoly = (cospectralSixFst.adjMatrix ℤ).charpoly ∧
      IsEmpty (cospectralSixFst ≃g cospectralSixSnd) := by
  sorry

/-! ### 1.2 Seidel-cospectral regular graphs -/

/-- **Regular graphs of equal degree with the same Seidel spectrum are cospectral.** Equality of
the characteristic polynomials of the real Seidel matrices gives equality of the adjacency
spectra. (README 1.2) -/
theorem adjSpectrum_eq_of_charpoly_seidelMatrix_eq {W : Type*} [Fintype W] [DecidableEq W]
    {H : _root_.SimpleGraph W} [DecidableRel H.Adj] {k : ℕ} (hG : G.IsRegularOfDegree k)
    (hH : H.IsRegularOfDegree k)
    (h : (seidelMatrix ℝ G).charpoly = (seidelMatrix ℝ H).charpoly) :
    G.adjSpectrum = H.adjSpectrum := by
  sorry

/-! ### 1.3 Godsil–McKay switching -/

/-- The data of a **Godsil–McKay switching**: cells `X_i = cell⁻¹ (some i)`, all nonempty, and
`Y = cell⁻¹ none`; the partition into the `X_i` is equitable in the subgraph they induce, and
every vertex of `Y` has `0`, `|X_i| / 2` or `|X_i|` neighbours in each `X_i`. -/
structure GodsilMcKayPartition (ι : Type*) [Fintype ι] [DecidableEq ι] where
  /-- The cell of a vertex: `some i` for `X_i`, `none` for `Y`. -/
  cell : V → Option ι
  /-- Every cell `X_i` is nonempty. -/
  nonempty : ∀ i, ∃ x, cell x = some i
  /-- The partition into the `X_i` is equitable in the induced subgraph on their union. -/
  equitable : ∀ x x' i j, cell x = some i → cell x' = some i →
    #{z ∈ G.neighborFinset x | cell z = some j} = #{z ∈ G.neighborFinset x' | cell z = some j}
  /-- Each vertex of `Y` sees none, exactly half, or all of each `X_i`. -/
  outside : ∀ y i, cell y = none →
    #{z ∈ G.neighborFinset y | cell z = some i} = 0 ∨
      2 * #{z ∈ G.neighborFinset y | cell z = some i} = #{z | cell z = some i} ∨
      #{z ∈ G.neighborFinset y | cell z = some i} = #{z | cell z = some i}

namespace GodsilMcKayPartition

variable {G} {ι : Type*} [Fintype ι] [DecidableEq ι] (P : G.GodsilMcKayPartition ι)

/-- The pairs whose adjacency the switching flips: `y ∈ Y` and `x ∈ X_i` where `y` has exactly
half of `X_i` as neighbours. -/
def Flips (y x : V) : Prop :=
  P.cell y = none ∧ ∃ i, P.cell x = some i ∧
    2 * #{z ∈ G.neighborFinset y | P.cell z = some i} = #{z | P.cell z = some i}

/-- **The Godsil–McKay switched graph.** -/
def switch : _root_.SimpleGraph V where
  Adj x y := x ≠ y ∧ (G.Adj x y ↔ ¬ (P.Flips x y ∨ P.Flips y x))
  symm := ⟨fun x y h ↦ ⟨h.1.symm, (G.adj_comm y x).trans (h.2.trans (by rw [or_comm]))⟩⟩
  loopless := ⟨fun _ h ↦ h.1 rfl⟩

open scoped Classical in
/-- The orthogonal block matrix of a Godsil–McKay switching: `(2 / |X_i|) J - I` on each `X_i`,
the identity on `Y`, and `0` elsewhere. -/
def conjMatrix : Matrix V V ℝ :=
  Matrix.of fun x y ↦
    match P.cell x, P.cell y with
    | none, none => if x = y then 1 else 0
    | some i, some j =>
        if i = j then 2 / (#{z | P.cell z = some i} : ℝ) - if x = y then 1 else 0 else 0
    | _, _ => 0

/-- **The conjugating matrix.** The Godsil–McKay matrix is symmetric, is an involution, fixes
`J` and conjugates the adjacency matrix of `G` to that of the switched graph. (README 1.3) -/
theorem conjMatrix_conj :
    open scoped Classical in
    P.conjMatrix.IsSymm ∧ P.conjMatrix * P.conjMatrix = 1 ∧
      P.conjMatrix * G.adjMatrix ℝ * P.conjMatrix = P.switch.adjMatrix ℝ ∧
      P.conjMatrix * Matrix.of (fun _ _ ↦ 1) = Matrix.of (fun _ _ ↦ 1) := by
  sorry

/-- **Godsil–McKay switching preserves the adjacency spectrum.** (README 1.3) -/
theorem adjSpectrum_switch :
    open scoped Classical in
    P.switch.adjSpectrum = G.adjSpectrum := by
  sorry

/-- **Godsil–McKay switching preserves the spectrum of the complement.** (README 1.3) -/
theorem adjSpectrum_compl_switch :
    open scoped Classical in
    P.switchᶜ.adjSpectrum = Gᶜ.adjSpectrum := by
  sorry

end GodsilMcKayPartition

/-! ## Layer 2: graphs with index at most two -/

/-! ### 2.1 The index and the form `2I - A` -/

/-- **`θ₁ < 2` is positive definiteness of `2I - A`**, for every graph on a nonempty vertex
type. (README 2.1) -/
theorem largestEigenvalue_lt_two_iff_posDef [Nonempty V] :
    largestEigenvalue G < 2 ↔ (G.graphCartanMatrix ℝ).PosDef := by
  sorry

/-- **`θ₁ ≤ 2` is positive semidefiniteness of `2I - A`**, for every graph on a nonempty vertex
type. (README 2.1) -/
theorem largestEigenvalue_le_two_iff_posSemidef [Nonempty V] :
    largestEigenvalue G ≤ 2 ↔ (G.graphCartanMatrix ℝ).PosSemidef := by
  sorry

/-! ### 2.2 Smith's theorem -/

/-- **Smith, part one.** The connected graphs with `θ₁ < 2` are the diagrams of the valid
simply-laced Dynkin types `A_n`, `D_n`, `E₆`, `E₇`, `E₈`. (README 2.2) -/
theorem Connected.largestEigenvalue_lt_two_iff [Nonempty V] (hG : G.Connected) :
    largestEigenvalue G < 2 ↔
      ∃ t : DynkinType, t.Valid ∧ t.IsSimplyLaced ∧
        Nonempty (G ≃g diagramGraph t.cartanMatrix) := by
  sorry

/-- **`θ₁ = 2` for a connected graph is a nonzero natural null vector of `2I - A`.**
(README 2.2) -/
theorem Connected.largestEigenvalue_eq_two_iff_exists_nat [Nonempty V] (hG : G.Connected) :
    largestEigenvalue G = 2 ↔
      ∃ a : V → ℕ, a ≠ 0 ∧ ∀ i, ∑ j ∈ G.neighborFinset i, a j = 2 * a i := by
  sorry

/-- **Smith, part two.** The connected graphs with `θ₁ = 2` are the graphs of the valid
graphical affine types: the cycles, the trees `D̃_n` and `T(2,2,2)`, `T(1,3,3)`, `T(1,2,5)`, each
for exactly one type. (README 2.2) -/
theorem Connected.largestEigenvalue_eq_two_iff [Nonempty V] (hG : G.Connected) :
    largestEigenvalue G = 2 ↔
      ∃! t : AffineDynkinType, t.Valid ∧ t.IsGraphical ∧ Nonempty (G ≃g t.graph) := by
  sorry

/-! ### 2.3 Subgraphs and supergraphs of Smith graphs -/

/-- **Every connected graph with `θ₁ ≤ 2` is an induced subgraph of a Smith graph.**
(README 2.3) -/
theorem Connected.exists_embedding_of_largestEigenvalue_le_two [Nonempty V] (hG : G.Connected)
    (h : largestEigenvalue G ≤ 2) :
    ∃ t : AffineDynkinType, t.Valid ∧ t.IsGraphical ∧ Nonempty (G ↪g t.graph) := by
  sorry

/-- **Every connected graph with `θ₁ > 2` contains a Smith graph with fewer vertices or fewer
edges.** (README 2.3) -/
theorem Connected.exists_isContained_of_two_lt_largestEigenvalue [Nonempty V]
    (hG : G.Connected) (h : 2 < largestEigenvalue G) :
    ∃ t : AffineDynkinType, t.Valid ∧ t.IsGraphical ∧ t.graph ⊑ G ∧
      (t.nodes < Fintype.card V ∨ #t.graph.edgeFinset < #G.edgeFinset) := by
  sorry

end SimpleGraph

/-! ### 2.4 The Coxeter number and the index of a Dynkin diagram -/

/-- The Coxeter number `h` of a Dynkin type: `n + 1` for `A_n`, `2n - 2` for `D_n`, `12`, `18`,
`30` for `E₆`, `E₇`, `E₈`, and `2n`, `2n`, `12`, `6` for `B_n`, `C_n`, `F₄`, `G₂`. -/
def coxeterNumber : DynkinType → ℕ
  | .A n => n + 1
  | .B n => 2 * n
  | .C n => 2 * n
  | .D n => 2 * n - 2
  | .E6 => 12
  | .E7 => 18
  | .E8 => 30
  | .F4 => 12
  | .G2 => 6

namespace SimpleGraph

/-- **The index of a Dynkin diagram is `2 cos (π / h)`.** (README 2.4) -/
theorem largestEigenvalue_diagramGraph {t : DynkinType} (ht : t.Valid) (hs : t.IsSimplyLaced) :
    haveI : Nonempty (Fin t.rank) := ⟨⟨0, DynkinType.rank_pos ht⟩⟩
    largestEigenvalue (diagramGraph t.cartanMatrix) =
      2 * Real.cos (Real.pi / coxeterNumber t) := by
  sorry

end SimpleGraph

/-! ## Layer 3: Gram representations, root systems and root lattices -/

/-! ### 3.1 The coordinate root systems -/

/-- The coordinate root system `A_n = {e_i - e_j : i ≠ j}` in `ℚ^{n+1}`. -/
def rootsA (n : ℕ) : Set (Fin (n + 1) → ℚ) :=
  {v | ∃ i j, i ≠ j ∧ v = Pi.single i 1 - Pi.single j 1}

/-- The coordinate root system `D_n = {±e_i ± e_j : i ≠ j}` in `ℚ^n`. -/
def rootsD (n : ℕ) : Set (Fin n → ℚ) :=
  {v | ∃ i j, i ≠ j ∧ ∃ s t : ℚ, (s = 1 ∨ s = -1) ∧ (t = 1 ∨ t = -1) ∧
    v = Pi.single i s + Pi.single j t}

/-- The coordinate root system `E₈`: `D₈` together with the vectors `½(±1, …, ±1)` with an even
number of minus signs. -/
def rootsE8 : Set (Fin 8 → ℚ) :=
  rootsD 8 ∪ {v | (∀ i, v i = 1 / 2 ∨ v i = -(1 / 2)) ∧ Even #{i | v i = -(1 / 2)}}

/-- **The number of roots.** `|A_n| = n(n + 1)`, `|D_n| = 2n(n - 1)` and `|E₈| = 240`.
(README 3.1) -/
theorem ncard_roots (n : ℕ) :
    (rootsA n).ncard = n * (n + 1) ∧ (rootsD n).ncard = 2 * n * (n - 1) ∧
      rootsE8.ncard = 240 := by
  sorry

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 3.2 The Euclidean representation and root representations -/

/-- **The Euclidean representation.** The least eigenvalue is at least `-2` exactly when
`A + 2I` is positive semidefinite, and exactly when `A + 2I` is the Gram matrix of vectors in
`ℝ^r` for `r` the rank of `A + 2I`. (README 3.2) -/
theorem forall_neg_two_le_adjEigenvalues_iff :
    ((∀ i, -2 ≤ adjEigenvalues G i) ↔ (G.adjMatrix ℝ + 2).PosSemidef) ∧
      ((∀ i, -2 ≤ adjEigenvalues G i) ↔
        ∃ f : V → EuclideanSpace ℝ (Fin (G.adjMatrix ℝ + 2).rank),
          ∀ x y, inner ℝ (f x) (f y) = (G.adjMatrix ℝ + 2) x y) := by
  sorry

/-- A **root representation** of `G` in a set `Φ` of coordinate vectors: a vertex map into `Φ`
whose dot products are the entries of `A + 2I`. -/
structure RootRepresentation {N : ℕ} (Φ : Set (Fin N → ℚ)) where
  /-- The vector attached to a vertex. -/
  toFun : V → Fin N → ℚ
  /-- Every vector lies in `Φ`. -/
  mem : ∀ x, toFun x ∈ Φ
  /-- The dot products are `2`, `1`, `0` at equal, adjacent, and distinct nonadjacent pairs. -/
  dotProduct_eq : ∀ x y, toFun x ⬝ᵥ toFun y = if x = y then 2 else if G.Adj x y then 1 else 0

end SimpleGraph

/-! ### 3.3 The Gram classification -/

/-- **The Gram classification of connected root lattices.** An integral symmetric positive
semidefinite matrix with diagonal `2` whose diagram graph is connected is the Gram matrix, for
the form of the Cartan matrix, of a family of integral vectors spanning `ℤ^r`, for exactly one
valid simply-laced Dynkin type of rank `r`. (README 3.3) -/
theorem exists_dynkinType_gram {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    (M : Matrix ι ι ℤ) (hM : M.IsSymm) (hpsd : (M.map (Int.cast : ℤ → ℝ)).PosSemidef)
    (hdiag : ∀ i, M i i = 2) (hconn : (diagramGraph M).Connected) :
    ∃! t : DynkinType, t.Valid ∧ t.IsSimplyLaced ∧
      ∃ f : ι → Fin t.rank → ℤ, (∀ i j, f i ⬝ᵥ (t.cartanMatrix *ᵥ f j) = M i j) ∧
        Submodule.span ℤ (Set.range f) = ⊤ := by
  sorry

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 3.4 The theorem of Cameron, Goethals, Seidel and Shult -/

/-- **Cameron–Goethals–Seidel–Shult.** A connected graph with least eigenvalue at least `-2` has
a root representation in some `A_n`, in some `D_n`, or in `E₈`. (README 3.4) -/
theorem Connected.exists_rootRepresentation (hG : G.Connected)
    (h : ∀ i, -2 ≤ adjEigenvalues G i) :
    (∃ n, Nonempty (G.RootRepresentation (rootsA n))) ∨
      (∃ n, Nonempty (G.RootRepresentation (rootsD n))) ∨
      Nonempty (G.RootRepresentation rootsE8) := by
  sorry

end SimpleGraph

/-! ## Layer 4: generalized line graphs and exceptional graphs -/

namespace SimpleGraph

/-! ### 4.1 Cocktail party graphs -/

/-- The **cocktail party graph** `CP(m) = K_{m × 2}` on `2m` vertices: two vertices are adjacent
unless they lie in the same of the `m` pairs. -/
def cocktailPartyGraph (m : ℕ) : _root_.SimpleGraph (Fin m × Bool) where
  Adj p q := p.1 ≠ q.1
  symm := ⟨fun _ _ h ↦ Ne.symm h⟩
  loopless := ⟨fun _ h ↦ h rfl⟩

instance (m : ℕ) : DecidableRel (cocktailPartyGraph m).Adj := fun p q ↦
  inferInstanceAs (Decidable (p.1 ≠ q.1))

/-- **The spectrum of the cocktail party graph.** For `m ≥ 1` it is `2m - 2` once, `0` with
multiplicity `m` and `-2` with multiplicity `m - 1`. (README 4.1) -/
theorem adjSpectrum_cocktailPartyGraph {m : ℕ} (hm : 1 ≤ m) :
    (cocktailPartyGraph m).adjSpectrum =
      (2 * (m : ℝ) - 2) ::ₘ (Multiset.replicate m 0 + Multiset.replicate (m - 1) (-2)) := by
  sorry

/-! ### 4.2 Generalized line graphs -/

variable {W : Type*} [Fintype W] [DecidableEq W]

/-- The adjacency relation of the generalized line graph before symmetrization: edges of `H` as
in the line graph, a petal vertex at `x` with the edges at `x`, and two petal vertices at the same
vertex from different petals. -/
def GeneralizedLineGraphRel (H : _root_.SimpleGraph W) (a : W → ℕ) :
    H.edgeSet ⊕ (Σ x : W, Fin (a x) × Bool) → H.edgeSet ⊕ (Σ x : W, Fin (a x) × Bool) → Prop
  | .inl e, .inl e' => H.lineGraph.Adj e e'
  | .inl e, .inr p => p.1 ∈ (e : Sym2 W)
  | .inr _, .inl _ => False
  | .inr p, .inr q => p.1 = q.1 ∧ (p.2.1 : ℕ) ≠ (q.2.1 : ℕ)

/-- The **generalized line graph** `L(H; a)`: the line graph of `H` together with, at each vertex
`x`, a cocktail party graph on `2 a_x` new vertices, each joined to the edges of `H` at `x`. A
vertex `⟨x, i, b⟩` is the `b`-th edge of the `i`-th petal at `x`. -/
def generalizedLineGraph (H : _root_.SimpleGraph W) (a : W → ℕ) :
    _root_.SimpleGraph (H.edgeSet ⊕ (Σ x : W, Fin (a x) × Bool)) :=
  fromRel (GeneralizedLineGraphRel H a)

/-- The signed vertex–edge incidence matrix of the petal multigraph `H(a)`: rows are the vertices
of `H` and the outer ends of the petals, columns the vertices of `L(H; a)`. -/
def glgIncidence (H : _root_.SimpleGraph W) (a : W → ℕ) :
    Matrix (W ⊕ (Σ x : W, Fin (a x))) (H.edgeSet ⊕ (Σ x : W, Fin (a x) × Bool)) ℤ
  | .inl v, .inl e => if v ∈ (e : Sym2 W) then 1 else 0
  | .inl v, .inr p => if v = p.1 then 1 else 0
  | .inr _, .inl _ => 0
  | .inr q, .inr p => if q.1 = p.1 ∧ (q.2 : ℕ) = (p.2.1 : ℕ) then (if p.2.2 then 1 else -1) else 0

/-- **The incidence identity.** `A(L(H; a)) + 2I = CᵀC` over `ℤ`. (README 4.2) -/
theorem glgIncidence_transpose_mul (H : _root_.SimpleGraph W) (a : W → ℕ) :
    open scoped Classical in
    (glgIncidence H a)ᵀ * glgIncidence H a = (generalizedLineGraph H a).adjMatrix ℤ + 2 := by
  sorry

/-- **Two special cases.** A generalized line graph with `a = 0` is the line graph, and one of
the one-vertex graph with `a = m` is the cocktail party graph `CP(m)`. (README 4.2) -/
theorem nonempty_iso_generalizedLineGraph (H : _root_.SimpleGraph W) (m : ℕ) :
    Nonempty (generalizedLineGraph H 0 ≃g H.lineGraph) ∧
      Nonempty (generalizedLineGraph (⊥ : _root_.SimpleGraph Unit) (fun _ ↦ m) ≃g
        cocktailPartyGraph m) := by
  sorry

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 4.3 Representations in `A_n` and `D_n` -/

/-- **Representations in `A_n` are line graphs of bipartite graphs.** `G` has a root
representation in `A_n` exactly when it is the line graph of a bipartite graph on `n + 1`
vertices. (README 4.3) -/
theorem nonempty_rootRepresentation_rootsA_iff (n : ℕ) :
    Nonempty (G.RootRepresentation (rootsA n)) ↔
      ∃ H : _root_.SimpleGraph (Fin (n + 1)), H.IsBipartite ∧ Nonempty (G ≃g H.lineGraph) := by
  sorry

/-- **Representations in `D_n` are generalized line graphs.** (README 4.3) -/
theorem exists_rootRepresentation_rootsD_iff :
    (∃ n, Nonempty (G.RootRepresentation (rootsD n))) ↔
      ∃ (m : ℕ) (H : _root_.SimpleGraph (Fin m)) (a : Fin m → ℕ),
        Nonempty (G ≃g generalizedLineGraph H a) := by
  sorry

/-! ### 4.4 Exceptional graphs -/

/-- **The exceptional graphs are bounded.** A graph with a root representation in `E₈` has at
most `36` vertices and maximum degree at most `28`. (README 4.4) -/
theorem RootRepresentation.card_le_and_degree_le (r : G.RootRepresentation rootsE8) :
    Fintype.card V ≤ 36 ∧ ∀ x, G.degree x ≤ 28 := by
  sorry

/-- **Generalized line graphs and exceptional graphs.** A connected graph with least eigenvalue
at least `-2` is a generalized line graph or has a root representation in `E₈`. (README 4.4) -/
theorem Connected.isGeneralizedLineGraph_or_rootRepresentation_E8 (hG : G.Connected)
    (h : ∀ i, -2 ≤ adjEigenvalues G i) :
    (∃ (m : ℕ) (H : _root_.SimpleGraph (Fin m)) (a : Fin m → ℕ),
        Nonempty (G ≃g generalizedLineGraph H a)) ∨
      Nonempty (G.RootRepresentation rootsE8) := by
  sorry

/-! ### 4.5 Regular generalized line graphs -/

/-- **A connected regular generalized line graph is a line graph or a cocktail party graph.**
(README 4.5) -/
theorem Connected.isLineGraph_or_cocktailParty_of_isRegularOfDegree (hG : G.Connected) {k : ℕ}
    (hk : G.IsRegularOfDegree k) {m : ℕ} {H : _root_.SimpleGraph (Fin m)} {a : Fin m → ℕ}
    (e : G ≃g generalizedLineGraph H a) :
    (∃ (m' : ℕ) (H' : _root_.SimpleGraph (Fin m')), Nonempty (G ≃g H'.lineGraph)) ∨
      ∃ m', Nonempty (G ≃g cocktailPartyGraph m') := by
  sorry

/-! ## Layer 5: graphs determined by their spectrum -/

/-! ### 5.1 Spectral determination and spectral recognition -/

/-- `G` is **determined by its adjacency spectrum**: every graph on `Fin n` with the same
adjacency spectrum is isomorphic to it. Graphs on `Fin n` represent all finite graphs of order
`n`. -/
def IsDeterminedByAdjSpectrum : Prop :=
  ∀ (H : _root_.SimpleGraph (Fin (Fintype.card V))) [DecidableRel H.Adj],
    H.adjSpectrum = G.adjSpectrum → Nonempty (H ≃g G)

/-- `G` is **determined by its Laplacian spectrum**. -/
def IsDeterminedByLapSpectrum : Prop :=
  ∀ (H : _root_.SimpleGraph (Fin (Fintype.card V))) [DecidableRel H.Adj],
    H.lapSpectrum = G.lapSpectrum → Nonempty (H ≃g G)

/-- `G` is **determined by its signless Laplacian spectrum**. -/
def IsDeterminedBySignlessLapSpectrum : Prop :=
  ∀ (H : _root_.SimpleGraph (Fin (Fintype.card V))) [DecidableRel H.Adj],
    H.signlessLapSpectrum = G.signlessLapSpectrum → Nonempty (H ≃g G)

/-- **The adjacency spectrum determines the number of edges.** (README 5.1) -/
theorem card_edgeFinset_eq_of_adjSpectrum_eq {W : Type*} [Fintype W] [DecidableEq W]
    {H : _root_.SimpleGraph W} [DecidableRel H.Adj] (h : G.adjSpectrum = H.adjSpectrum) :
    #G.edgeFinset = #H.edgeFinset := by
  sorry

/-- **Each of the three spectra recognizes regularity and the degree.** (README 5.1) -/
theorem IsRegularOfDegree.of_spectrum_eq {W : Type*} [Fintype W] [DecidableEq W]
    {H : _root_.SimpleGraph W} [DecidableRel H.Adj] {k : ℕ} (hG : G.IsRegularOfDegree k) :
    (G.adjSpectrum = H.adjSpectrum → H.IsRegularOfDegree k) ∧
      (G.lapSpectrum = H.lapSpectrum → H.IsRegularOfDegree k) ∧
      (G.signlessLapSpectrum = H.signlessLapSpectrum → H.IsRegularOfDegree k) := by
  sorry

/-! ### 5.2 Regular graphs -/

/-- **For regular graphs the three notions agree, and agree for the complement.** (README 5.2) -/
theorem IsRegularOfDegree.isDeterminedBySpectrum_iff {k : ℕ} (hG : G.IsRegularOfDegree k) :
    (G.IsDeterminedByLapSpectrum ↔ G.IsDeterminedByAdjSpectrum) ∧
      (G.IsDeterminedBySignlessLapSpectrum ↔ G.IsDeterminedByAdjSpectrum) ∧
      (Gᶜ.IsDeterminedByAdjSpectrum ↔ G.IsDeterminedByAdjSpectrum) := by
  sorry

/-! ### 5.3 Graphs determined by their spectrum -/

/-- **`K_n` is determined by its adjacency spectrum.** (README 5.3) -/
theorem isDeterminedByAdjSpectrum_top (n : ℕ) :
    (⊤ : _root_.SimpleGraph (Fin n)).IsDeterminedByAdjSpectrum := by
  sorry

/-- **`K_{m,m}` is determined by its adjacency spectrum.** (README 5.3) -/
theorem isDeterminedByAdjSpectrum_completeBipartiteGraph (m : ℕ) :
    (completeBipartiteGraph (Fin m) (Fin m)).IsDeterminedByAdjSpectrum := by
  sorry

/-- **`C_n` is determined by its adjacency spectrum**, for `n ≥ 3`. (README 5.3) -/
theorem isDeterminedByAdjSpectrum_cycleGraph {n : ℕ} (hn : 3 ≤ n) :
    (cycleGraph n).IsDeterminedByAdjSpectrum := by
  sorry

/-- **Disjoint unions of complete graphs are determined by their adjacency spectrum**: these
are the graphs whose complement is complete multipartite. (README 5.3) -/
theorem isDeterminedByAdjSpectrum_of_isCompleteMultipartite_compl
    (h : Gᶜ.IsCompleteMultipartite) : G.IsDeterminedByAdjSpectrum := by
  sorry

/-! ### 5.4 Counterexamples -/

/-- **`K_{1,4}` is not determined by its adjacency spectrum.** (README 5.4) -/
theorem not_isDeterminedByAdjSpectrum_star :
    ¬ (completeBipartiteGraph (Fin 1) (Fin 4)).IsDeterminedByAdjSpectrum := by
  sorry

/-- **`K₅ ⊔ 5K₂` and the Petersen graph with five isolated vertices are Laplacian
cospectral**, so `K₅ ⊔ 5K₂` is not determined by its Laplacian spectrum. (README 5.4) -/
theorem lapSpectrum_complete_sum_matching :
    ((⊤ : _root_.SimpleGraph (Fin 5)) ⊕g ((⊥ : _root_.SimpleGraph (Fin 5)) □
        (⊤ : _root_.SimpleGraph (Fin 2)))).lapSpectrum =
      (petersenGraph ⊕g (⊥ : _root_.SimpleGraph (Fin 5))).lapSpectrum ∧
    ¬ ((⊤ : _root_.SimpleGraph (Fin 5)) ⊕g ((⊥ : _root_.SimpleGraph (Fin 5)) □
        (⊤ : _root_.SimpleGraph (Fin 2)))).IsDeterminedByLapSpectrum := by
  sorry

/-! ### 5.5 Graphs with index below two -/

/-- **Dynkin diagrams of equal rank have distinct spectra.** (README 5.5) -/
theorem adjSpectrum_diagramGraph_injective {t t' : DynkinType} (ht : t.Valid) (ht' : t'.Valid)
    (hs : t.IsSimplyLaced) (hs' : t'.IsSimplyLaced) (hr : t.rank = t'.rank)
    (h : (diagramGraph t.cartanMatrix).adjSpectrum =
      (diagramGraph t'.cartanMatrix).adjSpectrum) : t = t' := by
  sorry

/-- **Every connected graph with `θ₁ < 2` is determined by its adjacency spectrum**; in
particular every nonempty path is. (README 5.5) -/
theorem Connected.isDeterminedByAdjSpectrum_of_largestEigenvalue_lt_two [Nonempty V]
    (hG : G.Connected) (h : largestEigenvalue G < 2) : G.IsDeterminedByAdjSpectrum := by
  sorry

/-! ## Layer 6: regular two-graphs, strongly regular graphs and the relative bound -/

/-! ### 6.1 The descendant -/

/-- The **descendant** of `G` at `x`: switch, in the sense of EquiangularLinesAndTwoGraphs 1.2,
with respect to the neighbourhood of `x`, which isolates `x`, then delete `x`. -/
def descendant (x : V) : _root_.SimpleGraph {y : V // y ≠ x} :=
  (switch G (G.neighborSet x)).induce {y | y ≠ x}

/-! ### 6.2 Regular two-graphs and their descendants -/

/-- **Regular two-graphs and their descendants.** If `G` is switching equivalent neither to the
complete nor to the empty graph, the two-graph of `G` is regular of degree `k` exactly when the
descendant at `x` is strongly regular on `n - 1` vertices with degree `k = 2μ`. (README 6.2) -/
theorem isRegularTwoGraph_oddTriples_iff_isSRGWith (hK : ¬ ∃ U : Set V, switch G U = ⊤)
    (hE : ¬ ∃ U : Set V, switch G U = ⊥) (x : V) (k : ℕ) :
    open scoped Classical in
    IsRegularTwoGraph (oddTriples G) k ↔
      ∃ ℓ μ : ℕ, (G.descendant x).IsSRGWith (Fintype.card V - 1) k ℓ μ ∧ k = 2 * μ := by
  sorry

/-! ### 6.3 Regular graphs in regular two-graphs -/

/-- **Regular graphs in regular two-graphs.** A `k`-regular graph that is switching equivalent
neither to the complete nor to the empty graph has a regular two-graph exactly when it is
strongly regular and `k - n/2` is an adjacency eigenvalue. (README 6.3) -/
theorem IsRegularOfDegree.exists_isRegularTwoGraph_oddTriples_iff {k : ℕ}
    (hG : G.IsRegularOfDegree k) (hK : ¬ ∃ U : Set V, switch G U = ⊤)
    (hE : ¬ ∃ U : Set V, switch G U = ⊥) :
    (∃ a, IsRegularTwoGraph (oddTriples G) a) ↔
      (∃ ℓ μ : ℕ, G.IsSRGWith (Fintype.card V) k ℓ μ) ∧
        (k : ℝ) - (Fintype.card V : ℝ) / 2 ∈ G.adjSpectrum := by
  sorry

end SimpleGraph

/-! ### 6.4 Two Seidel eigenvalues give equality in the relative bound -/

section RelativeBound

/-- **Two Seidel eigenvalues give equality in the relative bound.** An equiangular family of `n`
unit vectors with angle `α` that spans a real inner product space of dimension `d < n`, and whose
sign graph has a Seidel matrix with exactly two distinct eigenvalues, has
`n (1 - d α²) = d (1 - α²)`. (README 6.4) -/
theorem card_mul_eq_of_ncard_eigenvalues_seidelMatrix_eq_two {E ι : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [Fintype ι] [DecidableEq ι] {x : ι → E}
    {α : ℝ} (hx : IsEquiangular ℝ x α) (hspan : Submodule.span ℝ (Set.range x) = ⊤)
    (hn : Module.finrank ℝ E < Fintype.card ι)
    (h2 : {θ : ℝ | Module.End.HasEigenvalue
      (Matrix.toLin' (seidelMatrix ℝ (signGraph x))) θ}.ncard = 2) :
    (Fintype.card ι : ℝ) * (1 - Module.finrank ℝ E * α ^ 2) =
      Module.finrank ℝ E * (1 - α ^ 2) := by
  sorry

end RelativeBound

/-! ## Library declarations consumed -/

/-! Mathlib. -/

#check @SimpleGraph.adjMatrix
#check @SimpleGraph.lapMatrix
#check @completeBipartiteGraph
#check @SimpleGraph.lineGraph
#check @SimpleGraph.IsBipartite
#check @SimpleGraph.IsCompleteMultipartite
#check @SimpleGraph.pathGraph
#check @SimpleGraph.cycleGraph
#check @SimpleGraph.IsSRGWith
#check @SimpleGraph.adjMatrix_pow_apply_eq_card_walk
#check @SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix
#check @Matrix.charpoly
#check @Matrix.posSemidef_gram
#check @Matrix.IsHermitian.eigenvalues₀
#check @RootPairing.nonempty_base

/-! Tau Ceti: Dynkin diagrams, affine diagrams and the form `2I - A` (Layer 2). -/

#check @SimpleGraph.graphCartanMatrix
#check @SimpleGraph.posDef_graphCartanMatrix_iff
#check @TauCeti.diagramGraph
#check @TauCeti.DynkinType.diagramGraph_cartanMatrix_A
#check @TauCeti.starCartanMatrix
#check @TauCeti.starHasCartanType_D
#check @TauCeti.starHasCartanType_E6
#check @TauCeti.starHasCartanType_E7
#check @TauCeti.starHasCartanType_E8
#check @TauCeti.AffineDynkinType.bourbakiGraphEmbedding
#check @SimpleGraph.Connected.exists_isContained_affineDynkinType_of_not_exists_dynkinType_iso

/-! Tau Ceti: the classification of root systems and the root lattices (Layer 3). -/

#check @TauCeti.IsFiniteType.existsUnique_dynkinType
#check @TauCeti.existsUnique_dynkinType
#check @TauCeti.DynkinType.numRoots
#check @TauCeti.DynkinType.rootLattice
#check @TauCeti.DynkinType.rootLatticeRootEquiv
#check @TauCeti.DynkinType.representationNumber_rootLattice_two
#check @TauCeti.DynkinType.rootLattice_A
#check @TauCeti.DynkinType.rootLattice_E8
#check @TauCeti.DynkinType.rootLatticeIsometryCheckerboard
#check @TauCeti.IntegralLattice.zeroSumLattice
#check @TauCeti.IntegralLattice.typeAIsometryZeroSumLattice
#check @TauCeti.IntegralLattice.checkerboardLattice
#check @TauCeti.IntegralLattice.typeE₈IsometryD8Plus

end TauCetiRoadmap.LineSystemsAndSwitching
