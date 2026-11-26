module

public import Mathlib
public import TauCeti.LinearAlgebra.Matrix.Rank
public import TauCeti.LinearAlgebra.QuadraticForm.Representation
public import TauCeti.LinearAlgebra.QuadraticForm.Witt.Cancellation
public import TauCeti.LinearAlgebra.QuadraticForm.Witt.Round

/-!
# Strongly regular graphs and designs: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (Fisher's
inequality as an instance of a supplier, the parameter relation of a symmetric design, the
adjacency of the incidence graph) are stated there in prose with their proof routes, and are not
stated here.

Conventions (README, Conventions): a strongly regular graph is Mathlib's
`SimpleGraph.IsSRGWith G n k ℓ μ`, which admits complete and edgeless graphs; statements that
need two restricted eigenvalues or two nonidentity classes assume `G ≠ ⊤` and `G ≠ ⊥`. A design
is an incidence relation `inc : P → L → Prop` between points and blocks, so blocks may repeat,
and the nondegeneracy `2 ≤ k < v`, `0 < ℓ` is part of the definition.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues of
SpectralGraphBounds 1.1 and the Kneser graph of TopologicalCombinatorics 3.1 (as GraphSpectra
copies them), the adjacency spectrum, the Johnson and Petersen graphs and their `DecidableRel`
instances of GraphSpectra 1.2 and 2.4, the two roots `r`, `s` of StronglyRegularAndMooreGraphs
1.2, and the schemes, Bose–Mesner algebra, primitive idempotents and first eigenmatrix of
AssociationSchemes 1.1, 1.2 and 2.1.
-/

@[expose] public section

noncomputable section

open SimpleGraph Matrix Finset

namespace TauCetiRoadmap.StronglyRegularGraphsAndDesigns

/-! ## Local copy: SpectralGraphBounds, 1.1 -/

namespace SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end SpectralGraphBounds

/-! ## Local copy: TopologicalCombinatorics, 3.1 -/

namespace TopologicalCombinatorics

/-- 3.1 The Kneser graph of a family `𝓕` of finite sets: its vertices are the members of `𝓕`,
two of them adjacent when they are distinct and disjoint. -/
def kneserGraphOf {α : Type*} (𝓕 : Set (Finset α)) : SimpleGraph 𝓕 where
  Adj A B := A ≠ B ∧ Disjoint (A : Finset α) B
  symm := ⟨fun _ _ h => ⟨h.1.symm, h.2.symm⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- 3.1 The Kneser graph `KG(α, k)`: the `k`-element subsets of `α`, two adjacent when they are
distinct and disjoint. -/
def kneserGraph (α : Type*) (k : ℕ) : SimpleGraph {s : Finset α | s.card = k} :=
  kneserGraphOf {s : Finset α | s.card = k}

end TopologicalCombinatorics

open SpectralGraphBounds TopologicalCombinatorics

/-! ## Local copy: GraphSpectra, 1.2 and 2.4 -/

namespace GraphSpectra

namespace SimpleGraph

section Definitions

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The adjacency spectrum, as a multiset of real numbers. -/
def adjSpectrum : Multiset ℝ := Multiset.map (adjEigenvalues G) Finset.univ.val

end Definitions

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

instance {α : Type*} [DecidableEq α] {k : ℕ} : DecidableRel (johnsonGraph α k).Adj :=
  fun s t ↦ inferInstanceAs (Decidable (s ≠ t ∧ ((s : Finset α) ∩ t).card + 1 = k))

instance {α : Type*} [DecidableEq α] {k : ℕ} : DecidableRel (kneserGraph α k).Adj :=
  fun s t ↦ inferInstanceAs (Decidable (s ≠ t ∧ Disjoint (s : Finset α) t))

instance {V W : Type*} [DecidableEq V] [DecidableEq W] (G : _root_.SimpleGraph V)
    [DecidableRel G.Adj] (H : _root_.SimpleGraph W) [DecidableRel H.Adj] :
    DecidableRel (G □ H).Adj := fun x y ↦
  inferInstanceAs (Decidable (G.Adj x.1 y.1 ∧ x.2 = y.2 ∨ H.Adj x.2 y.2 ∧ x.1 = y.1))

end SimpleGraph

end GraphSpectra

open GraphSpectra GraphSpectra.SimpleGraph

/-! ## Local copy: StronglyRegularAndMooreGraphs, 1.2 -/

namespace StronglyRegularAndMooreGraphs

/-- 1.2 The discriminant `(ℓ − μ)² + 4(k − μ)` of the quadratic `x² − (ℓ − μ)x − (k − μ)` whose
roots are the eigenvalues of a strongly regular graph other than its degree. -/
def srgDiscriminant (k ℓ μ : ℕ) : ℝ :=
  ((ℓ : ℝ) - μ) ^ 2 + 4 * ((k : ℝ) - μ)

