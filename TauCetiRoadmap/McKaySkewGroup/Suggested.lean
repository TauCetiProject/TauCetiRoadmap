import Mathlib
import TauCeti.RepresentationTheory.Simple.Basic
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Deletion
import TauCeti.CategoryTheory.GrothendieckGroup.Split
import TauCeti.RepresentationTheory.RepresentationRing.Basic
import TauCeti.RingTheory.Idempotents.Corner
import TauCeti.RepresentationTheory.Quiver.Preprojective.Basic
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation
import TauCeti.RepresentationTheory.Quiver.Zigzag.Relations

/-!
# McKay correspondence and skew-group algebras: target signatures

`README.md` is the roadmap; this file is not.  It states the roadmap's headline theorems against
the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few definitions with real
bodies that the statements need.

Stated here:

* Layer 0: every finite subgroup of `SL₂(ℂ)` is cyclic, binary dihedral (Mathlib's
  `QuaternionGroup n`, `n ≥ 2`), binary tetrahedral (`SL(2, 𝔽₃)`), binary icosahedral
  (`SL(2, 𝔽₅)`) or of order `48`; isomorphic finite subgroups are conjugate, and so are any two of
  order `48` that are neither cyclic nor isomorphic to `QuaternionGroup 12`.
* Layer 1: the McKay correspondence.  For a nontrivial finite group with a faithful
  two-dimensional representation of determinant one, the multiplicities `dim Hom(ρ_i, V ⊗ ρ_j)`
  are `2δ_ij − C_ij` for the generalized Cartan matrix `C` of a valid affine simply-laced diagram
  (Tau Ceti's `TauCeti.AffineDynkinType`), the dimensions of the simples are its marks and the
  trivial representation sits at its affine node.  Every valid affine type occurs.
* Layer 2: for a McKay labelling by a valid affine type, the representation ring is the free
  abelian group on the nodes, multiplication by `[V]` is `2 − C`, the regular class is the vector of
  marks, the radical of the McKay form is `ℤ · [ℂ[G]]`, and the quotient by it is the finite root
  lattice of the deleted diagram with its Cartan form.
* Layer 4: the polynomial skew algebra `Sym(V) ⋊ G` has a full idempotent whose corner is the
  preprojective algebra of any finite quiver realizing the McKay multiplicities (for `G = {±1}`
  the Kronecker quiver of the double edge of `Ã₁`, for the trivial group the one-loop quiver);
  when `−1 ∈ G` and the McKay type is graphical, the exterior skew algebra `Λ(V) ⋊ G` has a full
  idempotent whose corner is the zigzag algebra of the McKay graph.
* Layer 5: the Crawley-Boevey–Holland theorem, `(T(V) ⋊ G)/([x,y] − z)` has a full idempotent
  whose corner is the deformed preprojective algebra of a McKay quiver with the trace weights
  `λ_i = Tr_{ρ_i}(z)`.

The zigzag corner is stated for graphical types only: Tau Ceti's zigzag algebra
`TauCeti.nonisolatedZigzagQuotient` is built from a simple graph, and the exterior skew algebra of
`G = {±1}`, with two degree-one arrows in each direction, is not the zigzag algebra of a simple
graph.

Not statable at the pins:

* The Koszul duality of Layer 3, `Λ(V∗) ⋊ G` as the relative quadratic dual of `Sym(V) ⋊ G` over
  `S = k[G]` together with relative Koszulity: neither Mathlib nor Tau Ceti has relative tensor
  algebras over a noncommutative semisimple base, their right duals, or quadratic duals.
* The FKS theorems of Layer 6 (the stable category of curved duplexes over the zigzag algebra and
  the Weyl-group action by reflection functors).  The pins do have curved DG algebras
  (`TauCeti.IsCurvedDGAlgebra`), curved DG left modules with the left Leibniz rule
  (`TauCeti.IsCurvedDGLeftModule`; FKS's `Com(A,c)` is the curved DG left modules over
  `(A, 0, −c)`), the curved homotopy category of right modules, and curved duplexes of scalar
  curvature in a linear category with their homotopy category, disks, Frobenius exact structure
  and triangulation (`TauCeti.CurvedDuplex`, `TauCeti.CurvedDuplex.HomotopyCategory`).  What the
  headline lacks is narrower: duplexes over a parity-graded algebra whose odd elements exchange
  the two components, with a central non-scalar curvature; curved bimodule duplexes and the
  reflection kernels; and the stable category of graded modules over the curved extension
  algebra `Ã_c`.
* The geometric McKay correspondence of Layer 7 (the exceptional curves of the minimal resolution
  of `ℂ² / G` and their intersection matrix, the `G`-Hilbert scheme and the tautological bundles):
  there is no minimal resolution of a surface singularity and no equivariant Hilbert scheme at the
  pins.
-/

namespace TauCetiRoadmap.McKaySkewGroup

open CategoryTheory
open scoped MonoidalCategory Matrix

universe u v w

/-! ## Layer 0: finite subgroups of `SL₂(ℂ)` -/

/-- **Klein's classification of the finite subgroups of `SL₂(ℂ)`**, up to isomorphism: such a
group is cyclic, binary dihedral of order `4n` with `n ≥ 2` (Mathlib's dicyclic group
`QuaternionGroup n`), binary tetrahedral `≅ SL(2, 𝔽₃)`, binary octahedral (the case of order
`48`, pinned by `card_eq_48_conjugate`), or binary icosahedral `≅ SL(2, 𝔽₅)` (Springer,
*Invariant theory*, LNM 585, §4.4; README Layer 0). -/
theorem finite_subgroup_SL2_classification
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℂ)) [Finite H] :
    IsCyclic H ∨ (∃ n : ℕ, 2 ≤ n ∧ Nonempty (H ≃* QuaternionGroup n)) ∨
      Nonempty (H ≃* Matrix.SpecialLinearGroup (Fin 2) (ZMod 3)) ∨ Nat.card H = 48 ∨
      Nonempty (H ≃* Matrix.SpecialLinearGroup (Fin 2) (ZMod 5)) := by
  sorry

