# Roadmap: incompressible flows and the Navier--Stokes equations

This roadmap builds a reusable formal theory of incompressible Euler and Navier--Stokes
evolution on flat tori and Euclidean space.  Its target is the established modern theory:
Helmholtz--Leray projection, transport by incompressible flows, the Stokes semigroup, local
strong and critical mild solutions, global Leray--Hopf weak solutions, the two-dimensional
global theory, regularity criteria, and the Caffarelli--Kohn--Nirenberg partial-regularity
theorem.  These are library results, not a bespoke encoding of one proposed proof.

The three-dimensional global regularity problem is not a theorem in this roadmap.  The
library must make the open problem precise enough to state, and must support research about
it, but no assertion of global smoothness or finite-time blowup for the genuine
three-dimensional equation is a completion target.

## Mathematical scope and conventions

The two spatial settings are fixed at the outset.

* The periodic setting is `UnitAddTorus d`, with normalized Haar measure of total mass one and
  Fourier modes indexed by `d -> Z`.  Physical results specialize to `d = Fin 2` and
  `d = Fin 3`.  A period-`L` presentation is related to this one by a proved rescaling theorem,
  not by a second set of definitions.
* The whole-space setting is a finite-dimensional real Euclidean space, with Lebesgue measure.
  Results whose decay, homogeneous-space, or pressure normalization assumptions differ from
  the torus are stated separately.

The velocity and pressure are real-valued.  Fourier analysis uses their canonical
complexifications and proves that every multiplier used for a physical operator preserves the
real subspace.  The Laplacian convention is `Delta = div grad`; the positive Stokes operator is
`A = -P Delta`, and the viscous semigroup is `exp (-nu t A)`.  Viscosity satisfies `0 < nu`.
The Euler equation is the separate `nu = 0` system, not a degenerate Navier--Stokes record whose
proofs silently divide by `nu`.

The core Navier--Stokes equation is

```text
partial_t u + (u dot nabla) u - nu Delta u + grad p = f,
div u = 0,                                      u(0) = u0.
```

Both the forced and unforced equations are represented.  Every theorem displays the space of
`f`; an unforced critical theorem does not inherit an arbitrary forcing field from a broad root
structure.  On the torus pressure is normalized to have zero spatial mean.  On Euclidean
space pressure is a distribution modulo functions of time until an integrability condition
selects a representative.

Smooth bounded domains are outside the root scope.  Their trace, extension, boundary
regularity, Helmholtz decomposition, and Stokes-domain questions belong to the PDE roadmap.
Local interior statements on Euclidean parabolic cylinders, including partial regularity, are
in scope because their hypotheses do not impose a boundary condition.  This boundary is
deliberate: the periodic and whole-space theory is already a dependency-closed foundation and
must not be held hostage to a second major elliptic boundary program.

Solution notions remain distinct.

* A classical solution satisfies the velocity--pressure equation pointwise with named
  space--time differentiability.
* A strong solution has the equation in a named Banach or Hilbert space and enough time
  regularity for the fundamental theorem of calculus.
* A mild solution satisfies the Stokes Duhamel formula.
* A distributional solution is tested against compactly supported divergence-free fields;
  the pressure-free formulation and the full velocity--pressure formulation are related by a
  pressure-reconstruction theorem.
* A Leray--Hopf solution is a distributional solution in the energy class with weak time
  continuity, the initial trace, and the global energy inequality.
* A suitable weak solution carries a pressure and satisfies the local energy inequality.

These are separate structures or predicates with explicit comparison theorems.  In particular,
energy inequality is not energy equality, a Leray--Hopf solution is not suitable by definition,
and a weak equivalence class is not evaluated pointwise without a selected representative.

## Existing foundations and coordination

Mathlib already supplies Bochner `Lp`, distributions and test functions, Schwartz and tempered
distributions, Fourier multipliers, Bessel-potential Sobolev membership, the
Gagliardo--Nirenberg--Sobolev inequality, convolution, mollifiers, and the multivariate Fourier
Hilbert basis `UnitAddTorus.mFourierBasis`.  It also supplies local integral curves and the
abstract topological `Flow`.  The implementation consumes those declarations and contributes
general lemmas at their natural homes instead of wrapping them in fluid-specific aliases.

Tau Ceti's [PDE roadmap](../PDE/README.md) owns the scalar weak-derivative spaces on domains,
Meyers--Serrin density, extension and trace theory, Calderon--Zygmund estimates,
Rellich--Kondrachov and Aubin--Lions compactness, and the general elliptic/parabolic substrate.
Tau Ceti contains the scalar `W1p`, `W2p`, and `W3p` graph spaces and
the general vector-valued predicate `HasWeakFDerivOn`.  This roadmap builds the finite-dimensional
vector-valued and periodic bridges actually consumed by fluids; it does not fork the scalar
Sobolev hierarchy.

The [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md) and Tau Ceti's
`Analysis/Semigroups` library own C0 semigroups, generators, resolvents, Hille--Yosida, and
Lumer--Phillips.  This roadmap constructs the concrete heat, Stokes, and Koopman semigroups,
proves their generators, and adds analyticity or fractional-power results only where the
abstract semigroup library does not already own them.

The [optimal-transport roadmap](../OptimalTransport/README.md) owns continuity equations for
measure-valued curves, superposition, and Wasserstein dynamics.  This roadmap owns scalar and
vector transport by incompressible velocity fields, renormalized transport on Lebesgue/Haar
spaces, and the bridge showing that an advected density gives the corresponding measure-valued
continuity equation.  It does not rebuild optimal-transport curves or Benamou--Brenier.

The differential-geometry roadmap owns smooth dependence of ODE flows, maximal and complete
manifold flows, Riemannian divergence, volume, and the divergence theorem.  Its manifold-flow
and Riemannian-volume declarations are consumed directly.  The present roadmap starts at the
Liouville/Jacobian formula, volume preservation, and the induced Koopman and transport theories;
it does not create a competing manifold-flow API.

