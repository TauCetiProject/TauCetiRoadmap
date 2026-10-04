import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.Additive
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologyComparison
import TauCeti.RepresentationTheory.Homological.ContCohomology.Coinduced.Functor
import TauCeti.RepresentationTheory.Homological.ContCohomology.Coinduced.PreservesExactness
import TauCeti.RepresentationTheory.Homological.ContCohomology.ConnectingMapComparison
import TauCeti.RepresentationTheory.Homological.ContCohomology.ContinuousCohomologyIso
import TauCeti.RepresentationTheory.Homological.ContCohomology.Corestriction.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.DegreeZero
import TauCeti.RepresentationTheory.Homological.ContCohomology.DeltaNaturality
import TauCeti.RepresentationTheory.Homological.ContCohomology.Evens.Class
import TauCeti.RepresentationTheory.Homological.ContCohomology.ExactCochains
import TauCeti.RepresentationTheory.Homological.ContCohomology.ExplicitFunctoriality
import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.Colimit
import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.DegreeTwoDescent
import TauCeti.RepresentationTheory.Homological.ContCohomology.Functoriality
import TauCeti.RepresentationTheory.Homological.ContCohomology.GroupCohomologyIso
import TauCeti.RepresentationTheory.Homological.ContCohomology.HomologySequence
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation.ConnectingMap
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation.Comparison
import TauCeti.RepresentationTheory.Homological.ContCohomology.Invariants
import TauCeti.RepresentationTheory.Homological.ContCohomology.ProjectionFormula
import TauCeti.RepresentationTheory.Homological.ContCohomology.Shapiro
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete
import TauCeti.RepresentationTheory.Homological.ContCohomology.Transgression
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.ConnectingMap
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialF2
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.FiniteExtension
import TauCeti.FieldTheory.GaloisCohomology.BrauerTorsion
import TauCeti.FieldTheory.GaloisCohomology.Coefficients
import TauCeti.FieldTheory.GaloisCohomology.Hilbert90
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.GroupTheory.TransversalWord
import TauCeti.Topology.Algebra.Group.LocallyConstant
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP
import TauCeti.Topology.Algebra.Group.Profinite.Section
import TauCeti.Topology.Algebra.Group.Quotient.Basic
import TauCeti.Topology.Algebra.Group.TopologicalAbelianization
import TauCeti.Topology.Algebra.GroupAction.Discrete
import TauCeti.Topology.Algebra.GroupAction.InternalHom

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

Where Tau Ceti already implements an object of this roadmap, the declaration here **is** that
object: an `abbrev` of the Tau Ceti declaration, or a theorem whose proof is the Tau Ceti theorem,
under this roadmap's name and with its argument order, so that the sibling roadmaps read one
implementation. Each such docstring names the Tau Ceti declaration. That covers the coefficient
dictionary (`ofDiscreteModule`, `IsSmoothDiscrete`, `ofDiscreteModuleMap`, `ofDiscreteModulePair`,
`ofDiscreteModuleRes`, `ofDiscreteModuleQuotient` and the smooth discrete subcategory), the
invariant coefficients `Invariants` (Mathlib's `FixedPoints.addSubgroup` with Tau Ceti's quotient
action), the internal hom (`homAction`, `evalPairing`), the named instances `res`, `infl` and
`coeffMap` with `quotientToInvariants`, Layer 2's explicit complex from `C1` to `H2pi` with
`DiscreteH1`, `DiscreteH2`, restriction, inflation, conjugation and the compatible-pair pullback,
the comparison isomorphisms of Layer 3 with the transport of pullback, restriction, inflation and
coefficient maps, Layer 4's finite-quotient systems with their comparison cocones and colimit
theorems, Layer 5's short exact sequences with the two connecting maps, the eight exactness nodes
and the five-term sequence with the transgression, Layer 6's transversal word `lWord` and the
low-degree corestrictions `explicitCor0/1/2` with their variable-transversal forms, the change of
transversal, `cor ∘ res`, the connecting-map compatibility and the projection formula, Layer 7's
coinduced module (`Coind`, `coindTraceRaw`, `coindTopRep`, `coindFunctor`, the exactness
`coindFunctor_map_shortExact`, the algebraic comparison `algebraicCoindAsSmooth` and
`topologicalCoindIsoAlgebraic`) with its explicit Shapiro isomorphisms `explicitShapiro0/1/2`,
Layer 8's six explicit cups with their connecting-map identities, Layer 9's absolute Galois group,
coefficient modules, Kummer sequence, Kummer map and isomorphism with its restriction square,
Hilbert 90, the map `h2KummerToUnits` and the subgroup `galoisSubgroup` of a finite extension with
its index and its identification with `G_L`, Layer 10's connecting map `delta` with its exactness
and its restriction and inflation squares and the trace `coindTrace` that all-degree
corestriction is built from, the cohomological-dimension invariants of Layer 11
(`IsPPrimaryTorsion`, the two vanishing predicates, `cd_p`, `scd_p`, `cd`) with
`isPPrimaryTorsion_continuousCohomology`, and Layer 13's graph cochain with its Shapiro
components, the trivial `𝔽₂` object `trivialF2` with its restriction map, and the graph class
`graphClass`. The open stabilizers and continuous sections of Layer 0, the comparison of
`Field.absoluteGaloisGroup` with Layer 9's group, the strict descent of continuous cocycles in
Layer 4, the transversal cocycle law and the two corestriction cochain identities of Layer 6 and
the uniform local constancy of Layer 7 are `example`s proved by the Tau Ceti theorems.
The class-module maps of Layer 11 are built from Tau Ceti's explicit restriction, inflation and
compatible-pair pullback. Layer 11's class module is stated against Tau Ceti's
`maximalProPQuotient` and the conjugation action on Mathlib's `TopologicalAbelianization`.

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
different and false statement about every morphism. The maps still carried for that reason are
`ofDiscreteModulePairing`, `cochainClass`, `resLe`, `corestrictionLe`,
`conjOpenSubgroup`, `conjMapOf`, `powerClassNorm`, `kummerCor`, `f2Pairing`, `cupFamily`,
`trivialF2Quotient`, `trivialF2InflSub`, `evensNormLe`, `homClass`, `galoisF2Iso`,
`explicitH2CyclicEquiv`, `abelianizationProPSubgroupOfEquiv` and `abelianizationProPTransferLe`.
The others this paragraph once listed are Tau Ceti's declarations now, or have bodies built from
them.

Two hypotheses are carried as **data** rather than left implicit, because the constructions do not
exist without them. `CosetTransversal U` bundles a section of `G → G ⧸ U` with the proof that it is
one: for an arbitrary function the Schreier factors need not lie in `U`, so the monomial
homomorphism has no target. `DiscreteShortExact G A B C`, Tau Ceti's structure, bundles a short
exact sequence of discrete `G`-modules with its two maps: the connecting maps, their exactness,
their naturality and the corestriction compatibility are all statements about the same sequence,
and each of them has to name the same two coefficient maps.

The index-two Evens block carries **no** chosen element outside `U`, and no structure bundling one.
Everything stated at class level is choice-free: `evensConj` is `res ∘ cor - id`, `graphClass` is a
function of `U` and `α`, `evensNormIndexTwo` is the graph class descended to `H¹(U, 𝔽₂)`, and the
class-level identities take only `(G : U) = 2`. The element `s` appears exactly where the cochain
formulas need it, in `evensGraphCochain`, `evensCorCochain`, `indexTwoInd` and their theorems, and
the theorems tying the class-level maps to those cochains (`evensConj_eq_conjMapOf`,
`graphClass_eq_cochainClass`, `evensNormIndexTwo_eq_ind_pullback`) quantify over **every**
`s ∉ U`. A bundled choice would have made every exported identity a statement about that choice.

Degree 1 of the index-two form is stated on **cochains**, not on classes. `evensB1` and `evensBs`
are not cocycles: for `G = C₄ = ⟨σ⟩`, `U = ⟨σ²⟩`, `s = σ` and `α ≠ 0`, the values of `evensB1` at
`1, σ, σ², σ³` are `0, 1, 1, 0`, so it is not a homomorphism. Only their sum `evensCorCochain` is,
and only the sum is given a class.

Also prototyped: trivial-action `H¹` worked examples through `ContinuousAddMonoidHom` and the two
topological facts the Layer 3 comparison rests on (Layers 2 and 3); the exactness of discrete
cochain lifting (Layer 5); the canonical Shapiro map `shapiroMap`, induced by the comparison
cochain map `shapiroCochainMap`, with Shapiro's lemma in every degree as the statement that this
cochain map is a quasi-isomorphism (`isIso_shapiroMap`, `quasiIso_shapiroCochainMap`) and
`shapiroIso` the resulting isomorphism, and the descent of a vanishing restriction from a closed
subgroup to an open one (Layer 10); two cup-product cocycle identities and the `C₂` nontriviality
anchor (Layer 8); the
general-`n` Kummer cocycle, the norm square of the Kummer isomorphism, and the field-extension
bridge `galoisSubgroup` with its restriction, corestriction and norm (Layer 9);
the order-theoretic wrapper `leastENatBound`, the `p`-primary torsion of the cohomology of
`p`-primary coefficients, the two vanishing predicates and the three invariants `cd_p`, `scd_p`,
`cd` with their two dévissage reductions, the strict-dimension criterion and the class module of a
group of strict `p`-cohomological dimension at most two (Layer 11); the coefficient pairing and the
bidegree cup (Layer 12); and the index-2 Evens graph cocycle with its `C₄` and `C₈` anchors, the
index-two norm defined as the graph class, the character of an index-two subgroup with the norm of a
restricted class, the index-two exact sequence in degrees `≤ 2`, and the graph cochain of the
tautological character of `C₂ ≀ C₂` against the explicit `D₁₆` extension cocycle; the cochain form
of the norm of a restricted class, the naturality of the graph cochain and the `C₂ ≀ C₂` identity
are proved (Layer 13).

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
through a finite quotient, so `M = ⋃_U M^U`. The Layer 4 colimit uses that union. Tau Ceti's
`TauCeti.exists_openNormalSubgroup_smul_eq_self`
(`TauCeti/Topology/Algebra/GroupAction/Discrete.lean`). -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {M : Type*} [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] (m : M) :
    ∃ U : OpenNormalSubgroup G, ∀ u ∈ U, u • m = m :=
  TauCeti.exists_openNormalSubgroup_smul_eq_self m

/-- **Layer 0, the invariant coefficients `M^U`.** The coefficient system of the finite-level
tower, as an additive subgroup of `M`: Mathlib's `FixedPoints.addSubgroup U M`, membership being
`FixedPoints.mem_addSubgroup`. For normal `U` it carries the `G`-action and the descended
`G ⧸ U`-action of Tau Ceti's `TauCeti/GroupTheory/GroupAction/FixedPoints.lean`
(`TauCeti.distribMulActionFixedPointsAddSubgroup`,
`TauCeti.distribMulActionQuotientFixedPointsAddSubgroup`), and for open normal `U` and discrete `M`
the continuity of the latter (`TauCeti.continuousSMulQuotientFixedPoints`). These are the
coefficients of Tau Ceti's inflation and finite-quotient system. -/
abbrev Invariants {G : Type*} [Group G] (U : Subgroup G) (M : Type*) [AddCommGroup M]
    [DistribMulAction G M] : AddSubgroup M :=
  FixedPoints.addSubgroup U M

/-- **Layer 0, continuous sections of profinite quotients** (Ribes-Zalesskii Prop. 2.2.2).
For a **closed** subgroup `H` of a profinite group the projection `G → G ⧸ H` has a
continuous section normalized at the identity coset. This is the input that Layer 5's
transgression, the exactness of Layer 7's coinduction, and the inverse map in Layer 7's
Shapiro isomorphism all lift through, and it is stated once for all three. Nothing here is
needed for an **open** subgroup, where the finite transversal `Quotient.out` already
suffices; `Quotient.out` is *not* a substitute for this statement, since it is not continuous
when `H` has infinite index. Tau Ceti's `TauCeti.exists_continuous_section`
(`TauCeti/Topology/Algebra/Group/Profinite/Section.lean`), which is what Tau Ceti's transgression
is built on. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    ∃ s : G ⧸ H → G, Continuous s ∧ (∀ x : G ⧸ H, QuotientGroup.mk (s x) = x) ∧
      s (QuotientGroup.mk 1) = 1 :=
  TauCeti.exists_continuous_section H hH

/-- **Layer 0, an open subgroup of a compact group is compact.** It is closed, since its complement
is a union of cosets. Layer 13 feeds `U.toSubgroup` to statements about profinite groups through
this instance. -/
instance compactSpace_openSubgroup {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] (U : OpenSubgroup G) : CompactSpace U.toSubgroup :=
  isCompact_iff_compactSpace.mp U.isClosed.isCompact

/-- **Layer 0, the conjugation action on the internal hom,** `(g • φ) m = g • φ (g⁻¹ • m)` on
`M →+ N`. This is Tau Ceti's `TauCeti.homAction`
(`TauCeti/Topology/Algebra/GroupAction/InternalHom.lean`). Mathlib already puts the
codomain-pointwise action on `M →+ N`, so the conjugation action is registered not there but on
Tau Ceti's wrapper `TauCeti.InternalHom G M N`, where `g • φ` is `homAction g φ`
(`TauCeti.InternalHom.toAddMonoidHom_smul`) and which is again a discrete `G`-module for finite
discrete `M` and discrete `N`. -/
abbrev homAction {G : Type*} [Group G] {M N : Type*} [AddCommGroup M] [AddCommGroup N]
    [DistribMulAction G M] [DistribMulAction G N] (g : G) (φ : M →+ N) : M →+ N :=
  TauCeti.homAction g φ

/-- **Layer 0, the evaluation pairing** of the internal hom, `φ ⊗ m ↦ φ m`, out of Tau Ceti's
`TauCeti.InternalHom G M N`, the carrier of the conjugation action: this is
`TauCeti.InternalHom.evalPairing G`. It is the pairing the duality package of Layer 8 feeds to the
cup products, through `ofDiscreteModulePairing`, and the duality pairings of Layer 8 and of the
Class Field Theory roadmap are instances of the cup API **at this pairing** and at no other. -/
abbrev evalPairing (G M N : Type*) [AddMonoid M] [AddCommMonoid N] :
    TauCeti.InternalHom G M N →+ (M →+ N) :=
  TauCeti.InternalHom.evalPairing G

/-- **Layer 0, evaluation is equivariant,** Tau Ceti's
`TauCeti.InternalHom.evalPairing_equivariant`. The statement that makes the duality cup pairings of
Layer 8 well typed, and the one the Class Field Theory roadmap names when it states local Tate
duality. It is what fixes the sign of the conjugation action. -/
theorem evalPairing_equivariant {G : Type*} [Group G] (M N : Type*) [AddCommGroup M]
    [AddCommGroup N] [DistribMulAction G M] [DistribMulAction G N] (g : G)
    (φ : TauCeti.InternalHom G M N) (m : M) :
    evalPairing G M N (g • φ) (g • m) = g • evalPairing G M N φ m :=
  TauCeti.InternalHom.evalPairing_equivariant g φ m

/-! ### Layer 1: the canonical carrier and its functoriality -/

open CategoryTheory
/-- **Layer 1, the smooth discrete objects.** An object of `TopRep` carries one continuous operator
per group element and nothing there forces the action to be continuous in the group variable, so an
object whose module is discrete can still have non-open stabilizers. The dictionary of `README.md`
Layer 1 is an equivalence with **this** subcategory and not with all of `TopRep`, and every
canonical-facing comparison below quantifies over it. This is Tau Ceti's `TauCeti.IsSmoothDiscrete`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`), with its two fields
`discreteTopology` and `stabilizer_isOpen`; `TauCeti.isSmoothDiscrete_iff_continuousSMul` is the
comparison with continuity of the action, and
`TauCeti.not_isSmoothDiscrete_ofDiscreteModule_units_zmod` the discrete object that is not
smooth. -/
abbrev IsSmoothDiscrete (R : Type v) [CommRing R] [TopologicalSpace R]
    {G : Type u} [Group G] [TopologicalSpace G] (X : TopRep R G) : Prop :=
  TauCeti.IsSmoothDiscrete R X

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
Mathlib's `map_id` and `map_comp`. This packaging is what the filtered-colimit theorem names. It is
Tau Ceti's `TauCeti.ContinuousCohomology.continuousCohomologyFunctor`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`), whose map field is
`coeffMap` below. -/
noncomputable abbrev continuousCohomologyFunctor
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (n : ℕ) :
    TopRep R G ⥤ TopModuleCat.{u} R :=
  TauCeti.ContinuousCohomology.continuousCohomologyFunctor R G n

/-- **Layer 10, Mathlib's homogeneous cochains packaged as a functor.** This is the functor to
which the short exact coefficient complex is mapped before applying the homology-sequence API. It
is Tau Ceti's `TauCeti.ContinuousCohomology.continuousCochainsFunctor`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Additive.lean`), which is additive. -/
noncomputable abbrev continuousCochainsFunctor
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TopRep R G ⥤ CochainComplex (TopModuleCat.{u} R) ℕ :=
  TauCeti.ContinuousCohomology.continuousCochainsFunctor R G

