# Roadmap: Galois groups of polynomials

Mathlib has the Galois group of a polynomial. `Polynomial.Gal p` is the automorphism group of
the splitting field of `p`. It acts faithfully on the roots, and the action is transitive when
`p` is irreducible. Mathlib also has one direction of Abel-Ruffini. It has a large permutation
action library from A. Chambert-Loir, which covers:

- blocks, and preprimitivity with its characterization by maximality of the stabilizer;
- multiple transitivity and multiple primitivity;
- two of Jordan's criteria for primitivity, and the Iwasawa criterion;
- simplicity of `Aₙ`, and the intransitive case of O'Nan-Scott.

What Mathlib does not have is the material behind the LMFDB section of transitive group labels
`nTj`. The polynomial discriminant is defined, but not its product-of-root-differences formula,
so there is no test for containment in `Aₙ`. There is no resolvent in the Galois-theoretic
sense. Frobenius elements exist, but no theorem identifies the factorization type of `f mod p`
with a cycle type. There is no classification of transitive groups in any degree, no semantics
for the `nTj` labels, and no general wreath product.

This roadmap builds that material in two halves. The first half is permutation group theory,
reusable without any field theory. The second half is Galois theory, stated against
`Polynomial.Gal`. The two halves can be implemented at the same time.

One of those gaps is filled elsewhere. The factorization-type theorem is ramification theory of
number fields, and the [Number Field Arithmetic](../NumberFieldArithmetic/README.md) roadmap owns
it and states it in `Polynomial.Gal` vocabulary. This roadmap consumes that one declaration and
proves the polynomial and permutation consequences: which cycle types a factorization exhibits,
what those exhibitions recognize, and the three-prime
realization of `Sₙ`. It does not develop a second route to the theorem.

## Scope

The boundary is part of the specification.

- **Complete classification of the transitive subgroups of `Sₙ`, for `n ≤ 5` only.** For these
  degrees the roadmap proves that each transitive subgroup is conjugate to exactly one named
  reference subgroup. Every separable irreducible polynomial of positive degree at most 5
  therefore has exactly one label. A reducible, inseparable, or constant polynomial has none,
  and that is the intended behaviour.
- **The consequences of Dedekind's factorization theorem.** Let `f : ℤ[X]` be monic, and let `p`
  be a prime that does not divide `disc f`. The degrees of the irreducible factors of `f mod p`
  are then the cycle lengths of one element of the Galois group. That theorem is **not** proved
  here: Number Field Arithmetic Layer 3.10 owns it, and Layer 5 imports it. What is in scope is
  everything the theorem is used for—the membership of a factorization type in the set of
  Galois cycle types and the recognition theorems it feeds.
- **One theorem of inverse Galois theory.** `Sₙ` is a Galois group over `ℚ` for every `n`, by
  the three-prime construction. The theorem is a constructive existence statement: it produces a
  polynomial from the three prescribed reductions. It is not a closed formula, and the roadmap
  does not define a function that names one polynomial per degree. Layer 9 lists all its
  prerequisites.

The following subjects are outside this roadmap. They are not later milestones of it.

- Hilbert irreducibility, thin sets, and specialization from `ℚ(t)` to `ℚ`.
- The realization of `Aₙ` over `ℚ` for general `n`. Serre derives it from Hilbert
  irreducibility.
- Completeness of the classification of transitive subgroups in degrees 6 to 11.
- Stored database exports, precomputed transitive-group tables, and Galois-group certificates.
  Those may be appropriate for a computational database such as Hex, but not for this roadmap.
- Chebotarev density.
- Ramification theory of number fields: the different, the relative discriminant ideal,
  decomposition fields, and inertia fields. It is Number Field Arithmetic that owns them, and
  that owns the factorization-type theorem they prove. Layer 5 here holds no Frobenius element,
  no ring of integers, and no prime ideal; it imports one declaration whose statement mentions
  only `Polynomial.Gal`, a root action, and a factorization over `ZMod p`.
- Data about abstract groups, such as character tables and abstract group names. This roadmap
  owns only the permutation data of `nTj`.
- The replacement for the discriminant test in characteristic 2, which is Berlekamp's
  invariant.

## Suggested home

Two directories, because the two halves have different customers.

- `TauCeti/GroupTheory/Permutation/` holds Layer 1 and the group-theoretic part of Layer 6.
  That is: the block-stabilizer correspondence, wreath products, imprimitivity, the
  recognition theorems, the classification, and the label predicates on subgroups.
- `TauCeti/FieldTheory/GaloisGroups/` holds Layers 0, 2 to 6, and 9. That is: the polynomial
  dictionary, discriminants, resolvents, Frobenius specialization, degree-at-most-five labels,
  and the realization of `Sₙ`.

The split follows Mathlib, which keeps its permutation library in
`Mathlib/GroupTheory/GroupAction/` and its Galois groups in `Mathlib/FieldTheory/`. It also
keeps the permutation material available to customers who want no field theory.

## How to read the milestone lists

Each milestone records its direct prerequisites. Each prerequisite has exactly one of five
kinds.

| Mark | Kind |
|---|---|
| **(Mathlib)** | A declaration that exists in Mathlib at the pinned version. |
| **(Tau Ceti)** | A declaration that exists in Tau Ceti. |
| **(Layer k)** | An earlier milestone of this roadmap. |
| **(*Roadmap*, Layer k)** | A named layer of another merged roadmap. |
| **(R *Roadmap*, `decl`)** | An exact declaration of a roadmap that is earlier in the merge order. |

The last kind has exactly one supplier and exactly one row, and both are in the contract section
below. A subject is never a prerequisite of this kind: "Dedekind's theorem" is not one,
`exists_gal_fullCycleType_eq_factorizationType` is.

No milestone depends on anything else. In particular, no milestone depends on any of these:

- a branch;
- a pull request that this roadmap does not follow in the merge order;
- a Mathlib pull request;
- a future version of Mathlib;
- an external repository;
- a roadmap that does not exist yet.

Dated information about the surrounding ecosystem is not part of the specification. It is
maintained in a private provenance ledger.

"The pinned Mathlib" means the version in the repository's `lake-manifest.json`. Every claim
below about what Mathlib has was checked against it. The date of that check is maintained in the
private provenance ledger.

## What this roadmap consumes from the Number Field Arithmetic roadmap

Dedekind's factorization theorem is a theorem of ramification theory. Its proof needs the ring
generated by the roots, a maximal ideal over `p`, the surjection from a decomposition group onto
a residue Galois group, and the triviality of inertia. That is the subject of the
[Number Field Arithmetic](../NumberFieldArithmetic/README.md) roadmap, which owns those objects
and proves the theorem in the form a polynomial roadmap can use, over a **reducible** `f` and
with the fixed points restored. This roadmap does not prove it a second time.

The exchange is one declaration, and it is the whole of the exchange. That roadmap is earlier in
the merge order; nothing there depends on anything here.

| Consumer here | Supplier layer | Exact declaration | Statement relied on |
|---|---|---|---|
| 5, the membership statement, and through it Layers 6, 8 and 9 | 3.10 | `exists_gal_fullCycleType_eq_factorizationType` | for `f : ℤ[X]` monic and `p` prime with `¬ (p : ℤ) ∣ f.discr`, there is `σ : (f.map (Int.castRingHom ℚ)).Gal` with `(galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).cycleType + Multiset.replicate (Fintype.card (rootSet ℂ) − support.card) 1` equal to `Multiset.map natDegree (normalizedFactors (f.map (Int.castRingHom (ZMod p))))` |

The backticked name lives in the namespace `TauCetiRoadmap.NumberFieldArithmetic`, in
`TauCetiRoadmap/NumberFieldArithmetic/Suggested.lean`.

## What this roadmap exports to Belyi Maps

This roadmap is the sole owner of `fullCycleType`, `numTransitiveGroups`,
`TransitiveGroupIndex`, `referenceSubgroup`, and `TransitiveGroupLabel`. The `BelyiMaps`
roadmap imports these declarations for passports and database labels; it does not keep local
stand-ins after this supplier is available. Conversely, branch cycles and peripheral-power
theorems stay in `BelyiMaps` and create no dependency in this direction.

Two things about that row are worth stating, because they are what make it an exact contract and
not a gesture at a subject.

- The hypothesis is `p ∤ f.discr`, on the discriminant of the **polynomial**, and not on
  ramification in the field of a root. The two differ, and §Layer 5 records the standard
  counterexample.
- The two sides of the supplied equation are, definitionally, `fullCycleType` of the root action
  and `factorDegrees f p`. Those two abbreviations are defined here, in Layers 0 and 5, and the
  supplier does not use them. `Suggested.lean` therefore carries a **closed** proof that the
  supplied statement implies the abbreviated one. If either definition drifts, or the supplier's
  signature changes, that proof stops elaborating and the build fails. No milestone of this
  roadmap restates the supplied theorem.

## Conventions

### Which Galois group

"The Galois group of `p`" means Mathlib's `Polynomial.Gal p`. This is the automorphism group of
`p.SplittingField` over the base field `F`. It acts on `p.rootSet E` for a splitting extension
`E` through `Polynomial.Gal.galAction`. The map
`galActionHom : p.Gal →* Equiv.Perm (p.rootSet E)` is injective. Every statement below uses this
definition. No second definition of the Galois group is introduced.

The LMFDB attaches a Galois group to a number field `K = ℚ(α)`. That group is
`(minpoly ℚ α).Gal`, in its degree-`n` action on the roots of the minimal polynomial. Layer 0
proves the comparison. It is a milestone, not a convention.

Reducible polynomials matter, because resolvents are usually reducible. No milestone assumes
irreducibility where separability is enough. Each statement says which of the two it uses.

### Separability

The degree-`n` permutation picture needs `n` distinct roots. The standing hypotheses are
therefore `p.Separable` and `p ≠ 0`, plus monicity where it simplifies a statement. Under these
hypotheses `p.rootSet p.SplittingField` has `natDegree p` elements.

Over `ℚ`, and over any perfect field, an irreducible polynomial is separable. The corollaries
over `ℚ` therefore drop the hypothesis. The statements in characteristic `p` keep it. An
inseparable polynomial has too few roots and a smaller permutation image. Nothing below is
claimed for such a polynomial.

### Roots are intrinsic; numberings are temporary

The action is on `p.rootSet E`, which is a subtype with no order. Statements are intrinsic where
possible. A numbering `e : Fin n ≃ p.rootSet E` is used only to compare with a reference subgroup
of `Equiv.Perm (Fin n)`. It always appears as an explicit equivalence, inside a statement that
is up to conjugacy. Layer 6 proves that the label does not depend on the numbering. No global
order on the roots is ever fixed.

### The `nTj` labels and their data model

