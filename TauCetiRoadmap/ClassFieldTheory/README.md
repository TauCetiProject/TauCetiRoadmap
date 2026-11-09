# Roadmap: class field theory

**Summary.** This roadmap develops class field theory through an **abstract class formation** in
the sense of Artin–Tate: formations and their finite normal layers, class formations with the
invariant map as data, fundamental classes, Tate's theorem, and the abstract Artin map as the
inverse of cup product with the fundamental class in Tate degrees `-2 → 0`. It then builds the two
arithmetic instances from their invariants: the local class formation from the local Brauer
invariant, with local reciprocity, local duality, the Euler characteristic, local existence and
the local Weil group; and, for number fields, the global class formation from the sum of local
invariants, with global reciprocity, global existence, the norm theorems, the named class fields
and Hilbert reciprocity. Both columns end at a class-field **correspondence**.

All of this is proved in the pinned Tau Ceti, in `TauCeti/NumberTheory/ClassFieldTheory/`, and is
consumed here by name (§3). What remains are the targets listed under *Owned here* (§1): the
principal ideal theorem in its ideal-theoretic form, the conductor–discriminant formula, the
splitting criteria for the Hilbert and ray class fields, the comparison of the ring class field
of the maximal order with the Hilbert class field, the quadratic splitting test for the global
Artin map, the abstract quadratic Artin test, and three local theorems that Tau Ceti proves under
a valuation-compatibility hypothesis which the roadmap does not assume. `Suggested.lean` states
these targets and the names other roadmaps import from this one.

## 1. Scope and ownership

### Owned here

The open targets, each stated in `Suggested.lean`:

1. **The abstract quadratic Artin test** (Layer 4):
   `ClassFormation.artinMap_quadratic_eq_nontrivial_iff_not_norm`. In a layer of degree two the
   Artin symbol of `a` is the nontrivial element of `(U/V)^ab` exactly when `a` is not a norm.
2. **The local Euler characteristic and the cyclotomic normalization for every finite `F/ℚ_p`**
   (Layers 5 and 7): `eulerCharacteristic_mixed`, `eulerCharacteristic_finrank_fp` and
   `cyclotomicCharacter_artinMap`, stated for a nonarchimedean local field `F` with a finite
   `ℚ_p`-algebra structure. Tau Ceti proves each of them when the valuation of `F` extends that
   of `ℚ_p` (`ValuativeExtension ℚ_[p] F`); the targets drop that hypothesis.
3. **The quadratic splitting test for the global Artin map** (Layer 11):
   `globalArtinMap_quadratic_prime`.
4. **Ideal-theoretic consequences of global class field theory** (Layer 13): the principal ideal
   theorem `isPrincipal_map_hilbertClassField`; the conductor–discriminant formula
   `relDiscr_eq_finprod_abelianConductor`; the splitting criteria
   `ncard_primesOver_hilbertClassField_eq_finrank_iff` and
   `ncard_primesOver_rayClassField_eq_finrank_iff`; and `ringClassField_maximal`, which
   identifies the ring class field of the maximal order with the Hilbert class field.

### Already in the library

Everything else in the subject is proved in the pinned Tau Ceti, and the exact declarations are
listed under §3 and in each layer:

- formations, finite normal layers, restriction, corestriction, inflation, conjugation and their
  tower laws; class formations, fundamental classes, Tate's theorem and its Tate–Nakayama
  generalization; the abstract Artin map with its kernel, surjectivity, character formula, the
  four Artin–Tate diagrams and norm limitation (Layers 0–4);
- the local coefficients and Kummer theory, the local Brauer group and its invariant, the local
  `H²` bound, the cohomological Hilbert symbol with bilinearity, the Steinberg relation,
  antisymmetry, the norm criterion and nondegeneracy, the Tate dual, local duality and the Euler
  characteristic for finite extensions of `ℚ_p` (Layer 5);
- the local class formation, finite local reciprocity and its unramified, quadratic and cyclotomic
  normalizations, and `cd_ℓ G_K = scd_ℓ G_K = 2` (Layer 6); the absolute local Artin map, its
  unramified coordinate, norm functoriality, conductors and cyclotomic normalization (Layer 7);
  local existence in both scopes and the local class-field correspondence (Layer 8); the local
  Weil group (Layer 9);
- the archimedean local theory, the Brauer exact sequence and the global invariant (Layer 10);
  the global class formation and global reciprocity with its local, ideal-theoretic and Frobenius
  laws (Layer 11); global existence, the norm index, admissible moduli and the global class-field
  correspondence (Layer 12); the cyclic Hasse norm theorem, the ray, Hilbert, narrow Hilbert and
  ring class fields, and Kronecker–Weber (Layer 13); Hilbert reciprocity and quadratic reciprocity
  (Layer 14).

### Boundaries with neighbouring roadmaps

- `ProfiniteCohomology` owns continuous cohomology of profinite groups, continuous cup products,
  change-of-group maps and the cohomological dimension of a profinite group.
- `LocalFieldsRamification` owns valuations, unit and ramification filtrations, arithmetic
  Frobenius, the maximal unramified extension and inertia, and the tame quotient.
- `GlobalNumberFields` owns places, moduli, ray and narrow class groups, adeles, ideles, orders,
  `Pic` and `NarrowPic`; `NumberFieldArithmetic` owns finite-place Frobenius and the ideal-theoretic
  Artin map.
- `QuadraticFormInvariants` owns the norm-equation and quaternion presentations of the local
  Hilbert symbol and proves that they agree with the cohomological `localSymbol` exported here;
  `GlobalQuadraticForms` owns Hasse–Minkowski. The dependency runs
  `ClassFieldTheory → QuadraticFormInvariants`, never the reverse.

This roadmap therefore defines no modulus, ray-class carrier, idele carrier, order, Picard group,
local quadratic-form invariant or global quadratic form.

### Consumers, and the names they import

`LocalGaloisGroups`, `QuadraticFormInvariants`, `GlobalQuadraticForms` and `IntegralLattices`
import `Suggested.lean` and cite the following names as this roadmap's; `numberFieldOrderToTauCeti`
and `ringClassArtinEquiv` are the two on which their ring-class names rest. Each is an
abbreviation of a Tau Ceti declaration, a definition built from Tau Ceti's, or a theorem closed by
Tau Ceti's theorem, except the three local targets of item 2 above.

| Use | Names |
|---|---|
| cohomological triviality | `TateCohomology.projective_ker_of_isZero_res`, `TateCohomology.primaryComponent_tateCohomology_eq_bot` |
| class formations and Tate's theorem | `ClassFormation`, `tateTheorem`, `ClassFormation.artinMap_conj` |
| coefficient objects and Kummer theory | `GalRep`, `H`, `absoluteGaloisGroupComparison`, `muNRep`, `muNRepCoeffDictionary`, `muNRepCoeffDictionary_continuous`, `muNRepCoeffDictionary_equivariant`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerClass`, `kummerClass_eq_kummerCocycleClass`, `kummerEquiv_mixed`, `kummerEquiv_mixed_mk` |
| degree two, the local symbol and duality | `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing`, `kummerCupPairing_bil`, `localSymbol`, `tateDual`, `tateDualityPairing`, `muNRepToTateDual`, `bijective_muNRepToTateDual`, `tateDualityPairing_muNRepToTateDual`, `finite_H`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp` |
| smoothness instances | `instFactIsSmoothDiscreteMuNRep`, `instFactIsSmoothDiscreteTateDual`, `instFactIsSmoothDiscreteTrivialFp` |
| reciprocity and orientation | `artinMap`, `restrictAbsolute`, `iota_restrictAbsolute_apply`, `artinMap_restrict`, `absoluteGaloisGroupExtend`, `artinMap_norm`, `denseRange_artinMap`, `localArtinMap`, `normResidue`, `unramifiedCoordinate`, `unramifiedCoordinate_artinMap`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic`, `cyclotomicCharacter_artinMap_padic_uniformizer`, `scd_p_absoluteGaloisGroup_eq_two` |
| ideles and norms | `principalIdele`, `ideleNormMap`, `ideleClassNorm`, `card_ideleClassNormQuotient`, `cyclicHasseNorm`, `IsFiniteLocalNorm`, `IsInfiniteLocalNorm`, `IsLocalNormEverywhere`, `isGlobalNorm_iff_isLocalNormEverywhere` |
| ring class fields | `numberFieldOrderToTauCeti`, `ringClassField`, `ringClassArtinMap`, `ringClassArtinEquiv`, `gal_ringClassField_equiv_pic` |
| Hilbert reciprocity | `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, `finiteHilbertSupport`, `hilbertProductFormula` |

`h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` are equivalences, not existence statements: the
second takes the coefficient identification `μ_p ≅ T` as data, and without it the statement is
false, since the zero module has `H² = 0`. `kummerCupPairing ζ` is `(x, y) ↦ log_ζ(x) · y`;
`localSymbol` is the cup product along a pairing followed by an invariant `tr`. The ring class
field takes an order of `GlobalNumberFields`, carried by `numberFieldOrderToTauCeti` to Tau Ceti's
order with the same subring, and is defined for every order in every number field.

### Explicitly outside this roadmap

- global Weil groups and Weil's construction of the Weil group of a class formation (Artin–Tate
  XV); the local Weil group is Layer 9;
- explicit power-reciprocity laws beyond quadratic reciprocity (Artin–Tate XII);
- Lubin–Tate theory and formal groups: local existence is proved from the norm topology, norm
  limitation and Kummer theory;