/-- 1.2 The larger root `r = ((ℓ − μ) + √Δ) / 2` of `x² − (ℓ − μ)x − (k − μ)`. -/
def srgEigenvalueR (k ℓ μ : ℕ) : ℝ :=
  (((ℓ : ℝ) - μ) + Real.sqrt (srgDiscriminant k ℓ μ)) / 2

/-- 1.2 The smaller root `s = ((ℓ − μ) − √Δ) / 2` of `x² − (ℓ − μ)x − (k − μ)`. -/
def srgEigenvalueS (k ℓ μ : ℕ) : ℝ :=
  (((ℓ : ℝ) - μ) - Real.sqrt (srgDiscriminant k ℓ μ)) / 2

end StronglyRegularAndMooreGraphs

/-! ## Local copy: AssociationSchemes, 1.1, 1.2 and 2.1 -/

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

end AssociationSchemes

open TauCetiRoadmap.StronglyRegularGraphsAndDesigns StronglyRegularAndMooreGraphs
  AssociationSchemes

/-! ## Layer 1: the strongly regular equation and the spectral characterizations -/

namespace SimpleGraph

section Layer1

variable {V : Type*} [Fintype V] [DecidableEq V] {G : _root_.SimpleGraph V} [DecidableRel G.Adj]
  {n k ℓ μ : ℕ}

variable (G) in
/-- The restricted eigenvalues of `G`: the eigenvalues of the real adjacency matrix with an
eigenvector whose entries sum to `0`. For a regular graph they are the eigenvalues of `A` on the
orthogonal complement of the all-ones vector. -/
def restrictedEigenvalues : Set ℝ :=
  {θ | ∃ u : V → ℝ, u ≠ 0 ∧ ∑ x, u x = 0 ∧ G.adjMatrix ℝ *ᵥ u = θ • u}

/-! ### 1.1 The strongly regular equation -/

/-- **The strongly regular equation.** For every graph and every ring of characteristic zero,
`G` is strongly regular with parameters `(n, k, ℓ, μ)` exactly when it has `n` vertices and
`A² = (ℓ - μ) A + (k - μ) I + μ J`. (README 1.1) -/
theorem isSRGWith_iff_adjMatrix_sq_eq {R : Type*} [Ring R] [CharZero R] :
    G.IsSRGWith n k ℓ μ ↔ Fintype.card V = n ∧
      G.adjMatrix R ^ 2 = ((ℓ : R) - μ) • G.adjMatrix R + ((k : R) - μ) • (1 : Matrix V V R) +
        (μ : R) • Matrix.of (fun _ _ ↦ (1 : R)) := by
  sorry

/-- **The equation with real coefficients.** `G` is strongly regular for some parameters exactly
when `A²` is a real linear combination of `A`, `I` and `J`. (README 1.1) -/
theorem exists_isSRGWith_iff_exists_real :
    (∃ k ℓ μ : ℕ, G.IsSRGWith (Fintype.card V) k ℓ μ) ↔
      ∃ a b c : ℝ, G.adjMatrix ℝ ^ 2 =
        a • G.adjMatrix ℝ + b • (1 : Matrix V V ℝ) + c • Matrix.of (fun _ _ ↦ (1 : ℝ)) := by
  sorry

/-! ### 1.2 Parameter bounds -/

/-- **Parameter bounds.** `μ ≤ k` for a strongly regular graph that is not complete.
(README 1.2) Basic API, stated because 1.3 and 2.1 consume it. -/
theorem IsSRGWith.le_of_ne_top (h : G.IsSRGWith n k ℓ μ) (htop : G ≠ ⊤) : μ ≤ k := by
  sorry

/-- **Parameter bounds.** `ℓ < k` for a strongly regular graph with an edge. (README 1.2)
Basic API, stated because 1.3 and 2.1 consume it. -/
theorem IsSRGWith.lt_of_ne_bot (h : G.IsSRGWith n k ℓ μ) (hbot : G ≠ ⊥) : ℓ < k := by
  sorry

/-- **The parameter relation in the reals.** `k (k - ℓ - 1) = (n - k - 1) μ` with real
subtraction, for a strongly regular graph with at least one vertex. (README 1.2) Basic API,
stated because 1.3 and Layer 2 compute with real parameters. -/
theorem IsSRGWith.param_eq_real (h : G.IsSRGWith n k ℓ μ) (hn : 0 < n) :
    (k : ℝ) * ((k : ℝ) - ℓ - 1) = ((n : ℝ) - k - 1) * μ := by
  sorry

/-! ### 1.3 Restricted eigenvalues -/