For `n ≤ 47` the LMFDB numbers the conjugacy classes of transitive subgroups of `Sₙ` as
`nT1, nT2, …`. The numbering follows the transitive group tables of Butler and McKay for
`n ≤ 11`. This roadmap uses only the fully proved classification for `n ≤ 5`; it does not import
or store the larger database tables. The data model is:

- `numTransitiveGroups : ℕ → ℕ` is the number of proved classes for `1 ≤ n ≤ 5`, and is `0`
  outside that range.
- `TransitiveGroupIndex n := Fin (numTransitiveGroups n)`. A label index is valid by
  construction. No unconstrained natural number is used as one.
- `referenceSubgroup n j ≤ Equiv.Perm (Fin n)` is a proved library representative.
- `TransitiveGroupLabel j G` says that some element of `Equiv.Perm (Fin n)` conjugates `G` onto
  `referenceSubgroup n j`.
- `HasGaloisLabel f j` says that `f` is separable of degree `n`, and that some numbering of its
  root set carries the Galois image to a group with label `j`.

Index `j` displays as the label `nT(j+1)`. Transitivity of each reference subgroup is proved
once, so the label predicate carries no transitivity clause. A conjugate of a transitive group
is transitive.

The invariants that the LMFDB displays are fixed in Mathlib vocabulary:

| Invariant | Definition |
|---|---|
| order | `Nat.card G` |
| parity `+1` | `G ≤ alternatingGroup (Fin n)` |
| primitive | `MulAction.IsPreprimitive G (Fin n)` for the natural action |
| solvable | `IsSolvable G` |
| full cycle types | the set of values of `fullCycleType` on `G`, including the fixed-point parts; equivalently, `Equiv.Perm.cycleType` together with the ambient degree |

### Cycle types count fixed points
Mathlib's `Equiv.Perm.cycleType` lists only the cycle lengths that are at least 2. The
factorization type of `f mod p` is a partition of `n` that includes its parts equal to 1. The
correction is made once:

```
fullCycleType σ = σ.cycleType + Multiset.replicate (n - σ.support.card) 1
```

Every comparison below between a factor-degree multiset and a permutation uses `fullCycleType`.
A factor-degree multiset is never compared with a bare `cycleType`.

`fullCycleType` takes the `DecidableEq` of its carrier as an argument, and is therefore not
`noncomputable`. This is not decoration. Closing the definition over `Classical.propDecidable`
gives a term that is equal, but not syntactically equal, to the same multiset written at the
carrier's own instance — which is what the supplied factorization theorem of Layer 5 is stated
with. The contract check in `Suggested.lean` does not close under the classical spelling, and it
does under this one.

### Discriminant

The discriminant is Mathlib's `Polynomial.discr`, in
`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`. It is the resultant of `f` and `f'`,
divided by the leading coefficient and multiplied by a sign. This roadmap adopts it and builds
the missing theory around it, starting with the root-product formula in Layer 3.

The discriminant test `IsSquare (discr f) ↔ Gal f ≤ Aₙ` is **false in characteristic 2**. When
`−1 = 1`, the product `∏_{i<j} (rᵢ − rⱼ)` is symmetric, so its square root is always in the base
field, and the test decides nothing. Every statement of the test carries `ringChar F ≠ 2`.

### The name "resolvent"

In Mathlib, `resolvent` is the resolvent of spectral theory, in
`Mathlib/Algebra/Algebra/Spectrum/Basic.lean`. This roadmap therefore uses the names
`galResolvent` for a general orbit resolvent, `resolventCubic` for the cubic attached to a
quartic, and `resolventSextic` for the sextic attached to a quintic.

### Two senses of "solvable"

Two properties are in use. They are never given the same name.

- `IsSolvable f.Gal` is solvability of the Galois group. Every statement below about quintics
  uses this property. This includes the criterion of Layer 4 and the table of Layer 6.
- Solvability by radicals is membership in the intermediate field `solvableByRad F E` of
  `Mathlib/FieldTheory/AbelRuffini.lean`. The predicate `IsSolvableByRad` is deprecated there
  since 2026-02-28.

Mathlib proves one implication, as `isSolvable_gal_of_irreducible`: if `q` is irreducible and
some root of `q` lies in `solvableByRad F E`, then `IsSolvable q.Gal`. The converse is not in
Mathlib and is not a milestone here. No statement below is an equivalence that mentions
`solvableByRad`.

### Names
The roadmap introduces these names: `fullCycleType`, `factorDegrees`, `numTransitiveGroups`,
`TransitiveGroupIndex`, `referenceSubgroup`, `TransitiveGroupLabel`, `HasGaloisLabel`,
`HasFullSymmetricGaloisGroup`, `coordPermAut`, `WreathProduct`, `ResolventSpec`,
`galResolvent`, `resolventCubic`, and `resolventSextic`. `Suggested.lean` fixes their forms.

## What Mathlib provides

Each item was checked in the pinned Mathlib.

- **Galois groups of polynomials.** `Mathlib/FieldTheory/PolynomialGaloisGroup.lean` has
  `Polynomial.Gal`, `galAction`, and `galActionHom`, with `galActionHom_injective` for
  faithfulness and `galAction_isPretransitive` for transitivity when `p` is irreducible. The same
  file has `restrict`, `restrictDvd`, `restrictProd` with `restrictProd_injective`, which gives
  `Gal (p*q) ↪ Gal p × Gal q`, and `restrictComp_surjective`. It has
  `card_of_separable : Nat.card p.Gal = finrank F p.SplittingField` and `prime_degree_dvd_card`.
  `Mathlib/Analysis/Complex/Polynomial/Basic.lean` has
  `Polynomial.Gal.galActionHom_bijective_of_prime_degree` and its primed variant: over `ℚ`, an
  irreducible polynomial of prime degree with exactly two non-real roots has full Galois group.
- **Root counts.** `Mathlib/FieldTheory/Separable.lean` has `card_rootSet_eq_natDegree`, for a
  separable polynomial that splits.
- **Solvability.** `Mathlib/FieldTheory/AbelRuffini.lean` has the intermediate field
  `solvableByRad`, the theorem `isSolvable_gal_of_irreducible`, and the family of
  `gal_*_isSolvable` lemmas. `Archive/Wiedijk100Theorems/AbelRuffini.lean` shows that
  `x⁵ − 4x + 2` is not solvable by radicals, through `gal_Phi`, which computes its Galois group
  as `S₅`.
- **The permutation action library of A. Chambert-Loir.** `GroupAction/Blocks.lean` has
  `MulAction.IsBlock`, the trivial and orbit blocks, `IsBlock.ncard_block_mul_ncard_orbit_eq`,
  and the bounded order `BlockMem`. `GroupAction/Primitive.lean` has `IsPreprimitive`,
  `IsQuasiPreprimitive`, `isCoatom_stabilizer_iff_preprimitive`, `IsPreprimitive.of_prime_card`,
  and Rudio's theorem. `GroupAction/MultipleTransitivity.lean` has `IsMultiplyPretransitive`,
  the implication from 2-transitivity to preprimitivity, `eq_top_of_isMultiplyPretransitive`,
  and `IsMultiplyPretransitive.alternatingGroup_le`. `GroupAction/MultiplePrimitivity.lean` has
  `IsMultiplyPreprimitive`. `GroupAction/Jordan.lean` has
  `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem` and
  `Equiv.Perm.alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem`. The files
  `GroupAction/Iwasawa.lean` and `GroupAction/Transitive.lean`, and the machinery in
  `GroupAction/SubMulAction/{OfStabilizer, OfFixingSubgroup, Combination}.lean`, complete the
  library. The last of these gives the action on `powersetCard α n`.
- **Permutations and named groups.** `GroupTheory/Perm/Cycle/Type.lean` has
  `Equiv.Perm.cycleType` with its sum, order, sign, and conjugacy lemmas, among them
  `sign_of_cycleType`, `cycleType_conj`, `isConj_iff_cycleType_eq`, and
  `subgroup_eq_top_of_swap_mem`. That last theorem says that a transitive subgroup of `Perm α`
  of prime cardinality degree that contains a transposition is everything. The prime-degree
  recognition theorem uses it. `Perm/Cycle/PossibleTypes.lean` has
  `Equiv.Perm.exists_with_cycleType_iff`. `Perm/Centralizer.lean` has the centralizer of a
  permutation in terms of its cycle type. `Perm/ClosureSwap.lean`,
  `SpecificGroups/Alternating/Simple.lean` (`alternatingGroup.isSimpleGroup` for
  `5 ≤ Nat.card α`), `SpecificGroups/Alternating/KleinFour.lean`, `SpecificGroups/Cyclic`,
  `SpecificGroups/Dihedral.lean`, and `GroupTheory/Sylow.lean` supply the rest. Cauchy's theorem
  is `exists_prime_orderOf_dvd_card`.
- **Wreath products, regular case only.** `GroupTheory/RegularWreathProduct.lean` has
  `D ≀ᵣ Q = (Q → D) ⋊ Q`, with base indexed by `Q` itself. It has `toPerm` into
  `Equiv.Perm (Λ × Q)`, `IteratedWreathProduct`, and `Sylow.mulEquivIteratedWreathProduct` for
  the Sylow `p`-subgroups of `S_{pⁿ}`. The general permutation wreath product, with base indexed
  by a `Q`-set, is absent. Layer 1 builds it.
- **O'Nan-Scott, one case.** `GroupTheory/Perm/MaximalSubgroups.lean` and
  `SpecificGroups/Alternating/MaximalSubgroups.lean` have `isCoatom_stabilizer`, so the setwise
  stabilizer of a subset is maximal. That is the intransitive case, after Liebeck, Praeger, and
  Saxl. The file names the imprimitive case as its next target.
- **Discriminants and resultants.** `RingTheory/Polynomial/Resultant/Basic.lean` has
  `Polynomial.resultant`, the determinant of the Sylvester matrix, and `Polynomial.discr`, with
  `discr_C` and `discr_of_degree_eq_one`, `_two`, and `_three`. `Algebra/CubicDiscriminant.lean`
  has `Cubic.discr`, `Cubic.discr_eq_prod_three_roots`, and the criterion for distinct roots.
  `RingTheory/Discriminant.lean` has `Algebra.discr`, the discriminant of a basis for the trace
  form, with `discr_powerBasis_eq_prod''` in the form `∏ (σᵢ x − σⱼ x)²`, and
  `discr_powerBasis_eq_norm`.
- **Finite fields, for Layer 5.** `FieldTheory/Finite/` has the finite fields, the cyclicity of
  their Galois groups, and the minimal polynomial over them. That is the whole of what Layer 5
  takes from Mathlib. The ramification input that Dedekind's theorem needs —
  `NumberTheory/KummerDedekind.lean`, `RingTheory/Frobenius.lean` with `IsArithFrobAt`,
  `RingTheory/Invariant/`, and `NumberTheory/RamificationInertia/` — is consumed by the supplier
  of that theorem and not here; see §What this roadmap consumes.