Three Lean Pool developments are prior art rather than dependencies.  The archived Vlasov
project has characteristic flows and a weak--Lagrangian comparison in a special Euclidean
setting; the Rellich--Kondrachov project proves a compact Riemannian `H1 -> L2` embedding using
its own `H1`; and the stationary-harmonic-maps project contains a monotonicity argument over a
custom weak Sobolev layer.  Reuse requires an attributed port, reconciliation with the shared
Tau Ceti APIs, and coordination with the original authors.  Archive code is never imported as
an opaque prerequisite.

The exploratory `emberian/navier-stokes-proof` development is also prior art.  It demonstrates
concrete periodic vector calculus, classical Navier--Stokes and vorticity predicates,
measure-preserving torus flows, strongly continuous Koopman operators, and enstrophy/helicity
identities.  Its theorems are seeds to generalize and audit, not a second public foundation and
not evidence for the paper's proposed global-regularity argument.

## Intended library shape

Follow Mathlib naming conventions, but keep general material out of a monolithic Navier--Stokes
namespace.  The intended split is approximately

```text
TauCeti/Analysis/Sobolev/VectorValued.lean
TauCeti/Analysis/Sobolev/Periodic.lean
TauCeti/Analysis/Fourier/TorusMultiplier.lean
TauCeti/Analysis/VectorField/Flat/Basic.lean
TauCeti/Analysis/VectorField/Flat/Weak.lean
TauCeti/Analysis/VectorField/Helmholtz.lean
TauCeti/Analysis/VectorField/IncompressibleFlow.lean
TauCeti/Analysis/HarmonicAnalysis/LittlewoodPaley.lean
TauCeti/Analysis/HarmonicAnalysis/Besov.lean
TauCeti/Analysis/PDE/HeatSemigroup.lean
TauCeti/Analysis/PDE/Stokes/Basic.lean
TauCeti/Analysis/PDE/Stokes/Semigroup.lean
TauCeti/Analysis/PDE/NavierStokes/Solutions.lean
TauCeti/Analysis/PDE/NavierStokes/LerayHopf.lean
TauCeti/Analysis/PDE/NavierStokes/Regularity.lean
TauCeti/Analysis/PDE/NavierStokes/PartialRegularity.lean
TauCeti/Analysis/PDE/Euler/Incompressible.lean
```

No aggregate import should make users of flat divergence or Littlewood--Paley theory pay for
partial regularity.  Definitions expose neither a Fourier normalization nor a pressure
representative when the corresponding theorem is invariant under that choice.

## Layer 0: vector-valued and periodic analytic substrate

This layer closes the representation gap between the general analysis library and actual
velocity fields.

1. Generalize the value--derivative graph construction behind `TauCeti.W1p` from scalar values
   to a complete finite-dimensional real target `F`.  Use `HasWeakFDerivOn`; prove closedness,
   completeness, extensionality by the value class, continuous value/derivative projections,
   and agreement with classical Frechet derivatives.  For `F = Fin n -> R`, prove a continuous
   linear equivalence with the finite product of scalar spaces, including equality of weak
   derivatives componentwise.  Do not encode a vector field as a tuple of representatives.
2. Consume the PDE roadmap's scalar `Wkp` hierarchy and provide the corresponding
   finite-dimensional vector-valued `W^{k,p}` bridge.  Multiindices, weak derivatives, smooth
   density, restriction, extension, Sobolev embeddings, interpolation, and compactness are
   inherited through proved equivalences rather than restated for every `Fin n`.
3. Define periodic weak derivatives and `W^{k,p}(UnitAddTorus d; F)` intrinsically, with an
   equivalence to one-periodic local Sobolev functions on `R^d` and to the product-chart
   presentation on a half-open fundamental cell.  Prove translation invariance, density of
   trigonometric polynomials, integration by parts, and the mean-zero Poincare inequality.
4. Build the periodic Hilbert scale `H^s` for real `s` by the Fourier weight
   `(1 + 4 pi^2 |k|^2)^(s/2)`.  Prove completeness, duality `H^s* = H^{-s}` under the `L2`
   pairing, monotone embeddings, complexification/real-form equivalence, and agreement with
   integer weak-derivative Sobolev spaces.  Define the homogeneous mean-zero norm separately;
   the zero mode is never multiplied by a negative power.
5. On Euclidean space, consume `TemperedDistribution.MemSobolev` and its bundled Bessel-potential
   successor rather than define another inhomogeneous scale.  Supply the finite-dimensional
   vector-valued, real-form, and integer-order weak-derivative equivalences used below.  State
   homogeneous spaces only after quotienting polynomials or imposing the exact low-frequency
   condition required by the theorem.
6. Package Bochner spaces `L^p(I; X)`, weakly continuous paths, distributional time derivatives,
   and the Lions--Magenes energy identity in the Gelfand triple `V subset H subset V'`.  This
   consumes the PDE roadmap's Aubin--Lions theorem.  Prove the representative theorem giving a
   strongly continuous `H`-valued path when `u in L^2(V)` and `partial_t u in L^2(V')`; use the
   appropriate `L^(4/3)(V')` weak-continuity conclusion separately in three dimensions.

Acceptance checks: constant functions occupy exactly the periodic zero mode; the periodic
gradient of a Fourier mode is multiplication by `2 pi i k`; the mean-zero `H1` Poincare
constant agrees with the first nonzero unit-torus frequency; and vector-valued membership is
equivalent to membership of every coordinate without choosing representatives.

## Layer 1: flat vector calculus, weak operators, and identities

1. Define gradient, Jacobian, divergence, scalar/vector Laplacian, tensor divergence, and the
   advective derivative on finite-dimensional Euclidean spaces and unit tori.  Define scalar
   vorticity in dimension two and curl/cross product identities only in oriented dimension
   three.  Coordinate formulas are implementation lemmas, not the root definitions.
2. Give classical, weak-Sobolev, distributional, and Fourier-multiplier forms of each operator
   and prove that they commute on common domains.  Partial derivatives lower `H^s` to
   `H^(s-1)`; the Laplacian lowers it to `H^(s-2)`; divergence is the negative adjoint of
   gradient with the pinned measure convention.
3. Prove integration by parts on the torus and for compactly supported Euclidean fields.  Extend
   it by density to the exact conjugate Sobolev exponents.  Record the no-boundary-flux reason
   periodic identities have no boundary term.
