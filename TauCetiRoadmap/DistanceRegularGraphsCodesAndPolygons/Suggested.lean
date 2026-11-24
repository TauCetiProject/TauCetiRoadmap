module

public import Mathlib
public import TauCeti.InformationTheory.Coding.Krawtchouk

/-!
# Distance-regular graphs, perfect codes and generalized polygons: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (the bound on
the number of points in 1.3, the remarks on degree two in 3.4) are stated there in prose with
their proof routes.

Conventions (README, Conventions): a symmetric association scheme with `d` classes is a class
function `rel : X → X → Fin (d + 1)` satisfying `IsAssocScheme`, with a family `E` of primitive
idempotents satisfying `IsPrimitiveIdempotents`; eigenmatrices, intersection numbers and Krein
parameters are the explicit formulas of AssociationSchemes. A distance-regular graph is
`IsDistanceRegular G`. The intersection numbers `b_i`, `a_i`, `c_i` of a graph are read off at a
chosen pair of vertices at distance `i`. A generalized `m`-gon is a connected bipartite graph of
diameter `m` and extended girth `2m`; its points and lines are the two colour classes of a
`Coloring Bool`.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues of
SpectralGraphBounds 1.1 (as GraphSpectra copies them), the adjacency spectrum and the Hamming and
Johnson graphs with their `DecidableRel` instances of GraphSpectra 1.2, 2.3 and 2.4, the schemes,
idempotents, eigenmatrices, intersection numbers, Krein parameters, inner distributions and
distance-regular graphs of AssociationSchemes 1.1, 1.2, 2.1, 2.3, 3.1, 4.1 and 6.2, the cometric
schemes of DelsarteTheoryOfCodesAndDesigns 4.1, the Moore number of StronglyRegularAndMooreGraphs
3.1, the perfect codes and distance distributions of BoundsOnCodes 1.2 and 5.1, and the designs
and incidence graphs of StronglyRegularGraphsAndDesigns 5.1 and 5.3.
-/

@[expose] public section

noncomputable section

open Finset Matrix Polynomial

namespace TauCetiRoadmap.DistanceRegularGraphsCodesAndPolygons

open TauCetiRoadmap.DistanceRegularGraphsCodesAndPolygons

/-! ## Local copy: SpectralGraphBounds, §1.1 -/

namespace SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end SpectralGraphBounds

open SpectralGraphBounds

/-! ## Local copy: GraphSpectra, §§1.2, 2.3 and 2.4 -/

namespace GraphSpectra

namespace SimpleGraph

section Definitions

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The adjacency spectrum, as a multiset of real numbers. -/
def adjSpectrum : Multiset ℝ := Multiset.map (adjEigenvalues G) Finset.univ.val

end Definitions

/-- The Hamming graph `H(d, |Q|)`: words of length `d` over `Q`, adjacent when they differ in
exactly one coordinate. -/
def hammingGraph (d : ℕ) (Q : Type*) [DecidableEq Q] : _root_.SimpleGraph (Fin d → Q) where
  Adj x y := hammingDist x y = 1
  symm := ⟨fun x y h ↦ by rwa [hammingDist_comm]⟩
  loopless := ⟨fun x h ↦ by simp at h⟩

/-- The Johnson graph `J(|α|, k)`: the `k`-subsets of `α`, adjacent when they meet in `k - 1`
points. Its carrier is that of `TopologicalCombinatorics.kneserGraph α k`. -/
def johnsonGraph (α : Type*) [DecidableEq α] (k : ℕ) :
    _root_.SimpleGraph {s : Finset α | s.card = k} where
  Adj s t := s ≠ t ∧ ((s : Finset α) ∩ t).card + 1 = k
  symm := ⟨fun _ _ h ↦ ⟨h.1.symm, by rw [Finset.inter_comm]; exact h.2⟩⟩
  loopless := ⟨fun _ h ↦ h.1 rfl⟩

instance {d : ℕ} {Q : Type*} [DecidableEq Q] : DecidableRel (hammingGraph d Q).Adj :=
  fun _ _ ↦ inferInstanceAs (Decidable (hammingDist _ _ = 1))

instance {α : Type*} [DecidableEq α] {k : ℕ} : DecidableRel (johnsonGraph α k).Adj :=
  fun s t ↦ inferInstanceAs (Decidable (s ≠ t ∧ ((s : Finset α) ∩ t).card + 1 = k))

end SimpleGraph

end GraphSpectra

open GraphSpectra GraphSpectra.SimpleGraph

/-! ## Local copy: AssociationSchemes, §§1.1, 1.2, 2.1, 2.3, 3.1, 4.1 and 6.2 -/

namespace AssociationSchemes

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}

/-- 1.1 A symmetric association scheme with `d` classes, given by its class function: class `0`
is the diagonal, every class is symmetric and nonempty, and for all `i`, `j` the number of `z`
with `rel x z = i` and `rel z y = j` depends only on the class of `(x, y)`. -/
structure IsAssocScheme (rel : X → X → Fin (d + 1)) : Prop where
  rel_eq_zero_iff : ∀ x y, rel x y = 0 ↔ x = y
  rel_comm : ∀ x y, rel x y = rel y x
  exists_rel_eq : ∀ i, ∃ x y, rel x y = i
  card_eq : ∀ i j x y x' y', rel x y = rel x' y' →
    #{z | rel x z = i ∧ rel z y = j} = #{z | rel x' z = i ∧ rel z y' = j}

/-- 1.1 The adjacency matrix `A_i` of class `i`: the real `0/1` matrix of the relation
`rel x y = i`. -/
def adjMat (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) : Matrix X X ℝ :=
  Matrix.of fun x y => if rel x y = i then 1 else 0

/-- 1.1 The Bose–Mesner algebra: the real span of the adjacency matrices of the classes. -/
def bmAlgebra (rel : X → X → Fin (d + 1)) : Submodule ℝ (Matrix X X ℝ) :=
  Submodule.span ℝ (Set.range (adjMat rel))