- **Cyclotomic Galois groups.** `NumberTheory/Cyclotomic/Gal.lean` has
  `IsCyclotomicExtension.autEquivPow`, `galCyclotomicEquivUnitsZMod`, and
  `galXPowEquivUnitsZMod`, so `Gal(Φₙ) ≃* (ZMod n)ˣ`. The abelian examples `4T1` and `4T2` use
  them.
- **Finite fields, for Layer 9.** `FieldTheory/Finite/GaloisField.lean` and the surrounding API
  for irreducible polynomials. Layer 9 names the exact existence statements it needs.
- **Chebotarev density is absent.** The only occurrence of the name in the pinned Mathlib is in
  `docs/1000.yaml`, which is a list of theorems that are not formalized. Nothing here depends on
  it.

## What is missing

Everything that concerns labels. At the pinned version there is:

- no dictionary between the orbits of the Galois action and the irreducible factors;
- no correspondence between blocks and intermediate fields;
- no root-product formula for the discriminant, and therefore no test for `Aₙ`;
- no resolvent in the Galois-theoretic sense;
- no theorem that identifies the factorization type of `f mod p` with a cycle type, although
  Frobenius elements exist and `KummerDedekind` compares the two factorizations. This is the one
  gap in the list that another roadmap fills; every other line is built here;
- no general wreath product, only `RegularWreathProduct`;
- no theorem of Jordan for a `p`-cycle;
- no classification of the transitive subgroups of `Sₙ` for any `n ≥ 3`;
- no `nTj` labels or layer of proved low-degree invariants;
- no realization of `Sₙ` over `ℚ`, beyond the criterion in prime degree.
---

## The build, in layers

The numbering is the order of dependence. Layer 1 is pure group theory. It can be implemented at
the same time as Layers 0, 2, and 3. As each layer makes the types of the next layer expressible,
its milestones appear in `Suggested.lean` with `sorry`.

### Layer 0: the permutation representation of a polynomial

This layer relates polynomial data to the image subgroup
`(galActionHom p E).range ≤ Equiv.Perm (p.rootSet E)`.

- **Degree bookkeeping.** For separable `p ≠ 0`, the set `p.rootSet p.SplittingField` has
  `p.natDegree` elements. The action of `p.Gal` on it is faithful. Therefore
  `Nat.card p.Gal = Nat.card (galActionHom p p.SplittingField).range`, and every permutation
  invariant of `p.Gal` may be computed in the image.
  *Needs:* `card_rootSet_eq_natDegree` (Mathlib); `galActionHom_injective` (Mathlib);
  `IsSplittingField.splits` (Mathlib).

- **`fullCycleType`, with its basic API.** The definition is in the conventions above. The
  milestone is the definition together with the following API. A definition with no lemmas is
  not a contribution.

  - *Constructor and simp form:* the defining equation, and a `simp` lemma that rewrites
    `fullCycleType` of the identity to `Multiset.replicate (card α) 1`.
  - *Examples:* the identity of `Fin 4` gives `{1,1,1,1}`; a transposition in `Fin 4` gives
    `{2,1,1}`; a 4-cycle gives `{4}`.
  - *Comparison lemmas:* `(fullCycleType σ).sum = Fintype.card α`;
    `fullCycleType σ = σ.cycleType` if and only if `σ.support = Finset.univ`;
    `Multiset.count 1 (fullCycleType σ) = Fintype.card α - σ.support.card`.
  - *Morphisms and naturality:* `fullCycleType` is constant on conjugacy classes, and it commutes
    with transport along an equivalence `α ≃ β`, that is, with `Equiv.permCongrHom`.
  - *Edge cases:* `α` empty; `σ` with no fixed point; `σ = 1`.
  - *Downstream interface:* Layer 5 compares it with factor degrees and Layer 6 uses it in the
    low-degree recognition theorems.

  *Needs:* `Equiv.Perm.cycleType` with its sum and conjugacy lemmas (Mathlib);
  `Equiv.permCongrHom` (Mathlib).

- **Orbits and irreducible factors.** The main statement is an equivalence, not a count. For
  separable `p ≠ 0`:

  - the orbit of a root `α` is the set of roots of `minpoly F α` inside `p.rootSet E`;
  - therefore the orbit quotient `orbitRel.Quotient p.Gal (p.rootSet E)` is in bijection with
    the finite set of distinct monic irreducible factors of `p`, and the bijection sends the
    orbit of `α` to `minpoly F α`;
  - along that bijection, the degree of a factor is the cardinality of the orbit.

  Equality of the two cardinalities is a corollary of the bijection.
  *Needs:* the degree bookkeeping above (Layer 0); `minpoly` and its irreducibility (Mathlib);
  `UniqueFactorizationMonoid.normalizedFactors` (Mathlib); `MulAction.orbitRel` (Mathlib).

- **Transitivity and irreducibility.** For separable `p` with `0 < p.natDegree`, the action is
  transitive if and only if `p` is irreducible. Every resolvent argument later uses this,
  because resolvents are usually reducible.

  - *Source:* standard; the forward implication is the orbit statement above, and the reverse
    implication is Mathlib's `galAction_isPretransitive`.
  - *Hypotheses:* separability is needed, and cannot be dropped.
  - *False generalization:* without separability, `(X² − 2)²` over `ℚ` has the transitive action
    of `C₂` on its two distinct roots, and is not irreducible. Without separability the correct
    conclusion is only that `p` is a unit times a power of one irreducible polynomial.

  *Needs:* the orbit statement above (Layer 0); `galAction_isPretransitive` (Mathlib).

- **Invariants of the image.** Order, through `card_of_separable`. Parity, through the character
  `p.Gal →* ℤˣ` obtained from `galActionHom` and `Equiv.Perm.sign`; the image lies in
  `alternatingGroup` if and only if that character is trivial. Solvability, as `IsSolvable p.Gal`.
  Cycle types of elements, through `fullCycleType`. These are definitions with transport lemmas.
  Layers 3 to 5 give the tests that compute them.
  *Needs:* `card_of_separable`, `Equiv.Perm.sign`, `alternatingGroup`, `IsSolvable` (Mathlib);
  `fullCycleType` (Layer 0).

- **Polynomials and normal closures.** Let `K = F(α)` and `f = minpoly F α`, with `f` separable.
  The milestone is an explicit isomorphism, not an identification in prose: `f.Gal` is isomorphic
  as a group to the automorphism group of the normal closure of `K/F`. The isomorphism is a
  `MulEquiv` induced by an `AlgEquiv` of the two fields. Under it, the stabilizer of the root `α`
  is the subgroup that fixes `K`, of index `n = [K : F]`.
  *Needs:* `IntermediateField.normalClosure` (Mathlib); `IsGalois` and the Galois correspondence
  (Mathlib); the degree bookkeeping above (Layer 0).

- **Conjugate fields.** Write `G = f.Gal` and `H = stabilizer G α`. Three statements:

  - `G/H` is in `G`-equivariant bijection with the roots of `f`, and with the set of
    `F`-embeddings of `F(α)` into the splitting field;
  - the subfields of the splitting field that are conjugate to `F(α)` correspond to the
    conjugates of `H` in `G`;
  - the number of distinct such subfields is `[G : N_G(H)]`. The conjugate fields are therefore
    indexed by `G / N_G(H)`. This is a proper quotient of `G/H` whenever `H` is not
    self-normalizing.

  Under this dictionary, the Galois group that the LMFDB attaches to `K` is
  `TransitiveGroupLabel j` applied to the image of `galActionHom`. The field `K` is determined by
  `f.Gal` together with its point stabilizer up to conjugacy.
  *Needs:* the normal-closure isomorphism above (Layer 0); `Subgroup.normalizer` and the orbit
  formula for conjugates (Mathlib).

### Layer 1: permutation groups, blocks, and wreath products

Pure group theory, for `TauCeti/GroupTheory/Permutation/`. Every statement is about an abstract
group action, in Mathlib's vocabulary. No statement mentions a field.

- **The block-stabilizer correspondence.** Let `G` act transitively on `α`, and let `a : α`.
  Send a block `B` that contains `a` to its setwise stabilizer `stabilizer G B`. That map is an
  order isomorphism onto the interval `[stabilizer G a, ⊤]` of subgroups. Its inverse is
  `H ↦ H • a`.

  - *Source:* Wielandt, *Finite Permutation Groups*, Theorem 7.5; Dixon and Mortimer,
    *Permutation Groups*, Theorem 1.5A.
  - *Hypotheses:* the action must be transitive.
  - *False generalization:* transitivity cannot be dropped. Let `G` be trivial and let
    `α = {0,1}`. Then `{0}` and `α` are both blocks that contain `0`, and both have stabilizer
    `⊤`. The map is not injective.

  Mathlib has the two ends of this isomorphism, as the bounded order `BlockMem` and as
  `isCoatom_stabilizer_iff_preprimitive`. Layer 2 transports the isomorphism to intermediate
  fields.
  *Needs:* `MulAction.IsBlock` and `BlockMem` (Mathlib); `MulAction.stabilizer` (Mathlib).

- **The two extremal cases.** Minimal blocks and maximal blocks control two different actions.
  The two statements are not interchangeable.

  - If `B` is a minimal nontrivial block that contains `a`, then `stabilizer G B` is minimal
    above `stabilizer G a`. Therefore the setwise stabilizer of `B` acts primitively **on `B`**.
  - If `B` is a maximal proper block that contains `a`, then `stabilizer G B` is a maximal proper
    subgroup of `G`. Therefore `G` acts primitively **on the block system** `{g • B}`.

  An iterated chain of imprimitivity is defined from these two statements. A maximal chain of
  blocks `{a} = B₀ ⊂ B₁ ⊂ ⋯ ⊂ B_k = α` corresponds to a maximal chain of subgroups from
  `stabilizer G a` to `G`. At each step, the stabilizer of `B_{i+1}` acts primitively on the
  `B_i`-blocks that it contains.
  *Needs:* the block-stabilizer correspondence above (Layer 1);
  `isCoatom_stabilizer_iff_preprimitive` (Mathlib).

