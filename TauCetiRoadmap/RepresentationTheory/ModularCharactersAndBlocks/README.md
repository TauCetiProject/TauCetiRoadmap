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
(`card_simpleModules_eq_card_pRegularClasses`), Brauer reciprocity `C = Dᵀ D`, the bijection of
blocks of `O[G]` and `k[G]` (`existsUnique_blockIdempotent_map_residue`), the orthogonality of
generalized decomposition numbers, the conjugacy of defect groups (`isDefectGroup_conj`), the
Sylow defect groups of the principal block (`isDefectGroup_iff_sylow_of_augmentation_ne_zero`),
Brauer's first main theorem (`brauer_first_main`), the second main theorem, the local form of the
third main theorem (`brauer_third_main_local`), and the kernel theorem
`⋂_{χ ∈ Irr(B₀)} ker χ = O_{p'}(G)`.

Suggested homes: `TauCeti/RepresentationTheory/Modular/` and `TauCeti/RepresentationTheory/Block/`.
The module theory is primary; complex characters describe it through proved comparisons.

## Scope and ownership

This roadmap owns the general modular theory of finite groups listed in Layers 0–8. It does not
own the classification of finite simple groups, the odd order theorem, Glauberman's `Z*` theorem
(GlaubermanZStar consumes Layers 4–8), blocks with cyclic defect group and Brauer trees, block
fusion systems beyond Brauer pairs, or conjectures about blocks.

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
  and the complete-adic lifting `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq`
  (`TauCeti/RingTheory/AdicCompletion/Idempotent.lean`) and
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
- GL2AutomorphicRepresentationsAndTransfer, §R17.5.11: the Brauer character of a representation
  over an algebraically closed field of characteristic `p`, for a fixed identification
  `τ : μ_m(k) ≃ μ_m(ℂ)` of prime-to-`p` roots of unity, with conjugacy invariance, additivity,
  agreement with the ordinary character of a stable lattice on `p`-regular elements, and recognition
  of composition factors. Layer 2 specializes `τ` to the one fixed by the modular system and adds
  the remaining formulas.
- LocalFiniteGroupTheory, §L1: the relative cores `pCore p H` and `pPrimeCore p H`; `O_{p'}(G)` is
  `pPrimeCore p ⊤`. Layer 8 consumes them; Layers 0–7 need only Mathlib's Sylow theory.

The Fong–Swan lifting theorem for `p`-solvable groups is GL2AutomorphicRepresentationsAndTransfer
§R17.5.12 and is not restated here.

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
residue field `k = IsLocalRing.ResidueField O` of characteristic `p`. It is **splitting** for `G`
when `K` contains a primitive `e`-th root of unity; `k` then contains a primitive `e'`-th root.
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
`Subgroup.normalizer`, `Subgroup.subgroupOf`, `IsPGroup`, `Sylow`, `MulAut.conj`, and the DVR
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
`TauCeti.Cyclotomic.complexRoot` and
`FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot`. Assumed of them: what their
statements say. In particular `TauCeti.Representation.primitiveCentralIdempotent` requires an
algebraically closed field in which `|G|` is invertible, `TauCeti.cartanMatrix` is taken for
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

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

§R17.5.11: the Brauer character for a chosen `τ`, its value `n` at `1`, conjugacy invariance,
additivity on exact sequences, agreement with the ordinary character of a full stable lattice on
`p`-regular elements, and the fact that two modules have the same Brauer character exactly when
they have the same composition factors with multiplicity.

### From TauCetiRoadmap.LocalFiniteGroupTheory

§L1: `pCore p H`, `pPrimeCore p H`, normality, the containment of every normal `p'`-subgroup in
`pPrimeCore p ⊤`, and `pPrimeCore p H` for `S₃` at `p = 2` equal to the cyclic subgroup of order `3`.

## How to read the build

Layer 0 fixes sections of elements and the block decomposition of the centre of a group algebra
over any commutative ring. Layer 1 constructs a splitting `p`-modular system, stable lattices and
the lifting of central idempotents. Layer 2 specializes the imported Brauer characters, proves
their basis theorem and residue splitting, and constructs the decomposition map. Layer 3 lifts
projectives and proves Brauer reciprocity. Layer 4 compares blocks over `K`, `O` and `k` and
partitions `Irr(G)` and `IBr(G)` into blocks. Layer 5 develops generalized decomposition numbers
and their orthogonality. Layer 6 constructs relative traces, the Brauer homomorphism, Brauer pairs
and defect groups. Layer 7 proves Brauer's three main theorems, and Layer 8 the normal-subgroup
theorems and the worked examples. `README.md` is normative; `Suggested.lean` states the headline
theorems that are statable at the pins, with the three definitions they need.