/-- **Isomorphic finite subgroups of `SL₂(ℂ)` are conjugate in `SL₂(ℂ)`** (README Layer 0,
conjugacy). -/
theorem finite_subgroup_SL2_conjugate_of_mulEquiv
    (H K : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℂ)) [Finite H] (e : H ≃* K) :
    ∃ g : Matrix.SpecialLinearGroup (Fin 2) ℂ, K = H.map (MulAut.conj g).toMonoidHom := by
  sorry

/-- **The binary octahedral subgroups of `SL₂(ℂ)` form one conjugacy class** (README Layer 0).
The finite subgroups of order `48` are the cyclic ones, the binary dihedral ones
`≅ QuaternionGroup 12`, and the binary octahedral ones; excluding the first two, any two are
conjugate.  Without the exclusions the statement is false: a cyclic subgroup of order `48` is not
conjugate to a binary dihedral one of the same order. -/
theorem card_eq_48_conjugate (H K : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℂ))
    (hH : Nat.card H = 48) (hHc : ¬IsCyclic H) (hHd : IsEmpty (H ≃* QuaternionGroup 12))
    (hK : Nat.card K = 48) (hKc : ¬IsCyclic K) (hKd : IsEmpty (K ≃* QuaternionGroup 12)) :
    ∃ g : Matrix.SpecialLinearGroup (Fin 2) ℂ, K = H.map (MulAut.conj g).toMonoidHom := by
  sorry

/-! ## Layer 1: the McKay correspondence -/

/-- A **McKay labelling** of the simple representations of `G` by the nodes of the affine
simply-laced diagram `t`, relative to `V`: a bijection `e` from the isomorphism classes of simple
objects of `FDRep ℂ G` to the nodes of `t` such that