- **General wreath products, with their basic API.** Define
  `WreathProduct D ι := (ι → D) ⋊ Equiv.Perm ι`, and for a subgroup `Q ≤ Equiv.Perm ι` the
  restricted wreath product `(ι → D) ⋊ Q`. This generalizes Mathlib's `RegularWreathProduct`,
  which is the case `ι = Q` with the translation action. The API:

  - *Constructors and projections:* the inclusion of the base `(ι → D)` as a normal subgroup,
    the inclusion of the top group `Q`, the projection to `Q`, and the semidirect product
    structure.
  - *Examples:* `WreathProduct (ZMod 2) (Fin 2)` is dihedral of order 8, and is the Sylow
    2-subgroup of `S₄`; `WreathProduct D (Fin 1) ≃* D`.
  - *Morphisms and functoriality:* a group morphism `D →* D'` induces
    `WreathProduct D ι →* WreathProduct D' ι`; an equivalence `ι ≃ ι'` induces an isomorphism of
    wreath products; both are functorial for composition.
  - *Actions:* two, and they are separate milestones. The imprimitive action on `ι × Λ` for a
    `D`-set `Λ` is unconditional. The product action on `ι → Λ` is also unconditional as a
    construction; its primitivity is a theorem with hypotheses, and those hypotheses are part of
    the statement. The product action of `D ≀ Sym(ι)` on `ι → Λ` is primitive when `D` acts
    primitively but not regularly on `Λ`, when `Λ` has at least three points, and when `ι` is
    finite and nonempty. Without those hypotheses the claim is false, so the construction and
    the primitivity theorem are never stated together.
  - *Comparison lemma:* a canonical `MulEquiv` `D ≀ᵣ Q ≃* (Q → D) ⋊ Q'`, where `Q'` is the image
    of the regular representation of `Q`. This is an isomorphism, not an equality.
  - *Orders:* for `ι` and `D` finite,
    `Nat.card ((ι → D) ⋊ Q) = Nat.card D ^ Nat.card ι * Nat.card Q`, and
    `Nat.card (WreathProduct D ι) = Nat.card D ^ Nat.card ι * (Nat.card ι)!`.
  - *Edge cases:* `ι` empty, `ι` a singleton, and `D` trivial.
  - *Downstream interfaces:* the imprimitivity theorem below, and the block analysis of Layer 6.

  Mathlib's `RegularWreathProduct.lean` and `Perm/MaximalSubgroups.lean` border this material.
  Take the names and the choice of the primary variant from those files, so that the two
  libraries agree.
  *Needs:* `RegularWreathProduct` (Mathlib); `SemidirectProduct` (Mathlib); `Equiv.Perm`
  (Mathlib).

- **Imprimitivity gives a wreath embedding.** For a transitive action with a block `B` of size
  `l`, with `1 < l < n`, the block system `{g • B}` has `m = n/l` members. The induced map
  `G →* Equiv.Perm (block system)` has a kernel that embeds in `∏ Perm(block)`. The group `G`
  embeds in `WreathProduct (Perm B) (block system)`, compatibly with a bijection
  `α ≃ (block system) × B`.

  - *Source:* Dixon and Mortimer, Theorem 2.6A.
  - *Hypotheses:* the action is transitive and `B` is a nontrivial proper block.

  *Needs:* the block-stabilizer correspondence and the wreath products above (Layer 1).

- **Jordan's theorem for a `p`-cycle.** A primitive subgroup of `Sₙ` that contains a `p`-cycle,
  with `p` prime and `p + 3 ≤ n`, contains `Aₙ`.

  - *Source:* Wielandt, Theorem 13.9. Mathlib's `GroupAction/Jordan.lean` records the same
    statement as a `proof_wanted`, so the shape to use is fixed and is worth following. The Tau
    Ceti deliverable is a theorem of its own, in the Tau Ceti namespace, named
    `alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`. It is proved here, and it does not
    use anything from Mathlib's `proof_wanted`.
  - *Hypotheses:* primitivity, `p` prime, and `p + 3 ≤ n`.
  - *False generalizations:* the bound `p + 3 ≤ n` cannot be weakened to `p ≤ n` or to
    `p + 1 ≤ n`. Two groups show this.

    - `AGL(1,5)` has order 20. It is primitive on 5 points and contains a 5-cycle. It does not
      contain `A₅`. It is `5T3` in the table of Layer 6.
    - `AGL(1,8)` has order 56. It is primitive on 8 points and contains a 7-cycle with one
      fixed point. It does not contain `A₈`.

  *Needs:* `IsPreprimitive` (Mathlib); `Equiv.Perm.cycleType` (Mathlib);
  `alternatingGroup` (Mathlib).

- **The recognition theorems.** Each is a small named theorem. Together they support the
  degree-at-most-five classification and the realization of `Sₙ` in Layer 9.

  - A transitive subgroup of `S_p`, for `p` prime, contains a `p`-cycle.
    *Needs:* Cauchy's theorem `exists_prime_orderOf_dvd_card` (Mathlib).
  - A transitive subgroup of `S_p` of prime degree that contains a transposition is `S_p`.
    *Needs:* `Equiv.Perm.subgroup_eq_top_of_swap_mem` (Mathlib).
  - A transitive group that contains an `(n−1)`-cycle is 2-transitive, and therefore primitive.
    *Needs:* `IsMultiplyPretransitive` and the implication to preprimitivity (Mathlib).
  - A primitive group that contains a transposition is `Sₙ`. A primitive group that contains a
    3-cycle contains `Aₙ`.
    *Needs:* `subgroup_eq_top_of_isPreprimitive_of_isSwap_mem` and
    `alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem` (Mathlib).
  - An element with exactly one cycle of length 2, and all other cycle lengths odd, has an odd
    power that is a transposition.
    *Needs:* `Equiv.Perm.cycleType` and the order of a permutation (Mathlib).
  Recognition that reads a low-degree table is not here. It is in Layer 6, after the
  classification that it depends on.

### Layer 2: the dictionary between Galois theory and permutations

Let `p` be irreducible and separable over `F`, with a root `α` in `L = p.SplittingField`.

- **Stabilizers are relative Galois groups.** `stabilizer p.Gal (α : rootSet)` is
  `(IntermediateField.adjoin F {α}).fixingSubgroup`, of index `natDegree p`.
  *Needs:* the Galois correspondence (Mathlib); the point-stabilizer statement (Layer 0).

- **Blocks and intermediate fields.** Transport the block-stabilizer isomorphism of Layer 1 along
  the Galois correspondence. The result is a correspondence between the blocks that contain `α`
  and the intermediate fields of `F(α)/F`. The block correspondence preserves inclusion and the
  Galois correspondence reverses it. The composite therefore reverses inclusion. State it as an
  order anti-isomorphism, or as an order isomorphism onto the `OrderDual`. Both maps are
  explicit, and each is proved to invert the other.

  - a block `B` that contains `α` maps to the fixed field of `stabilizer p.Gal B`;
  - an intermediate field `F ⊆ E ⊆ F(α)` maps to the set of roots of `minpoly E α` that lie in
    `p.rootSet L`.

  The two ends confirm the orientation. For `E = F(α)`, `minpoly E α = X − α` and the block is
  `{α}`. For `E = F`, `minpoly E α = p` and the block is the whole root set.
  *Needs:* the block-stabilizer correspondence (Layer 1); the Galois correspondence (Mathlib);
  `minpoly` over an intermediate field (Mathlib).

- **Primitivity and intermediate fields.** Assume `1 < natDegree p`. The action of `p.Gal` on
  the roots is then preprimitive if and only if `IntermediateField.adjoin F {α}` is an atom.
  Equivalently, `F(α)/F` has no intermediate field other than the two ends. The degree
  hypothesis is needed: in the linear case the action on one point is preprimitive, while
  `F(α) = ⊥` is not an atom. That hypothesis matches the `[Nontrivial X]` hypothesis of Mathlib's
  `isCoatom_stabilizer_iff_preprimitive`. A corollary, also available from
  `IsPreprimitive.of_prime_card`: irreducible of prime degree implies primitive.
  *Needs:* `isCoatom_stabilizer_iff_preprimitive` (Mathlib); the block correspondence above
  (Layer 2).

- **2-transitivity.** For `1 < natDegree p`, the action is 2-pretransitive if and only if
  `p / (X − α)` is irreducible over `F(α)`. The proof is transitivity of the point stabilizer on
  the remaining roots. State it with the `isMultiplyPretransitive_iff` of
  `SubMulAction.ofStabilizer`.
  *Needs:* `SubMulAction.ofStabilizer` with `isMultiplyPretransitive_iff` (Mathlib); the
  stabilizer statement above (Layer 2).

- **Products and towers.** Describe the image of `restrictProd`. The group `Gal (p*q)` is the
  fiber product: the subgroup of `Gal p × Gal q` of pairs that agree on the intersection
  `L_p ∩ L_q` of the two splitting fields. Both projections are surjective, by
  `restrictDvd_surjective`. Name the two restriction maps to the intersection explicitly. The
  degenerate case carries the exact hypothesis that it needs, which is `L_p ∩ L_q = F`. For
  Galois extensions that hypothesis is the same as linear disjointness over `F`. Under it, the
  map is an isomorphism onto the full product. Resolvents also need this lemma: a `Gal p`-
  equivariant polynomial map of root data induces a surjection `Gal p ↠ Gal q` when the splitting
  field of `q` embeds in that of `p`.
  *Needs:* `restrictProd`, `restrictProd_injective`, `restrictDvd_surjective` (Mathlib); the
  Galois correspondence (Mathlib).

- **Reducible polynomials.** For reducible separable `p`, the statements about stabilizers and
  blocks are made for each orbit, that is, for each irreducible factor. No statement quantifies
  over "the" root of a reducible polynomial.
  *Needs:* the orbit statement (Layer 0).

### Layer 3: the discriminant and the alternating group

- **The root-product formula.** For monic `f` of degree `n` that splits in `L`, with roots
  `r : Fin n → L` listed with multiplicity,
  `algebraMap R L f.discr = ∏_{i < j} (r i − r j)²`. State it in the shape that Mathlib's own
  TODO in `Resultant/Basic.lean` takes, which is the product form of the resultant. A later
  Mathlib version then replaces this milestone by a deletion and an import. State these
  consequences with it:

  - the product formula for `discr (f*g)`, with its cross term `resultant f g`;
  - base change `(f.map φ).discr = φ f.discr` for a ring morphism `φ`, in the degree-preserving
    case, which is what Layer 5 uses for `ℤ → ZMod p`;
  - `f.discr ≠ 0 ↔ f.Separable`, for monic `f`;
  - the two comparison lemmas that keep the several discriminant APIs consistent:
    `Cubic.discr P = (P.toPoly).discr` after normalization to monic, and, for a power basis,
    `Algebra.discr` of the basis equal to `(minpoly).discr`, through `discr_powerBasis_eq_norm`.

  *Needs:* `Polynomial.discr` and `Polynomial.resultant` (Mathlib); `Cubic.discr` (Mathlib);
  `Algebra.discr` and `discr_powerBasis_eq_norm` (Mathlib); the symmetric function API
  (Mathlib).

- **The square root of the discriminant.** For separable monic `f` over `F` with
  `ringChar F ≠ 2`, put `δ = ∏_{i<j} (rᵢ − rⱼ)`. Then `σ δ = sign (galActionHom σ) • δ` for every
  `σ ∈ f.Gal`. The **discriminant test** follows: `IsSquare f.discr` if and only if
  `(galActionHom …).range ≤ alternatingGroup`.

  - *Source:* standard; see Cohen, *A Course in Computational Algebraic Number Theory*, §6.3.
  - *Hypotheses:* `f` monic and separable, and `ringChar F ≠ 2`.
  - *False generalization:* the characteristic hypothesis cannot be dropped. In characteristic 2,
    `−1 = 1`, so `δ` is a symmetric function of the roots and lies in `F` for every `f`. The test
    then reports "square" always, and decides nothing. The replacement invariant in
    characteristic 2 is Berlekamp's, which is outside this roadmap.

  *Needs:* the root-product formula above (Layer 3); the parity invariant (Layer 0);
  `Equiv.Perm.sign` (Mathlib).

