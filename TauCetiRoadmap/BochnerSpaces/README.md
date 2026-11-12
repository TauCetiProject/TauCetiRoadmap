# Bochner spaces

Develop the measurable and integrable function theory needed for analysis with
Banach-space-valued functions: scalar tests for measurability, Bochner and Pettis
integration, Bochner spaces and their integral operators, vector measures, the
Radon–Nikodým property, and the duality of vector-valued $L^p$ spaces.
The principal milestones are the general Pettis measurability theorem, Hille's
theorem for closed operators, mixed-norm and tensor-product identifications,
Pettis integrability criteria, and the characterization of Bochner-space duality
by the Radon–Nikodým property. Build the restriction, approximation, transport,
norm estimates, and uniqueness results that make these theorems usable.

This README is the definitive specification. [Suggested.lean](Suggested.lean)
provides representative definitions and target signatures against the pinned
libraries; its admitted proofs are targets, and the file is not an exhaustive
checklist. The organization is by mathematical
topic; the references supply proofs and examples, rather than a prescribed order
of implementation. Suggested homes are the existing
`TauCeti/MeasureTheory/Function/`, `Integral/`, and `VectorMeasure/` trees, with
Banach-space lemmas in `TauCeti/Analysis/Normed/`.

## Scope and ownership

This roadmap owns the general Banach-valued integration and duality interfaces
below. It extends Mathlib's integration theory and Tau Ceti's existing analysis
APIs. Results already provided by those libraries are inputs, not requests for
second definitions or duplicate proofs.

The [source coverage index](Coverage.md) accounts for the main-text definitions,
results, remarks, examples, and substantive prose assertions in the reference.
It is a secondary index into the topic-based specification below. The chapter
notes impose no additional coverage requirement.

| Shared material | Owner and interface consumed here |
| --- | --- |
| Continuous duals, weak and weak-star topologies, Hahn–Banach separation, reflexivity and weak compactness | [Banach space theory](../BanachSpaceTheory/README.md), B1–B2; use native continuous duals, submodules and bidual embeddings |
| Classical sequence spaces, basic sequences, small perturbations and their scalar dualities | [Banach space theory](../BanachSpaceTheory/README.md), B3; use `lp` and `C₀(ℕ, 𝕜)` |
| Completed projective tensor products and their universal property | [Banach space theory](../BanachSpaceTheory/README.md), B4; BS4 owns the identification with Bochner $L^1$ |
| Densities for bounded-variation measures with reflexive Banach targets on finite measure spaces | [Banach space theory](../BanachSpaceTheory/README.md), B4.0, its finite-measure density prerequisite; BS7 consumes this theorem and supplies the general RNP interface and its consequences |
| Scalar $L^p$ duality, scalar measure representation and scalar Dunford–Pettis theory | [Banach space theory](../BanachSpaceTheory/README.md), B5; BS8 owns the Banach-valued duality theorem |
| Closed Hilbert-space operator and spectral theory | [Unbounded operators](../OperatorTheory/UnboundedOperators/README.md); BS2 uses `LinearPMap` and owns the integration theorem for closed operators between Banach spaces |
| Sobolev spaces, weak derivatives and Sobolev approximation | [Partial differential equations](../PDE/README.md); BS5 supplies integration-level comparisons with the existing convolution and mollification API |

The finite-measure reflexive density theorem is an input independent of the
general RNP characterization here. Do not make its construction depend on BS7 or
BS8, which would introduce a cycle. Likewise, the scalar duality input must not
be proved by specializing BS8. Build any missing supplier results in their owning
area with these interfaces.

The support-restricted $L^\infty_\sigma$ below uses global a.e. equivalence.
It is distinct from B5's local-null $L^\infty$ carrier for arbitrary Haar
measures, whose construction and duality remain in B5.

Martingale convergence, UMD spaces, stochastic integration, differentiability
characterizations of the RNP, Hardy–BMO duality, and Fourier multiplier theory are
outside this roadmap. Conditional expectation enters through the scalar
projection, contraction, and integral-preservation results and the
Banach-valued restriction formulas needed in BS7.

## Conventions

**Spaces and scalars.** Work over $\mathbb K=\mathbb R$ or $\mathbb C$, using
`RCLike` where appropriate. Banach spaces have explicit completeness assumptions;
retain weaker normed-space assumptions for results that do not need completeness.
Use `StrongDual 𝕜 X`, `ContinuousLinearMap`, `Submodule`, and
`NormedSpace.inclusionInDoubleDual`. The duality pairing is
$\langle x,x^*\rangle=x^*(x)$, bilinear also over $\mathbb C$; it has no inserted
complex conjugation. Convexity is over $\mathbb R$.

**Measurability.** Distinguish `StronglyMeasurable f`,
`AEStronglyMeasurable f μ`, and `AEFinStronglyMeasurable f μ`.
The last means approximation almost everywhere by simple functions whose
nonzero supports have finite measure. It is the reference book's stronger
“strongly $\mu$-measurable” convention. An essentially separable range means
containment almost everywhere in a closed separable linear subspace; it does
not assume that the entire target space is separable. Scalar weak measurability
tests all continuous linear functionals; the exceptional null set may initially
depend on the functional.

**Bochner spaces.** Unqualified $L^p(\mu;X)$ means Mathlib's native
`MeasureTheory.Lp X p μ`, with `p : ℝ≥0∞` and $1\le p\le\infty$.
Use `MemLp`, `Integrable`, `Measure.restrict`, and the native Bochner integral.
For $1\le p<\infty$, membership already implies
`AEFinStronglyMeasurable`. For $p=\infty$ this is false for arbitrary measures.
When that stronger endpoint is needed, write

$$
L^\infty_\sigma(\mu;X)
=\{f\in L^\infty(\mu;X):\operatorname{AEFinStronglyMeasurable}(f,\mu)\}.
$$

Realize it as a closed submodule of the native space, with the inherited norm,
not as another quotient of functions. BS1 and BS3 supply the comparison maps.
On a $\sigma$-finite space it equals the native $L^\infty$.
All equalities of $L^p$ elements and all formulas involving their representatives
must be independent of representative choices.

**Measures and endpoints.** Use arbitrary positive measures unless a target
specifies otherwise. State finite, $\sigma$-finite, probability and restricted-
measure assumptions separately. In particular, a sub-$\sigma$-algebra of a
$\sigma$-finite measure space need not carry a $\sigma$-finite restricted measure.
Integral identities carry integrability hypotheses; a totalized integral's
default zero value is not evidence of integrability. Use
`ENNReal.HolderConjugate` for conjugate exponents, including $1,\infty$.

**Operator-valued functions.** For $A:S\to\mathcal L(X,Y)$, orbitwise measurability
means measurability of $s\mapsto A(s)x$ for every fixed $x$.
It is distinct from strong measurability into the operator-norm topology.
Write the orbit conditions explicitly and keep these two hypotheses separate.

## Existing library interfaces

The source links below identify concrete inputs. The Mathlib and Tau Ceti links
use the revisions in this repository's `lake-manifest.json`
(`1b1ccf4b…` and `2fd255d9…`, respectively), except for the separately identified
scalar density extension. Import the individual supplying modules.

| Interface | Existing material and boundary |
| --- | --- |
| Strong and almost-everywhere strong measurability | Mathlib [Basic][ml-strong] and [AEStronglyMeasurable][ml-aestrong] give simple approximations, the measurable/separable-range criteria, and `AEFinStronglyMeasurable.exists_set_sigmaFinite`. [StronglyMeasurable/Lp][ml-strong-lp] gives `MemLp.aefinStronglyMeasurable` for finite nonzero exponents. BS1 adds the general continuous-dual tests. |
| A Pettis measurability special case | Tau Ceti [StronglyMeasurable/Pettis][tc-pettis] proves `TauCeti.aestronglyMeasurable_iff_forall_inner` for separable inner-product spaces and `aestronglyMeasurable_strongDual_iff_forall_apply` for their duals. These are not the general Banach-space theorem or a Pettis integral. |
| Applying measurable operator fields | Tau Ceti [Caratheodory][tc-caratheodory] supplies `AEStronglyMeasurable.apply_of_forall_of_continuous`; [InnerRegular][tc-innerregular] supplies finite-support localization and orbit-measurability lemmas with their stated regularity assumptions. Reuse these in BS1. |
| Bochner integration and $L^p$ | Mathlib [Bochner/Basic][ml-bochner], [Bochner/ContinuousLinearMap][ml-bochner-clm], [Integral/Prod][ml-prod], [SimpleFuncDenseLp][ml-simple], and [LpSpace/Complete][ml-lp-complete] supply the integral, bounded linear functoriality, Fubini, simple-function density and completeness. BS2–BS4 build the additional comparisons and closed-operator interfaces on these carriers. |
| Scalar norming and duality | Tau Ceti [Lp/Duality][tc-duality] supplies scalar `Lp.toDual` and finite-exponent inner-product norm tests; [L1Space/Dual][tc-l1dual] supplies `Lp.dualOneEquiv` for **finite** measures. [Normed/Lp/Dual][tc-seqdual] supplies scalar `lp.dualEquiv` for arbitrary index types. Banach-valued surjectivity is a further target. |
| Iterated norms | Tau Ceti [Lp/Iterated][tc-iterated] supplies `eLpNorm_prod_eq_eLpNorm_eLpNorm`, with the second measure s-finite. A section-norm identity, including one at $p=\infty$, does not establish strong measurability into an $L^p$ space or a Bochner-space isomorphism. |
| Convolution and approximation | Tau Ceti [Lp/Convolution][tc-convolution] supplies `convolutionLp`, Young's bound and the a.e. convolution formula for real kernels and finite exponents. [Lp/ApproximateIdentity][tc-approx] supplies normalized smooth-bump convergence, also for Banach-valued functions. BS5 extends and connects these results. |
| Vector measures and densities | Mathlib's `VectorMeasure`, `VectorMeasure.variation`, `Measure.withDensityᵥ` and [variation-of-density theorem][ml-density] already provide countable additivity and the identity $\lvert\mu\text{.withDensity}^v f\rvert=\mu\text{.withDensity}\,\|f\|$. Tau Ceti [VectorMeasure/WithDensity][tc-density] connects integration against such measures to Bochner integration. BS7 adds the Banach-space RNP and its representation theory. |
| Completion and measurable representatives | Mathlib [NullMeasurable][ml-null] supplies `NullMeasurableSpace`, `Measure.completion`, and `Measure.ae_completion`. Combine these with the native a.e. strong-measurability criteria in BS1.5. |
| Conditional expectation | Mathlib [Basic][ml-ce], [CondexpL2][ml-ce-l2], and [Real][ml-ce-real] supply `condExp`, `condExpL2`, integral preservation, positivity, and norm contraction. BS7.4 identifies the scalar $L^1$, $L^2$, and $L^\infty$ realizations and the finite-measure Banach-valued restriction interface. |
| Measure exhaustion | Mathlib [Decomposition/Exhaustion][ml-exhaustion] supplies `Measure.sigmaFiniteSetWRT` and maximal-support arguments. Its s-finiteness hypotheses do not replace the general measurable-set property lemma or the two-measure bounded-density exhaustion specified in BS7.1. |

There is also a Tau Ceti [scalar Radon–Nikodým extension][tc-scalar-rn], at
revision `396c3bd9…`, with `VectorMeasure.scalarRNDeriv` and
`withDensityᵥ_scalarRNDeriv`. Its target is an `RCLike` scalar field, not an
arbitrary Banach space. It is an additional scalar supplier when available in
the dependency; the pinned Mathlib signed/complex density APIs suffice for the
scalar input here. Its existence does not discharge the RNP targets.

For measurable structures generated by evaluations, follow the explicit,
non-global-instance design of [Mathlib PR #45494][ml-cylinder-pr]. That proposal
concerns the weak dual; BS1 concerns functions into a Banach space and must prove
its own comparison with the norm-Borel structure. Keep cylindrical and Borel
structures distinct until equality is established under stated hypotheses.

## BS1. Measurability

1. **Functions on a measurable space $(S,\mathcal A)$.** For a function
   $f:S\to X$ on a measurable space,
   prove that strong measurability is equivalent to a separable range together
   with measurability of every $x^*\circ f$. Allow tests from a weak-star dense
   linear subspace of $X^*$, equivalently a linear subspace separating the
   points of $X$. Build the countable separating and norming families on
   separable subspaces used to pass from scalar tests to norm-measurability.
   For separable $X$, identify the norm-Borel $\sigma$-algebra with the
   $\sigma$-algebra generated by these scalar evaluations.
   Express the latter using inverse images of Borel subsets of finite
   products of the scalar field. Record strong measurability as the conjunction
   of norm-Borel measurability and separable range; deduce coincidence of the
   three measurability notions for separable, in particular finite-dimensional,
   targets.
2. **Functions on a measure space $(S,\mathcal A,\mu)$.** Prove the corresponding criterion for
   `AEStronglyMeasurable` using essential separability and scalar
   `AEMeasurable` tests. Prove the finite-support criterion using essential
   separability and `AEFinStronglyMeasurable` scalar tests. Give the equivalence
   between `AEFinStronglyMeasurable f μ` and a.e. strong measurability together
   with vanishing off a measurable set on which $\mu$ is $\sigma$-finite.
   Use countable test families to obtain common exceptional sets where needed.
   Allow the scalar tests to range over a weak-star dense linear subspace.
   In particular, for a.e. strongly measurable $f,g$, scalar a.e. equality
   against every element of such a subspace implies $f=g$ a.e., even when
   the scalar exceptional sets initially depend on the functional.
3. **Approximation and transport.** Supply norm-dominated simple approximants,
   with finite-measure support in the finite-support version; closed-subspace
   restriction and inclusion; a.e. congruence; limits; and composition with
   continuous maps and Borel maps between Banach spaces. For Borel composition,
   establish separability of the image of the separable closed range containing
   $f$, using the Borel-image theorem for complete separable metric domains.
   Include continuous maps defined only on an open subset containing the
   range of $f$, using the subspace measurable structure.
   To preserve finite-support measurability require either $\sigma$-finite
   $\mu$ or that the composing map sends zero to zero.
4. **Operator-valued functions.** Use the Carathéodory API to prove measurability of
   $s\mapsto A(s)f(s)$ and of compositions of orbitwise measurable fields.
   Include pointwise, a.e., and finite-support forms. For separable $X$, prove
   measurability of $s\mapsto\|A(s)\|$ from a countable dense family of unit-ball
   vectors. Construct the bounded map
   $x\mapsto[s\mapsto A(s)x]$ into $L^p(\mu;Y)$ when every orbit belongs to that
   space, using the closed graph theorem. For $p=1$, integrate this map to
   obtain a continuous linear operator with the orbitwise integral formula.
   A common integrable majorant $\|A(s)x\|\le g(s)\|x\|$ gives operator norm
   at most $\int g$. Compare with the operator-norm Bochner integral when that
   stronger integrability hypothesis holds.
5. **Completion and preimages.** Use `NullMeasurableSpace S μ` and
   `μ.completion` for the completed domain. For a function with a globally
   separable range, prove that a.e. strong measurability is equivalent to
   strong measurability on the completed domain. Deduce the implication from
   `AEFinStronglyMeasurable`, and its converse when $\mu$ is $\sigma$-finite.
   Keep global separability here: arbitrary changes on a null set can destroy
   the separability needed for pointwise strong measurability.
   For an a.e. strongly measurable $f$, construct a strongly measurable
   representative $\widetilde f$. For every norm-Borel set $B$, prove that
   $\widetilde f^{-1}(B)$ is measurable, that $f^{-1}(B)$ is null measurable,
   and that their measures agree independently of the chosen representative.
   Use the native a.e. representative and measure APIs.
6. **Injective operators and measurability.** If $X$ is separable and
   $T:X\to Y$ is an injective continuous linear map, prove that $T\circ f$
   is strongly measurable if and only if $f$ is. Supply the corresponding
   a.e. and finite-support statements. Use the weak-star density of the
   adjoint range, with the relevant duality result from BanachSpaceTheory B1;
   no bounded inverse or closed range is assumed. The nonseparable
   counterexample is a target in BS9.

*Needs:* native strong-measurability and simple-function APIs; Hahn–Banach and
the closed graph theorem. Orbit integration uses the existing Bochner integral.

## BS2. The Bochner integral

Use the native Bochner integral and `Integrable`. Identify the integral of a
finite-support simple function with its finite sum, independently of the chosen
disjoint representation. Record additivity, scalar multiplication, a.e.
congruence, and $\|\int f\|\le\int\|f\|$. For an a.e. strongly measurable $f$,
identify integrability with approximation in $L^1$ by finite-support simple
functions, and with integrability of the norm. Relate this to the finite-support convention
in BS1. The limits of the simple integrals must agree with the native integral.
Include restriction, indicators, closed target-subspace integrability, and
commutation with continuous linear maps and scalar evaluations.

**Dominated convergence, substitution rule and Fubini's theorem.** Reuse
dominated convergence, including both $L^1$ convergence and convergence of
integrals. For a measurable $\phi:S\to T$ and strongly measurable $f:T\to X$,
give the equivalence of integrability for $f$ under $\mu.map\,\phi$ and for
$f\circ\phi$ under $\mu$, with the integral identity. On products of
$\sigma$-finite measure spaces, include strong measurability of sections
(pointwise for strongly measurable functions, a.e. for a.e. strongly measurable
functions), a.e. integrability of sections, integrability of the iterated
integrals, and equality with the product integral.
For arbitrary $\mu,\nu$, also prove the localized version: if a strongly
measurable $f:S\times T\to X$ vanishes off a countable union of measurable
rectangles of finite measure in each variable, finiteness of either iterated
norm integral gives both iterated Bochner integrals and their equality.
Explain the reduction to $\sigma$-finite restrictions and supply the
representative adapters used in BS4.

1. **Hille's theorem.** Let `T : X →ₗ.[𝕜] Y` be a native `LinearPMap` with closed
   graph, without assuming a dense domain. If $f$ and $g$ are Bochner integrable
   and $(f(s),g(s))\in\operatorname{graph}T$ almost everywhere, prove
   $(\int f,\int g)\in\operatorname{graph}T$. Give the equivalent statement
   $T\int f=\int Tf$ with explicit domain membership. Construct the lift to
   the closed graph as a Bochner-integrable function. Identify this with
   integrability in the domain's graph norm, comparing the inherited product
   norm with $\|x\|+\|Tx\|$. Do not assume graph-norm measurability as an
   unexplained additional input.
2. **Convexity and integration.** On a separable real normed space, express
   every closed convex set as a countable intersection of closed affine
   half-spaces. Express every real-valued lower-semicontinuous convex function
   as the pointwise supremum of a sequence of continuous affine minorants.
   Include the empty and whole-space cases for convex sets and the
   restriction-of-scalars versions for complex spaces. These countable
   representation results are targets in addition to Hahn–Banach separation.
   For a probability measure, an integrable $f$, and
   a real-valued lower-semicontinuous convex $\phi$ with $\phi\circ f$
   integrable, prove $\phi(\int f)\le\int\phi(f)$, using existing Jensen and
   separation results wherever their hypotheses apply. Prove that the integral
   lies in every closed convex set containing $f$ almost everywhere, and hence
   in the closed convex hull of its values on any measurable full-measure set.
   Give normalized-average versions on sets of finite positive measure.
3. **Detection by set integrals.** On a $\sigma$-finite space, if every
   finite-positive-measure average of an integrable $f$ lies in a closed convex
   set $C$, prove $f\in C$ almost everywhere. For arbitrary measures also give
   the version with $0\in C$, using finite-support localization. Prove a.e.
   equality, for arbitrary measures, of integrable functions whose set integrals
   agree on a generating pi-system containing the whole space. Include
   closed-subspace and scalar
   evaluation formulations.

*Needs:* BS1, native Bochner integration and `LinearPMap` graph operations;
Hahn–Banach separation. The real separation arguments apply to complex spaces
by restriction of scalars.

## BS3. The Bochner spaces $L^p(S;X)$

1. **Bochner spaces and closed subspaces.** On the native $L^p$ spaces, supply bounded
   postcomposition by continuous linear maps; closed target-subspace
   identifications; restriction and extension by zero; and the closed subspace
   corresponding to a smaller $\sigma$-algebra with its trimmed measure.
   Prove the representative formulas, norm bounds, and compatibility with
   composition. Record the norm formulas, the equivalence between membership
   of $f$ and of $\|f\|$ once measurability is supplied, and the identification
   of $L^1$ with integrable functions modulo a.e. equality.
   Reuse native completeness and a.e.-convergent subsequence results, including
   the infinity endpoint. Construct the closed submodule $L^\infty_\sigma$
   and its isometric comparison with the native endpoint under
   $\sigma$-finiteness.
2. **Approximation by $\mu$-simple functions.** Reuse finite-support simple-function density for $p<\infty$;
   give finite sums $\sum_j\phi_jx_j$ with scalar $\phi_j\in L^p$ as a dense
   subspace. For finite measures, allow indicator sets from a generating
   algebra. For Lebesgue measure on $\mathbb R^d$, $d\ge1$, prove density of
   finite sums $\sum_j\mathbf1_{Q_j}x_j$ with bounded cubes $Q_j$ whose sides
   are parallel to the coordinate axes; give rational dyadic cubes as a
   countable generating choice after restriction to bounded boxes.
   For $p=\infty$, prove bounded simple approximation locally in
   measure: on each finite-measure set and outside a set of arbitrarily small
   measure the approximation is uniformly accurate and has the same essential
   norm bound. Do not claim finite-range simple functions are norm dense in
   Banach-valued $L^\infty$.
   For $L^\infty_\sigma$, prove norm density of bounded countably-valued
   functions $\sum_{n\ge1}\mathbf1_{A_n}x_n$, where the measurable $A_n$ are
   disjoint and have finite measure. Give the uniform a.e. approximation and
   its norm bound, and distinguish this from finite-range simple approximation.
3. **Separability of Bochner spaces.** For $1\le p<\infty$ and nonzero $L^p(\mu;X)$,
   characterize separability by separability of $X$ and of the metric space of
   finite-measure measurable sets modulo null symmetric difference, with
   $d([A],[B])=\mu(A\mathbin\triangle B)$. Prove the equivalent measurable
   decomposition $S=S_0\sqcup S_1$: the restriction to $S_0$ is purely infinite
   (every measurable set has measure zero or infinity), and the restriction
   to $S_1$ is generated modulo null sets by countably many finite-measure
   sets. Choose this generating family to cover $S_1$ up to a null set.
   Prove $\mu|_{S_1}$ is $\sigma$-finite and restriction identifies the
   two $L^p$ spaces isometrically. Include the zero-space cases explicitly.
   Distinguish an exactly countably generated $\sigma$-algebra from generation
   modulo null sets by finite-measure sets. For $d\ge1$, show that the Borel
   $\sigma$-algebra of $\mathbb R^d$ is countably generated and that its
   Lebesgue completion is generated modulo null sets by bounded rational
   boxes but is not exactly countably generated. Use native countable-generation
   and completion structures, with the required cardinality argument for the
   last assertion.
4. **Scalar evaluations and the Bochner space $L^\infty(S;X)$.**
   First, let $Y$ be a closed linear subspace of $X^*$ and let $1\le p\le\infty$.
   If $x^*\circ f\in L^p(\mu)$ for every $x^*\in Y$, prove by the closed
   graph theorem that $T_f:x^*\mapsto[x^*\circ f]$ is a bounded linear map
   $Y\to L^p(\mu)$. Strong measurability of $f$ is not a hypothesis of
   this scalar-evaluation result.
   For a.e. strongly measurable $f$, prove
   that scalar essential boundedness of $x^*\circ f$ for every $x^*$ implies
   essential boundedness of $f$, with
   $\|f\|_\infty=\sup_{\|x^*\|\le1}\|x^*\circ f\|_\infty$.
   Establish the common bound by uniform boundedness and essential separability,
   rather than assuming it in each scalar hypothesis.

*Needs:* BS1; native $L^p$, closed graph and simple-density APIs. The finite-measure set quotient
and its metric are part of this layer, with set operations and null-set transport.

## BS4. Minkowski's inequality, Fubini's theorem and projective tensor products

1. **Minkowski's inequality, continuous version.** For arbitrary measure spaces and
   $1\le p\le q<\infty$, construct the injective contraction

   $$L^p(\mu;L^q(\nu;X))\longrightarrow L^q(\nu;L^p(\mu;X))$$

   that interchanges finite-measure rectangle tensors. Prove the norm bound,
   independence of approximations, and compatibility with bounded linear maps
   on $X$. At $p=q$ construct the inverse and the linear isometric equivalence.
   Localize the countably many simple approximants in each variable; do not
   assume that arbitrary product-measure Fubini is valid without finiteness
   hypotheses.
2. **Fubini's theorem.** For $\sigma$-finite $\mu,\nu$ and
   $1\le p<\infty$, construct
   $L^p(\mu;L^p(\nu;X))\simeq L^p(\mu\times\nu;X)$ as a linear isometry
   onto, with explicit rectangle formulas and a.e. section formulas for the
   inverse. Use the existing iterated-seminorm theorem; separately prove that
   the map into $L^p(\nu;X)$ is a.e. strongly measurable.
3. **Pointwise evaluation of $L^p$-valued integrals.** For arbitrary $\mu,\nu$, finite
   $p\ge1$, and Bochner-integrable $F:S\to L^p(\nu;X)$, construct a jointly
   strongly measurable representative $f(s,t)$ with
   $[f(s,\cdot)]=F(s)$ for $\mu$-almost every $s$. For $\nu$-almost every $t$,
   prove integrability of $f(\cdot,t)$ and the a.e. representative identity
   $(\int F)(t)=\int f(s,t)\,d\mu(s)$. Under $\sigma$-finiteness of both
   measures, prove uniqueness modulo product-measure null sets. Evaluation at
   a point is not a well-defined continuous functional on $L^p$; the result
   must go through representatives and integral estimates.
   Extend this statement to $p=\infty$ when $\nu$ is $\sigma$-finite, with
   the same section-integrability and a.e. integral formula; keep $\mu$
   arbitrary for existence. If both measures are $\sigma$-finite, give the
   same product-a.e. uniqueness. This does not assert an identification of
   all product $L^\infty$ with a Bochner space of $L^\infty$-valued functions.
4. **$L^1(S;X)$ as a projective tensor product.** Using B4's completed projective tensor
   product, extend $\phi\otimes x\mapsto[s\mapsto\phi(s)x]$ to the canonical
   linear isometric equivalence
   $L^1(\mu)\widehat\otimes_\pi X\simeq L^1(\mu;X)$ for arbitrary $\mu$.
   Prove the norm identity on finite tensors, surjectivity by simple-function
   density, and naturality under bounded linear maps in the target and
   measure-preserving pullbacks.

*Needs:* BS1–BS3, scalar Minkowski/Tonelli, the existing product-integral API;
BS4.4 also consumes BanachSpaceTheory B4's tensor construction.

## BS5. Convolution and mollification on $\mathbb R^d$

For Lebesgue measure on $\mathbb R^d$, $d\ge1$, extend the existing real-kernel
convolution API to scalar kernels over $\mathbb K$ and the full range
$1\le p\le\infty$. For $k\in L^1(\mathbb R^d)$ and
$f\in L^p(\mathbb R^d;X)$, prove a.e. Bochner integrability of
$y\mapsto k(y)f(x-y)$, the representative formula for $k*f$, and Young's bound
$\|k*f\|_p\le\|k\|_1\|f\|_p$. At $p=\infty$, construct the pointwise
integrals and their a.e. class directly; do not assume strong continuity of
translations on the whole $L^\infty$ space.

For $p<\infty$, connect compactly supported continuous-function density and
translation continuity to the native APIs. Include the density statement for
a locally compact Hausdorff domain with a regular Borel measure finite on
compact sets, using the existing continuous-function approximation interfaces.
Prove, for every scalar integrable
kernel, not just a positive normalized smooth bump,

$$
k_\varepsilon(x)=\varepsilon^{-d}k(x/\varepsilon),\quad
k_\varepsilon*f\longrightarrow\left(\int k\right)f
\quad\text{in }L^p,\qquad \varepsilon\downarrow0.
$$

Give the norm bounds, change-of-variables formula and compatibility with target
operators. Recover Tau Ceti's normalized bump operators through equality of
their a.e. representatives. Pointwise differentiation and Sobolev conclusions
belong to the owning analysis roadmaps.

*Needs:* BS3–BS4 and the existing convolution, translation and bump APIs.

## BS6. The Pettis integral

1. **Scalar integrability and the $\tau(X,Y)$-integral.** Let $Y$ be any
   closed linear subspace of $X^*$ and suppose that $x^*\circ f\in L^1(\mu)$
   for every $x^*\in Y$. Use the bounded scalar-evaluation map
   $T_f:Y\to L^1(\mu)$ from BS3.4.
   For every measurable $A$, construct the $\tau(X,Y)$-set integral
   $D_A^Yf\in Y^*$ by
   $\langle x^*,D_A^Yf\rangle=\int_A\langle f,x^*\rangle$.
   Prove existence, uniqueness, the bound $\|D_A^Yf\|\le\|T_f\|$,
   and the formula as the adjoint of $T_f$ applied to the scalar set-integral
   functional. Relate these integrals under inclusion of closed test
   subspaces by restriction of functionals.
   For $Y=X^*$ this is the Dunford set integral in $X^{**}$, and the
   hypothesis is weak integrability, expressed using native `Integrable`.
   Also construct the weak-star integral of $f:S\to X^*$ from integrability
   of every evaluation at $x\in X$. Supply scalar-evaluation, linearity,
   restriction, bounded-map and a.e.-congruence lemmas.
   For bounded maps $T:X\to Z$ and closed test subspaces $Y\subseteq X^*$,
   $W\subseteq Z^*$ with $T^*(W)\subseteq Y$, state functoriality through
   the adjoint of $T^*|_W:W\to Y$. For a Bochner-integrable $f$, identify
   $D_A^Yf$ with the evaluation functional $x^*\mapsto x^*(\int_A f)$.
2. **Pettis integrability.** Define it by weak integrability and, for every
   measurable $A$, existence of $x_A\in X$ representing $D_Af$ through the
   canonical bidual embedding. Prove uniqueness and expose the resulting
   set integral. Prove equivalence with the adjoint characterization: the
   transpose of $T_f$, applied to every bounded scalar integration functional
   on $L^1$, takes values in the embedded $X$. This uses the integration map
   from the native $L^\infty$ to $(L^1)^*$, not its surjectivity or injectivity
   on arbitrary measures. Prove bounded measurable scalar multiplication,
   functoriality and agreement with the Bochner integral.
3. **The induced vector measure.** Prove norm-countable additivity of
   $A\mapsto x_A$, not merely scalar countable additivity. Supply the
   Orlicz–Pettis series theorem used here: a series for which every subseries
   converges weakly in a Banach space is unconditionally norm convergent.
   Relate the scalar-integral bound to semivariation; do not assert bounded
   total variation for every Pettis integral.
4. **Existence criteria.** Weak integrability suffices in a reflexive target.
   If $f$ is a.e. strongly measurable, every $x^*\circ f$ belongs to $L^p$,
   and $1<p\le\infty$, then $\phi f$ is Pettis integrable for every scalar
   $\phi\in L^q$, $1/p+1/q=1$. Construct the bounded integration operator
   $L^q\to X$ and its scalar pairing. Deduce the finite-measure corollary:
   a strongly measurable, scalarly $L^p$ function is Pettis integrable
   for $p>1$, including $p=\infty$.
   Prove that a.e. strong measurability
   plus weak integrability suffices when $X$ contains no closed subspace
   isomorphic to $c_0$. Supply the required Bessaga–Pełczyński criterion:
   a sequence bounded away from zero with uniformly bounded finite signed
   partial sums has a closed span containing an isomorphic copy of $c_0$.
   Consume B3's basic-sequence and perturbation theory for this criterion.
5. **Convexity and uniqueness.** Prove Pettis versions of Jensen's inequality
   and the closed-convex-set barycentre statement under the hypotheses in BS2.
   For a.e. strong-measurable Pettis integrable functions, prove uniqueness
   from a generating pi-system of set integrals. Prove the average-in-a-convex-
   set criterion on $\sigma$-finite measure spaces with this same essential
   separability assumption. Distinguish equality after every scalar test from
   vector equality outside one common null set.

*Needs:* BS1–BS3, scalar $L^1$ theory, native bidual and weak-topology APIs, and
BanachSpaceTheory B1–B3. The series criteria in BS6.3–BS6.4 are explicit targets
here, not implicit consequences of the existence of a weak integral.

## BS7. More about the Radon–Nikodým property

1. **Vector measures and bounded variation.** Use native `VectorMeasure S X`, its variation measure
   and `μ.withDensityᵥ f`. Identify variation on a measurable set with the
   supremum over its finite measurable partitions. Record norm-countable
   additivity and unconditionality of the sums defining a vector measure;
   bounded variation means that its variation measure is finite.
   Connect null-set absolute continuity of a vector
   measure with absolute continuity of its variation. For finite total
   variation prove the equivalent small-set estimates in terms of
   $\|m(A)\|$ and $|m|(A)$. Reuse the variation-of-density formula
   $|m|(A)=\int_A\|f\|$; prove density uniqueness, restriction, bounded
   pushforward in the target, and change to an equivalent scalar measure.
   Include localization on finite-measure sets where the variation is bounded
   by a constant multiple of the reference measure.
   In particular, an integrable essentially bounded density satisfies
   $|m|(A)\le\|f\|_\infty\mu(A)$.
   Supply the measurable-set exhaustion principle: on a finite measure
   space, a property $P$ holds for every measurable set if it holds for all
   measurable null sets, every positive-measure measurable set has a positive-measure
   measurable subset with $P$, and $P$ is closed under countable disjoint
   measurable unions. As a further target, for $\sigma$-finite positive
   measures $\nu\ll\mu$, construct increasing measurable sets $S_n$
   covering the space such that $\mu(S_n),\nu(S_n)<\infty$ and, for finite
   constants $C_n\ge0$, $\nu(A)\le C_n\mu(A)$ for all measurable $A\subseteq S_n$.
   Scalar Radon–Nikodým derivatives may be used for this construction;
   the general exhaustion principle remains a separately available lemma.
   For $\sigma$-finite $\mu$, construct a strictly positive integrable
   measurable weight $w\le1$, so that $w\mu$ is finite and has the same null
   sets as $\mu$. Give the corresponding density-transport formulas and the
   gluing of compatible densities along a finite-measure exhaustion.
2. **The Radon–Nikodým property.** For a fixed measure $\mu$, define the RNP
   of $X$ with respect to $\mu$ by the assertion that every
   $m:\operatorname{VectorMeasure}(S,X)$ with finite total variation and
   $|m|\ll\mu$ has an integrable density $f$, with $m=\mu\text{.withDensity}^v f$.
   Define the intrinsic property using Lebesgue measure restricted to $[0,1]$.
   Prove its equivalence to the relative property for every finite measure
   space and for every $\sigma$-finite measure space. Do not quantify over
   all arbitrary positive measures in this characterization.
3. **Representable operators.** For $\sigma$-finite $\mu$, construct the
   isometric map
   $L^\infty(\mu;X)\to\mathcal L(L^1(\mu),X)$,
   $\phi\mapsto[f\mapsto\int f\phi]$.
   Show that it is onto exactly when $X$ has the RNP with respect to $\mu$.
   Give the a.e.-unique representing density, exact norm, indicator formulas,
   and composition with bounded target maps. For integrable $h$, prove relative
   norm compactness of $\{\int_A h:A\text{ measurable}\}$; obtain the
   corresponding range compactness for representable operators on finite
   measure spaces.
4. **Stability and separable determination.** Prove invariance under continuous
   linear equivalence and inheritance by closed subspaces. For $\sigma$-finite
   $\mu$, prove that relative RNP is equivalent to relative RNP of every closed
   separable subspace. Prove passage to sub-$\sigma$-algebras for finite measures,
   and the $\sigma$-finite variant with explicit $\sigma$-finiteness of the
   trimmed measure. Identify scalar conditional expectation on $L^2$ with
   the orthogonal projection onto the closed subspace of classes measurable
   for the smaller $\sigma$-algebra. Include integral preservation on its
   finite-measure sets, positivity, $|E f|\le E|f|$, and the $L^1$ contraction.
   Under $\sigma$-finiteness of the trimmed measure, construct the scalar
   $L^\infty$ contraction as the adjoint of the $L^1$ projection and prove
   agreement on intersections with $L^2$. Do not apply the totalized
   `condExp` to a nonintegrable bounded function to define this extension.
   On finite measures, reuse native Banach-valued conditional expectation
   and its norm bound to obtain a density measurable for the smaller
   $\sigma$-algebra; prove the scalar-pairing and set-integral identities.
   Obtain the required $\sigma$-finite formulas by localization and gluing.
5. **Universality of the unit interval $[0,1]$.** Supply the finite measure-algebra and
   operator-transport arguments needed for BS7.2: atomless probability spaces
   countably generated modulo null sets have the same measure algebra as
   $[0,1]$, with a measure-preserving Boolean isomorphism inducing the scalar
   $L^1$ isometry. Include divisibility of atomless finite measures:
   for measurable $A$ and $0\le t\le1$, construct a measurable subset of
   measure $t\mu(A)$ and its complementary part in $A$. Prove the converse
   and the corresponding characterization for $\sigma$-finite measures.
   Use this splitting to construct nested binary partitions with cell
   measures $2^{-n}$, generating the measure algebra of a countably
   generated atomless probability space. For an exactly countably generated
   $\sigma$-algebra, construct partitions generating that $\sigma$-algebra
   itself; distinguish this from generation modulo null sets on a completion.
   Supply the countably generated reductions used in the argument;
   do not require a pointwise isomorphism of
   the underlying sets. Handle atomic parts separately. Prove RNP for
   separable dual spaces, where the **dual itself** is separable, and for
   reflexive spaces. For the latter, consume B4.0's finite-measure reflexive
   density theorem and the equivalences above. Obtain the classical $\ell^p$
   examples for $1\le p<\infty$ and scalar $L^p$ examples for $1<p<\infty$.

*Needs:* BS1–BS3, native variation and scalar Radon–Nikodým APIs,
scalar and Banach-valued conditional-expectation APIs, and the
explicit BanachSpaceTheory suppliers above. Prove BS7.1 and BS7.3 for a fixed
measure before using them in separable determination and universality.

## BS8. Duality of Bochner spaces

1. **Elementary duality results.** Construct the canonical bounded linear map

   $$
   J:L^q(\mu;X^*)\longrightarrow(L^p(\mu;X))^*,\qquad
   (Jg)(f)=\int\langle f(s),g(s)\rangle\,d\mu(s).
   $$

   Prove the Hölder bound and naturality for bounded target maps. On
   $\sigma$-finite spaces, for every conjugate pair $1\le p,q\le\infty$,
   prove that $J$ is an isometry with closed, norming range. Allow $X^*$ to be
   replaced by any closed norming subspace. For arbitrary measures prove the
   same result for $1<p<\infty$; give the endpoint versions using
   $L^\infty_\sigma$ on the infinity side. Finite-support simple dual-valued
   functions of norm at most one already norm $L^1(\mu;X)$.
2. **Duality and the Radon–Nikodým property.** For $\sigma$-finite $\mu$ and $1\le p<\infty$,
   prove that $J$ is onto if and only if $X^*$ has the RNP with respect to
   $\mu$. Bundle the resulting linear isometric equivalence and its integral
   formula. Derive surjectivity for reflexive $X$ and for separable $X^*$.
   If $X^*$ has the intrinsic RNP, prove surjectivity for arbitrary measures
   when $1<p<\infty$, by localizing each functional to an appropriate
   $\sigma$-finite support. The localization lemma is part of this target.
3. **Duality of atomic Bochner spaces and $\ell^p(I;X)$.** Construct the vector-valued analogues of
   `lp.dualEquiv`: for arbitrary index sets and $1<p<\infty$,
   $(\ell^p(I;X))^*\simeq\ell^q(I;X^*)$, and
   $(\ell^1(I;X))^*\simeq\ell^\infty(I;X^*)$ using the full space of bounded
   dual-valued families. Prove the coordinate and sum-pairing formulas and
   their agreement with scalar `lp.dualEquiv`. Transfer the finite-exponent
   result to measure spaces whose $\sigma$-algebra is generated by atoms,
   with the appropriate atom weights; infinite-measure atoms contribute no
   nonzero finite-exponent vectors. Include the $p=1$ Bochner-space statement
   for $\sigma$-finite atomic spaces. For uncountable $I$, bounded families
   need not have separable range, so the sequence-space infinity endpoint
   must not be identified indiscriminately with a Bochner $L^\infty$ space.

*Needs:* BS1–BS4 and BS7; BanachSpaceTheory B3 and B5's scalar duality inputs.
BS8.1 and the atomic result do not require the RNP theorem.

## BS9. Examples that distinguish the hypotheses

These are formal mathematical targets, expressed through the same carriers and
maps as the preceding layers.

- On a nonseparable Banach space the identity is norm-Borel measurable but not
  strongly measurable. For an uncountable index set, show that the cylindrical
  $\sigma$-algebra of $\ell^2(I)$ is strictly smaller than its norm-Borel
  $\sigma$-algebra, using countable support of scalar tests.
- A nonzero constant is `AEFinStronglyMeasurable` exactly when the measure is
  $\sigma$-finite. On uncountable counting measure, the constant scalar one is
  in native $L^\infty$ but outside $L^\infty_\sigma$. On a singleton of infinite
  measure, native $L^1$ is zero and native $L^\infty$ is nonzero, so the
  unqualified endpoint integral-pairing isometry fails.
  On uncountable counting measure, construct the summation functional on
  scalar $L^1$ and prove that it has no representative in
  $L^\infty_\sigma$: testing singleton indicators forces the missing
  constant-one density. Also exhibit failure of finite-support measurability
  under composition with a map that sends zero to one.
- Let $f(t)=\mathbf1_{(0,t)}$ on $(0,1)$ with values in $L^\infty(0,1)$.
  Prove that its image under the injective inclusion into $L^2(0,1)$ is
  continuous, whereas $f$ is not a.e. strongly measurable in $L^\infty$.
  This supplies the nonseparable-domain counterexample for BS1.6.
- The translation field on $L^2(\mathbb R)$ has continuous orbits but is not
  a.e. strongly measurable in operator norm: distinct translations have
  distance two in that norm. This tests the operator-field conventions.
- The diagonal indicator for Lebesgue measure in one variable and uncountable
  counting measure in the other has unequal iterated integrals. The function
  $\mathbf1_{\{0<s<t<1\}}$ is in product $L^\infty$, but its sections do not
  give an a.e. strongly measurable map into $L^\infty(0,1)$.
- For disjoint positive-length intervals $A_n\subset(0,1)$,
  $f=\sum_n\mathbf1_{A_n}e_n/|A_n|$ with values in $c_0$ is strongly measurable
  and weakly integrable but not Pettis integrable: its Dunford integral is the
  constant one vector in $\ell^\infty$. Also exhibit cancellation on two
  copies of the interval, so a total Dunford integral in $X$ does not suffice
  to give Pettis integrability on every measurable subset.
- With $|A_n|=2^{-n}$, $n\ge1$, the $\ell^2$-valued function
  $\sum_n\mathbf1_{A_n}(2^n/n)e_n$ is Pettis integrable but not Bochner
  integrable. Its scalar integrals converge by Cauchy–Schwarz, whereas its
  norm integral is $\sum_n1/n$.
- For $1<p\le\infty$, construct the $\ell^p$-valued measure on the positive
  integers given by
  $m(A)=\sum_{j\in A}j^{-1}e_j$. Prove norm-countable additivity, including
  the supremum-norm endpoint, and compute
  $|m|(A)=\sum_{j\in A}j^{-1}$. Its total variation is infinite.
  Compare with the native finite-variation theorem for scalar complex
  measures. Thus norm-countable additivity alone does not give bounded
  variation in a Banach target.
- The field $t\mapsto e_t\in\ell^2([0,1])$ is scalarly zero almost everywhere
  for each fixed functional but has norm one everywhere. It is Pettis
  integrable with all set integrals zero. This prevents replacing the
  essential-separability hypotheses in BS6.5 by weak measurability alone.
- Show failure of RNP for $c_0$, $\ell^\infty$, $C[0,1]$, $L^\infty(0,1)$,
  and $L^1(0,1)$. For $c_0$, use a nonrepresentable operator
  $L^1(0,1)\to c_0$ with Rademacher-coordinate integrals: prove its coordinates
  tend to zero by dyadic step-function density, and that a representing
  density would have Rademacher coordinates almost everywhere. Transfer to
  spaces containing a closed copy of $c_0$. Also give the sine-coordinate
  example $(Tf)_n=\int_0^1f(t)\sin(2\pi nt)\,dt$: prove the coefficient decay
  from step-function density, and prove that the sine coordinates cannot
  tend to zero for almost every $t$. This yields a second explicit
  nonrepresentable operator without requiring Fourier multiplier theory.
  For $L^1(0,1)$, use the identity
  operator and the noncompact family of dyadic indicator images, contradicting
  BS7.3's compactness consequence. These proofs need neither a
  vector-valued differentiation theorem nor martingale convergence.

*Needs:* the corresponding preceding layers; native sequence-space and Hilbert
APIs; B3's classical-space comparisons. Construct the dyadic functions and the
closed $c_0$ embeddings used in the last example, including their norm estimates.

## Sources

- T. Hytönen, J. van Neerven, M. Veraar and L. Weis,
  [*Analysis in Banach Spaces, Volume I: Martingales and Littlewood–Paley
  Theory*](https://doi.org/10.1007/978-3-319-48520-1), Springer, 2016,
  Chapter 1, “Bochner spaces,” §§1.1–1.3 and the notes on projective tensor
  products and operator-valued functions. The updated author-supplied
  `Integration.tex` supplies the source statements. The mathematical statements
  and hypotheses in this roadmap govern the targets, including the explicit
  comparisons between the book's and Mathlib's measurability conventions.
  [Coverage.md](Coverage.md) indexes §§1.1–1.3, including their unnamed
  statements, and records the precise formulations used here.
- J. Diestel and J. J. Uhl, Jr., *Vector Measures*, Mathematical Surveys 15,
  American Mathematical Society, 1977: vector measures, Pettis integration,
  representable operators and the Radon–Nikodým property.
- The Mathlib and Tau Ceti source modules linked above specify the existing
  formal interfaces. The cited Banach space and operator roadmaps specify
  supplier results whose implementation is part of those areas.

[ml-strong]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean
[ml-aestrong]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/AEStronglyMeasurable.lean
[ml-strong-lp]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Lp.lean
[ml-bochner]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean
[ml-bochner-clm]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean
[ml-prod]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Prod.lean
[ml-simple]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/SimpleFuncDenseLp.lean
[ml-lp-complete]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/LpSpace/Complete.lean
[ml-density]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/WithDensityVec.lean
[tc-pettis]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/StronglyMeasurable/Pettis.lean
[tc-caratheodory]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean
[tc-innerregular]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/StronglyMeasurable/InnerRegular.lean
[tc-duality]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/Duality.lean
[tc-l1dual]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/L1Space/Dual.lean
[tc-seqdual]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Lp/Dual.lean
[tc-iterated]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/Iterated.lean
[tc-convolution]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/Convolution.lean
[tc-approx]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/ApproximateIdentity.lean
[tc-density]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/VectorMeasure/WithDensity.lean
[tc-scalar-rn]: https://github.com/TauCetiProject/TauCeti/blob/396c3bd971e9722aa8656231760e710fe641d8cf/TauCeti/MeasureTheory/VectorMeasure/Decomposition/RadonNikodym.lean
[ml-cylinder-pr]: https://github.com/leanprover-community/mathlib4/pull/45494
[ml-null]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/NullMeasurable.lean
[ml-ce]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean
[ml-ce-l2]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean
[ml-ce-real]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/Real.lean
[ml-exhaustion]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/Decomposition/Exhaustion.lean