4. Prove the product rules used by fluids, including
   `div (u tensor v) = (div u) v + (u dot nabla) v`, the skew transport identity for
   divergence-free `u`, and in dimension three
   `curl ((u dot nabla) u) = (u dot nabla) omega - (omega dot nabla) u`.
   Each weak form names enough integrability to make both sides distributions.
5. Define kinetic energy, enstrophy, and three-dimensional helicity on their natural domains.
   Prove coordinate invariance and continuity in the Sobolev topologies used later.  Balance
   Layer 5 states the balance laws after its solution notions justify their time derivatives.

Acceptance checks: `div (grad phi) = Delta phi`; `div (curl u) = 0` and
`curl (grad phi) = 0` in dimension three; periodic integrals of divergences vanish; and the
classical and distributional operators agree on smooth periodic fields.

## Layer 2: Helmholtz--Leray projection, pressure, and Biot--Savart

1. On the unit torus define the Leray symbol by
   `P(k) a = a - k (k dot a)/|k|^2` for `k != 0`, and `P(0) = id`.  Construct the multiplier on
   trigonometric polynomials first, extend it to `L2` by Parseval, and prove preservation of real
   fields.  Prove `P^2 = P`, self-adjointness, norm one, `div (P u) = 0`, and that `P` fixes
   distributionally divergence-free fields.
2. Identify the range as the closed divergence-free subspace and the kernel as the closure of
   gradients of mean-zero scalar fields.  Prove the orthogonal Hodge decomposition
   `L2 = L2_sigma direct-sum grad H1_meanZero`, with uniqueness under the zero-mean pressure
   normalization.  Treat constant velocity modes as divergence-free rather than silently
   deleting them.
3. Prove boundedness and commutation of `P` on every periodic `H^s`.  For `1 < p < infinity`,
   consume the PDE roadmap's Calderon--Zygmund/Riesz-transform lane to extend `P` to `Lp` and
   `W^{k,p}`.  Prove the endpoint maps `L1 -> L1_weak` and `L-infinity -> BMO` as separate
   theorems; do not advertise either as strong endpoint `Lp` boundedness.
4. Construct the Euclidean Leray projector as a tempered-distribution Fourier multiplier,
   prove its `L2`, `H^s`, and `Lp` bounds in the same regimes, and reconcile its symbol with the
   torus definition.  The value at frequency zero is irrelevant on Euclidean `L2` but remains
   explicit at the distribution level.
5. Define the inverse Laplacian on mean-zero torus distributions.  On Euclidean space define
   the pressure multiplier on Schwartz tensors and extend
   `p = sum_(i,j) R_i R_j (u_i u_j)` to `L^r` whenever `u in L^(2r)` and `1 < r < infinity`.
   Prove pressure recovery
   `-Delta p = div div (u tensor u) - div f` and equivalence of the pressure and projected
   equations.  On the torus select the zero-mean pressure; on Euclidean space prove uniqueness
   only modulo a time-dependent spatial constant until a stronger class is imposed.
6. In dimension two and three construct periodic Biot--Savart operators
   `H^s_meanZero -> H^(s+1)_meanZero` for every real `s`.  Construct the Euclidean law first on
   Schwartz vorticity, then prove `grad (BS omega) in L^p` for `1 < p < infinity` and
   `BS omega in L^(dp/(d-p))` for `1 < p < d`.  Prove `curl (BS omega) = omega`,
   `div (BS omega) = 0`, and the zero-mean/divergence-free compatibility conditions.  Prove
   velocity recovery from scalar two-dimensional vorticity and from divergence-free
   three-dimensional vorticity.

Acceptance checks: the projector kills a nonzero Fourier gradient, fixes a transverse Fourier
mode and every constant field, and is orthogonal on `L2`; pressure recovery round-trips through
the projected equation; and Biot--Savart inverts curl only after its compatibility conditions
are supplied.

## Layer 3: incompressible flows, Koopman groups, and rough transport

1. Consume the differential-geometry flow API for a `C1` time-dependent vector field.  Prove
   the variational equation for the derivative of the flow and Liouville's formula
   `d/dt det D Phi_(s,t)(x) = (div b_t)(Phi_(s,t)(x)) det D Phi_(s,t)(x)` in Euclidean charts,
   then its coordinate-invariant volume-form version.
2. Prove that a smooth divergence-free field generates volume-preserving flow slices.  Conversely,
   if all local flow slices preserve volume and the field is differentiable, differentiate at
   time zero to obtain zero divergence.  Specialize to complete autonomous flows on compact
   unit tori and state the time-dependent interval form separately.
3. For a measure-preserving continuous flow construct pullback Koopman operators on scalar
   `Lp`, prove isometry and the group law, and prove strong continuity for `1 <= p < infinity`.
   Do not claim operator-norm continuity or strong continuity on arbitrary `L-infinity`.
   On `L2` prove unitarity and identify the adjoint with inverse-time pullback.
4. For a smooth autonomous field identify the Koopman generator on the smooth core with
   `b dot nabla`, including the sign convention.  Prove closability and identify the closure in
   `Lp`, `1 <= p < infinity`, for a complete `C1` field with bounded derivative: its domain is
   the `f in Lp` whose distributional `b dot nabla f` belongs to `Lp`.  The solution of
   `partial_t rho + b dot nabla rho = 0` is inverse-flow pullback; forward pullback has the
   opposite time sign.
5. Prove conservation of every `Lp` norm and of integrals `integral beta(rho)` for smooth
   incompressible transport.  Establish the vector/tensor transport and pushforward formulas
   separately; a scalar Koopman operator is not silently reused as the pushforward of a vector
   field.
6. Build the DiPerna--Lions renormalized theory on the unit torus for
   `b in L1_t W1p_x`, `1 <= p <= infinity`, with `div b in L1_t L-infinity_x`, and
   `rho in L-infinity_t Lq_x` where `1/p + 1/q <= 1` (so `p = 1` uses `q = infinity`).
   Define renormalized solutions, prove the commutator
   estimate, existence, uniqueness, stability, and conservation/compressibility bounds.  Build
   the unique regular Lagrangian flow and prove the Eulerian--Lagrangian equivalence.  On
   Euclidean space add the DiPerna--Lions growth hypothesis
   `b/(1+|x|) in L1_t (L1_x + L-infinity_x)`;
   finite local Sobolev regularity alone is not a global-flow hypothesis.