- **The discriminant quadratic extension, with its API.** Define `F(√disc f)` as the splitting
  field of `X² − C f.discr` over `F`. The API:

  - *Characterization:* for `ringChar F ≠ 2`, it equals `F` when `f.discr` is a square, and is a
    quadratic extension otherwise.
  - *Comparison:* it is the fixed field of the even part of the Galois image.
  - *Functoriality:* it is preserved by an isomorphism of base fields, and it commutes with base
    change along `F → F'` when `f.discr` stays a nonsquare.
  - *Edge cases:* `f.discr = 0`, which the separability hypothesis excludes; `f.discr` a square,
    which gives the trivial extension.
  - *Downstream interface:* the quartic decision table of Layer 4 separates `C₄` from `D₄` over
    this field.

  *Needs:* the discriminant test above (Layer 3); `Polynomial.SplittingField` (Mathlib).

- **Worked instances, as acceptance tests.** For a separable monic quadratic the test is the
  quadratic formula. For `x³ − 3x − 1` the discriminant is `81`, which is a square; for `x³ − 2`
  it is `−108`, which is not. The comparison with `Cubic.discr` checks the two discriminant APIs
  against each other. These are statements about discriminants and about the image lying in the
  alternating group. The step from them to the label `3T1` or `3T2` needs the classification, so
  it is in Layer 6.
  *Needs:* the discriminant test (Layer 3); `Cubic.discr` (Mathlib).

### Layer 4: resolvents

A resolvent converts a constraint on the subgroup into a statement about a factorization. The
root-side meaning and coefficient-side computation are kept distinct throughout.

- **Static resolvent specifications, with their API.** A `ResolventSpec n` is library data,
  written and proved once. It has three fields: a subgroup `H ≤ Equiv.Perm (Fin n)`, an invariant
  `Φ : MvPolynomial (Fin n) ℤ`, and a proof that the stabilizer of `Φ` under
  `MvPolynomial.rename` is exactly `H`. "Exactly" is the point. A containment would not let the
  factorization of the resolvent detect the subgroup. The API:

  - *Constructors:* one for each registered specification, with its stabilizer theorem proved.
  - *Examples:* the `D₄` specification of the quartic and the `F₂₀` specification of the quintic,
    both written out below.
  - *Comparison lemmas:* the orbit of `Φ` has `[Sₙ : H]` elements; the stabilizer of a renamed
    invariant is the conjugate subgroup.
  - *Naturality:* renaming along `σ` sends the specification for `H` to the specification for
    `σ H σ⁻¹`.
  - *Edge cases:* `H = ⊤`, where the orbit is a single element and the resolvent is linear;
    `H = ⊥`, where the orbit has `n!` elements.
  - *The coefficient-side resolvent:* a field `specialize : ℤ[X] → ℚ[X]`, an executable
    function of the coefficients of `f`, together with a theorem that its image in a splitting
    field is the root-side orbit resolvent below. The root product says what the resolvent
    means; `specialize` says how to obtain it.

  Three specifications are registered: the quartic `D₄` invariant, the quintic `F₂₀` invariant,
  and the quintic pair sum. `resolventSextic` is the `specialize` of the second. Each exact
  stabilizer theorem identifies the stabilizer with the reference subgroup of a label, and not
  only with a group of the right order: the quartic invariant with `referenceSubgroup 4 2`, the
  label `4T3`, and the quintic invariant with `referenceSubgroup 5 2`, the label `5T3`.

  *Needs:* `MvPolynomial.rename` (Mathlib); `MulAction.stabilizer` (Mathlib);
  `Subgroup.index` (Mathlib).

- **The orbit resolvent, with its API.** For a specification with invariant `Φ` and a root vector
  `x`, define `galResolvent Φ x := ∏_{Ψ ∈ orbit of Φ} (X − C (Ψ(x)))`, the product over the
  rename-orbit of `Φ`. The API:

  - *Constructor:* the product formula, and the fact that the orbit is finite of size
    `[Sₙ : H]`.
  - *Descent:* evaluated at the roots of a monic `f`, the coefficients are symmetric functions of
    the roots, so the polynomial descends to `F[X]`.
  - *Independence:* the value does not depend on the numbering of the roots, because the product
    is over the whole orbit.
  - *Degree:* the degree is `[Sₙ : H]` provided the values on the orbit stay distinct.
  - *Edge cases:* two orbit values that agree, which is the degenerate case below.
  - *Downstream interfaces:* the quartic and quintic tables below.

  *Needs:* the resolvent specification above (Layer 4); `MvPolynomial.IsSymmetric` and the
  fundamental theorem of symmetric polynomials (Mathlib); the degree bookkeeping (Layer 0).

- **The factorization theorem.** Assume the specialized resolvent is separable. Then the Galois
  action on the orbit of `Φ` agrees with the action on the coset space `Sₙ/H` transported by the
  numbering. The monic irreducible factors of `galResolvent Φ x` then correspond to the orbits of
  the Galois image on `Sₙ/H`, with degrees equal to the sizes of those orbits. Two corollaries
  are used later.

  - The resolvent has a root in `F` if and only if the image is conjugate into `H`.
  - The multiset of factor degrees equals the multiset of orbit sizes.

  - *Source:* Cohen, §6.3.
  - *Hypotheses:* `f` monic and separable, and the specialized resolvent separable.

  *Needs:* the orbit resolvent above (Layer 4); the orbit-to-factor dictionary (Layer 0).

- **The degenerate case, in both directions.** Without the separability hypothesis the two
  implications are not symmetric. State both.

  - If the image is conjugate into `H`, then the specialized resolvent has a root in `F`. This
    direction needs no extra hypothesis.
  - The converse can fail. A root in `F` may come from two distinct cosets whose invariants
    happen to take the same value at the roots of this particular `f`. The converse holds under
    the separation hypothesis, and only then.

  A rational root therefore proves the containment only when separation evidence is present.
  *Needs:* the factorization theorem above (Layer 4).

- **Tschirnhaus transforms, as coefficient-side objects.** When the specialized resolvent is not
  separable, the classical remedy replaces `f` by `f_T`, whose roots are `T(α)` for the roots `α`
  of `f`. Two definitions and three theorems:

  - `tschirnhausPolynomial f T : ℤ[X]`, the transformed polynomial. It is a resultant in two
    variables, so it is a function of the coefficients of `f` and `T` alone.
  - `TschirnhausAdmissible f T`, saying that `T` separates the roots of `f`.
  - Under admissibility: the transform preserves the degree; it preserves separability; the root
    sets correspond; the splitting fields agree up to an `AlgEquiv`; and the Galois images are
    conjugate. The last of these is what carries an upper bound back to `f`.

  If the transform is admissible and the transformed resolvent has full orbit degree and is
  separable, then the subgroup upper bound transports back to `f`.

  - *Not a milestone:* the classical claim that such a transform always exists over an infinite
    field. That claim needs the finitely many bad coincidences to define proper algebraic subsets.

  *Needs:* the orbit resolvent and the degenerate case above (Layer 4).

- **The quartic.** Throughout this item, `ringChar F ≠ 2`.

  - *Depression is valid.* The substitution `X ↦ X − a/4` carries `X⁴ + aX³ + bX² + cX + d` to a
    quartic with no cubic term. It needs `4` invertible in `F`, which follows from
    `ringChar F ≠ 2`. It preserves the splitting field, and it induces a `Gal`-equivariant
    bijection of root sets. Working with `f = X⁴ + pX² + qX + r` is therefore a normalization,
    and not a restriction.
  - *The specification.* The `D₄`-invariant is `x₀x₂ + x₁x₃`. Its stabilizer in
    `Equiv.Perm (Fin 4)` has order 8, and its orbit
    `{x₀x₂+x₁x₃, x₀x₁+x₂x₃, x₀x₃+x₁x₂}` has three elements. The resolvent is therefore a cubic.
  - *The closed form.* `resolventCubic f = X³ − pX² − 4rX + (4pr − q²)`. That this cubic is the
    orbit resolvent of the specification above is a theorem to prove, not a definition.
  - *Discriminants agree.* `f.discr = (resolventCubic f).discr`.
  - *The decision table*, for `f` irreducible and separable. Each row is a named theorem.

    | Resolvent cubic | `f.discr` | Galois group |
    |---|---|---|
    | irreducible over `F` | not a square | `S₄` |
    | irreducible over `F` | a square | `A₄` |
    | splits completely over `F` | a square | `V₄` |
    | exactly one root in `F` | not a square | `C₄` or `D₄` |

    The last row is separated over the field `F(√disc f)` of Layer 3. The group is `C₄` when `f`
    becomes reducible over `F(√disc f)`, and `D₄` when `f` stays irreducible there. Any row that
    needs a characteristic hypothesis beyond `ringChar F ≠ 2` carries it in its own statement.

    Each row names the isomorphism type of the Galois image. The step from that to the label
    `4Tj` needs the classification, so it is in Layer 6.

  *Needs:* the factorization theorem and the resolvent specification (Layer 4); the discriminant
  test and the quadratic extension (Layer 3).

- **The quintic.** Throughout this item, `ringChar F ∉ {2, 5}`. Depression of a quintic needs `5`
  invertible, and the discriminant test needs `2`.

  - *The invariant.* Index `Fin 5` by `ℤ/5` and set
    `Φ = Σ_{a ∈ ℤ/5} x_a² (x_{a+1} x_{a−1} + x_{a+2} x_{a−2})`, which has ten terms of the shape
    `x_a² x_b x_c`. Its stabilizer in `Equiv.Perm (Fin 5)` is exactly the Frobenius group
    `F₂₀ = AGL(1,5)` of order 20, and its `S₅`-orbit has six elements. The orbit resolvent is
    therefore a sextic. Both facts belong to the `ResolventSpec` and are proved. The roadmap
    defines `resolventSextic` as this orbit resolvent, so the definition needs no external table.
    Dummit gives a closed coefficient formula for the classical resolvent sextic of a depressed
    quintic. Evaluation of `resolventSextic` through such a formula is a question of computation.
    This roadmap does not use one.
  - *The criterion.* For an irreducible separable quintic, `IsSolvable f.Gal` holds if and only
    if the image is conjugate into `F₂₀`. Combined with the factorization theorem: under
    separation evidence, `IsSolvable f.Gal` holds if and only if `resolventSextic f` has a root
    in `F`. Both statements are about the image as a subgroup of `S₅`, and neither mentions a
    label. Layer 6 turns them into a statement about `5T1`, `5T2`, and `5T3`.

    - *Hypotheses:* `f` irreducible and separable, `ringChar F ∉ {2,5}`, and separation evidence
      for the specialized sextic.
    - *False generalization:* the criterion is about the group. It is not a statement about
      `solvableByRad`. The implication from a solvable Galois group to a radical expression is
      absent from Mathlib and is not a milestone here.

  *Needs:* the resolvent specification and the factorization theorem (Layer 4).

