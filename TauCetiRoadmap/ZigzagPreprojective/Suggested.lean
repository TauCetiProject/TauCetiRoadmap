import Mathlib
import TauCeti.Algebra.Homology.AInfinity.Algebra.Formal
import TauCeti.Algebra.Homology.AInfinity.Algebra.Minimal
import TauCeti.Algebra.Homology.AInfinity.Algebra.Unit
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic
import TauCeti.LinearAlgebra.RootSystem.DynkinType
import TauCeti.LinearAlgebra.RootSystem.FiniteType.Diagram
import TauCeti.RepresentationTheory.Quiver.Preprojective.Grading
import TauCeti.RepresentationTheory.Quiver.Zigzag.Componentwise.Grading
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation
import TauCeti.RingTheory.Idempotents.Corner

/-!
# Zigzag, preprojective, and Ginzburg algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. The strict zigzag and
preprojective algebras, their gradings, bases, traces, centres and Cartan matrices are the native
Tau Ceti declarations (`TauCeti.zigzagAlgebra`, `TauCeti.zigzagAlgebraIntegerGrade`,
`TauCeti.preprojectiveAlgebra`, `TauCeti.preprojectiveGrade`), and the `A∞` notions are
Tau Ceti's (`TauCeti.AInfinityAlgebra`, `IsMinimal`, `StrictUnit`, `IsFormal`).

Stated here:

* Layer 0: recognition of the connected finite simple graphs carrying a nonzero nonnegative
  integral null vector of `2I - A` as the graphical affine simply-laced diagrams;
* Layer 4: the self-injectivity of the preprojective algebra of a finite simply-laced Dynkin
  graph over every field (Grant, Theorem 3.1, through the identification with the
  Baer--Geigle--Lenzing algebra);
* Layer 5: the matrix Hilbert series `(1 - Ct + t²)⁻¹` of the preprojective algebra of a connected
  non-Dynkin oriented graph, as the recursion `H₀ = I`, `H₁ = C`, `H_{d+2} + H_d = C H_{d+1}` on
  the graded corners `e_j Π_d e_i` (Etingof--Eu, Theorem 3.4.2);
* Layer 7: the positive-degree cyclic quotient `Π/[Π,Π]` of the preprojective algebra of an
  oriented finite connected simple graph vanishes exactly for finite ADE graphs in good
  characteristic (Schedler, Theorem 13.1.1, via Liu--Wang, Corollary 3.4);
* Layer 7: Liu--Wang's theorem that the path-graded zigzag algebra of a finite tree is
  intrinsically formal exactly when the tree is ADE and the characteristic is not bad
  (Liu--Wang, Theorem 1.1).

Not statable at the pins:

* the Koszul dichotomy for path-graded zigzag algebras and the Koszulity of the preprojective
  algebra of a connected non-Dynkin graph (Layer 5): the Koszul predicate is the DG and `A∞`
  roadmap's (Layer 11), on the linear graded projective resolutions of the Grothendieck and Euler
  roadmap (Layer 3), and neither is in Tau Ceti, so only the Hilbert-series half of Etingof--Eu's
  theorem is stated;
* the identifications of `Π₂(Q)` and `Γ₃(Q,W)` with the derived and deformed Calabi--Yau
  completions (Layer 6): the completions `Π_n(C)` of the DG and `A∞` roadmap, Layer 9, are not in
  Tau Ceti;
* the bigraded derived Koszul dualities and the Hochschild comparison
  `HH^{2,q}(Π₂(Q)) ≅ (Π/[Π,Π])_{q+2}` (Layer 7): bigraded derived `RHom` over a DG algebra and
  bigraded Hochschild cohomology are not in Tau Ceti;
* the braid relations of the bimodule complexes and the Artin action on the derived category
  (Layer 8): the complexes `B_i` and `B_i'` exist (`TauCeti.zigzagBraidComplex`,
  `TauCeti.zigzagBraidInverseComplex`), but their composition, the tensor product of complexes of
  graded `Z`-bimodules over `Z`, and the homotopy category it acts on are not available as a
  construction at the pins;