* the multiplicity `dim Hom(X, V ⊗ Y)` of the simple `X` in `V ⊗ Y` is `2δ − C` at the pair of
  nodes of `X` and `Y`, for the generalized Cartan matrix `C` of `t` (so it is the number of edges
  between distinct nodes, `2` for the double edge of `Ã₁`, and `0` on the diagonal);
* the dimension of each simple is the mark of its node;
* the trivial representation sits at the affine node. -/
def IsMcKayLabelling {G : Type u} [Group G] (V : FDRep ℂ G) (t : TauCeti.AffineDynkinType)
    (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes) : Prop :=
  (∀ (X Y : FDRep ℂ G) [Simple X] [Simple Y],
      (Module.finrank ℂ (X ⟶ V ⊗ Y) : ℤ) =
        2 * (if e (TauCeti.SimpleFDRepClasses.mk X) = e (TauCeti.SimpleFDRepClasses.mk Y)
          then 1 else 0) -
          t.cartanMatrix (e (TauCeti.SimpleFDRepClasses.mk X))
            (e (TauCeti.SimpleFDRepClasses.mk Y))) ∧
    (∀ (X : FDRep ℂ G) [Simple X],
      (Module.finrank ℂ X : ℤ) = t.marks (e (TauCeti.SimpleFDRepClasses.mk X))) ∧
    ∀ (X : FDRep ℂ G) [Simple X], (∀ g : G, X.ρ g = 1) →
      e (TauCeti.SimpleFDRepClasses.mk X) = t.affineNode

/-- **The McKay correspondence** (McKay, *Graphs, singularities, and finite groups*, 1980; README
Layer 1).  For a nontrivial finite group `G` with a faithful two-dimensional complex representation
`V` of determinant one, the McKay graph of `V` is a valid affine simply-laced Dynkin diagram, with
the dimensions of the simples as its marks and the trivial representation at its affine node.
Nontriviality is needed: for the trivial group `V` is twice the trivial representation, whose
`1 × 1` McKay matrix `(2)` is no affine diagram. -/
theorem exists_isMcKayLabelling {G : Type u} [Group G] [Finite G] [Nontrivial G]
    (V : FDRep ℂ G) (hdim : Module.finrank ℂ V = 2) (hfaithful : Function.Injective V.ρ)
    (hdet : ∀ g : G, LinearMap.det (V.ρ g) = 1) :
    ∃ (t : TauCeti.AffineDynkinType) (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes),
      t.Valid ∧ IsMcKayLabelling V t e := by
  sorry

/-- **Every valid affine simply-laced diagram is a McKay graph**: the cyclic groups of order
`n + 1` give `Ãₙ`, the binary dihedral groups of order `4(n − 2)` give `D̃ₙ`, and the binary
tetrahedral, octahedral and icosahedral groups give `Ẽ₆`, `Ẽ₇`, `Ẽ₈` (README Layer 1, the table
of named identifications). -/
theorem exists_isMcKayLabelling_of_valid (t : TauCeti.AffineDynkinType) (ht : t.Valid) :
    ∃ (G : Type) (_ : Group G) (_ : Finite G) (V : FDRep ℂ G)
      (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes),
      Module.finrank ℂ V = 2 ∧ Function.Injective V.ρ ∧
        (∀ g : G, LinearMap.det (V.ρ g) = 1) ∧ IsMcKayLabelling V t e := by
  sorry

/-! ## Layer 2: the representation ring and the root lattice -/

