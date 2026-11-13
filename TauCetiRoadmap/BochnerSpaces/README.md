# Roadmap: bochner spaces

**Summary.** Develop measurability, Bochner and Pettis integration, Bochner spaces,
integral operators and vector measures for Banach-valued functions. Prove the
general Pettis measurability theorem, Hille's theorem for closed operators,
mixed-norm and tensor-product identifications, Pettis integrability criteria,
and the characterization of Bochner-space duality by the Radon–Nikodým property,
with restriction, approximation, transport, norm estimates and uniqueness results.

## Scope and ownership

This roadmap extends Mathlib and Tau Ceti with general Banach-valued integration
and duality. Existing library results are inputs.

| Shared material | Owner and interface consumed here |
| --- | --- |
| Continuous duals, weak and weak-star topologies, Hahn–Banach separation, reflexivity and weak compactness | [Banach space theory](../BanachSpaceTheory/README.md), B1–B2; use native continuous duals, submodules and bidual embeddings |
| Classical sequence spaces, basic sequences, small perturbations and their scalar dualities | [Banach space theory](../BanachSpaceTheory/README.md), B3; use `lp` and `C₀(ℕ, 𝕜)` |
| Densities for bounded-variation measures with reflexive Banach targets on finite measure spaces | [Banach space theory](../BanachSpaceTheory/README.md), B4.0, its finite-measure density prerequisite; §7 consumes this theorem and supplies the general RNP interface and its consequences |
| The weakly-unconditionally-Cauchy criterion for spaces containing no copy of c₀ | [Banach space theory](../BanachSpaceTheory/README.md), B4.1; §6.4 applies this series criterion to Pettis integrability |
| Scalar `Lᵖ` duality, scalar measure representation and scalar Dunford–Pettis theory | [Banach space theory](../BanachSpaceTheory/README.md), B5; §8 owns the Banach-valued duality theorem |

Prove the finite-measure reflexive density theorem independently of §7–§8,
and scalar duality independently of §8, to avoid circular dependencies.
Build missing supplier results in their owning area with these interfaces.

The support-restricted `L∞_σ` below uses global a.e. equivalence.
It is distinct from B5's local-null `L∞` carrier for arbitrary Haar
measures, whose construction and duality remain in B5.

Martingale convergence, UMD spaces, stochastic integration, differentiability
characterizations of the RNP, Hardy–BMO duality, and Fourier multiplier theory are
outside this roadmap. Conditional expectation enters through the scalar
projection, contraction, and integral-preservation results and the
Banach-valued restriction formulas needed in §7.

## Conventions

**Spaces and scalars.** Work over `𝕜=ℝ` or `ℂ`, using
`RCLike` where appropriate. Assume completeness only where needed.
Use `StrongDual 𝕜 X`, `ContinuousLinearMap`, `Submodule`, and
`NormedSpace.inclusionInDoubleDual`. The duality pairing is
`⟨x,x*⟩ = x*(x)`, bilinear also over `ℂ`. Convexity is over `ℝ`.

**Measurability.** Distinguish `StronglyMeasurable f`,
`AEStronglyMeasurable f μ`, and `AEFinStronglyMeasurable f μ`.
The last means approximation almost everywhere by simple functions whose
nonzero supports have finite measure. It is the reference book's stronger
“strongly μ-measurable” convention. An essentially separable range means
containment almost everywhere in a closed separable linear subspace of a possibly
nonseparable target. Scalar weak measurability tests all continuous linear
functionals; the exceptional null set may depend on the functional.

Evaluation-generated σ-algebras are explicit structures, never global instances.
Section 1.1 proves their comparison with the norm-Borel σ-algebra under its
separability hypotheses.

**Bochner spaces.** Unqualified `Lᵖ(μ;X)` means Mathlib's native
`MeasureTheory.Lp X p μ`, with `p : ℝ≥0∞` and `1≤ p≤∞`.
Use `MemLp`, `Integrable`, `Measure.restrict`, and the native Bochner integral.
For `1≤ p<∞`, membership already implies
`AEFinStronglyMeasurable`. For `p=∞` this is false for arbitrary measures.
When that stronger endpoint is needed, write

`L∞_σ(μ;X) = {f ∈ L∞(μ;X) : AEFinStronglyMeasurable f μ}`.

Realize it as a closed submodule of the native space, with the inherited norm.
§1 and §3 supply the comparison maps.
On a σ-finite space it equals the native `L∞`.
All equalities of `Lᵖ` elements and all formulas involving their representatives
must be independent of representative choices.

**Measures and endpoints.** Use arbitrary positive measures unless a target
specifies otherwise. State finite, σ-finite, probability and restricted-
measure assumptions separately. In particular, a sub-σ-algebra of a
σ-finite measure space need not carry a σ-finite restricted measure.
Integral identities carry integrability hypotheses; a totalized integral's
default zero value is not evidence of integrability. Use
`ENNReal.HolderConjugate` for conjugate exponents, including `1,∞`.

**Operator-valued functions.** For `A:S→𝓛(X,Y)`, orbitwise measurability
means measurability of `s↦ A(s)x` for every fixed `x`.
It is distinct from strong measurability into the operator-norm topology.

## Existing results

**From Mathlib.** Use the following native carriers and theorems, with the measure
hypotheses in their declarations.

- [Strong measurability][ml-strong], [a.e. strong measurability][ml-aestrong] and
  [finite-exponent localization][ml-strong-lp] supply simple approximations,
  measurable/separable-range criteria, `AEFinStronglyMeasurable.exists_set_sigmaFinite`
  and `MemLp.aefinStronglyMeasurable`.
- [Bochner integration][ml-bochner] supplies `SimpleFunc.integral_eq_sum`,
  `integral_add`, scalar multiplication, a.e. congruence and the integral norm bound.
  [Continuous linear maps][ml-bochner-clm] supply integrability and integral commutation.
  Use `tendsto_integral_of_dominated_convergence` from [dominated convergence][ml-dominated]
  and `integrable_map_measure` from [integrability][ml-integrable] for the native
  convergence and substitution results, including L¹ convergence.
- [Convex integration][ml-convex-integral] supplies `Convex.integral_mem`,
  `Convex.set_average_mem` and `ConvexOn.map_integral_le` for closed-convex
  barycentres, normalized averages and the continuous case of Jensen's inequality.
  Section 2.2 supplies countable convex representations and the lower-semicontinuous case.
- [Product integration][ml-prod] supplies `Integrable.prod_right_ae`,
  `Integrable.integral_prod_left` and `integral_prod` under their s-finiteness hypotheses.
  Section 2.4 supplies the finite-support localization for arbitrary measures.
- [Simple-function density][ml-simple] and [completeness][ml-lp-complete] supply
  native `Lp`, `MemLp`, finite-exponent simple density, completeness and
  a.e.-convergent subsequences. Section 3 supplies the additional comparisons.
- [Vector measures and densities][ml-density] supply `VectorMeasure`,
  `VectorMeasure.variation`, `Measure.withDensityᵥ` and the variation-of-density
  identity. [Variation][ml-variation] supplies `VectorMeasure.le_variation` and
  `VectorMeasure.exists_lt_sum_of_lt_variation` for the finite-partition formula.
  Scalar signed/complex Radon–Nikodým theorems supply the scalar density
  input; a Banach-valued density theorem is a separate supplier below.
- [Completion][ml-null] supplies `NullMeasurableSpace`, `Measure.completion` and
  `Measure.ae_completion`. [Measure exhaustion][ml-exhaustion] supplies
  `Measure.sigmaFiniteSetWRT` with its stated hypotheses.
- [Measured sets][ml-measured-sets] supplies `MeasuredSets μ` and
  `MeasuredSets.edist_def`, the symmetric-difference pseudodistance. Use native
  `SeparationQuotient` for its metric quotient in §3.3.
  [Separable measures][ml-separable-measure] supplies `Measure.MeasureDense`,
  `MeasureTheory.IsSeparable` and `MeasureTheory.Lp.SecondCountableTopology` for the
  sufficient direction of Bochner-space separability. Section 3.3 supplies the
  quotient comparison, converse and measurable decomposition.
- [Conditional expectation][ml-ce], [the L² projection][ml-ce-l2] and
  [the real order API][ml-ce-real] supply `condExp`, `condExpL2`, integral preservation,
  positivity, the modulus inequality and L¹ contraction under their declared
  hypotheses. In particular, `integral_condExpL2_eq` preserves integrals on
  finite-measure sets of the smaller σ-algebra without assuming its measure is
  σ-finite. Section 7.4 supplies the scalar L¹ extension for arbitrary measures,
  compares the native realizations and uses Banach-valued conditional expectation
  for densities.
- Use native `LinearPMap` and its closed graph, continuous duals, the canonical
  bidual embedding, Hahn–Banach separation, the closed graph theorem and uniform
  boundedness.

**From Tau Ceti.**

- [Completed tensor products][tc-tensor-completion] supplies
  `TauCeti.CompletedProjectiveTensor` and
  `TauCeti.CompletedProjectiveTensor.liftIsometry`, the universal isometry between
  bounded bilinear maps and bounded maps out of the completion.
  [The projective norm][tc-tensor] supplies `TauCeti.ProjectiveTensor.tmulL`.
  Section 4.4 identifies this carrier with Bochner L¹.
- [Pettis measurability][tc-pettis] supplies
  `TauCeti.aestronglyMeasurable_iff_forall_inner` and
  `aestronglyMeasurable_strongDual_iff_forall_apply` for separable inner-product
  spaces. Section 1 gives the general Banach-space scalar-test theorem.
- [Carathéodory measurability][tc-caratheodory] supplies
  `AEStronglyMeasurable.apply_of_forall_of_continuous`;
  [inner regularity][tc-innerregular] supplies finite-support and orbit-measurability
  results with their regularity assumptions.
- [Lp duality][tc-duality] supplies scalar `Lp.toDual` and finite-exponent
  inner-product norm tests. [L¹ duality][tc-l1dual] supplies `Lp.dualOneEquiv` for
  finite measures. [Sequence duality][tc-seqdual] supplies scalar `lp.dualEquiv`.
  [Hölder pairing][tc-holder] supplies `MemLp.integrable_apply`; the pairing map itself
  is Mathlib's `ContinuousLinearMap.lpPairing` and its integral formula is
  `ContinuousLinearMap.lpPairing_eq_integral`.
- [Iterated norms][tc-iterated] supplies `eLpNorm_prod_eq_eLpNorm_eLpNorm` when the
  second measure is s-finite. A section-norm identity alone does not give strong
  measurability into an Lᵖ space.
- [Minkowski's integral inequality][tc-minkowski] supplies
  `TauCeti.lintegral_Lp_lintegral_le` for nonnegative extended-real integrands,
  a finite real exponent at least one, a σ-finite outer measure and an s-finite
  inner measure. Section 4.1 uses it after localization and constructs the
  Banach-valued mixed-norm interchange map.
- [Convolution][tc-convolution] supplies `convolutionLp`, Young's bound and the a.e.
  formula for real kernels and finite exponents. [Approximate identities][tc-approx]
  supplies normalized smooth-bump convergence for Banach-valued functions.
- [Integration against vector densities][tc-density] connects the native density
  vector measure to Bochner integration.

**From [BanachSpaceTheory](../BanachSpaceTheory/README.md).** B1–B2 supply continuous-dual
and weak-topology comparisons, annihilators, adjoints, reflexivity and weak compactness.
B3 supplies the classical sequence-space comparisons, basic sequences and small
perturbations. B4.1 supplies the equivalence between absence of a copy of c₀ and
unconditional convergence of every series with uniformly bounded finite signed
partial sums, used in §6.4. B4.0 supplies the finite-measure density theorem for
bounded-variation measures with reflexive targets, independently of the general RNP
and duality theorems here. B5 supplies scalar Lᵖ duality and scalar measure
representation.

## Layer order

Layers 1–3 establish measurability, the additional integral interfaces and Bochner-space
comparisons. Layer 4 gives mixed-norm and tensor identifications; Layer 5 gives convolution
and approximation. Layer 6 develops Pettis integration from Layers 1–3, independently
of Layers 4–5. In Layer 7, first prove §7.1 and
§7.3 for a fixed measure, then §7.4–§7.5, and finally the universality assertions of §7.2;
the definition in §7.2 is available throughout. Layer 8 uses these RNP results for duality;
its pairing and atomic parts are independent of RNP. Layer 9 collects the counterexamples
used by the preceding layers. Each *Needs:* line lists the inputs to that target.
The README specifies the full theory; [Suggested.lean](Suggested.lean) gives suggested
headline signatures, not an exhaustive checklist.

## Layer 1: Measurability

### 1.1 Pettis measurability on a measurable space

For `f:S→ X` on a measurable space, prove that strong measurability is
equivalent to a separable range together
with measurability of every `x*∘ f`. Allow tests from a weak-star dense
linear subspace of `X*`, equivalently a linear subspace separating the
points of `X`. Build the countable separating and norming families on
separable subspaces used to pass from scalar tests to norm-measurability.
For separable `X`, identify the norm-Borel σ-algebra with the
σ-algebra generated by these scalar evaluations.
Express the latter using inverse images of Borel subsets of finite
products of the scalar field. Record strong measurability as the conjunction
of norm-Borel measurability and separable range; deduce coincidence of the
three measurability notions for separable, in particular finite-dimensional,
targets.

`stronglyMeasurable_iff_scalar_tests` states the full-dual criterion.

(HvNVW, Proposition 1.1.1 and Corollary 1.1.2, p. 3; Theorem 1.1.6, p. 5; Corollary 1.1.10, pp. 6–7.)

**API.**

- Characterize measurability into it by measurability of each scalar evaluation, and give the finite-coordinate cylinder generators.
- Prove monotonicity when the family of tests is enlarged and measurability of bounded linear maps whose adjoints preserve the chosen test families.
- Compare it with the norm-Borel σ-algebra under the stated separability and separation hypotheses, retaining the explicit measurable structure.

**Checks.**

- On 𝕜², the two coordinate tests generate the product Borel σ-algebra; a map into 𝕜² is strongly measurable exactly when both coordinates are measurable.
- The zero test alone generates the trivial σ-algebra on a nonzero space and cannot distinguish zero from a nonzero vector. The separation hypothesis is necessary.
- On ℓ²(I) for uncountable I, the open unit ball is not in the evaluation-generated σ-algebra: any countable collection of functionals misses some coordinate i, so it has identical evaluations on 0 and eᵢ, whose norms are 0 and 1. Thus the norm-Borel comparison requires its separability hypothesis.

*Needs:* Native strong measurability, Hahn–Banach and BanachSpaceTheory B1.

### 1.2 Pettis measurability on a measure space

Characterize `AEStronglyMeasurable` by essential separability and scalar
`AEMeasurable` tests. Prove the finite-support criterion using essential
separability and `AEFinStronglyMeasurable` scalar tests. Give the equivalence
between `AEFinStronglyMeasurable f μ` and a.e. strong measurability together
with vanishing off a measurable set on which `μ` is σ-finite.
Use countable test families to obtain common exceptional sets.
Allow the scalar tests to range over a weak-star dense linear subspace.
For a.e. strongly measurable `f,g`, scalar a.e. equality
against every element of such a subspace implies `f=g` a.e., even when
the scalar exceptional sets initially depend on the functional.

`aestronglyMeasurable_iff_scalar_tests` and `aefinStronglyMeasurable_iff_scalar_tests` state the two distinct measure-space criteria.

(HvNVW, Proposition 1.1.15, p. 8; Theorem 1.1.20 and Corollaries 1.1.21–1.1.25, pp. 10–11.)

*Needs:* §1.1 and native a.e./finite-support measurability.

### 1.3 Approximation and transport

Supply norm-dominated simple approximants,
with finite-measure support in the finite-support version; closed-subspace
restriction and inclusion; a.e. congruence; limits; and composition with
continuous maps between Banach spaces. Use preservation of separability
under continuous images and the pointwise and a.e. composition APIs.
Include continuous maps defined only on an open subset containing the
range of `f`, using the subspace measurable structure.
To preserve finite-support measurability require either σ-finite
`μ` or that the composing map sends zero to zero.

(HvNVW, Corollaries 1.1.7–1.1.11 and Lemma 1.1.12, pp. 6–7; Corollaries 1.1.21–1.1.24, pp. 10–11; continuous composition as in the [errata][hvn-errata], entry for p. 7.)

*Needs:* §1.1–§1.2, native continuous composition and preservation of separability under continuous images.

### 1.4 Operator-valued functions

Use the Carathéodory API to prove measurability of
`s↦ A(s)f(s)` and of compositions of orbitwise measurable fields.
Include pointwise, a.e., and finite-support forms. For separable `X`, prove
measurability of `s↦‖A(s)‖` from a countable dense family of unit-ball
vectors. Construct the bounded map
`x↦[s↦ A(s)x]` into `Lᵖ(μ;Y)` when every orbit belongs to that
space, using the closed graph theorem. For `p=1`, integrate this map to
obtain a continuous linear operator with the orbitwise integral formula.
A common integrable majorant `‖A(s)x‖≤ g(s)‖x‖` gives operator norm
at most `∫ g`. Compare with the operator-norm Bochner integral when that
stronger integrability hypothesis holds.

(HvNVW, Definition 1.1.27, Proposition 1.1.28 and Corollary 1.1.29, pp. 12–13; the orbit-integration conclusion follows from the closed graph theorem and native Bochner integration.)

**API.**

- Prove measurability of evaluation on a strongly measurable vector field, with pointwise, a.e. and finite-support versions.
- Prove closure under addition, scalar multiplication and composition, keeping orbitwise and operator-norm hypotheses distinct.
- Supply the orbit-map norm estimate and the operator-valued integration formula under the stated integrability hypotheses.

**Checks.**

- A constant field A(s) = T gives the constant orbit Tx and its usual operator norm.
- Translations on L²(ℝ) have continuous orbits, but distinct translations are distance two in operator norm; orbit measurability cannot imply operator-norm strong measurability.
- On a probability space, integrating the constant field T gives T; on a finite measure space it gives μ(S)T.

*Needs:* §1.1–§1.3, Tau Ceti Carathéodory, closed graph and native Bochner integration.

### 1.5 Completion and preimages

Use `NullMeasurableSpace S μ` and
`μ.completion` for the completed domain. For a function with a globally
separable range, prove that a.e. strong measurability is equivalent to
strong measurability on the completed domain. Deduce the implication from
`AEFinStronglyMeasurable`, and its converse when `μ` is σ-finite.
Changes on a null set can destroy separability of the range.
For an a.e. strongly measurable `f`, construct a strongly measurable
representative `f̃`. For every norm-Borel set `B`, prove that
`f̃^{-1}(B)` is measurable, that `f^{-1}(B)` is null measurable,
and that their measures agree independently of the chosen representative.
Use the native a.e. representative and measure APIs.

(HvNVW, Proposition 1.1.16 and Remarks 1.1.18–1.1.19, p. 9.)

*Needs:* §1.2–§1.3 and Mathlib measure completion.

### 1.6 Injective operators and measurability

If `X` is separable and `T:X→ Y` is an injective continuous linear map,
prove that `T∘ f` is strongly measurable if and only if `f` is.
Prove the a.e. and finite-support versions. Use the weak-star density of the
adjoint range from BanachSpaceTheory B1; no bounded inverse or closed range
is assumed. The nonseparable
counterexample is a target in §9.

(HvNVW, Example 1.1.26, pp. 11–12, and the adjoint-range argument preceding it.)

*Needs:* §1.1–§1.2 and BanachSpaceTheory B1 adjoint-range density.

### Examples

The nonseparable identity, moving indicators and translation fields in §9 distinguish norm-Borel, scalar, strong and orbitwise measurability (HvNVW, Examples 1.1.5 and 1.1.26, pp. 4–5 and 11–12).

### Dependencies

native strong-measurability and simple-function APIs; Hahn–Banach and
the closed graph theorem. Orbit integration uses the existing Bochner integral.

## Layer 2: The Bochner integral

Use the native Bochner integral, `Integrable`, finite simple sums, dominated
convergence, substitution and σ-finite Fubini supplied above. Their norm estimates,
restriction and indicator rules, a.e. congruence and bounded-linear-map commutation
are inputs (HvNVW, Definition 1.2.1 and Propositions 1.2.2–1.2.3, pp. 13–15;
Propositions 1.2.5–1.2.7, pp. 16–18).

### 2.1 Hille's theorem

Let `T : X →ₗ.[𝕜] Y` be a native `LinearPMap` with closed
graph, without assuming a dense domain. If `f` and `g` are Bochner integrable
and `(f(s),g(s))∈ graph T` almost everywhere, prove
`(∫ f,∫ g)∈ graph T`. Give the equivalent statement
`T∫ f=∫ Tf` with explicit domain membership. Construct the lift to
the closed graph as a Bochner-integrable function. Identify this with
integrability in the domain's graph norm, comparing the inherited product
norm with `‖x‖+‖Tx‖`. Use completeness of the closed graph to obtain
completeness of this graph-norm domain, and prove that its inclusion into
`X` and the map `T` into `Y` are bounded, each with norm at most one.

`integral_mem_graph` states the closed-graph conclusion for complete X and Y.

(HvNVW, Theorem 1.2.4, pp. 15–16.)

*Needs:* §1, native Bochner integration and LinearPMap, closed submodules of a product.

### 2.2 Convexity and integration

On a separable real normed space, express
every closed convex set as a countable intersection of closed affine
half-spaces. Express every real-valued lower-semicontinuous convex function
as the pointwise supremum of a sequence of continuous affine minorants.
Include the empty and whole-space cases for convex sets and the
restriction-of-scalars versions for complex spaces.
For a probability measure, an integrable `f`, and
a real-valued lower-semicontinuous convex `φ` with `φ∘ f`
integrable, prove `φ(∫ f)≤∫φ(f)`, using existing Jensen and
separation results wherever their hypotheses apply; `ConvexOn.map_integral_le`
supplies the continuous case. Give the lower-semicontinuous inequality also for
normalized averages on sets of finite positive measure.
Use Mathlib's `Convex.integral_mem` and `Convex.set_average_mem` for membership
of these integrals and averages in closed convex sets containing `f` almost
everywhere. Deduce membership in the closed convex hull of the values on any
measurable full-measure set.

(HvNVW, Lemmas 1.2.9–1.2.10 and Propositions 1.2.11–1.2.12, pp. 18–20.)

*Needs:* §1, native Bochner integration and Hahn–Banach separation.

### 2.3 Detection by set integrals

On a σ-finite space, if every
finite-positive-measure average of an integrable `f` lies in a closed convex
set `C`, prove `f∈ C` almost everywhere. For arbitrary measures also give
the version with `0∈ C`, using finite-support localization. Prove a.e.
equality, for arbitrary measures, of integrable functions whose set integrals
agree on a generating pi-system containing the whole space. Include
closed-subspace and scalar-evaluation formulations.

`ae_mem_of_set_averages` states the σ-finite convex-detection theorem.

(HvNVW, Propositions 1.2.13–1.2.14, p. 20, with the measure hypotheses above.)

*Needs:* §1, §2.2, scalar set-integral uniqueness and finite-support localization.

### 2.4 Finite-support comparison and localized Fubini

For an a.e. strongly measurable function, connect native integrability with
approximation in L¹ by finite-support simple functions and with integrability
of its norm. Show that
the limits of the simple integrals agree with the native integral, using the
native simple-density and convergence results. Include the closed-target-subspace
comparison and the compatibility with finite-support measurability from §1.
For arbitrary measures μ, ν, if a jointly strongly measurable f vanishes off a
countable union of measurable rectangles of finite measure in each variable,
finiteness of either iterated norm integral gives both iterated Bochner integrals
and their equality. Reduce to σ-finite restrictions and provide the representative
adapters needed in §4. Include pointwise section measurability for strongly
measurable functions, and, for σ-finite μ and ν, the corresponding a.e.
statement for a.e. strongly measurable functions.
(HvNVW, Proposition 1.2.2, p. 14, and Remark 1.2.8, p. 18;
here localized to functions supported on countably many finite-measure rectangles.)

*Needs:* §1, native simple density, dominated convergence, substitution and product integration.

### Examples

On S = {1,2} with counting measure, the π-system {{1}} generates all subsets but does not determine the integral on S: `𝟙_{2}x`, with x ≠ 0, and zero agree on its only test set. Adding S restores uniqueness. On a singleton of infinite measure there are no finite-positive-measure averages, which tests the convex-detection hypotheses.

### Dependencies

§1, native Bochner integration and `LinearPMap` graph operations;
Hahn–Banach separation. The real separation arguments apply to complex spaces
by restriction of scalars.

## Layer 3: The Bochner spaces Lᵖ(S;X)

### 3.1 Bochner spaces and closed subspaces

Use native `Lp`, its norm, completeness and bounded postcomposition. Construct
the representative comparisons for closed target subspaces, restriction and
extension by zero, and the closed subspace associated with a smaller σ-algebra
and its trimmed measure. Prove their norm bounds and compatibility with
composition, reusing native maps where their hypotheses apply.
The native norm formulas, membership via `‖f‖` once measurability is
supplied, the `L¹` quotient identification, and a.e.-convergent subsequences
are inputs. Construct the closed submodule `L∞_σ`
and its isometric comparison with the native endpoint under
σ-finiteness.

`linftySigma` is the native-L∞ submodule; `isClosed_linftySigma` states its closedness.

(HvNVW, Definition 1.2.15 and Remark 1.2.16, pp. 21–22; the submodule formulation fixes the comparison with native L∞.)

**API.**

- Membership of L∞_σ is invariant under a.e. equality and stable under zero, addition and scalar multiplication.
- The inclusion into native L∞ is linear and isometric; the submodule is closed and is complete when X is complete.
- On σ-finite measures the inclusion is onto; bounded postcomposition, restriction and extension by zero preserve membership and their native norm bounds.

**Checks.**

- On a σ-finite space, L∞_σ equals native L∞, with identical norms.
- On uncountable counting measure, the constant scalar one has native L∞ norm one and is absent from L∞_σ.
- On a singleton of infinite measure, L∞_σ is zero while native scalar L∞ is nonzero.

*Needs:* §1, native Lp maps, submodules, completeness and representative operations.

### 3.2 Approximation by μ-simple functions

Reuse finite-support simple-function density for `p<∞`;
give finite sums `∑_jφ_jx_j` with scalar `φ_j∈ Lᵖ` as a dense
subspace. For finite measures, allow indicator sets from a generating
algebra. For Lebesgue measure on `ℝᵈ`, `d≥1`, prove density of
finite sums `∑_j𝟙_{Q_j}x_j` with bounded cubes `Q_j` whose sides
are parallel to the coordinate axes; give rational dyadic cubes as a
countable generating choice after restriction to bounded boxes.
For `p=∞`, prove bounded simple approximation locally in
measure: on each finite-measure set and outside a set of arbitrarily small
measure the approximation is uniformly accurate and has the same essential
norm bound. Finite-range simple functions need not be norm dense in
Banach-valued `L∞`.
For `L∞_σ`, prove norm density of bounded countably-valued
functions `∑_{n≥1}𝟙_{Aₙ}xₙ`, where the measurable `Aₙ` are
disjoint and have finite measure. Give the uniform a.e. approximation and
its norm bound.

(HvNVW, Lemma 1.2.19 and Remarks 1.2.20–1.2.21, pp. 23–24.)

*Needs:* §1, §3.1, native simple density and Euclidean generating rectangles.

### 3.3 Separability of Bochner spaces

For `1≤ p<∞` and nonzero `Lᵖ(μ;X)`,
characterize separability by separability of `X` and of the metric space of
finite-measure measurable sets modulo null symmetric difference, with
`d([A],[B])=μ(A△ B)`. Use `SeparationQuotient` of the finite-measure
subtype of native `MeasuredSets μ`, converting its finite-valued extended
distance to a real distance. For finite `μ`, use the whole native carrier.
Identify separability of this quotient with `MeasureTheory.IsSeparable μ`
and reuse `MeasureTheory.Lp.SecondCountableTopology` for the sufficient direction.
Prove the converse and the equivalent measurable
decomposition `S=S₀⊔ S₁`: the restriction to `S₀` is purely infinite
(every measurable set has measure zero or infinity), and the restriction
to `S₁` is generated modulo null sets by countably many finite-measure
sets. Choose this generating family to cover `S₁` up to a null set.
Prove `μ|_{S₁}` is σ-finite and restriction identifies the
two `Lᵖ` spaces isometrically. Include the zero-space cases explicitly.
Distinguish an exactly countably generated σ-algebra from generation
modulo null sets by finite-measure sets. For `d≥1`, show that the Borel
σ-algebra of `ℝᵈ` is countably generated and that its
Lebesgue completion is generated modulo null sets by bounded rational
boxes but is not exactly countably generated. Use native countable-generation
and completion structures; prove the last assertion by cardinality.

(HvNVW, Definition 1.2.27, Example 1.2.28 and Proposition 1.2.29, pp. 27–28.)

**API.**

- Identify equality in the separation quotient with null symmetric difference, and expose its distance formula using the native quotient metric.
- Descend union, intersection and difference to the quotient, with their metric estimates; for finite measures include complement to obtain the measure algebra.
- Prove invariance under completion and null modifications, and compatibility with restriction and measure-preserving maps.

**Checks.**

- Null modifications of A and B give distance zero in the quotient; without the quotient this would be only a pseudometric.
- For finite counting measure, the distance between two set classes is the cardinality of their symmetric difference.
- On a purely infinite measure space, the finite-measure-set quotient and every finite-exponent Lᵖ space are zero; this checks the nonzero-space qualification in the separability criterion.

*Needs:* §3.1–§3.2, native MeasuredSets, SeparationQuotient, measure separability and completion; the quotient comparisons are constructed here.

### 3.4 Scalar evaluations and the Bochner space L∞(S;X)

Let `Y` be a closed linear subspace of `X*` and let `1≤ p≤∞`.
If `x*∘ f∈ Lᵖ(μ)` for every `x*∈ Y`, prove by the closed
graph theorem that `T_f:x*↦[x*∘ f]` is a bounded linear map
`Y→ Lᵖ(μ)`. Strong measurability of `f` is not a hypothesis of
this scalar-evaluation result.
For a.e. strongly measurable `f`, prove
that scalar essential boundedness of `x*∘ f` for every `x*` implies
essential boundedness of `f`, with
`‖f‖_∞=sup_{‖x*‖≤1}‖x*∘ f‖_∞`.
Derive the common bound from uniform boundedness and essential separability.

(HvNVW, Proposition 1.2.17 and Lemma 1.2.18, pp. 22–23; extend the closed-graph statement to every p ≥ 1.)

**API.**

- Characterize its value at each test functional by the scalar Lᵖ class, proving uniqueness and independence of a.e. representatives.
- Prove linearity in f whenever the scalar Lᵖ hypotheses hold, restriction to closed test subspaces and compatibility with bounded target maps through their adjoints.
- For f already in Bochner Lᵖ, bound the operator norm by ‖f‖_p; at infinity prove the exact norm under the full-dual and a.e.-strong-measurability hypotheses above.

**Checks.**

- On a probability space, a constant vector x gives a full-dual scalar-evaluation operator of norm ‖x‖ for every p≥1, including infinity.
- For the zero test subspace, the operator is zero even for the unbounded, nonintegrable f(s)=1/s on (0,1).
- For the field t↦e_t of §9.7, every scalar L∞ class is zero while ‖e_t‖=1 everywhere. The exact vector essential-bound formula therefore needs a.e. strong measurability.

*Needs:* §1, native scalar Lp, closed graph and uniform boundedness.

### Examples

Use zero spaces, uncountable counting measure, the infinite-measure singleton and the Euclidean Borel/Lebesgue distinction in the checks above (HvNVW, Remarks 1.2.16 and 1.2.21, Example 1.2.28, pp. 21–22, 24 and 27).

### Dependencies

§1; native `Lᵖ`, closed graph and simple-density APIs. The finite-measure set quotient
and its metric are part of this layer, with set operations and null-set transport.

## Layer 4: Minkowski's inequality, Fubini's theorem and projective tensor products

### 4.1 Minkowski's inequality, continuous version

For arbitrary measure spaces and
`1≤ p≤ q<∞`, construct the injective contraction

`Lᵖ(μ;L^q(ν;X))→ L^q(ν;Lᵖ(μ;X))`

that interchanges finite-measure rectangle tensors. Prove density of their
linear span, the norm bound, and uniqueness as a continuous linear extension
of the rectangle formula. Include independence of approximations and
compatibility with bounded linear maps on `X`. At `p=q` construct the
inverse and the linear isometric equivalence.
Localize the countably many simple approximants to σ-finite restrictions
in each variable before applying Fubini.

`exists_minkowskiContraction` states the arbitrary-measure contraction for complete X.

(HvNVW, Proposition 1.2.22 and Corollary 1.2.23, pp. 24–25.)

*Needs:* §1–§3, Tau Ceti's scalar Minkowski integral inequality, native Tonelli and §2.4 localization.

### 4.2 Fubini's theorem

For σ-finite `μ,ν` and
`1≤ p<∞`, construct
`Lᵖ(μ;Lᵖ(ν;X))≃ Lᵖ(μ×ν;X)` as a linear isometry
onto, with explicit rectangle formulas and a.e. section formulas for the
inverse. Use the existing iterated-seminorm theorem; separately prove that
the map into `Lᵖ(ν;X)` is a.e. strongly measurable. Prove that this is the
unique continuous linear extension of the finite-measure rectangle formula,
using density of the rectangle tensors.

`exists_fubiniEquiv` states the isometric equivalence and its nested a.e. section formula for complete X.

(HvNVW, Proposition 1.2.24, pp. 25–26.)

*Needs:* §4.1, native product integration and Tau Ceti iterated norms.

### 4.3 Pointwise evaluation of Lᵖ-valued integrals

For arbitrary `μ,ν`, finite
`p≥1`, and Bochner-integrable `F:S→ Lᵖ(ν;X)`, construct a jointly
strongly measurable representative `f(s,t)` with
`[f(s,·)]=F(s)` for `μ`-almost every `s`. For `ν`-almost every `t`,
prove integrability of `f(·,t)` and the a.e. representative identity
`(∫ F)(t)=∫ f(s,t) dμ(s)`. Under σ-finiteness of both
measures, prove uniqueness modulo product-measure null sets. Use representatives
and integral estimates, since point evaluation is not well-defined on `Lᵖ`.
Extend this statement to `p=∞` when `ν` is σ-finite, with
the same section-integrability and a.e. integral formula; keep `μ`
arbitrary for existence. If both measures are σ-finite, give the
same product-a.e. uniqueness. Sections of a product-`L∞` function need not
form an a.e. strongly measurable `L∞`-valued function (§9.4).

(HvNVW, Proposition 1.2.25 and Remark 1.2.26, pp. 26–27.)

*Needs:* §1–§3, finite-support approximation and §2.4; uniqueness also uses product-a.e. comparison.

### 4.4 L¹(S;X) as a projective tensor product

Using Tau Ceti's completed projective tensor
product, extend `φ⊗ x↦[s↦φ(s)x]` to the canonical
linear isometric equivalence
`L¹(μ)⊗̂π X≃ L¹(μ;X)` for arbitrary `μ`.
Prove the norm identity on finite tensors, surjectivity by simple-function
density, and naturality under bounded linear maps in the target and
measure-preserving pullbacks.

`exists_lpOneTensorEquiv` states the canonical isometry for complete X.

(Ryan, Example 2.19, pp. 29–30.)

*Needs:* §3.2 and Tau Ceti projective tensor product, tmulL and liftIsometry.

### Examples

Finite rectangle tensors test interchange and the pure-tensor norm ‖φ ⊗ x‖ = ‖φ‖₁‖x‖ tests the projective identification. The diagonal and moving-indicator examples in §9 exclude an unrestricted product theorem and an L∞-valued Fubini isomorphism (HvNVW, Remark 1.2.8, p. 18, and the discussion after Proposition 1.2.24, p. 26).

### Dependencies

§1–§3, Tau Ceti's scalar Minkowski integral inequality, native Tonelli and the product-integral API;
§4.4 consumes Tau Ceti's completed projective tensor product and universal property.

## Layer 5: Convolution and mollification on ℝᵈ

### 5.1 Convolution and Young's inequality

For Lebesgue measure on `ℝᵈ`, `d≥1`, extend the existing real-kernel
convolution API to scalar kernels over `𝕜` and the full range
`1≤ p≤∞`. For `k∈ L¹(ℝᵈ)` and
`f∈ Lᵖ(ℝᵈ;X)`, prove a.e. Bochner integrability of
`y↦ k(y)f(x-y)`, the representative formula for `k*f`, and Young's bound
`‖k*f‖_p≤‖k‖₁‖f‖_p`. At `p=∞`, construct the pointwise
integrals and their a.e. class directly; translations need not be strongly
continuous on `L∞`.

(HvNVW, Lemma 1.2.30, pp. 28–29; the [errata][hvn-errata], entry for p. 28, include the infinity endpoint.)

*Needs:* §3–§4, native translation and Tau Ceti convolution.

### 5.2 Mollification and compact-support approximation

For `p<∞`, connect compactly supported continuous-function density and
translation continuity to the native APIs. Include the density statement for
a locally compact Hausdorff domain with a regular Borel measure finite on
compact sets, using the existing continuous-function approximation interfaces.
Prove, for every scalar integrable kernel,

`k_ε(x)=ε^{-d}k(x/ε), k_ε*f→(∫ k)f in Lᵖ, ε↓0.`

Give the norm bounds, change-of-variables formula and compatibility with target
operators. Recover Tau Ceti's normalized bump operators through equality of
their a.e. representatives. Pointwise differentiation and Sobolev conclusions
belong to the owning analysis roadmaps.

(HvNVW, Lemma 1.2.31 and Proposition 1.2.32, pp. 29–30, including the locally compact variant preceding Lemma 1.2.31.)

*Needs:* §5.1, continuous compact-support density and Tau Ceti approximate identities.

### Examples

A kernel with integral zero converges to zero after dilation; a kernel with integral one converges to f at finite exponents. A moving jump shows that translations are not strongly continuous on all of L∞. Young’s estimate still holds at infinity (HvNVW, Lemma 1.2.30 and Proposition 1.2.32, pp. 28–30).

### Dependencies

§3–§4 and the existing convolution, translation and bump APIs.

## Layer 6: The Pettis integral

### 6.1 Scalar integrability and the τ(X,Y)-integral

Let `Y` be a closed linear subspace of `X*` and suppose that `x*∘ f∈ L¹(μ)`
for every `x*∈ Y`. Use the bounded scalar-evaluation map
`T_f:Y→ L¹(μ)` from §3.4.
For every measurable `A`, construct the `τ(X,Y)`-set integral
`D_A^Yf∈ Y*` by
`⟨x*,D_A^Yf⟩=∫_A⟨f,x*⟩`.
Prove existence, uniqueness, the bound `‖D_A^Yf‖≤‖T_f‖`,
and the formula as the adjoint of `T_f` applied to the scalar set-integral
functional. Relate these integrals under inclusion of closed test
subspaces by restriction of functionals.
For `Y=X*` this is the Dunford set integral in `X**`, and the
hypothesis is weak integrability, expressed using native `Integrable`.
Also construct the weak-star integral of `f:S→ X*` from integrability
of every evaluation at `x∈ X`. Supply scalar-evaluation, linearity,
restriction, bounded-map and a.e.-congruence lemmas.
For bounded maps `T:X→ Z` and closed test subspaces `Y⊆ X*`,
`W⊆ Z*` with `T*(W)⊆ Y`, state functoriality through
the adjoint of `T*|_W:W→ Y`. For a Bochner-integrable `f`, identify
`D_A^Yf` with the evaluation functional `x*↦ x*(∫_A f)`.

`WeaklyIntegrable` is the full-dual scalar-integrability predicate.

(HvNVW, §1.2.c, p. 30, and Examples 1.2.33–1.2.34, p. 30.)

**API.**

- Scalar evaluations determine the τ(X,Y)-integral uniquely, and its norm is bounded by the scalar-evaluation operator norm.
- Prove linearity, a.e. congruence, restriction and compatibility with inclusions of closed dual test subspaces.
- Prove bounded-map functoriality through the restricted adjoint and agreement with the Bochner integral when the latter is integrable.

**Checks.**

- For a finite-measure indicator f = 𝟙_B x, every test subspace gives D_A^Y f(x*) = μ(A ∩ B)x*(x).
- For scalar f(s) = s^(−1/3) on (0,1), the total Dunford integral and the norm of its scalar-evaluation operator are both 3/2.
- The scalar function f(s) = 1/s on (0,1) is strongly measurable but not weakly integrable: the identity scalar test has norm integral ∞.
- The disjoint-interval c₀ example in §9 has total Dunford integral (1,1,…) in ℓ∞, outside the canonical copy of c₀.

*Needs:* §3.4, scalar integration, native duals and adjoints.

### 6.2 Pettis integrability

Define Pettis integrability by weak integrability and, for every measurable `A`,
existence of `x_A∈ X` representing `D_Af` through the canonical bidual embedding.
Construct the set integral and prove equivalence with the adjoint characterization: the
transpose of `T_f`, applied to every bounded scalar integration functional
on `L¹`, takes values in the embedded `X`. This uses the integration map
from the native `L∞` to `(L¹)*`, not its surjectivity or injectivity
on arbitrary measures.

`PettisIntegrable` requires representation on every measurable set.

(HvNVW, Definition 1.2.35 and Proposition 1.2.36, pp. 30–32.)

**API.**

- Prove uniqueness of the representing vector for each measurable set and a.e. invariance of Pettis integrability.
- Prove linearity of the set integral, restriction and bounded-linear-map functoriality.
- Prove stability under bounded measurable scalar multiplication, the adjoint characterization using native L∞ and agreement with Bochner integrability and its integral.

**Checks.**

- A Bochner-integrable f is Pettis integrable, and its representing vector on A is the native Bochner set integral.
- The c₀ example of §9 is weakly integrable but not Pettis integrable; cancellation on two copies gives a total integral in c₀ while one half still has no representing vector.
- With μ(Aₙ) = 2^(−n), the ℓ²-valued function ∑ₙ 𝟙_(Aₙ)(2ⁿ/n)eₙ is Pettis integrable but has norm integral ∑ₙ 1/n = ∞.

*Needs:* §6.1 and native bidual embedding; bounded scalar integration uses Hölder, not L¹-dual surjectivity.

### 6.3 The induced vector measure

Prove norm-countable additivity of `A↦ x_A`. Supply the
Orlicz–Pettis series theorem used here: a series for which every subseries
converges weakly in a Banach space is unconditionally norm convergent.
Relate the scalar-integral bound to semivariation; total variation may be infinite.

For a weakly integrable `f` and arbitrary `μ`, prove that the setwise
Pettis condition is also equivalent to `T_f* I_g` belonging to the canonical
copy of `X` for every scalar `g∈ L∞_σ(μ)`, where `I_g(h)=∫ hg` is the
bounded integration functional on scalar `L¹`. Thus the support-restricted
adjoint test and the native-`L∞` test in §6.2 give the same condition.
For the implication from support-restricted tests, first obtain setwise
Pettis integrability on each measurable σ-finite restriction. Using
norm-countable additivity there, prove that the integrals over finite-measure
measurable subsets of any measurable `A`, directed by inclusion, form a Cauchy
net. Its limit represents `D_Af`, by scalar integrability.

`exists_pettisVectorMeasure` states norm-countable additivity and the scalar integral identity for complete X.

(Diestel–Uhl, Chapter I, §4, Corollary 4, p. 22 (Orlicz–Pettis); HvNVW, Definition 1.2.35 and Proposition 1.2.36, pp. 30–32, with both infinity-space test conventions above.)

*Needs:* §1.2, §3.1, §6.2 and the Orlicz–Pettis series theorem constructed in this target.

### 6.4 Existence criteria

Weak integrability suffices in a reflexive target.
If `f` is a.e. strongly measurable, every `x*∘ f` belongs to `Lᵖ`,
and `1<p≤∞`, then `φ f` is Pettis integrable for every scalar
`φ∈ L^q`, `1/p+1/q=1`. Construct the bounded integration operator
`L^q→ X` and its scalar pairing. Deduce the finite-measure corollary:
a strongly measurable, scalarly `Lᵖ` function is Pettis integrable
for `p>1`, including `p=∞`.
Prove that a.e. strong measurability
plus weak integrability suffices when `X` contains no closed subspace
isomorphic to `c₀`. Consume B4.1's weakly-unconditionally-Cauchy criterion.
Apply its contrapositive in the closed span to obtain the Bessaga–Pełczyński consequence:
a sequence bounded away from zero with uniformly bounded finite signed
partial sums has a closed span containing an isomorphic copy of `c₀`.
Such a sequence cannot be the terms of an unconditionally convergent series.

`pettisIntegrable_of_reflexive`, `pettisIntegrable_smul_of_weak_memLp` and
`pettisIntegrable_of_forall_not_antilipschitz` state the reflexive, weak-Lᵖ
and no-c₀ criteria for complete X. In the weak-Lᵖ criterion, localization to
the σ-finite support of the L^q multiplier gives the stated a.e. strong
measurability formulation, since q is finite.

(HvNVW, Theorem 1.2.37 and Corollary 1.2.38, pp. 32–33; Theorem 1.2.40 and Proposition 1.2.41, pp. 34–36.)

*Needs:* §6.1–§6.2, BanachSpaceTheory B1–B3 and B4.1's weakly-unconditionally-Cauchy criterion.

### 6.5 Convexity and uniqueness

For a probability measure, a Pettis integrable `f`, and a real-valued
lower-semicontinuous convex `φ` with `φ∘f` integrable, prove
`φ((P)∫ f)≤∫φ(f)`. Prove that the Pettis integral belongs to any closed
convex set containing `f` almost everywhere, and hence to the closed convex
hull of its values on any measurable full-measure set. Neither conclusion
requires essential separability or strong measurability of `f`; use
Hahn–Banach separation without a countable representation of the target set.
Prove the normalized-average versions on finite-positive-measure sets.

For arbitrary measures, equality of Pettis set integrals over a generating
π-system containing the whole space implies scalar a.e. equality for every
continuous linear functional. With essential separability of both functions,
deduce vector a.e. equality using a common null set. Prove the
average-in-a-closed-convex-set criterion on σ-finite measure spaces under
the same essential-separability hypothesis. Also prove it for arbitrary
measures when `0∈C`: weak integrability and essential separability give a
σ-finite support via §1.2, and the function is zero almost everywhere off
that support.

(HvNVW, Propositions 1.2.42–1.2.45, p. 36; vector uniqueness and convex detection use the essential-separability, measure and generating-system hypotheses above.)

**Checks.**

- On the two-point counting space, the π-system {{1}} generates all sets, but
  `f = 𝟙_{2}x` and g = 0 have equal integrals on {1} while their total integrals
  are x ≠ 0 and 0. Including the whole space excludes this counterexample.

*Needs:* §1.2, §2.2–§2.3 and §6.2–§6.3.

### Examples

The c₀, Pettis-but-not-Bochner and uncountable orthonormal-family examples in §9 test existence and uniqueness. The two-point π-system example of Layer 2 also applies to Pettis uniqueness (HvNVW, Example 1.2.39, p. 33; further examples in §9).

### Dependencies

§1–§3, scalar `L¹` theory, native bidual and weak-topology APIs, and
BanachSpaceTheory B1–B3 and B4.1. Construct the Orlicz–Pettis theorem in §6.3;
consume B4.1's series criterion for the integration-specific application in §6.4.

## Layer 7: The Radon–Nikodým property and representable operators

### 7.1 Vector measures and bounded variation

Use native `VectorMeasure S X`, its variation measure
and `μ.withDensityᵥ f`. Reuse Mathlib's `VectorMeasure.le_variation` and
`VectorMeasure.exists_lt_sum_of_lt_variation` for the variation formula:
on a measurable set, variation is the supremum in `ℝ≥0∞` of `∑ᵢ ‖m(Aᵢ)‖ₑ`
over finite disjoint measurable families contained in it, equivalently over
finite measurable partitions of it. Record norm-countable
additivity and unconditionality of the sums defining a vector measure;
bounded variation means that its variation measure is finite.
Connect null-set absolute continuity of a vector
measure with absolute continuity of its variation. For finite total
variation prove the equivalent small-set estimates in terms of
`‖m(A)‖` and `|m|(A)`. Reuse the variation-of-density formula
`|m|(A)=∫_A‖f‖`; prove density uniqueness, restriction, bounded
pushforward in the target, and change to an equivalent scalar measure.
Include localization on finite-measure sets where the variation is bounded
by a constant multiple of the reference measure.
In particular, an integrable essentially bounded density satisfies
`|m|(A)≤‖f‖_∞μ(A)`.
Supply the measurable-set exhaustion principle: on a finite measure
space, a property `P` holds for every measurable set if it holds for all
measurable null sets, every positive-measure measurable set has a positive-measure
measurable subset with `P`, and `P` is closed under countable disjoint
measurable unions. For σ-finite positive
measures `ν≪μ`, construct increasing measurable sets `Sₙ`
covering the space such that `μ(Sₙ),ν(Sₙ)<∞` and, for finite
constants `Cₙ≥0`, `ν(A)≤ Cₙμ(A)` for all measurable `A⊆ Sₙ`.
Scalar Radon–Nikodým derivatives may be used for this construction.
For σ-finite `μ`, construct a strictly positive integrable
measurable weight `w≤1`, so that `wμ` is finite and has the same null
sets as `μ`. Prove the density-transport formulas and the
gluing of compatible densities along a finite-measure exhaustion.

(HvNVW, Definition 1.3.4 and Lemmas 1.3.6–1.3.8, pp. 40–43; Lemmas 1.3.11–1.3.12, pp. 44–45, and the localization constructions in the proof of Theorem 1.3.10, pp. 45–47.)

**API.**

- Relate absolute continuity of a vector measure and of its variation, retaining finite-variation assumptions in the small-set criterion.
- Prove uniqueness, restriction, bounded-target-map transport and equivalent-measure transport of integrable densities.
- Prove the bounded-density variation estimate and the localization/gluing formulas.

**Checks.**

- For m = μ.withDensityᵥ f, variation on A equals ∫_A ‖f‖; a constant x on a finite-measure set B gives |m|(A) = μ(A ∩ B)‖x‖.
- For m(A) = ∑_(j∈A) j^(−1)eⱼ in ℓ², total variation is infinite although the measure is norm-countably additive.
- The zero vector measure has zero variation and is absolutely continuous with respect to every positive measure, including the zero measure.

*Needs:* §1–§3, native vector-measure variation, scalar Radon–Nikodým and densities.

### 7.2 The Radon–Nikodým property

For a fixed measure `μ`, define the RNP
of `X` with respect to `μ` by the assertion that every
`m : VectorMeasure S X` with finite total variation and
`|m|≪μ` has an integrable density `f`, with `m = μ.withDensityᵥ f`.
Define the intrinsic property using Lebesgue measure restricted to `[0,1]`.
Prove its equivalence to the relative property for every finite measure
space and for every σ-finite measure space. This equivalence fails for
arbitrary positive measures.

`HasRNPWith` is the fixed-measure predicate and `HasRNP` the unit-interval predicate. For complete X, `hasRNP_iff_finite_measures` and `hasRNP_iff_sigmaFinite_measures` state universality.

(HvNVW, Definition 1.3.9, p. 43; Theorem 1.3.26 and Definition 1.3.27, p. 55.)

**API.**

- For the relative property, prove invariance under continuous linear equivalence, inheritance by closed subspaces, restriction and transport along equivalent σ-finite measures.
- For the intrinsic property, prove equivalence with the relative property on all finite and all σ-finite spaces; transport along the preceding equivalences.
- Connect both predicates to representability in §7.3, separable determination in §7.4 and the interval comparison in §7.5.

**Checks.**

- Relative RNP holds for the zero measure and for every Banach target: absolute continuity forces m = 0, with zero density.
- Relative RNP holds for counting measure on ℕ for every Banach target: finite variation makes the atomic density summable. Thus a single relative property does not imply intrinsic RNP.
- On a singleton of infinite measure, a nonzero finite scalar measure is absolutely continuous with respect to the reference measure but has no integrable density. This excludes universality over arbitrary measures.
- Intrinsic RNP holds for the scalar field and for reflexive spaces, using the independent density supplier.
- Intrinsic RNP fails for c₀ and for L¹(0,1), through the nonrepresentable operators in §9.
- The space ℓ¹ has intrinsic RNP although it is not reflexive.

*Needs:* Native variation and densities for the definitions; §7.1 and §7.3–§7.5 for universality.

### 7.3 Representable operators

For arbitrary `μ`, call a bounded operator `T:L¹(μ)→ X` representable
if there is a density `φ∈ L∞_σ(μ;X)` such that `Tf=∫ fφ` for every `f`.
Construct the linear isometry
`L∞_σ(μ;X)→𝓛(L¹(μ),X)`, `φ↦ T_φ=[f↦∫ fφ]`,
and prove `‖T_φ‖=‖φ‖_∞` and a.e. uniqueness of the representing density.
Obtain the norm identity by restriction to a measurable σ-finite support of
the density, using restriction and extension by zero on scalar `L¹`.
Identify this map with the restriction of the native bounded density map
`representableOperatorMap`. Give indicator formulas and compatibility with
bounded target maps.
For σ-finite `μ`, identify `L∞_σ` with native `L∞` and prove that the
resulting map is onto exactly when `X` has the RNP with respect to `μ`.
For integrable `h`, prove relative norm compactness of `{∫_A h:A measurable }`;
deduce range compactness for representable operators on finite measure spaces.

`representableOperatorMap` uses native scalar multiplication and Lp pairing for arbitrary μ. `norm_representableOperatorMap` and `representableOperatorMap_surjective_iff` state the native-L∞ isometry and relative-RNP characterization for complete X under σ-finiteness.

(HvNVW, Definition 1.3.15 and Theorem 1.3.16, pp. 48–50; Lemmas 1.3.19–1.3.20, pp. 51–52.)

**API.**

- Prove linearity in the density and in the input, the Bochner integral formula, and evaluation on finite-measure indicators.
- Prove the exact operator norm, injectivity and a.e. uniqueness for L∞_σ densities under arbitrary measures, and compatibility with bounded target maps.
- Under σ-finiteness identify the domain with native L∞ and characterize surjectivity by relative RNP; prove norm-relative compactness of indicator images on finite measure spaces.

**Checks.**

- On a probability space, the constant density x represents f ↦ (∫f)x, of norm ‖x‖.
- On counting measure on ℕ, a bounded sequence (xₙ) represents (aₙ) ↦ ∑ₙ aₙxₙ, with norm supₙ ‖xₙ‖.
- On a singleton of infinite measure, native L¹ is zero and native L∞ is nonzero, so the full native density map is not isometric. L∞_σ is zero, and its restricted density map is isometric.
- The identity on L¹(0,1) is not representable: the indicators of distinct dyadic binary digits have pairwise L¹ distance 1/2, contradicting the compactness consequence above; §9.8 supplies the construction.

*Needs:* §1.2, §3.1–§3.2, §7.1, the relative-RNP definition in §7.2 and native Lp pairing.

### 7.4 Stability and separable determination

Prove invariance under continuous linear equivalence and inheritance by closed
subspaces. For σ-finite `μ`, prove that relative RNP is equivalent to relative
RNP of every closed
separable subspace. Prove passage to sub-σ-algebras for finite measures,
and the σ-finite variant assuming σ-finiteness of the
trimmed measure.
For arbitrary measures and any smaller σ-algebra, use native scalar
`condExpL2` as the orthogonal projection onto its closed measurable
subspace. Reuse `integral_condExpL2_eq` for its finite-measure measurable
sets; prove positivity, the modulus inequality and the `L¹` contraction on
`L¹∩L²`. Obtain the scalar `L¹` projection by density and prove agreement
with `condExpL2` on this intersection. Localize to the σ-finite support of
the projected function for the contraction argument. These `L²` and `L¹`
results hold without σ-finiteness of the trimmed measure.
Under σ-finiteness of the trimmed measure, construct the scalar
`L∞` contraction as the adjoint of the `L¹` projection and prove
agreement on intersections with `L²`, identifying the integrable realization
with native conditional expectation. The totalized `condExp` is zero on
nonintegrable functions, so it does not define this `L∞` extension.
On finite measures, reuse native Banach-valued conditional expectation
and its norm bound to obtain a density measurable for the smaller
σ-algebra; prove the scalar-pairing and set-integral identities.
Obtain the σ-finite formulas by localization and gluing.

(HvNVW, the conditional-expectation construction on pp. 50–51, Lemma 1.3.17 and Theorem 1.3.18, p. 51.)

**API.**

- Construct the unique bounded extension from L¹∩L² to native scalar L¹, with norm at most one and agreement with the L² projection on the intersection.
- Prove idempotence, identify the range with the closed subspace of classes measurable for the smaller σ-algebra, and preserve integrals on its finite-measure sets.
- Prove positivity, the modulus inequality, a.e. congruence and the tower law for nested σ-algebras. Under σ-finiteness of the trimmed measure, identify it with native L¹ conditional expectation and prove the L∞ adjoint formulas.

**Checks.**

- For the full σ-algebra, both scalar projections are the identity, including when the ambient measure is not σ-finite.
- On the two-point space with masses 1 and 3, projection onto constants sends (2,0) to (1/2,1/2); its L¹ norm and integral are both 2, fixing the averaging normalization.
- For Lebesgue measure on ℝ and the trivial σ-algebra, the scalar L² and L¹ measurable subspaces are zero, so both projections send 𝟙_[0,1] to zero. Finite-set integral preservation holds, but preservation of its total integral 1 fails; the trimmed measure is not σ-finite.

*Needs:* §3.1–§3.2, §7.1, the relative-RNP definition in §7.2, §7.3 representability, native scalar and Banach-valued conditional expectation, and BanachSpaceTheory B5's scalar L¹ duality for the L∞ adjoint; no universality input.

### 7.5 Universality of the unit interval [0,1]

Prove that atomless probability spaces countably generated modulo null sets
have the same measure algebra as `[0,1]`, with a measure-preserving Boolean
isomorphism inducing the scalar
`L¹` isometry. Include divisibility of atomless finite measures:
for measurable `A` and `0≤ t≤1`, construct a measurable subset of
measure `tμ(A)` and its complementary part in `A`. Prove the converse
and the characterization for σ-finite measures.
Use this splitting to construct nested binary partitions with cell
measures `2^{-n}`, generating the measure algebra of a countably
generated atomless probability space. For an exactly countably generated
σ-algebra, construct partitions generating that σ-algebra
itself; distinguish this from generation modulo null sets on a completion.
Prove the countably generated reductions at the measure-algebra level,
without requiring a pointwise isomorphism of the underlying sets.
Handle atomic parts separately. Prove RNP for
separable dual spaces, where the **dual itself** is separable, and for
reflexive spaces. For the latter, consume B4.0's finite-measure reflexive
density theorem and the equivalences above. Obtain the classical `ℓᵖ`
examples for `1≤ p<∞` and scalar `Lᵖ` examples for `1<p<∞`.

`hasRNP_strongDual_of_separable` states the separable-real-dual theorem for complete X; complex duals use the real-dual comparison.

(HvNVW, Theorem 1.3.21 and Example 1.3.23, pp. 53–54; Theorem 1.3.26 and Lemmas 1.3.28–1.3.29, pp. 55–59.)

**API.**

- Descend Boolean operations and the finite measure to the separation quotient of native MeasuredSets from §3.3.
- Construct the measure-preserving Boolean equivalence and its inverse, preserving countable operations modulo null sets.
- Induce the scalar L¹ linear isometry from indicator classes, then extend by density and verify its integral and norm formulas.

**Checks.**

- In a probability measure algebra, the distance from the zero class to the unit class is one; a null set represents zero even if it is nonempty as a set.
- The dyadic partitions of [0,1] have 2ⁿ cells of measure 2^(−n), and their refinements preserve Boolean operations modulo null sets.
- Transport of an indicator class preserves its L¹ norm μ(A); the isometry is independent of the chosen representative of the measurable set.

*Needs:* §3.3, §7.1, §7.3–§7.4 and BanachSpaceTheory B4.0 independent reflexive density.

### Examples

The harmonic-coordinate measure tests variation. Atomic measures, the infinite-measure singleton, c₀ and L¹(0,1) distinguish relative and intrinsic RNP (HvNVW, Examples 1.3.5 and 1.3.23–1.3.25, pp. 40 and 54).

### Dependencies

§1–§3, native variation and scalar Radon–Nikodým APIs,
scalar and Banach-valued conditional-expectation APIs, and the
BanachSpaceTheory suppliers above. Prove §7.1 and §7.3 for a fixed
measure before using them in separable determination and universality.

## Layer 8: Duality of Bochner spaces

### 8.1 The integral pairing and its isometry

Construct the canonical bounded linear map

`J:L^q(μ;X*)→(Lᵖ(μ;X))*, (Jg)(f)=∫⟨f(s),g(s)⟩ dμ(s).`

Prove the Hölder bound and naturality for bounded target maps. On
σ-finite spaces, for every conjugate pair `1≤ p,q≤∞`,
prove that `J` is an isometry with closed, norming range. Allow `X*` to be
replaced by any closed norming subspace. For arbitrary measures prove the
same result for `1<p<∞`; give the endpoint versions using
`L∞_σ` on the infinity side. For arbitrary `μ` and any norming linear
subspace `Y⊆ X*`, without a closedness assumption, prove that the
`X*`-valued μ-simple functions taking values in `Y` and having essential
norm at most one already norm `L¹(μ;X)`.

`bochnerDualMap` is the native integral pairing. `norm_bochnerDualMap`, `norm_bochnerDualMap_of_one_lt` and `norm_bochnerDualMap_linftySigma` distinguish the measure and endpoint assumptions. `norm_le_of_dual_pairing_bound` states that its range is norming.

(HvNVW, Proposition 1.3.1 and Corollary 1.3.2, pp. 37–39; endpoint comparisons use the conventions above.)

**API.**

- Prove the integral formula, scalar integrability, bilinearity and the Hölder bound.
- Prove compatibility with bounded target maps and a.e. representatives.
- Establish isometry, closedness and norming range under each stated measure/exponent hypothesis, including the support-restricted endpoint comparisons.
- Prove the μ-simple-function norming formula for every norming linear subspace Y, with no completeness or closedness hypothesis on Y.

**Checks.**

- On a one-point probability space, J is the identity comparison X* → X*, including its norm.
- For complex scalars on that space, f = 1 and g = i give (Jg)(f) = i; conjugating the dual coefficient would give the wrong sign.
- On a singleton of infinite measure, the (p,q) = (1,∞) pairing is zero despite nonzero native L∞; the support-restricted statement has zero domain.
- Finite-support simple dual-valued functions norm L¹ even though they need not be norm dense in the full L∞ domain.
- For X = c₀, the span of the coordinate functionals is a norming, nonclosed subspace of X*. μ-simple functions valued in this span still norm L¹(μ;c₀).

*Needs:* §1–§3, native Lp pairing and Hahn–Banach; no RNP input.

### 8.2 Duality and the Radon–Nikodým property

For σ-finite `μ` and `1≤ p<∞`,
prove that `J` is onto if and only if `X*` has the RNP with respect to
`μ`. Bundle the resulting linear isometric equivalence and its integral
formula. Derive surjectivity for reflexive `X` and for separable `X*`.
If `X*` has the intrinsic RNP, prove surjectivity for arbitrary measures
when `1<p<∞`, by localizing each functional to an appropriate
σ-finite support. The localization lemma is part of this target.

`bochnerDualMap_surjective_iff` and `bochnerDualMap_surjective_of_hasRNP` state the relative and intrinsic RNP conclusions for complete X.

(HvNVW, Theorem 1.3.10, pp. 43–47, Corollary 1.3.13, p. 47, and Corollary 1.3.22, pp. 53–54.)

*Needs:* §8.1 and §7, with §7.1 localization for arbitrary measures.

### 8.3 Duality of atomic Bochner spaces and ℓᵖ(I;X)

Construct the vector-valued analogues of
`lp.dualEquiv`: for arbitrary index sets and `1<p<∞`,
`(ℓᵖ(I;X))*≃ℓ^q(I;X*)`, and
`(ℓ¹(I;X))*≃ℓ∞(I;X*)` using the full space of bounded
dual-valued families. Prove the coordinate and sum-pairing formulas and
their agreement with scalar `lp.dualEquiv`. Transfer the finite-exponent
result to measure spaces whose σ-algebra is generated by atoms,
with atom weights as follows. For `1≤p<∞`, a measurable atom `A` with
`0<μ(A)<∞`, and `Φ ∈ (Lᵖ(μ;X))*`, set `x*_A(x) = Φ(𝟙_A x)` and prove
`‖x*_A‖ ≤ μ(A)^(1/p)‖Φ‖`; the representing density on A is `x*_A/μ(A)`.
Infinite-measure atoms contribute no nonzero finite-exponent vectors. Include the `p=1` Bochner-space statement
for σ-finite atomic spaces. For uncountable `I`, bounded families
need not have separable range, so the sequence-space infinity endpoint
can differ from Bochner `L∞`.

(HvNVW, Proposition 1.3.3 and the atomic-measure discussion preceding it, pp. 39–40; the [errata][hvn-errata], entry for p. 39, give the atom-dependent functional bound.)

*Needs:* §3.2, scalar lp.dualEquiv and BanachSpaceTheory B3 and B5; no RNP input.

### Examples

Use finite atomic spaces to check coordinate weights, the complex one-point pairing to check bilinearity, and uncountable counting measure to distinguish bounded families from strongly measurable L∞ classes (HvNVW, Proposition 1.3.3, pp. 39–40, and Example 1.3.14, pp. 47–48).

### Dependencies

§1–§4 and §7; BanachSpaceTheory B3 and B5's scalar duality inputs.
§8.1 and the atomic result do not require the RNP theorem.

## Layer 9: Examples that distinguish the hypotheses

### 9.1 Scalar and strong measurability

On a nonseparable Banach space the identity is norm-Borel measurable but not
strongly measurable, even when the domain carries the full power-set
σ-algebra. For an uncountable index set, show that the cylindrical
σ-algebra of `ℓ²(I)` is strictly smaller than its norm-Borel
σ-algebra, using countable support of scalar tests.

(HvNVW, Example 1.1.5, pp. 4–5; the cylindrical counterexample is obtained directly from the countable supports of continuous linear functionals on ℓ²(I).)

*Needs:* §1.1 and native arbitrary-index Hilbert spaces.

### 9.2 Finite-support measurability and infinity endpoints

A nonzero constant is `AEFinStronglyMeasurable` exactly when the measure is
σ-finite. On uncountable counting measure, the constant scalar one is
in native `L∞` but outside `L∞_σ`. On a singleton of infinite
measure, native `L¹` is zero and native `L∞` is nonzero, so the
unqualified endpoint integral-pairing isometry fails.
On uncountable counting measure, construct the summation functional on
scalar `L¹` and prove that it has no representative in
`L∞_σ`: testing singleton indicators forces the missing
constant-one density. Also exhibit failure of finite-support measurability
under composition with a map that sends zero to one.

(HvNVW, Example 1.1.17, p. 9; Remark 1.2.16, pp. 21–22; Example 1.3.14, pp. 47–48. The infinite-measure singleton tests the native endpoint convention.)

*Needs:* §1.2, §3.1 and §8.1.

### 9.3 Injective operators and orbitwise measurability

Let `f(t)=𝟙_{(0,t)}` on `(0,1)` with values in `L∞(0,1)`.
Prove that its image under the injective inclusion into `L²(0,1)` is
continuous, whereas `f` is not a.e. strongly measurable in `L∞`.

The translation field on `L²(ℝ)` has continuous orbits but is not
a.e. strongly measurable in operator norm: distinct translations have
distance two in that norm.

(HvNVW, Example 1.1.26, pp. 11–12, and Definition 1.1.27, p. 12; the translation example uses the native L² translation operator and its operator-norm estimate.)

*Needs:* §1.4, §1.6 and native L² translations.

### 9.4 Product measures and L∞-valued sections

The diagonal indicator for Lebesgue measure in one variable and uncountable
counting measure in the other has unequal iterated integrals. The function
`𝟙_{(s,t) : 0 < s < t < 1}` is in product `L∞`, but its sections do not
give an a.e. strongly measurable map into `L∞(0,1)`.

(HvNVW, Remark 1.2.8, p. 18, and the discussion following Proposition 1.2.24, p. 26.)

*Needs:* §2.4 and §4.2–§4.3.

### 9.5 Weak, Pettis and Bochner integrability

For disjoint positive-length intervals `Aₙ⊂(0,1)`,
`f=∑ₙ𝟙_{Aₙ}eₙ/|Aₙ|` with values in `c₀` is strongly measurable
and weakly integrable but not Pettis integrable: its Dunford integral is the
constant one vector in `ℓ∞`. Also exhibit cancellation on two
copies of the interval, so a total Dunford integral in `X` does not suffice
to give Pettis integrability on every measurable subset.

With `|Aₙ|=2^{-n}`, `n≥1`, the `ℓ²`-valued function
`∑ₙ𝟙_{Aₙ}(2^n/n)eₙ` is Pettis integrable but not Bochner
integrable. Its scalar integrals converge by Cauchy–Schwarz, whereas its
norm integral is `∑ₙ1/n`.

(HvNVW, Example 1.2.39 and its following cancellation construction, pp. 33–34; the ℓ² example is computed from the displayed series using Cauchy–Schwarz.)

*Needs:* §6.1–§6.3 and native c₀ and ℓ².

### 9.6 Vector measures of infinite variation

For `1<p≤∞`, construct the `ℓᵖ`-valued measure on the positive
integers given by
`m(A)=∑_{j∈ A}j^{-1}e_j`. Prove norm-countable additivity, including
the supremum-norm endpoint, and compute
`|m|(A)=∑_{j∈ A}j^{-1}`. Its total variation is infinite.
Compare with the native finite-variation theorem for scalar complex
measures.

(HvNVW, Example 1.3.5, p. 40.)

*Needs:* §7.1 and native ℓᵖ.

### 9.7 Scalar null sets and Pettis uniqueness

The field `t↦ e_t∈ℓ²([0,1])` is scalarly zero almost everywhere
for each fixed functional but has norm one everywhere. It is Pettis
integrable with all set integrals zero. This prevents replacing the
essential-separability hypotheses in §6.5 by weak measurability alone.

(Each scalar functional on ℓ²([0,1]) has countable support, a Lebesgue-null set, whereas every basis vector has norm one.)

*Needs:* §1.2, §6.2 and native arbitrary-index Hilbert spaces.

### 9.8 Failure of the Radon–Nikodým property

Show failure of RNP for `c₀`, `ℓ∞`, `C[0,1]`, `L∞(0,1)`,
and `L¹(0,1)`. For `c₀`, use a nonrepresentable operator
`L¹(0,1)→ c₀` with Rademacher-coordinate integrals: prove its coordinates
tend to zero by dyadic step-function density, and that a representing
density would have Rademacher coordinates almost everywhere. Transfer to
spaces containing a closed copy of `c₀`. For every normalized sequence of
continuous scalar functions on `[0,1]` with pairwise disjoint supports,
prove `‖∑ₙ aₙ fₙ‖_∞=maxₙ |aₙ|` for finite nonempty sums and deduce an isometric
copy of `c₀` onto their closed linear span. Use this to construct the
`C[0,1]` example.
Also construct the nonrepresentable sine-coordinate operator
`(Tf)ₙ=∫₀¹f(t)sin(2π nt) dt`: prove the coefficient decay
from step-function density. For every irrational `t∈(0,1)`, prove that
the sine coordinates do not tend to zero; deduce the a.e. failure as well.
For `L¹(0,1)`, use the identity operator and the noncompact family of dyadic
indicator images, contradicting §7.3's compactness consequence.

(HvNVW, Examples 1.3.24–1.3.25, pp. 54–55, for the sine-coordinate and L¹ examples. The Rademacher variant uses dyadic approximation.)

*Needs:* §7.3–§7.4, BanachSpaceTheory B3, and the dyadic and closed-c₀ constructions specified here.

### Examples

§§9.1–9.4 test separability and measure assumptions; §§9.5–9.8 distinguish scalar, Pettis and Bochner integrability, finite variation and the RNP.

### Dependencies

the corresponding preceding layers; native sequence-space and Hilbert
APIs; B3's classical-space comparisons. Construct the dyadic functions and the
closed `c₀` embeddings used in the last example, including their norm estimates.

## Applications

The integration, approximation and duality results support Banach-valued
differentiation, harmonic analysis and stochastic integration.

## References

- **HvNVW.** T. Hytönen, J. van Neerven, M. Veraar and L. Weis,
  [*Analysis in Banach Spaces, Volume I: Martingales and Littlewood–Paley Theory*](https://doi.org/10.1007/978-3-319-48520-1),
  Springer, 2016. Chapter 1, “Bochner spaces,” §§1.1–1.3, pp. 2–59.
  Apply the authors' [errata and corrigenda][hvn-errata] (June 18, 2026).
  Citations use this edition's numbering.
- **Diestel–Uhl.** J. Diestel and J. J. Uhl, Jr., *Vector Measures*, Mathematical
  Surveys 15, American Mathematical Society, 1977. Chapter I, §4, Corollary 4, p. 22,
  supplies the Orlicz–Pettis series theorem used in §6.3.
- **Ryan.** R. A. Ryan, [*Introduction to Tensor Products of Banach Spaces*](https://doi.org/10.1007/978-1-4471-3903-4),
  Springer, 2002. Example 2.19, pp. 29–30, gives the Bochner-L¹ projective-tensor
  identification in §4.4.
- The Mathlib and Tau Ceti modules listed above specify the reused
  carriers and theorem interfaces.
- **Related upstream design.** The [Mathlib cylinder σ-algebra proposal][ml-cylinder-pr]
  guides the use of explicit evaluation-generated measurable structures in §1.1.
  The construction and comparison theorems are targets here; the proposal is a
  design reference, not a library supplier.

[ml-strong]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean
[ml-aestrong]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/AEStronglyMeasurable.lean
[ml-strong-lp]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Lp.lean
[ml-bochner]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean
[ml-bochner-clm]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean
[ml-convex-integral]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Convex/Integral.lean
[ml-prod]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Prod.lean
[ml-simple]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/SimpleFuncDenseLp.lean
[ml-lp-complete]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/LpSpace/Complete.lean
[ml-measured-sets]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/MeasuredSets.lean
[ml-separable-measure]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/SeparableMeasure.lean
[ml-density]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/WithDensityVec.lean
[ml-variation]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/Variation/Basic.lean
[tc-pettis]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/StronglyMeasurable/Pettis.lean
[tc-caratheodory]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean
[tc-innerregular]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/StronglyMeasurable/InnerRegular.lean
[tc-duality]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/Duality.lean
[tc-l1dual]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/L1Space/Dual.lean
[tc-seqdual]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Lp/Dual.lean
[tc-iterated]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/Iterated.lean
[tc-minkowski]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Integral/MinkowskiIntegral.lean
[tc-convolution]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/Convolution.lean
[tc-approx]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/ApproximateIdentity.lean
[tc-density]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/VectorMeasure/WithDensity.lean
[ml-cylinder-pr]: https://github.com/leanprover-community/mathlib4/pull/45494
[ml-null]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/NullMeasurable.lean
[ml-ce]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean
[ml-ce-l2]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean
[ml-ce-real]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/Real.lean
[ml-exhaustion]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/Decomposition/Exhaustion.lean

[ml-dominated]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean
[ml-integrable]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/L1Space/Integrable.lean
[tc-tensor-completion]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Module/TensorProduct/Completion.lean
[tc-tensor]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Module/TensorProduct/ProjectiveSeminorm.lean
[tc-holder]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Holder.lean
[hvn-errata]: https://fa.ewi.tudelft.nl/~neerven/ABS/errata-vol1.pdf