/-- **The spectral characterization.** A `k`-regular graph that is neither complete nor edgeless
is strongly regular exactly when it has precisely two restricted eigenvalues. (README 1.3) -/
theorem exists_isSRGWith_iff_ncard_restrictedEigenvalues (hk : G.IsRegularOfDegree k)
    (htop : G ≠ ⊤) (hbot : G ≠ ⊥) :
    (∃ ℓ μ : ℕ, G.IsSRGWith (Fintype.card V) k ℓ μ) ↔ G.restrictedEigenvalues.ncard = 2 := by
  sorry

/-- **Three eigenvalues.** A connected `k`-regular graph with exactly three distinct adjacency
eigenvalues is strongly regular. (README 1.3) -/
theorem exists_isSRGWith_of_card_toFinset_adjSpectrum (hc : G.Connected)
    (hk : G.IsRegularOfDegree k) (h3 : G.adjSpectrum.toFinset.card = 3) :
    ∃ ℓ μ : ℕ, G.IsSRGWith (Fintype.card V) k ℓ μ := by
  sorry

end Layer1

/-! ## Layer 2: strongly regular graphs as association schemes with two classes -/

section Layer2

variable {V : Type*} [Fintype V] [DecidableEq V] {G : _root_.SimpleGraph V} [DecidableRel G.Adj]
  {n k ℓ μ : ℕ}

/-! ### 2.1 The complement -/

/-- **The complement.** For a strongly regular graph that is neither complete nor edgeless, the
roots computed from Mathlib's complement parameters, with truncated subtraction, are `-1 - s` and
`-1 - r`. (README 2.1) -/
theorem IsSRGWith.srgEigenvalues_compl (h : G.IsSRGWith n k ℓ μ) (htop : G ≠ ⊤)
    (hbot : G ≠ ⊥) :
    srgEigenvalueR (n - k - 1) (n - (2 * k - μ) - 2) (n - (2 * k - ℓ)) =
        -1 - srgEigenvalueS k ℓ μ ∧
      srgEigenvalueS (n - k - 1) (n - (2 * k - μ) - 2) (n - (2 * k - ℓ)) =
        -1 - srgEigenvalueR k ℓ μ := by
  sorry

/-! ### 2.2 Two classes -/

variable (G) in
/-- The class function of a graph: class `0` is the diagonal, class `1` the adjacency relation
and class `2` the nonadjacency of distinct vertices. -/
def srgClass (x y : V) : Fin (2 + 1) :=
  if x = y then 0 else if G.Adj x y then 1 else 2

/-- **Strongly regular graphs are the schemes with two classes.** For a graph that is neither
complete nor edgeless, the diagonal, the edges and the nonedges form a symmetric association
scheme with two classes exactly when the graph is strongly regular. (README 2.2) -/
theorem isAssocScheme_srgClass_iff (htop : G ≠ ⊤) (hbot : G ≠ ⊥) :
    IsAssocScheme G.srgClass ↔ ∃ k ℓ μ : ℕ, G.IsSRGWith (Fintype.card V) k ℓ μ := by
  sorry

/-! ### 2.3 Primitive idempotents and the eigenmatrix -/

variable (G) in
/-- The spectral idempotent `E_r = (A - s I - (k - s) J / n) / (r - s)`. -/
def idempotentR (k ℓ μ : ℕ) : Matrix V V ℝ :=
  (srgEigenvalueR k ℓ μ - srgEigenvalueS k ℓ μ)⁻¹ •
    (G.adjMatrix ℝ - srgEigenvalueS k ℓ μ • (1 : Matrix V V ℝ) -
      ((k : ℝ) - srgEigenvalueS k ℓ μ) • ((Fintype.card V : ℝ)⁻¹ • Matrix.of fun _ _ ↦ (1 : ℝ)))

variable (G) in
/-- The spectral idempotent `E_s = (r I - A + (k - r) J / n) / (r - s)`. -/
def idempotentS (k ℓ μ : ℕ) : Matrix V V ℝ :=
  (srgEigenvalueR k ℓ μ - srgEigenvalueS k ℓ μ)⁻¹ •
    (srgEigenvalueR k ℓ μ • (1 : Matrix V V ℝ) - G.adjMatrix ℝ +
      ((k : ℝ) - srgEigenvalueR k ℓ μ) • ((Fintype.card V : ℝ)⁻¹ • Matrix.of fun _ _ ↦ (1 : ℝ)))

