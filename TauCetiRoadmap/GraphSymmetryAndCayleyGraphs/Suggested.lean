module

public import Mathlib
public import TauCeti.Combinatorics.SimpleGraph.Connectivity.EdgeConnectivity
public import TauCeti.Combinatorics.SimpleGraph.Connectivity.VertexConnectivity
public import TauCeti.Combinatorics.SimpleGraph.Degree
public import TauCeti.RepresentationTheory.CharacterTable.CentralCharacter
public import TauCeti.RepresentationTheory.CharacterTable.Completeness

/-!
# Graph symmetry and Cayley graphs: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (defining
lemmas, evaluation lemmas, supporting statements and the transitivity of the Johnson and Hamming
graphs) are stated there in prose with their locators or proof routes, and are not stated here.

Conventions (README, Conventions): a graph is `G : SimpleGraph V`; the automorphism group is
Mathlib's `G ≃g G`, acting on `V` through `RelIso.applyMulAction`; the Cayley graph of `S` in a
group is Mathlib's `SimpleGraph.mulCayley S`, in which `x` and `y` are adjacent when
`x⁻¹ * y ∈ S` for a symmetric `S` not containing `1`, so that left multiplication acts by
automorphisms. `IsVertexTransitive`, `IsEdgeTransitive`, `IsArcTransitive`, `IsWalkRegular`,
`IsSArc` and `IsSArcTransitive` are this roadmap's definitions.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues of
SpectralGraphBounds 1.1, the Kneser graph of TopologicalCombinatorics 3.1, and the adjacency
spectrum, the Petersen graph and the spectral projections of GraphSpectra 1.2, 2.4 and 3.9.
-/

@[expose] public section

noncomputable section

universe u

open SimpleGraph Matrix Polynomial Module Filter Topology
open scoped Pointwise

namespace TauCetiRoadmap.GraphSymmetryAndCayleyGraphs

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

/-! ## Local copy: GraphSpectra, 1.2, 2.4 and 3.9 -/

namespace GraphSpectra

namespace SimpleGraph

section Definitions

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The adjacency spectrum, as a multiset of real numbers. -/
def adjSpectrum : Multiset ℝ := Multiset.map (adjEigenvalues G) Finset.univ.val

/-- The matrix of the orthogonal projection `P_θ` onto the `θ`-eigenspace of the real adjacency
matrix (the zero matrix when `θ` is not an eigenvalue), written through Mathlib's orthonormal
eigenvector basis. (README 3.9) -/
def adjEigenspaceProjection (θ : ℝ) : Matrix V V ℝ :=
  fun x y ↦ ∑ i ∈ Finset.univ.filter (fun i ↦ (G.isHermitian_adjMatrix ℝ).eigenvalues i = θ),
    (G.isHermitian_adjMatrix ℝ).eigenvectorBasis i x *
      (G.isHermitian_adjMatrix ℝ).eigenvectorBasis i y

end Definitions

/-- The Petersen graph `K(5, 2)`. -/
abbrev petersenGraph : _root_.SimpleGraph {s : Finset (Fin 5) | s.card = 2} :=
  kneserGraph (Fin 5) 2

end SimpleGraph

end GraphSpectra

open GraphSpectra.SimpleGraph

namespace SimpleGraph

/-! ## Layer 1: automorphisms and transitivity -/

/-! ### 1.1 Vertex-, edge- and arc-transitivity -/

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

/-- **1.1** A graph is arc-transitive when its automorphism group acts transitively on its darts
(ordered pairs of adjacent vertices). -/
def IsArcTransitive : Prop :=
  ∀ d d' : G.Dart, ∃ φ : G ≃g G, φ d.fst = d'.fst ∧ φ d.snd = d'.snd

/-- **1.1** An arc-transitive graph without isolated vertices is vertex- and edge-transitive. -/
theorem IsArcTransitive.isVertexTransitive_and_isEdgeTransitive {G : _root_.SimpleGraph V}
    (h : IsArcTransitive G) (hiso : ∀ x : V, ∃ y, G.Adj x y) :
    IsVertexTransitive G ∧ IsEdgeTransitive G := by
  sorry

/-- **1.1 (Godsil–Royle, Lemma 3.2.1).** An edge-transitive graph without isolated vertices
that is not vertex-transitive is bipartite, and its two colour classes are the orbits of the
automorphism group. -/
theorem IsEdgeTransitive.exists_orbit_bipartition {G : _root_.SimpleGraph V}
    (h : IsEdgeTransitive G) (hiso : ∀ x : V, ∃ y, G.Adj x y) (hvt : ¬ IsVertexTransitive G) :
    ∃ c : V → Bool, (∀ x y, G.Adj x y → c x ≠ c y) ∧
      ∀ x y, (c x = c y ↔ ∃ φ : G ≃g G, φ x = y) := by
  sorry