7. Bridge an advected nonnegative density to the optimal-transport roadmap's continuity
   equation and superposition API.  The bridge proves equality of the induced measures and
   velocities; it does not duplicate the Wasserstein construction.

Acceptance checks: a constant translation on the torus preserves volume and has Koopman
generator the corresponding directional derivative; a smooth shear preserves every scalar
`Lp` norm; inverse-time pullback satisfies the pinned transport sign; and an `L-infinity`
counterexample guards against a false blanket strong-continuity theorem.

## Layer 4: heat and Stokes operators

1. Construct the heat semigroup on the torus from Fourier multipliers
   `exp (-4 pi^2 nu t |k|^2)` and on Euclidean space from the Gaussian kernel/Fourier transform.
   Prove the semigroup law, positivity, mass preservation, `Lp` contraction, strong continuity
   for `1 <= p < infinity`, agreement of the two realizations where both apply, and the
   distributional heat equation.
2. Prove the sharp-scale heat estimates used later: derivatives and fractional derivatives,
   `Lp -> Lq` decay on Euclidean space, periodic mean-zero exponential decay, and analyticity
   for positive time.  Every estimate displays its dimension, viscosity, exponent range, and
   time power.
3. Define the divergence-free Hilbert space `H`, the energy space `V = H1 intersect H`, and its
   dual `V'`.  On `H`, define the positive Stokes operator `A = -P Delta` with domain
   `H2 intersect H`.  Prove dense definition, closedness, positivity, self-adjointness, and
   `inner (A u) u = ||grad u||_2^2` with the selected normalization.
4. Use Tau Ceti's Lumer--Phillips theorem to construct the Stokes contraction semigroup and
   prove that it is the restriction of the heat semigroup in the boundaryless flat settings.
   Identify its generator as `-nu A`; prove commutation with `P`, derivatives, translations,
   and Fourier truncations.
5. On the mean-zero torus prove compact resolvent, the explicit Fourier eigenbasis, Poincare
   spectral gap, analytic contraction, and exponential decay.  Define fractional powers
   `A^alpha` and prove equivalence of their domains/norms with mean-zero divergence-free
   `H^(2 alpha)`.  Constant fields form the zero eigenspace in the non-mean-zero realization.
6. Construct the Duhamel convolution `integral_0^t S(t-s) F(s) ds` for
   `F in L1((0,T); X)` for a C0 semigroup on `X`, and its energy realization for
   `F in L2((0,T); V')`.  Prove continuity, differentiation when `F` takes values in the
   generator domain with integrable graph norm, smoothing, and the inhomogeneous linear Stokes
   estimates.

Acceptance checks: one Fourier mode decays by its exact heat factor; constants are stationary;
the Stokes and heat semigroups agree on divergence-free data; and the generator sign is caught
by `d/dt ||S(t)u||_2^2 <= 0`.

## Layer 5: nonlinear forms and the solution dictionary

1. Define
   `B(u,v) = P div (u tensor v)` and
   `b(u,v,w) = integral ((u dot nabla) v) dot w` first on smooth fields.  Prove bilinearity,
   the pressure-free equivalence, `b(u,v,w) = -b(u,w,v)` when `div u = 0`, and
   `b(u,v,v) = 0`.
2. Extend the trilinear form continuously to the energy spaces in dimensions two and three.
   Prove the Ladyzhenskaya/Gagliardo--Nirenberg bounds with exact exponents, including
   `B : V x V -> V'`, the stronger two-dimensional estimates, and the local Euclidean forms.
   Do not infer a pointwise product from Sobolev equivalence classes.
3. Prove Sobolev and heat-kernel bilinear estimates for
   `B : H^s_sigma x H^s_sigma -> H^(s-1)_sigma` for `s > d/2` and the time-weighted
   estimates used below near the scaling-critical index.  Keep the elementary high-regularity
   estimate separate from critical paraproduct estimates.
4. Define classical, strong, mild, distributional, Leray--Hopf, and suitable solution notions
   in reusable records/predicates with explicit intervals, data, force, viscosity, and spatial
   setting.  Initial data are traces, not equations asserted at every representative's
   pointwise time zero.
5. Prove the solution dictionary: classical implies strong and mild; strong implies
   distributional; mild solutions with the stated integrability are distributional; and a
   sufficiently regular distributional solution satisfies the Duhamel formula.  Prove the
   projected/full-pressure equivalence using Layer 2 rather than incorporating pressure into
   every nonlinear operator.
6. Derive the kinetic-energy equality for strong solutions and inequality for Leray--Hopf
   solutions, with work by the force in `V'--V` duality.  State energy equality under its own
   regularity hypotheses.  Derive the smooth vorticity, enstrophy, and helicity balances,
   including the two-dimensional disappearance and three-dimensional presence of vortex
   stretching.
7. Formalize Navier--Stokes scaling on Euclidean space.  Prove which spacetime Lebesgue,
   homogeneous Sobolev, and Besov norms are invariant, subcritical, or supercritical.  Torus
   rescaling changes the period and is related through the period-rescaling interface; it is
   not falsely stated as an automorphism of a fixed unit torus.

Acceptance checks: `b(u,v,v)=0` drives the exact smooth energy identity; the zero solution
inhabits every compatible solution notion; pressure and projected formulations round-trip; and
the Euclidean scaling leaves `L^d`, `Hdot^(d/2-1)`, and the Serrin equality invariant.

## Layer 6: local strong, mild, and classical theory

1. On the torus and Euclidean space prove local existence and uniqueness by an energy method
   for divergence-free `H^s` data with `s > d/2 + 1`, first for Euler and then for
   Navier--Stokes.  Produce the maximal interval, continuous dependence, persistence of higher
   regularity, and the blowup alternative in the norm used for the construction.
