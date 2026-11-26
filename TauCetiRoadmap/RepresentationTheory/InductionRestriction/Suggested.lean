import Mathlib
import TauCeti.RepresentationTheory.Invariants
import TauCeti.RepresentationTheory.Induction.Mackey.Decomposition
import TauCeti.RepresentationTheory.Induction.Clifford.Equivalence
import TauCeti.RepresentationTheory.Induction.Clifford.Correspondence
import TauCeti.RepresentationTheory.Induction.Clifford.Obstruction
import TauCeti.RepresentationTheory.Induction.Clifford.Extension.Module

/-!
# Induction, restriction and Mackey theory for finite groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need.

The headline theorems are the four of the README's overview:
* Clifford's theorem over every field, in structural and in character form (README §5.2,
  `exists_resFDRep_iso_cliffordSum`, `clifford_restrict_character`);
* the Clifford correspondence over every field (README §5.3, `clifford_correspondence`);
* the universal central extension `[F, F] / [F, R]` of a perfect group and its kernel
  `(R ∩ [F, F]) / [F, R]` (README §7.1, namespace `AbstractUCE`);
* Clifford obstructions over every field: the scalar obstruction (README §7.5) and the description
  of the representations of the inertia group whose restriction to `N` is a sum of copies of `V`
  as the modules over the crossed product of the division crossed system (README §7.7). Tau Ceti
  proves that the multiplicity functor is fully faithful on these representations
  (`FDRep.cliffordMultiplicityFunctor_map_bijective`); the statement here,
  `exists_cliffordMultiplicityFunctor_obj_iso`, is that every finite-dimensional module is in its
  essential image.

The compatibility of that description with restriction and induction between intermediate
subgroups `N ≤ T' ≤ T` (README §7.8) is not stated: the pins define the multiplicity functor only
for the full inertia group `TauCeti.inertia V`, so the multiplicity functor of `T'` that the
comparisons involve has no carrier.

The translation action of `G` on `N`-subrepresentations and on isotypic components (README §5.2)
is data and is not stated; its laws are Tau Ceti's `TauCeti.Representation.conjSubrep_one` and
`TauCeti.Representation.conjSubrep_conjSubrep`, and its transitivity, stabilizer and equivariance
statements are about that action.

Besides the headline theorems, the file states Mackey's formula as a finite biproduct (README §3.1,
`isIso_biproductDesc_mackeyInclusion`) and defines the two adapters of README §2.1 under the names
by which PolynomialGaloisGroupsPartIII consumes them. Everything this roadmap consumes from Mathlib
and Tau Ceti is listed under "Exact supplier contracts" in the README.
-/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction

open CategoryTheory Limits
open scoped Pointwise Classical MonoidAlgebra

universe u

/-! ## Layer 2: induced characters and Frobenius reciprocity -/

namespace Gassmann

variable {k G D V W : Type*} [CommRing k] [Group G] [Group D]
  [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W]
  {ρ : Representation k G V} {σ : Representation k G W}

