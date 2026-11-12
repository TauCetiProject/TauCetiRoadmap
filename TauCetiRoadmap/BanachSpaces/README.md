# Banach spaces

Develop the basic theory of normed spaces, Banach spaces, and bounded linear
operators: completeness and completion, subspaces and quotients, finite products,
classical examples, extension and convergence of operators, finite-dimensional
spaces, compactness, and integration of Banach-valued functions. Include the
concrete operators and exact norm calculations that connect this foundation to
applications.

Most of the foundational theory is already available in Mathlib. The work here
is to supply the remaining interfaces, comparisons, and examples on its native
objects. Existing theorems count as coverage; do not introduce second definitions
or reprove them under new names just to follow this document.

This README is the definitive specification. [Suggested.lean](Suggested.lean)
contains representative interfaces, including checks against existing APIs;
its admitted proofs are targets, and it is not an exhaustive checklist.
[Coverage.md](Coverage.md) indexes the source's main-text statements, including
unnamed assertions and examples. The organization and ownership are by topic.
The principal source is Jan van Neerven's *Functional Analysis*, Chapter 1,
“Banach Spaces,” in the supplied second-edition source. The problem set and
chapter notes impose no coverage requirement.

## Scope and ownership

This roadmap owns the elementary normed-space interfaces and concrete examples
specified below where they are not already library inputs. It is distinct from
the advanced geometry, duality, and operator-ideal theory in
[Banach space theory](../BanachSpaceTheory/README.md).

| Shared material | Owner and boundary |
| --- | --- |
| Norms, completion, continuous linear maps, finite-dimensional topology, Riesz's lemma | Native Mathlib inputs; BN1–BN2 and BN4–BN6 consume their APIs |
| SOT and WOT, uniform boundedness, classical sequence-space dualities | [Banach space theory](../BanachSpaceTheory/README.md), B1 and B3; BN4 uses the native topologies, and BN8 supplies the specific unilateral-shift and truncation examples below |
| General strong measurability and Bochner integration | [Bochner spaces](../BochnerSpaces/README.md), BS1–BS3; BN7 records the distance-test specialization, the compact-space Riemann-sum comparison, and the elementary calculus applications |
| Scalar measure representation on compact and locally compact spaces | Banach space theory B5; BN3 supplies the total-variation Banach structure on an arbitrary measurable space, without a regularity or representation theorem |
| Multiplication on scalar `Lp` | Banach space theory B5 owns the interval examples; BN8's arbitrary-measure construction uses native Hölder multiplication and extends the existing Tau Ceti multiplication API |
| Volterra on continuous functions | Banach space theory B5 and Tau Ceti's `ContinuousMap.intervalIntegralOperator`; BN8 owns its `L² → C[0,1]` extension, the `L²` operator, and the sharp `L²` norm |
| General Hilbert–Schmidt, compact-operator, and spectral theory | [Operator ideals](../OperatorTheory/OperatorIdeals/README.md) and [Operator theory](../OperatorTheory/README.md); BN8 needs only the explicitly stated kernel bounds and supplies an elementary route to the Volterra norm |

BN3's scalar-measure completeness is independent of the Riesz representation
theorem and of Bochner-space duality. BN8's kernel bounds do not assume that
Hilbert–Schmidt theory has been constructed. The strong-convergence examples use
the scalar sequence-space dualities of B3, which do not depend on these examples.

General weak compactness, reflexivity, Schauder bases, approximation properties,
tensor products, spectral decompositions, and the chapter's 45 problems are
outside this roadmap. The elementary existence of an unbounded linear functional
is included because it is asserted in the main text.

Suggested homes are `TauCeti/Analysis/Normed/Module/` and `Operator/`,
`TauCeti/Analysis/Convex/`, and the existing `TauCeti/MeasureTheory/Function/`,
`Integral/`, and `VectorMeasure/` trees.

## Conventions

**Scalars and spaces.** Work over $\mathbb K=\mathbb R$ or $\mathbb C$, expressed
with `RCLike` when one statement covers both. Use `NormedAddCommGroup`,
`NormedSpace`, and an explicit `CompleteSpace` assumption. A normed space need
not be complete. Use compatible real scalar structures for integration and real
convexity. Keep the zero space, empty finite products, empty compact spaces,
and the zero measure in the statements.

**Native objects.** Use `Submodule`, the normed quotient `X ⧸ Y`,
`UniformSpace.Completion`, `LinearIsometry`, `LinearIsometryEquiv`,
`ContinuousLinearMap`, `ContinuousLinearEquiv`, and `StrongDual`.
The duality pairing is $x^*(x)$ and is bilinear over $\mathbb C$.
“Isometry” in the source's linear theory means a linear isometry.
A contraction has operator norm at most one; it need not be a strict metric
contraction.

**Series.** Ordinary convergence of $\sum_n x_n$ means convergence of the initial
partial sums, expressed by `Tendsto` along `atTop`. Absolute convergence means
`Summable (fun n ↦ ‖x n‖)`. Native `Summable x` is the stronger, unordered
finite-subset notion. Under absolute summability in a complete space it supplies
the same sum; do not identify the two notions for arbitrary series.

**Products and equivalent norms.** Native finite products carry the maximum
norm. Use `PiLp` and `WithLp` for other $p$-norms, and
`EuclideanSpace 𝕜 ι` for the Euclidean norm. Any norm transport or comparison
must specify the underlying identity map. Do not change the ambient norm by
installing incompatible instances on the same type.

