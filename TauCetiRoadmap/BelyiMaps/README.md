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
  theorem for the profinite fundamental group, a generic pro-`ℓ` peripheral-power theorem, and
  faithfulness of the Galois action;
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
automorphism carrier. The current declarations use only the available substrate; the staged
successors consume the missing pieces from their named owning roadmaps.

Suggested homes, mirroring the Mathlib directories that own each notion. The directories are
suggested homes for the code, not extra layers of this roadmap:

```text
TauCeti/Combinatorics/PermutationTriple/   -- Layers 0, 1, 3
TauCeti/Combinatorics/RibbonGraph/         -- Layer 2
TauCeti/GroupTheory/TriangleGroup/         -- Layer 4
TauCeti/GroupTheory/Profinite/             -- generic suppliers owned by ProfiniteProPGroups
                                           -- and by its successor ProfiniteArithmetic
TauCeti/AlgebraicTopology/ThreePuncturedSphere/  -- Layers 5, 6
TauCeti/Geometry/RiemannSurface/           -- Layers 7, 8
TauCeti/AlgebraicGeometry/Belyi/           -- Layers 9, 10, 11
TauCeti/NumberTheory/Belyi/                -- Layers 12, 13, 14
```

## Merge boundary and staged successors

This PR now has a deliberately narrow declaration boundary. Its compiled `Suggested.lean`
exports the self-contained Belyi vocabulary: permutation triples and relabeling, connectedness,
orders and all six branch-point operations; the ribbon-graph carrier; triangle groups; the
thrice-punctured sphere with its anharmonic self-homeomorphisms and monodromy; the three
distinct public cover carriers `ConnectedFiberNumberedCover`, `ConnectedPointedCover` and
`ConnectedCover`, each with its isomorphism relation, its quotient carrier
(`ConnectedFiberNumberedCoverClass`, `ConnectedPointedCoverClass`, `ConnectedCoverClass`) and
the forgetful maps between them; and the three combinatorial carriers `ConnectedTriple`,
`ConnectedIsoClass` and `MarkedIsoClass` those quotients are classified by.

The rest of the programme is retained below as a dependency specification, and is **not a
declaration or a completion claim of this PR**. Every excluded summit has exactly one owner:

| Excluded material | Layers | Exact owner | Activated once |
| --- | --- | --- | --- |
| passports, cycle partitions, and the reference transitive-group results | 1, 3 | **this roadmap**, in a follow-up PR | #243 `PolynomialGaloisGroups` lands its exact `fullCycleType` and transitive-group API |
| the two-open Seifert–van Kampen theorem | 5.5 | roadmap **`UniversalCovers`** | — it is general algebraic topology, owned there and only consumed here |
| associated covers, and the subgroup half of the covering classification | 6.2, and the subgroup statement inside 6.3 | **this roadmap** for 6.2, in a follow-up PR; `UniversalCovers` milestone 8 for the subgroup statement | UniversalCovers publishes compiled semilocal-connectivity, universal-cover, deck-action and classification carriers |
| compactification, compact Riemann surfaces, ramification, analytic cohomology, and analytic Riemann existence | 7, 8 | successor roadmap **`BelyiAnalyticCovers`** | a compact-surface owner (ModularForms Layer 10B) publishes one checked carrier and the Riemann–Roch/Riemann–Hurwitz API |
| algebraic Belyi pairs, the analytic–algebraic comparison, Belyi's theorem, fields of moduli and of definition, and Weil descent | 9, 10, 11 | successor roadmap **`BelyiAlgebraicAndDescent`** | AlgebraicCurves publishes its curve/function-field anti-equivalence and extension-ramification carriers, and `BelyiAnalyticCovers` lands |
| the arithmetic exact sequence and outer action, peripheral inertia, the branch-cycle theorem, the pro-`ℓ` peripheral-power theorem, faithfulness, and LMFDB record semantics | 12, 13, 14 | successor roadmap **`BelyiArithmeticActions`** | #244 `ProfiniteProPGroups` and its generic successor `ProfiniteArithmetic` land, and `BelyiAlgebraicAndDescent` lands |

The generic constructions the arithmetic layers need — the profinite integers as a topological
commutative **ring**, profinite exponentiation with its `ℤ_ℓ` comparison, and the continuous
outer-automorphism carrier — are not Belyi mathematics, and are owned neither here nor by a Belyi
successor. Their exact owner is **`ProfiniteArithmetic`**, the generic successor to #244
`ProfiniteProPGroups` named in that roadmap's opening section.

Thus an unresolved supplier contract is a scheduling block, not a theorem with a prose caveat.
No unmerged supplier branch is imported and no Belyi-local stand-in is exported. The order is
#243 and #244 first, then UniversalCovers, the compact-surface owner, AlgebraicCurves and
`ProfiniteArithmetic`, and only then the follow-up PRs and the three Belyi successors above. The
split is combinatorial / analytic / arithmetic, and it is drawn where the carriers actually
become typeable rather than where the mathematics changes subject.

## Prerequisites

Every milestone below lists its direct prerequisites. Each prerequisite is one of four kinds,
and nothing else is allowed:

- **Mathlib.** A declaration that exists in Mathlib at the pin.
- **Tau Ceti.** A declaration that exists in the Tau Ceti code repository.
- **Layer n.m.** An earlier milestone of this roadmap.
- **Roadmap, Layer n.** A named layer of another roadmap in this repository.

The compiled slice of this PR waits on no unmerged roadmap. Later milestones are activated only
after their named supplier lands on `main`, at which point the successor must import and `#check`
the exact declarations. In particular this PR defines no replacement `fullCycleType`,
transitive-group label, universal-cover class, compact-Riemann-surface API, free profinite group,
profinite exponent ring, or outer-automorphism carrier.

## Boundaries

Seven roadmaps supply material to this one. The boundaries are stated once here.

There is no dependency on `LocalGaloisGroups`, `ClassFieldTheory`, or a proposed
`PeripheralActions` roadmap. The future branch-cycle and pro-`ℓ` peripheral-power applications
are Belyi-specific; their generic groups, powers, and outer-automorphism carriers come from
`ProfiniteProPGroups`.

**Character theory.** Class functions, irreducible characters, the character table, both
orthogonality relations, class sums, structure constants, and central characters belong to
[CharacterTheory](../RepresentationTheory/CharacterTheory/README.md). This roadmap proves none
of them. It consumes, by name: `ClassFunction` (Layer 0), `classSum`, `structureConstant` and
`classSum_mul` (Layer 1), `characterTable` and `char_column_orthogonality` (Layer 3), and
`centralCharacter` with `centralCharacter_coordinate` and the conversion
`ω_χ(K_j) = |C_j|·χ(g_j)/χ(1)` (Layer 4). The Frobenius product-one counting formula is on no
roadmap; **this roadmap owns it** (Layer 3.2), together with the inverse-class operation on
`ConjClasses` it needs.

**Universal covers.** The covering-space classification, deck transformation groups, the
`N(H)/H` deck-group theorem, and the two-open Seifert–van Kampen theorem belong to
[UniversalCovers](../UniversalCovers/README.md) (milestones 4, 5, 7, 8 there, together with the
van Kampen declarations whose exact required signatures Layer 5.5 below pins). This roadmap
consumes them and builds no universal cover. Two conventions from that roadmap bind here: deck
groups are identified with `(π₁)ᵐᵒᵖ` (its milestone 5), and basepoint change acts on recovered
subgroups by conjugation (its milestone 7). The constructive direction this roadmap needs — a
cover of the base built *from* a permutation action — is Layer 6.2's associated cover
`(Ũ × S)/π₁`, which needs from that roadmap only the universal cover and the free proper
discontinuity of the deck action. ⚠ Mathlib's `IsQuotientCoveringMap` supplies only **half**
of the covering property: it gives `Ũ × S → assocCover S`, the quotient by the free proper
action, and with it the topology on `assocCover S` and the universal property for maps out
of it. It says nothing about the projection `assocCover S → X`, which is the map this
roadmap actually needs to be a covering; that is Layer 6.2's own equivariant sheet
computation, and the two maps have different groups in play.

**Seifert–van Kampen.** The pin has it in no form, and this roadmap builds none of it. The
case the fundamental-group computation needs — two open sets with simply connected
intersection — is general algebraic topology, reusable far beyond three-point covers, so it
belongs to [UniversalCovers](../UniversalCovers/README.md) with the rest of the fundamental-group
machinery. Layer 5.5 below records exactly which declarations that roadmap supplies and under
which hypotheses; Layer 5.6 **instantiates** them at the two-set cover of Layer 5.1 and reads
off the values on the canonical generators, and that instantiation is what this roadmap owns.
No Belyi-local copy, alias or stand-in for the theorem is exported.

**Conformal mapping.** The local theory of holomorphic maps — Rouché, Hurwitz, the local
degree `TauCeti.exists_localDegree`, holomorphic branch roots — belongs to
[ConformalMapping](../ConformalMapping/README.md) (its L0), and Layer 8 consumes it for the
local normal form. Nothing here uses the Riemann mapping theorem, Montel, or the boundary
correspondence. The `ℍ/Γ(2) ≅ ℂ∖{0,1}` λ-uniformization is that roadmap family's material
(recorded there as belonging to ModularForms); no layer here consumes or supplies it — the
route to the fundamental group of the thrice-punctured sphere is UniversalCovers' two-open van
Kampen theorem, applied to the cover of Layer 5.1, and no retraction onto a figure eight
occurs anywhere in it.

**Modular forms.** The compact-Riemann-surface cohomology chain — structure sheaf, sheaves of
a divisor, finiteness of `H¹`, analytic Riemann–Roch, Serre duality by residues,
Riemann–Hurwitz for finite holomorphic maps, and the existence of nonzero meromorphic sections
of line bundles — is planned inside [ModularForms](../ModularForms/README.md) Layer 10B for
general compact Riemann surfaces. `BelyiAnalyticCovers` does not begin until that owner
publishes a compiled compact-Riemann-surface carrier, the sphere instance, and exact
Riemann–Roch/Riemann–Hurwitz declarations. This PR no longer exports a parallel hypothesis-stack
interface. `X(Γ)`, modular curves, and everything `q`-expansion-flavoured stay in ModularForms;
nothing here mentions `ℍ`.

**Algebraic curves.** Function fields of one variable, places, divisors, Riemann–Roch,
extensions with ramification and the different, Riemann–Hurwitz, and the regular-projective
model with the curve/function-field anti-equivalence belong to the AlgebraicCurves roadmap —
cited as AlgebraicCurves Layers 0–8 and 12; that roadmap's own contract table names this
roadmap as the consumer of exactly those layers. Layer 9 here consumes them for the algebraic side of the comparison. The analytic
comparison over `ℂ` — a compact Riemann surface with a Belyi function versus the regular
projective model of its function field — is excluded there by name and belongs to
`BelyiAlgebraicAndDescent` (Layers 9.4–9.7).

**Polynomial Galois groups.** The full cycle type `fullCycleType`, the transitive-group
reference data `TransitiveGroupIndex`, `referenceSubgroup`, `numTransitiveGroups`, and the
label predicate `TransitiveGroupLabel` belong to the PolynomialGaloisGroups roadmap (its
Layers 0, 6, 7).
Layer 1 here consumes them for LMFDB label semantics and adds no second `nTj` predicate and no
second cycle-type-with-fixed-points definition. Blocks, primitivity, and transitivity are
always Mathlib's `MulAction.IsBlock`, `MulAction.IsPreprimitive`, `MulAction.IsPretransitive`,
as there.

**Profinite and pro-p groups.** The free profinite group on a finite set (`freeProfiniteGroup`, `.of`,
`.lift`), the maximal pro-`p` quotient (`proPKernel`, `maximalProPQuotient`) with its
universal property and the characteristicity of its kernel under continuous automorphisms,
the free pro-`p` group `freeProP`, and the identification
  `maximalProPQuotient_zHat_equiv_padicInt` belong to the
ProfiniteProPGroups roadmap (its Layers 3 and 4). The generic **ring** structure on `ẑ`, profinite
exponentiation and its `ℤ_ℓ` comparison, and the continuous outer-automorphism carrier are owned
by **`ProfiniteArithmetic`**, the generic successor named in #244's opening section — #244 itself
builds `zHat` only as a profinite group. Neither set is owned or exported by the Belyi namespace.
`BelyiArithmeticActions` will consume their exact public names for the cyclotomic and peripheral
applications.

AlgebraicCurves, PolynomialGaloisGroups and ProfiniteProPGroups live at
`../AlgebraicCurves/README.md`, `../PolynomialGaloisGroups/README.md` and
`../ProfiniteProPGroups/README.md`.

What this roadmap supplies to other subjects:

- the Frobenius product-one formula and generating-triple counts (Layer 3), usable by any
  subject that counts covers or factorizations in finite groups;
- finite bipartite ribbon graphs (Layer 2), reusable for maps and hypermaps on surfaces;
- triangle groups (Layer 4);
- in `BelyiAlgebraicAndDescent`, the Belyi-specific analytic/algebraic comparison, after the
  compact-surface and AlgebraicCurves carriers land;
- in `BelyiArithmeticActions`, the branch-cycle theorem and the pro-`ℓ` peripheral-power theorem
  (Layers 12, 13), the Belyi-specific arithmetic application of `ProfiniteArithmetic`'s generic
  infrastructure.

## Internal boundaries

The roadmap is one roadmap, and its fifteen layers group into three sections with clean
contracts between them, so that a reader can decide in one step which section owns a result.
Each contract lists what the section exports and what it imports; nothing crosses a boundary
except through these lists.

**A. Finite combinatorics — Layers 0–4.**
*Current exports:* `PermutationTriple` with its relabeling action, `IsoClass`,
`ConnectedTriple` and `ConnectedIsoClass`;
`monodromyGroup`, `automorphismGroup` with `automorphismGroup_smul`, `orderTriple`,
`GeometryType`; `BipartiteRibbonGraph`; all six branch-point operations `swap01`, `swap1Inf`,
`swap0Inf`, `rot`, `rotInv` with their composite identities and their preservation of
connectedness; and `TriangleGroup`.
*Exports added by the #243 successor:* full cycle data, `eulerChar`, `genus`;
`PassportSpec` with `HasPassport`, `passportOf`, `passportSize`; blocks,
quotient triples and supplier-backed primitivity refinements; the dessin/triple equivalence; the
branch-point `S₃`-action on ordered passports; the executable
enumeration and the small complete tables; the Frobenius product-one formula, generating
counts and the normalizer counting formula; `TriangleGroup` with its trichotomy.
*Imports:* Mathlib permutations, group actions, free and presented groups;
PolynomialGaloisGroups' `fullCycleType` and transitive-group data; CharacterTheory's class
sums, structure constants, character table and central characters. **Nothing topological.**