## Layer 0: element sections and the centre of the group algebra

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
family of block idempotents.

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

### Examples

`𝔽₂[S₃]` has the two blocks `1 + r + r²` and `r + r²` (`r` a `3`-cycle), with sum `1` and product
`0`; `𝔽₃[S₃]` has the single block `1`.

### Dependencies

Mathlib `MonoidAlgebra`, `Subalgebra.center`, `CompleteOrthogonalIdempotents`; Tau Ceti
`TauCeti.pPart` and its API, `TauCeti.IsPrimitiveIdempotent`,
`TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent`.

## Layer 1: modular systems, lattices and lifting

### 1.1 A splitting modular system

Let `F = ℚ⟮TauCeti.Cyclotomic.complexRoot e⟯ ⊆ ℂ` and choose a finite place `v` of `F` over `p`. Let
`K = F_v`, `O` its valuation ring with Mathlib's DVR instance, and `k` its residue field. Prove that
`(K, O, k)` is a splitting `p`-modular system, that `k` is generated over `𝔽_p` by the reduction of
`complexRoot e'`, and that reduction is a bijection from the `e'`-th roots of unity of `O` onto
those of `k`, multiplicative and compatible with powers (Webb, §9.4, p. 148). Prove that `K` splits every subgroup of `G`, from CharacterTheory §4.5. All
later layers use this system and its root bijection for every subgroup, centralizer and quotient
of `G`. *Needs:* Mathlib `IsDiscreteValuationRing`, the completion at a finite place; Tau Ceti
`TauCeti.Cyclotomic.complexRoot`; CharacterTheory §4.5.

- The canonical map `F → K` is injective and the roots of unity of `F` map onto those of `K`.
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
Theorem 1.7 and Lemma 1.8, p. 4). The class is additive on short exact sequences of
`K[G]`-modules and compatible with restriction, induction, conjugation and tensor products.
*Needs:* Mathlib `IsDiscreteValuationRing`, `IsFractionRing`; ModularInduction Layers 0–1.

- A sub-`O[G]`-module of a stable lattice of full rank is a stable lattice.
- `L ⊆ L'` both stable implies `L'/L` is a finite-length `O[G]`-module whose composition factors
  are `k[G]`-modules.

**Checks.**
- `G = 1`, `V = K`: the lattices `O` and `mO` both reduce to the class `1`, although the reductions
  are different submodules of `V/mV`.
- `G = C₂`, `p = 2`, `V = K[C₂]`: the lattices `O[C₂]` and `O(1 + t) ⊕ O(1 − t)` reduce to the
  non-split regular module and to `k ⊕ k`; the two are not isomorphic but have class `2` in
  `modRepK0 k C₂`.
- `V = 0`: the zero lattice reduces to the class `0`.

### 1.3 Lifting idempotents and projectives over `O[G]`

Every idempotent of `k[G]` lifts to an idempotent of `O[G]`, by the native
`TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` applied to `O[G]`, which is `m`-adically
complete as a finite free `O`-module, with the kernel of reduction equal to `m • O[G]`. Every
direct summand of the reduction of a finitely generated free `O[G]`-module lifts to a projective
`O[G]`-module, by `TauCeti.exists_projective_quotient_smul_top_linearEquiv` (Webb,
Propositions 9.4.3 and 9.4.5, pp. 149–151). What is added here: an idempotent of `k[G]` is
primitive exactly when its lifts are; a central idempotent has a unique central lift; and reduction
`Z(O[G]) → Z(k[G])` is surjective, because the class sums form an `O`-basis of `Z(O[G])` and a
`k`-basis of `Z(k[G])`. *Needs:* Tau Ceti `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq`,
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

The irreducible Brauer characters of `G` over an algebraically closed `k` are linearly independent
and form a basis of the complex class functions on the `p`-regular classes (Webb, Theorem 10.2.2,
p. 176; Martínez, Proposition 1.5, p. 3, and Theorem 1.9, p. 5).

- `card_simpleModules_eq_card_pRegularClasses`: over an algebraically closed field of
  characteristic `p`, a complete family of pairwise non-isomorphic simple `k[G]`-modules has as
  many members as `G` has `p`-regular conjugacy classes (Webb, Theorem 9.3.6, p. 147).
- The same count holds over every field of characteristic `p` containing a primitive `e'`-th root
  of unity, by §2.3.

