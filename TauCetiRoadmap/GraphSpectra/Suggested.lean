module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.CourantFischer
public import TauCeti.Analysis.Matrix.Eigenvalues.Basic
public import TauCeti.Analysis.Matrix.Spectrum
public import TauCeti.LinearAlgebra.Matrix.PerronFrobenius.Irreducible

/-!
# Graph spectra: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (forms of a
headline, defining lemmas, lemmas on a proof route and corollaries) are stated there in prose
with their locators or proof routes, and are not stated here.

Conventions (README, Conventions): all three enumerations are Mathlib's `eigenvalues₀`, indexed
by `i : Fin (Fintype.card V)` in nonincreasing order, so that index `0` carries the largest
eigenvalue. `adjEigenvalues G i` is `θ_{i+1}`, `lapEigenvalues G i` is `ν_{i+1}` and
`signlessLapEigenvalues G i` is `q_{i+1}`. On a nonempty vertex type the index `θ₁` is
`largestEigenvalue G` and `θₙ` is `smallestEigenvalue G`; the algebraic connectivity `ν_{n-1}` is
`algebraicConnectivity G`. Quadratic forms are written with `dotProduct` and `mulVec`; edge sums
run over `G.edgeFinset` through `Sym2.lift`.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues and the largest
and smallest eigenvalue of SpectralGraphBounds 1.1, the sorted Laplacian eigenvalues and the
algebraic connectivity of LaplacianEigenvaluesOfGraphs 1.1, and the Kneser graph of
TopologicalCombinatorics 3.1.
-/

@[expose] public section

noncomputable section

open SimpleGraph Matrix Polynomial Module

namespace TauCetiRoadmap.GraphSpectra

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

/-! ## Local copy: LaplacianEigenvaluesOfGraphs, 1.1 -/

namespace LaplacianEigenvaluesOfGraphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one and index `n - 1` the smallest. -/
def lapEigenvalues (G : _root_.SimpleGraph V) [DecidableRel G.Adj] :
    Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_lapMatrix ℝ).eigenvalues₀