/-- **The primitive idempotents.** For a strongly regular graph that is neither complete nor
edgeless, `J / n`, `E_r` and `E_s` are a family of primitive idempotents of its scheme, and
`A = k J / n + r E_r + s E_s`. (README 2.3) -/
theorem IsSRGWith.isPrimitiveIdempotents (h : G.IsSRGWith n k ℓ μ) (htop : G ≠ ⊤)
    (hbot : G ≠ ⊥) :
    IsPrimitiveIdempotents G.srgClass
        ![(Fintype.card V : ℝ)⁻¹ • Matrix.of (fun _ _ ↦ (1 : ℝ)), G.idempotentR k ℓ μ,
          G.idempotentS k ℓ μ] ∧
      G.adjMatrix ℝ = (k : ℝ) • ((Fintype.card V : ℝ)⁻¹ • Matrix.of fun _ _ ↦ (1 : ℝ)) +
        srgEigenvalueR k ℓ μ • G.idempotentR k ℓ μ +
          srgEigenvalueS k ℓ μ • G.idempotentS k ℓ μ := by
  sorry

/-- **The eigenmatrix.** With the idempotents `J / n`, `E_r` and `E_s`, the first eigenmatrix of
the scheme of a strongly regular graph that is neither complete nor edgeless has rows
`(1, k, n - k - 1)`, `(1, r, -1 - r)` and `(1, s, -1 - s)`. (README 2.3) -/
theorem IsSRGWith.eigenmatrix_srgClass (h : G.IsSRGWith n k ℓ μ) (htop : G ≠ ⊤)
    (hbot : G ≠ ⊥) :
    eigenmatrix G.srgClass
        ![(Fintype.card V : ℝ)⁻¹ • Matrix.of (fun _ _ ↦ (1 : ℝ)), G.idempotentR k ℓ μ,
          G.idempotentS k ℓ μ] =
      !![1, (k : ℝ), (n : ℝ) - k - 1;
        1, srgEigenvalueR k ℓ μ, -1 - srgEigenvalueR k ℓ μ;
        1, srgEigenvalueS k ℓ μ, -1 - srgEigenvalueS k ℓ μ] := by
  sorry

/-! ### 2.4 The Krein conditions -/

/-- **The Krein conditions.** A strongly regular graph that is neither complete nor edgeless
satisfies `(r + 1)(k + r + 2rs) ≤ (k + r)(s + 1)²` and `(s + 1)(k + s + 2rs) ≤ (k + s)(r + 1)²`.
(README 2.4) -/
theorem IsSRGWith.krein_conditions (h : G.IsSRGWith n k ℓ μ) (htop : G ≠ ⊤) (hbot : G ≠ ⊥) :
    (srgEigenvalueR k ℓ μ + 1) *
        (k + srgEigenvalueR k ℓ μ + 2 * srgEigenvalueR k ℓ μ * srgEigenvalueS k ℓ μ) ≤
      (k + srgEigenvalueR k ℓ μ) * (srgEigenvalueS k ℓ μ + 1) ^ 2 ∧
    (srgEigenvalueS k ℓ μ + 1) *
        (k + srgEigenvalueS k ℓ μ + 2 * srgEigenvalueR k ℓ μ * srgEigenvalueS k ℓ μ) ≤
      (k + srgEigenvalueS k ℓ μ) * (srgEigenvalueR k ℓ μ + 1) ^ 2 := by
  sorry

end Layer2

/-! ## Layer 3: the standard families -/

/-- The Hoffman–Singleton graph, by Robertson's construction: five pentagons `(false, i, ·)`
with `(i, j) ∼ (i, j + 1)`, five pentagrams `(true, i, ·)` with `(i, j) ∼ (i, j + 2)`, and
`(false, i, k) ∼ (true, j, i j + k)`, all indices in `ZMod 5`. -/
def hoffmanSingletonGraph : _root_.SimpleGraph (Bool × ZMod 5 × ZMod 5) :=
  _root_.SimpleGraph.fromRel fun x y ↦
    (x.1 = false ∧ y.1 = false ∧ x.2.1 = y.2.1 ∧ y.2.2 = x.2.2 + 1) ∨
    (x.1 = true ∧ y.1 = true ∧ x.2.1 = y.2.1 ∧ y.2.2 = x.2.2 + 2) ∨
    (x.1 = false ∧ y.1 = true ∧ y.2.2 = x.2.1 * y.2.1 + x.2.2)

instance instDecidableRelHoffmanSingletonGraph : DecidableRel hoffmanSingletonGraph.Adj :=
  fun x y ↦ inferInstanceAs (Decidable (x ≠ y ∧ (_ ∨ _)))

/-! ### 3.1 Triangular, lattice and complete multipartite graphs -/