/-- The **quotient of the affine root lattice by the null vector**, in coordinates: the map
`ℤ^(nodes of t) → ℤ^(nodes of the finite type)` sending `x` to `x − x₀ δ` read at the nodes other
than the affine node `0`, in the Bourbaki numbering `TauCeti.AffineDynkinType.bourbakiNode`, where
`δ = t.marks`.  For `t.Valid`, the affine mark is `1` and the Bourbaki nodes enumerate its
complement, so the kernel is `ℤ δ` and the map is onto; the additive definition is total. -/
def rootLatticeQuotientMap (t : TauCeti.AffineDynkinType) :
    (Fin t.nodes → ℤ) →+ (Fin t.finiteType.rank → ℤ) where
  toFun x i := x (t.bourbakiNode i) - x t.affineNode * t.marks (t.bourbakiNode i)
  map_zero' := by ext; simp
  map_add' x y := by ext; simp only [Pi.add_apply]; ring

/-- **The representation ring and the affine root lattice** (Steinberg, *Finite subgroups of
`SU₂`, Dynkin diagrams and affine Coxeter elements*, Pacific J. Math. 118 (1985), §1(3)–(5);
README Layer 2).  For a McKay labelling `e` of the simple representations of a finite group `G` by
a valid affine type `t`, the representation ring `R(G) = TauCeti.repRing ℂ G` has an additive
isomorphism `Φ` onto `ℤ^(nodes of t)` that

* sends the class of each simple `X` to the basis vector of its node;
* turns multiplication by `[V]` into the McKay matrix `2 − C`;
* sends the class of the regular representation `ℂ[G]` to the vector of marks `δ`;

and the McKay form `(r, s) ↦ Φ r · C Φ s` has radical exactly `ℤ · [ℂ[G]]`, while the composite of
`Φ` with `rootLatticeQuotientMap t` is onto the finite root lattice of the deleted diagram, has
kernel `ℤ · [ℂ[G]]`, and carries the McKay form to the finite Cartan form `t.finiteType.cartanMatrix`.
For `G = {±1}` (`t = Ã₁`) the composite sends the trivial class to `−1`, the sign class to `1`,
and `[ℂ[G]]` to `0`. -/
theorem exists_repRing_addEquiv_of_isMcKayLabelling {G : Type} [Group G] [Finite G]
    (V : FDRep ℂ G) (t : TauCeti.AffineDynkinType) (ht : t.Valid)
    (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes) (hlab : IsMcKayLabelling V t e) :
    ∃ Φ : TauCeti.repRing ℂ G ≃+ (Fin t.nodes → ℤ),
      (∀ (X : FDRep ℂ G) [Simple X],
        Φ (TauCeti.SplitK0.of X) = Pi.single (e (TauCeti.SimpleFDRepClasses.mk X)) 1) ∧
      (∀ r, Φ (TauCeti.SplitK0.of V * r) = ((2 : ℤ) • (1 : Matrix _ _ ℤ) - t.cartanMatrix) *ᵥ Φ r) ∧
      Φ (TauCeti.SplitK0.of (FDRep.of (Representation.leftRegular ℂ G))) = t.marks ∧
      (∀ r, t.cartanMatrix *ᵥ Φ r = 0 ↔
        r ∈ AddSubgroup.zmultiples
          (TauCeti.SplitK0.of (FDRep.of (Representation.leftRegular ℂ G)))) ∧
      Function.Surjective (rootLatticeQuotientMap t ∘ Φ) ∧
      (∀ r, rootLatticeQuotientMap t (Φ r) = 0 ↔
        r ∈ AddSubgroup.zmultiples
          (TauCeti.SplitK0.of (FDRep.of (Representation.leftRegular ℂ G)))) ∧
      ∀ r s, Φ r ⬝ᵥ (t.cartanMatrix *ᵥ Φ s) =
        rootLatticeQuotientMap t (Φ r) ⬝ᵥ
          (t.finiteType.cartanMatrix *ᵥ rootLatticeQuotientMap t (Φ s)) := by
  sorry

/-! ## Layer 4: skew-group algebras and their basic corners -/

section SkewAlgebras

variable {k : Type u} {G : Type v} [Field k] [Group G]

