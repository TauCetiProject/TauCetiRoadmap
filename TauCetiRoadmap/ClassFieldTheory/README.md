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
consumed here by name (§3). The open targets are those listed under *Owned here* (§1): the
compatibility with the valuations of every finite algebra structure between nonarchimedean local
fields, which removes the compatibility hypothesis from Tau Ceti's local Euler characteristic and
cyclotomic normalization; the principal ideal theorem in its ideal-theoretic form; and the
conductor–discriminant formula. `Suggested.lean` states these targets and the names that the Lean
files of other roadmaps import from this one (§6).

## 1. Scope and ownership

### Owned here

The open targets, each stated in `Suggested.lean`:

1. **The comparison of valuations on finite extensions of local fields** (Layer 5):
   `valuativeExtension_of_finite`, that for nonarchimedean local fields `K` and `F` every finite
   `K`-algebra structure on `F` preserves and reflects the valuative relation
   (`ValuativeExtension K F`). Tau Ceti proves the local Euler characteristic and the cyclotomic
   normalization under that compatibility for `K = ℚ_p`; with `valuativeExtension_of_finite`,
   `eulerCharacteristic_mixed`, `eulerCharacteristic_finrank_fp` (Layer 5) and
   `cyclotomicCharacter_artinMap` (Layer 7) hold for every finite `F/ℚ_p`, and `Suggested.lean`
   closes them from it.
2. **Ideal-theoretic consequences of global class field theory** (Layer 13): the principal ideal
   theorem `isPrincipal_map_hilbertClassField` and the conductor–discriminant formula
   `relDiscr_eq_finprod_abelianConductor`.

The abstract and global quadratic Artin tests, the splitting criteria for ray class fields and for
the Hilbert class field, and the identification of the ring class field of the maximal order with
the Hilbert class field follow in a few lines from Tau Ceti's theorems; they are Checks (Layer 4,
Layer 11, Layer 13, §5.4), not targets.

### Already in the library

Everything else this roadmap develops is proved in the pinned Tau Ceti, and the exact declarations
are listed under §3 and in each layer:

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
  Frobenius, the maximal unramified extension and inertia, and the tame quotient. Its finite
  extensions carry the compatibility `ValuativeExtension K L` as part of their structure; that
  this compatibility is automatic for every finite algebra structure between nonarchimedean local
  fields is not supplied there and is the Layer 5 target here.
- `GlobalNumberFields` owns places, moduli, ray and narrow class groups, adeles, ideles, orders,
  `Pic` and `NarrowPic` (§3); `NumberFieldArithmetic` owns finite-place Frobenius and the
  ideal-theoretic Artin map.
- `QuadraticFormInvariants` owns the norm-equation and quaternion presentations of the local
  Hilbert symbol and proves that they agree with Tau Ceti's cohomological symbol
  `TauCeti.ClassFieldTheory.localSymbol` of Layer 5; `GlobalQuadraticForms` owns
  Hasse–Minkowski. The dependency runs `ClassFieldTheory → QuadraticFormInvariants`, never the
  reverse.

This roadmap therefore defines no modulus, ray-class carrier, idele carrier, order, Picard group,
local quadratic-form invariant or global quadratic form.

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
  Demushkin structure of local Galois groups;
- F. K. Schmidt's theorem that a field henselian for two independent nontrivial valuations is
  separably closed (Jahnke–Koenigsmann, *Definable henselian valuations*, Theorem 2.1, p. 3, whose
  proof cites Engler–Prestel, *Valued Fields*, Theorem 4.4.1), and the Krasner lemma over a
  henselian rank-one field that its proof uses, which is `LocalFieldsRamificationPartII` §4.1:
  both are valuation theory, and the comparison of Layer 5 is proved from discreteness and
  Hensel's lemma on `𝒪[K]` without either.

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
to live in one universe, and the coefficient ring of a formation is `ℤ`, so formations, class
formations and the arithmetic layers are at universe `0` (`G : Type`, `K : Type`). The generic
statements of Layer 0 hold over a coefficient ring `k` in any universe shared with the group, and
the comparison of valuations of Layer 5 holds for local fields in any universes.

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
separate arguments of `TauCeti.ClassFieldTheory.tateTheorem`, never a bundled class formation, so
that a layer satisfying
only some of them can still use the theorem. Nakayama's generalization (Ann. of Math. 65 (1957);
Milne, II Remark 3.12) replaces `ℤ` by a module `M` with `Tor₁(M, C) = 0` and gives
`Ĥʳ(Γ, M) ≃ Ĥʳ⁺²(Γ, M ⊗ C)`; this is the Tate–Nakayama theorem. The explicit map `Ĥ⁻² → Ĥ⁰` is
Artin–Tate's Nakayama map, `nakayamaNegTwo`.

The isomorphism is not an arbitrary equivalence of two groups: its underlying homomorphism is cup
product with the named class (`TauCeti.ClassFieldTheory.tateTheorem_toAddMonoidHom`), and for a
class formation with the fundamental class
(`TauCeti.ClassFieldTheory.ClassFormation.tateIso_toAddMonoidHom`).

### 2.5 The direction of reciprocity

