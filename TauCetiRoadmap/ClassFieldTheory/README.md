# Roadmap: class field theory

## Purpose

The central object of this roadmap is an **abstract class formation** in the sense of
Artin–Tate. The build is organised around the implication

```text
formation
  -> class-formation axioms
  -> fundamental classes
  -> Tate's theorem
  -> finite-level Artin maps.
```

An invariant map is *data*, so each arithmetic instance begins by constructing its invariant and
only then satisfies the axioms. The two instances therefore run

```text
local Brauer group, invariant, Hilbert symbol, local duality
  -> local class formation
  -> local reciprocity
  -> local existence
  -> the local Weil group
```

and

```text
Brauer exact sequence, sum of local invariants
  -> global class formation
  -> global reciprocity
  -> global existence and the class-field correspondence
  -> norm theorems, class fields, Hilbert reciprocity.
```

The global strand is for **number fields**: its carriers are the idele and idele-class groups of a
number field, and global class field theory for one-variable function fields over finite fields is
outside this roadmap (§1). Both strands end at a *correspondence*, not at an existence statement:
the class field attached to a norm subgroup is the unique **abelian** layer with that norm
subgroup, and the existence theorems below are stated so that they cannot return anything else.

The invariant never appears twice: the object a class formation is built from is not also a
theorem proved after it.

This is not a roadmap for constructing another cohomology theory. Finite-group Tate cohomology
is Mathlib's (`Mathlib/RepresentationTheory/Homological/TateCohomology`), with Tau Ceti's cup
products, change-of-group maps and low-degree comparisons on it (Layer 0), and continuous
cohomology of profinite groups is supplied by `ProfiniteCohomology`. This roadmap uses those
objects and defines no second cohomology carrier.

The abstract formalism is not decorative. The local and global Artin maps constructed later in
the roadmap must be obtained from the same degree `-2` to degree `0` Tate isomorphism.
This fixes the map, its functoriality, and its sign convention before any arithmetic calculation
is made. Everything downstream — local duality, Hilbert symbols, conductors, the Hasse norm
theorem, class fields, Hilbert reciprocity — is then stated against that one map.

The material lives in Tau Ceti under `TauCeti/NumberTheory/ClassFieldTheory/`, with the generic
Tate-cohomology inputs under `TauCeti/RepresentationTheory/Homological/`.

`Suggested.lean` is the acceptance test: it states the open headline theorems listed in §3
against the pinned Mathlib and Tau Ceti (§6).

---

## 1. Scope and ownership

### Owned here

This roadmap specifies the following constructions and theorems. Tau Ceti implements most of them
at the pin; that material is consumed under Tau Ceti's names, listed in §3 and in the layer that
specifies it, and is never rebuilt here. The **open targets** close the items that have them; they
are the theorems stated in `Suggested.lean`.

1. The local Brauer group on the imported continuous carrier, its invariant map, and the
   cohomological local Hilbert symbol built from Kummer classes, the continuous cup product and
   the invariant, with bilinearity, the Steinberg relation, antisymmetry, the symbol–norm
   criterion and nondegeneracy (Layer 5): Tau Ceti's `Br`, `invMap` and `localSymbol`.
2. Local Tate duality for the named evaluation pairing, finiteness of `H⁰`, `H¹`, `H²` of a finite
   smooth discrete module, and the local Euler-characteristic formula in cardinality and
   `𝔽_p`-rank form (Layer 5): Tau Ceti's `tateDualityPairing_perfect_mixed`, `finite_H`,
   `eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp`.
3. The local class formation, built *from* the invariant map of item 1; finite local reciprocity
   with its arithmetic-Frobenius normalization; `cd_ℓ G_K = scd_ℓ G_K = 2` in characteristic zero;
   the absolute local Artin map into the topological abelianization of `G_K`, with its
   restriction, unramified, norm and cyclotomic normalizations; and the local conductors
   (Layers 6 and 7): Tau Ceti's. **Open targets** (Layer 7), in every characteristic: the
   upper-numbering theorem identifying the image of `U(K,n)` under reciprocity with that of
   `G(L/K)^n`, the local conductor–discriminant formula, and the conductor as the largest
   character conductor.
4. Local existence for a finite **abelian** layer, uniqueness of that layer, and the local
   class-field correspondence with its quotient isomorphism and degree equality, in full in
   characteristic zero and in the prime-to-residue-characteristic range in every characteristic
   (Layer 8): Tau Ceti's. The `p`-primary part in equal characteristic `p` is
   FunctionFieldArithmetic's (see the consumers below).
5. The local Weil group: its carrier inside `G_K`, the Weil topology, functoriality along finite
   separable extensions embedded in `Kˢ`, the exact sequence `1 → I_K → W_K → ℤ → 1`, and, in
   characteristic zero, the topological abelianization isomorphism `Kˣ ≃ W_K^ab` compatible with
   the absolute local Artin map (Layer 9): Tau Ceti's.
6. The archimedean local invariants and Artin maps, the exact sequence
   `0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0` in invariant coordinates, and the sum-of-local-invariants
   map on the idele layers with its descent to the idele-class layers (Layer 10): Tau Ceti's.
7. The global idele-class formation, whose invariant *is* the sum-of-local-invariants map of
   item 6, global Artin reciprocity, and its comparison with the ideal-theoretic Artin map of
   `NumberFieldArithmetic` (Layer 11): Tau Ceti's.
8. Global existence for a finite **abelian** layer over a number field, uniqueness of that layer,
   the global class-field correspondence with its quotient isomorphism and degree equality, and
   the norm-index theorem (Layer 12): Tau Ceti's.
9. The cyclic Hasse norm theorem; the Hilbert, narrow Hilbert and ray class fields, each the class
   field of a named norm subgroup; the ring class field of **every** order of every number field,
   with `Gal(H_O/K) ≃ Pic O`; admissible moduli, the conductor of a finite abelian extension and
   ray-class reciprocity; Kronecker–Weber (Layer 13): Tau Ceti's. **Open targets** (Layer 13): the
   principal ideal theorem in the Hilbert class field, and the conductor–discriminant formula,
   with the discriminant the **product** and the conductor the **lcm** of the character
   conductors.
10. Hilbert reciprocity, derived from item 6 (Layer 14): Tau Ceti's `hilbertProductFormula`.
    Quadratic reciprocity is Mathlib's `legendreSym.quadratic_reciprocity`; its derivation from
    Hilbert reciprocity is a worked example (§5.7), not a second theorem.

### Consumed, not redefined

| Material | Supplier |
|---|---|
| Integer-graded finite-group Tate cohomology, its long exact sequence, and its comparison with ordinary cohomology and homology | Mathlib `RepresentationTheory/Homological/TateCohomology` |
| The formation machinery of Artin–Tate: formations and their levels, finite normal layers with their Galois groups, degrees, coefficient modules, cohomology carriers, norms and low Tate degrees, the finite quotient system, restriction, corestriction, inflation and conjugation of layers with their tower laws, the maps of abelianized Galois groups, the abelian layers, class formations with the invariant as data, fundamental classes with their restriction, corestriction, inflation and conjugation formulae, the three hypotheses of Tate's theorem, and the cup product with a class | Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/Formation/`: `ClassFieldTheory.Formation`, `NormalLayer`, `LayerRestriction`, `LayerRefinement`, `ClassFormation`, `AbelianLayer`, `cupClass`, and the declarations listed in §2 and Layers 1 and 2 of §4 |
| Tate's theorem with its three hypotheses as separate arguments and its application to a class formation, with its compatibility with restriction, corestriction, towers, conjugation and the scaled inflation; the Nakayama map, Artin reciprocity and the Artin map of a finite layer, defined from the Tate isomorphism in degree `-2`, with kernel, surjectivity, generators, the four functoriality diagrams, the character formula and its uniqueness, the trivial layer, and norm limitation | Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/Formation/`: `tateTheorem`, `tateTheorem_toAddMonoidHom`, `ClassFormation.tateIso`, `tateIso_toAddMonoidHom` (`Tate/Theorem.lean`); `tateIso_res`, `tateIso_cor`, `tateIso_res_trans` (`Tate/Naturality.lean`); `tateIso_conj` (`Tate/Conjugation.lean`); `tateIso_infl` (`Tate/Inflation.lean`); `ClassFormation.nakayamaNegTwo`, `artinEquiv`, `artinMap`, `ClassFormation.artinMap_apply`, `artinEquiv_eq_tateIso`, `ker_artinMap`, `artinMap_eq_zero_iff`, `surjective_artinMap`, `isGenerator_artinMap_iff`, `artinMap_groundInclusion`, `artinMap_groundNorm`, `artinMap_conj`, `artinMap_quotient`, `character_artinMap`, `eq_artinMap_of_character` (`ArtinMap.lean`); `NormalLayer.characterConnectingClass`, `NormalLayer.artinCharacterCup` (`Character.lean`); `artinMap_trivialLayer` (`TrivialLayer.lean`); `normSubgroup_maximalAbelianLayer` (`NormLimitation.lean`) |
| Restriction, corestriction, inflation, cup products, low-degree Tate descriptions, the Herbrand quotient, the Tate–Nakayama theorem, the theorem of Nakayama and Rim, and freeness of submodules of free modules over a principal ideal domain | Tau Ceti, `TauCeti/RepresentationTheory/Homological/` and `TauCeti/LinearAlgebra/FreeModule/PID.lean`: the declarations of Layer 0 |
| The local and global class field theory of Layers 5–14 that Tau Ceti implements: the local Brauer group, invariant, Hilbert pairing, duality and Euler characteristic; the local class formation, reciprocity, cohomological dimension, absolute Artin map and conductors; local existence and correspondences; the local Weil group and Weil reciprocity; the Brauer sequence of a number field; global reciprocity, existence and correspondence; the Hasse norm theorem, the class fields and Kronecker–Weber; Hilbert reciprocity | Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/`: the declarations listed in §3 and in each layer's contract in §4 |
| Continuous cohomology of profinite groups, the coefficient pairings `TopPairing` and continuous cup products with their laws (`cup_coeffMap`, `cup_add_left`, `cup_gradedComm`), coefficient maps `coeffMap`, degree casts, Shapiro's lemma, and the finite-quotient colimit | `ProfiniteCohomology` |
| Profinite groups, open subgroups, finite quotients, and abelianization | Mathlib and the profinite-group roadmaps |
| Local fields, valuations, unit filtrations, norms, ramification, and arithmetic Frobenius; the maximal unramified extension, inertia, arithmetic Frobenius lifts and `Gal(K^ur/K) ≅ Ẑ`, under their Tau Ceti names; the upper-numbering filtration `upperRamificationGroup` on `RamificationIndexDomain`, Hasse–Arf, and the different and discriminant exponents `differentExponent` and `discriminantExponent` with `δ(L/K) = f(L/K) · d(L/K)` | `LocalFieldsRamification` (Layer 3: Herbrand functions and the upper numbering, Hasse–Arf, the different and the discriminant) |
| The comparison of the algebraic-closure and separable-closure absolute Galois groups, the open subgroup cut out by a finite extension, the class field of an open normal subgroup and the abelian layers, the profinite integers `zHat`, the Herbrand quotient and two-periodicity, and the Galois action on the integers of a local field | Tau Ceti: `absoluteGaloisGroupRestrictEquiv`, `galoisSubgroup`, `galoisSubgroupEquiv`, `ClassFieldTheory.classField`, `OpenNormalSubgroup.IsAbelianClassFieldLayer`, `zHat`, `TateCohomology.herbrandQuotient`, `Rep.FiniteCyclicGroup.periodicIso`, `integerRingIsInvariantSubring` |
| The coefficient dictionary between discrete modules and topological representations, the Galois-cohomology coefficients `μ_n` and `(Kˢ)ˣ`, the Kummer map, the explicit `H¹` with its functoriality and its comparison with continuous cohomology, and the internal hom with its conjugation action and evaluation pairing | Tau Ceti: `ofDiscreteModule`, `ofDiscreteModuleMap`, `IsSmoothDiscrete`, `ofDiscreteModule_isSmoothDiscrete`, `KummerCoeff`, `UnitsCoeff`, `kummerMap`, `kummerMap_eq_kummerCocycleClass`, `ContCohomology.H1`, `ContCohomology.explicitMap1`, `ContCohomology.explicitH1AddEquivContinuousCohomology`, `ContCohomology.cocycleEquiv1`, `InternalHom`, `homAction`, `InternalHom.evalPairing`, `InternalHom.smul_eq_self_iff` |
| Number fields, places, completions, ideles, idele classes, moduli, ray classes, weak approximation, orders, and Picard groups | `GlobalNumberFields` |
| Frobenius classes and the ideal-theoretic Artin map away from ramified primes; the relative discriminant ideal `relDiscr` | `NumberFieldArithmetic` (Layer 4.1 for `relDiscr`) |

### Consumers and boundaries with neighbouring roadmaps

- `ProfiniteCohomology` owns continuous cohomology of profinite groups, its explicit low-degree
  models, continuous cups, change-of-group maps, Kummer theory, and the finite-quotient colimit;
- `LocalFieldsRamification` owns valuations, unit and ramification filtrations, arithmetic
  Frobenius, conductors that are purely ramification-theoretic, and the tame quotient;
- `GlobalNumberFields` owns places, mixed weak approximation, moduli, ray and narrow class
  groups, adeles, ideles, Hecke-character carriers, infinity types, number-field orders, `Pic`,
  and `NarrowPic`;
- `NumberFieldArithmetic` owns finite-place Frobenius and the ideal-theoretic Artin map
  `artinHomAway` on `idealsAway`;
- `LocalGaloisGroups` consumes the local-cohomological material of Layers 0 and 4–7 under Tau
  Ceti's names, without private stand-ins: the coefficients `GalRep`, `muNRep` and the Kummer
  isomorphisms `kummerEquiv` and `kummerEquivOfCharZero`; degree two and local duality, `finite_H`,
  `h2MuEquivZMod_mixed`, `h2FpEquivZMod`, `tateDual`, `tateDualityPairing`,
  `tateDualityPairing_perfect_mixed` and `eulerCharacteristic_finrank_fp`; the chosen-root
  comparison of the cup square with duality, `muNRepEquivZMod`, `kummerCupPairing`,
  `kummerCupPairing_bil`, `localSymbol`, `muNRepToTateDual`, `bijective_muNRepToTateDual` and
  `tateDualityPairing_muNRepToTateDual`; reciprocity and its orientation, `artinMap`,
  `artinMap_restrict`, `absoluteGaloisGroupExtend`, `artinMap_norm`, `denseRange_artinMap`,
  `localArtinMap`, `normResidue`, `unramifiedCoordinate`, `unramifiedCoordinate_artinMap`,
  `localCyclotomicCharacter_artinMap_padic`, `localCyclotomicCharacter_artinMap_unit` and
  `localCyclotomicCharacter_artinMap_uniformizer`; the class formation and Tate's theorem,
  `ClassFormation`, `ClassFormation.fundamentalClass`, `fundamentalClass_generates`, `tateTheorem`
  and `artinMap_conj`; the theorem of Nakayama and Rim, `Rep.projective_ker_of_isZero_res`, and
  `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`; and
  `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two`. The smoothness hypotheses of
  `finite_H`, `tateDualityPairing_perfect_mixed` and `eulerCharacteristic_finrank_fp` are instance
  arguments, found at `μ_p`, at its Tate dual and at the trivial module `𝔽_p`, the modules this
  consumer uses. The cyclotomic normalization is proved from the explicit local symbols of the
  cyclotomic fields over `ℚ` (Layer 7), so this consumer does not depend on the global layers;
- `FunctionFieldArithmetic` (§4.2 there) consumes Layers 4–8 and extends local existence,
  injectivity of the absolute local Artin map, the local class-field correspondence and Weil
  reciprocity to the `p`-primary norm subgroups of a local field of characteristic `p`, by
  Lubin–Tate and Artin–Schreier–Witt theory; the statements over every nonarchimedean local field
  are assembled there from its equal-characteristic case and the characteristic-zero case of
  Layers 8 and 9. The upper-numbering theorem and the conductor–discriminant formula of Layer 7
  stay here in every characteristic, because their norm-map proof uses neither theory;
- `GlobalQuadraticForms` owns Hasse–Minkowski and the global classification of quadratic
  forms, and consumes Tau Ceti's `hilbertProductFormula` (Layer 14);
- `QuadraticFormInvariants` owns the norm-equation and quaternion presentations of local
  Hilbert symbols and proves that they agree with Tau Ceti's cohomological `localSymbol` and with
  the Hilbert invariants `finiteHilbertInvariantAt` and `infiniteHilbertInvariantAt`
  (Layers 5 and 14).

Consequently this roadmap defines no modulus, ray-class carrier, idele carrier, Hecke character,
order, Picard group, local quadratic-form invariant, or global quadratic form, and it has no
dependency on `QuadraticFormInvariants`. The Hilbert pairing is Tau Ceti's `localSymbol`, built
from Kummer classes, the continuous cup product and the local invariant map, and the product
formula is proved cohomologically. This fixes the dependency direction
`ClassFieldTheory → QuadraticFormInvariants`, never the reverse.

### Explicitly outside this roadmap

- global Weil groups and Weil's construction of the Weil group of a class formation (Artin–Tate
  XV; the local Weil group is a full layer of this roadmap, §4 Layer 9);
- explicit power-reciprocity laws beyond quadratic reciprocity (Artin–Tate XII);
- Lubin–Tate theory, formal groups, and any construction of local class field theory not routed
  through the class formation. Local existence (§4, Layer 8) is proved from the norm topology, the
  norm-limitation theorem and the Kummer theory of Layer 5, never from Lubin–Tate formal groups;
  no target of this roadmap names a Lubin–Tate object;
- Artin–Schreier–Witt theory, hence `p`-primary local existence in equal characteristic `p`,
  injectivity of the absolute local Artin map, the full local class-field correspondence and the
  Weil-group reciprocity isomorphism `Kˣ ≃ W_K^ab` for such fields. These are
  FunctionFieldArithmetic's (§4.2 there); here they are stated in characteristic zero (§4,
  Layers 8 and 9). The upper-numbering theorem and the conductors of Layer 7 are not in this
  exclusion: they hold in every characteristic;
- the Grunwald–Wang theorem and the realization of prescribed local abelian extensions by global
  ones. Global existence (§4, Layer 12) is proved through Kummer theory over `K(ζ_p)` and norm
  descent, and no target of this roadmap names it;
- global class field theory for one-variable function fields over finite fields. The global
  formation, ideles, reciprocity, existence, and class-field correspondence developed here are for
  **number fields**: every global target carries `NumberField K` and is stated on the number-field
  idele and idele-class carriers of `GlobalNumberFields`. Nothing here is to be read as covering
  all global fields;
- Hasse–Minkowski, the classification of global quadratic forms, and the norm-equation and
  quaternion presentations of Hilbert symbols;
- pro-`p` group theory and the Demushkin structure of local Galois groups.

---

## 2. Mathematical conventions

### 2.1 Formations

Artin–Tate describe a formation by a group `G`, a distinguished family of finite-index subgroups,
and a `G`-module `A` whose elements are fixed by sufficiently small subgroups. In the classical
applications the distinguished subgroups are the open subgroups of a profinite Galois group. Tau
Ceti's `ClassFieldTheory.Formation` is the equivalent topological formulation, and this roadmap
uses it:

- `G` is profinite;
- `A` is a discrete continuous additive `G`-module, i.e. a smooth discrete `TopRep ℤ G`: Tau
  Ceti's `Formation G` is `SmoothDiscreteTopRep ℤ G`;
- for an open subgroup `U`, the level is `A^U` (`Formation.level`, a submodule of `A`);
- a finite normal layer is a pair of open subgroups `V ≤ U` such that `V` is normal in `U`
  (`NormalLayer`);
- its finite Galois group is `Γ = U / V` (`NormalLayer.Gal`), finite because `V` is open in the
  compact group `U`;
- its coefficient module is `A^V`, with the induced `Γ`-action (`NormalLayer.rep`);
- its ground level is `(A^V)^Γ = A^U` (`NormalLayer.groundLevelEquiv`).

The additive convention is used in the abstract theory. Multiplicative groups such as `Kˣ` and
idele class groups enter through `Additive` adapters. No theorem should depend on silently
switching between the two conventions.

**Universe.** Mathlib's `tateCohomology` requires the finite group and the coefficient ring `ℤ`
to live in one universe, so the whole development is stated at universe `0` (`G : Type`,
`K : Type`), as Tau Ceti's formations are; the restriction disappears only if Mathlib generalizes
the Tate complex.

### 2.2 Class formations

For every finite normal layer `V ◁ U`, put `Γ = U / V` and `C = A^V`. A class formation supplies
the following data and axioms; they are exactly the fields of Tau Ceti's `ClassFormation`
(`subsingleton_h1`, `inv`, `inv_injective`, `range_inv`, `inv_restrict`, `inv_infl`, `inv_conj`),
with `ℚ/ℤ` the rational circle `AddCircle (1 : ℚ)` and its subgroup of order `n` the `n`-torsion.

1. `H¹(Γ, C) = 0`.
2. An injective invariant homomorphism

   ```text
   inv(U,V) : H²(Γ, C) → ℚ/ℤ.
   ```

3. Its image is the unique subgroup of `ℚ/ℤ` of order `[U : V]`.
4. If the ground subgroup is replaced by an intermediate open subgroup, restriction multiplies
   the invariant by the relative degree.
5. Enlarging the top field, equivalently inflating to a refinement of the layer, does not change
   the invariant.
6. Conjugation carries the invariant map for one layer to that for the conjugate layer.

The fourth condition is the finite-layer form of

```text
inv_E (res(F→E) x) = [E : F] · inv_F(x).
```

The fifth condition is made explicit in Lean even when it is suppressed in classical notation,
because the notation `inv_F` there comes from a single map on a direct-limit Brauer group.

These axioms stop at Tate's theorem and reciprocity. They do **not** imply an abstract existence
theorem. This roadmap therefore has no `ClassFormation`-level existence declaration: local and
global existence are separate arithmetic theorems whose proofs establish the relevant topology,
divisibility, and norm-limitation inputs in their own settings. In Artin–Tate's organization these
are the additional hypotheses IIIa–IIId of the abstract existence theorem (Chapter XIV §6, p. 163),
not consequences of the class-formation axioms.

### 2.3 Fundamental classes

If the layer has degree `n`, the invariant axioms imply that `H²(Γ,C)` is cyclic of order `n`.
Its **fundamental class** is the unique element

```text
u(U,V) : H²(Γ,C)
```

with invariant `1/n` in `ℚ/ℤ`. It is derived from the invariant map; it is not an independent
field of `ClassFormation` and it is never chosen arbitrarily. Tau Ceti implements it
(`ClassFormation.fundamentalClass`, `inv_fundamentalClass`, `fundamentalClass_generates`) with
every compatibility below.

The first compatibility theorem is

```text
res(u(U,V)) = u(U',V)
```

for an intermediate ground subgroup `V ≤ U' ≤ U`. For a refinement of the top subgroup, the
inflation formula is scaled: `inf(u(U,V)) = [V : V'] · u(U,V')`. Corestriction goes the other
way and is scaled by the relative degree: `cor(u(U',V)) = [U : U'] · u(U,V)`, while it preserves
invariants (`inv_cor`). ⚠ The index is `[U : U']`, not `[U' : U]`: `U'` is the *sub*group, so
`[U : U']` is the relative field degree `[E : F]`, which is what `fundamentalClass_cor` calls
`T.relativeDegree`. The invariant normalization forces it —
`inv(u(U',V)) = 1/[U' : V] = [U : U']/[U : V]`, and corestriction preserves invariants. These statements are needed to apply Tate's theorem to every subgroup
of `Γ`.

### 2.4 Tate's theorem and its Tate–Nakayama generalization

The generic finite-group theorem is Tate's theorem (J. Tate, *The higher
dimensional cohomology groups of class field theory*, Ann. of Math. 56, 1952). Let `Γ` be
finite, let `C` be a `Γ`-module, and let `u ∈ H²(Γ,C)`. Suppose that for every subgroup `H` of
`Γ`:

```text
H¹(H,C) = 0,
H²(H,C) is cyclic of order |H|,
res_H(u) generates H²(H,C).
```

Then, for every integer `r`, cup product with `u` gives an isomorphism

```text
Ĥ^r(Γ,ℤ)  ≃  Ĥ^{r+2}(Γ,C).
```

**The hypotheses are stated individually, not bundled.** `tateTheorem` takes each of the three as
a separate explicit argument, over the finite quotient system `H ↦ subgroupLayer H`; it never
takes a `ClassFormation`. This matters because the pieces are consumed separately downstream, and
a layer that satisfies only some of them — a cyclic layer of the local formation, an `S`-idele
layer of the global one — must still be able to use the theorem. The individual names, each of
which is a declaration rather than a clause of prose, are below; all are Tau Ceti's, as are
`tateTheorem` itself (`Formation/Tate/Theorem.lean`) and `ClassFormation.tateIso_res_trans`
(`Formation/Tate/Naturality.lean`).

| Datum | Name |
|---|---|
| the finite quotient system `H ↦ subgroupLayer H`, with its Galois group, degree and restriction datum | `NormalLayer.subgroupLayer`, `subgroupGalEquiv`, `degree_subgroupLayer`, `subgroupRestriction`, `relativeDegree_subgroupRestriction` |
| compatible fundamental classes under restriction, corestriction, inflation and conjugation | `fundamentalClass_restrict`, `fundamentalClass_cor`, `fundamentalClass_infl`, `fundamentalClass_conj` |
| the two low-degree Tate identifications | `tateHMinusTwoEquivAbelianization`, `tateHZeroEquivNormQuotient` |
| restriction/corestriction normalization | `inv_restrict` (an axiom), `inv_cor` (a theorem), `LayerRestriction.cohomologyCor_cohomologyRes`, `tateCor_tateRes` |
| tower compatibility | `LayerRestriction.trans`, `relativeDegree_trans`, `cohomologyRes_trans`, `cohomologyCor_trans`, `tateRes_trans`, `tateCor_trans`, `LayerRefinement.trans`, `cohomologyInfl_trans`, `tateIso_res_trans` |
| the three hypotheses, verified for a class formation | `h1_subgroupLayer`, `card_H2_subgroupLayer`, `fundamentalClass_restrict_generates` |

⚠ `inv_cor` is a theorem, not a field of `ClassFormation`. Adding it as an axiom would let an
implementation satisfy it by fiat, and it is a consequence of `inv_restrict`, `inv_injective` and
`cor ∘ res = [E:F]`; Tau Ceti proves it so. ⚠ The restriction, corestriction and inflation squares
do not have the same shape: restriction multiplies invariants by the relative degree, corestriction
preserves them, and inflation of the fundamental class is scaled. A single "compatibility" clause
covering all three is false.

Artin–Tate prove it from their Preliminaries §2 Theorem A, the cup-product criterion (surjective,
bijective, injective in three consecutive degrees for every subgroup), and call the
class-formation specialization the **Main Theorem** (Chapter XIV §4, Theorem 1). The
generalization to an arbitrary coefficient module `M` with `Tor₁^ℤ(M,C) = 0`,

```text
Ĥ^r(Γ,M)  ≃  Ĥ^{r+2}(Γ, M ⊗ C),
```

is Nakayama's (Ann. of Math. 65, 1957) and is what the literature calls the **Tate–Nakayama
theorem**. Tau Ceti proves it as
`TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective` (Layer 0), with the
same three hypotheses, individually stated on the subgroups of prime-power order, plus the
vanishing of `Tor₁`.
The class-field-theory application uses `M = ℤ`, i.e. Tate's theorem, and Tau Ceti names the
generic theorem `tateTheorem` and its application to a class formation `tateIso`. The explicit
degree `-2 → 0` map is Artin–Tate's *Nakayama map*, after Nakayama's 1935 explicit formula
(`nakayamaNegTwo`); it is not to be confused with the Tate–Nakayama theorem.

The public isomorphism is not merely an existential equivalence between two groups. Its
underlying homomorphism is the named cup-product map with the named fundamental class. This
identity is part of the API.

### 2.5 The direction of reciprocity

At `r = -2`, Tate's theorem gives

```text
Ĥ^{-2}(Γ,ℤ)  →  Ĥ^0(Γ,C).
```

The canonical low-degree identifications are

```text
Ĥ^{-2}(Γ,ℤ)  ≃  Γ^ab,
Ĥ^0(Γ,C)     ≃  A^U / N_{U/V}(A^V).
```

Thus cup product with the fundamental class gives the **Nakayama map**

```text
nakayamaNegTwo : Γ^ab ≃ A^U / N_{U/V}(A^V).
```

The Artin reciprocity direction used in this roadmap is its inverse:

```text
artinEquiv : A^U / N_{U/V}(A^V) ≃ Γ^ab.
```

The map on the ground level is

```text
artinMap : A^U → Γ^ab,
```

obtained by composing the quotient map with `artinEquiv`. Consequently its kernel is exactly the
norm subgroup. In Tau Ceti, `tateIso`, `nakayamaNegTwo`, `artinEquiv` and `artinMap` are ordinary
definitions with bodies (`Formation/Tate/Theorem.lean`, `Formation/ArtinMap.lean`): `tateIso` is
`tateTheorem` applied to the fundamental class, `artinEquiv` is `nakayamaNegTwo.symm`
**definitionally**, `ClassFormation.artinMap_apply` and `artinEquiv_eq_tateIso` are `rfl`, and `tateTheorem`,
`tateIso_toAddMonoidHom`, `ker_artinMap` and `character_artinMap` are proved. The two low-degree
identifications (`NormalLayer.tateHMinusTwoEquivAbelianization`,
`NormalLayer.tateHZeroEquivNormQuotient`) and the cup-product map `cupClass` are Tau Ceti's too.
Tau Ceti writes the character formula with the invariant on the left,
`inv(class(a) ∪ δχ) = χ(artinMap a)`.
A character formula provides an independent normalization check. An arbitrary equivalence of
groups does not satisfy the contract.

### 2.6 Frobenius convention

All local and global Artin maps use **arithmetic Frobenius**.

- For an unramified extension of nonarchimedean local fields, a uniformizer maps to the
  automorphism inducing `x ↦ x^q` on the residue field, and the unramified coordinate sends every
  lift of its absolute Artin symbol to the generator `zHat.gen` of `ℤ̂` (`1` in additive
  notation).
- For `K/ℚ_p` finite and a unit `u`, `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`. Omitting the field
  norm is ill-typed away from `ℚ_p`.
- For a number-field extension and an unramified prime `𝔭`, the ideal Artin symbol is the
  arithmetic Frobenius at `𝔭`.
- For `ℚ(ζ_m)/ℚ` and a prime `ℓ` not dividing `m`, the Artin symbol of `(ℓ)` sends `ζ_m` to
  `ζ_m^ℓ`.

Choosing geometric Frobenius would invert every one of these formulae. The unramified local and
cyclotomic regression tests of §5 are therefore mandatory. `geometricArtinMap` is defined only as
the precomposition of the arithmetic map with inversion, for interoperability.

### 2.7 Further pinned conventions

- The local invariant map sends the fundamental class of a degree-`n` extension to `1/n` in
  `ℚ/ℤ`. Restriction multiplies invariants by the degree (`inv_restrict`); corestriction preserves
  them (`inv_cor`). Both directions are named maps in every degree, not one map and its inverse.
- An invariant map is data, and it is constructed before the class formation that carries it:
  `invMap` before `localClassFormation` (`localClassFormation_inv_apply`), and `globalInv` — the
  sum of local invariants — before `globalClassFormation` (`globalClassFormation_inv`). No object
  of this roadmap is both a prerequisite of a construction and a theorem proved after it.
- The local Weil group carries the **Weil topology**, in which inertia is open, and not the
  subspace topology from `G_K`; its reciprocity isomorphism is with the **topological**
  abelianization `W_K / closure ⁅W_K, W_K⁆`. Its functoriality is along finite **separable**
  extensions, through a chosen `K`-embedding into `Kˢ`.
- A ring class field is defined for **every** order `O` of every number field `K`, as the class
  field of the kernel of the idelic quotient `C_K → Pic O`; no degree hypothesis appears in its
  type. The description `O = ℤ + f𝒪_K` of the orders of a quadratic field is a specialization,
  never a hypothesis.
- **Every class field lives inside the separable closure**, as `IntermediateField K
  (SeparableClosure K)`, because that is the closure whose automorphism group is the formation's
  group, Tau Ceti's `AbsoluteGaloisGroup`. A class field is then literally
  `IntermediateField.fixedField` of the open normal subgroup the correspondence produces, with no
  intervening transport. For a number field the separable and algebraic closures agree, so nothing
  is lost.
- **A norm subgroup determines an abelian layer and only an abelian layer.** By norm limitation a
  nonabelian layer and its maximal abelian sublayer share a norm subgroup, so the final existence
  theorems return an abelian layer and are paired with uniqueness. The two order statements run in
  opposite directions and both are named: inclusion-preserving on subgroups of `G_K`,
  inclusion-reversing on the fields they cut out.
- Tate cohomology is Mathlib's, defined for every `r : ℤ`. Inflation is used only in positive
  degrees; Tate degree zero is a quotient by the norm and does not admit the naive inflation
  map.
- The global Artin map is a transport of the abstract Artin map and agrees with
  `NumberFieldArithmetic.artinHomAway`; there is one ideal-theoretic Artin map in the portfolio.
- A modulus's infinite part consists of real places. The modulus, ray subgroup and ray-class
  group are imported from `GlobalNumberFields`, never redefined here.
- The absolute Galois group of the formation is Tau Ceti's separable-closure group
  `AbsoluteGaloisGroup`; Mathlib's algebraic-closure
  `Field.absoluteGaloisGroup` and its topological abelianization are the carriers of the frozen
  local exports `artinMap` and `unramifiedCoordinate`, related by Tau Ceti's comparison
  `absoluteGaloisGroupRestrictEquiv`.
- `ℤ̂` is Tau Ceti's `zHat`, written multiplicatively; no second profinite completion of `ℤ` is
  built here.

---

## 3. Frozen public interface

The following names are the public contract. The mathematical direction of each map is fixed;
exact universe parameters may change during implementation.

**Consumed from Tau Ceti at the pin**, under Tau Ceti's names, and never restated:

