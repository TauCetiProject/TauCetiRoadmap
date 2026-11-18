# Roadmap: Belyi maps, dessins d'enfants, and three-point covers

A Belyi map is a finite cover of the projective line branched over at most `{0, 1, ∞}`. The
subject sits at a crossroads: the covers are classified by finite combinatorial data
(permutation triples, equivalently dessins d'enfants), they are analytic objects (compact
Riemann surfaces with a holomorphic map to the sphere), they are algebraic curves over number
fields (Belyi's theorem), and the absolute Galois group of `ℚ` acts on them faithfully. The
[LMFDB's Belyi section](https://www.lmfdb.org/Belyi/) displays all four faces of each object.

The full programme is recorded below, from the combinatorics up:

- permutation triples, their relabeling classes, passports, and dessins as finite bipartite
  ribbon graphs, with executable enumeration and character-theoretic counts;
- triangle groups and their finite permutation representations;
- the thrice-punctured sphere, its free fundamental group, and the classification of its
  finite covers by triples;
- compactification of those covers to branched covers of the sphere, the complex structure,
  and the analytic Riemann existence theorem for three-point covers;
- algebraic Belyi pairs over a field, the analytic/algebraic comparison over `ℂ`, and Belyi's
  theorem in both directions;
- fields of moduli and fields of definition, the Galois action on dessins, the branch-cycle
  theorem for the profinite fundamental group, the pro-`ℓ` peripheral-power theorem for the Galois
  action, and faithfulness of the Galois action;
- the assertion semantics of LMFDB Belyi-map and passport records.

The pinned Mathlib is favourable on exactly the substrate this roadmap starts from: the
permutation cycle and primitivity theory is deep, covering-space lifting comes with a full
monodromy functor (`IsCoveringMap.monodromyFunctor`), Galois categories come with the
profinite classification theorem (`PreGaloisCategory.functorToContAction` is an equivalence),
the profinite completion of a group exists (`ProfiniteGrp.profiniteCompletion`), and both the
mod-`n` and `ℓ`-adic cyclotomic characters are present (`modularCyclotomicCharacter`,
`cyclotomicCharacter`). What Mathlib does not have: dessins, ribbon graphs, triangle groups,
Riemann surfaces (the pin's only nontrivial complex manifold is `ℍ`), Seifert–van Kampen, the
classification of covering spaces as an equivalence, étale fundamental groups, or any outer
automorphism carrier. Each missing piece is consumed from the roadmap that owns it, by name and
section, as §Boundaries and §What Tau Ceti supplies record.

Suggested homes, mirroring the Mathlib directories that own each notion. The directories are
suggested homes for the code, not extra layers of this roadmap:

```text
TauCeti/Combinatorics/PermutationTriple/   -- Layers 0, 1, 3
TauCeti/Combinatorics/RibbonGraph/         -- Layer 2
TauCeti/GroupTheory/TriangleGroup/         -- Layer 4
TauCeti/GroupTheory/Profinite/             -- generic suppliers owned by ProfiniteProPGroups
                                           -- and by its successor ProfiniteArithmetic
TauCeti/AlgebraicTopology/ThricePuncturedSphere/  -- Layers 5, 6, 7
TauCeti/Topology/Covering/                 -- Layer 7.1
TauCeti/Geometry/RiemannSurface/           -- Layer 8
TauCeti/AlgebraicGeometry/Belyi/           -- Layers 9, 10, 11
TauCeti/NumberTheory/Belyi/                -- Layers 12, 13, 14
```

## Scope, implementation status, and ownership

This roadmap is Layers 0 to 14, and it owns every milestone in them: the finite combinatorics
(Layers 0–4), the thrice-punctured sphere and the classification of its finite covers (5–6),
compactification to topological branched covers (7), compact Riemann surfaces and analytic
Riemann existence (8), algebraic Belyi pairs and the analytic/algebraic comparison (9), Belyi's
theorem (10), fields of moduli and of definition (11), the arithmetic fundamental group and the
branch-cycle theorem (12), the pro-`ℓ` peripheral theorem and faithfulness (13), and the
assertion semantics of LMFDB records (14). What it consumes is consumed by name and section from
the roadmaps §Boundaries names, and nothing of theirs is planned again here.

Tau Ceti implements a large part of it. Each milestone that Tau Ceti implements, in whole or in
part, carries a *Tau Ceti:* line naming the declarations that realize it, at the Tau Ceti
revision §Exact supplier contracts names, and saying which of its items remain. The headline theorems Tau Ceti proves are: the Frobenius product-one formula
(3.2), the passport-size formula (3.4),
the triangle-group trichotomy (4.4, 4.5), the fundamental group of the thrice-punctured sphere
(5.6), the classification of its finite covers (6.3), the classification of topological
branched covers by their unbranched parts (7.7), analytic Riemann existence for three-point
covers (8.6), Belyi's polynomial lemma (10.3), the existence of a Belyi map on a function field
over an algebraic extension of `ℚ` (10.4), and the polynomial form of faithfulness (13.5).
`Suggested.lean` states the headline theorems that remain, as far as the carriers of the Tau Ceti
revision in `lake-manifest.json` make them statable; Layer 13.5 is the one that is, and the
file's docstring names the headlines Tau Ceti proves and, for each of the others, what is
missing.

What remains is:

- in Layers 0–7: Layer 1.6's label semantics in degrees `6` to `11` and the `6T6` group
  certificate of 14.6, both behind the supplier gap
  `gap:transitive-groups-degree-six-to-eleven`; Layer 3.5's comparison of the
  degree-at-most-four table with the database records; in Layer 5, the edge cases and the chart
  description of `D∞*` in 5.1, and the examples, edge cases and general pullback of
  `monodromyHom` in 5.3; in Layer 6, the items 6.2 owns (finiteness of the fiber, functoriality
  of the associated cover with its natural isomorphism and coproducts, the examples and edge
  cases), and in 6.3 naturality in maps of covers, the pullbacks along the four composite
  anharmonic maps, the pointed counts `13, 71, 461`, and the conjugation orbit relation on
  subgroups with its comparison to the supplier's conjugacy predicate; in Layer 7, the items its
  *Tau Ceti:* lines list as remaining;
- in Layers 8–14, every item that no *Tau Ceti:* line names, in particular the comparison of
  analytic and algebraic Belyi pairs (9.4–9.8), the descent of Belyi pairs to `ℚ̄` (10.6, 10.7),
  Weil descent and rigidity (11.4–11.6), the arithmetic fundamental group, its outer Galois
  action and the branch-cycle theorem (12.4–12.12), the Galois-equivariant peripheral theorem
  (13.1–13.4), faithfulness on isomorphism classes of Belyi pairs (13.5), and the certificates of
  Layer 14 that its *Tau Ceti:* lines do not name.

The generic constructions the arithmetic layers need, the profinite integers as a topological
commutative **ring**, profinite exponentiation with its `ℤ_ℓ` comparison, and the continuous
outer-automorphism carrier, are not Belyi mathematics, and are not owned here. Their owner is
[ProfiniteArithmetic](../../Completed/ProfiniteArithmetic/README.md), the generic successor of
ProfiniteProPGroups, and Tau Ceti implements them; Layer 12 records the contract.

No Belyi-local copy of a supplier's object is exported. Where a supplier lacks something this
roadmap needs, the gap is declared under §What Tau Ceti supplies with what the supplier must
provide.

## Prerequisites

Every milestone below lists its direct prerequisites. Each prerequisite is one of four kinds,
and nothing else is allowed:

- **Mathlib.** A declaration that exists in Mathlib at the pin.
- **Tau Ceti.** A declaration that exists in the Tau Ceti code repository.
- **Layer n.m.** An earlier milestone of this roadmap.
- **Roadmap, Layer n.** A named layer of another roadmap in this repository.

A milestone whose supplier provides its input as a prose milestone of that roadmap rather than
a declaration consumes the declaration that milestone produces, by name. No milestone defines a
replacement `fullCycleType`,
transitive-group label, universal-cover class, Seifert–van Kampen theorem,
compact-Riemann-surface API, free profinite group, profinite exponent ring, or
outer-automorphism carrier.

## Boundaries

Eleven roadmaps supply material to this one. The boundaries are stated once here.

There is no dependency on `LocalGaloisGroups`, `ClassFieldTheory` or `PeripheralActions`. The
supply between this roadmap and PeripheralActions runs one way: PeripheralActions consumes from
here the conjugation-transfer lemma `conjugation_transfer` and the word identity
`opposite_third_peripheral`, both self-contained exports of §Pinned conventions, and this roadmap
cites nothing of PeripheralActions. The two roadmaps prove different theorems about the same
free pro-`ℓ` group. PeripheralActions proves, without any Galois action, that a free pro-`p`
group of finite rank has for every unit `u` a continuous automorphism carrying each peripheral
element to a conjugate of its `u`-th power. Layer 13.3 here proves that the outer Galois action
on `Δ_ℓ` is peripheral of exponent `χ_ℓ(σ)`, an arithmetic statement about the image of
`Gal(ℚ̄/ℚ)`; the bare existence statement is a consequence of it by cyclotomic surjectivity,
recorded there as a remark and consumed by nothing. The branch-cycle theorem and the
Galois-equivariant peripheral statements are Belyi-specific; their generic groups, powers, and
outer-automorphism carriers are Tau Ceti's implementations of `ProfiniteProPGroups`, extended by
`ProfiniteArithmetic`.

**Character theory.** Class functions, irreducible characters, the character table, both
orthogonality relations, class sums, structure constants, and central characters belong to
[CharacterTheory](../RepresentationTheory/CharacterTheory/README.md), and Tau Ceti implements
them. This roadmap proves none of them. It consumes, by name, the class sums `TauCeti.classSum`,
the structure constants `TauCeti.structureConstant` with `TauCeti.classSum_mul` (CharacterTheory
Layer 1), the character table `TauCeti.characterTable` with column orthogonality
`TauCeti.card_conjClass_mul_sum_characterTable_mul_characterTable_inv` (its Layer 3.5), and the
central characters `TauCeti.Representation.centralCharacter` (its Layer 4.3). The Frobenius
product-one counting formula, and the character formula for structure constants on the way to
it, are on no roadmap; **this roadmap owns them** (Layer 3.2), together with the inverse-class
operation on `ConjClasses` it needs.

**Universal covers.** The covering-space classification, deck transformation groups, and the
`N(H)/H` deck-group theorem belong to the completed
[UniversalCovers](../../Completed/UniversalCovers/README.md) roadmap (milestones 4, 5, 7, 8
there), and are Tau Ceti declarations. This roadmap consumes them by name and builds no universal
cover. Two conventions from that roadmap bind here: deck groups are identified with `(π₁)ᵐᵒᵖ`
(`TauCeti.UniversalCover.deckFundamentalGroupEquiv`, its milestone 5), and changing the chosen
lift moves the recovered subgroup by conjugation (its milestone 7): along a loop,
`IsCoveringMap.range_mapOfEq_monodromy`; along a path to another basepoint, by
`FundamentalGroup.basepointChangeSubgroup`, `IsCoveringMap.range_mapOfEq_monodromy_path`. The constructive
direction this roadmap needs, a cover of the base built *from* a permutation action, is Layer
6.2's associated cover `(Ũ × S)/π₁`, which is Tau Ceti's
`TauCeti.UniversalCover.ActionCover x₀ S`, the balanced product of the universal cover with an
arbitrary discrete `π₁(X, x₀)`-set. Both halves of its covering property are supplied there: the
class map `Ũ × S → ActionCover x₀ S` is a quotient covering map
(`TauCeti.BalancedProduct.isQuotientCoveringMap_mk`), and the projection to `X`, which is the map
this roadmap needs and which Mathlib's `IsQuotientCoveringMap` alone does not reach, is a covering
map (`TauCeti.UniversalCover.isCoveringMap_actionCoverProj`). What stays here is Belyi-specific:
the finite, transitive case read as a `ConnectedFiberNumberedCover`, and the instantiation at `U`.

**Seifert–van Kampen.** Mathlib has it in no form, and this roadmap builds none of it. The
case the fundamental-group computation needs, two open sets with simply connected
intersection, is general algebraic topology, reusable far beyond three-point covers, so it
belongs to [AlgebraicTopology](../AlgebraicTopology/README.md), whose Stage 1 derives the based
two-open theorem and its group-presentation corollaries from van Kampen for the fundamental
groupoid. Tau Ceti implements it as the general theorem `TauCeti.vanKampenEquiv`
(`TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen.lean`). Layer 5.5 below records exactly
which declarations this roadmap requires of it and under which hypotheses; Layer 5.6
**instantiates** them at the two-set cover of Layer 5.1 and reads off the values on the canonical
generators, and that instantiation is what this roadmap owns. No Belyi-local copy or alias of
the theorem is exported.

**Conformal mapping.** The local theory of holomorphic maps — Rouché, Hurwitz, the local
degree `TauCeti.exists_localDegree`, holomorphic branch roots — belongs to
[ConformalMapping](../../Completed/ConformalMapping/README.md) (its L0), and Layer 8 consumes it for the
local normal form. Nothing here uses the Riemann mapping theorem, Montel, or the boundary
correspondence. The `ℍ/Γ(2) ≅ ℂ∖{0,1}` λ-uniformization is that roadmap family's material
(recorded there as belonging to ModularForms); no layer here consumes or supplies it — the
route to the fundamental group of the thrice-punctured sphere is AlgebraicTopology's two-open van
Kampen theorem, applied to the cover of Layer 5.1, and no retraction onto a figure eight
occurs anywhere in it.

**Compact Riemann surfaces.** The complex-manifold vocabulary and the Riemann sphere belong to
[ComplexManifolds](../ComplexManifolds/README.md). Finite holomorphic maps between compact
Riemann surfaces, their local multiplicity and degree, pullback of divisors, topological genus
and Riemann–Hurwitz belong to [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layer 5,
whose shared module Tau Ceti implements as `TauCeti.RiemannSurface.FiniteHolomorphicMap` and
`TauCeti.RiemannSurface.degree`. The analytic cohomology chain — structure sheaf, sheaves of a
divisor, finiteness of `H¹`, analytic Riemann–Roch, Serre duality by residues, the existence of
nonzero meromorphic sections of line bundles, and the equality of analytic and topological
genus — belongs to [ModularForms](../ModularForms/README.md) §10B for general compact Riemann
surfaces. Layers 8 and 9 consume these by name and export no parallel interface. `X(Γ)`,
modular curves, and everything `q`-expansion-flavoured stay in ModularForms; nothing here
mentions `ℍ`.

**Algebraic curves.** Function fields of one variable, places, divisors, Riemann–Roch,
extensions with ramification and the different, Riemann–Hurwitz, and the regular-projective
model with the curve/function-field anti-equivalence belong to the AlgebraicCurves roadmap —
cited as AlgebraicCurves Layers 0–8 and 12; that roadmap's own contract table names this
roadmap as the consumer of exactly those layers. Layer 9 here consumes them for the algebraic
side of the comparison, through Tau Ceti's carriers `TauCeti.IsFunctionField`, `TauCeti.Place`
and `TauCeti.Divisor`. The analytic comparison over `ℂ` — a compact Riemann surface with a Belyi
function versus the regular projective model of its function field — is excluded there by name
and belongs to this roadmap (Layers 9.4–9.7).

**Polynomial Galois groups.** The full cycle type `fullCycleType`, the transitive-group
reference data `TransitiveGroupIndex`, `referenceSubgroup`, `numTransitiveGroups`, and the
label predicate `TransitiveGroupLabel` belong to the
[PolynomialGaloisGroups](../../Completed/PolynomialGaloisGroups/README.md) roadmap (its Layers 0
and 6), and are Tau Ceti's `Equiv.Perm.fullCycleType`, `TauCeti.TransitiveGroupIndex`,
`TauCeti.referenceSubgroup`, `TauCeti.numTransitiveGroups` and `TauCeti.TransitiveGroupLabel`.
Its Layer 6 supplies the reference family in degrees `1` to `5`, and at the Tau Ceti pin
`numTransitiveGroups n = 0` above degree five. The same family in degrees `6` to `11`, which
Layer 1.6 and the `6T6` record of Layer 14.6 need, is a declared gap of that supplier
(`gap:transitive-groups-degree-six-to-eleven`, §What Tau Ceti supplies); this roadmap adds no
second family. Layer 1 here consumes them for LMFDB label semantics and adds no second `nTj`
predicate and no second cycle-type-with-fixed-points definition. Blocks, primitivity, and transitivity are
always Mathlib's `MulAction.IsBlock`, `MulAction.IsPreprimitive`, `MulAction.IsPretransitive`,
as there.

**Profinite and pro-p groups.** The free profinite group on a finite set, the maximal pro-`p`
quotient with its universal property and the characteristicity of its kernel under continuous
automorphisms, the free pro-`p` group, and the profinite integers `ẑ` as a profinite group with
their maximal pro-`p` quotients are specified by the ProfiniteProPGroups roadmap (its Layers 3 and
4) and implemented in Tau Ceti: `TauCeti.freeProfiniteGroup` with `.of` and `.lift`,
`TauCeti.proPKernel`, `TauCeti.maximalProPQuotient` with `.lift`, `TauCeti.map_proPKernel_eq`,
`TauCeti.freeProP` with `.of` and `.lift`, and `TauCeti.zHat` with
`TauCeti.zHat.maximalProPQuotientEquivPadicInt`. The **ring** structure on `ẑ`, which lives on
Tau Ceti's own `TauCeti.zHat` (as `Additive TauCeti.zHat`), profinite exponentiation
`x ^ᶻ a = TauCeti.zHat.lift x a` with its `ℤ_ℓ` comparison, and the continuous
outer-automorphism carrier are owned by
[ProfiniteArithmetic](../../Completed/ProfiniteArithmetic/README.md), the generic successor of
[ProfiniteProPGroups](../../Completed/ProfiniteProPGroups/README.md), and are implemented in Tau
Ceti. Neither set is owned or exported by the Belyi namespace, and neither has a second carrier
anywhere. Layers 12 and 13 consume these exact public names for the cyclotomic and peripheral
applications.

AlgebraicCurves lives at [`../AlgebraicCurves/README.md`](../AlgebraicCurves/README.md).

What this roadmap supplies to other subjects:

- the Frobenius product-one formula and generating-triple counts (Layer 3), usable by any
  subject that counts covers or factorizations in finite groups;
- finite bipartite ribbon graphs (Layer 2), reusable for maps and hypermaps on surfaces;
- triangle groups (Layer 4);
- the Belyi-specific analytic/algebraic comparison (Layer 9);
- the branch-cycle theorem and the pro-`ℓ` peripheral-power theorem for the Galois action
  (Layers 12, 13), the Belyi-specific arithmetic application of `ProfiniteArithmetic`'s generic
  infrastructure;
- the conjugation-transfer lemma and the third-peripheral word identity of §Pinned conventions,
  consumed by PeripheralActions.

## Internal boundaries

The roadmap's fifteen layers group into three sections with clean
contracts between them, so that a reader can decide in one step which section owns a result.
Each contract lists what the section exports and what it imports; nothing crosses a boundary
except through these lists.

**A. Finite combinatorics — Layers 0–4.**
*Exports:* `PermutationTriple` with its relabeling action, `IsoClass`,
`ConnectedTriple` and `ConnectedIsoClass`;
`monodromyGroup`, `automorphismGroup` with `automorphismGroup_smul`, `orderTriple`,
`GeometryType`; `BipartiteRibbonGraph`; all six branch-point operations `swap01`, `swap1Inf`,
`swap0Inf`, `rot`, `rotInv` with their composite identities and their preservation of
connectedness; and `TriangleGroup`;
full cycle data, `eulerChar`, `genus`;
`PassportSpec` with `HasPassport`, `passportOf`, `passportSize`; blocks,
quotient triples and supplier-backed primitivity refinements; the dessin/triple equivalence; the
branch-point `S₃`-action on ordered passports; the executable
enumeration and the small complete tables; the Frobenius product-one formula, generating
counts and the normalizer counting formula; `TriangleGroup` with its trichotomy.
*Imports:* Mathlib permutations, group actions, free and presented groups;
PolynomialGaloisGroups' `fullCycleType` and transitive-group data; CharacterTheory's class
sums, structure constants, character table and central characters. **Nothing topological.**

**B. Topology and geometry — Layers 5–11.**
*Exports:* `U` with its two-set cover, its six anharmonic self-homeomorphisms, peripheral loops
and `π₁(U, b) ≃* FreeGroup (Fin 2)`; the three cover carriers (`ConnectedFiberNumberedCover`,
`ConnectedPointedCover`, `ConnectedCover`), their quotient carriers, the forgetful maps between
them, `MarkedIsoClass` and their three classifications; the pullback action realizing the
branch-point `S₃`-action topologically; `FilledCover`
and `TopBranchedCover`; the compact-Riemann-surface hypothesis stack, the Riemann sphere,
`ramificationIndex`, `AnalyticBelyiPair`; `M(X)` with the points-to-places bijection;
`AlgebraicBelyiPair` with its local `(e,f)` data; the local algebraic-to-analytic comparison
and the comparison contract; Belyi's theorem in both directions; fields of moduli and of
definition, Weil descent, and `trueOrbitSize`.
*Imports:* from A, exactly

```text
0.1–0.6, 0.8   triple vocabulary and the threaded examples   6.1, 7.x, 8.x
2.1, 2.2, 2.4, 2.6   dessins and the S₃-action              6.3, 7.6, 8.6, 8.7, 9.1
3.1            the executable enumeration                   10.6
4.6            the normality criterion                      6.5
```

and nothing else; UniversalCovers; AlgebraicTopology Stage 1; ConformalMapping L0;
ComplexManifolds; FuchsianOrbifolds Layer 5; ModularForms §10B; AlgebraicCurves. ⚠ `4.6` belongs on this list: Layer 6.5 classifies regular covers by
normality of the point stabilizer, which is Layer 4.6's criterion, so section B is not
independent of Layer 4.

**C. Arithmetic and database semantics — Layers 12–14.**
*Consumes from `ProfiniteArithmetic`:* the ring structure on `TauCeti.zHat`, the profinite
exponentiation calculus through `TauCeti.zHat.lift` and its pro-`ℓ` comparison, and continuous
outer automorphisms.
*Consumes from Tau Ceti, which implements `ProfiniteProPGroups`:* free profinite and free
pro-`p` groups (`TauCeti.freeProfiniteGroup`, `TauCeti.freeProP`), the maximal pro-`p` quotient
(`TauCeti.maximalProPQuotient`), and `TauCeti.zHat.maximalProPQuotientEquivPadicInt`.
*Belyi-specific exports:* `π₁ᵍᵉᵒ` and the comparison isomorphism with its
orientation; the arithmetic exact sequence and outer action; peripheral inertia; the
`ẑ`-cyclotomic character; the branch-cycle theorem and its finite Nielsen-class corollary;
the Galois-equivariant pro-`ℓ` peripheral-power theorem and its dyadic instance;
faithfulness; the LMFDB record certificates.
*Imports:*

```text
from A   0.1, 0.4–0.7, 1.1–1.6, 2.6, 3.4, 3.5
from B   5.6, 6.1, 6.3, 7.1, 8.7, 9.1, 9.1C, 9.5–9.8, 10.2, 10.3, 10.7,
         11.1, 11.3, 11.5, 11.7
```

plus Tau Ceti's implementation of ProfiniteProPGroups, ProfiniteArithmetic, and Mathlib's Galois
categories and cyclotomic characters.

⚠ The boundary between B and C is **not** the boundary between geometry and arithmetic:
Layers 10 and 11 are already arithmetic, and they sit in B because they consume the analytic
classification and are consumed by C through a small, listed interface. Milestones 12.1–12.3
sit in C but import nothing from A or B at all.

## Pinned conventions

Implementors make no choices about any of the following. Each is fixed here once, and every
layer uses it.

**Multiplication and composition.** Mathlib's `Equiv.Perm` multiplies by function
composition: `(σ * τ) x = σ (τ x)`. Mathlib's `End`/`Aut` monoids in a category do the same
(`End.mul_def : f * g = g ≫ f`), so in `FundamentalGroup X x` the product `γ * δ` is the
homotopy class of "`δ` first, then `γ`". Path concatenation `γ.trans δ` is "`γ` first". The
pin's monodromy is covariant for concatenation:
`monodromy (γ.trans δ) = monodromy δ ∘ monodromy γ` (`IsCoveringMap.monodromy_trans_apply`).
Consequently the fiber monodromy `μ : FundamentalGroup X x →* Equiv.Perm (p ⁻¹' {x})` of
Layer 6.1 is a genuine monoid homomorphism, with no `ᵐᵒᵖ` and no inversion.

**The product relation.** A permutation triple stores `σ0`, `σ1`, `σinf` with the one
relation

```text
σinf * σ1 * σ0 = 1
```

in Mathlib's multiplication. Geometrically: the concatenated loop "`γ0`, then `γ1`, then
`γ∞`" is nullhomotopic, and `μ` turns that into the displayed relation (Layers 5.2, 6.1).

⚠ **A displayed relation means nothing without a composition order, and the LMFDB's display
is not this relation.** The LMFDB's knowl shows `σ_∞ σ_1 σ_0 = 1`, typographically the
relation above; but the stored triples are computed left-to-right, so as *functions* they
satisfy `σ0 ∘ σ1 ∘ σinf = id`, which in Mathlib's multiplication is `σ0 * σ1 * σinf = 1` —
the **opposite** relation. The record `3T2-3_2.1_2.1-a` is the check: it stores
`(1,2,3)`, `(2,3)`, `(1,2)`, which `0`-indexed are `finRotate 3`, `swap 1 2`, `swap 0 1`, and
their product in the order `σ0 * σ1 * σinf` is `1` while the product `σinf * σ1 * σ0` is not.
The two conventions differ by the componentwise-inversion involution of Layer 0.1, and Layer
14.2 states that translation as a theorem about the stored data.

⚠ The rival convention also produces a *different* third permutation: `(σ1·σ0)⁻¹` versus
`(σ0·σ1)⁻¹`. The two are conjugate (by `σ0`), so the partition at `∞` is the same and the
passport cannot detect the error; what changes is the triple, and with it the isomorphism
class. In degree `5`, `a = (1 2)(3 4)` and `b = (0 1 2 3)` give the triple `(a, b, (b·a)⁻¹)`,
read without the involution, and the correctly translated `(a⁻¹, b⁻¹, a·b)`: the three cycle
partitions agree (`[2,2,1]`, `[4,1]`, `[4,1]`), and no permutation conjugates the one triple
simultaneously into the other. Every source citation in this roadmap records the source's
composition order. The worked example `z ↦ z²` pins the reading here: `σ0 = σinf = (0 1)`,
`σ1 = 1`.

**Ordered branch points.** The branch points are ordered `0, 1, ∞`, in every triple,
passport, and label. The action of permuting the three branch points is the explicit API of
Layer 2.6, never an implicit identification.

**Relabeling.** Relabeling is the left action of `Equiv.Perm (Fin n)` by simultaneous
conjugation, `τ • (σ0, σ1, σinf) = (τσ0τ⁻¹, τσ1τ⁻¹, τσinfτ⁻¹)`, packaged as a `MulAction`.
Isomorphism of triples is membership in one orbit — simultaneous conjugacy, never
componentwise conjugacy by three unrelated elements. Conjugating a subgroup is spelled
`Subgroup.map (MulAut.conj τ).toMonoidHom`, as in PolynomialGaloisGroups.

**Cycle data.** Cycle partitions always include fixed points: the partition attached to `σ`
is PolynomialGaloisGroups' `fullCycleType σ`, a multiset partition of `n`.
⚠ Mathlib's bare `Equiv.Perm.cycleType` omits parts equal to `1` and is never compared with a
partition of `n`; the pin's `Equiv.Perm.partition` is the bundled form, with a comparison
lemma in Layer 0.5.

**Monodromy group and connectedness.** The monodromy group of a triple is
`Subgroup.closure {σ0, σ1}`; the relation puts `σinf` in it. A triple is *connected* when
`n ≠ 0` and the monodromy group acts pretransitively on `Fin n`.
⚠ `MulAction.IsPretransitive` is vacuously true on the empty type, and the genus formula is
false for `n = 0`; the `n ≠ 0` clause is part of the definition, not a convenience.

**Euler characteristic and genus.** The Euler characteristic of a degree-`n` triple is the
integer `χ(t) = c(σ0) + c(σ1) + c(σinf) − n`, where `c` counts cycles including fixed
points. For connected triples, Layer 0.6 proves `χ(t) ≤ 2` and `2 − χ(t)` even *before* the
natural-number genus `g`, with `2 − 2g = χ(t)`, is defined. No milestone states a genus
through unchecked `Nat` subtraction or `Int.toNat`.

**Orders and geometry type.** `(a, b, c) := (orderOf σ0, orderOf σ1, orderOf σinf)`; the
identity has order `1`. The geometry type is spherical, Euclidean, or hyperbolic according as
`1/a + 1/b + 1/c` is greater than, equal to, or less than `1`, compared exactly in `ℚ`.

**Dessins.** A dessin is a connected finite bipartite ribbon graph — a genuine carrier with
edge and vertex types, incidence maps, and cyclic orders typed as permutations that are
`Equiv.Perm.IsCycleOn` each vertex fiber — never a definitional alias for a triple. The
equivalence with triples is the theorem pair of Layers 2.2–2.4.

**Passports.** A passport records a degree, a transitive subgroup of `S_n` up to conjugacy
(carried as a reference subgroup plus the conjugacy predicate, as in
PolynomialGaloisGroups), and the ordered full cycle partitions at `0`, `1`, `∞`. A passport
class is a simultaneous-conjugacy class of connected triples with those invariants. A
passport is not a Galois orbit; one passport can contain several orbits, and the orbit letter
in an LMFDB label is a database enumeration, not an invariant.
⚠ For a fixed embedded monodromy group `G ≤ S_n`, the group acting on generating triples is
the normalizer `N_{S_n}(G)`, not `G` itself (Layer 1.3); no counting milestone conflates the
two, and none identifies a raw Frobenius count with a passport size.

**Primitivity.** Primitive means Mathlib's `MulAction.IsPreprimitive` for the monodromy
action. Block systems, quotient triples, and imprimitivity are Layer 1.4; nothing asserts a
canonical primitivization (Layer 14 encodes the LMFDB's `primitivization` field as a
certificate carrying its block system).

**Riemann surfaces.** "Compact Riemann surface" is the unbundled hypothesis stack of
Layer 8.1 over the pin's manifold vocabulary (`IsManifold 𝓘(ℂ) ω X`, plus compactness,
connectedness, and the separation instances), with the Riemann sphere carried by
`OnePoint ℂ`. Holomorphy of maps is the pin's manifold differentiability at analyticity
exponent `ω`. No private "Riemann surface" structure is introduced.

**Algebraic Belyi pairs.** Over a field `k` **of characteristic zero**, the primary carrier
is function-field-first, matching AlgebraicCurves: a function field `F/k` with exact
constants (`IsIntegrallyClosedIn k F`) together with a finite `k`-embedding `k(t) ↪ F`
unramified outside the three places `t = 0`, `t = 1`, `t = ∞` of `k(t)`. ⚠ Separability is
**derived, not assumed**: Layer 9.1 carries `[CharZero k]` on the carrier and every finite
extension in characteristic zero is separable, so a hypothesis of separability here would
duplicate it and suggest the carrier is more general than it is. The
morphism-of-curves form is the corollary through AlgebraicCurves Layer 12, not a second
definition. "Branch locus contained in `{0,1,∞}`" is containment — a Belyi map may be
unramified over any of the three points.

**Analytic Belyi pairs.** Over `ℂ`: a compact Riemann surface with a nonconstant holomorphic
map to the sphere whose branch values lie in `{0, 1, ∞}`. The analytic and algebraic
definitions are related by the comparison theorems of Layer 9, never identified
definitionally.

**Fields of moduli and definition.** The field of moduli is the fixed field of the stabilizer
of the isomorphism class under `Gal(ℚ̄/ℚ)`. A field of definition carries a model and a
base-change isomorphism. They can differ (Layer 11.6); no milestone treats them as equal.

**The Galois action is outer.** The action of `Gal(ℚ̄/ℚ)` on the profinite fundamental group
is an outer action, because basepoints and comparison paths are not canonical. Peripheral
statements are stated first on conjugacy classes or in outer form; automorphism
representatives are chosen only where a theorem says one exists (Layer 13.3).

**Peripheral elements.** In the profinite completion `F̂₂` of `FreeGroup (Fin 2)`, Tau Ceti's
`TauCeti.freeProfiniteGroup (Fin 2)`:
`P` and `T` are the images of the two generators `of 0`, `of 1`, and `C := (T * P)⁻¹`, so
that

```text
C * T * P = 1
```

— the profinite image of the Layer 5 relation, in the same display order as the triple
relation. Their images in the maximal pro-`ℓ` quotient keep the same names with a `ℓ`
subscript. ⚠ A source that writes `P·T·C = 1` (composition left-to-right) names as its third
peripheral element the *conjugate*

```text
(P · T)⁻¹ = T⁻¹ · P⁻¹ = P · C · P⁻¹ ,
```

and **not** `P⁻¹ · C · P`. This word identity, stated in an arbitrary group, is
`opposite_third_peripheral`. The peripheral-power theorems of Layer 13 transfer along it by the
conjugation-transfer lemma below, whose conjugator is computed rather than guessed.

**The conjugation-transfer lemma.** Let `φ` be an automorphism of a group `G` and `pow : G → G`
a map that commutes with conjugation, `pow (q · x · q⁻¹) = q · pow x · q⁻¹`. If

```text
φ x = c⁻¹ · pow x · c ,
```

then for any conjugate `y = q · x · q⁻¹`,

```text
φ y = d⁻¹ · pow y · d   with   d := q · c · (φ q)⁻¹ .
```

The proof is `φ y = (φ q)(φ x)(φ q)⁻¹`, then the hypothesis on `pow`. ⚠ The conjugator is
*computed*: it involves `φ q`, and is **not** obtained by multiplying `c` by `q` on one side. This
is `conjugation_transfer`, stated generically because that is all the proof uses; each
application supplies the hypothesis on `pow` from the naturality of its power under conjugation
(Layer 12.2 here). It and `opposite_third_peripheral` are self-contained exports of this section:
neither depends on Layers 12 and 13 or on `PeripheralActions`, which consumes both. Both mention
no Belyi object: Tau Ceti implements the lemma, for any endomorphism, as
`TauCeti.map_conj_eq_conj_of_map_eq_conj` in `TauCeti/GroupTheory/ConjugationTransfer.lean`.

**Profinite powers.** Powers `x ^ᶻ a` by `a ∈ ẑ` are the canonical operation of Layer 12.2,
defined through the universal property of the profinite completion of `ℤ`; powers by
`u ∈ ℤ_ℓ` on a pro-`ℓ` group factor through the `ℓ`-adic component, and the comparison is a
theorem (Layer 12.3), not a definition. No milestone raises a profinite element to an
"integer representative" power.

**The absolute Galois group and the cyclotomic character.** `Gal(ℚ̄/ℚ)` is the pin's
`Field.absoluteGaloisGroup ℚ` with `ℚ̄ = AlgebraicClosure ℚ` fixed once. The cyclotomic
characters are the pin's `modularCyclotomicCharacter n` and `cyclotomicCharacter ℓ`, whose
defining convention is `g ζ = ζ ^ χ(g)` on `n`-th (respectively `ℓ`-power) roots of unity.
The branch-cycle exponent in Layer 12.11 is `χ(σ)` in exactly this normalization; the
milestone states the finite-level `ζ_n` identity explicitly so that a sign or inverse error
cannot hide in prose. ⚠ Sources using the geometric (inverse) convention for the Galois
action on covers state the theorem with `χ(σ)⁻¹`; each citation records the source's
convention.

## What Mathlib supplies

The load-bearing imports, against the Mathlib revision pinned in `lake-manifest.json`:

| Area | Declarations |
| --- | --- |
| Permutations | `Equiv.Perm.cycleType`, `cycleFactorsFinset`, `support`, `Equiv.Perm.partition`, `isConj_iff_cycleType_eq`, `Equiv.Perm.sign`, `IsCycleOn`, `Equiv.Perm.exists_with_cycleType_iff` |
| Actions | `MulAction.IsPretransitive`, `IsBlock`, `IsBlockSystem`, `IsPreprimitive`, `isCoatom_stabilizer_iff_preprimitive`, `ConjAct`, `MulAction.stabilizer`, orbit–stabilizer, Burnside `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group` |
| Jordan theorems | `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem`, `alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem` |
| Free groups | `FreeGroup`, `FreeGroup.lift`, `IsFreeGroup`, `FreeGroupBasis`, `PresentedGroup`, `PresentedGroup.toGroup`, Nielsen–Schreier |
| Topology | `FundamentalGroup`, `FundamentalGroupoid`, `Path`, `IsCoveringMap` (`Topology/Covering/Basic.lean`), `IsQuotientCoveringMap`, `liftPath`, `liftHomotopy`, `IsCoveringMap.monodromy`, `IsCoveringMap.fundamentalGroupMulAction`, `IsCoveringMap.monodromyPerm`, `monodromyFunctor`, `monodromy_trans_apply`, `injective_path_homotopic_map`, the lifting criterion `existsUnique_continuousMap_lifts_of_range_le`, `LocallyPathConnectedSpace`, `deck` (`Topology/Covering/Deck.lean`), `IsAddQuotientCoveringMap.fundamentalGroupEquiv`, `FundamentalGroup.fundamentalGroupMulEquivOfPath`, `isCoveringMap_exp`, `isCoveringMapOn_zpow` |
| Galois categories | `PreGaloisCategory`, `FiberFunctor`, the profinite topology on `Aut F`, `IsGalois` objects, `functorToContAction` with `IsEquivalence`, `IsFundamentalGroup` with `toAutMulEquiv` and `toAutMulEquiv_isHomeomorph` |
| Profinite | `ProfiniteGrp`, `ProfiniteGrp.profiniteCompletion` with `eta`, `lift`, adjunction; `ContinuousMulEquiv` (`≃ₜ*`); `PadicInt` |
| Arithmetic | `Field.absoluteGaloisGroup`, Krull topology, `AlgebraicClosure`, `modularCyclotomicCharacter`, `cyclotomicCharacter`, cyclotomic polynomials irreducible over `ℚ`, `IsPrimitiveRoot` |
| Complex analysis | `analyticOrderAt`, `MeromorphicAt/On`, `MeromorphicNFAt`, open mapping, identity theorem, `TendstoLocallyUniformlyOn`, `OnePoint ℂ` with `OnePoint.equivProjectivization` and the `GL(2)` Möbius action |
| Manifolds | `IsManifold 𝓘(ℂ) ω`, `MDifferentiable`, `Mathlib/Geometry/Manifold/Complex.lean` (maximum principle) |

Notable absences at the pin, so that nobody searches for them: any `SemilocallySimplyConnected`
(the class is Tau Ceti's `TauCeti.SemilocallySimplyConnectedSpace`, from UniversalCovers), Seifert–van Kampen in any topological form, `ẑ`, `Out G`,
étale fundamental groups, Riemann surfaces, Riemann–Roch, Riemann–Hurwitz, divisors on
schemes, and any ribbon-graph or triangle-group object.

## What Tau Ceti supplies

Every consumed theorem that exists at the pin gets its exact name, so that an implementer knows
what to `apply`. The table distinguishes exact declarations from supplier milestones that are
prose in their roadmap, and no supplier's object has a local copy here.

| Consumer | Supplier | Object | Exact name, or local interface signature |
| --- | --- | --- | --- |
| 0.5, 1.1 | `PolynomialGaloisGroups` Layer 0 | cycle type with fixed points | `Equiv.Perm.fullCycleType`, computed by `Equiv.Perm.computedCycleType` (`Equiv.Perm.computedCycleType_eq_fullCycleType`) |
| 1.6, 14.1, 14.5 | `PolynomialGaloisGroups` Layer 6 | the transitive reference family and label predicate in degrees `1` to `5` | `TauCeti.numTransitiveGroups`, `TauCeti.TransitiveGroupIndex`, `TauCeti.referenceSubgroup`, `TauCeti.TransitiveGroupLabel`; `numTransitiveGroups n = 0` for `n > 5` at the pin, and degrees `6` to `11` are the gap below |
| 3.2 | CharacterTheory Layer 1 | class sums and structure constants | `TauCeti.classSum`, `TauCeti.structureConstant`, `TauCeti.classSum_mul` |
| 3.2 | CharacterTheory Layer 3 | the character table and column orthogonality | `TauCeti.characterTable`, `TauCeti.card_conjClass_mul_sum_characterTable_mul_characterTable_inv` |
| 3.2 | CharacterTheory Layer 4 | central characters, and the conversion to class sizes | `TauCeti.Representation.centralCharacter`; the character formula for structure constants that the conversion feeds is proved directly as `TauCeti.structureConstant_eq_sum_characterTable` |
| 5.1, 6.2 | UniversalCovers milestone 2 | semilocal simple connectivity | `TauCeti.SemilocallySimplyConnectedSpace` (`TauCeti/AlgebraicTopology/SemilocallySimplyConnected/Basic.lean`); no local copy is exported |
| 5.6 | AlgebraicTopology Stage 1 | Seifert–van Kampen for two open sets with simply connected intersection | `TauCeti.vanKampenLift`, `TauCeti.vanKampenLift_bijective`, `TauCeti.vanKampenEquiv` and `TauCeti.vanKampenEquiv_toMonoidHom` (`TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen.lean`), with the hypotheses of Layer 5.5. This roadmap exports no copy: Layer 5.6 is the instantiation, not the theorem. |
| 5.7, 6.3 | UniversalCovers milestone 7 | basepoint change on subgroups, and the recovered subgroup under a change of lift | `FundamentalGroup.basepointChangeSubgroup` (conjugation of a subgroup along a path); `IsCoveringMap.range_mapOfEq_monodromy` (moving the lift along a loop conjugates the recovered subgroup); `IsCoveringMap.range_mapOfEq_monodromy_path` (moving it along a path applies `basepointChangeSubgroup`) |
| 6.2 | UniversalCovers milestones 2, 3 | the universal cover, its covering map, and the free properly discontinuous `π₁`-action | `TauCeti.UniversalCover x₀`, `TauCeti.UniversalCover.proj`, `TauCeti.UniversalCover.isCoveringMap`, `TauCeti.UniversalCover.simplyConnectedSpace`, `TauCeti.UniversalCover.isQuotientCoveringMap` |
| 6.2 | UniversalCovers milestone 8 | the associated cover of an arbitrary discrete `π₁`-set, its covering map, its fiber and its monodromy | `TauCeti.UniversalCover.ActionCover x₀ A`, `TauCeti.UniversalCover.actionCoverProj`, `TauCeti.UniversalCover.isCoveringMap_actionCoverProj`, `TauCeti.UniversalCover.actionCoverFiberEquiv : A ≃ actionCoverProj x₀ A ⁻¹' {x₀}`, `TauCeti.UniversalCover.monodromy_actionCoverFiberEquiv`, `TauCeti.BalancedProduct.isQuotientCoveringMap_mk`; bundled, `TauCeti.UniversalCover.actionCoveringSpace` with `actionCoveringSpaceFiberEquiv` and `actionCoveringSpaceFiberEquiv_apply_monodromy`; as equivalences of categories, `TauCeti.CoveringSpace.fiberActionEquivalence` and `TauCeti.ConnectedCoveringSpace.transitiveFiberActionEquivalence` |
| 6.3 | UniversalCovers milestone 8 | the pointed and unpointed subgroup correspondences, and sheet number as index | `TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`, `TauCeti.UniversalCover.exists_homeomorph_subgroupQuotient_comp_eq_iff_exists_eq_map_conj`, `IsCoveringMap.stabilizer_eq_range`, `IsCoveringMap.card_fiber_eq_index` |
| 6.4 | UniversalCovers milestones 4, 5 | deck groups, and deck group of the universal cover `≃* (π₁)ᵐᵒᵖ` | Mathlib's `deck p : Subgroup (E ≃ₜ E)`; `TauCeti.UniversalCover.deckFundamentalGroupEquiv x₀ : deck proj ≃* (FundamentalGroup X x₀)ᵐᵒᵖ`, and for any regular simply connected cover `TauCeti.Deck.IsRegular.deckFundamentalGroupEquiv` |
| 6.5 | UniversalCovers milestone 8 | regular covers, and the deck groups `N(H)/H` and `π₁/H` | `TauCeti.Deck.isRegular_iff_fiber_isPretransitive`, `TauCeti.UniversalCover.isRegular_subgroupQuotientProj_iff_normal`, `TauCeti.UniversalCover.deckSubgroupQuotientProjEquiv`, `TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal` |
| 8.2 | ConformalMapping L0 | the local degree of a holomorphic map | `TauCeti.exists_localDegree`, and the holomorphic branch-root extraction beside it |
| 8.1–8.3 | ComplexManifolds; FuchsianOrbifolds Layer 5 | the Riemann sphere as a complex manifold, finite holomorphic maps, local multiplicity, degree, branch values, Riemann–Hurwitz | `OnePoint.instChartedSpace` and the `IsManifold 𝓘(ℂ) ω (OnePoint ℂ)` instance, `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.localMultiplicity`, `TauCeti.RiemannSurface.degree`, `TauCeti.RiemannSurface.degree_eq_fiber_sum`, `TauCeti.RiemannSurface.FiniteHolomorphicMap.branchValues`; Riemann–Hurwitz is FuchsianOrbifolds Layer 5 item 3, with no Tau Ceti declaration at the pin |
| 9.2–9.4, 10.7, 11.4 | ModularForms §10B | analytic cohomology, analytic Riemann–Roch, Serre duality, equality of analytic and topological genus | prose milestones of that roadmap; no Tau Ceti declaration at the pin |
| 9.1, 9.4, 9.6 | `AlgebraicCurves` Layers 0, 1 | function fields, places, and divisors | `TauCeti.IsFunctionField`, Mathlib's `IsIntegrallyClosedIn`, `TauCeti.Place`, `TauCeti.Divisor` |
| 9.1, 9.4, 9.6 | `AlgebraicCurves` Layer 6 | ramification index, residue degree, and the fundamental identity | `TauCeti.Place.ramificationIdx`, `TauCeti.Place.relativeDegree`; the fundamental identity as that layer states it |
| 9.5, 10.7, 11.4 | `AlgebraicCurves` Layer 5 | Riemann–Roch and genus | `TauCeti.riemannRochSpace`, `TauCeti.genus` |
| 9.1, 9.1C, 10.6, 10.7, 11.4, 12.4 | `AlgebraicCurves` Layer 8 item 2 and Layer 12, items 12B.0a, 12B.0b and 12B.0d | regular constant extension: for every extension `K/k` the fraction field of `K ⊗[k] F` and its comparison with `K(t) ⊗[k(t)] F` for a separating `t`; relative algebraic closure of `F` in `Frac(F ⊗[k] K)` when `k` is algebraically closed; smooth geometrically integral models and their base change; preservation of every geometric ramification index and of the branch locus under extension of algebraically closed characteristic-zero constants; descent of finitely many finite models to a finitely generated subfield | the named items of that roadmap as they are written there; algebraic constant extension alone (its Layer 8 package from Stichtenoth III.6) is not used for `ℚ̄ ⊂ ℂ`, and no genus criterion is used to infer regularity |
| 9.1, 9.5 | `AlgebraicCurves` Layer 12 | the regular projective model and the anti-equivalence | prose milestones of that roadmap; **this roadmap never analytifies a scheme** — Layer 9.6 works with places, so only the place set and its `(e,f)` data are consumed, never a scheme-theoretic fiber |
| 12.7, 13.1 | Tau Ceti | free profinite and free pro-`p` groups, the maximal pro-`p` quotient, and the maximal pro-`ℓ` quotient of `ẑ`, as `ProfiniteProPGroups` Layers 3 and 4 specify them | exact declarations: `TauCeti.freeProfiniteGroup`, `TauCeti.freeProfiniteGroup.of`, `TauCeti.freeProP`, `TauCeti.freeProP.of`, `TauCeti.freeProP.lift`, `TauCeti.proPKernel`, `TauCeti.map_proPKernel_eq`, `TauCeti.maximalProPQuotient`, `TauCeti.zHat.maximalProPQuotientEquivPadicInt`; this roadmap exports no aliases or copies. |
| 12.1–12.3 | `ProfiniteArithmetic`, the generic successor of `ProfiniteProPGroups` | the ring structure on Tau Ceti's `TauCeti.zHat`, the `ẑ`-power `x ^ᶻ a = TauCeti.zHat.lift x a` with its `ℤ_ℓ` comparison, and the continuous outer-automorphism carrier | implemented in Tau Ceti: the projections `TauCeti.zHat.toZMod` at positive moduli `n : ℕ+`, their compatibility `TauCeti.zHat.castHom_comp_toZMod`, the assembly `TauCeti.zHat.ringLift`, and the powers `TauCeti.zHat.lift`; these are generic group theory, not Belyi mathematics, and no alias or copy is exported here. |

What PolynomialGaloisGroups must provide (gap:transitive-groups-degree-six-to-eleven): the same
family `TauCeti.numTransitiveGroups`, `TauCeti.TransitiveGroupIndex`, `TauCeti.referenceSubgroup`,
`TauCeti.TransitiveGroupLabel` extended through degree `11`, with one proved generator row per
conjugacy class of transitive subgroups (the counts are `16, 7, 50, 34, 45, 8` in degrees `6` to
`11`), completeness of the list up to conjugacy in `S_n`, and the values in degrees `1` to `5`
unchanged.

Every row naming a Tau Ceti declaration, and every *Tau Ceti:* line of a milestone, names
declarations that exist at Tau Ceti revision `2fd255d997f4`, with Mathlib revision
`1b1ccf4b088b`: the revisions pinned by `lake-manifest.json` on this repository's main branch. A
consumer fails on a spelling or carrier change rather than selecting a local replacement. The rows whose
right-hand column is a prose milestone of a named roadmap (analytic cohomology in ModularForms
§10B, Riemann–Hurwitz in FuchsianOrbifolds Layer 5, the regular model in AlgebraicCurves Layer
12) cite that roadmap's section and claim no declaration. The `ProfiniteArithmetic` row is the
one owner of the three generic constructions it names.

## The build, in layers

The fifteen layers are a dependency order: every milestone rests on Mathlib, on Tau Ceti, on
an earlier layer, or on a cited layer of a named roadmap, and there are no forward
references. Layers 0–4 are pure finite mathematics and are startable immediately — but they
form a **chain**, not four independent pieces; Layers 5–8 are topology and analysis; Layers
9–11 are algebraic geometry over `ℂ` and `ℚ̄`; Layers 12–13 are the arithmetic summit; Layer
14 is the LMFDB interface. The §Ordering section records what genuinely runs in parallel,
derived from the per-milestone prerequisite lines rather than asserted alongside them.

`Suggested.lean` is the roadmap's acceptance test: it states with `sorry` each remaining headline
theorem that Mathlib and Tau Ceti make statable at the revisions `lake-manifest.json` pins, and
declares the two §Pinned conventions lemmas PeripheralActions consumes; its docstring lists the
headline theorems Tau Ceti proves and, for those it does not state, what is missing. Layer 13.5
is the one remaining headline with a native statement, `FaithfulSMul` of
`AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ` on
`TauCeti.AlgebraicBelyiPair.IsoClass (AlgebraicClosure ℚ)`; the file states it as
`faithfulSMul_absoluteGaloisGroup_isoClass` and imports
`TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction` for the action.

### Layer 0: permutation triples

#### 0.1 The carrier

Define the structure of degree-`n` permutation triples:

```lean
structure PermutationTriple (n : ℕ) where
  σ0   : Equiv.Perm (Fin n)
  σ1   : Equiv.Perm (Fin n)
  σinf : Equiv.Perm (Fin n)
  product_eq_one : σinf * σ1 * σ0 = 1
```

**New object: `PermutationTriple`.** Basic API:

- *Constructors and instances.* `ofTwo σ0 σ1` with third component `(σ1 * σ0)⁻¹`;
  extensionality (`σinf` is determined, so two triples agree iff their first two components
  do); `DecidableEq`; `Fintype`; the trivial triple `1` with three identities; degree-zero
  behaviour (`Subsingleton (PermutationTriple 0)`).
- *Examples.* Layer 0.8's suite.
- *Morphisms and functoriality.* Transport along `Fin n ≃ Fin m` (only `n = m` occurs, via
  `Equiv.permCongrHom`); the relabeling action is Layer 0.2.
- *Comparison lemmas.* `σinf = σ0⁻¹ * σ1⁻¹`; the equivalent relations
  `σ1 * σ0 = σinf⁻¹` and cyclic rotations `σ0 * σinf * σ1 = 1`, `σ1 * σ0 * σinf = 1`
  (rotations of the relation hold; arbitrary permutations of it do not).
- *Edge cases.* `n = 0` and `n = 1`.
- *Downstream interfaces.* Everything below; the convention-translation involution next.

**The opposite-convention translation.** Componentwise inversion
`t ↦ (t.σ0⁻¹, t.σ1⁻¹, t.σinf⁻¹)` is a bijection between triples satisfying
`σinf * σ1 * σ0 = 1` and triples satisfying the rival relation `σ0 * σ1 * σinf = 1`. State
it as such, and prove it preserves full cycle types, monodromy groups, connectedness, and
automorphism groups. This is the translation lemma every convention-sensitive source
citation points at.

*Prerequisites:* Mathlib `Equiv.Perm`.

*Tau Ceti:* `TauCeti.PermutationTriple` with `ofTwo`, `ext_of_two`, `equivPair`, `transport` and
`equivOppositeConvention`; the rotated relations `σ0_mul_σinf_mul_σ1_eq_one` and
`σ1_mul_σ0_mul_σinf_eq_one`; the preservation statements `cycleData_inv_components`,
`isConnected_equivOppositeConvention_iff` and `automorphismGroup_equivOppositeConvention`.

#### 0.2 Relabeling and isomorphism classes

Simultaneous conjugation is a left `MulAction` of `Equiv.Perm (Fin n)` on
`PermutationTriple n`: `(τ • t).σ0 = τ * t.σ0 * τ⁻¹`, and likewise for the other two
components; the relation is preserved because conjugation is a group automorphism. Define
isomorphism of triples as `MulAction.orbitRel`, and the type of isomorphism classes as its
quotient.

- *Constructors and instances.* The `SMul` and `MulAction` instances; decidability of the
  orbit relation (finite search).
- *Comparison lemmas.* `τ • ofTwo σ0 σ1 = ofTwo (τσ0τ⁻¹) (τσ1τ⁻¹)`; compatibility with the
  opposite-convention involution.
- *Preservation.* Relabeling preserves full cycle types (Mathlib
  `Equiv.Perm.cycleType_conj`), the product relation, connectedness, and conjugates the
  monodromy and automorphism groups.
- *Downstream interfaces.* Passport classes (Layer 1.2), dessin isomorphism (Layer 2.4),
  cover isomorphism (Layer 6.3).

*Prerequisites:* Layer 0.1; Mathlib `MulAction`, `MulAction.orbitRel`.

*Tau Ceti:* the `MulAction` of `Equiv.Perm (Fin n)`, `TauCeti.PermutationTriple.Equivalent` and
`IsoClass`, with `smul_ofTwo`, `equivOppositeConvention_smul`, `cycleData_smul` and
`isConnected_smul_iff`.

#### 0.3 The monodromy group

`monodromyGroup t := Subgroup.closure {t.σ0, t.σ1}`. Prove: `σinf ∈ monodromyGroup t`;
closure of all three components equals closure of the first two; relabeling by `τ` maps the
monodromy group to its conjugate `Subgroup.map (MulAut.conj τ).toMonoidHom`; the monodromy
groups of isomorphic triples are conjugate.

*Prerequisites:* Layers 0.1, 0.2; Mathlib `Subgroup.closure`.

*Tau Ceti:* `TauCeti.PermutationTriple.monodromyGroup`, `σinf_mem_monodromyGroup`,
`closure_triple_eq_monodromyGroup` and `monodromyGroup_smul`.

#### 0.4 Connectedness and automorphisms

`IsConnected t : Prop` is the conjunction of `n ≠ 0` and
`MulAction.IsPretransitive (monodromyGroup t) (Fin n)`, with a decidability instance.
⚠ Pretransitivity alone is vacuously true at `n = 0`, where the genus formula fails; the
`n ≠ 0` clause is part of the definition.

The automorphism group of `t` is `MulAction.stabilizer (Equiv.Perm (Fin n)) t` — the
simultaneous centralizer. Prove:

- `automorphismGroup t = ⨅` of the centralizers of `σ0` and `σ1`, equivalently the
  centralizer of `monodromyGroup t` in `Equiv.Perm (Fin n)`;
- for connected `t` the automorphism action on `Fin n` is free (a permutation centralizing a
  transitive subgroup and fixing a point is the identity), so `Nat.card` of the automorphism
  group divides `n`;
- relabeling conjugates automorphism groups.

⚠ *Nearby false statement:* the automorphism group of a triple is not the automorphism group
of its monodromy group, and is trivial for most triples even when the monodromy group has
many automorphisms.

*Prerequisites:* Layers 0.1–0.3; Mathlib `MulAction.IsPretransitive`, `MulAction.stabilizer`,
`Subgroup.centralizer`.

*Tau Ceti:* `TauCeti.PermutationTriple.IsConnected` with its `Decidable` instance,
`automorphismGroup_eq_centralizer_monodromyGroup`,
`eq_one_of_mem_automorphismGroup_of_apply_eq`, `card_automorphismGroup_dvd` and
`automorphismGroup_smul`.

#### 0.5 Cycle data

Attach to each component its full cycle partition
`fullCycleType σ` (PolynomialGaloisGroups Layer 0) and cycle count
`cycleCount σ := (fullCycleType σ).card`, and prove the bookkeeping this roadmap uses
throughout:

- `(fullCycleType σ).sum = n`, and `cycleCount σ = σ.cycleType.card + (n − σ.support.card)`;
- comparison with the pin's bundled `Equiv.Perm.partition`;
- invariance under conjugation and under transport;
- **the transposition step lemma**: for `i ≠ j`,
  `cycleCount (Equiv.swap i j * σ) = cycleCount σ - 1` if `σ.SameCycle i j` is false, and
  `cycleCount σ + 1` if it holds — the merge/split dichotomy, stated on whichever side of
  multiplication Layer 0.6's induction consumes, with the other side derived;
- **the sign identity**: `Equiv.Perm.sign σ = (-1) ^ (n - cycleCount σ)`, by induction along
  the cycle factors.

*Prerequisites:* PolynomialGaloisGroups Layer 0 `fullCycleType`; Mathlib
`Equiv.Perm.cycleType`, `Equiv.Perm.partition`, `Equiv.Perm.sign`, `Equiv.Perm.SameCycle`.

*Tau Ceti:* `Equiv.Perm.fullCycleType` with `Equiv.Perm.sum_fullCycleType`; the cycle count is
`TauCeti.orbitCount`, with the transposition step lemmas
`TauCeti.orbitCount_swap_mul_of_sameCycle` and
`TauCeti.orbitCount_swap_mul_add_one_of_not_sameCycle` the sign identity
`Equiv.Perm.sign_eq_neg_one_pow_card_sub_orbitCount`, the comparison
`Equiv.Perm.orbitCount_eq_card_parts_partition` with Mathlib's `Equiv.Perm.parts_partition`,
and invariance `TauCeti.orbitCount_conj` and `Equiv.orbitCount_permCongr`.

#### 0.6 Euler characteristic and genus

Define, in `ℤ`,

```text
χ(t) = cycleCount σ0 + cycleCount σ1 + cycleCount σinf − n .
```

Prove, in this order:

1. **Parity.** `2 ∣ (2 - χ(t))` for every product-one triple: applying the sign identity to
   the relation gives `(-1)^(3n - Σ cycleCount) = 1`, so `χ(t)` is even.
2. **Disjoint sums.** The juxtaposition
   `PermutationTriple m → PermutationTriple n → PermutationTriple (m + n)` along
   `finSumFinEquiv`, with `χ` additive and cycle data concatenating. Its monodromy is the
   image of the **common** free-group representation into the product of the two monodromy
   groups, transported to the two blocks. It is contained in that product and projects onto
   each factor; it need not be the full product. Two identical degree-two cyclic triples
   give the diagonal `C₂` in `C₂ × C₂`. Prove the image formula and both projections, and
   retain `monodromyGroup_disjointSum_le` as its inclusion consequence. Conversely every
   triple decomposes, up to relabeling, as the disjoint sum of its restrictions to the
   monodromy orbits.
3. **The connected bound.** For connected `t`, `χ(t) ≤ 2`. Proof route: write `σ1` as a
   product of `n − cycleCount σ1` transpositions (a minimal factorization along its cycles)
   and induct with the transposition step lemma, tracking the cycle counts of the partial
   products and the orbit count of the partial monodromy; the base case is the transitive
   cyclic triple.

   *Source:* Lando–Zvonkin, *Graphs on Surfaces and Their Applications*, **Proposition
   1.5.3** (p. 44): for a hypermap — their 3-constellation, Definition 1.5.1, which is a
   transitive product-one triple by Definition 1.1.1 — one has
   `χ = c(σ) + c(α) + c(φ) − n = 2 − 2g`.
   ⚠ **Their proof is topological**: `χ ≤ 2` and the parity come from the existence of the
   associated surface, not from combinatorics — as does the other standard reference's, since
   Girondo–González-Diez reaches the genus through **Proposition 1.54** (`χ = 2 − 2g` for a
   compact orientable surface) and **Theorem 1.76** (Riemann–Hurwitz), both presupposing the
   surface. This roadmap deliberately does **not** follow
   it, because Layer 0 must not depend on Layers 5–8; the transposition induction above is
   the combinatorial replacement, and the topological statement reappears independently as
   Layer 8.6's genus reconciliation. An implementer who follows the citation to its proof
   will find the wrong argument for this layer.
4. **The general bound.** `χ(t) ≤ 2 · (number of monodromy orbits)` for `n ≠ 0`, from 2 and
   3.

Then define the genus: `genus t : ℕ := ((2 - χ(t)) / 2).toNat`, with the junk-free
characterization `(genus t : ℤ) = (2 - χ(t)) / 2` and `2 - 2 * (genus t : ℤ) = χ(t)` for
connected `t`, and the display form `genus t = 1 + (n − Σ cycleCount)/2` as an equation of
integers. ⚠ No statement subtracts naturals before the bounds above are in scope.

*Prerequisites:* Layers 0.3–0.5; Mathlib `finSumFinEquiv`, `Int.toNat`.

*Tau Ceti:* `TauCeti.PermutationTriple.eulerChar`, `even_eulerChar`, `disjointSum` with
`eulerChar_disjointSum`, `indexedDisjointSum_restrictToOrbit`, `IsConnected.eulerChar_le_two`,
`eulerChar_le_two_mul_card_monodromyOrbits`, `genus` and `IsConnected.two_sub_two_mul_genus`.
The monodromy group of a disjoint sum is only contained in the product
(`monodromyGroup_disjointSum_le`), which is the correct statement.

#### 0.7 Orders and geometry type

`orderTriple t := (orderOf t.σ0, orderOf t.σ1, orderOf t.σinf)` — the LMFDB's `abc` datum.
Prove `orderOf σ = (fullCycleType σ).lcm` (the pin's `lcm_cycleType`, adjusted for the
appended `1`s), and invariance under relabeling.

Define the three-valued `GeometryType` (spherical, Euclidean, hyperbolic) of a connected
triple by the exact rational comparison of `1/a + 1/b + 1/c` with `1`, where `(a,b,c)` is
`orderTriple`. The identity permutation has order `1`. Prove invariance under relabeling and
under the opposite-convention involution.

*Prerequisites:* Layers 0.1, 0.2, 0.5; Mathlib `orderOf`, `Rat` order.

*Tau Ceti:* `TauCeti.PermutationTriple.orderTriple`, `orderTriple_eq_lcm_cycleData`,
`orderTriple_smul`, `geometryType` with `geometryType_eq_spherical_iff`, `geometryType_smul` and
`geometryType_inv_components`.

#### 0.8 The example suite

Each example is a named definition with its invariants proved, and each later layer reuses
these rather than inventing new ones:

- **Degree one.** The unique triple of degree `1`; connected; genus `0`.
- **The cyclic triple** `cyclicTriple n` (`n ≥ 1`): `σ0 = finRotate n`, `σ1 = 1`,
  `σinf = (finRotate n)⁻¹` — the monodromy of `z ↦ zⁿ`. Connected; cycle data
  `[n], [1,…,1], [n]`; genus `0`; monodromy cyclic of order `n`; `orderTriple = (n, 1, n)`;
  spherical.
- **A triple unramified over `0`**: degree `2` with `σ0 = 1`, `σ1 = σinf = Equiv.swap 0 1` —
  the monodromy of `z ↦ 4z(1−z)`. Connected; genus `0`. This witnesses that "branch locus
  contained in `{0,1,∞}`" is containment, not equality.
- **A disconnected triple**: the disjoint sum of two cyclic triples, with `χ = 4`.
- **An isomorphic pair**: `cyclicTriple 4` and its relabeling by `Equiv.swap 0 1`, with the
  equivalence exhibited and the equality of their passport class sets and labels proved.
  Their raw `PassportSpec` values need not be equal: their embedded groups are conjugate.
- **The Euclidean torus triple** `torusTriple`: degree `4`,
  `σ0 = σ1 = finRotate 4`, `σinf = (finRotate 4 ^ 2)⁻¹`. Connected; cycle data
  `[4], [4], [2,2]`; `χ = 0`; genus `1`; `orderTriple = (4,4,2)`; Euclidean; monodromy
  cyclic of order `4`; automorphism group of order `4` (regular); imprimitive with blocks
  `{0,2},{1,3}`. One example serving Layers 0–4 as the positive-genus, regular, imprimitive,
  Euclidean witness at once.
- **A noncommutative triple**: degree `3`, `σ0 = finRotate 3`, `σ1 = Equiv.swap 0 1`,
  monodromy all of `S₃`; genus `0`; the automorphism group is trivial.

*Prerequisites:* Layers 0.1–0.7; Mathlib `finRotate`, `Equiv.swap`.

*Tau Ceti:* `TauCeti.PermutationTriple.cyclicTriple`, `chebyshevTriple`, `torusTriple` and
`s3Triple` with their invariants, `eulerChar_disjointSum_cyclicTriple`, and for the isomorphic
pair `equivalent_ofTwo_cyclicTriple_four` and `classSet_passportOf_swap_smul_cyclicTriple_four`.
The two passport specifications have equal class sets and labels but are not equal
(`passportOf_swap_smul_cyclicTriple_four_ne`), because relabeling moves the reference subgroup.

### Layer 1: passports, blocks, and finite label semantics

#### 1.1 Passport specifications

Passports are attached to **connected** triples only, so the carrier comes first:

```lean
def ConnectedTriple (n : ℕ) := {t : PermutationTriple n // t.IsConnected}
```

with the relabeling action of Layer 0.2 restricted to it (connectedness is
relabeling-invariant, Layer 0.2), its orbit relation, and the coercion to
`PermutationTriple n`. Every predicate and every function of this layer is stated on
`ConnectedTriple n`; none is stated on a bare triple and then hedged with a hypothesis.

```lean
structure PassportSpec (n : ℕ) where
  G : Subgroup (Equiv.Perm (Fin n))
  λ0 λ1 λinf : Multiset ℕ
```

with the well-formedness predicate `PassportSpec.IsAdmissible` — `n ≠ 0`, the reference
subgroup is pretransitive, and each multiset is a partition of `n` into positive parts —
and the membership predicate: `t : ConnectedTriple n` has passport `P` when its monodromy
group is conjugate to `P.G` (the spelling
`∃ τ, Subgroup.map (MulAut.conj τ).toMonoidHom (monodromyGroup t) = P.G`, exactly as
PolynomialGaloisGroups spells label membership) and its three full cycle types are the
three partitions. Prove invariance of membership under relabeling, that membership depends
on `P.G` only through its conjugacy class, and that a `P` with an inhabited membership
predicate is admissible.

⚠ `n ≠ 0` is part of admissibility for the same reason it is part of connectedness
(Layer 0.4): `MulAction.IsPretransitive` is vacuous on `Fin 0`, and the empty multiset is
a partition of `0`, so the degenerate specification would otherwise be admissible and
inhabited by nothing.

*Prerequisites:* Layers 0.2–0.5; PolynomialGaloisGroups Layer 0.

*Tau Ceti:* `TauCeti.ConnectedTriple`, `TauCeti.PassportSpec` with `IsAdmissible` and
`HasPassport`, `hasPassport_smul_iff`, `hasPassport_conjugate_iff` and
`isAdmissible_of_hasPassport`.

#### 1.2 Passport classes and passport size

The passport class set of `P` is the (finite) set of isomorphism classes of
`ConnectedTriple n` with passport `P`; `passportSize P` is its cardinality. The `Fintype`
instance comes from Layer 0.1's `Fintype (PermutationTriple n)` and Layer 0.2's decidable
orbit relation — both instances on the carrier itself, so **this milestone does not consume
Layer 3.1** and Layer 3.1 is free to consume it. Prove: `passportSize` is invariant under
conjugating the reference subgroup; isomorphic triples have conjugate attached passport
specifications and equal passport class sets and labels; the passport
determines degree, genus, `orderTriple`, and geometry type (each is computable from the
partitions alone — with the genus through Layer 0.6's formula).

⚠ *Nearby false statement:* a passport does not determine the isomorphism class; the
smallest counterexamples have several classes in one passport, and Layer 3.5 exhibits one.

*Prerequisites:* Layers 0.6, 0.7, 1.1.

*Tau Ceti:* `TauCeti.PassportSpec.classSet`, `passportSize`, `passportSize_conjugate`,
`hasPassport_iff_of_equivalent`, and `genus_eq_of_hasPassport` with its `orderTriple` and
`geometryType` companions.

#### 1.3 The normalizer formulation

Fix `n ≠ 0` and an embedded pretransitive `G ≤ Equiv.Perm (Fin n)`. Prove the bijection between

- isomorphism classes of connected triples with monodromy group conjugate to `G` and cycle
  data `(λ0, λ1, λinf)`, and
- orbits of the conjugation action of the normalizer `N_{S_n}(G)` on the set of triples
  `(g0, g1, ginf) ∈ G³` with `ginf * g1 * g0 = 1`, `⟨g0, g1⟩ = G`, and the given cycle data.

⚠ The acting group is the normalizer, not `G`: two generating triples of `G` can be
`S_n`-conjugate only through elements normalizing `G`, and inner conjugation is a proper
subgroup of that in general. Every counting statement of Layer 3.4 passes through this
milestone.

⚠ `n ≠ 0` is needed, exactly as in connectedness (Layer 0.4). At `n = 0`, `G = ⊥ = ⊤` in
`Equiv.Perm (Fin 0)` is pretransitive on the empty type and the empty partitions are the cycle
data of `1`, so `(1, 1, 1)` is a generating triple and the normalizer has one orbit, while there
is no connected triple and the class side is empty.

*Prerequisites:* Layers 0.2, 0.3, 1.1; Mathlib `Subgroup.normalizer`.

*Tau Ceti:* `TauCeti.PassportSpec.IsGeneratingTriple`, `GeneratingTriple`,
`generatingTripleOrbitsEquivClasses` and `passportSize_eq_card_generatingTripleOrbits`.

#### 1.4 Blocks, quotient triples, and primitivity

For a connected triple `t`, a block system for the monodromy action (Mathlib
`MulAction.IsBlockSystem`) induces a quotient triple on the finite set of blocks: each
component permutes the blocks, the product relation descends, and the quotient of a
connected triple is connected. Build:

- the quotient construction, packaged with a chosen equiv from the block set to `Fin m`, and
  its independence of that choice up to relabeling;
- compatibility of cycle data: the cycle of a block under the quotient of `σ` has length the
  cycle length of any member point divided by the block-cycle multiplicity — stated
  precisely, this is the block-imprimitivity refinement of `fullCycleType`;
- `IsPrimitive t := MulAction.IsPreprimitive (monodromyGroup t) (Fin n)`, decidable, with
  the trivial-blocks characterization from the pin;
- transitivity of quotients: block systems refine, and quotient triples compose.

Nothing here asserts a canonical primitivization: a triple can admit non-isomorphic maximal
proper quotients, and Layer 14 encodes the LMFDB's `primitivization` as data (a chosen block
system), not as a derived value.

*Prerequisites:* Layers 0.2–0.4; Mathlib `MulAction.IsBlock`, `IsBlockSystem`,
`IsPreprimitive`.

*Tau Ceti:* `TauCeti.PermutationTriple.blockQuotient` with `equivalent_blockQuotient`,
`isConnected_blockQuotient` and `blockQuotient_blockQuotient`, the cycle-length compatibility
`ncard_sameCycle_and_mem_mul_minimalPeriod_blockActionHom`, and `IsPrimitive` with
`isPrimitiveBool_eq_true_iff`.

#### 1.5 The passport of a triple

`passportOf : ConnectedTriple n → PassportSpec n` — the monodromy group itself as reference
subgroup with the three full cycle types — with `IsAdmissible (passportOf t)`,
`HasPassport t (passportOf t)`, and the universal property: `t'` is in the passport class
set of `passportOf t` iff `t'` has conjugate monodromy and equal cycle data. ⚠ The domain is
`ConnectedTriple n`, not `PermutationTriple n`: `passportOf` of a disconnected triple would
produce an inadmissible specification, and every consumer below takes a connected triple.
This is the bridge every LMFDB-facing statement uses to pass from a stored triple to its
passport row.

*Prerequisites:* Layers 1.1, 1.2.

*Tau Ceti:* `TauCeti.ConnectedTriple.passportOf`, `isAdmissible_passportOf`,
`hasPassport_passportOf` and `mk_mem_classSet_passportOf_iff`.

#### 1.6 Label semantics at reference degrees

For every degree `n` at which the PolynomialGaloisGroups reference family has entries,
interpret the group component of an LMFDB passport label through that single family: degrees
`1` to `5` through its Layer 6, and degrees `6` to `11` once the declared gap
`gap:transitive-groups-degree-six-to-eleven` is filled. The external string `nTj` denotes native
zero-based index `j-1`; validity requires `1 ≤ j ≤ numTransitiveGroups n` and ambient
conjugacy of the passport's monodromy subgroup to `referenceSubgroup n (j-1)`. The
label-semantics predicate is the existing `PassportSpec.HasLabel` on the stable data:
degree, reference-group label, and the three ordered full cycle partitions. Prove invariance
under conjugating the reference subgroup, compatibility with sheet renumbering and equality
of the label fields read from any connected triple in the passport. A final orbit letter
is an external enumeration inside that passport, not a mathematical invariant (14.5).

The degree `6` to `11` representatives, their completeness and their label order belong to
PolynomialGaloisGroups through that gap (§What Tau Ceti supplies); this roadmap adds no second
`nTj` predicate or subgroup table. The extension has counts `16, 7, 50, 34, 45, 8` in degrees
`6` to `11` and keeps the fourteen reference groups of degrees `1` to `5` unchanged. The
`6T6` record of 14.6 is identified with the subgroup generated, in zero-based cycles, by
`(0,2,4)(1,3,5)` and `(2,5)`; 14.6 proves the record's monodromy conjugate to that subgroup,
not merely of the same order or abstract type.

**Checks.**
- In degree `3` the label `3T2` denotes `S₃` and `3T1` denotes `A₃`; a triple with monodromy
  `S₃` has label `3T2` and not `3T1`, and swapping the two reference indices would give the
  wrong label on `s3Triple`.
- At degree `6`, where `numTransitiveGroups 6 = 0` at the pin, the index type is empty: no label
  is asserted, and a construction producing an element of it would be a false use of `Fin 0`.

*Prerequisites:* Layer 1.1; PolynomialGaloisGroups Layer 6, and the gap
`gap:transitive-groups-degree-six-to-eleven` for degrees `6` to `11`.

*Tau Ceti:* `TauCeti.PassportLabel`, `TauCeti.PassportSpec.HasLabel` and
`hasLabel_conjugate_iff` implement these semantics in degrees `1` to `5`. The degrees `6` to
`11` remain, behind the gap.

### Layer 2: dessins as finite bipartite ribbon graphs

#### 2.1 The generic carrier

```lean
structure BipartiteRibbonGraph where
  E B W : Type
  [fintypeE : Fintype E] [fintypeB : Fintype B] [fintypeW : Fintype W]
  [decE : DecidableEq E] [decB : DecidableEq B] [decW : DecidableEq W]
  blackEnd : E → B
  whiteEnd : E → W
  rotB : Equiv.Perm E
  rotW : Equiv.Perm E
  blackEnd_surjective : Function.Surjective blackEnd
  whiteEnd_surjective : Function.Surjective whiteEnd
  blackEnd_rotB : ∀ e, blackEnd (rotB e) = blackEnd e
  whiteEnd_rotW : ∀ e, whiteEnd (rotW e) = whiteEnd e
  isCycleOn_rotB : ∀ b, rotB.IsCycleOn (blackEnd ⁻¹' {b})
  isCycleOn_rotW : ∀ w, rotW.IsCycleOn (whiteEnd ⁻¹' {w})
```

Edges are abstract; each edge has one black and one white end; the rotation at a vertex is
the typed cyclic order on its incident edges — a permutation that preserves each incidence
fiber and is a single cycle on it. ⚠ Cyclic orders are never encoded as lists with coverage
side conditions; `Equiv.Perm.IsCycleOn` is the law, and the empty-fiber degenerate case is
excluded by surjectivity of the incidence maps (no isolated vertices — a dessin's vertices
are cycles, so this loses nothing).

**New object: `BipartiteRibbonGraph`.** Basic API: morphisms (triples of maps commuting
with incidences and rotations) and isomorphisms; automorphism groups; the face permutation
`facePerm := (rotW * rotB)⁻¹` with `facePerm * rotW * rotB = 1` — the same display order as
the triple relation; connectedness (`Nonempty E` and joint pretransitivity of
`Subgroup.closure {rotB, rotW}` on `E`); connected components; degree of a vertex = card of
its fiber; the Euler characteristic
`χ = card B + card W − card E + card (faces)` in `ℤ`, where faces are the orbits of
`facePerm`; the edge count `Σ (degree of black vertices) = card E`.

*Prerequisites:* Mathlib `Equiv.Perm.IsCycleOn`, `MulAction.orbitRel`.

*Tau Ceti:* `TauCeti.BipartiteRibbonGraph` with `Hom`, `Iso`, `Aut`,
`facePerm_mul_rotW_mul_rotB`, `IsConnected`, `ConnectedComponent`, `sum_blackDegree` and
`eulerChar`. The incidence laws `blackEnd_rotB` and `whiteEnd_rotW` are theorems rather than
fields.

#### 2.2 From triples to dessins

For a triple `t` of degree `n ≠ 0`: `E := Fin n`; `B` and `W` are the quotients of `Fin n`
by the orbit relations of the cyclic groups generated by `σ0` and `σ1`; the incidences are
the quotient maps; `rotB := σ0`, `rotW := σ1`. Prove the `IsCycleOn` laws (an orbit of a
single permutation is a cycle of it), that the dessin is connected iff `t` is, that its
faces biject with the cycles of `σinf`, and that its Euler characteristic equals `χ(t)`
(`card B + card W + card faces = Σ cycleCount`, edges `n` counted once).

*Prerequisites:* Layers 0.1–0.6, 2.1.

*Tau Ceti:* `TauCeti.PermutationTriple.ribbonGraph`, `isConnected_ribbonGraph`,
`faceCount_ribbonGraph` and `eulerChar_ribbonGraph`.

#### 2.3 From dessins to triples

For a connected `Γ` with a chosen equiv `ν : Γ.E ≃ Fin n`: the triple
`ofTwo (ν.permCongr Γ.rotB) (ν.permCongr Γ.rotW)`. Prove that a different choice of `ν`
yields a relabeled triple, so the isomorphism class of the triple is well-defined, and that
the face permutation transports to `σinf`.

*Prerequisites:* Layers 0.1, 0.2, 2.1.

*Tau Ceti:* `TauCeti.BipartiteRibbonGraph.toPermutationTriple`, `equivalent_toPermutationTriple`
and `toPermutationTriple_σinf`.

#### 2.4 The equivalence of classifications

Round trips: triple → dessin → triple is the original up to the identity relabeling of
`Fin n`; dessin → triple → dessin is isomorphic to the original, naturally. Conclude the
bijection between isomorphism classes of connected dessins and isomorphism classes of
connected triples, with automorphism groups matching. Every counting statement about
dessins reduces along this bijection to Layer 3.

*Prerequisites:* Layers 2.2, 2.3.

*Tau Ceti:* `TauCeti.PermutationTriple.toPermutationTriple_ribbonGraph`,
`TauCeti.BipartiteRibbonGraph.isoRibbonGraph`, `isoClassEquiv`, `connectedIsoClassEquiv` and
`autEquivAutomorphismGroup`.

#### 2.5 Genus of a dessin

`χ`, parity, the connected bound `χ ≤ 2`, and the genus — transported along 2.4 from
Layer 0.6, with the Euler-characteristic equality of 2.2 doing the work. The combinatorial
genus stays independent of any analytic surface until Layer 8.6's genus reconciliation
proves they agree.

*Prerequisites:* Layers 0.6, 2.2, 2.4.

*Tau Ceti:* `TauCeti.BipartiteRibbonGraph.even_eulerChar`, `IsConnected.eulerChar_le_two`,
`genus` and `IsConnected.two_sub_two_mul_genus`.

#### 2.6 The action of permuting branch points

The six operations reindexing the roles of `0, 1, ∞`, generated by two adjacent
transpositions. Writing a triple as `(a, b, c) = (σ0, σ1, σinf)`, so that the pinned relation
reads `c · b · a = 1`:

```text
swap01   (a, b, c) = (b, a, b⁻¹ · c · b)
swap1Inf (a, b, c) = (a, b⁻¹ · c · b, b)
```

Both preserve the relation, and the conjugators are exactly what makes them do so. For
`swap01` the new product is `(b⁻¹cb) · a · b`, which is `1` on substituting `c = a⁻¹b⁻¹`; for
`swap1Inf` it is `b · (b⁻¹cb) · a = c · b · a = 1` directly.

⚠ **A conjugator on the wrong side does not work.** `(a, b, c) ↦ (b, a, a⁻¹ · c · a)` — the
naive color swap — does **not** preserve the relation: it yields `a⁻¹ c a² b`, which is
`a⁻¹a⁻¹b⁻¹a²b`, not `1`. On `s3Triple` (`a = (0 1 2)`, `b = (0 1)`) that product sends `0`
to `2`.

**The six operations, each with the branch-point permutation it is named after, written out
rather than schematized.** With `s = swap01` and `t = swap1Inf`, and with `ρ` the permutation
of `{0, 1, ∞}` such that the new `σ_i` is the old `σ_{ρ i}` up to conjugacy:

```text
operation   Lean name    ρ           formula
id          id           ()          (a, b, c)
s           swap01       (0 1)       (b, a, b⁻¹ · c · b)
t           swap1Inf     (1 ∞)       (a, b⁻¹ · c · b, b)
s ∘ t ∘ s   swap0Inf     (0 ∞)       (c, b, b · a · b⁻¹)
t ∘ s       rot          (0 1 ∞)     (b, c, a)
s ∘ t       rotInv       (0 ∞ 1)     (b⁻¹ · c · b, a, a · b · a⁻¹)
```

The last three are simplifications of the composites using `c · b · a = 1`; they are proved
in Lean, component by component (`TauCeti.PermutationTriple.swap0Inf_σ0` and `swap0Inf_σinf`,
`rot_σ1`, `rotInv_σinf`; the remaining components hold by definition), not asserted as rewriting
folklore. In
particular `rot` is the cyclic rotation `(a,b,c) ↦ (b,c,a)`, with **no conjugator at all**,
which is what makes the `S₃`-action visible.

⚠ **Reindexing is contravariant, so this is a *right* action.** Writing `Op ρ` for the
operation in the table, `Op ρ ∘ Op ρ' = Op (ρ' · ρ)` in Mathlib's multiplication, where
`(ρ' · ρ) i = ρ' (ρ i)`: the labels multiply in the **reverse** of the order in which the
operations are applied. The two generator instances are the definitions of `rot` and `rotInv` themselves:
`rot = swap1Inf ∘ swap01` and `rotInv = swap01 ∘ swap1Inf`. Applying
`swap01` first and then `swap1Inf` gives `rot`, whose label is `(0 1 ∞)`, and indeed
`ρ_s · ρ_t = (0 1)·(1 ∞) = (0 1 ∞)`; multiplying the labels in the same order as the
operations would give `ρ_t · ρ_s = (1 ∞)·(0 1) = (0 ∞ 1)`, which is `rotInv`'s label and the
wrong answer. Naming a single operation "the `S₃`-action" without fixing this is ambiguous by
exactly that inversion, which is why the table lists `ρ` per row rather than leaving it to be
inferred.

**New object: the branch-point action.** Basic API:

- *Constructors.* All six operations as maps `PermutationTriple n → PermutationTriple n`,
  each carrying its proof of the relation, and the three composite identities above.
- *Comparison lemmas.* `swap01` is an involution **on the nose** and `rot` has order `3`
  **on the nose** (`rot_rot_rot`). `swap1Inf ∘ swap1Inf` is **not** the identity on
  triples — it is simultaneous conjugation by **`a`** — which is why the `S₃`-action is
  stated on isomorphism classes:

  ```text
  t² (a, b, c) = (a, a · b · a⁻¹, a · c · a⁻¹) = a • (a, b, c)
  ```

  ⚠ The conjugator is `a`, not `b`. Two applications give
  `(a, b⁻¹ · c⁻¹ · b · c · b, b⁻¹ · c · b)` directly, and it is the relation — in the form
  `a = (c · b)⁻¹ = b⁻¹ · c⁻¹` — that rewrites those entries as conjugates by `a`. Conjugating
  by `b` or `b⁻¹` instead moves the first component, which `t²` fixes; on `s3Triple` the
  conjugates by `b` and by `b⁻¹` both differ from `t²`, and the conjugate by `a` equals it.

  The same phenomenon for the rotations is `rotInv_rot : rotInv (rot t) = b • t` — the
  conjugator there is **`b`**, not `a`, so `rotInv` is not the inverse of `rot` on triples
  even though `rot³` is the identity.
- *Functoriality.* Each operation commutes with relabeling, hence descends to `IsoClass n`;
  each preserves connectedness (`isConnected_swap01_iff`, `isConnected_swap1Inf_iff`), hence restricts
  to `ConnectedTriple n` and descends to `ConnectedIsoClass n`.
- *The action.* On `IsoClass n` the induced maps satisfy the Coxeter relations `s² = 1`,
  `t² = 1`, `(st)³ = 1`, and therefore define an `S₃`-action, right-acting as above. Prove
  the three relations separately; the third is `rot_rot_rot`, and the braid relation
  `t ∘ s ∘ t = s ∘ t ∘ s` holds on classes because, on triples,
  `swap1Inf_swap01_swap1Inf : swap1Inf (swap01 (swap1Inf t)) = b⁻¹ • swap0Inf t`, a relabeling
  of `swap0Inf t = swap01 (swap1Inf (swap01 t))`.
- *Preservation.* Connectedness, genus, and the monodromy subgroup up to conjugacy are
  preserved; the three cycle partitions are permuted by the corresponding element of `S₃` —
  `s` exchanges the partitions at `0` and `1`, `t` those at `1` and `∞`.
- *Dessins, and the ribbon orientation.* Under Layer 2.4, `s` exchanges black and white
  vertices, and `t` is the classical duality exchanging white vertices with faces. On the
  ribbon-graph carrier of 2.1 the formulas are, with `facePerm := (rotW · rotB)⁻¹`,

  ```text
  s : (rotB, rotW) ↦ (rotW, rotB)
  t : (rotB, rotW) ↦ (rotB, rotW⁻¹ · facePerm · rotW)
  ```

  ⚠ **All six preserve the ribbon orientation**, and this is worth stating because the
  opposite is easy to assume: `s` leaves the rotation system pointwise alone and only renames
  which colour class is black, and every one of the six is induced by a *holomorphic*
  automorphism of `ℙ¹ ∖ {0, 1, ∞}` (Layer 5.1), so no element of the `S₃`-action is the
  mirror operation. The orientation-reversing operation on dessins is complex conjugation
  `z ↦ z̄`, which is **not** in this group and is not part of this milestone.

**The three actions agree.** The same six formulas describe three a priori different actions,
and the milestone is that they are one:

- *combinatorial*, on `IsoClass n` and on `ConnectedIsoClass n`, as above;
- *topological*, by pulling covers back along the six anharmonic self-homeomorphisms of Layer
  5.1 — Layer 6.3's two pullback theorems, which identify
  the pullback along `z ↦ 1 − z` with `swap01` and along `z ↦ z/(z − 1)` with `swap1Inf`, and
  hence the four composites with the four composite operations. Equivalently, on the free
  group of 5.6 the same six formulas describe the induced automorphisms of
  `FreeGroup (Fin 2)`, with `x = of 0 ↦ periph0`, `y = of 1 ↦ periph1`, `z = (y · x)⁻¹`; the
  triple action is *precomposition* with those automorphisms, which is where the
  contravariance above comes from;
- *algebraic*, by postcomposing an algebraic Belyi pair `β` with an anharmonic Möbius
  transformation of `ℙ¹` — Layer 9.1's `S₃`-action.
  ⚠ Postcomposition inverts: the map whose puncture permutation is `ρ` realizes the operation
  labelled `ρ⁻¹`, so `rot` is realized by `t ↦ (t − 1)/t` and not by `t ↦ 1/(1 − t)`. Layer 9.1
  carries the table.

⚠ Only `id` and `s` act on level-1 data (literal triples and fiber-numbered covers); their
Möbius transformations are the two that fix the basepoint `b = 1/2` (Layer 5.1). The other
four act only on isomorphism classes, and the failure to act on the nose is measured by
`swap1Inf_swap1Inf` and `rotInv_rot`.

**The induced action on passports, and the three objects that must not be confused.** The
passport of Layer 1.1 is **ordered** by `(0, 1, ∞)` and stays so; the branch-point action
gives a second, coarser object on top of it. Define:

- `OrderedPassport n := PassportSpec n` restricted to admissible specifications — the
  intrinsic invariant of Layers 1–3, ordered, and the one `passportOf` produces;
- the induced `S₃`-action on `OrderedPassport n`, permuting `(λ0, λ1, λinf)` and fixing the
  reference subgroup up to conjugacy, with the equivariance
  `passportOf (s · t) = s · passportOf t` for each of the six operations;
- the **orbit** of an ordered passport under that action, a set of at most six ordered
  passports.

Prove that the `S₃`-orbit is a coarser invariant than the ordered passport, with a witness
where the orbit has fewer than six elements. ⚠ A **tabulated representative** — one chosen
member of an orbit — is a third thing again, and it is not defined here: it is a database
convention with no intrinsic content, and Layer 14.4 is where it is certified as such.

*Prerequisites:* Layers 0.2, 0.5, 0.6, 1.1, 2.4.

*Tau Ceti:* the six operations `TauCeti.PermutationTriple.swap01`, `swap1Inf`, `swap0Inf`,
`rot`, `rotInv`, with `reindexBranchPoints`; `swap1Inf_swap1Inf`, `rotInv_rot`, `rot_rot_rot`;
the `MulAction` of `(Perm (Fin 3))ᵐᵒᵖ` on `IsoClass n` and on `TauCeti.ConnectedIsoClass n`; the
dessin operations `TauCeti.BipartiteRibbonGraph.swap01` and `swap1Inf`; on passports
`TauCeti.ConnectedTriple.passportOf_reindexBranchPoints`,
`TauCeti.OrderedPassport.card_orbit_le_six` and the short-orbit witness
`orbit_orderedPassportOf_cyclicTriple_one`; and the topological agreement of Layer 6.3. Tau Ceti
defines `swap0Inf`, `rot` and `rotInv` as the composites, so the formulas in the table are its
component lemmas.

#### 2.7 Dessin examples

The dessins of the Layer 0.8 suite, drawn out as data: the `n`-star of `cyclicTriple n`
(one black vertex, `n` white, `n` edges, one face at genus `0`); the segment dessin of the
`4z(1−z)` triple (two black, one white, two edges); the torus dessin of `torusTriple` (one
black, one white, four edges, two faces, `χ = 0`); and the `S₃` example. Each with its
Euler characteristic computed by `decide`/`#eval`-friendly instances.

*Prerequisites:* Layers 0.8, 2.2.

*Tau Ceti:* `TauCeti.BipartiteRibbonGraph.cyclicDessin`, `segmentDessin`, `torusDessin` and
`s3Dessin`, each with its Euler characteristic.

### Layer 3: finite enumeration and character-theoretic counts

#### 3.1 Executable enumeration

Every invariant this roadmap attaches to a finite triple must be **computable on
`Equiv.Perm (Fin n)`**, not merely definable. Mathlib's `Equiv.Perm.cycleType` is built
through `cycleFactorsFinset`, which is not an executable decomposition, so the cycle data
is recomputed here and compared:

- **Carrier instances.** `Fintype (PermutationTriple n)` and `DecidableEq
  (PermutationTriple n)`, both through the `Equiv` with pairs `(σ0, σ1)` supplied by
  `ofTwo` and Layer 0.1's extensionality (the third component is determined). These are
  Layer 0.1's instance obligations; this milestone is where they are discharged
  executably.
- **The computable cycle decomposition.** `cycleLenOf σ i`, the least `k ≥ 1` with
  `σ ^ k i = i`, found by scanning `k ∈ [1, n]`; the orbit-minimum predicate
  `∀ k < n, i ≤ σ ^ k i`, decidable because the quantifier is bounded; and
  `computedCycleType σ`, the multiset of `cycleLenOf σ i` over the orbit minima. Then the
  comparison theorem `computedCycleType σ = fullCycleType σ`, which is what licenses every
  later `#eval` and `decide`. Derive computable `cycleCount`, `orderTriple` (as the
  multiset `lcm`, Layer 0.7), `eulerChar`, `genus`, and `geometryType` from it, each with
  the theorem that it agrees with the Layer 0 definition.
- **Decidable predicates.** Connectedness, as the Boolean `isConnectedB` computing the
  closure of `{i}` under `σ0` and `σ1` by `n` rounds of `Finset` image-union, with
  `isConnectedB t = true ↔ t.IsConnected`; and primitivity, by enumerating the subsets of
  `Fin n` and deciding Mathlib's `IsBlock` for each, with the analogous soundness theorem
  against `IsPreprimitive`.

  ⚠ **Primitivity is not decided by closing a pair under the two generators.** That closure
  is the orbit of a nonempty set, so on a connected triple it is always all of `Fin n` and
  the test is vacuously `true`. Deciding blockhood also requires quantifying over the whole
  monodromy group, not over the generators: "preserves `B` or is disjoint from `B`" is not
  closed under multiplication. The milestone therefore includes a computable presentation of
  the monodromy group as a `Finset`, and three acceptance checks that a wrong implementation
  fails: `torusTriple` imprimitive with `{0,2}` a block, `s3Triple` primitive, and the
  degree-one triple primitive.
- **Enumeration.** The `Finset` of connected triples; its partition into isomorphism classes
  as the `Finset` of relabeling **orbits** — not of chosen representatives, since
  `PermutationTriple n` carries no order and a classification routed through an arbitrary
  choice proves nothing about the classes; the passport fibers, and `passportSize P` as the
  cardinality of a computed `Finset`, with soundness and completeness stated as `Finset`
  equalities, so that the class lists and passport sizes are `#eval`-able at small degree and
  `decide`-checked at `n ≤ 3`: `(isoClasses n).card` is `1, 3, 7` for `n = 1, 2, 3`, by kernel
  `decide`. ⚠ At `n = 4` kernel reduction of the naive enumeration does not complete in
  reasonable time; the count `26` there is proved by a separate argument (3.5), and
  `native_decide` is not used, since it would add a trusted-compiler axiom.

  ⚠ For the passport fiber to be **computable** the monodromy group must enter as a `Finset`
  of permutations, which is also how the database presents it; a `Subgroup` carries no
  decidable equality. The milestone therefore states the fiber against that datum and adds
  the bridge to `PassportSpec`, rather than declaring the fiber `noncomputable` and keeping
  the `#eval` promise. The group is compared **up to conjugacy in `S_n`** — comparing literal
  subgroups over-counts, and at degree `5` that is exactly the difference between the correct
  `74` ordered passports and a larger wrong number.

Complexity is not a completion criterion; `n!·n!` enumeration is acceptable.

*Prerequisites:* Layers 0.1–0.7, 1.1, 1.2, 1.4.

*Tau Ceti:* `Equiv.Perm.computedCycleType_eq_fullCycleType`;
`TauCeti.PermutationTriple.computedEulerChar_eq`, `computedGenus_eq`, `computedOrderTriple_eq`,
`computedGeometryType_eq`; connectedness through
`isConnected_iff_forall_monodromyOrbitFinset_eq_univ`, a `Decidable` instance rather than a
Boolean; `monodromyFinset`, `isBlockBool_eq_true_iff`, `isPrimitiveBool_eq_true_iff` with the
three acceptance checks; `TauCeti.connectedTriples`, `TauCeti.isoClasses`,
`TauCeti.passportClasses` with `card_passportClasses`; and the counts
`TauCeti.ConnectedIsoClass.card_one`, `card_two`, `card_three`.

#### 3.2 The Frobenius product-one formula

This roadmap owns the counting formula; CharacterTheory owns everything it consumes. Build,
in order:

1. **Inverse classes.** The involution `ConjClasses G → ConjClasses G` induced by `g ↦ g⁻¹`,
   with `carrier (C⁻¹) = (carrier C)⁻¹` and its interaction with class sizes. (Small; on no
   other roadmap.)
2. **Count-to-structure-constant conversion.** For conjugacy classes `C0, C1, Cinf` of a
   finite group `G`,

   ```text
   #{(x, y, z) ∈ C0 × C1 × Cinf | z * y * x = 1}
     = Nat.card Cinf * structureConstant C1 C0 (Cinf⁻¹) ,
   ```

   from representative-independence of `structureConstant`.
3. **The character formula for structure constants.**

   ```text
   structureConstant Ci Cj Ck
     = (|Ci| * |Cj| / |G|) * Σ_χ χ(gᵢ) χ(gⱼ) χ(gₖ⁻¹) / χ(1)
   ```

   over the irreducible characters, derived from the central characters
   `TauCeti.Representation.centralCharacter` (CharacterTheory Layer 4.3), column orthogonality
   `TauCeti.card_conjClass_mul_sum_characterTable_mul_characterTable_inv` (its Layer 3.5), and
   the conversion `ω_χ(K_j) = |C_j| · χ(g_j) / χ(1)`. State it over `ℂ` as an identity of
   complex numbers with the natural-number count cast in.
4. **The assembled product-one formula.**

   ```text
   #{(x, y, z) ∈ C0 × C1 × Cinf | z * y * x = 1}
     = (|C0| * |C1| * |Cinf| / |G|) * Σ_χ χ(g0) χ(g1) χ(ginf) / χ(1) .
   ```

5. **The mandatory worked check**, chosen to detect a wrong class-size factor or a stray
   inverse: in `S₃`, with `C0` the `3`-cycles and `C1 = Cinf` the transpositions, both
   sides equal `6`; and with all three classes the transpositions, both sides equal `0`.
   Proved, not `#eval`-ed (the character side is noncomputable).

⚠ *Nearby false statement:* the raw count is not the number of triples with those cycle
types (a class is a `G`-class, and an `S_n`-cycle type can split into several), it does not
impose generation, and it counts triples, not isomorphism classes. Layers 3.3 and 3.4 close
those three gaps separately.

*Prerequisites:* CharacterTheory Layers 1, 3, 4; Layer 0.1.

*Tau Ceti:* the inverse classes `TauCeti.instInvolutiveInvConjClasses` with
`ConjClasses.card_carrier_inv`; `TauCeti.card_productOneTriples`,
`TauCeti.structureConstant_eq_sum_characterTable` and
`TauCeti.card_productOneTriples_eq_sum_characterTable`, over any algebraically closed field of
characteristic zero; and the worked check
`TauCeti.card_productOneTriples_threeCycle_transposition`.

#### 3.3 Generating triples

For a finite group `G` and classes `C0, C1, Cinf` of `G` as above, the count of triples that in
addition generate `G`, by inclusion–exclusion over the subgroup lattice: define the generating
count by strong downward recursion, `total H = Σ_{K ≤ H} generating K` with the sum over actual
subgroups `K` of `H`, and prove the recursion. Then regroup that sum by conjugacy **inside
`H`**: `total H = Σ_ω generating K_ω · [H : N_H(K_ω)]`, the sum over the `H`-conjugacy classes
`ω` of subgroups of `H` with a representative `K_ω`, because conjugate subgroups have equal
generating counts and the class of `K` has `[H : N_H(K)]` members. The entry classes stay
classes of `G`. The index bookkeeping is `[H : K] = [H : N_H(K)] · [N_H(K) : K]`; neither
`[N_G(K) : K]` nor `[H : K]` is the multiplicity. A Möbius-function closed form is stated only
if the pin's incidence-algebra API supports it; the recursion is the milestone.

**Checks.**
- `H = G = S₃` with `C0 = C1` the transpositions and `Cinf = {1}`: the product-one triples are
  the three `(t, t, 1)`, each generating its own `⟨t⟩`. The class of `⟨(0 1)⟩` has three
  members (`N(⟨t⟩) = ⟨t⟩`, index `3`) and generating count `1`, so the regrouped sum is
  `1 · 3 = 3`; the multiplicity `[N_G(K) : K] = 1` would give `1`.
- With `Cinf` the transpositions instead, there are no product-one triples (an odd product
  is not `1`), and every term of the regrouped sum vanishes.

*Prerequisites:* Layer 3.2; Mathlib `Subgroup` lattice, strong induction on finite
subgroup lattices.

*Tau Ceti:* `TauCeti.card_productOneTriplesIn_eq_sum_generating`,
`TauCeti.generatingProductOneTriples_card_eq_of_recursion` and the regrouping
`TauCeti.card_productOneTriplesIn_eq_sum_conjugacy_generating`.

#### 3.4 From counts to passport sizes

Combine Layers 1.3, 3.2, 3.3 into a formula, in these five steps, each its own statement:

Throughout, `n ≠ 0` and `G ≤ S_n` is pretransitive; the counterexample of Layer 1.3 at
`n = 0` shows the formula below fails without `n ≠ 0` (it gives `1` against a passport of size
`0`).

1. **Cycle types refine into `G`-classes.** For a pretransitive `G ≤ S_n` and a partition
   `λ` of `n`, the set `G_λ := {g ∈ G | fullCycleType g = λ}` is a union of `G`-conjugacy
   classes; name the finite index set `classesOfType G λ : Finset (ConjClasses G)` and
   prove `G_λ = ⋃_{C ∈ classesOfType G λ} carrier C`. ⚠ One `S_n`-cycle type can meet
   several `G`-classes and can also meet none; both cases occur in small degree.
2. **The generating count per class triple.** For `(C0, C1, Cinf)` a triple of
   `G`-conjugacy classes, Layer 3.2 counts the product-one triples in
   `C0 × C1 × Cinf` and Layer 3.3 subtracts the non-generating ones; write
   `genCount G C0 C1 Cinf` for the result and
   `genCountType G λ0 λ1 λinf := Σ genCount G C0 C1 Cinf` over
   `classesOfType G λ0 × classesOfType G λ1 × classesOfType G λinf` — the number of
   generating triples of `G` with the prescribed cycle data.
3. **The normalizer action.** `N := N_{S_n}(G)` acts by simultaneous conjugation on that
   finite set (Layer 1.3), and by Layer 1.3 the orbits are exactly the isomorphism classes
   in the passport, so `passportSize P = ` the number of `N`-orbits.
4. **Burnside, and the exact division that replaces it here.** In general the orbit count
   is `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group`:
   `Σ_{τ ∈ N} #Fix(τ) = #orbits · |N|`, where `Fix(τ)` is the set of generating triples
   fixed by conjugation by `τ`, i.e. those whose three components commute with `τ`.
   But **on this set every stabilizer is the same group**: a `τ` fixing a generating triple
   centralizes `⟨g0, g1⟩ = G`, so the stabilizer is the centralizer `Z := C(G)` of `G` in
   `S_n`, independent of the triple. Prove that, and conclude the exact formula

   ```text
   passportSize P = genCountType G λ0 λ1 λinf * Nat.card Z / Nat.card N ,
   ```

   as an equality of natural numbers together with the divisibility that makes it one.
   Burnside is then a cross-check, not the route.
5. **The centralizer bound.** For pretransitive `G`, its centralizer `Z` acts semiregularly on
   `Fin n`, so its order divides `n` (Layer 0.4's freeness argument applied to `G` in place
   of a triple's monodromy group); record this so the formula's right-hand side is bounded.

Every ingredient is named; no step identifies a raw Frobenius count with `passportSize`.

*Prerequisites:* Layers 0.4, 0.5, 1.2, 1.3, 3.2, 3.3; Mathlib Burnside,
`Subgroup.centralizer`, `Subgroup.normalizer`.

*Tau Ceti:* `Subgroup.classesOfFullCycleType`, `Subgroup.genCountType`,
`TauCeti.PassportSpec.passportSize_eq_card_generatingTripleOrbits`,
`stabilizer_generatingTriple_eq_centralizer_subgroupOf`,
`passportSize_eq_genCountType_mul_card_centralizer_div_card_normalizer`, and
`Subgroup.card_centralizer_dvd`.

#### 3.5 The small complete tables

Run Layer 3.1 at degrees `n ≤ 4` and prove the complete table: the isomorphism classes of
connected triples with their passports, genera and geometry types, as theorems with `decide`
or `Finset.sort`-normal-form proofs. The counts are

```text
degree                            1    2    3    4
connected classes                 1    3    7   26
ordered passports                 1    3    7   26
```

so that **every realized ordered passport in degree `≤ 4` has size exactly `1`** — every
passport containing at least one connected triple — which is itself a milestone, and which
holds whether or not the monodromy group is part of the passport datum. ⚠ An admissible
passport can be empty: in degree `2`, `S₂` with all three partitions `[2]` would need three
transpositions with product `1`, and `(0 1)³ = (0 1)`, so its size is `0`.

⚠ **Do not ask for a multi-class passport in degree `≤ 4`.** There is none. The smallest
lives in degree `5`: monodromy `C₅`, ordered cycle partitions `([5],[5],[5])`, of size `3`.
With `r` a `5`-cycle, three pairwise inequivalent representatives are

```text
(r, r,   r³)      (r, r²,  r²)      (r, r³,  r)
```

— each satisfying `σinf = (σ1 · σ0)⁻¹`, all with the same ordered passport, and pairwise
inequivalent because the normalizer action on `C₅` cannot match their exponent ratios. This
milestone requires that passport, proved complete and of size `3`.

Also required at these degrees: an imprimitive triple (available in degree `4`), and
agreement of `passportSize` with Layer 3.4's formula for one nonabelian monodromy group.

**Comparison with the database.** ⚠ The `13` frozen LMFDB records of degree `≤ 4` do **not**
exhaust the `37` ordered classes of degrees `1` to `4`. The database tabulates one ordered
passport from each `S₃`-orbit of passports under the branch-point action of Layer 2.6,
retaining all classes inside the chosen ordered passport. So the correct comparison is: every
frozen record matches exactly one enumerated class, distinct records match distinct classes,
and the records' passports form a set of `S₃`-orbit representatives. No claim is made that
the database lists all ordered classes, and none is needed.

*Source:* Musty–Schiavone–Sijsling–Voight, *A database of Belyi maps*, **Algorithm 2.3.1**,
for the one-representative-per-`S₃`-orbit tabulation.

*Prerequisites:* Layers 2.6, 3.1, 3.4; the thirteen LMFDB records of degree `≤ 4`, read from
the database pages named by their labels (14.6).

*Tau Ceti:* `TauCeti.ConnectedIsoClass.card_four`,
`TauCeti.PermutationTriple.genus_eq_ite_of_degree_four`,
`TauCeti.PassportSpec.passportSize_eq_one_iff_of_degree_le_four`,
`passportSize_cyclicTotallyRamified_five`,
`TauCeti.PermutationTriple.passportSize_formula_s3Triple`, and the imprimitive
`isPrimitiveBool_torusTriple`. The comparison with the database remains.

### Layer 4: triangle groups

#### 4.1 The oriented triangle group

For `a b c : ℕ`, the presented group

```lean
def TriangleGroup (a b c : ℕ) : Type :=
  PresentedGroup {x ^ a, y ^ b, z ^ c, z * y * x}
```

on three generators `x, y, z : FreeGroup (Fin 3)` — the relation in the same display order
as everything else in this roadmap. Universal property via `PresentedGroup.toGroup`: maps to
`H` correspond to triples of elements of orders dividing `(a, b, c)` with `z·y·x ↦ 1`.
API: the three distinguished generators; `TriangleGroup a b c ≃* TriangleGroup` of any cyclic
rotation of `(a,b,c)`; the elimination of `z` (isomorphism with the two-generator
presentation `⟨x, y | x^a, y^b, (y·x)^c⟩`); behaviour at parameter `0` (`x^0 = 1` is the
trivial relator, giving the free-er groups; the LMFDB's `abc` are always `≥ 1`, and
statements assume `1 ≤ a b c` where they need it).

*Source:* Girondo–González-Diez, **Definition 2.28** names `Γ_{n,m,l}` the triangle group of
signature `(n,m,l)`, and **Remark 2.29** gives its uniqueness up to conjugation in
`PSL(2,ℝ)`. ⚠ The abstract presentation `x₁ⁿ = x₂ᵐ = x₃ˡ = x₁x₂x₃ = 1` appears there as
*unnumbered* prose on p. 119, and the book does **not** prove that the geometric group has no
further relations — it cites Jones–Singerman for that. This roadmap takes the presentation as
the **definition**, so nothing here depends on that unproved match; Layer 4.4's spherical
classification and Layer 4.5 are what tie the presented group to a concrete group.

⚠ *Nearby false statement:* `Γ_{∞,∞,∞}` is free of rank two, not of rank three — the third
generator is determined. The presented group here degenerates the same way at parameter `0`.

*Prerequisites:* Mathlib `PresentedGroup`, `FreeGroup`.

*Tau Ceti:* `TauCeti.TriangleGroup` on `TauCeti.triangleRelators`, with `lift`, `rotate`,
`equivTwoGenerator` and `equivFreeGroup`.

#### 4.2 Triples as permutation representations

A degree-`n` triple `t` whose component orders divide `(a, b, c)` induces
`TriangleGroup a b c →* Equiv.Perm (Fin n)` sending `x, y, z` to `σ0, σ1, σinf`; its range
is the monodromy group; `t` is connected iff `n ≠ 0` and the induced action on `Fin n` is
pretransitive. ⚠ Pretransitivity alone is not enough: at `n = 0` the action on the empty set is
pretransitive and no triple is connected. Conversely a finite pretransitive action of
`TriangleGroup a b c` on a
nonempty `Fin n` yields a connected triple with orders dividing `(a, b, c)`, and the two
constructions are inverse up to relabeling. This is the classification of connected triples
with bounded orders by conjugacy classes of transitive finite permutation representations of
the triangle group.

*Prerequisites:* Layers 0.1–0.4, 4.1.

*Tau Ceti:* `TauCeti.TriangleGroup.toPerm`, `range_toPerm`,
`isConnected_iff_isPretransitive_range_toPerm`, `permutationTripleEquiv` and
`equivalent_cosetTriple_of_comap_stabilizer_eq`.

#### 4.3 Dividing versus exact orders

Separate the three statements a source can mean, each as its own predicate on a connected
triple `t` of degree `n`:

- **dividing:** `t.σ0 ^ a = 1`, `t.σ1 ^ b = 1`, `t.σinf ^ c = 1` — the hypothesis of 4.2's
  universal property, and the only one that makes `t` a representation of
  `TriangleGroup a b c`;
- **exact:** `orderTriple t = (a, b, c)` — the LMFDB's `abc` datum (Layer 0.7);
- **surjective:** the induced `TriangleGroup a b c →* Equiv.Perm (Fin n)` of 4.2 has range
  the whole monodromy group, i.e. the monodromy group is a quotient of the triangle group.

Prove: exact implies dividing; dividing implies exact for the triple's own `orderTriple`;
surjectivity is automatic from 4.2 and is recorded separately only because sources conflate
it with exactness.

**Necessary conditions for exact orders at degree `n`**, each proved, and none of them
claimed sufficient:

- each of `a, b, c` is the `lcm` of some partition of `n` — equivalently `Equiv.Perm (Fin n)`
  contains an element of that exact order, which Mathlib's
  `Equiv.Perm.exists_with_cycleType_iff` decides;
- `cycleCount σ ≥ n / orderOf σ` for every `σ`, since each cycle length divides the order;
  hence, in `ℚ`, `eulerChar t ≥ n · (1/a + 1/b + 1/c − 1)`;
- combining with Layer 0.6's `eulerChar t ≤ 2`: **`n · (1/a + 1/b + 1/c − 1) ≤ 2`**. In the
  spherical case this bounds the degree; in the Euclidean and hyperbolic cases it is
  vacuous.

⚠ **There is no simple general sufficiency criterion, and none is stated.** What replaces it
is decidability: by Layer 3.1 the set of connected triples of degree `n` with exact orders
`(a,b,c)` is a computed `Finset`, so existence at each fixed degree is decided, not
characterized. The witnesses this roadmap actually uses are constructed rather than
asserted: `cyclicTriple n` realizes `(n, 1, n)` at degree `n`; the `4z(1−z)` triple realizes
`(1, 2, 2)` at degree `2`; `s3Triple` realizes `(3, 2, 2)` at degree `3`; and `torusTriple`
realizes `(4, 4, 2)` at degree `4`.

*Prerequisites:* Layers 0.5–0.7, 3.1, 4.2; Mathlib `Equiv.Perm.exists_with_cycleType_iff`,
`Multiset.lcm`.

*Tau Ceti:* `TauCeti.PermutationTriple.HasDividingOrders`, `HasExactOrders.hasDividingOrders`,
`hasDividingOrders_orderTriple`, `exists_partition_lcm_eq_of_orderTriple_eq` and
`IsConnected.natCast_mul_inv_add_inv_add_inv_sub_one_le_two`.

#### 4.4 The trichotomy: spherical and Euclidean cases

Define the orbifold Euler characteristic `χᵒʳᵇ(a,b,c) := 1/a + 1/b + 1/c − 1 ∈ ℚ` and prove
its sign matches Layer 0.7's geometry type of any connected triple with exact orders
`(a,b,c)`. Then:

- **Spherical classification, proved with both readings of a signature.** For sorted
  positive presentation parameters `1 ≤ a ≤ b ≤ c`, positivity of `χᵒʳᵇ` gives the raw
  families `(1,b,c)`, `(2,2,m)`, `(2,3,3)`, `(2,3,4)`, `(2,3,5)`. The first family has
  `TriangleGroup 1 b c ≃* Multiplicative (ZMod (Nat.gcd b c))`, by the presentation.
  Thus `(1,2,3)` gives the trivial group, not order `12/5`.

  For an **exact order signature** of a connected permutation triple, carry
  `TauCeti.PermutationTriple.HasExactOrders t a b c`. If `a=1`, the product relation makes
  the other two permutations inverse, hence `b=c`. The exact spherical signatures are
  therefore `(1,m,m)`, `(2,2,m)`, `(2,3,3)`, `(2,3,4)`, `(2,3,5)`, as
  `IsSphericalSignature` specifies, whereas raw parameters use
  `IsSphericalParameterSignature`. Prove both classification statements and their
  comparison. For each row of the **exact-signature** table the triangle group is finite
  of order `2/χᵒʳᵇ`:

  ```text
  (1, m, m)   Multiplicative (ZMod m)   order m
  (2, 2, m)   DihedralGroup m           order 2m
  (2, 3, 3)   A₄                        order 12
  (2, 3, 4)   S₄                        order 24
  (2, 3, 5)   A₅                        order 60
  ```

  The two infinite families are settled by presentation comparison alone:

  - `(1, m, m)`: the relator `x ^ 1` makes `x = 1`, the third generator becomes `y⁻¹`, and
    the presentation collapses to `⟨y | y ^ m⟩`, giving
    `TriangleGroup 1 m m ≃* Multiplicative (ZMod m)`.
  - `(2, 2, m)`: substituting `r := y · x` rewrites the presentation as
    `⟨x, r | x², r^m, x r x = r⁻¹⟩`, which is Mathlib's `DihedralGroup m`; the isomorphism
    is a presentation comparison and gives the order `2m` outright. ⚠ Do **not** substitute
    the degree-`m` permutation representation here: it is unfaithful at `m ≤ 2`, where
    `TriangleGroup 2 2 2` has order `4` and its image in `Equiv.Perm (Fin 2)` has order `2`.

  The three polyhedral cases need two halves. The **lower** bound is an explicit
  permutation representation through 4.1's universal property:

  ```text
  (2, 3, 3)   x = (0 1)(2 3)   y = (0 1 2)   y·x = (0 2 3)     ⟨x,y⟩ = A₄  in S₄
  (2, 3, 4)   x = (0 1)        y = (1 2 3)   y·x = (0 2 3 1)   ⟨x,y⟩ = S₄  in S₄
  (2, 3, 5)   x = (0 1)(2 3)   y = (0 4 2)   y·x = (0 1 4 2 3) ⟨x,y⟩ = A₅  in S₅
  ```

  (permutations `0`-indexed and composed as in §Pinned conventions, so the third generator
  is `z = (y·x)⁻¹`). Each row is three `decide`-able finite checks — the orders of `x`, `y`
  and `y·x`, and the identification of `⟨x, y⟩` — and yields a surjection
  `TriangleGroup a b c ↠ Q`.

  The **upper** bound is an explicit **coset enumeration of `⟨y⟩`**, of index `4`, `8`, `20`
  respectively. The milestone owns the coset table: a list of `index`-many words `w_i` in
  `x` and `y`, and the `2 · index` identities `⟨y⟩ w_i x = ⟨y⟩ w_{μ(i,x)}` and
  `⟨y⟩ w_i y = ⟨y⟩ w_{μ(i,y)}` derived from the relators, which together prove
  `TriangleGroup a b c = ⋃_i ⟨y⟩ w_i` and hence `Nat.card ≤ index · 3`, that is `12`, `24`,
  `60`. Surjection plus matching bound is the isomorphism.

  ⚠ **A representation gives only a lower bound**, and a bound on *finite quotients* is not
  a substitute for a bound on the group. From Layer 4.3's inequality applied to the regular
  action of a finite quotient `Q` one obtains
  `(Nat.card Q : ℚ) * χᵒʳᵇ(a,b,c) ≤ 2` in every geometry. Only under `χᵒʳᵇ > 0` may this
  be divided to give `Nat.card Q ≤ 2 / χᵒʳᵇ`. At `χᵒʳᵇ=0` it gives no order bound; at
  negative `χᵒʳᵇ` division reverses the inequality. None of these quotient bounds alone
  proves the original group finite.
- **Euclidean infiniteness, proved.** For `χᵒʳᵇ = 0` — parameters `(3,3,3)`, `(2,4,4)`,
  `(2,3,6)` — the triangle group is infinite, by the explicit affine representation: `x` and
  `y` map to rotations of `ℂ` about `0` and `1` through `2π/a`, `2π/b` as elements of the
  affine group `z ↦ αz + β`, the relation is a computation in that group, and the
  commutator `[x, y]` is a nontrivial translation, of infinite order. Concretely, with
  `ω := exp(2πi/a)` and `η := exp(2πi/b)`, take `x : z ↦ ω z` and `y : z ↦ η (z − 1) + 1`;
  the linear part of `y·x` is `ωη = exp(2πi(1/a + 1/b))`, which is a primitive `c`-th root
  of unity exactly when `1/a + 1/b + 1/c = 1`, so `y·x` is a rotation of order `c`, and
  `x y x⁻¹ y⁻¹` has linear part `1` and translation part `(η − 1)(1 − ω)`, nonzero because
  `a, b ≥ 2`.

*Source:* Girondo–González-Diez, **Remark 2.30**, which states the trichotomy qualitatively —
the group is infinite in the Euclidean case and finite in the spherical case — and constructs
the Euclidean and spherical groups by the same reflection route as the hyperbolic one.
⚠ It is a remark, not a theorem, it gives no orders, and the identification of the spherical
groups with the cyclic, dihedral, `A₄`, `S₄` and `A₅` families is **not** in that section; the
only case it names is `Γ_{2,2,2} ≅ (ℤ/2)²`. The classification above is therefore this
roadmap's own work, and the explicit permutation representations are what prove it.

*Prerequisites:* Layers 0.7, 4.1–4.3; Mathlib `ℚ`, `DihedralGroup`, `ZMod`, `PresentedGroup`,
complex affine maps.

*Tau Ceti:* `TauCeti.orbifoldEulerChar`, `TauCeti.TriangleGroup.equivCyclic`, `equivDihedral`,
`equivTetrahedral`, `equivOctahedral`, `equivIcosahedral` with coset tables checked through
`TauCeti.CosetTable.index_le`, `infinite_of_inv_add_inv_add_inv_eq_one` and
`finite_iff_isSphericalParameterSignature`.

#### 4.5 Hyperbolic infiniteness

For `χᵒʳᵇ < 0`, `TriangleGroup a b c` is infinite, by an explicit representation into
`SL(2,ℝ)`. Write `c₁ = cos(π/a)`, `s₁ = sin(π/a)`, and likewise `c₂, s₂` for `b` and
`c₃ = cos(π/c)`. The milestone owns these five statements, in this order:

1. **The scale.** `κ := (c₁ c₂ + c₃) / (s₁ s₂)` and `μ := κ + √(κ² − 1)`. Prove `κ > 1` —
   this is the hyperbolic hypothesis, by 2 below — so `μ > 1` is real and `μ + μ⁻¹ = 2κ`.
2. **The trigonometric lemma.** For `α, β, γ ∈ (0, π/2]`,

   ```text
   cos²α + cos²β + cos²γ + 2 cos α cos β cos γ − 1
     = (cos γ − cos(π − α − β)) · (cos γ + cos(α − β)) ,
   ```

   an identity provable by expanding both sides. Since `cos(α − β) > 0` and `cos γ ≥ 0` the
   second factor is positive, so the left side is positive **iff** `γ < π − α − β`, that is
   iff `α + β + γ < π`. Applied at `α = π/a`, `β = π/b`, `γ = π/c` this says: the left side
   is positive iff `χᵒʳᵇ(a,b,c) < 0`. The same factorization gives `κ > 1` in that case,
   since `κ − 1 = (c₁c₂ + c₃ − s₁s₂)/(s₁s₂)` and `c₁c₂ − s₁s₂ = cos(π/a + π/b)`.
3. **The matrices.**

   ```text
   X := !![ c₁,  s₁ ; −s₁,  c₁ ]        Y := !![ c₂,  μ · s₂ ; −μ⁻¹ · s₂,  c₂ ]
   ```

   Both have determinant `1`. Prove `tr X = 2c₁`, `tr Y = 2c₂`, and
   `tr (Y * X) = 2c₁c₂ − s₁s₂(μ + μ⁻¹) = −2c₃`, the last being exactly what the choice of
   `κ` arranges. Hence in `PSL(2,ℝ)` the images satisfy `X^a = 1`, `Y^b = 1`,
   `(Y·X)^c = 1`. Use the Cayley–Hamilton/strict-elliptic power lemma: if `m ≥ 2` and
   `tr(A)^2 = (2 cos(π/m))^2`, then `[A]^m=1` in `PSL(2,ℝ)`. The eigenvalues of `A` are
   the two distinct conjugate unit roots with angle `π/m` or `π-π/m`; its `m`-th power
   is scalar `±I`. Here `a,b,c ≥ 2`, including `tr(YX)=-2 cos(π/c)`, so the lemma applies
   to all three matrices. In the strict elliptic case an `SL₂` conjugate rotation has
   angle `±θ`; the geometric projective rotation has doubled angle. Trace `2` at `θ=0`
   permits nontrivial unipotents and is not an elliptic case. Thus 4.1 gives a homomorphism
   `TriangleGroup a b c →* PSL(2,ℝ)`.
4. **The Fricke trace identity.** For `A, B ∈ SL(2,ℝ)`,

   ```text
   tr (A * B * A⁻¹ * B⁻¹) = (tr A)² + (tr B)² + (tr (A*B))² − tr A · tr B · tr (A*B) − 2 ,
   ```

   proved by expanding both sides in the eight matrix entries subject to
   `det A = det B = 1`. Substituting the three traces of 3 gives

   ```text
   tr (X Y X⁻¹ Y⁻¹) = 4 (c₁² + c₂² + c₃² + 2 c₁ c₂ c₃) − 2 ,
   ```

   which by 2 is `> 2` exactly in the hyperbolic case.
5. **Trace `> 2` forces infinite order.** An `A ∈ SL(2,ℝ)` with `|tr A| > 2` has real
   eigenvalues `λ, λ⁻¹` with `|λ| > 1`, so `tr (A ^ n) = λⁿ + λ⁻ⁿ` is unbounded and
   `A ^ n ≠ ±1` for `n ≠ 0`. Hence the image of `X Y X⁻¹ Y⁻¹` in `PSL(2,ℝ)` has infinite
   order, so the image of the representation is infinite, so `TriangleGroup a b c` is
   infinite.

**Faithfulness of the representation is not claimed and not needed** — only that the image
is infinite. ⚠ The element exhibited must be the **commutator**. The obvious shorter words
are not hyperbolic in general: `X` and `Y` are elliptic by construction, `tr (X·Y) = −2c₃`
has absolute value `< 2` always, and `tr (X·Y⁻¹) = 4c₁c₂ + 2c₃` degenerates whenever
`a = 2`, where `c₁ = 0`. At `(a,b,c) = (2,3,7)` those two traces are `∓2cos(π/7) ≈ ∓1.802`,
while the commutator's is `4(cos²(π/3) + cos²(π/7)) − 2 ≈ 2.247`.

*Source:* Girondo–González-Diez §2.4 is the classical treatment, and it takes a different
route: a hyperbolic triangle with angles `π/a, π/b, π/c`, the three reflections in its sides,
and **Theorem 2.27 (Poincaré's polygon theorem)** for discreteness, with infiniteness falling
out of the tessellation. ⚠ **That book prints no matrices for the general hyperbolic case and
no trace formula** — its explicit matrices are confined to the two worked examples
`Γ_{2,3,∞} = PSL(2,ℤ)` (**Theorem 2.31**) and `Γ_{∞,∞,∞} = Γ(2)` (**Theorem 2.34**). So the
construction above is this roadmap's, chosen because it needs only `SL(2,ℝ)` arithmetic and
real trigonometry, where the geometric route would first require hyperbolic area, geodesics
and Poincaré's theorem — a development no roadmap owns and this one does not need.

⚠ *Nearby false statement:* discreteness is *not* what this milestone claims. The image being
infinite needs one element of infinite order; discreteness of the image, and faithfulness,
are strictly stronger and are where the geometric route's real work lies.

*Prerequisites:* Layers 4.1, 4.4; Mathlib `Matrix.SpecialLinearGroup`, `Matrix.trace`,
`Real.cos`, `Real.sin`, `Real.sqrt`.

*Tau Ceti:* `TauCeti.TriangleGroup.pslRep`,
`Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`,
`Matrix.ProjectiveSpecialLinearGroup.not_isOfFinOrder_mk_of_two_lt_abs_trace` and
`TauCeti.TriangleGroup.infinite_of_inv_add_inv_add_inv_lt_one`.

#### 4.6 Regular triples and normal subgroups

A connected triple is *regular* when its automorphism group acts transitively on `Fin n`
(equivalently, by 0.4, the monodromy action is free and transitive on a nonempty fiber —
each characterization proved). Prove the correspondence: isomorphism classes of regular
connected triples with orders dividing `(a,b,c)` biject with finite-index normal subgroups
of `TriangleGroup a b c`, the deck/automorphism group being the finite quotient; under 4.2
the correspondence restricts the classification to the regular locus. The `torusTriple` is
the worked example (`N ⊴ TriangleGroup 4 4 2` of index `4`).

*Prerequisites:* Layers 0.4, 4.2; Mathlib `Subgroup.Normal`, quotient groups.

*Tau Ceti:* `TauCeti.PermutationTriple.IsRegular`, `TauCeti.TriangleGroup.regularIsoClassEquiv`,
`isRegular_cosetTriple_iff`, `automorphismGroupMulEquivQuotientKer` and
`index_ker_toPerm_torusTriple`.

### Layer 5: the thrice-punctured sphere and its fundamental group

The concrete model is affine: `ℙ¹(ℂ) ∖ {0, 1, ∞}` is `ℂ ∖ {0, 1}`, and the sphere enters
only through the open embedding of 5.1.

⚠ **There is a classical route that this roadmap deliberately does not take.**
Girondo–González-Diez **Theorem 2.34** identifies the triangle group `Γ_{∞,∞,∞}` with the
principal congruence subgroup `Γ(2)` and with the fundamental group of the thrice-punctured
sphere, and pp. 125–126 match its three generators with loops around `0`, `1` and `∞`
explicitly. Taking that as the definition would import uniformization, Fuchsian groups and
the modular group — material belonging to the modular-forms family that nothing else here
needs. The route below computes the fundamental group directly instead, and Layer 5.6's
result is the same isomorphism.

**The route is pinned, and its one general input comes from AlgebraicTopology.** Mathlib has
no Seifert–van Kampen theorem in any form, and Seifert–van Kampen for two open sets with
simply connected intersection is general algebraic topology rather than Belyi mathematics:
5.5 records the exact declarations this roadmap requires of AlgebraicTopology Stage 1, which
Tau Ceti implements, and 5.6 instantiates them at 5.1's two-set cover. Everything else in this layer is Belyi's own. The base case
`π₁(ℂ ∖ {0}) ≅ ℤ` is not proved by hand either — it is read off the pin's
`Complex.isAddQuotientCoveringMap_exp`, which presents `exp : ℂ → ℂ ∖ {0}` as the quotient of
the (convex, hence simply connected) plane by `AddSubgroup.zmultiples (2 * π * I)`.

#### 5.1 The base space and its standard two-set cover

Define

```text
U := {z : ℂ // z ≠ 0 ∧ z ≠ 1}
```

with basepoint `b := 1/2`, and the two open sets

```text
A := U ∩ {z | z.re < 1} ,      B := U ∩ {z | 0 < z.re} .
```

Prove the four facts the rest of the layer runs on, each an explicit computation:

- `A ∪ B = U` (if `re z < 1` then `z ∈ A` unless `z = 0`; otherwise `re z ≥ 1 > 0` so
  `z ∈ B` unless `z = 1`);
- `A = {z | z.re < 1} ∖ {0}` and `B = {z | 0 < z.re} ∖ {1}` — each an open **convex** set
  with one point removed, the point being interior to it;
- `A ∩ B = {z | 0 < z.re ∧ z.re < 1}`, the open vertical strip, with **no** point removed,
  because neither `0` nor `1` lies in it. The strip is convex, hence contractible, hence
  simply connected and path-connected, and it contains `b`;
- `b ∈ A ∩ B`.

**New object: `U`.** Basic API:

- *Constructors and instances.* `TopologicalSpace`, `T2Space`, `LocallyPathConnectedSpace`,
  `PathConnectedSpace`, second countability, and `TauCeti.SemilocallySimplyConnectedSpace`,
  the hypothesis class of Tau Ceti's universal-cover API. All follow from "open subset of `ℂ`",
  and each is proved once here rather than at each use. `Nonempty`, the coercion to `ℂ`, and the two membership
  lemmas `ne_zero`, `ne_one`.
- *Examples.* `b = 1/2`; the two circles of 5.2.
- *Morphisms and functoriality.* The open embedding `U ↪ ℂ`; the open embedding
  `U ↪ OnePoint ℂ` with image the complement of `{0, 1, ∞}` — the statement that makes
  "thrice-punctured **sphere**" honest, and the one Layers 7 and 8 extend across.
- *The three standard punctured-disc neighbourhoods,* pinned here once and consumed by
  5.2, 5.4 and 7.2:

  ```text
  D₀*  := {z | 0 < |z| < 1/2}      D₁*  := {z | 0 < |z − 1| < 1/2}
  D∞* := {z | 2 < |z|}
  ```

  Prove each is an open subset of `U`, that they are pairwise disjoint, and that each is
  the image of a punctured disc under a chart of `OnePoint ℂ` centred at its puncture —
  for `D∞*` this is the chart `w = 1/z`, in which it is `{w | 0 < |w| < 1/2}`.
- *Comparison lemmas.* The **six** anharmonic self-homeomorphisms of `U`, each named and each
  proved to be a self-homeomorphism (that `U` is closed under the map is one non-vanishing
  computation per puncture), with the puncture permutation it induces on `{0, 1, ∞}`:

  ```text
  mobId     z ↦ z                 ()          fixes b
  mob01     z ↦ 1 − z             (0 1)       fixes b
  mob1Inf   z ↦ z/(z − 1)         (1 ∞)       b ↦ −1
  mob0Inf   z ↦ 1/z               (0 ∞)       b ↦ 2
  mobRot    z ↦ 1/(1 − z)         (0 1 ∞)     b ↦ 2
  mobRotInv z ↦ (z − 1)/z         (0 ∞ 1)     b ↦ −1
  ```

  `mob01` and `mob1Inf` generate, and both are self-homeomorphisms `≃ₜ` of `U`; the other four
  are their composites, `mobRot = mob01 ∘ mob1Inf`, `mobRotInv = mob1Inf ∘ mob01` and
  `mob0Inf = mob01 ∘ mob1Inf ∘ mob01`. ⚠ Pulling covers back is **contravariant** in the map,
  so the composite of two Möbius transformations induces the *reverse* composite of branch-point
  operations — `mobRot` induces `rot = swap1Inf ∘ swap01` — which is the same inversion as in
  Layer 2.6's table and must not be introduced a second time by mismatching the two.
  ⚠ **The identity and `mob01` fix the basepoint**: the orbit of `b = 1/2` under
  the anharmonic group is `{1/2, 2, −1}`, so the other four operations move `b` and act on
  `π₁(U, b)` only after a choice of connecting path. That is the topological source of Layer
  2.6's finding that the `S₃`-action lives on isomorphism classes, and Layer 6.3 is where the
  two are matched. The value lemmas that make the action on the *chosen* generators — and not
  merely on their conjugacy classes — computable are stated with the loops, in 5.2.
- *Edge cases.* `A` and `B` are each connected but neither is simply connected; `A ∩ B` is
  simply connected but is **not** all of `U`.
- *Downstream interfaces.* Layers 6, 7, 8, and the analytic side of 12.4.

⚠ The open-cover and overlap hypotheses are independent checks. Replacing the chosen
pieces by `A = U ∩ {re < 1/2}` and `B = U ∩ {re > 1/2}` gives empty intersection and misses
the entire midline, so it is not a cover. Moving overlap boundaries so that a puncture is
inside the strip can instead destroy simple connectivity. Keep the actual pieces and
prove the cover, both path-connectedness statements and the simply connected overlap
separately before applying 5.5–5.6.

*Prerequisites:* Mathlib `Complex`, `LocallyPathConnectedSpace`, `OnePoint`,
`Convex.isPathConnected`; Tau Ceti `TauCeti.SemilocallySimplyConnectedSpace` (UniversalCovers
milestone 2).

*Tau Ceti:* `TauCeti.ThricePuncturedSphere` with `basePt`, `leftOpen`, `rightOpen`,
`leftOpen_union_rightOpen` and `isSimplyConnected_leftOpen_inter_rightOpen`; its instances,
semilocal simple connectivity coming through `StronglyLocallyContractibleSpace`; the three
punctured neighbourhoods with `puncturedNeighborhoodInfHomeomorphPuncturedDiscOneHalf`; and the
anharmonic maps `mob01`, `mob1Inf`, `mob0Inf`, `mobRot`, `mobRotInv`. The edge-case statements
about `A`, `B` and `A ∩ B` and the chart description of `D∞*` in `OnePoint ℂ` remain.

#### 5.2 The peripheral loops

The two loops at `b`, both traversed counterclockwise in the affine chart:

```text
γ0 (t) = (1/2) · exp (2πit)          -- the circle |z| = 1/2, inside A
γ1 (t) = 1 − (1/2) · exp (2πit)      -- the circle |z − 1| = 1/2, inside B
```

Both are loops at `b = 1/2`, since `γ0 0 = γ0 1 = 1/2` and `γ1 0 = γ1 1 = 1/2`; both avoid
both punctures, since `|γ0 t| = 1/2` and `|γ1 t − 1| = 1/2`; and their images `C₀`, `C₁`
lie in `A` and `B` respectively. The two circles are externally tangent — the distance
between their centres is `1 = 1/2 + 1/2` — so they meet exactly at `b`. ⚠ That makes the
picture a figure eight rather than two crossing circles, and nothing more: **no milestone
retracts `U` onto `C₀ ∪ C₁`**, and the fundamental group is computed by AlgebraicTopology's
two-open van Kampen theorem (5.5) instead.

Define the peripheral elements of `FundamentalGroup U b`:

```text
periph0 := ⟦γ0⟧ ,   periph1 := ⟦γ1⟧ ,   periphInf := (periph1 * periph0)⁻¹ ,
```

so that

```text
periphInf * periph1 * periph0 = 1
```

holds **by definition**. That identity is bookkeeping; the mathematical content is the
geometric identification of `periphInf` as a loop around `∞`, which is Layer 5.8 and needs
the fundamental-group computation first. This milestone owns only the definitions and the
two facts that make them well posed: the images `C₀ ⊆ A` and `C₁ ⊆ B`, and the tangency.

Also prove here the two identities that Layer 5.8 and Layer 6.3 both use, where `mob01` is
5.1's basepoint-fixing self-homeomorphism `z ↦ 1 − z`:

```text
mob01_basePt :  mob01 b = b
mob01_γ0     :  mob01 (γ0 s) = γ1 s          mob01_γ1 :  mob01 (γ1 s) = γ0 s
```

⚠ State the last two **pointwise in `s`**, on the nose. Both are immediate from
`1 − (1 − w) = w`, and the pointwise form is what avoids transporting a `Path`, or a class in
`FundamentalGroup U (mob01 b)`, along `mob01_basePt`. They are what Layer 6.3 turns into the
level-1 statement of the branch-point action; the other four basepoint-moving operations of 2.6 admit no such
lemma, because their Möbius maps move `b`.

⚠ *Nearby false statement:* "the loop around `∞` is counterclockwise" is meaningless
without naming the chart. The transition `w = 1/z` reverses the apparent orientation, so
the same curve is clockwise in `z` and counterclockwise in `w`. Every source citation in
this roadmap that fixes a peripheral orientation records the chart it uses; a citation
that does not is not usable for a sign.

*Prerequisites:* Layer 5.1; Mathlib `Complex.exp`, `Path`, `Path.Homotopic.Quotient`.

*Tau Ceti:* `TauCeti.ThricePuncturedSphere.γ0`, `γ1`, `range_γ0_inter_range_γ1`, `periph0`,
`periph1`, `periphInf`, `periphInf_mul_periph1_mul_periph0`, `mob01_basePt`, `mob01_γ0` and
`mob01_γ1`.

#### 5.3 The monodromy homomorphism

For a covering map `p : E → X` and `x : X`, package the pin's `IsCoveringMap.monodromy`
as a group homomorphism

```text
monodromyHom : FundamentalGroup X x →* Equiv.Perm (p ⁻¹' {x}) ,
```

taking `IsCoveringMap.monodromy_bijective` for the `Equiv` and
`IsCoveringMap.monodromy_trans_apply` for multiplicativity.

**New object: `monodromyHom`.** Basic API:

- *Constructors and instances.* The definition; the value lemma
  `monodromyHom γ e = p.monodromy (FundamentalGroup.toPath γ) e`.
- *Examples.* The trivial cover, where it is trivial; the exponential cover of 5.4, where
  it is the translation action of `ℤ` on `2πiℤ`.
- *Morphisms and functoriality.* Naturality in maps of covers over `X`; compatibility with
  `FundamentalGroup.map` under pullback along `f : Y → X`, namely
  `monodromyHom (f* p) = monodromyHom p ∘ FundamentalGroup.map f` modulo the canonical
  identification of fibers.
- *Comparison lemmas and naturality.* Transport along a numbering `ν` of the fiber:
  `ν.permCongr ∘ monodromyHom` is again a homomorphism, and changing `ν` conjugates it.
- *Edge cases.* Empty fiber; fiber of size one.
- *Downstream interfaces.* Layers 5.4, 5.6, 6.1, 6.3, 7.1.

⚠ **The direction is a theorem of the pin, not a choice.** `monodromy_trans_apply` reads
`monodromy (γ.trans γ') = monodromy γ' ∘ monodromy γ`, and `End.mul_def` makes `γ * γ'` in
`FundamentalGroup` the class of `γ'.trans γ`. Together these make `monodromyHom` a
homomorphism with no `ᵐᵒᵖ` and no inversion; the roadmap's product relation
(§Pinned conventions) is the consequence. A treatment that composes paths in the other
order gets an antihomomorphism here and must invert, and that inversion propagates all the
way to the branch-cycle exponent of Layer 12.11.

*Prerequisites:* Mathlib `IsCoveringMap.monodromy`, `monodromy_trans_apply`,
`monodromy_bijective`, `CategoryTheory.End.mul_def`.

*Tau Ceti:* Mathlib's `IsCoveringMap.monodromyPerm`, with
`TauCeti.ConnectedCoveringSpace.pullbackFiberEquiv_monodromy` for pullback along homeomorphisms.
Pullback along a general map, the two examples, the edge cases, and a standalone statement that
changing `ν` conjugates remain.

#### 5.4 Punctured convex domains

The reusable computation, stated for a convex open `V ⊆ ℂ`, a point `p ∈ V`, and a radius
`r > 0` with the circle `|z − p| = r` contained in `V`:

- **The retraction.** The radial map `z ↦ p + r·(z − p)/|z − p|` is a deformation retraction
  of `V ∖ {p}` onto that circle, along the straight-line homotopy. Both endpoints of each
  homotopy segment lie on the ray from `p` through `z`, at distances between
  `min(|z − p|, r)` and `max(|z − p|, r)` from `p`; convexity of `V` puts the whole segment
  `[p, p + r·u]` in `V`, and the distance bound keeps it off `p`.
- **The base computation.** `π₁(ℂ ∖ {0}, 1) ≅ ℤ`, generated by the counterclockwise unit
  circle. Proof: `Complex.isAddQuotientCoveringMap_exp` exhibits `ℂ ∖ {0}` as the quotient
  of `ℂ` by `AddSubgroup.zmultiples (2πi)` acting freely and properly discontinuously; `ℂ`
  is convex, hence simply connected; so Mathlib's
  `IsAddQuotientCoveringMap.fundamentalGroupEquiv` applies and `π₁` is the acting group.
  ⚠ That identification lands in the **opposite** group, `(Multiplicative G)ᵐᵒᵖ`, the same
  convention as UniversalCovers milestone 5 (`TauCeti.UniversalCover.deckFundamentalGroupEquiv`);
  the `ᵐᵒᵖ` is invisible here only because `ℤ` is abelian; do not carry the habit into Layer
  6.4, where it is not.
- **The transport.** For `V`, `p`, `r` as above, the inclusion `V ∖ {p} ↪ ℂ ∖ {p}` is a
  homotopy equivalence, because both deformation-retract onto the same circle; hence
  `π₁(V ∖ {p})` is infinite cyclic, generated by the circle loop of radius `r` about `p`.
- **The invariant.** The isomorphism `π₁(V ∖ {p}) ≅ ℤ` is the **winding number about `p`**:
  state it as such, so that a loop's class in `V ∖ {p}` is *computed* rather than merely
  known to exist. This is the form Layer 5.8 consumes, and it is available only inside a
  punctured convex domain — see the warning there.
- **The three instances.** `A` with `p = 0`, `r = 1/2`, whose generator is the class of `γ0`
  **in `A`** — the element that the inclusion `A ↪ U` carries to `periph0`, a distinction
  5.6 needs and 5.2 does not make; `B` with `p = 1`, `r = 1/2`, similarly for `γ1` and
  `periph1` (transport along `z ↦ 1 − z`, which by 5.2 carries `γ0` to `γ1` on the nose and
  reverses no orientation, being holomorphic); and the punctured unit disc `𝔻*` with
  `p = 0`, `r = 1/2`, which Layer 7.1 consumes.

*Source:* the covering-space computation of `π₁(S¹)` is Hatcher, *Algebraic Topology*,
Theorem 1.7; the route here replaces `ℝ → S¹` by the pin's `exp : ℂ → ℂ ∖ {0}`, which is
the same argument with the same proof and an already-formalized covering map.

*Hypotheses:* `V` convex and open, `p ∈ V`, `r > 0`, and `Metric.sphere p r ⊆ V`. Convexity
is used only through "the segment from `p` to a point of the sphere stays in `V`"; a
star-shaped hypothesis about `p` would do, and the milestone states the convex form
because both instances are convex and Mathlib's `Convex` API is the one in place.

⚠ *Nearby false statement:* a punctured **connected** open set is not homotopy equivalent
to a circle — the punctured annulus is a counterexample. Convexity (or star-shapedness
about the puncture) is doing real work.

*Prerequisites:* Layers 5.1, 5.2; Mathlib `Complex.isAddQuotientCoveringMap_exp`,
`IsQuotientCoveringMap`, `IsAddQuotientCoveringMap.fundamentalGroupEquiv`, `Convex`,
`ContinuousMap.Homotopy`, the winding-number/index API.

*Tau Ceti:* `StarConvex.fundamentalGroupMulEquivInt` (stated for star-convex domains),
`StarConvex.radialHomotopy`, the winding number as the degree of `Complex.directionFrom`, and
the instances `TauCeti.ThricePuncturedSphere.leftOpenFundamentalGroupMulEquivInt_periph0Left`
and `rightOpenFundamentalGroupMulEquivInt_periph1Right`. The punctured-disc instance is
`TauCeti.zpowers_loopAround_eq_top` in general form only.

#### 5.5 Van Kampen with a simply connected intersection: the AlgebraicTopology input

**Not a milestone of this roadmap.** Seifert–van Kampen for two open sets with simply
connected intersection is general algebraic topology, reusable by anything that computes a
fundamental group, and it is owned by [AlgebraicTopology](../AlgebraicTopology/README.md) (its
Stage 1). This section exists to state the contract exactly, so that the instantiation in 5.6 has something
to `apply` and so that no second copy is written anywhere.

For a space `X`, open `A, B` with `A ∪ B = X`, a basepoint `x ∈ A ∩ B`, with `A`, `B`,
`A ∩ B` path-connected and `A ∩ B` simply connected, the declarations consumed are **the
canonical map**

```text
vanKampenLift : FundamentalGroup A x ∗ FundamentalGroup B x  →*  FundamentalGroup X x
vanKampenLift := Monoid.Coprod.lift (π₁ of the inclusion A ↪ X) (π₁ of the inclusion B ↪ X)
```

its bijectivity `vanKampenLift_bijective`, the named

```text
vanKampenEquiv : FundamentalGroup A x ∗ FundamentalGroup B x  ≃*  FundamentalGroup X x
```

**and `vanKampenEquiv.toMonoidHom = vanKampenLift`**. ⚠ A bare `Nonempty (… ≃* …)` is too
weak to be consumed: 5.6 reads the *values* of this isomorphism on `periph0` and `periph1`
off the inclusions, and an unnamed abstract isomorphism supports no such computation. This
roadmap therefore needs the canonical map named, not merely the existence of some
isomorphism, and needs `MulEquiv.ofBijective`'s defeq recorded as the fourth declaration.

⚠ Path-connectedness of `A ∩ B` is not optional even when the intersection is simply
connected in the naive sense: a two-component intersection makes the theorem false (`S¹`
decomposes into two arcs meeting in two contractible pieces, and `π₁(S¹) = ℤ` is not the free
product of two trivial groups). The instantiation in 5.6 discharges it from convexity of the
strip, so the hypothesis must be present in the supplier's statement.

*Source:* Hatcher, *Algebraic Topology*, Theorem 1.20 (van Kampen), specialized to two sets
with simply connected intersection, where the amalgamating subgroup is trivial and the
pushout is the free product.

*Prerequisites:* Roadmap AlgebraicTopology, Stage 1, item 4. Nothing in this
layer is discharged by a Belyi-local proof of it.

*Tau Ceti:* the general theorem, `TauCeti.vanKampenLift`, `TauCeti.vanKampenLift_bijective`,
`TauCeti.vanKampenEquiv` and `TauCeti.vanKampenEquiv_toMonoidHom`. Its cover hypothesis is
`interior A ∪ interior B = univ`, which open `A` and `B` with `A ∪ B = X` satisfy, and the
hypothesis on the intersection is `IsSimplyConnected (A ∩ B)`, which includes
path-connectedness.

#### 5.6 The fundamental group of the thrice-punctured sphere

Apply 5.5's supplier declarations to the cover of 5.1 and 5.4's computation of the two
factors:

```text
FundamentalGroup U b  ≃*  ℤ ∗ ℤ  ≃*  FreeGroup (Fin 2) ,
```

the second isomorphism being the free-product-of-free-groups identification, and the
composite sending `FreeGroup.of 0 ↦ periph0` and `FreeGroup.of 1 ↦ periph1`. State the
isomorphism as a named `MulEquiv` together with those two value lemmas — later layers use
the values, never the mere existence. Corollaries: `periphInf` corresponds to
`(of 1 * of 0)⁻¹`; the three peripheral elements generate; and a homomorphism out of
`FundamentalGroup U b` is determined by its values on `periph0` and `periph1`, with any
pair of values realized (the free universal property, which is what Layer 6.2 consumes).

⚠ *Nearby false statement:* the three peripheral elements do not freely generate — they
satisfy the one relation of 5.2, and any two of them freely generate while all three do
not. Statements about "the three generators" always mean the ordered triple with its
relation, never a free basis of rank three.

*Prerequisites:* Layers 5.1, 5.2, 5.4; Roadmap AlgebraicTopology, Stage 1, item 4
(Layer 5.5 above); Mathlib `FreeGroup`, `Monoid.Coprod`, `FreeGroup.lift`.

*Tau Ceti:* `TauCeti.ThricePuncturedSphere.fundamentalGroupMulEquivFreeGroup`, from `π₁` to
`FreeGroup (Fin 2)`, with its values on the peripheral elements,
`closure_periph0_periph1_periphInf` and `fundamentalGroup_hom_ext`.

#### 5.7 Basepoint change

Along a path from `b` to another basepoint, the induced isomorphism of fundamental groups
carries the peripheral elements to conjugates of themselves, and the three peripheral
**conjugacy classes** are independent of the path and of the basepoint. State the
conjugacy-class invariance as the milestone; the element-level statement is false without
fixing a path, and that failure is the topological origin of the outer form of the Galois
action in Layer 12.8.

*Prerequisites:* Layers 5.2, 5.6; Mathlib `FundamentalGroup.fundamentalGroupMulEquivOfPath`;
Tau Ceti `FundamentalGroup.basepointChangeSubgroup` (UniversalCovers milestone 7).

*Tau Ceti:* `TauCeti.ThricePuncturedSphere.periph0Class`, `periph1Class`, `periphInfClass` and
`conjClassesEquivOfPath_mk_periph0` with its companions.

#### 5.8 The loop at infinity

`periphInf` was *defined* in 5.2 so that the relation holds. This milestone proves it is
what its name says: the peripheral class at the third puncture. **One route, cut into the
pieces that prove it**, entirely inside the two-set cover of 5.1 and the punctured-convex
computation of 5.4. Let

```text
δ (t) := 3 · exp (2πit) ,     p± := 1/2 ± i·(√35)/2 ,
```

so `δ` is the counterclockwise circle of radius `3`, contained in `D∞*`, and `p±` are its
two points with `re = 1/2`. Let `α±` be the vertical segments from `b` to `p±`, let
`a : p+ ⟶ p−` be the arc of `δ` with `re ≤ 1/2` and `c : p− ⟶ p+` the arc with `re ≥ 1/2`,
each traversed counterclockwise, so that `δ` based at `p+` is `a` then `c`. Then:

1. **Containment.** `a` lies in `A`, `c` lies in `B`, and `α±` and `p±` lie in the strip
   `A ∩ B`. Each is an inequality on `re` and on `|z|` or `|z − 1|`.
2. **The two winding numbers.** `ℓ_A := α+ · a · ᾱ−` is a loop at `b` inside `A` whose
   winding number about `0` is `1`, and `ℓ_B := α− · c · ᾱ+` is a loop at `b` inside `B`
   whose winding number about `1` is `1`. Each is a computation of an argument increment
   along three explicit pieces.
3. **Identification of the classes.** By 5.4's winding-number invariant those loops
   generate `π₁(A, b)` and `π₁(B, b)`, so their images in `π₁(U, b)` are `periph0` and
   `periph1`.
4. **Assembly.** `α+ · δ · ᾱ+ ≃ ℓ_A · ℓ_B` as paths — the two copies of `α−` cancel — so in
   `FundamentalGroup U b`, where `γ * δ` is "`δ` first, then `γ`",

   ```text
   ⟦α+ · δ · ᾱ+⟧ = periph1 * periph0 = periphInf⁻¹ .
   ```

Conclude: `periphInf` is the class of the circle of radius `3` traversed **clockwise**,
transported along `α+`; and, by 5.7, its **conjugacy class** is the image of the generator
of `π₁(D∞*)` that is counterclockwise in the chart `w = 1/z`, independently of the
transporting path. That conjugacy class is what Layer 7.2 consumes at the puncture `∞`.

⚠ *Nearby false statement:* the pair of winding numbers about `0` and about `1` does
**not** determine a class, or even a free homotopy class, in `U`. It is the image in the
abelianization of a free group of rank `2`, so every commutator has pair `(0,0)`. Step 2
uses winding numbers only **inside `A`** and **inside `B`**, where 5.4 has made them a
complete invariant; a proof that used them in `U` itself would prove nothing.

*Prerequisites:* Layers 5.1, 5.2, 5.4, 5.6, 5.7; Mathlib `Path.trans`, `Path.symm`,
the winding-number/index API.

*Tau Ceti:* `TauCeti.ThricePuncturedSphere.periphInf_eq_fromPath`,
`infFundamentalGroupMulEquivInt_δInf`, `transport_δInf_eq_periphInf` and
`conjClassesEquivOfPath_δInf`. The proof goes through closed half-planes rather than the winding
numbers of `ℓ_A` and `ℓ_B`; the conclusions are the ones stated.

### Layer 6: finite covers and their triples

#### 6.1 Three rigidifications of a cover, and the monodromy triple

⚠ **A literal `PermutationTriple n` is the invariant of a cover with a numbered fiber, not
of a pointed cover and not of a bare cover.** A chosen point of the fiber does not identify
the fiber with `Fin n`; the relabelings fixing that point survive. The three carriers are
therefore separated here, once, and Layer 6.3 classifies each of them by its own
combinatorial object.

⚠ **All three carry connectedness as a field, and the degree as an index.** A literal
*transitive* triple corresponds to a *connected* numbered cover: drop path-connectedness of
`E` and the monodromy action on the fiber need not be transitive, so 6.3(1) is simply false.
The two consistent packages are *connected numbered covers ↔ connected triples* and
*arbitrary numbered covers ↔ arbitrary product-one triples*; this roadmap pins the first, and
puts connectedness in the type rather than as a side hypothesis on the theorems. Likewise the
degree `n` is a parameter of all three carriers, not something recovered afterwards, so that
each carrier is the exact domain of one classification.

```text
ConnectedFiberNumberedCover b n
  := p : E → U covering, PathConnectedSpace E, ν : p ⁻¹' {b} ≃ Fin n
ConnectedPointedCover b n
  := p : E → U covering, PathConnectedSpace E, e : p ⁻¹' {b}, Nonempty (p ⁻¹' {b} ≃ Fin n)
ConnectedCover b n
  := p : E → U covering, PathConnectedSpace E,               Nonempty (p ⁻¹' {b} ≃ Fin n)
```

with, in each case, the exact notion of isomorphism, all three being homeomorphisms over
`U` — that is, `f : E ≃ₜ E'` with `p' ∘ f = p`:

- **numbered** (`ConnectedFiberNumberedCoverIso`): additionally `f (ν.symm i) = ν'.symm i`
  for every label `i`, so an isomorphism preserves the label of every point of the fiber;
- **pointed** (`ConnectedPointedCoverIso`): additionally `f e = e'`, which constrains one
  point only;
- **unnumbered** (`ConnectedCoverIso`): no further condition.

For a `ConnectedFiberNumberedCover b n` the triple is

```text
σ_i := ν.permCongr (monodromyHom p periph_i)   for i = 0, 1, ∞ ,
```

a `PermutationTriple n`: the relation is `monodromyHom` applied to 5.2's relation, and it
is a relation on the nose because 5.3 gives a homomorphism.

Prove: `E` is path-connected iff the triple is connected (path lifting identifies the
monodromy orbits on the fiber with the path components of `E`, and `n ≠ 0` matches
`Nonempty E`) — with connectedness in the carrier this says that the triple of a carrier is
connected, and its converse is what makes 6.3(1) surjective; the degree is well-defined (the
fiber cardinality is locally constant on the connected base, hence constant, so every fiber
of a `ConnectedCover b n` is in bijection with `Fin n`, which is what lets the degree be
pinned at `b` without loss); the triple is **unchanged** by an isomorphism of
fiber-numbered covers; changing `ν` by `τ` relabels the triple by
`τ` (Layer 0.2); changing the basepoint along a path conjugates it (5.7). Consequently the
triple itself is an invariant of the fiber-numbered cover, and its **isomorphism class** is
an invariant of the underlying cover alone.

⚠ *Nearby false statement:* connectedness of `E` is transitivity of the monodromy group on
the fiber, not transitivity of the image of any one peripheral element, and not
connectedness of `E` as a set of points over a single point. The empty cover has `n = 0`
and is not connected, exactly matching Layer 0.4.

*Source:* Girondo–González-Diez §2.7 defines the monodromy of a degree-`d` morphism and its
`Mon(f) ≤ Σ_d`, with connectedness giving transitivity, and states that the homomorphism is
well defined up to conjugation by the numbering of the fibre and by the base point.

⚠ **That book inverts where this roadmap does not, and the two agree.** It defines
`M_f(γ) = σ_γ⁻¹` and says explicitly that taking `σ_γ` itself "would have obtained an
anti-homomorphism". That is because its `π₁` multiplies paths in the geometers' order; the
pin multiplies them in the opposite order (`End.mul_def`), which makes the *un-inverted*
`σ_γ` a homomorphism here. The net effect is that the book's monodromy triples are the
componentwise inverses of this roadmap's — the same relation the LMFDB's stored triples bear
to it, and the same Layer 0.1 involution translates both. Three independent conventions,
one bridge.

*Prerequisites:* Layers 0.1–0.4, 5.3, 5.7; Mathlib `IsCoveringMap`,
`IsCoveringMap.exists_path_lifts`.

*Tau Ceti:* `TauCeti.ConnectedFiberNumberedCover`, `TauCeti.ConnectedPointedCover` and
`TauCeti.ConnectedCover`, over a base `X : TopCat` and bundling a
`TauCeti.ConnectedCoveringSpace X`, so that an isomorphism is one of the underlying covers;
`ConnectedFiberNumberedCover.connectedTriple`, `IsCoveringMap.isConnected_monodromyTriple_iff`,
`connectedTriple_smul`, `TauCeti.ConnectedCover.nonempty_equiv_fin_of_mem_connectedComponent`
and `permCongrHom_comp_monodromyPerm_basepointChange`.

#### 6.2 The associated cover of a `π₁`-set

The converse construction, and the place where a cover is built rather than analysed. The
general construction, for an arbitrary discrete `π₁`-set, is Tau Ceti's, from the completed
[UniversalCovers](../../Completed/UniversalCovers/README.md) roadmap. This milestone consumes it by
name, pins how its conventions meet this roadmap's, and owns the finite corollary and the
instantiation at `U`.

The standing hypotheses are exactly the supplier's:

```text
[TopologicalSpace X] [PathConnectedSpace X] [LocallyPathConnectedSpace X]
[TauCeti.SemilocallySimplyConnectedSpace X]
```

with `x : X`, `Ũ := TauCeti.UniversalCover x` its universal cover, and
`q := TauCeti.UniversalCover.proj : Ũ → X` the projection.
⚠ Semilocal simple connectivity is **not** optional and is not implied by the others: the
Hawaiian earring is path-connected and locally path-connected and has no universal cover.
`U` of 5.1 satisfies all three because it is an open subset of `ℂ` (Layer 5.1's instance
list), and that is where the hypotheses are discharged for this roadmap's use.

**The action, pinned.** Tau Ceti's `π₁(X, x)` acts on `Ũ` on the **left**
(`MulAction (FundamentalGroup X x) (TauCeti.UniversalCover x)`), and monodromy along `γ` carries
the constant-path point `ũ₀ := TauCeti.UniversalCover.basepointLift x` to `γ⁻¹ • ũ₀`
(`TauCeti.UniversalCover.monodromy_basepointLift`). Writing `ũ · γ := γ⁻¹ • ũ` for the right
action this defines, `(ũ · δ) · γ = ũ · (δ γ)` and `ũ₀ · γ = monodromy γ ũ₀` on the fiber; this
right action is the `ᵐᵒᵖ` of UniversalCovers milestone 5,
`TauCeti.UniversalCover.deckFundamentalGroupEquiv x : deck q ≃* (FundamentalGroup X x)ᵐᵒᵖ`. For a
discrete `π₁`-set `S` the diagonal action on `Ũ × S` is

```text
γ ⋆ (ũ, s) := (γ • ũ, γ • s) = (ũ · γ⁻¹, γ • s)
```

This is a genuine **left** action, and the inverse in the right-action form is exactly what the
`ᵐᵒᵖ` of milestone 5 forces. The associated cover is

```text
assocCover S := TauCeti.UniversalCover.ActionCover x S     -- (Ũ × S) ⧸ ⋆
p            := TauCeti.UniversalCover.actionCoverProj x S  -- p ⟦ũ, s⟧ = q ũ
```

the balanced product `TauCeti.BalancedProduct (FundamentalGroup X x) Ũ S`, in which
`⟦γ • ũ, s⟧ = ⟦ũ, γ⁻¹ • s⟧` (`TauCeti.BalancedProduct.mk_smul_left`). ⚠ The supplier puts `S` in
the universe of `X`.

The four statements this milestone consumes, each by name:

1. **The quotient is a covering of `Ũ × S`.** The class map `Ũ × S → assocCover S` is a
   quotient covering map for `⋆`: `TauCeti.BalancedProduct.isQuotientCoveringMap_mk`, applied to
   `TauCeti.UniversalCover.isQuotientCoveringMap` (UniversalCovers milestone 3). This is what
   gives `assocCover S` its topology and the universal property for maps out of it.
2. **`p` is a covering map**: `TauCeti.UniversalCover.isCoveringMap_actionCoverProj`. ⚠ This
   does **not** follow from statement 1 alone: that describes `Ũ × S → assocCover S`, not
   `assocCover S → X`, and the two maps have different groups in play. The supplier proves it
   by its own equivariant sheet computation, `TauCeti.BalancedProduct.isCoveringMap_proj`.
3. **The fiber equivalence.** The supplier's `TauCeti.UniversalCover.actionCoverFiberEquiv x S :
   S ≃ p ⁻¹' {x}` is `s ↦ ⟦ũ₀, s⟧`; this roadmap's numbering is its inverse,
   `ν_S := (actionCoverFiberEquiv x S).symm : p ⁻¹' {x} ≃ S`. ⚠ **This direction is forced**, and
   it is the same direction as the numbering `ν` in 6.1: `Equiv.permCongr` transports
   `Equiv.Perm` along an equivalence, so only `ν_S : p ⁻¹' {x} ≃ S` sends the monodromy
   permutation of the fiber to a permutation of `S`. Written the other way the next formula
   does not typecheck, and `ν_S.symm.permCongr` would be needed instead.
4. **The monodromy calculation.** `ν_S.permCongr (monodromyHom p x γ) = MulAction.toPerm γ` for
   every `γ`, **with no inverse and no `ᵐᵒᵖ`**. This is the supplier's
   `TauCeti.UniversalCover.monodromy_actionCoverFiberEquiv`, which states
   `monodromy γ (actionCoverFiberEquiv x S s) = actionCoverFiberEquiv x S (γ • s)`: the inverse
   in `monodromy_basepointLift` cancels against the one in `mk_smul_left`, with `monodromyHom`
   Mathlib's `IsCoveringMap.monodromyPerm`. Reversing the sign in
   the diagonal action would produce `γ⁻¹` here, which is why the formula above is displayed
   rather than described.

**The finite corollary, owned here.** For `S` finite of cardinality `n`, `assocCover S` has
finite fibers of cardinality `n`, and composing `ν_S` with a numbering `S ≃ Fin n` makes it a
numbered cover whose triple is the triple of the action. ⚠ It is a `ConnectedFiberNumberedCover b
n` exactly when the action is **transitive**: the connectedness field of that carrier is
discharged here, from transitivity, through Tau Ceti's `IsCoveringMap.pathConnectedSpace_iff`
(over a path-connected base, the total space is path-connected exactly when a fiber is nonempty
and monodromy is transitive on it), and for a non-transitive `S` the construction lands only in
a bare numbered cover, which this roadmap does not carry. This is the form Layer 6.3 consumes,
and it supplies the inverse of `ConnectedFiberNumberedCoverClass.triple`.

**API.** Supplied by Tau Ceti and consumed: the quotient topology, the covering map and the fiber
identification above; the bundled cover `TauCeti.UniversalCover.actionCoveringSpace x S`, an
object of `TauCeti.CoveringSpace (TopCat.of X)`, with its fiber identification
`actionCoveringSpaceFiberEquiv` in the direction of `ν_S` and its equivariance
`actionCoveringSpaceFiberEquiv_apply_monodromy`; and the equivalences of categories
`TauCeti.CoveringSpace.fiberActionEquivalence x : CoveringSpace (TopCat.of X) ≌ Action (Type u)
(FundamentalGroup X x)` and `TauCeti.ConnectedCoveringSpace.transitiveFiberActionEquivalence x`,
connected covers against transitive `π₁`-sets. The inverse of `fiberActionEquivalence` is a
chosen functor, not `actionCoveringSpace`, so the functoriality of this construction is not
supplied. Owned here, each a target of this milestone:

- *Instances.* Finiteness of the fiber for finite `S`, from `actionCoverFiberEquiv`.
- *Morphisms and functoriality.* `S ↦ actionCoveringSpace x S` as a functor from `π₁`-sets to
  `TauCeti.CoveringSpace (TopCat.of X)`, a map of `π₁`-sets inducing a map of covers over `X`; a
  natural isomorphism `actionCoveringSpace x S ≅ (fiberActionEquivalence x).inverse.obj S`; and,
  from it, preservation of coproducts.
- *Examples.* `S` a one-point set gives `X` itself; `S = π₁` with the left translation
  action gives the universal cover back — an instance of the **general** construction, since
  `π₁(U, b)` is free of rank `2` and hence infinite, so it is not an example of the finite
  corollary; `S = Fin n` with the action of a triple gives the cover Layer 6.3 pairs with
  that triple.
- *Edge cases.* `S` empty, where the cover is empty; `S` with a non-transitive action, where
  the cover is disconnected and decomposes as the coproduct over the orbits.
- *Downstream interfaces.* Layers 6.3, 6.5, 7.2.

*Prerequisites:* Layers 5.3, 5.6; Tau Ceti `TauCeti.UniversalCover.ActionCover`,
`TauCeti.UniversalCover.isCoveringMap_actionCoverProj`, `TauCeti.UniversalCover.actionCoverFiberEquiv`,
`TauCeti.UniversalCover.monodromy_actionCoverFiberEquiv`, `TauCeti.BalancedProduct.isQuotientCoveringMap_mk`,
`IsCoveringMap.pathConnectedSpace_iff` (UniversalCovers milestones 3, 5, 8); Mathlib
`IsQuotientCoveringMap`, `MulAction`, `LocallyPathConnectedSpace`.

*Tau Ceti:* the supplier API above, and the finite corollary as the existence statement
`TauCeti.ConnectedFiberNumberedCover.exists_permCongrHom_comp_monodromyPerm_eq`. The items owned
here, finiteness of the fiber, functoriality with the natural isomorphism and coproducts, the
examples and the edge cases, remain.

#### 6.3 The classification, at three levels of rigidification

**"Covers up to isomorphism" is a type, not a `Prop`.** Each of the three isomorphism
relations of 6.1 is proved to be an equivalence relation, packaged as a `Setoid`, and the
objects the three statements below are about are the **quotients**

```text
ConnectedFiberNumberedCoverClass b n := Quotient (setoid of ConnectedFiberNumberedCoverIso)
ConnectedPointedCoverClass       b n := Quotient (setoid of ConnectedPointedCoverIso)
ConnectedCoverClass              b n := Quotient (setoid of ConnectedCoverIso)
```

together with the three combinatorial carriers they are matched with: `ConnectedTriple n`,
`MarkedIsoClass n := (ConnectedTriple n × Fin n) ⧸ Equiv.Perm (Fin n)` under the **diagonal**
action `τ • (t, i) := (τ • t, τ i)`, and
`ConnectedIsoClass n := ConnectedTriple n ⧸ Equiv.Perm (Fin n)`. Each classification is stated
as a **named canonical map, its bijectivity, and the `Equiv.ofBijective` built from the two** —
never as a bare `Nonempty (… ≃ …)`, for the same reason as in 5.5.

**Three statements, not one.** Each is an equivalence between one quotient of 6.1 and its
combinatorial counterpart:

1. **Fiber-numbered covers ↔ literal triples.** `ConnectedFiberNumberedCoverClass b n`
   corresponds to `ConnectedTriple n` **on the nose**, by the canonical map
   `ConnectedFiberNumberedCoverClass.triple` descended from 6.1's `connectedTriple`, whose
   inverse is 6.2's finite corollary, with uniqueness of the comparison map from the pin's
   lifting criterion `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`. This is
   the only level at which a literal triple is the classifying datum.
2. **Unnumbered covers ↔ isomorphism classes of triples.** `ConnectedCoverClass b n`
   corresponds to `ConnectedIsoClass n` by `ConnectedCoverClass.isoClass`: choose any
   numbering and pass to the relabeling orbit. Forgetting the numbering on one side is
   exactly passing to the relabeling orbit on the other, which is the content of
   `isoClass_forgetNumbering`, and it is why the chosen numbering does not matter.
3. **Connected pointed covers ↔ triples with a marked label, equivalently subgroups.**
   ⚠ **Connected** throughout: the carrier is `ConnectedPointedCover`, carrying
   path-connectedness of the total space as a field. A disconnected pointed cover recovers
   only the subgroup of the component containing the chosen point, so adjoining an unrelated
   component would leave the subgroup fixed and the correspondence would not be injective.
   The milestone owned here is `ConnectedPointedCoverClass.markedClass_bijective`:
   `ConnectedPointedCoverClass b n ≃ MarkedIsoClass n`, the marked label moving with the
   relabeling.

   The further identification with **subgroups of `π₁(U, b)` of index `n`**, pointed
   connected covers against subgroups and unpointed ones against conjugacy classes of
   subgroups, is UniversalCovers milestone 8 and is **not reproved here**; this roadmap
   composes with Tau Ceti's theorems. The
   pointed half is `TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`: a
   pointed path-connected cover is isomorphic, over `X` and matching base points, to
   `TauCeti.UniversalCover.SubgroupQuotient x H` for exactly one `H`, and that `H` is its
   recovered subgroup `(FundamentalGroup.mapOfEq ⟨p, _⟩ hpe).range`
   (`TauCeti.UniversalCover.exists_homeomorph_subgroupQuotient_of_range_eq`). That subgroup is the stabilizer of the
   chosen point under monodromy (`IsCoveringMap.stabilizer_eq_range`), so under the composite
   the subgroup attached to `(t, i)` is the stabilizer of `i` under the monodromy action, and
   its index is the degree (`IsCoveringMap.card_fiber_eq_index`). The unpointed half is
   `TauCeti.UniversalCover.exists_homeomorph_subgroupQuotient_comp_eq_iff_exists_eq_map_conj`,
   and `IsCoveringMap.exists_homeomorph_comp_eq_iff_exists_range_eq_map_conj` for any two covers
   whose total spaces are path-connected and locally path-connected: forgetting the basepoint is passing to the conjugation **orbit** of the
   subgroup. The supplier states conjugacy as `∃ γ, K = H.map (MulAut.conj γ).toMonoidHom`;
   this roadmap names the orbit relation of the conjugation action `ConjAct G` on `Subgroup G`,
   `MulAction.orbitRel (ConjAct G) (Subgroup G)`, because `ConjClasses (Subgroup G)` is a
   different and wrong object, and proves that the orbit relation holds between `H` and `K`
   exactly when `∃ γ, K = H.map (MulAut.conj γ).toMonoidHom`.

   Equivalently, fix the marked label once and take

   ```text
   ConnectedTriple n ⧸ Stabilizer (Equiv.Perm (Fin n)) 0
   ```

   Prove the two agree; the second is the more convenient carrier and the first is the one
   whose functoriality is visible. ⚠ **The relabeling must act on the label too.** Quotienting
   pairs `(t, i)` by only the stabilizer of `i` is not this quotient and not any useful one:
   it never identifies pairs with different marked labels, so it is not even coarser than the
   set of triples — at `n = 3` it has `39` elements against `26` triples.

   ⚠ **Do not identify this quotient with literal triples either.** For `n ≥ 3` it is
   strictly coarser than the triples and strictly finer than `IsoClass n`. The three counts
   are a usable check on any implementation:

   ```text
   n                    2      3      4      5
   ConnectedTriple      3     26    426  11064
   pointed             (3)    13     71    461
   IsoClass             3      7     26     97
   ```

   The middle row is the number of index-`n` subgroups of a free group of rank `2` — Hall's
   numbers `1, 3, 13, 71, 461` — which is an independent confirmation of the identification
   with subgroups of `π₁(U, b)`.

All three are compatible with the free-group description of 5.6: transitive
`FreeGroup (Fin 2)`-sets of cardinality `n` correspond to connected triples by evaluating
the action homomorphism at the two generators, and the three levels above correspond to the
three standard levels there (numbered set, set up to isomorphism, pointed set).

**The forgetful maps descend, and the square commutes.** Forgetting the numbering, marking a
label, and forgetting the marked point are defined on the carriers and descend to the
quotients — `ConnectedFiberNumberedCoverClass.forgetNumbering`, `…​.markLabel i`,
`ConnectedPointedCoverClass.forgetPoint` — with `forgetPoint_markLabel` recording that the
triangle commutes. Prove that each commutes with the corresponding combinatorial forgetful
map: `isoClass_forgetNumbering` (numbered → unnumbered is triple → relabeling orbit) and
`isoClass_forgetPoint` (pointed → unnumbered is marked triple → its underlying class,
`MarkedIsoClass.forget`). Prove also that the correspondences match degree with fiber
cardinality and are natural in maps of covers.

**Automorphism groups.** The automorphism group of a cover is Mathlib's `deck p`, with its
UniversalCovers API in Tau Ceti, not a Belyi object; what descends through the quotients is that
isomorphic covers have isomorphic deck groups (`TauCeti.Deck.conjMulEquiv`), and the Belyi content
is 6.4's identification of `deck p` with Layer 0.4's
`automorphismGroup` of the triple. On the combinatorial side the corresponding descent is
`automorphismGroup_smul`: relabeling conjugates `automorphismGroup`, so it is an invariant of
a `ConnectedIsoClass n` as a subgroup **up to conjugacy** and not on the nose.

**Compatibility with the branch-point action.** Pulling a cover back along an anharmonic
self-homeomorphism of 5.1 is the topological `S₃`-action, `ConnectedCoverClass.pullback`, and
the milestone is that it *is* Layer 2.6's combinatorial action:

```text
(c.pullback mob01).isoClass   = ⟦swap01   c.triple⟧
(c.pullback mob1Inf).isoClass = ⟦swap1Inf c.triple⟧
```

and hence the same for the four composites. For `mob01` the computation is transport-free:
`mob01` fixes `b` (5.1) and 5.2's pointwise identities `mob01 ∘ γ0 = γ1`, `mob01 ∘ γ1 = γ0`
give `h_*(periph0) = periph1`, `h_*(periph1) = periph0` and hence
`h_*(periphInf) = periph1⁻¹ · periphInf · periph1`, which is exactly `swap01`'s third
component. ⚠ The other four basepoint-moving operations of 2.6 are **not** induced on the nose: their Möbius
transformations move `b` (5.1), so they act only after a choice of connecting path, the two
choices differ by an inner automorphism, and the statement survives only on the level-2
quotient. That is the geometric reason Layer 2.6's `S₃`-action is stated on isomorphism
classes, and it is the same phenomenon as `swap1Inf_swap1Inf` and `rotInv_rot` on the combinatorial
side.

*Source:* Girondo–González-Diez **Theorem 2.61**: two morphisms of the same degree with the
same branch-value set are isomorphic coverings if and only if their monodromies are
conjugate. ⚠ Its hypotheses include *equal branch-value sets*, not merely equal degree; the
statement is false without that, and the analogue here is that the three marked points are
fixed once and for all. ⚠ That statement is this milestone's level 2, phrased with
conjugacy on the combinatorial side; it is not level 1 and not level 3.

*Prerequisites:* Layers 0.2, 2.6, 5.1, 5.2, 5.6, 6.1, 6.2; for the subgroup identification only,
Tau Ceti `TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`,
`TauCeti.UniversalCover.exists_homeomorph_subgroupQuotient_comp_eq_iff_exists_eq_map_conj`,
`IsCoveringMap.stabilizer_eq_range` and `IsCoveringMap.card_fiber_eq_index` (UniversalCovers
milestone 8); Mathlib `existsUnique_continuousMap_lifts_of_range_le`,
`Setoid`, `Quotient.lift`, `Equiv.ofBijective`.

*Tau Ceti:* the quotients `TauCeti.ConnectedFiberNumberedCoverClass`,
`ConnectedPointedCoverClass`, `ConnectedCoverClass` with the forgetful maps;
`ConnectedFiberNumberedCoverClass.tripleEquiv`, `ConnectedCoverClass.isoClassEquiv`,
`ConnectedPointedCoverClass.markedClassEquiv`, `isoClass_forgetNumbering`,
`isoClass_forgetPoint`; `TauCeti.MarkedIsoClass.stabilizerEquiv` for the stabilizer carrier; and
`ConnectedCoverClass.isoClass_pullback_mob01` and `isoClass_basepointChange_pullback_mob1Inf`,
where pulling back along `z ↦ z/(z − 1)` moves the basepoint to `−1` and
`ConnectedCoverClass.basepointChange` moves it back. Naturality in maps of covers, the four
composite pullbacks, the counts `13, 71, 461`, and `subgroupConjSetoid` remain.

#### 6.4 Deck transformations

For a `ConnectedFiberNumberedCover b n` with triple `t`, the deck group is isomorphic to
`automorphismGroup t` of Layer 0.4, **as a subgroup of `Equiv.Perm (Fin n)`**: a deck
transformation is sent to the permutation it induces on the numbered fiber. The numbering is
what makes the target a concrete subgroup rather than an abstract group; changing `ν` by `τ`
conjugates both sides by `τ` compatibly, so the abstract isomorphism descends to the
unnumbered cover while the embedding does not.

⚠ **This is where the `ᵐᵒᵖ` of UniversalCovers milestone 5 is absorbed, once, explicitly.**
That milestone identifies the deck group of the universal cover with `(π₁)ᵐᵒᵖ`
(`TauCeti.UniversalCover.deckFundamentalGroupEquiv`); composing
with the monodromy description turns deck transformations into permutations of the fiber
commuting with the monodromy action, which is the simultaneous centralizer, which is
Layer 0.4's automorphism group. The milestone states the composite with its direction
fixed, and the acceptance test is `torusTriple`: its automorphism group is cyclic of order
`4` (Layer 0.8), so the deck group of the corresponding degree-`4` cover must be cyclic of
order `4` and act freely and transitively on the fiber. A milestone that got the direction
wrong would still produce a group of order `4` here, so the test is stated on the **action**
— which element of the deck group corresponds to which permutation — not on the abstract
isomorphism type.

*Prerequisites:* Layers 0.4, 6.1, 6.3; Mathlib `deck`; Tau Ceti
`TauCeti.UniversalCover.deckFundamentalGroupEquiv`, `TauCeti.Deck.fiberHomeomorphHom` with
`TauCeti.Deck.fiberHomeomorphHom_injective` (a deck transformation is determined by its action on
the fiber), `TauCeti.Deck.monodromy_smul` (that action commutes with monodromy), and
`TauCeti.CoveringSpace.fiberActionFunctor_full` (every monodromy-equivariant permutation of the
fiber is induced by a map of covers over `X`, which gives surjectivity onto the centralizer)
(UniversalCovers milestones 4, 5, 8).

*Tau Ceti:* `TauCeti.ConnectedFiberNumberedCover.range_deckPerm_eq_automorphismGroup`,
`deckMulEquiv` and `deckPerm_smul`, with the `torusTriple` acceptance test
`range_deckPerm_of_connectedTriple_eq_torusTriple` and
`card_deck_of_connectedTriple_eq_torusTriple`.

#### 6.5 Regular covers

For a connected finite cover the following are equivalent: the deck group acts transitively
on one (equivalently every) fiber; the triple is regular in the sense of Layer 4.6; the
corresponding subgroup of `FreeGroup (Fin 2)` is normal; the monodromy action is free. In
that case the deck group is isomorphic to the monodromy group, and the correspondence
matches Layer 4.6's bijection between regular triples and finite-index normal subgroups of
a triangle group.

*Source:* Girondo–González-Diez **Definition 2.64** (Galois, equivalently normal or regular,
covering), **Proposition 2.65** (`f` is Galois iff `f* : M(S₂) → M(S₁)` is a Galois field
extension, and then the covering group is `Gal(M(S₁)/M(S₂))`), and **Proposition 2.66**
(`f` is normal iff `deg f = |Mon(f)|`) — the last being the cleanest criterion to formalize,
since both sides are already Layer 0 data.

*Prerequisites:* Layers 4.6, 6.3, 6.4; Tau Ceti `TauCeti.Deck.isRegular_iff_fiber_isPretransitive`,
`TauCeti.UniversalCover.isRegular_subgroupQuotientProj_iff_normal`,
`TauCeti.UniversalCover.deckSubgroupQuotientProjEquiv` and
`TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal` (UniversalCovers milestone 8).

*Tau Ceti:* `TauCeti.ConnectedFiberNumberedCover.isPretransitive_deck_iff_isRegular`,
`isRegular_proj_iff`, `isRegular_iff_card_deck`, `normal_range_mapOfEq_iff`,
`deckMulEquivMonodromyGroupMulOpposite` and `range_mapOfEq_eq_comap_regularIsoClassEquiv`.

### Layer 7: compactification and topological branched covers

Layer 7 is purely topological: it needs no Riemann-surface carrier, and it belongs to this
roadmap. Layer 8 builds the complex structure on its output.

#### 7.1 Covers of the punctured disc

Every connected covering map onto the punctured disc `𝔻* = {z | 0 < |z| < 1}` with finite
fiber of cardinality `e ≥ 1` is isomorphic over `𝔻*` to the restriction of `z ↦ z^e`.
Route: 5.4 gives `π₁(𝔻*) ≅ ℤ` generated by the circle loop; 6.3's **level 2** — unnumbered
covers up to isomorphism over the base — transported to `𝔻*`, classifies connected finite
covers by transitive finite `ℤ`-sets up to isomorphism, i.e. by one cyclic `ℤ`-set per
degree `e`; and the pin's `isCoveringMap_zpow` (restricted to the disc) realizes the
degree-`e` one as `z ↦ z^e`, whose monodromy is a single `e`-cycle. ⚠ Level 2 is the right
level here and level 1 would be wrong: no numbering of the fiber is given or wanted, and
the conclusion is an isomorphism of covers, not an equality of triples.

**New object: the local model.** Basic API: the map, its covering property, its degree, its
monodromy (an `e`-cycle), its deck group (`ℤ/e`, generated by multiplication by a primitive
`e`-th root of unity), the uniqueness of the isomorphism up to that deck group, and the
behaviour under composition (`z ↦ z^{ef}` factors as `z^e` after `z^f`).

⚠ *Nearby false statement:* the classification is up to isomorphism **over** `𝔻*`, and the
isomorphism is not unique — it is unique only up to the deck group, i.e. up to a rotation by
an `e`-th root of unity. Layer 7.4's uniqueness statement is about the compactified branched
cover, where the extra point rigidifies nothing either; the uniqueness there comes from
properness, not from this milestone.

*Prerequisites:* Layers 5.4, 6.2, 6.3 (transported to `𝔻*`); Mathlib `isCoveringMap_zpow`,
`isCoveringMapOn_zpow`.

*Tau Ceti:* `TauCeti.puncturedDiscPow`, `isCoveringMap_puncturedDiscPow`,
`puncturedDiscPowDeckMulEquiv`, the composition law `TauCeti.puncturedDiscPow_mul`, the monodromy
`TauCeti.isCycleOn_monodromyPerm_puncturedDiscCircle`, the classification
`IsCoveringMap.exists_homeomorph_puncturedDiscPow_comp_eq_iff`, and the uniqueness up to the deck
group `TauCeti.existsUnique_rootsOfUnity_smul_homeomorph` with
`IsCoveringMap.existsUnique_homeomorph_puncturedDiscPow_comp_eq`.

#### 7.2 Filling the punctures

**The carrier is attached to a cover, not to a triple.** Define `FilledCover p` for a
connected covering map `p : E → U` with finite fibers; the filled object of a triple `t` is
then `FilledCover` applied to the cover 6.2 associates to `t`, and the notation `fill t`
is that composite and nothing else. ⚠ A notation that names only `t` hides which cover the
topology was built from, and 7.4's uniqueness statement is precisely about that cover.

Fix for each puncture `q ∈ {0, 1, ∞}` the standard punctured-disc neighbourhood `D_q^*` of
5.1. The construction, with every piece of data pinned:

- **The added points.** The connected components of `p ⁻¹' D_q^*` are in bijection with the
  cycles of `σ_q`, the component of a cycle having degree its length — 7.1 applied
  componentwise, with the bijection coming from the monodromy orbit computation of 6.1.
  ⚠ Every local degree `e` is `≥ 1`: cycles of a permutation are nonempty, and the
  `e = 0` case that would break every chart below cannot arise.
- **The underlying type.** `FilledCover p := E ⊕ Σ_q (components of p ⁻¹' D_q^*)`, a sum,
  with the second summand finite.
- **The gluing maps.** For a component `C` over `q` of degree `e`, 7.1 gives an isomorphism
  `C ≃ 𝔻*` over `D_q^*` under which `p` is `z ↦ z^e`; pinning one such isomorphism gives the
  chart `φ_C : C ∪ {*_C} ≃ 𝔻`, sending `*_C` to `0`. Different choices differ by a rotation
  by an `e`-th root of unity (7.1), which is a homeomorphism of `𝔻`, so the *topology* below
  does not depend on the choice even though the chart does.
- **The topology.** The neighbourhood basis at `*_C` is `{φ_C ⁻¹' (disc of radius r)}` for
  `0 < r < 1`; on `E` it is the topology of `E`. Prove this is a topology, that `E` is open
  and dense in it, and that the added points are isolated from one another.
- **The properties.** `FilledCover p` is Hausdorff (two added points lie over different
  components or different punctures, which the pairwise disjointness of the `D_q^*` in 5.1
  separates); second countable (a countable base on `E` plus countably many basic
  neighbourhoods per added point, of which there are finitely many); locally homeomorphic
  to `ℂ` (the charts `φ_C`, and the charts of `E` elsewhere); connected when `E` is; and
  **compact**, by the compact-core argument with **smaller** discs. Fix `0 < r < 1` and let
  `D_q^*(r) ⊂ D_q^*` be the punctured disc of radius `r` in the standard coordinate at `q`
  (`2z`, `2(1 − z)`, `2/z`). The core `E ∖ ⋃_q p ⁻¹' D_q^*(r)` is closed in `E` and lies over
  `U ∖ ⋃_q D_q^*(r)`, which is closed and bounded in `ℂ` and avoids `0` and `1`, hence compact;
  a finite-degree covering map is proper, so the core is compact. Over each component `C` of
  `p ⁻¹' D_q^*` of degree `e`, the rest of `C` and its added point lie in
  `φ_C⁻¹(closed disc of radius r^{1/e})`, the image of a compact disc **inside** the chart
  domain `𝔻`, hence compact. ⚠ The closures of the full filled discs are not known to be
  compact at this stage — their boundaries lie in `E`, over the circles `|w| = 1` that bound the
  chart domains — so the covering by those closures proves nothing.

**New object: `FilledCover`.** Basic API: the topology and its universal property (a map out
of `FilledCover p` is continuous iff its restrictions to `E` and to each filled disc are);
the open embedding `E ↪ FilledCover p` with finite complement; the finite set of filled
points with its labelling by the cycles of the three peripheral permutations;
functoriality in isomorphisms of covers over `U`; the count
`#(filled points) = c(σ0) + c(σ1) + c(σinf)`.

⚠ *Nearby false statement:* the components of `p ⁻¹' D_q^*` are not in bijection with the
points of the fiber, nor with the orbits of the whole monodromy group — they are the orbits
of the single element `σ_q`. Compactness needs the cover to have **finite** degree; an
infinite-degree cover of `U` fills to a non-compact surface.

*Prerequisites:* Layers 0.5, 5.1, 6.1, 6.2, 7.1; Mathlib sum/quotient topology,
`TopologicalSpace.IsTopologicalBasis`.

*Tau Ceti:* `TauCeti.FilledCover` with its local degrees `TauCeti.FilledCover.degree` and
charts `TauCeti.FilledCover.chart`; the components over the three neighbourhoods as cycles,
`IsCoveringMap.sameCycleQuotientσ0EquivConnectedComponents`, its `σ1` and `σinf` companions and
`TauCeti.FilledCover.indexEquiv`; the topology through `TauCeti.PunctureFilling.continuous_iff`,
`isOpenEmbedding_incl` and `denseRange_incl`; `TauCeti.FilledCover.t2Space`,
`TauCeti.FilledCover.compactSpace` (through the compact core
`IsCoveringMap.isCompact_preimage_compactCore`), `TauCeti.FilledCover.secondCountableTopology`
and `TauCeti.PunctureFilling.connectedSpace`; functoriality `TauCeti.FilledCover.congr`; and the
count `TauCeti.FilledCover.natCard_range_center`.

#### 7.3 The branched covering map

Extend `p` to `fillMap : fill t → OnePoint ℂ`, sending each filled point to its puncture
and using 5.1's open embedding `U ↪ OnePoint ℂ` on `E`. Prove: continuity (by 7.2's
universal property); properness and surjectivity; that the restriction over
`OnePoint ℂ ∖ {0,1,∞}` is the original covering map; and the **local model**, that at a
filled point coming from a cycle of length `e` the map is `w ↦ w^e` in the pinned charts.

*Prerequisites:* Layers 7.1, 7.2; Mathlib `OnePoint`, properness API.

*Tau Ceti:* `TauCeti.FilledCover.fillMap` with `continuous_fillMap`, `isProperMap_fillMap`,
`surjective_fillMap`, `isCoveringMap_restrictPreimage_fillMap` and `fillMap_preimage_toOnePoint`,
and the local model `TauCeti.FilledCover.isLocalPowerAt_fillMap_center`.

#### 7.4 Uniqueness of the compactification

Let `(Z, π)` be **any** competitor: a compact Hausdorff `Z` with a proper continuous
`π : Z → OnePoint ℂ`, together with an open embedding `j : E ↪ Z` satisfying

- `π ∘ j` is `p` followed by 5.1's embedding `U ↪ OnePoint ℂ`;
- `j '' E` is **dense** in `Z` and its complement is exactly `π ⁻¹' {0, 1, ∞}`, which is
  finite;
- at each point of that complement `π` is `w ↦ w^e` in some charts, with `e ≥ 1`.

Then there is a **unique** homeomorphism `FilledCover p ≃ₜ Z` over `OnePoint ℂ` commuting
with the two embeddings of `E`. ⚠ All three clauses are needed. Without density and the
exact description of the complement a competitor may carry extra components or extra points
over an unbranched value, and the theorem is false; "finite fibers over the punctures"
alone does not exclude them.

Route: uniqueness of the map is density of `E` plus Hausdorffness of the target; existence
is that the added points of either extension are recovered from `E` alone, as the ends of
the components of `p ⁻¹' D_q^*` — the milestone states the ends description as its own
lemma, since it is what makes the compactification canonical rather than merely
constructed.

*Source:* Girondo–González-Diez **Lemma 1.80**: for `Y` compact, `Σ ⊂ Y` finite and
`f* : X* → Y ∖ Σ` an unramified holomorphic covering of finite degree, there is a **unique**
compact Riemann surface `X ⊇ X*` to which `f*` extends as a **unique** morphism `X → Y`, with
`X ∖ X*` finite. The uniqueness of `X` is **Proposition 1.81**, and it is stronger than the
statement needs: the compactification of `X*` is independent of `f` altogether. The
construction — decompose `f⁻¹(V_y*)` into components, add one centre per component, declare
the `z ↦ z^{mᵢ}` chart holomorphic — is given there as unnumbered prose in §1.2.7 and is what
Layers 7.2 and 8.5 spell out.

*Prerequisites:* Layers 7.2, 7.3.

*Tau Ceti:* among topological branched covers (7.7), `TauCeti.TopBranchedCover.Iso.ofRestrict`,
`TauCeti.TopBranchedCover.Iso.restrict_injective`, `TauCeti.TopBranchedCover.IsoClass.restrict_injective`
and `TauCeti.TopBranchedCover.isoFilledCover`, with the ends description
`TauCeti.FilledCover.map_chart_comap_nhds_zero`. The statement for a competitor that is not
already a topological branched cover remains.

#### 7.5 The ramification dictionary

Over each `q ∈ {0, 1, ∞}` prove: the fiber of `fillMap` bijects with the cycles of `σ_q`;
the local degree at a filled point is its cycle length; the multiset of local degrees over
`q` is `fullCycleType σ_q` (Layer 0.5), a partition of the degree `n`; the branch locus is
contained in the three fibers and consists exactly of the points whose cycle has length
`> 1`; and `Σ e = n` over each of the three fibers. Every LMFDB `lambdas` assertion of
Layer 14 flows through this dictionary.

⚠ *Nearby false statement:* the branch locus can be empty over one or two of the three
punctures — a Belyi map is only required to be unramified **outside** `{0,1,∞}`, not
ramified over all of them. Layer 0.8's degree-`2` example `4z(1−z)` is unramified over `0`.

*Prerequisites:* Layers 0.5, 7.2, 7.3.

*Tau Ceti:* `TauCeti.TopBranchedCover.parts_ramificationPartition_zero`, its `one` and `inf`
companions, `TauCeti.FilledCover.map_degree_overZero` with its companions, and
`TauCeti.TopBranchedCover.localDegree_eq_one` off the marked fibres. The pointwise statement that
the branch points are exactly the added points of cycles of length `> 1` remains.

#### 7.6 The embedded graph

The preimage `fillMap ⁻¹' [0, 1]` of the closed real segment, with black points over `0`,
white points over `1`, and edges the components of the preimage of the open segment,
realizes the **underlying bipartite graph** of the Layer 2.2 dessin of `t`. State it as a
bijection of combinatorial data: edges to `Fin n`, black vertices to the cycles of `σ0`,
white vertices to the cycles of `σ1`, with the two incidence maps matching. No general
theory of embedded graphs is developed — only these bijections.

⚠ **The rotations are not part of this milestone.** A cyclic order on the edges at a vertex
is orientation data, and `FilledCover p` is at this stage only a charted topological
surface: the charts of 7.2 are pinned only up to a rotation by a root of unity, and nothing in
Layer 7 chooses a coherent orientation across them. The statement that the counterclockwise
cyclic order at a black vertex is the cycle of `σ0` is Layer 8.7, after the complex
structure of 8.5 supplies the orientation.

*Prerequisites:* Layers 2.2, 7.2, 7.3, 7.5.

*Tau Ceti:* the edges `IsCoveringMap.finEquivConnectedComponentsUnitSegment` and
`TauCeti.FilledCover.edge`, with the incidences
`TauCeti.FilledCover.center_overZero_mem_closure_edge_iff` and
`center_overOne_mem_closure_edge_iff`. The assembled bijection with the graph of the Layer 2.2
dessin remains.

#### 7.7 Topological branched covers as a carrier

The object Layer 8.6 classifies, defined here so that "isomorphism classes of connected
topological branched covers of the sphere with branch values in `{0,1,∞}`" names something.
With `marked := {0, 1, ∞} ⊆ OnePoint ℂ`, so that `U` is its complement through 5.1's open
embedding, a **topological branched cover of degree `n`** is

```text
TopBranchedCover n :
  Z                    a compact, connected, Hausdorff, second countable space
  π : C(Z, OnePoint ℂ) surjective
  over markedᶜ         π is a covering map:  IsCoveringMap (markedᶜ.restrictPreimage π)
  degree               Nat.card (π ⁻¹' {y}) = n  for every y ∉ marked
  local power          at every z with π z ∈ marked there are e, an open partial
                       homeomorphism φ : Z → ℂ with z ∈ φ.source and φ z = 0, and one
                       ψ : OnePoint ℂ → ℂ with ψ (π z) = 0, such that π maps φ.source into
                       ψ.source and ψ (π (φ.symm w)) = w ^ e on φ.target
```

⚠ **The covering condition is over the complement of the marked points.**
`Set.restrictPreimage marked π` has type `π ⁻¹' marked → marked`, a map between finite discrete
sets, which is always a covering map; a carrier stating that condition admits folds over
unmarked values. Witness: let `β : T → OnePoint ℂ` be a degree-`4` Belyi map on a torus (`x²` on
`y² = x³ − x`, branched over `0, 1, ∞`), let `h : ℝ/ℤ → ℝ/ℤ` be `[t] ↦ [a + 2t]` on `[0, 1/2]`
and `[a + 2 − 2t]` on `[1/2, 1]`, continuous and exactly two-to-one with folds at `0` and `1/2`,
and choose `a` so that the circle `{[a]} × ℝ/ℤ` misses the finite set `β ⁻¹' marked`. Then
`β ∘ (h × id)` has eight points over every unmarked value, is a local homeomorphism near every
point over a marked value (so the local power clause holds with the charts of `β`), and folds
over unmarked values, so it is not a covering map over `markedᶜ`. It is not a branched cover.

⚠ **The `MapsTo` clause is part of the local power condition.** An open partial homeomorphism
is a total function with junk values off its source; without the requirement that `π` maps
`φ.source` into `ψ.source`, the equation `ψ (π (φ.symm w)) = w ^ e` could be met by those junk
values.

No atlas is part of the data and none is needed: the local power models over the marked points
and the covering map elsewhere give an open partial homeomorphism to `ℂ` at every point, and the
local power condition quantifies over arbitrary open partial homeomorphisms, not over the charts
of a chosen atlas. Properness is not a field either — it follows from `CompactSpace Z` and
`T2Space (OnePoint ℂ)` — and is proved, not assumed.

An **isomorphism** is a homeomorphism `Z ≃ₜ Z'` commuting with `π` and `π'`. Prove: the local
degree `e` at a point is well defined, by a **topological** argument — in the model `w ↦ w ^ e`
every value close to `0` other than `0` has exactly `e` preimages close to `0`, so `e` is the
number of points near `z` over a point near `π z` other than `π z`, and two local power models at
`z` have the same exponent; the charts are only homeomorphisms at this stage, so no argument
through units or orders of vanishing is available; the fibers over the three marked points are
finite; `Σ e = n` over each of them; and the restriction of an isomorphism to the unbranched part
is an isomorphism of covers in the sense of 6.1.

⚠ *Nearby false statement:* `degree` cannot be stated as a single `Nat.card (π ⁻¹' {y}) = n`
for **all** `y`. It fails at exactly the branch points, which is the entire content of the
object; the hypothesis is restricted to the complement of `marked` above, and the marked
fibers are governed by the local power condition and `Σ e = n` instead.

7.2 and 7.3 construct a `TopBranchedCover n` from a connected finite cover of `U`, and 7.4
says that construction is unique up to a unique isomorphism. Conversely, restricting `π`
over `markedᶜ`, identified with `U` by 5.1's open embedding, sends a `TopBranchedCover n` to a
connected degree-`n` cover of `U` — connected because a connected surface stays connected when
finitely many points are removed. The two constructions are mutually inverse on isomorphism
classes. That equivalence is what Layer 8.6 consumes; it is stated here rather than there
because it is purely topological.

**Checks.**
- The fold `β ∘ (h × id)` above satisfies every clause except the covering condition over
  `markedᶜ`, and fails that one.
- The sphere over itself, `π = id`, is a branched cover of degree `1` with `e = 1` everywhere; the
  power map `z ↦ z^n` of the sphere is one of degree `n` with `e = n` at `0` and `∞` and `e = 1`
  at the `n` points over `1`, so the local degrees over each marked point sum to `n`.
- A constant map is excluded by surjectivity, and a degree-`0` cover cannot exist: the fibers
  over unmarked points are nonempty, closed and discrete in a compact space, hence finite and of
  positive cardinality.

*Prerequisites:* Layers 6.1, 7.2–7.5.

*Tau Ceti:* `TauCeti.TopBranchedCover`, whose covering field is
`IsCoveringMapOn π markedᶜ` (with `TauCeti.TopBranchedCover.isCoveringMap_restrictPreimage`) and
whose local power condition is `TauCeti.IsLocalPowerAt`; the topological uniqueness of the
exponent `TauCeti.IsLocalPowerAt.unique` and the local degree
`TauCeti.TopBranchedCover.localDegree`; `TauCeti.TopBranchedCover.exists_mem_source`,
`isProperMap`, `finsum_mem_preimage_singleton_localDegree`; the isomorphism classes
`TauCeti.TopBranchedCover.IsoClass` with restriction `TauCeti.TopBranchedCover.IsoClass.restrict`;
and the equivalence `TauCeti.TopBranchedCover.IsoClass.restrict_bijective`, from isomorphism
classes of degree-`n` branched covers to `TauCeti.ConnectedCoverClass` of degree `n`.

### Layer 8: Riemann surfaces and analytic Riemann existence

#### 8.1 The carriers

The Riemann-surface hypothesis stack, pinned once for the repository's use: a type `X`
with

```text
[TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X] [T2Space X]
```

together with `[CompactSpace X]` and `[ConnectedSpace X]` where a milestone needs them,
and second countability where it needs that. **No bundled `RiemannSurface` structure is
introduced**; the hypotheses travel unbundled, as they do in the pin's own manifold
statements. **Holomorphy is `MDifferentiable 𝓘(ℂ) 𝓘(ℂ)`**, and every comparison with
another spelling is a named target of this milestone, not an assumption. Build:

- **the Riemann sphere.** The `ChartedSpace ℂ (OnePoint ℂ)` instance with the two charts
  `z` and `1/z`, and the `IsManifold 𝓘(ℂ) ω` instance, whose content is that the transition
  `z ↦ 1/z` on `ℂ ∖ {0}` is analytic. With compactness and connectedness of `OnePoint ℂ`
  this is the roadmap's one indispensable example, and everything in Layers 8–10 is stated
  against it.
- **open submanifolds.** The instances for an open subset of a Riemann surface, applied to
  `ℂ`, to `U` (5.1), and to `𝔻*`.
- **the three comparisons of holomorphy**, each a named theorem, so that no later milestone
  silently switches spelling:
  1. chart form — `f : X → Y` is `MDifferentiable 𝓘(ℂ) 𝓘(ℂ)` iff
     its chart representatives are `AnalyticAt ℂ` at every point;
  2. smooth form, `TauCeti.contMDiff_iff_mdifferentiable` — for maps between complex manifolds at
     analyticity exponent `ω`, `MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ↔ ContMDiff 𝓘(ℂ) 𝓘(ℂ) ω f`;
  3. sphere form — on a connected Riemann surface, a map
     `f : X → OnePoint ℂ` other than the constant `∞` is holomorphic iff its affine part
     `g : X → ℂ` (the affine chart of the sphere after `f`, with any value where `f = ∞`) is
     meromorphic at every point in the charts **and** `f` is the canonical sphere extension of
     `g`: `f x` is the limit in `OnePoint ℂ` of `g y` as `y → x` with `y ≠ x`. Equivalently, the
     chart representatives of `g`, given the value `0` where `f = ∞`, are `MeromorphicNFOn` on
     the chart targets, and `f ⁻¹' {∞}` is exactly the set where their `meromorphicOrderAt` is
     negative.

  ⚠ Meromorphy of `g` alone does **not** characterize holomorphy of `f`: it ignores the value
  at a point (Mathlib's `MeromorphicAt.update_iff`). The map equal to `2` at `0` and to `1`
  elsewhere has a meromorphic affine part with no poles and an empty preimage of `∞`, and is
  not continuous at `0`; it fails the clause on the sphere extension (the limit at `0` is `1`)
  and the normal-form clause. (3) is the bridge Layer 9.2 turns into a field, and it is a
  **theorem about charts**, not a definition: "meromorphic function" is not introduced as a
  primitive anywhere in this roadmap.
- **the maximum principle.** From the pin's `MDifferentiable.isLocallyConstant` and
  `exists_eq_const_of_compactSpace`: a holomorphic function on a compact connected Riemann
  surface is constant.

*Source:* Forster, *Lectures on Riemann Surfaces*, **1.1**–**1.4** for chart, atlas, complex
structure and Riemann surface, **1.5(c)** for `ℙ¹` with its two charts `z` and `1/z`, **1.9**
for holomorphic maps, **2.8** for constancy on a compact surface and **2.9** for
`ℳ(ℙ¹) = ℂ(z)`; the roadmap's carrier differs from Forster's only in being unbundled.
Girondo–González-Diez **Proposition 1.23** is the identification this layer's third bullet
uses — meromorphic functions on `S` *are* the morphisms `S → Ĉ` other than the constant `∞` —
and **Remark 1.25** is the maximum-principle corollary that a compact connected surface
carries no nonconstant holomorphic function.

⚠ *Nearby false statement:* Hausdorffness is not automatic from the charted-space
structure and must be carried — the line with two origins is charted over `ℂ` and is not a
Riemann surface. Second countability is likewise carried where used, and is not deduced
from compactness plus charts without an argument.

*Prerequisites:* Mathlib `IsManifold`, `ChartedSpace`, `OnePoint`,
`Mathlib/Geometry/Manifold/Complex.lean`, `MeromorphicNFOn`, `meromorphicOrderAt`; ComplexManifolds
for the sphere.

*Tau Ceti:* the sphere `OnePoint.instChartedSpace` with its `IsManifold 𝓘(ℂ) ω` instance;
comparison (2) as `TauCeti.contMDiff_iff_mdifferentiable`; for (3), the canonical sphere
extension `TauCeti.RiemannSurface.sphereMap` with `TauCeti.RiemannSurface.mdifferentiable_sphereMap`
and `TauCeti.RiemannSurface.MeromorphicFunction.sphereMap_finitePart`. The open-submanifold
instances for `U` and `𝔻*`, comparison (1) as one equivalence, and (3) assembled as the stated
equivalence remain.

#### 8.2 The local normal form

For a nonconstant holomorphic `f` between connected Riemann surfaces and `x` in the source,
there are charts at `x` and at `f x` in which `f` is `w ↦ w^e`, with `e ≥ 1` unique; define
`ramificationIndex f x := e`.

Route, in proof order: in charts, the pin's `analyticOrderAt` gives the order of vanishing
of `f(·) − f(x)`, finite because `f` is nonconstant and the surface is connected (the
identity theorem); ConformalMapping L0's local-degree statement `TauCeti.exists_localDegree`
and its holomorphic root extraction produce a chart in which the map is exactly `w^e`.

**New object: `ramificationIndex`.** Basic API: the definition and its
chart-independence; `e = 1` exactly at the points where `f` is a local biholomorphism;
the branch locus `{x | e > 1}` is closed and discrete, hence finite when the source is
compact; multiplicativity under composition; behaviour under pre- and post-composition
with biholomorphisms; the value on the model maps `z ↦ z^n` and on `cyclicTriple`'s Belyi
map; the identity theorem for maps of connected surfaces as a companion statement.

*Source:* Forster **2.1** — the local normal form, that a nonconstant holomorphic map is
`z ↦ z^k` in suitable charts — with **2.2** for the multiplicity, **1.11** (identity theorem),
**2.4** (open mapping), and **4.3** with **4.5(b)** for the branch points being exactly where
the multiplicity exceeds `1`.

⚠ *Nearby false statement:* `e` is not the cardinality of a nearby fiber of `f` — that
cardinality is the **sum** of the indices over the fiber, and equals `e` only locally, near
`x`. The distinction is exactly what makes 8.3's degree statement a theorem.

*Prerequisites:* Layer 8.1; ConformalMapping L0 (`TauCeti.exists_localDegree`, branch
roots); Mathlib `analyticOrderAt`, `MeromorphicNFAt`, the identity theorem.

*Tau Ceti:* `ramificationIndex` is FuchsianOrbifolds Layer 5's local multiplicity
`TauCeti.RiemannSurface.localMultiplicity`, with the normal form
`TauCeti.RiemannSurface.exists_chart_eq_pow_localMultiplicity`,
`TauCeti.RiemannSurface.localMultiplicity_eq_one_iff`, composition
`TauCeti.RiemannSurface.localMultiplicity_comp_of_eventually_mdifferentiableAt`, and finiteness
of the branch locus `TauCeti.RiemannSurface.FiniteHolomorphicMap.finite_setOf_one_lt_localMultiplicity`.
The value on `cyclicTriple`'s Belyi map remains.

#### 8.3 Finiteness and the degree

A nonconstant holomorphic map `f : X → Y` of compact connected Riemann surfaces is
surjective, open, closed, and finite-to-one; its branch locus and branch values are finite;
and

```text
y ↦ Σ_{x ∈ f ⁻¹' {y}} ramificationIndex f x
```

is constant, its value being the degree `d`. Off the branch values, `f` restricts to a
degree-`d` covering map in the pin's `IsCoveringMap` sense.

*Source:* Forster **4.24** is the degree theorem — for a proper nonconstant map, `Σ v(f,x)`
over a fibre is the same for every value — resting on **4.21(a)** (proper plus discrete gives
finite fibres), **4.22** (a proper local homeomorphism is a covering map) and **4.23** (the
branched-covering statement), with **2.7** for surjectivity from a compact source.
Girondo–González-Diez **Theorem 1.74** packages exactly the three statements
this milestone needs: (i) `f` restricts to a covering away from the branch values, (ii) over a
small disc the preimage is a disjoint union of discs on each of which `f` is `z ↦ z^{mᵢ}`, and
(iii) `Σ mₓ(f)` is independent of the point — with **Definition 1.75** taking that common
value as the degree. ⚠ That book warns that "covering" there means an arbitrary morphism of
compact surfaces, ramified or not; this roadmap reserves the word for the pin's
`IsCoveringMap` and says "branched cover" otherwise.

*Hypotheses:* compactness of the source is what makes the map proper and the branch locus
finite; connectedness of the source is what makes "nonconstant" a global condition.
Compactness of the target is not needed for finiteness of the fibers, but is used for the
constancy statement in the form given.

*Prerequisites:* Layers 8.1, 8.2; Mathlib properness API, `IsCoveringMap`.

*Tau Ceti:* `TauCeti.RiemannSurface.FiniteHolomorphicMap` with `TauCeti.RiemannSurface.degree`
and `TauCeti.RiemannSurface.degree_eq_fiber_sum`; its branch values
`TauCeti.RiemannSurface.FiniteHolomorphicMap.branchValues` with `finite_branchValues` and
`isCoveringMap_restrictPreimage_compl`.

#### 8.4 Analytic Belyi pairs

An **analytic Belyi pair** is a compact connected Riemann surface `X` (8.1's stack) with a
nonconstant holomorphic `β : X → OnePoint ℂ` whose branch values lie in `{0, 1, ∞}`.

**New object: `AnalyticBelyiPair`.** Basic API:

- *Constructors and instances.* The structure; the equivalent formulation "`β` restricted
  over `OnePoint ℂ ∖ {0,1,∞}` is a covering map" (equivalent by 8.3), which is the form Layer
  6 consumes directly.
- *Examples.* `(OnePoint ℂ, z ↦ z^n)`, of degree `n` with partitions `[n], [1ⁿ], [n]`; and
  `(OnePoint ℂ, z ↦ 4z(1−z))`, of degree `2` with partitions `[1,1], [2], [2]`. ⚠ Both live
  on the sphere, which is the only Riemann surface this milestone has in hand. The
  positive-genus example belongs to 8.5, which is where a surface other than the sphere is
  first constructed.
- *Morphisms and functoriality.* Morphisms are holomorphic maps over `OnePoint ℂ`;
  isomorphisms are biholomorphisms over it; the automorphism group is finite.
- *Comparison lemmas and naturality.* The attached triple, via 8.3 and Layer 6.1, with its
  isomorphism class an invariant of the pair; the ramification data computed by 7.5;
  degree, genus, and cycle data all invariant under isomorphism of pairs.
- *Edge cases.* `β` unramified over one or two of the three points; `β` of degree `1`,
  where `X` is the sphere and the pair is trivial.
- *Downstream interfaces.* Layers 8.5, 8.6, 9.2–9.5, 10, 11.

*Prerequisites:* Layers 6.1, 7.5, 8.1–8.3.

*Tau Ceti:* `TauCeti.AnalyticBelyiPair` with `isCoveringMapOn` and `ofIsCoveringMapOn`, the
examples `TauCeti.AnalyticBelyiPair.chebyshev` and the power maps, isomorphisms
`TauCeti.AnalyticBelyiPair.Iso`, and the attached class `TauCeti.AnalyticBelyiPair.connectedIsoClass`.
Invariance of the genus remains.

#### 8.5 The complex structure on the filled cover

The filled space `fill t` of Layer 7.2 carries a unique complex structure making `fillMap`
holomorphic, and with it `(fill t, fillMap)` is an analytic Belyi pair. Route: on the
unramified part pull back the charts of the sphere along the covering map; at a filled point
coming from a cycle of length `e` take 7.2's chart `φ_C` as the holomorphic chart; the
transition functions are analytic by construction; `fillMap` is holomorphic away from
the filled points, and across them by the removable-singularity theorem in these charts.
Uniqueness: a homeomorphism of Riemann surfaces holomorphic off a finite set is
holomorphic, again by removability.

**The positive-genus worked example**, owned here because this is where a surface other than
the sphere first exists. `torusTriple` (Layer 0.8) has degree `4`, cycle data
`[4], [4], [2,2]`, and genus `1`; its analytic pair is the **superelliptic curve**

```text
y⁴ = t · (t − 1) ,        β = t ,
```

that is, the compact Riemann surface of the algebraic function `y = (t² − t)^{1/4}`. Verify
its invariants directly from the equation rather than by appeal to the classification:

- over `t = 0` and `t = 1` the exponent of the vanishing factor is `1`, coprime to `4`, so
  each has a single point with `e = 4`, giving partitions `[4]` and `[4]`;
- over `t = ∞` the total order is `−2`, and `gcd(4, 2) = 2`, so there are two points each
  with `e = 2`, giving `[2,2]`;
- Riemann–Hurwitz then reads `2g − 2 = 4·(−2) + (3 + 3 + 1 + 1) = 0`, so `g = 1`;
- `y ↦ i·y` generates a cyclic group of order `4` of automorphisms over `β`, acting
  transitively on a generic fiber, so the pair is regular with deck group `ℤ/4` — matching
  Layer 0.8's automorphism group of `torusTriple` and Layer 6.4's deck-group theorem.

The LMFDB record for this passport is `4T1-4_4_2.2-a`, whose curve friend is an elliptic curve
over `ℚ`, so the example is also Layer 10.8's genus-one acceptance instance.

*Source:* Forster **4.6** (the unique complex structure making a local homeomorphism
holomorphic), then **8.4** for the continuation of an unbranched proper covering of `X ∖ A`
across `A` and **8.5** for its uniqueness up to fibre-preserving biholomorphism, with **8.9**
packaging both as the Riemann surface of an algebraic function; Girondo–González-Diez §1.2.7 for the same construction, where the charts added at the filled
points are declared holomorphic and the transition functions are checked, giving
`m_{P}(f) = mᵢ` — with **Lemma 1.80** and **Proposition 1.81** supplying existence and
uniqueness (Layer 7.4).

⚠ *Nearby false statement:* the complex structure is unique **given** that `fillMap` is
holomorphic. A compact topological surface generally carries many inequivalent complex
structures; it is the map, not the surface, that rigidifies the choice.

*Prerequisites:* Layers 0.8, 6.4, 7.2, 7.3, 8.1, 8.2, 8.4; Mathlib removable singularities.

*Tau Ceti:* the charts `TauCeti.FilledCover.chartedSpace` with `TauCeti.FilledCover.isManifold`,
`TauCeti.FilledCover.mdifferentiable_fillMap`, the pair `TauCeti.ConnectedCover.toAnalyticBelyiPair`
and uniqueness through `TauCeti.AnalyticBelyiPair.Iso.ofHomeomorph`; the superelliptic example
`TauCeti.AnalyticBelyiPair.superelliptic` with `degree_β_superelliptic`,
`map_localMultiplicity_fiber_zero_superelliptic` and
`isRegular_monodromyTriple_superelliptic`. Its genus is read from the monodromy triple; the
analytic genus through Riemann–Hurwitz remains.

#### 8.6 Analytic Riemann existence for three-point covers

The summit of the analytic track: the following four classifications agree, by explicitly
named maps, and the maps are mutually inverse up to the relevant isomorphisms.

- isomorphism classes of analytic Belyi pairs of degree `n`;
- isomorphism classes of connected `TopBranchedCover n` (Layer 7.7's carrier, with its
  isomorphism notion);
- `IsoClass n` restricted to connected triples — Layer 6.3's **level 2**, not level 1;
- isomorphism classes of connected dessins with `n` edges (Layer 2.4).

⚠ Every one of the four is a set of **isomorphism classes**, so the classifying datum on
the combinatorial side is `IsoClass n` and never a literal triple. A statement at Layer
6.3's level 1 would need a fiber numbering, and an analytic Belyi pair carries none.

The two nontrivial directions are 8.4 (a pair gives a triple) and 8.5 (a triple gives a
pair); that they are inverse uses 7.4's uniqueness for one composite and 6.3's for the
other. Prove that degree, the three ramification partitions, automorphism groups, and deck
groups match through all four descriptions.

**Genus reconciliation.** Apply FuchsianOrbifolds Layer 5's Riemann–Hurwitz (its item 3) to
`β`, with the genus of `OnePoint ℂ` computed here as the worked instance on 8.1's sphere
(`g = 0`), to get the topological genus of `X`, which ModularForms §10B identifies with the
analytic genus; it equals the combinatorial genus of
Layer 0.6. Both sides are `Σ (e − 1)` over the three fibers, by 7.5 on the topological side
and by 8.3 on the analytic side, so the reconciliation is an equality of two computations
of the same sum — the milestone states it that way rather than as a coincidence of two
formulas.

⚠ *Nearby false statement:* Riemann existence in this form is a statement about covers
**with prescribed branch values**, not about arbitrary compact Riemann surfaces. It does not
say that every compact Riemann surface admits a Belyi map — that is Layer 10, and it is
false without the definability hypothesis over `ℚ̄`.

*Prerequisites:* Layers 0.6, 2.4, 6.3, 7.3–7.7, 8.4, 8.5; FuchsianOrbifolds Layer 5 (degree,
local multiplicity, Riemann–Hurwitz); ModularForms §10B (analytic genus) for the genus
reconciliation only.

*Tau Ceti:* `TauCeti.AnalyticBelyiPair.isoClassEquivConnectedIsoClass`, from isomorphism classes
of analytic Belyi pairs of degree `n` to `TauCeti.ConnectedIsoClass n`, sending a pair to the
class of its monodromy triple; `TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass`,
`TauCeti.AnalyticBelyiPair.toTopBranchedCoverIsoClass_bijective` and
`TauCeti.AnalyticBelyiPair.nonempty_iso_iff_isoClass_monodromyTriple_eq`; the partitions
`TauCeti.AnalyticBelyiPair.map_localMultiplicity_fiber_zero` with its companions; automorphisms
`TauCeti.AnalyticBelyiPair.isoMulEquivAutomorphismGroup`; and on the dessin side
`TauCeti.BipartiteRibbonGraph.connectedIsoClassEquiv`. The genus reconciliation remains, as does
the four-way composite including dessins.

#### 8.7 Orientation and the rotations of the embedded dessin

The orientation-sensitive half of 7.6, stated here because it needs the complex structure of
8.5 and is false without a chosen orientation.

A Riemann surface is canonically oriented: in a holomorphic chart, "counterclockwise" is the
positive direction of `arg`, and the transition functions being holomorphic with nonvanishing
derivative preserve it. Prove that first — the milestone owns the statement that the charts
of 8.5 induce a well-defined cyclic order on the germs of arcs leaving a point.

Then: for the analytic Belyi pair `(fill t, fillMap)` of 8.5 and a black point `P` over `0`
coming from a cycle of `σ0` of length `e`, the `e` edges of 7.6's embedded graph meeting `P`
leave it in the counterclockwise cyclic order given by that cycle of `σ0`; likewise for white
points and `σ1`. Together with 7.6 this identifies the embedded graph **with its rotations**,
that is the full Layer 2.1 ribbon graph, with the Layer 2.2 dessin of `t`.

Route: in the chart `φ_C` of 7.2 the map is `w ↦ w^e` and the preimage of the segment
`(0,1)` is `e` radial arcs at angles `2πk/e`; the monodromy of the counterclockwise
peripheral loop `γ0` advances a point of the fiber by one `σ0`-step (Layer 6.1), and the
same loop advances the radial arc index by one. So the two cyclic orders are the same cycle,
not merely cycles of the same length.

⚠ The corresponding statement at `∞` must be read in the chart `w = 1/z` (Layer 5.2's
warning): the face at `∞` is counterclockwise there and clockwise in `z`, and it is
`σinf`, not `σinf⁻¹`, exactly because Layer 5.8 identified `periphInf` with the *clockwise*
circle in the `z`-chart.

*Prerequisites:* Layers 2.1, 2.2, 5.8, 6.1, 7.2, 7.6, 8.5.

*Tau Ceti:* the radial edges in the filled charts, `TauCeti.FilledCover.incl_chart_overZero_mem_edge_iff`,
`incl_chart_overOne_mem_edge_iff` and `incl_chart_overInf_mem_upperTriangle_iff`. The
well-defined cyclic order of germs and the identification with the full ribbon graph remain.

### Layer 9: algebraic Belyi pairs and algebraization

This layer crosses from analysis to algebra. AlgebraicCurves supplies the algebraic side,
FuchsianOrbifolds Layer 5 the degree theory of finite holomorphic maps and ModularForms §10B the
analytic cohomology; this roadmap supplies the comparison, which no supplier owns and which
AlgebraicCurves excludes by name. The comparison is stated through typed steps —
compactification, passage to the meromorphic function field, the AlgebraicCurves
anti-equivalence, and ramification compatibility — each its own milestone below, before the
comparison endpoint of 9.8.

#### 9.1 The algebraic carrier

**The base field has characteristic zero, everywhere in this roadmap.** Over a field `k`
with `[CharZero k]`, an **algebraic Belyi pair** is a function field `F/k` in
AlgebraicCurves' sense — `IsFunctionField k F` with exact constants
`IsIntegrallyClosedIn k F` — together with a finite `k`-embedding `k(t) ↪ F` such that
every place of `F` over a place of `k(t)` other than the three marked places `t = 0`,
`t = 1`, `t = ∞` has ramification index `1`.

⚠ **Why the scope is pinned rather than left general.** Separability and tame ramification
are used from Layer 9.7 onwards and are not available in general; the standard examples
degenerate — `t ↦ t^n` is inseparable when `char k ∣ n`, and `4t(1−t)` is the constant map
`0` in characteristic `2`; and Belyi's theorem itself (Layer 10) and the whole of Layers
11–13 are characteristic-zero statements. Carrying a general `k` and re-imposing hypotheses
at each use would leave every consumer to rediscover them. In characteristic zero
separability is automatic, so the definition does **not** carry a separability hypothesis;
it carries `[CharZero k]` instead, and every milestone below inherits it.

The three marked places are AlgebraicCurves Layer 1's places of the rational function field:
the finite places of the monic irreducibles `t` and `t − 1`, and the infinite place, in that
order — the `0, 1, ∞` convention, algebraically.

**New object: `AlgebraicBelyiPair`.** Basic API:

- *Constructors and instances.* The structure; the degree `n := [F : k(t)]`; separability of
  `k(t) ↪ F`, derived from `CharZero`.
- *Local data at a marked place.* The primary invariant is the multiset of **pairs**

  ```text
  localData P := {(e(P′ | P), f(P′ | P)) | P′ above P}       for P ∈ {0, 1, ∞}
  ```

  (AlgebraicCurves Layer 6), subject to the fundamental identity `Σ e·f = n`. From it:
  - the **weighted ramification partition** `Σ_{P′} replicate (f P′) (e P′)`, a multiset of
    positive integers summing to `n` — a genuine partition of `n` over any `k`;
  - the **unweighted multiset** `{e(P′ | P)}`, which is a partition of `n` **only when every
    residue degree is `1`**.

  ⚠ *Nearby false statement:* over a base field that is not algebraically closed the
  unweighted multiset of ramification indices is **not** a partition of the degree, because
  residue degrees contribute through `Σ e·f = n`. State the unweighted partition theorem
  only under `[IsAlgClosed k]`, where every residue degree is `1`; and prove that the
  weighted partition is the base change of the unweighted one to `k̄`, which is the
  compatibility Layer 11 needs.
- *Examples,* each in characteristic zero. `(k(t), id)` of degree `1`; the degree-`2` pair of
  `4t(1 − t)`, unramified over `0`; and `(k(t), t ↦ t^n)` via `k(t) ↪ k(u)`, `t ↦ u^n`, whose
  local data is `{(n,1)}` at `0` and at `∞` — one place, `e = n`, residue field `k` — and at
  `1` is

  ```text
  { (1, deg q) : q monic irreducible over k, q ∣ uⁿ − 1 } ,
  ```

  one place per irreducible factor, all with `e = 1` because `uⁿ − 1` is separable in
  characteristic zero. ⚠ **This is `{(1,1)}^n` only when `uⁿ − 1` splits over `k`**, that is
  when `μ_n ⊂ k`; it is not a fact about arbitrary characteristic-zero `k`. Over `k = ℚ` with
  `n = 3`, `u³ − 1 = (u − 1)(u² + u + 1)` gives `{(1,1), (1,2)}` — two places, not three.

  That instance is also the **witness for the warning above**: its unweighted multiset
  `{1, 1}` is not a partition of `3`, while the weighted sum `1·1 + 1·2 = 3` is, so the
  worked example with a residue degree `> 1` is this one and needs no separate construction.
  Prove it in this form rather than assuming the split case.
- *Morphisms and functoriality.* Morphisms are `k(t)`-embeddings; isomorphisms are
  `k(t)`-isomorphisms. For any extension `k ↪ k′` of characteristic-zero fields, use
  `Frac(k′ ⊗_k F)`, equivalently `k′(t) ⊗_{k(t)} F`, after proving the latter is a field.
  The exact-constant hypothesis and finite separable generation make `F/k` regular;
  regularity, rather than genus, proves geometric integrality and that `k′` is the full
  constant field. AlgebraicCurves Layers 8/12 are the sole generic supplier of this
  corrected regular-extension/model cut. This object-level base change is not a claim of
  full faithfulness for arbitrary `k`.
- *Comparison lemmas.* The morphism-of-curves form — a finite separable morphism from the
  regular projective model of `F` to `ℙ¹_k` with branch locus inside the three rational
  points — is **equivalent**, through AlgebraicCurves Layer 12's anti-equivalence, and is
  proved equivalent rather than offered as a second definition.
- *Edge cases.* Unramified over one or two of the three places; `F = k(t)` itself; `k` not
  algebraically closed, where residue degrees above a marked place can exceed `1`.
- *Downstream interfaces.* Layers 9.5, 9.7, 10, 11, 12.4 — all of which inherit
  `[CharZero k]` from here and none of which re-derives it.

⚠ *Nearby false statement:* "branch locus equal to `{0,1,∞}`" is the wrong condition. The
definition is containment, and the degree-`2` example above is a Belyi pair unramified over
`0`. A roadmap milestone or a database record that assumes equality excludes genuine Belyi
maps.

**The branch-point `S₃`-action, algebraically.** The six anharmonic Möbius transformations of
Layer 5.1 are defined over the prime field, so **postcomposition** `β ↦ m ∘ β` carries an
algebraic Belyi pair to an algebraic Belyi pair over the same `k`, with the same curve and the
same degree: on the function-field side it is precomposition of the embedding `k(t) ↪ F` with
the `k`-automorphism of `k(t)` sending `t` to `m(t)`. The six formulas, written as *which
Möbius map to postcompose with* to realize each operation of Layer 2.6's table:

```text
id        t              swap01    1 − t            swap1Inf   t/(t − 1)
swap0Inf  1/t            rot       (t − 1)/t        rotInv     1/(1 − t)
```

⚠ **The last two are crossed, and this is not a typo.** Postcomposition with `m` replaces the
fiber over a marked point `q` by the fiber of `β` over `m⁻¹(q)`, so postcomposing with the map
whose puncture permutation is `ρ` realizes the operation labelled `ρ⁻¹`. The four involutions
are insensitive to this; the two three-cycles are not, so `rot` — labelled `(0 1 ∞)` — is
realized by `(t − 1)/t`, whose puncture permutation is `(0 ∞ 1)`. Getting this backwards is
the single easiest error in the whole `S₃` story, and it is invisible on every example whose
`S₃`-orbit has fewer than six elements.

Milestones: each of the six is a Belyi pair again; the operation permutes the three marked
places by the `ρ` of Layer 2.6's table and permutes the local `(e, f)` data accordingly; the
composition law is the same right action; and — the agreement statement — **under the
analytic/algebraic comparison of 9.5–9.8 and the classification of 6.3, the algebraic action
corresponds to the topological one and hence to the combinatorial one.** That is the third leg
of Layer 2.6's "the three actions agree", and it is what makes an `S₃`-orbit of passports
(Layer 2.6) an invariant of the algebraic object rather than of a presentation of it.

*Prerequisites:* AlgebraicCurves Layers 0, 1, 6, 12; Layers 2.6, 5.1, 6.3; Mathlib `CharZero`,
`IsAlgClosed`, the `GL(2)` Möbius action.

*Tau Ceti:* the predicate `TauCeti.IsAlgebraicBelyiPair` and the bundled
`TauCeti.AlgebraicBelyiPair` with its isomorphism classes `TauCeti.AlgebraicBelyiPair.IsoClass`;
the marked places `TauCeti.Place.zeroOneInfty`; the local data `TauCeti.Place.localData` with
`TauCeti.Place.sum_mul_localData` and `TauCeti.Place.weightedRamificationPartition`; the
`S₃`-action through `RatFunc.branchPointAut` and `TauCeti.IsAlgebraicBelyiPair.of_branchPointAut`;
the examples `TauCeti.isAlgebraicBelyiPair_ratFunc` and
`TauCeti.isAlgebraicBelyiPair_adjoinRoot_X_pow_sub_C_X`; and base change along an algebraic
constant extension, `TauCeti.isAlgebraicBelyiPair_iff_of_constantCompositum_eq_top`. Base change
along a transcendental constant extension, the `ℚ`, `n = 3` example, the agreement of the
algebraic `S₃`-action with the topological one, and the morphism-of-curves comparison remain.

#### 9.1C Fixed-base extension of algebraically closed constants

This early algebraic cut is independent of 9.2's meromorphic field, the analytic comparison,
Belyi's theorem and the arithmetic outer action. It supplies the finite-cover comparison
used in 10.6's finiteness argument; 12.4 later combines it with 10.7 for essential surjectivity.

For an extension `k⊂L` of **algebraically closed fields of characteristic zero**, constant
extension gives the required finite-cover comparison. For a finite separable function
field `E/k(t)`, use `E_L=L(t)⊗_{k(t)}E`, equivalently the function field
`Frac(L⊗_k E)`, with the proof that geometric integrality makes it a field. For products
of such fields use the componentwise finite étale algebra, retaining the empty product.
Every morphism fixes the distinguished `t`.

**Full faithfulness, as a finite-cover producer here.** Consume the generic
regular-extension statement of AlgebraicCurves Layer 12, item 12B.0a (from the regular-field
equivalence of its Layer 8 item 2): for an extension `L/k` with `k` algebraically closed and
any field `F/k`, `L/k` is regular and `F` is relatively algebraically closed in
`Frac(F⊗_k L)`, together with the actual fraction-field maps, the comparison
`Frac(L⊗_k F) ≃ L(t)⊗_{k(t)} F` for a separating `t`, and `[F:k(t)] = [F_L:L(t)]`. Neither an
unrestricted genus claim nor the algebraic-constant extension package of its Layer 8 supplies
this. The following fixed-`t` application is this roadmap's.

Now let `E,F` be finite over `k(t)` and let `E_L→F_L` be an `L(t)`-embedding. The image of
each element of `E` is algebraic over `k(t)`, hence algebraic over `F`; by the lemma it
lies in `F`. Restriction gives a unique `k(t)`-embedding `E→F`, and extension recovers the
original map. Prove the inverse laws and naturality, then apply componentwise to finite
étale algebras. This is a theorem for maps **over the fixed base `t`**, not all morphisms
between curves. For example new rational maps with coefficients in `L\k` are not
claimed to descend. The algebraically closed constant-field hypothesis is also not
replaced by an arbitrary number field.

**Ramification and the finite-cover category.** Prove that this constant extension
preserves the degree and all geometric ramification indices of a finite map over the fixed
base `ℙ¹`. AlgebraicCurves Layer 12, items 12B.0b and 12B.0d, supplies the generic input; this
milestone applies it over the fixed base. Use AlgebraicCurves Layer 12's regular projective
models: over algebraically closed
characteristic-zero `k` they are smooth and geometrically integral, their scalar extensions
are smooth/normal, and a finite morphism remains finite under field base change. Match
their function fields with the tensor/fraction-field presentations above. In a smooth local
parameter, `s=u z^e` with `u` a unit; flat extension of constants preserves its first nonzero
coefficient and order. Equivalently use the Cartier ramification divisor from the relative
differential and prove its compatibility with flat constant extension. Its finite support
on the base consists of `k`-points, since `k` is algebraically closed; after extending to
`L` it has the same support there and cannot gain a branch value in `L\k`. State the
local-ring, normalized-valuation, residue and degree comparisons, not just a bijection of
isomorphism classes. This proves preservation of the three-point unramified condition and
the ordered geometric ramification partitions. Arbitrary field products and the empty
finite algebra are handled componentwise.

The generic tensor/fraction-field, regularity, relative-algebraic-closure and smooth-model
statements belong once to AlgebraicCurves (its Layer 8 item 2 and Layer 12 items 12B.0a,
12B.0b, 12B.0d), using existing Mathlib carriers. This cut owns the fixed-`k(t)` finite-cover
application, the resulting inverse-on-Hom proof, and its Belyi ramification consumers.
AlgebraicCurves' Layer 8 package for **algebraic** constant extensions is consumed only at that
scope; it is not substituted for transcendental constant extension. No full faithfulness of
all curve morphisms, or of constant extension from an arbitrary number field, is claimed. No
new generic carrier is defined here.

*Prerequisites:* AlgebraicCurves Layers 0 and 6 (finite separable function fields and
normalized places), its Layer 8 item 2 and its Layer 12 items 12B.0a, 12B.0b and 12B.0d;
Mathlib tensor products, fraction fields, algebraic extensions and flat base change. For the
local formulas the residue extensions are separable (here the closed-point residues are the
algebraically closed characteristic-zero constant field). These supplier items have no premise
in Layers 9.2–14 of this roadmap.

#### 9.2 The meromorphic function field

**The carrier, exactly.** Let `X` be a nonempty connected Riemann surface. The field
structure does not require compactness. On a disconnected surface the component fields
form a product and have zero divisors; the empty space does not give a nontrivial field.
Use the compact-surface owner's holomorphic sphere-map vocabulary and its noncompact
restriction to define

```lean
def M (X) := {f : X → OnePoint ℂ // MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ f ≠ fun _ => ∞}
def poles (f : M X) : Set X := f ⁻¹' {∞}
```

For a nonzero meromorphic function, zeros and poles are locally discrete, hence locally
finite on compact subsets. Prove this in a chart by the first nonzero Laurent coefficient
and the identity theorem. They need not be globally finite: `1/sin` on `ℂ` has infinitely
many poles. The polar and zero sets, local orders and change-of-chart laws are part of the
basic API, without a compactness hypothesis.

Define addition and multiplication by their characterization off the union of polar sets,
then extend locally across each exceptional point. On a sufficiently small chart every
input is a Laurent series with finite principal part, so its sum/product is again
meromorphic; agreement on overlapping charts and uniqueness follow from the identity
theorem. Negation is pointwise away from poles. For nonzero `f`, reciprocation interchanges
its locally discrete zeros and poles and gives the inverse; set `0⁻¹=0`. Prove all field
and `ℂ`-algebra laws using the common dense regular locus and uniqueness, not a nonexistent
globally finite exceptional set.

**New object: `M(X)`.** Its required API includes:

- the nontrivial field and `ℂ`-algebra structures and the characterizations of every operation;
- `ord_x : M(X)ˣ → ℤ` on nonzero functions, with `ord_x(fg)=ord_x f+ord_x g`, inversion,
  addition's valuation inequality and chart independence; the extended order of zero is
  `⊤` in `WithTop ℤ`, not an integer forced to satisfy the unit formula;
- the comparison with Mathlib's chartwise `MeromorphicOn`/order vocabulary and the local
  zero/pole criteria;
- functorial pullback by a nonconstant holomorphic map. It is a field embedding because a
  nonzero meromorphic function cannot vanish on the open image of such a map;
- the exact constant field: every element of `M(X)` algebraic over the embedded `ℂ` is a
  constant, since `ℂ` is algebraically closed. This is distinct from the assertion about
  all globally holomorphic functions, which requires compactness;
- under **compactness**, finite support of the divisor of every nonzero function and the
  resulting `Finsupp` divisor API. Prove separately that every globally holomorphic scalar
  function is constant by the compact maximum principle;
- `M(OnePoint ℂ)=ℂ(t)` by subtracting the finitely many principal parts on the compact
  sphere and applying the maximum principle to the holomorphic remainder. For a
  nonconstant `β : X → OnePoint ℂ`, pullback then gives `ℂ(t) ↪ M(X)`.

The local construction and its laws are required on connected noncompact surfaces as well
as compact ones; finite divisors, degrees and the later algebraization use compactness.

**What compactness actually buys.** It is *not* that the constants change: on any
connected Riemann surface a meromorphic function algebraic over the constant field is
constant, so the constant field of `M(X)` is `ℂ` whether or not `X` is compact. Compactness
is load-bearing for four other things, and each statement in this layer names which one it
uses:

- a noncompact surface **may** carry nonconstant global holomorphic functions — `ℂ` carries
  `z` — so the maximum principle of 8.1 fails, and with it every argument in 9.2–9.5 that
  concludes a holomorphic function is constant from boundedness alone. ⚠ Stated as "may",
  with a witness: the universal statement for open Riemann surfaces is a theorem of
  Behnke–Stein, which this roadmap neither proves nor lists as a dependency, and nothing
  here needs it;
- a meromorphic function may have **infinitely many poles** (`1/sin`, on `ℂ`);
- the **polar divisor need not have finite support**, so "the divisor of `f`" is not a
  finitely supported function and the divisor-degree bookkeeping of 9.4–9.5 has nothing to
  count;
- the compact maximum-principle and finite-divisor arguments used in 9.2–9.5 therefore do
  not transfer, and the sphere computation `M(OnePoint ℂ) = ℂ(t)` has no noncompact
  analogue.

*Source:* Forster **1.12** and **1.15** for meromorphic functions and their identification
with holomorphic maps to `ℙ¹`, with **1.16** for the field structure. The sphere
computation is Girondo–González-Diez **Proposition 1.26**, `M(ℙ¹) = ℂ(z)`, by subtracting
principal parts and applying Liouville — the classical partial-fraction argument; and
**Proposition 1.23** identifies `M(S)` with the non-constant-`∞` morphisms to `Ĉ`, which is
the definition this milestone uses.

*Prerequisites:* Layers 8.1–8.3; Mathlib `MeromorphicOn`, `analyticOrderAt`, `RatFunc ℂ`.

*Tau Ceti:* `TauCeti.RiemannSurface.MeromorphicFunction` with its field and algebra structures,
the order `TauCeti.RiemannSurface.MeromorphicFunction.order`, pullback
`TauCeti.RiemannSurface.MeromorphicFunction.comapₐ` with `comapₐ_injective`, and the sphere
computation `TauCeti.RiemannSurface.MeromorphicFunction.ratFuncEquiv`. The exact constant field
remains.

#### 9.3 The degree theorem

For a nonconstant holomorphic `β : X → OnePoint ℂ` of degree `n` on a compact connected
Riemann surface, `M(X)` is a finite separable extension of `ℂ(t)` of degree exactly `n`. The
two halves, each its own milestone:

- **Every element has degree at most `n` over `ℂ(t)`.** For `f ∈ M(X)`, form the elementary
  symmetric functions of the fiber values of `f`, counted with the multiplicities
  `ramificationIndex β x`. Off the finite set of branch values of `β` together with `β` of
  the poles of `f`, these are well-defined holomorphic functions of `t` (locally, the fiber
  is given by `n` holomorphic sections by 8.3's covering property, and a symmetric function
  of them is single-valued); they extend meromorphically across the finite exceptional set
  because they are locally bounded there after multiplying by a suitable power of a local
  coordinate; so by 9.2's sphere computation they lie in `ℂ(t)`. The resulting monic
  polynomial of degree `n` kills `f`.
- **Some element has degree exactly `n`.** Three named lemmas, not one step:
  1. **Point separation.** For distinct `x≠y`, take `D=N[x]` with `N≥2g` large
     enough that both `D` and `D-[x]` are in the Riemann–Roch large-degree regime.
     ModularForms §10B gives `ℓ(D)-ℓ(D-[x])=1`, so a function in the difference has
     a pole of order exactly `N` at `x` and no pole at `y`. Choose `N≥2g+1` uniformly
     to avoid the genus-zero small-degree boundary. This supplies the independent
     pole-separation target, distinct from the regular simultaneous evaluation below.
   2. **Fiber separation, with regular evaluations.** Let `S={x₁,…,x_n}` be an unbranched
      fiber and choose `q` outside `S`, possible because a surface chart contains infinitely
      many points. For `N ≥ 2g+n`, apply Riemann–Roch to `Nq` and `Nq-Σ_i x_i`:
      the evaluation map `L(Nq) → ℂ^n` is onto (both higher-cohomology terms vanish, or
      compare the two RR dimensions and its kernel). All these functions are regular at
      **every** point of `S`. Produce the coordinate interpolation functions and hence
      regular pair-separators. The coefficients of a combination with equal evaluations at
      a fixed pair form the kernel of a nonzero complex-linear functional. A finite union
      of those proper hyperplanes is proper, so some combination has `n` distinct finite
      values. Prove this genericity lemma as well as the interpolation construction.
      Pole-based separators from step 1 alone cannot be used for this linear argument:
      for `β=z³`, the pair-separators `1/(z-1),1/(z-1),1/(z-ω)` on the fiber
      `{1,ω,ω²}` have generic sums with poles at both `1` and `ω`, so both values are `∞`.
      The pole location outside the entire fiber is what makes evaluation linear.
  3. **Generation.** Such an `f` has `n` distinct values on the fiber, so its minimal
     polynomial over `ℂ(t)` has degree `n` by the first half, giving
     `[ℂ(t)(f) : ℂ(t)] = n`. To conclude `M(X) = ℂ(t)(f)`, take any `g ∈ M(X)`, let `h` be a
     primitive element of `ℂ(t)(f, g)` — available in characteristic zero — and apply the
     first half to `h`: `[ℂ(t)(h) : ℂ(t)] ≤ n`, while `ℂ(t)(f) ⊆ ℂ(t)(h)` forces
     `[ℂ(t)(h) : ℂ(t)] ≥ n`. Hence `ℂ(t)(h) = ℂ(t)(f)` and `g ∈ ℂ(t)(f)`.

  ⚠ Step 3 is not optional bookkeeping. One element of degree `n` bounds nothing about
  `M(X)` on its own; without it the first half leaves `[M(X) : ℂ(t)]` unbounded.

Separability is automatic in characteristic zero.

⚠ *Nearby false statement:* the first half alone gives only "algebraic of degree at most
`n`", which does not bound `[M(X) : ℂ(t)]` without knowing `M(X)` is generated by one
element — and that is what the second half supplies. Skipping it leaves the degree
unbounded, which is the gap the phrase "the monodromy is finite, so the field is finite"
hides.

*Source:* Girondo–González-Diez **Proposition 1.89** is the first half exactly —
`[M(S) : ℂ(f)] ≤ deg f` by the elementary symmetric functions of the fibre values — and
**Corollary 1.93(iv)** upgrades it to the equality `deg f = [M(S) : ℂ(f)]`. Forster proves the
same over a general base as **8.3** (`π* : ℳ(X) → ℳ(Y)` is algebraic of degree `deg π`), by
the elementary-symmetric-function argument of **8.1** and **8.2**; his separating input is
**14.13**, which rests on the finiteness theorem **14.10**.

⚠ **The second half is where the routes diverge, and the citation is not the plan.** That
book's separating function is its **Theorem 1.90** (given `P ≠ Q` there is `φ ∈ M(S)` with
`φ(P) = 0`, `φ(Q) = ∞`), which it calls "a highly non-trivial result" and proves **by
uniformization**: the Weierstrass `℘`-function in genus one (**Corollary 2.12**) and Poincaré
series for a cocompact Fuchsian group in genus `≥ 2` (**Proposition 2.16**). This roadmap does
not have uniformization and does not want it, so the milestone above gets its separating
function from the Riemann–Roch chain instead. An implementer following the citation to its
proof would be led into chapter 2's Fuchsian machinery, which nothing else here uses.

*Prerequisites:* Layers 8.2, 8.3, 9.2; ModularForms §10B (divisor sheaves, finiteness of `H¹`,
analytic Riemann–Roch).

*Tau Ceti:* the first half, `TauCeti.RiemannSurface.MeromorphicFunction.natDegree_minpoly_ratFunc_le`,
and the degree of a separating element, `natDegree_minpoly_ratFunc_eq_degree`, conditional on
point separation. The unconditional separation, the generation step and
`[M(X) : ℂ(t)] = n` remain.

#### 9.4 Points and places

For `X` compact connected with a nonconstant `β`, build the map from points of `X` to places
of `M(X)/ℂ` (AlgebraicCurves Layer 0's `Place`), sending `x` to the valuation `ord_x` of
9.2, and prove it is a **bijection**:

- well-defined: `ord_x` is a discrete valuation trivial on `ℂ`, and its **value group is
  `ℤ`**. ⚠ The second half is not the observation that a local coordinate has order `1`: a
  chart coordinate is a germ, not an element of `M(X)`, and `ord_x` is a function on `M(X)`.
  What supplies a global witness is Riemann–Roch: for each `x` the spaces `L(k·x)` grow
  with `k`, so for `k` large `L(k·x) ⊋ L((k−1)·x)` and any element of the difference has
  `ord_x = −k`; taking two consecutive such `k` and dividing gives an element of order
  exactly `−1`, hence `ord_x` is onto. Cite ModularForms §10B's Riemann–Roch and its divisor
  sheaves `𝒪(D)` for the strict-growth statement, or state the "function with prescribed
  order at one point" consequence here as a named target of this milestone;
- injective: by 9.3's separating function;
- surjective: over each place of `ℂ(t)` the analytic fiber count `Σ e = n` of 8.3 matches the
  algebraic fundamental identity `Σ e·f = n` of AlgebraicCurves Layer 6, and every residue
  degree is `1` because the residue fields contain `ℂ` and are finite over it; so the places
  above each place of `ℂ(t)` are exactly as numerous as the points of the fiber, and
  injectivity forces the map onto;
- compatible: the local ramification index of `β` at `x` (8.2) equals `e(ord_x | P)` for `P`
  the place of `ℂ(t)` below, and `ord_x f` is the algebraic order of `f` at the
  corresponding place.

Also prove that `M(X)` has exact constants `ℂ` in AlgebraicCurves' sense
(`IsIntegrallyClosedIn ℂ (M X)`), so that `M(X)` is a function field there.

⚠ *Nearby false statement:* surjectivity is not formal. It fails for non-compact `X` — the
punctured disc has places of its meromorphic field with no corresponding point — and the
proof above uses compactness twice, through 8.3's fiber count and through finiteness of the
polar divisor.

*Prerequisites:* Layers 8.2, 8.3, 9.2, 9.3; AlgebraicCurves Layers 0, 6.

#### 9.5 Algebraization of an analytic pair

For an analytic Belyi pair `(X, β)`: the pair `(M(X), ℂ(t) ↪ M(X))` is an algebraic Belyi
pair over `ℂ` — 9.4's ramification matching turns "branch values in `{0,1,∞}`" into the
three-place unramifiedness of 9.1 — and the comparison with AlgebraicCurves Layer 12's
regular projective model of `M(X)` matches everything:

- the closed points of the model correspond to the points of `X` (9.4, composed with Layer
  12's points-to-places dictionary);
- `β` corresponds to the map induced by `t`;
- analytic and algebraic ramification indices agree at each point;
- the analytic genus (ModularForms §10B) equals AlgebraicCurves' genus: the two `L(D)` spaces
  are literally the same subspace of `M(X)` under 9.4, so the two Riemann–Roch theorems
  compute the same function `ℓ`, and both read `g` off its large-degree regime;
- the divisors of `β`, of `β − 1` and of `1/β` correspond, which is the statement Layer 14
  turns into the `lambdas` assertion;
- automorphism groups correspond.

*Source:* Girondo–González-Diez **Remark 1.94** states the three-way equivalence between
compact Riemann surfaces, function fields in one variable over `ℂ`, and irreducible plane
curves, and observes that only the passage to `M(S)` is choice-free; **Proposition 1.95**
makes it an equivalence of categories, proving faithfulness and the fullness-plus-essential-
surjectivity clause. **Theorem 1.91** is the concrete form used here — for `M(S) = ℂ(f,h)`
with `F(f,h) ≡ 0`, the map `P ↦ (f(P), h(P))` is an isomorphism onto the curve's surface.
⚠ That proof invokes the separation property (Theorem 1.90), so it inherits the route caveat
recorded at Layer 9.3.

*Prerequisites:* Layers 9.1–9.4; AlgebraicCurves Layers 3, 5, 12; ModularForms §10B.

#### 9.6 The local comparison at a place

This analytic local producer compares every component, valuation and ramification index.
It does not apply the one-variable function-field predicate to the fraction field of all
holomorphic functions on a disc.

**Coefficient rings and scalar maps.** Take a coordinate disc `D` about a base point `p`,
write its coordinate as `s` with `s(p)=0`, and let `D*=D\{p}`. Put `H=𝒪(D)`, the ring of
scalar holomorphic functions, `K_D=Frac(H)`, and
`R_D=H_{𝔪_p}` with `𝔪_p={f | f(p)=0}`. These are the usual localization and fraction-field
constructions, not new function-field or place carriers. Prove that `R_D` is the valuation
ring in `K_D` for analytic order at `p`: each nonzero `f` is `s^r` times a function nonzero
at `p`. It is a DVR with uniformizer `s`, residue field `ℂ`, and completion `ℂ[[s]]` by the
finite Taylor-jet isomorphisms `R_D/(s^N)≃ℂ[s]/(s^N)`. Laurent expansion is an injective
field map `K_D→ℂ((s))`. Also record the map through the ring of convergent germs
`ℂ{s}` and its fraction field `ℂ({s})`; neither map makes `K_D` equal to `ℂ((s))`.

Let `m∈𝒪(D)[Y]` be monic of degree `n∈ℕ`, separable over `K_D`, with discriminant nonzero
on `D*`. (A monic polynomial whose coefficients have poles at `p` is first brought to this form
by the integral rescaling of 9.7 step 3; clearing denominators is not a substitute, since it
destroys monicity.) If `n=0`, then `m=1`, the finite algebra and covering are empty products/empty
objects, all sums are 0 and the extension/ramification statements are vacuous; state that
case separately. For `n>0`, construct the following finite separable algebra and proofs.

```text
A_D = K_D[Y]/(m),             Â = A_D ⊗_{K_D} ℂ((s)).
```

`A_D` may be a product of fields. A component map out of it is not an injective map of
that whole product. The following six steps are definite targets, in proof order.

1. **Finite normalization and the local degree identity.** In the finite free order
   `B=R_D[Y]/(m)`, the trace form becomes nondegenerate over `K_D`. Its trace-dual lattice
   is finite over the noetherian DVR `R_D`; every integral element of `A_D` lies in that
   dual, because traces of integral elements are integral and `R_D` is integrally closed.
   Thus the integral closure `O` of `R_D` in `A_D` is finite and torsion-free, hence free
   of rank `n`. Localize its finitely many maximal ideals: each factor-localization is a
   DVR, with residue degree `f=1` since the residue is finite over `ℂ`. The Chinese
   remainder/local-length computation gives
   `n=length_{R_D}(O/sO)=Σ_𝔭 e_𝔭 f_𝔭=Σ_𝔭 e_𝔭`.
   Prove the equalities with Mathlib's integral-closure, localization, module-length and
   ramification vocabulary. This proof uses the actual analytic DVR above; no
   `IsFunctionField ℂ K_D` hypothesis is inserted.
2. **The smooth covering.** The root space
   `V={(s,y)∈D*×ℂ | m(s,y)=0}` projects to a degree-`n` covering. Distinct simple roots
   give disjoint local holomorphic sections by the implicit-function theorem; a monic
   root bound on a smaller neighbourhood prevents roots escaping when those sections are
   chosen. Apply 7.1 to its connected components `W_i`: each is the cover `s=z^{d_i}`,
   `d_i≥1`, and `Σ_i d_i=n`.
3. **Convergent and formal component maps.** On each punctured model the coordinate `y_i`
   is bounded on a smaller neighbourhood of zero by the monic root bound, so it extends
   holomorphically at zero. Evaluation gives a `K_D`-algebra map
   `A_D→ℂ({z})→ℂ((z))`, with `s↦z^{d_i}`. Its kernel selects a field factor: its image is
   a finite-dimensional domain over `K_D`, hence a field. Only the induced map of that
   field factor is an embedding. By scalar extension obtain the
   `ℂ((s))`-algebra factor map `Â→ℂ((z))`.
4. **Exact ramification, not merely divisibility.** Prove directly that
   `ℂ((z))/ℂ((s))`, `s=z^d`, has basis `1,z,…,z^{d-1}` and cyclic automorphisms
   `z↦ζz`, `ζ^d=1`. Distinct points of a fiber of `W_i` have distinct `y_i` values;
   therefore no nontrivial such automorphism fixes the Laurent series `y_i`.
   Its orbit has `d_i` elements, so `ℂ((s))(y_i)=ℂ((z))`, and the completed component has
   ramification index exactly `d_i`. Prove the basis, orbit/minimal-polynomial and order
   comparisons explicitly; they do not use analytic uniformization or a later Belyi theorem.
5. **All valuations and all factors.** The component minimal polynomials over `ℂ((s))`
   are pairwise distinct irreducible factors of `m`; their degrees sum to `n`, so they
   give `Â≃∏_i ℂ((z_i))`. Compare this with the completion of `O`: finite normalization,
   the Chinese remainder decomposition and completion of each DVR identify
   `O⊗_{R_D}ℂ[[s]]` with the product of its completed local DVRs, and their fraction
   fields with those same factors of `Â`. Prove normalization/completion compatibility
   in this finite-DVR setting using these module and valuation maps. This yields a
   bijection between components `W_i` and maximal ideals of `O`, or equivalently the
   normalized valuations of the field factors of `A_D` over `p`, preserving `e=d_i`,
   `f=1` and which original field factor is selected. It does not silently identify
   the factors before and after scalar extension. The local monodromy cycle lengths
   are exactly the resulting ramification-index multiset.
6. **Global function-field comparison and the unramified case.** For a global finite
   separable `F/ℂ(t)` presented by an equation, form its scalar extension to `K_D` and
   then to `ℂ((s))`. Match integral closures and valuation localizations with the
   global places of AlgebraicCurves Layers 0/6; prove the normalized-order, residue and
   ramification comparisons on these actual maps. The global fundamental identity is
   used only with its function-field hypotheses on `F/ℂ(t)`. The analytic local identity
   was proved independently in step 1. In particular the cover fills unramifiedly over
   `p` exactly when every `d_i=1`, equivalently every local completed factor has `e=1`.
   State this for the product algebra, not just the irreducible case.

The full unramified criterion is: every `e_𝔭=1` iff every `d_i=1`, iff local monodromy at
`p` is trivial, iff the punctured cover extends as a covering over `D`. Combining the
filled-disc chart with 8.2 proves `ramificationIndex β x=d_i=e_𝔭` at each added point;
these are the outputs 9.7–9.8 consume.

The filled normalization has one point per component of the punctured preimage, not one
point per original field factor or per point of the plane locus. The plane locus `{m=0}`
can be singular with crossing branches and a smaller central fiber. Prove the finite map
from the normalization to that locus and its isomorphism off singularities; removability
of a coordinate does not turn a singular plane locus into a surface. Conversely,
field-theoretic unramifiedness becomes a covering assertion only through the comparison
just constructed.

The finite separable algebra, localization, trace-dual and monomial-Laurent lemmas here are
part of this local comparison; generic lemmas are placed in the existing ring/valuation
library and specialized on the displayed rings. The surface, Laurent-expansion and
removable-singularity inputs are 8.1–8.3/9.2 and the punctured-disc classification is 7.1.
No scheme analytification, compactness of a noncompact disc, unproved global pole bound,
or unrelated local-field finite-residue hypothesis is needed.

*Prerequisites:* Layers 7.1,8.1–8.3,9.1–9.2; Mathlib localization, fraction fields, integral
closure, trace pairing, finite modules/length, power and Laurent series; AlgebraicCurves
Layers 0/6 only for step 6's global function-field comparison.

#### 9.7 Analytification of an algebraic pair

For an algebraic Belyi pair `(F, ℂ(t) ↪ F)` over `ℂ`, construct an analytic pair and prove
the two constructions inverse. Route, in proof order:

1. **A primitive element.** `F = ℂ(t)[y]/(m)` for a monic irreducible `m ∈ ℂ(t)[y]` of degree
   `n` — characteristic zero, so the extension is separable and the primitive element theorem
   applies. The coefficients `a_i` of `m` are rational functions of `t`, holomorphic off the
   finite set of their poles. ⚠ Clearing denominators does **not** give 9.6's input, which is
   a **monic** polynomial with holomorphic coefficients: multiplying `m` by a common
   denominator destroys monicity.
2. **The affine analytic model.** Let `Δ ⊂ OnePoint ℂ` be the finite set of poles of the
   coefficients of `m`, the zeros of its discriminant, and the three marked points. Over `OnePoint ℂ ∖ Δ` the vanishing locus of `m`, with the first projection, is a
   degree-`n` covering map (9.6, step 2, applied on a disc about each point of the complement,
   where the coefficients are holomorphic).
3. **Integral rescaling at each point of `Δ`.** At `p ∈ Δ` choose a local parameter `s` (`t − p`,
   or `1/t` at `∞`) and `N ∈ ℕ` with `N · (n − i) ≥` the pole order of `a_i` at `p` for every
   `i < n`. Then `w := s^N · y` is a root of
   `m_N(W) := s^(N·n) · m(W / s^N) = W^n + Σ_(i<n) s^(N·(n−i)) · a_i · W^i`, which is monic with
   coefficients holomorphic on a disc `D` about `p`. Prove that `Y ↦ W / s^N` identifies
   `K_D[Y]/(m)` with `K_D[W]/(m_N)` and that `(s, y) ↦ (s, s^N · y)` identifies the two root
   spaces over `D*`, compatibly with the projections; the discriminants satisfy
   `disc(m_N) = s^(N·n·(n−1)) · disc(m)`, so the rescaling creates no zero of the discriminant on
   `D*`. Apply 9.6 to `m_N` and recover `y = s^(−N) · w` as a meromorphic function. Example:
   `F = ℂ(u)`, `t = u²`, `y = u/(t − 2)` is a primitive element of a degree-`2` Belyi extension,
   unramified at `t = 2`, with `m = Y² − t/(t − 2)²`, whose coefficient has a pole at `2` and both
   of whose roots are unbounded near `2`; with `s = t − 2` and `N = 1`, `w = (t − 2)·y` has the
   monic holomorphic equation `W² − t`.
4. **Extension over the unmarked bad points.** At each `p ∈ Δ ∖ {0,1,∞}`, 9.1 says `F` is
   unramified over `p`, so by **9.6's unramified criterion**, applied to the rescaled `m_N` of
   step 3, the local monodromy at `p` is trivial and the covering extends across `p` as a
   covering. Iterating over the finitely many such `p`
   gives a covering map over `OnePoint ℂ ∖ {0,1,∞}`. ⚠ 9.6 is load-bearing here and cannot
   be replaced by "fill the discriminant fibers with all `e = 1` by removability": the plane
   model is singular at such a point, and removability is a statement about functions, not
   about the local structure of a possibly singular curve.
5. **Compactification.** Layers 7.2–7.4 and 8.5 compactify to an analytic Belyi pair, with
   the local degrees at the three marked points given by 9.6 steps 4–6 applied at `0`, `1`
   and `∞` to the rescaled polynomials of step 3.
6. **Identification of the field.** Its meromorphic field is `F` over `ℂ(t)`: both are
   degree-`n` extensions generated by `y`, and 9.3 makes the comparison a
   `ℂ(t)`-isomorphism.
7. **Agreement of everything else.** Ramification indices agree by 9.6's completed/local/global comparison and 8.2; the
   points of the surface correspond to the places of `F` by 9.4; degrees, divisors and
   automorphism groups follow.

Conclude the equivalence: `9.5` and `9.7` are mutually inverse on isomorphism classes, so
analytic Belyi pairs over `ℂ` and algebraic Belyi pairs over `ℂ` are the same objects. This
is the GAGA-sized statement of the roadmap, proved at exactly Belyi generality and no
further.

⚠ *Nearby false statement:* step 2's covering property holds only off the discriminant. A
milestone that takes the vanishing locus of `m` over all of `OnePoint ℂ ∖ {0,1,∞}` and calls
it a cover is wrong wherever the discriminant vanishes, even though 9.1 guarantees the
*final* map is unramified there — the resolution is step 4, which is 9.6 applied to the
rescaled polynomial of step 3.

*Prerequisites:* Layers 7.2–7.4, 8.5, 9.1, 9.3–9.6; Mathlib primitive element theorem.

#### 9.8 The comparison contract

The named theorem list downstream layers cite, so that nothing below reaches into the
constructions of 9.5, 9.6 and 9.7: equality of degrees; of genera; of the three ramification
partitions; of the attached triple's isomorphism class; of automorphism groups; of the
divisors of `β`, `β − 1`, `1/β`; and functoriality in isomorphisms of pairs. Together with
Layer 8.6, this contract says that all six descriptions of a Belyi object over `ℂ` —
permutation triple, dessin, topological branched cover, analytic pair, algebraic pair,
function field with three marked places — carry the same invariants.

*Prerequisites:* Layers 8.6, 9.5–9.7.

### Layer 10: Belyi's theorem

The theorem rests on the typed Layer 9 chain: compactification, the meromorphic function
field, algebraization, and descent to `ℚ̄`.

The classical statement is an equivalence, and this roadmap builds both directions
separately, because they have nothing in common: one is an explicit construction of rational
functions, the other a descent argument.

> A compact Riemann surface is the analytification of a curve over `ℚ̄` if and only if it
> admits a Belyi map.

*Source for the layer as a whole:* Köck, "Belyi's theorem revisited", **(3.3) Theorem**.
⚠ The paper also states the theorem unnumbered in its introduction; cite (3.3), not a
"Theorem 1.1".

#### 10.1 Branch values of composites

For finite separable maps in the Layer 9.1 sense, or for rational functions
`ℙ¹ → ℙ¹` over a field of characteristic zero, prove

```text
BranchValues (g ∘ f) = g '' (BranchValues f) ∪ BranchValues g ,
```

together with the ramification multiplicativity `e_{g∘f}(x) = e_g(f x) · e_f(x)` it rests
on, and the computation of `BranchValues` of a nonconstant rational function `f = P/Q`
(`P, Q` coprime, `p = deg P`, `q = deg Q`) in **both charts of the source**:

- at a finite point `x` that is not a pole, `x` is a ramification point iff `f′(x) = 0`, with
  branch value `f(x)`;
- at a finite pole `x`, the ramification index is the pole order, so `∞` is a branch value iff
  some finite pole has order `> 1`;
- at `x = ∞`, read `f` in the chart `s = 1/x`: if `p > q` then `f(∞) = ∞` with index `p − q`; if
  `p < q` then `f(∞) = 0` with index `q − p`; if `p = q` then `f(∞) = c`, the ratio of leading
  coefficients, with index `q − deg(P − c·Q)`. The value `f(∞)` is a branch value iff that index
  is `> 1`.

⚠ The affine test alone misses ramification at `∞`: for `f = 1/x²` the derivative `−2/x³` has
no finite zero and the finite pole gives the branch value `∞`, but in `s = 1/x` the map is `s²`,
so `0 = f(∞)` is a branch value too. Counting the zeros of `f′` as a rational function on the
whole sphere is not a substitute: `f = 1/x` is unramified, while `−1/x²` has a zero at `∞`. For
a polynomial of degree `d ≥ 1` the third case says `∞` is a branch value iff `d ≥ 2`, which is
what 10.3 uses. This bookkeeping is used at every step below and is stated once.

*Prerequisites:* Layer 9.1; AlgebraicCurves Layer 6 (ramification in towers); Layer 8.2 for
the analytic form.

*Tau Ceti:* the place form `TauCeti.Place.branchPlaces_eq_image_union` with
`TauCeti.Place.ramificationIdx_restrict_mul`; the analytic form
`TauCeti.RiemannSurface.FiniteHolomorphicMap.branchValues_comp`; for polynomials
`Polynomial.criticalValues_comp` and
`TauCeti.RiemannSurface.FiniteHolomorphicMap.branchValues_spherePolynomial`. The computation for
a general rational function in both charts remains.

#### 10.2 The degree-reduction step

For finite `S⊂ℙ¹(ℚ̄)`, first replace it by its finite Galois closure over `ℚ`. Include `∞`
if needed, and use the well-founded measure

```text
ν(S) = #{x∈S | x∉ℙ¹(ℚ)}.
```

If `ν(S)>0`, choose a nonrational `α∈S`, let `m∈ℚ[X]` be its monic minimal polynomial,
and put `d=deg m≥2`. The whole orbit of `α`, of size `d`, is in `S` and maps to `0`.
Rational points map to rational points, including `m(∞)=∞`. Therefore
`ν(m(S))≤ν(S)-d`. The finite critical points of `m` are roots of `m′`, so their number is
at most `d-1`; adjoining their critical values contributes at most `d-1` nonrational
points, and the critical value at infinity is rational. Hence

```text
ν(m(S) ∪ BranchValues(m)) ≤ ν(S)-1.
```

Prove Galois stability of this new set from the rational coefficients, and prove the
inequality using the displayed orbit removal and the derivative-root bound. This strictly
decreasing natural measure gives a finite composite `p∈ℚ(X)` carrying `S` and every
critical value created by the composition into `ℙ¹(ℚ)`; the branch-value union formula
of 10.1 propagates that assertion at each step. The base case has only rational points and
uses the identity map. Layer 10.3 handles the rational set, including infinity, by its
Möbius normalization and three-point construction.

The **total** cardinality need not drop in this step: for
`S={√2,-√2}`, `m=X²-2` gives `m(S)∪BranchValues(m)={0,-2,∞}` if infinity is included,
and `{0,-2}` when only finite critical values are recorded. The number of nonrational
points drops from 2 to 0 in either convention. Do not substitute total cardinality or the
degree of the field generated by `S` for the proved measure.

*Source:* Köck, *Belyi's theorem revisited*, Lemma 3.5 for degree reduction and the following
three-point step. The measure and estimates defining this target are the explicit ones
above; no claim about an omitted argument or the measure of a different source auxiliary
set is needed.

*Prerequisites:* Layer 10.1; Mathlib `minpoly`, separable conjugates in characteristic zero,
`Polynomial.derivative` and the root-count bound, finite sets and well-founded induction.

*Tau Ceti:* `TauCeti.exists_polynomial_aeval_mem_range`, by a different induction than the
measure `ν`.

#### 10.3 The three-point step

For coprime positive `m, n`, the **Belyi polynomial**

```text
B_{m,n}(x) = ((m + n)^{m+n} / (m^m · n^n)) · x^m · (1 − x)^n
```

satisfies: `B_{m,n}(0) = 0`, `B_{m,n}(1) = 0`, `B_{m,n}(∞) = ∞`, and
`B_{m,n}(m/(m+n)) = 1`. Its derivative is
`const · x^{m−1}(1−x)^{n−1}(m − (m+n)x)`, so:

```text
zeros of B′_{m,n}  ⊆  {0, 1, m/(m+n)} ,   with equality iff m > 1 and n > 1 .
```

⚠ **The containment is the correct statement, and it is strict when `m = 1` or `n = 1`**:
the factor `x^{m−1}` is the constant `1` at `m = 1`, so `0` is not a critical point there,
and likewise `1` at `n = 1`. That costs nothing, because the critical **values** at those
points are `0` and `0`, which lie in `{0,1,∞}` either way; but a milestone asserting
equality is false at `B_{1,1} = 4x(1−x)`, whose only critical point is `1/2`. Prove the
all critical values lie in `{0,1,∞}` from the containment, not from equality — the
constant is chosen precisely to make the value at `m/(m+n)` equal `1`.

The finite-rational-set target is: every finite `S ⊂ ℙ¹(ℚ)` is carried into
`{0,1,∞}` by a composite of rational functions over `ℚ` whose branch values lie
in `{0,1,∞}`. The explicit augmented-set polynomial induction below proves this
stronger polynomial conclusion after adjoining `∞` to S, hence supplies this
rational-function statement as well. Arbitrary Möbius normalizations remain
available for the rational-function version; the polynomial version uses only
its stated affine normalizations.

**The Möbius carrier is `PGL₂`, not `SL₂`.** Fractional-linear transformations of `ℙ¹_ℚ`
are the elements of `PGL₂(ℚ)` — Mathlib's `Matrix.GeneralLinearGroup (Fin 2) ℚ` modulo
scalars, matching the `GL(2)` action on `OnePoint ℂ` the pin already supplies. ⚠ `SL₂(ℚ)`
does not represent every such transformation: `x ↦ λx` is `diag(λ, 1)`, of determinant `λ`,
and scaling to determinant `1` needs `√λ`, which is not rational in general. This milestone
uses `x ↦ λx` to normalize the third point, so the distinction is load-bearing rather than
pedantic.

**Polynomial Belyification over `ℚ`**, a separate statement of this milestone because Layer
13.5 needs it and the rational-function version does not imply it:

```text
for every finite S ⊂ ℙ¹(ℚ̄) with ∞ ∈ S there is a NONCONSTANT POLYNOMIAL q ∈ ℚ[x] with
    q(∞) = ∞  and  BranchValues(q) ∪ q(S ∖ {∞}) ⊆ {0, 1, ∞} .
```

Here `BranchValues(q)` has exactly the target-sphere meaning of 10.1: the
images of the ramification points of `q : ℙ¹ → ℙ¹`. It is not the source critical
locus. For a characteristic-zero polynomial of degree d≥1 its finite branch
values are the values at roots of q′; infinity is a branch value iff d≥2.

**Keep the current branch values as well as the old images.** Begin with a finite
Galois-stable set T containing S and infinity (adjoin the finitely many conjugates
of the algebraic points). Maintain a nonconstant composite h∈ℚ[x] with
`h(S) ∪ BranchValues(h) ∪ {∞} ⊆ T`. Initially h is the identity. Every stage g
updates h to g∘h and T to
`g(T) ∪ BranchValues(g) ∪ {∞}`;10.1's branch-composition containment preserves
this invariant. Layer 10.2's minimal-polynomial induction decreases the number
of nonrational finite points of this augmented T and ends with all finite T
rational. In particular, branch values introduced during rationalization are
not forgotten. All these maps are polynomials fixing infinity.

**Rational augmented-set induction.** Put N=#(T∖{∞}) and prove the target for
this whole finite T, carrying its branch/image role as above. State the base
cases explicitly, using nonconstant affine polynomials over ℚ:

- N=0: take the identity.
- N=1, with finite point a: take `x−a`, sending it to 0.
- N=2, with distinct finite points a,b: take `(x−a)/(b−a)`, sending them to 0,1.

Each is degree 1, fixes infinity and has **empty** branch-value set. For N≥3,
choose the least finite point a and greatest c in the real order on ℚ and any
third point b strictly between them. The affine A(x)=(x−a)/(c−a) sends them
to 0,r,1 with `r=m/(m+n)` for positive coprime integers m,n. Set g=B_(m,n)∘A.
Then g maps a,c to 0, b to 1, infinity to infinity and has branch values contained
in `{0,1,∞}`. Those three target values already occur in g(T). Consequently
`T′=g(T) ∪ BranchValues(g) ∪ {∞}=g(T)` and
`#(T′∖{∞})≤N−1`: two distinct finite points a,c merge, while no new finite
branch value is added. Apply induction to T′, obtaining r₁, and take q=r₁∘g.
Both `q(T)` and `BranchValues(q)` lie in `{0,1,∞}` by 10.1. Composing with the
preceding rationalization h proves the displayed target for the original S.

Composites remain nonconstant polynomials, their degrees multiply, and infinity
is **fixed at every stage**. It is ramified only at stages/composites of degree
at least 2; affine and identity stages do not make it a critical value. For every
nonconstant polynomial the full pole fibre is still `{∞}`, with multiplicity
its degree, exactly what Layer 13.5 needs. No inversion or finite pole is introduced.

⚠ **A general rational Belyi map does not suffice**, and this is not a stylistic preference.
Layer 13.5 needs `P⁻¹(∞) = {∞}` so that every isomorphism of the resulting pairs fixes `∞`
and is therefore affine; a `q` with a finite pole gives `P` extra poles, the dessin is no
longer a tree, and the argument's key step disappears. ⚠ Nor may `x ↦ 1/x` be used to move a
point out of the way: it does not fix `∞`, and it is what makes the general normalization
`PGL₂` rather than affine.

*Source:* Köck, **(3.6) Lemma**, with the polynomial exactly as displayed; Belyi's original
argument uses the same polynomial. Girondo–González-Diez §3.1 runs the same algorithm and
asserts in the proof of its **Theorem 4.49** that it returns a polynomial `q ∈ ℚ[x]`; the
displayed statement is that assertion made into a target.

*Prerequisites:* Layers 10.1, 10.2; Mathlib polynomial calculus,
`Matrix.GeneralLinearGroup`/`Matrix.GeneralLinearGroup.det` and the `GL(2)` Möbius action
on `OnePoint`.

*Tau Ceti:* `TauCeti.belyiPolynomial` with `TauCeti.criticalValues_belyiPolynomial_subset`, and the
polynomial Belyification `TauCeti.exists_polynomial_aeval_mem_criticalValues_subset`: for every
finite set `S` of elements algebraic over `ℚ` there is a nonconstant `q ∈ ℚ[x]` with `q(S) ⊆ {0, 1}`
and every finite critical value of `q` in `{0, 1}`. The rational-function version and the
equality clause for the critical points remain.

#### 10.4 A curve over `ℚ̄` admits a Belyi map

For a function field `F/ℚ̄` (AlgebraicCurves' sense): choose any nonconstant `t₀ ∈ F` —
separating, automatically in characteristic zero — so that `F/ℚ̄(t₀)` is finite separable
with a finite branch set `S ⊂ ℙ¹(ℚ̄)` (AlgebraicCurves Layer 6). Compose `t₀` with the maps
of 10.2 and then 10.3 applied to `S` together with the accumulated critical values. By 10.1
the composite `β` has all its branch values in `{0,1,∞}`, and it is finite and separable as a
composite of such. So `(F, ℚ̄(β) ↪ F)` is an algebraic Belyi pair.

The degree is tracked through the composite and is not optimized; no milestone here claims a
bound on the degree of the resulting Belyi map.

*Prerequisites:* Layers 9.1, 10.1–10.3; AlgebraicCurves Layers 0, 6.

*Tau Ceti:* `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`, for function fields over any
algebraic extension of `ℚ`, with `TauCeti.IsFunctionField.exists_polynomial_isAlgebraicBelyiPair`
for a given transcendental element.

#### 10.5 Automorphisms of `ℂ`, and the moduli field of a pair

The descent direction runs through the **relative** field of moduli of the pair `(F, t)`,
not through the field of moduli of the curve. This milestone builds the vocabulary; nothing
in it is specific to Belyi maps.

**The group-theoretic input**, three statements about the abstract group `Aut(ℂ)`:

1. every automorphism of a subfield `K ⊆ ℂ` extends to an automorphism of `ℂ`, and
   `ℂ^{Aut(ℂ/K)} = K`;
2. if `U ≤ Aut(ℂ)` and `Aut(ℂ/K) ⊆ U` for some field extension `K/ℂ^U` that is **finite**,
   then `U` is closed, i.e. `U = Aut(ℂ/ℂ^U)`;
3. if `V ≤ U ≤ Aut(ℂ)` with `[U : V] < ∞`, then `ℂ^V/ℂ^U` is a **finite** field extension,
   with `[ℂ^V : ℂ^U] ≤ [U : V]` when `V ⊴ U` or `U` is closed, and equality when `V` is
   closed.

⚠ Not every finite-index subgroup of `Aut(ℂ)` is closed, so 3 is stated for arbitrary
subgroups and its inequality clause carries hypotheses. Statement 3 is the whole engine of
10.6 and 10.7.

**The moduli field of a pair.** For an algebraic Belyi pair `(F, ℂ(t) ↪ F)` over `ℂ`, and
`σ ∈ Aut(ℂ)`, let `(F, ℂ(t) ↪ F)^σ` be the conjugate pair — the same abstract field with
its `ℂ`-algebra structure precomposed by `σ⁻¹` and the same distinguished `t`. That
construction is **defined here**, for the abstract group `Aut(ℂ)`; Layer 11 restricts it to
`Gal(ℚ̄/ℚ)` and adds nothing to it. Set

```text
U(F, t) := {σ ∈ Aut(ℂ) | (F, t)^σ ≅ (F, t) as pairs} ,
M(F, t) := ℂ^{U(F, t)} .
```

Prove `U(F, t)` is a subgroup and that `M(F, t)` contains the moduli field of `F` alone.
⚠ **The distinguished `t` is part of the datum**, and dropping it gives a different and
smaller field; the whole point of Köck's route is that the *relative* moduli field is
tractable where the absolute one is not.

*Source:* Köck, "Belyi's theorem revisited", **(1.4)**, **(1.5)**, **(1.6) Lemma** for the
three group-theoretic statements, and **(2.1) Definition** for `M(X, t)`, there phrased with
the commuting square `t ∘ f_σ = Proj(σ) ∘ t^σ`.

*Prerequisites:* Layer 9.1; Mathlib field automorphisms, `IntermediateField`, infinite
Galois theory. The conjugation of pairs is defined here for the abstract group `Aut(ℂ)`;
Layer 11 restricts it to `Gal(ℚ̄/ℚ)` and consumes it there.

*Tau Ceti:* statement 1 as `TauCeti.IsAlgClosed.fixedField_top_eq_bot`, statement 2 as
`IntermediateField.fixingSubgroup_fixedField_of_fixingSubgroup_le`, statement 3 as
`IntermediateField.finiteDimensional_fixedField_of_relIndex_ne_zero`,
`IntermediateField.relfinrank_fixedField_le_relIndex` and
`IntermediateField.relfinrank_fixedField_eq_relIndex`; the conjugate pair
`TauCeti.AlgebraicBelyiPair.conj` and the moduli field
`TauCeti.AlgebraicBelyiPair.IsoClass.fieldOfModuli`, with
`TauCeti.AlgebraicBelyiPair.curveFieldOfModuli_le_fieldOfModuli`.

#### 10.6 Finiteness in bounded degree, and the moduli field is a number field

Over an algebraically closed field of characteristic zero — used at `ℚ̄` and at `ℂ` — there
are finitely many isomorphism classes of algebraic Belyi pairs of degree `n`. Over `ℂ` this
is Layer 9.8 plus 8.6 plus Layer 3.1: classes inject into isomorphism classes of degree-`n`
triples, of which there are finitely many. Over `ℚ̄` it follows by early 9.1C full faithfulness
of base change to `ℂ`, which preserves and reflects isomorphisms over the fixed base `t`.

For an arbitrary algebraically closed characteristic-zero `k`, do not assume that `k`
embeds into `ℂ`. Let `M` be the finite complex bound from the preceding classification.
If `M+1` pairwise nonisomorphic degree-`n` pairs existed over `k`, their finitely many
coefficients, field-basis/multiplication and finite-map/branch witnesses descend together
to a single finitely generated subfield `k₀/ℚ`. Use their base change to an algebraic
closure `k̄₀` inside `k`: geometric integrality and separability of these finite models
follow by faithful field extension from the given ones over `k`; their degree and
three-point ramification condition descend as well. A finitely generated characteristic-
zero field embeds into `ℂ` by choosing images of a finite transcendence basis algebraically
independent over `ℚ` and extending its finite algebraic part; the embedding extends to
`k̄₀` because `ℂ` is algebraically closed. Apply early 9.1C to both algebraically closed
extensions `k̄₀ ⊂ k` and `k̄₀ → ℂ`. The `M+1` classes remain distinct over `ℂ`, a
contradiction. Supply the finite-presentation/faithfully-flat descent of these finite
witnesses and this embedding construction explicitly. This proves the stated arbitrary-
`k` finiteness without using 10.7's later descent theorem or an embedding of all of `k`.

**The corollary that Layer 10.7 consumes.** `Aut(ℂ)` acts on isomorphism classes of degree-`n`
Belyi pairs over `ℂ`, preserving the degree and the three marked places — the latter because
`0, 1, ∞` are `ℚ`-rational and `Proj(σ)` fixes them. So every orbit is finite, the stabilizer
`V` of the class of `(F, t)` has finite index in `Aut(ℂ)`, and `V ⊆ U(F, t)`. By 10.5's
statements 1 and 3 with `U = Aut(ℂ)`,

```text
M(F, t) = ℂ^{U(F,t)} ⊆ ℂ^V ,   with [ℂ^V : ℚ] < ∞ ,
```

so **`M(F, t)` is a number field**.

*Source:* Köck **(3.1) Proposition** — for `S ⊂ ℙ¹_C` finite and `d ≥ 1`, finitely many
isomorphism classes of pairs `(X, t)` of degree `d` with critical values in `S` — proved
there by injecting into homeomorphism classes of degree-`d` coverings of `ℙ¹(ℂ) ∖ S` and
using that a finitely generated group has finitely many subgroups of each finite index; and
**(3.2) Corollary**, the statement that `M(X, t)` lies in a finite extension of `K` whenever
the critical values are `K`-rational. Girondo–González-Diez **Proposition 2.63** is the same
finiteness statement analytically. ⚠ Both proofs are the argument this roadmap already owns:
Layer 5.6's free generation of `π₁` plus Layer 3.1's finite enumeration.

*Prerequisites:* Layers 3.1, 5.6, 8.6, 9.1C, 9.8, 10.5; AlgebraicCurves Layer 8 item 2 and Layer
12 items 12B.0a, 12B.0b and 12B.0d (regular constant extension and finite-model descent);
finite presentation and faithful field descent. No 10.7 premise.

#### 10.7 Belyi pairs descend to `ℚ̄`

Every algebraic Belyi pair over `ℂ` is the base change of one over a number field, hence of
one over `ℚ̄`. **The route is Köck's, and it is an explicit construction of a model, not a
descent datum.** In proof order:

1. **A finite rational unbranched value.** Choose `Q ∈ ℚ`, viewed as a finite
   point of ℙ¹(ℚ), outside the branch values of t — possible since that set is
   finite and ℚ is infinite — and a place P of F over Q. This finite choice also
   makes the local coordinate `t−Q` in step 3 explicit.
2. **A generator with a single pole, with the place count proved.**
   Riemann–Roch on `(g+1)·[P]` (AlgebraicCurves Layer 5, deg P=1 over ℂ) gives
   z∈F∖ℂ whose only pole is P. Put E=ℂ(t,z)⊆F and p=P|E. This is a finite
   function-field extension F/E because E contains ℂ(t). The place p is a pole
   of z. Every place R of F above p is therefore a pole of z, so R=P: there is
   exactly **one** place above p. Since Q is unbranched for t,
   `1=e(P/Q)=e(P/p)e(p/Q)` gives e(P/p)=1. All the residue fields here are ℂ
   (finite extensions of the algebraically closed constant field), so f(P/p)=1.
   The fundamental identity for F/E at p now gives
   `[F:E]=Σ_(R|p)e(R/p)f(R/p)=1`. Hence F=ℂ(t,z). Both the unique-place and
   local-degree conclusions are required; being unramified at one place alone
   would not imply global degree 1.
3. **Rigidifying `z`.** Among such `z`, take the pole order `m := −ord_P(z)` **minimal**;
   then `{x ∈ F | ord_P x ≥ −m and ord_{P'} x ≥ 0 for P' ≠ P} = ℂ ⊕ ℂ·z`. Since `Q` is not a
   critical value, `t − Q` is a uniformizer at `P`, so `z` has a Laurent expansion in
   `t − Q`; normalize it so that the coefficient of `(t − Q)^{−m}` is `1` and the coefficient
   of `(t − Q)^0` is `0`. **That determines `z` uniquely.**
4. **Invariance of the minimal polynomial.** Let `U(F, t, P) ⊆ U(F, t)` be the subgroup of
   those `σ` admitting an isomorphism `f_σ` of pairs with `f_σ(P^σ) = P`; such an `f_σ` is
   unique, because the automorphism group of the pair acts freely on the fiber over an
   unbranched `Q`. So `U(F, t, P)` acts on `F` by `ℂ`-semilinear field automorphisms fixing
   `t`, and it is the stabilizer of `[P]` under the action of `U(F, t)` on the finite set
   `t^{-1}(Q)/Aut(F, t)`, hence of **finite index** in `U(F, t)`. The three properties
   pinning `z` in 3 are preserved by that action, so `z` is fixed, and therefore so are the
   coefficients of its minimal polynomial over `ℂ(t)`.
5. **The model.** By 10.5 statement 3 those coefficients lie in `k(t)` for a finite extension
   `k` of `M(F, t)`, which is a number field by 10.6. Put
   `F_k=k(t)[Z]/(minpoly)`. Its polynomial remains irreducible over `ℂ(t)`, by its
   construction as the minimal polynomial of `z`, so prove the natural finite-algebra map
   `ℂ(t)⊗_{k(t)}F_k ≃ F` is a field isomorphism. Equivalently take the function field
   `Frac(ℂ⊗_k F_k)` of the geometrically integral constant extension and prove its
   agreement with that finite `ℂ(t)`-algebra. The raw tensor `ℂ⊗_k F_k` need not be a
   field even for `F_k=k(t)`; it is not identified with `F` without taking its function
   field. Prove exact constants and geometric integrality from irreducibility after
   extension, and transport degree and all three unramified-place conditions. This gives
   an algebraic Belyi pair over `k`; its regular constant extension to `ℚ̄` gives the pair
   over `ℚ̄`. The rational-map/local-data comparisons are part of this target.

⚠ **The general statement is "over a finite extension of `M(F, t)`", not "over
`M(F, t)`".** Equality holds when the covering is Galois, because then `t^{-1}(Q)/Aut(F,t)`
is a single point and `U(F, t, P) = U(F, t)`; in general it does not, and no milestone here
asserts it. This is the same gap Layer 11.6 studies, and Layer 10 does not need it closed.

Conclude the classification corollary: analytic Belyi pairs over `ℂ`, algebraic Belyi pairs
over `ℂ`, algebraic Belyi pairs over `ℚ̄`, connected triples, and connected dessins all
classify the same objects. The classical slogan follows in two lines: a compact Riemann
surface admits a Belyi map iff it is the analytification of a curve over `ℚ̄` — the "only if"
by this milestone applied to the pair, the "if" by 10.4 applied to the curve's function
field and 9.7 to analytify.

⚠ *Nearby false statement:* "the cover has finite monodromy, hence the curve is algebraic
over `ℚ̄`" is not an argument; it names no descent datum and no model.

⚠ *Nearby false statement:* a dense set of good specializations taking finitely many
isomorphism classes does **not** put the generic fiber in one of those classes. That
inference needs an isomorphism scheme, constructibility, or a rigidity theorem, none of
which this roadmap has, and the specialization-and-pigeonhole route is not used for that
reason.

*Source:* Köck **(2.2) Theorem** for steps 1–5 — "the curve `X/C` and the morphism `t` are
defined over a finite extension of `M(X, t)`, and over `M(X, t)` itself if `t` is a Galois
covering" — and **(3.3) Theorem** for the assembly with 10.6. ⚠ Köck's (2.2) needs neither
his (1.8) (which he cites without proof) nor Weil descent: the general case is the explicit
`z` above plus 10.5 statement 3, and his (1.9) Weil criterion enters only in his §1 material
on the *absolute* moduli field, which this roadmap consumes at Layer 11.4 for a different
purpose.

*Prerequisites:* Layers 9.1, 9.5–9.8, 10.4–10.6; AlgebraicCurves Layers 5, 6.

*Tau Ceti:* step 2, `TauCeti.IsAlgebraicBelyiPair.exists_ord_neg_and_adjoin_simple_eq_top`; step 3,
`TauCeti.IsAlgebraicBelyiPair.existsUnique_laurentCoeff_eq_one_and_adjoin_simple_eq_top`; step 4,
`TauCeti.AlgebraicBelyiPair.pointedStabilizer` with `relIndex_pointedStabilizer_le_finrank` and
`TauCeti.IsAlgebraicBelyiPair.map_minpoly_eq_of_laurentCoeff_eq_one_of_laurentCoeff_zero_eq_zero`.
Step 5, the descent theorem itself and the classification corollary remain.

#### 10.8 Acceptance examples

- `ℙ¹` with `t^n`, defined over `ℚ`.
- A genus-one pair over `ℚ̄`: `torusTriple` realized algebraically, with its curve exhibited.
- A curve presented without a three-point map — an explicit plane quartic — carried through
  10.2, 10.3 and 10.4, with the intermediate branch sets recorded at each step.
- A pair whose field of moduli is *not* used as a field of definition without proof, with the
  pointer to Layer 11.6.

*Prerequisites:* Layers 10.4, 10.7.

### Layer 11: fields of moduli, fields of definition, and Galois orbits

#### 11.1 Galois conjugation of pairs

For `σ ∈ Gal(ℚ̄/ℚ)` and an algebraic Belyi pair `(F, ℚ̄(t) ↪ F)` over `ℚ̄`, define the
conjugate pair: the same abstract field `F` with its `ℚ̄`-algebra structure precomposed with
`σ⁻¹`, and the same distinguished `t`. This is the function-field spelling of base change
along `σ`; the marked places are preserved because `0, 1, ∞` are `ℚ`-rational.

**New object: the conjugation action.** Basic API: the action on pairs and on isomorphism
classes, with `(στ) · x = σ · (τ · x)`; functoriality in morphisms of pairs; preservation of
degree, of genus, and of the three ramification partitions (these are computed from
`e(P′ | P)`, which base change along a field automorphism preserves); and the compatibility
with composition of the underlying maps.

⚠ *Nearby false statement:* conjugation does **not** fix the isomorphism class, and does not
fix the attached triple. That it moves them is the entire subject: Layer 13.5 proves the
action is faithful.

*Prerequisites:* Layers 9.1, 9.8; Mathlib `Field.absoluteGaloisGroup`.

*Tau Ceti:* `TauCeti.AlgebraicBelyiPair.conj` with `conjAlgEquiv`, `conjRefl`, `conjTrans` and
`finrank_conj`, and on classes `TauCeti.AlgebraicBelyiPair.IsoClass.conj` with its `MulAction`
instance and `degree_smul`. Preservation of the genus and of the three ramification partitions
remains.

#### 11.2 Stabilizers and orbits

For an isomorphism class `c` of algebraic Belyi pairs over `ℚ̄`: its stabilizer in
`Gal(ℚ̄/ℚ)` is a subgroup; the orbit is finite, by 10.6, since conjugation preserves degree
and the three marked places; and the stabilizer is **open**, because 10.7 supplies a model
over a number field `k` — a presentation `k(t)[Z]/(minpoly)` with finitely many
coefficients — and `Gal(ℚ̄/k)` fixes that model, hence fixes the class.

*Prerequisites:* Layers 10.6, 10.7, 11.1; Mathlib Krull topology on
`Field.absoluteGaloisGroup`.

#### 11.3 The field of moduli

The **field of moduli** of `c` is the fixed field of its stabilizer. By 11.2 the stabilizer
is open, so the field of moduli is a number field. Prove **here**: it is invariant under
isomorphism of pairs, and `moduli(σ · c) = σ(moduli(c))`. Two further properties belong to
the milestones that supply their inputs and are not obligations of this one — containment in
every field of definition is proved in 11.5, and the equality of its degree with the orbit
size in 11.7.

⚠ *Nearby false statement:* the field of moduli is defined by a stabilizer of an
**isomorphism class**, not of a pair. The stabilizer of a pair on the nose is usually much
smaller, and taking it would give a larger field with no descent meaning.

*Prerequisites:* Layer 11.2; Mathlib infinite Galois correspondence.

*Tau Ceti:* `TauCeti.AlgebraicBelyiPair.IsoClass.fieldOfModuli` with `fieldOfModuli_smul`. That
the field of moduli is a number field remains, with 11.2.

#### 11.4 Weil descent for function fields

Galois descent in the setting this roadmap needs, built here rather than cited: for a number
field `k` and a Belyi pair over `ℚ̄`, a **descent datum** relative to `k` is a family of
isomorphisms `f_σ` from the `σ`-conjugate pair to the pair, for `σ ∈ Gal(ℚ̄/k)`, satisfying
the cocycle condition `f_{στ} = f_σ ∘ σ(f_τ)` and a **continuous finite-level datum**:
after choosing a finite coefficient model, the isomorphism coefficients are locally
constant in `σ`. This is a hypothesis on the chosen cocycle, not an automatic consequence
of the pair having a number-field model. Compactness of `Gal(ℚ̄/k)` makes its image in the
discrete coefficient data finite; continuity at the identity supplies an open subgroup
on which the datum is the identity. Choose a normal open subgroup contained there and
fixing all model and isomorphism coefficients; its finite fixed field is the descent
level. Prove this reduction rather than assuming every abstract cocycle continuous.

Prove effectiveness: a descent datum produces a model over `k` together with a base-change
isomorphism.

⚠ **`F` is not a finite-dimensional `k`-vector space**, so "descend `F` as a `k`-vector
space" is not a descent step at all: `F` has transcendence degree `1` over `k`, and finite
Galois descent applies only to finite-dimensional data. The route is to descend at a
**finite Galois level, relative to the rational function field**:

1. **Reduce to a finite level.** The datum factors through `Gal(L/k)` for a finite Galois
   `L/k` inside `ℚ̄`, and 10.7's model is already defined over a number field, so there is a
   finite Galois `L/k` and a regular model `F_L` over `L`, with
   `F≃ℚ̄(t)⊗_{L(t)}F_L` and `F_L` a **finite-dimensional `L(t)`-algebra** of dimension
   `n`. It is a field. Exact constants and geometric integrality identify this with
   `ℚ̄⊗_L F_L` as well: here the constant extension is algebraic, so the tensor domain
   is algebraic over a field and is itself a field. No analogous raw-tensor assertion is
   made for the transcendental constant extension `L⊂ℂ`.
2. **The semilinear object.** The datum makes `Gal(L/k)` act on `F_L` semilinearly over the
   semilinear action on `L(t)` that fixes `t`. State the descent target for exactly that
   object: a finite-dimensional `L(t)`-vector space with a compatible ring structure, a
   distinguished copy of `L(t)`, and a semilinear `Gal(L/k)`-action.
3. **The invariants.** By Galois descent for vector spaces applied over the extension
   `k(t) ⊆ L(t)`, which **is** finite Galois with group `Gal(L/k)` (the two are linearly
   disjoint over `k` because `t` is transcendental), the invariant subring `F_L^{Gal(L/k)}`
   satisfies `L(t) ⊗_{k(t)} F_L^{Gal(L/k)} ≅ F_L`.
4. **The properties that must be checked, each its own target.** The invariant algebra is a
   **field**; base change recovers `F_L`, hence `F`; the distinguished `t` descends, because
   it is fixed by construction; the exact constants of the descended field are `k` and not
   a larger field; and separability, degree, and the three-place unramifiedness descend.
    Fixed elements of field automorphisms form a field directly: the inverse of a fixed
    nonzero element is fixed. For exact constants, an element of the invariant field
    algebraic over `k` is algebraic over `L`, hence belongs to `L` because `F_L` has exact
    constants `L`; invariance then puts it in `L^{Gal(L/k)}=k`. Degree, separability and
    ramification still require the displayed base-change and valuation comparisons.

A cocycle can fail the continuity input even for the pair `z↦z²` over `ℚ`: its automorphism
group is the constant `C₂`, so twisting the canonical datum by a discontinuous abstract
character `Gal(ℚ̄/ℚ)→C₂` gives a cocycle with no finite-level continuity. Such characters
exist on the multiquadratic quotient `∏_ℕ C₂`, by a nonzero linear functional vanishing on
the direct sum. Retain the effectiveness theorem for the stated continuous datum;
uniqueness of rigidified isomorphisms may establish continuity in a separate application,
but arbitrary families are not covered by that uniqueness argument.

⚠ *Nearby false statement:* an arbitrary family of isomorphisms is not a descent datum. The
cocycle condition is what makes the descended object exist, and Layer 11.6 is precisely about
when the natural family fails to satisfy it.

*Source:* Weil, "The field of definition of a variety" (1956) — Köck cites it as his
Theorem 1 and states a slight weakening as his **(1.9) Theorem**, whose proof reduces to his
**(1.10) Lemma**, Galois descent for a vector space with a semilinear action of a *finite*
subgroup of `Aut(L)`; Couveignes restates Weil's criterion as **Théorème 3 ("Critère de
Weil")**, p. 22, which is the accessible form the implementation should follow. ⚠ Köck
applies (1.9) to the **function field** of the variety, that is at step 2 above, not to the
variety's coordinate ring and not to `F` over `k`.

*Prerequisites:* Layers 9.1, 10.7, 11.1; AlgebraicCurves Layer 8; Mathlib Galois descent for
vector spaces, linear disjointness, infinite Galois theory.

*Tau Ceti:* the generic finite-level semilinear descent `TauCeti.GaloisDescent.span_fixedField_eq_top`,
`TauCeti.GaloisDescent.fixedFieldBaseChangeEquiv`, and its function-field form
`TauCeti.GaloisDescent.constantCompositum_fixedField_eq_top`. The descent datum for Belyi pairs,
the reduction to a finite level and the descent of `t`, separability and unramifiedness remain.

#### 11.5 Fields of definition

A **field-of-definition certificate** for `c` over a number field `k` is: an algebraic Belyi
pair over `k` (Layer 9.1 at `k`), together with an isomorphism from its base change to `ℚ̄`
onto a representative of `c`. Prove: the cyclic and Chebyshev examples of Layer 0.8 are
defined over `ℚ`; every field of definition contains the field of moduli (a `σ` fixing `k`
fixes the model, hence fixes the class); and definability over `k` is detected at finite
level, so the certificate is finite data.

⚠ *Nearby false statement:* a field of definition is not determined by the class — there can
be several, incomparable ones — and "the" field of definition is never written in this
roadmap.

⚠ **Signature requirement:** no theorem concluding that the field of moduli
is a field of definition may omit its effective descent input. It must expose either an actual
descent datum with its cocycle condition, or the explicit automorphism hypothesis used in 11.6
to construct that datum. Mere invariance of the isomorphism class is not a descent hypothesis.

*Prerequisites:* Layers 9.1, 11.3.

#### 11.6 Rigidity, and the gap between moduli and definition

The positive theorem, proved: **if the automorphism group of the pair is trivial, the field
of moduli is a field of definition.** With trivial automorphisms, the isomorphism `f_σ` from
the `σ`-conjugate is unique, so the family is automatically a cocycle and 11.4 applies.

⚠ **The descended object need not live on `ℙ¹`, even in genus zero.** Couveignes' positive
result (*Calcul et rationalité de fonctions de Belyi en genre 0*, Ann. Inst. Fourier 44
(1994), **Théorème 8**) descends a genus-zero Belyi map with automorphism group cyclic of
odd order — trivial included — to a model over the field of moduli, but the model is a map
from a **conic**, which need not have a rational point and so need not be `ℙ¹` over that
field. Layer 9.1's carrier is a function field precisely so that this case is expressible;
a milestone phrased as "a rational function over the field of moduli" would be false.

The negative statement, cited and not formalized: with nontrivial automorphisms the cocycle
condition can fail, and there are Belyi pairs whose field of moduli is not a field of
definition. For cyclic automorphism group of even order Couveignes gives the obstruction
explicitly, as a Hilbert symbol (his §8.3). The roadmap states this as a precise structural
warning with that citation and constructs no counterexample. **No milestone anywhere in this
roadmap assumes the two fields agree**, and Layer 14.2 keeps the LMFDB's stored `base_field`
distinct from the field of moduli for exactly this reason.

*Prerequisites:* Layers 11.4, 11.5.

#### 11.7 Orbit sizes and embeddings

**The true orbit size.** Define `trueOrbitSize c := Nat.card (Gal(ℚ̄/ℚ) · c)`, the
cardinality of the Galois orbit of an isomorphism class. The orbit is in bijection with
`Gal(ℚ̄/ℚ)` modulo the stabilizer, so

```text
trueOrbitSize c = [fieldOfModuli c : ℚ] .
```

**Embeddings, and the map they give.** Fix a field-of-definition certificate for `c` over a
number field `k` (11.5) and an embedding `k ↪ ℚ̄`. Write

```text
G := Gal(ℚ̄/ℚ) ,   H := Gal(ℚ̄/k) ,   S := stabilizer of c in G .
```

Then `H ≤ S`, because `Gal(ℚ̄/k)` fixes the model (11.2). Embeddings `k ↪ ℚ̄` are modelled by
the coset space `G/H`, true orbit classes by `G/S`, and the milestone is the **surjection**

```text
G/H  ↠  G/S ,     gH ↦ gS ,
```

together with: each embedding produces a conjugate pair and hence, through Layer 9.8 and
8.6, an isomorphism class of triples; the class attached to `gH` depends only on `gS`; the
map is surjective, so every element of the true orbit is reached; and its fibers have
cardinality `[S : H]`.

⚠ **The map need not be injective**, and the degree `[k : ℚ] = [G : H]` therefore need not
equal `trueOrbitSize c = [G : S]`. Two embeddings can produce simultaneously conjugate
triples, hence the *same* Belyi-pair isomorphism class. Witness: the pair of `z ↦ z²`, defined
over `ℚ`, presented over `k = ℚ(√2)`: its two embeddings give the same class, so `[G : H] = 2`
while `trueOrbitSize c = [G : S] = 1`.

⚠ **Do not characterize the fibers by `Aut(k/ℚ)`.** For a nonnormal `k`, `Aut(k/ℚ)` is
controlled by `N_G(H)/H` and is strictly smaller than what the fibers of `G/H ↠ G/S`
require; the statement "two embeddings give the same class exactly when they differ by an
automorphism of `k` stabilizing the class" is false in that generality and is not asserted.
The correct statement is the coset-space one above.

⚠ *Nearby false statement:* the true orbit size is the degree of the field of **moduli**,
not of a stored base field. They coincide when the base field *is* the field of moduli and
not otherwise, and 11.6 is why that is not automatic. Layer 14 keeps the stored count
separate from `trueOrbitSize` for exactly this reason.

*Prerequisites:* Layers 8.6, 9.8, 11.2, 11.3, 11.5, 11.6.

*Tau Ceti:* `TauCeti.AlgebraicBelyiPair.IsoClass.trueOrbitSize` with `trueOrbitSize_eq_index`, and
`TauCeti.AlgebraicBelyiPair.IsoClass.finrank_fieldOfModuli_eq_trueOrbitSize` for a Galois `k` and
a closed stabilizer. The surjection `G/H ↠ G/S` and its fibers remain.

### Layer 12: profinite powers, the fundamental group, and the branch-cycle theorem

Milestones 12.1–12.3 and 12.7 are generic profinite algebra owned by `ProfiniteArithmetic`;
they are recorded here as the supplier contract the Belyi-specific milestones 12.4–12.12 consume.

The three milestones of generic profinite algebra — the profinite integers as a **ring**, the
exponentiation calculus, and its pro-`ℓ` specialization — are owned by **`ProfiniteArithmetic`**,
the generic successor of ProfiniteProPGroups; they extend Tau Ceti's profinite group
`TauCeti.zHat`, and they are owned neither by ProfiniteProPGroups itself nor by this roadmap.
Tau Ceti implements them, so the Belyi-specific milestones from 12.4 on consume them by name.

The fundamental group's carrier is field-theoretic: the Galois theory of the maximal
extension of `ℚ̄(t)` unramified outside the three marked places. Every object is then Mathlib Galois theory plus
AlgebraicCurves ramification, and no étale fundamental group of a scheme is used or built —
the comparison with a scheme-theoretic `π₁` is an explicit scope exclusion. The pin's
Galois-category machinery is available for classification statements and is cited where it
shortens one, but it is not the definition.

#### 12.1 The profinite integers as a topological ring

⚠ **Supplier milestone, not a Belyi declaration.** Tau Ceti's `TauCeti.zHat` is the profinite
completion of the infinite cyclic **group**, with its generator, universal property and maximal
pro-`p` quotients. That gives no multiplication of two profinite exponents, no unit group, and no
compatible projections to finite rings — yet 12.2's law `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a·b)`, 12.10's
character `χ : Gal(ℚ̄/ℚ) →* ẑˣ` and 12.3's `ℓ`-adic component all need exactly those.
`ProfiniteArithmetic` (its Layer 0) builds them as the ring structure on `TauCeti.zHat` itself;
this roadmap only consumes its exact exported API.

**Supplier object: the ring `ẑ = Additive TauCeti.zHat`.** There is one profinite-integers
object. This roadmap cites the names and API, not the construction. Required:

- *Carrier and instances.* A topological commutative ring structure on `Additive TauCeti.zHat`:
  `CommRing`, `IsTopologicalRing`, with the compactness, total disconnectedness and Hausdorffness
  of `TauCeti.zHat`. The group `TauCeti.zHat` and the ring `ẑ` are one object with two structures,
  so no milestone switches between carriers and no comparison isomorphism is needed.
- *Projections.* Continuous ring homomorphisms `ẑ →+* ZMod n` for every **positive** modulus
  `n : ℕ+`, with the compatibility `ZMod m → ZMod n` for `n ∣ m`; the induced map to the inverse
  limit over `ℕ+` is an isomorphism (the universal/limit property). ⚠ The modulus `0` is
  excluded: `ZMod 0 = ℤ`, and a continuous map from the compact `ẑ` to the discrete `ℤ` has
  finite image, while a unital ring homomorphism contains every integer in its image, so no
  such projection exists.
- *`ℓ`-adic components.* A continuous ring homomorphism `ẑ →+* ℤ_[ℓ]` for each prime `ℓ`,
  compatible with the `ZMod ℓ^k` projections and with Tau Ceti's
  `TauCeti.zHat.maximalProPQuotientEquivPadicInt`, and the theorem that the induced map to
  `∏_ℓ ℤ_[ℓ]` is a topological ring isomorphism.
- *Units.* The unit group `ẑˣ` with its topology, and the criterion
  `a ∈ ẑˣ ↔ ∀ n : ℕ+, image of a in ZMod n is a unit ↔ ∀ ℓ, component_ℓ a ∈ ℤ_[ℓ]ˣ`.
- *The universal property for characters.* A system of homomorphisms into `(ZMod n)ˣ`, one for
  each `n : ℕ+`, compatible along divisibility, assembles into one homomorphism into `ẑˣ`; this
  is what 12.10 uses to build the cyclotomic character out of the pin's finite levels.
- *Edge cases.* `ẑ` is not a domain (it is `∏_ℓ ℤ_[ℓ]`); `ℤ → ẑ` is injective with dense image.

*Prerequisites:* Tau Ceti `TauCeti.zHat` with its group API; Mathlib `ZMod`, `PadicInt`;
`ProfiniteArithmetic` Layer 0.

*Tau Ceti:* the ring structure on `Additive TauCeti.zHat`; the projections `TauCeti.zHat.toZMod`
indexed by `n : ℕ+`, with `TauCeti.zHat.castHom_comp_toZMod` and the limit property
`TauCeti.zHat.existsUnique_forall_toZMod_eq`; the components `TauCeti.zHat.component` and
`TauCeti.zHat.ringEquivPiPadicInt`; the unit criteria `TauCeti.zHat.isUnit_iff_toZMod` and
`TauCeti.zHat.isUnit_iff_component`, `TauCeti.zHat.unitsEquivPiPadicInt`, and the assembly of
characters `TauCeti.zHat.unitsLift` over `ℕ+`.

#### 12.2 The profinite exponentiation calculus

Owned with 12.1 by `ProfiniteArithmetic` and exported from the generic profinite
namespace. Neither this supplier milestone nor the next mentions Belyi maps.

Carrier: `ẑ` of 12.1. For a profinite group `G` and `x : G`, `x ^ᶻ a` for `a : ẑ` is
`TauCeti.zHat.lift x` applied to `a`: the unique continuous homomorphism from `TauCeti.zHat` to
`G` sending the generator to `x`, which is the completion's universal property applied to
`n ↦ xⁿ` and lands in the closed procyclic subgroup generated by `x`. `ProfiniteArithmetic`
(its Layer 1.1) generalizes Tau Ceti's lift, with the universal property of profinite completion
behind it, to profinite groups in every universe; there is no second lift and no second powering
construction.

**New object: `^ᶻ`.** Basic API:

- *Constructors and instances.* The definition; the closed procyclic subgroup `⟨x⟩‾` and the
  fact that `x ^ᶻ a` lies in it.
- *Examples.* `x ^ᶻ (n : ℤ) = x ^ n`; `x ^ᶻ 0 = 1`; `1 ^ᶻ a = 1`; in `TauCeti.zHat` itself,
  `^ᶻ` is multiplication.
- *Morphisms and functoriality.* **Naturality**: `f (x ^ᶻ a) = (f x) ^ᶻ a` for every
  continuous homomorphism `f`. This is the workhorse of the whole layer — it gives the
  conjugation instance `(c⁻¹ x c) ^ᶻ a = c⁻¹ (x ^ᶻ a) c` used in 12.11 and 13.3, and the
  quotient instance used in 12.3.
- *Comparison lemmas.* `x ^ᶻ (a + b) = x ^ᶻ a * x ^ᶻ b`, and
  `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b)` — **the product here is 12.1's ring multiplication**, and
  the law is what forces the ring milestone to precede this one; and continuity in `a` and
  jointly in `(x, a)`.
- *Edge cases.* `x` of finite order, where `^ᶻ` factors through the ring surjection
  `ẑ ↠ ZMod (orderOf x)` of 12.1; `x = 1`.
- *Downstream interfaces.* Layers 12.10, 12.11, 12.3, 13.3.

⚠ *Nearby false statement:* `x ^ᶻ a` is not "`x` to the power of an integer representative
of `a`". No such representative exists, and the operation is defined by the universal
property, never by a choice. Nor is `(xy) ^ᶻ a = x ^ᶻ a · y ^ᶻ a` — that needs `x` and `y`
to commute.

*Prerequisites:* Layer 12.1; Tau Ceti `TauCeti.zHat.lift` and
`TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`, as `ProfiniteArithmetic` Layer 1.1
generalizes them.

*Tau Ceti:* `TauCeti.zpowHat` with `zpowHat_add`, `zpowHat_mul`, `map_zpowHat`, `conj_zpowHat`,
`zpowHat_intCast` and `continuous_zpowHat_prod`.

#### 12.3 Pro-`ℓ` powers and the component comparison

On a pro-`ℓ` group the power depends only on the `ℓ`-adic component of the exponent. The
`ℤ_ℓ`-power `x ^[ℓ] u` for `u : ℤ_[ℓ]` on a pro-`ℓ` group is Tau Ceti's
`TauCeti.IsProP.padicPow`, with the same laws as 12.2, and `ProfiniteArithmetic` (its Layer 1.3)
proves the comparison

```text
x ^ᶻ a = x ^[ℓ] (component_ℓ a)
```

by factoring the powering homomorphism `TauCeti.zHat → G` through the maximal pro-`ℓ` quotient
of `TauCeti.zHat` — legitimate by `TauCeti.maximalProPQuotient.lift`, since `G` is pro-`ℓ` — and
identifying that quotient with `ℤ_[ℓ]` by `TauCeti.zHat.maximalProPQuotientEquivPadicInt`,
compatibly with 12.1's component map, so that `component_ℓ` here is the ring homomorphism of
12.1 and not a second unrelated projection.

⚠ Every statement in this milestone and every consumer of `^[ℓ]` below carries
`[Fact ℓ.Prime]`; `ℤ_[ℓ]` and the maximal pro-`ℓ` quotient are not the intended objects
otherwise.

⚠ *Nearby false statement:* the factorization uses that the *target* is pro-`ℓ`. On a
general profinite group the `ℓ`-adic component of `a` does not determine `x ^ᶻ a`, and no
milestone applies `^[ℓ]` outside a pro-`ℓ` group.

*Prerequisites:* Layers 12.1, 12.2; Tau Ceti `TauCeti.IsProP.padicPow`,
`TauCeti.maximalProPQuotient.lift`, `TauCeti.zHat.maximalProPQuotientEquivPadicInt`;
`ProfiniteArithmetic` Layer 1.3; Mathlib `Fact`, `PadicInt`.

*Tau Ceti:* `TauCeti.zpowHat_eq_padicPow_component`.

#### 12.4 The `ℚ̄`/`ℂ` comparison of finite covers

Apply 9.1C to the fixed embedding `ℚ̄↪ℂ`: it gives full faithfulness for finite
covers over the distinguished `t`, field-valued constant extension, naturality, degree,
ramification and automorphism comparisons. Its algebraically closed characteristic-zero
constant hypothesis is essential to that statement; arbitrary number-field or all-curve
morphisms are not covered by it.

Essential surjectivity for three-point covers is 10.7's number-field model with its regular
constant extension and ramification comparison. Thus algebraic Belyi pairs over `ℚ̄` and
over `ℂ` are equivalent. Combining with 9.5–9.8 and 6.3's **level 2** gives connected triple
isomorphism classes, not literal numbered triples. Extend to all finite covers by the
natural connected-component decomposition, including the empty cover; 12.6 consumes this
whole-category equivalence and its natural comparison of fibre functors.

*Source:* Szamuely, *Galois Groups and Fundamental Groups*, Theorem 4.6.10 and
Corollary 4.6.11 for finite étale covers over an extension of algebraically closed
characteristic-zero constants. 9.1C supplies the full-faithfulness and ramification
proof route; 10.7 supplies the required essential surjectivity in the Belyi-pair formulation.

*Prerequisites:* Layers 6.3, 9.1C, 9.5–9.8, 10.7; AlgebraicCurves Layer 8 item 2 and Layer 12
items 12B.0a, 12B.0b and 12B.0d, as in 9.1C.

#### 12.5 The geometric fundamental group

Fix an algebraic closure of `ℚ̄(t)` and let `Ω` be the compositum of all finite
subextensions unramified outside the three marked places. Prove `Ω/ℚ̄(t)` is Galois — a
conjugate of an unramified-outside-`S` extension is again one, because the marked places
are preserved — and define

```text
π₁ᵍᵉᵒ := Gal(Ω / ℚ̄(t))
```

with the Krull topology, a profinite group.

**New object: `π₁ᵍᵉᵒ`.** Basic API:

- *Constructors and instances.* The profinite group structure; the identification of its
  open normal subgroups with the finite Galois subextensions unramified outside the marked
  places.
- *Examples.* The Kummer subextensions `ℚ̄(t^{1/n})` (unramified outside `0, ∞`) and their
  analogues at `1`; these are the worked instances 12.9 and 12.11 run on.
- *Morphisms and functoriality.* Finite continuous quotients correspond to finite Belyi
  covers, via the Galois closure of the pair's function field, with the correspondence
  matching monodromy groups; through 12.4 and 6.3 this matches, at every finite level, the
  finite quotients of `FreeGroup (Fin 2)`.
- *Comparison lemmas.* Compatibility of the correspondence with composition of covers and
  with the branch-point action of Layer 2.6.
- *Edge cases.* The trivial cover; a cover unramified over some of the three places.
- *Downstream interfaces.* Layers 12.6, 12.8, 12.9, 13.1.

*Source:* the finite-level statement this layer takes to the limit is
Girondo–González-Diez **Theorem 2.71**, `Mon(x) ≅ Gal(M(S_F)/ℂ(x̃))` — the monodromy group of
a covering of `ℙ¹` is the Galois group of the corresponding function-field extension — with
**Corollary 2.70** giving the injection and **Corollary 2.72** characterizing the
normalization as the Galois closure. That is the bridge that lets this layer define `π₁ᵍᵉᵒ`
field-theoretically and still have it classify covers.

*Prerequisites:* Layers 6.3, 12.4; AlgebraicCurves Layer 6; Mathlib infinite Galois theory,
Krull topology, `IsGalois`.

#### 12.6 The comparison isomorphism

The continuous isomorphism

```text
π₁ᵍᵉᵒ  ≃ₜ*  profiniteCompletion (FreeGroup (Fin 2)) ,
```

**un-oriented**: this milestone constructs one specific isomorphism, determined by the fixed
embedding `ℚ̄ ↪ ℂ` and the basepoint `b` of 5.1, and says nothing about where the peripheral
inertia classes go. That statement is 12.9, which consumes the inertia milestone and
therefore cannot be part of this one.

⚠ **A family of finite-level bijections does not assemble into a group isomorphism.** There
is no map to build from bijections of *sets of isomorphism classes* of covers, and even a
compatible system of group isomorphisms of automorphism groups would need naturality with
respect to the quotient maps before the limit is a homomorphism. The construction therefore
goes through fiber functors, and every bridge is a separate target:

1. **The topological Galois category.** Use the full subcategory of the existing
   `TauCeti.CoveringSpace (TopCat.of U)` whose fiber over `b` is finite, with all maps of
   covers over `U`. It includes the empty cover and finite disjoint unions; it is not
   Layer 6.1's connected-only `ConnectedCover` carrier. Its fiber functor is
   `Fib_b(E)=p⁻¹{b}` to finite sets. Construct finite products, coproducts, images and
   connected-component decomposition in this category and prove the pin's
   `PreGaloisCategory` and `FiberFunctor` axioms. The existing arbitrary-action
   `UniversalCover.ActionCover` realizes empty as well as disconnected finite actions.
   Compare each nonempty connected component with Layer 6.1's numbered/pointed/bare
   classifications, and prove this comparison natural in every cover map. Thus the
   connected results are retained and extended to the whole object category.
2. **The algebraic Galois category.** ⚠ **Not** the finite subextensions of `Ω/ℚ̄(t)`. Those
   are the *connected* objects only: a Galois category must have finite coproducts, and the
   coproduct of two covers is their disjoint union, which on the algebra side is a **product
   of algebras** and is never a field. The carrier is

   ```text
   FÉt(ℚ̄(t); Ω)ᵒᵖ ,
   ```

   the opposite of the category of finite étale `ℚ̄(t)`-algebras split by `Ω` — equivalently,
   finite products `F_1 × ⋯ × F_r` of finite subextensions of `Ω/ℚ̄(t)`, with `ℚ̄(t)`-algebra
   maps reversed. The opposite is what makes the fiber functor covariant and the coproduct
   the algebra product; taking the category the right way round is part of the milestone, not
   a notational choice. The fiber functor is the geometric one determined by the fixed
   embedding `ℚ̄ ↪ ℂ` and the point `b`. Prove the same axioms, and prove that the connected
   objects are exactly the `r = 1` case, i.e. the subextensions of 12.5.
3. **An equivalence compatible with the fiber functors.** A natural equivalence of the two
   categories together with a natural isomorphism of the two fiber functors, assembled from
   12.4 and 9.5–9.8. ⚠ It must be stated for **all** finite covers and all finite étale
   algebras, not only the connected ones: a Galois category is determined by its whole
   object class, and an equivalence defined only on connected objects does not induce one on
   automorphism groups of fiber functors. The connected case is 12.5's field statement; the
   general case follows from it because both sides decompose uniquely into connected
   components, and that decomposition compatibility is itself a target. It is the
   compatibility with the fiber functors, not the equivalence alone, that makes the next step
   available.
4. **Automorphism groups of fiber functors.** The induced continuous isomorphism
   `Aut(Fib_alg) ≃ₜ* Aut(Fib_top)`, through Mathlib's Galois-category API
   (`PreGaloisCategory`, `FiberFunctor`, the profinite topology on `Aut F`,
   `IsFundamentalGroup.toAutMulEquiv` with `toAutMulEquiv_isHomeomorph` — the latter is
   what upgrades the `MulEquiv` to the `≃ₜ*` this milestone claims).
5. **Identification of both sides.** `Aut(Fib_alg) ≃ₜ* π₁ᵍᵉᵒ` — the fiber functor of
   `FÉt(ℚ̄(t); Ω)ᵒᵖ` has automorphism group the Galois group `Gal(Ω/ℚ̄(t))` — and
   `Aut(Fib_top) ≃ₜ* profiniteCompletion (FreeGroup (Fin 2))`, through Layer 5.6's free
   generation and the completion's universal property. Composing 4 and 5 gives the displayed
   isomorphism.

This is the profinite Riemann existence theorem, and it is the single place where the
analytic work of Layers 5–9 enters the arithmetic: step 3 rests on 12.4, which rests on
10.7, which rests on the analytic classification.

*Source:* Szamuely **Example 4.6.12(3)** states exactly this: for `k` algebraically closed
of characteristic `0`, `π₁(ℙ¹_k ∖ {0,1,∞})` is the free profinite group on two generators —
and draws the consequence this roadmap's Layer 3 makes finite, that every two-generated
finite group is the Galois group of a cover étale outside the three points. **Example
4.6.12(2)** is the Kummer case `π₁(ℙ¹_k ∖ {0,∞}) ≅ ẑ`, realized by normalizing in `xⁿ = t`,
which is the tower Layers 12.9 and 12.11 compute with.

*Prerequisites:* Layers 5.6, 6.1, 6.3, 12.4, 12.5; Tau Ceti `TauCeti.freeProfiniteGroup`; Mathlib
`PreGaloisCategory`, `FiberFunctor`, `functorToContAction`, `IsFundamentalGroup` with
`toAutMulEquiv`, the profinite topology on `Aut F`, `ProfiniteGrp.profiniteCompletion` with
its adjunction.

#### 12.7 Continuous outer automorphisms

Another generic `ProfiniteArithmetic` supplier milestone, placed in the generic profinite
namespace so that it is reusable. Layer 12.8 consumes it for the outer action, and this roadmap
defines no namesake carrier.

**Supplier object: `ContinuousOut`.** For a profinite group `G`: the group of continuous
automorphisms — `ContinuousMulEquiv G G` under composition — the inner homomorphism
`G →* ContinuousAut G`, normality of its range, and the quotient `ContinuousOut G`. Basic
API:

- *Constructors and instances.* The group structures; the quotient map; the topology on
  `ContinuousAut G` (copying the pattern the pin uses for `Aut F` in
  `CategoryTheory/Galois/Topology.lean`), with the caveat that no continuity of the
  *outer action* is claimed anywhere in this roadmap.
- *Examples.* An abelian `G`, where inner automorphisms are trivial and
  `ContinuousOut G = ContinuousAut G`; `G` with trivial centre, where `G` injects.
- *Morphisms and functoriality.* A topologically characteristic closed normal subgroup `N`
  — one preserved by every continuous automorphism — induces
  `ContinuousOut G → ContinuousOut (G ⧸ N)`. This is what makes Layer 13.1's descent to the
  pro-`ℓ` quotient legitimate, and it is stated here rather than there.
- *Comparison lemmas.* The action of `ContinuousOut G` on the set of conjugacy classes of
  `G`, and on closed subgroups up to conjugacy — the two actions every statement in 12.11
  and 13.3 is phrased against, since neither is defined on elements.
- *Edge cases.* An automorphism that is inner as an abstract automorphism but not by a
  continuous inner map — impossible for profinite `G`, and worth the lemma.
- *Downstream interfaces.* Layers 12.8, 12.11, 13.1, 13.3.

**The outer action of an extension.** For a topological group `E` with closed normal `N`,
conjugation gives `E ⧸ N → ContinuousOut N`, well-defined because conjugation by an element
of `N` is inner. Stated generically here; applied in 12.8.

*Prerequisites:* Mathlib `ContinuousMulEquiv`, `MulAut`, `QuotientGroup`; the pattern of
`CategoryTheory/Galois/Topology.lean`.

*Tau Ceti:* `TauCeti.ContinuousAut` and `TauCeti.ContinuousOut` with
`TauCeti.ContinuousAut.congruenceTopology`, `TauCeti.ContinuousOut.mapClosedQuotient` for a
topologically characteristic closed normal subgroup (`TauCeti.IsTopCharacteristic`),
`TauCeti.ContinuousAut.eq_conj_of_toMulAut_eq_conj`, and the outer action of an extension
`TauCeti.outerAction`.

#### 12.8 The arithmetic extension and the outer action

`Ω/ℚ(t)` is Galois, and restriction gives the exact sequence

```text
1 → π₁ᵍᵉᵒ → Gal(Ω / ℚ(t)) → Gal(ℚ̄ / ℚ) → 1 ,
```

first identify `Gal(ℚ̄(t)/ℚ(t)) ≅ Gal(ℚ̄/ℚ)` by extending coefficient automorphisms
and fixing `t`: `ℚ̄` and `ℚ(t)` are linearly disjoint over `ℚ`, since `t` is
transcendental. Prove that every coefficient automorphism extends to an algebraic closure
and preserves `Ω`: it permutes the finite extensions unramified outside the rational
marked places. Restriction to this normal extension is therefore surjective. Applying 12.7's
extension construction and transporting along 12.6 gives the outer action

```text
ρ : Gal(ℚ̄/ℚ) →* ContinuousOut (profiniteCompletion (FreeGroup (Fin 2))) .
```

⚠ **A section does exist here, and the roadmap still works outer.** Szamuely's
**Corollary 4.7.3**: when `U` has a `k`-rational point the sequence splits and `π₁(U)` is a
semidirect product — and `ℙ¹_ℚ ∖ {0,1,∞}` has plenty of rational points, `t = 2` among them.
So the obstruction to a genuine action is not existence but **canonicity**: each rational
basepoint gives its own splitting, and none is preferred. Every statement below is phrased on
conjugacy classes or in outer form for that reason, not because a lift is unavailable.
Choosing one, and tracking what it does, is the tangential-basepoint theory this roadmap
excludes. Nor is `ρ` asserted continuous — nothing here needs it.

*Prerequisites:* Layers 12.5, 12.6, 12.7; Mathlib infinite Galois theory, linear
disjointness.

#### 12.9 Peripheral inertia, and the orientation of the comparison

**Three separate things, in increasing order of how much choice they need.** Conflating them
is how a roadmap ends up asserting a canonical generator that does not exist.

1. **The inertia subgroup**, canonical **only up to conjugacy.** For each marked place, the
   inertia subgroups of `π₁ᵍᵉᵒ` at the places of `Ω` above it, as the compatible system of
   finite-level inertia subgroups. The structural input, proved at finite level first:
   **in characteristic zero the inertia group of a place in a finite Galois extension of
   function fields over `ℚ̄` is cyclic of order `e`**, because wild inertia is a `p`-group
   for `p` the residue characteristic and here `p = 0`. The subgroups over one place are all
   conjugate, by transitivity of the Galois action on the places above a place, and no one
   of them is preferred; the well-defined object is the **conjugacy class of closed
   subgroups**, and Layer 12.7's action of `ContinuousOut` on that set is what later
   statements are phrased against.
2. **The tame character**, canonical **given the roots of unity.** For a uniformizer `π`,

   ```text
   γ ↦ γ(π)/π mod 𝔪 ∈ μ_e(ℚ̄)
   ```

   is an injective homomorphism independent of the choice of `π`. Assembling over the tower,
   each inertia subgroup of `π₁ᵍᵉᵒ` over a marked place is procyclic with a canonical
   isomorphism to `lim μ_n(ℚ̄)` — the Tate twist `ẑ(1)`. ⚠ This is an isomorphism onto
   `lim μ_n(ℚ̄)`, **not** onto `ẑ`: identifying the two needs a compatible system of roots
   of unity, which is an extra choice, and the whole content of the cyclotomic character
   (12.10) is that `Gal(ℚ̄/ℚ)` moves that choice.
3. **A compatible generator**, which needs both a choice of inertia subgroup in its
   conjugacy class **and** a compatible system of roots of unity. Nothing here is canonical,
   and no milestone below uses a generator except through its conjugacy class.

**The orientation statement**, the only place 12.6's isomorphism is pinned. The Kummer tower
`t^{1/n}` at `0`, and its analogues `(t−1)^{1/n}` at `1` and `(1/t)^{1/n}` at `∞`, compute
the tame character explicitly, and under 12.6 the **conjugacy class** of the inertia
subgroup at `0`, `1`, `∞` goes to the class of the closed subgroup generated by `P`, `T`, `C`
respectively. Compatibility with Layer 7.1's `z ↦ z^e` local model and Layer 8.7's
orientation selects the positive integral peripheral loop rather than its inverse; a
procyclic group itself has generators indexed by its profinite unit group, not just two.
The fixed compatible roots of unity specify its profinite generator through the tame
character, and the milestone proves agreement with the oriented loop rather than assuming it. ⚠ **Stated on classes, not on elements**: there is no canonical element of
`π₁ᵍᵉᵒ` mapping to `P`, and a milestone that produced one would be choosing a basepoint path
that Layer 12.8 has already shown is not canonical.

*Source:* Szamuely **Lemma 4.7.2**: for a closed point `P` with residue field `k`, the
stabilizer in `π₁(U_k̄)` of a pro-point above `P` **is** its inertia group — the statement
that makes "the inertia subgroup at a marked point" well defined up to conjugacy, and the
form this milestone assembles over the tower. The three marked points are `ℚ`-rational, so
the hypothesis holds for each.

*Prerequisites:* Layers 7.1, 8.7, 12.5, 12.6, 12.7; AlgebraicCurves Layers 6, 7; Mathlib
inertia subgroups, `IsPrimitiveRoot`, roots of unity.

#### 12.10 The `ẑ`-cyclotomic character

Assemble the pin's `modularCyclotomicCharacter n`, over all `n : ℕ+`, into the continuous

```text
χ : Gal(ℚ̄/ℚ) →* ẑˣ
```

on Layer 12.2's carrier, with the finite-level specification `σ ζ = ζ ^ χ_n(σ)` for every
`n`-th root of unity and every **positive** `n : ℕ+` (the levels 12.1 assembles), and with
`ℓ`-adic components equal to the pin's
`cyclotomicCharacter ℓ`. The compatibility across levels is the milestone; the pin supplies
each level separately.

*Source:* Szamuely **Example 4.7.4** constructs exactly this character, as
`Gal(k̄|k) → Aut(ẑ) ≅ ẑ^×` obtained from the compatible system of actions on the Kummer
layers, and names it the cyclotomic character. The pin supplies the finite levels; the
compatibility across levels is the milestone.

*Prerequisites:* Layer 12.1 (the ring `ẑ`, its unit group, and the universal property that
assembles a compatible system of maps into `(ZMod n)ˣ`, `n : ℕ+`, into one map into `ẑˣ`);
Mathlib `modularCyclotomicCharacter`, `cyclotomicCharacter`.

#### 12.11 The branch-cycle theorem

For every `σ ∈ Gal(ℚ̄/ℚ)`, the outer action of 12.8 satisfies, on conjugacy classes,

```text
ρ(σ) [P] = [P ^ᶻ χ(σ)] ,   ρ(σ) [T] = [T ^ᶻ χ(σ)] ,   ρ(σ) [C] = [C ^ᶻ χ(σ)] ,
```

with `^ᶻ` the profinite power of Layer 12.2 and `χ` the character of 12.10.

**The convention is pinned by a computation inside the theorem, not by a citation.** The
finite-level statement is the Kummer identity: let `ζ` be a primitive `n`-th root of unity,
let `γ` be the geometric automorphism with `γ(t^{1/n}) = ζ · t^{1/n}`, and let `σ̃` be any
lift of `σ` to `Gal(Ω/ℚ(t))`. Then

```text
σ̃ γ σ̃⁻¹ = γ ^ χ_n(σ) ,
```

which the milestone proves by evaluating both sides at `t^{1/n}`: writing
`σ̃(t^{1/n}) = ζ^b t^{1/n}`, the left side sends `t^{1/n}` to `ζ^{χ_n(σ)}·t^{1/n}`, the `b`
cancelling. Every convention enters this one computation — the conjugation is
`x ↦ σ̃ x σ̃⁻¹`, the character is normalized by `σ(ζ) = ζ^{χ(σ)}`, and the tame character is
`γ(π)/π` — so a reader can check the exponent without consulting a source, and a milestone
that flipped one of them would fail here.

The general case follows by transporting along 12.9's identification and assembling over
`n`: a lift of `σ` normalizes the decomposition data at each marked place, because the three
places are `ℚ`-rational, and acts on the procyclic inertia through the tame character.

⚠ *Nearby false statement:* the exponent is `χ(σ)`, not `χ(σ)⁻¹`. Sources using the
geometric (right-action) convention for the Galois action on covers, or normalizing the
cyclotomic character by `σ(ζ) = ζ^{χ(σ)⁻¹}`, state the theorem with the inverse; the
displayed Kummer identity is what distinguishes them, and every citation records which
convention its source uses.

⚠ The statement is about an outer class acting on conjugacy classes. Without a chosen
representative it is not an element map on `P`. A representative may satisfy an on-the-nose
equality — the identity representative does for `σ=1` — but the general theorem supplies
conjugators, one for each peripheral element, which need not agree. No canonical lift is
asserted. Layer 13.3 constructs the actual representative/conjugator data needed there.

*Source:* Szamuely **Remark 4.7.5** is the same theorem in the same generality and with the
same proof: in the situation of his **Lemma 4.7.2**, the action of `Gal(k̄|k)` on the inertia
group `I ≅ ẑ` coming from `1 → I → D → Gal(k̄|k) → 1` **is given by the cyclotomic character
in characteristic zero**, because each degree-`n` layer inside the fixed field of `I` is
generated by an `n`-th root of a local parameter, by Kummer theory. His **Example 4.7.4**
performs the computation on `ℙ¹ ∖ {0,∞}` and fixes the direction — `σ` carries the
automorphism `ⁿ√t ↦ ω_n·ⁿ√t` to `ⁿ√t ↦ σ(ω_n)·ⁿ√t` — which with `σ(ω_n) = ω_n^{χ(σ)}` is
the **non-inverted** exponent displayed above, and is where he defines the cyclotomic
character. The Kummer identity of this milestone is that computation, and the agreement of
two independent sources on the direction is why it is stated rather than cited.

Also: Stix, "On cuspidal sections of algebraic fundamental groups", ASPM 63 (2012),
**Definition 37(i)**, in §7 ("Orientation and degree") — a commutative square whose content
for an element of the decomposition group is exactly `γ x γ⁻¹ = x ^ χ(γ)`, with the
**non-inverted** exponent, matching the Kummer computation above. ⚠ Three citation traps:
the formula is in §7 and **not** in §3.3, which only sets
up inertia and decomposition groups; "Definition 37" is numbered only in the published ASPM
version, the arXiv preprint carrying the same content as unnumbered text; and Stix's `π₁` is
the **opposite** group of the deck group, compensated by a matching inverse in his
Definition 10, so the two traps cancel and the exponent is unaffected.

The branch-cycle form is Fried, Comm. Algebra 5 (1977), **(5.2)**. ⚠ Fried states the
exponent as `−c_γ` in his normalization, and Völklein's restatement uses the opposite sign
again; the two differ from the display above by conventions, not by mathematics, which is
why the Kummer identity rather than any citation is what pins this roadmap. Classical
origin: Deligne, "Le groupe fondamental de la droite projective moins trois points",
MSRI 16 (1989).

*Prerequisites:* Layers 12.2, 12.3, 12.8, 12.9, 12.10.

#### 12.12 The finite branch-cycle corollary and passport invariance

The statement is about **conjugacy classes, one slot at a time** — a Nielsen-class
statement — and it is not about a tuple of powers.

Use different symbols for the degree and the exponent. Let `t` have degree `d`,
monodromy group `G`, and exponent `N`. In the **left** conjugation convention of 11.1,
write `t^σ=(τ0,τ1,τinf)` for the triple of the `σ`-conjugate pair and put
`v=χ_N(σ)⁻¹`. The inverse arises because the transported fibre action precomposes the
original representation by the inverse of arithmetic conjugation, as proved below.
For the corresponding right transport `t·σ:=t^{σ⁻¹}`, put instead `u=χ_N(σ)`.
State both forms explicitly; the positive Kummer conjugation formula of 12.11 is unchanged.
For the left form:

- `τ0` lies in the `S_d`-conjugacy class of `σ0 ^ v`, and likewise `τ1` of `σ1 ^ v` and
  `τinf` of `σinf ^ v`;
- `t^σ` is itself a connected triple, so `τinf · τ1 · τ0 = 1`, and its monodromy group is
  conjugate to `G`;
- after the whole-image comparison identifies both groups with the same reference group,
  the left `σ`-action carries Nielsen class datum `(C0,C1,Cinf)` to
  `(C0^v,C1^v,Cinf^v)`, modulo the normalizer action. Here `C^v` is the class of `v`-th
  powers. The right transport `·σ` has `(C0^u,C1^u,Cinf^u)` instead. Do not infer the
  embedded group identification from these three separate classes.

⚠ **There is in general no simultaneous conjugator** carrying `t^σ` to the componentwise
tuple of independently powered entries, because **that tuple is usually not a triple at all**:
independently powering three elements of a nonabelian group destroys the product relation.
For `σ0 = (0 1 2)`, `σ1 = (0 1)`, `σinf = (1 2)` in `S₃` — which satisfies
`σinf·σ1·σ0 = 1` — and `u = 5`, the componentwise fifth powers give
`(1 2)·(0 1)·(0 2 1)`, which sends `0 ↦ 1`. The class-by-class form above is what the branch-cycle
theorem gives, and it is all it gives.

⚠ Fried's (5.2) is likewise a statement about **conjugacy classes** and never about chosen
representatives, and the conjugating element it produces lies in `N_{S_n}(G)` — the same
normalizer Layer 1.3 identifies as acting on generating triples. Layer 14.2's record-level
translation is where representatives are finally chosen, by the database rather than by
mathematics.

**Monodromy image comparison precedes passport invariance.** Choose a representative
`θ_σ` of 12.8's continuous outer automorphism, given by conjugation by a lift of `σ`,
and a numbering of the conjugate fiber. If `H` is the stabilizer subgroup for the original
cover, the conjugate field has stabilizer `θ_σ(H)`: an embedding of 11.1's scalar-twisted
field is obtained by applying that lift. The left action on the transported cosets is
therefore `g↦r(θ_σ⁻¹(g))`. Prove, via 12.6's natural fibre equivalence, the exact formula
`r_conjugate = conjugation(τ) ∘ r ∘ θ_σ⁻¹`.
This pins the inverse and proves the comparison for the whole representation. Since
`θ_σ⁻¹` is surjective, `range(r∘θ_σ⁻¹)=range(r)`, so embedded monodromy groups are
conjugate by the single permutation `τ`. Applying 12.11 to `θ_σ⁻¹` gives the unit
exponent `v=χ_N(σ)⁻¹` used above. Changing representative introduces an inner
conjugation and leaves this conclusion unchanged. This is the required monodromy
producer; the common-power lemma `⟨σ0^u,σ1^u⟩=⟨σ0,σ1⟩` remains a separate finite fact.

**Passport invariance.** Use that image comparison for the embedded group and primitivity.
Use the branch-cycle class theorem for the three full cycle types, since unit powers and
conjugation preserve them; use 0.6 for genus and 0.7 for geometry. Degree and the abstract
monodromy group are consequently fixed as well. Thus each Galois orbit lies in one
passport, completing 11.2's partial statement.

Slotwise conjugacy alone does not imply the image comparison. In `S₅`, let
`a=(0,1,2,3,4)`, `b=(0,1,3,4,2)`. The triples `(a,a,a³)` and
`(a,b,(b*a)⁻¹)` have all three entries 5-cycles, so corresponding entries are conjugate
with exponent 1, but they generate `C₅` and `A₅` respectively. This is a counterexample
to that implication, not a claim that these two triples are Galois conjugate.

⚠ *Nearby false statement:* the converse fails, and its failure is the reason a passport is
not a Galois orbit — the LMFDB passport `5T1-5_5_5` is one passport of size `3` with three
Galois orbits, each of size `1` over `ℚ` (Layer 3.5's three classes). Layer 14 never treats `pass_size` and `orbit_size` as the same datum.

*Prerequisites:* Layers 0.5–0.7,1.1,1.4,11.1,12.6,12.8,12.11; the whole finite-monodromy
representation comparison above is an explicit target before the passport corollary.

### Layer 13: the pro-`ℓ` peripheral theorem and faithfulness

The two generic helpers 13.3 applies, `conjugation_transfer` and `opposite_third_peripheral`,
are exports of §Pinned conventions, not of this layer.

#### 13.1 The pro-`ℓ` peripheral triple

For a **prime** `ℓ` — every statement of Layer 13 carries `[Fact ℓ.Prime]`, since neither
`maximalProPQuotient` nor `ℤ_[ℓ]` is the intended object otherwise — define
`Δ_ℓ := TauCeti.freeProP ℓ (Fin 2)` directly, with `P_ℓ, T_ℓ, C_ℓ` the images of Tau Ceti's
canonical generators `TauCeti.freeProP.of` and the relation `C_ℓ * T_ℓ * P_ℓ = 1`. Tau Ceti
defines this carrier as the maximal pro-`ℓ` quotient of `TauCeti.freeProfiniteGroup (Fin 2)`,
the group `F̂₂` of §Pinned conventions; this roadmap neither redefines that quotient nor
introduces an isomorphic replacement.

The outer action descends: `TauCeti.proPKernel ℓ` is topologically characteristic (Tau Ceti's
`TauCeti.map_proPKernel_eq`, as `ProfiniteArithmetic`'s `isTopCharacteristic_proPKernel`), so
12.7's functoriality gives

```text
ρ_ℓ : Gal(ℚ̄/ℚ) →* ContinuousOut (Δ_ℓ) ,
```

and 12.11's statements descend with `^ᶻ` becoming `^[ℓ]` by 12.3.

*Prerequisites:* Layers 12.7, 12.11, 12.2, 12.3; Tau Ceti `TauCeti.freeProP`,
`TauCeti.freeProP.of`, `TauCeti.map_proPKernel_eq`.

*Tau Ceti:* the carrier `TauCeti.freeProP` with `TauCeti.freeProP.of`, and
`TauCeti.isTopCharacteristic_proPKernel`. The descended outer action `ρ_ℓ` remains.

#### 13.2 Cyclotomic surjectivity

`cyclotomicCharacter ℓ` is surjective onto `ℤ_[ℓ]ˣ`, and the `ẑˣ`-valued character of 12.10
is surjective. Route: at each finite level, irreducibility of the cyclotomic polynomial over
`ℚ` gives `Gal(ℚ(ζ_{ℓ^k})/ℚ) ≅ (ZMod ℓ^k)ˣ`, so `χ_{ℓ^k}` is onto; then surjectivity of the
inverse limit follows from compactness of `Gal(ℚ̄/ℚ)` and surjectivity at each level (an
inverse limit of nonempty compact fibers is nonempty).

*Hypotheses:* the base field is `ℚ`, with `ℚ̄` the fixed `AlgebraicClosure ℚ` of
§Pinned conventions. ⚠ Over a general number field the character is **not** surjective, and
Layer 13.3's "for every `u`" would fail; the milestone states the base field explicitly.

*Prerequisites:* Layer 12.10; Mathlib cyclotomic fields over `ℚ`, `IsPrimitiveRoot.autToPow`,
compactness of Galois groups.

#### 13.3 The peripheral-power theorem

For every prime `ℓ`, every `σ ∈ Gal(ℚ̄/ℚ)`, and every continuous automorphism `φ` of `Δ_ℓ`
representing the outer class `ρ_ℓ(σ)` of 13.1, put `u := cyclotomicCharacter ℓ σ ∈ ℤ_[ℓ]ˣ`. Then
there exist `c_P, c_T, c_C ∈ Δ_ℓ` with

```text
φ P_ℓ = c_P⁻¹ · (P_ℓ ^[ℓ] u) · c_P ,
φ T_ℓ = c_T⁻¹ · (T_ℓ ^[ℓ] u) · c_T ,
φ C_ℓ = c_C⁻¹ · (C_ℓ ^[ℓ] u) · c_C .
```

Consequently, by 13.2, for every `u ∈ ℤ_[ℓ]ˣ` some automorphism `φ_u` representing an outer
class in the image of `ρ_ℓ` satisfies the three equations.

Proof: the three conjugacy statements of 12.11, descended by 13.1 with `^ᶻ χ(σ)` becoming
`^[ℓ] u` by 12.3, say exactly that each `φ(X_ℓ)` is conjugate to `X_ℓ ^[ℓ] u`, and the
conjugators are the witnesses; changing the representative `φ` within its outer class changes
the three conjugators and nothing else. For a given `u`, 13.2 supplies `σ`.

The existence of such an automorphism without any Galois action is a separate group-theoretic
theorem of the PeripheralActions roadmap; nothing here uses it, and the statement here is about
the image of `Gal(ℚ̄/ℚ)`.

⚠ **The three conjugators are independent.** Nothing asserts `c_P = c_T = c_C`; a single
conjugator would say `φ` is inner-times-the-power-map on the whole group, which is false.

⚠ The assignment `u ↦ φ_u` is **not** asserted to be a homomorphism, to be continuous, or to
be canonical. Each is a strictly stronger statement and each is outside this roadmap.

**Change of convention.** The conjugation-transfer lemma of §Pinned conventions, with `pow` the
`u`-th power and its hypothesis supplied by 12.2, transfers the theorem to every conjugate of a
peripheral element. Applying it with `q = P_ℓ` and `x = C_ℓ` gives the opposite-convention third
element `(P_ℓ · T_ℓ)⁻¹ = P_ℓ · C_ℓ · P_ℓ⁻¹`, so consumers using that spelling need no new
mathematics.

*Prerequisites:* Layers 12.2, 12.3, 12.11, 13.1, 13.2; §Pinned conventions
(`conjugation_transfer`, `opposite_third_peripheral`).

#### 13.4 The dyadic instance

The specialization to `ℓ = 2`, stated as its own named theorem with `u : ℤ_[2]ˣ` on
`Δ_2 = TauCeti.freeProP 2 (Fin 2)`, in both conventions for the third element: for `C_2 = (T_2 ·
P_2)⁻¹` as in 13.3, and for `(P_2 · T_2)⁻¹ = P_2 · C_2 · P_2⁻¹` (`opposite_third_peripheral`)
with the conjugator `P_2 · c_C · (φ P_2)⁻¹` computed by `conjugation_transfer`. The proof is 13.3's
at `ℓ = 2`, and nothing in it mentions anything outside this roadmap.

*Prerequisites:* Layer 13.3; §Pinned conventions.

#### 13.5 Faithfulness of the Galois action on dessins

The action of `Gal(ℚ̄/ℚ)` on isomorphism classes of algebraic Belyi pairs over `ℚ̄` —
equivalently, by 12.4 and 9.8, on isomorphism classes of dessins — is faithful.

**The route is Lenstra's, and it stays in genus zero** — no elliptic curves, no
`j`-invariant, and no dependency on the curves roadmap. Everything below happens in
`ℚ̄[x]`. In proof order:

1. Given `σ ≠ 1`, pick `α ∈ ℚ̄` with `σ(α) ≠ α`.
2. Let `p_α ∈ ℚ(α)[x]` be the antiderivative of `x·(x−1)²·(x−α)³` **normalized by
   `p_α(0) = 0`**, which pins the integration constant and hence `p_α` itself; it has degree
   `7` and leading coefficient `1/7`. Its critical points are exactly `0`, `1`, `α`, of
   multiplicities `2`, `3`, `4` respectively — the orders of vanishing of `p_α′` there,
   plus one — and those multiplicities are **pairwise distinct**, which is the whole point
   of the choice of exponents.
3. Its critical values `p_α(0), p_α(1), p_α(α)` and `∞` lie in `ℚ̄ ∪ {∞}`, so **10.3's
   polynomial Belyification** produces `q_α ∈ ℚ[x]` making `P_α := q_α ∘ p_α` a Belyi
   **polynomial** — a Belyi map from `ℙ¹` with `P_α⁻¹(∞) = {∞}`, so its dessin is a tree.
   ⚠ The polynomial form is essential and is exactly what 10.3's separate statement
   supplies: a rational `q_α` would give `P_α` finite poles and step 5 would collapse.
4. Conjugating, `P_α^σ = q_α ∘ p_{σ(α)}`, since `q_α` has rational coefficients.
5. Suppose the two pairs were isomorphic. Any isomorphism fixes `∞` (both maps have their
   only pole there), so it is affine, `z ↦ az + b`. The polynomial lemma below turns
   `q_α(p_α(az+b)) = q_α(p_{σ(α)}(z))` into `p_α(az+b) = c·p_{σ(α)}(z) + d`. Comparing the
   critical points of multiplicity `2, 3, 4` on the two sides forces `b = 0`, `a = 1`, and
   then `σ(α) = α` — a contradiction.

**The polynomial decomposition lemma**, owned here and stated separately because step 5 is
where all the work is. Two statements, the second proved from the first:

Throughout, `k` is a field of **characteristic zero**.

1. If `H₁, H₂ ∈ k[x]` are **monic of the same degree `m ≥ 1`** with `H₁(0) = H₂(0) = 0`, and
   `G₁, G₂ ∈ k[x]` are **nonconstant** — `0 < deg G₁` and `0 < deg G₂` — with
   `G₁ ∘ H₁ = G₂ ∘ H₂`, then `H₁ = H₂`. Proof: equal degrees force `deg G₁ = deg G₂ = n` and
   equal leading coefficients, and comparing the terms of degree `nm − j` for
   `j = 1, …, m − 1` gives the coefficients of `H₁` and `H₂` equal one at a time from the top
   down.
2. If `H₁, H₂ ∈ k[x]` are **arbitrary of the same degree `m ≥ 1`** and `G₁, G₂` are
   **nonconstant** with `G₁ ∘ H₁ = G₂ ∘ H₂`, then there are constants `c ≠ 0` and `d` with
   `H₂ = c·H₁ + d`. Proof: normalize `Ĥᵢ := (Hᵢ − Hᵢ(0))/(leading coefficient)` and absorb
   the change into `Gᵢ` — an affine substitution, so it preserves nonconstancy — apply 1,
   and read off `c = β_m/α_m`, `d = β_0 − c α_0` for the leading and constant
   coefficients `α, β` of `H₁, H₂`. Substitution gives `H₂=cH₁+d` with this direction;
   `H₁=x,H₂=2x` is the normalization check.

⚠ **Nonconstancy of `G₁` and `G₂` is not decorative.** Without it the lemma is false in the
cheapest possible way: take `G₁ = G₂` a constant `c`, and `G₁ ∘ H₁ = c = G₂ ∘ H₂` holds for
*every* pair `H₁, H₂`, including normalized ones with `H₁ ≠ H₂`. The hypothesis is what makes
`deg(Gᵢ ∘ Hᵢ) = deg Gᵢ · deg Hᵢ` a usable equation at all.

⚠ **Characteristic zero is used**, not merely inherited from the ambient convention: the
coefficient recursion compares `G₁(H₂ + R)` with `G₁(H₂)` through the linear term
`G₁′(H₂)·R`, and needs `G₁′ ≠ 0`. In characteristic `p`, take
`G₁=x^p-x`, `H₁=x^p`, `G₂=x^p`, `H₂=x^p-x`: the compositions both equal
`x^{p²}-x^p`, but the monic zero-constant inner polynomials differ. The Frobenius map on a
polynomial domain is itself injective; `H₁^p=H₂^p` alone would imply `H₁=H₂`.

⚠ `m ≥ 1` in 2 is what makes the division by the leading coefficient legitimate. Step 5
applies **2**, with `H₁ = p_α(a·+b)` and `H₂ = p_{σ(α)}`, both of degree `7`, and with both
outer polynomials nonconstant because they are the Belyi maps of the two dessins.

Conclude faithfulness on dessins of genus `0`, hence on dessins.

⚠ *Nearby false statement:* faithfulness does not follow from the outer action of Layer 12
being defined, nor from it being injective on any group — it is a statement about the action
on the **set of classes**, and the construction above is what produces a moved class. A
milestone that inferred it from Layer 12 alone would be proving nothing.

⚠ The three multiplicities must be **pairwise distinct**. With `x(x−1)(x−α)` in place of
`x(x−1)²(x−α)³` the critical points all have multiplicity `2`, an affine map can permute
them, and step 5 collapses.

*Source:* Girondo–González-Diez, **Theorem 4.49** (the action on Shabat polynomials is
faithful, hence on genus-zero dessins; the proof is attributed there to Lenstra) with
**Lemma 4.50** for the polynomial lemma, and **Theorem 4.48** for the statement that the
restriction to dessins of genus `g` is faithful for every `g`. ⚠ The book proves 4.48 by
treating each genus separately, so a formalization that wants all genera does not get them
from the genus-zero case for free; this milestone claims genus zero, which suffices for
faithfulness on dessins.

*Prerequisites:* Layers 9.8, 10.2, 10.3, 11.1, 12.4; Mathlib `Polynomial.derivative`,
`Polynomial.roots`, `Polynomial.comp`.

*Tau Ceti:* `p_α` as `TauCeti.lenstraPolynomial`; the decomposition lemma as
`Polynomial.eq_of_comp_eq_comp_of_monic` (part 1) and `Polynomial.eq_C_mul_add_C_of_comp_eq_comp`
(part 2); steps 3–5 as `TauCeti.exists_criticalValues_comp_lenstraPolynomial_subset`,
`Polynomial.map_comp_lenstraPolynomial` and `TauCeti.comp_lenstraPolynomial_comp_ne_map`; and
the polynomial form of faithfulness `TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map`:
for a field `K` algebraic over `ℚ` and a ring endomorphism `σ ≠ id` of `K`, some nonconstant
`P ∈ K[x]` with all critical values in `{0, 1}` is not carried to `P^σ` by any affine change of
variable. The passage to isomorphism classes of algebraic Belyi pairs, and hence the statement
of this milestone, remains; `Suggested.lean` states it as
`faithfulSMul_absoluteGaloisGroup_isoClass`, for the action
`TauCeti.AlgebraicBelyiPair.IsoClass.instMulAction` of `AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`.

### Layer 14: LMFDB assertion semantics

This layer says what a stored record asserts, mathematically. It certifies no database value
and asserts nothing about the completeness of the database. The schema it mirrors is that of the
LMFDB's `belyi_passports` and `belyi_galmaps` collections, as displayed on the database's Belyi
pages; every record a milestone uses is named by its label, and a certificate is checked against
the record data it is given, never against an unstated copy.

#### 14.1 The passport record

A certificate structure whose fields mirror the frozen `belyi_passports` schema — `plabel`,
`deg`, `group`, `abc`, `a_s`/`b_s`/`c_s`, `g`, `geomtype`, `lambdas`, `pass_size`,
`num_orbits`, `maxdegbf`, `is_primitive`, `primitivization`, `aut_group`, `triples` —
together with a validity predicate tying each field to this roadmap's mathematics:

- `deg`, `lambdas`, `abc`, `g`, `geomtype` to the Layer 0.5–0.7 invariants of the passport
  (Layer 1.5);
- `group` to Layer 1.6's label semantics through the single PolynomialGaloisGroups family:
  for `1 ≤ deg ≤ 5` through its Layer 6, for `6 ≤ deg ≤ 11` through the gap
  `gap:transitive-groups-degree-six-to-eleven`; above degree `11` it is parsed data with no group
  certificate, rather than a false use of `Fin 0`;
- `pass_size` to Layer 3.4;
- `is_primitive` to Layer 1.4;
- `primitivization` to a carried block-system certificate (Layer 1.4), not to a derived
  value;
- `aut_group` to Layer 0.4.

⚠ **`num_orbits` and `maxdegbf` are not on that list, and must not be tied to Layer 11's
orbit mathematics.** They are **frozen-table aggregations**: `num_orbits` is the number of
map rows sharing the passport label, and `maxdegbf` is the largest *stored* `orbit_size`
among those rows. Both are facts about which rows the snapshot happens to contain, so neither
is a theorem about the passport, and a certificate that derives them from Layer 11 is
claiming something the data does not support. 14.3's five-column table classifies them this
way, and this list agrees with it.

Three facts from the frozen snapshot that the certificate must respect, each recorded as a
lemma rather than as a comment:

- ⚠ **`abc` is `(ord σ0, ord σ1, ord σinf)` in that order and is not sorted**, while
  `(a_s, b_s, c_s)` is `abc` **sorted ascending** — a search-only triple, never displayed.
  The certificate ties `abc` to Layer 0.7's `orderTriple` positionally and derives the
  sorted triple from it; it does not identify the two.
- **`abc[i]` is the lcm of `lambdas[i]`**, which is Layer 0.7's
  `orderOf σ = (fullCycleType σ).lcm`, so `abc` is redundant given `lambdas` and the
  certificate proves the relation rather than carrying both as independent data.
- ⚠ **`geomtype` is not a function of the genus.** Genus `0` occurs with `geomtype = "E"`: in
  degree `5`, `σ0 = (1 2)(3 4)` and `σ1 = (0 1 2 3)` give cycle types `[2,2,1]`, `[4,1]`,
  `[4,1]`, orders `(2,4,4)` and `χ = 3 + 2 + 2 − 5 = 2`. Genus `1` occurs with
  `geomtype = "H"`: in degree `4`, a `3`-cycle and a `4`-cycle with `4`-cycle product give cycle
  types `[3,1]`, `[4]`, `[4]`, orders `(3,4,4)` and `χ = 0`. The field is exactly Layer 0.7's
  `geometryType`, computed from `1/a + 1/b + 1/c` against `1`, and the certificate ties it
  there and nowhere near `g`.
- **`pass_size` is a count of isomorphism classes, not of stored rows** — it is exactly
  Layer 1.2's `passportSize`, so the certificate ties it to Layer 3.4 and to nothing about
  the database's own row count. `orbit_size` is per-map, `num_orbits` is passport-only, and
  `maxdegbf`, despite its name, is the **maximum orbit size** in the passport.

*Prerequisites:* Layers 0.4–0.7, 1.1–1.6, 3.4, 11.7.

*Tau Ceti:* `TauCeti.PermutationTriple.LMFDB.PassportRecord` with its validity predicate `TauCeti.PermutationTriple.LMFDB.PassportRecord.IsValidAt`,
`TauCeti.PermutationTriple.LMFDB.PassportRecord.IsValidAt.abc_eq_orderTriple`, `IsValidAt.abc_eq_lcm_lambdas`,
`IsValidAt.geomtype_eq_geometryType`, `IsValidAt.passSize_eq_passportSize` and, for the group
field, `IsValidAt.transitiveGroupLabel_of_parse_groupString`.

#### 14.2 The map-orbit record, and the translation of stored triples

A certificate for a single Galois orbit, mirroring the frozen `belyi_galmaps` schema. Its
distinctive content is three theorems, not a list of fields.

**The triple translation, proved.** The stored `triples`/`triples_cyc` satisfy
`σ0 * σ1 * σinf = 1` in Mathlib's multiplication — the LMFDB composes left to right — so the
stored data is the componentwise inverse of a triple in this roadmap's convention. The
milestone states that the Layer 0.1 involution is the translation, and that it preserves
every invariant the record asserts: degree, all three full cycle types, the monodromy group,
connectedness, the automorphism group, the genus, and the passport. The record
`3T2-3_2.1_2.1-a` is the check (§Pinned conventions); a record whose stored data is symmetric
under the swap — `σ1 = σ0` and `σinf = 1`, say — satisfies both relations and verifies nothing.

**Base field versus field of moduli.** The stored `base_field` is a field of **definition**
(Layer 11.5), and the certificate keeps it distinct from the field of moduli (Layer 11.3).
⚠ No certificate equates them; Layer 11.6 is why.

**Embeddings and orbit size — two counts, kept apart.** Introduce

```lean
def trueOrbitSize (c : IsoClass n) : ℕ := Nat.card (Gal(ℚ̄/ℚ) · c)          -- Layer 11.7
def storedEmbeddingCount (r : BelyiRecord) : ℕ := r.embeddings.length      -- a stored count
```

⚠ Both are **natural numbers**. `storedEmbeddingCount` is a count, not the proposition
`r.embeddings.length = r.triples.length`; that list-length agreement is a separate schema
fact, and stating it as the definition makes every later comparison with `r.orbit_size`
ill-typed. It is its own target:

```lean
theorem storedEmbeddingCount_eq_triplesLength (r : BelyiRecord) :
    r.embeddings.length = r.triples.length
```

With those apart, state each assertion against the right one:

- `trueOrbitSize c = [fieldOfModuli c : ℚ]` — Layer 11.7, a theorem about the class;
- the stored triples are indexed by the stored embeddings position by position: the `i`-th
  triple is the monodromy of the `i`-th complex embedding of the base field. That positional
  indexing is what `storedEmbeddingCount_eq_triplesLength` records, and the **schema
  assertion** is then `r.orbit_size = storedEmbeddingCount r`;
- the field-of-definition certificate of Layer 11.5 gives a map from stored embedding entries
  **into** the true orbit of the class, whose image is the set of classes the stored entries
  represent. It is the **surjection** of Layer 11.7's `G/H ↠ G/S` only together with a
  **coverage certificate**: a proof that the stored embeddings are exactly the complex
  embeddings of the stored base field `k`, each listed once, so that they enumerate `G/H`.
  Per-entry validity does not prove coverage: a row listing one embedding of a quadratic base
  field is valid entry by entry and misses the other;
- ⚠ **that map need not be injective, so `r.orbit_size = trueOrbitSize c` is not asserted.**
  It requires, besides coverage, a separate certificate — that `H = S`, equivalently that the
  stored base field is the field of moduli — which Layer 11.6 shows is not automatic. A class
  defined over `ℚ` but stored over `ℚ(√2)` gives two stored embeddings and one class.

The floating-point embedding values themselves are a numerical annotation and are certified
as nothing.

⚠ **The stored cycle notation omits fixed points**, and the identity is stored as `"()"`.
Recovering `lambdas` from `triples_cyc` therefore needs padding to a partition of the
degree — the database form of Layer 0.5's trap — so the certificate reads ramification data
from `lambdas`, and proves consistency with `triples_cyc` through `fullCycleType`.

Remaining fields — `curve`, `map`, `plane_model`, `plane_constant`, `curve_label`,
`friends` — are carrier-only or checkable per instance as an algebraic Belyi pair over the
stored base field (Layer 9.1). ⚠ **`curve_label` is absent, not null**, on records with no
curve friend, so the Lean field is an `Option` keyed on key-presence.

*Prerequisites:* Layers 0.1, 9.1, 11.3, 11.5, 11.7.

*Tau Ceti:* `TauCeti.PermutationTriple.LMFDB.BelyiRecord` with `TauCeti.PermutationTriple.LMFDB.BelyiRecord.storedEmbeddingCount` and validity
`TauCeti.PermutationTriple.LMFDB.BelyiRecord.IsValidFor`; the translation `TauCeti.PermutationTriple.LMFDB.StoredTriple.toTriple` with
`TauCeti.PermutationTriple.LMFDB.StoredTriple.isConnected_toTriple_iff` and `hasPassport_toTriple_iff`; and the inequality
`TauCeti.PermutationTriple.LMFDB.BelyiRecord.card_storedClasses_le_storedEmbeddingCount`. The comparison with
`trueOrbitSize` and the field of moduli, and the coverage certificate, remain.

#### 14.3 Certification levels

Classify every field of 14.1 and 14.2 into exactly one of:

- **intrinsic theorem** — provable from the pair or the triple alone;
- **finite certificate** — checkable from supplied finite data;
- **orbit certificate** — needs supplied Galois or descent data;
- **frozen-table aggregation** — a statement about a set of stored rows, true of the frozen
  table and asserting nothing intrinsic about any one record;
- **carrier only** — the roadmap says what the value means but certifies no value;
- **outside scope** — a computational or completeness claim not proved here.

The classification is a **table with five columns** — parsed carrier, mathematical meaning,
certification level, exact certificate data, and the theorem relating it to an earlier layer
— one row per field, so that no consumer overreads a record. Fields whose level is
carrier-only have no theorem column entry, and that absence is the point.

The rows that are easy to get wrong, and what they must say:

| field | level | what the certificate must supply |
| --- | --- | --- |
| `group` / `nTj` | finite certificate for `1 ≤ deg ≤ 11` (degrees `6` to `11` behind the gap `gap:transitive-groups-degree-six-to-eleven`); parsed only above degree `11` | an **exact parser** and a proof that the index in the single reference family has `referenceSubgroup` conjugate to the passport's monodromy group (Layer 1.6) — not a string or abstract-name comparison |
| `aut_group` | finite certificate **or** carrier only | either parse its generators and prove the generated subgroup equals the triple's centralizer (Layer 0.4), or mark it carrier-only; the roadmap does not accept the name alone as evidence |
| `curve`, `map` | finite certificate | a parsed algebraic Belyi pair over the stored base field (Layer 9.1) whose invariants match the record; without the parse, carrier-only |
| `primitivization` | finite certificate | a block system, the quotient triple it induces (Layer 1.4), and a proof that the quotient's passport is the referenced record's — not a label lookup |
| `pass_size` | intrinsic theorem | Layer 1.2's `passportSize` through Layer 3.4 |
| `orbit_size` | finite schema field | `r.orbit_size = storedEmbeddingCount r` (14.2); equality with `trueOrbitSize` is a **separate** orbit certificate |
| `num_orbits` | frozen-table aggregation | the number of map rows sharing the passport label; ⚠ this is a fact about the table, not a theorem about one passport record |
| `maxdegbf` | frozen-table aggregation | the largest **stored** `orbit_size` among those rows; ⚠ despite the name it is not a base-field degree, and it aggregates stored counts, not fields of moduli |
| trailing label letter | carrier only | external enumeration (14.5) |
| `embeddings` values | carrier only | floating-point annotations |

⚠ **`Σ orbit_size = pass_size` is false in general and is not asserted.** With 14.2's two
counts, `Σ_r storedEmbeddingCount r` counts stored embedding entries, while `pass_size` counts
the simultaneous-conjugacy classes of the passport, and valid rows give only a map from the
former into the latter. It can fail in two independent ways:

- **duplication** — several stored entries give the same class, as when a row's base field
  strictly contains the field of moduli (14.2);
- **omission** — classes of the passport that no stored row represents. Valid rows do not prove
  that their union covers the passport: keeping only one of the three rows of `5T1-5_5_5`, each
  over `ℚ` with one embedding, gives a sum of `1` against `pass_size = 3`, with no duplicate
  entry anywhere.

The equation holds when a certificate supplies, for every row, coverage of the embeddings of
its base field (14.2), pairwise distinctness of the represented Galois orbits, equality of each
base field with the field of moduli, and that the represented classes are all the classes of the
passport. The last is a statement about the table and needs its own proof: Algorithm 2.3.1 of
Musty–Schiavone–Sijsling–Voight enumerates the combinatorial possibilities, which is distinct
from computing and storing the maps. A certificate that assumed the sum formula would be unsound
on real records.

*Prerequisites:* Layers 0.4, 1.2, 1.4, 1.6, 3.4, 9.1, 11.7, 14.1, 14.2.

*Tau Ceti:* `TauCeti.PermutationTriple.LMFDB.CertificationLevel` with the field classifications
`TauCeti.PermutationTriple.LMFDB.PassportRecord.StoredField.certificationLevel` and
`TauCeti.PermutationTriple.LMFDB.BelyiRecord.StoredField.certificationLevel`; the aggregation predicate
`TauCeti.PermutationTriple.LMFDB.PassportRecord.IsAggregatedFrom`; and the inequalities
`TauCeti.PermutationTriple.LMFDB.PassportRecord.card_mapRowClasses_le_sum_storedEmbeddingCount` and
`TauCeti.PermutationTriple.LMFDB.PassportRecord.IsValidAt.card_mapRowClasses_le_passSize`, which are what valid rows prove
without a coverage certificate.

#### 14.4 The tabulated `S₃` representative

The database does **not** tabulate one row per ordered passport. It chooses one ordered
passport from each `S₃`-orbit (Layer 2.6) and retains all simultaneous-conjugacy classes
inside that chosen ordered passport. This milestone certifies that convention, separately
from the intrinsic ordered passport, and refuses to manufacture a canonical choice.

- **The certificate.** A `TabulatedPassport` record carries a stored ordered passport
  together with a proof that it is admissible (Layer 1.1); the assertion it supports is
  membership in the `S₃`-orbit of a given ordered passport, and nothing stronger.
- **What is proved.** The stored classes lie in the **stored** ordered passport — not merely in
  its orbit — and are all of its classes only under a completeness certificate as in 14.3, since
  valid rows do not prove that they cover a passport: the orbit generally contains other ordered passports with
  their own classes, and Layer 2.6's action moves between them. State the bijection between
  the classes of two ordered passports in one orbit, so that a consumer can transport a
  count without confusing the two.
- **What is refused.** The database's choice of representative is a total order on labels
  that has no stable mathematical description; the milestone classifies the representative
  choice and the trailing label letters as **carrier-only** data (14.3's level) and derives
  neither. ⚠ Manufacturing a canonical representative — "the lexicographically least ordered
  passport in the orbit" — would be a definition this roadmap invented, and it would agree
  with the database only by luck.

*Source:* Musty–Schiavone–Sijsling–Voight, *A database of Belyi maps*, **Algorithm 2.3.1**,
which is where the one-representative-per-`S₃`-orbit tabulation is specified.

*Prerequisites:* Layers 1.1, 1.2, 2.6, 3.5, 14.1–14.3.

#### 14.5 Label semantics

The grammar of passport and map labels, with the mathematical meaning of each component:
degree, the `nTj` group through Layer 1.6 for degrees `1` through `11`, degrees `6` to `11`
behind the gap of Layer 1.6 (above degree `11` the group
component is parsed without a group certificate), and the three partitions. Prove that a valid record's
label components agree with its certified invariants. ⚠ The trailing orbit letter
is an external enumeration of the Galois orbits inside a passport — carrier-only in 14.3's
classification — and is never derived from the mathematics; the frozen `5T1-5_5_5` passport,
whose three orbits carry the letters `a`, `b`, `c` in an order fixed by the database and not
by any invariant, is the witness.

*Prerequisites:* Layers 1.6, 14.1–14.4.

*Tau Ceti:* `TauCeti.PermutationTriple.LMFDB.parsePassportLabel` with `TauCeti.PermutationTriple.LMFDB.partitions_of_parsePassportLabel_eq_some`,
`TauCeti.PermutationTriple.LMFDB.parseMapLabel`, and `TauCeti.PermutationTriple.LMFDB.PassportRecord.IsValidAt.hasLabel_of_hasValidLabel`.

#### 14.6 The frozen acceptance suite

The records named by their labels below and in Layers 0.1, 8.5 and 12.12 — genus zero, positive genus, primitive,
imprimitive, a passport with three Galois orbits, and links to both an elliptic and a
genus-two curve — each carried through 14.1–14.5 at the highest certification level its data
admits. ⚠ The database itself is complete only through degree `6` by its own account, and
carries a handful of records its maintainers' own consistency script rejects; neither fact
affects what a certificate asserts, and both are reasons Layer 14 certifies records rather
than the database. Two of them, `6T6-6_6_3.3-a` and `3T1-3_3_3-a`, are related by `primitivization`, so
the pair also exercises Layer 1.4. Its `6T6` field is a required group certificate:
prove the carried degree-six triple generates a conjugate of Layer 1.6's exact `6T6`
reference, then transport the block-system/primitivization certificate to the `3T1` record.
The group comparison and the quotient-triple comparison are separate proofs.

Reconcile the frozen degree-`≤ 4` table with Layer 3.5's proved classification: each of the
thirteen records matches exactly one enumerated isomorphism class, distinct records match
distinct classes, and the four imprimitive ones all primitivize to `2T1-2_2_1.1-a`. ⚠ The
reconciliation is one-directional by design: it does not claim that every enumerated class
appears in the database.

*Prerequisites:* Layers 3.5, 14.1–14.5.

*Tau Ceti:* the degree-at-most-four table `TauCeti.PermutationTriple.LMFDB.smallDegreeRecords` with
`TauCeti.PermutationTriple.LMFDB.unorderedCycleData_eq_classification`, and `TauCeti.PermutationTriple.LMFDB.isValidAt_torusPassportRecord`. The
`6T6`/`3T1` group and primitivization certificates and the `5T1-5_5_5` record remain.

## Explicit scope exclusions

None of the following is part of this roadmap, at any layer, and none is "deferred":

- numerical or symbolic algorithms for *discovering* equations of Belyi maps, and interval
  or ball certification of computed maps;
- any claim that the LMFDB's Belyi tables are complete;
- Hurwitz spaces, their compactifications, and moduli stacks of covers;
- branched covers with more than three branch points as a subject (the punctured-disc local
  theory of Layer 7.1 is general, but every global statement here has three branch points);
- the existence of a nonconstant meromorphic function on an *arbitrary* compact Riemann
  surface (every surface here arrives carrying its map; the general existence theorem is
  the Dirichlet-problem analysis this roadmap never needs);
- uniformization, the `λ`-function, and Picard-type applications;
- Seifert–van Kampen in any form, general or two-open: both belong to AlgebraicTopology
  Stage 1, and Layer 5.5 records the contract for the two-open case with simply connected
  intersection that this roadmap consumes; also topological surface classification and
  orientation theory;
- the étale fundamental group of a scheme, and the comparison of Layer 12's field-theoretic
  carrier with any scheme-theoretic one;
- tangential basepoints, canonical splittings or liftings of the outer action, continuity
  or homomorphy of `u ↦ φ_u`, and local decomposition-group actions
  `Gal(ℚ̄_p/ℚ_p) → Out`;
- Grothendieck–Teichmüller theory and anabelian reconstruction;
- LMFDB `nTj` group certificates above degree `11`; degrees `6` to `11` are in scope, through
  the gap `gap:transitive-groups-degree-six-to-eleven` of §What Tau Ceti supplies;
- the inverse Galois problem beyond the monodromy groups the constructions here realize;
- formalized counterexamples where Layer 11.6 records a cited structural warning.

## Worked examples

Two examples are threaded through every layer so that each new construction has an instance
the reader already knows: `cyclicTriple n` (the monodromy of `z ↦ zⁿ`: genus `0`,
spherical, defined over `ℚ`, trivial passport structure) and `torusTriple` (degree `4`,
genus `1`, Euclidean, regular with deck group `ℤ/4`, imprimitive, realized on an elliptic
curve). The per-layer example obligations appear inside the milestones (0.8, 2.7, 3.5, 4.4,
6.4, 8.5, 10.8, 14.6); a layer introducing a new carrier without instantiating both threaded
examples on it is incomplete. Layer 8.5 is where `torusTriple` acquires its exact analytic
and algebraic model, `y⁴ = t(t−1)` with `β = t`.

## Ordering

Two tracks, joined at Layer 12. The lists below are **derived from the per-milestone
`Prerequisites:` lines**, with ranges expanded, not asserted independently of them; a change
to a prerequisite line that contradicts this section makes the section wrong.

- **Track A (finite mathematics):** a chain, `Layer 0 → Layer 1 → Layer 2 → Layer 3 →
  Layer 4`. ⚠ Layers 2, 3 and 4 are **not** mutually independent: 3.1 needs 1.1, 1.2 and
  1.4, and 3.5 needs 2.6's branch-point action to state the one-representative-per-orbit
  comparison with the database; 4.3 needs 3.1 for the finite decision procedure it reuses. Startable immediately; everything elaborates against the pin plus the two
  finite-supplier roadmaps.
- **Track B (geometry):** Layer 5 → Layer 6 → Layer 7 → Layer 8 → Layer 9 → Layer 10 →
  Layer 11. It imports from Track A at exactly five places:

  ```text
  Layer 6  ← 0.1–0.4  (triple vocabulary), 2.6 (branch-point action), 4.6 (regularity)
  Layer 7  ← 0.5, 2.2
  Layer 8  ← 0.6, 0.8 (the threaded torus example), 2.1, 2.2, 2.4
  Layer 9  ← 2.6 (the algebraic branch-point action)
  Layer 10 ← 3.1
  ```

  ⚠ Track B is therefore **not** independent of Layer 4: 6.5 consumes 4.6's normality
  criterion for regular covers.
- **The summit:** the Belyi-specific part of Layer 12 consumes both tracks (6.3, 7.1, 9–11)
  and `ProfiniteArithmetic`'s generic milestones 12.1–12.3 (the profinite integers as a ring,
  exponentiation, and its pro-`ℓ` comparison). Layer 13 follows Layer 12. Layer
  14's finite milestones (14.1 partially, 14.5) need only Track A; its orbit milestones need
  Layer 11.

The layer numbering is the citation order; the two-track structure is the parallelism.

## References

Primary sources, with the convention-sensitive role of each recorded. Theorem numbers are those
of the editions named.

- E. Girondo, G. González-Diez, *Introduction to Compact Riemann Surfaces and Dessins
  d'Enfants*, LMS Student Texts 79, CUP 2012 — the analytic theory at this roadmap's exact
  generality, cited at Layers 0.6, 4.1, 4.4, 4.5, 5, 6.1, 6.3, 6.5, 7.4, 8.1, 8.3, 8.5, 9.2,
  9.3, 9.5, 10.6 and 12.5. ⚠ Two of its routes are deliberately not followed: its separating
  function comes from uniformization (Layer 9.3), and its fundamental group of the
  thrice-punctured sphere comes from `Γ(2)` (Layer 5).
- S. K. Lando, A. K. Zvonkin, *Graphs on Surfaces and Their Applications*, Encyclopaedia
  Math. Sci. 141, Springer 2004 — Layers 0–4: constellations, passports, and Proposition
  1.5.3 for the genus statement of Layer 0.6 (whose proof there is topological; see that
  milestone).
- R. Cori, A. Machì, "Maps, hypermaps and their automorphisms: a survey", Exposition. Math.
  10 (1992) — the same combinatorics, surveyed.
- B. Köck, "Belyi's theorem revisited", Beiträge Algebra Geom. 45 (2004) 253–265
  (arXiv:math/0108222) — Layer 10 throughout: the `Aut(ℂ)` lemmas (**1.4**–**1.6**), Weil's
  criterion in the weakened form (**1.9**) with its Galois-descent lemma (**1.10**), the
  moduli field of a covering (**2.1**) and its model over a finite extension (**2.2**), the
  finiteness of coverings with prescribed critical values (**3.1**) and the corollary that
  the moduli field is a number field (**3.2**), Belyi's theorem (**3.3**), and the two
  construction lemmas (**3.5**, **3.6**).
- T. Szamuely, *Galois Groups and Fundamental Groups*, CSAM 117, CUP 2009 — Layer 12
  throughout: base change between algebraically closed fields (**4.6.10**, **4.6.11**), the
  free profinite `π₁` of the three-point line (**Example 4.6.12(3)**) and the Kummer case
  (**4.6.12(2)**), the arithmetic exact sequence and the outer action (**Proposition 4.7.1**,
  §4.7), its splitting at a rational point (**Corollary 4.7.3**), inertia as a stabilizer
  (**Lemma 4.7.2**), the cyclotomic character (**Example 4.7.4**), and the action on inertia
  through it in characteristic zero (**Remark 4.7.5**).
- J.-P. Serre, *Topics in Galois Theory*, 2nd ed., A K Peters 2008 — Layers 12, 13
  context; rigidity.
- J. Stix, "On cuspidal sections of algebraic fundamental groups", in *Galois–Teichmüller
  Theory and Arithmetic Geometry*, ASPM 63 (2012) 519–563 — Layers 12.9–12.11: Definition
  37(i) in §7 is the cyclotomic action on cuspidal inertia. ⚠ Cite the published version;
  the arXiv preprint leaves the statement unnumbered.
- J.-M. Couveignes, "Calcul et rationalité de fonctions de Belyi en genre 0", Ann. Inst.
  Fourier 44 (1994) — Layer 11.4 (Théorème 3, Weil's criterion) and Layer 11.6
  (Théorème 8, and the Hilbert-symbol obstruction of §8.3). Open access on Numdam.
- P. Deligne, "Le groupe fondamental de la droite projective moins trois points", in
  *Galois Groups over ℚ*, MSRI Publ. 16 (1989) — the classical origin of Layer 12.
- M. Fried, "Fields of definition of function fields and Hurwitz families — groups as
  Galois groups", Comm. Algebra 5 (1977) — the branch-cycle lemma.
- A. Weil, "The field of definition of a variety", Amer. J. Math. 78 (1956) — Layer 11.4.
- M. Musty, S. Schiavone, J. Sijsling, J. Voight, "A database of Belyi maps", ANTS XIII,
  Open Book Series 2 (2019) — Layer 14: the database semantics, and the composition
  convention of the stored triples.
- J. Sijsling, J. Voight, "On computing Belyi maps", Publ. Math. Besançon (2014) — Layer 14
  conventions; the computational literature this roadmap's exclusions point away from.
- J. D. Dixon, B. Mortimer, *Permutation Groups*, GTM 163, Springer 1996 — Layers 1.4, 3.
- O. Forster, *Lectures on Riemann Surfaces*, GTM 81 — Layers 8.1–8.3, 8.5, 9.2 and 9.3
  directly (local normal form **2.1**, degree theorem **4.24**, continuation of coverings
  **8.4** with uniqueness **8.5**, and the degree of the meromorphic extension **8.3**), and
  the cohomology chain ModularForms §10B builds and Layers 8–9 consume (finiteness
  **14.10**, Riemann–Roch **16.9**, Serre duality **17.9**, Riemann–Hurwitz **17.14**).
