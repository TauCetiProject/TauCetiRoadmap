import Mathlib
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.FiniteExtension
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.NumberTheory.ClassFieldTheory.ClassField
import TauCeti.NumberTheory.ClassFieldTheory.Brauer.Invariant
import TauCeti.NumberTheory.ClassFieldTheory.Brauer.LocalH2Bound
import TauCeti.NumberTheory.ClassFieldTheory.Brauer.Restriction
import TauCeti.NumberTheory.ClassFieldTheory.Brauer.RootsOfUnity
import TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RingClass.Quotient
import TauCeti.NumberTheory.ClassFieldTheory.FiniteCohomology.DegreeTwo
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Character
import TauCeti.NumberTheory.ClassFieldTheory.Formation.GaloisMaps
import TauCeti.NumberTheory.ClassFieldTheory.Formation.GroundNorm
import TauCeti.NumberTheory.ClassFieldTheory.Formation.PrincipalIdeal
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Tate.Corestriction
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Tate.Cup
import TauCeti.NumberTheory.ClassFieldTheory.Formation.Tate.Restriction
import TauCeti.NumberTheory.ClassFieldTheory.Global.Formation
import TauCeti.NumberTheory.ClassFieldTheory.GlobalExistence.NormSubgroup
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.Local.ClassFormation
import TauCeti.NumberTheory.ClassFieldTheory.Local.CohomologicalDimension.Strict
import TauCeti.NumberTheory.ClassFieldTheory.Local.Conductor.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Local.CyclicClass
import TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.Perfect
import TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.RootsOfUnity
import TauCeti.NumberTheory.ClassFieldTheory.Local.EulerCharacteristic.Theorem
import TauCeti.NumberTheory.ClassFieldTheory.Local.ExplicitCyclotomicSymbol.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.Local.ExplicitCyclotomicSymbol.Norm
import TauCeti.NumberTheory.ClassFieldTheory.Local.ExplicitCyclotomicSymbol.ProductFormula
import TauCeti.NumberTheory.ClassFieldTheory.Local.GeometricArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.Local.HilbertPairing
import TauCeti.NumberTheory.ClassFieldTheory.Local.Reciprocity
import TauCeti.NumberTheory.ClassFieldTheory.Local.Symbol
import TauCeti.NumberTheory.ClassFieldTheory.Local.Unramified
import TauCeti.NumberTheory.ClassFieldTheory.LocalExistence.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.LocalExistence.Conductor
import TauCeti.NumberTheory.ClassFieldTheory.LocalExistence.Correspondence
import TauCeti.NumberTheory.ClassFieldTheory.MuNRep
import TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Reciprocity
import TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Transfer
import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
import TauCeti.NumberTheory.LocalField.GaloisAction
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.NumberTheory.LocalField.Unramified.Coordinate
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.NumberTheory.LocalField.Unramified.ZHat
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Relative
import TauCeti.NumberTheory.NumberField.Global.Orders.Picard
import TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.Norm.LocalNorm
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp
import TauCeti.RepresentationTheory.Homological.TateCohomology.HerbrandQuotient
import TauCeti.RepresentationTheory.Homological.TateCohomology.TrivialityCriterion
import TauCeti.RingTheory.DedekindDomain.AdicValuation.Completion
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.RingTheory.DedekindDomain.SelmerGroup
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
# Class field theory: class formations, Tate's theorem, Artin reciprocity, and their consequences

The normative roadmap is `README.md`. This file is an acceptance test of suggested forms, not an
exhaustive checklist: it states the roadmap's headline targets on Mathlib's and Tau Ceti's own
carriers, together with the declarations other roadmaps consume from it by name. `sorry` marks a
target, never a definition: every definition, abbreviation and instance below has a body.

## Carriers

Everything is in universe `0`, because Mathlib's `tateCohomology` needs the group and the
coefficient ring `ℤ` in one universe. Continuous cohomology is Mathlib's `continuousCohomology` on
`TopRep (ZMod n) (Field.absoluteGaloisGroup F)`; coefficient pairings and the cup product are Tau
Ceti's `TopPairing` and `TopPairing.cup`. Valuations, unit filtrations, norm groups, ramification
groups and the upper numbering are Tau Ceti's (`TauCeti.unitFiltration`, `TauCeti.normGroup`,
`TauCeti.LocalFieldsRamification.upperRamificationGroup`); ideles and idele classes are Mathlib's
`NumberField.IdeleGroup` and `NumberField.IdeleClassGroup`; orders and Picard groups are Tau
Ceti's `TauCeti.GlobalNumberFields.NumberFieldOrder` and `TauCeti.GlobalNumberFields.Pic`.

## Headline inventory

The fourteen numbered items of `README.md` §1 are realized as follows.

1. Tate's theorem: `tateTheorem` and its class-formation form `ClassFormation.tateIso`, with
   `tateIso_cor`; the restriction and tower compatibilities are Tau Ceti's `tateIso_res` and
   `tateIso_res_trans`.
2. Finite Artin reciprocity: `ClassFormation.nakayamaNegTwo`, `artinEquiv` and `artinMap`,
   definitionally the inverse of cup product with the fundamental class; its norm kernel and
   surjectivity are Tau Ceti's `ker_artinMap` and `surjective_artinMap`.
3. Functoriality: `artinMap_groundInclusion`, `artinMap_groundNorm`, `artinMap_conj`,
   `artinMap_quotient`, with the character formula `character_artinMap`.
4. The local Brauer group and the Hilbert symbol: `Br`, `invMap`, `invMap_brRes`, `invMap_brCor`;
   the symbol `localSymbol` at a supplied coordinate and the arithmetic symbol
   `localHilbertSymbol` at the coordinate `invCoordinate` read off the invariant.
5. Local duality: `tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_mixed`,
   `eulerCharacteristic_finrank_fp`.
6. Local reciprocity and its normalizations: `localClassFormation`, `localArtinEquiv`,
   `normResidue`, `localArtinMap_uniformizer`, `cd_p_absoluteGaloisGroup_eq_two`,
   `scd_p_absoluteGaloisGroup_eq_two`, the absolute `artinMap` with `artinMap_restrict`,
   `unramifiedCoordinate_artinMap` and `artinMap_norm`, `cyclotomicCharacter_artinMap`; the
   unit-filtration statements `map_unitFiltration_normResidue`,
   `closure_map_artinMap_unitFiltration` (on `absoluteUpperRamificationGroup`, defined here) and
   `conductorExponent_eq_sInf_upperRamificationGroup`.
7. Norm limitation: `ClassFormation.normSubgroup_maximalAbelianLayer`.
8. Local existence and the local correspondence: Tau Ceti's `localAbelianExistence`,
   `localAbelianExistence_primeToResidueCharacteristic`, `localClassField_unique`,
   `localClassFieldCorrespondence`, `localAbelianGaloisEquiv`, `index_localNormSubgroup`,
   `ker_artinMap_eq_iInf` and `injective_artinMap`, consumed under those names and not restated;
   `localClassFieldCorrespondence_primeToResidueCharacteristic` is a `README.md` target.
9. The local Weil group: Tau Ceti's `localWeilGroup`, `WeilGroup` with its Weil topology
   (`isOpenEmbedding_inertiaToWeil`, `weilTopology_unique`), `weilDegree`, `weilTransfer`,
   `weilRestrict`, `localWeilArtinEquiv` and `localWeilArtinEquiv_compat`.
10. The Brauer sequence and the global invariant: Tau Ceti's `infiniteInvMap`, `finiteInvAt`,
    `infiniteInvAt`, `sumLocalInv`, `exists_br_of_sum_eq_zero`, `ideleToClassH2`,
    `surjective_ideleToClassH2_of_isCyclic`, `exists_refinement_mem_range_ideleToClassH2` and
    `globalInv`; `eq_zero_of_localInv_eq_zero` and `sumLocalInv_eq_zero` are `README.md` targets.
11. Global reciprocity: Tau Ceti's `globalClassFormation`, `globalClassFormation_inv`,
    `globalArtinEquiv`, `globalArtinMap`, `globalArtinMap_principal`, `globalArtinMap_ideal` and
    `globalArtinMap_local`.
12. Global existence: Tau Ceti's `globalAbelianExistence`, `globalClassField_unique`,
    `globalClassFieldCorrespondence`, the three inputs
    `exists_abelianLayer_globalNormSubgroup_eq_of_le`,
    `exists_abelianLayer_globalNormSubgroup_eq_of_comap_ideleClassNorm` and
    `exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem`; here `card_ideleClassNormQuotient`.
