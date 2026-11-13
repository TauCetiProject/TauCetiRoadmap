# Roadmap: local fields and ramification, part II — general valued fields

**Summary.** This roadmap extends [Local fields and ramification](../../Completed/LocalFieldsRamification/README.md)
from nonarchimedean local fields to fields with an arbitrary Krull valuation: valuations of any
height, with any ordered value group, on fields that need not be complete or henselian and whose
residue fields need not be perfect. Starting from Mathlib's valuation subrings, decomposition and
inertia subgroups and Krasner property, from Tau Ceti's henselization and strict henselization,
profinite Sylow theory and cohomological dimension, and from the strict localization of valuation
rings and the tame quotient of a henselian field with separably closed residue field in
ClassicalAdicEtaleCohomology, it builds the
ramification tower `Kʰ ⊆ Kᵘ ⊆ Kᵗ ⊆ Kˢ` of a valued field, the six classes of algebraic extensions
(strictly unramified, unramified, tame, henselian, totally ramified, purely wild) with their tower
laws, maximal complements, decompletion in height one, composition of valuations and the algebraic
Abhyankar inequality. Its end theorems are Temkin's tameness theorem — a valued field with
residue characteristic exponent `p` and no nontrivial finite extension of `p`-power degree is tame,
that is, every algebraic extension is tame at every prolongation — and its separable form: a field
without nontrivial finite separable extension of `P`-number degree is separably tame at every
valuation whose residue characteristic lies in `P`. On the way it proves the Kuhlmann–Pank–Roquette
splitting `Kᵗ ⊗_K K_w ≅ Kᵃ` over henselian fields and in height one, and one profinite input of
that splitting: sections of profinite surjections with pro-`p` kernel onto groups of
`p`-cohomological dimension at most one. The other input, `cd_p(G_F) ≤ 1` for fields of
characteristic `p`, belongs to ProfiniteCohomology.

## Scope and ownership

The base roadmap, LocalFieldsRamification, stops at finite extensions of nonarchimedean local
fields: discrete valuations, finite residue fields and the formula `[L : K] = e·f`. This Part II
owns the general theory below; its comparison with the base roadmap, and with
RamificationOfCompleteDiscretelyValuedFields, is §2.9.

**Owned here.** Prime-supported degrees, `P`-extensions, `P`-closed and separably `P`-closed
fields and split towers (Layer 0); normalization and prolongations of a valuation in a finite
extension, the behaviour of valuation rings under étale maps and henselization, the
henselization of a valued field, the tensor decomposition `L ⊗_K Kʰ ≅ ∏ L_wʰ`, the homogenization
of finite-type algebras and finite modules, finite presentation of flat graded algebras and modules
over a ring with finitely many primes detecting zero, the flat-locus finite-presentation theorem,
and, over an arbitrary domain, finite presentation of flat finite-type algebras and of finite
modules over finite-type algebras that are flat over the domain (Layer 1); the étale criterion for
unramified extensions, the ramification tower, the six extension classes, tame and separably tame
fields, their tower laws and the comparison with perfection, with local fields and with complete
discretely valued fields (Layer 2); the section theorem for pro-`p` kernels, maximal extensions
with prescribed ramification, the elementary complements, the splitting equivalences and the
Kuhlmann–Pank–Roquette theorem (Layer 3); the rank-one Krasner and root-continuity bridge,
decompletion and the height-one splitting and tameness theorems (Layer 4); composed valuations,
finite-height coarsening chains, the Abhyankar inequality and the height bound, and the composition
criteria (Layer 5); and the general tameness theorem with its separable export (Layer 6).

**Left to other roadmaps and the libraries.**
- The henselization of a pair, its universal property, the local case, functoriality, ind-étaleness
  and flatness, directed colimits and radical-equivalent ideals are at the pinned Tau Ceti
  (`TauCeti.Henselization.algebra`, `TauCeti.Henselization.existsUnique_lift`,
  `TauCeti.Henselization.existsUnique_isLocalHom`, `TauCeti.Henselization.map`,
  `TauCeti.Henselization.indEtale`, `TauCeti.Henselization.directLimitEquiv`,
  `TauCeti.Henselization.algEquivOfRadicalEq`); the henselization at a prime, integral base change
  and products over pairwise coprime ideals are SchemeAndStackFoundations §0.12
  (`henselization_at_prime`) and §0.13 (`henselization_integral_base_change`,
  `henselization_coprime_product`). This roadmap proves that the henselization of a valuation ring
  is a valuation ring and builds the valued field on it (§§1.2–1.3); it defines no second
  henselization functor.
- The strict henselization of a local ring with respect to a separable closure of its residue field
  is Tau Ceti's `TauCeti.StrictHenselization.algebra`, with
  `TauCeti.StrictHenselization.existsUnique_lift`, `TauCeti.StrictHenselization.map` and
  `TauCeti.StrictHenselization.fromHenselization`. That for a valuation ring it is a strictly
  henselian valuation ring with the same value group and residue field the chosen separable closure,
  its description as a localization of the invariants of the inertia subgroup of a prolongation to
  `Kˢ`, and the isomorphism of decomposition modulo inertia with the absolute Galois group of the
  residue field, are ClassicalAdicEtaleCohomology §5.1. The structure of `Gal(Kᵗ/K)` for a henselian
  `K` with separably closed residue field and arbitrary value group (the character group of
  `Γ ⊗ ℤ_(p′)/Γ`, the finite-level surjection with `p`-group kernel, and `Gal(Kˢ/Kᵗ)` the unique
  Sylow pro-`p` subgroup) is ClassicalAdicEtaleCohomology §5.3. §§1.2 and 2.2–2.3, and the targets
  that rest on the tame closure, use them.
- Finite extensions of nonarchimedean local fields, their unramified, totally ramified, tame and wild
  classes, wild inertia `P_K`, the tame character and arithmetic Frobenius are LocalFieldsRamification,
  Layers 2–4, and are at the pinned Tau Ceti (`TauCeti.IsUnramified`, `TauCeti.ramificationIndex`,
  `TauCeti.inertiaDegree`, `TauCeti.IsTamelyRamified`, `TauCeti.maximalUnramifiedExtension`,
  `TauCeti.maximalTameExtension`, `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`,
  `TauCeti.inertiaTameCharacter`, `TauCeti.IsArithFrobeniusLift`). §2.9 compares them with the
  general classes and proves nothing about local fields that the base roadmap states.
- Finite extensions of complete discretely valued fields with arbitrary residue field, their integer
  rings, unramified and totally ramified classes, lower and upper ramification filtrations, the
  different and Herbrand functions are RamificationOfCompleteDiscretelyValuedFields, Layers 3a–4a.
  §2.9 compares its unramified and totally ramified extensions with the classes here and states
  nothing about filtrations.
- Decomposition and inertia subgroups of a valuation subring are Mathlib's
  `ValuationSubring.decompositionSubgroup` and `ValuationSubring.inertiaSubgroup`; coarsenings and
  their inverse laws are Mathlib's `ValuationSubring.ofPrime` and `ValuationSubring.idealOfLE`;
  convex subgroups and coarsening of a valuation by a convex subgroup are Tau Ceti's
  `TauCeti.ConvexSubgroup` and `Valuation.coarsenByUnits`; the Krasner property is Mathlib's
  `IsKrasner`, and continuity of roots over a normed field in one direction is Mathlib's
  `Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`.
- That the prolongations of a valuation subring to an algebraic extension are pairwise
  incomparable and that finitely many of them are separated by elements that are units at one and
  nonunits at the others are Tau Ceti's `ValuationSubring.eq_of_le_of_comap_eq` and
  `ValuationSubring.exists_valuation_eq_one_and_lt_one`; §1.1 builds the normalization and the
  bijection with maximal ideals on them.
- Profinite Sylow theory (ProfiniteProPGroups, Layer 2) and the equality of `cd_p` of a profinite
  group with that of its Sylow pro-`p` subgroups (ProfiniteProPGroups, Layer 6) are at the pinned
  Tau Ceti: `TauCeti.IsProPSylow`, `TauCeti.exists_isProPSylow`,
  `TauCeti.IsProPSylow.exists_map_conj_eq`, `TauCeti.IsProPSylow.eq_of_normal`,
  `TauCeti.IsProPSylow.map_of_surjective` and `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq`. The
  invariant `cd_p` itself, its reduction to finite coefficients and its monotonicity on closed
  subgroups are ProfiniteCohomology, Layer 11, implemented as Tau Ceti's
  `TauCeti.cohomologicalDimensionAt`,
  `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` and
  `TauCeti.cohomologicalDimensionAt_le_of_isClosed`. The finite embedding problems with `p`-group
  kernel, their finite-level solutions and the inverse-limit lifting (ProfiniteProPGroups, Layer 5)
  and the passage from `cd_p ≤ 1` to their solvability (ProfiniteProPGroups, Layer 6) are at the
  pinned Tau Ceti as well: `TauCeti.HasPGroupSolutions`,
  `TauCeti.exists_continuous_lift_of_compatible_levelSolutions` and
  `TauCeti.CohomologicalDimensionLE.hasElementaryAbelianSolutions`; §3.1 proves only the
  compatibility of the level solutions for a pro-`p` kernel.
- The bound `cd_p(G_F) ≤ 1` for every field `F` of characteristic `p`, from the Artin–Schreier
  sequence and the vanishing of `Hⁱ(G_F, Fˢ)` for `i ≥ 1`, belongs to ProfiniteCohomology, Layer 9,
  through the supplier contract below; §3.5 applies it to the residue field. The additive Hilbert 90
  `H¹(G_F, Fˢ) = 0` is at the pinned Tau Ceti (`TauCeti.additiveHilbert90`).
- Descent of finite presentation and descent of étaleness from the source of a faithfully flat
  morphism (EGA IV, 17.7.5(iv) and 17.7.7) belong to SchemeAndStackFoundations, Layer 1; §2.1 uses
  them through the two supplier contracts below.

## Conventions

- **Valued fields.** A valued field is a field `K` with a Mathlib `ValuationSubring K`, written `V`
  or `K°`. Two valuations are equivalent exactly when their valuation subrings are equal; no choice
  of value group is part of any definition. The value group `Γ_K` is the group of units of Mathlib's
  `ValuationSubring.ValueGroup`, written multiplicatively (`|x| ≤ 1` on `V`); where rational ranks
  and tensor products occur it is written additively, with the sign reversed. An extension of valued
  fields `(L, W)/(K, V)` is a field extension with `W.comap (algebraMap K L) = V`; `W` is then a
  *prolongation* of `V`. For valuations given as maps, `Valuation.HasExtension` is the same
  condition.
- **Residue characteristic exponent.** `κ_K` is the residue field of `V`, and `p = ringExpChar κ_K`
  is its characteristic exponent: `p` is the residue characteristic when it is positive and `p = 1`
  in residue characteristic zero. For `p = 1`, a `p`-number is `1`, the set of primes dividing `p`
  is empty, "prime to `p`" means every integer, and no Sylow statement is instantiated.
- **Fixed closures.** `Kᵃ` is Mathlib's `AlgebraicClosure K` and `Kˢ ⊆ Kᵃ` the separable closure
  in it. Where a construction needs a prolongation of `V` to `Kᵃ`, it is fixed once and restricted to
  every intermediate field; all henselizations and ramification fields are taken inside `Kᵃ` with
  respect to it. Changing the prolongation conjugates every field of the tower (§2.2).
- **Henselian.** `K` is henselian when `HenselianLocalRing V`. The relative notion "henselian
  extension" (§2.5) means uniqueness of the prolongation to the extension field and does not say that
  the extension field is henselian. Write `H_p = (ℚ, v_p)ʰ ⊂ ℚ_p` for the
  henselization of the rational field at a prime `p` (§1.3).
- **Height.** The height of `V` is Mathlib's `ringKrullDim V`; height `d < ∞` means that `Spec V`
  is a chain of exactly `d + 1` prime ideals, height `0` is the trivial valuation and height one is
  a nontrivial valuation with archimedean value group. Height is not completeness and does not bound
  the rational rank.
- **Splittings and maximal extensions.** A split tower is an actual multiplication isomorphism of
  a tensor product with both factor maps, not a trivial intersection. A maximal extension with a
  property is a Zorn-maximal intermediate field of `Kᵃ/K`; it is in general neither unique nor
  normal over `K` (§3.2).
- **Tame and totally ramified.** Tame fields follow Temkin: `K` is tame when `Kᵃ = Kᵗ`, with no
  henselian hypothesis, and separably tame when `Kˢ = Kᵗ`. Totally ramified permits a purely
  inseparable residue extension. For finite extensions of complete discretely valued fields,
  RamificationOfCompleteDiscretelyValuedFields §3a.1 calls an extension totally ramified when
  `f = 1`; that implies total ramification here, and the two disagree exactly when the residue
  extension is nontrivial and purely inseparable, so they agree for local fields (§2.9).
  The degree formula `[L : K] = e·f` is proved here only for finite tame extensions of henselian
  fields (§2.4). For finite extensions of nonarchimedean local fields it is LocalFieldsRamification's,
  and for finite separable extensions of complete discretely valued fields §2.9 derives it from the
  Galois case of RamificationOfCompleteDiscretelyValuedFields §3a.1. Otherwise it can fail, by a
  defect over a henselian field (an immediate Artin–Schreier extension, `e = f = 1`, degree `p`) or
  through several prolongations (`ℚ(√2)/ℚ` at `7`: `e = f = 1` at each of two, degree `2`) (§2.4).
- **Galois groups.** `G_K` is Mathlib's `Field.absoluteGaloisGroup K` with the Krull topology,
  identified with `Gal(Kˢ/K)` through Tau Ceti's `TauCeti.absoluteGaloisGroupRestrictEquiv`.
  Fixed fields of subgroups of `G_K` are taken in `Kˢ`.

## Exact supplier contracts

### From Mathlib

- `ValuationSubring`, `ValuationSubring.comap`, `ValuationSubring.ofPrime`,
  `ValuationSubring.idealOfLE`, `ValuationSubring.ofPrime_idealOfLE`,
  `ValuationSubring.idealOfLE_ofPrime`, `Mathlib/RingTheory/Valuation/ValuationSubring.lean`: the
  carrier, restriction along a field map and the order-reversing correspondence between overrings
  and primes. Used in Layers 1, 5 and 6 as stated; nothing is assumed beyond these inverse laws.
- `ValuationSubring.decompositionSubgroup` (the stabilizer of `A` in `L ≃ₐ[K] L`) and
  `ValuationSubring.inertiaSubgroup` (the kernel of the action of the decomposition group on the
  residue field of `A`), `Mathlib/RingTheory/Valuation/RamificationGroup.lean`. For infinite `L/K`
  these are subgroups of the full automorphism group; neither the wild subgroup nor any fixed field
  is provided.
- `Valuation.HasExtension`, the instances `Valuation.HasExtension.instAlgebraInteger`,
  `Valuation.HasExtension.instAlgebra_valuationSubring` and
  `Valuation.HasExtension.instIsLocalHomValuationInteger`, and `Valuation.HasExtension.mapValueGroup₀`,
  `Mathlib/RingTheory/Valuation/Extension.lean`: extension of valuations, the induced local map of
  valuation rings, hence of residue fields, and the induced order embedding of value groups.
- `Valuation.RankOne`, `Mathlib/RingTheory/Valuation/RankOne.lean`: an order embedding of the value
  group into `ℝ≥0` for a nontrivial valuation; used in §4.1.
- `IsKrasner`, `IsKrasner.krasner`, `IsKrasner.of_completeSpace_of_normal` and the instance
  `IsKrasner.of_completeSpace`, `Mathlib/Analysis/Normed/Field/Krasner.lean`: the Krasner property,
  proved there for a complete nontrivially normed ultrametric base and an algebraic (in the first
  form, normal) extension whose norm extends that of the base. §4.1 proves it for a henselian base
  without completeness.
- `NormedField.valuation`, `Mathlib/Topology/Algebra/Valued/NormedValued.lean`: the `ℝ≥0`-valued
  valuation `x ↦ ‖x‖₊` of an ultrametric normed field, whose valuation subring is `{x | ‖x‖ ≤ 1}`;
  used in §4.1 to say that a normed field is henselian.
- `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` and
  `Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`,
  `Mathlib/Analysis/Normed/Field/Approximation.lean`: continuity of roots over a normed field: for
  monic `f`, `g` of the same degree whose coefficients differ by less than `ε`, and `g` split, every
  root `a` of `f` is within `((deg f + 1)·ε)^{1/deg f}·max(‖a‖, 1)` of some root of `g`. It has no
  Krull-valued form, no statement from the roots of `g` to those of `f`, and no uniqueness of the
  paired root; §4.1 proves those.
- `IntermediateField.LinearDisjoint`, `IntermediateField.LinearDisjoint.isField_of_isAlgebraic`,
  `Algebra.TensorProduct.isField_of_isAlgebraic`, `Mathlib/FieldTheory/LinearDisjoint.lean`, and
  `IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`,
  `Mathlib/FieldTheory/PurelyInseparable/Tower.lean`: linear disjointness, the tensor product of two
  algebraic extensions being a field under linear disjointness, and disjointness of separable and
  purely inseparable extensions.
- `IsPurelyInseparable.finrank_eq_pow`, `Mathlib/FieldTheory/PurelyInseparable/Basic.lean`: finite
  purely inseparable extensions have degree a power of the characteristic exponent.
- `Nat.factoredNumbers`, `Mathlib/NumberTheory/SmoothNumbers.lean`: for a finset `s`, the nonzero
  natural numbers all of whose prime factors lie in `s`; §0.1 compares it with `P`-numbers.
- `HenselianLocalRing`, `Mathlib/RingTheory/Henselian.lean`; `ringKrullDim`,
  `Mathlib/RingTheory/KrullDimension/Basic.lean`; `IsDiscreteValuationRing.ringKrullDim_eq_one`,
  `Mathlib/RingTheory/DiscreteValuationRing/TFAE.lean`; `Algebra.trdeg` and `AlgebraicIndependent`,
  `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean`; `ringExpChar`,
  `Mathlib/Algebra/CharP/Defs.lean`; `PerfectField`; `Field.absoluteGaloisGroup`,
  `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` (with its derived `IsTopologicalGroup` instance).
- `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `Mathlib/RingTheory/Etale/Descent.lean`,
  and `Algebra.FinitePresentation.of_finitePresentation_tensorProduct_of_faithfullyFlat`,
  `Mathlib/RingTheory/Finiteness/Descent.lean`: descent of étaleness and finite presentation along a
  faithfully flat base change. They are descent along the base, not from the source of a faithfully
  flat morphism, which is the separate contract with SchemeAndStackFoundations below.
- `Algebra.FinitePresentation`, `Mathlib/RingTheory/FinitePresentation.lean`;
  `Module.FinitePresentation`, `Mathlib/Algebra/Module/FinitePresentation.lean`;
  `Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`,
  `Mathlib/RingTheory/Flat/TorsionFree.lean` (over a domain whose localizations at maximal ideals
  are valuation rings, a module is flat exactly when it is torsion free; it says nothing about finite
  presentation); `HomogeneousLocalization.Away`,
  `Mathlib/RingTheory/GradedAlgebra/HomogeneousLocalization.lean` (the degree-zero part `S_(f)` of
  the localization of a graded ring at a homogeneous element). Used in §1.5.

### From Tau Ceti

- `TauCeti.AbsoluteGaloisGroup` and `TauCeti.absoluteGaloisGroupRestrictEquiv`,
  `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`: `Gal(Kˢ/K)` and its identification
  with `G_K`.
- `TauCeti.IsProP`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`: every quotient by an
  open normal subgroup is a `p`-group.