/-- The action of `G` on the symmetric algebra `Sym(V)` by algebra automorphisms, extending the
representation `ρ` on `V = Sym¹(V)`. -/
noncomputable def symmetricAlgebraAut {V : Type u} [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) : G →* (SymmetricAlgebra k V ≃ₐ[k] SymmetricAlgebra k V) where
  toFun g := AlgEquiv.ofAlgHom (SymmetricAlgebra.lift (SymmetricAlgebra.ι k V ∘ₗ ρ g))
    (SymmetricAlgebra.lift (SymmetricAlgebra.ι k V ∘ₗ ρ g⁻¹))
    (SymmetricAlgebra.algHom_ext <| LinearMap.ext fun v => by simp)
    (SymmetricAlgebra.algHom_ext <| LinearMap.ext fun v => by simp)
  map_one' := AlgEquiv.coe_toAlgHom_injective <| SymmetricAlgebra.algHom_ext <|
    LinearMap.ext fun v => by simp
  map_mul' g h := AlgEquiv.coe_toAlgHom_injective <| SymmetricAlgebra.algHom_ext <|
    LinearMap.ext fun v => by simp

/-- The action of `G` on the exterior algebra `Λ(V)` by algebra automorphisms, extending `ρ`. -/
noncomputable def exteriorAlgebraAut {V : Type u} [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) : G →* (ExteriorAlgebra k V ≃ₐ[k] ExteriorAlgebra k V) where
  toFun g := AlgEquiv.ofAlgHom (ExteriorAlgebra.map (ρ g)) (ExteriorAlgebra.map (ρ g⁻¹))
    (ExteriorAlgebra.hom_ext <| LinearMap.ext fun v => by simp)
    (ExteriorAlgebra.hom_ext <| LinearMap.ext fun v => by simp)
  map_one' := AlgEquiv.coe_toAlgHom_injective <| ExteriorAlgebra.hom_ext <|
    LinearMap.ext fun v => by simp
  map_mul' g h := AlgEquiv.coe_toAlgHom_injective <| ExteriorAlgebra.hom_ext <|
    LinearMap.ext fun v => by simp

/-- The action of `G` on the tensor algebra `T(V)` by algebra automorphisms, extending `ρ`. -/
noncomputable def tensorAlgebraAut {V : Type u} [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) : G →* (TensorAlgebra k V ≃ₐ[k] TensorAlgebra k V) where
  toFun g := AlgEquiv.ofAlgHom (TensorAlgebra.lift k (TensorAlgebra.ι k ∘ₗ ρ g))
    (TensorAlgebra.lift k (TensorAlgebra.ι k ∘ₗ ρ g⁻¹))
    (TensorAlgebra.hom_ext <| LinearMap.ext fun v => by simp)
    (TensorAlgebra.hom_ext <| LinearMap.ext fun v => by simp)
  map_one' := AlgEquiv.coe_toAlgHom_injective <| TensorAlgebra.hom_ext <|
    LinearMap.ext fun v => by simp
  map_mul' g h := AlgEquiv.coe_toAlgHom_injective <| TensorAlgebra.hom_ext <|
    LinearMap.ext fun v => by simp

/-- `G` acts on `Sym(V)` through `symmetricAlgebraAut`; this is the action defining the skew
product `Sym(V) ⋊ G = SkewMonoidAlgebra (SymmetricAlgebra k V) G`, in which
`(a # g)(b # h) = a (g • b) # gh`. -/
noncomputable instance symmetricAlgebraAction (V : FDRep k G) :
    MulSemiringAction G (SymmetricAlgebra k V) :=
  MulSemiringAction.compHom (SymmetricAlgebra k V) (symmetricAlgebraAut V.ρ)

/-- The action of `G` on `Sym(V)` is `k`-linear, which makes `Sym(V) ⋊ G` a `k`-algebra. -/
instance symmetricAlgebraAction_smulCommClass (V : FDRep k G) :
    SMulCommClass G k (SymmetricAlgebra k V) :=
  ⟨fun g c x => map_smul (symmetricAlgebraAut V.ρ g) c x⟩

/-- `G` acts on `Λ(V)` through `exteriorAlgebraAut`, defining `Λ(V) ⋊ G`. -/
noncomputable instance exteriorAlgebraAction (V : FDRep k G) :
    MulSemiringAction G (ExteriorAlgebra k V) :=
  MulSemiringAction.compHom (ExteriorAlgebra k V) (exteriorAlgebraAut V.ρ)

/-- The action of `G` on `Λ(V)` is `k`-linear. -/
instance exteriorAlgebraAction_smulCommClass (V : FDRep k G) :
    SMulCommClass G k (ExteriorAlgebra k V) :=
  ⟨fun g c x => map_smul (exteriorAlgebraAut V.ρ g) c x⟩

/-- `G` acts on `T(V)` through `tensorAlgebraAut`, defining `T(V) ⋊ G`. -/
noncomputable instance tensorAlgebraAction (V : FDRep k G) :
    MulSemiringAction G (TensorAlgebra k V) :=
  MulSemiringAction.compHom (TensorAlgebra k V) (tensorAlgebraAut V.ρ)

/-- The action of `G` on `T(V)` is `k`-linear. -/
instance tensorAlgebraAction_smulCommClass (V : FDRep k G) :
    SMulCommClass G k (TensorAlgebra k V) :=
  ⟨fun g c x => map_smul (tensorAlgebraAut V.ρ g) c x⟩

end SkewAlgebras

/-- A **McKay quiver** of `V`: a finite quiver `Q` with a bijection `e` from the isomorphism
classes of simple objects of `FDRep ℂ G` to its vertices such that, for all simples `X` and `Y`,
the arrows of `Q` from `e Y` to `e X` and from `e X` to `e Y` number `dim Hom(X, V ⊗ Y)` together.
Equivalently, the double `Q̄` has exactly `dim Hom(X, V ⊗ Y)` arrows from `e Y` to `e X`; a loop
counts in both directions, so `dim Hom(X, V ⊗ X)` is twice the number of loops at `e X`.  For
`G = {±1}` the Kronecker quiver (two arrows from the trivial to the sign vertex) is one; for the
trivial group with `V = ℂ²` the one-loop quiver is one. -/
def IsMcKayQuiver {G : Type u} [Group G] (V : FDRep ℂ G) (Q : Type v) [Quiver.{w + 1} Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Q) : Prop :=
  ∀ (X Y : FDRep ℂ G) [Simple X] [Simple Y],
    Fintype.card (e (TauCeti.SimpleFDRepClasses.mk Y) ⟶ e (TauCeti.SimpleFDRepClasses.mk X)) +
        Fintype.card (e (TauCeti.SimpleFDRepClasses.mk X) ⟶ e (TauCeti.SimpleFDRepClasses.mk Y)) =
      Module.finrank ℂ (X ⟶ V ⊗ Y)

/-- **The McKay quiver presents the polynomial skew algebra** (Reiten–Van den Bergh; Crawley-Boevey
and Holland, *Noncommutative deformations of Kleinian singularities*, Duke Math. J. 92 (1998),
Theorem 0.1 at `λ = 0`; README Layer 4).  For a finite group `G` with a faithful two-dimensional
complex representation `V` of determinant one and every McKay quiver `Q` of `V`, the skew algebra
`Sym(V) ⋊ G` has a full idempotent `f` (one primitive idempotent of `ℂ[G]` in each Wedderburn
block) whose corner `f (Sym(V) ⋊ G) f` is the preprojective algebra of `Q`.  Fullness makes the
corner Morita equivalent to `Sym(V) ⋊ G`.  The quivers include every orientation of the graph of a
graphical affine type, the Kronecker quiver of `G = {±1}`, and the one-loop quiver of the trivial
group, where both sides are the polynomial ring in two variables. -/
theorem exists_full_corner_equiv_preprojectiveAlgebra {G : Type} [Group G] [Finite G]
    (V : FDRep ℂ G) (hdim : Module.finrank ℂ V = 2)
    (hfaithful : Function.Injective V.ρ) (hdet : ∀ g : G, LinearMap.det (V.ρ g) = 1)
    (Q : Type) [Quiver.{1} Q] [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)]
    (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Q) (hQ : IsMcKayQuiver V Q e) :
    ∃ (f : SkewMonoidAlgebra (SymmetricAlgebra ℂ V) G) (hf : IsIdempotentElem f),
      TwoSidedIdeal.span {f} = ⊤ ∧
        Nonempty (hf.Corner ≃ₐ[ℂ] TauCeti.preprojectiveAlgebra ℂ Q) := by
  sorry

/-- **The McKay quiver presents the exterior skew algebra** (Huerfano and Khovanov, *A category
for the adjoint representation*, J. Algebra 246 (2001), §6.3, Propositions 16–17; README
Layer 4).  When moreover `−1 ∈ G`, the skew algebra `Λ(V) ⋊ G` has a full idempotent whose corner
is the zigzag algebra of the McKay graph.  The hypothesis `−1 ∈ G` is needed: for odd cyclic `G`
the corner is the zigzag algebra with opposite-backtrack ratio `−1` at every vertex, which is not
isomorphic to the ordinary one, since the product of the rescaling equations around the odd cycle
would give `1 = (−1)ⁿ = −1`. -/
theorem exists_full_corner_equiv_zigzag {G : Type} [Group G] [Finite G]
    (V : FDRep ℂ G) (hdim : Module.finrank ℂ V = 2) (hfaithful : Function.Injective V.ρ)
    (hdet : ∀ g : G, LinearMap.det (V.ρ g) = 1) (hneg : ∃ g : G, V.ρ g = -1)
    (t : TauCeti.AffineDynkinType) (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes)
    (hlab : IsMcKayLabelling V t e) (hgraph : t.IsGraphical) :
    ∃ (f : SkewMonoidAlgebra (ExteriorAlgebra ℂ V) G) (hf : IsIdempotentElem f),
      TwoSidedIdeal.span {f} = ⊤ ∧
        Nonempty (hf.Corner ≃ₐ[ℂ] TauCeti.nonisolatedZigzagQuotient ℂ t.graph) := by
  sorry

/-! ## Layer 5: deformed preprojective algebras and the Crawley-Boevey–Holland theorem -/

/-- The **deformed preprojective algebra** `Π^λ(Q)`: the path algebra of the doubled quiver modulo
the two-sided ideal generated by `∑_a (a a* − a* a) − ∑_i λ_i e_i`, with Tau Ceti's relator
`TauCeti.preprojectiveRelator` and vertex idempotents `TauCeti.doubledVertexIdempotent`.  At
`λ = 0` it is `TauCeti.preprojectiveAlgebra k Q`. -/
noncomputable abbrev deformedPreprojectiveAlgebra (k : Type u) [Field k] (Q : Type v) [Quiver Q]
    [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)] (lam : Q → k) : Type _ :=
  TauCeti.pathAlgebra k (Quiver.Symmetrify Q) ⧸
    (TwoSidedIdeal.span {(TauCeti.preprojectiveRelator k Q -
      ∑ i : Q, lam i • TauCeti.doubledVertexIdempotent k i)}).asIdeal