13. Norm theorems and class fields: here `cyclicHasseNorm`,
    `isGlobalNorm_iff_isLocalNormEverywhere`, `ringClassField` for every order of every number
    field and `gal_ringClassField_equiv_pic`; Tau Ceti's `ringClassArtinEquiv`,
    `ringClassArtinMap`, `rayClassField`, `hilbertClassField`, `narrowHilbertClassField`,
    `gal_rayClassField_equiv_rayClassGroup`, `IsAdmissibleModulus`, `abelianConductor`,
    `rayClassArtinMap` and `kroneckerWeber`. Two headlines of this item are stated in `README.md`
    only and not in this file: the principal ideal theorem in its arithmetic form (every ideal of
    `𝓞 K` becomes principal in the Hilbert class field), whose abstract form is Tau Ceti's
    `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, and the abelian
    conductor–discriminant formula, whose local form is Tau Ceti's
    `LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent`.
14. Hilbert reciprocity: `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`,
    `finiteHilbertSupport`, `hilbertProductFormula`. Quadratic reciprocity is Mathlib's
    `legendreSym.quadratic_reciprocity`.

## Supplier contracts consumed by name

Besides Mathlib, the file consumes these Tau Ceti declarations, which `README.md` names: the
formation machinery of Layers 1 and 2 (`TauCeti.ClassFieldTheory.Formation`, `NormalLayer`,
`LayerRestriction`, `LayerRefinement`, `ClassFormation`, `cupClass`); the comparison
`TauCeti.absoluteGaloisGroupRestrictEquiv`; `TauCeti.ClassFieldTheory.classField`; the coefficient
objects `muNRep`, `unitsRep`, `tateDual`; the Kummer class `kummerClass` and Kummer equivalences;
the invariant `invMap` with `brRes` and `brCor`; the coordinate `h2MuEquivZMod`; the local class
formation and `localArtinEquiv`; the absolute `artinMap`; `unramifiedCoordinate`;
`conductorExponent`, `conductorIdeal`, `characterConductorExp`; the explicit cyclotomic symbols
`cyclotomicSymbol`, `realCyclotomicSymbol`, `prod_cyclotomicSymbol`, `cyclotomicSymbol_norm_fixes`;
the idele norms `TauCeti.GlobalNumberFields.ideleNormMap` and `ideleClassNormMap`; the local norm
predicates `TauCeti.GlobalNumberFields.IsFiniteLocalNorm`, `IsInfiniteLocalNorm` and
`IsLocalNormEverywhere`; the ring-class quotient `ringClassIdeleQuotient`; and the global norm
subgroup `globalNormSubgroup`.

`README.md` also names these Tau Ceti declarations of the frozen interface, which this file does not
restate: `ClassFormation.artinMap_trivialLayer`, `artinMap_congr`, `artinMap_eq_zero_iff`,
`artinMap_trivialLayer`, `globalClassField_index`, `globalClassField_le_iff`,
`globalClassField_normSubgroup`, `globalClassField_orderReversing`, `kummerCupPairing_bil_comm`,
`localArtinEquiv_eq_of_iota`, `localArtinMap_Q2_zeta5`, `localArtinMap_cyclotomic_uniformizer`,
`localArtinMap_quadratic_eq_hilbertSymbol`, `localArtinMap_quadratic_eq_nontrivial_iff_not_norm`,
`muNRepEquivZMod_generator`, `normResidue_uniformizer`, `tateDualityPairing_tateDualMap`,
`unramifiedCoordinate_mk_eq_gen_iff`, `unramifiedCoordinate_mk_eq_one_iff`,
`unramifiedCoordinate_weilDegree`.

`README.md` targets that this file does not state: `principalIdele_mem_range_ideleNormMap_iff`,
`ringClassField_maximal`.
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

/-! ## Layer 0: cohomological triviality and projective dimension

The theorem of Nakayama and Rim, in the generic Tate-cohomology supplier. Cohomological triviality
of `A : Rep k G` is written out as the conclusion of Tau Ceti's criterion
`TauCeti.TateCohomology.isZero_of_forall_isPGroup`, so the criterion feeds these statements
directly and no predicate is introduced. Mathlib's `tateCohomology` takes the group and the
coefficient ring in one universe. -/

/-- **Submodules of free modules over a principal ideal domain are free**, in any rank (Lang,
*Algebra*, III Theorem 7.1). Mathlib's `Submodule.nonempty_basis_of_pid` is the finite-rank case;
`TateCohomology.projective_ker_of_isZero_res` applies this to kernels of any rank. -/
theorem Submodule.free_of_isPrincipalIdealRing {R M : Type*} [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] [AddCommGroup M] [Module R M] [Module.Free R M]
    (N : Submodule R M) : Module.Free R N :=
  sorry

namespace TateCohomology

universe u

open Rep

variable {k G : Type u} [CommRing k] [Group G] [Finite G]

/-- **Projective modules are cohomologically trivial.** A representation whose `k[G]`-module is
projective has vanishing Tate cohomology on every subgroup in every degree: free modules are
coinduced from the trivial subgroup, and Tate cohomology commutes with direct sums and summands. -/
theorem isZero_res_of_projective (A : Rep k G)
    [Module.Projective (MonoidAlgebra k G) A.ρ.asModule] (S : Subgroup G) [Fintype S] (n : ℤ) :
    Limits.IsZero (tateCohomology (res S.subtype A) n) :=
  sorry

/-- **Projective dimension at most one implies cohomological triviality.** If
`0 → P₁ → P₀ → A → 0` is exact with `P₀` and `P₁` projective over `k[G]`, then `A` is
cohomologically trivial, by `isZero_res_of_projective` and the long exact sequence. -/
theorem isZero_res_of_exact (A : Rep k G) {P₀ P₁ : Type u}
    [AddCommGroup P₀] [Module (MonoidAlgebra k G) P₀] [Module.Projective (MonoidAlgebra k G) P₀]
    [AddCommGroup P₁] [Module (MonoidAlgebra k G) P₁] [Module.Projective (MonoidAlgebra k G) P₁]
    (d : P₁ →ₗ[MonoidAlgebra k G] P₀) (q : P₀ →ₗ[MonoidAlgebra k G] A.ρ.asModule)
    (hd : Function.Injective d) (hdq : Function.Exact d q) (hq : Function.Surjective q)
    (S : Subgroup G) [Fintype S] (n : ℤ) :
    Limits.IsZero (tateCohomology (res S.subtype A) n) :=
  sorry

/-- **`p`-primary Tate cohomology sees only `p`.** If multiplication by a prime `p` is bijective on
`A`, the `p`-primary component of `Ĥⁿ(S, A)` is trivial for every subgroup `S` and every `n`: it is
killed by `#S`, and multiplication by `p` on `A` induces a bijection of it. With the long exact
sequences, a morphism whose kernel and cokernel have bijective multiplication by `p` induces
isomorphisms on the `p`-primary components of Tate cohomology. -/
theorem primaryComponent_tateCohomology_eq_bot (p : ℕ) [Fact p.Prime] (A : Rep k G)
    (hA : Function.Bijective fun x : A.V => (p : k) • x) (S : Subgroup G) [Fintype S] (n : ℤ) :
    AddCommGroup.primaryComponent (tateCohomology (res S.subtype A) n) p = ⊥ :=
  sorry

variable [IsDomain k] [IsPrincipalIdealRing k] [CharZero k]

/-- **Nakayama–Rim, lattice form** (Serre, *Local Fields*, IX §§3–5). Over a principal ideal domain
of characteristic zero in which every prime number is a unit or generates a maximal ideal, a
cohomologically trivial representation that is free over `k`, of any rank, is projective over
`k[G]`. At a prime `p` with `k/pk` a field, `A/pA` is free over `(k/pk)[P]` for every `p`-subgroup
`P`; reducing modulo `p`, `Hom_k(A, A)` becomes a product of coinduced `P`-modules, so it is
cohomologically trivial, the identity is a norm, and `A` is a summand of `k[G] ⊗_k A`. -/
theorem projective_of_isZero_res
    (hk : ∀ p : ℕ, p.Prime → IsUnit (p : k) ∨ (Ideal.span {(p : k)}).IsMaximal)
    (A : Rep k G) [Module.Free k A.V]
    (hA : ∀ (S : Subgroup G) [Fintype S] (n : ℤ),
      Limits.IsZero (tateCohomology (res S.subtype A) n)) :
    Module.Projective (MonoidAlgebra k G) A.ρ.asModule :=
  sorry

/-- **Nakayama–Rim: cohomological triviality is projective dimension at most one** (Rim, Ann. of
Math. 69 (1959); Brown, *Cohomology of Groups*, VI §8). If `A` is cohomologically trivial, the
kernel of every surjection onto it from a projective `k[G]`-module is projective: it is a
`k`-submodule of a free `k`-module, hence free by `Submodule.free_of_isPrincipalIdealRing`, and
cohomologically trivial by the long exact sequence, so `projective_of_isZero_res` applies to it.
No finiteness is assumed, so every cohomologically trivial `A` has a projective resolution of length
one. -/
theorem projective_ker_of_isZero_res
    (hk : ∀ p : ℕ, p.Prime → IsUnit (p : k) ∨ (Ideal.span {(p : k)}).IsMaximal)
    (A : Rep k G)
    (hA : ∀ (S : Subgroup G) [Fintype S] (n : ℤ),
      Limits.IsZero (tateCohomology (res S.subtype A) n))
    {P : Type*} [AddCommGroup P] [Module (MonoidAlgebra k G) P]
    [Module.Projective (MonoidAlgebra k G) P]
    (f : P →ₗ[MonoidAlgebra k G] A.ρ.asModule) (hf : Function.Surjective f) :
    Module.Projective (MonoidAlgebra k G) (LinearMap.ker f) :=
  sorry

end TateCohomology

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