**Checks.**
- `S₃`, `p = 3`: two simple modules (trivial, sign) and two `3`-regular classes (identity,
  transpositions); the Brauer table `[[1, 1], [1, −1]]` has determinant `−2 ≠ 0` in `ℂ`.
- `C_p` in characteristic `p`: one simple module and one `p`-regular class.
- `C₃` over `𝔽₂`: two simple modules (dimensions `1` and `2`) against three `2`-regular classes,
  so the count needs `k` to split `G`.

### 2.3 Residue-field splitting

Prove that a field `k` of characteristic `p` containing a primitive `e'`-th root of unity is a
splitting field for `G` and all its subgroups (Brauer's splitting-field theorem; Webb,
Theorem 9.2.7, p. 144, states it for a field containing a primitive `m`-th root of unity with `m`
the exponent of `G`, and in characteristic `p` only the `p'`-part `e'` of `m` admits a primitive
root, so the statement here is its characteristic-`p` form, proved by the descent below). Route:
descend over the finite subfield `k₀ = 𝔽_p(ζ_{e'}) ⊆ k` generated by the root of unity (finite
because `ζ_{e'}` is integral over the prime field; Mathlib `IntermediateField.adjoin.finiteDimensional`).
Every simple `k̄[G]`-module has Brauer character with values in the image of the `e'`-th roots of
unity, so it is fixed by `Gal(k̄/k₀)`; by recognition (§2.1) each simple is Galois-stable, and
since finite division algebras are commutative (Mathlib `littleWedderburn`) its endomorphism ring
over `k₀` is `k₀`, so it is defined over `k₀`, and `k₀` is a splitting field. Then pass from `k₀`
to `k`: `k₀[G]/rad(k₀[G])` is a product of matrix algebras over `k₀` (SemisimpleAlgebras Layer 2),
so the ideal `k ⊗_{k₀} rad(k₀[G])` of `k[G]` is nilpotent with quotient the product of the
corresponding matrix algebras over `k`, which is semisimple; a nilpotent ideal lies in the radical
and the radical lies in every ideal with semisimple quotient (Mathlib `Ring.jacobson_le_of_eq_bot`,
SemisimpleAlgebras Layer 0), so `rad(k[G]) = k ⊗_{k₀} rad(k₀[G])`, `k[G]/rad(k[G])` is that product
of matrix algebras, and `k` is a splitting field (Webb, Chapter 9, Exercises 4 and 8(a), pp. 165–166,
and the remark on p. 144). Subgroups: the `p'`-exponent of `H ≤ G` divides `e'`, so `k₀` contains the
root of unity `H` needs. Prove the finite-field descent, the endomorphism comparison and the
radical base change used here, and identify the simple-class bases over `k₀`, `k` and `k̄`.
*Needs:* §2.1; Mathlib `littleWedderburn`, `IntermediateField.adjoin.finiteDimensional`,
`Ring.jacobson_le_of_eq_bot`; SemisimpleAlgebras Layers 0 and 2.

- Simple `k[G]`-modules are absolutely simple, and scalar extension to `k̄` is a bijection on
  isomorphism classes of simples.

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

Define the decomposition map `d : G₀(K[G]) → modRepK0 k G` by reduction of stable lattices (§1.2),
and the decomposition numbers by `χ|_{p-reg} = ∑_φ d_{χφ} φ` with `d_{χφ} ∈ ℕ` (Webb,
Proposition 10.3.2, p. 182; Martínez, Definition 1.6 and Theorem 1.7, pp. 3–4). Prove that `d` is
surjective: by InductionRestriction Layer 6, the trivial character is a `ℤ`-combination of
characters induced from elementary subgroups `E = C × Q`; for such `E` the Sylow `p`-subgroup is
normal, simple `k[E]`-modules inflate from the `p'`-quotient, and §1.3 lifts them; induction
commutes with reduction (§1.2), and the projection formula transfers the identity to every class
(Webb, Theorem 10.2.2 and Corollary 10.2.4, pp. 176–178, for the consequence that the
decomposition matrix has full rank). Prove that `d` commutes with `modRepK0.baseChange` and with
a change of splitting modular system. *Needs:* §§1.2–1.3, 2.1; InductionRestriction Layer 6;
Tau Ceti `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`;
ModularInduction Layer 1.

- `d` is a ring homomorphism compatible with restriction and induction.
- When `p ∤ |G|`, `d` is an isomorphism and the decomposition matrix is a permutation matrix
  (Webb, Theorem 9.4.11, p. 155).

