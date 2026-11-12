# Source coverage for Banach spaces

This is a secondary index into the [Banach spaces roadmap](README.md).
The README specifies the mathematics, hypotheses, and ownership. An entry here
records specification coverage, not a completed formalization. Existing library
inputs discharge their corresponding requirements without duplicate definitions
or proofs.

The source is `ch01-BanachSpaces.tex` in the supplied archive
`JvN - Functional Analysis.gz`, the second-edition source of Jan van Neerven's
*Functional Analysis*. The chapter file's SHA-256 is
`7014e807a9a291435de6d46f189b940d0bf9c6172fab6f62187bbab65139d60a`.
The archive's SHA-256 is
`c96acbf4bbe93624aacb67e3edc8fabb5257df800377e517bf2ab457765049d2`.
No source TeX is redistributed.

Coverage is the main text of sections 1.1–1.5, through line 1165, before
`\begin{problems}` at line 1166. The 45 problems, any chapter notes,
commented-out text, and material after `\endinput` are excluded. Historical
narrative, bibliographic pointers, and announcements of later chapters are not
additional theorem specifications. Assertions with mathematical content in the
main text remain covered even when their proofs are assigned to a later chapter
or to an excluded problem.

The tables account for all **51** definition, theorem, proposition, corollary,
lemma, and example environments in the main text, plus the substantive
definitions, constructions, and claims in prose. Source identifiers are TeX
labels; `L76`, for example, means the unlabelled environment starting at source
line 76. For the unlabelled Bochner-integral definition, its internal equation
label `eq:def-BochnerInt1` is the source identifier. Proof details are covered
by the corresponding result, with reusable helper interfaces listed separately.

## Reuse and ownership

Source coverage does not confer ownership. The distinction below applies to
every source row in this index. “Library input” means an implementation has
been identified in the source revisions linked by the README. A target in
another roadmap is a supplier requirement, not a claim that all its proofs
have already been completed.

| Coverage | Existing implementation or owning roadmap | Additional scope here |
| --- | --- | --- |
| BN1; BN2.1–BN2.2; BN4.1–BN4.2; BN5 | Mathlib normed-space, completion, quotient and finite-dimensional APIs | Only explicit specializations and coordinate comparisons |
| BN2.3; BN4.4 | Native `PiLp` and bounded maps; Tau Ceti's exact quotient norm | Abstract product-norm comparison and any missing coordinate adapters |
| BN3.1–BN3.3 | Native classical spaces; Tau Ceti's discrete `C₀` API; Bochner spaces BS3.1–BS3.3 | The `C₀`-to-native-`lp ∞` comparison; no new `Lp` construction or separability theory |
| BN3.4, scalar finiteness | Tau Ceti `VectorMeasure.isFiniteMeasure_variation`, already at the pin | None; the Lean file checks the instance |
| BN3.4, variation formula and regular measures | Bochner spaces BS7.1 and native variation; Banach space theory B5 and implemented `regularSubmodule` norm | Arbitrary-measurable-space scalar norm and completeness, agreeing with the regular-measure norm |
| BN4.3 | Tau Ceti Dense extends convergence to a supplied limit | Construction of the bounded limit and its liminf norm estimate |
| BN4.6; BN8.6 | Banach space theory B1/B3; native `lp.hasSum_single` and Tau Ceti diagonal operators | Concrete convergence-separation examples using those operators |
| BN6.2–BN6.3 | Native convex-hull and equicontinuity APIs; Tau Ceti's compact-set equicontinuity theorem | None beyond specialization; the Lean file checks compact-set convergence without `sorry` |
| BN7.1 | Native `Finpartition`; Tau Ceti measurable refinements and interval Riemann sums | Arbitrary compact-metric Borel partitions, small mesh, tagged-sum error and integral comparison |
| BN7.2 | Native Banach-valued interval FTC and derivative API | Specializations only |
| BN7.3 | Bochner spaces BS1.1, BS1.3, BS1.5 and BS2; native simple approximation and integration | Distance-test packaging; no duplicate Bochner construction or approximation theory |
| BN8.1–BN8.2 | Existing Hilbert–Schmidt matrix bound and native evaluation/integration maps; BS3.3's zero-space case | Explicit examples and the exact scalar-integration norm |
| BN8.3 | Native Hölder map; implemented complex $L^2$ multiplication; B5's interval targets | General exponent/scalar comparison and norm equality |
| BN8.4 | Implemented `TauCeti.integralOperatorLp` with Schur bounds | Product-`Lp` kernel adapter, continuous-output lift, extension to arbitrary $L^2$ kernels, and agreement of the maps |
| BN8.5 | B5's continuous-function operator; Banach algebras Layer 3.1's complex $L^2$ Volterra operator | Continuous-output extension, real/complex comparison, triangular-kernel bound and sharp norm $2/\pi$ |
| BN8.7 | Native algebraic basis extension; Banach algebras Layer 5 uses a discontinuous functional as an input | The concrete existence example on $\ell^2$; no separating-space theory |

