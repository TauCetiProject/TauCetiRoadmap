module

import Mathlib
import TauCeti.MeasureTheory.Group.ErgodicExtreme

/-!
# Dimer models and lozenge tilings: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished roadmap
proves, each with `sorry`, together with the simple definitions their statements need. Every
definition has a real body on native carriers: the triangular lattice on `ℤ × ℤ`, sets of edges
for tilings, `TriEdge → Bool` for configurations, Mathlib's simple graphs, matrices, Markov
kernels, measures, curve integrals and ergodicity, and Tau Ceti's convex set of invariant
probability measures.

Stated here: tilings are the perfect matchings of the dual hexagonal graph (Layer 1); plane tilings
are height functions, flip connectivity and Thurston's criterion (Layer 2); Kasteleyn's theorem and
the determinantal local statistics on finite simply connected regions (Layer 3); the face property
and the ergodicity criterion for invariant Gibbs measures of a specification on a subshift over
any alphabet with a proper countable-group action (Layer 4); the face property for invariant dimer
Gibbs measures of a positive edge weight on a locally finite graph with a proper action of a
countable infinite group by automorphisms, and the face property and the ergodicity criterion for
invariant lozenge Gibbs measures (Layer 5); the classification of invariant Gibbs measures on the
edges of the slope triangle with two ergodic ones at every non-corner edge slope (Layer 6); torus
limits are invariant Gibbs measures of the prescribed slope (Layer 7); the torus partition function
as a signed sum of four determinants (Layer 8); an ergodic Gibbs measure of every slope and the
incomplete beta process of every complex slope (Layer 9); local limits of uniform measures on
tilings of exhausting regions are Gibbs (Layer 10).

Every headline theorem named in the README's summary is statable at the pins and is stated here;
none is omitted for want of a carrier. The ergodicity criterion of README 5.3 for a general
periodic graph is `gibbsInvariant_extreme_iff_ergodic` for the dimer specification, and its
lozenge instance is `lozengeGibbs_extreme_iff_ergodic`. Dimer Gibbs measures are stated in the
cylinder form of README 5.2, which needs no conditional probability and no constructed family of
kernels. Weak limits of measures on the compact space `TriEdge → Bool` are expressed through
convergence of cylinder probabilities, which is weak convergence there (README 4.4).
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology Complex
open scoped ENNReal

namespace TauCetiRoadmap.DimerModelsAndLozengeTilings

/-! ## Layer 1: the triangular lattice and lozenge tilings -/

/-- The positive directions `e₁ = (1,0)`, `e₂ = (0,1)`, `e₃ = (1,1)` of the triangular lattice on
`ℤ × ℤ`. The direction `k ∈ {1, 2, 3}` of README is stored as the index `k - 1 : Fin 3`. -/
def latticeDir : Fin 3 → ℤ × ℤ := ![(1, 0), (0, 1), (1, 1)]

/-- An edge of the triangular lattice: the segment from `v` to `v + latticeDir k`. Every edge has
exactly one such name (README, Conventions). -/
@[ext]
structure TriEdge where
  /-- The initial vertex. -/
  v : ℤ × ℤ
  /-- The direction, `0, 1, 2` for README's `1, 2, 3`. -/
  k : Fin 3
  deriving DecidableEq

/-- The final vertex `v + e_k` of an edge. -/
def TriEdge.target (e : TriEdge) : ℤ × ℤ := e.v + latticeDir e.k

/-- A face of the triangular lattice: the white face `W(v) = {v, v + e₁, v + e₃}` when `isWhite`,
the black face `B(v) = {v, v + e₂, v + e₃}` otherwise. -/
@[ext]
structure TriFace where
  /-- The lower-left vertex. -/
  v : ℤ × ℤ
  /-- The colour. -/
  isWhite : Bool
  deriving DecidableEq

/-- The three edges of a face: `(v,1)`, `(v+e₁,2)`, `(v,3)` for `W(v)` and `(v,2)`, `(v+e₂,1)`,
`(v,3)` for `B(v)` (README, Conventions; aggarwal2023 lines 324–337). -/
def TriFace.edges (f : TriFace) : Finset TriEdge :=
  if f.isWhite then {⟨f.v, 0⟩, ⟨f.v + (1, 0), 1⟩, ⟨f.v, 2⟩}
  else {⟨f.v, 1⟩, ⟨f.v + (0, 1), 0⟩, ⟨f.v, 2⟩}

/-- The dual hexagonal graph `hexGraph` on the faces: two faces are adjacent when they are distinct
and share an edge (README 1.2; gorin2021 lines 690–700). -/
def hexGraph : SimpleGraph TriFace :=
  SimpleGraph.fromRel fun f g => ∃ e, e ∈ f.edges ∧ e ∈ g.edges

/-- `ℤ²` acts on edges by translation, `w +ᵥ (v, k) = (w + v, k)`. -/
instance : AddAction (ℤ × ℤ) TriEdge where
  vadd w e := ⟨w + e.v, e.k⟩
  zero_vadd e := TriEdge.ext (zero_add e.v) rfl
  add_vadd w w' e := TriEdge.ext (add_assoc w w' e.v) rfl