2. For viscous Navier--Stokes use the Stokes Duhamel map to prove subcritical local mild
   well-posedness in `H^s_sigma` for `s >= 0` and `s > d/2 - 1`; the critical equality
   `s = d/2 - 1` is Layer 10's Fujita--Kato theorem.  Prove uniqueness in the constructed
   time-weighted class and
   reconcile it with the high-regularity strong solution.
3. Prove instantaneous spatial smoothing and time regularity for positive times.  Prove the
   standard Gevrey estimate and hence spatial real analyticity for every positive time in the
   periodic and whole-space mild classes.  A Leray--Hopf solution is promoted only on an interval
   where a regularity hypothesis supplies a strong solution.
4. Establish continuation criteria in terms of the construction norm and the integral of
   `||grad u||_infinity`.  In three-dimensional Euler prove the Beale--Kato--Majda criterion
   with `integral_0^T ||omega(t)||_infinity dt`.  Keep this Euler theorem distinct from the
   Navier--Stokes gradient continuation criterion already stated.
5. Prove local stability and weak--strong uniqueness by the relative-energy estimate.  State
   the force and solution spaces that make the difference equation meaningful.
6. Prove the classical flow interpretation for Euler: vorticity transport/stretching, Kelvin's
   circulation theorem for material loops, and conservation of kinetic energy and, in three
   dimensions, helicity.  Every material-loop theorem consumes the complete smooth flow from
   Layer 3.

Acceptance checks: smooth data yield a nonempty maximal interval; two constructions with the
same data agree on overlap; the zero and shear solutions persist globally; and the continuation
criterion does not conclude global existence without a finite control norm.

## Layer 7: Galerkin construction and Leray--Hopf solutions

1. On the torus construct divergence-free Fourier truncations that commute with `P`, `A`, and
   spatial derivatives.  Prove density in `H` and `V`, self-adjointness, contraction, and exact
   preservation of the nonlinear cancellation.
2. Form the finite-dimensional Galerkin ODE, prove local existence, and use its energy identity
   to continue it over every finite time interval.  Establish bounds uniform in truncation for
   `L-infinity_t H`, `L2_t V`, and the correct time-derivative space (`L2_t V'` in dimension two,
   `L^(4/3)_t V'` in dimension three).
3. Extract weak and weak-star subsequences, use the PDE roadmap's Aubin--Lions compactness to
   obtain the strong local convergence required by the quadratic term, and pass to the
   distributional equation.  Prove weak time continuity, attainment of initial data in `H`,
   and the energy inequality by lower semicontinuity.
4. Deduce global Leray--Hopf existence in dimensions two and three on the torus for
   `u0 in H` and `f in L2_loc V'`.  Prove the energy inequality for almost every starting time
   and all later times after choosing the standard representative; distinguish this from an
   equality or a pointwise-everywhere statement.
5. Construct the pressure representative by Layer 2 and prove the full distributional system.
   Establish the corresponding whole-space Leray construction for
   `u0 in L2_sigma(R^d)` and `f in L2_loc((0,infinity); H^(-1)_sigma)` using spatially local
   strong compactness.  The torus compactness proof is not reused as if `R^d` were compact.
6. Prove the Leray regular-time structure: almost every time is an `H1` time, a local strong
   solution emanates from such a time, and the weak solution agrees with it while the latter
   exists.  Record weak--strong uniqueness as the comparison boundary, not uniqueness of
   arbitrary three-dimensional Leray--Hopf solutions.

Acceptance checks: every Galerkin approximant has an exact energy equality; the limit has the
correct inequality direction; the nonlinear term converges for a mathematically named reason;
and arbitrary `L2` divergence-free initial data produce a global weak solution without any
claim of uniqueness in dimension three.

## Layer 8: the global two-dimensional theory

1. Specialize the vorticity equation to dimension two and prove the disappearance of vortex
   stretching.  For smooth solutions prove circulation, `L^p` vorticity estimates, the maximum
   principle, and enstrophy equality with viscous dissipation.
2. Prove uniqueness of two-dimensional Leray--Hopf solutions by the Ladyzhenskaya estimate and
   Gronwall.  Deduce continuous dependence and the semigroup of solution operators on the
   energy space.
3. Prove global strong existence for `H1` data, instantaneous regularization for `L2` data at
   positive times, and global smoothness for smooth data.  The strong estimate takes
   `f in L2_loc((0,infinity); H)`; the energy solution keeps Layer 7's weaker
   `f in L2_loc((0,infinity); V')` hypothesis.
4. Prove the two-dimensional Euler global theorem for `H^s`, `s > 2`, by vorticity control and
   the logarithmic estimate needed by the continuation criterion.  Separately formalize
   Yudovich existence and uniqueness for `omega0 in L-infinity` on the torus, with the mean
   velocity fixed, and for `omega0 in L1 intersect L-infinity` with finite-energy velocity on
   `R^2`, including the log-Lipschitz velocity and Osgood uniqueness argument.
5. Relate the velocity and vorticity formulations through Biot--Savart, including mean/circulation
   compatibility.  A scalar vorticity does not determine the constant torus velocity mode, so
   retain or normalize that mode explicitly.

Acceptance checks: every two-dimensional Leray--Hopf solution is unique; smooth unforced
enstrophy is nonincreasing for positive viscosity and constant for Euler; and two velocities
with the same periodic vorticity are identified only after their means agree.

## Layer 9: regularity, uniqueness, and endpoint criteria in three dimensions

1. Prove the Prodi--Serrin weak--strong uniqueness and regularity criterion for a
   three-dimensional unforced Leray--Hopf solution in `L^p_t L^q_x`,
   `2/p + 3/q <= 1`, `q > 3`, on the torus and on `R^3`.  Treat
   equality and subcritical interpolation transparently.
2. Prove the Shinbrot energy-equality criterion
   `u in L^p_t L^q_x`, `2/p + 2/q <= 1`, `q >= 4`, for unforced Leray--Hopf solutions.
   Do not turn this sufficient condition into an equivalence or attach equality to every
   Leray--Hopf solution.