## Banach spaces

### Definition and general properties

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| Prose, lines 27–29 | Real and complex scalar conventions; normed versus Banach spaces | Conventions; BN1.1 |
| `def:norm` | Norm axioms and the normed-space structure | BN1.1; native `NormedAddCommGroup` and `NormedSpace` |
| Prose, lines 43–73 | Induced metric; limits and their uniqueness; reverse triangle inequality; continuity of the norm and vector operations; open and closed balls | BN1.1; native metric and normed-space APIs |
| `L76`; prose, lines 80–82 | Banach space and sequential Cauchy completeness | BN1.1; native `CompleteSpace` |
| Prose, lines 84–87 | Ordinary and absolute convergence of series | Conventions; BN1.2 |
| `prop:competeness-series` | Completeness iff every absolutely convergent series converges | BN1.2; native `summable_imp_tendsto_iff_completeSpace` |
| Proof, lines 94–114 | Tail estimates; a Cauchy subsequence with summable increments; convergence of the whole Cauchy sequence | BN1.2; native completeness helper API |
| `L120` | Linear isometries and isometric containment | Conventions; BN1.3 |
| `thm:completion`, both parts | Banach completion, dense linear isometry, and unique isometric comparison between completions | BN1.3; native completion and extension |
| Proof, lines 137–153 | Compatible addition, scalar multiplication, norm limits, and linearity of the comparison | BN1.3; native completion operations |
| `L157` | Separability | BN1.4; native `SeparableSpace` |
| `prop:countable`; proof, lines 164–167 | Countable dense linear span; countable scalar combinations | BN1.4; native separability of spans and closures |

### Subspaces, quotients, and direct sums

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| Prose, lines 174–182 | Inherited subspace norm; complete subspace implies closed; closed subspace of a Banach space is complete | BN2.1 |
| Prose, lines 185–201 | Quotient norm, representative independence, definiteness, approximate representatives, and completeness | BN2.2 |
| Prose, lines 204–210 | Definition of a product norm and its construction from a monotone scalar norm | BN2.3 |
| Prose and `eq:prod-norm`, lines 211–220 | Finite direct sums; comparison with the sum norm; coordinatewise convergence and Cauchyness; completeness | BN2.3 |

### First examples

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| `ex:eucliden` | Euclidean, finite $p$-norm, and maximum-norm spaces; norm inequalities and equivalence | BN3.1; BN5.1–BN5.2; native `EuclideanSpace` and `PiLp` |
| `L270` | $\ell^p$, $\ell^\infty$, completeness, and $c_0$ as a closed subspace | BN3.1 |
| `L277` | Completeness of $C(K)$; norm/uniform convergence; separability for compact metric $K$ | BN3.2; native `ContinuousMap.instSeparableSpace` |
| `L320` | Scalar $L^p$ carriers and norms, a.e. equivalence, completeness, and the finite-exponent separability criterion | BN3.3; Bochner spaces BS3.3 |
| `L334` | Scalar countably additive measures, finite variation, variation norm, and completeness | BN3.4; existing scalar-finiteness instance; BS7.1 variation inputs; general norm/completeness extension compatible with B5 |
| `L345` | Hilbert-space norm and completeness; Euclidean, $\ell^2$, and $L^2$ examples | BN3.5; native inner-product structures |

The figures illustrating finite-dimensional balls and a ball in $C[0,1]$
introduce no additional claims beyond the norm formulas and ball membership
already specified.

## Bounded operators

