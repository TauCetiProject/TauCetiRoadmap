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

## Acceptance and order

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