/-- An equivalence of representations of `G` restricts, along a group homomorphism `f : D →* G`,
to an equivalence of the restricted representations of `D` (README §2.1). -/
def restrictEquiv (e : ρ.Equiv σ) (f : D →* G) :
    Representation.Equiv (ρ.comp f) (σ.comp f) :=
  Representation.Equiv.mk e.toLinearEquiv (fun d ↦ e.isIntertwining' (f d))

/-- An equivalence of representations of `G` induces, for a normal subgroup `I`, an equivalence of
the representations of `G ⧸ I` on the `I`-invariants (README §2.1). -/
noncomputable def normalInvariantEquiv (e : ρ.Equiv σ) (I : Subgroup G) [I.Normal] :
    (ρ.quotientToInvariants I).Equiv (σ.quotientToInvariants I) :=
  Representation.Equiv.mk (restrictEquiv e I.subtype).invariantsLinearEquiv (by
    intro q
    refine QuotientGroup.induction_on q ?_
    intro g
    apply LinearMap.ext
    intro x
    apply Subtype.ext
    exact congrArg (fun t : V →ₗ[k] W ↦ t (x : V)) (e.isIntertwining' g))

end Gassmann

/-! ## Layer 3: the Mackey decomposition formula -/

/-- **The Mackey decomposition as a finite biproduct** (README §3.1). For subgroups `H`, `K` of `G`
with finitely many double cosets `K \ G / H` and a representation `A` of `H` over a commutative
ring, the morphism out of the biproduct of the Mackey summands
`Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)`, one for each double coset with its chosen representative `s`,
whose component at `s` is the embedding `⟦u ⊗ a⟧ ↦ ⟦s⁻¹ u ⊗ a⟧` into `Res_K (Ind_H^G A)`, is an
isomorphism (Curtis–Reiner §10–11; Mackey 1951). -/
theorem isIso_biproductDesc_mackeyInclusion {k G : Type u} [CommRing k] [Group G]
    {H K : Subgroup G} [Finite (DoubleCoset.Quotient (K : Set G) (H : Set G))]
    [HasFiniteBiproducts (Rep k K)] (A : Rep k H) :
    IsIso (biproduct.desc fun D : DoubleCoset.Quotient (K : Set G) (H : Set G) =>
      Rep.mackeyInclusion K D.out A) := by
  sorry

/-! ## Layer 5: Clifford theory over a normal subgroup -/

/-- **Clifford's theorem over every field** (README §5.2). For a group `G`, a normal subgroup `N`,
a field `k` and a simple finite-dimensional representation `W` of `G`, there are a simple
representation `V` of `N`, with finitely many cosets of its inertia group, and `e ≠ 0` such that
the restriction of `W` to `N` is the direct sum of `e` copies of each conjugate `{}^q V`, `q`
running over those cosets (Curtis–Reiner §11; for complex characters, Isaacs, Ch. 6). Neither
finiteness of `G` nor invertibility of `|G|` in `k` is assumed. -/
theorem exists_resFDRep_iso_cliffordSum {k : Type u} {G : Type u} [Field k] [Group G]
    {N : Subgroup G} [N.Normal] (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (hfinite : Finite (G ⧸ TauCeti.inertia V)),
      let _ := hfinite
      ∃ e : ℕ, e ≠ 0 ∧ Nonempty (Subgroup.resFDRep N W ≅ V.cliffordSum e) := by
  sorry

/-- **Clifford's theorem, character form, over every field** (README §5.2). For a simple
finite-dimensional `W`, there are a simple `V` of `N`, a natural multiplicity `e ≠ 0` and a finite
left transversal `reps` of the inertia group of `V` such that on `N` the character of `W` is `e`
times the sum of the characters of the conjugates `{}^g V`, `g ∈ reps`. In positive characteristic
the identity sees only `(e : k)`. -/
theorem clifford_restrict_character {k : Type u} {G : Type u} [Field k] [Group G]
    {N : Subgroup G} [N.Normal] (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (e : ℕ) (reps : Finset G),
      e ≠ 0 ∧
      (∀ g : G, ∃! r, r ∈ reps ∧ g⁻¹ * r ∈ TauCeti.inertia V) ∧
      ∀ n : N, W.character (n : G)
        = (e : k) * ∑ g ∈ reps, (TauCeti.conjNormalFDRep g V).character n := by
  sorry

/-- **The Clifford correspondence over every field** (README §5.3). Let `N` be a normal subgroup
of a group `G`, `V` a simple representation of `N` whose inertia group `T` has finite index in `G`
(for instance `G` finite), and `k` any field. Then induction from `T` to `G` sends simple
representations of `T` lying over `V` to simple representations of `G` lying over `V`, every
simple representation of `G` lying over `V` arises so, and it determines the representation of `T`
up to isomorphism (Curtis–Reiner §11; for complex characters, Isaacs, Ch. 6). Neither
invertibility of `|G|` in `k` nor a splitting hypothesis is assumed. -/
theorem clifford_correspondence {k : Type u} {G : Type u} [Field k] [Group G]
    {N : Subgroup G} [N.Normal] (V : FDRep k N) [Simple V]
    [(TauCeti.inertia V).FiniteIndex] :
    (∀ U : FDRep k (TauCeti.inertia V), Simple U →
        U.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V →
          Simple (TauCeti.indFDRep U) ∧ (TauCeti.indFDRep U).LiesOver N.subtype V) ∧
    (∀ W : FDRep k G, Simple W → W.LiesOver N.subtype V →
        ∃ U : FDRep k (TauCeti.inertia V), Simple U ∧
          U.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V ∧
          Nonempty (TauCeti.indFDRep U ≅ W)) ∧
    (∀ U U' : FDRep k (TauCeti.inertia V), Simple U → Simple U' →
        U.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V →
        U'.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V →
        Nonempty (TauCeti.indFDRep U ≅ TauCeti.indFDRep U') → Nonempty (U ≅ U')) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction

/-! ## Layer 7: projective representations, factor sets, and the Schur multiplier -/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.AbstractUCE

universe v w

variable (G : Type w) [Group G]

/-- The canonical free presentation `F → G`, sending the generator indexed by `g` to `g`. -/
abbrev presentation : FreeGroup G →* G := FreeGroup.prod

/-- The relation subgroup `R`, the kernel of the canonical free presentation. -/
abbrev relations : Subgroup (FreeGroup G) := (presentation G).ker

/-- The commutator subgroup `[F, F]` of the free group. -/
abbrev derived : Subgroup (FreeGroup G) := commutator (FreeGroup G)

/-- The normal subgroup `[F, R]`. -/
abbrev relationCommutators : Subgroup (FreeGroup G) :=
  ⁅(⊤ : Subgroup (FreeGroup G)), relations G⁆

/-- `[F, R]` is contained in `R`, since `R` is normal. -/
theorem relationCommutators_le_relations : relationCommutators G ≤ relations G :=
  Subgroup.commutator_le_right ⊤ (relations G)

/-- `[F, R]`, as a subgroup of `[F, F]`. -/
abbrev relationsInsideDerived : Subgroup (derived G) :=
  (relationCommutators G).subgroupOf (derived G)

/-- The group `U = [F, F] / [F, R]`. -/
abbrev Cover : Type w := derived G ⧸ relationsInsideDerived G

/-- The homomorphism `U → G` induced by the free presentation. -/
def projection : Cover G →* G :=
  QuotientGroup.lift (relationsInsideDerived G)
    ((presentation G).comp (derived G).subtype) (by
      intro x hx
      exact relationCommutators_le_relations G hx)

/-- For a perfect group the projection `U → G` is surjective. -/
theorem projection_surjective [Group.IsPerfect G] :
    Function.Surjective (projection G) := by
  sorry

/-- The kernel of the projection `U → G` is central in `U`. -/
theorem ker_projection_le_center :
    (projection G).ker ≤ Subgroup.center (Cover G) := by
  sorry

/-- The canonical homomorphism `(R ∩ [F, F]) / [F, R] → ker (U → G)`, sending the class of `x`
to the class of `x` in `U`. -/
def kernelMap :
    (↥(relations G ⊓ derived G) ⧸
      (relationCommutators G).subgroupOf (relations G ⊓ derived G)) →* (projection G).ker :=
  QuotientGroup.lift _
    { toFun := fun x => ⟨QuotientGroup.mk' (relationsInsideDerived G) ⟨x.1, x.2.2⟩, by
        rw [MonoidHom.mem_ker]
        exact x.2.1⟩
      map_one' := rfl
      map_mul' := fun _ _ => rfl }
    (by
      intro x hx
      apply Subtype.ext
      change QuotientGroup.mk' (relationsInsideDerived G) ⟨x.1, x.2.2⟩ = 1
      rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
      exact hx)

/-- **The kernel of `U → G` as `(R ∩ [F, F]) / [F, R]`** (README §7.1): the canonical
homomorphism from `(R ∩ [F, F]) / [F, R]` to the kernel of `U → G` is bijective. -/
theorem kernelMap_bijective : Function.Bijective (kernelMap G) := by
  sorry

/-- `U` is perfect when `G` is; for nontrivial `G` the free commutator subgroup `[F, F]` itself is
not. -/
theorem cover_isPerfect [Group.IsPerfect G] : Group.IsPerfect (Cover G) := by
  sorry

/-- **The universal central extension of a perfect group** (README §7.1). For a perfect group
`G` and every surjective homomorphism `p : E → G` with central kernel, in any universe, there is
exactly one homomorphism `f : U → E` with `p ∘ f` the projection `U → G`. -/
theorem universal [Group.IsPerfect G] {E : Type v} [Group E]
    (p : E →* G) (hp : Function.Surjective p)
    (hcentral : p.ker ≤ Subgroup.center E) :
    ∃! f : Cover G →* E, p.comp f = projection G := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction.AbstractUCE

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction

open CategoryTheory
open scoped MonoidAlgebra

universe u v

section Projective

attribute [local instance] TauCeti.trivialMulDistribMulAction

/-- **Existence of a compatible projective extension, scalar case** (README §7.5). Over any field,
a simple finite-dimensional representation `V` of a normal subgroup `N` whose endomorphisms are
scalars extends to a projective representation of its inertia group, agreeing with `V` on `N`,
with factor set pulled back from the quotient by `N`. -/
theorem exists_scalarProjectiveInertiaExtension {k : Type u} [Field k] {G : Type v} [Group G]
    {N : Subgroup G} [N.Normal] (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    ∃ ρ β, TauCeti.IsProjectiveInertiaExtension V ρ β := by
  sorry

variable {k : Type} [Field k] {G : Type} [Group G]

/-- Any two compatible projective extensions of a simple `V` with scalar endomorphisms have
cohomologous quotient factor sets (README §7.5). -/
theorem scalarProjectiveInertiaExtension_class_eq {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V)
    {ρ ρ' : TauCeti.inertia V → V ≃ₗ[k] V}
    {β β' : TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) →
      TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) → kˣ}
    (h : TauCeti.IsProjectiveInertiaExtension V ρ β)
    (h' : TauCeti.IsProjectiveInertiaExtension V ρ' β') :
    h.factorSet.cohomologyClass = h'.factorSet.cohomologyClass := by
  sorry

/-- **The scalar Clifford obstruction** (README §7.5): the class in `H²(T ⧸ N, kˣ)`, `T` the
inertia group, of the factor set of any compatible projective extension of a simple `V` with
scalar endomorphisms. -/
noncomputable def cliffordObstruction {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    TauCeti.schurMultiplier k (TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V)) :=
  (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec.factorSet.cohomologyClass

/-- Every compatible projective extension represents the obstruction class. -/
theorem scalarProjectiveInertiaExtension_class_eq_obstruction {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V)
    {ρ : TauCeti.inertia V → V ≃ₗ[k] V}
    {β : TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) →
      TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) → kˣ}
    (h : TauCeti.IsProjectiveInertiaExtension V ρ β) :
    h.factorSet.cohomologyClass = cliffordObstruction V hScalar := by
  unfold cliffordObstruction
  exact scalarProjectiveInertiaExtension_class_eq V hScalar h
    (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec

/-- **The obstruction criterion** (README §7.5): the scalar obstruction vanishes exactly when the
action of `N` on `V` extends to an ordinary representation of the inertia group on the same
space. -/
theorem cliffordObstruction_eq_zero_iff {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    cliffordObstruction V hScalar = 0 ↔
      ∃ σ : Representation k (TauCeti.inertia V) V,
        σ.comp (Subgroup.inclusion (TauCeti.le_inertia V)) = V.ρ := by
  sorry

/-- Over an algebraically closed field the scalar obstruction is Tau Ceti's
`TauCeti.cliffordObstruction`. -/
theorem cliffordObstruction_eq_native [IsAlgClosed k] {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    cliffordObstruction V hScalar = TauCeti.cliffordObstruction V := by
  unfold cliffordObstruction
  exact TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction
    (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec

end Projective

/-- **Crossed-product modules are multiplicity spaces** (README §7.7). Let `N` be normal in `G`,
`V` a simple finite-dimensional representation of `N` over any field `k`, and `s` a normalized
section of its Clifford extension. Every module `M` over the crossed product of the division
crossed system (opposite coefficients, inverse factors) that is finite-dimensional over `k` is,
up to isomorphism, the multiplicity space `Hom_N(V, W)` of a finite-dimensional representation `W`
of the inertia group whose restriction to `N` is semisimple and isotypic of type `V`. With Tau
Ceti's full faithfulness of the multiplicity functor on such `W`, this makes the functor an
equivalence onto the finite-dimensional modules. -/
theorem exists_cliffordMultiplicityFunctor_obj_iso {k G : Type u} [Field k] [Group G]
    {N : Subgroup G} [N.Normal] (V : FDRep k N) [Simple V]
    (s : (TauCeti.CliffordExtension.groupExtension V).Section) (hs : s 1 = 1)
    (M : Type u) [AddCommGroup M]
    [Module (TauCeti.CrossedSystem.Algebra (FDRep.cliffordCrossedSystem V s hs).opInv) M]
    [Module k M] [IsScalarTower k
      (TauCeti.CrossedSystem.Algebra (FDRep.cliffordCrossedSystem V s hs).opInv) M]
    [FiniteDimensional k M] :
    ∃ W : FDRep k (TauCeti.inertia V),
      IsSemisimpleModule k[N] (Representation.asModule (FDRep.ρ
        ((Action.res (FGModuleCat k) (Subgroup.inclusion (TauCeti.le_inertia V))).obj W))) ∧
      IsIsotypicOfType k[N] (Representation.asModule (FDRep.ρ
        ((Action.res (FGModuleCat k) (Subgroup.inclusion (TauCeti.le_inertia V))).obj W)))
        (Representation.asModule V.ρ) ∧
      Nonempty ((FDRep.cliffordMultiplicityFunctor V s hs).obj W ≅ ModuleCat.of _ M) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction
