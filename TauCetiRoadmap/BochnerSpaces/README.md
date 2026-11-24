# Roadmap: Bochner spaces

**Summary.** A Banach-valued function is strongly measurable exactly when it
has separable range and composition with each continuous linear functional is
measurable. Develop Pettis integration and the graph-norm formulation of
Hille's theorem for the Bochner integral. Construct the mixed-norm interchange map and identify Bochner L¹
with the projective tensor product of scalar L¹ and the target space. For a
σ-finite measure and `1≤p<∞`, prove that every functional on `Lᵖ(μ;X)` has an
`L^q(μ;X*)` density, with `q` conjugate to `p`, exactly when `X*` has the
Radon–Nikodým property with respect to `μ`.

The constructions use Mathlib's Bochner integral and Lᵖ spaces and Tau Ceti's
completed projective tensor product. Banach space theory supplies scalar
duality and the density theorem for reflexive targets. The unit-interval
characterization of the Radon–Nikodým property uses the measure-algebra
classification from Von Neumann algebras.

## How to read the build

Layers 1–3 develop measurability, Bochner integration and Lᵖ approximation.
Layer 4 treats mixed norms and tensor products, and Layer 5 applies convolution
to approximation. Layer 6 builds Pettis integration directly on Layers 1–3.
In Layer 7, start with vector measures (§7.1) and the definition of the
Radon–Nikodým property (RNP) in §7.2. Prove representability for a fixed
measure (§7.3) before separable determination and interval transport (§§7.4–7.5).
These give universality in §7.2. Layer 8 uses the RNP to characterize
surjectivity of the duality map. Its norming and atomic results are independent
of the RNP. [Suggested.lean](Suggested.lean) gives signatures for the main results.

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
specifies otherwise. A measure is semifinite if every measurable set of
positive measure contains a measurable subset of finite positive measure.
For σ-finite measures, `Measure.exists_subset_measure_lt_top` gives such a
subset with lower bound zero.
A sub-σ-algebra of a σ-finite measure space need not carry a σ-finite
restricted measure.
Integral identities carry integrability hypotheses; a totalized integral's
default zero value is not evidence of integrability. Use
`ENNReal.HolderConjugate` for conjugate exponents, including `1,∞`.

**Operator-valued functions.** For `A:S→𝓛(X,Y)`, orbitwise measurability
means measurability of `s↦ A(s)x` for every fixed `x`.
It is distinct from strong measurability into the operator-norm topology.

## Layer 1: Measurability

### 1.1 Pettis measurability on a measurable space

For `f:S→X`, prove that strong measurability is equivalent to separable
range and measurability of every scalar evaluation `x*∘f`. Use Mathlib's
norm-Borel and separable-range criterion. [Strong measurability][ml-strong-criterion]

When the range lies in a complete separable linear subspace `E⊆X`,
allow tests from a linear subspace of `X*` separating points of `E`.
Extract a countable separating family from these tests. From a prescribed
1-norming subset of the dual unit ball on a separable subspace, extract
a countable 1-norming subset. Such tests recover distances to a countable
dense set and hence the norm-Borel σ-algebra on a separable normed space.
For separable Banach `X`, identify the
norm-Borel σ-algebra with the one generated by any separating linear family
of tests, equivalently any weak-star dense linear subspace of `X*`.
This gives the coincidence of weak, norm-Borel and strong measurability
for these targets, including finite-dimensional spaces.

`stronglyMeasurable_iff_scalar_tests` states the full-dual criterion for normed
targets. `stronglyMeasurable_iff_separating_tests` gives the criterion on a
complete separable supporting subspace.

(HvNVW, Proposition 1.1.1 and Corollary 1.1.2, p. 3; Theorem 1.1.6, p. 5; Corollary 1.1.10, pp. 6–7.)

**API.**

- Define the σ-algebra generated by the chosen evaluations. Characterize measurability into it by the scalar tests and express its generators as inverse images of Borel sets in finite products of the scalar field.
- Prove monotonicity when the family of tests is enlarged and measurability of bounded linear maps whose adjoints preserve the chosen test families.
- Compare this explicit σ-algebra with the norm-Borel σ-algebra on a separable Banach space.

**Check.** The zero functional alone generates the trivial σ-algebra, even on
the scalar field. This is where separation of points enters the Borel comparison.

*Needs:* Native strong measurability, Hahn–Banach and BanachSpaceTheory B1.

### 1.2 Pettis measurability on a measure space

Characterize `AEStronglyMeasurable` by essential separability and scalar
`AEMeasurable` tests. For `AEFinStronglyMeasurable` use essential
separability and scalar `AEFinStronglyMeasurable` tests. Apply Mathlib's
pointwise support criterion to a representative. The a.e. finite-support
condition amounts to a.e. strong measurability and vanishing a.e. off a
measurable set on which `μ` is σ-finite. [Finite-support criterion][ml-finite-support]

For a complete separable supporting subspace, allow separating tests as in
§1.1. For a.e. strongly measurable `f,g`, scalar a.e. equality against each
member of a separating linear family implies `f=g` a.e. Use a countable
subfamily on their common separable range to obtain one exceptional set.

`aestronglyMeasurable_iff_scalar_tests` and `aefinStronglyMeasurable_iff_scalar_tests` state the two distinct measure-space criteria.

(HvNVW, Proposition 1.1.15, p. 8; Theorem 1.1.20 and Corollaries 1.1.21–1.1.25, pp. 10–11.)

*Needs:* §1.1 and native a.e./finite-support measurability.

### 1.3 Approximation and transport

Construct simple approximants with `‖fₙ(s)‖≤‖f(s)‖` and pointwise
convergence, or a.e. convergence with finite-measure supports in the
finite-support case. Mathlib's `norm_approxOn_zero_le` gives the bound
`2‖f(s)‖`. [Simple-function estimates][ml-norm-approximation]

For any subset `D⊆X` containing the range of a strongly measurable `f`,
apply the subtype embedding and continuous composition to `g:D→Y`.
This gives strong measurability of `g∘f`, including closed-subspace
restriction and inclusion. Use a.e. congruence when `f(s)∈D` only a.e.
For finite-support measurability assume that `μ` is σ-finite or that
`0∈D` and `g(0)=0`. Use native closure under limits. [Embedding criterion][ml-strong-embedding]

(HvNVW, Corollaries 1.1.7–1.1.11 and Lemma 1.1.12, pp. 6–7; Corollaries 1.1.21–1.1.24, pp. 10–11; continuous composition as in the [errata][hvn-errata], entry for p. 7.)

*Needs:* §1.1–§1.2, `Embedding.comp_stronglyMeasurable_iff`, continuous composition and preservation of separability under continuous images.

### 1.4 Operator-valued functions

Tau Ceti's Carathéodory theorem gives a.e. strong measurability of
`s↦A(s)f(s)` from a.e. strongly measurable orbits and a.e. strongly
measurable `f`. Apply it to compositions, and give the pointwise and finite-support forms.
Include closure under addition and scalar multiplication. [Carathéodory measurability][tc-caratheodory-at]

For separable `X`, prove measurability of `s↦‖A(s)‖` using a countable
dense family in the unit ball. Construct the bounded map
`x↦[s↦ A(s)x]` into `Lᵖ(μ;Y)` when every orbit belongs to that
space, using the closed graph theorem. For `p=1`, integrate this map to
obtain a continuous linear operator with the orbitwise integral formula.
A common integrable majorant `‖A(s)x‖≤ g(s)‖x‖` gives operator norm
at most `∫ g`. Compare with the integral of `A` when the
field is Bochner integrable in the operator norm. Tau Ceti gives convergence
estimates for integrals of uniformly bounded operator fields. [Operator-field integrals][tc-operator-field]

(HvNVW, Definition 1.1.27, Proposition 1.1.28 and Corollary 1.1.29, pp. 12–13; the orbit-integration conclusion follows from the closed graph theorem and native Bochner integration.)

*Needs:* §1.1–§1.3, Tau Ceti Carathéodory, closed graph and native Bochner integration.

### 1.5 Completion and preimages

On `NullMeasurableSpace S μ`, a function of globally separable range is
strongly measurable exactly when it is a.e. strongly measurable for `μ`.
This follows from Mathlib's pointwise and a.e. criteria, since measurability
on the completion is null measurability for `μ`. Apply §1.2 for the implication
from `AEFinStronglyMeasurable` and its converse under σ-finiteness.
[Pointwise criterion][ml-strong-criterion] · [A.e. criterion][ml-aestrong-criterion] · [Completion][ml-null]

