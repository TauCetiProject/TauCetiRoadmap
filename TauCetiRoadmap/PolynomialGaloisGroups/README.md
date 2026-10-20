# Roadmap: Galois groups of polynomials

Mathlib has the Galois group of a polynomial. `Polynomial.Gal p` is a plain semireducible `def` for the automorphism group of
the splitting field of `p`; Mathlib derives its group, finite, and related instances. When
comparing subgroups or unfolding their carrier, name the ambient `E ≃ₐ[F] E` explicitly. It acts faithfully on the roots, and the action is transitive when
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
it and states it in `Polynomial.Gal` vocabulary. The factorization layers consume that declaration.
Separately, the worked number-field example consumes the named splitting-field number-field
instance from Number Field Arithmetic Layer 3.8, the Gassmann fixed-field contract from Layer 8.4,
and both the generic subgroup transports in Induction–Restriction Layer 2.1 and the finite
almost-conjugate pair from Layer 2.2.
This roadmap proves the polynomial and permutation consequences: which cycle types a factorization exhibits,
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
- **The characteristic-zero radical criterion.** For every finite Galois extension `E/F` with
  `CharZero F`, the Galois group is solvable exactly when the image of every element of `E` lies
  in the radical closure of an algebraic closure of `F`. Layer 10 states this with a chosen
  embedding and gives the polynomial consequences. The ambient algebraic closure is essential;
  this does not assert that the radical tower lies inside `E`.

The following subjects are outside this roadmap. They are not later milestones of it.

- Hilbert irreducibility, thin sets, and specialization from `ℚ(t)` to `ℚ`.
- The realization of `Aₙ` over `ℚ` for general `n`. Serre derives it from Hilbert
  irreducibility.
- Completeness of the classification of transitive subgroups in degrees 6 to 11.
- Stored database exports, precomputed transitive-group tables, and stored collections of
  Galois-group certificates. Those may be appropriate for a computational database such as Hex,
  but not for this roadmap. The certificate *type* of Layer 6 and its soundness theorem are
  mathematics and are owned here; what is outside is storing certificates, searching for one,
  and any claim that a search succeeds or terminates.
- Chebotarev density.
- Ramification theory of number fields: the different, the relative discriminant ideal,
  decomposition fields, and inertia fields. It is Number Field Arithmetic that owns them, and
  that owns the factorization-type theorem they prove. Layer 5 here holds no Frobenius element,
  no ring of integers and no prime ideal in its factorization-theorem consumer: Layer 5 uses the
  declaration whose statement mentions only `Polynomial.Gal`, a root action, and a factorization over
  `ZMod p`. The separate Layer 9 fixed-field example consumes number-field and representation-theory
  contracts; it does not move their arithmetic or finite-group constructions into this roadmap.
- Data about abstract groups, such as character tables and abstract group names. This roadmap
  owns only the permutation data of `nTj`.
- The replacement for the discriminant test in characteristic 2, which is Berlekamp's
  invariant.

## Suggested home

Two directories, because the two halves have different customers.

- `TauCeti/GroupTheory/Permutation/` holds Layer 1 and the group-theoretic part of Layer 6.
  That is: the block-stabilizer correspondence, wreath products, imprimitivity, the
  recognition theorems, the classification, and the label predicates on subgroups.
- `TauCeti/FieldTheory/GaloisGroups/` holds Layers 0, 2 to 6, and 9 to 10. That is: the polynomial
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

For each exact-declaration prerequisite, the contract section names its supplying roadmap, declaration,
and consumer row. A subject is not itself an exact-declaration prerequisite: "Dedekind's theorem"
is not one; `exists_gal_fullCycleType_eq_factorizationType` is. Distinct milestones may consume
different declarations from the same roadmap, and a milestone may have more than one such supplier.

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

## What this roadmap consumes from arithmetic and representation theory

Dedekind's factorization theorem is a theorem of ramification theory. Its proof needs the ring
generated by the roots, a maximal ideal over `p`, the surjection from a decomposition group onto
a residue Galois group, and the triviality of inertia. That is the subject of the
[Number Field Arithmetic](../NumberFieldArithmetic/README.md) roadmap, which owns those objects
and proves the theorem in the form a polynomial roadmap can use, over a **reducible** `f` and
with the fixed points restored. This roadmap does not prove it a second time.

Layer 5 consumes the factorization-type declaration from Number Field Arithmetic 3.10. Separately,
Layer 9 consumes Number Field Arithmetic's named splitting-field number-field instance from 3.8,
its Gassmann fixed-field declarations from 8.4, and Induction–Restriction 2.2's finite pair. It
also consumes IR 2.1's subgroup transport. The Gassmann subgroup pair is transported along the
`galActionHom` equivalence using IR 2.1's
`Gassmann.almostConjugate_comap` and `Gassmann.not_conj_comap`. These suppliers do not
depend on this roadmap, so the merge graph remains acyclic.

| Consumer here | Supplier layer | Exact declaration | Statement relied on |
|---|---|---|---|
| 5, the membership statement, and through it Layers 6, 8 and 9 | 3.10 | `exists_gal_fullCycleType_eq_factorizationType` | for `f : ℤ[X]` monic and `p` prime with `¬ (p : ℤ) ∣ f.discr`, there is `σ : (f.map (Int.castRingHom ℚ)).Gal` with `(galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).cycleType + Multiset.replicate (Fintype.card (rootSet ℂ) − support.card) 1` equal to `Multiset.map natDegree (normalizedFactors (f.map (Int.castRingHom (ZMod p))))` |
| Layer 9, worked S₁₆ number-field example | Number Field Arithmetic 3.8, 8.4; Induction–Restriction 2.1, 2.2 | `TauCetiRoadmap.NumberFieldArithmetic.numberField_splittingField`; `Gassmann.dedekindZeta_eq_of_almostConjugate_of_one_lt_re`, `Gassmann.dedekindZetaCoeff_eq_of_almostConjugate`, `Gassmann.dedekindZeta_eq_of_almostConjugate`, and `Gassmann.not_algEquiv_fixedFields_of_not_conj` in NFA 8.4; IR `Gassmann.exists_S16_gassmann_pair`, `Gassmann.almostConjugate_comap`, `Gassmann.not_conj_comap` | For the constructed splitting field `E = f.SplittingField`, use separability and splitting to obtain `IsGalois ℚ E` by Mathlib `IsGalois.of_separable_splitting_field`; the named NFA 3.8 instance gives `NumberField E`. Transport the pair to `Gal(E/ℚ)`. The fixed fields have degree `[E^H : ℚ] = [E^K : ℚ] = [Gal(E/ℚ) : H] = [Gal(E/ℚ) : K] = 15!`, by `IntermediateField.finrank_eq_fixingSubgroup_index` and `IntermediateField.fixingSubgroup_fixedField`, `|H| = |K| = 16`, and preservation of subgroup cardinality under the `MulEquiv` preimage. Their ideal-count coefficients and totalized zeta functions agree, and they are not isomorphic over ℚ. |

The names below use two distinct namespaces: arithmetic declarations live in
`TauCetiRoadmap.NumberFieldArithmetic.Gassmann`, while permutation-representation declarations
from the supplier live in `TauCetiRoadmap.RepresentationTheory.InductionRestriction.Gassmann`.
The factorization-type name lives in the namespace `TauCetiRoadmap.NumberFieldArithmetic`, in
`TauCetiRoadmap/NumberFieldArithmetic/Suggested.lean`. The `NumberField` instance, the half-plane comparison target, and its three derived Gassmann
declarations are separate consumer contracts: for a
finite Galois `E/F` and almost-conjugate `H₁,H₂ ≤ Gal(E/F)`, they compare the fixed-field
coefficients and totalized zeta functions, and prove nonisomorphism over `F` when the subgroups
are not conjugate. The IR pair is transported to `Gal(E/F)` with the IR 2.1 equivalence-transport
API; Layer 9 uses these contracts only after identifying that group with `S₁₆`.

## What this roadmap exports to Belyi Maps

The canonical objects are `Equiv.Perm.fullCycleType` and Tau Ceti's
`numTransitiveGroups`, `TransitiveGroupIndex`, `referenceSubgroup`, and
`TransitiveGroupLabel`. This roadmap consumes their native API; it builds no second
cycle multiset, reference-group family, or conjugacy predicate. `Compatibility.lean`
provides the five conservative abbreviations in namespace
`TauCetiRoadmap.PolynomialGaloisGroups` used by Belyi's written and supplier-crossing
contracts. Each abbreviation has a defining equality or iff to the native declaration,
with the same `DecidableEq` argument for `fullCycleType` and the same finite index.
Thus both spellings refer to the same objects, not merely isomorphic carriers.

Layer 1C supplies the pure permutation comparison and classification through degree five;
Layer 6 supplies the polynomial labels and certificates. These cuts also identify the
older Belyi references to this roadmap's transitive-group layers. Branch cycles and
peripheral-power theorems stay in `BelyiMaps` and create no reverse prerequisite here.

The native reference family is empty in degrees greater than five. The aliases preserve
that fact: they do not deliver Belyi's degree-6–11 classification or named-label requests.
Those remain a separate Belyi producer/consumer milestone: extend the canonical native
reference family with proved representatives, completeness, uniqueness and an exact label
comparison before using such indices. A connected degree-six cyclic passport already
exists, so emptiness of `TransitiveGroupIndex 6` cannot be treated as completion of that
milestone. No second `nTj` predicate or unproved database table is introduced here; this
roadmap's own classification boundary remains degree at most five.

The factorization-type row above is an exact contract, not a gesture at a subject.

- The hypothesis is `p ∤ f.discr`, on the discriminant of the **polynomial**, and not on
  ramification in the field of a root. The two differ, and §Layer 5 records the standard
  counterexample.
- The two sides of the supplied equation are, definitionally, `Equiv.Perm.fullCycleType` of the root action
  and `factorDegrees f p`. The local `fullCycleType` spelling is a definitional alias of Tau Ceti's
  declaration; `factorDegrees` is defined in Layer 5. The supplier uses neither local spelling.
  `Suggested.lean` therefore carries a contract check that elaborates the supplied statement
  against the abbreviated one. If either definition drifts, or the supplier's signature changes,
  that check stops elaborating. It inherits the supplier theorem's current proof status, so this
  is not itself a closed mathematical proof. No milestone of this roadmap restates the theorem.

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
| full cycle types | the set of values of `Equiv.Perm.fullCycleType` on `G`, including the fixed-point parts; equivalently, `Equiv.Perm.cycleType` together with the ambient degree |

### Cycle types count fixed points
Mathlib's `Equiv.Perm.cycleType` lists only cycle lengths at least 2. Tau Ceti's native
`Equiv.Perm.fullCycleType` restores fixed points, and its value is

```
Equiv.Perm.fullCycleType σ = σ.cycleType + Multiset.replicate (n - σ.support.card) 1
```

for a permutation of a finite carrier of cardinality `n`. Every comparison below between a
factor-degree multiset and a permutation uses this native full cycle type; a factor-degree multiset
is never compared with a bare `Equiv.Perm.cycleType`. The native definition takes the carrier's
`DecidableEq` instance implicitly. When applying the imported factorization theorem, use that instance and
convert its displayed `cycleType + replicate` expression by the native defining equation. This
roadmap does not define or maintain another full-cycle-type carrier.