**Compactness and convergence.** Relative compactness of $A$ means
`IsCompact (closure A)` in the specified norm topology, not merely boundedness
or total boundedness in an incomplete space. Convex hulls are real convex hulls.
Use `TendstoUniformlyOn` for uniform convergence on a set, including the empty
set, instead of an unspecified supremum over that set.

**Measures and integration.** Measures are positive, with values in
`ℝ≥0∞`. Finite-measure coefficients in vector sums are
`(μ A).toReal`. All `Lp` carriers use global a.e. equality. Distinguish arbitrary,
finite, and sigma-finite measures; no finiteness assumption is implicit.
The source's pointwise strongly measurable functions use `StronglyMeasurable`.
Native `Integrable` requires a.e. strong measurability. Accordingly, the
source's integrable functions are exactly those satisfying both
`StronglyMeasurable f` and `Integrable f μ`; a native integrable function has a
pointwise strongly measurable representative with the same integral.
This is different from the stronger finite-support measurability convention
discussed in the Bochner spaces roadmap.

## Existing library interfaces

The links below use the repository's dependency revisions: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`. They identify inputs, not an
instruction to freeze an API after the dependency changes.

| Material | Existing interface to consume |
| --- | --- |
| Completeness by absolute series | [Mathlib Completeness][ml-complete], `NormedAddCommGroup.summable_imp_tendsto_iff_completeSpace`, including its Cauchy-subsequence helper |
| Linear normed completion | [Mathlib Completion][ml-completion], `UniformSpace.Completion` and `NormedSpace.toComplₗᵢ`; [operator extension][ml-extend] for the linear universal property |
| Separability of linear spans | [Mathlib topological modules][ml-module-topology], separability of spans and closures over separable scalars |
| Quotients and exact quotient-operator norms | [Mathlib quotient maps][ml-quotient] and [Tau Ceti normed quotients][tc-quotient], `Submodule.mkQL`, `liftQL`, `norm_liftQL`, `norm_comp_mkQL`, and `norm_mkQL_le` |
| Finite $p$-products | [Mathlib PiLp][ml-pilp], its norm formulas, uniform equivalence with a product, and completeness |
| Bounded operators and dense extension | [Mathlib operator extension][ml-extend], `LinearMap.extendOfNorm`, its evaluation, uniqueness, and norm bounds; [Tau Ceti extension][tc-extend] for factorization through a range and its closure |
| Extending convergence from a dense set | [Tau Ceti Dense][tc-dense], `ContinuousLinearMap.tendsto_apply_of_dense` and `uniformCauchySeqOn_apply_of_dense`; the existence and liminf formulation in BN4 combines these inputs |
| Finite-dimensional normed spaces | [Mathlib FiniteDimension][ml-finite], continuous linear equivalences, properness, completeness, closed subspaces, and the compact-ball criterion |
| Riesz's lemma | [Mathlib RieszLemma][ml-riesz], `riesz_lemma_of_lt_one`, with a norm-one vector and distance from every vector in a proper closed subspace |
| Compact convex hulls | [Mathlib convex topology][ml-convex] and [total boundedness][ml-convex-tb], `Set.Finite.isCompact_convexHull` and `TotallyBounded.convexHull` |
| Classical function spaces | Native `C(K, 𝕜)`, `BoundedContinuousFunction`, `ZeroAtInftyContinuousMap`, `lp`, and [`MeasureTheory.Lp` completeness][ml-lp]; use their native norms and typeclass instances |
| Scalar and vector measures | Native `SignedMeasure` and `ComplexMeasure` on `VectorMeasure`, [variation][ml-variation], and [Tau Ceti variation comparisons][tc-variation]; these do not by themselves supply BN3's total-variation Banach structure |
| Pointwise multiplication and scalar pairing | [Mathlib Holder][ml-holder], `ContinuousLinearMap.holderL` and `lpPairing`; these are the constructions behind BN8 |
| Strong measurability | [Mathlib StronglyMeasurable][ml-strong], its simple approximants, separable range, pointwise-limit closure, and `stronglyMeasurable_iff_measurable_separable` |
| Bochner integration and integral functionals | [Mathlib Bochner][ml-bochner], [L1][ml-l1], `L1.integralCLM'`, norm estimates, simple approximation, and completeness of `Lp` |
| Volterra on continuous paths | [Tau Ceti ContinuousMap][tc-continuous-map], `ContinuousMap.intervalIntegralOperator`, `unitIntervalIntegral`, their evaluation formulas, and norm upper bounds |
| Banach-valued fundamental theorem of calculus | [Mathlib interval FTC][ml-ftc] and [mean value theory][ml-mean-value]; use native derivatives and interval integrals |

Two further Tau Ceti modules are available at
`396c3bd971e9722aa8656231760e710fe641d8cf`, beyond this dependency pin.
[Multiplication][tc-multiplication] constructs
`MeasureTheory.Lp.multiplicationOperator` on complex, vector-valued $L^2$
and proves the sigma-finite norm equality.
[RiemannSums][tc-riemann] gives tagged sums on real intervals for
finite-variation vector measures. BN8 extends the former across the source's
exponents and scalars; BN7 requires arbitrary finite Borel partitions of a compact
metric space, so the interval theorem alone does not discharge that target.
Adopt these APIs when available, and provide the needed interfaces in Tau Ceti
when working at an earlier pin.