| Object or theorem | Tau Ceti declaration |
|---|---|
| formation, finite normal layer, level | `Formation`, `NormalLayer`, `Formation.level` |
| restriction, corestriction, and their normalization | `LayerRestriction.cohomologyRes`, `cohomologyCor`, `tateRes`, `tateCor`, `trivialTateRes`, `trivialTateCor`, `cohomologyCor_cohomologyRes`, `tateCor_tateRes` |
| towers | `LayerRestriction.trans`, `LayerRefinement.trans`, `relativeDegree_trans`, `cohomologyRes_trans`, `cohomologyCor_trans`, `tateRes_trans`, `tateCor_trans`, `cohomologyInfl_trans` |
| the finite quotient system | `NormalLayer.subgroupLayer`, `subgroupGalEquiv`, `subgroupRestriction`, `degree_subgroupLayer`, `relativeDegree_subgroupRestriction` |
| class-formation axioms, invariant map | `ClassFormation`, `ClassFormation.inv`, `inv_cor` |
| fundamental class | `ClassFormation.fundamentalClass`, `fundamentalClass_generates`, `fundamentalClass_restrict`, `fundamentalClass_cor`, `fundamentalClass_infl`, `fundamentalClass_conj` |
| cup with a chosen class, and with the fundamental class | `cupClass`, `ClassFormation.cupFundamentalClass` |
| Tate's theorem | `tateTheorem`, `tateTheorem_toAddMonoidHom`, `ClassFormation.tateIso`, `tateIso_res`, `tateIso_cor`, `tateIso_res_trans` |
| the abstract Artin map | `ClassFormation.nakayamaNegTwo`, `ClassFormation.artinEquiv`, `ClassFormation.artinMap`, `ClassFormation.ker_artinMap`, `ClassFormation.character_artinMap` |
| abelian layers and norm limitation | `OpenNormalSubgroup.IsAbelianClassFieldLayer`, `maximalAbelianLayer`, `ClassFormation.normSubgroup_maximalAbelianLayer` |
| class fields as subfields | `classField`, `classField_le_classField_iff`, `galClassFieldEquiv` |
| the local Brauer group and invariant | `Br`, `invMap`, `unitsRep` |
| local class formation and finite local reciprocity | `localClassFormation`, `localArtinEquiv`, `localArtinMap`, `normResidue`, `normGroup` |
| the absolute local Artin map | `artinMap`, `artinMap_restrict`, `artinMap_norm`, `artinMap_congr`, `continuous_artinMap`, `denseRange_artinMap`, `ker_artinMap_eq_iInf` |
| local norm subgroups and abelian layers | `localNormSubgroup`, `isOpen_localNormSubgroup`, `finiteIndex_localNormSubgroup`, `localNormSubgroup_maximalAbelianLayer`, `localAbelianGaloisEquiv`, `index_localNormSubgroup` |
| local coefficients and local Tate duality | `GalRep`, `muNRep`, `tateDual`, `tateDualityPairing`, `dualityMap0_kummerCoeff_bijective`, `dualityMap1_kummerCoeff_bijective`, `dualityMap2_kummerCoeff_bijective`, `subsingleton_h3_unitsRep` |
| ramification and conductors | `unitFiltration`, `LocalFieldsRamification.upperRamificationGroup`, `discriminantExponent` |
| local invariants of a global Brauer class | `finiteInvAt`, `infiniteInvAt` |
| ideles and their norms | `ideleFormation`, `globalFormation`, `ideleToClassH2`, `GlobalNumberFields.ideleNormMap`, `GlobalNumberFields.ideleClassNormMap` |
| generic Tate cohomology (Layer 0) | `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`, `Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res`, `Rep.projective_ker_of_isZero_res`, `Rep.isZero_res_of_exact`, `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`, `Submodule.free_of_isPrincipalIdealRing` |
| the local Hilbert pairing (Layer 5) | `kummerEquiv`, `kummerEquivOfCharZero`, `h2MuEquivZMod_mixed`, `kummerCupPairing`, `localSymbol`, `localSymbol_kummerClass_mul`, `localSymbol_kummerClass_eq_zero_of_add_eq_one`, `localSymbol_antisymm`, `localSymbol_eq_zero_iff_mem_normGroup`, `forall_localSymbol_kummerClass_eq_zero_iff` |
| local duality and the Euler characteristic (Layer 5) | `finite_H`, `tateDualityPairing_perfect_mixed`, `tateDualityPairing_muNRepToTateDual`, `eulerCharacteristic_mixed`, `eulerCharacteristic_finrank_fp`, `localEulerCharacteristic_eq_localCardNorm` |
| cohomological dimension, in characteristic zero (Layer 6) | `subsingleton_h3_unitsRep`, `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` |
| normalizations of the local Artin map (Layers 6 and 7) | `localArtinMap_uniformizer`, `localArtinMap_eq_frobenius_pow_valuation`, `localArtinMap_quadratic_eq_nontrivial_iff_not_norm`, `localArtinMap_quadratic_eq_hilbertSymbol`, `unramifiedCoordinate_artinMap`, `localCyclotomicCharacter_artinMap_padic`, `localCyclotomicCharacter_artinMap_unit`, `abelianizedLocalCyclotomicCharacter_artinMap_norm`, `geometricArtinMap` |
| local conductors (Layer 7) | `conductorExponent`, `conductorIdeal`, `characterConductorExp`, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`, `conductorExponent_fixedField_ker` |
| local existence and the local correspondence (Layer 8) | `localAbelianExistence`, `localAbelianExistence_primeToResidueCharacteristic`, `localClassField_unique`, `localClassFieldCorrespondence`, `localClassFieldCorrespondencePrimeToResidueCharacteristic`, `injective_artinMap` |
| the local Weil group (Layer 9) | `localWeilGroup`, `WeilGroup`, `weilDegree`, `inertiaToWeil`, `isOpenEmbedding_inertiaToWeil`, `weilTopology_unique`, `weilTransfer`, `index_range_weilTransfer`, `weilDegree_weilTransfer`, `weilRestrict`, `range_weilTransfer_eq_ker_weilRestrict`, `localWeilArtinEquiv`, `localWeilArtinEquiv_compat` |
| the Brauer sequence of a number field (Layer 10) | `brLocalization_injective`, `sumLocalInv_brLocalization_eq_zero`, `range_brLocalization`, `exists_br_of_sum_eq_zero`, `infiniteInvMap`, `infiniteArtinAt`, `globalInv` |
| global reciprocity (Layer 11) | `globalClassFormation`, `globalArtinEquiv`, `globalArtinMap`, `ker_globalArtinMap`, `surjective_globalArtinMap`, `globalArtinMap_principal`, `globalArtinMap_local`, `globalArtinMap_ideal`, `globalArtinMap_isArithFrobAt` |
| global existence and the global correspondence (Layer 12) | `globalAbelianExistence`, `globalClassField_unique`, `globalClassFieldCorrespondence`, `globalClassField_le_iff`, `globalClassField_orderReversing`, `globalAbelianGaloisEquiv`, `card_ideleClassNormQuotient` |
| norm theorems and class fields (Layer 13) | `cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`, `abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd`, `rayClassArtinMap`, `rayClassField`, `hilbertClassField`, `narrowHilbertClassField`, `hilbertClassArtinEquiv`, `fieldRange_le_hilbertClassField_iff`, `ringClassField`, `ringClassArtinEquiv`, `kroneckerWeber` |
| Hilbert reciprocity (Layer 14) | `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, `hilbertProductFormula` |

Quadratic reciprocity is Mathlib's `legendreSym.quadratic_reciprocity`.

**The open headline theorems of this roadmap**, stated in `Suggested.lean`:

| Theorem | Declaration |
|---|---|
| the upper-numbering theorem | `normResidue_map_unitFiltration` |
| the local conductor–discriminant formula | `galoisCharacterConductorExp`, `discriminantExponent_eq_finsum_galoisCharacterConductorExp` |
| the conductor as the largest character conductor | `conductorExponent_eq_iSup_galoisCharacterConductorExp` |
| the principal ideal theorem | `isPrincipal_map_hilbertClassField` |
| the global conductor–discriminant formula, product and lcm | `count_relDiscr_eq_finsum_abelianConductor_exponent`, `abelianConductor_eq_lcm` |

⚠ **The correspondence runs in one direction on subgroups and the opposite direction on fields.**
Inclusion of open normal subgroups of `G_K` is *reverse* inclusion of the fields they cut out, so a
class-field correspondence written on subgroups is order **preserving** (`N₁ ≤ N₂ ↔ V₁ ≤ V₂`,
`globalClassField_le_iff`) and the same correspondence written on fields is order **reversing**
(`N₁ ≤ N₂ ↔ L₂ ⊆ L₁`, `globalClassField_orderReversing`). Writing the subgroup form with the
inclusions reversed would be false; the extreme case `V = ⊤ ↦ K ↦ N = Kˣ` pins it.

Tau Ceti's `cyclicHasseNorm` and `hilbertProductFormula` are stated on the native idele and
completion carriers; neither may be replaced with a proposition-valued interface whose hypotheses
assume the conclusion.

---

## 4. Build plan

The layer order below **is** the dependency order. Every layer's prerequisites are Mathlib, Tau
Ceti, one of the supplier roadmaps of §1, or an *earlier* layer of this roadmap; no layer uses a
name introduced later, and the graph of §7 is the same graph. Tau Ceti implements most of this
plan at the pin: for that material a layer records the contract the roadmap consumes — names,
hypotheses and conventions — rather than a construction, and the open targets are marked as such.
Six orderings are normative rather than editorial:

- the local Brauer group and its invariant map are built in Layer 5 and consumed by the local class
  formation in Layer 6, never the other way round, and within Layer 5 the local `H²` bound precedes
  the invariant on all of `Br K`;
- within Layer 5, `finite_H` precedes local duality, and duality precedes the Euler characteristic,
  whose additivity uses it;
- local existence is Layer 8, after the Kummer theory of Layer 5 that its proof uses;
- the sum-of-local-invariants map is built in Layer 10 and *is* the invariant of the global class
  formation of Layer 11, so it cannot also be a theorem proved after it;
- the cyclotomic normalization of the absolute local Artin map is a theorem of Layer 7, proved by
  comparison with the explicit local symbols of the cyclotomic fields over `ℚ`, whose product
  formula is a direct computation; Layer 10 consumes it for the sum formula
  `sumLocalInv_brLocalization_eq_zero`, so it cannot be proved from the global class formation;
- the archimedean Artin maps are built in Layer 10, beside `infiniteInvMap` and before the sum
  formula, which reads the Artin symbol at `∞` as a local invariant; Layer 11 consumes them.

### Layer 0: the generic Tate-cohomology suppliers

*Prerequisites:* Mathlib; `ProfiniteCohomology`. **Implemented in Mathlib and Tau Ceti**, and
consumed here under their names; this roadmap restates none of it and defines no Tate-cohomology
carrier.

- **The carrier.** Mathlib's integer-graded `tateCohomology`
  (`Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean`), with its functoriality,
  connecting map, long exact sequence, and the comparisons `isoGroupCohomology` and
  `isoGroupHomology` with ordinary cohomology and homology.
- **The operations.** Tau Ceti's coefficient functoriality, restriction and corestriction in every
  Tate degree with `cor ∘ res = [G:H]`, inflation in positive degrees, the Tate cup product, the
  identifications `Ĥ^{-2}(G,ℤ) ≃ G^ab` and `Ĥ⁰(G,M) ≃ M^G / N_G M` (as used in Layers 1–4),
  two-periodicity for cyclic groups (`Rep.FiniteCyclicGroup.periodicIso`), and the Herbrand quotient
  `TateCohomology.herbrandQuotient`, multiplicative in short exact sequences
  (`herbrandQuotient_eq_mul_of_shortExact`), invariant under maps with finite kernel and cokernel
  (`herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel`), and equal to `#G` on the trivial
  module `ℤ` (`herbrandQuotient_trivial_int_eq_card`).
- **The Tate–Nakayama theorem**,
  `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`: for a finite group
  `G`, `C : Rep ℤ G` and `u ∈ H²(G, C)` such that on every subgroup `S` of prime-power order
  `H¹(S, C) = 0`, `H²(S, C)` has `#S` elements and is generated by the restriction of `u`, cup
  product with `u` is bijective from degree `r` with coefficients `M` to degree `r + 2` with
  coefficients `M ⊗ C`, in every integer degree, for every `M` with `Tor₁^ℤ(M, C) = 0` (in the form
  that `M ⊗ X → M ⊗ Y` is injective for every short exact `0 → X → Y → C → 0`).
- **The theorem of Nakayama and Rim**, in Tau Ceti's `Rep` namespace, with cohomological
  triviality written out as `∀ (S : Subgroup G) [Fintype S] (n : ℤ), IsZero (tateCohomology
  (res S.subtype A) n)`, the conclusion of Tau Ceti's criterion
  `TauCeti.TateCohomology.isZero_of_forall_isPGroup`, so no new predicate is introduced:
  - `Rep.isZero_res_of_projective`: a representation whose `k[G]`-module is projective is
    cohomologically trivial, for every commutative ring `k`;
  - `Rep.projective_of_isZero_res`: for `G` finite and `k` a domain of characteristic zero in which
    every prime number is a unit or generates a maximal ideal (which covers `ℤ`, `ℤ_[p]`, `ℤ_(p)`
    and every field of characteristic zero), a cohomologically trivial representation whose
    underlying `k`-module is projective — in particular free, of any rank — is projective over
    `k[G]`;
  - `Rep.projective_ker_of_isZero_res`: for the same `k`, every surjection onto a cohomologically
    trivial `A` from a projective `k[G]`-module has projective kernel, with no finiteness
    hypothesis on `A`, so `A` has a projective resolution of length one;
  - `Rep.isZero_res_of_exact`: conversely, `A` is cohomologically trivial when
    `0 → P₁ → P₀ → A → 0` is exact with `P₀` and `P₁` projective, for every commutative ring `k`.
- **Freeness of submodules**, `Submodule.free_of_isPrincipalIdealRing`
  (`TauCeti/LinearAlgebra/FreeModule/PID.lean`): over a principal ideal domain every submodule of a
  free module is free, in any rank. Mathlib's `Submodule.nonempty_basis_of_pid` is the finite-rank
  case.
- **Primary components**, `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`: if
  multiplication by `p` is bijective on `A`, the `p`-primary component of `Ĥⁿ(S, A)` is trivial
  for every finite subgroup `S` and every `n ∈ ℤ`.

**Checks.**

- For `G = C₂ = ⟨g⟩`, the regular module `ℤ[C₂]` is projective, and its invariants `ℤ(1 + g)` are
  the norms, so `Ĥ⁰ = 0`, as `Rep.isZero_res_of_projective` requires. The trivial module `ℤ` has
  `Ĥ⁰(C₂, ℤ) = ℤ/2 ≠ 0`, so the hypothesis of `Rep.projective_of_isZero_res` fails there, as it
  must: `ℤ` with trivial action is not projective over `ℤ[C₂]`. The zero representation satisfies
  both sides.
- `⊕ᵢ 2ℤ eᵢ ⊆ ⊕ᵢ ℤ eᵢ`, `i ∈ ℕ`, is free on `{2eᵢ}`, of infinite rank: the case
  `Submodule.free_of_isPrincipalIdealRing` covers and the finite-rank theorem does not.

**Exit criterion,** met by Mathlib and Tau Ceti at the pin. Tau Ceti's `tateTheorem`, `tateIso`,
`nakayamaNegTwo` and `artinEquiv` are built on Mathlib's Tate groups and Tau Ceti's cup products,
with no locally defined cohomology object.

### Layer 1: formations and finite normal layers