- `TauCeti.IsProPSylow` (`.../Profinite/Sylow/Basic.lean`), `TauCeti.exists_isProPSylow`
  (`.../Sylow/Existence.lean`), `TauCeti.IsProPSylow.exists_map_conj_eq` and
  `TauCeti.IsProPSylow.eq_of_normal` (`.../Sylow/Conjugacy.lean`),
  `TauCeti.IsProPSylow.map_of_surjective` (`.../Sylow/Functoriality.lean`: the image of a Sylow
  pro-`p` subgroup under a continuous surjection from a compact group to a Hausdorff group is Sylow
  pro-`p`) and `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq`
  (`.../Sylow/CohomologicalDimension.lean`: `cd_p G = cd_p P` for a Sylow pro-`p` subgroup `P` of a
  profinite group `G`). No finite generation is assumed in any of them.
- `TauCeti.cohomologicalDimensionAt` and `TauCeti.CohomologicalDimensionLE`,
  `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean`: the
  `ℕ∞`-valued `cd_p`, defined by vanishing of continuous cohomology of discrete `p`-primary torsion
  modules in all degrees above the bound; `TauCeti.cohomologicalDimensionAt_le_iff` (same file):
  `cd_p G ≤ n` is the vanishing predicate `TauCeti.CohomologicalDimensionLE p G n`;
  `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` (`SingleDegree.lean`
  in the same directory: for `p ≠ 0` and a compact `G`, `cd_p G ≤ n` exactly when `Hⁿ⁺¹(G, M)`
  vanishes for every finite discrete `p`-primary `M`) and
  `TauCeti.cohomologicalDimensionAt_le_of_isClosed` (`ClosedSubgroup.lean`: `cd_p U ≤ cd_p G` for a
  closed subgroup `U` of a profinite `G`); `TauCeti.zHat.cohomologicalDimensionAt_eq_one`
  (`TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.lean`: `cd_p Ẑ = 1` for
  every prime `p`), used in a Check of §3.5.
- The finite embedding problems of a profinite group,
  `TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/`: `TauCeti.HasPGroupSolutions`
  (`PGroupKernel.lean`: every finite embedding problem for `G` with `p`-group kernel has a solution)
  with `TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions` (same file: the elementary abelian
  case suffices, by the lower `p`-central series);
  `TauCeti.CohomologicalDimensionLE.hasElementaryAbelianSolutions` (`CohomologicalDimension.lean`:
  `cd_p G ≤ 1` gives the elementary abelian case);
  `TauCeti.LevelSolution` and `TauCeti.levelSolutionMap` (`Level.lean`, `Compatible.lean`: for a
  continuous surjection `α : A ↠ B` of profinite groups and a continuous `f : G → B`, the solutions
  of the finite-level problem at an open normal subgroup `U` of `A`, and their transition maps along
  `V ≤ U`); `TauCeti.exists_continuous_lift_of_compatible_levelSolutions` (`Lift.lean`: a compatible
  family of level solutions assembles into a continuous homomorphism `G → A` over `B`, with no
  pro-`p` hypothesis on `A`); `TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions`,
  `TauCeti.isProjective_of_hasPGroupSolutions` and `TauCeti.IsProjective.exists_continuous_lift`
  (`Projective.lean`: the compatible family and the lift when the source `A` is pro-`p`). Used in
  §3.1, which supplies the compatible family for a pro-`p` kernel instead.
- `Subgroup.exists_minimal_isClosed_le`, `TauCeti/Topology/Algebra/Group/ClosedSubgroup.lean`: a
  closed subgroup of `A × G`, with `A` compact, projecting onto `G` contains a minimal closed
  subgroup projecting onto `G`. Used in §3.1.
- `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`,
  `TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean`: for fields `k ⊆ F` with `k` relatively
  algebraically closed in `F` (`IsIntegrallyClosedIn k F`) and a separable extension `k′/k`, the
  image of `k′` in any common overfield `E` (with compatible scalar towers) is linearly disjoint from
  `F` over `k`. Used in §6.3.
- `ValuationSubring.eq_of_le_of_comap_eq` and `ValuationSubring.exists_valuation_eq_one_and_lt_one`,
  `TauCeti/RingTheory/Valuation/AlgebraicExtension.lean`: for an algebraic extension `L/K`, two
  valuation subrings `A ≤ B` of `L` with the same restriction to `K` are equal, and a finite set of
  valuation subrings of `L` all restricting to a valuation subring `O` of `K` admits a family `e`
  with `e A` a unit of `A` and a nonunit of every other member. Used in §1.1.
- The ramification of finite extensions of nonarchimedean local fields,
  `TauCeti/NumberTheory/LocalField/`: `TauCeti.ramificationIndex`, `TauCeti.IsTotallyRamified` and
  `TauCeti.IsTamelyRamified` (`RamificationIndex.lean`, tame meaning that the residue
  characteristic does not divide the ramification index), `TauCeti.inertiaDegree`,
  `TauCeti.ramificationIndex_mul_inertiaDegree` and
  `TauCeti.isTotallyRamified_iff_inertiaDegree_eq_one` (`InertiaDegree.lean`), `TauCeti.IsUnramified`
  (`Unramified/Basic.lean`: ramification index `1` and separable residue extension),
  `TauCeti.maximalUnramifiedExtension` (`Unramified/Maximal.lean`), `TauCeti.inertiaSubgroup` and
  `TauCeti.IsArithFrobeniusLift` (`Unramified/Inertia/Basic.lean`), `TauCeti.maximalTameExtension`
  and `TauCeti.wildInertiaSubgroup` (`WildInertia.lean`: the field generated by the `m`-th roots of
  `Kˣ` for `m` prime to the residue characteristic, and its fixing subgroup in
  `Field.absoluteGaloisGroup K`) and `TauCeti.inertiaTameCharacter` (`Tame/Character.lean`: the
  continuous surjection from inertia onto the prime-to-`p` Tate module with kernel the wild
  inertia). All assume `IsNonarchimedeanLocalField`. Used only in the comparison §2.9.
- `TauCeti.ConvexSubgroup` (`TauCeti/Algebra/Order/Group/ConvexSubgroup.lean`: convex subgroups of
  a linearly ordered group, totally ordered by inclusion, with ordered quotients) and
  `Valuation.coarsenByUnits` (`TauCeti/RingTheory/Valuation/Coarsen.lean`: the coarsening of a
  valuation by a convex subgroup of its value group).
- The henselization of a pair, `TauCeti/RingTheory/Henselization/`: `TauCeti.Henselization.algebra I`
  with `TauCeti.Henselization.extended I` (`Algebra.lean`), the instance
  `TauCeti.Henselization.henselian` (`Henselian.lean`), the universal property
  `TauCeti.Henselization.existsUnique_lift` and `TauCeti.Henselization.bijective_algebraMap_of_henselianRing`
  (`Lift.lean`: for a henselian pair the structure map is bijective), and `TauCeti.Henselization.map`
  (`Map.lean`). For a local ring `(R, 𝔪)` the henselization is `TauCeti.Henselization.algebra 𝔪`
  (`Local.lean`): a henselian local ring (`TauCeti.Henselization.henselianLocalRing`), local over `R`
  (`TauCeti.Henselization.isLocalHom_algebraMap`) with the residue field of `R`
  (`TauCeti.Henselization.residueField_map_bijective`), universal among local maps to henselian local
  rings (`TauCeti.Henselization.existsUnique_isLocalHom`). It is ind-étale
  (`TauCeti.Henselization.indEtale`, `IndEtale.lean`), hence flat (`TauCeti.Algebra.IndEtale.flat`,
  `TauCeti/RingTheory/Etale/IndEtale.lean`); it commutes with directed colimits of pairs, the ideal
  of the colimit being generated by the images of the stage ideals
  (`TauCeti.Henselization.directLimitEquiv`, `DirectLimit.lean`, Stacks Lemma 15.12.5); and it depends
  only on the radical of the ideal (`TauCeti.Henselization.algEquivOfRadicalEq`, `Radical.lean`, Stacks
  Lemma 15.12.6). No Noetherian hypothesis is assumed in any of them.
- The strict henselization of a local ring `R` with respect to a separable closure `Ω` of its residue
  field, `TauCeti/RingTheory/StrictHenselization/`: `TauCeti.StrictHenselization.algebra R Ω`, the
  colimit of the étale `R`-algebras pointed by an `R`-algebra map to `Ω`, with
  `TauCeti.StrictHenselization.stage` and `TauCeti.StrictHenselization.exists_stage_eq`
  (`Algebra.lean`: every element comes from a pointed étale neighbourhood), the instance
  `TauCeti.StrictHenselization.henselianLocalRing` (`Henselian.lean`), the universal property
  `TauCeti.StrictHenselization.existsUnique_lift` (`Lift.lean`), functoriality
  `TauCeti.StrictHenselization.map` (`Map.lean`) and the local map from the henselization
  `TauCeti.StrictHenselization.fromHenselization` (`FromHenselization.lean`).

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.12: `henselization_at_prime`: for a prime `𝔭` of a ring `R`, the henselization of `R_𝔭` is the
  filtered colimit of the étale `R`-algebras `S`, and of their localizations `S_𝔮`, over the pairs
  `(S, 𝔮)` with `𝔮` over `𝔭` and `κ(𝔮) = κ(𝔭)`.
- §0.13: `henselization_integral_base_change` (for an integral ring map `R → R'`, the henselization
  of `R'` along `IR'` is `R' ⊗_R Rʰ`) and `henselization_coprime_product` (the henselization along
  `I_1 ∩ ⋯ ∩ I_n` with the `I_i` pairwise coprime is the product of the henselizations along the
  `I_i`). Assumed exactly as stated there.
- What SchemeAndStackFoundations must provide (gap:source-side-fpqc-descent): for `f : X → Y`
  faithfully flat and locally of finite presentation and `g : Y → Z` with `g ∘ f` of finite
  presentation, `g` is of finite presentation when `f` is quasi-compact or `g` is quasi-separated
  (EGA IV, Lemma 17.7.5(iv)).
- What SchemeAndStackFoundations must provide (gap:source-side-etale-descent): for `S`-schemes `X`
  and `Y` locally of finite presentation over `S`, an `S`-morphism `g : X → Y` flat at a point `x`
  and `X → S` étale at `x`, the morphism `Y → S` is étale at `g(x)` (EGA IV, Proposition 17.7.7).

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

- §5.1, the strict localization of a valuation ring: for a valuation ring `A` with fraction field
  `K`, a separable closure `L` of its residue field `κ_A` and the strict henselization `Aˢʰ` of `A`
  with respect to `L`: (a) `Aˢʰ` is a strictly henselian valuation ring with residue field `L`, and
  `A → Aˢʰ` induces an isomorphism of value groups; (b) `Aˢʰ` is the localization of the invariants
  `Y^I` at `𝔮 ∩ Y^I`, where `Y` is the integral closure of `A` in `Kˢ`, `𝔮` a maximal ideal of `Y`
  and `D ⊇ I` the decomposition and inertia subgroups of `𝔮` in `Gal(Kˢ/K)`; (c) `D/I ≅ Gal(L/κ_A)`.
  No rank, discreteness or Noetherian hypothesis. Used in §§1.2, 2.2 and 2.3.
- §5.3, the tame quotient: for a field `K` with a henselian valuation ring whose residue field `κ`
  is separably closed of characteristic exponent `p`, with arbitrary value group `Γ`, and `Kᵗ ⊆ Kˢ`
  the union of the finite Galois subextensions of degree prime to `p`: (i) `Gal(Kᵗ/K)` is
  isomorphic as a profinite group to `Hom(Γ ⊗ ℤ_(p′)/Γ, μ′(κ))`, where `ℤ_(p′)` is the ring of
  rationals with denominators prime to `p` (`ℚ` for `p = 1`) and `μ′(κ)` the roots of unity of
  order prime to `p`, so it is abelian of supernatural order prime to `p`; (ii) for every finite
  Galois `E/K` in `Kˢ`, the map `Gal(E/K) → Hom(Γ_E/Γ, μ(κ))`, `σ ↦ (|x| ↦ σ(x)/x mod 𝔪_E)`, is
  surjective with kernel a `p`-group whose fixed field is `E ∩ Kᵗ`; (iii) `Gal(Kˢ/Kᵗ)` is a closed
  normal pro-`p` subgroup of `G_K` of index prime to `p`, its unique Sylow pro-`p` subgroup, trivial
  for `p = 1`. Used in §§2.2, 2.4, 2.6, 2.8, 2.9 and 5.5.

### From TauCetiRoadmap.LocalFieldsRamification

- Layer 2 (*unramified extensions and Frobenius*): unramified extensions, the maximal unramified
  extension and arithmetic Frobenius, at the pinned Tau Ceti as `TauCeti.IsUnramified`,
  `TauCeti.maximalUnramifiedExtension` and `TauCeti.IsArithFrobeniusLift`.
- Layer 3 (*ramification, the tame and wild cases, and the filtration*): `e`, `f` and
  `[L : K] = e·f` (`TauCeti.ramificationIndex`, `TauCeti.inertiaDegree`,
  `TauCeti.ramificationIndex_mul_inertiaDegree`), total ramification (`TauCeti.IsTotallyRamified`,
  with `TauCeti.isTotallyRamified_iff_inertiaDegree_eq_one`) and tameness
  (`TauCeti.IsTamelyRamified`).
- Layer 4 (*the tame quotient of the absolute Galois group*): inertia `TauCeti.inertiaSubgroup`,
  the maximal tame extension `TauCeti.maximalTameExtension`, wild inertia
  `TauCeti.wildInertiaSubgroup`, and the tame character `TauCeti.inertiaTameCharacter` with its
  arithmetic-Frobenius convention.
  These are used only in the comparison §2.9; the Tau Ceti contract above gives their files.

### From TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields

- §3a.1: for a finite Galois extension `L/K` of complete discretely valued fields with arbitrary
  residue field, the integer ring of `L` is a complete discrete valuation ring free of rank `[L : K]`
  over that of `K`, so `[L : K] = e·f`; an intermediate field `F` is unramified over `K` when
  `e(F/K) = 1` and its residue extension is separable, and `L` is totally ramified over an
  intermediate field when the residue degree is `1`. Used only in the comparison §2.9.

### From TauCetiRoadmap.ProfiniteProPGroups

- Layer 2 (profinite Sylow theory: existence, conjugacy, normal Sylow subgroups, images under
  continuous surjections), Layer 5, items 5.1–5.6 (finite embedding problems, solvability with
  elementary abelian and with `p`-group kernel, compatible systems of finite-level solutions and the
  inverse-limit lifting for a pro-`p` source), and Layer 6 (Serre's theorem, step 1: `cd_p G ≤ 1`
  solves the elementary abelian problems; `cd_p` of a profinite group equals that of its Sylow
  pro-`p` subgroups). All are at the pinned Tau Ceti under the names in the Tau Ceti contract above.
  Used in §§2.2, 3.1 and 3.5.

### From TauCetiRoadmap.ProfiniteCohomology

- Layer 11: the invariant `cd_p` with its finite-coefficient test in degree `n + 1` and its
  monotonicity on closed subgroups, at the pinned Tau Ceti as `TauCeti.cohomologicalDimensionAt`,
  `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` and
  `TauCeti.cohomologicalDimensionAt_le_of_isClosed` (Tau Ceti contract above). Used in §§3.1
  and 3.5.
- What ProfiniteCohomology must provide (gap:char-p-galois-h2-vanishing): for every prime `p` and
  every field `F` of characteristic `p`, `H²(G_F, ℤ/p) = 0` for the trivial module, so that
  `TauCeti.cohomologicalDimensionAt p (Field.absoluteGaloisGroup F) ≤ 1`, from the Artin–Schreier
  sequence `0 → 𝔽_p → Fˢ → Fˢ → 0` and the vanishing of `Hⁱ(G_F, Fˢ)` for `i ≥ 1` (Serre, *Galois
  Cohomology*, II §2.2, Proposition 3 and Corollary 1).

## How to read the build

Layer 0 is field theory without valuations: prime-supported degrees, `P`-closed fields and split
towers. Layer 1 studies valuation rings in algebraic extensions and builds the henselization of a
valued field on the henselization of pairs, with the tensor decomposition of a finite extension.
Layer 2 builds the ramification tower `Kʰ ⊆ Kᵘ ⊆ Kᵗ ⊆ Kˢ`, defines the six extension classes and
tame fields, and proves their tower laws; the tame part of the tower rests on the structure of
henselian fields with separably closed residue field, imported from ClassicalAdicEtaleCohomology
§5.3. Above Layer 2 the build has two independent branches, which meet only in Layer 6. The first
reduces the splitting of `Kᵃ/Kᵗ/K` to profinite group theory: Layer 3 proves the section theorem
for pro-`p` kernels and, with it and the bound `cd_p(G_κ) ≤ 1` of ProfiniteCohomology for the
residue field, the splitting over henselian fields, and Layer 4 uses rank-one approximation
to descend from `Kʰ` to `K` and so extends the splitting and the tameness of `p`-closed fields to
height one. The second, Layer 5, composes valuations, controls finite height and proves the
Abhyankar inequality; it uses only Layers 1 and 2 and none of Layers 3–4, so it can be built before,
after or alongside them, and its number expresses no dependency. Layer 6 joins the branches: it
proves tameness of `p`-closed fields by induction on finite height, with the height-one case from
Layer 4 and the inductive step from Layer 5, and by descent to subfields of finite transcendence
degree through Layer 5's height bound, and it exports the separable statement. Each target's
*Needs:* line lists what its statement and its proof route use; a different route may need less.

Layer `k` is also cited as `GF.k`, for `k = 0, …, 6`, and its targets as `GF.k/<name>`; the table
gives the section of each such identifier.

| Former identifier | Section here |
|---|---|
| `GF.0` | Layer 0: `prime-supported-degree` §0.1; `p-extensions` §0.2; `p-closed` and `separably-p-closed` §0.3; `maximal-p-extension` §0.4; `split-tower` §0.5 |
| `GF.1` | Layer 1: `normalization-and-prolongations` §1.1; `valued-henselization` §§1.2–1.3; `henselian-tensor-decomposition` §1.4 |
| `GF.2` | Layer 2: `unramified-etale-criterion` §2.1; `ramification-tower` §2.2; `unramified-extension` and `strictly-unramified-extension` §2.3; `tame-extension` §2.4; `henselian-extension` and `henselian-disjointness` §2.5; `totally-ramified-extension` and `purely-wild-extension` §2.6; `tame-field` and `separably-tame-field` §2.7; `tower-laws` §2.8; `local-field-comparison` §2.9; `perfection-tame-tower` §2.10 |
| `GF.3` | Layer 3: `maximal-ramification-extension` §3.2; `elementary-complements` §3.3; `splitting-equivalences` §3.4; `henselian-pank` §3.5 |
| `GF.4` | Layer 4: `rank-one-krasner` §4.1; `rank-one-decompletion` §4.2; `maximal-wild-henselization` §4.3; `rank-one-pank` §4.4; `rank-one-p-closed` §4.5 |
| `GF.5` | Layer 5: `composed-valuation` §5.1; `finite-height-chain` §5.2; `abhyankar-and-rank` §5.3; `unramified-composition` §5.4; `tame-composition` §5.5; `tame-field-composition` §5.6 |
| `GF.6` | Layer 6: `p-closed-residue-divisibility` §6.1; `finite-height-tameness` §6.2; `finite-height-descent` §6.3; `general-tameness` §6.4; `separable-p-closed-tameness` §6.5 |