**B. Topology and geometry — Layers 5–11.** Layers 5, 6.1 and 6.3 are current; 6.2 is a
follow-up PR here; Layers 7–8 are `BelyiAnalyticCovers` and Layers 9–11 are
`BelyiAlgebraicAndDescent`.
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
2.1, 2.2, 2.4, 2.6   dessins and the S₃-action              6.3, 7.6, 8.6, 8.7
3.1            the executable enumeration                   10.6
4.6            the normality criterion                      6.5
```

and nothing else; UniversalCovers; ConformalMapping L0; ModularForms Layer 10B;
AlgebraicCurves. ⚠ `4.6` belongs on this list: Layer 6.5 classifies regular covers by
normality of the point stabilizer, which is Layer 4.6's criterion, so section B is not
independent of Layer 4.

**C. Arithmetic and database semantics — Layers 12–14, the successor roadmap
`BelyiArithmeticActions`.**
*Consumes from `ProfiniteArithmetic`:* the profinite integers as a topological ring, the profinite
exponentiation calculus and its pro-`ℓ` comparison, and continuous outer automorphisms.
*Consumes from #244 `ProfiniteProPGroups`:* free profinite and free pro-`p` groups, the maximal
pro-`p` quotient, and `maximalProPQuotient_zHat_equiv_padicInt`.
*Belyi-specific exports:* `π₁ᵍᵉᵒ` and the comparison isomorphism with its
orientation; the arithmetic exact sequence and outer action; peripheral inertia; the
`ẑ`-cyclotomic character; the branch-cycle theorem and its finite Nielsen-class corollary;
the pro-`ℓ` peripheral-power theorem and its dyadic instance; faithfulness; the LMFDB
record certificates.
*Imports:*

```text
from A   0.1, 0.4–0.7, 1.1–1.6, 2.6, 3.4, 3.5
from B   5.6, 6.1, 6.3, 7.1, 8.7, 9.1, 9.5–9.8, 10.2, 10.3, 10.7,
         11.1, 11.3, 11.5, 11.7
