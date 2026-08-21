# Roadmap: restricted products and rational diagonals for adelic point groups

This roadmap develops the generic topological-group infrastructure needed to assemble local point
groups into finite, away-`S`, and full adelic point groups. Its inputs are a family of topological
groups, compact-open subgroups, and coordinate homomorphisms satisfying eventual integrality. It
does **not** construct the local points of an algebraic group, prove strong approximation, or define
Tamagawa measures and numbers.

That scope boundary is deliberate. Those scheme-theoretic and measure-theoretic applications need
substantial reductive-group, Artin-`L`-factor, reduction-theory, and adelic Fourier-analysis
suppliers which are not yet public. They belong in stacked successor roadmaps — named exactly in
§*Deferred successor roadmaps and acceptance gates* below — after the exact supplier declarations
exist and can be imported. This roadmap therefore lands the independent
restricted-product groundwork first.

Suggested home: `TauCeti/Topology/Algebra/RestrictedProduct/`, with arithmetic specializations in
future files under `TauCeti/NumberTheory/AlgebraicGroup/Adeles/`.

---

## Scope and ownership

### Owned here

- compact-open subgroup families of arbitrary topological groups;
- componentwise maps between restricted products, with exact evaluation and continuity lemmas;
- canonical change-of-family equivalences for eventually equal compact-open families, including
  reflexivity, symmetry, composition, and continuity;
- generic finite, away-`S`, and full adelic-point packaging;
- diagonal homomorphisms from a group whose coordinates are eventually integral, together with
  their coordinate formula and change-of-family compatibility;
- generic local-compactness, open integral-subgroup, product, and reindexing infrastructure that
  depends only on the corresponding hypotheses for the factors.

### Consumed

- Mathlib `RestrictedProduct`, topological groups, compact-open subgroups, finite products, and
  locally compact spaces.

The representative `Suggested.lean` file consequently imports only Mathlib. In particular, this
core does not import unfinished local-field, global-number-field, reductive-group, or `L`-function
roadmaps.

### Not owned here

- functors of points, affine group schemes, integral models, reductive structure theory,
  parabolics, character lattices, simply connected covers, and almost-simple factors;
- local-point topologies or proofs that integral points form compact-open subgroups;
- arithmetic proofs of eventual integrality for rational points;
- weak or strong approximation for algebraic groups;
- invariant differential forms, convergence factors, Tamagawa measures, reduction theory,
  finite-covolume theorems, central-isogeny volume formulas, and Tamagawa numbers;
- adelic Schwartz--Bruhat spaces, Fourier transforms, and Poisson summation;
- orthogonal, Pin, Spin, lattice, genus, mass, or theta-series applications.

---

## Pinned conventions

| Subject | Convention |
|---|---|
| factor family | An arbitrary family `G : ι → Type*` with topological-group structures; no private group-scheme carrier is introduced. |
| compact opens | `CompatibleCompactOpens G` records one compact-open subgroup in each factor. Eventual agreement with an integral model belongs to a later algebraic specialization. |
| restricted-product map | A family `φ i : G i →* H i` induces a map only after proving `φ i (U i) ⊆ U' i` at every coordinate. |
| change of family | The equivalence for eventually equal families is coordinatewise the identity and has a pinned evaluation theorem. |
| finite/away/full points | These are generic packaging names. The number-field specialization must separately identify finite places and require `S` to contain all archimedean places. |
| diagonal | `rationalDiagonal` accepts eventual-integrality evidence as an argument; this core does not manufacture it from arithmetic geometry. |

A bare existence of an equivalence is insufficient: later arithmetic consumers need the
coordinate formula in order to compare diagonal maps, topologies, and eventually measures.

---

## Export contract

Every export in this table is generic and represented in `Suggested.lean`; there are no
supplier-blocked scheme-level placeholder names.

| Export | Layer | Mathematical contract |
|---|---:|---|
| `integralSubgroup` | 0 | the subgroup of restricted-product elements lying in every chosen compact open |
| `isOpen_integralSubgroup` | 0 | openness from coordinatewise openness |
| `isCompact_integralSubgroup` | 0 | compactness from coordinatewise compactness and openness |
| `CompatibleCompactOpens` | 0 | a generic family of compact-open subgroups |
| `restrictedProductMap` | 1 | componentwise homomorphism preserving the chosen subgroups |
| `restrictedProductMap_apply` | 1 | exact coordinate formula |
| `continuous_restrictedProductMap` | 1 | continuity from coordinatewise continuity |
| `restrictedProductCongr` | 1 | canonical equivalence for eventually equal families |
| `restrictedProductCongr_apply` | 1 | the equivalence is coordinatewise the identity |
| `restrictedProductCongr_refl/symm/trans` | 1 | coherence laws for change of family |
| `FiniteAdelicPoints` | 2 | generic restricted-product abbreviation |
| `AdelicPointsAway` | 2 | restricted product over the complement of a finite index set |
| `AdelicPoints` | 2 | a supplied finite archimedean product times the restricted product |
| `rationalDiagonal` | 3 | diagonal homomorphism from supplied coordinate maps and eventual-integrality evidence |
| `rationalDiagonal_apply` | 3 | exact coordinate formula |
| `rationalDiagonal_change_family` | 3 | compatibility with the canonical change-of-family equivalence |