### Discriminant

The discriminant is Mathlib's `Polynomial.discr`, in
`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`. It is the resultant of `f` and `f'`,
divided by the leading coefficient and multiplied by a sign. The sign is pinned by that
definition, as `discr f = det (sylvesterDeriv f) · (−1)^(n(n−1)/2)` with `n = natDegree f`,
normalized so that a real polynomial with all roots real has non-negative discriminant. Every
statement below, including the root-product formula and the identity between a quartic and its
resolvent cubic, is written with that sign; no second normalization appears. This roadmap adopts
the definition and builds the missing theory around it, starting with the root-product formula
in Layer 3.

Two readings of the discriminant are kept apart, because they have different hypotheses. The
root-product formula and base change are universal polynomial identities and hold over any
commutative ring. The criterion `discr f ≠ 0 ↔ f.Separable` is a statement about a **field**:
over `ℤ` it is false, and `X² − 1` is the witness, with discriminant `4` and no coprimality
between `X² − 1` and `2X` in `ℤ[X]`. Over a domain the correct statement passes to the fraction
field, and that is the form every use over `ℤ` takes.

The discriminant test `IsSquare (discr f) ↔ Gal f ≤ Aₙ` is **false in characteristic 2**. When
`−1 = 1`, the product `∏_{i<j} (rᵢ − rⱼ)` is symmetric, so its square root is always in the base
field, and the test decides nothing. Every statement of the test carries `ringChar F ≠ 2`.

### The name "resolvent"

In Mathlib, `resolvent` is the resolvent of spectral theory, in
`Mathlib/Algebra/Algebra/Spectrum/Basic.lean`. This roadmap therefore uses the names
`galResolvent` for a general orbit resolvent, `resolventCubic` for the cubic attached to a
quartic, and `resolventSextic` for the sextic attached to a quintic.

### Resolvents: universal data, and specialization

Four conventions, fixed here because an implementor who chooses differently gets a different
object with the same name.

- **The action is on the left, through `MvPolynomial.rename`.** For `σ : Equiv.Perm (Fin n)`,
  `σ · Φ` means `MvPolynomial.rename σ Φ`. Mathlib's `Equiv.Perm` multiplication is
  `(σ * τ) x = σ (τ x)` and `rename` composes the same way, so this is a left action, and
  `stabilizer` below is the stabilizer for it. A right-action reading conjugates every
  stabilizer, which would move the label attached to each invariant.
- **The orbit is a set, and carries no numbering.** The orbit of `Φ` is the set of its distinct
  renamings, and the resolvent is the product of `X − Ψ` over that set. No enumeration of the
  orbit is chosen, and no statement mentions the *i*-th orbit element. What identifies a
  registered invariant is its exact stabilizer, not a position in a list. This is also why the
  degree of an orbit resolvent is `[Sₙ : H]` unconditionally: it is a product over that many
  distinct polynomials, and the values are what can collide.
- **Universal data is integral; specialization is a base change.** An invariant is a
  `MvPolynomial (Fin n) ℤ`, the orbit product is descended to an integral polynomial in the
  elementary symmetric polynomials, and specializing at a polynomial `f` over a ring `R` is
  substitution of the coefficients of `f`. The resolvent over `ℚ` is therefore the image of the
  resolvent over `ℤ`, and the resolvent over `ZMod p` is its reduction. Orbits are always taken
  over `ℤ`, before any base change: over a ring where two integral renamings become equal, the
  orbit computed after the change is smaller and is not the specialization of the universal
  object.
- **Separation is about values, not about polynomials.** Distinct orbit elements are distinct
  polynomials by construction. Whether their *values* at the roots of a particular `f` stay
  distinct is a property of that `f`, called separation evidence below, and the theorems that
  read a subgroup off a resolvent require it.

### Two senses of "solvable"

Two properties are in use. They are never given the same name.

- `IsSolvable f.Gal` is solvability of the Galois group. Every statement below about quintics
  uses this property. This includes the criterion of Layer 4 and the table of Layer 6.
- Solvability by radicals is membership in the intermediate field `solvableByRad F E` of
  `Mathlib/FieldTheory/AbelRuffini.lean`. The predicate `IsSolvableByRad` is deprecated there
  since 2026-02-28.

Mathlib proves the radical-to-group implication as `isSolvable_gal_of_irreducible`: if `q` is
irreducible and some root lies in `solvableByRad F E`, then `IsSolvable q.Gal`. Layer 10 owns the
finite-Galois converse and its polynomial consequences. For every nonzero polynomial in
characteristic zero, the polynomial criterion uses **all** roots in the chosen algebraic closure;
for irreducible polynomials it is equivalent to require **some** root. It is false for reducible
polynomials that one radical root alone should imply solvability of the whole Galois group.

### Names
Tau Ceti supplies `Equiv.Perm.fullCycleType` and its generic transport lemmas; every use of
`fullCycleType` below abbreviates that imported declaration. This roadmap uses the following target spellings, with their native defining equations in
`Suggested.lean`; the five compatibility names above are aliases. They include `factorDegrees`, `IsGoodPrime`,
`numTransitiveGroups`, `TransitiveGroupIndex`, `referenceSubgroup`, `TransitiveGroupLabel`,
`HasGaloisLabel`, `HasFullSymmetricGaloisGroup`, `coordPermAut`, `WreathProduct`, and, for the
resolvent layer, `universalResolvent`, `esymmSubst`, `vietaHom`, `ResolventSpec` with
`ResolventSpec.specialize` and `ResolventSpec.IsGoodPrime`, `IsRootEnumeration`,
`ResolventSeparationEvidence`, `galResolvent`, `resolventCubic`, `resolventSextic`,
`tschirnhausPolynomial`, and `TschirnhausAdmissible`; for the certificates of Layer 6,
`HasFactorDegrees`, `HasSexticRoot`, `HasSecondRootInRootField`, and `QuinticCertificate` with
its `label`, `Verifies` and `check`; and for Layer 10, `RadicalConverse.exists_normal_prime_index_subgroup` and
`RadicalConverse.finiteGalois_iff_image_mem_solvableByRad`; `Suggested.lean` also names
`finiteGalois_solvable_implies_image_mem_solvableByRad`. The helper target has the explicit form
`theorem exists_normal_prime_index_subgroup {G} [Group G] [Finite G] [Nontrivial G]
  (hG : Group.IsSolvable G) : ∃ H : Subgroup G, H.Normal ∧ H.index.Prime`.
`Suggested.lean` fixes forms for selected targets; it is not exhaustive.

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
  irreducible polynomial of prime degree satisfying
  `Fintype.card (p.rootSet ℂ) = Fintype.card (p.rootSet ℝ) + 2` has full Galois group.
- **Root counts.** `Mathlib/FieldTheory/Separable.lean` has `card_rootSet_eq_natDegree`, for a
  separable polynomial that splits.
- **Solvability.** `Mathlib/FieldTheory/AbelRuffini.lean` has the intermediate field
  `solvableByRad`, the closure theorem `solvableByRad.rad_mem`, the root-field theorem
  `isSolvable_gal_minpoly`, the one-way polynomial theorem
  `isSolvable_gal_of_irreducible`, and the family of `gal_*_isSolvable` lemmas.
  `Mathlib/FieldTheory/KummerExtension.lean` has `isCyclic_tfae`; its hypotheses include a
  primitive root of unity of order the extension degree in the base field. The root-of-unity
  API has `AlgebraicClosure.hasEnoughRootsOfUnity`,
  `HasEnoughRootsOfUnity.exists_primitiveRoot`, `IsPrimitiveRoot.pow`,
  `IsPrimitiveRoot.of_map_of_injective`, and `mem_primitiveRoots`.
  `Mathlib/FieldTheory/Normal/Basic.lean` supplies `Normal.of_isSplittingField`;
  `Mathlib/FieldTheory/Galois/Basic.lean` supplies `isGalois_iff`, `IsGalois.card_aut_eq_finrank`,
  `IsGalois.sup_right`, `IsGalois.tower_top_intermediateField`,
  `IsGalois.intermediateFieldEquivSubgroup`, `IsGalois.of_fixedField_normal_subgroup`,
  `IsGalois.normalAutEquivQuotient`, `IntermediateField.subgroupEquivAlgEquiv`, and
  `IntermediateField.restrictRestrictAlgEquivMapHom_injective`.
  `Mathlib/FieldTheory/IntermediateField/Basic.lean` supplies `IntermediateField.restrict`,
  `restrictAlgEquiv`, `restrictScalars`, `lift`, `liftAlgEquiv`, and `lift_restrict`.
  `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` supplies
  `IntermediateField.finiteDimensional_sup`, `IntermediateField.adjoin.finiteDimensional`, and
  `IntermediateField.finrank_eq_one_iff_eq_top`. `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean`
  supplies `lift_adjoin_simple`, `lift_sup`, `lift_top`, `restrictScalars_adjoin_eq_sup`, and
  `adjoin_simple_le_iff`. `Mathlib/LinearAlgebra/Dimension/Free.lean` supplies
  `Module.finrank_mul_finrank`.
  `Mathlib/FieldTheory/SplittingField/IsSplittingField.lean` supplies `IsSplittingField.lift` and
  `IsSplittingField.adjoin_rootSet_eq_range`. `Mathlib/GroupTheory/Solvable.lean` supplies
  `Group.IsSolvable.commutator_lt_top_of_nontrivial`, solvability under subgroups and quotients,
  `IsSimpleGroup.comm_iff_isSolvable`, and `Equiv.Perm.not_isSolvable`.
  `Mathlib/Order/Atoms.lean` provides `Finite.to_isCoatomic`;
  `Mathlib/GroupTheory/Commutator/Basic.lean` has `Subgroup.Normal.of_commutator_le`;
  `Mathlib/GroupTheory/QuotientGroup/Simple.lean` has `Group.isSimpleGroup_of_isCoatom`;
  `Mathlib/GroupTheory/SpecificGroups/Cyclic.lean` has `IsSimpleGroup.prime_card`; and
  `Mathlib/GroupTheory/SpecificGroups/Cyclic/Basic.lean` has `isCyclic_of_prime_card`.
  `Archive/Wiedijk100Theorems/AbelRuffini.lean` shows that
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
- **Symmetric polynomials and Vieta, for Layer 4.**
  `RingTheory/MvPolynomial/Symmetric/Defs.lean` has `MvPolynomial.esymm`, `IsSymmetric`, and the
  symmetric subalgebra. `Symmetric/FundamentalTheorem.lean` has `esymmAlgHom`, with
  `esymmAlgHom_fin_injective` and `esymmAlgHom_fin_bijective`: this is the fundamental theorem of
  symmetric polynomials, and the descent of Layer 4 rests on it and on nothing else.
  `RingTheory/Polynomial/Vieta.lean` has `Polynomial.coeff_eq_esymm_roots_of_card` and
  `coeff_eq_esymm_roots_of_splits`, which are the Vieta step. `MvPolynomial.rename` with its
  functoriality carries the permutation action on invariants.
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

## Material developed beyond Mathlib

The following list describes the boundary beyond the pinned Mathlib. Its permutation and
polynomial declarations use the native Tau Ceti APIs consumed in `Suggested.lean`; the list
is not a claim that those native suppliers are absent. The mathematical obligations are:

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