## BN1. Banach spaces: definition and general properties

1. **Normed-space foundation.** Consume the norm axioms, `dist_eq_norm`,
   the reverse triangle inequality, continuity of the norm, addition and scalar
   multiplication, uniqueness of limits, and preservation of limits under these
   operations. Identify the source's balls with `Metric.ball` and
   `Metric.closedBall`. Banach completeness is native `CompleteSpace`;
   use its sequential Cauchy criterion in metric spaces.

2. **Absolute series and completeness.** Record the equivalence between
   completeness and convergence of every absolutely summable series in the
   initial-partial-sum sense. Consume the existing equivalence. Its operational
   interfaces include the tail estimate
   $\|\sum_{j=m}^{n-1}x_j\|\le\sum_{j=m}^{n-1}\|x_j\|$,
   a subsequence of any Cauchy sequence with summable successive distances,
   and convergence of a Cauchy sequence that has a convergent subsequence.
   Relate the resulting sum to native `HasSum` under the actual summability
   hypotheses.

3. **Completion and its uniqueness.** Use the native completion, its complete
   normed-space structure, and the dense linear isometric embedding
   $j_X:X\to\widehat X$. For a bounded map from $X$ to a Banach space,
   consume the unique norm-preserving continuous linear extension.
   If $i:X\to Y$ and $j:X\to Z$ are linear isometries with dense ranges and
   $Y,Z$ are Banach, obtain the unique linear isometric equivalence
   $e:Y\cong Z$ satisfying $e(i x)=j x$. Include the compatibility of
   addition, scalar multiplication, norms, and limits with the embedding.
   These are universal properties of the native completion; no second
   quotient of Cauchy sequences is needed.

4. **Separability and countable spanning sets.** A normed space is separable
   iff it has a countable subset whose linear span is dense. Include the
   separability of the closed span of a countable set, and the countable dense
   set formed from finite combinations with coefficients in a fixed countable
   dense subset of $\mathbb K$. The scalar separability hypothesis matters;
   the stated setting is $\mathbb R$ or $\mathbb C$.

*Needs:* native metric, normed-space, infinite-sum, completion, and separability
APIs. These items are principally existing inputs and their specializations.

## BN2. Banach spaces: subspaces, quotients, and direct sums

1. **Subspaces.** Use the inherited norm on a `Submodule`. A complete
   subspace of a normed space is closed without assuming the ambient space
   complete. A closed subspace of a Banach space is complete. Supply the
   inclusion as a linear isometry and the representative formulas for the
   inherited operations and norm.

2. **Quotients.** For a closed subspace $Y\le X$, use the native quotient and
   verify $\|[x]\|=\inf_{y\in Y}\|x-y\|$, independence of the representative,
   and $\|[x]\|=0\iff x\in Y$. For every $\varepsilon>0$ there is a
   representative of $[x]$ of norm less than $\|[x]\|+\varepsilon$.
   The quotient is complete when $X$ is complete. Distinguish the seminormed
   quotient available for arbitrary subspaces from the normed quotient for
   closed ones. The quotient map, factorization, and exact operator norms are
   consumed in BN4.4.

3. **Finite direct sums.** On a finite product $\prod_{i\in I}X_i$, a product
   norm $N$ satisfies
   $N(\iota_i x)=\|x\|$ and $\|x_i\|\le N(x)$.
   Express these as explicit hypotheses on a norm and the native coordinate
   injections; do not introduce a separate “product norm” class.
   Prove
   $$
   \max_i\|x_i\|\le N(x)\le\sum_i\|x_i\|
      \le |I|\,N(x).
   $$
   The maximum on the empty index set is zero. These inequalities give the
   product topology and uniformity, coordinatewise convergence and Cauchyness,
   completeness when each factor is complete, and equivalence of any two such
   product norms.

   If $n$ is a norm on $\mathbb K^I$, monotone under coordinatewise absolute
   value and equal to one on each coordinate unit vector, prove that
   $N(x)=n((\|x_i\|)_i)$ defines such a product norm. Supply its homogeneity,
   positivity, and triangle inequality from the monotonicity hypothesis.
   For $p$-norms consume `PiLp` and its existing instances. The identity
   comparisons must preserve the actual coordinate maps.

*Needs:* BN1; native submodule, quotient, finite-product, and `PiLp` APIs.

## BN3. Banach spaces: first examples

1. **Finite-dimensional and sequence carriers.** Use
   `EuclideanSpace` and `PiLp` for the finite Euclidean, $p$, and maximum norms.
   Use `lp (fun _ : ℕ ↦ 𝕜) p` for $\ell^p$, $1\le p\le\infty$.
   Consume the triangle inequalities, displayed norm formulas, and completeness.
   Realize $c_0$ by the native zero-at-infinity continuous functions on the
   discrete natural numbers. Construct or reuse the isometric embedding into
   $\ell^\infty$, characterize its range by convergence of the coordinates to
   zero, and prove the range closed. Do not replace these carriers by raw
   functions plus separately maintained membership proofs.

2. **Continuous functions.** For compact $K$, use `C(K, 𝕜)` with its
   supremum norm and completeness. Norm convergence is uniform convergence.
   For compact metric $K$, consume or supply separability of this space,
   with its compact-domain and scalar hypotheses explicit. The empty-space
   carrier is the zero space; formulas using a maximum require nonempty $K$.