**Checks.**
- `S₃`, `p = 3`, rows trivial, sign, standard and columns trivial, sign: `D = [[1,0],[0,1],[1,1]]`,
  from `(2, 0) = (1, 1) + (1, −1)` on the classes of `1` and a transposition.
- `S₃`, `p = 2`, rows trivial, sign, standard and columns trivial, two-dimensional:
  `D = [[1,0],[1,0],[0,1]]`.
- `C₂`, `p = 2`: both ordinary characters reduce to the trivial module, `D = [[1],[1]]`, so `d`
  is not injective.

### Examples

For `C₃` at `p = 2` with `k = 𝔽₄`, `D` is the `3 × 3` identity after ordering the rows by the
lifts of `1, α, α²`; relabelling `α ↔ α²` permutes the columns, so the root bijection must be fixed
once for all subgroups.

### Dependencies

Layers 0–1; GL2AutomorphicRepresentationsAndTransfer §R17.5.11; InductionRestriction Layer 6;
ModularInduction Layers 0–1; SemisimpleAlgebras Layer 2.

## Layer 3: projective modules, reciprocity and the Cartan matrix

### 3.1 Projective characters and Brauer reciprocity

For a simple `k[G]`-module `S_φ` with projective cover `P_φ` (QuiverRepresentations Layer 3;
`TauCeti.exists_isProjectiveCover_of_finite`), let `P̂_φ` be its lift to `O[G]` (§1.3) and `Φ_φ`
the ordinary character of `K ⊗ P̂_φ`. Prove that `Φ_φ` vanishes on `p`-singular elements (Martínez,
Proposition 1.12, p. 5), that `Φ_φ = ∑_χ d_{χφ} χ` (Webb, Theorem 9.5.4, p. 159), and that
`dim Hom_{k[G]}(P, U) = |G|⁻¹ ∑_{g p-regular} Φ_P(g⁻¹) φ_U(g)` (Webb, Proposition 10.2.1, p. 174), so
the projective characters and the irreducible Brauer characters are dual bases for this pairing.
Prove Brauer reciprocity: `TauCeti.cartanMatrix P S … = Dᵀ D` for the families of covers and simples
(Webb, Proposition 9.5.1 and Corollary 9.5.6, pp. 157 and 160), hence `C` is symmetric and
positive definite with `det C ≠ 0`. Relate the identity to `TauCeti.projectiveSimplePairing` and
`TauCeti.cartanMap`, including the identification of bases. *Needs:* §§1.3, 2.4;
QuiverRepresentations Layer 3; GrothendieckEulerForms Layer 4; Tau Ceti `TauCeti.cartanMatrix`,
`TauCeti.projectiveSimplePairing_isPerfPair`.

- `|G|_p` divides `Φ_φ(1)` (Martínez, Corollary 1.13, p. 6).
- Two projective `O[G]`-modules are isomorphic exactly when their ordinary characters are equal
  (Webb, Corollary 10.3.3, p. 183).

**Checks.**
- `S₃`, `p = 3`: `C = Dᵀ D = [[2,1],[1,2]]`, `det C = 3`; `Φ_1 = 1 + std` and `Φ_sgn = sgn + std`
  vanish at a `3`-cycle (`1 − 1 = 0`) and have degree `3`.
- `S₃`, `p = 2`: `C = diag(2, 1)`, `det C = 2`.
- Orientation: for the path algebra of `A₂` the native Cartan matrix is `[[1,0],[1,1]]` and
  QuiverRepresentations' is its transpose `[[1,1],[0,1]]`; group-algebra Cartan matrices are
  symmetric and cannot detect a transposition, so the comparison with QuiverRepresentations is
  tested on `A₂`.

### Examples

`C_p` in characteristic `p`: `D = [[1], …, [1]]` (`p` rows), `C = [p]`, and the regular module is
the projective cover of the trivial module with `Φ_1 = ∑_χ χ`, the regular character.

### Dependencies

Layers 1–2; QuiverRepresentations Layer 3; GrothendieckEulerForms Layer 4.

## Layer 4: blocks in the three coefficient rings

### 4.1 Ordinary central idempotents over a splitting field

Define `e_χ = χ(1)|G|⁻¹ ∑_g χ(g⁻¹) g` over `F`, map it to `K[G]`, and prove idempotence,
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
§§1.3, 2.4, 4.1; CharacterTheory §4.3.

- `Irr(B)` and `IBr(B)` are nonempty, and the ordinary and modular block projections are the
  actions of `e_B` on characters and modules.
- Conjugation and group isomorphisms transport the partitions.