For a.e. strongly measurable `f`, use its native strongly measurable
representative `f̃`. For Borel `B`, the preimages under `f̃` and `f` agree
a.e. The first is measurable, the second is null measurable, and their
measures coincide for any such representative. [Representative][ml-strong-representative]

(HvNVW, Proposition 1.1.16 and Remarks 1.1.18–1.1.19, p. 9.)

*Needs:* §1.2–§1.3 and Mathlib measure completion.

### 1.6 Injective operators and measurability

Let the range of `f` lie in a complete separable linear subspace `E⊆X`.
If a bounded linear map `T:X→Y` is injective on `E`, its restriction is a
measurable embedding by Lusin–Souslin. Together with the separable-range
criterion this gives strong measurability of `T∘f` if and only if `f` is
strongly measurable. For the a.e. and finite-support versions assume
`f(s)∈E` almost everywhere. Injectivity on `E` also identifies the nonzero
supports there. A closed separable subspace of a Banach space satisfies the
completeness hypothesis. [Measurable embedding][ml-measurable-embedding]

(HvNVW, the injective-operator criterion in Example 1.1.26, pp. 11–12.)

*Needs:* §§1.1–1.3 and Mathlib's measurable-embedding theorem.

### Dependencies

native strong-measurability and simple-function APIs; Hahn–Banach and
the closed graph theorem. Orbit integration uses the existing Bochner integral.

## Layer 2: The Bochner integral

Use the native Bochner integral, `Integrable`, finite simple sums, dominated
convergence, substitution and σ-finite Fubini. Their norm estimates,
restriction and indicator rules, a.e. congruence and bounded-linear-map commutation
are inputs (HvNVW, Definition 1.2.1 and Propositions 1.2.2–1.2.3, pp. 13–15;
Propositions 1.2.5–1.2.7, pp. 16–18).

### 2.1 Hille's theorem

Let `T : X →ₗ.[𝕜] Y` have closed graph between Banach spaces, with arbitrary
domain. For Bochner-integrable `f,g` satisfying `(f(s),g(s))∈graph T` a.e.,
the image of `(f,g)` in the quotient by the graph is zero a.e. Commuting
the quotient map with the integral gives `(∫ f,∫ g)∈graph T`, i.e. `∫ f`
belongs to the domain and `T(∫ f)=∫ g`. The companion theorem is
`integral_mem_graph`. [Integral commutation and product formula][ml-bochner-clm] · [Lean proof](Suggested.lean)

Identify the integrable lift of `(f,g)` to the graph with integrability in
the domain's graph norm. Compare the inherited product norm with `‖x‖+‖Tx‖`,
and deduce completeness of the graph-norm domain and norm bounds of one
for its inclusion into `X` and the action of `T` into `Y`.

(HvNVW, Theorem 1.2.4, pp. 15–16.)

*Needs:* §1, native Bochner integration and LinearPMap, closed submodules of a product.

### 2.2 Convexity and integration

On a separable normed space, Mathlib writes each closed convex set as a
countable intersection of closed affine half-spaces, using real parts of
functionals over `ℂ`. On a closed convex domain it writes a real-valued
lower-semicontinuous convex function as the supremum of a sequence of
continuous affine minorants. [Half-spaces][ml-countable-half-spaces] · [Affine minorants][ml-affine-minorants]

For Bochner-integrable `f` with values a.e. in a closed convex set `C`
on a probability space, `Convex.integral_mem` gives `∫f∈C`. For `φ:C→ℝ`
convex and relatively lower semicontinuous with `φ∘f` integrable,
`φ(∫f)≤∫φ(f)` is conditional Jensen on the trivial σ-algebra. State the
hypotheses on `C` using any extension of `φ` to `X`. Normalizing the
restricted measure gives both conclusions for averages on finite
positive-measure sets. Taking `C` to be the closed convex hull of the
values on a measurable full-measure set gives the hull conclusion.
[Convex integrals and averages][ml-convex-integral] · [Conditional Jensen][ml-conditional-jensen] · [Expectation on the trivial σ-algebra][ml-condexp-bot]

(HvNVW, Lemmas 1.2.9–1.2.10 and Propositions 1.2.11–1.2.12, pp. 18–20.)

*Needs:* §1 and Mathlib's convex integration and separation theorems.

### 2.3 Detection by set integrals

Let `μ` be semifinite and `C` closed and convex. If the average of an
integrable `f` over every measurable set of finite positive measure lies in `C`,
prove `f(s)∈C` almost everywhere. For a strongly measurable representative,
a failure set of positive measure has a finite positive-measure subset on
which to apply the finite-measure result. For arbitrary measures give
the version with `0∈ C`, using finite-support localization. Include the
closed-subspace and scalar-evaluation formulations.

For arbitrary `μ`, equality of the set integrals of `f,g` on a generating
π-system containing the whole space gives `f=g` a.e. Apply vector-measure
extensionality to `μ.withDensityᵥ f` and `μ.withDensityᵥ g`, then use
uniqueness of their integrable densities in a complete target.
[π-system extensionality][ml-vector-measure-ext] · [Density uniqueness][ml-density-unique]

`ae_mem_of_set_averages` states the semifinite convex-detection theorem.

(HvNVW, Propositions 1.2.13–1.2.14, p. 20, with the measure hypotheses above.)

*Needs:* §1, §2.2, scalar set-integral uniqueness and finite-support localization.

### 2.4 Finite-support comparison and localized Fubini

For a.e. strongly measurable `f`, integrability is equivalent to
integrability of `‖f‖` and to L¹ approximation by finite-support simple
functions, whose integrals converge to `∫f`. Use these native results also
in the closed target subspace and with the representatives from §1. [Integrability][ml-integrable] · [Simple density][ml-simple] · [Bochner integration][ml-bochner]

Let `μ,ν` be arbitrary. For jointly strongly measurable `f` vanishing off
a countable union of measurable rectangles of finite measure in each
variable, prove that finiteness of either iterated norm integral gives both
iterated Bochner integrals and their equality. Apply Fubini on the σ-finite
restrictions. Tau Ceti identifies the integral on a measurable subtype with
the ambient integral when the function vanishes a.e. on the complement.
Use these identities for the section representatives in §4. Strong
measurability gives strongly measurable sections pointwise, and under σ-finiteness
of `μ,ν` the corresponding a.e. conclusion follows for a.e. strongly
measurable functions. [Product integration][ml-prod] · [Subtype integrals][tc-bochner-subtype]