Layers 1 and 1C are pure permutation theory. Layer 1C precedes the quintic criterion
in Layer 4; Layer 6 is the later polynomial-label and certificate consumer. The complete
prerequisite order is in §Order of work. `Suggested.lean` supplies representative native
interfaces and comparisons, not an archive or whole-programme completion certificate.

### Layer 0: the permutation representation of a polynomial

This layer relates polynomial data to the image subgroup
`(galActionHom p E).range ≤ Equiv.Perm (p.rootSet E)`.

- **Degree bookkeeping.** For separable `p ≠ 0`, the set `p.rootSet p.SplittingField` has
  `p.natDegree` elements. The action of `p.Gal` on it is faithful. Therefore
  `Nat.card p.Gal = Nat.card (galActionHom p p.SplittingField).range`, and every permutation
  invariant of `p.Gal` may be computed in the image.
  *Needs:* `card_rootSet_eq_natDegree` (Mathlib); `galActionHom_injective` (Mathlib);
  `IsSplittingField.splits` (Mathlib).

- **Use of the native full-cycle-type API.** Consume Tau Ceti's `Equiv.Perm.fullCycleType`,
  its identity/sum/count and conjugacy lemmas, and `Equiv.Perm.fullCycleType_permCongr`. Do not
  define or maintain a second full-cycle-type carrier here. Layer 5 compares the native multiset
  with factor degrees, and Layer 6 consumes those comparison results in the low-degree recognition
  theorems. The supplier-application example has no local `sorry` and checks the definitional
  abbreviation conversion; its mathematical content still inherits the current admission of the
  supplied Number Field Arithmetic theorem.

  *Needs:* (Tau Ceti) `Equiv.Perm.fullCycleType` and its native basic API;
  (Mathlib) `Equiv.Perm.cycleType`, the permutation-action APIs, and `Equiv.permCongrHom`.
  Check the native API on `Fin 4`: the identity has `{1,1,1,1}`, a transposition has
  `{2,1,1}`, and a 4-cycle has `{4}`; include the empty-carrier and fixed-point-free cases.

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

- **Transport of the root dictionary across a base-field isomorphism.** For
  `η : F ≃+* F'`, a field extension E/F, integral α∈E and a field extension L/F',
  give L the F-algebra structure `(algebraMap F' L).comp η.toRingHom`.
  Construct the equivalence between `F⟮α⟯ →ₐ[F] L` and the roots in L of
  `(minpoly F α).map η.toRingHom`, by evaluation on the distinguished generator.
  Prove the generator equation, injectivity of each map, its restriction to F,
  and compatibility with composition of target embeddings and base isomorphisms.
  For splitting fields E/F of f and E'/F' of its coefficient transport, construct
  a ring equivalence Φ:E≃+*E' satisfying
  `Φ(algebraMap F E a)=algebraMap F' E' (η a)` for every a. Use the pulled-back
  scalar structure to prove splitting and root generation before applying
  splitting-field uniqueness. Prove maps are determined by all root images;
  no unique or canonical equivalence is asserted without specifying those images.
  *Needs:* `IsAdjoinRoot.liftHom`, `eq_liftHom`,
  `IntermediateField.adjoinRootEquivAdjoin`, polynomial evaluation under coefficient
  maps, and `IsSplittingField.algEquiv` (Mathlib).

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
  Cycle types of elements, through the native `Equiv.Perm.fullCycleType` API. Layers 3 to 5 give
  the tests that compute them.
  *Needs:* `card_of_separable`, `Equiv.Perm.sign`, `alternatingGroup`, `IsSolvable` (Mathlib);
  Tau Ceti `Equiv.Perm.fullCycleType`.

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
    faithfully and primitively but not regularly on `Λ`, when `Λ` has at least three points, and
    when `ι` is finite and nonempty. Without those hypotheses the claim is false, so the
    construction and the primitivity theorem are never stated together. (*Necessity of faithfulness:* Without it, `D = C_p × C₂` acting on
    `Λ = C_p` through the first factor, with `ι = Fin 2`, is primitive and not regular, but the
    product action preserves the partition of `Λ²` into the lines `x − y = c`.)
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
  - *Hypotheses:* the action is transitive and faithful, and `B` is a nontrivial proper block.

  (*Necessity of faithfulness:* The map to the wreath product
  always exists, but it is injective exactly when the action is faithful. `C₃ × C₄` acting on
  four points through `C₄` has a two-point block and order 12, so it does not embed in a wreath
  product of order 8. Without faithfulness, the statement holds for the permutation image.)

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
      contain `A₅`. It is `5T3` in the table of Layer 1C.
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
  Recognition that reads a low-degree table is in Layer 1C, after its pure
  classification, before any resolvent or polynomial-label consumer.

### Layer 1C: pure low-degree reference groups, classification, and solvability

This pure-permutation cut consumes
Layer 1 and native group theory only; it is independent of Layers 0 and 2–6.

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
  4. `S₅` has no subgroup of order 30. Such a subgroup has index 4, so the action on its cosets
     gives a morphism `S₅ → S₄` whose kernel has order at least 5 and lies in the subgroup. The
     normal subgroups of `S₅` are `1`, `A₅`, and `S₅`, and none of them is both. The kernel need not have order exactly 5, since the image need not be all of `S₄`.
  5. So `|G|` is 60 or 120. A subgroup of order 60 has index 2 and is therefore `A₅`, and order
     120 is `S₅`.

  Every step is a separate theorem, and steps 1 and 4 are where the Sylow API is used.
  *Needs:* the recognition theorems and the block analysis (Layer 1); the label API (Layer 1C);
  `Sylow` with `exists_prime_orderOf_dvd_card` (Mathlib); `Subgroup.index` and the
  index-2-is-normal lemma (Mathlib); `alternatingGroup.isSimpleGroup` (Mathlib).

- **Order recognizes the label in low degree.** For `n = 5`, a transitive subgroup has order in
  `{5, 10, 20, 60, 120}`, and the order determines the label. For `n = 4`, the order determines
  the label except at order 4. For `n = 3`, the order determines the label.

  - *Hypotheses:* the subgroup is transitive.
  - *False generalization:* order alone is not enough in degree 4. Both `4T1 = C₄` and
    `4T2 = V₄` are transitive of order 4, and they are not conjugate. `IsCyclic` separates them.

  *Needs:* the classification theorems above (Layer 1C).

- **Recognition by order in degree 5.** A transitive `G ≤ S₅` that contains an element of order 6
  is `S₅`. A transitive `G ≤ S₅` of even parity that contains an element of order 3 contains
  `A₅`. These read the table above, so they follow the classification in this early pure-permutation cut.
  *Needs:* the classification in degree 5 (Layer 1C).

- **Pure degree-five solvability criterion.** For a transitive subgroup
  `G ≤ Equiv.Perm (Fin 5)`, prove `Group.IsSolvable G` iff `G` lies in a conjugate of
  `referenceSubgroup 5 2`. First classify `G` by `exists_transitiveGroupLabel_five`.
  The cyclic, dihedral and Frobenius rows lie in `F₂₀` and are solvable; the `A₅` and
  `S₅` rows are not solvable. Conversely a subgroup of a conjugate of the solvable
  Frobenius group is solvable. This is the native
  `isSolvable_iff_exists_le_map_conj_referenceSubgroup_five_two`, with its explicit
  transitivity instance. It uses no polynomial, resolvent, arithmetic, package or certificate.
  *Needs:* this layer's classification and solvability column, subgroup/conjugation transport
  of `Group.IsSolvable` (Mathlib and Tau Ceti).

**Exact generators.** The six intrinsically defined references `3T2`, `4T2`, `4T4`,
`4T5`, `5T4`, and `5T5` must equal the closures of the displayed permutations, not merely
have the same order or abstract isomorphism type. `PrescribedGenerators.lean` gives the
six explicit comparison proofs on the canonical reference subgroups. The remaining rows
are already defined by their displayed generators. These comparisons precede polynomial
consumers and do not introduce a second group family.

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
  - `f.discr ≠ 0 ↔ f.Separable`, for monic `f` **over a field**, together with the version over
    a domain that passes to the fraction field, `f.discr ≠ 0 ↔ (f.map (algebraMap R K)).Separable`.
    The second is the one every use over `ℤ` takes, including the separability of a reduction in
    Layer 5 and the separation evidence of Layer 6;
  - the ⚠ that pins the field hypothesis: over `ℤ`, `X² − 1` has `discr = 4 ≠ 0` and is not
    `Polynomial.Separable`, since a coprimality witness for `X² − 1` and `2X` would give `2 ∣ 1`
    on evaluating at `1`. The universal polynomial identities above live over any commutative
    ring; the separability reading does not;
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

- **Static resolvent specifications, with their API.** A `ResolventSpec n` is **universal**
  library data, written and proved once. It mentions no polynomial and no coefficient ring. It
  has four fields: a subgroup `H ≤ Equiv.Perm (Fin n)`, an invariant `Φ : MvPolynomial (Fin n) ℤ`
  in the formal roots, a proof that the stabilizer of `Φ` under `MvPolynomial.rename` is exactly
  `H`, and an integral symmetric expression for the orbit product, that is, the universal
  resolvent rewritten in the elementary symmetric polynomials. "Exactly" is the point in the
  third field. A containment would not let the factorization of the resolvent detect the
  subgroup. The fourth field is *determined and not chosen*: the substitution `xᵢ ↦ eᵢ₊₁` is
  injective, so at most one polynomial satisfies its defining equation, and the fundamental
  theorem of symmetric polynomials says one does. The API:

  - *Constructors:* one for each registered specification, with its stabilizer theorem proved.
  - *Examples:* the `D₄` specification of the quartic and the `F₂₀` specification of the quintic,
    both written out below.
  - *Comparison lemmas:* the orbit of `Φ` has `[Sₙ : H]` elements; the stabilizer of a renamed
    invariant is the conjugate subgroup.
  - *Naturality:* renaming along `σ` sends the specification for `H` to the specification for
    `σ H σ⁻¹`.
  - *Edge cases:* `H = ⊤`, where the orbit is a single element and the resolvent is linear;
    `H = ⊥`, where the orbit has `n!` elements.
  - *Uniqueness:* the integral expression for the orbit product is unique, which is what makes
    two implementations of the same specification the same object.

  Three specifications are registered: the quartic `D₄` invariant, the quintic `F₂₀` invariant,
  and the quintic pair sum. Each exact stabilizer theorem identifies the stabilizer with a named
  group and not only with a group of the right order: the quartic invariant with
  `referenceSubgroup 4 2`, the label `4T3`; the quintic `F₂₀` invariant with
  `referenceSubgroup 5 2`, the label `5T3`; and the pair sum with the intransitive
  `S_{{0,1}} × S_{{2,3,4}}` of order 12, which is no label's reference and is pinned by
  generators.

  *Needs:* `MvPolynomial.rename` (Mathlib); `MulAction.stabilizer` (Mathlib);
  `Subgroup.index` (Mathlib); `MvPolynomial.esymm` with `esymmAlgHom_fin_bijective` (Mathlib).