At `r = -2` the canonical identifications `Ĥ⁻²(Γ, ℤ) ≃ Γ^ab` and `Ĥ⁰(Γ, C) ≃ A^U / N_{U/V}(A^V)`
turn Tate's theorem into the Nakayama map `nakayamaNegTwo : Γ^ab ≃ A^U / N(A^V)`. The Artin
equivalence is its inverse, `artinEquiv : A^U / N(A^V) ≃ Γ^ab`, and the Artin map `A^U → Γ^ab`
is the quotient map followed by `artinEquiv`, so its kernel is the norm subgroup. In Tau Ceti,
`artinEquiv` is defined as `nakayamaNegTwo.symm`, and
`TauCeti.ClassFieldTheory.ClassFormation.artinMap_apply` unfolds the Artin map. The
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
  abelianization of Mathlib's `Field.absoluteGaloisGroup`, and the two groups are compared by Tau
  Ceti's `TauCeti.absoluteGaloisGroupRestrictEquiv`, restriction from the algebraic closure to the
  separable closure.
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
`InfinitePlace.Completion`; cyclotomic fields and `cyclotomicCharacter`; the class group
`ClassGroup`; for the comparison of valuations, `ValuativeRel`, `ValuativeExtension`,
`IsNonarchimedeanLocalField`, `HenselianLocalRing` and the finiteness of the residue field of a
nonarchimedean local field; for the principal ideal theorem, `IsSepClosed.lift`, the
factorization `Ideal.map_algebraMap_eq_finsetProd_pow` of an extended prime, the comparison
`Ideal.ramificationIdx'_eq_ramificationIdx` of the two ramification indices and
`ClassGroup.mk0_eq_one_iff`; and, for the conductor–discriminant formula, the extension of
characters from a subgroup of a finite abelian group, `MonoidHom.domRestrict_surjective` and
`CommGroup.card_domRestrictHom_ker`, and the degree `IntermediateField.finrank_fixedField_eq_card`
of a fixed field.

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
| 5 | `GalRep`, `TauCeti.ClassFieldTheory.muNRep`, `kummerCoeffEquivMuNRep`, `TauCeti.ClassFieldTheory.muNRepEquivZMod`, `muNRepH1Equiv`, `kummerEquiv`, `kummerEquivOfCharZero`, `TauCeti.ClassFieldTheory.kummerClass`, `unitsRep`, `Br`, `invMap`, `brRes`, `brCor`, `invMap_brRes`, `invMap_brCor`, `TauCeti.herbrandQuotient_units_eq_finrank`, `TauCeti.TateCohomology.herbrandQuotient_unitFiltration_zero`, `TauCeti.index_normGroup_of_isCyclic`, `TauCeti.natCard_H2_units_dvd_finrank`, `h2MuEquivZMod`, `h2EquivZModOfMuNRepIso`, `TauCeti.ClassFieldTheory.kummerCupPairing`, `TauCeti.ClassFieldTheory.localSymbol`, `TauCeti.ClassFieldTheory.localSymbol_kummerClass_mul`, `TauCeti.ClassFieldTheory.localSymbol_kummerClass_eq_zero_of_add_eq_one`, `TauCeti.ClassFieldTheory.localSymbol_antisymm`, `TauCeti.ClassFieldTheory.localSymbol_eq_zero_iff_mem_normGroup`, `forall_localSymbol_kummerClass_eq_zero_iff`, `separatingRight_localSymbol`, `TauCeti.ClassFieldTheory.tateDual`, `TauCeti.ClassFieldTheory.muNRepToTateDual`, `TauCeti.ClassFieldTheory.tateDual_ρ_eq_self_iff`, `tateEvaluationPairing`, `TauCeti.ClassFieldTheory.tateDualMap_exact`, `TauCeti.ClassFieldTheory.tateDualityPairing`, `TauCeti.ClassFieldTheory.tateDualityPairing_perfect`, `TauCeti.ClassFieldTheory.finite_H`, `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`, `TauCeti.ClassFieldTheory.eulerCharacteristic_finrank_fp`, `TauCeti.FinitePadicExtension`, `TauCeti.algebraicExtensionValuativeRel`, `TauCeti.finiteExtension_isNonarchimedeanLocalField`, `TauCeti.algebraicExtensionValuation_isEquiv`, `TauCeti.normalizedValuation`, `TauCeti.henselianLocalRing_integer` |
| 6 | `unitsFormation`, `localClassFormation`, `localClassFormation_inv`, `brInfl`, `localFormationRestrict`, `localArtinEquiv`, `localArtinEquiv_eq_of_iota`, `TauCeti.ClassFieldTheory.localArtinMap`, `TauCeti.ClassFieldTheory.normResidue`, `TauCeti.ClassFieldTheory.localArtinMap_uniformizer`, `TauCeti.ClassFieldTheory.localArtinMap_eq_frobenius_pow_valuation`, `TauCeti.ClassFieldTheory.localArtinMap_unit_of_unramified`, `TauCeti.localNormQuotientEquivZModOfUnramified`, `TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_nontrivial_iff_not_norm`, `TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_hilbertSymbol`, `TauCeti.ClassFieldTheory.localArtinMap_cyclotomic_uniformizer`, `subsingleton_h3_unitsRep`, `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` |
| 7 | `TauCeti.ClassFieldTheory.artinMap`, `TauCeti.ClassFieldTheory.artinMap_restrict`, `TauCeti.ClassFieldTheory.artinMap_norm`, `TauCeti.ClassFieldTheory.artinMap_congr`, `continuous_artinMap`, `TauCeti.ClassFieldTheory.denseRange_artinMap`, `not_surjective_artinMap`, `geometricArtinMap`, `TauCeti.absoluteGaloisGroupExtend`, `AlgHom.restrictNormalHom`, `TauCeti.unramifiedCoordinate`, `TauCeti.unramifiedCoordinate_mk_eq_one_iff`, `TauCeti.unramifiedCoordinate_mk_eq_gen_iff`, `TauCeti.ClassFieldTheory.unramifiedCoordinate_artinMap`, `mem_inertiaSubgroup_of_mk_eq_artinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`, `conductorExponent`, `conductorIdeal`, `conductorExponent_le_iff`, `conductorExponent_eq_zero_iff`, `characterConductorExp`, `TauCeti.cyclotomicSymbol`, `TauCeti.realCyclotomicSymbol`, `TauCeti.prod_cyclotomicSymbol`, `TauCeti.cyclotomicSymbol_norm_fixes`, `localCyclotomicCharacter_artinMap_padic_uniformizer`, `localCyclotomicCharacter_artinMap_padic`, `localCyclotomicCharacter_artinMap_unit`, `localCyclotomicCharacter_artinMap_uniformizer` |
| 8 | `localNormSubgroup`, `isOpen_localNormSubgroup`, `finiteIndex_localNormSubgroup`, `localNormSubgroup_mono`, `localNormSubgroup_top`, `localNormSubgroup_maximalAbelianLayer`, `localNormSubgroup_inf_of_isAbelian`, `localNormSubgroup_sup`, `localAbelianExistence`, `localExistence`, `localAbelianExistence_primeToResidueCharacteristic`, `localClassField_unique`, `localClassField`, `localClassField_le_iff`, `localClassField_orderReversing`, `localClassFieldCorrespondence`, `localClassFieldCorrespondencePrimeToResidueCharacteristic`, `localAbelianGaloisEquiv`, `index_localNormSubgroup`, `localClassField_index`, `ker_artinMap_eq_iInf`, `injective_artinMap`, `profiniteCompletionArtinEquiv`, `conductorExponent_localClassField_le_iff` |
| 9 | `localWeilGroup`, `inertiaSubgroup_le_localWeilGroup`, `dense_localWeilGroup`, `localWeilGroup_ne_top`, `WeilGroup`, `weilToAbsolute`, `denseRange_weilToAbsolute`, `isOpen_inertia_weil`, `isOpenEmbedding_inertiaToWeil`, `weilTopology_unique`, `not_compactSpace_weilGroup`, `TauCeti.not_isOpen_inertiaSubgroup`, `weilDegree`, `surjective_weilDegree`, `ker_weilDegree`, `unramifiedCoordinate_weilDegree`, `weilTransfer`, `index_range_weilTransfer`, `weilDegree_weilTransfer`, `weilRestrict`, `range_weilTransfer_eq_ker_weilRestrict`, `localWeilArtinEquiv`, `localWeilArtinEquiv_compat`, `mem_range_artinMap_iff` |
| 10 | `globalFormation`, `ideleFormation`, `infiniteInvMap`, `infiniteClassFormation`, `infiniteArtinAt`, `character_infiniteArtinAt`, `infiniteArtinAt_rootsOfUnity_of_isReal`, `infiniteArtinAt_norm`, `finiteInvAt`, `infiniteInvAt`, `brauerSupport`, `sumLocalInv`, `brLocalization_injective`, `sumLocalInv_brLocalization_eq_zero`, `exists_br_of_sum_eq_zero`, `ideleToClassH2`, `classToMultiplicativeH3`, `range_ideleToClassH2`, `surjective_ideleToClassH2_of_isCyclic`, `subsingleton_h1_globalFormation`, `degree_le_natCard_normQuotient_of_isCyclic`, `natCard_H2_globalFormation_dvd_degree`, `ideleSumLocalInv`, `exists_refinement_ideleSumLocalInv_eq`, `exists_refinement_mem_range_ideleToClassH2`, `ideleSumLocalInv_eq_of_ideleToClassH2_eq`, `globalInv`, `globalInv_ideleToClassH2`, `globalInv_infl`, `globalInv_unique`, `globalInv_injective`, `range_globalInv` |
| 11 | `globalClassFormation`, `globalClassFormation_inv`, `ideleSumLocalInv_fundamentalClass`, `globalArtinEquiv`, `globalArtinMap`, `globalArtinMap_principal`, `globalArtinMap_comp`, `localArtinAt`, `globalArtinMap_local`, `primeIdeleClass`, `globalArtinMap_ideal`, `globalArtinMap_isArithFrobAt`, `TauCeti.decompositionRestrict`, `globalArtinMap_cyclotomic_prime`, `globalArtinMap_Qi_prime`, `globalArtinMap_zeta5_two` |
| 12 | `globalNormSubgroup`, `isOpen_globalNormSubgroup`, `finiteIndex_globalNormSubgroup`, `globalNormSubgroup_mono`, `globalNormSubgroup_top`, `globalNormSubgroup_maximalAbelianLayer`, `exists_abelianLayer_globalNormSubgroup_eq_of_le`, `exists_abelianLayer_globalNormSubgroup_eq_of_comap_ideleClassNorm`, `exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem`, `kummerLayer`, `auxiliaryKummerIdeleSubgroup`, `degree_kummerLayer_sUnits`, `globalNormSubgroup_kummerLayer_sUnits`, `globalAbelianExistence`, `globalExistence`, `globalClassField_unique`, `globalClassField`, `globalClassFieldCorrespondence`, `globalClassField_le_iff`, `globalClassField_orderReversing`, `globalNormSubgroup_inf_of_isAbelian`, `globalNormSubgroup_sup`, `globalAbelianGaloisEquiv`, `index_globalNormSubgroup`, `globalClassField_index`, `TauCeti.ClassFieldTheory.card_ideleClassNormQuotient`, `IsAdmissibleModulus`, `IsAdmissibleModulus.mem_support_of_ramified`, `abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd`, `not_isAdmissibleModulus_one_Qi`, `rayClassArtinMap`, `rayClassArtinMap_idealClass`, `rayClassArtinMap_surjective`, `TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap` |
| 13 | `TauCeti.ClassFieldTheory.cyclicHasseNorm`, `TauCeti.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere`, `TauCeti.GlobalNumberFields.IsFiniteLocalNorm`, `TauCeti.GlobalNumberFields.IsInfiniteLocalNorm`, `TauCeti.GlobalNumberFields.IsLocalNormEverywhere`, `TauCeti.GlobalNumberFields.isInfiniteLocalNorm_of_isComplex`, `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`, `TauCeti.GlobalNumberFields.unitEmbedding_mem_range_ideleNormMap_iff`, `rayNormSubgroup`, `rayClassField`, `hilbertClassField`, `narrowHilbertClassField`, `isAdmissibleModulus_iff_le_rayClassField`, `gal_rayClassField_equiv_rayClassGroup`, `rayClassArtinEquiv`, `hilbertClassArtinEquiv`, `fieldRange_le_hilbertClassField_iff`, `isUnramifiedAt_hilbertClassField`, `kroneckerWeber`, `isLeast_absNorm_abelianConductor_finitePart`, `absNorm_abelianConductor_finitePart_mod_four_ne_two`, `ringClassIdeleQuotient`, `ringClassNormSubgroup`, `TauCeti.ClassFieldTheory.ringClassField`, `TauCeti.ClassFieldTheory.ringClassArtinMap`, `TauCeti.ClassFieldTheory.ringClassArtinEquiv`, `TauCeti.ClassFieldTheory.ringClassArtinMap_eq_one_iff`, `isUnramifiedAt_ringClassField`, `ncard_primesOver_ringClassField_eq_finrank_iff`, `ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one`, `ker_ringClassIdeleQuotient_maximalNumberFieldOrder`, `TauCeti.ClassFieldTheory.ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, `TauCeti.LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent`, `TauCeti.relDiscr`, `TauCeti.multiplicity_relDiscr`, `conductorExponent_fixedField_ker`, `IsAdmissibleModulus.conductorExponent_le_exponent`, `isAdmissibleModulus_abelianConductor`, `isAdmissibleModulus_rayClassField`, `rayClassArtinEquiv_apply`, `TauCeti.GlobalNumberFields.isCongrOne_one`, `TauCeti.GlobalNumberFields.idealClass_eq_one_iff`, `TauCeti.GlobalNumberFields.NumberFieldOrder`, `TauCeti.GlobalNumberFields.maximalNumberFieldOrder`, `TauCeti.GlobalNumberFields.Pic`, `TauCeti.GlobalNumberFields.Modulus`, `TauCeti.GlobalNumberFields.integralIdealsPrimeTo`, `TauCeti.GlobalNumberFields.idealClass`, `TauCeti.ClassFieldTheory.LayerRestriction.groundInclusion_apply_coe`, `TauCeti.ClassFieldTheory.globalGroundEquiv`, `TauCeti.ClassFieldTheory.globalGroundEquiv_mk`, `TauCeti.ClassFieldTheory.ideleClassLevelEquiv_mk`, `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField`, `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_coe`, `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_ideleExtension`, `TauCeti.ClassFieldTheory.NormalLayer.ideleClassLevelEquiv_mem_normSubgroup_iff`, `TauCeti.ClassFieldTheory.range_ideleClassNormMap_rayClassField`, `TauCeti.GlobalNumberFields.ideleExtension`, `TauCeti.GlobalNumberFields.ideleExtension_comp`, `TauCeti.GlobalNumberFields.ideleFiniteCoord_ideleExtension`, `TauCeti.GlobalNumberFields.range_ideleClassNormMap_eq_of_algEquiv`, `TauCeti.GlobalNumberFields.ker_rayClassQuotient`, `TauCeti.GlobalNumberFields.rayClassQuotient_mk_of_mem`, `TauCeti.GlobalNumberFields.ideleCongrOneSubgroup_one`, `TauCeti.GlobalNumberFields.oneEquivClassGroup_rayClassMk`, `NumberField.IdeleGroup.ofFiniteIdele`, `IsDedekindDomain.FiniteAdeleRing.toFractionalIdeal_surjective`, `IsDedekindDomain.FiniteAdeleRing.count_coe_toFractionalIdeal`, `IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionExtension`, `IsDedekindDomain.HeightOneSpectrum.differentExponent_adicCompletion_eq_multiplicity_differentIdeal`, `IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_adicCompletionIntegers_eq_multiplicity_asIdeal`, `IsDedekindDomain.HeightOneSpectrum.finrank_residueField_adicCompletion`, `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`, `IsDedekindDomain.HeightOneSpectrum.decompositionEquiv`, `IsDedekindDomain.HeightOneSpectrum.isAbelianGalois_adicCompletion`, `IsDedekindDomain.HeightOneSpectrum.continuous_decompositionHom`, `IsDedekindDomain.HeightOneSpectrum.decompositionHom_algebraMap`, `IsDedekindDomain.HeightOneSpectrum.card_stabilizer_eq_finrank_adicCompletion`, `IsDedekindDomain.HeightOneSpectrum.finrank_adicCompletion_fixedField`, `IsDedekindDomain.HeightOneSpectrum.completionAlgHom`, `IsDedekindDomain.HeightOneSpectrum.completionAlgHom_comp`, `IsDedekindDomain.HeightOneSpectrum.algebraMap_eq_completionAlgHom`, `IsDedekindDomain.HeightOneSpectrum.continuous_completionAlgHom`, `AlgEquiv.normGroup_eq`, `TauCeti.pow_finrank_mem_normGroup`, `TauCeti.GlobalNumberFields.ideleCongruenceSubgroup.ideleFiniteCoord_mem_unitFiltration`, `TauCeti.mem_range_normUnits_adicCompletion_iff`, `TauCeti.mem_range_normUnits_completion_iff`, `TauCeti.mem_range_normUnits_completion_of_finrank_eq_one`, `TauCeti.mem_range_normUnits_completion_of_isComplex` |
| 14 | `TauCeti.ClassFieldTheory.finiteHilbertInvariantAt`, `TauCeti.ClassFieldTheory.infiniteHilbertInvariantAt`, `TauCeti.ClassFieldTheory.finiteHilbertSupport`, `TauCeti.ClassFieldTheory.hilbertProductFormula`, `sum_finiteHilbertInvariantAt_add_sum_infiniteHilbertInvariantAt_eq_zero_iff` |

### From TauCetiRoadmap.GlobalNumberFields

| Use here | Supplier section or layer | Tau Ceti declarations used |
|---|---|---|
| moduli, ray subgroups and ray class groups (Layers 12–13) | Layer 2 | `TauCeti.GlobalNumberFields.Modulus`, `TauCeti.GlobalNumberFields.integralIdealsPrimeTo`, `TauCeti.GlobalNumberFields.idealClass`, `TauCeti.GlobalNumberFields.oneEquivClassGroup_rayClassMk` |
| the fractional ideal of a finite idele (Layer 13) | Layer 4 | `IsDedekindDomain.FiniteAdeleRing.toFractionalIdeal_surjective`, `IsDedekindDomain.FiniteAdeleRing.count_coe_toFractionalIdeal` |
| ideles, idele classes, their extensions and norms (Layers 10–13) | Layers 6 and 8 | `TauCeti.GlobalNumberFields.ideleNormMap`, `TauCeti.GlobalNumberFields.ideleClassNormMap`, `TauCeti.GlobalNumberFields.ideleExtension`, `TauCeti.GlobalNumberFields.ideleExtension_comp`, `TauCeti.GlobalNumberFields.ideleFiniteCoord_ideleExtension`, `TauCeti.GlobalNumberFields.range_ideleClassNormMap_eq_of_algEquiv`, `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff` |
| congruence subgroups and the ray class of an idele class (Layer 13) | Layer 7 | `TauCeti.GlobalNumberFields.ideleCongrOneSubgroup_one`, `TauCeti.GlobalNumberFields.ideleCongruenceSubgroup.ideleFiniteCoord_mem_unitFiltration`, `TauCeti.GlobalNumberFields.rayClassQuotient_mk_of_mem`, `TauCeti.GlobalNumberFields.ker_rayClassQuotient` |
| orders and Picard groups (Layer 13) | Layer 11 | `TauCeti.GlobalNumberFields.NumberFieldOrder`, `TauCeti.GlobalNumberFields.maximalNumberFieldOrder`, `TauCeti.GlobalNumberFields.Pic` |

That roadmap is complete and implemented in Tau Ceti; this roadmap uses its carriers through the
Tau Ceti declarations listed and imports nothing from its `Suggested.lean`. No other roadmap
supplies a target of this roadmap: everything the open targets need is in Mathlib or Tau Ceti.

## 4. How to read the build

`README.md` is normative and `Suggested.lean` states the open targets and the imported names. Each
layer below summarizes the mathematics of the layer that Tau Ceti proves at the pin, whose exact
declarations are the §3 row of the layer, states the open targets of the layer, if any, each with
its route and a *Needs:* line, and ends with its examples and its dependencies. The layer order is
the dependency order: a layer uses Mathlib, Tau Ceti, `GlobalNumberFields` and earlier layers
only. `Suggested.lean` imports `Mathlib` and individual `TauCeti.*` modules and no roadmap; it
states the open targets with `sorry`, closes the three theorems of §1 item 1 from
`valuativeExtension_of_finite`, and keeps the names of §6 that other roadmaps' Lean files import,
with no `sorry` definition and none of the Checks.

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

`LocalGaloisGroups` uses the last two as Tau Ceti's `Rep.projective_ker_of_isZero_res` and
`TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`.

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
every subgroup of a layer as separate theorems (§3, Layer 2).

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
invariants, corestriction preserves them, inflation of the fundamental class is scaled.

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
Layers 8 and 12 to state existence with an abelian layer.

### Examples

- The trivial layer `U/U`: the Artin map is zero and the equivalence it induces is between trivial
  groups (`TauCeti.ClassFieldTheory.ClassFormation.artinMap_trivialLayer`), but its source, the
  ground level, need not be trivial. For `ℚ₂/ℚ₂` the source is `ℚ₂ˣ`, in which `1 ≠ 2`; the norm
  is the identity, the norm quotient has one element, and both `1` and `2` map to `0`.
- The quadratic test: in a layer of degree `2` and for `σ ≠ 0` in `(U/V)^ab`,
  `cf.artinMap L a = σ` exactly when `a ∉ L.normSubgroup F`, because `(U/V)^ab` has two elements
  and the kernel is the norm subgroup
  (`TauCeti.ClassFieldTheory.ClassFormation.artinMap_eq_zero_iff`,
  `TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean`); Tau Ceti's local instance is
  `TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_nontrivial_iff_not_norm`.
- A cyclic layer: the Artin symbol of `a` generates `Γ` exactly when the class of `a` generates
  the norm quotient (`TauCeti.ClassFieldTheory.ClassFormation.isGenerator_artinMap_iff`).

### Dependencies

Layer 3.

## Layer 5: local coefficients, the Brauer group, the local invariant, and duality

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
  pairing; finiteness of `H⁰`, `H¹`, `H²` of a finite smooth discrete `A : GalRep n F` whose
  exponent is invertible, `(n : F) ≠ 0` (`TauCeti.ClassFieldTheory.finite_H`; Milne, *Arithmetic
  Duality Theorems*, I Corollary 2.3, p. 28), which over a finite extension of `ℚ_p` admits every
  `n ≠ 0`, `p`-power exponents included; perfectness of the duality pairing under the same
  hypothesis; and the identification of the `(1, 1)` pairing at `μ_n` with the Hilbert pairing
  through `μ_n ≅ Hom(μ_n, μ_n)`;
- **the Euler characteristic** `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`, with its `𝔽_p`-rank form
  (Milne, *Arithmetic Duality Theorems*, I Theorem 2.8, p. 31), for `F` a
  `TauCeti.FinitePadicExtension F p`, which bundles a finite `ℚ_p`-algebra structure whose
  valuation extends that of `ℚ_p`.

The finiteness, duality and Euler-characteristic statements need the module `A` to be finite,
discrete and smooth (`TauCeti.IsSmoothDiscrete`: the topology is discrete and every point
stabilizer is open). Tau Ceti proves smoothness at `muNRep n F`
(`TauCeti.ClassFieldTheory.isSmoothDiscrete_muNRep`) and at the trivial module `𝔽_p`
(`TauCeti.isSmoothDiscrete_trivialFp`), and supplies it at the Tate dual of a finite smooth module
by instance search (`TauCeti.ClassFieldTheory.instFactIsSmoothDiscreteTateDual`).

**Definitions on Tau Ceti's carriers.** Four names of this layer that `LocalGaloisGroups` cites
(§6) are definitions built from Tau Ceti's declarations rather than abbreviations of them.

- Define `kummerEquiv_mixed p F n hn`, for a field `F` with a finite `ℚ_p`-algebra structure and
  `n ≠ 0`, as Tau Ceti's Kummer equivalence `Fˣ / (Fˣ)ⁿ ≃ H¹(G_F, μ_n)` in characteristic zero
  (`TauCeti.ClassFieldTheory.kummerEquivOfCharZero`); `F` has characteristic zero because
  `ℚ_p → F` is injective.
  - It sends the power class of `a ∈ Fˣ` to the Kummer class of `a`
    (`TauCeti.ClassFieldTheory.kummerEquivOfCharZero_ofMul_mk`), which for an `n`-th root `α` of
    `a` in `Fˢ` is the class of the cocycle `g ↦ g(α)/α`
    (`TauCeti.ClassFieldTheory.kummerClass_eq_muNRepH1Equiv_kummerCocycleClass`).

  **Checks.**
  - Over `ℚ₂` at `n = 2` both sides have `8` elements, `ℚ₂ˣ/(ℚ₂ˣ)²` being generated by the
    classes of `-1`, `2` and `5`: an equivalence stated only for `n` prime to `p` misses this case.
  - Over `ℚ₂` at `n = 2`, the class of `-7` is trivial, since `-7 ≡ 1 mod 8` is a square in `ℚ₂`,
    although `-7` is not a square in `ℚ`; the class of `-1` is not, its cocycle sending an
    automorphism with `i ↦ -i` to `-1`.
  - Over `ℚ₃` at `n = 2` both sides have `4` elements, and at `n = 1` one element.
- Define `h2MuEquivZMod_mixed p F n hn`, for a nonarchimedean local field `F` with a finite
  `ℚ_p`-algebra structure and `n ≠ 0`, as Tau Ceti's invariant `H²(G_F, μ_n) ≃ ℤ/n`
  (`TauCeti.ClassFieldTheory.h2MuEquivZMod`) at `n`, a unit of `F` because `F` has characteristic
  zero.
  - Followed by `ℤ/n → ℚ/ℤ`, `1 ↦ 1/n`, it is the local Brauer invariant of the image of the class
    in `Br F` (`TauCeti.ClassFieldTheory.toRatAddCircle_h2MuEquivZMod`).

  **Checks.**
  - Over `ℚ₂` at `n = 1, 2, 3`, `H²(G_{ℚ₂}, μ_n)` has `1, 2, 3` elements.
  - Over `ℚ₂` at `n = 2`, the cup square of the Kummer class of `-1`, the class of the Hamilton
    quaternions over `ℚ₂`, has Brauer invariant `1/2` and maps to `1`.
  - Over `ℚ₇` at `n = 3`, the class of Brauer invariant `1/3` maps to `1`; the other equivalence
    `H²(G_{ℚ₇}, μ₃) ≃ ℤ/3` sends it to `2`, so the normalization by the invariant is what fixes the
    map.
- Define `h2FpEquivZMod_of_mu p F T e`, for `F` as above, `T : GalRep p F` and an isomorphism
  `e : μ_p ≅ T` of Galois modules, as Tau Ceti's transport of the invariant of `H²(G_F, μ_p)` along
  `e` (`TauCeti.ClassFieldTheory.h2EquivZModOfMuNRepIso`).
  - It is an equivalence `H²(G_F, T) ≃ ℤ/p` that depends on `e`; without an identification of `T`
    with `μ_p` the statement is false.

  **Checks.**
  - At `T = μ_p` with `e` the identity, it is the invariant of `H²(G_F, μ_p)` of the previous
    definition at `n = p`.
  - For the zero module no `e` exists, `μ_p(Fˢ)` having `p` elements, and `H²` of the zero module
    is `0`, which has no equivalence with `ℤ/p`.
  - At `p = 3`, composing `e` with inversion on `μ₃` negates the equivalence, so `e` is data and
    not a mere existence statement.
- Define `kummerCupPairing ζ hζ`, for a primitive `n`-th root of unity `ζ ∈ F`, as Tau Ceti's
  pairing `μ_n × μ_n → μ_n`, `(x, y) ↦ log_ζ(x) · y` (`TauCeti.ClassFieldTheory.kummerCupPairing`)
  when `n ≠ 0`, and as the zero pairing at `n = 0`, a value fixed only to make the definition
  total.
  - `kummerCupPairing_bil`: for `n ≠ 0` its bilinear map is `(x, y) ↦ log_ζ(x) · y`, with `log_ζ`
    the coordinate `muNRepEquivZMod ζ hζ`.

  **Checks.**
  - At `n = 2` and `ζ = -1`: `(-1, -1) ↦ -1`, in coordinates `1 · 1 = 1`, and `(1, y) ↦ 1`, in
    coordinates `0 · y = 0`; the zero pairing would send `(-1, -1)` to `1`.
  - Over `ℚ₇`, which contains the cube roots of unity as `7 ≡ 1 mod 3`, at `n = 3`: `(ζ, ζ) ↦ ζ`
    for the primitive root `ζ`, and `(ζ, ζ) ↦ ζ²` for the primitive root `ζ²`, since
    `log_{ζ²}(ζ) = 2`; so the root is part of the data.
  - At `n = 1` the pairing is trivial, `μ₁` being trivial.

**The local symbol and the Hilbert pairing.** Tau Ceti's local symbol
`TauCeti.ClassFieldTheory.localSymbol P tr x y`, for a pairing `P : μ_n × μ_n → μ_n` and an
equivalence `tr : H²(G_F, μ_n) ≃ ℤ/n`, is the cup product of `x, y ∈ H¹(G_F, μ_n)` along `P`,
followed by `tr` (`TauCeti.ClassFieldTheory.localSymbol_apply`). For `n ≠ 0` and a primitive
`n`-th root of unity `ζ ∈ F`, the map
`TauCeti.ClassFieldTheory.muNRepToTateDual ζ : μ_n → Hom(μ_n, μ_n)`,
`x ↦ (y ↦ log_ζ(x) · y)`, is bijective (`TauCeti.ClassFieldTheory.bijective_muNRepToTateDual`),
and through it the `(1, 1)` local duality pairing at `μ_n` is the local symbol at the Kummer cup
pairing of `ζ` (`TauCeti.ClassFieldTheory.tateDualityPairing_muNRepToTateDual`).

**Checks.**
- Over `ℚ₂`, at the Kummer cup pairing of `ζ = -1` and the invariant of `H²(G_{ℚ₂}, μ₂)`, the
  symbol of the Kummer classes of `-1` and `-1` is `1`, the Hamilton quaternions being ramified at
  `2`.
- With the same data, the symbol of the Kummer classes of `5` and `-1` is `0`, since `5 = 1² + 2²`
  is a norm from `ℚ₂(i)`.
- At the zero pairing every value is `0`, so the pairing is part of the data.
- At `n = 2`, `ζ = -1`: `TauCeti.ClassFieldTheory.muNRepToTateDual (-1)` sends `-1` to the
  identity of `μ₂` and `1` to the trivial homomorphism, a bijection of two-element sets;
  `x ↦ (y ↦ y)` for every `x` would not be injective.

**Open target: the comparison of valuations.** Tau Ceti's Euler characteristic, and the
cyclotomic normalization of Layer 7, assume that the `ℚ_p`-algebra structure of `F` is compatible
with the valuations. The target below shows that the compatibility is automatic.

- `valuativeExtension_of_finite`: for nonarchimedean local fields `K` and `F` and a finite
  `K`-algebra structure on `F` (`[Algebra K F] [Module.Finite K F]`), `ValuativeExtension K F`,
  that is `algebraMap K F a ≤ᵥ algebraMap K F b ↔ a ≤ᵥ b`: the algebra map preserves and reflects
  the valuative relation. Continuity of the algebra map is not assumed; it follows. The statement
  claims nothing about normalized valuations, which differ by the ramification index. Route,
  using only discreteness: let `w` be the normalized valuation of `F` (`ℤ`-valued, `1` on a
  uniformizer) read on `K` through the algebra map, `q` the residue cardinality and `p` the
  residue characteristic of `K`, and `ℓ ≠ p` a prime. For a unit `u` of `𝒪[K]`,
  `u^{q-1} ≡ 1` modulo the maximal ideal, so for every `k` the polynomial `X^{ℓ^k} - u^{q-1}`,
  whose derivative at `1` is the unit `ℓ^k`, has `1` as a simple root modulo the maximal ideal
  and hence a root in the complete discrete valuation ring `𝒪[K]` (Milne, *Algebraic Number
  Theory*, v3.08, Proposition 7.31, p. 120: a simple root modulo the uniformizer lifts); hence
  `(q - 1) · w(u)` is divisible by every `ℓ^k`, and `w(u) = 0`. A uniformizer `ϖ` of `K` has
  `w(ϖ) ≥ 0`, as `ϖ = (1 + ϖ) - 1` with `1 + ϖ` a unit. If `w(ϖ) = 0`, then `w` vanishes on
  `Kˣ`, and then on `Fˣ`: for `α ∈ Fˣ` with minimal polynomial `Xⁿ + c_{n-1}X^{n-1} + … + c₀`
  over `K`, the ultrametric inequality excludes `w(α) < 0`, where `αⁿ` would dominate, and
  `w(α) > 0`, where `c₀ ≠ 0` would; this contradicts the nontriviality of the valuation of `F`.
  So `w = w(ϖ) · v_K` on `Kˣ` with `w(ϖ) > 0`, which is the claim.
  *Needs:* `TauCeti.normalizedValuation`
  (`TauCeti/NumberTheory/LocalField/NormalizedValuation.lean`); the henselian property of
  `𝒪[K]`, Tau Ceti's instance `TauCeti.henselianLocalRing_integer`
  (`TauCeti/NumberTheory/LocalField/Henselian.lean`); finiteness of the residue field of `K`,
  which Mathlib proves for every `IsNonarchimedeanLocalField`.
  *Checks:* `F = K` with the identity; `F = ℚ₂(i)` over `ℚ₂`, where the normalized valuation of `F`
  gives `2` the value `2` and that of `ℚ₂` the value `1`, while both relations put `2` strictly
  below `1` (`2 ≤ᵥ 1` and not `1 ≤ᵥ 2`), and every unit of `ℤ₂`, `-3` included, is a `3^k`-th
  power for every `k`, so `w(-3) = 0` as the route says; the route needs `ℓ ≠ p`, since at
  `ℓ = p = 2` the unit `3 ≡ 3 mod 8` is not even a square in `ℚ₂`; the purely inseparable
  structure `t ↦ t^p` on `F = 𝔽_p((t))` over `K = 𝔽_p((t))`, of degree `p`, where `w(t^p) = p > 0`,
  so separability is not needed; and `F` with the trivial valuative relation, where
  `1 ≤ᵥ algebraMap K F ϖ` holds although `1 ≤ᵥ ϖ` fails in `K`, which
  `IsNonarchimedeanLocalField F`, asking for a nontrivial valuation, excludes.

With `valuativeExtension_of_finite` at `K = ℚ_p`, `eulerCharacteristic_mixed` and
`eulerCharacteristic_finrank_fp` state Tau Ceti's two formulas for a nonarchimedean local field
`F` with a finite `ℚ_p`-algebra structure and no compatibility hypothesis, and `Suggested.lean`
closes them from it.
*Needs:* `valuativeExtension_of_finite`; `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`,
`TauCeti.ClassFieldTheory.eulerCharacteristic_finrank_fp`
(`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean`).

### Examples

- The Euler characteristic `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`: for `ℚ_p` with `ℤ/p`, `p` odd,
  `#H⁰ = p`, `#H² = #μ_p(ℚ_p) = 1` and `#H¹ = p² = p · 1 · p`; for `ℚ₂` with `ℤ/2`,
  `8 = 2 · 2 · 2`; for `ℚ_p` with `ℤ/ℓ` and `ℓ ∤ p(p - 1)`, `ℓ = ℓ · 1 · 1`.
