# Variational methods: weak minima, energy forms, and constrained spectra

Build reusable variational connectors between Banach-space compactness, quadratic
energy minimization, and operators on a Hilbert space. The main outputs are a
correct direct method on bounded minimizing sequences, Euler–Lagrange equations
with real and complex conventions, and successive Rayleigh minimization for a
compactly embedded form domain. Include the complete basic API for admissible
sets, energies, form restrictions, minimizers, spectra, and finite-dimensional
approximations.

The motivating example is a first-order elliptic operator on a compact manifold:
its energy is continuous on H¹, its unit constraint is measured in L², and an
elliptic estimate bounds minimizing sequences in H¹. These three spaces and
maps must remain distinct in every theorem.

## Conventions and suppliers

* Scalars are ℝ or ℂ, expressed by `[RCLike 𝕜]` where appropriate. Mathlib's
  inner product is conjugate linear in its first variable. Write a bounded
  Hermitian form as `a : V →L⋆[𝕜] V →L[𝕜] 𝕜`, with
  `a u v = star (a v u)`, and `q(u) = RCLike.re (a u u)`.
  Thus a represented operator satisfies `a u v = inner 𝕜 (A (j u)) (j v)`.
  Derivatives of real-valued energies on a complex space are real Fréchet
  derivatives on its restriction of scalars, never complex derivatives.
* V and H are complete Hilbert spaces. A form-domain inclusion is a native
  continuous linear map `j : V →L[𝕜] H` with injective, dense range. It need
  not be a topological embedding. Compactness means `IsCompactOperator j`.
  A lower bound is specified quantitatively:
  `c * ‖u‖² ≤ q(u) + ω * ‖j u‖²`, where `0 < c` and `ω : ℝ`.
  Shifts use `a_α(u,v)=a(u,v)+α inner 𝕜 (j u) (j v)`, with `α ≥ ω`.
  Its diagonal is coercive and defines a Hilbert norm equivalent to V's norm.
* Banach weak topology uses Mathlib `WeakSpace`, `toWeakSpace`, continuous
  duals and `NormedSpace.inclusionInDoubleDual`. Reflexivity here means
  surjectivity of this **continuous** bidual inclusion; algebraic
  `Module.IsReflexive` is a different notion. [BanachSpaceTheory B1–B2](../BanachSpaceTheory/README.md)
  supplies reflexivity, Eberlein–Šmulian, bounded weak compactness, Mazur,
  Goldstine, and general separation. This roadmap supplies their variational
  applications and bounded-set adapters, rather than another reflexivity theory.