**Checks.**
- `S₃`, `p = 3`: three ordinary irreducibles, two simple modules and one block; the surjections have
  fibres of sizes `3` and `2` over the single block, so neither set is in bijection with the blocks.
- `S₃`, `p = 2`: `Irr(B₀) = {1, sgn}`, `IBr(B₀) = {1}`, and the defect-zero block has
  `Irr = {std}`, `IBr = {std}`; the central characters on the class sum of the transpositions are
  `3, −3, 0`, and `3 ≡ −3`, `3 ≢ 0` modulo `2`.
- `C_p` in characteristic `p`: all `p` ordinary irreducibles lie in the single block.

### 4.3 The principal block

The principal block `B₀(G)` is the block whose idempotent has nonzero augmentation; it contains
the trivial character and the trivial module, and it is unique since the augmentation is an
algebra homomorphism `Z(k[G]) → k` sending block idempotents to `0` or `1` with sum `1` (Sambale,
Definition 1.2, p. 14). It is not defined as a correspondent of a principal block elsewhere.

**Checks.**
- `𝔽₂[S₃]`: the augmentation of `1 + r + r²` is `3 = 1` and of `r + r²` is `2 = 0`.
- `𝔽₂[C₃]` and `𝔽₄[C₃]`: the principal block is `1 + r + r²` in both.
- `G = 1`: the principal block is `1`.

### Examples

`S₃` at `p = 2`: `D = [[1,0],[1,0],[0,1]]` is block-diagonal with blocks `[[1],[1]]` (principal)
and `[[1]]` (defect zero), and `C = diag(2, 1)`.

### Dependencies

Layers 0–3; CharacterTheory §§3.5, 4.3.

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

where `c^u` is the Cartan matrix of `k[C_G(u)]`, and its block form: for a block `B` of `G`,
`∑_{χ ∈ Irr(B)} d^u_{χφ} conj(d^v_{χψ})` equals `c^u_{φψ}` when `u = v`, `φ` and `ψ` lie in one
block `b` of `C_G(u)` and `b^G = B`, and `0` otherwise (Sambale, Theorem 1.14, p. 16; the block
form uses the second main theorem, §7.2). In matrix form: the matrix `Q` with rows `Irr(G)` and
columns the pairs `(u, φ)` is square, by the class count of §0.1, and `Q* Q` is the block-diagonal
matrix of the `c^u`; hence `Q` is invertible over `ℂ` and `|det Q|² = ∏_{u ∈ R} det c^u`. `Q` is not
in general invertible over `ℤ[ζ_{|G|_p}]` or its localization at `p`. *Needs:* §§3.1, 5.1;
§7.2 for the block form.

- Block-section orthogonality: if the `p`-parts of `g` and `h` are not conjugate, then
  `∑_{χ ∈ Irr(B)} χ(g) conj(χ(h)) = 0` for each block `B` (Martínez, Corollary 2.4, p. 11, for `g`
  `p`-regular and `h` `p`-singular; the general case from the block form above, with the trace
  argument of the Axiom section-orthogonality formalization as a proof source).
- Within one section the sum over all of `Irr(G)` is the native column orthogonality
  `TauCeti.sum_characterTable_mul_conj`.

**Checks.**
- `C₂`, `p = 2`: `Q = [[1,1],[1,−1]]`, `Q* Q = diag(2, 2)`, `det Q = −2`, so `|det Q|² = 4 = 2 · 2`
  and `Q⁻¹` has entries `±1/2`.
- `S₃`, `p = 3`: `Q = [[1,0,1],[0,1,1],[1,1,−1]]`, `Q* Q = diag([[2,1],[1,2]], 3)`, `det Q = −3`.
- `C₃`, `p = 3`, `u = v = r`: with conjugation the sum is `1 + 1 + 1 = 3 = c^r`; without it,
  `1 + ζ₃² + ζ₃ = 0`.
- `S₃`, `p = 2`, `B = B₀`, `g = 1`, `h = (12)` (non-conjugate `2`-parts): `1·1 + 1·(−1) = 0`. For
  `g = h = 1` the block sums `∑_{χ ∈ Irr(B)} χ(1)²` are `2` for `B₀` (equal to `c^1_{11} φ₁(1)² = 2`)
  and `4` for the defect-zero block (equal to `c^1_{std,std} φ_std(1)² = 1 · 4`), with total
  `6 = |C_G(1)|`; replacing each block sum by `|C_G(1)|` would be false.

### Examples

`S₃` at `p = 2`: `R = {1, (12)}`, `Q = [[1,0,1],[1,0,−1],[0,1,0]]` in columns `(1, 1)`, `(1, std)`,
`((12), 1)`, and `Q* Q = diag(2, 1, 2)`.