/-- 1.1 The valency `v_i` of class `i`: the number of ordered pairs in class `i` divided by
`|X|`. On a scheme it is the number of `y` with `rel x y = i`, for every `x`. -/
def valency (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) : ℝ :=
  (#{p : X × X | rel p.1 p.2 = i} : ℝ) / Fintype.card X

/-- 1.2 A family of primitive idempotents of the scheme: a complete family of orthogonal
idempotents, all nonzero and all in the Bose–Mesner algebra, the one of index `0` being
`J / |X|`. -/
structure IsPrimitiveIdempotents (rel : X → X → Fin (d + 1))
    (E : Fin (d + 1) → Matrix X X ℝ) : Prop where
  complete : CompleteOrthogonalIdempotents E
  ne_zero : ∀ i, E i ≠ 0
  mem_bmAlgebra : ∀ i, E i ∈ bmAlgebra rel
  eq_zero : E 0 = (Fintype.card X : ℝ)⁻¹ • Matrix.of fun _ _ => 1

/-- 2.1 The first eigenmatrix `P`: `P i j = tr (A_j E_i) / tr E_i`, the eigenvalue of `A_j` on
the column space of `E_i`. -/
def eigenmatrix (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun i j => (adjMat rel j * E i).trace / (E i).trace

/-- 2.1 The second eigenmatrix `Q`: `Q i j = (∑_(x, y) (A_i)_(xy) (E_j)_(xy)) / v_i`, which is
`|X|` times the common value of `E_j` on the pairs of class `i`. -/
def dualEigenmatrix (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun i j => (∑ x, ∑ y, adjMat rel i x y * E j x y) / valency rel i

/-- 2.3 The intersection number `p^k_(ij)`: the number of triples `(x, y, z)` with `(x, y)` in
class `k`, `(x, z)` in class `i` and `(z, y)` in class `j`, divided by the number of pairs in
class `k`. On a scheme it is the common number of such `z` for each pair in class `k`. -/
def intersectionNumber (rel : X → X → Fin (d + 1)) (i j k : Fin (d + 1)) : ℝ :=
  (#{t : X × X × X | rel t.1 t.2.1 = k ∧ rel t.1 t.2.2 = i ∧ rel t.2.2 t.2.1 = j} : ℝ) /
    #{p : X × X | rel p.1 p.2 = k}

/-- 2.3 The intersection matrix `L_i`, with entries `(L_i)_(kj) = p^k_(ij)`. -/
def intersectionMatrix (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun k j => intersectionNumber rel i j k

/-- 3.1 The Krein parameter
`q^k_(ij) = (∑_l v_l Q_(li) Q_(lj) Q_(lk)) / (|X| m_k)`, with `m_k = tr E_k`. -/
def kreinParam (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ)
    (i j k : Fin (d + 1)) : ℝ :=
  (∑ l, valency rel l * dualEigenmatrix rel E l i * dualEigenmatrix rel E l j *
      dualEigenmatrix rel E l k) / (Fintype.card X * (E k).trace)

/-- 4.1 The inner distribution of a set `Y`: `a_i` is the number of ordered pairs of `Y` in
class `i` divided by `|Y|` (and `0` when `Y` is empty). -/
def innerDistribution (rel : X → X → Fin (d + 1)) (Y : Finset X) (i : Fin (d + 1)) : ℝ :=
  (#{p ∈ Y ×ˢ Y | rel p.1 p.2 = i} : ℝ) / #Y

/-- 6.2 A finite graph is distance-regular when it is connected and, for vertices `x`, `y` at
distance `h`, the number `c_h` of neighbours of `y` at distance `h − 1` from `x` and the number
`b_h` of neighbours of `y` at distance `h + 1` from `x` depend only on `h`. -/
def IsDistanceRegular {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  G.Connected ∧ ∀ x y x' y' : V, G.dist x y = G.dist x' y' →
    #{z | G.Adj y z ∧ G.dist x z + 1 = G.dist x y} =
        #{z | G.Adj y' z ∧ G.dist x' z + 1 = G.dist x' y'} ∧
      #{z | G.Adj y z ∧ G.dist x z = G.dist x y + 1} =
        #{z | G.Adj y' z ∧ G.dist x' z = G.dist x' y' + 1}

/-- 6.2 The distance classes of a graph, with values in `Fin (diam + 1)` (a distance is capped at
the diameter, which changes nothing for a connected graph). -/
def distRel {V : Type*} (G : SimpleGraph V) (x y : V) : Fin (G.diam + 1) :=
  ⟨min (G.dist x y) G.diam, Nat.lt_succ_of_le (min_le_right _ _)⟩

end AssociationSchemes

open AssociationSchemes

/-! ## Local copy: DelsarteTheoryOfCodesAndDesigns, §4.1 -/

namespace DelsarteTheoryOfCodesAndDesigns

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}

/-- 4.1 A scheme is cometric (`Q`-polynomial) for the given order of its idempotents when
`q^k_(1j) = 0` for `k > j + 1` and `q^(j+1)_(1j) ≠ 0` for every `j < d`. -/
def IsCometric (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) : Prop :=
  (∀ j k : Fin (d + 1), (j : ℕ) + 1 < k → kreinParam rel E 1 j k = 0) ∧
    ∀ j k : Fin (d + 1), (k : ℕ) = j + 1 → kreinParam rel E 1 j k ≠ 0

end DelsarteTheoryOfCodesAndDesigns

/-! ## Local copy: StronglyRegularAndMooreGraphs, §3.1 -/

namespace StronglyRegularAndMooreGraphs

/-- 3.1 The Moore number `1 + k ∑_(i < d) (k − 1)^i = 1 + k + k(k − 1) + ⋯ + k(k − 1)^(d − 1)`,
with natural-number subtraction (for `k = 0` it is `1`). -/
def mooreBound (k d : ℕ) : ℕ :=
  1 + k * ∑ i ∈ range d, (k - 1) ^ i

end StronglyRegularAndMooreGraphs

open StronglyRegularAndMooreGraphs

/-! ## Local copy: BoundsOnCodes, §§1.2 and 5.1 -/

namespace BoundsOnCodes

variable {ι α : Type*} [Fintype ι] [Fintype α] [DecidableEq α]

/-- 1.2 A set of words is a perfect code of radius `t` when every word lies within distance `t`
of exactly one of its words. -/
def IsPerfect (C : Set (ι → α)) (t : ℕ) : Prop :=
  ∀ y : ι → α, ∃! c, c ∈ C ∧ hammingDist y c ≤ t

/-- 5.1 The (unnormalized) distance distribution of a code: the number of ordered pairs of words
of `C`, equal or not, at distance `i`. Dividing by `#C` gives the usual `A_i`. -/
def distanceDistribution (C : Finset (ι → α)) (i : ℕ) : ℕ :=
  #{p ∈ C ×ˢ C | hammingDist p.1 p.2 = i}

end BoundsOnCodes

/-! ## Local copy: StronglyRegularGraphsAndDesigns, §§5.1 and 5.3 -/

namespace StronglyRegularGraphsAndDesigns

namespace Design

variable {P L : Type*} {inc : P → L → Prop} {v k ℓ : ℕ}

variable (inc) in
/-- A `2`-`(v, k, ℓ)` design for the incidence relation `inc` between points `P` and blocks
`L`: there are `v` points, every block is incident with `k` points, every two distinct points are
together incident with exactly `ℓ` blocks, and `2 ≤ k < v`, `0 < ℓ`. Repeated blocks are
allowed. -/
structure IsTwoDesign (v k ℓ : ℕ) : Prop where
  card_points : Nat.card P = v
  card_block : ∀ l, Nat.card {p // inc p l} = k
  card_pair : ∀ p q, p ≠ q → Nat.card {l // inc p l ∧ inc q l} = ℓ
  two_le : 2 ≤ k
  lt_card : k < v
  pos : 0 < ℓ

variable (inc) in
/-- A symmetric design: a `2`-design with as many blocks as points. -/
structure IsSymmetricDesign (v k ℓ : ℕ) : Prop extends IsTwoDesign inc v k ℓ where
  card_blocks : Nat.card L = v

variable (inc) in
/-- The incidence graph of `inc`: the bipartite graph on `P ⊕ L` in which `p` and `l` are
adjacent when they are incident. -/
def incidenceGraph : _root_.SimpleGraph (P ⊕ L) where
  Adj x y := Sum.elim (fun p ↦ Sum.elim (fun _ ↦ False) (inc p))
    (fun l ↦ Sum.elim (fun p ↦ inc p l) (fun _ ↦ False)) x y
  symm := ⟨by rintro (p | l) (q | m) h <;> exact h⟩
  loopless := ⟨by rintro (p | l) h <;> exact h⟩

instance instDecidableRelIncidenceGraph [DecidableRel inc] :
    DecidableRel (incidenceGraph inc).Adj
  | .inl _, .inl _ => inferInstanceAs (Decidable False)
  | .inl p, .inr l => inferInstanceAs (Decidable (inc p l))
  | .inr l, .inl p => inferInstanceAs (Decidable (inc p l))
  | .inr _, .inr _ => inferInstanceAs (Decidable False)

end Design

end StronglyRegularGraphsAndDesigns

open StronglyRegularGraphsAndDesigns

/-! ## Layer 1: ranks of entrywise products, eigenmatrix bounds and the absolute bound -/

namespace Matrix

variable {m n : Type*} [Fintype m] [Fintype n] {K : Type*} [Field K]

/-- **The rank of an entrywise product** (README 1.1). `rk (A ⊙ B) ≤ rk A · rk B`. -/
theorem rank_hadamard_le (A B : Matrix m n K) : (A ⊙ B).rank ≤ A.rank * B.rank := by
  sorry

/-- **The rank of an entrywise square** (README 1.1). `2 rk (A ⊙ A) ≤ rk A (rk A + 1)`. -/
theorem two_mul_rank_hadamard_self_le (A : Matrix m n K) :
    2 * (A ⊙ A).rank ≤ A.rank * (A.rank + 1) := by
  sorry

end Matrix

namespace Scheme

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}
  {rel : X → X → Fin (d + 1)} {E : Fin (d + 1) → Matrix X X ℝ}

/-- **Bounds on the eigenmatrices** (README 1.2). `|P_(ij)| ≤ v_j` and `|Q_(ij)| ≤ m_j`, with
`m_j = tr E_j`. -/
theorem abs_eigenmatrix_le (h : IsAssocScheme rel) (hE : IsPrimitiveIdempotents rel E)
    (i j : Fin (d + 1)) :
    |eigenmatrix rel E i j| ≤ valency rel j ∧ |dualEigenmatrix rel E i j| ≤ (E j).trace := by
  sorry

/-- **The absolute bound** (README 1.3). `∑_(q^k_(ij) ≠ 0) m_k ≤ m_i m_j` for all `i`, `j`,
and `2 ∑_(q^k_(ii) ≠ 0) m_k ≤ m_i (m_i + 1)`. -/
theorem sum_trace_le_of_kreinParam (h : IsAssocScheme rel) (hE : IsPrimitiveIdempotents rel E)
    (i j : Fin (d + 1)) :
    ∑ k with kreinParam rel E i j k ≠ 0, (E k).trace ≤ (E i).trace * (E j).trace ∧
      2 * ∑ k with kreinParam rel E i i k ≠ 0, (E k).trace ≤
        (E i).trace * ((E i).trace + 1) := by
  sorry

end Scheme

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ## Layer 2: distance-regular graphs -/

/-- The number of neighbours of `y` at distance `j` from `x`, read at a chosen pair `(x, y)`
with `dist x y = i` (and `0` if there is none). -/
def intersectionCount (i j : ℕ) : ℕ :=
  if h : ∃ p : V × V, G.dist p.1 p.2 = i then
    #{z | G.Adj h.choose.2 z ∧ G.dist h.choose.1 z = j}
  else 0

/-- The intersection number `b_i`. -/
def intersectionB (i : ℕ) : ℕ := G.intersectionCount i (i + 1)

/-- The intersection number `c_i`. -/
def intersectionC (i : ℕ) : ℕ := G.intersectionCount i (i - 1)

/-- The intersection number `a_i`. -/
def intersectionA (i : ℕ) : ℕ := G.intersectionCount i i

/-- The average number `k_i` of vertices at distance `i` from a vertex (natural division). -/
def sphereCount (i : ℕ) : ℕ := #{p : V × V | G.dist p.1 p.2 = i} / Fintype.card V

/-- The **distance matrix** `A_i`, the `0`–`1` matrix of distance `i`. -/
def distAdjMatrix (R : Type*) [Zero R] [One R] (i : ℕ) : Matrix V V R :=
  Matrix.of fun x y ↦ if G.dist x y = i then 1 else 0

/-- The **distance-`i` graph**, joining distinct vertices at distance `i`. -/
def distanceGraph (i : ℕ) : _root_.SimpleGraph V :=
  _root_.SimpleGraph.fromRel fun x y ↦ G.dist x y = i

/-- Adjacency in a distance graph is decidable. -/
instance instDecidableRelDistanceGraph (i : ℕ) : DecidableRel (G.distanceGraph i).Adj :=
  fun x y ↦ inferInstanceAs (Decidable (x ≠ y ∧ (G.dist x y = i ∨ G.dist y x = i)))

/-- A graph is **antipodal** when two distinct vertices at distance `diam` from a common vertex
are at distance `diam` from each other. -/
def IsAntipodal : Prop :=
  ∀ x y z, G.dist x y = G.diam → G.dist x z = G.diam → y ≠ z → G.dist y z = G.diam

/-- A graph is **distance-transitive** when it is connected and its automorphisms act
transitively on the ordered pairs at each distance. -/
def IsDistanceTransitive : Prop :=
  G.Connected ∧ ∀ x y x' y' : V, G.dist x y = G.dist x' y' →
    ∃ φ : G ≃g G, φ x = x' ∧ φ y = y'

/-- The tridiagonal **intersection matrix** `T` of order `diam + 1`, with subdiagonal `c_i`,
diagonal `a_i` and superdiagonal `b_i`. -/
def intersectionMatrix : Matrix (Fin (G.diam + 1)) (Fin (G.diam + 1)) ℝ :=
  Matrix.of fun i j ↦
    if (j : ℕ) + 1 = i then G.intersectionC i
    else if j = i then G.intersectionA i
    else if (j : ℕ) = i + 1 then G.intersectionB i else 0

variable {G}

/-- **The intersection numbers** (README 2.1). For `dist x y = i`, `y` has `b_i`, `a_i`, `c_i`
neighbours at distance `i + 1`, `i`, `i − 1` from `x`, and `intersectionCount i j` neighbours at
distance `j`. -/
theorem IsDistanceRegular.card_adj_dist (hG : IsDistanceRegular G) {x y : V} {i : ℕ}
    (h : G.dist x y = i) :
    #{z | G.Adj y z ∧ G.dist x z = i + 1} = G.intersectionB i ∧
      #{z | G.Adj y z ∧ G.dist x z = i} = G.intersectionA i ∧
      #{z | G.Adj y z ∧ G.dist x z = i - 1} = G.intersectionC i ∧
      ∀ j, #{z | G.Adj y z ∧ G.dist x z = j} = G.intersectionCount i j := by
  sorry

/-- **Intersection numbers of the distance scheme** (README 2.1). For a distance-regular graph
of diameter at least `1`, the intersection numbers `p^h_(j1)` of the distance classes are the
counts `intersectionCount h j`, and the intersection matrix `L_1` of the distance scheme is the
tridiagonal matrix `T`. -/
theorem IsDistanceRegular.intersectionNumber_distRel (hG : IsDistanceRegular G)
    (hd : 1 ≤ G.diam) :
    (∀ h j : Fin (G.diam + 1),
      intersectionNumber (distRel G) j 1 h = G.intersectionCount h j) ∧
      G.intersectionMatrix = AssociationSchemes.intersectionMatrix (distRel G) 1 := by
  sorry

/-- **Parameter identities** (README 2.2). A distance-regular graph is `b_0`-regular;
`a_i + b_i + c_i = b_0` for `i ≤ diam`; `c_1 = 1` and `b_diam = 0` when `diam ≥ 1`;
`b_(i+1) ≤ b_i`, `c_i ≤ c_(i+1)` and `0 < c_(i+1)` for `i < diam`. -/
theorem IsDistanceRegular.intersection_identities (hG : IsDistanceRegular G) :
    G.IsRegularOfDegree (G.intersectionB 0) ∧
      (∀ i ≤ G.diam, G.intersectionA i + G.intersectionB i + G.intersectionC i =
        G.intersectionB 0) ∧
      (1 ≤ G.diam → G.intersectionC 1 = 1 ∧ G.intersectionB G.diam = 0) ∧
      ∀ i, i + 1 ≤ G.diam → G.intersectionB (i + 1) ≤ G.intersectionB i ∧
        G.intersectionC i ≤ G.intersectionC (i + 1) ∧ 0 < G.intersectionC (i + 1) := by
  sorry

/-- **Sphere sizes** (README 2.2). In a distance-regular graph every vertex has `k_i` vertices
at distance `i`, and `k_(i+1) c_(i+1) = k_i b_i`. -/
theorem IsDistanceRegular.card_dist_eq_sphereCount (hG : IsDistanceRegular G) :
    (∀ (x : V) (i : ℕ), #{y | G.dist x y = i} = G.sphereCount i) ∧
      ∀ i, G.sphereCount (i + 1) * G.intersectionC (i + 1) =
        G.sphereCount i * G.intersectionB i := by
  sorry

/-- **The distance recurrence** (README 2.3).
`A A_(i+1) = b_i A_i + a_(i+1) A_(i+1) + c_(i+2) A_(i+2)`. -/
theorem IsDistanceRegular.adjMatrix_mul_distAdjMatrix (hG : IsDistanceRegular G) (i : ℕ) :
    G.adjMatrix ℝ * G.distAdjMatrix ℝ (i + 1) =
      (G.intersectionB i : ℝ) • G.distAdjMatrix ℝ i +
        (G.intersectionA (i + 1) : ℝ) • G.distAdjMatrix ℝ (i + 1) +
        (G.intersectionC (i + 2) : ℝ) • G.distAdjMatrix ℝ (i + 2) := by
  sorry

/-- **Distance-transitive graphs are distance-regular** (README 2.4). -/
theorem IsDistanceTransitive.isDistanceRegular (hG : G.IsDistanceTransitive) :
    IsDistanceRegular G := by
  sorry

/-- **Strongly regular graphs are the distance-regular graphs of diameter two** (README 2.5). -/
theorem isDistanceRegular_and_diam_eq_two_iff :
    IsDistanceRegular G ∧ G.diam = 2 ↔
      G.Connected ∧ G ≠ ⊤ ∧ ∃ n k ℓ μ, G.IsSRGWith n k ℓ μ := by
  sorry

/-- **The intersection array of a strongly regular graph** (README 2.5). A connected strongly
regular graph that is not complete has intersection array `{k, k − ℓ − 1; 1, μ}`. -/
theorem IsSRGWith.intersectionArray {n k ℓ μ : ℕ} (h : G.IsSRGWith n k ℓ μ) (hc : G.Connected)
    (htop : G ≠ ⊤) :
    G.intersectionB 0 = k ∧ G.intersectionB 1 = k - ℓ - 1 ∧ G.intersectionC 1 = 1 ∧
      G.intersectionC 2 = μ := by
  sorry

/-! ## Layer 3: the spectrum of a distance-regular graph -/

/-- **`d + 1` eigenvalues, the eigenvalues of `T`** (README 3.1). A distance-regular graph of
diameter `d` has exactly `d + 1` distinct adjacency eigenvalues, and they are the roots of the
characteristic polynomial of the tridiagonal intersection matrix. -/
theorem IsDistanceRegular.adjSpectrum_eq_roots (hG : IsDistanceRegular G) :
    G.adjSpectrum.toFinset.card = G.diam + 1 ∧
      ∀ θ : ℝ, θ ∈ G.adjSpectrum ↔ G.intersectionMatrix.charpoly.IsRoot θ := by
  sorry

/-- **Biggs's multiplicity formula** (README 3.2). If `T u = θ u` with `u_0 = 1`, then `θ` has
multiplicity `|V| / ∑_i k_i u_i²`. -/
theorem IsDistanceRegular.count_adjSpectrum (hG : IsDistanceRegular G) {θ : ℝ}
    {u : Fin (G.diam + 1) → ℝ} (hu : G.intersectionMatrix *ᵥ u = θ • u) (hu0 : u 0 = 1) :
    (G.adjSpectrum.count θ : ℝ) =
      Fintype.card V / ∑ i : Fin (G.diam + 1), (G.sphereCount i : ℝ) * u i ^ 2 := by
  sorry

/-- **Smith's theorem** (README 3.3). A distance-regular graph of diameter at least `2` and
degree at least `3` has a disconnected distance-`i` graph for some `0 < i ≤ diam` exactly when
it is bipartite or antipodal. -/
theorem IsDistanceRegular.exists_not_connected_distanceGraph_iff (hG : IsDistanceRegular G)
    (hd : 2 ≤ G.diam) (hk : 3 ≤ G.intersectionB 0) :
    (∃ i, 0 < i ∧ i ≤ G.diam ∧ ¬ (G.distanceGraph i).Connected) ↔
      G.Colorable 2 ∨ G.IsAntipodal := by
  sorry

/-- **Connected `2`-regular graphs are cycles** (README 3.4). -/
theorem exists_iso_cycleGraph (hG : G.Connected) (h2 : G.IsRegularOfDegree 2) :
    ∃ n, Nonempty (G ≃g _root_.SimpleGraph.cycleGraph n) := by
  sorry

/-- **Cycles are distance-regular** (README 3.4). -/
theorem cycleGraph_isDistanceRegular {n : ℕ} (hn : 0 < n) :
    IsDistanceRegular (_root_.SimpleGraph.cycleGraph n) := by
  sorry

/-! ## Layer 4: Hamming and Johnson graphs -/

section Hamming

variable {d : ℕ} {Q : Type*} [Fintype Q] [DecidableEq Q]

/-- **Hamming graphs are distance-transitive and distance-regular** (README 4.1). -/
theorem hammingGraph_isDistanceTransitive [Nonempty Q] :
    (hammingGraph d Q).IsDistanceTransitive ∧ IsDistanceRegular (hammingGraph d Q) := by
  sorry

/-- **The intersection array of `H(d, q)`** (README 4.1). For `q ≥ 2` the diameter is `d`,
and `b_i = (d − i)(q − 1)` and `c_i = i` for `i ≤ d`. -/
theorem intersection_hammingGraph [Nontrivial Q] :
    (hammingGraph d Q).diam = d ∧ ∀ i ≤ d,
      (hammingGraph d Q).intersectionB i = (d - i) * (Fintype.card Q - 1) ∧
        (hammingGraph d Q).intersectionC i = i := by
  sorry

end Hamming

section Johnson

variable {α : Type*} [Fintype α] [DecidableEq α] {k : ℕ}

/-- **Johnson graphs are distance-regular** (README 4.2). For `k ≤ v`, `J(v, k)` is
distance-regular of diameter `min(k, v − k)`. -/
theorem johnsonGraph_isDistanceRegular (hk : k ≤ Fintype.card α) :
    IsDistanceRegular (johnsonGraph α k) ∧
      (johnsonGraph α k).diam = min k (Fintype.card α - k) := by
  sorry

/-- **The intersection array of `J(v, k)`** (README 4.2). For `2k ≤ v` and `i ≤ k`,
`b_i = (k − i)(v − k − i)` and `c_i = i²`. -/
theorem intersection_johnsonGraph (hk : 2 * k ≤ Fintype.card α) {i : ℕ} (hi : i ≤ k) :
    (johnsonGraph α k).intersectionB i = (k - i) * (Fintype.card α - k - i) ∧
      (johnsonGraph α k).intersectionC i = i ^ 2 := by
  sorry

end Johnson

/-! ## Layer 5: the spectral excess theorem -/

section SpectralExcess

variable (G) in
/-- The pairing `⟨p, q⟩ = (1/n) tr (p(A) q(A))` on real polynomials. -/
def spectralPairing (p q : ℝ[X]) : ℝ :=
  (aeval (G.adjMatrix ℝ) p * aeval (G.adjMatrix ℝ) q).trace / Fintype.card V

variable (G) in
/-- The pair `(r_i, r_(i+1))` of consecutive monic orthogonal polynomials for the spectral
pairing, by the three-term recurrence. -/
def monicOrthogonalPair : ℕ → ℝ[X] × ℝ[X]
  | 0 => (1, Polynomial.X - Polynomial.C (G.spectralPairing Polynomial.X 1 / G.spectralPairing 1 1))
  | i + 1 =>
    let r := monicOrthogonalPair i
    (r.2, (Polynomial.X - Polynomial.C
        (G.spectralPairing (Polynomial.X * r.2) r.2 / G.spectralPairing r.2 r.2)) * r.2 -
      Polynomial.C (G.spectralPairing r.2 r.2 / G.spectralPairing r.1 r.1) * r.1)

variable (G) in
/-- The **predistance polynomial** `p_i`, the multiple of the monic orthogonal polynomial `r_i`
with `⟨p_i, p_i⟩ = p_i(k)`. -/
def predistancePolynomial (k : ℝ) (i : ℕ) : ℝ[X] :=
  let r := (G.monicOrthogonalPair i).1
  Polynomial.C (r.eval k / G.spectralPairing r r) * r

/-- **The predistance polynomials** (README 5.1). For a connected `k`-regular graph with `D + 1`
distinct eigenvalues and `i, j ≤ D`: `deg p_i = i`, `⟨p_i, p_j⟩ = δ_(ij) p_i(k)` and
`p_i(k) > 0`. -/
theorem predistancePolynomial_spec {k : ℕ} (hc : G.Connected) (hk : G.IsRegularOfDegree k)
    {i j : ℕ} (hi : i < G.adjSpectrum.toFinset.card) (hj : j < G.adjSpectrum.toFinset.card) :
    (G.predistancePolynomial k i).natDegree = i ∧
      G.spectralPairing (G.predistancePolynomial k i) (G.predistancePolynomial k j) =
        (if i = j then (G.predistancePolynomial k i).eval (k : ℝ) else 0) ∧
      0 < (G.predistancePolynomial k i).eval (k : ℝ) := by
  sorry

/-- **The Hoffman polynomial** (README 5.1). `∑_(i ≤ D) p_i(A) = J`. -/
theorem sum_aeval_predistancePolynomial {k : ℕ} (hc : G.Connected)
    (hk : G.IsRegularOfDegree k) :
    ∑ i ∈ range G.adjSpectrum.toFinset.card, aeval (G.adjMatrix ℝ) (G.predistancePolynomial k i) =
      Matrix.of fun _ _ ↦ 1 := by
  sorry

/-- **The spectral excess theorem** (README 5.2). For a connected `k`-regular graph with
`D + 1` distinct eigenvalues, the average number `k̄_D` of vertices at distance `D` from a vertex
is at most `p_D(k)`, with equality exactly when the graph is distance-regular. -/
theorem spectral_excess {k : ℕ} (hc : G.Connected) (hk : G.IsRegularOfDegree k) :
    (#{p : V × V | G.dist p.1 p.2 = G.adjSpectrum.toFinset.card - 1} : ℝ) / Fintype.card V ≤
        (G.predistancePolynomial k (G.adjSpectrum.toFinset.card - 1)).eval (k : ℝ) ∧
      ((#{p : V × V | G.dist p.1 p.2 = G.adjSpectrum.toFinset.card - 1} : ℝ) / Fintype.card V =
          (G.predistancePolynomial k (G.adjSpectrum.toFinset.card - 1)).eval (k : ℝ) ↔
        IsDistanceRegular G) := by
  sorry

/-- **Predistance polynomials of a distance-regular graph** (README 5.3). `p_i(A) = A_i` for
`i ≤ diam`, with `k = b_0`. -/
theorem IsDistanceRegular.aeval_predistancePolynomial (hG : IsDistanceRegular G) {i : ℕ}
    (hi : i ≤ G.diam) :
    aeval (G.adjMatrix ℝ) (G.predistancePolynomial (G.intersectionB 0) i) =
      G.distAdjMatrix ℝ i := by
  sorry

end SpectralExcess

end SimpleGraph

/-! ## Layer 6: perfect codes and Lloyd's theorem -/

namespace Scheme

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}
  {rel : X → X → Fin (d + 1)} {E : Fin (d + 1) → Matrix X X ℝ}

variable (rel) in
/-- A set `Y` is **`I`-perfect** when every point is in a class of `I` with exactly one point
of `Y`. -/
def IsPerfectSet (I : Finset (Fin (d + 1))) (Y : Finset X) : Prop :=
  ∀ x, ∃! y, y ∈ Y ∧ rel y x ∈ I

/-- **Sphere packing in a scheme** (README 6.1). `|Y| ∑_(i ∈ I) v_i = |X|` for an
`I`-perfect set `Y`. -/
theorem IsPerfectSet.card_mul_sum_valency (h : IsAssocScheme rel) {I : Finset (Fin (d + 1))}
    {Y : Finset X} (hY : IsPerfectSet rel I Y) :
    (#Y : ℝ) * ∑ i ∈ I, valency rel i = Fintype.card X := by
  sorry

/-- **Lloyd's theorem** (README 6.2). If `Y` is `I`-perfect with inner distribution `a`, then
`∑_(i ∈ I) P_(ji) = 0` for every `j ≠ 0` with `(aQ)_j ≠ 0`. -/
theorem IsPerfectSet.sum_eigenmatrix_eq_zero (h : IsAssocScheme rel)
    (hE : IsPrimitiveIdempotents rel E) {I : Finset (Fin (d + 1))} {Y : Finset X}
    (hY : IsPerfectSet rel I Y) {j : Fin (d + 1)} (hj : j ≠ 0)
    (haQ : ∑ i, innerDistribution rel Y i * dualEigenmatrix rel E i j ≠ 0) :
    ∑ i ∈ I, eigenmatrix rel E j i = 0 := by
  sorry

end Scheme

/-- **Lloyd's theorem for Hamming codes** (README 6.3). For a perfect code of radius `t` in
`H(n, q)`, `q ≥ 2`, and `1 ≤ j ≤ n` with nonzero Krawtchouk transform
`∑_i A_i K_j(i) ≠ 0` of its distance distribution, the Lloyd polynomial `∑_(i ≤ t) K_i`
vanishes at `j`. -/
theorem sum_krawtchouk_eq_zero_of_isPerfect {ι α : Type*} [Fintype ι] [Fintype α]
    [DecidableEq α] [Nontrivial α] {C : Finset (ι → α)} {t : ℕ}
    (hC : BoundsOnCodes.IsPerfect (C : Set (ι → α)) t) {j : ℕ} (hj : 1 ≤ j)
    (hjn : j ≤ Fintype.card ι)
    (htr : ∑ i ∈ range (Fintype.card ι + 1), (BoundsOnCodes.distanceDistribution C i : ℤ) *
      TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) j i ≠ 0) :
    ∑ i ∈ range (t + 1), TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) i j = 0 := by
  sorry

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- A set `C` of vertices is an **`e`-perfect code** when every vertex is within extended
distance `e` of exactly one element of `C`. -/
def IsPerfectCode (e : ℕ) (C : Finset V) : Prop :=
  ∀ x, ∃! c, c ∈ C ∧ G.edist c x ≤ e

variable {G}

/-- **Perfect codes in distance-regular graphs** (README 6.1). In a distance-regular graph an
`e`-perfect code is a `{0, …, e}`-perfect set of the distance scheme, and
`|C| ∑_(i ≤ e) k_i = |V|`. -/
theorem IsDistanceRegular.isPerfectCode_iff (hG : IsDistanceRegular G) {e : ℕ} {C : Finset V} :
    (G.IsPerfectCode e C ↔ Scheme.IsPerfectSet (distRel G) {i | (i : ℕ) ≤ e} C) ∧
      (G.IsPerfectCode e C → #C * ∑ i ∈ range (e + 1), G.sphereCount i = Fintype.card V) := by
  sorry

/-! ## Layer 7: Moore graphs and the bipartite Moore bound -/

/-- **Moore graphs are distance-regular** (README 7.1). A connected graph with degrees at most
`k` and `mooreBound k diam` vertices is distance-regular, with `b_0 = k` when `diam ≥ 1`,
`b_i = k − 1` for `1 ≤ i < diam` and `c_i = 1` for `1 ≤ i ≤ diam`. -/
theorem isDistanceRegular_of_card_eq_mooreBound {k : ℕ} (hc : G.Connected)
    (hk : ∀ v, G.degree v ≤ k) (h : Fintype.card V = mooreBound k G.diam) :
    IsDistanceRegular G ∧ (1 ≤ G.diam → G.intersectionB 0 = k) ∧
      (∀ i, 1 ≤ i → i < G.diam → G.intersectionB i = k - 1) ∧
      ∀ i, 1 ≤ i → i ≤ G.diam → G.intersectionC i = 1 := by
  sorry

/-- The bipartite Moore number `2 ∑_(i < m) (k − 1)^i`, with natural-number subtraction. -/
def bipartiteMooreBound (k m : ℕ) : ℕ := 2 * ∑ i ∈ range m, (k - 1) ^ i

/-- **The bipartite Moore bound** (README 7.2). A nonempty graph with degrees at least
`k ≥ 1` and extended girth at least `2t` has at least `2 ∑_(i < t) (k − 1)^i` vertices. -/
theorem bipartiteMooreBound_le_card [Nonempty V] {k t : ℕ} (hk : 1 ≤ k)
    (hdeg : ∀ v, k ≤ G.degree v) (hg : ((2 * t : ℕ) : ℕ∞) ≤ G.egirth) :
    bipartiteMooreBound k t ≤ Fintype.card V := by
  sorry

/-! ## Layer 8: generalized polygons and symmetric designs -/

variable (G) in
/-- A **generalized `m`-gon**, as a bipartite graph: connected, `2`-colourable, of diameter `m`
and extended girth `2m`, with `m ≥ 2`. -/
structure IsGeneralizedPolygon (m : ℕ) : Prop where
  two_le : 2 ≤ m
  connected : G.Connected
  colorable : G.Colorable 2
  diam_eq : G.diam = m
  egirth_eq : G.egirth = (2 * m : ℕ)

variable (G) in
/-- A graph is **thick** when every vertex has degree at least `3`. -/
def IsThick : Prop := ∀ v, 3 ≤ G.degree v

variable (G) in
/-- A colouring has **order `(s, t)`** when lines (colour `true`) have degree `s + 1` and points
(colour `false`) have degree `t + 1`. -/
def HasOrder (c : G.Coloring Bool) (s t : ℕ) : Prop :=
  ∀ v, G.degree v = if c v then s + 1 else t + 1

variable (G) in
/-- The **point graph** (`b = false`) or **line graph** (`b = true`): the vertices of one colour,
adjacent when at distance `2`. -/
def pointGraph (c : G.Coloring Bool) (b : Bool) : _root_.SimpleGraph {v // c v = b} :=
  _root_.SimpleGraph.fromRel fun x y ↦ G.dist x y = 2

/-- Adjacency in a point graph is decidable. -/
instance instDecidableRelPointGraph (c : G.Coloring Bool) (b : Bool) :
    DecidableRel (G.pointGraph c b).Adj :=
  fun x y ↦ inferInstanceAs (Decidable (x ≠ y ∧ (G.dist x y = 2 ∨ G.dist y x = 2)))

/-- **The even equality case of the bipartite Moore bound** (README 7.3). A nonempty
`k`-regular graph, `k ≥ 3`, of extended girth `2m` with `bipartiteMooreBound k m` vertices is a
generalized `m`-gon, and `m ∈ {2, 3, 4, 6}`. -/
theorem isGeneralizedPolygon_of_card_eq [Nonempty V] {k m : ℕ} (hk : G.IsRegularOfDegree k)
    (hk3 : 3 ≤ k) (hg : G.egirth = (2 * m : ℕ)) (h : Fintype.card V = bipartiteMooreBound k m) :
    G.IsGeneralizedPolygon m ∧ m ∈ ({2, 3, 4, 6} : Finset ℕ) := by
  sorry

namespace IsGeneralizedPolygon

variable {m : ℕ}

/-- **Orders** (README 8.1). A thick generalized `m`-gon has an order `(s, t)` for each
colouring, with `s = t` when `m` is odd. -/
theorem exists_hasOrder (hP : G.IsGeneralizedPolygon m) (hT : G.IsThick) (c : G.Coloring Bool) :
    ∃ s t, G.HasOrder c s t ∧ (Odd m → s = t) := by
  sorry

/-- **Point graphs are distance-regular** (README 8.2). For a thick generalized `m`-gon, the
point graph and the line graph are distance-regular of diameter `⌊m/2⌋`. -/
theorem isDistanceRegular_pointGraph (hP : G.IsGeneralizedPolygon m) (hT : G.IsThick)
    (c : G.Coloring Bool) (b : Bool) :
    IsDistanceRegular (G.pointGraph c b) ∧ (G.pointGraph c b).diam = m / 2 := by
  sorry

/-- **Generalized polygons of order `(s, s)` are distance-regular** (README 8.2). -/
theorem isDistanceRegular (hP : G.IsGeneralizedPolygon m) {c : G.Coloring Bool} {s : ℕ}
    (hc : G.HasOrder c s s) : IsDistanceRegular G := by
  sorry

/-- **The Feit–Higman theorem** (README 8.3). A generalized `m`-gon of order `(s, t)` with
`s, t > 1` has `m ∈ {2, 3, 4, 6, 8}`; for `m = 6` the product `st` is a square, and for `m = 8`
the number `2st` is a square. -/
theorem feit_higman (hP : G.IsGeneralizedPolygon m) {c : G.Coloring Bool} {s t : ℕ}
    (hc : G.HasOrder c s t) (hs : 1 < s) (ht : 1 < t) :
    m ∈ ({2, 3, 4, 6, 8} : Finset ℕ) ∧ (m = 6 → IsSquare (s * t)) ∧
      (m = 8 → IsSquare (2 * s * t)) := by
  sorry

/-- **Generalized quadrangles** (README 8.4). The point graph of a generalized quadrangle of
order `(s, t)`, `s, t ≥ 1`, is strongly regular with parameters
`((s + 1)(st + 1), s(t + 1), s − 1, t + 1)`. -/
theorem isSRGWith_pointGraph (hP : G.IsGeneralizedPolygon 4) {c : G.Coloring Bool} {s t : ℕ}
    (hc : G.HasOrder c s t) (hs : 1 ≤ s) (ht : 1 ≤ t) :
    (G.pointGraph c false).IsSRGWith ((s + 1) * (s * t + 1)) (s * (t + 1)) (s - 1) (t + 1) := by
  sorry

/-- **The spectrum of a generalized quadrangle** (README 8.4). For order `(s, t)`,
`s, t ≥ 1`: `s + t` divides `st(s + 1)(t + 1)` and `s²(st + 1)`, and the point graph has
spectrum `s(t + 1)` once, `s − 1` with multiplicity `st(s + 1)(t + 1)/(s + t)` and `−t − 1` with
multiplicity `s²(st + 1)/(s + t)`. -/
theorem adjSpectrum_pointGraph (hP : G.IsGeneralizedPolygon 4) {c : G.Coloring Bool} {s t : ℕ}
    (hc : G.HasOrder c s t) (hs : 1 ≤ s) (ht : 1 ≤ t) :
    (s + t) ∣ s * t * (s + 1) * (t + 1) ∧ (s + t) ∣ s ^ 2 * (s * t + 1) ∧
      (G.pointGraph c false).adjSpectrum = ((s : ℝ) * (t + 1)) ::ₘ
        (Multiset.replicate (s * t * (s + 1) * (t + 1) / (s + t)) ((s : ℝ) - 1) +
          Multiset.replicate (s ^ 2 * (s * t + 1) / (s + t)) (-(t : ℝ) - 1)) := by
  sorry

/-- **Higman's inequality** (README 8.5). A generalized quadrangle of order `(s, t)` with
`s, t > 1` has `t ≤ s²` and `s ≤ t²`. -/
theorem higman (hP : G.IsGeneralizedPolygon 4) {c : G.Coloring Bool} {s t : ℕ}
    (hc : G.HasOrder c s t) (hs : 1 < s) (ht : 1 < t) : t ≤ s ^ 2 ∧ s ≤ t ^ 2 := by
  sorry

end IsGeneralizedPolygon

/-- **Bipartite distance-regular graphs of diameter three are symmetric designs** (README 8.6).
For a colouring of a distance-regular graph of diameter `3`, the colour classes with adjacency
as incidence form a symmetric `2`-`(v, b_0, c_2)` design, `v` the number of points. -/
theorem IsDistanceRegular.isSymmetricDesign (hG : IsDistanceRegular G) (hd : G.diam = 3)
    (c : G.Coloring Bool) :
    Design.IsSymmetricDesign (fun (p : {x // c x = false}) (l : {x // c x = true}) ↦ G.Adj p l)
      (Fintype.card {x // c x = false}) (G.intersectionB 0) (G.intersectionC 2) := by
  sorry

end SimpleGraph

/-- **Incidence graphs of symmetric designs** (README 8.6). The incidence graph of a symmetric
`2`-`(v, k, ℓ)` design is distance-regular of diameter `3`, with intersection array
`{k, k − 1, k − ℓ; 1, ℓ, k}`. -/
theorem isDistanceRegular_incidenceGraph {P L : Type*} [Fintype P] [Fintype L] [DecidableEq P]
    [DecidableEq L] {inc : P → L → Prop} [DecidableRel inc] {v k ℓ : ℕ}
    (h : Design.IsSymmetricDesign inc v k ℓ) :
    IsDistanceRegular (Design.incidenceGraph inc) ∧ (Design.incidenceGraph inc).diam = 3 ∧
      (Design.incidenceGraph inc).intersectionB 0 = k ∧
      (Design.incidenceGraph inc).intersectionB 1 = k - 1 ∧
      (Design.incidenceGraph inc).intersectionB 2 = k - ℓ ∧
      (Design.incidenceGraph inc).intersectionC 2 = ℓ ∧
      (Design.incidenceGraph inc).intersectionC 3 = k := by
  sorry

/-! ## Layer 9: cometric and `Q`-polynomial schemes -/

namespace Scheme

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}
  {rel : X → X → Fin (d + 1)} {E : Fin (d + 1) → Matrix X X ℝ}

variable (rel E) in
/-- A scheme is **`Q`-polynomial** for the given order of its idempotents when there are reals
`z_i` and polynomials `q_k` of degree `k` with `Q_(ik) = q_k(z_i)` for all `i`, `k`. -/
def IsQPolynomial : Prop :=
  ∃ z : Fin (d + 1) → ℝ, ∃ q : Fin (d + 1) → ℝ[X], ∀ k, (q k).natDegree = k ∧
    ∀ i, dualEigenmatrix rel E i k = (q k).eval (z i)

/-- **Cometric is `Q`-polynomial** (README 9.1). For a scheme with its primitive idempotents in
a given order, the Krein conditions `q^k_(1j) = 0` for `k > j + 1` and `q^(j+1)_(1j) ≠ 0` for
`j < d` hold exactly when the scheme is `Q`-polynomial for that order. -/
theorem isCometric_iff_isQPolynomial (h : IsAssocScheme rel) (hE : IsPrimitiveIdempotents rel E) :
    DelsarteTheoryOfCodesAndDesigns.IsCometric rel E ↔ IsQPolynomial rel E := by
  sorry

end Scheme

/-! ## Library declarations consumed -/

-- Mathlib
#check @SimpleGraph.dist
#check @SimpleGraph.edist
#check @SimpleGraph.diam
#check @SimpleGraph.egirth
#check @SimpleGraph.Colorable
#check @SimpleGraph.Coloring
#check @SimpleGraph.IsRegularOfDegree
#check @SimpleGraph.IsSRGWith
#check @SimpleGraph.IsSRGWith.ediam_eq_two
#check @SimpleGraph.cycleGraph
#check @SimpleGraph.IsCycles
#check @SimpleGraph.IsCycles.exists_cycle_toSubgraph_verts_eq_connectedComponentSupp
#check @SimpleGraph.fromRel
#check @CompleteOrthogonalIdempotents
#check @Matrix.hadamard
#check @Matrix.rank
#check @Matrix.rank_mul_le_left
#check @Matrix.rank_mul_le_right
#check @Matrix.charpoly
#check @Polynomial.aeval
#check @Polynomial.eval
#check @Polynomial.natDegree
#check @niven

-- Tau Ceti
#check @TauCeti.krawtchouk

end TauCetiRoadmap.DistanceRegularGraphsCodesAndPolygons