3. **Scalar $L^p$.** Use native `Lp 𝕜 p μ` for every $1\le p\le\infty$.
   Record the integral formula for finite $p$, the essential-supremum formula
   at infinity, the representative invariance, and completeness. When
   $p<\infty$, $\mu$ is sigma-finite and the measurable structure is countably
   generated, obtain separability. Consume Bochner spaces BS3.3 and the native
   simple-density API; do not require an arbitrary measure space to be
   countably generated or sigma-finite for completeness.

4. **Scalar measures with the variation norm.** For any measurable space $S$,
   use `VectorMeasure S 𝕜` with its native scalar-measure specializations,
   `SignedMeasure` and `ComplexMeasure`. Prove that scalar-valued countably
   additive measures have finite total variation. For complex scalars use the
   real and imaginary signed measures and the corresponding variation bounds;
   this assertion is false for general Banach-valued measures.

   Give this native scalar carrier the norm
   $\|m\|=|m|(S)$, expressed by `(m.variation Set.univ).toReal`.
   Prove its equality with the supremum of
   $\sum_{A\in\mathcal P}|m(A)|$ over finite measurable disjoint families.
   Compare that formula with partitions of the whole space by adjoining the
   complement. Establish definiteness, triangle inequality, scalar homogeneity,
   $\|m(A)\|\le |m|(A)\le\|m\|$, and boundedness of evaluation at a measurable
   set.

   Prove completeness: a variation-Cauchy sequence converges on each measurable
   set; the limit is countably additive by uniform variation-tail control,
   and the original sequence converges to it in variation norm. Include the
   norm continuity of restriction and the contraction under measurable
   pushforward. These comparisons keep the construction compatible with B5's
   submodule of measures with finite regular variation; regularity and the
   continuous-function dual representation remain B5's responsibility.
   Do not replace a complex measure by its total mass or by the maximum norm of
   its real and imaginary parts.

5. **Hilbert-space examples.** Consume the native inner-product-to-norm
   construction and completeness instances for Euclidean spaces, $\ell^2$,
   and scalar $L^2$. Record their identification with the preceding carriers.
   In complex spaces use Mathlib's inner-product convention; the continuous
   dual pairing elsewhere remains bilinear.

*Needs:* BN1–BN2; native `lp`, `Lp`, continuous-function and inner-product
APIs; native signed-measure finiteness and variation; Bochner spaces BS3.3.
The scalar-measure norm and completeness are an explicit target, not a claimed
consequence of merely having a `VectorMeasure` type.

## BN4. Bounded operators: definition and general properties

1. **Boundedness, continuity, and the operator norm.** For a linear map
   $T:X\to Y$, consume the equivalence of continuity, continuity at one point,
   and an estimate $\|Tx\|\le C\|x\|$ for some $C\ge0$.
   Bundle bounded maps as `ContinuousLinearMap`.
   Its norm is the least such constant and equals the supremum over the closed
   unit ball. Include the attained bound $\|Tx\|\le\|T\|\|x\|$ and the
   Lipschitz estimate. Consume pointwise addition and scalar multiplication,
   the normed-space structure on operators, and
   $\|S\circ T\|\le\|S\|\|T\|$.
   The operator space is Banach when its target is Banach, regardless of the
   completeness of its source. In particular `StrongDual 𝕜 X` is complete.

2. **Extension by density.** For a dense submodule $D\le X$, a bounded
   $T_0:D\to Y$ with Banach target extends uniquely to $T:X\to Y$, with
   $\|T\|=\|T_0\|$. Consume the native extension, evaluation on $D$,
   continuity, uniqueness, and norm bounds. The result does not require
   completeness of $X$. Provide the same interface for a dense linear
   isometric embedding, including compatibility with composition.

3. **Limits determined on a dense subspace.** Let $T_n:X\to Y$ be bounded
   operators, $Y$ Banach, and $\|T_n\|\le M$ for all $n$.
   If $T_nx$ converges for every $x$ in a dense submodule, obtain a unique
   $T:X\to Y$ such that $T_nx\to Tx$ for every $x\in X$, and prove
   $$
   \|T\|\le\liminf_n\|T_n\|\le M.
   $$
   Include a Cauchy formulation before selecting the limit. Consume
   `uniformCauchySeqOn_apply_of_dense` and `tendsto_apply_of_dense`, using a
   singleton parameter set where appropriate. Constructing the limit and
   the liminf estimate are part of this interface; convergence to an already
   supplied bounded map alone is not its full statement.

4. **Subspaces, quotients, and direct sums of operators.** Kernels are closed
   submodules; ranges are submodules and need not be closed. Restriction to a
   submodule has norm at most the original norm. For closed $Y\le X$,
   consume `Y.mkQL`, its norm at most one, and the uniquely induced
   `Y.liftQL T h` when $Y\le\ker T$. Its norm equals $\|T\|$, including
   zero operators and the zero quotient. Use the existing Tau Ceti exact
   norm theorem.

   For a finite family $T_i:X_i\to X_i$, construct the diagonal operator on
   the finite product. For a product norm as in BN2,
   $\|\bigoplus_iT_i\|\le\sum_i\|T_i\|$ suffices to establish boundedness.
   For the native $p$-product norms obtain
   $\|\bigoplus_iT_i\|=\max_i\|T_i\|$, with value zero for no factors.
   State the coordinate evaluation, injection, and projection formulas.