- **The symmetric-polynomial descent, in five milestones.** This is what makes a coefficient-side
  resolvent exist. Galois invariance alone does **not** put the coefficients of the orbit product
  in the base field, and without these five steps "compute the coefficient-side resolvent" would
  hide the algebra behind a choice of splitting field. Each step is a named theorem.

  1. *Invariance.* The universal resolvent `∏_{Ψ ∈ orbit of Φ} (X − Ψ)`, a polynomial over
     `MvPolynomial (Fin n) ℤ`, is fixed by renaming along every `σ ∈ Sₙ`, because renaming
     permutes the orbit.
  2. *Symmetry of the coefficients.* Coefficientwise, each coefficient is a symmetric polynomial
     in the formal roots.
  3. *The fundamental theorem of symmetric polynomials.* Each coefficient is an **integral**
     polynomial in the elementary symmetric polynomials, and in exactly one way. In Mathlib this
     is `MvPolynomial.esymmAlgHom_fin_bijective`, with `esymmAlgHom_fin_injective` for the
     uniqueness half. Integrality of the coefficient side comes from here and from nowhere else.
  4. *Vieta.* For a monic `g` of degree `n` over a domain, listed with multiplicity by
     `x : Fin n → L`, the `(k+1)`-st elementary symmetric polynomial at `x` is
     `(−1)^(k+1) · g.coeff (n − (k+1))`. This is the milestone that uses monicity and the degree,
     and it is why every theorem that reads `specialize` as a resolvent carries them.
  5. *Agreement.* In a field where `f` splits, the specialization maps to the root-side orbit
     product at any root enumeration.

  *Needs:* `MvPolynomial.IsSymmetric`, `MvPolynomial.esymm`, `esymmAlgHom_fin_bijective`
  (Mathlib); `Polynomial.coeff_eq_esymm_roots_of_card` (Mathlib); the resolvent specification
  above (Layer 4); the degree bookkeeping (Layer 0).

- **Specialization at a polynomial, over any coefficient ring.** `ResolventSpec.specialize R f`
  substitutes the coefficients of `f` for the elementary symmetric polynomials in the integral
  orbit product. It is not a field of the specification: the same universal invariant serves
  every polynomial and every coefficient ring. The API:

  - *Base change.* `(specialize R f).map φ = specialize S (f.map φ)` for every ring morphism
    `φ : R →+* S`. This needs no hypothesis on `f`: `specialize` reads coefficients, and
    `Polynomial.map` commutes with that. The hypotheses live in the interpretation, not here.
  - *Coefficient integrality.* The case `ℤ → ℚ` of base change: the resolvent of an integral
    polynomial over `ℚ` is the image of an integral one. `resolventSextic f` is therefore a monic
    polynomial over `ℤ`, and by the rational root theorem any rational root of it is an integer.
  - *Reduction.* The case `ℤ → ZMod p` of base change. ⚠ The identity is unconditional; reading
    the reduced resolvent as a resolvent of the reduced polynomial is not. That needs `p` good
    for `f` **and** good for the specialized resolvent, which is an independent condition; Layer
    5 names it.
  - *Degree and monicity.* `specialize R f` is monic of degree `[Sₙ : H]`, over every nonzero
    ring and for every `f`, because it is the image of a monic polynomial of that degree.
    **Degree is therefore never what a specialization destroys**, and no theorem below takes the
    full orbit degree as a hypothesis.
  - *Closed forms.* That the resolvent cubic below is `specialize` of the quartic specification
    at a depressed quartic is a theorem about the universal object, not a definition.
  - *Downstream interfaces:* the quartic and quintic tables below, and the certificates of
    Layer 6.

  *Needs:* the descent above (Layer 4); `Polynomial.map` and `Polynomial.Monic.map` (Mathlib).

- **The orbit resolvent, with its API.** For a specification with invariant `Φ` and a root vector
  `x`, define `galResolvent Φ x := ∏_{Ψ ∈ orbit of Φ} (X − C (Ψ(x)))`, the product over the
  rename-orbit of `Φ` taken **in `MvPolynomial (Fin n) ℤ`**, with each `Ψ` evaluated at `x`. The
  API:

  - *Constructor:* the product formula, and the fact that the orbit is finite of size `[Sₙ : H]`.
  - *Degree:* the degree is `[Sₙ : H]`, unconditionally. It is a product of that many monic
    linear factors, whatever the values do.
  - *Independence:* the value does not depend on the numbering of the roots, because the product
    is over the whole orbit.
  - *Comparison:* it is the image of the universal resolvent under evaluation at `x`, and for a
    root enumeration of a monic `f` it is the image of `specialize`.
  - *Edge cases:* two orbit values that agree. This is where a specialization degenerates, and it
    is the degenerate case below; it costs separability, never degree.
  - *Downstream interfaces:* the quartic and quintic tables below.

  ⚠ The orbit is taken over `ℤ` and the values are the images of those integral polynomials.
  Taking the orbit after mapping the coefficients into the base ring would be a different
  object: over a ring where two integral renamings of `Φ` become equal, that orbit is smaller,
  and the product over it is not the specialization of the universal resolvent.

  *Needs:* the resolvent specification and the descent above (Layer 4); the degree bookkeeping
  (Layer 0).

- **The root data that a resolvent statement assumes.** A root enumeration `x : Fin n → L` of `f`
  is a listing of the roots with multiplicity. Two milestones make its content explicit, because
  both are quietly assumed wherever roots are indexed by a finite set.

  - Splitting: if `f.natDegree = n` and `x` enumerates the roots, then `f` splits in `L`. The
    finite indexing is not available before this.
  - Separability: `x` is **injective** if and only if the mapped polynomial is separable. Without
    separability the enumeration repeats a root, the action is on too few points, and the
    stabilizer reading of the resolvent's roots is false.

  *Needs:* `Polynomial.Splits` and `Polynomial.roots` (Mathlib); the degree bookkeeping
  (Layer 0).

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

  ⚠ The failure is not hypothetical, and separability of `f` does not prevent it. Take
  `f = x⁵ − x`, which is separable with `disc f = −256`. Its roots are `0, ±1, ±i`, and the six
  orbit values of the `F₂₀`-invariant collapse to three: the resolvent sextic is
  `(X − 2)⁴ (X² + 16)`. It has the rational root `2`. But the Galois group of `x⁵ − x` is
  generated by the transposition of `i` and `−i`, and `F₂₀ = AGL(1,5)` contains no transposition
  — its elements have cycle types `(1,1,1,1,1)`, `(1,2,2)`, `(1,4)` and `(5)` — so the image is
  **not** conjugate into `F₂₀`. A milestone states this instance, so that the hypothesis cannot
  quietly be dropped. It is also the standing witness that collisions cost separability and not
  degree: the sextic is still a sextic.

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

  If the transform is admissible and the transformed resolvent is separable, then the subgroup
  upper bound transports back to `f`. Separability is the whole of the extra condition: the
  transformed resolvent has the full orbit degree for the same reason every specialization
  does.

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
    Which of the three is taken as *the* invariant is not arbitrary. `x₀x₂ + x₁x₃` is the one
    whose stabilizer is the reference subgroup `⟨(0 1 2 3),(0 2)⟩` of `4T3` on the nose, since
    that group permutes the pairing `{{0,2},{1,3}}`. Taking `x₀x₁ + x₂x₃` instead gives a
    conjugate subgroup, and breaks the exact stabilizer statement, while leaving the resolvent
    cubic unchanged, because that is a product over the whole orbit.
  - *The closed form.* `resolventCubic f = X³ − pX² − 4rX + (4pr − q²)`. That this cubic is
    `specialize` of the specification above is a theorem to prove, not a definition. It is the
    `a = 0` case of the classical resolvent cubic `X³ − bX² + (ac − 4d)X − (a²d + c² − 4bd)` of a
    general quartic `X⁴ + aX³ + bX² + cX + d`, in the same convention.
  - *Discriminants agree.* `f.discr = (resolventCubic f).discr`, with the sign convention of
    `Polynomial.discr` on both sides. One consequence is worth stating as its own lemma: a
    separable quartic has a **separable** resolvent cubic, automatically, so the quartic decision
    table needs no separation evidence. The quintic has no such identity, which is why the sextic
    keeps its evidence hypothesis.
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
    defines `resolventSextic f` as the specialization of that specification **over `ℤ`**, so the
    definition needs no external table and the sextic is monic with integer coefficients. This
    invariant is Dummit's, in *Solving solvable quintics* §1: writing his `x₁, …, x₅` for
    `x₀, …, x₄`, his ten monomials `x₁²x₂x₅ + x₁²x₃x₄ + ⋯` are the ten written above. Dummit also
    gives a closed coefficient formula for the resolvent sextic of a depressed quintic; the
    definition here does not use it, and no milestone transcribes it. The definition applies to
    any monic quintic, depressed or not.
  - *The acceptance test against the source.* Dummit's formula (2′) for `x⁵ + ax + b`,
    `f₂₀(x) = x⁶ + 8ax⁵ + 40a²x⁴ + 160a³x³ + 400a⁴x² + (512a⁵ − 3125b⁴)x + (256a⁶ − 9375ab⁴)`,
    is a milestone as an *identity to check* against the orbit-product definition, not as the
    definition. It is the check that rejects a silently different normalization: a disagreement
    between the two sides is a defect in the specification, in the descent, or in the Vieta
    substitution. The values the roadmap uses elsewhere follow from it: the sextic roots `0` for
    `x⁵ − 2` and `40` for `x⁵ − 5x − 12`, which the Layer 6 certificates carry, and the collision
    witness `(X − 2)⁴ (X² + 16)` for `x⁵ − x`.
  - *The criterion.* For an irreducible separable quintic, `IsSolvable f.Gal` holds if and only
    if the image is conjugate into `F₂₀`. Combined with the factorization theorem: under
    separation evidence, `IsSolvable f.Gal` holds if and only if `resolventSextic f` has a root
    in `F`. Both statements are about the image as a subgroup of `S₅`, and neither mentions a
    label. Layer 6 turns them into a statement about `5T1`, `5T2`, and `5T3`.

    - *Hypotheses:* `f` irreducible and separable, `ringChar F ∉ {2,5}`, and separation evidence
      for the specialized sextic.
    - *Scope boundary:* this criterion remains a statement about the Galois image and resolvent;
      it is not itself a statement about `solvableByRad`. The finite-Galois characteristic-zero
      equivalence with radical membership in the ambient algebraic closure is owned by Layer 10.
      A radical expression inside the original splitting field is not asserted.
    - *What the sextic does not do:* it separates the solvable labels from `A₅` and `S₅`, and,
      with the discriminant, it separates `5T3` from `5T1` and `5T2`. It does **not** separate
      `5T1` from `5T2`. Layer 6 states that limitation with its witnesses, and no milestone here
      or there claims a decision procedure from the discriminant and the sextic alone.

  *Needs:* the resolvent specification and the factorization theorem (Layer 4); the pure
  transitive degree-five solvability criterion (Layer 1C), transported along the faithful
  root-action image equivalence of Layer 0.

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

