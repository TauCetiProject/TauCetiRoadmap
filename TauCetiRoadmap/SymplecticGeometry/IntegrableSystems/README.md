# Completely integrable systems and classical mechanics

Build commuting-integral geometry and local action-angle coordinates, together with cotangent
mechanics that uses them. The library should distinguish local regular fibers, compact Liouville tori,
period lattices and global monodromy. The Hamiltonian, Lagrangian and reduced descriptions of a
mechanical system must be related by proved maps and equations.

## Setting and dependencies

Use [family conventions](../README.md): real finite-dimensional smooth boundaryless manifolds,
ω=−dλ, ι_XHω=dH, {f,g}=df(Xg). For singular central potentials the phase space is the cotangent
bundle of the **punctured** configuration space; collision is not a smooth point. Hamiltonian vector
fields, conservation and brackets are used in the family convention, on this roadmap's own
carrier `bracketValue`, with flows from DifferentialGeometry Layer 3; cotangent forms and canonical transformations from [CotangentLagrangian](../CotangentLagrangian/README.md),
regular quotients from [HamiltonianReduction](../HamiltonianReduction/README.md), and torus/lattice API
from [ConvexityToric Layer 1 (1.1)](../ConvexityToric/README.md#layer-1-compact-symplectic-actions-and-local-models).
LieGroups supplies the exponential floor, HopfRinow the inverse function theorem, and
DifferentialGeometry Frobenius, complete flows and integration of one-forms.
SmoothBundlesConnections B1.0 supplies regular fibres with tangent space ker df
(`exists_regularFiber_smoothEmbedding`), and SmoothBundlesConnections also supplies bundle
connections and Ehresmann theory; singular-system examples below build their own monodromy rather
than silently assuming global angle coordinates. I5 treats the closed annulus through open collar
extensions; its finite-action gradient flow lives on the boundaryless configuration quotient. I5
owns the annulus isotopy theorem (I5.1), the compact-pair Čech theory with its Alexander–Spanier
comparison (I5.4), the index-pair data of its block (I5.3) and the Conley–Zehnder injectivity and
cup-length statements (I5.4): no roadmap on main states them.

## I1. Involutive functions and regular fibers

Define an n-tuple f=(f₁,…,fₙ) of smooth functions on a 2n-dimensional symplectic manifold, pairwise
Poisson commuting and with independent differentials on a dense open regular set. Independence means
surjectivity of df_x:T_xM→Rⁿ at each point, invariant under reparametrization and canonical transformations. A Hamiltonian
H belongs to the system when it Poisson-commutes with every fᵢ; prove local H=h(f) in a connected submersion chart. On the saturated neighborhood of I2 prove
H=h(f) by transitivity on its connected fibers; arbitrary disconnected fibers do not give global
factorization.

For k≤n independent involutive functions prove regular common levels have tangent ker df
(SmoothBundlesConnections B1.0), symplectic orthogonal spanned by X_fi, hence are coisotropic; derive the k≤n bound. For k=n they are
Lagrangian and the Hamiltonian fields span their tangent spaces; `IntegrableSystem` packages the
system data, with the bracket `bracketValue` evaluated on the Hamiltonian field
`chosenHamiltonianField` of the family convention, and `regularLevel_lagrangian` states the
Lagrangian conclusion at a regular point. Prove commuting flows wherever their
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
geodesic flow is the kinetic Hamiltonian flow via Legendre and the Levi–Civita connection of [HopfRinow](../../../Completed/HopfRinow/README.md).

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
  moment map, {H,L}=0 (`centralForce_commutes`, for `planarCentralHamiltonian` and
  `planarAngularMomentum` on the punctured domain), functional independence precisely away from p_r=0 and V_ℓ′(r)=0 simultaneously,
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
  Use the rotation-form/residue computation of [Efstathiou–Giacobbe–Mardešić–Sugny](https://arxiv.org/abs/1608.01579),
  §II.A–II.C and §III.B, building its first-return/rotation-number lemma and evaluating the three
  polar orbits P₊, P₋, P₀ of its spherical-pendulum loop, of which P₋ and P₀ cancel.
  Use the stated (h,j) orientation: the continuous lift of Θ decreases by 2π around
  the loop, so the closing −Θ segment gains a positive J-orbit.
  This supplies the nonlinear monodromy proof; the quadratic focus-focus Hessian alone does not.
  Conclude failure of global action-angle coordinates around this value.

## I5. The strict annulus fixed-point theorem

Prove the following theorem with the constructions below; it is the Poincaré–Birkhoff theorem for
smooth area-preserving maps (Le Calvez–Wang, Thm. 1, p. 704, state it for area-preserving
homeomorphisms), proved here by the generating-function and isolating-block route of
Conley–Zehnder (Invent. Math. 73 (1983), pp. 33–49). Let A=(ℝ/ℤ)×[0,1], let ω be a smooth
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

Construct compatible smooth extensions to open collars of the closed annulus. Extend the periodic coordinate functions using boundary charts and a periodic partition of unity; the inverse derivative identity at the boundary and the inverse function theorem give local inverses. Compactness on the annulus quotient and injectivity on the closed annulus give injectivity after shrinking the collars. Lift this collar diffeomorphism to the strip. Use the native `CircleDeg1Lift` translation-number API for the boundary lifts and prove the displacement/translation-number comparison above. `strict_annulus_two_fixed_points` states the lifted form on actual open partial homeomorphisms of the plane: the lift F on the
closed `strip`, with the two fixed points taken in the half-open `interiorFundamentalDomain` so
that they are distinct annulus points, a smooth positive T-periodic density ρ on the strip with ρ(F(p))·det DF_p=ρ(p), the boundary identities and the strict displacements. The constant density is the standard-area case, and I5.0 reduces every density to it.

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

**Checks.**
- The constant density ρ≡1 gives s≡1, a=1 and (u,v)=(x,y): the normalization is the identity.
- The density ρ=1+y gives s=3/2, a=3/2, u=x and v=(2y+y²)/3, with v(x,0)=0, v(x,1)=1 and
  a du∧dv=(1+y)dx∧dy=ω; omitting the factor a gives (2/3)(1+y)dx∧dy, which is not ω.
- For the shear R_c(x,y)=(x+cy,y), c>0, the generator in this convention is S=(X−x)²/(2c):
  y=−∂_1S=(X−x)/c and Y=∂_2S=(X−x)/c=y. With C3's convention p=d_1S the same S would give
  y=−(X−x)/c, the wrong sign; the two conventions differ exactly by the sign of S.

### I5.1. Smooth area-preserving isotopy and finite twist factorization

Construct an isotopy through orientation-preserving, boundary-component-preserving smooth
diffeomorphisms from id to f. Prove here that every orientation-preserving smooth
diffeomorphism of the closed annulus preserving each boundary component is smoothly isotopic to the identity through such
diffeomorphisms (Epstein, Acta Math. 115 (1966), Thm. 6.4; Gramain, Ann. Sci. ÉNS 6 (1973),
Thm. 1, pp. 53–54, records that the diffeomorphisms of the annulus homotopic to the identity
have the homotopy type of O(2), whose identity component consists of exactly these maps). Route.
Lift the two boundary maps of f to increasing degree-one maps b_±:ℝ→ℝ. The interpolation
`B_t(x,y)=((1−t)x+t((1−y)b_−(x)+y b_+(x)), y)` has positive x-derivative, commutes with T and
preserves both boundary lines, so it is a boundary-preserving isotopy from the identity to a
diffeomorphism B_1 with the boundary maps of f; then g=B_1⁻¹∘f fixes the boundary pointwise. Lift
g to G on the strip, commuting with T and fixing the lower boundary line pointwise; G is then a
lift of the identity on the upper boundary circle, so it translates the upper line by an integer
m. The image under G of the segment {0}×[0,1] is a properly embedded arc from (0,0) to (m,1);
composing with the inverse of the twist τ^m, τ(x,y)=(x+y,y), gives τ^(−m)∘G, which fixes both
boundary lines pointwise and sends the segment to an arc from (0,0) to (0,1), which is isotopic to the segment relative to its endpoints through properly embedded arcs
(Epstein's arc theorems). Extend this arc isotopy, together with its T-translates, to an ambient
isotopy of the strip fixing both boundary lines, by integrating a compactly supported T-periodic
time-dependent vector field that extends the arc velocities (DifferentialGeometry Layer 3, 3.5).
The result fixes the boundary lines and the segment pointwise, hence restricts to a diffeomorphism
of the closed square [0,1]² fixing its boundary pointwise. Prove that such a diffeomorphism of the
square is isotopic rel boundary to one equal to the identity near the boundary: at a point of an
edge, in (tangent, normal) coordinates, its derivative is upper triangular with tangential entry 1
and positive normal entry, so its convex combination with the identity has positive determinant
along the boundary and, cut off to a thin collar, stays a diffeomorphism. Smale's theorem (Smale, Proc. AMS 10
(1959), Thm. B, p. 621: diffeomorphisms of the square which are the identity near the boundary
form a contractible space) then gives an isotopy to the identity through such diffeomorphisms; it
transfers to the strip by T-equivariance and descends to the annulus. Finally the twist τ^m is
isotopic to the identity through boundary-component-preserving diffeomorphisms by
τ_s(x,y)=(x+smy,y), s from 1 to 0, which rotates the upper boundary circle. Concatenate the pieces
and smoothly reparametrize. *Needs:* DifferentialGeometry Layer 3 (3.2 maximal flows, 3.3
completeness of compactly supported fields, 3.5 time-dependent flows); Smale's theorem; Epstein's
arc and isotopy theorems.

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
vanishes on tangent vectors. Path integration on the simply connected band from a base point on the
lower boundary graph {(x,X_k(x,0))} supplies S_k; along that graph y=Y=0, so the form vanishes on
its tangent vectors and S_k≡0 there, which fixes the additive constant of every S_k. That zero
period makes S_k(x+1,X+1)=S_k(x,X). Expose smoothness up to an open neighborhood of the closed
admissible band and the derivative equations. This proves the required exactness and finite global
generating functions on the actual closed bands and their collar neighborhoods.
First construct S_k on the closed band and prove smoothness up to its boundary;
then extend S_k periodically to an open band, retaining its mixed-derivative sign
by shrinking. Its generating equations there can define a symplectic collar
extension agreeing with the factor on the closed strip. An arbitrary initial
collar extension of the factor is not assumed area-preserving outside that strip.

**Checks.**
- For F(x,y)=(x+(2y−1)/8,y) and c=1 the factor N=R_1⁻¹F=(x−(6y+1)/8,y) has N_Xx=1>0 and
  N_Xy=−3/4<0, so F=R_1∘N is a factorization with K=1. With c=1/8 instead, N=(x+(y−1)/8,y) has
  N_Xy=+1/8: a shear smaller than the increment's twist does not factor it, so the partition must
  be fine relative to the chosen c.
- The generator of that N, normalized on the lower boundary graph X=x−1/8, is
  S_1(x,X)=−(2/3)(x−X)²+(x−X)/6−1/96, with S_12=4/3=−1/N_Xy; the generator of R_1, vanishing on
  X=x, is S_2(x,X)=(X−x)²/2 with S_12=−1=−1/R_Xy. Dropping the normalization changes S_1 by 1/96
  and every action value of I5.2 by the same constant.
- For the density ρ_t=1+ε sin(2πx), |ε|<1, the Moser data are bar_g_t=0, a_t=0 and
  b_t=ε(1−cos 2πx)/(2π), periodic, with dβ_t=ε sin(2πx)dx∧dy=(ρ_t−1)dx∧dy; the field has zero
  y-component everywhere, so it is tangent to both boundary circles. Defining the field by
  ι_Xω_(t,s)=+β_t instead of −β_t gives d/ds(ψ_(t,s)^*ω_(t,s))=ψ_(t,s)^*(2dβ_t)≠0, so ψ_(t,1)
  pulls ω_(t,1) back to (1+2ε sin(2πx))dx∧dy+O(ε²) instead of dx∧dy: the sign in ι_Xω=−β_t is
  what makes the Moser flow correct the density rather than double its defect.

### I5.2. Finite action, quotient and periodic-orbit dictionary

Use cyclic configurations (x_1,…,x_(2K)), x_(2K+1)=x_1, in the common open domain of the S_k, modulo
simultaneous integer translation of all positions. The quotient is an open subset of
ℝ^(2K)/ℤ≅S^1×ℝ^(2K−1), with the explicit coordinates (x_1 mod1,x_2−x_1,…,x_(2K)−x_1). Define
W=ΣS_k(x_k,x_(k+1)), a smooth function on that quotient. The diagonal integer quotient is necessary
for compactness and for counting marked fixed points correctly. The inherited Euclidean metric on
position space is deck invariant and descends to the metric used for −grad W.

For every configuration put y_k=−∂_1S_k(x_k,x_(k+1)) and Y_k=∂_2S_k(x_k,x_(k+1)), so that
F_k(x_k,y_k)=(x_(k+1),Y_k). CotangentLagrangian C3.1's chain dictionary supplies the bijection
between the critical configurations of a cyclic action and the fixed points of the composite whose
every intermediate state is admissible; instantiate it with the base ℝ, the generators −S_k of
I5.0 and the composite F=F_(2K)∘⋯∘F_1, so that its critical equations read Y_(k−1)=y_k at every
k. Own here only what the dictionary does not say: W and the dictionary descend to the diagonal
ℤ-quotient, where the dictionary is injective on (x_1 mod1, y_1), so two critical points of W on
the quotient give two distinct zero-displacement fixed points of F on the annulus. Different lifts
of one point or different cyclic markings are not distinct points.

**Checks.**
- For the K=1 example of I5.1, with d=x_2−x_1, the admissible band is −7/8≤d≤−1/8 and
  W(d)=S_1(x_1,x_2)+S_2(x_2,x_1)=1/32−(d+1/2)²/6; its critical set is the circle d=−1/2, where
  y_1=−(4/3)d−1/6=1/2, matching the circle of fixed points {y=1/2} of F. Without the I5.1
  normalization the constant 1/32 becomes 1/24.
- W is invariant under the diagonal translation (x_1+1,x_2+1) but not under translating x_2 alone,
  since S_1 depends on x_1−x_2; only the diagonal quotient carries W.
- The momentum y_1=−(4/3)d−1/6 lies in [0,1] exactly for d in the admissible band; with C3's sign
  of S the same formula would give negative momenta throughout the band.

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
on the boundary. Establish here the index-pair data of the cut-off flow Φ on the pair (P,L): first exit is
immediate on L;
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
these estimates and compactness. The exit time τ:P→[0,∞], continuous in this sense with τ=0
exactly on L, is the input of the injectivity lemma of I5.4; the raw image Φ^t(P) is not used as
a subset of P.

**Checks.**
- In the K=1 example, y_2=−d∈[1/8,7/8] on P, so the even faces are inactive; the descended
  negative gradient is d′=(2/3)(d+1/2), hence ydot_1=−(8/9)(d+1/2) equals −1/3 at d=−1/8 (the face
  y_1=0) and +1/3 at d=−7/8 (the face y_1=1), both outward. So L is both boundary circles of the
  band and the relative orientation degree is 1. With C3's sign of S both derivatives would point
  inward, L would be empty and the pair class of I5.4 would vanish.
- At y_k=0 for an even factor (S_12<0) the formula gives ydot_k=S_12(−B_k′Y_(k−1)−y_(k+1))≥0,
  into y_k≥0; for an odd factor (S_12>0) the same expression is ≤0, outward. The identity
  S_11=−S_12B_k′ is what makes the two terms combine with one sign.
- All inputs y_k=0 would be a lifted fixed point on the lower boundary, excluded by F^x(x,0)<x; in
  the K=1 example y_1=0 forces d=−1/8 and then y_2=1/8≠0.

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
given by x_1 is a retraction. The cohomology throughout is Čech cohomology with real coefficients.
CharacteristicClasses C1.2b supplies the Čech cohomology of a topological space with constant
coefficients as the colimit over open covers, its homotopy invariance and its cup-compatible
comparison with singular cohomology on closed CW pairs. Own here its compact-pair theory: for
compact metric pairs (X,A) the relative groups Ȟ^*(X,A;ℝ), the exact sequence of the pair,
homotopy invariance for maps of pairs, excision for closed covers X=A∪B (Ȟ^*(X,A)≅Ȟ^*(B,A∩B)),
continuity for a compact subset S⊂X (a class of Ȟ^*(X) vanishing on S vanishes on a closed
neighborhood of S), and the relative cup product Ȟ^j(X)⊗Ȟ^k(X,A)→Ȟ^(j+k)(X,A) with its
naturality under maps of pairs. Prove these as Spanier's theorems for Alexander–Spanier
cohomology (Spanier, Algebraic Topology, Ch. 6, §§6.6–6.9) and own the transport: the natural
isomorphism, for compact Hausdorff pairs (X,A) with A closed, between the open-cover Čech
cohomology of C1.2b and Alexander–Spanier cohomology, compatible with maps of pairs and with cup
products, so that every statement above holds for the groups of C1.2b. On the model pair (S^1×[0,1]^K,S^1×∂[0,1]^K) the comparison
identifies these with AlgebraicTopology's singular products (Stage 6, the absolute-relative module
action) and its Künneth isomorphism over the field ℝ (Stage 5). Transporting the pair homotopy
equivalence above, obtain u∈Ȟ^K(P,L;ℝ), the pullback of the generator of
H^K([0,1]^K,∂[0,1]^K;ℝ), such that v↦u∪α^*v is an isomorphism Ȟ^j(P_0;ℝ)→Ȟ^(j+K)(P,L;ℝ) for
every j; identify the chosen relative cube orientation and the Koszul sign (−1)^(Kj) when changing
cup order in degree j.

Prove the two flow-theoretic statements that the count rests on (Conley–Zehnder, Invent. Math. 73
(1983), pp. 33–49, whose torus argument they are). Let Φ be the complete cut-off flow of I5.3,
S=Inv(P) the maximal invariant subset of P, and L the exit set. First, the injectivity lemma: if
cup product with a class u∈Ȟ^K(P,L) is an isomorphism Ȟ^j(P)→Ȟ^(j+K)(P,L) for every j, then
restriction Ȟ^*(P)→Ȟ^*(S) is injective. Route: for t≥0 let N_t be the points whose forward orbit
stays in P for time t and E_t those leaving by time t, closed sets with P=N_t∪E_t; the map r_t
sending p to its position at time min(t,τ(p)), with τ the exit time of I5.3, is continuous, maps L
to L and E_t to L, and is homotopic to the identity as a map of pairs (P,L)→(P,L). So the pair
inclusion (P,L)→(P,E_t) is a left inverse of r_t up to homotopy; for v∈Ȟ^j(P) vanishing on N_t,
u∪v=j^*(r_t^*u∪v), and r_t^*u∪v lies in Ȟ^*(P,E_t)≅Ȟ^*(N_t,N_t∩E_t), where it restricts to
(r_t^*u)|∪(v|_(N_t))=0 by naturality; hence u∪v=0, v=0, and Ȟ^*(P)→Ȟ^*(N_t) is injective.
Continuity passes to S^+=∩_t N_t, the points whose forward orbit stays in P. For the step from S^+
to S: every ω-limit set of a point of S^+ lies in S, so by compactness Φ^t maps S^+ into any
prescribed neighborhood of S in S^+ for t large; Φ^t on S^+ is homotopic to the identity, so a class
vanishing on S, hence on that neighborhood by continuity, vanishes on S^+. Second, the cup-length
bound: a flow on a compact metric space S with a continuous Lyapunov function strictly decreasing
along every nonconstant orbit has at least cl(Ȟ^*(S;ℝ))+1 rest points, where the cup length cl is
the largest ℓ with a nonzero ℓ-fold product of positive-degree classes (0 if none). Route: the
Lusternik–Schnirelmann minimax over the sublevel sets of the Lyapunov function, with the
deformation lemma supplied by the flow and compactness, continuity to pass from a finite rest-point
set at a level to a neighborhood, and the standard argument that a repeated minimax level carries
infinitely many rest points. Here the Lyapunov function is W, the class of S^1 survives in Ȟ^1(S) by
the injectivity lemma, so cl(Ȟ^*(S))≥1 and W has at least two critical points in Inv(P); I5.2
converts them to the required two fixed points. Each topology, flow, relative-cup and
orbit-dictionary construction is a required part of the theorem; prove the stated maps and
identities on the constructed carriers. *Needs:* I5.2, I5.3; CharacteristicClasses C1.2b;
AlgebraicTopology Stages 5–6; DifferentialGeometry Layer 3.

**Checks.**
- In the K=1 example, G(x_1,u,v)=u−(6v+1)/8 with ∂_uG=1>0 and ∂_vG=−3/4<0; G(x_1,0,0)=−1/8 is
  F^x(x,0)−x and G(x_1,1,1)=1/8 is F^x(x,1)−x; the root t(v)=(6v+1)/8 lies in (0,1) for every
  v∈[0,1].
- For K=1 the pair is (S^1×[0,1],S^1×{0,1}), u is the class of ([0,1],{0,1}), and
  v↦u∪α^*v is an isomorphism Ȟ^0(P_0)→Ȟ^1(P,L) and Ȟ^1(P_0)→Ȟ^2(P,L) between one-dimensional
  spaces; the Koszul sign for j=1 is −1.
- Negative control for the injectivity lemma: for the flow ydot=1 on P=S^1×[0,1], L is the upper
  circle, Ȟ^*(P,L)=0, so the cup hypothesis fails for every u, and indeed Inv(P)=∅ has
  Ȟ^*(∅)=0.
- The cup-length bound is sharp: the gradient flow of the height function on S^1 has exactly
  2=cl(Ȟ^*(S^1))+1 rest points; the K=1 example has the whole circle d=−1/2 of rest points,
  infinitely many, consistent with the bound.

Acceptance: for F(x,y)=(x+(2y−1)/8,y), take c=1 and K=1. With d=x_2−x_1, derive −7/8≤d≤−1/8 and
W(d)=1/32−(d+1/2)^2/6 with the S_k normalized on their lower boundary graphs. The descended
Euclidean negative gradient has d′=(2/3)(d+1/2), so both endpoints exit and the relative
orientation degree is 1. Verify the action, face, pair and counting formulas on this example and
on the general strict-twist construction. The rigid rotation (x+1/4,y) is the negative control for
the hypothesis: it preserves area and both boundaries but displaces both boundary circles in the
same direction, and it has no fixed point. Fixed points of an iterate are phase points; a separate
orbit-count argument is required for claims about geometrically distinct periodic orbits.

## Acceptance and order

I5 consumes C3's generating calculus and C3.1's chain dictionary, I2.0's independent period-one
circle, DifferentialGeometry's complete parameter flows, CharacteristicClasses C1.2b's Čech
cohomology and AlgebraicTopology's singular products; it owns the annulus isotopy theorem, the
compact-pair Čech theory, the index-pair data and the Conley–Zehnder injectivity and cup-length
statements. Its isotopy, factorization and finite action precede its block/pair/cup argument.

I2.0 is independent of I1. I1 and I2.0 precede the Liouville–Arnold construction in I2; I3 consumes
cotangent geometry and Hamiltonian foundations; I4 consumes I1–I3 and reduction as needed. Verify every action-angle chart by pulling back ω and differentiating H, not only
identifying fibers topologically. Verify the free-particle generating function, oscillator period lattice,
central-force radial Hamiltonian and conservation, Kepler action and pendulum monodromy. Dense
regularity is part of system data; a theorem at one regular point does not establish it.

## References

Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
§18.4; Arnold, *Mathematical Methods of Classical Mechanics*, central forces and integrability chapters;
Duistermaat, *On global action-angle coordinates*, Comm. Pure Appl. Math. 33 (1980), 687–706;
Marsden–Ratiu, *Introduction to Mechanics and Symmetry*, Lagrangian/Legendre and Noether theory;
Efstathiou–Giacobbe–Mardešić–Sugny, *Rotation forms and local Hamiltonian monodromy*, J. Math.
Phys. 58 (2017), [arXiv:1608.01579](https://arxiv.org/abs/1608.01579);
Le Calvez–Wang, [*Some remarks on the Poincaré–Birkhoff theorem*](https://www.ams.org/journals/proc/2010-138-02/S0002-9939-09-10105-3/),
Proc. AMS 138 (2010), 703–715, Thm. 1;
Conley–Zehnder, *The Birkhoff–Lewis fixed point theorem and a conjecture of V. I. Arnold*,
Invent. Math. 73 (1983), 33–49;
Smale, [*Diffeomorphisms of the 2-sphere*](https://www.ams.org/journals/proc/1959-010-04/S0002-9939-1959-0112149-8/),
Proc. AMS 10 (1959), 621–626, Thm. B;
Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. 115 (1966), 83–107, Thm. 6.4;
Gramain, [*Le type d'homotopie du groupe des difféomorphismes d'une surface compacte*](https://www.numdam.org/item/ASENS_1973_4_6_1_53_0/),
Ann. Sci. ÉNS 6 (1973), 53–66, Thm. 1;
Spanier, *Algebraic Topology*, Springer, Ch. 6 (Alexander–Spanier and Čech cohomology).