*Prerequisites:* Layer 0; Mathlib open subgroups. **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/Formation/` (`Basic`, `Restriction`, `Refinement`,
`Corestriction`, `Conjugation`, `GroundNorm`, `GaloisMaps`, `AbelianLayer` and `Tate/`), and
consumed here under Tau Ceti's names; this roadmap restates none of it. Tau Ceti provides:

- `Formation G`, the smooth discrete `TopRep ℤ G` on a profinite `G`, with `Formation.level U = A^U`
  a submodule of the ambient module;
- the finite quotient `NormalLayer.Gal = U / V`, finite because `V` is open in the compact group
  `U`, and the degree `NormalLayer.degree`;
- the induced representation of `U / V` on `A^V` (`NormalLayer.rep`);
- the equality `(A^V)^(U/V) = A^U` (`NormalLayer.groundLevelEquiv`);
- **the finite quotient system:** for every subgroup `H ≤ U/V`, the corresponding intermediate open
  subgroup (`subgroupLayer`), its Galois group (`subgroupGalEquiv`), its degree
  (`degree_subgroupLayer`), the restriction datum relating it to `L`
  (`NormalLayer.subgroupRestriction`) and its relative degree
  (`relativeDegree_subgroupRestriction`), together with the identification of the restricted
  representation with the coefficient module of that intermediate layer
  (`LayerRestriction.repIso`);
- the layers `V ◁ ⊤` of open normal subgroups (`NormalLayer.ofOpenNormal`), which are the
  finite Galois extensions of the ground field of the formation;
- **the abelian layers among them.** `IsAbelianClassFieldLayer V` says that `V` contains the
  **closed** commutator subgroup `(commutator G).topologicalClosure`, the subgroup Mathlib's
  `TopologicalAbelianization` and `Field.absoluteGaloisGroupAbelianization` already quotient by;
  no second closed commutator subgroup is defined here, and the algebraic `commutator G` is the
  wrong subgroup because it need not be closed. Tau Ceti proves the finite-quotient form
  `isAbelianClassFieldLayer_iff_isMulCommutative`, the layer form
  `isMulCommutative_gal_ofOpenNormal`, and the resulting identification
  `abelianizationGalEquiv : Abelianization L.Gal ≃ L.Gal`, which is what lets the
  abelianization-valued Artin equivalence of Layer 4 be read as an isomorphism onto `L.Gal`;
- **the canonical maximal abelian sublayer** `maximalAbelianLayer V = V · [G,G]‾`, with
  `le_maximalAbelianLayer`, `isAbelianClassFieldLayer_maximalAbelianLayer` and the universal
  property `maximalAbelianLayer_le`. It is data — a join of two named subgroups — never a choice
  of "some abelian layer with the same norm subgroup";
- the norm `A^V → A^U`, the norm subgroup and the norm quotient (`norm`, `normSubgroup`,
  `NormQuotient`, `normQuotientMk`);
- restriction (`LayerRestriction`), refinement (`LayerRefinement`), and conjugation
  (`NormalLayer.conjugate`, `conjugateCohomologyIso`, `conjugateTateIso`) between layer
  representations, on ordinary and Tate cohomology, together with the ground-level inclusion,
  norm and identification (`groundInclusion`, `groundNorm`, `groundEquiv`,
  `conjugateGroundLevelEquiv`), and the transfer, inclusion, quotient and conjugation maps on
  abelianized Galois groups (`transferHom`, `inclusionHom`, `quotientHom`, `conjugateGalEquiv`);
  tower objects remember the actual inclusions, not only equal cardinalities;
- **restriction and corestriction as separate named maps** in every degree
  (`LayerRestriction.cohomologyRes`, `cohomologyCor`, `tateRes`, `tateCor`, `trivialTateRes`,
  `trivialTateCor`) with the normalization `cor ∘ res = [E:F]`
  (`cohomologyCor_cohomologyRes`, `tateCor_tateRes`);
- **tower compatibility:** restrictions and refinements compose (`LayerRestriction.trans`,
  `LayerRefinement.trans`), the relative degree is multiplicative along a tower
  (`relativeDegree_trans` in both namespaces), and every one of the maps above is functorial along
  a composite (`cohomologyRes_trans`, `cohomologyCor_trans`, `tateRes_trans`, `tateCor_trans`,
  `cohomologyInfl_trans`).

All Tate groups in a finite layer are the imported finite-group Tate groups of `U/V`.

**Exit criterion,** met by Tau Ceti at the pin. The expressions

```text
Ĥ^r(U/V,ℤ),
Ĥ^r(U/V,A^V),
A^U / N_{U/V}(A^V),
(U/V)^ab
```

are all represented by named types and canonical maps, and restriction, corestriction and towers
each have a name.

### Layer 2: class formations and fundamental classes

*Prerequisites:* Layer 1. **Implemented in Tau Ceti**, in `Formation/ClassFormation.lean`, and
consumed here. Tau Ceti's `ClassFormation` has the axioms of §2.2 with the invariant as data, and
Tau Ceti proves:

- `H²(U/V,A^V)` is cyclic of order `[U:V]` (`natCard_H2`, `isAddCyclic_H2`);
- existence and uniqueness of the class of invariant `1/[U:V]` (`existsUnique_inv_eq`), which is
  `fundamentalClass` (`inv_fundamentalClass`, `eq_fundamentalClass_iff`);
- `fundamentalClass` generates `H²` (`fundamentalClass_generates`);
- restriction of a fundamental class is the fundamental class of the restricted layer
  (`fundamentalClass_restrict`);
- corestriction preserves invariants (`inv_cor`) and carries the fundamental class to
  `[E:F] · u_{K/F}` (`fundamentalClass_cor`);
- the scaled inflation and the conjugation formulae (`fundamentalClass_infl`,
  `fundamentalClass_conj`).

Tau Ceti also proves, as separate named theorems, the three hypotheses Layer 3 consumes:

- `h1_subgroupLayer` — `H¹` vanishes on the layer of every subgroup;
- `card_H2_subgroupLayer` — that layer's `H²` has `#H` elements;
- `fundamentalClass_restrict_generates` — the restricted fundamental class generates it.

The invariant is data. The fundamental class is derived. A structure with an unrelated chosen
class for every subgroup is not an acceptable substitute. This roadmap re-exports Tau Ceti's
structure as `ClassFormation`, so that Tau Ceti's Layer 3 and 4 declarations are its methods, and
restates none of it.

**Exit criterion,** met by Tau Ceti at the pin. The hypotheses of Tate's theorem are available
*individually* for the restriction of the fundamental class to every subgroup of `U/V`.

### Layer 3: Tate's theorem for a class formation