- **Linear resolvents.** Resolvents from sums and differences of roots are instances of the same
  framework. They are the practical method in degrees up to 7. No separate theory is needed. One
  worked example confirms that the framework composes. For a quintic, the stabilizer of
  `x₀ + x₁` is `S_{{0,1}} × S_{{2,3,4}}` of order 12. The orbit therefore has `120/12 = 10`
  elements, indexed by the ten unordered pairs, and the pair-sum resolvent has degree 10. A
  milestone proves that the symbolic orbit has exactly ten elements.
  *Needs:* the orbit resolvent (Layer 4).

### Layer 5: Frobenius specialization

This layer does **not** prove Dedekind's factorization theorem. Number Field Arithmetic Layer
3.10 owns it, as `exists_gal_fullCycleType_eq_factorizationType`, and §What this roadmap consumes
records the contract. That theorem is ramification theory: its proof needs the ring generated by
the roots, a maximal ideal over `p`, the surjection of a decomposition group onto a residue
Galois group, and the triviality of inertia, and none of those objects appears in this roadmap.

What this layer owns is the polynomial and permutation half: the factor-degree carrier and the
membership statement to which every downstream recognition theorem is applied.

- **`factorDegrees`, with its basic API.** Define `factorDegrees f p` as the multiset of degrees
  of the monic irreducible factors of `f mod p`. This is the object the imported theorem compares
  with a cycle type. The API:

  - *Constructor:* the defining equation, through `UniqueFactorizationMonoid.normalizedFactors`
    over `ZMod p`. This is the mathematical multiset, and it is noncomputable.
  - *Examples:* `factorDegrees (X⁵ − X − 1) 2 = {3, 2}` and
    `factorDegrees (X⁵ − X − 1) 5 = {5}`.
  - *Multiplicity:* the multiset counts each irreducible factor as often as it occurs. The sum
    is `f.natDegree` when `f` is monic and `p` does not divide the leading coefficient.
  - *Comparison lemmas:* `factorDegrees f p = {n}` if and only if `f mod p` is irreducible of
    degree `n`. When `p` does not divide `f.discr`, the reduction is separable, so every
    multiplicity is 1 and the multiset is the set of degrees of the distinct factors.
  - *Edge cases:* `p` divides `f.discr`, where a factor can repeat and no theorem below applies;
    `f` not monic, where the degree can drop.
  - *Downstream interfaces:* the membership statement below and the right-hand side of the
    imported theorem, which is this multiset with the definition unfolded.

  The multiplicity-one comparison lemma is not a step of Dedekind's theorem, and it is not a
  second proof of anything the supplier proves. It is one line from the base change of `discr`
  in Layer 3.

  *Needs:* `UniqueFactorizationMonoid.normalizedFactors` over a finite field (Mathlib);
  `Polynomial.map` along `ℤ → ZMod p` (Mathlib); base change of `discr` and the criterion
  `discr ≠ 0 ↔ Separable`, for the multiplicity-one lemma (Layer 3).

- **Factor degrees are Frobenius orbit sizes.** Let `g` be a squarefree monic polynomial over a
  finite field `𝔽_q`. Let the map `x ↦ x^q` act on the roots of `g` in an algebraic closure. The
  degrees of the monic irreducible factors of `g` are then exactly the sizes of the orbits. This
  is a statement about finite fields only. It uses no Galois theory over `ℚ`, and it is not a
  step of the imported theorem.

  It also supports the finite-field existence steps in Layer 9. Rabin's Frobenius criterion is
  one implementation route, but no certificate carrier or checker is part of this roadmap.

  *Needs:* `FiniteField` and `GaloisField` (Mathlib); the minimal polynomial over a finite field
  (Mathlib).

- **Dedekind's factorization theorem, imported.** Let `f : ℤ[X]` be monic, and let `p` be a prime
  that does not divide `f.discr`. Then some `σ ∈ (f over ℚ).Gal` has a `fullCycleType` on the
  roots equal to `factorDegrees f p`. **This roadmap does not prove that.** It is
  `exists_gal_fullCycleType_eq_factorizationType` of Number Field Arithmetic Layer 3.10, and the
  milestone here is to record that its statement, spelled with the abbreviations of Layers 0 and
  5, is the abbreviated form — a proof with no `sorry`, so that a change on either side of the
  contract fails the build.

  - *Source:* Dedekind; see Cohen, §6.3.2, and van der Waerden, *Algebra* I, §61. The proof is
    the supplier's, and its route is written out there.
  - *Hypotheses:* `f` monic over `ℤ`, `p` prime, and `p ∤ f.discr`. The hypothesis is on the
    discriminant of the polynomial, and not on ramification in the field of a root. In particular
    the supplier's statement covers **reducible** `f`, which is what the irreducibility criterion
    below applies it to.
  - *False generalization:* "`p` unramified in `ℚ[x]/(f)`" is not enough. Dedekind's cubic
    `x³ + x² − 2x + 8` has `disc f = −2012 = −2²·503` and field discriminant `−503`, so the index
    is 2. The prime 2 splits into three distinct primes in the field, but no monic cubic over
    `𝔽₂` has three distinct linear factors, because `𝔽₂` has only two elements. So the
    factorization type of `f mod 2` cannot describe the splitting of 2, for any generator. The
    hypothesis `p ∤ f.discr` excludes 2 here, because `2 ∣ 2012`.

  *Needs:* `exists_gal_fullCycleType_eq_factorizationType`
  (R *Number Field Arithmetic*, Layer 3.10); `fullCycleType` (Layer 0);
  `factorDegrees` (Layer 5).

- **The membership statement.** This is the first theorem of the layer that this roadmap owns.
  The multiset of factor degrees of `f mod p` belongs to the set
  `{ fullCycleType g | g in the Galois image }`. It is the imported theorem with the existential
  read as membership, and it is the form every recognition theorem is applied to; nothing
  downstream of here mentions a prime ideal or a Frobenius element. Consequences, each a named
  theorem, through the recognition theorems of Layer 1:

  - if `f mod p` is irreducible, then the Galois group contains an `n`-cycle, so it acts
    transitively, so `f` is irreducible over `ℚ`. This is the classical criterion for
    irreducibility modulo `p`. It is applied to an `f` not yet known to be irreducible, which is
    why the imported statement has to cover reducible `f`;
  - factorization type `(1,…,1,2)` in prime degree, with transitivity, gives `S_p`;
  - factorization type `(1,…,1,3)` with primitivity gives a group that contains `Aₙ`.

  Recognition that reads a low-degree table is in Layer 6, which is where that table is proved.
  *Needs:* the imported theorem above (Layer 5); the recognition theorems (Layer 1).

- **What factorization types do and do not give.** An exhibited element of order `m` proves that
  `m` divides the order of the group, so factorization types do give lower bounds on the order.
  What they do not give is containment in a proper subgroup: no finite set of factorization types
  certifies `Gal f ≤ H` for a proper `H`, because every one of them is satisfied by the whole
  group as well. Upper bounds come from Layer 3 and Layer 4. The pair `D₅` against `A₅` in the
  worked examples
  below is the standard illustration. The statistics of cycle types are the subject of Chebotarev
  density, which belongs to the Chebotarev roadmap.
  *Needs:* the membership statement above (Layer 5).

### Layer 6: transitive subgroups of `Sₙ` for `n ≤ 5`, and the label predicates

The reference subgroups for these degrees, in cycle notation:

| label | generators | name | order | parity | primitive | solvable |
|---|---|---|---|---|---|---|
| `1T1` | none | trivial | 1 | + | yes | yes |
| `2T1` | `(12)` | `C₂` | 2 | − | yes | yes |
| `3T1` | `(123)` | `C₃` | 3 | + | yes | yes |
| `3T2` | `(13), (12)` | `S₃` | 6 | − | yes | yes |
| `4T1` | `(1234)` | `C₄` | 4 | − | no | yes |
| `4T2` | `(12)(34), (14)(23)` | `V₄` | 4 | + | no | yes |
| `4T3` | `(1234), (13)` | `D₄` | 8 | − | no | yes |
| `4T4` | `(234), (134)` | `A₄` | 12 | + | yes | yes |
| `4T5` | `(1234), (12)` | `S₄` | 24 | − | yes | yes |
| `5T1` | `(12345)` | `C₅` | 5 | + | yes | yes |
| `5T2` | `(12345), (14)(23)` | `D₅` | 10 | + | yes | yes |
| `5T3` | `(12345), (1243)` | `F₂₀` | 20 | − | yes | yes |
| `5T4` | `(123), (345)` | `A₅` | 60 | + | yes | no |
| `5T5` | `(12), (12345)` | `S₅` | 120 | − | yes | no |

These rows specify the proved representatives for degrees at most five. Their implementation is
ordinary theorem-backed library data; this roadmap stores no raw LMFDB export or larger table.

In Lean these entries are `referenceSubgroup n j`, for `j : TransitiveGroupIndex n`. The
function `numTransitiveGroups` takes the values `1, 1, 2, 5, 5` in degrees 1 to 5. Index `j`
displays as `nT(j+1)`.

- **The label API.** The four definitions `numTransitiveGroups`, `TransitiveGroupIndex`,
  `referenceSubgroup`, and `TransitiveGroupLabel` are in the conventions above. Their API:

  - *Constructors:* one theorem-backed `referenceSubgroup` for each row of the table.
  - *Examples:* every row of the table above, as a theorem that identifies the reference subgroup
    with a familiar group. For instance `referenceSubgroup 4 2 ≃* DihedralGroup 4`, which is
    the label `4T3` and the group of order 8. The index is one less than the number in the
    label, and `DihedralGroup n` has order `2n`.
  - *Basic properties:* each reference subgroup is transitive. This is proved once, so the label
    predicate needs no transitivity clause.
  - *Comparison lemmas:* `TransitiveGroupLabel j G` implies that `G` and `referenceSubgroup n j`
    have equal order, equal parity, equal primitivity, and equal solvability. Each invariant of
    the table above is a theorem.
  - *Naturality:* `TransitiveGroupLabel` is invariant under conjugation of `G`, and under
    transport along an equivalence `Fin n ≃ Fin n`.
  - *Edge cases:* `n = 0` and `n = 1`, where `numTransitiveGroups` is `0` and `1`; an index out of
    range, which the type `Fin` makes impossible.
  - *Downstream interfaces:* `HasGaloisLabel` below and any display layer that reports the proved
    low-degree LMFDB labels.

  *Needs:* `Equiv.Perm` and `Subgroup.map` with `MulAut.conj` (Mathlib); `MulAction.IsPretransitive`
  (Mathlib).