- Over `ℚ₂`, let `A = ℤ/3` with Frobenius acting by `-1`, the nontrivial unramified action. Then
  `#H⁰(A) = 1`. Frobenius acts on `μ₃` by squaring, also `-1`, so `A ≅ μ₃` and its dual
  `Hom(A, μ₃)` is trivial: `#H⁰(Aᴰ) = 3`. For the trivial `A = ℤ/3` the counts are reversed,
  `#H⁰(ℤ/3) = 3` and `#H⁰(μ₃) = 1`. Both agree with duality, `#H²(A) = #H⁰(Aᴰ)`:
  `#H²(μ₃) = 3` and `#H²(ℤ/3) = 1`. The nontrivial `A` admits no filtration with trivial
  quotients, so the Euler characteristic is not reached by dévissage to trivial modules; Tau
  Ceti's proof passes through induced modules and Shapiro's lemma.
- Finiteness needs `(n : F) ≠ 0`. Over `F = 𝔽₂((t))` with `A = 𝔽₂` trivial,
  `H¹ = F / {x² - x : x ∈ F}` by Artin–Schreier theory, and it is infinite: a nonzero `x² - x` of
  negative valuation has even pole order, so `t⁻¹, t⁻³, t⁻⁵, …` are independent. There `n = 2`
  vanishes in `F` and is excluded; over `ℚ₂` the same `A` has `#H⁰, #H¹, #H² = 2, 8, 2`.