## Layer 0: prime-supported extensions and split towers

Field theory needed to state the end theorems: degrees supported on a set of primes, positivity
included, and the distinction between all finite extensions and separable ones.

### 0.1 Prime-supported degrees

Define `IsPNumber P n`, for a set `P` of natural numbers and `n : ℕ`, to mean that `n > 0` and every
prime divisor of `n` lies in `P` (Temkin 2017, §2.1.1, p. 103). *Needs:* Mathlib `Nat.Prime`,
`Nat.factoredNumbers`.

- One is a `P`-number for every `P`.
- For positive `a` and `b`, the product `ab` is a `P`-number exactly when `a` and `b` are.
- If `P ⊆ Q`, every `P`-number is a `Q`-number.
- For a prime `p`, `n` is a `{p}`-number exactly when `n = p^r` for some `r`.
- Only primes in `P` matter: `n` is a `P`-number exactly when it is a `(P ∩ primes)`-number.
- For a finite set `s`, `IsPNumber s n` holds exactly when `n ∈ Nat.factoredNumbers s`, Mathlib's
  set of nonzero numbers whose prime factors lie in the finset `s`; `P` itself may be infinite, as
  the set of all primes is.

**Checks.**
- For `P = ∅` the only `P`-number is `1`: every `n ≥ 2`, and `0`, has a prime divisor. A
  definition with the inclusion reversed, asking every prime of `P` to divide `n`, would accept every
  natural number for `P = ∅`.
- `0` is not a `P`-number even when `P` contains every prime: every prime divides `0`, but the
  positivity clause fails first.
- `6` is a `{2, 3}`-number and not a `{3}`-number; `9` is a `{3}`-number. A definition testing only
  the largest prime factor would accept `6` for `{3}`.

### 0.2 Prime-supported algebraic extensions

Define an algebraic extension `L/K` to be a `P`-extension when every finite subextension `E/K` has
`P`-number degree; neither `L/K` nor its normal closure is required to be Galois (Temkin 2017,
§2.1.1, p. 103). *Needs:* §0.1; Mathlib `Module.finrank_mul_finrank`, `IntermediateField`.

- A finite extension `L/K` is a `P`-extension exactly when `[L : K]` is a `P`-number.
- For algebraic extensions `M/L/K`, `M/K` is a `P`-extension exactly when `M/L` and `L/K` are
  (Temkin 2017, §2.1.1, p. 103). Route: the tower law for degrees, after descending a finite
  subextension `E` of `M/L` to one of the same degree over a finite subextension of `L/K`. Choose
  generators `a_1, …, a_k` of `E/L` (for the converse, the generators of a given finite subextension
  `F` of `M/K`, with `E = L·F`) and an `L`-basis `b_1, …, b_m` of `E` made of monomials in the `a_i`;
  let `L_0` be generated over `K` by the coordinates in this basis of all products `a_i·b_j`, and put
  `E_0 = L_0(a_1, …, a_k)`. The `L_0`-span of the `b_j` is stable under multiplication by every
  `a_i`, so it is a nonzero `E_0`-subspace of `E_0`, hence `E_0` itself, and
  `[E_0 : L_0] = m = [E : L]`.
- A directed union of `P`-subextensions of an algebraic extension is a `P`-extension: a finite
  subextension of the union lies in one member.
- Every subextension of a `P`-extension is a `P`-extension.
- The property is invariant under `K`-algebra isomorphism.

**Checks.**
- `K/K` is a `P`-extension for every `P`, including `P = ∅`.
- `ℚ(2^{1/3})/ℚ` is a `{3}`-extension although its normal closure has degree `6`; a definition
  through the normal closure would reject it.
- The three cubic subfields of the splitting field of `X³ − 2` over `ℚ` are `{3}`-extensions while
  the compositum of two of them has degree `6`: the class is not closed under composita.
- The descent in the tower law needs the coordinates of products, not only the coefficients of
  minimal polynomials. For `K = ℚ`, `L = ℚ(√2)` and `E = L(√3, √6) = L(√3)`, `[E : L] = 2`; the
  minimal polynomials `X² − 3` and `X² − 6` over `L` of the generators have coefficients in `ℚ`, but
  `[ℚ(√3, √6) : ℚ] = 4`. With the basis `1, √3`, the product `√6·1 = √2·√3` has the coordinate `√2`,
  so `L_0 = ℚ(√2)`, `E_0 = ℚ(√2, √3)` and `[E_0 : L_0] = 2`.

### 0.3 Prime-supported closed fields

Define `IsPClosed P K` to mean that every finite subextension `E` of `AlgebraicClosure K` over `K`
whose degree is a `P`-number is `K` itself; purely inseparable extensions are included (Temkin 2017,
§2.1.1, p. 103). Define `IsSeparablyPClosed P K` in the same way, testing only finite separable
subextensions; no perfection is imposed.

- `IsPClosed P K` holds exactly when `K` has no nontrivial algebraic `P`-extension at all, and the
  condition does not depend on the algebraic closure used (embed any finite extension in it).
- If `P ⊆ Q`, then `IsPClosed Q K` implies `IsPClosed P K`, and likewise for the separable
  predicate.
- `IsPClosed P K` implies `IsSeparablyPClosed P K`.
- In characteristic zero the two predicates agree.
- For `K` of characteristic `q > 0`: `IsSeparablyPClosed P K` holds exactly when the perfection
  `K^{1/q^∞}` satisfies `IsPClosed P` (finite separable extensions of the perfection descend to `K`
  with the same degree after a Frobenius twist of the defining polynomial, and the perfection has no
  nontrivial purely inseparable extensions; conversely a finite separable extension of `K` stays a
  field of the same degree over the perfection by
  `IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`). The equivalence is
  proved here; the identification of the absolute Galois groups of `K` and of its perfection on
  which it rests is Temkin 2017, §2.4.6, proof of (0) ⇒ (4), p. 108.

*Needs:* §0.2; Mathlib `AlgebraicClosure`, `Algebra.IsSeparable`,
`IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`.

**Checks.**
- Every field is `∅`-closed and separably `∅`-closed: only degree `1` is a `∅`-number.
- An algebraically closed field is `P`-closed for every `P`.
- `𝔽_q` is not `{ℓ}`-closed for any prime `ℓ`, since `𝔽_{q^ℓ}` has degree `ℓ`; it is not even
  separably `{ℓ}`-closed.
- The separable closure of `𝔽_p(t)` is separably `{p}`-closed and not `{p}`-closed, since
  `t^{1/p}` has degree `p`: the two predicates differ for imperfect fields.

### 0.4 Maximal prime-supported extensions