- **`HasGaloisLabel`, with its API.** For a separable `f` of degree `n`, `HasGaloisLabel f j` says
  that some equivalence `e : f.rootSet f.SplittingField ≃ Fin n` carries the Galois image to a
  subgroup with label `j`. The API:

  - *Independence of the numbering:* if one equivalence `e` exhibits the label, then every
    equivalence does. This makes the predicate a statement about `f`.
  - *Comparison lemmas:* `HasGaloisLabel f j` implies
    `Nat.card f.Gal = Nat.card (referenceSubgroup n j)`. It also gives the parity, the
    primitivity, and the solvability of `f.Gal`.
  - *Edge cases:* `f` inseparable, and `f` of the wrong degree. In both cases the predicate is
    false for every `j`, which is the intended behaviour.
  - *Downstream interfaces:* the worked examples below are instances.

  *Needs:* the label API above (Layer 6); the degree bookkeeping and the invariants (Layer 0).

- **The classification theorems.** For each `n ≤ 5`, every transitive subgroup of
  `Equiv.Perm (Fin n)` is conjugate to exactly one `referenceSubgroup n j`. The statement splits
  into existence, which conjugates an arbitrary transitive subgroup onto a reference, and
  disjointness, which shows that no two references are conjugate.

  - *Source:* Dixon and Mortimer, §2.

  The route in each degree is a chain of named theorems.

  *Degrees 2 and 3.* A transitive subgroup of `S₂` is `S₂`. A transitive subgroup of `S₃` has
  order divisible by 3, so it is `A₃` or `S₃`.

  *Degree 4.* A transitive subgroup has order divisible by 4, so its order is 4, 8, 12, or 24.
  Order 24 is `S₄` and order 12 is `A₄`, because `A₄` is the only subgroup of index 2. Order 8 is
  a Sylow 2-subgroup, and all of those are conjugate, so it is `D₄`. At order 4 the subgroup acts
  regularly, so it is `C₄` or `V₄`, and `IsCyclic` separates the two. Each order-4 case is a
  single conjugacy class.

  *Degree 5.* Let `G ≤ S₅` be transitive, so `5` divides `|G|`, and let `P` be a Sylow
  5-subgroup, of order 5.

  1. The number of Sylow 5-subgroups is 1 or 6, by Sylow's theorem and `|S₅| = 120`.
  2. If it is 1, then `P` is normal in `G`, so `G ≤ N_{S₅}(P) = AGL(1,5) = F₂₀`. The transitive
     subgroups of `F₂₀` that contain `P` are `C₅`, `D₅`, and `F₂₀`, one for each subgroup of the
     cyclic group `F₂₀/P` of order 4.
  3. If it is 6, then `6` divides `|G|`, so `30` divides `|G|`.
  4. `S₅` has no subgroup of order 30. Such a subgroup has index 4, so it gives a morphism
     `S₅ → S₄` whose kernel has order 5. The normal subgroups of `S₅` are `1`, `A₅`, and `S₅`,
     and none has order 5.
  5. So `|G|` is 60 or 120. A subgroup of order 60 has index 2 and is therefore `A₅`, and order
     120 is `S₅`.

  Every step is a separate theorem, and steps 1 and 4 are where the Sylow API is used.
  *Needs:* the recognition theorems and the block analysis (Layer 1); the label API (Layer 6);
  `Sylow` with `exists_prime_orderOf_dvd_card` (Mathlib); `Subgroup.index` and the
  index-2-is-normal lemma (Mathlib); `alternatingGroup.isSimpleGroup` (Mathlib).

- **Order recognizes the label in low degree.** For `n = 5`, a transitive subgroup has order in
  `{5, 10, 20, 60, 120}`, and the order determines the label. For `n = 4`, the order determines
  the label except at order 4. For `n = 3`, the order determines the label.

  - *Hypotheses:* the subgroup is transitive.
  - *False generalization:* order alone is not enough in degree 4. Both `4T1 = C₄` and
    `4T2 = V₄` are transitive of order 4, and they are not conjugate. `IsCyclic` separates them.

  *Needs:* the classification theorems above (Layer 6).

- **Recognition by order in degree 5.** A transitive `G ≤ S₅` that contains an element of order 6
  is `S₅`. A transitive `G ≤ S₅` of even parity that contains an element of order 3 contains
  `A₅`. These read the table above, which is why they are here and not in Layer 1.
  *Needs:* the classification in degree 5 (Layer 6).

- **Solvability and the labels in degree 5.** An irreducible quintic has `IsSolvable f.Gal` if and
  only if its label is `5T1`, `5T2`, or `5T3`. This turns the group criterion of Layer 4 into a
  statement about labels. The statement is about the group. It is not a statement about
  `solvableByRad`.
  *Needs:* the classification in degree 5 (Layer 6); the sextic criterion (Layer 4);
  `IsSolvable` (Mathlib).

- **The decision procedures, integrated.** This is where the generic theory of Layers 3, 4, and 5
  becomes a label. Each is a named theorem that ends in `HasGaloisLabel f j`.

  - *Degree 3.* An irreducible separable cubic over `F` with `ringChar F ≠ 2` has label `3T1` if
    `f.discr` is a square, and `3T2` if it is not.
  - *Degree 4.* An irreducible separable quartic with `ringChar F ≠ 2` has a label read off the
    decision table of Layer 4: `4T5`, `4T4`, `4T2`, or, in the last row, `4T1` or `4T3` according
    to whether `f` becomes reducible over `F(√disc f)`.
  - *Degree 5.* An irreducible separable quintic with `ringChar F ∉ {2,5}` has a label determined
    by the discriminant, a rational root of the sextic resolvent under separation evidence, and
    the factorization types of Layer 5, through the order-recognition theorems above.

  *Needs:* the classification and order recognition above (Layer 6); the discriminant test and
  the quadratic extension (Layer 3); the quartic and quintic resolvents (Layer 4); the
  membership statement (Layer 5).

### Layer 9: `Sₙ` as a Galois group over `ℚ`
- **The full-symmetric predicate.** `HasFullSymmetricGaloisGroup f` says that `f` is separable
  and that `galActionHom f f.SplittingField` is surjective. Separability is part of the
  predicate.

  - *False generalization:* bijectivity of `galActionHom` alone does not say that the Galois
    group is `Sₙ` in degree `n`. The polynomial `X ^ n` has one distinct root, a trivial Galois
    group, and a bijection from that group onto the permutations of a one-point set. A regression
    test states that `X ^ n` does not satisfy the predicate.

  *Needs:* `galActionHom` with `galActionHom_injective` (Mathlib); the degree bookkeeping
  (Layer 0).

- **The theorem.** For every `n ≥ 1` there is an explicit monic `f : ℤ[X]` of degree `n`,
  irreducible over `ℚ`, whose Galois action on the roots is the full symmetric group.

  - *Source:* van der Waerden, *Algebra* I, §61; Serre, *Topics in Galois Theory*, 2nd edition,
    §4.4.
  - *Construction:* choose reductions at 2, 3, and 5 with prescribed factorization patterns, and
    reassemble the coefficients by the Chinese remainder theorem.

  "Choose a suitable polynomial" is not an instruction that an implementation agent can follow.
  The prerequisites are therefore milestones, in order of dependence.

  1. For every `d ≥ 1`, a monic irreducible polynomial of degree `d` over `ZMod 2`.
     *Needs:* `GaloisField` and the existence of irreducible polynomials of each degree over a
     finite field (Mathlib).
  2. For each `n` in range, a squarefree monic polynomial over `ZMod 3` with factor degrees
     `(1, n−1)`. Small `n` is handled separately.
     *Needs:* milestone 1 (Layer 9).
  3. For each `n` in range, a squarefree monic polynomial over `ZMod 5` with exactly one
     quadratic factor and all other factor degrees odd. Small `n` is handled separately.
     *Needs:* milestone 1 (Layer 9).
  4. A coefficientwise Chinese remainder theorem. Prescribed monic reductions at 2, 3, and 5 are
     realized by one monic integral polynomial of the same degree.
     *Needs:* `ZMod.chineseRemainder` (Mathlib).
  5. Base change of the discriminant, and squarefreeness of each of the three reductions. These
     prove that 2, 3, and 5 do not divide `disc f`, so all three are admissible primes for
     Layer 5.
     *Needs:* base change of `discr` (Layer 3); milestones 1 to 4 (Layer 9).
  6. The criterion for irreducibility modulo 2, which gives irreducibility of `f` over `ℚ`.
     *Needs:* the membership statement (Layer 5).
  7. Four group-theoretic steps, all from Layer 1:
     - an `n`-cycle gives transitivity;
     - a transitive group that contains an `(n−1)`-cycle is 2-transitive, and therefore
       primitive;
     - an element with exactly one cycle of length 2, and all other cycles of odd length, has an
       odd power that is a transposition;
     - a primitive subgroup that contains a transposition is `Sₙ`.

     *Needs:* the recognition theorems (Layer 1).
  8. Separate arguments for `n = 1`, and for any other value that the three patterns do not cover
     uniformly.

  This layer needs Layer 1 and Layer 5 only. It does not need Layer 6.

- **The alternating examples, as an exact list.** Three polynomials with proved labels:
  `x³ − 3x − 1` for `3T1`, `x⁴ + 8x + 12` for `4T4`, and `x⁵ + 20x − 16` for `5T4`. Each has
  square discriminant and the alternating label. That list is the whole deliverable; the roadmap
  makes no claim for degrees 6 to 11, and it does not carry a manifest for them. The realization
  of `Aₙ` over `ℚ` for general `n` is outside this roadmap, as the scope section records.
  *Needs:* the discriminant test (Layer 3); the classification (Layer 6).

## Worked examples, as acceptance tests

Each polynomial below was checked with PARI, through `polgalois` and `nfdisc`, and against the
LMFDB field pages. Each one tests a specific layer.

- **Degree 3, for Layer 3.** `x³ − 3x − 1` has discriminant `81 = 9²` and group `C₃ = 3T1`. The
  LMFDB field is `3.3.81.1`, the cyclic cubic of conductor 9. `x³ − 2` has discriminant `−108`
  and group `S₃ = 3T2`, with field `3.1.108.1`. For an irreducible cubic the discriminant test
  decides by itself.