/-- 1.1 The algebraic connectivity: the second smallest Laplacian eigenvalue, at index `n - 2`,
and `0` when `n ≤ 1`. -/
def algebraicConnectivity (G : _root_.SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  if h : 2 ≤ Fintype.card V then lapEigenvalues G ⟨Fintype.card V - 2, by omega⟩ else 0

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

open TauCetiRoadmap.GraphSpectra SpectralGraphBounds LaplacianEigenvaluesOfGraphs
  TopologicalCombinatorics

/-! ## Layer 1: vocabulary and basic API -/

namespace SimpleGraph

/-! ### Definitions -/

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

/-- The unsigned incidence matrix with columns indexed by the edges: Mathlib's `incMatrix`
restricted to `G.edgeSet`. -/
def unsignedIncMatrix (R : Type*) [Zero R] [One R] : Matrix V G.edgeSet R :=
  fun x e ↦ G.incMatrix R x e

end Definitions

/-- The Hamming graph `H(d, |Q|)`: words of length `d` over `Q`, adjacent when they differ in
exactly one coordinate. -/
def hammingGraph (d : ℕ) (Q : Type*) [DecidableEq Q] : _root_.SimpleGraph (Fin d → Q) where
  Adj x y := hammingDist x y = 1
  symm := ⟨fun x y h ↦ by rwa [hammingDist_comm]⟩
  loopless := ⟨fun x h ↦ by simp at h⟩

/-- The `d`-dimensional hypercube `Q_d = H(d, 2)`. -/
abbrev hypercube (d : ℕ) : _root_.SimpleGraph (Fin d → Bool) := hammingGraph d Bool

/-- The Johnson graph `J(|α|, k)`: the `k`-subsets of `α`, adjacent when they meet in `k - 1`
points. Its carrier is that of `TopologicalCombinatorics.kneserGraph α k`. -/
def johnsonGraph (α : Type*) [DecidableEq α] (k : ℕ) :
    _root_.SimpleGraph {s : Finset α | s.card = k} where
  Adj s t := s ≠ t ∧ ((s : Finset α) ∩ t).card + 1 = k
  symm := ⟨fun _ _ h ↦ ⟨h.1.symm, by rw [Finset.inter_comm]; exact h.2⟩⟩
  loopless := ⟨fun _ h ↦ h.1 rfl⟩

/-- The Petersen graph `K(5, 2)`. -/
abbrev petersenGraph : _root_.SimpleGraph {s : Finset (Fin 5) | s.card = 2} :=
  kneserGraph (Fin 5) 2

instance {d : ℕ} {Q : Type*} [DecidableEq Q] : DecidableRel (hammingGraph d Q).Adj :=
  fun _ _ ↦ inferInstanceAs (Decidable (hammingDist _ _ = 1))

instance {α : Type*} [DecidableEq α] {k : ℕ} : DecidableRel (johnsonGraph α k).Adj :=
  fun s t ↦ inferInstanceAs (Decidable (s ≠ t ∧ ((s : Finset α) ∩ t).card + 1 = k))

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

variable {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
  (G : _root_.SimpleGraph V) [DecidableRel G.Adj] (H : _root_.SimpleGraph W) [DecidableRel H.Adj]

section Layer1

/-! ### 1.1 Quadratic forms, edge decompositions and incidence -/

/-- Sanity check of the definition: the diagonal of the signless Laplacian is the degree
sequence. (README 1.1) -/
theorem signlessLapMatrix_apply_self {R : Type*} [AddMonoidWithOne R] (i : V) :
    G.signlessLapMatrix R i i = G.degree i := by
  sorry

/-- Sanity check of the definition: off the diagonal the signless Laplacian agrees with the
adjacency matrix. (README 1.1) -/
theorem signlessLapMatrix_apply_of_ne {R : Type*} [AddMonoidWithOne R] {i j : V} (h : i ≠ j) :
    G.signlessLapMatrix R i j = G.adjMatrix R i j := by
  sorry

/-- Sanity check of the definition: the signless Laplacian is symmetric over any ring.
(README 1.1) -/
theorem isSymm_signlessLapMatrix (R : Type*) [AddMonoidWithOne R] :
    (G.signlessLapMatrix R).IsSymm := by
  sorry

/-- Sanity check of the definition: `Q 𝟙 = 2d`. (README 1.1) -/
theorem signlessLapMatrix_mulVec_one {R : Type*} [NonAssocSemiring R] :
    G.signlessLapMatrix R *ᵥ (fun _ ↦ 1) = fun i ↦ 2 * (G.degree i : R) := by
  sorry

/-- The quadratic form of `A`: `uᵀ A u = 2 ∑_{xy ∈ E} u_x u_y`. (README 1.1) -/
theorem dotProduct_mulVec_adjMatrix_self {R : Type*} [CommRing R] (u : V → R) :
    u ⬝ᵥ (G.adjMatrix R *ᵥ u) =
      2 * ∑ e ∈ G.edgeFinset, Sym2.lift ⟨fun x y ↦ u x * u y, fun _ _ ↦ mul_comm _ _⟩ e := by
  sorry

/-- The quadratic form of `L`: `uᵀ L u = ∑_{xy ∈ E} (u_x - u_y)²`. (README 1.1) -/
theorem dotProduct_mulVec_lapMatrix_self {R : Type*} [CommRing R] (u : V → R) :
    u ⬝ᵥ (G.lapMatrix R *ᵥ u) =
      ∑ e ∈ G.edgeFinset, Sym2.lift ⟨fun x y ↦ (u x - u y) ^ 2, fun _ _ ↦ by ring⟩ e := by
  sorry

/-- The quadratic form of `Q`: `uᵀ Q u = ∑_{xy ∈ E} (u_x + u_y)²`. (README 1.1) -/
theorem dotProduct_mulVec_signlessLapMatrix_self {R : Type*} [CommRing R] (u : V → R) :
    u ⬝ᵥ (G.signlessLapMatrix R *ᵥ u) =
      ∑ e ∈ G.edgeFinset, Sym2.lift ⟨fun x y ↦ (u x + u y) ^ 2, fun _ _ ↦ by ring⟩ e := by
  sorry

/-- The signless Laplacian is positive semidefinite. (README 1.1) -/
theorem posSemidef_signlessLapMatrix : (G.signlessLapMatrix ℝ).PosSemidef := by
  sorry

/-- The Laplacian of a single edge `e = xy`: the matrix `(e_x - e_y)(e_x - e_y)ᵀ`, given by its
entries; the zero matrix for a diagonal `e`. (README 1.1) -/
def edgeLapMatrix (R : Type*) [Ring R] (e : Sym2 V) : Matrix V V R :=
  fun i j ↦ if ¬ e.IsDiag ∧ i ∈ e ∧ j ∈ e then (if i = j then 1 else -1) else 0

/-- The signless Laplacian of a single edge `e = xy`: the matrix `(e_x + e_y)(e_x + e_y)ᵀ`;
the zero matrix for a diagonal `e`. (README 1.1) -/
def edgeSignlessLapMatrix (R : Type*) [Ring R] (e : Sym2 V) : Matrix V V R :=
  fun i j ↦ if ¬ e.IsDiag ∧ i ∈ e ∧ j ∈ e then 1 else 0

/-- For `x ≠ y`, `edgeLapMatrix R s(x, y)` is the rank-one matrix `bbᵀ` with `b = e_x - e_y`.
(README 1.1) -/
theorem edgeLapMatrix_mk {R : Type*} [CommRing R] {x y : V} (h : x ≠ y) :
    edgeLapMatrix R s(x, y) =
      vecMulVec (Pi.single x 1 - Pi.single y 1) (Pi.single x 1 - Pi.single y 1) := by
  sorry

/-- For `x ≠ y`, `edgeSignlessLapMatrix R s(x, y)` is `bbᵀ` with `b = e_x + e_y`.
(README 1.1) -/
theorem edgeSignlessLapMatrix_mk {R : Type*} [CommRing R] {x y : V} (h : x ≠ y) :
    edgeSignlessLapMatrix R s(x, y) =
      vecMulVec (Pi.single x 1 + Pi.single y 1) (Pi.single x 1 + Pi.single y 1) := by
  sorry

/-- **Edge decomposition of `L`.** `L = ∑_{e ∈ E} L_e`. (README 1.1) -/
theorem lapMatrix_eq_sum_edgeLapMatrix (R : Type*) [CommRing R] :
    G.lapMatrix R = ∑ e ∈ G.edgeFinset, edgeLapMatrix R e := by
  sorry

/-- **Edge decomposition of `Q`.** `Q = ∑_{e ∈ E} Q_e`. (README 1.1) -/
theorem signlessLapMatrix_eq_sum_edgeSignlessLapMatrix (R : Type*) [CommRing R] :
    G.signlessLapMatrix R = ∑ e ∈ G.edgeFinset, edgeSignlessLapMatrix R e := by
  sorry

/-- Each edge term is positive semidefinite. (README 1.1) -/
theorem posSemidef_edgeLapMatrix (e : Sym2 V) :
    (edgeLapMatrix ℝ e).PosSemidef ∧ (edgeSignlessLapMatrix ℝ e).PosSemidef := by
  sorry

/-- **`U Uᵀ = Q`** for the unsigned incidence matrix. (README 1.1) -/
theorem unsignedIncMatrix_mul_transpose (R : Type*) [NonAssocSemiring R] :
    G.unsignedIncMatrix R * (G.unsignedIncMatrix R)ᵀ = G.signlessLapMatrix R := by
  sorry

/-- `Q u = 0` exactly when `u_x + u_y = 0` along every edge. (README 1.1) -/
theorem signlessLapMatrix_mulVec_eq_zero_iff (u : V → ℝ) :
    G.signlessLapMatrix ℝ *ᵥ u = 0 ↔ ∀ ⦃x y⦄, G.Adj x y → u x + u y = 0 := by
  sorry

/-- **The nullity of `Q`** is the number of bipartite components, isolated vertices included.
(README 1.1) -/
theorem finrank_ker_signlessLapMatrix :
    Module.finrank ℝ (LinearMap.ker (toLin' (G.signlessLapMatrix ℝ))) =
      Nat.card {c : G.ConnectedComponent // (G.induce c.supp).IsBipartite} := by
  sorry

/-- **Sign conjugation**: for a proper `2`-colouring `c`, conjugating `L` by the diagonal sign
matrix of `c` gives `Q`. (README 1.1) -/
theorem signDiagonal_mul_lapMatrix_mul_signDiagonal (R : Type*) [CommRing R]
    (c : G.Coloring Bool) :
    diagonal (fun x ↦ if c x then (-1 : R) else 1) * G.lapMatrix R *
      diagonal (fun x ↦ if c x then (-1 : R) else 1) = G.signlessLapMatrix R := by
  sorry

/-! ### 1.2 Eigenvalues, spectra and characteristic polynomials -/

/-- Membership in the adjacency spectrum is membership in the real spectrum of `A`.
(README 1.2) -/
theorem mem_adjSpectrum_iff {θ : ℝ} : θ ∈ G.adjSpectrum ↔ θ ∈ spectrum ℝ (G.adjMatrix ℝ) := by
  sorry

/-- Membership in the Laplacian spectrum is membership in the real spectrum of `L`.
(README 1.2) -/
theorem mem_lapSpectrum_iff {ν : ℝ} : ν ∈ G.lapSpectrum ↔ ν ∈ spectrum ℝ (G.lapMatrix ℝ) := by
  sorry

/-- Membership in the signless Laplacian spectrum. (README 1.2) -/
theorem mem_signlessLapSpectrum_iff {q : ℝ} :
    q ∈ G.signlessLapSpectrum ↔ q ∈ spectrum ℝ (G.signlessLapMatrix ℝ) := by
  sorry

/-- **The characteristic polynomial factors over the spectrum.** (README 1.2) -/
theorem charpoly_adjMatrix_eq_prod :
    (G.adjMatrix ℝ).charpoly = (G.adjSpectrum.map fun θ ↦ X - C θ).prod := by
  sorry

/-- The adjacency spectrum is the multiset of roots of the integer characteristic polynomial.
(README 1.2) -/
theorem adjSpectrum_eq_roots :
    G.adjSpectrum = ((G.adjMatrix ℤ).charpoly.map (Int.castRingHom ℝ)).roots := by
  sorry

/-- Multiplicity in the spectrum is the dimension of the eigenspace. (README 1.2) -/
theorem count_adjSpectrum (θ : ℝ) :
    G.adjSpectrum.count θ = finrank ℝ (Module.End.eigenspace (toLin' (G.adjMatrix ℝ)) θ) := by
  sorry

/-- For a `k`-regular graph, `ν_{i+1} = k - θ_{n-i}` (reversed index) and `q_{i+1} = k + θ_{i+1}`
(same index). (README 1.2) -/
theorem IsRegularOfDegree.lapEigenvalues_eq {k : ℕ} (hG : G.IsRegularOfDegree k)
    (i : Fin (Fintype.card V)) :
    lapEigenvalues G i = k - adjEigenvalues G i.rev ∧
      G.signlessLapEigenvalues i = k + adjEigenvalues G i := by
  sorry

/-- **Derivative of a characteristic polynomial.** For a square matrix over a commutative ring,
`χ_M'` is the sum of the characteristic polynomials of the principal submatrices of order
`n - 1`. (README 1.2) -/
theorem _root_.TauCetiRoadmap.GraphSpectra.Matrix.derivative_charpoly {R : Type*} [CommRing R]
    (M : Matrix V V R) :
    derivative M.charpoly =
      ∑ v : V, (M.submatrix (Subtype.val : {x // x ≠ v} → V) Subtype.val).charpoly := by
  sorry

/-- **Pendant vertex.** If `v` has degree `1` and neighbour `u`,
`χ_G = X χ_{G-v} - χ_{G-u-v}`. (README 1.2) -/
theorem charpoly_adjMatrix_of_leaf (R : Type*) [CommRing R] {u v : V} (huv : G.Adj u v)
    (hv : G.degree v = 1) :
    (G.adjMatrix R).charpoly =
      X * ((G.induce ({v}ᶜ : Set V)).adjMatrix R).charpoly -
        ((G.induce ({u, v}ᶜ : Set V)).adjMatrix R).charpoly := by
  sorry

/-- Sanity check of the definition: the signless Laplacian eigenvalues are nonnegative, by
`Matrix.PosSemidef.eigenvalues₀_nonneg` at `posSemidef_signlessLapMatrix`. (README 1.2) -/
theorem signlessLapEigenvalues_nonneg (i : Fin (Fintype.card V)) :
    0 ≤ G.signlessLapEigenvalues i := by
  sorry

/-! ### 1.3 Trace identities -/

/-- **Triangles.** `∑ θᵢ³ = 6t` with `t` the number of triangles. (README 1.3) -/
theorem sum_cube_adjSpectrum :
    (G.adjSpectrum.map fun θ ↦ θ ^ 3).sum = 6 * ((G.cliqueFinset 3).card : ℝ) := by
  sorry

/-- `∑ νᵢ = ∑ qᵢ = 2m`. (README 1.3) -/
theorem sum_lapSpectrum :
    G.lapSpectrum.sum = 2 * (G.edgeFinset.card : ℝ) ∧
      G.signlessLapSpectrum.sum = 2 * (G.edgeFinset.card : ℝ) := by
  sorry

/-! ### 1.4 Row sums and degrees -/

/-- The Laplacian eigenvalues are bounded by twice the maximum degree: `νᵢ ≤ 2Δ`,
`qᵢ ≤ 2Δ`. (README 1.4) -/
theorem lapEigenvalues_le_two_mul_maxDegree (i : Fin (Fintype.card V)) :
    lapEigenvalues G i ≤ 2 * G.maxDegree ∧ G.signlessLapEigenvalues i ≤ 2 * G.maxDegree := by
  sorry

/-! ### 1.5 The variational formula for the algebraic connectivity -/

/-- **The variational formula for `ν_{n-1}`.** For `n ≥ 2`, the algebraic connectivity is the
least Rayleigh quotient of `L` over nonzero vectors orthogonal to `𝟙`. (README 1.5) -/
theorem isLeast_algebraicConnectivity (h : 2 ≤ Fintype.card V) :
    IsLeast {r | ∃ u : V → ℝ, u ≠ 0 ∧ ∑ x, u x = 0 ∧
        r = u ⬝ᵥ (G.lapMatrix ℝ *ᵥ u) / (u ⬝ᵥ u)}
      (algebraicConnectivity G) := by
  sorry

/-! ### 1.6 Irreducibility -/

/-- **Irreducibility of the adjacency matrix.** On at least two vertices, `A` is irreducible if
and only if `G` is connected. (README 1.6) -/
theorem isIrreducible_adjMatrix_iff [Nontrivial V] :
    (G.adjMatrix ℝ).IsIrreducible ↔ G.Connected := by
  sorry

/-! ### 1.7 Disjoint unions, isomorphisms and components -/

/-- **Spectra of disjoint unions.** (README 1.7) -/
theorem adjSpectrum_sum :
    (G ⊕g H).adjSpectrum = G.adjSpectrum + H.adjSpectrum ∧
      (G ⊕g H).lapSpectrum = G.lapSpectrum + H.lapSpectrum ∧
      (G ⊕g H).signlessLapSpectrum = G.signlessLapSpectrum + H.signlessLapSpectrum := by
  sorry

/-- The characteristic polynomial of a disjoint union is the product, over any commutative
ring. (README 1.7) -/
theorem charpoly_adjMatrix_sum (R : Type*) [CommRing R] :
    ((G ⊕g H).adjMatrix R).charpoly = (G.adjMatrix R).charpoly * (H.adjMatrix R).charpoly := by
  sorry

/-- **Isomorphic graphs have the same spectra.** (README 1.7) -/
theorem Iso.adjSpectrum_eq (e : G ≃g H) :
    G.adjSpectrum = H.adjSpectrum ∧ G.lapSpectrum = H.lapSpectrum ∧
      G.signlessLapSpectrum = H.signlessLapSpectrum := by
  sorry

/-- Isomorphic graphs have the same characteristic polynomial. (README 1.7) -/
theorem Iso.charpoly_adjMatrix_eq (R : Type*) [CommRing R] (e : G ≃g H) :
    (G.adjMatrix R).charpoly = (H.adjMatrix R).charpoly := by
  sorry

open Classical in
/-- **Spectra over components.** Each spectrum is the sum over the connected components
of the spectra of the induced subgraphs. (README 1.7) -/
theorem adjSpectrum_eq_sum_connectedComponent :
    G.adjSpectrum = ∑ c : G.ConnectedComponent, (G.induce c.supp).adjSpectrum ∧
      G.lapSpectrum = ∑ c : G.ConnectedComponent, (G.induce c.supp).lapSpectrum ∧
      G.signlessLapSpectrum = ∑ c : G.ConnectedComponent,
        (G.induce c.supp).signlessLapSpectrum := by
  sorry

end Layer1

end SimpleGraph

/-! ### 1.8 Spectra from spectral decompositions -/

namespace Matrix

/-- **Spectrum from a decomposition into idempotents.** If a Hermitian matrix is `∑ θᵢ Eᵢ` for a
complete system of orthogonal idempotents `Eᵢ`, its eigenvalue multiset is
`∑ replicate (rank Eᵢ) θᵢ`, the rank of each `Eᵢ` is its trace, and for distinct `θᵢ` the
multiplicity of `θᵢ` is `rank Eᵢ`. (README 1.8) -/
theorem map_eigenvalues₀_eq_sum_replicate_rank {𝕜 n ι : Type*} [RCLike 𝕜]
    [Fintype n] [DecidableEq n] [Fintype ι] {M : Matrix n n 𝕜} (hM : M.IsHermitian)
    {θ : ι → ℝ} {E : ι → Matrix n n 𝕜} (hE : CompleteOrthogonalIdempotents E)
    (hME : M = ∑ i, (θ i : 𝕜) • E i) :
    Multiset.map hM.eigenvalues₀ Finset.univ.val =
        ∑ i, Multiset.replicate (E i).rank (θ i) ∧
      (∀ i, ((E i).rank : 𝕜) = (E i).trace) ∧
      (Function.Injective θ → ∀ i,
        (Multiset.map hM.eigenvalues₀ Finset.univ.val).count (θ i) = (E i).rank) := by
  sorry

end Matrix

namespace SimpleGraph

variable {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
  (G : _root_.SimpleGraph V) [DecidableRel G.Adj] (H : _root_.SimpleGraph W) [DecidableRel H.Adj]

/-- **Adjacency spectrum from a spectral decomposition.** If `A = ∑ θᵢ Eᵢ` over `ℝ` or `ℂ` for a
complete system of orthogonal idempotents, then `adjSpectrum = ∑ replicate (rank Eᵢ) θᵢ`, and for
distinct `θᵢ` the multiplicity of `θᵢ` is `rank Eᵢ`. (README 1.8) -/
theorem adjSpectrum_eq_sum_replicate_rank {𝕜 ι : Type*} [RCLike 𝕜] [Fintype ι] {θ : ι → ℝ}
    {E : ι → Matrix V V 𝕜} (hE : CompleteOrthogonalIdempotents E)
    (hAE : G.adjMatrix 𝕜 = ∑ i, (θ i : 𝕜) • E i) :
    G.adjSpectrum = ∑ i, Multiset.replicate (E i).rank (θ i) ∧
      (Function.Injective θ → ∀ i, G.adjSpectrum.count (θ i) = (E i).rank) := by
  sorry

/-! ## Layer 2: standard graphs and line graphs -/

section Layer2

/-! ### 2.1 Complete multipartite graphs -/

/-- Vertices of a complete multipartite graph: a vertex of part `i` has degree `n - |Vᵢ|`.
(README 2.1) -/
theorem degree_completeMultipartiteGraph {ι : Type*} [Fintype ι] [DecidableEq ι]
    (P : ι → Type*) [∀ i, Fintype (P i)] [∀ i, DecidableEq (P i)]
    [DecidableRel (completeMultipartiteGraph P).Adj] (x : Σ i, P i) :
    (completeMultipartiteGraph P).degree x =
      Fintype.card (Σ i, P i) - Fintype.card (P x.1) := by
  sorry

/-! ### 2.2 The Laplacian of the path -/

/-- **The Laplacian spectrum of the path.** `L(Pₙ)` has eigenvalues `2 - 2 cos(πj/n)`,
`j = 0, …, n-1`. (README 2.2) -/
theorem lapSpectrum_pathGraph (n : ℕ) :
    (pathGraph n).lapSpectrum =
        (Multiset.range n).map (fun j : ℕ ↦ 2 - 2 * Real.cos (Real.pi * j / n)) := by
  sorry

/-! ### 2.3 Hamming graphs and the hypercube -/

/-- `H(d, q)` is connected for nonempty `Q`. (README 2.3) -/
theorem hammingGraph_connected (d : ℕ) (Q : Type*) [Nonempty Q] [DecidableEq Q] :
    (hammingGraph d Q).Connected := by
  sorry

/-- `H(d, q)` is regular of degree `d(q - 1)`. (README 2.3) -/
theorem hammingGraph_isRegularOfDegree (d : ℕ) (Q : Type*) [Fintype Q] [DecidableEq Q] :
    (hammingGraph d Q).IsRegularOfDegree (d * (Fintype.card Q - 1)) := by
  sorry

/-- Graph distance in `H(d, q)` is Hamming distance. (README 2.3) -/
theorem hammingGraph_dist {d : ℕ} {Q : Type*} [DecidableEq Q] (x y : Fin d → Q) :
    (hammingGraph d Q).dist x y = hammingDist x y := by
  sorry

/-- `H(d + 1, q) ≅ H(d, q) □ K_q`. (README 2.3) -/
theorem nonempty_iso_hammingGraph_succ (d : ℕ) (Q : Type*) [DecidableEq Q] :
    Nonempty (hammingGraph (d + 1) Q ≃g hammingGraph d Q □ (⊤ : _root_.SimpleGraph Q)) := by
  sorry

/-- The hypercube is bipartite. (README 2.3) -/
theorem hypercube_isBipartite (d : ℕ) : (hypercube d).IsBipartite := by
  sorry

/-! ### 2.4 Johnson, Kneser and Petersen graphs -/

/-- `J(n, k)` is regular of degree `k(n - k)`. (README 2.4) -/
theorem johnsonGraph_isRegularOfDegree (α : Type*) [Fintype α] [DecidableEq α] (k : ℕ) :
    (johnsonGraph α k).IsRegularOfDegree (k * (Fintype.card α - k)) := by
  sorry

/-- Graph distance in `J(n, k)` is `k - |s ∩ t|`. (README 2.4) -/
theorem johnsonGraph_dist {α : Type*} [DecidableEq α] {k : ℕ}
    (s t : {s : Finset α | s.card = k}) :
    (johnsonGraph α k).dist s t = k - ((s : Finset α) ∩ t).card := by
  sorry

/-- `K(n, 2)` is the complement of `J(n, 2)`. (README 2.4) -/
theorem kneserGraph_two_eq_compl (α : Type*) [DecidableEq α] :
    kneserGraph α 2 = (johnsonGraph α 2)ᶜ := by
  sorry

/-- `J(n, 1) ≅ Kₙ`. (README 2.4) -/
theorem nonempty_iso_johnsonGraph_one (α : Type*) [DecidableEq α] :
    Nonempty (johnsonGraph α 1 ≃g (⊤ : _root_.SimpleGraph α)) := by
  sorry

/-- Sanity check of the definition: the Petersen graph has 10 vertices, is 3-regular and has
15 edges. (README 2.4) -/
theorem petersenGraph_card :
    Fintype.card {s : Finset (Fin 5) | s.card = 2} = 10 ∧ petersenGraph.IsRegularOfDegree 3 ∧
      petersenGraph.edgeFinset.card = 15 := by
  sorry

/-! ### 2.5 Line graphs -/

variable [DecidableRel G.lineGraph.Adj]

/-- **`UᵀU = 2I + A_line`** for the unsigned incidence matrix. (README 2.5) -/
theorem transpose_mul_unsignedIncMatrix (R : Type*) [NonAssocSemiring R] :
    (G.unsignedIncMatrix R)ᵀ * G.unsignedIncMatrix R =
      (2 : R) • (1 : Matrix G.edgeSet G.edgeSet R) + G.lineGraph.adjMatrix R := by
  sorry

/-- **Line-graph eigenvalues are at least `-2`.** (README 2.5) -/
theorem neg_two_le_adjEigenvalues_lineGraph (i : Fin (Fintype.card G.edgeSet)) :
    -2 ≤ adjEigenvalues G.lineGraph i := by
  sorry

/-- The line graph of a `k`-regular graph is `(2k - 2)`-regular. (README 2.5) -/
theorem IsRegularOfDegree.lineGraph {k : ℕ} (hG : G.IsRegularOfDegree k) :
    G.lineGraph.IsRegularOfDegree (2 * k - 2) := by
  sorry

/-- **Spectrum of the line graph of a regular graph.** For `k ≥ 2`, the eigenvalues are
`θᵢ + k - 2` and `-2` with multiplicity `kn/2 - n`. (README 2.5) -/
theorem adjSpectrum_lineGraph_of_isRegular {k : ℕ} (hG : G.IsRegularOfDegree k) (hk : 2 ≤ k) :
    G.lineGraph.adjSpectrum = G.adjSpectrum.map (fun θ : ℝ ↦ θ + k - 2) +
      Multiset.replicate (k * Fintype.card V / 2 - Fintype.card V) (-2 : ℝ) := by
  sorry

/-- `J(n, 2)` is the line graph of `Kₙ`. (README 2.5) -/
theorem nonempty_iso_johnsonGraph_two_lineGraph (α : Type*) [DecidableEq α] :
    Nonempty (johnsonGraph α 2 ≃g (⊤ : _root_.SimpleGraph α).lineGraph) := by
  sorry

/-! ### 2.6 Multiset spectra of the standard graphs -/

/-- **The complete graph.** `Kₙ`, `n ≥ 1`, has spectrum `n - 1, (-1)^{n-1}`. (README 2.6) -/
theorem adjSpectrum_top [Nonempty V] :
    (⊤ : _root_.SimpleGraph V).adjSpectrum =
      ((Fintype.card V : ℝ) - 1) ::ₘ Multiset.replicate (Fintype.card V - 1) (-1) := by
  sorry

/-- **The cycle.** For `n ≥ 3`, `Cₙ` has spectrum `2 cos(2πj/n)`, `j = 0, …, n - 1`.
(README 2.6) -/
theorem adjSpectrum_cycleGraph {n : ℕ} (hn : 3 ≤ n) :
    (cycleGraph n).adjSpectrum =
      (Multiset.range n).map (fun j : ℕ ↦ 2 * Real.cos (2 * Real.pi * j / n)) := by
  sorry

/-- **The path.** `Pₙ` has spectrum `2 cos(πj/(n + 1))`, `j = 1, …, n`. (README 2.6) -/
theorem adjSpectrum_pathGraph (n : ℕ) :
    (pathGraph n).adjSpectrum =
      (Multiset.range n).map (fun j : ℕ ↦ 2 * Real.cos (Real.pi * (j + 1) / (n + 1))) := by
  sorry

/-- **The complete bipartite graph.** For `a, b ≥ 1`, `K_{a,b}` has spectrum `±√(ab)` and `0`
with multiplicity `a + b - 2`. (README 2.6) -/
theorem adjSpectrum_completeBipartiteGraph [Nonempty V] [Nonempty W] :
    (completeBipartiteGraph V W).adjSpectrum =
      Real.sqrt (Fintype.card V * Fintype.card W) ::ₘ
        (-Real.sqrt (Fintype.card V * Fintype.card W)) ::ₘ
          Multiset.replicate (Fintype.card V + Fintype.card W - 2) 0 := by
  sorry

/-- **The complete equipartite graph.** For `r, t ≥ 1`, `K_{r × t}` (Mathlib's
`completeEquipartiteGraph r t`, `r` parts of size `t`) has spectrum `t(r - 1)`, `0` with
multiplicity `r(t - 1)` and `-t` with multiplicity `r - 1`. (README 2.6) -/
theorem adjSpectrum_completeEquipartiteGraph {r t : ℕ} (hr : 1 ≤ r) (ht : 1 ≤ t) :
    (completeEquipartiteGraph r t).adjSpectrum =
      ((t : ℝ) * (r - 1)) ::ₘ Multiset.replicate (r * (t - 1)) 0 +
        Multiset.replicate (r - 1) (-(t : ℝ)) := by
  sorry

/-- **The Hamming graph.** For nonempty `Q` with `q` elements, `H(d, q)` has the eigenvalue
`d(q - 1) - qi` with multiplicity `C(d, i)(q - 1)^i`, `i = 0, …, d`. (README 2.6) -/
theorem adjSpectrum_hammingGraph (d : ℕ) (Q : Type*) [Fintype Q] [DecidableEq Q] [Nonempty Q] :
    (hammingGraph d Q).adjSpectrum =
      ∑ i ∈ Finset.range (d + 1), Multiset.replicate (d.choose i * (Fintype.card Q - 1) ^ i)
        ((d : ℝ) * (Fintype.card Q - 1) - Fintype.card Q * i) := by
  sorry

/-- **The Johnson graph.** For `2k ≤ n`, `J(n, k)` has the eigenvalue `(k - j)(n - k - j) - j`
with multiplicity `C(n, j) - C(n, j - 1)`, `j = 0, …, k` (multiplicity `1` at `j = 0`).
(README 2.6) -/
theorem adjSpectrum_johnsonGraph (α : Type*) [Fintype α] [DecidableEq α] {k : ℕ}
    (hk : 2 * k ≤ Fintype.card α) :
    (johnsonGraph α k).adjSpectrum =
      ((k : ℝ) * (Fintype.card α - k)) ::ₘ
        ∑ j ∈ Finset.range k,
          Multiset.replicate ((Fintype.card α).choose (j + 1) - (Fintype.card α).choose j)
            (((k : ℝ) - (j + 1)) * (Fintype.card α - k - (j + 1)) - (j + 1)) := by
  sorry

/-- **The Kneser graph.** For `1 ≤ k` and `2k ≤ n`, `K(n, k)` has the eigenvalue
`(-1)^j C(n - k - j, k - j)` with multiplicity `C(n, j) - C(n, j - 1)`, `j = 0, …, k`
(multiplicity `1` at `j = 0`). (README 2.6) -/
theorem adjSpectrum_kneserGraph (α : Type*) [Fintype α] [DecidableEq α] {k : ℕ} (hk : 1 ≤ k)
    (hkn : 2 * k ≤ Fintype.card α) :
    (kneserGraph α k).adjSpectrum =
      (((Fintype.card α - k).choose k : ℕ) : ℝ) ::ₘ
        ∑ j ∈ Finset.range k,
          Multiset.replicate ((Fintype.card α).choose (j + 1) - (Fintype.card α).choose j)
            ((-1) ^ (j + 1) * ((Fintype.card α - k - (j + 1)).choose (k - (j + 1)) : ℕ)) := by
  sorry

/-- **Hypercubes**, a special case of `adjSpectrum_hammingGraph` at `Q = Bool`, named because
other roadmaps cite it: `Q_d` has the eigenvalue `d - 2i` with multiplicity `C(d, i)`.
(README 2.6) -/
theorem adjSpectrum_hypercube (d : ℕ) :
    (hypercube d).adjSpectrum =
      ∑ i ∈ Finset.range (d + 1), Multiset.replicate (d.choose i) ((d : ℝ) - 2 * i) := by
  sorry

/-- **The Petersen graph**, a special case of `adjSpectrum_kneserGraph` at `(5, 2)`, named
because other roadmaps cite it: its spectrum is `3, 1⁵, (-2)⁴`. (README 2.6) -/
theorem adjSpectrum_petersenGraph :
    petersenGraph.adjSpectrum =
      (3 : ℝ) ::ₘ Multiset.replicate 5 1 + Multiset.replicate 4 (-2) := by
  sorry

end Layer2

/-! ## Layer 3: Perron–Frobenius and the index -/

section Layer3

/-! ### 3.1 Distinct eigenvalues -/

/-- **Diameter bound.** A connected graph of diameter `d` has at least `d + 1` distinct
eigenvalues of `A`, of `L` and of `Q`. (README 3.1) -/
theorem diam_add_one_le_card_adjSpectrum (hG : G.Connected) :
    G.diam + 1 ≤ G.adjSpectrum.toFinset.card ∧ G.diam + 1 ≤ G.lapSpectrum.toFinset.card ∧
      G.diam + 1 ≤ G.signlessLapSpectrum.toFinset.card := by
  sorry

/-- **One distinct eigenvalue.** On a nonempty vertex type, `L` or `Q` has exactly one
distinct eigenvalue if and only if `G` has no edges. (README 3.1) -/
theorem card_lapSpectrum_toFinset_eq_one_iff [Nonempty V] :
    (G.lapSpectrum.toFinset.card = 1 ↔ G = ⊥) ∧
      (G.signlessLapSpectrum.toFinset.card = 1 ↔ G = ⊥) := by
  sorry

/-- **Two distinct eigenvalues.** A connected graph with exactly two distinct eigenvalues of `A`,
of `L` or of `Q` is complete. (README 3.1) -/
theorem Connected.eq_top_of_card_adjSpectrum_toFinset_eq_two (hG : G.Connected) :
    (G.adjSpectrum.toFinset.card = 2 → G = ⊤) ∧ (G.lapSpectrum.toFinset.card = 2 → G = ⊤) ∧
      (G.signlessLapSpectrum.toFinset.card = 2 → G = ⊤) := by
  sorry

/-! ### 3.2 Perron–Frobenius for graphs -/

/-- **Perron–Frobenius for connected graphs.** `θ₁` is simple and has a positive
eigenvector. (README 3.2) -/
theorem Connected.perronFrobenius [Nonempty V] (hG : G.Connected) :
    G.adjSpectrum.count (largestEigenvalue G) = 1 ∧
      ∃ v : V → ℝ, (∀ x, 0 < v x) ∧
        G.adjMatrix ℝ *ᵥ v = largestEigenvalue G • v := by
  sorry

/-- A nonzero nonnegative eigenvector of a connected graph belongs to `θ₁` and is positive.
(README 3.2) -/
theorem Connected.eigenvalue_eq_of_nonneg [Nonempty V] (hG : G.Connected) {v : V → ℝ}
    {θ : ℝ} (hv : 0 ≤ v) (hv0 : v ≠ 0) (h : G.adjMatrix ℝ *ᵥ v = θ • v) :
    θ = largestEigenvalue G ∧ ∀ x, 0 < v x := by
  sorry

/-- The index of a `k`-regular graph is `k`. (README 3.2) -/
theorem IsRegularOfDegree.largestEigenvalue_eq [Nonempty V] {k : ℕ} (hG : G.IsRegularOfDegree k) :
    largestEigenvalue G = k := by
  sorry

/-! ### 3.3 Degree bounds for connected graphs -/

/-- For a connected graph, `θ₁ = k_max` exactly when `G` is regular, and otherwise
`k_min < k̄ < θ₁ < k_max`. (README 3.3) -/
theorem Connected.largestEigenvalue_lt_maxDegree [Nonempty V] (hG : G.Connected) :
    (largestEigenvalue G = G.maxDegree ↔ ∃ k, G.IsRegularOfDegree k) ∧
      ((¬ ∃ k, G.IsRegularOfDegree k) →
        (G.minDegree : ℝ) < 2 * G.edgeFinset.card / Fintype.card V ∧
        2 * (G.edgeFinset.card : ℝ) / Fintype.card V < largestEigenvalue G ∧
        largestEigenvalue G < G.maxDegree) := by
  sorry

/-! ### 3.4 Monotonicity and extremes of the index -/

/-- **Monotonicity of the index.** A copy of `H` in `G` has index at most that of `G`; if
`G` is connected and the copy misses a vertex or an edge, the inequality is strict.
(README 3.4) -/
theorem Copy.largestEigenvalue_le [Nonempty V] [Nonempty W] (f : Copy H G) :
    largestEigenvalue H ≤ largestEigenvalue G ∧
      (G.Connected → (Fintype.card W < Fintype.card V ∨
          H.edgeFinset.card < G.edgeFinset.card) →
        largestEigenvalue H < largestEigenvalue G) := by
  sorry

/-- **Spanning subgraphs, weak form.** On a nonempty vertex type, if `H ≤ G` then
`χ_H(x) ≥ χ_G(x)` for every real `x ≥ θ₁(G)`. (README 3.4) -/
theorem eval_charpoly_adjMatrix_le [Nonempty V] {H : _root_.SimpleGraph V} [DecidableRel H.Adj]
    (hHG : H ≤ G) {x : ℝ} (hx : largestEigenvalue G ≤ x) :
    (G.adjMatrix ℝ).charpoly.eval x ≤ (H.adjMatrix ℝ).charpoly.eval x := by
  sorry

/-- **Spanning subgraphs, strict form.** If `G` is connected and `H < G` is a proper spanning
subgraph, then `χ_H(x) > χ_G(x)` for every real `x ≥ θ₁(G)`. (README 3.4) -/
theorem Connected.eval_charpoly_adjMatrix_lt [Nonempty V] (hG : G.Connected)
    {H : _root_.SimpleGraph V} [DecidableRel H.Adj] (hHG : H < G) {x : ℝ}
    (hx : largestEigenvalue G ≤ x) :
    (G.adjMatrix ℝ).charpoly.eval x < (H.adjMatrix ℝ).charpoly.eval x := by
  sorry

/-- **Extremes of the index.** A connected graph on `n` vertices has
`2 cos(π/(n+1)) ≤ θ₁ ≤ n - 1`, with equality on the left only for `Pₙ` and on the right only
for `Kₙ`. (README 3.4) -/
theorem Connected.largestEigenvalue_bounds [Nonempty V] (hG : G.Connected) :
    2 * Real.cos (Real.pi / (Fintype.card V + 1)) ≤ largestEigenvalue G ∧
      largestEigenvalue G ≤ Fintype.card V - 1 ∧
      (largestEigenvalue G = 2 * Real.cos (Real.pi / (Fintype.card V + 1)) ↔
        Nonempty (G ≃g pathGraph (Fintype.card V))) ∧
      (largestEigenvalue G = Fintype.card V - 1 ↔ G = ⊤) := by
  sorry

/-- **Trees.** A tree on `n` vertices has `θ₁ ≤ √(n-1)`, with equality only for the star
`K_{1,n-1}`. (README 3.4) -/
theorem IsTree.largestEigenvalue_le [Nonempty V] (hG : G.IsTree) :
    largestEigenvalue G ≤ √(Fintype.card V - 1) ∧
      (largestEigenvalue G = √(Fintype.card V - 1) ↔
        Nonempty (G ≃g completeBipartiteGraph Unit (Fin (Fintype.card V - 1)))) := by
  sorry

/-- **Trees: the lower bound.** A tree on `n` vertices has `2 cos(π/(n+1)) ≤ θ₁`, with
equality only for the path `Pₙ`. (README 3.4) -/
theorem IsTree.le_largestEigenvalue [Nonempty V] (hG : G.IsTree) :
    2 * Real.cos (Real.pi / (Fintype.card V + 1)) ≤ largestEigenvalue G ∧
      (largestEigenvalue G = 2 * Real.cos (Real.pi / (Fintype.card V + 1)) ↔
        Nonempty (G ≃g pathGraph (Fintype.card V))) := by
  sorry

/-! ### 3.5 Index, edges and cliques -/

/-- **The Motzkin–Straus inequality.** With `ω` the clique number, every nonnegative `v` has
`vᵀ A v ≤ (1 - 1/ω) (∑ v)²`, and equality holds for some nonnegative `v` with `∑ v = 1`.
(README 3.5) -/
theorem dotProduct_mulVec_adjMatrix_le_cliqueNum [Nonempty V] :
    (∀ v : V → ℝ, 0 ≤ v →
      v ⬝ᵥ (G.adjMatrix ℝ *ᵥ v) ≤ (1 - 1 / (G.cliqueNum : ℝ)) * (∑ x, v x) ^ 2) ∧
    ∃ v : V → ℝ, 0 ≤ v ∧ ∑ x, v x = 1 ∧
      v ⬝ᵥ (G.adjMatrix ℝ *ᵥ v) = 1 - 1 / (G.cliqueNum : ℝ) := by
  sorry

/-- **Stanley's bound.** `θ₁ ≤ (√(8m+1) - 1)/2`, with equality exactly for a complete
graph together with isolated vertices. (README 3.5) -/
theorem largestEigenvalue_le_stanley [Nonempty V] :
    largestEigenvalue G ≤ (√(8 * G.edgeFinset.card + 1) - 1) / 2 ∧
      (largestEigenvalue G = (√(8 * G.edgeFinset.card + 1) - 1) / 2 ↔
        ∃ s : Finset V, ∀ x y, G.Adj x y ↔ x ≠ y ∧ x ∈ s ∧ y ∈ s) := by
  sorry

/-- **Hong's bound.** A connected graph has `θ₁ ≤ √(2m - n + 1)`, with equality exactly
for `K_{1,n-1}` and `Kₙ`. (README 3.5) -/
theorem Connected.largestEigenvalue_le_hong [Nonempty V] (hG : G.Connected) :
    largestEigenvalue G ≤
        √(2 * G.edgeFinset.card - Fintype.card V + 1) ∧
      (largestEigenvalue G = √(2 * G.edgeFinset.card - Fintype.card V + 1) ↔
        Nonempty (G ≃g completeBipartiteGraph Unit (Fin (Fintype.card V - 1))) ∨ G = ⊤) := by
  sorry

/-- **Wilf's and Nikiforov's bounds.** With `ω` the clique number,
`θ₁ ≤ (1 - 1/ω) n` and `θ₁² ≤ 2 (1 - 1/ω) m`. (README 3.5) -/
theorem largestEigenvalue_le_cliqueNum [Nonempty V] :
    largestEigenvalue G ≤ (1 - 1 / (G.cliqueNum : ℝ)) * Fintype.card V ∧
      largestEigenvalue G ^ 2 ≤
        2 * (1 - 1 / (G.cliqueNum : ℝ)) * G.edgeFinset.card := by
  sorry

/-- **Nosal's bound.** A triangle-free graph has `θ₁ ≤ √m`. (README 3.5) -/
theorem CliqueFree.largestEigenvalue_le_sqrt [Nonempty V] (hG : G.CliqueFree 3) :
    largestEigenvalue G ≤ √(G.edgeFinset.card) := by
  sorry

/-- **Hofmeister's bound.** `θ₁ ≥ √(∑ d(x)² / n)`. (README 3.5) -/
theorem sqrt_sum_sq_degree_le_largestEigenvalue [Nonempty V] :
    √((∑ x, (G.degree x : ℝ) ^ 2) / Fintype.card V) ≤ largestEigenvalue G := by
  sorry

/-! ### 3.6 Regularity -/

/-- **Hoffman's criterion.** A connected graph is regular exactly when `J` is a polynomial
in `A`. (README 3.6) -/
theorem Connected.isRegular_iff_exists_aeval_eq_of_one (hG : G.Connected) :
    (∃ k, G.IsRegularOfDegree k) ↔
      ∃ p : ℝ[X], aeval (G.adjMatrix ℝ) p = Matrix.of fun _ _ ↦ (1 : ℝ) := by
  sorry

open Classical in
/-- **The Hoffman polynomial.** For a connected `k`-regular graph,
`J = n ∏_{θ ≠ k} (A - θI)/(k - θ)` over the distinct eigenvalues other than `k`. (README 3.6) -/
theorem Connected.ones_eq_aeval_hoffmanPolynomial (hG : G.Connected) {k : ℕ}
    (hk : G.IsRegularOfDegree k) :
    (Matrix.of fun _ _ ↦ (1 : ℝ)) = (Fintype.card V : ℝ) • aeval (G.adjMatrix ℝ)
      (∏ θ ∈ G.adjSpectrum.toFinset.erase (k : ℝ), C ((k : ℝ) - θ)⁻¹ * (X - C θ)) := by
  sorry

/-! ### 3.7 Bipartiteness of regular graphs -/

/-- **Connected regular bipartite graphs.** A connected `k`-regular graph is bipartite exactly
when `θₙ = -k`. (README 3.7) -/
theorem Connected.isBipartite_iff_smallestEigenvalue_eq [Nonempty V] (hG : G.Connected) {k : ℕ}
    (hk : G.IsRegularOfDegree k) :
    G.IsBipartite ↔
      smallestEigenvalue G = -k := by
  sorry

/-! ### 3.8 The complement -/

/-- The Laplacian of the complement is `nI - J - L`. (README 3.8) -/
theorem lapMatrix_compl (R : Type*) [CommRing R] :
    Gᶜ.lapMatrix R = (Fintype.card V : R) • (1 : Matrix V V R) - Matrix.of (fun _ _ ↦ 1) -
      G.lapMatrix R := by
  sorry

/-- **Adjacency spectrum of the complement of a regular graph.**
`n - k - 1, -1 - θₙ, …, -1 - θ₂`. (README 3.8) -/
theorem IsRegularOfDegree.adjSpectrum_compl [Nonempty V] {k : ℕ} (hG : G.IsRegularOfDegree k) :
    Gᶜ.adjSpectrum = ((Fintype.card V : ℝ) - k - 1) ::ₘ
      (G.adjSpectrum.erase k).map (fun θ ↦ -1 - θ) := by
  sorry

/-! ### 3.9 Main eigenvalues -/

/-- The eigenspace of `A` for `θ`, in Euclidean space. (README 3.9) -/
def adjEigenspace (θ : ℝ) : Submodule ℝ (EuclideanSpace ℝ V) :=
  Module.End.eigenspace (toEuclideanLin (G.adjMatrix ℝ)) θ

/-- The matrix of the orthogonal projection `P_θ` onto the `θ`-eigenspace of the real adjacency
matrix (the zero matrix when `θ` is not an eigenvalue), written through Mathlib's orthonormal
eigenvector basis. (README 3.9) -/
def adjEigenspaceProjection (θ : ℝ) : Matrix V V ℝ :=
  fun x y ↦ ∑ i ∈ Finset.univ.filter (fun i ↦ (G.isHermitian_adjMatrix ℝ).eigenvalues i = θ),
    (G.isHermitian_adjMatrix ℝ).eigenvectorBasis i x *
      (G.isHermitian_adjMatrix ℝ).eigenvectorBasis i y

/-- The all-ones vector of Euclidean space. (README 3.9) -/
def onesVec : EuclideanSpace ℝ V := WithLp.toLp 2 fun _ ↦ 1

/-- `θ` is a **main eigenvalue** when its eigenspace is not orthogonal to `𝟙`. (README 3.9) -/
def IsMainEigenvalue (θ : ℝ) : Prop :=
  ∃ v ∈ G.adjEigenspace θ, inner ℝ v onesVec ≠ (0 : ℝ)

/-- The **main angle** `β_θ = ‖P_θ 𝟙‖ / √n`. (README 3.9) -/
def mainAngle (θ : ℝ) : ℝ :=
  ‖(G.adjEigenspace θ).starProjection onesVec‖ / √(Fintype.card V)

/-- The number `N_h = 𝟙ᵀ Aʰ 𝟙` of walks of length `h`. (README 3.9) -/
def walkCount (h : ℕ) : ℕ := ∑ x, ∑ y, (G.finsetWalkLength h x y).card

/-- **The eigenspace projection.** `adjEigenspaceProjection θ` is the matrix of the orthogonal
projection onto `adjEigenspace θ`; in particular it does not depend on the eigenvector basis.
(README 3.9) -/
theorem toEuclideanLin_adjEigenspaceProjection (θ : ℝ) :
    toEuclideanLin (G.adjEigenspaceProjection θ) =
      ((G.adjEigenspace θ).starProjection : EuclideanSpace ℝ V →ₗ[ℝ] EuclideanSpace ℝ V) := by
  sorry

/-- **Walk counts from main angles.** `N_h = n ∑_θ β_θ² θʰ`, the sum over the distinct
eigenvalues (only main ones contribute). (README 3.9) -/
theorem walkCount_eq_sum_mainAngle (h : ℕ) :
    (G.walkCount h : ℝ) =
      Fintype.card V * ∑ θ ∈ G.adjSpectrum.toFinset, G.mainAngle θ ^ 2 * θ ^ h := by
  sorry

open Classical in
/-- **Regularity and main eigenvalues.** A graph on a nonempty vertex type is regular exactly
when it has exactly one main eigenvalue, and the number of main eigenvalues is at most the number
of orbits of the automorphism group. (README 3.9) -/
theorem card_mainEigenvalue [Nonempty V] :
    ((G.adjSpectrum.toFinset.filter G.IsMainEigenvalue).card = 1 ↔ ∃ k, G.IsRegularOfDegree k) ∧
      (G.adjSpectrum.toFinset.filter G.IsMainEigenvalue).card ≤
        Nat.card (Quot fun x y : V ↦ ∃ σ : G ≃g G, σ x = y) := by
  sorry

end Layer3

end SimpleGraph

end TauCetiRoadmap.GraphSpectra

/-! ## Library declarations consumed

Pinned library declarations named in the supplier contracts of `README.md`. -/

-- Mathlib
#check @SimpleGraph.lapMatrix_toLinearMap₂'
#check @SimpleGraph.adjMatrix
#check @SimpleGraph.degMatrix
#check @SimpleGraph.lapMatrix
#check @SimpleGraph.incMatrix
#check @SimpleGraph.sum
#check @SimpleGraph.ConnectedComponent
#check @SimpleGraph.IsTree
#check @SimpleGraph.CliqueFree
#check @Matrix.IsIrreducible
#check @Matrix.PosSemidef
#check @Matrix.toEuclideanLin
#check @Multiset.count
#check @Int.castRingHom
#check @SimpleGraph.posSemidef_lapMatrix
#check @SimpleGraph.incMatrix_mul_transpose
#check @SimpleGraph.adjMatrix_mulVec_const_apply
#check @SimpleGraph.adjMatrix_pow_apply_eq_card_walk
#check @SimpleGraph.sum_degrees_eq_twice_card_edges
#check @SimpleGraph.compl_adjMatrix_eq_adjMatrix_compl
#check @SimpleGraph.lapMatrix_top
#check @SimpleGraph.Iso.reindex_adjMatrix
#check @SimpleGraph.IsRegularOfDegree.mem_spectrum_adjMatrix
#check @SimpleGraph.boxProd
#check @SimpleGraph.lineGraph
#check @SimpleGraph.completeEquipartiteGraph
#check @SimpleGraph.degree_completeEquipartiteGraph
#check @SimpleGraph.Copy
#check @SimpleGraph.diam
#check @SimpleGraph.cliqueNum
#check @completeMultipartiteGraph
#check @hammingDist
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.IsHermitian.eigenvalues₀_antitone
#check @Matrix.IsHermitian.charpoly_eq
#check @Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀
#check @Matrix.charpoly_map
#check @Matrix.charpoly_reindex
#check @Matrix.charpoly_fromBlocks_zero₁₂
#check @Matrix.charpoly_mul_comm'
#check @Matrix.fromBlocks
#check @Matrix.isIrreducible_iff_exists_pow_pos
#check @eigenvalue_mem_ball
#check @Equiv.sumCongr
#check @Submodule.starProjection
#check @CompleteOrthogonalIdempotents
#check @Matrix.rank
#check @Matrix.trace
#check @Matrix.det_apply'
#check @Polynomial.derivative_prod_finset
#check @Matrix.twoBlockTriangular_det
#check @Matrix.det_succ_row_zero
#check @Matrix.det_succ_column_zero
#check @SimpleGraph.induce
#check @SimpleGraph.Embedding.submatrix_adjMatrix

-- Tau Ceti
#check @Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow
#check @Matrix.PosSemidef.eigenvalues₀_nonneg
#check @LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner
#check @Matrix.IsIrreducible.exists_mulVec_eq_smul
#check @Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one
#check @Matrix.IsIrreducible.exists_pos_eq_smul_of_mulVec_eq_smul
#check @Matrix.spectralRadius_eq_of_mulVec_eq_smul