### Definition and general properties

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| `def:bdd-op` | Boundedness by a finite norm constant | BN4.1 |
| Prose, lines 366–375 | Least admissible bound, supremum over the closed unit ball, and attainment of the operator-norm bound | BN4.1 |
| `prop:bdd-cont`, all three parts | Boundedness iff continuity iff continuity at one point; Lipschitz bound | BN4.1; native bounded-operator APIs |
| Prose, lines 393–409 | Pointwise vector operations on operators; operator-norm axioms; composition and its norm estimate | BN4.1 |
| `L413` | Completeness of the operator space when the target is complete | BN4.1; native instance |
| `def:dual`; prose, lines 434–436 | Continuous dual, Banach structure, and bilinear evaluation | BN4.1; conventions; native `StrongDual` |
| `prop:extendT` | Unique extension from a dense subspace and equality of norms | BN4.2; native extension |
| `prop:approxTn` | Existence of the strong limit from convergence on a dense subspace, boundedness, and the liminf norm estimate | BN4.3; Tau Ceti Dense plus the stated limit-construction interface |
| Prose, lines 495–497 | Strongly convergent sequences on a Banach domain are uniformly bounded | BN4.6; native Banach–Steinhaus and Banach space theory B1 |
| `L499`; prose, line 506 | Kernel and range as submodules; closedness of the kernel | BN4.4 |
| `prop:closed-range` | A positive lower norm bound gives injectivity and closed range for a Banach domain | BN4.5 |
| `L520` | Isomorphisms and isometric isomorphisms | BN4.5; native bundled equivalences |
| `def:contraction` | Operator-norm contraction | Conventions; BN4.1 |
| `L531` | Uniform boundedness of an operator family | BN4.6 |
| `L536`, all three parts | Norm, strong, and weak convergence of operators; uniqueness of weak limits | BN4.6; native topologies and Banach space theory B1 |
| Prose, line 551 | Norm implies strong implies weak; truncations on $\ell^p$ are SOT but not norm convergent; right-shift powers are WOT but not SOT null for $1<p<\infty$ | BN4.6 and BN8.6; B3 supplies sequence-space duality |

### Subspaces, quotients, and direct sums

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| Prose, line 556 | Restriction of bounded operators and its norm bound | BN4.4 |
| Prose, lines 558–567 | Quotient map, unique quotient factor, and exact equality of operator norms | BN4.4; native `mkQL` and `liftQL`, Tau Ceti `norm_liftQL` |
| Prose, lines 569–573 | Diagonal direct sum of bounded operators for any product norm | BN4.4; BN2.3 |

### First examples

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| `ex:matrices-bdd`; `eq:norm-A-upper` | Matrix operator and squared-entry upper bound for its Euclidean operator norm | BN8.1; existing Hilbert–Schmidt energy inequality and Frobenius comparison |
| Prose, line 590 | The matrix bound can be strict | BN8.1, $2\times2$ identity witness |
| `ex:bdd-op-evaluation` | Point evaluation on $C(K)$ has norm one | BN8.1 |
| `ex:bdd-op-integration` | Scalar $L^1$ integration has norm one or zero according to existence of a finite positive-measure set | BN8.2; native integral functional and BS3.3's purely-infinite zero-space case |
| `ex:pointwise-multiplier` | $L^\infty$ symbols act on $L^p$; upper bound for arbitrary measures; equality under the stated endpoint or sigma-finiteness hypotheses | BN8.3 |
| `ex:kernel`, continuous-kernel part | Compactness of the product space; comparison of its sum and maximum metrics; bounded operator on $C(K)$ and the finite-measure norm bound | BN8.4 |
| `ex:kernel`, $L^\infty$ part | A.e. sections, representative independence, and a bounded operator on $L^\infty$ | BN8.4; specialize the existing `TauCeti.integralOperatorLp` |
| `ex:kernel`, $L^2$ part | Square-integrable kernel operator, output integrability, and norm at most the kernel's $L^2$ norm | BN8.4 |
| `ex:Volterra`, first part | $L^2\to C[0,1]$ primitive, half-Hölder estimate, and sup-norm bound | BN8.5 |
| `ex:Volterra`, second part | Inclusion into $L^2$, triangular kernel, $1/\sqrt2$ upper bound, and exact norm $2/\pi$ | Banach algebras Layer 3.1 supplies the complex operator; BN8.5 adds the comparisons, bounds and explicit sharp-inequality prerequisite |
| Prose, lines 691–695 | An unbounded algebraic linear functional exists even on a separable Hilbert space, using choice | BN8.7 |