- The norm criterion at `n = 2` over `ℚ₂`: `5 = 1² + 2²` is a norm from `ℚ₂(i)` and `(5, -1)₂ = 1`.

### Dependencies

Layer 0; Tau Ceti's local fields, Kummer theory and internal homs; Mathlib's valuations and
henselian local rings.

## Layer 6: the local class formation and finite local reciprocity

Tau Ceti builds the formation of `(Kˢ)ˣ` (`unitsFormation`) and the local class formation with
`invMap` as its invariant (`localClassFormation_inv`), identifies the restriction of the formation
of `K` to `G_L` with the formation of `L`, and transports the abstract Artin equivalence to
`localArtinEquiv : Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)^ab`, independent of the embedding, with
`TauCeti.ClassFieldTheory.normResidue` its multiplicative form (§3, Layer 6). It proves the
unramified normalization `Art(π) = Frob_arith` and `Art(x) = Frob_arith^{v(x)}`, the quadratic
tests, the comparison of the quadratic Artin symbol with the local symbol at
`kummerCupPairing (-1)`, and the cyclotomic value `Art(π)(ζ_m) = ζ_m^q` for `m` prime to the
residue cardinality `q`. It proves
`H³(G_K, (Kˢ)ˣ) = 0` and `cd_ℓ G_K = scd_ℓ G_K = 2` for every prime `ℓ` when `K` has
characteristic zero (NSW (7.1.8), (7.2.5)); in characteristic `p`, `cd_p G_K = 1`. This roadmap
re-exports `scd_p_absoluteGaloisGroup_eq_two`.

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
Galois extension gives the finite map (`TauCeti.ClassFieldTheory.artinMap_restrict`, against
`AlgHom.restrictNormalHom`); its unramified coordinate `TauCeti.unramifiedCoordinate` is the
normalized valuation (`TauCeti.ClassFieldTheory.unramifiedCoordinate_artinMap`); and the image of
a lift of `Art_L(x)` under `absoluteGaloisGroupExtend` is `Art_K(N_{L/K} x)`
(`TauCeti.ClassFieldTheory.artinMap_norm`).
It proves naturality in the field, continuity, dense image and non-surjectivity, that every lift
of `Art(u)` for a unit lies in inertia and every lift of `Art(π)` is an arithmetic Frobenius lift,
the conductors with minimality and the unramified criterion, and the cyclotomic normalization:
the explicit cyclotomic symbols over `ℚ` and their product formula (Milne, *Class Field Theory*,
VII Example 8.2), `χ_cyc(Art_{ℚ_p}(p)) = 1`, `χ_cyc(Art_{ℚ_p}(u)) = u⁻¹`, and
`χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)⁻¹` when the valuation of `F` extends that of `ℚ_p`.

This roadmap re-exports `artinMap`, `absoluteGaloisGroupExtend`,
`cyclotomicCharacter_artinMap_padic` and `cyclotomicCharacter_artinMap_padic_uniformizer`.

**Restriction to a finite Galois extension.** For a finite Galois extension `L/K` embedded in
`Kˢ` by `iota`, the restriction `G_K → Gal(L/K)` against which
`TauCeti.ClassFieldTheory.artinMap_restrict` states its equation is Tau Ceti's
`AlgHom.restrictNormalHom iota`, applied after the comparison
`TauCeti.absoluteGaloisGroupRestrictEquiv` of Mathlib's absolute Galois group with Tau Ceti's
separable-closure group. It is the group homomorphism characterized by `iota(σ|_L(x)) = σ(iota(x))`
for every `x ∈ L` (Tau Ceti's `AlgHom.restrictNormalHom_commutes`).

**Checks.**
- For `ℚ(i)/ℚ`, an automorphism acting on `iota(i)` by complex conjugation restricts to `i ↦ -i`,
  and the identity restricts to the identity.
- For `L = K` the target is the trivial group.
- For the splitting field `L` of `X³ - 2` over `ℚ`, replacing `iota` by `iota ∘ τ` for an
  automorphism `τ` of `L` conjugates the restriction by `τ`: an element of `G_ℚ` fixing `iota(∛2)`
  but not `iota(ζ₃)` restricts along `iota` to the transposition fixing `∛2`, and along `iota ∘ τ`,
  for `τ` moving `∛2`, to a transposition that moves `∛2`; so the embedding is part of the data.

**The cyclotomic normalization for every finite `F/ℚ_p`.** `cyclotomicCharacter_artinMap` states
`χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)⁻¹` for a unit `u` and a lift `σ` of `Art_F(u)`, with no
compatibility hypothesis between the valuations, which is how `LocalGaloisGroups` consumes it.
At `ℚ_p` the normalization is Milne, *Class Field Theory*, VII Example 8.2, pp. 221–222: the local
Artin symbol at `ℓ` of `a = u ℓ^s` acts on `ℚ(ζ_{ℓ^r})` as `[u⁻¹]`. Norm functoriality
(`TauCeti.ClassFieldTheory.artinMap_norm`) carries it to `F`; that example fixes the
normalization at `ℚ_p` and does not supply the compatibility of the valuations, which is
`valuativeExtension_of_finite` at `K = ℚ_p` (Layer 5). `Suggested.lean` closes the statement
from it and `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit`
(`TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean`).
*Needs:* `valuativeExtension_of_finite`;
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit`.

### Examples

- At `p = 2`: `χ_cyc(Art(-1)) = -1` and `χ_cyc(Art(-3)) = 5` on `μ₁₆` (without the inverse it
  would be `13`).
- For `K = ℚ₂(i)` and `u = i`: `N(i) = 1`, so `Art(i)` acts trivially on the `2`-power roots of
  unity.

### Dependencies

Layers 5 and 6.

## Layer 8: separate arithmetic local existence and the local class-field correspondence

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

## Layer 10: global carriers, the Brauer sequence, and the sum of local invariants

Tau Ceti builds the idele and idele-class formations of a number field, the archimedean Brauer
groups and invariants (the real one of order two, the complex one trivial), the archimedean class
formations and Artin maps with their character formula, and the exact sequence
`0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0` in invariant coordinates, exact at all three places (§3,
Layer 10; Milne, *Class Field Theory*, VIII Theorem 4.2, p. 241). It proves the first and second
fundamental inequalities (Milne, VII §4, p. 210, and §5, p. 212) and `H¹`-vanishing for idele
classes, and defines the global invariant on every idele-class layer class: the lift to the idele
layer is
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
trivial on principal ideles (Milne, *Class Field Theory*, VII Theorem 8.1, p. 221), compatible
with towers and with every local Artin map through the
decomposition group, agrees with the ideal-theoretic Artin map at every unramified prime, and is
normalized by arithmetic Frobenius (§3, Layer 11). It proves the cyclotomic test
`Art((ℓ))(ζ_m) = ζ_m^ℓ` and its instances for `ℚ(i)` and `ℚ(ζ₅)`.

### Examples

- The quadratic splitting test: for a quadratic extension `L/K`, a finite prime `v` of `K`
  unramified in `L` and a prime `Q` of `L` above it, the Artin symbol of the prime idele class at
  `v` is the nontrivial automorphism exactly when `Q` has residue degree `2`. It follows from
  `TauCeti.ClassFieldTheory.globalArtinMap_isArithFrobAt`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/LocalArtin/Frobenius.lean`), since an arithmetic
  Frobenius at an unramified `Q` has order the residue degree (Milne, *Class Field Theory*, V §1,
  pp. 152–154).