3. Formalize the critical endpoint theorem of Escauriaza--Seregin--Sverak: an unforced
   Leray--Hopf solution on `R^3 x (0,T)` with
   `u in L-infinity((0,T); L3(R^3))` is regular on positive times.  This claim includes the
   suitable local representative, local pressure theory,
   rescaling/compactness argument, backward uniqueness, and the required parabolic Carleman
   estimate; `q = 3` is not obtained by setting `q = 3` in the elementary Serrin proof.
4. Derive continuation and blowup lower bounds: if a maximal strong solution loses regularity
   at `T`, each completed criterion's controlling norm must diverge or fail at `T`.  State these
   contrapositives without asserting that a singular time exists.
5. Prove Leray's eventual regularity for unforced finite-energy solutions and that the set of
   singular times has one-half-dimensional Hausdorff measure zero.  Keep this temporal
   singular-set theorem distinct from the spacetime partial-regularity theorem of Layer 11.

Acceptance checks: the endpoint `L-infinity_t L3_x` result depends on backward uniqueness rather
than a nonexistent endpoint Gronwall estimate; a smooth solution satisfies every compatible
criterion; and every blowup statement is conditional.

## Layer 10: critical harmonic analysis and mild solutions

General harmonic analysis in this layer belongs under `Analysis/HarmonicAnalysis`, with fluids
as its first demanding consumer.

1. Construct dyadic partitions of unity and Littlewood--Paley blocks on Euclidean tempered
   distributions and on mean-zero periodic distributions.  Prove independence, up to equivalent
   norms, of the admissible cutoff; almost-orthogonality; reconstruction; and the low-frequency
   distinction between homogeneous and inhomogeneous decompositions.
2. Prove Bernstein inequalities and Littlewood--Paley square-function equivalence for
   `1 < p < infinity`, together with the `p = 1` Hardy-space and `p = infinity` BMO endpoint
   replacements.  Prove Sobolev/Bessel-potential identifications and embeddings between
   Lebesgue, Sobolev, and Besov scales.
3. Define inhomogeneous and homogeneous Besov spaces with explicit `l^r` summation and the
   polynomial/zero-mode quotient.  Prove completeness; density of Schwartz/trigonometric
   polynomials for `p,r < infinity`; scaling; duality
   `(B^s_(p,r))* = B^(-s)_(p',r')` for `1 < p,r < infinity`; and real/complex bridges.
4. Build Bony's paraproduct and remainder, prove the decomposition in distributions, and prove
   the product/commutator estimates consumed by critical Navier--Stokes and Onsager.  Reusable
   multiplier and commutator results do not live in a Navier--Stokes file.
5. Prove Fujita--Kato local well-posedness in the critical space
   `Hdot^(d/2-1)` (with the periodic mean-zero analogue) and global existence for sufficiently
   small critical norm.  The solution lies in
   `C_t Hdot^(d/2-1) intersect L2_t Hdot^(d/2)` and uniqueness is proved in that class.
6. Prove Kato's `L^d` theory on Euclidean space: local strong/mild existence for divergence-free
   `L^d` data, uniqueness in
   `C([0,T);L^d) intersect {u | t^(1/2-d/(2q)) u(t) in C((0,T);L^q), q>d}`,
   smoothing/decay, and global existence for sufficiently small `L^d` norm.  Give the periodic
   analogue separately because long-time decay and the zero mode differ.
7. Extend the mild fixed-point theory to the homogeneous critical spaces
   `Bdot^(d/p-1)_(p,1)` for `1 <= p < infinity`, with local existence for arbitrary data and
   global existence for sufficiently small data in the same norm.  Prove uniqueness in the
   constructed Chemin--Lerner/time-weighted class and weak--strong comparison.  The
   roadmap stops before `BMO^(-1)`/Koch--Tataru tent spaces; a separate roadmap must
   specify that substrate.  No unnamed "all critical spaces" target is accepted.

Acceptance checks: dyadic reconstruction returns a Schwartz function; homogeneous norms ignore
exactly the declared quotient/zero mode; the Navier--Stokes bilinear Duhamel map is bounded in
the chosen critical solution space; and small-data global existence carries an explicit
smallness constant or a theorem proving one exists.

## Layer 11: suitable solutions and Caffarelli--Kohn--Nirenberg partial regularity

This layer is specifically three-dimensional and local.  Parabolic cylinders use the scaling
`Q_r(z0) = B_r(x0) x (t0-r^2,t0)` and all scale-invariant quantities follow that convention.

1. Define local energy-class velocity and pressure spaces, distributional solutions on open
   spacetime sets, suitable weak solutions, regular points, and the singular set.  Write the
   unforced local energy inequality with every test-function, pressure, and sign convention
   explicit.  A forced extension is a separate theorem and names the force's scale-critical
   parabolic Morrey/Lebesgue class; the CKN completion target below is the unforced theorem.
2. Construct suitable weak solutions from regularized/Galerkin approximants and prove stability
   under the convergence class used below.  Do not assert without proof that every abstract
   Leray--Hopf solution admits a pressure representative satisfying the local energy inequality.
3. Build local pressure decompositions from Riesz transforms plus a harmonic remainder, and
   prove the Calderon--Zygmund estimates, local interpolation, parabolic Sobolev inequality,
   Caccioppoli inequality, and compactness lemma for rescaled suitable solutions.
4. Define the scale-invariant velocity, pressure, gradient, and energy quantities used in the
   iteration.  Prove their scaling laws and the decay/iteration inequalities with constants
   independent of the cylinder radius.
5. Prove an epsilon-regularity theorem: sufficiently small
   `r^(-2) integral_Qr (|u|^3 + |p-(p)_Br|^(3/2))` on a cylinder implies boundedness and then
   smoothness on a strictly smaller cylinder.
6. Construct parabolic Hausdorff outer measure and dimension in the metric
   `max(|x-y|, sqrt(|t-s|))`, prove the Vitali covering machinery used by CKN, and show that the
   one-dimensional parabolic Hausdorff measure of the interior singular set of a suitable weak
   solution is zero.
7. Derive the standard local corollaries: regularity outside a relatively closed singular set,
   local smoothness from the epsilon criterion, and compatibility with Layer 9's global
   regularity criteria.  Boundary partial regularity is outside this roadmap.