/-- **Triangular graphs.** `J(m, 2)` on the `2`-subsets of an `m`-set is strongly regular with
parameters `(m(m - 1)/2, 2(m - 2), m - 2, 4)`, with truncated subtraction. (README 3.1) -/
theorem johnsonGraph_two_isSRGWith (α : Type*) [Fintype α] [DecidableEq α] :
    (johnsonGraph α 2).IsSRGWith ((Fintype.card α).choose 2) (2 * (Fintype.card α - 2))
      (Fintype.card α - 2) 4 := by
  sorry

/-- **Lattice graphs.** `K_m □ K_m` is strongly regular with parameters
`(m², 2(m - 1), m - 2, 2)`. (README 3.1) -/
theorem top_boxProd_top_isSRGWith (m : ℕ) :
    ((⊤ : _root_.SimpleGraph (Fin m)) □ (⊤ : _root_.SimpleGraph (Fin m))).IsSRGWith (m ^ 2)
      (2 * (m - 1)) (m - 2) 2 := by
  sorry

/-- **Complete equipartite graphs.** `K_{m × a}` is strongly regular with parameters
`(m a, (m - 1) a, (m - 2) a, (m - 1) a)`. (README 3.1) -/
theorem completeEquipartiteGraph_isSRGWith (m a : ℕ) :
    (completeEquipartiteGraph m a).IsSRGWith (m * a) ((m - 1) * a) ((m - 2) * a)
      ((m - 1) * a) := by
  sorry

/-- **Disjoint unions of complete graphs.** `m K_a` is strongly regular with parameters
`(m a, a - 1, a - 2, 0)`. (README 3.1) -/
theorem compl_completeEquipartiteGraph_isSRGWith (m a : ℕ) :
    (completeEquipartiteGraph m a)ᶜ.IsSRGWith (m * a) (a - 1) (a - 2) 0 := by
  sorry

/-! ### 3.2 The pentagon, the Petersen graph and the Hoffman–Singleton graph -/

/-- **The pentagon.** `C₅` is strongly regular with parameters `(5, 2, 0, 1)`. (README 3.2)
A sanity check of the definitions on five vertices. -/
theorem cycleGraph_five_isSRGWith : (cycleGraph 5).IsSRGWith 5 2 0 1 := by
  sorry

/-- **The Petersen graph** is strongly regular with parameters `(10, 3, 0, 1)`. (README 3.2) -/
theorem petersenGraph_isSRGWith : petersenGraph.IsSRGWith 10 3 0 1 := by
  sorry

/-- **The Hoffman–Singleton graph** is strongly regular with parameters `(50, 7, 0, 1)`.
(README 3.2) -/
theorem hoffmanSingletonGraph_isSRGWith : hoffmanSingletonGraph.IsSRGWith 50 7 0 1 := by
  sorry

/-! ## Layer 4: uniqueness of the pentagon and the Petersen graph -/

section Layer4

variable {V : Type*} [Fintype V] [DecidableEq V] {G : _root_.SimpleGraph V} [DecidableRel G.Adj]

/-- **Uniqueness of the pentagon.** (README 4.1) -/
theorem IsSRGWith.nonempty_iso_cycleGraph_five (h : G.IsSRGWith 5 2 0 1) :
    Nonempty (G ≃g cycleGraph 5) := by
  sorry

/-- **Uniqueness of the Petersen graph.** (README 4.1) -/
theorem IsSRGWith.nonempty_iso_petersenGraph (h : G.IsSRGWith 10 3 0 1) :
    Nonempty (G ≃g petersenGraph) := by
  sorry

end Layer4

end SimpleGraph

/-! ## Layer 5: designs, incidence matrices and incidence graphs -/

namespace Design

variable {P L : Type*} {inc : P → L → Prop} {v k ℓ : ℕ}

/-! ### 5.1 Designs and the Gram identity -/

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

/-- The replication number `r = ℓ (v - 1) / (k - 1)` of a `2`-`(v, k, ℓ)` design. -/
def replication (v k ℓ : ℕ) : ℕ := ℓ * (v - 1) / (k - 1)

/-- The point-by-block incidence matrix. -/
def incMatrix (R : Type*) [Zero R] [One R] (inc : P → L → Prop) [DecidableRel inc] :
    Matrix P L R :=
  Matrix.of fun p l ↦ if inc p l then 1 else 0