Prove that inside `Kᵃ` every `P`-extension of `K` is contained in a maximal one `K_P`, and that
`K_P` satisfies `IsPClosed P` (Zorn's lemma with §0.2, Temkin 2017, §2.1.1, p. 103). Prove that if
`K` has characteristic exponent `q`, `q` is prime and `q ∈ P`, then a `P`-closed `K` is perfect: a
missing `q`-th root gives a purely inseparable extension of degree `q` (Temkin 2017, proof of
Theorem 2.6.6, p. 112). Prove the separable form of the first statement: inside `Kˢ` every
separable `P`-extension of `K` is contained in a maximal separable `P`-extension `K_{sP}`, every
finite subextension of `K_{sP}/K` is separable of `P`-number degree, and `K_{sP}` satisfies
`IsSeparablyPClosed P` (a finite separable extension of `K_{sP}` of `P`-number degree embeds in
`Kˢ` over `K_{sP}` and is then a separable `P`-extension of `K` by §0.2, hence equals `K_{sP}`). The
perfection statement has no separable form: a separably `P`-closed field need not be perfect
(§0.3). *Needs:* §§0.2–0.3; Mathlib `zorn_le_nonempty`, `IsPurelyInseparable.finrank_eq_pow`,
`PerfectField`, `separableClosure`.

**Checks.**
- For `P = ∅` the maximal extension is `K`; for `P` the set of all primes it is `Kᵃ`.
- For `P = {3}` a maximal `{3}`-extension of `ℚ` containing `ℚ(2^{1/3})` does not contain the
  normal closure `ℚ(2^{1/3}, ζ_3)`, which has degree `6`.
- `𝔽_p(t)` is not `{p}`-closed (`t^{1/p}`), consistent with perfection being forced.
- For `K = 𝔽_p(t)` and `P = {p}`, a maximal separable `{p}`-extension `K_{sP}` is separably
  `{p}`-closed but does not contain `t^{1/p}`, which is not in `Kˢ`; so `K_{sP}(t^{1/p})` has
  degree `p` over it, `K_{sP}` is neither perfect nor `{p}`-closed, and a separable form of the
  perfection statement would be false. For `P = ∅`, `K_{sP} = K`.

### 0.5 Split towers

For algebraic extensions `L/M/K` inside a fixed `L`, define a splitting to be an intermediate field
`E` of `L/K` that is linearly disjoint from `M` over `K` with `E·M = L`; the tower splits when a
splitting exists (Temkin 2017, §2.1.2, p. 103). Prove that multiplication `E ⊗_K M → L` is then an
isomorphism of `M`-algebras compatible with both factor maps, and conversely that such an
isomorphism with the prescribed factor maps gives a splitting.

- A splitting is the data of `E`, its linear disjointness from `M` and the equality `E·M = L`.
- Multiplication `E ⊗_K M → L` is an `M`-algebra isomorphism restricting to the two inclusions; it
  is injective by linear disjointness and surjective because the tensor product of two algebraic
  extensions that are linearly disjoint is a field.
- An `M`-algebra isomorphism `E ⊗_K M ≅ L` restricting to the inclusions of `E` and `M` yields a
  splitting.
- Compatible isomorphisms of towers transport splittings.

*Needs:* Mathlib `IntermediateField.LinearDisjoint`,
`IntermediateField.LinearDisjoint.isField_of_isAlgebraic`.

**Checks.**
- The tower `M/M/K` splits with `E = K`.
- `ℚ(√2, √3)/ℚ(√2)/ℚ` splits with `E = ℚ(√3)`.
- Two distinct cubic subfields `E, M` of the `S₃`-extension `ℚ(2^{1/3}, ζ_3)/ℚ` meet in `ℚ` but are
  not linearly disjoint: `E ⊗_ℚ M` has dimension `9` and the compositum has degree `6`. Trivial
  intersection is not a splitting.

### Examples

`ℚ(2^{1/3})/ℚ` is a `{3}`-extension that is not normal (§0.2); `𝔽_q` is neither `P`-closed nor
separably `P`-closed for any `P` containing a prime, while for `P = {1}` or `P = {4}`, which contain
no prime, the only `P`-number is `1` and `𝔽_q` is `P`-closed (§§0.1, 0.3); the separable closure
of `𝔽_p(t)` separates the two closedness predicates (§0.3); `ℚ(√2, √3)/ℚ(√2)/ℚ` splits (§0.5).

### Dependencies

Mathlib field theory only. No valuation enters Layer 0.

## Layer 1: valuation rings in algebraic extensions and henselization

The normalization of a valuation ring in a finite extension is semilocal but need not be a finite
module; everything below is arranged so that no module finiteness is used.

### 1.1 Normalization and prolongations

Let `V` be a valuation subring of `K` and `L/K` a finite extension. Prove that the integral closure
`B` of `V` in `L` is semilocal, that its maximal ideals are in bijection with the prolongations of
`V` to `L`, the prolongation at `𝔪` being `B_𝔪`, and that for a `V`-subalgebra `A ⊆ L` integrally
closed in `Frac A` and every prime ideal `𝔮` of `A` the localization `A_𝔮` is a valuation ring of
`Frac A`, so that `A` is a Prüfer domain (Aïd 2025, Propositions 3.3 and 3.6 and Theorem 3.7,
pp. 5–9, and Proposition 4.1 and Theorem 4.4, pp. 10–13; Temkin 2017, Lemma 2.3.4, p. 105, whose
proof works with `A_𝔮`). `A` itself need not be local. Route: a polynomial relation normalized at a
coefficient of least value shows that `x` or `x⁻¹` lies in `B_𝔪`; `dim_κ B/J(B) ≤ [L : K]` makes
`B/J(B)` a finite product of fields; for `A` integrally closed in `Frac A`, `A` contains the
normalization `B_A` of `V` in the finite extension `Frac A` of `K`, so `A_𝔮` contains the
localization of `B_A` at the prime `𝔮 ∩ B_A`, an overring in `Frac A` of a localization of `B_A` at a
maximal ideal and hence a valuation ring of `Frac A`; every subring of `Frac A` containing a valuation
ring of `Frac A` is one; distinct prolongations are incomparable and separated by elements of `B`,
so their centres on `B` are distinct maximal ideals. *Needs:* Mathlib `ValuationSubring`,
`integralClosure`, `ValuationSubring.ofLE`; Tau Ceti `ValuationSubring.eq_of_le_of_comap_eq`,
`ValuationSubring.exists_valuation_eq_one_and_lt_one`.

**Checks.**
- For `V` a field (trivial valuation) `B = L` has one maximal ideal `0` and one prolongation.
- For `ℚ(√2)/ℚ` and `V = ℤ_(7)`, `B = ℤ[√2]_(7)` has two maximal ideals, over `3 ± √2`, and there
  are two prolongations; for `V = ℤ_(3)` there is one (`2` is not a square modulo `3`).
- The Prüfer statement concerns localizations at primes, not arbitrary localizations: for
  `V = ℤ_(7)` and `A = ℤ[√2]_(7)` (integrally closed, and its own localization at `{1}`), the element
  `x = (3 − √2)/(3 + √2)` has normalized value `1` at the prime over `3 − √2` and `−1` at the prime
  over `3 + √2`, so neither `x` nor `x⁻¹` lies in `A` and `A` is not a valuation ring, while each of
  the two localizations of `A` at its maximal ideals contains `x` or `x⁻¹`.
- For a nondiscrete valuation ring and a finite extension the normalization need not be a finite
  `V`-module; the statement assumes nothing about finiteness.

### 1.2 Étale maps and the henselization of valuation rings

Prove: for a valuation ring `A`, an étale `A`-algebra `B` and a prime `𝔪 ⊆ B` over the maximal ideal
of `A`, the local ring `B_𝔪` is a valuation ring with the same value group as `A` (Stacks, Lemma
15.125.5, tag 0ASJ). Consequently the henselization `Aʰ`, Tau Ceti's
`TauCeti.Henselization.algebra` of the maximal ideal of `A`, is a valuation ring, `A ⊆ Aʰ` is an
extension of valuation rings inducing a bijection on value groups, and `Aʰ` has the residue field
of `A` (Stacks, Lemma 15.125.6, tag 0ASK). Route: `Aʰ` is the filtered colimit of the local rings
`B_𝔪` with `B` étale over `A` and `κ(𝔪) = κ_A` (`henselization_at_prime`), each a valuation ring
with the value group of `A`, and a filtered colimit of valuation rings along local maps inducing
bijections on value groups is a valuation ring with the same value group. The strict henselization
`Aˢʰ` (Tau Ceti's `TauCeti.StrictHenselization.algebra`) is a strictly henselian valuation ring with
the value group of `A` and residue field the chosen separable closure of `κ_A` by
ClassicalAdicEtaleCohomology §5.1; with the local map `TauCeti.StrictHenselization.fromHenselization`,
`A ⊆ Aʰ ⊆ Aˢʰ` are then extensions of valuation rings inducing bijections on value groups.
*Needs:* Tau Ceti `TauCeti.Henselization.algebra`, `TauCeti.Henselization.residueField_map_bijective`,
`TauCeti.StrictHenselization.algebra`, `TauCeti.StrictHenselization.fromHenselization`;
SchemeAndStackFoundations §0.12 (`henselization_at_prime`); ClassicalAdicEtaleCohomology §5.1; Mathlib
`ValuationRing`, `Algebra.Etale`.

**Checks.**
- For a field `A` both henselizations are `A` and the chosen separable closure; the value group is
  trivial throughout.
- For `A = ℤ_(p)`, `Aʰ` is the ring of `p`-adic integers algebraic over `ℚ`, a discrete valuation
  ring with value group `ℤ`, and not `ℤ_p`.
- `ℤ_(p) → ℤ_(p)[√p]_(√p)` is a localization of a finite, not étale, algebra and its value group is
  `½ℤ`: the étale hypothesis cannot be dropped.

### 1.3 The henselization of a valued field

For `V ⊆ K` define the henselization `Kʰ = Frac(Vʰ)` with `Vʰ` the henselization of the local ring
`V` (Tau Ceti's `TauCeti.Henselization.algebra` of the maximal ideal of `V`, a henselian local ring
by `TauCeti.Henselization.henselianLocalRing`), embedded in `Kˢ` through the fixed
prolongation. Prove: `Vʰ` is a valuation ring of `Kʰ` lying over `V` (§1.2); `Kʰ/K` is separable
algebraic and immediate (residue field and value group unchanged); every extension of valued fields
from `K` into a henselian valued field extends uniquely to `Kʰ`; `K` is henselian exactly when
`K → Kʰ` is an isomorphism, exactly when every finite extension admits a unique prolongation
(Temkin 2017, §§2.2.2 and 2.3.1, p. 104; Stacks, Lemma 15.125.6, tag 0ASK). Route: `Vʰ` is the
filtered colimit of localizations of étale `V`-algebras at points over the closed point with trivial
residue extension (`henselization_at_prime`); apply §1.2 to each and pass to fraction fields; the
universal property of `Vʰ` among henselian local rings (`TauCeti.Henselization.existsUnique_isLocalHom`)
gives that of `Kʰ`, and for henselian `V` the structure map `V → Vʰ` is bijective
(`TauCeti.Henselization.bijective_algebraMap_of_henselianRing`).

- The ring of integers of `Kʰ` is Tau Ceti's henselization `Vʰ` of the local ring `V`; no second
  henselization is constructed.
- Extensions of valued fields from `K` into henselian valued fields extend uniquely to `Kʰ`.
- The residue field and value group maps of `Kʰ/K` are isomorphisms.
- A morphism of valued fields induces a morphism of henselizations, compatibly with identities and
  composition.
- `K` is henselian exactly when `K → Kʰ` is an isomorphism, exactly when every finite extension has
  a unique prolongation.

*Needs:* §1.2; Tau Ceti `TauCeti.Henselization.algebra`, `TauCeti.Henselization.henselianLocalRing`,
`TauCeti.Henselization.existsUnique_isLocalHom`, `TauCeti.Henselization.bijective_algebraMap_of_henselianRing`,
`TauCeti.Henselization.map`; SchemeAndStackFoundations §0.12 (`henselization_at_prime`); Mathlib
`HenselianLocalRing`, `FractionRing`.

**Checks.**
- For the trivial valuation `Kʰ = K`.
- For a complete field of height one, `Kʰ = K`: completeness gives Hensel's lemma.
- The `p`-adic henselization of `ℚ` is algebraic and immediate over `ℚ` and dense in `ℚ_p` but is
  not `ℚ_p`, which is transcendental over `ℚ`; the completion is not the henselization.

### 1.4 Tensor decomposition by prolongations

Let `L/K` be finite, `V ⊆ K` a valuation ring and `w_1, …, w_r` the distinct prolongations of `V`
to `L`, counted as valuation subrings of the fixed field `L` (not up to isomorphism of valued
extensions). Prove that `L ⊗_K Kʰ ≅ ∏_i L_{w_i}ʰ` as `Kʰ`-algebras, each projection induced by the
corresponding prolongation; inseparable `L/K` is included (Temkin 2017, Lemma 2.3.2, pp. 104–105;
EGA IV, Proposition 18.6.8, p. 139). Route: the normalization `B` of `V` in `L` is integral and
semilocal with localizations the `w_i` (§1.1); `henselization_integral_base_change` identifies
`B ⊗_V Vʰ` with the henselization of `B` along `𝔪_V B`; its radical is the Jacobson radical
`𝔪_1 ∩ ⋯ ∩ 𝔪_r`, which may replace it (`TauCeti.Henselization.algEquivOfRadicalEq`);
`henselization_coprime_product` splits the result into the henselizations of the pairs `(B, 𝔪_i)`,
and the universal property (`TauCeti.Henselization.existsUnique_lift`) identifies each with the
henselization of the local ring `B_{𝔪_i}`; invert the nonzero elements of `V`. *Needs:* §§1.1–1.3;
SchemeAndStackFoundations §0.13 (`henselization_integral_base_change`,
`henselization_coprime_product`); Tau Ceti `TauCeti.Henselization.algEquivOfRadicalEq`,
`TauCeti.Henselization.existsUnique_lift`.

**Checks.**
- For henselian `K` there is one factor and the tensor product is the field `L`.
- For `ℚ(√2)/ℚ` at `7` there are two factors, both `H_7`; the tensor product is not a field. Counting
  prolongations up to isomorphism would give one factor, because the two prolongations are
  conjugate.
- For `L = K(t^{1/p})` over `K = 𝔽_p(t)` with the `t`-adic valuation the prolongation is unique and
  the tensor product is the field `Lʰ`; inseparability does not create factors.

### 1.5 Finite presentation over domains

*Homogenization.* For a ring `R`, an `R`-algebra `B` of finite type and a finite `B`-module `M`,
prove that there are a graded `R`-algebra `S = ⊕_{n≥0} S_n` with `S_0 = R`, generated as an
`R`-algebra by finitely many elements of `S_1`, an element `f ∈ S_1` and a finite graded `S`-module
`N` with `B ≅ S_(f)` as `R`-algebras and `M ≅ N_(f)` as `B`-modules, where `S_(f)` and `N_(f)` are
the degree-zero parts of the localizations at `f` (`HomogeneousLocalization.Away`); and that if `S`
is a finitely presented `R`-algebra then so is `S_(f)`, and if `N` is a finitely presented
`S`-module then `N_(f)` is a finitely presented `S_(f)`-module (Stacks, Lemma 15.26.6, tag 053E,
first step of its proof, which quotes Algebra, Lemma 10.57.10). Route: for generators
`x_1, …, x_n` of `B` take `S_0 = R` and `S_d = B_{≤d}·T^d` for `d ≥ 1` inside `R ⊕ T·B[T]`, where
`B_{≤d}` is the image of the polynomials of degree at most `d`, and `f = T`; build `N` in the same
way from generators of `M`. Because `f` has degree one and is a unit in `S_f`, the map
`S_(f)[T, T⁻¹] → S_f`, `T ↦ f`, is an isomorphism and `N_f ≅ N_(f) ⊗_{S_(f)} S_f`; so `S_(f)` is
`S_f/(f − 1)` and `N_(f)` is `N_f/(f − 1)N_f`, finitely presented whenever `S_f` and `N_f` are.
*Needs:* Mathlib `HomogeneousLocalization.Away`, `Algebra.FinitePresentation`,
`Module.FinitePresentation`.

**Checks.**
- For `B = R` and `M = 0`: `S = R[X_0]`, `f = X_0`, `S_(f) = R` and `N = 0`.
- For `R` a field, `B = R[x]` and `M = B`: `S = R[X_0, X_1]`, `f = X_0`, `S_(f) = R[X_1/X_0] ≅ R[x]`
  and `N = S`.
- For `R = ℤ` and `B = 𝔽₂`: `S = ℤ[X]/(2X)` has `S_0 = ℤ` and `S_d = 𝔽₂·X^d` for `d ≥ 1`, and
  `S_(X) = 𝔽₂`; the relation of `B` is visible only in positive degrees.
- The degree-zero part cannot be replaced by the whole localization: for `S = R[X_0]`,
  `S_{X_0} = R[X_0, X_0⁻¹]` is a Laurent polynomial ring over `S_(X_0) = R`, not `R`.

*Graded finite presentation.* Let `R` be a ring with finitely many primes `𝔭_1, …, 𝔭_m` such that
`R → ∏_j R_{𝔭_j}` is injective, `S = ⊕_{n≥0} S_n` a graded `R`-algebra of finite type with `S_0`
finite over `R`, and `N = ⊕_{d∈ℤ} N_d` a graded `S`-module. Prove that if `S` is flat over `R` then
`S` is a finitely presented `R`-algebra, and that if `N` is flat over `R` and finite over `S` then
`N` is a finitely presented `S`-module (Stacks, Lemma 15.26.4, tag 053D). The hypothesis on `R`
holds for local rings, Noetherian rings and domains (Remark 15.26.5, tag 05GS (1)–(3)). Route: `S`
is finite over a graded polynomial ring `P = R[x_1, …, x_n]` with generators of positive degree, so
both statements reduce to finite presentation over `P` of a finite graded `P`-module flat over `R`;
this holds after localizing at each prime of `R` (Stacks, Lemma 15.26.3, tag 053C, for a local base)
and descends to `R` through the finitely many primes `𝔭_j` (Stacks, Lemma 15.26.1, tag 053A).
*Needs:* Mathlib `Module.Flat`, `Algebra.FinitePresentation`, `Module.FinitePresentation`.

**Checks.**
- Over a field `R`, `S = R[X_1, X_2]` and `N = S/(X_1)` are flat over `R` and finitely presented.
- The hypothesis on `R` cannot be dropped: for `R = ∏_ℕ 𝔽₂` and `I = ⊕_ℕ 𝔽₂`, every localization of
  `R` at a prime is `𝔽₂`, so `R → ∏_j R_{𝔭_j}` factors through `𝔽₂^m` and is never injective; and
  `S = R[X]/(I·X)`, with `S_0 = R` and `S_d = (R/I)·X^d` for `d ≥ 1`, is of finite type and flat
  (every module over `R` is flat) but not finitely presented, since the kernel `I·X·R[X]` of
  `R[X] → S` would be finitely generated only if `I` were.
- Flatness cannot be dropped: for a valuation ring `R` whose maximal ideal `𝔪` is not finitely
  generated (its value group has no least positive element; for example the valuation ring of
  `ℂ_p`, with value group `ℚ`), `R` is local, so the hypothesis on `R` holds, and
  `S = R[X]/(𝔪X)` is of finite type with `S_0 = R`, is not flat (`X` is killed by `𝔪`) and is not
  finitely presented, since the kernel `𝔪X·R[X]` would be finitely generated only if `𝔪` were.
  Nondiscreteness alone is not enough: the composite valuation ring of `ℚ_p((t))` (§5.1), with value
  group `ℤ × ℤ` ordered lexicographically, has the least positive value `(0, 1)` and maximal ideal
  `(p)`, and `R[X]/(pX)` is finitely presented.

*Algebras over domains.* Prove `finitePresentation_of_flat_of_isDomain`: for every domain `A`
and every finite-type `A`-algebra `B` flat over `A`, `B` is finitely presented over `A`
(Raynaud and Gruson 1971, Corollaire 3.4.7; Stacks, Proposition 38.13.10(1), tag 053G;
Temkin 2017, proof of Lemma 2.3.8, p. 106).

This section owns the flat-locus finite-presentation theorem used in the general-domain proofs:
for a ring `R` with finitely many weakly associated primes, a finitely presented `R`-algebra `C`
and a finite `C`-module `N`, the set `U = {q ∈ Spec C | N_q is R-flat}` is open, and for each
`g ∈ C` with `D(g) ⊆ U`, `N_g` is finitely presented over `C_g` and flat over `R`
(Stacks, Lemma 38.13.7, tag 05IL). Here a weakly associated prime is a prime minimal over the
annihilator of an element of the module; for the ring the module is `R` itself.
Its local finite-presentation input is also owned here: for any ring `R`, finitely presented
`R`-algebra `C`, finite `C`-module `N` and prime `q` of `C`, if `N_q` is flat over
`R_(q ∩ R)`, then `N_q` is finitely presented over `C_q` (Stacks, Lemma 38.10.9, tag 05I7).
Apply the flat-locus theorem with `R = A`, `C = A[X_1, …, X_n]`, `N = B` via a surjection
`C → B`, and `g = 1`: a domain has just the weakly associated prime `(0)`, and `U = Spec C`.
Finite presentation of the cyclic `C`-module `B` makes the kernel finitely generated, giving
finite presentation as an `A`-algebra. *Needs:* the two finite-presentation inputs in this
paragraph; Mathlib `Module.Flat`, `Algebra.FinitePresentation`, `Module.FinitePresentation`.

*Modules over domains.* Prove `module_finitePresentation_of_flat_of_isDomain`: for every domain
`A`, finite-type `A`-algebra `B` and finite `B`-module `M` flat as an `A`-module, with compatible
`A`- and `B`-actions, `M` is finitely presented over `B` (Stacks, Proposition 38.13.10(2),
tag 053G). The flatness hypothesis is on `M`, not on `B`. Route: choose a surjection
`C = A[X_1, …, X_n] → B` with kernel `I`. Then `M` is a finite `C`-module, and every `M_q` is a
localization of the `A`-flat module `M`, hence `A`-flat, so `U = Spec C` and the flat-locus
theorem with `R = A`, `N = M` and `g = 1` makes `M` finitely presented over `C`. Since `IM = 0`,
tensoring a presentation `C^m → C^k → M → 0` with `B = C/I` gives a presentation over `B`.
*Needs:* the flat-locus theorem and its local input above; Mathlib `Module.Flat`,
`Module.FinitePresentation`.

*A second route over Prüfer domains.* Let `A` be a Prüfer domain (a domain whose localization at
every maximal ideal is a valuation ring), for example a valuation ring, for which both theorems
are Stacks, Lemma 15.26.6 (tag 053E). Over `A` both theorems also follow, without the flat-locus
theorem, by the proof of Stacks tag 053E: over a Prüfer domain an `A`-module is flat
exactly when it is torsion free
(`Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`); homogenize,
`B = S_(f)` and `M = N_(f)`; replace `S` by its quotient by its `A`-torsion in the algebra case and
`N` by its quotient by its `A`-torsion in the module case (Stacks, Lemma 15.22.2, tag 0537), which
changes neither `B` nor `M` since they are torsion free; the quotient is torsion free, hence flat
over `A`, so it is finitely presented by graded finite presentation, whose hypothesis on the base
holds for every domain; dehomogenize. The valuation-ring case does not localize to the Prüfer case:
finite presentation of a finite-type algebra is not detected at the localizations at the maximal
ideals of the base (the Boolean-ring Check below); the route localizes only flatness. *Needs:*
homogenization and graded finite presentation above; Mathlib `ValuationRing`, `Module.Flat`,
`Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`,
`Algebra.FinitePresentation`, `Module.FinitePresentation`.

**Checks.**
- For a field `k`, `A = k[x,y]` and `B = A[T]`, the algebra theorem gives one generator and zero relations.
  The localization of `A` at `(x,y)` contains neither `x/y` nor `y/x`, so `A` is not Prüfer.
- For the same `A`, `B = A[T]/(xT)` and `M = B/(T) ≅ A`: `B` is not flat over `A`, since `x` kills
  the nonzero element `T`, so the algebra theorem says nothing about `B`; but `M` is free of rank
  one over `A`, and the module theorem holds with the presentation `B → B → M → 0` given by
  multiplication by `T`.
- For a field `k`, `R = C = k[t]` and `N = R/(t)`, the flat locus is `D(t)`; on it `N` is zero and finitely
  presented, whereas at `(t)` it is nonzero torsion and not flat. For `N = C`, the flat locus is
  all of `Spec C`, with one module generator and zero relations.
- Over a field every finite-type algebra is flat and finitely presented, by Hilbert's basis theorem.
- `A/𝔪` for a valuation ring `A` whose maximal ideal `𝔪` is not finitely generated is of
  finite type and not finitely presented; it is not flat (it is torsion), so flatness cannot be
  dropped.
- For the same `A`, `B = A` (flat and of finite type) and `M = A/𝔪`, the module `M` is cyclic over
  `B` and not finitely presented: the module statement needs `M`, not `B`, to be flat over `A`, and
  `M` is torsion, hence not flat. `M = B = A` is free of rank one and satisfies both statements.
- `A[x]/(ax)` with `a ≠ 0` a nonunit is finitely presented and not flat: the converse fails.
- For `A = ∏_ℕ 𝔽₂` and `I = ⊕_ℕ 𝔽₂` (the finitely supported sequences), `B = A/I` is flat (every
  module over an absolutely flat ring is flat) and of finite type; at every maximal ideal `𝔪` the
  localization `A_𝔪` is `𝔽₂` and `B_𝔪` is `0` or `𝔽₂`, finitely presented over it; but `I` is not
  finitely generated, so `B` is not finitely presented over `A`. Finite presentation is not detected
  at the localizations at maximal ideals, and `A` is not a domain, so the Raynaud–Gruson theorem does
  not apply to it.

### Examples

`ℚ(√2)/ℚ` at `7` has two prolongations and `L ⊗ Kʰ` two factors (§§1.1, 1.4); the `p`-adic
henselization of `ℚ` is immediate and not complete (§1.3); `A/𝔪` over a valuation ring whose
maximal ideal is not finitely generated, such as that of `ℂ_p`, is a non-flat finite-type algebra
that is not finitely presented (§1.5).

### Dependencies

Layer 0 is not used. Tau Ceti's prolongation lemmas for algebraic extensions (§1.1), henselization
and strict henselization; SchemeAndStackFoundations
§§0.12–0.13; ClassicalAdicEtaleCohomology §5.1 (§1.2); Mathlib valuation rings, integral closure,
étale algebras, flatness, finite presentation and homogeneous localization (§1.5).

## Layer 2: the ramification tower and the six extension classes

### 2.1 The étale criterion for unramified extensions

For a finite extension of valued fields `(L, W)/(K, V)`, prove that `Lʰ/Kʰ` is unramified (§2.3)
exactly when `W` is essentially étale over `V` (a localization of an étale `V`-algebra), that the
strict version adds equality of residue fields, that étale implies essentially étale, and that the
two are equivalent when `V` has finite height (Temkin 2017, Lemma 2.3.8, pp. 105–106). No noetherian
or rank-one hypothesis is made. Route: essentially étale identifies the strict henselizations; for
the converse, descend from a pointed étale neighbourhood `A′` of `V` in `Vˢʰ`, put `A = A′ ∩ L`, a
Prüfer domain by §1.1, over which `A′` is flat and of finite type, hence finitely presented by §1.5.
`Spec A′ → Spec A` is surjective, hence faithfully flat: for a prime `𝔮` of `A`, a relation
`1 = Σ q_i a_i` with `q_i ∈ 𝔮` and `a_i ∈ A′_𝔮` would give, for `q` a nonzero `q_i` of least value
in the valuation ring `A_𝔮` (§1.1), `q⁻¹ = Σ (q_i/q)·a_i ∈ A′_𝔮 ∩ L`; this intersection is `A_𝔮`
(if `s·x ∈ A′` with `s ∈ A ∖ 𝔮` and `x ∈ L`, then `s·x ∈ A`), which does not contain `q⁻¹`; so the
fibre over `𝔮` is not empty. Descent from the source along `Spec A′ → Spec A` (EGA IV, 17.7.5(iv)
and 17.7.7, pp. 73–75) then makes `A` étale over `V` at the point under consideration, and `W` is a
localization of `A`. At finite
height `Spec V` is finite, so the localization is obtained by inverting one element. *Needs:*
§§1.1–1.3 and §1.5; §2.3 for the definition; Tau Ceti `TauCeti.StrictHenselization.algebra`,
`TauCeti.StrictHenselization.exists_stage_eq`, `TauCeti.StrictHenselization.map`;
SchemeAndStackFoundations (gap:source-side-fpqc-descent, gap:source-side-etale-descent).

**Checks.**
- `K/K` is unramified and `V` is étale over itself.
- For `ℚ_p(√p)/ℚ_p` the ring `ℤ_p[√p]` is not essentially étale over `ℤ_p` (its maximal ideal is
  not generated by `p`), matching ramification.
- "Strictly essentially étale" means equality of residue fields, not separably closed residue field:
  `𝔽_p((t))` over itself is strictly unramified with residue field `𝔽_p`.

### 2.2 The ramification tower

Fix the prolongation of `V` to `Kᵃ`, with valuation subring `Vˢ` of `Kˢ`. Define `Kᵘ` as the
fraction field of the strict henselization of `Vʰ` inside `Kˢ` (the maximal unramified extension
of `Kʰ`); by ClassicalAdicEtaleCohomology §5.1 (a) its ring of integers is a strictly henselian
valuation ring with value group `Γ_K`, so `Kᵘ` is henselian with separably closed residue field.
Define `Kᵗ` as the maximal tame extension of `Kᵘ` in the sense of ClassicalAdicEtaleCohomology
§5.3, the union of the finite Galois extensions of `Kᵘ` in `Kˢ` of degree prime to `p`, so that
`K ⊆ Kʰ ⊆ Kᵘ ⊆ Kᵗ ⊆ Kˢ` (Temkin 2017, §2.3.5 and Remark 2.3.6, p. 105). Let
`D = ValuationSubring.decompositionSubgroup K Vˢ`, viewed in `Gal(Kˢ/K)`, `I` the image of
`ValuationSubring.inertiaSubgroup K Vˢ`, and `W` the Sylow pro-`p` subgroup of `I` (`W = 1` for
`p = 1`). The fixed field in `Kˢ` of the closed subgroup `I` is `Kᵘ`, and `D/I` is isomorphic to
the absolute Galois group of `κ_K`, by ClassicalAdicEtaleCohomology §5.1 (b)–(c); `Gal(Kᵗ/Kᵘ)` is
the group of ClassicalAdicEtaleCohomology §5.3 (i) for `Kᵘ`, whose value group is `Γ_K`. Prove that
the fixed fields in `Kˢ` of `D` and `W` are `Kʰ` and `Kᵗ`, that `I` and `W` are normal in `D`, that
the isomorphism `D/I ≅ Gal(κˢ/κ)` is a homeomorphism, and that changing the prolongation by
`σ ∈ G_K` conjugates `D`, `I`, `W` and transports the tower by `σ`. `Kʰ/K` need not be normal, so no
quotient by `D` is formed. Route: the universal property of `Kʰ` (§1.3) and infinite Galois theory
for `D`; `I = Gal(Kˢ/Kᵘ)`, so ClassicalAdicEtaleCohomology §5.3 (iii) for `Kᵘ` makes `Gal(Kˢ/Kᵗ)`
the unique Sylow pro-`p` subgroup of `I`, which is `W` and is normal in `D` because `I` is; the map
`D/I → Gal(κˢ/κ)` is continuous from a compact group onto a Hausdorff one; Sylow conjugacy for the
change of prolongation. *Needs:* §§1.2–1.3; ClassicalAdicEtaleCohomology §§5.1, 5.3; Mathlib
`ValuationSubring.decompositionSubgroup`, `ValuationSubring.inertiaSubgroup`; Tau Ceti
`TauCeti.StrictHenselization.algebra`, `TauCeti.AbsoluteGaloisGroup`,
`TauCeti.IsProPSylow.exists_map_conj_eq`, `TauCeti.IsProPSylow.eq_of_normal`.

- The ring of integers of `Kᵘ` is the strict henselization of `V`.
- The fixed fields in `Kˢ` of `D`, `I` and `W` are `Kʰ`, `Kᵘ` and `Kᵗ`. Fixed fields in `Kᵃ`
  would contain purely inseparable elements and are not used.
- `D/I` is topologically isomorphic to the absolute Galois group of `κ_K`.
- `Gal(Kᵗ/Kᵘ)` is the continuous character group of `Γ_K ⊗ ℤ_(p′)/Γ_K` with values in the
  prime-to-`p` roots of unity (ClassicalAdicEtaleCohomology §5.3 (i)).
- A different prolongation conjugates `D`, `I`, `W` and the tower.

**Checks.**
- For henselian `K`, `Kʰ = K` and `D` is all of `G_K`.
- For the trivial valuation `Kᵘ = Kᵗ = Kˢ` and `I = W = 1`.
- If `p = 1` then `Kᵗ = Kˢ` and `W = 1`.
- The `p`-adic henselization of `ℚ` is not normal over `ℚ`: `D` is a non-normal subgroup of `G_ℚ`.
- For `K = 𝔽_p(t)` with the trivial valuation, `W = 1` and its fixed field in `Kˢ` is `Kˢ`, while
  its fixed field in `Kᵃ` is `Kᵃ ≠ Kˢ`: the fixed-field statement must name `Kˢ`.

### 2.3 Unramified and strictly unramified extensions

Define an algebraic extension `L/K` of valued fields to be unramified when `Lʰ/Kʰ` lies in `Kᵘ`,
that is, `L ⊆ Kᵘ` inside `Kᵃ`, and strictly unramified when moreover the residue fields agree
(Temkin 2017, §§2.2.3 and 2.3.7, pp. 104–105).

- `L/K` is unramified exactly when `Lʰ/Kʰ` is.
- An unramified extension is separable, its residue extension is separable algebraic and its value
  group equals that of `K`.
- Over a henselian `K`, finite unramified extensions correspond to finite separable extensions of
  `κ_K`, compatibly with embeddings.
- `L/K` is strictly unramified exactly when `L ⊆ Kʰ` inside `Kᵃ`; over a henselian base a strictly
  unramified algebraic extension is trivial.

*Needs:* §1.3, §2.2; ClassicalAdicEtaleCohomology §5.1; Tau Ceti `TauCeti.StrictHenselization.algebra`.

**Checks.**
- `K/K` is unramified and strictly unramified; `Kʰ/K` is strictly unramified.
- `𝔽_{p^r}((t))/𝔽_p((t))` is unramified of degree `r`, and not strictly unramified for `r > 1`.
- `ℚ_p(p^{1/ℓ})/ℚ_p` is ramified for every prime `ℓ`: its value group grows.
- `𝔽_p((t))/𝔽_p((t))` is strictly unramified although `𝔽_p` is not separably closed.

### 2.4 Tame extensions and tame Galois extensions

Define an algebraic extension `L/K` of valued fields to be tame when `L ⊆ Kᵗ` inside `Kᵃ`, that is,
when `Lʰ/Kʰ` is tame (Temkin 2017, §§2.2.5–2.2.6, p. 104 and §2.3.7, p. 105).

- Tameness is invariant under passing to the henselizations.
- For a finite extension of a henselian `K` with maximal unramified subextension `M`, `L/K` is tame
  exactly when `[L : M]` is prime to `p`, exactly when `κ_L/κ_K` is separable, `[Γ_L : Γ_K]` is
  prime to `p` and `[L : K] = [κ_L : κ_K]·[Γ_L : Γ_K]` (no defect).
- Tame extensions are separable.
- Every prolongation to a compositum of a tame `L/K` with an arbitrary valued extension `K′/K` is
  tame over `K′`.
- The degree formula is not asserted for non-henselian `K`, where several prolongations change
  `[L : K]`.

Define `IsTameGaloisExtension V L`, for an intermediate field `L` of `AlgebraicClosure K` over `K`,
to mean that `L/K` is finite Galois and that for every valuation subring `A` of `L` lying over `V`
the group `ValuationSubring.inertiaSubgroup K A` has order prime to `ringExpChar` of the residue
field of `V`. Define `galoisTamePart V` as the compositum of all `L` with `IsTameGaloisExtension V L`.

- A finite Galois `L/K` satisfies `IsTameGaloisExtension V L` exactly when `L/K` is tame at every
  prolongation of `V`, exactly when `L ⊆ σ(Kᵗ)` for every `σ ∈ G_K` (the image of `I` in `Gal(L/K)`
  is the inertia group of `L/K` at the restricted prolongation, and the image of `W` its Sylow
  `p`-subgroup).
- `galoisTamePart V` is the largest subextension of `Kᵗ` that is Galois over `K`; when `V` is
  henselian it equals `Kᵗ`.
- For `p = 1`, every finite Galois extension satisfies `IsTameGaloisExtension V L` and
  `galoisTamePart V = Kˢ`.

*Needs:* §§2.2–2.3; ClassicalAdicEtaleCohomology §5.3 (ii); Mathlib `ValuationSubring.inertiaSubgroup`,
`IsGalois`, `ringExpChar`.

**Checks.**
- For a prime `ℓ ≠ p`, `ℚ_p(p^{1/ℓ})/ℚ_p` is tame of degree `ℓ`; `ℚ_p(p^{1/p})/ℚ_p` is not tame.
- With the trivial valuation, finite separable extensions are tame and nontrivial purely
  inseparable ones are not.
- A nontrivial immediate Artin–Schreier extension of a henselian field of characteristic `p` (a
  defect extension, `e = f = 1`, degree `p`) is not tame: a definition testing only residue
  separability and the value-group index would accept it.
- For odd `p`, `ℚ_p(ζ_p)/ℚ_p` is a tame Galois extension, its inertia group having order
  `p − 1`; `ℚ_2(i)/ℚ_2` and `ℚ_p(ζ_{p²})/ℚ_p` do not (inertia of order `2` and `p(p − 1)`). The
  unramified extension of `ℚ_p` of degree `p` does satisfy it although its decomposition group has
  order `p`: the definition must use inertia, not decomposition.
- For `ℚ` with the `7`-adic valuation, `ℚ(√2)` is a tame Galois extension, its inertia groups at
  both prolongations being trivial, while the splitting field `N` of `X³ − X − 2` over `ℚ` with the
  `2`-adic valuation is not (inertia of order `2` at `p = 2`); its cubic subfield fixed by a
  decomposition group lies in `Kʰ ⊆ Kᵗ` but not in the Galois tame part, which meets `N` in `ℚ`
  (the Galois subextensions of `N` are `ℚ`, `ℚ(√−26)`, ramified at `2`, and `N`). So the Galois
  tame part differs from `Kᵗ` for this non-henselian `V`.

### 2.5 Henselian extensions and disjointness from the henselization

Define an algebraic extension `L/K` of valued fields to be a henselian extension when `V` has exactly
one prolongation to `L` (Temkin 2017, §2.3.10, p. 106). Prove that `L/K` is henselian exactly when
`L` and `Kʰ` are linearly disjoint over `K`, and that then multiplication `L ⊗_K Kʰ → Lʰ` is an
isomorphism (Temkin 2017, Lemma 2.3.11, p. 106). Route: for finite `L` the tensor decomposition §1.4
has one factor exactly when there is one prolongation, and an algebraic tensor product is a field
exactly when the multiplication map is injective; pass to finite subextensions, the henselization
of the directed union of the local rings `W ∩ L_j` being the directed colimit of their
henselizations (`TauCeti.Henselization.directLimitEquiv`; EGA IV, Proposition 18.6.14(ii), p. 141).

- Every prolongation to `L` is the chosen one.
- The identity extension is henselian for every `K`; every algebraic extension of a henselian field is
  henselian.
- Purely inseparable extensions are henselian.

*Needs:* §1.1, §1.4; Tau Ceti `TauCeti.Henselization.directLimitEquiv`; Mathlib
`IntermediateField.LinearDisjoint`.

**Checks.**
- `ℚ/ℚ` with the `p`-adic valuation is a henselian extension, although `ℚ` is not henselian.
- `ℚ(√2)/ℚ` at `7` has two prolongations: it is not henselian, and `ℚ(√2) ⊗ ℚʰ` has two factors.
- A purely inseparable extension is linearly disjoint from the separable `Kʰ`, so its tensor product
  with `Kʰ` is a field.

### 2.6 Totally ramified and purely wild extensions

Define an algebraic extension `L/K` to be totally ramified when `L` and `Kᵘ` are linearly disjoint
over `K`, and purely wild when `L` and `Kᵗ` are linearly disjoint over `K` (Temkin 2017, §§2.2.4 and
2.2.7, p. 104 and §2.3.12, p. 106). Prove: `L/K` is totally ramified exactly when it is henselian
and `κ_L/κ_K` is purely inseparable; purely wild exactly when it is a totally ramified `{p}`-extension;
over a henselian `K`, purely wild exactly when `κ_L/κ_K` is purely inseparable and `Γ_L/Γ_K` is a
`p`-primary torsion group, defect allowed; and every purely inseparable extension is purely wild
(Temkin 2017, §2.2.7, p. 104 and §2.3.12, p. 106). For infinite extensions "`p`-primary" means that
every element has `p`-power order. *Needs:* §§2.2–2.5, §0.2; ClassicalAdicEtaleCohomology §5.3; Mathlib
`IntermediateField.LinearDisjoint`, `IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`.

- Total ramification is disjointness from `Kᵘ` with the given embeddings; pure wildness is
  disjointness from `Kᵗ`.
- For finite extensions of local fields total ramification is the condition `f = 1` of the base
  roadmap (§2.9).

**Checks.**
- `K/K` is totally ramified and purely wild.
- `𝔽_p(u^{1/p})((t))/𝔽_p(u)((t))` is totally ramified in this convention, with `e = 1` and residue
  degree `p`; the convention `f = 1` would reject it.
- A root `a` of `a^p − a = t⁻¹` gives a purely wild extension of `𝔽_p((t))` of degree `p` and
  ramification index `p`; `𝔽_p((t^{1/p}))/𝔽_p((t))` is purely wild.
- For `ℓ ≠ p`, `ℚ_p(p^{1/ℓ})/ℚ_p` is not purely wild; a nontrivial unramified extension of a
  henselian field is not totally ramified.
- With residue characteristic zero every purely wild algebraic extension is trivial.

### 2.7 Tame and separably tame fields

Define `IsSeparablyTameField V` to mean that every finite Galois subextension `L` of
`AlgebraicClosure K` over `K` satisfies `IsTameGaloisExtension V L`, and `IsTameField V` to mean
that `K` is perfect and `IsSeparablyTameField V`. Prove that `IsSeparablyTameField V` holds exactly
when `Kˢ = Kᵗ`, and `IsTameField V` exactly when `Kᵃ = Kᵗ`, that is, when every algebraic extension of
`K` is tame at every prolongation (Temkin 2017, §2.3.9, p. 106: purely inseparable extensions are
purely wild, so a tame field is perfect). No henselian hypothesis is part of either definition.

- `IsTameField V` holds exactly when every algebraic extension with every prolongation is tame.
- A tame field is perfect, and full tameness is perfection together with separable tameness.
- `IsTameField V` implies `IsSeparablyTameField V`.
- Every algebraic extension of a tame valued field is a tame valued field for every prolongation.
- If the residue characteristic exponent is `1`, `IsTameField V` holds.

*Needs:* §2.4, §2.6; Mathlib `PerfectField`.

**Checks.**
- A trivially valued field is tame exactly when it is perfect, and is always separably tame
  (inertia groups of the trivial valuation are trivial).
- Every valuation on an algebraically closed field is tame.
- The trivially valued `𝔽_p(t)` is separably tame and not tame.
- `ℚ_p` is henselian and not separably tame: `ℚ_p(ζ_{p²})/ℚ_p` is Galois with inertia group of
  order `p(p − 1)`.

### 2.8 Tower and filtered-union laws

For each of the six properties strictly unramified, unramified, tame, henselian, totally ramified and
purely wild, prove that an algebraic tower `M/L/K` has the property exactly when both `M/L` and `L/K`
have it, that a directed union of subextensions with the property has it, and that `Lʰ = L·Kʰ`,
`Lᵘ = L·Kᵘ` and `Lᵗ = L·Kᵗ` inside `Kᵃ` for the chosen prolongation (Temkin 2017, Lemma 2.4.2(i)–(ii),
p. 107). Prove that unramified and tame extensions remain so under every valued base change and every
prolongation to the compositum. Route: the first three properties are membership in `Kʰ`, `Kᵘ`,
`Kᵗ`; the last three are disjointness from them, handled by the compositum identities and tensor
associativity; unions by finiteness of linear relations and `TauCeti.Henselization.directLimitEquiv`;
base change through the strict henselizations and the radical description of
ClassicalAdicEtaleCohomology §5.3 (ii). *Needs:* §§2.3–2.6; ClassicalAdicEtaleCohomology §5.3; Tau
Ceti `TauCeti.Henselization.directLimitEquiv`.

**Checks.**
- Each of the six properties holds for the identity tower `K/K/K`.
- The compositum identities depend on the chosen prolongation: for `ℚ(√2)/ℚ` at `7`, `Lʰ = L·Kʰ` holds
  for each of the two prolongations, through the two embeddings `√2 ↦ ±s` of `L` into `H_7`, where
  `s` is a `7`-adic square root of `2`.
- Degrees are not preserved by arbitrary base change: `ℚ(√2) ⊗ ℚ_7` is not a field.

### 2.9 Comparison with local fields and complete discretely valued fields

Let `K` be a nonarchimedean local field (Mathlib's `IsNonarchimedeanLocalField`) with its valuation
subring, residue characteristic `p` and residue field of order `q`, and `L/K` a finite extension
inside `Kᵃ` with the unique prolongation. Prove that the classes of this layer agree with those of
LocalFieldsRamification: `L/K` is unramified here exactly when `TauCeti.IsUnramified K L`
(`e = 1`), totally ramified here exactly when `TauCeti.IsTotallyRamified K L` (`f = 1`), and tame
here exactly when `TauCeti.IsTamelyRamified K L` (`p ∤ e`). Prove that `Kᵘ` and `Kᵗ` of §2.2 are
`TauCeti.maximalUnramifiedExtension K (AlgebraicClosure K)` and
`TauCeti.maximalTameExtension K (AlgebraicClosure K)`, and that under the identification of `G_K`
with `Gal(Kˢ/K)` of the Conventions `I` and `W` are `TauCeti.inertiaSubgroup K` and
`TauCeti.wildInertiaSubgroup K`, with the character pairing of ClassicalAdicEtaleCohomology §5.3 (ii)
for `Kᵘ` restricting to the tame character `TauCeti.inertiaTameCharacter K`, on which an arithmetic
Frobenius lift (`TauCeti.IsArithFrobeniusLift`) acts through `ζ ↦ ζ^q` on prime-to-`p` roots of
unity. Route: a local field is henselian with perfect residue field and its finite extensions
satisfy `[L : K] = e·f` (`TauCeti.ramificationIndex_mul_inertiaDegree`); substitute in §§2.3–2.6,
and compare the generators `π^{1/m}`, `p ∤ m`, of `TauCeti.maximalTameExtension` with the radical
description of ClassicalAdicEtaleCohomology §5.3 (ii). *Needs:* §§2.2–2.8; ClassicalAdicEtaleCohomology
§5.3; LocalFieldsRamification, Layers 2–4, through the Tau Ceti declarations named here.

For a finite separable extension `L/K` of complete discretely valued fields with arbitrary residue
field, the setting of RamificationOfCompleteDiscretelyValuedFields §3a.1, prove that `L/K` is
unramified here exactly when `e = 1` and `κ_L/κ_K` is separable, which is the notion of unramified
there; that `L/K` is totally ramified here exactly when `κ_L/κ_K` is purely inseparable; hence that
`f = 1`, which is total ramification there, implies total ramification here, and that the two
notions of total ramification differ exactly when `κ_L/κ_K` is nontrivial and purely inseparable.
Route: `K` is henselian, so every algebraic extension of `K` is a henselian extension and §2.6 gives
the second statement; for the first, `L ⊆ Kᵘ` gives `e = 1` and a separable residue extension by
§2.3, and conversely the unramified extension `M ⊆ Kᵘ` with residue field `κ_L` (§2.3) embeds in `L`
over `K` with degree `f`, which is `[L : K]` because `[L : K] = e·f` (§3a.1 there for a Galois
closure `L′` of `L/K`, with `e` and `f` multiplicative in `L′/L/K` and `e·f` at most the degree in
each step), so `L` is the image of `M` under a `K`-embedding and lies in `Kᵘ`, which is normal over
the henselian `K` (`I` is normal in `D = G_K`, §2.2). *Needs:* §§2.2–2.3, §2.6;
RamificationOfCompleteDiscretelyValuedFields §3a.1.

**Checks.**
- Over `K = 𝔽_p(s)((t))` let `L = K(y)` with `y^p − y = s·t^{−p}`. With `z = t·y`,
  `z^p − t^{p−1}·z = s`, so `κ_L = 𝔽_p(s^{1/p})`, `e = 1` and `f = p = [L : K]`. `L/K` is Galois of
  degree `p` and `L ⊄ Kᵘ`, since its residue extension is inseparable, so `L ∩ Kᵘ = K` and `L` is
  linearly disjoint from `Kᵘ`: `L/K` is totally ramified here and, with `f = p`, not totally
  ramified in the sense of RamificationOfCompleteDiscretelyValuedFields §3a.1. It is unramified in
  neither sense.
- `𝔽_{p²}((t))/𝔽_p((t))` has `e = 1` and separable `f = 2`: unramified in both senses and totally
  ramified in neither.
- `ℚ_p(p^{1/ℓ})/ℚ_p` with `ℓ ≠ p` prime is tame in both senses, with `e = ℓ`.
- The convention of arithmetic Frobenius is the supplier's: on the unramified extension `ℚ_p(ζ_ℓ)`,
  `ℓ ≠ p`, the arithmetic Frobenius sends `ζ_ℓ` to `ζ_ℓ^p`, not to `ζ_ℓ^{p⁻¹}`.
- "Tame exactly when `p ∤ e`" is not a definition for general valued fields: the defect extension of
  §2.4 has `e = 1` and is not tame.

### 2.10 The tame tower under perfection

Let `K` have characteristic `q > 0` and `K^{perf}` its perfection with the unique prolongation of
`V`. Prove that `L ↦ L·K^{perf}` is an equivalence from finite separable extensions of `K` to those of
`K^{perf}` preserving degrees, unramifiedness and tameness after henselization, that
`(K^{perf})ᵗ = Kᵗ·K^{perf}` in `Kᵃ`, that residue fields and value groups change by perfection and by
`q`-divisible hull, and that `IsSeparablyTameField V` holds exactly when the perfection is a tame
valued field (Temkin 2017, §2.4.6 and proof of Theorem 2.5.5, pp. 108–110). In characteristic zero the
comparison is the identity. *Needs:* §0.3, §§2.4–2.7; Mathlib
`IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`,
`IsPurelyInseparable.finrank_eq_pow`; Tau Ceti `TauCeti.absoluteGaloisGroupRestrictEquiv`.

**Checks.**
- For `𝔽_p(t)` with the `t`-adic valuation the value group changes from `ℤ` to `ℤ[1/p]`.
- A radical `t^{1/ℓ}` with `ℓ ≠ p` stays tame of degree `ℓ` over the perfection.
- The Artin–Schreier extension `a^p − a = t⁻¹` stays wild over the perfection: perfection does not
  make the separable theory tame.

### Examples

The trivial valuation: `Kʰ = K`, `Kᵘ = Kᵗ = Kˢ`, every finite separable extension is unramified and
tame and every purely inseparable one purely wild, so the field is tame exactly when perfect and
always separably tame (§§2.2, 2.7). `ℚ` with the `7`-adic valuation and `ℚ(√2)`: two prolongations, a
tame Galois extension that is not henselian (§§2.4–2.5). `𝔽_p((t))` with `a^p − a = t⁻¹`: purely
wild of degree `p` (§2.6).

### Dependencies

Layer 1; Layer 0 for `{p}`-extensions (§2.6) and `P`-closedness under perfection (§2.10);
ClassicalAdicEtaleCohomology §§5.1 and 5.3; Tau Ceti's strict henselization, directed colimits of
henselizations and Sylow theory; SchemeAndStackFoundations, the two descent gaps (§2.1);
LocalFieldsRamification Layers 2–4 and RamificationOfCompleteDiscretelyValuedFields §3a.1 (§2.9
only); Mathlib decomposition and inertia subgroups.

## Layer 3: sections through pro-`p` kernels and the splitting theorem over henselian fields

### 3.1 Sections through pro-`p` kernels

Prove `exists_continuous_section_of_isProP_ker`: for a prime `p` and a continuous surjective
homomorphism `f : E → G` of profinite groups whose kernel is pro-`p` (`TauCeti.IsProP`), if
`TauCeti.cohomologicalDimensionAt p G ≤ 1` then `f` has a continuous homomorphic section (Serre,
*Galois Cohomology*, I §3.4, Proposition 16; cited in Kuhlmann–Pank–Roquette 1986, p. 44). The
relative form follows by applying it to a closed subgroup `E′ ⊆ E` with `f(E′) = G`. Route, in
three steps of which only the second is proved here. (a) By
`TauCeti.cohomologicalDimensionAt_le_iff` the hypothesis is the vanishing predicate
`TauCeti.CohomologicalDimensionLE p G 1`, which solves every finite embedding problem for `G` with
`p`-group kernel, `TauCeti.HasPGroupSolutions p G`: the obstruction for an elementary abelian kernel lies in
`H²(G, −) = 0` (`TauCeti.CohomologicalDimensionLE.hasElementaryAbelianSolutions`), and the lower
`p`-central series of a finite `p`-group kernel reduces to that case
(`TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions`). (b) Write `N = ker f` and choose a
closed subgroup `H ⊆ E` minimal among the closed subgroups with `f(H) = G`
(`Subgroup.exists_minimal_isClosed_le`, applied to the graph of `f` in `E × G`). For an open normal
subgroup `U` of `E`, the image `K_U` of `H ∩ N` in `E/U` is a finite continuous quotient of a closed
subgroup of the pro-`p` group `N`, hence a `p`-group; the reduction `H → E/U` descends modulo `K_U`
to a continuous homomorphism from `G = H/(H ∩ N)` to the quotient of the image of `H` by `K_U`,
which (a) lifts to a continuous homomorphism `β_U : G → E/U`. Over each `g ∈ G` some element of `H`
reduces to `β_U(g)`, because two elements of the image of `H` with the same class modulo `K_U` differ
by the reduction of an element of `H ∩ N`; so the elements of `H` whose reduction modulo `U` is
`β_U` of their image form a closed subgroup of `H` projecting onto `G`, which is `H` by minimality.
Hence `f̄ ∘ β_U` is the projection `G → G/f(U)`, so `β_U` solves the finite-level problem of `f` and
the identity of `G` at `U` (`TauCeti.LevelSolution`), and the `β_U` are compatible along `V ≤ U`
(`TauCeti.levelSolutionMap`), both because every element of `H` over `g` reduces to `β_U(g)`. This
is the argument of `TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions` with a pro-`p`
kernel in place of a pro-`p` source: there `K_U` is a `p`-group as a subgroup of the `p`-group
`E/U`, here as a quotient of a closed subgroup of `N`. (c) The compatible family assembles into a
continuous homomorphism
`s : G → E` with `f ∘ s = id` by `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`,
which assumes nothing pro-`p` about `E`. When `E` is itself pro-`p` the whole statement is
`TauCeti.isProjective_of_hasPGroupSolutions` with `TauCeti.IsProjective.exists_continuous_lift`.
*Needs:* Tau Ceti `TauCeti.IsProP`, `TauCeti.cohomologicalDimensionAt`,
`TauCeti.cohomologicalDimensionAt_le_iff`, `TauCeti.HasPGroupSolutions`,
`TauCeti.CohomologicalDimensionLE.hasElementaryAbelianSolutions`,
`TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions`, `TauCeti.LevelSolution`,
`TauCeti.levelSolutionMap`, `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`,
`Subgroup.exists_minimal_isClosed_le`; ProfiniteProPGroups, Layer 5 (items 5.1–5.6) and Layer 6
(Serre's theorem, step 1); ProfiniteCohomology, Layer 11 (the invariant `cd_p`).

**Checks.**
- For `G = ℤ_p` (`cd_p = 1`, free pro-`p`) every extension by a pro-`p` group splits.
- For `G = ℤ/p` (`cd_p = ∞`) the extension `ℤ/p² → ℤ/p` does not split: the hypothesis is needed.
- If the kernel is trivial, `f` is an isomorphism of profinite groups and the section is `f⁻¹`.
- For `E = Ẑ = ℤ_p × ∏_{ℓ ≠ p} ℤ_ℓ` and `f` the projection onto `G = ∏_{ℓ ≠ p} ℤ_ℓ`, the kernel
  `ℤ_p` is pro-`p` and `cd_p G = 0` (its Sylow pro-`p` subgroup is trivial), so the theorem gives a
  section, the inclusion of the second factor; `E` is not pro-`p`, so the projectivity lifting
  `TauCeti.IsProjective.exists_continuous_lift`, which needs a pro-`p` source, does not cover this
  case: step (b) of the route is what is proved here.

### 3.2 Maximal extensions with prescribed ramification

For any set `S` of the six properties of Layer 2, prove that every subextension of `Kᵃ/K` with all
properties in `S` is contained in a maximal one, and likewise inside `Kˢ` (Temkin 2017, Lemma
2.4.2(iii), p. 107, by Zorn's lemma and §2.8).

- Every admissible intermediate field has a maximal admissible enlargement.
- A maximal admissible field has no nontrivial further extension with all properties in `S`.
- The construction inside `Kˢ` gives maximal separable `S`-extensions.
- Valued isomorphisms transport maximality; the choice is not canonical.

*Needs:* §2.8.

**Checks.**
- For `S = ∅` the maximal object is `Kᵃ`; for `S = {tame}` it is `Kᵗ`.
- For `ℚ_p` a maximal purely wild extension contains no tame radical `p^{1/ℓ}`, `ℓ ≠ p`.
- Maximal purely wild extensions of `ℚ_p` are not unique: a maximal one is not normal over `ℚ_p`
  (otherwise `G_{ℚ_p}` would be the direct product of `W` and `Gal(Kᵗ/ℚ_p)`), so some conjugate of it
  is a different maximal one.

### 3.3 Unramified and tame complements

Prove: if `K_hu/K` is maximal among henselian unramified extensions, then multiplication gives
`Kʰ ⊗_K K_hu ≅ Kᵘ`; if `K_rt/K` is maximal among tame totally ramified extensions, then
`Kᵘ ⊗_K K_rt ≅ Kᵗ` (Temkin 2017, Lemma 2.4.4, pp. 107–108). Route: disjointness holds by definition;
maximality forces the residue field of `K_hu` to be separably closed and the value group of `K_rt` to
be the prime-to-`p` divisible hull of `Γ_K`. *Needs:* §0.5, §§2.2–2.6, §3.2.

**Checks.**
- With the trivial valuation the first complement is `Kˢ` and the second is `K`.
- For `ℚ_p`, `K_hu` is the maximal unramified extension and one choice of `K_rt` is generated by a
  compatible system of roots `p^{1/n}`, `p ∤ n`.
- The tensor identity is stronger than the compositum equality. For `K = ℚ_3`, the tame totally
  ramified `F = ℚ_3(√3)` has `e = 2` and `F ∩ Kᵘ = K`, and `Kᵘ ⊗_K F → Kᵘ(√3)` is bijective, both
  sides of dimension `2` over `Kᵘ`. The unramified quadratic `F′ = ℚ_3(√−1)` (`−1` is not a square
  modulo `3`) is tame with `F′·Kᵘ = Kᵘ`, but `Kᵘ ⊗_K F′ ≅ Kᵘ × Kᵘ` has dimension `2` over `Kᵘ` and
  its multiplication map onto `Kᵘ` has a kernel of dimension `1`: `F′` is not totally ramified and
  is no tame complement, although a test of the compositum alone would accept it.

### 3.4 Splitting equivalences

Let `𝒱` be a class of valued fields closed under algebraic extensions. Prove that the following are
equivalent: (0) for each `K ∈ 𝒱` some maximal purely wild `K_w` satisfies `Kᵗ ⊗_K K_w ≅ Kᵃ`; (1) every
maximal purely wild `K_w` does; (2) every maximal purely wild `K_w` is a tame field; (3) `K ∈ 𝒱` is
tame exactly when it has no nontrivial purely wild extension; and the same with `Kᵃ` replaced by
`Kˢ`, purely wild by separable purely wild and tame by separably tame (Temkin 2017, §2.4.6 and
Remark 2.4.7, p. 108). For henselian `K` these are also equivalent to the existence of a continuous
section `Gal(Kᵗ/K) → G_K` of the quotient map, `G_K` then being the semidirect product of `W` and
`Gal(Kᵗ/K)`. For non-henselian `K` the group-theoretic form is a closed subgroup `H ⊆ G_K` with
`W·H = G_K` and `W ∩ H = 1`, where `W` is the wild subgroup of §2.2 for the chosen prolongation and
need not be normal in `G_K`. Route: (1) ⇒ (0) is trivial; (0) for the perfection gives (1) through
§2.10; a maximal purely wild extension of a field without purely wild extensions is the field itself;
if `K_w` is tame, `Kᵃ/(Kᵗ·K_w)` is both tame and purely wild, hence trivial. *Needs:* §0.5, §§2.7–2.8,
§2.10, §3.2; Mathlib `IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`; Tau
Ceti `TauCeti.absoluteGaloisGroupRestrictEquiv`.

**Checks.**
- For `ℚ` with the `2`-adic valuation and `N` the splitting field of `X³ − X − 2`, `Gal(N/ℚ) = S₃`
  (no rational root among `±1, ±2`; discriminant `−104` not a square), the root `0` modulo `2` lifts
  to `ℚ_2`, and the quadratic factor over `ℚ_2` has discriminant in the class of `−104`, of
  `2`-adic valuation `3`, hence is ramified. Decomposition and wild inertia at the corresponding
  prolongation are the same subgroup of order `2`, which is not normal in `S₃`; so `W` is not normal
  in `G_ℚ` and `Kᵗ/ℚ` is not Galois: the quotient formulation needs the henselian hypothesis.
- For `K` tame, the maximal purely wild extension is `K` and (1) reads `Kᵗ = Kᵃ`.
- For `p = 1`, `K_w` is the perfection of `K`, which is `K` itself.

### 3.5 The Kuhlmann–Pank–Roquette theorem

Prove `sup_galoisTamePart_eq_top_of_henselian`: let `(K, V)` be henselian and `E` an intermediate
field of `AlgebraicClosure K` over `K` that is linearly disjoint from `galoisTamePart V` and maximal
with this property; then `E ⊔ galoisTamePart V = ⊤`. Since `galoisTamePart V = Kᵗ` for henselian
`V` (§2.4), this is the splitting `Kᵗ ⊗_K K_w ≅ Kᵃ` for every maximal purely wild `K_w`; the
separable form `Kᵗ ⊗_K K_sw ≅ Kˢ` for every maximal separable purely wild `K_sw` follows (Kuhlmann,
Pank and Roquette 1986, Theorems 2.1–2.2, p. 42, Corollary 2.5 and proof of Theorem 2.2, p. 44;
Temkin 2017, Theorem 2.4.9, p. 109). For `p = 1` it reduces to `Kᵗ = Kˢ` and `K_w = K^{perf}`.
Route for prime `p`: the Sylow pro-`p` subgroups of `G_K/W` map isomorphically onto those of
`G_κ` (the kernel `I/W` has order prime to `p`, and `TauCeti.IsProPSylow.map_of_surjective`), so
`cd_p(G_K/W) = cd_p(G_κ) ≤ 1` by `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq` and the bound
`cd_p(G_κ) ≤ 1` for the residue field `κ` of characteristic `p` (ProfiniteCohomology,
gap:char-p-galois-h2-vanishing); §3.1 gives a section of `G_K → G_K/W` through any closed subgroup
surjecting onto `G_K/W`, which is the group form (ii) of Kuhlmann–Pank–Roquette; Galois theory over
the perfection and §3.4 translate it to the field statement for every maximal choice. No finite
generation and no Schur–Zassenhaus argument is used. *Needs:* §§2.2, 2.4, 2.10, §3.1, §3.4;
ProfiniteCohomology (gap:char-p-galois-h2-vanishing); Tau Ceti `TauCeti.IsProPSylow`,
`TauCeti.exists_isProPSylow`, `TauCeti.IsProPSylow.map_of_surjective`,
`TauCeti.IsProPSylow.cohomologicalDimensionAt_eq`.

**Checks.**
- For `ℚ_p`, `Kᵗ` is generated over the maximal unramified extension by the roots `p^{1/n}`,
  `p ∤ n`; `ℚ_p(p^{1/p^∞})` is purely wild, is contained in some maximal purely wild extension, and
  no maximal purely wild extension contains `p^{1/ℓ}` for a prime `ℓ ≠ p`.
- For `K` separably closed, henselian and imperfect of characteristic `p`, the Galois tame part
  is `K`, the only maximal `E` is `Kᵃ`, and the conclusion holds trivially.
- For `p = 1`, the Galois tame part is `Kᵃ`, the only admissible `E` is `K` (a nontrivial `E` has
  `E ⊗_K Kᵃ` of dimension `[E : K] > 1` over `Kᵃ`), and `K ⊔ Kᵃ = Kᵃ`.
- A Schur–Zassenhaus argument alone does not suffice when `G_κ` has nontrivial pro-`p` quotients:
  for `κ = 𝔽_p`, `G_κ = Ẑ` has the quotient `ℤ_p` and `cd_p Ẑ = 1`
  (`TauCeti.zHat.cohomologicalDimensionAt_eq_one`), so
  the bound `cd_p(G_κ) ≤ 1` is attained, and it is this cohomological input that covers the case.

### Examples

`ℚ_p`: the complements of §3.3 are explicit and some maximal purely wild extension contains
`p^{1/p^∞}` (§3.5). `ℚ` at `2` with `X³ − X − 2`: wild inertia is not normal (§3.4). `ℚ_3`: the
unramified quadratic extension is tame but no tame complement (§3.3).

### Dependencies

Layers 0 and 2; Tau Ceti Sylow theory, `TauCeti.cohomologicalDimensionAt` and the embedding-problem
modules (`TauCeti.HasPGroupSolutions`, `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`);
ProfiniteProPGroups, Layers 2, 5 and 6; ProfiniteCohomology, Layer 11 and the bound
`cd_p(G_F) ≤ 1` in characteristic `p` (gap:char-p-galois-h2-vanishing, §3.5).

## Layer 4: height one

Rank one is used exactly where approximation is needed: the completion supplies density and root
control, while the object descended is an extension of the henselization.

### 4.1 The rank-one norm, Krasner's lemma and continuity of roots

Let `K` have height one. Choose an order embedding of `Γ_K` into the positive reals
(`Valuation.RankOne`) and the associated ultrametric norm. Prove: the completion `K̂` is henselian and
contains `Kʰ`, so `K` is dense in `Kʰ`; Krasner's lemma over a henselian base,
`isKrasner_of_henselianLocalRing`: for a nontrivially normed field `K` with ultrametric norm whose
valuation subring `{x | ‖x‖ ≤ 1}`, that of `NormedField.valuation`, is a henselian local ring, and an
algebraic extension `L/K` with a field norm extending that of `K` (a normed `K`-algebra), normal or
not, `IsKrasner K L` holds, with no completeness of `K` (Temkin 2017, proof of Lemma 2.5.2, p. 109,
which applies Krasner's lemma over the henselization); and roots of monic polynomials depend
continuously on the coefficients. Route for Krasner's lemma: over a henselian base the norm has a
unique extension to every algebraic extension, so all conjugates of an element have the same norm
and the norm of `L` is the spectral norm; with this in place of completeness, the arguments of
`IsKrasner.of_completeSpace_of_normal` and of the reduction to the normal case in
`IsKrasner.of_completeSpace` apply. The continuity statement needs no
height hypothesis and is stated for any valued field, in additive notation with values in the
divisible hull of `Γ_K` (the value group of `Kᵃ` for the fixed prolongation). Let `f ∈ K[X]` be
monic of degree `n ≥ 1` with roots `α_1, …, α_n` in `Kᵃ`, let `g ∈ K[X]` be monic, write `v(f − g)`
for the least value of a coefficient of `f − g` (the Gauss valuation, with `v(0) = ∞`), put
`γ* = min(0, min_i v(α_i))`, the threshold `ε_{f,g} = v(f − g)/n + γ*` (`ε_{f,g} = ∞` when `f = g`)
and, for `n ≥ 2`, `kras(f) = max_{i ≠ j} v(α_i − α_j)`. If `ε_{f,g} > 0`, then `deg g = n` and, for
every tolerance `ε` with `0 < ε ≤ ε_{f,g}`, every root of `g` is at distance value at least `ε` from
some root of `f` and every root of `f` is at distance value at least `ε` from some root of `g`; if
moreover `f` is separable and `ε > kras(f)` (no condition when `n = 1`), that root is unique in both
directions and `g` is separable. For `n = 0`, that is `f = 1`, there are no roots, no threshold is
formed and nothing is asserted (Temkin 2017, §2.5.1 and proof of Lemma 2.5.2, pp. 109–110; Ćmiel,
Kuhlmann and Szewczyk 2023, Theorem 16 with its proof, pp. 13–15, which contains Theorem 14, p. 12).
Route for the tolerance form: Theorem 16 there gives the conclusions at `ε_{f,g}`, hence at every
smaller tolerance; for `kras(f) < ε ≤ ε_{f,g}`, two roots of `f` within `ε` of one root of `g` would
be within `ε` of each other, and a root of `g` within `ε` of a root `α` of `f` is paired with `α` at
`ε_{f,g}`, where the ball around `α` contains exactly one root of `g`. In rank one the direction
from the roots of `f` to those of `g`, with a weaker radius and a split `g`, is Mathlib's
`Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`, which suffices for the existence step
of §4.2; the statement here adds the Krull-valued form, the converse direction, the threshold
`ε_{f,g}` and uniqueness. *Needs:* §1.3; Mathlib `Valuation.RankOne`, `NormedField.valuation`,
`HenselianLocalRing`, `IsKrasner`, `IsKrasner.krasner`, `IsKrasner.of_completeSpace_of_normal`,
`IsKrasner.of_completeSpace`, `UniformSpace.Completion`, `Polynomial.Monic`,
`Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` and
`Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt` (the rank-one existence direction).

**Checks.**
- Uniqueness needs a tolerance strictly above `kras(f)`: for `f = g = (X − 1)(X + 1)` over `ℚ` with
  the `2`-adic valuation, `kras(f) = v(2) = 1` and `ε_{f,g} = ∞`; at the admissible tolerance `ε = 1`
  both roots `1` and `−1` of `g` are at distance value at least `1` from the root `1` of `f` (the
  values are `∞` and `1`; Ćmiel–Kuhlmann–Szewczyk 2023, Example 15, p. 12), while at the tolerance
  `ε = 2` only the root `1` is. A statement with the threshold set equal to `kras(f)` would assert a
  uniqueness that fails.
- For `f = X`, `g = X − 2` over `ℚ_2` (`n = 1`): `v(f − g) = v(2) = 1` and `γ* = min(0, v(0)) = 0`, so
  `ε_{f,g} = 1`, and the roots `0` and `2` are at distance value exactly `1`: the bound is non-strict
  and attained.
- `γ*` cannot be dropped: over `ℚ_2` let `f = X² − 1/16`, with roots `±1/4` of value `−2`, and
  `g = X² + 2X − 1/16`. Then `v(f − g) = 1`, so `v(f − g)/2 = 1/2 > 0`, while `ε_{f,g} = 1/2 − 2 < 0`
  and nothing is asserted. The roots of `g` are `−1 ± √17/4` with `√17 ≡ 9 mod 32`, that is
  `5/4 + 8w` and `−13/4 − 8w` with `w ∈ ℤ_2`; each is at distance value at most `0` from `±1/4`, below
  `1/2`.
- For `n = 0` (`f = g = 1`) both root sets are empty and no division by `n` occurs.
- For `K = ℚ` with the `p`-adic valuation, `Kʰ` is the algebraic closure of `ℚ` in `ℚ_p` and `ℚ` is
  dense in it.
- Krasner's lemma needs the henselian hypothesis: over `ℚ` with the `7`-adic norm, give
  `L = ℚ(√2)` the extended norm for which `√2` is the `7`-adic square root `s ≡ 3` modulo `7`. Then
  `x = √2` is separable with its conjugate `−√2` in `L` and `‖x − (−x)‖ = ‖2s‖ = 1`, while `y = 3`
  has `‖x − y‖ = ‖s − 3‖ ≤ 1/7 < 1`, yet `x ∉ ℚ(y) = ℚ`; and `ℤ_(7)` is not henselian (`X² − 2` has
  two simple roots modulo `7` and none in `ℚ`).
- For `K = H_p`, which is henselian and not complete, and `L` an algebraic closure of `K` with the
  extended norm, Krasner's lemma over a henselian base applies while the complete-base instance
  `IsKrasner.of_completeSpace` does not; for `K = ℚ_p` both give `IsKrasner K L`.

### 4.2 Decompletion

Let `K` have height one and `L/Kʰ` be separable algebraic. Prove that there is a henselian algebraic
extension `E/K` with a valued isomorphism `Eʰ ≅ L` and `E ⊗_K Kʰ ≅ L`; for finite `L` one can take
`[E : K] = [L : Kʰ]` (Temkin 2017, Lemma 2.5.2, pp. 109–110). Nothing is claimed for inseparable `L`
or for higher height. Route: at finite degree approximate the minimal polynomial of a primitive
element by a polynomial over `K` and apply §4.1; for infinite `L` use Zorn's lemma on compatible pairs
`(E, Eʰ ↪ L)`, extending a maximal pair by the finite case over `E`; unrelated finite descents cannot
simply be combined. *Needs:* §0.5, §2.5, §4.1; Tau Ceti `TauCeti.Henselization.directLimitEquiv`.

**Checks.**
- For `L = Kʰ` take `E = K`.
- At finite degree `[E : K] = [L : Kʰ]`; for `ℚ` at `p` and `L = H_p(√p)`, `E = ℚ(√p)` works.
- For `K` henselian of height one, `Kʰ = K` and the statement holds with `E = L`.

### 4.3 Maximal separable wildness under henselization

For `K` of height one, prove that `E/K` is a maximal separable purely wild extension exactly when
`E/K` is henselian and `Eʰ/Kʰ` is a maximal separable purely wild extension (Temkin 2017, Corollary
2.5.3, p. 110). *Needs:* §2.5, §2.6, §4.2.

**Checks.**
- The reverse implication requires `E/K` to be henselian. For `K = ℚ(t)` with the `t`-adic valuation
  (`p = 1`) and `E = Kʰ`, `Eʰ/Kʰ` is the identity, which at `p = 1` is the maximal separable purely
  wild extension of `Kʰ`; but `√(1 + t)` lies in `Kʰ` (the residue polynomial `X² − 1` has the simple
  root `1`) and not in `ℚ(t)` (`1 + t` has a zero of order one at `t = −1`), so `K(√(1 + t)) ⊆ Kʰ ⊆ Kᵗ`
  makes `E/K` neither henselian (two prolongations to `K(√(1 + t))`) nor purely wild. The analogous
  `ℚ(√2)/ℚ` at `7` tests nothing: there `Eʰ/Kʰ` is the identity of `H_7`, which is not maximal,
  since the Eisenstein polynomial `X⁷ − 7` gives a separable purely wild extension of degree `7`, so
  both sides are false.
- For `p = 1` both sides say `E = K` in characteristic zero.
- Pure wildness is reflected by henselization only for henselian extensions. For a prime `ℓ ≠ p`,
  `E = ℚ(p^{1/ℓ})` over `ℚ` with the `p`-adic valuation is a henselian extension (`X^ℓ − p` is
  Eisenstein, so the prolongation is unique, with `e = ℓ`) and is tame, hence not purely wild, and
  `Eʰ = H_p(p^{1/ℓ})` is tame of degree `ℓ` over `H_p`, hence still not purely wild. Without the
  hypothesis it fails: `ℚ(√2)/ℚ` at `7` is not purely wild, since `ℚ(√2)` lies in `H_7 ⊆ Kᵗ` for
  either prolongation, while `Eʰ/Kʰ` is the identity of `H_7` and is purely wild.

### 4.4 The splitting theorem in height one

For `K` of height one, without henselian hypothesis, prove that every maximal purely wild `K_w`
satisfies `Kᵗ ⊗_K K_w ≅ Kᵃ` and every maximal separable purely wild `K_sw` satisfies
`Kᵗ ⊗_K K_sw ≅ Kˢ` (Temkin 2017, Theorem 2.5.5, p. 110). Route: for perfect `K`, `K_w·Kʰ` is maximal
purely wild over `Kʰ` by §4.3, and §3.5 with tensor associativity gives the splitting; for imperfect
`K` pass to the perfection (§2.10) to obtain one splitting, then §3.4 promotes it to every choice.
*Needs:* §2.10, §§3.4–3.5, §4.3.

**Checks.**
- At residue exponent `1`, `Kᵗ = Kˢ` and `K_w = K`.
- For imperfect `K` of characteristic `p`, `K_w` contains `K^{1/p^∞}`.
- For `ℚ` with the `p`-adic valuation, `K_w ⊗ ℚʰ` is a maximal purely wild extension of `ℚʰ`.

### 4.5 Tameness in height one

Prove that a valued field of height one with residue characteristic exponent `p` that is `P`-closed
for `P` the set of primes dividing `p` is tame (Temkin 2017, Corollary 2.5.6, p. 110). Route: a
maximal purely wild extension is a `{p}`-extension (§2.6), hence trivial; §4.4 gives `Kᵗ = Kᵃ`.
*Needs:* §0.3, §2.6, §4.4.

**Checks.**
- Every height-one field of residue characteristic zero satisfies the hypothesis and is tame.
- `ℚ_p` fails the hypothesis: `X^p − p` gives an extension of degree `p`.
- `ℂ_p`, the completion of an algebraic closure of `ℚ_p`, is algebraically closed of height one: it
  satisfies the hypothesis and is tame.

### Examples

`ℚ` with the `p`-adic valuation: `ℚ` is dense in `H_p` and every finite separable extension of
`H_p` descends to a henselian extension of `ℚ` of the same degree (§4.2). `f = (X − 1)(X + 1)` over
`ℚ` at `2` shows why uniqueness of the root pairing needs a tolerance strictly above `kras(f)`
(§4.1).

### Dependencies

Layers 0–3; Mathlib `Valuation.RankOne`, `NormedField.valuation`, `IsKrasner` and the root
continuity of `Mathlib/Analysis/Normed/Field/Approximation.lean`; Tau Ceti
`TauCeti.Henselization.directLimitEquiv`.
Layer 5 is not used.

## Layer 5: composition and finite height

Composition of valuations, coarsening chains and the Abhyankar inequality, with the behaviour of the
unramified and tame classes of Layer 2 under composition. This layer rests on Layers 1 and 2 only:
nothing in it uses the profinite inputs, the henselian splitting or the height-one theory of
Layers 3–4, and Layer 6 is where the two branches meet.

### 5.1 Composed valuations

Let `V` be a valuation subring of `K` and `R` a valuation subring of `κ_V`. Define the composite
`V ∘ R` as the inverse image of `R` under `V → κ_V`, a subring of `K` (Temkin 2017, §2.6.1, p. 110).
Prove that it is a valuation subring of `K`; that conversely, for valuation subrings `U ⊆ V` of `K`,
`U` is the composite of `V` with the image of `U` in `κ_V`, and `V = U.ofPrime P` for
`P = U.idealOfLE V`; that `Γ_R` is the convex kernel of `Γ_{V∘R} → Γ_V`; and that the residue field
of `V ∘ R` is `κ_R`.

- `x ∈ V ∘ R` exactly when `x ∈ V` and its residue lies in `R`.
- The residue field of `V ∘ R` identifies with that of `R`.
- `0 → Γ_R → Γ_{V∘R} → Γ_V → 0` is exact with convex kernel (a `TauCeti.ConvexSubgroup`).
- For `U ≤ V` the composite recovers `U`, with associated prime `U.idealOfLE V`.
- Three successive composites associate under the canonical residue identifications.

*Needs:* Mathlib `ValuationSubring.ofPrime`, `ValuationSubring.idealOfLE`,
`ValuationSubring.ofPrime_idealOfLE`, `ValuationSubring.idealOfLE_ofPrime`; Tau Ceti
`TauCeti.ConvexSubgroup`, `Valuation.coarsenByUnits`.

**Checks.**
- Composing with the trivial valuation of `κ_V` recovers `V`.
- On `ℚ_p((t))`, composing the `t`-adic valuation with the `p`-adic valuation of `ℚ_p` gives the
  value group `ℤ × ℤ` ordered lexicographically, with `v(t) = (1, 0)` and `v(p) = (0, 1)`.
- In that example `p⁻¹` lies in `ℚ_p[[t]]` and not in the composite: the composite is not the coarse
  ring.

### 5.2 Height and the coarsening chain

If `ringKrullDim V = d` with `d` a natural number, construct the chain of the `d + 1` prime ideals of
`V`, the unique coarsening `V_i` of height `i` for each `0 ≤ i ≤ d`, and the induced valuation on its
residue field `κ_i`, of height `d − i`; identify height with the number of proper convex subgroups of
`Γ_K` (Temkin 2017, §2.6.1, p. 110 and §2.6.2, p. 111). Prove that if `p_i` is the residue
characteristic exponent of `V_i`, then there is `n` with `p_i = 1` for `i < n` and `p_i = p` for
`i ≥ n` (Temkin 2017, §2.6.2, p. 111).

- Height `d` holds exactly when `Spec V` consists of exactly `d + 1` primes, which are totally
  ordered.
- For `i ≤ d` the coarsening of height `i` exists and is unique.
- The induced valuation on its residue field has height `d − i`.
- A nontrivial valuation has height one exactly when its value group admits an order embedding into
  `ℝ` (`Valuation.RankOne`).

*Needs:* §5.1; Mathlib `ringKrullDim`, `ValuationSubring.ofPrime`; Tau Ceti `TauCeti.ConvexSubgroup`.

**Checks.**
- The trivial valuation has height `0`.
- A nontrivial discrete valuation has height `1` (`IsDiscreteValuationRing.ringKrullDim_eq_one`),
  with exactly two primes; exhibiting the two primes alone does not exclude larger height.
- The composite valuation on `ℚ_p((t))` of §5.1 has height `2`, while its coarse `t`-adic valuation
  has height `1`; its coarse residue characteristic is `0` and its final one is `p`.

### 5.3 The Abhyankar inequality and the height bound

Prove `algebraicIndependent_of_valuation_independent`: let `vL` be a valuation of `L` extending the
valuation `vK` of `K` (`Valuation.HasExtension`); if `x : ι → L` has values independent modulo the
value group of `K` (no monomial `∏ x_i^{n_i}` with `n ≠ 0` has the value of an element of `K`) and
`y : κ → 𝒪_{vL}` has residues algebraically independent over the residue field of `vK`, then the
family `(x, y)` is algebraically independent over `K` (Kuhlmann, Kuhlmann and Vişan 2016, Lemma 2.1,
p. 6). Consequently `rr(Γ_L/Γ_K) + trdeg(κ_L/κ_K) ≤ trdeg(L/K)`, where `rr(A) = dim_ℚ(A ⊗ ℚ)`
(Kuhlmann–Kuhlmann–Vişan 2016, inequality (12), p. 8). Route: in a polynomial relation, group
monomials by value; independence of values separates the groups, and independence of residues
prevents cancellation in the group of least value. *Needs:* Mathlib `Valuation.HasExtension` and its
residue-field instances, `AlgebraicIndependent`.

Prove `ringKrullDim_le_ringKrullDim_comap_add`: if `Algebra.trdeg K L = n` and `W` is a valuation
subring of `L`, then `ringKrullDim W ≤ ringKrullDim (W.comap (algebraMap K L)) + n`. Route: in a chain
of convex subgroups of `Γ_L`, the steps where the intersection with `Γ_K` does not grow contribute
elements independent modulo `Γ_K`, so their number is at most `rr(Γ_L/Γ_K) ≤ n`, and the other steps
are at most the height of `W ∩ K`. Consequently a valuation on a field of finite transcendence degree
over its prime field, and on every algebraic extension of it, has finite height, since valuations
on prime fields have height at most one (Temkin 2017, proof of Theorem 2.6.6, p. 112). *Needs:*
§5.2; Mathlib `ringKrullDim`, `Algebra.trdeg`, `ValuationSubring.comap`; Tau Ceti
`TauCeti.ConvexSubgroup`.

**Checks.**
- For `𝔽_p(t)` with the `t`-adic valuation over `𝔽_p`: rational rank `1`, residue transcendence
  degree `0`, transcendence degree `1`; for the Gauss valuation with `v(t) = 0` the contributions are
  `0` and `1`.
- For an algebraic `L/K` (`n = 0`) the height of `W` equals that of `W ∩ K`: the bound is an equality.
- For `ℚ(t)` with the composite of the `t`-adic and `p`-adic valuations, the height is `2 = 1 + 1`;
  a valuation of height `2` on `ℚ(t)` cannot restrict trivially to `ℚ`.
- An `x` whose value lies in the value group of `K` cannot appear in `x`: the hypothesis on `x`
  applied to `n = (1)` excludes it, and in particular excludes `x_i = 0`.

### 5.4 Unramified extensions and composition

Let `L/K` be algebraic, `V` of finite height `d` and `0 ≤ i ≤ d`. Prove that `L/K` is unramified
exactly when `L_i/K_i` and the residual extension `κ_{L_i}/κ_{K_i}` with its induced valuations are
unramified (Temkin 2017, Lemma 2.6.3(i), p. 111; Temkin 2010, Proposition 2.2.2, pp. 11–12). Route:
reduce to finite extensions; from an essentially étale map, localize for the coarse extension and
pass to the quotient for the residual one, the quotient being reduced; conversely, the composite ring
map is torsion free hence flat, the coarse and residual maximal-ideal equalities give the composite
one, scaling coarse generators into the fine ring and adding residue generators gives finite type,
§1.5 gives finite presentation, and the separable residual fibre gives étaleness by §2.1. *Needs:*
§1.5, §2.1, §2.3, §§5.1–5.2.

**Checks.**
- For the composite valuation on `ℚ_p((t))`, the constant extension by an unramified extension of
  `ℚ_p` is unramified at both steps.
- The extension `s^ℓ = t`, `ℓ > 1`, is ramified already at the coarse step.
- At the endpoints neither step need be an identity extension. For `i = 0` the coarse extension is
  `L/K` with the trivial valuations, unramified exactly when `L/K` is separable (`Kᵘ = Kˢ` for the
  trivial valuation, §2.2), and the residual one is `L/K` with its own valuations; for `i = d` the
  coarse extension is `L/K` itself and the residual one is `κ_L/κ_K` with the trivial valuations,
  unramified exactly when `κ_L/κ_K` is separable. The criterion there reduces to the §2.3 facts that
  an unramified extension is separable with separable residue extension. For `K = 𝔽₂((t))`,
  `L = 𝔽₄((t))`, `d = 1`, both steps have degree `2` at `i = 0` and at `i = 1`, and both
  trivial-valuation steps are separable, agreeing with `e = 1`, `f = 2`. For
  `𝔽_p(u^{1/p})((t))/𝔽_p(u)((t))` at `i = 1` the residual step `𝔽_p(u^{1/p})/𝔽_p(u)` with the
  trivial valuation is inseparable, hence not unramified, as is the whole extension: a trivially
  valued step is not automatically unramified.

### 5.5 Tame extensions and composition

Under the hypotheses of §5.4, let `p` be the final residue characteristic exponent and `p_i` that of
`V_i`. Prove that `L/K` is tame exactly when `L_i/K_i` and the residual extension are tame and
`Γ_{L_i}/Γ_{K_i}` has no nontrivial `p`-torsion; the torsion condition is automatic when `p_i = p` and
empty when `p = 1` (Temkin 2017, Lemma 2.6.3(ii), pp. 111–112, with the final residue characteristic
exponent in the last step of the proof). Route: reduce to finite extensions and replace `K` by `Kᵘ`
using §5.4; over a field with separably closed residue field tame extensions are generated by
radicals of order prime to `p` (ClassicalAdicEtaleCohomology §5.3 (ii)); if the extension is not
tame, `p` divides the degree, and then either the coarse ramification index or the residual degree
is divisible by `p`. *Needs:* §2.4, §5.4; ClassicalAdicEtaleCohomology §5.3.

**Checks.**
- For `K = ℚ_p((t))` with the composite valuation and `L = ℚ_p((s))`, `s^p = t`: the coarse extension
  is tame (residue characteristic `0`), the residual extension is the identity of `ℚ_p`, the coarse
  value quotient is `ℤ/p`, and `L/K` is not tame. Using the coarse residue characteristic `0` in place
  of the final `p` would wrongly declare it tame.
- For `p_i = p` (for example `𝔽_p((t))((u))` with the composite valuation) the torsion condition
  follows from coarse tameness.
- For `p = 1` every algebraic extension is tame and all three conditions hold.

### 5.6 Tame fields and composition

Under the hypotheses of §5.4 prove that `K` is a tame field exactly when `K_i` and `κ_i` with its
induced valuation are tame fields and `Γ_{K_i}` is `p`-divisible, `p` the final residue characteristic
exponent; when `p_i = p` the divisibility follows from tameness of `K_i` (Temkin 2017, Corollary
2.6.4, p. 112). Route: apply §5.5 to `Kᵃ/K`, whose coarse field is an algebraic closure of `K_i` and
whose residue field is an algebraic closure of `κ_i`. *Needs:* §2.7, §5.5.

**Checks.**
- `ℚ_p((t))` with the coarse `t`-adic valuation is tame (residue characteristic `0`), but the composite
  is not: `ℤ` is not `p`-divisible and `ℚ_p` is not tame.
- For `K` algebraically closed every condition holds.
- For `K = 𝔽_p((t))((u))` with the composite valuation of height `2` and `i = 1`, `p_1 = p`: the coarse
  field (the `u`-adic valuation, residue field `𝔽_p((t))`) is not tame, so `K` is not tame, and the
  divisibility of `Γ_{K_1} = ℤ` need not be examined.

### Examples

`ℚ_p((t))` with the composite of the `t`-adic and `p`-adic valuations: value group `ℤ × ℤ`
lexicographic, height `2`, coarse residue characteristic `0`, final residue characteristic `p`; the
extension `s^p = t` is coarse-tame, residually trivial and wild (§§5.1–5.5). `𝔽_p(t)`: equality in the
Abhyankar inequality for the `t`-adic and Gauss valuations (§5.3).

### Dependencies

Layers 1–2 (§1.5, §§2.1–2.7); ClassicalAdicEtaleCohomology §5.3 (§5.5); Mathlib valuation subrings,
`ringKrullDim`, `Algebra.trdeg`, `AlgebraicIndependent`; Tau Ceti `TauCeti.ConvexSubgroup`,
`Valuation.coarsenByUnits`. Layers 3 and 4 are not used, and Layer 0 only through Layer 2.

## Layer 6: the tameness theorem and the separable export

### 6.1 Residue fields and value groups of `p`-closed fields

Let `p` be prime and `K` be `{p}`-closed with final residue characteristic exponent `p`. Prove that
every element of `K` has a `p`-th root (an irreducible `X^p − a` would give an extension of degree
`p`), so every value group `Γ_{K_i}` of a coarsening is `p`-divisible; that each residue field `κ_i`
is `{p}`-closed (a finite `{p}`-extension of `κ_i` is separable, because `κ_i` has characteristic
zero or is perfect of characteristic `p`, and a lift of its primitive monic irreducible polynomial to
`V_i` is irreducible and of `p`-power degree); and that `K_i` with residue characteristic exponent `1`
is tame without induction (Temkin 2017, proof of Theorem 2.6.6, p. 112). *Needs:* §0.3, §0.4, §2.7,
§§5.1–5.2.

**Checks.**
- The trivial coarsening has residue field `K` itself, which is `{p}`-closed by hypothesis.
- For a nontrivial coarsening of mixed characteristic the final residue prime differs from the
  characteristic `0` of the intermediate residue field, and the argument uses the former.
- `ℚ_p` is not `{p}`-closed: `p` has no `p`-th root.

### 6.2 Tameness at finite height

Prove that every valued field of finite height with residue characteristic exponent `p` that is
`P`-closed for `P` the set of primes dividing `p` is tame (Temkin 2017, proof of Theorem 2.6.6,
p. 112). Route: at height `0` the field is perfect (§0.4) and the trivial valuation of a perfect field
is tame (§2.7); height one is §4.5; at height `d > 1` choose `0 < i < d`, apply induction to `K_i`
(or the residue-characteristic-zero case) and to `κ_i`, and conclude with §6.1 and §5.6. *Needs:*
§0.4, §2.7, §4.5, §5.2, §5.6, §6.1.

**Checks.**
- Height `0`: a `{p}`-closed field is perfect, hence tame for the trivial valuation.
- Height `1`, where no `0 < i < d` exists and the route uses §4.5 alone: `ℂ_p` (value group `ℚ`,
  residue field an algebraic closure of `𝔽_p`, algebraically closed) satisfies the hypothesis and is
  tame, while `ℚ_2` fails it (`X² − 2` gives degree `2`) and is indeed not tame, `ℚ_2(i)/ℚ_2` having
  inertia of order `2`.
- Height `2` in mixed characteristic uses the `p`-divisibility of the coarse value group from §6.1.

### 6.3 Descent to finite height

Let `K` be `{p}`-closed with final residue characteristic exponent `p` and `L/K` finite. Prove that
there are a subfield `K_0 ⊆ K`, relatively algebraically closed in `K` and of finite transcendence
degree over the prime field, and a finite `L_0/K_0` with `L_0 ⊗_{K_0} K ≅ L` by multiplication,
compatibly with the given valuations; `K_0` is `{p}`-closed and has finite height (Temkin 2017,
proof of Theorem 2.6.6, last paragraph, p. 112). `K_0` need not be finitely generated. Route: `K` is
perfect (§0.4); adjoin the coefficients of a primitive polynomial of `L/K` to the prime field and take
the relative algebraic closure in `K`, which is perfect, so `K/K_0` is regular and linearly disjoint
from finite extensions of `K_0`; a finite `{p}`-extension of `K_0` would give one of `K` of the same
degree; §5.3 gives finite height. *Needs:* §0.4, §0.5, §5.3; Tau Ceti
`TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn` (a relatively algebraically closed base
and a separable extension, separable here because `K_0` is perfect); Mathlib `Algebra.trdeg`.

**Checks.**
- The coefficients of the primitive polynomial matter when they are transcendental over the prime
  field. For `K = ℚ(t)` with the trivial valuation (`p = 1`) and `L = K(√t)`, adjoining the
  coefficient `t` of `X² − t` gives `K_0 = ℚ(t) = K` and `L_0 = L`. Omitting it gives the relative
  algebraic closure `ℚ` of `ℚ` in `K`, and no finite `L_0/ℚ` has `L_0 ⊗_ℚ ℚ(t) ≅ L`: the left side
  is `L_0(t)`, with constant field `L_0` and degree `[L_0 : ℚ]` over `K`, while `L = ℚ(√t)` is a
  rational function field with constant field `ℚ`, which would force `L_0 = ℚ` and degree `1 ≠ 2`. A
  coefficient that already lies in the relative algebraic closure of the prime field, such as `0`,
  may be omitted.
- For `K` algebraic over the prime field, `K_0 = K` already has height at most one.
- The relative algebraic closure of `ℚ(t)` in a `{p}`-closed field is in general not finitely
  generated over `ℚ`, and only its transcendence degree is used.

### 6.4 Tameness of `p`-closed valued fields

Prove `isTameField_of_isPClosed`: let `(K, V)` be a valued field with residue characteristic exponent
`p = ringExpChar` of the residue field of `V`, with a valuation of any height; if `IsPClosed P K` for
`P` the set of primes equal to `p`, then `IsTameField V`, that is, every algebraic extension of `K` is
tame at every prolongation (Temkin 2017, Theorem 2.6.6, p. 112). For `p = 1` the hypothesis is empty
and the conclusion holds for every valued field of residue characteristic zero. No completeness,
perfect residue field, discreteness or henselian hypothesis is used. Route: for finite `L/K` descend
to `L_0/K_0` by §6.3; `K_0` is tame by §6.2, so `L_0/K_0` is tame and so is its base change `L/K`
(§2.4); every finite subextension of `Kᵃ/K` being tame, `Kᵃ/K` is tame by §2.8. *Needs:* §2.4, §2.8,
§6.2, §6.3.

Prove the `P`-form: for a set `P` of primes, a `P`-closed field is tame at every valuation whose
residue characteristic lies in `P` (Temkin 2017, Lemma 3.2.5, p. 116), as `IsPClosed P K` implies
`IsPClosed {p} K` for `p ∈ P`.

**Checks.**
- With the trivial valuation the conclusion says that a `{p}`-closed field is perfect, which §0.4
  proves directly.
- At residue characteristic exponent `1` the hypothesis holds vacuously and `ℚ` with the trivial
  valuation, or `ℂ((t))`, is tame.
- `ℚ_p` and `𝔽_p((t))` fail the hypothesis (`X^p − p`, `X^p − X − t⁻¹`) rather than contradicting
  the conclusion.
- An algebraically closed field satisfies the hypothesis for every `p`.

### 6.5 The separable export

Prove `isSeparablyTameField_of_isSeparablyPClosed`: for a set `P` of natural numbers, if
`IsSeparablyPClosed P K` and the residue characteristic exponent of `V` lies in `P`, then
`IsSeparablyTameField V`: every finite separable extension of `K` is tame at every prolongation. `K`
need not be perfect and nothing is claimed at valuations whose residue characteristic is outside `P`.
Temkin 2017, Lemma 3.2.5, p. 116, states the `P`-closed form; the separable form is derived here
through the perfection (§§0.3 and 2.10), as Temkin 2017, Remark 2.4.7, p. 108, obtains the
separable analogues of the splitting conditions. Route: for `p = 1` the conclusion holds outright;
for prime `p ∈ P`, `K` is separably `{p}`-closed, so its perfection is `{p}`-closed (§0.3), hence
tame by §6.4 with the same residue characteristic, and §2.10 descends separable tameness to `K`.
*Needs:* §0.3, §2.10, §6.4.

**Checks.**
- For the separable closure of `𝔽_p(t)` with any valuation, whose residue characteristic exponent
  is `p`, the closedness hypothesis holds for every `P` and the residue hypothesis exactly for the
  `P` containing `p`. For those `P` the field is separably tame, while `t^{1/p}` gives a non-tame
  algebraic extension: only the separable conclusion survives, so the word separable cannot be
  dropped.
- For `P = ∅` the closedness hypothesis holds for every field and the hypothesis on the residue
  characteristic never does, so nothing is claimed; this is necessary, since `ℚ_p` is separably
  `∅`-closed and not separably tame.
- `𝔽_q((t))` is not separably `{p}`-closed (Artin–Schreier extensions), consistently with it not being
  separably tame.

### Examples

A `{p}`-closed field of height two in mixed characteristic: its coarse value group is `p`-divisible and
its residue field `{p}`-closed (§6.1), so the induction of §6.2 applies. The separable closure of
`𝔽_p(t)`: separably tame for every valuation, not tame (§6.5).

### Dependencies

Layer 0, Layer 2, Layer 4 (§4.5) and Layer 5 (§§5.1–5.3, 5.6); Layers 1 and 3 only through them.

## Downstream consumers

- Prime-to-`p` alteration and tame distillation arguments in the style of Temkin 2017, §§3–4, consume
  the six extension classes of Layer 2, the `P`-tame theorem §6.4 and the separable export §6.5; the
  separable form is the one valid for imperfect fields.
- Arguments that need finite height of valuations on fields of finite transcendence degree, or the
  Abhyankar inequality, consume §5.3.
- Splitting arguments for profinite extensions with pro-`p` kernel over a group of `p`-cohomological
  dimension at most one, with no pro-`p` hypothesis on the extension, consume §3.1.
- AdicCoefficientsAndComparisonsPartII consumes Layer 0, including the maximal separable
  `P`-extensions of §0.4, the valued henselization and tensor decomposition of Layer 1, the
  unramified and tame classes, étale criterion, tower laws and perfection comparison of Layer 2,
  §§5.3–5.4, and the exports §§6.4–6.5.
- QuadraticFormInvariantsPartII consumes the valued henselization (§§1.2–1.3), Krasner's lemma
  over a henselian base and decompletion (§§4.1–4.2), and the composed valuations and height bound
  of Layer 5.

## Worked examples

`K = ℚ_p((t))` with the composite of the `t`-adic valuation and the `p`-adic valuation of its residue
field `ℚ_p`: the value group is `ℤ × ℤ` with the lexicographic order, `v(t) = (1, 0)`, `v(p) = (0, 1)`,
and the height is `2`. For `L = ℚ_p((s))`, `s^p = t`, the coarse extension has residue characteristic
zero and is tame, the residual extension of `ℚ_p` is the identity, and the coarse value quotient is
`ℤ/p`; so `L/K` is not tame (§5.5), and `K` is not a tame field (§5.6).

`K = 𝔽_p((t))`: a root `a` of `a^p − a = t⁻¹` has value `−1/p` in additive notation; the extension has
degree `p` and ramification index `p` and is purely wild (§2.6). A radical `t^{1/ℓ}`, `ℓ ≠ p`, gives a
tame extension (§2.4). An immediate Artin–Schreier defect extension of a henselian field has
`e = f = 1` and is not tame: the missing degree factor is invisible to residue fields and value
groups.

The trivial valuation: `Kʰ = K`, `Kᵘ = Kᵗ = Kˢ`; every finite separable extension is unramified and
tame, every nontrivial purely inseparable one purely wild. A trivially valued field is tame exactly
when perfect and is always separably tame (§2.7).

`K = ℚ` with the `7`-adic valuation and `L = ℚ(√2)`: since `2 ≡ 3² mod 7`, there are two prolongations,
`L ⊗ Kʰ` has two field factors (§1.4), `L/K` is not a henselian extension (§2.5), and `L` satisfies
`IsTameGaloisExtension` (§2.4).

## References

- **temkin17**: M. Temkin, *Tame distillation and desingularization by p-alterations*, Annals of
  Mathematics 186 (2017), 97–126: §§2.1–2.6, pp. 103–112; §3.2, pp. 115–116.
- **kpr86**: F.-V. Kuhlmann, M. Pank, P. Roquette, *Immediate and purely wild extensions of valued
  fields*, Manuscripta Mathematica 55 (1986), 39–67: Theorems 2.1–2.2, Corollary 2.5 and the proof
  of Theorem 2.2, pp. 42–44.
- **temkin10**: M. Temkin, *Stable modification of relative curves*, Journal of Algebraic Geometry 19
  (2010), 603–677 (author's preprint pagination): Proposition 2.2.2, pp. 11–12.
- **kkv16**: F.-V. Kuhlmann, K. Kuhlmann, C. Vişan, *Valuations on rational function fields that are
  invariant under permutation of the variables*, Journal of Algebra 464 (2016), 279–296 (author's
  preprint pagination): Lemma 2.1, p. 6; inequality (12), p. 8.
- **cks23**: H. Ćmiel, F.-V. Kuhlmann, P. Szewczyk, *Continuity of roots for polynomials over valued
  fields*, Communications in Algebra 51 (2023), 1383–1412 (author's preprint pagination): Theorems 14
  and 16, Example 15, pp. 12–15.
- **aid25**: C. Aïd, *A choice-free look at algebraic extensions of valuations*, arXiv:2511.07177v1
  (2025): Propositions 3.3, 3.6, Theorem 3.7, Proposition 4.1, Theorem 4.4, pp. 5–13.
- **stacks-more-algebra**: The Stacks Project Authors, *More on Algebra*: Lemmas 15.12.5–15.12.6
  (tags 0A04, 0F0L), Lemma 15.22.2 (tag 0537), Lemmas 15.26.1, 15.26.3, 15.26.4 and 15.26.6 and
  Remark 15.26.5 (tags 053A, 053C, 053D, 053E, 05GS), Lemmas 15.125.5–15.125.6 (tags 0ASJ, 0ASK).
- **ega4**: A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique IV, quatrième partie*,
  Publications Mathématiques de l'IHÉS 32 (1967): Lemma 17.7.5, pp. 73–74; Proposition 17.7.7,
  pp. 74–75; Proposition 18.6.8, p. 139; Proposition 18.6.14, p. 141.
- **serre-cg**: J.-P. Serre, *Galois Cohomology*: I §3.4, Proposition 16; II §2.2,
  Proposition 3 and Corollary 1.
- **stacks-more-flatness**: The Stacks Project Authors, *More on Flatness*: Lemma 38.10.9
  (tag 05I7), Theorem 38.13.6 (tag 05IK), Lemma 38.13.7 (tag 05IL), and Proposition 38.13.10
  (tag 053G).
- **rg71**: M. Raynaud, L. Gruson, *Critères de platitude et de projectivité. Techniques de
  « platification » d'un module*, Inventiones Mathematicae 13 (1971), 1–89: Corollaire 3.4.7.

### Notes on the sources

- Temkin 2017, §2.4.6, assertion (4), p. 108, states the splitting of `G_K → Gal(Kᵗ/K)` for an
  arbitrary class of valued fields. For non-henselian `K` the wild subgroup need not be normal and
  `Kᵗ/K` need not be Galois (the `2`-adic example of §3.4); §3.4 states the quotient form for
  henselian fields and a subgroup factorization in general. The field-theoretic equivalences and all
  results of Layers 4 and 6 use only the field form.
- Temkin 2017, Lemma 2.3.2, p. 104, lists the valued extensions with underlying field `l` up to
  isomorphism; the decomposition counts distinct prolongations on the fixed field (§1.4).
- Temkin 2017, Lemma 2.3.4, p. 105, speaks of all localizations of `A`; its proof and its gloss
  "Prüfer" concern the localizations at prime ideals, and a semilocal `A` is not itself a valuation
  ring (§1.1).
- Temkin 2017, proof of Lemma 2.6.3(ii), pp. 111–112: in the last step `p` is the final residue
  characteristic exponent, not the characteristic of the coarse residue field (§5.5).
- Temkin 2017, proof of Theorem 2.6.6, p. 112, refers to "Corollary 2.5.6(ii)"; Corollary 2.5.6,
  p. 110, has a single assertion.
- Ćmiel–Kuhlmann–Szewczyk 2023, proof of Theorem 16(c), p. 14: the argument proves the non-strict
  bound of the statement on p. 13, which is attained for `f = X`, `g = X − 2` over `ℚ_2` (§4.1).
