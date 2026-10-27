# Completely integrable systems and classical mechanics

Build commuting-integral geometry and local action-angle coordinates, together with cotangent
mechanics that uses them. The library should distinguish local regular fibers, compact Liouville tori,
period lattices and global monodromy. The Hamiltonian, Lagrangian and reduced descriptions of a
mechanical system must be related by proved maps and equations.

## Setting and dependencies

Use [family conventions](../README.md): real finite-dimensional smooth boundaryless manifolds,
ω=−dλ, ι_XHω=dH, {f,g}=df(Xg). For singular central potentials the phase space is the cotangent
bundle of the **punctured** configuration space; collision is not a smooth point. Ordinary vector-field
flows/conservation/brackets come from [HamiltonianSystems](https://github.com/TauCetiProject/TauCetiRoadmap/pull/480),
cotangent forms and canonical transformations from [CotangentLagrangian](../CotangentLagrangian/README.md),
regular quotients from [HamiltonianReduction](../HamiltonianReduction/README.md), and torus/lattice API
from [ConvexityToric T1](../ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models).
LieGroups supplies the exponential floor. LieGroupoidsPoisson G0.1 supplies regular-level
manifolds, HopfRinow the inverse function theorem, and DifferentialGeometry Frobenius,
complete flows and integration of one-forms. Bundle connections/Ehresmann theory come from SmoothBundlesConnections; singular-system
examples below build their own monodromy rather than silently assuming global angle coordinates.

## I1. Involutive functions and regular fibers

Define an n-tuple f=(f₁,…,fₙ) of smooth functions on a 2n-dimensional symplectic manifold, pairwise
Poisson commuting and with independent differentials on a dense open regular set. Independence means
surjectivity of df_x:T_xM→Rⁿ at each point, invariant under reparametrization and canonical transformations. A Hamiltonian
H belongs to the system when it Poisson-commutes with every fᵢ; prove local H=h(f) in a connected submersion chart. On the saturated neighborhood of I2 prove
H=h(f) by transitivity on its connected fibers; arbitrary disconnected fibers do not give global
factorization.

For k≤n independent involutive functions prove regular common levels have tangent ker df,
symplectic orthogonal spanned by X_fi, hence are coisotropic; derive the k≤n bound. For k=n they are
Lagrangian and the Hamiltonian fields span their tangent spaces. Prove commuting flows wherever their
compositions are defined; completeness is separate. Build the local Carathéodory–Jacobi–Lie normal
form: k commuting independent functions can be chosen as k momenta in a Darboux coordinate system,
with canonical conjugate variables. This refines ordinary Darboux and needs Frobenius plus the
Hamiltonian identities, not a second proof of general Darboux.

Provide exact definitions/API for regular integrable maps, fibers, first integrals, the rank function and its transport under diffeomorphic coordinate changes. Define
singular points by rank loss. At rank zero define nondegeneracy by the quadratic Hamiltonian
Hessians spanning a Cartan subalgebra of sp(T_xM,ω_x); prove Williamson’s Cartan-subalgebra
classification into elliptic, hyperbolic and focus-focus blocks, not merely positive-definite
symplectic diagonalization. For rank r>0 use the symplectic transversal quotient to define and
classify the rank-zero Hessian data there. This is explicit work here on the existing linear API.

## I2.0. Positive-period circles and families

Construct the following reusable foundation independently of the integrable map in I1. The carrier is
Mathlib's existing topological `AddCircle p`, for every real `p>0`; the quotient projection is
`q_p(t)=[t]_p`. Generic smooth free/proper discrete quotients belong to TauCeti's existing manifold
quotient API. This section owns their positive-period application, the comparison with the additive
circle, and the resulting circle, torus and parameter-family interfaces. Generic forms, wedge,
exterior differentiation and integration belong to
[DifferentialGeometry Layers0–1 and8.4](../../DifferentialGeometry/README.md).

**Quotient and atlas.** Put the real line on a p-indexed type synonym with transported topology and
smooth structure. Give `Multiplicative ℤ` its discrete topology and define `n·t=t+n p`. Prove the
actual action, smooth constant-action maps, joint continuity, freeness/`IsCancelSMul` and proper
discontinuity. Use positive p to bound the possible integers meeting two compact sets. Supply real
first countability, local compactness, T2 and compact coherence to the native
`properlyDiscontinuousSMul_iff_properSMul` comparison and the quotient-T2 API. Apply
`TauCeti.instIsManifoldQuotient` and `isLocalDiffeomorph_quotientMk` to the actual multiplicative orbit
quotient. Prove its explicit orbit-fiber equivalence and homeomorphism with `AddCircle p`, transport
the quotient charts, and prove that the same `q_p` is a smooth local diffeomorphism and covering.
Prove the smooth transition maps, covering lifting/uniqueness and the compatibility of all local
real lifts with this atlas. Real lifts on a connected overlap differ by a constant integer multiple
of p, so their transitions have derivative1. Construct a native oriented atlas with positive real
time direction, compatible with the constructed quotient smooth structure. Prove T2, second
countability and compactness for the identified carrier.

**Group, translations and time form.** Prove joint smoothness of addition, smoothness of negation and
all translations, using local lifts and the existing additive group. The joint real translation
`(s,[t])↦[t+s]` is a complete smooth flow; supply its group laws, period p, tangent generator and
translation diffeomorphisms. Construct a smooth one-form `dt_p` on the native cotangent carrier,
uniquely determined by `q_p^*dt_p=dt`. Use DifferentialGeometry’s `SmoothForm I M ℝ 1` and
construct the concrete comparison with the native smooth cotangent `ContMDiffSection` through
`ContinuousAlternatingMap.ofSubsingletonLIE` at `Fin1`; prove the evaluation, smoothness and pullback
comparison on these circle, product and family carriers. The generic alternating-bundle and form
calculus remains with DifferentialGeometry. Prove independence of the chosen lift, agreement with each
local-lift differential, closedness, nonvanishing, translation invariance and value1 on the time
generator. Compute its standard curve integral on `t↦q_p(t)`, `0≤t≤p`, to be p; every integral here
evaluates the form on the actual curve derivative. Identify the positive orientation determined by
this form with the oriented atlas. Construct the smooth integer multiplication maps and their
representative, translation and differential laws; retain the actual sign for negative integers.

**Scaling.** For p,q>0, use the native additive equivalence
`D_(p,q)([t]_p)=[(q/p)t]_q`. Prove that it is a diffeomorphism of the constructed atlases, that its
local real derivative is q/p, and that `D_(p,q)^*dt_q=(q/p)dt_p`. Prove the identity, inverse and
composition laws, compatibility with translations and integer multiplication, and positive
orientation preservation. These are actual maps on the existing quotient carriers. The unit-period
and period2π circles are specializations, with `θ=2πt/p` and `dt_p=(p/(2π))dθ`.

**Finite products and open restrictions.** For any finite indexed collection p_i>0, construct the
product atlas on `∏_i AddCircle p_i`, with its actual tangent/product identifications and coordinate
time forms. Prove their smoothness, closedness, coordinate-fiber pullback laws and periods p_i;
other-coordinate pullbacks are zero. For an ordered finite index set, identify the product
orientation with the ordered wedge of these positive forms and prove the permutation sign law.
The empty product is the point with its degree-zero orientation. Product scaling is the diagonal
diffeomorphism with the componentwise pullback formulas. Prove naturality under finite reindexing,
association and insertion/deletion of point factors. Restrict these charts, forms and maps to every
open subset, prove that the native open-submanifold atlas and restricted oriented atlas agree, and
prove compatibility of successive restrictions and of restrictions with products and scaling.
For a map f and open target V, restrict its source to an open U contained in f⁻¹(V). For a coordinate-fiber map, use the open preimage of the chosen target open set. Prove these restriction and pullback laws for every such open set, including open subsets that are not products.

**The positive-period total family.** Use the actual dependent carrier
`C={ (p,x) : p>0, x∈AddCircle p }`. Give it the topology and smooth structure transported through the
explicit normalization `N(p,x)=(p,D_(p,1)x)` to `R_>0×AddCircle1`, and prove both maps smooth. Prove
that its projection to the positive base is smooth and that its real representative map
`Q(p,t)=(p,q_p(t))` is a local diffeomorphism and covering. In normalized coordinates it is
`(p,t)↦(p,q_1(t/p))`. Its native deck action is `(p,t)↦(p,t+n p)`; prove the action, lifting,
freeness/properness and comparison with this total carrier, retaining the positive base. Identify
each original circle with the subspace fiber by an actual homeomorphism, smooth inclusion and
smooth inverse on the fiber; construct a smooth retraction to that fixed circle and prove both
inverse identities on the level. The fiber atlas obtained from the product normal form has the same maximal smooth atlas as
the previously constructed circle: prove the identity comparison is a diffeomorphism and the
maximal smooth atlases agree, using D_(p,1).

Put `β=(pr_2∘N)^*dt_1` and `η=p β`. Construct these smooth forms, prove `dβ=0`,
`dη=dp∧β`, and prove `i_p^*η=dt_p` for every fixed fiber. On the real cover prove
`Q^*η=dt−(t/p)dp` and its invariance under every deck map, including the derivative n dp of the
translated t-coordinate. Thus `Q^*(dη)=(1/p)dp∧dt`. The total form η is not closed; its fixed-fiber
restrictions are closed. Its normalization is specified by N and by annihilating the direction
where the unit-period coordinate is constant. Prove the compatible total orientation `dp∧η` and
all differential/base/fiber identifications. The normalization by N and the horizontal condition
fixes the extension; fiber restrictions alone allow addition of a pulled-back base one-form.

**Smooth parameter families and estimates.** For every finite-dimensional smooth base B and smooth
positive function p:B→R_>0, construct the actual pullback family
`{(b,x):x∈AddCircle p(b)}` with its smooth normalization to `B×AddCircle1`. Prove compatibility with
the universal family, arbitrary smooth base change, open restrictions and fixed fibers. Its forms
are β and η=p(b)β, with `dη=dp∧β`. Construct the analogous families for every finite collection of
positive periods. For two functions p,q on the same base, the fiberwise scaling preserves the
normalized angle, is a smooth family diffeomorphism and pulls η_q back to `(q/p)η_p`; prove the
composition/base-change/product laws including all parameter derivatives.

For each finite k, supply uniform chart, transition, derivative and form estimates on specified
compact parameter sectors where `0<ε≤p_i≤M`, using actual C^k bounds of the period functions and
bounded normalized lift charts. On a real-cover window `|t|≤R`, prove
`∂_p^k(t/p)=(-1)^k k! t/p^(k+1)` and
`∂_t∂_p^k(t/p)=(-1)^k k!/p^(k+1)`; derivatives with at least two t derivatives vanish. Derive bounds
`k!R/ε^(k+1)` and `k!/ε^(k+1)`, and carry them through the finite product, inverse, restriction and
base-change formulas. A positive lower bound does not bound derivatives of an arbitrary period
function; retain those derivative inputs. Use finite normalized chart covers of compact sectors;
there is no uniform coordinate-derivative bound for all unbounded integer deck indices. The form's
deck invariance is exact. No uniform assertion at period0 is made.

I2 consumes period2π circles for its angle torus. [S0](../README.md#s0-smooth-symplectic-suspensions)
consumes the fixed period1 circle and its closed form, including the two independent time circles
there. Both use this single construction and its proved normalization conversions.

## I2. Liouville–Arnold and local action-angle coordinates

First prove the global completeness statement: if the commuting integrable map
f is proper, every Hamiltonian field X_fi is complete. Each trajectory stays in
the compact fiber f⁻¹(f(x)); apply the compact-escape extension criterion at
both ends of its maximal time interval. This also treats critical fibers;
transitivity and torus conclusions require the regularity below. Complete
commuting fields give a global ℝⁿ-action, with its restriction/flow identities.

Let L be a nonempty compact connected component of f⁻¹(c₀) and assume df is surjective
at every point of L; other components of this level need not be regular. The commuting
Hamiltonian fields are complete on L because L is compact and invariant. Construct the transitive
Rⁿ-action on L, prove its isotropy subgroup is discrete and cocompact, and identify L smoothly with
Rⁿ/Λ. For a regular fiber without compactness the statement is a cylinder R^(n−r)×T^r only if
these fields are complete and the discrete stabilizer is specified; no torus conclusion is asserted.

Construct a local product around the fixed compact connected regular component L. Choose a
smooth complement to ker(df) near L. Horizontal lifts of radial paths in a sufficiently small
ball D about c₀ exist uniformly from every point of L by compactness; their endpoint map
Ψ:L×D→M satisfies f∘Ψ=pr_D and Ψ(x,c₀)=x. The inverse-function theorem along the compact
central fiber and a finite-subcover shrinking give an embedding onto an open neighborhood W.
Each slice Ψ(L×{y}) is connected and compact, hence closed in the Hausdorff fiber, and open
in that fiber because W is open, so it is exactly a connected component. The commuting
Hamiltonian fields are tangent to every fiber and restrict to smooth vector fields on each selected compact component C_y=Ψ(L×{y}). Such a field is complete on C_y: any maximal trajectory with finite endpoint time has an accumulation point in the compact component and extends by local ODE existence. Hence each field’s full flow preserves C_y, proving saturation of the selected family. The projection L×D→D is proper because
L is compact.
Prove local triviality using the Rⁿ-action: choose a transversal smooth section s:D→W with s(c₀)∈L. For variable c∈D solve φ_t(s(c))=s(c) near a fixed basis of periods at c₀ by the implicit function theorem to obtain smooth period functions λ^(i)(c). Consume I2.0’s positively oriented native `AddCircle (2π)` quotient charts, local lifts,
product atlas and normalization of the angle one-forms. The resulting D×Rⁿ/Λ_c identification is smooth, with a rank-n
period lattice Λ_c and its locally constant integral basis-change data. SmoothBundlesConnections’
proper-submersion theorem is a second reusable route with the same derived local domain.
Choose a local integral basis and construct actions I₁,…,Iₙ and angles
θ∈(R/2πZ)^n with **ω=Σdθᵢ∧dIᵢ**, f=f(I), and X_H=Σ(∂h/∂Iᵢ)∂θᵢ.
The chart is a symplectomorphism of a neighborhood with an open action domain times the whole torus,
not a single ordinary Euclidean coordinate chart on the torus.

Orient γᵢ by t↦φ_(tλ^(i))(s(c)), t∈[0,1], and prove
dIᵢ=(1/2π)Σ_j λ^(i)_j(c)dc_j; equivalently the lattice is
Λ_c=2π(D_I f)^(-T)Zⁿ. In an exact cotangent neighborhood show Iᵢ=(1/2π)∮_γi λ,
using DifferentialGeometry Layer8.4 chain integrals; in the general case define actions from
period one-forms and prove their local closedness/exactness. Prove changes of action basis have
I'=A I+b with A∈GL(n,Z), and the corresponding angle/translation transformation preserves ω.
Develop uniqueness up to these integral-affine changes and angle gauge. Define a regular Lagrangian torus fibration as a proper submersion π:M→B with compact
connected Lagrangian fibers, B a smooth n-manifold. Its period lattice Λ⊂T*B has linear
monodromy π₁(B)→GL(n,Z), and the associated torus bundle is T*B/Λ. Build its topological
Chern class in H²(B;Λ) with local coefficients using SmoothBundlesConnections’ affine-torus
classification and AlgebraicTopology’s local-coefficient carrier. SmoothBundlesConnections
B6.1/B6.6 supplies Čech/sheaf comparison and refinements. Build the sheaf Z¹ of closed one-forms and the sheaf quotient
Z¹/Λ of local Lagrangian sections, its Čech H¹ and torsor cocycle. This Lagrangian class
vanishes iff the fibration is fiberwise symplectomorphic to the canonical T*B/Λ model; its
connecting image is the Chern class. Prove this existence/uniqueness theorem by gluing local
action-angle sections, including the relation with a chosen section’s pulled-back two-form.

Global coordinates onto V×Tⁿ, V open in Rⁿ, additionally require trivial linear monodromy,
exact globally chosen period one-forms and an injective global action/developing map B→Rⁿ.
Prove these conditions together with vanishing Lagrangian class are necessary and sufficient,
with their basis-change indeterminacy. The fibration T²→S¹ with ω=dθ∧dφ has trivial
linear/Chern/Lagrangian data but no global real action coordinate; include it as a negative
acceptance case showing why period exactness cannot be omitted. For injectivity take
B=(1,2)×(0,3π) with developing map a(r,φ)=(r cosφ,r sinφ), lattice generated
by 2π da₁,2π da₂ and the canonical fibration T*B/Λ. Its period forms are exact and
its linear/Chern/Lagrangian classes vanish, but a is not injective, nor is any
integral-affine change of a. Thus it has no global action chart onto an open V⊂R².

## I3. Hamiltonian and Lagrangian mechanics

For a smooth L:TQ→R construct the fiber derivative/Legendre map FL:TQ→T*Q intrinsically.
A regular Lagrangian has invertible fiber Hessian and local FL diffeomorphism; a hyperregular one has
a **global** FL diffeomorphism. Define energy E_L=⟨FL(v),v⟩−L(v), Cartan form
θ_L=FL*λ and ω_L=−dθ_L, and H=E_L∘FL⁻¹ in the hyperregular setting. Derive equivalence of
Euler–Lagrange equations and Hamilton's equations, including second-order property of the flow and
invariance under configuration coordinate changes. Build kinetic-plus-potential systems from a smooth
positive definite metric and potential, and prove fiber Hessian/Legendre/energy formulas. Metric
geodesic flow is the kinetic Hamiltonian flow via Legendre and the Levi–Civita connection of [HopfRinow](../../HopfRinow/README.md).

For time-dependent L or H build extended phase space T*(Q×R), Hamiltonian p_t+H(t,q,p), and
nonautonomous equations; a conserved quantity criterion includes ∂_tF+{F,H}=0. Prove variation of
action and endpoint boundary term, so stationary-action formulations have actual curve/path hypotheses.
Noether for a configuration symmetry preserving L agrees with the cotangent-lift moment map and
Hamiltonian conservation of [R1](../HamiltonianReduction/README.md#r1-smooth-actions-moment-maps-and-equivariance).
If the infinitesimal symmetry variation of L equals dB_ξ(t,q)/dt along curves,
prove conservation of J_ξ=⟨FL,ξ_Q⟩−B_ξ and its coordinate-independent transformation law.

## I4. Examples that exercise the full API

- Free particle: H=‖p‖²/(2m), m>0, linear flow with C3’s convention (q,p) the source and mass generalization, generating S=−m‖q−Q‖²/(2t), t≠0.
  Harmonic oscillators Hᵢ=(pᵢ²/mᵢ+mᵢνᵢ²qᵢ²)/2 with positive mass and angular
  frequency: actions Eᵢ/νᵢ on {all Eᵢ>0}, angles and period lattice;
  resonant versus nonresonant orbit closure on a fixed invariant torus.
- Planar central force Q=R²\{0}, H=‖p‖²/(2m)+V(r), L=q₁p₂−q₂p₁. Prove rotational
  moment map, {H,L}=0, functional independence precisely away from p_r=0 and V_ℓ′(r)=0 simultaneously,
  and global polar cotangent coordinates with θ∈R/(2πZ) obtained from the base diffeomorphism
  R²\{0}≅R_>0×R/(2πZ). Prove polar canonical
  coordinates `(r,θ,p_r,L)` with λ=p_r dr+L dθ. Reduce at L=ℓ to
  H_ℓ=p_r²/(2m)+ℓ²/(2mr²)+V(r). Derive turning points V_ℓ(r)=E and circular equilibria. A nondegenerate reduced minimum is
  Lyapunov-stable elliptic; a maximum is hyperbolic. For simple turning points
  V_ℓ′(r±)≠0 prove convergence and formulas
  t=∫dr/√((2/m)(E−V_ℓ)), θ=∫ℓ dr/(r²√(2m(E−V_ℓ))) and
  radial period twice the time integral between turning points.
- Kepler V(r)=−κ/r, κ>0: conserved planar Runge–Lenz A=(p₂ℓ−mκq₁/r,−p₁ℓ−mκq₂/r),
  |A|²=m²κ²+2mHL², eccentricity e=√(1+2Eℓ²/(mκ²)),
  orbit r=ℓ²/(mκ(1+e cos(θ−θ₀))) and collision domain, elliptic bounded noncollision invariant tori, radial action
  I_r=κ√(m/(−2E))−|ℓ| for ℓ≠0 and −mκ²/(2ℓ²)<E<0, with I_r=0 at the circular endpoint.
  Prove H=−mκ²/(2(I_r+|I_θ|)²) and period T=2π√(m/κ)a^(3/2),
  a=κ/(−2E). With the signed angular action `I_θ=L`, prove
  `Ω_r=mκ²/(I_r+|I_θ|)³` and `Ω_θ=sgn(I_θ)Ω_r` on each component `L≠0`.
  The frequency magnitudes agree, with signed resonance `1:±1`; this and the
  displayed extra-integral relation prove superintegrability. Isotropic oscillator
  V=½mν²r² gives closed bounded noncollision orbits and radial action I_r=(E/ν−|ℓ|)/2. This is a
  comparison of two examples, not an unproved general classification of closed central orbits.
- Spherical pendulum, normalized mass/length/gravity one, on
  T*S²={(q,p):‖q‖=1,q·p=0}, H=½‖p‖²+q₃, J=q₁p₂−q₂p₁. Prove properness of
  H, connectedness of regular fibers and critical-value set: bottom (−1,0), upper isolated
  focus-focus value (1,0), and the relative-equilibrium boundary described by the minima of
  j²/(2(1−z²))+z for −1<z<1. Derive period/rotation integrals from this reduced
  Hamiltonian. Define the signed quadrature angle
  Θ(h,j)=2∫_[z₋,z₊] j dz/((1−z²)√(2(h−z)(1−z²)−j²)),
  so φ_H^T(x)=φ_J^Θ(x) and γ₂ is closed by time −Θ.
  Prove the one-sided limits Θ→±π for −1<h<1 and Θ→±2π for h>1 as j→0±.
  Pin F=(H,J), a counterclockwise loop
  in the (h,j)-plane around (1,0), γ_J the positive X_J-orbit, and γ₂ the forward
  X_H first-return path closed by backward X_J-rotation. Prove homology transport fixes γ_J
  and sends γ₂ to γ₂+γ_J, matrix [[1,1],[0,1]] with columns the transported basis.
  Use the rotation-form/residue computation of [Efstathiou–Giacobbe–Mardešić–Sugny](https://arxiv.org/html/1608.01579),
  §§II–III.2, building its first-return/rotation-number lemma and evaluating both polar contributions.
  Use the stated (h,j) orientation: the continuous lift of Θ decreases by 2π around
  the loop, so the closing −Θ segment gains a positive J-orbit.
  This supplies the nonlinear monodromy proof; the quadratic focus-focus Hessian alone does not.
  Conclude failure of global action-angle coordinates around this value.

<a id="i5-strict-annulus-fixed-points"></a>
## I5. The strict annulus fixed-point theorem

Prove the following theorem with the constructions below. Let A=(ℝ/ℤ)×[0,1], let ω be a smooth
positive area form, and let f:A→A be a smooth diffeomorphism preserving ω and each boundary
component. Fix a degree-one lift F of f commuting with T(x,y)=(x+1,y). Require strict opposite
boundary displacements: F^x(x,0)<x and F^x(x,1)>x for every x. The conclusion is at least two
distinct fixed points with zero displacement for this chosen lift; no nondegeneracy or
monotone-interior-twist hypothesis is imposed. For the reversed boundary inequalities apply the same
statement to f⁻¹. Compactness gives uniform positive margins in the inequalities. For an
orientation-preserving boundary circle lift, a positive uniform displacement gives positive rotation
number by iteration, and negative gives negative. Conversely a lift with a zero displacement has
rotation number zero; continuity and periodicity then show nonzero signed rotation number gives the
corresponding strict pointwise sign. Expose this equivalence with the actual rotation-number
definition and chosen lift, rather than changing lift halfway through the proof.

Construct compatible smooth extensions to open collars of the closed annulus. Extend the periodic coordinate functions using boundary charts and a periodic partition of unity; the inverse derivative identity at the boundary and the inverse function theorem give local inverses. Compactness on the annulus quotient and injectivity on the closed annulus give injectivity after shrinking the collars. Lift this collar diffeomorphism to the strip. Use the native `CircleDeg1Lift` translation-number API for the boundary lifts and prove the displacement/translation-number comparison above. [AnnulusFixedPointTargets.lean](AnnulusFixedPointTargets.lean) gives the standard-area lifted signature on actual open partial homeomorphisms.

### I5.0. Carrier, area and generating conventions

A general positive density ρ(x,y)dx∧dy is normalized explicitly. Put s(x)=∫_0^1ρ(x,r)dr and
a=∫_0^1s(x)dx>0. The coordinates u=a⁻¹∫_0^x s(t)dt modulo1, v=s(x)⁻¹∫_0^yρ(x,r)dr give a
boundary-preserving orientation-preserving diffeomorphism with a du∧dv=ω. Prove inverse smoothness
and the endpoint identities by positivity and the inverse function theorem. Degree-one boundary
conjugacy transports the lift inequalities, or equivalently rotation signs. Thus work below with
dx∧dy.

Use the generating convention y=−∂_1S, Y=∂_2S, so S is the negative of CotangentLagrangian C3's
generator. With W=ΣS_k, derive ∂_kW=Y_(k−1)−y_k and negative-gradient velocity xdot_k=y_k−Y_(k−1).
Prove all signs from these equations.

### I5.1. Smooth area-preserving isotopy and finite twist factorization

Construct an isotopy through orientation-preserving, boundary-component-preserving smooth
diffeomorphisms from id to f. One precise route consumes [SurfaceTopology Layer
9](https://github.com/mccorvie/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/SurfaceTopology/README.md)'s
rel-boundary annulus mapping-class group ℤ, its core Dehn twist, and [PlanarTopology Layer
8](https://github.com/mccorvie/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/PlanarTopology/README.md)'s
smooth-isotopy comparison on the standard compatible annulus. Lift the two boundary maps b_±.
Interpolating x to (1−y)b_−(x)+y b_+(x), with y fixed, has positive x-derivative and gives a smooth
boundary-preserving isotopy B_t realizing the boundary maps. Then B_1⁻¹f fixes the boundary
pointwise; its rel-boundary class is a power of the core twist (x,y)↦(x+my,y). That twist is
isotopic to identity when boundary rotations are allowed, and the remaining rel-boundary isotopy
supplies the desired path h_t. Smoothly reparameterize concatenations. The standard annulus's
compatible finite smooth triangulation and its compatibility with the half-plane charts must be constructed before applying that comparison.

Make this path area-preserving without assuming a Hamiltonian isotopy. Write h_t*(dx∧dy)=ρ_t dx∧dy,
g_t=ρ_t−1, and bar_g_t(y)=∫_0^1g_t(x,y)dx. Set `a_t(y)=−∫_0^y bar_g_t(r)dr`,
`b_t(x,y)=∫_0^x(g_t(s,y)−bar_g_t(y))ds`, `β_t=a_t dx+b_t dy`. Total area gives a_t(0)=a_t(1)=0, b_t
is periodic, and dβ_t=(ρ_t−1)dx∧dy. For the auxiliary parameter s interpolate the POSITIVE two-forms
ω_(t,s)=(1+s(ρ_t−1))dx∧dy. The field ι_Xω_(t,s)=−β_t is tangent to both boundary circles because its
y-component vanishes there. Extend smoothly to a common open collar and cut off away from A. DG3's
time-dependent flow and boundary invariance by uniqueness give its full s-flow ψ_(t,s), smooth in t.
The map k_t=h_t∘ψ_(t,1) preserves area. At t=0,1 the density is1, β_t=0, so ψ_(t,1)=id and the
endpoints remain id,f. This explicit boundary-tangent construction supplies the boundary case; the
compact-boundaryless global Moser theorem is not applied unchanged. Adjust the lifted path by an
integer rigid-rotation loop if necessary so its endpoint is exactly the specified F, then retain
that lift throughout.

In the C¹ topology, continuity on the compact path interval gives a finite partition such that each
increment lies in a prescribed small identity neighborhood U. Fix a shear R_c(x,y)=(x+cy,y), c>0.
For U sufficiently small, H∈U implies N=R_c⁻¹H has N_Xx>0 and N_Xy<0 throughout A, while R_c has
X_x=1 and X_y=c>0. Thus each increment is R_c∘N, and the exact lifted composition is F=F_(2K)⋯F_1,
K≥1, with odd factors negative twist, even factors positive twist, and EVERY factor X_x>0. All
factors preserve area and both boundaries. Prove these uniform derivative inequalities from C¹
closeness; the generic fact that twist maps are open alone does not install X_x>0.

For each factor the coordinate map (x,y)↦(x,X_k(x,y)) is a global diffeomorphism from the strip onto
its boundary-graph band, with the chosen smooth extension near the closed band. The form YdX−ydx is
closed. Its period under simultaneous integer translation is zero: on the lower boundary y=Y=0 it
vanishes on tangent vectors. Path integration on the simply connected band supplies S_k, and that
zero period makes S_k(x+1,X+1)=S_k(x,X). Expose smoothness up to an open neighborhood of the closed
admissible band and the derivative equations. This proves the required exactness and finite global
generating functions on the actual closed bands and their collar neighborhoods.
First construct S_k on the closed band and prove smoothness up to its boundary;
then extend S_k periodically to an open band, retaining its mixed-derivative sign
by shrinking. Its generating equations there can define a symplectic collar
extension agreeing with the factor on the closed strip. An arbitrary initial
collar extension of the factor is not assumed area-preserving outside that strip.

### I5.2. Finite action, quotient and periodic-orbit dictionary

Use cyclic configurations (x_1,…,x_(2K)), x_(2K+1)=x_1, in the common open domain of the S_k, modulo
simultaneous integer translation of all positions. The quotient is an open subset of
ℝ^(2K)/ℤ≅S^1×ℝ^(2K−1), with the explicit coordinates (x_1 mod1,x_2−x_1,…,x_(2K)−x_1). Define
W=ΣS_k(x_k,x_(k+1)), a smooth function on that quotient. The diagonal integer quotient is necessary
for compactness and for counting marked fixed points correctly. The inherited Euclidean metric on
position space is deck invariant and descends to the metric used for −grad W.

For every configuration put y_k=−∂_1S_k and Y_k=∂_2S_k. Then F_k(x_k,y_k)=(x_(k+1),Y_k). Criticality
is exactly Y_(k−1)=y_k at every k, hence precisely a zero-displacement fixed point of F with all
intermediate factor states admissible. Conversely the successive factor states of such a fixed point
are unique. Prove this gives a bijection after the diagonal deck quotient, so two critical points
imply two distinct phase-space fixed points. Do not count different lifts of one point or different
cyclic markings as distinct orbits.

### I5.3. The actual compact block and all face directions

Let P be the closed admissible configurations 0≤y_k≤1. Compactness follows after the diagonal
quotient: x_1 lies on S^1 and every successive displacement X_k(x_k,y_k)−x_k is uniformly bounded on
its compact periodic strip. All boundary/generating functions extend to an open neighborhood of P.
There, multiply −grad W by a compactly supported smooth cutoff equal1 near P and extend by zero in
S^1×ℝ^(2K−1). DG3.3 supplies a complete flow; the dynamics on P are unchanged. Only Crit(W) in
Inv(P) is counted.

At a face y_k=c∈{0,1}, boundary preservation gives Y_k=c. Let B_k(x)=X_k(x,c); B_k′>0.
Differentiating c=−∂_1S_k(x,B_k(x)) gives S_11=−S_12 B_k′ at that face. Also S_12=−1/(X_ky), so it
is negative for even factors and positive for odd ones. Along negative gradient,
`ydot_k=S_11(Y_(k−1)−y_k)+S_12(Y_k−y_(k+1))`. For a positive factor this points weakly inward on
BOTH faces; for a negative factor it points weakly outward. Equality occurs exactly when BOTH
neighboring incoming momenta equal the same c: Y_(k−1)=c iff y_(k−1)=c because the preceding factor
is a boundary-preserving diffeomorphism. Evaluate these derivatives at the stated action-coordinate
pair.

Prove the edge cases, not only open faces. Take a maximal cyclic run of inputs equal to c. It cannot
be the full cycle, since that would give a fixed lift on the corresponding boundary, contradicting
the strict boundary inequality. If the run has a negative-factor endpoint, its outward derivative is
strict. If both endpoints are positive-factor inputs and the run contains a negative-factor input,
an adjacent negative input has zero first derivative but a strict outward SECOND derivative. Indeed
on a boundary face dY_j=(1/B_j′)dy_j; at a negative face with zero first derivative the
coefficient-derivative terms vanish, giving `yddot_k=S_11 ydot_(k−1)/B_(k−1)′−S_12 ydot_(k+1)`. Its
neighboring positive-face derivatives have the inward sign, one strict at a run endpoint, giving the
claimed strict outward acceleration. If the boundary point has only positive-factor faces, each has
strict inward derivative, so the reverse flow exits. Thus every boundary point exits in at least one
time direction, and the closed positive exit set is EXACTLY `L={x∈P : y_k=0 or1 for some odd k}`.
Prove the Taylor-sign statements in a common smooth extension neighborhood. No critical point lies
on the boundary. Establish the regular index-pair/exit-collapsed semiflow data of [MorseTheory
M4.2](../../MorseTheory/README.md#m42-isolating-gradient-cup-bound): first exit is immediate on L;
its time tends to0 for points of P approaching L by the strict first/second-order exit; away from L
all active positive faces are strictly entering, and every positive-time trajectory before its first
exit is interior. An interior trajectory's first finite exit cannot have only second-order outward
tangencies: such a face is outside for both sufficiently small positive and negative time about that
event, contradicting its first-exit property. Therefore some active odd face has strict first-order
outward derivative at every first finite exit reached from the interior. The implicit function
theorem and compact-time interior margin give continuity of that exit time away from L. At L, for
every small positive reference time the actual trajectory is already strictly outside P; continuous
dependence makes nearby points exit by that time, so their exit times tend to0. At an inflow point
with no odd face active, every active positive face is strictly inward, giving a common initial
interior segment for nearby points of P. These statements also give lower semicontinuity at infinite
exit time. Prove the corresponding joint quotient-flow continuity, including time0/basepoint, from
these estimates and compactness. This supplies the typed survivor/excision hypotheses; the raw image
Φ^t(P) is not used as a subset of P.

### I5.4. Pair deformation and the correct shifted cup module

Use (x_1,y_1,…,y_(2K)) to reconstruct successive positions by X_k and impose the single equation
G=x_(2K+1)−x_1=0. Put u for the K even (positive) incoming momenta and v for the K odd (negative)
momenta. Since EVERY X_kx>0, the chain rule gives ∂G/∂u_i>0 and ∂G/∂v_i<0. At all inputs0,
G=F^x(x_1,0)−x_1<0; at all inputs1 it is G=F^x(x_1,1)−x_1>0. Thus for each (x_1,v),
G(x_1,0,v)<0<G(x_1,1,v). The unique diagonal root u=t(x_1,v)·1 lies in the open positive cube and
depends smoothly/periodically on (x_1,v).

Construct an explicit strong deformation retraction of each positive-input level fiber to that root.
For u with G=0, first interpolate a_s=(1−s)u+s t·1. Choose τ∈[−1,1] such that
G(x_1,clamp(a_s+τ·1,0,1),v)=0, using the endpoint signs and the intermediate value theorem. Although
τ can have a plateau at a vertex, the resulting VECTOR is unique: increasing τ makes every
coordinate nondecreasing, and any strict coordinate increase strictly increases G. Continuity
follows by compactness of [−1,1], subsequences and uniqueness of that vector. At s=0 it is u, at s=1
it is t·1, and the root remains fixed throughout. The construction preserves (x_1,v) and is periodic
in x_1. Therefore it is a homotopy equivalence of PAIRS `(P,L) ≃ (S^1×[0,1]^K, S^1×∂([0,1]^K))`,
commuting with the circle projection. This proves the pair/module comparison for every K. In
particular the relative orientation class has degree K.

Choose v_0 in the open negative cube. The root section at v_0 embeds a circle P_0⊂P, and α:P→P_0
given by x_1 is a retraction. [AlgebraicTopology's compact-metric Čech
supplement](../../AlgebraicTopology/README.md#compact-metric-cech-closed-pairs)'s Čech pair homotopy
invariance, ENR-model comparison and relative cube product supply u∈H^K(P,L;ℝ) with shifted
isomorphisms H^j(P_0;ℝ)→H^(j+K)(P,L;ℝ), v↦u cup α*v; identify the chosen relative cube orientation
and the Koszul sign (−1)^(Kj) when changing cup order in degree j. [MorseTheory
M4.2](../../MorseTheory/README.md#m42-isolating-gradient-cup-bound)'s actual survivor/index-pair
Floer injection then gives H*(S^1)→H*(Inv(P)), and its arbitrary-degenerate gradient count gives at
least two distinct critical points. I5.2 converts them to the required two fixed points. Each
topology, flow, relative-cup and orbit-dictionary construction is a required part of the theorem;
prove the stated maps and identities on the constructed carriers.

Acceptance: for F(x,y)=(x+(2y−1)/8,y), take c=1 and K=1. With d=x_2−x_1, derive −7/8≤d≤−1/8 and
W(d)=1/32−(d+1/2)^2/6. The descended Euclidean negative gradient has d′=(2/3)(d+1/2), so both
endpoints exit and the relative orientation degree is 1. Verify the action, face, pair and counting
formulas on this example and on the general strict-twist construction. Fixed points of an iterate
are phase points; a separate orbit-count argument is required for claims about geometrically
distinct periodic orbits.

## Acceptance and order

I5 consumes C3's generating calculus, I2.0's independent period-one circle,
DifferentialGeometry's complete parameter flows, the named surface isotopy
comparisons, AT's compact-metric Čech supplement and Morse M4.2. Its
factorization and finite action precede its block/pair/cup argument.

I2.0 is independent of I1. I1 and I2.0 precede the Liouville–Arnold construction in I2; I3 consumes
cotangent geometry and Hamiltonian foundations; I4 consumes I1–I3 and reduction as needed. Verify every action-angle chart by pulling back ω and differentiating H, not only
identifying fibers topologically. Verify the free-particle generating function, oscillator period lattice,
central-force radial Hamiltonian and conservation, Kepler action and pendulum monodromy. Dense
regularity is part of system data; a theorem at one regular point does not establish it.

## References

Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
§18.4; Arnold, *Mathematical Methods of Classical Mechanics*, central forces and integrability chapters;
Duistermaat, *On global action-angle coordinates*, Comm. Pure Appl. Math. 33 (1980), 687–706;
Marsden–Ratiu, *Introduction to Mechanics and Symmetry*, Lagrangian/Legendre and Noether theory.