Tate's theorem and the Artin constructions of Layers 3 and 4 are also Tau Ceti's; the aliases
below retain their public roadmap names and use the native maps in every new target. -/

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
noncomputable abbrev tateTheorem (F : Formation G) (L : NormalLayer G) (u : L.H F 2)
    (_h1 : ∀ H : Subgroup L.Gal, Subsingleton ((L.subgroupLayer H).H F 1))
    (_hcard : ∀ H : Subgroup L.Gal, Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H)
    (_hgen : ∀ (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2),
      ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 u)
    (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  TauCeti.ClassFieldTheory.tateTheorem F L u _h1 _hcard _hgen r

/-- The isomorphism of Tate's theorem **is** cup product with `u`, Tau Ceti's `cupClass`, not an
unrelated equivalence between two groups. -/
theorem tateTheorem_toAddMonoidHom (F : Formation G) (L : NormalLayer G) (u : L.H F 2)
    (h1 : ∀ H : Subgroup L.Gal, Subsingleton ((L.subgroupLayer H).H F 1))
    (hcard : ∀ H : Subgroup L.Gal, Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H)
    (hgen : ∀ (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2),
      ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 u)
    (r : ℤ) :
    (tateTheorem F L u h1 hcard hgen r).toAddMonoidHom = cupClass F L u r :=
  TauCeti.ClassFieldTheory.tateTheorem_toAddMonoidHom F L u h1 hcard hgen r

end TateTheorem

namespace ClassFormation

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {F : Formation G}

/-- Tate's theorem for a class formation, in every integer degree: the generic theorem applied to
Tau Ceti's fundamental class, with the three hypotheses discharged by Tau Ceti's three individually
named consequences of the axioms. This is Artin–Tate's Main Theorem (Chapter XIV §4). -/
noncomputable abbrev tateIso (cf : ClassFormation F) (L : NormalLayer G) (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  TauCeti.ClassFieldTheory.ClassFormation.tateIso cf L r

/-- The isomorphism is Tau Ceti's cup product with the fundamental class,
`ClassFormation.cupFundamentalClass`, not an unrelated equivalence between groups of the same
cardinality. A closed proof: `tateIso` is definitionally the generic theorem, so this is the generic
statement, applied. -/
theorem tateIso_toAddMonoidHom (cf : ClassFormation F)
    (L : NormalLayer G) (r : ℤ) :
    (cf.tateIso L r).toAddMonoidHom = cf.cupFundamentalClass L r :=
  tateTheorem_toAddMonoidHom F L (cf.fundamentalClass L) (cf.h1_subgroupLayer L)
    (cf.card_H2_subgroupLayer L) (cf.fundamentalClass_restrict_generates L) r

/-- Compatibility of Tate's theorem with corestriction, through Tau Ceti's
`LayerRestriction.tateCor` and `trivialTateCor`. ⚠ The corestriction square commutes without a
scaling factor, as the restriction square does, but the *inflation* square
of `ClassFormation.fundamentalClass_infl` does not. Asserting one shape for all three is the
standard error here. -/
theorem tateIso_cor (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (r : ℤ)
    (x : small.TrivialTateH r) :
    T.tateCor F (r + 2) (cf.tateIso small r x) =
      cf.tateIso big r (T.trivialTateCor r x) :=
  sorry

/-! ## Layer 4: low Tate degrees and the abstract Artin map

The two low-degree identifications are Tau Ceti's `NormalLayer.tateHMinusTwoEquivAbelianization`
and `NormalLayer.tateHZeroEquivNormQuotient`, and the zero-dimensional class of an element of the
ground level is Tau Ceti's `NormalLayer.zeroTateClass`. -/

/-- The degree `-2 → 0` cup-product direction, the Nakayama map `Γ^ab ≃ A^U / N(A^V)`. -/
noncomputable abbrev nakayamaNegTwo (cf : ClassFormation F) (L : NormalLayer G) :
    Additive (Abelianization L.Gal) ≃+ L.NormQuotient F :=
  TauCeti.ClassFieldTheory.ClassFormation.nakayamaNegTwo cf L

/-- **The Artin reciprocity direction.** Definitionally the inverse of `nakayamaNegTwo`; not a
new opaque choice. -/
noncomputable abbrev artinEquiv (cf : ClassFormation F) (L : NormalLayer G) :
    L.NormQuotient F ≃+ Additive (Abelianization L.Gal) :=
  TauCeti.ClassFieldTheory.ClassFormation.artinEquiv cf L

/-- The Artin map on the ground level, with kernel the norm subgroup. -/
noncomputable abbrev artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    F.level L.ground →+ Additive (Abelianization L.Gal) :=
  TauCeti.ClassFieldTheory.ClassFormation.artinMap cf L

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

end ClassFormation

section Character

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- The connecting class `δχ ∈ Ĥ²(Γ,ℤ)` attached to a character `χ : Γ^ab → ℚ/ℤ` through
`0 → ℤ → ℚ → ℚ/ℤ → 0`. -/
noncomputable abbrev characterConnectingClass (L : NormalLayer G)
    (χ : Additive (Abelianization L.Gal) →+ RatModInt) :
    L.TrivialTateH 2 :=
  L.characterConnectingClass χ

/-- The native Artin character cup `a₀ ∪ δχ ∈ H²(Γ, A^V)`, evaluated on a ground-level
class and a character. The underlying construction is Tau Ceti's bundled additive pairing. -/
noncomputable abbrev artinCharacterCup (F : Formation G) (L : NormalLayer G)
    (a : F.level L.ground) (χ : Additive (Abelianization L.Gal) →+ RatModInt) : L.H F 2 :=
  L.artinCharacterCup F a χ

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
  (TauCeti.ClassFieldTheory.ClassFormation.character_artinMap cf L a χ).symm

/-- Uniqueness: a homomorphism satisfying the character formula for every character is the Artin
map. -/
theorem eq_artinMap_of_character (cf : ClassFormation F) (L : NormalLayer G)
    (φ : F.level L.ground →+ Additive (Abelianization L.Gal))
    (hφ : ∀ (a : F.level L.ground) (χ : Additive (Abelianization L.Gal) →+ RatModInt),
      χ (φ a) = cf.inv L (artinCharacterCup F L a χ)) :
    φ = cf.artinMap L :=
  TauCeti.ClassFieldTheory.ClassFormation.eq_artinMap_of_character cf L φ hφ

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

end ClassFormation
/-! ## Layer 5: local coefficients, the Brauer group, the local invariant, and duality

⚠ The local Brauer group and its invariant map are built **before** the local class formation, not
after it. `localClassFormation` of Layer 6 consumes `invMap`; nothing in this layer may consume
`localArtinMap`, `normResidue`, `localExistence`, or the local class formation itself. -/

/-- Coefficient objects for the absolute Galois group with `ZMod n` scalars: Tau Ceti's `GalRep`,
Mathlib's `TopRep (ZMod n) (Field.absoluteGaloisGroup F)`. -/
abbrev GalRep (n : ℕ) (F : Type) [Field F] : Type 1 :=
  TauCeti.ClassFieldTheory.GalRep n F

/-- `Hⁱ(G_F,A)` on Mathlib's continuous cohomology functor. -/
noncomputable abbrev H (n : ℕ) (F : Type) [Field F]
    (i : ℕ) (A : GalRep n F) : Type _ :=
  continuousCohomology i A

section Local

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-! ### Kummer coefficients, the local Brauer group, and the invariant map

Every coefficient object of this layer is a discrete module of Tau Ceti's Galois cohomology, read
as an object of `GalRep n F` (or of `TopRep ℤ G_F`) through Tau Ceti's coefficient dictionary
`TauCeti.ofDiscreteModule` and restriction along the comparison of absolute Galois groups. Tau Ceti's modules carry the action of the separable-closure group
`TauCeti.AbsoluteGaloisGroup F`, and Mathlib's `Field.absoluteGaloisGroup F` acts on them through
`absoluteGaloisGroupComparison`. No coefficient module is built a second time. -/

/-- Restriction identifies the algebraic-closure and separable-closure absolute Galois groups as
topological groups: Tau Ceti's `absoluteGaloisGroupRestrictEquiv`, whose forward map is
`AlgEquiv.restrictNormalHom` (`absoluteGaloisGroupRestrictEquiv_apply`). The transport is not
definitional over imperfect fields. -/
noncomputable abbrev absoluteGaloisGroupComparison (F : Type) [Field F] :
    Field.absoluteGaloisGroup F ≃ₜ* TauCeti.AbsoluteGaloisGroup F :=
  TauCeti.absoluteGaloisGroupRestrictEquiv F

/-- **The coefficient object `μ_n(Fˢ)`**: Tau Ceti's `muNRep`, the `n`-th roots of unity of the
separable closure written additively, on which `G_F` acts through
`absoluteGaloisGroupComparison`. -/
noncomputable abbrev muNRep (n : ℕ) (F : Type) [Field F] : GalRep n F :=
  TauCeti.ClassFieldTheory.muNRep n F

/-- `μ_n(Fˢ)` is smooth, as an instance argument (Tau Ceti's `isSmoothDiscrete_muNRep`). This is how
the smoothness hypothesis of `finite_H`, local duality and the Euler characteristic is found at
`muNRep n F`. -/
instance instFactIsSmoothDiscreteMuNRep (n : ℕ) (F : Type) [Field F] :
    Fact (TauCeti.IsSmoothDiscrete (ZMod n) (muNRep n F)) :=
  ⟨TauCeti.ClassFieldTheory.isSmoothDiscrete_muNRep n F⟩

/-- The dictionary between Tau Ceti's Kummer coefficient `KummerCoeff F n` and the carrier of
`muNRep n F`: Tau Ceti's `kummerCoeffEquivMuNRep`, equivariant along the comparison
(`kummerCoeffEquivMuNRep_smul`). -/
noncomputable abbrev muNRepCoeffDictionary (n : ℕ) (F : Type) [Field F] :
    TauCeti.KummerCoeff F n ≃+ (muNRep n F).V :=
  TauCeti.ClassFieldTheory.kummerCoeffEquivMuNRep n F

/-! #### The coordinate of a primitive root

A primitive `n`-th root of unity `ζ ∈ F` fixes a coordinate `μ_n(Fˢ) ≃ ℤ/n`, `ζ ↦ 1`, and, lying in
`F`, it makes the Galois action on `μ_n(Fˢ)` trivial. `kummerCupPairing ζ` below is built from both, as is
Tau Ceti's chosen-root comparison `tateDualityPairing_muNRepToTateDual`. -/

/-- **The coordinate of `μ_n(Fˢ)` selected by a primitive root** `ζ ∈ F`: `ζ^k ↦ k`. Tau Ceti's
`muNRepEquivZMod`. -/
noncomputable abbrev muNRepEquivZMod {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) : (muNRep n F).V ≃+ ZMod n :=
  TauCeti.ClassFieldTheory.muNRepEquivZMod ζ hζ

/-- **`G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F`**: Tau Ceti's `muNRep_ρ_apply_eq_self`. -/
theorem muNRep_ρ_eq_self {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (g : Field.absoluteGaloisGroup F) (x : (muNRep n F).V) :
    (muNRep n F).ρ g x = x :=
  TauCeti.ClassFieldTheory.muNRep_ρ_apply_eq_self hζ g x

/-! #### The Kummer class -/

section KummerClass

attribute [local instance] TopRep.distribMulAction

/-- **The Kummer class of `a ∈ Fˣ` in `H¹(G_F, μ_n)`**: Tau Ceti's `kummerClass` where `n` is
invertible in `F` (`kummerClass_eq`), the transport of the Kummer map `TauCeti.kummerMap`. Where
`n` is not invertible there is no Kummer sequence and the value is `0`; every theorem below that
uses it makes `n` invertible. -/
noncomputable def kummerClass (n : ℕ) (F : Type) [Field F] (a : Fˣ) : H n F 1 (muNRep n F) := by
  classical
  exact if hn : IsUnit (n : F) then TauCeti.ClassFieldTheory.kummerClass F hn a else 0

/-- **The defining equation of `kummerClass`** for `n` invertible in `F`. -/
theorem kummerClass_eq {n : ℕ} {F : Type} [Field F] (hn : IsUnit (n : F)) (a : Fˣ) :
    kummerClass n F a = TauCeti.ClassFieldTheory.kummerClass F hn a := by
  unfold kummerClass
  exact dite_eq_left_of_eq_true (eq_true hn)

/-- The Kummer class is additive. -/
theorem kummerClass_mul (n : ℕ) (F : Type) [Field F] (a b : Fˣ) :
    kummerClass n F (a * b) = kummerClass n F a + kummerClass n F b := by
  by_cases hn : IsUnit (n : F)
  · rw [kummerClass_eq hn, kummerClass_eq hn, kummerClass_eq hn]
    exact TauCeti.ClassFieldTheory.kummerClass_mul F hn a b
  · unfold kummerClass
    rw [dite_eq_right_of_eq_false (eq_false hn), dite_eq_right_of_eq_false (eq_false hn),
      dite_eq_right_of_eq_false (eq_false hn), add_zero]

/-- **The Kummer class on cocycles**: for an `n`-th root `α ∈ Fˢ` of `a`, the class of `a` is the
transported class of the Kummer cocycle `g ↦ g α / α` (Tau Ceti's
`kummerClass_eq_muNRepH1Equiv_kummerCocycleClass`). -/
theorem kummerClass_eq_kummerCocycleClass {n : ℕ} {F : Type} [Field F] (hn : IsUnit (n : F))
    {a : Fˣ} {α : (SeparableClosure F)ˣ}
    (hα : α ^ n = Units.map (algebraMap F (SeparableClosure F)).toMonoidHom a) :
    kummerClass n F a =
      TauCeti.ClassFieldTheory.muNRepH1Equiv n F (TauCeti.kummerCocycleClass hα) := by
  rw [kummerClass_eq hn]
  exact TauCeti.ClassFieldTheory.kummerClass_eq_muNRepH1Equiv_kummerCocycleClass F hn hα

end KummerClass

/-- Kummer equivalence when the exponent is invertible in the valuation ring: Tau Ceti's
`kummerEquiv`, which sends the power class of `a` to the Kummer class of `a`
(`kummerEquiv_unit_mk`). -/
noncomputable def kummerEquiv_unit (n : ℕ) (_hn : n ≠ 0)
    (hn' : IsUnit (n : ↥𝒪[K])) :
    Additive (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range) ≃+ H n K 1 (muNRep n K) :=
  TauCeti.ClassFieldTheory.kummerEquiv K (by simpa using hn'.map (algebraMap 𝒪[K] K))

/-- `kummerEquiv_unit` sends the power class of `a` to the Kummer class of `a`. -/
theorem kummerEquiv_unit_mk (n : ℕ) (hn : n ≠ 0) (hn' : IsUnit (n : ↥𝒪[K])) (a : Kˣ) :
    kummerEquiv_unit K n hn hn' (Additive.ofMul (QuotientGroup.mk a)) = kummerClass n K a :=
  sorry

/-- Mixed-characteristic Kummer equivalence, for every `n ≠ 0` including `n = p`: Tau Ceti's
`kummerEquivOfCharZero`, which sends the power class of `a` to the Kummer class of `a`
(`kummerEquiv_mixed_mk`). -/
noncomputable def kummerEquiv_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (hn : n ≠ 0) :
    Additive (Fˣ ⧸ (powMonoidHom n : Fˣ →* Fˣ).range) ≃+ H n F 1 (muNRep n F) :=
  haveI : CharZero F := charZero_of_injective_algebraMap (algebraMap ℚ_[p] F).injective
  TauCeti.ClassFieldTheory.kummerEquivOfCharZero F hn

/-- `kummerEquiv_mixed` sends the power class of `a` to the Kummer class of `a`. -/
theorem kummerEquiv_mixed_mk (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (hn : n ≠ 0) (a : Fˣ) :
    kummerEquiv_mixed p F n hn (Additive.ofMul (QuotientGroup.mk a)) = kummerClass n F a :=
  sorry

/-- **Multiplicative separable-closure coefficients `(Fˢ)ˣ`**, written additively: Tau Ceti's
`unitsRep`, the coefficients of the local Brauer group. -/
noncomputable abbrev unitsRep (F : Type) [Field F] : TopRep ℤ (Field.absoluteGaloisGroup F) :=
  TauCeti.ClassFieldTheory.unitsRep F

/-- The Brauer group `Br F = H²(G_F, (Fˢ)ˣ)` on Mathlib's continuous cohomology: Tau Ceti's `Br`. -/
noncomputable abbrev Br (F : Type) [Field F] : Type :=
  TauCeti.ClassFieldTheory.Br F

/-! ### The local units and the local `H²` bound

These precede `invMap`: the invariant is extended from the unramified layers to all of `Br K`
through `finite_h2_units` and `natCard_h2_units_le_finrank`; nothing here uses a class formation
or an Artin map.

The normal basis theorem is Mathlib's, for a finite Galois extension of arbitrary fields:
`IsGalois.normalBasis F E : Module.Basis Gal(E/F) F E` is a basis whose value at `σ` is `σ θ` for
`θ = IsGalois.normalBasis F E 1` (`IsGalois.normalBasis_apply`). The local-unit step below and the
lattice step of the Euler characteristic start from that basis; it is not restated. -/

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
    (TauCeti.normGroup K L).index = Module.finrank K L :=
  sorry

/-- The order of the local relative Brauer group divides the extension degree, by Tau Ceti's
cyclic calculation and solvable reduction, independently of reciprocity. -/
theorem natCard_h2_units_dvd_finrank [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] :
    Nat.card (groupCohomology (Rep.ofAlgebraAutOnUnits K L) 2) ∣ Module.finrank K L :=
  TauCeti.natCard_H2_units_dvd_finrank K L

/-- The local relative Brauer group is finite: its natural cardinal divides the positive
extension degree, so that cardinal cannot be zero. -/
theorem finite_h2_units [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] : Finite (groupCohomology (Rep.ofAlgebraAutOnUnits K L) 2) := by
  apply Nat.finite_of_card_ne_zero
  intro h
  have hdiv := natCard_h2_units_dvd_finrank K L
  rw [h, zero_dvd_iff] at hdiv
  exact Module.finrank_pos.ne' hdiv

/-- The local relative Brauer group has at most `[L:K]` elements, by the native divisibility
bound. Its finiteness is supplied separately by `finite_h2_units`. -/
theorem natCard_h2_units_le_finrank [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] :
    Nat.card (groupCohomology (Rep.ofAlgebraAutOnUnits K L) 2) ≤ Module.finrank K L :=
  Nat.le_of_dvd Module.finrank_pos (natCard_h2_units_dvd_finrank K L)

/-- **The local invariant**, normalized by arithmetic Frobenius: Tau Ceti's `invMap`. It is first
constructed on the unramified relative Brauer groups; by `finite_h2_units` and
`natCard_h2_units_le_finrank` every class is unramified, so `Br K` is the union of the unramified
relative Brauer groups. The local-field structure is bound in the header: `Br ℂ = 0`. -/
noncomputable abbrev invMap (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Br K ≃+ RatModInt :=
  TauCeti.ClassFieldTheory.invMap K

/-- Restriction `Br K → Br L` along an embedding of `L` into the separable closure: Tau Ceti's
`brRes`. -/
noncomputable abbrev brRes [Algebra K L] (iota : L →ₐ[K] SeparableClosure K) : Br K →+ Br L :=
  TauCeti.ClassFieldTheory.brRes K L iota

/-- Corestriction `Br L → Br K` for a finite extension: Tau Ceti's `brCor`. -/
noncomputable abbrev brCor [Algebra K L] [Module.Finite K L] (iota : L →ₐ[K] SeparableClosure K) :
    Br L →+ Br K :=
  TauCeti.ClassFieldTheory.brCor K L iota

/-- Restriction multiplies the invariant by the degree. -/
theorem invMap_brRes [Algebra K L] [ValuativeExtension K L] (iota : L →ₐ[K] SeparableClosure K)
    (a : Br K) : invMap L (brRes K L iota a) = Module.finrank K L • invMap K a :=
  TauCeti.ClassFieldTheory.invMap_brRes K L iota a

/-- Corestriction preserves the invariant. -/
theorem invMap_brCor [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (iota : L →ₐ[K] SeparableClosure K) (b : Br L) : invMap K (brCor K L iota b) = invMap L b :=
  TauCeti.ClassFieldTheory.invMap_brCor K L iota b

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
`(x, y) ↦ log_ζ(x) · y`, Tau Ceti's `kummerCupPairing` (`kummerCupPairing_bil`). It is equivariant
because `G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F`. At `n = 0` it is `0`; every theorem below that
uses it has `n ≠ 0`. -/
noncomputable def kummerCupPairing {n : ℕ} {F : Type} [Field F]
    (ζ : F) (hζ : IsPrimitiveRoot ζ n) :
    TauCeti.TopPairing (muNRep n F) (muNRep n F) (muNRep n F) :=
  if h : n = 0 then
    { bil := 0
      cont := by simpa using (continuous_const : Continuous fun _ : (muNRep n F).V ×
        (muNRep n F).V => (0 : (muNRep n F).V))
      equivariant := fun g x y => by simp }
  else
    haveI : NeZero n := ⟨h⟩
    TauCeti.ClassFieldTheory.kummerCupPairing ζ hζ

/-- **The Kummer cup pairing is `(x, y) ↦ log_ζ(x) · y`.** -/
theorem kummerCupPairing_bil {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (x y : (muNRep n F).V) :
    (kummerCupPairing ζ hζ).bil x y = muNRepEquivZMod ζ hζ x • y := by
  simp only [kummerCupPairing, NeZero.ne n, dite_false]
  exact TauCeti.ClassFieldTheory.kummerCupPairing_bil ζ hζ x y

/-- **The cohomological symbol at a supplied coordinate**: the cup product of two classes of
`H¹(G_F, μ_n)` along the coefficient pairing `P`, read through an additive coordinate `tr` of
`H²(G_F, μ_n)`. It is Tau Ceti's `localSymbol`. The coordinate is a parameter: the kernel,
bilinearity, Steinberg and antisymmetry laws below hold for every coordinate, while the local
Hilbert symbol `localHilbertSymbol` fixes the arithmetic coordinate `invCoordinate`. -/
noncomputable def localSymbol {n : ℕ} {F : Type} [Field F]
    (P : TauCeti.TopPairing (muNRep n F) (muNRep n F) (muNRep n F))
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (x y : H n F 1 (muNRep n F)) : ZMod n :=
  TauCeti.ClassFieldTheory.localSymbol P tr x y

/-- Bilinearity after transporting multiplicative Kummer classes: `kummerClass` is additive and
the cup product is additive in its first argument (Tau Ceti's `localSymbol_kummerClass_mul`). -/
theorem localSymbol_kummerClass_mul {n : ℕ}
    (P : TauCeti.TopPairing (muNRep n K) (muNRep n K) (muNRep n K))
    (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a a' b : Kˣ) :
    localSymbol P tr (kummerClass n K (a * a')) (kummerClass n K b)
      = localSymbol P tr (kummerClass n K a) (kummerClass n K b)
        + localSymbol P tr (kummerClass n K a') (kummerClass n K b) :=
  sorry

/-- Steinberg relation at the named arithmetic coefficient pairing. -/
theorem localSymbol_kummerClass_steinberg {n : ℕ} (zeta : K)
    (hzeta : IsPrimitiveRoot zeta n) (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a b : Kˣ)
    (_hab : (a : K) + (b : K) = 1) :
    localSymbol (kummerCupPairing zeta hzeta) tr (kummerClass n K a) (kummerClass n K b) = 0 :=
  sorry

/-- **Antisymmetry of the Hilbert pairing**, from the graded commutativity of the cup product
(`TauCeti.TopPairing.cup_gradedComm`) and the symmetry of `kummerCupPairing ζ`. The coordinate
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
      a ∈ TauCeti.normGroup K L :=
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

/-! ### The arithmetic coordinate and the local Hilbert symbol

The coordinate of `H²(K, μ_n)` is not a free parameter of the Hilbert symbol: replacing it by its
negative changes `(a, b)` into `(a, b)⁻¹` at `n ≥ 3` and leaves every coordinate-free law intact.
The arithmetic coordinate is read off the invariant. -/

/-- **The arithmetic coordinate of `H²(K, μ_n)`**, for `n` invertible in `K`: inflate along
`μ_n ↪ (Kˢ)ˣ` to `Br K` (Tau Ceti's `h2MuToBr`), apply `invMap`, and read the class `c/n` of
`ℚ/ℤ` as `c ∈ ℤ/n`. Tau Ceti's `h2MuEquivZMod`, pinned by
`invMap_h2MuToBr_invCoordinate_symm`. -/
noncomputable abbrev invCoordinate (n : ℕ) (hn : IsUnit (n : K)) :
    H n K 2 (muNRep n K) ≃+ ZMod n :=
  TauCeti.ClassFieldTheory.h2MuEquivZMod K hn

/-- The coordinate is pinned by the invariant: the class of coordinate `c` has invariant `c/n`. -/
theorem invMap_h2MuToBr_invCoordinate_symm (n : ℕ) (hn : IsUnit (n : K)) (c : ZMod n) :
    invMap K (TauCeti.ClassFieldTheory.h2MuToBr n K ((invCoordinate K n hn).symm c)) =
      ZMod.toRatAddCircle n c :=
  TauCeti.ClassFieldTheory.invMap_h2MuToBr_h2MuEquivZMod_symm K hn c

/-- **The local Hilbert symbol** `(a, b) ∈ ℤ/n` of `a, b ∈ Kˣ`, for a primitive `n`-th root of unity
`ζ ∈ K`: the cup product of the Kummer classes along `kummerCupPairing ζ`, read in the arithmetic
coordinate `invCoordinate`. It is `localSymbol` at that coordinate, so bilinearity, the Steinberg
relation, antisymmetry, the norm criterion and nondegeneracy hold for it. -/
noncomputable def localHilbertSymbol {n : ℕ} [NeZero n] (ζ : K) (hζ : IsPrimitiveRoot ζ n)
    (a b : Kˣ) : ZMod n :=
  localSymbol (kummerCupPairing ζ hζ) (invCoordinate K n hζ.neZero'.out.isUnit)
    (kummerClass n K a) (kummerClass n K b)

/-! ### The Tate dual and the evaluation pairing

The Tate dual `A' = Hom(A, μ_n)` is Tau Ceti's internal hom `TauCeti.InternalHom G_F A μ_n` — the
additive maps `A → μ_n` with the conjugation action `TauCeti.homAction`,
`(g · φ)(a) = g · φ(g⁻¹ · a)`, and the discrete topology — read as an object of `GalRep n F`
through Tau Ceti's dictionary `TauCeti.ofDiscreteModule`; the evaluation pairing is Tau Ceti's
`InternalHom.evalPairing`. Neither is built a second time. Tau Ceti's declarations pin the carrier
(`tateDualEquiv`), the action (`tateDualEquiv_ρ_apply`), the pairing
(`tateEvaluationPairing_bil`), the finite and discrete instances and smoothness
(`isSmoothDiscrete_tateDual`), the invariants (`tateDual_ρ_eq_self_iff`), contravariance in `A`
(`tateDualMap`) with its compatibility with evaluation (`tateEvaluationPairing_tateDualMap`) and
exactness (`tateDualMap_exact`), and the identification of `Hom(μ_n, μ_n)` after a primitive root is
chosen (`muNRepToTateDual`). -/

section TateDual

attribute [local instance] TopRep.distribMulAction

variable {n : ℕ} {F : Type} [Field F]

/-- **The Tate dual** `A' = Hom(A, μ_n)`: Tau Ceti's `tateDual`, the internal hom
`TauCeti.InternalHom G_F A μ_n` with the conjugation action, read in `GalRep n F`; its evaluation
pairing is Tau Ceti's `tateEvaluationPairing`. -/
noncomputable abbrev tateDual {n : ℕ} {F : Type} [Field F] (A : GalRep n F) : GalRep n F :=
  TauCeti.ClassFieldTheory.tateDual A

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
is also the hypothesis under which continuous cohomology has Shapiro's lemma and corestriction.
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
`TauCeti.card_powerClasses_mixed`) and `H²` is `ℤ/ℓ` (`h2MuEquivZMod_mixed`). -/
theorem finite_H (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F]
    [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (_hA : Finite A.V) [DiscreteTopology A.V] [Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)]
    (i : ℕ) (_hi : i ≤ 2) :
    Finite (H n F i A) :=
  sorry

/-- **The local duality pairing** `Hⁱ(G_F, A') × Hʲ(G_F, A) → ℤ/n`, `i + j = 2`: the cup product
along the evaluation pairing, followed by the coordinate `tr`. Tau Ceti's `tateDualityPairing`. -/
noncomputable abbrev tateDualityPairing {n : ℕ} {F : Type} [Field F] (A : GalRep n F)
    [DiscreteTopology A.V] (tr : H n F 2 (muNRep n F) ≃+ ZMod n) (i j : ℕ) (hij : i + j = 2) :
    H n F i (tateDual A) → H n F j A → ZMod n :=
  TauCeti.ClassFieldTheory.tateDualityPairing A tr i j hij

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

/-! ## Layer 6: the local class formation and finite local reciprocity -/

/-- **The formation of a field**: the multiplicative group `(Fˢ)ˣ` of a separable closure, written
additively as Tau Ceti's `UnitsCoeff F` and made a formation on Tau Ceti's `AbsoluteGaloisGroup F`
by Tau Ceti's dictionary `ofDiscreteModule`. It is smooth because every unit of `Fˢ` has an
open stabilizer (Tau Ceti's `unitsCoeff_continuousSMul`). Its layer `V ◁ U` is the multiplicative
group of the extension cut out by `V`, with its Galois action. The local formation and the
multiplicative formation of a number field are this formation. -/
noncomputable abbrev fieldFormation (F : Type) [Field F] :
    Formation (TauCeti.AbsoluteGaloisGroup F) :=
  TauCeti.ClassFieldTheory.unitsFormation F

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
noncomputable abbrev localFormation : Formation (TauCeti.AbsoluteGaloisGroup K) :=
  fieldFormation K

/-- Hilbert 90 and the local Brauer invariant make `localFormation K` a class formation. The
local-field structure is bound in the header: the formation of a number field is not a class
formation. -/
noncomputable abbrev localClassFormation (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : ClassFormation (localFormation K) :=
  TauCeti.ClassFieldTheory.localClassFormation K

/-- Inflation from the two-dimensional cohomology of the finite layer cut out by an open normal
subgroup `V` of the local formation to the local Brauer group: Tau Ceti's `brInfl`. -/
noncomputable abbrev brInfl (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K)) :
    (NormalLayer.ofOpenNormal V).H (localFormation K) 2 →+ Br K :=
  TauCeti.ClassFieldTheory.brInfl V

/-- The abstract invariant of a finite layer agrees with `invMap` on the local Brauer group after
inflation to `Br K`; the two normalizations are one. -/
theorem localClassFormation_inv (V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K))
    (x : (NormalLayer.ofOpenNormal V).H (localFormation K) 2) :
    (localClassFormation K).inv (NormalLayer.ofOpenNormal V) x = invMap K (brInfl K V x) :=
  sorry

/-- Finite local reciprocity, transparently transported from the abstract Artin equivalence. -/
noncomputable abbrev localArtinEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Kˣ ⧸ TauCeti.normGroup K L) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  TauCeti.ClassFieldTheory.localArtinEquiv K L iota

/-- The finite local Artin map on `Kˣ`. -/
noncomputable abbrev localArtinMap [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive Kˣ →+ Additive (Abelianization (L ≃ₐ[K] L)) :=
  TauCeti.ClassFieldTheory.localArtinMap K L iota

/-- **Frozen public name.** `normResidue` is the multiplicative form of `localArtinEquiv` for the
canonical embedding of `L` into the separable closure; it is not a second construction. -/
noncomputable abbrev normResidue [Algebra K L] [Module.Finite K L] [IsGalois K L] :
    (Kˣ ⧸ TauCeti.normGroup K L) ≃* Abelianization (L ≃ₐ[K] L) :=
  TauCeti.ClassFieldTheory.normResidue K L

/-- At an unramified extension, a uniformizer maps to **arithmetic** Frobenius, Tau Ceti's
`frobeniusAlgEquiv`. -/
theorem localArtinMap_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] [TauCeti.IsUnramified K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (pi : 𝒪[K]) (hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    localArtinMap K L iota (Additive.ofMul (Units.mk0 (pi : K) hpi0)) =
      Additive.ofMul (Abelianization.of (TauCeti.frobeniusAlgEquiv (K := K) (L := L))) :=
  sorry

/-- At an unramified extension, units are norms, so the local Artin map is arithmetic Frobenius to
the power of the normalized valuation. -/
theorem localArtinMap_eq_frobenius_pow_valuation [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] [TauCeti.IsUnramified K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ) :
    localArtinMap K L iota (Additive.ofMul x) =
      Multiplicative.toAdd (TauCeti.normalizedValuation K x) •
        Additive.ofMul (Abelianization.of (TauCeti.frobeniusAlgEquiv (K := K) (L := L))) :=
  sorry

/-! ### The cohomological dimension of `G_K`

Consequences of Tate's theorem for the local class formation, stated against Tau Ceti's
`cohomologicalDimensionAt` and `strictCohomologicalDimensionAt`. -/

/-- **`H³(G_K, (Kˢ)ˣ) = 0`**: on every finite layer `Ĥ³(Gal(L/K), Lˣ) ≅ Ĥ¹(Gal(L/K), ℤ) = 0` by
`ClassFormation.tateIso` at degree `1` for `localClassFormation K`, and continuous cohomology is the
finite-quotient colimit. -/
theorem subsingleton_h3_unitsRep : Subsingleton (continuousCohomology 3 (unitsRep K)) :=
  sorry

/-- **`cd_ℓ G_K = 2`** for every prime `ℓ` and every finite extension `K/ℚ_p` (NSW (7.1.8)(i)). By
`ProfiniteProPGroups.cd_p_eq_of_isProPSylow` it is enough to bound an `ℓ`-Sylow subgroup
`G_{K_ℓ}`, which fixes `K(μ_ℓ)`; by `ProfiniteProPGroups.cd_p_le_iff_elementaryAbelian_of_isProP`
it is enough that `H³(G_{K_ℓ}, ℤ/ℓ)` vanishes, and it is the colimit of the `H³(G_L, μ_ℓ)` over the
finite `L ⊆ K_ℓ`, which embed into `H³(G_L, (Lˢ)ˣ) = 0` because `Br L ≅ ℚ/ℤ` (`invMap`) is
divisible. For `≥ 2`: `H²(K(μ_ℓ), μ_ℓ) ≅ ℤ/ℓ` (`h2MuEquivZMod_mixed`) and
`TauCeti.cohomologicalDimensionAt_le_of_isClosed`. -/
theorem cd_p_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    TauCeti.cohomologicalDimensionAt ℓ (Field.absoluteGaloisGroup K) = 2 :=
  sorry

/-- **`scd_ℓ G_K = 2`** for every prime `ℓ` and every finite extension `K/ℚ_p` (NSW (7.2.5)). `≥ 2`
is `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt`. For `≤ 2`, use the
`scd` criterion of `ProfiniteCohomology` Layer 11 at `n = 2` (NSW (3.3.4)). Its first condition, `cd_ℓ G_K ≤ 2`, is
`cd_p_absoluteGaloisGroup_eq_two`. Its second asks for `H³(G_L, ℤ)(ℓ) ≅ H²(G_L, ℚ_ℓ/ℤ_ℓ) = 0` for
every finite `L/K`; by the `(2,0)` case of `tateDualityPairing_perfect_mixed` at the trivial
module `ℤ/ℓᵐ`, which is smooth (`TauCeti.isSmoothDiscrete_of_ρ_apply_eq_self`), the group
`H²(G_L, ℤ/ℓᵐ)` is dual to `μ_{ℓᵐ}(L)`, so the colimit over `m` is dual to the inverse limit of the
`μ_{ℓᵐ}(L)` under `ℓ`-th powers, which is `0` because `μ_{ℓ^∞}(L)` is finite. -/
theorem scd_p_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    TauCeti.strictCohomologicalDimensionAt ℓ (Field.absoluteGaloisGroup K) = 2 :=
  sorry

/-! ## Layer 7: the absolute local Artin map, its normalizations, and conductors -/

/-- **Frozen public name.** The local Artin map into the topological abelianization of the absolute
Galois group, normalized by arithmetic Frobenius: Tau Ceti's `artinMap`. It is the inverse limit of
the finite maps `localArtinMap` over the finite abelian extensions of `K`, and it is pinned by
three equations stated against named maps: `artinMap_restrict` (against `restrictAbsolute`),
`unramifiedCoordinate_artinMap` (against `unramifiedCoordinate`) and `artinMap_norm` (against
`absoluteGaloisGroupExtend`). It has dense image and is not surjective. -/
noncomputable abbrev artinMap (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Kˣ →* Field.absoluteGaloisGroupAbelianization K :=
  TauCeti.ClassFieldTheory.artinMap K

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

/-- The finite maps are the restrictions of the absolute map. -/
theorem artinMap_restrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ)
    (σ : Field.absoluteGaloisGroup K)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K) = artinMap K x) :
    localArtinMap K L iota (Additive.ofMul x) =
      Additive.ofMul (Abelianization.of (restrictAbsolute K L iota σ)) :=
  sorry

/-- **The absolute Galois group of a finite extension inside that of `K`**, along a `K`-embedding
`iota` of `L` into `Kˢ`: Tau Ceti's `absoluteGaloisGroupExtend`, which identifies the
separable-closure group of `L` with the open subgroup `galoisSubgroup K L iota` of that of `K` and
reads it on Mathlib's absolute Galois groups. Different embeddings give conjugate maps, which agree
after passing to `G_K^ab`. -/
noncomputable abbrev absoluteGaloisGroupExtend [Algebra K L] [Module.Finite K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Field.absoluteGaloisGroup L →* Field.absoluteGaloisGroup K :=
  TauCeti.absoluteGaloisGroupExtend K L iota

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

/-! ### The unramified coordinate

Stated against Tau Ceti's restriction to the maximal unramified extension and its identification
with `Ẑ = TauCeti.zHat`, with inertia and the arithmetic Frobenius lifts; `Ẑ` is not built a second
time. -/

section UnramifiedCoordinate

open TauCeti

/-- The unramified coordinate kills the closed commutator subgroup: `TauCeti.restrictMaximalUnramifiedHom`
is continuous with commutative Hausdorff target `Ẑ`. -/
theorem topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom :
    (commutator (Field.absoluteGaloisGroup K)).topologicalClosure ≤
      ((TauCeti.maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)).toMulEquiv.toMonoidHom.comp
        (TauCeti.restrictMaximalUnramifiedHom K)).ker :=
  sorry

/-- **Frozen public name.** The unramified coordinate `G_K^ab → Gal(K^ur/K) ≅ Ẑ`: the descent of
`TauCeti.restrictMaximalUnramifiedHom` followed by `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`, which sends the
arithmetic Frobenius to `zHat.gen`. -/
noncomputable def unramifiedCoordinate : Field.absoluteGaloisGroupAbelianization K →* zHat.{0} :=
  QuotientGroup.lift _
    ((TauCeti.maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)).toMulEquiv.toMonoidHom.comp
      (TauCeti.restrictMaximalUnramifiedHom K))
    (topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom K)

/-- The unramified coordinate on every class. A closed proof. -/
theorem unramifiedCoordinate_mk (σ : Field.absoluteGaloisGroup K) :
    unramifiedCoordinate K (QuotientGroup.mk σ) =
      TauCeti.maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)
        (TauCeti.restrictMaximalUnramifiedHom K σ) :=
  QuotientGroup.lift_mk _ _ _

/-- **Frozen public name.** On the Artin map the unramified coordinate is the normalized valuation:
`artinMap_restrict` at every finite unramified `L`, `localArtinMap_eq_frobenius_pow_valuation`, and
`zHat.hom_ext`. -/
theorem unramifiedCoordinate_artinMap (x : Kˣ) :
    unramifiedCoordinate K (artinMap K x) =
      zHat.ofInt (TauCeti.normalizedValuation K x) :=
  sorry

end UnramifiedCoordinate

/-- **The conductor exponent** of a finite separable `L/K`: the least `n` with
`U_K^(n) ⊆ N_{L/K}(Lˣ)`. Tau Ceti's `conductorExponent`, with `conductorIdeal` and the character
conductor `characterConductorExp`. -/
noncomputable abbrev conductorExponent [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    ℕ :=
  TauCeti.ClassFieldTheory.conductorExponent K L

/-- For a totally ramified abelian extension, the norm is surjective at an inverse-Herbrand
depth whose upper ramification group is trivial (Serre, *Local Fields*, V §§3, 6). -/
theorem map_unitFiltration_norm_eq_of_upper_eq_bot [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma)
    (_htr : TauCeti.IsTotallyRamified K L) (r : ℕ)
    (_hr : TauCeti.LocalFieldsRamification.upperRamificationGroup K L
      ⟨(r : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg r)⟩ = ⊥) :
    (TauCeti.unitFiltration L (TauCeti.LocalFieldsRamification.psiNat K L r)).map
        (Units.map (Algebra.norm K : L →* K)) = TauCeti.unitFiltration K r :=
  sorry

/-- For a totally ramified abelian extension, norms of units and depth-`r` units generate all
units when the upper group at `r` is the whole Galois group (Serre, *Local Fields*, V §§3, 6). -/
theorem sup_norm_unitFiltration_eq_of_upper_eq_top [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma)
    (_htr : TauCeti.IsTotallyRamified K L) (r : ℕ)
    (_hr : TauCeti.LocalFieldsRamification.upperRamificationGroup K L
      ⟨(r : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg r)⟩ = ⊤) :
    (TauCeti.unitFiltration L 0).map
        (Units.map (Algebra.norm K : L →* K)) ⊔ TauCeti.unitFiltration K r =
      TauCeti.unitFiltration K 0 :=
  sorry

/-- **Unit-filtration reciprocity** (Serre, *Local Fields*, XV §2, Theorem 2). For a finite
abelian `L/K`, in either characteristic, and every depth `n ≥ 0`, the finite reciprocity map
carries the image of `U_K^(n)` onto the upper ramification group `Gal(L/K)^n`, read in the
abelianization. The map is Tau Ceti's `TauCeti.ClassFieldTheory.normResidue`, re-exported by
a reducible alias. At `n = 0` the image is the inertia group. -/
theorem map_unitFiltration_normResidue [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) (n : ℕ) :
    (TauCeti.unitFiltration K n).map
        ((normResidue K L).toMonoidHom.comp
          (QuotientGroup.mk' (TauCeti.normGroup K L))) =
      (TauCeti.LocalFieldsRamification.upperRamificationGroup K L
        ⟨(n : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg n)⟩).map
          Abelianization.of :=
  sorry

/-- **The conductor exponent is read off the upper numbering**: for a finite abelian `L/K` it is
the least depth `n` with `Gal(L/K)^n = 1`. A consequence of `map_unitFiltration_normResidue`. -/
theorem conductorExponent_eq_sInf_upperRamificationGroup [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    conductorExponent K L = sInf {n : ℕ | TauCeti.LocalFieldsRamification.upperRamificationGroup K L
      ⟨(n : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg n)⟩ = ⊥} :=
  sorry

/-! ### The absolute upper ramification groups

For a nonarchimedean local field `K`, the absolute upper ramification group at depth `n` is the
subgroup of `G_K` of the elements whose restriction to every finite Galois subextension `M` of the
algebraic closure lies in `Gal(M/K)^n`. Each such `M` is a nonarchimedean local field through Tau
Ceti's spectral-norm structure on finite intermediate fields. -/

/-- **The absolute upper ramification group** `G_K^n`, for `n ≥ 0`: the elements of `G_K` whose
restriction to every finite Galois `M/K` inside the algebraic closure lies in the upper
ramification group `Gal(M/K)^n` (Serre, *Sur les corps locaux à corps résiduel algébriquement
clos*, n° 3.1). -/
noncomputable def absoluteUpperRamificationGroup (n : ℕ) :
    Subgroup (Field.absoluteGaloisGroup K) :=
  ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
    letI := TauCeti.finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) M.toIntermediateField
    letI := TauCeti.finiteIntermediateFieldTopology K (AlgebraicClosure K) M.toIntermediateField
    haveI := TauCeti.finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
      M.toIntermediateField
    haveI := TauCeti.finiteIntermediateField_valuativeExtension K (AlgebraicClosure K)
      M.toIntermediateField
    (TauCeti.LocalFieldsRamification.upperRamificationGroup K M
      ⟨(n : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg n)⟩).comap
        (AlgEquiv.restrictNormalHom M)

/-- `G_K^n` is closed: it is an intersection of preimages of subgroups of finite discrete
quotients. -/
theorem isClosed_absoluteUpperRamificationGroup (n : ℕ) :
    IsClosed (absoluteUpperRamificationGroup K n : Set (Field.absoluteGaloisGroup K)) :=
  sorry

/-- `G_K^n` is normal in `G_K`: every finite upper ramification group is normal. -/
theorem absoluteUpperRamificationGroup_normal (n : ℕ) :
    (absoluteUpperRamificationGroup K n).Normal :=
  sorry

/-- The absolute upper groups decrease with the depth. -/
theorem absoluteUpperRamificationGroup_antitone :
    Antitone (absoluteUpperRamificationGroup K) :=
  sorry

/-- **Restriction maps `G_K^n` onto `Gal(M/K)^n`** for every finite Galois `M/K`: by Herbrand's
theorem the restriction maps between finite levels carry upper groups onto upper groups, so
`G_K^n` is an inverse limit of nonempty finite sets along surjections. -/
theorem map_restrictNormalHom_absoluteUpperRamificationGroup (n : ℕ)
    (M : FiniteGaloisIntermediateField K (AlgebraicClosure K)) :
    letI := TauCeti.finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) M.toIntermediateField
    letI := TauCeti.finiteIntermediateFieldTopology K (AlgebraicClosure K) M.toIntermediateField
    haveI := TauCeti.finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
      M.toIntermediateField
    haveI := TauCeti.finiteIntermediateField_valuativeExtension K (AlgebraicClosure K)
      M.toIntermediateField
    (absoluteUpperRamificationGroup K n).map (AlgEquiv.restrictNormalHom M) =
      TauCeti.LocalFieldsRamification.upperRamificationGroup K M
        ⟨(n : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg n)⟩ :=
  sorry

/-- **At depth `0` the absolute upper group is inertia**, Tau Ceti's `inertiaSubgroup`: at every
finite level `Gal(M/K)^0` is the inertia group of `M/K`. -/
theorem absoluteUpperRamificationGroup_zero :
    absoluteUpperRamificationGroup K 0 = TauCeti.inertiaSubgroup K :=
  sorry

/-- **Unit-filtration reciprocity, absolute form**: for every `n ≥ 0` the closure of
`artinMap (U_K^(n))` in `G_K^ab` is the image of the absolute upper group `G_K^n`. Both sides are
closed subgroups with the same image in every finite abelian quotient
(`map_unitFiltration_normResidue`, `artinMap_restrict`,
`map_restrictNormalHom_absoluteUpperRamificationGroup`), the image of `G_K^n` being compact. -/
theorem closure_map_artinMap_unitFiltration (n : ℕ) :
    ((TauCeti.unitFiltration K n).map (artinMap K)).topologicalClosure =
      (absoluteUpperRamificationGroup K n).map
        (QuotientGroup.mk' (commutator (Field.absoluteGaloisGroup K)).topologicalClosure) :=
  sorry

/-! ### The cyclotomic normalization

`Art_{ℚ_p}` is compared with the explicit local symbols of the cyclotomic fields over `ℚ`, whose
product formula is a direct computation; no reciprocity law and no Lubin–Tate theory enters. -/

section CyclotomicNormalization

/-- **The uniformizer of `ℚ_p`**: `χ_cyc(Art_{ℚ_p}(p)) = 1`. For every `n ≥ 1`, `p = N(1 − ζ)` for
a primitive `p^n`-th root of unity `ζ`. Mathlib's `IsPrimitiveRoot.norm_sub_one_of_prime_ne_two` and
`IsPrimitiveRoot.norm_sub_one_two` (`n ≥ 2`), whose irreducibility hypothesis is Tau Ceti's
`irreducible_cyclotomic_prime_pow_ratPadic`, give `N(ζ − 1) = p`, and the degree `φ(p^n)` is even
there; at `p = 2`, `n = 1`, `1 − (−1) = 2`. So `p` lies in the norm group of `ℚ_p(μ_{p^n})`, which
the finite Artin map kills (`normResidue`, `artinMap_restrict`), and a lift of `Art_{ℚ_p}(p)` fixes
`μ_{p^n}` for every `n`. -/
theorem cyclotomicCharacter_artinMap_padic_uniformizer (p : ℕ) [Fact p.Prime]
    [IsNonarchimedeanLocalField ℚ_[p]] (σ : Field.absoluteGaloisGroup ℚ_[p])
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = artinMap ℚ_[p] (Units.mk0 (p : ℚ_[p]) (Nat.cast_ne_zero.mpr (Fact.out : p.Prime).ne_zero))) :
    cyclotomicCharacter (AlgebraicClosure ℚ_[p]) p σ.toRingEquiv = 1 :=
  sorry

/-- **The cyclotomic normalization at `ℚ_p`**: `χ_cyc(Art_{ℚ_p}(u)) = u⁻¹` for `u ∈ ℤ_pˣ`. Fix `n`,
let `f = φ(p^n)`, `N = p^f − 1` and `L = ℚ_p(μ_{p^n N})`, and let `g` be the restriction to `L` of a
lift of `Art_{ℚ_p}(pu)`. It acts on `μ_N` as arithmetic Frobenius
(`unramifiedCoordinate_artinMap`) and `g^f = 1` (`cyclotomicCharacter_artinMap_padic_uniformizer`),
so its fixed field `M` satisfies `M · ℚ_p(μ_N) = L` and `pu` is a norm from `M` (`localArtinEquiv`).
The element acting by `u⁻¹` on `μ_{p^n}` and by Frobenius on `μ_N` acts through
`cyclotomicSymbol (p^n N) p (pu)`, so it fixes `M` (`cyclotomicSymbol_norm_fixes`); it agrees with
`g` on `μ_N`, hence on `L`, and `Art_{ℚ_p}(u)` acts on `μ_{p^n}` by `ζ ↦ ζ^{u⁻¹}`. -/
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

end CyclotomicNormalization

end Local

section Global

variable (K : Type) [Field K] [NumberField K]
variable (L : Type) [Field L] [NumberField L] [Algebra K L]

/-! ## Layer 11: the global class formation and global Artin reciprocity -/

/-- **Principal ideles**: `Fˣ` embedded diagonally in Mathlib's idele group
`NumberField.IdeleGroup (𝓞 F) F`, the units of the adele ring. -/
noncomputable def principalIdele (F : Type) [Field F] [NumberField F] :
    Fˣ →* NumberField.IdeleGroup (𝓞 F) F :=
  Units.map (algebraMap F (NumberField.AdeleRing (𝓞 F) F)).toMonoidHom

/-- The norm on ideles of a finite extension: Tau Ceti's
`TauCeti.GlobalNumberFields.ideleNormMap`. -/
noncomputable def ideleNormMap [Module.Finite K L] :
    NumberField.IdeleGroup (𝓞 L) L →* NumberField.IdeleGroup (𝓞 K) K :=
  (TauCeti.GlobalNumberFields.ideleNormMap K L).toMonoidHom

/-- The induced norm on idele classes: Tau Ceti's
`TauCeti.GlobalNumberFields.ideleClassNormMap`. -/
noncomputable def ideleClassNorm [Module.Finite K L] :
    NumberField.IdeleClassGroup (𝓞 L) L →* NumberField.IdeleClassGroup (𝓞 K) K :=
  (TauCeti.GlobalNumberFields.ideleClassNormMap K L).toMonoidHom

/-! ## Layer 12: separate arithmetic global existence, the norm index, and the global
class-field correspondence

As on the local side, `globalAbelianExistence` is an arithmetic theorem about the idele-class
formation, not a formal consequence of an arbitrary `ClassFormation`, and the endpoint is the
correspondence `globalClassFieldCorrespondence` rather than existence: by
`globalNormSubgroup_maximalAbelianLayer` a layer and its maximal abelian sublayer have the same
idele-class norm subgroup, so `globalExistence` alone names nothing.

⚠ Everything in this layer is for a **number field**: the carriers are Mathlib's number-field
idele and idele-class groups, and the section's `NumberField K` hypothesis is load-bearing. Global
class field theory for one-variable function fields over finite fields is outside this roadmap.

The layer is Tau Ceti's at the pin. This file restates the source `GlobalNormSubgroups` of the
correspondence, existence on it and the class field `globalClassField` it defines, because the ring
class field of Layer 13 is a value of `globalClassField`, and the norm index
`card_ideleClassNormQuotient`.
-/

/-- **The source of the global correspondence:** open subgroups of finite index in `C_K`. -/
abbrev GlobalNormSubgroups : Type :=
  {N : OpenSubgroup (NumberField.IdeleClassGroup (𝓞 K) K) // N.toSubgroup.FiniteIndex}

/-- Global existence on the bundled carrier: every open subgroup of finite index of `C_K` is the
norm subgroup of an abelian layer (Tau Ceti's `globalAbelianExistence`). -/
theorem exists_globalClassField (N : GlobalNormSubgroups K) :
    ∃ V : OpenNormalSubgroup (TauCeti.AbsoluteGaloisGroup K),
      IsAbelianClassFieldLayer V ∧ globalNormSubgroup K V = N.1.toSubgroup :=
  sorry

/-- **The global class field attached to an open finite-index subgroup `N ≤ C_K`.** It is the
abelian layer produced by `globalAbelianExistence`, unique by `globalClassField_unique`. The
Hilbert, narrow Hilbert, ray and quadratic-order ring class fields are all values of `classField`
at particular norm subgroups, never independent constructions. -/
noncomputable def globalClassField (N : GlobalNormSubgroups K) :
    AbelianLayer (TauCeti.AbsoluteGaloisGroup K) :=
  ⟨(exists_globalClassField K N).choose, (exists_globalClassField K N).choose_spec.1⟩

/-- The norm-index theorem for finite abelian extensions: `[C_K : N C_L] = [L:K]`. -/
theorem card_ideleClassNormQuotient [Module.Finite K L] [IsAbelianGalois K L] :
    Nat.card (NumberField.IdeleClassGroup (𝓞 K) K ⧸ (ideleClassNorm K L).range) =
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

/-- A principal element is a norm at the finite place `v`, on the finite local étale algebra
`K_v ⊗_K L`: Tau Ceti's `TauCeti.GlobalNumberFields.IsFiniteLocalNorm`. -/
abbrev IsFiniteLocalNorm [Module.Finite K L]
    (v : HeightOneSpectrum (RingOfIntegers K)) (x : Kˣ) : Prop :=
  TauCeti.GlobalNumberFields.IsFiniteLocalNorm K L v x

/-- A principal element is a norm at the infinite place `w`, on Mathlib's completion and the
étale algebra `K_w ⊗_K L`: Tau Ceti's `TauCeti.GlobalNumberFields.IsInfiniteLocalNorm`. -/
abbrev IsInfiniteLocalNorm [Module.Finite K L]
    (w : NumberField.InfinitePlace K) (x : Kˣ) : Prop :=
  TauCeti.GlobalNumberFields.IsInfiniteLocalNorm K L w x

/-- Placewise spelling of “a norm everywhere”: every finite and every archimedean completion
occurs explicitly. Tau Ceti's `TauCeti.GlobalNumberFields.IsLocalNormEverywhere`. -/
abbrev IsLocalNormEverywhere [Module.Finite K L] (x : Kˣ) : Prop :=
  TauCeti.GlobalNumberFields.IsLocalNormEverywhere K L x

/-- The cyclic Hasse norm theorem in the local-norm spelling used by quadratic-form consumers. -/
theorem isGlobalNorm_iff_isLocalNormEverywhere [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      IsLocalNormEverywhere K L x :=
  sorry

/-! ### The named class fields

Every class field named below is a value of `classField` at a value of `globalClassField`: none of
them is an independent construction and none of them substitutes for the correspondence. What each
one contributes is its own *norm subgroup* — the arithmetic input — after which the field, its
Galois group and its degree come from Layer 12. -/

/-- The ring-class norm subgroup of an order `O` of a number field: the kernel of Tau Ceti's idelic
ring-class quotient `ringClassIdeleQuotient O : C_K → Pic O`, as an element of the source carrier
of the correspondence. -/
noncomputable def ringClassNormSubgroup (O : TauCeti.GlobalNumberFields.NumberFieldOrder K) :
    GlobalNormSubgroups K :=
  ⟨⟨(TauCeti.ClassFieldTheory.ringClassIdeleQuotient O).ker,
      TauCeti.ClassFieldTheory.isOpen_ker_ringClassIdeleQuotient O⟩,
    TauCeti.ClassFieldTheory.finiteIndex_ker_ringClassIdeleQuotient O⟩

/-- **The ring class field of an order `O` of a number field `K`**: the class field of
`ringClassNormSubgroup`. It is defined for every order in every number field; at the maximal order
it is the Hilbert class field. -/
noncomputable def ringClassField (O : TauCeti.GlobalNumberFields.NumberFieldOrder K) :
    IntermediateField K (SeparableClosure K) :=
  classField K (globalClassField K (ringClassNormSubgroup K O)).1

/-- Reciprocity identifies the Galois group of the ring class field with the Picard group of the
order: the composite of `galClassFieldEquiv`, the global quotient isomorphism of the class field
of `ringClassNormSubgroup` and the definition of that subgroup as the kernel of
`ringClassIdeleQuotient`. The canonical equivalence is Tau Ceti's `ringClassArtinEquiv`, and the
ideal-form Artin map is Tau Ceti's `ringClassArtinMap`. -/
theorem gal_ringClassField_equiv_pic (O : TauCeti.GlobalNumberFields.NumberFieldOrder K) :
    Nonempty ((ringClassField K O ≃ₐ[K] ringClassField K O) ≃*
      TauCeti.GlobalNumberFields.Pic O) :=
  sorry

/-! ## Layer 14: Hilbert reciprocity -/

/-- **The Hilbert invariant at a finite place** `v`: the local Hilbert symbol of the images of
`a, b ∈ Kˣ` in the completion `K_v`, at the primitive square root `-1`, read in the arithmetic
coordinate of `H²(K_v, μ₂)`. `K_v` has characteristic zero, so `-1` is a primitive square root of
unity and `2` is invertible. -/
noncomputable def finiteHilbertInvariantAt (v : HeightOneSpectrum (𝓞 K)) (a b : Kˣ) : ZMod 2 :=
  localHilbertSymbol (v.adicCompletion K) (-1) (.neg_one 0 (by decide))
    (Units.map (algebraMap K (v.adicCompletion K) : K →* v.adicCompletion K) a)
    (Units.map (algebraMap K (v.adicCompletion K) : K →* v.adicCompletion K) b)

/-- **The Hilbert invariant at an infinite place** `w`, by the real sign rule: `1` when `w` is real
and both `a` and `b` are negative there, and `0` otherwise. -/
noncomputable def infiniteHilbertInvariantAt (w : InfinitePlace K) (a b : Kˣ) : ZMod 2 := by
  classical
  exact if hw : w.IsReal then
    (if NumberField.InfinitePlace.embedding_of_isReal hw (a : K) < 0 ∧
      NumberField.InfinitePlace.embedding_of_isReal hw (b : K) < 0 then 1 else 0) else 0

/-- **A finite support for the Hilbert invariants** of `a, b ∈ Kˣ`: the finite places at which
`2`, `a` or `b` is not a unit. Outside it every finite invariant vanishes
(`finiteHilbertInvariantAt_eq_zero_of_not_mem`). -/
noncomputable def finiteHilbertSupport (a b : Kˣ) : Finset (HeightOneSpectrum (𝓞 K)) :=
  (((HeightOneSpectrum.finite_setOfPred_valuation_ne_one (R := 𝓞 K) (two_ne_zero' K)).union
      (HeightOneSpectrum.finite_setOfPred_valuation_ne_one (R := 𝓞 K) a.ne_zero)).union
      (HeightOneSpectrum.finite_setOfPred_valuation_ne_one (R := 𝓞 K) b.ne_zero)).toFinset

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
