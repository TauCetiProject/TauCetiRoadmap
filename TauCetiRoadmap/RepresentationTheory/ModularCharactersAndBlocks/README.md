# Roadmap: modular characters and blocks of finite groups

**Summary.** This roadmap develops the modular representation theory of a finite group `G` at a
prime `p` that may divide `|G|`: `p`-modular systems and the reduction of stable lattices, Brauer
characters and the decomposition map, projective characters and Brauer reciprocity, the blocks of
`O[G]`, `k[G]` and `K[G]` and their comparison, generalized decomposition numbers and their
orthogonality, the Brauer homomorphism, Brauer pairs and defect groups, Brauer's three main
theorems, and the behaviour of blocks under normal subgroups. It is built from Mathlib's group
algebras, discrete valuation rings and Sylow theory, from the pinned Tau Ceti libraries of
`p`-parts of elements, primitive idempotents, complete-adic idempotent lifting, projective covers,
Cartan matrices and Grothendieck groups of group algebras, and from the ordinary character theory
of CharacterTheory and InductionRestriction. The end theorems are Brauer's count of simple modules
(`card_simpleModules_eq_card_pRegularClasses`), the integral surjectivity of the decomposition map
(`span_decompositionRows_eq_top`), Brauer reciprocity `C = Dᵀ D`
(`cartanMatrix_eq_transpose_mul_decomposition`), the bijection of blocks of `O[G]` and `k[G]`
(`existsUnique_blockIdempotent_map_residue`), the description of the blocks of `O[G]` by
central characters (`exists_blockIdempotent_iff_centralCharacter_congr`), the orthogonality of
generalized decomposition numbers, the conjugacy of defect groups (`isDefectGroup_conj`), the
Sylow defect groups of the principal block (`isDefectGroup_iff_sylow_of_augmentation_ne_zero`),
Brauer's first main theorem (`brauer_first_main`), the second main theorem and block-section
orthogonality (`sum_sameBlock_mul_conj_eq_zero`), the local form of the third main theorem
(`brauer_third_main_local`), and the kernel theorem `⋂_{χ ∈ Irr(B₀)} ker χ = O_{p'}(G)`
(`mem_pPrimeCore_iff_forall_principalBlock`).

Suggested homes: `TauCeti/RepresentationTheory/Modular/` and `TauCeti/RepresentationTheory/Block/`.
The module theory is primary; complex characters describe it through proved comparisons.

## Scope and ownership

This roadmap owns the general modular theory of finite groups listed in Layers 0–8. It also owns
the `π`-cores `O_π(G)` of finite groups (§0.3), among them `O_p(G)` and the `p'`-core of the
kernel theorem, which neither pinned library defines; the `π`-cores that OddOrderTheorem (§1.1)
and GlaubermanZStar use are these. It does not own the classification of finite simple groups, the
odd order theorem, Glauberman's `Z*` theorem (GlaubermanZStar consumes the interfaces of §8.4),
relative projectivity, vertices and sources of modules and Green correspondence (defect groups are
defined and characterized here through the Brauer homomorphism and relative traces in `k[G]`,
§6.2), blocks with cyclic defect group and Brauer trees, block fusion systems beyond Brauer pairs,
or conjectures about blocks.

Already in the libraries, and consumed rather than rebuilt:

- **`p`-parts of elements.** Tau Ceti defines the commuting factorisation `x = pPart p x * pFreePart p x`
  with uniqueness, conjugation and order formulas (`TauCeti.pPart`, `TauCeti.pFreePart`,
  `TauCeti.eq_pPart`, `TauCeti.eq_pFreePart`, `TauCeti.commute_pFreePart_pPart`,
  `TauCeti.pPart_mul_pFreePart`, `TauCeti.pPart_conj`, `TauCeti.pFreePart_conj`,
  `TauCeti.orderOf_pPart`, `TauCeti.orderOf_pFreePart`, in
  `TauCeti/GroupTheory/OrderOfElement/PPart.lean`). Layer 0 adds only the sections and their
  centralizer parametrization.
- **Primitive idempotents and their lifting.** `TauCeti.IsPrimitiveIdempotent`,
  `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` (Artinian rings),
  Mathlib `CompleteOrthogonalIdempotents`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`,
  and the complete-adic lifting `IsAdicComplete.exists_isIdempotentElem_eq` (root namespace, in
  `TauCeti/RingTheory/AdicCompletion/Idempotent.lean`) and
  `TauCeti.exists_projective_quotient_smul_top_linearEquiv`
  (`TauCeti/Algebra/Module/Projective/Lift.lean`). Layer 1 adds only centrality, primitivity and
  uniqueness of central lifts over `O[G]`.
- **Projective covers, Cartan matrices and `K₀`.** `TauCeti.IsProjectiveCover`,
  `TauCeti.exists_isProjectiveCover_of_finite`,
  `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` (root namespace: over
  an Artinian ring, a complete family of primitive orthogonal idempotents supplies a projective
  cover of every simple module by one of its principal left ideals),
  `Ideal.nonempty_linearEquiv_of_quotient_smul_top`, `TauCeti.cartanMap`, `TauCeti.cartanMatrix`,
  `TauCeti.projectiveSimplePairing`, `TauCeti.projectiveSimplePairing_isPerfPair`,
  `TauCeti.ExactK0`, `TauCeti.finiteModulesExactStructure`, `TauCeti.resK0`, `TauCeti.indK0` and
  `TauCeti.reductionK0`.
- **Ordinary Brauer induction.** `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`.
- **Ordinary column orthogonality.** `TauCeti.sum_characterTable_mul_conj` (CharacterTheory §3.5):
  `∑_χ χ(g) conj(χ(h)) = |C_G(g)|` when `g` and `h` are conjugate and `0` otherwise.

Planned by other roadmaps, and imported by name and section:

- [SemisimpleAlgebras](../SemisimpleAlgebras/README.md), Layers 0–2: the Jacobson radical, simple
  modules and Artin–Wedderburn for `k[G] / rad k[G]`. `k[G]` itself is not semisimple here.
- [QuiverRepresentations](../QuiverRepresentations/README.md), Layer 3: radical powers,
  composition multiplicities, projective covers, indecomposable projectives and its
  composition-factor Cartan matrix, whose orientation `[P_i : S_j]` is the transpose of the native
  `TauCeti.cartanMatrix`.
- [GrothendieckEulerForms](../../GrothendieckEulerForms/README.md), Layers 2 and 4: exact and split
  `K₀`, the Cartan map of a finite-dimensional algebra and the projective/simple pairing.
- [ModularInduction](../ModularInduction/README.md), Layers 0, 1 and 3: the Grothendieck group
  `modRepK0 k G` of `k[G]`, its simple-class basis, restriction, induction, the field-extension ring
  homomorphism `modRepK0.baseChange` (Layer 1), and the reduction of `ℤ`-forms (Layer 3). No second
  Grothendieck group is defined here.
- [CharacterTheory](../CharacterTheory/README.md), §3.5 (primitive central idempotents over an
  algebraically closed field, column orthogonality), §4.3 (central characters) and §4.5 (Brauer's
  splitting field `ℚ(ζ_e)` and its realization adapters).
- [InductionRestriction](../InductionRestriction/README.md), Layer 6: ordinary Brauer induction from
  elementary subgroups, an input to the surjectivity of the decomposition map.
- [RamificationOfCompleteDiscretelyValuedFields](../../RamificationOfCompleteDiscretelyValuedFields/README.md),
  §4a.3: for a complete discretely valued field `K` with perfect residue field `k`, the completion
  `K′` of the maximal unramified extension `K^ur` is complete for a discrete valuation with
  `e(K′/K) = 1` and residue field an algebraic closure of `k`. §7.2 uses it for the field `K` of
  §1.1, whose residue field is finite; no such extension is constructed here.
- ArithmeticGaloisDuality, §R02.4.4 (*Surjectivity of the decomposition map*): for a finite
  extension `K` of `ℚ_p` containing the `|G|`-th roots of unity, with residue field `k`, the
  decomposition map `d : modRepK0 K G → modRepK0 k G` by reduction of stable lattices, its
  independence of the lattice, its compatibility with `modRepK0.ind` and `modRepK0.res`, and the
  surjectivity of `d ⊗ ℚ`. §1.2 keeps the reduction of lattices over an arbitrary `p`-modular
  system, and §2.4 the decomposition map of such a system; they differ from §R02.4.4 in admitting
  `K` without the `|G|`-th roots of unity (the system of §1.1 contains only the `e`-th roots; for
  `C₂ × C₂` at `p = 3` it has `K = ℚ₃`, without `i`). §2.4 adds integral surjectivity, which
  §R02.4.4 does not plan, and the compatibility with `modRepK0.baseChange` and with a change of
  system.
- GL2AutomorphicRepresentationsAndTransfer, §R17.5.11: the Brauer character of a representation
  over an algebraically closed field of characteristic `p`, for a fixed identification
  `τ : μ_m(k) ≃ μ_m(ℂ)` of prime-to-`p` roots of unity, with conjugacy invariance, additivity,
  agreement with the ordinary character of a stable lattice on `p`-regular elements, and recognition
  of composition factors; and, from its proof of recognition, the pairing
  `⟨Φ_{P_S}, φ_T⟩ = dim Hom_{k[G]}(P_S, T)` of the Brauer characters of projective covers with
  those of simple modules, the duality of the two families and the linear independence of the
  simple Brauer characters. Layer 2 specializes `τ` to the one fixed by the modular system and adds
  the remaining formulas and the spanning half of the basis theorem (§2.2); §3.1 extends the
  pairing from covers and simples to an arbitrary projective module and an arbitrary module.

The Fong–Swan lifting theorem for finite solvable groups is
GL2AutomorphicRepresentationsAndTransfer §R17.5.12 and is not restated here.

## Conventions

Fix a finite group `G`, a prime `p`, the exponent `e` of `G` and its prime-to-`p` part `e'`. An
element `g` is `p`-regular when `Nat.Coprime p (orderOf g)` and `p`-singular otherwise. The
`p`-part and `p'`-part of `g` are the native `TauCeti.pPart p g` (of `p`-power order) and
`TauCeti.pFreePart p g` (of order prime to `p`). For a generator `g` of `C₆` and `p = 2` they are
`g³` (order `2`) and `g⁴` (order `3`), with `g³ g⁴ = g`. The **`p`-section** of a `p`-element `x`
is the set of `g` whose `p`-part is conjugate to `x`. The native induction library indexes its
sections by the `p`-regular part instead (`TauCeti.pSectionIndicator`); the two indexings are not
interchangeable.

A **`p`-modular system** `(K, O, k)` is a complete discrete valuation ring `O` with maximal ideal
`m = IsLocalRing.maximalIdeal O`, `IsAdicComplete m O`, fraction field `K` with `CharZero K`, and
residue field `k = IsLocalRing.ResidueField O` of characteristic `p`; `k̄` denotes a fixed algebraic
closure of `k`. The system is **splitting** for `G` when `K` contains a primitive `e`-th root of
unity; `k` then contains a primitive `e'`-th root. A field `k` is a **splitting field** for `G`,
or **splits** `G`, when every simple `k[G]`-module is absolutely simple, equivalently has
endomorphism ring `k` (Webb, §9.2 and Proposition 9.2.5, pp. 142–143); for a splitting system both
`K` and `k` split `G` and all its subgroups (CharacterTheory §4.5 for `K`, §2.3 for `k`).
All subgroups, centralizers and quotients of `G` use the same system and the same root lifting:
reduction modulo `m` is a bijection from the `e'`-th roots of unity of `O` to those of `k`, and
the **Brauer character** of a `k[G]`-module sends a `p`-regular `g` to the sum of the lifts of the
eigenvalues of `g`, read in `ℂ` through the embedding of the cyclotomic field fixed in Layer 1. It
is not the trace in `k` cast to `ℂ`: the trivial `𝔽₂[C₃]`-module `𝔽₂²` has trace `0` at `1` in `𝔽₂`
and Brauer character value `2` there.

Decomposition numbers `d_{χφ}` have rows indexed by the ordinary irreducible characters `Irr(G)`
and columns by the irreducible Brauer characters `IBr(G)`. The native Cartan matrix has entries
`C i j = [P j : S i]` (rows simples, columns projectives), where `P j` is the projective cover of
`S j`; Brauer reciprocity reads `C = Dᵀ D`. A **block** of `R[G]` (`R` a commutative ring) is a
primitive idempotent of the centre `Z(R[G])`, written `e_B`; it is not a Wedderburn factor of a
semisimple algebra. The **augmentation** of `k[G]` is the coefficient sum, the native
`MonoidAlgebra.lift k k G 1`; the **principal block** `B₀(G)` is the block with nonzero
augmentation, equivalently the block acting as the identity on the trivial module. The character
pairing is the native bilinear one, `⟨f₁, f₂⟩ = |G|⁻¹ ∑_g f₁(g) f₂(g⁻¹)`; on characters complex
conjugation is evaluation at the inverse.

## Exact supplier contracts

### From Mathlib