The final sentence at line 695 is a metamathematical consistency observation
about ZF without choice. It is not an additional functional-analysis target in
Lean's usual classical foundations. BN8.7 includes the concrete analysis
assertion made in that paragraph. The pointers to later matrix spectral
calculations and to the $p=1$ shift problem do not import those problem sets.

## Finite-dimensional spaces

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| `L704` | Equivalence of norms by two-sided constants | BN5.1 |
| `ex:prod-norm-eq` | Any two product norms on a finite product are equivalent | BN2.3 and BN5.1 |
| Prose, lines 715–717 | Ball inclusions and preservation of topological properties under equivalent norms | BN5.1 |
| `thm:equiv-norms-fd` | Equivalence of any two finite-dimensional norms | BN5.2; native finite-dimensional continuous equivalences |
| Proof and `eq:equiv-norms-fd`, lines 723–758 | Basis-coordinate map, explicit Euclidean upper bound, and positive lower bound | BN5.2 |
| `cor:fdns-Banach` | Isomorphism with $\mathbb K^d$ and completeness | BN5.2–BN5.3 |
| `cor:findim-closed` | Finite-dimensional subspaces are closed | BN5.3 |
| `cor:equiv-norms-fd` | Linear maps with finite-dimensional domain are bounded | BN5.3 |
| Prose, line 790 | Bounded sets are relatively compact in finite dimensions; converse property | BN5.3–BN5.4 |
| `thm:FD-compact` | Compactness of the closed unit ball iff finite dimension | BN5.4; native compact-ball criterion |
| `lem:Riesz`; prose, line 802 | Norm-one vector separated from a proper closed subspace; distance interpretation | BN5.4; native `riesz_lemma_of_lt_one` |
| Proof, lines 814–822 | Uniformly separated unit-vector sequence in an infinite-dimensional space | BN5.4 |

## Compactness

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| Prose, lines 826–828 | Relative compactness versus boundedness; equivalence with total boundedness in complete spaces; addition of subsets | BN5.4; BN6.1; native pointwise set addition |
| `prop:compact-totbdd` | Approximation of relatively compact sets by relatively compact sets plus small balls | BN6.1 |
| Prose, line 843 | Convex hull and closed convex hull | BN6.2; native hulls |
| `L848` | The closed convex hull of a compact set in a Banach space is compact | BN6.2; native total boundedness of convex hulls |
| Proof, lines 853–860 | Compact finite convex hull via a simplex; finite-net approximation of convex hulls | BN6.2 |
| `prop:uniform-limits-on-K` | Uniformly bounded SOT convergence is uniform on relatively compact sets | BN6.3; existing equicontinuity theorem, checked against pinned Mathlib in Lean |
| Prose, line 870 | Banach-domain version without a separate uniform bound | BN6.3 and BN4.6 |

## Integration in Banach spaces

### The Riemann integral

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| Prose, lines 889–892 | Finite Borel partitions, tags, and mesh | BN7.1.1; native `Finpartition` |
| `L894` | Unique Banach-valued limit of all sufficiently fine tagged sums for a continuous function on a compact metric space | BN7.1.1–BN7.1.2, including existence of fine partitions |
| Prose, lines 901–903 | Riemann-integral interpretation and independence of approximating partitions | BN7.1.2–BN7.1.3 |
| `prop:Riem-int-norm` | Riemann-integral norm inequality | BN7.1.3; native Bochner bound and the comparison |
| `prop:der-f-zero`, part (1) | Differentiability implies continuity, with interval endpoints treated relatively | BN7.2 |
| `prop:der-f-zero`, part (2) | Zero derivative implies constancy on the open interval | BN7.2 |
| `prop:der-f-zero`, part (3) | Banach-valued fundamental theorem of calculus | BN7.2; native interval FTC |
| Proof, lines 999–1008 | Derivative of the continuous primitive and the primitive formula at every endpoint parameter | BN7.2 |

### The Bochner integral

