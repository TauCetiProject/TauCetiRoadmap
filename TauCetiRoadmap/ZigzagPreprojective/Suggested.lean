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
* Layer 7: the positive-degree cyclic quotient `Π/[Π,Π]` of the preprojective algebra of an
  oriented finite connected simple graph vanishes exactly for finite ADE graphs in good
  characteristic (Schedler, Theorem 13.1.1, via Liu--Wang, Corollary 3.4);
* Layer 7: Liu--Wang's theorem that the path-graded zigzag algebra of a finite tree is
  intrinsically formal exactly when the tree is ADE and the characteristic is not bad
  (Liu--Wang, Theorem 1.1).

Not statable at the pins:

* the identifications of `Π₂(Q)` and `Γ₃(Q,W)` with the derived and deformed Calabi--Yau
  completions (Layer 6): the completions `Π_n(C)` of the DG and `A∞` roadmap, Layer 9, are not in
  Tau Ceti;
* the bigraded derived Koszul dualities and the Hochschild comparison
  `HH^{2,q}(Π₂(Q)) ≅ (Π/[Π,Π])_{q+2}` (Layer 7): bigraded derived `RHom` over a DG algebra and
  bigraded Hochschild cohomology are not in Tau Ceti;
* the braid relations of the bimodule complexes and the Artin action on the derived category
  (Layer 8): the tensor product of complexes of graded `Z`-bimodules over `Z` and the homotopy
  category it acts on are not available as a construction at the pins;
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