- **Good primes, for a polynomial and for a resolvent.** `IsGoodPrime f p` is `p ∤ disc f`. It
  is the hypothesis of everything below, and it is a hypothesis about `f` alone.

  Reducing a **resolvent** modulo `p` is a second and independent condition. The identity
  `(specialize ℤ f).map (ZMod p) = specialize (ZMod p) (f mod p)` is unconditional base change,
  proved in Layer 4. Reading the reduced resolvent as a resolvent of the reduced polynomial is
  not: it needs the reduced resolvent to stay separable, that is `p ∤ disc (specialize ℤ f)`. A
  prime can be good for `f` and bad for the resolvent, and then no factorization statement about
  the reduced resolvent is available. `ResolventSpec.IsGoodPrime spec f p` names the conjunction,
  and every milestone that reduces a resolvent carries it rather than `IsGoodPrime`.

  - *Hypotheses:* `f` monic over `ℤ`, `p` prime.
  - *Edge case:* `p` good for `f` but dividing `disc (specialize ℤ f)`. Nothing is claimed there.

  *Needs:* base change and the degree of a specialization (Layer 4); the criterion
  `discr ≠ 0 ↔ Separable` over a domain (Layer 3).

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
  (R *Number Field Arithmetic*, Layer 3.10); (Tau Ceti) `Equiv.Perm.fullCycleType`;
  `factorDegrees` (Layer 5).

- **The membership statement.** This is the first theorem of the layer that this roadmap owns.
  The multiset of factor degrees of `f mod p` belongs to the set
  `{ Equiv.Perm.fullCycleType g | g in the Galois image }`. It is the imported theorem with the existential
  read as membership, and it is the form every recognition theorem is applied to; nothing
  downstream of here mentions a prime ideal or a Frobenius element. Consequences, each a named
  theorem, through the recognition theorems of Layer 1:

  - if `f mod p` is irreducible, then the Galois group contains an `n`-cycle, so it acts
    transitively, so `f` is irreducible over `ℚ`. This is the classical criterion for
    irreducibility modulo `p`. It is applied to an `f` not yet known to be irreducible, which is
    why the imported statement has to cover reducible `f`;
  - factorization type `(1,…,1,2)` in prime degree, with transitivity, gives `S_p`;
  - factorization type `(1,…,1,3)` with primitivity gives a group that contains `Aₙ`.

  Recognition that reads a low-degree table consumes Layer 1C, where that table is proved.
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

### Layer 6: polynomial labels, decision packages, and certificates

The pure reference family, table, invariant comparisons, exact generators, and classification
are in Layer 1C. This layer transports them to polynomials and combines the independent
resolvent and good-prime evidence. It does not supply a premise of Layer 1C or Layer 4.

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

  *Needs:* the pure label API (Layer 1C); the degree bookkeeping and the invariants (Layer 0).

- **Solvability and the labels in degree 5.** An irreducible quintic has `IsSolvable f.Gal` if and
  only if its label is `5T1`, `5T2`, or `5T3`. This turns the group criterion of Layer 4 into a
  statement about labels. The statement is about the group. It is not a statement about
  `solvableByRad`.
  *Needs:* the classification in degree 5 (Layer 1C); the sextic criterion (Layer 4);
  `IsSolvable` (Mathlib).

Three different things meet here, and the roadmap keeps them apart, because conflating them is
how a false claim gets made. A **classification theorem from a package of data** says what the
discriminant and the registered resolvents determine on their own. A **certificate** is a finite
package of evidence, which may additionally carry good-prime factorizations, together with a
soundness theorem. A **search** for such evidence is neither of those, and is not here.

- **Classification from the discriminant and the resolvents.** Each is a named theorem that ends
  in `HasGaloisLabel f j`, with the data it reads in its hypotheses.

  - *Degree 3.* An irreducible separable cubic over `F` with `ringChar F ≠ 2` has label `3T1` if
    `f.discr` is a square, and `3T2` if it is not. The discriminant decides, by itself.
  - *Degree 4.* An irreducible separable quartic with `ringChar F ≠ 2` has a label read off the
    decision table of Layer 4: `4T5`, `4T4`, `4T2`, or, in the last row, `4T1` or `4T3` according
    to whether `f` becomes reducible over `F(√disc f)`. The four rows are exhaustive, and no
    separation evidence is needed, because a separable quartic has a separable resolvent cubic.
    The table decides, given the ability to test irreducibility over the quadratic extension.
  - *Degree 5, what the package gives.* For an irreducible separable quintic with
    `ringChar F ∉ {2,5}`, four named theorems, of which the fourth is not a decision:
    - non-square discriminant and no rational root of the sextic give `5T5`;
    - square discriminant and no rational root give `5T4`;
    - non-square discriminant, separation evidence, and a rational root give `5T3`;
    - square discriminant, separation evidence, and a rational root give `5T1` **or** `5T2`, and
      nothing in these data says which.

    The first two need no separation evidence: they use only the direction that a containment
    produces a rational root, which is unconditional.

  ⚠ The fourth branch is genuinely undetermined. `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1`, which defines
  `ℚ(ζ₁₁)⁺` and has label `5T1`, and `x⁵ − 5x − 12`, which has label `5T2`, both have square
  discriminant — `11⁴` and `8000²` — and both have a separable resolvent sextic with a rational
  root, at `−16` and at `40` respectively. The hypotheses of the fourth branch hold of both, and
  the labels differ. The named regression theorem
  `discriminant_and_sextic_do_not_distinguish_C5_D5` states this pair, so that no later revision
  reintroduces a "quintic decision procedure" from those two data. Separating `5T1` from `5T2`
  takes a further datum, and the certificate below carries one: a good-prime factorization of
  type `(1,2,2)`, or a second root of `f` in `ℚ[X]/(f)`.

  *Needs:* the classification and order recognition (Layer 1C); the discriminant test and
  the quadratic extension (Layer 3); the quartic and quintic resolvents with their separation
  evidence (Layer 4); the membership statement (Layer 5).

- **The degree-five certificate, and its soundness theorem.** `QuinticCertificate` is a finite
  package of evidence about a monic `f : ℤ[X]` of degree 5, with one constructor per sound route
  to a label. `Verifies` lists the conditions its data must satisfy, `check` is the Boolean
  decision of those conditions, and the public theorem is

  ```
  cert.check f = true → HasGaloisLabel (f over ℚ) cert.label
  ```

  and nothing else. The five routes, each of which begins with a prime `p` at which `f` is
  irreducible, since that is what supplies transitivity:

  | route | further evidence | label |
  |---|---|---|
  | cyclic | a second root of `f` in `ℚ[X]/(f)` | `5T1` |
  | dihedral | `disc f = s²`, a root of a separable sextic, a prime of type `(1,2,2)` | `5T2` |
  | Frobenius | `disc f` not a square, a root of a separable sextic | `5T3` |
  | alternating | `disc f = s²`, a prime of type `(1,1,3)` | `5T4` |
  | symmetric | a prime of type `(2,3)` | `5T5` |

  Every clause is finite: an equation between integers, a divisibility of integers, an equation
  in `ℚ[X]`, or the factorization of `f` over the finite field `ZMod p`. The sextic is monic over
  `ℤ`, by coefficient integrality in Layer 4, so a rational root of it is an integer and "has a
  rational root" is a condition on integers. The cyclic route works because the point stabilizer
  of a transitive subgroup of `S₅` fixes exactly one point unless the group is `C₅`; the dihedral
  route works because `C₅` has no element of order 2 while `D₅` does.

  - *Hypotheses:* `f` monic over `ℤ` of degree 5.
  - *Soundness only:* there is no converse. No theorem says a certificate exists, and none is a
    milestone.
  - *Edge cases:* a certificate whose data do not verify, which proves nothing; and an `f` for
    which the route's evidence is unavailable, for which the roadmap claims nothing.
  - *Acceptance instances:* the five worked quintics below, each with its certificate written
    out.

  *Needs:* the classification and the package theorems above (Layer 6); the membership statement
  and good primes (Layer 5); the resolvent sextic with its separation evidence (Layer 4).

- **What no milestone claims: a search.** Nothing here searches for a certificate, and no
  statement asserts that one exists or that a procedure terminates. In particular, the existence
  of a prime with a prescribed factorization type is Chebotarev's theorem, which belongs to the
  L-functions roadmap and is used by nothing here; and the existence of an admissible Tschirnhaus
  transform over an infinite field is explicitly not a milestone of Layer 4. A statement of the
  form "the quintic procedure always decides" would be a claim about search, and would be false
  for the data this roadmap owns, by the ⚠ above.
  *Needs:* nothing. This item constrains the others.

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

  The Sₙ realization itself needs Layer 1 and Layer 5 only; the separate Gassmann worked example also needs Number Field Arithmetic 3.8/8.4 and Induction–Restriction 2.1/2.2. It does not need Layer 6.

- **The Gassmann fixed-field example.** Consume Induction–Restriction Layer 2.2's finite
  nonconjugate almost-conjugate subgroups `A,B ≤ S₁₆`; do not reconstruct the finite group pair
  here. For the Layer 9 realization polynomial `f`, let `E = f.SplittingField`. Mathlib's
  `Polynomial.Gal f` is a plain semireducible `def` for `E ≃ₐ[ℚ] E` (with derived group and finite
  instances); state the transported subgroups and the
  NFA Gassmann inputs at this explicit automorphism-group type (or unfold `f.Gal` when applying
  them), so the `Polynomial.Gal` abbreviation does not obscure the supplier's domain. Separability
  and splitting give `IsGalois ℚ E` by Mathlib `IsGalois.of_separable_splitting_field`; consume
  Number Field Arithmetic Layer 3.8's named instance
  `TauCetiRoadmap.NumberFieldArithmetic.numberField_splittingField` to obtain `NumberField E`.
  Assemble the Galois-group equivalence from `galActionHom_injective` and the proved surjectivity
  of `galActionHom`, identifying the root set with `Fin 16`. Pull `A,B` back along this equivalence
  using Induction–Restriction Layer 2.1's `Gassmann.almostConjugate_comap` and
  `Gassmann.not_conj_comap`. The root-set relabeling transports cardinalities, so both subgroups
  have order 16 in `Gal(E/ℚ)`. Finite Galois correspondence gives
  `Module.finrank ℚ (E^H) = [Gal(E/ℚ) : H] = 16!/16 = 15!` and the same for `E^K`.

  State the resulting target explicitly: the fixed fields from the transported pair are
  nonisomorphic over ℚ, have equal `TauCeti.dedekindZetaCoeff` at every natural index, and have
  equal totalized `NumberField.dedekindZeta` functions. Consume Number Field Arithmetic Layer 8.4
  for those conclusions. This is a worked example, not a new inverse-Galois theorem or
  minimum-degree claim.
  *Needs:* (Layer 9) the `S₁₆` realization polynomial and its root-action Galois equivalence;
  (Mathlib) `IsGalois.of_separable_splitting_field`, `IsGalois.card_aut_eq_finrank`,
  `IntermediateField.finrank_eq_fixingSubgroup_index`,
  `IntermediateField.fixingSubgroup_fixedField`, and cardinality transport along a `MulEquiv`;
  (R *Number Field Arithmetic*, `TauCetiRoadmap.NumberFieldArithmetic.numberField_splittingField`
  in Layer 3.8);
  (R *Number Field Arithmetic*, `Gassmann.dedekindZeta_eq_of_almostConjugate_of_one_lt_re`,
  `Gassmann.dedekindZetaCoeff_eq_of_almostConjugate`,
  `Gassmann.dedekindZeta_eq_of_almostConjugate`, and
  `Gassmann.not_algEquiv_fixedFields_of_not_conj` in Layer 8.4); (R *Induction–Restriction*,
  `Gassmann.exists_S16_gassmann_pair` in Layer 2.2 and `Gassmann.not_conj_comap` plus
  `Gassmann.almostConjugate_comap` in Layer 2.1).