variable [Fintype V] [DecidableEq V] [DecidableRel G.Adj]

/-- **1.1 (Godsil–Royle, Lemma 3.2.2).** A vertex- and edge-transitive graph that is not
arc-transitive has even degree. -/
theorem even_degree_of_not_isArcTransitive (hvt : IsVertexTransitive G)
    (het : IsEdgeTransitive G) (hat : ¬ IsArcTransitive G) (x : V) : Even (G.degree x) := by
  sorry

end Transitivity

/-! ### 1.2 Automorphisms and the adjacency matrix -/

section Matrix

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- **1.2 (Biggs, Proposition 15.2; Brouwer–Haemers, §1.6).** Over a nontrivial semiring, a
permutation of the vertices commutes with the adjacency matrix exactly when it preserves
adjacency. -/
theorem permMatrix_mul_adjMatrix_comm_iff {R : Type*} [Semiring R] [Nontrivial R]
    (σ : Equiv.Perm V) :
    σ.permMatrix R * G.adjMatrix R = G.adjMatrix R * σ.permMatrix R ↔
      ∀ x y, G.Adj (σ x) (σ y) ↔ G.Adj x y := by
  sorry

/-- **1.2** Automorphisms permute each adjacency eigenspace. -/
theorem adjMatrix_mulVec_comp_symm (φ : G ≃g G) {θ : ℝ} {f : V → ℝ}
    (hf : G.adjMatrix ℝ *ᵥ f = θ • f) :
    G.adjMatrix ℝ *ᵥ (f ∘ φ.symm) = θ • (f ∘ φ.symm) := by
  sorry

/-- **1.2 (Brouwer–Haemers, Corollary 1.6.1; Biggs, Theorem 15.4).** If every adjacency
eigenvalue is simple, every automorphism is an involution or the identity. -/
theorem mul_self_eq_one_of_injective_adjEigenvalues (h : Function.Injective (adjEigenvalues G))
    (φ : G ≃g G) : φ * φ = 1 := by
  sorry

/-- **1.2** If every adjacency eigenvalue is simple, the automorphism group is abelian; with
`mul_self_eq_one_of_injective_adjEigenvalues` it is an elementary abelian `2`-group. -/
theorem commute_of_injective_adjEigenvalues (h : Function.Injective (adjEigenvalues G))
    (φ ψ : G ≃g G) : φ * ψ = ψ * φ := by
  sorry

end Matrix

/-! ### 1.3 Kneser graphs -/

/-- **1.3** An equivalence of the ground sets induces an isomorphism of the Kneser graphs. -/
def kneserGraphIsoOfEquiv {α β : Type*} (k : ℕ) (e : α ≃ β) :
    kneserGraph α k ≃g kneserGraph β k := by
  let f : {s : Finset α | s.card = k} ≃ {s : Finset β | s.card = k} :=
    (Equiv.finsetCongr e).subtypeEquiv fun _ ↦ by simp [Equiv.finsetCongr_apply]
  refine ⟨f, fun {u w} ↦ ?_⟩
  have h (s : {s : Finset α | s.card = k}) : (f s).val = s.val.map e.toEmbedding := rfl
  dsimp only [kneserGraph, kneserGraphOf]
  rw [h u, h w, Finset.disjoint_map]
  exact and_congr_left' f.injective.ne_iff

/-- **1.3** Permutations of the ground set act transitively on the vertices of a Kneser graph,
for every ground type and every `k`. -/
theorem isVertexTransitive_kneserGraph (α : Type*) (k : ℕ) :
    IsVertexTransitive (kneserGraph α k) := by
  sorry

/-! ## Layer 2: walk-regular graphs -/

section WalkRegular

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 2.1 Walk counts and spectral projections -/

/-- **2.1** A graph is walk-regular when, for each length `h`, the number of closed walks of
length `h` at a vertex does not depend on the vertex. -/
def IsWalkRegular : Prop :=
  ∀ (h : ℕ) (x y : V), (G.finsetWalkLength h x x).card = (G.finsetWalkLength h y y).card

/-- **2.1** Walk-regularity in terms of the diagonal of the powers of `A`, over any commutative
semiring of characteristic zero. A sanity check of the definition of `IsWalkRegular`, proved
here; not a target. -/
theorem isWalkRegular_iff_adjMatrix_pow {R : Type*} [CommSemiring R] [CharZero R] :
    IsWalkRegular G ↔ ∀ (h : ℕ) (x y : V), (G.adjMatrix R ^ h) x x = (G.adjMatrix R ^ h) y y := by
  simp [IsWalkRegular, adjMatrix_pow_apply_eq_card_walk]