/-- **The replication number.** Every point lies on `r` blocks, and `r (k - 1) = ℓ (v - 1)`.
(README 5.1) -/
theorem IsTwoDesign.card_blocks_through (h : IsTwoDesign inc v k ℓ) (p : P) :
    Nat.card {l // inc p l} = replication v k ℓ ∧ replication v k ℓ * (k - 1) = ℓ * (v - 1) := by
  sorry

/-- **Counting blocks.** `b k = v r`. (README 5.1) Basic API, stated because 5.2 consumes
it. -/
theorem IsTwoDesign.card_blocks_mul (h : IsTwoDesign inc v k ℓ) :
    Nat.card L * k = v * replication v k ℓ := by
  sorry

/-- **The Gram identity.** `N Nᵀ = (r - ℓ) I + ℓ J`, over any commutative ring. (README 5.1) -/
theorem IsTwoDesign.incMatrix_mul_transpose [Fintype P] [Fintype L] [DecidableEq P]
    [DecidableRel inc] {R : Type*} [CommRing R] (h : IsTwoDesign inc v k ℓ) :
    incMatrix R inc * (incMatrix R inc)ᵀ =
      ((replication v k ℓ : R) - ℓ) • (1 : Matrix P P R) + (ℓ : R) • Matrix.of fun _ _ ↦ 1 := by
  sorry

/-- **The converse of the Gram identity.** Blocks of size `k`, `2 ≤ k < v`, `0 < ℓ` and
`N Nᵀ = (r - ℓ) I + ℓ J` over `ℤ` make a `2`-`(v, k, ℓ)` design. (README 5.1) -/
theorem isTwoDesign_of_incMatrix_mul_transpose [Fintype P] [Fintype L] [DecidableEq P]
    [DecidableRel inc] {r : ℕ} (hv : Fintype.card P = v) (hk : ∀ l, Nat.card {p // inc p l} = k)
    (hk2 : 2 ≤ k) (hkv : k < v) (hℓ : 0 < ℓ)
    (hN : incMatrix ℤ inc * (incMatrix ℤ inc)ᵀ =
      ((r : ℤ) - ℓ) • (1 : Matrix P P ℤ) + (ℓ : ℤ) • Matrix.of fun _ _ ↦ 1) :
    IsTwoDesign inc v k ℓ := by
  sorry

/-- **The rank of the incidence matrix.** The real incidence matrix of a `2`-design has rank
`v`. (README 5.1) -/
theorem IsTwoDesign.rank_incMatrix [Fintype P] [Fintype L] [DecidableRel inc]
    (h : IsTwoDesign inc v k ℓ) : (incMatrix ℝ inc).rank = Fintype.card P := by
  sorry

/-! ### 5.2 Symmetric designs -/

/-- **Fisher equality.** A `2`-design is symmetric exactly when `r = k`. (README 5.2) -/
theorem IsTwoDesign.isSymmetricDesign_iff [Finite L] (h : IsTwoDesign inc v k ℓ) :
    IsSymmetricDesign inc v k ℓ ↔ replication v k ℓ = k := by
  sorry

/-- **The dual of a symmetric design** is a symmetric design with the same parameters; in
particular two distinct blocks meet in exactly `ℓ` points. (README 5.2) -/
theorem IsSymmetricDesign.flip [Finite L] (h : IsSymmetricDesign inc v k ℓ) :
    IsSymmetricDesign (flip inc) v k ℓ := by
  sorry

/-! ### 5.3 The incidence graph -/

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

/-- **The spectrum of the incidence graph** of a symmetric `2`-`(v, k, ℓ)` design: `±k` once
each and `±√(k - ℓ)` each `v - 1` times. (README 5.3) -/
theorem IsSymmetricDesign.adjSpectrum_incidenceGraph [Fintype P] [Fintype L] [DecidableEq P]
    [DecidableEq L] [DecidableRel inc] (h : IsSymmetricDesign inc v k ℓ) :
    (incidenceGraph inc).adjSpectrum = (k : ℝ) ::ₘ (-(k : ℝ)) ::ₘ
      (Multiset.replicate (v - 1) (Real.sqrt ((k : ℝ) - ℓ)) +
        Multiset.replicate (v - 1) (-Real.sqrt ((k : ℝ) - ℓ))) := by
  sorry

/-! ### 5.4 Projective planes -/

/-- **Projective planes are symmetric designs.** A finite projective plane of order `q` is a
symmetric `2`-`(q² + q + 1, q + 1, 1)` design. (README 5.4) -/
theorem isSymmetricDesign_of_projectivePlane [Membership P L] [Finite P] [Finite L]
    [Configuration.ProjectivePlane P L] :
    IsSymmetricDesign (fun (p : P) (l : L) ↦ p ∈ l)
      (Configuration.ProjectivePlane.order P L ^ 2 + Configuration.ProjectivePlane.order P L + 1)
      (Configuration.ProjectivePlane.order P L + 1) 1 := by
  sorry

/-- **Symmetric designs with `ℓ = 1` are projective planes**, for `q ≥ 2`. (README 5.4) -/
theorem nonempty_projectivePlane_of_isSymmetricDesign [Membership P L] {q : ℕ} (hq : 2 ≤ q)
    (h : IsSymmetricDesign (fun (p : P) (l : L) ↦ p ∈ l) (q ^ 2 + q + 1) (q + 1) 1) :
    Nonempty (Configuration.ProjectivePlane P L) := by
  sorry

/-! ### 5.5 Designs and strongly regular graphs -/

variable (inc) in
/-- The block graph of `inc` for an intersection size `x`: distinct blocks are adjacent when
they have exactly `x` common points. -/
def blockGraph [Fintype P] [DecidableRel inc] (x : ℕ) : _root_.SimpleGraph L :=
  _root_.SimpleGraph.fromRel fun l l' ↦ #{p | inc p l ∧ inc p l'} = x

instance instDecidableRelBlockGraph [Fintype P] [DecidableRel inc] [DecidableEq L] (x : ℕ) :
    DecidableRel (blockGraph inc x).Adj :=
  fun l l' ↦ inferInstanceAs (Decidable (l ≠ l' ∧ (_ ∨ _)))