- **The alternating examples, as an exact list.** Three polynomials with proved labels:
  `x³ − 3x − 1` for `3T1`, `x⁴ + 8x + 12` for `4T4`, and `x⁵ + 20x − 16` for `5T4`. Each has
  square discriminant and the alternating label. That list is the whole deliverable; the roadmap
  makes no claim for degrees 6 to 11, and it does not carry a manifest for them. The realization
  of `Aₙ` over `ℚ` for general `n` is outside this roadmap, as the scope section records.
  *Needs:* the discriminant test (Layer 3); the classification (Layer 1C).

### Layer 10: finite Galois extensions and radicals

For a characteristic-zero field `F`, a finite Galois extension `E/F`, and an `F`-embedding
`ι : E →ₐ[F] AlgebraicClosure F`, prove

```text
Group.IsSolvable (E ≃ₐ[F] E) ↔
  ∀ x : E, ι x ∈ solvableByRad F (AlgebraicClosure F).
```

The radical closure is taken in `AlgebraicClosure F`. It cannot in general be replaced by
`solvableByRad F E`: adjoining roots of unity can require enlarging the original splitting
field. The statement quantifies over the chosen embedding; do not require a separate comparison
of embeddings as part of this theorem.

The forward proof uses the following targets and route.

1. **One-step group lemma.** Own
   `RadicalConverse.exists_normal_prime_index_subgroup`: for `[Finite G] [Nontrivial G]
   [Group.IsSolvable G]`, produce `H : Subgroup G` with `H.Normal` and prime index. In the
   proof, `Group.IsSolvable.commutator_lt_top_of_nontrivial` first shows that the commutator
   subgroup is proper. Then choose a coatom above it using the finite-group `IsCoatomic` instance.
   `Subgroup.Normal.of_commutator_le` makes this coatom normal;
   `Group.isSimpleGroup_of_isCoatom` makes its quotient simple. Quotient solvability and
   `IsSimpleGroup.comm_iff_isSolvable` make the quotient commutative; install the resulting
   `CommGroup` structure (and its finite instance) before applying `IsSimpleGroup.prime_card`, then
   `isCyclic_of_prime_card`. The helper is one-step: the subgroup is normal in `G`, so it can be
   applied afresh to each smaller Galois group in the induction. The finite-group `IsCoatomic`
   instance, quotient solvability, commutator normality, coatom simplicity, prime-cardinality,
   cyclicity, and Lagrange divisibility are explicit prerequisites, not an assumed composition-series
   API.

2. Put `G := E ≃ₐ[F] E` and `N := Nat.card G`. `Finite G` follows from finite-dimensionality
   of `E/F`; together with `Nonempty G`, this gives `0 < N`. `CharZero F` then gives
   `NeZero (N : F)`. The algebraic-closure instance
   `AlgebraicClosure.hasEnoughRootsOfUnity` and
   `HasEnoughRootsOfUnity.exists_primitiveRoot` give a primitive `N`th root `ζ` in
   `Ω := AlgebraicClosure F`. Set `F₁ := F⟮ζ⟯` inside `Ω`. The extension `F₁/F` is finite by
   `IntermediateField.adjoin.finiteDimensional`, since `ζ` is algebraic. It lies in
   `solvableByRad F Ω`, since `ζ^N = 1` and `solvableByRad.rad_mem` adjoins a root of an element
   already in that field.

3. Let `E₀ := ι.fieldRange`, and form `L_c := E₀ ⊔ F₁` as an intermediate field of `Ω/F`.
   Define `ζ_c : L_c` as the element corresponding to `ζ` under the inclusion `F₁ ≤ L_c`; its
   image under `L_c.val` is `ζ`. The embedding identifies `E` with `E₀`, so `E₀/F` is finite Galois.
   `IntermediateField.finiteDimensional_sup` makes `L_c/F` finite, hence `L_c/F₁` finite.
   Regard `E₀` and `F₁` as intermediate fields of `L_c`; prove their supremum is `⊤` using
   `IntermediateField.restrict` / `restrictAlgEquiv`, `lift_sup`, `lift_restrict`, and `lift_top`
   (the equality is not definitional). `IsGalois.sup_right` applied to `E₀/F` proves
   `L_c/F₁` Galois. For any intermediate `K : IntermediateField F₁ L_c`,
   `IsGalois.tower_top_intermediateField` supplies `IsGalois K L_c`. Restriction gives the native homomorphism
   `IntermediateField.restrictRestrictAlgEquivMapHom` from `Gal(L_c/F₁)` to `Gal(E₀/F)`;
   `restrictRestrictAlgEquivMapHom_injective` applies because the supremum in `L_c` is `⊤`.
   Transport across the embedding's field-range equivalence. Thus `Gal(L_c/F₁)` is finite and
   solvable. This uses no linear-disjointness assumption and makes no Galois claim for `F₁/F`.

4. **Relative-field induction.** Define
   `R := (solvableByRad F Ω).comap L_c.val : IntermediateField F L_c`. Prove by strong
   induction on `finrank K L_c`, for `K : IntermediateField F₁ L_c`, the implication
   `K.restrictScalars F ≤ R → Group.IsSolvable (L_c ≃ₐ[K] L_c) → ⊤ ≤ R`. The induction
   parameter is the actual base field of `Gal(L_c/K)`; the containment hypothesis is retained at
   each induction stage. The initial data are containment of the bottom intermediate field
   `⊥ : IntermediateField F₁ L_c` (viewed over `F`) in `R`, because `ζ_c ∈ R`, and solvability
   of `Gal(L_c/F₁)`. If `Gal(L_c/K)` is trivial, `IsGalois.card_aut_eq_finrank` gives
   `Module.finrank K L_c = 1`; `IntermediateField.finrank_eq_one_iff_eq_top` in
   `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` then gives `K = ⊤`, so the containment hypothesis is the goal.
   Otherwise apply the one-step group lemma to this actual finite solvable group, obtaining a
   normal subgroup `H` of prime index; write `p := H.index`. Then `p` divides
   `Nat.card Gal(L_c/K)` by Lagrange. Restriction injects this group into `Gal(L_c/F₁)`, which
   injects into `Gal(E₀/F) ≃ G`; transitivity of divisibility gives `p ∣ N`. Let
   `M := IntermediateField.fixedField H : IntermediateField K L_c`. Native fixed-field algebra
   structure supplies the extension algebra `K → M`; no algebra instance for an arbitrary
   inclusion of two unrelated `IntermediateField F₁ L_c` values is assumed. The normality
   instance gives `IsGalois K M`; `normalAutEquivQuotient H` identifies the quotient with
   `Gal(M/K)`, and `IsGalois.card_aut_eq_finrank` identifies `[M:K]` with that prime. The
   quotient is cyclic, so
   `M/K` is cyclic Galois of prime degree. Put `K' := M.restrictScalars F₁`, an intermediate
   field in the induction's carrier. Since `[M:K]=p>1`, `Module.finrank_mul_finrank` and
   positivity of the finite extension dimensions give `finrank K' L_c < finrank K L_c`; here
   `finrank K' L_c` is the same carrier dimension as `finrank M L_c`. The
   extension `L_c/K'` is Galois. The native `IntermediateField.subgroupEquivAlgEquiv H`
   identifies `H` with `Gal(L_c/M)`, hence with `Gal(L_c/K')`; its inverse transports
   solvability from the subgroup `H` to this Galois group.

   For this step's root of unity, use `ζ_c : L_c` from Step 3. Since `K` contains the image
   of `F₁`, the `N/p` power of `ζ_c` belongs to `K`. First use
   `IsPrimitiveRoot.pow` with `N = (N/p) * p` to prove that this power is primitive of order
   `p` in `Ω`, then pull that fact back along the composite injection
   `L_c.val.toRingHom.comp K.val.toRingHom : K →+* Ω` using `IsPrimitiveRoot.of_map_of_injective` (or
   `coe_submonoidClass_iff`). The map is the composite inclusion `K ↪ L_c ↪ Ω`; `K.val` alone
   lands only in `L_c`, and there is no map from `Ω` into `K`. The equality `[M:K]=p` identifies the
   order with `finrank K M`, so `isCyclic_tfae` from `Mathlib/FieldTheory/KummerExtension.lean` applies to
   the genuine extension `M/K` with
   `(primitiveRoots (finrank K M) K).Nonempty`. Its cyclic-Galois-to-radical-generator
   implication supplies `α : M`, `hgen : K⟮α⟯ = ⊤` inside `M`, and
   `hpow : α^(finrank K M) ∈ Set.range (algebraMap K M)`.

   To pass the induction's containment hypothesis from `K` to `K'`, map `α` and its power
   witness through `M.val` and `L_c.val`. The range witness maps into `K`, whose image lies in
   `solvableByRad F Ω` by `K.restrictScalars F ≤ R`. Apply `solvableByRad.rad_mem` in `Ω` to
   the image of `α`; unfold `R` as a comap to obtain `(α : L_c) ∈ R`. Then
   `adjoin_simple_le_iff` gives `F⟮(α : L_c)⟯ ≤ R`. `lift_adjoin_simple` and
   `restrictScalars_adjoin_eq_sup` express
   `K'.restrictScalars F = K.restrictScalars F ⊔ F⟮(α : L_c)⟯`; hence `sup_le` proves
   `K'.restrictScalars F ≤ R`. Apply the induction hypothesis at `K'` with this containment and
   the solvability of `Gal(L_c/K')`. Applying it to the initial base
   `K = ⊥ : IntermediateField F₁ L_c` gives `⊤ ≤ R`; thus every
   element of `E₀ ≤ L_c` lies in the ambient radical closure.

5. For the reverse implication, choose a primitive element of `E/F`. Its minimal polynomial is
   irreducible, and normality makes `E` its splitting field. Apply
   `isSolvable_gal_of_irreducible` to the embedded primitive element and transport the polynomial
   Galois group across the splitting-field algebra equivalence to `E ≃ₐ[F] E`.

For any nonzero `q : F[X]` over a characteristic-zero field, choose a splitting-field model `E`
and an `F`-embedding `ι : E →ₐ[F] AlgebraicClosure F`. Finite-dimensionality makes
`E/F` integral; `Algebra.IsSeparable.of_integral` in characteristic zero gives separability
even when `q` has repeated factors. `Normal.of_isSplittingField` gives normality, and
`isGalois_iff` then gives `IsGalois F E`. Use `IsSplittingField.lift` for the embedding and
`IsSplittingField.adjoin_rootSet_eq_range` to identify the algebra generated by all roots with
`ι.fieldRange`. Thus `Group.IsSolvable q.Gal` holds exactly when **every** root of `q`, mapped
into the chosen algebraic closure, lies in `solvableByRad F (AlgebraicClosure F)`. This includes
reducible polynomials because their splitting field is generated by all roots. If `q` is
irreducible of positive degree, a root exists and `isSolvable_gal_of_irreducible` gives the
equivalent **some-root** formulation. Do not use a some-root statement for reducible `q`.