- Artin–Schreier–Witt theory, hence `p`-primary local existence in equal characteristic `p`;
- the Grunwald–Wang theorem;
- global class field theory for function fields over finite fields: every global target carries
  `NumberField K`;
- Hasse–Minkowski and the classification of global quadratic forms; pro-`p` group theory and the
  Demushkin structure of local Galois groups.

## 2. Conventions

### 2.1 Formations

Tau Ceti's `TauCeti.ClassFieldTheory.Formation G` is a smooth discrete `TopRep ℤ G` on a profinite
group `G`. For an open subgroup `U` the level is `A^U` (`Formation.level`). A finite normal layer
(`NormalLayer`) is a pair of open subgroups `V ≤ U` with `V` normal in `U`; its Galois group is the
finite group `Γ = U / V` (`NormalLayer.Gal`), its coefficient module is `A^V` with the induced
action (`NormalLayer.rep`), and its ground level is `(A^V)^Γ = A^U`
(`NormalLayer.groundLevelEquiv`).

The abstract theory is additive; multiplicative groups such as `Kˣ` and idele class groups enter
through `Additive`. Mathlib's `tateCohomology` requires the finite group and the coefficient ring
`ℤ` to live in one universe, so the whole development is at universe `0` (`G : Type`, `K : Type`).

### 2.2 Class formations

For every finite normal layer, with `Γ = U / V` and `C = A^V`, a class formation supplies the data
and axioms that are the fields of Tau Ceti's `TauCeti.ClassFieldTheory.ClassFormation`
(`subsingleton_h1`, `inv`, `inv_injective`, `range_inv`, `inv_restrict`, `inv_infl`, `inv_conj`),
with `ℚ/ℤ` the rational circle `AddCircle (1 : ℚ)`:

1. `H¹(Γ, C) = 0`;
2. an injective invariant `inv : H²(Γ, C) → ℚ/ℤ`;
3. whose image is the subgroup of order `[U : V]`;
4. replacing the ground by an intermediate open subgroup multiplies the invariant by the relative
   degree, `inv_E(res_{F,E} x) = [E : F] · inv_F(x)`;
5. inflating to a refinement of the layer does not change the invariant;
6. conjugation carries the invariant of a layer to that of the conjugate layer.

The axioms stop at Tate's theorem and reciprocity and do not imply an existence theorem. Local and
global existence are separate arithmetic theorems (Layers 8 and 12); in Artin–Tate's organization
their inputs are the additional axioms IIIa–IIId.

### 2.3 Fundamental classes

For a layer of degree `n`, `H²(Γ, C)` is cyclic of order `n`, and its fundamental class
`u_{U,V}` is the unique class of invariant `1/n`
(`TauCeti.ClassFieldTheory.ClassFormation.fundamentalClass`). It is derived from the invariant,
never chosen. Restriction to an intermediate ground preserves it, `res(u_{U,V}) = u_{U',V}`;
corestriction scales it by the relative degree, `cor(u_{U',V}) = [U : U'] · u_{U,V}`, while
preserving invariants; inflation to a refinement scales it, `inf(u_{U,V}) = [V : V'] · u_{U,V'}`.
⚠ The index in the corestriction formula is `[U : U']`, the relative field degree `[E : F]`, not
`[U' : U]`: corestriction preserves invariants, and `inv(u_{U',V}) = 1/[U' : V] = [U : U']/[U : V]`.

### 2.4 Tate's theorem and its Tate–Nakayama generalization

Let `Γ` be finite, `C` a `Γ`-module and `u ∈ H²(Γ, C)`. If for every subgroup `H` of `Γ` one has
`H¹(H, C) = 0`, `H²(H, C)` cyclic of order `#H` and `res_H(u)` a generator of `H²(H, C)`, then
for every integer `r` cup product with `u` is an isomorphism `Ĥʳ(Γ, ℤ) ≃ Ĥʳ⁺²(Γ, C)` (Milne,
*Class Field Theory*, II Theorem 3.11; Tate, Ann. of Math. 56 (1952)). The three hypotheses are
separate arguments of `tateTheorem`, never a bundled class formation, so that a layer satisfying
only some of them can still use the theorem. Nakayama's generalization (Ann. of Math. 65 (1957);
Milne, II Remark 3.12) replaces `ℤ` by a module `M` with `Tor₁(M, C) = 0` and gives
`Ĥʳ(Γ, M) ≃ Ĥʳ⁺²(Γ, M ⊗ C)`; this is the Tate–Nakayama theorem. The explicit map `Ĥ⁻² → Ĥ⁰` is
Artin–Tate's Nakayama map, `nakayamaNegTwo`.

The isomorphism is not an arbitrary equivalence of two groups: its underlying homomorphism is cup
product with the named class (`tateTheorem_toAddMonoidHom`), and for a class formation with the
fundamental class (`ClassFormation.tateIso_toAddMonoidHom`).

### 2.5 The direction of reciprocity

At `r = -2` the canonical identifications `Ĥ⁻²(Γ, ℤ) ≃ Γ^ab` and `Ĥ⁰(Γ, C) ≃ A^U / N_{U/V}(A^V)`
turn Tate's theorem into the Nakayama map `nakayamaNegTwo : Γ^ab ≃ A^U / N(A^V)`. The Artin
equivalence is its inverse, `artinEquiv : A^U / N(A^V) ≃ Γ^ab`, and the Artin map `A^U → Γ^ab`
is the quotient map followed by `artinEquiv`, so its kernel is the norm subgroup. In Tau Ceti,
`artinEquiv` is defined as `nakayamaNegTwo.symm`, and `artinMap_apply` unfolds the Artin map. The
character formula `χ(Art(a)) = inv(class(a) ∪ δχ)` is an independent check of the sign.

### 2.6 Frobenius convention

All local and global Artin maps use **arithmetic Frobenius**:

- for an unramified extension of nonarchimedean local fields, a uniformizer maps to the
  automorphism inducing `x ↦ x^q` on the residue field, and the unramified coordinate of every
  lift of its Artin symbol is the generator of `Ẑ`;
- for `K/ℚ_p` finite and a unit `u`, `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`; omitting the field norm
  is ill-typed away from `ℚ_p`;
- for a number-field extension and an unramified prime `𝔭`, the Artin symbol is the arithmetic
  Frobenius at `𝔭`; for `ℚ(ζ_m)/ℚ` and a prime `ℓ ∤ m` it sends `ζ_m` to `ζ_m^ℓ`.

Geometric Frobenius would invert every one of these formulae; the checks of §5.3 and §5.5 detect
it. Tau Ceti's `TauCeti.ClassFieldTheory.geometricArtinMap` is the composite of the arithmetic map
with inversion.

### 2.7 Further conventions

- The local invariant sends the fundamental class of a degree-`n` extension to `1/n`.
  Restriction multiplies invariants by the degree; corestriction preserves them.
- An invariant map is data, constructed before the class formation that carries it: Tau Ceti's
  `invMap` before `localClassFormation`, and the global invariant `globalInv` before
  `globalClassFormation`. Neither is a theorem proved after the structure.
- The local Weil group carries the **Weil topology**, in which inertia with its profinite topology
  is an open subgroup, not the subspace topology from `G_K`; its reciprocity isomorphism is with
  the **topological** abelianization `W_K / closure ⁅W_K, W_K⁆`.