/-- **Quasi-symmetric designs give strongly regular graphs.** If any two distinct blocks of a
`2`-design meet in `x` or in `y` points, `x ≠ y`, then the block graph for `x` is strongly
regular. (README 5.5) -/
theorem IsTwoDesign.exists_isSRGWith_blockGraph [Fintype P] [Fintype L] [DecidableEq L]
    [DecidableRel inc] (h : IsTwoDesign inc v k ℓ) {x y : ℕ} (hxy : x ≠ y)
    (hq : ∀ l l', l ≠ l' → #{p | inc p l ∧ inc p l'} = x ∨ #{p | inc p l ∧ inc p l'} = y) :
    ∃ a b c : ℕ, (blockGraph inc x).IsSRGWith (Fintype.card L) a b c := by
  sorry

end Design

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] {G : _root_.SimpleGraph V} [DecidableRel G.Adj]
  {n k ℓ : ℕ}

/-- **Strongly regular graphs with `ℓ = μ`.** Adjacency is the incidence relation of a symmetric
`2`-`(n, k, ℓ)` design on the vertex set. (README 5.5) -/
theorem IsSRGWith.isSymmetricDesign (h : G.IsSRGWith n k ℓ ℓ) (hk : 2 ≤ k) (hkn : k < n)
    (hℓ : 0 < ℓ) : Design.IsSymmetricDesign G.Adj n k ℓ := by
  sorry

/-- **Strongly regular graphs with `μ = ℓ + 2`.** "Equal or adjacent" is the incidence relation
of a symmetric `2`-`(n, k + 1, ℓ + 2)` design on the vertex set. (README 5.5) -/
theorem IsSRGWith.isSymmetricDesign_eq_or_adj (h : G.IsSRGWith n k ℓ (ℓ + 2)) (hk : 1 ≤ k)
    (hkn : k + 1 < n) :
    Design.IsSymmetricDesign (fun x y : V ↦ x = y ∨ G.Adj x y) n (k + 1) (ℓ + 2) := by
  sorry

end SimpleGraph

/-! ## Layer 6: the Bruck–Ryser–Chowla theorem -/

namespace Design

variable {P L : Type*} {inc : P → L → Prop} {v k ℓ : ℕ}

/-! ### 6.1 The determinant and the even case -/

/-- **The determinant of a symmetric design.** `(det N)² = k² (k - ℓ)^(v - 1)`, for any
ordering of the blocks by the points. (README 6.1) -/
theorem IsSymmetricDesign.det_sq [Fintype P] [Fintype L] [DecidableEq P] [DecidableRel inc]
    (h : IsSymmetricDesign inc v k ℓ) (e : P ≃ L) :
    ((incMatrix ℤ inc).submatrix id e).det ^ 2 = (k : ℤ) ^ 2 * ((k : ℤ) - ℓ) ^ (v - 1) := by
  sorry

/-- **Bruck–Ryser–Chowla, even case.** If `v` is even, `k - ℓ` is a square. (README 6.1) -/
theorem IsSymmetricDesign.isSquare_of_even [Finite P] [Finite L]
    (h : IsSymmetricDesign inc v k ℓ) (hv : Even v) : IsSquare (k - ℓ) := by
  sorry

/-! ### 6.2 The rational congruence and the odd case -/

/-- **The rational congruence.** For a symmetric `2`-`(v, k, ℓ)` design, with `m = k - ℓ`, the
diagonal forms `⟨1, …, 1, m v⟩` and `⟨m, …, m, v⟩` of rank `v + 1` are equivalent over `ℚ`.
(README 6.2) -/
theorem IsSymmetricDesign.equivalent_weightedSumSquares [Finite P] [Finite L]
    (h : IsSymmetricDesign inc v k ℓ) :
    (QuadraticMap.weightedSumSquares ℚ
        (fun i : Fin (v + 1) ↦ if (i : ℕ) < v then (1 : ℚ) else ((k : ℚ) - ℓ) * v)).Equivalent
      (QuadraticMap.weightedSumSquares ℚ
        (fun i : Fin (v + 1) ↦ if (i : ℕ) < v then (k : ℚ) - ℓ else (v : ℚ))) := by
  sorry