*Prerequisites:* Layers 0, 1, 2 (Tau Ceti's). **Implemented in Tau Ceti**, in
`Formation/Tate/Theorem.lean`, `Naturality.lean`, `Conjugation.lean` and `Inflation.lean`, and
consumed here; this roadmap restates none of it. Tau Ceti provides:

- the generic theorem `tateTheorem` on Tau Ceti's layers, with its three hypotheses as separate
  explicit arguments (§2.4), proved from the cup-product criterion, and the identification of its
  underlying homomorphism with `cupClass` (`tateTheorem_toAddMonoidHom`);
- `ClassFormation.tateIso (r : ℤ) : Ĥ^r(U/V,ℤ) ≃ Ĥ^{r+2}(U/V,A^V)`, that theorem applied to the
  fundamental class and to `h1_subgroupLayer`, `card_H2_subgroupLayer` and
  `fundamentalClass_restrict_generates`, with `tateIso_toAddMonoidHom` against
  `ClassFormation.cupFundamentalClass`;
- compatibility with restriction (`tateIso_res`), corestriction (`tateIso_cor`), a tower of ground
  fields (`tateIso_res_trans`), conjugation (`tateIso_conj`) and inflation (`tateIso_infl`).

The scaled inflation formula matters: the fundamental class of a smaller layer inflates to a
degree multiple of the fundamental class of the larger layer. No statement downstream may claim
unscaled commutativity in positive degrees, and the restriction, corestriction and inflation
squares do not all have the same shape.

**Exit criterion,** met by Tau Ceti at the pin. There is one named, cup-product-defined family of
isomorphisms in all integer degrees, obtained from a generic theorem whose hypotheses are visible
in its type.

### Layer 4: the abstract Artin map

*Prerequisites:* Layer 3 (Tau Ceti's). **Implemented in Tau Ceti**, in `Formation/ArtinMap.lean`,
`Character.lean`, `TrivialLayer.lean` and `NormLimitation.lean`, and consumed here. With the
low-degree identifications `NormalLayer.tateHMinusTwoEquivAbelianization` and
`NormalLayer.tateHZeroEquivNormQuotient`, Tau Ceti defines

```text
nakayamaNegTwo : (U/V)^ab ≃ A^U / N(A^V),
artinEquiv     : A^U / N(A^V) ≃ (U/V)^ab := nakayamaNegTwo.symm,
artinMap       : A^U → (U/V)^ab,
```

as `ClassFormation` methods with bodies, and proves:

1. `ker artinMap = N(A^V)` (`ker_artinMap`) and the elementwise `artinMap_eq_zero_iff`;
2. `artinMap` is surjective (`surjective_artinMap`), and the Artin symbol of `a` generates exactly
   when the class of `a` generates the norm quotient (`isGenerator_artinMap_iff`);
3. the four Artin–Tate diagrams: inclusion of ground levels corresponds to group-theoretic
   transfer, the norm to inclusion of Galois groups, conjugation to conjugation, and passage to
   a quotient extension to the quotient map on Galois groups (`artinMap_groundInclusion`,
   `artinMap_groundNorm`, `artinMap_conj`, `artinMap_quotient`);
4. the character formula `inv(class(a) ∪ δχ) = χ(artinMap a)` for every character
   `χ : (U/V)^ab → ℚ/ℤ` (`character_artinMap`), where `class(a)` is
   `NormalLayer.zeroTateClass` and the cup is `NormalLayer.artinCharacterCup`, the Tate cup
   product with the connecting class `NormalLayer.characterConnectingClass`;
5. uniqueness: any homomorphism satisfying the character formula is `artinMap`
   (`eq_artinMap_of_character`);
6. the trivial layer: the Artin map of `U/U` is zero (`artinMap_trivialLayer`);
7. **the norm limitation theorem** `ClassFormation.normSubgroup_maximalAbelianLayer`: a layer and
   its maximal abelian sublayer have the same norm subgroup, the two ground levels being
   identified by `LayerRefinement.groundEquiv`, which moves no element. The inclusion `≤` is
   functoriality of the norm along `V ≤ V·[G,G]‾`; the reverse follows because `artinEquiv`
   identifies both norm quotients with `(G/V)^ab = G/(V·[G,G]‾)`, so the two subgroups have the
   same finite index. It is a consequence of reciprocity and never of existence.

The character formula is the second protection against accidentally using the inverse map or the
opposite fundamental class. Norm limitation is what forces Layers 8 and 12 to state existence with
an abelian layer: without it `∃ V, N(V) = N` would have two witnesses for every nonabelian `V`.

The one target of this layer is the abstract quadratic test: in a layer of degree `2`, the Artin
symbol of `a` is the nonzero element of `(U/V)^ab` exactly when `a` is not a norm. It follows from
`ker_artinMap`, because `(U/V)^ab` then has order `2`; Tau Ceti's
`localArtinMap_quadratic_eq_nontrivial_iff_not_norm` (Layer 6) is its local instance.

**Checks.**

- In a layer of degree `2`, `σ ≠ 0` has exactly one value, so the test says that `artinMap a`
  is nonzero exactly off the norm subgroup; an Artin map with the wrong kernel (the zero map, or
  one killing everything) fails it on any non-norm.
- In a layer of degree `4` with Galois group the Klein four group, the analogous statement with a
  single fixed `σ ≠ 0` is false, because a non-norm can have any of three nonzero symbols; the
  degree hypothesis is load-bearing.
- In the trivial layer the degree is `1`, the hypothesis `L.degree = 2` fails, and
  `artinMap_trivialLayer` gives the zero map, consistent with every element being a norm.

**Exit criterion,** met by Tau Ceti at the pin. Downstream files refer to the Artin map without
choosing an arbitrary isomorphism or reopening a sign convention, and
`normSubgroup_maximalAbelianLayer` is available to the two existence layers.

### Layer 5: local coefficients, the Brauer group, the local invariant, and duality

*Prerequisites:* Layer 0; `ProfiniteCohomology`; `LocalFieldsRamification`. **Not** Layers 1–4,
and in particular not the local class formation, the local Artin map, or local existence.
**Implemented in Tau Ceti**, in `TauCeti/NumberTheory/ClassFieldTheory/` (`MuNRep`, `Brauer/`,
`FiniteCohomology/`, `Local/Symbol`, `Local/HilbertPairing`, `Local/Duality/` and
`Local/EulerCharacteristic/`), and consumed here under Tau Ceti's names; this roadmap restates none
of it. The contract:

- **Coefficients.** `GalRep n F` is `ProfiniteCohomology.TopRep (ZMod n) G_F`, and its cohomology
  is Mathlib's `continuousCohomology`. The coefficient objects are Tau Ceti's discrete modules read
  through `ofDiscreteModule`, with `G_F` acting through `absoluteGaloisGroupRestrictEquiv`:
  `muNRep n F` is `KummerCoeff F n` and `unitsRep F` is `UnitsCoeff F`. Kummer classes are Tau
  Ceti's `kummerMap`; the Kummer isomorphism `Fˣ/(Fˣ)ⁿ ≃ H¹(G_F, μ_n)` is `kummerEquiv` for `n`
  invertible in `F` and `kummerEquivOfCharZero` in characteristic zero, for every `n ≠ 0`,
  including `n` divisible by the residue characteristic.
- **The Galois dictionary.** `classField F V`, the fixed field in `Fˢ` of an open normal subgroup
  `V` of `G_F`, and `classField_le_classField_iff`, the order-reversing half of the Galois
  correspondence; Layers 8 and 12 read their class fields through them.
- **The Brauer group and the invariant.** `Br F = H²(G_F, (Fˢ)ˣ)` (`Br`, on `unitsRep F`) and
  `invMap : Br F → ℚ/ℤ`, normalized by arithmetic Frobenius: for an unramified character `χ` the
  class `a ∪ δχ` has invariant `v(a) · χ(Frob)`. Restriction multiplies invariants by the degree
  and corestriction preserves them (`invMap_brRes`, `invMap_brCor`). The `H²` of the units of a
  finite Galois layer has order dividing its degree (`TauCeti.natCard_H2_units_dvd_finrank`),
  proved without reciprocity, and `H²(F, μ_n) ≃ ZMod n` for every `n ≠ 0` in mixed characteristic
  (`h2MuEquivZMod_mixed`).
- **The Hilbert pairing.** `localSymbol` is the Kummer cup product followed by `invMap`, read at the
  named coefficient pairing `kummerCupPairing ζ`, `(x, y) ↦ log_ζ(x) · y`, of a primitive `n`-th
  root of unity `ζ ∈ F`: bilinear (`localSymbol_kummerClass_mul`), Steinberg
  (`localSymbol_kummerClass_eq_zero_of_add_eq_one`), antisymmetric (`localSymbol_antisymm`), zero
  exactly on norms from the Kummer extension (`localSymbol_eq_zero_iff_mem_normGroup`), and
  nondegenerate (`forall_localSymbol_kummerClass_eq_zero_iff`). ⚠ Two Kummer classes cup into
  `μ_n ⊗ μ_n`, not `μ_n`; every statement about the symbol is for the named pairing, since one
  quantified over an arbitrary pairing admits the zero pairing, under which every symbol is
  trivial. At exponent two the root is `-1` and the pairing is canonical.
- **Tate duality.** `tateDual A = Hom(A, μ_n)` with the conjugation action (Tau Ceti's
  `InternalHom`), the cup-product pairing `tateDualityPairing` built from evaluation, finiteness of
  `H⁰`, `H¹`, `H²` of a finite smooth discrete module (`finite_H`), and perfectness
  `tateDualityPairing_perfect_mixed` for that named pairing; through
  `muNRepToTateDual ζ` the `(1, 1)` pairing at `A = μ_n` is the Hilbert pairing
  (`tateDualityPairing_muNRepToTateDual`).
- **The Euler characteristic.** For `F` a finite extension of `ℚ_p` (`[FinitePadicExtension F p]`)
  and a finite smooth discrete `A : GalRep n F`, `n ≠ 0`,
  `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}` (`eulerCharacteristic_mixed`), with the `𝔽_p`-rank form
  `eulerCharacteristic_finrank_fp`; both come from `localEulerCharacteristic_eq_localCardNorm`,
  `χ_F(A) = ‖#A‖_F`.

⚠ Every duality and Euler-characteristic statement carries `[DiscreteTopology A.V]` and Tau Ceti's
smoothness instance `[Fact (IsSmoothDiscrete (ZMod n) A)]`, every point stabilizer open. Neither
follows from the other: `GalRep n F` is Mathlib's `TopRep`, whose operators are continuous one
group element at a time, and a finite module with the indiscrete topology would have the abstract
cohomology of `G_F` instead of its continuous cohomology.

**Checks.**

- `ℚ₇` contains `μ₃`. For its unramified cubic extension and the character `χ` with
  `χ(Frob) = 1/3` on arithmetic Frobenius, the class `7 ∪ δχ` has invariant `1/3`; the geometric
  normalization gives `2/3`. This fixes the coordinate in which `localSymbol` is read at `n = 3`.
- Over `ℚ₂`, the trivial module `𝔽₂ = μ₂` has `#H⁰ = 2`, `#H¹ = #ℚ₂ˣ/(ℚ₂ˣ)² = 8`, `#H² = 2`,
  and `8 = 2 · 2 · 2^{1·1}`; the trivial `𝔽₃` has `#H⁰ = 3`, `#H² = #μ₃(ℚ₂) = 1` and `#H¹ = 3`,
  and `3 = 3 · 1 · 2⁰`; the zero module gives `1 = 1 · 1 · 2⁰`, its cardinality being `1`.
- Over `ℚ₂`, a general finite module need not be filtered by trivial ones: the nontrivial
  unramified action on `ℤ/3` has `#H⁰ = 1`, while its Tate dual, on which the action is trivial,
  has `#H⁰ = 3`.

**Exit criterion,** met by Tau Ceti at the pin. `Br K`, `invMap`, `localSymbol`,
`tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_mixed` and
`eulerCharacteristic_finrank_fp` exist, and none of them mentions an Artin map.

### Layer 6: the local class formation and finite local reciprocity

*Prerequisites:* Layers 1–5; `LocalFieldsRamification`. **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/Local/` (`ClassFormation`, `Reciprocity`, `Restriction`,
`Unramified`, `Quadratic`, `CohomologicalDimension`), and consumed here under Tau Ceti's names;
this roadmap restates none of it. The contract:

- **The local class formation.** For a nonarchimedean local field `K`, the formation is Tau
  Ceti's `unitsFormation K`, whose module is the multiplicative group of a separable closure
  written additively (`UnitsCoeff K` through `ofDiscreteModule`, on Tau Ceti's
  `AbsoluteGaloisGroup K`), so that `Br K` of Layer 5 is the continuous `H²` of the same
  coefficients, and its ground level is identified with `Kˣ` by `baseUnitsEquivInvariants`.
  `localClassFormation K` is built *from* the Layer 5 invariant: its invariant on a layer is
  `invMap` after inflation (`localClassFormation_inv_apply`), so Layers 5 and 6 carry one
  normalization. Its proof uses Hilbert 90, `invMap`, the cyclic norm index and the local `H²`
  bound, and no reciprocity, existence or duality. Restriction to a finite extension `E/K`
  embedded in `Kˢ` is the formation of `E`, with matching invariants
  (`localClassFormation_inv_localFormationLayerEquiv`), which is the input of the norm
  functoriality of Layer 7.
- **Finite local reciprocity.** For a finite Galois `L/K` embedded in `Kˢ`, `localArtinEquiv` is
  the transported abstract Artin equivalence `Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)^ab`, independent of the
  embedding (`localArtinEquiv_eq_of_iota`), with `localArtinMap`, the norm residue isomorphism
  `normResidue` and the norm group `normGroup`. For an unramified extension a uniformizer maps to
  the arithmetic Frobenius exported by `LocalFieldsRamification` (`localArtinMap_uniformizer`),
  units map to `1` (`localArtinMap_unit_of_unramified`), and
  `localArtinMap x = Frob^{v(x)}` (`localArtinMap_eq_frobenius_pow_valuation`). The quadratic tests
  of §5.4 are `localArtinMap_quadratic_eq_nontrivial_iff_not_norm` and
  `localArtinMap_quadratic_eq_hilbertSymbol`, the latter at the named pairing
  `kummerCupPairing (-1)`.
- **Cohomological dimension.** `H³(G_K, (Kˢ)ˣ) = 0` (`subsingleton_h3_unitsRep`), and, for a
  nonarchimedean local field of characteristic zero and every prime `ℓ`,
  `cd_ℓ G_K = 2` (`cohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, NSW (7.1.8)(i)) and
  `scd_ℓ G_K = 2` (`strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, NSW (7.2.5)), both
  with the instance argument `[CharZero K]`, which a finite extension of `ℚ_p` supplies through
  its injective `ℚ_p`-algebra map (`charZero_of_injective_algebraMap`). In characteristic `p`,
  `cd_p G_K = 1`.

**Checks.**

- At `K = ℚ₂` and `ℓ = 2` or `3`, `cd_ℓ G_K = scd_ℓ G_K = 2`; at `K = 𝔽₂((t))`, `cd₂ G_K = 1`, so
  the characteristic-zero hypothesis is load-bearing.
- For the unramified quadratic extension of `ℚ₃`, the unit `4` is a norm and its Artin symbol is
  `1`, while `3` maps to the Frobenius of order `2`.

**Exit criterion,** met by Tau Ceti at the pin. The finite local map is visibly the abstract Artin
map, a uniformizer maps to arithmetic Frobenius, and the kernel is the norm group.

### Layer 7: the absolute local Artin map, its normalizations, and conductors

*Prerequisites:* Layers 5, 6; `LocalFieldsRamification` (the upper-numbering filtration
`upperRamificationGroup`, its compatibility with quotients, Hasse–Arf, and the discriminant
exponent `discriminantExponent`). The absolute Artin map, its normalizations and the conductors
are **implemented in Tau Ceti**, in `TauCeti/NumberTheory/ClassFieldTheory/Local/` (`ArtinMap`,
`Unramified`, `Cyclotomic`, `ExplicitCyclotomicSymbol/`, `GeometricArtinMap`, `Conductor/`), and
consumed here under Tau Ceti's names. The contract:

- **The absolute Artin map** `artinMap : Kˣ → G_K^ab` into the topological abelianization of
  Mathlib's `Field.absoluteGaloisGroup K`, the inverse limit of the finite maps
  (`artinMap_restrict`), natural in the field (`artinMap_congr`), with dense image
  (`denseRange_artinMap`), not surjective (`not_surjective_artinMap`), kernel the intersection of
  the norm groups (`ker_artinMap_eq_iInf`), and continuous for finite extensions of `ℚ_p`
  (`continuous_artinMap`). Its unramified coordinate is the normalized valuation
  (`unramifiedCoordinate_artinMap`): lifts of `Art_K(π)` are arithmetic Frobenius lifts
  (`isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`) and lifts of `Art_K(u)`, `u` a unit, lie in
  inertia (`mem_inertiaSubgroup_of_mk_eq_artinMap`). Norm functoriality is `artinMap_norm`, along
  Tau Ceti's `absoluteGaloisGroupExtend`. `geometricArtinMap` is the precomposition with inversion.
- **The cyclotomic normalization** `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`, with the field norm:
  `localCyclotomicCharacter_artinMap_padic`, `localCyclotomicCharacter_artinMap_unit`,
  `localCyclotomicCharacter_artinMap_uniformizer` and
  `abelianizedLocalCyclotomicCharacter_artinMap_norm`,
  proved by comparison with the explicit local symbols of the cyclotomic fields over `ℚ`, whose
  product formula `prod_cyclotomicSymbol` is a direct computation; so it uses no reciprocity law
  and no Lubin–Tate theory, and Layer 10 may consume it.
- **Conductors** defined by norms: `conductorExponent K L`, the least `n` with
  `U(K,n) ⊆ N_{L/K}(Lˣ)`, the conductor `conductorIdeal`, and the conductor exponent
  `characterConductorExp K χ` of a continuous character `χ : Kˣ → ℂˣ`, attained because `ℂˣ` has
  no small subgroups. For a finite abelian `M/K`, `U(K,v) ⊆ N_{M/K}(Mˣ)` exactly when `G^v = 1`
  (`unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`), in every characteristic,
  and the conductor exponent of the fixed field of `ker χ` is the Artin conductor of `χ`
  (`conductorExponent_fixedField_ker`).

The **open targets** of this layer compare class-field conductors with ramification in every
characteristic, for a finite abelian Galois extension `L/K` of nonarchimedean local fields:

- **The upper-numbering theorem** `normResidue_map_unitFiltration`: for every `n : ℕ` the
  reciprocity map `Kˣ → Kˣ/N_{L/K}(Lˣ) ≃ Gal(L/K)^ab` carries `U(K,n)` onto the image of
  `G(L/K)^n`; at `n = 0` it carries `𝒪[K]ˣ` onto inertia (Neukirch, *Algebraic Number Theory*, V
  Theorem 6.2; Serre, *Local Fields*, XV §2). Route: for every subgroup `H` of `G = Gal(L/K)`,
  `Art(U(K,n)) ≤ H` exactly when `U(K,n)` consists of norms from the fixed field of `H`
  (`artinMap_quotient` and the kernel of reciprocity), exactly when `(G/H)^n = 1`
  (`unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` for that field), exactly when
  `G^n ≤ H`, the upper numbering being compatible with quotients; taking `H` to be each of the two
  subgroups gives equality. The proof uses neither Lubin–Tate nor Artin–Schreier–Witt theory.
- **The local conductor–discriminant formula**
  `discriminantExponent_eq_finsum_galoisCharacterConductorExp`: `δ(L/K)` is the sum over the
  characters `ψ : Gal(L/K) → ℂˣ` of `galoisCharacterConductorExp K L ψ`, the least `n` with
  `U(K,n)` in the kernel of `ψ` read on `Kˣ` through `normResidue`. This is a character of the
  finite Galois group, which Tau Ceti's `characterConductorExp` (a continuous character of `Kˣ`)
  does not take. Route: by the upper-numbering theorem `galoisCharacterConductorExp K L ψ` is the
  Artin conductor of `ψ`, and
  `LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent` sums the Artin
  conductors to `δ(L/K) = f · d` (Serre, *Local Fields*, IV §1 and VI §2).
- **The conductor is the largest character conductor**
  `conductorExponent_eq_iSup_galoisCharacterConductorExp`: `U(K,n) ≤ N_{L/K}(Lˣ)` exactly when
  every character kills `Art(U(K,n))`, because the characters of a finite abelian group separate
  its points.

`discriminantExponent` is `δ(L/K) = v_K(𝔡_{L/K}) = f(L/K) · d(L/K)`, the exponent of an ideal of
the base and not the different exponent of `L`.

**Checks.**

- `L = K`: `δ = 0`, the only character is trivial with conductor exponent `0`, and
  `conductorExponent K K = 0`; a formula summing over nontrivial characters only, or counting the
  trivial character with exponent `1`, gets `0 = 1` wrong here.
- `ℚ_2(i)/ℚ_2`: the norm group is `2^ℤ × (1 + 4ℤ_2)`, so the nontrivial character has conductor
  exponent `2`; the discriminant of `ℤ_2[i]` is `−4`, so `δ = 2 = 0 + 2`. The lower filtration is
  `G_0 = G_1 = G`, `G_2 = 1`, so `G^1 = G` and `G^2 = 1`, and indeed `U(ℚ_2,1)` maps onto `G`
  (`−1` is not a sum of two squares in `ℚ_2`) while `U(ℚ_2,2)` maps to `1`.
- `ℚ_2(ζ₁₂)/ℚ_2`, with `e = f = 2` and group `ℤ/2 × ℤ/2`: the different exponent is `d = 2`
  (that of `ℚ_2(i)`, base-changed by the unramified `ℚ_2(ζ₃)`), so `δ = f · d = 4`; the
  characters with fixed fields `ℚ_2`, `ℚ_2(ζ₃)`, `ℚ_2(i)` and `ℚ_2(√3)` have conductor exponents
  `0, 0, 2, 2`, summing to `4`. Putting the different exponent `d = 2` of `L` on the left, the
  confusion this Check guards against, fails here.
- `ℚ_2(√2)/ℚ_2`: the units in the norm group are those `≡ ±1 mod 8`, so the conductor exponent
  is `3`, and `δ = 3` (the value of the different exponent recorded by `LocalFieldsRamification`,
  with `f = 1`); a shifted numbering `G^{n-1}` for `U(K,n)` would give conductor `2` and break
  the formula.
- `ℚ_p(μ_p)/ℚ_p`, `p` odd: `G = (ℤ/p)ˣ` is totally and tamely ramified, `G^0 = G`, `G^1 = 1`, the
  `p − 2` nontrivial characters have conductor exponent `1`, and `δ = p − 2`, the exponent of
  `disc ℤ_p[ζ_p] = ±p^{p−2}`; the maximum is `1 = conductorExponent`, while the sum is `p − 2`, so
  sum and maximum differ from `p = 5` on.
- An unramified `L/K` of degree `f > 1`: every character kills `𝒪[K]ˣ`, so all exponents are `0`
  and `δ = 0`, while `f · d = f · 0`; the inertia degree enters only through `δ = f · d`.
- Equal characteristic, `K = 𝔽₂((t))` and `L` given by `y² − y = t⁻¹`: degree `2`, norm index `2`,
  lower and upper break `1`, so `U(K,1)` maps onto `G = C₂` and `U(K,2)` to `1`; the conductor
  exponent is `2` and `δ = 2 = 0 + 2`. The theorems of this layer cover this extension, which no
  prime-to-`p` existence statement reaches.

**Exit criterion.** `normResidue_map_unitFiltration`,
`discriminantExponent_eq_finsum_galoisCharacterConductorExp` and
`conductorExponent_eq_iSup_galoisCharacterConductorExp` are proved for every nonarchimedean local
field, and `LocalGaloisGroups` consumes the local material of Layers 4–7 by its Tau Ceti names.

### Layer 8: separate arithmetic local existence and the local class-field correspondence

*Prerequisites:* Layers 4, 5, 6, 7. In particular norm limitation (Layer 4), the Kummer theory of
Layer 5 (`kummerClass`, `kummerEquivOfCharZero`, `h2MuEquivZMod_mixed`), the local duality of
Layer 5 and the Galois dictionary `classField` of Layer 5 are prerequisites of this layer, not
consequences of it. **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/`, and consumed here under Tau Ceti's names;
the statements below are the contract. The characteristic-zero statements carry the instance
argument `[CharZero K]`, which every finite extension of `ℚ_p` satisfies, and local existence
needs no openness hypothesis, an open subgroup of finite index being exactly a subgroup of finite
index containing a power subgroup.

The endpoint of the layer is a **correspondence**, not an existence statement. `∃ V, N(V) = N` on
its own names nothing: by the norm limitation theorem of Layer 4 a layer and its maximal abelian
sublayer have the same norm subgroup, so a nonabelian `V` and `maximalAbelianLayer V` are two
witnesses to the same existence statement. Every final target below therefore either constrains `V`
to be an abelian layer or is explicitly labelled a forgetful corollary.

After reciprocity is established, develop the topology of norm subgroups and prove:

- the norm subgroup `localNormSubgroup V ≤ Kˣ` of an open normal subgroup of `G_K` is open
  (`isOpen_localNormSubgroup`) and of finite index (`finiteIndex_localNormSubgroup`);
- it is monotone in `V` (`localNormSubgroup_mono`) — hence inclusion-reversing on fields — and
  respects composita and intersections; `localNormSubgroup_top` pins the extreme case
  `V = ⊤ ↦ K ↦ Kˣ`, which is what fixes the direction of the correspondence;
- the concrete forms of norm limitation, `localNormSubgroup_maximalAbelianLayer`;
- in characteristic zero, every finite-index subgroup of `Kˣ` is the norm subgroup of a finite
  **abelian** layer (`localAbelianExistence`), with `localExistence` retained only as the
  corollary that forgets abelianity;
- for a general nonarchimedean local field of residue characteristic `p`, every finite-index
  subgroup of `Kˣ` whose index is prime to `p` is the norm subgroup of a finite abelian layer
  (`localAbelianExistence_primeToResidueCharacteristic`), again with a forgetful corollary
  (`localExistence_primeToResidueCharacteristic`); the `p`-primary equal-characteristic case is
  FunctionFieldArithmetic §4.2;
- **uniqueness**: distinct finite abelian extensions have distinct norm subgroups
  (`localClassField_unique`). This is the half that turns existence into *the* class field
  attached to `N`, and it is false without the abelianity hypotheses;
- **the class field** `localClassField N`, defined from existence and canonical by uniqueness,
  with its characterizing equation `localClassField_normSubgroup`;
- **the correspondence** at its two local scopes: `localClassFieldCorrespondence`, the full
  correspondence in characteristic zero, and
  `localClassFieldCorrespondencePrimeToResidueCharacteristic`, whose two carriers
  `LocalNormSubgroupsPrimeTo` and `AbelianLayerPrimeTo` are cut down by the prime-to-`p` condition
  so that the excluded equal-characteristic `p`-primary case cannot be read off it. Each scope
  carries both order statements, on subgroups (`localClassField_le_iff`,
  `localClassFieldPrimeToResidueCharacteristic_le_iff`) and on fields
  (`localClassField_orderReversing`, `localClassFieldPrimeToResidueCharacteristic_orderReversing`);
- **the quotient isomorphism and the degree**: `localAbelianGaloisEquiv` is an isomorphism
  `Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)` onto the Galois group of the layer itself, not onto an
  abelianization, and `localAbelianGaloisEquiv_artinMap` says it is the abstract Artin map of the
  layer read through `abelianizationGalEquiv`. `index_localNormSubgroup` and
  `localClassField_index` are the equality `[Kˣ : N] = [L : K]`;
- in characteristic zero, injectivity of the absolute `artinMap` (`injective_artinMap`), which
  follows from `localAbelianExistence`; the kernel description `ker_artinMap_eq_iInf` — the kernel
  is the intersection of all norm subgroups — holds for every local field. ⚠ Injectivity is **not**
  asserted in equal characteristic: every prime-to-`p` norm subgroup contains the pro-`p` principal
  units, so the intersection of the norm subgroups this roadmap constructs there is not trivial,
  and the missing extensions are the Artin–Schreier–Witt ones of FunctionFieldArithmetic §4.2;
- the compatibility of the Layer 7 conductors with existence: the norm subgroup attached to an
  abelian extension of conductor exponent `n` contains `U(K,n)` and no smaller step of the unit
  filtration. Whenever the existence scope above supplies the class field of
  `N = U(K,n)·⟨π⟩`, its conductor is the least `m` with `U(K,m) ≤ N`, hence is at most
  `n`; equality requires that no smaller unit step lie in `N`. At a repeated shallow step this
  can be strict: for `K = ℚ₂`, `U(K,0) = U(K,1)`, so `U(K,1)·⟨2⟩ = Kˣ` has trivial
  class field and conductor zero.

The construction order is normative: norm subgroups first define the normic topology and its
completion; norm limitation precedes `localAbelianExistence_primeToResidueCharacteristic`; the
Layer 5 Kummer theory then gives `localAbelianExistence` in characteristic zero, after which
uniqueness, the correspondence and injectivity follow. Local class field theory here is routed
through the class formation and Kummer theory, never through Lubin–Tate theory, which §1 places
outside this roadmap. Full equal-characteristic `p`-primary existence requires Artin–Schreier–Witt
theory and is FunctionFieldArithmetic §4.2, which assembles the statements over every local field.

There is deliberately no abstract existence theorem for `ClassFormation`. This layer verifies its
arithmetic and topological inputs in the two stated ranges. Existence must not appear as a
hypothesis in a structure used to prove reciprocity. The two directions of local class field
theory are proved in the correct order.

**Exit criterion,** met by Tau Ceti at the pin. `localClassFieldCorrespondence` and
`localClassFieldCorrespondencePrimeToResidueCharacteristic` are proved — which subsumes
`localAbelianExistence`, `localClassField_unique` and both order statements — and `artinMap` is
injective in characteristic zero.

### Layer 9: the local Weil group

*Prerequisites:* Layers 5–8; `LocalFieldsRamification` (`inertia`, `maximalUnramified`, and the
exact sequence `1 → I_K → G_K → Ẑ → 1`). **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/`, and consumed here under Tau Ceti's names;
this roadmap restates none of it. The contract:

- **The carrier.** `localWeilGroup K ≤ G_K`, the preimage of `ℤ ⊆ Ẑ` under
  `G_K → Gal(K^ur/K) ≅ Ẑ`: it contains inertia (`inertiaSubgroup_le_localWeilGroup`), is normal,
  dense in `G_K` (`dense_localWeilGroup`) and proper (`localWeilGroup_ne_top`).
- **The topology.** `WeilGroup K` is a type synonym for that subgroup carrying the **Weil
  topology**, induced by the inclusion into `G_K` together with the discrete degree, in which
  inertia, *with the profinite topology it already has as a closed subgroup of `G_K`*, is open:
  `inertiaToWeil` is an open embedding (`isOpenEmbedding_inertiaToWeil`), and this characterizes
  the topology (`weilTopology_unique`). ⚠ Requiring only that inertia be open does not determine
  the topology: one could refine the topology on `I_K` and translate it across the cosets. ⚠ It is
  not the subspace topology from `G_K`, in which inertia is not open, its image in `Ẑ` being a
  non-open point. The inclusion `weilToAbsolute` is continuous with dense image.
- **The exact sequence with inertia.** `weilDegree : W_K → ℤ` is surjective
  (`surjective_weilDegree`) with kernel inertia (`ker_weilDegree`), and it agrees with the
  unramified coordinate (`unramifiedCoordinate_weilDegree`), which fixes the arithmetic
  normalization.
- **Functoriality along finite separable extensions.** For a finite extension `L/K` with a chosen
  `K`-embedding `ι : L →ₐ[K] Kˢ` into the separable closure, `weilTransfer K L ι : W_L → W_K` is a
  continuous injection whose image is the part of `W_K` lying in `G_L`, open of index `[L:K]`
  (`index_range_weilTransfer`); the degree is multiplied by the residue degree along it,
  `deg_K = f(L/K) · deg_L` (`weilDegree_weilTransfer`). For `L/K` also normal, `weilRestrict K L ι`
  is surjective onto `Gal(L/K)` with kernel the image of `weilTransfer`
  (`range_weilTransfer_eq_ker_weilRestrict`). ⚠ The embedding into `Kˢ` is a hypothesis with
  content: a purely inseparable extension has none, and for it the index statement is false.
- **Reciprocity**, in characteristic zero. `localWeilArtinEquiv : Kˣ ≃ₜ* W_K^ab` onto the
  **topological** abelianization `W_K / closure ⁅W_K, W_K⁆` (Mathlib's
  `TopologicalAbelianization`), with the instance argument `[CharZero K]`; it is the Artin map
  lifted along the injection `W_K^ab → G_K^ab` (`localWeilArtinEquiv_apply`, `weilArtinMap`), and
  the class in `G_K^ab` of a Weil element representing `localWeilArtinEquiv K x` is `Art_K(x)`
  (`localWeilArtinEquiv_compat`). The image of `artinMap` is the image of the Weil group
  (`mem_range_artinMap_iff`). Injectivity of `artinMap`, hence local existence (Layer 8), is the
  input; in equal characteristic `p` the map `weilArtinMap` is still a continuous open surjection,
  and its injectivity needs the `p`-primary extensions of FunctionFieldArithmetic §4.2.

**Checks.**

- `K = 𝔽₂((t))`, `L = 𝔽₂((s))` with `t = s²`: `[L:K] = 2` and `f = 1`, and restriction identifies
  `G_L` with `G_K` and `W_L` with `W_K`, so the image has index `1`, not `2`. No `K`-embedding of
  `L` into `Kˢ` exists, so `weilTransfer` does not apply: the separability carried by `ι` is what
  makes the index `[L:K]`.
- For the unramified quadratic extension, `deg_K = 2 · deg_L` along `weilTransfer` and the index
  is `2`; for the separable totally ramified `ℚ₂(i)/ℚ₂`, `deg_K = deg_L` and the index is again
  `2`. The residue degree, not the field degree, scales the degree map.
- For `K = ℚ_p`, a uniformizer has Weil degree `1` under `localWeilArtinEquiv` and a unit has
  degree `0`.

**Exit criterion,** met by Tau Ceti at the pin. `W_K` has a carrier, a topology, functoriality, an
exact sequence and, in characteristic zero, a reciprocity isomorphism, each with a name.

### Layer 10: global carriers, the Brauer sequence, and the sum of local invariants

*Prerequisites:* Layers 1, 2, 4, 5, 6, 7; `LocalFieldsRamification`; `GlobalNumberFields`;
`ProfiniteCohomology`. Through `brLocalization_injective` the layer needs only Layer 1, from
Layer 5 `Br K`, `invMap` and the local unit computations (the Herbrand quotients of the local
units and of `Lˣ`, `herbrandQuotient_units_eq_finrank`, and the cyclic norm index
`index_normGroup_of_isCyclic`), and from Layer 6 Tau Ceti's `unitsFormation`: the carriers, the
archimedean Brauer computation, the Herbrand quotients, both fundamental inequalities and
`H¹`-vanishing. None of it waits for Layer 5's Tate dual, local duality or Euler characteristic.
The archimedean Artin maps add Layers 2, 4 and 7 (`realCyclotomicSymbol`,
`absoluteGaloisGroupExtend`), and the sum formula and everything after it add Layers 2, 4, 6 and 7.
**Not** the global class formation and **not** the global Artin map: Layer 11 builds both out of
this layer's output. **Implemented in Tau Ceti**, in `TauCeti/NumberTheory/ClassFieldTheory/Global/`
and `Brauer/Archimedean/`, and consumed here under Tau Ceti's names; the text below is the contract.

The idele and idele-class carriers are those of `GlobalNumberFields`, assembled into the idele
formation `ideleFormation` and the idele-class formation `globalFormation` for a fixed separable
closure, as Tau Ceti formations. The formation of the multiplicative groups `Lˣ` themselves is Tau
Ceti's `unitsFormation` of Layer 6.

Build the archimedean half of the local package here, since the global sum needs it: the complex
Brauer group vanishes, the real Brauer group is cyclic of order two, and the nontrivial real class
has invariant `1/2` (`infiniteInvMap`, `infiniteInvMap_eq_zero_of_isComplex`,
`range_infiniteInvMap_of_isReal`). ⚠ Real places are not ignorable: dropping them already breaks
the sum formula for `ℚ(i)/ℚ`.

The archimedean Artin maps are built here too, before `sumLocalInv_brLocalization_eq_zero` uses
them; Layer 11
only consumes them. They come from the formation machinery of Layers 1–4 and the archimedean
Brauer computation, with no reciprocity law:

- `infiniteClassFormation K w`, the field formation of `K_w` as a class formation (Hilbert 90 and
  `infiniteInvMap`), whose invariant on a layer over `K_w` is `infiniteInvMap` after inflation
  (`infiniteClassFormation_inv`);
- `infiniteArtinAt K w : K_wˣ → G_{K_w}^ab`, which on every layer `V ◁ ⊤` is the abstract Artin
  map of that class formation (`infiniteArtinAt_layer`), so Layer 4's `character_artinMap` gives
  the archimedean character formula `χ(Art_w x) = inv_w(x ∪ δχ)` as a closed proof
  (`character_infiniteArtinAt`); on `ℂ/ℝ` this is Tau Ceti's `realInv_realClass`, the cyclic
  class of `x` at complex conjugation having invariant `0` or `1/2` by the sign of `x`;
- `Art_ℂ` is trivial (`infiniteArtinAt_eq_one_of_isComplex`), and `Art_ℝ` has kernel
  `ℝ_{>0} = N_{ℂ/ℝ}(ℂˣ)` and sends a negative element to complex conjugation
  (`infiniteArtinAt_eq_one_iff_of_isReal`), so it acts on the `m`-th roots of unity through
  `realCyclotomicSymbol m` (`infiniteArtinAt_rootsOfUnity_of_isReal`);
- norm functoriality at the archimedean places, the analogue of `artinMap_norm`
  (`infiniteArtinAt_norm`): elementary, the norm being the identity for `ℝ/ℝ` and `ℂ/ℂ` and
  positive for `ℂ/ℝ`, where both sides are trivial.

Prove that continuous cohomology of the absolute Galois group is the imported finite-quotient
colimit from `ProfiniteCohomology`; do not build a second continuous carrier here. Then prove the
exact sequence

```text
0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0
```

in invariant coordinates: `finiteInvAt` and `infiniteInvAt` are the local invariants,
`brauerSupport` is the finite ramification set, `sumLocalInv` is the middle map,
`brLocalization_injective` is exactness at `Br K` (Albert–Brauer–Hasse–Noether),
`sumLocalInv_brLocalization_eq_zero` is exactness in the middle, and `exists_br_of_sum_eq_zero` is
exactness on the right.

The hard arithmetic input is separated from the abstract formalism. The classical route is to
establish the first and second fundamental inequalities for cyclic layers and deduce the required
`H¹`-vanishing and the order of `H²`. The required inputs, each a named target, are:

- the Herbrand quotient of the relevant `S`-idele and `S`-unit modules;
- the first fundamental inequality, `finrank_le_index_range_ideleClassNormMap` (Milne VII §4);
- the second fundamental inequality, reduced to cyclic extensions of prime degree by the usual
  Sylow and tower arguments, in its `H²` form `natCard_H2_globalFormation_dvd_degree` (Milne VII,
  Theorem 5.1);
- `H¹`-vanishing for idele classes, `subsingleton_h1_globalFormation`, from which inflation on
  `H²` of idele classes is injective and inflation–restriction in degree two is exact.

`sumLocalInv_brLocalization_eq_zero` is proved as Milne VII Theorem 8.1(b), from the local symbols
alone. For `a ∈ ℚˣ` and `ℚ(μ_m)/ℚ` the local Artin symbols are Layer 7's explicit ones
(`localCyclotomicCharacter_artinMap_padic` and `localCyclotomicCharacter_artinMap_uniformizer` on
the `ℓ`-power roots of unity at `ℓ`, `localArtinMap_cyclotomic_uniformizer` on the others,
`infiniteArtinAt_rootsOfUnity_of_isReal` at `∞`), so their product is `1` by
`prod_cyclotomicSymbol` (Example 8.2). `artinMap_norm` and `infiniteArtinAt_norm` carry this
product formula to the cyclotomic extensions of every number field (Lemma 8.4). For a cyclic layer,
the character formula at each place (Layer 4's `character_artinMap` for the local class formations,
`character_infiniteArtinAt` at the archimedean places) turns it into the vanishing of the sum of
local invariants on `H²(Gal(L/K), Lˣ)` (Lemma 8.5). Every class of
`Br K` lies in `H²` of a cyclic cyclotomic layer, by `brLocalization_injective` and the local
degrees of cyclotomic extensions (Proposition 7.2, Lemma 7.3), which gives the general case
(Lemma 8.6).

Then define the layer invariant. On an idele layer, `H²(Gal(L/K), I_L)` is the direct sum of the
local Brauer groups, and `ideleSumLocalInv` is the sum of `ideleLocalInvAt` and
`ideleInfiniteInvAt` over the places, finitely supported by `ideleSupport` and inflation-invariant
(`ideleSumLocalInv_infl`). Because `sumLocalInv_brLocalization_eq_zero` kills the image of
`H²(Gal(L/K), Lˣ)`,
that sum descends along `ideleToClassH2` to the *image* of the idele layer, with
`globalInv_ideleToClassH2` recording the descent equation.

⚠ That image is not the whole of `H²(Gal(L/K), C_L)`. From `1 → Lˣ → I_L → C_L → 1` the
obstruction to lifting a class lies in `H³(Gal(L/K), Lˣ)`: the connecting map is
`classToMultiplicativeH3`, into the third cohomology of `unitsFormation`, and
`range_ideleToClassH2` is the exactness statement. `H¹`-vanishing does not make the obstruction
vanish. For `L = ℚ(√13, √17)` every decomposition group has order at most two — the decomposition
groups at unramified primes are cyclic, `13` splits in `ℚ(√17)` and `17` splits in `ℚ(√13)`, and
the field is totally real — so `H²(Gal(L/ℚ), I_L) = ⨁_v Br(L_w/ℚ_v)` is killed by `2`, while
`H²(Gal(L/ℚ), C_L)` is cyclic of order `4`. In general the image has order `lcm_v [L_w : K_v]`.
The lift exists for every class precisely when `lcm_v [L_w : K_v] = [L:K]`.
Cyclicity is sufficient, as recorded by `surjective_ideleToClassH2_of_isCyclic`, because
`H³(Gal(L/K), Lˣ) ≃ H¹(Gal(L/K), Lˣ) = 0`. The criterion can also hold for a noncyclic
extension and does not require a single decomposition group of full order.

The invariant is therefore defined on every class by refinement, in three named steps:

- **the cyclotomic input**, `exists_refinement_ideleSumLocalInv_eq`: some refinement of every
  layer carries an idele-layer class of invariant `1/[L:K]`, obtained by adjoining a cyclic
  cyclotomic extension with a local degree divisible by `[L:K]` (Milne VII, Lemma 7.3);
- **killing the obstruction**, `exists_refinement_mem_range_ideleToClassH2`: after inflation to
  that refinement every class of `H²(Gal(L/K), C_L)` lifts to the idele layer. The restriction of
  the idele class of invariant `1/[L:K]` to the layer over `L` has invariant `0`, hence vanishes on
  idele classes by `sumLocalInv_brLocalization_eq_zero`, `exists_br_of_sum_eq_zero` and
  `brLocalization_injective`; inflation–restriction then places its image in the inflation of
  `H²(Gal(L/K), C_L)`, where it has order `[L:K]`, and the second inequality makes it a generator;
- **independence**, `ideleSumLocalInv_eq_of_ideleToClassH2_eq`: two lifts to two refinements have
  the same sum of local invariants, by passing to a common refinement
  (`LayerRefinement.exists_commonRefinement`), where they differ by the image of
  `H²(Gal(M/K), Mˣ)`.

`globalInv` is then pinned by the two equations `globalInv_ideleToClassH2` and `globalInv_infl`,
and `globalInv_unique` says that they determine it. Prove `globalInv_injective` and
`range_globalInv` by the same argument (Milne VIII §4, Theorem 4.7): `H²(Gal(L/K), C_L)` is cyclic
of order `[L:K]`, generated by the class of invariant `1/[L:K]`.

Global reciprocity, global existence, Chebotarev, and the classification of norm subgroups are
forbidden inputs to this layer: each is downstream of the abstract Artin map, which is downstream
of the class formation, which is downstream of `globalInv`.

**Exit criterion.** The archimedean Artin maps exist with their character formula, `globalInv`
exists on every layer, is the sum of local invariants of a lift at a refinement by named theorems,
and no declaration of this layer mentions `globalArtinMap`.

### Layer 11: the global class formation and global Artin reciprocity

*Prerequisites:* Layers 1–4, 6, 7, 10; `NumberFieldArithmetic`. **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/Global/` (`ClassFormation`, `Reciprocity`, `LocalArtin/`),
and consumed here under Tau Ceti's names; the text below is the contract.

Package `globalInv` into `globalClassFormation`, and record `globalClassFormation_inv`: the
invariant of the global class formation *is* the sum-of-local-invariants map of Layer 10, not a
second normalization. The local–global compatibility of fundamental classes
(`ideleSumLocalInv_fundamentalClass`) is then a comparison theorem stated after the structure
exists, and may not be used in its construction.

For a finite Galois extension `L/K`, transport the abstract Artin equivalence to

```text
C_K / N_{L/K}(C_L) ≃ Gal(L/K)^ab.
```

The resulting `globalArtinMap` must satisfy:

- compatibility with every local Artin map, through the decomposition group at a place
  (`globalArtinMap_local`, with local factor `localArtinAt`, the completion instance of
  `artinMap`, read in `Gal(L/K)^ab` by `decompositionRestrict`, which `decompositionRestrict_mk`
  pins as restriction along a place of `L` above `v`);
- triviality on principal ideles (`globalArtinMap_principal`, the reciprocity law), which holds
  because the global class formation is built on idele classes, its invariant being the
  sum of local invariants of Layer 10 that `sumLocalInv_brLocalization_eq_zero` makes well defined;
- compatibility in towers;
- agreement, at every unramified finite prime, with `NumberFieldArithmetic.artinHomAway`
  (`globalArtinMap_ideal`), identified by its prime values and the supplier's uniqueness theorem;
- arithmetic Frobenius normalization (`globalArtinMap_isArithFrobAt`).

Adapt `[IsAbelianGalois K L]` to the explicit commutativity hypothesis of
`NumberFieldArithmetic.artinHomAway` through the single adapter
`algEquiv_commute_of_isAbelianGalois`. At the archimedean places it consumes Layer 10's
`infiniteArtinAt` and its laws; it does not build a second archimedean Artin map.

There is one ideal-theoretic Artin map in the portfolio. The class-field-theory map is compared to
it by a theorem, not duplicated.

**Exit criterion.** The global map is the transported abstract Artin map and its value on an
unramified prime is the existing Frobenius class.

### Layer 12: separate arithmetic global existence, the norm index, and the global correspondence

*Prerequisites:* Layers 4, 10, 11; `GlobalNumberFields` (moduli and ray classes). Every target of
this layer is for a **number field**; global class field theory for function fields is outside
this roadmap (§1). **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/GlobalExistence/` and `Global/AdmissibleModulus/`, and
consumed here under Tau Ceti's names; the text below is the contract.

After global reciprocity is established, develop the topology of idele-class norm subgroups —
they are open, of finite index, distinct for distinct finite abelian extensions, and monotone in
the layer subgroup, hence inclusion-reversing on fields — and prove:

- `isOpen_globalNormSubgroup`, `finiteIndex_globalNormSubgroup`, `globalNormSubgroup_mono`, the
  concrete norm limitation `globalNormSubgroup_maximalAbelianLayer`, and the direction test
  `globalNormSubgroup_top`;
- every open finite-index subgroup of `C_K` is the norm subgroup of a finite **abelian** layer of
  the global formation (`globalAbelianExistence`), with `globalExistence` retained only as the
  corollary that forgets abelianity;
- **uniqueness**, `globalClassField_unique`, and hence the class field `globalClassField N` with
  its characterizing equation `globalClassField_normSubgroup`;
- **the global class-field correspondence** `globalClassFieldCorrespondence`, together with both
  order statements, `globalClassField_le_iff` on subgroups and `globalClassField_orderReversing`
  on fields;
- **the quotient isomorphism and the degree**: `globalAbelianGaloisEquiv` is an isomorphism
  `C_K / N_{L/K}(C_L) ≃ Gal(L/K)` onto the Galois group itself, characterized as the abstract
  Artin map by `globalAbelianGaloisEquiv_artinMap`; `index_globalNormSubgroup` and
  `globalClassField_index` give `[C_K : N] = [L:K]`, and `galClassFieldEquiv` transports the
  layer's Galois group to `Gal(classField V / K)`;
- the norm-index theorem `[C_K : N C_L] = [L:K]` for finite abelian `L/K` in the concrete
  extension carrier (`card_ideleClassNormQuotient`);
- **admissible moduli and ray-class reciprocity.** `IsAdmissibleModulus K L 𝔪` says that the ray
  subgroup of `𝔪` lies in the idele-class norm subgroup of `L/K`, i.e. that the conductor divides
  `𝔪`; `abelianConductor` is the smallest admissible modulus and
  `isAdmissibleModulus_iff_abelianConductor_dvd` its characterization. The ray-class factorization
  of the global Artin map, `rayClassArtinMap`, takes the admissibility proof as an argument, and its
  splitting law and surjectivity are stated for admissible moduli. ⚠ For `ℚ(i)/ℚ` and the trivial
  modulus the ray class group is trivial while the unramified prime `3` has nontrivial Artin
  symbol, so no such map exists (`not_isAdmissibleModulus_one_Qi`); requiring only that the
  ramified primes divide `𝔪` is not enough either, since `(4)` without the real place has trivial
  ray class group and the conductor is `(4)·∞`;
- **composita and intersections**: `globalNormSubgroup_inf_of_isAbelian` and
  `globalNormSubgroup_sup`, the lattice statements carried by the order isomorphism. ⚠ The meet
  formula needs abelian layers: two `D₄`-extensions with a common biquadratic subfield have a
  compositum whose maximal abelian subextension, of degree `8`, is larger than the compositum of
  their maximal abelian subextensions, of degree `4`, and norm limitation then gives the two sides
  different indices.

As in the local case there is no abstract existence theorem: this layer verifies its own
idele-theoretic inputs, and existence never appears as a hypothesis in a structure used to prove
reciprocity. Nor is `globalAbelianExistence` a single summit-sized target: it is proved by
induction on the index from three named inputs, along Milne VII §9, which is Artin–Tate's route:

- **upward closure**, `exists_abelianLayer_globalNormSubgroup_eq_of_le` (Milne VII, Lemma 9.1): a
  subgroup containing a norm subgroup is the norm subgroup of an abelian layer, by reciprocity;
- **descent along a finite extension**,
  `exists_abelianLayer_globalNormSubgroup_eq_of_comap_ideleClassNorm` (Lemma 9.4): if the preimage
  of `N` under the idele-class norm of `L/K` is a norm subgroup over `L`, then `N` is a norm
  subgroup over `K`, by composing norms and using norm limitation; applied to `K(ζ_p)/K` this is
  the roots-of-unity adjunction;
- **the Kummer case**, `exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem` (Lemma 9.3): for
  `K ∋ ζ_p` every open subgroup containing the `p`-th powers is a norm subgroup. Its inputs are
  the idele subgroup `E_S` attached to a finite set `S` of places and its image in `C_K`, the
  layer cutting out `K(U(S)^{1/p})`, abelian of degree `p^{|S|+r}`, the index of that image
  computed from the local indices `p²/‖p‖_v` and the product formula, and the equality of two
  subgroups of the same index.

The induction (Theorem 9.5) chooses a prime `p` dividing the index, adjoins `ζ_p` by descent,
realizes a subgroup of index `p` containing `N` by the Kummer case as a cyclic layer of degree `p`,
and passes to that layer's field, where the index of the preimage has dropped. The Grunwald–Wang
theorem is not used and is outside this roadmap (§1).

**Exit criterion,** met by Tau Ceti at the pin. `globalClassFieldCorrespondence` is a theorem — an
order isomorphism between the open finite-index subgroups of `C_K` and the abelian layers of `G_K`,
order-reversing when read on fields — together with `globalAbelianGaloisEquiv` and
`globalClassField_index`.

### Layer 13: norm theorems and class fields

*Prerequisites:* Layers 7, 10, 11, 12; `GlobalNumberFields` (orders and `Pic`);
`NumberFieldArithmetic` (`relDiscr` and its localization). The norm theorems,
the class fields and Kronecker–Weber are **implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/Global/HasseNorm/` and `ClassFields/`, and consumed here
under Tau Ceti's names; the principal ideal theorem and the global conductor–discriminant formula
are the open targets of this layer. The contract:

- **The cyclic Hasse norm theorem** `cyclicHasseNorm`: for cyclic `L/K`, `x ∈ Kˣ` is a norm from
  `Lˣ` exactly when its principal idele is an idele norm. Its placewise form
  `isGlobalNorm_iff_isLocalNormEverywhere` is stated with the genuine placewise predicates
  `IsFiniteLocalNorm` and `IsInfiniteLocalNorm` on the local étale algebras `K_v ⊗_K L` and
  `K_w ⊗_K L` (finite places through `v.adicCompletion K`, infinite places through Mathlib's
  `w.Completion`, complex places included), and `IsLocalNormEverywhere`, their conjunction, is
  not an alias for an idelic range predicate. The global half is the vanishing of
  `Ĥ^{-1}(Γ, C_L)`, from the Herbrand quotient of the idele classes; the cyclic hypothesis is
  essential: for `ℚ(√13,√17)/ℚ`, `25` is a local norm everywhere but not a global norm.
- **The class fields.** Each is an **application** of the Layer 12 correspondence: it names its own
  norm subgroup and is the class field of `globalClassField` at that subgroup. The ray subgroup of
  a modulus is open and of finite index (`isOpen_raySubgroup`, `finiteIndex_raySubgroup`) and gives
  `rayNormSubgroup`; `rayClassField 𝔪` is its class field, `hilbertClassField` is `rayClassField`
  at `Modulus.one` and `narrowHilbertClassField` at `narrowModulus`. The ray class field of `𝔪` is
  the largest abelian extension of conductor dividing `𝔪`
  (`isAdmissibleModulus_iff_le_rayClassField`), the Galois groups are the ray and class groups
  (`gal_rayClassField_equiv_rayClassGroup`,
  `hilbertClassArtinEquiv`, `gal_hilbertClassField_equiv_classGroup`), and the Hilbert class field
  is unramified at every prime and every infinite place and is the largest such abelian extension
  (`isUnramifiedAt_hilbertClassField`, `fieldRange_le_hilbertClassField_iff`).
- **Kronecker–Weber** `kroneckerWeber`, with the least cyclotomic level equal to the norm of the
  finite part of `abelianConductor` (`isLeast_absNorm_abelianConductor_finitePart`), never
  `≡ 2 mod 4`, and the compatibility of conductors with ramification
  (`IsAdmissibleModulus.mem_support_of_ramified`).

**The principal ideal theorem** `isPrincipal_map_hilbertClassField`, an open target: every ideal
of `𝓞 K` becomes principal in the ring of integers of `hilbertClassField K` (Artin–Tate,
Chapter XIII; Neukirch, *Algebraic Number Theory*, VI §7). Tau Ceti's
`ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` is its class-formation
form, from Furtwängler's theorem that the transfer of a finite group into its commutator subgroup
is trivial; the target reads it on ideals, applying it to the idele-class formation with `E` the
Hilbert class field of `K` and the top field the Hilbert class field of `E`, and comparing idele
classes with ideal classes through `hilbertClassArtinEquiv`. Checks: at `K = ℚ` the Hilbert class
field is `ℚ` and the ideal `(2)` is already principal. At `K = ℚ(√−5)`, of class number `2` with
Hilbert class field `K(i)`, the ideal `𝔭 = (2, 1 + √−5)` is not principal in `𝓞 K`, but
`𝔭² = (2) = ((1 + i)²)`, so its extension to `K(i)` is generated by `1 + i`.

**The global conductor–discriminant formula**, an open target, in both of its halves (Milne,
*Class Field Theory*, V Theorem 3.27, with Remark 3.28 identifying the conductor of a character `ψ`
with that of the fixed field `L^{ker ψ}`):

- `count_relDiscr_eq_finsum_abelianConductor_exponent`: for `L/K` finite abelian and a finite
  place `v`, the multiplicity of `v` in Tau Ceti's `relDiscr (𝓞 K) (𝓞 L)` is the sum
  over the characters `ψ : Gal(L/K) → ℂˣ` of the `v`-exponents of
  `abelianConductor K (L^{ker ψ})`, so the discriminant is the **product** of the finite parts of
  the character conductors;
- `abelianConductor_eq_lcm`: the `v`-exponent of `abelianConductor K L` is the **maximum** of
  those exponents and a real place divides it exactly when it divides one of them, so the
  conductor is their **lcm**.

The route is local. `relDiscr` localizes (`NumberFieldArithmetic`, Layer 4.2), and at `v` its
exponent is `g_v · δ(L_w/K_v)` with `g_v` the number of places above `v`; the `v`-exponent of the
conductor of `L^{ker ψ}` is the conductor exponent of the restriction of `ψ` to the decomposition
group, read through `localArtinAt`; each character of the decomposition group extends to exactly
`g_v` characters of `Gal(L/K)`; and the local formula and the local maximum of Layer 7 finish.

**Checks.**

- `ℚ(i)/ℚ`: `relDiscr = (4)`, of multiplicity `2` at `2`; the characters are the trivial one
  (fixed field `ℚ`, conductor `(1)`) and the injective one (conductor `(4)·∞`), so the sum at `2`
  is `0 + 2 = 2` and the maximum is `2`, with the real place in the conductor.
- `ℚ(ζ₈)/ℚ`: the three quadratic subfields `ℚ(i)`, `ℚ(√2)`, `ℚ(√−2)` have conductors `(4)·∞`,
  `(8)` and `(8)·∞`; the sum at `2` is `0 + 2 + 3 + 3 = 8`, the exponent of `disc ℚ(ζ₈) = 2^8`,
  while the maximum `3` gives the conductor `(8)·∞`. Reading the lcm as a product, or the product
  as an lcm, fails here.
- `ℚ(ζ_p)/ℚ`, `p` odd: the `p − 2` nontrivial characters have conductor `(p)` or `(p)·∞`, the sum
  at `p` is `p − 2`, the exponent of `disc ℚ(ζ_p) = ±p^{p−2}` (Milne, *Class Field Theory*, V
  Example 3.30), and the maximum is `1`.


For an order `O` of a number field `K` — **any** order, in any degree, with `O` and `Pic O` the
`NumberFieldOrder` and invertible Picard group of `GlobalNumberFields` — the arithmetic input is
the idelic ring-class quotient `ringClassIdeleQuotient O : C_K → Pic O`, built from the congruence
description of `Pic O` as a quotient of the ray class group of the conductor of `O`
(`NumberFieldOrder.rayClassToPic`), which holds for every order (Kopp–Lagarias, Theorems 1.1–1.3).
Raw proper ideals, including noninvertible ideals in `IdealClassMonoid O`, never enter. Its kernel
is `ringClassNormSubgroup O`, and `ringClassField O` is the class field of that subgroup, so the
ring class field, like the Hilbert and ray class fields, is an application of the Layer 12
correspondence. **Implemented in Tau Ceti**, in `ClassFields/RingClass/`: the isomorphism
`ringClassArtinEquiv O : Pic O ≃* Gal(ringClassField O / K)`, which is the global Artin map on
idele classes; the ideal form `ringClassArtinMap` with `ringClassArtinMap_eq_one_iff`; the
ramification bound `isUnramifiedAt_ringClassField` at the primes prime to the conductor; the
splitting law `isArithFrobAt_ringClassArtinEquiv_picClass`; and the maximal-order comparison
`ker_ringClassIdeleQuotient_maximalNumberFieldOrder`. In a quadratic field, where every order is
`ℤ + f𝒪_K`, the norm group is the classical one, cut out by ideals with a generator congruent to a
rational integer modulo `f` (`mem_ker_ringClassIdeleQuotient_iff_of_finrank_eq_two`). That
description is a quadratic specialization and is never a hypothesis: in a cubic field `ℤ + f𝒪_K`
has index `f²`, so an order of index `f` is not of that form, and its ring class field is still the
class field of the kernel of `C_K → Pic O`.

**Checks** (ring class fields).

- `O = ℤ + 2ℤ[i]` in `ℚ(i)`: discriminant `−16`, `Pic O` trivial (the unit-index correction
  `#(𝒪_K/2𝒪_K)ˣ / (#(ℤ/2)ˣ · [𝒪_Kˣ : Oˣ]) = 2/(1·2) = 1`), so the ring class field is `ℚ(i)`.
- `K = ℚ(ζ₇ + ζ₇⁻¹)`, `O = 𝒪_K`: degree `3`, discriminant `49`, Minkowski bound
  `(3!/3³)·√49 = 14/9 < 2`, so `Pic O = 1` and `ringClassField O = K`; a quadratic hypothesis in
  the type would exclude this endpoint.

**Exit criterion.** `isPrincipal_map_hilbertClassField`,
`count_relDiscr_eq_finsum_abelianConductor_exponent` and `abelianConductor_eq_lcm` are proved.
Tau Ceti's `cyclicHasseNorm`, `rayClassField`, `hilbertClassField`, `narrowHilbertClassField`,
`ringClassField` for every order and `kroneckerWeber` are stated against the imported carriers,
and every class field among them is a value of `classField` at a value of `globalClassField`.

### Layer 14: Hilbert reciprocity and quadratic reciprocity

*Prerequisites:* Layers 5, 10, 11, 13. **Implemented in Tau Ceti**, in
`TauCeti/NumberTheory/ClassFieldTheory/Global/Hilbert/` and `Global/QuadraticReciprocity`, and
consumed here under Tau Ceti's names.

Each finite local Hilbert invariant `finiteHilbertInvariantAt` is `localSymbol` at the completion,
at the named pairing `kummerCupPairing (-1)`, and each infinite one `infiniteHilbertInvariantAt`
comes from the archimedean package of Layer 10; both are supported on the finite set
`finiteHilbertSupport`
at the finite places. Hilbert reciprocity is `hilbertProductFormula`, in additive cohomological
form: the sum of the local `ZMod 2` invariants is zero, which is the Layer 10 sum formula
`sumLocalInv_brLocalization_eq_zero` applied to the Brauer class of the quaternion symbol, not an
independent computation. The multiplicative form is `∏_v (a,b)_v = 1`. `QuadraticFormInvariants`
proves that its norm-equation and quaternion symbols agree with these invariants and inherits the
product formula.

Quadratic reciprocity for `ℚ` is Mathlib's `legendreSym.quadratic_reciprocity`, and is not a
target. Its derivation from `hilbertProductFormula`, with the real and dyadic factors, is the
worked example of §5.7: for distinct odd primes `p`, `q`, the vanishing of the Hilbert sum of
`(p, q)` is equivalent to the reciprocity law
(`sum_finiteHilbertInvariantAt_add_sum_infiniteHilbertInvariantAt_eq_zero_iff`), and the
supplementary laws are the cases `(−1, p)` and `(2, p)`. Higher power reciprocity laws
(Artin–Tate XII) are outside this roadmap (§1).

**Checks.**

- Over `ℚ`, `a = b = −1`: the quaternion algebra ramifies exactly at `2` and `∞`, so the two
  nonzero invariants sum to `1/2 + 1/2 = 0`, and dropping the real place breaks the formula.
- `p = 3`, `q = 7`: `(7/3) = 1` and `(3/7) = −1`, with product `−1 = (−1)^{1·3}`.

**Exit criterion,** met by Tau Ceti at the pin. `hilbertProductFormula` is proved from the sum
formula of Layer 10.

---

## 5. Required regression tests and worked examples

These are acceptance tests, not optional exposition. They pin the direction and normalization of
the Artin map in cases where the answer is elementary. They are intended to catch three errors which are easy to hide in
an abstract development:

1. using an arbitrary equivalence instead of cup product with the fundamental class;
2. using the cup-product direction `Γ^ab → A^U/N(A^V)` as the Artin map instead of its inverse;
3. normalizing the Artin map by geometric rather than arithmetic Frobenius;
4. reversing the class-field correspondence, i.e. attaching the maximal abelian extension to `Kˣ`
   rather than to the trivial subgroup.

The first versions may be proved for finite-level maps. They should not wait for the
inverse-limit absolute Artin map.

### 5.1 Trivial layer

For the layer `U/U`, the norm quotient, `(U/U)^ab`, and the Artin map are all trivial
(`ClassFormation.artinMap_trivialLayer`). This should reduce to the unique map between trivial
groups, not to a cardinality argument.

The trivial layer is also the direction test for the correspondence: `localNormSubgroup_top` and
`globalNormSubgroup_top` say that the layer `V = ⊤`, which cuts out the ground field itself, has
norm subgroup the whole of `Kˣ` resp. `C_K`. This is the extreme case of the fourth error above,
and it is the reason the subgroup form of the correspondence (`localClassField_le_iff`,
`globalClassField_le_iff`) preserves inclusions while the field form
(`localClassField_orderReversing`, `globalClassField_orderReversing`) reverses them.

### 5.2 Kernel, quotient, and cyclic layers

For every finite normal layer Tau Ceti proves the elementwise formulae
`artinMap a = artinEquiv (class a)` (`ClassFormation.artinMap_apply`, by `rfl`) and
`artinMap a = 0 ↔ a ∈ N(A^V)` (`artinMap_eq_zero_iff`). For a cyclic layer, `Nat.card (A^U/N(A^V)) = [U:V]` (Tau Ceti's `ClassFormation.natCard_normQuotient`),
and the Artin symbol of `a` generates `Γ` exactly when the class of `a` generates the norm quotient
(`isGenerator_artinMap_iff`). The character formula `character_artinMap` is the most sensitive
abstract test of the sign convention; Tau Ceti proves it from the definition of `artinEquiv`, not
as a second normalization.

### 5.3 Unramified local extensions

Let `L/K` be unramified of degree `n`, let `π` be a uniformizer of `K`, and let `q` be the size of
the residue field. Prove:

```text
Kˣ / N(Lˣ) ≃ ℤ/nℤ, class(π) ↦ 1
localArtinMap(π) = Frob_arith              (localArtinMap_uniformizer)
localArtinMap(u) = 1 for every unit u      (localArtinMap_unit_of_unramified)
localArtinMap(x) = Frob_arith^{v(x)}        (localArtinMap_eq_frobenius_pow_valuation)
Frob_arith(x̄) = x̄^q.
```

The proof of `localArtinMap_uniformizer` must use the arithmetic Frobenius object exported by
`LocalFieldsRamification`; a new automorphism with the right residue-field action must not be
introduced. For `K = ℚ_p` this is the principal sign test for local reciprocity. The concrete
example `ℚ₂(ζ₅)/ℚ₂` is unramified of degree four, and `localArtinMap(2)(ζ₅) = ζ₅²`
(`localArtinMap_Q2_zeta5`); replacing arithmetic by geometric Frobenius changes the exponent from
`2` to `3` modulo `5`. For `m` invertible in `𝒪_K` (equivalently prime to the residue
characteristic), the general local cyclotomic form is `localArtinMap(π)(ζ_m) = ζ_m^q`
(`localArtinMap_cyclotomic_uniformizer`).

At `ℚ_p`, verify further that the unramified coordinate of `Art(p)` is the generator `zHat.gen`
and that of a unit is trivial (`isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`,
`mem_inertiaSubgroup_of_mk_eq_artinMap`), and that `χ_cyc(Art(u)) = u⁻¹`
(`localCyclotomicCharacter_artinMap_padic`, Layer 7); at `p = 2`, test `u = -1, -3` and the
uniformizer (`localCyclotomicCharacter_artinMap_uniformizer`) separately.

### 5.4 Quadratic extensions

Let `L/K` be quadratic and let `τ` be its nontrivial automorphism. Prove

```text
localArtinMap(a) = 1    iff a is a norm from L,
localArtinMap(a) = τ    iff a is not a norm from L
```

(`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`), the smallest nontrivial test of the
norm-kernel theorem, and the Hilbert-symbol comparison
`localArtinMap(a) = τ iff (a,d)_K = -1` (`localArtinMap_quadratic_eq_hilbertSymbol`).

⚠ The Hilbert-symbol comparison must be stated about the extension `K(√d)` **exactly**, so its
hypotheses are: `d` a nonsquare in `Kˣ`, a chosen `s : L` with `s² = d`, `K(s) = L`, `[L:K] = 2`,
and `τ s = -s` for the nontrivial `τ`. A bare existential `∃ s : L, s² = d` does not pin `L`: it
also holds for `L = K(√d, √e)`, which has degree four and three nontrivial automorphisms, none of
which the symbol `(a,d)_K` determines. With only the existential hypothesis the statement is
false, not merely weak.

⚠ The symbol on the right is `localSymbol` at the named pairing `kummerCupPairing (-1)`, `-1` being
the primitive square root of unity. A version quantified over an arbitrary
`P : TopPairing μ₂ μ₂ μ₂` is false: the zero pairing has that type and makes every symbol
trivial.

For a global quadratic field `L/ℚ` of discriminant `D` and a rational prime `ℓ ∤ D`, the Artin
symbol of `(ℓ)` is trivial exactly when `ℓ` splits, i.e. `Kronecker(D,ℓ) = 1`. The special case
`ℚ(i) = ℚ(ζ₄)` is mandatory: `ℓ ≡ 1 mod 4` gives `Art((ℓ)) = 1` and `ℓ ≡ 3 mod 4` gives complex
conjugation, i.e.
`Art((ℓ))(i) = i^ℓ` (`globalArtinMap_Qi_prime`). For `ℚ(√5)`, `ℓ ≡ ±1 mod 5` gives `1` and
`ℓ ≡ ±2 mod 5` gives `τ`. Compute `ℚˣ/N_{ℚ(i)/ℚ}ℚ(i)ˣ` locally
and compare the sign at the real place; for `ℚ(√5)/ℚ`, check the norm index and the cyclic Hasse
norm theorem.

### 5.5 Cyclotomic fields

Let `m ≥ 1` and let `ℓ` be a prime not dividing `m`. Under the standard identification
`Gal(ℚ(ζ_m)/ℚ) ≃ (ℤ/mℤ)ˣ`, prove `Art((ℓ))(ζ_m) = ζ_m^ℓ` (`globalArtinMap_cyclotomic_prime`);
equivalently `Art((ℓ))` corresponds to `ℓ mod m`. This is a direct test that the roadmap uses
arithmetic rather than geometric Frobenius: a quadratic example alone cannot distinguish an
automorphism from its inverse. The proof should factor through `globalArtinMap_ideal`,
`NumberFieldArithmetic.artinHomAway_apply_prime` and `IsArithFrobAt`, and the action of arithmetic
Frobenius on roots of unity; it must not define a second cyclotomic Artin map.

Small numerical checks: for `ℚ(ζ₅)/ℚ`, `Art((2))(ζ₅) = ζ₅²` of order four
(`globalArtinMap_zeta5_two`), `Art((3))(ζ₅) = ζ₅³`, `Art((11))(ζ₅) = ζ₅`; for `ℚ(ζ₈)/ℚ`,
`Art((3))`, `Art((5))`, `Art((7))` send `ζ₈` to `ζ₈³`, `ζ₈⁵`, `ζ₈⁷`. Verify
`ℚ(i) ⊂ ℚ(ζ₄)`, `ℚ(√2) ⊂ ℚ(ζ₈)`, and `ℚ(√5) ⊂ ℚ(ζ₅)` with the correct conductor.

### 5.6 Compatibility and tower tests

For the quadratic subfield `ℚ(√5)` of `ℚ(ζ₅)`, restriction of the cyclotomic Artin symbol of
`(ℓ)` is trivial exactly when `ℓ` is a square modulo `5`;
this tests the tower restriction square and the arithmetic formulae simultaneously.

For `K ≤ E ≤ L`, compare the three finite Artin maps and prove the norm/transfer squares from
Artin–Tate (`artinMap_groundInclusion`, `artinMap_groundNorm`), both when the Galois group is
cyclic of order four (`ℚ ≤ ℚ(√5) ≤ ℚ(ζ₅)`) and when it is the Klein four group
(`ℚ(√5,√13)/ℚ`, restricted to all three quadratic subfields). These two cases distinguish
inclusion, quotient, and group-theoretic transfer and catch several plausible but false
commutative diagrams. In a cyclic group of order four, transfer to the subgroup of order two is
not interchangeable with the quotient map; the statement must use the actual transfer.

### 5.7 Downstream worked examples

- Exhibit `25` as the standard failure of the Hasse norm principle in `ℚ(√13,√17)/ℚ`.
- Compute the Hilbert and narrow Hilbert class fields in small quadratic examples and test the
  principal ideal theorem.
- Derive quadratic reciprocity from `hilbertProductFormula`, including the real and dyadic
  factors, and compare it with Mathlib's `legendreSym.quadratic_reciprocity` (Layer 14); this is a
  second route to a theorem Mathlib already has, not a new theorem.
- Compare `Gal(H_O/K)` with `GlobalNumberFields.Pic O` through `ringClassArtinEquiv` for the
  nonmaximal order `ℤ + 2ℤ[i]` and for the maximal order of the cubic field `ℚ(ζ₇ + ζ₇⁻¹)`
  (Layer 13); do not reconstruct the order or its ideals locally.

### 5.8 Minimal mandatory suite

The following are mandatory before the roadmap is complete: Tau Ceti's `artinMap_trivialLayer`;
`localNormSubgroup_top`; `localArtinMap_uniformizer` for an arbitrary finite unramified extension;
`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`; `globalArtinMap_Qi_prime`;
`globalArtinMap_cyclotomic_prime` with the explicit `ℚ(ζ₅)` value at `2`; and the rejection test
`not_isAdmissibleModulus_one_Qi`. Together they test triviality, the direction of the class-field
correspondence, the norm kernel, a nontrivial group of order two, arithmetic Frobenius, a
non-involutive Artin symbol, and that ray-class reciprocity is never written at an inadmissible
modulus.

The arithmetic tests should be added only after the following supplier maps have stable names: a
chosen primitive root `ζ_m` and its generation theorem; the standard equivalence between the
cyclotomic Galois group and `(ZMod m)ˣ`; the Frobenius action on `ζ_m`; the quadratic conjugation
automorphism; the Kronecker/Legendre splitting criterion; the prime-idele adapter
`primeIdeleClass` used by `globalArtinMap_ideal`; and restriction of automorphisms to an
intermediate field. If one of these is absent, it is a named prerequisite in the relevant supplier
roadmap; the class-field-theory test must not introduce a private replacement merely to make the
example stateable.

---

## 6. Policy for `Suggested.lean`

`Suggested.lean` is the roadmap's acceptance test. It states the open headline theorems of the
table in §3, each with `sorry`, against the pinned Mathlib and Tau Ceti, and the one definition
with a real body they need, `galoisCharacterConductorExp`, the least unit-filtration level
contained in the kernel of a Galois character read through `normResidue`. Its imports are
`Mathlib` and individual Tau Ceti modules; it imports no roadmap. Its module docstring lists the
headline results Tau Ceti proves at the pin, by layer.

It does not contain:

- a restatement of anything Tau Ceti proves at the pin, including a weaker specialization of it
  (the material listed under "Consumed from Tau Ceti" in §3);
- a definition whose body is `sorry`, or a statement that mentions one;
- an existence statement whose witness is not pinned: the principal ideal theorem is stated on
  Tau Ceti's `hilbertClassField`, not on an existential field.

Every headline of the roadmap is statable at the pins.

---

## 7. Dependency order

The layers form the following acyclic graph; every edge points from a layer to a layer built
later, and a layer's row lists exactly the prerequisites stated at the head of that layer.

| Layer | Consumes |
|---|---|
| 0: generic Tate cohomology, cup product, res/cor, Nakayama–Rim | Mathlib; ProfiniteCohomology |
| 1–4: formations, class formations, Tate's theorem, abstract Artin map | Layer 0; Mathlib open subgroups |
| 5: local coefficients, `Br K`, `invMap`, local symbol, local duality, Euler characteristic | Layer 0; ProfiniteCohomology, LocalFieldsRamification |
| 6: local class formation, finite local reciprocity, `cd_ℓ G_K` | Layers 1–5; LocalFieldsRamification |
| 7: absolute local Artin map, normalizations, conductors | Layers 5, 6; LocalFieldsRamification |
| 8: local existence, the local correspondence | Layers 4 (norm limitation), 5 (Kummer theory), 6, 7 |
| 9: the local Weil group | Layers 5–8; LocalFieldsRamification |
| 10: idele carriers, Brauer sequence, sum of local invariants | Layers 1, 2, 4, 5 (`invMap` at every completion), 6, 7 (cyclotomic normalization); LocalFieldsRamification, GlobalNumberFields, ProfiniteCohomology |
| 11: global class formation, global reciprocity | Layers 1–4, 6, 7 (`localArtinAt`), 10; NumberFieldArithmetic |
| 12: global existence, the global correspondence, norm index | Layers 4 (norm limitation), 10, 11; GlobalNumberFields |
| 13: Hasse norm theorem, class fields, Kronecker–Weber, conductor–discriminant | Layers 7, 10, 11, 12; GlobalNumberFields, NumberFieldArithmetic |
| 14: Hilbert reciprocity | Layers 5, 10, 11, 13 |

Layer 5 feeds both columns: the local column consumes `invMap` on `K` itself, the global column at
every completion, and both consume the Galois dictionary `classField`; Layer 5 itself uses none of
Layers 1–4. Layer 7 proves the cyclotomic normalization of the absolute local Artin map from the
explicit cyclotomic symbols over `ℚ`, and Layer 10 consumes it for the sum of local invariants;
Layer 10 builds the archimedean Artin maps from the class formations of Layers 1–4. The open
targets of Layer 7 need only Layers 5–7 and LocalFieldsRamification; those of Layer 13 need the
local formulas of Layer 7 and the global correspondence of Layer 12.

---

## 8. References and implementation sources

- E. Artin and J. Tate, *Class Field Theory*, AMS Chelsea, 2009: Chapter XIV, §§1–5 (formations,
  field formations and Brauer groups, class formations, the Main Theorem and the reciprocity-law
  isomorphism) and §6, p. 163 (the abstract existence theorem under the additional axioms
  IIIa–IIId); Chapter XIII for the principal ideal theorem; Chapters V–VIII
  for the fundamental inequalities, the global reciprocity law and the existence theorem;
  Chapter XI §5 for conductors; Chapter XII for explicit reciprocity laws; Chapter XV for Weil
  groups.
- J. Tate, *Global class field theory*, in Cassels–Fröhlich, *Algebraic Number Theory*: global
  class formations and cohomological class field theory.
- J.-P. Serre, *Local Fields*, Chapters XI–XIV: local class formations, the character formula
  for the reciprocity map, the local invariant, and normalization conventions; *Galois
  Cohomology* for local duality and Euler characteristics.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed.: finite and
  profinite cohomology, local duality, and global formations; (3.3.4) and (3.3.6) for strict and
  ordinary cohomological dimension, (7.1.8) and (7.2.5) for `cd` and `scd` of a local field,
  (7.2.6) for local duality, and (7.3.1)–(7.3.4) for the Euler characteristic.
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed., I §2 (Theorem 2.8, the Euler
  characteristic, and Lemmas 2.10 and 2.12).
- J.-P. Serre, *Local class field theory*, in Cassels–Fröhlich, *Algebraic Number Theory*: the
  cohomologically trivial open subgroup of local units in every characteristic.
- J. Neukirch, *Algebraic Number Theory*, Ch. VI–VII: local and global class field theory.
- J. S. Milne, *Class Field Theory* (course notes, v4.03): II 3.11 (Tate's theorem); III,
  Lemmas 2.3–2.6 (cohomologically trivial open subgroups of local units, `h(U_L) = 1`, and the
  order of `H²(L/K)`); VII §§4–5 (the fundamental inequalities, Theorem 5.1), Proposition 7.2 and
  Lemma 7.3 (splitting by cyclic
  cyclotomic extensions), Theorem 8.1 (the reciprocity law), Lemmas 9.1–9.4 and Theorem 9.5 (the
  existence theorem through Kummer theory and descent); VIII §4, Theorems 4.2 and 4.7 (the Brauer
  sequence, and `H²` of the idele classes cyclic of order `[L:K]`); V Theorem 3.27 and Remark 3.28
  (the conductor–discriminant formula); the Hasse norm theorem and examples.
- G. S. Kopp and J. C. Lagarias, *Ray class groups and ray class fields for orders of number
  fields*, Ess. Number Th. 4 (2025), arXiv:2212.09177v3, Theorems 1.1–1.3 (pp. 3–4): ray class
  groups and ray class fields of an arbitrary order of an arbitrary number field, the ring class
  field as the smallest of them, and its Artin isomorphism with the class group — the scope of the
  ring class fields of Layer 13.
- D. A. Cox, *Primes of the Form x² + ny²*, §7 (Prop. 7.22, the ring class group of an order
  `ℤ + 𝔣𝒪_K` in a quadratic field as a ray-class quotient) and §9 (Thm. 9.18, `Gal(H_O/K) ≃ Pic O`):
  the quadratic specialization of the ring class fields of Layer 13.
- A. Weil, *Sur la théorie du corps de classes*, J. Math. Soc. Japan 3 (1951); J. Tate,
  *Number theoretic background*, in *Automorphic Forms, Representations and L-functions* (Corvallis),
  Part 2, §1: the local Weil group, its topology, its functoriality and `Kˣ ≃ W_K^ab`.
- J. Tate, *The higher dimensional cohomology groups of class field theory*, Ann. of Math. 56
  (1952); T. Nakayama, *Cohomology of class field theory and tensor product modules I*, Ann. of
  Math. 65 (1957): the two theorems named in §2.4.
- `leanprover-community/mathlib4`, `Mathlib/RepresentationTheory/Homological/TateCohomology`,
  `Mathlib/RepresentationTheory/Homological/ContCohomology` and
  `Mathlib/FieldTheory/Galois/NormalBasis.lean`.
- `kbuzzard/ClassFieldTheory`, especially `ClassFieldTheory/Cohomology/`.
- Richard Hill and Edison Xie's continuous-cohomology and cup-product work, including the FLT
  repository versions.

Implementation should cite exact theorem numbers and exact source commits in file docstrings. The
README records the mathematical contract; a private
provenance ledger is not a substitute for public, checkable source references.