* the Seidel--Thomas twists of an `A_m`-configuration of spherical objects (Layer 8): a
  `k`-linear DG enhancement with chain-level `Hom` complexes and cones is not in Tau Ceti.
-/

namespace TauCetiRoadmap.ZigzagPreprojective

universe u

/-! ## Layer 0: affine simply-laced diagrams -/

/-- **Affine graph recognition.** A connected finite simple graph carries a nonzero
nonnegative integral vector `a` with `Σ_{j ∼ i} a_j = 2 a_i` at every vertex, that is a nonzero
nonnegative integral null vector of `2I - A`, exactly when it is isomorphic to the graph of a
unique valid graphical affine simply-laced diagram: a cycle `Ã_n` with `n ≥ 2`, `D̃_n` with
`n ≥ 4`, or `Ẽ₆, Ẽ₇, Ẽ₈`. (Etingof et al., *Introduction to representation theory*, Problem 5.3,
for the semidefinite form of the classification.) -/
theorem affine_graph_recognition {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hG : G.Connected) :
    (∃ a : V → ℕ, a ≠ 0 ∧
      ∀ i, (∑ j ∈ G.neighborFinset i, a j) = 2 * a i) ↔
    ∃! t : TauCeti.AffineDynkinType,
      t.Valid ∧ t.IsGraphical ∧ Nonempty (G ≃g t.graph) := by
  sorry

/-! ## Layer 4: self-injectivity in finite type -/

/-- **Self-injectivity of a Dynkin preprojective algebra.** Let `o` orient a finite simple graph
`G` isomorphic to the diagram graph of a valid simply-laced Dynkin type, and let `k` be any
field. The additive preprojective algebra `Π_k(Q_o)` is injective as a module over itself. The
route is Grant's: `Π_k(Q_o)` is the Baer--Geigle--Lenzing algebra `⊕_{r ≥ 0} Hom(kQ, τ^{-r} kQ)`
(Crawley-Boevey, Theorems 2.3 and 3.1; Ringel, Theorem A), which is Frobenius for a basic
representation-finite hereditary algebra (Grant, Theorem 3.1), `kQ_o` being representation-finite
by Gabriel's theorem. -/
theorem moduleInjective_preprojectiveAlgebra_of_dynkin (k : Type*) [Field k] {V : Type u}
    [Finite V] (G : SimpleGraph V) (o : TauCeti.DoubledQuiver.Orientation G)
    (ht : ∃ t : TauCeti.DynkinType, t.Valid ∧ t.IsSimplyLaced ∧
      Nonempty (G ≃g TauCeti.diagramGraph t.cartanMatrix)) :
    Module.Injective (TauCeti.preprojectiveAlgebra k (TauCeti.DoubledQuiver.OrientedQuiver G o))
      (TauCeti.preprojectiveAlgebra k (TauCeti.DoubledQuiver.OrientedQuiver G o)) := by
  sorry

/-! ## Layer 5: the Hilbert series of a non-Dynkin preprojective algebra -/

/-- The degree-`d` **graded corner** `e_j Π_d e_i` of the additive preprojective algebra
`Π = TauCeti.preprojectiveAlgebra k Q`, graded by path length: the image of the degree-`d` piece
`TauCeti.preprojectiveGrade k Q d` under `x ↦ e_j x e_i`, where `e_v` is the class of the vertex
idempotent at `v`. In Tau Ceti's later-factor-first convention it is spanned by the classes of
the doubled paths of length `d` from `i` to `j`. -/
noncomputable def preprojectiveGradedCorner (k : Type*) [Field k] (Q : Type*) [Quiver Q]
    [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)] (d : ℕ) (j i : Q) : Submodule k (TauCeti.preprojectiveAlgebra k Q) :=
  (TauCeti.preprojectiveGrade k Q d).map
    (TauCeti.cornerMap k (TauCeti.preprojectiveMk k Q (TauCeti.doubledVertexIdempotent k j))
      (TauCeti.preprojectiveMk k Q (TauCeti.doubledVertexIdempotent k i)))