For the source's prime-degree criterion, work over `ℚ`, retain irreducibility, and require prime
natural degree `p ≥ 5`. The two-nonreal-roots hypothesis is the exact native premise
`Fintype.card (q.rootSet ℂ) = Fintype.card (q.rootSet ℝ) + 2`. Use
`Polynomial.Gal.galActionHom_bijective_of_prime_degree` to identify the Galois action with
`S_p`. Separability in characteristic zero and `card_rootSet_eq_natDegree` supply
`5 ≤ Cardinal.mk (q.rootSet ℂ)`, the permutation-degree bound required by
`Equiv.Perm.not_isSolvable`; hence the Galois group is nonsolvable. By the contrapositive of
`isSolvable_gal_of_irreducible`, no root of `q` in `AlgebraicClosure ℚ` lies in
`solvableByRad ℚ (AlgebraicClosure ℚ)`. Prime degrees 2 and 3 have solvable symmetric groups
and do not give this conclusion.

*Needs:* `CharZero F`, `IsGalois F E`, and `FiniteDimensional F E` (Mathlib);
`RadicalConverse.exists_normal_prime_index_subgroup` (Layer 10); finite-group `IsCoatomic`, quotient
solvability, `Subgroup.Normal.of_commutator_le`, `Group.isSimpleGroup_of_isCoatom`,
`IsSimpleGroup.comm_iff_isSolvable`, `IsSimpleGroup.prime_card`, and
`isCyclic_of_prime_card` (Mathlib); Lagrange's theorem (Mathlib);
`AlgebraicClosure.hasEnoughRootsOfUnity`, `HasEnoughRootsOfUnity.exists_primitiveRoot`,
`IntermediateField.finiteDimensional_sup`, `IntermediateField.adjoin.finiteDimensional`,
`IntermediateField.finrank_eq_one_iff_eq_top`, `Module.finrank_mul_finrank`,
`IsGalois.sup_right`, `IsGalois.tower_top_intermediateField`,
`IntermediateField.restrict` / `restrictAlgEquiv`, `IntermediateField.lift`, `liftAlgEquiv`,
`lift_restrict`, `lift_sup`, `lift_top`,
`IntermediateField.restrictRestrictAlgEquivMapHom_injective`,
`IsGalois.intermediateFieldEquivSubgroup`, `IsGalois.of_fixedField_normal_subgroup`,
`IsGalois.normalAutEquivQuotient`, `IsGalois.card_aut_eq_finrank`,
`IntermediateField.subgroupEquivAlgEquiv`, `IsPrimitiveRoot.pow`,
`IsPrimitiveRoot.of_map_of_injective`, `mem_primitiveRoots`, `isCyclic_tfae`,
`lift_adjoin_simple`, `restrictScalars_adjoin_eq_sup`, `adjoin_simple_le_iff`,
`solvableByRad.rad_mem`, `Algebra.IsSeparable.of_integral`,
`Normal.of_isSplittingField`, `isGalois_iff`,
`IsSplittingField.lift`, `IsSplittingField.adjoin_rootSet_eq_range`,
`card_rootSet_eq_natDegree`, `Polynomial.Gal.galActionHom_bijective_of_prime_degree`,
`Group.IsSolvable.commutator_lt_top_of_nontrivial`, `Equiv.Perm.not_isSolvable`, and
`isSolvable_gal_of_irreducible` (Mathlib).

## Worked examples, as acceptance tests

For Layer 0's **Conjugate fields** dictionary, construct explicit certificates
from Mathlib's existing simple-extension, minimal-polynomial and splitting-field
APIs. For `X²−2`, identify the splitting field with the field generated by a
chosen square root, prove its two self-embeddings and prove that no ℚ-embedding
exists into ℚ(√3). For every ℚ-algebra field K in which `X²−2`
splits, construct an embedding of this splitting field into K, consuming
`IsSplittingField.lift`. For `X²+3`, prove irreducibility, construct `AdjoinRoot (X²+3)`, and prove that the mapped
polynomial splits there with roots β and −β, and identify this quotient by
an explicit ℚ-algebra equivalence with ℚ(s) for a chosen s∈ℂ with s²=−3.
Prove that ℝ is not a splitting field of `X²−2` over ℚ: containing its
roots does not imply being generated by them.
For a real cube root α of 2, prove `[ℚ(α):ℚ]=3`, exactly one self-embedding,
and irreducibility of `X²+αX+α²` over ℚ(α). Construct `W=AdjoinRoot (X²+αX+α²)` over ℚ(α), with its ℚ-algebra
structure through the tower, and prove `IsSplittingField ℚ W (X³−2)`.
Construct the roots α, β, −α−β and their factorization; prove degree six
by the tower law 3·2. Give the three ℚ-embeddings of ℚ(α) into W by their images of α
and identify their image fields ℚ(α), ℚ(β), ℚ(−α−β). Give the two quadratic
self-embeddings explicitly by √2↦±√2. Compare W to Mathlib's chosen
splitting field by `IsSplittingField.algEquiv`; consume
`TauCeti.irreducible_X_pow_three_sub_two` and
`TauCeti.natCard_gal_X_pow_three_sub_two` for the matching degree-six theorem
on that carrier. State all comparisons with chosen `AlgHom`/`AlgEquiv` maps, rather than
unqualified inclusions between independently constructed fields. These
explicit-map and generator-image comparisons are definitive prose acceptance
criteria; Suggested.lean illustrates the tower and numerical interfaces and
is not an exhaustive signature list. These certificates exercise existing field foundations; they do not introduce a
second general field-theory API.

Every polynomial in the following list was checked with PARI,
through `polgalois` and `nfdisc`, and against the LMFDB field pages. Each tests a
specific layer.

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
  | `x⁴ + x³ + x² + x + 1` | one rational root | `125`, not a square | `C₄ = 4T1` | `4.0.125.1` |

  The last discriminant is `125`, which is not a square, as the decision table of Layer 4 and
  the odd parity of `C₄` require. The discriminant of `x⁵ − x` in Layer 4 and the
  non-examples is `−256`.

  The field for `x⁴ + 1` is `ℚ(ζ₈)`, and the field for `x⁴ + x³ + x² + x + 1` is `ℚ(ζ₅)`. The
  second is identified through `galCyclotomicEquivUnitsZMod`, which gives `(ZMod 5)ˣ`. The
  polynomial `x⁴ + 1` also carries a test for Layer 5 read in the other direction. Its group `V₄`
  contains no 4-cycle, so `x⁴ + 1` is reducible modulo every prime.
- **Degree 5, for Layers 4 to 6.** Each of the five carries the certificate that proves its
  label, so that the acceptance tests are instances of the soundness theorem and not of a
  procedure.
  - `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1` defines `ℚ(ζ₁₁)⁺` and gives `C₅ = 5T1`. The field is
    `5.5.14641.1`, of discriminant `11⁴ = 121²`. Certificate: the cyclic route, irreducible
    modulo `2`, with the second root `α² − 2` in `ℚ[X]/(f)` — indeed `f(X² − 2) ≡ 0 mod f`, since
    `α = ζ₁₁ + ζ₁₁⁻¹` and `α² − 2 = ζ₁₁² + ζ₁₁⁻²`. The discriminant and the sextic resolvent do
    not prove this label: see the ⚠ in Layer 6, of which this polynomial is half.
  - `x⁵ − 5x − 12` gives `D₅ = 5T2`, with field `5.1.1000000.1` and polynomial discriminant
    `8000² = 2¹² · 5⁶`. This example shows why upper bounds need more than factorization types. A
    5-cycle and an element of type `(1,2,2)` occur. Every factorization type of this `f` at a
    prime that does not divide the discriminant is a cycle type of `D₅ ⊂ A₅`, so no prime
    excludes `A₅`. The square discriminant excludes `S₅` and `F₂₀`, and the rational root `40` of
    the separable sextic resolvent excludes `A₅` — but those two data leave `5T1` and `5T2`
    both open, and the order does **not** follow from them. Certificate: the dihedral route,
    irreducible modulo `7`, discriminant `8000²`, sextic root `40`, and factorization type
    `(1,2,2)` modulo `3`, which exhibits the element of order 2 that `C₅` has not.
  - `x⁵ − 2` gives `F₂₀ = 5T3`, with field `5.1.50000.1`. This is the Kummer example. Its Galois
    group is solvable, the sextic resolvent is `X⁶ − 50000X` with the rational root `0`, and the
    discriminant `50000` is not a square. Certificate: the Frobenius route, irreducible modulo
    `11`, sextic root `0`.
  - `x⁵ + 20x − 16` gives `A₅ = 5T4`, with field `5.1.1000000.2`. The discriminant `32000²` is a
    square. A prime with factorization type `(1,1,3)`, together with primitivity, which is
    automatic in prime degree, gives a group that contains `A₅`. The square discriminant then
    bounds it above by `A₅`. This field has the same discriminant `10⁶` as the `D₅` example. The
    pair shows that the label is not a function of `(n, r₁, |disc|)`. Certificate: the
    alternating route, irreducible modulo `3`, discriminant `32000²`, type `(1,1,3)` modulo `7`.
  - `x⁵ − x − 1` gives `S₅ = 5T5`, with field `5.1.2869.1` and discriminant `2869 = 19·151`.
    Modulo 2 the factorization is `(x² + x + 1)(x³ + x² + 1)`, which exhibits an element of
    order 6. Modulo 5 the polynomial is `x⁵ − x − 1`, which is Artin-Schreier and therefore
    irreducible; that exhibits a 5-cycle and proves irreducibility over `ℚ`. A transitive group
    with an element of order 6 is `S₅`, by the recognition theorems; no discriminant computation
    is needed. Certificate: the symmetric route, irreducible modulo `3`, type `(2,3)` modulo `2`.
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
  - `x⁵ − x` is separable, with `disc = −256`, and its resolvent sextic is `(X − 2)⁴ (X² + 16)`,
    which is **not** separable. It is the regression test for the collision hypothesis: the
    rational root `2` of that sextic does not place the Galois group inside a conjugate of `F₂₀`,
    because the group is generated by a transposition and `F₂₀` contains none. Any upper-bound
    theorem that runs on it without separation evidence is wrong.

## Order of work

The following cuts are topologically ordered. Numbering retains the polynomial layer IDs;
Layer 1C names the earlier pure-permutation part of the former aggregate Layer 6.

| Layer | Depends on | Content |
|---|---|---|
| 0 | Mathlib | root action, orbit/factor dictionary, intrinsic invariants and base-field isomorphism transport |
| 1 | Mathlib | blocks, wreath products, imprimitivity and generic recognition |
| 1C | 1, Mathlib/native permutation APIs | canonical reference family, exact generators, all fourteen rows, classification, order recognition and pure solvability |
| 2 | 0, 1 | field and permutation dictionary |
| 3 | 0 | discriminants and alternating image |
| 4 | 0, 3, 1C for the quintic criterion | resolvents, quartic and quintic specifications; the group-side criterion consumes early classification |
| 5 | 0, 1, 3, 4; Number Field Arithmetic 3.10 | factor degrees, good primes, finite-field orbit theorem and factorization membership |
| 6 | 0, 1C, 2, 3, 4, 5 | polynomial labels, decision packages and sound certificates |
| 9 | 1, 3, 5; 1C/6 for labelled alternating examples; NFA 3.8/8.4 and IR 2.1/2.2 for the fixed-field example | arbitrary-degree symmetric realization, the three alternating examples, and the S₁₆ Gassmann example |
| 10 | Mathlib | characteristic-zero finite-Galois radical criterion and its all-roots/some-root polynomial consequences |

