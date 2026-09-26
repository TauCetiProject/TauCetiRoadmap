import Mathlib

/-!
# Continuous cohomology of profinite groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the layer-by-layer build plan Layers 0-13, the worked examples, and
the references) is in `README.md`. At the repository pin, Mathlib carries the canonical object as
`continuousCohomology n X : TopModuleCat k` for `X : TopRep k G`, together with
`TopRep.homogeneousCochains`, the degree-0 computation, and the functorial maps
`ContinuousCohomology.resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`, `map_id`, and
`map_comp`. This file uses those Mathlib declarations directly. A pair of private notation adapters
below only preserves the concise `.obj`/`.map` notation used throughout these suggested signatures;
it creates no second public cohomology API.

The two central interfaces are prototyped here rather than described. Layer 1's chain is
Mathlib's `resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`, `map_id`, and `map_comp`, followed by
this roadmap's `res`,
`quotientToInvariants`, `infl` and `coeffMap`, together with `IsSmoothDiscrete` and the
dictionary `ofDiscreteModule`. Layer 2's explicit theory is `C1`, `C2`, `d0`, `d1`, `Z1`, `Z2`,
`B1`, `B2`, `H0`, `H1`, `H2` and the two class maps. With those in place Layer 3's comparison
isomorphisms and Layer 9's class-level `kummerMap` and `kummerIso` are statable, and they are
stated.

Every operation the roadmap exports is named in all three low degrees where it exists in all three,
and every comparison between the explicit model and the canonical object is named as well, so that
a consumer never has to prove that two of these declarations agree. That is `explicitRes0/1/2`,
`explicitInfl1/2`, `explicitCoeff0/1/2`, `explicitCor0/1/2`, `explicitDelta0/1`, the six cups
`explicitCup00/01/10/02/11/20`, and the comparisons `explicitIso_map`, `explicitIso_res`,
`explicitIso_infl`, `explicitIso_coeffMap`, `explicitIso_delta0/1`, `explicitIso_cor0`,
`explicitIso_cor`, `explicitIso_cor2`, `explicitIso_cup` and `explicitIso_kummerMap`.

Every law below is an equation between named maps. A law about restriction names `res`, one about
corestriction names `corestriction` or its relative form `corestrictionLe`, and one comparing the
explicit model with the canonical object names both sides. Where a map is not yet constructed it is
declared here as a target with a `sorry` body, rather than left as a parameter of the law: a law
quantified over an arbitrary morphism is not a weaker statement about the intended map, it is a
different and false statement about every morphism. The maps carried for that reason are
`ofDiscreteModuleMap`, `ofDiscreteModuleQuotient`, `ofDiscreteModulePair`,
`ofDiscreteModulePairing`, `quotientToInvariantsι`, `explicitMap1`, `explicitInfl1`,
`explicitCor1`, `explicitCup11`, `explicitConj1`, `explicitFiniteQuotientComparison1`, `delta`,
`transgression`, `cochainClass`, `resLe`, `corestrictionLe`, `conjOpenSubgroup`,
`conjMapOf`, `mackeyTerm`, `powerClassMap`, `powerClassNorm`, `kummerRes`, `kummerCor`,
`kummerMapCanonical`, `kummerShortExact`, `f2Pairing`, `cupFamily`, `quotientOpenSubgroup`,
`trivialF2Quotient`, `trivialF2Infl`, `trivialF2InflSub`, `evensNormLe`,
`evensDoubleCosetFactor`, `homClass`, `graphClass`, `galoisSubgroup`, `galoisSubgroupEquiv` and
`galoisF2Iso`.

Two hypotheses are carried as **data** rather than left implicit, because the constructions do not
exist without them. `CosetTransversal U` bundles a section of `G → G ⧸ U` with the proof that it is
one: for an arbitrary function the Schreier factors need not lie in `U`, so the monomial
homomorphism has no target. `DiscreteShortExact G A B C` bundles a short exact sequence of discrete
`G`-modules with its two maps: the connecting maps, their exactness, their naturality and the
corestriction compatibility are all statements about the same sequence, and each of them has to
name the same two coefficient maps.

The index-two Evens block carries **no** chosen element outside `U`, and no structure bundling one.
Everything stated at class level is choice-free: `evensConj` is `res ∘ cor - id`, `graphClass` is a
function of `U` and `α`, and the four identities take only `(G : U) = 2`. The element `s` appears
exactly where the cochain formulas need it, in `evensGraphCochain`, `evensCorCochain` and their
cocycle theorems, and the two theorems tying the class-level maps to those cochains
(`evensConj_eq_conjMapOf`, `graphClass_eq_cochainClass`) quantify over **every** `s ∉ U`. A bundled
choice would have made every exported identity a statement about that choice.

Degree 1 of the index-two form is stated on **cochains**, not on classes. `evensB1` and `evensBs`
are not cocycles: for `G = C₄ = ⟨σ⟩`, `U = ⟨σ²⟩`, `s = σ` and `α ≠ 0`, the values of `evensB1` at
`1, σ, σ², σ³` are `0, 1, 1, 0`, so it is not a homomorphism. Only their sum `evensCorCochain` is,
and only the sum is given a class.

Also prototyped: the discrete-module openness API, the invariant coefficients `M^U` with their
`G ⧸ U`-action, the internal hom with its evaluation pairing `evalPairing`, and continuous sections
of profinite quotients (Layer 0); trivial-action `H¹` worked examples through
`ContinuousAddMonoidHom` and the two topological facts the Layer 3 comparison rests on (Layers 2
and 3); the strict finite-level descent of continuous cocycles, the whole transition package of the
finite-quotient system, and the colimit theorem as universality of the named comparison cocone
(Layer 4); the exactness of discrete cochain lifting, the two connecting maps with the eight
exactness nodes, and the transgression with the five-term sequence (Layer 5); the corestriction
transversal calculus for a **variable** transversal, with the representative action that general
coefficients force (Layer 6); the coinduced module, the uniform local constancy behind it, and the
trace morphism all-degree corestriction is built from (Layers 7 and 10); two cup-product cocycle
identities, the six low-degree shapes and the `C₂` nontriviality anchor (Layer 8); the profinite
Galois group of the separable closure, the roots of unity and power classes, the general-`n`
Kummer cocycle, the multiplicative coefficients `UnitsCoeff` with the Kummer sequence and Hilbert
90, and the field-extension bridge `galoisSubgroup` with its restriction, corestriction and norm
(Layer 9); the order-theoretic wrapper `leastENatBound`, the two vanishing predicates and the three
invariants `cd_p`, `scd_p`, `cd` with their two dévissage reductions (Layer 11); the coefficient
pairing and the bidegree cup (Layer 12); and the index-2 Evens graph cocycle with its `C₄` and `C₈`
anchors (Layer 13).

The group and its coefficients live in one universe `u` and the coefficient **ring** in another.
That is forced, not chosen: the canonical resolution is built from `C(G, -)`, so a coefficient
module of `TopRep R G` cannot live below the universe of `G`. The trivial `𝔽₂` object therefore
carries `ULift (ZMod 2)`, so that the Evens norm and the Kummer classes are available over a field
in any universe. The only declarations left at `Type 0` are the three comparisons with Mathlib's
discrete `groupCohomology`, where `Rep k G` puts `k` and `G` in one universe and `k` is `ℤ`; they
carry their own binders and say so.

Two descriptions of the coefficients appear, as `README.md` §3 fixes them. Statements about
explicit cochains are written against the unbundled classes `[AddCommGroup M]
[DistribMulAction G M]`, with `Invariants U M` for `M^U`; statements about cohomology objects
and the arrows between them are written against `TopRep`, and against Mathlib's `Rep k G` at the
finite levels. Layer 1's dictionary identifies the two, on the smooth discrete subcategory and
not on all of `TopRep`.

Cocycle identities are spelled with the pinned Mathlib's own `groupCohomology.IsCocycle₁` and
`IsCocycle₂` (or their explicit trivial-action forms where no `SMul` instance is available),
which fixes the conventions of `README.md`.
-/

universe u v

namespace TauCetiRoadmap.ProfiniteCohomology

/-- The roadmap works in the universe where coefficient modules and the profinite group live
together. This is definitionally Mathlib's `TopRep`; the explicit universe parameter prevents
unconstrained carrier-universe metavariables in signatures quantified only over `G`. -/
abbrev TopRep (R : Type v) [Ring R] [TopologicalSpace R]
    (G : Type u) [Monoid G] := _root_.TopRep.{u} R G

/-! ### Layer 0: discrete modules, invariant coefficients, and continuous sections -/

