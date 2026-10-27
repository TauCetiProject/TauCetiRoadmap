import Mathlib
import TauCeti.RepresentationTheory.Simple.Basic
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic
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
* Layer 4: the polynomial skew algebra `Sym(V) ⋊ G` has a full idempotent whose corner is the
  preprojective algebra of the McKay graph; when `−1 ∈ G` the exterior skew algebra `Λ(V) ⋊ G`
  has a full idempotent whose corner is the zigzag algebra of the McKay graph.
* Layer 5: the Crawley-Boevey–Holland theorem, `(T(V) ⋊ G)/([x,y] − z)` has a full idempotent
  whose corner is the deformed preprojective algebra with the trace weights `λ_i = Tr_{ρ_i}(z)`.

The McKay diagram `Ã₁` of `G = {±1}` carries a double edge, and Tau Ceti's quiver of an affine
diagram is built from its simple graph `TauCeti.AffineDynkinType.graph`; the corner theorems are
therefore stated for graphical types, and the `Ã₁` case remains a README target.

Not statable at the pins:

* The Koszul duality of Layer 3, `Λ(V∗) ⋊ G` as the relative quadratic dual of `Sym(V) ⋊ G` over
  `S = k[G]` together with relative Koszulity: neither Mathlib nor Tau Ceti has relative tensor
  algebras over a noncommutative semisimple base, their right duals, or quadratic duals.
* The Layer 2 passage from the representation ring to the affine root lattice: Tau Ceti has
  `TauCeti.repRing`, but no root lattice of an affine type to map to.
* The FKS theorems of Layer 6 (the stable category of curved duplexes over the zigzag algebra and
  the Weyl-group action by reflection functors): there are no curved modules, duplexes, curved
  homotopy categories or stable categories of graded modules at the pins.
* The geometric McKay correspondence of Layer 7 (the exceptional curves of the minimal resolution
  of `ℂ² / G` and their intersection matrix): there is no minimal resolution of a surface
  singularity at the pins.
-/

namespace TauCetiRoadmap.McKaySkewGroup

open CategoryTheory
open scoped MonoidalCategory

universe u v

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

/-- **The McKay quiver presents the polynomial skew algebra** (Reiten–Van den Bergh; Crawley-Boevey
and Holland, *Noncommutative deformations of Kleinian singularities*, Duke Math. J. 92 (1998),
Theorem 0.1 at `λ = 0`; README Layer 4).  Under the hypotheses of the McKay correspondence, for
a McKay labelling by a graphical affine type `t` and every orientation `o` of its graph, the skew
algebra `Sym(V) ⋊ G` has a full idempotent `f` (one primitive idempotent of `ℂ[G]` in each
Wedderburn block) whose corner `f (Sym(V) ⋊ G) f` is the preprojective algebra of `(t.graph, o)`.
Fullness makes the corner Morita equivalent to `Sym(V) ⋊ G`. -/
theorem exists_full_corner_equiv_preprojectiveAlgebra {G : Type} [Group G] [Finite G]
    [Nontrivial G] (V : FDRep ℂ G) (hdim : Module.finrank ℂ V = 2)
    (hfaithful : Function.Injective V.ρ) (hdet : ∀ g : G, LinearMap.det (V.ρ g) = 1)
    (t : TauCeti.AffineDynkinType) (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes)
    (hlab : IsMcKayLabelling V t e) (hgraph : t.IsGraphical)
    (o : TauCeti.DoubledQuiver.Orientation t.graph) :
    ∃ (f : SkewMonoidAlgebra (SymmetricAlgebra ℂ V) G) (hf : IsIdempotentElem f),
      TwoSidedIdeal.span {f} = ⊤ ∧
        Nonempty (hf.Corner ≃ₐ[ℂ]
          TauCeti.preprojectiveAlgebra ℂ (TauCeti.DoubledQuiver.OrientedQuiver t.graph o)) := by
  sorry

/-- **The McKay quiver presents the exterior skew algebra** (Huerfano and Khovanov, *A category
for the adjoint representation*, J. Algebra 246 (2001), §6.3, Propositions 16–17; README
Layer 4).  When moreover `−1 ∈ G`, the skew algebra `Λ(V) ⋊ G` has a full idempotent whose corner
is the zigzag algebra of the McKay graph.  The hypothesis `−1 ∈ G` is needed: for odd cyclic `G`
the corner is the zigzag algebra with opposite-backtrack ratio `−1` at every vertex, which is not
isomorphic to the ordinary one, since the product of the rescaling equations around the odd cycle
would give `1 = (−1)ⁿ = −1`. -/
theorem exists_full_corner_equiv_zigzag {G : Type} [Group G] [Finite G] [Nontrivial G]
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
central `z ∈ ℂ[G]`, the algebra `(T(V) ⋊ G) / ([x, y] − z)` has a full idempotent whose corner is
the deformed preprojective algebra of the McKay graph with the **trace** weights
`λ_i = Tr_{ρ_i}(z)`, read at each simple `X` through the labelling `e`.  The trace, not the scalar
`f_i` by which `z` acts on `ρ_i`, is the parameter: the two differ by `δ_i = dim ρ_i`, and for
`Q₈` the scalar weights `(1, −1)` at a leaf and the centre give an algebra with a two-dimensional
simple, while the trace weights `(1, −2)` do not (README Layer 5).  The statement does not depend
on the basis `b` or the orientation: rescaling all arrows by `c ∈ ℂˣ` identifies `Π^λ` with
`Π^(cλ)`. -/
theorem exists_full_corner_equiv_deformedPreprojectiveAlgebra {G : Type} [Group G] [Finite G]
    [Nontrivial G] (V : FDRep ℂ G) (hdim : Module.finrank ℂ V = 2)
    (hfaithful : Function.Injective V.ρ) (hdet : ∀ g : G, LinearMap.det (V.ρ g) = 1)
    (t : TauCeti.AffineDynkinType) (e : TauCeti.SimpleFDRepClasses ℂ G ≃ Fin t.nodes)
    (hlab : IsMcKayLabelling V t e) (hgraph : t.IsGraphical)
    (o : TauCeti.DoubledQuiver.Orientation t.graph)
    (b : Module.Basis (Fin 2) ℂ V) (z : MonoidAlgebra ℂ G)
    (hz : z ∈ Subalgebra.center ℂ (MonoidAlgebra ℂ G)) (lam : Fin t.nodes → ℂ)
    (hlam : ∀ (X : FDRep ℂ G) [Simple X],
      lam (e (TauCeti.SimpleFDRepClasses.mk X)) =
        LinearMap.trace ℂ X (Representation.asAlgebraHom X.ρ z)) :
    ∃ (f : CBHAlgebra V b z) (hf : IsIdempotentElem f),
      TwoSidedIdeal.span {f} = ⊤ ∧
        Nonempty (hf.Corner ≃ₐ[ℂ]
          deformedPreprojectiveAlgebra ℂ (TauCeti.DoubledQuiver.OrientedQuiver t.graph o) lam) := by
  sorry

end TauCetiRoadmap.McKaySkewGroup
