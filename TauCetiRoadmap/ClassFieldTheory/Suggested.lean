import Mathlib
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.FiniteExtension
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.NumberTheory.ClassFieldTheory.ClassField
import TauCeti.NumberTheory.ClassFieldTheory.Formation.GaloisMaps
import TauCeti.NumberTheory.ClassFieldTheory.Formation.GroundNorm
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Tate.Corestriction
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Tate.Cup
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Tate.Restriction
import TauCeti.NumberTheory.LocalField.GaloisAction
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp
import TauCeti.RepresentationTheory.Homological.TateCohomology.HerbrandQuotient
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic
import TauCeti.Topology.Algebra.GroupAction.InternalHom
import TauCetiRoadmap.ProfiniteCohomology.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

set_option autoImplicit false

/-!
# Class field theory: class formations, Tate's theorem, Artin reciprocity, and their consequences

The normative roadmap is `README.md`. This file pins the structures and maps on which the rest of
the development depends, together with the acceptance tests of `README.md` §5. `sorry` marks a
target, not a result.

Layers 1 and 2 are Tau Ceti's, in `TauCeti/NumberTheory/ClassFieldTheory/Formation/`, and are
consumed under Tau Ceti's names: formations, finite normal layers, restriction, corestriction,
inflation and conjugation of layers, class formations and their fundamental classes.
`ClassFormation` is re-exported so that the targets of Layers 3 and 4 are its methods. The file
defines no cohomology carrier: the finite-layer Tate cohomology `NormalLayer.TateH` is Mathlib's
`tateCohomology` of Tau Ceti's layer representation, and ordinary finite-layer cohomology is
Mathlib's `groupCohomology`.

The central design constraint is the definitional chain

```text
tateTheorem  →  tateIso (-2)  →  nakayamaNegTwo  →  artinEquiv := nakayamaNegTwo.symm  →  artinMap.
```

`tateIso`, `nakayamaNegTwo`, `artinEquiv` and `artinMap` are ordinary definitions with bodies, so
the requested Artin map is definitionally the inverse of cup product with the fundamental class in
Tate degrees `-2` and `0` after the canonical low-degree identifications; it is not an arbitrary
equivalence of two finite groups. Tate's theorem itself is stated generically, with its three
hypotheses as separate explicit arguments rather than as an opaque bundle of class-formation
axioms, and Tau Ceti's `ClassFormation` discharges them one by one.

The layer order is the dependency order and there are no forward references. In particular the
local Brauer group and its invariant (Layer 5) precede the local class formation (Layer 6) that
consumes them; local existence (Layer 8) follows the Kummer theory it uses; the local Weil group
(Layer 9) follows local existence, and its reciprocity isomorphism is stated only for finite
extensions of `ℚ_p`, where `injective_artinMap` is available; and the sum-of-local-invariants map
(Layer 10) precedes the global class formation (Layer 11) whose invariant it *is*. That invariant
is defined on every idele-class layer class by inflating to a refinement where the class lifts to
the idele layer: the lift does not exist at the given layer in general
(`surjective_ideleToClassH2_of_isCyclic` is the cyclic case), so the obstruction, the refinement
that kills it, and the independence of the value from every choice are separate targets.

Both arithmetic columns end at a class-field **correspondence**, not at an existence statement.
`ClassFormation.normSubgroup_maximalAbelianLayer` — the norm limitation theorem — says a layer and
its maximal abelian sublayer have the same norm subgroup, so `∃ V, normSubgroup V = N` cannot name
a class field. `localAbelianExistence` and `globalAbelianExistence` therefore return an abelian
layer, `localClassField_unique` and `globalClassField_unique` make that layer unique, and
`localClassField`/`globalClassField` are *defined* from existence rather than pinned by an unproved
equation. The global column is for number fields only.

Everything is stated in universe `0`, because Mathlib's `tateCohomology` requires the group and the
coefficient ring `ℤ` to live in one universe. All continuous cohomology is Mathlib's carrier as
exposed by `ProfiniteCohomology`; valuation and ramification objects come from
`LocalFieldsRamification`; moduli, ray classes, ideles, orders and Picard groups come from
`GlobalNumberFields`; the ideal Artin map comes from `NumberFieldArithmetic`. There is no
quadratic-form import.

Landed Tau Ceti declarations are consumed by name rather than restated: the formation machinery
of Layers 1 and 2 (`TauCeti.ClassFieldTheory.Formation`, `NormalLayer`, `LayerRestriction`,
`LayerRefinement`, `ClassFormation`, the maps between their cohomology groups and the cup product
`cupClass`), the comparison of the two absolute Galois groups
(`TauCeti.absoluteGaloisGroupRestrictEquiv`), the open subgroup cut out by a finite extension
(`TauCeti.galoisSubgroup`, `TauCeti.galoisSubgroupEquiv`), the class field of an open normal
subgroup and the abelian layers (`TauCeti.ClassFieldTheory.classField`,
`OpenNormalSubgroup.IsAbelianClassFieldLayer`), the profinite integers `TauCeti.zHat`, the Herbrand
quotient `TauCeti.TateCohomology.herbrandQuotient`, the Galois action on the integers of a local
field, the coefficient dictionary `TauCeti.ofDiscreteModule`, the Galois-cohomology coefficients
`TauCeti.KummerCoeff` and `TauCeti.UnitsCoeff`, the Kummer map `TauCeti.kummerMap` with Tau Ceti's
explicit `H¹`, and the internal hom `TauCeti.InternalHom` with its conjugation action and
evaluation pairing, from which the Tate dual and its evaluation pairing are built. The maximal
unramified extension, inertia, arithmetic Frobenius lifts and `Gal(K^ur/K) ≅ Ẑ` are Tau Ceti's
too, under their Tau Ceti names; `LocalFieldsRamification` states the ones the pinned Tau Ceti
revision lacks, under the same names, so the unqualified names used below resolve to Tau Ceti's
declarations once those are imported.
-/

namespace TauCetiRoadmap.ClassFieldTheory

open CategoryTheory NumberField IsDedekindDomain
open scoped MonoidalCategory nonZeroDivisors ValuativeRel TensorProduct
open TauCeti.ClassFieldTheory hiding ClassFormation

/-! ## Preliminaries: the invariant target `ℚ/ℤ`

Tau Ceti's `ClassFormation` writes `ℚ/ℤ` as the rational circle `AddCircle (1 : ℚ)`, its subgroup
of order `n` as the `n`-torsion `AddSubgroup.torsionBy`, and the invariant of the fundamental class
of a layer of degree `n` as the class of `1/n`. The three abbreviations below name these for the
arithmetic columns; they are Tau Ceti's conventions, not a second normalization. -/

/-- The target `ℚ/ℤ` of the class-formation invariant: Tau Ceti's `AddCircle (1 : ℚ)`. -/
abbrev RatModInt : Type := AddCircle (1 : ℚ)