5. **Closed range and isomorphisms.** If $X$ is Banach and
   $\|Tx\|\ge c\|x\|$ with $c>0$, prove injectivity, completeness and
   closedness of the range, and a bounded inverse from the range with norm at
   most $c^{-1}$. The target need not be complete. Use native
   `ContinuousLinearEquiv` and `LinearIsometryEquiv` for the source's two
   forms of isomorphism. Do not infer a bounded inverse from bijectivity
   without the hypotheses of the bounded inverse theorem.

6. **Uniform, strong, and weak convergence.** Uniform convergence of
   operators means norm convergence. Strong convergence means pointwise norm
   convergence, using `PointwiseConvergenceCLM`; weak operator convergence
   uses `ContinuousLinearMapWOT` and the tests $y^*(T_nx)$.
   Consume B1's evaluation criteria, uniqueness of weak limits, and
   norm-convergence $\Rightarrow$ SOT $\Rightarrow$ WOT.
   Uniform boundedness of a family means an actual common finite norm bound.
   On a Banach domain, a strongly convergent sequence is norm bounded by
   Banach–Steinhaus; completeness of the target is not needed.
   BN8.6 records the source's examples showing that the converses fail.

*Needs:* BN1–BN2; native bounded operators, dense extension, Banach–Steinhaus,
and the Tau Ceti dense/quotient modules; Banach space theory B1 for the generic
operator-topology comparisons.

## BN5. Finite-dimensional spaces

1. **Equivalent norms.** For two norms $N_1,N_2$ on the same vector space,
   explicit constants $0<c\le C$ with
   $cN_1(x)\le N_2(x)\le CN_1(x)$ give a continuous linear equivalence
   realizing the identity. Prove the corresponding ball inclusions,
   equality of topologies, equivalence of Cauchy sequences and completeness,
   and preservation of closedness, compactness, and convergence.
   Use native transported norm structures and bundled equivalences.
   BN2.3 supplies this comparison for finite product norms.

2. **Finite-dimensional norm equivalence.** Consume the theorem that every
   linear equivalence between finite-dimensional normed spaces is continuous
   with continuous inverse. In particular any two norms on a fixed
   finite-dimensional vector space are equivalent. For a specified finite
   basis, provide the coordinate equivalence to $\mathbb K^d$ and the two
   norm bounds. Include the source's upper estimate
   $\|\sum_j c_jx_j\|\le(\max_j\|x_j\|)\sqrt d\,(\sum_j|c_j|^2)^{1/2}$
   when $d>0$, and treat $d=0$ separately.

3. **Consequences.** Consume completeness of finite-dimensional normed
   spaces, closedness of finite-dimensional subspaces, and continuity of every
   linear map with finite-dimensional domain. Bounded subsets have compact
   closure, and closed bounded subsets are compact. This uses the complete,
   locally compact scalar field $\mathbb R$ or $\mathbb C$.

4. **Riesz's lemma and the converse.** For a proper closed $Y<X$ and
   $\varepsilon>0$, obtain a norm-one $x$ with
   $\inf_{y\in Y}\|x-y\|\ge1-\varepsilon$ from the native Riesz lemma.
   Use the equivalent bound for every $y\in Y$ if that avoids an unnecessary
   distance wrapper. Consume the compact-closed-unit-ball iff
   finite-dimensional criterion, without a completeness assumption on $X$.
   Include the separated unit-vector sequence in an infinite-dimensional
   normed space: $\|x_n-x_m\|\ge1/2$ for $n\ne m$, and therefore no
   convergent subsequence. Thus boundedness and relative compactness of
   subsets coincide exactly in finite dimensions.

*Needs:* BN1–BN2; native finite-dimensional linear algebra and topology, Riesz's
lemma, and proper metric spaces. These conclusions are largely existing inputs.

## BN6. Compactness

1. **Approximation by relatively compact sets.** Consume the equivalence
   of relative compactness and total boundedness in a complete metric space.
   For a subset $S$ of a Banach space, establish
   $$
   \operatorname{IsCompact}(\overline S)
   \quad\Longleftrightarrow\quad
   \forall\varepsilon>0\ \exists K_\varepsilon,\quad
   \operatorname{IsCompact}(\overline{K_\varepsilon})
   \ \text{and}\ S\subseteq K_\varepsilon+B(0,\varepsilon).
   $$
   Use native set addition and finite epsilon nets. Include the corresponding
   total-boundedness formulation without ambient completeness, and the empty
   set. The forward implication may take $K_\varepsilon=S$.

2. **Closed convex hulls.** Consume native real convex hulls, their minimal
   property, and `closedConvexHull`. The convex hull of a finite set is
   compact as the image of its finite simplex. The convex hull of a totally
   bounded set is totally bounded; hence the closed convex hull of a compact
   subset of a Banach space is compact. Record the finite approximation
   $\operatorname{co}(K)\subseteq\operatorname{co}(F)+B(0,\varepsilon)$
   for a finite epsilon net $F\subseteq K$. Use the existing convex-hull
   theorem, and do not assert compactness of the closed convex hull in every
   incomplete normed space.