The pure criterion `Group.IsSolvable G ↔ G ≤ conjugate(F₂₀)` is proved in Layer 1C
by classification. Layer 4 transports it to the Galois image and combines it with the
sextic root criterion. Layer 6 then expresses conclusions as `HasGaloisLabel` and
packages evidence. Label-valued versions of the quartic and quintic comparisons are Layer 6 consumers,
even when their native examples are printed beside the Layer 4 specifications. They use
the early pure table, without sending a premise back through the polynomial certificate.
The Lean source's textual order of examples does not redefine this DAG.

Layer 9's symmetric realization uses the generic recognition theorems and Layer 5;
it does not need a degree-at-most-five classification. Its alternating labelled examples
and Gassmann example have the additional edges explicitly listed above. Layer 10's
ambient radical-closure proof is independent of the resolvent and certificate layers.

The exact external merge order for the fixed-field example is Induction–Restriction,
then Number Field Arithmetic, then this roadmap. Number Field Arithmetic does not consume
this polynomial consumer. These are declaration-level contracts, not a requirement to
wait for another roadmap's implementation. The early reference table, `ResolventSpec`
and specialization API, and Layer 5 membership signature determine their consumers and
are complete library interfaces in their own right.

## Related roadmaps

This roadmap serves the LMFDB section `galois_groups`.

- The [Number Field Arithmetic](../NumberFieldArithmetic/README.md) roadmap owns Dedekind's
  factorization theorem and the ramification theory behind it. Its factorization theorem and
  Layer 8.4 fixed-field theorem are upstream contracts; see §What this roadmap consumes. The
  merge order for the worked example is Induction–Restriction, Number Field Arithmetic, then PGG.
- Storing certificates, and searching for one, belong in a dedicated computational repository
  such as Hex. What stays here is the certificate type of Layer 6 with its soundness theorem,
  and the classification theorems it is built from; those are mathematics, and Hex consumes them
  rather than restating them.
- The [representation theory](../RepresentationTheory/README.md) roadmaps own data about abstract
  groups, such as character tables. This roadmap owns only permutation data.
- Density of the cycle types is the subject of Chebotarev's theorem, which belongs to the
  L-functions roadmap. No milestone here uses it.

## References

No milestone rests on a source that was not inspected. Where a classical book is the traditional
citation but was not available for this pass, the entry says how the milestone is grounded
instead.

Each registered invariant and each low-degree decision table has one exact source, and the
convention it fixes:

| Item | Source | What the source fixes |
|---|---|---|
| the quartic `D₄` invariant and resolvent cubic | Conrad, Definition 3.1 and (3.7) | the three orbit values, and the closed form `X³ − bX² + (ac − 4d)X − (a²d + c² − 4bd)` |
| a quartic and its resolvent have equal discriminant | Conrad, Theorem 3.4 | that a separable quartic has a separable resolvent cubic |
| the quartic decision table | Conrad, Theorem 3.6 with Table 4, and Corollary 3.8 | the four rows, and "splits completely" against "unique root in the base field" |
| the `C₄`-against-`D₄` row | Kappe–Warren, as Conrad Theorem 4.1 | the two quadratics that split over `K(√Δ)`, equivalently reducibility of `f` there |
| the quintic `F₂₀` invariant | Dummit, §2, p. 388 | the ten monomials, and that the stabilizer is *precisely* `F₂₀` |
| the resolvent sextic's closed form | Dummit, (2) and (2′) | the acceptance test the orbit-product definition is checked against |
| the solvability criterion | Dummit, Theorem 1 | a rational root of the sextic against solvability, for irreducible quintics |
| the `nTj` reference generators | LMFDB `gps_transitive` | the representative of each conjugacy class, in 1-based cycle notation |
| the three-prime realization of `Sₙ` | van der Waerden §61 | the shape of the construction; the three patterns are fixed in Layer 9 |
| the fixed-field arithmetic-equivalence example | Gassmann, *Mathematische Zeitschrift* 25 (1926), 665–675; Perlis, *Journal of Number Theory* 9 (1977), 342–360 | the sufficient almost-conjugate fixed-field implication consumed from Number Field Arithmetic Layer 8.4; not an inverse-Galois construction or a minimum-degree result |

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
  checked against it. Its generators are written in 1-based cycle notation, and the reference
  subgroups here are their 0-based transcriptions: `4T3 = ⟨(1234),(13)⟩` is
  `⟨(0 1 2 3),(0 2)⟩ ≤ Equiv.Perm (Fin 4)`, and `5T3 = ⟨(12345),(1243)⟩` is
  `⟨(0 1 2 3 4),(0 1 3 2)⟩ ≤ Equiv.Perm (Fin 5)`, which is `AGL(1,5)` under `Fin 5 = ℤ/5`, since
  `(0 1 3 2)` is `a ↦ 2a + 1`.
- G. Butler and J. McKay, *The transitive groups of degree up to eleven*, Comm. Algebra 11 (1983)
  863-911. The origin of the `T` numbering used for the low-degree table. *Not inspected for
  this pass.* The low-degree entries were compared with the LMFDB.
- J. H. Conway, A. Hulpke, and J. McKay, *On transitive permutation groups*, LMS J. Comput. Math.
  1 (1998) 1-8. Names and properties in degrees up to 15, which is the name column of the LMFDB.
  Context only. This roadmap does not own names of abstract groups.
- B. L. van der Waerden, *Algebra* I, §61, and J.-P. Serre, *Topics in Galois Theory*, 2nd
  edition, A K Peters, 2008. The traditional citations for the three-prime construction of
  Layer 9. *Not inspected for this pass*, and no milestone depends on their wording: Layer 9
  fixes the construction completely, by naming the three reductions it uses — irreducible modulo
  2, factor degrees `(1, n−1)` modulo 3, and one quadratic factor with all other factor degrees
  odd modulo 5 — and by listing all eight prerequisites, each an existence statement over a
  finite field or a group-theoretic step of Layer 1. A source that uses a different triple of
  patterns proves the same theorem by the same four group-theoretic steps; the triple written
  here is the one implementors must use, because the prerequisites are stated for it. Serre's
  material on thin sets, Hilbert irreducibility, and the realization of `Aₙ` is what this roadmap
  places outside its scope.
- H. Cohen, *A Course in Computational Algebraic Number Theory*, GTM 138, Springer, 1993, §6.3.
  The resolvent method and the decision trees in degrees up to 7. *Not inspected for this pass*,
  and no milestone depends on it: the quartic table is grounded in Conrad and Kappe–Warren below,
  the quintic criterion in Dummit below, and the generic resolvent theory is written out in
  Layer 4 with its proof routes. §6.3.2 is the traditional citation for Dedekind's theorem, which
  this roadmap does not prove; its source entry belongs to the supplier.

- K. Conrad, *Galois groups of cubics and quartics (not in characteristic 2)*, expository notes,
  <https://kconrad.math.uconn.edu/blurbs/galoistheory/cubicquartic.pdf>. **Inspected.** The exact
  source for the quartic layer, in the same convention as the roadmap. Definition 3.1 and (3.7):
  the cubic resolvent of `X⁴ + aX³ + bX² + cX + d` is
  `X³ − bX² + (ac − 4d)X − (a²d + c² − 4bd)`, which at `a = 0` is the `resolventCubic p q r` of
  Layer 4. Theorem 3.4: a quartic and its cubic resolvent have the same discriminant, so the
  resolvent of a separable quartic is separable — this is the theorem that makes the quartic
  table need no separation evidence. Theorem 3.6 with Table 4: the four rows of the decision
  table. Corollary 3.8: `V` exactly when the resolvent splits completely, `D₄` or `C₄` exactly
  when it has a unique root in the base field. Example 3.3 is the worked instance `x⁴ + 8x + 12`
  with resolvent `X³ − 48X − 64` and discriminant `576²`, and Example 3.2 is `x⁴ − x − 1`; both
  appear in the acceptance tests above.

- L.-C. Kappe and B. Warren, *An elementary test for the Galois group of a quartic polynomial*,
  Amer. Math. Monthly 96 (1989), 133–137; stated as Theorem 4.1 of Conrad's notes above, which is
  where it was inspected. It separates `C₄` from `D₄` by asking whether `X² + aX + (b − r′)` and
  `X² − r′X + d` split over `K(√Δ)`, where `r′` is the unique base-field root of the resolvent
  cubic. The criterion is equivalent to the one Layer 4 states, `C₄` exactly when `f` becomes
  reducible over `F(√disc f)`, and the roadmap adopts the reducibility form, which mentions no
  choice of `r′`. The two quadratics are not the factors of `f` over `K(√Δ)`: their roots are sums and products
  of paired roots of `f`, and for `X⁴ − 2` they are `X²` and `X² − 2`.
- D. S. Dummit, *Solving solvable quintics*, Math. Comp. 57 (1991) 387-401. **Inspected.** The
  exact source for the quintic invariant and the solvability criterion.

  - §2, p. 388 fixes `F₂₀ < S₅` by the generators `(1 2 3 4 5)` and `(2 3 5 4)`, and states that
    the stabilizer in `S₅` of
    `θ₁ = x₁²x₂x₅ + x₁²x₃x₄ + x₂²x₁x₃ + x₂²x₄x₅ + x₃²x₁x₅ + x₃²x₂x₄ + x₄²x₁x₂ + x₄²x₃x₅ +
    x₅²x₁x₄ + x₅²x₂x₃` is *precisely* `F₂₀`. Under the shift `xⱼ ↦ x_{j−1}`, which turns his
    wrap-around indexing of `{1,…,5}` into `ℤ/5` on `Fin 5`, his `θ₁` is term for term the
    invariant `Σ_a x_a²(x_{a+1}x_{a−1} + x_{a+2}x_{a−2})` of Layer 4, and his two generators
    become `a ↦ a + 1` and `a ↦ 2a`, which generate `AGL(1,5)`, the reference subgroup of `5T3`.
    The same page lists his six conjugates `θ₁, …, θ₆` with the permutations that produce them,
    which is his numbering of the orbit; the roadmap fixes no orbit numbering and does not need
    his.
  - Equations (2) and (2′) are his closed coefficient formulas for the resolvent sextic of a
    depressed quintic. The roadmap does **not** define the sextic by them. It uses (2′), namely
    `f₂₀(x) = x⁶ + 8ax⁵ + 40a²x⁴ + 160a³x³ + 400a⁴x² + (512a⁵ − 3125b⁴)x + (256a⁶ − 9375ab⁴)`
    for `x⁵ + ax + b`, as an acceptance test against the orbit-product definition.
  - Theorem 1, p. 389: an irreducible quintic in `ℚ[x]` is solvable by radicals if and only if
    `f₂₀` has a rational root, and in that case `f₂₀` is a linear factor times an irreducible
    quintic. ⚠ Its proof reads a rational root as "some `θᵢ` is rational, hence the group lies in
    that conjugate of `F₂₀`". The step from a rational **value** to containment in the stabilizer
    of the **polynomial** is exactly where separation evidence enters, and Layer 4's `x⁵ − x`
    shows it fails without it. The roadmap therefore carries the evidence hypothesis that the
    classical statement leaves implicit.
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