- `ℚ(i)/ℚ`: `3` is inert (`i³ = -i`) and `5` splits, so `Art((3))` is complex conjugation and
  `Art((5)) = 1` (`TauCeti.ClassFieldTheory.globalArtinMap_Qi_prime`).
- `ℚ(√5)/ℚ`: `11` and `19` split, `2` and `7` are inert; equivalently, the restriction to
  `ℚ(√5)` of the cyclotomic symbol of `(ℓ)` in `ℚ(ζ₅)` is trivial exactly when `ℓ` is a square
  modulo `5`.
- `ℚ(ζ₅)/ℚ`: `Art((2))(ζ₅) = ζ₅²`, of order four, `Art((3))(ζ₅) = ζ₅³`, `Art((11))(ζ₅) = ζ₅`;
  `ℚ(ζ₈)/ℚ`: `Art((3))`, `Art((5))`, `Art((7))` send `ζ₈` to `ζ₈³`, `ζ₈⁵`, `ζ₈⁷`.

### Dependencies

Layers 1–4, 6, 7, 10.

## Layer 12: separate arithmetic global existence, the norm index, and the global correspondence

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
1.1–1.3, pp. 3–4, where the ring class field of `O` is the ray class field of `O` at the modulus
`O` with no real places). This roadmap re-exports the Hasse norm theorem, the local-norm
predicates and the idele norms.

**Open targets.**

- **The principal ideal theorem.** `isPrincipal_map_hilbertClassField`: every ideal of `𝓞 K`
  becomes principal in the ring of integers of the Hilbert class field `H` (Milne, *Class Field
  Theory*, V Theorem 3.17, p. 161). The zero ideal extends to the zero ideal, which is principal,
  so let `𝔞 ≠ 0`. Let `H'` be the image in `Kˢ` of the Hilbert class field of `H` under an
  `H`-embedding of `Hˢ` into `Kˢ` (Mathlib's `IsSepClosed.lift`, `Kˢ` being separably closed and
  algebraic over `H`), so that `H'` is `H`-isomorphic to `hilbertClassField H`. Route, in five
  steps. Steps 1–3 are the reduction to group theory (Milne, V §3, pp. 162–163); steps 4 and 5
  read its conclusion through norm groups and fractional ideals of `H`, so the route uses only the
  global class formation of `K` and needs no comparison between it and the global class formation
  of `H`.
  1. `H'/K` is Galois: a `K`-conjugate of `H'` is again an abelian extension of `H` unramified at
     every place, hence contained in `H'` by the maximality of the Hilbert class field of `H`
     (`TauCeti.ClassFieldTheory.fieldRange_le_hilbertClassField_iff` over `H`).
  2. `H` is the maximal abelian subextension of `H'/K`: an abelian subextension of `H'/K` is
     unramified over `K`, since `H'/H` and `H/K` are, hence contained in `H` by the same
     maximality over `K`; so `Gal(H'/H)` is the commutator subgroup of `Gal(H'/K)`.
  3. In the global class formation, the layer `H'/K` restricted to the ground `H` meets the
     hypothesis of Tau Ceti's class-formation form of the theorem: every idele class of `K` becomes
     a norm from `C_{H'}` in `C_H`
     (`TauCeti.ClassFieldTheory.ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`,
     `TauCeti/NumberTheory/ClassFieldTheory/Formation/PrincipalIdeal.lean`), equivalently the
     transfer `Gal(H'/K)^ab → Gal(H'/H)^ab` is zero
     (`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`).
  4. The extension to `H` of an idele of `K` attached to `𝔞` has trivial ray class at the
     trivial modulus of `H`. Choose an idele `x` of `K` whose fractional ideal is `𝔞`
     (`IsDedekindDomain.FiniteAdeleRing.toFractionalIdeal_surjective`, then
     `NumberField.IdeleGroup.ofFiniteIdele`), and let `x_H` be its extension to `H`
     (`TauCeti.GlobalNumberFields.ideleExtension`). The ground inclusion of the class of `x`, an
     element of the ground level `C_K` (`TauCeti.ClassFieldTheory.globalGroundEquiv`), is the class
     of `x_H` in the level `C_H`, both being the class of the same idele of `Kˢ`. The ground
     inclusion moves no element
     (`TauCeti.ClassFieldTheory.LayerRestriction.groundInclusion_apply_coe`);
     `TauCeti.ClassFieldTheory.globalGroundEquiv_mk` writes the ground side through the extension
     of `x` to the bottom field `⊥` of `Kˢ/K`, and
     `TauCeti.ClassFieldTheory.ideleClassLevelEquiv_mk` writes the level side through
     `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField` at `H`; the two agree by
     `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_coe` at `⊥`,
     `TauCeti.GlobalNumberFields.ideleExtension_comp` for `K ⊆ ⊥ ⊆ H` and
     `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_ideleExtension` from `⊥` to `H`. By
     step 3 and
     `TauCeti.ClassFieldTheory.NormalLayer.ideleClassLevelEquiv_mem_normSubgroup_iff`, the class of
     `x_H` lies in `N_{H'/H}(C_{H'})`. That norm group is the ray subgroup of the trivial modulus
     of `H` (`TauCeti.ClassFieldTheory.range_ideleClassNormMap_rayClassField` at `Modulus.one H`,
     transported along `H' ≃ₐ[H] hilbertClassField H` by
     `TauCeti.GlobalNumberFields.range_ideleClassNormMap_eq_of_algEquiv`), which is the kernel of
     the ray class map `C_H → Cl_1(H)` (`TauCeti.GlobalNumberFields.ker_rayClassQuotient`). Every
     idele is congruent to one at the trivial modulus
     (`TauCeti.GlobalNumberFields.ideleCongrOneSubgroup_one`), so by
     `TauCeti.GlobalNumberFields.rayClassQuotient_mk_of_mem` the ray class of the fractional ideal
     of `x_H` is trivial.
  5. The fractional ideal of `x_H` is `𝔞𝓞_H`, a comparison proved here for every finite extension
     of number fields. At a prime `w` of `H` above `v`, the `w`-adic order of `x_H` is `e(w|v)`
     times the `v`-adic order of `x` (`TauCeti.GlobalNumberFields.ideleFiniteCoord_ideleExtension`,
     `IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionExtension`, whose exponent
     `Ideal.ramificationIdx'` is Mathlib's ramification index `Ideal.ramificationIdx` by
     `Ideal.ramificationIdx'_eq_ramificationIdx`), and the extension of
     `v` to `𝓞_H` is the product of the `w^{e(w|v)}` over the primes `w` above `v` (Mathlib's
     `Ideal.map_algebraMap_eq_finsetProd_pow`), so the two fractional ideals have the same
     multiplicity at every `w` (`IsDedekindDomain.FiniteAdeleRing.count_coe_toFractionalIdeal`).
     Hence the class of `𝔞𝓞_H` in `Cl(H)` is trivial
     (`TauCeti.GlobalNumberFields.oneEquivClassGroup_rayClassMk`), that is, `𝔞𝓞_H` is principal
     (Mathlib's `ClassGroup.mk0_eq_one_iff`).

  *Needs:* `TauCeti.ClassFieldTheory.ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`,
  `TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion` (Layer 4);
  `TauCeti.ClassFieldTheory.globalClassFormation` (Layer 11);
  `TauCeti.ClassFieldTheory.LayerRestriction.groundInclusion_apply_coe`
  (`TauCeti/NumberTheory/ClassFieldTheory/Formation/Restriction.lean`),
  `TauCeti.ClassFieldTheory.globalGroundEquiv`, `TauCeti.ClassFieldTheory.globalGroundEquiv_mk`,
  `TauCeti.ClassFieldTheory.ideleClassLevelEquiv_mk`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/Level.lean`),
  `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField`,
  `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_coe`,
  `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_ideleExtension`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/Coefficients.lean`),
  `TauCeti.ClassFieldTheory.NormalLayer.ideleClassLevelEquiv_mem_normSubgroup_iff`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/Norm.lean`);
  `TauCeti.ClassFieldTheory.hilbertClassField`,
  `TauCeti.ClassFieldTheory.range_ideleClassNormMap_rayClassField`,
  `TauCeti.ClassFieldTheory.fieldRange_le_hilbertClassField_iff`
  (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean`);
  `TauCeti.GlobalNumberFields.ideleExtension`,
  `TauCeti.GlobalNumberFields.ideleExtension_comp`,
  `TauCeti.GlobalNumberFields.ideleFiniteCoord_ideleExtension`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Extension.lean`),
  `TauCeti.GlobalNumberFields.range_ideleClassNormMap_eq_of_algEquiv`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Relative.lean`),
  `TauCeti.GlobalNumberFields.ker_rayClassQuotient`,
  `TauCeti.GlobalNumberFields.rayClassQuotient_mk_of_mem`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Ray/ClassQuotient.lean`),
  `TauCeti.GlobalNumberFields.ideleCongrOneSubgroup_one`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Congruence.lean`),
  `TauCeti.GlobalNumberFields.oneEquivClassGroup_rayClassMk`
  (`TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean`),
  `NumberField.IdeleGroup.ofFiniteIdele`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Basic.lean`);
  `IsDedekindDomain.FiniteAdeleRing.toFractionalIdeal_surjective`,
  `IsDedekindDomain.FiniteAdeleRing.count_coe_toFractionalIdeal`
  (`TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/ClassGroup.lean`),
  `IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionExtension`
  (`TauCeti/RingTheory/DedekindDomain/AdicCompletionExtension.lean`); Mathlib's
  `IsSepClosed.lift`, `Ideal.ramificationIdx'_eq_ramificationIdx`
  (`Mathlib/RingTheory/RamificationInertia/Ramification.lean`),
  `Ideal.map_algebraMap_eq_finsetProd_pow` and `ClassGroup.mk0_eq_one_iff`.
  *Checks:* for `K = ℚ(√-5)` with `H = ℚ(√-5, i)`, the prime `𝔭₂ = (2, 1 + √-5)` is not principal
  in `K` (no `x² + 5y² = 2`) and becomes `(1 + i)` in `H`, both being the unique ideal whose square
  is `(2)`, as `𝔭₂² = (2)` and `(1 + i)² = (2i)`; the prime `𝔭₃ = (3, 1 + √-5)` is not principal
  in `K` (no `x² + 5y² = 3`), and `𝔭₂𝔭₃ = (1 + √-5)` makes it `((1 + √-5)/(1 + i))` in `H`; for
  `K = ℚ`, `H = ℚ` and the statement is that every ideal of `ℤ` is principal. In step 4 at
  `K = ℚ(√-5)`, `H = ℚ(√-5, i)` has class number `1`, so `H' = H`, the norm group
  `N_{H'/H}(C_{H'})` is all of `C_H`, and the idele with order `1` at `𝔭₂` and `0` elsewhere
  extends to an idele whose fractional ideal is `𝔭₂𝓞_H = (1 + i)`. Step 5 needs the ramification
  index: for `ℚ(i)/ℚ`, the idele of `ℚ` with order `1` at `2` extends to an idele of order
  `e = 2` at `(1 + i)`, whose fractional ideal `(1 + i)² = (2)` is the extension of `(2)`, while
  keeping the order `1` would give `(1 + i)`, which is not.