3. **Uniform convergence on relatively compact sets.** If
   $\sup_n\|T_n\|<\infty$ and $T_nx\to Tx$ for every $x$, then
   `TendstoUniformlyOn (fun n x ↦ Tn n x) T atTop K` for every
   relatively compact $K$. Neither domain nor target needs to be Banach.
   A finite epsilon net and the bound
   $\|(T_n-T)x\|\le\|(T_n-T)y\|+(\|T_n\|+\|T\|)\|x-y\|$
   supply the interface. If the domain is Banach, remove the separately stated
   uniform bound using BN4.6. Do not extend that inference to arbitrary nets.

*Needs:* BN4–BN5; native total boundedness, uniform convergence, and convexity.

## BN7. Integration in Banach spaces

### BN7.1. The Riemann integral

Let $K$ be a compact metric space with its Borel measurable structure, $\mu$ a
finite Borel measure, and $X$ a Banach space. For $f\in C(K,X)$, use its native
Bochner integral as the candidate integral.

1. **Partitions and tagged sums.** Use
   `Finpartition (Set.univ : Set K)` for a finite partition into nonempty
   cells, and require each cell to be Borel measurable. A tag belongs to its
   cell. For a tagged partition $(P,t)$ set
   $R(f;P,t)=\sum_{A\in P}\mu(A)f(t_A)$.
   The mesh is the maximum of the cell diameters, with value zero for the
   empty partition. Establish existence of measurable partitions with
   arbitrarily small positive mesh bound using finite covers by small balls
   and disjointification. This existence is needed for uniqueness of limits.
   Provide common refinement by nonempty intersections and its measurability.
   Empty $K$ has the empty sum and integral zero.

2. **Quantitative error and the limit.** If
   $\|f(t_A)-f(x)\|\le\eta$ for $x\in A$ in each cell, prove
   $$
   \left\|R(f;P,t)-\int_K f\,d\mu\right\|\le\eta\,\mu(K).
   $$
   Deduce that for every $\varepsilon>0$ there is a $\delta>0$ such that
   every tagged Borel partition of mesh less than $\delta$ has error less
   than $\varepsilon$. Handle $\mu(K)=0$ directly.
   The native integral is the unique vector with this property. Include
   convergence for arbitrary sequences of such partitions with meshes
   tending to zero and independence of the tags.
   The cells need not be intervals, their boundaries need not be null, and
   $\mu$ may have atoms.

3. **Integral comparisons.** Consume linearity and
   $\|\int f\,d\mu\|\le\int\|f\|\,d\mu$. Prove that the preceding
   characterization agrees with the source's Riemann integral and with
   `intervalIntegral` for Lebesgue measure on a compact real interval.
   Build comparison lemmas on the existing integral; no second totalized
   integration operator is requested. Compare interval tagged sums with the
   existing Tau Ceti vector-measure sums where their conventions apply,
   taking account of endpoint atoms.

*Needs:* BN1, native finite partitions, compactness and uniform continuity,
finite Borel measures, and native Bochner integrability of continuous functions
on compact spaces. This route does not require the scalar-test Pettis theorem.

### BN7.2. Differentiation and the fundamental theorem of calculus

Use `HasDerivWithinAt` at endpoints and the ordinary real derivative in the
interior of an interval. Consume differentiability implying continuity.
If $f$ is differentiable on $(a,b)$ with zero derivative there, it is constant
on $(a,b)$; constancy on the closed interval additionally needs endpoint
continuity. For a continuous derivative on $[a,b]$ and a compatible
Banach-valued function, prove
$\int_a^b f'(t)\,dt=f(b)-f(a)$ using the native interval FTC.
Include the primitive formula at each $t\in[a,b]$ and the derivative of the
primitive of a continuous function. Restriction to $[0,1]$ recovers every
part of the source's calculus proposition.

### BN7.3. The Bochner integral

1. **Simple functions and strong measurability.** Consume native simple
   functions and the equivalence with finite sums of measurable indicator
   functions times vectors. Scalar measurability agrees with strong
   measurability. The source's first Pettis criterion is the following
   pointwise statement:
   $f:S\to X$ is strongly measurable iff its range lies in a closed separable
   submodule $X_0$ and $s\mapsto\|f(s)-x_0\|$ is measurable for every
   $x_0\in X_0$. Under these conditions $s\mapsto\|f(s)-x\|$ is measurable
   for every $x\in X$. Obtain this criterion from native measurable/separable
   range theory and countably many distance tests in the separable subspace;
   compare with Bochner spaces BS1.1. Also consume closure under pointwise
   sequential limits and the common separable closed span for the ranges of
   countably many strongly measurable functions.

2. **Finite-measure simple integration.** A simple function is
   $\mu$-simple exactly when every nonzero fibre has finite measure.
   Compare this with native integrability of simple functions. Its integral
   is the sum of the fibre values times their measures. Include disjoint
   refinement of an arbitrary finite indicator representation, independence
   of that representation, addition and scalar multiplication, and the
   integral norm bound. Zero terms on infinite-measure sets contribute zero
   without using an invalid real conversion of infinite measure.

3. **Approximation and integrability.** For a pointwise strongly measurable
   $f$, native integrability is equivalent to approximation by $\mu$-simple
   functions in $L^1$ norm, and to finiteness of the nonnegative integral of
   $\|f\|$. Include measurability of the approximation error, existence and
   independence of the limit of the simple integrals, and the same norm bound.
   Consume Bochner spaces BS2 and Mathlib's simple-density and dominated
   convergence theorems. On a compact metric space with finite Borel measure,
   continuous functions satisfy these conditions and their Bochner integral
   has the Riemann-sum characterization in BN7.1.