* [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md)
  supplies generic compact-operator approximation and singular values.
  [SelfAdjointSpectralTheory Parts C–E](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  supplies native `LinearPMap` graphs, adjoints, self-adjointness criteria,
  resolvents with the `zI-A` convention, and (over ℂ) spectral measures. Its general
  functional calculus is consumed here; a second spectral-measure carrier is
  not required.
* [UnboundedOperators UO-D06](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/unbounded-operators/TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md#uo-d06--closed-forms-and-the-friedrichs-extension)
  owns the general closed semibounded-form representation and Friedrichs extension,
  using V2.3's coercive adapter without a compactness premise. V5.1 consumes
  that representation, identifies its operator on each compact form pair,
  and proves the compact-resolvent and ordered-eigenbasis comparisons here.
  The order is V2.3 → UO-D06 → V5.1 → V5.2; UO-D06 consumes no V5 target.
* [PDE Lane D, items 16–19, and Lane E](../PDE/README.md) own bounded-domain
  elliptic forms, boundary conditions, Lax–Milgram applications, and regularity,
  consuming V1–V5's abstract variational and operator results, including V5.3's
  abstract restricted-adjoint-product adapter where needed. Lane D/E retains its
  bounded-domain and boundary-regularity constructions. V5.3's separate compact
  boundaryless geometric specialization consumes the CKG/PDO inputs below; those
  applications are not prerequisites for the abstract variational construction.
  [ComplexKahlerGeometry K5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8b03be51f4642eef1442c7ccbe611e71151836a7/TauCetiRoadmap/ComplexKahlerGeometry/README.md) owns compact
  bundle Hˢ/L²/distribution carriers, localization, Rellich, and geometric Hodge
  theory, and the generic nonnegative Laplace-system self-adjoint H²
  realization, compact resolvent and smooth eigenbasis, consuming V2–V5.2's
  abstract form-represented operator and spectral theory.
  [PseudodifferentialOperators P5–P7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/063cf517a1dcc4d929e0602c6e6f585953aceab8/TauCetiRoadmap/PseudodifferentialOperators/README.md)
  own general elliptic estimates, positive higher-order elliptic realizations
  and powers, consuming K5a's realization for `1+∇*∇`. These supply the geometric inputs here;
  V5.3 owns the actual comparison of the represented energy operator with
  those specified realizations and the rectangular first-order adapter.

## Existing declarations to consume

Use the following native weak-topology, form-solution and operator interfaces.

* Mathlib `Analysis/LocallyConvex/WeakSpace` proves
  `Convex.toWeakSpace_closure` and `toWeakSpace_closedConvexHull_eq`.
  Closed convex sets therefore already have the required norm/weak closure
  comparison. `Topology/Semicontinuity/Basic` proves
  `LowerSemicontinuousOn.exists_isMinOn` on a nonempty compact set.
  `Analysis/Normed/Module/DoubleDual` supplies the continuous bidual inclusion
  and its weak-topology embedding. Native
  `NormedSpace.isCompact_closure_of_isBounded` already gives compact weak closure
  of a norm-bounded set when the weak-star bidual closure lies in the inclusion
  range; surjectivity makes that range condition automatic. Use this for the
  topological direct method and bounded spheres/sublevels. B2 supplies ES for
  the source's sequential proof, rather than a prerequisite for that native
  topological compactness route.
* Mathlib `Analysis/InnerProductSpace/Rayleigh` has scale invariance,
  bounded symmetric-operator extremum/eigenvector results, and finite-dimensional
  extrema. They do not identify an unbounded elliptic operator with a bounded
  operator on its stronger form domain.
* Tau Ceti `Analysis/InnerProductSpace/Variational/Spectrum` already builds,
  for a **real coercive** bilinear form B and a continuous map J,
  `IsCoercive.formSolutionMap`, `formSolutionOperator`,
  `apply_formSolutionMap`, `eq_formSolutionMap`,
  `isCompactOperator_formSolutionOperator`,
  `isSymmetric_formSolutionOperator`, `ker_formSolutionOperator`,
  `hasEigenvalue_formSolutionOperator_iff`, and
  `exists_hilbertBasis_forall_apply_eq_smul_inner` for compact dense J.
  Its kernel is `(range J)ᗮ`; density is essential to discard its zero eigenspace.
* Tau Ceti `Variational/Rayleigh` proves
  `IsCoercive.isLeast_rayleighQuotient` when J is compact and nonzero,
  with a symmetric form, and
  `isGreatest_inv_norm_formSolutionOperator` even without compactness.
  `Variational/Fredholm` gives `formPerturbationOperator`, its compactness,
  finite-dimensional homogeneous kernel and `fredholmAlternative_formPerturbation`.
  Consume these declarations in the real coercive specializations below.
  Build the semibounded-shift, complex-Hermitian, ordered-minimum and domain
  bridges they do not yet state, instead of replacing their solution operator.
* Tau Ceti `Analysis/PDE/Spectrum` already applies the real form machinery to
  Dirichlet problems. `Analysis/Convex/FenchelMoreau` and `Subdifferential`
  already provide convex duality and subgradients. Those theories remain the
  shared carriers for convex duality and subgradients; V2.1 adds only the
  constrained-minimum/normal-cone bridge. Also consume Mathlib
  `IsLocalMinOn.hasFDerivWithinAt_nonneg`, `fderivWithin_eq_zero`,
  `posTangentConeAt` and `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt_1d`
  where their hypotheses apply. The normalized-path proof below supplies the
  sphere specialization without assuming a generic multiplier condition.
  TauCeti `LinearPMap/SelfAdjoint` and
  `Analysis/Normed/Operator/Resolvent/Shift` supply native adjoint and
  resolvent-translation APIs for V5. The actual `subScalar` definition is in
  `TauCeti/LinearAlgebra/LinearPMap/Shift`.

## V1 — weak lower semicontinuity and the direct method

**V1.1 — Energy and admissible-set API.** The direct-method layer is over ℝ;
V2.3 transports it to complex spaces. Use ordinary real-valued functions
and native sets, with named reusable predicates for bounded sublevels and
sequential weak lower semicontinuity. A bounded-sublevel hypothesis means
`∀ b : ℝ, Bornology.IsBounded {u ∈ S | E u ≤ b}`; it is relative to S.
State equivalent sequence formulations and the implication from
`E(u) → +∞` as `‖u‖ → +∞`. Include restriction, intersection, affine
translation, positive scaling, sums with bounded-below energies, and change
of variable by a continuous linear equivalence. Do not claim arbitrary sums
of coercive energies remain coercive without controlling the other term.

For sequences, lower semicontinuity means
`E u ≤ liminf E(u_n)` when `u_n ⇀ u`; formulate the extended-real liminf so
unbounded energy sequences are included. The minimizing-sequence specialization
uses its actual finite limit. For a weakly lower semicontinuous real E, each
sublevel is weakly closed. Prove both directions via native semicontinuity and
show the sequential implication. The converse from sequential to topological
semicontinuity is restricted to bounded weak-compact sets using B2, not claimed
on the whole weak topology.

**V1.2 — Convex energies.** Derive weak lower semicontinuity of norm-lower-
semicontinuous convex real functions from the native closure comparison applied
to their closed convex sublevels. Include continuous convex functions, norms,
norm powers p ≥ 1, finite sums and squared norms of bounded linear maps.
For complex spaces convexity is over ℝ. Include weakly continuous linear or
real affine terms. Apply BanachSpaceTheory B1’s Mazur lemma with convex combinations
from every **tail** of a sequence and a subsequence realizing the liminf;
convex combinations of the entire sequence alone do not control the limiting
energy. The function `‖D u‖²` is a quadratic energy, not a seminorm.

**V1.3 — Compact maps on bounded sets.** For a compact continuous linear map
j from a Banach space to a normed space, prove:

1. Weakly convergent sequences have norm-convergent j-images, using uniform
   boundedness, relative compactness, and uniqueness of the weak limit.
2. On any norm-bounded subset B, j is continuous from the restricted weak
   topology to the target norm topology. Its image lies in a norm-compact
   closure; the norm and weak topologies agree there by compact-to-Hausdorff
   comparison. Include the target weak-continuity and uniqueness bridges.
3. `g ∘ j` for norm-continuous g is sequentially weak continuous globally
   and weakly continuous on bounded subsets. Add it to V1.2 energies with
   these precise sequential/restricted conclusions.

Do not assert global weak-to-norm continuity of a compact map, or global weak
continuity of `g ∘ j`. Include the following counterexample API. In an
infinite-dimensional space with injective j, every weak basic neighborhood of
zero meets `{u | ‖j u‖ = 1}`: the common kernel of its finitely many continuous
functionals contains a nonzero vector, which can be normalized by its j-norm.
Thus this sphere is not globally weakly closed. With compact j it is sequentially
weakly closed. Give an actual compact injective example on native ℓ², using
diagonal coefficients `1/(n+1)` and finite-rank truncations. The distinction
between sequences and nets is part of the acceptance API.

**V1.4 — Direct-method theorems.** Prove two versions for nonempty S in a
reflexive Banach space and E : V → ℝ bounded below on S.

* If S is weakly closed, E is weakly lower semicontinuous on S, and its
  sublevels on S are norm bounded, E attains its infimum. One proof applies
  the native compact minimum theorem to a nonempty bounded closed sublevel, with its weak compactness obtained from native DoubleDual as above;
  another uses a minimizing sequence and B2.
* If S is sequentially weakly closed, E is sequentially weakly lower
  semicontinuous on S, and there is a bounded minimizing sequence, E attains
  its infimum. B2 supplies a weakly convergent subsequence even without
  separability. Bounded sublevels are a sufficient hypothesis. A version
  uses sequential closedness/lower semicontinuity only within a fixed bounded
  sublevel containing the chosen sequence.

Construct minimizing sequences with `E u_n < inf E(S) + 1/(n+1)`, or ≤ with
an explicit positive error sequence. State existence as `IsMinOn E S u`,
identify its value with `sInf (E '' S)` using nonemptiness and lower boundedness,
and provide compactness of bounded minimizer sets, subsequential convergence
of bounded near-minimizers, and stability under restriction to a nonempty
weakly (respectively sequentially weakly) closed admissible set. Near-minimizers converge in energy only; norm convergence
requires the additional strict/uniform convexity hypotheses of V2.

## V2 — first variations, convex minima, and coercive quadratic energies

**V2.1 — First variation.** For a differentiable real energy on a Banach
space, minima on an affine subspace have derivative zero on its direction
space. For closed convex constraints derive the variational inequality
`dE(u)(v-u) ≥ 0`, and prove its converse for a differentiable convex E.
Use TauCeti's subdifferential with F=`StrongDual ℝ V` and evaluation
pairing `B(x,f)=f x` to build the nonsmooth
normal-cone condition with `N_C(u)={f : StrongDual ℝ V | ∀ v∈C, f(v-u)≤0}`
at u∈C.
Define `indicator_C` with value 0 on C and ⊤ outside. Prove the sum rule
`∂(E+indicator_C)=∂E+N_C` for convex C and convex E continuous at an
admissible point, separating the epigraphs of the translated energies on the
product space and using continuity to obtain a nonvertical separator. Its
dual components give the subgradient and normal-cone inequalities. For a
functional η on the left, first subtract η from E, apply separation at its
constrained minimum, and then restore η; the converse adds the inequalities.
Without a sum-rule qualification retain the unconditional condition `0∈∂(E+indicator_C)(u)`.
Include translation, restriction, the unconstrained case, and equivalent
one-sided directional derivative statements with their existence hypotheses.

**V2.2 — Quadratic energies.** For a bounded Hermitian form a, continuous
linear forcing functional ℓ, and real-valued
`E(u)=q(u)-2 Re ℓ(u)`, prove the exact expansion
`E(u+t v)-E(u)=2t Re(a(u,v)-ℓ(v))+t² q(v)` for real t.
Prove the derivative formula and the weak equation `a(u,v)=ℓ(v)` at a minimum
on a linear direction space. Over ℂ first obtain the real-part identity and
then also test with `Complex.I • v`. A real-part identity by itself is insufficient.
For q nonnegative prove its Cauchy–Schwarz inequality and radical/kernel
identities by the real quadratic discriminant and complex phase test.
The weak equation implies a minimum, with exact energy gap
`E(u+h)-E(u)=q(h)`. Coercivity makes that gap control `‖h‖²`, giving uniqueness
and norm convergence of near-minimizers. Include affine constraints, restrictions
and continuity of solutions as ℓ varies, and identify the real coercive solution
with native `IsCoercive` Lax–Milgram/solution-map APIs.

**V2.3 — Complex coercive adapter.** Realify a Hermitian form, applying the
existing real coercive theorem to `Re a` and `Re ℓ`. The `Complex.I` test recovers the
complex equation. Explicitly identify complex and restricted-real weak topologies:
a real continuous functional f is the real part of
`ℓ(x)=f(x)-Complex.I*f(Complex.I • x)`, and evaluations give the two inverse continuity criteria.
Transport weak convergence, compactness and lower semicontinuity through this
dictionary using the native restriction-of-scalars carriers. Uniqueness proves
the **H-forcing** map `h↦u`, solving `a(u,v)=inner 𝕜 h (j v)`, is complex
linear and bounded. Package it as `H →L[𝕜] V`. The **dual-forcing** map solving
`a(u,v)=ℓ(v)` is instead conjugate linear, `StrongDual 𝕜 V →L⋆[𝕜] V`;
prove both inverse identities and norm estimates. Under h-forcing it agrees
with the dual map composed with the conjugate-linear Riesz/j-adjoint forcing.
For every `[RCLike 𝕜]`, use a named type synonym `RealHilbert 𝕜 V` with
the explicit `InnerProductSpace.rclikeToReal` structure. Prove the generic
coercive and weak-topology comparisons through this carrier. At 𝕜=ℝ, give
the identity real linear isometry equivalence `RealHilbert ℝ V ≃ₗᵢ[ℝ] V`
and transport the comparisons to the original real carrier. Define
`toRealBilin` from a real sesquilinear CLM to its real bilinear CLM using
`starRingEnd ℝ = RingHom.id ℝ`; all native real comparisons use that map.
For coercive positive forms use a separate `EnergySpace a` type synonym,
with inner product a and a `ContinuousLinearEquiv` with V proved by the
two-sided norm inequalities. Prove completeness through that equivalence.
Mathlib `IsSelfAdjoint.eq_smul_self_of_isLocalExtrOn` is an existing model for the
complex-via-real restriction pattern.
Real restriction and complexification comparisons identify the solution
operator, forcing map and adjoint; the eigenvalue and eigenbasis comparisons
are owned by V5.1/V5.2 after the represented operator is constructed.
Prove complete Hilbert spaces reflexive by Riesz `InnerProductSpace.toDual`
and the resulting inverse to the continuous bidual inclusion. Give the
continuous-real/complex dual and bidual dictionaries, hence equivalence of
reflexivity over ℝ and ℂ; use the weak-topology comparison above to transport
B2's compactness/sequence conclusions.
This is an extension of the native real variational form interface.

Own the Hilbert complexification required for real operators to use complex
spectral calculus for an arbitrary real Hilbert space X, instantiated at both
X=V and X=H. Use a type synonym of `WithLp 2 (X × X)` with complex action
`(a+ib) • (x,y) = (a • x-b • y,b • x+a • y)` and inner product
`b_ℂ((x,y),(u,v)) = b(x,u) + b(y,v) + i(b(x,v) − b(y,u))`, where b is the
real inner product. Prove the complex inner-product axioms, norm
`sqrt(‖x‖²+‖y‖²)`, completeness, real isometric inclusion `x↦(x,0)`, conjugation
`J(x,y)=(x,-y)`, and its fixed-real-subspace identification. The ℝ scalar
action on the synonym is the restriction of this ℂ action; prove its coordinate
action compatibility. Compare with native Taylor-norm `TauCeti.Complexification X`
by the coordinate identity as a bounded complex-linear equivalence, using the
native `ContinuousLinearMap.complexify` transported through this equivalence
rather than defining another map complexification. Prove equality of the Hilbert
complexified and original operator norms, in addition to the Taylor/Hilbert norm
comparison `‖z‖_Taylor ≤ ‖z‖_Hilbert ≤ sqrt(2)*‖z‖_Taylor`.

For a real bounded symmetric bilinear form b on X, give the complexified formula
`b_ℂ((x,y),(u,v)) = b(x,u)+b(y,v)+i(b(x,v)-b(y,u))`; verify conjugate-linearity
in the first slot, Hermitian symmetry, boundedness, and compatibility with
restriction of scalars. Prove preservation of dense/injective/compact inclusions
and shifted coercivity. Complexify a real native `LinearPMap` on the actual domain
`Dom A × Dom A`, with coordinatewise action; prove graph, closedness, density,
adjoint, real-resolvent and conjugation-fixed comparisons.

For a real densely defined self-adjoint partial operator A, prove its
complexification A_C is self-adjoint. For every Borel B⊆ℝ, prove its complex
spectral projection `P_(A_C)(B)` commutes
with conjugation J. Its restriction to the fixed-real subspace defines a real
orthogonal projection. Specify this family using concrete real continuous linear
maps, without a new `ProjValMeasure` instance: let `ι_H:H→L[ℝ]H_C` be the
real inclusion and `π_R:H_C→L[ℝ]H`, `(x,y)↦x`, the real-coordinate retraction,
where H_C is restricted to real scalars. Set
`P_R(B)=π_R ∘ (P_(A_C)(B)).restrictScalars ℝ ∘ ι_H`.
Prove its normalized, strongly countably additive projection-family laws and
uniqueness among real projection families whose complexification is `P_(A_C)`.
For `x:H`, its diagonal scalar measure is exactly the existing complex PVM's
positive measure `P_(A_C).diagMeasure (ι_H x)`, with
`μ_R^x(B)=ENNReal.ofReal (inner ℝ x (P_R(B)x))`; no separate scalar-measure construction is used.
For bounded real Borel g, define the real bounded calculus by the same restriction
`g_R(A)=π_R ∘ g[P_(A_C)].restrictScalars ℝ ∘ ι_H`, using `Complex.ofReal ∘ g`
as the complex symbol. Prove its algebra, norm, projection and conjugation/
complexification identities on these actual maps. These are the complete early
V2.3 complexification and spectral-restriction interfaces. V2.3 does not
transport a represented form operator and does not compare against V4/V5
eigenbasis formulas; those comparisons belong to V5.1/V5.2 after UO-D06.


**V2.4 — Semibounded shifts.** Under the stated quantitative lower bound,
prove coercivity of every a_α with α ≥ ω, Hilbert-norm equivalence and positive
energy diagonal. Shifted equations and spectra differ by α times the H inner
product, not the V inner product. Recover the original form from each shifted form by subtracting α times
the H inner product, and compare shifts by that identity. Operator independence
from coercivity and shift witnesses is a V5.1 consequence.

## V3 — compactly embedded form domains and admissible spheres

**V3.1 — Form-domain pair API.** Bundle the actual j, injectivity, density,
compactness, bounded Hermitian a and quantitative shifted coercivity. Prove
extensionality including the stated data, restrictions to closed subspaces of V,
unitary transport in H, equivalent Hilbert norms in V, shifts, finite orthogonal sums and compatible
real/complex changes. Prove the energy and admissible constraints independent of the chosen
coercivity/shift witnesses. Operator independence follows in V5.1, and
ordered-eigenvalue independence follows from V4.4. Preserve the native j and a
rather than reconstructing
Sobolev spaces. Restriction can lose density in H; use the closure of its image
as the new H when density is required.

**V3.2 — Constrained sphere.** For a norm-closed submodule W of H set
`S_W={u : V | j u ∈ W ∧ ‖j u‖=1}`. Nonemptiness is equivalent to
`∃ u, j u ∈ W ∧ j u ≠ 0`; an intersection merely containing zero does not
suffice. Prove sequential weak closedness of S_W using V1.3 and norm-closed W.
Its intersection with a closed V-ball is weakly compact using native DoubleDual
plus V2.3 Hilbert reflexivity and restricted
weak-to-norm continuity. For every finite b the energy sublevel
`{u ∈ S_W | q(u) ≤ b}` is bounded by the shifted coercivity inequality and is
weakly compact: apply convex weak lower semicontinuity to q+ω‖j·‖² and subtract
ω on this sphere. Apply V1.4's sequential version on S_W, or its weak-closed
version on a nonempty energy sublevel. Build the transfer lemma: a minimum
on `{u∈S | E u≤b}` is a minimum on S when that sublevel is nonempty.
Supply normalization,
phase invariance, Rayleigh quotient/least-value equivalence, lower bounds,
minimizer-set compactness and identification with the native real coercive
`isLeast_rayleighQuotient` after shifting. If W does not contain a form-domain
vector the minimum theorem has no witness; never infer one from W ≠ 0 alone.

**V3.3 — Restricted Euler–Lagrange equation.** A sphere minimizer u in W
satisfies `a(u,v)=q(u) inner 𝕜 (j u) (j v)` for all form-domain v with j v ∈ W.
Use the normalized path `(u+t v)/‖j(u+t v)‖`, first for H-orthogonal v, then
split off its u-component. Over ℂ also vary `Complex.I • v`. This yields an eigen-equation
for the **restricted form**, not necessarily the original operator on H when
W is arbitrary. Extension to all v in V in V4 uses the previously constructed
eigenvectors and their own weak equations.

**V3.4 — Kernel-orthogonal Poincaré connector.** For q≥0 define the form
kernel `N={u∈V | ∀ v, a(u,v)=0}`, equivalently q(u)=0 by the positive-form
Cauchy–Schwarz inequality, and its H image jN. The graph estimate makes the
V and H norms equivalent on N; compactness of j then makes N finite dimensional
and jN norm closed. On W=(jN)ᗮ, V3.2 attains the unit-sphere minimum when
nonempty. That minimum is strictly positive: zero energy would put a nonzero
unit vector in jN∩(jN)ᗮ. Derive `q(u)≥δ‖j u‖²` on j u∈W and, by the
shifted bound, true V-coercivity there. Include the empty W case, kernel
projections, forcing annihilating N, uniqueness modulo N and best-constant
characterization. Apply this to solve equations modulo N with forcing
annihilating N, then identify the existing real Fredholm alternative
after shifted-coercive reduction. This proof precedes and does not require V4 completeness.

## V4 — successive minima, complete bases, and min–max

**V4.1 — Ordered construction.** Construct u₀ with ‖j u₀‖=1, then minimize
on the sphere H-orthogonal to the preceding finitely many j uᵢ. Use density of
j and finite-codimension dimension estimates to prove nonemptiness whenever
fewer than dim H vectors have been chosen. Define λₙ=q(uₙ). These values are
nondecreasing and bounded below by −ω. Each step first proves its full weak
eigen-equation: V3.3 supplies it on the new constraint; the missing finite
span is handled using the earlier weak equations and Hermitian symmetry.
No completeness argument is used to prove this equation.

In finite dimension produce a `Fin (finrank 𝕜 H)` family and stop; H=0 gives
the empty basis. In infinite dimension construct a choice-based existence of a countable family (no canonical eigenvectors), show
λₙ → +∞ (a bounded subsequence would be bounded in V and its orthonormal
j-images would contradict compactness). Independently prove every variational
eigenspace finite dimensional: on an eigenvalue block the shifted estimate
makes j bounded below, so compactness forces finite dimension. Distinct
eigenvalues are H-orthogonal, giving finiteness below any real bound.
State eigenvalues with multiplicity and the set of distinct eigenvalues
separately. Exhaustion of all eigenspaces and separability of H follow only
after V4.2 completeness; neither is used to prove it.

**V4.2 — Completeness without circularity.** In V equip the form domain with
the shifted-energy inner product a_α. The earlier weak equations imply that
energy-orthogonality to uₙ is equivalent to H-orthogonality to j uₙ, since
λₙ+α>0. If their closed energy span were proper, an energy-orthogonal nonzero
v could be normalized in H; V4.1 gives λₙ ≤ q(v)/‖j v‖² for all n, contradicting
divergence. Thus they span V in its energy topology. Continuity and density of
j give a complete H Hilbert basis. In finite dimension use the orthonormal
family's length instead. Now prove exhaustion of all variational eigenspaces
and separability of H. Prove the exact comparison with the native real
coercive `exists_hilbertBasis_forall_apply_eq_smul_inner` **at 𝕜=ℝ** through
`toRealBilin`, allowing reindexing
and orthonormal changes within equal-eigenvalue blocks.

**V4.3 — Expansions.** Give H Parseval, V shifted-energy Parseval,
`q(u)+α‖j u‖²=Σ(λₙ+α)|inner 𝕜 (j uₙ) (j u)|²`, with convergence in V for
its reconstructed series. Conversely this weighted summability characterizes
range j. Include finite-dimensional versions, polarizations, truncation errors,
variational eigenspace projections, and a finite-dimensional zero eigenspace
when q≥0. Define projections on native closed submodules/Hilbert bases.

**V4.4 — Form-domain min–max.** For n below dim H prove Courant–Fischer
`λₙ = inf_{L≤V, dim L=n+1} sup_{u∈L, j u≠0} q(u)/‖j u‖²`, with attainment
at the span of the first n+1 eigenvectors. Prove the dual maximum-over-n-
dimensional-obstacles formula; the obstacle subspaces may lie in H. For the
lower estimate an (n+1)-dimensional L has a nonzero vector orthogonal to the
**first n** eigenvectors. Its mere inequality with the first eigenvector span
does not imply an improved λₙ₊₁ bound. Show subspace/energy monotonicity,
finite-codimension interlacing, counting-function characterization by maximal
dimension of subspaces with `q(u)<t‖j u‖²` for every nonzero u, and bounded-form perturbation estimates
`|λₙ(a)-λₙ(b)| ≤ ε` when `|q_a(u)-q_b(u)| ≤ ε‖j u‖²` on a shared pair.
Min–max makes λₙ independent of all eigenvector choices. These are form-domain
adapters; consume [PolarDecomposition PD-A50–A53](../OperatorTheory/PolarDecomposition/README.md)
for finite-dimensional matrices. Its decreasing eigenvalue ordering is converted
to the increasing form ordering by `k↦d−1−k`, with endpoints specified.

## V5 — the represented operator and resolvent comparison

**V5.1 — Actual domain and operator.** Define `CompactFormPair.operator` to be the named `UO.closedFormOperator`
from the identical `(inclusion, form, shift)` data, over the same `RCLike 𝕜`.
The pair's coercivity fields discharge UO-D06's quantitative hypothesis. Its
actual domain is exactly `{j u | ∃ f : H, ∀ v : V, a u v = inner 𝕜 f (j v)}`
and its action is `A(j u)=f`; density of range j and injectivity make both
representatives unique. Derive the domain equivalence, graph, restriction API,
symmetry, closedness, density, lower bound and self-adjointness from the D06
graph theorem and operator, without a second operator construction or a second
proof of general self-adjointness. The inverse of A+α is the V2 solution operator
S_α, compared with `IsCoercive.formSolutionOperator` over ℝ through
`toRealBilin` on the original real carriers. Prove S_α bounded, positive,
injective, compact and symmetric, with dense range; this is compact-pair
specialization, not a second representation theorem.

V5.1 owns compactness of S_α, compact resolvent and identification of V4's
ordered form eigenbasis with the eigenbasis of this same operator,
and records by unfolding that the specialization is the same D06 partial map.
The independent domain equivalence and action description follow from its graph
characterization. Specialize D06's general witness-independence theorem to prove
independence of the coercivity and shift witnesses, with identical actual domain
and action. UO-D06 alone owns the
general real-shift self-adjointness proof and both adjoint inclusions; V5.1 only
applies it to the specialized operator. For complex nonreal resolvents, consume
the self-adjoint resolvent theorem. Normalize signs:
S_α=(A+α)⁻¹=−R_A(−α), since the shared resolvent is `(zI−A)⁻¹`.
V5.2 proves the SAST SA-E03 eigenprojection identification and compares
SA-E05's resolvent formula with its coefficient multiplier. These PVM
comparisons use Part E over ℂ; real operators use V2.3's complexification and
unique conjugation-fixed real restriction.

**V5.2 — Domain expansions and equations.** Prove
`x∈Dom A ↔ Σ λₙ² |inner 𝕜 (j uₙ) x|² < ∞`, with A acting by multiplication
by λₙ. Include closure/graph-norm Parseval, a core of finite eigenvector spans,
resolvent coefficient formulas, and the finite-dimensional case. For a complex
eigenbasis b, identify its realification as the real basis `{bₙ,Complex.I • bₙ}`:
each complex eigenspace of dimension m has real dimension 2m. Compare native real
blocks only after this doubling and an I-compatible orthonormal choice; never
match complex and real multiplicity index sets directly. Identify the SA-E03
projection `P_A({λ})` with the orthogonal projection onto j of the λ-eigenspace,
and `P_A(B)` with the sum of those eigenprojections for λₙ∈B. Compare SA-E05's
resolvent formula with the coefficient multiplier below. For real operators
carry these comparisons through V2.3's complexification and its unique real
projection family. Identify the shared partial spectrum, defined as the complement of native
`TauCeti.LinearPMap.resolventSet A` in SAST SA-D02, with the embedded
real eigenvalue set `{(λₙ:𝕜)}` (and the finite-dimensional indexed set), and
prove every listed λₙ is an eigenvalue and there is no other spectrum.
For infinite H the set is closed by λₙ→∞. For z off it, construct the
resolvent coefficient multiplier `(z−λₙ)⁻¹`, checking weighted operator-domain
summability and both inverse identities. For H≠0 prove
`‖R_A(z)‖=1/infDist(z,eigenvalueSet)`; a nearest eigenvalue supplies the
lower bound. For H=0 the spectrum is empty and every resolvent is zero.
Compare this identification with the abstract supplier spectrum. For the
weak equation at a spectral value, forcing is orthogonal to its finite-dimensional
eigenspace; solutions differ by that eigenspace. Away from the spectrum obtain
uniqueness and the resolvent norm bound. For forcing in `StrongDual 𝕜 V` use V2.3's conjugate-linear dual solution
map and give the shifted-energy weak solution and its appropriate V series; distinguish this
from H forcing and from membership in Dom A.

**V5.3 — Differential-energy connector.** If a(u,v)=inner 𝕜 (D u) (D v) for
a bounded map D:V→K into a complete Hilbert space K and the quantitative
graph estimate holds, regard D as a
densely defined partial operator D₀ on H with domain range j. Its graph norm
is equivalent to V's norm, so D₀ is closed. Prove, with native partial adjoints,
`Dom A={j u | D u∈Dom D₀*}` and `A(j u)=D₀*(D u)` there.
Define this domain-restricted D₀*D₀ as a native `LinearPMap` on that submodule,
with action, graph, restriction and equality API; do not use native
`LinearPMap.comp`, which requires the whole first range in the second domain. The Hilbert adjoint of the
bounded map V→K is an operator K→V and is not this unbounded adjoint.
For the geometric specialization fix a compact boundaryless manifold,
`V=H¹(E)`, `H=L²(E)`, `K=L²(F)`, smooth first-order D and its metric-density
formal adjoint. Consume PDO/CKG smooth-core and distributional
elliptic-regularity inputs. Own the
remaining comparison: the adjoint domain of D₀ is the distributional maximal
formal-adjoint domain, by density of smooth tests and continuity of pairing;
prove both inclusions. Its composite domain is exactly H² for elliptic D*D
using PDO P6 weak regularity, and its action is the smooth formal D*D extension.
For D=d+d* prove this equals K5's H² Hodge-Laplacian realization; compare the
P7 positive Laplace realization by taking `D=(id,∇)` into
`E ⊕ (T*M⊗E)`. This first-order D has injective principal symbol and
`D*D=1+∇*∇`. Eigenvector smoothness then
uses the existing elliptic regularity, not a new geometric elliptic theorem.
For injectively elliptic rectangular D, positivity and the estimate suffice;
D need not be an isomorphism of bundles. Own the injective-symbol adapter:
In PDO's Fourier convention
`σ_F(D*D)=σ_F(D)*σ_F(D)` is invertible when σ_F(D) is injective;
the geometric convention gives `σ_geom(D*D)=−σ_geom(D)*σ_geom(D)`. Apply P6 to this
square second-order operator at s=−1,r=0; bounded formal-adjoint duality
`D*:L²→H^(−1)` gives `‖D*D u‖_(H^(−1))≤C‖D u‖_L²`, and hence
`‖u‖_H¹≤C(‖D u‖_L²+‖u‖_L²)`. Extend from smooth inputs by density. P6's own definition of
ellipticity remains the invertible-symbol square definition. Other self-adjoint realizations or
boundary conditions are identified only after their form domain is specified.

## V6 — approximation and source acceptance

**V6.1 — Ritz–Galerkin API.** For nested finite-dimensional subspaces Vₘ of V
whose union is dense in the shifted energy norm, build their Gram and energy
matrices `Aₘ,ij=a(φᵢ,φⱼ)` (row index in the conjugate slot) and
`Gₘ,ij=inner 𝕜 (j φᵢ) (j φⱼ)`. Require the positive H Gram matrix
supplied by injective j, and
define a generalized matrix eigenvalue by `Aₘ c=λ Gₘ c`, c≠0, and order it
with multiplicity by the restricted-form successive minima on the finite pair
`Vₘ→j(Vₘ)` (use that closed image as its H carrier). Prove agreement
with the ordinary Hermitian spectrum of `Gₘ^(−1/2) Aₘ Gₘ^(−1/2)`, using
PolarDecomposition's finite-dimensional CFC/ordering conventions.
For fixed n once dim Vₘ>n, the Ritz values decrease to λₙ. The upper estimate
uses energy-norm approximation to the finite eigenvector span and uniform
control of its finite-dimensional H Gram matrix; the lower estimate is V4.4.
Give quantitative error bounds in terms of that finite-dimensional approximation,
convergence of isolated eigenspace projections (with an explicit gap), and
subsequential eigenvector convergence allowing phases and rotations within
multiplicity blocks. Coordinate transport must preserve the generalized
Gram equation; an arbitrary basis is not assumed H orthonormal.

**V6.2 — Course-source applications.** Every item below is an acceptance
example against the preceding interfaces, with geometric inputs built by the
named suppliers. The sources are Math240, `0226_001`, physical pages 21–28
(overall archive pages 130–137).

| Source | Required mathematical acceptance |
| --- | --- |
| p21 | Derive the squared H¹-norm bound from the energy and forcing. Its square-root bound and sqrt(t)≤t+1/4 give a valid affine-linear H¹ bound after shifting the energy by its lower bound; either form proves bounded sublevels. |
| p22 | On a compact connected boundaryless manifold minimize `∫|df|²−2fg` on mean-zero H¹ for mean-zero g, using K5 Rellich and the V3.4 kernel-orthogonal Poincaré connector. Identify the scalar kernel without circularity: weak df=0 implies weak Δf=0; K5 regularity makes f smooth; coordinate mean-value arguments show f locally constant, hence constant on each connected component. The mean functional is continuous and its kernel is the constants' L² complement. V2.3 supplies Hilbert reflexivity; the source's weak subsequence proof consumes B2 ES. The native topological proof and the quadratic coercive alternative avoid ES. Weak lower semicontinuity uses liminf. |
| p23 | Derive the weak equation for `L=−div grad` by V2, extend tests from mean-zero functions to constants using mean-zero g, then consume elliptic regularity. On a disconnected compact manifold require zero integral on **each component**, impose componentwise mean-zero solutions, and identify all solutions modulo locally constant functions. Prove the abstract direct method V1.4 separately from this example. |
| p24 | Convex squared derivative norm plus a real affine forcing functional; give the tail-convex-combination and compact-composition adapters with their correct topology. First-order elliptic energies instantiate the V3 pair, not a bounded L² operator. |
| p25 | Minimize a differential energy on a closed H-subspace sphere with a **nonzero form-domain image**. Prove sequential closedness and weak compactness of bounded energy sublevels; exhibit the failure of global weak closure. The spectral output identifies a specified closed D₀*D₀ domain. |
| p26 | Successive minima, finite/infinite dimension alternatives, divergence, finite multiplicities and completeness through the shifted-energy inner product. Prove full eigen-equations before completeness; an arbitrary H¹ orthogonal complement need not be L² orthogonal. |
| p27 | Variation over all form-domain directions, with the extra `Complex.I` test over ℂ; compare weak equations, formal adjoints and the domain of D₀*D₀, then consume smooth elliptic regularity. |
| p28 | Apply the established D=d+d* form/graph comparison to CKG K5's Hodge theory: harmonic kernel, exact/coexact decomposition, smooth Green solution, unique harmonic representatives and finite-dimensional de Rham cohomology. The commutation with d,d* and real/complex star conventions belong CKG/DifferentialGeometry; the de Rham/singular comparison consumes AT6 and DG9, while de Rham Poincaré duality itself belongs DG9.3. V5.3 compares the energy realization with K5's H² Hodge realization; all listed Hodge consequences are consumed applications. Use those actual maps, including the star-duality identification, rather than infer it from compactness alone. |

Include finite-dimensional matrix examples, the zero space, a non-dense J
example with nontrivial kernel of its solution operator, and a noncompact
embedding example where the Rayleigh infimum need not be attained and no
discrete complete eigenbasis is asserted. The primary proof guide for the
ordered minimization and energy-space completeness is
[Ivrii, PDE textbook §13.1](https://www.math.toronto.edu/ivrii/PDE-textbook/Chapter13/S13.1.html).
For the shifted compact solution operator and weak elliptic domain use
[Hunter, PDE notes §4.2 and §4.10](https://www.math.ucdavis.edu/~hunter/pdes/pde_notes.pdf).
The requirements above state the hypotheses and dimension arguments explicitly;
the full-source min–max and sphere-closure shortcuts are not specifications.