`MonoidAlgebra` (a structure with `MonoidAlgebra.coeff`, `MonoidAlgebra.ofCoeff`,
`MonoidAlgebra.mapDomain`, `MonoidAlgebra.mapRingHom`, `MonoidAlgebra.lift`), `Subalgebra.center`,
`Representation`, `FDRep`, `ModuleCat`, `IsSimpleModule`, `CompleteOrthogonalIdempotents`,
`IsIdempotentElem`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`,
`IsDiscreteValuationRing`, `IsAdicComplete`, `IsLocalRing.ResidueField`, `IsLocalRing.residue`,
`IsFractionRing`, `IsAlgClosed`, `CharP`, `ConjClasses`, `Subgroup.centralizer`,
`Subgroup.normalizer`, `Subgroup.subgroupOf`, `IsPGroup`, `Sylow`, `MulAut.conj`, `IsConj`,
`integralClosure` (the algebraic integers `integralClosure ℤ ℂ`), `Ideal.IsMaximal`,
`starRingEnd`, the complete lattice `Subgroup G` with its `sSup`, `Subgroup.Normal`,
`Subgroup.Characteristic`, `Representation.IsIrreducible`, `Representation.Equiv`,
`Representation.asModule`, `Representation.asAlgebraHom`, `Representation.character`,
`Representation.ofQuotient`, `FractionRing`, `IsPrimitiveRoot`,
`Monoid.exponent`, `FGModuleCat`, `Module.Free`, `Module.Finite`, `IsNoetherian`, `IsArtinian`,
`IsArtinianRing`, `Ring.jacobson_le_of_eq_bot`, `IsSemisimpleRing.jacobson_eq_bot`,
`Submodule.span`, `Matrix.of`, `Matrix.transpose`, and the DVR
instance on the integers of a completion at a finite place
(`Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean`). Assumed: the stated
definitions, nothing beyond their docstrings.

### From Tau Ceti

The declarations listed under *Already in the libraries*, at the files named there and in
`TauCeti/RepresentationTheory/GrothendieckGroup/` (`CartanMatrix.lean`,
`GroupAlgebra/Restriction.lean`, `GroupAlgebra/Induction.lean`, `GroupAlgebra/LatticeDefect/Basic.lean`),
`TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean`,
`TauCeti/Algebra/Module/ProjectiveCover/`, `TauCeti/RingTheory/Idempotents/Primitive/`,
`TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean`, and
`TauCeti.Representation.primitiveCentralIdempotent`, `TauCeti.Representation.centralCharacter`,
`TauCeti.Cyclotomic.complexRoot`, the irreducible complex characters
`TauCeti.irreducibleCharacters` and their enumeration `TauCeti.irreducibleCharacter`
(`TauCeti/RepresentationTheory/CharacterTable/Table.lean`), the character kernel
`Representation.mem_ker_iff_char_eq` (root namespace, in
`TauCeti/RepresentationTheory/CharacterTable/Kernel.lean`),
`FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot`, the pullback of class functions
`TauCeti.ClassFunction.comap` (`TauCeti/RepresentationTheory/CharacterTable/ClassFunction.lean`)
and the radical criterion `TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul`
(`TauCeti/RingTheory/Jacobson/Basic.lean`). For §§6.1–6.2: the relative norm
`Representation.relNormInvariants`, `Representation.relNorm_apply_of_forall_apply_eq` and
`Representation.relNorm_comp_norm` (root namespace, in
`TauCeti/RepresentationTheory/RelativeNorm.lean`) and the projectivity criterion
`Rep.moduleProjective_of_id_mem_range_norm_linHom` (root namespace, in
`TauCeti/RepresentationTheory/NormSplit/Basic.lean`). For the statements of
§§2.4 and 3.1: the Jordan–Hölder multiplicity `TauCeti.jordanHolderMultiplicity`
(`TauCeti/RingTheory/CompositionSeries/Multiplicity.lean`), scalar extension of representations
`Representation.baseChange` (root namespace, in `TauCeti/RepresentationTheory/BaseChange.lean`),
`TauCeti.finiteProjectiveModules` (`TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean`),
`TauCeti.IsIndecomposableModule` (`TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean`),
`TauCeti.IsExhaustiveSimpleFamily` and `TauCeti.IsExhaustiveIndecomposableProjectiveFamily`
(`GrothendieckGroup/SimpleBasis.lean` and `GrothendieckGroup/ProjectiveBasis.lean`), and
`TauCeti.IsProjectiveCover` (`TauCeti/Algebra/Module/ProjectiveCover/Basic.lean`). Assumed of
them: what their statements say. In particular
`TauCeti.Representation.primitiveCentralIdempotent` requires an algebraically closed field in
which `|G|` is invertible, `TauCeti.cartanMatrix` is taken for
chosen exhaustive families of pairwise non-isomorphic simples and indecomposable projectives, and
`TauCeti.reductionK0` reduces a finitely generated `ℤ`-form only.

### From TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

Layers 0–2: the radical, the simple-module dictionary and Artin–Wedderburn uniqueness.

### From TauCetiRoadmap.RepresentationTheory.QuiverRepresentations

Layer 3: radical filtrations, composition multiplicities and its transposed Cartan matrix.

### From TauCetiRoadmap.GrothendieckEulerForms

Layers 2 and 4: exact and split `K₀`, the Cartan map and the projective/simple pairing.

### From TauCetiRoadmap.RepresentationTheory.ModularInduction

Layer 0 (`modRepK0 k G` and its simple-class basis), Layer 1 (restriction, induction,
`modRepK0.baseChange`, commuting with restriction and induction), Layer 3 (reduction of
`ℤ`-forms). For `G = 1` and `𝔽₂ ⊆ 𝔽₄`, `modRepK0.baseChange` sends the class of the trivial module
to the class of the trivial module.

### From TauCetiRoadmap.RepresentationTheory.CharacterTheory

§3.5, §4.3 and §4.5 as described under *Scope and ownership*.

### From TauCetiRoadmap.RepresentationTheory.InductionRestriction

Layer 6: every ordinary character is a `ℤ`-combination of characters induced from elementary
subgroups.

### From TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields

§4a.3: for `K` complete discretely valued with perfect residue field `k`, the completion `K′` of
`K^ur` is complete discretely valued with `e(K′/K) = 1` and residue field an algebraic closure of
`k`. Assumed: exactly this statement, for `K` a finite extension of `ℚ_p`. For `K = ℚ₂(ζ₃)`,
`K′` is the completion of `ℚ₂^ur`, with uniformizer `2` and residue field an algebraic closure of
`𝔽₄`.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.4.4, *Surjectivity of the decomposition map*: for a finite extension `K` of `ℚ_p` containing
the `|G|`-th roots of unity, with residue field `k`, the decomposition map
`d : modRepK0 K G → modRepK0 k G` defined by reducing a `G`-stable lattice, independent of the
lattice, commuting with `modRepK0.ind` and `modRepK0.res`, with `d ⊗ ℚ` surjective. Assumed:
exactly these statements. §2.4 proves that its decomposition map agrees with this one whenever
both are defined.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

§R17.5.11: the Brauer character for a chosen `τ`, its value `n` at `1`, conjugacy invariance,
additivity on exact sequences, agreement with the ordinary character of a full stable lattice on
`p`-regular elements, and the fact that two modules have the same Brauer character exactly when
they have the same composition factors with multiplicity. From its proof of that recognition, over
an algebraically closed `k`: the pairing
`|G|⁻¹ ∑_{g p-regular} φ_{P_S}(g⁻¹) φ_T(g) = dim Hom_{k[G]}(P_S, T)` of the Brauer characters of
the projective cover `P_S` of a simple module `S` and of a simple module `T`, which is `1` for
`T ≅ S` and `0` otherwise, and the linear independence of the simple Brauer characters.

## How to read the build

Layer 0 fixes sections of elements, the `π`-cores of finite groups and the block decomposition of
the centre of a group algebra over any commutative ring. Layer 1 constructs a splitting
`p`-modular system, stable lattices and the lifting of central idempotents. Layer 2 specializes
the imported Brauer characters, proves their basis theorem and residue splitting, and constructs
the decomposition map. Layer 3 lifts
projectives and proves Brauer reciprocity. Layer 4 compares blocks over `K`, `O` and `k` and
partitions `Irr(G)` and `IBr(G)` into blocks. Layer 5 develops generalized decomposition numbers
and their orthogonality. Layer 6 constructs relative traces, the Brauer homomorphism, Brauer pairs
and defect groups. Layer 7 proves Brauer's three main theorems, and Layer 8 the normal-subgroup
theorems and the worked examples. `README.md` is normative; `Suggested.lean` states the headline
theorems that are statable at the pins, with the five definitions they need.

In the former milestone numbering `M0`–`M8`, milestone `Mk` is Layer `k` (`k = 0, …, 8`), except
that block-section orthogonality, formerly in `M5`, is §7.2.

## Layer 0: element sections, cores and the centre of the group algebra

### 0.1 Sections

Using the native `TauCeti.pPart`, define the `p`-section of a `p`-element `x` and prove that the
sections of a set of representatives of the conjugacy classes of `p`-elements partition `G`. Prove
the parametrization: `g ↦ pFreePart p g` is a bijection from the elements of the section of `x`
with `p`-part exactly `x` to the `p`-regular elements of `C_G(x)`, it is equivariant for `C_G(x)`,
and it induces a bijection from the `G`-classes in the section of `x` to the `p`-regular classes
of `C_G(x)`. The sources supply only the factorisation `g = pPart p g · pFreePart p g` into
commuting factors and the conjugacy of the factors of conjugate elements (Webb, Lemma 9.3.4,
p. 146; Martínez, p. 3); the parametrization and the class bijection are proved here from them and
from `TauCeti.pFreePart_conj`: the `p`-part of `g` is `x` exactly when `g = x s` with `s` a
`p`-regular element of `C_G(x)`, and two elements with `p`-part `x` are `G`-conjugate exactly when
their `p`-free parts are `C_G(x)`-conjugate, because a conjugator carrying one to the other
carries `x` to `x`. Consequently the number of conjugacy classes of `G` is the sum over `x` of the
number of `p`-regular classes of `C_G(x)`. Prove that the factors commute with group
homomorphisms: `φ (pPart p g) = pPart p (φ g)`. *Needs:* Tau Ceti `TauCeti.pPart`,
`TauCeti.pFreePart`, `TauCeti.eq_pPart`, `TauCeti.pPart_conj`, `TauCeti.pFreePart_conj`; Mathlib
`ConjClasses`, `Subgroup.centralizer`.

- The sections of distinct representatives are disjoint and cover `G`.
- The class bijection preserves class sizes up to the factor `|G : C_G(x)|`:
  `|class of g in G| = |G : C_G(x)| · |class of pFreePart p g in C_G(x)|`.

**Checks.**
- `S₃`, `p = 2`: the sections of `1` and of a transposition have `3` elements each (the identity
  and the two `3`-cycles; the three transpositions), and `2 + 1 = 3` classes of `S₃` arise as
  `2` regular classes of `S₃` plus `1` of `C_{S₃}((12)) = C₂`.
- `S₃`, `p = 3`: sections of sizes `4` (identity and transpositions) and `2` (the `3`-cycles); at
  `p = 2` the `3`-cycles lie in the section of `1`, whereas indexing by the `p'`-part would group
  the transpositions with the identity.
- `C₆`, `p = 2`, `g` a generator: `pPart` and `pFreePart` of `g²` are `1` and `g²`, and of `g` are
  `g³` and `g⁴`; the order formulas give `2 · 3 = 6`.

### 0.2 Block idempotents

Define `IsBlockIdempotent b` for `b` in the centre of `R[G]` as the native
`TauCeti.IsPrimitiveIdempotent b` in `Subalgebra.center R (MonoidAlgebra R G)` (Webb,
Propositions 12.1.1–12.1.2, p. 227; Martínez, Theorem 2.11, p. 15). For a field `k`, the centre is
finite-dimensional, hence Artinian, and the native
`TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` gives a complete orthogonal
family of block idempotents. *Needs:* Tau Ceti `TauCeti.IsPrimitiveIdempotent`,
`TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent`; Mathlib `MonoidAlgebra`,
`Subalgebra.center`, `CompleteOrthogonalIdempotents`.

- `complete_blockIdempotents_unique`: two complete orthogonal families of block idempotents of
  `k[G]`, indexed by finite types, agree up to a bijection of the index types. The proof uses
  commutativity of the centre: each primitive idempotent `f` of a commutative ring satisfies
  `f = f · ∑ b_i`, so `f` equals exactly one `b_i`.
- The block algebra `e_B k[G]` is a ring with identity `e_B`, and `k[G] ≃ ∏_B e_B k[G]` as
  algebras. Every `k[G]`-module `M` splits as `⊕_B e_B M`, functorially; an indecomposable module
  lies in exactly one block (Webb, Corollary 12.1.3, p. 228).
- Transport: a group isomorphism `G ≃ G'` maps blocks to blocks. Scalar extension along `k ⊆ k'`
  maps a block of `k[G]` to a sum of blocks of `k'[G]`, not necessarily one.

**Checks.**
- `𝔽₂[C₂] ≅ 𝔽₂[ε]/(ε²)`: the identity is the only block idempotent; `0` is excluded by the
  native `ne_zero` field, and `ε` is not idempotent.
- `𝔽₃[C₂]`: `e₊ = −(1 + t)` and `e₋ = −(1 − t)` (that is, `(1 ± t)/2`) are the two blocks;
  `1 = e₊ + e₋` is idempotent and central but not primitive.
- `𝔽₂[C₃] → 𝔽₄[C₃]`: the block `r + r²` of `𝔽₂[C₃]` splits into the two blocks
  `1 + α² r + α r²` and `1 + α r + α² r²` of `𝔽₄[C₃]` (with `α² + α + 1 = 0`), so scalar extension
  does not preserve primitivity.

### 0.3 Cores

For a set `π` of primes, a finite group is a **`π`-group** when every prime divisor of its order
lies in `π`; `π'` is the set of primes not in `π`. Define the **`π`-core** `O_π(G)` of the finite
group `G` as the supremum in `Subgroup G` of the normal `π`-subgroups of `G`. For a prime `p`,
`O_p(G)` is the `π`-core for `π = {p}`, the largest normal `p`-subgroup (Webb, §6.2, p. 88), and
the **`p'`-core** `O_{p'}(G)` is the `π`-core for `π = {p}'`. Define `pPrimeCore p G` as the
supremum in `Subgroup G` of the normal subgroups `N` with `Nat.Coprime (Nat.card N) p`; for a
prime `p` these are exactly the normal `{p}'`-subgroups, so `pPrimeCore p G = O_{p'}(G)`, the
subgroup of the kernel theorem (§8.3). Its API, for every set of primes `π`:

- `O_π(G)` is a `π`-group: for normal `π`-subgroups `N₁`, `N₂` the product `N₁N₂` is a normal
  subgroup of order `|N₁| |N₂| / |N₁ ∩ N₂|`, again a `π`-group, and `G` has finitely many
  subgroups.
- `O_π(G)` is characteristic, since an automorphism of `G` permutes the normal `π`-subgroups. A
  normal subgroup of `G` lies in `O_π(G)` exactly when it is a `π`-group, and `O_π(G) = G` exactly
  when `G` is a `π`-group.
- `O_π(G ⧸ O_π(G)) = 1`: the preimage in `G` of a normal `π`-subgroup of the quotient is a normal
  `π`-subgroup of `G`.
- For `N ⊴ G`, `O_π(N)` and `O_π(G) ⊓ N` are the same subgroup of `G`: `O_π(N)` is characteristic
  in `N`, hence normal in `G`, and `O_π(G) ⊓ N` is a normal `π`-subgroup of `N`.
- A surjective homomorphism `f : G → H` maps `O_π(G)` into `O_π(H)`, and onto it when `ker f` is a
  `π`-group, for then the preimage of `O_π(H)` is a normal `π`-subgroup of `G`.
- `O_p(G)` is the intersection of the Sylow `p`-subgroups of `G` (Webb, proof of
  Corollary 12.3.4, p. 236).

*Needs:* Mathlib `Subgroup.Normal`, `Subgroup.Characteristic`, `Sylow`, `Nat.card`, `Nat.Coprime`,
the complete lattice `Subgroup G`.

**Checks.**
- `S₃`, whose normal subgroups have orders `1`, `3`, `6`:
  `O_3(S₃) = O_{2'}(S₃) = C₃ = pPrimeCore 2 S₃` and `O_2(S₃) = O_{3'}(S₃) = 1 = pPrimeCore 3 S₃`.
  The largest normal `p`-subgroup, a wrong model for the `p'`-core, would give `1` at `p = 2` and
  `C₃` at `p = 3`, the reverse.
- `A₄`, whose normal subgroups have orders `1`, `4`, `12`:
  `O_2(A₄) = O_{3'}(A₄) = V₄ = pPrimeCore 3 A₄`, the unique Sylow `2`-subgroup, and
  `O_3(A₄) = O_{2'}(A₄) = 1 = pPrimeCore 2 A₄`.
- A `p`-group has `pPrimeCore p G = 1`, a group of order prime to `p` has `pPrimeCore p G = G`,
  and the trivial group gives `1`.
- Normality of `N` is needed: for `N = ⟨(12)⟩ ≤ S₃`, `O_2(N) = N`, whereas
  `O_2(S₃) ⊓ N = 1`.