*Needs:* native strong measurability, separability, simple functions, and Bochner
integration; Bochner spaces BS1–BS3 for general-purpose extensions. The
pointwise and a.e. conventions must be related explicitly.

## BN8. Bounded operators: first examples

1. **Matrices and point evaluations.** For a matrix over $\mathbb K$, use
   the induced continuous linear map between Euclidean spaces. Prove
   $\|A\|^2\le\sum_{i,j}|a_{ij}|^2$ using native Cauchy–Schwarz.
   The inequality need not be equality: the $2\times2$ identity has operator
   norm one and squared-entry sum two. For $x\in K$, point evaluation
   $C(K,\mathbb K)\to\mathbb K$ has norm one, witnessed by the constant-one
   function. Existence of the point supplies the needed nonemptiness.

2. **The scalar integration functional.** Use `L1.integralCLM' 𝕜`.
   On an arbitrary measure space its norm is one iff there is a measurable
   $A$ with $0<\mu(A)<\infty$; otherwise its norm is zero and scalar $L^1$
   is the zero space. Include the indicator witness, the norm upper bound,
   and the vanishing assertion when there are no finite positive-measure
   sets. Do not silently assume the measure is sigma-finite or nonzero.

3. **Pointwise multipliers.** For $m\in L^\infty(\mu)$ use
   `ContinuousLinearMap.holderL` with scalar multiplication to define
   $M_m:L^p(\mu)\to L^p(\mu)$ for $1\le p\le\infty$.
   Supply the a.e. formula, representative independence, additivity and
   scalar dependence on $m$, and composition corresponding to multiplication
   of symbols. Prove
   $\|M_m\|\le\|m\|_\infty$ for arbitrary measures.
   Equality holds at $p=\infty$ for arbitrary measures and at finite $p$
   for sigma-finite measures. For finite $p$, select a finite
   positive-measure subset of a near-maximal level set; at infinity a
   positive-measure indicator does not need finite measure.
   Compare the general construction with Tau Ceti's existing complex $L^2$
   multiplication operator and B5's interval specialization.

4. **Integral kernels.** Let $K$ be compact metric with finite Borel measure
   $\mu$. Consume compactness of $K\times K$ in its native product topology.
   The source's sum product metric and the native maximum product metric
   satisfy $d_{\max}\le d_{\mathrm{sum}}\le2d_{\max}$, so they give the same
   topology and uniformity; no replacement metric instance is needed.
   Construct these maps using native continuous-function and `Lp`
   carriers:
   - For $k\in C(K\times K,\mathbb K)$,
     $T_kf(s)=\int_K k(s,t)f(t)\,d\mu(t)$ defines a bounded operator on
     $C(K,\mathbb K)$, with $\|T_k\|\le\mu(K)\|k\|_\infty$.
     Include continuity in $s$, linearity in $f$ and $k$, and continuity
     of the kernel-to-operator map with the same bound.
   - For $k\in L^\infty(\mu\times\mu)$ the same formula gives an a.e.
     defined operator on $L^\infty(\mu)$, with
     $\|T_k\|\le\mu(K)\|k\|_\infty$. Prove the a.e. section statements and
     independence of both kernel and input representatives.
   - For $k\in L^2(\mu\times\mu)$ it defines an operator on $L^2(\mu)$
     with $\|T_k\|\le\|k\|_2$. Supply a.e. section integrability,
     strong measurability and square integrability of the output, and
     continuity of the kernel-to-operator map. Cauchy–Schwarz and Fubini
     provide the bound, including complex kernels without inserting
     conjugation in the displayed operator formula.

   Compare the three maps on their common continuous-kernel domains.
   Finite discrete spaces recover the matrix formula with the specified
   measure weights. Use the kernel operator design of the Mathlib proposals
   cited below; provide the required generality in Tau Ceti rather than
   importing a new private `L²` carrier or assuming positivity of the kernel.
   Compactness and Hilbert–Schmidt classification are not prerequisites for
   these boundedness statements.

5. **The Volterra operator.** For Lebesgue measure on $(0,1)$, prove
   that
   $Vf(s)=\int_0^s f(t)\,dt$
   defines a continuous linear map $L^2(0,1)\to C([0,1],\mathbb K)$.
   Include representative independence, endpoint values, and
   $$
   |Vf(s)-Vf(t)|\le |s-t|^{1/2}\|f\|_2,\qquad
   \|Vf\|_\infty\le\|f\|_2.
   $$
   Compare it on continuous inputs with
   `ContinuousMap.unitIntervalIntegral`. The natural inclusion of continuous
   functions into $L^2(0,1)$ is contractive. Compose to obtain the $L^2$
   operator and identify its kernel as $\mathbf1_{\{0<t<s<1\}}$.
   Compute the squared kernel norm as $1/2$, giving
   $\|V\|\le1/\sqrt2$.

   Also prove the sharper main-text assertion $\|V\|=2/\pi$.
   An explicit route independent of a new spectral development is to prove,
   first for continuously differentiable $F$ with $F(0)=0$,
   $$
   \int_0^1|F(t)|^2\,dt\le\frac4{\pi^2}\int_0^1|F'(t)|^2\,dt.
   $$
   Supply the sharp inequality, not just a reference to an unnamed
   Poincaré theorem. One proof expands the nonnegative integral of
   $|F'-(w'/w)F|^2$ on $[\varepsilon,1]$ for
   $w(t)=\sin(\pi t/2)$; establish the endpoint limit at zero and use
   $w'(1)=0$. Apply the inequality to primitives of continuous inputs and
   extend by their density in $L^2$. The input
   $f(t)=\cos(\pi t/2)$ gives equality. Include the real and complex cases,
   applying the scalar inequality to real and imaginary parts as needed.