- **The conductor–discriminant formula.** `relDiscr_eq_finprod_abelianConductor`: for finite
  abelian `L/K`, `𝔡(L/K) = ∏_χ 𝔣(χ)` over the characters of `Gal(L/K)` (Milne, V Theorem 3.27,
  p. 165), with `𝔣(χ)` the finite part of the conductor of the fixed field of `ker χ` (V Remark
  3.28, p. 165). Grouping the characters by that field, the product runs over the cyclic
  subextensions `M` of `L/K`, finitely many since `Gal(L/K)` is finite, with exponent
  `φ([M : K])`, the number of characters cutting out `M`, so `φ(1) = 1` at `M = K`. Characters
  take values in `ℂˣ`. Route, one finite prime `v` of `K` at a time, with a prime `w` of `L` above
  it, its decomposition group `D ⊆ Gal(L/K)`, the stabilizer of `w`, and `g = [Gal(L/K) : D]`
  primes above `v`:
  1. The discriminant side. By `TauCeti.multiplicity_relDiscr`, the exponent of `v` in
     `𝔡(L/K)` is the sum over the primes above `v` of the residue degree times the exponent of
     the different; for Galois `L/K` all `g` terms are equal. The exponent of `w` in the different
     of `L/K` is the different exponent `d(L_w/K_v)` of the completion
     (`IsDedekindDomain.HeightOneSpectrum.differentExponent_adicCompletion_eq_multiplicity_differentIdeal`,
     `IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_adicCompletionIntegers_eq_multiplicity_asIdeal`),
     and the residue degree of `w` is the residue degree `f(L_w/K_v)` of the completion
     (`IsDedekindDomain.HeightOneSpectrum.finrank_residueField_adicCompletion`). The local
     discriminant exponent is `δ(L_w/K_v) = f(L_w/K_v) · d(L_w/K_v)`
     (`TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`), so the exponent of
     `v` in `𝔡(L/K)` is `g · δ(L_w/K_v)`.
  2. The local formula. The action of `D` on `L_w` identifies `D` with the Galois group of
     `L_w/K_v` (`IsDedekindDomain.HeightOneSpectrum.decompositionEquiv`), and `L_w/K_v` is abelian
     (`IsDedekindDomain.HeightOneSpectrum.isAbelianGalois_adicCompletion`). So `δ(L_w/K_v)` is the
     sum over the characters `ψ` of `Gal(L_w/K_v)` of their Artin conductor exponents
     (`TauCeti.LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent`).
  3. Characters: restriction from `Gal(L/K)` to `D` is onto the characters of `D`, with fibres
     of `g` elements (Mathlib's `MonoidHom.domRestrict_surjective` and
     `CommGroup.card_domRestrictHom_ker`, `ℂ` having every root of unity). Write `χ_w` for the
     character `χ|_D` read on `Gal(L_w/K_v)` through `decompositionEquiv`. Then `g · δ(L_w/K_v)`
     is the sum over the characters `χ` of `Gal(L/K)` of the Artin conductor exponent of `χ_w`.
  4. The local dictionary. The Artin conductor exponent of `χ_w` is the conductor exponent of the
     fixed field `F_χ ⊆ L_w` of `ker χ_w`
     (`TauCeti.ClassFieldTheory.conductorExponent_fixedField_ker`). Let `M` be the fixed field of
     `ker χ` in `L` and `u` the prime of `M` below `w`. The completion `M_u` is `K_v`-isomorphic
     to `F_χ`, a comparison proved here for every finite abelian extension of number fields:
     - the canonical map `M_u → L_w` (`IsDedekindDomain.HeightOneSpectrum.completionAlgHom`) is
       `K_v`-linear, since it composes with `K_v → M_u` to `K_v → L_w`, which is the algebra map
       of `L_w` over `K_v`
       (`IsDedekindDomain.HeightOneSpectrum.completionAlgHom_comp`,
       `IsDedekindDomain.HeightOneSpectrum.algebraMap_eq_completionAlgHom`);
     - its image is fixed by the image of `D ∩ ker χ` in `Gal(L_w/K_v)`, which is `ker χ_w`: such
       an automorphism is continuous and fixes the image of `M`
       (`IsDedekindDomain.HeightOneSpectrum.continuous_decompositionHom`,
       `IsDedekindDomain.HeightOneSpectrum.decompositionHom_algebraMap`), `M` is dense in `M_u`,
       and the map is continuous
       (`IsDedekindDomain.HeightOneSpectrum.continuous_completionAlgHom`);
     - `[M_u : K_v] = [D : D ∩ ker χ]`
       (`IsDedekindDomain.HeightOneSpectrum.finrank_adicCompletion_fixedField` at `ker χ`), and
       `[F_χ : K_v] = [D : D ∩ ker χ]` by Galois theory in `L_w/K_v`
       (`IntermediateField.finrank_fixedField_eq_card` gives `[L_w : F_χ] = #(D ∩ ker χ)`, and
       `#D = [L_w : K_v]` by
       `IsDedekindDomain.HeightOneSpectrum.card_stabilizer_eq_finrank_adicCompletion`).

     So the image of `M_u` is `F_χ`. The conductor exponent of a finite extension is determined
     by its norm group (`TauCeti.ClassFieldTheory.conductorExponent_le_iff`), and `K_v`-isomorphic
     extensions have the same norm group (`AlgEquiv.normGroup_eq`), so the conductor exponent of
     `F_χ/K_v` is that of `M_u/K_v`.
  5. Local and global conductors agree: the exponent of `v` in `abelianConductor K M` equals the
     conductor exponent of `M_u/K_v`. The global exponent is at least the local one, as the
     conductor is admissible (`TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor`,
     and `TauCeti.ClassFieldTheory.IsAdmissibleModulus.conductorExponent_le_exponent` for `M/K`
     at `u`). It is at most the local one because the modulus `𝔪₀` is admissible, where `𝔪₀`
     has, at each finite place `v'`, the conductor exponent of `M_{u'}/K_{v'}` for a chosen prime
     `u'` of `M` above `v'`, and the real places of `K` that become complex in `M`. A congruence
     idele of `𝔪₀` is a norm from every local étale algebra `K_{v'} ⊗_K M`. A norm from one
     completion above `v'` is a norm from `K_{v'} ⊗_K M`, the other components being `1`
     (`TauCeti.mem_range_normUnits_adicCompletion_iff`, and
     `TauCeti.mem_range_normUnits_completion_iff` at the infinite places). At the finite places
     the component lies in `U(K_{v'}, n)` with `n` the exponent of `𝔪₀`
     (`TauCeti.GlobalNumberFields.ideleCongruenceSubgroup.ideleFiniteCoord_mem_unitFiltration`),
     so it is a norm from `M_{u'}` by `TauCeti.ClassFieldTheory.conductorExponent_le_iff` (at
     exponent `0` this says that units are norms). At a real place of `𝔪₀` the component is
     positive, a square `b²`, and `b²` is the norm of `b` from a complex completion above it
     (`TauCeti.pow_finrank_mem_normGroup`). At the other infinite places, where `M` stays real or
     `K` is complex, every unit is a local norm
     (`TauCeti.mem_range_normUnits_completion_of_finrank_eq_one`,
     `TauCeti.mem_range_normUnits_completion_of_isComplex`). Hence the idele is an idele norm
     (`TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`), and
     `TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_abelianConductor_dvd` gives
     `abelianConductor K M ∣ 𝔪₀`.

  Summing steps 3–5 over the characters `χ` and grouping them by `M` gives the formula at `v`.
  *Needs:* `TauCeti.relDiscr` (`TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean`),
  `TauCeti.multiplicity_relDiscr` (`TauCeti/RingTheory/DedekindDomain/Discriminant/Valuation.lean`);
  `IsDedekindDomain.HeightOneSpectrum.differentExponent_adicCompletion_eq_multiplicity_differentIdeal`,
  `IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_adicCompletionIntegers_eq_multiplicity_asIdeal`
  (`TauCeti/NumberTheory/NumberField/LocalGlobal/Different/Exponent.lean`),
  `IsDedekindDomain.HeightOneSpectrum.finrank_residueField_adicCompletion`
  (`TauCeti/RingTheory/DedekindDomain/AdicValuation/InertiaDegree.lean`),
  `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`
  (`TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean`);
  `TauCeti.LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent`
  (`TauCeti/NumberTheory/LocalField/Discriminant/Conductor.lean`);
  `IsDedekindDomain.HeightOneSpectrum.decompositionEquiv`,
  `IsDedekindDomain.HeightOneSpectrum.isAbelianGalois_adicCompletion`,
  `IsDedekindDomain.HeightOneSpectrum.continuous_decompositionHom`,
  `IsDedekindDomain.HeightOneSpectrum.decompositionHom_algebraMap`,
  `IsDedekindDomain.HeightOneSpectrum.card_stabilizer_eq_finrank_adicCompletion`,
  `IsDedekindDomain.HeightOneSpectrum.finrank_adicCompletion_fixedField`
  (`TauCeti/NumberTheory/NumberField/LocalGlobal/DecompositionGroup.lean`),
  `IsDedekindDomain.HeightOneSpectrum.completionAlgHom`,
  `IsDedekindDomain.HeightOneSpectrum.completionAlgHom_comp`,
  `IsDedekindDomain.HeightOneSpectrum.algebraMap_eq_completionAlgHom`,
  `IsDedekindDomain.HeightOneSpectrum.continuous_completionAlgHom`
  (`TauCeti/NumberTheory/NumberField/LocalGlobal/Completion.lean`);
  Mathlib's `MonoidHom.domRestrict_surjective`, `CommGroup.card_domRestrictHom_ker`
  (`Mathlib/GroupTheory/FiniteAbelian/Duality.lean`) and
  `IntermediateField.finrank_fixedField_eq_card`;
  `TauCeti.ClassFieldTheory.conductorExponent_fixedField_ker`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean`) and
  `TauCeti.ClassFieldTheory.conductorExponent_le_iff` (Layer 7);
  `AlgEquiv.normGroup_eq` (`TauCeti/RingTheory/Norm/Equiv.lean`),
  `TauCeti.pow_finrank_mem_normGroup` (`TauCeti/RingTheory/Norm/Units.lean`);
  `TauCeti.ClassFieldTheory.abelianConductor`,
  `TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor`,
  `TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_abelianConductor_dvd`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean`) and
  `TauCeti.ClassFieldTheory.IsAdmissibleModulus.conductorExponent_le_exponent`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Ramification.lean`) (Layer 12);
  `TauCeti.GlobalNumberFields.ideleCongruenceSubgroup.ideleFiniteCoord_mem_unitFiltration`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Congruence.lean`),
  `TauCeti.mem_range_normUnits_adicCompletion_iff`, `TauCeti.mem_range_normUnits_completion_iff`,
  `TauCeti.mem_range_normUnits_completion_of_finrank_eq_one`,
  `TauCeti.mem_range_normUnits_completion_of_isComplex`
  (`TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Norm/Units.lean`),
  `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`
  (`TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Range.lean`).
  *Checks:* for `ℚ(ζ₅)/ℚ` at `v = 5`, `g = 1`, the local extension is tame and totally ramified
  of degree `4`, so `f = 1`, `d = 3` and step 1 gives `1 · 1 · 3 = 3`, while its four characters
  have Artin conductor exponents `0, 1, 1, 1`, summing to the same `δ = 3`; for `ℚ(ζ₁₅)/ℚ` at
  `v = 5`, `g = 1`, `f = 2` (`5` has order `2` modulo `3`) and
  `d = e − 1 = 3`, so step 1 gives `6`, the exponent of `5` in the discriminant `3⁴ · 5⁶`, and
  six of the eight characters modulo `15` are nontrivial on `(ℤ/5)ˣ`, each with conductor
  exponent `1` at `5`, summing to `6`; omitting the residue degree would give `3`; for
  `ℚ(ζ₅)/ℚ` the global conductor `5·∞` has exponent `1` at `5`, equal to the local conductor
  exponent, and the formula reads `125 = 1 · 5 · 5²`; for `ℚ(i)/ℚ` at `v = 2`, `D = Gal(L/K)`, the
  characters have exponents `0` and `2`, the conductor `4·∞` has exponent `2`, and `𝔡 = (4)`;
  for `ℚ(√5)/ℚ` at the inert prime `2`, `g = 1`, every exponent is `0`, and `2 ∤ 𝔡 = (5)`; for
  `L = ℚ(i, √5)` at `v = 5`, which splits in `ℚ(i)` and ramifies in `ℚ(√5)`: `g = 2`,
  `D = Gal(L/ℚ(i))` and `L_w = ℚ₅(√5)`, tame of degree `2`, so `δ = 1` and step 1 gives
  `2 · 1 = 2`; the characters cutting out `ℚ`, `ℚ(i)`, `ℚ(√5)` and `ℚ(√-5)` restrict to `D`
  with Artin conductor exponents `0, 0, 1, 1`, summing to `2`, while the sum over the two
  characters of `D` alone is `1`, so the factor `g` of step 3 is needed; their conductors `1`,
  `4·∞`, `5` and `20·∞` have exponents `0, 0, 1, 1` at `5`, and
  `𝔡 = 1 · 4 · 5 · 20 = 400 = 2⁴ · 5²`; in step 4 for `M = ℚ(√-5)`, `D ∩ ker χ` is trivial, so
  `F_χ = L_w = ℚ₅(√5)`, while `M_u = ℚ₅(√-5)` is a separate field; the canonical map sends `√-5`
  to `i · √5`, where `i ∈ ℚ₅` as `5 ≡ 1 mod 4`, so its image is `F_χ`, and
  `[M_u : ℚ₅] = 2 = [D : D ∩ ker χ]`.