/-- **2.1 (Cvetković–Rowlinson–Simić, *Eigenspaces*, (4.2.4); Biggs, 2j).** The spectral
decomposition of the powers of `A`: `Aʰ = ∑_θ θʰ P_θ` over the distinct eigenvalues, for every
`h ≥ 0`; at `h = 0` the projections sum to the identity. -/
theorem adjMatrix_pow_eq_sum_adjEigenspaceProjection (h : ℕ) :
    G.adjMatrix ℝ ^ h =
      ∑ θ ∈ (adjSpectrum G).toFinset, θ ^ h • adjEigenspaceProjection G θ := by
  sorry

/-! ### 2.2 Vertex-deleted subgraphs -/

/-- **2.2 (Cvetković–Rowlinson–Simić, *Eigenspaces*, (4.2.8)).** The characteristic polynomial
of a vertex-deleted graph is that of the graph times the diagonal of the resolvent,
`p_{Γ - x}(t) = p_Γ(t) ∑_θ (P_θ)_{xx} / (t - θ)` off the spectrum. -/
theorem eval_charpoly_submatrix_compl (x : V) {t : ℝ} (ht : t ∉ adjSpectrum G) :
    ((G.adjMatrix ℝ).submatrix (Subtype.val : {y // y ≠ x} → V) Subtype.val).charpoly.eval t =
      (G.adjMatrix ℝ).charpoly.eval t *
        ∑ θ ∈ (adjSpectrum G).toFinset, adjEigenspaceProjection G θ x x / (t - θ) := by
  sorry

/-! ### 2.3 Vertex-transitive and regular graphs -/

/-- **2.3** Walk-regular graphs are regular (closed walks of length `2`). -/
theorem IsWalkRegular.exists_isRegularOfDegree {G : _root_.SimpleGraph V} [DecidableRel G.Adj]
    (h : IsWalkRegular G) : ∃ k, G.IsRegularOfDegree k := by
  sorry

end WalkRegular

/-! ## Layer 3: Cayley graphs and regular actions -/

section Cayley

variable {Γ : Type*} [Group Γ]

/-! ### 3.1 Cayley graphs -/

/-- **3.1 (Brouwer–Haemers, §6.3).** The Cayley graph of a symmetric `S` avoiding `1` is
`|S|`-regular. -/
theorem isRegularOfDegree_mulCayley [Fintype Γ] [DecidableEq Γ] {S : Finset Γ}
    (hS : S⁻¹ = S) (h1 : (1 : Γ) ∉ S) : (mulCayley (S : Set Γ)).IsRegularOfDegree S.card := by
  sorry

/-- **3.1 (Brouwer–Haemers, §6.3).** A Cayley graph is connected exactly when its connection set
generates the group. -/
theorem connected_mulCayley_iff (S : Set Γ) :
    (mulCayley S).Connected ↔ Subgroup.closure S = ⊤ := by
  sorry

/-! ### 3.2 The left regular action and Sabidussi's theorem -/

/-- **3.2** Left multiplication by `g` as an automorphism of a Cayley graph. -/
def mulLeftIso (S : Set Γ) (g : Γ) : mulCayley S ≃g mulCayley S where
  toEquiv := Equiv.mulLeft g
  map_rel_iff' := mulCayley_adj_mul_iff_right

/-- **3.2** Left multiplication as a homomorphism into the automorphism group. -/
def mulLeftHom (S : Set Γ) : Γ →* (mulCayley S ≃g mulCayley S) where
  toFun := mulLeftIso S
  map_one' := by ext; simp [mulLeftIso]
  map_mul' g h := by ext; simp [mulLeftIso]; rfl

/-- **3.2 (Godsil–Royle, Theorem 3.1.2 and Lemma 3.7.1).** Left multiplication is a regular
action by automorphisms: for any two vertices exactly one group element carries the first to the
second. A sanity check of the definition of `mulLeftHom`, proved here; not a target. -/
theorem existsUnique_mulLeftHom_apply_eq (S : Set Γ) (x y : Γ) :
    ∃! g : Γ, mulLeftHom S g x = y :=
  ⟨y * x⁻¹, inv_mul_cancel_right y x, fun _ hg => eq_mul_inv_of_mul_eq hg⟩

/-- **3.2** The connection set of an action at a base vertex `v`: the group elements moving `v`
to a neighbour. -/
def cayleySet (Γ : Type*) [Group Γ] {V : Type*} (G : _root_.SimpleGraph V) [MulAction Γ V]
    (v : V) : Set Γ :=
  {g | G.Adj (g • v) v}

/-- **3.2 (Sabidussi; Godsil–Royle, Lemma 3.7.2).** A graph with a regular group of
automorphisms is the Cayley graph of that group with respect to `cayleySet Γ G v`, which is
symmetric and avoids `1`; the isomorphism is `g ↦ g • v`. -/
theorem nonempty_iso_mulCayley_of_regular {V : Type*} (G : _root_.SimpleGraph V) [MulAction Γ V]
    (hact : ∀ (g : Γ) ⦃x y : V⦄, G.Adj x y → G.Adj (g • x) (g • y))
    [MulAction.IsPretransitive Γ V] [IsCancelSMul Γ V] (v : V) :
    (cayleySet Γ G v)⁻¹ = cayleySet Γ G v ∧ (1 : Γ) ∉ cayleySet Γ G v ∧
      ∃ e : mulCayley (cayleySet Γ G v) ≃g G, ∀ g, e g = g • v := by
  sorry

/-- **3.2 (Sabidussi; Alspach, Theorem 2.2).** A graph on a nonempty vertex type is a Cayley
graph of some group exactly when its automorphism group has a subgroup acting regularly on the
vertices. -/
theorem exists_iso_mulCayley_iff {V : Type u} [Nonempty V] (G : _root_.SimpleGraph V) :
    (∃ (Γ' : Type u) (_ : Group Γ') (S : Set Γ'), Nonempty (mulCayley S ≃g G)) ↔
      ∃ H : Subgroup (G ≃g G), ∀ x y : V, ∃! h : H, (h : G ≃g G) x = y := by
  sorry

/-! ### 3.3 Normal Cayley graphs and circulants -/

/-- **3.3** When the connection set is closed under conjugation, right multiplications are
automorphisms as well. -/
theorem mulCayley_adj_mul_right_iff {S : Set Γ} (hconj : ∀ g, ∀ s ∈ S, g * s * g⁻¹ ∈ S)
    (g x y : Γ) : (mulCayley S).Adj (x * g) (y * g) ↔ (mulCayley S).Adj x y := by
  sorry

/-- **3.3** Circulant graphs are the additive Cayley graphs of commutative groups. A sanity
check comparing Mathlib's two definitions, proved here; not a target. -/
theorem circulantGraph_eq_addCayley {A : Type*} [AddCommGroup A] (s : Set A) :
    circulantGraph s = addCayley s := by
  ext x y; simp [circulantGraph, addCayley_adj, neg_add_eq_sub]; grind

end Cayley

/-! ## Layer 4: vertex-transitive graphs and Cayley graphs -/

/-! ### 4.1 Retractions onto Cayley graphs -/

section Retract

variable {V : Type u} [Fintype V] (G : _root_.SimpleGraph V)

/-- **4.1 (Godsil–Royle, Theorem 3.9.1).** A finite vertex-transitive graph on a nonempty vertex
type is a retract of a Cayley graph of a finite group: there are homomorphisms `f` into the
Cayley graph and `r` back with `r ∘ f = id`. Godsil–Royle assume connectivity, which the route
does not use. -/
theorem exists_retraction_mulCayley [Nonempty V] (hvt : IsVertexTransitive G) :
    ∃ (Γ' : Type u) (_ : Group Γ') (_ : Fintype Γ') (S : Set Γ') (f : G →g mulCayley S)
      (r : mulCayley S →g G), S⁻¹ = S ∧ (1 : Γ') ∉ S ∧ ∀ x, r (f x) = x := by
  sorry

end Retract

/-! ### 4.2 The Petersen graph -/

/-- **4.2 (Godsil–Royle, §4.4).** The automorphism group of the Petersen graph has order `120`;
the permutations of `Fin 5`, through `kneserGraphIsoOfEquiv`, give all of it. -/
theorem card_aut_petersenGraph : Nat.card (petersenGraph ≃g petersenGraph) = 120 ∧
    Function.Bijective (fun σ : Equiv.Perm (Fin 5) ↦ kneserGraphIsoOfEquiv 2 σ) := by
  sorry

/-- **4.2 (Godsil–Royle, Lemma 3.1.3).** The Petersen graph is not a Cayley graph. -/
theorem not_exists_iso_mulCayley_petersenGraph :
    ¬ ∃ (Γ' : Type) (_ : Group Γ') (S : Set Γ'), Nonempty (mulCayley S ≃g petersenGraph) := by
  sorry

/-! ## Layer 5: Cayley spectra -/

/-! ### 5.1 Commutative groups -/

/-- **5.1 (Brouwer–Haemers, §1.4.9; Krebs–Shaheen, Corollary 7.14).** For a finite commutative
group, a symmetric `S` avoiding `0` and a character `ψ`, the vector `ψ` is an eigenvector of the
Cayley graph with eigenvalue `∑_{s ∈ S} ψ(s)`; the characteristic polynomial is the product of
the factors `X - ∑_{s ∈ S} ψ(s)` over all characters. -/
theorem adjMatrix_addCayley_mulVec_addChar {A : Type*} [AddCommGroup A] [Fintype A]
    [DecidableEq A] {S : Finset A} (hS : -S = S) (h0 : (0 : A) ∉ S) :
    (∀ ψ : AddChar A ℂ,
        (addCayley (S : Set A)).adjMatrix ℂ *ᵥ ⇑ψ = (∑ s ∈ S, ψ s) • ⇑ψ) ∧
      ((addCayley (S : Set A)).adjMatrix ℂ).charpoly =
        ∏ ψ : AddChar A ℂ, (X - C (∑ s ∈ S, ψ s)) := by
  sorry

/-! ### 5.2 The block decomposition and 5.3 normal connection sets -/

section Spectra

variable {Γ : Type*} [Group Γ] [Fintype Γ] [DecidableEq Γ] {ι : Type*} [Fintype ι]
  {W : ι → Type*} [∀ i, AddCommGroup (W i)] [∀ i, Module ℂ (W i)]
  [∀ i, FiniteDimensional ℂ (W i)]

/-- **5.2 (Krebs–Shaheen, Proposition 7.1).** For a complete family of irreducible complex
representations `ρ i`, the characteristic polynomial of a Cayley graph is the product of the
characteristic polynomials of the blocks `M_i = ∑_{s ∈ S} ρ_i(s)`, each to the power
`dim ρ_i`; equivalently the adjacency spectrum is the union of the spectra of the blocks, each
repeated `dim ρ_i` times. -/
theorem charpoly_adjMatrix_mulCayley (ρ : ∀ i, Representation ℂ Γ (W i))
    [∀ i, (ρ i).IsIrreducible] (hind : Pairwise fun i j ↦ IsEmpty ((ρ i).Equiv (ρ j)))
    (hcard : Nat.card ι = Nat.card (ConjClasses Γ)) {S : Finset Γ} (hS : S⁻¹ = S)
    (h1 : (1 : Γ) ∉ S) :
    ((mulCayley (S : Set Γ)).adjMatrix ℂ).charpoly =
        ∏ i, (LinearMap.charpoly (∑ s ∈ S, ρ i s)) ^ Module.finrank ℂ (W i) ∧
      (adjSpectrum (mulCayley (S : Set Γ))).map ((↑) : ℝ → ℂ) =
        ∑ i, Module.finrank ℂ (W i) • (LinearMap.charpoly (∑ s ∈ S, ρ i s)).roots := by
  sorry

/-- **5.3 (Krebs–Shaheen, Proposition 7.4; Brouwer–Haemers, Proposition 6.3.1).** For a
connection set closed under conjugation, the eigenvalue `(dim ρ)⁻¹ ∑_{s ∈ S} χ_ρ(s)` occurs with
multiplicity `(dim ρ)²`. -/
theorem charpoly_adjMatrix_mulCayley_of_conj (ρ : ∀ i, Representation ℂ Γ (W i))
    [∀ i, (ρ i).IsIrreducible] (hind : Pairwise fun i j ↦ IsEmpty ((ρ i).Equiv (ρ j)))
    (hcard : Nat.card ι = Nat.card (ConjClasses Γ)) {S : Finset Γ} (hS : S⁻¹ = S)
    (h1 : (1 : Γ) ∉ S) (hconj : ∀ g, ∀ s ∈ S, g * s * g⁻¹ ∈ S) :
    ((mulCayley (S : Set Γ)).adjMatrix ℂ).charpoly =
      ∏ i, (X - C ((Module.finrank ℂ (W i) : ℂ)⁻¹ *
        ∑ s ∈ S, LinearMap.trace ℂ (W i) (ρ i s))) ^ (Module.finrank ℂ (W i) ^ 2) := by
  sorry

end Spectra

/-! ## Layer 6: connectivity, matchings and cycles of vertex-transitive graphs -/

section Connectivity

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 6.1 Edge and vertex connectivity -/

/-- **6.1 (Godsil–Royle, Lemma 3.3.3).** A connected vertex-transitive graph on at least two
vertices has edge connectivity equal to its degree. -/
theorem edgeConnectivity_eq_of_isVertexTransitive [Nontrivial V] (hG : G.Connected)
    (hvt : IsVertexTransitive G) {k : ℕ} (hk : G.IsRegularOfDegree k) :
    G.edgeConnectivity = k := by
  sorry

/-- **6.1 (Godsil–Royle, Theorem 3.4.2).** A connected vertex-transitive graph of degree `k`
on at least three vertices has vertex connectivity at least `2 (k + 1) / 3`. -/
theorem two_mul_succ_le_three_mul_vertexConnectivity (hG : G.Connected)
    (hvt : IsVertexTransitive G) {k : ℕ} (hk : G.IsRegularOfDegree k)
    (hV : 3 ≤ Fintype.card V) : (2 * (k + 1) : ℕ∞) ≤ 3 * G.vertexConnectivity := by
  sorry

/-! ### 6.2 Matchings -/

/-- **6.2 (Godsil–Royle, §3.5, the remark before Theorem 3.5.1).** In a connected
vertex-transitive graph with an odd
number of vertices, every vertex is missed by a matching that covers all the other vertices. -/
theorem exists_isMatching_verts_eq_compl_singleton (hG : G.Connected)
    (hvt : IsVertexTransitive G) (hodd : Odd (Fintype.card V)) (v : V) :
    ∃ M : G.Subgraph, M.IsMatching ∧ M.verts = {v}ᶜ := by
  sorry

/-- **6.2 (Godsil–Royle, Theorem 3.5.1).** In a connected vertex-transitive graph every edge
lies in a maximum matching. -/
theorem exists_maximum_matching_mem_edgeSet (hG : G.Connected) (hvt : IsVertexTransitive G)
    {e : Sym2 V} (he : e ∈ G.edgeSet) :
    ∃ M : G.Subgraph, M.IsMatching ∧ e ∈ M.edgeSet ∧
      ∀ M' : G.Subgraph, M'.IsMatching → M'.edgeSet.ncard ≤ M.edgeSet.ncard := by
  sorry

/-! ### 6.3 Long cycles -/

/-- **6.3 (Babai; Godsil–Royle, Theorem 3.6.3).** A connected vertex-transitive graph on
`n ≥ 3` vertices has a cycle of length at least `√(3n)`. -/
theorem exists_isCycle_three_mul_card_le_length_sq (hG : G.Connected)
    (hvt : IsVertexTransitive G) (hV : 3 ≤ Fintype.card V) :
    ∃ (u : V) (c : G.Walk u u), c.IsCycle ∧ 3 * Fintype.card V ≤ c.length ^ 2 := by
  sorry

end Connectivity

/-! ## Layer 7: `s`-arcs and Tutte's theorem -/

section Arcs

variable {V : Type*} (G : _root_.SimpleGraph V)

/-! ### 7.1 `s`-arcs -/

/-- **7.1** An `s`-arc is a sequence `v₀, …, v_s` of vertices with consecutive vertices
adjacent and `v_{i-1} ≠ v_{i+1}`. -/
def IsSArc (s : ℕ) (a : Fin (s + 1) → V) : Prop :=
  (∀ i : Fin s, G.Adj (a i.castSucc) (a i.succ)) ∧
    ∀ i j : Fin (s + 1), (j : ℕ) = i + 2 → a i ≠ a j

/-- **7.1** A graph is `s`-arc-transitive when its automorphism group acts transitively on its
`s`-arcs. -/
def IsSArcTransitive (s : ℕ) : Prop :=
  ∀ a b : Fin (s + 1) → V, IsSArc G s a → IsSArc G s b → ∃ φ : G ≃g G, ⇑φ ∘ a = b

/-- **7.1 (Godsil–Royle, §4.1).** `0`-arc-transitivity is vertex-transitivity and
`1`-arc-transitivity is arc-transitivity. -/
theorem isSArcTransitive_zero_iff_and_one_iff :
    (IsSArcTransitive G 0 ↔ IsVertexTransitive G) ∧
      (IsSArcTransitive G 1 ↔ IsArcTransitive G) := by
  sorry

/-- **7.1** An `(s + 1)`-arc-transitive graph of minimum degree at least `2` is
`s`-arc-transitive. -/
theorem IsSArcTransitive.of_succ [Fintype V] [DecidableRel G.Adj] {s : ℕ}
    (h : IsSArcTransitive G (s + 1)) (hdeg : ∀ v, 2 ≤ G.degree v) : IsSArcTransitive G s := by
  sorry

/-! ### 7.2 The girth bound and Tutte's theorem -/

/-- **7.2 (Tutte; Godsil–Royle, Lemma 4.1.3; Biggs, Proposition 17.2).** A finite
`s`-arc-transitive graph of minimum degree at least `3` has extended girth at least `2s - 2`.
With `egirth` (`⊤` for a graph without cycles) the statement holds on the empty vertex type as
well. -/
theorem IsSArcTransitive.le_egirth [Fintype V] [DecidableRel G.Adj] {s : ℕ}
    (hs : IsSArcTransitive G s) (h3 : ∀ v, 3 ≤ G.degree v) :
    ((2 * s - 2 : ℕ) : ℕ∞) ≤ G.egirth := by
  sorry

/-- **7.2 (Tutte; Biggs, Theorem 18.6; Praeger, Theorem 2.3).** A finite connected cubic
`s`-arc-transitive graph has `s ≤ 5`. -/
theorem le_five_of_isSArcTransitive [Fintype V] [DecidableRel G.Adj] (hG : G.Connected)
    (h3 : G.IsRegularOfDegree 3) {s : ℕ} (hs : IsSArcTransitive G s) : s ≤ 5 := by
  sorry

end Arcs

/-- **7.2 (Godsil–Royle, Chapter 4, Exercise 5; Biggs, p. 133).** The Petersen graph is
`3`-arc-transitive. -/
theorem isSArcTransitive_petersenGraph_three : IsSArcTransitive petersenGraph 3 := by
  sorry

/-! ## Layer 8: line graphs and Whitney's theorems -/

section Whitney

/-- **8.1** The paw: a triangle `0, 1, 2` with the pendant edge `2 3`. -/
def pawGraph : _root_.SimpleGraph (Fin 4) :=
  fromEdgeSet {s(0, 1), s(1, 2), s(0, 2), s(2, 3)}

/-- **8.1** The diamond `K₄ - e`: the complete graph on four vertices without the edge `0 1`. -/
def diamondGraph : _root_.SimpleGraph (Fin 4) :=
  (⊤ : _root_.SimpleGraph (Fin 4)).deleteEdges {s(0, 1)}

variable {V W : Type*} [Finite V] [Finite W]

/-! ### 8.1 Whitney's isomorphism theorem -/

/-- **8.1 (Whitney; Knauer–Knauer, Theorem 5.2.8).** Connected graphs with isomorphic line
graphs are isomorphic, except for the pair `K₃`, `K_{1,3}`. -/
theorem nonempty_iso_of_lineGraph_iso {G : _root_.SimpleGraph V} {G' : _root_.SimpleGraph W}
    (hG : G.Connected) (hG' : G'.Connected) (e : G.lineGraph ≃g G'.lineGraph)
    (hexc : ¬ (Nonempty (G ≃g (⊤ : _root_.SimpleGraph (Fin 3))) ∧
        Nonempty (G' ≃g completeBipartiteGraph (Fin 1) (Fin 3))) ∧
      ¬ (Nonempty (G' ≃g (⊤ : _root_.SimpleGraph (Fin 3))) ∧
        Nonempty (G ≃g completeBipartiteGraph (Fin 1) (Fin 3)))) :
    Nonempty (G ≃g G') := by
  sorry

/-! ### 8.2 Whitney's automorphism theorem -/

/-- **8.2** The homomorphism `Aut Γ → Aut L(Γ)` given by Mathlib's `SimpleGraph.Iso.lineGraph`. -/
def lineGraphAutHom (G : _root_.SimpleGraph V) : (G ≃g G) →* (G.lineGraph ≃g G.lineGraph) where
  toFun φ := φ.lineGraph
  map_one' := by
    apply RelIso.ext
    intro e
    apply Subtype.ext
    simp [Iso.lineGraph, Copy.lineGraph, Copy.toLineGraphEmbedding]
  map_mul' φ ψ := by
    apply RelIso.ext
    intro e
    apply Subtype.ext
    simp [Iso.lineGraph, Copy.lineGraph, Copy.toLineGraphEmbedding, Sym2.map_map, RelIso.mul_apply]

/-- **8.2 (Whitney; Knauer–Knauer, Corollary 7.1.5 and Theorem 7.1.6).** For a connected
graph other than `K₂`, `K₄`, the diamond and the paw, every automorphism of the line graph is
induced by a unique automorphism of the graph. -/
theorem bijective_lineGraphAutHom (G : _root_.SimpleGraph V) (hG : G.Connected)
    (h2 : IsEmpty (G ≃g (⊤ : _root_.SimpleGraph (Fin 2))))
    (h4 : IsEmpty (G ≃g (⊤ : _root_.SimpleGraph (Fin 4))))
    (hd : IsEmpty (G ≃g diamondGraph)) (hp : IsEmpty (G ≃g pawGraph)) :
    Function.Bijective (lineGraphAutHom G) := by
  sorry

end Whitney

/-! ## Layer 9: Frucht's theorem and asymmetry -/

section Frucht

/-! ### 9.1 Frucht's theorem -/

/-- **9.1 (Frucht; Biggs, p. 117; Cameron, p. 142).** Every finite group is the automorphism
group of a finite cubic graph. -/
theorem exists_cubic_aut_mulEquiv (Γ' : Type u) [Group Γ'] [Finite Γ'] :
    ∃ (V : Type u) (_ : Fintype V) (X : _root_.SimpleGraph V),
      (∀ v, (X.neighborSet v).ncard = 3) ∧ Nonempty ((X ≃g X) ≃* Γ') := by
  sorry

/-! ### 9.2 Asymmetry -/

/-- **9.2** Isomorphism of graphs on a fixed vertex type, as a setoid. -/
def isoSetoid (V : Type*) : Setoid (_root_.SimpleGraph V) where
  r G H := Nonempty (G ≃g H)
  iseqv := ⟨fun _ ↦ ⟨Iso.refl⟩, fun ⟨e⟩ ↦ ⟨e.symm⟩, fun ⟨e⟩ ⟨f⟩ ↦ ⟨e.trans f⟩⟩

open scoped Classical in
/-- **9.2 (Erdős–Rényi; Cameron, Theorem 3.1).** Almost all labelled graphs are asymmetric. -/
theorem tendsto_card_nontrivialAut_div_card :
    Tendsto (fun n : ℕ ↦
      ((Finset.univ.filter fun G : _root_.SimpleGraph (Fin n) ↦ ∃ φ : G ≃g G, φ ≠ 1).card : ℝ) /
        Fintype.card (_root_.SimpleGraph (Fin n))) atTop (𝓝 0) := by
  sorry

/-- **9.2 (Cameron, Theorem 3.1).** Almost all isomorphism classes of graphs are asymmetric. -/
theorem tendsto_card_nontrivialAut_div_card_isoClasses :
    Tendsto (fun n : ℕ ↦
      (Nat.card {c : Quotient (isoSetoid (Fin n)) //
          ∃ G, Quotient.mk (isoSetoid (Fin n)) G = c ∧ ∃ φ : G ≃g G, φ ≠ 1} : ℝ) /
        Nat.card (Quotient (isoSetoid (Fin n)))) atTop (𝓝 0) := by
  sorry

end Frucht

end SimpleGraph

end TauCetiRoadmap.GraphSymmetryAndCayleyGraphs

/-! ## Library declarations consumed -/

-- Mathlib
#check @RelIso.applyMulAction
#check @SimpleGraph.Iso.reindex_adjMatrix
#check @SimpleGraph.Iso.degree_eq
#check @SimpleGraph.adjMatrix_pow_apply_eq_card_walk
#check @SimpleGraph.finsetWalkLength
#check @MulAction.IsPretransitive
#check @IsCancelSMul
#check @MulAction.orbit
#check @Equiv.Perm.permMatrix
#check @Equiv.Perm.exists_map_finset_eq
#check @Matrix.IsHermitian.spectral_theorem
#check @Matrix.IsHermitian.eigenvectorBasis
#check @Matrix.adjugate_fin_succ_eq_det_submatrix
#check @Matrix.adjugate_submatrix_equiv_self
#check @Matrix.charpoly_map
#check @Matrix.charpoly
#check @Matrix.submatrix
#check @SimpleGraph.fromRel
#check @SimpleGraph.Walk.map
#check @SimpleGraph.mulCayley
#check @SimpleGraph.mulCayley_adj
#check @SimpleGraph.mulCayley_adj_mul_iff_right
#check @SimpleGraph.mulCayley_compl_singleton_one
#check @SimpleGraph.addCayley
#check @SimpleGraph.circulantGraph
#check @SimpleGraph.cycleGraph_eq_circulantGraph
#check @SimpleGraph.boxProd
#check @AddChar
#check @AddChar.complexBasis
#check @SimpleGraph.lineGraph
#check @SimpleGraph.Iso.lineGraph
#check @SimpleGraph.Subgraph.IsMatching
#check @SimpleGraph.Walk.IsCycle
#check @SimpleGraph.Walk.getVert
#check @SimpleGraph.egirth
#check @Representation.IsIrreducible
#check @Representation.Equiv
#check @Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed
#check @LinearMap.charpoly
#check @exists_prime_orderOf_dvd_card'

-- Tau Ceti
#check @SimpleGraph.degree_eq_of_pretransitive
#check @SimpleGraph.edgeConnectivity
#check @SimpleGraph.edgeConnectivity_le_minDegree
#check @SimpleGraph.vertexConnectivity
#check @SimpleGraph.vertexConnectivity_top
#check @SimpleGraph.vertexConnectivity_le_edgeConnectivity
#check @TauCeti.ClassFunction.exists_nonempty_equiv
#check @TauCeti.exists_algEquiv_pi_matrix
#check @TauCeti.Representation.asAlgebraHom_center
#check @TauCeti.Representation.trace_asAlgebraHom_center