```

plus ProfiniteProPGroups, ProfiniteArithmetic, and Mathlib's Galois categories and
cyclotomic characters.

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
the **opposite** relation. The private provenance ledger verifies this against frozen records rather than
inferring it from the display. The two conventions differ by the componentwise-inversion
involution of Layer 0.1, and Layer 14.2 states that translation as a theorem about the
stored data.

⚠ The rival convention also produces a *different* third permutation (`(σ1·σ0)⁻¹` versus
`(σ0·σ1)⁻¹`), so a triple carried across without the involution has the wrong `σinf` and the
wrong partition at `∞`. Every source citation in this roadmap records the source's
composition order. The worked example `z ↦ z²` in `Suggested.lean` pins the reading here:
`σ0 = σinf = (0 1)`, `σ1 = 1`.

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

**Peripheral elements.** In the profinite completion `F̂₂` of `FreeGroup (Fin 2)`:
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

and **not** `P⁻¹ · C · P`. The peripheral-power theorems of Layer 13 transfer along it by the
conjugation-transfer lemma of 13.3, whose conjugator is computed rather than guessed.

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

The load-bearing imports, against the pinned Mathlib (`9caeba1000`, Lean `v4.31.0-rc1`);
The private provenance ledger carries the dated audit that produced this list:

| Area | Declarations |
| --- | --- |
| Permutations | `Equiv.Perm.cycleType`, `cycleFactorsFinset`, `support`, `Equiv.Perm.partition`, `isConj_iff_cycleType_eq`, `Equiv.Perm.sign`, `IsCycleOn`, `Equiv.Perm.exists_with_cycleType_iff` |
| Actions | `MulAction.IsPretransitive`, `IsBlock`, `IsBlockSystem`, `IsPreprimitive`, `isCoatom_stabilizer_iff_preprimitive`, `ConjAct`, `MulAction.stabilizer`, orbit–stabilizer, Burnside `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group` |
| Jordan theorems | `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem`, `alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem` |
| Free groups | `FreeGroup`, `FreeGroup.lift`, `IsFreeGroup`, `FreeGroupBasis`, `PresentedGroup`, `PresentedGroup.toGroup`, Nielsen–Schreier |
| Topology | `FundamentalGroup`, `FundamentalGroupoid`, `Path`, `IsCoveringMap` (`Topology/Covering/Basic.lean`), `IsQuotientCoveringMap`, `liftPath`, `liftHomotopy`, `IsCoveringMap.monodromy`, `monodromyFunctor`, `monodromy_trans_apply`, `injective_path_homotopic_map`, the lifting criterion `existsUnique_continuousMap_lifts_of_range_le`, `LocPathConnectedSpace`, `isCoveringMap_exp`, `isCoveringMapOn_zpow` |
| Galois categories | `PreGaloisCategory`, `FiberFunctor`, the profinite topology on `Aut F`, `IsGalois` objects, `functorToContAction` with `IsEquivalence`, `IsFundamentalGroup` with `toAutMulEquiv` and `toAutMulEquiv_isHomeomorph` |
| Profinite | `ProfiniteGrp`, `ProfiniteGrp.profiniteCompletion` with `eta`, `lift`, adjunction; `ContinuousMulEquiv` (`≃ₜ*`); `PadicInt` |
| Arithmetic | `Field.absoluteGaloisGroup`, Krull topology, `AlgebraicClosure`, `modularCyclotomicCharacter`, `cyclotomicCharacter`, cyclotomic polynomials irreducible over `ℚ`, `IsPrimitiveRoot` |
| Complex analysis | `analyticOrderAt`, `MeromorphicAt/On`, `MeromorphicNFAt`, open mapping, identity theorem, `TendstoLocallyUniformlyOn`, `OnePoint ℂ` with `OnePoint.equivProjectivization` and the `GL(2)` Möbius action |
| Manifolds | `IsManifold 𝓘(ℂ) ω`, `MDifferentiable`, `Mathlib/Geometry/Manifold/Complex.lean` (maximum principle) |

Notable absences at the pin, so that nobody searches for them: any `SemilocallySimplyConnected`
(UniversalCovers owns the class), Seifert–van Kampen in any topological form, `ẑ`, `Out G`,
étale fundamental groups, Riemann surfaces, Riemann–Roch, Riemann–Hurwitz, divisors on
schemes, and any ribbon-graph or triangle-group object.

## What Tau Ceti supplies

Every already-pinned consumed theorem gets an exact name or signature. A local agent cannot
implement against an unnamed chain: it has to know what to `apply`. The table therefore
distinguishes exact declarations from later supplier milestones whose carriers are intentionally
still prose-only. Accepted non-portfolio suppliers may have an exact local interface signature;
the three portfolio suppliers have no local stand-ins here.

| Consumer | Supplier | Object | Exact name, or local interface signature |
| --- | --- | --- | --- |
| 0.5, 1.1 | `PolynomialGaloisGroups` Layer 0 | cycle type with fixed points | `PolynomialGaloisGroups.fullCycleType` |
| 1.6, 14.1, 14.5 | `PolynomialGaloisGroups` Layers 6, 7 | transitive reference data and the label predicate | `PolynomialGaloisGroups.numTransitiveGroups`, `PolynomialGaloisGroups.TransitiveGroupIndex`, `PolynomialGaloisGroups.referenceSubgroup`, `PolynomialGaloisGroups.TransitiveGroupLabel` |
| 3.2 | CharacterTheory Layer 1 | class sums and structure constants | `classSum`, `structureConstant`, `classSum_mul` |
| 3.2 | CharacterTheory Layer 3 | the character table and column orthogonality | `characterTable`, `char_column_orthogonality` |
| 3.2 | CharacterTheory Layer 4 | central characters, and the conversion to class sizes | `centralCharacter`, `centralCharacter_coordinate`, and the conversion of `ω_χ` on a class sum into class size times character value over degree, for which that roadmap pins **no Lean name**; local interface: `centralCharacter_eq_card_mul_div (χ) (j) : centralCharacter χ (classSum j) = (Nat.card (carrier j) : ℂ) * χ (rep j) / χ 1` |
| 5.1, 6.2 | UniversalCovers Stage 0.2 | semilocal simple connectivity | **unresolved supplier contract**: no Mathlib class exists and UniversalCovers has not published a compiled target; no local stand-in is exported |
| 5.6 | UniversalCovers, the two-open van Kampen milestone | Seifert–van Kampen for two open sets with simply connected intersection | **unresolved supplier contract**: the required declarations are `vanKampenLift`, `vanKampenLift_bijective`, `vanKampenEquiv` and `vanKampenEquiv_toMonoidHom`, with the signatures and hypotheses pinned verbatim in Layer 5.5 below. This roadmap exports no copy: Layer 5.6 is the instantiation, not the theorem. |
| 6.2 | UniversalCovers Stage 0.2, 0.3 | the universal cover, its covering map, and the free proper `π₁`-action | `UniversalCover x₀`, `proj`, `IsCoveringMap proj`, `SimplyConnectedSpace (UniversalCover x₀)`, `UniversalCover.isQuotientCoveringMap` |
| 6.4 | UniversalCovers Stage 0.4, 1 | deck groups and `Deck ≅ (π₁)ᵐᵒᵖ` | `Deck`, `deckFundamentalGroupEquiv : Deck proj ≃* (FundamentalGroup X x₀)ᵐᵒᵖ` |
| 6.3 | UniversalCovers Stage 2 | basepoint change, and the pointed/unpointed correspondence | `basepointChangeSubgroup` is named upstream; milestone 8's equivalences are **unresolved prose-only supplier contracts** and are not exported locally. Their required carriers and exact connectedness/orbit semantics are pinned in Layer 6.3 below. |
| 8.2 | ConformalMapping L0 | the local degree of a holomorphic map | `TauCeti.exists_localDegree`, and the holomorphic branch-root extraction beside it |
| 8.1–9.4 | ModularForms Layer 10B / compact-surface owner | compact Riemann-surface carrier, sphere instance, meromorphic functions, Riemann–Roch and Riemann–Hurwitz | **unresolved supplier contract**: no compiled carrier or theorem names are published, so this PR exports no local hypothesis-stack, meromorphic-field, divisor, degree, ramification, or cohomology stand-in. The successor must import and `#check` the supplier's map-derived invariants. |
| 9.1, 9.4, 9.6 | `AlgebraicCurves` Layers 0, 1 | function fields, places, and divisors | exact declarations: `AlgebraicCurves.IsFunctionField`, Mathlib's `IsIntegrallyClosedIn`, `AlgebraicCurves.Place`, `AlgebraicCurves.Divisor` |
| 9.1, 9.4, 9.6 | `AlgebraicCurves` Layer 6 | ramification index, residue degree, and the fundamental identity | **prose-only supplier milestones; no Lean declarations are pinned yet** |
| 9.5, 10.7, 11.4 | `AlgebraicCurves` Layer 5 | Riemann–Roch and genus | exact declarations: `AlgebraicCurves.riemannRochSpace`, `AlgebraicCurves.genus` |
| 10.7, 11.4 | `AlgebraicCurves` Layer 8 | constant-field extension in characteristic zero | **prose-only supplier milestone; no full-faithfulness declaration is pinned yet** |
| 9.1, 9.5 | `AlgebraicCurves` Layer 12 | the regular projective model and the anti-equivalence | **prose-only supplier milestones; no Lean declarations are pinned yet**. The reserved roadmap names are `regularModel`, `functionFieldEquiv`, and `regularModel_functionField`; **this roadmap never analytifies a scheme** — Layer 9.6 works with places, so only the place set and its `(e,f)` data are consumed, never a scheme-theoretic fiber |
| 12.7, 13.1 | #244 `ProfiniteProPGroups` Layers 3, 4 | free profinite and free pro-`p` groups, the maximal pro-`p` quotient, and `maximalProPQuotient_zHat_equiv_padicInt` | **unmerged supplier contract**: `BelyiArithmeticActions` must import and `#check` the final #244 declarations; this PR exports no aliases or stand-ins. |
| 12.1–12.3 | `ProfiniteArithmetic` (the generic successor to #244) | `zHat` as a topological commutative ring, the `ℤ̂`-power with its `ℤ_ℓ` comparison, and the continuous outer-automorphism carrier | **unwritten supplier roadmap**, named in #244's opening section as the exact owner; these are generic group theory, not Belyi mathematics, and this PR exports no aliases or stand-ins. |

An exact portfolio row is imported only by the successor that consumes it, after the supplier
lands on `main`; that successor must fail on a spelling or carrier change rather than selecting a
local replacement. The UniversalCovers, compact-surface, AlgebraicCurves, #243, and #244 rows are
scheduling contracts, not claims that declarations already exist. `Suggested.lean` intentionally
omits their consumers. The `ProfiniteArithmetic` row is the one supplier that has no roadmap of its
own yet; #244's opening section records the same boundary from the supplier side, so the three
constructions have one owner rather than none.

## The build, in layers

The fifteen layers are a dependency order: every milestone rests on Mathlib, on Tau Ceti, on
an earlier layer, or on a cited layer of a named roadmap, and there are no forward
references. Layers 0–4 are pure finite mathematics and are startable immediately — but they
form a **chain**, not four independent pieces; Layers 5–8 are topology and analysis; Layers
9–11 are algebraic geometry over `ℂ` and `ℚ̄`; Layers 12–13 are the arithmetic summit; Layer
14 is the LMFDB interface. The §Ordering section records what genuinely runs in parallel,
derived from the per-milestone prerequisite lines rather than asserted alongside them.

`Suggested.lean` holds suggested signatures for the milestones whose carrier, index type, or
map determines the layers below them. It is not a checklist, and it is not exhaustive.

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

#### 0.3 The monodromy group

`monodromyGroup t := Subgroup.closure {t.σ0, t.σ1}`. Prove: `σinf ∈ monodromyGroup t`;
closure of all three components equals closure of the first two; relabeling by `τ` maps the
monodromy group to its conjugate `Subgroup.map (MulAut.conj τ).toMonoidHom`; the monodromy
groups of isomorphic triples are conjugate.

*Prerequisites:* Layers 0.1, 0.2; Mathlib `Subgroup.closure`.

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
   `finSumFinEquiv`, with `χ` additive, cycle data concatenating, and monodromy the product
   acting componentwise. Conversely every triple decomposes, up to relabeling, as the
   disjoint sum of its restrictions to the monodromy orbits.
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

#### 0.7 Orders and geometry type

`orderTriple t := (orderOf t.σ0, orderOf t.σ1, orderOf t.σinf)` — the LMFDB's `abc` datum.
Prove `orderOf σ = (fullCycleType σ).lcm` (the pin's `lcm_cycleType`, adjusted for the
appended `1`s), and invariance under relabeling.

Define the three-valued `GeometryType` (spherical, Euclidean, hyperbolic) of a connected
triple by the exact rational comparison of `1/a + 1/b + 1/c` with `1`, where `(a,b,c)` is
`orderTriple`. The identity permutation has order `1`. Prove invariance under relabeling and
under the opposite-convention involution.

*Prerequisites:* Layers 0.1, 0.2, 0.5; Mathlib `orderOf`, `Rat` order.

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
  equivalence exhibited and the equality of passports proved.
- **The Euclidean torus triple** `torusTriple`: degree `4`,
  `σ0 = σ1 = finRotate 4`, `σinf = (finRotate 4 ^ 2)⁻¹`. Connected; cycle data
  `[4], [4], [2,2]`; `χ = 0`; genus `1`; `orderTriple = (4,4,2)`; Euclidean; monodromy
  cyclic of order `4`; automorphism group of order `4` (regular); imprimitive with blocks
  `{0,2},{1,3}`. One example serving Layers 0–4 as the positive-genus, regular, imprimitive,
  Euclidean witness at once.
- **A noncommutative triple**: degree `3`, `σ0 = finRotate 3`, `σ1 = Equiv.swap 0 1`,
  monodromy all of `S₃`; genus `0`; the automorphism group is trivial.

*Prerequisites:* Layers 0.1–0.7; Mathlib `finRotate`, `Equiv.swap`.

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

#### 1.2 Passport classes and passport size

The passport class set of `P` is the (finite) set of isomorphism classes of
`ConnectedTriple n` with passport `P`; `passportSize P` is its cardinality. The `Fintype`
instance comes from Layer 0.1's `Fintype (PermutationTriple n)` and Layer 0.2's decidable
orbit relation — both instances on the carrier itself, so **this milestone does not consume
Layer 3.1** and Layer 3.1 is free to consume it. Prove: `passportSize` is invariant under
conjugating the reference subgroup; isomorphic triples have equal passports; the passport
determines degree, genus, `orderTriple`, and geometry type (each is computable from the
partitions alone — with the genus through Layer 0.6's formula).

⚠ *Nearby false statement:* a passport does not determine the isomorphism class; the
smallest counterexamples have several classes in one passport, and Layer 3.5 exhibits one.

*Prerequisites:* Layers 0.6, 0.7, 1.1.

#### 1.3 The normalizer formulation

Fix an embedded pretransitive `G ≤ Equiv.Perm (Fin n)`. Prove the bijection between

- isomorphism classes of connected triples with monodromy group conjugate to `G` and cycle
  data `(λ0, λ1, λinf)`, and
- orbits of the conjugation action of the normalizer `N_{S_n}(G)` on the set of triples
  `(g0, g1, ginf) ∈ G³` with `ginf * g1 * g0 = 1`, `⟨g0, g1⟩ = G`, and the given cycle data.

⚠ The acting group is the normalizer, not `G`: two generating triples of `G` can be
`S_n`-conjugate only through elements normalizing `G`, and inner conjugation is a proper
subgroup of that in general. Every counting statement of Layer 3.4 passes through this
milestone.

*Prerequisites:* Layers 0.2, 0.3, 1.1; Mathlib `Subgroup.normalizer`.

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

#### 1.6 Label semantics at reference degrees

For `n ≤ 11`, interpret the group component of an LMFDB passport label through
PolynomialGaloisGroups: the passport's reference subgroup satisfies
`TransitiveGroupLabel j` for the index `j : TransitiveGroupIndex n` displayed as `nTj+1`.
State the label-semantics predicate for the stable mathematical part of a passport label —
degree, `nTj` group, and the three partitions — as a predicate on `PassportSpec`, and prove
it invariant under conjugating the reference subgroup. The final orbit letter of a full
LMFDB label is an external enumeration of Galois orbits inside a passport; it is
deliberately not interpreted at this layer (Layer 14.5 records its status).

*Prerequisites:* Layer 1.1; PolynomialGaloisGroups Layers 6, 7.

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

#### 2.2 From triples to dessins

For a triple `t` of degree `n ≠ 0`: `E := Fin n`; `B` and `W` are the quotients of `Fin n`
by the orbit relations of the cyclic groups generated by `σ0` and `σ1`; the incidences are
the quotient maps; `rotB := σ0`, `rotW := σ1`. Prove the `IsCycleOn` laws (an orbit of a
single permutation is a cycle of it), that the dessin is connected iff `t` is, that its
faces biject with the cycles of `σinf`, and that its Euler characteristic equals `χ(t)`
(`card B + card W + card faces = Σ cycleCount`, edges `n` counted once).

*Prerequisites:* Layers 0.1–0.6, 2.1.

#### 2.3 From dessins to triples

For a connected `Γ` with a chosen equiv `ν : Γ.E ≃ Fin n`: the triple
`ofTwo (ν.permCongr Γ.rotB) (ν.permCongr Γ.rotW)`. Prove that a different choice of `ν`
yields a relabeled triple, so the isomorphism class of the triple is well-defined, and that
the face permutation transports to `σinf`.

*Prerequisites:* Layers 0.1, 0.2, 2.1.

#### 2.4 The equivalence of classifications

Round trips: triple → dessin → triple is the original up to the identity relabeling of
`Fin n`; dessin → triple → dessin is isomorphic to the original, naturally. Conclude the
bijection between isomorphism classes of connected dessins and isomorphism classes of
connected triples, with automorphism groups matching. Every counting statement about
dessins reduces along this bijection to Layer 3.

*Prerequisites:* Layers 2.2, 2.3.

#### 2.5 Genus of a dessin

`χ`, parity, the connected bound `χ ≤ 2`, and the genus — transported along 2.4 from
Layer 0.6, with the Euler-characteristic equality of 2.2 doing the work. The combinatorial
genus stays independent of any analytic surface until Layer 8.6's genus reconciliation
proves they agree.

*Prerequisites:* Layers 0.6, 2.2, 2.4.

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
`a⁻¹a⁻¹b⁻¹a²b`, not `1`. `Suggested.lean` carries a `decide`-checked counterexample on
`s3Triple`.

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
in Lean (`swap0Inf_eq`, `rot_eq`, `rotInv_eq`), not asserted as rewriting folklore. In
particular `rot` is the cyclic rotation `(a,b,c) ↦ (b,c,a)`, with **no conjugator at all**,
which is what makes the `S₃`-action visible.

⚠ **Reindexing is contravariant, so this is a *right* action.** Writing `Op ρ` for the
operation in the table, `Op ρ ∘ Op ρ' = Op (ρ' · ρ)` in Mathlib's multiplication, where
`(ρ' · ρ) i = ρ' (ρ i)`: the labels multiply in the **reverse** of the order in which the
operations are applied. The two generator instances are `rot_eq` and `rotInv_eq`. Applying
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
  by `b` or `b⁻¹` instead moves the first component, which `t²` fixes; `Suggested.lean`
  carries all three as `decide`-checked witnesses on `s3Triple`.

  The same phenomenon for the rotations is `rotInv_rot : rotInv (rot t) = b • t` — the
  conjugator there is **`b`**, not `a`, so `rotInv` is not the inverse of `rot` on triples
  even though `rot³` is the identity.
- *Functoriality.* Each operation commutes with relabeling, hence descends to `IsoClass n`;
  each preserves connectedness (`isConnected_swap01`, `isConnected_swap1Inf`), hence restricts
  to `ConnectedTriple n` and descends to `ConnectedIsoClass n`.
- *The action.* On `IsoClass n` the induced maps satisfy the Coxeter relations `s² = 1`,
  `t² = 1`, `(st)³ = 1`, and therefore define an `S₃`-action, right-acting as above. Prove
  the three relations separately; the third is `rot_rot_rot` and the braid relation is
  `braid_on_isoClass`.
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
  5.1 — Layer 6.3's `isoClass_pullback_mob01` and `isoClass_pullback_mob1Inf`, which identify
  the pullback along `z ↦ 1 − z` with `swap01` and along `z ↦ z/(z − 1)` with `swap1Inf`, and
  hence the four composites with the four composite operations. Equivalently, on the free
  group of 5.6 the same six formulas describe the induced automorphisms of
  `FreeGroup (Fin 2)`, with `x = of 0 ↦ periph0`, `y = of 1 ↦ periph1`, `z = (y · x)⁻¹`; the
  triple action is *precomposition* with those automorphisms, which is where the
  contravariance above comes from;
- *algebraic*, by postcomposing an algebraic Belyi pair `β` with an anharmonic Möbius
  transformation of `ℙ¹` — Layer 9.1's `S₃`-action, owned by `BelyiAlgebraicAndDescent`.
  ⚠ Postcomposition inverts: the map whose puncture permutation is `ρ` realizes the operation
  labelled `ρ⁻¹`, so `rot` is realized by `t ↦ (t − 1)/t` and not by `t ↦ 1/(1 − t)`. Layer 9.1
  carries the table.

⚠ Only `id` and `s` act on level-1 data (literal triples and fiber-numbered covers); their
Möbius transformations are the two that fix the basepoint `b = 1/2` (Layer 5.1). The other
four act only on isomorphism classes, and the failure to act on the nose is measured by
`swap1Inf_sq` and `rotInv_rot`.

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

#### 2.7 Dessin examples

The dessins of the Layer 0.8 suite, drawn out as data: the `n`-star of `cyclicTriple n`
(one black vertex, `n` white, `n` edges, one face at genus `0`); the segment dessin of the
`4z(1−z)` triple (two black, one white, two edges); the torus dessin of `torusTriple` (one
black, one white, four edges, two faces, `χ = 0`); and the `S₃` example. Each with its
Euler characteristic computed by `decide`/`#eval`-friendly instances.

*Prerequisites:* Layers 0.8, 2.2.

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
  `decide`-checked at `n ≤ 3`. The prototype carries those checks: `(isoClasses n).card` is
  `1, 3, 7` for `n = 1, 2, 3` and one passport fiber has size `1`, all by kernel `decide`,
  agreeing with the independent enumeration in the private provenance ledger. ⚠ At `n = 4` kernel reduction
  does not complete in reasonable time; `#eval` gives `26` there, and that is recorded as a
  computation rather than promoted to a theorem — `native_decide` would prove it but would add
  a trusted-compiler axiom to a repository that has none.

  ⚠ For the passport fiber to be **computable** the monodromy group must enter as a `Finset`
  of permutations, which is also how the database presents it; a `Subgroup` carries no
  decidable equality. The milestone therefore states the fiber against that datum and adds
  the bridge to `PassportSpec`, rather than declaring the fiber `noncomputable` and keeping
  the `#eval` promise. The group is compared **up to conjugacy in `S_n`** — comparing literal
  subgroups over-counts, and at degree `5` that is exactly the difference between the correct
  `74` ordered passports and a larger wrong number.

Complexity is not a completion criterion; `n!·n!` enumeration is acceptable.

*Prerequisites:* Layers 0.1–0.7, 1.1, 1.2, 1.4.

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

   over the irreducible characters, derived from `centralCharacter_coordinate`, column
   orthogonality `char_column_orthogonality`, and the conversion
   `ω_χ(K_j) = |C_j| · χ(g_j) / χ(1)` (CharacterTheory Layer 4). State it over `ℂ` as an
   identity of complex numbers with the natural-number count cast in.
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

#### 3.3 Generating triples

For a finite group `G` and classes as above, the count of triples that in addition generate
`G`, by inclusion–exclusion over the subgroup lattice: define the generating count by strong
downward recursion (`total H = Σ_{K ≤ H} generating K`, with the sum over actual subgroups,
then regrouped by conjugacy with the multiplicity `[N_G(K) : K]`-bookkeeping stated
explicitly), and prove the recursion. A Möbius-function closed form is stated only if the
pin's incidence-algebra API supports it; the recursion is the milestone.

*Prerequisites:* Layer 3.2; Mathlib `Subgroup` lattice, strong induction on finite
subgroup lattices.

#### 3.4 From counts to passport sizes

Combine Layers 1.3, 3.2, 3.3 into a formula, in these five steps, each its own statement:

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
   centralizes `⟨g0, g1⟩ = G`, so the stabilizer is `C_{S_n}(G)`, independent of the triple.
   Prove that, and conclude the exact formula

   ```text
   passportSize P = genCountType G λ0 λ1 λinf * Nat.card (C_{S_n}(G)) / Nat.card N ,
   ```

   as an equality of natural numbers together with the divisibility that makes it one.
   Burnside is then a cross-check, not the route.
5. **The centralizer bound.** For pretransitive `G`, `C_{S_n}(G)` acts semiregularly on
   `Fin n`, so its order divides `n` (Layer 0.4's freeness argument applied to `G` in place
   of a triple's monodromy group); record this so the formula's right-hand side is bounded.

Every ingredient is named; no step identifies a raw Frobenius count with `passportSize`.

*Prerequisites:* Layers 0.4, 0.5, 1.2, 1.3, 3.2, 3.3; Mathlib Burnside,
`Subgroup.centralizer`, `Subgroup.normalizer`.

#### 3.5 The small complete tables

Run Layer 3.1 at degrees `n ≤ 4` and prove the complete table: the isomorphism classes of
connected triples with their passports, genera and geometry types, as theorems with `decide`
or `Finset.sort`-normal-form proofs. The counts are

```text
degree                            1    2    3    4
connected classes                 1    3    7   26
ordered passports                 1    3    7   26
```

so that **every ordered passport in degree `≤ 4` has size exactly `1`** — which is itself a
milestone, and which holds whether or not the monodromy group is part of the passport datum.

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

*Prerequisites:* Layers 2.6, 3.1, 3.4; the frozen snapshot in the private provenance ledger.

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

#### 4.2 Triples as permutation representations

A degree-`n` triple `t` whose component orders divide `(a, b, c)` induces
`TriangleGroup a b c →* Equiv.Perm (Fin n)` sending `x, y, z` to `σ0, σ1, σinf`; its range
is the monodromy group; `t` is connected iff the induced action on `Fin n` is
pretransitive. Conversely a finite pretransitive action of `TriangleGroup a b c` on a
nonempty `Fin n` yields a connected triple with orders dividing `(a, b, c)`, and the two
constructions are inverse up to relabeling. This is the classification of connected triples
with bounded orders by conjugacy classes of transitive finite permutation representations of
the triangle group.

*Prerequisites:* Layers 0.1–0.4, 4.1.

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

#### 4.4 The trichotomy: spherical and Euclidean cases

Define the orbifold Euler characteristic `χᵒʳᵇ(a,b,c) := 1/a + 1/b + 1/c − 1 ∈ ℚ` and prove
its sign matches Layer 0.7's geometry type of any connected triple with exact orders
`(a,b,c)`. Then:

- **Spherical classification, proved.** For `χᵒʳᵇ > 0` with `1 ≤ a ≤ b ≤ c`, the parameter
  triples are exactly `(1, m, m)`, `(2, 2, m)`, `(2, 3, 3)`, `(2, 3, 4)`, `(2, 3, 5)` — an
  elementary finite case analysis on `1/a + 1/b + 1/c > 1`. In each case the triangle group
  is finite of order `2/χᵒʳᵇ`:

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
  action of a finite quotient `Q` one gets `Nat.card Q ≤ 2 / χᵒʳᵇ(a,b,c)` for **every**
  finite quotient; that statement is available in all three geometries and proves finiteness
  in none of them.
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
   `(Y·X)^c = 1` — each because an element of `SL(2,ℝ)` with trace `2cos θ` and `|θ| < π` is
   conjugate to a rotation by `2θ` — so 4.1's universal property gives a homomorphism
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

#### 4.6 Regular triples and normal subgroups

A connected triple is *regular* when its automorphism group acts transitively on `Fin n`
(equivalently, by 0.4, the monodromy action is free and transitive on a nonempty fiber —
each characterization proved). Prove the correspondence: isomorphism classes of regular
connected triples with orders dividing `(a,b,c)` biject with finite-index normal subgroups
of `TriangleGroup a b c`, the deck/automorphism group being the finite quotient; under 4.2
the correspondence restricts the classification to the regular locus. The `torusTriple` is
the worked example (`N ⊴ TriangleGroup 4 4 2` of index `4`).

*Prerequisites:* Layers 0.4, 4.2; Mathlib `Subgroup.Normal`, quotient groups.

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

**The route is pinned, and its one general input comes from UniversalCovers.** The pin has
no Seifert–van Kampen theorem in any form, and Seifert–van Kampen for two open sets with
simply connected intersection is general algebraic topology rather than Belyi mathematics:
5.5 records the exact declarations UniversalCovers supplies, and 5.6 instantiates them at
5.1's two-set cover. Everything else in this layer is Belyi's own. The base case
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

- *Constructors and instances.* `TopologicalSpace`, `T2Space`, `LocPathConnectedSpace`,
  `PathConnectedSpace`, second countability, and the semilocal simple connectivity class
  UniversalCovers' classification needs — all from "open subset of `ℂ`", each proved once
  here rather than at each use. `Nonempty`, the coercion to `ℂ`, and the two membership
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

  `mob01` and `mob1Inf` generate, and `Suggested.lean` pins those two as `≃ₜ`; the other four
  are their composites, `mobRot = mob01 ∘ mob1Inf`, `mobRotInv = mob1Inf ∘ mob01` and
  `mob0Inf = mob01 ∘ mob1Inf ∘ mob01`. ⚠ Pulling covers back is **contravariant** in the map,
  so the composite of two Möbius transformations induces the *reverse* composite of branch-point
  operations — `mobRot` induces `rot = swap1Inf ∘ swap01` — which is the same inversion as in
  Layer 2.6's table and must not be introduced a second time by mismatching the two.
  ⚠ **Only `mob01` fixes the basepoint**: the orbit of `b = 1/2` under
  the anharmonic group is `{1/2, 2, −1}`, so the other five operations move `b` and act on
  `π₁(U, b)` only after a choice of connecting path. That is the topological source of Layer
  2.6's finding that the `S₃`-action lives on isomorphism classes, and Layer 6.3 is where the
  two are matched. The value lemmas that make the action on the *chosen* generators — and not
  merely on their conjugacy classes — computable are stated with the loops, in 5.2.
- *Edge cases.* `A` and `B` are each connected but neither is simply connected; `A ∩ B` is
  simply connected but is **not** all of `U`.
- *Downstream interfaces.* Layers 6, 7, 8, and the analytic side of 12.4.

⚠ *Nearby false statement:* `A ∩ B` is simply connected only because both punctures lie
on its boundary lines `re = 0` and `re = 1`. Sliding the cut to `A = U ∩ {re < 1/2}`,
`B = U ∩ {re > 1/2}` would leave the same intersection, but shifting it the other way so
that a puncture falls inside the strip destroys the hypothesis of 5.5 and the conclusion
of 5.6 with it.

*Prerequisites:* Mathlib `Complex`, `LocPathConnectedSpace`, `OnePoint`,
`Convex.isPathConnected`; UniversalCovers milestone 2's hypothesis classes.

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
retracts `U` onto `C₀ ∪ C₁`**, and the fundamental group is computed by UniversalCovers'
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
level-1 statement of the branch-point action; the other five operations of 2.6 admit no such
lemma, because their Möbius maps move `b`.

⚠ *Nearby false statement:* "the loop around `∞` is counterclockwise" is meaningless
without naming the chart. The transition `w = 1/z` reverses the apparent orientation, so
the same curve is clockwise in `z` and counterclockwise in `w`. Every source citation in
this roadmap that fixes a peripheral orientation records the chart it uses; a citation
that does not is not usable for a sign.

*Prerequisites:* Layer 5.1; Mathlib `Complex.exp`, `Path`, `Path.Homotopic.Quotient`.

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
  is convex, hence simply connected; so UniversalCovers' quotient-covering identification
  applies and `π₁` is the acting group. ⚠ That identification lands in the **opposite**
  group in general (UniversalCovers milestone 5), which is invisible here only because
  `ℤ` is abelian; do not carry the habit into Layer 6.4, where it is not.
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
`IsQuotientCoveringMap`, `Convex`, `ContinuousMap.Homotopy`, the winding-number/index API;
UniversalCovers milestones 4, 5.

#### 5.5 Van Kampen with a simply connected intersection: the UniversalCovers input

**Not a milestone of this roadmap.** Seifert–van Kampen for two open sets with simply
connected intersection is general algebraic topology, reusable by anything that computes a
fundamental group, and it is owned by [UniversalCovers](../UniversalCovers/README.md). This
section exists to state the contract exactly, so that the instantiation in 5.6 has something
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

*Prerequisites:* Roadmap UniversalCovers, its two-open van Kampen milestone. Nothing in this
layer is discharged by a Belyi-local proof of it.

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

*Prerequisites:* Layers 5.1, 5.2, 5.4; Roadmap UniversalCovers, its two-open van Kampen
milestone (Layer 5.5 above); Mathlib `FreeGroup`, `Monoid.Coprod`, `FreeGroup.lift`.

#### 5.7 Basepoint change

Along a path from `b` to another basepoint, the induced isomorphism of fundamental groups
carries the peripheral elements to conjugates of themselves, and the three peripheral
**conjugacy classes** are independent of the path and of the basepoint. State the
conjugacy-class invariance as the milestone; the element-level statement is false without
fixing a path, and that failure is the topological origin of the outer form of the Galois
action in Layer 12.8.

*Prerequisites:* Layers 5.2, 5.6; UniversalCovers milestone 7's basepoint-change API.

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
`Nonempty E`) — with connectedness in the carrier this is the one-directional
`ConnectedFiberNumberedCover.triple_isConnected`, and its converse is what makes 6.3(1)
surjective; the degree is well-defined (the fiber cardinality is locally constant on the
connected base, hence constant, which is `ConnectedCover.nonempty_ν_of` and is what lets the
degree be pinned at `b` without loss); the triple is **unchanged** by an isomorphism of
fiber-numbered covers (`connectedTriple_congr`); changing `ν` by `τ` relabels the triple by
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

#### 6.2 The associated cover of a `π₁`-set

> **Successor boundary.** Layers 6.2–14 are dependency and normalization specifications for
> follow-up PRs, not declarations or completion criteria of this PR. Each follow-up begins only
> after its owning supplier has landed and exposes the exact carriers named at the merge boundary.

The converse construction, and the place where a cover is built rather than analysed. It is
stated **generically**, for an arbitrary discrete `π₁`-set, under the exact hypotheses the
universal-cover supplier requires; the finite case is a corollary, not the theorem.

This milestone is currently an **unresolved UniversalCovers supplier contract** and therefore has
no public prototype in `Suggested.lean`. Once that roadmap exposes the class and universal-cover
API, this roadmap must import them and add a closed check of the covering/deck theorem used in the
Riemann-existence argument. The intended standing hypotheses, to be reconciled with that public
API rather than imposed by a private class, are:

```text
[TopologicalSpace X] [PathConnectedSpace X] [LocPathConnectedSpace X]
[SemilocallySimplyConnectedSpace X]
```

with `x : X` and `Ũ := UniversalCover x` its universal cover, `q : Ũ → X` the projection.
⚠ Semilocal simple connectivity is **not** optional and is not implied by the others: the
Hawaiian earring is path-connected and locally path-connected and has no universal cover.
`U` of 5.1 satisfies all three because it is an open subset of `ℂ` (Layer 5.1's instance
list), and that is where the hypotheses are discharged for this roadmap's use.

**The action, pinned.** UniversalCovers milestone 5 identifies the deck group with
`(π₁)ᵐᵒᵖ`, so `π₁` acts on `Ũ` on the **right**: writing `ũ · γ` for the deck
transformation attached to `γ`, one has `(ũ · δ) · γ = ũ · (δ γ)` and
`ũ₀ · γ = monodromy γ ũ₀` on the fiber. For a discrete `π₁`-set `S` with action map
`act : π₁ →* Equiv.Perm S`, the diagonal action on `Ũ × S` is therefore

```text
γ ⋆ (ũ, s) := (ũ · γ⁻¹, act γ s)
```

— a genuine **left** action, and the inverse in the first coordinate is exactly what the
`ᵐᵒᵖ` of milestone 5 forces. Define

```text
assocCover S := (Ũ × S) ⧸ ⋆ ,        p ⟦ũ, s⟧ := q ũ .
```

The milestone owns these statements, each named:

1. **The quotient is a covering of `Ũ × S`.** The action is free and properly discontinuous
   because it already is on `Ũ` (UniversalCovers milestone 3) and `S` is discrete, so
   Mathlib's `IsQuotientCoveringMap` applies to `Ũ × S → assocCover S`. This is what gives
   `assocCover S` its topology and the universal property for maps out of it.
2. **`p` is a covering map.** Over an evenly covered connected open `V ∋ y` the equivariant
   sheet decomposition gives `q ⁻¹' V ≃ V × π₁` with `π₁` acting by right translation on
   the second factor, whence `p ⁻¹' V ≃ V × S`. ⚠ This does **not** follow from
   `IsQuotientCoveringMap` alone: that theorem describes `Ũ × S → assocCover S`, not
   `assocCover S → X`, and the two maps have different groups in play.
3. **The fiber equivalence.** `ν_S : p ⁻¹' {x} ≃ S`, the inverse of `s ↦ ⟦ũ₀, s⟧`, using
   that `π₁` acts simply transitively on `q ⁻¹' {x}`. ⚠ **This direction is forced**, and it
   is the same direction as the numbering `ν` in 6.1: `Equiv.permCongr` transports
   `Equiv.Perm` along an equivalence, so only `ν_S : p ⁻¹' {x} ≃ S` sends the monodromy
   permutation of the fiber to a permutation of `S`. Written the other way the next formula
   does not typecheck, and `ν_S.symm.permCongr` would be needed instead.
4. **The monodromy calculation.** `ν_S.permCongr (monodromyHom p x γ) = act γ` for every
   `γ`, **with no inverse and no `ᵐᵒᵖ`**. Proof: lift `γ` in `Ũ` from `ũ₀`; the path
   `t ↦ ⟦γ̃ t, s⟧` lifts it in `assocCover S` and ends at
   `⟦ũ₀ · γ, s⟧ = ⟦ũ₀, act γ s⟧`. Reversing the sign in the diagonal action would produce
   `act γ⁻¹` here, which is why the formula above is displayed rather than described.

**The finite corollary.** For `S` finite of cardinality `n`, `assocCover S` has finite
fibers of cardinality `n`, and composing with a numbering `S ≃ Fin n` makes it a numbered
cover whose triple is the triple of the action. ⚠ It is a `ConnectedFiberNumberedCover b n`
exactly when the action is **transitive**: the connectedness field of that carrier is
discharged here, from transitivity, and for a non-transitive `S` the construction lands only
in a bare numbered cover, which this roadmap does not carry. This is the form Layer 6.3
consumes, and it supplies the inverse of `ConnectedFiberNumberedCoverClass.triple`.

**New object: `assocCover`.** Basic API:

- *Constructors and instances.* The quotient topology, the covering map, the fiber
  identification, and finiteness of the fiber for finite `S`.
- *Examples.* `S` a one-point set gives `X` itself; `S = π₁` with the left translation
  action gives the universal cover back — an instance of the **general** construction, since
  `π₁(U, b)` is free of rank `2` and hence infinite, so it is not an example of the finite
  corollary; `S = Fin n` with the action of a triple gives the cover Layer 6.3 pairs with
  that triple.
- *Morphisms and functoriality.* A map of `π₁`-sets induces a map of covers over `X`; the
  construction is a functor from discrete `π₁`-sets to covers, and it preserves coproducts.
- *Edge cases.* `S` empty, where the cover is empty; `S` with a non-transitive action, where
  the cover is disconnected and decomposes as the coproduct over the orbits.
- *Downstream interfaces.* Layers 6.3, 6.5, 7.2.

*Prerequisites:* Layers 5.3, 5.6; UniversalCovers milestones 3, 4, 5; Mathlib
`IsQuotientCoveringMap`, `MulAction`, `LocPathConnectedSpace`.

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

   The further identification with **subgroups of `π₁(U, b)` of index `n`** — pointed
   connected covers ↔ subgroups, and unpointed ↔ conjugacy classes of subgroups — is
   UniversalCovers milestone 8 and is **not restated here**; this roadmap composes with it
   rather than reproving it. Under that composite the subgroup attached to `(t, i)` is the
   stabilizer of `i` under the monodromy action, forgetting the basepoint is passing to the
   conjugation **orbit** of the subgroup, and the orbit relation is
   `subgroupConjSetoid := MulAction.orbitRel (ConjAct G) (Subgroup G)`, which this roadmap
   pins because `ConjClasses (Subgroup G)` is a different and wrong object.

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

**Automorphism groups.** The automorphism group of a cover is UniversalCovers' `Deck p`, not
a Belyi object; what descends through the quotients is that isomorphic covers have isomorphic
deck groups, and the Belyi content is 6.4's identification of `Deck p` with Layer 0.4's
`automorphismGroup` of the triple. On the combinatorial side the corresponding descent is
`automorphismGroup_smul`: relabeling conjugates `automorphismGroup`, so it is an invariant of
a `ConnectedIsoClass n` as a subgroup **up to conjugacy** and not on the nose.

**Compatibility with the branch-point action.** Pulling a cover back along an anharmonic
self-homeomorphism of 5.1 is the topological `S₃`-action, `ConnectedCoverClass.pullback`, and
the milestone is that it *is* Layer 2.6's combinatorial action:

```text
isoClass_pullback_mob01   : (c.pullback mob01).isoClass   = ⟦swap01   c.triple⟧
isoClass_pullback_mob1Inf : (c.pullback mob1Inf).isoClass = ⟦swap1Inf c.triple⟧
```

and hence the same for the four composites. For `mob01` the computation is transport-free:
`mob01` fixes `b` (5.1) and 5.2's pointwise identities `mob01 ∘ γ0 = γ1`, `mob01 ∘ γ1 = γ0`
give `h_*(periph0) = periph1`, `h_*(periph1) = periph0` and hence
`h_*(periphInf) = periph1⁻¹ · periphInf · periph1`, which is exactly `swap01`'s third
component. ⚠ The other five operations of 2.6 are **not** induced on the nose: their Möbius
transformations move `b` (5.1), so they act only after a choice of connecting path, the two
choices differ by an inner automorphism, and the statement survives only on the level-2
quotient. That is the geometric reason Layer 2.6's `S₃`-action is stated on isomorphism
classes, and it is the same phenomenon as `swap1Inf_sq` and `rotInv_rot` on the combinatorial
side.

*Source:* Girondo–González-Diez **Theorem 2.61**: two morphisms of the same degree with the
same branch-value set are isomorphic coverings if and only if their monodromies are
conjugate. ⚠ Its hypotheses include *equal branch-value sets*, not merely equal degree; the
statement is false without that, and the analogue here is that the three marked points are
fixed once and for all. ⚠ That statement is this milestone's level 2, phrased with
conjugacy on the combinatorial side; it is not level 1 and not level 3.

*Prerequisites:* Layers 0.2, 2.6, 5.1, 5.2, 5.6, 6.1, 6.2; UniversalCovers milestone 8 for
the subgroup identification only; Mathlib `existsUnique_continuousMap_lifts_of_range_le`,
`Setoid`, `Quotient.lift`, `Equiv.ofBijective`.

#### 6.4 Deck transformations

For a `ConnectedFiberNumberedCover b n` with triple `t`, the deck group is isomorphic to
`automorphismGroup t` of Layer 0.4, **as a subgroup of `Equiv.Perm (Fin n)`**: a deck
transformation is sent to the permutation it induces on the numbered fiber. The numbering is
what makes the target a concrete subgroup rather than an abstract group; changing `ν` by `τ`
conjugates both sides by `τ` compatibly, so the abstract isomorphism descends to the
unnumbered cover while the embedding does not.

⚠ **This is where the `ᵐᵒᵖ` of UniversalCovers milestone 5 is absorbed, once, explicitly.**
That milestone identifies the deck group of the universal cover with `(π₁)ᵐᵒᵖ`; composing
with the monodromy description turns deck transformations into permutations of the fiber
commuting with the monodromy action, which is the simultaneous centralizer, which is
Layer 0.4's automorphism group. The milestone states the composite with its direction
fixed, and the acceptance test is `torusTriple`: its automorphism group is cyclic of order
`4` (Layer 0.8), so the deck group of the corresponding degree-`4` cover must be cyclic of
order `4` and act freely and transitively on the fiber. A milestone that got the direction
wrong would still produce a group of order `4` here, so the test is stated on the **action**
— which element of the deck group corresponds to which permutation — not on the abstract
isomorphism type.

*Prerequisites:* Layers 0.4, 6.1, 6.3; UniversalCovers milestones 4, 5, 8.

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

*Prerequisites:* Layers 4.6, 6.3, 6.4; UniversalCovers milestone 8.

### Layer 7: compactification and topological branched covers

> **Owner:** successor roadmap `BelyiAnalyticCovers`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

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
  **compact**, by the compact-core argument: `E ∖ ⋃_q p ⁻¹' D_q^*` is a closed subset of `E`
  lying over the compact `U ∖ ⋃_q D_q^*`, hence compact for a finite-degree cover, and the
  finitely many closed filled discs cover the rest.

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

#### 7.3 The branched covering map

Extend `p` to `fillMap : fill t → OnePoint ℂ`, sending each filled point to its puncture
and using 5.1's open embedding `U ↪ OnePoint ℂ` on `E`. Prove: continuity (by 7.2's
universal property); properness and surjectivity; that the restriction over
`OnePoint ℂ ∖ {0,1,∞}` is the original covering map; and the **local model**, that at a
filled point coming from a cycle of length `e` the map is `w ↦ w^e` in the pinned charts.

*Prerequisites:* Layers 7.1, 7.2; Mathlib `OnePoint`, properness API.

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

#### 7.6 The embedded graph

The preimage `fillMap ⁻¹' [0, 1]` of the closed real segment, with black points over `0`,
white points over `1`, and edges the components of the preimage of the open segment,
realizes the **underlying bipartite graph** of the Layer 2.2 dessin of `t`. State it as a
bijection of combinatorial data: edges to `Fin n`, black vertices to the cycles of `σ0`,
white vertices to the cycles of `σ1`, with the two incidence maps matching. No general
theory of embedded graphs is developed — only these bijections.

⚠ **The rotations are not part of this milestone.** A cyclic order on the edges at a vertex
is orientation data, and `FilledCover p` is at this stage only a charted topological
surface: the charts of 7.2 are pinned only up to a rotation by a root of unity, and nothing
so far chooses a coherent orientation across them. The statement that the counterclockwise
cyclic order at a black vertex is the cycle of `σ0` is Layer 8.7, after the complex
structure of 8.5 supplies the orientation.

*Prerequisites:* Layers 2.2, 7.2, 7.3, 7.5.

#### 7.7 Topological branched covers as a carrier

The object Layer 8.6 classifies, defined here so that "isomorphism classes of connected
topological branched covers of the sphere with branch values in `{0,1,∞}`" names something.

```lean
/-- The marked points, as a set, so that `U` below names the same thing as in Layer 5.1. -/
def marked : Set (OnePoint ℂ) := {0, 1, ∞}

structure TopBranchedCover (n : ℕ) where
  Z : Type
  [instTop : TopologicalSpace Z]
  [instCompact : CompactSpace Z]
  [instConn : ConnectedSpace Z]
  [instT2 : T2Space Z]
  [instSecond : SecondCountableTopology Z]
  [instCharted : ChartedSpace ℂ Z]
  π : C(Z, OnePoint ℂ)
  surj : Function.Surjective π
  /-- Off the three marked points, `π` is an honest covering map of degree `n`. -/
  isCovering : IsCoveringMap (marked.restrictPreimage π)
  degree : ∀ y ∈ (marked : Set (OnePoint ℂ))ᶜ, Nat.card (π ⁻¹' {y}) = n
  /-- Over each marked point, `π` is `w ↦ w ^ e` in some chart at the source and some
  chart at the target, with a positive exponent. -/
  localPower : ∀ z ∈ π ⁻¹' marked, ∃ e : ℕ, 0 < e ∧
    ∃ (φ : OpenPartialHomeomorph Z ℂ) (ψ : OpenPartialHomeomorph (OnePoint ℂ) ℂ),
      z ∈ φ.source ∧ π z ∈ ψ.source ∧ φ z = 0 ∧ ψ (π z) = 0 ∧
      ∀ w ∈ φ.target, ψ (π (φ.symm w)) = w ^ e
```

⚠ The `ChartedSpace ℂ Z` instance is what "locally `ℂ`" means and is a **field**, not a
side condition: without it `localPower` has no charts to quantify over. Properness is not a
field — it follows from `CompactSpace Z` and `T2Space (OnePoint ℂ)` — and is proved, not
assumed.

An **isomorphism** is a homeomorphism `Z ≃ₜ Z'` commuting with `π` and `π'`. Prove: the
local degree `e` at a point is well defined (independent of the two charts, since any two
choices differ by units and `w ↦ w^e` determines `e` as the order of vanishing); the fibers
over the three marked points are finite; `Σ e = n` over each of them; and the restriction of
an isomorphism to the unbranched part is an isomorphism of covers in the sense of 6.1.

⚠ *Nearby false statement:* `degree` cannot be stated as a single `Nat.card (π ⁻¹' {y}) = n`
for **all** `y`. It fails at exactly the branch points, which is the entire content of the
object; the hypothesis is restricted to the complement of `marked` above, and the marked
fibers are governed by `localPower` and `Σ e = n` instead.

7.2 and 7.3 construct a `TopBranchedCover n` from a connected finite cover of `U`, and 7.4
says that construction is unique up to a unique isomorphism. Conversely, restricting `π`
over `OnePoint ℂ ∖ {0,1,∞}` sends a `TopBranchedCover n` to a connected finite cover of
`U`, and 7.4 makes the two constructions mutually inverse on isomorphism classes. That
equivalence is what Layer 8.6 consumes; it is stated here rather than there because it is
purely topological.

*Prerequisites:* Layers 6.1, 7.2–7.5.

### Layer 8: Riemann surfaces and analytic Riemann existence

> **Owner:** successor roadmap `BelyiAnalyticCovers`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

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
  1. `mdifferentiable_iff_analyticAt_chart` — `f : X → Y` is `MDifferentiable 𝓘(ℂ) 𝓘(ℂ)` iff
     its chart representatives are `AnalyticAt ℂ` at every point;
  2. `mdifferentiable_iff_contMDiff_omega` — for maps between complex manifolds at
     analyticity exponent `ω`, `MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ↔ ContMDiff 𝓘(ℂ) 𝓘(ℂ) ω f`;
  3. `mdifferentiable_toSphere_iff_meromorphicOn` — a map `X → OnePoint ℂ` other than the
     constant `∞` is holomorphic iff, in each chart, the composite with the affine chart of
     the sphere is `MeromorphicOn` in the pin's vocabulary, the poles being exactly the
     preimage of `∞`.

  ⚠ (3) is the bridge Layer 9.2 turns into a field, and it is a **theorem about charts**,
  not a definition: "meromorphic function" is not introduced as a primitive anywhere in this
  roadmap.
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
`Mathlib/Geometry/Manifold/Complex.lean`, `MeromorphicOn`.

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

#### 8.4 Analytic Belyi pairs

An **analytic Belyi pair** is a compact connected Riemann surface `X` (8.1's stack) with a
nonconstant holomorphic `β : X → OnePoint ℂ` whose branch values lie in `{0, 1, ∞}`.

**New object: `AnalyticBelyiPair`.** Basic API:

- *Constructors and instances.* The structure; the equivalent formulation "`β` restricted
  over `OnePoint ℂ ∖ {0,1,∞}` is a covering map" (equivalent by 8.3), which is the form
  `Suggested.lean` prototypes because it is the one Layer 6 consumes directly.
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

The frozen LMFDB record for this passport is `4T1-4_4_2.2-a` (retained in the private
provenance ledger), whose curve
friend is an elliptic curve over `ℚ`, so the example is also Layer 10.8's genus-one
acceptance instance.

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

**Genus reconciliation.** Apply ModularForms Layer 10B(v)'s Riemann–Hurwitz to `β`, with
the genus of `OnePoint ℂ` computed here as the worked instance of that chain on 8.1's
sphere (`g = 0`), to get the analytic genus of `X`; it equals the combinatorial genus of
Layer 0.6. Both sides are `Σ (e − 1)` over the three fibers, by 7.5 on the topological side
and by 8.3 on the analytic side, so the reconciliation is an equality of two computations
of the same sum — the milestone states it that way rather than as a coincidence of two
formulas.

⚠ *Nearby false statement:* Riemann existence in this form is a statement about covers
**with prescribed branch values**, not about arbitrary compact Riemann surfaces. It does not
say that every compact Riemann surface admits a Belyi map — that is Layer 10, and it is
false without the definability hypothesis over `ℚ̄`.

*Prerequisites:* Layers 0.6, 2.4, 6.3, 7.3–7.7, 8.4, 8.5; ModularForms Layer 10B(v).

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

### Layer 9: algebraic Belyi pairs and algebraization

> **Owner:** successor roadmap `BelyiAlgebraicAndDescent`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

In particular there is currently no public `AlgebraicBelyiPair`, compactification,
meromorphic-function-field comparison, or algebraization theorem. `BelyiAlgebraicAndDescent` must
make compactification, passage to the meromorphic function field, the AlgebraicCurves
anti-equivalence, and ramification compatibility visible in its typed declaration chain before
stating the comparison endpoint.

This layer crosses from analysis to algebra. AlgebraicCurves supplies the algebraic side and
ModularForms Layer 10B the analytic cohomology; the staged Belyi successor supplies the
comparison, which neither supplier owns and which AlgebraicCurves excludes by name.

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
  `k(t)`-isomorphisms; base change along `k ↪ k′` (AlgebraicCurves Layer 8's constant-field
  extension), with the caveat recorded there that constants must be re-checked after base
  change.
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

#### 9.2 The meromorphic function field

**The carrier, exactly.** ⚠ The **field** structure needs `X` connected, not compact: on a
disjoint union the meromorphic functions form a *product* of fields and have zero divisors,
and on an empty `X` the carrier has no `1`. Compactness is what the divisor bookkeeping of
9.4–9.5 needs, and is carried there. For a connected Riemann surface `X`,

```lean
def M (X) := {f : X → OnePoint ℂ // MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ f ≠ fun _ => ∞}
def poles (f : M X) : Set X := f ⁻¹' {∞}          -- finite, by 8.3
```

⚠ **"Defined chartwise off the polar set and extended by removability" is a proof, not a
definition**, and the operations are pinned by a characterization instead. Each of `+`, `*`,
`-`, `⁻¹` on `M X` is a **named target** given by its defining property: `f + g` is the
unique element of `M X` that is holomorphic on all of `X` and agrees with the chartwise sum
on `X ∖ (poles f ∪ poles g)`. Existence is removability at the finitely many excluded
points; **uniqueness is the identity theorem**, and it is uniqueness that makes this a
definition rather than a description. Spell out one such target in full; the other three
follow the same shape. Then prove:

- `M(X)` is a field — the milestone is that inverses exist, which is where the identity
  theorem enters: a nonzero `f` has isolated zeros, so `1/f` is holomorphic off a finite set
  and extends;
- the constants are exactly `ℂ` (8.1's maximum principle);
- `M(OnePoint ℂ) = ℂ(t)`, by partial fractions: a meromorphic function on the sphere with
  its finitely many poles (8.3) is a rational function, subtract off the principal parts and
  apply the maximum principle to the remainder;
- a nonconstant holomorphic `β : X → OnePoint ℂ` induces a field embedding
  `ℂ(t) = M(OnePoint ℂ) ↪ M(X)` by composition.

**New object: `M(X)`.** Basic API: the field instance; the `ℂ`-algebra structure; the order
`ord_x f ∈ ℤ` at each point (from `analyticOrderAt` in a chart, negative at poles), with
`ord_x(fg) = ord_x f + ord_x g`; the divisor of `f` as a finitely supported function
(finiteness from compactness); functoriality along nonconstant holomorphic maps; and the
comparison with the pin's `MeromorphicOn` vocabulary in each chart.

⚠ **What compactness actually buys.** It is *not* that the constants change: on any
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
  1. **Point separation.** ModularForms Layer 10B's Riemann–Roch chain produces, for any two
     distinct points `x ≠ y` of `X`, a meromorphic function with a pole at `x` and none at
     `y`: `ℓ(D)` grows with `deg D`, so for `D` of large degree `L(D)` has a function that
     `L(D − x)` does not.
  2. **Fiber separation.** A *single* function separating all `n` points of one unbranched
     fiber `{x₁, …, x_n}` is assembled from the `n(n−1)/2` pairwise separators `f_{ij}` by a
     **generic linear combination**: the set of `(c_{ij}) ∈ ℂ^{n(n−1)/2}` for which
     `f := Σ c_{ij} f_{ij}` fails to separate some pair is a finite union of proper linear
     subspaces, hence proper, so some choice works. State the genericity argument as its own
     lemma; "apply the separator finitely many times" is not a construction, because
     different pairs need different functions.
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
`[ℂ(f) : M(S)] ≤ deg f` by the elementary symmetric functions of the fibre values — and
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

*Prerequisites:* Layers 8.2, 8.3, 9.2; ModularForms Layer 10B (i)–(iv).

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
  exactly `−1`, hence `ord_x` is onto. Cite ModularForms Layer 10B(iii)'s Riemann–Roch and
  10B(i)'s `𝒪_D` for the strict-growth statement, or state the "function with prescribed
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
- the analytic genus (ModularForms 10B) equals AlgebraicCurves' genus: the two `L(D)` spaces
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

*Prerequisites:* Layers 9.1–9.4; AlgebraicCurves Layers 3, 5, 12; ModularForms Layer 10B.

#### 9.6 The local comparison at a place

The bridge that makes 9.7 possible, and the one an "algebraic unramifiedness implies the
plane model fills in" argument silently assumes. It is local, it is about **one** point of
the base, and it is the algebraic-to-analytic ramification theorem in the exact form this
roadmap needs.

*Setting.* Let `p ∈ OnePoint ℂ`, let `s` be the pinned local coordinate at `p` (`t − p` at a
finite point, `1/t` at `∞`), let `D` be a disc about `p` in that coordinate with `D* = D ∖ {p}`,
and let `m ∈ 𝒪(D)[y]` be monic of degree `n`, separable over `K := Frac(𝒪(D))`, with
`disc m` vanishing at most at `p`. Write

```text
A := K[y]/(m) ,       a finite separable K-algebra of dimension n.
```

⚠ **`A` is an algebra, not a field, and the theorem must be stated for it.** A separable
polynomial need not be irreducible, so `𝒪(D)[y]/(m)` need not be a domain and "the fraction
field of `𝒪(D)[y]/(m)`" need not exist. Nor may irreducibility simply be assumed here: `m` is
the restriction to `D` of a globally irreducible equation, and it factors over `K` exactly
when `p` has several places — the case the theorem exists to describe. By separability `A`
splits as a finite product of finite separable field extensions

```text
A ≅ F_1 × ⋯ × F_r ,      Σ_j [F_j : K] = n ,
```

one factor per monic irreducible factor of `m` over `K`, and "a place of `A` over `p`" below
means a place of one of the `F_j` over `p`. When `m` is irreducible, `r = 1` and `A = F` is
the field the earlier phrasing intended.

*Statements, in proof order.*

1. **The smooth part is a covering.** `V := {(s, y) ∈ D* × ℂ | m(s, y) = 0}` with the first
   projection is a degree-`n` covering map, by the holomorphic implicit function theorem at
   each of the `n` simple roots.
2. **Its components are the local models.** By 7.1 each connected component `W_i` of `V` is
   isomorphic over `D*` to `z ↦ z^{d_i}`, with `Σ d_i = n`, and the local monodromy is the
   product of the corresponding `d_i`-cycles.
3. **Each component is a place, with `e = d_i`.** On `W_i ≅ 𝔻*` the coordinate `y` is
   bounded, because it satisfies a monic equation with coefficients holomorphic on `D`, so
   it extends holomorphically across the puncture; the resulting `ℂ((s))`-embedding
   `A → ℂ((z))` with `s = z^{d_i}` kills all but one factor `F_j` — its kernel is a maximal
   ideal, since `ℂ((z))` is a field — and so is a place of that `F_j` over `p`. Its
   ramification index is
   **exactly** `d_i`, not a proper divisor: the `n` points over a given `s ∈ D*` have
   distinct `y`-coordinates, so no nontrivial deck transformation of `W_i` fixes `y`, and
   the image is contained in no `ℂ((z^k))` with `k > 1`.
4. **The assignment is a bijection.** Distinct components give distinct places, again because
   `y` separates the points of a fiber; and since every residue field is `ℂ`, all residue
   degrees are `1`, so the fundamental identity, summed over the factors, reads
   `Σ_j Σ_{P′ | p, P′ of F_j} e(P′|p) = Σ_j [F_j : K] = n = Σ d_i` (AlgebraicCurves Layer 6).
   Injectivity plus equal totals forces surjectivity. **So the multiset of local monodromy
   cycle lengths at `p` is the multiset of ramification indices of the places of `A` over
   `p`**, and the partition of the components by which factor `F_j` they hit is the
   factorization of `m` over `K`.
5. **The unramified case.** In particular, `A` is unramified over `p` iff every `d_i = 1`,
   iff the local monodromy at `p` is trivial, iff the covering of 1 extends to a covering of
   `D`. This is the step 9.7 uses at the points of `Δ ∖ {0,1,∞}`.
6. **Agreement of indices.** Combining with 8.2, the analytic `ramificationIndex` at the
   point of the filled surface coming from `W_i` equals the algebraic `e(P′|p)` of the
   corresponding place. This is the statement Layers 9.7 and 9.8 export.

⚠ **Normalization is what is being constructed, and it is not the plane model.** The plane
locus `{m = 0}` over all of `D` is generally **singular** at `p` — several branches may
cross, and the fiber over `p` may have fewer than `r` points — so no removable-singularity
argument makes it a Riemann surface. What 3 constructs is one point per **component of the
punctured preimage**, that is one point per place, which is exactly the normalization; the
map from it to the plane locus is finite and is injective off the singular points only.
⚠ Nor does the *conclusion* of 9.1 substitute for this theorem: unramifiedness of the field
extension is a statement about places, and it becomes a statement about the covering only
through 4.

*Prerequisites:* Layers 7.1, 7.2, 8.2; AlgebraicCurves Layers 0, 6; Mathlib holomorphic
implicit function theorem, removable singularities, `Polynomial.discriminant`.

#### 9.7 Analytification of an algebraic pair

For an algebraic Belyi pair `(F, ℂ(t) ↪ F)` over `ℂ`, construct an analytic pair and prove
the two constructions inverse. Route, in proof order:

1. **A primitive element.** `F = ℂ(t)[y]/(m)` for a monic irreducible `m ∈ ℂ(t)[y]` of degree
   `n` — characteristic zero, so the extension is separable and the primitive element theorem
   applies. Clearing denominators, the coefficients are holomorphic off a finite set.
2. **The affine analytic model.** Let `Δ ⊂ OnePoint ℂ` be the finite set of poles of the
   coefficients of `m`, the zeros of its discriminant, and the three marked points. Over
   `OnePoint ℂ ∖ Δ` the vanishing locus of `m`, with the first projection, is a degree-`n`
   covering map (9.6, statement 1, applied on a disc about each point of the complement).
3. **Extension over the unmarked bad points.** At each `p ∈ Δ ∖ {0,1,∞}`, 9.1 says `F` is
   unramified over `p`, so by **9.6 statement 5** the local monodromy at `p` is trivial and
   the covering extends across `p` as a covering. Iterating over the finitely many such `p`
   gives a covering map over `OnePoint ℂ ∖ {0,1,∞}`. ⚠ 9.6 is load-bearing here and cannot
   be replaced by "fill the discriminant fibers with all `e = 1` by removability": the plane
   model is singular at such a point, and removability is a statement about functions, not
   about the local structure of a possibly singular curve.
4. **Compactification.** Layers 7.2–7.4 and 8.5 compactify to an analytic Belyi pair, with
   the local degrees at the three marked points given by 9.6 statement 4 applied at `0`, `1`
   and `∞`.
5. **Identification of the field.** Its meromorphic field is `F` over `ℂ(t)`: both are
   degree-`n` extensions generated by `y`, and 9.3 makes the comparison a
   `ℂ(t)`-isomorphism.
6. **Agreement of everything else.** Ramification indices agree by 9.6 statement 6; the
   points of the surface correspond to the places of `F` by 9.4; degrees, divisors and
   automorphism groups follow.

Conclude the equivalence: `9.5` and `9.7` are mutually inverse on isomorphism classes, so
analytic Belyi pairs over `ℂ` and algebraic Belyi pairs over `ℂ` are the same objects. This
is the GAGA-sized statement of the roadmap, proved at exactly Belyi generality and no
further.

⚠ *Nearby false statement:* step 2's covering property holds only off the discriminant. A
milestone that takes the vanishing locus of `m` over all of `OnePoint ℂ ∖ {0,1,∞}` and calls
it a cover is wrong wherever the discriminant vanishes, even though 9.1 guarantees the
*final* map is unramified there — the resolution is step 3, and step 3 is 9.6.

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

> **Owner:** successor roadmap `BelyiAlgebraicAndDescent`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

Its final declaration may be added only after the typed Layer-9 chain visibly supplies
compactification, the meromorphic function field, algebraization, and descent to `ℚ̄`.

The classical statement is an equivalence, and `BelyiAlgebraicAndDescent` builds both directions
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
on, and the computation of `BranchValues` of a rational function as the image of the zeros
of its derivative together with the images of the poles of order `> 1`. This bookkeeping is
used at every step below and is stated once.

*Prerequisites:* Layer 9.1; AlgebraicCurves Layer 6 (ramification in towers); Layer 8.2 for
the analytic form.

#### 10.2 The degree-reduction step

For a finite set `S ⊂ ℙ¹(ℚ̄)` not contained in `ℙ¹(ℚ)`, let `α ∈ S` have maximal degree
`d > 1` over `ℚ` and let `m ∈ ℚ[x]` be its minimal polynomial. Then `m` maps `S` to a set
whose points have degree `< d`, or degree `d` but fewer of them, at the cost of adjoining the
critical values of `m` — which have degree at most `d − 1`, since they are values of `m` at
roots of `m′`, a polynomial of degree `d − 1` over `ℚ`.

State the induction with its well-founded measure explicitly, and state **first** that the
set is taken `Gal(ℚ̄/ℚ)`-stable: the measure is `#S` for an `S` closed under conjugation
over `ℚ`, and the step replaces `S` by `m(S) ∪ Crit(m)`, which is again `Gal(ℚ̄/ℚ)`-stable
because `m` has rational coefficients. Without stability the cardinality count is not
available — `m` collapses a full conjugacy orbit of size `d` to a single point precisely
because the orbit is the root set of `m`. Iterating, every finite `S ⊂ ℙ¹(ℚ̄)` is carried
into `ℙ¹(ℚ)` by a composite of rational functions defined over `ℚ`, whose branch values are
also carried into `ℙ¹(ℚ)`.

*Source:* Köck, "Belyi's theorem revisited", **(3.5) Lemma**. ⚠ **His well-founded measure
is `#S` for `S` closed under conjugation over `ℚ`** — the cardinality of the set, not a field
degree — and it drops because the critical values contributed by `m` number at most
`deg m − 1`. Do not substitute "the degree of the field generated by `S`": that does not
decrease at each step, which is the defect Köck's induction exists to repair.

⚠ **Two gaps in the source that are proof obligations here, not citations.** Köck's (3.6)
applies the induction hypothesis to the image set without showing that its cardinality has
dropped (true, but unwritten), and states its hypothesis as `T ⊆ ℚ` where the previous step
supplies `Crit(p) ∪ p(S) ⊆ ℚ ∪ {∞}`. This milestone owns both: the cardinality bookkeeping
is part of the induction, and the `∞` is handled by the Möbius normalization of 10.3.

*Prerequisites:* Layer 10.1; Mathlib `minpoly`, `Polynomial.derivative`,
`Polynomial.roots`.

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
three critical values lie in `{0,1,∞}` from the containment, not from equality — the
constant is chosen precisely to make the value at `m/(m+n)` equal `1`.

Then, by induction on `#S` for a finite `S ⊂ ℙ¹(ℚ)`: applying a Möbius transformation over
`ℚ` to send three chosen points of `S` to `0, 1, ∞` and a suitable `B_{m,n}` to absorb a
fourth, every finite `S ⊂ ℙ¹(ℚ)` is carried into `{0,1,∞}` by a composite of rational
functions over `ℚ` whose critical values lie in `{0,1,∞}`.

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
for every finite S ⊂ ℙ¹(ℚ̄) with ∞ ∈ S there is a POLYNOMIAL q ∈ ℚ[x] with
    q(∞) = ∞  and  Crit(q) ∪ q(S ∖ {∞}) ⊆ {0, 1, ∞} .
```

Route: 10.2's degree reduction already uses minimal polynomials, which are polynomials and
send `∞ ↦ ∞`; the induction above is then run with **affine** normalizations `x ↦ ax + b`
over `ℚ` only, choosing among three rational points the least and the greatest **in the real
order on `ℚ`** to go to `0` and `1`, so that the third lands in the open interval `(0,1)`
and is `m/(m+n)` with `m, n` **positive** coprime integers — which is exactly the condition
making `B_{m,n}` a polynomial rather than a rational function. Composites of polynomials are
polynomials, and `∞` remains a critical value at every stage.

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

#### 10.6 Finiteness in bounded degree, and the moduli field is a number field

Over an algebraically closed field of characteristic zero — used at `ℚ̄` and at `ℂ` — there
are finitely many isomorphism classes of algebraic Belyi pairs of degree `n`. Over `ℂ` this
is Layer 9.8 plus 8.6 plus Layer 3.1: classes inject into isomorphism classes of degree-`n`
triples, of which there are finitely many. Over `ℚ̄` it follows by base change to `ℂ`
(AlgebraicCurves Layer 8 makes the base change fully faithful in characteristic zero, so the
injection on isomorphism classes is preserved).

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

*Prerequisites:* Layers 3.1, 5.6, 8.6, 9.8, 10.5; AlgebraicCurves Layer 8.

#### 10.7 Belyi pairs descend to `ℚ̄`

Every algebraic Belyi pair over `ℂ` is the base change of one over a number field, hence of
one over `ℚ̄`. **The route is Köck's, and it is an explicit construction of a model, not a
descent datum.** In proof order:

1. **A rational unbranched value.** Choose `Q ∈ ℙ¹(ℚ)` that is not a critical value of `t`
   — possible since the critical values are three and `ℙ¹(ℚ)` is infinite — and a place `P`
   of `F` over `Q`.
2. **A generator with a single pole.** Riemann–Roch on the divisor `(g + 1)·[P]`
   (AlgebraicCurves Layer 5) gives `z ∈ F ∖ ℂ` whose only pole is `P`. Then `F = ℂ(t, z)`:
   the extension `F/ℂ(t, z)` is a subextension of both `F/ℂ(t)`, which is unramified at `P`,
   and `F/ℂ(z)`, which is totally ramified there, so its degree is `1`.
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
   `k` of `M(F, t)`, which is a number field by 10.6. So `F = ℂ ⊗_k (k(t)[Z]/(minpoly))`,
   an algebraic Belyi pair over `k`, and base-changing to `ℚ̄` gives one over `ℚ̄`.

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
which this roadmap has; the private provenance ledger records the specialization-and-pigeonhole route as
rejected for exactly that reason.

*Source:* Köck **(2.2) Theorem** for steps 1–5 — "the curve `X/C` and the morphism `t` are
defined over a finite extension of `M(X, t)`, and over `M(X, t)` itself if `t` is a Galois
covering" — and **(3.3) Theorem** for the assembly with 10.6. ⚠ Köck's (2.2) needs neither
his (1.8) (which he cites without proof) nor Weil descent: the general case is the explicit
`z` above plus 10.5 statement 3, and his (1.9) Weil criterion enters only in his §1 material
on the *absolute* moduli field, which this roadmap consumes at Layer 11.4 for a different
purpose.

*Prerequisites:* Layers 9.1, 9.5–9.8, 10.4–10.6; AlgebraicCurves Layers 5, 6.

#### 10.8 Acceptance examples

- `ℙ¹` with `t^n`, defined over `ℚ`.
- A genus-one pair over `ℚ̄`: `torusTriple` realized algebraically, with its curve exhibited.
- A curve presented without a three-point map — an explicit plane quartic — carried through
  10.2, 10.3 and 10.4, with the intermediate branch sets recorded at each step.
- A pair whose field of moduli is *not* used as a field of definition without proof, with the
  pointer to Layer 11.6.

*Prerequisites:* Layers 10.4, 10.7.

### Layer 11: fields of moduli, fields of definition, and Galois orbits

> **Owner:** successor roadmap `BelyiAlgebraicAndDescent`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

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

#### 11.4 Weil descent for function fields

Galois descent in the setting this roadmap needs, built here rather than cited: for a number
field `k` and a Belyi pair over `ℚ̄`, a **descent datum** relative to `k` is a family of
isomorphisms `f_σ` from the `σ`-conjugate pair to the pair, for `σ ∈ Gal(ℚ̄/k)`, satisfying
the cocycle condition `f_{στ} = f_σ ∘ σ(f_τ)` and locally constant in `σ` (it factors through
a finite quotient, which is automatic here because the pair is defined over a number field).

Prove effectiveness: a descent datum produces a model over `k` together with a base-change
isomorphism.

⚠ **`F` is not a finite-dimensional `k`-vector space**, so "descend `F` as a `k`-vector
space" is not a descent step at all: `F` has transcendence degree `1` over `k`, and finite
Galois descent applies only to finite-dimensional data. The route is to descend at a
**finite Galois level, relative to the rational function field**:

1. **Reduce to a finite level.** The datum factors through `Gal(L/k)` for a finite Galois
   `L/k` inside `ℚ̄`, and 10.7's model is already defined over a number field, so there is a
   finite Galois `L/k` and a model `F_L` over `L`, with `F = ℚ̄ ⊗_L F_L` and `F_L` a
   **finite-dimensional `L(t)`-algebra** — of dimension the degree `n`.
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
   ⚠ None of the last three is formal — an invariant subalgebra of a field need not be a
   field without the base-change isomorphism, and exact constants can grow under descent.

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

⚠ **Signature requirement for the successor:** no theorem concluding that the field of moduli
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
triples, hence the *same* Belyi-pair isomorphism class; the private provenance ledger records witnesses in
the frozen database.

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

### Layer 12: profinite powers, the fundamental group, and the branch-cycle theorem

> **Owner:** successor roadmap `BelyiArithmeticActions`; milestones 12.1–12.3 and 12.7 are
> generic and belong to `ProfiniteArithmetic`. Retained here as a dependency specification; no
> milestone of this layer is a declaration or a completion claim of this PR.

`BelyiArithmeticActions`, the successor that owns this layer, consumes three milestones of
generic profinite algebra — the profinite integers as a **ring**, the exponentiation calculus, and
its pro-`ℓ` specialization. Their exact owner is **`ProfiniteArithmetic`**, the generic successor
to #244 named in that roadmap's opening section; they are owned neither by #244 itself, which
builds `zHat` only as a profinite group, nor by this roadmap. They must land there before the
Belyi-specific declarations in 12.4 onward are opened.

The fundamental group's carrier is field-theoretic: the Galois theory of the maximal
extension of `ℚ̄(t)` unramified outside the three marked places. Every object is then Mathlib Galois theory plus
AlgebraicCurves ramification, and no étale fundamental group of a scheme is used or built —
the comparison with a scheme-theoretic `π₁` is an explicit scope exclusion. The pin's
Galois-category machinery is available for classification statements and is cited where it
shortens one, but it is not the definition.

#### 12.1 The profinite integers as a topological ring

⚠ **Supplier milestone, not a Belyi declaration.** ProfiniteProPGroups supplies the
profinite completion of the infinite cyclic **group** and its maximal pro-`p` quotients.
That gives no multiplication of two profinite exponents, no unit group, and no compatible
projections to finite rings — yet 12.2's law `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a·b)`, 12.10's character
`χ : Gal(ℚ̄/ℚ) →* ẑˣ` and 12.3's `ℓ`-adic component all need exactly those. `ProfiniteArithmetic`
must build them in the generic `TauCeti/GroupTheory/Profinite/` home; `BelyiArithmeticActions`
only consumes its exact exported API.

**Supplier object: `ProfiniteInt`.** Constructed in `ProfiniteArithmetic` as `lim (ZMod n)` over
the divisibility order. `BelyiArithmeticActions` cites the name and API, not the construction.
Required:

- *Carrier and instances.* A topological commutative ring structure: `CommRing ProfiniteInt`,
  `TopologicalSpace`, `IsTopologicalRing`, compactness, total disconnectedness, and
  `T2Space`.
- *The group comparison.* A `ContinuousMulEquiv` between the additive/procyclic group of
  `ProfiniteInt` and ProfiniteProPGroups' `zHat`, so that `ẑ` in this roadmap means one object with
  two structures and no milestone silently switches. State it as a named theorem, not as a
  definitional identification.
- *Projections.* Continuous ring homomorphisms `ProfiniteInt →+* ZMod n` for every `n`, with
  the compatibility `ZMod m → ZMod n` for `n ∣ m`; the induced map to the inverse limit is
  an isomorphism (the universal/limit property).
- *`ℓ`-adic components.* A continuous ring homomorphism `ProfiniteInt →+* ℤ_[ℓ]` for each
  prime `ℓ`, compatible with the `ZMod ℓ^k` projections, and the theorem that the induced
  map to `∏_ℓ ℤ_[ℓ]` is a topological ring isomorphism.
- *Units.* The unit group `ProfiniteIntˣ` with its topology, and the criterion
  `a ∈ ProfiniteIntˣ ↔ ∀ n, image of a in ZMod n is a unit ↔ ∀ ℓ, component_ℓ a ∈ ℤ_[ℓ]ˣ`.
- *The universal property for characters.* A compatible system of homomorphisms into
  `(ZMod n)ˣ` assembles into one homomorphism into `ProfiniteIntˣ`; this is what 12.10 uses
  to build the cyclotomic character out of the pin's finite levels.
- *Edge cases.* `ProfiniteInt` is not a domain (it is `∏_ℓ ℤ_[ℓ]`); `ℤ → ProfiniteInt` is
  injective with dense image.

*Prerequisites:* Mathlib `ZMod`, `PadicInt`, `ProfiniteGrp`, inverse limits of topological
rings; ProfiniteProPGroups Layers 0, 4 for `zHat` and its group API.

#### 12.2 The profinite exponentiation calculus

Owned with 12.1 by `ProfiniteArithmetic` and exported from the generic profinite
namespace. Neither this supplier milestone nor the next mentions Belyi maps.

Carrier: `ẑ := ProfiniteInt` of 12.1, whose underlying procyclic group is ProfiniteProPGroups' `zHat`
by 12.1's comparison. For a profinite group `G` and `x : G`, define `x ^ᶻ a` for `a : ẑ` as
the image of `a` under the unique continuous homomorphism `ẑ → G` sending `1` to `x` — the
completion's universal property applied to `n ↦ xⁿ`, which lands in the closed procyclic
subgroup generated by `x`.

**New object: `^ᶻ`.** Basic API:

- *Constructors and instances.* The definition; the closed procyclic subgroup `⟨x⟩‾` and the
  fact that `x ^ᶻ a` lies in it.
- *Examples.* `x ^ᶻ (n : ℤ) = x ^ n`; `x ^ᶻ 0 = 1`; `1 ^ᶻ a = 1`; in `ẑ` itself, `^ᶻ` is
  multiplication.
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

*Prerequisites:* Layer 12.1; Mathlib `ProfiniteGrp.profiniteCompletion` with `lift` and the
adjunction; ProfiniteProPGroups Layers 0, 4 for `zHat` and its API.

#### 12.3 Pro-`ℓ` powers and the component comparison

On a pro-`ℓ` group the power depends only on the `ℓ`-adic component of the exponent. Using
ProfiniteProPGroups Layer 4's `maximalProPQuotient_zHat_equiv_padicInt`, define the
`ℤ_ℓ`-power `x ^[ℓ] u` for `u : ℤ_[ℓ]` on a pro-`ℓ` group, prove it satisfies the same laws
as 12.2, and prove the comparison

```text
x ^ᶻ a = x ^[ℓ] (component_ℓ a)
```

by factoring the powering homomorphism `ẑ → G` through the maximal pro-`ℓ` quotient of `ẑ`
— legitimate by ProfiniteProPGroups Layer 3's universal property, since `G` is pro-`ℓ` — and
identifying that quotient with `ℤ_[ℓ]` compatibly with 12.1's component map, so that
`component_ℓ` here is the ring homomorphism of 12.1 and not a second unrelated projection.

⚠ Every statement in this milestone and every consumer of `^[ℓ]` below carries
`[Fact ℓ.Prime]`; `ℤ_[ℓ]` and the maximal pro-`ℓ` quotient are not the intended objects
otherwise.

⚠ *Nearby false statement:* the factorization uses that the *target* is pro-`ℓ`. On a
general profinite group the `ℓ`-adic component of `a` does not determine `x ^ᶻ a`, and no
milestone applies `^[ℓ]` outside a pro-`ℓ` group.

*Prerequisites:* Layers 12.1, 12.2; ProfiniteProPGroups Layers 3, 4; Mathlib `Fact`, `PadicInt`.

#### 12.4 The `ℚ̄`/`ℂ` comparison of finite covers

Base change along a fixed embedding `ℚ̄ ↪ ℂ` is an equivalence from algebraic Belyi pairs
over `ℚ̄` to algebraic Belyi pairs over `ℂ`: essentially surjective by 10.7, fully faithful
by AlgebraicCurves Layer 8 (constant-field extension in characteristic zero), and
compatible with degree, ramification partitions, and automorphism groups. Composing with
9.5–9.8 and Layer 6.3's **level 2**, isomorphism classes of Belyi pairs over `ℚ̄` biject
with `IsoClass n` restricted to connected triples. ⚠ Level 2 throughout: an algebraic Belyi
pair carries no fiber numbering, so no literal triple is attached to it, and every statement
of Layers 11–14 about "the triple of a pair" means its simultaneous-conjugacy class.

⚠ *Nearby false statement:* full faithfulness is a theorem about *constant* field
extension in characteristic zero, and it is what makes the triple of a `ℚ̄`-pair
well-defined. Without it, a pair could acquire extra automorphisms over `ℂ` and the
correspondence would only be a surjection.

*Source:* Szamuely, *Galois Groups and Fundamental Groups*, **Theorem 4.6.10** — for an
extension `k ⊂ L` of algebraically closed fields of characteristic `0`, base change is an
equivalence between the finite covers étale over `U` and those étale over `U_L`, so
`π₁(U_L) ≅ π₁(U)` — with **Corollary 4.6.11**. That is this milestone at the level of
fundamental groups; the statement here is at the level of Belyi pairs, and 10.7 is what
supplies essential surjectivity in that form.

*Prerequisites:* Layers 6.3, 9.5–9.8, 10.7; AlgebraicCurves Layer 8.

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

1. **The topological Galois category.** The category of finite covers of `U` (Layer 6.1's
   unnumbered carrier), with the fiber functor `Fib_b : E ↦ p ⁻¹' {b}` to finite sets. Prove
   it satisfies the pin's `PreGaloisCategory` and `FiberFunctor` axioms.
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

*Prerequisites:* Layers 5.6, 6.1, 6.3, 12.4, 12.5; ProfiniteProPGroups Layers 0, 4; Mathlib
`PreGaloisCategory`, `FiberFunctor`, `functorToContAction`, `IsFundamentalGroup` with
`toAutMulEquiv`, the profinite topology on `Aut F`, `ProfiniteGrp.profiniteCompletion` with
its adjunction.

#### 12.7 Continuous outer automorphisms

Another generic `ProfiniteArithmetic` supplier milestone, placed in the generic profinite
namespace so that it is reusable. `BelyiArithmeticActions` consumes it for the outer action and
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

#### 12.8 The arithmetic extension and the outer action

`Ω/ℚ(t)` is Galois, and restriction gives the exact sequence

```text
1 → π₁ᵍᵉᵒ → Gal(Ω / ℚ(t)) → Gal(ℚ̄ / ℚ) → 1 ,
```

the surjectivity on the right being that `ℚ̄` and `ℚ̄(t)` are linearly disjoint over `ℚ(t)`
— `t` is transcendental — so `Gal(ℚ̄(t)/ℚ(t)) ≅ Gal(ℚ̄/ℚ)`. Applying 12.7's
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
orientation is what fixes which of the two generators of a procyclic group is meant, once a
system of roots of unity is fixed, and the milestone proves that compatibility rather than
assuming it. ⚠ **Stated on classes, not on elements**: there is no canonical element of
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

Assemble the pin's `modularCyclotomicCharacter n`, over all `n`, into the continuous

```text
χ : Gal(ℚ̄/ℚ) →* ẑˣ
```

on Layer 12.2's carrier, with the finite-level specification `σ ζ = ζ ^ χ_n(σ)` for every
`n`-th root of unity, and with `ℓ`-adic components equal to the pin's
`cyclotomicCharacter ℓ`. The compatibility across levels is the milestone; the pin supplies
each level separately.

*Source:* Szamuely **Example 4.7.4** constructs exactly this character, as
`Gal(k̄|k) → Aut(ẑ) ≅ ẑ^×` obtained from the compatible system of actions on the Kummer
layers, and names it the cyclotomic character. The pin supplies the finite levels; the
compatibility across levels is the milestone.

*Prerequisites:* Layer 12.1 (the ring `ẑ`, its unit group, and the universal property that
assembles a compatible system of maps into `(ZMod n)ˣ` into one map into `ẑˣ`); Mathlib
`modularCyclotomicCharacter`, `cyclotomicCharacter`.

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

⚠ *Nearby false statement:* the statement is about conjugacy classes. There is no `σ` for
which `ρ(σ)` sends `P` to `P^{χ(σ)}` on the nose — that would require a canonical lift, and
Layer 13.3 obtains an actual automorphism only with conjugators, one per generator, which
need not agree.

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
**non-inverted** exponent, matching the Kummer computation above. ⚠ Three citation traps,
each recorded in the private provenance ledger: the formula is in §7 and **not** in §3.3, which only sets
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

For a connected triple `t` with monodromy group `G` of exponent `n`, and its Belyi pair over
`ℚ̄` via 12.4, let `u = χ_n(σ)`, a unit mod `n`. Write `t^σ = (τ0, τ1, τinf)` for the triple
of the `σ`-conjugate pair, in some numbering. Then:

- `τ0` lies in the `S_n`-conjugacy class of `σ0 ^ u`, and likewise `τ1` of `σ1 ^ u` and
  `τinf` of `σinf ^ u`;
- `t^σ` is itself a connected triple, so `τinf · τ1 · τ0 = 1`, and its monodromy group is
  conjugate to `G`;
- equivalently: `σ` carries the Nielsen class with class datum `(C0, C1, Cinf)` to the
  Nielsen class with datum `(C0^u, C1^u, Cinf^u)`, where `C^u` is the class of the `u`-th
  powers.

⚠ **There is in general no simultaneous conjugator** carrying `t^σ` to the componentwise
tuple `(σ0^u, σ1^u, σinf^u)`, because **that tuple is usually not a triple at all**:
independently powering three elements of a nonabelian group destroys the product relation.
For `σ0 = (0 1 2)`, `σ1 = (0 1)`, `σinf = (1 2)` in `S₃` — which satisfies
`σinf·σ1·σ0 = 1` — and `u = 5`, the componentwise fifth powers give
`(1 2)·(0 1)·(0 2 1)`, which sends `0 ↦ 1`. `Suggested.lean` carries this as a
`decide`-checked counterexample. The class-by-class form above is what the branch-cycle
theorem gives, and it is all it gives.

⚠ Fried's (5.2) is likewise a statement about **conjugacy classes** and never about chosen
representatives, and the conjugating element it produces lies in `N_{S_n}(G)` — the same
normalizer Layer 1.3 identifies as acting on generating triples. Layer 14.2's record-level
translation is where representatives are finally chosen, by the database rather than by
mathematics.

**Passport invariance** follows from the class-by-class form alone. Along a Galois orbit the
degree, the three full cycle types, the genus, the conjugacy class of the embedded monodromy
group, the abstract monodromy group, primitivity, and the geometry type are constant. Each
is a separate small proof: the cycle types because `u` is a unit mod the order of each
element, so `x ↦ x^u` preserves cycle type, and conjugation preserves it too; the monodromy
group because `⟨σ0^u, σ1^u⟩ = ⟨σ0, σ1⟩` for `u` invertible mod the exponent; genus from
cycle types by Layer 0.6; primitivity and geometry type because they are functions of the
preceding data. Therefore each Galois orbit is contained in a single passport, completing
Layer 11.2's partial statement.

⚠ *Nearby false statement:* the converse fails, and its failure is the reason a passport is
not a Galois orbit — the frozen `5T1-5_5_5` passport in the private provenance ledger has one passport
and three orbits. Layer 14 never treats `pass_size` and `orbit_size` as the same datum.

*Prerequisites:* Layers 0.5, 0.6, 1.1, 1.4, 11.1, 12.11.

### Layer 13: the pro-`ℓ` peripheral theorem and faithfulness

> **Owner:** successor roadmap `BelyiArithmeticActions`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

#### 13.1 The pro-`ℓ` peripheral triple

For a **prime** `ℓ` — every statement of Layer 13 carries `[Fact ℓ.Prime]`, since neither
`maximalProPQuotient` nor `ℤ_[ℓ]` is the intended object otherwise — define
`Δ_ℓ := ProfiniteProPGroups.freeProP ℓ (Fin 2)` directly, with `P_ℓ, T_ℓ, C_ℓ` the images
of the supplier's canonical generators and the relation `C_ℓ * T_ℓ * P_ℓ = 1`. The
supplier defines this carrier as the maximal pro-`ℓ` quotient of the free profinite group;
this roadmap neither redefines that quotient nor introduces an isomorphic replacement.

The outer action descends: `proPKernel ℓ` is topologically characteristic (ProfiniteProPGroups Layer
3), so 12.7's functoriality gives

```text
ρ_ℓ : Gal(ℚ̄/ℚ) →* ContinuousOut (Δ_ℓ) ,
```

and 12.11's statements descend with `^ᶻ` becoming `^[ℓ]` by 12.3.

*Prerequisites:* Layers 12.7, 12.11, 12.2, 12.3; ProfiniteProPGroups Layers 3, 4.

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

For every prime `ℓ` and every `u ∈ ℤ_[ℓ]ˣ` there exist a continuous automorphism `φ_u` of
`Δ_ℓ` and elements `c_P, c_T, c_C` with

```text
φ_u P_ℓ = c_P⁻¹ · (P_ℓ ^[ℓ] u) · c_P ,
φ_u T_ℓ = c_T⁻¹ · (T_ℓ ^[ℓ] u) · c_T ,
φ_u C_ℓ = c_C⁻¹ · (C_ℓ ^[ℓ] u) · c_C .
```

Proof: choose `σ` with `cyclotomicCharacter ℓ σ = u` (13.2); take `ρ_ℓ(σ)` (13.1) and any
representative automorphism `φ_u` of that outer class; the three conjugacy statements of
12.11, descended by 13.1, say exactly that each `φ_u(X_ℓ)` is conjugate to `X_ℓ ^[ℓ] u`, and
the conjugators are the witnesses.

⚠ **The three conjugators are independent.** Nothing asserts `c_P = c_T = c_C`; a single
conjugator would say `φ_u` is inner-times-the-power-map on the whole group, which is false.

⚠ The assignment `u ↦ φ_u` is **not** asserted to be a homomorphism, to be continuous, or to
be canonical. Each is a strictly stronger statement and each is outside this roadmap.

**The conjugation-transfer lemma**, stated generically because the conjugator is *computed*,
not adjusted by inspection. Let `φ` be a continuous automorphism, `u` an exponent, and suppose

```text
φ x = c⁻¹ · (x ^ u) · c .
```

Then for any conjugate `y = q · x · q⁻¹`,

```text
φ y = d⁻¹ · (y ^ u) · d   with   d := q · c · (φ q)⁻¹ .
```

The proof is `φ y = (φ q)(φ x)(φ q)⁻¹`, then naturality of the power under conjugation
(12.2); the conjugator involves `φ q`, and is **not** obtained by multiplying `c` by `q` on
one side.

Applying it with `q = P_ℓ` and `x = C_ℓ` transfers the theorem to the opposite-convention
third element `(P_ℓ · T_ℓ)⁻¹ = P_ℓ · C_ℓ · P_ℓ⁻¹`, so consumers using that spelling need no
new mathematics.

*Prerequisites:* Layers 12.2, 13.1, 13.2.

#### 13.4 The dyadic instance

The specialization to `ℓ = 2`, stated as its own named theorem with `u : ℤ_[2]ˣ` on
`Δ_2 = freeProP 2 (Fin 2)`. It is the reusable dyadic peripheral-power statement; nothing in
its statement or its proof mentions anything outside this roadmap.

*Prerequisites:* Layer 13.3.

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
   and read off `c = α_m/β_m`, `d = α_0 − α_m β_0/β_m` for the leading and constant
   coefficients `α, β` of `H₁, H₂`.

⚠ **Nonconstancy of `G₁` and `G₂` is not decorative.** Without it the lemma is false in the
cheapest possible way: take `G₁ = G₂` a constant `c`, and `G₁ ∘ H₁ = c = G₂ ∘ H₂` holds for
*every* pair `H₁, H₂`, including normalized ones with `H₁ ≠ H₂`. The hypothesis is what makes
`deg(Gᵢ ∘ Hᵢ) = deg Gᵢ · deg Hᵢ` a usable equation at all.

⚠ **Characteristic zero is used**, not merely inherited from the ambient convention: the
coefficient recursion compares `G₁(H₂ + R)` with `G₁(H₂)` through the linear term
`G₁′(H₂)·R`, and needs `G₁′ ≠ 0`. In characteristic `p` that fails for `G₁ = x^p`, where
`G₁ ∘ H₁ = H₁^p` determines `H₁` only up to `p`-th powers.

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

### Layer 14: LMFDB assertion semantics

> **Owner:** successor roadmap `BelyiArithmeticActions`. Retained here as a dependency
> specification; no milestone of this layer is a declaration or a completion claim of
> this PR.

This layer says what a stored record asserts, mathematically. It certifies no database value
and asserts nothing about the completeness of the database. The schema it mirrors is frozen,
with its retrieval date, in the private provenance ledger; the milestones below cite that snapshot rather
than the live site.

#### 14.1 The passport record

A certificate structure whose fields mirror the frozen `belyi_passports` schema — `plabel`,
`deg`, `group`, `abc`, `a_s`/`b_s`/`c_s`, `g`, `geomtype`, `lambdas`, `pass_size`,
`num_orbits`, `maxdegbf`, `is_primitive`, `primitivization`, `aut_group`, `triples` —
together with a validity predicate tying each field to this roadmap's mathematics:

- `deg`, `lambdas`, `abc`, `g`, `geomtype` to the Layer 0.5–0.7 invariants of the passport
  (Layer 1.5);
- `group` to Layer 1.6's label semantics through PolynomialGaloisGroups;
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
- ⚠ **`geomtype` is not a function of the genus.** The frozen records include `g = 0` with
  `geomtype = "E"` and `g = 1` with `geomtype = "H"`. The field is exactly Layer 0.7's
  `geometryType`, computed from `1/a + 1/b + 1/c` against `1`, and the certificate ties it
  there and nowhere near `g`.
- **`pass_size` is a count of isomorphism classes, not of stored rows** — it is exactly
  Layer 1.2's `passportSize`, so the certificate ties it to Layer 3.4 and to nothing about
  the database's own row count. `orbit_size` is per-map, `num_orbits` is passport-only, and
  `maxdegbf`, despite its name, is the **maximum orbit size** in the passport.

*Prerequisites:* Layers 0.4–0.7, 1.1–1.6, 3.4, 11.7.

#### 14.2 The map-orbit record, and the translation of stored triples

A certificate for a single Galois orbit, mirroring the frozen `belyi_galmaps` schema. Its
distinctive content is three theorems, not a list of fields.

**The triple translation, proved.** The stored `triples`/`triples_cyc` satisfy
`σ0 * σ1 * σinf = 1` in Mathlib's multiplication — the LMFDB composes left to right — so the
stored data is the componentwise inverse of a triple in this roadmap's convention. The
milestone states that the Layer 0.1 involution is the translation, and that it preserves
every invariant the record asserts: degree, all three full cycle types, the monodromy group,
connectedness, the automorphism group, the genus, and the passport. The private provenance ledger records
the frozen records the translation was verified against, including which records are
symmetric under the swap and therefore cannot verify it.

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
- the field-of-definition certificate of Layer 11.5 gives a **surjection** from stored
  embedding entries onto the true orbit classes, by Layer 11.7's `G/H ↠ G/S`;
- ⚠ **that map need not be injective, so `r.orbit_size = trueOrbitSize c` is not asserted.**
  It requires a separate certificate — that `H = S`, equivalently that the stored base field
  is the field of moduli — which Layer 11.6 shows is not automatic. The private provenance ledger records
  frozen records where several stored embeddings yield simultaneously conjugate triples,
  hence one class.

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
| `group` / `nTj` | finite certificate | an **exact parser** for the `nTj` string and a proof that the parsed index's `referenceSubgroup` is conjugate to the passport's monodromy group (Layer 1.6) — not a string comparison |
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
counts the failure is exactly describable: `Σ_r storedEmbeddingCount r` counts stored
embedding entries, while `pass_size` counts simultaneous-conjugacy classes, and the map from
the former to the latter is surjective but not injective. It fails precisely when the
per-embedding triples of a single Galois orbit are simultaneously conjugate to one another;
The private provenance ledger records the two witnesses in the current database. A certificate that
assumed the sum formula would be unsound on real records.

*Prerequisites:* Layers 0.4, 1.2, 1.4, 1.6, 3.4, 9.1, 11.7, 14.1, 14.2.

#### 14.4 The tabulated `S₃` representative

The database does **not** tabulate one row per ordered passport. It chooses one ordered
passport from each `S₃`-orbit (Layer 2.6) and retains all simultaneous-conjugacy classes
inside that chosen ordered passport. This milestone certifies that convention, separately
from the intrinsic ordered passport, and refuses to manufacture a canonical choice.

- **The certificate.** A `TabulatedPassport` record carries a stored ordered passport
  together with a proof that it is admissible (Layer 1.1); the assertion it supports is
  membership in the `S₃`-orbit of a given ordered passport, and nothing stronger.
- **What is proved.** The stored classes are exactly the classes of the **stored** ordered
  passport — not of its orbit: the orbit generally contains other ordered passports with
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
degree, the `nTj` group through Layer 1.6, and the three partitions. Prove that a valid
record's label components agree with its certified invariants. ⚠ The trailing orbit letter
is an external enumeration of the Galois orbits inside a passport — carrier-only in 14.3's
classification — and is never derived from the mathematics; the frozen `5T1-5_5_5` passport,
whose three orbits carry the letters `a`, `b`, `c` in an order fixed by the database and not
by any invariant, is the witness.

*Prerequisites:* Layers 1.6, 14.1–14.4.

#### 14.6 The frozen acceptance suite

The five frozen records in the private provenance ledger — genus zero, positive genus, primitive,
imprimitive, a passport with three Galois orbits, and links to both an elliptic and a
genus-two curve — each carried through 14.1–14.5 at the highest certification level its data
admits. ⚠ The database itself is complete only through degree `6` by its own account, and
carries a handful of records its maintainers' own consistency script rejects; neither fact
affects what a certificate asserts, and both are reasons Layer 14 certifies records rather
than the database. Two of them, `6T6-6_6_3.3-a` and `3T1-3_3_3-a`, are related by `primitivization`, so
the pair also exercises Layer 1.4.

Reconcile the frozen degree-`≤ 4` table with Layer 3.5's proved classification: each of the
thirteen records matches exactly one enumerated isomorphism class, distinct records match
distinct classes, and the four imprimitive ones all primitivize to `2T1-2_2_1.1-a`. ⚠ The
reconciliation is one-directional by design: it does not claim that every enumerated class
appears in the database.

*Prerequisites:* Layers 3.5, 14.1–14.5.

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
- Seifert–van Kampen in any form, general or two-open: the two-open case with simply
  connected intersection is UniversalCovers' (Layer 5.5 records the contract), and the general
  pushout theorem is on no roadmap here; also topological surface classification and
  orientation theory;
- the étale fundamental group of a scheme, and the comparison of Layer 12's field-theoretic
  carrier with any scheme-theoretic one;
- tangential basepoints, canonical splittings or liftings of the outer action, continuity
  or homomorphy of `u ↦ φ_u`, and local decomposition-group actions
  `Gal(ℚ̄_p/ℚ_p) → Out`;
- Grothendieck–Teichmüller theory and anabelian reconstruction;
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
  Layer 4`. ⚠ Layers 2, 3 and 4 are **not** mutually independent: 3.1 needs 1.1–1.4 and
  1.1–1.4, and 3.5 needs 2.6's branch-point action to state the one-representative-per-orbit
  comparison with the database; 4.3 needs 3.1 for the finite decision procedure it reuses. Startable immediately; everything elaborates against the pin plus the two
  finite-supplier roadmaps.
- **Track B (geometry):** Layer 5 → Layer 6 → Layer 7 → Layer 8 → Layer 9 → Layer 10 →
  Layer 11. It imports from Track A at exactly four places:

  ```text
  Layer 6  ← 0.1–0.4  (triple vocabulary), 2.6 (branch-point action), 4.6 (regularity)
  Layer 7  ← 0.5, 2.2
  Layer 8  ← 0.6, 0.8 (the threaded torus example), 2.1, 2.2, 2.4
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

Primary sources, with the convention-sensitive role of each recorded; exact theorem numbers
are verified against the copies recorded in the private provenance ledger before any milestone cites one.

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
  the cohomology chain ModularForms Layer 10B builds and Layers 8–9 consume (finiteness
  **14.10**, Riemann–Roch **16.9**, Serre duality **17.9**, Riemann–Hurwitz **17.14**).