- **Degree 4, for Layers 4 and 6.** The five quartic labels, and every row of the decision table:

  | polynomial | resolvent cubic | discriminant | label | LMFDB field |
  |---|---|---|---|---|
  | `x⁴ + x + 1` | `X³ − 4X − 1`, irreducible | `229`, not a square | `S₄ = 4T5` | `4.0.229.1` |
  | `x⁴ + 8x + 12` | `X³ − 48X − 64`, irreducible | `331776 = 576²` | `A₄ = 4T4` | `4.0.5184.1` |
  | `x⁴ − 2` | one rational root | not a square | `D₄ = 4T3` | `4.2.2048.1` |
  | `x⁴ + 1` | splits completely | a square | `V₄ = 4T2` | `4.0.256.1` |
  | `x⁴ + x³ + x² + x + 1` | one rational root | a square | `C₄ = 4T1` | `4.0.125.1` |

  The field for `x⁴ + 1` is `ℚ(ζ₈)`, and the field for `x⁴ + x³ + x² + x + 1` is `ℚ(ζ₅)`. The
  second is identified through `galCyclotomicEquivUnitsZMod`, which gives `(ZMod 5)ˣ`. The
  polynomial `x⁴ + 1` also carries a test for Layer 5 read in the other direction. Its group `V₄`
  contains no 4-cycle, so `x⁴ + 1` is reducible modulo every prime.
- **Degree 5, for Layers 4 to 6.**
  - `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1` defines `ℚ(ζ₁₁)⁺` and gives `C₅ = 5T1`. The field is
    `5.5.14641.1`, of discriminant `11⁴`.
  - `x⁵ − 5x − 12` gives `D₅ = 5T2`, with field `5.1.1000000.1` and polynomial discriminant
    `8000²`. This example shows why upper bounds need more than factorization types. A 5-cycle
    and an element of type `(1,2,2)` occur. Every factorization type of this `f` at a prime that
    does not divide the discriminant is a cycle type of `D₅ ⊂ A₅`, so no prime excludes `A₅`. The
    proof uses the square discriminant, which excludes `S₅` and `F₂₀`, together with a rational
    root of the sextic resolvent, which excludes `A₅`. The order then gives `5T2`.
  - `x⁵ − 2` gives `F₂₀ = 5T3`, with field `5.1.50000.1`. This is the Kummer example. Its Galois
    group is solvable, the sextic resolvent has a rational root, and the discriminant `50000` is
    not a square.
  - `x⁵ + 20x − 16` gives `A₅ = 5T4`, with field `5.1.1000000.2`. The discriminant `32000²` is a
    square. A prime with factorization type `(1,1,3)`, together with primitivity, which is
    automatic in prime degree, gives a group that contains `A₅`. The square discriminant then
    bounds it above by `A₅`. This field has the same discriminant `10⁶` as the `D₅` example. The
    pair shows that the label is not a function of `(n, r₁, |disc|)`.
  - `x⁵ − x − 1` gives `S₅ = 5T5`, with field `5.1.2869.1` and discriminant `2869 = 19·151`.
    Modulo 2 the factorization is `(x² + x + 1)(x³ + x² + 1)`, which exhibits an element of
    order 6. Modulo 5 the polynomial is `x⁵ − x − 1`, which is Artin-Schreier and therefore
    irreducible; that exhibits a 5-cycle and proves irreducibility over `ℚ`. A transitive group
    with an element of order 6 is `S₅`, by the recognition theorems; no discriminant computation
    is needed.
- **The generic instance, for Layer 5.** A quintic that is irreducible modulo one good prime and
  has factor type `(1,1,1,2)` modulo another has group `S₅`.
- **Non-examples.** These test that the definitions exclude what they should.
  - `x⁴` and `(x² − 2)²` are not separable. No claim about permutations is made for them. In
    particular they do not satisfy the full-symmetric predicate of Layer 9.
  - `(x² − 2)²` is also the example that shows why transitivity gives irreducibility only under
    separability. Its Galois group acts transitively on its two distinct roots, and it is not
    irreducible.
  - `(x² − 2)(x² − 3)` is separable and reducible, with `Gal ≅ V₄` acting with two orbits of
    size 2. `TransitiveGroupLabel` does not apply to it.
  - `x⁵ + x + 1 = (x² + x + 1)(x³ − x² + 1)` is a reducible quintic. It is a regression test that
    no `5Tj` label is assigned to it.

## Order of work

The layer numbering is a topological order. No layer depends on a later one.

| Layer | Depends on | Content |
|---|---|---|
| 0 | Mathlib | the root action, the orbit-to-factor dictionary, and the intrinsic invariants |
| 1 | Mathlib | permutation groups: blocks, wreath products, imprimitivity, and the generic recognition theorems |
| 2 | 0, 1 | the field and permutation dictionary |
| 3 | 0 | discriminants and the alternating group |
| 4 | 0, 3 | resolvents, and the quartic and quintic specifications |
| 5 | 0, 1, 3, and Number Field Arithmetic 3.10 | the factorization-degree carrier, the finite-field orbit lemma, and the membership statement derived from the imported theorem |
| 6 | 1, 2, 3, 4, 5 | the classification for `n ≤ 5`, the label predicates, and the decision procedures |
| 9 | 1, 5 | `Sₙ` as a Galois group over `ℚ` |

Layers 0 and 1 have no dependency inside the roadmap, so they can start at once and run in
parallel. Layer 9 needs only Layers 1 and 5, so it can be done before Layer 6.

Layer 5 is the only layer with a dependency outside the roadmap, and it is one declaration.
This roadmap therefore follows Number Field Arithmetic in the merge order. Layers 0 to 4 and 6
can be implemented before that supplier lands; only the membership statement of Layer 5 and its
consumer in Layer 9 wait on it.

Two rules keep the graph acyclic, and both are worth stating because the natural way to write
this material breaks them. Any theorem whose proof reads the table of Layer 6 belongs to Layer 6,
even when its statement mentions only permutations. Any theorem that concludes `HasGaloisLabel`
belongs to Layer 6 or later, even when the mathematics behind it is in Layer 3 or Layer 4.

Three deliverables are worth early attention. Other work depends on their shape rather than on
their proofs.

- The membership statement of Layer 5, whose shape is fixed by the supplied theorem and can be
  written down before that theorem is proved.
- The tables in degree at most 5, in Layer 6.

## Related roadmaps

This roadmap serves the LMFDB section `galois_groups`.

- The [Number Field Arithmetic](../NumberFieldArithmetic/README.md) roadmap owns Dedekind's
  factorization theorem and the ramification theory behind it. This is the one upstream
  relation, it is a single declaration, and §What this roadmap consumes is the contract. That
  roadmap merges first.
- Computational certificate storage or search requested by downstream projects belongs in a
  dedicated computational repository such as Hex. The generic quintic recognition theorem here
  remains available as a mathematical API.
- The [representation theory](../RepresentationTheory/README.md) roadmaps own data about abstract
  groups, such as character tables. This roadmap owns only permutation data.
- Density of the cycle types is the subject of Chebotarev's theorem, which belongs to the
  L-functions roadmap. No milestone here uses it.

## References

No milestone rests on a source that was not inspected. Where a classical book is the traditional
citation but was not available for this pass, the entry says how the milestone is grounded
instead.

- A. Hulpke, *Constructing transitive permutation groups*, J. Symbolic Comput. 39 (2005) 1-30.
  In the project's `references/`. The inflation and base-group method of §3 is the construction
  behind the iterated chain of imprimitivity in Layer 1.
- J. D. Dixon and B. Mortimer, *Permutation Groups*, GTM 163, Springer, 1996. The traditional
  source for Layer 1, with blocks and imprimitivity in §1.5, wreath products in §2.6, and
  Jordan's theorems in §7.4. It is also the source for the tables in low degree in Appendix B.
  *Not inspected for this pass.* The milestones that depend on it are grounded in two other
  ways. Mathlib's `GroupAction/Blocks.lean`, `Primitive.lean`, and `Jordan.lean` state this
  material in the vocabulary used here. Layers 1 and 6 write out the proof routes.
- H. Wielandt, *Finite Permutation Groups*, Academic Press, 1964. The original source for the
  material of Layer 1. Mathlib's `Blocks.lean` and `Jordan.lean` cite it. Theorems 7.5 and 13.9
  are the two statements used here by number. *Not inspected for this pass.* Theorem 13.9 is
  grounded in Mathlib's `proof_wanted` for it, and Theorem 7.5 in the lattice statement written
  out in Layer 1.
- LMFDB, *Galois group labels* and the `gps_transitive` table,
  <https://www.lmfdb.org/GaloisGroup/>. The source of the reference generators and of the label
  semantics, under the discipline recorded in the conventions. The table in degree at most 5 was
  checked against it.
- G. Butler and J. McKay, *The transitive groups of degree up to eleven*, Comm. Algebra 11 (1983)
  863-911. The origin of the `T` numbering used for the low-degree table. *Not inspected for
  this pass.* The low-degree entries were compared with the LMFDB.
- J. H. Conway, A. Hulpke, and J. McKay, *On transitive permutation groups*, LMS J. Comput. Math.
  1 (1998) 1-8. Names and properties in degrees up to 15, which is the name column of the LMFDB.
  Context only. This roadmap does not own names of abstract groups.
- B. L. van der Waerden, *Algebra* I, §61, and J.-P. Serre, *Topics in Galois Theory*, 2nd
  edition, A K Peters, 2008, §4.4. The three-prime construction of Layer 9. *Not inspected for
  this pass.* Layer 9 lists all eight prerequisites, so the construction is grounded in this
  document. Sections 3 and 4.5 of Serre, on thin sets, Hilbert irreducibility, and the
  realization of `Aₙ`, describe material that this roadmap places outside its scope.
- H. Cohen, *A Course in Computational Algebraic Number Theory*, GTM 138, Springer, 1993, §6.3.
  The resolvent method and the decision trees in degrees up to 7. *Not inspected for this pass.*
  The dependent milestones are written out in Layer 4, with their proof routes. §6.3.2 is the
  traditional citation for Dedekind's theorem, which this roadmap does not prove; its source
  entry belongs to the supplier.
- D. S. Dummit, *Solving solvable quintics*, Math. Comp. 57 (1991) 387-401. The closed
  coefficient formula for the resolvent sextic. *Not inspected for this pass*, and no milestone
  depends on it. Layer 4 defines `resolventSextic` as the orbit resolvent of an invariant that is
  written out in full.
- L. Soicher and J. McKay, *Computing Galois groups over the rationals*, J. Number Theory 20
  (1985) 273-281. Linear resolvents. Context for Layer 4.
- R. P. Stauduhar, *The determination of Galois groups*, Math. Comp. 27 (1973) 981-996, and
  K. Geissler and J. Klüners, *Galois group computation for rational polynomials*, J. Symbolic
  Comput. 30 (2000) 653-674. Context for exact resolvent methods; no computational certificate
  interface is owned here.
- E. R. Berlekamp, *An analog of the discriminant over fields of characteristic two*, J. Algebra
  38 (1976) 315-317. Cited only to name what the exclusion of characteristic 2 excludes.

Provenance of the data, comparisons with related repositories, and licensing are maintained in
a private provenance ledger. That ledger is not part of the specification.