(Diestel–Uhl, Chapter II, §2, and HvNVW, Proposition 1.2.2, p. 14, for simple
approximation of the Bochner integral. See also HvNVW, Remark 1.2.8, p. 18,
for the measure assumptions in Fubini's theorem.)

*Needs:* §1, native simple density, dominated convergence, substitution and product integration.

### Dependencies

§1, native Bochner integration and `LinearPMap` graph operations;
Hahn–Banach separation. The real separation arguments apply to complex spaces
by restriction of scalars.

## Layer 3: The Bochner spaces Lᵖ(S;X)

### 3.1 Bochner spaces and closed subspaces

Use native `Lp`, its norm and completeness, the criterion via `‖f‖`,
the L¹ quotient and a.e.-convergent subsequences. For a smaller σ-algebra,
`lpMeasToLpTrimLie` identifies its measurable subspace isometrically with
the trimmed-measure `Lp`. This subspace is closed for complete targets.
Tau Ceti supplies extension by zero for restricted measures and the
restriction/extension pair for a measurable subtype. [Trim isometry and closedness][ml-trim-isometry] · [Extension by zero][tc-extend-by-zero] · [Measurable subtypes][tc-lp-subtype]

For a closed target subspace `Y⊆X`, identify `Lᵖ(μ;Y)` isometrically with
the classes in `Lᵖ(μ;X)` whose values lie in `Y` a.e. Construct the closed
submodule `L∞_σ` of native `L∞` and show that its inclusion is onto for
σ-finite `μ`. Prove compatibility with bounded postcomposition, restriction
and extension by zero using the native norm bounds.

`linftySigma` is the native-L∞ submodule; `isClosed_linftySigma` states its closedness.

(HvNVW, Definition 1.2.15 and Remark 1.2.16, pp. 21–22; the submodule formulation fixes the comparison with native L∞.)

**API.**

- Membership of L∞_σ is invariant under a.e. equality and stable under zero, addition and scalar multiplication.
- The inclusion into native L∞ is linear and isometric; the submodule is closed and is complete when X is complete.
- On σ-finite measures the inclusion is onto; bounded postcomposition, restriction and extension by zero preserve membership and their native norm bounds.

**Check.** On a singleton of infinite measure the constant scalar one has
native L∞ norm one. Every simple function supported on a set of finite measure
vanishes, so L∞_σ is zero.

*Needs:* §1, native Lp maps, submodules, completeness and representative operations.

### 3.2 Approximation by μ-simple functions

For `1≤p<∞`, finite-support simple density gives density of finite sums
`∑_jφ_j x_j` with scalar `φ_j∈Lᵖ`. For a measure-dense family `𝒜`,
Mathlib approximates each finite-measure indicator by indicators from
`𝒜` in `Lp`. Their finite linear combinations are therefore dense. A
generating algebra with a countable cover by finite-measure members is
measure-dense, in particular for finite `μ`. [Indicator approximation][ml-indicator-closure] · [Generating algebras][ml-measure-dense-algebra]

Apply this to finite unions of half-open dyadic cubes on bounded dyadic
boxes to obtain density for bounded axis-parallel cubes in Lebesgue
`Lᵖ(ℝᵈ;X)`, `d≥1`.
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

*Needs:* §1, §3.1, native simple density, `Measure.MeasureDense` indicator approximation and Euclidean generating rectangles.

### 3.3 Separability of Bochner spaces

For `1≤ p<∞` and nonzero `Lᵖ(μ;X)`,
characterize separability by separability of `X` and of the metric space of
finite-measure measurable sets modulo null symmetric difference, with
`d([A],[B])=μ(A△ B)`. Extend VonNeumannAlgebras V2's finite-measure
construction to arbitrary `μ` using `SeparationQuotient` of the finite-measure
subtype of native `MeasuredSets μ`, converting its finite-valued extended
distance to a real distance. For finite `μ`, identify this quotient isometrically
with V2's measure algebra, preserving Boolean operations and measure, and use
its scalar L² separability comparison. [Finite measure algebra and scalar L²][rm-v2-measure-algebra]
Identify separability of this quotient with `MeasureTheory.IsSeparable μ`
and reuse `MeasureTheory.Lp.SecondCountableTopology` for the sufficient direction.
[Measure separability and Lᵖ][ml-lp-separability]
Prove the converse and the equivalent measurable
decomposition `S=S₀⊔ S₁`: the restriction to `S₀` is purely infinite
(every measurable set has measure zero or infinity), and the restriction
to `S₁` is generated modulo null sets by countably many finite-measure
sets. Choose this generating family to cover `S₁` up to a null set.
Prove that `μ|_{S₁}` is σ-finite and that restriction identifies the two
`Lᵖ` spaces isometrically. The zero-space case occurs exactly when `X` is zero
or every measurable set of finite measure is null.

(HvNVW, Definition 1.2.27 and Proposition 1.2.29, pp. 27–28.)

**API.**

- Identify equality in the separation quotient with null symmetric difference, and expose its distance formula using the native quotient metric.
- Descend union, intersection and difference to the arbitrary-measure quotient, with their metric estimates; for finite measures transport V2's complement operation through the identification.
- Prove invariance under completion and null modifications, and compatibility with restriction and measure-preserving maps.

*Needs:* §3.1–§3.2, VonNeumannAlgebras V2's finite measure algebra and scalar L² separability comparison, native MeasuredSets, SeparationQuotient, measure separability and completion.

### 3.4 Scalar evaluations and the Bochner space L∞(S;X)

Let `Y` be a closed linear subspace of `X*` and let `1≤ p≤∞`.
If `x*∘ f∈ Lᵖ(μ)` for every `x*∈ Y`, prove by the closed
graph theorem that `T_f:x*↦[x*∘ f]` is a bounded linear map
`Y→ Lᵖ(μ)`. Strong measurability of `f` is not a hypothesis of
this scalar-evaluation result.
For a.e. strongly measurable `f`, let `E` be a closed separable subspace
with `f(s)∈E` a.e. Suppose `Y` is 1-norming on `E`, meaning
`‖x‖=sup_{y∈B_Y}|y(x)|` for `x∈E`, where `B_Y` is the closed unit ball
of `Y`. If `y∘f` is essentially bounded for every `y∈Y`, prove that `f`
is essentially bounded and `‖f‖_∞=sup_{y∈B_Y}‖y∘f‖_∞=‖T_f‖` for `p=∞`.
Obtain a countable norming family in `B_Y` by applying Tau Ceti's operator
norming theorem to the separable image of `E→Y*`, `x↦(y↦y(x))`.
[Countable norming sets for operators][tc-countable-norming]

(HvNVW, Proposition 1.2.17 and Lemma 1.2.18, pp. 22–23; extend the closed-graph statement to every p ≥ 1.)

**API.**

- Characterize its value at each test functional by the scalar Lᵖ class, proving uniqueness and independence of a.e. representatives.
- Prove linearity in f whenever the scalar Lᵖ hypotheses hold, restriction to closed test subspaces and compatibility with bounded target maps through their adjoints.
- For `f∈Lᵖ(μ;X)`, bound `‖T_f‖` by `‖f‖_p`. At infinity equality holds when `Y` is 1-norming on `E`.

*Needs:* §1, native scalar Lp and the closed graph theorem.

### Dependencies

§1; native `Lᵖ`, closed graph and simple-density APIs; VonNeumannAlgebras V2's
finite measure algebra and scalar L² comparison. This layer extends the finite-set
quotient to arbitrary measures, with set operations and null-set transport.

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
in each variable before applying Fubini and Tau Ceti's scalar Minkowski
inequality. Its nonnegative-integrand form applies to two s-finite measures.
[Minkowski's integral inequality][tc-minkowski-sfinite]

`exists_minkowskiContraction` states the arbitrary-measure contraction for complete X.

(HvNVW, Proposition 1.2.22 and Corollary 1.2.23, pp. 24–25.)

*Needs:* §1–§3, Tau Ceti's scalar Minkowski integral inequality, native Tonelli and §2.4 localization.

### 4.2 Fubini's theorem

For σ-finite `μ,ν` and
`1≤ p<∞`, construct
`Lᵖ(μ;Lᵖ(ν;X))≃ Lᵖ(μ×ν;X)` as a linear isometry
onto, with explicit rectangle formulas and a.e. section formulas for the
inverse. Tau Ceti identifies the iterated and product seminorms. Prove that
the map into `Lᵖ(ν;X)` is a.e. strongly measurable. Prove that this is the
unique continuous linear extension of the finite-measure rectangle formula,
using density of the rectangle tensors. The scalar Hilbert-space rectangle
construction belongs to VonNeumannAlgebras V2.RectangularL2.
[Iterated norms][tc-iterated] · [Hilbert rectangle construction][rm-rectangular-l2]

`exists_fubiniEquiv` states the isometric equivalence and its nested a.e. section formula for complete X.

(HvNVW, Proposition 1.2.24, pp. 25–26.)

*Needs:* §4.1, native product integration and Tau Ceti iterated norms.

### 4.3 Pointwise evaluation of Lᵖ-valued integrals

For Bochner-integrable `F:S→Lᵖ(ν;X)`, construct a jointly strongly
measurable representative `f(s,t)` with `[f(s,·)]=F(s)` for `μ`-almost every `s`.
Treat arbitrary `μ,ν` for `1≤p<∞`, and arbitrary `μ` and σ-finite `ν`
for `p=∞`. Show that `f(·,t)` is integrable for `ν`-almost every `t`
and that `(∫ F)(t)=∫ f(s,t) dμ(s)` a.e. The companion statement is
`exists_integral_Lp_representative`.

Given a joint representative and finite `ν`, Tau Ceti proves product
integrability for arbitrary `μ` and the evaluation identity for s-finite
`μ`, for all `1≤p≤∞`. Use these results on finite-measure pieces. For
arbitrary measures, joint representatives that agree `ν`-a.e. on
`μ`-almost every section agree `μ.prod ν`-a.e. by the product-null lemma.
[Integrability and evaluation in Lᵖ][tc-bochner-lp] · [Product-null lemma][ml-prod-null]

(HvNVW, Proposition 1.2.25 and Remark 1.2.26, pp. 26–27.)

*Needs:* §1–§3, §2.4 and the finite-inner-measure integral formulas above.

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

### Dependencies

§1–§3, Tau Ceti's scalar Minkowski integral inequality, native Tonelli and the product-integral API;
§4.4 consumes Tau Ceti's completed projective tensor product and universal property.

## Layer 5: Convolution and mollification on finite-dimensional spaces

### 5.1 Convolution and Young's inequality

Let `E` be a finite-dimensional real normed space with additive Haar
measure `μ`, `k∈L¹(μ;𝕜)` and `f∈Lᵖ(μ;X)`, where `X` is Banach and
`1≤p≤∞`. Use the Bochner convolution
`(k*f)(x)=∫ k(y) • f(x−y) dμ(y)`. Tau Ceti's Young inequality for
continuous bilinear maps gives `‖k*f‖_p≤‖k‖₁‖f‖_p` for real and complex
kernels, including `p=∞`. Its group convolution theorems give a.e.
integrability at all these exponents and the pointwise formula for the
bundled operator at finite exponents. [Young's inequality][tc-young] · [Group convolution formulas][tc-group-convolution]

For `p<∞`, transport the group formula to `E`, where `y⁻¹*x` becomes
`x−y`, and identify it with `convolutionLp` for real kernels. At `p=∞`,
form the native `L∞` class independently of both representatives.
Use Mathlib's pointwise existence theorem for conjugate exponents `1,∞` and
a.e. strong measurability of convolution. [Measurability and endpoint existence][ml-convolution]

(HvNVW, Lemma 1.2.30, pp. 28–29; the [errata][hvn-errata], entry for p. 28, include the infinity endpoint.)

*Needs:* §3–§4, native translation and Tau Ceti convolution.

### 5.2 Mollification and compact-support approximation

For `1≤p<∞`, Mathlib gives density of compactly supported continuous
functions in Banach-valued `Lᵖ` on locally compact Hausdorff spaces with
regular Borel measure finite on compact sets. Tau Ceti proves convergence
for normalized bumps and, on groups, for nonnegative kernels of integral
one whose essential supports eventually lie in every identity neighborhood.
[Compact-support density][ml-compact-support-density] · [Normalized bumps][tc-approx] · [Group approximate identities][tc-group-approximation]

For `E,μ` as in §5.1, let `d=dim_ℝ E` and
`k_ε(x)=ε^{-d}k(ε⁻¹ • x)` for `ε>0`. Prove for every real or complex
integrable kernel, with arbitrary support, that

`k_ε*f → (∫ k dμ)f in Lᵖ as ε↓0.`

After the Haar change of variables, apply dominated convergence to the
`Lᵖ`-valued translates of `f` weighted by `k`. Give the norm bound,
compatibility with bounded target maps, and agreement with the normalized
bump operators. [Haar scaling][ml-haar-scaling]

(HvNVW, Lemma 1.2.31 and Proposition 1.2.32, pp. 29–30, including the locally compact variant preceding Lemma 1.2.31.)

*Needs:* §5.1, continuous compact-support density, additive Haar scaling and Tau Ceti approximate identities.

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

- Scalar evaluations determine the τ(X,Y)-integral uniquely, and its norm is bounded by the scalar-evaluation operator norm. For an indicator `𝟙_B x` with `μ(B)<∞`, its value on `A` at `x*∈Y` is `μ(A∩B)x*(x)`.
- Prove linearity, a.e. congruence, restriction and compatibility with inclusions of closed dual test subspaces.
- Prove bounded-map functoriality through the restricted adjoint and agreement with the Bochner integral when the latter is integrable.

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
- Prove stability under bounded measurable scalar multiplication and the adjoint characterization using native L∞. For a Bochner-integrable function the representing vector on each measurable set is its Bochner set integral.

*Needs:* §6.1 and native bidual embedding; bounded scalar integration uses Hölder, not L¹-dual surjectivity.

### 6.3 The induced vector measure

Prove norm-countable additivity of `A↦ x_A`. Supply the
Orlicz–Pettis series theorem used here: a series for which every subseries
converges weakly in a Banach space is unconditionally norm convergent.
Use Mathlib's `VectorMeasure.semivariation`, the supremum of the variations
of the real scalar images over the dual unit ball. Relate it for this
measure to the scalar integrals of `f`, using the underlying real space
over `ℂ`. The total variation can be infinite. [Semivariation][ml-semivariation]

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
isomorphic to `c₀`. Apply B4.1's weakly-unconditionally-Cauchy criterion.
A sequence bounded away from zero cannot be the terms of an unconditionally
convergent series. If its finite signed partial sums are uniformly bounded,
B4.1 applied in its closed span gives a copy of `c₀` (Bessaga–Pełczyński). [Banach space theory B4.1][rm-b4-no-c0]

`pettisIntegrable_of_reflexive`, `pettisIntegrable_smul_of_weak_memLp` and
`pettisIntegrable_of_forall_not_antilipschitz` state the reflexive, weak-Lᵖ
and no-c₀ criteria for complete X. In the weak-Lᵖ criterion, localization to
the σ-finite support of the L^q multiplier gives the stated a.e. strong
measurability formulation, since q is finite.

(HvNVW, Theorem 1.2.37 and Corollary 1.2.38, pp. 32–33; Theorem 1.2.40 and Proposition 1.2.41, pp. 34–36.)

*Needs:* §6.1–§6.2, BanachSpaceTheory B1–B3 and B4.1's weakly-unconditionally-Cauchy criterion.

### 6.5 Convexity and uniqueness

For a probability measure and a Pettis integrable `f` lying a.e. in a closed
convex set `C⊆X`, prove `(P)∫f∈C` by Hahn–Banach separation. Deduce membership
in the closed convex hull of the values on any measurable full-measure set.
For `φ:C→ℝ` convex and lower semicontinuous on `C`, with `φ∘f` integrable,
prove `φ((P)∫f)≤∫φ(f)`. In the underlying real space the Pettis integral of
`(f,φ∘f)` is `((P)∫f,∫φ(f))` by scalar tests. Apply convex-set membership
to the closed epigraph. Give both conclusions for normalized averages on
sets of finite positive measure. [Closed-epigraph criterion][ml-epigraph]

For arbitrary measures, apply §2.3's π-system uniqueness to each scalar
evaluation. Equality of Pettis set integrals on a generating π-system
containing the whole space then gives scalar a.e. equality. With essential
separability of both functions, deduce vector a.e. equality using a common
null set. For an essentially
separably valued Pettis integrable `f`, prove the convex-detection criterion
on semifinite spaces by restriction to finite positive-measure sets as in §2.3. For
arbitrary measures and `0∈C`, weak integrability and essential separability
give a σ-finite support via §1.2, and `f` vanishes a.e. off that support.

(HvNVW, Propositions 1.2.42–1.2.45, p. 36; vector uniqueness and convex detection use the essential-separability, measure and generating-system hypotheses above.)

*Needs:* §1.2, §2.2–§2.3 and §6.2–§6.3.

### Dependencies

§1–§3, scalar `L¹` theory, native bidual and weak-topology APIs, and
BanachSpaceTheory B1–B3 and B4.1. Construct the Orlicz–Pettis theorem in §6.3;
consume B4.1's series criterion for the integration-specific application in §6.4.

## Layer 7: The Radon–Nikodým property and representable operators

### 7.1 Vector measures and bounded variation

Use native `VectorMeasure S X`, its norm-countable additivity, its variation
measure and `μ.withDensityᵥ f`. The variation on a measurable set is the
supremum of `∑ᵢ ‖m(Aᵢ)‖ₑ` over finite disjoint measurable families contained
in it, equivalently over finite measurable partitions. Use
`VectorMeasure.le_variation` and `VectorMeasure.exists_lt_sum_of_lt_variation`.
[Variation][ml-variation]

Prove that null-set absolute continuity of `m` is equivalent to `|m|≪μ`.
For finite total variation, apply the scalar small-set criterion to `|m|`
and deduce the equivalent estimates in terms of `‖m(A)‖`. Use the variation
formula under restriction and the variation bound under a bounded target
map. [Small sets][tc-small-sets] · [Restriction][ml-variation-restrict] · [Bounded target maps][tc-variation-map]

The density formula `|m|(A)=∫_A‖f‖` gives
`|m|(A)≤‖f‖_∞μ(A)` for an integrable essentially bounded density. Densities
agree a.e. by `Integrable.withDensityᵥ_eq_iff`. Use these results for
restriction, bounded target maps and change to an equivalent scalar measure.
[Variation of a density][ml-density] · [Uniqueness][ml-density-unique]

Prove the following exhaustion principle on a finite measure space.
A property `P` holds for every measurable set if it holds for all
measurable null sets, every positive-measure measurable set has a positive-measure
measurable subset with `P`, and `P` is closed under countable disjoint
measurable unions. For σ-finite positive
measures `ν≪μ`, construct increasing measurable sets `Sₙ`
covering the space such that `μ(Sₙ),ν(Sₙ)<∞` and, for finite
constants `Cₙ≥0`, `ν(A)≤ Cₙμ(A)` for all measurable `A⊆ Sₙ`.
Scalar Radon–Nikodým derivatives may be used for this construction.
For σ-finite `μ`, truncate Mathlib's strictly positive integrable weight
at one to obtain a finite equivalent measure `wμ`. Prove transport of
densities under this change and gluing of compatible densities along a
finite-measure exhaustion. [Positive weight][ml-positive-weight]

(HvNVW, Definition 1.3.4 and Lemmas 1.3.6–1.3.8, pp. 40–43; Lemmas 1.3.11–1.3.12, pp. 44–45, and the localization constructions in the proof of Theorem 1.3.10, pp. 45–47.)

*Needs:* §1–§3, native vector-measure variation, scalar Radon–Nikodým, densities and integrable-density uniqueness.

### 7.2 The Radon–Nikodým property

For a fixed measure `μ`, define the RNP
of `X` with respect to `μ` by the assertion that every
`m : VectorMeasure S X` with finite total variation and
`|m|≪μ` has an integrable density `f`, with `m = μ.withDensityᵥ f`.
For scalar targets Tau Ceti gives the density against a σ-finite reference
measure. [Scalar Radon–Nikodým theorem][tc-scalar-rn]
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

*Needs:* Native variation and densities for the definitions; §7.1 and §7.3–§7.5 for universality.

### 7.3 Representable operators

For arbitrary `μ`, call a bounded operator `T:L¹(μ)→ X` representable
if there is a density `φ∈ L∞_σ(μ;X)` such that `Tf=∫ fφ` for every `f`.
Restrict the native integral pairing to `L∞_σ(μ;X)`, and prove that the
map `φ↦T_φ` into `𝓛(L¹(μ),X)` is an isometry with a.e.-unique densities.
[Integral pairing][ml-integral-pairing]
On finite measure spaces, test on normalized indicators of sets where the
density is close to a fixed vector. For semifinite `μ` the norm identity
holds for every native `φ∈L∞(μ;X)`. Choose a strongly measurable representative.
For `0≤a<‖φ‖_∞` take a measurable subset of `{‖φ‖>a}` of finite positive
measure, apply the finite case there and extend
scalar `L¹` tests by zero. For arbitrary `μ` apply this on the σ-finite
support of an `L∞_σ` density. On a set `A` of finite measure,
`T_φ(𝟙_A)=∫_A φ`. Prove compatibility with bounded target maps.
On a finite measure space, associate to a bounded operator `T:L¹(μ)→X`
the vector measure `m_T(A)=T(𝟙_A)` on measurable sets. Its variation
satisfies `|m_T|(A)≤‖T‖μ(A)`. The bounded densities of `m_T` are exactly
the functions representing `T`, by agreement on simple functions.
Conversely, if `|m|≤Cμ`, apply Mathlib's `setToL1` to the dominated
finitely additive data `A↦(c↦c • m(A))` to obtain the operator on L¹ of norm
at most `C`. Use `setToL1'` for the complex-linear extension.
[Extension from indicators][ml-set-to-l1] · [Norm bound][ml-set-to-l1-norm]
Apply this correspondence on the
finite-measure pieces in §7.1 and glue the densities. For σ-finite `μ` the
map from native `L∞(μ;X)` is then onto exactly when `X` has the RNP with
respect to `μ`.
For integrable `h`, prove relative norm compactness of `{∫_A h : A measurable}`.
For a representable operator on a finite measure space this gives relative
norm compactness of its indicator images `{T(𝟙_A) : A measurable}`.

`representableOperatorMap` uses the native Lp pairing. For complete `X`,
`norm_representableOperatorMap` gives the native norm identity for semifinite
`μ`, and `representableOperatorMap_surjective_iff` gives the relative-RNP
criterion for σ-finite `μ`.

(Diestel–Uhl, Chapter III, §1, for the correspondence between operators on L¹
and vector measures. HvNVW, Definition 1.3.15 and Theorem 1.3.16, pp. 48–50,
and Lemmas 1.3.19–1.3.20, pp. 51–52.)

*Needs:* §1.2, §3.1–§3.2, §7.1, the relative-RNP definition in §7.2 and native Lp pairing.

### 7.4 Stability and separable determination

Prove invariance under continuous linear equivalence and inheritance by closed
subspaces. For σ-finite `μ`, prove that relative RNP is equivalent to relative
RNP of every closed
separable subspace. Prove passage to sub-σ-algebras for finite measures,
and the σ-finite variant assuming σ-finiteness of the
trimmed measure.
For arbitrary measures and any smaller σ-algebra use the scalar L²
projection `condExpL2`. Mathlib gives preservation of integrals and the real
L¹ contraction estimate on each finite-measure set of the smaller σ-algebra.
Localize to the σ-finite support of the projected function to obtain the
global contraction on L¹∩L², then extend to L¹ by density. Prove positivity,
the modulus inequality and agreement with the L² projection on L¹∩L².
The native `condExpL1CLM` gives the comparison when the trimmed measure
is σ-finite. [Local estimate][ml-condexp-l2-estimate] · [Native L¹ projection][ml-condexp-l1]
Under σ-finiteness of the trimmed measure, construct the scalar
`L∞` contraction as the adjoint of the `L¹` projection and prove
agreement on intersections with `L²`, identifying the integrable realization
with native conditional expectation. On finite measures use Tau Ceti's
Banach-valued `condExpLpCLM`, a contraction for every `1≤p≤∞`, to obtain a
density measurable for the smaller σ-algebra. Prove its scalar-pairing and
set-integral identities. [Finite-measure conditional expectation][tc-condexp-lp]
Obtain the σ-finite formulas by localization and gluing.

(HvNVW, the conditional-expectation construction on pp. 50–51, Lemma 1.3.17 and Theorem 1.3.18, p. 51.)

**API.**

- Construct the unique bounded extension from L¹∩L² to native scalar L¹, with norm at most one and agreement with the L² projection on the intersection.
- Prove idempotence, identify the range with the closed subspace of classes measurable for the smaller σ-algebra, and preserve integrals on its finite-measure sets.
- Prove positivity, the modulus inequality, a.e. congruence and the tower law for nested σ-algebras. Under σ-finiteness of the trimmed measure, identify it with native L¹ conditional expectation and prove the L∞ adjoint formulas.

**Check.** For Lebesgue measure on ℝ, the only integrable constant is zero.
The L¹ projection onto the trivial σ-algebra therefore sends `𝟙_[0,1]` to
zero, although its integral over ℝ is one.

*Needs:* §3.1–§3.2, §7.1, the relative-RNP definition in §7.2, §7.3 representability, native scalar and Banach-valued conditional expectation, and BanachSpaceTheory B5's scalar L¹ duality for the L∞ adjoint; no universality input.

### 7.5 Universality of the unit interval [0,1]

Prove that the RNP with respect to Lebesgue measure on `[0,1]` implies the
RNP with respect to every finite measure. Use §7.4 to reduce to a separable
target. Show that each bounded operator `T:L¹(μ)→X` on a finite measure
space then factors through conditional expectation onto a countably
generated sub-σ-algebra. A density on that sub-σ-algebra represents `T`.

On the atomic part, recover the density on each positive-mass atom `A` as
`T(𝟙_A)/μ(A)`. Normalize the atomless part when it has positive mass.
VonNeumannAlgebras V2 identifies its probability measure algebra with that
of `[0,1]`. [Measure-algebra classification][rm-v2-interval]
Transport scalar L¹ and Bochner densities through this
measure-preserving Boolean isomorphism. This preserves representability by
§7.3. Glue densities along a finite-measure exhaustion for σ-finite measures.

Prove the RNP for a dual space that is itself separable. For reflexive
spaces apply the independent finite-measure density theorem in
BanachSpaceTheory B4.0 and the finite-measure characterization above.
[Reflexive density theorem][rm-b4-density]

`hasRNP_strongDual_of_separable` states the separable-real-dual theorem for complete X; complex duals use the real-dual comparison.

(Diestel–Uhl, Chapter III, §3, for separable dual spaces. HvNVW, Theorem
1.3.21, p. 53, and Theorem 1.3.26 and its proof, pp. 55–59.)

**API.**

- Send a simple tensor `𝟙_A x` to `𝟙_B x` when the Boolean isomorphism sends the class of `A` to that of `B`. Extend by simple-function density to linear isometries on scalar and Bochner L¹. Prove compatibility with inverse and composite isomorphisms.
- Show that the Bochner isometry preserves essential bounds and transports the integral on `A` to the integral on `B`. These identities carry representing densities across the scalar L¹ isometry.

*Needs:* §3.2–§3.3, §7.1, §7.3–§7.4, VonNeumannAlgebras V2's finite measure algebra and nonatomic interval classification, and BanachSpaceTheory B4.0's independent reflexive density theorem.

### Dependencies

§1–§3, native variation and scalar Radon–Nikodým APIs,
scalar and Banach-valued conditional-expectation APIs, VonNeumannAlgebras V2's
measure-algebra classification, and the BanachSpaceTheory suppliers above.
Prove §7.1 and §7.3 for a fixed
measure before using them in separable determination and universality.

## Layer 8: Duality of Bochner spaces

### 8.1 The integral pairing and its isometry

Use Mathlib's `ContinuousLinearMap.lpPairing` for evaluation
`X* × X → 𝕜`. For conjugate exponents its integral formula and Hölder bound
give the canonical contraction

`J:L^q(μ;X*)→(Lᵖ(μ;X))*, (Jg)(f)=∫⟨f(s),g(s)⟩ dμ(s).`

Tau Ceti supplies scalar and Hilbert-space norm tests, including tests by
simple functions for a finite exponent and σ-finite measure.
[Integral pairing][ml-integral-pairing] · [Hilbert norm tests][tc-hilbert-norm-tests]

Prove naturality for bounded target maps. For σ-finite `μ` and every
conjugate pair `1≤p,q≤∞`, prove that `J` is an isometry with closed,
norming range. Allow any closed norming subspace of `X*`. At `p=1`
semifiniteness suffices for the native map to be isometric. For
`0≤a<‖g‖_∞`, take a finite positive-measure subset of `{‖g‖>a}` and
extend its L¹ tests by zero. For arbitrary measures prove the isometry
and norming range at interior exponents and give the endpoint versions
using `L∞_σ` on the infinity side. For any norming linear subspace
`Y⊆X*`, prove that the `Y`-valued μ-simple functions of essential norm
at most one already norm `L¹(μ;X)`, for arbitrary `μ`.

For `bochnerDualMap`, the norm identities are `norm_bochnerDualMap` (σ-finite),
`norm_bochnerDualMap_of_one_lt` (interior), `norm_bochnerDualMap_one`
(semifinite L¹ endpoint) and `norm_bochnerDualMap_linftySigma` (arbitrary
measure at the support-restricted endpoint). `norm_le_of_dual_pairing_bound`
gives the norming property.

(HvNVW, Proposition 1.3.1 and Corollary 1.3.2, pp. 37–39; endpoint comparisons use the conventions above.)

**API.**

- Give the pairing's naturality formula for a bounded map and its adjoint, and its invariance under a.e. equality.
- Identify the endpoint maps obtained by restricting the native pairing to `L∞_σ`.

**Check.** On a one-point probability space over ℂ, pairing the constant
one with the functional `z ↦ iz` gives `i`. This fixes the complex scalar
convention for the integral pairing.

*Needs:* §1–§3, native Lp pairing and Hahn–Banach; no RNP input.

### 8.2 Duality and the Radon–Nikodým property

For σ-finite `μ` and `1≤ p<∞`,
prove that `J` is onto if and only if `X*` has the RNP with respect to
`μ`. Bundle the resulting linear isometric equivalence and its integral
formula. Derive surjectivity for reflexive `X` and for separable `X*`.
If `X*` has the intrinsic RNP, prove surjectivity for arbitrary measures
when `1<p<∞`, by localizing each functional to an appropriate
σ-finite support. Tau Ceti supplies the scalar isometric equivalence for
interior exponents on σ-finite spaces and the scalar L¹ endpoint on finite
spaces. [Scalar Lᵖ duality][tc-scalar-lp-dual] · [Scalar L¹ duality][tc-l1dual]

`bochnerDualMap_surjective_iff` and `bochnerDualMap_surjective_of_hasRNP` state the relative and intrinsic RNP conclusions for complete X.

(HvNVW, Theorem 1.3.10, pp. 43–47, Corollary 1.3.13, p. 47, and Corollary 1.3.22, pp. 53–54.)

*Needs:* §8.1 and §7, with §7.1 localization for arbitrary measures.

### 8.3 Duality of atomic Bochner spaces and ℓᵖ sums

Use Mathlib's [`lp.dualPairing`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Lp/lpHolder.lean#L264) and
[`lp.norm_dualPairing`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Lp/lpHolder.lean#L275) for the sum pairing and its norm bound.

For any family of normed spaces `(Xᵢ)ᵢ∈I` and conjugate exponents
`1<p,q<∞`, identify the dual of the `ℓᵖ` sum of the `Xᵢ` isometrically with
the `ℓ^q` sum of the `Xᵢ*`. The `i`-th coordinate of `Φ` is `x↦Φ(ιᵢx)`, where `ιᵢ`
is the coordinate inclusion. Test on finitely supported vectors to bound
the `ℓ^q` norm of these restrictions by `‖Φ‖`. The sum pairing recovers `Φ`
by finite-coordinate approximation (`lp.hasSum_single`). At `p=1`,
BanachSpaceTheory B5.LocalHaarDual supplies the identification with all
uniformly bounded families `xᵢ*∈Xᵢ*`. [Dependent ℓ¹ sums][rm-b5-l1-sums]
Take constant
fibres to recover `(ℓᵖ(I;X))*≃ℓ^q(I;X*)` and check agreement with scalar
`lp.dualEquiv`. Transfer the constant-fibre result to measure spaces whose
σ-algebra is generated by atoms. For `1≤p<∞`, a measurable atom `A` with
`0<μ(A)<∞`, and `Φ ∈ (Lᵖ(μ;X))*`, set `x*_A(x) = Φ(𝟙_A x)` and prove
`‖x*_A‖ ≤ μ(A)^(1/p)‖Φ‖`; the representing density on A is `x*_A/μ(A)`.
Infinite-measure atoms contribute no nonzero finite-exponent vectors. Include the `p=1` Bochner-space statement
for σ-finite atomic spaces. For uncountable `I`, bounded families
need not have separable range, so the sequence-space infinity endpoint
can differ from Bochner `L∞`.

`exists_lpDualEquiv` states the linear isometric equivalence and coordinate
formula for normed fibres, including `p=1` and `q=∞`.

(HvNVW, Proposition 1.3.3 and the atomic-measure discussion preceding it, pp. 39–40; the [errata][hvn-errata], entry for p. 39, give the atom-dependent functional bound.)

*Needs:* §3.2, Mathlib `lp.dualPairing`, `lp.norm_dualPairing` and `lp.hasSum_single`, scalar `lp.dualEquiv`, and BanachSpaceTheory B3 and B5.LocalHaarDual.

### Dependencies

§1–§4 and §7, BanachSpaceTheory B3, and B5's scalar duality and dependent `ℓ¹`-sum lemma.
§8.1 and the atomic result do not require the RNP theorem.

## Downstream consumers

- Fourier inversion uses Lᵖ convergence of mollifiers (§5.2). Estimates
  for Fourier type in higher dimensions use mixed-norm interchange (§4.1).
  (HvNVW, §§2.4.a–2.4.b.)
- The `ℓ^q`-valued Doob maximal inequality uses the norming integral pairing
  (§8.1). Duality of Bessel potential spaces uses the same pairing and its
  surjectivity when the dual target has the RNP (§8.2).
  (HvNVW, §3.2.a, pp. 178–180, and §5.6.a, pp. 451–452.)

## Scope and ownership

The Bochner integration lemmas used in §§1.4, 2.4 and 4.3 are in Tau Ceti's
measure-theory library. [Bochner integrals][tc-bochner-folder]

Bochner's theorem on positive-definite functions belongs to the semigroup
roadmap. The Bochner curvature identity belongs to Riemannian geometry.
[Semigroup roadmap, Part C][rm-bochner] · [Fourier representation][tc-bochner-fourier] · [Riemannian identity][tc-bochner-riemannian]

| Shared material | Owner and interface consumed here |
| --- | --- |
| Continuous duals, weak and weak-star topologies, Hahn–Banach separation, reflexivity and weak compactness | [Banach space theory](../BanachSpaceTheory/README.md), B1–B2; use native continuous duals, submodules and bidual embeddings |
| Classical sequence spaces | [Banach space theory](../BanachSpaceTheory/README.md), B3, for the native `lp` and `C₀(ℕ, 𝕜)` comparisons in §§6.4 and 8.3 |
| Densities for bounded-variation measures with reflexive Banach targets on finite measure spaces | [Banach space theory](../BanachSpaceTheory/README.md), B4.0, its finite-measure density prerequisite; §7 consumes this theorem and supplies the general RNP interface and its consequences |
| The weakly-unconditionally-Cauchy criterion for spaces containing no copy of c₀ | [Banach space theory](../BanachSpaceTheory/README.md), B4.1; §6.4 applies this series criterion to Pettis integrability |
| Scalar `Lᵖ` duality, scalar measure representation and scalar Dunford–Pettis theory | [Banach space theory](../BanachSpaceTheory/README.md), B5, including B5.LocalHaarDual's dependent `ℓ¹`-sum lemma. Section 8 owns Bochner-space duality. |
| Finite measure algebras, their scalar L² separability criterion and nonatomic interval classification | [Von Neumann algebras](../VonNeumannAlgebras/README.md#layer-2-elementary-algebra-corners-and-tensors), V2; §3.3 extends the finite-set quotient to arbitrary measures and Banach-valued Lᵖ, and §7.5 constructs L¹ transport and RNP applications |

B4.0 supplies its reflexive density theorem independently of §§7–8.
The scalar duality used in §8 comes from B5 independently of Bochner duality.

The support-restricted `L∞_σ` below uses global a.e. equivalence.
It is distinct from B5's local-null `L∞` carrier for arbitrary Haar
measures, whose construction and duality remain in B5.

Martingale convergence, UMD spaces, stochastic integration, differentiability
characterizations of the RNP, Hardy–BMO duality, and Fourier multiplier theory are
outside this roadmap. Section 5 treats Lᵖ convergence of mollifiers. Pointwise
differentiation and Sobolev estimates belong to the corresponding analysis
roadmaps. Conditional expectation enters through the scalar
projection, contraction, and integral-preservation results and the
Banach-valued restriction formulas needed in §7.

## Exact supplier contracts

The [project manifest](../../lake-manifest.json) pins the companion Lean file to
Tau Ceti `2fd255d9`. Links to `8794ab32` cite additional library results,
including the representative formula in §4.3 and the convolution bounds in §5.1.

### From Mathlib

- Use `StronglyMeasurable`, `AEStronglyMeasurable` and their finite-support
  counterparts. `AEFinStronglyMeasurable.exists_set_sigmaFinite` supplies a σ-finite
  support, and `MemLp.aefinStronglyMeasurable` applies at finite positive exponents.
  [Strong measurability][ml-strong] · [A.e. strong measurability][ml-aestrong] · [Lᵖ localization][ml-strong-lp]
- `SimpleFunc.integral_eq_sum`, linearity, the integral norm bound and a.e.
  congruence supply the Bochner integral API. Use
  `tendsto_integral_of_dominated_convergence` and `integrable_map_measure` for
  convergence and substitution. [Bochner integration][ml-bochner] · [Dominated convergence][ml-dominated] · [Integrability][ml-integrable]
- `RCLike.iInter_countable_halfSpaces_eq` and `ConvexOn.real_sSup_of_nat_affine_eq`
  give the countable representations in §2.2. Use `Convex.integral_mem`,
  `Convex.set_average_mem` and `ConvexOn.map_condExp_le` with `condExp_bot`.
  [Half-spaces][ml-countable-half-spaces] · [Affine minorants][ml-affine-minorants] · [Convex integrals][ml-convex-integral] · [Jensen][ml-conditional-jensen]
- `Integrable.prod_right_ae`, `Integrable.integral_prod_left` and `integral_prod`
  apply under their s-finiteness hypotheses. For arbitrary measures,
  `Measure.measure_prod_null_of_ae_null` gives product nullity from a.e. null
  sections of a measurable set. [Product integration][ml-prod] · [Product measures][ml-prod-null]
- Use finite-exponent simple density, completeness and a.e.-convergent
  subsequences in native `Lp`. `MeasuredSets.edist_def` gives the
  symmetric-difference pseudodistance for §3.3. `Measure.MeasureDense` and
  `MeasureTheory.IsSeparable` supply the set approximation and sufficient
  separability criterion in §§3.2–3.3. [Simple functions][ml-simple] · [Completeness][ml-lp-complete] · [Measured sets][ml-measured-sets] · [Separable measures][ml-separable-measure]
- `ContinuousLinearMap.lpPairing` integrates a continuous bilinear map on
  conjugate `Lp` spaces. For a family of bilinear maps with norms bounded
  by `K≥0` and complete target, `lp.dualPairing` sums the coordinate pairings
  and `lp.norm_dualPairing` bounds its norm by `K`. For finite `p` use
  `lp.hasSum_single` for coordinate approximation. [Integral pairing][ml-integral-pairing] · [Sequence pairing][ml-lp-holder] · [Finite coordinates][ml-lp-sums]
- `VectorMeasure.variation` and `Measure.withDensityᵥ` supply the variation
  and density formulas in §7.1. `VectorMeasure.ext_of_generateFrom` and
  `Integrable.withDensityᵥ_eq_iff` give §2.3's uniqueness corollary on
  arbitrary measures with complete target. [Variation][ml-variation] · [Densities][ml-density] · [Extensionality][ml-vector-measure-ext] · [Uniqueness][ml-density-unique]
- Use `NullMeasurableSpace`, `Measure.completion` and `Measure.ae_completion`
  in §1.5, and `Measure.sigmaFiniteSetWRT` for the measure exhaustions in §7.1.
  [Completion][ml-null] · [Exhaustion][ml-exhaustion]
- `condExpL2` preserves integrals over finite-measure sets in the smaller
  σ-algebra. Under a σ-finite trim, `condExpL1CLM` gives the L¹ comparison
  and native conditional expectation supplies the order and norm estimates.
  [L² projection][ml-ce-l2] · [L¹ projection][ml-condexp-l1] · [Conditional expectation][ml-ce] · [Order estimates][ml-ce-real]

### From Tau Ceti

- `TauCeti.CompletedProjectiveTensor.liftIsometry` identifies bounded
  bilinear maps with bounded maps out of the completed projective tensor
  product. Use `TauCeti.ProjectiveTensor.tmulL` on pure tensors in §4.4.
  [Completion][tc-tensor-completion] · [Projective norm][tc-tensor]
- For separable inner-product spaces, `aestronglyMeasurable_iff_forall_inner`
  and `aestronglyMeasurable_strongDual_iff_forall_apply` give scalar tests.
  For Carathéodory evaluation use `AEStronglyMeasurable.apply_of_forall_of_continuous`
  at the project pin, or its continuous-at form. Finite-dimensional operator
  fields have an orbitwise criterion for a.e. strong measurability in the
  operator norm. For inner regular measures use the finite-support
  evaluation lemmas. [Hilbert scalar tests][tc-pettis] · [Carathéodory][tc-caratheodory] · [Continuous-at form][tc-caratheodory-at] · [Finite-dimensional fields][tc-finite-operator-fields] · [Inner regularity][tc-innerregular]
- `eLpNorm_prod_eq_eLpNorm_eLpNorm` gives the iterated norm for s-finite
  inner measure. For `lintegral_Lp_lintegral_le` the project pin assumes a
  σ-finite outer and s-finite inner measure. The s-finite version applies
  to both measures. [Iterated norms][tc-iterated] · [Pinned Minkowski inequality][tc-minkowski] · [S-finite version][tc-minkowski-sfinite]
- In §4.3, `Integrable.integrable_uncurry_of_ae_eq_Lp` and
  `Integrable.coeFn_integral_Lp` use a joint representative and finite
  inner measure. Only the integral evaluation requires an s-finite outer
  measure. [Bochner integrals in Lᵖ][tc-bochner-lp]
- `convolutionLp` gives the additive real-kernel operator at finite
  exponents. The group operator `Lp.convolutionL` has an a.e. integral formula
  at finite exponents for real or complex kernels. `eLpNorm_convolution_le`
  gives Young's estimate for `1≤p≤∞`. [Additive convolution][tc-convolution] · [Group operator][tc-group-convolution] · [Young's inequality][tc-young]
- Use `MemLp.integrable_apply` for the dual pairing. Scalar
  `Lp.toDual` is isometric on σ-finite spaces. The scalar equivalences
  are `Lp.dualEquiv` at interior exponents for σ-finite measures,
  `Lp.dualOneEquiv` for L¹ on finite measures, and `lp.dualEquiv` for
  scalar sequences. [Hölder][tc-holder] · [Isometry][tc-duality] · [Interior duality][tc-scalar-lp-dual] · [L¹ duality][tc-l1dual] · [Sequence duality][tc-seqdual]
- Integration against `μ.withDensityᵥ f` agrees with Bochner integration
  of the corresponding integrand against `μ`. [Vector densities][tc-density]

### From Banach space theory

[Banach space theory](../BanachSpaceTheory/README.md) supplies continuous-dual
and weak-topology comparisons, annihilators, adjoints, reflexivity and weak
compactness in B1–B2. B3 gives the classical sequence-space comparisons.
B4.1 supplies the equivalence between absence of a copy of c₀ and
unconditional convergence of every series with uniformly bounded finite signed
partial sums, used in §6.4. B4.0 supplies the finite-measure density theorem for
bounded-variation measures with reflexive targets, independently of the general RNP
and duality theorems here. B5 supplies scalar Lᵖ duality and scalar measure
representation. Use B5.LocalHaarDual's identification of the dual of a dependent
`ℓ¹` sum by coordinate restriction for the `p=1` endpoint in §8.3.

### From Von Neumann algebras

[Von Neumann algebras V2](../VonNeumannAlgebras/README.md#layer-2-elementary-algebra-corners-and-tensors)
supplies the finite measure algebra modulo null sets, its Boolean operations,
measure and metric `μ(A△B)`, and the equivalence of its separability with scalar
L² separability. It also supplies a measure-preserving Boolean isomorphism
between any separable atomless probability measure algebra and that of `[0,1]`,
preserving countable operations. Use this measure-theoretic classification
independently of the operator-algebra comparison.

## References

- **HvNVW.** T. Hytönen, J. van Neerven, M. Veraar and L. Weis,
  [*Analysis in Banach Spaces, Volume I: Martingales and Littlewood–Paley Theory*](https://doi.org/10.1007/978-3-319-48520-1),
  Springer, 2016. Chapter 1, “Bochner spaces,” §§1.1–1.3, pp. 2–59.
  Apply the authors' [errata and corrigenda][hvn-errata] (June 18, 2026).
  Citations use this edition's numbering.
- **Diestel–Uhl.** J. Diestel and J. J. Uhl, Jr.,
  [*Vector Measures*](https://doi.org/10.1090/surv/015), Mathematical Surveys 15,
  American Mathematical Society, 1977. Chapter I, §4, Corollary 4, p. 22, gives
  the Orlicz–Pettis series theorem. Chapter II, §2 treats Bochner integration.
  Chapter III, §§1 and 3 treat representability of operators on L¹ and the
  Radon–Nikodým property of separable dual spaces.
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
[ml-epigraph]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Topology/Semicontinuity/Basic.lean#L337
[ml-prod]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Prod.lean
[ml-prod-null]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/Prod.lean#L385-L396
[ml-simple]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/SimpleFuncDenseLp.lean
[ml-lp-complete]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/LpSpace/Complete.lean
[ml-lp-holder]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Lp/lpHolder.lean
[ml-lp-sums]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Normed/Lp/lpSpace.lean#L1169-L1173
[ml-haar-scaling]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean#L85-L94
[ml-measured-sets]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/MeasuredSets.lean
[ml-separable-measure]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/SeparableMeasure.lean
[ml-density]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/WithDensityVec.lean
[ml-density-unique]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/WithDensity.lean#L169
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
[ml-aestrong-criterion]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/AEStronglyMeasurable.lean#L660
[ml-affine-minorants]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Convex/Approximation.lean#L251
[ml-compact-support-density]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ContinuousMapDense.lean#L142
[ml-condexp-bot]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean#L288
[ml-condexp-l1]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL1.lean#L313-L326
[ml-condexp-l2-estimate]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean#L145
[ml-conditional-jensen]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/CondJensen.lean#L168
[ml-convolution]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/Convolution.lean#L520-L553
[ml-countable-half-spaces]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Analysis/LocallyConvex/Separation.lean#L390
[ml-finite-support]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean#L1231
[ml-indicator-closure]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/SeparableMeasure.lean#L136
[ml-integral-pairing]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/Holder.lean#L144-L155
[ml-lp-separability]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/SeparableMeasure.lean#L427
[ml-measurable-embedding]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean#L855
[ml-measure-dense-algebra]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Measure/SeparableMeasure.lean#L269
[ml-norm-approximation]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/SimpleFuncDenseLp.lean#L83
[ml-positive-weight]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean#L227
[ml-semivariation]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/Variation/Semivariation.lean#L53
[ml-set-to-l1]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/SetToL1/L1.lean#L53-L74
[ml-set-to-l1-norm]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Integral/SetToL1/L1.lean#L257
[ml-strong-criterion]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean#L713
[ml-strong-embedding]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean#L769
[ml-strong-representative]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/StronglyMeasurable/AEStronglyMeasurable.lean#L173
[ml-trim-isometry]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/Function/ConditionalExpectation/AEMeasurable.lean#L285-L313
[ml-variation-restrict]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/Variation/Basic.lean#L224
[ml-vector-measure-ext]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/MeasureTheory/VectorMeasure/Basic.lean#L212
[rm-b4-density]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/TauCetiRoadmap/BanachSpaceTheory/README.md#L381
[rm-b4-no-c0]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/TauCetiRoadmap/BanachSpaceTheory/README.md#L768
[rm-b5-l1-sums]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/TauCetiRoadmap/BanachSpaceTheory/README.md#L1087
[rm-bochner]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/Completed/OneParameterSemigroups/README.md#L204
[rm-rectangular-l2]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/TauCetiRoadmap/VonNeumannAlgebras/README.md#L1027
[rm-v2-interval]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/TauCetiRoadmap/VonNeumannAlgebras/README.md#L1177
[rm-v2-measure-algebra]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0fe56074126d216a87245d40dc3fcc7a02a362b/TauCetiRoadmap/VonNeumannAlgebras/README.md#L1047
[tc-bochner-folder]: https://github.com/TauCetiProject/TauCeti/tree/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Integral/Bochner
[tc-bochner-fourier]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/Analysis/Bochner/BochnerTheorem.lean#L243
[tc-bochner-lp]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Integral/Bochner/Lp.lean#L31-L61
[tc-bochner-riemannian]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/Geometry/Manifold/Riemannian/Bochner/Basic.lean#L15
[tc-bochner-subtype]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Integral/Bochner/Subtype.lean#L130-L141
[tc-caratheodory-at]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean#L41
[tc-condexp-lp]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Function/ConditionalExpectation/CondexpLp.lean#L55
[tc-countable-norming]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Normed/Operator/Norming.lean#L102
[tc-extend-by-zero]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Function/Lp/ExtendByZero.lean#L80
[tc-finite-operator-fields]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Function/StronglyMeasurable/FiniteDimensional.lean#L39
[tc-group-approximation]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Group/Convolution/ApproximateIdentity.lean#L87
[tc-group-convolution]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Group/Convolution/Pointwise.lean#L306-L323
[tc-hilbert-norm-tests]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Function/Lp/Duality.lean#L245
[tc-lp-subtype]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Function/Lp/Subtype.lean#L137
[tc-minkowski-sfinite]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Integral/MinkowskiIntegral.lean#L153
[tc-operator-field]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Integral/Bochner/OperatorField.lean#L41
[tc-scalar-lp-dual]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/Function/Lp/Dual.lean#L39
[tc-scalar-rn]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/MeasureTheory/VectorMeasure/Decomposition/RadonNikodym.lean#L105
[tc-small-sets]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/Measure/AbsolutelyContinuous.lean#L87
[tc-variation-map]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/MeasureTheory/VectorMeasure/Variation/Basic.lean#L34
[tc-young]: https://github.com/TauCetiProject/TauCeti/blob/8794ab329bb60340fa690a2902cf995f0571721b/TauCeti/Analysis/Convolution/Young.lean#L167