---

## The build, in layers

### Layer 0: compact-open families

**0.1 Integral subgroup.** Define the everywhere-integral subgroup inside a restricted product.
Prove it open when every chosen subgroup is open and compact when every chosen subgroup is compact
and open.

**0.2 Compatible families.** Package a coordinatewise compact-open subgroup family without
claiming that it comes from an integral model. Constructors involving algebraic models are
reserved for a later specialization.

### Layer 1: functoriality and change of family

**1.1 Componentwise maps.** Construct the induced homomorphism from coordinate maps that preserve
the selected subgroups. Prove the evaluation equation, identities, composition, and continuity.

**1.2 Eventually equal families.** Construct the canonical coordinatewise-identity equivalence
for two subgroup families equal outside a finite set. Prove the evaluation equation, continuity in
both directions, reflexivity, symmetry, composition, and naturality with componentwise maps.

**1.3 Topological API.** Add the homeomorphism wrapper, product and reindexing equivalences, and
local-compactness instances under explicit coordinate hypotheses.

### Layer 2: adelic packaging

**2.1 Finite points.** Name a restricted product as `FiniteAdelicPoints` relative to a supplied
compact-open family.

**2.2 Away-`S` points.** Restrict the index family to the complement of a finite set and compare
nested sets by separating the finitely many removed factors.

**2.3 Full points.** Combine a supplied finite archimedean product with the finite restricted
product. The later number-field specialization must prove that the archimedean index set is finite.

### Layer 3: diagonals

**3.1 Supplied eventual integrality.** Given `φ i : Γ →* G i` and evidence that each `γ : Γ` lies
in `U i` for cofinitely many `i`, construct the diagonal into the restricted product.

**3.2 Laws.** Prove the coordinate formula, functoriality, and compatibility with change of
compact-open family. Injectivity is a separate theorem requiring a coordinate-separation
hypothesis.

---

## Deferred successor roadmaps and acceptance gates

The topics below are **not milestones of this roadmap**. They record the split forced by the
missing suppliers and prevent a future PR from reintroducing the same implicit dependencies. Each
one has an exact owner: a named successor roadmap. The names below are the ones
`OrthogonalSpinGroups` and `IntegralLattices` cite, so that a theorem removed from this roadmap
has one owner and not two.

### A. `AlgebraicGroupStrongApproximation` — algebraic-group adelic points and strong approximation

`AlgebraicGroupStrongApproximation` may specialize this generic API only after an accepted
Reductive Groups roadmap publishes and it directly imports declarations for:

1. a representable affine finite-type group functor and its `R`-point group, functorial in a
   commutative `K`-algebra `R`;
2. smooth connected reductive and semisimple predicates and their preservation under base change;
3. rational parabolics, Levi factors, maximal split tori, roots and root subgroups;
4. the character and cocharacter lattices with the absolute Galois action;
5. central isogenies, centres, simply connected covers, and the factorization into
   `K`-almost-simple factors;
6. smooth affine integral models and comparison maps from integral-model points to local points.

No provisional `LocalPointGroup` or `strongApproximation` declaration is exported here. The
successor must use the suppliers' public names and prove that its restricted-product carrier is an
instance of this generic contract.

### B. `TamagawaMeasures` — Tamagawa measures and convergence factors

A general connected reductive group cannot obtain a convergent product measure from a gauge form
alone. `TamagawaMeasures` must import both the reductive-group character module and an accepted
Artin-`L` supplier providing:

- the finite free character lattice `X*(G_{̅K})` with its continuous absolute-Galois action;
- inertia invariants and the local Artin factor
  `L_v(s, X*(G_{̅K}) ⊗ ℂ)` with a pinned geometric-Frobenius convention;
- the unramified integral-volume identity relating `G(𝒪_v)` to the local factor;
- convergence and nonvanishing of the normalized product, plus independence from the omitted
  finite set and the chosen integral model;