### Examples

- `ℚ(√13, √17)/ℚ`: `25` is a norm at every place (at `2` the local degree is `2` and `v(25) = 0`;
  at `5` the extension is unramified and `v(25) = 2`; `25` is a square modulo `13` and `17`; and
  `25 > 0`) but not a global norm: the Hasse norm principle fails for a non-cyclic extension.
- `ℚ(i)/ℚ`: `3` is not a norm at `3`, where the extension is inert and `v(3) = 1`, and
  `x² + y² = 3` has no rational solution; `5 = 1² + 2²`.
- `ℚ(√-5)`: the class number is `2`, the Hilbert class field is `ℚ(√-5, i)`, and
  `(2, 1 + √-5)` becomes `(1 + i)` there.
- The ray-class splitting criterion: a prime of `K` prime to `𝔪` splits completely in the ray
  class field of `𝔪` exactly when its ray class is trivial (Milne, *Class Field Theory*, V §1,
  p. 154, and V Theorem 3.6, p. 158). It is one rewriting: the ray class field has admissible
  modulus `𝔪` (`TauCeti.ClassFieldTheory.isAdmissibleModulus_rayClassField`,
  `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean`), so Tau Ceti's criterion
  `TauCeti.ClassFieldTheory.ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one`
  (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean`) applies, and
  the ray-class Artin map there is the isomorphism `TauCeti.ClassFieldTheory.rayClassArtinEquiv`
  (`TauCeti.ClassFieldTheory.rayClassArtinEquiv_apply`), which is trivial only at the trivial
  class. At `𝔪 = 4·∞` over `ℚ` the ray class group is `(ℤ/4)ˣ` and the ray class field `ℚ(i)`:
  `(5)` has the generator `5`, positive and `≡ 1 mod 4`, and `5 = (2 + i)(2 - i)` has two primes
  above it; the generators of `(3)` are `3 ≡ 3 mod 4` and the negative `-3`, so its class is
  nontrivial and `3` stays prime in `ℚ(i)`. Dropping the real place breaks this: at the modulus
  `4`, the generator `-3 ≡ 1 mod 4` makes the class of `(3)` trivial, the ray class group is
  trivial, and the ray class field is `ℚ`, in which `3` splits completely.
- Splitting in the Hilbert class field: a nonzero prime of `𝓞 K` splits completely in the Hilbert
  class field exactly when it is principal (Milne, *Class Field Theory*, V §1, p. 154, and V
  Example 3.9, p. 159). It is the ray-class criterion above at the trivial modulus `1`, whose ray
  class field is Tau Ceti's `TauCeti.ClassFieldTheory.hilbertClassField`, followed by the
  dictionary at that modulus: every nonzero prime is prime to `1`, its congruence condition is
  empty (`TauCeti.GlobalNumberFields.isCongrOne_one`), so by
  `TauCeti.GlobalNumberFields.idealClass_eq_one_iff`
  (`TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean`) its ray class is trivial exactly
  when it is generated by a nonzero element of `K`, which Mathlib's
  `IsFractionRing.coeSubmodule_isPrincipal` and `FractionalIdeal.isPrincipal_iff` turn into
  principality in `𝓞 K`. Over `ℚ(√-5)`, of class number `2` with Hilbert class field
  `ℚ(√-5, i)`: `𝔭₂ = (2, 1 + √-5)` and `𝔭₃ = (3, 1 + √-5)` are not principal and each has one
  prime above it, while the principal prime `(3 + 2√-5)`, of norm `29 = 3² + 5 · 2²`, has two;
  over `ℚ`, whose Hilbert class field is `ℚ`, every prime is principal and splits completely. A
  criterion read off the narrow class group instead would fail over `ℚ(√3)`, of class number `1`
  and narrow class number `2`: the principal prime `(√3)` splits completely in the Hilbert class
  field `ℚ(√3)` but is inert in the narrow Hilbert class field `ℚ(√3, i)`, since no generator
  `±√3 · (2 + √3)ᵏ` is totally positive, `2 + √3` being totally positive and `√3` not.
- The conductor–discriminant formula for `ℚ(ζ₅)/ℚ`: `125 = 1 · 5 · 5²`; for `ℚ(ζ₈)/ℚ`:
  `256 = 1 · 4 · 8 · 8` over `ℚ`, `ℚ(i)`, `ℚ(√2)`, `ℚ(√-2)`.
- Kronecker–Weber: `ℚ(√5) ⊆ ℚ(ζ₅)` with least level `5`, `ℚ(i) = ℚ(ζ₄)`, `ℚ(√2) ⊆ ℚ(ζ₈)`.
- For the order `ℤ[√-3]` of conductor `2` in `ℚ(√-3)`, `Pic` is trivial and the ring class field
  is `ℚ(√-3)` itself; for `ℤ[2i]`, `Pic` is trivial as well.
- The ring class field of the maximal order is the Hilbert class field: unfolding
  `TauCeti.ClassFieldTheory.ringClassField`, `hilbertClassField`, `rayClassField`,
  `ringClassNormSubgroup` and `rayNormSubgroup`, the two are class fields of the norm subgroups
  that `TauCeti.ClassFieldTheory.ker_ringClassIdeleQuotient_maximalNumberFieldOrder`
  (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Quotient.lean`) identifies, and
  one `simp` call with these closes the equality. At `ℚ` both are `ℚ`; at `ℚ(√-5)` both are
  `ℚ(√-5, i)`.

### Dependencies

Layers 4, 7 and 10–12 (the transfer diagram of Layer 4 and the local conductors of Layer 7, for
the open targets); `GlobalNumberFields` (orders and `Pic`; for the principal ideal theorem, the
fractional ideal of a finite idele, extension of ideles and the ray class of an idele class).

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

- `(3, 7)` over `ℚ`: the `ℤ/2`-valued invariants are `0` at `∞`, `1` at `2` (both entries are
  `≡ 3 mod 4`), `0` at `3` (`7 ≡ 1` is a square modulo `3`) and `1` at `7` (`3` is not a square
  modulo `7`), summing to `0` in `ℤ/2`; the Brauer invariants of the quaternion algebra are
  `0, 1/2, 0, 1/2`.
- `(-1, -1)` over `ℚ`: the invariant is `1` at `2` and at `∞` and `0` elsewhere, the Hamilton
  quaternions being ramified exactly there.

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
(the abstract form is the Layer 4 example;
`TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_nontrivial_iff_not_norm`),
and `Art(a) = τ` exactly when `(a, d)_K = -1` for `L = K(√d)`
(`TauCeti.ClassFieldTheory.localArtinMap_quadratic_eq_hilbertSymbol`). ⚠ The Hilbert-symbol
comparison is about `K(√d)` exactly: a bare `∃ s, s² = d` also holds in `K(√d, √e)`, of degree
four, and the symbol is the local symbol at the named pairing `kummerCupPairing (-1)`, since the
zero pairing would make every symbol trivial. Globally, the quadratic splitting test and
`ℚ(i)/ℚ`, `ℚ(√5)/ℚ` are the Layer 11 examples; for `ℚ(√5)/ℚ` the norm index is `2` and the cyclic
Hasse norm theorem holds.

### 5.5 Cyclotomic fields

For `ℓ ∤ m`, `Art((ℓ))(ζ_m) = ζ_m^ℓ`, equivalently `Art((ℓ)) ↔ ℓ mod m` under
`Gal(ℚ(ζ_m)/ℚ) ≃ (ℤ/m)ˣ` (`TauCeti.ClassFieldTheory.globalArtinMap_cyclotomic_prime`); a
quadratic example alone cannot distinguish an automorphism from its inverse. For `ℚ(ζ₅)/ℚ`,
`Art((2))(ζ₅) = ζ₅²` (`TauCeti.ClassFieldTheory.globalArtinMap_zeta5_two`); the other values are
the Layer 11 examples. At `m = 1` the symbol is `1`, and at `m = 2` it is `(-1)^ℓ = -1`.

### 5.6 Compatibility and tower tests

For `K ≤ E ≤ L`, the three finite Artin maps satisfy the norm and transfer squares
(`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`,
`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundNorm`). For
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
- For a nonmaximal imaginary-quadratic order, `Gal(H_O/K)` against
  `TauCeti.GlobalNumberFields.Pic O` through `TauCeti.ClassFieldTheory.ringClassArtinEquiv`; Tau
  Ceti's `TauCeti.BinaryQuadraticForm.posDefProperClassEquivGal` identifies it with the classes of
  primitive positive definite forms. At the class-number-one order `ℤ[2i]` both groups have one
  element.

### 5.8 Minimal suite

The trivial layer; `V = ⊤ ↦ Kˣ`; the unramified normalization for an arbitrary finite unramified
extension; the local quadratic test; `ℚ(i)` at an inert and a split prime; the cyclotomic test with
the value of `ℚ(ζ₅)` at `2`; and the rejection of the trivial modulus for `ℚ(i)/ℚ`
(`TauCeti.ClassFieldTheory.not_isAdmissibleModulus_one_Qi`). Together they test triviality, the
direction of the correspondence, the norm kernel, a group of order two, arithmetic Frobenius, a
non-involutive Artin symbol, and that ray-class reciprocity is never written at an inadmissible
modulus. All of them are Tau Ceti's at the pin.

## 6. Downstream consumers

Roadmaps that build on this one, with the parts they use:

- `LocalGaloisGroups`: Layers 0 and 3–7, namely the Nakayama–Rim theorem and `p`-primary Tate
  cohomology, Tate's theorem, Kummer theory, `H²(G_F, μ_n)`, local duality and the Euler
  characteristic, the absolute Artin map and the cyclotomic normalization; its Lean file imports
  `Suggested.lean`.
- `GlobalQuadraticForms`: Layers 12–14, namely the norm index, the cyclic Hasse norm theorem with
  the local-norm predicates, and Hilbert reciprocity; its Lean file imports `Suggested.lean`.
- `QuadraticFormInvariants`: Layers 5 and 14, through Tau Ceti's declarations (the cohomological
  local symbol, the local invariant and the Hilbert product formula).
- `ClassicalArithmeticCompletion`: Layers 5–7, 10, 11, 13 and 14.
- `SchemeAndStackFoundations`: Layers 5 and 10 (Brauer groups and Kummer theory of fields).
- `ImaginaryQuadraticClassNumber`: Layers 10–13 (global existence and the correspondence, the
  class fields, arithmetic Frobenius).
- `ZerosOfLFunctions`: Layer 12 (the ray-class Artin map at an admissible modulus).
- `ReductiveGroupsPartII`: Layer 9 (the local Weil group).
- `OrthogonalSpinGroups`: Layer 14 (Hilbert reciprocity).
- `AnalyticNumberTheoryPartI`: Layers 7, 11 and 13 (the character conductor
  `TauCeti.ClassFieldTheory.characterConductorExp`, global reciprocity with its local
  compatibility and conductors, and the conductor–discriminant formula
  `relDiscr_eq_finprod_abelianConductor`).