/-- The subgroup of elements of `ℚ/ℤ` killed by `n`: the image of the invariant of a layer of
degree `n` (Tau Ceti's `ClassFormation.range_inv`). -/
abbrev ratModIntTorsion (n : ℕ) : AddSubgroup RatModInt :=
  AddSubgroup.torsionBy RatModInt n

/-- The class of `1/n` in `ℚ/ℤ`: the invariant of the fundamental class of a layer of degree `n`
(Tau Ceti's `ClassFormation.inv_fundamentalClass`). -/
abbrev fundamentalInvariant (n : ℕ) : RatModInt :=
  ((1 / n : ℚ) : AddCircle (1 : ℚ))

/-! ## Layers 1 and 2: formations, finite normal layers, and class formations

Layers 1 and 2 are implemented in Tau Ceti, in `TauCeti/NumberTheory/ClassFieldTheory/Formation/`,
and are consumed here under Tau Ceti's names; none of them is restated.

* The formation `Formation G` is Tau Ceti's `SmoothDiscreteTopRep ℤ G` on a profinite `G`, with its
  levels `Formation.level` (submodules of the ambient module).
* A finite normal layer `NormalLayer G` has its Galois group `Gal`, `degree`, coefficient module
  `rep`, cohomology carriers `H`, `TateH` and `TrivialTateH`, norm `norm`, `normSubgroup`,
  `NormQuotient` and `normQuotientMk`; the layers `ofOpenNormal` of open normal subgroups; the
  finite quotient system `subgroupLayer`, `subgroupGalEquiv`, `subgroupRestriction`,
  `degree_subgroupLayer` and `relativeDegree_subgroupRestriction`; the low Tate degrees `tateHIsoH`,
  `tateHMinusTwoEquivAbelianization`, `tateHZeroEquivNormQuotient` and `zeroTateClass`; and
  conjugation `conjugate`, `conjugateCohomologyIso`, `conjugateTateIso`,
  `conjugateGroundLevelEquiv` and `conjugateGalEquiv`.
* A restriction `LayerRestriction` has its `relativeDegree`, `cohomologyRes`, `cohomologyCor`,
  `tateRes`, `tateCor`, `trivialTateRes`, `trivialTateCor`, `groundInclusion`, `groundNorm`,
  `transferHom` and `inclusionHom`, the normalization `cohomologyCor_cohomologyRes` and
  `tateCor_tateRes`, and the tower laws `trans`, `relativeDegree_trans`, `cohomologyRes_trans`,
  `cohomologyCor_trans`, `tateRes_trans` and `tateCor_trans`.
* A refinement `LayerRefinement` has its `relativeDegree`, `cohomologyInfl`, `tateInfl`,
  `groundEquiv` and `quotientHom`, the tower laws `trans`, `relativeDegree_trans` and
  `cohomologyInfl_trans`, and `exists_commonRefinement`.
* The abelian layers are `AbelianLayer`, with `isMulCommutative_gal_ofOpenNormal` and
  `abelianizationGalEquiv`.
* A class formation `ClassFormation F` carries its invariant map as data (`subsingleton_h1`, `inv`,
  `inv_injective`, `range_inv`, `inv_restrict`, `inv_infl`, `inv_conj`), and derives
  `fundamentalClass` with `inv_fundamentalClass`, `fundamentalClass_generates`,
  `fundamentalClass_restrict`, `fundamentalClass_infl`, `fundamentalClass_conj`, `inv_cor`,
  `fundamentalClass_cor`, `tateFundamentalClass`, the three hypotheses of Tate's theorem
  `h1_subgroupLayer`, `card_H2_subgroupLayer` and `fundamentalClass_restrict_generates`, and the
  cyclic norm index `natCard_normQuotient`.
* The cup product with a class of `H²` is `cupClass`, and with the fundamental class
  `ClassFormation.cupFundamentalClass`.

What Tau Ceti does not yet have, namely Tate's theorem, the Artin map and its properties, is stated
in Layers 3 and 4 below as targets about these objects. -/

/-- **Tau Ceti's class formation**, `TauCeti.ClassFieldTheory.ClassFormation`, re-exported so that
the targets of Layers 3 and 4 (Tate's theorem for the class formation, the Nakayama map, the Artin
equivalence and the Artin map) are stated as its methods, `cf.tateIso` and `cf.artinMap`. It is an
abbreviation: every field and theorem of Tau Ceti's structure applies to it by name. -/
abbrev ClassFormation {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (F : Formation G) :=
  TauCeti.ClassFieldTheory.ClassFormation F

/-! ### Abelian layers and the maximal abelian sublayer

An open normal subgroup with the right norm subgroup is not yet *the* class field attached to that
subgroup. A nonabelian layer and its maximal abelian sublayer have the **same** norm subgroup
(`ClassFormation.normSubgroup_maximalAbelianLayer`), so `∃ V, normSubgroup V = N` alone determines
nothing; the class-field correspondence is a bijection only after the Galois side is cut down to
the layers whose finite quotient is abelian.

⚠ The carrier of that condition is the closed commutator subgroup
`(commutator G).topologicalClosure`, the subgroup Mathlib's `TopologicalAbelianization` and
`Field.absoluteGaloisGroupAbelianization` already quotient by. No second closed commutator subgroup
is introduced here. The algebraic `commutator G` is the wrong subgroup for a profinite `G`: it need
not be closed, so `G ⧸ commutator G` need not be profinite, and Layer 9 records the same warning
for the Weil group.

The predicate, its carrier `AbelianLayer` and the maximal abelian sublayer are Tau Ceti's
(`OpenNormalSubgroup.IsAbelianClassFieldLayer`, `TauCeti.ClassFieldTheory.AbelianLayer`,
`OpenNormalSubgroup.maximalAbelianLayer`), as are `isMulCommutative_gal_ofOpenNormal` and
`abelianizationGalEquiv`; the predicate and the sublayer are consumed here under the names the rest
of this file uses, and the theorems below are Tau Ceti's proofs, applied. -/

/-- An open normal subgroup cuts out an **abelian layer** when it contains the closed commutator
subgroup — equivalently, when its finite quotient is commutative
(`isAbelianClassFieldLayer_iff_isMulCommutative`). In field language `V` is abelian exactly when
the finite extension it cuts out is abelian over the ground field. These are the open normal
subgroups that occur in the class-field correspondence. Tau Ceti's
`OpenNormalSubgroup.IsAbelianClassFieldLayer`. -/
abbrev IsAbelianClassFieldLayer {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (V : OpenNormalSubgroup G) : Prop :=
  V.IsAbelianClassFieldLayer

section AbelianLayer

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The finite-quotient form of the condition. `IsMulCommutative` is Mathlib's
proposition-valued spelling of commutativity, used here because commutativity of `G ⧸ V` is a
hypothesis on `V` and so cannot be an instance. -/
theorem isAbelianClassFieldLayer_iff_isMulCommutative (V : OpenNormalSubgroup G) :
    IsAbelianClassFieldLayer V ↔ IsMulCommutative (G ⧸ V.toSubgroup) :=
  V.isAbelianClassFieldLayer_iff_isMulCommutative

/-- **The maximal abelian sublayer**, canonically: the join `V · [G,G]‾`. In field language it is
the maximal abelian subextension of the extension cut out by `V`. It is genuine data — a join of
two named subgroups — and never "some abelian layer with the same norm subgroup". Tau Ceti's
`OpenNormalSubgroup.maximalAbelianLayer`. -/
abbrev maximalAbelianLayer (V : OpenNormalSubgroup G) : OpenNormalSubgroup G :=
  V.maximalAbelianLayer

@[simp]
theorem toSubgroup_maximalAbelianLayer (V : OpenNormalSubgroup G) :
    (maximalAbelianLayer V).toSubgroup = V.toSubgroup ⊔ (commutator G).topologicalClosure :=
  V.toSubgroup_maximalAbelianLayer

theorem le_maximalAbelianLayer (V : OpenNormalSubgroup G) : V ≤ maximalAbelianLayer V :=
  V.le_maximalAbelianLayer

theorem isAbelianClassFieldLayer_maximalAbelianLayer (V : OpenNormalSubgroup G) :
    IsAbelianClassFieldLayer (maximalAbelianLayer V) :=
  V.isAbelianClassFieldLayer_maximalAbelianLayer

/-- Maximality, in subgroup form: `maximalAbelianLayer V` is the smallest abelian layer above `V`,
so in field language the largest abelian subextension of the extension cut out by `V`. -/
theorem maximalAbelianLayer_le {V W : OpenNormalSubgroup G} (hVW : V ≤ W)
    (hW : IsAbelianClassFieldLayer W) : maximalAbelianLayer V ≤ W :=
  OpenNormalSubgroup.maximalAbelianLayer_le hVW hW

theorem maximalAbelianLayer_eq_self_iff (V : OpenNormalSubgroup G) :
    maximalAbelianLayer V = V ↔ IsAbelianClassFieldLayer V :=
  V.maximalAbelianLayer_eq_self_iff

end AbelianLayer

/-! ## Layer 3: Tate's theorem (Artin–Tate's Main Theorem)

⚠ Tate's theorem is stated **generically**, with each of its hypotheses a separate explicit
argument about a formation, a finite normal layer, and a chosen two-dimensional class. It is not
stated against an opaque bundle of "class-formation axioms". The hypotheses are used separately
downstream — the cyclic-layer Herbrand computations need only `h1`, the norm-index theorems only
`hcard`, the tower comparisons only `hgen` — and a consumer that has established them for one
layer applies the theorem directly. Tau Ceti's `ClassFormation` is one supplier of the three
hypotheses, through its individually named `ClassFormation.h1_subgroupLayer`,
`ClassFormation.card_H2_subgroupLayer` and `ClassFormation.fundamentalClass_restrict_generates`.
The cup-product map is Tau Ceti's `cupClass`. -/

section TateTheorem

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Tate's theorem** (J. Tate, *The higher dimensional cohomology groups of class field theory*,
Ann. of Math. 56 (1952); Artin–Tate, Chapter XIV §4), with its hypotheses stated one by one over
Tau Ceti's finite quotient system `H ↦ L.subgroupLayer H`:

* `_h1` — `H¹(H, A^V) = 0` for every subgroup `H ≤ U/V`;
* `_hcard` — `H²(H, A^V)` has exactly `#H` elements;
* `_hgen` — the restriction of `u` to the layer of `H` generates that layer's `H²`.

Then cup product with `u` (Tau Ceti's `cupClass`) is an isomorphism
`Ĥ^r(U/V,ℤ) ≃ Ĥ^{r+2}(U/V,A^V)` in every integer degree. The Tate–Nakayama generalization replaces
the trivial coefficients `ℤ` by a module `M` with `Tor₁^ℤ(M,A^V) = 0`; it is the same three
hypotheses plus that vanishing, and it belongs to the generic Tate-cohomology supplier of
Layer 0. -/
noncomputable def tateTheorem (F : Formation G) (L : NormalLayer G) (u : L.H F 2)
    (_h1 : ∀ H : Subgroup L.Gal, Subsingleton ((L.subgroupLayer H).H F 1))
    (_hcard : ∀ H : Subgroup L.Gal, Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H)
    (_hgen : ∀ (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2),
      ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 u)
    (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  sorry

/-- The isomorphism of Tate's theorem **is** cup product with `u`, Tau Ceti's `cupClass`, not an
unrelated equivalence between two groups. -/
theorem tateTheorem_toAddMonoidHom (F : Formation G) (L : NormalLayer G) (u : L.H F 2)
    (h1 : ∀ H : Subgroup L.Gal, Subsingleton ((L.subgroupLayer H).H F 1))
    (hcard : ∀ H : Subgroup L.Gal, Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H)
    (hgen : ∀ (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2),
      ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 u)
    (r : ℤ) :
    (tateTheorem F L u h1 hcard hgen r).toAddMonoidHom = cupClass F L u r :=
  sorry

end TateTheorem

namespace ClassFormation

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {F : Formation G}

/-- Tate's theorem for a class formation, in every integer degree: the generic theorem applied to
Tau Ceti's fundamental class, with the three hypotheses discharged by Tau Ceti's three individually
named consequences of the axioms. This is Artin–Tate's Main Theorem (Chapter XIV §4). -/
noncomputable def tateIso (cf : ClassFormation F) (L : NormalLayer G) (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  tateTheorem F L (cf.fundamentalClass L) (cf.h1_subgroupLayer L)
    (cf.card_H2_subgroupLayer L) (cf.fundamentalClass_restrict_generates L) r

/-- The isomorphism is Tau Ceti's cup product with the fundamental class,
`ClassFormation.cupFundamentalClass`, not an unrelated equivalence between groups of the same
cardinality. A closed proof: `tateIso` is definitionally the generic theorem, so this is the generic
statement, applied. -/
theorem tateIso_toAddMonoidHom (cf : ClassFormation F)
    (L : NormalLayer G) (r : ℤ) :
    (cf.tateIso L r).toAddMonoidHom = cf.cupFundamentalClass L r :=
  tateTheorem_toAddMonoidHom F L (cf.fundamentalClass L) (cf.h1_subgroupLayer L)
    (cf.card_H2_subgroupLayer L) (cf.fundamentalClass_restrict_generates L) r

/-- Compatibility of Tate's theorem with restriction to an intermediate ground field, through Tau
Ceti's `LayerRestriction.tateRes` and `trivialTateRes`. -/
theorem tateIso_res (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (r : ℤ)
    (x : big.TrivialTateH r) :
    T.tateRes F (r + 2) (cf.tateIso big r x) =
      cf.tateIso small r (T.trivialTateRes r x) :=
  sorry

/-- Compatibility of Tate's theorem with corestriction, through Tau Ceti's
`LayerRestriction.tateCor` and `trivialTateCor`. ⚠ The corestriction square commutes without a
scaling factor, where the restriction square of `tateIso_res` also does but the *inflation* square
of `ClassFormation.fundamentalClass_infl` does not. Asserting one shape for all three is the
standard error here. -/
theorem tateIso_cor (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (r : ℤ)
    (x : small.TrivialTateH r) :
    T.tateCor F (r + 2) (cf.tateIso small r x) =
      cf.tateIso big r (T.trivialTateCor r x) :=
  sorry

/-- Compatibility of Tate's theorem with a tower of ground fields, `F ⊆ E ⊆ E' ⊆ K`. Together with
Tau Ceti's `LayerRestriction.relativeDegree_trans` this is the tower normalization the local and
global towers of Layers 6 and 11 consume. -/
theorem tateIso_res_trans (cf : ClassFormation F)
    {small mid big : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) (r : ℤ) (x : big.TrivialTateH r) :
    (S.trans T).tateRes F (r + 2) (cf.tateIso big r x) =
      cf.tateIso small r ((S.trans T).trivialTateRes r x) :=
  sorry

/-! ## Layer 4: low Tate degrees and the abstract Artin map

The two low-degree identifications are Tau Ceti's `NormalLayer.tateHMinusTwoEquivAbelianization`
and `NormalLayer.tateHZeroEquivNormQuotient`, and the zero-dimensional class of an element of the
ground level is Tau Ceti's `NormalLayer.zeroTateClass`. -/

/-- The degree `-2 → 0` cup-product direction, the Nakayama map `Γ^ab ≃ A^U / N(A^V)`. -/
noncomputable def nakayamaNegTwo (cf : ClassFormation F) (L : NormalLayer G) :
    Additive (Abelianization L.Gal) ≃+ L.NormQuotient F :=
  L.tateHMinusTwoEquivAbelianization.symm.trans
    ((cf.tateIso L (-2)).trans (L.tateHZeroEquivNormQuotient F))

/-- **The Artin reciprocity direction.** Definitionally the inverse of `nakayamaNegTwo`; not a
new opaque choice. -/
noncomputable def artinEquiv (cf : ClassFormation F) (L : NormalLayer G) :
    L.NormQuotient F ≃+ Additive (Abelianization L.Gal) :=
  (cf.nakayamaNegTwo L).symm

/-- The Artin map on the ground level, with kernel the norm subgroup. -/
noncomputable def artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    F.level L.ground →+ Additive (Abelianization L.Gal) :=
  (cf.artinEquiv L).toAddMonoidHom.comp (L.normQuotientMk F).toAddMonoidHom

/-- Elementwise form of the definition of `artinMap`. -/
theorem artinMap_apply (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground) :
    cf.artinMap L a = cf.artinEquiv L (L.normQuotientMk F a) :=
  rfl

/-- The defining equality, recorded explicitly for downstream users and regression tests. -/
theorem artinEquiv_eq_tateIso (cf : ClassFormation F) (L : NormalLayer G) :
    cf.artinEquiv L =
      (L.tateHMinusTwoEquivAbelianization.symm.trans
        ((cf.tateIso L (-2)).trans (L.tateHZeroEquivNormQuotient F))).symm :=
  rfl

/-- The kernel of the Artin map is exactly Tau Ceti's norm subgroup. -/
theorem ker_artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    (cf.artinMap L).ker = (L.normSubgroup F).toAddSubgroup :=
  sorry

/-- Elementwise norm-kernel criterion. -/
theorem artinMap_eq_zero_iff (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground) :
    cf.artinMap L a = 0 ↔ a ∈ L.normSubgroup F :=
  sorry

/-- The finite-level Artin map is onto the abelianized finite Galois group. -/
theorem surjective_artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    Function.Surjective (cf.artinMap L) :=
  sorry

end ClassFormation

section Character

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- The connecting class `δχ ∈ Ĥ²(Γ,ℤ)` attached to a character `χ : Γ^ab → ℚ/ℤ` through
`0 → ℤ → ℚ → ℚ/ℤ → 0`. -/
noncomputable def characterConnectingClass (L : NormalLayer G)
    (χ : Additive (Abelianization L.Gal) →+ RatModInt) :
    L.TrivialTateH 2 :=
  sorry

/-- **The class `a₀ ∪ δχ ∈ H²(Γ, A^V)`**: Tau Ceti's Tate cup product
`TauCeti.TateCohomology.cup` of the zero-dimensional class `L.zeroTateClass F a` with
`characterConnectingClass L χ`, followed by the unitor `A^V ⊗ ℤ ≅ A^V` and Tau Ceti's
identification `NormalLayer.tateHIsoH` of Tate degree two with ordinary `H²`. -/
noncomputable def artinCharacterCup (F : Formation G) (L : NormalLayer G)
    (a : F.level L.ground) (χ : Additive (Abelianization L.Gal) →+ RatModInt) : L.H F 2 :=
  (L.tateHIsoH F 2).hom ((tateCohomologyFunctor 2).map (ρ_ (L.rep F)).hom
    (TauCeti.TateCohomology.cup (L.rep F) (Rep.trivial ℤ L.Gal ℤ) 0 2 2 (by omega)
      (L.zeroTateClass F a) (characterConnectingClass L χ)))

end Character

namespace ClassFormation

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {F : Formation G}

/-- Artin–Tate's character characterization `χ(artinMap a) = inv(a₀ ∪ δχ)`. Together with the
transparent definition of `artinEquiv`, this pins the direction and the sign of the Artin map. -/
theorem character_artinMap (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground)
    (χ : Additive (Abelianization L.Gal) →+ RatModInt) :
    χ (cf.artinMap L a) = cf.inv L (artinCharacterCup F L a χ) :=
  sorry

/-- Uniqueness: a homomorphism satisfying the character formula for every character is the Artin
map. -/
theorem eq_artinMap_of_character (cf : ClassFormation F) (L : NormalLayer G)
    (φ : F.level L.ground →+ Additive (Abelianization L.Gal))
    (hφ : ∀ (a : F.level L.ground) (χ : Additive (Abelianization L.Gal) →+ RatModInt),
      χ (φ a) = cf.inv L (artinCharacterCup F L a χ)) :
    φ = cf.artinMap L :=
  sorry

/-! ### The four Artin–Tate functoriality diagrams

Every map below is Tau Ceti's: `LayerRestriction.groundInclusion`, `transferHom`, `groundNorm`
and `inclusionHom`, `NormalLayer.conjugateGroundLevelEquiv` and `conjugateGalEquiv`, and
`LayerRefinement.groundEquiv` and `quotientHom`. -/

/-- Inclusion of ground levels corresponds to group-theoretic transfer. -/
theorem artinMap_groundInclusion (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (a : F.level big.ground) :
    cf.artinMap small (T.groundInclusion F a) = T.transferHom (cf.artinMap big a) :=
  sorry

/-- The norm on ground levels corresponds to inclusion of Galois groups. -/
theorem artinMap_groundNorm (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (b : F.level small.ground) :
    cf.artinMap big (T.groundNorm F b) = T.inclusionHom (cf.artinMap small b) :=
  sorry

/-- Conjugation corresponds to conjugation of Artin symbols: on the conjugate layer
`L.conjugate g`, the Artin symbol of `g · a` is the conjugate by `g` of the Artin symbol of `a`. -/
theorem artinMap_conj (cf : ClassFormation F) (g : G) (L : NormalLayer G)
    (a : F.level L.ground) :
    cf.artinMap (L.conjugate g) (L.conjugateGroundLevelEquiv F g a) =
      (L.conjugateGalEquiv g).abelianizationCongr.toAdditive (cf.artinMap L a) :=
  sorry

/-- Passage to a quotient extension corresponds to the quotient map on Galois groups. -/
theorem artinMap_quotient (cf : ClassFormation F)
    {old new : NormalLayer G} (T : LayerRefinement old new) (a : F.level old.ground) :
    cf.artinMap old a = T.quotientHom (cf.artinMap new (T.groundEquiv F a)) :=
  sorry

/-! ### The norm limitation theorem

The theorem that makes "the class field attached to `N`" meaningful: passing to the maximal
abelian sublayer does not change the norm subgroup. It is a theorem about a class formation, not
about an arbitrary formation, and it is proved from reciprocity rather than from existence: the
inclusion `≤` is functoriality of the norm along `V ≤ V·[G,G]‾`, and the two norm subgroups have
the same index in the ground level because `artinEquiv` identifies both quotients with
`(G ⧸ V)^ab = G ⧸ (V·[G,G]‾)`. Consequently the arbitrary-layer existence statement
`∃ V, normSubgroup V = N` cannot pin down `V`, and Layers 8 and 12 state existence with
`IsAbelianClassFieldLayer V` in the conclusion. -/

/-- **Norm limitation.** A layer and its maximal abelian sublayer have the same norm subgroup. -/
theorem normSubgroup_maximalAbelianLayer (cf : ClassFormation F) (V : OpenNormalSubgroup G) :
    (NormalLayer.ofOpenNormal (maximalAbelianLayer V)).normSubgroup F =
      (NormalLayer.ofOpenNormal V).normSubgroup F :=
  sorry

/-! ### Abstract acceptance tests

The cyclic norm index `Nat.card (A^U / N(A^V)) = [U:V]` is Tau Ceti's
`ClassFormation.natCard_normQuotient`. -/

/-- Trivial layer: the Artin map of the layer `U/U` is the zero map between trivial groups. -/
theorem artinMap_trivialLayer (cf : ClassFormation F) (L : NormalLayer G)
    (hL : L.top = L.ground) :
    cf.artinMap L = 0 :=
  sorry

/-- The Artin symbol of `a` generates the abelianized Galois group exactly when the class of `a`
generates the norm quotient. -/
theorem isGenerator_artinMap_iff (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground) :
    AddSubgroup.zmultiples (cf.artinMap L a) = ⊤ ↔
      AddSubgroup.zmultiples (L.normQuotientMk F a) = ⊤ :=
  sorry

/-- In a quadratic layer, every nonzero element of the target is the Artin symbol of exactly the
non-norms: the abstract form of the first nontrivial regression test. -/
theorem artinMap_quadratic_eq_nontrivial_iff_not_norm
    (cf : ClassFormation F) (L : NormalLayer G)
    (hdegree : L.degree = 2)
    (σ : Additive (Abelianization L.Gal)) (hσ : σ ≠ 0)
    (a : F.level L.ground) :
    cf.artinMap L a = σ ↔ a ∉ L.normSubgroup F :=
  sorry

end ClassFormation

/-! ## Layer 5: local coefficients, the Brauer group, the local invariant, and duality

⚠ The local Brauer group and its invariant map are built **before** the local class formation, not
after it. `localClassFormation` of Layer 6 consumes `invMap`; nothing in this layer may consume
`localArtinMap`, `normResidue`, `localExistence`, or the local class formation itself. -/

/-- Coefficients for the absolute Galois group, on the imported continuous carrier. -/
abbrev GalRep (n : ℕ) (F : Type) [Field F] : Type 1 :=
  ProfiniteCohomology.TopRep (ZMod n) (Field.absoluteGaloisGroup F)

/-- `Hⁱ(G_F,A)` on Mathlib's continuous cohomology functor. -/
noncomputable abbrev H (n : ℕ) (F : Type) [Field F]
    (i : ℕ) (A : GalRep n F) : Type _ :=
  continuousCohomology i A

/-! ### The Galois dictionary between open normal subgroups and finite abelian extensions

Both arithmetic columns state their class-field correspondence on `OpenNormalSubgroup (G_F)`, and
both need the same translation into fields. It is recorded once, here, because the local column
(Layer 8) and the global column (Layer 12) each use it.

⚠ **The two orderings run in opposite directions, and only one of them reverses.** Inclusion of
subgroups of `G_F` is *reverse* inclusion of the fields they cut out, so a class-field
correspondence written on subgroups is order **preserving**
(`N₁ ≤ N₂ ↔ V₁ ≤ V₂`) and the same correspondence written on fields is order **reversing**
(`N₁ ≤ N₂ ↔ L₂ ≤ L₁`). Both forms are stated below at each scope; writing the subgroup form with
the inclusions reversed would be false. -/

/-- **The finite extension cut out by an open normal subgroup of `G_F`**, its fixed field inside
the separable closure, is Tau Ceti's `classField F V`, and the Galois correspondence in the
direction this roadmap uses — bigger subgroup, smaller field — is Tau Ceti's
`classField_le_classField_iff`. Both are consumed by name below. -/
example (F : Type) [Field F] (V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup F)) :
    classField F W ≤ classField F V ↔ V ≤ W :=
  classField_le_classField_iff F V W

section Local

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-! ### Kummer coefficients, the local Brauer group, and the invariant map

Every coefficient object of this layer is a discrete module of Tau Ceti's Galois cohomology, read
as an object of `GalRep n F` (or of `TopRep ℤ G_F`) through Tau Ceti's coefficient dictionary
`TauCeti.ofDiscreteModule`. Tau Ceti's modules carry the action of the separable-closure group
`TauCeti.AbsoluteGaloisGroup F`, and Mathlib's `Field.absoluteGaloisGroup F` acts on them through
`absoluteGaloisGroupComparison`. No coefficient module is built a second time. -/

/-- Restriction identifies the algebraic-closure and separable-closure absolute Galois groups as
topological groups: Tau Ceti's `absoluteGaloisGroupRestrictEquiv`, whose forward map is
`AlgEquiv.restrictNormalHom` (`absoluteGaloisGroupRestrictEquiv_apply`). The transport is not
definitional over imperfect fields. -/
noncomputable abbrev absoluteGaloisGroupComparison (F : Type) [Field F] :
    Field.absoluteGaloisGroup F ≃ₜ* TauCeti.AbsoluteGaloisGroup F :=
  TauCeti.absoluteGaloisGroupRestrictEquiv F

/-- The comparison on elements: an automorphism of the algebraic closure and its image act in the
same way on the separable closure. Tau Ceti's `coe_absoluteGaloisGroupRestrictEquiv_apply`,
applied; the coercion names its type because `Field.absoluteGaloisGroup F` is a `def`. -/
theorem coe_absoluteGaloisGroupComparison_apply (F : Type) [Field F]
    (σ : Field.absoluteGaloisGroup F) (x : SeparableClosure F) :
    (absoluteGaloisGroupComparison F σ x : AlgebraicClosure F) =
      DFunLike.coe (F := Gal(AlgebraicClosure F/F)) σ (x : AlgebraicClosure F) :=
  TauCeti.coe_absoluteGaloisGroupRestrictEquiv_apply F σ x

/-- **`G_F` acting through the comparison.** A module of Tau Ceti's Galois cohomology carries the
action of the separable-closure group `TauCeti.AbsoluteGaloisGroup F`; this is the action of
Mathlib's `Field.absoluteGaloisGroup F` that it induces through `absoluteGaloisGroupComparison`.
It is used only as a local instance, to build the coefficient objects `muNRep` and `unitsRep`
below, whose actions are then read off `muNRep_ρ_apply` and `unitsRep_ρ_apply`. -/
@[instance_reducible]
noncomputable def comparisonDistribMulAction (F : Type) [Field F] (M : Type*) [AddMonoid M]
    [DistribMulAction (TauCeti.AbsoluteGaloisGroup F) M] :
    DistribMulAction (Field.absoluteGaloisGroup F) M :=
  DistribMulAction.compHom M (absoluteGaloisGroupComparison F).toMulEquiv.toMonoidHom

section ComparisonAction

attribute [local instance] comparisonDistribMulAction

/-- The comparison action is continuous, `absoluteGaloisGroupComparison` being a homeomorphism. -/
theorem comparison_continuousSMul (F : Type) [Field F] (M : Type*) [AddMonoid M]
    [TopologicalSpace M] [DistribMulAction (TauCeti.AbsoluteGaloisGroup F) M]
    [ContinuousSMul (TauCeti.AbsoluteGaloisGroup F) M] :
    ContinuousSMul (Field.absoluteGaloisGroup F) M :=
  ⟨(continuous_smul (M := TauCeti.AbsoluteGaloisGroup F) (X := M)).comp
    (((absoluteGaloisGroupComparison F).continuous.comp continuous_fst).prodMk continuous_snd)⟩

end ComparisonAction

/-- `μ_n(Fˢ)` is killed by `n`. -/
theorem nsmul_kummerCoeff_eq_zero (F : Type) [Field F] (n : ℕ) (x : TauCeti.KummerCoeff F n) :
    n • x = 0 := by
  have hx : ((Additive.toMul x : rootsOfUnity n (SeparableClosure F)) :
      (SeparableClosure F)ˣ) ^ n = 1 :=
    (mem_rootsOfUnity _ _).1 (Additive.toMul x).2
  exact Additive.toMul.injective (Subtype.ext hx)

/-- The `ZMod n`-module structure of `μ_n(Fˢ)`, from `nsmul_kummerCoeff_eq_zero`. -/
@[instance_reducible]
noncomputable def kummerCoeffModule (F : Type) [Field F] (n : ℕ) :
    Module (ZMod n) (TauCeti.KummerCoeff F n) :=
  AddCommGroup.zmodModule (nsmul_kummerCoeff_eq_zero F n)

section KummerCoefficients

attribute [local instance] comparisonDistribMulAction kummerCoeffModule

/-- Scalar multiplication by `ZMod n` on the discrete `μ_n(Fˢ)` is continuous. -/
theorem kummerCoeff_continuousSMul (F : Type) [Field F] (n : ℕ) :
    ContinuousSMul (ZMod n) (TauCeti.KummerCoeff F n) :=
  ⟨continuous_of_discreteTopology⟩

/-- The Galois action on `μ_n(Fˢ)` commutes with the `ZMod n`-scalars: every additive map between
`ZMod n`-modules is `ZMod n`-linear (`ZMod.map_smul`). -/
theorem kummerCoeff_smulCommClass (F : Type) [Field F] (n : ℕ) :
    SMulCommClass (Field.absoluteGaloisGroup F) (ZMod n) (TauCeti.KummerCoeff F n) :=
  ⟨fun g c x => ZMod.map_smul (DistribSMul.toAddMonoidHom (TauCeti.KummerCoeff F n) g) c x⟩

attribute [local instance] kummerCoeff_continuousSMul kummerCoeff_smulCommClass

/-- **The coefficient object `μ_n(Fˢ)`**: Tau Ceti's `KummerCoeff F n`, the `n`-th roots of unity of
the separable closure written additively, as an object of `GalRep n F` through Tau Ceti's
dictionary `TauCeti.ofDiscreteModule`, with `G_F` acting through `absoluteGaloisGroupComparison`
(`muNRep_ρ_apply`). -/
noncomputable def muNRep (n : ℕ) (F : Type) [Field F] : GalRep n F :=
  TauCeti.ofDiscreteModule (ZMod n) (Field.absoluteGaloisGroup F) (TauCeti.KummerCoeff F n)

/-- `μ_n(Fˢ)` is a smooth discrete coefficient object: Tau Ceti's
`ofDiscreteModule_isSmoothDiscrete`, the action being continuous (`comparison_continuousSMul`,
Tau Ceti's `kummerCoeff_continuousSMul`). -/
theorem isSmoothDiscrete_muNRep (n : ℕ) (F : Type) [Field F] :
    TauCeti.IsSmoothDiscrete (ZMod n) (muNRep n F) :=
  haveI := comparison_continuousSMul F (TauCeti.KummerCoeff F n)
  TauCeti.ofDiscreteModule_isSmoothDiscrete (ZMod n) (Field.absoluteGaloisGroup F)
    (TauCeti.KummerCoeff F n)

end KummerCoefficients

/-- `μ_n(Fˢ)` carries the discrete topology. -/
instance instDiscreteTopologyMuNRep (n : ℕ) (F : Type) [Field F] :
    DiscreteTopology (muNRep n F).V :=
  inferInstanceAs (DiscreteTopology (TauCeti.KummerCoeff F n))

/-- `μ_n(Fˢ)` is finite for `n ≠ 0`. -/
instance instFiniteMuNRep (n : ℕ) [NeZero n] (F : Type) [Field F] : Finite (muNRep n F).V :=
  inferInstanceAs (Finite (TauCeti.KummerCoeff F n))

/-- `μ_n(Fˢ)` is smooth, as an instance argument (`isSmoothDiscrete_muNRep`). This is how the
smoothness hypothesis of `finite_H`, local duality and the Euler characteristic is found at
`muNRep n F`. -/
instance instFactIsSmoothDiscreteMuNRep (n : ℕ) (F : Type) [Field F] :
    Fact (TauCeti.IsSmoothDiscrete (ZMod n) (muNRep n F)) :=
  ⟨isSmoothDiscrete_muNRep n F⟩

/-- **The action on `μ_n(Fˢ)`**: `G_F` acts through `absoluteGaloisGroupComparison`. -/
theorem muNRep_ρ_apply (n : ℕ) (F : Type) [Field F] (g : Field.absoluteGaloisGroup F)
    (x : TauCeti.KummerCoeff F n) :
    (muNRep n F).ρ g x = absoluteGaloisGroupComparison F g • x :=
  rfl

/-- The dictionary between Tau Ceti's Kummer coefficient and `muNRep`: the identity, because
`muNRep n F` is built on `TauCeti.KummerCoeff F n`. -/
noncomputable def muNRepCoeffDictionary (n : ℕ) (F : Type) [Field F] :
    TauCeti.KummerCoeff F n ≃+ (muNRep n F).V :=
  AddEquiv.refl _

theorem muNRepCoeffDictionary_continuous (n : ℕ) (F : Type) [Field F] :
    Continuous (muNRepCoeffDictionary n F) :=
  continuous_of_discreteTopology

theorem muNRepCoeffDictionary_equivariant (n : ℕ) (F : Type) [Field F]
    (g : Field.absoluteGaloisGroup F) (x : TauCeti.KummerCoeff F n) :
    muNRepCoeffDictionary n F (absoluteGaloisGroupComparison F g • x)
      = (muNRep n F).ρ g (muNRepCoeffDictionary n F x) :=
  rfl

/-! #### The coordinate of a primitive root

A primitive `n`-th root of unity `ζ ∈ F` fixes a coordinate `μ_n(Fˢ) ≃ ℤ/n`, `ζ ↦ 1`, and, lying in
`F`, it makes the Galois action on `μ_n(Fˢ)` trivial. Both are what `kummerCupPairing ζ` and the
chosen-root comparison `tateDualityPairing_muNRepToTateDual` below are built from. -/

/-- The primitive root `ζ ∈ F`, as a unit of the separable closure. -/
theorem isPrimitiveRoot_units_map {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) :
    IsPrimitiveRoot
      ((hζ.map_of_injective (algebraMap F (SeparableClosure F)).injective).toRootsOfUnity :
        (SeparableClosure F)ˣ) n :=
  IsPrimitiveRoot.coe_units_iff.mp (by
    rw [IsPrimitiveRoot.val_toRootsOfUnity_coe]
    exact hζ.map_of_injective (algebraMap F (SeparableClosure F)).injective)

/-- The image of a primitive `n`-th root of unity `ζ ∈ F` in `μ_n(Fˢ)`. -/
noncomputable def muNRepGenerator {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) : (muNRep n F).V :=
  (Additive.ofMul
    (hζ.map_of_injective (algebraMap F (SeparableClosure F)).injective).toRootsOfUnity :
      TauCeti.KummerCoeff F n)

/-- **The coordinate of `μ_n(Fˢ)` selected by a primitive root** `ζ ∈ F`: `ζ^k ↦ k`. It is
Mathlib's `IsPrimitiveRoot.zmodEquivZPowers` at the image of `ζ` in `Fˢ`, whose powers are all of
`μ_n(Fˢ)` (`IsPrimitiveRoot.zpowers_eq`). -/
noncomputable def muNRepEquivZMod {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) : (muNRep n F).V ≃+ ZMod n :=
  ((isPrimitiveRoot_units_map ζ hζ).zmodEquivZPowers.trans
    (MulEquiv.subgroupCongr (isPrimitiveRoot_units_map ζ hζ).zpowers_eq).toAdditive).symm

/-- The coordinate of the generator is `1`. -/
theorem muNRepEquivZMod_generator {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) : muNRepEquivZMod ζ hζ (muNRepGenerator ζ hζ) = 1 :=
  sorry

/-- **`G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F`**: the `n`-th roots of unity of `Fˢ` are the
powers of `ζ` (`IsPrimitiveRoot.zpowers_eq`), and `G_F` fixes `ζ ∈ F`. This is what makes
`kummerCupPairing ζ` equivariant and the chosen-root map `muNRepToTateDual ζ` a morphism. -/
theorem muNRep_ρ_eq_self {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (g : Field.absoluteGaloisGroup F) (x : (muNRep n F).V) :
    (muNRep n F).ρ g x = x :=
  sorry

/-! #### The explicit degree-one model over `ZMod n`

Tau Ceti identifies the explicit `H¹ = Z¹/B¹` of a discrete module with Mathlib's continuous
cohomology of its image under `TauCeti.ofDiscreteModule ℤ`
(`TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology`, through
`TauCeti.ContCohomology.cocycleEquiv1`). The Kummer class of Tau Ceti lives in that explicit
model. The two declarations below are the same comparison for an object of `GalRep n F`, whose
continuous cohomology is taken over `ZMod n`: the homogeneous cochains of `A` over `ZMod n` and of
`A.V` over `ℤ` have the same underlying groups and differentials, and the implementation
generalizes those two Tau Ceti declarations from `ℤ` to an arbitrary coefficient ring rather than
building a second comparison. -/

section ExplicitComparison

attribute [local instance] TopRep.distribMulAction

variable {n : ℕ} {F : Type} [Field F]

/-- **The inhomogeneous form of a canonical `1`-cocycle** of `A` over `ZMod n`: `g ↦ c(1, g)`
(`inhomogeneousCocycle1_apply`). This is the inverse of Tau Ceti's `cocycleEquiv1` over `ZMod n`. -/
noncomputable def inhomogeneousCocycle1 (A : GalRep n F) [DiscreteTopology A.V]
    [ContinuousSMul (Field.absoluteGaloisGroup F) A.V] :
    ContinuousCohomology.cocycles A 1 →+
      TauCeti.ContCohomology.Z1 (Field.absoluteGaloisGroup F) A.V :=
  sorry

/-- The defining equation of `inhomogeneousCocycle1`: evaluation of the homogeneous cocycle at
`(1, g)`. -/
theorem inhomogeneousCocycle1_apply (A : GalRep n F) [DiscreteTopology A.V]
    [ContinuousSMul (Field.absoluteGaloisGroup F) A.V] (c : ContinuousCohomology.cocycles A 1)
    (g : Field.absoluteGaloisGroup F) :
    (inhomogeneousCocycle1 A c : Field.absoluteGaloisGroup F → A.V) g =
      ((TopRep.homogeneousCochains A).iCycles 1 c).val 1 g :=
  sorry

/-- **The explicit degree-one model of `H¹(G_F, A)` over `ZMod n`**: Tau Ceti's
`explicitH1AddEquivContinuousCohomology` for the coefficient ring `ZMod n`. It is pinned by
`explicitH1AddEquivH_symm_homologyπ`. -/
noncomputable def explicitH1AddEquivH (A : GalRep n F) [DiscreteTopology A.V]
    [ContinuousSMul (Field.absoluteGaloisGroup F) A.V] :
    TauCeti.ContCohomology.H1 (Field.absoluteGaloisGroup F) A.V ≃+ H n F 1 A :=
  sorry

/-- The characterizing equation of `explicitH1AddEquivH`: the explicit class of a canonical class
`[c]` is the class of the inhomogeneous cocycle `g ↦ c(1, g)`. Every canonical class is some `[c]`,
so this determines the comparison. -/
theorem explicitH1AddEquivH_symm_homologyπ (A : GalRep n F) [DiscreteTopology A.V]
    [ContinuousSMul (Field.absoluteGaloisGroup F) A.V] (c : ContinuousCohomology.cocycles A 1) :
    (explicitH1AddEquivH A).symm ((TopRep.homogeneousCochains A).homologyπ 1 c) =
      (inhomogeneousCocycle1 A c : TauCeti.ContCohomology.H1 (Field.absoluteGaloisGroup F) A.V) :=
  sorry

end ExplicitComparison

/-! #### The Kummer class -/

section KummerClass

attribute [local instance] TopRep.distribMulAction

/-- The Galois action on `μ_n(Fˢ)` is continuous. -/
instance muNRep_continuousSMul (n : ℕ) (F : Type) [Field F] :
    ContinuousSMul (Field.absoluteGaloisGroup F) (muNRep n F).V :=
  (isSmoothDiscrete_muNRep n F).continuousSMul

/-- Tau Ceti's Kummer class pulled back to `G_F`: the explicit class of Tau Ceti's `kummerMap`,
transported along the compatible pair `(absoluteGaloisGroupComparison, muNRepCoeffDictionary)` by
Tau Ceti's `explicitMap1`. -/
noncomputable def explicitKummerClass (n : ℕ) (F : Type) [Field F] (hn : IsUnit (n : F)) :
    Additive Fˣ →+ TauCeti.ContCohomology.H1 (Field.absoluteGaloisGroup F) (muNRep n F).V :=
  (TauCeti.ContCohomology.explicitMap1 (TauCeti.AbsoluteGaloisGroup F)
      (TauCeti.KummerCoeff F n) (Field.absoluteGaloisGroup F) (muNRep n F).V
      (absoluteGaloisGroupComparison F :
        Field.absoluteGaloisGroup F →ₜ* TauCeti.AbsoluteGaloisGroup F)
      (muNRepCoeffDictionary n F).toAddMonoidHom continuous_of_discreteTopology
      fun g x => (muNRep_ρ_apply n F g x).symm).comp
    (AddMonoidHom.toMultiplicativeRight.symm (TauCeti.kummerMap F n hn))

/-- The Kummer class as an additive map, `0` when `n` is not invertible in `F`. -/
noncomputable def kummerClassHom (n : ℕ) (F : Type) [Field F] :
    Additive Fˣ →+ H n F 1 (muNRep n F) := by
  classical
  exact if hn : IsUnit (n : F) then
    (explicitH1AddEquivH (muNRep n F)).toAddMonoidHom.comp (explicitKummerClass n F hn)
  else 0

/-- **The Kummer class of `a ∈ Fˣ` in `H¹(G_F, μ_n)`**: Tau Ceti's Kummer class
(`TauCeti.kummerMap`, the degree-zero connecting map of the Kummer sequence) transported to `G_F`
(`explicitKummerClass`) and to Mathlib's continuous cohomology over `ZMod n`
(`explicitH1AddEquivH`). Where `n` is not invertible in `F` there is no Kummer sequence and the
value is `0` (`kummerClass_of_not_isUnit`); every theorem below that uses it carries a hypothesis
making `n` invertible. -/
noncomputable def kummerClass (n : ℕ) (F : Type) [Field F] (a : Fˣ) : H n F 1 (muNRep n F) :=
  kummerClassHom n F (Additive.ofMul a)

/-- The Kummer class is additive. -/
theorem kummerClass_mul (n : ℕ) (F : Type) [Field F] (a b : Fˣ) :
    kummerClass n F (a * b) = kummerClass n F a + kummerClass n F b :=
  map_add (kummerClassHom n F) (Additive.ofMul a) (Additive.ofMul b)

/-- **The defining equation of `kummerClass`** for `n` invertible in `F`. -/
theorem kummerClass_eq {n : ℕ} {F : Type} [Field F] (hn : IsUnit (n : F)) (a : Fˣ) :
    kummerClass n F a =
      explicitH1AddEquivH (muNRep n F) (explicitKummerClass n F hn (Additive.ofMul a)) := by
  simp only [kummerClass, kummerClassHom, hn, dite_true, AddMonoidHom.coe_comp, Function.comp_apply,
    AddEquiv.coe_toAddMonoidHom]

/-- The value where `n` is not invertible. -/
theorem kummerClass_of_not_isUnit {n : ℕ} {F : Type} [Field F] (hn : ¬ IsUnit (n : F)) (a : Fˣ) :
    kummerClass n F a = 0 := by
  simp only [kummerClass, kummerClassHom, hn, dite_false, AddMonoidHom.zero_apply]

/-- **The Kummer class on cocycles**: for an `n`-th root `α ∈ Fˢ` of `a`, the class of `a` is the
class of the Kummer cocycle `g ↦ g α / α` (Tau Ceti's `kummerMap_eq_kummerCocycleClass`),
transported. A closed proof. -/
theorem kummerClass_eq_kummerCocycleClass {n : ℕ} {F : Type} [Field F] (hn : IsUnit (n : F))
    {a : Fˣ} {α : (SeparableClosure F)ˣ}
    (hα : α ^ n = Units.map (algebraMap F (SeparableClosure F)).toMonoidHom a) :
    kummerClass n F a = explicitH1AddEquivH (muNRep n F)
      (TauCeti.ContCohomology.explicitMap1 (TauCeti.AbsoluteGaloisGroup F)
        (TauCeti.KummerCoeff F n) (Field.absoluteGaloisGroup F) (muNRep n F).V
        (absoluteGaloisGroupComparison F :
          Field.absoluteGaloisGroup F →ₜ* TauCeti.AbsoluteGaloisGroup F)
        (muNRepCoeffDictionary n F).toAddMonoidHom continuous_of_discreteTopology
        (fun g x => (muNRep_ρ_apply n F g x).symm) (TauCeti.kummerCocycleClass hα)) := by
  rw [kummerClass_eq hn, ← TauCeti.kummerMap_eq_kummerCocycleClass hn hα]
  rfl

end KummerClass

/-- Kummer equivalence when the exponent is invertible in the valuation ring. It is the Kummer class
on power classes (`kummerEquiv_unit_mk`). -/
noncomputable def kummerEquiv_unit (n : ℕ) (_hn : n ≠ 0)
    (_hn' : IsUnit (n : ↥𝒪[K])) :
    Additive (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range) ≃+ H n K 1 (muNRep n K) :=
  sorry

/-- `kummerEquiv_unit` sends the power class of `a` to the Kummer class of `a`. -/
theorem kummerEquiv_unit_mk (n : ℕ) (hn : n ≠ 0) (hn' : IsUnit (n : ↥𝒪[K])) (a : Kˣ) :
    kummerEquiv_unit K n hn hn' (Additive.ofMul (QuotientGroup.mk a)) = kummerClass n K a :=
  sorry

/-- Mixed-characteristic Kummer equivalence, including `n = p`. It is the Kummer class on power
classes (`kummerEquiv_mixed_mk`). -/
noncomputable def kummerEquiv_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) :
    Additive (Fˣ ⧸ (powMonoidHom n : Fˣ →* Fˣ).range) ≃+ H n F 1 (muNRep n F) :=
  sorry

/-- `kummerEquiv_mixed` sends the power class of `a` to the Kummer class of `a`. -/
theorem kummerEquiv_mixed_mk (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (hn : n ≠ 0) (a : Fˣ) :
    kummerEquiv_mixed p F n hn (Additive.ofMul (QuotientGroup.mk a)) = kummerClass n F a :=
  sorry

section UnitsCoefficients

attribute [local instance] comparisonDistribMulAction

/-- Scalar multiplication by `ℤ` on the discrete `(Fˢ)ˣ` is continuous. -/
theorem unitsCoeff_continuousSMul_int (F : Type) [Field F] :
    ContinuousSMul ℤ (TauCeti.UnitsCoeff F) :=
  ⟨continuous_of_discreteTopology⟩

attribute [local instance] unitsCoeff_continuousSMul_int

/-- **Multiplicative separable-closure coefficients `(Fˢ)ˣ`**, written additively: the coefficients
of the local Brauer group. It is Tau Ceti's `UnitsCoeff F` through Tau Ceti's dictionary
`TauCeti.ofDiscreteModule ℤ`, with `G_F` acting through `absoluteGaloisGroupComparison`
(`unitsRep_ρ_apply`). -/
noncomputable def unitsRep (F : Type) [Field F] :
    ProfiniteCohomology.TopRep ℤ (Field.absoluteGaloisGroup F) :=
  TauCeti.ofDiscreteModule ℤ (Field.absoluteGaloisGroup F) (TauCeti.UnitsCoeff F)

end UnitsCoefficients

/-- **The action on `(Fˢ)ˣ`**: `G_F` acts through `absoluteGaloisGroupComparison`. -/
theorem unitsRep_ρ_apply (F : Type) [Field F] (g : Field.absoluteGaloisGroup F)
    (x : TauCeti.UnitsCoeff F) :
    (unitsRep F).ρ g x = absoluteGaloisGroupComparison F g • x :=
  rfl

/-- Local Brauer group on the imported continuous-cohomology carrier. -/
noncomputable abbrev Br (F : Type) [Field F] : Type _ :=
  continuousCohomology 2 (unitsRep F)

/-! ### The local units and the local `H²` bound

These precede `invMap`: the invariant is extended from the unramified layers to all of `Br K`
through the bound `natCard_h2_units_le_finrank`, and nothing here uses a class formation or an Artin
map.

The normal basis theorem is Mathlib's, for a finite Galois extension of arbitrary fields:
`IsGalois.normalBasis F E : Module.Basis Gal(E/F) F E` is a basis whose value at `σ` is `σ θ` for
`θ = IsGalois.normalBasis F E 1` (`IsGalois.normalBasis_apply`). The local-unit step below and the
lattice step of the Euler characteristic start from that basis; it is not restated. -/

/-- Mathlib's normal basis is the orbit of its value at the identity. -/
example (F E : Type*) [Field F] [Field E] [Algebra F E] [FiniteDimensional F E] [IsGalois F E]
    (σ : Gal(E/F)) : IsGalois.normalBasis F E σ = σ (IsGalois.normalBasis F E 1) :=
  IsGalois.normalBasis_apply σ

/-- **The local units of a finite layer** `𝒪[L]ˣ`, written additively, as a representation of
`Gal(L/K)`: the Galois action preserves `𝒪[L]` (Tau Ceti's `integerRingIsInvariantSubring`). -/
noncomputable def unitsFiniteLayerRep [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    Rep ℤ (L ≃ₐ[K] L) :=
  letI := Units.mulDistribMulActionRight (M := L ≃ₐ[K] L) (N := 𝒪[L])
  Rep.ofMulDistribMulAction (L ≃ₐ[K] L) 𝒪[L]ˣ

/-- **The Herbrand quotient of the local units of a cyclic layer is `1`.** Let `θ` be Mathlib's
normal basis element `IsGalois.normalBasis K L 1`, multiplied by a power of a uniformizer of `K` so
that it lies in `𝒪[L]`; its conjugates are still a `K`-basis (`IsGalois.normalBasis_apply`), since
`σ (c θ) = c σ θ` for `c ∈ Kˣ`. It spans an open lattice `M = ∑_σ 𝒪[K] σθ`, free over
`𝒪[K][Gal(L/K)]`; for `N` large `A = πᴺ M` satisfies `A · A ⊆ π A`, so `1 + A` is an open
Galois-stable subgroup of `𝒪[L]ˣ` whose filtration `1 + πⁱ A` has successive quotients `A/πA`, free
over `𝓀[K][Gal(L/K)]`; it is therefore cohomologically trivial, of finite index, and
`TauCeti.TateCohomology.herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel` gives the value.
`𝒪[L]` itself need not be free over `𝒪[K][Gal(L/K)]`; that holds only in the tame case. -/
theorem herbrandQuotient_units_eq_one [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)] :
    TauCeti.TateCohomology.herbrandQuotient (unitsFiniteLayerRep K L) = 1 :=
  sorry

/-- For a cyclic layer the Herbrand quotient of `Lˣ` is `[L:K]`: multiplicativity along
`0 → 𝒪[L]ˣ → Lˣ → ℤ → 0` (the normalized valuation;
`TauCeti.TateCohomology.herbrandQuotient_eq_mul_of_shortExact`), `herbrandQuotient_units_eq_one`,
and `TauCeti.TateCohomology.herbrandQuotient_trivial_int_eq_card`. -/
theorem herbrandQuotient_units_eq_finrank_of_isCyclic [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)] :
    TauCeti.TateCohomology.herbrandQuotient (Rep.ofAlgebraAutOnUnits K L) = Module.finrank K L :=
  sorry

/-- **The cyclic norm index** `[Kˣ : N_{L/K}(Lˣ)] = [L:K]` for cyclic `L/K`: `Ĥ⁰(Gal(L/K), Lˣ)` is
the norm quotient, and `Ĥ⁻¹(Gal(L/K), Lˣ) ≅ H¹(Gal(L/K), Lˣ)` vanishes by Hilbert 90
(`groupCohomology.H1ofAutOnUnitsUnique`) and two-periodicity, so the Herbrand quotient of
`herbrandQuotient_units_eq_finrank_of_isCyclic` is the index. ⚠ This is a Herbrand-quotient
computation, not the norm-index theorem `index_localNormSubgroup` of Layer 8, which is
reciprocity. -/
theorem index_normGroup_of_isCyclic [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)] :
    (LocalFieldsRamification.normGroup K L).index = Module.finrank K L :=
  sorry

/-- **The local `H²` bound** `#H²(Gal(L/K), Lˣ) ≤ [L:K]`. For cyclic `L/K`, two-periodicity
identifies `H²` with `Ĥ⁰`, which has `[L:K]` elements by `index_normGroup_of_isCyclic`; in general
`Gal(L/K)` is solvable (Tau Ceti's `TauCeti.LocalFieldsRamification.isSolvable_algEquiv`, which
landed after this repository's Tau Ceti pin) and the bound propagates along a normal subgroup with
cyclic quotient through inflation–restriction in degree two, exact because `H¹` vanishes by
Hilbert 90. Equality is the class-formation axiom and belongs to Layer 6. -/
theorem natCard_h2_units_le_finrank [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] :
    Nat.card (groupCohomology (Rep.ofAlgebraAutOnUnits K L) 2) ≤ Module.finrank K L :=
  sorry

/-- Local invariant, normalized by arithmetic Frobenius. It is first constructed on the unramified
relative Brauer groups; by `natCard_h2_units_le_finrank` the unramified relative Brauer group of
degree `[L:K]`, which lies in the kernel of restriction to `L`, is all of the relative Brauer group
of `L/K`, so `Br K` is the union of the unramified relative Brauer groups. The local-field
structure is bound in the header: `Br ℂ = 0`, so no such isomorphism exists for an arbitrary
field. -/
noncomputable def invMap (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Br K ≃+ RatModInt :=
  sorry

noncomputable def brRes [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : Br K →+ Br L :=
  sorry

noncomputable def brCor [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : Br L →+ Br K :=
  sorry

theorem invMap_brRes [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) (a : Br K) :
    invMap L (brRes K L iota a) = Module.finrank K L • invMap K a :=
  sorry

theorem invMap_brCor [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) (b : Br L) :
    invMap K (brCor K L iota b) = invMap L b :=
  sorry

/-- Trace isomorphism away from the residue characteristic. -/
theorem h2MuEquivZMod_unit (n : ℕ) (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) :
    Nonempty (H n K 2 (muNRep n K) ≃+ ZMod n) :=
  sorry

/-- The mixed-characteristic invariant on `H²(F,μ_n)`. -/
theorem h2MuEquivZMod_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) :
    Nonempty (H n F 2 (muNRep n F) ≃+ ZMod n) :=
  sorry

/-- The invariant transported to a coefficient object identified with `μ_p`. -/
theorem h2FpEquivZMod_of_mu (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (ζ : F) (_hζ : IsPrimitiveRoot ζ p) (T : GalRep p F)
    (_hT : Nonempty (muNRep p F ≅ T)) :
    Nonempty (H p F 2 T ≃+ ZMod p) :=
  sorry

/-! ### The cohomological Hilbert symbol -/

/-- **The coefficient pairing `μ_n × μ_n → μ_n` selected by a primitive root** `ζ ∈ F`:
`(x, y) ↦ log_ζ(x) · y`, where `log_ζ = muNRepEquivZMod ζ` is the coordinate `ζ^k ↦ k`
(`kummerCupPairing_bil`). It is symmetric (`kummerCupPairing_bil_comm`), and it is equivariant
because `G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F` (`muNRep_ρ_eq_self`). At `n = 0` it is `0`;
every theorem below that uses it has `n ≠ 0`. -/
noncomputable def kummerCupPairing {n : ℕ} {F : Type} [Field F]
    (ζ : F) (hζ : IsPrimitiveRoot ζ n) :
    ProfiniteCohomology.TopPairing (muNRep n F) (muNRep n F) (muNRep n F) where
  bil := if h : n = 0 then 0 else
    haveI : NeZero n := ⟨h⟩
    (LinearMap.lsmul (ZMod n) (muNRep n F).V).comp
      ((muNRepEquivZMod ζ hζ).toAddMonoidHom.toZModLinearMap n)
  cont := continuous_of_discreteTopology
  equivariant g x y := by
    by_cases h : n = 0
    · subst h
      simp
    · have : NeZero n := ⟨h⟩
      rw [muNRep_ρ_eq_self ζ hζ g x, muNRep_ρ_eq_self ζ hζ g y, muNRep_ρ_eq_self ζ hζ g]

/-- **The Kummer cup pairing is `(x, y) ↦ log_ζ(x) · y`.** -/
theorem kummerCupPairing_bil {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (x y : (muNRep n F).V) :
    (kummerCupPairing ζ hζ).bil x y = muNRepEquivZMod ζ hζ x • y := by
  simp only [kummerCupPairing, NeZero.ne n, dite_false]
  rfl

/-- **The Kummer cup pairing is symmetric**: `log_ζ(x) · y = log_ζ(y) · x`, both being
`ζ^{log_ζ(x) log_ζ(y)}`. This is the symmetry the antisymmetry of `localSymbol` uses. -/
theorem kummerCupPairing_bil_comm {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (x y : (muNRep n F).V) :
    (kummerCupPairing ζ hζ).bil x y = (kummerCupPairing ζ hζ).bil y x :=
  sorry

/-- The local cohomological symbol: cup followed by the invariant. -/
noncomputable def localSymbol {n : ℕ} {F : Type} [Field F]
    (P : ProfiniteCohomology.TopPairing (muNRep n F) (muNRep n F) (muNRep n F))
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (x y : H n F 1 (muNRep n F)) : ZMod n :=
  tr (ProfiniteCohomology.degreeCast (by norm_num) (muNRep n F)
    (ProfiniteCohomology.cup P 1 1 x y))

omit [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
/-- Bilinearity after transporting multiplicative Kummer classes: `kummerClass` is additive
(`kummerClass_mul`) and the cup product is additive in its first argument
(`ProfiniteCohomology.cup_add_left`). A closed proof. -/
theorem localSymbol_kummerClass_mul {n : ℕ}
    (P : ProfiniteCohomology.TopPairing (muNRep n K) (muNRep n K) (muNRep n K))
    (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a a' b : Kˣ) :
    localSymbol P tr (kummerClass n K (a * a')) (kummerClass n K b)
      = localSymbol P tr (kummerClass n K a) (kummerClass n K b)
        + localSymbol P tr (kummerClass n K a') (kummerClass n K b) := by
  have h := ProfiniteCohomology.cup_add_left P 1 1 (kummerClass n K a) (kummerClass n K a')
    (kummerClass n K b)
  simp only [localSymbol, kummerClass_mul]
  exact (congrArg (fun z => tr (ProfiniteCohomology.degreeCast (by norm_num) (muNRep n K) z))
    h).trans (map_add tr _ _)

/-- Steinberg relation at the named arithmetic coefficient pairing. -/
theorem localSymbol_kummerClass_steinberg {n : ℕ} (zeta : K)
    (hzeta : IsPrimitiveRoot zeta n) (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a b : Kˣ)
    (_hab : (a : K) + (b : K) = 1) :
    localSymbol (kummerCupPairing zeta hzeta) tr (kummerClass n K a) (kummerClass n K b) = 0 :=
  sorry

/-- **Antisymmetry of the Hilbert pairing**, from the graded commutativity of the cup product
(`ProfiniteCohomology.cup_gradedComm`) and the symmetry of `kummerCupPairing ζ`. The coordinate
`tr` is arbitrary. -/
theorem localSymbol_antisymm {n : ℕ} (ζ : K) (hζ : IsPrimitiveRoot ζ n)
    (tr : H n K 2 (muNRep n K) ≃+ ZMod n) (x y : H n K 1 (muNRep n K)) :
    localSymbol (kummerCupPairing ζ hζ) tr x y = -localSymbol (kummerCupPairing ζ hζ) tr y x :=
  sorry

/-- **The symbol–norm criterion**, for `μ_n ⊆ K`: `(a, b) = 0` exactly when `a` is a norm from
`L = K(b^{1/n})`, stated about that extension exactly (`s ^ n = b` and `s` generates `L`). The cup
of two Kummer classes is the class of the cyclic algebra: on `Gal(L/K)`, cup with the connecting
class of the Kummer character is two-periodicity (`Rep.FiniteCyclicGroup.periodicIso`), and
inflation into `Br K` is injective by Hilbert 90. It uses no reciprocity. -/
theorem localSymbol_eq_zero_iff_mem_normGroup {n : ℕ} (_hn : n ≠ 0) (ζ : K)
    (hζ : IsPrimitiveRoot ζ n) (tr : H n K 2 (muNRep n K) ≃+ ZMod n) (a b : Kˣ)
    [Algebra K L] [Module.Finite K L] (s : L) (_hs : s ^ n = algebraMap K L b)
    (_hgen : IntermediateField.adjoin K ({s} : Set L) = ⊤) :
    localSymbol (kummerCupPairing ζ hζ) tr (kummerClass n K a) (kummerClass n K b) = 0 ↔
      a ∈ LocalFieldsRamification.normGroup K L :=
  sorry

/-- **Nondegeneracy of the Hilbert pairing**, for `μ_n ⊆ K`: `a` pairs to zero with every `b`
exactly when `a` is an `n`-th power. If it does, then by `localSymbol_antisymm` every `b` pairs to
zero with `a`, so by `localSymbol_eq_zero_iff_mem_normGroup` every `b` is a norm from
`K(a^{1/n})`, a cyclic extension, which is therefore trivial by `index_normGroup_of_isCyclic`; so
`a` is an `n`-th power by Kummer theory. Both sides of the pairing being the finite group
`Kˣ/(Kˣ)ⁿ`, the Hilbert pairing is perfect. -/
theorem localSymbol_kummerClass_eq_zero_iff {n : ℕ} (_hn : n ≠ 0) (ζ : K)
    (hζ : IsPrimitiveRoot ζ n) (tr : H n K 2 (muNRep n K) ≃+ ZMod n) (a : Kˣ) :
    (∀ b : Kˣ,
        localSymbol (kummerCupPairing ζ hζ) tr (kummerClass n K a) (kummerClass n K b) = 0) ↔
      a ∈ (powMonoidHom n : Kˣ →* Kˣ).range :=
  sorry

/-! ### The Tate dual and the evaluation pairing

The Tate dual `A' = Hom(A, μ_n)` is Tau Ceti's internal hom `TauCeti.InternalHom G_F A μ_n` — the
additive maps `A → μ_n` with the conjugation action `TauCeti.homAction`,
`(g · φ)(a) = g · φ(g⁻¹ · a)`, and the discrete topology — read as an object of `GalRep n F`
through Tau Ceti's dictionary `TauCeti.ofDiscreteModule`; the evaluation pairing is Tau Ceti's
`InternalHom.evalPairing`. Neither is built a second time. The declarations below pin the carrier
(`tateDualEquiv`), the action (`tateDualEquiv_ρ_apply`), the pairing
(`tateEvaluationPairing_bil`), the finite and discrete instances and smoothness
(`isSmoothDiscrete_tateDual`), the invariants (`tateDual_ρ_eq_self_iff`), contravariance in `A`
(`tateDualMap`) with its compatibility with evaluation (`tateEvaluationPairing_tateDualMap`) and
exactness (`tateDualMap_exact`), and the identification of `Hom(μ_n, μ_n)` after a primitive root is
chosen (`muNRepToTateDual`). -/

section TateDual

attribute [local instance] TopRep.distribMulAction

variable {n : ℕ} {F : Type} [Field F]

/-- `Hom(A, μ_n)` is killed by `n`, because `μ_n` is. -/
theorem nsmul_internalHom_eq_zero (A : GalRep n F)
    (φ : TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V) : n • φ = 0 := by
  apply TauCeti.InternalHom.ext
  rw [TauCeti.InternalHom.toAddMonoidHom_nsmul, TauCeti.InternalHom.toAddMonoidHom_zero]
  ext a
  exact nsmul_kummerCoeff_eq_zero F n (φ.toAddMonoidHom a)

/-- The `ZMod n`-module structure of `Hom(A, μ_n)`, from `nsmul_internalHom_eq_zero`. -/
@[instance_reducible]
noncomputable def internalHomModule (A : GalRep n F) :
    Module (ZMod n) (TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V) :=
  AddCommGroup.zmodModule (nsmul_internalHom_eq_zero A)

attribute [local instance] internalHomModule

/-- The conjugation action on `Hom(A, μ_n)` commutes with the `ZMod n`-scalars
(`ZMod.map_smul`). -/
theorem internalHom_smulCommClass (A : GalRep n F) :
    SMulCommClass (Field.absoluteGaloisGroup F) (ZMod n)
      (TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V) :=
  ⟨fun g c φ => ZMod.map_smul (DistribSMul.toAddMonoidHom
    (TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V) g) c φ⟩

/-- Scalar multiplication by `ZMod n` on the discrete `Hom(A, μ_n)` is continuous. -/
theorem internalHom_continuousSMul (A : GalRep n F) :
    ContinuousSMul (ZMod n)
      (TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V) :=
  ⟨continuous_of_discreteTopology⟩

attribute [local instance] internalHom_smulCommClass internalHom_continuousSMul

/-- **The Tate dual** `A' = Hom(A, μ_n)`: Tau Ceti's internal hom
`TauCeti.InternalHom G_F A μ_n`, with its conjugation action `TauCeti.homAction`, as an object of
`GalRep n F` through Tau Ceti's dictionary `TauCeti.ofDiscreteModule`. Its carrier is
`Hom(A, μ_n)` (`tateDualEquiv`), its action is `(g · φ)(a) = g · φ(g⁻¹ · a)`
(`tateDualEquiv_ρ_apply`), and it is discrete, finite for finite `A`, and smooth for finite smooth
discrete `A` (`isSmoothDiscrete_tateDual`). Every duality theorem below takes `A` finite, discrete
and smooth, the setting in which `Hom(A, μ_n)` is the dual in the category of discrete
`G_F`-modules. -/
noncomputable def tateDual (A : GalRep n F) : GalRep n F :=
  TauCeti.ofDiscreteModule (ZMod n) (Field.absoluteGaloisGroup F)
    (TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V)

/-- The Tate dual carries the discrete topology. -/
instance instDiscreteTopologyTateDual (A : GalRep n F) : DiscreteTopology (tateDual A).V :=
  inferInstanceAs (DiscreteTopology
    (TauCeti.InternalHom (Field.absoluteGaloisGroup F) A.V (muNRep n F).V))

/-- **The carrier of the Tate dual is `Hom(A, μ_n)`**: Tau Ceti's `InternalHom.evalPairing`, which
forgets the action, with inverse `InternalHom.of`. -/
noncomputable def tateDualEquiv (A : GalRep n F) : (tateDual A).V ≃+ (A.V →+ (muNRep n F).V) where
  toFun φ := TauCeti.InternalHom.evalPairing (Field.absoluteGaloisGroup F) φ
  invFun f := TauCeti.InternalHom.of (Field.absoluteGaloisGroup F) f
  left_inv _ := rfl
  right_inv _ := rfl
  map_add' := map_add (TauCeti.InternalHom.evalPairing (Field.absoluteGaloisGroup F))

/-- **The action on the Tate dual is conjugation**, `(g · φ)(a) = g · φ(g⁻¹ · a)`: Tau Ceti's
`homAction_apply` on the carrier of `ofDiscreteModule`. -/
theorem tateDualEquiv_ρ_apply (A : GalRep n F) (g : Field.absoluteGaloisGroup F)
    (φ : (tateDual A).V) (a : A.V) :
    tateDualEquiv A ((tateDual A).ρ g φ) a =
      (muNRep n F).ρ g (tateDualEquiv A φ (A.ρ g⁻¹ a)) :=
  rfl

/-- `Hom(A, μ_n)` is finite when `A` is and `n ≠ 0`. -/
instance instFiniteTateDual [NeZero n] (A : GalRep n F) [Finite A.V] : Finite (tateDual A).V :=
  Finite.of_injective (fun φ : (tateDual A).V => ⇑(tateDualEquiv A φ))
    (fun _ _ h => (tateDualEquiv A).injective (DFunLike.coe_injective h))

/-- **The Tate dual of a finite smooth discrete module is smooth discrete**: Tau Ceti's
`ofDiscreteModule_isSmoothDiscrete`, the conjugation action on `InternalHom` being continuous for a
finite discrete source (Tau Ceti's `ContinuousSMul` instance on `InternalHom`). -/
theorem isSmoothDiscrete_tateDual (A : GalRep n F) [DiscreteTopology A.V] [Finite A.V]
    (hA : TauCeti.IsSmoothDiscrete (ZMod n) A) :
    TauCeti.IsSmoothDiscrete (ZMod n) (tateDual A) := by
  have := hA.continuousSMul
  exact TauCeti.ofDiscreteModule_isSmoothDiscrete (ZMod n) (Field.absoluteGaloisGroup F) _

/-- The Tate dual of a finite smooth discrete module is smooth, as an instance argument
(`isSmoothDiscrete_tateDual`). -/
instance instFactIsSmoothDiscreteTateDual (A : GalRep n F) [DiscreteTopology A.V] [Finite A.V]
    [hA : Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)] :
    Fact (TauCeti.IsSmoothDiscrete (ZMod n) (tateDual A)) :=
  ⟨isSmoothDiscrete_tateDual A hA.out⟩

/-- **The invariants of the Tate dual are the equivariant maps**: `g` fixes `φ` exactly when `φ`
commutes with `g`, so `H⁰(G_F, Hom(A, μ_n)) = Hom_{G_F}(A, μ_n)`. Tau Ceti's
`InternalHom.smul_eq_self_iff`. -/
theorem tateDual_ρ_eq_self_iff (A : GalRep n F) (g : Field.absoluteGaloisGroup F)
    (φ : (tateDual A).V) :
    (tateDual A).ρ g φ = φ ↔
      ∀ a : A.V, tateDualEquiv A φ (A.ρ g a) = (muNRep n F).ρ g (tateDualEquiv A φ a) :=
  TauCeti.InternalHom.smul_eq_self_iff

/-- **The evaluation pairing** `Hom(A, μ_n) × A → μ_n`, `(φ, a) ↦ φ a`: Tau Ceti's
`InternalHom.evalPairing`, read `ZMod n`-bilinearly (`tateEvaluationPairing_bil`). Its
equivariance is Tau Ceti's `InternalHom.evalPairing_equivariant`, and it is continuous because both
factors are discrete. This is the coefficient pairing of local Tate duality; a statement quantified
over an arbitrary pairing would admit the zero pairing. -/
noncomputable def tateEvaluationPairing (A : GalRep n F) [DiscreteTopology A.V] :
    ProfiniteCohomology.TopPairing (tateDual A) A (muNRep n F) where
  bil := AddMonoidHom.toZModLinearMap n
    { toFun := fun φ => AddMonoidHom.toZModLinearMap n (tateDualEquiv A φ)
      map_zero' := by ext; simp
      map_add' := fun φ ψ => by ext; simp }
  cont := continuous_of_discreteTopology
  equivariant g φ a := by
    change tateDualEquiv A ((tateDual A).ρ g φ) (A.ρ g a) =
      (muNRep n F).ρ g (tateDualEquiv A φ a)
    rw [tateDualEquiv_ρ_apply]
    congr 2
    change (A.ρ g⁻¹ * A.ρ g) a = a
    rw [← map_mul, inv_mul_cancel, map_one]
    rfl

/-- **The evaluation pairing is evaluation.** -/
theorem tateEvaluationPairing_bil (A : GalRep n F) [DiscreteTopology A.V] (φ : (tateDual A).V)
    (a : A.V) : (tateEvaluationPairing A).bil φ a = tateDualEquiv A φ a :=
  rfl

/-- Precomposition with a morphism `f : A ⟶ B`, on carriers. -/
noncomputable def tateDualPrecomp {A B : GalRep n F} (f : A ⟶ B) :
    (B.V →+ (muNRep n F).V) →+ (A.V →+ (muNRep n F).V) where
  toFun ψ := ψ.comp (AddMonoidHom.mk' (fun a => f.hom a) fun a b => map_add f.hom a b)
  map_zero' := rfl
  map_add' _ _ := rfl

/-- **The Tate dual is contravariant**: a morphism `f : A ⟶ B` induces `B' ⟶ A'`, `ψ ↦ ψ ∘ f`
(`tateDualEquiv_tateDualMap_apply`), which is Tau Ceti's `ofDiscreteModuleMap` of the
precomposition. -/
noncomputable def tateDualMap {A B : GalRep n F} (f : A ⟶ B) : tateDual B ⟶ tateDual A :=
  TauCeti.ofDiscreteModuleMap
    (AddMonoidHom.toZModLinearMap n
      ((tateDualEquiv A).symm.toAddMonoidHom.comp
        ((tateDualPrecomp f).comp (tateDualEquiv B).toAddMonoidHom)))
    fun g ψ => by
      apply (tateDualEquiv A).injective
      ext a
      change (muNRep n F).ρ g (tateDualEquiv B ψ (B.ρ g⁻¹ (f.hom a))) =
        (muNRep n F).ρ g (tateDualEquiv B ψ (f.hom (A.ρ g⁻¹ a)))
      rw [TopRep.hom_comm_apply]

/-- `tateDualMap f` is precomposition with `f`. -/
theorem tateDualEquiv_tateDualMap_apply {A B : GalRep n F} (f : A ⟶ B) (ψ : (tateDual B).V)
    (a : A.V) : tateDualEquiv A ((tateDualMap f).hom ψ) a = tateDualEquiv B ψ (f.hom a) :=
  rfl

/-- **Naturality of the evaluation pairing in the coefficients**: `⟨f^* ψ, a⟩ = ⟨ψ, f a⟩`. This is
the compatibility hypothesis of `ProfiniteCohomology.cup_coeffMap` for the two evaluation pairings,
and it makes the evaluation pairings of a short exact sequence `0 → A₁ → A₂ → A₃ → 0` with its dual
`0 → A₃' → A₂' → A₁' → 0` a map of short exact sequences, as the connecting-map identities of
`ProfiniteCohomology` require. -/
theorem tateEvaluationPairing_tateDualMap {A B : GalRep n F} [DiscreteTopology A.V]
    [DiscreteTopology B.V] (f : A ⟶ B) (ψ : (tateDual B).V) (a : A.V) :
    (tateEvaluationPairing A).bil ((tateDualMap f).hom ψ) a =
      (tateEvaluationPairing B).bil ψ (f.hom a) :=
  rfl

/-- **The dual of a short exact sequence is short exact**: for `0 → A → B → C → 0` with `n`
invertible in `F`, `0 → C' → B' → A' → 0` is exact, because `μ_n(Fˢ) ≅ ℤ/n` is an injective
`ZMod n`-module. This is the dual sequence of the closing step of local duality. -/
theorem tateDualMap_exact [NeZero n] (hn : IsUnit (n : F)) {A B C : GalRep n F} (f : A ⟶ B)
    (g : B ⟶ C) (hf : Function.Injective f.hom) (hfg : Function.Exact f.hom g.hom)
    (hg : Function.Surjective g.hom) :
    Function.Injective (tateDualMap g).hom ∧
      Function.Exact (tateDualMap g).hom (tateDualMap f).hom ∧
        Function.Surjective (tateDualMap f).hom :=
  sorry

/-- **The chosen-root identification** `μ_n → Hom(μ_n, μ_n)`, `x ↦ (y ↦ log_ζ(x) · y)`, the
adjoint of `kummerCupPairing ζ` (`tateDualEquiv_muNRepToTateDual_apply`). It is a morphism because
`G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F` (`muNRep_ρ_eq_self`), and it is bijective
(`bijective_muNRepToTateDual`). -/
noncomputable def muNRepToTateDual [NeZero n] (ζ : F) (hζ : IsPrimitiveRoot ζ n) :
    muNRep n F ⟶ tateDual (muNRep n F) :=
  ConcreteCategory.ofHom (C := GalRep n F)
    ({ toContinuousLinearMap :=
        ⟨((tateDualEquiv (muNRep n F)).symm.toAddMonoidHom.comp
            ({ toFun := fun x => ((kummerCupPairing ζ hζ).bil x).toAddMonoidHom
               map_zero' := by ext; simp
               map_add' := fun x y => by ext; simp } :
              (muNRep n F).V →+ ((muNRep n F).V →+ (muNRep n F).V))).toZModLinearMap n,
          continuous_of_discreteTopology⟩
       isIntertwining' := fun g => by
        refine ContinuousLinearMap.ext fun x => ?_
        simp only [ContinuousLinearMap.comp_apply]
        rw [muNRep_ρ_eq_self ζ hζ g x]
        refine ((tateDual_ρ_eq_self_iff (muNRep n F) g _).2 fun y => ?_).symm
        rw [muNRep_ρ_eq_self ζ hζ g y, muNRep_ρ_eq_self ζ hζ g] } :
      ContIntertwiningMap (muNRep n F).ρ (tateDual (muNRep n F)).ρ)

/-- `muNRepToTateDual ζ` is the adjoint of the Kummer cup pairing. -/
theorem tateDualEquiv_muNRepToTateDual_apply [NeZero n] (ζ : F) (hζ : IsPrimitiveRoot ζ n)
    (x y : (muNRep n F).V) :
    tateDualEquiv (muNRep n F) ((muNRepToTateDual ζ hζ).hom x) y =
      (kummerCupPairing ζ hζ).bil x y :=
  rfl

/-- `muNRepToTateDual ζ` is bijective: `μ_n(Fˢ)` is cyclic of order `n`, generated by `ζ`
(`IsPrimitiveRoot.zpowers_eq`), so its endomorphisms are the multiplications by `ZMod n`. -/
theorem bijective_muNRepToTateDual [NeZero n] (ζ : F) (hζ : IsPrimitiveRoot ζ n) :
    Function.Bijective (muNRepToTateDual ζ hζ).hom :=
  sorry

end TateDual

/-! ### Local Tate duality and the Euler characteristic

The order is `finite_H`, then duality, then the Euler characteristic: duality is proved from the
Hilbert pairing, Shapiro's lemma and a count that uses `finite_H`, and the Euler characteristic
uses the `(0, 2)` case of duality for its additivity.

**Smoothness is a hypothesis.** `GalRep n F` is Mathlib's `TopRep`, whose operators are continuous
one group element at a time, so a discrete carrier does not make the action continuous in the group
variable. `finite_H`, `tateDualityPairing_perfect_mixed` and both Euler-characteristic theorems
therefore carry Tau Ceti's `TauCeti.IsSmoothDiscrete (ZMod n) A`, every point stabilizer open, as
the instance argument `[Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)]`. For finite `A` it makes the
kernel of the action, the intersection of the stabilizers of the elements of `A`, an open subgroup
`G_L`, and the finite Galois extension `L/F` it cuts out is where each reduction below starts; it
is also the hypothesis under which `ProfiniteCohomology` supplies Shapiro's lemma and corestriction.
It is found by instance search at `muNRep n F` (`instFactIsSmoothDiscreteMuNRep`), at the Tate dual
of a finite smooth discrete module (`instFactIsSmoothDiscreteTateDual`) and at the trivial module
`𝔽_p` (`instFactIsSmoothDiscreteTrivialFp`). -/

/-- The trivial module `𝔽_p` of `G_F`, Tau Ceti's `trivialFp`, is smooth, as an instance argument
(Tau Ceti's `isSmoothDiscrete_trivialFp`). -/
instance instFactIsSmoothDiscreteTrivialFp (p : ℕ) (F : Type) [Field F] :
    Fact (TauCeti.IsSmoothDiscrete (ZMod p) (TauCeti.trivialFp p (Field.absoluteGaloisGroup F))) :=
  ⟨TauCeti.isSmoothDiscrete_trivialFp p _⟩

/-- Finiteness in local cohomological degrees zero through two, for a finite smooth discrete
module. Smoothness makes the kernel of the action an open `G_L`; enlarging `L`, take `μ_ℓ ⊆ L` for
each prime `ℓ` dividing `#A`. Shapiro's lemma and dimension shifting along
`0 → A → Coind_{G_L}^{G_F} A → A₂ → 0` reduce it to `G_L` acting trivially, and there to
`ℤ/ℓ ≅ μ_ℓ`, where `H¹` is `Lˣ/(Lˣ)^ℓ` (`kummerEquiv_mixed`, finite by
`LocalFieldsRamification.card_powerClasses_mixed`) and `H²` is `ℤ/ℓ` (`h2MuEquivZMod_mixed`). -/
theorem finite_H (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F]
    [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (_hA : Finite A.V) [DiscreteTopology A.V] [Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)]
    (i : ℕ) (_hi : i ≤ 2) :
    Finite (H n F i A) :=
  sorry

/-- Local Tate-duality evaluation pairing. -/
noncomputable def tateDualityPairing {n : ℕ} {F : Type} [Field F]
    (A : GalRep n F) [DiscreteTopology A.V] (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (i j : ℕ) (hij : i + j = 2)
    (x : H n F i (tateDual A)) (y : H n F j A) : ZMod n :=
  tr (ProfiniteCohomology.degreeCast hij (muNRep n F)
    (ProfiniteCohomology.cup (tateEvaluationPairing A) i j x y))

/-- **Naturality of the duality pairing in `A`**: for `f : A ⟶ B`, `⟨f^* x, y⟩ = ⟨x, f_* y⟩`.
It is `ProfiniteCohomology.cup_coeffMap` applied twice, through the pairing
`(ψ, a) ↦ ψ (f a)` of `B'` with `A`, whose two compatibilities are
`tateEvaluationPairing_tateDualMap` and the definition of the evaluation pairing. This is the
naturality that makes `H²(A) → H²(A'')` dual to `H⁰(A''') → H⁰(A')` in the additivity step of the
Euler characteristic, and the two long exact sequences compatible in the closing step of duality. -/
theorem tateDualityPairing_tateDualMap {n : ℕ} {F : Type} [Field F] {A B : GalRep n F}
    [DiscreteTopology A.V] [DiscreteTopology B.V] (f : A ⟶ B)
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n) (i j : ℕ) (hij : i + j = 2)
    (x : H n F i (tateDual B)) (y : H n F j A) :
    tateDualityPairing A tr i j hij
        ((ProfiniteCohomology.coeffMap (ZMod n) (tateDualMap f) i).hom x) y =
      tateDualityPairing B tr i j hij x ((ProfiniteCohomology.coeffMap (ZMod n) f j).hom y) := by
  have hid : ∀ (X : GalRep n F) (m : ℕ) (z : H n F m X),
      (ProfiniteCohomology.coeffMap (ZMod n) (𝟙 X) m).hom z = z := fun X m z => by
    change (ContinuousCohomology.map (ContinuousMonoidHom.id _) (𝟙 X) m).hom z = z
    rw [ContinuousCohomology.map_id]
    rfl
  -- The pairing `(ψ, a) ↦ ψ (f a)` of `B'` with `A`, through which both sides factor.
  let Q : ProfiniteCohomology.TopPairing (tateDual B) A (muNRep n F) :=
    { bil := (tateEvaluationPairing B).bil.compl₂ f.hom.toContinuousLinearMap.toLinearMap
      cont := continuous_of_discreteTopology
      equivariant := fun g ψ a => by
        change (tateEvaluationPairing B).bil ((tateDual B).ρ g ψ) (f.hom (A.ρ g a)) = _
        rw [TopRep.hom_comm_apply]
        exact (tateEvaluationPairing B).equivariant g ψ (f.hom a) }
  have h₁ := (hid _ (i + j) _).symm.trans (ProfiniteCohomology.cup_coeffMap Q
    (tateEvaluationPairing A) (tateDualMap f) (𝟙 _) (𝟙 _) (fun _ _ => rfl) i j x y)
  have h₂ := (hid _ (i + j) _).symm.trans (ProfiniteCohomology.cup_coeffMap Q
    (tateEvaluationPairing B) (𝟙 _) f (𝟙 _) (fun _ _ => rfl) i j x y)
  simp only [hid] at h₁ h₂
  simp only [tateDualityPairing]
  rw [← h₁, ← h₂]

/-- **The chosen-root comparison.** After a primitive `n`-th root `ζ ∈ F` is chosen, the
`(1, 1)` duality pairing at `A = μ_n`, read on `H¹(G_F, μ_n)` through the chosen-root
identification `muNRepToTateDual ζ : μ_n → Hom(μ_n, μ_n)`, is the Hilbert pairing
`localSymbol (kummerCupPairing ζ)`. A closed proof: `ProfiniteCohomology.cup_coeffMap` at the
compatibility `tateDualEquiv_muNRepToTateDual_apply`. Through the coordinate
`muNRepEquivZMod ζ`, which identifies `μ_n` with the trivial module `ℤ/n` (`muNRep_ρ_eq_self`) and
`kummerCupPairing ζ` with multiplication (`kummerCupPairing_bil`), this is the statement that the
cup square on `H¹(G_F, ℤ/n)` is the `(1, 1)` Tate-duality pairing. -/
theorem tateDualityPairing_muNRepToTateDual {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (x y : H n F 1 (muNRep n F)) :
    tateDualityPairing (muNRep n F) tr 1 1 rfl
        ((ProfiniteCohomology.coeffMap (ZMod n) (muNRepToTateDual ζ hζ) 1).hom x) y =
      localSymbol (kummerCupPairing ζ hζ) tr x y := by
  have hid : ∀ (m : ℕ) (z : H n F m (muNRep n F)),
      (ProfiniteCohomology.coeffMap (ZMod n) (𝟙 (muNRep n F)) m).hom z = z := fun m z => by
    change (ContinuousCohomology.map (ContinuousMonoidHom.id _) (𝟙 (muNRep n F)) m).hom z = z
    rw [ContinuousCohomology.map_id]
    rfl
  have h := ProfiniteCohomology.cup_coeffMap (kummerCupPairing ζ hζ)
    (tateEvaluationPairing (muNRep n F)) (muNRepToTateDual ζ hζ) (𝟙 _) (𝟙 _)
    (fun _ _ => rfl) 1 1 x y
  simp only [hid] at h
  simp only [tateDualityPairing, localSymbol]
  rw [← h]
  exact congrArg (fun z => tr (ProfiniteCohomology.degreeCast (by norm_num) (muNRep n F) z))
    (hid (1 + 1) _)

/-- Perfect local Tate duality in mixed characteristic, for the named evaluation pairing and a
finite smooth discrete module. The base case is the Hilbert pairing over a field containing `μ_n`
(`localSymbol_kummerClass_eq_zero_iff` in degree `(1,1)`, `h2MuEquivZMod_mixed` in degrees `(0,2)`
and `(2,0)`); coinduction from such a field and Shapiro's lemma, with corestriction preserving the
invariant, give it for coinduced modules; the four lemma along `0 → A → Coind A → A'' → 0`, with
`Coind A` coinduced from the open kernel `G_L` of the action enlarged so that `μ_n ⊆ L`, and its
dual makes the three maps `Hⁱ(A) → H²⁻ⁱ(Hom(A, μ_n))^∨` injective for every `A`, and applied to `A`
and to its dual, smooth by `isSmoothDiscrete_tateDual`, these injections between finite groups
(`finite_H`) are bijections. -/
theorem tateDualityPairing_perfect_mixed (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n) (_hA : Finite A.V)
    [DiscreteTopology A.V] [Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)]
    (i j : ℕ) (hij : i + j = 2) :
    (∀ x : H n F i (tateDual A),
        (∀ y : H n F j A, tateDualityPairing A tr i j hij x y = 0) → x = 0) ∧
      (∀ φ : H n F j A →+ ZMod n, ∃ x : H n F i (tateDual A),
        ∀ y : H n F j A, tateDualityPairing A tr i j hij x y = φ y) :=
  sorry

/-- **Cardinality form of the mixed-characteristic local Euler characteristic**, for a finite
smooth discrete module: `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`. The three groups are finite by
`finite_H`. The proof is the dévissage of `README.md` Layer 5: both sides are multiplicative in
short exact sequences (the `(0,2)` case of `tateDualityPairing_perfect_mixed` makes `H²` right
exact), so they descend to the Grothendieck group of `𝔽_ℓ[Gal(L/K)]`-modules, `L/K` the finite
Galois extension cut out by the open kernel of the action, where the modular Artin theorem of
`RepresentationTheory/ModularInduction` reduces them to modules induced from cyclic subgroups of
order prime to `ℓ`; there Shapiro's lemma, semisimplicity, duality, equivariant Kummer theory and
the class of `Lˣ/(Lˣ)^ℓ` (through Mathlib's normal basis `IsGalois.normalBasis` when `ℓ = p`)
compute both. -/
theorem eulerCharacteristic_mixed (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F) (_hA : Finite A.V) [DiscreteTopology A.V]
    [Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)] :
    Nat.card (H n F 1 A)
      = Nat.card (H n F 0 A) * Nat.card (H n F 2 A)
        * p ^ (Module.finrank ℚ_[p] F * padicValNat p (Nat.card A.V)) :=
  sorry

/-- The `𝔽_p` Euler-characteristic formula consumed by `LocalGaloisGroups`, for a finite smooth
discrete module: `eulerCharacteristic_mixed` at `n = p`, read in `𝔽_p`-dimensions. -/
theorem eulerCharacteristic_finrank_fp (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (A : GalRep p F) (_hA : Finite A.V) [DiscreteTopology A.V]
    [Fact (TauCeti.IsSmoothDiscrete (ZMod p) A)] :
    Module.finrank (ZMod p) (H p F 1 A)
      = Module.finrank (ZMod p) (H p F 0 A)
        + Module.finrank (ZMod p) (H p F 2 A)
        + Module.finrank ℚ_[p] F * Module.finrank (ZMod p) A.V :=
  sorry

/-! The smoothness hypotheses are found by instance search at the modules `LocalGaloisGroups`
applies these theorems to: duality at `μ_p`, finiteness at its Tate dual, and the Euler
characteristic at the trivial module `𝔽_p`. -/

example (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (tr : H p F 2 (muNRep p F) ≃+ ZMod p) (x : H p F 1 (tateDual (muNRep p F)))
    (hx : ∀ y : H p F 1 (muNRep p F), tateDualityPairing (muNRep p F) tr 1 1 rfl x y = 0) :
    x = 0 :=
  (tateDualityPairing_perfect_mixed p F p (NeZero.ne p) (muNRep p F) tr inferInstance 1 1
    rfl).1 x hx

example (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (i : ℕ)
    (hi : i ≤ 2) : Finite (H p F i (tateDual (muNRep p F))) :=
  finite_H p F p (NeZero.ne p) (tateDual (muNRep p F)) inferInstance i hi

example (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] :
    Module.finrank (ZMod p) (H p F 1 (TauCeti.trivialFp p (Field.absoluteGaloisGroup F)))
      = Module.finrank (ZMod p) (H p F 0 (TauCeti.trivialFp p (Field.absoluteGaloisGroup F)))
        + Module.finrank (ZMod p) (H p F 2 (TauCeti.trivialFp p (Field.absoluteGaloisGroup F)))
        + Module.finrank ℚ_[p] F *
          Module.finrank (ZMod p) (TauCeti.trivialFp p (Field.absoluteGaloisGroup F)).V :=
  eulerCharacteristic_finrank_fp p F _ (inferInstanceAs (Finite (ULift (ZMod p))))

/-! ## Layer 6: the local class formation and finite local reciprocity -/

/-- **The formation of a field**: the multiplicative group `(Fˢ)ˣ` of a separable closure, written
additively as Tau Ceti's `UnitsCoeff F` and made a formation on Tau Ceti's `AbsoluteGaloisGroup F`
by Tau Ceti's dictionary `ofDiscreteModule`. It is smooth because every unit of `Fˢ` has an
open stabilizer (Tau Ceti's `unitsCoeff_continuousSMul`). Its layer `V ◁ U` is the multiplicative
group of the extension cut out by `V`, with its Galois action. The local formation and the
multiplicative formation of a number field are this formation. -/
noncomputable def fieldFormation (F : Type) [Field F] :
    Formation (TauCeti.AbsoluteGaloisGroup F) :=
  haveI := unitsCoeff_continuousSMul_int F
  ⟨TauCeti.ofDiscreteModule ℤ (TauCeti.AbsoluteGaloisGroup F) (TauCeti.UnitsCoeff F),
    TauCeti.ofDiscreteModule_isSmoothDiscrete ℤ _ _⟩

/-- **The ground level of the field formation is `H⁰(G_F, (Fˢ)ˣ)`**: both are the units of `Fˢ`
fixed by all of `G_F`. This is what reads Tau Ceti's `baseUnitsEquivInvariants` on the ground
level (`localGroundEquiv`). -/
theorem h0_unitsCoeff_eq_level_top (F : Type) [Field F] :
    TauCeti.ContCohomology.H0 (TauCeti.AbsoluteGaloisGroup F) (TauCeti.UnitsCoeff F) =
      ((fieldFormation F).level ⊤).toAddSubgroup := by
  ext x
  simp only [FixedPoints.mem_addSubgroup]
  exact ⟨fun h => (fieldFormation F).mem_level.2 fun u _ => h u,
    fun h g => (fieldFormation F).mem_level.1 h g (Subgroup.mem_top g)⟩

/-- The formation of multiplicative groups of finite separable extensions of `K`, written
additively: the field formation `fieldFormation K`, whose module is Tau Ceti's `UnitsCoeff K` on the
separable-closure Galois group. -/
noncomputable def localFormation : Formation (TauCeti.AbsoluteGaloisGroup K) :=
  fieldFormation K

/-- Hilbert 90 and the local Brauer invariant make `localFormation K` a class formation. The
local-field structure is bound in the header: the formation of a number field is not a class
formation. -/
noncomputable def localClassFormation (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : ClassFormation (localFormation K) :=
  sorry

/-- Inflation from the two-dimensional cohomology of a finite layer of the local formation to the
local Brauer group `Br K = H²(G_K, (Kˢ)ˣ)`. -/
noncomputable def brInfl (L : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (hL : L.ground = ⊤) : L.H (localFormation K) 2 →+ Br K :=
  sorry

/-- The abstract invariant of a finite layer agrees with `invMap` on the local Brauer group after
inflation to `Br K`; the two normalizations are one. -/
theorem localClassFormation_inv (L : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (hL : L.ground = ⊤) (x : L.H (localFormation K) 2) :
    (localClassFormation K).inv L x = invMap K (brInfl K L hL x) :=
  sorry

/-- The normal layer attached to a finite Galois extension `L/K` embedded in the chosen separable
closure. -/
noncomputable def localLayer [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    NormalLayer (TauCeti.AbsoluteGaloisGroup K) :=
  sorry

/-- Identification of the concrete local norm quotient with the abstract norm quotient. -/
noncomputable def localNormQuotientEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃+
      (localLayer K L iota).NormQuotient (localFormation K) :=
  sorry

/-- Identification of the abstract finite Galois quotient with `Gal(L/K)`. -/
noncomputable def localGaloisAbelianizationEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Abelianization (localLayer K L iota).Gal) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  sorry

/-- Finite local reciprocity, transparently transported from the abstract Artin equivalence. -/
noncomputable def localArtinEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  (localNormQuotientEquiv K L iota).trans
    (((localClassFormation K).artinEquiv (localLayer K L iota)).trans
      (localGaloisAbelianizationEquiv K L iota))

/-- The quotient map used to obtain the local Artin map on `Kˣ`. -/
noncomputable def localNormQuotientMk [Algebra K L] [Module.Finite K L] :
    Additive Kˣ →+ Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) :=
  MonoidHom.toAdditive (QuotientGroup.mk' (LocalFieldsRamification.normGroup K L))

/-- The finite local Artin map on `Kˣ`. -/
noncomputable def localArtinMap [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive Kˣ →+ Additive (Abelianization (L ≃ₐ[K] L)) :=
  (localArtinEquiv K L iota).toAddMonoidHom.comp (localNormQuotientMk K L)

/-- The finite local Artin equivalence does not depend on the chosen embedding into the separable
closure: conjugate layers give the same map on `Kˣ / N`. -/
theorem localArtinEquiv_eq_of_iota [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota iota' : L →ₐ[K] SeparableClosure K) :
    localArtinEquiv K L iota = localArtinEquiv K L iota' :=
  sorry

/-- **Frozen public name.** `normResidue` is the multiplicative form of `localArtinEquiv` for the
canonical embedding of `L` into the separable closure; it is not a second construction. -/
noncomputable def normResidue [Algebra K L] [Module.Finite K L] [IsGalois K L] :
    (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃* Abelianization (L ≃ₐ[K] L) :=
  MulEquiv.toAdditive.symm (localArtinEquiv K L (IsSepClosed.lift : L →ₐ[K] SeparableClosure K))

/-- At an unramified extension, a uniformizer maps to **arithmetic** Frobenius. -/
theorem localArtinMap_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    localArtinMap K L iota (Additive.ofMul (Units.mk0 (pi : K) hpi0)) =
      Additive.ofMul
        (Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h)) :=
  sorry

/-- **Frozen public name.** The multiplicative form of the uniformizer normalization. -/
theorem normResidue_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    normResidue K L (QuotientGroup.mk (Units.mk0 (pi : K) hpi0))
      = Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h) :=
  sorry

/-- Units are norms in an unramified finite extension, hence have trivial finite Artin symbol. -/
theorem localArtinMap_unit_of_unramified [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (u : Kˣ) (hu : ValuativeRel.valuation K (u : K) = 1) :
    localArtinMap K L iota (Additive.ofMul u) = 0 :=
  sorry

/-- In an unramified extension of degree `n`, the norm quotient is cyclic of order `n`, generated
by the class of a uniformizer. -/
theorem localNormQuotientEquivZMod_unramified [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    ∃ e : Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃+ ZMod (Module.finrank K L),
      e (Additive.ofMul (QuotientGroup.mk (Units.mk0 (pi : K) hpi0))) = 1 :=
  sorry

/-- In an unramified extension the Artin symbol depends only on the normalized valuation modulo
the degree: `Art(x) = Frob^{v(x)}`. -/
theorem localArtinMap_eq_frobenius_pow_valuation [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1) (x : Kˣ) :
    localArtinMap K L iota (Additive.ofMul x) =
      Multiplicative.toAdd (LocalFieldsRamification.normalizedValuation K x) •
        Additive.ofMul
          (Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h)) :=
  sorry

/-- Quadratic local test: a non-norm maps to the nontrivial automorphism. -/
theorem localArtinMap_quadratic_eq_nontrivial_iff_not_norm
    [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (hdegree : Module.finrank K L = 2)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1) (a : Kˣ) :
    localArtinMap K L iota (Additive.ofMul a) =
        Additive.ofMul (Abelianization.of τ) ↔
      a ∉ LocalFieldsRamification.normGroup K L :=
  sorry

/-- The Hilbert-symbol form of the quadratic test, an integration test with `localSymbol`: for the
quadratic extension generated by a square root of a nonsquare `d`, the Artin symbol of `a` is the
nontrivial automorphism exactly when the quadratic symbol `(a,d)_K` is `-1` — additively, when
`localSymbol` returns `1 : ZMod 2`.

⚠ The extension must be *exactly* `K(√d)`, so the chosen square root `s` is data and generates
`L` over `K`. A bare hypothesis `∃ s : L, s * s = algebraMap K L d` does **not** pin `L`: it holds
for every extension of `K` that happens to contain a square root of `d`. The biquadratic field
`L = K(√d, √e)` satisfies it, has degree four, and has three nontrivial automorphisms, none of
which is determined by `(a,d)_K`; with only the existential hypothesis the statement is false.

⚠ The pairing is the named `kummerCupPairing ζ hζ` at the primitive square root of unity `ζ`,
which is `-1`, and never a variable `P : TopPairing …`: the zero pairing has that type and makes
every `localSymbol` vanish, which contradicts the left-hand side for any `a` that is not a norm
from `L`. At exponent two the coordinate `tr` is harmless, because `ZMod 2` has a unique
automorphism, but the pairing is data. This is the same discipline as
`localSymbol_kummerClass_steinberg` and `tateDualityPairing_perfect_mixed`, which are also stated
for named pairings only. -/
theorem localArtinMap_quadratic_eq_hilbertSymbol
    [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (d : Kˣ) (hd : ¬ IsSquare d)
    (s : L) (hs : s * s = algebraMap K L (d : K))
    (hgen : IntermediateField.adjoin K ({s} : Set L) = ⊤)
    (hdegree : Module.finrank K L = 2)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1) (hτs : τ s = -s) (a : Kˣ)
    (ζ : K) (hζ : IsPrimitiveRoot ζ 2)
    (tr : H 2 K 2 (muNRep 2 K) ≃+ ZMod 2) :
    localArtinMap K L iota (Additive.ofMul a) = Additive.ofMul (Abelianization.of τ) ↔
      localSymbol (kummerCupPairing ζ hζ) tr (kummerClass 2 K a) (kummerClass 2 K d) = 1 :=
  sorry

/-- The local cyclotomic test: for `p ∤ m`, `ℚ_p(ζ_m)/ℚ_p` is unramified, and the Artin symbol of
`p` acts on `ζ_m` by `ζ_m ↦ ζ_m^p`. Stated for a general local field `K` in place of `ℚ_p`, with
`q` the residue cardinality. -/
theorem localArtinMap_cyclotomic_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0)
    (m : ℕ) (ζ : L) (_hζ : IsPrimitiveRoot ζ m) (σ : L ≃ₐ[K] L)
    (hσ : localArtinMap K L iota (Additive.ofMul (Units.mk0 (pi : K) hpi0)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ Nat.card 𝓀[K] :=
  sorry

/-! ### The cohomological dimension of `G_K`

Consequences of Tate's theorem for the local class formation, stated against
`ProfiniteCohomology.cd_p` and `ProfiniteCohomology.scd_p`, which are aliases of Tau Ceti's
`cohomologicalDimensionAt` and `strictCohomologicalDimensionAt`. -/

/-- **`H³(G_K, (Kˢ)ˣ) = 0`**: on every finite layer `Ĥ³(Gal(L/K), Lˣ) ≅ Ĥ¹(Gal(L/K), ℤ) = 0` by
`ClassFormation.tateIso` at degree `1` for `localClassFormation K`, and continuous cohomology is the
finite-quotient colimit of `ProfiniteCohomology`. -/
theorem subsingleton_h3_unitsRep : Subsingleton (continuousCohomology 3 (unitsRep K)) :=
  sorry

/-- **`cd_ℓ G_K = 2`** for every prime `ℓ` and every finite extension `K/ℚ_p` (NSW (7.1.8)(i)). By
`ProfiniteProPGroups.cd_p_eq_of_isProPSylow` it is enough to bound an `ℓ`-Sylow subgroup
`G_{K_ℓ}`, which fixes `K(μ_ℓ)`; by `ProfiniteProPGroups.cd_p_le_iff_elementaryAbelian_of_isProP`
it is enough that `H³(G_{K_ℓ}, ℤ/ℓ)` vanishes, and it is the colimit of the `H³(G_L, μ_ℓ)` over the
finite `L ⊆ K_ℓ`, which embed into `H³(G_L, (Lˢ)ˣ) = 0` because `Br L ≅ ℚ/ℤ` (`invMap`) is
divisible. For `≥ 2`: `H²(K(μ_ℓ), μ_ℓ) ≅ ℤ/ℓ` (`h2MuEquivZMod_mixed`) and
`ProfiniteCohomology.cd_p_le_of_isClosed`. -/
theorem cd_p_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    ProfiniteCohomology.cd_p ℓ (Field.absoluteGaloisGroup K) = 2 :=
  sorry

/-- **`scd_ℓ G_K = 2`** for every prime `ℓ` and every finite extension `K/ℚ_p` (NSW (7.2.5)). `≥ 2`
is `ProfiniteCohomology.cd_p_le_scd_p`. For `≤ 2`, use the `scd` criterion of `ProfiniteCohomology`
Layer 11, `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` at `n = 2` (NSW (3.3.4)),
directly on `scd_p` and `cd_p`. Its first condition, `cd_ℓ G_K ≤ 2`, is
`cd_p_absoluteGaloisGroup_eq_two`. Its second asks for `H³(G_L, ℤ)(ℓ) ≅ H²(G_L, ℚ_ℓ/ℤ_ℓ) = 0` for
every finite `L/K`; by the `(2,0)` case of `tateDualityPairing_perfect_mixed` at the trivial
module `ℤ/ℓᵐ`, which is smooth (`TauCeti.isSmoothDiscrete_of_ρ_apply_eq_self`), the group
`H²(G_L, ℤ/ℓᵐ)` is dual to `μ_{ℓᵐ}(L)`, so the colimit over `m` is dual to the inverse limit of the
`μ_{ℓᵐ}(L)` under `ℓ`-th powers, which is `0` because `μ_{ℓ^∞}(L)` is finite. -/
theorem scd_p_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    ProfiniteCohomology.scd_p ℓ (Field.absoluteGaloisGroup K) = 2 :=
  sorry

/-! ## Layer 7: the absolute local Artin map, its normalizations, and conductors -/

/-- **Frozen public name.** The local Artin map into the topological abelianization of the absolute
Galois group, normalized by arithmetic Frobenius. It is the inverse limit of the finite maps
`localArtinMap` over the finite abelian extensions of `K`, and it is pinned by three equations
stated against named maps: `artinMap_restrict` (against `restrictAbsolute`),
`unramifiedCoordinate_artinMap` (against `unramifiedCoordinate`) and `artinMap_norm` (against
`absoluteGaloisGroupExtend`). It has dense image and is not surjective. -/
noncomputable def artinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K :=
  sorry

/-- **Restriction** of the absolute Galois group to a finite Galois extension embedded by `iota`:
`AlgEquiv.restrictNormalHom` to `iota.fieldRange`, conjugated back to `L` by
`AlgEquiv.ofInjectiveField iota`, after `absoluteGaloisGroupComparison`. Its characterizing
equation is `iota_restrictAbsolute_apply`. -/
noncomputable def restrictAbsolute [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) : Field.absoluteGaloisGroup K →* (L ≃ₐ[K] L) :=
  haveI : Normal K iota.fieldRange := Normal.of_algEquiv (AlgEquiv.ofInjectiveField iota)
  (AlgEquiv.autCongr (AlgEquiv.ofInjectiveField iota).symm).toMonoidHom.comp
    ((AlgEquiv.restrictNormalHom (F := K) (K₁ := SeparableClosure K) iota.fieldRange).comp
      (absoluteGaloisGroupComparison K).toMulEquiv.toMonoidHom)

omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [ValuativeRel L]
  [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
/-- The characterizing equation of `restrictAbsolute`: `iota` is injective, so it determines the
map. A closed proof. -/
theorem iota_restrictAbsolute_apply [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (σ : Field.absoluteGaloisGroup K) (x : L) :
    iota (restrictAbsolute K L iota σ x) = absoluteGaloisGroupComparison K σ (iota x) := by
  have : Normal K iota.fieldRange := Normal.of_algEquiv (AlgEquiv.ofInjectiveField iota)
  have h : ∀ y : iota.fieldRange, iota ((AlgEquiv.ofInjectiveField iota).symm y) = y :=
    fun y => by
      conv_rhs => rw [← (AlgEquiv.ofInjectiveField iota).apply_symm_apply y]
      rfl
  change iota ((AlgEquiv.ofInjectiveField iota).symm
      (AlgEquiv.restrictNormalHom (F := K) (K₁ := SeparableClosure K) iota.fieldRange
        (absoluteGaloisGroupComparison K σ) (AlgEquiv.ofInjectiveField iota x))) = _
  rw [h]
  exact AlgEquiv.restrictNormalHom_apply iota.fieldRange (absoluteGaloisGroupComparison K σ)
    ⟨iota x, x, rfl⟩

theorem continuous_restrictAbsolute [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) : Continuous (restrictAbsolute K L iota) :=
  sorry

theorem surjective_restrictAbsolute [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) : Function.Surjective (restrictAbsolute K L iota) :=
  sorry

/-- The finite maps are the restrictions of the absolute map. -/
theorem artinMap_restrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ)
    (σ : Field.absoluteGaloisGroup K)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K) = artinMap K x) :
    localArtinMap K L iota (Additive.ofMul x) =
      Additive.ofMul (Abelianization.of (restrictAbsolute K L iota σ)) :=
  sorry

/-- **The absolute Galois group of a finite extension inside that of `K`**, along a `K`-embedding
`iota` of `L` into `Kˢ`: Tau Ceti's `galoisSubgroupEquiv` identifies the separable-closure group of
`L` with the open subgroup `galoisSubgroup K L iota` of that of `K`, read on Mathlib's absolute
Galois groups through `absoluteGaloisGroupComparison`. Different embeddings give conjugate maps,
which agree after passing to `G_K^ab`. -/
noncomputable def absoluteGaloisGroupExtend [Algebra K L] [Module.Finite K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Field.absoluteGaloisGroup L →* Field.absoluteGaloisGroup K :=
  (absoluteGaloisGroupComparison K).symm.toMulEquiv.toMonoidHom.comp
    ((TauCeti.galoisSubgroup K L iota).toSubgroup.subtype.comp
      ((TauCeti.galoisSubgroupEquiv K L iota).toMulEquiv.toMonoidHom.comp
        (absoluteGaloisGroupComparison L).toMulEquiv.toMonoidHom))

/-- **Norm functoriality of the absolute Artin map**: the image in `G_K^ab` of `Art_L x` is
`Art_K (N_{L/K} x)`. It is the absolute form of `ClassFormation.artinMap_groundNorm`, through the
identification of the local formation of `L` with the restriction of that of `K` to
`galoisSubgroup K L iota` (`localFormation_restrict`, `README.md` Layer 6) and `artinMap_restrict`
at every finite Galois `M ⊇ L`. -/
theorem artinMap_norm [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Lˣ) (τ : Field.absoluteGaloisGroup L)
    (hτ : (QuotientGroup.mk τ : Field.absoluteGaloisGroupAbelianization L) = artinMap L x) :
    (QuotientGroup.mk (absoluteGaloisGroupExtend K L iota τ) :
        Field.absoluteGaloisGroupAbelianization K) =
      artinMap K (Units.map (Algebra.norm K : L →* K) x) :=
  sorry

/-- **Naturality of the absolute Artin map in the local field**: a ring isomorphism `e : K ≃+* K'`
that is a homeomorphism, extended by `e'` to the algebraic closures, carries `Art_K` to `Art_{K'}`.
Conjugation by `e'` is determined up to an inner automorphism, invisible in the abelianization, so
every extension `e'` is allowed. It compares the Artin map of a completion with that of an
isomorphic local field, e.g. `v.adicCompletion ℚ` with `ℚ_[p]` through Mathlib's
`Rat.HeightOneSpectrum.adicCompletion.padicEquiv`. -/
theorem artinMap_congr {K' : Type} [Field K'] [ValuativeRel K'] [TopologicalSpace K']
    [IsNonarchimedeanLocalField K'] (e : K ≃+* K') (_he : IsHomeomorph e)
    (e' : AlgebraicClosure K ≃+* AlgebraicClosure K')
    (_he' : ∀ c : K, e' (algebraMap K (AlgebraicClosure K) c) =
      algebraMap K' (AlgebraicClosure K') (e c))
    (x : Kˣ) (σ : Field.absoluteGaloisGroup K) (σ' : Field.absoluteGaloisGroup K')
    (_hσσ' : ∀ y : AlgebraicClosure K, e' (σ.toRingEquiv y) = σ'.toRingEquiv (e' y))
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K) = artinMap K x) :
    (QuotientGroup.mk σ' : Field.absoluteGaloisGroupAbelianization K') =
      artinMap K' (Units.map e.toMonoidHom x) :=
  sorry

/-- The absolute Artin map is continuous for `K/ℚ_p` finite: the preimage of the open subgroup
cutting out a finite abelian `L/K` is `normGroup K L`, which contains the open subgroup of
`[L:K]`-th powers (`LocalFieldsRamification.isOpen_range_powMonoidHom`). -/
theorem continuous_artinMap (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    Continuous (artinMap K) :=
  sorry

/-- The image of the absolute Artin map is dense: an open subgroup of `G_K^ab` is the preimage of
a subgroup of a finite quotient `Gal(L/K)`, `L/K` finite abelian, onto which `localArtinMap` is
surjective, and `artinMap_restrict` transports that surjectivity. -/
theorem denseRange_artinMap : DenseRange (artinMap K) :=
  sorry

/-- Geometric normalization, defined by precomposing the arithmetic Artin map with inversion. -/
noncomputable def geometricArtinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K where
  toFun x := artinMap K x⁻¹
  map_one' := by simp
  map_mul' x y := by simp [mul_comm]

/-! ### The unramified coordinate

Stated against Tau Ceti's restriction to the maximal unramified extension and its identification
with `Ẑ = TauCeti.zHat`, with inertia and the arithmetic Frobenius lifts; `Ẑ` is not built a second
time. -/

section UnramifiedCoordinate

open TauCeti TauCetiRoadmap.LocalFieldsRamification

/-- The unramified coordinate kills the closed commutator subgroup: `restrictMaximalUnramifiedHom`
is continuous with commutative Hausdorff target `Ẑ`. -/
theorem topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom :
    (commutator (Field.absoluteGaloisGroup K)).topologicalClosure ≤
      ((maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)).toMulEquiv.toMonoidHom.comp
        (restrictMaximalUnramifiedHom K)).ker :=
  sorry

/-- **Frozen public name.** The unramified coordinate `G_K^ab → Gal(K^ur/K) ≅ Ẑ`: the descent of
`restrictMaximalUnramifiedHom` followed by `maximalUnramifiedGaloisGroupEquivZHat`, which sends the
arithmetic Frobenius to `zHat.gen`. -/
noncomputable def unramifiedCoordinate : Field.absoluteGaloisGroupAbelianization K →* zHat :=
  QuotientGroup.lift _
    ((maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)).toMulEquiv.toMonoidHom.comp
      (restrictMaximalUnramifiedHom K))
    (topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom K)

/-- The unramified coordinate on every class. A closed proof. -/
theorem unramifiedCoordinate_mk (σ : Field.absoluteGaloisGroup K) :
    unramifiedCoordinate K (QuotientGroup.mk σ) =
      maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)
        (restrictMaximalUnramifiedHom K σ) :=
  QuotientGroup.lift_mk _ _ _

theorem continuous_unramifiedCoordinate : Continuous (unramifiedCoordinate K) :=
  sorry

theorem surjective_unramifiedCoordinate : Function.Surjective (unramifiedCoordinate K) :=
  sorry

/-- The kernel of the unramified coordinate is the image of inertia: Tau Ceti's
`ker_restrictMaximalUnramifiedHom`, which landed after this repository's Tau Ceti pin, and
injectivity of `maximalUnramifiedGaloisGroupEquivZHat`. -/
theorem unramifiedCoordinate_mk_eq_one_iff (σ : Field.absoluteGaloisGroup K) :
    unramifiedCoordinate K (QuotientGroup.mk σ) = 1 ↔ σ ∈ inertiaSubgroup K :=
  sorry

/-- Exactly the arithmetic Frobenius lifts have coordinate `zHat.gen`:
`maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius` and the definition of
`IsArithFrobeniusLift`. -/
theorem unramifiedCoordinate_mk_eq_gen_iff (σ : Field.absoluteGaloisGroup K) :
    unramifiedCoordinate K (QuotientGroup.mk σ) = zHat.gen ↔ IsArithFrobeniusLift K σ :=
  sorry

/-- **Frozen public name.** On the Artin map the unramified coordinate is the normalized valuation:
`artinMap_restrict` at every finite unramified `L`, `localArtinMap_eq_frobenius_pow_valuation`, and
`zHat.hom_ext`. -/
theorem unramifiedCoordinate_artinMap (x : Kˣ) :
    unramifiedCoordinate K (artinMap K x) =
      zHat.ofInt (LocalFieldsRamification.normalizedValuation K x) :=
  sorry

theorem unramifiedCoordinate_geometricArtinMap (x : Kˣ) :
    unramifiedCoordinate K (geometricArtinMap K x)
      = (unramifiedCoordinate K (artinMap K x))⁻¹ :=
  sorry

/-- **Every lift of `Art_K u`, `u` a unit, lies in inertia.** A closed corollary of
`unramifiedCoordinate_artinMap` and `unramifiedCoordinate_mk_eq_one_iff`. -/
theorem mem_inertiaSubgroup_of_mk_eq_artinMap (u : Kˣ)
    (hu : ValuativeRel.valuation K (u : K) = 1) (σ : Field.absoluteGaloisGroup K)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K) = artinMap K u) :
    σ ∈ inertiaSubgroup K := by
  rw [← unramifiedCoordinate_mk_eq_one_iff, hσ, unramifiedCoordinate_artinMap,
    (LocalFieldsRamification.normalizedValuation_eq_one_iff K u).2 hu, map_one]

/-- **Every lift of `Art_K π`, `π` a uniformizer, is an arithmetic Frobenius lift.** A closed
corollary of `unramifiedCoordinate_artinMap` and `unramifiedCoordinate_mk_eq_gen_iff`. -/
theorem isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer (pi : 𝒪[K]) (hpi : Irreducible pi)
    (hpi0 : (pi : K) ≠ 0) (σ : Field.absoluteGaloisGroup K)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K) =
      artinMap K (Units.mk0 (pi : K) hpi0)) :
    IsArithFrobeniusLift K σ := by
  rw [← unramifiedCoordinate_mk_eq_gen_iff, hσ, unramifiedCoordinate_artinMap,
    LocalFieldsRamification.normalizedValuation_irreducible K pi hpi hpi0]
  rfl

end UnramifiedCoordinate

/-- Least unit-filtration depth contained in the norm group. -/
noncomputable def conductorExponent [Algebra K L] [Module.Finite K L] : ℕ :=
  sInf {n : ℕ | LocalFieldsRamification.unitFiltration K n ≤
    LocalFieldsRamification.normGroup K L}

noncomputable def conductorIdeal [Algebra K L] [Module.Finite K L] : Ideal ↥𝒪[K] :=
  𝓂[K] ^ conductorExponent K L

theorem unitFiltration_conductorExponent_le_normGroup [Algebra K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    LocalFieldsRamification.unitFiltration K (conductorExponent K L)
      ≤ LocalFieldsRamification.normGroup K L :=
  sorry

theorem not_unitFiltration_pred_le_normGroup [Algebra K L] [Module.Finite K L]
    (hc : 0 < conductorExponent K L) :
    ¬ LocalFieldsRamification.unitFiltration K (conductorExponent K L - 1)
        ≤ LocalFieldsRamification.normGroup K L :=
  sorry

theorem conductorExponent_eq_zero_iff [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    conductorExponent K L = 0 ↔ LocalFieldsRamification.ramificationIndex K L = 1 :=
  sorry

/-- Least unit-filtration depth killed by a continuous character. -/
noncomputable def characterConductorExp (chi : ContinuousMonoidHom Kˣ ℂˣ) : ℕ :=
  sInf {n | ∀ x ∈ LocalFieldsRamification.unitFiltration K n, chi x = 1}

/-- Attainment uses continuity together with the fact that `ℂˣ` has no small subgroups. -/
theorem unitFiltration_characterConductorExp_le_ker
    (chi : ContinuousMonoidHom Kˣ ℂˣ) :
    LocalFieldsRamification.unitFiltration K (characterConductorExp K chi)
      ≤ chi.toMonoidHom.ker :=
  sorry

/-! ## Layer 8: separate arithmetic local existence and the local class-field correspondence

These targets are deliberately not methods of `ClassFormation`: reciprocity follows from the
class-formation axioms, but existence requires additional arithmetic input. Full existence is
stated only in mixed characteristic; the general local-field target below is prime to the residue
characteristic.

The endpoint of the layer is the **correspondence**, not existence. `∃ V, localNormSubgroup V = N`
is not "the class field attached to `N`": by `ClassFormation.normSubgroup_maximalAbelianLayer` a
layer and its maximal abelian sublayer have the same norm subgroup, so the arbitrary-layer
statements below are corollaries of the abelian ones, kept only for the forgetful direction. What
pins the class field is the conjunction of `localAbelianExistence`, `localClassField_unique` and
`localClassField_le_iff`, packaged as `localClassFieldCorrespondence`; read through the Layer 5
`classField` dictionary that bijection is the classical order-reversing correspondence onto the
finite abelian extensions of `K` (`localClassField_orderReversing`). -/

/-- **The identification of the ground level `A^{G_K}` of the local formation with `Kˣ`**: Tau
Ceti's `baseUnitsEquivInvariants`, `Kˣ ≅ H⁰(G_K, (Kˢ)ˣ)`, read on the ground level, which is the
same subgroup of `(Kˢ)ˣ` (`h0_unitsCoeff_eq_level_top`). -/
noncomputable def localGroundEquiv :
    Additive Kˣ ≃+ (localFormation K).level ⊤ :=
  (TauCeti.baseUnitsEquivInvariants K).trans
    (AddEquiv.addSubgroupCongr (h0_unitsCoeff_eq_level_top K))

/-- **The norm subgroup of `Kˣ` cut out by an open normal subgroup of `G_K`**: the norm subgroup of
the layer `V ◁ ⊤`, read through `localGroundEquiv`. Writing the correspondence against this map
rather than against the raw `comap` keeps the local statements in the multiplicative language of
`Kˣ` that `LocalFieldsRamification.normGroup` also uses. -/
noncomputable def localNormSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) : Subgroup Kˣ :=
  AddSubgroup.toSubgroup'
    (((NormalLayer.ofOpenNormal V).normSubgroup (localFormation K)).toAddSubgroup.comap
      (localGroundEquiv K).toAddMonoidHom)

/-- Norm subgroups are open. -/
theorem isOpen_localNormSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    IsOpen ((localNormSubgroup K V : Subgroup Kˣ) : Set Kˣ) :=
  sorry

/-- Norm subgroups have finite index. -/
theorem finiteIndex_localNormSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    (localNormSubgroup K V).FiniteIndex :=
  sorry

/-- The norm subgroup is monotone in the layer subgroup, hence **reverses inclusion of fields**: a
larger `V` cuts out a smaller field, and a smaller field has a larger norm subgroup. -/
theorem localNormSubgroup_mono
    {V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)} (h : V ≤ W) :
    localNormSubgroup K V ≤ localNormSubgroup K W :=
  sorry

/-- **Norm limitation in the concrete local language.** The extension cut out by `V` and its
maximal abelian subextension have the same norm subgroup of `Kˣ`; this is the abstract
`ClassFormation.normSubgroup_maximalAbelianLayer` transported through `localGroundEquiv`. It is the
reason the existence theorems below must name the abelian layer. -/
theorem localNormSubgroup_maximalAbelianLayer
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    localNormSubgroup K (maximalAbelianLayer V) = localNormSubgroup K V := by
  simp only [localNormSubgroup,
    ClassFormation.normSubgroup_maximalAbelianLayer (localClassFormation K) V]
  rfl

/-- **Direction acceptance test.** The trivial layer `V = ⊤` cuts out `K` itself, whose norm
subgroup is all of `Kˣ`. This is the extreme case that fixes which end of the correspondence is
which: `⊤` is the *largest* layer subgroup and `Kˣ` the *largest* norm subgroup, so the
correspondence is monotone on subgroups and reversing on fields. Under the opposite convention `Kˣ`
would correspond to the maximal abelian extension of `K`. -/
theorem localNormSubgroup_top : localNormSubgroup K ⟨⊤, Subgroup.normal_top⟩ = ⊤ :=
  sorry

/-- **The source of the local correspondence:** open subgroups of finite index in `Kˣ`. Both
conditions are needed — `𝒪ˣ` is open of infinite index in `Kˣ` and is not a norm subgroup. -/
abbrev LocalNormSubgroups : Type := {N : OpenSubgroup Kˣ // N.toSubgroup.FiniteIndex}

/-- The norm subgroup of a layer as an element of the source carrier. -/
noncomputable def localNormOpenSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    LocalNormSubgroups K :=
  ⟨⟨localNormSubgroup K V, isOpen_localNormSubgroup K V⟩, finiteIndex_localNormSubgroup K V⟩

/-- **Full local existence in mixed characteristic, in its final abelian form.** For a finite
extension of `ℚ_p`, every open finite-index subgroup of `Kˣ` is the norm subgroup of a finite
**abelian** layer. The `ℚ_p`-algebra and finiteness hypotheses are load-bearing;
equal-characteristic `p`-primary existence requires Artin–Schreier–Witt theory and is outside this
roadmap. -/
theorem localAbelianExistence (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ localNormSubgroup K V = N :=
  sorry

/-- The forgetful corollary: some open normal subgroup, not necessarily abelian, has the given norm
subgroup. It is **not** the class-field correspondence — `maximalAbelianLayer` produces a second
witness with the same norm subgroup — and is kept only because the forgetful direction is
occasionally what a consumer needs. -/
theorem localExistence (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      localNormSubgroup K V = N :=
  (localAbelianExistence K p N hN).imp fun _ h => h.2

/-- **Prime-to-residue-characteristic local existence in its final abelian form**, valid also in
equal characteristic: an open finite-index subgroup whose index is coprime to the residue
characteristic is the norm subgroup of a finite abelian layer. The coprimality hypothesis is part
of the public signature, so this target cannot be used to claim the excluded `p`-primary case. -/
theorem localAbelianExistence_primeToResidueCharacteristic
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex]
    (hindex : Nat.Coprime (Nat.card (Kˣ ⧸ N)) p) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ localNormSubgroup K V = N :=
  sorry

/-- The forgetful corollary in the prime-to-`p` range. -/
theorem localExistence_primeToResidueCharacteristic
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex]
    (hindex : Nat.Coprime (Nat.card (Kˣ ⧸ N)) p) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      localNormSubgroup K V = N :=
  (localAbelianExistence_primeToResidueCharacteristic K p N hN hindex).imp fun _ h => h.2

/-- **Uniqueness: distinct finite abelian extensions have distinct norm subgroups.** This is the
half of the correspondence that turns existence into *the* class field attached to `N`. Without the
abelianity hypotheses it is false: `V` and `maximalAbelianLayer V` are a counterexample whenever
the layer is nonabelian. -/
theorem localClassField_unique
    {V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) (hW : IsAbelianClassFieldLayer W)
    (h : localNormSubgroup K V = localNormSubgroup K W) :
    V = W :=
  sorry

/-- **The canonical quotient identification `Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)`** for an abelian layer.
Its target is the Galois group of the layer itself, not an abelianization that happens to simplify
later: `abelianizationGalEquiv hV` identifies `Abelianization L.Gal` with `L.Gal`, so the
abelianization-valued `ClassFormation.artinEquiv` can be read here as reciprocity onto
`Gal(L/K)`. The local-field structure is bound in the header, as for `localClassFormation`: over
`ℚ` the norm quotient of `ℚ(i)` is infinite. -/
noncomputable def localAbelianGaloisEquiv (K : Type) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) :
    Kˣ ⧸ localNormSubgroup K V ≃* (NormalLayer.ofOpenNormal V).Gal :=
  sorry

/-- **The characterizing equation of `localAbelianGaloisEquiv`:** composed with `Abelianization.of`
it is the abstract Artin map of the layer. Because the layer is abelian, `Abelianization.of` is
injective, so this pins the isomorphism; it is reciprocity, not an arbitrary isomorphism of two
finite groups of the same order. -/
theorem localAbelianGaloisEquiv_artinMap
    {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) (x : Kˣ) :
    Additive.ofMul (Abelianization.of (localAbelianGaloisEquiv K hV (QuotientGroup.mk x))) =
      (localClassFormation K).artinMap (NormalLayer.ofOpenNormal V)
        (localGroundEquiv K (Additive.ofMul x)) :=
  sorry

/-- **The index equality `[Kˣ : N_{L/K}(Lˣ)] = [L : K]`.** `NormalLayer.degree` of the layer
`V ◁ ⊤` is `Nat.card (G_K ⧸ V)`, the degree of the extension over `K`. -/
theorem index_localNormSubgroup
    {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) :
    (localNormSubgroup K V).index = (NormalLayer.ofOpenNormal V).degree :=
  (Subgroup.index_eq_card _).trans (Nat.card_congr (localAbelianGaloisEquiv K hV).toEquiv)

/-- The existence statement on the bundled carrier, so that the class field can be *defined* from
it rather than pinned by an unproved equation. -/
theorem exists_localClassField (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N : LocalNormSubgroups K) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ localNormSubgroup K V = N.1.toSubgroup :=
  haveI := N.2
  localAbelianExistence K p N.1.toSubgroup N.1.isOpen

/-- **The local class field attached to an open finite-index subgroup `N ≤ Kˣ`**, for a finite
extension of `ℚ_p`. It is the abelian layer produced by `localAbelianExistence`, which
`localClassField_unique` shows is the only one, so the choice is canonical. Its field-theoretic
form is `IntermediateField.fixedField` of the underlying subgroup. -/
noncomputable def localClassField (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N : LocalNormSubgroups K) :
    AbelianLayer (TauCeti.AbsoluteGaloisGroup K) :=
  ⟨(exists_localClassField K p N).choose, (exists_localClassField K p N).choose_spec.1⟩

/-- **The characterizing equation of `localClassField`:** its norm subgroup is `N`. -/
theorem localClassField_normSubgroup (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N : LocalNormSubgroups K) :
    localNormSubgroup K (localClassField K p N).1 = N.1.toSubgroup :=
  (exists_localClassField K p N).choose_spec.2

/-- **The subgroup form of the correspondence's order.** ⚠ The inclusions run the *same* way here:
a larger norm subgroup cuts out a smaller field, hence a **larger** subgroup of `G_K`. The
classical order-reversing statement is `localClassField_orderReversing` below, on fields. -/
theorem localClassField_le_iff (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N₁ N₂ : LocalNormSubgroups K) :
    N₁ ≤ N₂ ↔ (localClassField K p N₁).1 ≤ (localClassField K p N₂).1 :=
  sorry

/-- **Order reversal, in fields.** `N₁ ≤ N₂` exactly when the class field of `N₂` is contained in
the class field of `N₁`. Together with `localClassField_normSubgroup` and
`localClassField_unique` this is the full local class-field correspondence for finite extensions
of `ℚ_p`. -/
theorem localClassField_orderReversing (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N₁ N₂ : LocalNormSubgroups K) :
    N₁ ≤ N₂ ↔
      classField K (localClassField K p N₂).1 ≤ classField K (localClassField K p N₁).1 :=
  (localClassField_le_iff K p N₁ N₂).trans
    (classField_le_classField_iff K (localClassField K p N₁).1 (localClassField K p N₂).1).symm

/-- **The full local class-field correspondence for finite extensions of `ℚ_p`**, as an order
isomorphism onto the abelian layers. Its two maps are `localClassField` and
`localNormOpenSubgroup`; nothing here is an opaque choice. Read through `classField` it is the
classical order-**reversing** bijection onto the finite abelian extensions of `K`
(`localClassField_orderReversing`). -/
noncomputable def localClassFieldCorrespondence (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    LocalNormSubgroups K ≃o AbelianLayer (TauCeti.AbsoluteGaloisGroup K) where
  toFun N := localClassField K p N
  invFun V := localNormOpenSubgroup K V.1
  left_inv N := by
    refine Subtype.ext (OpenSubgroup.toSubgroup_injective ?_)
    exact localClassField_normSubgroup K p N
  right_inv V := by
    refine Subtype.ext (localClassField_unique K ?_ V.2 ?_)
    · exact (localClassField K p (localNormOpenSubgroup K V.1)).2
    · exact localClassField_normSubgroup K p (localNormOpenSubgroup K V.1)
  map_rel_iff' := fun {N₁ N₂} => (localClassField_le_iff K p N₁ N₂).symm

/-- **The source of the equal-characteristic correspondence:** open finite-index subgroups of `Kˣ`
of index prime to the residue characteristic. Restricting the carrier, rather than the proof, is
what keeps the excluded `p`-primary equal-characteristic case out of the public interface. -/
abbrev LocalNormSubgroupsPrimeTo (p : ℕ) : Type :=
  {N : OpenSubgroup Kˣ // N.toSubgroup.FiniteIndex ∧ Nat.Coprime (Nat.card (Kˣ ⧸ N.toSubgroup)) p}

/-- The matching Galois carrier: abelian layers of degree prime to `p`. -/
abbrev AbelianLayerPrimeTo (p : ℕ) : Type :=
  {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K) //
    IsAbelianClassFieldLayer V ∧
      Nat.Coprime (NormalLayer.ofOpenNormal V).degree p}

/-- Prime-to-`p` existence on the bundled carrier, with the degree of the layer recorded so that
the class field lands in `AbelianLayerPrimeTo`. -/
theorem exists_localClassField_primeToResidueCharacteristic
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p] (N : LocalNormSubgroupsPrimeTo K p) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      (IsAbelianClassFieldLayer V ∧ Nat.Coprime (NormalLayer.ofOpenNormal V).degree p) ∧
        localNormSubgroup K V = N.1.toSubgroup := by
  have := N.2.1
  obtain ⟨V, hV, hN⟩ :=
    localAbelianExistence_primeToResidueCharacteristic K p N.1.toSubgroup N.1.isOpen N.2.2
  refine ⟨V, ⟨hV, ?_⟩, hN⟩
  have hdeg : (NormalLayer.ofOpenNormal V).degree = Nat.card (Kˣ ⧸ N.1.toSubgroup) := by
    rw [← index_localNormSubgroup K hV, hN, Subgroup.index_eq_card]
  rw [hdeg]
  exact N.2.2

/-- **The class field attached to a prime-to-`p` norm subgroup** of an equal-characteristic local
field. -/
noncomputable def localClassFieldPrimeToResidueCharacteristic
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p] (N : LocalNormSubgroupsPrimeTo K p) :
    AbelianLayerPrimeTo K p :=
  ⟨(exists_localClassField_primeToResidueCharacteristic K p N).choose,
    (exists_localClassField_primeToResidueCharacteristic K p N).choose_spec.1⟩

theorem localClassFieldPrimeToResidueCharacteristic_normSubgroup
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p] (N : LocalNormSubgroupsPrimeTo K p) :
    localNormSubgroup K (localClassFieldPrimeToResidueCharacteristic K p N).1 =
      N.1.toSubgroup :=
  (exists_localClassField_primeToResidueCharacteristic K p N).choose_spec.2

theorem localClassFieldPrimeToResidueCharacteristic_le_iff
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p] (N₁ N₂ : LocalNormSubgroupsPrimeTo K p) :
    N₁ ≤ N₂ ↔ (localClassFieldPrimeToResidueCharacteristic K p N₁).1 ≤
      (localClassFieldPrimeToResidueCharacteristic K p N₂).1 :=
  sorry

/-- **The prime-to-residue-characteristic local correspondence**, the only local correspondence
asserted for an equal-characteristic local field. ⚠ There is deliberately no statement here with
the unrestricted carriers: `p`-primary equal-characteristic existence needs the Artin–Schreier–Witt
theory that §1 of the roadmap places outside this roadmap, so restricting the two carriers — not
the proof — is what keeps the excluded case out of the public interface. -/
noncomputable def localClassFieldCorrespondence_primeToResidueCharacteristic
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p] :
    LocalNormSubgroupsPrimeTo K p ≃o AbelianLayerPrimeTo K p where
  toFun N := localClassFieldPrimeToResidueCharacteristic K p N
  invFun V := ⟨⟨localNormSubgroup K V.1, isOpen_localNormSubgroup K V.1⟩,
    finiteIndex_localNormSubgroup K V.1, by
      rw [← Subgroup.index_eq_card, index_localNormSubgroup K V.2.1]; exact V.2.2⟩
  left_inv N := by
    refine Subtype.ext (OpenSubgroup.toSubgroup_injective ?_)
    exact localClassFieldPrimeToResidueCharacteristic_normSubgroup K p N
  right_inv V := by
    refine Subtype.ext (localClassField_unique K ?_ V.2.1 ?_)
    · exact (localClassFieldPrimeToResidueCharacteristic K p _).2.1
    · exact localClassFieldPrimeToResidueCharacteristic_normSubgroup K p _
  map_rel_iff' := fun {N₁ N₂} =>
    (localClassFieldPrimeToResidueCharacteristic_le_iff K p N₁ N₂).symm

/-- **The order-reversing form in the prime-to-`p` range**, on fields. -/
theorem localClassFieldPrimeToResidueCharacteristic_orderReversing
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p] (N₁ N₂ : LocalNormSubgroupsPrimeTo K p) :
    N₁ ≤ N₂ ↔
      classField K (localClassFieldPrimeToResidueCharacteristic K p N₂).1 ≤
        classField K (localClassFieldPrimeToResidueCharacteristic K p N₁).1 :=
  (localClassFieldPrimeToResidueCharacteristic_le_iff K p N₁ N₂).trans
    (classField_le_classField_iff K (localClassFieldPrimeToResidueCharacteristic K p N₁).1
      (localClassFieldPrimeToResidueCharacteristic K p N₂).1).symm

/-- **The canonical quotient identification `Kˣ / N ≃ Gal(L/K)`** for the class field `L` attached
to `N`, obtained from `localAbelianGaloisEquiv` and `localClassField_normSubgroup`. -/
noncomputable def localClassFieldGaloisEquiv (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N : LocalNormSubgroups K) :
    Kˣ ⧸ N.1.toSubgroup ≃*
      (NormalLayer.ofOpenNormal (localClassField K p N).1).Gal :=
  (QuotientGroup.quotientMulEquivOfEq (localClassField_normSubgroup K p N).symm).trans
    (localAbelianGaloisEquiv K (localClassField K p N).2)

/-- **The index equality `[Kˣ : N] = [L : K]`.** -/
theorem localClassField_index (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (N : LocalNormSubgroups K) :
    N.1.toSubgroup.index =
      (NormalLayer.ofOpenNormal (localClassField K p N).1).degree :=
  (localClassField_normSubgroup K p N) ▸ index_localNormSubgroup K (localClassField K p N).2

/-- **The kernel of the absolute local Artin map is the intersection of all norm subgroups.** This
holds for every nonarchimedean local field: it is the inverse-limit description of `artinMap` read
through `ClassFormation.ker_artinMap` at every finite layer, and it says nothing about whether
that intersection is trivial. -/
theorem ker_artinMap_eq_iInf :
    (artinMap K).ker =
      ⨅ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
        localNormSubgroup K V :=
  sorry

/-- **Injectivity of the absolute local Artin map, for finite extensions of `ℚ_p`.** By
`ker_artinMap_eq_iInf` it says that the norm subgroups of the finite abelian extensions intersect
trivially, and it follows from `localAbelianExistence`: every open finite-index subgroup of `Kˣ` is
a norm subgroup, and the open finite-index subgroups of `Kˣ` intersect trivially.

⚠ The `ℚ_p`-algebra hypothesis is load-bearing, and the statement is **not** made in equal
characteristic. There the norm subgroups this roadmap constructs are those of the prime-to-`p`
abelian extensions (`localAbelianExistence_primeToResidueCharacteristic`), and every one of them
contains the pro-`p` group of principal units `1 + 𝓂[K]`, which is nontrivial: a finite quotient
of order prime to `p` kills a pro-`p` group. So the intersection of the norm subgroups the included
theory knows is not trivial, and injectivity for `𝔽_q((t))` needs the Artin–Schreier–Witt theory
that is outside this roadmap. `localWeilArtinEquiv` consumes this theorem and carries the same
hypotheses. -/
theorem injective_artinMap (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    Function.Injective (artinMap K) :=
  sorry

/-- The concrete `ℚ₂(ζ₅)/ℚ₂` test: unramified of degree four, and `2` maps to `ζ₅ ↦ ζ₅²`.
Replacing arithmetic Frobenius by geometric Frobenius would give the exponent `3`. -/
theorem localArtinMap_Q2_zeta5 [ValuativeRel ℚ_[2]] [IsNonarchimedeanLocalField ℚ_[2]]
    (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    [Algebra ℚ_[2] E] [Module.Finite ℚ_[2] E] [IsGalois ℚ_[2] E]
    [IsCyclotomicExtension {5} ℚ_[2] E]
    (iota : E →ₐ[ℚ_[2]] SeparableClosure ℚ_[2])
    (ζ : E) (_hζ : IsPrimitiveRoot ζ 5) (σ : E ≃ₐ[ℚ_[2]] E)
    (hσ : localArtinMap ℚ_[2] E iota (Additive.ofMul (Units.mk0 (2 : ℚ_[2]) two_ne_zero)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ 2 :=
  sorry

/-! ## Layer 9: the local Weil group

A layer of its own, and not a corollary of reciprocity: the Weil group has a carrier, a topology
that is **not** the one induced from `G_K`, functoriality in finite extensions, an exact sequence
with inertia, and only then the comparison of its topological abelianization with `Kˣ`. It sits
after local existence because `Kˣ ≃ W_K^ab` needs `injective_artinMap`, i.e. that the intersection
of the norm subgroups is trivial, which Layer 8 obtains from `localAbelianExistence` for finite
extensions of `ℚ_p` only. The carrier, the topology, functoriality and the inertia sequence below
are stated for every nonarchimedean local field; the reciprocity isomorphism and the two statements
derived from it carry the mixed-characteristic hypotheses of `injective_artinMap`. -/

/-- **The carrier.** The local Weil group as a subgroup of `G_K`: the preimage of the powers of
arithmetic Frobenius under `G_K → Gal(K^ur/K) ≅ Ẑ`, that is, the preimage of `ℤ ⊆ Ẑ`. The
surjection `G_K → Ẑ` and its kernel `LocalFieldsRamification.inertia` are owned by
`LocalFieldsRamification` — its maximal unramified extension and its exact sequence
`1 → I_K → G_K → Ẑ → 1` — and everything below is owned here. -/
noncomputable def localWeilGroup : Subgroup (Field.absoluteGaloisGroup K) :=
  sorry

/-- Inertia is the degree-zero part of the Weil group, hence contained in it. -/
theorem inertia_le_localWeilGroup :
    LocalFieldsRamification.inertia K ≤ localWeilGroup K :=
  sorry

/-- `W_K` is normal in `G_K`, being the preimage of a subgroup of an abelian quotient. -/
instance localWeilGroup_normal : (localWeilGroup K).Normal :=
  sorry

/-- `W_K` is dense in `G_K`, because `ℤ` is dense in `Ẑ`. -/
theorem dense_localWeilGroup :
    Dense (localWeilGroup K : Set (Field.absoluteGaloisGroup K)) :=
  sorry

/-- `W_K` is a proper subgroup: `ℤ ≠ Ẑ`. Together with `dense_localWeilGroup` this is why the
subspace topology cannot be the right one. -/
theorem localWeilGroup_ne_top : localWeilGroup K ≠ ⊤ :=
  sorry

/-- **The carrier with the Weil topology.** ⚠ `WeilGroup K` is a type synonym for the subgroup
`localWeilGroup K` precisely so that it does **not** inherit the subspace topology. Inertia is open
in the Weil topology and is *not* open in `G_K` (`not_isOpen_inertia`), so
`TopologicalAbelianization ↥(localWeilGroup K)` — the subtype with its induced topology — is a
different, and false, statement of `localWeilArtinEquiv` below. -/
def WeilGroup : Type := localWeilGroup K

noncomputable instance instGroupWeilGroup : Group (WeilGroup K) :=
  inferInstanceAs (Group (localWeilGroup K))

/-- **The topology.** The unique group topology on `W_K` in which `I_K`, with the topology it
carries as a closed subgroup of `G_K`, is an open subgroup. -/
noncomputable instance instTopologicalSpaceWeilGroup : TopologicalSpace (WeilGroup K) :=
  sorry

instance instIsTopologicalGroupWeilGroup : IsTopologicalGroup (WeilGroup K) :=
  sorry

/-- The inclusion `W_K → G_K`. -/
noncomputable def weilToAbsolute : WeilGroup K →* Field.absoluteGaloisGroup K :=
  (localWeilGroup K).subtype

omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
theorem injective_weilToAbsolute : Function.Injective (weilToAbsolute K) :=
  Subtype.val_injective

/-- The inclusion is continuous, because the Weil topology is finer than the induced one. -/
theorem continuous_weilToAbsolute : Continuous (weilToAbsolute K) :=
  sorry

/-- Inertia, pulled back to `W_K`, is open. -/
theorem isOpen_inertia_weil :
    IsOpen {w : WeilGroup K | weilToAbsolute K w ∈ LocalFieldsRamification.inertia K} :=
  sorry

/-- The inclusion of inertia into `W_K`, with `I_K` carrying the topology it already has as a
closed subgroup of `G_K`. -/
noncomputable def inertiaToWeil :
    ↥(LocalFieldsRamification.inertia K) →* WeilGroup K :=
  Subgroup.inclusion (inertia_le_localWeilGroup K)

/-- **The characterization of the Weil topology, first half.** `I_K` does not merely sit inside
`W_K` as an open subgroup: it does so *with its own profinite topology*, so the inclusion is an
open topological embedding. ⚠ `isOpen_inertia_weil` alone is strictly weaker and does not pin the
topology down — refining the topology of `I_K` and translating it along the cosets keeps that
subgroup open while changing the group topology. The local compactness and topological
abelianization results below use this statement, not the weak one. -/
theorem isOpenEmbedding_inertiaToWeil :
    Topology.IsOpenEmbedding (inertiaToWeil K) :=
  sorry

/-- **The characterization of the Weil topology, second half: uniqueness.** Any group topology on
`W_K` for which `I_K` — again with its fixed profinite topology — includes as an open embedding is
the Weil topology. Together with `isOpenEmbedding_inertiaToWeil` this is what "the unique group
topology in which inertia is open" has to mean. -/
theorem weilTopology_unique (t : TopologicalSpace (WeilGroup K))
    (_ht : @IsTopologicalGroup (WeilGroup K) t _)
    (_hopen : @Topology.IsOpenEmbedding _ _ _ t (inertiaToWeil K)) :
    t = instTopologicalSpaceWeilGroup K :=
  sorry

/-- ⚠ The same subgroup is **not** open in `G_K`: its image in `Ẑ` is the singleton `{0}`, which
is not open. This is exactly the difference between the Weil topology and the induced topology,
and it is why `W_K` is locally compact while `G_K` is compact. -/
theorem not_isOpen_inertia :
    ¬ IsOpen (LocalFieldsRamification.inertia K : Set (Field.absoluteGaloisGroup K)) :=
  sorry

instance instLocallyCompactSpaceWeilGroup : LocallyCompactSpace (WeilGroup K) :=
  sorry

instance instTotallyDisconnectedSpaceWeilGroup : TotallyDisconnectedSpace (WeilGroup K) :=
  sorry

/-- ⚠ `W_K` is **not** compact in the Weil topology, although `G_K` is compact and `W_K` is dense
in it. A proof of `localWeilArtinEquiv` that transports compactness across the inclusion is
wrong. -/
theorem not_compactSpace_weilGroup : ¬ CompactSpace (WeilGroup K) :=
  sorry

/-- **The exact sequence with inertia**, first map: the degree homomorphism `W_K → ℤ`, normalized
so that an arithmetic Frobenius lift has degree `1`. -/
noncomputable def weilDegree : WeilGroup K →* Multiplicative ℤ :=
  sorry

/-- Exactness on the right: every integer is the degree of an element of `W_K`. -/
theorem surjective_weilDegree : Function.Surjective (weilDegree K) :=
  sorry

/-- Exactness in the middle: the kernel of the degree is inertia. Together with
`surjective_weilDegree` and `injective_weilToAbsolute` this is `1 → I_K → W_K → ℤ → 1`. -/
theorem ker_weilDegree :
    (weilDegree K).ker =
      (LocalFieldsRamification.inertia K).comap (weilToAbsolute K) :=
  sorry

/-- Arithmetic normalization of the degree against the frozen `unramifiedCoordinate`: the
unramified coordinate of the image of `w` in `G_K^ab` is the image of its degree in `Ẑ`. This is
what forbids the geometric normalization on the Weil group. -/
theorem unramifiedCoordinate_weilDegree (w : WeilGroup K) :
    unramifiedCoordinate K
        (QuotientGroup.mk (weilToAbsolute K w) : Field.absoluteGaloisGroupAbelianization K) =
      TauCeti.zHat.ofInt (weilDegree K w) :=
  sorry

/-- **Functoriality in a finite extension**, the inclusion `W_L ↪ W_K` attached to an embedding of
`L` in the chosen separable closure. -/
noncomputable def weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : WeilGroup L →* WeilGroup K :=
  sorry

theorem injective_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Function.Injective (weilTransfer K L iota) :=
  sorry

theorem continuous_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Continuous (weilTransfer K L iota) :=
  sorry

/-- The image is open of index `[L:K]`; in particular `W_L` is an open subgroup of `W_K` of finite
index, which is what makes the Weil group of a finite extension a subobject of the Weil group. -/
theorem isOpen_range_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    IsOpen ((weilTransfer K L iota).range : Set (WeilGroup K)) :=
  sorry

theorem index_range_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    (weilTransfer K L iota).range.index = Module.finrank K L :=
  sorry

/-- ⚠ The degree map is **not** compatible with `weilTransfer` on the nose: it is multiplied by the
residue degree `f(L/K)`, so it agrees only for `L/K` totally ramified. Writing
`weilDegree K (weilTransfer K L iota w) = weilDegree L w` normalizes the Weil group of an
unramified extension incorrectly. -/
theorem weilDegree_weilTransfer [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [Algebra.IsSeparable K L] (iota : L →ₐ[K] SeparableClosure K) (w : WeilGroup L) :
    weilDegree K (weilTransfer K L iota w) =
      weilDegree L w ^ LocalFieldsRamification.inertiaDegree K L :=
  sorry

/-- Restriction of Weil elements to a finite Galois subextension. -/
noncomputable def weilRestrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (_iota : L →ₐ[K] SeparableClosure K) : WeilGroup K →* (L ≃ₐ[K] L) :=
  sorry

/-- `weilRestrict` is the restriction of automorphisms, not another map of the same type. -/
theorem weilRestrict_apply [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (w : WeilGroup K) :
    weilRestrict K L iota w = restrictAbsolute K L iota (weilToAbsolute K w) :=
  sorry

/-- `W_K → Gal(L/K)` is surjective — the Weil group is dense in `G_K`, so it already surjects onto
every finite quotient. -/
theorem surjective_weilRestrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Function.Surjective (weilRestrict K L iota) :=
  sorry

/-- The kernel of restriction to `L` is the Weil group of `L`: the two functorialities agree. -/
theorem range_weilTransfer_eq_ker_weilRestrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    (weilTransfer K L iota).range = (weilRestrict K L iota).ker :=
  sorry

/-- **Frozen public name.** The Weil-group form of local reciprocity, for a finite extension of
`ℚ_p`. Unlike `artinMap` it is an isomorphism, and a topological one onto the **topological**
abelianization `W_K / closure ⁅W_K, W_K⁆`. Its injectivity is `injective_artinMap` and its
surjectivity is `localAbelianExistence`, which is why it carries their mixed-characteristic
hypotheses.
⚠ The algebraic `Abelianization (WeilGroup K)` is the wrong target: the commutator subgroup of
`W_K` need not be closed, and the algebraic quotient is not `Kˣ`.
⚠ There is no equal-characteristic form. For `𝔽_q((t))` both `Kˣ` and `W_K^ab` exist, but the map
between them is injective only if the norm subgroups of *all* finite abelian extensions intersect
trivially, and the prime-to-`p` ones this roadmap constructs all contain the principal units
(`injective_artinMap`); the `p`-primary extensions come from the excluded Artin–Schreier–Witt
theory.
The local-field structure is bound in the header: the homeomorphism is for the valuation topology of
`K`, not for an arbitrary topology on a finite extension of `ℚ_p`. -/
noncomputable def localWeilArtinEquiv (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    Kˣ ≃ₜ* TopologicalAbelianization (WeilGroup K) :=
  sorry

/-- The Weil-group reciprocity map recovers `artinMap` after passing to `G_K^ab`. -/
theorem localWeilArtinEquiv_compat (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (x : Kˣ) (w : WeilGroup K)
    (hw : (QuotientGroup.mk w : TopologicalAbelianization (WeilGroup K)) =
      localWeilArtinEquiv K p x) :
    (QuotientGroup.mk (weilToAbsolute K w) :
      Field.absoluteGaloisGroupAbelianization K) = artinMap K x :=
  sorry

/-- The image of `Kˣ` under `artinMap` is the image of the Weil group: dense but not all of
`G_K^ab`. The inclusion of the image of `Kˣ` in the image of `W_K` is the compatibility above; the
reverse inclusion is the surjectivity half of `localWeilArtinEquiv`, so the statement carries the
same hypotheses. -/
theorem mem_range_artinMap_iff (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (y : Field.absoluteGaloisGroupAbelianization K) :
    y ∈ (artinMap K).range ↔
      ∃ w : WeilGroup K,
        (QuotientGroup.mk (weilToAbsolute K w) :
          Field.absoluteGaloisGroupAbelianization K) = y :=
  sorry

end Local

/-! ## Layer 10: global carriers, the Brauer sequence, and the sum of local invariants -/

section Global

variable (K : Type) [Field K] [NumberField K]
variable (L : Type) [Field L] [NumberField L] [Algebra K L]

/-- The formation assembled from idele class groups of the finite separable extensions of `K`
inside a fixed separable closure. -/
noncomputable def globalFormation : Formation (TauCeti.AbsoluteGaloisGroup K) :=
  sorry

/-- The formation assembled from the idele groups themselves, rather than the idele classes. The
sum of local invariants is defined on its layers, where `H²` splits as a direct sum of local Brauer
groups, and only then descends to the idele-class layers. -/
noncomputable def ideleFormation : Formation (TauCeti.AbsoluteGaloisGroup K) :=
  sorry

/-- The formation assembled from the multiplicative groups `Lˣ` of the finite separable extensions
themselves, the first term of `1 → Lˣ → I_L → C_L → 1`. Its finite-layer `H²` is the relative
Brauer group `Br(L/K)`, and its `H³` carries the obstruction to lifting an idele-class layer class
to the idele layer. -/
noncomputable def multiplicativeFormation :
    Formation (TauCeti.AbsoluteGaloisGroup K) :=
  fieldFormation K

/-! ### The global Brauer sequence and the sum of local invariants

⚠ This block comes **before** `globalClassFormation`, and is not a corollary of it. The invariant
map of the global class formation *is* the sum of the local invariants, so the sum map, its finite
support, and the exactness of

```text
0 → Br K → ⨁_v Br K_v → ℚ/ℤ → 0
```

exist before the structure that consumes them. Nothing in this block may use `globalArtinMap`,
`globalExistence`, or Chebotarev: those are downstream of the abstract Artin map, which is
downstream of the class formation, which is downstream of this block. The inputs are the local
invariants of Layer 5, the Herbrand computations on the `S`-idele and `S`-unit modules, the two
fundamental inequalities, and `H¹`-vanishing for idele classes. -/

/-- Restriction of a global Brauer class to a finite completion. -/
noncomputable def brFinite (v : HeightOneSpectrum (𝓞 K)) :
    Br K →+ Br (v.adicCompletion K) :=
  sorry

/-- Restriction of a global Brauer class to an archimedean completion. -/
noncomputable def brInfinite (w : NumberField.InfinitePlace K) :
    Br K →+ Br w.Completion :=
  sorry

/-- **The archimedean local invariant.** The archimedean half of the Layer 5 local package:
`Br ℂ` vanishes, and `Br ℝ` is cyclic of order two whose nontrivial class has invariant `1/2`. -/
noncomputable def infiniteInvMap (w : NumberField.InfinitePlace K) :
    Br w.Completion →+ RatModInt :=
  sorry

/-- At a complex place the Brauer group is trivial, so the invariant vanishes. -/
theorem infiniteInvMap_eq_zero_of_isComplex (w : NumberField.InfinitePlace K)
    (hw : w.IsComplex) (x : Br w.Completion) :
    infiniteInvMap K w x = 0 :=
  sorry

/-- At a real place the invariants are exactly the elements of order dividing two. ⚠ Real places
are not ignorable: dropping them already breaks the sum formula for `ℚ(i)/ℚ`. -/
theorem range_infiniteInvMap_of_isReal (w : NumberField.InfinitePlace K) (hw : w.IsReal) :
    Set.range (infiniteInvMap K w) = (ratModIntTorsion 2 : Set RatModInt) :=
  sorry

/-- The local invariant of a global Brauer class at a finite place. The instance arguments needed
to name `invMap` at the completion are carried by `finiteInvAt_eq_invMap` rather than by this
definition, so that the sum below can range over all places. -/
noncomputable def finiteInvAt (v : HeightOneSpectrum (𝓞 K)) (x : Br K) : RatModInt :=
  sorry

/-- `finiteInvAt` is the Layer 5 invariant of the restriction to the completion, not a second
normalization. -/
theorem finiteInvAt_eq_invMap (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)] [IsNonarchimedeanLocalField (v.adicCompletion K)]
    (x : Br K) :
    finiteInvAt K v x = invMap (v.adicCompletion K) (brFinite K v x) :=
  sorry

/-- The local invariant of a global Brauer class at an archimedean place. -/
noncomputable def infiniteInvAt (w : NumberField.InfinitePlace K) (x : Br K) : RatModInt :=
  infiniteInvMap K w (brInfinite K w x)

/-- The finite places where a global Brauer class is ramified. -/
noncomputable def brauerSupport (x : Br K) : Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem finiteInvAt_eq_zero_of_not_mem (x : Br K) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ brauerSupport K x) :
    finiteInvAt K v x = 0 :=
  sorry

/-- **The sum of local invariants**, the middle map of the global Brauer sequence. -/
noncomputable def sumLocalInv (x : Br K) : RatModInt :=
  (∑ v ∈ brauerSupport K x, finiteInvAt K v x) +
    ∑ w : NumberField.InfinitePlace K, infiniteInvAt K w x

/-- Exactness at `Br K` (Albert–Brauer–Hasse–Noether): a class trivial at every place is
trivial. -/
theorem eq_zero_of_localInv_eq_zero (x : Br K)
    (hf : ∀ v : HeightOneSpectrum (𝓞 K), finiteInvAt K v x = 0)
    (hi : ∀ w : NumberField.InfinitePlace K, infiniteInvAt K w x = 0) :
    x = 0 :=
  sorry

/-- Exactness in the middle: the local invariants of a global class sum to zero. -/
theorem sumLocalInv_eq_zero (x : Br K) : sumLocalInv K x = 0 :=
  sorry

/-- Exactness on the right: a finitely supported family of local invariants, two-torsion at the
real places and zero at the complex ones, summing to zero, is the family of a global class. -/
theorem exists_br_of_sum_eq_zero
    (S : Finset (HeightOneSpectrum (𝓞 K))) (f : HeightOneSpectrum (𝓞 K) → RatModInt)
    (hS : ∀ v ∉ S, f v = 0)
    (g : NumberField.InfinitePlace K → RatModInt)
    (hgr : ∀ w : NumberField.InfinitePlace K, w.IsReal → g w ∈ ratModIntTorsion 2)
    (hgc : ∀ w : NumberField.InfinitePlace K, w.IsComplex → g w = 0)
    (hsum : (∑ v ∈ S, f v) + ∑ w : NumberField.InfinitePlace K, g w = 0) :
    ∃ x : Br K, (∀ v : HeightOneSpectrum (𝓞 K), finiteInvAt K v x = f v) ∧
      ∀ w : NumberField.InfinitePlace K, infiniteInvAt K w x = g w :=
  sorry

/-! ### The global invariant of a finite layer

The layer invariant is the sum of local invariants, computed on the idele layer and descended to
the idele-class layer. It is *defined* here, before `globalClassFormation` consumes it. -/

/-- The comparison `H²(Gal(L/K), I_L) → H²(Gal(L/K), C_L)` induced by `I_L → C_L`. -/
noncomputable def ideleToClassH2 (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Lay.H (ideleFormation K) 2 →+ Lay.H (globalFormation K) 2 :=
  sorry

/-- `H¹` of every idele-class layer vanishes (Milne, *Class Field Theory*, VII, Theorem 5.1(b)).
It is the input from which inflation `H²(Gal(L/K), C_L) → H²(Gal(M/K), C_M)` is injective and the
inflation–restriction sequence in degree two is exact, both used below. -/
theorem subsingleton_h1_globalFormation
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Subsingleton (Lay.H (globalFormation K) 1) :=
  sorry

/-- **The first fundamental inequality**: for a cyclic layer the norm index is at least the degree
(Milne VII §4, from the Herbrand quotient of the idele classes). -/
theorem degree_le_card_normQuotient_of_isCyclic
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) [IsCyclic Lay.Gal] :
    Lay.degree ≤ Nat.card (Lay.NormQuotient (globalFormation K)) :=
  sorry

/-- **The second fundamental inequality**, in its `H²` form: the order of `H²(Gal(L/K), C_L)`
divides `[L:K]` (Milne VII, Theorem 5.1(c)). Together with a class of order `[L:K]` this is what
identifies the group. -/
theorem card_H2_globalFormation_dvd_degree
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Nat.card (Lay.H (globalFormation K) 2) ∣ Lay.degree :=
  sorry

/-- **The idele-class layer class does not lift in general.** Every class of
`H²(Gal(L/K), I_L)` maps to `H²(Gal(L/K), C_L)`, but the map is **not** surjective for an
arbitrary layer: from `1 → Lˣ → I_L → C_L → 1` the obstruction to lifting lies in
`H³(Gal(L/K), Lˣ)`, and `H¹(Gal(L/K), C_L) = 0` says nothing about it.

⚠ Countermodel: `L = ℚ(√13, √17)`. Every decomposition group of this biquadratic extension has
order at most two — the decomposition groups at unramified primes are cyclic, `13` splits in
`ℚ(√17)` and `17` splits in `ℚ(√13)` by quadratic reciprocity, and the field is totally real — so
`H²(Gal(L/ℚ), I_L) = ⨁_v Br(L_w/ℚ_v)` is killed by `2`, and its image in the cyclic group
`H²(Gal(L/ℚ), C_L)` of order `4` has order at most `2`. In general the image is the subgroup of
order `lcm_v [L_w : K_v]`, which is everything only when some decomposition group is all of
`Gal(L/K)`. The cyclic case is the one where the lift always exists: there
`H³(Gal(L/K), Lˣ) ≃ H¹(Gal(L/K), Lˣ) = 0` by periodicity and Hilbert 90. -/
theorem surjective_ideleToClassH2_of_isCyclic
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) [IsCyclic Lay.Gal] :
    Function.Surjective (ideleToClassH2 K Lay) :=
  sorry

/-- **The obstruction to lifting**: the connecting homomorphism
`H²(Gal(L/K), C_L) → H³(Gal(L/K), Lˣ)` of `1 → Lˣ → I_L → C_L → 1`. -/
noncomputable def classToMultiplicativeH3
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Lay.H (globalFormation K) 2 →+ Lay.H (multiplicativeFormation K) 3 :=
  sorry

/-- **Exactness at the idele-class layer**: a class lifts to the idele layer exactly when its
obstruction vanishes. This is the precise form of the failure of surjectivity above. -/
theorem range_ideleToClassH2
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    (ideleToClassH2 K Lay).range = (classToMultiplicativeH3 K Lay).ker :=
  sorry

/-- The local component of an idele-layer class at a finite place, in invariant coordinates. -/
noncomputable def ideleLocalInvAt (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (v : HeightOneSpectrum (𝓞 K)) : Lay.H (ideleFormation K) 2 →+ RatModInt :=
  sorry

/-- The local component of an idele-layer class at an archimedean place. -/
noncomputable def ideleInfiniteInvAt
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (w : NumberField.InfinitePlace K) : Lay.H (ideleFormation K) 2 →+ RatModInt :=
  sorry

/-- The finite places at which an idele-layer class is ramified. -/
noncomputable def ideleSupport (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) : Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem ideleLocalInvAt_eq_zero_of_not_mem
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ ideleSupport K Lay x) :
    ideleLocalInvAt K Lay v x = 0 :=
  sorry

/-- **The sum of local invariants on an idele layer.** `H²(Gal(L/K), I_L) = ⨁_v Br(L_w/K_v)`, and
this is the sum of the local invariants of the components. -/
noncomputable def ideleSumLocalInv
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) : RatModInt :=
  (∑ v ∈ ideleSupport K Lay x, ideleLocalInvAt K Lay v x) +
    ∑ w : NumberField.InfinitePlace K, ideleInfiniteInvAt K Lay w x

/-- The sum of local invariants is inflation-invariant on idele layers: each local invariant is,
which is the fifth class-formation axiom at every completion. -/
theorem ideleSumLocalInv_infl
    {Lay Lay' : NormalLayer (TauCeti.AbsoluteGaloisGroup K)}
    (T : LayerRefinement Lay Lay') (x : Lay.H (ideleFormation K) 2) :
    ideleSumLocalInv K Lay' (T.cohomologyInfl (ideleFormation K) 2 x) =
      ideleSumLocalInv K Lay x :=
  sorry

/-! ### Refinement: where an idele-class layer class lifts

`ideleToClassH2` is not surjective at a given layer, so `globalInv` cannot be defined by descent
alone. The classical construction inflates to a larger layer where the obstruction dies, lifts
there, and checks that the value does not depend on the refinement or on the lift. Each of those
three steps is a target. -/

/-- **The cyclotomic input**: some refinement of every layer carries an idele-layer class of
invariant `1/[L:K]`. Adjoin a cyclic cyclotomic extension `K'/K` one of whose local degrees is
divisible by `[L:K]` (Milne VII, Lemma 7.3) and take a class supported at that place; the
refinement is the layer of `L·K'/K`. -/
theorem exists_refinement_ideleSumLocalInv_eq
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    ∃ (Lay' : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
      (_ : LayerRefinement Lay Lay') (y : Lay'.H (ideleFormation K) 2),
      ideleSumLocalInv K Lay' y = fundamentalInvariant Lay.degree :=
  sorry

/-- **Killing the obstruction.** Every idele-class layer class lifts to the idele layer after
inflation to a suitable refinement — one refinement for the whole group. Proof: with `Lay'` and
`y` from `exists_refinement_ideleSumLocalInv_eq`, the image `ȳ` of `y` in `H²(Gal(M/K), C_M)`
restricts to zero in `H²(Gal(M/L), C_M)`, because the restricted idele class has invariant
`[L:K] · 1/[L:K] = 0` and `sumLocalInv_eq_zero`, `exists_br_of_sum_eq_zero` and
`eq_zero_of_localInv_eq_zero` make the sum of local invariants injective on the image of the idele
layer; by `subsingleton_h1_globalFormation` the kernel of restriction is the inflation of
`H²(Gal(L/K), C_L)`, so `ȳ` is inflated from a class of order `[L:K]` there; by
`card_H2_globalFormation_dvd_degree` that class generates, so the inflation of every class lies in
the image of the idele layer. The same argument gives `globalInv_injective` and `globalInv_range`
(Milne VIII §4, Theorem 4.7). -/
theorem exists_refinement_mem_range_ideleToClassH2
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    ∃ (Lay' : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
      (T : LayerRefinement Lay Lay'), ∀ x : Lay.H (globalFormation K) 2,
      T.cohomologyInfl (globalFormation K) 2 x ∈ (ideleToClassH2 K Lay').range :=
  sorry

/-- **Independence of the lift and of the refinement.** Two idele-layer lifts of the inflations of
one idele-class class, to two refinements, have the same sum of local invariants. Pass to a common
refinement (`LayerRefinement.exists_commonRefinement`), where the two inflated lifts differ by the
image of `H²(Gal(M/K), Mˣ)` by `range_ideleToClassH2` and the injectivity of inflation, and that
image has invariant sum zero (`sumLocalInv_eq_zero`); the sums themselves are unchanged by
inflation (`ideleSumLocalInv_infl`). -/
theorem ideleSumLocalInv_eq_of_ideleToClassH2_eq
    {Lay Lay₁ Lay₂ : NormalLayer (TauCeti.AbsoluteGaloisGroup K)}
    (T₁ : LayerRefinement Lay Lay₁) (T₂ : LayerRefinement Lay Lay₂)
    (x : Lay.H (globalFormation K) 2)
    (y₁ : Lay₁.H (ideleFormation K) 2) (y₂ : Lay₂.H (ideleFormation K) 2)
    (h₁ : ideleToClassH2 K Lay₁ y₁ = T₁.cohomologyInfl (globalFormation K) 2 x)
    (h₂ : ideleToClassH2 K Lay₂ y₂ = T₂.cohomologyInfl (globalFormation K) 2 x) :
    ideleSumLocalInv K Lay₁ y₁ = ideleSumLocalInv K Lay₂ y₂ :=
  sorry

/-- **The global invariant of a finite layer**, the datum `globalClassFormation` is built from. On
a class that lifts to the idele layer it is the sum of local invariants of a lift; on an arbitrary
class it is the value at any refinement where the inflated class lifts
(`exists_refinement_mem_range_ideleToClassH2`), which `ideleSumLocalInv_eq_of_ideleToClassH2_eq`
makes independent of the refinement and of the lift. It is pinned by the two equations
`globalInv_ideleToClassH2` and `globalInv_infl`, and `globalInv_unique` says those determine it. -/
noncomputable def globalInv (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Lay.H (globalFormation K) 2 →+ RatModInt :=
  sorry

/-- **The sum formula, the first defining equation of the global invariant.** The invariant of a
class that lifts to the idele layer is the sum of the local invariants of any lift; this is well
defined because the sum of local invariants kills the image of `H²(Gal(L/K), Lˣ)`, i.e. because of
`sumLocalInv_eq_zero`. -/
theorem globalInv_ideleToClassH2
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) :
    globalInv K Lay (ideleToClassH2 K Lay x) = ideleSumLocalInv K Lay x :=
  sorry

/-- **Inflation invariance, the second defining equation.** With `globalInv_ideleToClassH2` and
`exists_refinement_mem_range_ideleToClassH2` it determines `globalInv` on every class. -/
theorem globalInv_infl
    {Lay Lay' : NormalLayer (TauCeti.AbsoluteGaloisGroup K)}
    (T : LayerRefinement Lay Lay') (x : Lay.H (globalFormation K) 2) :
    globalInv K Lay' (T.cohomologyInfl (globalFormation K) 2 x) = globalInv K Lay x :=
  sorry

/-- **Uniqueness of the global invariant.** Any family of homomorphisms satisfying the two defining
equations agrees with `globalInv`: the invariant is pinned by the sum formula and inflation
invariance, not by the details of a construction. -/
theorem globalInv_unique
    (f : ∀ Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K),
      Lay.H (globalFormation K) 2 →+ RatModInt)
    (hdesc : ∀ (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
      (y : Lay.H (ideleFormation K) 2),
      f Lay (ideleToClassH2 K Lay y) = ideleSumLocalInv K Lay y)
    (hinfl : ∀ {Lay Lay' : NormalLayer (TauCeti.AbsoluteGaloisGroup K)}
      (T : LayerRefinement Lay Lay') (x : Lay.H (globalFormation K) 2),
      f Lay' (T.cohomologyInfl (globalFormation K) 2 x) = f Lay x)
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (x : Lay.H (globalFormation K) 2) :
    f Lay x = globalInv K Lay x :=
  sorry

/-- The class-formation axiom of injectivity, obtained as in
`exists_refinement_mem_range_ideleToClassH2`: `H²(Gal(L/K), C_L)` is cyclic of order `[L:K]`,
generated by a class of invariant `1/[L:K]`. -/
theorem globalInv_injective (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Function.Injective (globalInv K Lay) :=
  sorry

/-- The class-formation axiom on the image, from the same argument. -/
theorem globalInv_range (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    Set.range (globalInv K Lay) = (ratModIntTorsion Lay.degree : Set RatModInt) :=
  sorry

/-! ## Layer 11: the global class formation and global Artin reciprocity -/

/-- The global class formation, built from the sum-of-local-invariants map above. Its axioms are
`subsingleton_h1_globalFormation`, `globalInv_injective`, `globalInv_range`, `globalInv_infl`, and
the restriction and conjugation formulae for `globalInv`. -/
noncomputable def globalClassFormation : ClassFormation (globalFormation K) :=
  sorry

/-- The invariant of the global class formation is the named sum-of-local-invariants map, not an
independently chosen normalization. -/
theorem globalClassFormation_inv
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K)) :
    (globalClassFormation K).inv Lay = globalInv K Lay :=
  sorry

/-- Local–global compatibility of the fundamental class. ⚠ This is a *later comparison* theorem,
stated once the class formation exists; it may not be used in the construction of
`globalClassFormation`, whose invariant is `globalInv` by definition. The local components of any
idele-layer lift of the global fundamental class sum to `1/[L:K]`. -/
theorem ideleSumLocalInv_fundamentalClass
    (Lay : NormalLayer (TauCeti.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2)
    (hx : ideleToClassH2 K Lay x = (globalClassFormation K).fundamentalClass Lay) :
    ideleSumLocalInv K Lay x = fundamentalInvariant Lay.degree := by
  rw [← globalInv_ideleToClassH2, hx, ← globalClassFormation_inv,
    ClassFormation.inv_fundamentalClass]

/-- The normal layer associated to a finite Galois extension `L/K`. -/
noncomputable def globalLayer [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    NormalLayer (TauCeti.AbsoluteGaloisGroup K) :=
  sorry

/-- Principal ideles, on the carrier owned by `GlobalNumberFields`. -/
noncomputable def principalIdele (F : Type) [Field F] [NumberField F] :
    Fˣ →* GlobalNumberFields.IdeleGroup F :=
  sorry

/-- The idele class group is commutative. Recorded as an instance so that quotients by norm
subgroups need no separate normality hypothesis; Mathlib's `CommGroup` instance on the quotient
carrier is not found by `IsMulCommutative` search through the `abbrev`. -/
instance instIsMulCommutativeIdeleClassGroup :
    IsMulCommutative (GlobalNumberFields.IdeleClassGroup K) :=
  ⟨⟨fun a b => mul_comm a b⟩⟩

/-- Norm on ideles in a finite extension; no idele carrier is redefined here. -/
noncomputable def ideleNormMap [Module.Finite K L] :
    GlobalNumberFields.IdeleGroup L →* GlobalNumberFields.IdeleGroup K :=
  sorry

/-- The induced norm on idele classes. -/
noncomputable def ideleClassNorm [Module.Finite K L] :
    GlobalNumberFields.IdeleClassGroup L →* GlobalNumberFields.IdeleClassGroup K :=
  sorry

/-- The concrete quotient map on idele classes, written additively. -/
noncomputable def globalNormQuotientMk [Module.Finite K L] :
    Additive (GlobalNumberFields.IdeleClassGroup K) →+
      Additive (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) :=
  MonoidHom.toAdditive (QuotientGroup.mk' (ideleClassNorm K L).range)

/-- Identification of the concrete idele-class norm quotient with the abstract norm quotient. -/
noncomputable def globalNormQuotientEquiv [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) ≃+
      (globalLayer K L iota).NormQuotient (globalFormation K) :=
  sorry

/-- Identification of the abstract finite Galois quotient with `Gal(L/K)`. -/
noncomputable def globalGaloisAbelianizationEquiv [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Abelianization (globalLayer K L iota).Gal) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  sorry

/-- Finite global reciprocity, transparently transported from the abstract Artin equivalence. -/
noncomputable def globalArtinEquiv [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  (globalNormQuotientEquiv K L iota).trans
    (((globalClassFormation K).artinEquiv (globalLayer K L iota)).trans
      (globalGaloisAbelianizationEquiv K L iota))

/-- The finite global Artin map on the idele class group. -/
noncomputable def globalArtinMap [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (GlobalNumberFields.IdeleClassGroup K) →+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  (globalArtinEquiv K L iota).toAddMonoidHom.comp (globalNormQuotientMk K L)

/-- The class of a principal idele in the idele class group is trivial, hence the global Artin map
kills principal ideles; this is the reciprocity law in idelic form. -/
theorem globalArtinMap_principal [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ) :
    globalArtinMap K L iota (Additive.ofMul (QuotientGroup.mk (principalIdele K x))) = 0 :=
  sorry

/-! ### Completions, local factors, and the ideal Artin map -/

/-- Local factor of the global Artin map at a finite place, using the unique local map owned by
this roadmap. -/
noncomputable def localArtinAt (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)] :
    (v.adicCompletion K)ˣ →*
      Field.absoluteGaloisGroupAbelianization (v.adicCompletion K) :=
  artinMap (v.adicCompletion K)

/-- Arithmetic unramified coordinate of the completion-local Artin factor. -/
theorem unramifiedCoordinate_localArtinAt (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)] (x : (v.adicCompletion K)ˣ) :
    unramifiedCoordinate (v.adicCompletion K) (localArtinAt K v x)
      = TauCeti.zHat.ofInt
          (LocalFieldsRamification.normalizedValuation (v.adicCompletion K) x) :=
  unramifiedCoordinate_artinMap (v.adicCompletion K) x

/-- The idele class of a prime idele at `v`: a uniformizer at `v` and `1` elsewhere. Its Artin
image at an unramified place does not depend on the uniformizer. -/
noncomputable def primeIdeleClass (v : HeightOneSpectrum (𝓞 K)) :
    GlobalNumberFields.IdeleClassGroup K :=
  sorry

omit [NumberField K] [NumberField L] in
/-- The sole adapter from an abelian-Galois hypothesis to the supplier's explicit commutativity
argument. -/
theorem algEquiv_commute_of_isAbelianGalois [IsAbelianGalois K L] :
    ∀ σ τ : L ≃ₐ[K] L, Commute σ τ :=
  fun σ τ => IsMulCommutative.is_comm.comm σ τ

/-- The finite-level ideal Artin map is exactly the `NumberFieldArithmetic` map. -/
noncomputable abbrev abelianArtinHomAway [IsAbelianGalois K L]
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q) :
    NumberFieldArithmetic.idealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  NumberFieldArithmetic.artinHomAway (L := L)
    (algEquiv_commute_of_isAbelianGalois K L) S hur

/-- **Comparison with the ideal-theoretic Artin map.** At every unramified finite prime `v`, the
class-field-theory Artin symbol of the prime idele at `v` is the value of
`NumberFieldArithmetic.artinHomAway` on the prime `v`, i.e. the arithmetic Frobenius at `v`. -/
theorem globalArtinMap_ideal [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q)
    (v : HeightOneSpectrum (𝓞 K)) (hv : v ∉ S)
    (I : NumberFieldArithmetic.idealsAway (K := K) S)
    (hI : ((I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) =
      (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K)) :
    globalArtinMap K L iota (Additive.ofMul (primeIdeleClass K v)) =
      Additive.ofMul (Abelianization.of (abelianArtinHomAway K L S hur I)) :=
  sorry

/-- The Artin symbol of an unramified prime is arithmetic Frobenius. -/
theorem globalArtinMap_isArithFrobAt [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    (hQ : Algebra.IsUnramifiedAt (𝓞 K) Q) (σ : L ≃ₐ[K] L)
    (hσ : globalArtinMap K L iota (Additive.ofMul (primeIdeleClass K v)) =
      Additive.ofMul (Abelianization.of σ)) :
    IsArithFrobAt (𝓞 K) σ Q :=
  sorry

/-- The idele class of a local unit at `v`: `x` at `v` and `1` at every other place. -/
noncomputable def ideleClassOfLocal (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K)ˣ →* GlobalNumberFields.IdeleClassGroup K :=
  sorry

/-- The map from the abelianized local Galois group at `v` to `Gal(L/K)^ab`, through the
decomposition group of a chosen place above `v`; independent of the choice up to conjugation, which
is invisible in the abelianization. -/
noncomputable def decompositionRestrict [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (v : HeightOneSpectrum (𝓞 K)) :
    Field.absoluteGaloisGroupAbelianization (v.adicCompletion K) →*
      Abelianization (L ≃ₐ[K] L) :=
  sorry

/-- The characterizing equation of `decompositionRestrict`: for a `K`-embedding `j` of `L` into an
algebraic closure of `K_v`, that is a place of `L` above `v`, the class of `τ` goes to the class of
the automorphism `σ` of `L` with `j ∘ σ = τ ∘ j`. Every `j` gives the same value. -/
theorem decompositionRestrict_mk [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (v : HeightOneSpectrum (𝓞 K))
    (j : L →ₐ[K] AlgebraicClosure (v.adicCompletion K))
    (τ : Field.absoluteGaloisGroup (v.adicCompletion K)) (σ : L ≃ₐ[K] L)
    (_hσ : ∀ y : L, j (σ y) = τ.toRingEquiv (j y)) :
    decompositionRestrict K L iota v (QuotientGroup.mk τ) = Abelianization.of σ :=
  sorry

/-- The global map restricted at a finite place is the local Artin map: the local factor of the
global reciprocity map is `localArtinAt`, transported through the decomposition group. -/
theorem globalArtinMap_local [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (v : HeightOneSpectrum (𝓞 K)) [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)]
    (x : (v.adicCompletion K)ˣ) :
    globalArtinMap K L iota (Additive.ofMul (ideleClassOfLocal K v x)) =
      Additive.ofMul (decompositionRestrict K L iota v (localArtinAt K v x)) :=
  sorry

/-! ### Global acceptance tests -/

/-- Quadratic global test: for a quadratic extension `L/K` and a prime unramified in it, the
Artin symbol is the nontrivial automorphism exactly when the prime is inert, i.e. when the
residue degree is `2`; it is trivial exactly when the prime splits. The extension is pinned by
its degree and the prime by its residue degree, so no square root has to be chosen here. -/
theorem globalArtinMap_quadratic_prime [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (hdegree : Module.finrank K L = 2)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1)
    (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    (hQ : Algebra.IsUnramifiedAt (𝓞 K) Q) :
    globalArtinMap K L iota (Additive.ofMul (primeIdeleClass K v)) =
        Additive.ofMul (Abelianization.of τ) ↔
      Q.inertiaDeg (𝓞 K) = 2 :=
  sorry

/-- The cyclotomic test, `m ≥ 1` and `ℓ ∤ m`: the Artin symbol of `(ℓ)` in `ℚ(ζ_m)/ℚ` acts on
`ζ_m` by `ζ_m ↦ ζ_m^ℓ`. This is a direct test that the roadmap uses arithmetic rather than
geometric Frobenius; a quadratic example alone cannot distinguish an automorphism from its
inverse. -/
theorem globalArtinMap_cyclotomic_prime (m : ℕ) [NeZero m]
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {m} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (ζ : E) (_hζ : IsPrimitiveRoot ζ m)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ¬ ℓ ∣ m)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ ℓ :=
  sorry

/-- The `ℚ(i)` test, `m = 4`: primes `ℓ ≡ 1 mod 4` have trivial Artin symbol and primes
`ℓ ≡ 3 mod 4` map to complex conjugation, i.e. `Art((ℓ))(i) = i^ℓ`. -/
theorem globalArtinMap_Qi_prime
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {4} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (i : E) (_hi : IsPrimitiveRoot i 4)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    (ℓ % 4 = 1 → σ = 1) ∧ (ℓ % 4 = 3 → σ i = -i) :=
  sorry

/-- The `ℚ(√5)` test: `ℓ ≡ ±1 mod 5` splits and `ℓ ≡ ±2 mod 5` is inert, so the Artin symbol is
trivial in the first case and the nontrivial automorphism in the second. -/
theorem globalArtinMap_Qsqrt5_prime
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [Module.Finite ℚ E]
    [IsAbelianGalois ℚ E] (hdegree : Module.finrank ℚ E = 2)
    (s : E) (hs : s * s = 5)
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    (ℓ % 5 = 1 ∨ ℓ % 5 = 4 → σ = 1) ∧ (ℓ % 5 = 2 ∨ ℓ % 5 = 3 → σ s = -s) :=
  sorry

/-- The two `ℚ(ζ₅)` values that certify a non-involutive Artin symbol: `Art((2))(ζ₅) = ζ₅²`, of
order four. -/
theorem globalArtinMap_zeta5_two
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {5} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (ζ : E) (_hζ : IsPrimitiveRoot ζ 5)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(2 : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ 2 ∧ σ ^ 4 = 1 ∧ σ ^ 2 ≠ 1 :=
  sorry

/-- Compatibility of the cyclotomic and quadratic tests: restriction of the Artin symbol of `(ℓ)`
from `ℚ(ζ₅)` to `ℚ(√5)` is trivial exactly when `ℓ` is a square modulo `5`. -/
theorem globalArtinMap_zeta5_restrict_Qsqrt5
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {5} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (M : IntermediateField ℚ E) (hM : Module.finrank ℚ M = 2)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    (∀ x : M, σ x = x) ↔ (ℓ % 5 = 1 ∨ ℓ % 5 = 4) :=
  sorry

/-! ### The cyclotomic normalization of the absolute local Artin map

A consequence of global reciprocity over `ℚ` and not of anything local: these two theorems are
stated after the global acceptance tests because their proof is global, and they mention no
global variable. -/

/-- **The cyclotomic normalization at `ℚ_p`**: `χ_cyc(Art_{ℚ_p}(u)) = u⁻¹` for `u ∈ ℤ_pˣ`. Proof,
for `E = ℚ(ζ_{pⁿ})` and `d = [E_𝔭 : ℚ_p]` at the prime `𝔭` above `p`: by
`LocalFieldsRamification.isOpen_range_powMonoidHom` the subgroup `(ℚ_pˣ)^d` contains `1 + pᴺℤ_p`
for some `N ≥ n`, and it lies in the norm group of `E_𝔭` because `ℚ_pˣ/N(E_𝔭ˣ)` has exponent
dividing `d` (`localArtinEquiv`); so for a positive integer `a ≡ u mod pᴺ` the local symbols of `u`
and `a` agree on `E_𝔭`. The idele of `a` at `p` is the principal idele of `a`, whose symbol is
trivial (`globalArtinMap_principal`), times the ideles of `a⁻¹` at `∞` and at the primes `ℓ ∣ a`
and a unit idele at the other primes `ℓ ≠ p`, all unramified in `E`. The unit idele is an idelic
norm and `a⁻¹ > 0` is a norm from `ℂ`, while at `ℓ ∣ a` the symbol is `Frob_ℓ^{-v_ℓ(a)}`
(`globalArtinMap_local`, `decompositionRestrict_mk`, `localArtinMap_eq_frobenius_pow_valuation`),
where `Frob_ℓ` acts on `ζ_{pⁿ}` by `ζ ↦ ζ^ℓ` (`localArtinMap_cyclotomic_uniformizer`). So
`Art_{ℚ_p}(u)` acts on `ζ_{pⁿ}` by `ζ ↦ ζ^{a⁻¹} = ζ^{u⁻¹}`. The completion `v.adicCompletion ℚ` is
compared with `ℚ_[p]` by `artinMap_congr` and Mathlib's
`Rat.HeightOneSpectrum.adicCompletion.padicEquiv`. -/
theorem cyclotomicCharacter_artinMap_padic (p : ℕ) [Fact p.Prime]
    [IsNonarchimedeanLocalField ℚ_[p]] (u : ℤ_[p]ˣ)
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = artinMap ℚ_[p] (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom u)) :
    cyclotomicCharacter (AlgebraicClosure ℚ_[p]) p σ.toRingEquiv = u⁻¹ :=
  sorry

/-- **Cyclotomic orientation with the required field norm**: for `F/ℚ_p` finite and a unit `u`,
`χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)⁻¹`. From `cyclotomicCharacter_artinMap_padic` and the norm
functoriality `artinMap_norm` over `ℚ_p`, since the cyclotomic character of `G_F` is that of
`G_{ℚ_p}` read through `absoluteGaloisGroupExtend` (`cyclotomicCharacter.spec` on the roots of
unity). -/
theorem cyclotomicCharacter_artinMap (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (u : Fˣ) (_hu : ValuativeRel.valuation F (u : F) = 1)
    (σ : Field.absoluteGaloisGroup F)
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F) = artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom
        (cyclotomicCharacter (AlgebraicClosure F) p σ.toRingEquiv)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ :=
  sorry

/-! ## Layer 12: separate arithmetic global existence, the norm index, and the global
class-field correspondence

As on the local side, `globalAbelianExistence` is an arithmetic theorem about the idele-class
formation, not a formal consequence of an arbitrary `ClassFormation`, and the endpoint is the
correspondence `globalClassFieldCorrespondence` rather than existence: by
`globalNormSubgroup_maximalAbelianLayer` a layer and its maximal abelian sublayer have the same
idele-class norm subgroup, so `globalExistence` alone names nothing.

⚠ Everything in this layer is for a **number field**: the carriers are `GlobalNumberFields`'
number-field idele and idele-class groups, and the section's `NumberField K` hypothesis is
load-bearing. Global class field theory for one-variable function fields over finite fields is
outside this roadmap.
-/

/-! ### Admissible moduli and ray-class reciprocity

A homomorphism `RayClassGroup 𝔪 →* Gal(L/K)` satisfying the splitting law exists only when the
conductor of `L/K` divides `𝔪`, so the modulus is constrained *before* the map is written down.
⚠ For `ℚ(i)/ℚ` and the trivial modulus the ray class group of `ℚ` is trivial, while the unramified
prime `3` has nontrivial Artin symbol, so no such map exists. The support condition — every ramified
prime divides `𝔪` — is necessary but not sufficient: for the finite modulus `(4)` without the real
place the ray class group `(ℤ/4)ˣ/{±1}` is again trivial, so the conductor exponents and the real
places matter, and the conductor of `ℚ(i)/ℚ` is `(4)·∞`. -/

/-- **Admissibility of a modulus for a finite extension**: the ray subgroup of `𝔪` lies in the
idele-class norm subgroup of `L/K`. Classically this is "the conductor of `L/K` divides `𝔪`";
through `globalArtinMap` it says that the Artin map kills the ray of `𝔪`, which is exactly what
lets it descend to `RayClassGroup 𝔪`. -/
def IsAdmissibleModulus [Module.Finite K L] (𝔪 : GlobalNumberFields.Modulus K) : Prop :=
  GlobalNumberFields.RaySubgroup 𝔪 ≤ (ideleClassNorm K L).range

/-- An admissible modulus is divisible by every prime ramified in `L`: the support condition is a
consequence of admissibility, not a substitute for it. -/
theorem IsAdmissibleModulus.mem_support_of_ramified [Module.Finite K L]
    {𝔪 : GlobalNumberFields.Modulus K} (h𝔪 : IsAdmissibleModulus K L 𝔪)
    (v : HeightOneSpectrum (𝓞 K))
    (hv : ∃ (Q : Ideal (𝓞 L)) (_ : Q.IsPrime) (_ : Q.LiesOver v.asIdeal),
      ¬ Algebra.IsUnramifiedAt (𝓞 K) Q) :
    v ∈ 𝔪.support :=
  sorry

/-- Admissibility is monotone under divisibility of moduli, because the ray subgroup shrinks as
the modulus grows. -/
theorem IsAdmissibleModulus.of_dvd [Module.Finite K L]
    {𝔪 𝔫 : GlobalNumberFields.Modulus K} (h𝔪 : IsAdmissibleModulus K L 𝔪) (h : 𝔪 ∣ 𝔫) :
    IsAdmissibleModulus K L 𝔫 :=
  sorry

/-- **The conductor of a finite abelian extension**: the smallest admissible modulus. -/
noncomputable def abelianConductor [Module.Finite K L] [IsAbelianGalois K L] :
    GlobalNumberFields.Modulus K :=
  sorry

theorem isAdmissibleModulus_abelianConductor [Module.Finite K L] [IsAbelianGalois K L] :
    IsAdmissibleModulus K L (abelianConductor K L) :=
  sorry

/-- **The characterization of admissibility**: a modulus is admissible exactly when the conductor
divides it. -/
theorem isAdmissibleModulus_iff_abelianConductor_dvd [Module.Finite K L] [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) :
    IsAdmissibleModulus K L 𝔪 ↔ abelianConductor K L ∣ 𝔪 :=
  sorry

/-- The trivial modulus is **not** admissible for `ℚ(i)/ℚ`: the `ℚ(i)`, `ℓ = 3` trap in its final
form. The conductor is `(4)·∞`, with the infinite part the one real place of `ℚ`. -/
theorem not_isAdmissibleModulus_one_Qi
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {4} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E] :
    ¬ IsAdmissibleModulus ℚ E (GlobalNumberFields.Modulus.one ℚ) :=
  sorry

/-- Reciprocity on the imported ray-class carrier, for an admissible modulus. The admissibility
proof is an argument of the definition, so the map cannot be written down for a modulus at which
it does not exist. -/
noncomputable def rayClassArtinMap [Module.Finite K L] [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) (h𝔪 : IsAdmissibleModulus K L 𝔪) :
    GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L) :=
  sorry

/-- **The splitting law**: on the class of an unramified prime coprime to the modulus, the
ray-class reciprocity map is the Artin symbol of that prime.
⚠ Without this, `rayClassArtinMap` is a `def` with no characterising equation and constrains
nothing — a consumer counting primes by their Frobenius cannot connect the two. `ZerosOfLFunctions`
Layer 8.8 states its reciprocity dictionary as an explicit hypothesis precisely because this law
was missing; with it, that hypothesis is discharged here rather than assumed there, for every
admissible modulus. -/
theorem rayClassArtinMap_idealClass [Module.Finite K L] [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) (h𝔪 : IsAdmissibleModulus K L 𝔪)
    (I : GlobalNumberFields.integralIdealsPrimeTo 𝔪)
    [hI : (I : Ideal (𝓞 K)).IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver (I : Ideal (𝓞 K))],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses.mk (rayClassArtinMap K L 𝔪 h𝔪 (GlobalNumberFields.idealClass 𝔪 I)) =
      NumberFieldArithmetic.artinSymbol (K := K) (L := L) (I : Ideal (𝓞 K)) hur :=
  sorry

/-- **Surjectivity of the ray-class reciprocity map.** The companion the same consumers need: the
splitting law identifies the image of one class, this says the classes exhaust the Galois group.
The support condition of the earlier form is now a consequence of admissibility
(`IsAdmissibleModulus.mem_support_of_ramified`). -/
theorem rayClassArtinMap_surjective [Module.Finite K L] [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) (h𝔪 : IsAdmissibleModulus K L 𝔪) :
    Function.Surjective (rayClassArtinMap K L 𝔪 h𝔪) :=
  sorry

/-- The identification of the ground level of the global formation with the idele class group. -/
noncomputable def globalGroundEquiv :
    Additive (GlobalNumberFields.IdeleClassGroup K) ≃+ (globalFormation K).level ⊤ :=
  sorry

/-- **The norm subgroup of `C_K` cut out by an open normal subgroup of `G_K`**: the norm subgroup
of the layer `V ◁ ⊤`, read through `globalGroundEquiv`. -/
noncomputable def globalNormSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    Subgroup (GlobalNumberFields.IdeleClassGroup K) :=
  AddSubgroup.toSubgroup'
    (((NormalLayer.ofOpenNormal V).normSubgroup (globalFormation K)).toAddSubgroup.comap
      (globalGroundEquiv K).toAddMonoidHom)

/-- Idele-class norm subgroups are open. -/
theorem isOpen_globalNormSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    IsOpen ((globalNormSubgroup K V : Subgroup (GlobalNumberFields.IdeleClassGroup K)) :
      Set (GlobalNumberFields.IdeleClassGroup K)) :=
  sorry

/-- Idele-class norm subgroups have finite index. -/
theorem finiteIndex_globalNormSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    (globalNormSubgroup K V).FiniteIndex :=
  sorry

/-- The idele-class norm subgroup is monotone in the layer subgroup, hence reverses inclusion of
fields. -/
theorem globalNormSubgroup_mono
    {V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)} (h : V ≤ W) :
    globalNormSubgroup K V ≤ globalNormSubgroup K W :=
  sorry

/-- **Norm limitation in the concrete global language**: the extension cut out by `V` and its
maximal abelian subextension have the same idele-class norm subgroup. This is the abstract
`ClassFormation.normSubgroup_maximalAbelianLayer` transported through `globalGroundEquiv`, and it
is why `globalExistence` alone cannot name a class field. -/
theorem globalNormSubgroup_maximalAbelianLayer
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    globalNormSubgroup K (maximalAbelianLayer V) = globalNormSubgroup K V := by
  simp only [globalNormSubgroup,
    ClassFormation.normSubgroup_maximalAbelianLayer (globalClassFormation K) V]
  rfl

/-- **Direction acceptance test**, as in the local case: the trivial layer cuts out `K`, whose
idele-class norm subgroup is all of `C_K`. -/
theorem globalNormSubgroup_top : globalNormSubgroup K ⟨⊤, Subgroup.normal_top⟩ = ⊤ :=
  sorry

/-- **The source of the global correspondence:** open subgroups of finite index in `C_K`. -/
abbrev GlobalNormSubgroups : Type :=
  {N : OpenSubgroup (GlobalNumberFields.IdeleClassGroup K) // N.toSubgroup.FiniteIndex}

/-- The idele-class norm subgroup of a layer as an element of the source carrier. -/
noncomputable def globalNormOpenSubgroup
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    GlobalNormSubgroups K :=
  ⟨⟨globalNormSubgroup K V, isOpen_globalNormSubgroup K V⟩, finiteIndex_globalNormSubgroup K V⟩

/-! ### The inputs of global existence

`globalAbelianExistence` is proved by induction on the index, along the route of Milne,
*Class Field Theory*, VII §9 (Lemmas 9.1–9.4 and Theorem 9.5), which is Artin–Tate's: norm
subgroups are closed upward (reciprocity); a subgroup whose preimage under the idele-class norm of
a finite extension is a norm subgroup is itself a norm subgroup (norm limitation); and for
`K ∋ ζ_p` every open subgroup containing the `p`-th powers is a norm subgroup (Kummer theory of
the `S`-units, for `S` large). The inductive step adjoins `ζ_p` by the second input, realizes a
subgroup of index `p` by the third, and passes to the corresponding cyclic extension of degree
`p`, where the index has dropped. Each input is a named target below. None of them is the
Grunwald–Wang theorem, which the existence theorem does not use. -/

/-- **Norm subgroups are closed upward** (Milne VII, Lemma 9.1): a subgroup containing the norm
subgroup of a layer is the norm subgroup of an abelian layer, namely the preimage under the abstract
Artin map of its image in the abelianized Galois group. -/
theorem exists_abelianLayer_globalNormSubgroup_eq_of_le
    (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K))
    (N : Subgroup (GlobalNumberFields.IdeleClassGroup K)) (hN : globalNormSubgroup K V ≤ N) :
    ∃ W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer W ∧ globalNormSubgroup K W = N :=
  sorry

/-- **Descent along a finite extension** (Milne VII, Lemma 9.4): if the preimage of `N` under the
idele-class norm of a finite extension `L/K` is the norm subgroup of an abelian layer of `G_L`, then
`N` is the norm subgroup of an abelian layer of `G_K`. The proof composes the norms, replaces the
resulting layer over `K` by its maximal abelian sublayer using
`globalNormSubgroup_maximalAbelianLayer`, and applies
`exists_abelianLayer_globalNormSubgroup_eq_of_le`. Applied to `L = K(ζ_p)`, this is the
roots-of-unity adjunction of the existence proof. -/
theorem exists_abelianLayer_globalNormSubgroup_eq_of_comap_ideleClassNorm [Module.Finite K L]
    (N : Subgroup (GlobalNumberFields.IdeleClassGroup K))
    (h : ∃ W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup L),
      IsAbelianClassFieldLayer W ∧ globalNormSubgroup L W = N.comap (ideleClassNorm K L)) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ globalNormSubgroup K V = N :=
  sorry

/-- The `S`-units: elements of `Kˣ` that are units at every finite place outside `S`. -/
def IsSUnit (S : Finset (HeightOneSpectrum (𝓞 K))) (a : Kˣ) : Prop :=
  ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → v.valuation K (a : K) = 1

/-- The idele subgroup `E_S = ∏_{v ∈ S} (K_vˣ)^p × ∏_{v ∉ S} U_v` of Milne VII, Lemma 9.3, with the
`p`-th powers also at every infinite place: the finite coordinates at `S` and the infinite
coordinates are `p`-th powers, and the finite coordinates outside `S` are units. -/
noncomputable def kummerIdeleSubgroup (S : Finset (HeightOneSpectrum (𝓞 K))) (p : ℕ) :
    Subgroup (GlobalNumberFields.IdeleGroup K) where
  carrier := {x |
    (∀ v ∈ S, ∃ y : (v.adicCompletion K)ˣ, y ^ p = GlobalNumberFields.ideleFiniteCoord v x) ∧
    (∀ v ∉ S, Valued.v (GlobalNumberFields.ideleFiniteCoord v x : v.adicCompletion K) = 1) ∧
    ∀ w : NumberField.InfinitePlace K, ∃ y : (w.Completion)ˣ,
      y ^ p = GlobalNumberFields.ideleInfiniteCoord w x}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The image of `E_S` in the idele class group. -/
noncomputable def kummerNormSubgroup (S : Finset (HeightOneSpectrum (𝓞 K))) (p : ℕ) :
    Subgroup (GlobalNumberFields.IdeleClassGroup K) :=
  (kummerIdeleSubgroup K S p).map
    (QuotientGroup.mk' (Units.map (algebraMap K (AdeleRing (𝓞 K) K)).toMonoidHom).range)

/-- **The Kummer layer of the `S`-units**: the open normal subgroup of `G_K` cutting out
`K(U(S)^{1/p})`, pinned by `classField_sUnitsKummerLayer`. -/
noncomputable def sUnitsKummerLayer (S : Finset (HeightOneSpectrum (𝓞 K))) (p : ℕ) :
    OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K) :=
  sorry

/-- The characterizing equation of `sUnitsKummerLayer`: the field it cuts out is generated by the
`p`-th roots of the `S`-units. -/
theorem classField_sUnitsKummerLayer (S : Finset (HeightOneSpectrum (𝓞 K))) (p : ℕ) :
    classField K (sUnitsKummerLayer K S p) =
      IntermediateField.adjoin K
        {x : SeparableClosure K | ∃ a : Kˣ, IsSUnit K S a ∧ x ^ p = algebraMap K _ (a : K)} :=
  sorry

/-- For `K ∋ ζ_p` the Kummer layer is abelian: Kummer theory makes its Galois group the dual of
`U(S)/U(S)^p`. -/
theorem isAbelianClassFieldLayer_sUnitsKummerLayer (p : ℕ) [Fact p.Prime]
    (ζ : K) (_hζ : IsPrimitiveRoot ζ p) (S : Finset (HeightOneSpectrum (𝓞 K))) :
    IsAbelianClassFieldLayer (sUnitsKummerLayer K S p) :=
  sorry

/-- Its degree is `p^{|S| + r}`, `r` the number of infinite places: `U(S)` is the product of the
roots of unity, whose number `p` divides, and a free group of rank `|S| + r - 1` (Dirichlet), so
`[U(S) : U(S)^p] = p^{|S| + r}`. -/
theorem degree_sUnitsKummerLayer (p : ℕ) [Fact p.Prime]
    (ζ : K) (_hζ : IsPrimitiveRoot ζ p) (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (NormalLayer.ofOpenNormal (sUnitsKummerLayer K S p)).degree =
      p ^ (S.card + Nat.card (NumberField.InfinitePlace K)) :=
  sorry

/-- **The index of the image of `E_S`** (Milne VII, Lemma 9.3(b)), for `S` containing the primes
above `p` and generating the class group: the local index is `[K_vˣ : (K_vˣ)^p] = p²/‖p‖_v` at
every place, the product over `S` and the infinite places is `p^{2(|S| + r)}` by the product
formula, and the `S`-units cut this down by `[U(S) : U(S)^p] = p^{|S| + r}` — the intersection
`U(S) ∩ E_S = U(S)^p` being the statement that an `S`-unit which is a local `p`-th power at `S`
is a global `p`-th power (Milne VII, Proposition 9.2). -/
theorem index_kummerNormSubgroup (p : ℕ) [Fact p.Prime]
    (ζ : K) (_hζ : IsPrimitiveRoot ζ p) (S : Finset (HeightOneSpectrum (𝓞 K)))
    (_hpS : ∀ v : HeightOneSpectrum (𝓞 K), v.asIdeal ∣ Ideal.span {(p : 𝓞 K)} → v ∈ S)
    (_hS : ∀ c : ClassGroup (𝓞 K), ∃ I : (Ideal (𝓞 K))⁰,
      (∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → ¬ v.asIdeal ∣ (I : Ideal (𝓞 K))) ∧
        ClassGroup.mk0 I = c) :
    (kummerNormSubgroup K S p).index = p ^ (S.card + Nat.card (NumberField.InfinitePlace K)) :=
  sorry

/-- **The norm subgroup of the Kummer layer is the image of `E_S`** (Milne VII, Lemma 9.3):
`E_S ⊆ N(I_L)` because the layer has exponent `p` at the places of `S` and is unramified outside
`S`, and the two indices agree — `index_kummerNormSubgroup` on one side and
`index_globalNormSubgroup` with `degree_sUnitsKummerLayer` on the other. -/
theorem globalNormSubgroup_sUnitsKummerLayer (p : ℕ) [Fact p.Prime]
    (ζ : K) (_hζ : IsPrimitiveRoot ζ p) (S : Finset (HeightOneSpectrum (𝓞 K)))
    (_hpS : ∀ v : HeightOneSpectrum (𝓞 K), v.asIdeal ∣ Ideal.span {(p : 𝓞 K)} → v ∈ S)
    (_hS : ∀ c : ClassGroup (𝓞 K), ∃ I : (Ideal (𝓞 K))⁰,
      (∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → ¬ v.asIdeal ∣ (I : Ideal (𝓞 K))) ∧
        ClassGroup.mk0 I = c) :
    globalNormSubgroup K (sUnitsKummerLayer K S p) = kummerNormSubgroup K S p :=
  sorry

/-- **The key case of global existence** (Milne VII, Lemma 9.3): for `K ∋ ζ_p`, every open
subgroup of `C_K` containing the `p`-th powers is the norm subgroup of an abelian layer. An open
subgroup contains the image of `∏_{v ∈ S} 1 × ∏_{v ∉ S} U_v` for some finite `S`, which may be
enlarged to contain the primes above `p` and to generate the class group, so it contains
`kummerNormSubgroup K S p`, and `exists_abelianLayer_globalNormSubgroup_eq_of_le` applies to
`globalNormSubgroup_sUnitsKummerLayer`. -/
theorem exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem (p : ℕ) [Fact p.Prime]
    (ζ : K) (_hζ : IsPrimitiveRoot ζ p)
    (N : Subgroup (GlobalNumberFields.IdeleClassGroup K))
    (hN : IsOpen (N : Set (GlobalNumberFields.IdeleClassGroup K)))
    (hp : ∀ c : GlobalNumberFields.IdeleClassGroup K, c ^ p ∈ N) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ globalNormSubgroup K V = N :=
  sorry

/-- **The global existence theorem in its final abelian form**: every open finite-index subgroup of
the idele class group of a **number field** is the norm subgroup of a finite **abelian** layer of
the global formation. Global class field theory for one-variable function fields over finite
fields is outside this roadmap; the `NumberField K` hypothesis in the section variables is
load-bearing.

Proof route (Milne VII, Theorem 9.5), by induction on the index of `N`. Choose a prime `p` dividing
the index. By `exists_abelianLayer_globalNormSubgroup_eq_of_comap_ideleClassNorm` applied to
`K(ζ_p)/K` it suffices to treat `K ∋ ζ_p`. Choose `N₁ ⊇ N` of index `p`;
`exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem` realizes `N₁` as the norm subgroup of a
cyclic layer of degree `p`, and the preimage of `N` in the idele classes of that layer's field has
index `[C_K : N]/p`, so it is a norm subgroup by induction; descent along that field finishes.
The three named inputs are the whole of the arithmetic; nothing here uses the Grunwald–Wang
theorem. -/
theorem globalAbelianExistence
    (N : Subgroup (GlobalNumberFields.IdeleClassGroup K))
    (hN : IsOpen (N : Set (GlobalNumberFields.IdeleClassGroup K))) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ globalNormSubgroup K V = N :=
  sorry

/-- The forgetful corollary: some open normal subgroup, not necessarily abelian, has the given
norm subgroup. It is **not** the class-field correspondence, because
`globalNormSubgroup_maximalAbelianLayer` produces a second witness with the same norm subgroup. -/
theorem globalExistence
    (N : Subgroup (GlobalNumberFields.IdeleClassGroup K))
    (hN : IsOpen (N : Set (GlobalNumberFields.IdeleClassGroup K))) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      globalNormSubgroup K V = N :=
  (globalAbelianExistence K N hN).imp fun _ h => h.2

/-- **Uniqueness: distinct finite abelian extensions have distinct idele-class norm subgroups.**
Together with `globalAbelianExistence` this is what makes "the class field attached to `N`" a
definition rather than a choice. -/
theorem globalClassField_unique
    {V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) (hW : IsAbelianClassFieldLayer W)
    (h : globalNormSubgroup K V = globalNormSubgroup K W) :
    V = W :=
  sorry

/-- Global existence on the bundled carrier. -/
theorem exists_globalClassField (N : GlobalNormSubgroups K) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ globalNormSubgroup K V = N.1.toSubgroup :=
  haveI := N.2
  globalAbelianExistence K N.1.toSubgroup N.1.isOpen

/-- **The global class field attached to an open finite-index subgroup `N ≤ C_K`.** It is the
abelian layer produced by `globalAbelianExistence`, unique by `globalClassField_unique`. The
Hilbert, narrow Hilbert, ray and quadratic-order ring class fields are all values of `classField`
at particular norm subgroups, never independent constructions. -/
noncomputable def globalClassField (N : GlobalNormSubgroups K) :
    AbelianLayer (TauCeti.AbsoluteGaloisGroup K) :=
  ⟨(exists_globalClassField K N).choose, (exists_globalClassField K N).choose_spec.1⟩

/-- **The characterizing equation of `globalClassField`:** its norm subgroup is `N`. -/
theorem globalClassField_normSubgroup (N : GlobalNormSubgroups K) :
    globalNormSubgroup K (globalClassField K N).1 = N.1.toSubgroup :=
  (exists_globalClassField K N).choose_spec.2

/-- **The subgroup form of the correspondence's order.** ⚠ As in the local case the inclusions run
the same way on subgroups; the classical order-reversing statement is on fields
(`globalClassField_orderReversing`). -/
theorem globalClassField_le_iff (N₁ N₂ : GlobalNormSubgroups K) :
    N₁ ≤ N₂ ↔ (globalClassField K N₁).1 ≤ (globalClassField K N₂).1 :=
  sorry

/-- **Order reversal, in fields**: `N₁ ≤ N₂` exactly when the class field of `N₂` is contained in
the class field of `N₁`. -/
theorem globalClassField_orderReversing (N₁ N₂ : GlobalNormSubgroups K) :
    N₁ ≤ N₂ ↔
      classField K (globalClassField K N₂).1 ≤ classField K (globalClassField K N₁).1 :=
  (globalClassField_le_iff K N₁ N₂).trans
    (classField_le_classField_iff K (globalClassField K N₁).1 (globalClassField K N₂).1).symm

/-- **The global class-field correspondence for a number field**: an order isomorphism between the
open finite-index subgroups of `C_K` and the finite abelian extensions of `K`, read through
`classField` as the classical order-**reversing** bijection onto fields. -/
noncomputable def globalClassFieldCorrespondence :
    GlobalNormSubgroups K ≃o AbelianLayer (TauCeti.AbsoluteGaloisGroup K) where
  toFun N := globalClassField K N
  invFun V := globalNormOpenSubgroup K V.1
  left_inv N := by
    refine Subtype.ext (OpenSubgroup.toSubgroup_injective ?_)
    exact globalClassField_normSubgroup K N
  right_inv V := by
    refine Subtype.ext (globalClassField_unique K ?_ V.2 ?_)
    · exact (globalClassField K (globalNormOpenSubgroup K V.1)).2
    · exact globalClassField_normSubgroup K (globalNormOpenSubgroup K V.1)
  map_rel_iff' := fun {N₁ N₂} => (globalClassField_le_iff K N₁ N₂).symm

/-- **Composita of abelian layers.** The correspondence is an order isomorphism, so it carries meets
to meets: the norm subgroup of `V ⊓ W`, which cuts out the compositum of the two class fields, is
the intersection of the two norm subgroups.

⚠ Abelianity is load-bearing. For two `D₄`-layers with the same biquadratic subfield, `V ⊓ W` cuts
out a compositum of degree `16` with Galois group `D₄ ×_{C₂²} D₄`, whose commutator subgroup has
order `2`, so its maximal abelian subextension has degree `8`; but the maximal abelian
subextensions of the two factors generate only the biquadratic field, of degree `4`. By norm
limitation the two sides then have indices `8` and `4`, and the formula fails. -/
theorem globalNormSubgroup_inf_of_isAbelian
    {V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) (hW : IsAbelianClassFieldLayer W) :
    globalNormSubgroup K (V ⊓ W) = globalNormSubgroup K V ⊓ globalNormSubgroup K W :=
  sorry

/-- **Intersections of fields.** The norm subgroup of `V ⊔ W`, which cuts out the intersection of
the two fields, is the join of the two norm subgroups; here no abelianity is needed, because the
maximal abelian sublayer of a join is the join of the maximal abelian sublayers. -/
theorem globalNormSubgroup_sup
    (V W : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    globalNormSubgroup K (V ⊔ W) = globalNormSubgroup K V ⊔ globalNormSubgroup K W :=
  sorry

/-- **The canonical quotient identification `C_K / N_{L/K}(C_L) ≃ Gal(L/K)`** for an abelian layer.
As in the local case the target is the Galois group of the layer, not an abelianization. -/
noncomputable def globalAbelianGaloisEquiv
    {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) :
    GlobalNumberFields.IdeleClassGroup K ⧸ globalNormSubgroup K V ≃*
      (NormalLayer.ofOpenNormal V).Gal :=
  sorry

/-- **The characterizing equation of `globalAbelianGaloisEquiv`:** composed with
`Abelianization.of` it is the abstract Artin map of the layer, so it is reciprocity and not an
arbitrary isomorphism of two finite groups of the same order. -/
theorem globalAbelianGaloisEquiv_artinMap
    {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) (c : GlobalNumberFields.IdeleClassGroup K) :
    Additive.ofMul (Abelianization.of (globalAbelianGaloisEquiv K hV (QuotientGroup.mk c))) =
      (globalClassFormation K).artinMap (NormalLayer.ofOpenNormal V)
        (globalGroundEquiv K (Additive.ofMul c)) :=
  sorry

/-- **The index equality `[C_K : N_{L/K}(C_L)] = [L : K]`** for an abelian layer; the layer form of
`card_ideleClassNormQuotient`. -/
theorem index_globalNormSubgroup
    {V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)}
    (hV : IsAbelianClassFieldLayer V) :
    (globalNormSubgroup K V).index = (NormalLayer.ofOpenNormal V).degree :=
  (Subgroup.index_eq_card _).trans (Nat.card_congr (globalAbelianGaloisEquiv K hV).toEquiv)

/-- **The canonical quotient identification `C_K / N ≃ Gal(L/K)`** for the class field `L` attached
to `N`. -/
noncomputable def globalClassFieldGaloisEquiv (N : GlobalNormSubgroups K) :
    GlobalNumberFields.IdeleClassGroup K ⧸ N.1.toSubgroup ≃*
      (NormalLayer.ofOpenNormal (globalClassField K N).1).Gal :=
  (QuotientGroup.quotientMulEquivOfEq (globalClassField_normSubgroup K N).symm).trans
    (globalAbelianGaloisEquiv K (globalClassField K N).2)

/-- **The index equality `[C_K : N] = [L : K]`.** -/
theorem globalClassField_index (N : GlobalNormSubgroups K) :
    N.1.toSubgroup.index = (NormalLayer.ofOpenNormal (globalClassField K N).1).degree :=
  (globalClassField_normSubgroup K N) ▸ index_globalNormSubgroup K (globalClassField K N).2

/-- The Galois group of the field cut out by an open normal subgroup is the layer's Galois group:
Tau Ceti's `galClassFieldEquiv`. Composed with `globalClassFieldGaloisEquiv` it gives
`Gal(L/K) ≃ C_K / N` for the class field of `N`, and it is how the ray-class, Hilbert and
ring-class Galois groups below are computed. -/
noncomputable example (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    Gal(classField K V/K) ≃* (NormalLayer.ofOpenNormal V).Gal :=
  galClassFieldEquiv V

/-- The norm-index theorem for finite abelian extensions: `[C_K : N C_L] = [L:K]`. -/
theorem card_ideleClassNormQuotient [Module.Finite K L] [IsAbelianGalois K L] :
    Nat.card (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) =
      Module.finrank K L :=
  sorry

/-! ## Layer 13: norm theorems and class fields -/

/-- **Frozen public name.** For a cyclic extension, being a global norm is equivalent to the
principal idele being an idele norm, hence to being a norm at every place. -/
theorem cyclicHasseNorm [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      principalIdele K x ∈ MonoidHom.range (ideleNormMap K L) :=
  sorry

/-- The norm map of the finite étale algebra obtained from `L/K` at a finite place. Using the
scalar extension, rather than choosing a place of `L` above `v`, retains every local factor. -/
noncomputable def finiteLocalNormMap [Module.Finite K L]
    (v : HeightOneSpectrum (RingOfIntegers K)) :
    (v.adicCompletion K ⊗[K] L)ˣ →* (v.adicCompletion K)ˣ :=
  sorry

/-- The norm map of the finite étale algebra obtained from `L/K` at an infinite place. The
canonical carrier `w.Completion` is Mathlib's completion of `K` at `w`; in particular the real
and complex cases are not encoded by a second roadmap-local notion of infinite place. -/
noncomputable def infiniteLocalNormMap [Module.Finite K L]
    (w : NumberField.InfinitePlace K) :
    (w.Completion ⊗[K] L)ˣ →* w.Completionˣ :=
  sorry

/-- A principal element is a norm at the finite place `v`, stated on the canonical finite local
étale algebra `K_v ⊗_K L`. -/
def IsFiniteLocalNorm [Module.Finite K L]
    (v : HeightOneSpectrum (RingOfIntegers K)) (x : Kˣ) : Prop :=
  Units.map (algebraMap K (v.adicCompletion K)).toMonoidHom x ∈
    MonoidHom.range (finiteLocalNormMap K L v)

/-- A principal element is a norm at the infinite place `w`, stated on Mathlib's canonical
completion and the full étale algebra `K_w ⊗_K L`. -/
def IsInfiniteLocalNorm [Module.Finite K L]
    (w : NumberField.InfinitePlace K) (x : Kˣ) : Prop :=
  Units.map (algebraMap K w.Completion).toMonoidHom x ∈
    MonoidHom.range (infiniteLocalNormMap K L w)

/-- At a complex place the local norm condition is automatic. This theorem is recorded rather
than silently omitting complex places from `IsLocalNormEverywhere`. -/
theorem isInfiniteLocalNorm_of_isComplex [Module.Finite K L]
    (w : NumberField.InfinitePlace K) (hw : w.IsComplex) (x : Kˣ) :
    IsInfiniteLocalNorm K L w x :=
  sorry

/-- Genuine placewise spelling of “a norm everywhere”: every finite completion and every
archimedean completion occurs explicitly. -/
def IsLocalNormEverywhere [Module.Finite K L] (x : Kˣ) : Prop :=
  (∀ v : HeightOneSpectrum (RingOfIntegers K), IsFiniteLocalNorm K L v x) ∧
    ∀ w : NumberField.InfinitePlace K, IsInfiniteLocalNorm K L w x

/-- **The placewise description of the idelic norm, for an arbitrary idele**, stated against
the supplier's coordinate projections `GlobalNumberFields.ideleFiniteCoord` and
`ideleInfiniteCoord`. The principal case is the theorem below; Global Quadratic Forms' kernel
computation for `i ↦ ∏_v (i_v, b_v)_v` needs this one on `N(I_E)`, where the ideles are not
principal. Both directions are used: forward projects a norm to each coordinate; the converse
assembles local preimages, using that an unramified extension has surjective norm on local units
at all but finitely many finite places. -/
theorem mem_range_ideleNormMap_iff [Module.Finite K L]
    (i : GlobalNumberFields.IdeleGroup K) :
    i ∈ MonoidHom.range (ideleNormMap K L) ↔
      (∀ v : HeightOneSpectrum (RingOfIntegers K),
          GlobalNumberFields.ideleFiniteCoord v i ∈
            MonoidHom.range (finiteLocalNormMap K L v)) ∧
        ∀ w : NumberField.InfinitePlace K,
          GlobalNumberFields.ideleInfiniteCoord w i ∈
            MonoidHom.range (infiniteLocalNormMap K L w) := sorry

/-- Local-coordinate bridge for the idelic norm. Its proof projects an idele norm to each local
factor in the forward direction. Conversely it chooses local preimages, uses that an unramified
extension has surjective norm on local units at all but finitely many finite places, and assembles
the resulting restricted product; the real and complex archimedean factors are handled separately.
This is the public theorem consumers use to cross between ideles and placewise norm equations. -/
theorem principalIdele_mem_range_ideleNormMap_iff [Module.Finite K L] (x : Kˣ) :
    principalIdele K x ∈ MonoidHom.range (ideleNormMap K L) ↔
      IsLocalNormEverywhere K L x :=
  sorry

/-- The cyclic Hasse norm theorem in the local-norm spelling used by quadratic-form consumers. -/
theorem isGlobalNorm_iff_isLocalNormEverywhere [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      IsLocalNormEverywhere K L x :=
  (cyclicHasseNorm K L x).trans (principalIdele_mem_range_ideleNormMap_iff K L x)

/-! ### The named class fields

Every class field named below is a value of `classField` at a value of `globalClassField`: none of
them is an independent construction and none of them substitutes for the correspondence. What each
one contributes is its own *norm subgroup* — the arithmetic input — after which the field, its
Galois group and its degree come from Layer 12. -/

/-- The ray subgroup of a modulus is open in `C_K`: it is the image of the open idelic congruence
subgroup `GlobalNumberFields.IdeleCongruenceSubgroup 𝔪`. -/
theorem isOpen_raySubgroup (𝔪 : GlobalNumberFields.Modulus K) :
    IsOpen ((GlobalNumberFields.RaySubgroup 𝔪 : Subgroup (GlobalNumberFields.IdeleClassGroup K)) :
      Set (GlobalNumberFields.IdeleClassGroup K)) :=
  sorry

/-- The ray subgroup has finite index: it is the kernel of `GlobalNumberFields.rayClassQuotient`,
which is surjective onto the finite `RayClassGroup 𝔪`. -/
theorem finiteIndex_raySubgroup (𝔪 : GlobalNumberFields.Modulus K) :
    (GlobalNumberFields.RaySubgroup 𝔪).FiniteIndex :=
  sorry

/-- The ray subgroup as an element of the source carrier of the global correspondence. -/
noncomputable def rayNormSubgroup (𝔪 : GlobalNumberFields.Modulus K) : GlobalNormSubgroups K :=
  ⟨⟨GlobalNumberFields.RaySubgroup 𝔪, isOpen_raySubgroup K 𝔪⟩, finiteIndex_raySubgroup K 𝔪⟩

/-- **The ray class field of a modulus**: the class field of the ray subgroup. -/
noncomputable def rayClassField (𝔪 : GlobalNumberFields.Modulus K) :
    IntermediateField K (SeparableClosure K) :=
  classField K (globalClassField K (rayNormSubgroup K 𝔪)).1

/-- **Admissibility in terms of the ray class field**: `𝔪` is admissible for `L/K` exactly when
`L` embeds in the ray class field of `𝔪`. This is `globalClassField_orderReversing` applied to the
ray subgroup and to the norm subgroup of `L`; it is also why the ray class field is the largest
abelian extension of conductor dividing `𝔪`. -/
theorem isAdmissibleModulus_iff_le_rayClassField [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (𝔪 : GlobalNumberFields.Modulus K) :
    IsAdmissibleModulus K L 𝔪 ↔ iota.fieldRange ≤ rayClassField K 𝔪 :=
  sorry

/-- **The Hilbert class field**: the ray class field of the trivial modulus. Defined for every
number field, in every degree; only the *ring* class field of a nonmaximal order is restricted to
the quadratic case. -/
noncomputable def hilbertClassField : IntermediateField K (SeparableClosure K) :=
  rayClassField K (GlobalNumberFields.Modulus.one K)

/-- **The narrow Hilbert class field**: the ray class field of `GlobalNumberFields.narrowModulus`,
the modulus that is trivial at the finite places and carries every real place. -/
noncomputable def narrowHilbertClassField : IntermediateField K (SeparableClosure K) :=
  rayClassField K (GlobalNumberFields.narrowModulus K)

/-- The Galois group of the ray class field of `𝔪` is the ray class group of `𝔪`: the composite of
`galClassFieldEquiv`, `globalClassFieldGaloisEquiv` and
`GlobalNumberFields.ker_rayClassQuotient`. -/
theorem gal_rayClassField_equiv_rayClassGroup (𝔪 : GlobalNumberFields.Modulus K) :
    Nonempty ((rayClassField K 𝔪 ≃ₐ[K] rayClassField K 𝔪) ≃*
      GlobalNumberFields.RayClassGroup 𝔪) :=
  sorry

/-- The Galois group of the Hilbert class field is the class group: the modulus-`1` case of
`gal_rayClassField_equiv_rayClassGroup`. -/
theorem gal_hilbertClassField_equiv_classGroup :
    Nonempty ((hilbertClassField K ≃ₐ[K] hilbertClassField K) ≃* ClassGroup (𝓞 K)) :=
  sorry

/-- **The idelic ring-class quotient of an order in a quadratic field.** This is the one piece of
arithmetic the ring class field needs beyond the correspondence: it factors through
`GlobalNumberFields.rayClassQuotient` at the conductor and divides out the ray classes represented
by ideals with a rational generator, so that its target is `GlobalNumberFields.Pic O`, the group of
classes of **invertible proper** fractional ideals; raw proper ideals in the ideal class monoid do
not enter.

⚠ The hypothesis `hK : Module.finrank ℚ K = 2` is load-bearing, not decoration. The congruence
description of `Pic O` needs `O = ℤ + 𝔣𝒪_K`, which is exactly what holds for every order in a
quadratic field and fails in higher degree: in a cubic field `ℤ + f𝒪_K` has index `f²`, so orders
of index `f` are not of that form, and `Pic O` is then not a ray-class quotient of `K` cut out by
the conductor alone. This roadmap asserts no general-order ring class field and imports no
quadratic terminology into higher degrees. Cox, *Primes of the Form x² + ny²*, §7 (Prop. 7.22)
and §9 (Thm. 9.18). -/
noncomputable def ringClassIdeleQuotient (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    GlobalNumberFields.IdeleClassGroup K →* GlobalNumberFields.Pic O :=
  sorry

theorem ringClassIdeleQuotient_surjective (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    Function.Surjective (ringClassIdeleQuotient K O hK) :=
  sorry

theorem isOpen_ker_ringClassIdeleQuotient (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    IsOpen (((ringClassIdeleQuotient K O hK).ker :
      Subgroup (GlobalNumberFields.IdeleClassGroup K)) :
      Set (GlobalNumberFields.IdeleClassGroup K)) :=
  sorry

theorem finiteIndex_ker_ringClassIdeleQuotient (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    (ringClassIdeleQuotient K O hK).ker.FiniteIndex :=
  sorry

/-- The ring-class norm subgroup, as an element of the source carrier of the correspondence. -/
noncomputable def ringClassNormSubgroup (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) : GlobalNormSubgroups K :=
  ⟨⟨(ringClassIdeleQuotient K O hK).ker, isOpen_ker_ringClassIdeleQuotient K O hK⟩,
    finiteIndex_ker_ringClassIdeleQuotient K O hK⟩

/-- **The ring class field of an order in a quadratic field**: the class field of
`ringClassNormSubgroup`. The quadratic hypothesis travels with it. -/
noncomputable def ringClassField (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    IntermediateField K (SeparableClosure K) :=
  classField K (globalClassField K (ringClassNormSubgroup K O hK)).1

/-- The ideal form of reciprocity for a ring class field. Its source is explicitly the supplier's
group of invertible proper fractional ideals, not the type of all proper fractional ideals; in the
quadratic case those are the same by
`GlobalNumberFields.NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`. -/
noncomputable def ringClassArtinMap (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    O.invertibleProperFractionalIdeals →*
      (ringClassField K O hK ≃ₐ[K] ringClassField K O hK) :=
  sorry

/-- Ring-class reciprocity kills exactly the principal classes among the invertible proper
fractional ideals. -/
theorem ringClassArtinMap_eq_one_iff (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2)
    (I : O.invertibleProperFractionalIdeals) :
    ringClassArtinMap K O hK I = 1 ↔ O.mkPic I = 1 :=
  sorry

/-- The ideal-form ring-class Artin map is surjective. -/
theorem ringClassArtinMap_surjective (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    Function.Surjective (ringClassArtinMap K O hK) :=
  sorry

/-- Reciprocity identifies the ring class field Galois group with the imported Picard group: the
composite of `galClassFieldEquiv`, `globalClassFieldGaloisEquiv` and the definition of
`ringClassNormSubgroup` as the kernel of `ringClassIdeleQuotient`. -/
theorem gal_ringClassField_equiv_pic (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    Nonempty ((ringClassField K O hK ≃ₐ[K] ringClassField K O hK) ≃* GlobalNumberFields.Pic O) :=
  sorry

/-- The maximal-order comparison: in a quadratic field the ring class field of the maximal order
is the Hilbert class field, so the two constructions agree where both are defined. By
`globalClassField_unique` it suffices to identify the two norm subgroups. -/
theorem ringClassField_maximal (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) (hO : O.conductor = ⊤) :
    ringClassField K O hK = hilbertClassField K :=
  sorry

/-- Kronecker–Weber, retained as a class-field-theory consequence. -/
theorem kroneckerWeber (E : Type) [Field E] [NumberField E]
    [IsAbelianGalois ℚ E] :
    ∃ n : ℕ, n ≠ 0 ∧ Nonempty (E →ₐ[ℚ] CyclotomicField n ℚ) :=
  sorry

/-! ## Layer 14: Hilbert reciprocity -/

/-- Finite-place cohomological Hilbert invariant, obtained from `localSymbol` at the
completion. -/
noncomputable def finiteHilbertInvariantAt
    (v : HeightOneSpectrum (𝓞 K)) (a b : Kˣ) : ZMod 2 :=
  sorry

/-- Archimedean cohomological Hilbert invariant; it is zero at complex places and detects two
negative arguments at a real place. -/
noncomputable def infiniteHilbertInvariantAt
    (w : InfinitePlace K) (a b : Kˣ) : ZMod 2 :=
  sorry

/-- The finite support of the finite-place Hilbert invariants. -/
noncomputable def finiteHilbertSupport (a b : Kˣ) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem finiteHilbertInvariantAt_eq_zero_of_not_mem
    (a b : Kˣ) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ finiteHilbertSupport K a b) :
    finiteHilbertInvariantAt K v a b = 0 :=
  sorry

/-- **Frozen public name.** Hilbert reciprocity in additive cohomological form. The
multiplicative translation is the product of all local signs being `1`. -/
theorem hilbertProductFormula (a b : Kˣ) :
    (∑ v ∈ finiteHilbertSupport K a b, finiteHilbertInvariantAt K v a b) +
        ∑ w : InfinitePlace K, infiniteHilbertInvariantAt K w a b = 0 :=
  sorry

end Global

end TauCetiRoadmap.ClassFieldTheory