/-- The cochain functor preserves zero morphisms, being additive
(`TauCeti.ContinuousCohomology.continuousCochainsFunctor_additive`). -/
noncomputable instance continuousCochainsFunctor_preservesZeroMorphisms
    (R : Type v) [CommRing R] [TopologicalSpace R]
    (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    (continuousCochainsFunctor R G).PreservesZeroMorphisms :=
  inferInstance

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
subgroup carries the subspace topology and needs no openness or closedness hypothesis. This is Tau
Ceti's `TauCeti.ContinuousCohomology.res`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`), Mathlib's `map` for
the inclusion `S ↪ G` and the identity of the coefficients (`res_def`), with its composition law
`res_comp_res` and its naturality in the coefficients `coeffMap_comp_res`. -/
noncomputable abbrev res (S : Subgroup G) (X : TopRep R G) (n : ℕ) :
    (continuousCohomology R G n).obj X ⟶
      (continuousCohomology R S n).obj ((TopRep.resFunctor S.subtype).obj X) :=
  TauCeti.ContinuousCohomology.res S X n

/-- **Layer 1, the invariants of a closed normal subgroup, as a `G ⧸ N`-object.** The coefficient
half of inflation, and the canonical-side twin of Mathlib's discrete `Rep.quotientToInvariants`:
Tau Ceti's `TopRep.quotientToInvariants`
(`TauCeti/RepresentationTheory/Continuous/Invariants.lean`). -/
noncomputable abbrev quotientToInvariants (N : Subgroup G) [N.Normal] (X : TopRep R G) :
    TopRep R (G ⧸ N) :=
  _root_.TopRep.quotientToInvariants X N

/-- **Layer 1, the invariants of a closed normal subgroup include into the object.** The
coefficient half of the inflation compatible pair, as a morphism of `G`-objects, Tau Ceti's
`TopRep.quotientToInvariantsι`. Layer 12's inflation compatibility for the cup product is stated
through it, because the two pairings that compatibility relates live on objects with different
underlying modules, so they cannot be compared by an equation between their bilinear maps the way
the restricted pairing can. -/
noncomputable abbrev quotientToInvariantsι (N : Subgroup G) [N.Normal] (X : TopRep R G) :
    (TopRep.resFunctor (QuotientGroup.mk' N : G →* G ⧸ N)).obj (quotientToInvariants R N X) ⟶ X :=
  _root_.TopRep.quotientToInvariantsι X N

/-- **Layer 1, inflation,** the second named instance: Tau Ceti's
`TauCeti.ContinuousCohomology.infl`, Mathlib's `map` for the quotient map and the inclusion of the
invariants (`infl_def`), with `infl_comp_infl` and `coeffMap_comp_infl`. -/
noncomputable abbrev infl (N : Subgroup G) [N.Normal] (X : TopRep R G) (n : ℕ) :
    (continuousCohomology R (G ⧸ N) n).obj (quotientToInvariants R N X) ⟶
      (continuousCohomology R G n).obj X :=
  TauCeti.ContinuousCohomology.infl N X n

/-- **Layer 1, coefficient maps,** the third named instance, at `φ = id`: Tau Ceti's
`TauCeti.ContinuousCohomology.coeffMap`, which is Mathlib's `map` at the identity (`coeffMap_def`),
with `coeffMap_id` and `coeffMap_comp`. -/
noncomputable abbrev coeffMap {X Y : TopRep R G} (f : X ⟶ Y) (n : ℕ) :
    (continuousCohomology R G n).obj X ⟶ (continuousCohomology R G n).obj Y :=
  TauCeti.ContinuousCohomology.coeffMap f n

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
across. It is Tau Ceti's `TauCeti.ofDiscreteModule ℤ G M`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`), the continuous
counterpart of Mathlib's `Rep.ofDistribMulAction`, whose underlying module is `M` itself
(`TauCeti.ofDiscreteModule_V`) and whose operator at `g` is `m ↦ g • m`
(`TauCeti.ofDiscreteModule_ρ_apply_apply`). Every statement below about `Hⁿ(G, M)` for a discrete
module `M` is about this object. -/
noncomputable abbrev ofDiscreteModule (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M]
    [ContinuousSMul G M] : TopRep ℤ G :=
  TauCeti.ofDiscreteModule ℤ G M

/-- **Layer 1, the dictionary lands in the smooth subcategory,** Tau Ceti's
`TauCeti.ofDiscreteModule_isSmoothDiscrete`. The half of the equivalence that says the constructor
is well behaved; the other half, that every discrete object is the image of its own module, is
`TauCeti.ofDiscreteModule_eq_self`. -/
theorem ofDiscreteModule_isSmoothDiscrete (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M]
    [ContinuousSMul G M] : IsSmoothDiscrete ℤ (ofDiscreteModule G M) :=
  TauCeti.ofDiscreteModule_isSmoothDiscrete ℤ G M

section CoefficientEquivalence

open CategoryTheory

variable (R : Type v) [CommRing R] [TopologicalSpace R]
  (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 1, the smooth discrete full subcategory.** The half of `TopRep` the dictionary is an
equivalence with: Tau Ceti's `TauCeti.SmoothDiscreteTopRep`, the full subcategory on
`IsSmoothDiscrete`, which is Mathlib's `DiscreteContAction` carried across
`TopRep.TopRepEquivActionTop` (`TauCeti.isSmoothDiscrete_iff_discreteTopology_and_isContinuous`). -/
abbrev SmoothDiscreteTopRep : Type _ :=
  TauCeti.SmoothDiscreteTopRep.{v, u, u} R G

/-- Smooth discrete objects inherit zero morphisms from `TopRep`; the zero map preserves the
underlying object property. -/
noncomputable instance : CategoryTheory.Limits.HasZeroMorphisms (SmoothDiscreteTopRep R G) :=
  sorry

/-- **Layer 1, the inclusion of the smooth discrete subcategory into `TopRep`,** which is how a
coinduced object of Layer 7 reaches the canonical cohomology functor: Tau Ceti's
`TauCeti.smoothDiscreteι`. -/
abbrev smoothDiscreteι : SmoothDiscreteTopRep R G ⥤ TopRep R G :=
  TauCeti.smoothDiscreteι.{v, u, u} R G

/-- **Layer 1, the unbundled side as a category.** The discrete `G`-modules of `README.md` §3 with
continuous `G`-action, bundled so that the dictionary can be an equivalence of categories rather
than a constructor: Tau Ceti's `TauCeti.DiscreteRep`, whose morphisms are Mathlib's
`Representation.IntertwiningMap`s, continuity being automatic on discrete modules. -/
abbrev DiscreteRep : Type _ :=
  TauCeti.DiscreteRep.{v, u, u} R G

/-- **Layer 1, the dictionary going in,** Tau Ceti's `TauCeti.toSmoothDiscrete`. -/
abbrev toSmoothDiscrete : DiscreteRep R G ⥤ SmoothDiscreteTopRep R G :=
  TauCeti.toSmoothDiscrete R G

/-- **Layer 1, the dictionary coming back,** Tau Ceti's `TauCeti.ofSmoothDiscrete`. This is the
half a one-way constructor does not give, and without it the "equivalence" would be an assertion
rather than a theorem. -/
abbrev ofSmoothDiscrete : SmoothDiscreteTopRep R G ⥤ DiscreteRep R G :=
  TauCeti.ofSmoothDiscrete R G

/-- **Layer 1, the equivalence of coefficient categories,** with its unit and counit, Tau Ceti's
`TauCeti.discreteRepEquivSmoothTopRep`. This is the statement that keeps the explicit theory from
being a second theory of coefficients. -/
abbrev discreteRepEquivSmoothTopRep :
    DiscreteRep R G ≌ SmoothDiscreteTopRep R G :=
  TauCeti.discreteRepEquivSmoothTopRep R G

end CoefficientEquivalence

/-! ### Layer 2: the explicit low-degree complex -/

section ExplicitComplex

variable (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type*) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]

/-- **Layer 2, `C¹`.** Cochains are plain functions with continuity as a predicate, matching the
shape of the pin's `groupCohomology.cocycles₁ : Submodule k (G → A)` rather than bundled
`C(G, M)`; §3 of `README.md` fixes that convention and Layer 3 crosses to the bundled form once.
The explicit complex of this layer is Tau Ceti's, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`: this is
`TauCeti.ContCohomology.C1`, membership being continuity (`TauCeti.ContCohomology.mem_C1_iff`). -/
abbrev C1 : AddSubgroup (G → M) := TauCeti.ContCohomology.C1 G M

/-- **Layer 2, `C²`,** `TauCeti.ContCohomology.C2`. -/
abbrev C2 : AddSubgroup (G × G → M) := TauCeti.ContCohomology.C2 G M

/-- **Layer 2, `d⁰ m = fun g ↦ g • m - m`,** `TauCeti.ContCohomology.d0`. -/
abbrev d0 : M →+ (G → M) := TauCeti.ContCohomology.d0 G M

/-- **Layer 2, `d¹ f (g, h) = g • f h - f (g * h) + f g`,** `TauCeti.ContCohomology.d1`. -/
abbrev d1 : (G → M) →+ (G × G → M) := TauCeti.ContCohomology.d1 G M

/-- **Layer 2, `Z¹ = C¹ ⊓ ker d¹`,** `TauCeti.ContCohomology.Z1`; membership is continuity and the
pin's `IsCocycle₁` (`TauCeti.ContCohomology.mem_Z1_iff`). -/
abbrev Z1 : AddSubgroup (G → M) := TauCeti.ContCohomology.Z1 G M

/-- **Layer 2, `Z² = C² ⊓ ker d²`,** `TauCeti.ContCohomology.Z2`; membership is continuity and the
pin's `IsCocycle₂` (`TauCeti.ContCohomology.mem_Z2_iff`), so a cocycle is built as
`⟨f, TauCeti.ContCohomology.mem_Z2_iff.2 ⟨hcont, hcocycle⟩⟩`. -/
abbrev Z2 : AddSubgroup (G × G → M) := TauCeti.ContCohomology.Z2 G M

/-- **Layer 2, `B¹ = range d⁰`,** `TauCeti.ContCohomology.B1`. Every such cochain is automatically
continuous, which is why no intersection with `C¹` appears here and one does appear in `B²`. -/
abbrev B1 : AddSubgroup (G → M) := TauCeti.ContCohomology.B1 G M

/-- **Layer 2, `B² = d¹(C¹)`,** the image of the **continuous** 1-cochains,
`TauCeti.ContCohomology.B2`. -/
abbrev B2 : AddSubgroup (G × G → M) := TauCeti.ContCohomology.B2 G M

/-- **Layer 2, `d ∘ d = 0` in the form the quotient needs,** `TauCeti.ContCohomology.B1_le_Z1`. -/
theorem B1_le_Z1 : B1 G M ≤ Z1 G M := TauCeti.ContCohomology.B1_le_Z1 G M

/-- **Layer 2, `d ∘ d = 0` in degree 2,** `TauCeti.ContCohomology.B2_le_Z2`. -/
theorem B2_le_Z2 : B2 G M ≤ Z2 G M := TauCeti.ContCohomology.B2_le_Z2 G M

/-- **Layer 2, `H⁰ = M^G`,** `TauCeti.ContCohomology.H0`, Mathlib's `FixedPoints.addSubgroup G M`.
Degree 0 is the invariant subgroup itself and not a quotient, as `README.md` §3 fixes. It carries a
name of its own because the low-degree corestriction, the connecting maps and the `(0, q)` and
`(q, 0)` cup shapes all need a degree-0 carrier to be stated against. -/
abbrev H0 : AddSubgroup M := TauCeti.ContCohomology.H0 G M

/-- **Layer 2, `H¹ = Z¹/B¹`,** `TauCeti.ContCohomology.H1`. -/
abbrev H1 := TauCeti.ContCohomology.H1 G M

/-- **Layer 2, `H² = Z²/B²`,** `TauCeti.ContCohomology.H2`. -/
abbrev H2 := TauCeti.ContCohomology.H2 G M

/-- **Layer 2, the class map in degree 1,** `TauCeti.ContCohomology.H1pi`. -/
abbrev H1pi : (Z1 G M) →+ H1 G M := TauCeti.ContCohomology.H1pi G M

/-- **Layer 2, the class map in degree 2,** `TauCeti.ContCohomology.H2pi`. -/
abbrev H2pi : (Z2 G M) →+ H2 G M := TauCeti.ContCohomology.H2pi G M

/-- **Layer 2, `H¹` with the discrete topology,** `TauCeti.ContCohomology.DiscreteH1`. The quotient
topology `H1` inherits comes from the **pointwise** topology on `G → M`, and for an infinite
profinite `G` that is not discrete: with trivial `ZMod 2` coefficients on a product of infinitely
many copies of `C₂`, no finite set of evaluations isolates the zero character. The canonical side of
Layer 3 is discrete, so the comparison is stated against this object and not against the inherited
one. -/
abbrev DiscreteH1 : Type _ := TauCeti.ContCohomology.DiscreteH1 G M

/-- **Layer 2, `H²` with the discrete topology,** `TauCeti.ContCohomology.DiscreteH2`. -/
abbrev DiscreteH2 : Type _ := TauCeti.ContCohomology.DiscreteH2 G M

/-- The identity as an additive equivalence, so that computations on representatives stay
available after passing to the discrete object: `TauCeti.ContCohomology.discreteH1Equiv`. -/
noncomputable abbrev discreteH1Equiv : DiscreteH1 G M ≃+ H1 G M :=
  TauCeti.ContCohomology.discreteH1Equiv G M

/-- The degree-2 counterpart, `TauCeti.ContCohomology.discreteH2Equiv`. -/
noncomputable abbrev discreteH2Equiv : DiscreteH2 G M ≃+ H2 G M :=
  TauCeti.ContCohomology.discreteH2Equiv G M

/-- **Layer 2, the compatible-pair pullback along an isomorphism, in degree one.** A topological
group isomorphism `φ : H ≃ₜ* G` and a continuous additive equivalence `e : M ≃+ N` with continuous
inverse and `e (φ h • m) = h • e m` give `H¹(G, M) ≃+ H¹(H, N)`: Tau Ceti's
`TauCeti.ContCohomology.explicitMap1` along the pair and along the inverse pair, which are inverse
by `explicitMap1_comp`, `explicitMap1_congr_of_eq` and `explicitMap1_id`. It is the degree-one
counterpart of Tau Ceti's `TauCeti.ContCohomology.explicitMap2Equiv`, built the same way. -/
noncomputable def explicitMap1Equiv (H : Type*) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (N : Type*) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DistribMulAction H N] [ContinuousSMul H N]
    (φ : H ≃ₜ* G) (e : M ≃+ N) (he : Continuous e) (he' : Continuous e.symm)
    (hequiv : ∀ (h : H) (m : M), e (φ h • m) = h • e m) : H1 G M ≃+ H1 H N := by
  have hequiv' : ∀ (g : G) (n : N), e.symm (φ.symm g • n) = g • e.symm n :=
    AddEquiv.symm_map_smul_of_map_mulEquiv_smul e φ.toMulEquiv hequiv
  have hf : Continuous e.toAddMonoidHom := he
  have hq : Continuous e.symm.toAddMonoidHom := he'
  have hA : ∀ (h : H) (m : M),
      e.toAddMonoidHom ((φ : H →ₜ* G) h • m) = h • e.toAddMonoidHom m := hequiv
  have hA' : ∀ (g : G) (n : N),
      e.symm.toAddMonoidHom ((φ.symm : G →ₜ* H) g • n) = g • e.symm.toAddMonoidHom n := hequiv'
  refine AddMonoidHom.toAddEquiv
    (TauCeti.ContCohomology.explicitMap1 G M H N φ e.toAddMonoidHom hf hA)
    (TauCeti.ContCohomology.explicitMap1 H N G M φ.symm e.symm.toAddMonoidHom hq hA') ?_ ?_
  · exact (TauCeti.ContCohomology.explicitMap1_comp G M H N φ e.toAddMonoidHom hf hA G M φ.symm
      e.symm.toAddMonoidHom hq hA'
      (TauCeti.ContCohomology.comp_apply_smul ((φ : H →ₜ* G) : H →* G)
        ((φ.symm : G →ₜ* H) : G →* H) e.toAddMonoidHom e.symm.toAddMonoidHom hA hA')).symm.trans
      ((TauCeti.ContCohomology.explicitMap1_congr_of_eq G M G M _ (ContinuousMonoidHom.id G) _
        (AddMonoidHom.id M) (hq := continuous_id) (hψ := fun g m => by simp)
        (ContinuousMonoidHom.ext φ.apply_symm_apply) (AddMonoidHom.ext e.symm_apply_apply)).trans
        (TauCeti.ContCohomology.explicitMap1_id G M _))
  · exact (TauCeti.ContCohomology.explicitMap1_comp H N G M φ.symm e.symm.toAddMonoidHom hq hA'
      H N φ e.toAddMonoidHom hf hA
      (TauCeti.ContCohomology.comp_apply_smul ((φ.symm : G →ₜ* H) : G →* H)
        ((φ : H →ₜ* G) : H →* G) e.symm.toAddMonoidHom e.toAddMonoidHom hA' hA)).symm.trans
      ((TauCeti.ContCohomology.explicitMap1_congr_of_eq H N H N _ (ContinuousMonoidHom.id H) _
        (AddMonoidHom.id N) (hq := continuous_id) (hψ := fun g m => by simp)
        (ContinuousMonoidHom.ext φ.symm_apply_apply) (AddMonoidHom.ext e.apply_symm_apply)).trans
        (TauCeti.ContCohomology.explicitMap1_id H N _))

/-- **Layer 2, the conjugation action on `H¹(N, M)` for normal `N`.** The compatible pair
(conjugation by `g`, the action of `g`) pulls a class of `H¹(N, M)` back to a class of
`H¹(N, M)`, and this is that map: Tau Ceti's `TauCeti.ContCohomology.explicitConj1`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Conjugation.lean`), `explicitMap1` at that
pair. The five-term sequence of Layer 5 is stated against its invariants, so the map is named
before those invariants can be. -/
noncomputable abbrev explicitConj1 (N : Subgroup G) [N.Normal] (g : G) : H1 N M →+ H1 N M :=
  TauCeti.ContCohomology.explicitConj1 (M := M) N g

/-- **Layer 2, inner automorphisms act trivially** (Milne, ADT Prop. 0.15), Tau Ceti's
`TauCeti.ContCohomology.explicitConj1_eq_id_of_mem`. This is exactly what makes the conjugation
action of `G` on `H¹(N, M)` descend to `G ⧸ N`; without it the invariants below are the invariants
of an action that is not well defined on the quotient. -/
theorem explicitConj1_eq_id_of_mem (N : Subgroup G) [N.Normal] (g : G) (hg : g ∈ N) :
    explicitConj1 G M N g = AddMonoidHom.id (H1 N M) :=
  TauCeti.ContCohomology.explicitConj1_eq_id_of_mem (M := M) N ⟨g, hg⟩

/-- **Layer 5, the `G ⧸ N`-invariants of `H¹(N, M)`,** the third term of the five-term sequence:
Tau Ceti's `TauCeti.ContCohomology.H1ConjInvariants`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/FiveTerm.lean`), membership being
`TauCeti.ContCohomology.mem_H1ConjInvariants_iff`. By `explicitConj1_eq_id_of_mem` the conditions
for `g` and for `g * n` with `n ∈ N` agree, so quantifying over `G` and over `G ⧸ N` cuts out the
same subgroup; `G` is used because that is the form the cochain computations produce. -/
abbrev H1ConjInvariants (N : Subgroup G) [N.Normal] : AddSubgroup (H1 N M) :=
  TauCeti.ContCohomology.H1ConjInvariants G M N

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
become polymorphic by deleting the binders. The three are Tau Ceti's, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/GroupCohomologyIso.lean`; this one is
`TauCeti.ContCohomology.explicitH0IsoGroupCohomology`. -/
noncomputable abbrev explicitH0IsoGroupCohomology (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [DiscreteTopology G] [SMulCommClass G ℤ M] :
    H0 G M ≃+ (groupCohomology (Rep.ofDistribMulAction ℤ G M) 0) :=
  TauCeti.ContCohomology.explicitH0IsoGroupCohomology G M

/-- **Layer 3, degree 1 against Mathlib's discrete group cohomology.** Every continuity condition
is vacuous for a discrete group, so this identifies subquotients of the same function space.
Layer 4 uses it at every finite level. Universe 0 for the reason given at
`explicitH0IsoGroupCohomology`; Tau Ceti's `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`. -/
noncomputable abbrev explicitH1IsoGroupCohomology (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [DiscreteTopology G] [SMulCommClass G ℤ M] :
    H1 G M ≃+ (groupCohomology (Rep.ofDistribMulAction ℤ G M) 1) :=
  TauCeti.ContCohomology.explicitH1IsoGroupCohomology G M

/-- **Layer 3, degree 2 against Mathlib's discrete group cohomology.** Universe 0 for the reason
given at `explicitH0IsoGroupCohomology`; Tau Ceti's
`TauCeti.ContCohomology.explicitH2IsoGroupCohomology`. -/
noncomputable abbrev explicitH2IsoGroupCohomology (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [DiscreteTopology G] [SMulCommClass G ℤ M] :
    H2 G M ≃+ (groupCohomology (Rep.ofDistribMulAction ℤ G M) 2) :=
  TauCeti.ContCohomology.explicitH2IsoGroupCohomology G M

/-- **Layer 3, `H⁰` as an object of `TopModuleCat ℤ`.** `H⁰` is a subgroup of the discrete `M`, so
it is discrete already and needs no separate synonym. -/
noncomputable abbrev explicitH0Obj : TopModuleCat ℤ :=
  TopModuleCat.of ℤ (H0 G M)

/-- **Layer 3, `H¹` as an object of `TopModuleCat ℤ`,** built from the **discrete** object. -/
noncomputable abbrev explicitH1Obj : TopModuleCat ℤ := TopModuleCat.of ℤ (DiscreteH1 G M)

/-- **Layer 3, `H²` as an object of `TopModuleCat ℤ`.** -/
noncomputable abbrev explicitH2Obj : TopModuleCat ℤ := TopModuleCat.of ℤ (DiscreteH2 G M)

/-- **Layer 1, the dictionary commutes with restriction.** Restricting the canonical object of a
discrete module to a subgroup gives the canonical object of the same module over that subgroup.
The transport squares below cannot be typed without it. The two objects are equal on the nose, by
Tau Ceti's `TauCeti.res_ofDiscreteModule`, and this is that equality as an isomorphism. -/
noncomputable def ofDiscreteModuleRes (S : Subgroup G) :
    (TopRep.resFunctor S.subtype).obj (ofDiscreteModule G M) ≅ ofDiscreteModule S M :=
  eqToIso (TauCeti.res_ofDiscreteModule S)

/-- **Layer 2, restriction on the explicit model in degree 0,** the inclusion `M^G ⊆ M^S`: Tau
Ceti's `TauCeti.ContCohomology.explicitRes0`. -/
noncomputable abbrev explicitRes0 (S : Subgroup G) : H0 G M →+ H0 S M :=
  TauCeti.ContCohomology.explicitRes0 G M S

/-- **Layer 2, restriction on the explicit model,** the instance of the compatible-pair pullback
at the inclusion of a subgroup: Tau Ceti's `TauCeti.ContCohomology.explicitRes1`, which is
`explicitMap1` at that pair (`explicitRes1_eq_explicitMap1`). -/
noncomputable abbrev explicitRes1 (S : Subgroup G) : H1 G M →+ H1 S M :=
  TauCeti.ContCohomology.explicitRes1 G M S

/-- **Layer 2, restriction on the explicit model in degree 2,** Tau Ceti's
`TauCeti.ContCohomology.explicitRes2`. -/
noncomputable abbrev explicitRes2 (S : Subgroup G) : H2 G M →+ H2 S M :=
  TauCeti.ContCohomology.explicitRes2 G M S

/-- **Layer 2, a coefficient map on the explicit model in degree 0,** the restriction of `f` to the
invariants. The three degrees are named separately because the long exact sequence of Layer 5 is an
exactness statement about all three at once. The three are Tau Ceti's
`TauCeti.ContCohomology.explicitCoeff0`, `explicitCoeff1` and `explicitCoeff2`, which take the map
bundled as a `G`-equivariant homomorphism `M →+[G] N`; the bundling is the only adaptation. -/
noncomputable abbrev explicitCoeff0 (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (_hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    H0 G M →+ H0 G N :=
  TauCeti.ContCohomology.explicitCoeff0 G M { f with map_smul' := hequiv }

/-- **Layer 2, a coefficient map on the explicit model,**
`TauCeti.ContCohomology.explicitCoeff1`. -/
noncomputable abbrev explicitCoeff1 (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    H1 G M →+ H1 G N :=
  TauCeti.ContCohomology.explicitCoeff1 G M { f with map_smul' := hequiv } hf

/-- **Layer 2, a coefficient map on the explicit model in degree 2,**
`TauCeti.ContCohomology.explicitCoeff2`. -/
noncomputable abbrev explicitCoeff2 (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    H2 G M →+ H2 G N :=
  TauCeti.ContCohomology.explicitCoeff2 G M { f with map_smul' := hequiv } hf

/-- **Layer 3, degree 0 against the canonical object,** in `TopModuleCat ℤ`. The pin computes this
degree, so it is where the comparison is checked first. Tau Ceti's
`TauCeti.ContCohomology.explicitH0IsoContinuousCohomology`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/ContinuousCohomologyIso.lean`), which
needs no profiniteness. -/
noncomputable abbrev explicitH0IsoContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    explicitH0Obj G M ≅ (continuousCohomology ℤ G 0).obj (ofDiscreteModule G M) :=
  TauCeti.ContCohomology.explicitH0IsoContinuousCohomology G M

/-- **Layer 3, degree 1 against the canonical object,** in `TopModuleCat ℤ`. The canonical side is
the image of `M` under Layer 1's dictionary and **not** an arbitrary `TopRep` object: a general
object need not be smooth, and the explicit complex is not a description of its cohomology. Tau
Ceti's `TauCeti.ContCohomology.explicitH1IsoContinuousCohomology`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean`). -/
noncomputable abbrev explicitH1IsoContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    explicitH1Obj G M ≅ (continuousCohomology ℤ G 1).obj (ofDiscreteModule G M) :=
  TauCeti.ContCohomology.explicitH1IsoContinuousCohomology G M

/-- **Layer 3, degree 2 against the canonical object,** in `TopModuleCat ℤ`. This is the degree
where the compact-open exponential law is used, hence where profiniteness is not a
convenience. Tau Ceti's `TauCeti.ContCohomology.explicitH2IsoContinuousCohomology`. -/
noncomputable abbrev explicitH2IsoContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    explicitH2Obj G M ≅ (continuousCohomology ℤ G 2).obj (ofDiscreteModule G M) :=
  TauCeti.ContCohomology.explicitH2IsoContinuousCohomology G M

/-- **Layer 3, the underlying additive equivalence,** a corollary of the isomorphism above and not
a substitute for it: Tau Ceti's `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology`,
which holds over any topological group. -/
noncomputable abbrev explicitH1AddEquivContinuousCohomology
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    H1 G M ≃+ ((continuousCohomology ℤ G 1).obj (ofDiscreteModule G M)) :=
  TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology G M

/-- **Layer 2, the compatible-pair pullback on the explicit model,** of which `explicitRes1`,
`explicitInfl1` and `explicitCoeff1` are the three named instances: Tau Ceti's
`TauCeti.ContCohomology.explicitMap1`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/ExplicitFunctoriality.lean`), with
`explicitMap1_id` and `explicitMap1_comp`; the degree-two pullback is `explicitMap2`. -/
noncomputable abbrev explicitMap1 (H : Type u) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H]
    (N : Type u) [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
    [DiscreteTopology N] [DistribMulAction H N] [ContinuousSMul H N]
    (φ : ContinuousMonoidHom H G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) (m : M), f (φ h • m) = h • f m) :
    H1 G M →+ H1 H N :=
  TauCeti.ContCohomology.explicitMap1 G M H N φ f hf hequiv

/-- **Layer 1, the dictionary carries a compatible pair.** The canonical-side coefficient morphism
of the pair `(φ, f)`, which is what `map` consumes: Tau Ceti's `TauCeti.ofDiscreteModulePair` at
the `ℤ`-linear map of `f`, pinned by `TauCeti.ofDiscreteModulePair_hom_apply`. -/
noncomputable abbrev ofDiscreteModulePair (H : Type u) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction H N] [ContinuousSMul H N]
    (φ : ContinuousMonoidHom H G) (f : M →+ N) (_hf : Continuous f)
    (hequiv : ∀ (h : H) (m : M), f (φ h • m) = h • f m) :
    (TopRep.resFunctor (φ : H →* G)).obj (ofDiscreteModule G M) ⟶ ofDiscreteModule H N :=
  TauCeti.ofDiscreteModulePair (φ : H →* G) f.toIntLinearMap hequiv

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
  TauCeti.ContCohomology.explicitIso_map G M H N φ f hequiv x

/-- **Layer 3, transport of restriction.** The square commuting is the statement; a closed
subgroup of a profinite group is profinite, which is what the instance hypotheses record. The
restricted canonical object and the canonical object of the restricted module are equal on the
nose (`TauCeti.res_ofDiscreteModule`), so no coefficient isomorphism appears in the square; the
all-degree squares of Layer 10 carry that equality as `ofDiscreteModuleRes`. Tau Ceti's
`TauCeti.ContCohomology.explicitIso_res`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean`). -/
theorem explicitIso_res [CompactSpace G] [TotallyDisconnectedSpace G] (S : Subgroup G)
    [CompactSpace S] [TotallyDisconnectedSpace S] (x : DiscreteH1 G M) :
    (res ℤ S (ofDiscreteModule G M) 1).hom
        ((explicitH1IsoContinuousCohomology G M).hom.hom x) =
      (explicitH1IsoContinuousCohomology S M).hom.hom
        (explicitRes1 G M S (discreteH1Equiv G M x) : DiscreteH1 S M) :=
  TauCeti.ContCohomology.explicitIso_res G M S x

/-- **Layer 1, the dictionary is functorial in the coefficients.** A continuous `G`-equivariant map
of discrete modules induces a morphism of the canonical objects. The coefficient square below names
this morphism: a square quantified over an arbitrary morphism of the two objects is a different
statement, and a false one, since a general morphism has nothing to do with `f`. It is Tau Ceti's
`TauCeti.ofDiscreteModuleMap` at the `ℤ`-linear map of `f`, which acts on underlying modules as `f`
(`TauCeti.ofDiscreteModuleMap_hom_apply`). -/
noncomputable abbrev ofDiscreteModuleMap (N : Type u) [AddCommGroup N] [TopologicalSpace N]
    [IsTopologicalAddGroup N] [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N]
    (f : M →+ N) (_hf : Continuous f) (hequiv : ∀ (g : G) (m : M), f (g • m) = g • f m) :
    ofDiscreteModule G M ⟶ ofDiscreteModule G N :=
  TauCeti.ofDiscreteModuleMap f.toIntLinearMap hequiv

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
  TauCeti.ContCohomology.explicitIso_coeffMap G M N { f with map_smul' := hequiv } x

/-- **Layer 1, the dictionary commutes with passing to the invariants of a closed normal
subgroup.** The coefficient half of inflation on the canonical side, named so that the inflation
square below is an equation between determined maps. It is Tau Ceti's
`TauCeti.ofDiscreteModuleQuotient`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Invariants.lean`), which preserves the
underlying coefficient (`TauCeti.ofDiscreteModuleQuotient_apply`). -/
noncomputable abbrev ofDiscreteModuleQuotient (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)] :
    ofDiscreteModule (G ⧸ N) (Invariants N M) ⟶
      quotientToInvariants ℤ N (ofDiscreteModule G M) :=
  TauCeti.ofDiscreteModuleQuotient G M N

/-- **Layer 2, inflation on the explicit model,** the instance of the compatible-pair pullback at
the quotient map of a closed normal subgroup, with the invariants as coefficients: Tau Ceti's
`TauCeti.ContCohomology.explicitInfl1`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean`), which is
`explicitMap1` at that pair (`explicitInfl1_eq_explicitMap1`). -/
noncomputable abbrev explicitInfl1 (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)] :
    H1 (G ⧸ N) (Invariants N M) →+ H1 G M :=
  TauCeti.ContCohomology.explicitInfl1 G M N

/-- **Layer 2, inflation on the explicit model in degree 2.** The last map of Layer 5's five-term
sequence, so it is a target in its own right and not a degree the degree-1 statement covers:
Tau Ceti's `TauCeti.ContCohomology.explicitInfl2`. -/
noncomputable abbrev explicitInfl2 (N : Subgroup G) [N.Normal]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)] :
    H2 (G ⧸ N) (Invariants N M) →+ H2 G M :=
  TauCeti.ContCohomology.explicitInfl2 G M N

/-- **Layer 6, variable-transversal corestriction in degree 0,** the norm
`m ↦ ∑ u, t u • m`: Tau Ceti's `TauCeti.ContCohomology.explicitCor0Transversal`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Basic.lean`). Finite index
is data: openness alone does not make the quotient finite for a general topological group. The
six corestrictions of this block are Tau Ceti's, which take `U : Subgroup G` with
`[U.FiniteIndex]` and, in degrees 1 and 2, `IsOpen (U : Set G)`; this roadmap reads them at an
`OpenSubgroup` with a `Fintype` quotient, and the finite index comes from the finite quotient
(`Subgroup.finiteIndex_of_finite_quotient`). That repackaging is the only adaptation. -/
noncomputable abbrev explicitCor0Transversal (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x, QuotientGroup.mk (t x) = x) : H0 U.toSubgroup M →+ H0 G M :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor0Transversal G M U.toSubgroup t ht

/-- **Layer 6, variable-transversal corestriction in degree 1,**
`(cor¹_t f) γ = ∑ u, t u • f (ℓᵗ_u γ)`: Tau Ceti's
`TauCeti.ContCohomology.explicitCor1Transversal`, the class of its cochain `cochainsCor1`. -/
noncomputable abbrev explicitCor1Transversal (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x, QuotientGroup.mk (t x) = x) : H1 U.toSubgroup M →+ H1 G M :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor1Transversal G M U.toSubgroup t ht U.isOpen

/-- **Layer 6, variable-transversal corestriction in degree 2,**
`(cor²_t f) (γ, η) = ∑ u, t u • f (ℓᵗ_u γ, ℓᵗ_{γ⁻¹ • u} η)`: Tau Ceti's
`TauCeti.ContCohomology.explicitCor2Transversal`, the class of its cochain `cochainsCor2`. -/
noncomputable abbrev explicitCor2Transversal (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x, QuotientGroup.mk (t x) = x) : H2 U.toSubgroup M →+ H2 G M :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor2Transversal G M U.toSubgroup t ht U.isOpen

/-- **Layer 6, change of transversal in degree 0.** The cochain formula is independent after
passing to invariants: Tau Ceti's `TauCeti.ContCohomology.explicitCor0_changeTransversal`. -/
theorem explicitCor0_changeTransversal (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t t' : G ⧸ U.toSubgroup → G) (ht : ∀ x, QuotientGroup.mk (t x) = x)
    (ht' : ∀ x, QuotientGroup.mk (t' x) = x) :
    explicitCor0Transversal G M U t ht = explicitCor0Transversal G M U t' ht' :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor0_changeTransversal G M U.toSubgroup t t' ht ht'

/-- **Layer 6, change of transversal in degree 1,** after the named coboundary identity on
representatives (`TauCeti.ContCohomology.cochainsCor1_changeTransversal`): Tau Ceti's
`TauCeti.ContCohomology.explicitCor1_changeTransversal`. -/
theorem explicitCor1_changeTransversal (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t t' : G ⧸ U.toSubgroup → G) (ht : ∀ x, QuotientGroup.mk (t x) = x)
    (ht' : ∀ x, QuotientGroup.mk (t' x) = x) :
    explicitCor1Transversal G M U t ht = explicitCor1Transversal G M U t' ht' :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor1_changeTransversal G M U.toSubgroup t ht U.isOpen t' ht'

/-- **Layer 6, change of transversal in degree 2,** after the named continuous 1-cochain
coboundary identity (`TauCeti.ContCohomology.cochainsCor2_changeTransversal`): Tau Ceti's
`TauCeti.ContCohomology.explicitCor2_changeTransversal`. -/
theorem explicitCor2_changeTransversal (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (t t' : G ⧸ U.toSubgroup → G) (ht : ∀ x, QuotientGroup.mk (t x) = x)
    (ht' : ∀ x, QuotientGroup.mk (t' x) = x) :
    explicitCor2Transversal G M U t ht = explicitCor2Transversal G M U t' ht' :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor2_changeTransversal G M U.toSubgroup t ht U.isOpen t' ht'

/-- **Layer 6, public corestriction on the explicit model in degree 0,** the norm at
`t = Quotient.out`: Tau Ceti's `TauCeti.ContCohomology.explicitCor0`. -/
noncomputable abbrev explicitCor0 (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] :
    H0 U.toSubgroup M →+ H0 G M :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor0 G M U.toSubgroup

/-- **Layer 6, public corestriction on the explicit model in degree 1,** the
`t = Quotient.out` specialization: Tau Ceti's `TauCeti.ContCohomology.explicitCor1`, computed along
any transversal by `explicitCor1_eq_transversal`. -/
noncomputable abbrev explicitCor1 (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] :
    H1 U.toSubgroup M →+ H1 G M :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor1 G M U.toSubgroup U.isOpen

/-- **Layer 6, public corestriction on the explicit model in degree 2,** the
`t = Quotient.out` specialization with two nested transversal words: Tau Ceti's
`TauCeti.ContCohomology.explicitCor2`, computed along any transversal by
`explicitCor2_eq_transversal`. -/
noncomputable abbrev explicitCor2 (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)] :
    H2 U.toSubgroup M →+ H2 G M :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor2 G M U.toSubgroup U.isOpen

/-- **Layer 3, transport of inflation.** Stated in the same shape as restriction, with the
quotient in place of the subgroup, and with the coefficient map of the dictionary morphism
`ofDiscreteModuleQuotient` in front of canonical inflation: Tau Ceti's
`TauCeti.ContCohomology.explicitIso_infl`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Comparison.lean`), whose
degree-two counterpart is `explicitIso_infl2`. -/
theorem explicitIso_infl [CompactSpace G] [TotallyDisconnectedSpace G] (N : Subgroup G)
    [N.Normal] [CompactSpace (G ⧸ N)] [TotallyDisconnectedSpace (G ⧸ N)]
    [IsTopologicalGroup (G ⧸ N)] [ContinuousSMul (G ⧸ N) (Invariants N M)]
    (x : DiscreteH1 (G ⧸ N) (Invariants N M)) :
    (infl ℤ N (ofDiscreteModule G M) 1).hom
        ((coeffMap ℤ (ofDiscreteModuleQuotient G M N) 1).hom
          ((explicitH1IsoContinuousCohomology (G ⧸ N) (Invariants N M)).hom.hom x)) =
      (explicitH1IsoContinuousCohomology G M).hom.hom
        (explicitInfl1 G M N (discreteH1Equiv (G ⧸ N) (Invariants N M) x) : DiscreteH1 G M) :=
  TauCeti.ContCohomology.explicitIso_infl G M N x

end Comparisons

/-! ### Layer 4: descent to finite levels, and the finite-quotient system -/

/-- **Layer 4, continuous 1-cocycles descend strictly.** The degree-1 surjectivity half of
the colimit theorem `H¹(G, M) ≅ colim_U H¹(G ⧸ U, M^U)`, stated raw and with **no coboundary
subtracted**: the zero set of a continuous 1-cocycle is an open subgroup, and any open normal
`U` inside it makes the cocycle right-`U`-invariant (so it factors through `G ⧸ U`) and
`U`-fixed-valued (so it takes its values in `M^U`). The descended `F` is a 1-cocycle of
`G ⧸ U` on `M^U` on the nose, for the action of Layer 0, so that the conclusion says exactly
that the original cocycle is the inflation of a finite-level cocycle. A coboundary enters
only in the injectivity half of the colimit theorem. Tau Ceti proves it: the open normal subgroup
is `TauCeti.ContCohomology.exists_openNormalSubgroup_apply_eq_zero` and the descended cocycle is
`TauCeti.ContCohomology.descendZ1`, evaluated by `coe_descendZ1_apply_mk`. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {M : Type*} [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (f : G → M) (hf : Continuous f) (hcoc : groupCohomology.IsCocycle₁ f) :
    ∃ (U : OpenNormalSubgroup G) (F : G ⧸ U.toSubgroup → Invariants U.toSubgroup M),
      groupCohomology.IsCocycle₁ F ∧ ∀ g : G, (F (QuotientGroup.mk g) : M) = f g := by
  let z : TauCeti.ContCohomology.Z1 G M := ⟨f, TauCeti.ContCohomology.mem_Z1_iff.2 ⟨hf, hcoc⟩⟩
  obtain ⟨U, hU⟩ := TauCeti.ContCohomology.exists_openNormalSubgroup_apply_eq_zero G M z
  let F := TauCeti.ContCohomology.descendZ1 (N := U.toSubgroup) z fun n => hU (n : G) n.2
  exact ⟨U, F.1, (TauCeti.ContCohomology.mem_Z1_iff.1 F.2).2,
    TauCeti.ContCohomology.coe_descendZ1_apply_mk z _⟩

/-- **Layer 4, continuous 2-cocycles descend strictly.** The degree-2 half, by uniform local
constancy: a continuous map on the **compact** space `G × G` into a discrete module is
constant on `gU × hU` for a single open normal `U`, and its image is finite, so a further
open normal subgroup fixes every value. Compactness, not just total disconnectedness, is what
descends both variables at once. Tau Ceti's
`TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean`). -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {M : Type*} [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (f : G × G → M) (hf : Continuous f) (hcoc : groupCohomology.IsCocycle₂ f) :
    ∃ (U : OpenNormalSubgroup G)
      (F : (G ⧸ U.toSubgroup) × (G ⧸ U.toSubgroup) → Invariants U.toSubgroup M),
      groupCohomology.IsCocycle₂ F ∧
        ∀ g h : G, (F (QuotientGroup.mk g, QuotientGroup.mk h) : M) = f (g, h) := by
  obtain ⟨U, c, hc⟩ := TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2
    (⟨f, TauCeti.ContCohomology.mem_Z2_iff.2 ⟨hf, hcoc⟩⟩ : TauCeti.ContCohomology.Z2 G M)
  exact ⟨U, c.1, (TauCeti.ContCohomology.mem_Z2_iff.1 c.2).2, hc⟩

/-- **Layer 4, why the coefficient inclusion is equivariant.** For `V ≤ U` the action of `g`
on `M^U` depends only on the class of `g` in `G ⧸ V`. This is the elementary fact behind
`invariantsInclusion_equivariant` below and Tau Ceti's
`TauCeti.ContCohomology.fixedPointsInclusion_continuousFiniteQuotientMap_smul`, and the reason the
pair `(G ⧸ V → G ⧸ U, M^U ↪ M^V)` is a compatible pair at all. -/
example {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    {U V : Subgroup G} (hVU : V ≤ U) (m : M) (hm : ∀ u ∈ U, u • m = m) {g g' : G}
    (hgg' : g⁻¹ * g' ∈ V) : g • m = g' • m := by
  rw [show g' = g * (g⁻¹ * g') by group, mul_smul, hm _ (hVU hgg')]

section FiniteQuotientSystem

open CategoryTheory Representation

variable {k G : Type u} [CommRing k] [Group G] [TopologicalSpace G] (A : Rep k G)

/-- **Layer 4, the group half of the transition pair.** For `V ≤ U` this is the quotient
homomorphism `G ⧸ V → G ⧸ U`, the direction of Mathlib's
`ProfiniteGrp.toFiniteQuotientFunctor`: Tau Ceti's `TauCeti.QuotientGroup.mapOfLE`
(`TauCeti/GroupTheory/QuotientGroup/Map.lean`), Mathlib's `QuotientGroup.map` at the identity of
`G`. The cohomological transition map built from it runs the other way, from the `U`-level to the
`V`-level, which is why the index category of the system is `(OpenNormalSubgroup G)ᵒᵖ`. The
transition package of this section is Tau Ceti's, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Basic.lean`, stated there
for normal subgroups and read here at open normal ones. -/
abbrev finiteQuotientMap (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    G ⧸ V.toSubgroup →* G ⧸ U.toSubgroup :=
  TauCeti.QuotientGroup.mapOfLE (U := U.toSubgroup) (V := V.toSubgroup) hVU

/-- **Layer 4, `M^U ⊆ M^V` for `V ≤ U`,** Tau Ceti's `TauCeti.invariants_le`. Fewer conditions on
the smaller subgroup. -/
theorem invariants_le (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    invariants (A.ρ.comp U.toSubgroup.subtype) ≤ invariants (A.ρ.comp V.toSubgroup.subtype) :=
  TauCeti.invariants_le A (U := U.toSubgroup) (V := V.toSubgroup) hVU

/-- **Layer 4, the coefficient half of the transition pair,** the inclusion `M^U ↪ M^V`:
Tau Ceti's `TauCeti.invariantsInclusion`. Coefficients are taken on the `Rep` side here, as
`Rep.quotientToInvariants`, because that is where Mathlib's compatible-pair API for cohomology
lives; Layer 0's dictionary identifies this object with `Invariants U M` above. -/
noncomputable abbrev invariantsInclusion (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    invariants (A.ρ.comp U.toSubgroup.subtype) →ₗ[k] invariants (A.ρ.comp V.toSubgroup.subtype) :=
  TauCeti.invariantsInclusion A (U := U.toSubgroup) (V := V.toSubgroup) hVU

/-- **Layer 4, equivariance of the coefficient inclusion** after restriction along
`finiteQuotientMap`: the `G ⧸ U`-action on `M^U`, pulled back to `G ⧸ V`, agrees with the
`G ⧸ V`-action on `M^V`. Together with `finiteQuotientMap` it makes the pair below well typed.
Tau Ceti's `TauCeti.invariantsInclusion_equivariant`. -/
theorem invariantsInclusion_equivariant (U V : OpenNormalSubgroup G) (hVU : V ≤ U)
    (x : G ⧸ V.toSubgroup) (m : invariants (A.ρ.comp U.toSubgroup.subtype)) :
    invariantsInclusion A U V hVU
        ((A.quotientToInvariants U.toSubgroup).ρ (finiteQuotientMap U V hVU x) m) =
      (A.quotientToInvariants V.toSubgroup).ρ x (invariantsInclusion A U V hVU m) :=
  TauCeti.invariantsInclusion_equivariant A (U := U.toSubgroup) (V := V.toSubgroup) hVU x m

/-- **Layer 4, the transition pair itself,** assembled from its two halves: Tau Ceti's
`TauCeti.transitionPair`. -/
noncomputable abbrev transitionPair (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    Rep.res (finiteQuotientMap U V hVU) (A.quotientToInvariants U.toSubgroup) ⟶
      A.quotientToInvariants V.toSubgroup :=
  TauCeti.transitionPair A (U := U.toSubgroup) (V := V.toSubgroup) hVU

/-- **Layer 4, the transition map of the finite-quotient system,**
`Hⁱ(G ⧸ U, M^U) → Hⁱ(G ⧸ V, M^V)` for `V ≤ U`, through Mathlib's discrete
`groupCohomology.map`: Tau Ceti's `TauCeti.finiteLevelTransition`. The target category is
`ModuleCat k`, which for `k = ℤ` is the `AddCommGrp` of the roadmap's explicit low-degree
statements. -/
noncomputable abbrev finiteLevelTransition (U V : OpenNormalSubgroup G) (hVU : V ≤ U) (i : ℕ) :
    groupCohomology (A.quotientToInvariants U.toSubgroup) i ⟶
      groupCohomology (A.quotientToInvariants V.toSubgroup) i :=
  TauCeti.finiteLevelTransition A (U := U.toSubgroup) (V := V.toSubgroup) hVU i

/-- **Layer 4, the first functor law,** Tau Ceti's `TauCeti.finiteLevelTransition_refl`. -/
theorem finiteLevelTransition_id (U : OpenNormalSubgroup G) (i : ℕ) :
    finiteLevelTransition A U U le_rfl i = 𝟙 _ :=
  TauCeti.finiteLevelTransition_refl A U.toSubgroup i

/-- **Layer 4, the second functor law,** for `W ≤ V ≤ U`: the transition from the `U`-level to the
`W`-level is the composite through the `V`-level. With the previous law this says the system is a
functor on `(OpenNormalSubgroup G)ᵒᵖ`, which the colimit theorem needs. Tau Ceti's
`TauCeti.finiteLevelTransition_comp`. -/
theorem finiteLevelTransition_comp (U V W : OpenNormalSubgroup G) (hVU : V ≤ U) (hWV : W ≤ V)
    (i : ℕ) :
    finiteLevelTransition A U W (hWV.trans hVU) i =
      finiteLevelTransition A U V hVU i ≫ finiteLevelTransition A V W hWV i :=
  TauCeti.finiteLevelTransition_comp A (U := U.toSubgroup) (V := V.toSubgroup)
    (W := W.toSubgroup) hWV hVU i

end FiniteQuotientSystem

section FiniteQuotientColimit

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]

/-- **Layer 4, the explicit degree-0 transition,** defined directly from the quotient map and
`M^U ↪ M^V`. It does not pass through the small-universe `groupCohomology` comparison. The explicit
finite-quotient systems of this section, their comparison cocones and the three colimit theorems
are Tau Ceti's, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Explicit.lean` and
`FiniteQuotient/Colimit.lean`; this one is
`TauCeti.ContCohomology.explicitFiniteQuotientTransition0`. -/
noncomputable abbrev explicitFiniteQuotientTransition0 (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    H0 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M) →+
      H0 (G ⧸ V.toSubgroup) (Invariants V.toSubgroup M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientTransition0 G M U V hVU

/-- **Layer 4, the explicit degree-1 transition,** the universe-polymorphic `explicitMap1` for
the compatible pair `(G ⧸ V → G ⧸ U, M^U ↪ M^V)`:
`TauCeti.ContCohomology.explicitFiniteQuotientTransition1`. -/
noncomputable abbrev explicitFiniteQuotientTransition1 (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    H1 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M) →+
      H1 (G ⧸ V.toSubgroup) (Invariants V.toSubgroup M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientTransition1 G M U V hVU

/-- **Layer 4, the explicit degree-2 transition,** defined directly on explicit cochains:
`TauCeti.ContCohomology.explicitFiniteQuotientTransition2`. -/
noncomputable abbrev explicitFiniteQuotientTransition2 (U V : OpenNormalSubgroup G) (hVU : V ≤ U) :
    H2 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M) →+
      H2 (G ⧸ V.toSubgroup) (Invariants V.toSubgroup M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientTransition2 G M U V hVU

/-- `TauCeti.ContCohomology.explicitFiniteQuotientTransition1_id`. -/
theorem explicitFiniteQuotientTransition1_id (U : OpenNormalSubgroup G) :
    explicitFiniteQuotientTransition1 G M U U le_rfl = AddMonoidHom.id _ :=
  TauCeti.ContCohomology.explicitFiniteQuotientTransition1_id G M U

/-- `TauCeti.ContCohomology.explicitFiniteQuotientTransition1_comp`. -/
theorem explicitFiniteQuotientTransition1_comp (U V W : OpenNormalSubgroup G)
    (hVU : V ≤ U) (hWV : W ≤ V) :
    explicitFiniteQuotientTransition1 G M U W (hWV.trans hVU) =
      (explicitFiniteQuotientTransition1 G M V W hWV).comp
        (explicitFiniteQuotientTransition1 G M U V hVU) :=
  TauCeti.ContCohomology.explicitFiniteQuotientTransition1_comp G M U V W hVU hWV

/-- **Layer 4, the finite-quotient system in degree 0,**
`TauCeti.ContCohomology.explicitFiniteQuotientSystem0`. -/
noncomputable abbrev explicitFiniteQuotientSystem0 :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ AddCommGrpCat.{u} :=
  TauCeti.ContCohomology.explicitFiniteQuotientSystem0 G M

theorem explicitFiniteQuotientSystem0_obj (U : OpenNormalSubgroup G) :
    (explicitFiniteQuotientSystem0 G M).obj (Opposite.op U) =
      AddCommGrpCat.of (H0 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M)) :=
  rfl

theorem explicitFiniteQuotientSystem0_map {U V : (OpenNormalSubgroup G)ᵒᵖ} (f : U ⟶ V) :
    (explicitFiniteQuotientSystem0 G M).map f = AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition0 G M U.unop V.unop (leOfHom f.unop)) :=
  rfl

/-- **Layer 4, the named comparison legs in degree 0,** inflation at every level:
`TauCeti.ContCohomology.explicitFiniteQuotientComparison0`. -/
noncomputable abbrev explicitFiniteQuotientComparison0 :
    explicitFiniteQuotientSystem0 G M ⟶
      (Functor.const ((OpenNormalSubgroup G)ᵒᵖ)).obj (AddCommGrpCat.of (H0 G M)) :=
  TauCeti.ContCohomology.explicitFiniteQuotientComparison0 G M

/-- `TauCeti.ContCohomology.explicitFiniteQuotientCocone0`. -/
noncomputable abbrev explicitFiniteQuotientCocone0 :
    Limits.Cocone (explicitFiniteQuotientSystem0 G M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientCocone0 G M

/-- **Layer 4, universality of the degree-0 comparison cocone,**
`TauCeti.ContCohomology.explicitFiniteQuotientColimit0`. -/
noncomputable abbrev explicitFiniteQuotientColimit0 :
    Limits.IsColimit (explicitFiniteQuotientCocone0 G M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientColimit0 G M

/-- **Layer 4, the finite-quotient system in degree 1,** as a functor on
`(OpenNormalSubgroup G)ᵒᵖ`. The index category is the opposite one because the transition maps run
from the `U`-level to the `V`-level for `V ≤ U`, against the direction of
`ProfiniteGrp.toFiniteQuotientFunctor`. Its arrows are the explicit transitions, and
`explicitFiniteQuotientTransition1_id` and `explicitFiniteQuotientTransition1_comp` are the two
functor laws. The coefficients are an explicit binder here because the functor's target category
does not mention them, and the system does. Tau Ceti's
`TauCeti.ContCohomology.explicitFiniteQuotientSystem1`. -/
noncomputable abbrev explicitFiniteQuotientSystem1 (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ AddCommGrpCat.{u} :=
  TauCeti.ContCohomology.explicitFiniteQuotientSystem1 G M

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

/-- **Layer 4, the comparison maps into `H¹(G, M)`,** inflation along `G → G ⧸ U`, which includes
the coefficient inclusion `M^U ↪ M`, assembled into the leg family of a cocone. They are named
because the colimit statement is that **these** maps are universal, not that some isomorphism
exists. Tau Ceti's `TauCeti.ContCohomology.explicitFiniteQuotientComparison1`, whose component at
`U` is `explicitInfl1` (`explicitFiniteQuotientComparison1_app`). -/
noncomputable abbrev explicitFiniteQuotientComparison1 :
    explicitFiniteQuotientSystem1 G M ⟶
      (Functor.const ((OpenNormalSubgroup G)ᵒᵖ)).obj (AddCommGrpCat.of (H1 G M)) :=
  TauCeti.ContCohomology.explicitFiniteQuotientComparison1 G M

/-- **Layer 4, the comparison cocone,** whose point is `H¹(G, M)` itself:
`TauCeti.ContCohomology.explicitFiniteQuotientCocone1`. -/
noncomputable abbrev explicitFiniteQuotientCocone1 :
    Limits.Cocone (explicitFiniteQuotientSystem1 G M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientCocone1 G M

/-- **Layer 4, the colimit theorem** `H¹(G, M) ≅ colim_U H¹(G ⧸ U, M^U)`, in the form that says the
comparison cocone is universal. Degrees 0 and 2 have the same shape, with `H0` and `H2` in place of
`H1`; degree 2 is where `CompactSpace` is genuinely used, because descending both variables at once
is uniform local constancy on `G × G`. Surjectivity of the comparison is strict: a continuous
cocycle is itself inflated from a finite level, with no coboundary subtracted, and a coboundary
enters only in the injectivity half. Tau Ceti's
`TauCeti.ContCohomology.explicitFiniteQuotientColimit1`. -/
noncomputable abbrev explicitFiniteQuotientColimit1 :
    Limits.IsColimit (explicitFiniteQuotientCocone1 G M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientColimit1 G M

/-- **Layer 4, the finite-quotient system in degree 2,**
`TauCeti.ContCohomology.explicitFiniteQuotientSystem2`. -/
noncomputable abbrev explicitFiniteQuotientSystem2 :
    (OpenNormalSubgroup G)ᵒᵖ ⥤ AddCommGrpCat.{u} :=
  TauCeti.ContCohomology.explicitFiniteQuotientSystem2 G M

theorem explicitFiniteQuotientSystem2_obj (U : OpenNormalSubgroup G) :
    (explicitFiniteQuotientSystem2 G M).obj (Opposite.op U) =
      AddCommGrpCat.of (H2 (G ⧸ U.toSubgroup) (Invariants U.toSubgroup M)) :=
  rfl

theorem explicitFiniteQuotientSystem2_map {U V : (OpenNormalSubgroup G)ᵒᵖ} (f : U ⟶ V) :
    (explicitFiniteQuotientSystem2 G M).map f = AddCommGrpCat.ofHom
      (explicitFiniteQuotientTransition2 G M U.unop V.unop (leOfHom f.unop)) :=
  rfl

/-- **Layer 4, the named comparison legs in degree 2,**
`TauCeti.ContCohomology.explicitFiniteQuotientComparison2`, whose component at `U` is
`explicitInfl2` (`explicitFiniteQuotientComparison2_app`). -/
noncomputable abbrev explicitFiniteQuotientComparison2 :
    explicitFiniteQuotientSystem2 G M ⟶
      (Functor.const ((OpenNormalSubgroup G)ᵒᵖ)).obj (AddCommGrpCat.of (H2 G M)) :=
  TauCeti.ContCohomology.explicitFiniteQuotientComparison2 G M

/-- `TauCeti.ContCohomology.explicitFiniteQuotientCocone2`. -/
noncomputable abbrev explicitFiniteQuotientCocone2 :
    Limits.Cocone (explicitFiniteQuotientSystem2 G M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientCocone2 G M

/-- **Layer 4, universality of the degree-2 comparison cocone,**
`TauCeti.ContCohomology.explicitFiniteQuotientColimit2`. -/
noncomputable abbrev explicitFiniteQuotientColimit2 :
    Limits.IsColimit (explicitFiniteQuotientCocone2 G M) :=
  TauCeti.ContCohomology.explicitFiniteQuotientColimit2 G M

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
relaxed. It is Tau Ceti's `TauCeti.ContCohomology.DiscreteShortExact`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean`), with the fields
`incl`, `proj`, `incl_equivariant`, `proj_equivariant`, `incl_injective`, `proj_surjective` and
`exact : Function.Exact incl proj`. The two maps carry no continuity field: between discrete
modules every map is continuous (`continuous_of_discreteTopology`). -/
abbrev DiscreteShortExact (G : Type u) [Group G] [TopologicalSpace G]
    (A : Type u) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A] [DistribMulAction G A]
    (B : Type u) [AddCommGroup B] [TopologicalSpace B] [DiscreteTopology B] [DistribMulAction G B]
    (C : Type u) [AddCommGroup C] [TopologicalSpace C] [DiscreteTopology C]
    [DistribMulAction G C] :=
  TauCeti.ContCohomology.DiscreteShortExact G A B C

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
name the same one. Tau Ceti's `TauCeti.ContCohomology.DiscreteShortExact.restrict`. -/
abbrev DiscreteShortExact.restrict (S : DiscreteShortExact G A B C) (T : Subgroup G) :
    DiscreteShortExact T A B C :=
  TauCeti.ContCohomology.DiscreteShortExact.restrict S T

/-- **Layer 10, the coefficient short complex in `TopRep`,** Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.toShortComplex`: its two maps are `ofDiscreteModuleMap`
of `incl` and `proj`. -/
noncomputable abbrev DiscreteShortExact.toShortComplex (S : DiscreteShortExact G A B C) :
    ShortComplex (TopRep ℤ G) :=
  TauCeti.ContCohomology.DiscreteShortExact.toShortComplex S

/-- **Layer 10, the bundled coefficient short complex is short exact.** -/
theorem DiscreteShortExact.toShortComplex_shortExact (S : DiscreteShortExact G A B C) :
    (S.toShortComplex G A B C).ShortExact :=
  sorry

/-- **Layer 10, the short complex of canonical homogeneous-cochain complexes,** Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact`, the image of the
coefficient short complex under the cochain functor. -/
noncomputable abbrev continuousCochainsShortExact (S : DiscreteShortExact G A B C) :
    ShortComplex (CochainComplex (TopModuleCat.{u} ℤ) ℕ) :=
  TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact S

/-- **Layer 10, degreewise short exactness of the canonical cochain complexes.** This is the
input to Mathlib's `HomologicalComplex.HomologySequence`; it is not supplied by the carrier. -/
theorem continuousCochainsShortExact_shortExact (S : DiscreteShortExact G A B C) :
    (continuousCochainsShortExact G A B C S).ShortExact :=
  sorry

/-- **Layer 5, the connecting map `δ⁰ : H⁰(G, C) → H¹(G, A)`.** Choose a preimage in `B` of an
invariant of `C` and apply `d⁰`; the result lands in `A` because the class of the preimage in `C`
is invariant. Tau Ceti's `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0`; the long exact
sequence of this layer, its naturality under restriction and its agreement with Layer 10's `delta`
are Tau Ceti's, in `ShortExact.lean`, `LongExact.lean`, `DeltaNaturality.lean` and
`ConnectingMapComparison.lean`. -/
noncomputable abbrev explicitDelta0 (S : DiscreteShortExact G A B C) : H0 G C →+ H1 G A :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0 S

/-- **Layer 5, `δ⁰` on representatives,** mirroring the pin's `δ₀_apply` so that the discrete and
the continuous theories are used identically. The cochain `a` is determined by `b` because `incl`
is injective, so this pins the normalization rather than merely permitting one. -/
theorem explicitDelta0_apply (S : DiscreteShortExact G A B C) (c : H0 G C) (b : B)
    (hb : S.proj b = (c : C)) (a : G → A) (ha : ∀ g : G, S.incl (a g) = g • b - b)
    (hmem : a ∈ Z1 G A) :
    explicitDelta0 G A B C S c = H1pi G A ⟨a, hmem⟩ :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_apply S c hb hmem ha

/-- **Layer 5, the connecting map `δ¹ : H¹(G, C) → H²(G, A)`.** -/
noncomputable abbrev explicitDelta1 (S : DiscreteShortExact G A B C) : H1 G C →+ H2 G A :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1 S

/-- **Layer 5, `δ¹` on representatives,** mirroring the pin's `δ₁_apply`. The 1-cochain `e` is a
continuous lift of the cocycle `f`, which exists by the cochain-lifting statement above, and `d¹ e`
takes its values in the image of `A`. -/
theorem explicitDelta1_apply (S : DiscreteShortExact G A B C) (f : Z1 G C)
    (e : G → B) (he : Continuous e) (hef : ∀ g : G, S.proj (e g) = (f : G → C) g)
    (a : G × G → A) (ha : ∀ q : G × G, S.incl (a q) = d1 G B e q) (hmem : a ∈ Z2 G A) :
    explicitDelta1 G A B C S (H1pi G C f) = H2pi G A ⟨a, hmem⟩ :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1_apply S f he hef hmem
    fun g h => (ha (g, h)).trans (TauCeti.ContCohomology.d1_apply e g h)

/-- **Layer 5, exactness at `H⁰(G, A)`,** the first of the eight nodes (NSW (1.3.2)). -/
theorem explicitLongExact_H0A (S : DiscreteShortExact G A B C) :
    Function.Injective
      (explicitCoeff0 G A B S.incl continuous_of_discreteTopology S.incl_equivariant) :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0A S

/-- **Layer 5, exactness at `H⁰(G, B)`.** -/
theorem explicitLongExact_H0B (S : DiscreteShortExact G A B C) :
    (explicitCoeff0 G A B S.incl continuous_of_discreteTopology S.incl_equivariant).range =
      (explicitCoeff0 G B C S.proj continuous_of_discreteTopology S.proj_equivariant).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0B S

/-- **Layer 5, exactness at `H⁰(G, C)`,** where `δ⁰` leaves. -/
theorem explicitLongExact_H0C (S : DiscreteShortExact G A B C) :
    (explicitCoeff0 G B C S.proj continuous_of_discreteTopology S.proj_equivariant).range =
      (explicitDelta0 G A B C S).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0C S

/-- **Layer 5, exactness at `H¹(G, A)`,** where `δ⁰` lands. -/
theorem explicitLongExact_H1A (S : DiscreteShortExact G A B C) :
    (explicitDelta0 G A B C S).range =
      (explicitCoeff1 G A B S.incl continuous_of_discreteTopology S.incl_equivariant).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1A S

/-- **Layer 5, exactness at `H¹(G, B)`.** -/
theorem explicitLongExact_H1B (S : DiscreteShortExact G A B C) :
    (explicitCoeff1 G A B S.incl continuous_of_discreteTopology S.incl_equivariant).range =
      (explicitCoeff1 G B C S.proj continuous_of_discreteTopology S.proj_equivariant).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1B S

/-- **Layer 5, exactness at `H¹(G, C)`,** where `δ¹` leaves. -/
theorem explicitLongExact_H1C (S : DiscreteShortExact G A B C) :
    (explicitCoeff1 G B C S.proj continuous_of_discreteTopology S.proj_equivariant).range =
      (explicitDelta1 G A B C S).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1C S

/-- **Layer 5, exactness at `H²(G, A)`,** where `δ¹` lands. -/
theorem explicitLongExact_H2A (S : DiscreteShortExact G A B C) :
    (explicitDelta1 G A B C S).range =
      (explicitCoeff2 G A B S.incl continuous_of_discreteTopology S.incl_equivariant).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H2A S

/-- **Layer 5, exactness at `H²(G, B)`,** the eighth and last node. -/
theorem explicitLongExact_H2B (S : DiscreteShortExact G A B C) :
    (explicitCoeff2 G A B S.incl continuous_of_discreteTopology S.incl_equivariant).range =
      (explicitCoeff2 G B C S.proj continuous_of_discreteTopology S.proj_equivariant).ker :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H2B S

/-- **Layer 5, restriction commutes with `δ⁰`.** -/
theorem explicitDelta0_res (S : DiscreteShortExact G A B C) (T : Subgroup G) (x : H0 G C) :
    explicitRes1 G A T (explicitDelta0 G A B C S x) =
      explicitDelta0 T A B C (S.restrict G A B C T) (explicitRes0 G C T x) :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_res S T x

/-- **Layer 5, restriction commutes with `δ¹`.** -/
theorem explicitDelta1_res (S : DiscreteShortExact G A B C) (T : Subgroup G) (x : H1 G C) :
    explicitRes2 G A T (explicitDelta1 G A B C S x) =
      explicitDelta1 T A B C (S.restrict G A B C T) (explicitRes1 G C T x) :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1_res S T x

/-- **Layer 6, corestriction commutes with `δ⁰`** (NSW (1.5.2)). The sequence on `U` is the
restriction of the sequence on `G`, so both sides name the same two coefficient maps. Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean`). -/
theorem explicitCor_delta0 (S : DiscreteShortExact G A B C) (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)]
    (x : H0 U.toSubgroup C) :
    explicitCor1 G A U
        (explicitDelta0 U.toSubgroup A B C (S.restrict G A B C U.toSubgroup) x) =
      explicitDelta0 G A B C S (explicitCor0 G C U x) :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0 S U.toSubgroup U.isOpen x

/-- **Layer 6, corestriction commutes with `δ¹`:** Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta1`. -/
theorem explicitCor_delta1 (S : DiscreteShortExact G A B C) (U : OpenSubgroup G)
    [Fintype (G ⧸ U.toSubgroup)]
    (y : H1 U.toSubgroup C) :
    explicitCor2 G A U
        (explicitDelta1 U.toSubgroup A B C (S.restrict G A B C U.toSubgroup) y) =
      explicitDelta1 G A B C S (explicitCor1 G C U y) :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta1 S U.toSubgroup U.isOpen y

/-- **Layer 10, the connecting map of the long exact sequence in every degree,** against the
canonical object. Layer 5 builds degrees 0 and 1 on the explicit model; this is the all-degree
map they agree with, and the two agreements below are what stop a consumer from having to prove
that two connecting maps coincide. It is Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.delta`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/HomologySequence.lean`), the snake-lemma
connecting map of the short exact sequence of homogeneous cochains. -/
noncomputable abbrev delta [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (n : ℕ) :
    (continuousCohomology ℤ G n).obj (ofDiscreteModule G C) ⟶
      (continuousCohomology ℤ G (n + 1)).obj (ofDiscreteModule G A) :=
  TauCeti.ContCohomology.DiscreteShortExact.delta S n

/-- **Layer 10, exactness of the all-degree long exact sequence at its three repeating nodes.** -/
theorem longExact_exact [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (n : ℕ) :
    Function.Exact
        ((continuousCohomology ℤ G n).map
          (ofDiscreteModuleMap G B C S.proj continuous_of_discreteTopology
            S.proj_equivariant)).hom
        (delta G A B C S n).hom ∧
      Function.Exact (delta G A B C S n).hom
        ((continuousCohomology ℤ G (n + 1)).map
          (ofDiscreteModuleMap G A B S.incl continuous_of_discreteTopology
            S.incl_equivariant)).hom ∧
      Function.Exact
        ((continuousCohomology ℤ G n).map
          (ofDiscreteModuleMap G A B S.incl continuous_of_discreteTopology
            S.incl_equivariant)).hom
        ((continuousCohomology ℤ G n).map
          (ofDiscreteModuleMap G B C S.proj continuous_of_discreteTopology
            S.proj_equivariant)).hom :=
  ⟨TauCeti.ContCohomology.DiscreteShortExact.longExact_exact₃ S n,
    TauCeti.ContCohomology.DiscreteShortExact.longExact_exact₁ S n,
    TauCeti.ContCohomology.DiscreteShortExact.longExact_exact₂ S n⟩

/-- **Layer 10, naturality of `delta` in a morphism of short exact coefficient complexes.** -/
theorem delta_naturality [CompactSpace G] [TotallyDisconnectedSpace G]
    (S T : DiscreteShortExact G A B C)
    (F : S.toShortComplex G A B C ⟶ T.toShortComplex G A B C) (n : ℕ) :
    delta G A B C S n ≫ (continuousCohomology ℤ G (n + 1)).map F.τ₁ =
      (continuousCohomology ℤ G n).map F.τ₃ ≫ delta G A B C T n :=
  sorry

/-- **Layer 10, restriction commutes with the all-degree connecting map,** Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.delta_res`. The restricted canonical object and the
canonical object over `T` are equal on the nose (`TauCeti.res_ofDiscreteModule`), so the square
needs no coefficient isomorphism. -/
theorem delta_res [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (T : Subgroup G)
    [CompactSpace T] [TotallyDisconnectedSpace T] (n : ℕ) :
    delta G A B C S n ≫ res ℤ T (ofDiscreteModule G A) (n + 1) =
      res ℤ T (ofDiscreteModule G C) n ≫ delta T A B C (S.restrict G A B C T) n :=
  TauCeti.ContCohomology.DiscreteShortExact.delta_res S T n

/-- **Layer 10, inflation commutes with the all-degree connecting map.** `SN` is the induced short
exact sequence on `N`-invariants; its existence is carried explicitly because invariants do not
preserve an arbitrary epimorphism without this exactness hypothesis. Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.delta_infl`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/ConnectingMap.lean`). -/
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
  TauCeti.ContCohomology.DiscreteShortExact.delta_infl S N SN hincl hproj n

/-- **Layer 3, the explicit and canonical connecting maps agree in degree 0,** Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/ConnectingMapComparison.lean`). -/
theorem explicitIso_delta0 [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (x : H0 G C) :
    (delta G A B C S 0).hom ((explicitH0IsoContinuousCohomology G C).hom.hom x) =
      (explicitH1IsoContinuousCohomology G A).hom.hom
        (explicitDelta0 G A B C S x : DiscreteH1 G A) :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0 S x

/-- **Layer 3, the explicit and canonical connecting maps agree in degree 1,** Tau Ceti's
`TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1`. -/
theorem explicitIso_delta1 [CompactSpace G] [TotallyDisconnectedSpace G]
    (S : DiscreteShortExact G A B C) (x : DiscreteH1 G C) :
    (delta G A B C S 1).hom ((explicitH1IsoContinuousCohomology G C).hom.hom x) =
      (explicitH2IsoContinuousCohomology G A).hom.hom
        (explicitDelta1 G A B C S (discreteH1Equiv G C x) : DiscreteH2 G A) :=
  TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1 S x

end LowDegreeExactSequence

section FiveTermSequence

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
  (N : Subgroup G) [N.Normal] [IsTopologicalGroup (G ⧸ N)]
  [ContinuousSMul (G ⧸ N) (Invariants N M)]

/-! The five-term sequence of this section is Tau Ceti's: inflation and the three-term sequence in
`TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean`, the conjugation
invariants and the invariant-valued restriction in `FiveTerm.lean`, and the transgression with the
two remaining exactness statements in `Transgression.lean`. Every declaration below is an alias of,
or has the proof of, the Tau Ceti declaration of the same name. -/

/-- **Layer 5, inflation is injective in degree 1,** the left end of the inflation-restriction
sequence. Valid for an arbitrary topological group with discrete coefficients.
`TauCeti.ContCohomology.explicitInfl1_injective`. -/
theorem explicitInfl1_injective : Function.Injective (explicitInfl1 G M N) :=
  TauCeti.ContCohomology.explicitInfl1_injective G M N

/-- **Layer 5, the inflation-restriction sequence** `0 → H¹(G ⧸ N, M^N) → H¹(G, M) → H¹(N, M)`, with
the pin's discrete `H1InfRes_exact` as the model. This three-term statement keeps the wider
generality; the five-term extension below does not.
`TauCeti.ContCohomology.explicitInfRes_exact`. -/
theorem explicitInfRes_exact :
    (explicitInfl1 G M N).range = (explicitRes1 G M N).ker :=
  TauCeti.ContCohomology.explicitInfRes_exact G M N

/-- **Layer 5, the image of restriction is `G ⧸ N`-invariant,**
`TauCeti.ContCohomology.explicitRes1_mem_conjInvariants`. -/
theorem explicitRes1_mem_conjInvariants (x : H1 G M) :
    explicitRes1 G M N x ∈ H1ConjInvariants G M N :=
  TauCeti.ContCohomology.explicitRes1_mem_conjInvariants G M N x

/-- **Layer 5, restriction as a map into the invariants,** the third arrow of the five-term
sequence: `TauCeti.ContCohomology.explicitResConj1`, the codomain restriction of `explicitRes1`
(`TauCeti.ContCohomology.coe_explicitResConj1`). -/
noncomputable abbrev explicitResConj1 : H1 G M →+ H1ConjInvariants G M N :=
  TauCeti.ContCohomology.explicitResConj1 G M N

/-- **Layer 5, exactness at `H¹(G, M)` with the invariant-valued restriction:** the kernel of
`explicitResConj1` is the image of inflation. This is `explicitInfRes_exact` read with the codomain
the five-term sequence uses, and it is that sequence's second node.
`TauCeti.ContCohomology.explicitInfResConj_exact`. -/
theorem explicitInfResConj_exact :
    (explicitInfl1 G M N).range = (explicitResConj1 G M N).ker :=
  TauCeti.ContCohomology.explicitInfResConj_exact G M N

/-- **Layer 5, the section-dependent lift used by transgression,**
`TauCeti.ContCohomology.transgressionLift`. It is a continuous 1-cochain on `G` extending a
representative `c` on `N` of a conjugation-invariant class; its differential is `N`-invariant and
descends to the quotient. A lift is built from a representative and not from a class, which is why
`c` and the invariance `hc` of its class are the inputs, and the construction uses compactness of
`N`, which a closed subgroup of a profinite group has. -/
noncomputable abbrev transgressionLift [CompactSpace G] (hN : IsCompact (N : Set G))
    (s : G ⧸ N → G) (hs_cont : Continuous s) (hs : ∀ q, QuotientGroup.mk (s q) = q)
    (c : Z1 N M) (hc : (c : H1 N M) ∈ H1ConjInvariants G M N) : C1 G M :=
  TauCeti.ContCohomology.transgressionLift G M N hN s hs_cont hs c hc

/-- **Layer 5, the raw transgression 2-cochain,** obtained by differentiating
`transgressionLift` and descending through the chosen continuous section:
`TauCeti.ContCohomology.transgressionCochain`. -/
noncomputable abbrev transgressionCochain [CompactSpace G] (hN : IsCompact (N : Set G))
    (s : G ⧸ N → G) (hs_cont : Continuous s) (hs : ∀ q, QuotientGroup.mk (s q) = q)
    (c : Z1 N M) (hc : (c : H1 N M) ∈ H1ConjInvariants G M N) :
    C2 (G ⧸ N) (Invariants N M) :=
  TauCeti.ContCohomology.transgressionCochain G M N hN s hs_cont hs c hc

/-- **Layer 5, the lift-and-differentiate application formula.** This pins the normalization of
the raw transgression before quotienting: after inclusion `M^N ↪ M`, its value is `d¹` of the
named lift at the chosen representatives. `TauCeti.ContCohomology.transgressionCochain_apply`. -/
theorem transgressionCochain_apply [CompactSpace G] (hN : IsCompact (N : Set G))
    (s : G ⧸ N → G) (hs_cont : Continuous s) (hs : ∀ q, QuotientGroup.mk (s q) = q)
    (c : Z1 N M) (hc : (c : H1 N M) ∈ H1ConjInvariants G M N) (q r : G ⧸ N) :
    (((transgressionCochain G M N hN s hs_cont hs c hc).1 (q, r) : Invariants N M) : M) =
      d1 G M (transgressionLift G M N hN s hs_cont hs c hc) (s q, s r) :=
  TauCeti.ContCohomology.transgressionCochain_apply G M N hN s hs_cont hs c hc q r

/-- **Layer 5, the raw transgression is a cocycle,**
`TauCeti.ContCohomology.transgressionCochain_isCocycle`. -/
theorem transgressionCochain_isCocycle [CompactSpace G] (hN : IsCompact (N : Set G))
    (s : G ⧸ N → G) (hs_cont : Continuous s) (hs : ∀ q, QuotientGroup.mk (s q) = q)
    (c : Z1 N M) (hc : (c : H1 N M) ∈ H1ConjInvariants G M N) :
    (transgressionCochain G M N hN s hs_cont hs c hc :
      (G ⧸ N) × (G ⧸ N) → Invariants N M) ∈ Z2 (G ⧸ N) (Invariants N M) :=
  TauCeti.ContCohomology.transgressionCochain_isCocycle G M N hN s hs_cont hs c hc

/-- The raw cochain bundled as a 2-cocycle, `TauCeti.ContCohomology.transgressionCocycle`. -/
noncomputable abbrev transgressionCocycle [CompactSpace G] (hN : IsCompact (N : Set G))
    (s : G ⧸ N → G) (hs_cont : Continuous s) (hs : ∀ q, QuotientGroup.mk (s q) = q)
    (c : Z1 N M) (hc : (c : H1 N M) ∈ H1ConjInvariants G M N) :
    Z2 (G ⧸ N) (Invariants N M) :=
  TauCeti.ContCohomology.transgressionCocycle G M N hN s hs_cont hs c hc

/-- **Layer 5, change of section and of representative is an explicit coboundary.** This is
proved before passing to `H²`; it is the choice-independence mechanism for the public
transgression. `TauCeti.ContCohomology.transgressionCochain_sub_mem_B2`. -/
theorem transgressionCochain_sub_mem_B2 [CompactSpace G] (hN : IsCompact (N : Set G))
    (s s' : G ⧸ N → G) (hs_cont : Continuous s) (hs'_cont : Continuous s')
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (hs' : ∀ q, QuotientGroup.mk (s' q) = q)
    (c c' : Z1 N M) (hc : (c : H1 N M) ∈ H1ConjInvariants G M N)
    (hc' : (c' : H1 N M) ∈ H1ConjInvariants G M N) (hcc' : (c : H1 N M) = c') :
    (transgressionCochain G M N hN s hs_cont hs c hc :
        (G ⧸ N) × (G ⧸ N) → Invariants N M) -
      transgressionCochain G M N hN s' hs'_cont hs' c' hc' ∈ B2 (G ⧸ N) (Invariants N M) :=
  TauCeti.ContCohomology.transgressionCochain_sub_mem_B2 G M N hN s s' hs_cont hs'_cont hs hs'
    c c' hc hc' hcc'

/-- **Layer 5, the transgression** `tg : H¹(N, M)^{G ⧸ N} → H²(G ⧸ N, M^N)`, defined by lifting a
representative cocycle on `N` through a **continuous section** of `G → G ⧸ N` supplied by Layer 0
and differentiating, and independent of the section and the representative as an identity of
classes. Profiniteness of `G` and closedness of `N` are genuine hypotheses: the section is what
they provide and what fails for an arbitrary topological group.
`TauCeti.ContCohomology.transgression`. -/
noncomputable abbrev transgression [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) :
    H1ConjInvariants G M N →+ H2 (G ⧸ N) (Invariants N M) :=
  TauCeti.ContCohomology.transgression G M N hN

/-- **Layer 5, the public transgression is the class of the raw cochain,** for every continuous
section and every representative: `TauCeti.ContCohomology.transgression_apply`. -/
theorem transgression_apply [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (s : G ⧸ N → G) (hs_cont : Continuous s)
    (hs : ∀ q, QuotientGroup.mk (s q) = q) (y : H1ConjInvariants G M N) (c : Z1 N M)
    (hc : (c : H1 N M) = y) :
    transgression G M N hN y =
      H2pi (G ⧸ N) (Invariants N M)
        (transgressionCocycle G M N hN.isCompact s hs_cont hs c (hc ▸ y.2)) :=
  TauCeti.ContCohomology.transgression_apply G M N hN s hs_cont hs y c hc

/-- **Layer 5, the five-term sequence is exact at `H¹(N, M)^{G ⧸ N}`** (NSW (1.6.7)),
`TauCeti.ContCohomology.fiveTerm_exact_H1N`. -/
theorem fiveTerm_exact_H1N [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) :
    (explicitResConj1 G M N).range = (transgression G M N hN).ker :=
  TauCeti.ContCohomology.fiveTerm_exact_H1N G M N hN

/-- **Layer 5, the five-term sequence is exact at `H²(G ⧸ N, M^N)`,**
`TauCeti.ContCohomology.fiveTerm_exact_H2Q`. With `explicitInfl1_injective`,
`explicitInfResConj_exact` and the previous statement this is exactness of
`0 → H¹(G⧸N, M^N) → H¹(G, M) → H¹(N, M)^{G⧸N} → H²(G⧸N, M^N) → H²(G, M)` at every node. -/
theorem fiveTerm_exact_H2Q [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) :
    (transgression G M N hN).range = (explicitInfl2 G M N).ker :=
  TauCeti.ContCohomology.fiveTerm_exact_H2Q G M N hN

/-- **Layer 5, the transgression against restriction on the left,** one of its two
compatibilities: `TauCeti.ContCohomology.transgression_explicitResConj1`. -/
theorem transgression_explicitResConj1 [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (x : H1 G M) :
    transgression G M N hN (explicitResConj1 G M N x) = 0 :=
  TauCeti.ContCohomology.transgression_explicitResConj1 G M N hN x

/-- **Layer 5, the transgression against inflation on the right,** the other one:
`TauCeti.ContCohomology.explicitInfl2_transgression`. -/
theorem explicitInfl2_transgression [CompactSpace G] [TotallyDisconnectedSpace G]
    (hN : IsClosed (N : Set G)) (y : H1ConjInvariants G M N) :
    explicitInfl2 G M N (transgression G M N hN y) = 0 :=
  TauCeti.ContCohomology.explicitInfl2_transgression G M N hN y

end FiveTermSequence

/-! ### Layer 6: the corestriction transversal calculus -/

/-- **Layer 6, the transversal word** `ℓᵗ_u(γ) = (t u)⁻¹ * γ * t (γ⁻¹ • u)`, for a
**variable** transversal `t : G ⧸ U → G`. The transversal is a variable and not `Quotient.out`
from the start, because independence of the transversal is a theorem of Layer 6 and cannot
even be stated otherwise. Tau Ceti's `TauCeti.lWord`
(`TauCeti/GroupTheory/TransversalWord.lean`), with `TauCeti.transversal_mul_lWord`, and its
continuity for open `U` is `TauCeti.continuous_lWord`. -/
abbrev lWord {G : Type*} [Group G] (U : Subgroup G) (t : G ⧸ U → G) (u : G ⧸ U) (γ : G) : G :=
  TauCeti.lWord U t u γ

/-- **Layer 6, the transversal word takes its value in `U`,** Tau Ceti's `TauCeti.lWord_mem`. -/
theorem lWord_mem {G : Type*} [Group G] (U : Subgroup G) (t : G ⧸ U → G)
    (ht : ∀ x : G ⧸ U, QuotientGroup.mk (t x) = x) (u : G ⧸ U) (γ : G) : lWord U t u γ ∈ U :=
  TauCeti.lWord_mem U t ht u γ

/-- **Layer 6, the transversal 1-cocycle law.** `ℓᵗ_u(γ) * ℓᵗ_{γ⁻¹ • u}(η) = ℓᵗ_u(γ * η)`:
pure group theory, with no normality, no finite index, and no condition on `t` at all. This
identity is why the degree-2 corestriction sum is a cocycle. Tau Ceti's
`TauCeti.lWord_mul_lWord`. -/
example {G : Type*} [Group G] (U : Subgroup G) (t : G ⧸ U → G) (u : G ⧸ U) (γ η : G) :
    lWord U t u γ * lWord U t (γ⁻¹ • u) η = lWord U t u (γ * η) :=
  TauCeti.lWord_mul_lWord U t u γ η

attribute [local instance] Subgroup.fintypeQuotientOfFiniteIndex in
/-- **Layer 6, corestriction in degree 1, with general coefficients.** The corestriction of a
1-cocycle of `U` is `(cor¹_t f) γ = ∑ u, t u • f (ℓᵗ_u γ)`, and the factor `t u •` is forced:
the proof rewrites `t u * ℓᵗ_u(γ) = γ * t (γ⁻¹ • u)` and reindexes, and without the action
the sum is not a cocycle. A trivial-action formula that omits the factor is correct for trivial
coefficients and wrong in general. The input is a cocycle **on `U`**, since that is all a
class of `H¹(U, M)` is, and the transversal word is fed to it through its membership proof. The
sum is Tau Ceti's cochain `TauCeti.ContCohomology.cochainsCor1`, a cocycle by
`cochainsCor1_isCocycle₁` and continuous by `continuous_cochainsCor1`. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {M : Type*} [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M]
    (U : OpenSubgroup G) [U.toSubgroup.FiniteIndex] (t : G ⧸ U.toSubgroup → G)
    (ht : ∀ x : G ⧸ U.toSubgroup, QuotientGroup.mk (t x) = x)
    (f : U.toSubgroup → M) (hf : Continuous f) (hcoc : groupCohomology.IsCocycle₁ f) :
    groupCohomology.IsCocycle₁
        (fun γ : G ↦ ∑ u : G ⧸ U.toSubgroup, t u • f ⟨lWord U.toSubgroup t u γ,
          lWord_mem U.toSubgroup t ht u γ⟩) ∧
      Continuous (fun γ : G ↦ ∑ u : G ⧸ U.toSubgroup, t u • f ⟨lWord U.toSubgroup t u γ,
        lWord_mem U.toSubgroup t ht u γ⟩) :=
  ⟨TauCeti.ContCohomology.cochainsCor1_isCocycle₁ G M U.toSubgroup t ht hcoc,
    TauCeti.ContCohomology.continuous_cochainsCor1 G M U.toSubgroup t ht U.isOpen hf⟩

attribute [local instance] Subgroup.fintypeQuotientOfFiniteIndex in
/-- **Layer 6, `cor ∘ res` is the index only after passing to cohomology.** On cochains the
composite differs from `(G : U) • f` by the coboundary of `c = ∑ u, f (t u)`, so the roadmap
states `cor ∘ res = (G : U) • id` on `H⁰`, `H¹` and `H²` and never as a cochain identity in
positive degrees. The analogous degree-2 statement replaces `c` by an explicit continuous
1-cochain (Tau Ceti's `TauCeti.ContCohomology.cochainsCor2_res`). Here `f` is a cocycle on all of
`G`, since the composite starts by restricting it. Tau Ceti's
`TauCeti.ContCohomology.cochainsCor1_res`, evaluated at `γ`. -/
example {G : Type*} [Group G] {M : Type*} [AddCommGroup M] [DistribMulAction G M]
    (U : Subgroup G) [U.FiniteIndex] (t : G ⧸ U → G)
    (ht : ∀ x : G ⧸ U, QuotientGroup.mk (t x) = x)
    (f : G → M) (hf : groupCohomology.IsCocycle₁ f) (γ : G) :
    ∑ u : G ⧸ U, t u • f (lWord U t u γ) =
      U.index • f γ + (γ • (∑ v : G ⧸ U, f (t v)) - ∑ v : G ⧸ U, f (t v)) := by
  have h := congrFun (TauCeti.ContCohomology.cochainsCor1_res G M U t ht hf) γ
  simpa [TauCeti.ContCohomology.d0_apply, Finset.smul_sum] using h

section LowDegreeCorestrictionLaws

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
  (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]

/-- **Layer 6, `cor ∘ res = index` in degree 0:** Tau Ceti's
`TauCeti.ContCohomology.explicitCor0_comp_res0`. -/
theorem explicitCor_comp_res0 (x : H0 G M) :
    explicitCor0 G M U (explicitRes0 G M U.toSubgroup x) = U.toSubgroup.index • x :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor0_comp_res0 G M U.toSubgroup x

/-- **Layer 6, `cor ∘ res = index` in degree 1,** after the explicit coboundary correction
`TauCeti.ContCohomology.cochainsCor1_res`: Tau Ceti's
`TauCeti.ContCohomology.explicitCor1_comp_res1`. -/
theorem explicitCor_comp_res1 (x : H1 G M) :
    explicitCor1 G M U (explicitRes1 G M U.toSubgroup x) = U.toSubgroup.index • x :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor1_comp_res1 G M U.toSubgroup U.isOpen x

/-- **Layer 6, `cor ∘ res = index` in degree 2,** after the explicit 1-cochain correction
`TauCeti.ContCohomology.cochainsCor2_res`: Tau Ceti's
`TauCeti.ContCohomology.explicitCor2_comp_res2`. -/
theorem explicitCor_comp_res2 (x : H2 G M) :
    explicitCor2 G M U (explicitRes2 G M U.toSubgroup x) = U.toSubgroup.index • x :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCor2_comp_res2 G M U.toSubgroup U.isOpen x

end LowDegreeCorestrictionLaws

/-! ### Layer 7: coinduction -/

/-- **Layer 7, uniform local constancy.** On a compact topological group a locally constant
function is uniformly locally constant: its stabilizer under right translation is open. This
is why the coinduced module `Coind_H^G A` of locally constant `H`-equivariant maps is again a
*discrete* `G`-module, which the Shapiro layer needs. Tau Ceti's
`TauCeti.isOpen_rightTranslationStabilizer`
(`TauCeti/Topology/Algebra/Group/LocallyConstant.lean`), the set being the subgroup
`TauCeti.rightTranslationStabilizer f`. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    {A : Type*} (f : G → A) (hf : IsLocallyConstant f) :
    IsOpen {g : G | ∀ x : G, f (x * g) = f x} :=
  TauCeti.isOpen_rightTranslationStabilizer hf

/-- **Layer 7, the coinduced module.** The locally constant `H`-equivariant maps `G → A`, which
is Milne's `M_*` and Ribes-Zalesskii's `Coind_H^G`, with the right-translation action. The
previous statement is why it is again a *discrete* `G`-module. Tau Ceti's `TauCeti.coind`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced.lean`), with its action
`TauCeti.instDistribMulActionCoind`, its functoriality `TauCeti.coindMap` and its exactness
(`TauCeti.coindMap_injective`, `TauCeti.coindMap_range_eq_ker`, and `TauCeti.coindMap_surjective`
for closed `U`). The same group with the discrete topology is `TauCeti.DiscreteCoind G U A`
(`Coinduced/Discrete.lean`), a discrete `G`-module for compact `G`
(`TauCeti.DiscreteCoind.instContinuousSMul`), and it is the coefficient module of the explicit
Shapiro isomorphisms below. -/
abbrev Coind (G : Type*) [Group G] [TopologicalSpace G] (U : Subgroup G)
    (A : Type*) [AddCommGroup A] [DistribMulAction U A] : AddSubgroup (G → A) :=
  TauCeti.coind G U A

/-- **Layer 7, the trace on the underlying carrier,** `f ↦ ∑_{gU} g • f (g⁻¹)`: Tau Ceti's
`TauCeti.coindTrace`, which is `G`-equivariant (`TauCeti.coindTrace_smul`), natural in the
coefficients (`TauCeti.coindTrace_coindMap`), and computed along any transversal
(`TauCeti.coindTrace_eq_sum_transversal`). Tau Ceti takes `[U.FiniteIndex]`, which comes here from
the finite quotient. This is the elementwise formula; the object all-degree corestriction consumes
is the bundled `coindTrace` below, Tau Ceti's `TauCeti.coindTraceHom`, which acts by this map on
the discrete carrier (`TauCeti.coindTraceHom_apply`). -/
noncomputable abbrev coindTraceRaw {G : Type*} [Group G] [TopologicalSpace G] (U : Subgroup G)
    [Fintype (G ⧸ U)] (M : Type*) [AddCommGroup M] [DistribMulAction G M] :
    Coind G U M →+ M :=
  haveI : U.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.coindTrace G U

section ExplicitShapiro

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  (H : Subgroup G) (A : Type*) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A]
  [DistribMulAction H A] [ContinuousSMul H A]

/-- **Layer 7, explicit Shapiro in degree 0,** `H⁰(G, Coind_H^G A) ≃+ H⁰(H, A)`, on the discrete
carrier `TauCeti.DiscreteCoind G H A` of `Coind`: evaluation at `1`, with the constant functions
as inverse (`TauCeti.ContCohomology.explicitShapiro0_apply`, `explicitShapiro0_symm_apply`). Tau
Ceti's `TauCeti.ContCohomology.explicitShapiro0`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean`). This degree needs no
closedness of `H`. -/
noncomputable abbrev explicitShapiro0 : H0 G (TauCeti.DiscreteCoind G H A) ≃+ H0 H A :=
  TauCeti.ContCohomology.explicitShapiro0 G H A

/-- **Layer 7, explicit Shapiro in degree 1,** for a closed subgroup `H`. The forward map is
restriction to `H` followed by evaluation at `1`, the compatible-pair pullback `explicitMap1` at
that pair (`TauCeti.ContCohomology.explicitShapiro1_apply`, `explicitShapiroMap1`), and involves no
choice; the inverse is the section formula for **every** continuous right-coset factorization of
`G` over `H` (`TauCeti.ContCohomology.explicitShapiro1_symm_apply`), which is where Layer 0's
continuous section enters. Tau Ceti's `TauCeti.ContCohomology.explicitShapiro1`. -/
noncomputable abbrev explicitShapiro1 (hH : IsClosed (H : Set G)) :
    H1 G (TauCeti.DiscreteCoind G H A) ≃+ H1 H A :=
  TauCeti.ContCohomology.explicitShapiro1 G H A hH

/-- **Layer 7, explicit Shapiro in degree 2,** for a closed subgroup `H`, with the same forward map
and the normalized section formula for its inverse
(`TauCeti.ContCohomology.explicitShapiro2_symm_apply`). Tau Ceti's
`TauCeti.ContCohomology.explicitShapiro2`. -/
noncomputable abbrev explicitShapiro2 (hH : IsClosed (H : Set G)) :
    H2 G (TauCeti.DiscreteCoind G H A) ≃+ H2 H A :=
  TauCeti.ContCohomology.explicitShapiro2 G H A hH

end ExplicitShapiro

section AllDegreeCorestriction

open CategoryTheory

variable (R : Type v) [CommRing R] [TopologicalSpace R]
  {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 1, smooth discreteness is inherited by restriction to a subgroup.** The stabilizer of a
point for the subgroup is the intersection of its `G`-stabilizer with the subgroup. Layer 10 needs
it to feed restricted coefficients to coinduction. It is Tau Ceti's `TauCeti.IsSmoothDiscrete.res`
along the continuous inclusion of the subgroup. -/
theorem IsSmoothDiscrete.res (S : Subgroup G) {X : TopRep R G} (hX : IsSmoothDiscrete R X) :
    IsSmoothDiscrete R ((TopRep.resFunctor S.subtype).obj X) :=
  TauCeti.IsSmoothDiscrete.res (φ := S.subtype) continuous_subtype_val hX

/-- **Layer 10, the restricted coefficients as a smooth discrete object.** -/
noncomputable def resSmooth (S : Subgroup G) (X : TopRep R G) (hX : IsSmoothDiscrete R X) :
    SmoothDiscreteTopRep R S :=
  ⟨(TopRep.resFunctor S.subtype).obj X, hX.res R S⟩

/-- **Layer 7, the coinduced object, bundled.** `Coind_H^G A` with its right-translation action,
as a smooth discrete representation: Tau Ceti's `TauCeti.coindTopRep`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Functor.lean`), the discrete
carrier `TauCeti.DiscreteCoind` of `Coind` carried through Layer 1's dictionary. The coefficients
are **smooth discrete** on both sides, and that is not a convenience: the carrier `Coind` above is
the group of **locally constant** equivariant maps, which for a non-discrete coefficient object is
not the continuous coinduction, so an all-`TopRep` signature would advertise a construction this
one is not. Compactness of `G` gives smoothness of the result: uniform local constancy on a
**compact** group is what makes the right-translation stabilizer open, and without it a locally
constant function need have no common open translation stabilizer. The object needs no closedness
of `H`; closedness enters in exactness on the right and in Shapiro's lemma. -/
noncomputable abbrev coindTopRep (H : Subgroup G) (A : SmoothDiscreteTopRep R H) :
    SmoothDiscreteTopRep R G :=
  TauCeti.coindTopRep R G H A

/-- **Layer 7, coinduction is a functor** between the smooth discrete subcategories: Tau Ceti's
`TauCeti.coindFunctor`, whose counit is evaluation at `1` (`TauCeti.coindCounit`, natural as
`TauCeti.coindCounitNatTrans`). -/
noncomputable abbrev coindFunctor (H : Subgroup G) :
    SmoothDiscreteTopRep R H ⥤ SmoothDiscreteTopRep R G :=
  TauCeti.coindFunctor R G H

/-- **Layer 7, the functor agrees with the object construction,** Tau Ceti's
`TauCeti.coindFunctor_obj`. -/
theorem coindFunctor_obj (H : Subgroup G) (A : SmoothDiscreteTopRep R H) :
    (coindFunctor R H).obj A = coindTopRep R H A :=
  TauCeti.coindFunctor_obj R G H A

/-- **Layer 7, exactness of coinduction on a specified short exact sequence,** which is where
Layer 0's continuous section of `G → G ⧸ H` is used, and hence where closedness of `H` enters: an
injective map followed by a surjective one, exact at the middle object, is carried to maps with the
same three properties. Exactness at the middle object is part of the statement; preservation of
monomorphisms and epimorphisms alone is not a substitute. Tau Ceti's
`TauCeti.coindFunctor_map_shortExact` (`Coinduced/PreservesExactness.lean`), the functorial form of
`TauCeti.ContCohomology.DiscreteShortExact.coind`. -/
theorem coindFunctor_map_shortExact (H : Subgroup G) (hH : IsClosed (H : Set G))
    {A B C : SmoothDiscreteTopRep R H} (f : A ⟶ B) (g : B ⟶ C)
    (hf : Function.Injective f.hom.hom) (hg : Function.Surjective g.hom.hom)
    (hex : Function.Exact f.hom.hom g.hom.hom) :
    Function.Injective ((coindFunctor R H).map f).hom.hom ∧
      Function.Surjective ((coindFunctor R H).map g).hom.hom ∧
      Function.Exact ((coindFunctor R H).map f).hom.hom ((coindFunctor R H).map g).hom.hom :=
  TauCeti.coindFunctor_map_shortExact R G H hH f g hf hg hex

/-- **Layer 7, coinduction from a closed subgroup preserves epimorphisms.** The epimorphisms of
smooth discrete representations are the surjections, so this is the surjectivity half of
`coindFunctor_map_shortExact` read in the category. -/
theorem coindFunctor_preservesEpimorphisms (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    (coindFunctor R H).PreservesEpimorphisms :=
  sorry

/-- **Layer 7, coinduction preserves monomorphisms,** from any subgroup. The monomorphisms of smooth
discrete representations are the injections, and coinduction of an injective map is injective with
no hypothesis on `H` (`TauCeti.coindMap_injective`). -/
theorem coindFunctor_preservesMonomorphisms (H : Subgroup G) :
    (coindFunctor R H).PreservesMonomorphisms :=
  sorry

/-- **Layer 7, algebraic coinduction transported into the smooth-discrete topological
subcategory.** For open `U` this is Mathlib's `Representation.coind`, the coinduction of the
merged `RepresentationTheory/InductionRestriction` roadmap, with the discrete topology: Tau Ceti's
`TauCeti.algebraicCoindAsSmooth`, whose representation is Mathlib's `Representation.coind` on the
nose (`TauCeti.algebraicCoindDiscreteRep_ρ`). -/
noncomputable abbrev algebraicCoindAsSmooth (U : OpenSubgroup G)
    (A : SmoothDiscreteTopRep R U.toSubgroup) : SmoothDiscreteTopRep R G :=
  TauCeti.algebraicCoindAsSmooth R G U A

/-- **Layer 7, the topological/algebraic coinduction comparison for an open subgroup,** Tau Ceti's
`TauCeti.topologicalCoindIsoAlgebraic`: the identity on the underlying equivariant functions
(`TauCeti.topologicalCoindIsoAlgebraic_hom_hom_hom_apply_coe`), because for an open subgroup every
algebraically coinduced function is locally constant
(`TauCeti.isLocallyConstant_representationCoindV`). -/
noncomputable abbrev topologicalCoindIsoAlgebraic (U : OpenSubgroup G)
    (A : SmoothDiscreteTopRep R U.toSubgroup) :
    coindTopRep R U.toSubgroup A ≅ algebraicCoindAsSmooth R U A :=
  TauCeti.topologicalCoindIsoAlgebraic R G U A

/-- **Layer 10, the comparison cochain map of Shapiro's lemma.** The compatible pair of the
inclusion `H ↪ G` and the counit of coinduction, evaluation at `1` (Tau Ceti's
`TauCeti.coindCounit`), fed to Mathlib's `ContinuousCohomology.cochainsMap`: the cochain map
`σ ↦ ev₁ ∘ σ ∘ ι` from the homogeneous cochains of `G` with coefficients `Coind_H^G A` to those of
`H` with coefficients `A`. It is a quasi-isomorphism (`quasiIso_shapiroCochainMap`) and not an
isomorphism of complexes, and no isomorphism of the two complexes exists: for `G = C₂`, `H = 1`
and `A = 𝔽₂` the degree-0 terms are `Coind_1^{C₂} 𝔽₂ = 𝔽₂^{C₂}` and `𝔽₂`, of orders `4` and `2`,
a degree-0 homogeneous cochain being determined by its value at `1`
(`TauCeti.ContCohomology.cochainEquiv0`). -/
noncomputable abbrev shapiroCochainMap (H : Subgroup G) (A : SmoothDiscreteTopRep R H) :
    TopRep.homogeneousCochains ((smoothDiscreteι R G).obj (coindTopRep R H A)) ⟶
      TopRep.homogeneousCochains ((smoothDiscreteι R H).obj A) :=
  ContinuousCohomology.cochainsMap (TauCeti.ContinuousMonoidHom.subgroupSubtype H)
    (TopRep.ofHom (TauCeti.coindCounit R G H A))

/-- **Layer 10, the canonical Shapiro map** `Hⁿ(G, Coind_H^G A) ⟶ Hⁿ(H, A)` in every degree:
Mathlib's `ContinuousCohomology.map` at the same compatible pair, so it is the map
`shapiroCochainMap` induces on homology, restriction to `H` followed by the coefficient map of
evaluation at `1`. At `R = ℤ`, on the image of Layer 1's dictionary, it is Tau Ceti's
`TauCeti.ContinuousCohomology.shapiroMap`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/Canonical.lean`), which landed
after this repository's Tau Ceti pin. -/
noncomputable abbrev shapiroMap (H : Subgroup G) (A : SmoothDiscreteTopRep R H) (n : ℕ) :
    (continuousCohomology R G n).obj ((smoothDiscreteι R G).obj (coindTopRep R H A)) ⟶
      (continuousCohomology R H n).obj ((smoothDiscreteι R H).obj A) :=
  ContinuousCohomology.map (TauCeti.ContinuousMonoidHom.subgroupSubtype H)
    (TopRep.ofHom (TauCeti.coindCounit R G H A)) n

/-- **Layer 10, Shapiro's lemma in every degree** (NSW (1.6.4), Ribes-Zalesskii Thm. 6.10.5): for
a closed subgroup `H` of the profinite `G`, the canonical Shapiro map is an isomorphism. The route
is in `README.md` Layer 10: Layer 7's explicit isomorphisms in degrees `0` and `1`, then dimension
shifting along `0 → A → Coind_1^H A → Q → 0` and its coinduction to `G`, both middle terms being
acyclic (`coindAcyclic`). At `R = ℤ` on the image of Layer 1's dictionary it is Tau Ceti's
`TauCeti.ContinuousCohomology.isIso_shapiroMap`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean`), which landed
after this repository's Tau Ceti pin and is proved by that route. -/
theorem isIso_shapiroMap (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) (n : ℕ) : IsIso (shapiroMap R H A n) :=
  sorry

/-- **Layer 10, the Shapiro cochain map is a quasi-isomorphism,** which is `isIso_shapiroMap` in
every degree (Mathlib's `quasiIsoAt_iff_isIso_homologyMap`). -/
theorem quasiIso_shapiroCochainMap (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) : QuasiIso (shapiroCochainMap R H A) :=
  ⟨fun n => (quasiIsoAt_iff_isIso_homologyMap _ n).2 (isIso_shapiroMap R H hH A n)⟩

/-- **Layer 10, Shapiro's lemma in every degree, as an isomorphism,**
`Hⁿ(G, Coind_H^G A) ≅ Hⁿ(H, A)`, whose forward map is the canonical Shapiro map
(`shapiroIso_hom`), so that nothing about it depends on a choice: closedness of `H` is used only
to prove that map bijective. At `R = ℤ` on the image of Layer 1's dictionary it is Tau Ceti's
`TauCeti.ContinuousCohomology.shapiroIso`, which landed after this repository's Tau Ceti pin. -/
noncomputable def shapiroIso (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) (n : ℕ) :
    (continuousCohomology R G n).obj ((smoothDiscreteι R G).obj (coindTopRep R H A)) ≅
      (continuousCohomology R H n).obj ((smoothDiscreteι R H).obj A) :=
  haveI := isIso_shapiroMap R H hH A n
  asIso (shapiroMap R H A n)

/-- **Layer 10, the forward map of `shapiroIso` is the canonical Shapiro map.** -/
theorem shapiroIso_hom (H : Subgroup G) (hH : IsClosed (H : Set G))
    (A : SmoothDiscreteTopRep R H) (n : ℕ) :
    (shapiroIso R H hH A n).hom = shapiroMap R H A n :=
  rfl

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

/-- **Layer 10, the canonical embedding into the trivial-subgroup coinduced module.** Its
underlying map is the orbit map `x ↦ (g ↦ g • x)`, which is Tau Ceti's
`TauCeti.ContCohomology.coindBotEmbedding` for a discrete module. -/
noncomputable def coindEmbedding (X : TopRep R G) (hX : IsSmoothDiscrete R X) :
    X ⟶ (smoothDiscreteι R G).obj
      (coindTopRep R (⊥ : Subgroup G) (resSmooth R (⊥ : Subgroup G) X hX)) :=
  sorry

/-- **Layer 10, the quotient used for dimension shifting,**
`Coind_1^G X / coindEmbedding X`; for a discrete module its underlying group is Tau Ceti's
`TauCeti.ContCohomology.DimensionShiftQuotient`. -/
noncomputable def dimensionShiftQuotient (X : TopRep R G) (hX : IsSmoothDiscrete R X) :
    SmoothDiscreteTopRep R G :=
  sorry

/-- **Layer 10, acyclicity of `Coind_1^G A` in every positive degree.** Tau Ceti's
`TauCeti.ContCohomology.coindAcyclic`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean`); stated here
because the pinned Tau Ceti revision predates it; replaced by the import when the pin moves. -/
theorem coindAcyclic (A : SmoothDiscreteTopRep R (⊥ : Subgroup G)) (n : ℕ) (hn : 0 < n) :
    CategoryTheory.Limits.IsZero ((continuousCohomology R G n).obj
      ((smoothDiscreteι R G).obj (coindTopRep R (⊥ : Subgroup G) A))) :=
  sorry

/-- **Layer 10, dimension shifting in every positive degree,** derived from the named embedding,
quotient, long exact sequence, and `coindAcyclic`. -/
noncomputable def dimensionShiftIso (X : TopRep R G) (hX : IsSmoothDiscrete R X) (n : ℕ)
    (hn : 0 < n) :
    (continuousCohomology R G (n + 1)).obj X ≅
      (continuousCohomology R G n).obj
        ((smoothDiscreteι R G).obj (dimensionShiftQuotient R X hX)) :=
  sorry

/-- **Layer 10, milestone 1: the trace as a morphism of coefficient objects.** A morphism in
`TopRep R G`, not merely an additive map, so that it can be fed to Layer 1's `map`. The subgroup is
**open**: the continuous transfer is defined for open subgroups, and a finite-index abstract
subgroup of a topological group need not be open. Tau Ceti's `TauCeti.coindTraceHom`
(`Coinduced/Functor.lean`) at the smooth discrete object `⟨X, hX⟩`, which acts by the trace
`coindTraceRaw` on the discrete carrier (`TauCeti.coindTraceHom_apply`); an open subgroup of the
compact `G` has finite index (`Subgroup.quotient_finite_of_isOpen`,
`Subgroup.finiteIndex_of_finite_quotient`). -/
noncomputable abbrev coindTrace (U : OpenSubgroup G) (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) :
    (smoothDiscreteι R G).obj (coindTopRep R U.toSubgroup (resSmooth R U.toSubgroup X hX)) ⟶
      X :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.coindTraceHom.{v, u, u} R G U.toSubgroup ⟨X, hX⟩

/-- **Layer 10, milestone 2: all-degree corestriction,** the Shapiro-then-trace composite. It has
a real body, built from `shapiroIso` and `coindTrace`, so it adds no obligation beyond
`isIso_shapiroMap`, which is the point of choosing this route over an all-degree cochain formula.
The coefficients are smooth discrete because coinduction is, which is the roadmap's scope: §1 puts
non-discrete topological coefficient modules out of scope. -/
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

/-- **Layer 10, vanishing on a closed subgroup descends to an open one** (NSW (1.5.1), the
injectivity half, for the closed `H` as the inverse limit of the open subgroups containing it;
Serre, *Galois Cohomology* I §2.2 Prop. 8). A class of `Hⁿ(G, X)`, `X` smooth discrete, whose
restriction to the closed subgroup `H` vanishes already has vanishing restriction to some open
subgroup containing `H`, in every degree. With `corestriction_comp_res` this is what carries a
prime-to-`p` argument from the open subgroups containing `H` to `H` itself.

The route never leaves Mathlib's canonical complex and never passes to functions on `Gⁿ`. A
homogeneous `n`-cochain is a `G`-invariant element of `TopRep.resolutionX X (n + 1)`, the iterated
function space `C(G, C(G, …, X))`, and restriction to a subgroup is
`ContinuousCohomology.resolutionMap` along its inclusion, which evaluates the iterated map on tuples
from the subgroup. Write the class as that of a cocycle `z`, with restriction `d w` on `H`. The
`H`-invariant `w` extends to a `G`-invariant `W`: lift its value at `1` degree by degree, by
extending continuous maps from the closed subspace `H` into a discrete space
(`ContinuousMap.exists_extension_of_discrete`), and take the orbit map of the lift. Then `z - d W`
vanishes on the tuples from the compact `H`; taking finitely many values there, it vanishes on an
open set around `H`, which contains an open subgroup `U ⊇ H`
(`ProfiniteGrp.closedSubgroup_eq_sInf_open`); and `res_U z = d (res_U W)`.

Tau Ceti's `TauCeti.ContinuousCohomology.exists_openSubgroup_le_res_eq_zero`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/ClosedSubgroup.lean`), stated against
Tau Ceti's `res`, which like `res` here is `map` along the inclusion with the identity on
coefficients; the pinned Tau Ceti revision predates it. -/
theorem exists_openSubgroup_res_eq_zero_of_res_eq_zero (X : TopRep R G)
    (hX : IsSmoothDiscrete R X) (H : Subgroup G) (hH : IsClosed (H : Set G)) (n : ℕ)
    (x : (continuousCohomology R G n).obj X) (hx : (res R H X n).hom x = 0) :
    ∃ U : OpenSubgroup G, H ≤ U.toSubgroup ∧ (res R U.toSubgroup X n).hom x = 0 :=
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
directions are continuous for the Krull topologies. Tau Ceti's
`TauCeti.absoluteGaloisGroupRestrictEquiv`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`). -/
example (K : Type*) [Field K] :
    ∃ e : Field.absoluteGaloisGroup K ≃* (SeparableClosure K ≃ₐ[K] SeparableClosure K),
      Continuous e ∧ Continuous e.symm :=
  ⟨(TauCeti.absoluteGaloisGroupRestrictEquiv K).toMulEquiv,
    (TauCeti.absoluteGaloisGroupRestrictEquiv K).continuous_toFun,
    (TauCeti.absoluteGaloisGroupRestrictEquiv K).continuous_invFun⟩

/-- **Layer 9, `G_K`, fixed once.** The roadmap's absolute Galois group is the automorphisms of
the **separable** closure. Mathlib's `Field.absoluteGaloisGroup` uses the algebraic closure, whose
fixed field is the purely inseparable closure for imperfect `K`; the two are related by a
topological group equivalence, which is a Layer 9 milestone and not a definitional identity. It is
Tau Ceti's `TauCeti.AbsoluteGaloisGroup`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`), `Gal(Kˢ/K)` with Mathlib's Krull
topology and action on `Kˢ`. The coefficient modules, the Kummer sequence, the Kummer map and
isomorphism, Hilbert 90 and the map `H²(G_K, μₙ) → H²(G_K, (Kˢ)ˣ)` of this layer are Tau Ceti's
too, in `TauCeti/FieldTheory/GaloisCohomology/`, and are carried below under this roadmap's names.
-/
abbrev AbsoluteGaloisGroup (K : Type*) [Field K] : Type _ :=
  TauCeti.AbsoluteGaloisGroup K

/-- **Layer 9, `μₙ`,** the `n`-th roots of unity in the separable closure, as a subgroup of
`(Kˢ)ˣ`: Mathlib's `rootsOfUnity n (SeparableClosure K)`, on which `G_K` acts by Tau Ceti's
`TauCeti.rootsOfUnity.mulDistribMulAction` (`TauCeti/RingTheory/RootsOfUnity/Action.lean`). -/
noncomputable abbrev muN (K : Type*) [Field K] (n : ℕ) : Subgroup (SeparableClosure K)ˣ :=
  rootsOfUnity n (SeparableClosure K)

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, `μₙ` is `G_K`-stable,** Tau Ceti's `TauCeti.smul_mem_rootsOfUnity`. -/
theorem smul_mem_muN {K : Type*} [Field K] {n : ℕ} (g : AbsoluteGaloisGroup K)
    {ζ : (SeparableClosure K)ˣ} (h : ζ ∈ muN K n) : g • ζ ∈ muN K n :=
  TauCeti.smul_mem_rootsOfUnity g h

/-- **Layer 9, the Kummer coefficient module.** `μₙ` written additively, through the pin's
`Additive` idiom, and this is the coefficient object the Kummer isomorphism is stated against: Tau
Ceti's `TauCeti.KummerCoeff` (`TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`), with its
discrete topology and the `G_K`-action carried to `Additive` by Tau Ceti's
`TauCeti.Additive.distribMulAction`. -/
abbrev KummerCoeff (K : Type*) [Field K] (n : ℕ) : Type _ := TauCeti.KummerCoeff K n

/-- **Layer 9, the action is continuous,** since the stabilizer of a root of unity is open: Tau
Ceti's instance `TauCeti.kummerCoeff_continuousSMul`, so every Kummer statement against the
canonical carrier typechecks with no hypothesis supplied by a consumer. -/
theorem kummerCoeff_continuousSMul (K : Type*) [Field K] (n : ℕ) :
    ContinuousSMul (AbsoluteGaloisGroup K) (KummerCoeff K n) :=
  TauCeti.kummerCoeff_continuousSMul K n

/-- **Layer 9, the multiplicative coefficient module.** `(Kˢ)ˣ` written additively, through the
pin's `Additive` idiom. This is the coefficient module of the Kummer sequence, of Hilbert 90 and of
the cohomological Brauer group, and `KummerCoeff K n` is the `n`-torsion submodule of it. It is
**discrete**: every element lies in a finite subextension, so its stabilizer is open. Tau Ceti's
`TauCeti.UnitsCoeff`. -/
abbrev UnitsCoeff (K : Type*) [Field K] : Type _ := TauCeti.UnitsCoeff K

/-- **Layer 9, the action on `(Kˢ)ˣ` is continuous,** since every unit lies in a finite
subextension and so has open stabilizer: Tau Ceti's instance `TauCeti.unitsCoeff_continuousSMul`. -/
theorem unitsCoeff_continuousSMul (K : Type*) [Field K] :
    ContinuousSMul (AbsoluteGaloisGroup K) (UnitsCoeff K) :=
  TauCeti.unitsCoeff_continuousSMul K

/-- **Layer 9, `Kˣ ≅ ((Kˢ)ˣ)^{G_K}`.** These are not the same Lean type, so the roadmap names the
canonical equivalence rather than calling them equal. It is induced by the algebra map and the
fixed-field theorem, and it is the map the Kummer connecting homomorphism starts from. It is Tau
Ceti's `TauCeti.baseUnitsEquivInvariants`, onto Layer 2's `H0 G_K (UnitsCoeff K)`, the invariants
written additively. -/
noncomputable abbrev baseUnitsEquivInvariants (K : Type*) [Field K] :
    Additive Kˣ ≃+ H0 (AbsoluteGaloisGroup K) (UnitsCoeff K) :=
  TauCeti.baseUnitsEquivInvariants K

/-- **Layer 9, `μₙ ⊆ (Kˢ)ˣ`,** the left-hand map of the Kummer sequence, as a map of coefficient
modules: Tau Ceti's `TauCeti.kummerCoeffIncl`. -/
noncomputable abbrev kummerCoeffIncl (K : Type*) [Field K] (n : ℕ) :
    KummerCoeff K n →+ UnitsCoeff K :=
  TauCeti.kummerCoeffIncl K n

/-- **Layer 9, the `n`-th power map on `(Kˢ)ˣ`,** the right-hand map of the Kummer sequence, which
in additive notation is multiplication by `n` (`TauCeti.unitsCoeffPow_eq_nsmul`): Tau Ceti's
`TauCeti.unitsCoeffPow`. -/
noncomputable abbrev unitsCoeffPow (K : Type*) [Field K] (n : ℕ) : UnitsCoeff K →+ UnitsCoeff K :=
  TauCeti.unitsCoeffPow K n

/-- **Layer 9, the subgroup of `n`-th powers `(Kˣ)ⁿ ≤ Kˣ`,** Tau Ceti's `TauCeti.powerSubgroup`
(`TauCeti/Algebra/Group/PowerClassGroup.lean`) at `Kˣ`. -/
abbrev powerSubgroup (K : Type*) [Field K] (n : ℕ) : Subgroup Kˣ :=
  TauCeti.powerSubgroup Kˣ n

/-- **Layer 9, the group of power classes `Kˣ ⧸ (Kˣ)ⁿ`,** the left-hand side of the Kummer
isomorphism: Tau Ceti's `TauCeti.powerClassQuotient` at `Kˣ`. -/
abbrev powerClassQuotient (K : Type*) [Field K] (n : ℕ) : Type _ :=
  TauCeti.powerClassQuotient Kˣ n

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
false. It is Tau Ceti's `TauCeti.kummerMap`
(`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`), the degree-zero connecting map of the Kummer
sequence read on `Kˣ` through `baseUnitsEquivInvariants` (`TauCeti.kummerMap_apply`). -/
noncomputable abbrev kummerMap (hn : IsUnit (n : K)) :
    Kˣ →* Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  TauCeti.kummerMap K n hn

/-- **Layer 9, the Kummer isomorphism,** milestone 7 of the layer and the statement the Local
Fields and Quadratic Form Invariants roadmaps consume. The kernel of `kummerMap` is `(Kˣ)ⁿ` and
its surjectivity is Hilbert 90: Tau Ceti's `TauCeti.kummerIso`, which sends the class of `a` to
`kummerMap K n hn a` (`TauCeti.kummerIso_mk`). -/
noncomputable abbrev kummerIso (hn : IsUnit (n : K)) :
    powerClassQuotient K n ≃*
      Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  TauCeti.kummerIso K n hn

/-- **Layer 9, transport along an identification of coefficients.** A consumer that carries its
own model of `μₙ` may use it, but only through a **continuous `G_K`-equivariant** additive
equivalence: the equivariance law `hequiv` is the hypothesis a plain group equivalence lacks, and
the conclusion is the transported isomorphism itself, not a claim that one exists. It is Tau
Ceti's `TauCeti.kummerIsoTransport`, which derives the continuity of the action on `μ` from `e`
(`TauCeti.kummerIsoTransportContinuousSMul`); the hypotheses carried here are satisfied by it. -/
noncomputable abbrev kummerIsoTransport (hn : IsUnit (n : K))
    (μ : Type*) [AddCommGroup μ] [TopologicalSpace μ] [IsTopologicalAddGroup μ]
    [DiscreteTopology μ] [DistribMulAction (AbsoluteGaloisGroup K) μ]
    [ContinuousSMul (AbsoluteGaloisGroup K) μ]
    (e : KummerCoeff K n ≃+ μ) (_he : Continuous e)
    (hequiv : ∀ (g : AbsoluteGaloisGroup K) (x : KummerCoeff K n), e (g • x) = g • e x) :
    powerClassQuotient K n ≃* Multiplicative (H1 (AbsoluteGaloisGroup K) μ) :=
  TauCeti.kummerIsoTransport K n hn μ e hequiv

/-- **Layer 9, the map of power classes along a field extension,** the identity on representatives
followed by the quotient: Tau Ceti's `TauCeti.powerClassMap` at the map of units `Kˣ → Lˣ`. -/
noncomputable abbrev powerClassMap (L : Type*) [Field L] [Algebra K L] :
    powerClassQuotient K n →* powerClassQuotient L n :=
  TauCeti.powerClassMap n (Units.map (algebraMap K L).toMonoidHom)

/-- **Layer 9, the norm on power classes,** induced by `N_{L/K}` on units. -/
noncomputable def powerClassNorm (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L] :
    powerClassQuotient L n →* powerClassQuotient K n :=
  sorry

/-- **Layer 9, restriction on the Kummer `H¹` along a chosen `K`-embedding of `L` into a separable
closure of `K`.** The embedding is genuine data: without one there is no map `G_L → G_K` at all, so
a square stated for an arbitrary homomorphism is a different statement, and a false one. It is
Tau Ceti's `TauCeti.kummerRes`: restriction to the subgroup fixing `ι L`, transported to `G_L`. -/
noncomputable abbrev kummerRes (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (ι : L →ₐ[K] SeparableClosure K) :
    Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) →*
      Multiplicative (H1 (AbsoluteGaloisGroup L) (KummerCoeff L n)) :=
  TauCeti.kummerRes K n L ι

/-- **Layer 9, corestriction on the Kummer `H¹` along the same embedding.** The embedding realizes
`G_L` as an open subgroup of `G_K`, which is what makes the transfer available. -/
noncomputable def kummerCor (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (ι : L →ₐ[K] SeparableClosure K) :
    Multiplicative (H1 (AbsoluteGaloisGroup L) (KummerCoeff L n)) →*
      Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  sorry

/-- **Layer 9, the restriction square.** For a finite separable `L/K` with a chosen `K`-embedding
of `L` into `Kˢ`, restriction on cohomology corresponds to the map of power classes: Tau Ceti's
`TauCeti.kummerIso_res`. -/
theorem kummerIso_res (hn : IsUnit (n : K)) (L : Type*) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (hnL : IsUnit (n : L))
    (ι : L →ₐ[K] SeparableClosure K) (x : powerClassQuotient K n) :
    kummerRes K n L ι (kummerIso K n hn x) = kummerIso L n hnL (powerClassMap K n L x) :=
  TauCeti.kummerIso_res K n L ι hn x

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
working in all degrees never has to move between the two by hand. It is Tau Ceti's
`TauCeti.kummerMapCanonical`, the explicit Kummer map transported through the degree-one
comparison. -/
noncomputable abbrev kummerMapCanonical (hn : IsUnit (n : K)) :
    Kˣ →* Multiplicative ((continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K n))) :=
  TauCeti.kummerMapCanonical K n hn

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layers 3 and 9, the explicit and canonical Kummer classes agree.** Both maps are named, so
the statement is that these two agree and not that some isomorphism carries one to something. This
is what makes `kummerIso` usable against the all-degree theory without a private transport. Tau
Ceti's `TauCeti.explicitIso_kummerMap`. -/
theorem explicitIso_kummerMap (hn : IsUnit (n : K)) (a : Kˣ) :
    Multiplicative.toAdd (kummerMapCanonical K n hn a) =
      (explicitH1IsoContinuousCohomology (AbsoluteGaloisGroup K) (KummerCoeff K n)).hom.hom
        (Multiplicative.toAdd (kummerMap K n hn a) :
          DiscreteH1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) :=
  TauCeti.explicitIso_kummerMap K n hn a

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the Kummer sequence** `1 → μₙ → (Kˢ)ˣ →^n (Kˢ)ˣ → 1`, as the Layer 5 datum the long
exact sequence is taken of. Surjectivity of the `n`-th power map is separable closedness of `Kˢ`
together with separability of `Xⁿ - a`, which is where `IsUnit (n : K)` is used. The two maps are
pinned to the named ones by the two theorems below, so that nothing here is a statement about an
arbitrary pair of coefficient maps. It is Tau Ceti's `TauCeti.kummerShortExact`. -/
noncomputable abbrev kummerShortExact (hn : IsUnit (n : K)) :
    DiscreteShortExact (AbsoluteGaloisGroup K) (KummerCoeff K n) (UnitsCoeff K) (UnitsCoeff K) :=
  TauCeti.kummerShortExact K n hn

set_option synthInstance.maxHeartbeats 80000 in
/-- The inclusion of the Kummer sequence is `μₙ ⊆ (Kˢ)ˣ`. -/
theorem kummerShortExact_incl (hn : IsUnit (n : K)) :
    (kummerShortExact K n hn).incl = kummerCoeffIncl K n :=
  TauCeti.kummerShortExact_incl K n hn

set_option synthInstance.maxHeartbeats 80000 in
/-- The projection of the Kummer sequence is the `n`-th power map. -/
theorem kummerShortExact_proj (hn : IsUnit (n : K)) :
    (kummerShortExact K n hn).proj = unitsCoeffPow K n :=
  TauCeti.kummerShortExact_proj K n hn

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, Hilbert 90 for the absolute Galois group,** `H¹(G_K, (Kˢ)ˣ) = 0` (NSW (6.2.1)). It
is what makes the Kummer connecting map surjective, and Layer 4's colimit is how it is proved from
the pin's finite-level `groupCohomology.hilbert90`. Tau Ceti's `TauCeti.hilbert90`
(`TauCeti/FieldTheory/GaloisCohomology/Hilbert90.lean`), from the explicit vanishing
`TauCeti.subsingleton_H1_unitsCoeff`. -/
theorem hilbert90 :
    Limits.IsZero ((continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K))) :=
  TauCeti.hilbert90 K

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the inclusion `μₙ ⊆ (Kˢ)ˣ` as a morphism of canonical coefficient objects.** A real
body over Layer 1's dictionary, so that the map on cohomology below is determined by
`kummerCoeffIncl` and cannot drift from it: Tau Ceti's `TauCeti.kummerCoeffToUnits`
(`TauCeti/FieldTheory/GaloisCohomology/BrauerTorsion.lean`). -/
noncomputable abbrev kummerCoeffToUnits :
    ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K n) ⟶
      ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K) :=
  TauCeti.kummerCoeffToUnits K n

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, the map `H²(G_K, μₙ) → H²(G_K, (Kˢ)ˣ)` induced by that inclusion,** which is how the
mod-`n` part of `H²` sits inside the cohomological Brauer group. A real body, from Layer 1's
`coeffMap`: Tau Ceti's `TauCeti.h2KummerToUnits`. -/
noncomputable abbrev h2KummerToUnits :
    (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
        (ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K n)) ⟶
      (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
        (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K)) :=
  TauCeti.h2KummerToUnits K n

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, it is injective,** which is Hilbert 90 read through the long exact sequence of the
Kummer sequence: the term before it is `H¹(G_K, (Kˢ)ˣ)`, and that vanishes. -/
theorem h2KummerToUnits_injective (hn : IsUnit (n : K)) :
    Function.Injective (h2KummerToUnits K n).hom :=
  TauCeti.h2KummerToUnits_injective hn

set_option synthInstance.maxHeartbeats 80000 in
/-- **Layer 9, its image is the `n`-torsion,** which is exactness of the same sequence at
`H²(G_K, (Kˢ)ˣ)`, the next map being multiplication by `n`. -/
theorem h2KummerToUnits_range (hn : IsUnit (n : K))
    (x : (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
      (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K))) :
    (∃ y, (h2KummerToUnits K n).hom y = x) ↔ n • x = 0 :=
  TauCeti.h2KummerToUnits_range hn x

end KummerComparison

/-! ### Layer 11: cohomological dimension -/

/-- **Layer 11, the least bound of a predicate on `ℕ`, in `ℕ∞`.** The roadmap defines
cohomological dimension from a `Prop`-valued predicate on `ℕ` and only then takes an infimum,
with codomain `ℕ∞` so that "infinite cohomological dimension" is `⊤` rather than an absent
value. This is Tau Ceti's `TauCeti.leastENatBound` (`TauCeti/Data/ENat/LeastBound.lean`), from which
Tau Ceti's invariants below are built. -/
noncomputable abbrev leastENatBound (P : ℕ → Prop) : ℕ∞ :=
  TauCeti.leastENatBound P

/-- **Layer 11, the characterization for an upward-closed predicate,** Tau Ceti's
`TauCeti.leastENatBound_le_iff`. Instantiating `P` at the vanishing predicate of Layer 10 gives
`cd_p G ≤ n ↔ CohomologicalDimensionLE p G n`, and the same shape serves `cd` and `scd_p`. -/
theorem leastENatBound_le_iff (P : ℕ → Prop) (hP : ∀ m n : ℕ, m ≤ n → P m → P n) (n : ℕ) :
    leastENatBound P ≤ (n : ℕ∞) ↔ P n :=
  TauCeti.leastENatBound_le_iff (fun m n hmn => hP m n hmn) n

/-- **Layer 11, the empty case,** Tau Ceti's `TauCeti.leastENatBound_eq_top_iff`: no bound at all
gives `⊤`. -/
theorem leastENatBound_eq_top (P : ℕ → Prop) (hP : ∀ n : ℕ, ¬ P n) : leastENatBound P = ⊤ :=
  TauCeti.leastENatBound_eq_top_iff.2 hP

/-- **Layer 11, the factor set of a finite quotient lands in the kernel.** For `q, r ∈ G ⧸ V` the
representatives chosen by `Quotient.out` satisfy `q.out * r.out * (q * r).out⁻¹ ∈ V`. This is what
lets the class of the extension of `G ⧸ V` by `V^ab(p)` below be written from `Quotient.out`. -/
theorem out_mul_out_mul_inv_mem {G : Type*} [Group G] (V : Subgroup G) [V.Normal]
    (q r : G ⧸ V) : q.out * r.out * (q * r).out⁻¹ ∈ V := by
  rw [← div_eq_mul_inv, ← QuotientGroup.eq_iff_div_mem, QuotientGroup.mk_mul,
    QuotientGroup.out_eq', QuotientGroup.out_eq', QuotientGroup.out_eq']

/-! Layer 11, the class module of a group of strict dimension two. The declarations from here to
the two final theorems are the inputs of the route in `README.md` Layer 11: NSW (3.3.11)
(`corestriction_surjective_primaryComponent`, `corestriction_ker_primaryComponent`); the transfer
and (3.6.4) (i) ⇒ (ii) (`abelianizationProPTransfer`, `abelianizationProPTransfer_eq_one_iff`,
`abelianizationProPTransfer_range`); the case `#(G ⧸ V) = p` without the diagram (3.6.2), from the
explicit cohomology of a finite cyclic group; NSW (3.6.1) with the change of group; and NSW (3.6.3)
with the finite Sylow step. All the finite-group cohomology is Layer 2's explicit model of a finite
discrete quotient, with the profinite, non-discrete coefficients `V^ab(p)`. -/

/-- **Layer 11, the norm of a finite group on a module,** `a ↦ ∑_γ γ • a`: the map whose kernel
modulo `σ - 1` is `H¹` and whose cokernel on the invariants is `H²` for a finite cyclic group. -/
def groupNorm (Γ : Type*) [Group Γ] [Fintype Γ] (A : Type*) [AddCommGroup A]
    [DistribMulAction Γ A] : A →+ A where
  toFun a := ∑ γ : Γ, γ • a
  map_zero' := by simp
  map_add' a b := by simp [smul_add, Finset.sum_add_distrib]

/-- **Layer 11, `H¹` of a finite cyclic group vanishes when the norm kernel is `(σ - 1) A`,** on
Layer 2's explicit model, for any topological coefficients: the group is discrete, so every
cochain on it is continuous. A 1-cocycle `f` is determined by `f σ`, since
`f (σ ^ k) = ∑_{i < k} σ ^ i • f σ`; `f 1 = 0` puts `f σ` in the kernel of the norm, and
`f σ = σ • b - b` makes `f` the coboundary of `b`. This is the degree-one half of
`H¹ = ker N / (σ - 1) A`, whose discrete-coefficient model is Mathlib's
`Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`. -/
theorem subsingleton_H1_of_isCyclic (Γ : Type*) [Group Γ] [TopologicalSpace Γ]
    [DiscreteTopology Γ] [Fintype Γ] (A : Type*) [AddCommGroup A] [TopologicalSpace A]
    [IsTopologicalAddGroup A] [DistribMulAction Γ A] [ContinuousSMul Γ A] (σ : Γ)
    (hσ : ∀ γ : Γ, γ ∈ Subgroup.zpowers σ)
    (hA : ∀ a : A, groupNorm Γ A a = 0 → ∃ b : A, a = σ • b - b) :
    Subsingleton (H1 Γ A) :=
  sorry

/-- **Layer 11, `∑_τ f (τ, σ)` of a 2-cocycle is invariant,** by the cocycle identity
`γ • f (τ, σ) = f (γ τ, σ) - f (γ, τ σ) + f (γ, τ)` summed over `τ`. -/
theorem sum_cocycle_mem_H0 (Γ : Type*) [Group Γ] [TopologicalSpace Γ] [Fintype Γ] (A : Type*)
    [AddCommGroup A] [TopologicalSpace A] [IsTopologicalAddGroup A] [DistribMulAction Γ A]
    (f : Z2 Γ A) (σ : Γ) :
    ∑ τ : Γ, (f : Γ × Γ → A) (τ, σ) ∈ H0 Γ A :=
  sorry

/-- **Layer 11, `H²` of a finite cyclic group is the invariants modulo the norms,** on Layer 2's
explicit model, for any topological coefficients: the class of a 2-cocycle `f` goes to the class
of `∑_τ f (τ, σ)` (`explicitH2CyclicEquiv_mk`). It is additive and kills `B²`, since for
`f = d¹ c` the sum is the norm of `c σ`; it is surjective, the cocycle
`(σ ^ i, σ ^ j) ↦ [i + j ≥ n] • a` for `0 ≤ i, j < n` going to `a`; and it is injective, a cocycle
whose sum is a norm being a coboundary after the normalization by that cocycle. This is the
degree-two half of the periodicity, whose discrete-coefficient model is Mathlib's
`Rep.FiniteCyclicGroup.groupCohomologyIsoEven`; for the factor set of an extension with the
section `σ ^ i ↦ t ^ i` the sum is `t ^ n`. -/
noncomputable def explicitH2CyclicEquiv (Γ : Type*) [Group Γ] [TopologicalSpace Γ]
    [DiscreteTopology Γ] [Fintype Γ] (A : Type*) [AddCommGroup A] [TopologicalSpace A]
    [IsTopologicalAddGroup A] [DistribMulAction Γ A] [ContinuousSMul Γ A] (σ : Γ)
    (hσ : ∀ γ : Γ, γ ∈ Subgroup.zpowers σ) :
    H2 Γ A ≃+ (H0 Γ A ⧸ (groupNorm Γ A).range.addSubgroupOf (H0 Γ A)) :=
  sorry

/-- **Layer 11, the formula for `explicitH2CyclicEquiv`.** -/
theorem explicitH2CyclicEquiv_mk (Γ : Type*) [Group Γ] [TopologicalSpace Γ]
    [DiscreteTopology Γ] [Fintype Γ] (A : Type*) [AddCommGroup A] [TopologicalSpace A]
    [IsTopologicalAddGroup A] [DistribMulAction Γ A] [ContinuousSMul Γ A] (σ : Γ)
    (hσ : ∀ γ : Γ, γ ∈ Subgroup.zpowers σ) (f : Z2 Γ A) :
    explicitH2CyclicEquiv Γ A σ hσ (H2pi Γ A f) =
      QuotientAddGroup.mk (s := (groupNorm Γ A).range.addSubgroupOf (H0 Γ A))
        ⟨∑ τ : Γ, (f : Γ × Γ → A) (τ, σ), sum_cocycle_mem_H0 Γ A f σ⟩ :=
  sorry

/-- **Layer 11, the pair `V ◁ W` read in `G ⧸ V`:** `W ⧸ (V ⊓ W) ≃* W.map (mk' V)`, Mathlib's
`QuotientGroup.quotientKerEquivRange` for `(QuotientGroup.mk' V).comp W.subtype`, whose kernel is
`V.subgroupOf W` and whose range is `W.map (QuotientGroup.mk' V)`. -/
noncomputable def quotientSubgroupOfEquivMap {G : Type*} [Group G] (V W : Subgroup G) [V.Normal] :
    (W ⧸ V.subgroupOf W) ≃* W.map (QuotientGroup.mk' V) :=
  (QuotientGroup.quotientMulEquivOfEq (by
      rw [← MonoidHom.comap_ker, QuotientGroup.ker_mk']; rfl)).trans
    ((QuotientGroup.quotientKerEquivRange ((QuotientGroup.mk' V).comp W.subtype)).trans
      (MulEquiv.subgroupCongr (by rw [MonoidHom.range_comp, Subgroup.range_subtype])))

/-- **Layer 11, an open normal subgroup is its own conjugate,** so that Layer 10's `conjMapOf` acts
on the cohomology of an open normal subgroup. -/
theorem conjOpenSubgroup_eq_of_normal {G : Type u} [Group G] [TopologicalSpace G]
    (V : OpenSubgroup G) [V.toSubgroup.Normal] (g : G) : conjOpenSubgroup g V = V :=
  sorry

/-- **Layer 11, conjugation commutes with the all-degree connecting map** on an open normal
subgroup: the case of the compatible pair (conjugation by `g`, the action of `g`) of the naturality
of `delta` in compatible pairs. The class module uses it to move the conjugation of NSW (3.3.11)
from `H²(V, ℤ)` to characters of `V` through the Bockstein connecting map. -/
theorem delta_conjMapOf (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (A : Type u) [AddCommGroup A] [TopologicalSpace A] [IsTopologicalAddGroup A]
    [DiscreteTopology A] [DistribMulAction G A] [ContinuousSMul G A]
    (B : Type u) [AddCommGroup B] [TopologicalSpace B] [IsTopologicalAddGroup B]
    [DiscreteTopology B] [DistribMulAction G B] [ContinuousSMul G B]
    (C : Type u) [AddCommGroup C] [TopologicalSpace C] [IsTopologicalAddGroup C]
    [DiscreteTopology C] [DistribMulAction G C] [ContinuousSMul G C]
    (S : DiscreteShortExact G A B C) (V : OpenSubgroup G) [V.toSubgroup.Normal]
    [CompactSpace V.toSubgroup] [TotallyDisconnectedSpace V.toSubgroup] (g : G) (n : ℕ) :
    (continuousCohomology ℤ V.toSubgroup n).map (ofDiscreteModuleRes G C V.toSubgroup).inv ≫
        conjMapOf ℤ g V V (conjOpenSubgroup_eq_of_normal V g).symm (ofDiscreteModule G C) n ≫
        (continuousCohomology ℤ V.toSubgroup n).map (ofDiscreteModuleRes G C V.toSubgroup).hom ≫
        delta V.toSubgroup A B C (S.restrict G A B C V.toSubgroup) n =
      delta V.toSubgroup A B C (S.restrict G A B C V.toSubgroup) n ≫
        (continuousCohomology ℤ V.toSubgroup (n + 1)).map
          (ofDiscreteModuleRes G A V.toSubgroup).inv ≫
        conjMapOf ℤ g V V (conjOpenSubgroup_eq_of_normal V g).symm (ofDiscreteModule G A)
          (n + 1) ≫
        (continuousCohomology ℤ V.toSubgroup (n + 1)).map
          (ofDiscreteModuleRes G A V.toSubgroup).hom :=
  sorry

section CohomologicalDimensionInvariants

/-! The invariants of this layer are Tau Ceti's, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension.lean`, read at the
coefficient universe of `G`: Tau Ceti lets the coefficient modules range over `Type (max u v)` for
an extra universe `v`, and this roadmap takes `v = 0`, so that they range over `Type u`, the
universe `README.md` §3 fixes for the coefficients of a group in `Type u`. The definitions do not
use that `p` is prime; they are meant for prime `p`. -/

/-- **Layer 11, `p`-primary torsion coefficients.** Every element is annihilated by a power of `p`,
which is Mathlib's `AddCommGroup.primaryComponent` read as a condition on the whole module: Tau
Ceti's `TauCeti.IsPPrimaryTorsion` (`TauCeti/GroupTheory/Torsion.lean`). The coefficients of the
ordinary dimension are these and **not** the ones of bounded exponent: the reduction to bounded
exponent is a theorem below, proved through the filtered-colimit compatibility of Layer 10, and
taking it as the definition would state a different invariant. -/
abbrev IsPPrimaryTorsion (p : ℕ) (M : Type*) [AddCommGroup M] : Prop :=
  TauCeti.IsPPrimaryTorsion p M

variable (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 11, the ordinary vanishing predicate.** `Hⁱ(G, M)` vanishes above `n` for every
discrete `p`-primary torsion `M` with a continuous action: Tau Ceti's
`TauCeti.CohomologicalDimensionLE`, whose `Hⁱ(G, M)` is Mathlib's continuous cohomology of
`ofDiscreteModule G M` (`TauCeti.cohomologicalDimensionLE_iff`). -/
abbrev CohomologicalDimensionLE (n : ℕ) : Prop :=
  TauCeti.CohomologicalDimensionLE.{0} p G n

/-- **Layer 11, the strict vanishing predicate,** Tau Ceti's
`TauCeti.StrictCohomologicalDimensionLE` (`TauCeti.strictCohomologicalDimensionLE_iff`). The two
predicates differ in both places at once: the ordinary one asks the whole of `Hⁱ` to vanish for
`p`-primary coefficients, the strict one allows arbitrary discrete coefficients and asks only the
`p`-primary part of `Hⁱ` to vanish. Swapping either half gives the wrong invariant, and dropping `p`
from the second gives one that does not depend on `p` at all. -/
abbrev StrictCohomologicalDimensionLE (n : ℕ) : Prop :=
  TauCeti.StrictCohomologicalDimensionLE.{0} p G n

/-- **Layer 11, `cd_p`,** Tau Ceti's `TauCeti.cohomologicalDimensionAt`: the infimum in `ℕ∞` of the
naturals satisfying the ordinary predicate, so that infinite cohomological dimension is `⊤` rather
than an absent value. -/
noncomputable abbrev cd_p : ℕ∞ :=
  TauCeti.cohomologicalDimensionAt.{0} p G

/-- **Layer 11, `scd_p`,** Tau Ceti's `TauCeti.strictCohomologicalDimensionAt`. -/
noncomputable abbrev scd_p : ℕ∞ :=
  TauCeti.strictCohomologicalDimensionAt.{0} p G

/-- **Layer 11, `cd G = ⨆ p, cd_p G`,** over primes: Tau Ceti's `TauCeti.cohomologicalDimension`,
with `TauCeti.cohomologicalDimension_le_iff` and
`TauCeti.cohomologicalDimensionAt_le_cohomologicalDimension`. -/
noncomputable abbrev cd : ℕ∞ :=
  TauCeti.cohomologicalDimension.{0} G

/-- **Layer 11, `cd_p G ≤ n ↔ CohomologicalDimensionLE p G n`,** the reason the predicate is named
in its own right rather than folded into the infimum: Tau Ceti's
`TauCeti.cohomologicalDimensionAt_le_iff`. -/
theorem cd_p_le_iff (n : ℕ) : cd_p p G ≤ (n : ℕ∞) ↔ CohomologicalDimensionLE p G n :=
  TauCeti.cohomologicalDimensionAt_le_iff p G n

/-- **Layer 11, the same characterization for `scd_p`,** Tau Ceti's
`TauCeti.strictCohomologicalDimensionAt_le_iff`. -/
theorem scd_p_le_iff (n : ℕ) : scd_p p G ≤ (n : ℕ∞) ↔ StrictCohomologicalDimensionLE p G n :=
  TauCeti.strictCohomologicalDimensionAt_le_iff p G n

variable [CompactSpace G]

/-- **Layer 11, `p`-primary coefficients give `p`-primary cohomology**, in every degree, `n = 0`
included: every class of `Hⁿ(G, M)` is killed by a power of `p`, which read at a class `x` is a
`k : ℕ` with `p ^ k • x = 0` (`AddCommGroup.mem_primaryComponent`). Only compactness of `G` is used.
This is Tau Ceti's `TauCeti.isPPrimaryTorsion_continuousCohomology`, at the object
`ofDiscreteModule G M`, whose underlying module is `M` (`TauCeti.ofDiscreteModule_V`). Its route is
on Mathlib's canonical complex, with no functions on `Gⁿ` and no finite quotients: a continuous map
from the compact `G` into a discrete `p`-primary group has finite image, so one power of `p` kills
it (`TauCeti.IsPPrimaryTorsion.continuousMap`); every term `C(G, C(G, …, M))` of the coinduced
resolution is discrete, so each is `p`-primary by induction on the number of arguments
(`TauCeti.isPPrimaryTorsion_resolutionX`), and so are the homogeneous cochains, invariant elements
of those terms (`TauCeti.isPPrimaryTorsion_homogeneousCochains`), and their cohomology, a
subquotient. It is the step from the strict predicate to the ordinary one in `cd_p_le_scd_p`.
⚠ Compactness is not decoration: for the discrete group `⊕_ℕ ℤ` acting trivially,
`H¹(⊕_ℕ ℤ, ℚ_p/ℤ_p) = ∏_ℕ ℚ_p/ℤ_p`, and the element with `k`-th coordinate `1/pᵏ` is killed by no
power of `p`. -/
theorem isPPrimaryTorsion_continuousCohomology (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (hM : IsPPrimaryTorsion p M) (n : ℕ) :
    IsPPrimaryTorsion p ((continuousCohomology ℤ G n).obj (ofDiscreteModule G M)) :=
  TauCeti.isPPrimaryTorsion_continuousCohomology (ofDiscreteModule G M) hM n

/-- **Layer 11, `cd_p ≤ scd_p`** (NSW (3.3.3)), Tau Ceti's
`TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt`, which rests on
`isPPrimaryTorsion_continuousCohomology` through
`TauCeti.StrictCohomologicalDimensionLE.cohomologicalDimensionLE`. -/
theorem cd_p_le_scd_p : cd_p p G ≤ scd_p p G :=
  TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt p G

end CohomologicalDimensionInvariants

section CohomologicalDimension

open CategoryTheory

variable (p : ℕ) [hp : Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 11, the second interface for ordinary dimension** (NSW (3.3.1)): vanishing of the
`p`-primary component of `Hⁱ(G, M)` for every discrete **torsion** `M`. It is one torsion
hypothesis away from the strict predicate, which is why all three statements are kept apart. -/
theorem cohomologicalDimensionLE_iff_torsion (n : ℕ) :
    CohomologicalDimensionLE p G n ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
        [DistribMulAction G M] [ContinuousSMul G M],
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
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
        [DistribMulAction G M] [ContinuousSMul G M] [Finite M],
        IsPPrimaryTorsion p M →
          Subsingleton ((continuousCohomology ℤ G (n + 1)).obj (ofDiscreteModule G M)) :=
  sorry

/-- **Layer 11, dévissage to coefficients of bounded exponent.** Testing only the modules killed by
a single power of `p` is enough, because an arbitrary `p`-primary module is the filtered colimit of
its `pᵏ`-torsion submodules and Layer 10's cohomology commutes with those colimits. This is the
reduction a consumer working with `𝔽_p`-coefficients needs, and it is a theorem here rather than
the definition of `cd_p`. It is `TauCeti.cohomologicalDimensionLE_iff` with the coefficient
condition changed. -/
theorem cd_p_le_iff_boundedExponent (n : ℕ) :
    cd_p p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
        [DistribMulAction G M] [ContinuousSMul G M],
        (∃ k : ℕ, ∀ m : M, (p ^ k) • m = 0) → ∀ i : ℕ, n < i →
          Subsingleton ((continuousCohomology ℤ G i).obj (ofDiscreteModule G M)) :=
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

/-- **Layer 11, the strict dimension of an open subgroup** (NSW (3.3.5)): `scd_p U ≤ scd_p G`,
because `Hⁱ(U, A) ≅ Hⁱ(G, Coind_U^G A)` by Layer 10's `shapiroIso`. -/
theorem strictCohomologicalDimensionAt_openSubgroup_le (U : OpenSubgroup G) :
    scd_p p U.toSubgroup ≤ scd_p p G :=
  sorry

/-- **Layer 11, the strict dimension from the ordinary one** (NSW (3.3.4) and its proof):
`scd_p G ≤ n` exactly when `cd_p G ≤ n` and the `p`-primary part of `H^{n+1}(U, ℤ)` vanishes for
every open `U`, with `ℤ` carrying the trivial action. The forward direction is `cd_p ≤ scd_p`
together with the previous statement. For the converse, `scd_p G ≤ cd_p G + 1` (NSW (3.3.3))
disposes of every degree above `n + 1`. In degree `n + 1`, a discrete module finitely generated
over `ℤ` is a quotient `B ⧸ C` of `B = Coind_U^G (ℤ^m)` for an open `U` acting trivially on it; the
`p`-primary parts of `H^{n+1}(G, B) ≅ H^{n+1}(U, ℤ)^m` and of `H^{n+2}(G, C)` vanish, and taking
`p`-primary parts is exact on torsion groups. Layer 10's filtered colimits then give every discrete
module. The statement holds for every `n`. -/
theorem strictCohomologicalDimensionAt_le_iff_forall_openSubgroup (n : ℕ) :
    scd_p p G ≤ n ↔
      cd_p p G ≤ n ∧
        ∀ U : OpenSubgroup G, AddCommGroup.primaryComponent
          ((continuousCohomology ℤ U.toSubgroup (n + 1)).obj
            (TopRep.of (ContRepresentation.trivial ℤ U.toSubgroup (ULift.{u} ℤ)))) p = ⊥ :=
  sorry

/-- **Layer 11, `V^ab(p)`,** the maximal pro-`p` quotient of the topological abelianization of `V`:
Tau Ceti's `maximalProPQuotient` of Mathlib's `TopologicalAbelianization`. -/
abbrev abelianizationProP (V : Subgroup G) : Type u :=
  TauCeti.maximalProPQuotient p (TopologicalAbelianization V)

/-- **Layer 11, the conjugation action of `G ⧸ V` on `V^ab(p)`.** The action Tau Ceti puts on
`TopologicalAbelianization V` (the class of `g` sends the class of `n` to the class of `g n g⁻¹`,
`TopologicalAbelianization.mk_smul_mk`), carried to the maximal pro-`p` quotient by
`TauCeti.maximalProPQuotient.map`. -/
noncomputable instance abelianizationProPAction (V : Subgroup G) [V.Normal] :
    MulDistribMulAction (G ⧸ V) (abelianizationProP p G V) where
  smul q := TauCeti.maximalProPQuotient.map
    (MulDistribMulAction.toMonoidHom (TopologicalAbelianization V) q) (continuous_const_smul q)
  one_smul x := by
    induction x using QuotientGroup.induction_on with | H y => ?_
    show (QuotientGroup.mk ((1 : G ⧸ V) • y) : abelianizationProP p G V) = QuotientGroup.mk y
    rw [one_smul]
  mul_smul q r x := by
    induction x using QuotientGroup.induction_on with | H y => ?_
    show (QuotientGroup.mk ((q * r) • y) : abelianizationProP p G V) =
      QuotientGroup.mk (q • r • y)
    rw [mul_smul]
  smul_mul q x y := map_mul _ x y
  smul_one q := map_one _

/-- The same action in additive notation, the form the explicit model of Layer 2 takes. Mathlib has
no bridge from `MulDistribMulAction M A` to `DistribMulAction M (Additive A)`, so it is transported
here as for `KummerCoeff`. -/
noncomputable instance abelianizationProPAdditiveAction (V : Subgroup G) [V.Normal] :
    DistribMulAction (G ⧸ V) (Additive (abelianizationProP p G V)) where
  smul q x := Additive.ofMul (q • Additive.toMul x)
  one_smul x := by
    show Additive.ofMul ((1 : G ⧸ V) • Additive.toMul x) = _
    rw [one_smul]; rfl
  mul_smul q r x := by
    show Additive.ofMul ((q * r) • Additive.toMul x) = _
    rw [mul_smul]; rfl
  smul_zero q := by
    show Additive.ofMul (q • (1 : abelianizationProP p G V)) = _
    rw [smul_one]; rfl
  smul_add q x y := by
    show Additive.ofMul (q • (Additive.toMul x * Additive.toMul y)) = _
    rw [smul_mul']; rfl

/-- **Layer 11, the action is continuous:** it is on `TopologicalAbelianization V` (Tau Ceti's
`ContinuousSMul` instance there), and the projection to the maximal pro-`p` quotient is an open
quotient map. -/
instance abelianizationProP_continuousSMul (V : Subgroup G) [V.Normal] :
    ContinuousSMul (G ⧸ V) (Additive (abelianizationProP p G V)) :=
  sorry

/-- **Layer 11, the factor set of the extension** `1 → V^ab(p) → G ⧸ K → G ⧸ V → 1`, where `K` is
the kernel of `V → V^ab(p)`: `(q, r) ↦ q.out * r.out * (q * r).out⁻¹` read in `V^ab(p)`, with the
representatives chosen by `Quotient.out` (NSW (3.6.2), proof). -/
noncomputable def abelianizationProPFactorSet (V : Subgroup G) [V.Normal] :
    (G ⧸ V) × (G ⧸ V) → Additive (abelianizationProP p G V) :=
  fun q => Additive.ofMul (TauCeti.maximalProPQuotient.mk p (TopologicalAbelianization V)
    (QuotientGroup.mk (⟨q.1.out * q.2.out * (q.1 * q.2).out⁻¹,
      out_mul_out_mul_inv_mem V q.1 q.2⟩ : V)))

/-- **Layer 11, the factor set is a continuous 2-cocycle** of `G ⧸ V` with values in `V^ab(p)`,
for an **open** normal `V`; the cocycle identity is associativity in `G ⧸ K`. Membership in `Z²`
includes continuity on `(G ⧸ V) × (G ⧸ V)`, and it is openness that supplies it: `G ⧸ V` is then
finite and discrete (`QuotientGroup.discreteTopology`), so every function on it is continuous. For
a subgroup that is not open the representatives `Quotient.out` need not vary continuously, and the
class of the extension would have to be read through a continuous section instead
(`TauCeti.GroupExtension.contCohomologyClass_factorSet_eq`). -/
theorem abelianizationProPFactorSet_mem_Z2 (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) :
    abelianizationProPFactorSet p G V ∈ Z2 (G ⧸ V) (Additive (abelianizationProP p G V)) :=
  sorry

/-- **Layer 11, the class `u_{G/V}(p)` of the extension of `G ⧸ V` by `V^ab(p)`,** for an open
normal `V`. Other representatives change the factor set by a coboundary, so this is the class of
the extension; it is the image of NSW's `u_{G/V} ∈ H²(G ⧸ V, V^ab)` under `V^ab → V^ab(p)`. -/
noncomputable def abelianizationProPClass (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G)) :
    H2 (G ⧸ V) (Additive (abelianizationProP p G V)) :=
  H2pi (G ⧸ V) (Additive (abelianizationProP p G V))
    ⟨abelianizationProPFactorSet p G V, abelianizationProPFactorSet_mem_Z2 p G V hV⟩

/-- **Layer 11, NSW (3.3.11), surjectivity of corestriction in the top degree.** For
`scd_p G ≤ n` and an open subgroup `V`, every `p`-primary class of `Hⁿ(G, X)` is the corestriction
of a `p`-primary class of `Hⁿ(V, X)`. Route: Layer 10's `longExact_exact` for
`0 → B → Coind_V^G X → X → 0`, the last map `coindTrace`; `shapiroIso` identifies the middle term
with `Hⁿ(V, X)` and the induced map with `corestriction`; `H^{n+1}(G, B)(p) = 0` since
`scd_p G ≤ n`; and taking `p`-primary parts is exact on these torsion groups (Layer 10's torsion
statement). -/
theorem corestriction_surjective_primaryComponent (n : ℕ)
    (hG : scd_p p G ≤ n) (V : OpenSubgroup G)
    (X : TopRep ℤ G) (hX : IsSmoothDiscrete ℤ X)
    (z : (continuousCohomology ℤ G n).obj X)
    (hz : z ∈ AddCommGroup.primaryComponent ((continuousCohomology ℤ G n).obj X) p) :
    ∃ y ∈ AddCommGroup.primaryComponent ((continuousCohomology ℤ V.toSubgroup n).obj
        ((TopRep.resFunctor V.toSubgroup.subtype).obj X)) p,
      (corestriction ℤ V X hX n).hom y = z :=
  sorry

/-- **Layer 11, NSW (3.3.11), injectivity of corestriction on the coinvariants.** For
`scd_p G ≤ n` and an open normal `V`, a `p`-primary class of `Hⁿ(V, X)` whose corestriction
vanishes lies in the subgroup generated by the differences `(g)_* w - w` of `p`-primary classes,
`(g)_*` Layer 10's `conjMapOf`. Route: the augmentation sequence `0 → I → ℤ[G ⧸ V] → ℤ → 0`
tensored with `X`, whose middle term is `Coind_V^G X` and whose last map is the trace, and the
cover `⊕_{σ ∈ G ⧸ V} Coind_V^G X → I ⊗ X`, `e_σ ⊗ x ↦ (σ - 1) ⊗ x`; the vanishing of
`H^{n+1}(G, -)(p)` makes `Hⁿ(G, ⊕ Coind_V^G X)(p) → Hⁿ(G, I ⊗ X)(p)` surjective, and under
`shapiroIso` right multiplication by `σ - 1` on `Coind_V^G X` is `(σ)_* - 1` on `Hⁿ(V, X)`. -/
theorem corestriction_ker_primaryComponent (n : ℕ)
    (hG : scd_p p G ≤ n) (V : OpenSubgroup G)
    [V.toSubgroup.Normal] (X : TopRep ℤ G) (hX : IsSmoothDiscrete ℤ X)
    (y : (continuousCohomology ℤ V.toSubgroup n).obj
      ((TopRep.resFunctor V.toSubgroup.subtype).obj X))
    (hy : y ∈ AddCommGroup.primaryComponent ((continuousCohomology ℤ V.toSubgroup n).obj
      ((TopRep.resFunctor V.toSubgroup.subtype).obj X)) p)
    (hcor : (corestriction ℤ V X hX n).hom y = 0) :
    y ∈ AddSubgroup.closure {z | ∃ (g : G) (w : (continuousCohomology ℤ V.toSubgroup n).obj
        ((TopRep.resFunctor V.toSubgroup.subtype).obj X)),
      w ∈ AddCommGroup.primaryComponent ((continuousCohomology ℤ V.toSubgroup n).obj
        ((TopRep.resFunctor V.toSubgroup.subtype).obj X)) p ∧
      z = (conjMapOf ℤ g V V (conjOpenSubgroup_eq_of_normal V g).symm X n).hom w - w} :=
  sorry

/-- **Layer 11, the quotient map `V → V^ab(p)`:** Mathlib's quotient map onto the topological
abelianization, then Tau Ceti's `maximalProPQuotient.mk`. -/
noncomputable def abelianizationProPMk (V : Subgroup G) : V →* abelianizationProP p G V :=
  (TauCeti.maximalProPQuotient.mk p (TopologicalAbelianization V)).comp
    (QuotientGroup.mk' (Subgroup.topologicalClosure (commutator V)))

/-- **Layer 11, the transfer `Ver : G → V^ab(p)`** for an open subgroup `V` (NSW (1.5.9), the
Verlagerung), which is Mathlib's `MonoidHom.transfer` of `abelianizationProPMk`. An open subgroup
of the compact `G` has finite index (`Subgroup.quotient_finite_of_isOpen`,
`Subgroup.finiteIndex_of_finite_quotient`). -/
noncomputable def abelianizationProPTransfer (V : Subgroup G) (hV : IsOpen (V : Set G)) :
    G →* abelianizationProP p G V :=
  haveI : Finite (G ⧸ V) := V.quotient_finite_of_isOpen hV
  haveI : V.FiniteIndex := V.finiteIndex_of_finite_quotient
  MonoidHom.transfer (abelianizationProPMk p G V)

/-- **Layer 11, the transfer is continuous:** on each coset of the open `V` every transversal word
is a continuous function of the argument (Layer 6's `lWord`), and `abelianizationProPMk` is
continuous. -/
theorem continuous_abelianizationProPTransfer (V : Subgroup G) (hV : IsOpen (V : Set G)) :
    Continuous (abelianizationProPTransfer p G V hV) :=
  sorry

/-- **Layer 11, NSW (1.5.9) on cochains: the transfer is the product of the transversal words.**
For any transversal `t`, `Ver γ = ∏_u [ℓᵗ_u(γ)]`, with Layer 6's word `ℓᵗ_u(γ)` read in `V^ab(p)`:
Mathlib's `MonoidHom.transfer_def` at the left transversal `t`, whose `diff` is exactly this
product. Consequently Layer 6's degree-one corestriction of a character `ψ` of `V^ab(p)`, with
trivial coefficients, is `ψ ∘ Ver`: its formula `γ ↦ ∑_u ψ (ℓᵗ_u(γ))` is `ψ` of this product. -/
theorem abelianizationProPTransfer_eq_prod_lWord (V : Subgroup G) (hV : IsOpen (V : Set G))
    [Fintype (G ⧸ V)] (t : G ⧸ V → G) (ht : ∀ x : G ⧸ V, (QuotientGroup.mk (t x) : G ⧸ V) = x)
    (γ : G) :
    abelianizationProPTransfer p G V hV γ =
      ∏ u : G ⧸ V, abelianizationProPMk p G V ⟨lWord V t u γ, lWord_mem V t ht u γ⟩ :=
  sorry

/-- **Layer 11, NSW (1.5.9): `V → G → V^ab(p)` is the norm.** For `v ∈ V`,
`Ver v = ∏_{q : G ⧸ V} q • [v]` for the conjugation action `abelianizationProPAction`: by
`abelianizationProPTransfer_eq_prod_lWord` at `t = Quotient.out`, the word of `v` at `u` is
`(u.out)⁻¹ v u.out`, since `v` fixes every coset of the normal subgroup `V`. -/
theorem abelianizationProPTransfer_apply_of_mem (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) [Fintype (G ⧸ V)] (v : V) :
    abelianizationProPTransfer p G V hV v = ∏ q : G ⧸ V, q • abelianizationProPMk p G V v :=
  sorry

/-- **Layer 11, NSW (3.6.2), the transfer of a representative is the sum of the factor set:**
`Ver σ.out = ∑_τ u(τ, σ)` in `V^ab(p)`, for the factor set `abelianizationProPFactorSet`. Mathlib's
transfer at the left transversal `q ↦ ((q⁻¹).out)⁻¹`, whose word at `q = τ⁻¹` is
`τ.out σ.out (τ σ).out⁻¹`. This is the identification of the factor-set class with the map
`σ ↦ ∏_τ u(τ, σ)` that NSW's diagram (3.6.2) calls `ρ`. -/
theorem abelianizationProPTransfer_out (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G))
    [Fintype (G ⧸ V)] (σ : G ⧸ V) :
    Additive.ofMul (abelianizationProPTransfer p G V hV σ.out) =
      ∑ τ : G ⧸ V, abelianizationProPFactorSet p G V (τ, σ) :=
  sorry

/-- **Layer 11, continuous characters of a pro-`p` abelian group separate points modulo a closed
subgroup.** This is the only duality the class module uses. Route: an open subgroup containing
`I` and missing `y` (`y ∉ I` and `I` is closed in the profinite `Y`), the finite abelian quotient,
which is a `p`-group because `Y` is pro-`p` (`TauCeti.IsProP`), and a character of a finite
abelian `p`-group into `ZMod (p ^ k)` not killing a given element (Mathlib's structure theorem
`AddCommGroup.equiv_directSum_zmod_of_finite`). -/
theorem exists_continuous_zmodChar_of_notMem {Y : Type*} [CommGroup Y] [TopologicalSpace Y]
    [IsTopologicalGroup Y] [CompactSpace Y] [TotallyDisconnectedSpace Y]
    (hY : TauCeti.IsProP p Y) (I : Subgroup Y) (hI : IsClosed (I : Set Y)) (y : Y)
    (hy : y ∉ I) :
    ∃ (k : ℕ) (χ : Y →* Multiplicative (ZMod (p ^ k))), Continuous χ ∧ (∀ x ∈ I, χ x = 1) ∧
      χ y ≠ 1 :=
  sorry

/-- **Layer 11, characters of `G` of `p`-power order die on the kernel of the transfer,** for
`scd_p G ≤ 2`: the surjectivity half of NSW (3.3.11), read on characters through NSW (1.5.9). -/
theorem zmodChar_eq_one_of_transfer_eq_one
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (k : ℕ) (χ : G →* Multiplicative (ZMod (p ^ k)))
    (hχ : Continuous χ) (g : G) (hg : abelianizationProPTransfer p G V hV g = 1) :
    χ g = 1 :=
  sorry

/-- **Layer 11, a character of `V^ab(p)` that dies on the image of the transfer dies on the
invariants,** for `scd_p G ≤ 2`: the injectivity half of NSW (3.3.11), read on characters through
NSW (1.5.9). -/
theorem zmodChar_eq_one_of_comp_transfer_eq_one
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (k : ℕ)
    (ψ : abelianizationProP p G V →* Multiplicative (ZMod (p ^ k))) (hψ : Continuous ψ)
    (hψVer : ∀ g : G, ψ (abelianizationProPTransfer p G V hV g) = 1)
    (a : abelianizationProP p G V) (ha : ∀ q : G ⧸ V, q • a = a) :
    ψ a = 1 :=
  sorry

/-- **Layer 11, NSW (3.6.4) (i) ⇒ (ii) in `p`-primary form, injectivity:** for `scd_p G ≤ 2` and
an open normal `V`, the kernel of `Ver` is the kernel of `G → G^ab(p)`. One inclusion holds because
`Ver` is continuous into an abelian pro-`p` group; the other is
`zmodChar_eq_one_of_transfer_eq_one` with `exists_continuous_zmodChar_of_notMem` on `G^ab(p)`. -/
theorem abelianizationProPTransfer_eq_one_iff
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (g : G) :
    abelianizationProPTransfer p G V hV g = 1 ↔
      TauCeti.maximalProPQuotient.mk p (TopologicalAbelianization G)
        (QuotientGroup.mk g : TopologicalAbelianization G) = 1 :=
  sorry

/-- **Layer 11, NSW (3.6.4) (i) ⇒ (ii) in `p`-primary form, the image:** for `scd_p G ≤ 2` and an
open normal `V`, the image of `Ver` is the `G ⧸ V`-invariants of `V^ab(p)`. It lies in them since
`Ver` is invariant under conjugation; it is closed, being compact; and an invariant outside it is
separated from it by a character (`exists_continuous_zmodChar_of_notMem`), which
`zmodChar_eq_one_of_comp_transfer_eq_one` forbids. -/
theorem abelianizationProPTransfer_range
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) :
    Set.range (abelianizationProPTransfer p G V hV) = {a | ∀ q : G ⧸ V, q • a = a} :=
  sorry

/-- **Layer 11, NSW (3.6.2) for cyclic `G ⧸ V`: `V^ab(p)_{G/V} → G^ab(p)` is injective.** For
`G ⧸ V` a cyclic `p`-group generated by the image of `s`, an element of `V` that dies in `G^ab(p)`
has class `(s • b) / b` in `V^ab(p)`. Route, with no group homology: the quotient `E` of `G` by
the preimage of `(s - 1) V^ab(p)` is an extension of the cyclic `G ⧸ V` by the central
`V^ab(p)_{G/V}`, hence abelian, and pro-`p`, being an extension of a `p`-group by a pro-`p` group;
so `G → E` factors through `G^ab(p)`, and `V^ab(p)_{G/V}` embeds in `E`. -/
theorem abelianizationProPMk_eq_smul_div_of_mk_eq_one (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (hpV : IsPGroup p (G ⧸ V)) (s : G)
    (hs : ∀ q : G ⧸ V, q ∈ Subgroup.zpowers (QuotientGroup.mk s : G ⧸ V)) (v : V)
    (hv : TauCeti.maximalProPQuotient.mk p (TopologicalAbelianization G)
      (QuotientGroup.mk (v : G) : TopologicalAbelianization G) = 1) :
    ∃ b : abelianizationProP p G V,
      abelianizationProPMk p G V v = ((QuotientGroup.mk s : G ⧸ V) • b) / b :=
  sorry

/-- **Layer 11, the class module for `G ⧸ V` of order `p`, degree one** (NSW (3.6.4) (ii) ⇒ (iii),
without the diagram (3.6.2)). By `subsingleton_H1_of_isCyclic` it is enough that an `a` killed by
the norm is `σ • b - b`: write `a = [v]`, `v ∈ V`; then `Ver v = N a = 1`
(`abelianizationProPTransfer_apply_of_mem`), so `v` dies in `G^ab(p)`
(`abelianizationProPTransfer_eq_one_iff`), and `abelianizationProPMk_eq_smul_div_of_mk_eq_one`
concludes. -/
theorem subsingleton_h1_abelianizationProP_of_card_eq_prime
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (hcard : Nat.card (G ⧸ V) = p) :
    Subsingleton (H1 (G ⧸ V) (Additive (abelianizationProP p G V))) :=
  sorry

/-- **Layer 11, the class module for `G ⧸ V` of order `p`, degree two.** Under
`explicitH2CyclicEquiv` at a generator `σ`, the class `u_{G/V}` goes to the class of
`∑_τ u(τ, σ) = Ver σ.out` (`explicitH2CyclicEquiv_mk`, `abelianizationProPTransfer_out`). The
invariants are the image of `Ver` (`abelianizationProPTransfer_range`), and
`Ver (σ.out ^ i v) = i • Ver σ.out + N [v]` (`abelianizationProPTransfer_apply_of_mem`), so the
class of `Ver σ.out` generates the invariants modulo the norms; `p • Ver σ.out = Ver (σ.out ^ p)` is a
norm since `σ.out ^ p ∈ V`; and `Ver σ.out` is not a norm, for `Ver σ.out = Ver v` would put
`σ.out v⁻¹` in the kernel of `G → G^ab(p)` (`abelianizationProPTransfer_eq_one_iff`), which maps
onto the abelian `p`-group `G ⧸ V`, while `σ ≠ 1`. -/
theorem abelianizationProPClass_generates_of_card_eq_prime
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (hcard : Nat.card (G ⧸ V) = p) :
    AddSubgroup.zmultiples (abelianizationProPClass p G V hV) = ⊤ ∧
      Nat.card (H2 (G ⧸ V) (Additive (abelianizationProP p G V))) = p :=
  sorry

/-- **Layer 11, restriction to a subgroup of `G ⧸ V` with coefficients `V^ab(p)`, degree one,**
`f ↦ f|_S`: Tau Ceti's `TauCeti.ContCohomology.explicitRes1` at these coefficients, which carries no
discreteness hypothesis on them. -/
noncomputable abbrev abelianizationProPRes1 (V : Subgroup G) [V.Normal] (S : Subgroup (G ⧸ V)) :
    H1 (G ⧸ V) (Additive (abelianizationProP p G V)) →+
      H1 S (Additive (abelianizationProP p G V)) :=
  TauCeti.ContCohomology.explicitRes1 (G ⧸ V) (Additive (abelianizationProP p G V)) S

/-- **Layer 11, the same restriction in degree two,** `f ↦ f|_{S × S}`: Tau Ceti's
`TauCeti.ContCohomology.explicitRes2` at these coefficients. -/
noncomputable abbrev abelianizationProPRes2 (V : Subgroup G) [V.Normal] (S : Subgroup (G ⧸ V)) :
    H2 (G ⧸ V) (Additive (abelianizationProP p G V)) →+
      H2 S (Additive (abelianizationProP p G V)) :=
  TauCeti.ContCohomology.explicitRes2 (G ⧸ V) (Additive (abelianizationProP p G V)) S

/-- **Layer 11, `V^ab(p)` does not depend on the ambient group:** for `V ≤ W`, the maximal
pro-`p` abelian quotient of `V.subgroupOf W` is that of `V`, through
`Subgroup.subgroupOfEquivOfLe`, a homeomorphism, carried by `TopologicalAbelianization.map` and
`TauCeti.maximalProPQuotient.map`. -/
noncomputable def abelianizationProPSubgroupOfEquiv (V W : Subgroup G) (hVW : V ≤ W) :
    abelianizationProP p W (V.subgroupOf W) ≃* abelianizationProP p G V :=
  sorry

/-- **Layer 11, the identification of `V^ab(p)` computed in `W` with `V^ab(p)` is continuous,**
being induced by the homeomorphism `Subgroup.subgroupOfEquivOfLe`. -/
theorem continuous_abelianizationProPSubgroupOfEquiv (V W : Subgroup G) (hVW : V ≤ W) :
    Continuous (abelianizationProPSubgroupOfEquiv p G V W hVW) :=
  sorry

/-- **Layer 11, and so is its inverse.** -/
theorem continuous_abelianizationProPSubgroupOfEquiv_symm (V W : Subgroup G) (hVW : V ≤ W) :
    Continuous (abelianizationProPSubgroupOfEquiv p G V W hVW).symm :=
  sorry

/-- **Layer 11, the identification intertwines the two conjugation actions:** that of
`W ⧸ V.subgroupOf W` on `V^ab(p)` computed in `W`, and that of its image `W.map (mk' V)` in
`G ⧸ V`, through `quotientSubgroupOfEquivMap`. -/
theorem abelianizationProPSubgroupOfEquiv_smul (V W : Subgroup G) [V.Normal] (hVW : V ≤ W)
    (q : W.map (QuotientGroup.mk' V)) (a : abelianizationProP p W (V.subgroupOf W)) :
    abelianizationProPSubgroupOfEquiv p G V W hVW ((quotientSubgroupOfEquivMap V W).symm q • a) =
      (q : G ⧸ V) • abelianizationProPSubgroupOfEquiv p G V W hVW a :=
  sorry

/-- **Layer 11, the explicit `H¹` of the pair `V ◁ W` computed in `W` is that of the subgroup
`W.map (mk' V)` of `G ⧸ V`:** Layer 2's compatible-pair pullback along an isomorphism,
`explicitMap1Equiv`, at `quotientSubgroupOfEquivMap` (a homeomorphism, both groups being discrete
since `V` is open) and `abelianizationProPSubgroupOfEquiv`, which intertwine the two conjugation
actions. -/
noncomputable def abelianizationProPSubgroupOfH1Equiv (V W : Subgroup G) [V.Normal]
    (hVW : V ≤ W) (hV : IsOpen (V : Set G)) :
    H1 (W ⧸ V.subgroupOf W) (Additive (abelianizationProP p W (V.subgroupOf W))) ≃+
      H1 (W.map (QuotientGroup.mk' V)) (Additive (abelianizationProP p G V)) :=
  haveI : DiscreteTopology (G ⧸ V) := QuotientGroup.discreteTopology hV
  haveI : DiscreteTopology (W ⧸ V.subgroupOf W) :=
    QuotientGroup.discreteTopology (Subgroup.subgroupOf_isOpen W V hV)
  explicitMap1Equiv (W ⧸ V.subgroupOf W) (Additive (abelianizationProP p W (V.subgroupOf W)))
    (W.map (QuotientGroup.mk' V)) (Additive (abelianizationProP p G V))
    { toMulEquiv := (quotientSubgroupOfEquivMap V W).symm
      continuous_toFun := continuous_of_discreteTopology
      continuous_invFun := continuous_of_discreteTopology }
    (abelianizationProPSubgroupOfEquiv p G V W hVW).toAdditive
    (continuous_abelianizationProPSubgroupOfEquiv p G V W hVW)
    (continuous_abelianizationProPSubgroupOfEquiv_symm p G V W hVW)
    (fun q a => congrArg Additive.ofMul
      (abelianizationProPSubgroupOfEquiv_smul p G V W hVW q (Additive.toMul a)))

/-- **Layer 11, the same in degree two:** Tau Ceti's `TauCeti.ContCohomology.explicitMap2Equiv` at
the same pair. -/
noncomputable def abelianizationProPSubgroupOfH2Equiv (V W : Subgroup G) [V.Normal]
    (hVW : V ≤ W) (hV : IsOpen (V : Set G)) :
    H2 (W ⧸ V.subgroupOf W) (Additive (abelianizationProP p W (V.subgroupOf W))) ≃+
      H2 (W.map (QuotientGroup.mk' V)) (Additive (abelianizationProP p G V)) :=
  haveI : DiscreteTopology (G ⧸ V) := QuotientGroup.discreteTopology hV
  haveI : DiscreteTopology (W ⧸ V.subgroupOf W) :=
    QuotientGroup.discreteTopology (Subgroup.subgroupOf_isOpen W V hV)
  TauCeti.ContCohomology.explicitMap2Equiv (W ⧸ V.subgroupOf W)
    (Additive (abelianizationProP p W (V.subgroupOf W)))
    (W.map (QuotientGroup.mk' V)) (Additive (abelianizationProP p G V))
    { toMulEquiv := (quotientSubgroupOfEquivMap V W).symm
      continuous_toFun := continuous_of_discreteTopology
      continuous_invFun := continuous_of_discreteTopology }
    (abelianizationProPSubgroupOfEquiv p G V W hVW).toAdditive
    (continuous_abelianizationProPSubgroupOfEquiv p G V W hVW)
    (continuous_abelianizationProPSubgroupOfEquiv_symm p G V W hVW)
    (fun q a => congrArg Additive.ofMul
      (abelianizationProPSubgroupOfEquiv_smul p G V W hVW q (Additive.toMul a)))

/-- **Layer 11, NSW (3.6.1) (i): the class of the pair `V ◁ W` is the restriction of the class of
`V ◁ G`.** On factor sets, the restriction of `(σ, τ) ↦ σ.out τ.out (σ τ).out⁻¹` to
`W.map (mk' V)` is the factor set of the extension of `W ⧸ V` by `V^ab(p)` for the
representatives `σ.out ∈ W`, and every choice of representatives gives the same class. -/
theorem abelianizationProPSubgroupOfH2Equiv_class (V W : Subgroup G) [V.Normal] (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) [CompactSpace W] [TotallyDisconnectedSpace W] :
    abelianizationProPSubgroupOfH2Equiv p G V W hVW hV
        (abelianizationProPClass p W (V.subgroupOf W) (Subgroup.subgroupOf_isOpen W V hV)) =
      abelianizationProPRes2 p G V (W.map (QuotientGroup.mk' V))
        (abelianizationProPClass p G V hV) :=
  sorry

/-- **Layer 11, the transfer from `W` to `V^ab(p)`, on `W^ab(p)`,** for open normal `V ≤ W` of
`G`: Mathlib's `MonoidHom.transfer` of `abelianizationProPMk` along
`Subgroup.subgroupOfEquivOfLe`, descended through `W^ab(p)` since `V^ab(p)` is abelian and
pro-`p` (`TopologicalAbelianization`'s universal property and
`TauCeti.maximalProPQuotient.lift`). -/
noncomputable def abelianizationProPTransferLe (V W : Subgroup G) (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) :
    abelianizationProP p G W →* abelianizationProP p G V :=
  sorry

/-- **Layer 11, the transfer from `W` to `V` is continuous,** as the transfer to an open subgroup
is (`continuous_abelianizationProPTransfer` for the group `W`), descended through the open quotient
map onto `W^ab(p)`. -/
theorem continuous_abelianizationProPTransferLe (V W : Subgroup G) (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) :
    Continuous (abelianizationProPTransferLe p G V W hVW hV) :=
  sorry

/-- **Layer 11, the transfer from `W` to `V` is equivariant** for the conjugation actions of
`G ⧸ W` on `W^ab(p)` and of `G ⧸ V` on `V^ab(p)`, along the quotient map `G ⧸ V → G ⧸ W`: the
transfer of a conjugate is the conjugate of the transfer, the transversal words being conjugated
along with it. -/
theorem abelianizationProPTransferLe_smul (V W : Subgroup G) [V.Normal] [W.Normal] (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) (q : G ⧸ V) (a : abelianizationProP p G W) :
    abelianizationProPTransferLe p G V W hVW hV
        (QuotientGroup.map V W (MonoidHom.id G) (fun _ hx => hVW hx) q • a) =
      q • abelianizationProPTransferLe p G V W hVW hV a :=
  sorry

/-- **Layer 11, NSW (3.6.4) (ii) for the pair `V ◁ W`, injectivity:** the case of the group `W`,
whose strict dimension is at most that of `G` (`strictCohomologicalDimensionAt_openSubgroup_le`),
of `abelianizationProPTransfer_eq_one_iff`, transported by `abelianizationProPSubgroupOfEquiv`. -/
theorem abelianizationProPTransferLe_injective
    (hG : scd_p p G ≤ 2) (V W : Subgroup G) [V.Normal]
    [W.Normal] (hVW : V ≤ W) (hV : IsOpen (V : Set G)) :
    Function.Injective (abelianizationProPTransferLe p G V W hVW hV) :=
  sorry

/-- **Layer 11, NSW (3.6.4) (ii) for the pair `V ◁ W`, the image:** the `W.map (mk' V)`-invariants
of `V^ab(p)`, by `abelianizationProPTransfer_range` for the group `W`, transported. -/
theorem abelianizationProPTransferLe_range
    (hG : scd_p p G ≤ 2) (V W : Subgroup G) [V.Normal]
    [W.Normal] (hVW : V ≤ W) (hV : IsOpen (V : Set G)) :
    Set.range (abelianizationProPTransferLe p G V W hVW hV) =
      {a | ∀ q ∈ W.map (QuotientGroup.mk' V), q • a = a} :=
  sorry

/-- **Layer 11, the map `i` of NSW (3.6.1) (ii) in degree one:** Layer 2's compatible-pair
pullback of the quotient map `G ⧸ V → G ⧸ W` and `Ver_{W→V} = abelianizationProPTransferLe`,
which is equivariant for it. It is inflation from `G ⧸ W ≅ (G ⧸ V) ⧸ (W ⧸ V)` composed with
`Ver_{W→V} : W^ab(p) ≅ V^ab(p)^{W/V}`. The body is Tau Ceti's
`TauCeti.ContCohomology.explicitMap1` at these coefficients, the quotient map being continuous
because `G ⧸ V` is discrete. -/
noncomputable def abelianizationProPInfl1 (V W : Subgroup G) [V.Normal] [W.Normal] (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) :
    H1 (G ⧸ W) (Additive (abelianizationProP p G W)) →+
      H1 (G ⧸ V) (Additive (abelianizationProP p G V)) :=
  haveI : DiscreteTopology (G ⧸ V) := QuotientGroup.discreteTopology hV
  TauCeti.ContCohomology.explicitMap1 (G ⧸ W) (Additive (abelianizationProP p G W)) (G ⧸ V)
    (Additive (abelianizationProP p G V))
    ⟨QuotientGroup.map V W (MonoidHom.id G) (fun _ hx => hVW hx), continuous_of_discreteTopology⟩
    (abelianizationProPTransferLe p G V W hVW hV).toAdditive
    (continuous_abelianizationProPTransferLe p G V W hVW hV)
    (fun q a => congrArg Additive.ofMul
      (abelianizationProPTransferLe_smul p G V W hVW hV q (Additive.toMul a)))

/-- **Layer 11, the map `i` of NSW (3.6.1) (ii) in degree two:** Tau Ceti's
`TauCeti.ContCohomology.explicitMap2` at the same pair. -/
noncomputable def abelianizationProPInfl2 (V W : Subgroup G) [V.Normal] [W.Normal] (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) :
    H2 (G ⧸ W) (Additive (abelianizationProP p G W)) →+
      H2 (G ⧸ V) (Additive (abelianizationProP p G V)) :=
  haveI : DiscreteTopology (G ⧸ V) := QuotientGroup.discreteTopology hV
  TauCeti.ContCohomology.explicitMap2 (G ⧸ W) (Additive (abelianizationProP p G W)) (G ⧸ V)
    (Additive (abelianizationProP p G V))
    ⟨QuotientGroup.map V W (MonoidHom.id G) (fun _ hx => hVW hx), continuous_of_discreteTopology⟩
    (abelianizationProPTransferLe p G V W hVW hV).toAdditive
    (continuous_abelianizationProPTransferLe p G V W hVW hV)
    (fun q a => congrArg Additive.ofMul
      (abelianizationProPTransferLe_smul p G V W hVW hV q (Additive.toMul a)))

/-- **Layer 11, NSW (3.6.1) (ii): `i (u_{G/W}) = (W : V) • u_{G/V}`.** The inflation of `u_{G/W}`
to `G ⧸ V` and the push-forward of `u_{G/V}` along `V^ab(p) → W^ab(p)` are the same class of
`H²(G ⧸ V, W^ab(p))`, by the morphism of extensions `G ⧸ K_V → G ⧸ K_W`. `Ver_{W→V}` composed with
`V^ab(p) → W^ab(p)` is the norm `N` of `W ⧸ V` (`abelianizationProPTransfer_apply_of_mem` for the
group `W`), a `G ⧸ V`-module endomorphism of `V^ab(p)`, and `N` acts on `H²(G ⧸ V, V^ab(p))` as
multiplication by `(W : V)`: on invariants it is multiplication by `(W : V)`, and two dimension
shifts through the coinduced module of the trivial subgroup (Layer 7's acyclicity, with Layer 5's
connecting maps, natural in the coefficients) carry this to degree two. -/
theorem abelianizationProPInfl2_class (V W : Subgroup G) [V.Normal] [W.Normal] (hVW : V ≤ W)
    (hV : IsOpen (V : Set G)) :
    abelianizationProPInfl2 p G V W hVW hV
        (abelianizationProPClass p G W (Subgroup.isOpen_mono hVW hV)) =
      V.relIndex W • abelianizationProPClass p G V hV :=
  sorry

/-- **Layer 11, NSW (1.6.7) for the pair `V ≤ W`, degree one:** `i` is injective, with image the
kernel of restriction to `W.map (mk' V)`. Layer 5's `explicitInfl1_injective` and
`explicitInfRes_exact` for the normal subgroup `W.map (mk' V)` of `G ⧸ V` (Tau Ceti's landed forms
carry no discreteness hypothesis on the coefficients), with
`QuotientGroup.quotientQuotientEquivQuotient` and the isomorphism `Ver_{W→V}` onto the invariants
(`abelianizationProPTransferLe_injective`, `abelianizationProPTransferLe_range`). -/
theorem abelianizationProPInfl1_exact
    (hG : scd_p p G ≤ 2) (V W : Subgroup G) [V.Normal]
    [W.Normal] (hVW : V ≤ W) (hV : IsOpen (V : Set G)) :
    Function.Injective (abelianizationProPInfl1 p G V W hVW hV) ∧
      (abelianizationProPInfl1 p G V W hVW hV).range =
        (abelianizationProPRes1 p G V (W.map (QuotientGroup.mk' V))).ker :=
  sorry

/-- **Layer 11, NSW (1.6.7) for the pair `V ≤ W`, degree two:** when `H¹(W ⧸ V, V^ab(p)) = 0`, `i`
is injective with image the kernel of restriction to `W.map (mk' V)`. This is the degree-two
extension of Layer 5's inflation-restriction sequence (NSW (1.6.7) under vanishing of `H¹`; Milne,
*Class Field Theory*, II.1.34; Tau Ceti's `TauCeti.groupCohomology.infRes_exact` is the same
statement for Mathlib's discrete `groupCohomology`), proved on explicit cochains: a 2-cocycle
killed by restriction is cohomologous to one vanishing on `W ⧸ V`-pairs, which the vanishing of
`H¹` then makes inflated. -/
theorem abelianizationProPInfl2_exact
    (hG : scd_p p G ≤ 2) (V W : Subgroup G) [V.Normal]
    [W.Normal] (hVW : V ≤ W) (hV : IsOpen (V : Set G))
    (hH1 : Subsingleton (H1 (W.map (QuotientGroup.mk' V)) (Additive (abelianizationProP p G V)))) :
    Function.Injective (abelianizationProPInfl2 p G V W hVW hV) ∧
      (abelianizationProPInfl2 p G V W hVW hV).range =
        (abelianizationProPRes2 p G V (W.map (QuotientGroup.mk' V))).ker :=
  sorry

/-- **Layer 11, the class module for a `p`-group `G ⧸ V`, degree one** (NSW (3.6.3), `p`-primary). -/
theorem subsingleton_h1_abelianizationProP_of_isPGroup
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (hpV : IsPGroup p (G ⧸ V)) :
    Subsingleton (H1 (G ⧸ V) (Additive (abelianizationProP p G V))) :=
  sorry

/-- **Layer 11, the class module for a `p`-group `G ⧸ V`, degree two** (NSW (3.6.3), `p`-primary):
`H²(G ⧸ V, V^ab(p))` is cyclic of order `#(G ⧸ V)`, generated by `u_{G/V}`. -/
theorem abelianizationProPClass_generates_of_isPGroup
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) (hpV : IsPGroup p (G ⧸ V)) :
    AddSubgroup.zmultiples (abelianizationProPClass p G V hV) = ⊤ ∧
      Nat.card (H2 (G ⧸ V) (Additive (abelianizationProP p G V))) = Nat.card (G ⧸ V) :=
  sorry

/-- **Layer 11, `V^ab(p)` is uniquely divisible by integers prime to `p`,** for an open `V`: an
open subgroup of the compact `G` is closed, hence compact, so `V^ab(p)` is pro-`p`
(`TauCeti.isProP_maximalProPQuotient`, a statement about compact groups); on each finite quotient
`a ↦ a ^ m` is then a bijection of a finite `p`-group, these bijections are compatible, and
compactness turns them into a bijection of the limit. Openness is not decoration. For the dense
subgroup `V = ℤ` of `G = ℤ₂` at `p = 2`, the open normal subgroups `2ⁿℤ` of `V` have `2`-group
quotients and meet in `0`, so the maximal pro-`2` quotient of `V^ab = ℤ` is `ℤ` itself, and `a ↦ 3a`
misses `1` although `3` is prime to `2`. -/
theorem abelianizationProP_pow_bijective (V : Subgroup G) (hV : IsOpen (V : Set G)) (m : ℕ)
    (hm : Nat.Coprime m p) :
    Function.Bijective fun a : abelianizationProP p G V => a ^ m :=
  sorry

/-- **Layer 11, restriction to a subgroup of index prime to `p` is injective in degree one.**
`cor ∘ res = (G ⧸ V : S) •` (Layer 6, in Tau Ceti's landed form
`TauCeti.ContCohomology.explicitCor1_comp_res1`, which carries no discreteness hypothesis on the
coefficients), the same identity at the trivial subgroup kills `H¹` by `#(G ⧸ V)`, and multiplication
by the prime-to-`p` part of that order is injective (`abelianizationProP_pow_bijective`). -/
theorem abelianizationProPRes1_injective (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G))
    (S : Subgroup (G ⧸ V)) (hS : ¬ p ∣ S.index) :
    Function.Injective (abelianizationProPRes1 p G V S) :=
  sorry

/-- **Layer 11, the same in degree two** (`TauCeti.ContCohomology.explicitCor2_comp_res2`). -/
theorem abelianizationProPRes2_injective (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G))
    (S : Subgroup (G ⧸ V)) (hS : ¬ p ∣ S.index) :
    Function.Injective (abelianizationProPRes2 p G V S) :=
  sorry

/-- **Layer 11, NSW (3.6.4) (i) ⇒ (iii), degree one:** for `scd_p G ≤ 2` and an open normal `V`,
`H¹(G ⧸ V, V^ab(p)) = 0`. The route is in `README.md` Layer 11; its last step is the finite Sylow
reduction: for a Sylow `p`-subgroup `P` of `G ⧸ V` (Mathlib's `Sylow`, `Sylow.nonempty`),
restriction to `P` is injective (`abelianizationProPRes1_injective` with `Sylow.not_dvd_index`),
and `H¹(P, V^ab(p)) = 0` is `subsingleton_h1_abelianizationProP_of_isPGroup` for the preimage of
`P` (whose strict dimension is at most that of `G`,
`strictCohomologicalDimensionAt_openSubgroup_le`), carried by
`abelianizationProPSubgroupOfH1Equiv`. -/
theorem subsingleton_h1_abelianizationProP
    (hG : scd_p p G ≤ 2)
    (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G)) :
    Subsingleton (H1 (G ⧸ V) (Additive (abelianizationProP p G V))) :=
  sorry

/-- **Layer 11, NSW (3.6.4) (i) ⇒ (iii), degree two:** for `scd_p G ≤ 2` and an open normal `V`,
`H²(G ⧸ V, V^ab(p))` is cyclic of order the `p`-part of `#(G ⧸ V)`, generated by the class of the
extension. For a pair `V ◁ U` of open subgroups this applies to `U`, whose strict dimension is at
most that of `G` (`strictCohomologicalDimensionAt_openSubgroup_le`). The last step of the route is
the finite Sylow reduction: for a Sylow `p`-subgroup `P` of `G ⧸ V`, of order
`p ^ padicValNat p #(G ⧸ V)` (`Sylow.card_eq_multiplicity`, `Nat.factorization_def`), restriction
to `P` is injective (`abelianizationProPRes2_injective`, `Sylow.not_dvd_index`), and
`abelianizationProPClass_generates_of_isPGroup` for the preimage of `P`, carried by
`abelianizationProPSubgroupOfH2Equiv` and `abelianizationProPSubgroupOfH2Equiv_class`, makes the
restriction of the class a generator of a group of order `#P`. -/
theorem abelianizationProPClass_generates
    (hG : scd_p p G ≤ 2)
    (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G)) :
    AddSubgroup.zmultiples (abelianizationProPClass p G V hV) = ⊤ ∧
      Nat.card (H2 (G ⧸ V) (Additive (abelianizationProP p G V))) =
        p ^ padicValNat p (Nat.card (G ⧸ V)) :=
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
an invariant element has a class; this is the map the unit laws below name. It is Tau Ceti's
`TauCeti.ContinuousCohomology.degreeZeroClass`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/DegreeZero.lean`), Mathlib's
`zeroIso` read backwards on elements. -/
noncomputable abbrev degreeZeroClass (Y : TopRep R G) (u : Y.V)
    (hinv : ∀ g : G, Y.ρ g u = u) : (continuousCohomology R G 0).obj Y :=
  TauCeti.ContinuousCohomology.degreeZeroClass Y u hinv

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
omits one cannot type its own statements. The six are Tau Ceti's
`TauCeti.ContCohomology.explicitCup00`, ..., `explicitCup20`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean`); the `(0,0)` cup
needs no continuity of `μ`, so `_hμ` is carried only for the uniform signature. -/
noncomputable abbrev explicitCup00 (μ : M →+ N →+ P)
    (_hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H0 G M →+ H0 G N →+ H0 G P :=
  TauCeti.ContCohomology.explicitCup00 G M N P μ hequiv

/-- **Layer 8, the `(0,1)` cup product on the explicit model,** `(m ⌣ b) g = μ m (b g)`. -/
noncomputable abbrev explicitCup01 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H0 G M →+ H1 G N →+ H1 G P :=
  TauCeti.ContCohomology.explicitCup01 G M N P μ hμ hequiv

/-- **Layer 8, the `(1,0)` cup product on the explicit model,** `(a ⌣ n) g = μ (a g) (g • n)`. The
factor `g •` is what the associativity instance `(1,1,0)` needs on its right-hand side, and is why
this shape is not the `(0,1)` one read backwards. -/
noncomputable abbrev explicitCup10 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H1 G M →+ H0 G N →+ H1 G P :=
  TauCeti.ContCohomology.explicitCup10 G M N P μ hμ hequiv

/-- **Layer 8, the `(0,2)` cup product on the explicit model,** `(m ⌣ b) (g, h) = μ m (b (g, h))`. -/
noncomputable abbrev explicitCup02 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H0 G M →+ H2 G N →+ H2 G P :=
  TauCeti.ContCohomology.explicitCup02 G M N P μ hμ hequiv

/-- **Layer 8, the `(1,1)` cup product on the explicit model,** at class level: the descent of the
cochain formula `(a ⌣ b)(g, h) = μ (a g) (g • b h)` of `README.md` §3. -/
noncomputable abbrev explicitCup11 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H1 G M →+ H1 G N →+ H2 G P :=
  TauCeti.ContCohomology.explicitCup11 G M N P μ hμ hequiv

/-- **Layer 8, the `(2,0)` cup product on the explicit model,**
`(a ⌣ n) (g, h) = μ (a (g, h)) ((g * h) • n)`. The last of the six shapes; no explicit cup goes
above total degree 2, and a product of total degree 3 belongs to Layer 12's all-bidegree
package. -/
noncomputable abbrev explicitCup20 (μ : M →+ N →+ P)
    (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x) :
    H2 G M →+ H0 G N →+ H2 G P :=
  TauCeti.ContCohomology.explicitCup20 G M N P μ hμ hequiv

/-- **Layer 8, the low-degree projection formula.** Finite index is explicit because the left and
right sides both use the finite transversal sum; openness alone is not enough outside the compact
case. This `(0,1)` shape determines the normalization used by the other low-degree shapes. Tau
Ceti's `TauCeti.ContCohomology.explicitCup_projection`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/ProjectionFormula.lean`), whose
companions `explicitCup_projection00`, `explicitCup_projection10`, `explicitCup_projection02`,
`explicitCup_projection20` and `explicitCup_projection11` are the other five shapes. -/
theorem explicitCup_projection (U : OpenSubgroup G) [Fintype (G ⧸ U.toSubgroup)]
    (μ : M →+ N →+ P) (hμ : Continuous fun p : M × N => μ p.1 p.2)
    (hequiv : ∀ (g : G) (m : M) (x : N), μ (g • m) (g • x) = g • μ m x)
    (a : H0 G M) (b : H1 U.toSubgroup N) :
    explicitCor1 G P U
        (explicitCup01 U.toSubgroup M N P μ hμ
          (fun g m x => hequiv (g : G) m x) (explicitRes0 G M U.toSubgroup a) b) =
      explicitCup01 G M N P μ hμ hequiv a (explicitCor1 G N U b) :=
  haveI : U.toSubgroup.FiniteIndex := Subgroup.finiteIndex_of_finite_quotient
  TauCeti.ContCohomology.explicitCup_projection G M N P U.toSubgroup U.isOpen μ hμ hequiv a b

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

section ConnectingMapCup

/-! Layer 8, the connecting maps as typed diagrams. In the first variable a short exact sequence
`0 → A' → A → A'' → 0` is paired with a fixed `B` into `0 → C' → C → C'' → 0`; in the second a
fixed `A` is paired with `0 → B' → B → B'' → 0`. In both, `hincl` and `hproj` say that the three
pairings form a map of short exact sequences. They are hypotheses of every statement: without them
the two connecting maps have nothing to do with each other. The six statements are the instances in
which every class has degree at most `2`. They are Tau Ceti's, under the same names, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/ConnectingMap.lean`, and each is proved
here by the Tau Ceti theorem. -/

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  {A' A A'' B' B B'' C' C C'' : Type u}
  [AddCommGroup A'] [TopologicalSpace A'] [IsTopologicalAddGroup A'] [DiscreteTopology A']
  [DistribMulAction G A'] [ContinuousSMul G A']
  [AddCommGroup A] [TopologicalSpace A] [IsTopologicalAddGroup A] [DiscreteTopology A]
  [DistribMulAction G A] [ContinuousSMul G A]
  [AddCommGroup A''] [TopologicalSpace A''] [IsTopologicalAddGroup A''] [DiscreteTopology A'']
  [DistribMulAction G A''] [ContinuousSMul G A'']
  [AddCommGroup B'] [TopologicalSpace B'] [IsTopologicalAddGroup B'] [DiscreteTopology B']
  [DistribMulAction G B'] [ContinuousSMul G B']
  [AddCommGroup B] [TopologicalSpace B] [IsTopologicalAddGroup B] [DiscreteTopology B]
  [DistribMulAction G B] [ContinuousSMul G B]
  [AddCommGroup B''] [TopologicalSpace B''] [IsTopologicalAddGroup B''] [DiscreteTopology B'']
  [DistribMulAction G B''] [ContinuousSMul G B'']
  [AddCommGroup C'] [TopologicalSpace C'] [IsTopologicalAddGroup C'] [DiscreteTopology C']
  [DistribMulAction G C'] [ContinuousSMul G C']
  [AddCommGroup C] [TopologicalSpace C] [IsTopologicalAddGroup C] [DiscreteTopology C]
  [DistribMulAction G C] [ContinuousSMul G C]
  [AddCommGroup C''] [TopologicalSpace C''] [IsTopologicalAddGroup C''] [DiscreteTopology C'']
  [DistribMulAction G C''] [ContinuousSMul G C'']

/-- **Layer 8, `δ⁰` through the `(0,0)` cup in the first variable:** `δ⁰ (x ⌣ y) = δ⁰ x ⌣ y`, the
right-hand side the `(1,0)` cup against the pairing of the sub-objects. -/
theorem explicitDelta0_explicitCup00_left (SA : DiscreteShortExact G A' A A'')
    (SC : DiscreteShortExact G C' C C'')
    (μ : A →+ B →+ C) (μ' : A' →+ B →+ C') (μ'' : A'' →+ B →+ C'')
    (hμ : Continuous fun q : A × B => μ q.1 q.2) (hμ' : Continuous fun q : A' × B => μ' q.1 q.2)
    (hμ'' : Continuous fun q : A'' × B => μ'' q.1 q.2)
    (hequiv : ∀ (g : G) (a : A) (b : B), μ (g • a) (g • b) = g • μ a b)
    (hequiv' : ∀ (g : G) (a : A') (b : B), μ' (g • a) (g • b) = g • μ' a b)
    (hequiv'' : ∀ (g : G) (a : A'') (b : B), μ'' (g • a) (g • b) = g • μ'' a b)
    (hincl : ∀ (a : A') (b : B), μ (SA.incl a) b = SC.incl (μ' a b))
    (hproj : ∀ (a : A) (b : B), μ'' (SA.proj a) b = SC.proj (μ a b))
    (x : H0 G A'') (y : H0 G B) :
    explicitDelta0 G C' C C'' SC (explicitCup00 G A'' B C'' μ'' hμ'' hequiv'' x y) =
      explicitCup10 G A' B C' μ' hμ' hequiv' (explicitDelta0 G A' A A'' SA x) y := by
  apply TauCeti.ContCohomology.explicitDelta0_explicitCup00_left <;> assumption

/-- **Layer 8, `δ¹` through the `(0,1)` cup in the first variable:** `δ¹ (x ⌣ y) = δ⁰ x ⌣ y`, the
right-hand side the `(1,1)` cup. -/
theorem explicitDelta1_explicitCup01_left (SA : DiscreteShortExact G A' A A'')
    (SC : DiscreteShortExact G C' C C'')
    (μ : A →+ B →+ C) (μ' : A' →+ B →+ C') (μ'' : A'' →+ B →+ C'')
    (hμ : Continuous fun q : A × B => μ q.1 q.2) (hμ' : Continuous fun q : A' × B => μ' q.1 q.2)
    (hμ'' : Continuous fun q : A'' × B => μ'' q.1 q.2)
    (hequiv : ∀ (g : G) (a : A) (b : B), μ (g • a) (g • b) = g • μ a b)
    (hequiv' : ∀ (g : G) (a : A') (b : B), μ' (g • a) (g • b) = g • μ' a b)
    (hequiv'' : ∀ (g : G) (a : A'') (b : B), μ'' (g • a) (g • b) = g • μ'' a b)
    (hincl : ∀ (a : A') (b : B), μ (SA.incl a) b = SC.incl (μ' a b))
    (hproj : ∀ (a : A) (b : B), μ'' (SA.proj a) b = SC.proj (μ a b))
    (x : H0 G A'') (y : H1 G B) :
    explicitDelta1 G C' C C'' SC (explicitCup01 G A'' B C'' μ'' hμ'' hequiv'' x y) =
      explicitCup11 G A' B C' μ' hμ' hequiv' (explicitDelta0 G A' A A'' SA x) y := by
  apply TauCeti.ContCohomology.explicitDelta1_explicitCup01_left <;> assumption

/-- **Layer 8, `δ¹` through the `(1,0)` cup in the first variable:** `δ¹ (x ⌣ y) = δ¹ x ⌣ y`, the
right-hand side the `(2,0)` cup. -/
theorem explicitDelta1_explicitCup10_left (SA : DiscreteShortExact G A' A A'')
    (SC : DiscreteShortExact G C' C C'')
    (μ : A →+ B →+ C) (μ' : A' →+ B →+ C') (μ'' : A'' →+ B →+ C'')
    (hμ : Continuous fun q : A × B => μ q.1 q.2) (hμ' : Continuous fun q : A' × B => μ' q.1 q.2)
    (hμ'' : Continuous fun q : A'' × B => μ'' q.1 q.2)
    (hequiv : ∀ (g : G) (a : A) (b : B), μ (g • a) (g • b) = g • μ a b)
    (hequiv' : ∀ (g : G) (a : A') (b : B), μ' (g • a) (g • b) = g • μ' a b)
    (hequiv'' : ∀ (g : G) (a : A'') (b : B), μ'' (g • a) (g • b) = g • μ'' a b)
    (hincl : ∀ (a : A') (b : B), μ (SA.incl a) b = SC.incl (μ' a b))
    (hproj : ∀ (a : A) (b : B), μ'' (SA.proj a) b = SC.proj (μ a b))
    (x : H1 G A'') (y : H0 G B) :
    explicitDelta1 G C' C C'' SC (explicitCup10 G A'' B C'' μ'' hμ'' hequiv'' x y) =
      explicitCup20 G A' B C' μ' hμ' hequiv' (explicitDelta1 G A' A A'' SA x) y := by
  apply TauCeti.ContCohomology.explicitDelta1_explicitCup10_left <;> assumption

/-- **Layer 8, `δ⁰` through the `(0,0)` cup in the second variable:** `δ⁰ (x ⌣ y) = x ⌣ δ⁰ y`, the
sign `(-1)^p` being `1` at `p = 0`. -/
theorem explicitDelta0_explicitCup00_right (SB : DiscreteShortExact G B' B B'')
    (SC : DiscreteShortExact G C' C C'')
    (μ : A →+ B →+ C) (μ' : A →+ B' →+ C') (μ'' : A →+ B'' →+ C'')
    (hμ : Continuous fun q : A × B => μ q.1 q.2) (hμ' : Continuous fun q : A × B' => μ' q.1 q.2)
    (hμ'' : Continuous fun q : A × B'' => μ'' q.1 q.2)
    (hequiv : ∀ (g : G) (a : A) (b : B), μ (g • a) (g • b) = g • μ a b)
    (hequiv' : ∀ (g : G) (a : A) (b : B'), μ' (g • a) (g • b) = g • μ' a b)
    (hequiv'' : ∀ (g : G) (a : A) (b : B''), μ'' (g • a) (g • b) = g • μ'' a b)
    (hincl : ∀ (a : A) (b : B'), μ a (SB.incl b) = SC.incl (μ' a b))
    (hproj : ∀ (a : A) (b : B), μ'' a (SB.proj b) = SC.proj (μ a b))
    (x : H0 G A) (y : H0 G B'') :
    explicitDelta0 G C' C C'' SC (explicitCup00 G A B'' C'' μ'' hμ'' hequiv'' x y) =
      explicitCup01 G A B' C' μ' hμ' hequiv' x (explicitDelta0 G B' B B'' SB y) := by
  apply TauCeti.ContCohomology.explicitDelta0_explicitCup00_right <;> assumption

/-- **Layer 8, `δ¹` through the `(0,1)` cup in the second variable:** `δ¹ (x ⌣ y) = x ⌣ δ¹ y`, the
right-hand side the `(0,2)` cup. -/
theorem explicitDelta1_explicitCup01_right (SB : DiscreteShortExact G B' B B'')
    (SC : DiscreteShortExact G C' C C'')
    (μ : A →+ B →+ C) (μ' : A →+ B' →+ C') (μ'' : A →+ B'' →+ C'')
    (hμ : Continuous fun q : A × B => μ q.1 q.2) (hμ' : Continuous fun q : A × B' => μ' q.1 q.2)
    (hμ'' : Continuous fun q : A × B'' => μ'' q.1 q.2)
    (hequiv : ∀ (g : G) (a : A) (b : B), μ (g • a) (g • b) = g • μ a b)
    (hequiv' : ∀ (g : G) (a : A) (b : B'), μ' (g • a) (g • b) = g • μ' a b)
    (hequiv'' : ∀ (g : G) (a : A) (b : B''), μ'' (g • a) (g • b) = g • μ'' a b)
    (hincl : ∀ (a : A) (b : B'), μ a (SB.incl b) = SC.incl (μ' a b))
    (hproj : ∀ (a : A) (b : B), μ'' a (SB.proj b) = SC.proj (μ a b))
    (x : H0 G A) (y : H1 G B'') :
    explicitDelta1 G C' C C'' SC (explicitCup01 G A B'' C'' μ'' hμ'' hequiv'' x y) =
      explicitCup02 G A B' C' μ' hμ' hequiv' x (explicitDelta1 G B' B B'' SB y) := by
  apply TauCeti.ContCohomology.explicitDelta1_explicitCup01_right <;> assumption

/-- **Layer 8, `δ¹` through the `(1,0)` cup in the second variable, with its sign:**
`δ¹ (x ⌣ y) = -(x ⌣ δ⁰ y)`, the sign `(-1)^p` at `p = 1`. Layer 13's index-two exact sequence reads
its connecting map off this instance at `y = 1`. -/
theorem explicitDelta1_explicitCup10_right (SB : DiscreteShortExact G B' B B'')
    (SC : DiscreteShortExact G C' C C'')
    (μ : A →+ B →+ C) (μ' : A →+ B' →+ C') (μ'' : A →+ B'' →+ C'')
    (hμ : Continuous fun q : A × B => μ q.1 q.2) (hμ' : Continuous fun q : A × B' => μ' q.1 q.2)
    (hμ'' : Continuous fun q : A × B'' => μ'' q.1 q.2)
    (hequiv : ∀ (g : G) (a : A) (b : B), μ (g • a) (g • b) = g • μ a b)
    (hequiv' : ∀ (g : G) (a : A) (b : B'), μ' (g • a) (g • b) = g • μ' a b)
    (hequiv'' : ∀ (g : G) (a : A) (b : B''), μ'' (g • a) (g • b) = g • μ'' a b)
    (hincl : ∀ (a : A) (b : B'), μ a (SB.incl b) = SC.incl (μ' a b))
    (hproj : ∀ (a : A) (b : B), μ'' a (SB.proj b) = SC.proj (μ a b))
    (x : H1 G A) (y : H0 G B'') :
    explicitDelta1 G C' C C'' SC (explicitCup10 G A B'' C'' μ'' hμ'' hequiv'' x y) =
      -explicitCup11 G A B' C' μ' hμ' hequiv' x (explicitDelta0 G B' B B'' SB y) := by
  apply TauCeti.ContCohomology.explicitDelta1_explicitCup10_right <;> assumption

end ConnectingMapCup

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

/-- **Layer 13, a degree-1 class of an open subgroup, extended by zero.** `α` is a genuine
continuous homomorphism on the subgroup, that is a trivial-action 1-cocycle of `U`; this is its
extension by zero to `G`, from which the Shapiro components are built. The cochains of this block
are Tau Ceti's, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Cochain.lean`:
this one is `TauCeti.ContCohomology.evensExtend`, with `evensExtend_of_mem`,
`evensExtend_of_notMem`, `evensExtend_mul` and `continuous_evensExtend`. -/
noncomputable abbrev evensExtend : G → ZMod 2 := TauCeti.ContCohomology.evensExtend U α

/-- **Layer 13, the first Shapiro component** `b₁ γ = α γ` for `γ ∈ U` and `α (γ s)` otherwise:
Tau Ceti's `TauCeti.ContCohomology.evensB1`, with `evensB1_of_mem` and `evensB1_of_notMem`.

It is a **cochain and not a cocycle**, so it has no class of its own. For `G = C₄ = ⟨σ⟩`,
`U = ⟨σ²⟩` of index two, `s = σ` and `α ≠ 0`, its values at `1, σ, σ², σ³` are `0, 1, 1, 0`, so
`b₁ (σ * σ) = 1` while `b₁ σ + b₁ σ = 0` and `b₁` is not a homomorphism. Tau Ceti's
`Evens/Cochain.lean` carries that computation as its acceptance check. Only the sum `b₁ + b_s` is a
cocycle, which is why only that sum is given a class below. -/
noncomputable abbrev evensB1 : G → ZMod 2 := TauCeti.ContCohomology.evensB1 U s α

/-- **Layer 13, the second Shapiro component** `b_s γ = b₁ (s⁻¹ γ)`: Tau Ceti's
`TauCeti.ContCohomology.evensBs` (`evensBs_apply`). A cochain, for the same reason as `evensB1`.
The multiplication rule of the pair `(b₁, b_s)` in the permutation module `𝔽₂[G/U]` is Tau Ceti's
`TauCeti.ContCohomology.evensB1_mul_of_mem`, `evensB1_mul_of_notMem`, `evensBs_mul_of_mem` and
`evensBs_mul_of_notMem`. -/
noncomputable abbrev evensBs : G → ZMod 2 := TauCeti.ContCohomology.evensBs U s α

/-- **Layer 13, identity 3 at cochain level: the degree-1 corestriction cochain** `b₁ + b_s`, the
sum of the Shapiro components over the transversal `{1, s}`: Tau Ceti's
`TauCeti.ContCohomology.evensCorCochain` (`evensCorCochain_apply`). That the sum is a cocycle, and
that its class is Layer 10's corestriction, are the two theorems below. -/
noncomputable abbrev evensCorCochain : G → ZMod 2 := TauCeti.ContCohomology.evensCorCochain U s α

/-- **Layer 13, the two-point graph 2-cochain.** With `(G : U) = 2` and `s ∉ U`,

`ν (γ, η) = b₁ γ * b_s η` if `γ ∈ U`, and `b₁ γ * b₁ η + b₁ η * b_s η` otherwise.

Its class is the index-2 Evens norm `N^{Ev}(α) ∈ H²(G, 𝔽₂)`. It is Tau Ceti's
`TauCeti.ContCohomology.evensGraphCochain`, with `evensGraphCochain_of_mem` and
`evensGraphCochain_of_notMem`, so the statements below are about this cochain and not about
anything satisfying its equations. -/
noncomputable abbrev evensGraphCochain : G × G → ZMod 2 :=
  TauCeti.ContCohomology.evensGraphCochain U s α

end IndexTwoCochains

section IndexTwoCharacter

open TauCeti.ContCohomology (evensExtend_of_mem evensExtend_of_notMem evensB1_of_mem
  evensB1_of_notMem evensBs_apply evensGraphCochain_of_mem evensGraphCochain_of_notMem)

variable {G : Type*} [Group G]

open scoped Classical in
/-- **Layer 13, the character of an index-two subgroup,** `χ_U : G → 𝔽₂` with kernel `U`. Index two
is what makes `γ ↦ [γ ∉ U]` a homomorphism (`Subgroup.mul_mem_iff_of_index_two`): for the trivial
subgroup of `C₃` the indicator of the complement takes the value `1` at a generator and at its
square, so it is not additive. -/
noncomputable def indexTwoCharacter (U : Subgroup G) (hU : U.index = 2) :
    G →* Multiplicative (ZMod 2) where
  toFun γ := Multiplicative.ofAdd (if γ ∈ U then 0 else 1)
  map_one' := by simp [U.one_mem]
  map_mul' x y := by
    have h := Subgroup.mul_mem_iff_of_index_two hU (a := x) (b := y)
    by_cases hx : x ∈ U <;> by_cases hy : y ∈ U <;> (simp [hx, hy, h]; try decide)

/-- The character vanishes on `U`. -/
theorem toAdd_indexTwoCharacter_of_mem {U : Subgroup G} (hU : U.index = 2) {γ : G} (h : γ ∈ U) :
    Multiplicative.toAdd (indexTwoCharacter U hU γ) = 0 := by
  simp [indexTwoCharacter, h]

/-- The character is `1` off `U`. -/
theorem toAdd_indexTwoCharacter_of_notMem {U : Subgroup G} (hU : U.index = 2) {γ : G}
    (h : γ ∉ U) : Multiplicative.toAdd (indexTwoCharacter U hU γ) = 1 := by
  simp [indexTwoCharacter, h]

/-- **Layer 13, the kernel of `χ_U` is `U`.** -/
theorem indexTwoCharacter_eq_one_iff (U : Subgroup G) (hU : U.index = 2) (γ : G) :
    indexTwoCharacter U hU γ = 1 ↔ γ ∈ U := by
  by_cases hγ : γ ∈ U
  · simp [indexTwoCharacter, hγ]
  · simp only [indexTwoCharacter, hγ, MonoidHom.coe_mk, OneHom.coe_mk, ite_false, iff_false]
    decide

/-- **Layer 13, identity 5 at cochain level: the graph cochain of a restricted homomorphism.** For
`α = y|_U` both Shapiro components are the homomorphism `b = y + y(s) · χ_U`, and
`ν_α (γ, η) = b γ * b η + χ_U γ * b η`. Index two and `s ∉ U` are both used. -/
theorem evensGraphCochain_comp_subtype (U : Subgroup G) (hU : U.index = 2) (s : G) (hs : s ∉ U)
    (y : G →* Multiplicative (ZMod 2)) (γ η : G) :
    let b : G → ZMod 2 := fun x => Multiplicative.toAdd (y x) +
      Multiplicative.toAdd (y s) * Multiplicative.toAdd (indexTwoCharacter U hU x)
    evensGraphCochain U s (y.comp U.subtype) (γ, η) =
      b γ * b η + Multiplicative.toAdd (indexTwoCharacter U hU γ) * b η := by
  intro b
  show TauCeti.ContCohomology.evensGraphCochain U s (y.comp U.subtype) (γ, η) = _
  have hext_mem : ∀ {x : G}, x ∈ U →
      TauCeti.ContCohomology.evensExtend U (y.comp U.subtype) x = Multiplicative.toAdd (y x) :=
    fun hx => evensExtend_of_mem hx
  have hb1 : ∀ x : G, TauCeti.ContCohomology.evensB1 U s (y.comp U.subtype) x = b x := by
    intro x
    by_cases hx : x ∈ U
    · rw [evensB1_of_mem hx, hext_mem hx]
      simp only [b, toAdd_indexTwoCharacter_of_mem hU hx, mul_zero, add_zero]
    · have hxs : x * s ∈ U := by
        simp [Subgroup.mul_mem_iff_of_index_two hU, hx, hs]
      rw [evensB1_of_notMem hx, hext_mem hxs]
      simp only [b, toAdd_indexTwoCharacter_of_notMem hU hx, map_mul, toAdd_mul, mul_one]
  have hbs : ∀ x : G, TauCeti.ContCohomology.evensBs U s (y.comp U.subtype) x = b x := by
    intro x
    rw [evensBs_apply, hb1]
    show Multiplicative.toAdd (y (s⁻¹ * x)) +
        Multiplicative.toAdd (y s) * Multiplicative.toAdd (indexTwoCharacter U hU (s⁻¹ * x)) =
      Multiplicative.toAdd (y x) +
        Multiplicative.toAdd (y s) * Multiplicative.toAdd (indexTwoCharacter U hU x)
    rw [map_mul, map_inv, toAdd_mul, toAdd_inv]
    by_cases hx : x ∈ U
    · have hsx : s⁻¹ * x ∉ U := by
        simp [Subgroup.mul_mem_iff_of_index_two hU, hs, hx]
      rw [toAdd_indexTwoCharacter_of_notMem hU hsx, toAdd_indexTwoCharacter_of_mem hU hx]
      generalize Multiplicative.toAdd (y s) = a; generalize Multiplicative.toAdd (y x) = c
      revert a c; decide
    · have hsx : s⁻¹ * x ∈ U := by
        simp [Subgroup.mul_mem_iff_of_index_two hU, hs, hx]
      rw [toAdd_indexTwoCharacter_of_mem hU hsx, toAdd_indexTwoCharacter_of_notMem hU hx]
      generalize Multiplicative.toAdd (y s) = a; generalize Multiplicative.toAdd (y x) = c
      revert a c; decide
  by_cases hγ : γ ∈ U
  · rw [evensGraphCochain_of_mem hγ, hb1, hbs, toAdd_indexTwoCharacter_of_mem hU hγ, zero_mul,
      add_zero]
  · rw [evensGraphCochain_of_notMem hγ, hb1, hb1, hbs, toAdd_indexTwoCharacter_of_notMem hU hγ,
      one_mul]
    generalize b γ = u; generalize b η = w
    revert u w; decide

/-- **Layer 13, naturality of the graph cochain.** For `φ : G →* G'` and `U = φ⁻¹(U')`, the graph
cochain of the pulled-back homomorphism is the pullback of the graph cochain, with `s` replaced by
`φ s`. The identity holds cochain by cochain and needs no hypothesis on the indices; Tau Ceti's
`TauCeti.ContCohomology.evensGraphCochain_quotient` is its case of a quotient map. -/
theorem evensGraphCochain_comap {G' : Type*} [Group G'] (φ : G →* G') (U' : Subgroup G') (s : G)
    (α' : U' →* Multiplicative (ZMod 2)) (g h : G) :
    evensGraphCochain (U'.comap φ) s (α'.comp (φ.subgroupComap U')) (g, h) =
      evensGraphCochain U' (φ s) α' (φ g, φ h) := by
  show TauCeti.ContCohomology.evensGraphCochain (U'.comap φ) s (α'.comp (φ.subgroupComap U'))
      (g, h) = TauCeti.ContCohomology.evensGraphCochain U' (φ s) α' (φ g, φ h)
  have hext : ∀ γ : G,
      TauCeti.ContCohomology.evensExtend (U'.comap φ) (α'.comp (φ.subgroupComap U')) γ =
        TauCeti.ContCohomology.evensExtend U' α' (φ γ) := by
    intro γ
    by_cases hγ : φ γ ∈ U'
    · rw [evensExtend_of_mem (show γ ∈ U'.comap φ from hγ), evensExtend_of_mem hγ]; rfl
    · rw [evensExtend_of_notMem (show γ ∉ U'.comap φ from hγ), evensExtend_of_notMem hγ]
  have hb1 : ∀ γ : G,
      TauCeti.ContCohomology.evensB1 (U'.comap φ) s (α'.comp (φ.subgroupComap U')) γ =
        TauCeti.ContCohomology.evensB1 U' (φ s) α' (φ γ) := by
    intro γ
    by_cases hγ : φ γ ∈ U'
    · rw [evensB1_of_mem (show γ ∈ U'.comap φ from hγ), evensB1_of_mem hγ, hext]
    · rw [evensB1_of_notMem (show γ ∉ U'.comap φ from hγ), evensB1_of_notMem hγ, hext, map_mul]
  have hbs : ∀ γ : G,
      TauCeti.ContCohomology.evensBs (U'.comap φ) s (α'.comp (φ.subgroupComap U')) γ =
        TauCeti.ContCohomology.evensBs U' (φ s) α' (φ γ) := by
    intro γ
    rw [evensBs_apply, evensBs_apply, hb1, map_mul, map_inv]
  by_cases hg : φ g ∈ U'
  · rw [evensGraphCochain_of_mem (show g ∈ U'.comap φ from hg), evensGraphCochain_of_mem hg, hb1,
      hbs]
  · rw [evensGraphCochain_of_notMem (show g ∉ U'.comap φ from hg), evensGraphCochain_of_notMem hg,
      hb1, hb1, hbs]

/-- **Layer 13, the graph cochain does not see a transport of the subgroup.** For `U₁ = U₂` and a
character `α` of `U₂`, the graph cochain of `α` read on `U₁` through `MulEquiv.subgroupCongr` is the
graph cochain of `α`. This is the subtype transport between the naturality `evensGraphCochain_comap`
and the original subgroup. -/
theorem evensGraphCochain_subgroupCongr {U₁ U₂ : Subgroup G} (h : U₁ = U₂) (s : G)
    (α : U₂ →* Multiplicative (ZMod 2)) :
    evensGraphCochain U₁ s (α.comp (MulEquiv.subgroupCongr h).toMonoidHom) =
      evensGraphCochain U₂ s α := by
  subst h
  have hα : α.comp (MulEquiv.subgroupCongr (rfl : U₁ = U₁)).toMonoidHom = α :=
    MonoidHom.ext fun _ => rfl
  rw [hα]

end IndexTwoCharacter

section IndexTwoCochainProperties

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (U : OpenSubgroup G) (s : G) (α : U.toSubgroup →* Multiplicative (ZMod 2))

/-- **Layer 13, the corestriction cochain is a continuous 1-cocycle,** Tau Ceti's
`TauCeti.ContCohomology.continuous_evensCorCochain` and `evensCorCochain_mul`. With trivial
coefficients a 1-cocycle is a homomorphism, and the index-two and `s ∉ U` hypotheses are both used:
the two expansion cross terms recombine only there. Neither `evensB1` nor `evensBs` satisfies this,
which is why identity 3 below is stated for the sum and not for the two components separately. -/
theorem evensCorCochain_isCocycle (hU : U.toSubgroup.index = 2) (hs : s ∉ U)
    (hα : Continuous α) :
    Continuous (evensCorCochain U.toSubgroup s α) ∧
      ∀ g h : G, evensCorCochain U.toSubgroup s α (g * h) =
        evensCorCochain U.toSubgroup s α g + evensCorCochain U.toSubgroup s α h :=
  ⟨TauCeti.ContCohomology.continuous_evensCorCochain U.toSubgroup s α U.isOpen hα,
    TauCeti.ContCohomology.evensCorCochain_mul hU hs⟩

/-- **Layer 13, the graph cochain is a continuous 2-cocycle,** Tau Ceti's
`TauCeti.ContCohomology.continuous_evensGraphCochain` and `evensGraphCochain_cocycle_identity`.
Continuity belongs in the conclusion: an open subgroup is clopen, so the case split is continuous,
and `α` is continuous by hypothesis. The 2-cocycle identity is the trivial-action form of
`groupCohomology.IsCocycle₂`. -/
theorem evensGraphCochain_isCocycle (hU : U.toSubgroup.index = 2) (hs : s ∉ U)
    (hα : Continuous α) :
    Continuous (evensGraphCochain U.toSubgroup s α) ∧
      ∀ g h j : G,
        evensGraphCochain U.toSubgroup s α (g * h, j) +
            evensGraphCochain U.toSubgroup s α (g, h) =
          evensGraphCochain U.toSubgroup s α (h, j) +
            evensGraphCochain U.toSubgroup s α (g, h * j) :=
  ⟨TauCeti.ContCohomology.continuous_evensGraphCochain U.toSubgroup s α U.isOpen hα,
    TauCeti.ContCohomology.evensGraphCochain_cocycle_identity hU hs⟩

/-- **Layer 13, the class does not depend on the chosen `s`.** Two elements outside an
index-2 subgroup give graph cochains differing by an explicit continuous coboundary, so the
Evens norm is a well-defined map to `H²(G, 𝔽₂)`. The coboundary is that of
`γ ↦ α (s⁻¹ s') * evensExtend U α γ`, by Tau Ceti's
`TauCeti.ContCohomology.evensGraphCochain_sub_evensGraphCochain`, continuous by
`TauCeti.ContCohomology.continuous_evensExtend`. -/
theorem evensGraphCochain_independent_of_rep (hU : U.toSubgroup.index = 2) (s' : G)
    (hs : s ∉ U) (hs' : s' ∉ U) (hα : Continuous α) :
    ∃ ψ : G → ZMod 2, Continuous ψ ∧ ∀ g h : G,
      evensGraphCochain U.toSubgroup s' α (g, h) - evensGraphCochain U.toSubgroup s α (g, h) =
        ψ h - ψ (g * h) + ψ g :=
  ⟨fun γ => TauCeti.ContCohomology.evensExtend U.toSubgroup α (s⁻¹ * s') *
      TauCeti.ContCohomology.evensExtend U.toSubgroup α γ,
    (continuous_of_discreteTopology : Continuous fun x : ZMod 2 =>
        TauCeti.ContCohomology.evensExtend U.toSubgroup α (s⁻¹ * s') * x).comp
      (TauCeti.ContCohomology.continuous_evensExtend U.toSubgroup α U.isOpen hα),
    fun g h => TauCeti.ContCohomology.evensGraphCochain_sub_evensGraphCochain hU hs hs' g h⟩

/-- **Layer 13, the character of an open index-two subgroup is continuous:** its fibres are `U` and
its complement, both open. -/
theorem continuous_indexTwoCharacter (hU : U.toSubgroup.index = 2) :
    Continuous (indexTwoCharacter U.toSubgroup hU) := by
  refine IsLocallyConstant.continuous ?_
  refine (IsLocallyConstant.iff_isOpen_fiber).2 fun v => ?_
  by_cases hv : v = 1
  · subst hv
    convert U.isOpen using 1
    ext γ
    simp [indexTwoCharacter_eq_one_iff]
  · convert U.isClosed.isOpen_compl using 1
    ext γ
    simp only [Set.mem_preimage, Set.mem_singleton_iff, Set.mem_compl_iff, SetLike.mem_coe]
    constructor
    · rintro h hγ
      exact hv (h ▸ (indexTwoCharacter_eq_one_iff _ hU γ).2 hγ)
    · intro hγ
      have h1 : indexTwoCharacter U.toSubgroup hU γ ≠ 1 :=
        fun h => hγ ((indexTwoCharacter_eq_one_iff _ hU γ).1 h)
      revert h1 hv
      generalize indexTwoCharacter U.toSubgroup hU γ = w
      revert w v
      decide

end IndexTwoCochainProperties

/-! ### Layer 13: the index-two norm as a pullback of the `D₁₆` extension class

The universal case of the index-two norm is the tautological character of the base group of
`C₂ ≀ C₂ = D₈`. There the graph cochain is the factor set of the extension `D₁₆ → C₂ ≀ C₂` plus an
explicit coboundary, a finite computation carried out below; naturality of the graph cochain then
writes every index-two norm as the pullback of that class along the induced homomorphism. The model
of `C₂ ≀ C₂` is Mathlib's `RegularWreathProduct` of `C₂` by itself, read on the coordinates
`(a, b, c)`, with `(a, b, c) (a', b', c') = ((a, b) + swapᶜ (a', b'), c + c')`. -/

section DihedralClass

/-- **Layer 13, the wreath product `C₂ ≀ C₂`,** the dihedral group of order 8: Mathlib's regular
wreath product of `Multiplicative (ZMod 2)` by itself. -/
abbrev WreathC2 : Type := Multiplicative (ZMod 2) ≀ᵣ Multiplicative (ZMod 2)

namespace WreathC2

/-- The element with coordinates `(a, b, c)`: the base function takes the value `a` at `1` and `b`
at the generator, and the top coordinate is `c`. -/
def mk (a b c : ZMod 2) : WreathC2 :=
  ⟨fun x => Multiplicative.ofAdd (if x = 1 then a else b), Multiplicative.ofAdd c⟩

/-- The first coordinate, the value of the base function at `1`. -/
def coordA (g : WreathC2) : ZMod 2 := Multiplicative.toAdd (g.left 1)

/-- The second coordinate, the value of the base function at the generator. -/
def coordB (g : WreathC2) : ZMod 2 := Multiplicative.toAdd (g.left (Multiplicative.ofAdd 1))

/-- The third coordinate, the image in the top factor. -/
def coordC (g : WreathC2) : ZMod 2 := Multiplicative.toAdd g.right

private theorem mul_zmod_two_cases (x : Multiplicative (ZMod 2)) :
    x = 1 ∨ x = Multiplicative.ofAdd 1 := by
  revert x; decide

/-- Every element is determined by its coordinates. -/
theorem eta (g : WreathC2) : g = mk (coordA g) (coordB g) (coordC g) := by
  obtain ⟨f, q⟩ := g
  refine RegularWreathProduct.ext ?_ ?_
  · funext x
    rcases mul_zmod_two_cases x with rfl | rfl <;> simp [mk, coordA, coordB]
  · simp [mk, coordC]

@[simp] theorem coordA_mk (a b c : ZMod 2) : coordA (mk a b c) = a := by simp [coordA, mk]

@[simp] theorem coordB_mk (a b c : ZMod 2) : coordB (mk a b c) = b := by simp [coordB, mk]

@[simp] theorem coordC_mk (a b c : ZMod 2) : coordC (mk a b c) = c := by simp [coordC, mk]

theorem ext_coord {g h : WreathC2} (hA : coordA g = coordA h) (hB : coordB g = coordB h)
    (hC : coordC g = coordC h) : g = h := by
  rw [eta g, eta h, hA, hB, hC]

theorem mk_inj {a b c a' b' c' : ZMod 2} :
    mk a b c = mk a' b' c' ↔ a = a' ∧ b = b' ∧ c = c' := by
  constructor
  · intro h
    exact ⟨by simpa using congrArg coordA h, by simpa using congrArg coordB h,
      by simpa using congrArg coordC h⟩
  · rintro ⟨rfl, rfl, rfl⟩; rfl

/-- **The multiplication of `C₂ ≀ C₂` on coordinates:** the top coordinate of the left factor swaps
the base coordinates of the right factor. -/
theorem mk_mul_mk (a b c a' b' c' : ZMod 2) :
    mk a b c * mk a' b' c' =
      mk (a + a' + c * (a' + b')) (b + b' + c * (a' + b')) (c + c') := by
  refine RegularWreathProduct.ext ?_ ?_
  · funext x
    simp only [RegularWreathProduct.mul_left, mk, Pi.mul_apply]
    revert a b c a' b' c' x
    decide
  · simp only [RegularWreathProduct.mul_right, mk]
    rfl

theorem mk_zero : mk 0 0 0 = 1 := by
  refine RegularWreathProduct.ext ?_ ?_
  · funext x; simp [mk]
  · rfl

theorem coordA_mul (g h : WreathC2) :
    coordA (g * h) = coordA g + coordA h + coordC g * (coordA h + coordB h) := by
  rw [eta g, eta h, mk_mul_mk]; simp

theorem coordB_mul (g h : WreathC2) :
    coordB (g * h) = coordB g + coordB h + coordC g * (coordA h + coordB h) := by
  rw [eta g, eta h, mk_mul_mk]; simp

theorem coordC_mul (g h : WreathC2) : coordC (g * h) = coordC g + coordC h := by
  rw [eta g, eta h, mk_mul_mk]; simp

theorem eq_one_iff_coord (g : WreathC2) :
    g = 1 ↔ coordA g = 0 ∧ coordB g = 0 ∧ coordC g = 0 := by
  constructor
  · rintro rfl; exact ⟨rfl, rfl, rfl⟩
  · rintro ⟨hA, hB, hC⟩
    exact ext_coord (hA.trans (by decide)) (hB.trans (by decide)) (hC.trans (by decide))

/-- The section `(us)^i s^j ↦ r^i f^j` of `D₁₆ → C₂ ≀ C₂`, on coordinates, in Mathlib's
`DihedralGroup 8` with `r = r 1` and `f = sr 0`, so that `r^i f = sr (-i)`. -/
def sectionTable : ZMod 2 → ZMod 2 → ZMod 2 → DihedralGroup 8
  | 0, 0, 0 => .r 0
  | 1, 0, 1 => .r 1
  | 1, 1, 0 => .r 2
  | 0, 1, 1 => .r 3
  | 0, 0, 1 => .sr 0
  | 1, 0, 0 => .sr 7
  | 1, 1, 1 => .sr 6
  | 0, 1, 0 => .sr 5

end WreathC2

open WreathC2

open TauCeti.ContCohomology (evensExtend_of_mem evensExtend_of_notMem evensB1_of_mem
  evensB1_of_notMem evensBs_apply evensGraphCochain_of_mem evensGraphCochain_of_notMem
  evensB1_mul_of_mem evensB1_mul_of_notMem evensBs_mul_of_mem evensBs_mul_of_notMem)

/-- **Layer 13, the base group `C₂ × C₂` of `C₂ ≀ C₂`,** the kernel of the projection to the top
factor. It has index two. -/
def wreathBase : Subgroup WreathC2 := RegularWreathProduct.rightHom.ker

theorem mem_wreathBase_iff (g : WreathC2) : g ∈ wreathBase ↔ coordC g = 0 := by
  simp [wreathBase, coordC, MonoidHom.mem_ker, RegularWreathProduct.rightHom]

/-- **Layer 13, the tautological character** of the base group, its first coordinate. -/
def wreathTautological : wreathBase →* Multiplicative (ZMod 2) where
  toFun g := Multiplicative.ofAdd (coordA g)
  map_one' := rfl
  map_mul' g h := by
    have hg := (mem_wreathBase_iff _).1 g.2
    simp [coordA_mul, hg, ofAdd_add]

/-- **Layer 13, the element `s = (0, 0, 1)` outside the base group,** which exchanges the two base
coordinates. -/
def wreathSwap : WreathC2 := mk 0 0 1

theorem wreathSwap_inv : wreathSwap⁻¹ = wreathSwap := by
  refine inv_eq_of_mul_eq_one_right ?_
  rw [wreathSwap, mk_mul_mk, ← mk_zero]
  congr 1

theorem evensExtend_wreath (g : WreathC2) :
    evensExtend wreathBase wreathTautological g = coordA g * (1 + coordC g) := by
  show TauCeti.ContCohomology.evensExtend wreathBase wreathTautological g = _
  by_cases h : g ∈ wreathBase
  · rw [evensExtend_of_mem h, (mem_wreathBase_iff g).1 h]; simp [wreathTautological, coordA]
  · rw [evensExtend_of_notMem h]
    have : coordC g = 1 := by
      have h' := (mem_wreathBase_iff g).not.1 h
      revert h'; generalize coordC g = c; revert c; decide
    rw [this]; generalize coordA g = a; revert a; decide

/-- **Layer 13, the first Shapiro component of the tautological character is the first
coordinate.** -/
theorem evensB1_wreath (g : WreathC2) :
    evensB1 wreathBase wreathSwap wreathTautological g = coordA g := by
  have hext : ∀ x, TauCeti.ContCohomology.evensExtend wreathBase wreathTautological x =
      coordA x * (1 + coordC x) := evensExtend_wreath
  show TauCeti.ContCohomology.evensB1 wreathBase wreathSwap wreathTautological g = coordA g
  by_cases h : g ∈ wreathBase
  · rw [evensB1_of_mem h, hext, (mem_wreathBase_iff g).1 h]; simp
  · rw [evensB1_of_notMem h, hext, coordA_mul, coordC_mul]
    have : coordC g = 1 := by
      have h' := (mem_wreathBase_iff g).not.1 h
      revert h'; generalize coordC g = c; revert c; decide
    simp only [wreathSwap, coordA_mk, coordB_mk, coordC_mk, this]
    generalize coordA g = a; revert a; decide

/-- **Layer 13, the second Shapiro component of the tautological character is the second
coordinate.** -/
theorem evensBs_wreath (g : WreathC2) :
    evensBs wreathBase wreathSwap wreathTautological g = coordB g := by
  have hb1 : ∀ x, TauCeti.ContCohomology.evensB1 wreathBase wreathSwap wreathTautological x =
      coordA x := evensB1_wreath
  show TauCeti.ContCohomology.evensBs wreathBase wreathSwap wreathTautological g = coordB g
  rw [evensBs_apply, hb1, wreathSwap_inv, coordA_mul]
  simp only [wreathSwap, coordA_mk, coordC_mk]
  generalize coordA g = a; generalize coordB g = b; revert a b; decide

/-- **Layer 13, the graph cochain of the tautological character on coordinates.** -/
theorem evensGraphCochain_wreath_apply (g h : WreathC2) :
    evensGraphCochain wreathBase wreathSwap wreathTautological (g, h) =
      (1 + coordC g) * coordA g * coordB h +
        coordC g * (coordA g * coordA h + coordA h * coordB h) := by
  have hb1 : ∀ x, TauCeti.ContCohomology.evensB1 wreathBase wreathSwap wreathTautological x =
      coordA x := evensB1_wreath
  have hbs : ∀ x, TauCeti.ContCohomology.evensBs wreathBase wreathSwap wreathTautological x =
      coordB x := evensBs_wreath
  show TauCeti.ContCohomology.evensGraphCochain wreathBase wreathSwap wreathTautological (g, h) = _
  by_cases hg : g ∈ wreathBase
  · rw [evensGraphCochain_of_mem hg, hb1, hbs, (mem_wreathBase_iff g).1 hg]; ring
  · rw [evensGraphCochain_of_notMem hg, hb1, hb1, hbs]
    have : coordC g = 1 := by
      have h' := (mem_wreathBase_iff g).not.1 hg
      revert h'; generalize coordC g = c; revert c; decide
    rw [this]
    generalize coordA g = a; generalize coordA h = a'; generalize coordB h = b'
    revert a a' b'; decide

private def dihedralToWreathFun : DihedralGroup 8 → WreathC2
  | .r i => mk (tA i.val) (tB i.val) (tC i.val)
  | .sr i => wreathSwap * mk (tA i.val) (tB i.val) (tC i.val)
where
  tA (n : ℕ) : ZMod 2 := if n % 4 = 1 ∨ n % 4 = 2 then 1 else 0
  tB (n : ℕ) : ZMod 2 := if n % 4 = 2 ∨ n % 4 = 3 then 1 else 0
  tC (n : ℕ) : ZMod 2 := if n % 2 = 1 then 1 else 0

set_option maxRecDepth 4000 in
/-- **Layer 13, the quotient `D₁₆ → C₂ ≀ C₂`,** `r ↦ us = (1, 0, 1)` and `f = sr 0 ↦ s`, with
`r^i ↦ (us)^i` and `f r^i ↦ s (us)^i`. Its kernel is the centre `{1, r⁴}`
(`dihedralToWreath_eq_one_iff`), so `D₁₆` is a central extension of `C₂ ≀ C₂` by `C₂`. -/
def dihedralToWreath : DihedralGroup 8 →* WreathC2 where
  toFun := dihedralToWreathFun
  map_one' := by
    apply ext_coord <;> decide
  map_mul' x y := by
    apply ext_coord <;>
    · simp only [coordA_mul, coordB_mul, coordC_mul]
      revert x y
      decide

/-- **Layer 13, the kernel of `D₁₆ → C₂ ≀ C₂` is `{1, r⁴}`.** -/
theorem dihedralToWreath_eq_one_iff (x : DihedralGroup 8) :
    dihedralToWreath x = 1 ↔ x = 1 ∨ x = DihedralGroup.r 4 := by
  rw [eq_one_iff_coord]
  revert x
  decide

/-- **Layer 13, the set-theoretic section of `D₁₆ → C₂ ≀ C₂`** sending `(us)^i s^j` to `r^i f^j`,
for `0 ≤ i < 4` and `0 ≤ j < 2`. -/
def wreathSection (g : WreathC2) : DihedralGroup 8 := sectionTable (coordA g) (coordB g) (coordC g)

/-- The section is a section. -/
theorem dihedralToWreath_wreathSection (g : WreathC2) :
    dihedralToWreath (wreathSection g) = g := by
  apply ext_coord <;>
  · rw [eta g]
    simp only [wreathSection, coordA_mk, coordB_mk, coordC_mk]
    generalize coordA g = a; generalize coordB g = b; generalize coordC g = c
    revert a b c
    decide

/-- **Layer 13, the `D₁₆` extension cocycle** `c_{D₁₆}`: the factor set
`σ g · σ h · σ (g h)⁻¹ ∈ {1, r⁴} ≅ 𝔽₂` of the section `σ = wreathSection`. -/
def wreathD16Cocycle (q : WreathC2 × WreathC2) : ZMod 2 :=
  if wreathSection q.1 * wreathSection q.2 * (wreathSection (q.1 * q.2))⁻¹ = 1 then 0 else 1

/-- **Layer 13, `c_{D₁₆}` is a 2-cocycle,** in the trivial-action form of
`groupCohomology.IsCocycle₂`. Checked by computation. -/
theorem wreathD16Cocycle_isCocycle (g h j : WreathC2) :
    wreathD16Cocycle (g * h, j) + wreathD16Cocycle (g, h) =
      wreathD16Cocycle (h, j) + wreathD16Cocycle (g, h * j) := by
  simp only [wreathD16Cocycle, wreathSection, coordA_mul, coordB_mul, coordC_mul, mul_assoc]
  generalize coordA g = a1; generalize coordB g = b1; generalize coordC g = c1
  generalize coordA h = a2; generalize coordB h = b2; generalize coordC h = c2
  generalize coordA j = a3; generalize coordB j = b3; generalize coordC j = c3
  revert a1 b1 c1 a2 b2 c2 a3 b3 c3
  decide

/-- **Layer 13, the coboundary witness** `f = 1_{{u, uv, s, vs}}`, which on coordinates is
`a + c` (`wreathWitness_eq_one_iff`). -/
def wreathWitness (g : WreathC2) : ZMod 2 := coordA g + coordC g

/-- The witness is the indicator of `{u, uv, s, vs}`, with `u = (1, 0, 0)`, `v = (0, 1, 0)` and
`s = wreathSwap`. -/
theorem wreathWitness_eq_one_iff (g : WreathC2) :
    wreathWitness g = 1 ↔
      g = mk 1 0 0 ∨ g = mk 1 0 0 * mk 0 1 0 ∨ g = wreathSwap ∨ g = mk 0 1 0 * wreathSwap := by
  rw [eta g]
  simp only [wreathWitness, coordA_mk, coordC_mk, wreathSwap, mk_mul_mk, mk_inj]
  generalize coordA g = a; generalize coordB g = b; generalize coordC g = c
  revert a b c
  decide

/-- **Layer 13, the universal identity:** the graph cochain of the tautological character of
`C₂ ≀ C₂` is the `D₁₆` extension cocycle plus the coboundary of `wreathWitness`,
`ν_taut = c_{D₁₆} + δ 1_{{u, uv, s, vs}}`. So the index-two norm of the tautological character is
the class of the extension `D₁₆ → C₂ ≀ C₂`. Checked by computation. -/
theorem evensGraphCochain_wreath (g h : WreathC2) :
    evensGraphCochain wreathBase wreathSwap wreathTautological (g, h) =
      wreathD16Cocycle (g, h) + (wreathWitness h - wreathWitness (g * h) + wreathWitness g) := by
  rw [evensGraphCochain_wreath_apply]
  simp only [wreathD16Cocycle, wreathWitness, wreathSection, coordA_mul, coordB_mul, coordC_mul]
  generalize coordA g = a1; generalize coordB g = b1; generalize coordC g = c1
  generalize coordA h = a2; generalize coordB h = b2; generalize coordC h = c2
  revert a1 b1 c1 a2 b2 c2
  decide

/-- **Layer 13, the induced homomorphism `Ind α : G → C₂ ≀ C₂`** of `α : U → 𝔽₂`, for `U` of index
two and `s ∉ U`: `γ ↦ ((b₁ γ, b_s γ), χ_U γ)`, the signed-permutation form of the representation
induced from `α`. It is a homomorphism by the multiplication rule of the two Shapiro components,
`b₁ (γ η) = b₁ γ + b₁ η` and `b_s (γ η) = b_s γ + b_s η` for `γ ∈ U` and the two exchanged for
`γ ∉ U` (Tau Ceti's `TauCeti.ContCohomology.evensB1_mul_of_mem`, `evensB1_mul_of_notMem`,
`evensBs_mul_of_mem` and `evensBs_mul_of_notMem`), which is `WreathC2.mk_mul_mk` read on
coordinates. -/
noncomputable def indexTwoInd {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2) (s : G)
    (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) : G →* WreathC2 where
  toFun γ := mk (evensB1 U s α γ) (evensBs U s α γ)
    (Multiplicative.toAdd (indexTwoCharacter U hU γ))
  map_one' := by
    rw [← mk_zero, mk_inj]
    refine ⟨?_, ?_, ?_⟩
    · show TauCeti.ContCohomology.evensB1 U s α 1 = 0
      rw [evensB1_of_mem U.one_mem, evensExtend_of_mem U.one_mem]
      show Multiplicative.toAdd (α 1) = 0
      rw [map_one]
      rfl
    · show TauCeti.ContCohomology.evensB1 U s α (s⁻¹ * 1) = 0
      have hsi : s⁻¹ * 1 ∉ U := by simpa using hs
      rw [evensB1_of_notMem hsi, mul_one, inv_mul_cancel, evensExtend_of_mem U.one_mem]
      show Multiplicative.toAdd (α 1) = 0
      rw [map_one]
      rfl
    · rw [map_one]
      rfl
  map_mul' γ η := by
    refine ext_coord ?_ ?_ ?_
    · rw [coordA_mul]
      simp only [coordA_mk, coordB_mk, coordC_mk, evensB1, evensBs]
      by_cases hγ : γ ∈ U
      · rw [evensB1_mul_of_mem hU hs hγ, toAdd_indexTwoCharacter_of_mem hU hγ, zero_mul,
          add_zero]
      · rw [evensB1_mul_of_notMem hU hs hγ, toAdd_indexTwoCharacter_of_notMem hU hγ, one_mul]
        generalize TauCeti.ContCohomology.evensB1 U s α γ = a
        generalize TauCeti.ContCohomology.evensB1 U s α η = b
        generalize TauCeti.ContCohomology.evensBs U s α η = c
        revert a b c; decide
    · rw [coordB_mul]
      simp only [coordA_mk, coordB_mk, coordC_mk, evensB1, evensBs]
      by_cases hγ : γ ∈ U
      · rw [evensBs_mul_of_mem hU hs hγ, toAdd_indexTwoCharacter_of_mem hU hγ, zero_mul,
          add_zero]
      · rw [evensBs_mul_of_notMem hU hs hγ, toAdd_indexTwoCharacter_of_notMem hU hγ, one_mul]
        generalize TauCeti.ContCohomology.evensBs U s α γ = a
        generalize TauCeti.ContCohomology.evensB1 U s α η = b
        generalize TauCeti.ContCohomology.evensBs U s α η = c
        revert a b c; decide
    · rw [coordC_mul]
      simp only [coordC_mk, map_mul, toAdd_mul]

/-- **Layer 13, `Ind α` pulls the base group back to `U`:** its third coordinate is `χ_U`, which
vanishes exactly on `U`. This is the subgroup half of the pullback; the character half, that the
tautological character pulls back to `α`, is `wreathTautological_indexTwoInd`. -/
theorem comap_indexTwoInd_wreathBase {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2)
    (s : G) (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) :
    wreathBase.comap (indexTwoInd U hU s hs α) = U := by
  ext γ
  rw [Subgroup.mem_comap, mem_wreathBase_iff]
  simp only [indexTwoInd, MonoidHom.coe_mk, OneHom.coe_mk, coordC_mk]
  by_cases hγ : γ ∈ U
  · simp [toAdd_indexTwoCharacter_of_mem hU hγ, hγ]
  · simp only [toAdd_indexTwoCharacter_of_notMem hU hγ, hγ, iff_false]
    decide

/-- **Layer 13, the tautological character pulls back to `α`.** On `U`, which is the pullback of
`wreathBase` along `Ind α` (`comap_indexTwoInd_wreathBase`), the first coordinate of `Ind α` is `α`:
the restriction of `Ind α` to that pullback, followed by the tautological character of the base
group, is `α` read through `MulEquiv.subgroupCongr` of the equality of subgroups. The equality of
subgroups does not say this, because the two characters are defined on different subtypes. -/
theorem wreathTautological_indexTwoInd {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2)
    (s : G) (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) :
    wreathTautological.comp ((indexTwoInd U hU s hs α).subgroupComap wreathBase) =
      α.comp (MulEquiv.subgroupCongr (comap_indexTwoInd_wreathBase U hU s hs α)).toMonoidHom := by
  ext x
  have hx : (x : G) ∈ U := (comap_indexTwoInd_wreathBase U hU s hs α).le x.2
  show Multiplicative.ofAdd (coordA (indexTwoInd U hU s hs α x)) = α ⟨x, hx⟩
  simp only [indexTwoInd, MonoidHom.coe_mk, OneHom.coe_mk, coordA_mk, evensB1]
  rw [evensB1_of_mem hx, evensExtend_of_mem hx]
  rfl

/-- **Layer 13, the graph cochain of `α` is the graph cochain of the tautological character,
pulled back along `Ind α`,** with `s` replaced by `Ind α (s)`. This is `evensGraphCochain_comap`
at `φ = Ind α`, `U' = wreathBase` and `α' = wreathTautological`, carried back to `U` and `α` by
`comap_indexTwoInd_wreathBase`, `wreathTautological_indexTwoInd` and
`evensGraphCochain_subgroupCongr`. -/
theorem evensGraphCochain_indexTwoInd {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2)
    (s : G) (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) (g h : G) :
    evensGraphCochain U s α (g, h) =
      evensGraphCochain wreathBase (indexTwoInd U hU s hs α s) wreathTautological
        (indexTwoInd U hU s hs α g, indexTwoInd U hU s hs α h) := by
  rw [← evensGraphCochain_comap (indexTwoInd U hU s hs α) wreathBase s wreathTautological g h,
    wreathTautological_indexTwoInd U hU s hs α,
    evensGraphCochain_subgroupCongr (comap_indexTwoInd_wreathBase U hU s hs α)]

/-- **Layer 13, `Ind α (s)` lies outside the base group.** Its third coordinate is `χ_U (s) = 1`. -/
theorem coordC_indexTwoInd_self {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2)
    (s : G) (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) :
    coordC (indexTwoInd U hU s hs α s) = 1 := by
  simp only [indexTwoInd, MonoidHom.coe_mk, OneHom.coe_mk, coordC_mk]
  exact toAdd_indexTwoCharacter_of_notMem hU hs

/-- **Layer 13, the second coordinate of `Ind α (s)` vanishes:** `b_s (s) = b₁ (1) = α (1) = 0`, so
`Ind α (s) = (α (s²), 0, 1)`. -/
theorem coordB_indexTwoInd_self {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2)
    (s : G) (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) :
    coordB (indexTwoInd U hU s hs α s) = 0 := by
  simp only [indexTwoInd, MonoidHom.coe_mk, OneHom.coe_mk, coordB_mk]
  show TauCeti.ContCohomology.evensB1 U s α (s⁻¹ * s) = 0
  rw [inv_mul_cancel, evensB1_of_mem U.one_mem, evensExtend_of_mem U.one_mem]
  show Multiplicative.toAdd (α 1) = 0
  rw [map_one]
  rfl

/-- **Layer 13, the graph cochain of the tautological character at any `(a, 0, 1)`** is the one at
`wreathSwap = (0, 0, 1)`: at either element the two Shapiro components are the first and second
coordinates, so the two cochains agree exactly, with no coboundary. This is the case `Ind α (s)`
needs, by `coordB_indexTwoInd_self` and `coordC_indexTwoInd_self`. -/
theorem evensGraphCochain_wreath_of_coord (t : WreathC2) (hB : coordB t = 0) (hC : coordC t = 1) :
    evensGraphCochain wreathBase t wreathTautological =
      evensGraphCochain wreathBase wreathSwap wreathTautological := by
  obtain ⟨a, rfl⟩ : ∃ a, t = mk a 0 1 :=
    ⟨coordA t, ext_coord (by rw [coordA_mk]) (by rw [coordB_mk, hB]) (by rw [coordC_mk, hC])⟩
  clear hB hC
  have hinv : (mk a 0 1)⁻¹ = mk 0 a 1 := by
    refine inv_eq_of_mul_eq_one_right ?_
    rw [mk_mul_mk, ← mk_zero, mk_inj]
    revert a; decide
  have hext : ∀ x, TauCeti.ContCohomology.evensExtend wreathBase wreathTautological x =
      coordA x * (1 + coordC x) := evensExtend_wreath
  have hb1 : ∀ g, TauCeti.ContCohomology.evensB1 wreathBase (mk a 0 1) wreathTautological g =
      coordA g := by
    intro g
    by_cases h : g ∈ wreathBase
    · rw [evensB1_of_mem h, hext, (mem_wreathBase_iff g).1 h]; simp
    · have hg : coordC g = 1 := by
        have h' := (mem_wreathBase_iff g).not.1 h
        revert h'; generalize coordC g = c; revert c; decide
      rw [evensB1_of_notMem h, hext, coordA_mul, coordC_mul, hg]
      simp only [coordA_mk, coordB_mk, coordC_mk]
      exact (by decide : ∀ x b : ZMod 2, (x + b + 1 * (b + 0)) * (1 + (1 + 1)) = x) _ _
  have hbs : ∀ g, TauCeti.ContCohomology.evensBs wreathBase (mk a 0 1) wreathTautological g =
      coordB g := by
    intro g
    rw [evensBs_apply, hb1, hinv, coordA_mul]
    simp only [coordA_mk, coordC_mk]
    exact (by decide : ∀ x y : ZMod 2, 0 + x + 1 * (x + y) = y) _ _
  have hb1' : ∀ g, TauCeti.ContCohomology.evensB1 wreathBase wreathSwap wreathTautological g =
      coordA g := evensB1_wreath
  have hbs' : ∀ g, TauCeti.ContCohomology.evensBs wreathBase wreathSwap wreathTautological g =
      coordB g := evensBs_wreath
  funext q
  obtain ⟨g, h⟩ := q
  show TauCeti.ContCohomology.evensGraphCochain wreathBase (mk a 0 1) wreathTautological (g, h) =
    TauCeti.ContCohomology.evensGraphCochain wreathBase wreathSwap wreathTautological (g, h)
  by_cases hg : g ∈ wreathBase
  · rw [evensGraphCochain_of_mem hg, evensGraphCochain_of_mem hg, hb1, hbs, hb1', hbs']
  · rw [evensGraphCochain_of_notMem hg, evensGraphCochain_of_notMem hg, hb1, hb1, hbs, hb1', hb1',
      hbs']

/-- **Layer 13, the index-two graph cochain is the pulled-back `D₁₆` cocycle plus a pulled-back
coboundary,** on the nose: `ν_α = c_{D₁₆} ∘ (Ind α × Ind α) + δ (1_{{u, uv, s, vs}} ∘ Ind α)`, the
coboundary written with `Ind α g * Ind α h` in place of `Ind α (g h)`. It is
`evensGraphCochain_indexTwoInd`, then `evensGraphCochain_wreath_of_coord` at `Ind α (s)`, then the
universal identity `evensGraphCochain_wreath`. -/
theorem evensGraphCochain_eq_indexTwoInd_pullback {G : Type*} [Group G] (U : Subgroup G)
    (hU : U.index = 2) (s : G) (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) (g h : G) :
    evensGraphCochain U s α (g, h) =
      wreathD16Cocycle (indexTwoInd U hU s hs α g, indexTwoInd U hU s hs α h) +
        (wreathWitness (indexTwoInd U hU s hs α h) -
          wreathWitness (indexTwoInd U hU s hs α g * indexTwoInd U hU s hs α h) +
          wreathWitness (indexTwoInd U hU s hs α g)) := by
  rw [evensGraphCochain_indexTwoInd U hU s hs α g h,
    evensGraphCochain_wreath_of_coord _ (coordB_indexTwoInd_self U hU s hs α)
      (coordC_indexTwoInd_self U hU s hs α),
    evensGraphCochain_wreath]

/-- **Layer 13, the pulled-back `D₁₆` cocycle is continuous** for `U` open and `α` continuous:
`Ind α` is locally constant, since `U` is clopen and the Shapiro components are continuous into the
discrete `𝔽₂`. -/
theorem continuous_wreathD16Cocycle_indexTwoInd {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2) (s : G)
    (hs : s ∉ U) (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    Continuous fun q : G × G => wreathD16Cocycle
      (indexTwoInd U.toSubgroup hU s hs α q.1, indexTwoInd U.toSubgroup hU s hs α q.2) :=
  sorry

/-- **Layer 13, the pulled-back coboundary witness is continuous,** for the same reason: it is
`wreathWitness`, a function on the finite `C₂ ≀ C₂`, composed with the locally constant `Ind α`. -/
theorem continuous_wreathWitness_indexTwoInd {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2) (s : G)
    (hs : s ∉ U) (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    Continuous fun γ : G => wreathWitness (indexTwoInd U.toSubgroup hU s hs α γ) :=
  sorry

end DihedralClass

section EvensNorm

open CategoryTheory

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

-- Instance diamond: `AddCommGroup (ZMod 2)` is also derivable from
-- `[IsSimpleAddGroup G] [AddGroup.IsNilpotent G]`, which instance search reaches first for a
-- prime-order `ZMod p`. That structure is equal to `Ring.toAddCommGroup` but not syntactically, and
-- the `SMul ℤ` it carries is not the one `AddGroup.continuousSMul_int` supplies, so
-- `ContinuousSMul ℤ (ULift (ZMod 2))` fails to synthesize. Raising the priority of the ring path
-- locally restores it.
attribute [local instance 2000] Ring.toAddCommGroup

/-- **Layer 13, the coefficient object.** `𝔽₂` with trivial action, as an object of the category
the all-degree carrier eats. The general norm is stated against this, not against Layer 2's
low-degree abbreviations, because its degree is not bounded by 2.

The carrier is `ULift (ZMod 2)`, not `ZMod 2`, so that the object exists over a group in any
universe. The canonical resolution builds its terms from `C(G, -)`, so the coefficient module of
`TopRep R G` lives at least in the universe of `G`, and a `Type 0` carrier would pin every consumer
of the Evens norm to a `Type 0` group. The explicit cochain formulas below stay valued in `ZMod 2`
itself; `inhomogeneousCochain1` and `inhomogeneousCochain2` are where they enter the complex, and
they are the only place the lift is crossed. It is Tau Ceti's `TauCeti.trivialF2`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialF2.lean`), with the carrier
`TauCeti.trivialF2_V`, the lift `TauCeti.trivialF2Equiv`, the multiplication pairing
`TauCeti.trivialF2Pairing`, and `TauCeti.ofDiscreteModule_trivialF2`, which says that the
coefficient dictionary sends the trivial `𝔽₂` module to it. -/
noncomputable abbrev trivialF2 : TopRep ℤ G :=
  TauCeti.trivialF2 G

/-- **Layer 13, restriction preserves the trivial `𝔽₂` object,** on the nose: Tau Ceti's
`TauCeti.res_trivialF2`, as an isomorphism. -/
noncomputable def trivialF2Res (S : Subgroup G) :
    (TopRep.resFunctor S.subtype).obj (trivialF2 G) ≅ trivialF2 S :=
  eqToIso (TauCeti.res_trivialF2 G S)

/-- **Layer 13, restriction on cohomology with trivial `𝔽₂` coefficients,** Tau Ceti's
`TauCeti.trivialF2ResMap`: the generic restriction `res` followed by the identification
`TauCeti.res_trivialF2` (`TauCeti.trivialF2ResMap_def`). -/
noncomputable abbrev trivialF2ResMap (S : Subgroup G) (n : ℕ) :
    (continuousCohomology ℤ G n).obj (trivialF2 G) ⟶
      (continuousCohomology ℤ S n).obj (trivialF2 S) :=
  TauCeti.trivialF2ResMap G S n

/-- **Layer 13, the trivial `𝔽₂` object is smooth discrete,** Tau Ceti's
`TauCeti.isSmoothDiscrete_trivialF2`. `ZMod 2` is discrete and the action is trivial, so every
stabilizer is all of `G`. Layer 10's corestriction consumes this. -/
theorem trivialF2_isSmoothDiscrete : IsSmoothDiscrete ℤ (trivialF2 G) :=
  TauCeti.isSmoothDiscrete_trivialF2 G

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

/-- **Layer 3, cohomologous inhomogeneous 2-cocycles have the same canonical class.** If two
continuous 2-cocycles differ by the inhomogeneous coboundary `(g, h) ↦ ψ h - ψ (g h) + ψ g` of a
continuous 1-cochain `ψ`, their images under `inhomogeneousCochain2` differ by the canonical
differential of `inhomogeneousCochain1 ψ`, so their classes agree. This is how an explicit
coboundary witness, such as `evensGraphCochain_independent_of_rep` or the pulled-back `D₁₆`
witness, crosses to the canonical carrier. -/
theorem cochainClass_inhomogeneousCochain2_eq_of_coboundary (f f' : G × G → ZMod 2)
    (hf : Continuous f) (hf' : Continuous f')
    (hcf : ∀ g h j : G, f (g * h, j) + f (g, h) = f (h, j) + f (g, h * j))
    (hcf' : ∀ g h j : G, f' (g * h, j) + f' (g, h) = f' (h, j) + f' (g, h * j))
    (ψ : G → ZMod 2) (hψ : Continuous ψ)
    (hfψ : ∀ g h : G, f (g, h) = f' (g, h) + (ψ h - ψ (g * h) + ψ g)) :
    cochainClass ℤ (trivialF2 G) 2 (inhomogeneousCochain2 G f hf)
        (inhomogeneousCochain2_d_eq_zero G f hf hcf) =
      cochainClass ℤ (trivialF2 G) 2 (inhomogeneousCochain2 G f' hf')
        (inhomogeneousCochain2_d_eq_zero G f' hf' hcf') :=
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

/-- **Layer 13, the coefficient pairing on `𝔽₂`,** multiplication with the trivial action. The
identities below name it: an arbitrary pairing of the trivial object with itself is a different
input, and the statements are false for it. -/
noncomputable def f2Pairing (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TopPairing (trivialF2 G) (trivialF2 G) (trivialF2 G) :=
  sorry

/-- **Layer 13, the image of an open subgroup in a quotient,** `U ⧸ N` as an open subgroup of
`G ⧸ N`, for closed normal `N ≤ U`. The inflation compatibility of the norm is a statement about
these two groups, so the subgroup has to be named before it can be stated. It is Tau Ceti's
`TauCeti.quotientOpenSubgroup` (`TauCeti/Topology/Algebra/Group/Quotient/Basic.lean`), which needs
neither the closedness of `N` nor `N ≤ U`. -/
abbrev quotientOpenSubgroup (N : Subgroup G) [N.Normal] (_hN : IsClosed (N : Set G))
    (U : OpenSubgroup G) (_hNU : N ≤ U) :
    OpenSubgroup (G ⧸ N) :=
  TauCeti.quotientOpenSubgroup N U

/-- **Layer 13, the index is unchanged by passing to the quotient,** for `N ≤ U`: Tau Ceti's
`TauCeti.quotientOpenSubgroup_index`. Without it the two sides of the inflation compatibility below
sit in different degrees. -/
theorem quotientOpenSubgroup_index (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    (U : OpenSubgroup G) (hNU : N ≤ U) :
    (quotientOpenSubgroup N hN U hNU).toSubgroup.index = U.toSubgroup.index :=
  TauCeti.quotientOpenSubgroup_index N U hNU

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

/-! The index-two norm and the identities the Quadratic Form Invariants roadmap consumes, as
equations of classes. Identity 2 is the polarization, and its right-hand side is the corestriction
of the cup with the **conjugate** class; a formula without the conjugate is a different
statement. -/

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

/-- **Layer 13, the class of the graph cocycle,** the explicit index-2 degree-1 norm: Tau Ceti's
`TauCeti.ContCohomology.graphClass`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Class.lean`),
the class of the graph cocycle `TauCeti.ContCohomology.evensGraphCocycle` in canonical continuous
cohomology through the explicit degree-two comparison. It is choice-free:
`evensGraphCochain_independent_of_rep` says that two elements outside `U` give graph cochains
differing by a coboundary, so the class depends on `U` and `α` alone, and Tau Ceti's
`TauCeti.ContCohomology.graphClass_eq_cochainClass` identifies it with the class of the graph
cocycle at **every** `s ∉ U`. -/
noncomputable abbrev graphClass (hU : U.toSubgroup.index = 2)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    (continuousCohomology ℤ G 2).obj (trivialF2 G) :=
  TauCeti.ContCohomology.graphClass U hU α hα

/-- **Layer 13, the graph class is the class of the graph cochain,** at every element outside `U`,
read on Mathlib's homogeneous complex through Layer 3's `inhomogeneousCochain2` and Layer 1's
`cochainClass`. Tau Ceti's `TauCeti.ContCohomology.graphClass_eq_cochainClass` is the same statement
with the class read through the explicit comparison `explicitH2AddEquivContinuousCohomology`
(`TauCeti.ContCohomology.evensGraphCochainClass`); this is its form in the presentation the
consumers compute with, a comparison between the two presentations of one class. Quantifying over
`s` is what makes it choice-free. -/
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

/-- **Layer 13, the class of a continuous homomorphism is the class of its cochain,** for a
profinite group. This pins `homClass`: through Layer 3's `inhomogeneousCochain1` it is the quotient
class of `h ↦ α h`, read additively. -/
theorem homClass_eq_cochainClass (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (α : H →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    homClass H α hα =
      cochainClass ℤ (trivialF2 H) 1
        (inhomogeneousCochain1 H (fun h => Multiplicative.toAdd (α h)) (continuous_toAdd.comp hα))
        (inhomogeneousCochain1_d_eq_zero H _ _ fun g h => by simp [map_mul, toAdd_mul]) :=
  sorry

/-- **Layer 13, every degree-one class is the class of a continuous homomorphism.** With trivial
`𝔽₂` coefficients `H¹(H, 𝔽₂) = Hom_cont(H, 𝔽₂)`: a continuous 1-cocycle for the trivial action is a
continuous homomorphism and `B¹ = 0`, Layer 2's trivial-action characterization, carried to the
canonical carrier by Layer 3's `explicitH1IsoContinuousCohomology`. This is what lets a
class-valued function be defined by a formula on homomorphisms. -/
theorem homClass_surjective (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (x : (continuousCohomology ℤ H 1).obj (trivialF2 H)) :
    ∃ (α : H →* Multiplicative (ZMod 2)) (hα : Continuous α), homClass H α hα = x :=
  sorry

/-- **Layer 13, the index-2 degree-1 Evens norm** `N^{Ev} : H¹(U, 𝔽₂) → H²(G, 𝔽₂)`: the class of the
two-point graph cocycle, descended to `H¹(U, 𝔽₂)` through `homClass`. It is defined from
`graphClass` and not from the general norm: `graphClass_representative_independent` makes the
representative chosen in the body invisible, and `evensNormIndexTwo_homClass` is the equation a
consumer computes with. Its agreement with the general construction is `evensNormIndexTwo_eq`,
milestone 10 of the general construction, and nothing in the explicit half or in its consumers
rests on that. It is a function and not an additive map; its failure of additivity is identity 2. -/
noncomputable def evensNormIndexTwo (hU : U.toSubgroup.index = 2)
    (x : (continuousCohomology ℤ U.toSubgroup 1).obj (trivialF2 U.toSubgroup)) :
    (continuousCohomology ℤ G 2).obj (trivialF2 G) :=
  graphClass U hU (homClass_surjective U.toSubgroup x).choose
    (homClass_surjective U.toSubgroup x).choose_spec.choose

/-- **Layer 13, the defining equation of the index-2 norm:** on the class of a continuous
homomorphism it is the graph class. -/
theorem evensNormIndexTwo_homClass (hU : U.toSubgroup.index = 2)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    evensNormIndexTwo U hU (homClass U.toSubgroup α hα) = graphClass U hU α hα :=
  graphClass_representative_independent U hU _ α _ hα
    (homClass_surjective U.toSubgroup _).choose_spec.choose_spec

/-- **Layer 13, the index-2 norm is the pullback of the `D₁₆` class:**
`N^{Ev}(α) = (Ind α)^* c_{D₁₆}`, the class of `c_{D₁₆} ∘ (Ind α × Ind α)`, at every `s ∉ U`. Proof:
`evensNormIndexTwo_homClass` and `graphClass_eq_cochainClass` at `s` make the left side the class of
`evensGraphCochain U s α`; `evensGraphCochain_eq_indexTwoInd_pullback` (proved above, from the
naturality `evensGraphCochain_comap` along `indexTwoInd`, the subgroup pullback
`comap_indexTwoInd_wreathBase`, the character pullback `wreathTautological_indexTwoInd`, the
transport `evensGraphCochain_subgroupCongr`, `evensGraphCochain_wreath_of_coord` at `Ind α (s)`,
and the universal identity `evensGraphCochain_wreath`) writes that cochain as the pulled-back
cocycle plus the coboundary of `wreathWitness ∘ Ind α` once `map_mul` rewrites
`Ind α g * Ind α h`; and `cochainClass_inhomogeneousCochain2_eq_of_coboundary`, with
`continuous_wreathWitness_indexTwoInd`, identifies the two classes. -/
theorem evensNormIndexTwo_eq_ind_pullback (hU : U.toSubgroup.index = 2) (s : G) (hs : s ∉ U)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    evensNormIndexTwo U hU (homClass U.toSubgroup α hα) =
      cochainClass ℤ (trivialF2 G) 2
        (inhomogeneousCochain2 G
          (fun q => wreathD16Cocycle
            (indexTwoInd U.toSubgroup hU s hs α q.1, indexTwoInd U.toSubgroup hU s hs α q.2))
          (continuous_wreathD16Cocycle_indexTwoInd U hU s hs α hα))
        (inhomogeneousCochain2_d_eq_zero G _ _ fun g h j => by
          simp only [map_mul]
          exact wreathD16Cocycle_isCocycle _ _ _) :=
  sorry

/-- **Layer 13, the class `χ_U ∈ H¹(G, 𝔽₂)` of the character of an index-two subgroup.** -/
noncomputable def indexTwoCharacterClass (hU : U.toSubgroup.index = 2) :
    (continuousCohomology ℤ G 1).obj (trivialF2 G) :=
  homClass G (indexTwoCharacter U.toSubgroup hU) (continuous_indexTwoCharacter U hU)

/-- **Layer 13, identity 5: the norm of a restricted class,**
`N^{Ev}(res_U y) = y ⌣ y + χ_U ⌣ y` in `H²(G, 𝔽₂)`. Proof: `evensGraphCochain_comp_subtype`,
`graphClass_eq_cochainClass` and `homClass_eq_cochainClass` put both sides on cochains, Layer 12's
`explicitIso_cup` identifies the two `(1,1)` cups with the cochain cups, and `cup_add_left`,
`cup_add_right` and the mod-2 symmetry of the `(1,1)` cup on classes cancel the two `χ_U ⌣ χ_U`
terms. The symmetry holds on classes only, not on cochains. -/
theorem evensNorm_of_res (hU : U.toSubgroup.index = 2)
    (y : (continuousCohomology ℤ G 1).obj (trivialF2 G)) :
    evensNormIndexTwo U hU ((trivialF2ResMap G U.toSubgroup 1).hom y) =
      cup (f2Pairing G) 1 1 y y + cup (f2Pairing G) 1 1 (indexTwoCharacterClass U hU) y :=
  sorry

/-! Layer 13, the index-two exact sequence in degrees `≤ 2`, from the coefficient sequence
`0 → 𝔽₂ → 𝔽₂[G ⧸ U] → 𝔽₂ → 0`: Shapiro turns the middle terms into the cohomology of `U`, the map
from the constants into restriction and the sum over the two cosets into corestriction, and the
connecting map is the cup with `δ⁰ 1 = χ_U`. The route is in `README.md` Layer 13. Every statement
needs index exactly two: at index three the kernel of the sum over the cosets is not the constants,
and for `S₃ ⊇ C₂` restriction and corestriction in degree one are both surjective, so
`indexTwo_exact_res1_cor1` fails. -/

/-- **Layer 13, the kernel of restriction in degree one** is `{0, χ_U}`, the image of `δ⁰`. -/
theorem indexTwo_ker_res1 (hU : U.toSubgroup.index = 2)
    (y : (continuousCohomology ℤ G 1).obj (trivialF2 G)) :
    (trivialF2ResMap G U.toSubgroup 1).hom y = 0 ↔ y = 0 ∨ y = indexTwoCharacterClass U hU :=
  sorry

/-- **Layer 13, exactness at `H¹(U, 𝔽₂)`:** the image of restriction is the kernel of
corestriction. -/
theorem indexTwo_exact_res1_cor1 (hU : U.toSubgroup.index = 2) :
    Function.Exact (trivialF2ResMap G U.toSubgroup 1).hom (trivialF2Corestriction G U 1).hom :=
  sorry

/-- **Layer 13, exactness at `H¹(G, 𝔽₂)`:** `χ_U ⌣ x = 0` exactly when `x` is a corestriction. -/
theorem indexTwo_exact_cor1_cup (hU : U.toSubgroup.index = 2)
    (x : (continuousCohomology ℤ G 1).obj (trivialF2 G)) :
    cup (f2Pairing G) 1 1 (indexTwoCharacterClass U hU) x = 0 ↔
      ∃ w, x = (trivialF2Corestriction G U 1).hom w :=
  sorry

/-- **Layer 13, exactness at `H²(G, 𝔽₂)`:** `ker res² = χ_U ⌣ H¹(G, 𝔽₂)`, the statement identities
1 and 2 leave open and identity 5 and the sibling roadmap's degree-2 computation use. The map is
restriction and not corestriction: for `C₄ ⊇ C₂`, restriction `H²(C₄, 𝔽₂) → H²(C₂, 𝔽₂)` is
injective while `χ_U ⌣ H¹(C₄, 𝔽₂) = 0`. -/
theorem indexTwo_exact_cup_res2 (hU : U.toSubgroup.index = 2)
    (z : (continuousCohomology ℤ G 2).obj (trivialF2 G)) :
    (trivialF2ResMap G U.toSubgroup 2).hom z = 0 ↔
      ∃ y, z = cup (f2Pairing G) 1 1 (indexTwoCharacterClass U hU) y :=
  sorry

/-- **Layer 13, exactness at `H²(U, 𝔽₂)`:** the image of restriction is the kernel of
corestriction. -/
theorem indexTwo_exact_res2_cor2 (hU : U.toSubgroup.index = 2) :
    Function.Exact (trivialF2ResMap G U.toSubgroup 2).hom (trivialF2Corestriction G U 2).hom :=
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

/-- **Layer 13, milestone 10: the general norm at index 2 and degree 1 is the graph class.** The
identification that makes the graph cocycle a standard construction rather than an ad hoc formula.
`evensNormIndexTwo` is the graph class descended to `H¹(U, 𝔽₂)`, so this compares the general
construction with the explicit one and not with an unconstrained map; the explicit half and its
consumers do not depend on it. -/
theorem evensNormIndexTwo_eq (hU : U.toSubgroup.index = 2)
    (x : (continuousCohomology ℤ U.toSubgroup 1).obj (trivialF2 U.toSubgroup)) :
    degreeCast (by rw [hU]) (trivialF2 G) (evensNorm U 1 x) = evensNormIndexTwo U hU x :=
  sorry

/-- **Layer 13, milestone 10 on the class of a continuous homomorphism:** the general norm of
`homClass α` is the graph class of `α`. -/
theorem evensNorm_eq_graphClass (hU : U.toSubgroup.index = 2)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    degreeCast (by rw [hU]) (trivialF2 G) (evensNorm U 1 (homClass U.toSubgroup α hα)) =
      graphClass U hU α hα :=
  (evensNormIndexTwo_eq U hU _).trans (evensNormIndexTwo_homClass U hU α hα)

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
finiteness of the degree. It is Tau Ceti's `TauCeti.galoisSubgroup`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean`), the fixing subgroup of
`σ L`, with membership `TauCeti.mem_galoisSubgroup_iff`. -/
noncomputable abbrev galoisSubgroup [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) :
    OpenSubgroup (AbsoluteGaloisGroup K) :=
  TauCeti.galoisSubgroup K L σ

/-- **Layer 9, the index is the degree.** This is what discharges the index hypotheses the
subgroup-indexed operations carry, and in particular the index-two hypothesis of
`evensNormIndexTwo`. -/
theorem galoisSubgroup_index [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) :
    (galoisSubgroup K L σ).toSubgroup.index = Module.finrank K L :=
  TauCeti.galoisSubgroup_index K L σ

/-- **Layer 9, that subgroup is the absolute Galois group of `L`,** as topological groups.
Continuous cohomology depends on the topology and not only on the underlying group, so the
comparison is a `ContinuousMulEquiv` and a bare `MulEquiv` would not support the transport
below. Tau Ceti's `TauCeti.galoisSubgroupEquiv`, conjugation by the identification of separable
closures `TauCeti.separableClosureRingEquiv`. -/
noncomputable abbrev galoisSubgroupEquiv [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) :
    AbsoluteGaloisGroup L ≃ₜ* ↥(galoisSubgroup K L σ).toSubgroup :=
  TauCeti.galoisSubgroupEquiv K L σ

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

/-- **Layer 9, the character of a quadratic extension:** the class in `H¹(G_K, 𝔽₂)` of the
character of `G_K` with kernel `G_L`, Layer 13's `indexTwoCharacterClass` at `galoisSubgroup`. -/
noncomputable def galoisCharacter [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) :
    (continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj (trivialF2 (AbsoluteGaloisGroup K)) :=
  indexTwoCharacterClass (galoisSubgroup K L σ) (by rw [galoisSubgroup_index]; exact hdeg)

/-- **Layer 9, independence of the embedding,** for the character. -/
theorem galoisCharacter_embedding_independent [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ τ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) :
    galoisCharacter K L σ hdeg = galoisCharacter K L τ hdeg :=
  sorry

/-- **Layer 13 at the bridge: identity 5,** `N^{Ev}(res y) = y ⌣ y + χ_{L/K} ⌣ y`, the transport of
`evensNorm_of_res`: `galoisEvens ∘ galoisRes` is `evensNormIndexTwo ∘ res` because the two
transports through `galoisF2Iso` cancel. -/
theorem galoisEvens_galoisRes [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (y : (continuousCohomology ℤ (AbsoluteGaloisGroup K) 1).obj
      (trivialF2 (AbsoluteGaloisGroup K))) :
    galoisEvens K L σ hdeg ((galoisRes K L σ 1).hom y) =
      cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 y y +
        cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 (galoisCharacter K L σ hdeg) y :=
  sorry

/-- **Layer 13 at the bridge: the kernel of restriction in degree two,**
`ker (res_{L/K}) = χ_{L/K} ⌣ H¹(G_K, 𝔽₂)`, the transport of `indexTwo_exact_cup_res2`. -/
theorem galoisRes_eq_zero_iff [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (z : (continuousCohomology ℤ (AbsoluteGaloisGroup K) 2).obj
      (trivialF2 (AbsoluteGaloisGroup K))) :
    (galoisRes K L σ 2).hom z = 0 ↔
      ∃ y, z = cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 (galoisCharacter K L σ hdeg) y :=
  sorry

/-- **Layer 13 at the bridge: restriction then corestriction is exact** at `H¹(G_L, 𝔽₂)` and at
`H²(G_L, 𝔽₂)` for a quadratic extension, the transport of `indexTwo_exact_res1_cor1` and
`indexTwo_exact_res2_cor2`. -/
theorem galoisRes_galoisCor_exact [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (n : ℕ)
    (hn : n = 1 ∨ n = 2) :
    Function.Exact (galoisRes K L σ n).hom (galoisCor K L σ n).hom :=
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

/-- **Layer 13, the restriction identity, at cochain level.** The first of the index-two identities
the Quadratic Form Invariants roadmap consumes: on `U × U` the graph cochain is the cup of `α` with
its conjugate, `res_U N^{Ev}(α) = α ⌣ (s · α)`. Stated on cochains here, since that is the form
the proof produces and the form a reader can check against the definition above. -/
example {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2) (s : G) (hs : s ∉ U)
    (α : U.toSubgroup →* Multiplicative (ZMod 2)) (γ η : G) (hγ : γ ∈ U) (hη : η ∈ U) :
    evensGraphCochain U.toSubgroup s α (γ, η) =
      evensExtend U.toSubgroup α γ * evensExtend U.toSubgroup α (s⁻¹ * η * s) :=
  TauCeti.ContCohomology.evensGraphCochain_apply_of_mem_of_mem hs hγ hη

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