- The kernel condition is needed for the image: the sign map `S₃ → C₂` has kernel `C₃`, not a
  `2`-group, and sends `O_2(S₃) = 1` to `1 ≠ C₂ = O_2(C₂)`; the quotient map
  `S₃ → S₃ ⧸ C₃` with `π = {3}` has a `3`-group as kernel and sends `O_3(S₃) = C₃` onto
  `1 = O_3(C₂)`.

### Examples

`𝔽₂[S₃]` has the two blocks `1 + r + r²` and `r + r²` (`r` a `3`-cycle), with sum `1` and product
`0`; `𝔽₃[S₃]` has the single block `1`.

### Dependencies

Mathlib `MonoidAlgebra`, `Subalgebra.center`, `CompleteOrthogonalIdempotents`,
`Subgroup.Normal`, `Subgroup.Characteristic`, `Sylow`; Tau Ceti `TauCeti.pPart` and its API,
`TauCeti.IsPrimitiveIdempotent`,
`TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent`.

## Layer 1: modular systems, lattices and lifting

### 1.1 A splitting modular system

Let `F = ℚ⟮TauCeti.Cyclotomic.complexRoot e⟯ ⊆ ℂ` and choose a finite place `v` of `F` over `p`. Let
`K = F_v`, `O` its valuation ring with Mathlib's DVR instance, and `k` its residue field. Prove that
`(K, O, k)` is a splitting `p`-modular system, that `k` is generated over `𝔽_p` by the reduction of
`complexRoot e'`, and that reduction is a bijection from the `e'`-th roots of unity of `O` onto
those of `k`, multiplicative and compatible with powers (Webb, §9.4, p. 148, for the splitting
system; Lemma 10.1.1, p. 170, for the bijection of roots of unity). Prove that `K` splits every
subgroup of `G`, from CharacterTheory §4.5. All
later layers use this system and its root bijection for every subgroup, centralizer and quotient
of `G`. *Needs:* Mathlib `IsDiscreteValuationRing`, the completion at a finite place; Tau Ceti
`TauCeti.Cyclotomic.complexRoot`; CharacterTheory §4.5.

- The canonical map `F → K` is injective and restricts to a bijection from the `e`-th roots of unity
  of `F` onto the `e`-th roots of unity of `K`; `K` can contain further roots of unity (for `e = 1` and
  `p = 5`, `F = ℚ` has two and `K = ℚ₅` has four).
- For a subgroup `H ≤ G`, the system is splitting for `H`, with the same root bijection.

**Checks.**
- `e = 1`: `F = ℚ`, `K = ℚ_p`, `O = ℤ_p`, `k = 𝔽_p`.
- `e = 3`, `p = 2`: `ℚ₂(ζ₃)` is the unramified quadratic extension with residue field `𝔽₄`; `𝔽₂`
  would not contain a root of `X² + X + 1`.
- `e = 3`, `p = 3`: `ℚ₃(ζ₃)` is ramified of degree `2` with residue field `𝔽₃`; `e' = 1` and the
  root bijection is `1 ↦ 1`.

### 1.2 Stable lattices and their reduction

Every finite-dimensional `K[G]`-module `V` contains a `G`-stable full `O`-lattice, free of rank
`dim V`: the `O`-span of the translates of a basis. For two such lattices `L₁, L₂` the reductions
`L₁/mL₁` and `L₂/mL₂` have the same class in `modRepK0 k G` (Webb, Theorem 9.4.8, p. 153; Martínez,
Theorem 1.7 and Lemma 1.8, p. 4). For `K` finite over `ℚ_p` containing the `|G|`-th roots of unity
this independence is part of ArithmeticGaloisDuality §R02.4.4; here it is proved for an arbitrary
`p`-modular system, as the system of §1.1 requires. The class is additive on short exact sequences
of `K[G]`-modules and compatible with restriction, induction, conjugation and tensor products.
*Needs:* Mathlib `IsDiscreteValuationRing`, `IsFractionRing`; ModularInduction Layers 0–1.

- A sub-`O[G]`-module of a stable lattice of full rank is a stable lattice.
- `L ⊆ L'` both stable implies `L'/L` is a finite-length `O[G]`-module whose composition factors
  are `k[G]`-modules.

**Checks.**
- `G = 1`, `V = K`: the lattices `O` and `mO` both reduce to the class `1`, although the reductions
  `O/m` and `m/m²` are different subquotients of `V`.
- `G = C₂`, `p = 2`, `V = K[C₂]`: the lattices `O[C₂]` and `O(1 + t) ⊕ O(1 − t)` reduce to the
  non-split regular module and to `k ⊕ k`; the two are not isomorphic but have class `2` in
  `modRepK0 k C₂`.
- `V = 0`: the zero lattice reduces to the class `0`.

### 1.3 Lifting idempotents and projectives over `O[G]`

Every idempotent of `k[G]` lifts to an idempotent of `O[G]`, by the native
`IsAdicComplete.exists_isIdempotentElem_eq` applied to `O[G]`, which is `m`-adically
complete as a finite free `O`-module, with the kernel of reduction equal to `m • O[G]`. Every
direct summand of the reduction of a finitely generated free `O[G]`-module lifts to a projective
`O[G]`-module, by `TauCeti.exists_projective_quotient_smul_top_linearEquiv` (Webb,
Propositions 9.4.3 and 9.4.5, pp. 149–151). What is added here: an idempotent of `k[G]` is
primitive exactly when its lifts are; a central idempotent has a unique central lift; and reduction
`Z(O[G]) → Z(k[G])` is surjective, because the class sums form an `O`-basis of `Z(O[G])` and a
`k`-basis of `Z(k[G])`. *Needs:* Tau Ceti `IsAdicComplete.exists_isIdempotentElem_eq`,
`TauCeti.exists_projective_quotient_smul_top_linearEquiv`; Mathlib `IsAdicComplete`.

- `existsUnique_blockIdempotent_map_residue`: for a complete discrete valuation ring `O`, every
  block idempotent of `k[G]` is the reduction of exactly one block idempotent of `O[G]`.
- Projective indecomposable `O[G]`-modules correspond, through reduction, to projective
  indecomposable `k[G]`-modules, and hence to simple `k[G]`-modules.

**Checks.**
- `O = ℤ₂`, `G = 1`: the idempotents `0, 1` of `𝔽₂` lift to `0, 1`, although `(2)` is not
  nilpotent, so the nilpotent-kernel theorem does not apply.
- `O = ℤ₂`, `G = C₃`: the blocks `1 + r + r²` and `r + r²` of `𝔽₂[C₃]` lift to
  `(1 + r + r²)/3` and `(2 − r − r²)/3`, both in `ℤ₂[C₃]` since `3` is a unit.
- `O = ℤ₂`, `G = C₂`: the ordinary idempotents `(1 ± t)/2` are not in `ℤ₂[C₂]`; the only block
  idempotent of `ℤ₂[C₂]` is `1`, matching the single block of `𝔽₂[C₂]`.

### Examples

For `C₂` at `p = 2` with `O = ℤ₂`, the regular lattice `ℤ₂[C₂]` is indecomposable projective with
reduction the projective cover of the trivial module, and its ordinary character is `1 + sgn`.

### Dependencies

Layer 0; Mathlib discrete valuation rings and completions; Tau Ceti complete-adic lifting;
CharacterTheory §4.5; ModularInduction Layers 0–1.

## Layer 2: Brauer characters and decomposition

### 2.1 Brauer characters

Take the Brauer character of a finite-dimensional `k̄[G]`-module from
GL2AutomorphicRepresentationsAndTransfer §R17.5.11, with `m = e'` and `τ` the composite of the
root bijection of §1.1 with `F ⊆ ℂ`. Its value at `1`, conjugacy invariance, additivity and
agreement with ordinary characters of stable lattices on `p`-regular elements are imported. Prove
here: the Brauer character of a tensor product is the product, of the dual is `g ↦ φ(g⁻¹)`, of a
restriction is the restriction, of an inflation is the composite, and of an induced module is
`g ↦ |H|⁻¹ ∑_{x ∈ G, x g x⁻¹ ∈ H} φ(x g x⁻¹)` on `p`-regular `g` (Webb, Proposition 10.1.3,
p. 170; Martínez, Lemmas 1.1–1.2, pp. 2–3, and the induction formula on p. 37). Modules over `k`
are compared with modules over `k̄` by scalar extension, using ModularInduction Layer 1
`modRepK0.baseChange`. *Needs:* GL2AutomorphicRepresentationsAndTransfer §R17.5.11; §1.1;
ModularInduction Layer 1.

- The Brauer character is constant on `p`-regular classes and its values are sums of `e'`-th roots
  of unity.
- A semisimple `k[G]`-module is determined up to isomorphism by its Brauer character.

**Checks.**
- `C₃` over `𝔽₄`, the module where `r` acts by `α`: with `α ↦ ζ₃`, the Brauer character takes
  values `1, ζ₃, ζ₃²`; the dual takes `1, ζ₃², ζ₃`, so a model ignoring the inverse in the dual is
  wrong.
- The regular `𝔽₂[C₂]`-module and `𝔽₂ ⊕ 𝔽₂` both have Brauer character `2` at `1`; only the second
  is semisimple, so recognition needs semisimplicity.
- `Ind_1^{S₃}(1)` at `p = 2` has Brauer values `6, 0` on the classes of `1` and `r`, equal to
  `2·(1, 1) + 2·(2, −1)`.

### 2.2 The basis theorem and the count

The irreducible Brauer characters of `G` over an algebraically closed `k` form a basis of the
complex class functions on the `p`-regular classes (Webb, Theorem 10.2.2, p. 176; Martínez,
Proposition 1.5, p. 3, and Theorem 1.9, p. 5). Their linear independence is imported from
GL2AutomorphicRepresentationsAndTransfer §R17.5.11; what is proved here is the count below, which
gives as many irreducible Brauer characters as `p`-regular classes, so that the independent family
also spans. *Needs:* for the basis, GL2AutomorphicRepresentationsAndTransfer §R17.5.11, §2.1 and the
count below.

- `card_simpleModules_eq_card_pRegularClasses`: over an algebraically closed field of
  characteristic `p`, a complete family of pairwise non-isomorphic simple `k[G]`-modules has as
  many members as `G` has `p`-regular conjugacy classes (Webb, Theorem 9.3.6, p. 147). Route,
  over any splitting field `k` of characteristic `p`: for a finite-dimensional `k`-algebra `A`,
  let `[A, A]` be the span of the commutators `ab − ba` and `T(A)` the set of `a` with
  `a^(p^n) ∈ [A, A]` for some `n`. Then `T(A)` is a subspace containing `[A, A]` and `rad A`, on a
  matrix algebra `M_n(k)` it consists of the trace-zero matrices, and when `k` splits `A`, so that
  `A / rad A` is a product of matrix algebras over `k`, the number of simple `A`-modules is the
  codimension of `T(A)` (Webb, Lemmas 9.3.1–9.3.2 and Proposition 9.3.3, pp. 145–146). For
  `A = k[G]`, `[A, A]` is spanned by the differences of conjugate elements (Webb, Lemma 9.3.5,
  p. 147). Every `g` is congruent to `pFreePart p g` modulo `T`, since the two commute and
  `(g − pFreePart p g)^(p^n) = pFreePart p g ^ (p^n) · (pPart p g ^ (p^n) − 1)` vanishes once `p^n`
  is a multiple of the order of `pPart p g`; and representatives of the `p`-regular classes are
  linearly independent modulo `T`, because modulo `[A, A]` the `p`-th power map is additive,
  raises scalars to the `p`-th power and maps `[A, A]` into itself, and a suitable power `p^n`
  fixes every `p`-regular element. So these representatives give a basis of `k[G] / T(k[G])`
  (Webb, proof of Theorem 9.3.6, p. 147). *Needs:* SemisimpleAlgebras Layers 0 and 2; Tau Ceti
  `TauCeti.pPart`, `TauCeti.pFreePart`, `TauCeti.pPart_mul_pFreePart`,
  `TauCeti.commute_pFreePart_pPart`, `TauCeti.orderOf_pPart`, `TauCeti.pFreePart_conj`; Mathlib
  `ConjClasses`.
- Over every splitting field `k` of characteristic `p` for `G` the count holds, and the Brauer
  characters of the simple `k[G]`-modules, computed on `k̄ ⊗_k −` for any identification of the
  prime-to-`p` roots of unity of `k̄` with those of `ℂ`, form the same basis (Webb, Theorems 9.3.6
  and 10.2.2, pp. 147 and 176): once `k` splits `G`, scalar extension to `k̄` is a bijection on
  isomorphism classes of simple modules (§2.3). In particular both hold over every field of
  characteristic `p` containing a primitive `e'`-th root of unity (§2.3). *Needs:* §2.3 and the
  two statements above.

**Checks.**
- `S₃`, `p = 3`: two simple modules (trivial, sign) and two `3`-regular classes (identity,
  transpositions); the Brauer table `[[1, 1], [1, −1]]` has determinant `−2 ≠ 0` in `ℂ`.
- `C_p` in characteristic `p`: one simple module and one `p`-regular class.
- `C₃` over `𝔽₂`: two simple modules (dimensions `1` and `2`) against three `2`-regular classes,
  so the count needs `k` to split `G`.
- `S₃` over `𝔽₂`, which splits `S₃` without containing a primitive cube root of unity: simple
  modules of dimensions `1` and `2` (the endomorphism ring of the second is `𝔽₂`) against the two
  `2`-regular classes, of `1` and of the `3`-cycles; the Brauer values `(1, 1)` and `(2, −1)` have
  determinant `−3 ≠ 0`. Neither the algebraically closed headline nor the root-of-unity criterion
  covers this field; the splitting-field statement does.
- The route on `S₃` at `p = 2`: `T(k[S₃])` has codimension `2`, with the identity and a
  `3`-cycle `r` independent modulo `T`, while a transposition `t` satisfies `(t − 1)² = 0` and so
  `t ≡ 1`; `T` is not `[A, A]`, which has codimension `3`, the number of classes.

### 2.3 Residue-field splitting

Prove that a field `k` of characteristic `p` containing a primitive `e'`-th root of unity is a
splitting field for `G` and all its subgroups (Brauer's splitting-field theorem; Webb,
Theorem 9.2.7, p. 144, states it for a field containing a primitive `m`-th root of unity with `m`
the exponent of `G`, and in characteristic `p` only the `p'`-part `e'` of `m` admits a primitive
root, so the statement here is its characteristic-`p` form, proved by the descent below). Route:
descend over the finite subfield `k₀ = 𝔽_p(ζ_{e'}) ⊆ k` generated by the root of unity (finite
because `ζ_{e'}` is integral over the prime field; Mathlib `IntermediateField.adjoin.finiteDimensional`),
with `k̄₀ ⊆ k̄` the algebraic closure of `k₀` inside `k̄`: it is an algebraic closure of `𝔽_p`, so it
is a splitting field for `G`, and `k̄₀/k₀` is a Galois extension because `k₀` is perfect (`k̄/k₀`
itself need not be algebraic, for instance when `k = 𝔽₄(T)`, so the descent is never run along
it). A `p`-regular element acts on a `k̄₀[G]`-module with eigenvalues in `μ_{e'}(k̄₀) = μ_{e'}(k₀)`,
so the Brauer character (§2.1, read on the scalar extension to `k̄`) of a Galois conjugate `M^σ`
of a simple `k̄₀[G]`-module `M`, for `σ ∈ Gal(k̄₀/k₀)`, equals that of `M`; by recognition (§2.1)
`M^σ ≅ M`, so every simple `k̄₀[G]`-module is Galois-stable. For a simple `k₀[G]`-module `T`, the
endomorphism ring is a finite division algebra, hence a field `k₁ ⊇ k₀` (Mathlib `littleWedderburn`),
and `k̄₀ ⊗_{k₀} T` is the direct sum of the `[k₁ : k₀]` Galois conjugates of `k̄₀ ⊗_{k₁} T`, which
is simple because `T` is absolutely simple over the perfect field `k₁` (its endomorphism ring over
`k₁[G]` is `k₁`); stability makes these conjugates isomorphic, so the endomorphism ring of
`k̄₀ ⊗_{k₀} T`, which is `k̄₀ ⊗_{k₀} k₁` of dimension `[k₁ : k₀]`, is a matrix algebra of dimension
`[k₁ : k₀]²`, forcing `k₁ = k₀`: every simple `k₀[G]`-module is absolutely simple and `k₀` is a
splitting field. Then pass from `k₀` to `k`: `k₀[G]/rad(k₀[G])` is a product of matrix algebras over `k₀` (SemisimpleAlgebras Layer 2),
so the ideal `k ⊗_{k₀} rad(k₀[G])` of `k[G]` is nilpotent with quotient the product of the
corresponding matrix algebras over `k`, which is semisimple; a nilpotent ideal lies in the radical,
since every left multiple of one of its elements is nilpotent (Tau Ceti
`TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul`), and the radical lies in every ideal with
semisimple quotient (Mathlib `IsSemisimpleRing.jacobson_eq_bot` and `Ring.jacobson_le_of_eq_bot`),
so `rad(k[G]) = k ⊗_{k₀} rad(k₀[G])`, `k[G]/rad(k[G])` is that product
of matrix algebras, and `k` is a splitting field (Webb, Chapter 9, Exercises 4 and 8(a), pp. 165–166,
and the remark on p. 144). Subgroups: the `p'`-exponent of `H ≤ G` divides `e'`, so `k₀` contains the
root of unity `H` needs. Prove the finite-field descent, the endomorphism comparison and the
radical base change used here, and identify the simple-class bases over `k₀`, `k` and `k̄`.
*Needs:* §2.1; Mathlib `littleWedderburn`, `IntermediateField.adjoin.finiteDimensional`,
`IsSemisimpleRing.jacobson_eq_bot`, `Ring.jacobson_le_of_eq_bot`; Tau Ceti
`TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul`; SemisimpleAlgebras Layer 2.

- Simple `k[G]`-modules are absolutely simple, and scalar extension to `k̄` is a bijection on
  isomorphism classes of simples: the radical base change above, applied to `k ⊆ k̄` once `k` is
  known to split `G` (Webb, Chapter 9, Exercise 8(a), p. 166).

**Checks.**
- `C₃`, `p = 2`: `𝔽₄` (which contains `ζ₃`) splits, with three one-dimensional simples; `𝔽₂` does not.
- `C₅`, `p = 5`: `e' = 1`, and `𝔽₅` splits `C₅` with the single trivial simple.
- `S₃`, `p = 2`: `e' = 3`, but `𝔽₂` already splits `S₃` (simples of dimensions `1` and `2`); the
  hypothesis is sufficient, not necessary.
- `C₃`, `p = 2`, `k = 𝔽₄(T)`: `k₀ = 𝔽₄`, `rad = 0` on both sides, and `k[C₃] = k³` with three
  one-dimensional simples, so the infinite field `k` splits `C₃`; a route applying the finite-field
  descent to `k` itself has no argument, since `k` is infinite and carries nontrivial division
  algebras. Against it, `𝔽₂(T)` does not split `C₃` (`𝔽₂` is algebraically closed in `𝔽₂(T)`, so
  no primitive cube root of unity, and `𝔽₂(T)[C₃] = 𝔽₂(T) × 𝔽₂(T)[x]/(x² + x + 1)` has simples of
  dimensions `1` and `2`): splitting passes up to extensions, not down to subfields.

### 2.4 The decomposition map

Define, for a `p`-modular system `(K, O, k)`, the decomposition map
`d : modRepK0 K G → modRepK0 k G` (from `G₀(K[G])` to `G₀(k[G])`) by reduction of stable lattices
(§1.2), and the decomposition numbers by `χ|_{p-reg} = ∑_φ d_{χφ} φ` with `d_{χφ} ∈ ℕ` (Webb,
Proposition 10.3.2, p. 182; Martínez, Definition 1.6 and Theorem 1.7, pp. 3–4; Serre, Part III,
§15.2). When `K` is a
finite extension of `ℚ_p` containing the `|G|`-th roots of unity this is the map of
ArithmeticGaloisDuality §R02.4.4, which proves `d ⊗ ℚ` surjective; the definition here differs in
admitting every `p`-modular system, among them the system of §1.1. Prove that `d` agrees with the
map of §R02.4.4 whenever both are defined. Prove that `d` is surjective, integrally, for a splitting
system: by InductionRestriction Layer 6, the trivial character is a `ℤ`-combination of
characters induced from elementary subgroups `E = C × Q`; for such `E` the Sylow `p`-subgroup is
normal, simple `k[E]`-modules inflate from the `p'`-quotient, and §1.3 lifts them; induction
commutes with reduction (§1.2), and the projection formula transfers the identity to every class
(Serre, Part III, §16.1, Theorem 33; Webb, Theorem 10.2.2 and Corollary 10.2.4, pp. 176–178, for
the consequence that the decomposition matrix has full rank). Prove that `d` commutes with
`modRepK0.baseChange` and with a change of splitting modular system. *Needs:* §§1.2–1.3, 2.1;
InductionRestriction Layer 6; Tau Ceti
`TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`; ModularInduction
Layer 1; ArithmeticGaloisDuality §R02.4.4 for the agreement.

- `span_decompositionRows_eq_top`: let `O` be a complete discrete valuation ring with
  `CharZero O` whose fraction field `K` contains a primitive `e`-th root of unity, with residue
  field `k` of any characteristic. Let `(S_i)`, indexed by a finite type, be pairwise
  non-isomorphic simple `k[G]`-modules, and `(L_c)` `G`-stable free `O`-lattices of finite rank such
  that every irreducible `K[G]`-module is isomorphic to some `K ⊗_O L_c`. Then the vectors
  `([k ⊗_O L_c : S_i])_i` of Jordan–Hölder multiplicities span `ℤ^ι` (Webb, remark after
  Corollary 10.2.4, p. 178). For a complete family `(S_i)` this is the integral surjectivity of
  `d` in the simple-class basis, the vector of `L_c` being the coordinate vector of
  `d [K ⊗_O L_c]` (§1.2). The family `(L_c)` may repeat a module or contain reducible ones, whose
  vectors are sums of those of irreducible ones, and `(S_i)` need not be complete, since a
  coordinate projection of a spanning family spans. For residue characteristic `0` and complete
  families without repetition, `D` is a permutation matrix.
- `d` is a ring homomorphism compatible with restriction and induction.
- When `p ∤ |G|`, for every `p`-modular system: reduction of stable lattices is a
  dimension-preserving bijection from the simple `K[G]`-modules to the simple `k[G]`-modules, so
  `d` is an isomorphism and the decomposition matrix is a permutation matrix (Webb,
  Theorem 9.4.11, p. 155, for a splitting system). Route without the splitting hypothesis: `|G|`
  is a unit of `O`, so by averaging every stable lattice is a projective `O[G]`-module and every
  `k[G]`-module is projective; by §1.3 reduction is then a bijection from the isomorphism classes
  of stable lattices to those of finite-dimensional `k[G]`-modules, compatible with direct sums;
  and a stable lattice `L` is indecomposable exactly when `K ⊗_O L` is simple, because for a
  submodule `V'` of `K ⊗_O L` the quotient `L/(L ∩ V')` is a stable lattice, hence projective, and
  `L ∩ V'` is a direct summand of `L`. The completeness of `O`, part of the definition of a
  `p`-modular system, is used through §1.3.

**Checks.**
- `S₃`, `p = 3`, rows trivial, sign, standard and columns trivial, sign: `D = [[1,0],[0,1],[1,1]]`,
  from `(2, 0) = (1, 1) + (1, −1)` on the classes of `1` and a transposition.
- `S₃`, `p = 2`, rows trivial, sign, standard and columns trivial, two-dimensional:
  `D = [[1,0],[1,0],[0,1]]`.
- `C₂`, `p = 2`: both ordinary characters reduce to the trivial module, `D = [[1],[1]]`, so `d`
  is not injective. Over `K = ℚ₂`, which contains `±1`, the map of ArithmeticGaloisDuality
  §R02.4.4 is also defined and gives the same `D`.
- `C₂ × C₂`, `p = 3`: `e = 2` and the system of §1.1 has `K = ℚ₃`, which does not contain the
  fourth root of unity `i`, so §R02.4.4 does not apply; `3 ∤ 4`, so `d` is an isomorphism and `D`
  is the `4 × 4` identity once each character `(±1, ±1)` is listed with its reduction.
- `C₃` over the non-splitting system `(ℚ₂, ℤ₂, 𝔽₂)`, `2 ∤ 3`: the simple `ℚ₂[C₃]`-modules have
  dimensions `1, 2` and so do the simple `𝔽₂[C₃]`-modules, and `D` is the `2 × 2` identity; over
  `ℤ₂[ζ₃]` it is the `3 × 3` identity. Completeness is needed: for the localization `ℤ_(7)`, which
  is not complete, `ℚ[C₃]` has two simple modules and `𝔽₇[C₃]` three, since `7 ≡ 1 mod 3`, so
  reduction is not a bijection although `7 ∤ 3`.
- Integral, not only rational: for `S₃` at `p = 3` the rows `(1, 0)`, `(0, 1)`, `(1, 1)` of `D`
  span `ℤ²`, whereas the columns `(2, 1)`, `(1, 2)` of the Cartan matrix span a sublattice of
  index `det C = 3`; surjectivity is a property of `d`, not of the Cartan map.

### Examples

For `C₃` at `p = 2` with `k = 𝔽₄`, `D` is the `3 × 3` identity after ordering the rows by the
lifts of `1, α, α²`; relabelling `α ↔ α²` permutes the columns, so the root bijection must be fixed
once for all subgroups.

### Dependencies

Layers 0–1; GL2AutomorphicRepresentationsAndTransfer §R17.5.11; ArithmeticGaloisDuality
§R02.4.4; InductionRestriction Layer 6; ModularInduction Layers 0–1; SemisimpleAlgebras Layers 0
and 2; Tau Ceti `TauCeti.jordanHolderMultiplicity`, `Representation.baseChange`,
`TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul`.

## Layer 3: projective modules, reciprocity and the Cartan matrix

### 3.1 Projective characters and Brauer reciprocity

For a simple `k[G]`-module `S_φ` with projective cover `P_φ` (QuiverRepresentations Layer 3;
`TauCeti.exists_isProjectiveCover_of_finite`), let `P̂_φ` be its lift to `O[G]` (§1.3) and `Φ_φ`
the ordinary character of `K ⊗ P̂_φ`. Prove that `Φ_φ` vanishes on `p`-singular elements (Martínez,
Proposition 1.12, p. 5), that `Φ_φ = ∑_χ d_{χφ} χ` (Webb, Theorem 9.5.4, p. 159), and that
`dim Hom_{k[G]}(P, U) = |G|⁻¹ ∑_{g p-regular} Φ_P(g⁻¹) φ_U(g)` for every projective `k[G]`-module `P`
and every finite-dimensional `k[G]`-module `U` (Webb, Proposition 10.2.1, p. 174). For `P` a
projective cover and `U` a simple module, read over `k̄` through §2.3, this is the pairing of
GL2AutomorphicRepresentationsAndTransfer §R17.5.11, which also gives the duality of the projective
characters and the irreducible Brauer characters; the formula here extends it to all `P` and `U`,
by the decomposition of `P` into projective covers (§1.3), the exactness of `Hom_{k[G]}(P, −)` and
the additivity of Brauer characters along a composition series of `U` (§2.1).
Prove Brauer reciprocity: `TauCeti.cartanMatrix P S … = Dᵀ D` for the families of covers and simples
(Webb, Proposition 9.5.1 and Corollary 9.5.6, pp. 157 and 160), hence `C` is symmetric and
positive definite with `det C ≠ 0`. Relate the identity to `TauCeti.projectiveSimplePairing` and
`TauCeti.cartanMap`, including the identification of bases. *Needs:* §§1.3, 2.1, 2.3, 2.4;
GL2AutomorphicRepresentationsAndTransfer §R17.5.11; CharacterTheory §4.5; QuiverRepresentations
Layer 3; GrothendieckEulerForms Layer 4; Tau Ceti `TauCeti.cartanMatrix`,
`TauCeti.projectiveSimplePairing_isPerfPair`.

- `cartanMatrix_eq_transpose_mul_decomposition`: let `O` be a complete discrete valuation ring
  with `CharZero O` whose fraction field `K` contains a primitive `e`-th root of unity, with
  residue field `k` of any characteristic. Let `(P_i)` and `(S_i)`, indexed by one finite type, be
  exhaustive families of pairwise non-isomorphic indecomposable finitely generated projective
  `k[G]`-modules and of pairwise non-isomorphic simple `k[G]`-modules, with `P_i` a projective
  cover of `S_i`, and let `(L_c)`, indexed by a finite type, be `G`-stable free `O`-lattices of
  finite rank whose scalar extensions `K ⊗_O L_c` are pairwise non-isomorphic irreducible
  `K[G]`-modules representing every irreducible one. Then `TauCeti.cartanMatrix P S …` equals
  `Dᵀ D` with `D c i = [k ⊗_O L_c : S_i]` (Webb, Theorem 9.5.4 and Corollary 9.5.6, pp. 159–160).
  For residue characteristic `0`, `C` and `Dᵀ D` are both the identity.
- The same identity, with the same `D` and `C`, holds for every complete discrete valuation ring
  `O` with `CharZero O` and residue field `k` of characteristic `p` whose fraction field `K` and
  residue field `k` are both splitting fields for `G` (Webb, Theorem 9.5.4 and Corollary 9.5.6,
  pp. 159–160, whose hypothesis this is): the proof uses the splitting only through
  `End_{K[G]}(T) = K` and `End_{k[G]}(S) = k` in
  `dim_K Hom_{K[G]}(K ⊗ P̂_S, T) = dim_k Hom_{k[G]}(P_S, T₀/mT₀)`, for `T₀` a `G`-stable lattice in
  the simple `K[G]`-module `T`. The root-of-unity hypothesis of the headline implies it
  (CharacterTheory §4.5 for `K`, §2.3 for `k`).
- `|G|_p` divides `Φ_φ(1)` (Martínez, Corollary 1.13, p. 6).
- Two projective `O[G]`-modules are isomorphic exactly when their ordinary characters are equal
  (Webb, Corollary 10.3.3, p. 183).

**Checks.**
- `S₃`, `p = 3`: `C = Dᵀ D = [[2,1],[1,2]]`, `det C = 3`; `Φ_1 = 1 + std` and `Φ_sgn = sgn + std`
  vanish at a `3`-cycle (`1 − 1 = 0`) and have degree `3`.
- `S₃`, `p = 2`: `C = diag(2, 1)`, `det C = 2`.
- `S₃` over `O = ℤ₂`: `ℚ₂` and `𝔽₂` split `S₃`, but `ℚ₂` contains no primitive sixth root of
  unity (`X² + X + 1` is irreducible modulo `2`); the trivial and sign lattices reduce to the
  trivial module and the standard lattice to the `2`-dimensional simple module, so
  `D = [[1,0],[1,0],[0,1]]` and `Dᵀ D = diag(2, 1) = C`. The root-of-unity hypothesis is
  sufficient, not necessary.
- A splitting hypothesis is needed: for `C₄` over `O = ℤ₂`, which lacks `i`, the
  irreducible `ℚ₂[C₄]`-modules are the trivial one, the sign and a `2`-dimensional one on which the
  generator has eigenvalues `±i`; all reduce to copies of the trivial module, so `D = (1, 1, 2)ᵀ`
  and `Dᵀ D = [6]`, while `𝔽₂[C₄]` is local of dimension `4` and `C = [4]`. Over the ramified
  `O = ℤ₂[i]`, with residue field `𝔽₂`, the four characters give `D = (1, 1, 1, 1)ᵀ` and
  `Dᵀ D = [4] = C`.
- The pairing on `S₃` at `p = 2`, with the `2`-regular classes `{1}` and the two `3`-cycles:
  `Φ_1 = 1 + sgn` takes `2, 2` there, so `⟨Φ_1, φ_1⟩ = (2·1 + 2·2·1)/6 = 1` and
  `⟨Φ_1, φ_std⟩ = (2·2 + 2·2·(−1))/6 = 0`, the values of §R17.5.11 for a cover and a simple.
- Beyond covers and simples, `C₂` at `p = 2` with `P = U = k[C₂]`: only `1` is `2`-regular, and the
  formula gives `2·2/2 = 2 = dim End(k[C₂])` for a non-simple `U`; with the trivial module, which is
  not projective, in place of both `P` and `U` (its Brauer character in place of `Φ_P`) it would
  give `1·1/2 = 1/2`, whereas `dim End(k) = 1`, so projectivity of `P` is needed. Replacing `P`
  alone shows nothing: the formula gives `1·2/2 = 1 = dim Hom(k, k[C₂])`, the socle `k(1 + t)`.
- Orientation: for the path algebra of `A₂` the native Cartan matrix is `[[1,0],[1,1]]` and
  QuiverRepresentations' is its transpose `[[1,1],[0,1]]`; group-algebra Cartan matrices are
  symmetric and cannot detect a transposition, so the comparison with QuiverRepresentations is
  tested on `A₂`.

### Examples

`C_p` in characteristic `p`: `D = [[1], …, [1]]` (`p` rows), `C = [p]`, and the regular module is
the projective cover of the trivial module with `Φ_1 = ∑_χ χ`, the regular character.

### Dependencies

Layers 1–2; GL2AutomorphicRepresentationsAndTransfer §R17.5.11; CharacterTheory §4.5;
QuiverRepresentations Layer 3; GrothendieckEulerForms Layer 4; Tau Ceti `TauCeti.cartanMatrix`,
`TauCeti.jordanHolderMultiplicity`, `TauCeti.IsProjectiveCover`, `Representation.baseChange`.

## Layer 4: blocks in the three coefficient rings

### 4.1 Ordinary central idempotents over a splitting field

Define `e_χ = χ(1)|G|⁻¹ ∑_g χ(g⁻¹) g` over `F` (Webb, Theorem 3.6.2, p. 42, gives these as the
primitive central idempotents of `ℂ[G]`), map it to `K[G]`, and prove idempotence,
orthogonality and completeness by comparison, in an algebraic closure, with the native
`TauCeti.Representation.primitiveCentralIdempotent` (CharacterTheory §3.5). *Needs:*
CharacterTheory §3.5; §1.1.

**Checks.**
- `C₂` over `ℚ₂`: `e_± = (1 ± t)/2`, `e₊e₋ = 0`, `e₊ + e₋ = 1`; neither is in `ℤ₂[C₂]`.
- The trivial character of `S₃` gives `(1/6) ∑_g g`.
- `C₃` over `K ∋ ζ₃`: `e_j = (1/3)(1 + ζ₃^{−j} r + ζ₃^{−2j} r²)`, and `∑_j e_j = 1`.

### 4.2 The block partitions

Every block idempotent of `O[G]` is, in `K[G]`, a sum `∑_{χ ∈ Irr(B)} e_χ` over a nonempty set
`Irr(B)`, and these sets partition `Irr(G)` (Martínez, Definition 2.1, p. 9, and Theorems 2.11–2.12,
p. 15). Each simple `k[G]`-module is acted on as the identity by exactly one block, which defines
the partition of `IBr(G)` into sets `IBr(B)`. These give surjections `Irr(G) → Bl(G)` and
`IBr(G) → Bl(G)` with fibres `Irr(B)` and `IBr(B)`, and bijections, compatible with
`existsUnique_blockIdempotent_map_residue`, between the blocks of `O[G]`, the blocks of `k[G]`,
and the two families of fibres. The partition of `Irr(G)` is characterized by central characters:
`χ, ψ` lie in one block exactly when `ω_χ(K_C) ≡ ω_ψ(K_C) mod m` for every class sum `K_C`
(Sambale, Definition 1.6, p. 15; CharacterTheory §4.3). `d_{χφ} ≠ 0` implies that `χ` and `φ`
lie in one block (Martínez, Theorem 2.2, p. 10), so `D` and `C` are block-diagonal. *Needs:*
§§1.3, 2.4, 4.1; CharacterTheory §§4.3, 4.5.

- `exists_blockIdempotent_iff_centralCharacter_congr`: let `O` be a complete discrete valuation
  ring with `CharZero O` whose fraction field `K` contains a primitive `e`-th root of unity, with
  residue field of any characteristic. A `K[G]`-module lies in a block of `O[G]` when that block
  idempotent, mapped to `K[G]`, acts on it as the identity (Webb, §12.2, pp. 231–232); each
  irreducible one lies in exactly one block. Two irreducible `K[G]`-modules `V` and `W` lie in one
  block exactly when, for every `g ∈ G` with conjugacy class `C`, the element
  `|C| (χ_V(g)/χ_V(1) − χ_W(g)/χ_W(1))` of `K` lies in `m` (Sambale, Definition 1.6, p. 15;
  Martínez, Definition 2.1, p. 9, and Theorem 2.12, pp. 15–16). Both terms are central character
  values, in `O` because they are algebraic integers and `O` is integrally closed. Route: an
  irreducible `V` is absolutely irreducible since `K` splits `G` (CharacterTheory §4.5), so
  `Z(O[G])` acts on it through the central character `ω_V : Z(O[G]) → O` and a block idempotent
  acts as `0` or `1`. Reducing `ω_V` modulo `m` gives an algebra homomorphism `λ_V : Z(k[G]) → k`
  (§1.3: the class sums are bases of both centres) with `λ_V(e_B) = 1` for the block `B` of `V`
  and `0` for the others. For `V` and `W` in one block `B`, `λ_V` and `λ_W` agree, since both
  factor through the residue field of the local algebra `Z(k[G]) e_B`, which is `k` because `k`
  splits `G` (§2.3); conversely `λ_V = λ_W` puts `V` and `W` in one block. For residue
  characteristic `0` each block holds one irreducible module, and since a nonzero algebraic integer
  of `O` then lies outside `m`, the congruence is equality of central characters.

The same congruence is defined on complex characters without a modular system. Let `M` be an
ideal of the algebraic integers `integralClosure ℤ ℂ`. Define `SameBlock M χ ψ` for functions
`χ, ψ : G → ℂ`: for every `g ∈ G`, with `C` its conjugacy class, the number
`|C| (χ(g)/χ(1) − ψ(g)/ψ(1))` lies in `M`. For irreducible `χ` the value `|C| χ(g)/χ(1)` is the
central character value `ω_χ(K_C)`, an algebraic integer of `F = ℚ(ζ_e)` (CharacterTheory §4.3), so
for `M` maximal with `p ∈ M` the relation is the congruence of central characters modulo `M`; this
is Sambale's Definition 1.6 with the residue field of the modular system replaced by the algebraic
integers modulo `M`. Prove that on `Irr(G)` its classes are the sets `Irr(B)`: `M ∩ O_F` is a prime
of `O_F` over `p`; take for §1.1 the place `v` it defines and identify the complex and the
`K`-valued irreducible characters through `F` (CharacterTheory §4.5). Then `m ∩ O_F = M ∩ O_F`, so
a difference of central character values, an element of `O_F`, lies in `m` exactly when it lies in
`M`. Every place of `F` over `p` is defined by some such `M`, so a statement over all `M` covers
every choice of place in §1.1. *Needs:* Mathlib `integralClosure`, `Ideal.IsMaximal`,
`ConjClasses`; Tau Ceti `TauCeti.irreducibleCharacters`; CharacterTheory §§4.3, 4.5; §1.1.

- `Irr(B)` and `IBr(B)` are nonempty, and the ordinary and modular block projections are the
  actions of `e_B` on characters and modules.
- Conjugation and group isomorphisms transport the partitions.
- `SameBlock`: for `M` maximal with `p ∈ M`, the relation is an equivalence relation on `Irr(G)`
  whose classes are the sets `Irr(B)` of the system of §1.1 at the place below `M`; the class of
  the trivial character is `Irr(B₀(G))`.

**Checks.**
- `S₃`, `p = 3`: three ordinary irreducibles, two simple modules and one block; the surjections have
  fibres of sizes `3` and `2` over the single block, so neither set is in bijection with the blocks.
- `S₃`, `p = 2`: `Irr(B₀) = {1, sgn}`, `IBr(B₀) = {1}`, and the defect-zero block has
  `Irr = {std}`, `IBr = {std}`; the central characters on the class sum of the transpositions are
  `3, −3, 0`, and `3 ≡ −3`, `3 ≢ 0` modulo `2`.
- `C_p` in characteristic `p`: all `p` ordinary irreducibles lie in the single block.
- The congruence modulo a maximal ideal `M ∋ 2` of the algebraic integers, on `S₃`: on the class of
  the three transpositions, sign against trivial gives `3(−1 − 1) = −6 ∈ M`, and standard against
  trivial gives `3(0 − 1) = −3 ∉ M`, since otherwise `1 = 3 − 2 ∈ M`; on the class of the two
  `3`-cycles sign against trivial gives `0`. The classes are `{1, sgn}` and `{std}`, as above.
- The same on `S₃` with `M ∋ 3`: standard against trivial gives `−3` on the transpositions and
  `2(−1/2 − 1) = −3` on the `3`-cycles, both in `M`, so there is one class. Without the class size
  the second difference would be `−3/2`, not an algebraic integer, and the single `3`-block would
  split.
- `C₃` with `M ∋ 2`: the faithful characters differ from the trivial one by `ζ₃ − 1` at a
  generator, of norm `3`, which lies in no maximal ideal over `2`: three classes. With `M ∋ 3`,
  `(1 − ζ₃)² = −3ζ₃ ∈ M` gives `1 − ζ₃ ∈ M`: one class.
- The splitting hypothesis of the block criterion over `O` is needed: over `O = ℤ₂`, which lacks
  `i`, `ℤ₂[C₄]` has the single block `1`, yet the irreducible `ℚ₂[C₄]`-module of dimension `2`, on
  which a generator `g` has eigenvalues `±i`, has trace `0` at `g`, and against the trivial module
  the difference `1 · (1 − 0) = 1` is not in `m = 2ℤ₂`. Over `O = ℤ₂[i]` that module splits into
  the characters `g ↦ ±i`, and `1 − i`, of norm `2`, lies in `m`: one block, as the criterion says.

### 4.3 The principal block

The principal block `B₀(G)` is the block whose idempotent has nonzero augmentation; it contains
the trivial character and the trivial module, and it is unique since the augmentation is an
algebra homomorphism `Z(k[G]) → k` sending block idempotents to `0` or `1` with sum `1` (Sambale,
Definition 1.2, p. 14). It is not defined as a correspondent of a principal block elsewhere.
*Needs:* §0.2; for the trivial character, §4.2; Mathlib `MonoidAlgebra.lift`.

**Checks.**
- `𝔽₂[S₃]`: the augmentation of `1 + r + r²` is `3 = 1` and of `r + r²` is `2 = 0`.
- `𝔽₂[C₃]` and `𝔽₄[C₃]`: the principal block is `1 + r + r²` in both.
- `G = 1`: the principal block is `1`.

### Examples

`S₃` at `p = 2`: `D = [[1,0],[1,0],[0,1]]` is block-diagonal with blocks `[[1],[1]]` (principal)
and `[[1]]` (defect zero), and `C = diag(2, 1)`.

### Dependencies

Layers 0–3; CharacterTheory §§3.5, 4.3, 4.5; Mathlib `integralClosure`, `Ideal.IsMaximal`,
`Representation.character`, `Representation.asAlgebraHom`; Tau Ceti
`TauCeti.irreducibleCharacters`.

## Layer 5: sections and generalized decomposition numbers

### 5.1 Generalized decomposition numbers

Let `R` be a set of representatives of the conjugacy classes of `p`-elements of `G`. For `u ∈ R`,
`χ ∈ Irr(G)` and `φ ∈ IBr(C_G(u))`, define `d^u_{χφ}` by
`χ(u v) = ∑_{φ ∈ IBr(C_G(u))} d^u_{χφ} φ(v)` for all `p`-regular `v ∈ C_G(u)`; the coefficients are
unique by §2.2 for `C_G(u)` and lie in `ℤ[ζ_{|u|}]` (Sambale, Definition 1.9, p. 15). For `u = 1`
they are the decomposition numbers. *Needs:* §§0.1, 2.2, 2.4 for each `C_G(u)`.

**Checks.**
- `C₃`, `p = 3`, `u = r`: `C_G(r) = C₃` has one Brauer character and `d^r_{χ_j,1} = ζ₃^j`, not a
  nonnegative integer.
- `S₃`, `p = 3`, `u = r`: `d^r = (1, 1, −1)` on the rows trivial, sign, standard.
- `S₃`, `p = 2`, `u = (12)`: `C_G(u) = C₂` and `d^u = (1, −1, 0)`.

### 5.2 Orthogonality

Prove, for `u, v ∈ R`, `φ ∈ IBr(C_G(u))` and `ψ ∈ IBr(C_G(v))`,

    ∑_{χ ∈ Irr(G)} d^u_{χφ} · conj(d^v_{χψ}) = (if u = v then c^u_{φψ} else 0),

where `c^u` is the Cartan matrix of `k[C_G(u)]`; the route is the column orthogonality of the
character table of `G` together with §3.1 for each `C_G(u)`, and the statement is the sum over the
blocks of `G` of Sambale, Theorem 1.14, p. 16. In matrix form: the matrix `Q` with rows `Irr(G)` and
columns the pairs `(u, φ)` is square, by the class count of §0.1, and `Q* Q` is the block-diagonal
matrix of the `c^u`; hence `Q` is invertible over `ℂ` and `|det Q|² = ∏_{u ∈ R} det c^u`. `Q` is not
in general invertible over `ℤ[ζ_{|G|_p}]` or its localization at `p`. The refinement of these
relations to a single block of `G` is a consequence of the second main theorem and is stated in
§7.2. *Needs:* §§3.1, 5.1; Tau Ceti `TauCeti.sum_characterTable_mul_conj`.

- Within one section the sum over all of `Irr(G)` is the native column orthogonality
  `TauCeti.sum_characterTable_mul_conj`.

**Checks.**
- `C₂`, `p = 2`: `Q = [[1,1],[1,−1]]`, `Q* Q = diag(2, 2)`, `det Q = −2`, so `|det Q|² = 4 = 2 · 2`
  and `Q⁻¹` has entries `±1/2`.
- `S₃`, `p = 3`: `Q = [[1,0,1],[0,1,1],[1,1,−1]]`, `Q* Q = diag([[2,1],[1,2]], 3)`, `det Q = −3`.
- `C₃`, `p = 3`, `u = v = r`: with conjugation the sum is `1 + 1 + 1 = 3 = c^r`; without it,
  `1 + ζ₃² + ζ₃ = 0`.

### Examples

`S₃` at `p = 2`: `R = {1, (12)}`, `Q = [[1,0,1],[1,0,−1],[0,1,0]]` in columns `(1, 1)`, `(1, std)`,
`((12), 1)`, and `Q* Q = diag(2, 1, 2)`.

### Dependencies

Layers 0, 2 and 3; Tau Ceti `TauCeti.sum_characterTable_mul_conj` (CharacterTheory §3.5).

## Layer 6: relative traces, Brauer maps and defect

### 6.1 Relative traces and the Brauer homomorphism

For `Q ≤ P ≤ G` define `Tr_Q^P : k[G]^Q → k[G]^P`, `a ↦ ∑_{x ∈ P/Q} x a x⁻¹`, and prove
transitivity, conjugation, the Mackey formula, `Tr_Q^P(a) b = Tr_Q^P(a b)` and
`b Tr_Q^P(a) = Tr_Q^P(b a)` for `b ∈ k[G]^P`, and that
`k[G]^P_Q = Tr_Q^P(k[G]^Q)` is an ideal of `k[G]^P` (Webb, Lemma 11.3.1, pp. 194–195, for
transitivity, conjugation and the Mackey formula, and Proposition 12.4.1, p. 238, for the product
formula and the ideal). On `Q`-fixed points `Tr_Q^P` is Tau Ceti's relative norm
`Representation.relNormInvariants` of the conjugation representation of `P` on `k[G]` at `Q`
(`TauCeti/RepresentationTheory/RelativeNorm.lean`, independent of the transversal there), which
also gives `Tr_Q^P(a) = |P : Q| a` for `P`-fixed `a`
(`Representation.relNorm_apply_of_forall_apply_eq`) and transitivity from the trivial subgroup,
`Tr_Q^P Tr_1^Q = Tr_1^P` (`Representation.relNorm_comp_norm`); the other statements above are
proved here. Define
`brauerProjection P : k[G] → k[C_G(P)]`, which keeps the coefficients on `C_G(P)`; it is
`k`-linear on all of `k[G]` and is not multiplicative there. *Needs:* Mathlib `MonoidAlgebra`,
`Subgroup.centralizer`, `Subgroup.normalizer`, `IsPGroup`; Tau Ceti
`Representation.relNormInvariants`.

- `brauerProjection_mul`: for a `p`-subgroup `P` in characteristic `p`, the projection is
  multiplicative on elements whose coefficients are invariant under conjugation by `P` (Webb, §12.5,
  p. 243, and Corollary 12.5.4, p. 246; Martínez, Theorem 4.1, p. 23, on the centre). The proof
  counts `P`-orbits on pairs `(g, h)` with `g h = c`: orbits of size divisible by `p` contribute
  `0`.
- The kernel of the Brauer homomorphism on `k[G]^P` is `∑_{Q < P} k[G]^P_Q` (Webb, Lemma 12.5.3,
  p. 245), and the image of `Z(k[G])` lies in `k[C_G(P)]^{N_G(P)}`.
- For `Q ≤ P`, the projection to `C_G(P)` factors through the projection to `C_G(Q)`.
- Rosenberg's lemma: a primitive idempotent of a finite-dimensional algebra lying in a sum of
  ideals lies in one of them (Webb, Lemma 11.6.8(2), p. 215).

**Checks.**
- `S₃`, `p = 2`, `P = ⟨(12)⟩`: `x = y = r + r²` is `P`-invariant, `x² = x`, and
  `Br_P(x²) = 0 = Br_P(x)²`.
- Invariance is needed: `x = r`, `y = r²` give `Br_P(xy) = Br_P(1) = 1` but `Br_P(x) Br_P(y) = 0`.
- Characteristic `p` is needed: over `ℚ`, `x = r + r²` gives `Br_P(x²) = 2` but `Br_P(x)² = 0`; and
  `P` must be a `p`-group: in characteristic `2` with `P = C₃` and `x` the sum of the transpositions,
  `Br_P(x²) = 1 + r + r²` but `Br_P(x)² = 0`.
- Relative trace, `S₃`, `k = 𝔽₂`, `Q = 1`, `P = ⟨(12)⟩`: `(12) r (12) = r²`, so
  `Tr_1^P(r) = r + r²`, which is fixed by `P` although `r` is not.
- `Tr_1^P(1) = 1 + 1 = 0` in `𝔽₂`: a trace from a proper subgroup `Q` of a `p`-group `P` multiplies
  scalars by `|P : Q|`, a multiple of `p`, so it kills them; the averaged model
  `|P : Q|⁻¹ ∑ x a x⁻¹` is not defined in characteristic `p`.
- `Tr_P^P` is the identity of `k[G]^P`, since `P/P` has one coset.

### 6.2 Defect groups

Define `IsDefectGroup p e P` for `e ∈ Z(k[G])`: `P` is a `p`-subgroup, `Br_P(e) ≠ 0`, and every
`p`-subgroup `Q ≥ P` with `Br_Q(e) ≠ 0` equals `P` (Webb, Theorem 12.5.2 and Corollary 12.5.5,
pp. 244–246; Sambale, Definition 1.4, p. 14). Prove, for every field `k` of characteristic `p`
and every block idempotent `e`, that the defect groups of `e` are exactly the subgroups `P`
minimal with `e ∈ Tr_P^G(k[G]^P)`, and that they form one conjugacy class (Webb, Theorems 12.4.5
and 12.5.2, pp. 241–245, which compare both with the vertices of `e k[G]` as a
`k[G × G]`-module). Route, by relative traces alone: for a Sylow `p`-subgroup `S`,
`e = Tr_S^G(|G : S|⁻¹ e)`, so minimal subgroups exist, and each is a `p`-group by the same
argument inside it. For a minimal `P` and `e = Tr_P^G(a)`, `Br_P(e) ≠ 0`: otherwise `e` lies in
the kernel `∑_{Q<P} Tr_Q^P(k[G]^Q)` of `Br_P`, so `e = Tr_P^G(a) e` lies in
`∑_{Q<P} Tr_Q^G(k[G]^Q)` by the product formulas and transitivity, and Rosenberg's lemma in
`Z(k[G]) = k[G]^G`, where `e` is primitive, puts `e` in one `Tr_Q^G(k[G]^Q)` with `Q < P`. If
`Br_Q(e) ≠ 0` for a `p`-subgroup `Q`, then `Q` lies in a conjugate of `P`: by the Mackey formula,
`Tr_P^G(a)` is the sum over the double cosets `QgP` of the traces from `Q ∩ gPg⁻¹` to `Q` of
`g a g⁻¹`, and those with `Q ∩ gPg⁻¹ < Q` lie in the kernel of `Br_Q` (Webb, Lemma 12.5.1(2),
p. 244). Hence the defect groups of `e` are exactly the conjugates of `P`, and every minimal
subgroup, having the same two properties, is one of them (Webb, proof of Theorem 12.5.2,
pp. 244–245). Over a field `k` of characteristic `p` that splits `G`, the residue field of the
local algebra `Z(k[G]) e_B` is `k` for every block `B`, since `Z(k[G]) ∩ rad k[G]` is a nilpotent
ideal of the centre and the quotient by it embeds in the centre `kʳ` of
`k[G] / rad k[G] = ∏ M_{n_i}(k)`; so `B` has a **central character** `λ_B : Z(k[G]) → k`, the
algebra homomorphism with `λ_B(e_B) = 1`. A **defect class** of `B` is a conjugacy class `C` with
`a_B(C) λ_B(K_C) ≠ 0`, where `a_B(C)` is the coefficient of `e_B` on `C` and `K_C` the class sum.
Prove, over such `k`, that the defect groups of `B` are the Sylow `p`-subgroups of the
centralizers `C_G(x)`, `x ∈ C`, for any defect class `C` of `B` (Martínez, Definition 3.2 and
Theorem 4.3, pp. 17 and 24, over the algebraic closure of `𝔽_p`). Prove the scalar extension that
carries such statements from an algebraically closed field to a splitting field: for an extension
`k ⊆ k'` of fields of characteristic `p` with `k` splitting a subgroup `H`, the class sums are a
basis of `Z(k[H])` and of `Z(k'[H]) = k' ⊗_k Z(k[H])`, and `k' ⊗_k Z(k[H]) e_b` is local with
residue field `k'`, because the maximal ideal of `Z(k[H]) e_b` is nilpotent with quotient `k`. So
the blocks of `k[H]` are exactly the blocks of `k'[H]`, the central character of `b` over `k'`
extends `λ_b`, and defect classes, `Br_P(e_b)`, defect groups and the principal block are the
same over `k` and over `k'`. Applied to `k ⊆ k̄` and to the algebraic closure of `𝔽_p` inside `k̄`,
this passes each statement of this section, §7.1 and §7.3 from the algebraically closed fields of
Martínez and Sambale to a field `k` that splits the groups involved. *Needs:* §§0.2, 0.3, 6.1;
Mathlib `Sylow`; SemisimpleAlgebras Layers 0 and 2; for the principal-block bullet §4.3; for the
defect-zero bullet §§1.1, 2.3, 4.2 and Tau Ceti `Rep.moduleProjective_of_id_mem_range_norm_linHom`.

- `isDefectGroup_conj`: any two defect groups of a block of `k[G]`, `k` any field of
  characteristic `p`, are conjugate in `G` (the route above).
- `isDefectGroup_iff_sylow_of_augmentation_ne_zero`: the defect groups of the principal block are
  exactly the Sylow `p`-subgroups (Webb, Corollary 12.4.7, p. 242). Route without vertices: the
  augmentation `∑_C a(C) |C|` of `e_{B₀}` is `1` (§4.3), so some class `C` with `a(C) ≠ 0` has
  `p ∤ |C| = |G : C_G(x)|` for `x ∈ C`; then `C_G(x)` contains a Sylow `p`-subgroup `S`, the
  coefficient of `Br_S(e_{B₀})` at `x ∈ C_G(S)` is `a(C) ≠ 0`, and `S`, maximal among the
  `p`-subgroups, is a defect group, so by conjugacy the defect groups are the Sylow subgroups.
- `O_p(G)` (§0.3) is contained in every defect group, for every field `k` of characteristic `p`
  (Webb, Corollary 12.3.4, pp. 236–237; Martínez, Corollary 3.9, p. 21, over an algebraically
  closed field); for a `p`-element `x`, `⟨x⟩` is contained in every defect group of every block of
  `C_G(x)`. Route without vertices: `Q = O_p(G)` acts trivially on every simple `k[G]`-module,
  whose `Q`-fixed points form a nonzero submodule, and `C_G(Q)` is normal, so a class outside
  `C_G(Q)` splits into `Q`-orbits of sizes divisible by `p` and its class sum acts as `0` on every
  simple module; hence `e − Br_Q(e)` lies in the nilpotent ideal `rad k[G]`, so `Br_Q(e) ≠ 0`,
  `Q` lies in a defect group, and by conjugacy and normality in all of them.
- Defect zero, over a field `k` of characteristic `p` that splits `G`: a block has defect group
  `1` exactly when it is a matrix algebra over `k` (Webb, Corollary 12.4.8, p. 242, with
  Theorem 9.6.1, p. 161). Route without vertices: a finite-dimensional `k[G]`-module `M` is
  projective exactly when `1_M = ∑_g g α g⁻¹` for a `k`-linear `α : M → M` (the case `H = 1` of
  Webb, Proposition 11.3.4, pp. 198–199): such an `α` makes `M` projective by Tau Ceti
  `Rep.moduleProjective_of_id_mem_range_norm_linHom`, and conversely a `k[G]`-linear splitting of
  `k[G] ⊗_k M → M` followed by the coefficient of `1` is such an `α`. If `1` is the defect group,
  `e_B = Tr_1^G(a)` by the trace characterization, and `α = (a ·)` makes every
  `e_B k[G]`-module projective, so `e_B k[G]` is semisimple and, `e_B` being primitive in the
  centre and `k` splitting `G`, a matrix algebra over `k`. Conversely, if
  `e_B k[G] ≅ M_n(k)`, its simple module `S` is projective, and pulling `α` back along the
  isomorphism `e_B k[G] → End_k(S)`, which carries conjugation by `g` to conjugation by the action
  of `g`, gives `e_B = Tr_1^G(a)`; the coefficient of `Tr_1^G(a)` at `c` is `|C_G(c)|` times the
  sum of the coefficients of `a` on the class of `c`, which vanishes when `C_G(c)` contains a
  nontrivial `p`-subgroup `P`, so `Br_P(e_B) = 0`. When `(K, O, k)` is a splitting `p`-modular
  system (§1.1), the block has defect group `1` exactly when it contains an ordinary character `χ`
  with `|G|_p ∣ χ(1)`, and then `Irr(B) = {χ}` and `IBr(B) = {χ⁰}` (Webb, Theorem 9.6.1, p. 161;
  Martínez, Corollary 2.9, p. 15).
- Over a field `k` of characteristic `p` that splits `G` and all its subgroups: for a block `B`
  with defect group `D`, `Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with defect group `D`,
  and every such block arises from exactly one `B` (Webb, Theorem 12.6.4 and its proof, p. 250);
  §7.1 consumes this.

**Checks.**
- `S₃`, `p = 2`: `Br_{⟨(12)⟩}(1 + r + r²) = 1 ≠ 0`, and the maximal `2`-subgroups with nonzero
  image are the three subgroups of order `2`; for the block `r + r²`, `Br_{⟨(12)⟩}(r + r²) = 0`
  and the defect group is `1`.
- Without the `p`-group condition on `Q`, `C₃` at `p = 2` and the block `1 + r + r²` would have the
  whole group `C₃` as maximal subgroup with nonzero projection; the trivial group is its defect
  group.
- `G = 1`: the unique defect group and the unique Sylow subgroup are `1`.
- The defect-zero criterion needs `k` to split `G`: over `𝔽₂`, the block `r + r²` of `𝔽₂[C₃]` has
  defect group `1` (`Br_1` is the identity and `1` is the only `2`-subgroup), but
  `(r + r²) 𝔽₂[C₃] ≅ 𝔽₄` has dimension `2`, not a square, so it is not a matrix algebra over `𝔽₂`.
  Over `𝔽₄`, which splits `C₃`, it is the sum of the two blocks `1 + α² r + α r²` and
  `1 + α r + α² r²`, each isomorphic to `𝔽₄ = M₁(𝔽₄)` and each holding one linear character, of
  degree divisible by `|C₃|₂ = 1`.
- Defect classes need `k` to split `G` as well: for the same block `e = r + r²` of `𝔽₂[C₃]`,
  `Z(𝔽₂[C₃]) e ≅ 𝔽₄` has no `𝔽₂`-algebra homomorphism to `𝔽₂`, so the block has no central
  character and no defect class, although its defect group is `1`. Over `𝔽₄` the block
  `1 + α² r + α r²` has `a = α²` and `λ = α` on the class `{r}`, with product `1 ≠ 0`, and the
  Sylow `2`-subgroup of `C_G(r) = C₃` is `1`, the defect group.
- `𝔽₂[S₃]`, which splits `S₃`, block `1 + r + r²`: the class `{1}` has `a = 1` and `λ = 1`, and
  the Sylow `2`-subgroups of `C_G(1) = S₃` are the three subgroups of order `2`; the class of `r`
  has `a = 1` but `λ(r + r²) = 2 = 0`, so it is not a defect class, and the Sylow `2`-subgroup `1`
  of `C_G(r) = C₃` is not a defect group.
- `S₃` over `𝔽₂`, which splits `S₃`: the defect-zero block `r + r²` is `M₂(𝔽₂)`, of dimension `4`,
  and holds the single ordinary character `std`, with `|S₃|₂ = 2 ∣ 2`.
- Trace minimality on `𝔽₂[S₃]`: the coefficient of `Tr_1^{S₃}(a)` at `c` is `|C_G(c)|` times the
  coefficient sum of `a` on the class of `c`, and `|C_G(1)| = 6`, `|C_G(r)| = 3`, `|C_G(t)| = 2`
  for `t = (12)`, so `Tr_1^{S₃}(𝔽₂[S₃]) = 𝔽₂ (r + r²)`. It contains
  `e₁ = r + r² = Tr_1^{S₃}(r)`, of defect group `1`, and not `e₀ = 1 + r + r²`, for which
  `Tr_{⟨t⟩}^{S₃}(e₀) = 3 e₀ = e₀`: the minimal subgroups for `e₀` are the three subgroups of
  order `2`, its defect groups. Taking maximal instead of minimal subgroups would give `S₃` for
  both blocks.
- The route to `O_p(G)`, on `S₃` at `p = 3`: `Q = C₃ = C_G(Q)`, the three transpositions form one
  `Q`-orbit of size `3`, and their class sum acts as `3 · (±1) = 0` on the trivial and sign
  modules; the single block `1` has `Br_Q(1) = 1 ≠ 0` and defect group `C₃`. Normality is needed:
  at `p = 2` the subgroup `⟨t⟩` is a `2`-subgroup, but `Br_{⟨t⟩}(r + r²) = 0` and the defect group
  of `r + r²` is `1`.
- The route to the Sylow defect groups, on `S₃` at `p = 2`: `e₀` has augmentation
  `1 · 1 + 1 · 2 = 1`; the class `{1}`, of odd size, gives `S = ⟨t⟩`, and `Br_S(e₀)` has
  coefficient `1` at `1`, while the class `{r, r²}`, of even size, has centralizer `C₃`, which
  contains no Sylow `2`-subgroup.
- Scalar extension `𝔽₄ ⊆ 𝔽̄₂`, where `𝔽₄` splits `S₃` and all its subgroups: the blocks `e₀`, `e₁`
  of `𝔽₄[S₃]` stay blocks, with central characters `(1, 0, 1)` and `(1, 1, 0)` on the class sums
  of `1`, `r`, `t` over both fields, and the blocks `1 + r + r²`, `1 + α² r + α r²`,
  `1 + α r + α² r²` of `𝔽₄[C₃]` stay blocks. Against it, `𝔽₂` splits `S₃` but not `C₃`, and the
  block `r + r²` of `𝔽₂[C₃]` is the sum of the last two, so without the splitting of `H` a block of
  `k[H]` need not stay a block.

### 6.3 Brauer pairs

A **Brauer pair** is `(Q, f)` with `Q` a `p`-subgroup and `f` a block of `k[C_G(Q)]`. Write
`(Q, f) ⊴ (R, f')` when `Q` is normal in `R`, `f` is `R`-stable and `Br_R(f) f' = f'`, and let `≤`
be the transitive closure (Craven, Definition 2.6, p. 22, and Definition 2.8, p. 23). For a block
`B`, a `B`-Brauer pair is one with `(1, e_B) ≤ (Q, f)`. Prove: given `(R, f')` and `Q ≤ R` there is
a unique `(Q, f) ≤ (R, f')` (Craven, Lemmas 2.7 and 2.9, pp. 23–24). Prove the inclusion
criterion: `(Q, f)` is a `B`-Brauer pair exactly when `Br_Q(e_B) f = f`, equivalently
`Br_Q(e_B) f ≠ 0`, since `Br_Q(e_B)` is a central idempotent of `k[C_G(Q)]` and `f` is primitive
in the centre. Route: for `Q' ⊴ Q` and a `Q`-stable central idempotent `z` of `k[C_G(Q')]`,
`Br_Q(z)` is the sum of `Br_Q(b)` over the `Q`-stable blocks `b` of `k[C_G(Q')]` below `z`, because
the sum over a non-trivial `Q`-orbit of blocks is a relative trace from a proper subgroup of `Q`
and lies in the kernel of `Br_Q` (§6.1); apply this to `z = Br_{Q'}(e_B)` with
`Br_Q = Br_Q ∘ Br_{Q'}` (§6.1) and the uniqueness in Craven's Lemma 2.7 to get that
`Br_Q(e_B) f = f` holds exactly when
`Br_{Q'}(e_B) f₁ = f₁` for the unique `(Q', f₁) ⊴ (Q, f)`; induction along a chain of `⊴`
(for `⇒`, the chain witnessing `(1, e_B) ≤ (Q, f)`; for `⇐`, a chain `1 ⊴ Q₁ ⊴ ⋯ ⊴ Q` of
normal subgroups of the `p`-group `Q`) reduces both directions to `Q = 1`, where
`Br_1(e_B) f = f` says `f = e_B`. The maximal `B`-Brauer pairs are conjugate in `G` and their
first components are the defect groups of `B` (Craven, Definition 2.10 and Theorems 2.11–2.12,
pp. 24–25). *Needs:* §§6.1–6.2; Mathlib `IsPGroup`, `Subgroup.centralizer`.

**Checks.**
- `S₃`, `p = 2`, `Q = ⟨(12)⟩`: `C_G(Q) = Q` has the single block `1`; `(Q, 1)` is a Brauer pair
  for the principal block (`Br_Q(1 + r + r²) · 1 = 1`) and not for `r + r²`.
- `Q = 1`: the `B`-Brauer pairs with first component `1` are exactly `(1, e_B)`.
- `C_p` at `p`: the maximal Brauer pair is `(C_p, 1)`.

### Examples

`S₃` at `p = 3`: the single block has defect group `C₃ = O_3(S₃)`, and `(C₃, 1)` is its maximal
Brauer pair.

### Dependencies

Layers 0 and 4; §§1.1 and 2.3 for the defect-zero criterion; SemisimpleAlgebras Layers 0 and 2;
Mathlib `IsPGroup`, `Sylow`, `Subgroup.centralizer`, `Subgroup.normalizer`; Tau Ceti
`Representation.relNormInvariants`, `Rep.moduleProjective_of_id_mem_range_norm_linHom`.

## Layer 7: Brauer's main theorems

### 7.1 Block induction and the first main theorem

Let `k` be a field of characteristic `p` that splits `G` and all its subgroups, so that every block
of every subgroup has a central character (§6.2).
For `H ≤ G` and a block `b` of `H`, `b^G` is the block `B` of `G` whose central character satisfies
`λ_B(z) = λ_b(z_H)` for `z ∈ Z(k[G])`, where `z_H` keeps the coefficients on `H`, when such `B`
exists (Sambale, Definition 1.10 and Proposition 1.11, p. 16, over an algebraically closed field;
Martínez, p. 25, over the algebraic closure of `𝔽_p`). Prove that `b^G` is
defined when `C_G(D_b) ≤ H` for a defect group `D_b` of `b`, that it is transitive, and that for
`P C_G(P) ≤ H ≤ N_G(P)` and a `p`-subgroup `P`, `Br_P(e_B) = ∑_{b^G = B} e_b` (Martínez,
Theorem 4.5 and Corollary 4.6, p. 26, over the algebraic closure of `𝔽_p`). These pass to `k` by
the scalar extension of §6.2: the blocks of `k[G]` and `k[H]` are those of `k̄[G]` and `k̄[H]`,
their central characters over `k̄` extend `λ_B` and `λ_b`, and `Z(k̄[G]) = k̄ ⊗_k Z(k[G])`, so
`b^G` is the same over `k` and over `k̄`. *Needs:* §§0.2, 6.1–6.2; for the splitting of `k`, §2.3.

- `brauer_first_main`: over an algebraically closed field `k` of characteristic `p`, for a
  `p`-subgroup `D`, the rule `b ↦ B` with `Br_D(e_B) e_b ≠ 0` is a
  bijection from the blocks of `k[N_G(D)]` with defect group `D` to the blocks of `k[G]` with
  defect group `D` (Webb, Theorem 12.6.4, p. 250; Martínez, Theorem 4.10, p. 27). By the formula
  for `Br_D(e_B)` above with `H = N_G(D)`, this rule is block induction `b ↦ b^G`.
- The same rule is a bijection between the same two sets of blocks over every field `k` of
  characteristic `p` that splits `G` and all its subgroups (Webb, Theorem 12.6.4, p. 250), for
  instance one containing a primitive `e'`-th root of unity (§2.3).
- For `N_G(D) ≤ H ≤ G`, block induction `b ↦ b^G` is a bijection from the blocks of `k[H]` with
  defect group `D` to the blocks of `k[G]` with defect group `D`, by applying the first main theorem
  to `H` and to `G` and identifying `N_H(D) = N_G(D)` (Sambale, Theorem 1.12, p. 16, over an
  algebraically closed field). The product
  criterion `Br_D(e_B) e_b ≠ 0` describes `b^G = B` for `D C_G(D) ≤ H ≤ N_G(D)`; for larger `H` it
  need not single out one block `B`.

**Checks.**
- `S₃`, `p = 2`, `D = ⟨(12)⟩`: `N_G(D) = D` has one block, of defect `D`, corresponding to
  `B₀(S₃)`; the defect-zero block of `S₃` is not in the image.
- `D = 1`: `N_G(D) = G` and the bijection is the identity on blocks of defect zero.
- `S₃`, `p = 3`, `D = C₃`: `N_G(D) = S₃`, and the bijection is the identity on the single block.
- `G = H = S₅`, `p = 3`, `D = ⟨(123)⟩`, `s = (45)`: `N_G(D) = S₃ × ⟨s⟩` has the two blocks
  `(1 ± s)/2`, and `S₅` has two blocks `B₁ ∋ 1` and `B₂ ∋ sgn` with defect group `D`, with
  `Br_D(e_{B₁}) = (1 + s)/2` and `Br_D(e_{B₂}) = (1 − s)/2`. On the reduction of a lattice
  of the degree-`4` character of `B₂` with value `2` at `s`, `e_{B₂}` acts as the identity and `s`
  has eigenvalues `1, 1, 1, −1`, so both `Br_D(e_{B₁}) e_{B₂}` and
  `Br_D(e_{B₂}) e_{B₂}` are nonzero: for `H = G` the product criterion relates `B₂` to both blocks,
  while `b ↦ b^G` is the identity.

### 7.2 The second main theorem

For `u ∈ R`, `χ ∈ Irr(G)` and `φ ∈ IBr(b)` with `b` a block of `C_G(u)`, `d^u_{χφ} ≠ 0` implies
`χ ∈ Irr(b^G)`; here `b^G` is defined because `⟨u⟩ ≤ D_b` and so `C_G(D_b) ≤ C_G(u)` (Sambale,
Theorem 1.13 and Proposition 1.11, p. 16, for a system with algebraically closed residue field).
The statement passes to the system of §1.1, whose residue field `k` splits `G` and all its
subgroups (§2.3): the completion `K′` of the maximal unramified extension of `K` is complete for a
discrete valuation with `e(K′/K) = 1` and residue field `k̄`
(RamificationOfCompleteDiscretelyValuedFields §4a.3; the residue field `k` of `K` is finite, hence
perfect), so its valuation ring gives a `p`-modular system with residue field `k̄` whose maximal
ideal lies over that of `O`. By §6.2 the blocks of `k[G]` and `k[C_G(u)]` are those over `k̄`, and
by the uniqueness of central lifts (§1.3) so are the blocks of `O[G]`. Equivalently,
`d^u_{χφ} ≠ 0` implies `Br_{⟨u⟩}(e_B) e_b ≠ 0` for the block `B` of `χ`, so `(⟨u⟩, b)` is a
`B`-Brauer pair. *Needs:* §§1.3, 5.1, 6.3, 7.1; RamificationOfCompleteDiscretelyValuedFields
§4a.3.

- Block form of the orthogonality relations of §5.2: for a block `B` of `G`, `u, v ∈ R`,
  `φ ∈ IBr(C_G(u))` and `ψ ∈ IBr(C_G(v))`, the sum `∑_{χ ∈ Irr(B)} d^u_{χφ} conj(d^v_{χψ})` equals
  `c^u_{φψ}` when `u = v`, `φ` and `ψ` lie in one block `b` of `C_G(u)` and `b^G = B`, and `0`
  otherwise (Sambale, Theorem 1.14, p. 16, passed to the system of §1.1 as above). *Needs:*
  §§4.2, 5.2 and the theorem above; RamificationOfCompleteDiscretelyValuedFields §4a.3.
- `sum_sameBlock_mul_conj_eq_zero` (block-section orthogonality): if the `p`-parts of `g` and `h`
  are not conjugate, then `∑_{χ ∈ Irr(B)} χ(g) conj(χ(h)) = 0` for each block `B`; the statement is
  made for every maximal ideal `M ∋ p` of the algebraic integers, with `Irr(B)` the irreducible
  complex characters related to a given `ψ ∈ Irr(G)` by `SameBlock M` (§4.2) (Martínez,
  Corollary 2.4, p. 11, for `g` `p`-regular and `h` `p`-singular; the general case from the block
  form, with the trace argument of the Axiom section-orthogonality formalization as a proof
  source). *Needs:* §§0.1, 4.2, 5.1 and the block form above; Tau Ceti `TauCeti.pPart`,
  `TauCeti.irreducibleCharacter`.

**Checks.**
- `S₃`, `p = 2`, `u = (12)`: `d^u = (1, −1, 0)`, nonzero exactly on `B₀`.
- `S₃`, `p = 3`, `u = r`: `d^r = (1, 1, −1)`, all in the single block.
- `C₂ × C₃` at `p = 2`, `u` the involution: the three blocks of `C_G(u) = G` each induce themselves.
- `S₃`, `p = 2`, `B = B₀`, `g = 1`, `h = (12)` (non-conjugate `2`-parts): `1·1 + 1·(−1) = 0`. For
  `g = h = 1` the block sums `∑_{χ ∈ Irr(B)} χ(1)²` are `2` for `B₀` (equal to `c^1_{11} φ₁(1)² = 2`)
  and `4` for the defect-zero block (equal to `c^1_{std,std} φ_std(1)² = 1 · 4`), with total
  `6 = |C_G(1)|`; replacing each block sum by `|C_G(1)|` would be false.

### 7.3 The third main theorem

Over a field `k` of characteristic `p` that splits `G` and all its subgroups (§7.1): if `b` is a
block of `H` with defect group `D` and `C_G(D) ≤ H`, then `b^G` is principal exactly when `b` is
principal (Sambale, Theorem 1.15, p. 17, over an algebraically closed field; Martínez,
Corollary 5.9, p. 35, over the algebraic closure of `𝔽_p`, for the implication from
`b^G = B₀(G)` to `b = B₀(H)`; the Axiom third-main-theorem formalization as a proof source). It
passes to `k` by the scalar extension of §6.2, which preserves blocks, defect groups and principal
blocks, and by the invariance of `b^G` (§7.1). *Needs:* §§4.3, 6.1, 6.2, 7.1.

- `brauer_third_main_local`: over an algebraically closed field `k` of characteristic `p`, for a
  `p`-subgroup `P` and `P C_G(P) ≤ H ≤ N_G(P)`, a block `b` of
  `k[H]` satisfies `Br_P(e_{B₀(G)}) e_b ≠ 0` in `k[G]` exactly when `b` is the principal block of
  `H`.

**Checks.**
- `S₃`, `p = 2`, `P = H = ⟨(12)⟩`: `Br_P(1 + r + r²) = 1` and the single block of `k[P]` is
  principal.
- `P = 1`: `H = G`, and `e_{B₀} e_b ≠ 0` exactly when `b = B₀`.
- `S₃`, `p = 3`, `P = C₃`, `H = S₃`: the single block is principal on both sides.

### Examples

`A₄` at `p = 2`, `P = V₄`: `N_G(P) = A₄` and `C_G(P) = V₄`; with `H = A₄` the principal block
corresponds to itself, and `A₄` has a single `2`-block.

### Dependencies

Layers 0 and 4–6; §2.3 for the splitting of `k`; §1.3 for the lifted blocks of §7.2;
RamificationOfCompleteDiscretelyValuedFields §4a.3 for the complete unramified extension with
residue field `k̄` of §7.2; Tau Ceti `TauCeti.pPart`, `TauCeti.irreducibleCharacter`.

## Layer 8: normal subgroups and finite-group interfaces

### 8.1 Normal `p`-subgroups

A normal `p`-subgroup `N` acts trivially on every simple `k[G]`-module (Martínez, Theorem 1.14,
p. 6), so simples and Brauer characters of `G` are those of `G/N` by inflation. The image of a block
idempotent under `k[G] → k[G/N]` is a sum of blocks of `G/N`, and every block of `G/N` lies in the
image of exactly one block of `G` (Martínez, Corollary 8.2, Proposition 8.4 and Theorem 8.5,
pp. 51–52). This is a partition, not a bijection: domination is bijective only under further
hypotheses, for instance when `G/C_G(N)` is a `p`-group (Sambale, Theorem 1.23, p. 18).
*Needs:* §0.2; for the Brauer characters, §2.1.

**Checks.**
- `S₃`, `p = 3`, `N = C₃`: the single block of `𝔽₃[S₃]` maps to `1 = e₊ + e₋` in `𝔽₃[C₂]`, two blocks.
- `C_p`, `N = C_p`: one block maps to the single block of the trivial group.
- `N = 1`: the map is the identity.

### 8.2 Normal `p'`-subgroups

Inflation, for an arbitrary normal subgroup `N` of `G`: composition with the quotient map
`q : G → G ⧸ N` (on class functions the native `TauCeti.ClassFunction.comap`; on representations,
Mathlib `Representation.ofQuotient` goes the other way) is a bijection from `Irr(G ⧸ N)` onto the
set of `χ ∈ Irr(G)` with `N ≤ ker χ`, and it preserves the pairing:
`⟨α ∘ q, β ∘ q⟩_G = ⟨α, β⟩_{G⧸N}` for class functions `α`, `β` on `G ⧸ N`, since every fibre of `q`
has `|N|` elements (Webb, §4.2, p. 53, for the irreducibility of an inflation; Martínez, §8.1,
p. 51). The same composition identifies `IBr(G ⧸ N)` with the `φ ∈ IBr(G)` that have `N` in their
kernel (§2.1). *Needs:* Tau Ceti `TauCeti.ClassFunction.comap`; Mathlib
`Representation.ofQuotient`; §2.1.

For a normal `p'`-subgroup `N`, `e_N = |N|⁻¹ ∑_{n ∈ N} n` is a central idempotent and
`k[G] e_N ≅ k[G/N]`. The blocks of `G/N` are exactly the blocks of `G` below `e_N`, with the same
ordinary and Brauer characters and isomorphic defect groups (Martínez, Theorem 8.5(iii), p. 52;
Sambale, Theorem 1.24, p. 18); in particular `B₀(G/N)` is `B₀(G)`.

Block covering, for an arbitrary normal subgroup `N` of `G`: `G` permutes the blocks of `k[N]` by
conjugation, and the sum of the block idempotents over the `G`-orbit of a block `b` is a central
idempotent of `k[G]`, hence the sum of the block idempotents `e_B` of a set of blocks `B` of `G`;
these `B` are the blocks that **cover** `b` (Martínez, Definition 7.3 and Problem 7.4, p. 44).
Prove that `B` covers `b` exactly when some `χ ∈ Irr(B) ∪ IBr(B)` has an irreducible constituent of
its restriction `χ_N` in `b`, and exactly when, for every `χ ∈ Irr(B) ∪ IBr(B)`, every irreducible
constituent of `χ_N` lies in a `G`-conjugate of `b` (Martínez, Theorem 7.7, p. 45). For `N` of order
prime to `p` every block of `k[N]` holds a single character `θ ∈ Irr(N)`, the block of the trivial
character has idempotent `e_N`, and the blocks covering it are the blocks of `G` below `e_N`, those
of `G/N`. *Needs:* §§0.2, 2.1, 4.2.

**Checks.**
- Inflation, `S₃` with `N = C₃`: `Irr(S₃ ⧸ C₃) = Irr(C₂) = {1, sgn}` goes to `{1, sgn}`, the
  irreducible characters of `S₃` whose kernel contains `C₃`; `std` has kernel `1`. The pairing
  `⟨1, sgn⟩` is `(1 − 1)/2 = 0` on `C₂` and `(1 − 3 + 2)/6 = 0` on `S₃`, and `⟨sgn, sgn⟩` is
  `(1 + 1)/2 = 1` and `(1 + 3 + 2)/6 = 1`. Normalising the `S₃` sums by `|S₃ ⧸ C₃| = 2` instead of
  `|S₃| = 6` would give `0` and `3`.
- Inflation, `N = G`: `Irr(G ⧸ G)` is the trivial character, and the only `χ ∈ Irr(G)` with
  `ker χ = G` is the trivial one.
- `S₃`, `p = 2`, `N = C₃`: `e_N = 1 + r + r²` (as `3 = 1`), `k[S₃] e_N` has basis `e_N`, `(12) e_N`
  and is `𝔽₂[C₂]`.
- The standard character of `S₃` restricts to `ζ₃ + ζ₃²` on `C₃` and lies in the other block.
- `N = 1`: `e_N = 1`.
- Covering, `S₃`, `p = 2`, `N = C₃`, `k ⊇ 𝔽₄`: the blocks of `k[C₃]` are `e_1 = 1 + r + r²`,
  `e_α = 1 + α² r + α r²` and `e_{α²} = 1 + α r + α² r²`; conjugation by `(12)` exchanges `r` and
  `r²`, hence `e_α` and `e_{α²}`, so the orbit sums are `1 + r + r²` and
  `e_α + e_{α²} = 2 + (α² + α)(r + r²) = r + r²`, the block idempotents of `B₀(S₃)` and of the
  defect-zero block. So `B₀ = {1, sgn}` covers `e_1` only and `{std}` covers `e_α` and `e_{α²}`,
  as the restrictions `1_N`, `sgn_N = 1_N` and `std_N = ζ₃ + ζ₃²` show.
- Covering with `N = 1`: the orbit sum of the single block `1` is `1 = ∑_B e_B`, so every block of
  `G` covers it; a model in which an orbit sum is a single block of `G` fails here as soon as `G`
  has two blocks, as `S₃` at `p = 2` does.
- Covering with `N = G`: `G` fixes every block of `k[G]`, so `B` covers `b` exactly when `B = b`.

### 8.3 The kernel of the principal block

Prove `⋂_{χ ∈ Irr(B₀(G))} ker χ = O_{p'}(G)` as subgroups of `G` (Navarro, Theorem 6.10).
As `mem_pPrimeCore_iff_forall_principalBlock`: for every maximal ideal `M ∋ p` of the algebraic
integers, `g ∈ pPrimeCore p G` exactly when `χ(g) = χ(1)` for every irreducible complex character
`χ` related to the trivial character by `SameBlock M` (§4.2); `χ(g) = χ(1)` says `g ∈ ker χ`
(Tau Ceti `Representation.mem_ker_iff_char_eq`). Route: `⊇` from §8.2 with
`N = O_{p'}(G)`; `⊆` because the projective character `Φ_1` of the trivial module is a
`ℤ`-combination of `Irr(B₀)` (§4.2), hence constant on cosets of the intersection `K`, and
`Φ_1(1) ≠ 0` while `Φ_1` vanishes off the `p`-regular elements (§3.1), so `K` is a `p'`-group.
Prove the modular containment: every simple module in `B₀(G)` is trivial on `O_{p'}(G)`, so its
Brauer character equals its degree there; it is not an equality, since normal `p`-subgroups also
act trivially. *Needs:* §§0.3, 3.1, 4.2, 8.2; Tau Ceti `TauCeti.irreducibleCharacters`,
`Representation.mem_ker_iff_char_eq`.

**Checks.**
- `S₃`, `p = 2`: `ker 1 ∩ ker sgn = C₃ = O_{2'}(S₃)`.
- `S₃`, `p = 3`: the standard character is faithful, so the intersection is `1 = O_{3'}(S₃)`.
- `C_p` at `p`: the principal block contains all characters, the intersection is `1 = O_{p'}(C_p)`,
  while the unique simple module has kernel `C_p`.

### 8.4 Interfaces for local group theory

Export to GlaubermanZStar, which uses them at `p = 2` and keeps its fusion argument outside this
roadmap: the sections (§0.1); the splitting modular system and its root lifting (§1.1), and the
compatibility of the decomposition map with a change of splitting modular system (§2.4); the
central-character description of the block partition and the principal block (§§4.2–4.3);
generalized decomposition numbers (§5.1); the second main theorem and block-section orthogonality
(§7.2); the local third main theorem (§7.3); the `2'`-core `O_{2'}(G)` and the other `π`-cores
(§0.3); and the inflation of ordinary characters along `G → G ⧸ N`, normal `p'`-subgroups, the
kernel theorem and the modular containment (§§8.2–8.3).

### Examples

The decomposition and Cartan matrices and blocks of `C_p` at `p` (one simple, one block, Cartan
entry `p`), of a cyclic group of order prime to `p` over a splitting field (identity matrices, all
blocks of defect zero), and of `S₃` at `p = 2` (`D = [[1,0],[1,0],[0,1]]`, `C = diag(2, 1)`, the
principal block `{1, sgn}` and the defect-zero block `{std}`) and at `p = 3`
(`D = [[1,0],[0,1],[1,1]]`, `C = [[2,1],[1,2]]`, one block).

### Dependencies

Layers 0–7.

## Downstream consumers

- **GlaubermanZStar**: at `p = 2`, the interfaces of §8.4: the sections (§0.1); the splitting
  modular system, its root lifting (§1.1) and the compatibility of the decomposition map with a
  change of splitting modular system (§2.4); the central-character description of the block
  partition and the principal block (§§4.2–4.3); generalized decomposition numbers (§5.1); the
  second main theorem and block-section orthogonality (§7.2); the local third main theorem (§7.3);
  the `2'`-core `O_{2'}(G)` and the other `π`-cores (§0.3); the inflation of ordinary characters
  along `G → G ⧸ N`, normal `p'`-subgroups, the kernel theorem and the modular containment
  (§§8.2–8.3).
- **OddOrderTheorem**: the `π`-cores `O_π(G)`, `O_p(G)` and `O_{p'}(G)` with their API (§0.3), on
  which its upper `p`-series is built (OddOrderTheorem §1.1).

## References

- J. M. Martínez, *Modular representation theory of finite groups*, course notes, Firenze 2024,
  [author's page](https://www.uv.es/jomimar8/pdfs/course%20notes.pdf): Brauer characters
  (Lecture 1), blocks (Lecture 2), defect groups (Lecture 3), the Brauer map and the first main
  theorem (Lecture 4), the third main theorem (Lecture 5), normal subgroups (Lectures 7–8).
- P. Webb, *A Course in Finite Group Representation Theory*, 2016,
  [author's page](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf): the central
  idempotents of `ℂ[G]` (Ch. 3), inflation (Ch. 4), `O_p(G)` (Ch. 6), projective covers (Ch. 7),
  splitting fields and the decomposition map (Ch. 9), Brauer characters (Ch. 10), relative traces
  (Ch. 11), blocks, the Brauer morphism and Brauer correspondence (Ch. 12).
- B. Sambale, *Blocks of Finite Groups and Their Invariants*, Lecture Notes in Mathematics 2127,
  [author's page](https://benjaminsambale.github.io/pdfs/lnm.pdf): Chapter 1 (definitions, the three
  main theorems, generalized decomposition numbers and their orthogonality).
- D. A. Craven, *Fusion systems*, lecture notes, 2008,
  [author's page](https://web.mat.bham.ac.uk/D.A.Craven/docs/lectures/fusionsystems.pdf): Brauer
  pairs (§2.2).
- J.-P. Serre, *Linear Representations of Finite Groups*, GTM 42, 1977, Part III: §15.2 (the
  decomposition map) and §16.1, Theorem 33 (its surjectivity).
- G. Navarro, *Characters and Blocks of Finite Groups*, LMS Lecture Note Series 250, 1998,
  Chapter 6, Theorem 6.10 (the kernel of the principal block).
- Axiom's [third main theorem](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BrauerThirdMainTheorem.lean)
  and [section orthogonality](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BlockSectionOrthogonality.lean)
  formalizations, proof sources whose definitions need comparison with the native interfaces.