| Source | Mathematical content | Roadmap coverage |
| --- | --- | --- |
| Prose, lines 1017–1023; `eq:fotx` | Scalar measurability by simple approximation; scalar-vector elementary functions | BN7.3.1; native simple functions and scalar multiplication |
| `def:strongmeas`; prose, line 1032 | Simple and pointwise strongly measurable functions; agreement with scalar measurability | BN7.3.1 |
| `thm:Pettis` | Closed separable range plus measurable distance tests; distance measurability for every ambient vector | BN7.3.1; native separable-range criterion and Bochner spaces BS1.1 |
| Proof, lines 1042–1080 | Simple approximation inside a separable subspace and countable closed spans | BN7.3.1; native approximation and span APIs |
| `cor:ptw-lim-strmeas` | Pointwise sequential limits preserve strong measurability | BN7.3.1; native limit theorem |
| `def:mu-simple` | Finite-measure-support simple functions and their integral formula | BN7.3.2 consumes Bochner spaces BS2 |
| Prose and `eq:triangle-Bochner`, lines 1101–1113 | Representation independence, disjoint refinement, and the simple integral norm bound | BN7.3.2 consumes Bochner spaces BS2 |
| `eq:def-BochnerInt1` and `eq:def-BochnerInt2`, definition at line 1115 | $L^1$ approximation by finite-measure simple functions and definition by limits of integrals | BN7.3.3 consumes Bochner spaces BS1.3 and BS2 |
| Prose, lines 1127–1136 | Measurability of errors; existence and independence of the integral limit; continuous functions on compact spaces; equality with the Riemann integral | BN7.3.3 and BN7.1.3 |
| `prop:Bochner-integrable` | Norm-integrability criterion and integral norm bound | BN7.3.3; native `Integrable` under the stated pointwise convention |
| Proof, lines 1147–1163 | Dominated simple approximation with finite-measure nonzero fibres | BN7.3.2–BN7.3.3; native simple density and dominated convergence |

## Formulation and library comparisons

- **No duplicate foundations.** “Covered” can mean an exact existing theorem,
  an existing theorem plus a short specialization, or a specified missing
  interface. The README's library table identifies the principal inputs.
  In particular, series completeness, finite-dimensional topology, Riesz's
  lemma, quotient-operator norm equality, and basic Bochner integration are
  not requests to rebuild those theories.
- **Ordinary series are not unordered sums.** The source's definition uses
  initial partial sums. BN1 consumes the native theorem with exactly that
  convergence conclusion, rather than changing the source's definition of
  convergence to unconditional summability.
- **Scalar measures need the variation norm.** An existing signed/complex
  vector-measure carrier already has finite variation by Tau Ceti's scalar
  instance. The newer regular-measure subtype also has a variation norm.
  Neither supplies the source's complete normed space of all scalar measures
  on an arbitrary measurable space. BN3.4 supplies that extension and its
  norm comparison, using BS7.1's generic variation results. B5 retains
  regularity and representation theory.
- **Operator convergence retains its hypotheses.** Dense-set convergence
  needs a common operator-norm bound and a complete target to construct a
  limit. Strong convergence on a Banach domain gives a uniform bound for
  sequences; neither assertion is silently generalized to arbitrary nets.
  The compact-set conclusion is expressed with `TendstoUniformlyOn`.
- **Finite-dimensional and product norms are explicit.** Native finite
  products have the maximum norm, not the source's default Euclidean norm.
  Matrix bounds and finite-dimensional comparisons use `EuclideanSpace`
  or `PiLp` as appropriate.
- **Bochner conventions differ from a.e. conventions.** The source assumes
  pointwise strong measurability. BN7 relates that convention to native
  `Integrable` by strongly measurable representatives, retaining arbitrary
  positive measures. Its distance-test Pettis criterion is pointwise and
  does not require an a.e. exceptional-set argument.
- **Riemann sums keep the full generality of the source.** The partition
  cells are arbitrary Borel subsets of a compact metric space. Interval
  partitions alone do not suffice. BN7.1 allows atoms and does not assume
  null boundaries; its integral is the native Bochner integral characterized
  by tagged sums. Common measurable refinements are existing inputs.
- **Examples include sharp and degenerate cases.** The scalar integration
  functional can have norm zero on a nonzero measure space. Finite-exponent
  multiplier norm equality carries sigma-finiteness. Kernel statements
  include representative independence and reuse the existing Schur operator.
  The main-text equality
  $\|V\|_{L^2\to L^2}=2/\pi$ is included even though its proof appears in
  another chapter; BN8.5 specifies its prerequisite here for the operator
  already owned by Banach algebras Layer 3.1.
- **Problem exclusion does not erase prose.** BN8.7 still includes the
  unbounded-functional assertion made in the main text. The 45 problems
  themselves, including their further constructions and requested proofs,
  are not additional targets.