/-- **Bruck–Ryser–Chowla, odd case.** If `v` is odd, then
`x² = (k - ℓ) y² + (-1)^((v - 1)/2) ℓ z²` has an integer solution with `x, y, z` not all zero.
(README 6.2) -/
theorem IsSymmetricDesign.exists_brc_solution [Finite P] [Finite L]
    (h : IsSymmetricDesign inc v k ℓ) (hv : Odd v) :
    ∃ x y z : ℤ, ¬ (x = 0 ∧ y = 0 ∧ z = 0) ∧
      x ^ 2 = ((k : ℤ) - ℓ) * y ^ 2 + (-1) ^ ((v - 1) / 2) * ℓ * z ^ 2 := by
  sorry

/-! ### 6.3 The Bruck–Ryser theorem -/

/-- **The Bruck–Ryser theorem.** If a finite projective plane has order `q ≡ 1, 2 (mod 4)`, then
`q` is a sum of two squares. (README 6.3) -/
theorem exists_eq_sq_add_sq_of_projectivePlane {P L : Type*} [Membership P L] [Finite P]
    [Finite L] [Configuration.ProjectivePlane P L]
    (hq : Configuration.ProjectivePlane.order P L % 4 = 1 ∨
      Configuration.ProjectivePlane.order P L % 4 = 2) :
    ∃ a b : ℕ, Configuration.ProjectivePlane.order P L = a ^ 2 + b ^ 2 := by
  sorry

/-- **No projective plane of order six.** (README 6.3) A sanity check of the Bruck–Ryser
theorem at its first value, `6 ≡ 2 (mod 4)`. -/
theorem projectivePlane_order_ne_six {P L : Type*} [Membership P L] [Finite P] [Finite L]
    [Configuration.ProjectivePlane P L] : Configuration.ProjectivePlane.order P L ≠ 6 := by
  sorry

end Design

end TauCetiRoadmap.StronglyRegularGraphsAndDesigns

-- Library declarations consumed

-- Mathlib
#check @SimpleGraph.IsSRGWith
#check @SimpleGraph.IsSRGWith.of_adj
#check @SimpleGraph.IsSRGWith.of_not_adj
#check @SimpleGraph.IsSRGWith.matrix_eq
#check @SimpleGraph.IsSRGWith.param_eq
#check @SimpleGraph.IsSRGWith.compl
#check @SimpleGraph.IsSRGWith.card_neighborFinset_union_of_not_adj
#check @SimpleGraph.IsSRGWith.card_neighborFinset_union_of_adj
#check @SimpleGraph.IsSRGWith.top
#check @SimpleGraph.bot_strongly_regular
#check @SimpleGraph.IsSRGWith.ediam_eq_two
#check @SimpleGraph.one_add_adjMatrix_add_compl_adjMatrix_eq_of_one
#check @SimpleGraph.adjMatrix_pow_apply_eq_card_walk
#check @SimpleGraph.adjMatrix_mulVec_const_apply_of_regular
#check @SimpleGraph.boxProd
#check @SimpleGraph.cycleGraph
#check @SimpleGraph.completeEquipartiteGraph
#check @SimpleGraph.fromRel
#check @Matrix.rank
#check @Matrix.rank_mul_le_left
#check @Matrix.PosDef.isUnit
#check @CompleteOrthogonalIdempotents
#check @Real.sqrt
#check @Configuration.ProjectivePlane
#check @Configuration.ProjectivePlane.order
#check @Configuration.ProjectivePlane.card_points
#check @Configuration.ProjectivePlane.pointCount_eq
#check @Configuration.ProjectivePlane.lineCount_eq
#check @Configuration.HasLines.existsUnique_line
#check @Configuration.HasLines.card_le
#check @Configuration.HasPoints
#check @QuadraticMap.weightedSumSquares
#check @QuadraticMap.Equivalent
#check @Nat.sum_four_squares
#check @Nat.eq_sq_add_sq_iff

-- Tau Ceti
#check @Matrix.rank_eq_card_iff_mulVec_injective
#check @TauCeti.equivalent_of_equivalent_prod
#check @TauCeti.equivalent_of_equivalent_prod_right
#check @TauCeti.oneFoldPfister_smul_equivalent_iff
#check @TauCeti.twoFoldPfister_smul_equivalent_iff
#check @QuadraticMap.unitValueSet
#check @QuadraticMap.Equivalent.unitValueSet_eq