- **Every class field lives inside the separable closure**, as an
  `IntermediateField K (SeparableClosure K)`, and is the fixed field of the open normal subgroup
  the correspondence produces (Tau Ceti's `TauCeti.ClassFieldTheory.classField`).
- **A norm subgroup determines an abelian layer and only an abelian layer.** By norm limitation a
  layer and its maximal abelian sublayer have the same norm subgroup, so both existence theorems
  return an abelian layer and are paired with uniqueness. The correspondence preserves inclusions
  on open normal subgroups of `G_K` and reverses them on the fields they cut out; both statements
  are named.
- Inflation is used only in positive Tate degrees; degree zero is a quotient by the norm and has
  no naive inflation.
- A modulus's infinite part consists of real places; moduli, ray subgroups and ray class groups
  are those of `GlobalNumberFields`.
- The absolute Galois group of a formation is Tau Ceti's separable-closure group
  `TauCeti.AbsoluteGaloisGroup`; the absolute local Artin map lands in the topological
  abelianization of Mathlib's `Field.absoluteGaloisGroup`, and the two groups are compared by
  `absoluteGaloisGroupComparison`, Tau Ceti's `TauCeti.absoluteGaloisGroupRestrictEquiv`.
- `Ẑ` is Tau Ceti's `TauCeti.zHat`.

## 3. Exact supplier contracts

### From Mathlib

Tate cohomology `tateCohomology` (`Mathlib/RepresentationTheory/Homological/TateCohomology`);
continuous representations `TopRep` and continuous cohomology `continuousCohomology`
(`Mathlib/RepresentationTheory/Homological/ContCohomology`); profinite groups, open subgroups and
abelianization, with the topological abelianization `Field.absoluteGaloisGroupAbelianization`;
the normal basis theorem `IsGalois.normalBasis`; number fields, adeles and ideles
(`NumberField.AdeleRing`, `NumberField.IdeleGroup`, `NumberField.IdeleClassGroup`,
`NumberField.IdeleGroup.unitEmbedding`), completions `HeightOneSpectrum.adicCompletion` and
`InfinitePlace.Completion`; cyclotomic fields and `cyclotomicCharacter`; and the class group
`ClassGroup`.

### From Tau Ceti

Each row lists Tau Ceti declarations that the layer named consumes or records as done. Unless a
name carries another prefix, it is in the namespace `TauCeti.ClassFieldTheory`, and a name after
`ClassFormation:` is in `TauCeti.ClassFieldTheory.ClassFormation`.

| Layer | Tau Ceti declarations |
|---|---|
| 0 | `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup` (Tate's criterion), `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective` (Tate–Nakayama), `TauCeti.TateCohomology.isZero_of_forall_isPGroup`, `Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res`, `Rep.projective_ker_of_isZero_res`, `Rep.isZero_res_of_exact`, `Submodule.free_of_isPrincipalIdealRing`, `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`, `TauCeti.TateCohomology.herbrandQuotient`, `TauCeti.TateCohomology.herbrandQuotient_eq_mul_of_shortExact`, `TauCeti.TateCohomology.herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel`, `Rep.FiniteCyclicGroup.periodicIso` |
| 1 | `Formation`, `Formation.level`, `NormalLayer`, `NormalLayer.Gal`, `NormalLayer.rep`, `NormalLayer.groundLevelEquiv`, `NormalLayer.subgroupLayer`, `NormalLayer.subgroupRestriction`, `NormalLayer.ofOpenNormal`, `NormalLayer.tateHMinusTwoEquivAbelianization`, `NormalLayer.tateHZeroEquivNormQuotient`, `NormalLayer.normSubgroup`, `LayerRestriction`, `LayerRefinement`, `LayerRefinement.exists_commonRefinement`, `AbelianLayer`, `abelianizationGalEquiv`, `OpenNormalSubgroup.IsAbelianClassFieldLayer` and `OpenNormalSubgroup.maximalAbelianLayer` (root namespace), `classField`, `classField_le_classField_iff`, `galClassFieldEquiv`, `cupClass` |
| 2 | `ClassFormation`; ClassFormation: `fundamentalClass`, `inv_fundamentalClass`, `fundamentalClass_generates`, `fundamentalClass_restrict`, `fundamentalClass_cor`, `fundamentalClass_infl`, `fundamentalClass_conj`, `inv_cor`, `h1_subgroupLayer`, `card_H2_subgroupLayer`, `fundamentalClass_restrict_generates`, `natCard_normQuotient` |
| 3 | `tateTheorem`, `tateTheorem_toAddMonoidHom`; ClassFormation: `tateIso`, `tateIso_toAddMonoidHom`, `tateIso_res`, `tateIso_cor`, `tateIso_res_trans`, `tateIso_conj`, `tateIso_infl` |
| 4 | ClassFormation: `nakayamaNegTwo`, `artinEquiv`, `artinMap`, `ker_artinMap`, `surjective_artinMap`, `character_artinMap`, `eq_artinMap_of_character`, `normSubgroup_maximalAbelianLayer`, `isGenerator_artinMap_iff`, and the four diagrams `TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`, `TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundNorm`, `TauCeti.ClassFieldTheory.ClassFormation.artinMap_conj`, `TauCeti.ClassFieldTheory.ClassFormation.artinMap_quotient`; `NormalLayer.characterConnectingClass`, `NormalLayer.artinCharacterCup` |
| 5 | `GalRep`, `TauCeti.ClassFieldTheory.muNRep`, `kummerCoeffEquivMuNRep`, `TauCeti.ClassFieldTheory.muNRepEquivZMod`, `muNRepH1Equiv`, `kummerEquiv`, `kummerEquivOfCharZero`, `TauCeti.ClassFieldTheory.kummerClass`, `unitsRep`, `Br`, `invMap`, `brRes`, `brCor`, `invMap_brRes`, `invMap_brCor`, `TauCeti.herbrandQuotient_units_eq_finrank`, `TauCeti.TateCohomology.herbrandQuotient_unitFiltration_zero`, `TauCeti.index_normGroup_of_isCyclic`, `TauCeti.natCard_H2_units_dvd_finrank`, `h2MuEquivZMod`, `h2EquivZModOfMuNRepIso`, `TauCeti.ClassFieldTheory.kummerCupPairing`, `TauCeti.ClassFieldTheory.localSymbol`, `TauCeti.ClassFieldTheory.localSymbol_kummerClass_mul`, `TauCeti.ClassFieldTheory.localSymbol_kummerClass_eq_zero_of_add_eq_one`, `TauCeti.ClassFieldTheory.localSymbol_antisymm`, `TauCeti.ClassFieldTheory.localSymbol_eq_zero_iff_mem_normGroup`, `forall_localSymbol_kummerClass_eq_zero_iff`, `separatingRight_localSymbol`, `TauCeti.ClassFieldTheory.tateDual`, `TauCeti.ClassFieldTheory.tateDual_ρ_eq_self_iff`, `tateEvaluationPairing`, `TauCeti.ClassFieldTheory.tateDualMap_exact`, `TauCeti.ClassFieldTheory.tateDualityPairing`, `TauCeti.ClassFieldTheory.tateDualityPairing_perfect`, `TauCeti.ClassFieldTheory.finite_H`, `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`, `TauCeti.ClassFieldTheory.eulerCharacteristic_finrank_fp`, `TauCeti.FinitePadicExtension` |
| 6 | `unitsFormation`, `localClassFormation`, `localClassFormation_inv`, `brInfl`, `localFormationRestrict`, `localArtinEquiv`, `localArtinEquiv_eq_of_iota`, `TauCeti.ClassFieldTheory.localArtinMap`, `TauCeti.ClassFieldTheory.normResidue`, `TauCeti.ClassFieldTheory.localArtinMap_uniformizer`, `TauCeti.ClassFieldTheory.localArtinMap_eq_frobenius_pow_valuation`, `TauCeti.ClassFieldTheory.localArtinMap_unit_of_unramified`, `TauCeti.localNormQuotientEquivZModOfUnramified`, `TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_nontrivial_iff_not_norm`, `TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_hilbertSymbol`, `TauCeti.ClassFieldTheory.localArtinMap_cyclotomic_uniformizer`, `subsingleton_h3_unitsRep`, `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` |
| 7 | `TauCeti.ClassFieldTheory.artinMap`, `TauCeti.ClassFieldTheory.artinMap_restrict`, `TauCeti.ClassFieldTheory.artinMap_norm`, `TauCeti.ClassFieldTheory.artinMap_congr`, `continuous_artinMap`, `TauCeti.ClassFieldTheory.denseRange_artinMap`, `not_surjective_artinMap`, `geometricArtinMap`, `TauCeti.absoluteGaloisGroupExtend`, `AlgHom.restrictNormalHom`, `TauCeti.unramifiedCoordinate`, `TauCeti.unramifiedCoordinate_mk_eq_one_iff`, `TauCeti.unramifiedCoordinate_mk_eq_gen_iff`, `TauCeti.ClassFieldTheory.unramifiedCoordinate_artinMap`, `mem_inertiaSubgroup_of_mk_eq_artinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`, `conductorExponent`, `conductorIdeal`, `conductorExponent_le_iff`, `conductorExponent_eq_zero_iff`, `characterConductorExp`, `TauCeti.cyclotomicSymbol`, `TauCeti.realCyclotomicSymbol`, `TauCeti.prod_cyclotomicSymbol`, `TauCeti.cyclotomicSymbol_norm_fixes`, `localCyclotomicCharacter_artinMap_padic_uniformizer`, `localCyclotomicCharacter_artinMap_padic`, `localCyclotomicCharacter_artinMap_unit`, `localCyclotomicCharacter_artinMap_uniformizer` |
| 8 | `localNormSubgroup`, `isOpen_localNormSubgroup`, `finiteIndex_localNormSubgroup`, `localNormSubgroup_mono`, `localNormSubgroup_top`, `localNormSubgroup_maximalAbelianLayer`, `localNormSubgroup_inf_of_isAbelian`, `localNormSubgroup_sup`, `localAbelianExistence`, `localExistence`, `localAbelianExistence_primeToResidueCharacteristic`, `localClassField_unique`, `localClassField`, `localClassField_le_iff`, `localClassField_orderReversing`, `localClassFieldCorrespondence`, `localClassFieldCorrespondencePrimeToResidueCharacteristic`, `localAbelianGaloisEquiv`, `index_localNormSubgroup`, `localClassField_index`, `ker_artinMap_eq_iInf`, `injective_artinMap`, `profiniteCompletionArtinEquiv`, `conductorExponent_localClassField_le_iff` |
| 9 | `localWeilGroup`, `inertiaSubgroup_le_localWeilGroup`, `dense_localWeilGroup`, `localWeilGroup_ne_top`, `WeilGroup`, `weilToAbsolute`, `denseRange_weilToAbsolute`, `isOpen_inertia_weil`, `isOpenEmbedding_inertiaToWeil`, `weilTopology_unique`, `not_compactSpace_weilGroup`, `TauCeti.not_isOpen_inertiaSubgroup`, `weilDegree`, `surjective_weilDegree`, `ker_weilDegree`, `unramifiedCoordinate_weilDegree`, `weilTransfer`, `index_range_weilTransfer`, `weilDegree_weilTransfer`, `weilRestrict`, `range_weilTransfer_eq_ker_weilRestrict`, `localWeilArtinEquiv`, `localWeilArtinEquiv_compat`, `mem_range_artinMap_iff` |
| 10 | `globalFormation`, `ideleFormation`, `infiniteInvMap`, `infiniteClassFormation`, `infiniteArtinAt`, `character_infiniteArtinAt`, `infiniteArtinAt_rootsOfUnity_of_isReal`, `infiniteArtinAt_norm`, `finiteInvAt`, `infiniteInvAt`, `brauerSupport`, `sumLocalInv`, `brLocalization_injective`, `sumLocalInv_brLocalization_eq_zero`, `exists_br_of_sum_eq_zero`, `ideleToClassH2`, `classToMultiplicativeH3`, `range_ideleToClassH2`, `surjective_ideleToClassH2_of_isCyclic`, `subsingleton_h1_globalFormation`, `degree_le_natCard_normQuotient_of_isCyclic`, `natCard_H2_globalFormation_dvd_degree`, `ideleSumLocalInv`, `exists_refinement_ideleSumLocalInv_eq`, `exists_refinement_mem_range_ideleToClassH2`, `ideleSumLocalInv_eq_of_ideleToClassH2_eq`, `globalInv`, `globalInv_ideleToClassH2`, `globalInv_infl`, `globalInv_unique`, `globalInv_injective`, `range_globalInv` |
| 11 | `globalClassFormation`, `globalClassFormation_inv`, `ideleSumLocalInv_fundamentalClass`, `globalArtinEquiv`, `globalArtinMap`, `globalArtinMap_principal`, `globalArtinMap_comp`, `localArtinAt`, `globalArtinMap_local`, `primeIdeleClass`, `globalArtinMap_ideal`, `globalArtinMap_isArithFrobAt`, `TauCeti.decompositionRestrict`, `globalArtinMap_cyclotomic_prime`, `globalArtinMap_Qi_prime`, `globalArtinMap_zeta5_two` |
| 12 | `globalNormSubgroup`, `isOpen_globalNormSubgroup`, `finiteIndex_globalNormSubgroup`, `globalNormSubgroup_mono`, `globalNormSubgroup_top`, `globalNormSubgroup_maximalAbelianLayer`, `exists_abelianLayer_globalNormSubgroup_eq_of_le`, `exists_abelianLayer_globalNormSubgroup_eq_of_comap_ideleClassNorm`, `exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem`, `kummerLayer`, `auxiliaryKummerIdeleSubgroup`, `degree_kummerLayer_sUnits`, `globalNormSubgroup_kummerLayer_sUnits`, `globalAbelianExistence`, `globalExistence`, `globalClassField_unique`, `globalClassField`, `globalClassFieldCorrespondence`, `globalClassField_le_iff`, `globalClassField_orderReversing`, `globalNormSubgroup_inf_of_isAbelian`, `globalNormSubgroup_sup`, `globalAbelianGaloisEquiv`, `index_globalNormSubgroup`, `globalClassField_index`, `TauCeti.ClassFieldTheory.card_ideleClassNormQuotient`, `IsAdmissibleModulus`, `IsAdmissibleModulus.mem_support_of_ramified`, `abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd`, `not_isAdmissibleModulus_one_Qi`, `rayClassArtinMap`, `rayClassArtinMap_idealClass`, `rayClassArtinMap_surjective`, `TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap` |
| 13 | `TauCeti.ClassFieldTheory.cyclicHasseNorm`, `TauCeti.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere`, `TauCeti.GlobalNumberFields.IsFiniteLocalNorm`, `TauCeti.GlobalNumberFields.IsInfiniteLocalNorm`, `TauCeti.GlobalNumberFields.IsLocalNormEverywhere`, `TauCeti.GlobalNumberFields.isInfiniteLocalNorm_of_isComplex`, `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`, `TauCeti.GlobalNumberFields.unitEmbedding_mem_range_ideleNormMap_iff`, `rayNormSubgroup`, `rayClassField`, `hilbertClassField`, `narrowHilbertClassField`, `isAdmissibleModulus_iff_le_rayClassField`, `gal_rayClassField_equiv_rayClassGroup`, `rayClassArtinEquiv`, `hilbertClassArtinEquiv`, `fieldRange_le_hilbertClassField_iff`, `isUnramifiedAt_hilbertClassField`, `kroneckerWeber`, `isLeast_absNorm_abelianConductor_finitePart`, `absNorm_abelianConductor_finitePart_mod_four_ne_two`, `ringClassIdeleQuotient`, `ringClassNormSubgroup`, `TauCeti.ClassFieldTheory.ringClassField`, `TauCeti.ClassFieldTheory.ringClassArtinMap`, `TauCeti.ClassFieldTheory.ringClassArtinEquiv`, `TauCeti.ClassFieldTheory.ringClassArtinMap_eq_one_iff`, `isUnramifiedAt_ringClassField`, `ncard_primesOver_ringClassField_eq_finrank_iff`, `ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one`, `ker_ringClassIdeleQuotient_maximalNumberFieldOrder`, `TauCeti.ClassFieldTheory.ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, `TauCeti.LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent`, `TauCeti.relDiscr`, `TauCeti.GlobalNumberFields.NumberFieldOrder`, `TauCeti.GlobalNumberFields.maximalNumberFieldOrder`, `TauCeti.GlobalNumberFields.Pic` |
| 14 | `TauCeti.ClassFieldTheory.finiteHilbertInvariantAt`, `TauCeti.ClassFieldTheory.infiniteHilbertInvariantAt`, `TauCeti.ClassFieldTheory.finiteHilbertSupport`, `TauCeti.ClassFieldTheory.hilbertProductFormula`, `sum_finiteHilbertInvariantAt_add_sum_infiniteHilbertInvariantAt_eq_zero_iff` |

### From TauCetiRoadmap.GlobalNumberFields

`GlobalNumberFields.NumberFieldOrder` and `GlobalNumberFields.Pic`, the order and Picard group on
which `IntegralLattices` states its ring class fields. An order of that roadmap has the same three
fields as Tau Ceti's `TauCeti.GlobalNumberFields.NumberFieldOrder` (a finite `ℤ`-subalgebra
spanning `K`), and both Picard groups are Mathlib's `ClassGroup` of the subring, so
`numberFieldOrderToTauCeti` transports one to the other with no change of `Pic`. No other roadmap
supplies a target of this roadmap: everything the open targets need is in Mathlib or Tau Ceti.

## 4. How to read the build

`README.md` is normative and `Suggested.lean` states the open targets and the imported names. Each
layer below says what Tau Ceti proves at the pin, states the open targets of the layer, if any,
and ends with its examples and its dependencies. The layer order is the dependency order: a layer
uses Mathlib, Tau Ceti, `GlobalNumberFields` and earlier layers only.

## Layer 0: the generic cohomology suppliers

Tau Ceti supplies, on Mathlib's `tateCohomology`, restriction and corestriction in every Tate
degree with `cor ∘ res = [G : H]`, inflation in positive degrees, the Tate cup product in all
integer bidegrees with its associativity and naturality, `Ĥ⁻²(G, ℤ) ≃ G^ab`,
`Ĥ⁰(G, M) ≃ M^G / N_G M`, two-periodicity for cyclic groups and the Herbrand quotient with its
multiplicativity in short exact sequences and its invariance under maps with finite kernel and
cokernel. It proves Tate's cup-product criterion and its Tate–Nakayama generalization (§3,
Layer 0).

It proves the theorem of Nakayama and Rim (Serre, *Local Fields*, IX §§3–5; Brown, *Cohomology of
Groups*, VI §8; Rim, Ann. of Math. 69 (1959)) in the namespace `Rep`, with cohomological
triviality written as the conclusion of `TauCeti.TateCohomology.isZero_of_forall_isPGroup`: a
projective `k[G]`-module is cohomologically trivial; over a principal ideal domain of
characteristic zero in which every prime is a unit or generates a maximal ideal, a cohomologically
trivial representation free over `k` is projective; the kernel of a surjection from a projective
module onto a cohomologically trivial one is projective, with no finiteness hypothesis; and a
representation with a projective resolution of length one is cohomologically trivial. The kernel
statement uses `Submodule.free_of_isPrincipalIdealRing` (Lang, *Algebra*, III Theorem 7.1), in
every rank. Finally, `p`-primary Tate cohomology sees only `p`: if multiplication by `p` is
bijective on `A`, the `p`-primary component of `Ĥⁿ(S, A)` vanishes.

This roadmap re-exports the last two as `TateCohomology.projective_ker_of_isZero_res` and
`TateCohomology.primaryComponent_tateCohomology_eq_bot` for `LocalGaloisGroups`.

### Examples

- Cyclic `C₂` acting on `ℂˣ` by conjugation: `H¹ = 0`, `H²` has order two, and
  `Ĥ⁻²(C₂, ℤ) = C₂ ≅ ℝˣ / ℝ_{>0}`, so Tate's criterion applies with `u = [-1]`.
- The trivial `C₂`-module `ℤ/2` fails the first hypothesis, `H¹ = ℤ/2`, and indeed
  `Ĥ⁻¹(C₂, ℤ) = 0 ≠ Ĥ¹(C₂, ℤ/2)`.

### Dependencies

Mathlib; Tau Ceti.

## Layer 1: formations and finite normal layers

Tau Ceti implements the formation machinery in `TauCeti/NumberTheory/ClassFieldTheory/Formation/`
(§2.1 and §3, Layer 1): formations and their levels; finite normal layers with their Galois
groups, degrees, coefficient modules, cohomology carriers, norms and low Tate degrees; the finite
quotient system `H ↦ subgroupLayer H` of a layer; the layers of open normal subgroups; restriction,
refinement and conjugation of layers on ordinary and Tate cohomology, with restriction and
corestriction as separate maps normalized by `cor ∘ res = [E : F]` and every map functorial along
towers; the transfer, inclusion, quotient and conjugation maps on abelianized Galois groups; the
abelian layers, whose subgroup contains Mathlib's closed commutator subgroup
`(commutator G).topologicalClosure`, and the canonical maximal abelian sublayer
`V · [G, G]‾`; and the class field of an open normal subgroup with the order-reversing Galois
dictionary. Every Tate group of a layer is the imported finite-group Tate group of `U/V`.

### Examples

- For the layer `U/U` the Galois group, the norm quotient and the abelianized Galois group are
  trivial.
- For `G = G_{ℚ₂}`, `A = (ℚ̄₂)ˣ` and `V = G_{ℚ₂(i)}`, the layer has Galois group `C₂`, ground level
  `ℚ₂ˣ` and norm quotient of order two: `-1` is not a norm, since `(-1, -1)₂ = -1`.

### Dependencies

Layer 0.

## Layer 2: class formations and fundamental classes

Tau Ceti's `ClassFormation` has the axioms of §2.2 with the invariant as data and proves that `H²`
of a layer is cyclic of order its degree, that the fundamental class exists, is unique and
generates, and the restriction, corestriction, inflation and conjugation formulae of §2.3, with
`inv_cor` a theorem rather than an axiom. It proves the three hypotheses of Tate's theorem for
every subgroup of a layer as separate theorems (§3, Layer 2). This roadmap re-exports the
structure as `ClassFormation`.

### Examples

- Unramified `L/K` of degree `6` and an intermediate `E` of degree `2`: `inv(u) = 1/6`, and
  restriction gives `inv_E(res u) = 2/6 = 1/3`, of order `3 = [L : E]`.
- `[U : V] = 4`, `[U : U'] = 2`, `[V : V'] = 3`: restriction gives `2 · 1/4 = 1/2`, corestriction
  `cor(u_{U',V}) = 2 · u_{U,V}`, and inflation `inf(u_{U,V}) = 3 · u_{U,V'}`.

### Dependencies

Layer 1.

## Layer 3: Tate's theorem for a class formation

Tau Ceti proves Tate's theorem with its three hypotheses as separate arguments (§2.4), its
application `ClassFormation.tateIso` to the fundamental class in every integer degree, whose
underlying map is cup product with the fundamental class, and its compatibility with restriction,
corestriction, towers of grounds, conjugation and, in positive degrees, the scaled inflation
`tateInfl (tateIso r x) = [V : V'] · tateIso r (inf x)` (§3, Layer 3). The restriction,
corestriction and inflation squares do not have the same shape: restriction multiplies
invariants, corestriction preserves them, inflation of the fundamental class is scaled. This
roadmap re-exports `tateTheorem` for `LocalGaloisGroups`.

### Examples

- The Tate–Nakayama hypothesis `Tor₁(M, C) = 0` excludes `M = ℤ/2`, `C = ℂˣ`, where
  `Tor₁ = μ₂ ≠ 0`, and holds for `M = ℤ`.

### Dependencies

Layers 0–2.

## Layer 4: the abstract Artin map

Tau Ceti defines `nakayamaNegTwo`, `artinEquiv = nakayamaNegTwo.symm` and the Artin map of §2.5,
and proves that its kernel is the norm subgroup, that it is surjective, the character formula
`χ(artinMap a) = inv(class(a) ∪ δχ)` and its converse (any homomorphism satisfying it is the
Artin map), the four Artin–Tate diagrams (inclusion of grounds is the transfer, the norm is the
inclusion of Galois groups, conjugation is conjugation, passage to a quotient extension is the
quotient map), and the norm limitation theorem: a layer and its maximal abelian sublayer have the
same norm subgroup, by counting through `artinEquiv` (§3, Layer 4). Norm limitation is what forces
Layers 8 and 12 to state existence with an abelian layer. This roadmap re-exports
`ClassFormation.artinMap_conj` for `LocalGaloisGroups`.

**Open target: the quadratic Artin test.**
`ClassFormation.artinMap_quadratic_eq_nontrivial_iff_not_norm`: in a layer of degree `2` with
`σ ≠ 0` in `(U/V)^ab`, `cf.artinMap L a = σ ↔ a ∉ L.normSubgroup F`. It is the abstract form of
Tau Ceti's local theorem, and follows from `artinMap_eq_zero_iff` because `(U/V)^ab` then has
exactly two elements.

### Examples

- The trivial layer: the Artin map is the unique map between trivial groups
  (`TauCeti.ClassFieldTheory.ClassFormation.artinMap_trivialLayer`).
- A cyclic layer: the Artin symbol of `a` generates `Γ` exactly when the class of `a` generates
  the norm quotient (`TauCeti.ClassFieldTheory.ClassFormation.isGenerator_artinMap_iff`).

### Dependencies

Layer 3.

## Layer 5: local coefficients, Kummer theory, the local symbol and duality

Continuous cohomology is Mathlib's, `H n F i A = continuousCohomology i A` for
`A : GalRep n F = TopRep (ZMod n) G_F`. Tau Ceti supplies, for a nonarchimedean local field `F`
(§3, Layer 5):

- **the coefficients.** `μ_n(Fˢ)` as an object of `GalRep n F` (Tau Ceti's `muNRep`), related to
  the Kummer coefficient `KummerCoeff F n` by an equivariant continuous dictionary; the coordinate
  `log_ζ : μ_n ≃ ℤ/n` selected by a primitive root `ζ ∈ F`, which also makes the action trivial;
  the Kummer class and the Kummer equivalence `Fˣ / (Fˣ)ⁿ ≃ H¹(G_F, μ_n)` for `n` invertible in
  `F`, hence for every `n ≠ 0` when `F` has characteristic zero;
- **the local Brauer group and its invariant.** `Br F = H²(G_F, (Fˢ)ˣ)`, the invariant
  `invMap : Br F ≃ ℚ/ℤ` normalized by arithmetic Frobenius, restriction multiplying it by the
  degree and corestriction preserving it, both for finite extensions whose valuation extends
  that of `F`; the Herbrand quotients of the local units and of `Lˣ`, the cyclic norm index and
  the local `H²` bound (Milne, *Class Field Theory*, III Lemmas 2.3–2.6);
- **the invariant `H²(G_F, μ_n) ≃ ℤ/n`** for `n` invertible, and its transport along a coefficient
  identification `μ_p ≅ T`;
- **the cohomological Hilbert symbol.** The Kummer cup pairing `(x, y) ↦ log_ζ(x) · y` and the
  local symbol, cup product followed by an invariant, with bilinearity, the Steinberg relation,
  antisymmetry, the norm criterion for `K(b^{1/n})/K` and nondegeneracy;
- **local duality.** The Tate dual `Hom(A, μ_n)` with the conjugation action and its evaluation
  pairing; finiteness of `H⁰`, `H¹`, `H²` of a finite smooth discrete module; perfectness of the
  duality pairing when `n` is invertible; and the identification of the `(1, 1)` pairing at
  `μ_n` with the Hilbert pairing through `μ_n ≅ Hom(μ_n, μ_n)`;
- **the Euler characteristic** `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`, with its `𝔽_p`-rank form,
  for `F` a `TauCeti.FinitePadicExtension F p`, which bundles a finite `ℚ_p`-algebra structure
  whose valuation extends that of `ℚ_p`.

The finiteness, duality and Euler-characteristic statements need the module `A` to be finite,
discrete and smooth (`TauCeti.IsSmoothDiscrete`: the topology is discrete and every point
stabilizer is open). Instances supply smoothness at `muNRep n F`, at the Tate dual of a finite
smooth module and at the trivial module `𝔽_p`.

**Open targets: the Euler characteristic for every finite `F/ℚ_p`.** `eulerCharacteristic_mixed`
and `eulerCharacteristic_finrank_fp` state the formula for a nonarchimedean local field `F` with a
finite `ℚ_p`-algebra structure and no compatibility hypothesis between the valuations. The missing
input is that compatibility: a field complete for two rank-one henselian valuations is separably
closed unless they are dependent (F. K. Schmidt), so the valuation of `F` extends that of `ℚ_p`
and Tau Ceti's theorems apply.

### Examples

- The Euler characteristic `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`: for `ℚ_p` with `ℤ/p`, `p` odd,
  `#H⁰ = p`, `#H² = #μ_p(ℚ_p) = 1` and `#H¹ = p² = p · 1 · p`; for `ℚ₂` with `ℤ/2`,
  `8 = 2 · 2 · 2`; for `ℚ_p` with `ℤ/ℓ` and `ℓ ∤ p(p - 1)`, `ℓ = ℓ · 1 · 1`.
- Over `ℚ₂`, the nontrivial unramified action on `ℤ/3` admits no filtration by trivial modules,
  and its dual has `H⁰` of order `1` while `H⁰` of the module has order `3`: duality coinduces
  rather than filters.
- The norm criterion at `n = 2` over `ℚ₂`: `5 = 1² + 2²` is a norm from `ℚ₂(i)` and `(5, -1)₂ = 1`.

### Dependencies

Layer 0; Tau Ceti's local fields, Kummer theory and internal homs.

## Layer 6: the local class formation and finite local reciprocity

Tau Ceti builds the formation of `(Kˢ)ˣ` (`unitsFormation`) and the local class formation with
`invMap` as its invariant (`localClassFormation_inv`), identifies the restriction of the formation
of `K` to `G_L` with the formation of `L`, and transports the abstract Artin equivalence to
`localArtinEquiv : Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)^ab`, independent of the embedding, with
`normResidue` its multiplicative form (§3, Layer 6). It proves the unramified normalization
`Art(π) = Frob_arith` and `Art(x) = Frob_arith^{v(x)}`, the quadratic tests, the comparison of the
quadratic Artin symbol with the local symbol at `kummerCupPairing (-1)`, and the cyclotomic value
`Art(π)(ζ_m) = ζ_m^q` for `m` prime to the residue cardinality `q`. It proves
`H³(G_K, (Kˢ)ˣ) = 0` and `cd_ℓ G_K = scd_ℓ G_K = 2` for every prime `ℓ` when `K` has
characteristic zero (NSW (7.1.8), (7.2.5)); in characteristic `p`, `cd_p G_K = 1`. This roadmap
re-exports `localArtinMap`, `normResidue` and `scd_p_absoluteGaloisGroup_eq_two`.

### Examples

- `ℚ₂(ζ₅)/ℚ₂` is unramified of degree four and `Art(2)(ζ₅) = ζ₅²`
  (`TauCeti.ClassFieldTheory.localArtinMap_Q2_zeta5`); geometric Frobenius would give `ζ₅³`.
- The cyclotomic value needs `m` prime to `q`: for `K = ℚ₂`, `m = 2` and `ζ = -1`, the identity
  fixes `ζ` while `ζ^q = 1`.
- `ℚ₂(i)/ℚ₂`: `Art(-1) = τ` because `(-1, -1)₂ = -1`, and `Art(5) = 1` because `5` is a norm.

### Dependencies

Layers 1–5.

## Layer 7: the absolute local Artin map, its normalizations, and conductors

Tau Ceti defines the absolute local Artin map `Kˣ → G_K^ab` into the topological abelianization
and pins it by three equations against named maps (§3, Layer 7): restriction to every finite
Galois extension gives the finite map (`artinMap_restrict`, against `AlgHom.restrictNormalHom`);
its unramified coordinate is the normalized valuation (`unramifiedCoordinate_artinMap`); and the
image of a lift of `Art_L(x)` under `absoluteGaloisGroupExtend` is `Art_K(N_{L/K} x)`
(`artinMap_norm`). It proves naturality in the field, continuity, dense image and
non-surjectivity, that every lift of `Art(u)` for a unit lies in inertia and every lift of
`Art(π)` is an arithmetic Frobenius lift, the conductors with minimality and the unramified
criterion, and the cyclotomic normalization: the explicit cyclotomic symbols over `ℚ` and their
product formula (Milne, *Class Field Theory*, VII Example 8.2), `χ_cyc(Art_{ℚ_p}(p)) = 1`,
`χ_cyc(Art_{ℚ_p}(u)) = u⁻¹`, and `χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)⁻¹` when the valuation of `F`
extends that of `ℚ_p`.

This roadmap re-exports `artinMap`, `restrictAbsolute` (with `iota_restrictAbsolute_apply`),
`artinMap_restrict`, `absoluteGaloisGroupExtend`, `artinMap_norm`, `denseRange_artinMap`,
`unramifiedCoordinate`, `unramifiedCoordinate_artinMap`, `cyclotomicCharacter_artinMap_padic`
and `cyclotomicCharacter_artinMap_padic_uniformizer`.

**Open target: the cyclotomic normalization for every finite `F/ℚ_p`.**
`cyclotomicCharacter_artinMap` states `χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)⁻¹` for a unit `u` and a lift
`σ` of `Art_F(u)`, with no compatibility hypothesis between the valuations, which is how
`LocalGaloisGroups` consumes it. The missing input is the one of Layer 5.

### Examples

- At `p = 2`: `χ_cyc(Art(-1)) = -1` and `χ_cyc(Art(-3)) = 5` on `μ₁₆` (without the inverse it
  would be `13`).
- For `K = ℚ₂(i)` and `u = i`: `N(i) = 1`, so `Art(i)` acts trivially on the `2`-power roots of
  unity.

### Dependencies

Layers 5 and 6.

## Layer 8: local existence and the local class-field correspondence

Tau Ceti develops the norm subgroups of `Kˣ` (open, of finite index, monotone in the layer,
`⊤ ↦ Kˣ`, compatible with composita and intersections, with norm limitation) and proves local
existence for an abelian layer in characteristic zero and for index prime to the residue
characteristic in general, uniqueness, the class field of a norm subgroup, the correspondence in
both scopes with both order statements, the quotient isomorphism `Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)`
and `[Kˣ : N] = [L : K]`, the kernel of the absolute Artin map as the intersection of the norm
subgroups, injectivity in characteristic zero, the comparison with the profinite completion of
`Kˣ`, and the compatibility of conductors with existence (§3, Layer 8). Local existence is routed
through the class formation and Kummer theory, never through Lubin–Tate theory. ⚠ Injectivity
is not asserted in equal characteristic: every prime-to-`p` norm subgroup contains the pro-`p`
principal units.

### Examples

- `ℚ₂` and `N = (ℚ₂ˣ)²`, of index `8`: the class field is `ℚ₂(i, √2, √5)`, of degree `8`.
- The direction test: the layer `V = ⊤` cuts out `K` and has norm subgroup `Kˣ`
  (`TauCeti.ClassFieldTheory.localNormSubgroup_top`).

### Dependencies

Layers 5–7.

## Layer 9: the local Weil group

Tau Ceti builds the local Weil group as a subgroup of `G_K` containing inertia, normal, dense and
proper; the type `WeilGroup K` with the Weil topology, characterized as the unique group topology
making `I_K → W_K` an open embedding, locally compact, totally disconnected and not compact;
`weilDegree : W_K → ℤ`, surjective with kernel inertia and agreeing with the unramified
coordinate; functoriality `weilTransfer` with open image of index `[L : K]` and
`weilRestrict` with kernel that image; and, in characteristic zero, the reciprocity isomorphism
`Kˣ ≃ W_K^ab` onto the topological abelianization, compatible with the absolute Artin map (§3,
Layer 9). ⚠ Inertia is not open in `G_K`, and the algebraic abelianization of `W_K` is the wrong
target.

### Examples

- `deg_K = f(L/K) · deg_L` along `weilTransfer`, an equality of degrees only for totally ramified
  `L/K`.

### Dependencies

Layers 6–8.

## Layer 10: global carriers, the Brauer sequence, and the global invariant

Tau Ceti builds the idele and idele-class formations of a number field, the archimedean Brauer
groups and invariants (the real one of order two, the complex one trivial), the archimedean class
formations and Artin maps with their character formula, and the exact sequence
`0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0` in invariant coordinates, exact at all three places (§3,
Layer 10). It proves the fundamental inequalities and `H¹`-vanishing for idele classes, and
defines the global invariant on every idele-class layer class: the lift to the idele layer is
obstructed in `H³(Gal(L/K), Lˣ)`, exists in the cyclic case, and exists after a refinement, where
the sum of local invariants of any lift is independent of every choice. The invariant is injective
with image the subgroup of order `[L : K]`. ⚠ Real places are not ignorable: dropping them breaks
the sum formula already for `ℚ(i)/ℚ`.

### Examples

- For `L = ℚ(√13, √17)`, every decomposition group has order at most two, so
  `H²(Gal(L/ℚ), I_L)` is killed by `2`, while `H²(Gal(L/ℚ), C_L)` is cyclic of order `4`: the lift
  to the idele layer does not exist for every class.

### Dependencies

Layers 1, 5–7.

## Layer 11: the global class formation and global Artin reciprocity

Tau Ceti packages the global invariant into the global class formation, transports the abstract
Artin equivalence to `C_K / N_{L/K}(C_L) ≃ Gal(L/K)^ab`, and proves that the global Artin map is
trivial on principal ideles, compatible with towers and with every local Artin map through the
decomposition group, agrees with the ideal-theoretic Artin map at every unramified prime, and is
normalized by arithmetic Frobenius (§3, Layer 11). It proves the cyclotomic test
`Art((ℓ))(ζ_m) = ζ_m^ℓ` and its instances for `ℚ(i)` and `ℚ(ζ₅)`.

**Open target: the quadratic splitting test.** `globalArtinMap_quadratic_prime`: for a quadratic
extension `L/K`, a finite prime `v` of `K` unramified in `L` and a prime `Q` of `L` above it, the
Artin symbol of the prime idele class at `v` is the nontrivial automorphism exactly when `Q` has
residue degree `2`.

### Examples

- `ℚ(i)/ℚ`: `3` is inert (`i³ = -i`) and `5` splits, so `Art((3))` is complex conjugation and
  `Art((5)) = 1` (`TauCeti.ClassFieldTheory.globalArtinMap_Qi_prime`).
- `ℚ(√5)/ℚ`: `11` and `19` split, `2` and `7` are inert; equivalently, the restriction to
  `ℚ(√5)` of the cyclotomic symbol of `(ℓ)` in `ℚ(ζ₅)` is trivial exactly when `ℓ` is a square
  modulo `5`.
- `ℚ(ζ₅)/ℚ`: `Art((2))(ζ₅) = ζ₅²`, of order four, `Art((3))(ζ₅) = ζ₅³`, `Art((11))(ζ₅) = ζ₅`;
  `ℚ(ζ₈)/ℚ`: `Art((3))`, `Art((5))`, `Art((7))` send `ζ₈` to `ζ₈³`, `ζ₈⁵`, `ζ₈⁷`.

### Dependencies

Layers 1–4, 6, 7, 10.

## Layer 12: global existence, the norm index, and the global correspondence

Tau Ceti develops the idele-class norm subgroups and proves global existence for an abelian layer
by induction on the index from upward closure, descent along `K(ζ_p)/K` and the Kummer case over
`K ∋ ζ_p` (Milne, *Class Field Theory*, VII Lemmas 9.1–9.4, Theorem 9.5), with no use of
Grunwald–Wang; uniqueness, the global class field and the correspondence with both order
statements; composita and intersections of abelian layers; the quotient isomorphism and
`[C_K : N] = [L : K]`; the norm-index theorem; and admissible moduli, the conductor as the least
admissible modulus, the ray-class Artin map for admissible moduli, and the rejection test for
`ℚ(i)/ℚ` at the trivial modulus (§3, Layer 12). A prime ramified in a finite **abelian** `L/K`
divides every admissible modulus; without abelianity this fails, since `ℚ(∛2, ζ₃)/ℚ` is ramified
at `2` while its maximal abelian subextension `ℚ(ζ₃)` has conductor `3·∞`, prime to `2`. This
roadmap re-exports
`card_ideleClassNormQuotient` for `GlobalQuadraticForms`.

### Examples

- The ray subgroup of `4∞` in `C_ℚ` has index `2`, and its class field is `ℚ(i)`.
- `ℚ(i)/ℚ` at the trivial modulus: the ray class group is trivial while `Art((3)) ≠ 1`, so the
  trivial modulus is not admissible; nor is `(4)` without the real place, since the conductor is
  `(4)·∞`.
- Two `D₄`-extensions of `ℚ` with a common biquadratic subfield have a compositum whose maximal
  abelian subextension, of degree `8`, is larger than the compositum of their maximal abelian
  subextensions, of degree `4`: the intersection formula needs abelian layers.

### Dependencies

Layers 10 and 11.

## Layer 13: norm theorems and class fields

Tau Ceti proves the cyclic Hasse norm theorem, in idelic and in placewise form, on the local
étale algebras `K_v ⊗_K L` and `K_w ⊗_K L`; defines the ray class field of a modulus, the Hilbert
class field (modulus `1`) and the narrow Hilbert class field as class fields of named norm
subgroups, with `Gal(K_𝔪/K) ≃ Cl_𝔪(K)` and `Gal(H/K) ≃ Cl(K)`, the characterization of the ray
class field as the largest abelian extension of conductor dividing `𝔪`, and the Hilbert class
field as the maximal abelian extension unramified at every place; proves Kronecker–Weber and that
the least cyclotomic level is the finite part of the conductor, never `2 mod 4`; and defines the
ring class field of every order `O` of every number field, the class field of the kernel of the
ring-class quotient `C_K → Pic O`, with `Pic O ≃ Gal(H_O/K)`, unramified at the primes prime to
the conductor of `O`, with its splitting criterion (§3, Layer 13; Kopp–Lagarias, Theorems
1.1–1.3). This roadmap re-exports the Hasse norm theorem, the local-norm predicates, the idele
norms and the ring class field on the orders of `GlobalNumberFields`.

**Open targets.**

- **The principal ideal theorem.** `isPrincipal_map_hilbertClassField`: every ideal of `𝓞 K`
  becomes principal in the ring of integers of the Hilbert class field (Milne, *Class Field
  Theory*, V Theorem 3.17). Tau Ceti has the class-formation form; the target is its translation
  through the identification of idele classes with ideal classes.
- **The conductor–discriminant formula.** `relDiscr_eq_finprod_abelianConductor`: for finite
  abelian `L/K`, `𝔡(L/K) = ∏_χ 𝔣(χ)` over the characters of `Gal(L/K)` (Milne, V Theorem 3.27), with
  `𝔣(χ)` the finite part of the conductor of the fixed field of `ker χ` (V Remark 3.28). Grouping
  the characters by that field, the product runs over the cyclic subextensions `M` of `L/K`, with
  exponent `φ([M : K])`. Its inputs are Tau Ceti's local formula and the character dictionary.
- **Splitting in the Hilbert and ray class fields.**
  `ncard_primesOver_hilbertClassField_eq_finrank_iff`: a finite prime of `K` splits completely in
  the Hilbert class field exactly when it is principal;
  `ncard_primesOver_rayClassField_eq_finrank_iff`:
  a prime prime to `𝔪` splits completely in the ray class field of `𝔪` exactly when its ray class
  is trivial. They follow from Tau Ceti's splitting criterion for an admissible modulus through
  `rayClassArtinEquiv`.
- **The ring class field of the maximal order.** `ringClassField_maximal`: it is the Hilbert class
  field. Tau Ceti identifies the two norm subgroups; the target is the equality of fields.

### Examples

- `ℚ(√13, √17)/ℚ`: `25` is a norm at every place (at `2` the local degree is `2` and `v(25) = 0`;
  at `5` the extension is unramified and `v(25) = 2`; `25` is a square modulo `13` and `17`; and
  `25 > 0`) but not a global norm: the Hasse norm principle fails for a non-cyclic extension.
- `ℚ(i)/ℚ`: `3` is not a norm at `3`, where the extension is inert and `v(3) = 1`, and
  `x² + y² = 3` has no rational solution; `5 = 1² + 2²`.
- `ℚ(√-5)`: the class number is `2`, the Hilbert class field is `ℚ(√-5, i)`, and
  `(2, 1 + √-5)` becomes `(1 + i)` there.
- The conductor–discriminant formula for `ℚ(ζ₅)/ℚ`: `125 = 1 · 5 · 5²`; for `ℚ(ζ₈)/ℚ`:
  `256 = 1 · 4 · 8 · 8` over `ℚ`, `ℚ(i)`, `ℚ(√2)`, `ℚ(√-2)`.
- Kronecker–Weber: `ℚ(√5) ⊆ ℚ(ζ₅)` with least level `5`, `ℚ(i) = ℚ(ζ₄)`, `ℚ(√2) ⊆ ℚ(ζ₈)`.
- For the order `ℤ[√-3]` of conductor `2` in `ℚ(√-3)`, `Pic` is trivial and the ring class field
  is `ℚ(√-3)` itself; for `ℤ[2i]`, `Pic` is trivial as well.

### Dependencies

Layers 10–12; `GlobalNumberFields` (orders and `Pic`).

## Layer 14: Hilbert reciprocity and quadratic reciprocity

Tau Ceti defines the finite and infinite Hilbert invariants, `ℤ/2`-valued, from the local symbol
at the completions and the archimedean package, with finite support, and proves Hilbert
reciprocity `∑_v (a, b)_v = 0` as the sum-of-invariants theorem of Layer 10 applied to the Brauer
class of the quaternion symbol. It proves that quadratic reciprocity and its two supplements are
each equivalent to the vanishing of the corresponding Hilbert sum, so together with
`hilbertProductFormula` they give quadratic reciprocity for `ℚ`, the real and dyadic factors
included (§3, Layer 14). This roadmap re-exports the invariants and `hilbertProductFormula`;
`QuadraticFormInvariants` identifies its norm-equation symbol with these and inherits the formula.

### Examples

- `(3, 7)` over `ℚ`: the invariants are `0` at `∞`, `1/2` at `2`, `0` at `3` and `1/2` at `7`,
  summing to `0`.
- `(-1, -1)` over `ℚ`: `1/2` at `2` and at `∞`, `0` elsewhere.

### Dependencies

Layers 5, 10, 11, 13.

## 5. Checks

These are numerical checks against which the Artin map and the correspondence are tested. Each
pins a direction or a normalization in a case where the answer is elementary, and together they
catch four errors that are easy to hide in an abstract development: an arbitrary equivalence in
place of cup product with the fundamental class; the cup-product direction `Γ^ab → A^U / N(A^V)`
in place of its inverse; geometric in place of arithmetic Frobenius; and a reversed
correspondence, attaching the maximal abelian extension to `Kˣ` rather than to the trivial
subgroup. Tau Ceti states those marked with a name.

### 5.1 Trivial layer

For the layer `U/U` the norm quotient, `(U/U)^ab` and the Artin map are trivial
(`TauCeti.ClassFieldTheory.ClassFormation.artinMap_trivialLayer`). The layer `V = ⊤` has norm
subgroup `Kˣ`, resp. `C_K` (`TauCeti.ClassFieldTheory.localNormSubgroup_top`,
`TauCeti.ClassFieldTheory.globalNormSubgroup_top`): this is why the subgroup form of the
correspondence preserves inclusions while the field form reverses them.

### 5.2 Kernel, quotient, and cyclic layers

For every layer, the Artin map is the class map followed by `artinEquiv` and vanishes exactly on
norms. For a cyclic layer the norm quotient has `[U : V]` elements, and the Artin symbol
of `a` generates `Γ` exactly when the class of `a` generates the norm quotient. For
`ℚ₂(ζ₅)/ℚ₂` the norm quotient has index `4`, `[2]` generates it and `Frob` generates `Γ`, while
`[4]` and `Frob²` do not.

### 5.3 Unramified local extensions

For `L/K` unramified of degree `n`, a uniformizer `π` and residue cardinality `q`:
`Kˣ / N(Lˣ) ≃ ℤ/n` with `π ↦ 1`; `Art(π) = Frob_arith`; `Art(u) = 1` for a unit; and
`Art(x) = Frob_arith^{v(x)}`, `Frob_arith(x̄) = x̄^q`
(`TauCeti.localNormQuotientEquivZModOfUnramified`,
`TauCeti.ClassFieldTheory.localArtinMap_uniformizer`,
`TauCeti.ClassFieldTheory.localArtinMap_unit_of_unramified`,
`TauCeti.ClassFieldTheory.localArtinMap_eq_frobenius_pow_valuation`). For `ℚ₂(ζ₅)`:
`Art(8) = Frob³` sends `ζ₅ ↦ ζ₅³`, and `Art(2)(ζ₅) = ζ₅²`
(`TauCeti.ClassFieldTheory.localArtinMap_Q2_zeta5`). In general `Art(π)(ζ_m) = ζ_m^q` for `m`
prime to `q` (`TauCeti.ClassFieldTheory.localArtinMap_cyclotomic_uniformizer`); without that
hypothesis the statement fails at `K = ℚ₂`, `m = 2`. At `ℚ_p` the unramified coordinate of
`Art(p)` is the generator of `Ẑ`, that of a unit is trivial, and `χ_cyc(Art(u)) = u⁻¹`; at `p = 2`,
`u = -1`, `u = -3` and the uniformizer are tested separately (Layer 7).

### 5.4 Quadratic extensions

For `L/K` quadratic with nontrivial `τ`: `Art(a) = 1` if `a` is a norm and `Art(a) = τ` if not
(Layer 4 target; `TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_nontrivial_iff_not_norm`),
and `Art(a) = τ` exactly when `(a, d)_K = -1` for `L = K(√d)`
(`TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_hilbertSymbol`). ⚠ The Hilbert-symbol
comparison is about `K(√d)` exactly: a bare `∃ s, s² = d` also holds in `K(√d, √e)`, of degree
four, and the symbol is the local symbol at the named pairing `kummerCupPairing (-1)`, since the
zero pairing would make every symbol trivial. Globally, `ℚ(i)/ℚ` and `ℚ(√5)/ℚ` are the Layer 11
examples; for `ℚ(√5)/ℚ` the norm index is `2` and the cyclic Hasse norm theorem holds.

### 5.5 Cyclotomic fields

For `ℓ ∤ m`, `Art((ℓ))(ζ_m) = ζ_m^ℓ`, equivalently `Art((ℓ)) ↔ ℓ mod m` under
`Gal(ℚ(ζ_m)/ℚ) ≃ (ℤ/m)ˣ` (`TauCeti.ClassFieldTheory.globalArtinMap_cyclotomic_prime`); a
quadratic example alone cannot distinguish an automorphism from its inverse. For `ℚ(ζ₅)/ℚ`,
`Art((2))(ζ₅) = ζ₅²` (`TauCeti.ClassFieldTheory.globalArtinMap_zeta5_two`); the other values are
the Layer 11 examples. At `m = 1` the symbol is `1`, and at `m = 2` it is `(-1)^ℓ = -1`.

### 5.6 Compatibility and tower tests

For `K ≤ E ≤ L`, the three finite Artin maps satisfy the norm and transfer squares
(`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`,
`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundNorm`), to be checked in two cases. For
`ℚ ≤ ℚ(√5) ≤ ℚ(ζ₅)`, with Galois group `C₄ = ⟨g⟩` and `H = ⟨g²⟩`, the transfer `C₄ → H` sends
`g` to `g²`, so it agrees with the quotient map `C₄ → C₄/H` followed by `C₄/H ≅ H`; this case
distinguishes the inclusion `H → C₄`, which is not onto, from the transfer, which is onto `H`.
For the Klein four group of `ℚ(√5, √13)/ℚ`, restricted to each of its three quadratic subfields,
the transfer to a subgroup of order two is trivial while the quotient map is not: this case
distinguishes the transfer from the quotient map.

### 5.7 Downstream worked examples

- `25` in `ℚ(√13, √17)/ℚ` (Layer 13).
- The Hilbert class field of `ℚ(√-5)` and the principal ideal theorem there (Layer 13); the narrow
  Hilbert class field of `ℚ(√3)` is `ℚ(√3, i)`, while its Hilbert class field is `ℚ(√3)`.
- Quadratic reciprocity from `hilbertProductFormula`, the real and dyadic factors included
  (Layer 14).
- For a nonmaximal imaginary-quadratic order, `Gal(H_O/K)` against `GlobalNumberFields.Pic O`
  through `ringClassArtinEquiv`; Tau Ceti's
  `TauCeti.BinaryQuadraticForm.posDefProperClassEquivGal` identifies it with the classes of
  primitive positive definite forms.

### 5.8 Minimal suite

The trivial layer; `V = ⊤ ↦ Kˣ`; the unramified normalization for an arbitrary finite unramified
extension; the local quadratic test; `ℚ(i)` at an inert and a split prime; the cyclotomic test with
the value of `ℚ(ζ₅)` at `2`; and the rejection of the trivial modulus for `ℚ(i)/ℚ`
(`TauCeti.ClassFieldTheory.not_isAdmissibleModulus_one_Qi`). Together they test triviality, the
direction of the correspondence, the norm kernel, a group of order two, arithmetic Frobenius, a
non-involutive Artin symbol, and that ray-class reciprocity is never written at an inadmissible
modulus. All of them are Tau Ceti's at the pin.

## 6. Policy for `Suggested.lean`

`Suggested.lean` is the acceptance test of the roadmap. It imports `Mathlib`, individual
`TauCeti.*` modules, and `Completed.GlobalNumberFields.Suggested` for the order of that roadmap
that `IntegralLattices` passes to the ring class field. It contains:

- the open targets of §1, each a theorem with a `sorry` proof, stated on Tau Ceti's carriers;
- the names other roadmaps import (§1), each an abbreviation of a Tau Ceti declaration, a
  definition built from Tau Ceti's, or a theorem closed by Tau Ceti's theorem.

It contains no `sorry` definition, no `sorry` instance, no restatement of a theorem Tau Ceti proves
under the same hypotheses, no elaboration-option overrides, no `Nonempty (X ≃ Y)` where Tau Ceti supplies the
canonical map except as the corollary a consumer uses, and no definition that loses a hypothesis
its type needs: every declaration whose type depends on the local-field structure binds
`[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` in its own signature. The
checks of §5 are not restated there.

## 7. Dependency order

- *Layer 0 needs:* Mathlib; Tau Ceti.
- *Layer 1 needs:* Layer 0.
- *Layer 2 needs:* Layer 1.
- *Layer 3 needs:* Layers 0–2.
- *Layer 4 needs:* Layer 3.
- *Layer 5 needs:* Layer 0.
- *Layer 6 needs:* Layers 1–5.
- *Layer 7 needs:* Layers 5, 6.
- *Layer 8 needs:* Layers 5–7.
- *Layer 9 needs:* Layers 6–8.
- *Layer 10 needs:* Layers 1, 5–7.
- *Layer 11 needs:* Layers 1–4, 6, 7, 10.
- *Layer 12 needs:* Layers 10, 11.
- *Layer 13 needs:* Layers 10–12; `GlobalNumberFields`.
- *Layer 14 needs:* Layers 5, 10, 11, 13.

The local invariant of Layer 5 is built before the local class formation of Layer 6 that carries
it, and the global invariant of Layer 10 before the global class formation of Layer 11. The
cyclotomic normalization of Layer 7 is proved from the explicit cyclotomic symbols over `ℚ`, and
Layer 10 consumes it, so it is not proved from the global class formation.

## 8. References

- E. Artin and J. Tate, *Class Field Theory*, AMS Chelsea, 2009: Chapter XIV (formations, class
  formations, the Main Theorem, the reciprocity isomorphism, and the existence theorem under the
  axioms IIIa–IIId); Chapters V–VIII (the fundamental inequalities, global reciprocity and
  existence); XI §5 (conductors); XV (Weil groups).
- J. S. Milne, *Class Field Theory*, course notes, v4.03: II Theorem 3.11 and Remark 3.12 (Tate's
  theorem and the Tate–Nakayama generalization); III Lemmas 2.3–2.6 (local units and the order of
  `H²(L/K)`); V Theorem 3.17 (the principal ideal theorem), Theorem 3.27 and Remark 3.28 (the
  conductor–discriminant formula); VII §§4–5, Example 8.2, Theorem 8.1, Lemmas 9.1–9.4 and Theorem
  9.5; VIII §4.
- J. Tate, *The higher dimensional cohomology groups of class field theory*, Ann. of Math. 56
  (1952); T. Nakayama, *Cohomology of class field theory and tensor product modules I*, Ann. of
  Math. 65 (1957).
- J.-P. Serre, *Local Fields*, IX §§3–5 and XI–XIV; *Galois Cohomology*, II §5.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed.: (7.1.8), (7.2.5),
  (7.2.6), (7.3.1)–(7.3.4).
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed., I §2.
- J. Neukirch, *Algebraic Number Theory*, Chapters VI–VII.
- K. S. Brown, *Cohomology of Groups*, VI §8; D. S. Rim, *Modules over finite groups*, Ann. of
  Math. 69 (1959); S. Lang, *Algebra*, III Theorem 7.1.
- G. S. Kopp and J. C. Lagarias, *Class Field Theory for Orders of Number Fields*, Theorems 1.1–1.3
  (ring class fields of arbitrary orders).
- D. A. Cox, *Primes of the Form x² + ny²*, §7 (Proposition 7.22) and §9 (Theorem 9.18): the
  quadratic case of ring class fields.
- A. Weil, *Sur la théorie du corps de classes*, J. Math. Soc. Japan 3 (1951); J. Tate, *Number
  theoretic background*, Corvallis, Part 2, §1: the local Weil group.
- F. K. Schmidt, *Mehrfach perfekte Körper*, Math. Ann. 108 (1933): a field henselian for two
  independent valuations is separably closed.
