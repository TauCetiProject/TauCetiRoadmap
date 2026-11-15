# Rigid analytic geometry

Develop classical affinoid algebra and its comparison with rigid and adic
geometry over a complete nontrivially valued nonarchimedean field. The algebraic
milestones are Noether normalisation, the maximum modulus principle, integral
reduction and the Banach function algebra theorem. The geometric milestones
construct the classical G-site, rigid spaces and analytification, and compare
them with the shared adic-space programme. Coherent cohomology and proper
GAGA are transported from their named suppliers. Applications include proper
cohomology, analytic families and the geometry underlying eigenvarieties.

This README is the mathematical specification. Every target and check is
required. [Suggested.lean](Suggested.lean) fixes representative interfaces on
existing carriers; its admitted theorems are specifications, not proofs. It is
not an exhaustive checklist. Production modules import library mathematics,
not another roadmap's prototype.

## Scope and ownership

This roadmap owns classical affinoid algebra, subdomains, the classical
G-site and rigid category, rigid analytification and the rigid–adic comparison.
Results labelled **supplier contracts** are implemented once in the named
roadmap and transported through explicit maps. Dependencies are between theorem
groups: the affinoid algebra and classical category do not depend on the later
cohomology theorems which consume them.

| Supplier | Interface used here | Boundary |
| --- | --- | --- |
| [Restricted power series][RestrictedPowerSeries] ([PR #919](https://github.com/TauCetiProject/TauCetiRoadmap/pull/919)), §§2.4, 4–6 | Native Tate algebras, Gauss norms, reduction, evaluation, Weierstrass theory, distinguished charts, Rückert theory, closed ideals and finite Tate modules; positive-polyradius algebra | Those constructions and proofs are not repeated here. Weak stability of the Gauss fraction field, general affinoids and the converse strict-radius criterion are below |
| [P-adic functional analysis][PadicFunctionalAnalysis] ([PR #930](https://github.com/TauCetiProject/TauCetiRoadmap/pull/930)), Layers 0–2 | Gauges, bounded maps, open mapping, finite-module topology, `c₀` presentations, countable type and bounded lifting | General Banach-module analysis stays there; §7.1 specifies the additional prerequisite contracts precisely |
| [Compact operators][CompactOperators] ([PR #932](https://github.com/TauCetiProject/TauCetiRoadmap/pull/932)), Layers 0–3 | Finite-image approximation, complete continuity, Fredholm series and Riesz projectors | No new complete-continuity or determinant definition here |
| [Scheme and stack foundations](../SchemeAndStackFoundations/README.md) | Japanese/Nagata ring vocabulary, permanence criteria, excellence and algebraic completion criteria | Apply the shared algebraic criteria; do not introduce another `Ring.IsJapanese` |
| [AdicSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AdicSpaces) and [Part II, PR #817](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817), R0–R1 | Huber pairs, topological localisation, completed tensors, spectral theory, adic morphisms and adic analytification | This roadmap supplies classical affinoid and rigid theory to R0.9 and R1, including the rigid–adic comparison; Part II owns the adic constructions and additional morphism comparisons |
| [Part III, PR #813](https://github.com/TauCetiProject/TauCetiRoadmap/pull/813), R3.1–R3.7 | Coherence, Kiehl's Banach lemmas, almost noetherianity, complete field extension, quasi-Stein and proper cohomology, proper GAGA | §§1.3, 2.3 and 7 record classical specialisations; R3.6's algebraic inputs precede its geometric applications. Classical affinoid acyclicity is supplied here |
| [Part IV, PR #815](https://github.com/TauCetiProject/TauCetiRoadmap/pull/815), F1.1 and R5.7 | Consumers of strict-polyradius affinoidness and rational-local reducedness | Dagger algebras, weak completion, étale/pro-étale geometry and their site comparisons stay there |
| [LocallyAnalyticDistributions, PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854), §§4.2, 4.16 | The `C₀` tensor comparison, geometric slope tests, Fredholm-window existence and finite-slope complexes | §7.2 supplies the classical module-level slope predicate, decomposition and projection; LAD owns geometric comparison, functoriality and uniqueness |

The interfaces consumed by Part II are `IsAffinoidAlgebra`, the affinoid
norm and reduction theorems, `Sp`, affinoid subdomains, classical Tate
acyclicity, `RigidSpace`, rigid analytification and `rigidToAdic`. Part II's
R0.9 transports the algebraic predicate to its topological presentation;
its R1 names refer to these objects, not independent definitions.
Part III supplies coherent and proper-cohomology theorems after the classical
category and comparison functor. Its algebraic targets
*affinoid-completed-field-extension* and *almost-noetherian-integral-affinoid-modules*
use only the Tate, Banach and affinoid algebra floor, not their later
geometric applications.

Part III's affinoid complete-continuity condition agrees with
CompactOperators' `IsCompletelyContinuous`: over a noetherian affinoid,
containment in a finite submodule is equivalent to finitely generated image.
Use PFA's gauges, model spaces and countable-type APIs under those comparisons.
Part III retains the strict lattice condition, perturbation corollaries and
Kiehl applications; they do not create a second operator library.

Formal models, Raynaud's theorem, admissible blow-ups, dagger geometry,
eigenvariety gluing, automorphic forms and curve uniformisation are outside
this roadmap. The geometric contracts below fix the required scope rather
than inviting an independent implementation of those subjects.

## Conventions and foundations

1. Use `[NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]`.
   Characteristic zero, discrete valuation and spherical completeness are
   additional hypotheses only where stated. Put
   `√|K×| = {r>0 : ∃ n≥1, ∃ c∈K×, r^n=|c|}`.
2. `Tₙ=K⟨X₁,…,Xₙ⟩` is the shared native restricted-series algebra at unit
   polyradius. Use coefficient-preserving equivalences for alternative
   presentations. Distinguished-variable conventions must agree with the
   supplier's iteration map, including the choice of first or last variable.
3. `IsAffinoidAlgebra K A` is a proposition: there is a surjective algebra
   map `Tₙ→A`. It does not select a norm or a topology. Quotient Gauss norms
   give complete algebra norms; §1 proves independence of their topology.
   Equivalent norms need not be equal or isometric.
4. Classical points are `MaximalSpectrum A`. The value `|f(x)|` uses the
   unique extension of `|·|` to the finite residue field `A/x`; no embedding
   into a chosen algebraic closure enters its definition. Define
   `|f|sup = sup_x |f(x)|`, with value zero for the zero algebra. Prove
   boundedness before using a real supremum.
5. Use `TauCeti.Huber.powerBoundedSubring` for `A°`, its native
   `topologicallyNilpotentIdeal` for `A°°`, and `Ã=A°/A°°`. Keep a presentation
   ring `A₀=π(Tₙ°)` separate from `A°`.
   Nilpotents remain in all algebra and sheaf carriers. Reduced affinoids
   are uniform; nonreduced affinoids use strong noetherianness for sheafiness.
6. Rational fractions are `A⟨f/g⟩=A⟨T⟩/(gTᵢ−fᵢ)` with `(g,f₁,…,fₘ)=A`.
   Rational domains require `|g(x)|≠0` and `|fᵢ(x)|≤|g(x)|`.
   All localisation and tensor comparisons commute with structure maps.
7. Use native `Ideal`, `Submodule`, `Module.Finite`, `Module.Projective`,
   tensor products, continuous linear maps, schemes, sites, sheaves and
   sheaf cohomology. An arbitrary module has an algebraic Čech complex;
   Banach topologies and strictness are asserted for finite modules.
8. Classical points and adic points are different carriers. The comparison
   preserves rational traces and ringed sites, not all underlying points.
   In particular, a higher-rank condition `v(T)<1` is not by itself a
   description of the adic image of the rigid open unit disc.

Mathlib supplies restricted-series predicates and Gauss norms, polynomial
and fraction-ring algebra, noetherian and Jacobson rings, maximal spectra,
normed quotients, finite-dimensional topology and categorical sites/sheaves.
The series, functional-analysis and adic suppliers extend this floor. The geometric
objects assigned here are construction targets on native sheaf and site
carriers, not opaque constants or structures with the desired theorems as fields.
Suggested homes are `TauCeti/RingTheory/Affinoid/` for the algebra and
`TauCeti/AlgebraicGeometry/Rigid/` for rigid spaces and comparisons, with
general G-site lemmas under `TauCeti/Topology/GTopology/`, sharing the adic
geometry's carriers. Production modules import proved mathematics, never a
roadmap's `Suggested.lean`.

### Existing library interfaces

The prototype uses Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`. Import
`TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic`: the native restricted
subring already has its coefficient algebra, Gauss norm and completeness.
Use `MvPowerSeries.norm_eq_gaussNorm`, `NormMulClass` and the native
coefficient embedding rather than defining another normed Tate algebra.
`pointNorm` uses Mathlib's `spectralNorm` on the actual maximal-ideal quotient.

Follow Mathlib's [restricted-series carrier #42867](https://github.com/leanprover-community/mathlib4/pull/42867)
and [Gauss-norm API #42871](https://github.com/leanprover-community/mathlib4/pull/42871).
For boundedness, Huber rings and `Spa`, use the native Tau Ceti interfaces
and the comparisons directed by [#40013](https://github.com/leanprover-community/mathlib4/pull/40013),
[#42312](https://github.com/leanprover-community/mathlib4/pull/42312),
[#38009](https://github.com/leanprover-community/mathlib4/pull/38009) and
[#42315](https://github.com/leanprover-community/mathlib4/pull/42315).
Valuations are considered up to equivalence; a chosen representative is not
a replacement for `Spv`. Missing results are required in Tau Ceti in these
interfaces, independently of the timing of the Mathlib proposals.

## Layer 0: shared Tate inputs and weak stability

### 0.1 The imported Tate package

Use RestrictedPowerSeries §§2.4 and 5 for the complete multiplicative Gauss
norm, polynomial density, coefficient reduction `T̃ₙ≃K̃[X₁,…,Xₙ]`, bounded
evaluation and substitution, maximum modulus at a finite-residue-field point,
and the Zariski-dense maximum locus of a nonzero Tate series. Its Weierstrass
polynomials are monic of Gauss norm one; nonleading coefficients may have
norm one. Consume division, preparation, simultaneous distinguished charts
and the finite free quotient on `1,X,…,X^(s−1)` for degree `s`.

The same supplier owns noetherianity, factoriality, integral closedness,
the Jacobson property, `dim Tₙ=n`, finite maximal residue fields, polynomial
generation of maximal ideals, nearest-point results for Tate ideals and
strictness for finite Tate modules. The last property is specific input;
nearest points are not assumed to exist in every Banach subspace.

**Checks.** Transport constants, variables, products and coefficients through
the carrier comparison. Over `ℚ_p`, `p+T²` has maximum one at `T=1`, whereas
its value at zero is `|p|`; the reduction of `p+T+pT²` is `T`. For `n=0`
recover `K`, including its norm and residue field.

### 0.2 Weak stability and finite normalisation

Develop the valued-field weak-stability and weakly Cartesian finite-extension
API of [BGR] §§3.5.1–3.5.3: the bounded-functional criterion, the complete
and perfect cases, and the comparison of finite-extension norms. Coordinate
the complete countable-type Banach-space results with PFA §2.4. The
bounded-functional separation and weakly Cartesian results for the possibly
incomplete Gauss fraction field are targets here, following [BGR] 2.3.2/7
and §§3.5.1–3.5.3; they are not obtained by dropping the completeness
hypothesis of a Banach-space theorem.

Equip `Frac(Tₙ)` with the extended Gauss norm and prove it weakly stable
in every characteristic, using [BGR] 5.3.1/1 and 3.5.3/1–2. Apply the
Japanese-ring criteria of SchemeAndStackFoundations to prove that the integral
closure of `Tₙ` in every finite extension of its fraction field is finite.
The inseparable step uses [BGR] 4.1/3–4 and 4.4/2 and is part of the theorem.
Neither separability nor a discrete valuation may replace that step.

**Checks.** The zero-variable case agrees with finite extensions of `K`.
Test both a separable extension and a characteristic-`p` purely inseparable
extension. Keep the normed fraction field distinct from its completion;
completeness of `Tₙ` does not imply completeness of `Frac(Tₙ)`.

## Layer 1: affinoid algebras and their topology

### 1.1 Presentations and complete topology

Construct quotient norms, prove noetherianity and the Jacobson property,
closedness of ideals and closure under quotients and finite algebra
extensions. Construct `A⟨X⟩` from the shared relative-series interface,
with iteration and the continuous universal property for power-bounded
variable images. Surjections induce the expected quotient topologies.

Prove automatic continuity of algebra maps from a noetherian Banach
`K`-algebra to an affinoid by the closed-graph argument of [BGR] 3.7.5 and
6.1.3. Its algebraic inputs include finite-dimensionality of `A/𝔪^n` for
`n≥1` and
`⋂_{𝔪 maximal} ⋂_{n≥1} 𝔪^n=0`.
This is not the assertion `⋂_n 𝔪^n=0` for each fixed maximal ideal in an
arbitrary nonlocal ring. Deduce independence of presentation, equivalence
of complete algebra norms, and invariance of boundedness and integral
elements. Supply contractive renorming for an affinoid homomorphism.

Use the finite-module topology from PFA to prove
`isClosedEmbedding_of_finite_injective`: every finite injective affinoid
algebra map, equipped with complete algebra norms, is a closed topological
embedding. Continuity is a conclusion. Norm-one equality is not.

**Checks.** Quotient by zero and by the unit ideal; dual numbers; an
equivalent but differently scaled module norm. In `K×K`, powers of a fixed
maximal ideal have nonzero intersection, while the intersection over both
maximal ideals is zero.

### 1.2 Normalisation, points and dimension

For `A≠0`, construct a finite injective map `T_d→A` using distinguished
charts, and prove `d=dim A`. Establish finiteness in towers and the
torsion-free consequences when the target is a domain. Quotients by ideals
with maximal radical are finite-dimensional over `K`. Maximal ideals
contract to maximal ideals under affinoid algebra maps, and every maximal
residue field is finite. Deduce that affinoid domains are Japanese from §0.2.

For an affinoid **domain**, prove
`height_eq_ringKrullDim_of_isDomain`: every maximal ideal has height
`dim A` ([Conrad], Lemma 2.1.5). For general affinoids give the corresponding
componentwise statements, without asserting that all components have the
same dimension.

**Checks.** The cusp `K⟨X,Y⟩/(Y²−X³)` is finite over `K⟨X⟩` and has
dimension one. `(T²−p)` in `ℚ_p⟨T⟩` has quadratic residue field and
`|T(x)|=p^(−1/2)`. In `K⟨T⟩×K`, the maximal ideal `K⟨T⟩×0` has height
zero although the ring has dimension one. The zero algebra has no
normalisation injection from a Tate algebra.

Prove excellence of affinoid algebras in every characteristic, using the
shared excellent-ring criteria and [Conrad] §1.1's regularity arguments.
The supporting targets are regularity of Tate algebras, universal catenarity,
a nonempty regular locus in every affinoid domain, and geometrically regular
formal fibres at maximal ideals. Include the differential-rank regularity
criterion of [Conrad] Theorem 1.1.1 used in positive characteristic; finite
imperfection degree is not assumed. General excellent-ring permanence
stays in SchemeAndStackFoundations.

### 1.3 Tensor products and complete field extension

For `B=A⟨X⟩/I`, `C=A⟨Y⟩/J`, identify the affinoid pushout with
`A⟨X,Y⟩/(I,J)`. Prove its continuous universal property, presentation
independence, density of the algebraic tensor image and preservation of
surjections. Compare this construction with Part II R0.3's completed tensor
product. Density alone is not the completion theorem.

**Supplier contract: Part III R3.6, *affinoid-completed-field-extension*.**
Transport its algebraic theorem through the presentation comparison above.
For a complete isometric extension `L/K`, set `A_L=A⊗̂_K L`. Identify
it as affinoid over `L`, identify `Tₙ(K)_L` with `Tₙ(L)`, and transport
the faithful flatness of `A→A_L`. For finite `A`-modules with their
canonical topologies supply the topological `A_L`-linear isomorphism

`A_L ⊗_A M ≃ M ⊗̂_K L`,

sending `(a⊗l)⊗m` to `(am)⊗l` on elementary tensors. The left tensor is
algebraic and finite, with its finite-module topology. The right uses the
shared nonarchimedean completed tensor. State naturality and compatibility
with exact sequences and repeated field extension. No algebraicity or
spherical completeness of `L/K` is assumed. For finite `L/K`, compare to
the algebraic tensor model with its complete finite-module topology.

**Checks.** `M=A`, `L=K`, zero modules and
`A=K⟨T⟩, M=A/(T)`, where both sides are `L`. Source: [BGR] 6.1.1 and
[Conrad], Lemma 1.1.5; tensor construction from Part II R0.3, *completed-tensor-banach-module*.

### 1.4 Fraction algebras

Construct Weierstrass and Laurent fractions and their iterated
presentations. For rational fractions prove invertibility of `g`, the
power-bounded ratios, the continuous universal property and density of
`A[g⁻¹]`. Construct the appropriate quotient seminorm on that localisation
and identify its separated completion with `A⟨f/g⟩`. Identify it naturally
with the shared adic rational localisation. Specify the compared norms
before asserting an isometry. Sources: [BGR] 6.1.4–6.1.5, 7.2; Part II R0.3.

**Checks.** One-variable Weierstrass and Laurent presentations; denominator
one; the zero algebra. Without `(g,f)=A`, taking all entries zero does not
invert the denominator. Verify compatibility with restrictions and iterated
rational localisations, not just an abstract algebra equivalence.

### 1.5 Strictness of arbitrary positive polyradii

For `ρᵢ>0`, consume the weighted Tate algebra, its multiplicative norm and
the finite monomial extension of RestrictedPowerSeries §5.4. Prove

`T_{n,ρ} is strictly K-affinoid ↔ ∀ i, ρᵢ∈√|K×|`.

The forward construction uses powers of variables scaled to norm one; the
converse uses automatic continuity and the affinoid value-group theorem
of §2.2. In the strict case identify the weighted Gauss and supremum norms.
This is the interface for Part IV F1.1, not a replacement of the broader
non-strict affinoid terminology. Source: [BGR] 6.1.5.

**Checks.** Radius `p^(−1/2)` over `ℚ_p`, a positive radius outside
`p^ℚ`, and zero variables. A function on an open disc is not in general a
restricted series on its closed boundary; test `Σ T^n`.

## Layer 2: supremum seminorm, reduction and integral models

### 2.1 Pointwise and spectral descriptions

Construct evaluation norms using finite residue fields and prove boundedness,
ultrametricity, scalar compatibility and submultiplicativity of `|·|sup`.
Prove `|f^n|sup=|f|sup^n` for `n≥1`, including the zero algebra. Exponent
zero requires a nonzero algebra. Identify the kernel with the nilradical,
and the seminorm with the maximum of its values on the finitely many
minimal-prime quotients. It is unchanged by reduction.

Algebra homomorphisms contract these seminorms; integral injective ones
preserve them. For a monic equation
`f^d+Σ_{i<d} aᵢf^i=0`, `d>0`, prove the bound by
`max_{i<d}|aᵢ|sup^(1/(d−i))`. Retain the equality for a minimal monic
equation for an integral torsion-free algebra monomorphism from an
integrally closed domain, as in [BGR] 3.8.1/7, including a non-domain
target. For the general algebraic formulation use the finite-residue-field
maximal points and explicit boundedness hypotheses of that section.
For an integral affinoid map, construct an equation attaining the spectral
value as in [BGR] 6.2.2/4; its scope is not restricted to a chosen finite
presentation of the map.

### 2.2 Maximum modulus and Banach function algebras

For `A≠0`, every `|f|sup` is attained at a classical point. Prove the
value-group assertion uniformly: some `m≥1`, depending only on `A`,
satisfies `|f|sup^m∈|K|` for every `f`. In particular, if `|f|sup>0`
there is `c∈K×` with `|cf^m|sup=1`. Use normalisation and minimal primes,
without presupposing a geometric category.

Prove `A°={f:|f|sup≤1}`, `A°°={f:|f|sup<1}` and the pointwise version
of the latter. Prove the integral-equation criterion for a residue norm
and the spectral-radius identity
`|f|sup=inf_{n≥1}‖f^n‖^(1/n)`, agreeing with the shared smoothing API.
For every reduced affinoid and complete algebra norm prove
`|f|sup≤‖f‖≤C|f|sup`, for some `C>0`.
Construct the complete supremum-norm model and its continuous algebra
equivalence with the original model. Include [BGR] 3.8.3/7: if `B→A`
is finite, injective and torsion-free, `A` is a reduced Banach algebra,
and `B` is a valued integrally closed noetherian Banach algebra with
weakly stable fraction field, then `A` is a Banach function algebra.
Identify its supremum norm with the spectral norm on
`A⊗_B Frac(B)`, a finite product of fields. The domain special case alone
is insufficient. The field characteristic
is arbitrary, using §0.2. Deduce uniformity and automatic continuity from
an arbitrary Banach `K`-algebra into a reduced affinoid.

For nonzero `A`, the supremum seminorm is a multiplicative **norm** precisely
when `A` is reduced and `Ã` is a domain. A reduced domain by itself does
not suffice. Sources: [BGR] 3.8, 6.2.1–6.2.4; general spectral comparisons
from Part II R0.4.

**Checks.** A nonzero nilpotent in `K⟨T⟩/(T²)` has supremum zero. For
`0<|c|<1`, prove that the annulus algebra `K⟨X,Y⟩/(XY−c)` is a domain
and has `|X|sup=|Y|sup=1`, `|XY|sup=|c|`. The domain assertion and norm
computations are separate checks. On `K×K`, the maximum locus of `(1,0)`
is not Zariski dense; do not extend the Tate maximum-locus theorem to every
affinoid. Check the zero algebra separately in every power formula.

### 2.3 Reduction functor and presentation rings

Construct `φ̃:Ã→B̃`, with identity and composition laws. Prove the kernel
and radical statements of [BGR] 6.3.1/4–5, and 6.3.1/6: for reduced
source, injective strictness, supremum isometry and injectivity on reductions
are equivalent. Here strictness means that the map from the quotient by
the kernel to its image is a homeomorphism, using the induced topology
on the image. Supremum isometry is a consequence, not a claim that the
original presentation norms are equal. Include examples where a
surjective affinoid map does not induce a surjection on reductions.

For a presentation ring `A₀=π(Tₙ°)`, prove
`A°={a∈A : a is integral over A₀}` including nonreduced algebras.
No finiteness of `A°` as an `A₀`-module is asserted. A finite affinoid
map induces a finite map on canonical reductions; deduce that `Ã` is a
finite-type `K̃`-algebra. Sources: [BGR] 6.3.1, 6.3.4–6.3.5.

**Supplier contract: Part III R3.6, *almost-noetherian-integral-affinoid-modules*.**
Identify its integral presentation with `A₀=π(Tₙ°)`, preserving the image of
the Gauss unit ball; transport the following theorem. If `M` is finite over
`A₀`, `N⊆M` is any
submodule and `0<ε<1`, prove that a finitely generated `N'⊆N` exists
such that `cN⊆N'` for **every** `c∈K` with `|c|≤ε`. One `N'` works
for all these scalars. For discretely valued `K`, deduce that finite
`A₀`-modules are noetherian. Source: [Kiehl-E] §5, Satz 5.1.

**Reduced quotient of a ring of definition.** For an open bounded subring `B⊆A`
and `ϖ∈B` which is a topologically nilpotent unit of `A`, if `B/ϖB`
is reduced, identify `B=A°={f:|f|sup≤1}`. The element `ϖ` need not be
a scalar. Prove the affinoid statement using [FK] B.1.3(1)'s boundedness argument,
then §2.2's supremum identification. Part II R0.9 consumes this theorem;
do not invoke that consumer to prove it. The sufficient hypothesis is
not asserted to be necessary.

**Checks.** `T₀` gives `A₀=K°`; `ℤ_p⟨T⟩/p=𝔽_p[T]` gives the
positive reduced-quotient example. In `A=ℚ_p⟨T,S⟩/(S²−p²T)`, let `B`
be the image of the integral Tate algebra: `S/p` is power-bounded but not
in `B`, and `B/pB` is nonreduced. Conversely, `ℤ_p/p²` and
`𝒪_{ℂ_p}/p` are nonreduced although their original rings are the
power-bounded rings. The maximal ideal of `𝒪_{ℂ_p}` is not finitely
generated; choosing `ε<|x|<1` makes `x𝒪_{ℂ_p}` the required finite
submodule. This tests almost noetherianity without asserting noetherianity.

## Layers 3–4: affinoid spaces and subdomains

Construct classical `Sp A`, its rational basis and structure presheaf
from §§1–2; Layer 5 proves the sheaf condition. These are the classical
inputs consumed by Part II R0.9 and R1. Construct closed subspaces,
components, finite morphisms and affinoid fibre products. Identify classical points with maximal ideals, sections
with `A`, and algebraic tensors from §1.3 with fibre-product coordinates.
Retain nonreduced structure sheaves.

An affinoid subdomain includes its representing algebra, map and universal
property. Prove uniqueness with its structure map, transitivity, intersections
and inverse images. Identify rational, Laurent and Weierstrass subdomains
with §1.4; restrictions are flat. Gerritzen–Grauert supplies finite rational
decompositions and the ambient-cover refinement used in descent. Include
open, closed and locally closed immersions and the local-ring comparison
`A_𝔪/𝔪^n ≃ 𝒪_{Sp A,x}/𝔪_x^n` and its completion, for every `n`.
The germ map is local and faithfully flat after localisation. Prove
excellence of the analytic local rings ([Conrad], Theorem 1.1.3), using
§1.2's affinoid theorem. Construct these stalks after Layer 5 establishes
the sheaf condition.

For a domain `A`, restriction to a nonempty affinoid subdomain is injective.
For a finite affinoid cover `Uᵢ`, `A→∏ᵢ𝒪(Uᵢ)` is faithfully flat.
Prove reducedness is local for a rational cover: `A` is reduced iff every
member algebra is reduced. The reverse implication uses faithful flatness;
the forward implication uses the affinoid-localisation theorem, not just
flatness of an arbitrary ring map. This supplies Part IV R5.7.

**Checks.** Empty subdomains and zero rings, with an empty cover only of
`Sp 0`; a rational cover of the unit disc; products with a nilpotent
thickening. For a tuple `(g₀,…,gₘ)` generating the unit ideal, the standard rational
domains `{|gⱼ|≤|gᵢ|≠0 for every j}` cover; conversely such a cover forces
the unit-ideal condition by Jacobsonness. Arbitrary rational domains do
not cover merely because their denominators generate the unit ideal.
Sources: [BGR] Chapters 7–8; Part II consumes these subdomain interfaces.

## Layer 5: Čech comparison and acyclicity

Prove classical Tate acyclicity using the rational-localisation comparison
with foundational AdicSpaces and the affinoid-cover refinement of Layers 3–4.
Compare the finite-intersection algebras, restriction maps and augmented Čech
complexes. This supplies the classical acyclicity consumed by Parts II and III;
Part III's coherent-sheaf theorem is not a prerequisite. For the
two-piece Laurent cover use `d(u,v)=v|intersection−u|intersection`.
Transport Tate acyclicity and refinement through this chain map.

Retain augmented Čech exactness for **every algebraic `A`-module**, by
tensoring the bounded exact alternating Čech complex for `A` with the
module. Its terms are flat by affinoid-localisation flatness; bounded
exactness then makes this tensoring exact. Intersection algebras are
completed affinoid tensor products, not automatically ordinary algebraic
tensor products. For finite modules, supply the canonical Banach topologies
and strict exactness as a separate theorem. Construct the natural
Čech-to-derived-cohomology comparison for covers
whose finite intersections are acyclic, using native sheaf categories.
Apply it to Part III R3.1's finite-module sheaves. The general comparison
is independent of the quasi-Stein theorem which uses it. No arbitrary
module receives a fictitious Banach norm.

**Checks.** The Laurent sequence, a one-member identity cover, zero modules
and an infinitely generated direct sum of copies of `A`. Verify both the
augmentation and differential under the comparison. Exactness alone does
not certify closed images. Sources: [BGR] 8.2; [Kiehl-AB]; Part III R3.1.

## Layer 6: general G-topologies and rigid gluing

### 6.1 G-sites and sheaves

Develop admissible opens and covers with [BGR] 9.1's identity, restriction,
intersection and composition axioms, continuous maps, induced G-topologies,
bases and refinement. Construct their site on the preorder of admissible
opens and prove that the sheaf condition is precisely the admissible-cover
equaliser condition. Recover the ordinary open-set site of a topological
space. Prove the G0/G1/G2 completeness and enhancement results of §9.1.2,
including the universal property, and compatible pasting of §9.1.3.

Use Mathlib's sheaves and sheafification. Compare classical neighbourhood
stalks with site points, and BGR's plus construction with that sheafification.
Prove extension across a slightly finer G-topology by the dense-subsite
comparison, without constructing another category of sheaves.

### 6.2 The classical presentation of the common geometry

The weak affinoid basis uses finite affinoid covers; the strong topology is
detected by finite affinoid refinements after affinoid test maps. Prove
enhancement, restriction, admissibility of Zariski covers and the
idempotent/connectedness criterion. Construct the classical affinoid site
and structure sheaf used by Part II. General G-topology must be available below
both presentations, so this comparison does not define its own prerequisite.

Construct `RigidSpace K` as locally G-ringed spaces locally isomorphic to
these affinoids, with morphisms local on stalks. Prove the category laws,
the fully faithful contravariant affinoid-algebra embedding, admissible
restrictions, gluing and its universal property, and fibre products.
Construct affine and projective space, discs and annuli. Part II uses this
category and Layer 8's comparison; there is no second rigid carrier.
For quasi-separated rigid spaces, construct complete isometric field
extension using §1.3, compatibly with affinoid subdomains, gluing and
affinoid-coordinate faithful flatness. Carry the quasi-separated hypothesis
in these global base-extension statements.

**Checks.** The covering of the closed unit disc by its open disc and
unit circle is set-theoretic but not admissible. For `0<|ϖ|<1`, the
domains `|T|^n≤|ϖ|`, `n≥1`, give an admissible exhaustion of the open
disc: radii `|ϖ|^(1/n)` approach one even for discretely valued `K`.
Glue `ℙ¹` from two closed discs and identify the intersection annulus.

### 6.3 Relative compactness and properness

Define quasi-compact and quasi-separated morphisms by admissible affinoid
tests and finite covers, and separatedness by the diagonal closed immersion.
For an affinoid subdomain `U⊆Sp B` over `Sp A`, define `U⋐_A Sp B` by a
presentation `A⟨X₁,…,Xₙ⟩↠B` whose generator restrictions have supremum
norm `<1` on `U`. Prove equivalence with a single bound
`ε∈√|K×|`, `ε<1`, and the relative-polydisc closed-immersion criterion.
Establish restriction, separated-intersection, product and affinoid-base-change
laws. Finite affinoids are inner in themselves over the base.

Define Kiehl properness by separatedness and inner affinoid covers: over
each admissible affinoid of the base, the inverse image has two finite
affinoid covers `(Uᵢ)` and `(Vᵢ)` with `Vᵢ⋐Uᵢ`. Prove its local nature
on the base, composition and base-change laws, and properness of finite
morphisms. These classical predicates are supplied to Part II's properness
comparison and Part III's Kiehl theorems; adic properness is not their
definition. Sources: [Bosch] §6.3; [Kiehl-E] §2.

**Checks.** A smaller closed disc is inner in the unit disc, whereas the
unit disc is not inner in itself over `K`. A closed point is not an
affinoid open subdomain. For `ℙ¹`, the unit chart discs lie inside chart
discs of radius `|ϖ|⁻¹`; both pairs cover and exhibit properness. The pair
of unit discs used for gluing need not itself be an inner-cover pair.

## Layer 7: coherent sheaves and proper cohomology

### 7.1 Banach prerequisites for Kiehl's theorem

These are supplier contracts, not duplicate operator definitions. Banach
`A`-modules are also compatible Banach `K`-spaces; scalar towers and complete
ultrametric norms are explicit. For lattice statements choose a presentation
ring `A₀` and compatible norms/lattices. For Part III's closed-target and
restriction theorems, require the coefficient unit ball to be exactly the
image of the Gauss unit ball under that presentation and preserve this
condition in the norm comparisons. An arbitrary norm unit ball or `A°`
is not a substitute.

1. **PFA §§1.2 and 2.2; Part III R3.3 and R3.6:** use model-space
   quotients and bounded lifting; every Banach `A`-module is a continuous quotient
   of `c₀(I,A)` for some discrete index set, not necessarily countable.
   If `f:M→N` is surjective and continuous, there is `δ>0` such that
   `‖e‖<δ` implies `f−e` surjective. Deduce stability of a finite generating
   family under sufficiently small perturbations. This corollary is Part III
   R3.3's *surjection-small-perturbation*. Use bounded lifting and
   successive correction; an `A`-linear right inverse is not assumed.
2. **Part III R3.6, strict complete continuity:** for `u:M→N`, require a
   scalar `c`, `0<|c|≤1`, such that for every `ε>0` there is a continuous
   finite-image approximant `v`, `‖u−v‖<ε`, and finitely many vectors of
   the target unit ball whose `A₀`-span contains `c·v(M₀)`. The scalar is
   uniform; the finite family may change with `ε`. Prove independence under
   the allowed equivalent lattice models, implication to CompactOperators'
   complete continuity, and descent into a closed target submodule for
   source `c₀(I,A)`. No complemented-submodule hypothesis is added.
3. **Part III R3.6, Schwartz's theorem:** for affinoid `A`, surjective
   continuous `f` and completely continuous `g`, `f+g` has closed image
   and finite `A`-module cokernel. No finite-kernel conclusion is asserted.
4. **Part III R3.6, relatively compact restriction:** transport §6.3's
   classical inner relation through `rigidToAdic`. For finite `B`-module `M`, compose the
   actual restriction `M→𝒪(U)⊗_B M`, `m↦1⊗m`, with any continuous
   surjection `c₀(I,A)↠M`. This composite is strictly completely
   continuous over `A`. Use §2.3's almost noetherianity in the closed-target
   step; do not replace the restriction by an arbitrary map.

**Checks.** Zero, the identity on `K`, and the noncompact identity on
`c₀(ℕ,K)` distinguish the definitions. The map `h:Σa_nT^n↦Σa_nϖ^nT^n`
has truncation error at most `|ϖ|^N`, strict approximation with `c=1`,
and infinite-dimensional image; it fixes constants and has norm one.
`id−h` has image `T K⟨T⟩` and cokernel `K`. Descent to this closed
subspace is a required test. Taking `g=−id` violates Schwartz's compactness
hypothesis on an infinite model space. In `K²`, `(1,δ),(δ',1)` generate
when `|δ|,|δ'|<1`; for `f=e=id_K` the perturbation is not surjective,
so the permissible bound cannot exceed one. Sources: [Kiehl-E] §1,
Sätze 1.2 and 1.4, Lemma 1.3, §2; [Bosch] §§6.3–6.4.

### 7.2 Numerical slopes as a shared analysis interface

Supply `IsSlopeLE K r Q`, `IsSlopeDecomposition K U r M₁ M₂` and
`IsSlopeDecomposition.exists_projection`, the classical module-level
interfaces consumed by LAD §4.16. Use native polynomials, submodules,
continuous linear maps and finite projective modules. For `r>0`, the
affinoid root condition on `Q∈A[X]` is that every root
of `χ(Q)` has absolute value **at least** `r`, for every algebra map
`χ:A→L` with `L/K` algebraic, using the unique extended absolute value. Include
`r>0` in the predicate. For affinoid `A`, prove equivalence with testing
in finite extensions: include all finite residue fields and their finite
splitting extensions. A decomposition is continuously split and
operator-stable; its first summand is finite projective and annihilated
by a monic such `Q` with unit constant term. Every polynomial satisfying
the same conditions acts invertibly on the complementary summand. Its
continuous projector has the specified image and kernel and commutes with
the operator. Construct it from the continuous complementary-submodule
projection, independently of Fredholm theory. CompactOperators supplies
Riesz summands; LAD §4.16 proves the numerical comparison for a separated
Fredholm factor. Existence at every cutoff over an arbitrary affinoid
family is not asserted.

For `r=|p|^h` this means eigenvalue valuation `≤h`, including equality.
It concerns annihilator roots; the roots of `det(1−TU)` are reciprocals.
LAD §4.16 owns `slopeCriterion_classical_iff_geometric`, numerical
normalisation, functoriality and uniqueness, using §2's supremum theorem.
Its coefficient test for monic `Q=ΣaⱼXʲ` with unit `a₀` is
`|aⱼ/a₀|sup rʲ≤1` for every `j`; do not reprove that comparison here.
Sources: [Urban] §2.3; LAD §4.16; CompactOperators Layer 3.

**Checks.** For `c∈K×` and a finite projective Banach module, `c·id` with `|c|=r`
belongs wholly to the first summand; the zero operator has zero first
summand. For `0<|c|<1`, `X−c` fails the `r=1`
condition, whereas `1−cT` passes its root test. Actual polynomial
annihilation is required even over a nonreduced base; pointwise tests alone
cannot detect nilpotent endomorphisms.

### 7.3 Coherence, identity principle and quasi-Stein spaces

**Supplier contracts: Part III R3.2–R3.4.** Finite modules
and coherent sheaves on `Sp A` are equivalent via the associated-module
functor and global sections, compatibly with restriction, tensor products
and exact sequences. Include coherent ideals/closed subspaces, finite
algebras/finite morphisms and affinoid acyclicity.

**Classical identity principle (supplied to Part II R1.9).** On a connected
normal rigid space, any nonempty admissible open is
analytically Zariski dense. Restriction is injective for functions and
finite locally free sheaves. Do not assert this for arbitrary coherent
sheaves supported away from the open, or omit normality.

**Supplier contract: Part III R3.4.** A quasi-Stein exhaustion is countable,
increasing, admissible and affinoid,
with dense restrictions of coordinate rings. Prove density for coherent
sections, generation on each member by global sections and vanishing of
higher coherent cohomology. No relative-compactness condition or global
finite generating set is implicit. Include the relative version when
inverse images of affinoid opens are quasi-Stein. Sources: [Kiehl-AB];
[Conrad] §§1–2; Part III R3.4.

### 7.4 Proper mapping, strictness and base change

**Supplier contract: Part III R3.6.** For Kiehl-proper `f:X→Sp A` and
coherent `F`, prove `M^i=H^i(X,F)` finite over `A`, all higher direct
images coherent, and closed-range differentials for finite affinoid Čech
complexes computing this cohomology. Use the finite inner-cover definition
of properness, with its separatedness and base-change properties. Neither
smoothness nor reducedness is assumed.

For an affinoid subdomain `Sp B→Sp A` or a finite flat affinoid map,
prove the canonical base-change isomorphism
`B⊗_A M^i ≃ H^i(X_B,F_B)`. For every complete isometric `L/K`, prove
the same with `B=A_L`; compare its algebraic tensor with the completed
field tensor using §1.3. Maps are induced by pullback and scalar action
and commute with connecting homomorphisms. Arbitrary nonflat base change
does not follow. Source: [Kiehl-E] Satz 2.6, Satz 3.5 and §3;
Part III R3.6.

### 7.5 Principal filtrations and formal functions

For the same `f,F`, `a∈A`, and `i≥0`, let

`R_n=ker(M^i→H^i(X,F/a^nF))`, for `n≥0`.

Require `R_0=M^i`, decreasingness, `a^nM^i⊆R_n`,
`aR_n⊆R_(n+1)`, and equality in the last inclusion for all sufficiently
large `n`. Prove a uniform shift `d` with `R_(n+d)⊆a^nM^i` for every
`n`. Also prove a uniform shift `e` such that the transition

`H^i(X,F/a^(n+e)F)→H^i(X,F/a^nF)`

has image in the image of `M^i`. Thus both the kernel and cokernel systems
of `M^i/a^nM^i→H^i(X,F/a^nF)` are pro-zero; the two shifts need not
coincide. Include the transition maps, not just abstract isomorphic limits.
Source: [Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7.

For every ideal `J⊆A`, prove the canonical formal-functions isomorphism
`(M^i)^∧_J ≃ lim_n H^i(X,F/J^nF)`, with naturality. The general-ideal
argument is required and uses the noetherian filtration/Artin–Rees inputs;
it is not obtained by merely relabelling `a` as `J`. This is ideal-adic
completion, not Banach completion. The proof and its classical/adic forms
share Part III's cohomology implementation.

**Checks.** For `a=0`, `R_0=M^i` and `R_n=0` for `n≥1`; for `a=1`,
`R_n=M^i` and quotient cohomology is zero. For the identity of `Sp A` in
degree zero, `R_n=a^nM`. On `ℙ¹`, compute `H⁰(𝒪)=K`, `H¹(𝒪)=0`
and compare the Čech, sheaf and base-change maps.

## Layer 8: analytification and rigid–adic comparison

### 8.1 Analytification, local rings and components

Construct the classical rigid analytification consumed by Part II R1.
Construct absolute
analytification and relative analytification over `Sp A` for schemes
locally of finite type over `Spec A`. The latter schemes need not be
locally of finite type over `K`. Include the universal property, points,
fibre products, immersions and finite maps, with their canonical comparison
maps. Build relative affine charts using completed presentations and glue
them. The flat local comparison gives exact pullback; the coherent-sheaf
and proper GAGA comparisons are Part III R3.7's targets.

For a classical analytic point `x` over a closed point `x₀`, identify
the completed local rings, compatibly with their local map. Prove that
`𝒪_{X,x₀}` is reduced, respectively normal, iff `𝒪_{X^an,x}` is.
Use §1.2 and Layers 3–4 for affinoid and analytic excellence, the shared
permanence theorems for finite-type schemes over affinoids, and the
completion criteria; normal here means an integrally closed local
domain. Deduce the global equivalences for reducedness and normality.
Also retain connectedness and irreducible-component comparisons, with
components carrying their reduced induced structures. Sources: [Conrad]
§1 and Appendix A; SchemeAndStackFoundations' excellence input.

**Checks.** The affine line at zero and the dual-number thickening. Over
a field of characteristic different from two, the origin on
`y²=x²(x+1)` has an algebraic local domain but an analytic germ with two
branches, using a convergent square root of `1+x` on a small disc.
Local integrality is therefore not an additional equivalence. Completion
isomorphisms do not alone justify a local-domain assertion.

### 8.2 Classical points and constructible density

Construct `Max A→Spa(A,A°)`, prove injectivity, and identify rational
traces and their coordinate rings. In `Spv A`, let `L_A` consist of the
valuations at most one on `A°` and strictly less than one on `A°°`.
Prove its equality with the constructible closure of the classical points;
deduce their constructible density in `Spa(A,A°)`. Constructible subsets
are determined by their classical traces. Prove the finite rational-cover
criterion through this comparison. Sources: [Huber-CV] Theorem 4.1,
Corollary 4.2; Part II R1.7's classical-point contract.

**Checks.** Classical points of the disc, the nonclassical Gauss point,
and `|T|≤|ϖ|`. A rank-two point just below the Gauss point can have
`v(T)<1` but `v(T)^n>|ϖ|` for every `n≥1`; it is outside the adic
open `⋃_n{|T|^n≤|ϖ|}` corresponding to the rigid open disc. Its
singleton is proconstructible, not constructible: density does not say
arbitrary subsets are determined by classical points.

### 8.3 The image of the rigid–adic functor

Construct the shared functor `r(Sp A)=Spa(A,A°)` and prove compatibility with
gluing, products, the structure sheaf and its ringed topos. It is fully
faithful on rigid spaces. Adic spaces locally of finite type over
`Spa(K,K°)` are locally images of affinoids. Restricted to quasi-separated
objects, `r` is an equivalence with quasi-separated adic spaces locally of
finite type. Prove `r(X)` affinoid iff `X` affinoid. Source: [Huber-FR]
Proposition 4.5; Part II R1.7.

**Checks.** Two rigid closed discs glued along the rigid open disc give
a non-quasi-separated example: in its adic image the two rank-two boundary
points from §8.2 remain distinct. Over algebraically closed `K`, also
construct the example of two adic discs glued along the complement
of the closure of the Gauss point; it is locally of finite type but is
not in the global image. These distinguish local image, full faithfulness
and essential surjectivity. Check the affinoid case and empty space.

Part II owns the further separatedness, properness and partial-properness
comparisons with its adic morphism classes, using §6.3's classical notions
and `r`. Consume its converses with their discrete-valuation hypotheses
and its separately stated locally quasi-finite exception; do not infer
an unqualified converse from the forward comparison.

### 8.4 Proper GAGA

**Supplier contract: Part III R3.7.** For a scheme proper over an
affinoid base, require the exact tensor-compatible equivalence of coherent
sheaves under analytification and the canonical `A`-linear cohomology
comparison in every degree. Include compatibility of higher direct images
with analytification for a proper morphism, even if the target is not
proper. Degree-zero maps are pullback/adjunction maps and the higher ones
extend them functorially.

**Checks.** `ℙ¹`, its line bundles and finite schemes including nilpotent
thickenings. Nonproper affine-line analytification has nonpolynomial global
functions and does not satisfy an unrestricted GAGA statement. Étale and
pro-étale comparisons are owned by Part IV and AdicEtaleGeometry; this
roadmap asserts no additional equivalence of those topoi.

## Dependency order and completion

1. Import the shared Tate and Banach foundations; prove characteristic-free
   weak stability and its Japanese application.
2. Prove affinoid normalisation and topology independently of geometry,
   then supremum and integral theory. The polyradius converse follows
   the value-group theorem; it is not needed to prove that theorem.
3. Compare the algebra with Part II's carriers, localisations, tensors
   and spectral data. General G-site theory is independent of this step.
4. Construct classical subdomains, Tate acyclicity, the G-site and rigid
   category, then rigid analytification and the rigid–adic functor. Use
   foundational adic results, not Part II's consumers of these classical
   constructions. Establish the classical properness predicates.
5. Transport Part III's coherent, quasi-Stein, proper-cohomology and GAGA
   results through the ringed-site equivalence. Prove the elementary
   numerical decomposition and projection of §7.2 independently; LAD then
   supplies the geometric and Fredholm-window comparisons.

Completion requires all stated generalities, all canonical-map compatibility
theorems and every check above. There must be one production definition of
each shared series, operator, tensor and geometric object. Compile the
actual modules and audit the transitive axioms of their capstone theorems;
only `propext`, `Classical.choice` and `Quot.sound` are accepted. An
elaborating roadmap prototype is not a proof or an implementation milestone.

## References

- **[BGR]** S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*,
  Springer, 1984. Sections 3.5–3.8 and Chapters 4–9; locators above use
  the book's section/statement numbering.
- **[Bosch]** S. Bosch, *Lectures on Formal and Rigid Geometry*, LNM 2105,
  2014, especially §§6.3–6.4 for relative compactness and Kiehl's theorem.
  [Author text](https://www.math.purdue.edu/~tongliu/seminar/rigid/Bosch.pdf).
  These are the published numbering, not the 2008 preprint's numbering.
- **[Kiehl-AB]** R. Kiehl, *Theorem A und Theorem B in der
  nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967), 256–273.
  [Journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002).
- **[Kiehl-E]** R. Kiehl, *Der Endlichkeitssatz für eigentliche Abbildungen
  in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967),
  191–214. [Journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002).
- **[Conrad]** B. Conrad, *Irreducible components of rigid spaces*,
  Ann. Inst. Fourier 49 (1999), 473–541, especially Lemma 1.1.5,
  Lemma 2.1.5 and Appendix A.
  [Author text](https://virtualmath1.stanford.edu/~conrad/papers/irredpaper.pdf).
- **[Huber-CV]** R. Huber, *Continuous valuations*, Math. Z. 212 (1993),
  455–477, §4.
  [Paper](https://virtualmath1.stanford.edu/~conrad/Perfseminar/refs/Hubercontval.pdf).
- **[Huber-FR]** R. Huber, *A generalization of formal schemes and rigid
  analytic varieties*, Math. Z. 217 (1994), 513–551, §4.
  [Paper](https://virtualmath1.stanford.edu/~conrad/Perfseminar/refs/Huberformalrigid.pdf).
- **[FK]** K. Fujiwara, F. Kato, *Foundations of Rigid Geometry I*,
  Appendix B, Proposition B.1.3(1).
  [arXiv:1308.4734](https://arxiv.org/abs/1308.4734).

- **[Urban]** E. Urban, *Eigenvarieties for reductive groups*, Ann. of Math.
  174 (2011), 1685–1784, §2.3: slope decompositions and polynomial tests.
  [Journal article](https://doi.org/10.4007/annals.2011.174.3.7).

## Existing Lean work

The [WilliamCoram/PhD sources][PhDSources], pinned to
`eefb3d91f34b27d0bc7822140fa85fecae029884`, are secondary implementation
references, not the specification or build dependencies. Coordinate
integration with the author and audit hypotheses and transitive axioms;
a stronger target is not discharged by a narrower source theorem.

| Source under `PhD/TauCeti/Code/RigidAnalyticGeometry/` | Interface to compare |
| --- | --- |
| `WeaklyStable.lean`, `Japanese.lean` | Valued fraction fields and finite normalisation in §0.2; retain positive characteristic |
| `Affinoid/{Basic,Continuity,Noether,Fractions,Tensor,BaseChange,Extend}.lean` | Presentations, topology, normalisation and tensor comparisons |
| `SupSeminorm/`, `Affinoid/{SupSeminorm,FunctionAlgebra,PowerBounded}.lean` | Spectral values and Banach function algebras, including reduced non-domains |
| `Affinoid/{Reduction,ReductionFunctor}.lean` | Presentation integrality and canonical reduction maps |
| `Restricted/`, `TateAlgebra/` | Shared-series provenance owned by RestrictedPowerSeries |

[RestrictedPowerSeries]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md
[PadicFunctionalAnalysis]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/f255de3d9ad6c27bc603f65e604108ee024c4400/TauCetiRoadmap/PadicFunctionalAnalysis/README.md
[CompactOperators]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/3c499bc3f1ba7ce2a6dcd255950c63c248964b22/TauCetiRoadmap/CompactOperators/README.md
[PhDSources]: https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884