Acceptance checks: the local energy inequality is invariant under Navier--Stokes scaling; a
smooth solution is suitable with equality before discarding the nonnegative defect; the
epsilon criterion shrinks the cylinder; and the final CKN statement is measure zero for the
parabolic one-dimensional measure, not a claim that the singular set is empty.

## Layer 12: weak Euler energy and Onsager's positive direction

1. Define distributional incompressible Euler solutions in the energy class, with pressure and
   pressure-free formulations and the same normalization rules as Navier--Stokes.  Reconcile
   these definitions with Layer 6's classical Euler solution and Layer 8's Yudovich solution.
2. Derive the coarse-grained energy balance by spatial mollification.  Define the Reynolds
   commutator/energy flux and prove convergence to the distributional energy defect.
3. Using Layer 10's paraproduct/commutator estimates, prove the Constantin--E--Titi energy
   conservation theorem for `u in L3_t B^alpha_(3,infinity)` with `alpha > 1/3`.  Separately
   prove the endpoint refinement for `u in L3_t B^(1/3)_(3,c0)`, where the `c0` Besov space is
   the closure of smooth functions in `B^(1/3)_(3,infinity)`.  State local and global forms
   separately and make time integrability visible.
4. Prove conservation of energy for classical/Yudovich solutions as specializations and
   compare the weak defect with viscous dissipation in any vanishing-viscosity theorem that is
   explicitly added.

The converse/existence half of Onsager through convex integration, anomalous-dissipation
constructions, nonuniqueness of weak Navier--Stokes solutions, and turbulence/statistical
solution theories are outside this roadmap.  They require their own geometric and functional
substrates and cannot be represented by an open-ended final bullet.

Acceptance checks: smooth Euler has zero flux at every scale; the flux estimate decays with a
positive power exactly above the pinned one-third threshold; and the theorem concludes energy
conservation, not improved smoothness or uniqueness.

## Layer 13: public API and end-to-end examples

1. Provide extensionality, coercion, measurability, continuity, `simp`, and adjoint lemmas needed
   to use divergence-free subspaces, multipliers, unbounded operators, and solution records
   without unfolding them.  Mathematical representatives and pressure normalizations remain
   hidden behind selection theorems where appropriate.
2. Write module documentation mapping each solution theorem to its data, dimension, spatial
   setting, and uniqueness class.  Headline results have one canonical specialization and links
   to more general forms, not a spray of near-duplicate theorem names.
3. Maintain exact examples throughout the construction:
   * zero and constant velocity fields;
   * decaying single transverse Fourier modes;
   * periodic shear flows with vanishing nonlinear projection;
   * Taylor--Green vortices with their pressure and viscous decay;
   * three-dimensional Beltrami/ABC fields, where the nonlinear term is a gradient;
   * finite Fourier--Galerkin systems with exact energy cancellation.
4. Prove that the concrete periodic calculus and Koopman results from the exploratory
   `navier-stokes-proof` development factor through the general API, preserving attribution for
   any ported argument.  The comparison removes custom duplicate definitions once consumers
   have migrated.
5. Provide theorem-level regression tests for every sign and normalization gate: Fourier
   derivative, Laplacian, Stokes generator, Duhamel sign, transport pullback direction,
   pressure Poisson equation, vorticity stretching, energy dissipation, and parabolic scaling.

## Named completion targets

These summits do not replace their supporting layers.  Completion of the roadmap requires all
of them.

* the vector-valued/periodic Sobolev and periodic `H^s` bridges;
* flat weak vector calculus and Helmholtz--Leray/Hodge decomposition on `UnitAddTorus d` and
  Euclidean space;
* smooth divergence-free flow implies volume preservation, the `Lp` Koopman C0 group and its
  transport generator, and the DiPerna--Lions renormalized/regular-Lagrangian-flow theory;
* heat and Stokes semigroups, generator/domain identification, smoothing, and fractional powers;
* the nonlinear trilinear form, pressure/projected equivalence, and the complete solution
  dictionary;
* local strong/mild well-posedness, smoothing, continuation, and weak--strong uniqueness;
* global Leray--Hopf existence in dimensions two and three;
* uniqueness and global regularity in dimension two, including Yudovich Euler;
* Prodi--Serrin and the `L-infinity_t L3_x` endpoint regularity criterion;
* Littlewood--Paley/Besov/paraproduct theory and Fujita--Kato/Kato critical mild solutions;
* suitable weak solutions, epsilon regularity, and the Caffarelli--Kohn--Nirenberg parabolic
  one-dimensional singular-measure theorem;
* classical Euler flow/circulation/BKM and energy conservation in the positive Onsager regime.

## Statements that must not enter the library

Use the following as review guardrails.

* Every smooth three-dimensional Navier--Stokes solution exists for all positive time.
* Every three-dimensional Leray--Hopf solution is unique, regular, suitable, or satisfies energy
  equality.
* Partial regularity proves that the singular set is empty.
* An energy inequality can be differentiated as an energy equality.
* A weak `Lp` or Sobolev equivalence class has a canonical pointwise value.
* Pressure is unique without a zero-mean, decay, or quotient normalization.
* The Leray projector deletes the constant torus mode, or has the same endpoint bound on every
  `Lp`, including `p = 1` and `p = infinity`.
* Periodic Poincare holds without subtracting the mean.
* `curl` is a dimension-free operation, or scalar two-dimensional and vector
  three-dimensional vorticity are definitionally identical.
* A divergence-free vector field has a global classical flow without completeness, growth, or
  compactness hypotheses.
* A measure-preserving Koopman group is operator-norm continuous, or is strongly continuous on
  arbitrary `L-infinity`.
* Forward flow pullback solves the transport equation with the inverse-flow sign.
* Local Sobolev regularity of a Euclidean vector field alone gives a unique global regular
  Lagrangian flow.
* The Stokes operator is positive with the sign `P Delta` under this roadmap's Laplacian
  convention.
* A mild solution is unique among all distributional solutions without a uniqueness class.
* The elementary Serrin proof includes the `L-infinity_t L3_x` endpoint.
* A torus scaling is an automorphism of the fixed unit-period equation.
* Homogeneous Sobolev or Besov norms are honest norms before treating polynomials/zero modes.
* Onsager energy conservation above one third implies uniqueness, or formalizes the convex
  integration half of the conjecture.