/-- The **CBH relator** `[x, y] − z` in `T(V) ⋊ G`, for the ordered basis `x = b 0`, `y = b 1` of
`V` and `z ∈ ℂ[G]` embedded as `∑_g z_g · (1 # g)`. -/
noncomputable def cbhRelator {G : Type} [Group G] (V : FDRep ℂ G) (b : Module.Basis (Fin 2) ℂ V)
    (z : MonoidAlgebra ℂ G) : SkewMonoidAlgebra (TensorAlgebra ℂ V) G :=
  SkewMonoidAlgebra.single 1
      (TensorAlgebra.ι ℂ (b 0) * TensorAlgebra.ι ℂ (b 1) -
        TensorAlgebra.ι ℂ (b 1) * TensorAlgebra.ι ℂ (b 0)) -
    z.coeff.sum fun g c => SkewMonoidAlgebra.single g (algebraMap ℂ (TensorAlgebra ℂ V) c)

/-- The **Crawley-Boevey–Holland algebra** `S^z = (T(V) ⋊ G) / ([x, y] − z)`. -/
noncomputable abbrev CBHAlgebra {G : Type} [Group G] (V : FDRep ℂ G)
    (b : Module.Basis (Fin 2) ℂ V) (z : MonoidAlgebra ℂ G) : Type :=
  SkewMonoidAlgebra (TensorAlgebra ℂ V) G ⧸ (TwoSidedIdeal.span {cbhRelator V b z}).asIdeal

/-- **The Crawley-Boevey–Holland theorem** (CBH98, Theorem 0.1 and §§3–4; README Layer 5).  For a
finite group `G` with a faithful two-dimensional complex representation `V` of determinant one, a
McKay quiver `Q` of `V` and a central `z ∈ ℂ[G]`, the algebra `(T(V) ⋊ G) / ([x, y] − z)` has a
full idempotent whose corner is the deformed preprojective algebra of `Q` with the **trace**
weights `λ_i = Tr_{ρ_i}(z)`, read at each simple `X` through `e`.  The trace, not the scalar `f_i`
by which `z` acts on `ρ_i`, is the parameter: the two differ by the factor `δ_i = dim ρ_i`, and for
`Q₈` the scalar weights `(1, −1)` at a leaf and the centre give an algebra with a two-dimensional
simple, while the trace weights `(1, −2)` do not (README Layer 5).  A uniform rescaling of the
weights does not change the algebra up to isomorphism: sending every arrow `a` to `c a` and its
reverse `a*` to `c a*` (`c ∈ ℂˣ`) is an isomorphism `Π^(c²λ) ≅ Π^λ`, and `ℂ` has square roots; the
factor `δ_i` is not uniform, which is why the trace and the scalar weights give different
algebras.  For the trivial group and the one-loop quiver both sides are the first Weyl algebra
when `z ≠ 0`. -/
theorem exists_full_corner_equiv_deformedPreprojectiveAlgebra {G : Type} [Group G] [Finite G]
    (V : FDRep ℂ G) (hdim : Module.finrank ℂ V = 2)
    (hfaithful : Function.Injective V.ρ) (hdet : ∀ g : G, LinearMap.det (V.ρ g) = 1)
    (Q : Type) [Quiver.{1} Q] [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)]
    (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Q) (hQ : IsMcKayQuiver V Q e)
    (b : Module.Basis (Fin 2) ℂ V) (z : MonoidAlgebra ℂ G)
    (hz : z ∈ Subalgebra.center ℂ (MonoidAlgebra ℂ G)) (lam : Q → ℂ)
    (hlam : ∀ (X : FDRep ℂ G) [Simple X],
      lam (e (TauCeti.SimpleFDRepClasses.mk X)) =
        LinearMap.trace ℂ X (Representation.asAlgebraHom X.ρ z)) :
    ∃ (f : CBHAlgebra V b z) (hf : IsIdempotentElem f),
      TwoSidedIdeal.span {f} = ⊤ ∧
        Nonempty (hf.Corner ≃ₐ[ℂ] deformedPreprojectiveAlgebra ℂ Q lam) := by
  sorry

end TauCetiRoadmap.McKaySkewGroup
