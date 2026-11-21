module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.Fppf.Basic
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree

/-!
# Scheme and stack foundations, part II — flat cohomology: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with
`sorry`, together with the few definitions their statements need.

The coefficient carrier is Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat` over an affine
base, evaluated on Tau Ceti's affine fppf site `TauCeti.CommAlgCat.fppfTopology`. Fppf cohomology
of an ordinary `R`-algebra `A` is the `Ext` from the sheafified free abelian sheaf on the
representable `Spec A` into the sheaf of points of the group, as in Mathlib's
`CategoryTheory.Sheaf.cohomologyPresheafFunctor`; sheaves take values one universe up, because
sheafification of `AddCommGrpCat.{u}`-valued presheaves on this large site is not available at
the pins, while it is for `AddCommGrpCat.{u+1}`.

The four definitions below are those of README §2.0; they are needed only to state the two
headline theorems of Layer 2.

Stated here (README §2.2 and §2.3):

* `flatCohomology_henselian_invariance`: for a henselian pair `(R, I)`, fppf cohomology of a
  commutative finite locally free `R`-group maps onto that of `R/I` in degrees `≥ 1` and
  bijectively in degrees `≥ 2`;
* `flatCohomology_algebraization`: for a topological ring with an open henselian nonunital
  subring whose ideals form a neighbourhood basis of zero, fppf cohomology agrees with that of
  the completion in degrees `≥ 2`.

Headline theorems not statable at the pins, with what each lacks:

* README §1.5, continuity over derived complete animated rings: there are no animated rings
  (simplicial commutative rings up to weak equivalence), no derived Koszul quotients or derived
  completion of animated rings and no flat cohomology of animated rings at the pins;
* README §3.2, adically faithfully flat descent with supports: besides these, there is no flat
  cohomology with supports at the pins.
-/

universe w u

@[expose] public section

namespace TauCetiRoadmap.SchemeAndStackFoundationsPartII

open CategoryTheory Opposite TauCeti

/-! ## Layer 2: Henselian invariance and algebraization -/

/-- The abelian group of points `A ↦ G(A)` of a commutative finite locally free group `G` over
`R`, as a functor on commutative `R`-algebras: the convolution group of `R`-algebra maps from the
coordinate Hopf algebra of `G` to `A`, which is commutative because the coordinate Hopf algebra is
cocommutative. -/
noncomputable def pointsAddFunctor {R : Type u} [CommRing R]
    (G : FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)) :
    CommAlgCat.{u} R ⥤ AddCommGrpCat.{u} :=
  letI : Coalgebra.IsCocomm R
      (FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G).obj :=
    ((finiteLocallyFreeBicommutativeHopfAlgProperty_iff R _).mp
      (FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G).property).2.2
  { obj := fun A => AddCommGrpCat.of (Additive (WithConv
      ((FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G).obj →ₐ[R] A)))
    map := fun f => AddCommGrpCat.ofHom (MonoidHom.toAdditive (AlgHom.mapValue f.hom))
    map_id := fun _ => by
      simp only [CommAlgCat.hom_id, AlgHom.mapValue_id]
      rfl
    map_comp := fun _ _ => by
      simp only [CommAlgCat.hom_comp, AlgHom.mapValue_comp]
      rfl }

/-- The coefficient sheaf of `G` on the affine fppf site of `R`: the points functor, lifted one
universe and sheafified. The type-valued points presheaf is already an fppf sheaf
(`TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`), so sheafification does not change it. -/
noncomputable def coefficientSheaf {R : Type u} [CommRing R]
    (G : FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)) :
    Sheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1} :=
  (presheafToSheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1}).obj
    (unopUnop (CommAlgCat.{u} R) ⋙ pointsAddFunctor G ⋙ AddCommGrpCat.uliftFunctor.{u+1, u})

/-- Fppf cohomology `A ↦ Hⁿ_fppf(A, G)` of a commutative finite locally free `R`-group, as a
covariant functor on commutative `R`-algebras. Its value at `A` is the `n`-th `Ext` group, in
abelian fppf sheaves on affine `R`-schemes, from the sheafified free abelian sheaf on the
representable presheaf of `Spec A` to the coefficient sheaf of `G`: the `n`-th cohomology of the
slice site over `Spec A`, which is the big affine fppf site of `A` with coefficients `G_A`. -/
noncomputable def flatCohomology {R : Type u} [CommRing R]
    [HasExt.{w} (Sheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1})]
    (G : FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)) (n : ℕ) :
    CommAlgCat.{u} R ⥤ AddCommGrpCat.{w} :=
  opOp (CommAlgCat.{u} R) ⋙
    (yoneda ⋙ (Functor.whiskeringRight _ _ _).obj
        (uliftFunctor.{u+1, u} ⋙ AddCommGrpCat.free) ⋙
      presheafToSheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1}).op ⋙
    (Abelian.extFunctor n).flip.obj (coefficientSheaf G)

/-- **Henselian invariance of flat cohomology** (README §2.2; Česnavičius–Scholze, *Purity for
flat cohomology*, Corollary 5.6.9). For a henselian pair `(R, I)`, with `R` and `I` arbitrary,
and a commutative finite locally free `R`-group `G`, the reduction map
`Hⁿ_fppf(R, G) → Hⁿ_fppf(R/I, G)` is surjective for `n ≥ 1` and bijective for `n ≥ 2`. -/
theorem flatCohomology_henselian_invariance {R : Type u} [CommRing R]
    [HasExt.{w} (Sheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1})]
    (I : Ideal R) [HenselianRing R I]
    (G : FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)) (n : ℕ) :
    (1 ≤ n → Function.Surjective ((flatCohomology G n).map
      (CommAlgCat.ofHom (Ideal.Quotient.mkₐ R I) :
        CommAlgCat.of R R ⟶ CommAlgCat.of R (R ⧸ I)))) ∧
    (2 ≤ n → Function.Bijective ((flatCohomology G n).map
      (CommAlgCat.ofHom (Ideal.Quotient.mkₐ R I) :
        CommAlgCat.of R R ⟶ CommAlgCat.of R (R ⧸ I)))) := by
  sorry

/-- A nonunital subring `B'` of a commutative ring `B` is *henselian* when it satisfies Gabber's
criterion inside `B`: every `x ∈ B'` has a quasi-inverse `y ∈ B'`, that is `(1 + x)(1 + y) = 1`,
and for every `N ≥ 1` and `a₀, …, a_N ∈ B'` the polynomial `T^N (T − 1) + a_N T^N + ⋯ + a₀` has
a root in `1 + B'`. Equivalently, `B'` is a henselian ideal of its Dorroh unitalization `ℤ ⊕ B'`
(Bouthier–Česnavičius §2.1.1; Stacks, Tag 09XI). -/
def IsHenselianNonunitalSubring {B : Type u} [CommRing B] (B' : NonUnitalSubring B) : Prop :=
  (∀ x ∈ B', ∃ y ∈ B', (1 + x) * (1 + y) = 1) ∧
    ∀ N : ℕ, 1 ≤ N → ∀ a : Fin (N + 1) → B', ∃ r ∈ B',
      (1 + r) ^ N * ((1 + r) - 1) + ∑ i : Fin (N + 1), (a i : B) * (1 + r) ^ (i : ℕ) = 0

/-- **Algebraization of flat cohomology over a topological ring** (README §2.3;
Česnavičius–Scholze, *Purity for flat cohomology*, Corollary 5.6.10). Let `B` be a topological
ring, with its additive uniform structure, having an open henselian nonunital subring `B'` such
that every neighbourhood of zero contains an open ideal of `B'`. For every commutative finite
locally free `B`-group `G` the map `Hⁿ_fppf(B, G) → Hⁿ_fppf(B̂, G)` to the separated completion
is bijective for `n ≥ 2`. -/
theorem flatCohomology_algebraization {B : Type u} [CommRing B] [UniformSpace B]
    [IsUniformAddGroup B] [IsTopologicalRing B]
    [HasExt.{w} (Sheaf (CommAlgCat.fppfTopology B) AddCommGrpCat.{u+1})]
    (B' : NonUnitalSubring B) (hB'_open : IsOpen (B' : Set B))
    (hB'_hens : IsHenselianNonunitalSubring B')
    (hB'_basis : ∀ U ∈ nhds (0 : B), ∃ J : AddSubgroup B, (J : Set B) ⊆ B' ∧
      IsOpen (J : Set B) ∧ (∀ x ∈ B', ∀ y ∈ J, x * y ∈ J) ∧ (J : Set B) ⊆ U)
    (G : FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of B)) (n : ℕ) (hn : 2 ≤ n) :
    Function.Bijective ((flatCohomology G n).map
      (CommAlgCat.ofHom (Algebra.ofId B (UniformSpace.Completion B)) :
        CommAlgCat.of B B ⟶ CommAlgCat.of B (UniformSpace.Completion B))) := by
  sorry

end TauCetiRoadmap.SchemeAndStackFoundationsPartII