/-- The degree-`d` **Hilbert matrix** of the preprojective algebra `Π_k(Q_o)` of an orientation
`o` of a finite simple graph `G`: the matrix whose `(j, i)` entry is `dim_k e_j Π_d e_i`, the
coefficient of `t^d` in the matrix Hilbert series `h_Π(t)` of Etingof--Eu, Definition 2.1.2. -/
noncomputable def preprojectiveHilbertMatrix (k : Type*) [Field k] {V : Type u} [Finite V]
    (G : SimpleGraph V) (o : TauCeti.DoubledQuiver.Orientation G) (d : ℕ) : Matrix V V ℕ :=
  Matrix.of fun j i =>
    Module.finrank k (preprojectiveGradedCorner k (TauCeti.DoubledQuiver.OrientedQuiver G o) d
      (TauCeti.DoubledQuiver.OrientedQuiver.vertex G o j)
      (TauCeti.DoubledQuiver.OrientedQuiver.vertex G o i))

/-- **The Hilbert series of a non-Dynkin preprojective algebra.** Let `o` orient a finite
connected simple graph `G` which is not a simply-laced Dynkin graph, and let `C = A_G` be its
adjacency matrix, the adjacency matrix of the doubled quiver. Over every field the matrix Hilbert
series of `Π_k(Q_o)` is `(1 - Ct + t²)⁻¹`, that is, coefficientwise, `H₀ = I`, `H₁ = C` and
`H_{d+2} + H_d = C H_{d+1}` for every `d` (Etingof--Eu, Theorem 3.4.2). For a Dynkin graph the
recursion fails: on `A₂` it would force `H₃ + H₁ = C H₂ = 0` although `H₁ = C ≠ 0`. -/
theorem preprojectiveHilbertMatrix_recursion (k : Type*) [Field k] {V : Type u} [Fintype V]
    [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (hG : G.Connected)
    (hnd : ¬ ∃ t : TauCeti.DynkinType, t.Valid ∧ t.IsSimplyLaced ∧
      Nonempty (G ≃g TauCeti.diagramGraph t.cartanMatrix))
    (o : TauCeti.DoubledQuiver.Orientation G) :
    preprojectiveHilbertMatrix k G o 0 = 1 ∧
    preprojectiveHilbertMatrix k G o 1 = G.adjMatrix ℕ ∧
    ∀ d : ℕ, preprojectiveHilbertMatrix k G o (d + 2) + preprojectiveHilbertMatrix k G o d =
      G.adjMatrix ℕ * preprojectiveHilbertMatrix k G o (d + 1) := by
  sorry

/-! ## Layer 7: cyclic quotients and intrinsic formality -/

/-- The primes that are bad for a simply-laced finite type in the sense of Liu--Wang,
Theorem 1.1, and Schedler, Theorem 13.1.1: `2` for `D_n`, `2` and `3` for `E₆` and `E₇`, and
`2`, `3` and `5` for `E₈`; type `A` has none. The argument `0` (characteristic zero) is never
bad. -/
def IsBadPrime : TauCeti.DynkinType → ℕ → Prop
  | .D _, p => p = 2
  | .E6, p => p = 2 ∨ p = 3
  | .E7, p => p = 2 ∨ p = 3
  | .E8, p => p = 2 ∨ p = 3 ∨ p = 5
  | .A _, _ => False
  | .B _, _ => False
  | .C _, _ => False
  | .F4, _ => False
  | .G2, _ => False

/-- **The positive-degree cyclic quotient of a preprojective algebra.** Let `o` orient a finite
connected simple graph `G` and let `Π = Π_k(Q_o)` be the additive preprojective algebra over a
field `k`, graded by path length. Every element of degree at least `3` lies in the `k`-span of
the commutators `xy - yx`, that is `(Π/[Π,Π])_d = 0` for all `d ≥ 3`, exactly when `G` is a
finite simply-laced Dynkin graph and the characteristic of `k` is not bad for its type
(Schedler, Theorem 13.1.1, with base change from `ℤ`; Liu--Wang, Corollary 3.4). -/
theorem preprojective_cyclicQuotient_vanishes_iff (k : Type*) [Field k] {V : Type u}
    [Fintype V] (G : SimpleGraph V) (hG : G.Connected) (o : TauCeti.DoubledQuiver.Orientation G) :
    (∀ d : ℕ, 3 ≤ d →
      TauCeti.preprojectiveGrade k (TauCeti.DoubledQuiver.OrientedQuiver G o) d ≤
        Submodule.span k
          {z : TauCeti.preprojectiveAlgebra k (TauCeti.DoubledQuiver.OrientedQuiver G o) |
            ∃ x y, z = x * y - y * x}) ↔
    ∃ t : TauCeti.DynkinType, t.Valid ∧ t.IsSimplyLaced ∧
      Nonempty (G ≃g TauCeti.diagramGraph t.cartanMatrix) ∧ ¬ IsBadPrime t (ringChar k) := by
  sorry

/-- A **strictly unital minimal `A∞` deformation** of the path-graded zigzag algebra
`Z = TauCeti.zigzagAlgebra k G` (Liu--Wang, Definition 4.1): an `A∞` structure on `Z` whose
grading is path length (vertices in degree `0`, arrows in `1`, volumes in `2`), whose `m₁`
vanishes, whose `m₂` is the product of `Z`, and for which `1` is a strict unit. -/
structure IsZigzagAInfinityDeformation (k : Type*) [Field k] {V : Type u} [Finite V]
    (G : SimpleGraph V) (𝒜 : TauCeti.AInfinityAlgebra k (TauCeti.zigzagAlgebra k G)) :
    Prop where
  /-- The grading is the path-length grading of the zigzag algebra. -/
  grading_piece : 𝒜.grading.piece = TauCeti.zigzagAlgebraIntegerGrade k G
  /-- The deformation is minimal: `m₁ = 0`. -/
  isMinimal : 𝒜.IsMinimal
  /-- The binary operation is the product of the zigzag algebra. -/
  m_two : ∀ x : Fin 2 → TauCeti.zigzagAlgebra k G, 𝒜.m 2 x = x 0 * x 1
  /-- The unit of the zigzag algebra is a strict unit. -/
  strictUnit : 𝒜.StrictUnit 1

/-- The path-graded zigzag algebra of `G` is **intrinsically formal** when every strictly unital
minimal `A∞` deformation of it is formal; since an `A∞` quasi-isomorphism between minimal
algebras is an isomorphism (`TauCeti.AInfinityHom.isQuasiIso_iff_isIso`), this says every such
deformation is `A∞`-isomorphic to the strict algebra. -/
def IsIntrinsicallyFormal (k : Type*) [Field k] {V : Type u} [Finite V]
    (G : SimpleGraph V) : Prop :=
  ∀ 𝒜 : TauCeti.AInfinityAlgebra k (TauCeti.zigzagAlgebra k G),
    IsZigzagAInfinityDeformation k G 𝒜 → 𝒜.IsFormal

/-- **Liu--Wang's intrinsic-formality theorem.** For a finite tree `G` and a field `k`, the
path-graded zigzag algebra of `G` (dual numbers with generator in degree `2` for `A₁`, the
radical-cube-zero algebra for `A₂`) is intrinsically formal exactly when `G` is a finite
simply-laced Dynkin graph and the characteristic of `k` is not bad for its type
(Liu--Wang, Theorem 1.1). -/
theorem isIntrinsicallyFormal_zigzagAlgebra_iff (k : Type*) [Field k] {V : Type u}
    [Fintype V] (G : SimpleGraph V) (hG : G.IsTree) :
    IsIntrinsicallyFormal k G ↔
    ∃ t : TauCeti.DynkinType, t.Valid ∧ t.IsSimplyLaced ∧
      Nonempty (G ≃g TauCeti.diagramGraph t.cartanMatrix) ∧ ¬ IsBadPrime t (ringChar k) := by
  sorry

end TauCetiRoadmap.ZigzagPreprojective