- the matching global Artin `L`-function and the leading-value normalization at the designated
  point.

Until those declarations are public, the first measure theorem must be restricted to a class for
which the character module is zero (for example, connected semisimple groups, after proving the
vanishing) and must still prove convergence of its normalized local volumes. This roadmap exports
no `tamagawaMeasure` placeholder.

### C. `ArithmeticReductionTheory` — reduction theory

Reduction theory is `ArithmeticReductionTheory`, a separate staged successor rather than one
milestone saying “construct Siegel sets.” Its dependency order is:

1. rational parabolics, minimal parabolics, Levi decompositions, and maximal `K`-split tori;
2. local and adelic Iwasawa decompositions with compatible maximal compact subgroups;
3. rational characters, logarithmic height maps, simple relative roots, and positive chambers;
4. arithmetic reduction into bounded unipotent and Levi pieces;
5. construction of Siegel sets and a theorem that finitely many rational translates cover;
6. measurable fundamental sets, boundary-nullness or an explicit substitute, and compatibility
   with quotient Haar measure;
7. convergence of the chamber integral and the resulting finite, nonzero quotient volume.

The finite-covolume and `tamagawaNumber` definitions may appear only after all seven stages are
available.

### D. Central-isogeny defect data (owned by `TamagawaMeasures`)

For a central isogeny `1 → Z → G̃ → G → 1`, a future volume-comparison theorem must
name rather than hide the following inputs:

- the connecting maps `δ_K : G(K) → H¹(K, Z)` and
  `δ_v : G(K_v) → H¹(K_v, Z)`;
- the unramified subgroups `H¹_nr(K_v, Z)` at good finite places and the restricted product
  `∏'v H¹(K_v, Z)` relative to them;
- the localization map `loc¹ : H¹(K, Z) → ∏'v H¹(K_v, Z)` and its compatibility with
  the global and adelic connecting maps;
- `Sha¹(K, Z) := ker(loc¹)` and the precise cokernel or image quotient that occurs in the
  adelic defect;
- finiteness of every kernel, image quotient, and cokernel whose cardinality appears in the
  volume ratio.

The exact volume formula must state which of these finite cardinalities occur and how the chosen
local Haar normalizations enter. “Cohomological defect factor” is not an acceptable substitute.

### E. `AdelicFourierAnalysis` — adelic Poisson summation

Adelic Poisson summation has one owner: a separate generic `AdelicFourierAnalysis` roadmap.
That roadmap must import the global-adele supplier and the accepted Schwartz--Bruhat/Fourier
infrastructure, then export a named Poisson-summation theorem with its additive character,
self-dual measure, Fourier-transform convention, lattice, and convergence hypotheses explicit.
Neither this core nor `TamagawaMeasures` should re-prove it; they may only import that theorem.

The resulting stack is therefore:

```text
this generic restricted-product core
    ├─→ AlgebraicGroupStrongApproximation
    │      [after Reductive Groups + local/global arithmetic suppliers]
    ├─→ ArithmeticReductionTheory
    │      [after Reductive Groups; seven staged milestones]
    └─→ TamagawaMeasures
           [after Reductive Groups + Artin-L + ArithmeticReductionTheory
            + AdelicFourierAnalysis]
                └─→ OrthogonalTamagawaAndLatticeMass
                       [the Spin/SO specialization: the orthogonal strong-approximation
                        application, tau(SO_Q), the genus/spinor-genus comparison, and the
                        Smith-Minkowski-Siegel mass formula; consumed by IntegralLattices]
```

`OrthogonalSpinGroups` (#255) and `IntegralLattices` (#256) name these same five roadmaps as the
owners of the strong-approximation, Tamagawa and mass-formula results neither of them claims.

---

## Worked examples and rejection tests

1. A finite family: the restricted product is the ordinary product, and the integral subgroup is
   the product of the selected subgroups.
2. A finite change of subgroup family gives a canonical coordinatewise-identity homeomorphism.
3. The additive diagonal from a supplied family of embeddings satisfies the expected coordinate
   formula.
4. A coordinate map that fails to preserve a selected subgroup does not induce
   `restrictedProductMap` without changing the target family.
5. Eventual integrality is never inferred merely from the existence of coordinate maps.

## Ordering

```text
0 → 1 → 2 → 3
```

## References

- N. Bourbaki, *General Topology*, for restricted-product topology.
- A. Weil, *Basic Number Theory*, for the classical restricted-product model of adeles.

The extraction history and audited source status are maintained privately and are not normative.