- `IntegralLattices`: Layers 13 and 14, through Tau Ceti's
  `TauCeti.ClassFieldTheory.ringClassField`, `TauCeti.ClassFieldTheory.ringClassArtinEquiv` and
  `TauCeti.ClassFieldTheory.hilbertProductFormula`; it imports nothing from `Suggested.lean`.
- `EndoscopicTransferAndUnitaryTraceComparison`: §2.4 and Layer 0 (Tate–Nakayama for a `ℤ`-free
  lattice).
- `LocalFieldsRamification` leaves Tate cohomology, class formations, local duality, local
  reciprocity and local existence to Layers 0, 2 and 5–8.

### Names imported from `Suggested.lean`

The Lean files of `LocalGaloisGroups` and `GlobalQuadraticForms` import `Suggested.lean` and use
the following names of it in their statements and proofs, so that removing one breaks their build.
They are not headlines: each is an abbreviation of a Tau Ceti or Mathlib declaration (`H` is
Mathlib's `continuousCohomology` and `principalIdele` is Mathlib's
`NumberField.IdeleGroup.unitEmbedding`), one of the four definitions of Layer 5 built from Tau
Ceti's, or a theorem closed by Tau Ceti's theorem under Tau Ceti's hypotheses or a specialization
of them; `cyclotomicCharacter_artinMap`, one of the three local theorems of §1 item 1, is closed
from `valuativeExtension_of_finite`. `Suggested.lean` also declares the other two,
`eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp`, as consequences of the open
target, and the three Hilbert invariants `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`
and `finiteHilbertSupport`, which occur in the type of `hilbertProductFormula`.

| Use | Names |
|---|---|
| coefficient objects and Kummer theory | `GalRep`, `H`, `muNRep`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerEquiv_mixed` |
| degree two and the Kummer pairing | `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing`, `kummerCupPairing_bil` |
| reciprocity and orientation | `artinMap`, `absoluteGaloisGroupExtend`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic`, `cyclotomicCharacter_artinMap_padic_uniformizer`, `scd_p_absoluteGaloisGroup_eq_two` |
| ideles and norms | `principalIdele`, `ideleNormMap`, `ideleClassNorm`, `card_ideleClassNormQuotient`, `cyclicHasseNorm`, `IsFiniteLocalNorm`, `IsInfiniteLocalNorm`, `IsLocalNormEverywhere`, `isGlobalNorm_iff_isLocalNormEverywhere` |
| Hilbert reciprocity | `hilbertProductFormula` |

`scd_p_absoluteGaloisGroup_eq_two`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed` and
`h2FpEquivZMod_of_mu` are stated for a finite `ℚ_p`-algebra structure, the form in which
`LocalGaloisGroups` applies them. The README and the docstrings of `LocalGaloisGroups` also cite,
as this roadmap's, names that no Lean file uses, among them `tateTheorem`, `localSymbol`,
`tateDual`, `tateDualityPairing`, `muNRepToTateDual`, `bijective_muNRepToTateDual`,
`tateDualityPairing_muNRepToTateDual`, `finite_H`, `tateDualityPairing_perfect_mixed`,
`restrictAbsolute`, `denseRange_artinMap`, `artinMap_restrict`, `artinMap_norm`, `normResidue`,
`unramifiedCoordinate_artinMap` and the two Nakayama–Rim names of Layer 0: each is the Tau Ceti
declaration of the same short name, with Tau Ceti's hypotheses, except `restrictAbsolute`, which
is `AlgHom.restrictNormalHom iota` after `TauCeti.absoluteGaloisGroupRestrictEquiv K`; all are
listed below. In particular finiteness needs a nonarchimedean local field with `(n : F) ≠ 0`, and
perfectness of the duality pairing one of characteristic zero with `n ≠ 0`.

### Earlier identifiers, old → new

Ids and names that roadmaps cite from earlier versions of this roadmap, one line per id:

- Layer 0, item 4 (the generic Tate-cohomology suppliers, Tate's cup-product criterion with its
  Tate–Nakayama generalization, and the Nakayama–Rim theorem) → Layer 0, first and second
  paragraphs, with the statement of Tate–Nakayama in §2.4;
- `muNRepCoeffDictionary` → `TauCeti.ClassFieldTheory.kummerCoeffEquivMuNRep`;
- `muNRepCoeffDictionary_continuous` → `TauCeti.ClassFieldTheory.continuous_kummerCoeffEquivMuNRep`;
- `muNRepCoeffDictionary_equivariant` → `TauCeti.ClassFieldTheory.kummerCoeffEquivMuNRep_smul`;
- `kummerClass` → `TauCeti.ClassFieldTheory.kummerClass`, which takes the invertibility of `n` in
  `F` as an argument;
- `kummerClass_eq_kummerCocycleClass` →
  `TauCeti.ClassFieldTheory.kummerClass_eq_muNRepH1Equiv_kummerCocycleClass`;
- `kummerEquiv_mixed_mk` → `TauCeti.ClassFieldTheory.kummerEquivOfCharZero_ofMul_mk`;
- `iota_restrictAbsolute_apply` → Tau Ceti's `AlgHom.restrictNormalHom_commutes`
  (`TauCeti/FieldTheory/Galois/Restriction.lean`);
- `ClassFormation` → `TauCeti.ClassFieldTheory.ClassFormation`;
- `tateTheorem` → `TauCeti.ClassFieldTheory.tateTheorem`
  (`TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.lean`);
- `ClassFormation.artinMap_conj` → `TauCeti.ClassFieldTheory.ClassFormation.artinMap_conj`
  (`TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean`);
- `absoluteGaloisGroupComparison` → `TauCeti.absoluteGaloisGroupRestrictEquiv`
  (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`);
- `instFactIsSmoothDiscreteMuNRep` → the theorem `TauCeti.ClassFieldTheory.isSmoothDiscrete_muNRep`
  (`TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean`);
- `instFactIsSmoothDiscreteTrivialFp` → the theorem `TauCeti.isSmoothDiscrete_trivialFp`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean`);
- `instFactIsSmoothDiscreteTateDual` → the instance
  `TauCeti.ClassFieldTheory.instFactIsSmoothDiscreteTateDual`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Basic.lean`);
- `localSymbol` → `TauCeti.ClassFieldTheory.localSymbol`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean`);
- `tateDualityPairing` → `TauCeti.ClassFieldTheory.tateDualityPairing`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Basic.lean`);
- `bijective_muNRepToTateDual` → `TauCeti.ClassFieldTheory.bijective_muNRepToTateDual`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/RootsOfUnity.lean`);
- `tateDualityPairing_muNRepToTateDual` →
  `TauCeti.ClassFieldTheory.tateDualityPairing_muNRepToTateDual`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/RootsOfUnity.lean`);
- `finite_H` → `TauCeti.ClassFieldTheory.finite_H`
  (`TauCeti/NumberTheory/ClassFieldTheory/FiniteCohomology/DegreeTwo.lean`);
- `tateDualityPairing_perfect_mixed` → `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean`);
- `restrictAbsolute K L iota` → `AlgHom.restrictNormalHom iota` after
  `TauCeti.absoluteGaloisGroupRestrictEquiv K`;
- `denseRange_artinMap` → `TauCeti.ClassFieldTheory.denseRange_artinMap`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`);
- `unramifiedCoordinate` → `TauCeti.unramifiedCoordinate`;
- `unramifiedCoordinate_artinMap` → `TauCeti.ClassFieldTheory.unramifiedCoordinate_artinMap`;
- `localArtinMap` → `TauCeti.ClassFieldTheory.localArtinMap`;
- `TateCohomology.projective_ker_of_isZero_res` → `Rep.projective_ker_of_isZero_res`
  (`TauCeti/RepresentationTheory/Homological/TateCohomology/NakayamaRim.lean`);
- `TateCohomology.primaryComponent_tateCohomology_eq_bot` →
  `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`
  (`TauCeti/RepresentationTheory/Homological/TateCohomology/PrimaryComponent.lean`);
- `tateDual` → `TauCeti.ClassFieldTheory.tateDual`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Basic.lean`);
- `muNRepToTateDual` → `TauCeti.ClassFieldTheory.muNRepToTateDual`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/RootsOfUnity.lean`);
- `normResidue` → `TauCeti.ClassFieldTheory.normResidue`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Reciprocity.lean`);
- `artinMap_norm` → `TauCeti.ClassFieldTheory.artinMap_norm`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`);
- `artinMap_restrict` → `TauCeti.ClassFieldTheory.artinMap_restrict`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`), stated against
  `AlgHom.restrictNormalHom` after `TauCeti.absoluteGaloisGroupRestrictEquiv`.

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
- *Layer 13 needs:* Layers 4, 7, 10–12; `GlobalNumberFields`.
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
- J. S. Milne, *Class Field Theory*, course notes, v4.03: II Theorem 3.11, p. 84, and Remark 3.12,
  p. 85 (Tate's theorem and the Tate–Nakayama generalization); III Lemmas 2.3–2.6 (local units and
  the order of `H²(L/K)`); V §1, pp. 152–154 (the Frobenius element and complete splitting),
  Theorem 3.6, p. 158 (the ray class field and its Artin isomorphism), Example 3.9, p. 159 (the
  Hilbert class field), Theorem 3.17, p. 161 (the principal ideal theorem), Theorem 3.27 and Remark
  3.28, p. 165 (the conductor–discriminant formula); VII §4, p. 210, and §5, p. 212 (the first and
  second inequalities), Theorem 8.1, p. 221 (reciprocity on principal ideles), Example 8.2,
  pp. 221–222 (the cyclotomic local symbols), Lemmas 9.1–9.4 and Theorem 9.5 (global existence);
  VIII Theorem 4.2, p. 241 (the Brauer exact sequence).
- J. Tate, *The higher dimensional cohomology groups of class field theory*, Ann. of Math. 56
  (1952); T. Nakayama, *Cohomology of class field theory and tensor product modules I*, Ann. of
  Math. 65 (1957).
- J.-P. Serre, *Local Fields*, IX §§3–5 and XI–XIV; *Galois Cohomology*, II §5.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed.: (7.1.8), (7.2.5),
  (7.2.6), (7.3.1)–(7.3.4).
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed., I §2: Corollary 2.3, p. 28 (local duality
  and finiteness for coefficients of order prime to the characteristic), Theorem 2.8, p. 31 (the
  Euler characteristic).
- J. Neukirch, *Algebraic Number Theory*, Chapters VI–VII.
- J. S. Milne, *Algebraic Number Theory*, course notes, v3.08 (2020): Proposition 7.31, p. 120 (a
  simple root modulo the uniformizer of a complete discrete valuation ring lifts to a root).
- K. S. Brown, *Cohomology of Groups*, VI §8; D. S. Rim, *Modules over finite groups*, Ann. of
  Math. 69 (1959); S. Lang, *Algebra*, III Theorem 7.1.
- G. S. Kopp and J. C. Lagarias, *Ray class groups and ray class fields for orders of number
  fields*, Ess. Number Theory 4 (2025), 1–65 (arXiv:2212.09177v3), Theorems 1.1–1.3, pp. 3–4: ray
  class fields of arbitrary orders, the ring class field being the case of the modulus `O` with no
  real places.
- D. A. Cox, *Primes of the Form x² + ny²*, §7 (Proposition 7.22) and §9 (Theorem 9.18): the
  quadratic case of ring class fields.
- A. Weil, *Sur la théorie du corps de classes*, J. Math. Soc. Japan 3 (1951); J. Tate, *Number
  theoretic background*, Corvallis, Part 2, §1: the local Weil group.
- F. Jahnke and J. Koenigsmann, *Definable henselian valuations*, arXiv:1210.7615v4 (2014),
  Theorem 2.1, p. 3: F. K. Schmidt's theorem, that a field with two independent nontrivial
  henselian valuations is separably closed.
- A. J. Engler and A. Prestel, *Valued Fields*, Springer, 2005, Theorem 4.4.1: the reference of
  the proof of Jahnke–Koenigsmann's Theorem 2.1.