6. **Separating the operator convergence notions.** On $\ell^p(\mathbb N)$,
   $1\le p<\infty$, let $P_n$ keep the first $n$ coordinates.
   Prove $P_nx\to x$ for every $x$ and
   $\|I-P_n\|=1$, so convergence is strong but not in operator norm.
   For $1<p<\infty$, let $R$ be the right shift, with zero inserted at
   coordinate zero. Its powers preserve norms, converge weakly to zero
   against every continuous functional, and fail to converge strongly to
   zero. Use the scalar $\ell^p$ duality and finite-support approximation
   supplied by B3; testing coordinates alone is not enough.
   The reference to the $p=1$ problem imposes no additional problem-set target.

7. **Unbounded linear maps.** Exhibit a discontinuous algebraic linear
   functional on $\ell^2(\mathbb N,\mathbb K)$ and hence a linear map between
   Banach spaces that is not bounded. Use the linearly independent standard
   vectors, assign functional values growing along them, extend the linear
   map algebraically by a basis, and prove that a uniform norm bound is
   impossible. No particular solution of the excluded problem is prescribed.

*Needs:* BN3–BN7; native Hölder multiplication, Cauchy–Schwarz, Fubini, interval
FTC, continuous-function density in scalar $L^2$, and B3's scalar sequence-space
duality. The auxiliary sharp interval inequality is explicitly owned by BN8.5.

## Sources and API alignment

- Jan van Neerven, [*Functional Analysis*](https://arxiv.org/abs/2112.11166v8),
  second-edition manuscript, Chapter 1, “Banach Spaces,” main text
  sections 1.1–1.5. The supplied `ch01-BanachSpaces.tex` is the statement source;
  [Coverage.md](Coverage.md) records its hash, all 51 main-text environments,
  and the additional assertions in prose. No source TeX is redistributed.
- Mathlib PR [#42003](https://github.com/leanprover-community/mathlib4/pull/42003)
  and its bilinear-form companion
  [#43465](https://github.com/leanprover-community/mathlib4/pull/43465) develop
  an integral operator for Mercer's theorem. Follow their use of native $L^2$
  and bounded operators; BN8.4 additionally requires general kernels with
  the stated integrability and complex-scalar conventions.
- Mathlib PR [#42103](https://github.com/leanprover-community/mathlib4/pull/42103)
  supplies finite variation for finite-dimensional vector-measure targets.
  Follow that API for the scalar finiteness input in BN3.4; the Banach norm
  and completeness are further requirements.
- The [Riemann–Stieltjes discussion](https://leanprover-community.github.io/archive/stream/423402-PrimeNumberTheorem%2B/topic/Formalizing.20Riemann-Stieltjes.20theory.html)
  and Mathlib PR [#45112](https://github.com/leanprover-community/mathlib4/pull/45112)
  concern interval-based integration and periodic bounded-variation Riemann
  sums. BN7.1 uses native finite partitions and the Bochner integral on
  general compact metric spaces, with comparison rather than a competing
  integral definition.
- The linked library modules and owning roadmaps specify the remaining native
  and supplier interfaces. When an interface is available, use it; otherwise
  constructing the precisely stated supplier interface is work in its owning
  area, not a reason to replace it with an axiom.

[ml-complete]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Group/Completeness.lean
[ml-completion]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Module/Completion.lean
[ml-extend]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Operator/Extend.lean
[ml-module-topology]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Topology/Algebra/Module/Basic.lean
[ml-quotient]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Quotient.lean
[ml-pilp]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Lp/PiLp.lean
[ml-finite]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Module/FiniteDimension.lean
[ml-riesz]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Module/RieszLemma.lean
[ml-convex]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Convex/Topology.lean
[ml-convex-tb]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Convex/TotallyBounded.lean
[ml-lp]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/LpSpace/Complete.lean
[ml-variation]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/Variation/Basic.lean
[ml-holder]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/Holder.lean
[ml-strong]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean
[ml-bochner]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean
[ml-l1]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Bochner/L1.lean
[ml-ftc]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean
[ml-mean-value]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Calculus/MeanValue.lean
[tc-quotient]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Module/Quotient.lean
[tc-extend]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Operator/Extend.lean
[tc-dense]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Operator/Dense.lean
[tc-variation]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/VectorMeasure/Variation/Basic.lean
[tc-continuous-map]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Calculus/ContinuousMap.lean
[tc-multiplication]: https://github.com/TauCetiProject/TauCeti/blob/396c3bd971e9722aa8656231760e710fe641d8cf/TauCeti/MeasureTheory/Function/Lp/Multiplication.lean
[tc-riemann]: https://github.com/TauCetiProject/TauCeti/blob/396c3bd971e9722aa8656231760e710fe641d8cf/TauCeti/MeasureTheory/VectorMeasure/RiemannSums.lean