/-- `ℤ²` acts on configurations by `(w +ᵥ ω) e = ω (-w +ᵥ e)`, so that the edge set of `w +ᵥ ω` is
the translate by `w` of the edge set of `ω` (Mathlib's `arrowAddAction`). -/
instance : AddAction (ℤ × ℤ) (TriEdge → Bool) := arrowAddAction

/-- `IsTiling R M`: every edge of `M` has both of its faces in the region `R`, and every face of
`R` contains exactly one edge of `M` (README 1.4; aggarwal2023 lines 342–364). A plane tiling is a
tiling of `Set.univ`. -/
def IsTiling (R : Set TriFace) (M : Set TriEdge) : Prop :=
  (∀ e ∈ M, ∀ f : TriFace, e ∈ f.edges → f ∈ R) ∧ ∀ f ∈ R, ∃! e, e ∈ M ∧ e ∈ f.edges

/-- The spanning subgraph of `SimpleGraph.induce R hexGraph` whose edges are the pairs of faces of
`R` sharing an edge of `M`. -/
def tilingSubgraph (R : Set TriFace) (M : Set TriEdge) : (SimpleGraph.induce R hexGraph).Subgraph :=
  SimpleGraph.toSubgraph
    (SimpleGraph.fromRel fun f g : R => ∃ e ∈ M, e ∈ f.1.edges ∧ e ∈ g.1.edges) (by
      rintro f g ⟨hne, h⟩
      refine ⟨fun hfg => hne (Subtype.ext hfg), ?_⟩
      rcases h with ⟨e, -, h₁, h₂⟩ | ⟨e, -, h₁, h₂⟩
      · exact Or.inl ⟨e, h₁, h₂⟩
      · exact Or.inr ⟨e, h₁, h₂⟩)

/-- **Tilings are perfect matchings** (README 1.5; aggarwal2023 lines 342–364; gorin2021 lines
698–702; kenyon2009 lines 96–113). For every region `R`, finite or infinite,
`M ↦ tilingSubgraph R M` is a bijection from the tilings of `R` onto the perfect matchings of
`SimpleGraph.induce R hexGraph`. -/
theorem tilingSubgraph_bijOn (R : Set TriFace) :
    Set.BijOn (tilingSubgraph R) {M | IsTiling R M} {P | P.IsPerfectMatching} := by
  sorry

/-! ## Layer 2: height functions, simple connectivity and Thurston's criterion -/

/-- The edges of the faces of a region. -/
def regionEdges (R : Set TriFace) : Set TriEdge :=
  {e | ∃ f ∈ R, e ∈ f.edges}

/-- The boundary edges of a region: its edges lying in a face outside it. -/
def boundaryEdges (R : Set TriFace) : Set TriEdge :=
  {e | e ∈ regionEdges R ∧ ∃ f ∉ R, e ∈ f.edges}

/-- The boundary vertices of a region: the endpoints of its boundary edges. -/
def boundaryVertices (R : Set TriFace) : Set (ℤ × ℤ) :=
  {u | ∃ e ∈ boundaryEdges R, u = e.v ∨ u = e.target}

/-- The graph on `ℤ × ℤ` whose edges are the edges of the region `R`. -/
def regionGraph (R : Set TriFace) : SimpleGraph (ℤ × ℤ) :=
  SimpleGraph.fromRel fun u u' => ∃ e ∈ regionEdges R, e.v = u ∧ e.target = u'

/-- An integer edge cochain `c` (the increment from `v` to `v + e_k`) is closed on `R`: round
every white face `c(v,1) + c(v+e₁,2) = c(v,3)` and round every black face
`c(v,2) + c(v+e₂,1) = c(v,3)`. -/
def IsClosedOn (R : Set TriFace) (c : TriEdge → ℤ) : Prop :=
  ∀ f ∈ R, if f.isWhite then c ⟨f.v, 0⟩ + c ⟨f.v + (1, 0), 1⟩ = c ⟨f.v, 2⟩
    else c ⟨f.v, 1⟩ + c ⟨f.v + (0, 1), 0⟩ = c ⟨f.v, 2⟩

/-- **Combinatorial simple connectivity** (README 2.1): `R` is nonempty, its edges form a connected
graph, and every cochain closed on `R` is the coboundary of an integer function on the vertices. -/
def IsSimplyConnectedRegion (R : Set TriFace) : Prop :=
  R.Nonempty ∧
    (∀ e ∈ regionEdges R, ∀ e' ∈ regionEdges R, (regionGraph R).Reachable e.v e'.v) ∧
    ∀ c : TriEdge → ℤ, IsClosedOn R c →
      ∃ g : ℤ × ℤ → ℤ, ∀ e ∈ regionEdges R, c e = g e.target - g e.v

/-- The neutral increment `c₀`: `0` along `e₁` and `e₂`, `1` along `e₃`. -/
def neutralIncrement (k : Fin 3) : ℤ :=
  if k = 2 then 1 else 0

/-- A height function on the plane: its increments along `e₁`, `e₂`, `e₃` lie in `{0, 1}`. -/
def IsHeightFunction (H : ℤ × ℤ → ℤ) : Prop :=
  ∀ u k, 0 ≤ H (u + latticeDir k) - H u ∧ H (u + latticeDir k) - H u ≤ 1

/-- The edge set of a height function: the edges whose increment differs from the neutral one,
`{(v,k) : H(v+e_k) - H(v) = 1 - c₀(k)}` (README 2.5; aggarwal2023 lines 395–398). -/
def tilingOfHeight (H : ℤ × ℤ → ℤ) : Set TriEdge :=
  {e | H e.target - H e.v = 1 - neutralIncrement e.k}

/-- **Plane tilings are height functions** (README 2.5; aggarwal2023 lines 384–399; gorin2021
lines 447–458; kenyon2009 lines 353–385): `tilingOfHeight` is a bijection from the height functions
vanishing at the origin onto the plane tilings. -/
theorem tilingOfHeight_bijOn :
    Set.BijOn tilingOfHeight {H | IsHeightFunction H ∧ H 0 = 0} {M | IsTiling Set.univ M} := by
  sorry

/-- A flip at a vertex `v`: the three lozenges `(v,3)`, `(v-e₁,1)`, `(v-e₂,2)` of one tiling of the
unit hexagon round `v` are exchanged for the three lozenges `(v,1)`, `(v,2)`, `(v-e₃,3)` of the
other, or conversely (README 2.8). -/
def IsFlip (M M' : Set TriEdge) : Prop :=
  ∃ v : ℤ × ℤ,
    (({⟨v, 2⟩, ⟨v - (1, 0), 0⟩, ⟨v - (0, 1), 1⟩} : Set TriEdge) ⊆ M ∧
        M' = M \ {⟨v, 2⟩, ⟨v - (1, 0), 0⟩, ⟨v - (0, 1), 1⟩} ∪ {⟨v, 0⟩, ⟨v, 1⟩, ⟨v - (1, 1), 2⟩}) ∨
      (({⟨v, 0⟩, ⟨v, 1⟩, ⟨v - (1, 1), 2⟩} : Set TriEdge) ⊆ M ∧
        M' = M \ {⟨v, 0⟩, ⟨v, 1⟩, ⟨v - (1, 1), 2⟩} ∪ {⟨v, 2⟩, ⟨v - (1, 0), 0⟩, ⟨v - (0, 1), 1⟩})

/-- **Flip connectivity** (README 2.8; gorin2021 lines 756–782; kenyon2009 lines 537–550): any two
tilings of a finite simply connected region are joined by finitely many flips. -/
theorem flip_connected (R : Finset TriFace) (hR : IsSimplyConnectedRegion (R : Set TriFace))
    {M M' : Set TriEdge} (hM : IsTiling R M) (hM' : IsTiling R M') :
    Relation.ReflTransGen IsFlip M M' := by
  sorry

/-- The number of positively oriented steps (along `+e₁`, `+e₂` or `+e₃`) of a walk in the edge
graph of a region; its minimum over walks from `u` to `u'` is the oriented distance `ρ_R(u,u')`. -/
def positiveSteps {R : Set TriFace} {u u' : ℤ × ℤ} (p : (regionGraph R).Walk u u') : ℕ :=
  (p.darts.filter fun d => ∃ k : Fin 3, d.snd = d.fst + latticeDir k).length

/-- **Thurston's criterion** (README 2.9; gorin2021 Theorem 1.4, lines 521–526; thurston1990). A
finite simply connected region is tileable iff some integer function `h` on its boundary vertices
has the neutral increment along every boundary edge and satisfies `h(u') - h(u) ≤ ρ_R(u,u')` for all
boundary vertices `u`, `u'`. -/
theorem thurston_tileable_iff (R : Finset TriFace)
    (hR : IsSimplyConnectedRegion (R : Set TriFace)) :
    (∃ M, IsTiling R M) ↔
      ∃ h : ℤ × ℤ → ℤ,
        (∀ e ∈ boundaryEdges R, h e.target - h e.v = neutralIncrement e.k) ∧
        ∀ u ∈ boundaryVertices R, ∀ u' ∈ boundaryVertices R,
          ∀ p : (regionGraph R).Walk u u', h u' - h u ≤ positiveSteps p := by
  sorry

/-! ## Layer 3: Kasteleyn theory on finite simply connected regions -/

/-- The white faces of a finite region. -/
def whiteFaces (R : Finset TriFace) : Finset TriFace :=
  R.filter fun f => f.isWhite = true

/-- The black faces of a finite region. -/
def blackFaces (R : Finset TriFace) : Finset TriFace :=
  R.filter fun f => f.isWhite = false

/-- The Kasteleyn matrix of a finite region for an edge weight `w`: rows the white faces, columns
the black faces, entry `w(e)` when the two faces share the edge `e` and `0` otherwise (README 3.1;
gorin2021 lines 1199–1215). -/
def kasteleynMatrix (R : Finset TriFace) (w : TriEdge → ℝ) :
    Matrix (whiteFaces R) (blackFaces R) ℝ :=
  Matrix.of fun f g => ∑ e ∈ f.1.edges ∩ g.1.edges, w e

/-- The partition function: the sum over the tilings of `R` of the product of the weights of their
edges. -/
def partitionFunction (R : Set TriFace) (w : TriEdge → ℝ) : ℝ :=
  ∑ᶠ (M : Set TriEdge) (_ : IsTiling R M), ∏ᶠ e ∈ M, w e

/-- **Kasteleyn's theorem** on the hexagonal lattice (README 3.2; gorin2021 Theorem 2.1, lines
714–717, and Theorem 3.1, lines 1218–1219; kenyon2009 Theorem 2, line 504; kenyon1997 Theorem 2,
lines 184–186). For a finite simply connected region, a positive edge weight and any bijection `σ`
from black to white faces, the partition function is the absolute value of the determinant of the
square Kasteleyn matrix `(f, f') ↦ K(f, σ⁻¹ f')`. -/
theorem partitionFunction_eq_abs_det (R : Finset TriFace)
    (hR : IsSimplyConnectedRegion (R : Set TriFace)) (w : TriEdge → ℝ) (hw : ∀ e, 0 < w e)
    (σ : blackFaces R ≃ whiteFaces R) :
    partitionFunction R w = |((kasteleynMatrix R w).submatrix id σ.symm).det| := by
  sorry

/-- **Local statistics on finite regions** (README 3.3; gorin2021 Theorem 3.5, lines 1281–1288;
kenyon2009 Corollary 3, lines 557–565; kenyon1997 Theorem 6, lines 362–373). For a finite simply
connected tileable region, a positive weight and pairwise distinct pairs `(f i, g i)` of a white
and a black face, the Boltzmann probability that every `f i` is matched to `g i` is
`∏ K(f i, g i) · det [K⁻¹(g i, f j)]`, where `K⁻¹(g, f) = ((K.submatrix id σ.symm)⁻¹) (σ g) f`. -/
theorem lozenge_correlation_eq_det (R : Finset TriFace)
    (hR : IsSimplyConnectedRegion (R : Set TriFace)) (hT : ∃ M, IsTiling R M) (w : TriEdge → ℝ)
    (hw : ∀ e, 0 < w e) (σ : blackFaces R ≃ whiteFaces R) {n : ℕ} (f : Fin n → whiteFaces R)
    (g : Fin n → blackFaces R) (hfg : Function.Injective fun i => (f i, g i)) :
    (∑ᶠ (M : Set TriEdge) (_ : IsTiling R M ∧ ∀ i, ∃ e ∈ M, e ∈ (f i).1.edges ∧ e ∈ (g i).1.edges),
        ∏ᶠ e ∈ M, w e) / partitionFunction R w =
      (∏ i, kasteleynMatrix R w (f i) (g i)) *
        (Matrix.of fun i j =>
          ((kasteleynMatrix R w).submatrix id σ.symm)⁻¹ (σ (g i)) (f j)).det := by
  sorry

/-! ## Layer 4: Gibbs specifications on configuration spaces -/

/-- A subshift: a closed set of configurations `I → S` invariant under the action
`(g • ω) i = ω (g⁻¹ • i)` of `Γ` induced by an action on the index set `I`. Mathlib's
`SymbolicDynamics.FullShift.MulSubshift` (additively `SymbolicDynamics.FullShift.Subshift`) is the
case `I = Γ`; here `I` may have several orbits. -/
structure Subshift (Γ I S : Type*) [Group Γ] [MulAction Γ I] [TopologicalSpace S] where
  /-- The configurations. -/
  carrier : Set (I → S)
  /-- The set of configurations is closed for the product topology. -/
  isClosed : IsClosed carrier
  /-- The set of configurations is invariant under the action. -/
  smul_mem : ∀ (g : Γ) {ω : I → S}, ω ∈ carrier → (fun i => ω (g⁻¹ • i)) ∈ carrier

/-- A subshift is used as the type of its configurations. -/
instance {Γ I S : Type*} [Group Γ] [MulAction Γ I] [TopologicalSpace S] :
    CoeSort (Subshift Γ I S) (Type _) :=
  ⟨fun X => X.carrier⟩

/-- `Γ` acts on a subshift by `(g • ω) i = ω (g⁻¹ • i)`. -/
instance {Γ I S : Type*} [Group Γ] [MulAction Γ I] [TopologicalSpace S] (X : Subshift Γ I S) :
    MulAction Γ X where
  smul g ω := ⟨fun i => ω.1 (g⁻¹ • i), X.smul_mem g ω.2⟩
  one_smul ω := Subtype.ext <| funext fun i => by
    show ω.1 ((1 : Γ)⁻¹ • i) = ω.1 i
    simp
  mul_smul g h ω := Subtype.ext <| funext fun i => by
    show ω.1 ((g * h)⁻¹ • i) = ω.1 (h⁻¹ • g⁻¹ • i)
    simp [mul_smul]

/-- The exterior σ-algebra `𝓕_{Λᶜ}` on a subshift: the trace of the σ-algebra generated by the
coordinates outside `Λ`. -/
abbrev Subshift.exterior {Γ I S : Type*} [Group Γ] [MulAction Γ I] [TopologicalSpace S]
    [MeasurableSpace S] (X : Subshift Γ I S) (Λ : Set I) : MeasurableSpace X :=
  MeasurableSpace.comap Subtype.val (cylinderEvents (X := fun _ : I => S) Λᶜ)

/-- A specification on a subshift (README 4.5; sheffield2005 Section 1.1.2, lines 303–342): a
family, indexed by the finite sets `Λ`, of Markov kernels measurable for `𝓕_{Λᶜ}` on the source,
each proper, and consistent: `γ_Λ ∘ₖ γ_Δ = γ_Δ` for `Λ ⊆ Δ`, with `γ_Λ` read as a kernel for the
full σ-algebra on its source. -/
structure Specification {Γ I S : Type*} [Group Γ] [MulAction Γ I] [TopologicalSpace S]
    [MeasurableSpace S] (X : Subshift Γ I S) where
  /-- The kernel of a finite set. -/
  kernel (Λ : Finset I) : @Kernel X X (X.exterior Λ) _
  /-- Each kernel is Markov. -/
  isMarkovKernel (Λ : Finset I) : IsMarkovKernel (kernel Λ)
  /-- Each kernel is proper: `γ_Λ (C ∩ B | ω) = 1_B(ω) γ_Λ (C | ω)` for exterior events `B`. -/
  isProper (Λ : Finset I) : (kernel Λ).IsProper
  /-- Consistency: resampling `Δ` and then `Λ ⊆ Δ` is resampling `Δ`. -/
  comp_eq ⦃Λ Δ : Finset I⦄ (h : Λ ⊆ Δ) :
    (kernel Λ).comap id (measurable_id'' (MeasurableSpace.comap_mono cylinderEvents_le_pi)) ∘ₖ
      kernel Δ = kernel Δ

/-- A probability measure is Gibbs for a specification when `μ.bind γ_Λ = μ` for every finite `Λ`
(README 4.5). -/
def Specification.IsGibbs {Γ I S : Type*} [Group Γ] [MulAction Γ I] [TopologicalSpace S]
    [MeasurableSpace S] {X : Subshift Γ I S} (γ : Specification X) (μ : Measure X) : Prop :=
  ∀ Λ : Finset I, μ.bind (γ.kernel Λ) = μ

/-- The invariant Gibbs measures `𝒢_inv(γ)`: the invariant probability measures that are Gibbs. -/
def Specification.gibbsInvariant {Γ I S : Type*} [Group Γ] [MulAction Γ I] [TopologicalSpace S]
    [MeasurableSpace S] {X : Subshift Γ I S} (γ : Specification X) : Set (Measure X) :=
  {μ | μ ∈ TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq Γ X 1 ∧ γ.IsGibbs μ}

/-- **The face property** (README 4.6(b); sheffield2005 Lemma 3.2.2, lines 1367–1371, for the
spin spaces `ℝ^m` and `ℤ^m` of lines 256–263; georgii2011 Theorem 14.15). For a countable infinite
group acting properly on a countable index set, any alphabet, finite or not, and any specification
on a subshift, equivariant or not, the invariant Gibbs measures form a face of the invariant
probability measures. -/
theorem gibbsInvariant_isExtreme {Γ I S : Type*} [Group Γ] [Countable Γ] [Infinite Γ]
    [MulAction Γ I] [Countable I] [TopologicalSpace S] [MeasurableSpace S]
    (hproper : ∀ F F' : Finset I, {g : Γ | ∃ i ∈ F, g • i ∈ F'}.Finite)
    (X : Subshift Γ I S) (γ : Specification X) :
    IsExtreme ℝ≥0∞ (TauCeti.MeasureTheory.invariantMeasuresOfMeasureUnivEq Γ X 1)
      γ.gibbsInvariant := by
  sorry

/-- **Ergodic invariant Gibbs measures are the extreme ones** (README 4.6(b); sheffield2005
Lemmas 3.2.1–3.2.2, lines 1352–1371). Under the hypotheses of `gibbsInvariant_isExtreme`, an
invariant Gibbs measure is an extreme point of `𝒢_inv(γ)` iff it is ergodic. -/
theorem gibbsInvariant_extreme_iff_ergodic {Γ I S : Type*} [Group Γ] [Countable Γ] [Infinite Γ]
    [MulAction Γ I] [Countable I] [TopologicalSpace S] [MeasurableSpace S]
    (hproper : ∀ F F' : Finset I, {g : Γ | ∃ i ∈ F, g • i ∈ F'}.Finite)
    (X : Subshift Γ I S) (γ : Specification X) {μ : Measure X}
    (hμ : μ ∈ γ.gibbsInvariant) :
    μ ∈ Set.extremePoints ℝ≥0∞ γ.gibbsInvariant ↔ ErgodicSMul Γ X μ := by
  sorry

/-! ## Layer 5: dimer models on periodic graphs -/

/-- A dimer configuration of a simple graph `G`: a configuration on the edges of `G` in which every
vertex lies in exactly one edge of value `true`, the indicator of the edge set of a perfect matching
(README 5.1; kenyon2009 lines 96–100). -/
def IsDimerConfiguration {V : Type*} (G : SimpleGraph V) (ω : G.edgeSet → Bool) : Prop :=
  ∀ v : V, ∃! e : G.edgeSet, ω e = true ∧ v ∈ (e : Sym2 V)

/-- **Dimer Gibbs measures** of an edge weight `w` in cylinder form (README 5.2; kos2006 Section
2.2.1, lines 195–202; gorin2021 Definition 13.4, lines 4534–4537): a probability measure on
configurations, concentrated on dimer configurations, such that for dimer configurations `ω`, `ω'`
agreeing off a finite set `F` of edges and every finite `E` containing each edge that shares a
vertex with an edge of `F`, `w(ω' ∩ F) · μ[ω]_E = w(ω ∩ F) · μ[ω']_E`, where `w(ω ∩ F)` is the
product of `w` over the edges of `F` of value `true` and `[ω]_E` is the cylinder of `ω` on `E`. -/
def IsDimerGibbs {V : Type*} (G : SimpleGraph V) (w : G.edgeSet → ℝ)
    (μ : Measure (G.edgeSet → Bool)) : Prop :=
  IsProbabilityMeasure μ ∧ μ {ω | ¬ IsDimerConfiguration G ω} = 0 ∧
    ∀ (F E : Finset G.edgeSet) (ω ω' : G.edgeSet → Bool),
      IsDimerConfiguration G ω → IsDimerConfiguration G ω' → (∀ e ∉ F, ω e = ω' e) →
      (∀ e ∈ F, ∀ e' : G.edgeSet, (∃ v, v ∈ (e : Sym2 V) ∧ v ∈ (e' : Sym2 V)) → e' ∈ E) →
      ENNReal.ofReal (∏ e ∈ F with ω' e = true, w e) * μ {η | ∀ e ∈ E, η e = ω e} =
        ENNReal.ofReal (∏ e ∈ F with ω e = true, w e) * μ {η | ∀ e ∈ E, η e = ω' e}

/-- **The face property for dimer measures on a periodic graph** (README 5.3; sheffield2005 Lemma
3.2.2, lines 1367–1371; georgii2011 Theorem 14.15; gorin2021 Lemma 13.7, lines 4561–4582). Let `G`
be a locally finite graph on a countable vertex type, `τ` an action of a countable infinite group
`Γ` by automorphisms of `G` that is proper on the edges, and `w` a positive edge weight, invariant
or not. Then the `Γ`-invariant dimer Gibbs measures of `w` form a face of the `Γ`-invariant
probability measures on configurations, `Γ` acting by `(g • ω) e = ω (τ(g⁻¹) e)`. -/
theorem dimerGibbsInvariant_isExtreme {V Γ : Type*} [Countable V] [Group Γ] [Countable Γ]
    [Infinite Γ] (G : SimpleGraph V) [G.LocallyFinite] (τ : Γ →* (G ≃g G))
    (hproper : ∀ F F' : Finset G.edgeSet, {g : Γ | ∃ e ∈ F, (τ g).mapEdgeSet e ∈ F'}.Finite)
    (w : G.edgeSet → ℝ) (hw : ∀ e, 0 < w e) :
    IsExtreme ℝ≥0∞
      {μ : Measure (G.edgeSet → Bool) | IsProbabilityMeasure μ ∧
        ∀ g : Γ, μ.map (fun ω => ω ∘ (τ g⁻¹).mapEdgeSet) = μ}
      {μ | IsDimerGibbs G w μ ∧ ∀ g : Γ, μ.map (fun ω => ω ∘ (τ g⁻¹).mapEdgeSet) = μ} := by
  sorry

/-- **Lozenge Gibbs measures** in cylinder form (README 5.4; gorin2021 Definition 13.4, lines
4534–4537; kenyon2009 lines 781–809): a probability measure on configurations, concentrated on
plane tilings, such that for plane tilings `ω`, `ω'` agreeing off a finite set `F` of edges and
every finite `E` containing all edges of the faces meeting `F`, the cylinders of `ω` and `ω'` on
`E` have equal mass. This is `IsDimerGibbs hexGraph 1` read along the bijection of README 1.2
between the edges of `hexGraph` and `TriEdge`. -/
def IsLozengeGibbs (μ : Measure (TriEdge → Bool)) : Prop :=
  IsProbabilityMeasure μ ∧ μ {ω | ¬ IsTiling Set.univ {e | ω e = true}} = 0 ∧
    ∀ (F E : Finset TriEdge) (ω ω' : TriEdge → Bool),
      IsTiling Set.univ {e | ω e = true} → IsTiling Set.univ {e | ω' e = true} →
      (∀ e ∉ F, ω e = ω' e) →
      (∀ e ∈ F, ∀ (f : TriFace) (e' : TriEdge), e ∈ f.edges → e' ∈ f.edges → e' ∈ E) →
      μ {η | ∀ e ∈ E, η e = ω e} = μ {η | ∀ e ∈ E, η e = ω' e}

/-- The translation-invariant lozenge Gibbs measures. -/
def lozengeGibbsInvariant : Set (Measure (TriEdge → Bool)) :=
  {μ | IsLozengeGibbs μ ∧ VAddInvariantMeasure (ℤ × ℤ) (TriEdge → Bool) μ}

/-- **The face property for lozenge tilings** (README 5.4, the lozenge instance of 5.3;
sheffield2005 Lemma 3.2.2, lines 1367–1371; georgii2011 Theorem 14.15): the invariant lozenge Gibbs
measures form a face of the translation-invariant probability measures on configurations. -/
theorem lozengeGibbsInvariant_isExtreme :
    IsExtreme ℝ≥0∞
      {μ : Measure (TriEdge → Bool) |
        IsProbabilityMeasure μ ∧ VAddInvariantMeasure (ℤ × ℤ) (TriEdge → Bool) μ}
      lozengeGibbsInvariant := by
  sorry

/-- **Ergodic lozenge Gibbs measures are the extreme ones** (README 5.4; sheffield2005 Lemma 3.2.2,
lines 1367–1369; gorin2021 Definition 13.6 and Lemma 13.7, lines 4556–4582; kenyon2009 lines
825–835): an invariant lozenge Gibbs measure is
an extreme point of the invariant lozenge Gibbs measures iff it is ergodic under the
translations. -/
theorem lozengeGibbs_extreme_iff_ergodic {μ : Measure (TriEdge → Bool)}
    (hμ : μ ∈ lozengeGibbsInvariant) :
    μ ∈ Set.extremePoints ℝ≥0∞ lozengeGibbsInvariant ↔
      ErgodicVAdd (ℤ × ℤ) (TriEdge → Bool) μ := by
  sorry

/-! ## Layer 6: slopes and the boundary of the slope triangle -/

/-- The slope `(μ{(0,1) ∈ M}, μ{(0,2) ∈ M})` of a measure on configurations: the densities of the
lozenges of types 1 and 2 at the origin (README 6.1; aggarwal2023 lines 421–431). -/
def slope (μ : Measure (TriEdge → Bool)) : ℝ × ℝ :=
  (μ.real {ω | ω ⟨0, 0⟩ = true}, μ.real {ω | ω ⟨0, 1⟩ = true})

/-- The row code `ε(M)_x = [((x,0),1) ∈ M]`: the type-1 positions along the row `y = 0`. -/
def rowCode (ω : TriEdge → Bool) : ℤ → Bool :=
  fun x => ω ⟨(x, 0), 0⟩

/-- **Invariant Gibbs measures on the edge `t = 0` of the slope triangle** (README 6.3(d)–(e);
sheffield2005 Theorem 9.5.1, lines 6195–6198). For `0 ≤ s ≤ 1`, the push-forward along `rowCode` is
a bijection from the invariant lozenge Gibbs measures of slope `(s, 0)` onto the shift-invariant
probability measures on `ℤ → Bool` of density `s`, and it carries ergodicity under `ℤ²` to
ergodicity of the shift `(σ ε) x = ε (x - 1)`, and back. -/
theorem slopeEdge_ergodicGibbs_equiv (s : ℝ) (hs₀ : 0 ≤ s) (hs₁ : s ≤ 1) :
    Set.BijOn (fun μ => μ.map rowCode) {μ | μ ∈ lozengeGibbsInvariant ∧ slope μ = (s, 0)}
        {ν : Measure (ℤ → Bool) | IsProbabilityMeasure ν ∧
          MeasurePreserving (fun ε : ℤ → Bool => fun x => ε (x - 1)) ν ν ∧
          ν.real {ε | ε 0 = true} = s} ∧
      ∀ μ ∈ lozengeGibbsInvariant, slope μ = (s, 0) →
        (ErgodicVAdd (ℤ × ℤ) (TriEdge → Bool) μ ↔
          Ergodic (fun ε : ℤ → Bool => fun x => ε (x - 1)) (μ.map rowCode)) := by
  sorry

/-- **Two ergodic Gibbs measures at every non-corner edge slope** (README 6.3(f); sheffield2005
Theorem 9.5.1, lines 6195–6198): at every point of the boundary of the slope triangle other than its
three corners there are two distinct ergodic invariant lozenge Gibbs measures of that slope. -/
theorem two_ergodicGibbs_of_slopeEdge (s t : ℝ)
    (h : (0 < s ∧ s < 1 ∧ t = 0) ∨ (s = 0 ∧ 0 < t ∧ t < 1) ∨ (0 < s ∧ 0 < t ∧ s + t = 1)) :
    ∃ μ₁ ∈ lozengeGibbsInvariant, ∃ μ₂ ∈ lozengeGibbsInvariant, μ₁ ≠ μ₂ ∧
      ErgodicVAdd (ℤ × ℤ) (TriEdge → Bool) μ₁ ∧ ErgodicVAdd (ℤ × ℤ) (TriEdge → Bool) μ₂ ∧
      slope μ₁ = (s, t) ∧ slope μ₂ = (s, t) := by
  sorry

/-! ## Layer 7: torus tilings and torus limits -/

/-- The torus tilings: the plane tilings invariant under `n₁ℤ × n₂ℤ`. -/
def IsTorusTiling (n₁ n₂ : ℕ) (M : Set TriEdge) : Prop :=
  IsTiling Set.univ M ∧
    ∀ e : TriEdge, (((n₁, 0) : ℤ × ℤ) +ᵥ e ∈ M ↔ e ∈ M) ∧ (((0, n₂) : ℤ × ℤ) +ᵥ e ∈ M ↔ e ∈ M)

/-- The height change `(h₁, h₂)` of a torus tiling: the numbers of type-1 lozenges on the horizontal
segment `[0, n₁) × {0}` and of type-2 lozenges on the vertical segment `{0} × [0, n₂)`
(README 7.1). -/
def heightChange (n₁ n₂ : ℕ) (M : Set TriEdge) : ℕ × ℕ :=
  (Nat.card {x : Fin n₁ // (⟨((x : ℤ), 0), 0⟩ : TriEdge) ∈ M},
    Nat.card {y : Fin n₂ // (⟨(0, (y : ℤ)), 1⟩ : TriEdge) ∈ M})

/-- The uniform measure `μ^{s,t}_n` on the `n × n` torus tilings with height change
`(⌊ns⌋, ⌊nt⌋)` (README 7.2). -/
def torusMeasure (n : ℕ) (s t : ℝ) : Measure (TriEdge → Bool) :=
  uniformOn {ω | IsTorusTiling n n {e | ω e = true} ∧
    heightChange n n {e | ω e = true} = (⌊n * s⌋₊, ⌊n * t⌋₊)}

/-- **Torus limits are invariant Gibbs measures of the prescribed slope** (README 7.3; kenyon2009
lines 844–866; kos2006 Theorem 2.1, existence part, lines 215–220). For `(s,t)` in the closed slope
triangle, every limit, in the sense of convergence of all cylinder probabilities, of a subsequence
of `torusMeasure n s t` is an invariant lozenge Gibbs measure of slope `(s, t)`. -/
theorem torusLimit_mem_gibbsInvariant_slope (s t : ℝ) (hs : 0 ≤ s) (ht : 0 ≤ t) (hst : s + t ≤ 1)
    (φ : ℕ → ℕ) (hφ : StrictMono φ) (ν : Measure (TriEdge → Bool))
    (hν : ∀ (E : Finset TriEdge) (σ : TriEdge → Bool),
      Tendsto (fun k => torusMeasure (φ k) s t {ω | ∀ e ∈ E, ω e = σ e}) atTop
        (𝓝 (ν {ω | ∀ e ∈ E, ω e = σ e}))) :
    ν ∈ lozengeGibbsInvariant ∧ slope ν = (s, t) := by
  sorry

/-! ## Layer 8: Kasteleyn theory on the torus -/

/-- The torus partition function: the sum over the torus tilings of the product of the weights of
their edges `(v, k)` with `v` in the fundamental domain `[0, n₁) × [0, n₂)`. -/
def torusPartitionFunction (n₁ n₂ : ℕ) (w : TriEdge → ℝ) : ℝ :=
  ∑ᶠ (M : Set TriEdge) (_ : IsTorusTiling n₁ n₂ M),
    ∏ᶠ (e : TriEdge) (_ : e ∈ M ∧ 0 ≤ e.v.1 ∧ e.v.1 < n₁ ∧ 0 ≤ e.v.2 ∧ e.v.2 < n₂), w e

/-- The twisted Kasteleyn matrix `K_{ab}` of the `n₁ × n₂` torus (README 8.1; gorin2021
Definition 3.9, lines 1452–1457), rows the white faces `W(u)` and columns the black faces `B(u')`
of the fundamental domain: the row of `W(u)` receives `w(u,3)` at the column `u`, `w(u,1)` at
`u - e₂`, multiplied by `(-1)^b` when `u` is in the first row, and `w(u+e₁,2)` at `u + e₁`,
multiplied by `(-1)^a` when `u` is in the last column, contributions at equal columns being
added. -/
def twistedKasteleyn (n₁ n₂ : ℕ) [NeZero n₁] [NeZero n₂] (w : TriEdge → ℝ) (a b : Fin 2) :
    Matrix (Fin n₁ × Fin n₂) (Fin n₁ × Fin n₂) ℝ :=
  Matrix.of fun u u' =>
    (if u' = u then w ⟨((u.1 : ℤ), (u.2 : ℤ)), 2⟩ else 0) +
    (if u' = (u.1, u.2 - 1) then
        (if (u.2 : ℕ) = 0 then (-1) ^ (b : ℕ) else 1) * w ⟨((u.1 : ℤ), (u.2 : ℤ)), 0⟩
      else 0) +
    (if u' = (u.1 + 1, u.2) then
        (if (u.1 : ℕ) + 1 = n₁ then (-1) ^ (a : ℕ) else 1) * w ⟨((u.1 : ℤ) + 1, (u.2 : ℤ)), 1⟩
      else 0)

/-- **The torus partition function as four determinants** (README 8.3; gorin2021 Theorem 3.10,
lines 1458–1472; kenyon1997 Lemma 7, lines 392–396). For an `n₁ℤ × n₂ℤ`-periodic real edge weight,
the torus partition function is `(Σ_{a,b} ε_{ab} det K_{ab}) / 2` with `ε_{ab} = -1` exactly when
`(a, b) ≡ (n₁, n₂)` modulo `2`. -/
theorem torus_partitionFunction_eq (n₁ n₂ : ℕ) [NeZero n₁] [NeZero n₂] (w : TriEdge → ℝ)
    (hw : ∀ e : TriEdge, w (((n₁, 0) : ℤ × ℤ) +ᵥ e) = w e ∧ w (((0, n₂) : ℤ × ℤ) +ᵥ e) = w e) :
    torusPartitionFunction n₁ n₂ w =
      (∑ a : Fin 2, ∑ b : Fin 2,
        (if (a : ℕ) = n₁ % 2 ∧ (b : ℕ) = n₂ % 2 then -1 else 1) *
          (twistedKasteleyn n₁ n₂ w a b).det) / 2 := by
  sorry

/-! ## Layer 9: the explicit kernel and ergodic Gibbs measures of interior slopes -/

/-- **An ergodic Gibbs measure of every slope** (README 9.5; kos2006 Theorem 2.1, existence part,
lines 215–220; gorin2021 Corollary 6.3, lines 2287–2298): for every `(s,t)` in the closed slope
triangle there is an ergodic invariant lozenge Gibbs measure of slope `(s,t)`. -/
theorem exists_ergodicGibbs_of_slope (s t : ℝ) (hs : 0 ≤ s) (ht : 0 ≤ t) (hst : s + t ≤ 1) :
    ∃ μ ∈ lozengeGibbsInvariant, ErgodicVAdd (ℤ × ℤ) (TriEdge → Bool) μ ∧ slope μ = (s, t) := by
  sorry

/-- The incomplete beta kernel `K_ξ(v₁; v₂) = (2πi)⁻¹ ∫ (1 - z)^(y₁ - y₂) z^(x₂ - x₁ - 1) dz` from
`conj ξ` to `ξ` along the polygonal path through `c = 1/2` when `y₁ ≥ y₂` and through `c = -1`
when `y₁ < y₂` (README 9.6; aggarwal2023 Definition 1.3, lines 472–476; okounkov-reshetikhin2003
Definition 4, lines 965–968): the sum of Mathlib's curve integrals of the 1-form `f(z) dz`, written
`v ↦ v • f z` as in Tau Ceti's contour integrals, along `Path.segment (conj ξ) c` and
`Path.segment c ξ`, each of which `curveIntegral_segment` parametrises by `a + t (b - a)`,
`t ∈ [0, 1]`. -/
def incompleteBetaKernel (ξ : ℂ) (v₁ v₂ : ℤ × ℤ) : ℂ :=
  let ω : ℂ → ℂ →L[ℂ] ℂ := fun z =>
    ContinuousLinearMap.toSpanSingleton ℂ ((1 - z) ^ (v₁.2 - v₂.2) * z ^ (v₂.1 - v₁.1 - 1))
  let c : ℂ := if v₂.2 ≤ v₁.2 then 1 / 2 else -1
  (2 * Real.pi * I)⁻¹ *
    ((∫ᶜ z in Path.segment (starRingEnd ℂ ξ) c, ω z) + ∫ᶜ z in Path.segment c ξ, ω z)

/-- **The incomplete beta process** (README 9.7; aggarwal2023 equation (1.2), lines 491–507;
okounkov-reshetikhin2003 Theorem 2, lines 993–1006). For `ξ` in the upper half-plane there is a
unique probability measure on configurations, concentrated on plane tilings, whose type-1 positions
`X(M) = {v : (v,1) ∈ M}` have the correlations `μ{v₁, …, v_m ∈ X(M)} = det [K_ξ(vᵢ; vⱼ)]`; it is an
ergodic invariant lozenge Gibbs measure of slope `(arg ξ / π, -arg (1 - ξ) / π)`. -/
theorem incompleteBetaProcess_exists_unique (ξ : ℂ) (hξ : 0 < ξ.im) :
    ∃ μ : Measure (TriEdge → Bool),
      μ ∈ lozengeGibbsInvariant ∧ ErgodicVAdd (ℤ × ℤ) (TriEdge → Bool) μ ∧
      slope μ = (arg ξ / Real.pi, -arg (1 - ξ) / Real.pi) ∧
      (∀ (m : ℕ) (v : Fin m → ℤ × ℤ), Function.Injective v →
        ((μ.real {ω | ∀ i, ω ⟨v i, 0⟩ = true} : ℝ) : ℂ) =
          (Matrix.of fun i j => incompleteBetaKernel ξ (v i) (v j)).det) ∧
      ∀ μ' : Measure (TriEdge → Bool), IsProbabilityMeasure μ' →
        μ' {ω | ¬ IsTiling Set.univ {e | ω e = true}} = 0 →
        (∀ (m : ℕ) (v : Fin m → ℤ × ℤ), Function.Injective v →
          ((μ'.real {ω | ∀ i, ω ⟨v i, 0⟩ = true} : ℝ) : ℂ) =
            (Matrix.of fun i j => incompleteBetaKernel ξ (v i) (v j)).det) →
        μ' = μ := by
  sorry

/-! ## Layer 10: local statistics of tilings of growing regions -/

/-- **Local convergence** (README 10.1; aggarwal2023 lines 568–580): the local statistics of `μ N`
around `v N` converge to those of `ν`, that is, for every finite set `E` of edges and every pattern
`σ`, `μ N {ω : ω (v N +ᵥ e) = σ e for e ∈ E}` tends to `ν {ω : ω e = σ e for e ∈ E}`. -/
def LocalConvergence (μ : ℕ → Measure (TriEdge → Bool)) (v : ℕ → ℤ × ℤ)
    (ν : Measure (TriEdge → Bool)) : Prop :=
  ∀ (E : Finset TriEdge) (σ : TriEdge → Bool),
    Tendsto (fun N => μ N {ω | ∀ e ∈ E, ω (v N +ᵥ e) = σ e}) atTop
      (𝓝 (ν {ω | ∀ e ∈ E, ω e = σ e}))

/-- **Local limits of uniform measures are Gibbs** (README 10.2(d); aggarwal2023 lines 413–415 and
568–580; gorin2021 lines 4538–4541). If `R N` are finite tileable regions such that every face lies
in `R N - v N` for all large `N`, every local limit of the uniform measures on their tilings around
`v N` is a lozenge Gibbs measure. -/
theorem localLimit_isLozengeGibbs (R : ℕ → Finset TriFace) (hR : ∀ N, ∃ M, IsTiling (R N) M)
    (v : ℕ → ℤ × ℤ) (hexh : ∀ f : TriFace, ∀ᶠ N in atTop, (⟨v N + f.v, f.isWhite⟩ : TriFace) ∈ R N)
    (ν : Measure (TriEdge → Bool))
    (hν : LocalConvergence (fun N => uniformOn {ω | IsTiling (R N) {e | ω e = true}}) v ν) :
    IsLozengeGibbs ν := by
  sorry

end TauCetiRoadmap.DimerModelsAndLozengeTilings