* The exploratory retained-helicity argument, or any revision of its source paper, establishes
  global three-dimensional regularity merely because its preliminary identities formalize.

## Ordering and claim size

Layers 0--2 are the analytic spine.  Layer 1 can begin against `HasWeakFDerivOn` while the full
scalar `Wkp` hierarchy develops; Layer 2's `L2` torus projection needs only Fourier `L2`, while
its `Lp` bounds wait for the PDE harmonic-analysis lane.  Layer 3's smooth half can proceed with
the differential-geometry flow work, and its rough half follows Layer 0 plus the commutator
substrate.  Layer 4 can begin from Fourier `L2` and the semigroup library.  Layers 5--7 then form
the Navier--Stokes existence spine.  Layer 8 follows the vorticity and weak-existence APIs.
Layers 9--12 share the critical/local harmonic-analysis substrate but can otherwise be staged
independently once suitable solutions and the solution dictionary exist.

A useful implementation claim is normally one definition family with its complete basic API
and one or two named theorems: periodic weak divergence; the `L2` Leray projector; the
Liouville formula; a concrete Stokes generator; the trilinear cancellation; one Galerkin
compactness step; or one epsilon-decay lemma.  Hodge decomposition, Lumer--Phillips
identification, Leray--Hopf existence, Kato critical existence, the endpoint `L3` criterion,
and CKN each require staged claims whose intermediate results remain independently reusable.

## References

### General Navier--Stokes and Euler theory

* R. Temam, *Navier--Stokes Equations: Theory and Numerical Analysis*, AMS Chelsea.
* P. Constantin and C. Foias, *Navier--Stokes Equations*, University of Chicago Press, 1988.
* J. C. Robinson, J. L. Rodrigo, and W. Sadowski,
  *The Three-Dimensional Navier--Stokes Equations*, Cambridge University Press, 2016.
* P. G. Lemarie--Rieusset, *The Navier--Stokes Problem in the 21st Century*, CRC Press, 2016.
* A. Majda and A. Bertozzi, *Vorticity and Incompressible Flow*, Cambridge University Press,
  2002.

### Weak, strong, and critical solutions

* J. Leray, [*Sur le mouvement d'un liquide visqueux emplissant
  l'espace*](https://doi.org/10.1007/BF02547354), Acta Mathematica 63 (1934), 193--248.
* E. Hopf, [*Uber die Anfangswertaufgabe fur die hydrodynamischen
  Grundgleichungen*](https://doi.org/10.1002/mana.3210040121), Mathematische Nachrichten 4
  (1951), 213--231.
* J. Serrin, [*On the interior regularity of weak solutions of the Navier--Stokes
  equations*](https://doi.org/10.1007/BF00253344), Archive for Rational Mechanics and Analysis
  9 (1962), 187--195.
* H. Fujita and T. Kato,
  [*On the Navier--Stokes initial value problem. I*](https://doi.org/10.1007/BF00276188),
  Archive for Rational Mechanics and Analysis 16 (1964), 269--315.
* T. Kato, [*Strong `L^p`-solutions of the Navier--Stokes equation in `R^m`, with applications
  to weak solutions*](https://eudml.org/doc/173504), Mathematische Zeitschrift 187 (1984),
  471--480.
* M. Shinbrot,
  [*The energy equation for the Navier--Stokes system*](https://doi.org/10.1137/0505092),
  SIAM Journal on Mathematical Analysis 5 (1974), 948--954.
* L. Escauriaza, G. Seregin, and V. Sverak,
  [*`L_(3,infinity)`-solutions of the Navier--Stokes equations and backward
  uniqueness*](https://doi.org/10.1070/RM2003v058n02ABEH000609), Russian Mathematical Surveys
  58 (2003), 211--250.

### Transport, Euler, and harmonic analysis

* R. J. DiPerna and P.-L. Lions,
  [*Ordinary differential equations, transport theory and Sobolev
  spaces*](https://doi.org/10.1007/BF01393835), Inventiones Mathematicae 98 (1989), 511--547.
* J. T. Beale, T. Kato, and A. Majda,
  [*Remarks on the breakdown of smooth solutions for the 3-D Euler
  equations*](https://doi.org/10.1007/BF01212349), Communications in Mathematical Physics 94
  (1984), 61--66.
* V. I. Yudovich,
  [*Non-stationary flows of an ideal incompressible
  fluid*](https://doi.org/10.1016/0041-5553(63)90247-7), USSR Computational Mathematics and
  Mathematical Physics 3 (1963), 1407--1456.
* H. Bahouri, J.-Y. Chemin, and R. Danchin, *Fourier Analysis and Nonlinear Partial
  Differential Equations*, Springer, 2011.
* P. Constantin, W. E, and E. S. Titi,
  [*Onsager's conjecture on the energy conservation for solutions of Euler's
  equation*](https://doi.org/10.1007/BF02099744),
  Communications in Mathematical Physics 165 (1994), 207--209.

### Partial regularity

* L. Caffarelli, R. Kohn, and L. Nirenberg,
  [*Partial regularity of suitable weak solutions of the Navier--Stokes
  equations*](https://doi.org/10.1002/cpa.3160350604), Communications on Pure and Applied
  Mathematics 35 (1982), 771--831.
* F.-H. Lin, [*A new proof of the Caffarelli--Kohn--Nirenberg
  theorem*](https://doi.org/10.1002/(SICI)1097-0312(199803)51:3%3C241::AID-CPA2%3E3.0.CO;2-A),
  Communications on Pure and Applied Mathematics 51 (1998), 241--257.

## Acknowledgements and provenance

The roadmap is designed around the existing Mathlib, Tau Ceti, and Lean Pool work named above.
Any implementation ported from those developments or from `emberian/navier-stokes-proof` must
preserve authorship and license notices and explain how its statement was generalized.  The
theorem boundaries and counterexamples are taken from the cited literature so that increased
formalization ambition does not blur established results with the open global-regularity
problem.