/-- **Layer 0, every element of a discrete module has an open stabilizer.** Over a profinite
group (compact, totally disconnected, in the unbundled classes of the roadmap's conventions),
every element of a discrete module is fixed by an open **normal** subgroup: the orbit map
factors elementwise
through a finite quotient, so `M = ⋃_U M^U`. The Layer 4 colimit uses that union.
(Consume `stabilizer_isOpen`/`continuousSMul_iff_stabilizer_isOpen` and
`exist_openNormalSubgroup_sub_open_nhds_of_one`.) -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {M : Type*} [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] (m : M) :
    ∃ U : OpenNormalSubgroup G, ∀ u ∈ U, u • m = m :=
  sorry

/-- **Layer 0, the invariant coefficients `M^U`.** The coefficient system of the finite-level
tower, as an additive subgroup of `M`. It is written for an arbitrary subgroup; the two
actions below need `U` normal. -/
def Invariants {G : Type*} [Group G] (U : Subgroup G) (M : Type*) [AddCommGroup M]
    [DistribMulAction G M] : AddSubgroup M where
  carrier := {m | ∀ u ∈ U, u • m = m}
  add_mem' {a b} ha hb u hu := by
    simp only [Set.mem_setOf_eq] at *
    rw [smul_add, ha u hu, hb u hu]
  zero_mem' u _ := smul_zero u
  neg_mem' {a} ha u hu := by
    simp only [Set.mem_setOf_eq] at *
    rw [smul_neg, ha u hu]

/-- **Layer 0, `G` acts on `M^U` for normal `U`.** The subgroup `M^U` is `G`-stable because
`u • (g • m) = g • ((g⁻¹ u g) • m)` and `g⁻¹ u g` lies in `U`. -/
instance {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    (U : Subgroup G) [U.Normal] : DistribMulAction G (Invariants U M) where
  smul g m := ⟨g • (m : M), by
    intro u hu
    have h : (g⁻¹ * u * g) • (m : M) = m := m.2 _ (Subgroup.Normal.conj_mem' ‹_› u hu g)
    calc u • g • (m : M) = (u * g) • (m : M) := (mul_smul _ _ _).symm
      _ = (g * (g⁻¹ * u * g)) • (m : M) := by congr 1; group
      _ = g • ((g⁻¹ * u * g) • (m : M)) := mul_smul _ _ _
      _ = g • (m : M) := by rw [h]⟩
  one_smul m := Subtype.ext (one_smul G (m : M))
  mul_smul g h m := Subtype.ext (mul_smul g h (m : M))
  smul_zero g := Subtype.ext (smul_zero g)
  smul_add g m n := Subtype.ext (smul_add g (m : M) (n : M))

/-- **Layer 0, `U` acts trivially on `M^U`, so the action descends to `G ⧸ U`.** This is the
action that makes the finite-level cocycle statements of Layer 4 well typed. -/
instance {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    (U : Subgroup G) [U.Normal] : MulAction (G ⧸ U) (Invariants U M) :=
  MulAction.ofEndHom <| QuotientGroup.lift U
    (MulAction.toEndHom : G →* Function.End (Invariants U M))
    (fun g hg => funext fun a => Subtype.ext (a.2 g hg))

instance {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    (U : Subgroup G) [U.Normal] : DistribMulAction (G ⧸ U) (Invariants U M) where
  smul_zero q := by
    induction q using QuotientGroup.induction_on with | _ g => exact smul_zero g
  smul_add q a b := by
    induction q using QuotientGroup.induction_on with | _ g => exact smul_add g a b

/-- **Layer 0, continuous sections of profinite quotients** (Ribes-Zalesskii Prop. 2.2.2).
For a **closed** subgroup `H` of a profinite group the projection `G → G ⧸ H` has a
continuous section normalized at the identity coset. This is the input that Layer 5's
transgression, the exactness of Layer 7's coinduction, and the inverse map in Layer 7's
Shapiro isomorphism all lift through, and it is stated once for all three. Nothing here is
needed for an **open** subgroup, where the finite transversal `Quotient.out` already
suffices; `Quotient.out` is *not* a substitute for this statement, since it is not continuous
when `H` has infinite index. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    ∃ s : G ⧸ H → G, Continuous s ∧ (∀ x : G ⧸ H, QuotientGroup.mk (s x) = x) ∧
      s (QuotientGroup.mk 1) = 1 :=
  sorry

/-- **Layer 0, the internal hom with its conjugation action.** For discrete `M` and `N` the
additive homomorphisms `M →+ N` carry `(g • φ) m = g • φ (g⁻¹ • m)`, and for **finite** `M` this
is again a discrete `G`-module. Evaluation is then a `G`-equivariant biadditive pairing, which is
the pairing the duality package of Layer 8 is an instance of. -/
def homAction {G : Type*} [Group G] {M N : Type*} [AddCommGroup M] [AddCommGroup N]
    [DistribMulAction G M] [DistribMulAction G N] (g : G) (φ : M →+ N) : M →+ N :=
  (DistribSMul.toAddMonoidHom N g).comp (φ.comp (DistribSMul.toAddMonoidHom M g⁻¹))

/-- **Layer 0, the evaluation pairing.** The biadditive map `(M →+ N) →+ M →+ N` sending `φ` and
`m` to `φ m`, which is the pairing the duality package of Layer 8 feeds to the cup products. It is
named rather than written inline at each use, because the duality pairings of Layer 8 and of the
Class Field Theory roadmap are instances of the six-shape cup API **at this pairing** and at no other. -/
def evalPairing (M N : Type*) [AddCommGroup M] [AddCommGroup N] : (M →+ N) →+ M →+ N :=
  AddMonoidHom.id (M →+ N)

/-- **Layer 0, evaluation is equivariant.** The statement that makes the duality cup pairings of
Layer 8 well typed, and the one the Class Field Theory roadmap names when it states local Tate duality.
It is proved rather than assumed, because it is what fixes the sign of the conjugation action. -/
theorem evalPairing_equivariant {G : Type*} [Group G] (M N : Type*) [AddCommGroup M]
    [AddCommGroup N] [DistribMulAction G M] [DistribMulAction G N] (g : G) (φ : M →+ N) (m : M) :
    evalPairing M N (homAction g φ) (g • m) = g • evalPairing M N φ m := by
  simp [evalPairing, homAction, inv_smul_smul]

/-! ### Layer 1: the canonical carrier and its functoriality -/

open CategoryTheory
/-- **Layer 1, the smooth discrete objects.** An object of `TopRep` carries one continuous
operator per group element and nothing there forces the action to be continuous in the group
variable, so an object whose module is discrete can still have non-open stabilizers. The
dictionary of `README.md` Layer 1 is an equivalence with **this** subcategory and not with all of
`TopRep`, and every canonical-facing comparison below quantifies over it. -/
structure IsSmoothDiscrete (R : Type v) [CommRing R] [TopologicalSpace R]
    {G : Type u} [Group G] [TopologicalSpace G] (X : TopRep R G) : Prop where
  /-- the underlying module is discrete -/
  discreteTopology : DiscreteTopology X.V
  /-- every point stabilizer is open, which for a discrete module is continuity of the action -/
  stabilizer_isOpen : ∀ x : X.V, IsOpen {g : G | X.ρ g x = x}

/-- The object and morphism fields used by the private homogeneous-cochain notation adapter. -/
private structure HomogeneousCochainsAdapter
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] where
  obj : TopRep R G → CochainComplex (TopModuleCat.{u} R) ℕ
  map : {X Y : TopRep R G} → (X ⟶ Y) → (obj X ⟶ obj Y)

/-- Private notation adapter for the canonical Mathlib cochain complex. It is not a roadmap
declaration: its only purpose is to retain compact `.obj`/`.map` notation in target types. The
functor laws themselves are Mathlib's `cochainsMap_id` and `cochainsMap_comp`. -/
private noncomputable def homogeneousCochainsFunctor
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    HomogeneousCochainsAdapter R G where
  obj X := TopRep.homogeneousCochains X
  map f := ContinuousCohomology.cochainsMap (ContinuousMonoidHom.id G) f

/-- The object and morphism fields used by the private continuous-cohomology notation adapter. -/
private structure ContinuousCohomologyAdapter
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (n : ℕ) where
  obj : TopRep R G → TopModuleCat.{u} R
  map : {X Y : TopRep R G} → (X ⟶ Y) → (obj X ⟶ obj Y)

/-- Private notation adapter for Mathlib's object-valued `continuousCohomology`. This is not a
second public carrier; its objects and maps are definitionally the canonical Mathlib ones, and
their functor laws are Mathlib's `map_id` and `map_comp`. -/
private noncomputable def continuousCohomology
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (n : ℕ) : ContinuousCohomologyAdapter R G n where
  obj X := _root_.continuousCohomology n X
  map f := ContinuousCohomology.map (ContinuousMonoidHom.id G) f n

/-- **Layer 10, the canonical carrier packaged as an actual functor.** Its object and map fields
are Mathlib's `continuousCohomology` and `ContinuousCohomology.map`; the functor laws are
Mathlib's `map_id` and `map_comp`. This packaging is what the filtered-colimit theorem names. -/
noncomputable def continuousCohomologyFunctor
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (n : ℕ) :
    TopRep R G ⥤ TopModuleCat.{u} R :=
  sorry

/-- **Layer 10, Mathlib's homogeneous cochains packaged as a functor.** This is the functor to
which the short exact coefficient complex is mapped before applying the homology-sequence API. -/
noncomputable def continuousCochainsFunctor
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TopRep R G ⥤ CochainComplex (TopModuleCat.{u} R) ℕ :=
  sorry

noncomputable instance continuousCochainsFunctor_preservesZeroMorphisms
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    (continuousCochainsFunctor R G).PreservesZeroMorphisms :=
  sorry

section Carrier

open CategoryTheory

variable (R : Type v) [CommRing R] [TopologicalSpace R]
  {G H K : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
  [Group K] [TopologicalSpace K] [IsTopologicalGroup K]

/-- **Layer 1, the carrier is already at the pin.** No part of this roadmap builds a continuous
cohomology object; this example records that the canonical Mathlib object elaborates here. -/
noncomputable example (X : TopRep R G) (n : ℕ) : TopModuleCat R :=
  _root_.continuousCohomology n X

/-- **Layer 1, degree 0 is already computed at the pin.** The only degree Mathlib evaluates.
Layer 3's comparison is checked against this before any harder degree exists. -/
noncomputable example (X : TopRep R G) :
    _root_.continuousCohomology 0 X ≅ X.invariants :=
  ContinuousCohomology.zeroIso X

/-- **Layer 1, restriction to a subgroup,** the first of the three named instances of `map`. The
subgroup carries the subspace topology and needs no openness or closedness hypothesis. -/
noncomputable def res (S : Subgroup G) (X : TopRep R G) (n : ℕ) :
    (continuousCohomology R G n).obj X ⟶
      (continuousCohomology R S n).obj ((TopRep.resFunctor S.subtype).obj X) :=
  sorry

/-- **Layer 1, the invariants of a closed normal subgroup, as a `G ⧸ N`-object.** The coefficient
half of inflation, and the canonical-side twin of Mathlib's discrete `Rep.quotientToInvariants`. -/
noncomputable def quotientToInvariants (N : Subgroup G) [N.Normal] (X : TopRep R G) :
    TopRep R (G ⧸ N) :=
  sorry

/-- **Layer 1, the invariants of a closed normal subgroup include into the object.** The
coefficient half of the inflation compatible pair, as a morphism of `G`-objects. Layer 12's
inflation compatibility for the cup product is stated through it, because the two pairings that
compatibility relates live on objects with different underlying modules, so they cannot be compared
by an equation between their bilinear maps the way the restricted pairing can. -/
noncomputable def quotientToInvariantsι (N : Subgroup G) [N.Normal] (X : TopRep R G) :
    (TopRep.resFunctor (QuotientGroup.mk' N : G →* G ⧸ N)).obj (quotientToInvariants R N X) ⟶ X :=
  sorry

/-- **Layer 1, inflation,** the second named instance. -/
noncomputable def infl (N : Subgroup G) [N.Normal] (X : TopRep R G) (n : ℕ) :
    (continuousCohomology R (G ⧸ N) n).obj (quotientToInvariants R N X) ⟶
      (continuousCohomology R G n).obj X :=
  sorry

/-- **Layer 1, coefficient maps,** the third named instance, at `φ = id`. This one the pin
already gives, since the carrier is a functor. -/
noncomputable def coeffMap {X Y : TopRep R G} (f : X ⟶ Y) (n : ℕ) :
    (continuousCohomology R G n).obj X ⟶ (continuousCohomology R G n).obj Y :=
  (continuousCohomology R G n).map f

/-- **Layer 1, the class of a continuous cocycle.** The quotient map from the cocycles of the
canonical complex onto continuous cohomology. A construction given by a cochain formula, such as
Layer 13's norm, is compared with a class-valued map through this, and without it the public
class-valued function would have no stated relation to the cochain it descends from. -/
noncomputable def cochainClass (X : TopRep R G) (n : ℕ)
    (a : ((homogeneousCochainsFunctor R G).obj X).X n)
    (ha : (((homogeneousCochainsFunctor R G).obj X).d n (n + 1)).hom a = 0) :
    (continuousCohomology R G n).obj X :=
  sorry

/-- **Layer 1, cohomologous cocycles have the same class.** -/
theorem cochainClass_eq_of_sub_eq_d (X : TopRep R G) (n j : ℕ) (hj : j + 1 = n)
    (a b : ((homogeneousCochainsFunctor R G).obj X).X n)
    (ha : (((homogeneousCochainsFunctor R G).obj X).d n (n + 1)).hom a = 0)
    (hb : (((homogeneousCochainsFunctor R G).obj X).d n (n + 1)).hom b = 0)
    (c : ((homogeneousCochainsFunctor R G).obj X).X j)
    (hc : a - b = hj ▸ ((((homogeneousCochainsFunctor R G).obj X).d j
      (j + 1)).hom c)) :
    cochainClass R X n a ha = cochainClass R X n b hb :=
  sorry

end Carrier

open CategoryTheory in
/-- **Layer 1, the categorical dictionary.** A discrete `G`-module in the unbundled classes of
`README.md` §3 becomes an object of `TopRep ℤ G`. This is where the explicit statements of
Layers 2 to 9 meet the canonical API, and it is the translation Layer 3's comparison is stated
across. The universe restriction (`ℤ` forces the group into `Type`) is the `Action`/`Rep`
restriction the roadmap flags, not a mathematical hypothesis. -/
noncomputable def ofDiscreteModule (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M]
    [ContinuousSMul G M] : TopRep ℤ G :=
  sorry

/-- **Layer 1, the dictionary lands in the smooth subcategory.** The half of the equivalence that
says the constructor is well behaved; the other half says every smooth discrete object arises this
way. Without this pair the dictionary would be a one-way constructor and Layer 3's comparison
would have nothing to quantify over. -/
theorem ofDiscreteModule_isSmoothDiscrete (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M]
    [ContinuousSMul G M] : IsSmoothDiscrete ℤ (ofDiscreteModule G M) :=
  sorry

section CoefficientEquivalence

open CategoryTheory

variable (R : Type v) [CommRing R] [TopologicalSpace R]
  (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 1, the smooth discrete full subcategory.** The half of `TopRep` the dictionary is an
equivalence with. -/
def SmoothDiscreteTopRep : Type _ :=
  ObjectProperty.FullSubcategory (fun X : TopRep R G => IsSmoothDiscrete R X)

noncomputable instance : Category (SmoothDiscreteTopRep R G) :=
  inferInstanceAs (Category (ObjectProperty.FullSubcategory _))

/-- Smooth discrete objects inherit zero morphisms from `TopRep`; the zero map preserves the
underlying object property. -/
noncomputable instance : CategoryTheory.Limits.HasZeroMorphisms (SmoothDiscreteTopRep R G) :=
  sorry

/-- **Layer 1, the inclusion of the smooth discrete subcategory into `TopRep`,** which is how a
coinduced object of Layer 7 reaches the canonical cohomology functor. -/
noncomputable def smoothDiscreteι : SmoothDiscreteTopRep R G ⥤ TopRep R G :=
  ObjectProperty.ι (fun X : TopRep R G => IsSmoothDiscrete R X)

/-- **Layer 1, the unbundled side as a category.** The discrete `G`-modules of `README.md` §3,
bundled so that the dictionary can be an equivalence of categories rather than a constructor. -/
structure DiscreteRep where
  /-- the underlying module -/
  V : Type u
  [addCommGroup : AddCommGroup V]
  [module : Module R V]
  [topologicalSpace : TopologicalSpace V]
  [discrete : DiscreteTopology V]
  [distribMulAction : DistribMulAction G V]
  [smulCommClass : SMulCommClass G R V]
  [continuousSMul : ContinuousSMul G V]

attribute [instance] DiscreteRep.addCommGroup DiscreteRep.module DiscreteRep.topologicalSpace
  DiscreteRep.discrete DiscreteRep.distribMulAction DiscreteRep.smulCommClass
  DiscreteRep.continuousSMul

/-- **Layer 1, the morphisms of the unbundled side:** the continuous equivariant `R`-linear maps,
which are the maps the explicit theory of Layer 2 is functorial in. -/
structure DiscreteRepHom (X Y : DiscreteRep R G) where
  /-- the underlying linear map -/
  toLinearMap : X.V →ₗ[R] Y.V
  /-- continuity -/
  cont : Continuous toLinearMap
  /-- equivariance -/
  equivariant : ∀ (g : G) (x : X.V), toLinearMap (g • x) = g • toLinearMap x

noncomputable instance : Category (DiscreteRep R G) where
  Hom X Y := DiscreteRepHom R G X Y
  id X := ⟨LinearMap.id, continuous_id, fun _ _ => rfl⟩
  comp f g := ⟨g.toLinearMap ∘ₗ f.toLinearMap, g.cont.comp f.cont,
    fun a x => by simp [f.equivariant, g.equivariant]⟩

/-- **Layer 1, the dictionary going in.** -/
noncomputable def toSmoothDiscrete : DiscreteRep R G ⥤ SmoothDiscreteTopRep R G := sorry

/-- **Layer 1, the dictionary coming back.** This is the half a one-way constructor does not
give, and without it the "equivalence" would be an assertion rather than a theorem. -/
noncomputable def ofSmoothDiscrete : SmoothDiscreteTopRep R G ⥤ DiscreteRep R G := sorry

/-- **Layer 1, the equivalence of coefficient categories,** with its unit and counit. This is the
statement that keeps the explicit theory from being a second theory of coefficients. -/
noncomputable def discreteRepEquivSmoothTopRep :
    DiscreteRep R G ≌ SmoothDiscreteTopRep R G :=
  sorry

end CoefficientEquivalence

/-! ### Layer 2: the explicit low-degree complex -/

section ExplicitComplex

variable (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type*) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]

/-- **Layer 2, `C¹`.** Cochains are plain functions with continuity as a predicate, matching the
shape of the pin's `groupCohomology.cocycles₁ : Submodule k (G → A)` rather than bundled
`C(G, M)`; §3 of `README.md` fixes that convention and Layer 3 crosses to the bundled form once. -/
def C1 : AddSubgroup (G → M) where
  carrier := {f | Continuous f}
  add_mem' hf hg := hf.add hg
  zero_mem' := continuous_const
  neg_mem' hf := hf.neg

/-- **Layer 2, `C²`.** -/
def C2 : AddSubgroup (G × G → M) where
  carrier := {f | Continuous f}
  add_mem' hf hg := hf.add hg
  zero_mem' := continuous_const
  neg_mem' hf := hf.neg

/-- **Layer 2, `d⁰ m = fun g ↦ g • m - m`.** -/
def d0 : M →+ (G → M) where
  toFun m := fun g => g • m - m
  map_zero' := by ext g; simp
  map_add' m m' := by ext g; simp only [Pi.add_apply, smul_add]; abel

/-- **Layer 2, `d¹ f (g, h) = g • f h - f (g * h) + f g`.** -/
def d1 : (G → M) →+ (G × G → M) where
  toFun f := fun q => q.1 • f q.2 - f (q.1 * q.2) + f q.1
  map_zero' := by ext q; simp
  map_add' f f' := by ext q; simp only [Pi.add_apply, smul_add]; abel

/-- **Layer 2, `Z¹ = C¹ ⊓ ker d¹`,** with the kernel spelled by the pin's `IsCocycle₁`. -/
def Z1 : AddSubgroup (G → M) :=
  C1 G M ⊓
    { carrier := {f | groupCohomology.IsCocycle₁ f}
      add_mem' := fun {a b} ha hb g h => by
        simp only [Pi.add_apply, ha g h, hb g h, smul_add]; abel
      zero_mem' := fun g h => by simp
      neg_mem' := fun {a} ha g h => by
        simp only [Pi.neg_apply, ha g h, smul_neg]; abel }

/-- **Layer 2, `Z² = C² ⊓ ker d²`.** -/
def Z2 : AddSubgroup (G × G → M) :=
  C2 G M ⊓
    { carrier := {f | groupCohomology.IsCocycle₂ f}
      add_mem' := fun {a b} ha hb g h j => by
        simp only [Pi.add_apply, smul_add]
        rw [add_add_add_comm, ha g h j, hb g h j, add_add_add_comm]
      zero_mem' := fun g h j => by simp
      neg_mem' := fun {a} ha g h j => by
        simp only [Pi.neg_apply, smul_neg, ← neg_add]
        exact congrArg Neg.neg (ha g h j) }

/-- **Layer 2, `B¹ = range d⁰`.** Every such cochain is automatically continuous, which is why no
intersection with `C¹` appears here and one does appear in `B²`. -/
def B1 : AddSubgroup (G → M) := (d0 G M).range

/-- **Layer 2, `B² = d¹(C¹)`,** the image of the **continuous** 1-cochains. -/
def B2 : AddSubgroup (G × G → M) := AddSubgroup.map (d1 G M) (C1 G M)

/-- **Layer 2, `d ∘ d = 0` in the form the quotient needs.** -/
theorem B1_le_Z1 : B1 G M ≤ Z1 G M := sorry

/-- **Layer 2, `d ∘ d = 0` in degree 2.** -/
theorem B2_le_Z2 : B2 G M ≤ Z2 G M := sorry

/-- **Layer 2, `H⁰ = M^G`.** Degree 0 is the invariant subgroup itself and not a quotient, as
`README.md` §3 fixes. It carries a name of its own because the low-degree corestriction, the
connecting maps and the `(0, q)` and `(q, 0)` cup shapes all need a degree-0 carrier to be stated
against. -/
abbrev H0 : AddSubgroup M := Invariants (⊤ : Subgroup G) M

/-- **Layer 2, `H¹ = Z¹/B¹`.** -/
abbrev H1 := (Z1 G M) ⧸ ((B1 G M).addSubgroupOf (Z1 G M))

/-- **Layer 2, `H² = Z²/B²`.** -/
abbrev H2 := (Z2 G M) ⧸ ((B2 G M).addSubgroupOf (Z2 G M))

/-- **Layer 2, the class map in degree 1.** -/
abbrev H1pi : (Z1 G M) →+ H1 G M := QuotientAddGroup.mk' _

/-- **Layer 2, the class map in degree 2.** -/
abbrev H2pi : (Z2 G M) →+ H2 G M := QuotientAddGroup.mk' _

/-- **Layer 2, `H¹` with the discrete topology.** The quotient topology `H1` inherits comes from
the **pointwise** topology on `G → M`, and for an infinite profinite `G` that is not discrete: with
trivial `ZMod 2` coefficients on a product of infinitely many copies of `C₂`, no finite set of
evaluations isolates the zero character. The canonical side of Layer 3 is discrete, so the
comparison is stated against this object and not against the inherited one. -/
def DiscreteH1 : Type _ := H1 G M

noncomputable instance : AddCommGroup (DiscreteH1 G M) := inferInstanceAs (AddCommGroup (H1 G M))
instance : TopologicalSpace (DiscreteH1 G M) := ⊥
instance : DiscreteTopology (DiscreteH1 G M) := ⟨rfl⟩

/-- **Layer 2, `H²` with the discrete topology.** -/
def DiscreteH2 : Type _ := H2 G M

noncomputable instance : AddCommGroup (DiscreteH2 G M) := inferInstanceAs (AddCommGroup (H2 G M))
instance : TopologicalSpace (DiscreteH2 G M) := ⊥
instance : DiscreteTopology (DiscreteH2 G M) := ⟨rfl⟩

/-- The identity as an additive equivalence, so that computations on representatives stay
available after passing to the discrete object. -/
noncomputable def discreteH1Equiv : DiscreteH1 G M ≃+ H1 G M := AddEquiv.refl _

/-- The degree-2 counterpart. -/
noncomputable def discreteH2Equiv : DiscreteH2 G M ≃+ H2 G M := AddEquiv.refl _

/-- **Layer 2, the conjugation action on `H¹(N, M)` for normal `N`.** The compatible pair
(conjugation by `g`, the action of `g`) pulls a class of `H¹(N, M)` back to a class of
`H¹(N, M)`, and this is that map. The five-term sequence of Layer 5 is stated against its
invariants, so the map is named before those invariants can be. -/
noncomputable def explicitConj1 (N : Subgroup G) [N.Normal] (g : G) : H1 N M →+ H1 N M :=
  sorry

/-- **Layer 2, inner automorphisms act trivially** (Milne, ADT Prop. 0.15). This is exactly what
makes the conjugation action of `G` on `H¹(N, M)` descend to `G ⧸ N`; without it the invariants
below are the invariants of an action that is not well defined on the quotient. -/
theorem explicitConj1_eq_id_of_mem (N : Subgroup G) [N.Normal] (g : G) (hg : g ∈ N) :
    explicitConj1 G M N g = AddMonoidHom.id (H1 N M) :=
  sorry

/-- **Layer 5, the `G ⧸ N`-invariants of `H¹(N, M)`,** the third term of the five-term sequence.
By `explicitConj1_eq_id_of_mem` the conditions for `g` and for `g * n` with `n ∈ N` agree, so
quantifying over `G` and over `G ⧸ N` cuts out the same subgroup; `G` is used because that is the
form the cochain computations produce. -/
def H1ConjInvariants (N : Subgroup G) [N.Normal] : AddSubgroup (H1 N M) where
  carrier := {x | ∀ g : G, explicitConj1 G M N g x = x}
  add_mem' {a b} ha hb g := by
    simp only [Set.mem_setOf_eq] at *
    rw [map_add, ha g, hb g]
  zero_mem' g := map_zero _
  neg_mem' {a} ha g := by
    simp only [Set.mem_setOf_eq] at *
    rw [map_neg, ha g]

end ExplicitComplex


/-- **Layer 2, worked example `H¹(ℤ_p, ℤ/pᵏ) ≅ ℤ/pᵏ`.** Under the trivial-action
characterization, `H¹` of the profinite additive group `ℤ_p` with discrete coefficients
`ℤ/pᵏ` is the group of continuous additive homomorphisms, and evaluation at `1` identifies it
with `ℤ/pᵏ`. Surjectivity is the content: the dense subgroup `ℤ ⊆ ℤ_p` sends `1` anywhere,
and continuity extends the choice. -/
example (p : ℕ) [Fact p.Prime] (k : ℕ) :
    Function.Bijective (fun φ : ContinuousAddMonoidHom ℤ_[p] (ZMod (p ^ k)) ↦ φ 1) :=
  sorry

/-- **Layer 2, worked example `H¹(ℤ_p, ℤ) = 0`.** With discrete torsion-free coefficients
there are no nonzero continuous homomorphisms from a profinite group: the image is a compact,
hence finite, subgroup of `ℤ`. Continuity is what makes the statement true, since the
abstract group `ℤ_p` has many homomorphisms to torsion-free targets. -/
example (p : ℕ) [Fact p.Prime] (φ : ContinuousAddMonoidHom ℤ_[p] ℤ) : φ = 0 :=
  sorry

/-! ### Layer 3: the comparison isomorphisms -/

section Comparisons

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]

/-- **Layer 3, degree 0 against Mathlib's discrete group cohomology.** The degree Mathlib computes
outright, and the one the finite-level dictionary is checked at first.

⚠ The three comparisons with `groupCohomology` are the only statements in this roadmap that are
pinned to `Type 0`, and the pin is the pin's, not ours: `Rep k G` puts `k` and `G` in one universe
(Mathlib #33608), so `Rep ℤ G` forces `G` into the universe of `ℤ`. They therefore carry their own
binders instead of the section's. Everything downstream of them, including the comparison with the
canonical carrier, is universe polymorphic; when Mathlib lifts the `Rep` restriction these three
become polymorphic by deleting the binders. -/
noncomputable def explicitH0IsoGroupCohomology (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [DiscreteTopology G] [SMulCommClass G ℤ M] :
    H0 G M ≃+ (groupCohomology (Rep.ofDistribMulAction ℤ G M) 0) :=
  sorry

/-- **Layer 3, degree 1 against Mathlib's discrete group cohomology.** Every continuity condition
is vacuous for a discrete group, so this identifies subquotients of the same function space.
Layer 4 uses it at every finite level. Universe 0 for the reason given at
`explicitH0IsoGroupCohomology`. -/
noncomputable def explicitH1IsoGroupCohomology (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [DiscreteTopology G] [SMulCommClass G ℤ M] :
    H1 G M ≃+ (groupCohomology (Rep.ofDistribMulAction ℤ G M) 1) :=
  sorry

/-- **Layer 3, degree 2 against Mathlib's discrete group cohomology.** Universe 0 for the reason
given at `explicitH0IsoGroupCohomology`. -/
noncomputable def explicitH2IsoGroupCohomology (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [DiscreteTopology G] [SMulCommClass G ℤ M] :
    H2 G M ≃+ (groupCohomology (Rep.ofDistribMulAction ℤ G M) 2) :=
  sorry

/-- **Layer 3, `H⁰` as an object of `TopModuleCat ℤ`.** `H⁰` is a subgroup of the discrete `M`, so
it is discrete already and needs no separate synonym. -/
noncomputable def explicitH0Obj : TopModuleCat ℤ :=
  TopModuleCat.of ℤ (H0 G M)

/-- **Layer 3, `H¹` as an object of `TopModuleCat ℤ`,** built from the **discrete** object. -/
noncomputable def explicitH1Obj : TopModuleCat ℤ := TopModuleCat.of ℤ (DiscreteH1 G M)

/-- **Layer 3, `H²` as an object of `TopModuleCat ℤ`.** -/
noncomputable def explicitH2Obj : TopModuleCat ℤ := TopModuleCat.of ℤ (DiscreteH2 G M)

/-- **Layer 1, the dictionary commutes with restriction.** Restricting the canonical object of a
discrete module to a subgroup gives the canonical object of the same module over that subgroup.
The transport squares below cannot be typed without it. -/
noncomputable def ofDiscreteModuleRes (S : Subgroup G) :
    (TopRep.resFunctor S.subtype).obj (ofDiscreteModule G M) ≅ ofDiscreteModule S M :=
  sorry

/-- **Layer 2, restriction on the explicit model in degree 0,** the inclusion `M^G ⊆ M^S`. -/
noncomputable def explicitRes0 (S : Subgroup G) : H0 G M →+ H0 S M := sorry

/-- **Layer 2, restriction on the explicit model,** the instance of the compatible-pair pullback
at the inclusion of a subgroup. -/
noncomputable def explicitRes1 (S : Subgroup G) : H1 G M →+ H1 S M := sorry

/-- **Layer 2, restriction on the explicit model in degree 2.** -/
noncomputable def explicitRes2 (S : Subgroup G) : H2 G M →+ H2 S M := sorry

/-- **Layer 2, a coefficient map on the explicit model in degree 0,** the restriction of `f` to the
invariants. The three degrees are named separately because the long exact sequence of Layer 5 is an
exactness statement about all three at once. -/
noncomputable def explicitCoeff0 (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    H0 G M →+ H0 G N :=
  sorry

/-- **Layer 2, a coefficient map on the explicit model.** -/
noncomputable def explicitCoeff1 (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    H1 G M →+ H1 G N :=
  sorry

/-- **Layer 2, a coefficient map on the explicit model in degree 2.** -/
noncomputable def explicitCoeff2 (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    H2 G M →+ H2 G N :=
  sorry

/-- **Layer 3, degree 0 against the canonical object,** in `TopModuleCat ℤ`. The pin computes this
degree, so it is where the comparison is checked first. -/
noncomputable def explicitH0IsoContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    explicitH0Obj G M ≅ (continuousCohomology ℤ G 0).obj (ofDiscreteModule G M) :=
  sorry

/-- **Layer 3, degree 1 against the canonical object,** in `TopModuleCat ℤ`. The canonical side is
the image of `M` under Layer 1's dictionary and **not** an arbitrary `TopRep` object: a general
object need not be smooth, and the explicit complex is not a description of its cohomology. -/
noncomputable def explicitH1IsoContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    explicitH1Obj G M ≅ (continuousCohomology ℤ G 1).obj (ofDiscreteModule G M) :=
  sorry

/-- **Layer 3, degree 2 against the canonical object,** in `TopModuleCat ℤ`. This is the degree
where the compact-open exponential law is used, hence where profiniteness is not a
convenience. -/
noncomputable def explicitH2IsoContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    explicitH2Obj G M ≅ (continuousCohomology ℤ G 2).obj (ofDiscreteModule G M) :=
  sorry

/-- **Layer 3, the underlying additive equivalence,** a corollary of the isomorphism above and not
a substitute for it. -/
noncomputable def explicitH1AddEquivContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    H1 G M ≃+ ((continuousCohomology ℤ G 1).obj (ofDiscreteModule G M)) :=
  sorry

/-- **Layer 2, the compatible-pair pullback on the explicit model,** of which `explicitRes1`,
`explicitInfl1` and `explicitCoeff1` are the three named instances. -/
noncomputable def explicitMap1 (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (N : Type u) [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
    [DiscreteTopology N] [DistribMulAction H N] [ContinuousSMul H N]
    (φ : ContinuousMonoidHom H G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) (m : M), f (φ h • m) = h • f m) :
    H1 G M →+ H1 H N :=
  sorry

/-- **Layer 1, the dictionary carries a compatible pair.** The canonical-side coefficient morphism
of the pair `(φ, f)`, which is what `map` consumes. -/
noncomputable def ofDiscreteModulePair (H : Type u) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction H N] [ContinuousSMul H N]
    (φ : ContinuousMonoidHom H G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) (m : M), f (φ h • m) = h • f m) :
    (TopRep.resFunctor (φ : H →* G)).obj (ofDiscreteModule G M) ⟶ ofDiscreteModule H N :=
  sorry

/-- **Layer 3, the comparison is natural in compatible pairs.** The general square, of which the
three transports below are the named instances at a subgroup inclusion, a quotient map and the
identity. The README requires the comparison itself to be natural, not only its three
specializations. -/
theorem explicitIso_map [CompactSpace G] [TotallyDisconnectedSpace G]
    (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H]
    (N : Type u) [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
    [DiscreteTopology N] [DistribMulAction H N] [ContinuousSMul H N]
    (φ : ContinuousMonoidHom H G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) (m : M), f (φ h • m) = h • f m) (x : DiscreteH1 G M) :
    (ContinuousCohomology.map φ (ofDiscreteModulePair G M H N φ f hf hequiv) 1).hom
        ((explicitH1IsoContinuousCohomology G M).hom.hom x) =
      (explicitH1IsoContinuousCohomology H N).hom.hom
        (explicitMap1 G M H N φ f hf hequiv (discreteH1Equiv G M x) : DiscreteH1 H N) :=
  sorry

/-- **Layer 3, transport of restriction.** The square commuting is the statement; a closed
subgroup of a profinite group is profinite, which is what the instance hypotheses record. -/
theorem explicitIso_res [CompactSpace G] [TotallyDisconnectedSpace G] (S : Subgroup G)
    (hS : IsClosed (S : Set G)) [CompactSpace S] [TotallyDisconnectedSpace S]
    (x : DiscreteH1 G M) :
    ((continuousCohomology ℤ S 1).map (ofDiscreteModuleRes G M S).hom).hom
        ((res ℤ S (ofDiscreteModule G M) 1).hom
          ((explicitH1IsoContinuousCohomology G M).hom.hom x)) =
      (explicitH1IsoContinuousCohomology S M).hom.hom
        (explicitRes1 G M S (discreteH1Equiv G M x) : DiscreteH1 S M) :=
  sorry

/-- **Layer 1, the dictionary is functorial in the coefficients.** A continuous `G`-equivariant map
of discrete modules induces a morphism of the canonical objects. The coefficient square below names
this morphism: a square quantified over an arbitrary morphism of the two objects is a different
statement, and a false one, since a general morphism has nothing to do with `f`. -/
noncomputable def ofDiscreteModuleMap (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    ofDiscreteModule G M ⟶ ofDiscreteModule G N :=
  sorry

/-- **Layer 3, transport of coefficient maps.** -/
theorem explicitIso_coeffMap [CompactSpace G] [TotallyDisconnectedSpace G]
    (N : Type u) [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
    [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m)
    (x : DiscreteH1 G M) :
    (coeffMap ℤ (ofDiscreteModuleMap G M N f hf hequiv) 1).hom
        ((explicitH1IsoContinuousCohomology G M).hom.hom x) =
      (explicitH1IsoContinuousCohomology G N).hom.hom
        (explicitCoeff1 G M N f hf hequiv (discreteH1Equiv G M x) : DiscreteH1 G N) :=
  sorry

/-- **Layer 1, the dictionary commutes with passing to the invariants of a closed normal
subgroup.** The coefficient half of inflation on the canonical side, named so that the inflation
square below is an equation between determined maps. -/
noncomputable def ofDiscreteModuleQuotient (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)] :
    ofDiscreteModule (G ⧸ N) (Invariants N M) ⟶
      quotientToInvariants ℤ N (ofDiscreteModule G M) :=
  sorry

/-- **Layer 2, inflation on the explicit model,** the instance of the compatible-pair pullback at
the quotient map of a closed normal subgroup, with the invariants as coefficients. -/
noncomputable def explicitInfl1 (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)] :
    H1 (G ⧸ N) (Invariants N M) →+ H1 G M :=
  sorry

/-- **Layer 2, inflation on the explicit model in degree 2.** The last map of Layer 5's five-term
sequence, so it is a target in its own right and not a degree the degree-1 statement covers. -/
noncomputable def explicitInfl2 (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)] :
    H2 (G ⧸ N) (Invariants N M) →+ H2 G M :=
  sorry

/-- **Layer 6, variable-transversal corestriction in degree 0.** Finite index is data: openness
alone does not make the quotient finite for a general topological group. -/
noncomputable def explicitCor0Transversal (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x, QuotientGroup.mk (t x) = x) : H0 U.toSubgroup M →+ H0 G M :=
  sorry

/-- **Layer 6, variable-transversal corestriction in degree 1.** -/
noncomputable def explicitCor1Transversal (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x, QuotientGroup.mk (t x) = x) : H1 U.toSubgroup M →+ H1 G M :=
  sorry

/-- **Layer 6, variable-transversal corestriction in degree 2.** -/
noncomputable def explicitCor2Transversal (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x, QuotientGroup.mk (t x) = x) : H2 U.toSubgroup M →+ H2 G M :=
  sorry

/-- **Layer 6, change of transversal in degree 0.** The cochain formula is independent after
passing to invariants. -/
theorem explicitCor0_changeTransversal (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t t' : G ⧸ U.toSubgroup → G) (ht : ∀ x, QuotientGroup.mk (t x) = x)
    (ht' : ∀ x, QuotientGroup.mk (t' x) = x) :
    explicitCor0Transversal G M U t ht = explicitCor0Transversal G M U t' ht' :=
  sorry

/-- **Layer 6, change of transversal in degree 1,** after the named coboundary identity on
representatives. -/
theorem explicitCor1_changeTransversal (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t t' : G ⧸ U.toSubgroup → G) (ht : ∀ x, QuotientGroup.mk (t x) = x)
    (ht' : ∀ x, QuotientGroup.mk (t' x) = x) :
    explicitCor1Transversal G M U t ht = explicitCor1Transversal G M U t' ht' :=
  sorry

/-- **Layer 6, change of transversal in degree 2,** after the named continuous 1-cochain
coboundary identity. -/
theorem explicitCor2_changeTransversal (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t t' : G ⧸ U.toSubgroup → G) (ht : ∀ x, QuotientGroup.mk (t x) = x)
    (ht' : ∀ x, QuotientGroup.mk (t' x) = x) :
    explicitCor2Transversal G M U t ht = explicitCor2Transversal G M U t' ht' :=
  sorry

/-- **Layer 6, public corestriction on the explicit model in degree 0,** the norm at
`t = Quotient.out`. -/
noncomputable def explicitCor0 (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] :
    H0 U.toSubgroup M →+ H0 G M :=
  sorry

/-- **Layer 6, public corestriction on the explicit model in degree 1,** the
`t = Quotient.out` specialization. -/
noncomputable def explicitCor1 (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] :
    H1 U.toSubgroup M →+ H1 G M :=
  sorry

/-- **Layer 6, public corestriction on the explicit model in degree 2,** the
`t = Quotient.out` specialization with two nested transversal words. -/
noncomputable def explicitCor2 (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] :
    H2 U.toSubgroup M →+ H2 G M :=
  sorry

/-- **Layer 3, transport of inflation.** Stated in the same shape as restriction, with the
quotient in place of the subgroup. -/
theorem explicitIso_infl [CompactSpace G] [TotallyDisconnectedSpace G] (N : Subgroup G)
    [N.Normal] [CompactSpace (G ⧸ N)] [TotallyDisconnectedSpace (G ⧸ N)]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)]
    (x : DiscreteH1 (G ⧸ N) (Invariants N M)) :
    (infl ℤ N (ofDiscreteModule G M) 1).hom
        (((continuousCohomology ℤ (G ⧸ N) 1).map (ofDiscreteModuleQuotient G M N)).hom
          ((explicitH1IsoContinuousCohomology (G ⧸ N) (Invariants N M)).hom.hom x)) =
      (explicitH1IsoContinuousCohomology G M).hom.hom
        (explicitInfl1 G M N (discreteH1Equiv (G ⧸ N) (Invariants N M) x) : DiscreteH1 G M) :=
  sorry

end Comparisons

/-! ### Layer 4: descent to finite levels, and the finite-quotient system -/

/-- **Layer 4, continuous 1-cocycles descend strictly.** The degree-1 surjectivity half of
the colimit theorem `H¹(G, M) ≅ colim_U H¹(G ⧸ U, M^U)`, stated raw and with **no coboundary
subtracted**: the zero set of a continuous 1-cocycle is an open subgroup, and any open normal
`U` inside it makes the cocycle right-`U`-invariant (so it factors through `G ⧸ U`) and
`U`-fixed-valued (so it takes its values in `M^U`). The descended `F` is asked to be a 1-cocycle of
`G ⧸ U` on `M^U` on the nose, for the action of Layer 0, so that the conclusion says exactly
that the original cocycle is the inflation of a finite-level cocycle. A coboundary enters
only in the injectivity half of the colimit theorem. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {M : Type*} [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (f : G → M) (hf : Continuous f) (hcoc : groupCohomology.IsCocycle₁ f) :
    ∃ (U : OpenNormalSubgroup G) (F : G ⧸ U.toSubgroup → Invariants U.toSubgroup M),
      groupCohomology.IsCocycle₁ F ∧ ∀ g : G, (F (QuotientGroup.mk g) : M) = f g :=
  sorry

/-- **Layer 4, continuous 2-cocycles descend strictly.** The degree-2 half, by uniform local
constancy: a continuous map on the **compact** space `G × G` into a discrete module is
constant on `gU × hU` for a single open normal `U`, and its image is finite, so a further
open normal subgroup fixes every value. Compactness, not just total disconnectedness, is what
descends both variables at once. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {M : Type*} [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (f : G × G → M) (hf : Continuous f) (hcoc : groupCohomology.IsCocycle₂ f) :
    ∃ (U : OpenNormalSubgroup G)
      (F : (G ⧸ U.toSubgroup) × (G ⧸ U.toSubgroup) → Invariants U.toSubgroup M),
      groupCohomology.IsCocycle₂ F ∧
        ∀ g h : G, (F (QuotientGroup.mk g, QuotientGroup.mk h) : M) = f (g, h) :=
  sorry

/-- **Layer 4, why the coefficient inclusion is equivariant.** For `V ≤ U` the action of `g`
on `M^U` depends only on the class of `g` in `G ⧸ V`. This is the elementary fact behind
`invariantsInclusion_equivariant` below, and the reason the pair `(G ⧸ V → G ⧸ U, M^U ↪ M^V)`
is a compatible pair at all. -/
example {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    {U V : Subgroup G} (hVU : V ≤ U) (m : M) (hm : ∀ u ∈ U, u • m = m) {g g' : G}
    (hgg' : g⁻¹ * g' ∈ V) : g • m = g' • m :=
  sorry

section FiniteQuotientSystem

open CategoryTheory Representation

variable {k G : Type u} [CommRing k] [Group G] [TopologicalSpace G] (A : Rep k G)

/-- **Layer 4, the group half of the transition pair.** For `V ≤ U` this is the quotient
homomorphism `G ⧸ V → G ⧸ U`, the direction of Mathlib's
`ProfiniteGrp.toFiniteQuotientFunctor`. The cohomological transition map built from it runs
the other way, from the `U`-level to the `V`-level, which is why the index category of the
system is `(OpenNormalSubgroup G)ᵒᵖ`. -/
def finiteQuotientMap (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    G ⧸ V.toSubgroup →* G ⧸ U.toSubgroup :=
  QuotientGroup.map V.toSubgroup U.toSubgroup (MonoidHom.id G) fun _ hx => hVU hx

/-- **Layer 4, `M^U ⊆ M^V` for `V ≤ U`.** Fewer conditions on the smaller subgroup. -/
theorem invariants_le (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    invariants (A.ρ.comp U.toSubgroup.subtype) ≤ invariants (A.ρ.comp V.toSubgroup.subtype) :=
  fun _ hm g => hm ⟨g.1, hVU g.2⟩

/-- **Layer 4, the coefficient half of the transition pair,** the inclusion `M^U ↪ M^V`.
Coefficients are taken on the `Rep` side here, as `Rep.quotientToInvariants`, because that is
where Mathlib's compatible-pair API for cohomology lives; Layer 0's dictionary identifies this
object with `Invariants U M` above. -/
noncomputable def invariantsInclusion (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    invariants (A.ρ.comp U.toSubgroup.subtype) →ₗ[k] invariants (A.ρ.comp V.toSubgroup.subtype) :=
  Submodule.inclusion (invariants_le A U V hVU)

/-- **Layer 4, equivariance of the coefficient inclusion** after restriction along
`finiteQuotientMap`: the `G ⧸ U`-action on `M^U`, pulled back to `G ⧸ V`, agrees with the
`G ⧸ V`-action on `M^V`. Together with `finiteQuotientMap` it makes the pair below well typed. -/
theorem invariantsInclusion_equivariant (U V : OpenNormalSubgroup G) (hVU : V ≤ U)
    (x : G ⧸ V.toSubgroup) (m : invariants (A.ρ.comp U.toSubgroup.subtype)) :
    invariantsInclusion A U V hVU
        ((A.quotientToInvariants U.toSubgroup).ρ (finiteQuotientMap U V hVU x) m) =
      (A.quotientToInvariants V.toSubgroup).ρ x (invariantsInclusion A U V hVU m) :=
  sorry

/-- **Layer 4, the transition pair itself,** assembled from its two halves. -/
noncomputable def transitionPair (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    Rep.res (finiteQuotientMap U V hVU) (A.quotientToInvariants U.toSubgroup) ⟶
      A.quotientToInvariants V.toSubgroup :=
  Rep.ofHom ⟨invariantsInclusion A U V hVU,
    fun x ↦ LinearMap.ext (invariantsInclusion_equivariant A U V hVU x)⟩

/-- **Layer 4, the transition map of the finite-quotient system,**
`Hⁱ(G ⧸ U, M^U) → Hⁱ(G ⧸ V, M^V)` for `V ≤ U`, through Mathlib's discrete
`groupCohomology.map`. The target category is `ModuleCat k`, which for `k = ℤ` is the
`AddCommGrp` of the roadmap's explicit low-degree statements. -/
noncomputable def finiteLevelTransition (U V : OpenNormalSubgroup G) (hVU : V ≤ U) (i : ℕ) :
    groupCohomology (A.quotientToInvariants U.toSubgroup) i ⟶
      groupCohomology (A.quotientToInvariants V.toSubgroup) i :=
  groupCohomology.map (finiteQuotientMap U V hVU) (transitionPair A U V hVU) i

/-- **Layer 4, the first functor law.** -/
theorem finiteLevelTransition_id (U : OpenNormalSubgroup G) (i : ℕ) :
    finiteLevelTransition A U U le_rfl i = 𝟙 _ :=
  sorry

/-- **Layer 4, the second functor law,** for `W ≤ V ≤ U`: the transition from the `U`-level to
the `W`-level is the composite through the `V`-level. With the previous law this says the
system is a functor on `(OpenNormalSubgroup G)ᵒᵖ`, which the colimit theorem needs. -/
theorem finiteLevelTransition_comp (U V W : OpenNormalSubgroup G) (hVU : V ≤ U) (hWV : W ≤ V)
    (i : ℕ) :
    finiteLevelTransition A U W (hWV.trans hVU) i =
      finiteLevelTransition A U V hVU i ≫ finiteLevelTransition A V W hWV i :=
  sorry

end FiniteQuotientSystem

section FiniteQuotientColimit

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]

/-- **Layer 4, the explicit degree-0 transition,** defined directly from the quotient map and
`M^U ↪ M^V`. It does not pass through the small-universe `groupCohomology` comparison. -/
noncomputable def explicitFiniteQuotientTransition0 (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    H0 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M) →+
      H0 (G ⧸ V.toSubgroup) (Invariants V.toSubgroup M) :=
  sorry

/-- **Layer 4, the explicit degree-1 transition,** the universe-polymorphic `explicitMap1` for
the compatible pair `(G ⧸ V → G ⧸ U, M^U ↪ M^V)`. -/
noncomputable def explicitFiniteQuotientTransition1 (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    H1 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M) →+
      H1 (G ⧸ V.toSubgroup) (Invariants V.toSubgroup M) :=
  sorry

/-- **Layer 4, the explicit degree-2 transition,** defined directly on explicit cochains. -/
noncomputable def explicitFiniteQuotientTransition2 (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    H2 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M) →+
      H2 (G ⧸ V.toSubgroup) (Invariants V.toSubgroup M) :=
  sorry

theorem explicitFiniteQuotientTransition1_id (U : OpenNormalSubgroup G) :
    explicitFiniteQuotientTransition1 G M U U le_rfl = AddMonoidHom.id _ :=
  sorry

theorem explicitFiniteQuotientTransition1_comp (U V W : OpenNormalSubgroup G)
    (hVU : V ≤ U) (hWV : W ≤ V) :
    explicitFiniteQuotientTransition1 G M U W (hWV.trans hVU) =
      (explicitFiniteQuotientTransition1 G M V W hWV).comp
        (explicitFiniteQuotientTransition1 G M U V hVU) :=
  sorry

/-- **Layer 4, the finite-quotient system in degree 0.** -/
noncomputable def explicitFiniteQuotientSystem0 :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ AddCommGrpCat.{u} :=
  { obj := fun U => AddCommGrpCat.of
      (H0 (G ⧸ U.unop.toSubgroup) (Invariants U.unop.toSubgroup M))
    map := fun {U V} f => AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition0 G M U.unop V.unop (leOfHom f.unop))
    map_id := by intros; sorry
    map_comp := by intros; sorry }

theorem explicitFiniteQuotientSystem0_obj (U : OpenNormalSubgroup G) :
    (explicitFiniteQuotientSystem0 G M).obj (Opposite.op U) =
      AddCommGrpCat.of (H0 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M)) :=
  rfl

theorem explicitFiniteQuotientSystem0_map {U V : (OpenNormalSubgroup G)ᵒᵖ} (f : U ⟶ V) :
    (explicitFiniteQuotientSystem0 G M).map f = AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition0 G M U.unop V.unop (leOfHom f.unop)) :=
  rfl

/-- **Layer 4, the named comparison legs in degree 0.** -/
noncomputable def explicitFiniteQuotientComparison0 :
    explicitFiniteQuotientSystem0 G M ⟶
      (Functor.const ((OpenNormalSubgroup G)ᵒᵖ)).obj (AddCommGrpCat.of (H0 G M)) :=
  sorry

noncomputable def explicitFiniteQuotientCocone0 :
    Limits.Cocone (explicitFiniteQuotientSystem0 G M) where
  pt := AddCommGrpCat.of (H0 G M)
  ι := explicitFiniteQuotientComparison0 G M

/-- **Layer 4, universality of the degree-0 comparison cocone.** -/
noncomputable def explicitFiniteQuotientColimit0 :
    Limits.IsColimit (explicitFiniteQuotientCocone0 G M) :=
  sorry

/-- **Layer 4, the finite-quotient system in degree 1,** as a functor on
`(OpenNormalSubgroup G)ᵒᵖ`. The index category is the opposite one because the transition maps run
from the `U`-level to the `V`-level for `V ≤ U`, against the direction of
`ProfiniteGrp.toFiniteQuotientFunctor`. Its arrows are `finiteLevelTransition`, and
`finiteLevelTransition_id` and `finiteLevelTransition_comp` are the two functor laws. The
coefficients are an explicit binder here because the functor's target category does not mention
them, and the system does. -/
noncomputable def explicitFiniteQuotientSystem1 (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ AddCommGrpCat.{u} :=
  { obj := fun U => AddCommGrpCat.of
      (H1 (G ⧸ U.unop.toSubgroup) (Invariants U.unop.toSubgroup M))
    map := fun {U V} f => AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition1 G M U.unop V.unop (leOfHom f.unop))
    map_id := by intros; sorry
    map_comp := by intros; sorry }

/-- **Layer 4, the value of the finite-quotient system,** which is what makes the colimit statement
below a statement about `Hⁱ(G ⧸ U, M^U)` rather than about an unnamed functor. -/
theorem explicitFiniteQuotientSystem1_obj (U : OpenNormalSubgroup G) :
    (explicitFiniteQuotientSystem1 G M).obj (Opposite.op U) =
      AddCommGrpCat.of (H1 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M)) :=
  rfl

/-- **Layer 4, the arrow of the explicit degree-1 system is exactly the direct explicit
transition.** This rules out silently transporting `finiteLevelTransition` through a
universe-restricted comparison. -/
theorem explicitFiniteQuotientSystem1_map {U V : (OpenNormalSubgroup G)ᵒᵖ} (f : U ⟶ V) :
    (explicitFiniteQuotientSystem1 G M).map f = AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition1 G M U.unop V.unop (leOfHom f.unop)) :=
  rfl

/-- **Layer 4, the comparison maps into `H¹(G, M)`,** inflation along `G → G ⧸ U` followed by the
coefficient inclusion `M^U ↪ M`, assembled into the leg family of a cocone. They are named because
the colimit statement is that **these** maps are universal, not that some isomorphism exists. -/
noncomputable def explicitFiniteQuotientComparison1 :
    explicitFiniteQuotientSystem1 G M ⟶
      (Functor.const ((OpenNormalSubgroup G)ᵒᵖ)).obj (AddCommGrpCat.of (H1 G M)) :=
  sorry

/-- **Layer 4, the comparison cocone,** whose point is `H¹(G, M)` itself. -/
noncomputable def explicitFiniteQuotientCocone1 :
    Limits.Cocone (explicitFiniteQuotientSystem1 G M) where
  pt := AddCommGrpCat.of (H1 G M)
  ι := explicitFiniteQuotientComparison1 G M

/-- **Layer 4, the colimit theorem** `H¹(G, M) ≅ colim_U H¹(G ⧸ U, M^U)`, in the form that says the
comparison cocone is universal. Degrees 0 and 2 have the same shape, with `H0` and `H2` in place of
`H1`; degree 2 is where `CompactSpace` is genuinely used, because descending both variables at once
is uniform local constancy on `G × G`. Surjectivity of the comparison is strict: a continuous
cocycle is itself inflated from a finite level, with no coboundary subtracted, and a coboundary
enters only in the injectivity half. -/
noncomputable def explicitFiniteQuotientColimit1 :
    Limits.IsColimit (explicitFiniteQuotientCocone1 G M) :=
  sorry

/-- **Layer 4, the finite-quotient system in degree 2.** -/
noncomputable def explicitFiniteQuotientSystem2 :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ AddCommGrpCat.{u} :=
  { obj := fun U => AddCommGrpCat.of
      (H2 (G ⧸ U.unop.toSubgroup) (Invariants U.unop.toSubgroup M))
    map := fun {U V} f => AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition2 G M U.unop V.unop (leOfHom f.unop))
    map_id := by intros; sorry
    map_comp := by intros; sorry }

theorem explicitFiniteQuotientSystem2_obj (U : OpenNormalSubgroup G) :
    (explicitFiniteQuotientSystem2 G M).obj (Opposite.op U) =
      AddCommGrpCat.of (H2 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M)) :=
  rfl

theorem explicitFiniteQuotientSystem2_map {U V : (OpenNormalSubgroup G)ᵒᵖ} (f : U ⟶ V) :
    (explicitFiniteQuotientSystem2 G M).map f = AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition2 G M U.unop V.unop (leOfHom f.unop)) :=
  rfl

/-- **Layer 4, the named comparison legs in degree 2.** -/
noncomputable def explicitFiniteQuotientComparison2 :
    explicitFiniteQuotientSystem2 G M ⟶
      (Functor.const ((OpenNormalSubgroup G)ᵒᵖ)).obj (AddCommGrpCat.of (H2 G M)) :=
  sorry

noncomputable def explicitFiniteQuotientCocone2 :
    Limits.Cocone (explicitFiniteQuotientSystem2 G M) where
  pt := AddCommGrpCat.of (H2 G M)
  ι := explicitFiniteQuotientComparison2 G M

/-- **Layer 4, universality of the degree-2 comparison cocone.** -/
noncomputable def explicitFiniteQuotientColimit2 :
    Limits.IsColimit (explicitFiniteQuotientCocone2 G M) :=
  sorry

end FiniteQuotientColimit

section AllDegreeFiniteQuotient

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]

/-- **Layer 10, the canonical finite-quotient system in degree `n`.** Its object and arrow
formulas are the all-degree counterparts of Layer 4's three explicit systems. -/
noncomputable def continuousFiniteQuotientSystem
    (M₀ : Type u) [AddCommGroup M₀] [TopologicalSpace M₀] [IsTopologicalAddGroup M₀]
    [DiscreteTopology M₀] [DistribMulAction G M₀] [ContinuousSMul G M₀] (n : ℕ) :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ TopModuleCat.{u} ℤ :=
  { obj := fun U =>
      letI : ContinuousSMul (G ⧸ U.unop.toSubgroup)
          (Invariants U.unop.toSubgroup M₀) :=
        ⟨continuous_of_discreteTopology⟩
      (continuousCohomology ℤ (G ⧸ U.unop.toSubgroup) n).obj
        (ofDiscreteModule (G ⧸ U.unop.toSubgroup) (Invariants U.unop.toSubgroup M₀))
    map := fun {_ _} _ => sorry
    map_id := by intros; sorry
    map_comp := by intros; sorry }

/-- **Layer 10, the inflation-and-inclusion cocone into canonical continuous cohomology.** -/
noncomputable def continuousFiniteQuotientCocone (n : ℕ) :
    Limits.Cocone (continuousFiniteQuotientSystem G M n) :=
  sorry

/-- **Layer 10, universality of the canonical finite-quotient cocone in every degree.** -/
noncomputable def continuousFiniteQuotientColimit (n : ℕ) :
    Limits.IsColimit (continuousFiniteQuotientCocone G M n) :=
  sorry

/-- **Layer 10, continuous cohomology preserves filtered colimits of smooth discrete
coefficients.** This is the exact categorical theorem consumed by Layer 11's devissage. -/
theorem continuousCohomology_preservesFilteredColimits (n : ℕ) :
    CategoryTheory.Limits.PreservesFilteredColimitsOfSize.{u, u}
      (smoothDiscreteι ℤ G ⋙ continuousCohomologyFunctor ℤ G n) :=
  sorry

end AllDegreeFiniteQuotient

/-! ### Layer 5: exactness of cochains -/

/-- **Layer 5, discrete cochain lifting.** The reason short exact sequences of *discrete*
modules induce long exact sequences: a continuous cochain into a discrete quotient lifts to a
continuous cochain along any surjection of discrete modules (compose with any set-theoretic
section; discreteness of the source of the section makes the composite continuous). Stated
for cochains on an arbitrary topological space, degree-agnostically. -/
example {X : Type*} [TopologicalSpace X] {B C : Type*} [AddCommGroup B] [AddCommGroup C]
    [TopologicalSpace B] [TopologicalSpace C] [DiscreteTopology B] [DiscreteTopology C]
    (p : B →+ C) (hp : Function.Surjective p) (f : X → C) (hf : Continuous f) :
    ∃ g : X → B, Continuous g ∧ p ∘ g = f :=
  sorry

/-- **Layer 5, a short exact sequence of discrete `G`-modules,** the input of the long exact
sequence. The data is carried in a structure rather than as loose hypotheses because every
statement of this layer, and the corestriction compatibility of Layer 6, takes the same sequence
and has to name the same two maps. Discreteness of all three modules is part of the type: it is
what makes the cochain sequences exact, and `README.md` Layer 5 records that it cannot be
relaxed. -/
structure DiscreteShortExact (G : Type u) [Group G] [TopologicalSpace G]
    (A : Type u) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A] [DistribMulAction G A]
    (B : Type u) [AddCommGroup B] [TopologicalSpace B] [DiscreteTopology B] [DistribMulAction G B]
    (C : Type u) [AddCommGroup C] [TopologicalSpace C] [DiscreteTopology C]
    [DistribMulAction G C] where
  /-- the inclusion -/
  incl : A →+ B
  /-- the projection -/
  proj : B →+ C
  /-- the inclusion is continuous -/
  incl_continuous : Continuous incl
  /-- the projection is continuous -/
  proj_continuous : Continuous proj
  /-- the inclusion is equivariant -/
  incl_equivariant : ∀ (g : G) (a : A), incl (g • a) = g • incl a
  /-- the projection is equivariant -/
  proj_equivariant : ∀ (g : G) (b : B), proj (g • b) = g • proj b
  /-- exactness on the left -/
  incl_injective : Function.Injective incl
  /-- exactness on the right -/
  proj_surjective : Function.Surjective proj
  /-- exactness in the middle -/
  exact_middle : ∀ b : B, proj b = 0 ↔ ∃ a : A, incl a = b

section LowDegreeExactSequence

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (A : Type u) [AddCommGroup A] [TopologicalSpace A] [IsTopologicalAddGroup A]
  [DiscreteTopology A] [DistribMulAction G A] [ContinuousSMul G A]
  (B : Type u) [AddCommGroup B] [TopologicalSpace B] [IsTopologicalAddGroup B]
  [DiscreteTopology B] [DistribMulAction G B] [ContinuousSMul G B]
  (C : Type u) [AddCommGroup C] [TopologicalSpace C] [IsTopologicalAddGroup C]
  [DiscreteTopology C] [DistribMulAction G C] [ContinuousSMul G C]

/-- **Layer 5, a short exact sequence restricts to a subgroup.** The restriction is the same two
maps, so this has a real body; it is named because the naturality of the connecting maps under
restriction and the corestriction compatibility below both need the restricted sequence and must
name the same one. -/
def DiscreteShortExact.restrict (S : DiscreteShortExact G A B C) (T : Subgroup G) :
    DiscreteShortExact T A B C where
  incl := S.incl
  proj := S.proj
  incl_continuous := S.incl_continuous
  proj_continuous := S.proj_continuous
  incl_equivariant t a := S.incl_equivariant (t : G) a
  proj_equivariant t b := S.proj_equivariant (t : G) b
  incl_injective := S.incl_injective
  proj_surjective := S.proj_surjective
  exact_middle := S.exact_middle

/-- **Layer 10, the coefficient short complex in `TopRep`.** -/
noncomputable def DiscreteShortExact.toShortComplex (S : DiscreteShortExact G A B C) :
    ShortComplex (TopRep ℤ G) :=
  ShortComplex.mk
    (ofDiscreteModuleMap G A B S.incl S.incl_continuous S.incl_equivariant)
    (ofDiscreteModuleMap G B C S.proj S.proj_continuous S.proj_equivariant) (by sorry)

/-- **Layer 10, the bundled coefficient short complex is short exact.** -/
theorem DiscreteShortExact.toShortComplex_shortExact (S : DiscreteShortExact G A B C) :
    (S.toShortComplex G A B C).ShortExact :=
  sorry

/-- **Layer 10, the short complex of canonical homogeneous-cochain complexes.** -/
noncomputable def continuousCochainsShortExact (S : DiscreteShortExact G A B C) :
    ShortComplex (CochainComplex (TopModuleCat.{u} ℤ) ℕ) :=
  (S.toShortComplex G A B C).map (continuousCochainsFunctor ℤ G)

/-- **Layer 10, degreewise short exactness of the canonical cochain complexes.** This is the
input to Mathlib's `HomologicalComplex.HomologySequence`; it is not supplied by the carrier. -/
theorem continuousCochainsShortExact_shortExact (S : DiscreteShortExact G A B C) :
    (continuousCochainsShortExact G A B C S).ShortExact :=
  sorry

/-- **Layer 5, the connecting map `δ⁰ : H⁰(G, C) → H¹(G, A)`.** Choose a preimage in `B` of an
invariant of `C` and apply `d⁰`; the result lands in `A` because the class of the preimage in `C`
is invariant. -/
noncomputable def explicitDelta0 (S : DiscreteShortExact G A B C) : H0 G C →+ H1 G A :=
  sorry

/-- **Layer 5, `δ⁰` on representatives,** mirroring the pin's `δ₀_apply` so that the discrete and
the continuous theories are used identically. The cochain `a` is determined by `b` because `incl`
is injective, so this pins the normalization rather than merely permitting one. -/
theorem explicitDelta0_apply (S : DiscreteShortExact G A B C) (c : H0 G C) (b : B)
    (hb : S.proj b = (c : C)) (a : G → A) (ha : ∀ g : G, S.incl (a g) = g • b - b)
    (hmem : a ∈ Z1 G A) :
    explicitDelta0 G A B C S c = H1pi G A ⟨a, hmem⟩ :=
  sorry

/-- **Layer 5, the connecting map `δ¹ : H¹(G, C) → H²(G, A)`.** -/
noncomputable def explicitDelta1 (S : DiscreteShortExact G A B C) : H1 G C →+ H2 G A :=
  sorry

/-- **Layer 5, `δ¹` on representatives,** mirroring the pin's `δ₁_apply`. The 1-cochain `e` is a
continuous lift of the cocycle `f`, which exists by the cochain-lifting statement above, and `d¹ e`
takes its values in the image of `A`. -/
theorem explicitDelta1_apply (S : DiscreteShortExact G A B C) (f : Z1 G C)
    (e : G → B) (he : Continuous e) (hef : ∀ g : G, S.proj (e g) = (f : G → C) g)
    (a : G × G → A) (ha : ∀ q : G × G, S.incl (a q) = d1 G B e q) (hmem : a ∈ Z2 G A) :
    explicitDelta1 G A B C S (H1pi G C f) = H2pi G A ⟨a, hmem⟩ :=
  sorry

/-- **Layer 5, exactness at `H⁰(G, A)`,** the first of the eight nodes (NSW (1.3.2)). -/
theorem explicitLongExact_H0A (S : DiscreteShortExact G A B C) :
    Function.Injective (explicitCoeff0 G A B S.incl S.incl_continuous S.incl_equivariant) :=
  sorry

/-- **Layer 5, exactness at `H⁰(G, B)`.** -/
theorem explicitLongExact_H0B (S : DiscreteShortExact G A B C) :
    (explicitCoeff0 G A B S.incl S.incl_continuous S.incl_equivariant).range =
      (explicitCoeff0 G B C S.proj S.proj_continuous S.proj_equivariant).ker :=
  sorry

/-- **Layer 5, exactness at `H⁰(G, C)`,** where `δ⁰` leaves. -/
theorem explicitLongExact_H0C (S : DiscreteShortExact G A B C) :
    (explicitCoeff0 G B C S.proj S.proj_continuous S.proj_equivariant).range =
      (explicitDelta0 G A B C S).ker :=
  sorry

/-- **Layer 5, exactness at `H¹(G, A)`,** where `δ⁰` lands. -/
theorem explicitLongExact_H1A (S : DiscreteShortExact G A B C) :
    (explicitDelta0 G A B C S).range =
      (explicitCoeff1 G A B S.incl S.incl_continuous S.incl_equivariant).ker :=
  sorry

/-- **Layer 5, exactness at `H¹(G, B)`.** -/
theorem explicitLongExact_H1B (S : DiscreteShortExact G A B C) :
    (explicitCoeff1 G A B S.incl S.incl_continuous S.incl_equivariant).range =
      (explicitCoeff1 G B C S.proj S.proj_continuous S.proj_equivariant).ker :=
  sorry

/-- **Layer 5, exactness at `H¹(G, C)`,** where `δ¹` leaves. -/
theorem explicitLongExact_H1C (S : DiscreteShortExact G A B C) :
    (explicitCoeff1 G B C S.proj S.proj_continuous S.proj_equivariant).range =
      (explicitDelta1 G A B C S).ker :=
  sorry

/-- **Layer 5, exactness at `H²(G, A)`,** where `δ¹` lands. -/
theorem explicitLongExact_H2A (S : DiscreteShortExact G A B C) :
    (explicitDelta1 G A B C S).range =
      (explicitCoeff2 G A B S.incl S.incl_continuous S.incl_equivariant).ker :=
  sorry

/-- **Layer 5, exactness at `H²(G, B)`,** the eighth and last node. -/
theorem explicitLongExact_H2B (S : DiscreteShortExact G A B C) :
    (explicitCoeff2 G A B S.incl S.incl_continuous S.incl_equivariant).range =
      (explicitCoeff2 G B C S.proj S.proj_continuous S.proj_equivariant).ker :=
  sorry

/-- **Layer 5, restriction commutes with `δ⁰`.** -/
theorem explicitDelta0_res (S : DiscreteShortExact G A B C) (T : Subgroup G) (x : H0 G C) :
    explicitRes1 G A T (explicitDelta0 G A B C S x) =
      explicitDelta0 T A B C (S.restrict G A B C T) (explicitRes0 G C T x) :=
  sorry

/-- **Layer 5, restriction commutes with `δ¹`.** -/
theorem explicitDelta1_res (S : DiscreteShortExact G A B C) (T : Subgroup G) (x : H1 G C) :
    explicitRes2 G A T (explicitDelta1 G A B C S x) =
      explicitDelta1 T A B C (S.restrict G A B C T) (explicitRes1 G C T x) :=
  sorry

/-- **Layer 6, corestriction commutes with `δ⁰`** (NSW (1.5.2)). The sequence on `U` is the
restriction of the sequence on `G`, so both sides name the same two coefficient maps. -/
theorem explicitCor_delta0 (S : DiscreteShortExact G A B C) (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)]
    (x : H0 U.toSubgroup C) :
    explicitCor1 G A U
        (explicitDelta0 U.toSubgroup A B C (S.restrict G A B C U.toSubgroup) x) =
      explicitDelta0 G A B C S (explicitCor0 G C U x) :=
  sorry

/-- **Layer 6, corestriction commutes with `δ¹`.** -/
theorem explicitCor_delta1 (S : DiscreteShortExact G A B C) (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)]
    (y : H1 U.toSubgroup C) :
    explicitCor2 G A U
        (explicitDelta1 U.toSubgroup A B C (S.restrict G A B C U.toSubgroup) y) =
      explicitDelta1 G A B C S (explicitCor1 G C U y) :=
  sorry

/-- **Layer 10, the connecting map of the long exact sequence in every degree,** against the
canonical object. Layer 5 builds degrees 0 and 1 on the explicit model; this is the all-degree
map they agree with, and the two agreements below are what stop a consumer from having to prove
that two connecting maps coincide. -/
noncomputable def delta [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (n : ℕ) :
    (continuousCohomology ℤ G n).obj (ofDiscreteModule G C) ⟶
      (continuousCohomology ℤ G (n + 1)).obj (ofDiscreteModule G A) :=
  sorry

/-- **Layer 10, exactness of the all-degree long exact sequence at its three repeating nodes.** -/
theorem longExact_exact [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (n : ℕ) :
    Function.Exact
        ((continuousCohomology ℤ G n).map
          (ofDiscreteModuleMap G B C S.proj S.proj_continuous S.proj_equivariant)).hom
        (delta G A B C S n).hom ∧
      Function.Exact (delta G A B C S n).hom
        ((continuousCohomology ℤ G (n + 1)).map
          (ofDiscreteModuleMap G A B S.incl S.incl_continuous S.incl_equivariant)).hom ∧
      Function.Exact
        ((continuousCohomology ℤ G n).map
          (ofDiscreteModuleMap G A B S.incl S.incl_continuous S.incl_equivariant)).hom
        ((continuousCohomology ℤ G n).map
          (ofDiscreteModuleMap G B C S.proj S.proj_continuous S.proj_equivariant)).hom :=
  sorry

/-- **Layer 10, naturality of `delta` in a morphism of short exact coefficient complexes.** -/
theorem delta_naturality [CompactSpace G] [TotallyDisconnectedSpace G]
    (S T : DiscreteShortExact G A B C)
    (F : S.toShortComplex G A B C ⟶ T.toShortComplex G A B C) (n : ℕ) :
    delta G A B C S n ≫ (continuousCohomology ℤ G (n + 1)).map F.τ₁ =
      (continuousCohomology ℤ G n).map F.τ₃ ≫ delta G A B C T n :=
  sorry

/-- **Layer 10, restriction commutes with the all-degree connecting map.** -/
theorem delta_res [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (T : Subgroup G)
    [CompactSpace T] [TotallyDisconnectedSpace T] (n : ℕ) :
    delta G A B C S n ≫ res ℤ T (ofDiscreteModule G A) (n + 1) ≫
        (continuousCohomology ℤ T (n + 1)).map (ofDiscreteModuleRes G A T).hom =
      res ℤ T (ofDiscreteModule G C) n ≫
        (continuousCohomology ℤ T n).map (ofDiscreteModuleRes G C T).hom ≫
          delta T A B C (S.restrict G A B C T) n :=
  sorry

/-- **Layer 10, inflation commutes with the all-degree connecting map.** `SN` is the induced short
exact sequence on `N`-invariants; its existence is carried explicitly because invariants do not
preserve an arbitrary epimorphism without this exactness hypothesis. -/
theorem delta_infl [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [CompactSpace (G ⧸ N)]
    [TotallyDisconnectedSpace (G ⧸ N)]
    [ContinuousSMul (G ⧸ N) (Invariants N A)]
    [ContinuousSMul (G ⧸ N) (Invariants N B)]
    [ContinuousSMul (G ⧸ N) (Invariants N C)]
    (SN : DiscreteShortExact (G ⧸ N) (Invariants N A) (Invariants N B) (Invariants N C))
    (hincl : ∀ a, ((SN.incl a : Invariants N B) : B) = S.incl (a : A))
    (hproj : ∀ b, ((SN.proj b : Invariants N C) : C) = S.proj (b : B)) (n : ℕ) :
    delta (G ⧸ N) (Invariants N A) (Invariants N B) (Invariants N C) SN n ≫
        (continuousCohomology ℤ (G ⧸ N) (n + 1)).map
          (ofDiscreteModuleQuotient G A N) ≫
        infl ℤ N (ofDiscreteModule G A) (n + 1) =
      (continuousCohomology ℤ (G ⧸ N) n).map (ofDiscreteModuleQuotient G C N) ≫
        infl ℤ N (ofDiscreteModule G C) n ≫ delta G A B C S n :=
  sorry

/-- **Layer 3, the explicit and canonical connecting maps agree in degree 0.** -/
theorem explicitIso_delta0 [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (x : H0 G C) :
    (delta G A B C S 0).hom ((explicitH0IsoContinuousCohomology G C).hom.hom x) =
      (explicitH1IsoContinuousCohomology G A).hom.hom
        (explicitDelta0 G A B C S x : DiscreteH1 G A) :=
  sorry

/-- **Layer 3, the explicit and canonical connecting maps agree in degree 1.** -/
theorem explicitIso_delta1 [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (x : DiscreteH1 G C) :
    (delta G A B C S 1).hom ((explicitH1IsoContinuousCohomology G C).hom.hom x) =
      (explicitH2IsoContinuousCohomology G A).hom.hom
        (explicitDelta1 G A B C S (discreteH1Equiv G C x) : DiscreteH2 G A) :=
  sorry

end LowDegreeExactSequence

section FiveTermSequence

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
  (N : Subgroup G) [N.Normal] [IsTopologicalGroup (G ⧸ N)]
  [ContinuousSMul (G ⧸ N) (Invariants N M)]

/-- **Layer 5, inflation is injective in degree 1,** the left end of the inflation-restriction
sequence. Valid for an arbitrary topological group with discrete coefficients. -/
theorem explicitInfl1_injective : Function.Injective (explicitInfl1 G M N) :=
  sorry

/-- **Layer 5, the inflation-restriction sequence** `0 → H¹(G ⧸ N, M^N) → H¹(G, M) → H¹(N, M)`,
with the pin's discrete `H1InfRes_exact` as the model. This three-term statement keeps the wider
generality; the five-term extension below does not. -/
theorem explicitInfRes_exact :
    (explicitInfl1 G M N).range = (explicitRes1 G M N).ker :=
  sorry

/-- **Layer 5, the image of restriction is `G ⧸ N`-invariant.** -/
theorem explicitRes1_mem_conjInvariants (x : H1 G M) :
    explicitRes1 G M N x ∈ H1ConjInvariants G M N :=
  sorry

/-- **Layer 5, restriction as a map into the invariants,** the third arrow of the five-term
sequence. It has a real body once the previous statement is available. -/
noncomputable def explicitResConj1 : H1 G M →+ H1ConjInvariants G M N :=
  AddMonoidHom.codRestrict (explicitRes1 G M N) _ (explicitRes1_mem_conjInvariants G M N)

/-- **Layer 5, the section-dependent lift used by transgression.** It is a continuous 1-cochain on
`G` extending a representative on `N`; its differential is `N`-invariant and descends to the
quotient. -/
noncomputable def transgressionLift [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N) : C1 G M :=
  sorry

/-- **Layer 5, the raw transgression 2-cochain,** obtained by differentiating
`transgressionLift` and descending through the chosen continuous section. -/
noncomputable def transgressionCochain [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N) :
    C2 (G ⧸ N) (Invariants N M) :=
  sorry

/-- **Layer 5, the lift-and-differentiate application formula.** This pins the normalization of
the raw transgression before quotienting: after inclusion `M^N ↪ M`, its value is `d¹` of the
named lift at the chosen representatives. -/
theorem transgressionCochain_apply [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N)
    (q r : G ⧸ N) :
    (((transgressionCochain G M N hN s hs_cont hs y).1 (q, r) : Invariants N M) : M) =
      d1 G M (transgressionLift G M N hN s hs_cont hs y) (s q, s r) :=
  sorry

/-- **Layer 5, the raw transgression is a cocycle.** -/
theorem transgressionCochain_isCocycle [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N) :
    (transgressionCochain G M N hN s hs_cont hs y :
      (G ⧸ N) × (G ⧸ N) → Invariants N M) ∈ Z2 (G ⧸ N) (Invariants N M) :=
  sorry

/-- The raw cochain bundled as a 2-cocycle. -/
noncomputable def transgressionCocycle [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N) :
    Z2 (G ⧸ N) (Invariants N M) :=
  sorry

/-- **Layer 5, change of section is an explicit coboundary.** This is proved before passing to
`H²`; it is the choice-independence mechanism for the public transgression. -/
theorem transgression_changeSection [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s s' : G ⧸ N → G) (hs_cont : Continuous s)
    (hs'_cont : Continuous s') (hs : ∀ q, QuotientGroup.mk (s q) = q)
    (hs' : ∀ q, QuotientGroup.mk (s' q) = q) (y : H1ConjInvariants G M N) :
    (transgressionCochain G M N hN s hs_cont hs y :
        (G ⧸ N) × (G ⧸ N) → Invariants N M) -
      transgressionCochain G M N hN s' hs'_cont hs' y ∈ B2 (G ⧸ N) (Invariants N M) :=
  sorry

/-- **Layer 5, the transgression** `tg : H¹(N, M)^{G ⧸ N} → H²(G ⧸ N, M^N)`, defined by lifting a
cocycle on `N` through a **continuous section** of `G → G ⧸ N` supplied by Layer 0 and
differentiating, and independent of the section chosen as an identity of classes. Profiniteness of
`G` and closedness of `N` are genuine hypotheses: the section is what they provide and what fails
for an arbitrary topological group. -/
noncomputable def transgression [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) :
    H1ConjInvariants G M N →+ H2 (G ⧸ N) (Invariants N M) :=
  sorry

/-- **Layer 5, the public transgression is the class of the raw cochain.** -/
theorem transgression_apply [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N) :
    transgression G M N hN y =
      H2pi (G ⧸ N) (Invariants N M) (transgressionCocycle G M N hN s hs_cont hs y) :=
  sorry

/-- **Layer 5, the five-term sequence is exact at `H¹(N, M)^{G ⧸ N}`** (NSW (1.6.7)). -/
theorem fiveTerm_exact_H1N [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) :
    (explicitResConj1 G M N).range = (transgression G M N hN).ker :=
  sorry

/-- **Layer 5, the five-term sequence is exact at `H²(G ⧸ N, M^N)`.** With
`explicitInfl1_injective`, `explicitInfRes_exact` and the previous statement this is exactness of
`0 → H¹(G⧸N, M^N) → H¹(G, M) → H¹(N, M)^{G⧸N} → H²(G⧸N, M^N) → H²(G, M)` at every node. -/
theorem fiveTerm_exact_H2Q [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) :
    (transgression G M N hN).range = (explicitInfl2 G M N).ker :=
  sorry

/-- **Layer 5, the transgression against restriction on the left,** one of its two
compatibilities. -/
theorem transgression_comp_res [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (x : H1 G M) :
    transgression G M N hN (explicitResConj1 G M N x) = 0 :=
  sorry

/-- **Layer 5, the transgression against inflation on the right,** the other one. -/
theorem explicitInfl2_transgression [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (y : H1ConjInvariants G M N) :
    explicitInfl2 G M N (transgression G M N hN y) = 0 :=
  sorry

end FiveTermSequence

/-! ### Layer 6: the corestriction transversal calculus -/

/-- **Layer 6, the transversal word** `ℓᵗ_u(γ) = (t u)⁻¹ * γ * t (γ⁻¹ • u)`, for a
**variable** transversal `t : G ⧸ U → G`. The transversal is a variable and not `Quotient.out`
from the start, because independence of the transversal is a theorem of Layer 6 and cannot
even be stated otherwise. -/
def lWord {G : Type*} [Group G] (U : Subgroup G) (t : G ⧸ U → G) (u : G ⧸ U) (γ : G) : G :=
  (t u)⁻¹ * γ * t (γ⁻¹ • u)

/-- **Layer 6, the transversal word takes its value in `U`.** -/
theorem lWord_mem {G : Type*} [Group G] (U : Subgroup G) (t : G ⧸ U → G)
    (ht : ∀ x : G ⧸ U, QuotientGroup.mk (t x) = x) (u : G ⧸ U) (γ : G) : lWord U t u γ ∈ U :=
  sorry

/-- **Layer 6, the transversal 1-cocycle law.** `ℓᵗ_u(γ) * ℓᵗ_{γ⁻¹ • u}(η) = ℓᵗ_u(γ * η)`:
pure group theory, with no normality, no finite index, and no condition on `t` at all. This
identity is why the degree-2 corestriction sum is a cocycle. -/
example {G : Type*} [Group G] (U : Subgroup G) (t : G ⧸ U → G) (u : G ⧸ U) (γ η : G) :
    lWord U t u γ * lWord U t (γ⁻¹ • u) η = lWord U t u (γ * η) :=
  sorry

/-- **Layer 6, corestriction in degree 1, with general coefficients.** The corestriction of a
1-cocycle of `U` is `(cor¹_t f) γ = ∑ u, t u • f (ℓᵗ_u γ)`, and the factor `t u •` is forced:
the proof rewrites `t u * ℓᵗ_u(γ) = γ * t (γ⁻¹ • u)` and reindexes, and without the action
the sum is not a cocycle. A trivial-action formula that omits the factor is correct for trivial
coefficients and wrong in general. The input is a cocycle **on `U`**, since that is all a
class of `H¹(U, M)` is, and the transversal word is fed to it through its membership proof. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {M : Type*} [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M]
    (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x : G ⧸ U.toSubgroup, QuotientGroup.mk (t x) = x)
    (f : U.toSubgroup → M) (hf : Continuous f) (hcoc : groupCohomology.IsCocycle₁ f) :
    groupCohomology.IsCocycle₁
        (fun γ : G ↦ ∑ u : G ⧸ U.toSubgroup, t u • f ⟨lWord U.toSubgroup t u γ,
          lWord_mem U.toSubgroup t ht u γ⟩) ∧
      Continuous (fun γ : G ↦ ∑ u : G ⧸ U.toSubgroup, t u • f ⟨lWord U.toSubgroup t u γ,
        lWord_mem U.toSubgroup t ht u γ⟩) :=
  sorry

/-- **Layer 6, `cor ∘ res` is the index only after passing to cohomology.** On cochains the
composite differs from `(G : U) • f` by the coboundary of `c = ∑ u, f (t u)`, so the roadmap
states `cor ∘ res = (G : U) • id` on `H⁰`, `H¹` and `H²` and never as a cochain identity in
positive degrees. The analogous degree-2 statement replaces `c` by an explicit continuous
1-cochain. Here `f` is a cocycle on all of `G`, since the composite starts by restricting
it. -/
example {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    (U : Subgroup G) [Fintype (G ⧸ U)] (t : G ⧸ U → G)
    (ht : ∀ x : G ⧸ U, QuotientGroup.mk (t x) = x)
    (f : G → M) (hf : groupCohomology.IsCocycle₁ f) (γ : G) :
    ∑ u : G ⧸ U, t u • f (lWord U t u γ) =
      U.index • f γ + (γ • (∑ v : G ⧸ U, f (t v)) - ∑ v : G ⧸ U, f (t v)) :=
  sorry

section LowDegreeCorestrictionLaws

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
  (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]

/-- **Layer 6, `cor ∘ res = index` in degree 0.** -/
theorem explicitCor_comp_res0 (x : H0 G M) :
    explicitCor0 G M U (explicitRes0 G M U.toSubgroup x) = U.toSubgroup.index • x :=
  sorry

/-- **Layer 6, `cor ∘ res = index` in degree 1,** after the explicit coboundary correction. -/
theorem explicitCor_comp_res1 (x : H1 G M) :
    explicitCor1 G M U (explicitRes1 G M U.toSubgroup x) = U.toSubgroup.index • x :=
  sorry

/-- **Layer 6, `cor ∘ res = index` in degree 2,** after the explicit 1-cochain correction. -/
theorem explicitCor_comp_res2 (x : H2 G M) :
    explicitCor2 G M U (explicitRes2 G M U.toSubgroup x) = U.toSubgroup.index • x :=
  sorry

end LowDegreeCorestrictionLaws

/-! ### Layer 7: coinduction -/

/-- **Layer 7, uniform local constancy.** On a compact topological group a locally constant
function is uniformly locally constant: its stabilizer under right translation is open. This
is why the coinduced module `Coind_H^G A` of locally constant `H`-equivariant maps is again a
*discrete* `G`-module, which the Shapiro layer needs. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    {A : Type*} (f : G → A) (hf : IsLocallyConstant f) :
    IsOpen {g : G | ∀ x : G, f (x * g) = f x} :=
  sorry

/-- **Layer 7, the coinduced module.** The locally constant `H`-equivariant maps `G → A`, which
is Milne's `M_*` and Ribes-Zalesskii's `Coind_H^G`. The previous statement is why it is again a
*discrete* `G`-module. -/
def Coind (G : Type*) [Group G] [TopologicalSpace G] (U : Subgroup G)
    (A : Type*) [AddCommGroup A] [DistribMulAction U A] : AddSubgroup (G → A) where
  carrier := {f | IsLocallyConstant f ∧ ∀ (u : U) (g : G), f ((u : G) * g) = u • f g}
  add_mem' {a b} ha hb := ⟨ha.1.add hb.1, fun u g => by simp [ha.2 u g, hb.2 u g, smul_add]⟩
  zero_mem' := ⟨IsLocallyConstant.const 0, fun u g => by simp⟩
  neg_mem' {a} ha := ⟨ha.1.neg, fun u g => by simp [ha.2 u g, smul_neg]⟩

/-- **Layer 7, the trace on the underlying carrier,** `f ↦ ∑_{gU} g • f (g⁻¹)`. This is the
elementwise formula; the object all-degree corestriction actually consumes is the bundled
`coindTrace` below, and the two agree by construction. -/
noncomputable def coindTraceRaw {G : Type*} [Group G] [TopologicalSpace G] (U : Subgroup G)
    [Fintype (G ⧸ U)] (M : Type*) [AddCommGroup M] [DistribMulAction G M] :
    Coind G U M →+ M :=
  sorry

section AllDegreeCorestriction

open CategoryTheory

variable (R : Type v) [CommRing R] [TopologicalSpace R]
  {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 1, smooth discreteness is inherited by restriction to a subgroup.** The stabilizer of a
point for the subgroup is the intersection of its `G`-stabilizer with the subgroup. Layer 10 needs
it to feed restricted coefficients to coinduction. -/
theorem IsSmoothDiscrete.res (S : Subgroup G) {X : TopRep R G} (hX : IsSmoothDiscrete R X) :
    IsSmoothDiscrete R ((TopRep.resFunctor S.subtype).obj X) :=
  sorry

/-- **Layer 10, the restricted coefficients as a smooth discrete object.** -/
noncomputable def resSmooth (S : Subgroup G) (X : TopRep R G) (hX : IsSmoothDiscrete R X) :
    SmoothDiscreteTopRep R S :=
  ⟨(TopRep.resFunctor S.subtype).obj X, hX.res R S⟩

/-- **Layer 7, the coinduced object, bundled.** `Coind_H^G A` with its right-translation action.
The coefficients are **smooth discrete** on both sides, and that is not a convenience: the carrier
`Coind` above is the group of **locally constant** equivariant maps, which for a non-discrete
coefficient object is not the continuous coinduction, so an all-`TopRep` signature would advertise
a construction this one is not. Profiniteness of `G` and closedness of `H` give smoothness of the
result: uniform local constancy on a **compact** group is what makes the right-translation
stabilizer open, and without it a locally constant function need have no common open translation
stabilizer. -/
noncomputable def coindTopRep (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) : SmoothDiscreteTopRep R G := sorry

/-- **Layer 7, coinduction is a functor** between the smooth discrete subcategories. -/
noncomputable def coindFunctor (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    SmoothDiscreteTopRep R H ⥤ SmoothDiscreteTopRep R G := sorry

/-- **Layer 7, the functor agrees with the object construction.** -/
theorem coindFunctor_obj (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) :
    (coindFunctor R H hH).obj A = coindTopRep R H hH A :=
  sorry

/-- **Layer 7, exactness of coinduction,** which is where Layer 0's continuous section of
`G → G ⧸ H` is used, and hence where closedness of `H` enters. Stated as preservation of the two
one-sided properties, which is the form the long exact sequence and Shapiro consume, and stated in
the smooth discrete subcategory, which is where the section argument applies. -/
theorem coindFunctor_preservesEpimorphisms (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    (coindFunctor R H hH).PreservesEpimorphisms :=
  sorry

/-- **Layer 7, the other half of exactness.** -/
theorem coindFunctor_preservesMonomorphisms (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    (coindFunctor R H hH).PreservesMonomorphisms :=
  sorry

noncomputable instance coindFunctor_preservesZeroMorphisms (H : Subgroup G)
    (hH : IsClosed (H : Set G)) : (coindFunctor R H hH).PreservesZeroMorphisms :=
  sorry

/-- **Layer 7, exactness of coinduction on a specified short exact sequence.** This includes
exactness at the middle object; preservation of monos and epis alone is not used as a substitute. -/
theorem coindFunctor_map_shortExact (H : Subgroup G) (hH : IsClosed (H : Set G))
    {S : ShortComplex (SmoothDiscreteTopRep R H)} (hS : S.ShortExact) :
    (S.map (coindFunctor R H hH)).ShortExact :=
  sorry

/-- **Layer 7, explicit Shapiro in degree 0.** The forward map is evaluation at `1`; its inverse
uses the continuous quotient section. -/
noncomputable def explicitShapiro0 (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) :
    H0 G ((ofSmoothDiscrete R G).obj (coindTopRep R H hH A)).V ≃+
      H0 H ((ofSmoothDiscrete R H).obj A).V :=
  sorry

/-- **Layer 7, explicit Shapiro in degree 1.** -/
noncomputable def explicitShapiro1 (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) :
    H1 G ((ofSmoothDiscrete R G).obj (coindTopRep R H hH A)).V ≃+
      H1 H ((ofSmoothDiscrete R H).obj A).V :=
  sorry

/-- **Layer 7, explicit Shapiro in degree 2.** -/
noncomputable def explicitShapiro2 (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) :
    H2 G ((ofSmoothDiscrete R G).obj (coindTopRep R H hH A)).V ≃+
      H2 H ((ofSmoothDiscrete R H).obj A).V :=
  sorry

/-- **Layer 7, algebraic coinduction transported into the smooth-discrete topological
subcategory.** For open `U` this is the `Rep.coind` object from the accepted
`RepresentationTheory/InductionRestriction` roadmap, transported through Layer 1's dictionary. -/
noncomputable def algebraicCoindAsSmooth (U : OpenSubgroup G)
    (A : SmoothDiscreteTopRep R U.toSubgroup) : SmoothDiscreteTopRep R G :=
  sorry

/-- **Layer 7, the topological/algebraic coinduction comparison for an open subgroup.** -/
noncomputable def topologicalCoindIsoAlgebraic (U : OpenSubgroup G)
    (A : SmoothDiscreteTopRep R U.toSubgroup) :
    coindTopRep R U.toSubgroup U.isClosed A ≅ algebraicCoindAsSmooth R U A :=
  sorry

/-- **Layer 10, the chain-level Shapiro construction.** The all-degree theorem is induced from
this isomorphism of Mathlib's actual homogeneous-cochain complexes. -/
noncomputable def shapiroCochainIso (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) :
    TopRep.homogeneousCochains ((smoothDiscreteι R G).obj (coindTopRep R H hH A)) ≅
      TopRep.homogeneousCochains ((smoothDiscreteι R H).obj A) :=
  sorry

/-- **Layer 10, Shapiro's lemma in every degree,** induced on homology by
`shapiroCochainIso`. Closedness of `H` is what supplies the inverse chain map. -/
noncomputable def shapiroIso (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) (n : ℕ) :
    (continuousCohomology R G n).obj ((smoothDiscreteι R G).obj (coindTopRep R H hH A)) ≅
      (continuousCohomology R H n).obj ((smoothDiscreteι R H).obj A) :=
  sorry

/-- The algebraic Shapiro isomorphism transported through the coefficient dictionary. -/
noncomputable def algebraicShapiroIso (U : OpenSubgroup G)
    (A : SmoothDiscreteTopRep R U.toSubgroup) (n : ℕ) :
    (continuousCohomology R G n).obj
        ((smoothDiscreteι R G).obj (algebraicCoindAsSmooth R U A)) ≅
      (continuousCohomology R U.toSubgroup n).obj ((smoothDiscreteι R U.toSubgroup).obj A) :=
  sorry

/-- **Layer 7/10, compatibility of the topological/algebraic comparison with Shapiro.** -/
theorem topologicalCoindIsoAlgebraic_shapiro (U : OpenSubgroup G)
    (A : SmoothDiscreteTopRep R U.toSubgroup) (n : ℕ) :
    (continuousCohomology R G n).map
          ((smoothDiscreteι R G).map (topologicalCoindIsoAlgebraic R U A).hom) ≫
        (algebraicShapiroIso R U A n).hom =
      (shapiroIso R U.toSubgroup U.isClosed A n).hom :=
  sorry

/-- **Layer 10, the canonical embedding into the trivial-subgroup coinduced module.** -/
noncomputable def coindEmbedding (hbot : IsClosed ((⊥ : Subgroup G) : Set G))
    (X : TopRep R G) (hX : IsSmoothDiscrete R X) :
    X ⟶ (smoothDiscreteι R G).obj
      (coindTopRep R (⊥ : Subgroup G) hbot (resSmooth R (⊥ : Subgroup G) X hX)) :=
  sorry

/-- **Layer 10, the quotient used for dimension shifting,**
`Coind_1^G X / coindEmbedding X`. -/
noncomputable def dimensionShiftQuotient (hbot : IsClosed ((⊥ : Subgroup G) : Set G))
    (X : TopRep R G) (hX : IsSmoothDiscrete R X) : SmoothDiscreteTopRep R G :=
  sorry

/-- **Layer 10, acyclicity of `Coind_1^G A` in every positive degree.** -/
theorem coindAcyclic (hbot : IsClosed ((⊥ : Subgroup G) : Set G))
    (A : SmoothDiscreteTopRep R (⊥ : Subgroup G)) (n : ℕ) (hn : 0 < n) :
    CategoryTheory.Limits.IsZero ((continuousCohomology R G n).obj
      ((smoothDiscreteι R G).obj (coindTopRep R (⊥ : Subgroup G) hbot A))) :=
  sorry

/-- **Layer 10, dimension shifting in every positive degree,** derived from the named embedding,
quotient, long exact sequence, and `coindAcyclic`. -/
noncomputable def dimensionShiftIso (hbot : IsClosed ((⊥ : Subgroup G) : Set G))
    (X : TopRep R G) (hX : IsSmoothDiscrete R X) (n : ℕ) (hn : 0 < n) :
    (continuousCohomology R G (n + 1)).obj X ≅
      (continuousCohomology R G n).obj
        ((smoothDiscreteι R G).obj (dimensionShiftQuotient R hbot X hX)) :=
  sorry

/-- **Layer 10, milestone 1: the trace as a morphism of coefficient objects.** A morphism in
`TopRep R G`, not merely an additive map, so that it can be fed to Layer 1's `map`. The subgroup is
**open**: the continuous transfer is defined for open subgroups, and a finite-index abstract
subgroup of a topological group need not be open. -/
noncomputable def coindTrace (U : OpenSubgroup G) (X : TopRep R G) (hX : IsSmoothDiscrete R X) :
    (smoothDiscreteι R G).obj
        (coindTopRep R U.toSubgroup U.isClosed (resSmooth R U.toSubgroup X hX)) ⟶ X :=
  sorry

/-- **Layer 10, milestone 2: all-degree corestriction,** the Shapiro-then-trace composite. It has
a real body, so once `shapiroIso` and `coindTrace` exist this is not a further obligation, which
is the point of choosing this route over an all-degree cochain formula. The coefficients are smooth
discrete because coinduction is, which is the roadmap's scope: §1 puts non-discrete topological
coefficient modules out of scope. -/
noncomputable def corestriction (U : OpenSubgroup G) (X : TopRep R G) (hX : IsSmoothDiscrete R X)
    (n : ℕ) :
    (continuousCohomology R U.toSubgroup n).obj
        ((TopRep.resFunctor U.toSubgroup.subtype).obj X) ⟶
      (continuousCohomology R G n).obj X :=
  (shapiroIso R U.toSubgroup U.isClosed (resSmooth R U.toSubgroup X hX) n).inv ≫
    (continuousCohomology R G n).map (coindTrace R U X hX)

/-- **Layer 10, milestone 3: naturality in the coefficients,** as a commuting square. -/
theorem corestriction_naturality (U : OpenSubgroup G) {X Y : TopRep R G}
    (hX : IsSmoothDiscrete R X) (hY : IsSmoothDiscrete R Y) (f : X ⟶ Y) (n : ℕ) :
    corestriction R U X hX n ≫ (continuousCohomology R G n).map f =
      (continuousCohomology R U.toSubgroup n).map ((TopRep.resFunctor U.toSubgroup.subtype).map f) ≫
        corestriction R U Y hY n :=
  sorry

/-- **Layer 1, restriction between two open subgroups,** `res^V_W` for open `W ≤ V ≤ G`. Layer 1's
`res` goes down from the ambient group only; the transitivity and Mackey statements below need the
relative map, so it is named here rather than quantified over. -/
noncomputable def resLe (V W : OpenSubgroup G) (hWV : W ≤ V) (X : TopRep R G) (n : ℕ) :
    (continuousCohomology R V.toSubgroup n).obj ((TopRep.resFunctor V.toSubgroup.subtype).obj X) ⟶
      (continuousCohomology R W.toSubgroup n).obj
        ((TopRep.resFunctor W.toSubgroup.subtype).obj X) :=
  sorry

/-- **Layer 10, corestriction between two open subgroups,** `cor_W^V` for open `W ≤ V ≤ G`. The
relative form of `corestriction`, obtained by running the same Shapiro-then-trace construction
inside `V`. -/
noncomputable def corestrictionLe (V W : OpenSubgroup G) (hWV : W ≤ V) (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) (n : ℕ) :
    (continuousCohomology R W.toSubgroup n).obj ((TopRep.resFunctor W.toSubgroup.subtype).obj X) ⟶
      (continuousCohomology R V.toSubgroup n).obj
        ((TopRep.resFunctor V.toSubgroup.subtype).obj X) :=
  sorry

/-- **Layer 2, the conjugate of an open subgroup,** `gUg⁻¹`. Conjugation is a homeomorphism, so the
conjugate of an open subgroup is open. -/
def conjOpenSubgroup (g : G) (U : OpenSubgroup G) : OpenSubgroup G where
  toSubgroup := U.toSubgroup.map (MulAut.conj g).toMonoidHom
  isOpen' := sorry

/-- **Layer 2, the conjugation isomorphism on cohomology,** `(g)_*`, between the cohomology of two
named subgroups related by conjugation. It is the compatible pair (conjugation by `g`, the action
of `g`). The Mackey formula names this map; a sum over an arbitrary family of morphisms would be a
different statement, and a false one. -/
noncomputable def conjMapOf (g : G) (W W' : OpenSubgroup G) (hconj : W' = conjOpenSubgroup g W)
    (X : TopRep R G) (n : ℕ) :
    (continuousCohomology R W.toSubgroup n).obj ((TopRep.resFunctor W.toSubgroup.subtype).obj X) ⟶
      (continuousCohomology R W'.toSubgroup n).obj
        ((TopRep.resFunctor W'.toSubgroup.subtype).obj X) :=
  sorry

/-- **Layer 2, conjugation distributes over the Mackey intersections.** The group-theoretic fact
that makes one term of the Mackey formula typecheck. -/
theorem conjOpenSubgroup_inf (g : G) (U V : OpenSubgroup G) :
    V ⊓ conjOpenSubgroup g U = conjOpenSubgroup g (U ⊓ conjOpenSubgroup g⁻¹ V) :=
  sorry

/-- **Layer 10, milestone 3: transitivity,** `cor_V^G = cor_U^G ∘ cor_V^U` for open `V ≤ U ≤ G`. -/
theorem corestriction_trans (U V : OpenSubgroup G) (hVU : V ≤ U) (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) (n : ℕ) :
    corestriction R V X hX n = corestrictionLe R U V hVU X hX n ≫ corestriction R U X hX n :=
  sorry

/-- **Layer 10, milestone 4: one term of the Mackey double-coset formula,**
`cor^V_{V ⊓ gUg⁻¹} ∘ (g)_* ∘ res^U_{U ⊓ g⁻¹Vg}`. It is named, rather than left as a parameter of
the formula, so that the formula states which sum is meant. -/
noncomputable def mackeyTerm (U V : OpenSubgroup G) (g : G) (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) (n : ℕ) :
    (continuousCohomology R U.toSubgroup n).obj ((TopRep.resFunctor U.toSubgroup.subtype).obj X) ⟶
      (continuousCohomology R V.toSubgroup n).obj
        ((TopRep.resFunctor V.toSubgroup.subtype).obj X) :=
  resLe R U (U ⊓ conjOpenSubgroup g⁻¹ V) inf_le_left X n ≫
    conjMapOf R g (U ⊓ conjOpenSubgroup g⁻¹ V) (V ⊓ conjOpenSubgroup g U)
        (conjOpenSubgroup_inf g U V) X n ≫
      corestrictionLe R V (V ⊓ conjOpenSubgroup g U) inf_le_left X hX n

/-- **Layer 10, milestone 4: the Mackey double-coset formula in every degree** (NSW (1.5.6)). The
double cosets are supplied as a finite family of representatives, since the indexing set is what
the formula is a sum over; `hdc` says the family is exactly a system of representatives. -/
theorem corestriction_mackey (U V : OpenSubgroup G) (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) (n : ℕ)
    (ι : Type*) [Fintype ι] (g : ι → G)
    (hdc : ∀ x : G, ∃! i : ι, ∃ v ∈ V, ∃ u ∈ U, x = v * g i * u) :
    corestriction R U X hX n ≫ res R V.toSubgroup X n =
      ∑ i : ι, mackeyTerm R U V (g i) X hX n :=
  sorry

/-- **Layer 10, milestone 3: `cor ∘ res = (G : U) • id`,** with Layer 1's restriction on the left.
The normalization is this order and this scalar. -/
theorem corestriction_comp_res (U : OpenSubgroup G) (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) (n : ℕ) :
    res R U.toSubgroup X n ≫ corestriction R U X hX n = (U.toSubgroup.index : ℤ) • 𝟙 _ :=
  sorry

end AllDegreeCorestriction

/-- **Layer 10, corestriction commutes with the all-degree connecting map.** The coefficient
dictionary isomorphisms appear explicitly because the restricted `G`-object and the object built
directly for `U` are not definitionally equal. -/
theorem delta_corestriction (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (A : Type u) [AddCommGroup A] [TopologicalSpace A] [IsTopologicalAddGroup A]
    [DiscreteTopology A] [DistribMulAction G A] [ContinuousSMul G A]
    (B : Type u) [AddCommGroup B] [TopologicalSpace B] [IsTopologicalAddGroup B]
    [DiscreteTopology B] [DistribMulAction G B] [ContinuousSMul G B]
    (C : Type u) [AddCommGroup C] [TopologicalSpace C] [IsTopologicalAddGroup C]
    [DiscreteTopology C] [DistribMulAction G C] [ContinuousSMul G C]
    (S : DiscreteShortExact G A B C) (U : OpenSubgroup G)
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup] (n : ℕ) :
    (continuousCohomology ℤ U.toSubgroup n).map (ofDiscreteModuleRes G C U.toSubgroup).hom ≫
        delta U.toSubgroup A B C (S.restrict G A B C U.toSubgroup) n ≫
        (continuousCohomology ℤ U.toSubgroup (n + 1)).map
          (ofDiscreteModuleRes G A U.toSubgroup).inv ≫
        corestriction ℤ U (ofDiscreteModule G A) (ofDiscreteModule_isSmoothDiscrete G A) (n + 1) =
      corestriction ℤ U (ofDiscreteModule G C) (ofDiscreteModule_isSmoothDiscrete G C) n ≫
        delta G A B C S n :=
  sorry

/-- **Layers 3 and 10, milestone 5: agreement of the all-degree corestriction with Layer 6's
explicit transversal formula, in degree 0.** The degree-0 member of the three-statement family
`explicitIso_cor0`, `explicitIso_cor`, `explicitIso_cor2`. These carry their own binders because
they need the coefficient module as well as the group, which the all-degree section above does
not. -/
theorem explicitIso_cor0 (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup]
    (x : H0 U.toSubgroup M) :
    (corestriction ℤ U (ofDiscreteModule G M) (ofDiscreteModule_isSmoothDiscrete G M) 0).hom
        (((continuousCohomology ℤ U.toSubgroup 0).map
            (ofDiscreteModuleRes G M U.toSubgroup).inv).hom
          ((explicitH0IsoContinuousCohomology U.toSubgroup M).hom.hom x)) =
      (explicitH0IsoContinuousCohomology G M).hom.hom (explicitCor0 G M U x) :=
  sorry

/-- **Layers 3 and 10, milestone 5: agreement of the all-degree corestriction with Layer 6's
explicit transversal formula, in degree 1,** as a commuting square. -/
theorem explicitIso_cor (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup]
    (x : DiscreteH1 U.toSubgroup M) :
    (corestriction ℤ U (ofDiscreteModule G M) (ofDiscreteModule_isSmoothDiscrete G M) 1).hom
        (((continuousCohomology ℤ U.toSubgroup 1).map
            (ofDiscreteModuleRes G M U.toSubgroup).inv).hom
          ((explicitH1IsoContinuousCohomology U.toSubgroup M).hom.hom x)) =
      (explicitH1IsoContinuousCohomology G M).hom.hom
        (explicitCor1 G M U (discreteH1Equiv U.toSubgroup M x) : DiscreteH1 G M) :=
  sorry

/-- **Layers 3 and 10, milestone 5: agreement of the all-degree corestriction with Layer 6's
explicit transversal formula, in degree 2,** where the transversal formula has two nested
transversal words. -/
theorem explicitIso_cor2 (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup]
    (x : DiscreteH2 U.toSubgroup M) :
    (corestriction ℤ U (ofDiscreteModule G M) (ofDiscreteModule_isSmoothDiscrete G M) 2).hom
        (((continuousCohomology ℤ U.toSubgroup 2).map
            (ofDiscreteModuleRes G M U.toSubgroup).inv).hom
          ((explicitH2IsoContinuousCohomology U.toSubgroup M).hom.hom x)) =
      (explicitH2IsoContinuousCohomology G M).hom.hom
        (explicitCor2 G M U (discreteH2Equiv U.toSubgroup M x) : DiscreteH2 G M) :=
  sorry

/-! ### Layer 8: cup products in low degrees -/

/-- **Layer 8, the `(1,1)` cup cochain is a 2-cocycle.** For a `G`-equivariant biadditive
pairing of discrete modules and continuous 1-cocycles `a, b` (in the pinned Mathlib's
`IsCocycle₁` convention), the cup formula `(a ⌣ b)(g, h) = μ (a g) (g • b h)` is a continuous
2-cochain satisfying `IsCocycle₂`. This is the cochain-level heart of
`cup11 : H¹(G, M) →+ H¹(G, N) →+ H²(G, P)`. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {M : Type*} [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M]
    {N : Type*} [AddCommGroup N] [TopologicalSpace N] [DiscreteTopology N]
    [DistribMulAction G N] [ContinuousSMul G N]
    {P : Type*} [AddCommGroup P] [TopologicalSpace P] [DiscreteTopology P]
    [DistribMulAction G P] [ContinuousSMul G P]
    (μ : M →+ N →+ P) (hμ : ∀ (g : G) (m : M) (n : N), μ (g • m) (g • n) = g • μ m n)
    {a : G → M} {b : G → N} (ha : Continuous a) (hb : Continuous b)
    (hac : groupCohomology.IsCocycle₁ a) (hbc : groupCohomology.IsCocycle₁ b) :
    groupCohomology.IsCocycle₂ (fun q : G × G ↦ μ (a q.1) (q.1 • b q.2)) ∧
      Continuous (fun q : G × G ↦ μ (a q.1) (q.1 • b q.2)) :=
  sorry

/-- **Layer 8, the `(1,0)` cup cochain is a 1-cocycle.** The shape that the roadmap's
associativity instance `(1,1,0)` needs on its right-hand side, and the reason `(1,0)` and
`(0,0)` belong to the six-shape family rather than being dropped as trivial:
`(a ⌣ n)(g) = μ (a g) (g • n)` for an invariant `n`, that is for a class of `H⁰(G, N)`. -/
example {G : Type*} [Group G]
    {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    {N : Type*} [AddCommGroup N] [DistribMulAction G N]
    {P : Type*} [AddCommGroup P] [DistribMulAction G P]
    (μ : M →+ N →+ P) (hμ : ∀ (g : G) (m : M) (n : N), μ (g • m) (g • n) = g • μ m n)
    {a : G → M} (hac : groupCohomology.IsCocycle₁ a) (n : N) (hn : ∀ g : G, g • n = n) :
    groupCohomology.IsCocycle₁ (fun g : G ↦ μ (a g) (g • n)) :=
  sorry

/-- **Layer 8, worked example: the cup is nontrivial on `C₂`.** With trivial action on
`𝔽₂ = ZMod 2`, the cup square of the nontrivial 1-cocycle on `C₂`, the 2-cochain
`(g, h) ↦ g · h` under the identification `C₂ = Multiplicative (ZMod 2)`, is **not** a
trivial-action coboundary `(g, h) ↦ ψ h - ψ (g * h) + ψ g`. It is the test case for a
degenerate pairing: it gives `H¹(C₂, 𝔽₂) ⌣ H¹(C₂, 𝔽₂) ≠ 0`, the `G_ℝ` Kummer computation
`[-1] ⌣ [-1] ≠ 0`, and every nondegeneracy statement about the mod-2 Kummer pairing
downstream. -/
example :
    ¬ ∃ ψ : Multiplicative (ZMod 2) → ZMod 2, ∀ g h : Multiplicative (ZMod 2),
        Multiplicative.toAdd g * Multiplicative.toAdd h = ψ h - ψ (g * h) + ψ g :=
  sorry

/-! ### Layer 9: the Galois interface -/

/-- **Layer 9, the coefficient field is the separable closure.** Mathlib defines
`Field.absoluteGaloisGroup K` as the automorphisms of `AlgebraicClosure K`. For imperfect `K`
the fixed field of that group is the purely inseparable closure of `K`, not `K`, so the
invariants of the units of the algebraic closure are not `Kˣ` and the Kummer sequence would
have the wrong left-hand term. The roadmap uses `SeparableClosure K` throughout, and this is
the comparison that lets the Mathlib name be kept: restriction to the separable closure is an
isomorphism of topological groups. Injectivity comes from
`separableClosure.isPurelyInseparable` with `instSubsingletonAlgHomOfIsPurelyInseparable`,
surjectivity from `AlgEquiv.restrictNormalHom_surjective`; what is left is that both
directions are continuous for the Krull topologies. -/
example (K : Type*) [Field K] :
    ∃ e : Field.absoluteGaloisGroup K ≃* (SeparableClosure K ≃ₐ[K] SeparableClosure K),
      Continuous e ∧ Continuous e.symm :=
  sorry

/-- **Layer 9, `G_K`, fixed once.** The roadmap's absolute Galois group is the automorphisms of
the **separable** closure. Mathlib's `Field.absoluteGaloisGroup` uses the algebraic closure, whose
fixed field is the purely inseparable closure for imperfect `K`; the two are related by a
topological group equivalence, which is a Layer 9 milestone and not a definitional identity. -/
abbrev AbsoluteGaloisGroup (K : Type*) [Field K] : Type _ :=
  SeparableClosure K ≃ₐ[K] SeparableClosure K

/-- **Layer 9, `μₙ`,** the `n`-th roots of unity in the separable closure, as a subgroup of
`(Kˢ)ˣ`. -/
noncomputable def muN (K : Type*) [Field K] (n : ℕ) : Subgroup (SeparableClosure K)ˣ :=
  rootsOfUnity n (SeparableClosure K)

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, `((Kˢ)ˣ)^{G_K}`.** -/
def unitsInvariants (K : Type*) [Field K] : Subgroup (SeparableClosure K)ˣ where
  carrier := {u | ∀ g : AbsoluteGaloisGroup K, g • u = u}
  mul_mem' {a b} ha hb g := by rw [smul_mul', ha g, hb g]
  one_mem' g := smul_one g
  inv_mem' {a} ha g := by rw [smul_inv', ha g]

/-- **Layer 9, `Kˣ ≅ ((Kˢ)ˣ)^{G_K}`.** These are not the same Lean type, so the roadmap names the
canonical equivalence rather than calling them equal. It is induced by the algebra map and the
fixed-field theorem, and it is the map the Kummer connecting homomorphism starts from. -/
noncomputable def baseUnitsEquivInvariants (K : Type*) [Field K] :
    Kˣ ≃* unitsInvariants K :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, `μₙ` is `G_K`-stable.** -/
theorem smul_mem_muN {K : Type*} [Field K] {n : ℕ} (g : AbsoluteGaloisGroup K)
    {ζ : (SeparableClosure K)ˣ} (h : ζ ∈ muN K n) : g • ζ ∈ muN K n := by
  rw [muN, mem_rootsOfUnity] at *
  rw [← smul_pow', h, smul_one]

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the natural `G_K`-action on `μₙ`.** The action is what continuous cohomology
depends on, so it is installed rather than assumed. -/
noncomputable instance muNAction {K : Type*} [Field K] {n : ℕ} :
    MulDistribMulAction (AbsoluteGaloisGroup K) (muN K n) where
  smul g ζ := ⟨g • (ζ : (SeparableClosure K)ˣ), smul_mem_muN g ζ.2⟩
  one_smul _ := Subtype.ext (one_smul _ _)
  mul_smul _ _ _ := Subtype.ext (mul_smul _ _ _)
  smul_mul _ _ _ := Subtype.ext (smul_mul' _ _ _)
  smul_one _ := Subtype.ext (smul_one _)

/-- **Layer 9, the Kummer coefficient module.** `μₙ` written additively, through the pin's
`Additive` idiom, and this is the coefficient object the Kummer isomorphism is stated against. -/
abbrev KummerCoeff (K : Type*) [Field K] (n : ℕ) : Type _ := Additive (muN K n)

noncomputable instance {K : Type*} [Field K] {n : ℕ} :
    TopologicalSpace (KummerCoeff K n) := ⊥

noncomputable instance {K : Type*} [Field K] {n : ℕ} :
    DiscreteTopology (KummerCoeff K n) := ⟨rfl⟩

/-- Mathlib has no bridge from `MulDistribMulAction M A` to `DistribMulAction M (Additive A)`, so
the Galois action is transported to additive notation here. -/
noncomputable instance {K : Type*} [Field K] {n : ℕ} :
    DistribMulAction (AbsoluteGaloisGroup K) (KummerCoeff K n) where
  smul g x := Additive.ofMul (g • Additive.toMul x)
  one_smul x := by
    show Additive.ofMul ((1 : AbsoluteGaloisGroup K) • Additive.toMul x) = _
    rw [one_smul]; rfl
  mul_smul g h x := by
    show Additive.ofMul ((g * h) • Additive.toMul x) = _
    rw [mul_smul]; rfl
  smul_zero g := by
    show Additive.ofMul (g • (1 : muN K n)) = _
    rw [smul_one]; rfl
  smul_add g x y := by
    show Additive.ofMul (g • (Additive.toMul x * Additive.toMul y)) = _
    rw [smul_mul']; rfl

/-- **Layer 9, the action is continuous,** since the stabilizer of a root of unity is open. It is
an **instance**: every Kummer statement against the canonical carrier needs it to typecheck, and a
consumer that had to supply it by hand would be carrying as a hypothesis something this layer
already owns. -/
instance kummerCoeff_continuousSMul (K : Type*) [Field K] (n : ℕ) :
    ContinuousSMul (AbsoluteGaloisGroup K) (KummerCoeff K n) :=
  sorry

/-- **Layer 9, the multiplicative coefficient module.** `(Kˢ)ˣ` written additively, through the
pin's `Additive` idiom. This is the coefficient module of the Kummer sequence, of Hilbert 90 and of
the cohomological Brauer group, and `KummerCoeff K n` is the `n`-torsion submodule of it. It is
**discrete**: every element lies in a finite subextension, so its stabilizer is open. -/
abbrev UnitsCoeff (K : Type*) [Field K] : Type _ := Additive (SeparableClosure K)ˣ

noncomputable instance {K : Type*} [Field K] : TopologicalSpace (UnitsCoeff K) := ⊥

noncomputable instance {K : Type*} [Field K] : DiscreteTopology (UnitsCoeff K) := ⟨rfl⟩

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 80000 in
/-- The Galois action transported to additive notation, for the same reason as the action on
`KummerCoeff`: Mathlib has no bridge from `MulDistribMulAction M A` to
`DistribMulAction M (Additive A)`. -/
noncomputable instance {K : Type*} [Field K] :
    DistribMulAction (AbsoluteGaloisGroup K) (UnitsCoeff K) where
  smul g x := Additive.ofMul (g • Additive.toMul x)
  one_smul x := by
    show Additive.ofMul ((1 : AbsoluteGaloisGroup K) • Additive.toMul x) = _
    rw [one_smul]; rfl
  mul_smul g h x := by
    show Additive.ofMul ((g * h) • Additive.toMul x) = _
    rw [mul_smul]; rfl
  smul_zero g := by
    show Additive.ofMul (g • (1 : (SeparableClosure K)ˣ)) = _
    rw [smul_one]; rfl
  smul_add g x y := by
    show Additive.ofMul (g • (Additive.toMul x * Additive.toMul y)) = _
    rw [smul_mul']; rfl

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the action on `(Kˢ)ˣ` is continuous,** since every unit lies in a finite
subextension and so has open stabilizer. An instance, for the same reason as
`kummerCoeff_continuousSMul`. -/
instance unitsCoeff_continuousSMul (K : Type*) [Field K] :
    ContinuousSMul (AbsoluteGaloisGroup K) (UnitsCoeff K) :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, `μₙ ⊆ (Kˢ)ˣ`,** the left-hand map of the Kummer sequence, as a map of coefficient
modules. -/
noncomputable def kummerCoeffIncl (K : Type*) [Field K] (n : ℕ) : KummerCoeff K n →+ UnitsCoeff K :=
  AddMonoidHom.mk'
    (fun x => Additive.ofMul ((Additive.toMul x : muN K n) : (SeparableClosure K)ˣ))
    fun _ _ => rfl

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the `n`-th power map on `(Kˢ)ˣ`,** the right-hand map of the Kummer sequence, which
in additive notation is multiplication by `n`. -/
noncomputable def unitsCoeffPow (K : Type*) [Field K] (n : ℕ) : UnitsCoeff K →+ UnitsCoeff K :=
  AddMonoidHom.mk' (fun x => n • x) fun x y => smul_add n x y

/-- **Layer 9, the subgroup of `n`-th powers `(Kˣ)ⁿ ≤ Kˣ`.** -/
def powerSubgroup (K : Type*) [Field K] (n : ℕ) : Subgroup Kˣ :=
  (powMonoidHom n : Kˣ →* Kˣ).range

/-- **Layer 9, the group of power classes `Kˣ ⧸ (Kˣ)ⁿ`,** the left-hand side of the Kummer
isomorphism. -/
abbrev powerClassQuotient (K : Type*) [Field K] (n : ℕ) : Type _ :=
  Kˣ ⧸ powerSubgroup K n

-- The action of `Gal(Kˢ/K)` on `(Kˢ)ˣ` is found by instance search, but not within the
-- default budget for a type this deep.
set_option synthInstance.maxHeartbeats 40000 in
/-- **Layer 9, the Kummer cocycle for general `n`.** Assume `n` invertible in `K`. For
`a ∈ Kˣ` with a chosen `n`-th root `r` in the separable closure (which exists because
`Xⁿ - a` is separable when `n` is invertible, and `SeparableClosure K` is separably closed),
the map `κ_a(g) = g r / r` takes its values in `μₙ`, is a **multiplicative** 1-cocycle, and is
locally constant for the Krull topology because the stabilizer of `r` is open. Its class is
the image of `a` under the connecting map of `1 → μₙ → (Kˢ)ˣ → (Kˢ)ˣ → 1`, and the resulting
map induces the Kummer isomorphism `Kˣ ⧸ (Kˣ)ⁿ ≅ H¹(G_K, μₙ)`, which is `kummerIso` below,
against Layer 2's explicit `H¹`. This statement is the cocycle it is built from. -/
example (K : Type*) [Field K] (n : ℕ) [NeZero n] (hn : IsUnit (n : K)) (a : Kˣ)
    (r : (SeparableClosure K)ˣ)
    (hr : (r : SeparableClosure K) ^ n = algebraMap K (SeparableClosure K) (a : K)) :
    ∃ κ : (SeparableClosure K ≃ₐ[K] SeparableClosure K) → muN K n,
      (∀ g, (κ g : (SeparableClosure K)ˣ) = g • r / r) ∧
        groupCohomology.IsMulCocycle₁ (fun g ↦ (κ g : (SeparableClosure K)ˣ)) ∧
        IsLocallyConstant κ :=
  sorry

set_option synthInstance.maxHeartbeats 40000 in
/-- **Layer 9, the Kummer class does not depend on the chosen root.** Two `n`-th roots of the
same `a` differ by an `n`-th root of unity, and the two cocycles differ by the coboundary of
that root of unity. Without this the connecting map is not well defined on `Kˣ`. The factor
`ζ` is typed as an element of `μₙ`, not as a field element that happens to satisfy
`ζ ^ n = 1`. -/
example (K : Type*) [Field K] (n : ℕ) [NeZero n] (a : Kˣ) (r r' : (SeparableClosure K)ˣ)
    (hr : (r : SeparableClosure K) ^ n = algebraMap K (SeparableClosure K) (a : K))
    (hr' : (r' : SeparableClosure K) ^ n = algebraMap K (SeparableClosure K) (a : K)) :
    ∃ ζ : muN K n, (r' : (SeparableClosure K)ˣ) = (ζ : (SeparableClosure K)ˣ) * r ∧
      ∀ g : SeparableClosure K ≃ₐ[K] SeparableClosure K,
        g • r' / r' =
          (g • (ζ : (SeparableClosure K)ˣ) / (ζ : (SeparableClosure K)ˣ)) * (g • r / r) :=
  sorry

section KummerClass

variable (K : Type*) [Field K] (n : ℕ) [NeZero n]

/-- **Layer 9, the Kummer map at class level.** The target names the canonical coefficient object,
not an arbitrary module carrying an arbitrary action: continuous cohomology depends on the action,
and a plain group equivalence with `μₙ` would not pin it, so the same abstract cyclic group with
the trivial action would satisfy a generically quantified statement for which the theorem is
false. -/
noncomputable def kummerMap (hn : IsUnit (n : K)) :
    Kˣ →* Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  sorry

/-- **Layer 9, the Kummer isomorphism,** milestone 7 of the layer and the statement the Local
Fields and Quadratic Form Invariants roadmaps consume. The kernel of `kummerMap` is `(Kˣ)ⁿ` and
its surjectivity is Hilbert 90. -/
noncomputable def kummerIso (hn : IsUnit (n : K)) :
    powerClassQuotient K n ≃*
      Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  sorry

/-- **Layer 9, transport along an identification of coefficients.** A consumer that carries its
own model of `μₙ` may use it, but only through a **continuous `G_K`-equivariant** additive
equivalence: the equivariance law `hequiv` is the hypothesis a plain group equivalence lacks, and
the conclusion is the transported isomorphism itself, not a claim that one exists. -/
noncomputable def kummerIsoTransport (hn : IsUnit (n : K))
    (μ : Type*) [AddCommGroup μ] [TopologicalSpace μ] [IsTopologicalAddGroup μ]
    [DiscreteTopology μ] [DistribMulAction (AbsoluteGaloisGroup K) μ]
    (e : KummerCoeff K n ≃+ μ) (he : Continuous e)
    (hequiv : ∀ (g : AbsoluteGaloisGroup K) (x : KummerCoeff K n), e (g • x) = g • e x) :
    powerClassQuotient K n ≃* Multiplicative (H1 (AbsoluteGaloisGroup K) μ) :=
  sorry

/-- **Layer 9, the map of power classes along a field extension,** the identity on representatives
followed by the quotient. -/
noncomputable def powerClassMap (L : Type*) [Field L] [Algebra K L] :
    powerClassQuotient K n →* powerClassQuotient L n :=
  sorry

/-- **Layer 9, the norm on power classes,** induced by `N_{L/K}` on units. -/
noncomputable def powerClassNorm (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L] :
    powerClassQuotient L n →* powerClassQuotient K n :=
  sorry

/-- **Layer 9, restriction on the Kummer `H¹` along a chosen `K`-embedding of `L` into a separable
closure of `K`.** The embedding is genuine data: without one there is no map `G_L → G_K` at all, so
a square stated for an arbitrary homomorphism is a different statement, and a false one. -/
noncomputable def kummerRes (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (ι : L →ₐ[K] SeparableClosure K) :
    Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) →*
      Multiplicative (H1 (AbsoluteGaloisGroup L) (KummerCoeff L n)) :=
  sorry

/-- **Layer 9, corestriction on the Kummer `H¹` along the same embedding.** The embedding realizes
`G_L` as an open subgroup of `G_K`, which is what makes the transfer available. -/
noncomputable def kummerCor (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (ι : L →ₐ[K] SeparableClosure K) :
    Multiplicative (H1 (AbsoluteGaloisGroup L) (KummerCoeff L n)) →*
      Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  sorry

/-- **Layer 9, the restriction square.** For a finite separable `L/K` with a chosen `K`-embedding
of `L` into `Kˢ`, restriction on cohomology corresponds to the map of power classes. -/
theorem kummerIso_res (hn : IsUnit (n : K)) (L : Type*) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (hnL : IsUnit (n : L))
    (ι : L →ₐ[K] SeparableClosure K) (x : powerClassQuotient K n) :
    kummerRes K n L ι (kummerIso K n hn x) = kummerIso L n hnL (powerClassMap K n L x) :=
  sorry

/-- **Layer 9, the norm square.** Corestriction corresponds to the field norm `N_{L/K}`. -/
theorem kummerIso_norm (hn : IsUnit (n : K)) (L : Type*) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (hnL : IsUnit (n : L))
    (ι : L →ₐ[K] SeparableClosure K) (y : powerClassQuotient L n) :
    kummerCor K n L ι (kummerIso L n hnL y) = kummerIso K n hn (powerClassNorm K n L y) :=
  sorry

end KummerClass

section KummerComparison

open CategoryTheory

variable (K : Type u) [Field K] (n : ℕ) [NeZero n]
  [CompactSpace (AbsoluteGaloisGroup K)] [TotallyDisconnectedSpace (AbsoluteGaloisGroup K)]

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the Kummer class against the canonical object.** `kummerMap` lands in the explicit
`H¹` of Layer 2; this is the same construction against Layer 1's carrier, so that a consumer
working in all degrees never has to move between the two by hand. -/
noncomputable def kummerMapCanonical (hn : IsUnit (n : K)) :
    Kˣ →* Multiplicative ((continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K n))) :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layers 3 and 9, the explicit and canonical Kummer classes agree.** Both maps are named, so
the statement is that these two agree and not that some isomorphism carries one to something. This
is what makes `kummerIso` usable against the all-degree theory without a private transport. -/
theorem explicitIso_kummerMap (hn : IsUnit (n : K)) (a : Kˣ) :
    Multiplicative.toAdd (kummerMapCanonical K n hn a) =
      (explicitH1IsoContinuousCohomology (AbsoluteGaloisGroup K) (KummerCoeff K n)).hom.hom
        (Multiplicative.toAdd (kummerMap K n hn a) :
          DiscreteH1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the Kummer sequence** `1 → μₙ → (Kˢ)ˣ →^n (Kˢ)ˣ → 1`, as the Layer 5 datum the long
exact sequence is taken of. Surjectivity of the `n`-th power map is separable closedness of `Kˢ`
together with separability of `Xⁿ - a`, which is where `IsUnit (n : K)` is used. The two maps are
pinned to the named ones by the two theorems below, so that nothing here is a statement about an
arbitrary pair of coefficient maps. -/
noncomputable def kummerShortExact (hn : IsUnit (n : K)) :
    DiscreteShortExact (AbsoluteGaloisGroup K) (KummerCoeff K n) (UnitsCoeff K) (UnitsCoeff K) :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- The inclusion of the Kummer sequence is `μₙ ⊆ (Kˢ)ˣ`. -/
theorem kummerShortExact_incl (hn : IsUnit (n : K)) :
    (kummerShortExact K n hn).incl = kummerCoeffIncl K n :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- The projection of the Kummer sequence is the `n`-th power map. -/
theorem kummerShortExact_proj (hn : IsUnit (n : K)) :
    (kummerShortExact K n hn).proj = unitsCoeffPow K n :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, Hilbert 90 for the absolute Galois group,** `H¹(G_K, (Kˢ)ˣ) = 0` (NSW (6.2.1)). It
is what makes the Kummer connecting map surjective, and Layer 4's colimit is how it is proved from
the pin's finite-level `groupCohomology.hilbert90`. -/
theorem hilbert90 :
    Limits.IsZero ((continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K))) :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the inclusion `μₙ ⊆ (Kˢ)ˣ` as a morphism of canonical coefficient objects.** A real
body over Layer 1's dictionary, so that the map on cohomology below is determined by
`kummerCoeffIncl` and cannot drift from it. -/
noncomputable def kummerCoeffToUnits :
    ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K n) ⟶
      ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K) :=
  ofDiscreteModuleMap (AbsoluteGaloisGroup K) (KummerCoeff K n) (UnitsCoeff K)
    (kummerCoeffIncl K n) continuous_of_discreteTopology fun _ _ => rfl

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the map `H²(G_K, μₙ) → H²(G_K, (Kˢ)ˣ)` induced by that inclusion,** which is how the
mod-`n` part of `H²` sits inside the cohomological Brauer group. A real body, from Layer 1's
`coeffMap`. -/
noncomputable def h2KummerToUnits :
    (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
        (ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K n)) ⟶
      (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
        (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K)) :=
  coeffMap ℤ (kummerCoeffToUnits K n) 2

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, it is injective,** which is Hilbert 90 read through the long exact sequence of the
Kummer sequence: the term before it is `H¹(G_K, (Kˢ)ˣ)`, and that vanishes. -/
theorem h2KummerToUnits_injective (hn : IsUnit (n : K)) :
    Function.Injective (h2KummerToUnits K n).hom :=
  sorry

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, its image is the `n`-torsion,** which is exactness of the same sequence at
`H²(G_K, (Kˢ)ˣ)`, the next map being multiplication by `n`. -/
theorem h2KummerToUnits_range (hn : IsUnit (n : K))
    (x : (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
      (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K))) :
    (∃ y, (h2KummerToUnits K n).hom y = x) ↔ n • x = 0 :=
  sorry

end KummerComparison

/-! ### Layer 11: cohomological dimension -/

/-- **Layer 11, the least bound of a predicate on `ℕ`, in `ℕ∞`.** The roadmap defines
cohomological dimension from a `Prop`-valued predicate on `ℕ` and only then takes an infimum,
with codomain `ℕ∞` so that "infinite cohomological dimension" is `⊤` rather than an absent
value. All four of `CohomologicalDimensionLE`, `StrictCohomologicalDimensionLE`, `cd_p` and
`scd_p` are stated against Layer 10's `Hⁿ`; the order-theoretic wrapper is not, and
it is made once here rather than three times inline. -/
noncomputable def leastENatBound (P : ℕ → Prop) : ℕ∞ :=
  sInf {m : ℕ∞ | ∃ n : ℕ, m = (n : ℕ∞) ∧ P n}

/-- **Layer 11, the characterization for an upward-closed predicate.** Instantiating `P` at
the vanishing predicate of Layer 10 gives `cd_p G ≤ n ↔ CohomologicalDimensionLE p G n`, and
the same shape serves `cd` and `scd_p`. -/
theorem leastENatBound_le_iff (P : ℕ → Prop) (hP : ∀ m n : ℕ, m ≤ n → P m → P n) (n : ℕ) :
    leastENatBound P ≤ (n : ℕ∞) ↔ P n :=
  sorry

/-- **Layer 11, the empty case.** No bound at all gives `⊤`, since `sInf ∅ = ⊤` in `ℕ∞`. -/
theorem leastENatBound_eq_top (P : ℕ → Prop) (hP : ∀ n : ℕ, ¬ P n) : leastENatBound P = ⊤ :=
  sorry

section CohomologicalDimension

open CategoryTheory

/-- **Layer 11, `p`-primary torsion coefficients.** Every element is annihilated by a power of `p`,
which is Mathlib's `AddCommGroup.primaryComponent` read as a condition on the whole module. The
coefficients of the ordinary dimension are these and **not** the ones of bounded exponent: the
reduction to bounded exponent is a theorem below, proved through the filtered-colimit compatibility
of Layer 10, and taking it as the definition would state a different invariant. -/
def IsPPrimaryTorsion (p : ℕ) [Fact p.Prime] (M : Type*) [AddCommGroup M] : Prop :=
  ∀ m : M, m ∈ AddCommGroup.primaryComponent M p

variable (p : ℕ) [hp : Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 11, the ordinary vanishing predicate.** `Hⁱ(G, M)` vanishes above `n` for every
discrete `p`-primary torsion `M`. `Hⁱ` is Layer 10's, so this rests on Layer 10 and on nothing
below it. -/
def CohomologicalDimensionLE (n : ℕ) : Prop :=
  ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M],
    IsPPrimaryTorsion p M → ∀ i : ℕ, n < i →
      Limits.IsZero ((continuousCohomology ℤ G i).obj (ofDiscreteModule G M))

include hp in
/-- **Layer 11, the strict vanishing predicate.** The two predicates differ in both places at
once: the ordinary one asks the whole of `Hⁱ` to vanish for `p`-primary coefficients, the strict
one allows arbitrary discrete coefficients and asks only the `p`-primary part of `Hⁱ` to vanish.
Swapping either half gives the wrong invariant, and dropping `p` from the second gives one that
does not depend on `p` at all. -/
def StrictCohomologicalDimensionLE (n : ℕ) : Prop :=
  ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M],
    ∀ i : ℕ, n < i →
      AddCommGroup.primaryComponent
        ((continuousCohomology ℤ G i).obj (ofDiscreteModule G M)) p = ⊥

/-- **Layer 11, `cd_p`.** The infimum in `ℕ∞` of the naturals satisfying the ordinary predicate,
so that infinite cohomological dimension is `⊤` rather than an absent value. -/
noncomputable def cd_p : ℕ∞ :=
  leastENatBound (CohomologicalDimensionLE p G)

/-- **Layer 11, `scd_p`.** -/
noncomputable def scd_p : ℕ∞ :=
  leastENatBound (StrictCohomologicalDimensionLE p G)

/-- **Layer 11, `cd G = ⨆ p, cd_p G`,** over primes. -/
noncomputable def cd : ℕ∞ :=
  ⨆ q : Nat.Primes, letI : Fact q.1.Prime := ⟨q.2⟩; cd_p q.1 G

/-- **Layer 11, `cd_p G ≤ n ↔ CohomologicalDimensionLE p G n`,** the reason the predicate is named
in its own right rather than folded into the infimum. -/
theorem cd_p_le_iff (n : ℕ) : cd_p p G ≤ (n : ℕ∞) ↔ CohomologicalDimensionLE p G n :=
  sorry

/-- **Layer 11, the same characterization for `scd_p`.** -/
theorem scd_p_le_iff (n : ℕ) : scd_p p G ≤ (n : ℕ∞) ↔ StrictCohomologicalDimensionLE p G n :=
  sorry

/-- **Layer 11, the second interface for ordinary dimension** (NSW (3.3.1)): vanishing of the
`p`-primary component of `Hⁱ(G, M)` for every discrete **torsion** `M`. It is one torsion
hypothesis away from the strict predicate, which is why all three statements are kept apart. -/
theorem cohomologicalDimensionLE_iff_torsion (n : ℕ) :
    CohomologicalDimensionLE p G n ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M],
        AddMonoid.IsTorsion M → ∀ i : ℕ, n < i →
          AddCommGroup.primaryComponent
            ((continuousCohomology ℤ G i).obj (ofDiscreteModule G M)) p = ⊥ :=
  sorry

/-- **Layer 11, dévissage to finite `p`-primary coefficients** (NSW (3.3.2)). It is enough to test
the single degree `n + 1` on **finite** discrete `p`-primary modules: Layer 10's colimit reduces an
arbitrary `p`-primary module to its finite submodules, and dimension shifting reduces the higher
degrees to that one. -/
theorem cd_p_le_iff_finite_pPrimary (n : ℕ) :
    cd_p p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M],
        IsPPrimaryTorsion p M →
          Limits.IsZero ((continuousCohomology ℤ G (n + 1)).obj (ofDiscreteModule G M)) :=
  sorry

/-- **Layer 11, dévissage to coefficients of bounded exponent.** Testing only the modules killed by
a single power of `p` is enough, because an arbitrary `p`-primary module is the filtered colimit of
its `pᵏ`-torsion submodules and Layer 10's cohomology commutes with those colimits. This is the
reduction a consumer working with `𝔽_p`-coefficients needs, and it is a theorem here rather than
the definition of `cd_p`. -/
theorem cd_p_le_iff_boundedExponent (n : ℕ) :
    cd_p p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M],
        (∃ k : ℕ, ∀ m : M, (p ^ k) • m = 0) → ∀ i : ℕ, n < i →
          Limits.IsZero ((continuousCohomology ℤ G i).obj (ofDiscreteModule G M)) :=
  sorry

/-- **Layer 11, `cd_p ≤ scd_p`** (NSW (3.3.3)). -/
theorem cd_p_le_scd_p : cd_p p G ≤ scd_p p G :=
  sorry

/-- **Layer 11, `scd_p ≤ cd_p + 1`** (NSW (3.3.3)), including the case `cd_p G = ⊤`, where
`⊤ + 1 = ⊤` and the inequality still has to hold. Equality of the two is the false neighbor: for
`ℤ_p` one has `cd_p = 1` and `scd_p = 2`. -/
theorem scd_p_le_cd_p_add_one : scd_p p G ≤ cd_p p G + 1 :=
  sorry

/-- **Layer 11, monotonicity in a closed subgroup** (NSW (3.3.5), Ribes-Zalesskii Thm. 7.3.1). -/
theorem cd_p_le_of_isClosed (H : Subgroup G) (hH : IsClosed (H : Set G))
    [CompactSpace H] [TotallyDisconnectedSpace H] :
    cd_p p H ≤ cd_p p G :=
  sorry

/-- **Layer 11, equality for an open subgroup of index prime to `p`,** from Layer 10's
`cor ∘ res = (G : U) • id`. -/
theorem cd_p_eq_of_index_not_dvd (U : OpenSubgroup G) (hU : ¬ p ∣ U.toSubgroup.index)
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup] :
    cd_p p U.toSubgroup = cd_p p G :=
  sorry

end CohomologicalDimension

/-! ### Layer 12: the graded cup product in all degrees -/

section GradedCup

open CategoryTheory

variable {R : Type v} [CommRing R] [TopologicalSpace R]
  {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 12, milestone 1: the coefficient pairing.** The input type of the whole layer: an
`R`-bilinear map that is jointly continuous and `G`-equivariant. Joint continuity is automatic
when the coefficients are discrete, which is every arithmetic application, and is not automatic in
general, which is why it is carried. -/
structure TopPairing (X Y Z : TopRep R G) where
  /-- the underlying bilinear map -/
  bil : X.V →ₗ[R] Y.V →ₗ[R] Z.V
  /-- joint continuity -/
  cont : Continuous fun p : X.V × Y.V => bil p.1 p.2
  /-- equivariance -/
  equivariant : ∀ (g : G) (x : X.V) (y : Y.V),
    bil (X.ρ g x) (Y.ρ g y) = Z.ρ g (bil x y)

/-- Transport along an equality of degrees. The cup lands in `H^{m+n}`, and `(p+q)+r` and
`p+(q+r)` are equal but not definitionally so, so associativity and commutativity are stated
through this. -/
noncomputable def degreeCast {m n : ℕ} (h : m = n) (X : TopRep R G) :
    (continuousCohomology R G m).obj X → (continuousCohomology R G n).obj X :=
  fun x => h ▸ x

/-- **Layer 1, the class of an invariant coefficient in degree 0.** Degree 0 is the invariants, so
an invariant element has a class; this is the map the unit laws below name. -/
noncomputable def degreeZeroClass (Y : TopRep R G) (u : Y.V)
    (hinv : ∀ g : G, Y.ρ g u = u) : (continuousCohomology R G 0).obj Y :=
  sorry

/-- Transport along an equality of degrees, at cochain level. `(m + 1) + n` and `m + (n + 1)` are
equal but not definitionally so, which is why the Leibniz identity below needs it. -/
noncomputable def cochainDegreeCast {m n : ℕ} (h : m = n) (X : TopRep R G) :
    ((homogeneousCochainsFunctor R G).obj X).X m →
      ((homogeneousCochainsFunctor R G).obj X).X n :=
  fun x => h ▸ x

/-- **Layer 12, milestone 2: the Alexander--Whitney pairing on Mathlib's iterated-coinduction
resolution.** This is the recursive construction omitted by an endpoint-only `cupCochain`. -/
noncomputable def resolutionCupPairing {X Y Z : TopRep R G} (P : TopPairing X Y Z) (m n : ℕ) :
    ((homogeneousCochainsFunctor R G).obj X).X m →ₗ[R]
      ((homogeneousCochainsFunctor R G).obj Y).X n →ₗ[R]
        ((homogeneousCochainsFunctor R G).obj Z).X (m + n) :=
  sorry

/-- The pointwise coefficient-pairing formula used at the base of the recursion. -/
noncomputable def resolutionCupPairingZeroFormula {X Y Z : TopRep R G}
    (P : TopPairing X Y Z) (n : ℕ) :
    ((homogeneousCochainsFunctor R G).obj X).X 0 →ₗ[R]
      ((homogeneousCochainsFunctor R G).obj Y).X n →ₗ[R]
        ((homogeneousCochainsFunctor R G).obj Z).X n :=
  sorry

/-- The Alexander--Whitney head/tail formula used at the successor step. -/
noncomputable def resolutionCupPairingSuccFormula {X Y Z : TopRep R G}
    (P : TopPairing X Y Z) (m n : ℕ) :
    ((homogeneousCochainsFunctor R G).obj X).X (m + 1) →ₗ[R]
      ((homogeneousCochainsFunctor R G).obj Y).X n →ₗ[R]
        ((homogeneousCochainsFunctor R G).obj Z).X (m + 1 + n) :=
  sorry

/-- **Layer 12, the base application equation for the resolution pairing.** The implementation
expands this theorem to the coefficient pairing on the first iterated continuous-map coordinate. -/
theorem resolutionCupPairing_apply_zero {X Y Z : TopRep R G} (P : TopPairing X Y Z) (n : ℕ)
    (a : ((homogeneousCochainsFunctor R G).obj X).X 0)
    (b : ((homogeneousCochainsFunctor R G).obj Y).X n) :
    resolutionCupPairing P 0 n a b =
      cochainDegreeCast (Nat.zero_add n).symm Z (resolutionCupPairingZeroFormula P n a b) :=
  sorry

/-- **Layer 12, the recursive application equation for the resolution pairing.** In the
implementation the right side is the Alexander--Whitney head/tail recursion on the iterated
`C(G,-)` representation; this named theorem is the rewrite interface used by Leibniz. -/
theorem resolutionCupPairing_apply_succ {X Y Z : TopRep R G} (P : TopPairing X Y Z)
    (m n : ℕ) (a : ((homogeneousCochainsFunctor R G).obj X).X (m + 1))
    (b : ((homogeneousCochainsFunctor R G).obj Y).X n) :
    resolutionCupPairing P (m + 1) n a b = resolutionCupPairingSuccFormula P m n a b :=
  sorry

/-- **Layer 12, milestone 3: the cochain-level product,** defined from the named pairing on the
actual resolution. The Leibniz identity is a statement about this, not about classes. -/
noncomputable def cupCochain {X Y Z : TopRep R G} (P : TopPairing X Y Z) (m n : ℕ) :
    ((homogeneousCochainsFunctor R G).obj X).X m →
      ((homogeneousCochainsFunctor R G).obj Y).X n →
        ((homogeneousCochainsFunctor R G).obj Z).X (m + n) :=
  fun a b => resolutionCupPairing P m n a b

/-- **Layer 12, the public cochain product is the resolution pairing.** -/
theorem cupCochain_apply {X Y Z : TopRep R G} (P : TopPairing X Y Z) (m n : ℕ)
    (a : ((homogeneousCochainsFunctor R G).obj X).X m)
    (b : ((homogeneousCochainsFunctor R G).obj Y).X n) :
    cupCochain P m n a b = resolutionCupPairing P m n a b :=
  rfl

/-- **Layer 12, milestone 7: the named associativity homotopy operator.** Its specification below
states that its boundary is the difference between the two parenthesizations. -/
noncomputable def cupAssocHomotopy {A B C D E F : TopRep R G}
    (μ₁ : TopPairing A B D) (μ₂ : TopPairing D C E)
    (ν₁ : TopPairing B C F) (ν₂ : TopPairing A F E)
    (hcoeff : ∀ (a : A.V) (b : B.V) (c : C.V), μ₂.bil (μ₁.bil a b) c = ν₂.bil a (ν₁.bil b c))
    (p q r : ℕ) :
    ((homogeneousCochainsFunctor R G).obj A).X p →ₗ[R]
      ((homogeneousCochainsFunctor R G).obj B).X q →ₗ[R]
        ((homogeneousCochainsFunctor R G).obj C).X r →ₗ[R]
          ((homogeneousCochainsFunctor R G).obj E).X (p + q + r).pred :=
  sorry

/-- **Layer 12, milestone 8: the named graded-commutativity homotopy operator.** -/
noncomputable def cupCommHomotopy {X Y Z : TopRep R G}
    (P : TopPairing X Y Z) (Pop : TopPairing Y X Z)
    (hop : ∀ (x : X.V) (y : Y.V), Pop.bil y x = P.bil x y) (m n : ℕ) :
    ((homogeneousCochainsFunctor R G).obj X).X m →ₗ[R]
      ((homogeneousCochainsFunctor R G).obj Y).X n →ₗ[R]
        ((homogeneousCochainsFunctor R G).obj Z).X (m + n).pred :=
  sorry

/-- **Layer 12, milestone 5: the cup product in bidegree `(m, n)`.** A plain function here
because the milestones that make it biadditive, associative and graded commutative are separate;
stating it as an additive map before those are proved would assert them. -/
noncomputable def cup {X Y Z : TopRep R G} (P : TopPairing X Y Z) (m n : ℕ) :
    ((continuousCohomology R G m).obj X) → ((continuousCohomology R G n).obj Y) →
      ((continuousCohomology R G (m + n)).obj Z) :=
  sorry

variable {X Y Z : TopRep R G}

/-- **Layer 12, milestone 4: the Leibniz identity,** with the sign convention fixed here. -/
theorem cupCochain_leibniz (P : TopPairing X Y Z) (m n : ℕ)
    (a : ((homogeneousCochainsFunctor R G).obj X).X m)
    (b : ((homogeneousCochainsFunctor R G).obj Y).X n) :
    (((homogeneousCochainsFunctor R G).obj Z).d (m + n) (m + n + 1)).hom
        (cupCochain P m n a b) =
      cochainDegreeCast (by omega) Z
          (cupCochain P (m + 1) n
            ((((homogeneousCochainsFunctor R G).obj X).d m (m + 1)).hom a) b) +
        ((-1 : R) ^ m) •
          cupCochain P m (n + 1) a
            ((((homogeneousCochainsFunctor R G).obj Y).d n (n + 1)).hom b) :=
  sorry

/-- **Layer 12, milestone 5: additivity in the first argument.** -/
theorem cup_add_left (P : TopPairing X Y Z) (m n : ℕ)
    (a a' : (continuousCohomology R G m).obj X)
    (b : (continuousCohomology R G n).obj Y) :
    cup P m n (a + a') b = cup P m n a b + cup P m n a' b :=
  sorry

/-- **Layer 12, milestone 5: additivity in the second argument.** -/
theorem cup_add_right (P : TopPairing X Y Z) (m n : ℕ)
    (a : (continuousCohomology R G m).obj X)
    (b b' : (continuousCohomology R G n).obj Y) :
    cup P m n a (b + b') = cup P m n a b + cup P m n a b' :=
  sorry

/-- **Layer 12, milestone 6: the unit on the right.** For a discrete `G`-ring the class of `1` in
`H⁰` is a unit for the cup; the hypothesis is the coefficient-level equation and the conclusion is
the class-level one. -/
theorem cup_one_right (P : TopPairing X Y X) (u : Y.V) (hinv : ∀ g : G, Y.ρ g u = u)
    (hu : ∀ x : X.V, P.bil x u = x) (m : ℕ) (a : (continuousCohomology R G m).obj X) :
    cup P m 0 a (degreeZeroClass Y u hinv) = a :=
  sorry

/-- **Layer 12, milestone 6: the unit on the left.** -/
theorem cup_one_left (P : TopPairing Y X X) (u : Y.V) (hinv : ∀ g : G, Y.ρ g u = u)
    (hu : ∀ x : X.V, P.bil u x = x) (n : ℕ) (a : (continuousCohomology R G n).obj X) :
    cup P 0 n (degreeZeroClass Y u hinv) a = degreeCast (Nat.zero_add n).symm X a :=
  sorry

/-- **Layer 12, milestone 7: specification of `cupAssocHomotopy`.** Its boundary gives the two
parenthesizations, hence the following equality on classes. -/
theorem cupAssocHomotopy_spec {A B C D E F : TopRep R G}
    (μ₁ : TopPairing A B D) (μ₂ : TopPairing D C E)
    (ν₁ : TopPairing B C F) (ν₂ : TopPairing A F E)
    (hcoeff : ∀ (a : A.V) (b : B.V) (c : C.V), μ₂.bil (μ₁.bil a b) c = ν₂.bil a (ν₁.bil b c))
    (p q r : ℕ) (x : (continuousCohomology R G p).obj A)
    (y : (continuousCohomology R G q).obj B) (z : (continuousCohomology R G r).obj C) :
    cup μ₂ (p + q) r (cup μ₁ p q x y) z =
      degreeCast (Nat.add_assoc p q r).symm E (cup ν₂ p (q + r) x (cup ν₁ q r y z)) :=
  sorry

/-- **Layer 12, milestone 7: associativity on classes, derived from the named homotopy.** -/
theorem cup_assoc {A B C D E F : TopRep R G} (μ₁ : TopPairing A B D) (μ₂ : TopPairing D C E)
    (ν₁ : TopPairing B C F) (ν₂ : TopPairing A F E)
    (hcoeff : ∀ (a : A.V) (b : B.V) (c : C.V), μ₂.bil (μ₁.bil a b) c = ν₂.bil a (ν₁.bil b c))
    (p q r : ℕ) (x : (continuousCohomology R G p).obj A)
    (y : (continuousCohomology R G q).obj B) (z : (continuousCohomology R G r).obj C) :
    cup μ₂ (p + q) r (cup μ₁ p q x y) z =
      degreeCast (Nat.add_assoc p q r).symm E (cup ν₂ p (q + r) x (cup ν₁ q r y z)) :=
  cupAssocHomotopy_spec μ₁ μ₂ ν₁ ν₂ hcoeff p q r x y z

/-- **Layer 12, milestone 8: specification of `cupCommHomotopy`.** -/
theorem cupCommHomotopy_spec (P : TopPairing X Y Z) (Pop : TopPairing Y X Z)
    (hop : ∀ (x : X.V) (y : Y.V), Pop.bil y x = P.bil x y) (m n : ℕ)
    (a : (continuousCohomology R G m).obj X) (b : (continuousCohomology R G n).obj Y) :
    cup P m n a b =
      ((-1 : R) ^ (m * n)) • degreeCast (Nat.add_comm n m) Z (cup Pop n m b a) :=
  sorry

/-- **Layer 12, milestone 8: graded commutativity on classes, derived from the named
homotopy.** -/
theorem cup_gradedComm (P : TopPairing X Y Z) (Pop : TopPairing Y X Z)
    (hop : ∀ (x : X.V) (y : Y.V), Pop.bil y x = P.bil x y) (m n : ℕ)
    (a : (continuousCohomology R G m).obj X) (b : (continuousCohomology R G n).obj Y) :
    cup P m n a b =
      ((-1 : R) ^ (m * n)) • degreeCast (Nat.add_comm n m) Z (cup Pop n m b a) :=
  cupCommHomotopy_spec P Pop hop m n a b

/-- **Layer 12, milestone 9: restriction compatibility.** The restricted pairing is supplied with
its defining equation, since restriction does not change the coefficient map. -/
theorem cup_res (P : TopPairing X Y Z) (S : Subgroup G)
    (Pres : TopPairing ((TopRep.resFunctor S.subtype).obj X) ((TopRep.resFunctor S.subtype).obj Y)
      ((TopRep.resFunctor S.subtype).obj Z))
    (hPres : Pres.bil = P.bil) (m n : ℕ)
    (a : (continuousCohomology R G m).obj X) (b : (continuousCohomology R G n).obj Y) :
    (res R S Z (m + n)).hom (cup P m n a b) =
      cup Pres m n ((res R S X m).hom a) ((res R S Y n).hom b) :=
  sorry

/-- **Layer 12, milestone 9: inflation compatibility.** The quotient pairing is supplied with its
defining equation, which unlike the restricted case cannot be an equality of bilinear maps: the
invariants are a different module, so the two pairings are compared after including the invariants
into the object along `quotientToInvariantsι`. -/
theorem cup_infl (N : Subgroup G) [N.Normal] [IsTopologicalGroup (G ⧸ N)] (P : TopPairing X Y Z)
    (Pinv : TopPairing (quotientToInvariants R N X) (quotientToInvariants R N Y)
      (quotientToInvariants R N Z))
    (hPinv : ∀ (x : (quotientToInvariants R N X).V) (y : (quotientToInvariants R N Y).V),
      (quotientToInvariantsι R N Z).hom (Pinv.bil x y) =
        P.bil ((quotientToInvariantsι R N X).hom x) ((quotientToInvariantsι R N Y).hom y))
    (m n : ℕ)
    (a : (continuousCohomology R (G ⧸ N) m).obj (quotientToInvariants R N X))
    (b : (continuousCohomology R (G ⧸ N) n).obj (quotientToInvariants R N Y)) :
    (infl R N Z (m + n)).hom (cup Pinv m n a b) =
      cup P m n ((infl R N X m).hom a) ((infl R N Y n).hom b) :=
  sorry

/-- **Layer 12, milestone 9: naturality in the coefficients** (NSW (1.4.2)). The two pairings are
tied together by the three coefficient morphisms, which is what makes this a statement about a
determined pair of cups rather than about two unrelated ones. -/
theorem cup_coeffMap (P : TopPairing X Y Z) {X' Y' Z' : TopRep R G} (P' : TopPairing X' Y' Z')
    (f : X ⟶ X') (g : Y ⟶ Y') (h : Z ⟶ Z')
    (hcompat : ∀ (x : X.V) (y : Y.V), h (P.bil x y) = P'.bil (f x) (g y))
    (m n : ℕ) (a : (continuousCohomology R G m).obj X)
    (b : (continuousCohomology R G n).obj Y) :
    (coeffMap R h (m + n)).hom (cup P m n a b) =
      cup P' m n ((coeffMap R f m).hom a) ((coeffMap R g n).hom b) :=
  sorry

/-- **Layer 12, milestone 10: the projection formula,** with Layer 10's corestriction. -/
theorem cup_projection [CompactSpace G] [TotallyDisconnectedSpace G] (U : OpenSubgroup G)
    (hY : IsSmoothDiscrete R Y) (hZ : IsSmoothDiscrete R Z)
    (P : TopPairing X Y Z)
    (Pres : TopPairing ((TopRep.resFunctor U.toSubgroup.subtype).obj X)
      ((TopRep.resFunctor U.toSubgroup.subtype).obj Y)
      ((TopRep.resFunctor U.toSubgroup.subtype).obj Z))
    (hPres : Pres.bil = P.bil) (m n : ℕ)
    (a : (continuousCohomology R G m).obj X)
    (b : (continuousCohomology R U.toSubgroup n).obj
      ((TopRep.resFunctor U.toSubgroup.subtype).obj Y)) :
    (corestriction R U Z hZ (m + n)).hom
        (cup Pres m n ((res R U.toSubgroup X m).hom a) b) =
      cup P m n a ((corestriction R U Y hY n).hom b) :=
  sorry

/-- **Layer 12, the coefficient ring and the group live in independent universes.** The arithmetic
consumers of this interface pair a small ring, `ZMod n` in `Type 0`, with a Galois group in an
arbitrary universe, so `TopRep` keeps the two apart. This example records that the mixed
instantiation elaborates, so that a signature change tying them together again is caught here
rather than downstream. -/
noncomputable example (G' : Type u) [Group G'] [TopologicalSpace G'] [IsTopologicalGroup G']
    (X' Y' Z' : TopRep (ZMod 2) G') (P : TopPairing X' Y' Z') (m n : ℕ)
    (a : (continuousCohomology (ZMod 2) G' m).obj X')
    (b : (continuousCohomology (ZMod 2) G' n).obj Y') :
    (continuousCohomology (ZMod 2) G' (m + n)).obj Z' :=
  cup P m n a b

end GradedCup

section CupComparison

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M N P : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
  [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
  [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
  [AddCommGroup P] [TopologicalSpace P] [IsTopologicalAddGroup P]
  [DiscreteTopology P] [DistribMulAction G P] [ContinuousSMul G P]

/-- **Layer 12, the pairing of canonical objects induced by an equivariant pairing of discrete
modules.** Layer 1's dictionary carries the coefficients; this carries the pairing, so that the
agreement statement below has one pairing on each side and neither is arbitrary. -/
noncomputable def ofDiscreteModulePairing (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    TopPairing (ofDiscreteModule G M) (ofDiscreteModule G N) (ofDiscreteModule G P) :=
  sorry

/-- **Layer 8, the `(0,0)` cup product on the explicit model,** `m ⌣ n = μ m n`, which for
invariant `m` and `n` is invariant. The first of the six low-degree shapes; all six are named,
because the associativity instances of `README.md` Layer 8 use each of them and a family that
omits one cannot type its own statements. -/
noncomputable def explicitCup00 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H0 G M →+ H0 G N →+ H0 G P :=
  sorry

/-- **Layer 8, the `(0,1)` cup product on the explicit model,** `(m ⌣ b) g = μ m (b g)`. -/
noncomputable def explicitCup01 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H0 G M →+ H1 G N →+ H1 G P :=
  sorry

/-- **Layer 8, the `(1,0)` cup product on the explicit model,** `(a ⌣ n) g = μ (a g) (g • n)`. The
factor `g •` is what the associativity instance `(1,1,0)` needs on its right-hand side, and is why
this shape is not the `(0,1)` one read backwards. -/
noncomputable def explicitCup10 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H1 G M →+ H0 G N →+ H1 G P :=
  sorry

/-- **Layer 8, the `(0,2)` cup product on the explicit model,** `(m ⌣ b) (g, h) = μ m (b (g, h))`. -/
noncomputable def explicitCup02 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H0 G M →+ H2 G N →+ H2 G P :=
  sorry

/-- **Layer 8, the `(1,1)` cup product on the explicit model,** at class level: the descent of the
cochain formula `(a ⌣ b)(g, h) = μ (a g) (g • b h)` of `README.md` §3. -/
noncomputable def explicitCup11 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H1 G M →+ H1 G N →+ H2 G P :=
  sorry

/-- **Layer 8, the `(2,0)` cup product on the explicit model,**
`(a ⌣ n) (g, h) = μ (a (g, h)) ((g * h) • n)`. The last of the six shapes; no explicit cup goes
above total degree 2, and a product of total degree 3 belongs to Layer 12's all-bidegree
package. -/
noncomputable def explicitCup20 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H2 G M →+ H0 G N →+ H2 G P :=
  sorry

/-- **Layer 8, the low-degree projection formula.** Finite index is explicit because the left and
right sides both use the finite transversal sum; openness alone is not enough outside the compact
case. This `(0,1)` shape determines the normalization used by the other low-degree shapes. -/
theorem explicitCup_projection (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (μ : M →+ N →+ P) (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x)
    (a : H0 G M) (b : H1 U.toSubgroup N) :
    explicitCor1 G P U
        (explicitCup01 U.toSubgroup M N P μ hμ
          (fun g m x => hequiv (g : G) m x) (explicitRes0 G M U.toSubgroup a) b) =
      explicitCup01 G M N P μ hμ hequiv a (explicitCor1 G N U b) :=
  sorry

/-- **Layer 12, milestone 11: agreement with Layer 8's six explicit shapes** under Layer 3. The
`(1,1)` shape is stated; the other five have the same form. Both cup products are named, so the
statement is that these two agree and not that the canonical one agrees with something. -/
theorem explicitIso_cup [CompactSpace G] [TotallyDisconnectedSpace G] (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x)
    (x : DiscreteH1 G M) (y : DiscreteH1 G N) :
    cup (ofDiscreteModulePairing G M N P μ hμ hequiv) 1 1
        ((explicitH1IsoContinuousCohomology G M).hom.hom x)
        ((explicitH1IsoContinuousCohomology G N).hom.hom y) =
      (explicitH2IsoContinuousCohomology G P).hom.hom
        (explicitCup11 G M N P μ hμ hequiv (discreteH1Equiv G M x) (discreteH1Equiv G N y) :
          DiscreteH2 G P) :=
  sorry

end CupComparison

/-! ### Layer 13: the Evens norm -/

section GeneralEvens

variable (D : Type*) [Group D] (Q : Type*) [Group Q] (X : Type*) [MulAction Q X]

/-- **Layer 13, milestone 1: the permutation action of `Q` on `X → D`.** -/
noncomputable def wreathAut : Q →* MulAut (X → D) := sorry

/-- **Layer 13, milestone 1: the permutation wreath product `(X → D) ⋊ Q`.** Mathlib has only the
**regular** `RegularWreathProduct`, which is the case `X = Q`; the norm needs `Uˡ ⋊ 𝔖_l` for the
standard action of `𝔖_l` on `Fin l`. The base factor is `X → D` and the top factor is `Q`, which
the docstring says because sources disagree about the notation. -/
abbrev PermutationWreathProduct : Type _ := SemidirectProduct (X → D) Q (wreathAut D Q X)

/-- **Layer 13, milestone 2: the topology on the permutation wreath product.** The base factor
`X → D` carries the product topology and the top factor is discrete, since for the norm it is the
finite symmetric group. This is the topology the monomial homomorphism is continuous for, and it is
a definition rather than an instance because `PermutationWreathProduct` abbreviates
`SemidirectProduct`, on which no such global instance should be imposed. -/
@[reducible] def wreathTopology [TopologicalSpace D] :
    TopologicalSpace (PermutationWreathProduct D Q X) :=
  TopologicalSpace.induced (fun w => (w.left : X → D)) inferInstance ⊓
    TopologicalSpace.induced (fun w => (w.right : Q)) ⊥

end GeneralEvens

/-! ### Layer 13: the explicit index-2 graph cocycle

This block comes before the norm because the index-2 class **is** the class of the cochain built
here: `graphClass` below is defined from `evensGraphCochain`, not declared alongside it. -/

section IndexTwoCochains

variable {G : Type*} [Group G] (U : Subgroup G) (s : G) (α : U →* Multiplicative (ZMod 2))

open scoped Classical in
/-- **Layer 13, a degree-1 class of an open subgroup, extended by zero.** `α` is a genuine
continuous homomorphism on the subgroup, that is a trivial-action 1-cocycle of `U`; this is
its extension by zero to `G`, from which the Shapiro components are built. -/
noncomputable def evensExtend : G → ZMod 2 :=
  fun γ ↦ if h : γ ∈ U then Multiplicative.toAdd (α ⟨γ, h⟩) else 0

open scoped Classical in
/-- **Layer 13, the first Shapiro component** `b₁ γ = α γ` for `γ ∈ U` and `α (γ s)` otherwise.

It is a **cochain and not a cocycle**, so it has no class of its own. For `G = C₄ = ⟨σ⟩`,
`U = ⟨σ²⟩` of index two, `s = σ` and `α ≠ 0`, its values at `1, σ, σ², σ³` are `0, 1, 1, 0`, so
`b₁ (σ * σ) = 1` while `b₁ σ + b₁ σ = 0` and `b₁` is not a homomorphism. Only the sum
`b₁ + b_s` is a cocycle, which is why only that sum is given a class below. -/
noncomputable def evensB1 : G → ZMod 2 :=
  fun γ ↦ if γ ∈ U then evensExtend U α γ else evensExtend U α (γ * s)

/-- **Layer 13, the second Shapiro component** `b_s γ = b₁ (s⁻¹ γ)`. A cochain, for the same
reason as `evensB1`. -/
noncomputable def evensBs : G → ZMod 2 :=
  fun γ ↦ evensB1 U s α (s⁻¹ * γ)

/-- **Layer 13, identity 3 at cochain level: the degree-1 corestriction cochain** `b₁ + b_s`, the
sum of the Shapiro components over the transversal `{1, s}`. The decomposition into the two
components is definitional here; that the sum is a cocycle, and that its class is Layer 10's
corestriction, are the two theorems below. -/
noncomputable def evensCorCochain : G → ZMod 2 :=
  fun γ ↦ evensB1 U s α γ + evensBs U s α γ

open scoped Classical in
/-- **Layer 13, the two-point graph 2-cochain.** With `(G : U) = 2` and `s ∉ U`,

`ν (γ, η) = b₁ γ * b_s η` if `γ ∈ U`, and `b₁ γ * b₁ η + b₁ η * b_s η` otherwise.

Its class is the index-2 Evens norm `N^{Ev}(α) ∈ H²(G, 𝔽₂)`. The definition is given here
rather than passed as an arbitrary function with side conditions, so that the statements
below are about this cochain and not about anything satisfying its equations. -/
noncomputable def evensGraphCochain : G × G → ZMod 2 :=
  fun q ↦ if q.1 ∈ U then evensB1 U s α q.1 * evensBs U s α q.2
    else evensB1 U s α q.1 * evensB1 U s α q.2 + evensB1 U s α q.2 * evensBs U s α q.2

end IndexTwoCochains

section IndexTwoCochainProperties

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (U : OpenSubgroup G) (s : G) (α : U.toSubgroup →* Multiplicative (ZMod 2))

/-- **Layer 13, the corestriction cochain is a continuous 1-cocycle.** With trivial coefficients a
1-cocycle is a homomorphism, and the index-two and `s ∉ U` hypotheses are both used: the two
expansion cross terms recombine only there. Neither `evensB1` nor `evensBs` satisfies this, which
is why identity 3 below is stated for the sum and not for the two components separately. -/
theorem evensCorCochain_isCocycle (hU : U.toSubgroup.index = 2) (hs : s ∉ U)
    (hα : Continuous α) :
    Continuous (evensCorCochain U.toSubgroup s α) ∧
      ∀ g h : G, evensCorCochain U.toSubgroup s α (g * h) =
        evensCorCochain U.toSubgroup s α g + evensCorCochain U.toSubgroup s α h :=
  sorry

/-- **Layer 13, the graph cochain is a continuous 2-cocycle.** Continuity belongs in the
conclusion: an open subgroup is clopen, so the case split is continuous, and `α` is
continuous by hypothesis. The 2-cocycle identity is the trivial-action form of
`groupCohomology.IsCocycle₂`. -/
theorem evensGraphCochain_isCocycle (hU : U.toSubgroup.index = 2) (hs : s ∉ U)
    (hα : Continuous α) :
    Continuous (evensGraphCochain U.toSubgroup s α) ∧
      ∀ g h j : G,
        evensGraphCochain U.toSubgroup s α (g * h, j) +
            evensGraphCochain U.toSubgroup s α (g, h) =
          evensGraphCochain U.toSubgroup s α (h, j) +
            evensGraphCochain U.toSubgroup s α (g, h * j) :=
  sorry

/-- **Layer 13, acceptance check: the two Shapiro components are not cocycles, and their sum is.**
Evaluated at `(s, s)`: `b₁ (s * s) = α (s²)` and `b_s (s * s) = α (s²)`, while `b₁ s + b₁ s` and
`b_s s + b_s s` are both `0`, so neither component is a homomorphism as soon as `α (s²) ≠ 0`. The
sum passes the same test, which is why only the sum is given a class. The smallest instance is
`G = C₄ = ⟨σ⟩` with `U = ⟨σ²⟩`, `s = σ` and `α ≠ 0`, where the values of `b₁` at `1, σ, σ², σ³`
are `0, 1, 1, 0`. Giving `b₁` and `b_s` classes of their own is a type error dressed as a
statement, and this is the computation that catches it. -/
example (hU : U.toSubgroup.index = 2) (hs : s ∉ U) (hs2 : s * s ∈ U)
    (hα : Multiplicative.toAdd (α ⟨s * s, hs2⟩) ≠ 0) :
    evensB1 U.toSubgroup s α (s * s) ≠
        evensB1 U.toSubgroup s α s + evensB1 U.toSubgroup s α s ∧
      evensBs U.toSubgroup s α (s * s) ≠
        evensBs U.toSubgroup s α s + evensBs U.toSubgroup s α s ∧
      evensCorCochain U.toSubgroup s α (s * s) =
        evensCorCochain U.toSubgroup s α s + evensCorCochain U.toSubgroup s α s :=
  sorry

/-- **Layer 13, the class does not depend on the chosen `s`.** Two elements outside an
index-2 subgroup give graph cochains differing by an explicit continuous coboundary, so the
Evens norm is a well-defined map to `H²(G, 𝔽₂)`. -/
theorem evensGraphCochain_independent_of_rep (hU : U.toSubgroup.index = 2) (s' : G)
    (hs : s ∉ U) (hs' : s' ∉ U) (hα : Continuous α) :
    ∃ ψ : G → ZMod 2, Continuous ψ ∧ ∀ g h : G,
      evensGraphCochain U.toSubgroup s' α (g, h) - evensGraphCochain U.toSubgroup s α (g, h) =
        ψ h - ψ (g * h) + ψ g :=
  sorry

end IndexTwoCochainProperties

section EvensNorm

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 13, the coefficient object.** `𝔽₂` with trivial action, as an object of the category
the all-degree carrier eats. The general norm is stated against this, not against Layer 2's
low-degree abbreviations, because its degree is not bounded by 2.

The carrier is `ULift (ZMod 2)`, not `ZMod 2`, so that the object exists over a group in any
universe. The canonical resolution builds its terms from `C(G, -)`, so the coefficient module of
`TopRep R G` lives at least in the universe of `G`, and a `Type 0` carrier would pin every
consumer of the Evens norm to a `Type 0` group. The explicit cochain formulas below stay valued in
`ZMod 2` itself; `inhomogeneousCochain1` and `inhomogeneousCochain2` are where they enter the
complex, and they are the only place the lift is crossed. -/
noncomputable def trivialF2 : TopRep ℤ G :=
  TopRep.of (ContRepresentation.trivial ℤ G (ULift.{u} (ZMod 2)))

/-- **Layer 13, restriction preserves the trivial `𝔽₂` object.** Mathlib's representation
objects remember how their actions were constructed, so restriction of the ambient trivial object
and the trivial object constructed directly on the subgroup are canonically isomorphic rather than
definitionally equal. -/
noncomputable def trivialF2Res (S : Subgroup G) :
    (TopRep.resFunctor S.subtype).obj (trivialF2 G) ≅ trivialF2 S where
  hom := TopRep.ofHom <| (ContRepresentation.Equiv.mk
    (ContinuousLinearEquiv.refl ℤ (ULift.{u} (ZMod 2))) (by
      intro s
      ext x
      rfl)).toContIntertwiningMap
  inv := TopRep.ofHom <| (ContRepresentation.Equiv.mk
    (ContinuousLinearEquiv.refl ℤ (ULift.{u} (ZMod 2))) (by
      intro s
      ext x
      rfl)).toContIntertwiningMap
  hom_inv_id := by ext x; rfl
  inv_hom_id := by ext x; rfl

/-- **Layer 13, restriction on cohomology with trivial `𝔽₂` coefficients.** This is the
generic restriction followed by the canonical coefficient identification `trivialF2Res`. -/
noncomputable def trivialF2ResMap (S : Subgroup G) (n : ℕ) :
    (continuousCohomology ℤ G n).obj (trivialF2 G) ⟶
      (continuousCohomology ℤ S n).obj (trivialF2 S) :=
  res ℤ S (trivialF2 G) n ≫
    (continuousCohomology ℤ S n).map (trivialF2Res G S).hom

/-- **Layer 13, the trivial `𝔽₂` object is smooth discrete.** `ZMod 2` is discrete and the action is
trivial, so every stabilizer is all of `G`. Layer 10's corestriction consumes this. -/
theorem trivialF2_isSmoothDiscrete : IsSmoothDiscrete ℤ (trivialF2 G) :=
  sorry

/-- **Layer 13, corestriction on cohomology with trivial `𝔽₂` coefficients.** The
canonical coefficient identification supplies the restricted coefficient object consumed by the
generic all-degree corestriction. -/
noncomputable def trivialF2Corestriction (U : OpenSubgroup G) (n : ℕ) :
    (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup) ⟶
      (continuousCohomology ℤ G n).obj (trivialF2 G) :=
  (continuousCohomology ℤ U.toSubgroup n).map (trivialF2Res G U.toSubgroup).inv ≫
    corestriction ℤ U (trivialF2 G) (trivialF2_isSmoothDiscrete G) n

/-- **Layer 13, restriction between open subgroups with trivial `𝔽₂` coefficients.** -/
noncomputable def trivialF2ResLe (V W : OpenSubgroup G) (hWV : W ≤ V) (n : ℕ) :
    (continuousCohomology ℤ V.toSubgroup n).obj (trivialF2 V.toSubgroup) ⟶
      (continuousCohomology ℤ W.toSubgroup n).obj (trivialF2 W.toSubgroup) :=
  (continuousCohomology ℤ V.toSubgroup n).map (trivialF2Res G V.toSubgroup).inv ≫
    resLe ℤ V W hWV (trivialF2 G) n ≫
      (continuousCohomology ℤ W.toSubgroup n).map (trivialF2Res G W.toSubgroup).hom

/-- **Layer 13, conjugation between open subgroups with trivial `𝔽₂` coefficients.** -/
noncomputable def trivialF2ConjMapOf (g : G) (W W' : OpenSubgroup G)
    (hconj : W' = conjOpenSubgroup g W) (n : ℕ) :
    (continuousCohomology ℤ W.toSubgroup n).obj (trivialF2 W.toSubgroup) ⟶
      (continuousCohomology ℤ W'.toSubgroup n).obj (trivialF2 W'.toSubgroup) :=
  (continuousCohomology ℤ W.toSubgroup n).map (trivialF2Res G W.toSubgroup).inv ≫
    conjMapOf ℤ g W W' hconj (trivialF2 G) n ≫
      (continuousCohomology ℤ W'.toSubgroup n).map (trivialF2Res G W'.toSubgroup).hom

/-- **Layer 3, an explicit inhomogeneous 1-cochain as an element of the canonical complex,** with
trivial `𝔽₂` coefficients. The formulas of this layer are functions `G → 𝔽₂` and `G × G → 𝔽₂`, and
this is how they enter the complex whose homology the canonical objects are. Without it an identity
relating an explicit formula to a class could only be stated about an arbitrary element of the
complex. -/
noncomputable def inhomogeneousCochain1 (f : G → ZMod 2) (hf : Continuous f) :
    ((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).X 1 :=
  sorry

/-- **Layer 3, the same in degree 2.** -/
noncomputable def inhomogeneousCochain2 (f : G × G → ZMod 2) (hf : Continuous f) :
    ((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).X 2 :=
  sorry

/-- **Layer 3, the inhomogeneous 1-cocycle condition is the canonical differential.** With trivial
coefficients a 1-cocycle is a homomorphism. -/
theorem inhomogeneousCochain1_d_eq_zero (f : G → ZMod 2) (hf : Continuous f)
    (hcocycle : ∀ g h : G, f (g * h) = f g + f h) :
    (((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).d 1 2).hom
      (inhomogeneousCochain1 G f hf) = 0 :=
  sorry

/-- **Layer 3, the inhomogeneous 2-cocycle condition is the canonical differential.** -/
theorem inhomogeneousCochain2_d_eq_zero (f : G × G → ZMod 2) (hf : Continuous f)
    (hcocycle : ∀ g h j : G, f (g * h, j) + f (g, h) = f (h, j) + f (g, h * j)) :
    (((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).d 2 3).hom
      (inhomogeneousCochain2 G f hf) = 0 :=
  sorry

variable {G}

/-- **Layer 13, a coset transversal of an open subgroup,** bundled with the property that makes it
one. The monomial homomorphism and the cochain norm consume this and not a bare function: for an
arbitrary `rep` the Schreier factors `t(x)⁻¹ γ t(γ⁻¹ x)` need not lie in `U`, so the wreath-product
target could not be built by the advertised formula. -/
structure CosetTransversal (U : OpenSubgroup G) where
  /-- the chosen representative of each coset -/
  rep : G ⧸ U.toSubgroup → G
  /-- it represents that coset -/
  mk_rep : ∀ x, QuotientGroup.mk (rep x) = x

/-- **Layer 13, milestone 2: the transversal-dependent monomial homomorphism** `Φ : G → Uˡ ⋊ 𝔖_l`
for `l = (G : U)`. The base component of `Φ γ` at a coset `x` is the Schreier factor
`t(γ⁻¹ x)⁻¹ γ⁻¹ t(x)`, which lies in `U` exactly because `t` is a transversal, and the top
component is the permutation `x ↦ γ⁻¹ x` of the coset space. -/
noncomputable def monomialHom (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t : CosetTransversal U) :
    G →* PermutationWreathProduct U.toSubgroup (Equiv.Perm (G ⧸ U.toSubgroup))
      (G ⧸ U.toSubgroup) :=
  sorry

/-- **Layer 13, milestone 2: the monomial homomorphism is continuous,** for the topology
`wreathTopology` fixes on the target. Openness of `U` is what makes the coset space discrete and
the Schreier factors locally constant. -/
theorem monomialHom_continuous (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t : CosetTransversal U) :
    @Continuous G _ _ (wreathTopology U.toSubgroup (Equiv.Perm (G ⧸ U.toSubgroup))
      (G ⧸ U.toSubgroup)) (monomialHom U t) :=
  sorry

/-- **Layer 13, milestone 3: the tensor-power coefficient object,** with the permutation action of
the symmetric group and the induced wreath-product action, as an object of the canonical
coefficient category. A bare `Type` would carry none of that structure and could not be fed to the
cohomology functor. -/
noncomputable def tensorInduction (U : OpenSubgroup G) (q : ℕ) (A : TopRep ℤ U.toSubgroup) :
    TopRep ℤ G :=
  sorry

/-- **Layer 13, milestone 3: tensor induction is a functor.** -/
noncomputable def tensorInductionFunctor (U : OpenSubgroup G) (q : ℕ) :
    TopRep ℤ U.toSubgroup ⥤ TopRep ℤ G :=
  sorry

/-- **Layer 13, milestone 3: the functor agrees with the object construction.** -/
theorem tensorInductionFunctor_obj (U : OpenSubgroup G) (q : ℕ) (A : TopRep ℤ U.toSubgroup) :
    (tensorInductionFunctor U q).obj A = tensorInduction U q A :=
  sorry

/-- **Layer 13, milestone 3: tensor induction of the trivial `𝔽₂` object is the trivial `𝔽₂`
object.** The `l`-fold tensor power of `𝔽₂` is `𝔽₂`, and in characteristic two the permutation
action of `𝔖_l` on it is trivial. This is the coefficient equivalence through which the norm lands
in `H^*(G, 𝔽₂)`; without it the cochain norm has tensor-induced coefficients and there is nothing
tying it to the public target. -/
noncomputable def tensorInductionTrivialF2 (U : OpenSubgroup G) (q : ℕ) :
    tensorInduction U q (trivialF2 U.toSubgroup) ≅ trivialF2 G :=
  sorry

/-- **Layer 13, milestone 4: the norm at cochain level, before the coefficient equivalence.** This
is the map produced by `monomialHom` and `tensorInduction`: it is where the degree formula
`q ↦ l * q` comes from, and its coefficients are the tensor-induced ones. -/
noncomputable def evensNormCochainRaw (U : OpenSubgroup G) (q : ℕ) (t : CosetTransversal U) :
    ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
        (trivialF2 U.toSubgroup)).X q →
      ((homogeneousCochainsFunctor ℤ G).obj
        (tensorInduction U q (trivialF2 U.toSubgroup))).X (U.toSubgroup.index * q) :=
  sorry

/-- **Layer 13, milestone 4: the norm at cochain level,** with the degree formula `q ↦ l * q`.
This is the map the public function descends from. -/
noncomputable def evensNormCochain (U : OpenSubgroup G) (q : ℕ) (t : CosetTransversal U) :
    ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
        (trivialF2 U.toSubgroup)).X q →
      ((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).X
        (U.toSubgroup.index * q) :=
  sorry

/-- **Layer 13, milestone 4: the cochain norm is the raw norm followed by the coefficient
equivalence.** This is what ties `monomialHom` and `tensorInduction` to the public construction;
without it they are declared and never used. -/
theorem evensNormCochain_eq (U : OpenSubgroup G) (q : ℕ) (t : CosetTransversal U)
    (a : ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).X q) :
    evensNormCochain U q t a =
      (((homogeneousCochainsFunctor ℤ G).map
          (tensorInductionTrivialF2 U q).hom).f (U.toSubgroup.index * q)).hom
        (evensNormCochainRaw U q t a) :=
  sorry

/-- **Layer 13, milestone 5: the cochain norm sends cocycles to cocycles.** Without it the public
norm has no source of classes, and the degree `l * q` is not the degree of anything. -/
theorem evensNormCochain_mem_cycles (U : OpenSubgroup G) (q : ℕ) (t : CosetTransversal U)
    (a : ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).X q)
    (ha : (((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).d q (q + 1)).hom a = 0) :
    (((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).d
        (U.toSubgroup.index * q) (U.toSubgroup.index * q + 1)).hom
      (evensNormCochain U q t a) = 0 :=
  sorry

/-- **Layer 13, milestone 5: equivalent representatives give the same class.** Cohomologous source
cocycles have cohomologous norm cocycles. The norm is not additive, so this does not follow from
additivity and has to be its own milestone. -/
theorem evensNormCochain_representative_independent (U : OpenSubgroup G) (q : ℕ)
    (t : CosetTransversal U) (j : ℕ) (hj : j + 1 = q) (k : ℕ)
    (hk : k + 1 = U.toSubgroup.index * q)
    (a b : ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).X q)
    (ha : (((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).d q (q + 1)).hom a = 0)
    (hb : (((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).d q (q + 1)).hom b = 0)
    (c : ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).X j)
    (hc : a - b = cochainDegreeCast hj (trivialF2 U.toSubgroup)
      ((((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
        (trivialF2 U.toSubgroup)).d j (j + 1)).hom c)) :
    ∃ e : ((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).X k,
      evensNormCochain U q t a - evensNormCochain U q t b =
        cochainDegreeCast hk (trivialF2 G)
          ((((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).d k (k + 1)).hom
            e) :=
  sorry

/-- **Layer 13, milestone 7: the public norm.** A **function**, not an additive homomorphism and
not a categorical morphism: its failure of additivity is identity 2. The degree multiplies by the
index, which is the defining type-level feature of the construction. -/
noncomputable def evensNorm (U : OpenSubgroup G) (q : ℕ) :
    ((continuousCohomology ℤ U.toSubgroup q).obj (trivialF2 U.toSubgroup)) →
      ((continuousCohomology ℤ G (U.toSubgroup.index * q)).obj (trivialF2 G)) :=
  sorry

/-- **Layer 13, milestone 7: the public norm is the class of the norm cochain.** This is what makes
`evensNorm` the descent of `evensNormCochain` rather than an unrelated function of the same type.
Together with the two milestone-5 theorems and transversal independence it is what makes the
descent well defined. -/
theorem evensNorm_eq_class (U : OpenSubgroup G) (q : ℕ) (t : CosetTransversal U)
    (a : ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).X q)
    (ha : (((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).d q (q + 1)).hom a = 0) :
    evensNorm U q (cochainClass ℤ (trivialF2 U.toSubgroup) q a ha) =
      cochainClass ℤ (trivialF2 G) (U.toSubgroup.index * q) (evensNormCochain U q t a)
        (evensNormCochain_mem_cycles U q t a ha) :=
  sorry

/-- **Layer 13, the index-2 degree-1 specialization,** the case the sibling roadmap consumes. It
is a named specialization of the general norm, not the general definition. -/
noncomputable def evensNormIndexTwo (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2) :
    ((continuousCohomology ℤ U.toSubgroup 1).obj (trivialF2 U.toSubgroup)) →
      ((continuousCohomology ℤ G 2).obj (trivialF2 G)) :=
  sorry

/-- **Layer 13, milestone 10: the specialization is the general norm.** -/
theorem evensNormIndexTwo_eq (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2)
    (x : (continuousCohomology ℤ U.toSubgroup 1).obj (trivialF2 U.toSubgroup)) :
    evensNormIndexTwo U hU x =
      degreeCast (by rw [hU]) (trivialF2 G) (evensNorm U 1 x) :=
  sorry

/-- **Layer 13, the coefficient pairing on `𝔽₂`,** multiplication with the trivial action. The
identities below name it: an arbitrary pairing of the trivial object with itself is a different
input, and the statements are false for it. -/
noncomputable def f2Pairing (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TopPairing (trivialF2 G) (trivialF2 G) (trivialF2 G) :=
  sorry

/-- **Layer 13, the image of an open subgroup in a quotient,** `U ⧸ N` as an open subgroup of
`G ⧸ N`, for closed normal `N ≤ U`. The inflation compatibility of the norm is a statement about
these two groups, so the subgroup has to be named before it can be stated. -/
def quotientOpenSubgroup (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    (U : OpenSubgroup G) (hNU : N ≤ U) :
    OpenSubgroup (G ⧸ N) where
  toSubgroup := U.toSubgroup.map (QuotientGroup.mk' N)
  isOpen' := sorry

/-- **Layer 13, the index is unchanged by passing to the quotient,** for `N ≤ U`. Without it the
two sides of the inflation compatibility below sit in different degrees. -/
theorem quotientOpenSubgroup_index (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    (U : OpenSubgroup G) (hNU : N ≤ U) :
    (quotientOpenSubgroup N hN U hNU).toSubgroup.index = U.toSubgroup.index :=
  sorry

/-- **Layer 13, the invariants of the trivial `𝔽₂` object are the trivial `𝔽₂` object.** -/
noncomputable def trivialF2Quotient (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    [IsTopologicalGroup (G ⧸ N)] :
    trivialF2 (G ⧸ N) ≅ quotientToInvariants ℤ N (trivialF2 G) :=
  sorry

/-- **Layer 13, inflation on trivial `𝔽₂` coefficients,** Layer 1's inflation composed with the
identification of the invariants of the trivial object. -/
noncomputable def trivialF2Infl (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    [IsTopologicalGroup (G ⧸ N)] (n : ℕ) :
    (continuousCohomology ℤ (G ⧸ N) n).obj (trivialF2 (G ⧸ N)) ⟶
      (continuousCohomology ℤ G n).obj (trivialF2 G) :=
  (continuousCohomology ℤ (G ⧸ N) n).map (trivialF2Quotient N hN).hom ≫ infl ℤ N (trivialF2 G) n

/-- **Layer 13, inflation from `U ⧸ N` to `U` on trivial `𝔽₂` coefficients,** where `U ⧸ N` is the
open subgroup `quotientOpenSubgroup N hN U hNU` of `G ⧸ N`. -/
noncomputable def trivialF2InflSub (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    (U : OpenSubgroup G) (hNU : N ≤ U) [IsTopologicalGroup (G ⧸ N)] (n : ℕ) :
    (continuousCohomology ℤ (quotientOpenSubgroup N hN U hNU).toSubgroup n).obj
        (trivialF2 (quotientOpenSubgroup N hN U hNU).toSubgroup) ⟶
      (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup) :=
  sorry

variable (U : OpenSubgroup G) (q : ℕ)

/-- **Layer 13, the norm between two open subgroups,** `N_V^U` for open `V ≤ U ≤ G`, with the
degree multiplied by the relative index. Transitivity below is a statement about this map. -/
noncomputable def evensNormLe (V : OpenSubgroup G) (hVU : V ≤ U) :
    ((continuousCohomology ℤ V.toSubgroup q).obj (trivialF2 V.toSubgroup)) →
      ((continuousCohomology ℤ U.toSubgroup
        (V.toSubgroup.relIndex U.toSubgroup * q)).obj (trivialF2 U.toSubgroup)) :=
  sorry

/-- **Layer 13, milestone 6: independence of the transversal,** at cochain level, where the
dependence lives: for a **cocycle** the two cochains differ by a coboundary of the canonical
complex. The cocycle hypothesis is not removable. For a general cochain the difference is a
coboundary only up to a further term in the source differential, so the unconditional statement is
a different and stronger claim; that stronger form is the cochain homotopy, and it is not what the
public norm needs. -/
theorem evensNormCochain_transversal_independent (t t' : CosetTransversal U) (j : ℕ)
    (hj : j + 1 = U.toSubgroup.index * q)
    (a : ((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).X q)
    (ha : (((homogeneousCochainsFunctor ℤ U.toSubgroup).obj
      (trivialF2 U.toSubgroup)).d q (q + 1)).hom a = 0) :
    ∃ c : ((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).X j,
      evensNormCochain U q t a - evensNormCochain U q t' a =
        cochainDegreeCast hj (trivialF2 G)
          ((((homogeneousCochainsFunctor ℤ G).obj (trivialF2 G)).d j (j + 1)).hom
            c) :=
  sorry

/-- **Layer 13, milestone 8: multiplicativity,** for the `𝔽₂` pairing on both sides. -/
theorem evensNorm_mul (q' : ℕ)
    (x : (continuousCohomology ℤ U.toSubgroup q).obj (trivialF2 U.toSubgroup))
    (y : (continuousCohomology ℤ U.toSubgroup q').obj (trivialF2 U.toSubgroup)) :
    evensNorm U (q + q') (cup (f2Pairing U.toSubgroup) q q' x y) =
      degreeCast (by ring) (trivialF2 G)
        (cup (f2Pairing G) (U.toSubgroup.index * q) (U.toSubgroup.index * q')
          (evensNorm U q x) (evensNorm U q' y)) :=
  sorry

/-- **Layer 13, milestone 8: transitivity,** `N_V^G = N_U^G ∘ N_V^U` for open `V ≤ U ≤ G`. The
degree hypothesis is `Subgroup.relindex_mul_index`, restated here so that the two sides are
comparable without a rewrite inside the statement. -/
theorem evensNorm_trans (V : OpenSubgroup G) (hVU : V ≤ U)
    (hdeg : U.toSubgroup.index * (V.toSubgroup.relIndex U.toSubgroup * q) =
      V.toSubgroup.index * q)
    (x : (continuousCohomology ℤ V.toSubgroup q).obj (trivialF2 V.toSubgroup)) :
    evensNorm V q x =
      degreeCast hdeg (trivialF2 G)
        (evensNorm U (V.toSubgroup.relIndex U.toSubgroup * q) (evensNormLe U q V hVU x)) :=
  sorry

/-- **Layer 13, the iterated cup product of a family of classes,** with the degrees adding. The
double-coset formula is a **product** over double cosets, not a sum, because the norm is
multiplicative, so the product has to be named before the formula can be stated. The family is
indexed by an unordered type, which is legitimate here because over `𝔽₂` the sign in graded
commutativity is `1`. -/
noncomputable def cupFamily (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {ι : Type*} [Fintype ι] (d : ι → ℕ)
    (x : ∀ i, (continuousCohomology ℤ G (d i)).obj (trivialF2 G)) :
    (continuousCohomology ℤ G (∑ i, d i)).obj (trivialF2 G) :=
  sorry

/-- **Layer 13, milestone 8: one factor of the restriction and double-coset formula,**
`N^V_{V ⊓ gUg⁻¹} ∘ (g)_* ∘ res^U_{U ⊓ g⁻¹Vg}`, the multiplicative analogue of `mackeyTerm`. -/
noncomputable def evensDoubleCosetFactor (V : OpenSubgroup G) (g : G) :
    ((continuousCohomology ℤ U.toSubgroup q).obj (trivialF2 U.toSubgroup)) →
      ((continuousCohomology ℤ V.toSubgroup
        ((V ⊓ conjOpenSubgroup g U).toSubgroup.relIndex V.toSubgroup * q)).obj
          (trivialF2 V.toSubgroup)) :=
  fun x =>
    evensNormLe V q (V ⊓ conjOpenSubgroup g U) inf_le_left
      ((trivialF2ConjMapOf G g (U ⊓ conjOpenSubgroup g⁻¹ V)
          (V ⊓ conjOpenSubgroup g U) (conjOpenSubgroup_inf g U V) q).hom
        ((trivialF2ResLe G U (U ⊓ conjOpenSubgroup g⁻¹ V) inf_le_left q).hom x))

/-- **Layer 13, milestone 8: the restriction and double-coset formula** (Evens §6 Prop. 3). The
restriction of a norm is the cup product of the norms over the double cosets. The degree hypothesis
is the double-coset index identity `∑ [V : V ⊓ gUg⁻¹] = [G : U]`, restated so that the two sides
are comparable without a rewrite inside the statement. -/
theorem evensNorm_res_doubleCoset (V : OpenSubgroup G)
    (ι : Type*) [Fintype ι] (g : ι → G)
    (hdc : ∀ x : G, ∃! i : ι, ∃ v ∈ V, ∃ u ∈ U, x = v * g i * u)
    (hdeg : ∑ i : ι, (V ⊓ conjOpenSubgroup (g i) U).toSubgroup.relIndex V.toSubgroup * q =
      U.toSubgroup.index * q)
    (x : (continuousCohomology ℤ U.toSubgroup q).obj (trivialF2 U.toSubgroup)) :
    (trivialF2ResMap G V.toSubgroup (U.toSubgroup.index * q)).hom (evensNorm U q x) =
      degreeCast hdeg (trivialF2 V.toSubgroup)
        (cupFamily V.toSubgroup
          (fun i => (V ⊓ conjOpenSubgroup (g i) U).toSubgroup.relIndex V.toSubgroup * q)
          (fun i => evensDoubleCosetFactor U q V (g i) x)) :=
  sorry

/-- **Layer 13, milestone 8: inflation compatibility,** for closed normal `N ≤ U`. Both inflations
are Layer 1's, and the degrees match because the index is unchanged in the quotient. -/
theorem evensNorm_infl (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G)) (hNU : N ≤ U)
    [IsTopologicalGroup (G ⧸ N)] [CompactSpace (G ⧸ N)] [TotallyDisconnectedSpace (G ⧸ N)]
    (x : (continuousCohomology ℤ (quotientOpenSubgroup N hN U hNU).toSubgroup q).obj
      (trivialF2 (quotientOpenSubgroup N hN U hNU).toSubgroup)) :
    evensNorm U q (trivialF2InflSub N hN U hNU q x) =
      trivialF2Infl N hN (U.toSubgroup.index * q)
        (degreeCast (by rw [quotientOpenSubgroup_index]) (trivialF2 (G ⧸ N))
          (evensNorm (quotientOpenSubgroup N hN U hNU) q x)) :=
  sorry

/-! The four identities the Quadratic Form Invariants roadmap consumes, as equations of classes.
Identity 2 is the polarization, and its right-hand side is the corestriction of the cup with the
**conjugate** class; a formula without the conjugate is a different statement. -/

/-- **Layer 13, an index-two open subgroup is its own conjugate.** Index two forces normality
(`Subgroup.normal_of_index_eq_two`), so conjugation by any element of `G` carries `U` to itself.
It is named because `evensConj_eq_conjMapOf` has to feed it to `conjMapOf`. -/
theorem conjOpenSubgroup_eq_of_index_two (hU : U.toSubgroup.index = 2) (g : G) :
    conjOpenSubgroup g U = U :=
  sorry

/-- **Layer 13, the conjugation action on `Hⁿ(U, 𝔽₂)` at index two,** the map written `α ↦ s · α`
in the identities below. It is defined **without choosing** an element outside `U`, as
`res ∘ cor - id`: at index two `res ∘ cor` is `1 + s` for either element of the nontrivial coset,
so the difference is the conjugation and depends on `U` alone. That is what makes the identities
below statements about `U` rather than about a chosen representative;
`evensConj_eq_conjMapOf` is the theorem that identifies it with conjugation by any `s ∉ U`. The
index-two hypothesis is carried in the type and used by no line of the body, since it is what makes
the formula a conjugation rather than what makes it well typed. -/
noncomputable def evensConj (_hU : U.toSubgroup.index = 2) (n : ℕ)
    (x : (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup)) :
    (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup) :=
  -- The named trivial-coefficient wrappers transport through `trivialF2Res`, so both terms of the
  -- subtraction live at the coefficient object constructed directly on `U`.
  let y : (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup) :=
    (trivialF2ResMap G U.toSubgroup n).hom
      ((trivialF2Corestriction G U n).hom x)
  y - x

/-- **Layer 13, the conjugate is conjugation by any element outside `U`.** Layer 10's `conjMapOf`
is conjugation by a named element; this says that `evensConj` agrees with it for **every** `s ∉ U`,
which is why no identity below has to name one. -/
theorem evensConj_eq_conjMapOf (hU : U.toSubgroup.index = 2) (s : G) (hs : s ∉ U) (n : ℕ)
    (x : (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup)) :
    evensConj U hU n x =
      (trivialF2ConjMapOf G s U U (conjOpenSubgroup_eq_of_index_two U hU s).symm n).hom x :=
  sorry

/-- **Layer 13, `res ∘ cor` at index two is `1 + conj`.** It holds by the definition of
`evensConj`, and it is named because that is the form later proofs apply. -/
theorem res_corestriction_eq_add_evensConj (hU : U.toSubgroup.index = 2) (n : ℕ)
    (x : (continuousCohomology ℤ U.toSubgroup n).obj (trivialF2 U.toSubgroup)) :
    (trivialF2ResMap G U.toSubgroup n).hom
        ((trivialF2Corestriction G U n).hom x) =
      x + evensConj U hU n x := by
  dsimp only [evensConj]
  rw [add_comm x, sub_add_cancel]

/-- **Layer 13, the class of a continuous trivial-action 1-cocycle.** With trivial `𝔽₂`
coefficients `H¹` is the group of continuous homomorphisms, so a continuous `α` has a class; the
identities below are stated for classes and the cochain constructions for representatives, and this
is the map between the two. -/
noncomputable def homClass (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (α : H →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    (continuousCohomology ℤ H 1).obj (trivialF2 H) :=
  sorry

/-- **Layer 13, the class of the graph cocycle,** the explicit index-2 degree-1 norm. It is
choice-free: `evensGraphCochain_independent_of_rep` says that two elements outside `U` give graph
cochains differing by a coboundary, so the class depends on `U` and `α` alone.
`graphClass_eq_cochainClass` is what ties it to `evensGraphCochain`, and it does so at **every**
`s ∉ U` rather than at a chosen one. -/
noncomputable def graphClass (hU : U.toSubgroup.index = 2)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    (continuousCohomology ℤ G 2).obj (trivialF2 G) :=
  sorry

/-- **Layer 13, the graph class is the class of the graph cochain,** at every element outside `U`.
Without this `graphClass` would be an unconstrained map that the milestone-10 identification could
be satisfied by trivially, and quantifying over `s` is what makes it choice-free. -/
theorem graphClass_eq_cochainClass (hU : U.toSubgroup.index = 2) (s : G) (hs : s ∉ U)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    graphClass U hU α hα =
      cochainClass ℤ (trivialF2 G) 2
        (inhomogeneousCochain2 G (evensGraphCochain U.toSubgroup s α)
          (evensGraphCochain_isCocycle U s α hU hs hα).1)
        (inhomogeneousCochain2_d_eq_zero G _ _
          (evensGraphCochain_isCocycle U s α hU hs hα).2) :=
  sorry

/-- **Layer 13, the graph class descends to `H¹(U, 𝔽₂)`.** Continuous homomorphisms with the same
class give the same graph class, which is what makes `graphClass` a map out of cohomology. -/
theorem graphClass_representative_independent (hU : U.toSubgroup.index = 2)
    (α β : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) (hβ : Continuous β)
    (hcl : homClass U.toSubgroup α hα = homClass U.toSubgroup β hβ) :
    graphClass U hU α hα = graphClass U hU β hβ :=
  sorry

/-- **Layer 13, identity 1: `res_U N^{Ev}(α) = α ⌣ (s · α)`,** the conjugate being the choice-free
`evensConj`. -/
theorem evensNorm_res (hU : U.toSubgroup.index = 2)
    (α : (continuousCohomology ℤ U.toSubgroup 1).obj (trivialF2 U.toSubgroup)) :
    (trivialF2ResMap G U.toSubgroup 2).hom (evensNormIndexTwo U hU α) =
      cup (f2Pairing U.toSubgroup) 1 1 α (evensConj U hU 1 α) :=
  sorry

/-- **Layer 13, identity 2: the polarization.** Both variables appear, and the right-hand side
carries the **conjugate** class; a formula without the conjugate is a different statement. -/
theorem evensNorm_polarization (hU : U.toSubgroup.index = 2)
    (α β : (continuousCohomology ℤ U.toSubgroup 1).obj (trivialF2 U.toSubgroup)) :
    evensNormIndexTwo U hU (α + β) - evensNormIndexTwo U hU α - evensNormIndexTwo U hU β =
      (trivialF2Corestriction G U 2).hom
        (cup (f2Pairing U.toSubgroup) 1 1 α (evensConj U hU 1 β)) :=
  sorry

/-- **Layer 13, identity 3: `cor¹ α = b₁ + b_s`** at the transversal `{1, s}`, as an equation of
**classes on the left and cochains on the right**. `b₁` and `b_s` are not cocycles, so neither has
a class of its own and the identity cannot be stated as a sum of two classes; what is true is that
their sum is a cocycle whose class is the corestriction. The element `s` is carried here and not in
the class-level identities above, because it is the cochain formula that depends on it. -/
theorem evensNorm_cor_shapiro (hU : U.toSubgroup.index = 2) (s : G) (hs : s ∉ U)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    (trivialF2Corestriction G U 1).hom
        (homClass U.toSubgroup α hα) =
      cochainClass ℤ (trivialF2 G) 1
        (inhomogeneousCochain1 G (evensCorCochain U.toSubgroup s α)
          (evensCorCochain_isCocycle U s α hU hs hα).1)
        (inhomogeneousCochain1_d_eq_zero G _ _
          (evensCorCochain_isCocycle U s α hU hs hα).2) :=
  sorry

/-- **Layer 13, identity 4: compatibility with inflation,** for closed normal `N ≤ U`. -/
theorem evensNorm_identity_infl (hU : U.toSubgroup.index = 2) (N : Subgroup G) [N.Normal]
    (hN : IsClosed (N : Set G)) (hNU : N ≤ U)
    [IsTopologicalGroup (G ⧸ N)] [CompactSpace (G ⧸ N)] [TotallyDisconnectedSpace (G ⧸ N)]
    (hUN : (quotientOpenSubgroup N hN U hNU).toSubgroup.index = 2)
    (α : (continuousCohomology ℤ (quotientOpenSubgroup N hN U hNU).toSubgroup 1).obj
      (trivialF2 (quotientOpenSubgroup N hN U hNU).toSubgroup)) :
    evensNormIndexTwo U hU (trivialF2InflSub N hN U hNU 1 α) =
      trivialF2Infl N hN 2 (evensNormIndexTwo (quotientOpenSubgroup N hN U hNU) hUN α) :=
  sorry

/-- **Layer 13, milestone 10: at index 2 and degree 1 the general norm is the class of the graph
cocycle.** The identification that makes the graph cocycle a standard construction rather than an
ad hoc formula. `graphClass` is the quotient class of `evensGraphCochain`, so this compares the
general construction with the explicit one and not with an unconstrained map. -/
theorem evensNorm_eq_graphClass (hU : U.toSubgroup.index = 2)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    evensNormIndexTwo U hU (homClass U.toSubgroup α hα) = graphClass U hU α hα :=
  sorry

end EvensNorm

/-- **Layer 13, the `C₈` anchor.** A class of `H²(C₄, 𝔽₂)` with trivial coefficients
classifies a **central** extension of `C₄` by `C₂`. Since the quotient is cyclic the
extension is abelian (Mathlib's `commutative_of_cyclic_center_quotient`), so it is `C₈` or
`C₂ × C₄` and no nonabelian group of order 8 can occur. The two are told apart by a lift `x`
of a generator: `x ^ 4` always lies in the kernel, and it is the nontrivial kernel element
exactly when `x` has order 8, that is exactly when the class is nonzero. For `G = C₄` and
`U = C₂` the Evens norm of a nonzero `α` restricts to the nonzero square on `U`, so the class
is nonzero and the extension is `C₈`. This fixes the sign and normalization conventions of
the graph cocycle. -/
example {E : Type*} [Group E] (π : E →* Multiplicative (ZMod 4))
    (hπ : Function.Surjective π) (hker : π.ker ≤ Subgroup.center E)
    (hcard : Nat.card π.ker = 2) (x : E) (hx : π x = Multiplicative.ofAdd 1) :
    (∀ a b : E, a * b = b * a) ∧ x ^ 4 ∈ π.ker ∧ (orderOf x = 8 ↔ x ^ 4 ≠ 1) :=
  sorry

/-! ### Layers 9 and 13: the field-extension bridge

Restriction, corestriction and the Evens norm are indexed by a **subgroup** of the ambient group. A
finite separable extension `L/K` supplies one only after a `K`-embedding of `L` into `Kˢ` is
chosen, and the cohomology of that subgroup then has to be carried to the cohomology of `G_L`,
which is the group a consumer names. Both steps belong here: a consumer that built them would be
building restriction, corestriction and the norm a second time, and nothing would say that its
copies agreed with these. Independence of the embedding is a theorem here too, so that no statement
downstream mentions a chosen one.

The coefficients are the trivial `𝔽₂` object throughout, since that is where the Evens norm lives.
Restriction and corestriction at other coefficients are Layer 1's `res` and Layer 10's
`corestriction` at `galoisSubgroup`, together with whatever coefficient comparison the consumer's
own modules need; the bridge fixes the group half once. -/

section FieldExtension

open CategoryTheory

variable (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]

-- Every declaration below carries `[FiniteDimensional K L]` and `[Algebra.IsSeparable K L]`
-- itself rather than taking them from the section. They occur in none of the statements, so a
-- `sorry`-bodied declaration would silently drop them, and `galoisSubgroup` would then claim to
-- cut out an *open* subgroup for an infinite extension, which is false.

/-- **Layer 9, the open subgroup `G_L ≤ G_K` cut out by a `K`-embedding of `L` into `Kˢ`.** The
embedding is genuine data: without one there is no homomorphism between the two Galois groups at
all, so a statement about an arbitrary subgroup of `G_K` is a different statement. Openness is
finiteness of the degree. -/
noncomputable def galoisSubgroup [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) :
    OpenSubgroup (AbsoluteGaloisGroup K) :=
  sorry

/-- **Layer 9, the index is the degree.** This is what discharges the index hypotheses the
subgroup-indexed operations carry, and in particular the index-two hypothesis of
`evensNormIndexTwo`. -/
theorem galoisSubgroup_index [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) :
    (galoisSubgroup K L σ).toSubgroup.index = Module.finrank K L :=
  sorry

/-- **Layer 9, that subgroup is the absolute Galois group of `L`,** as topological groups.
Continuous cohomology depends on the topology and not only on the underlying group, so the
comparison is a `ContinuousMulEquiv` and a bare `MulEquiv` would not support the transport
below. -/
noncomputable def galoisSubgroupEquiv [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) :
    AbsoluteGaloisGroup L ≃ₜ* ↥(galoisSubgroup K L σ).toSubgroup :=
  sorry

/-- **Layer 9, the `𝔽₂`-cohomology transport.** Layer 1's `map` for the compatible pair consisting
of `galoisSubgroupEquiv` and the identity of `𝔽₂`, with `map_id` and `map_comp` making it an
isomorphism. Every statement below is phrased on the `G_L` side. -/
noncomputable def galoisF2Iso [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    (continuousCohomology ℤ ↥(galoisSubgroup K L σ).toSubgroup n).obj
        (trivialF2 ↥(galoisSubgroup K L σ).toSubgroup) ≅
      (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj
        (trivialF2 (AbsoluteGaloisGroup L)) :=
  sorry

/-- **Layer 9, restriction along `L/K` on `𝔽₂`-cohomology.** Layer 1's `res` at `galoisSubgroup`
followed by the transport. The body is a real term, so this is not a second restriction. -/
noncomputable def galoisRes [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    (continuousCohomology ℤ (AbsoluteGaloisGroup K) n).obj (trivialF2 (AbsoluteGaloisGroup K)) ⟶
      (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj
        (trivialF2 (AbsoluteGaloisGroup L)) :=
  res ℤ (galoisSubgroup K L σ).toSubgroup (trivialF2 (AbsoluteGaloisGroup K)) n ≫
    (galoisF2Iso K L σ n).hom

/-- **Layers 9 and 10, corestriction along `L/K` on `𝔽₂`-cohomology,** Layer 10's `corestriction`
read through the same transport. -/
noncomputable def galoisCor [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj (trivialF2 (AbsoluteGaloisGroup L)) ⟶
      (continuousCohomology ℤ (AbsoluteGaloisGroup K) n).obj
        (trivialF2 (AbsoluteGaloisGroup K)) :=
  (galoisF2Iso K L σ n).inv ≫
    corestriction ℤ (galoisSubgroup K L σ) (trivialF2 (AbsoluteGaloisGroup K))
      (trivialF2_isSmoothDiscrete (AbsoluteGaloisGroup K)) n

/-- **Layers 9 and 13, the Evens norm of a quadratic extension,** `H¹(G_L, 𝔽₂) → H²(G_K, 𝔽₂)`. The
norm multiplies the degree by the index, so this signature is the index-two case and nothing else:
for `[L : K] = 3` the target is `H³`. -/
noncomputable def galoisEvens [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) :
    ((continuousCohomology ℤ (AbsoluteGaloisGroup L) 1).obj
        (trivialF2 (AbsoluteGaloisGroup L))) →
      ((continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
        (trivialF2 (AbsoluteGaloisGroup K))) :=
  fun x =>
    evensNormIndexTwo (galoisSubgroup K L σ) (by rw [galoisSubgroup_index]; exact hdeg)
      ((galoisF2Iso K L σ 1).inv.hom x)

/-- **Layers 9 and 13, the conjugate class of a quadratic extension,** the transport of
`evensConj`. It is written through `res ∘ cor` for the same reason `evensConj` is: no element of
`G_K` outside `G_L` is chosen, so the identities below are about `L/K`. -/
noncomputable def galoisConj [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (n : ℕ)
    (y : (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj
      (trivialF2 (AbsoluteGaloisGroup L))) :
    (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj (trivialF2 (AbsoluteGaloisGroup L)) :=
  (galoisRes K L σ n).hom ((galoisCor K L σ n).hom y) - y

/-- At index two `res ∘ cor` is the sum over the two conjugates. It holds by the definition of
`galoisConj`, and it is named because that is the form later proofs apply. -/
theorem galoisRes_galoisCor [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (n : ℕ)
    (y : (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj
      (trivialF2 (AbsoluteGaloisGroup L))) :
    (galoisRes K L σ n).hom ((galoisCor K L σ n).hom y) = y + galoisConj K L σ n y := by
  simp [galoisConj]

/-- **Layers 9 and 13, the two conjugates agree.** `evensConj` is the conjugation of the subgroup
and `galoisConj` is its transport, so this is the theorem that lets the index-two identities be
read on the `L/K` side. -/
theorem galoisConj_evensConj [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (n : ℕ)
    (y : (continuousCohomology ℤ (AbsoluteGaloisGroup L) n).obj
      (trivialF2 (AbsoluteGaloisGroup L))) :
    galoisConj K L σ n y =
      (galoisF2Iso K L σ n).hom.hom
        (evensConj (galoisSubgroup K L σ) (by rw [galoisSubgroup_index]; exact hdeg) n
          ((galoisF2Iso K L σ n).inv.hom y)) :=
  sorry

/-- **Layer 12 at the bridge: restriction preserves cup products.** An instance of `cup_res` at the
`𝔽₂` pairing, named because that is what a consumer cites. -/
theorem galoisRes_cup [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K)
    (x y : (continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (trivialF2 (AbsoluteGaloisGroup K))) :
    (galoisRes K L σ 2).hom (cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 x y) =
      cup (f2Pairing (AbsoluteGaloisGroup L)) 1 1 ((galoisRes K L σ 1).hom x)
        ((galoisRes K L σ 1).hom y) :=
  sorry

/-- **Layer 12 at the bridge: the projection formula,** an instance of `cup_projection`. -/
theorem galoisCor_cup [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K)
    (x : (continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (trivialF2 (AbsoluteGaloisGroup K)))
    (y : (continuousCohomology ℤ (AbsoluteGaloisGroup L) 1).obj
      (trivialF2 (AbsoluteGaloisGroup L))) :
    (galoisCor K L σ 2).hom
        (cup (f2Pairing (AbsoluteGaloisGroup L)) 1 1 ((galoisRes K L σ 1).hom x) y) =
      cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 x ((galoisCor K L σ 1).hom y) :=
  sorry

/-- **Layer 13 at the bridge: identity 1,** `res N^{Ev}(x) = x ⌣ (conj x)`, the transport of
`evensNorm_res`. -/
theorem galoisRes_galoisEvens [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2)
    (x : (continuousCohomology ℤ (AbsoluteGaloisGroup L) 1).obj
      (trivialF2 (AbsoluteGaloisGroup L))) :
    (galoisRes K L σ 2).hom (galoisEvens K L σ hdeg x) =
      cup (f2Pairing (AbsoluteGaloisGroup L)) 1 1 x (galoisConj K L σ 1 x) :=
  sorry

/-- **Layer 13 at the bridge: identity 2,** the polarization, the transport of
`evensNorm_polarization`. The right-hand side carries the **conjugate** class; a formula without it
is a different statement. -/
theorem galoisEvens_add [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (x y : (continuousCohomology ℤ (AbsoluteGaloisGroup L) 1).obj
      (trivialF2 (AbsoluteGaloisGroup L))) :
    galoisEvens K L σ hdeg (x + y) =
      galoisEvens K L σ hdeg x + galoisEvens K L σ hdeg y +
        (galoisCor K L σ 2).hom
          (cup (f2Pairing (AbsoluteGaloisGroup L)) 1 1 x (galoisConj K L σ 1 y)) :=
  sorry

/-- **Layer 9, restriction is functorial in a tower `M/L/K`.** The three embeddings are
independent data; the theorem is that the composite does not see which ones were chosen. -/
theorem galoisRes_comp [FiniteDimensional K L] [Algebra.IsSeparable K L]
    {M : Type u} [Field M] [Algebra K M] [Algebra L M] [IsScalarTower K L M]
    [FiniteDimensional L M] [Algebra.IsSeparable L M] [FiniteDimensional K M]
    [Algebra.IsSeparable K M]
    (σ : L →ₐ[K] SeparableClosure K) (τ : M →ₐ[L] SeparableClosure L)
    (υ : M →ₐ[K] SeparableClosure K) (n : ℕ) :
    galoisRes K L σ n ≫ galoisRes L M τ n = galoisRes K M υ n :=
  sorry

/-- **Layer 9, independence of the embedding, at the level of subgroups.** Two `K`-embeddings of
`L` into `Kˢ` cut out conjugate open subgroups. -/
theorem galoisSubgroup_conj [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ τ : L →ₐ[K] SeparableClosure K) :
    ∃ g : AbsoluteGaloisGroup K,
      (galoisSubgroup K L τ).toSubgroup =
        (galoisSubgroup K L σ).toSubgroup.map (MulAut.conj g).toMonoidHom :=
  sorry

/-- **Layer 9, independence of the embedding,** for restriction. Conjugate subgroups induce the
same map on cohomology, so every statement above is about `L/K` and not about a chosen
embedding. -/
theorem galoisRes_embedding_independent [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ τ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    galoisRes K L σ n = galoisRes K L τ n :=
  sorry

/-- **Layer 9, independence of the embedding,** for corestriction. -/
theorem galoisCor_embedding_independent [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ τ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    galoisCor K L σ n = galoisCor K L τ n :=
  sorry

/-- **Layer 13, independence of the embedding,** for the Evens norm. -/
theorem galoisEvens_embedding_independent [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ τ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) :
    galoisEvens K L σ hdeg = galoisEvens K L τ hdeg :=
  sorry

end FieldExtension

/-! ### What the sibling roadmaps consume -/

/-- **Layer 13, the restriction identity, at cochain level.** The first of the four identities the
Quadratic Form Invariants roadmap consumes: on `U × U` the graph cochain is the cup of `α` with
its conjugate, `res_U N^{Ev}(α) = α ⌣ (s · α)`. Stated on cochains here, since that is the form
the proof produces and the form a reader can check against the definition above. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2) (s : G) (hs : s ∉ U)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (γ η : G) (hγ : γ ∈ U) (hη : η ∈ U) :
    evensGraphCochain U.toSubgroup s α (γ, η) =
      evensExtend U.toSubgroup α γ * evensExtend U.toSubgroup α (s⁻¹ * η * s) :=
  sorry

set_option synthInstance.maxHeartbeats 40000 in
/-- **Layer 9, the mod-2 Kummer class.** With `2` invertible in `K`, the class of `a` is the
continuous homomorphism `G_K → 𝔽₂` that is trivial exactly on the automorphisms fixing a chosen
square root. This is the object the Quadratic Form Invariants roadmap calls the Kummer class, and
its square-class isomorphism `Kˣ ⧸ (Kˣ)² ≅ H¹(G_K, 𝔽₂)` is the Layer 9 milestone it consumes.
Multiplicative notation, through `Additive`, is the pin's own idiom for coefficients that are
units. -/
example (K : Type*) [Field K] (h2 : IsUnit (2 : K)) (a : Kˣ) (r : (SeparableClosure K)ˣ)
    (hr : (r : SeparableClosure K) ^ 2 = algebraMap K (SeparableClosure K) (a : K)) :
    ∃ κ : (SeparableClosure K ≃ₐ[K] SeparableClosure K) → Multiplicative (ZMod 2),
      (∀ g, κ g = 1 ↔ g • r = r) ∧ IsLocallyConstant κ ∧
        ∀ g h, κ (g * h) = κ g * κ h :=
  sorry

end TauCetiRoadmap.ProfiniteCohomology