### Dependencies

Layers 0, 2–4; §7.2 for the block form.

## Layer 6: relative traces, Brauer maps and defect

### 6.1 Relative traces and the Brauer homomorphism

For `Q ≤ P ≤ G` define `Tr_Q^P : k[G]^Q → k[G]^P`, `a ↦ ∑_{x ∈ P/Q} x a x⁻¹`, and prove
transitivity, conjugation, the Mackey formula, `Tr_Q^P(a) b = Tr_Q^P(a b)` for `b ∈ k[G]^P`, and that
`k[G]^P_Q = Tr_Q^P(k[G]^Q)` is an ideal of `k[G]^P` (Webb, Proposition 12.4.1, p. 238). Define
`brauerProjection P : k[G] → k[C_G(P)]`, which keeps the coefficients on `C_G(P)`; it is
`k`-linear on all of `k[G]` and is not multiplicative there.

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

### 6.2 Defect groups

Define `IsDefectGroup p e P` for `e ∈ Z(k[G])`: `P` is a `p`-subgroup, `Br_P(e) ≠ 0`, and every
`p`-subgroup `Q ≥ P` with `Br_Q(e) ≠ 0` equals `P` (Webb, Theorem 12.5.2 and Corollary 12.5.5,
pp. 244–246; Sambale, Definition 1.4, p. 14). Prove that this agrees with the definitions by
vertices of `e k[G]` as a `k[G × G]`-module (Webb, Corollary 12.3.2, p. 235), by minimality of `P`
with `e ∈ Tr_P^G(k[G]^P)` (Webb, Theorem 12.4.5, p. 241), and by defect classes and central
characters (Martínez, Definition 3.2 and Theorem 4.3, pp. 17 and 24).

- `isDefectGroup_conj`: any two defect groups of a block of `k[G]`, `k` any field of
  characteristic `p`, are conjugate in `G`.
- `isDefectGroup_iff_sylow_of_augmentation_ne_zero`: the defect groups of the principal block are
  exactly the Sylow `p`-subgroups (Webb, Corollary 12.4.7, p. 242).
- `O_p(G)` is contained in every defect group (Martínez, Corollary 3.9, p. 21); for a `p`-element
  `x`, `⟨x⟩` is contained in every defect group of every block of `C_G(x)`.
- Defect zero: a block has defect group `1` exactly when it is a matrix algebra over `k`, exactly
  when it contains an ordinary character `χ` with `|G|_p ∣ χ(1)`, and then `Irr(B) = {χ}` and
  `IBr(B) = {χ⁰}` (Webb, Theorem 9.6.1, p. 161; Martínez, Corollary 2.9, p. 15).
- For a block `B` with defect group `D`, `Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with
  defect group `D`, and every such block arises from exactly one `B` (Webb, proof of
  Theorem 12.6.4, p. 250); §7.1 consumes this.

**Checks.**
- `S₃`, `p = 2`: `Br_{⟨(12)⟩}(1 + r + r²) = 1 ≠ 0`, and the maximal `2`-subgroups with nonzero
  image are the three subgroups of order `2`; for the block `r + r²`, `Br_{⟨(12)⟩}(r + r²) = 0`
  and the defect group is `1`.
- Without the `p`-group condition on `Q`, `C₃` at `p = 2` and the block `1 + r + r²` would have the
  whole group `C₃` as maximal subgroup with nonzero projection; the trivial group is its defect
  group.
- `G = 1`: the unique defect group and the unique Sylow subgroup are `1`.

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

Layers 0 and 4; Mathlib `IsPGroup`, `Sylow`, `Subgroup.centralizer`, `Subgroup.normalizer`.

## Layer 7: Brauer's main theorems

### 7.1 Block induction and the first main theorem

For `H ≤ G` and a block `b` of `H`, `b^G` is the block `B` of `G` whose central character satisfies
`λ_B(z) = λ_b(z_H)` for `z ∈ Z(k[G])`, where `z_H` keeps the coefficients on `H`, when such `B`
exists (Sambale, Definition 1.10 and Proposition 1.11, p. 16; Martínez, p. 25). Prove that `b^G` is
defined when `C_G(D_b) ≤ H` for a defect group `D_b` of `b`, that it is transitive, and that for
`P C_G(P) ≤ H ≤ N_G(P)` and a `p`-subgroup `P`, `Br_P(e_B) = ∑_{b^G = B} e_b` (Martínez,
Theorem 4.5 and Corollary 4.6, p. 26).

- `brauer_first_main`: over an algebraically closed field `k` of characteristic `p`, for a
  `p`-subgroup `D`, the rule `b ↦ B` with `Br_D(e_B) e_b ≠ 0` is a
  bijection from the blocks of `k[N_G(D)]` with defect group `D` to the blocks of `k[G]` with
  defect group `D` (Webb, Theorem 12.6.4, p. 250; Martínez, Theorem 4.10, p. 27). For
  `N_G(D) ≤ H ≤ G` the same holds with `H` in place of `N_G(D)`, by applying the theorem to `H` and
  `G` and identifying `N_H(D) = N_G(D)` (Sambale, Theorem 1.12, p. 16).

**Checks.**
- `S₃`, `p = 2`, `D = ⟨(12)⟩`: `N_G(D) = D` has one block, of defect `D`, corresponding to
  `B₀(S₃)`; the defect-zero block of `S₃` is not in the image.
- `D = 1`: `N_G(D) = G` and the bijection is the identity on blocks of defect zero.
- `S₃`, `p = 3`, `D = C₃`: `N_G(D) = S₃`, and the bijection is the identity on the single block.

### 7.2 The second main theorem

For `u ∈ R`, `χ ∈ Irr(G)` and `φ ∈ IBr(b)` with `b` a block of `C_G(u)`, `d^u_{χφ} ≠ 0` implies
`χ ∈ Irr(b^G)`; here `b^G` is defined because `⟨u⟩ ≤ D_b` and so `C_G(D_b) ≤ C_G(u)` (Sambale,
Theorem 1.13 and Proposition 1.11, p. 16). Equivalently, `d^u_{χφ} ≠ 0` implies
`Br_{⟨u⟩}(e_B) e_b ≠ 0` for the block `B` of `χ`, so `(⟨u⟩, b)` is a `B`-Brauer pair. *Needs:*
§§5.1, 6.3, 7.1.

**Checks.**
- `S₃`, `p = 2`, `u = (12)`: `d^u = (1, −1, 0)`, nonzero exactly on `B₀`.
- `S₃`, `p = 3`, `u = r`: `d^r = (1, 1, −1)`, all in the single block.
- `C₂ × C₃` at `p = 2`, `u` the involution: the three blocks of `C_G(u) = G` each induce themselves.

### 7.3 The third main theorem

If `b` is a block of `H` with defect group `D` and `C_G(D) ≤ H`, then `b^G` is principal exactly
when `b` is principal (Sambale, Theorem 1.15, p. 17; Martínez, Corollary 5.9, p. 35; the Axiom
third-main-theorem formalization as a proof source).

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

Layers 5–6.

## Layer 8: normal subgroups and finite-group interfaces

### 8.1 Normal `p`-subgroups

A normal `p`-subgroup `N` acts trivially on every simple `k[G]`-module (Martínez, Theorem 1.14,
p. 6), so simples and Brauer characters of `G` are those of `G/N` by inflation. The image of a block
idempotent under `k[G] → k[G/N]` is a sum of blocks of `G/N`, and every block of `G/N` lies in the
image of exactly one block of `G` (Martínez, Corollary 8.2, Proposition 8.4 and Theorem 8.5,
pp. 51–52). This is a partition, not a bijection: domination is bijective only under further
hypotheses, for instance when `G/C_G(N)` is a `p`-group (Sambale, Theorem 1.23, p. 18).

**Checks.**
- `S₃`, `p = 3`, `N = C₃`: the single block of `𝔽₃[S₃]` maps to `1 = e₊ + e₋` in `𝔽₃[C₂]`, two blocks.
- `C_p`, `N = C_p`: one block maps to the single block of the trivial group.
- `N = 1`: the map is the identity.

### 8.2 Normal `p'`-subgroups

For a normal `p'`-subgroup `N`, `e_N = |N|⁻¹ ∑_{n ∈ N} n` is a central idempotent and
`k[G] e_N ≅ k[G/N]`. The blocks of `G/N` are exactly the blocks of `G` below `e_N`, with the same
ordinary and Brauer characters and isomorphic defect groups (Martínez, Theorem 8.5(iii), p. 52;
Sambale, Theorem 1.24, p. 18); in particular `B₀(G/N)` is `B₀(G)`. Develop block covering for the
other `G`-orbits of characters of `N` (Martínez, Definition 7.3 and Theorem 7.7, pp. 44–45).

**Checks.**
- `S₃`, `p = 2`, `N = C₃`: `e_N = 1 + r + r²` (as `3 = 1`), `k[S₃] e_N` has basis `e_N`, `(12) e_N`
  and is `𝔽₂[C₂]`.
- The standard character of `S₃` restricts to `ζ₃ + ζ₃²` on `C₃` and lies in the other block.
- `N = 1`: `e_N = 1`.

### 8.3 The kernel of the principal block

Prove `⋂_{χ ∈ Irr(B₀(G))} ker χ = pPrimeCore p ⊤` as subgroups of `G` (Navarro, Theorem 6.10).
Route: `⊇` from §8.2 with
`N = O_{p'}(G)`; `⊆` because the projective character `Φ_1` of the trivial module is a
`ℤ`-combination of `Irr(B₀)` (§4.2), hence constant on cosets of the intersection `K`, and
`Φ_1(1) ≠ 0` while `Φ_1` vanishes off the `p`-regular elements (§3.1), so `K` is a `p'`-group.
Prove the modular containment: every simple module in `B₀(G)` is trivial on `O_{p'}(G)`, so its
Brauer character equals its degree there; it is not an equality, since normal `p`-subgroups also
act trivially. *Needs:* §§3.1, 4.2, 8.2; LocalFiniteGroupTheory §L1.

**Checks.**
- `S₃`, `p = 2`: `ker 1 ∩ ker sgn = C₃ = O_{2'}(S₃)`.
- `S₃`, `p = 3`: the standard character is faithful, so the intersection is `1 = O_{3'}(S₃)`.
- `C_p` at `p`: the principal block contains all characters, the intersection is `1 = O_{p'}(C_p)`,
  while the unique simple module has kernel `C_p`.

### 8.4 Interfaces for local group theory

Export the sections (§0.1), block-section orthogonality (§5.2), the principal block (§4.3), the
kernel theorem (§8.3) and the third main theorem (§7.3) at `p = 2` for GlaubermanZStar, whose
fusion argument stays outside this roadmap.

### Examples

The decomposition and Cartan matrices and blocks of `C_p` at `p` (one simple, one block, Cartan
entry `p`), of a cyclic group of order prime to `p` over a splitting field (identity matrices, all
blocks of defect zero), and of `S₃` at `p = 2` (`D = [[1,0],[1,0],[0,1]]`, `C = diag(2, 1)`, the
principal block `{1, sgn}` and the defect-zero block `{std}`) and at `p = 3`
(`D = [[1,0],[0,1],[1,1]]`, `C = [[2,1],[1,2]]`, one block).

### Dependencies

Layers 3–7; LocalFiniteGroupTheory §L1.

## Downstream consumers

- **GlaubermanZStar**: sections, the principal block and its kernel, block-section orthogonality
  and the local third main theorem at `p = 2` (Layers 4–8).

## References

- J. M. Martínez, *Modular representation theory of finite groups*, course notes, Firenze 2024,
  [author's page](https://www.uv.es/jomimar8/pdfs/course%20notes.pdf): Brauer characters
  (Lecture 1), blocks (Lecture 2), defect groups (Lecture 3), the Brauer map and the first main
  theorem (Lecture 4), the third main theorem (Lecture 5), normal subgroups (Lectures 7–8).
- P. Webb, *A Course in Finite Group Representation Theory*, 2016,
  [author's page](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf): projective covers
  (Ch. 7), splitting fields and the decomposition map (Ch. 9), Brauer characters (Ch. 10), blocks,
  the Brauer morphism and Brauer correspondence (Ch. 12).
- B. Sambale, *Blocks of Finite Groups and Their Invariants*, Lecture Notes in Mathematics 2127,
  [author's page](https://benjaminsambale.github.io/pdfs/lnm.pdf): Chapter 1 (definitions, the three
  main theorems, generalized decomposition numbers and their orthogonality).
- D. A. Craven, *Fusion systems*, lecture notes, 2008,
  [author's page](https://web.mat.bham.ac.uk/D.A.Craven/docs/lectures/fusionsystems.pdf): Brauer
  pairs (§2.2).
- J.-P. Serre, *Linear Representations of Finite Groups*, GTM 42, 1977, Part III, §§15–18
  (cited by locator; the text was not read).
- G. Navarro, *Characters and Blocks of Finite Groups*, LMS Lecture Note Series 250, 1998,
  Chapter 6, Theorem 6.10 (the kernel of the principal block; cited by locator; the text was not
  read).
- Axiom's [third main theorem](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BrauerThirdMainTheorem.lean)
  and [section orthogonality](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BlockSectionOrthogonality.lean)
  formalizations, proof sources whose definitions need comparison with the native interfaces.
