# Roadmap: completely integrable systems and classical mechanics

**Summary.** A completely integrable system on a symplectic manifold (M, σ) of dimension 2n is a
smooth map F = (F₁, …, Fₙ) : M → ℝⁿ whose components Poisson-commute and whose differentials are
linearly independent on a dense set. This roadmap builds the geometry of such systems and the
classical mechanics that produces them, keeping apart four structures that are easily conflated:
the local regular fibres of F, the compact Liouville tori, the period lattices of the commuting
flows, and the global monodromy of those lattices. Manifolds are real, finite-dimensional, smooth
and without boundary; the cotangent form is ω = −dλ, Hamiltonian vector fields satisfy
ι_(X_f)σ = df, and {f, g} = df(X_g).

The first main theorem is the Liouville–Arnold theorem in action–angle form. Let F be an integrable
system on a Hausdorff symplectic manifold and L a compact connected component of a level of F at
every point of which dF is surjective; nothing is assumed of the other components of the level, nor
completeness of any flow. Then a neighbourhood of L is symplectomorphic to the product of an open
set of actions in ℝⁿ with the whole torus of angles, with the form Σ dθᵢ ∧ dIᵢ, and F depends on the
actions alone. The second is the global obstruction theory begun by Duistermaat: a proper Lagrangian
torus fibration over B is fibrewise symplectomorphic to the model T*B/Λ given by its period lattice
exactly when its Lagrangian class vanishes, and has global action–angle coordinates exactly when
moreover its monodromy is trivial, its period forms are exact and its action map is injective. The
spherical pendulum is the worked example: for a loop running counterclockwise around its focus–focus
value in the (h, j)-plane of energy and angular momentum, its monodromy fixes the cycle γ_J of the
rotation about the vertical axis and sends a second cycle γ₂ to γ₂ + γ_J, the matrix with rows
(1, 1) and (0, 1) in the basis (γ_J, γ₂).

The third theorem is the Legendre transform. For a smooth regular Lagrangian L on the tangent
bundle of a manifold, the Hamiltonian vector field of the energy for the Cartan form is second
order, so its integral curves are the velocity curves of solutions of the Euler–Lagrange equations;
if the Legendre map is bijective, it carries this field to the Hamiltonian vector field of the
transformed energy. The fourth is the Poincaré–Birkhoff theorem for smooth maps: an area-preserving
diffeomorphism of the closed annulus preserving each boundary circle, with a lift moving the two
boundary circles strictly in opposite directions, has at least two distinct fixed points for that
lift, with no twist condition inside. The proof follows Conley and Zehnder, through generating
functions, an isolating block and a cup-length bound in Čech cohomology.

The Tau Ceti library supplies integrable systems, the topological Liouville–Arnold theorem, smooth
circles of every positive period with their time forms, the Legendre map and many central-force
and oscillator computations. CotangentLagrangian supplies generating functions and the chain
dictionary between critical configurations and fixed points; SmoothBundlesConnections regular
fibres, Ehresmann's theorem and affine torus bundles; DifferentialGeometry flows and chain
integrals; CharacteristicClasses and AlgebraicTopology the cohomology of the annulus argument.
The layers below run from commuting integrals near regular and singular points, through the
circles of positive period, the local Liouville–Arnold theorem and the global theory of torus
fibrations, to mechanics, worked examples and the annulus theorem.

## How to read the build

Layer 1 fixes the objects, all of them Tau Ceti's (§1.1), and adds local commuting flows (§1.2),
the Carathéodory–Jacobi–Lie normal form (§1.3) and Williamson's classification of nondegenerate
singular points (§1.4). Layer 2 opens with §2.0, the smooth circles and families of circles of
positive period, which uses nothing of Layer 1 and is consumed both by the angle tori below and by
the suspension construction of the SymplecticGeometry family. §§2.1–2.5 prove the local
Liouville–Arnold theorem: the torus structure of a compact regular component without global
completeness, the saturated product neighbourhood, the smooth period lattice, action–angle
coordinates, and actions as periods. §§2.6–2.7 pass to proper Lagrangian torus fibrations, their
monodromy, Chern and Lagrangian classes, and the criteria for global action–angle coordinates.
Layer 3 needs only Tau Ceti's Legendre and cotangent API. Layer 4 consumes Layers 1–3. Layer 5 is
independent of Layers 1–4 apart from the unit-period circle of §2.0, and rests on
CotangentLagrangian's generating calculus. Each target's *Needs:* line lists what its statement
and its route use, so that a target proved another way is not blocked behind an unrelated section.

## Conventions

1. **Manifolds.** Real finite-dimensional smooth manifolds without boundary, modelled through
   Mathlib's `ModelWithCorners` and `IsManifold`, with `TangentSpace`, `mfderiv` and `Diffeomorph`.
   The SymplecticGeometry family works with Hausdorff second-countable manifolds; a statement that
   needs either hypothesis carries it, and the two statements of §3.1 hold without them. The closed
   annulus of Layer 5 is handled through open collar extensions and through its universal cover,
   the closed strip.
2. **Forms and brackets.** A two-form is Tau Ceti's `TauCeti.SmoothTwoForm I M`, symplectic when
   `TauCeti.SmoothTwoForm.IsSymplectic` holds. The Hamiltonian vector field of f is
   `TauCeti.SmoothTwoForm.hamiltonianVectorField`, X_f = (σ♭)⁻¹ df, so ι_(X_f)σ = df for a
   nondegenerate form on a finite-dimensional manifold; the Poisson bracket is
   `TauCeti.SmoothTwoForm.poissonBracket`, {f, g} = σ(X_f, X_g), which equals df(X_g) there
   (`TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_eq_mvfderiv`). With these conventions
   X_({f,g}) = −[X_f, X_g].
3. **Cotangent bundles.** The canonical form of a cotangent bundle is
   `TauCeti.CotangentBundle.symplecticForm`, ω = −dλ for the Liouville form
   `TauCeti.CotangentBundle.liouvilleForm`, λ_(q,p)(v) = p(dπ v), equal to Σ dqᵢ ∧ dpᵢ in bundle
   charts.
4. **Integrable systems.** An integrable system is Tau Ceti's
   `TauCeti.SmoothTwoForm.IsIntegrableSystem σ F`: F : M → (ι → ℝ) smooth, with pairwise
   Poisson-commuting components, regular points dense, and 2·|ι| = dim M. A point is regular when
   dF_x is surjective (`TauCeti.IsRegularPoint`); dense regularity is part of the data, and a
   statement at one regular point does not establish it. A function g is a first integral of f when
   {g, f} = 0 (`TauCeti.SmoothTwoForm.IsFirstIntegral`).
5. **Circles and tori.** The circle of period p > 0 is Mathlib's `AddCircle p` with quotient map
   q_p(t) = [t]_p and the smooth structure of §2.0. Angles have period 2π by default; the angle
   θ = 2πt/p on `AddCircle p` has dt_p = (p/2π) dθ. The angle torus is `Fin n → AddCircle p`;
   on its cotangent bundle the actions of a covector ξ are Iᵢ(ξ) = ξ(eᵢ), λ = Σ Iᵢ dθᵢ and
   ω = −dλ = Σ dθᵢ ∧ dIᵢ.
6. **Central potentials.** For a potential singular at the origin the configuration space is the
   punctured space and the phase space its cotangent bundle; a collision is not a smooth point of
   phase space.
7. **Lagrangians.** A Lagrangian is L : TQ → ℝ, with Legendre map FL : TQ → T*Q, energy
   E_L(v) = FL(v)(v) − L(v), Cartan forms θ_L = FL^*λ and ω_L = −dθ_L = FL^*ω, and Lagrangian
   vector field X_E defined by ι_(X_E) ω_L = dE_L, the Hamiltonian vector field of E_L for ω_L.
8. **Generating functions.** CotangentLagrangian Layer 3 writes the relation generated by S(q, Q)
   as p = ∂_q S, P = −∂_Q S. Layer 5 writes y = −∂₁S, Y = ∂₂S, so its generator is the negative of
   CotangentLagrangian's.
9. **Cohomology.** In Layer 5 cohomology is Čech cohomology with real coefficients, in the sense of
   CharacteristicClasses §1.2b, unless singular cohomology is named.
10. **Names.** The headline declarations live in
    `TauCetiRoadmap.SymplecticGeometry.IntegrableSystems`. A target without a declaration in
    `Suggested.lean` is named in prose.

## Layer 1: involutive functions and regular fibres

### 1.1 Integrable systems, first integrals and regular fibres

The objects of the roadmap are Tau Ceti's, and this section consumes them by name. An integrable
system is `TauCeti.SmoothTwoForm.IsIntegrableSystem` (Convention 4), and its regular points form a
dense open set (`TauCeti.SmoothTwoForm.IsIntegrableSystem.isOpen_setOf_isRegularPoint`). The rank
of F at x is `TauCeti.mfderivRank`; the regular points are those of maximal rank
(`TauCeti.isRegularPoint_iff_mfderivRank_eq`), the singular points are those of rank loss
(`TauCeti.not_isRegularPoint_iff_mfderivRank_lt`), and composition with a diffeomorphism on either
side preserves the rank (`Diffeomorph.mfderivRank_diffeomorph_comp`,
`Diffeomorph.mfderivRank_comp_diffeomorph`). A regular fibre of a smooth map is a smooth embedded
submanifold with tangent space ker dF (`TauCeti.exists_regularFiber_smoothEmbedding`, as recorded by
SmoothBundlesConnections B1.0).

For finitely many functions at a point x of a nondegenerate form: the symplectic orthogonal of
ker dF_x is the span of the X_(F_i) (`TauCeti.SmoothTwoForm.IsNondegenerate.orthogonal_ker_mfderiv`);
ker dF_x is coisotropic exactly when the F_i Poisson-commute at x
(`TauCeti.SmoothTwoForm.IsNondegenerate.isCoisotropic_ker_mfderiv_iff`); k Poisson-commuting
functions regular at a point of a 2n-manifold have k ≤ n
(`TauCeti.SmoothTwoForm.IsNondegenerate.two_mul_card_le_finrank`). For an integrable system,
ker dF_x is Lagrangian at a regular point
(`TauCeti.SmoothTwoForm.IsIntegrableSystem.isLagrangian_ker_mfderiv`) and is spanned by the
Hamiltonian vectors (`TauCeti.SmoothTwoForm.IsNondegenerate.ker_mfderiv_eq_span_hamiltonianVectorField`).
A Hamiltonian H belongs to the system when it Poisson-commutes with every Fᵢ; then H = h ∘ F near
each regular point, and on every open set of regular points whose fibres are connected
(`TauCeti.SmoothTwoForm.IsIntegrableSystem.exists_eventuallyEq_comp`,
`TauCeti.SmoothTwoForm.IsIntegrableSystem.exists_eqOn_comp`), in particular on the saturated
neighbourhood of §2.2; on disconnected fibres there is no global factorization. Integrability is
invariant under local diffeomorphisms pulling the form back to the form and under reparametrization
of the values (`TauCeti.SmoothTwoForm.IsIntegrableSystem.comp_isLocalDiffeomorph`,
`TauCeti.SmoothTwoForm.IsIntegrableSystem.comp_left`), and complete Poisson-commuting Hamiltonian
flows commute (`TauCeti.SmoothTwoForm.IsSymplectic.commute_globalFlowDiffeomorph`).
*Needs:* the Tau Ceti declarations named above.

**Checks.**
- The energy H = (q² + p²)/2 on ℝ² with ω = dq ∧ dp is an integrable system with one integral
  (`TauCeti.isIntegrableSystem_harmonicOscillator`): dH = q dq + p dp has rank 1 away from the
  origin and rank 0 at it. A definition asking for regularity at every point would exclude this
  system; the density requirement is what admits it.
- F = q₁ on ℝ⁴ with ω = dq₁ ∧ dp₁ + dq₂ ∧ dp₂ is regular everywhere and trivially involutive, but
  2·|ι| = 2 ≠ 4: its levels are three-dimensional, coisotropic (their symplectic orthogonal is
  spanned by X_(q₁) = −∂_(p₁), which is tangent to them) and not Lagrangian. A definition without
  the dimension clause would call one integral in two degrees of freedom integrable.

### 1.2 Commuting flows without completeness

Let f and g be smooth functions on a Hausdorff symplectic manifold with {f, g} = 0 on an open set
containing the points considered, and write φ^f and φ^g for the maximal flows of X_f and X_g.
Prove that the flows commute on rectangles: if s, t ∈ ℝ and φ^f_(s′)(φ^g_(t′)(x)) is defined for
every s′ between 0 and s and every t′ between 0 and t, then φ^g_(t′)(φ^f_(s′)(x)) is defined for all
such s′, t′, and φ^f_s(φ^g_t(x)) = φ^g_t(φ^f_s(x)). No completeness is assumed; Tau Ceti's theorem
is the complete case. The rectangle hypothesis cannot be weakened to the definedness of the two
composites alone (second Check). Route: X_({f,g}) = −[X_f, X_g] gives
[X_f, X_g] = 0, and DifferentialGeometry §3.4 plans the commuting-flow theorem for commuting vector
fields along maximal flows. *Needs:* DifferentialGeometry §3.4 (commuting flows), §3.2 (maximal
flows); Tau Ceti `TauCeti.SmoothTwoForm.hamiltonianVectorField`, `TauCeti.flowOf`.

**Checks.**
- On ℝ⁴ with ω = Σ dqᵢ ∧ dpᵢ, f = p₁ and g = p₂ have X_f = ∂_(q₁) and X_g = ∂_(q₂) (for instance
  ι_(∂_(q₁))(dq₁ ∧ dp₁) = dp₁), and both composites send x to x + s e₁ + t e₂.
- On the cotangent bundle of the universal cover of ℝ² ∖ {0}, the same f and g lift. From a point
  over (−1, −1), moving by 2 in q₁ and then by 2 in q₂, or in the other order, is defined along both
  routes (the sides of [−1, 1]² avoid the puncture), but the two routes enclose the puncture and end
  at different lifts of (1, 1); the rectangle hypothesis fails there, since the composite through
  (0, 0) is undefined. A version of the theorem quantified only over points where both composites
  are defined is false.

### 1.3 The Carathéodory–Jacobi–Lie normal form

Let f₁, …, f_k, with k ≤ n, be smooth functions on a symplectic manifold of dimension 2n, pairwise
Poisson-commuting on a neighbourhood of x₀, with linearly independent differentials at x₀. Prove
that there are Darboux coordinates (q₁, …, qₙ, p₁, …, pₙ) on a neighbourhood U of x₀, with
σ = Σ dqᵢ ∧ dpᵢ on U, in which pᵢ = fᵢ for i ≤ k: the k commuting functions are k momenta of a
canonical coordinate system, with conjugate variables q₁, …, q_k (Laurent-Gengoux–Miranda–Vanhaecke,
Thm. 2.1, p. 6, whose Poisson form leaves, for a symplectic form, a symplectic transversal factor
that Darboux puts in canonical form; Remark 2.2, p. 8, is the case k = n). This refines ordinary
Darboux; its proof combines the local Darboux theorem with Frobenius and the Hamiltonian
identities, and does not reprove Darboux. *Needs:* §1.2; Tau Ceti
`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` (local Darboux);
DifferentialGeometry Layer 4 (Frobenius).

**Checks.**
- f₁ = q₁ and f₂ = p₁ on ℝ⁴ are independent but {q₁, p₁} = 1, so they cannot both be momenta,
  which Poisson-commute: the commuting hypothesis is not removable.
- For k = n = 1, f = (q² + p²)/2 on ℝ² near (1, 0), the coordinates (θ, I) with I = f and θ the
  angle measured clockwise from the p-axis satisfy dq ∧ dp = dθ ∧ dI (the first Check of §2.4), so
  (q′, p′) = (θ, I) is a canonical chart with p′ = f; the counterclockwise angle gives
  dq ∧ dp = −dθ ∧ dI and is not canonical.

### 1.4 Singular points, nondegeneracy and Williamson's classification

At a point x of rank zero of an integrable system F, every Fᵢ is critical, its Hessian is a quadratic
form on T_xM, and the Hamiltonian endomorphisms A_(½ Hess Fᵢ(x)) ∈ sp(T_xM, σ_x) pairwise commute
(Tau Ceti `TauCeti.SymplecticForm.commute_fderiv_hamiltonianVectorField`, with the identification
of quadratic forms with sp(V, ω) `TauCeti.SymplecticForm.hamiltonianEndEquiv`). Define x to be
nondegenerate when these endomorphisms span a Cartan subalgebra of sp(T_xM, σ_x). Prove Williamson's
classification of Cartan subalgebras of sp(2n, ℝ): after a linear symplectic change of coordinates
such a subalgebra is spanned by k_e elliptic generators qᵢ² + pᵢ², k_h hyperbolic generators qᵢpᵢ
and k_f focus–focus pairs q₁p₁ + q₂p₂, q₁p₂ − q₂p₁ on disjoint symplectic coordinate planes, with
k_e + k_h + 2k_f = n, and the triple (k_e, k_h, k_f) is an invariant of the subalgebra. This is the
full Cartan-subalgebra statement, not the diagonalization of a single positive definite quadratic
form.

For a point x of rank r > 0, replace F by A ∘ F for some A ∈ GL(n, ℝ) (integrability is preserved,
`TauCeti.SmoothTwoForm.IsIntegrableSystem.comp_left`) so that dF₁(x), …, dF_r(x) are independent and
dF_(r+1)(x) = ⋯ = dFₙ(x) = 0. Let V = span{X_(F₁)(x), …, X_(F_r)(x)}, an isotropic subspace; V^σ/V
is symplectic of dimension 2(n − r). Prove that the Hessians of F_(r+1), …, Fₙ at x vanish on V, so
their restrictions to V^σ descend to V^σ/V, and that the descended Hamiltonian endomorphisms
commute; define x to be nondegenerate when they span a Cartan subalgebra of sp(V^σ/V), independently
of the choice of A, and classify these points by Williamson's theorem on V^σ/V, where
k_e + k_h + 2k_f = n − r (Miranda–Zung, §§2.1–2.3, pp. 3–4, for both definitions, the type and the normal
forms). *Needs:* §1.1; Tau Ceti `TauCeti.SymplecticForm.commute_fderiv_hamiltonianVectorField`,
`TauCeti.SymplecticForm.hamiltonianEndEquiv`; Mathlib `skewAdjointLieSubalgebra`.

**Checks.**
- On ℝ² with ω = dq ∧ dp: H = (q² + p²)/2 has X_H = (p, −q), eigenvalues ±i, elliptic; H = qp has
  X_H = (q, −p), eigenvalues ±1, hyperbolic. Each spans a Cartan subalgebra of sp(2, ℝ). A
  definition of nondegeneracy through positive definite Hessians accepts the first and wrongly
  rejects the second.
- On ℝ⁴, f₁ = q₁p₁ + q₂p₂ and f₂ = q₁p₂ − q₂p₁ Poisson-commute (f₁ is rotation invariant and f₂
  generates rotations); A_(f₁) acts by +1 on (q₁, q₂) and −1 on (p₁, p₂), A_(f₂) by the rotation
  (q₁, q₂) ↦ (−q₂, q₁) on both pairs, so a f₁ + b f₂ has eigenvalues ±a ± ib: a focus–focus point,
  with k_f = 1, which no product of elliptic and hyperbolic planes produces.
- H = q²/2 on ℝ² is critical along q = 0 with X_H = (0, −q), a nilpotent linearization: its span
  contains no nonzero semisimple element, so it is not a Cartan subalgebra and the origin is
  degenerate.

### Examples

The planar central-force energy–momentum map (H, L) of §4.2 is regular exactly off the circular
orbits and, for ℓ = 0, the rest points at critical points of V; at all these points it has rank
one, and the transversal reduction of §1.4 at a nondegenerate minimum of the effective potential
gives one elliptic block. The spherical pendulum of §4.4 has a
rank-zero elliptic–elliptic point at the bottom and a rank-zero focus–focus point at the top.

### Dependencies

Tau Ceti's integrable systems, first integrals, rank, regular fibres, linear involutive theory,
commuting complete flows and quadratic Hamiltonians; local Darboux; DifferentialGeometry Layer 3
(flows, §3.2 and §3.4) and Layer 4 (Frobenius). Nothing of Layers 2–5.

## Layer 2: Liouville–Arnold and action–angle coordinates

<a id="i20-positive-period-circles-and-families"></a>

### 2.0 Positive-period circles and families

This reusable foundation is independent of the integrable map of Layer 1. The carrier is Mathlib's
topological `AddCircle p`, for every real p > 0, with quotient map q_p(t) = [t]_p; it is a compact,
Hausdorff, second-countable space. The following
are Tau Ceti's and are consumed by name. The real line `TauCeti.PeriodLine p` carries the free,
properly discontinuous action of `Multiplicative ℤ` by n·t = t + np
(`TauCeti.PeriodLine.instIsCancelSMul`, `TauCeti.PeriodLine.instProperlyDiscontinuousSMul`), whose
orbit space is identified with `AddCircle p` (`TauCeti.PeriodLine.quotientDiffeomorph`). The atlas
`AddCircle.instIsManifold` has as charts local real lifts (`AddCircle.coe_apply_of_mem_atlas`), any
two of which differ near each point by a constant integer multiple of p
(`AddCircle.exists_eventuallyEq_add_zsmul`), so their transitions have derivative 1, and every local
real lift belongs to the maximal atlas (`AddCircle.mem_maximalAtlas_of_coe_apply`); q_p is a smooth
local diffeomorphism (`AddCircle.isLocalDiffeomorph_coe`) and a covering (Mathlib's
`AddCircle.isCoveringMap_coe`); `AddCircle.instLieAddGroup` is the Lie group; the translation flow
(s, [t]) ↦ [t + s] is complete and generated by the unit field (`AddCircle.translationFlow`,
`AddCircle.globalFlow_timeVectorField`); `AddCircle.orientation` is the orientation of the oriented
atlas. The time form `AddCircle.timeForm` is the unique form with q_p^*dt_p = dt
(`AddCircle.eq_timeForm_iff`); it is closed, nowhere zero, translation invariant, equal to the
differential of every local lift, equal to 1 on the unit field, of integral p over one circuit
(`AddCircle.pathIntegral_timeForm_coe`),
and multiplication by k ∈ ℤ pulls it back to k·dt_p (`AddCircle.mpullback_zsmul_timeForm`), with the
actual sign for k < 0. The rescaling `AddCircle.diffeomorphAddCircle`,
D_(p,q)([t]_p) = [(q/p)t]_q, is a diffeomorphism with derivative q/p
(`AddCircle.mfderiv_diffeomorphAddCircle`), D_(p,q)^*dt_q = (q/p)dt_p
(`AddCircle.mpullback_diffeomorphAddCircle_timeForm`), with its identity, inverse and composition
laws (`AddCircle.diffeomorphAddCircle_self`, `AddCircle.diffeomorphAddCircle_symm`,
`AddCircle.diffeomorphAddCircle_trans`), compatibility with addition and integer multiplication,
and orientation preservation. The torus `∀ i, AddCircle (p i)` has the product atlas
(`TauCeti.instIsManifoldPi`), the coordinate time forms `TauCeti.torusTimeForm` with their
coordinate-fibre restrictions, periods, reindexing and diagonal-rescaling laws, the volume form
`TauCeti.torusVolumeForm`, and the orientation `TauCeti.torusOrientation` with its permutation sign
law (`TauCeti.orientationSign_torusOrientation_reindex`). The total family `TauCeti.CircleFamily`,
the carrier {(p, x) : p > 0, x ∈ AddCircle p}, has the normalization N(p, x) = (p, D_(p,1)x) to
ℝ_(>0) × `AddCircle 1`, a smooth period projection, smooth fibre inclusions and retractions, the
representative map
Q(p, t) = (p, q_p(t)), a local diffeomorphism and covering, the forms β = (pr₂ ∘ N)^*dt₁
(`TauCeti.CircleFamily.angleForm`), η = p β (`TauCeti.CircleFamily.timeForm`) and dp ∧ η
(`TauCeti.CircleFamily.totalForm`) with dβ = 0, dη = dp ∧ β, i_p^*η = dt_p, Q^*η = dt − (t/p) dp
and its deck invariance, Q^*(dη) = p⁻¹ dp ∧ dt, η not closed although its fixed-fibre restrictions
are, the extension fixed by N (the fibre restrictions alone allow adding a pulled-back base
one-form), and the orientation `TauCeti.CircleFamily.orientation`. The families
`TauCeti.CircleFamily.Pullback p` over a base, for p : B → ℝ_(>0), have base change, open
restriction, fixed fibres, fibrewise rescaling `TauCeti.CircleFamily.Pullback.rescale` pulling η_q
back to (q/p)η_p, and their forms. One-forms are compared with sections of the cotangent bundle by
Tau Ceti's `TauCeti.SmoothForm.degreeOneEquiv`, under which dt_p is the constant section id
(`AddCircle.degreeOneEquiv_timeForm`). Generic smooth free and properly discontinuous quotients are
Tau Ceti's (`TauCeti.instIsManifoldQuotient`), and generic forms, wedge, exterior differentiation
and integration belong to DifferentialGeometry Layers 0–1 and §8.4.

Prove what those declarations do not contain.

- *The deck action of the total family.* ℤ acts on ℝ_(>0) × ℝ by n·(p, t) = (p, t + np). Prove
  that the action is free and properly discontinuous, that Q(z) = Q(z′) exactly when z′ = n·z for
  some n ∈ ℤ, and that Q identifies the orbit space with `TauCeti.CircleFamily` as topological
  spaces and as smooth manifolds, keeping the positive base.
- *The fibre atlas.* For p > 0, give the fibre of the period map over p the atlas transported from
  `AddCircle 1` through N. Prove that the fibre inclusion of `AddCircle p` is then a diffeomorphism
  that is the identity on points, so that the two maximal atlases agree, through D_(p,1).
- *Association and point factors.* Prove that the association map
  x ↦ (x 0, i ↦ x (i + 1)), from the torus indexed by `Fin (n + 1)` to the product of its first
  circle with the torus indexed by `Fin n`, and the identification of a torus with its product
  with the zero-dimensional torus (a point), are diffeomorphisms of the product atlases; that they
  pull coordinate time forms back to coordinate time forms; and that they carry
  `TauCeti.torusOrientation` to the binary product orientation `TauCeti.Manifold.Orientation.prod`
  of the orientations of the factors. Consequently the orientation of the ordered wedge of the
  coordinate time forms is the iterated product of the circle orientations in the order of
  `Fin n`; the empty product is a point, with its positive orientation of degree zero.
- *Open restrictions.* For every open U of a circle, of a torus or of a family, prove that the
  open-submanifold atlas of U and the atlas restricted from the oriented atlas agree, that the
  restricted time forms (pullback along the inclusion, Tau Ceti's `TauCeti.mpullback_inclusion_apply`)
  and restricted orientations (`TauCeti.Manifold.Orientation.restrict`) are compatible with
  successive restrictions U ⊆ W, and that restriction commutes with products, reindexing and
  rescaling. For a map f among these (rescalings, reindexings, coordinate-fibre embeddings, base
  changes of families) and an open V of its target, restrict its source to an open U ⊆ f⁻¹(V); for
  a coordinate-fibre map take the open preimage of V. Prove that the restricted map satisfies the
  pullback and orientation laws of f, for every such U, including open sets that are not products.
- *Families for finite collections of periods.* For a finite index type ι, a finite-dimensional
  smooth base B and smooth positive functions pᵢ : B → ℝ_(>0), construct the family with fibre
  ∏ᵢ `AddCircle (pᵢ b)` over b, as the fibre product over B of the families
  `TauCeti.CircleFamily.Pullback (p i)`, with its normalization to B × (ι → `AddCircle 1`), angle
  forms βᵢ and time forms ηᵢ = pᵢ βᵢ with dηᵢ = dpᵢ ∧ βᵢ. Prove compatibility with arbitrary smooth
  base change, open restriction, fixed fibres and the universal family over (ℝ_(>0))^ι, and that
  for two collections p and q the fibrewise rescaling is a smooth family diffeomorphism preserving
  the normalized angles and pulling η_(q,i) back to (qᵢ/pᵢ) η_(p,i), with its composition,
  base-change and product laws, including all parameter derivatives.
- *Uniform estimates.* For each finite k and each compact parameter sector on which
  0 < ε ≤ pᵢ ≤ M, with C^k bounds on the period functions as hypotheses, prove chart, transition,
  derivative and form estimates of order k that are uniform over the sector, for bounded normalized
  lift charts drawn from a finite normalized chart cover of the sector. On a real-cover window
  |t| ≤ R prove `∂_p^k (t/p) = (−1)^k k! t / p^(k+1)` and `∂_t ∂_p^k (t/p) = (−1)^k k! / p^(k+1)`,
  every derivative with at least two t-derivatives vanishing; derive the bounds `k! R / ε^(k+1)`
  and `k! / ε^(k+1)` and carry them through the finite product, inverse, restriction and
  base-change formulas. A positive lower bound on a period function does not bound its
  derivatives, so those bounds remain hypotheses; there is no coordinate-derivative bound uniform
  over all integer deck indices, while the deck invariance of the forms is exact; nothing uniform
  is asserted at period 0.

The angle tori of §§2.3–2.4 consume the period-2π circles; the suspension construction S0 of the
SymplecticGeometry family consumes the fixed period-1 circle and its closed time form, including
two independent time circles; Layer 5 uses the period-1 circle as the base of the annulus. All use
this single construction and its normalization conversions. *Needs:* the Tau Ceti declarations
named above; Mathlib `AddCircle`, `IsCoveringMap`, `properlyDiscontinuousSMul_iff_properSMul`.

**Checks.**
- The rescaling D_(p,2π) has D_(p,2π)^*dθ = (2π/p) dt_p, so dt_p = (p/2π) dθ and the integral of
  dθ over one circuit of `AddCircle p` is (2π/p)·p = 2π; the reversed conversion
  dt_p = (2π/p) dθ would give p²/(2π).
- On the real cover, ∂_p(t/p) = −t/p² and ∂_p²(t/p) = 2t/p³, the cases k = 1, 2 of the formula; on
  |t| ≤ R with p ≥ ε they are bounded by R/ε² and 2R/ε³, while at fixed t ≠ 0 the first tends to
  infinity as p → 0, which is why no estimate is claimed at period 0.
- Under the deck map (p, t) ↦ (p, t + np), dt − (t/p) dp pulls back to
  dt + n dp − ((t + np)/p) dp = dt − (t/p) dp, while dt alone pulls back to dt + n dp: the
  correction term is what makes the time form descend to the total family.

### 2.1 Compact regular components without global completeness

Let F be an integrable system on a Hausdorff symplectic manifold of dimension 2n, and let L be a
nonempty compact connected component of a level F⁻¹(c₀) at every point of which dF is surjective;
the other components of the level need not be regular. Prove that each X_(Fᵢ) is complete along L:
its maximal integral curves through points of L are defined on ℝ and stay in L. Prove that the
restricted flows give an action of ℝⁿ on L which is transitive, with discrete cocompact stabilizer
Λ, a lattice of rank n independent of the base point, and that the orbit map descends to a
diffeomorphism ℝⁿ/Λ ≅ L, for the smooth structure of L as an open subset of the regular fibre over
c₀ of the restriction of F to its open set of regular points (SmoothBundlesConnections B1.0, with
open restriction). When the fields are complete on all of M, the topological statements are Tau
Ceti's (the action `TauCeti.SmoothTwoForm.IsSymplectic.hamiltonianFlowAction`, transitivity
`TauCeti.SmoothTwoForm.IsSymplectic.range_hamiltonianFlowAction_apply`, the discrete stabilizer
`TauCeti.SmoothTwoForm.IsSymplectic.discreteTopology_hamiltonianFlowStabilizer`, the homeomorphism
`TauCeti.SmoothTwoForm.IsSymplectic.quotientHamiltonianFlowStabilizerHomeomorph` and cocompactness
`TauCeti.SmoothTwoForm.IsSymplectic.compactSpace_quotient_hamiltonianFlowStabilizer`); here the
fields are complete only along L, and the proof restricts the flows to the invariant compact set L.
If F is proper, every X_(Fᵢ) is complete on M, critical fibres included
(`TauCeti.SmoothTwoForm.IsIntegrableSystem.isCompleteVectorField_hamiltonianVectorField_of_isProperMap`).
For a connected regular component that is not compact, the same argument applies only when the
fields are complete along it, and then gives L ≅ ℝⁿ/Λ ≅ ℝ^(n−r) × T^r for the rank r ≤ n of the
discrete stabilizer Λ; no torus conclusion is drawn without compactness (Arnold, §49; Cannas da
Silva, §18.4). *Needs:* §1.1; §1.2 (local commuting flows); Tau Ceti
`TauCeti.exists_regularFiber_smoothEmbedding`, the Tau Ceti declarations named above.

### 2.2 The saturated neighbourhood

Keep L and c₀ as in §2.1, with M Hausdorff. Choose a smooth complement to ker dF near L. Horizontal lifts of radial
paths in a sufficiently small ball D about c₀ exist uniformly from every point of L by compactness;
prove that their endpoint map Ψ : L × D → M is smooth, with F ∘ Ψ = pr_D and Ψ(x, c₀) = x. By the
inverse function theorem along the compact central fibre and a finite-subcover shrinking, prove
that Ψ is an embedding onto an open neighbourhood W of L. Each slice C_y = Ψ(L × {y}) is compact and
connected, hence closed in the Hausdorff fibre F⁻¹(y), and open in that fibre because W is open,
so it is exactly a connected component of F⁻¹(y), consisting of regular points. The Hamiltonian
fields X_(Fᵢ) are tangent to every fibre and restrict to smooth fields on each C_y; each is complete
on C_y, since a maximal trajectory with a finite endpoint time has an accumulation point in the
compact C_y and extends by local existence. Hence each full flow preserves C_y, W is saturated by
these components, and F : W → D is proper because L is compact. Ehresmann's theorem for the proper
submersion F|_W (SmoothBundlesConnections B1.5) is a second route to the same local product.
*Needs:* §2.1; Tau Ceti `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` (inverse function theorem),
`TauCeti.exists_regularFiber_smoothEmbedding`; SmoothBundlesConnections B1.5 for the second route.

### 2.3 The smooth period lattice

On the saturated neighbourhood W of §2.2, choose a smooth section s : D → W of F, transversal to the
fibres, with s(c₀) ∈ L, and let Λ_c be the stabilizer of the ℝⁿ-action at s(c), the period lattice
of C_c. Prove that, near a fixed basis of Λ_(c₀), the equation φ_t(s(c)) = s(c) has smooth
solutions λ⁽ⁱ⁾(c) by the implicit function theorem, that λ⁽¹⁾(c), …, λ⁽ⁿ⁾(c) is a basis of Λ_c, a
lattice of rank n, and that two such choices of basis differ by a locally constant integral matrix.
The map D × ℝⁿ → W, (c, t) ↦ φ_t(s(c)), descends to a diffeomorphism from the family of tori
(D × ℝⁿ)/Λ, the orbit space of the period translation action of the period family c ↦ Λ_c, onto W,
and, comparing the standard torus of that trivialization with `Fin n → AddCircle (2 * π)`, to
D × (ℝ/2πℤ)ⁿ, using the positively oriented `AddCircle (2 * π)` charts, local lifts, product atlas,
rescalings and normalization of the angle one-forms of §2.0. *Needs:*
§§2.0, 2.2; Tau Ceti `TauCeti.periodAddAction`, `TauCeti.isManifold_torusFamily`,
`TauCeti.torusFamilyDiffeomorphProd` (the family of tori of a smooth period family and its
trivialization), `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`.

### 2.4 Action–angle coordinates

Choose a local integral basis of the period lattice and construct actions I₁, …, Iₙ and angles
θ ∈ (ℝ/2πℤ)ⁿ on W with σ = Σ dθᵢ ∧ dIᵢ, F a function of I, and X_H = Σ (∂h/∂Iᵢ) ∂_(θᵢ) for every
H = h ∘ I. The chart is a symplectomorphism of a neighbourhood of L onto the product of an open
action domain with the whole torus, not a single Euclidean coordinate chart on the torus.

Prove `exists_actionAngle` (Arnold, §§49–50; Cannas da Silva, §18.4): let σ be a symplectic form
on a Hausdorff boundaryless manifold M of dimension 2n, modelled on a finite-dimensional space, let
F : M → ℝⁿ be an integrable system, and let L be the connected component through x₀ of the level
F⁻¹(F x₀), assumed compact and consisting of regular points of F. Then for every period p > 0
there are an open U ⊇ L, an open D ⊆ ℝⁿ and a map φ from M to the cotangent bundle of the torus
`Fin n → AddCircle p` which, on U, is an injective local diffeomorphism onto the covectors ξ whose
actions (ξ(e₁), …, ξ(eₙ)) lie in D, which pulls the canonical form
`TauCeti.CotangentBundle.symplecticForm` back to σ, and along which F is a function of the actions.
The period p = 2π gives the angles above; the cotangent lift of the rescaling θ ↦ (p/2π)θ of the
torus converts them to period p, multiplying the actions by 2π/p and preserving Σ dθᵢ ∧ dIᵢ.
*Needs:* §§2.0–2.3; Tau Ceti `TauCeti.CotangentBundle.symplecticForm`,
`TauCeti.SmoothTwoForm.IsIntegrableSystem`, `TauCeti.IsRegularPoint`.

**Checks.**
- For the oscillator H = (q² + p²)/2 on ℝ² with ω = dq ∧ dp, n = 1 and x₀ = (1, 0), L is the unit
  circle. With I = (q² + p²)/2 and θ measured clockwise from the p-axis,
  (q, p) = (√(2I) sin θ, √(2I) cos θ) gives dq = sin θ dr + r cos θ dθ and
  dp = cos θ dr − r sin θ dθ for r = √(2I), so dq ∧ dp = r dθ ∧ dr = dθ ∧ dI and H = I, with
  X_H = ∂_θ; this is Tau Ceti's `TauCeti.oscillatorActionAngle` at unit mass and frequency. The
  counterclockwise angle gives dq ∧ dp = −dθ ∧ dI, the wrong sign for ω = −dλ = Σ dθᵢ ∧ dIᵢ.
- At the critical point x₀ = (0, 0) of the same oscillator the level is the point {0}, where dH = 0,
  so the regularity hypothesis fails. The conclusion fails too: H would be constant on the circle
  of the chart through 0, and that circle would lie in the level {0}.
- For n = 0 the manifold is discrete, L = {x₀}, the torus and its cotangent bundle are points;
  U = {x₀}, D = ℝ⁰ and the constant map satisfy every clause, the form condition being one on zero
  spaces.
- For F(q, p) = p on T*ℝ = ℝ², every level is a line: L is not compact, and the conclusion fails,
  since F would be constant on the compact circles of the chart while its levels in U are open
  pieces of lines; so the compactness hypothesis is not removable.

### 2.5 Actions as periods, integral-affine changes and uniqueness

Orient the cycle γᵢ of C_c by t ↦ φ_(tλ⁽ⁱ⁾)(s(c)), t ∈ [0, 1], and prove
dIᵢ = (1/2π) Σⱼ λ⁽ⁱ⁾ⱼ(c) dcⱼ; equivalently Λ_c = 2π (D_I F)^(−T) ℤⁿ. In a cotangent
neighbourhood, where σ = −dλ, prove that the functions c ↦ (1/2π) ∮_(γᵢ(c)) λ are actions, that is
satisfy the formula for dIᵢ, so that Iᵢ = (1/2π) ∮_(γᵢ) λ up to the additive constants of the
actions, using DifferentialGeometry §8.4 chain integrals; the same holds for any primitive α of −σ
on W. In general define the actions from the period one-forms and prove that these are closed,
hence locally exact. Prove that changes
of integral basis act by I′ = A I + b with A ∈ GL(n, ℤ) and b ∈ ℝⁿ, and that θ′ = A^(−T) θ is the
corresponding change of angles, preserving σ. Prove uniqueness: two action–angle charts of §2.4 on a
common saturated neighbourhood over a ball of actions differ by
(θ, I) ↦ (A^(−T)(θ + ∇φ(I)), A I + b) with A ∈ GL(n, ℤ), b ∈ ℝⁿ and φ a smooth function of the
actions (the angle gauge). *Needs:* §§2.3–2.4; DifferentialGeometry §8.4.

**Checks.**
- For the oscillator H = ν I, ν > 0, the flow of H has period 2π/ν, so λ = 2π/ν and
  dI = (1/2π)(2π/ν) dH = dH/ν, matching I = H/ν (Tau Ceti `TauCeti.oscillatorAction`); the lattice
  formula gives Λ = 2π ν⁻¹ ℤ.
- For F = (2I₁ + I₂, I₂), D_I F has rows (2, 1) and (0, 1); the flow of t₁F₁ + t₂F₂ moves θ by
  (2t₁, t₁ + t₂), so Λ = {π(a, 2b − a) : a, b ∈ ℤ}, generated by π(1, −1) and 2π(0, 1), which is
  2π (D_I F)^(−T) ℤ². The formula without the transpose, 2π (D_I F)^(−1) ℤ², contains π(1, 0), which
  moves θ by (2π, π) and is not a period.

### 2.6 Regular Lagrangian torus fibrations, monodromy and the Lagrangian class

Define a regular Lagrangian torus fibration as a proper surjective submersion π : M → B from a
Hausdorff symplectic manifold of dimension 2n onto a Hausdorff second-countable smooth n-manifold
B, with compact connected Lagrangian fibres. Construct its period lattice Λ ⊂ T*B, the locally
constant subsheaf of rank-n lattices of covectors whose induced vertical flow has time-one map the
identity, its linear monodromy π₁(B, b) → GL(Λ_b) ≅ GL(n, ℤ), and the associated torus bundle
T*B/Λ with the symplectic form descended from T*B. Build its topological Chern class in H²(B; Λ)
with local coefficients, using SmoothBundlesConnections B6.6's classification of affine torus
bundles and AlgebraicTopology §2.6's local-coefficient carrier, with SmoothBundlesConnections B6.1
for the Čech and sheaf comparisons and refinements. Build the sheaf Z¹ of closed one-forms, the quotient sheaf Z¹/Λ of local Lagrangian
sections, its Čech H¹ and the torsor cocycle t of π, written s_j = s_i + t_ij for local Lagrangian
sections s_i as in B6.6, whose class is the Lagrangian class. Prove that the Lagrangian class
vanishes iff π is fibrewise symplectomorphic to the model T*B/Λ (Zung, §2.3; Sjamaar, p. 9), and
that its image under the connecting map H¹(B; Z¹/Λ) → H²(B; Λ) of 0 → Λ → Z¹ → Z¹/Λ → 0 is minus
the Chern class, since B6.6 fixes that class as −δ[t] and connecting maps are natural along
Z¹ ⊂ C^∞(T*B) (Zung, §2.3, and Sjamaar, p. 10, state the relation for their own definitions of the
two classes). Prove the existence and uniqueness parts by gluing local action–angle sections of
§2.4; when π has a smooth section s, prove that the Lagrangian class is, up to sign, the image of
the class of s^*σ under H²_dR(B) ≅ H¹(B; Z¹) → H¹(B; Z¹/Λ): if s = s_i + α_i on U_i for a one-form
α_i, then t_ij = α_i − α_j modulo Λ, and s^*σ = ±dα_i with a sign fixed by the convention for the
action of T*B (Sjamaar, p. 7, Lemma). *Needs:* §§2.2–2.5;
SmoothBundlesConnections B1.5, B6.1, B6.6; AlgebraicTopology §2.6.

### 2.7 Global action–angle coordinates

Prove that global action–angle coordinates, a fibrewise symplectomorphism of a regular Lagrangian
torus fibration onto V × Tⁿ for an open V ⊆ ℝⁿ with σ = Σ dθᵢ ∧ dIᵢ, exist iff the linear monodromy
is trivial, the period one-forms can be chosen globally exact, the resulting global action map
B → ℝⁿ is injective, and the Lagrangian class vanishes; and that such coordinates are unique up to
the integral-affine changes and angle gauge of §2.5. Without injectivity, for coordinates on
B × Tⁿ whose actions form a local diffeomorphism B → ℝⁿ, the criterion is Duistermaat's in the form
with the Lagrangian class (Sjamaar, Theorem on p. 6, and p. 8 for trivial affine monodromy as
trivial linear monodromy with exact period forms). *Needs:* §§2.5–2.6.

**Checks.**
- The fibration T² → S¹, (θ, φ) ↦ φ, with σ = dθ ∧ dφ, is the model T*S¹/(2πℤ dφ) under
  (θ, φ) ↦ (φ, p_φ = −θ), so its linear monodromy, Chern class and Lagrangian class are trivial;
  its action is I = φ, a circle-valued function whose period form dφ is closed but not exact, so
  there is no global real action coordinate: period exactness cannot be omitted.
- For B = (1, 2) × (0, 3π) with developing map a(r, φ) = (r cos φ, r sin φ), lattice generated by
  2π da₁ and 2π da₂ and the canonical fibration T*B/Λ, the period forms da₁, da₂ are exact and the
  linear, Chern and Lagrangian data vanish (B is contractible), but a is not injective, since
  φ and φ + 2π give the same point for φ ∈ (0, π), nor is any integral-affine change of a; so there
  is no global action chart onto an open V ⊆ ℝ²: injectivity cannot be omitted.

### Examples

The uncoupled oscillators of §4.1 on the region where every energy is positive have global
action–angle coordinates with actions Eᵢ/νᵢ and period lattice ∏ (2π/νᵢ)ℤ for the flows of the
energies. The spherical pendulum of §4.4 is a regular Lagrangian torus fibration over the regular
values around (1, 0) with nontrivial monodromy, so by §2.7 it has no global action–angle
coordinates there.

### Dependencies

Layer 1 (§§1.1–1.2); Tau Ceti's circles, tori and circle families, integrable systems, commuting
flow action and stabilizer, regular fibres, inverse function theorem, period families of lattices
and cotangent bundles; DifferentialGeometry Layers 0–1 and §8.4; SmoothBundlesConnections B1.5,
B6.1 and B6.6; AlgebraicTopology §2.6; ConvexityToric §1.1 for the torus and lattice dictionary.

<a id="i3-hamiltonian-and-lagrangian-mechanics"></a>

## Layer 3: Hamiltonian and Lagrangian mechanics

### 3.1 The Lagrangian vector field and the Legendre transform

For a smooth L : TQ → ℝ, the Legendre map, energy, fibre Hessian, regularity (invertible fibre
Hessians, equivalently FL a local diffeomorphism on a boundaryless Q), the Cartan forms
θ_L = FL^*λ and ω_L = −dθ_L = FL^*ω, and the kinetic-plus-potential Lagrangian of a fibrewise
bilinear form and a potential with its Legendre, energy and fibre-Hessian formulas are Tau Ceti's:
`TauCeti.legendreMap`, `TauCeti.lagrangianEnergy`, `TauCeti.fiberHessian`,
`TauCeti.IsRegularLagrangian`, `TauCeti.isLocalDiffeomorph_legendreMap_iff`, `TauCeti.cartanForm`,
`TauCeti.cartanTwoForm`, `TauCeti.mpullback_legendreMap_symplecticForm` and
`TauCeti.mechanicalLagrangian`. A hyperregular Lagrangian is a regular one whose Legendre map is
bijective, hence a global diffeomorphism; put H = E_L ∘ FL⁻¹ on T*Q.

Prove `mfderiv_proj_lagrangianVectorField` (Marsden–Ratiu, Ch. 7): for a smooth regular Lagrangian L
on a finite-dimensional boundaryless manifold Q, the Lagrangian vector field is second order,
dπ(X_E(v)) = v at every v ∈ TQ. Deduce that its integral curves are the velocity curves of the
solutions of the Euler–Lagrange equations d/dt(∂L/∂v) = ∂L/∂q in every chart. Prove
`mfderiv_legendreMap_lagrangianVectorField`: for a smooth hyperregular L on such a Q, dFL(X_E(v)) =
X_H(FL v) for every v, the Hamiltonian vector field being that of
`TauCeti.CotangentBundle.symplecticForm`. For L with positive definite fibre Hessians and Legendre
map onto T*Q, its form for curves (a curve solves the Euler–Lagrange equations iff its Legendre lift
is an integral curve of X_H) is Cannas da Silva, Thm. 20.10, p. 123. Prove that the Euler–Lagrange
equations are invariant under changes of configuration coordinates: the equations written in two
charts are equivalent on their overlap. For a Riemannian metric g and L(v) = ½ g(v, v), prove that
X_E is the geodesic spray of the Levi–Civita connection, whose integral curves are the velocity
curves of the geodesics of HopfRinow Layer 1, and that FL carries it to the Hamiltonian vector field
of the kinetic energy `TauCeti.CotangentBundle.kineticEnergy`. *Needs:* Tau Ceti declarations named
above, `TauCeti.SmoothTwoForm.hamiltonianVectorField`, `TauCeti.CotangentBundle.kineticEnergy`;
Mathlib `CovariantDerivative.leviCivitaConnection`; HopfRinow Layer 1.

**Checks.**
- On Q = ℝ with L = ½mv² − V(q), m > 0: FL(q, v) = (q, mv), θ_L = mv dq, ω_L = m dq ∧ dv and
  E_L = ½mv² + V(q). Writing X_E = (a, b), ι_(X_E)ω_L = m(a dv − b dq) equals dE_L = mv dv + V′dq
  exactly when a = v and b = −V′/m: the field is second order and its base curves solve
  mq̈ = −V′(q). With H = p²/(2m) + V, X_H = (∂H/∂p, −∂H/∂q) = (p/m, −V′), and at p = mv this is
  dFL(v, −V′/m) = (v, −V′). Defining X_E by ι_X ω_L = −dE_L instead gives (−v, V′/m), which fails
  dπ(X_E(v)) = v.
- L(q, v) = v on Q = ℝ is not regular: θ_L = dq, so ω_L = 0 and the Hamiltonian vector field of
  E_L = 0 is 0, whose projection is 0 ≠ v for v ≠ 0; the regularity hypothesis is not removable.
- L(q, v) = e^v on Q = ℝ is regular, with fibre Hessian e^v > 0, but FL(q, v) = (q, e^v) misses the
  covectors p ≤ 0: L is not hyperregular and H = E_L ∘ FL⁻¹ is not defined on all of T*Q.

### 3.2 Time-dependent systems and the variation of action

For time-dependent L or H, build the extended phase space T*(Q × ℝ) with coordinates (q, t, p, p_t),
the autonomous Hamiltonian K = p_t + H(t, q, p), and the nonautonomous Hamilton equations as the
equations of K, whose flow has ṫ = 1. Prove the conservation criterion: a function F(t, q, p) is
constant along every solution iff ∂_tF + {F, H} = 0. Prove the first-variation formula: for a
smooth variation γ_s : [a, b] → Q of a curve and a Lagrangian L(t, q, v), the derivative at s = 0 of
the action ∫ₐᵇ L(t, γ_s, γ̇_s) dt is the integral of the Euler–Lagrange expression paired with the
variation field plus the endpoint term [⟨FL(γ̇), δγ⟩]ₐᵇ, so that a C² curve solves the
Euler–Lagrange equations iff it is stationary for all variations with fixed endpoints; the
stationary-action formulations carry these curve and variation hypotheses explicitly
(Marsden–Ratiu, Ch. 7). *Needs:* §3.1; Tau Ceti
`TauCeti.CotangentBundle.symplecticForm`.

**Checks.**
- For the free particle H = p²/2 on T*ℝ, F = q − tp has ∂_tF = −p and {F, H} = dF(X_H) = p
  (X_H = p ∂_q), so ∂_tF + {F, H} = 0 and the Galilean boost is conserved; the criterion with the
  opposite sign, ∂_tF − {F, H} = 0, would reject it (−2p ≠ 0).

### 3.3 Noether's theorem

For a smooth regular Lagrangian L and a Lie group acting on Q whose lifted action on TQ preserves
L, prove that Noether's quantity
J_ξ(v) = ⟨FL(v), ξ_Q(π v)⟩ is constant along the Lagrangian flow and equals the cotangent-lift moment
map, Tau Ceti's `TauCeti.CotangentBundle.momentMap`, composed with FL, so that the Lagrangian
conservation law agrees with the Hamiltonian one: for H on T*Q invariant under the lifted action,
{⟨μ, ξ⟩, H} = −dH(ξ_(T*Q)) = 0, which is Tau Ceti's Noether theorem
`TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff` for the moment map of
`TauCeti.CotangentBundle.isEquivariantMomentMap_momentMap` (Cannas da Silva, Thm. 24.1, p. 147,
for the Hamiltonian form). For an
infinitesimal symmetry ξ_Q(t, q) whose variation of L equals the total derivative dB_ξ(t, q)/dt
along every curve, prove that J_ξ = ⟨FL, ξ_Q⟩ − B_ξ is conserved along solutions, and that it
transforms as a function on ℝ × TQ under changes of configuration coordinates (Marsden–Ratiu,
Ch. 11). *Needs:* §§3.1–3.2; Tau Ceti `TauCeti.CotangentBundle.momentMap`,
`TauCeti.CotangentBundle.isEquivariantMomentMap_momentMap`,
`TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff`.

**Checks.**
- For L = ½mv² on Q = ℝ and the Galilean boost ξ_Q(t, q) = t, the variation of L is
  mv·(d/dt)t = mv = d(mq)/dt, so B_ξ = mq and J_ξ = mvt − mq, whose derivative mv̇t + mv − mv
  vanishes on solutions; without B_ξ the quantity mvt has derivative mv ≠ 0.

### Examples

The mechanical Lagrangian ½‖v‖² − V(q) on ℝⁿ has Legendre map v ↦ v♭, energy ½‖v‖² + V(q), and
Lagrangian vector field (v, −∇V); its Legendre transform is ½‖p‖² + V. The free particle in a
Riemannian manifold has geodesics as base curves.

### Dependencies

Tau Ceti's Legendre map, Cartan forms, cotangent bundle forms, kinetic energy, cotangent-lift
moment map and Noether theorem; Mathlib's Levi–Civita connection; HopfRinow Layer 1. Nothing of
Layers 1, 2, 4 or 5.

## Layer 4: examples that exercise the full API

Every action–angle chart below is verified by pulling back ω and differentiating H, not only by
identifying fibres topologically; dense regularity is checked as part of each system.

### 4.1 The free particle and harmonic oscillators

The free particle has H = ‖p‖²/(2m), m > 0, on T*ℝⁿ, with linear flow (q, p) ↦ (q + (t/m)p♯, p).
Prove that, in CotangentLagrangian's convention with (q, p) the source, S(q, Q) = −m‖q − Q‖²/(2t),
t ≠ 0, generates the time-t map; the unit-mass case is Tau Ceti's
(`TauCeti.freeParticleGeneratingFunction`,
`TauCeti.cotangentGeneratingTarget_freeParticleGeneratingFunction_eq_cotangentGeneratingSource`).
For n uncoupled oscillators Hᵢ = (pᵢ²/mᵢ + mᵢνᵢ²qᵢ²)/2 with positive masses and angular frequencies
(Tau Ceti `TauCeti.oscillatorHamiltonian`), the action–angle parametrization, the actions Eᵢ/νᵢ, the
angles, the period lattice (2π/ν)ℤ of a single oscillator, the embedded invariant tori and the
resonant versus nonresonant orbit closure are Tau Ceti's (`TauCeti.oscillatorActionAngle`,
`TauCeti.oscillatorAction`, `TauCeti.oscillatorAngle`,
`TauCeti.oscillatorActionAngle_add_eq_self_iff`,
`TauCeti.isClosedEmbedding_oscillatorTorusEmbedding`,
`TauCeti.closure_range_oscillatorActionAngle_eq_iff`). Prove that (H₁, …, Hₙ) is an integrable
system on ℝ²ⁿ, that the product of the single action–angle parametrizations is an action–angle chart
of §2.4 on the region where every Eᵢ > 0, and that the stabilizer of the ℝⁿ-action of (H₁, …, Hₙ)
there is ∏ᵢ (2π/νᵢ)ℤ. *Needs:* §§2.4–2.5; Tau Ceti declarations named above; CotangentLagrangian
Layer 3.

**Checks.**
- With p = ∂_qS and P = −∂_QS, S = −m‖q − Q‖²/(2t) gives p = m(Q − q)/t and P = m(Q − q)/t, so
  Q = q + (t/m)p and P = p: the free motion for time t at speed p/m. Dropping the mass, the
  unit-mass generator gives Q = q + tp, the motion at the wrong speed.
- For F = (H₁, …, Hₙ) with Hᵢ = νᵢIᵢ, D_I F = diag(νᵢ), and §2.5's formula gives
  2π diag(1/νᵢ) ℤⁿ = ∏ᵢ (2π/νᵢ)ℤ, matching the single-oscillator lattices.

### 4.2 Planar central forces

On Q = ℝ² ∖ {0} with H = ‖p‖²/(2m) + V(r), m > 0, and L = q₁p₂ − q₂p₁, the following are Tau
Ceti's: {H, L} = 0 on the punctured phase space, for `TauCeti.centralForceHamiltonian` and
`TauCeti.angularMomentum` with the standard basis vectors of ℝ² as the plane, in every dimension and
for a potential differentiable at ‖q‖
(`TauCeti.stdSymplecticForm_poissonBracket_centralForceHamiltonian_angularMomentum`, for the linear
bracket of the standard form, which is the manifold bracket of its constant form by
`TauCeti.SymplecticForm.poissonBracket_constSmooth`); functional independence of H and L exactly
away from the points where p_r = 0 and V_ℓ′(r) = 0 hold simultaneously
(`TauCeti.isRegularPoint_centralForceEnergyMomentum_iff`), and integrability of (H, L) on the
punctured phase space (`TauCeti.isIntegrableSystem_centralForceEnergyMomentum`); the radial
reduction at L = ℓ to H_ℓ = p_r²/(2m) + ℓ²/(2mr²) + V(r), with the effective potential
V_ℓ = ℓ²/(2mr²) + V, the bound V_ℓ(r) ≤ E with equality exactly at the turning points, and the
circular equilibria at the critical points of V_ℓ (`TauCeti.radialProjection`,
`TauCeti.fderiv_radialProjection_hamiltonianVectorField_centralForceHamiltonian`,
`TauCeti.effectivePotential_le_centralForceHamiltonian`,
`TauCeti.centralForceHamiltonian_eq_effectivePotential_iff`,
`TauCeti.forall_hasDerivAt_circularMotion_iff`).

Prove that L is the moment map of the cotangent lift of the rotation action of SO(2) on ℝ² ∖ {0}.
Prove global polar cotangent coordinates: the base diffeomorphism ℝ² ∖ {0} ≅ ℝ_(>0) × ℝ/2πℤ,
q = r(cos θ, sin θ), lifts to a symplectomorphism of cotangent bundles with canonical coordinates
(r, θ, p_r, L), λ = p_r dr + L dθ, in which H = p_r²/(2m) + L²/(2mr²) + V(r); so the level
L = ℓ modulo rotations, the regular reduced space of HamiltonianReduction Layer 3 for the rotation
action, is T*ℝ_(>0) with coordinates (r, p_r) and reduced Hamiltonian H_ℓ. Prove that a
nondegenerate minimum r₀ of V_ℓ gives a Lyapunov-stable elliptic equilibrium (r₀, 0) of H_ℓ, with
linearization eigenvalues ±i√(V_ℓ″(r₀)/m), and a nondegenerate maximum a hyperbolic one, with
eigenvalues ±√(−V_ℓ″(r₀)/m). For simple turning points r₋ < r₊ (V_ℓ(r±) = E, V_ℓ′(r±) ≠ 0 and
V_ℓ < E between them) prove that the improper integrals converge, that the time and the polar angle
swept from r₋ to r₊ are t = ∫ dr/√((2/m)(E − V_ℓ)) and θ = ∫ ℓ dr/(r²√(2m(E − V_ℓ))), and that the
radial motion is periodic with period twice the time integral; Tau Ceti's `TauCeti.radialPeriod` and
`TauCeti.apsidalAngle` are these integrals (Arnold, Ch. 2). *Needs:* §§1.1, 3.1; Tau Ceti
declarations named above, `TauCeti.CotangentBundle.momentMap`; HamiltonianReduction Layers 1 and 3.

**Checks.**
- With q = r e_r, e_r = (cos θ, sin θ), e_θ = (−sin θ, cos θ), dq = e_r dr + r e_θ dθ, and
  p = p_r e_r + (L/r) e_θ, λ = p·dq = p_r dr + L dθ and ‖p‖² = p_r² + L²/r². Taking instead the
  tangential component p_θ = L/r as the momentum paired with θ gives λ = p_r dr + r p_θ dθ, so
  (r, θ, p_r, p_θ) is not a canonical chart.
- For V = −κ/r, V_ℓ(r) = ℓ²/(2mr²) − κ/r has its minimum at r₀ = ℓ²/(mκ), with
  V_ℓ″(r₀) = m³κ⁴/ℓ⁶ > 0: the circular Kepler orbit is elliptic.

### 4.3 The Kepler problem and the isotropic oscillator

For V(r) = −κ/r with κ > 0 the following are Tau Ceti's: the planar Runge–Lenz vector
A = (p₂ℓ − mκq₁/r, −p₁ℓ − mκq₂/r) is conserved (`TauCeti.stdSymplecticForm_poissonBracket_inner_rungeLenz`),
|A|² = m²κ² + 2mHL² (`TauCeti.norm_rungeLenz_sq_of_orthonormalBasis`), the eccentricity is
e = √(1 + 2Eℓ²/(mκ²)) and the orbit is the conic r = ℓ²/(mκ(1 + e cos(θ − θ₀)))
(`TauCeti.norm_fst_eq_div_one_add_sqrt_mul_cos_angle`); the radial action is
I_r = κ√(m/(−2E)) − |ℓ| for ℓ ≠ 0 on the whole bound-energy domain −mκ²/(2ℓ²) ≤ E < 0, with I_r = 0
at the circular endpoint (`TauCeti.kepler_radialAction_turningRadii`); H = −mκ²/(2(I_r + |ℓ|)²)
(`TauCeti.kepler_energy_eq_neg_div_sq_radialAction_add_abs`); the radial period is 2π√(m/κ)a^(3/2)
with a = (r₋ + r₊)/2 = κ/(−2E) (`TauCeti.kepler_radialPeriod`, `TauCeti.kepler_kappa_eq`); the
apsidal angle is π sign ℓ (`TauCeti.kepler_apsidalAngle`); and for the isotropic oscillator
V = ½mν²r² the radial action is I_r = (E/ν − |ℓ|)/2 (`TauCeti.isotropicOscillator_radialAction`),
with radial period π/ν and apsidal angle (π/2) sign ℓ (`TauCeti.isotropicOscillator_radialPeriod`,
`TauCeti.isotropicOscillator_apsidalAngle`).

Prove the following. On the collision domain L = 0, every solution with q ≠ 0 stays on a fixed ray
through the origin and reaches the collision set q = 0 in finite time, forward or backward. For
ℓ ≠ 0 and −mκ²/(2ℓ²) < E < 0, the common level {H = E, L = ℓ} is a compact connected invariant
torus of regular points, on which every solution moves on a bounded ellipse avoiding the collision
set. On
each component L > 0, L < 0 of this bound noncollision region, the radial action I_r and the signed
angular action I_θ = L are action variables (their Hamiltonian flows are 2π-periodic), so that
`Ω_r = ∂H/∂I_r = mκ²/(I_r + |I_θ|)³` and `Ω_θ = ∂H/∂I_θ = sgn(I_θ) Ω_r`: the frequency magnitudes
agree, with signed resonance 1 : ±1. Prove superintegrability: H, L and the two Runge–Lenz
components are first integrals of H, and the map (H, L, A₁, A₂) has rank exactly three on a dense
open subset of the bound noncollision region, the length identity being its one relation. For the
isotropic oscillator prove that every orbit with ℓ ≠ 0 is bounded, avoids the collision set and is
closed, with period 2π/ν. This compares two examples; it is not a classification of central
potentials with closed orbits (Arnold, Ch. 2). *Needs:* §§2.4, 4.2; Tau Ceti declarations
named above.

**Checks.**
- At the circular endpoint E = −mκ²/(2ℓ²): e = √(1 − 1) = 0 and I_r = κ√(m·ℓ²/(mκ²)) − |ℓ| = 0, and
  H = −mκ²/(2|ℓ|²) agrees with the action formula at I_r = 0.
- From H = −mκ²/(2J²) with J = I_r + |I_θ| = κ√(m/(−2E)), Ω_r = mκ²/J³ = (−2E)^(3/2)/(κ√m), and
  2π divided by the period 2π√(m/κ)(κ/(−2E))^(3/2) is the same number: the frequency and the
  period computations agree.

### 4.4 The spherical pendulum and its monodromy

With mass, length and gravity normalized to one, the phase space is
T*S² = {(q, p) : ‖q‖ = 1, q·p = 0}, with H = ½‖p‖² + q₃ and J = q₁p₂ − q₂p₁. Prove that H is proper,
that the regular fibres of F = (H, J) are connected, and that the critical values are the bottom
(−1, 0), the isolated focus–focus value (1, 0) at the top, and the relative-equilibrium boundary
given by the minima of j²/(2(1 − z²)) + z over −1 < z < 1. Derive the period and rotation integrals
from this reduced Hamiltonian. Define the signed quadrature angle

    Θ(h, j) = 2 ∫ j dz / ((1 − z²) √(2(h − z)(1 − z²) − j²)),  z from z₋ to z₊,

over the interval [z₋, z₊] of the reduced motion, so that φ_H^T(x) = φ_J^Θ(x) for the first-return
time T, and the curve γ₂, the forward X_H first-return path closed by the X_J-orbit of time −Θ, is
closed. Prove the one-sided limits Θ → ±π for −1 < h < 1 and Θ → ±2π for h > 1 as j → 0±. Fix
F = (H, J), a counterclockwise loop in the (h, j)-plane around (1, 0), γ_J the positive X_J-orbit and
γ₂ as above. Prove that homology transport around the loop fixes γ_J and sends γ₂ to γ₂ + γ_J: the
matrix with rows (1, 1) and (0, 1), whose columns are the transported basis. Use the rotation-form
and residue computation of Efstathiou–Giacobbe–Mardešić–Sugny, §II.A–II.C and §III.B, building its
first-return and rotation-number lemma and evaluating the three polar orbits P₊, P₋, P₀ of its
spherical-pendulum loop, of which P₋ and P₀ cancel. That loop runs the other way, through
(h, j) = (g(s), −s) where it crosses h > 1 (§III.B, p. 10; counterclockwise there with J on the
horizontal axis), so its monodromy number k = −1, γ₂ ↦ γ₂ − γ_J, is γ₂ ↦ γ₂ + γ_J for the loop
used here. With the stated orientation the continuous lift
of Θ decreases by 2π around the loop, so the closing −Θ segment gains a positive J-orbit. This
gives the nonlinear monodromy; the quadratic focus–focus Hessian alone does not. Conclude that
there are no global action–angle coordinates on any neighbourhood of the loop's preimage by §2.7.
*Needs:* §§1.4, 2.3–2.7; Tau Ceti `TauCeti.CotangentBundle.symplecticForm`.

**Checks.**
- At (q, p) = ((0, 0, −1), 0), H = −1 and J = 0, the bottom value; at ((0, 0, 1), 0), H = 1 and
  J = 0, the focus–focus value. In spherical coordinates with z = q₃, the energy reads
  h = ½(ż² + j²)/(1 − z²) + z, so ż² = 2(h − z)(1 − z²) − j² and dφ/dt = j/(1 − z²): Θ is the
  azimuth swept in one first return, and X_J is the counterclockwise rotation about the vertical
  axis with unit angular speed, so the flow of J for time Θ realizes that rotation.
- Starting at h > 1, j = 0⁺ (Θ near 2π), going around (1, 0) counterclockwise through j > 0 to
  h < 1 (Θ near π), across j = 0 (where the formula jumps from π to −π, the lift staying near π),
  and back through j < 0 to h > 1 (formula near −2π, lift near 0), the lift drops by 2π; a loop of
  the opposite orientation would give γ₂ ↦ γ₂ − γ_J.

### Examples

The Kepler problem at E = −1/2, m = κ = 1, ℓ = 1/2 has e = √(1 − 1/4) = √3/2,
I_r = 1 − 1/2 = 1/2 and semi-major axis a = 1, so its period is 2π; the isotropic oscillator with
ν = 1 has all orbits with ℓ ≠ 0 closed of period 2π.

### Dependencies

Layers 1–3; Tau Ceti's oscillators, free-particle generating function, central forces, radial
reduction, Runge–Lenz vector and radial quadratures; CotangentLagrangian Layer 3;
HamiltonianReduction Layer 1.

## Layer 5: the strict annulus fixed-point theorem

The layer proves the Poincaré–Birkhoff theorem for smooth area-preserving maps, stated in §5.5
(Le Calvez–Wang, Thm. 1, p. 704, state it for area-preserving homeomorphisms), by the
generating-function and isolating-block route of Conley–Zehnder (Invent. Math. 73 (1983),
pp. 33–49). Its isotopy and factorization (§5.1) and finite action (§5.2) precede the block, pair
and cup argument (§§5.3–5.4).

### 5.0 Carrier, boundary rotation, collars, area and generating conventions

Let A = (ℝ/ℤ) × [0, 1], ω a smooth positive area form on A, and f : A → A a smooth diffeomorphism
preserving ω and each boundary component. Fix a degree-one lift F of f to the closed strip
`strip` = ℝ × [0, 1], commuting with T(x, y) = (x + 1, y), and write F^x for its first coordinate.
The strict opposite boundary displacements are F^x(x, 0) < x and F^x(x, 1) > x for every x; for the
reversed inequalities apply everything to f⁻¹. Two fixed points of F are distinct annulus points
when they are not T-translates of each other, which `interiorFundamentalDomain` = [0, 1) × (0, 1)
records.

- *Boundary rotation.* By compactness and periodicity the boundary inequalities have uniform
  positive margins. Prove that for a continuous degree-one lift G of an orientation-preserving
  circle homeomorphism, read as a Mathlib `CircleDeg1Lift`, G(x) > x for every x iff its
  translation number is positive, and G(x) < x for every x iff it is negative: a uniform positive
  (negative) displacement gives a positive (negative) translation number, a lift with a fixed point
  has translation number zero, and continuity with periodicity turn a nonzero signed translation
  number into the strict pointwise sign. Use this equivalence with the actual translation number of
  the chosen boundary lifts throughout, without changing lift. *Needs:* Mathlib `CircleDeg1Lift`,
  `CircleDeg1Lift.translationNumber_lt_of_forall_lt_add`,
  `CircleDeg1Lift.lt_translationNumber_of_forall_add_lt`,
  `CircleDeg1Lift.translationNumber_of_eq_add_int`.
- *Collars.* Construct compatible smooth extensions of f, its lift and ω to open collars of the
  closed annulus: extend the periodic coordinate functions using boundary charts and a periodic
  partition of unity; the inverse-derivative identity at the boundary and the inverse function
  theorem give local inverses; compactness on the annulus quotient and injectivity on the closed
  annulus give injectivity after shrinking the collars; lift the collar diffeomorphism to the
  strip. *Needs:* Tau Ceti `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`; §2.0 (the circle
  `AddCircle 1`).
- *Area normalization.* For a positive density ρ(x, y) dx ∧ dy, periodic in x, put
  s(x) = ∫₀¹ ρ(x, r) dr and a = ∫₀¹ s(x) dx > 0. Prove that u = a⁻¹ ∫₀ˣ s(t) dt mod 1 and
  v = s(x)⁻¹ ∫₀ʸ ρ(x, r) dr define a boundary-preserving, orientation-preserving diffeomorphism with
  a du ∧ dv = ρ dx ∧ dy, with smooth inverse and the endpoint identities, by positivity and the
  inverse function theorem. Degree-one boundary conjugacy transports the lift inequalities, or
  equivalently the rotation signs, so the rest of the layer works with dx ∧ dy. *Needs:* Tau Ceti
  `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`.
- *Generating convention.* Write y = −∂₁S and Y = ∂₂S, the negative of CotangentLagrangian Layer 3's
  generator. For W = Σ S_k prove ∂_kW = Y_(k−1) − y_k, so that the negative-gradient velocity is
  ẋ_k = y_k − Y_(k−1); every sign below is derived from these equations. *Needs:*
  CotangentLagrangian Layer 3.

**Checks.**
- The constant density ρ ≡ 1 gives s ≡ 1, a = 1 and (u, v) = (x, y): the normalization is the
  identity.
- The density ρ = 1 + y gives s = 3/2, a = 3/2, u = x and v = (2y + y²)/3, with v(x, 0) = 0,
  v(x, 1) = 1 and a du ∧ dv = (1 + y) dx ∧ dy = ω; omitting the factor a gives (2/3)(1 + y) dx ∧ dy,
  which is not ω.
- For the shear R_c(x, y) = (x + cy, y), c > 0, the generator in this convention is
  S = (X − x)²/(2c): y = −∂₁S = (X − x)/c and Y = ∂₂S = (X − x)/c = y. With CotangentLagrangian's convention
  p = ∂₁S the same S would give y = −(X − x)/c, the wrong sign; the two conventions differ exactly
  by the sign of S.

### 5.1 Smooth area-preserving isotopy and finite twist factorization

Construct an isotopy from id to f through orientation-preserving, boundary-component-preserving
smooth diffeomorphisms. Prove that every orientation-preserving smooth diffeomorphism of the closed
annulus preserving each boundary component is smoothly isotopic to the identity through such
diffeomorphisms (Epstein, Acta Math. 115 (1966), Thm. 6.4; Gramain, Ann. Sci. ÉNS 6 (1973), Thm. 1,
pp. 53–54, records that the diffeomorphisms of the annulus homotopic to the identity have the
homotopy type of O(2), whose identity component consists of exactly these maps).

*Route.* Lift the two boundary maps of f to increasing degree-one maps b_± : ℝ → ℝ. The
interpolation `B_t(x, y) = ((1 − t)x + t((1 − y) b_−(x) + y b_+(x)), y)` has positive x-derivative,
commutes with T and preserves both boundary lines, so it is a boundary-preserving isotopy from the
identity to a diffeomorphism B₁ with the boundary maps of f; then g = B₁⁻¹ ∘ f fixes the boundary
pointwise. Lift g to G on the strip, commuting with T and fixing the lower boundary line pointwise;
G is a lift of the identity on the upper boundary circle, so it translates the upper line by an
integer m. The image under G of the segment {0} × [0, 1] is a properly embedded arc from (0, 0) to
(m, 1); composing with the inverse of the twist τ^m, τ(x, y) = (x + y, y), gives τ^(−m) ∘ G, which
fixes both boundary lines pointwise and sends the segment to an arc from (0, 0) to (0, 1), isotopic
to the segment relative to its endpoints through properly embedded arcs (Epstein's arc theorems).
Extend this arc isotopy, with its T-translates, to an ambient isotopy of the strip fixing both
boundary lines, by integrating a compactly supported T-periodic time-dependent vector field that
extends the arc velocities (DifferentialGeometry §3.5). The result fixes the boundary lines and the
segment pointwise, hence restricts to a diffeomorphism of the closed square [0, 1]² fixing its
boundary pointwise. Prove that such a diffeomorphism h of the square is isotopic rel boundary to
one equal to the identity near the boundary: at a point of an edge, in (tangent, normal)
coordinates (s, n), its derivative is upper triangular with tangential entry 1 and normal entry
b ≥ b_min > 0. For a profile χ₀ equal to 1 on [0, 1] and to 0 for large u, with
−1/(R − 1) ≤ d(uχ₀)/du ≤ 1 for some R > 1/b_min, and u = n/ε, the maps h + tχ₀(u)(id − h),
t ∈ [0, 1], have Jacobian determinant b + t(1 − b)·d(uχ₀)/du + O(ε), bounded below by a positive
constant, so for small ε they form the isotopy. A thin collar alone does not suffice, since
uχ₀′(u) does not shrink with ε: for a bump with χ₀(2) = 0 the determinant at t = 1 is at most
2b − 1 + O(ε) somewhere, negative when b < 1/2.
Smale's theorem (Smale, Proc. AMS 10 (1959), Thm. B, p. 621:
diffeomorphisms of the square which are the identity near the boundary form a contractible space)
then gives an isotopy to the identity through such diffeomorphisms; it transfers to the strip by
T-equivariance and descends to the annulus. Finally the twist τ^m is isotopic to the identity
through boundary-component-preserving diffeomorphisms by τ_s(x, y) = (x + smy, y), s from 1 to 0,
which rotates the upper boundary circle. Concatenate the pieces and smoothly reparametrize.

*Area preservation.* Make this path area-preserving without assuming a Hamiltonian isotopy. Write
h_t^*(dx ∧ dy) = ρ_t dx ∧ dy, g_t = ρ_t − 1 and ḡ_t(y) = ∫₀¹ g_t(x, y) dx. Set
`a_t(y) = −∫_0^y ḡ_t(r) dr`, `b_t(x, y) = ∫_0^x (g_t(s, y) − ḡ_t(y)) ds` and `β_t = a_t dx + b_t dy`.
Total area gives a_t(0) = a_t(1) = 0, b_t is periodic, and dβ_t = (ρ_t − 1) dx ∧ dy. For an auxiliary
parameter s interpolate the positive two-forms ω_(t,s) = (1 + s(ρ_t − 1)) dx ∧ dy. The field X with
ι_X ω_(t,s) = −β_t is tangent to both boundary circles because its y-component vanishes there.
Extend it smoothly to a common open collar and cut it off away from A; the time-dependent flow of
DifferentialGeometry §3.5 and boundary invariance by uniqueness give its full s-flow ψ_(t,s), smooth
in t. The map k_t = h_t ∘ ψ_(t,1) preserves area. At t = 0, 1 the density is 1 and β_t = 0, so
ψ_(t,1) = id and the endpoints remain id and f. This explicit boundary-tangent construction handles
the boundary; the compact boundaryless Moser theorem is not applied unchanged. Adjust the lifted
path by an integer rigid-rotation loop if necessary so that its endpoint is exactly the given F,
and keep that lift throughout.

*Factorization.* In the C¹ topology, continuity on the compact path interval gives a finite
partition such that each increment lies in a prescribed small identity neighbourhood U. Fix a shear
R_c(x, y) = (x + cy, y), c > 0. For U small enough, H ∈ U implies that N = R_c⁻¹ H has N_Xx > 0 and
N_Xy < 0 throughout A, while R_c has X_x = 1 and X_y = c > 0. So each increment is R_c ∘ N, and the
exact lifted composition is F = F_(2K) ⋯ F₁, K ≥ 1, with odd factors negative twists, even factors
positive twists, and every factor with X_x > 0. All factors preserve area and both boundaries. Prove
these uniform derivative inequalities from C¹ closeness; openness of the set of twist maps alone
does not give X_x > 0.

*Generating functions.* For each factor the map (x, y) ↦ (x, X_k(x, y)) is a global diffeomorphism
from the strip onto its boundary-graph band, with a chosen smooth extension near the closed band.
The form Y dX − y dx is closed. Its period under simultaneous integer translation is zero: on the
lower boundary y = Y = 0 it vanishes on tangent vectors. Path integration on the simply connected
band from a base point on the lower boundary graph {(x, X_k(x, 0))} gives S_k; along that graph
y = Y = 0, so the form vanishes on its tangent vectors and S_k ≡ 0 there, which fixes the additive
constant of every S_k. The zero period gives S_k(x + 1, X + 1) = S_k(x, X). First construct S_k on
the closed band and prove smoothness up to its boundary, with the derivative equations; then extend
S_k periodically to an open band, keeping its mixed-derivative sign by shrinking. Its generating
equations there define a symplectic collar extension agreeing with the factor on the closed strip;
an arbitrary collar extension of the factor is not assumed area-preserving outside the strip.
*Needs:* §5.0; DifferentialGeometry §3.2 (maximal flows), §3.3 (completeness of compactly
supported fields) and §3.5 (time-dependent flows), with Tau Ceti
`TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`,
`TauCeti.isCompleteVectorField_timeDependentSuspensionField`, `TauCeti.timeDependentFlowDiffeomorph`;
Smale's theorem; Epstein's arc and isotopy theorems.

**Checks.**
- For F(x, y) = (x + (2y − 1)/8, y) and c = 1 the factor N = R₁⁻¹F = (x − (6y + 1)/8, y) has
  N_Xx = 1 > 0 and N_Xy = −3/4 < 0, so F = R₁ ∘ N is a factorization with K = 1. With c = 1/8
  instead, N = (x + (y − 1)/8, y) has N_Xy = +1/8: a shear smaller than the increment's twist does
  not factor it, so the partition must be fine relative to the chosen c.
- The generator of that N, normalized on the lower boundary graph X = x − 1/8, is
  S₁(x, X) = −(2/3)(x − X)² + (x − X)/6 − 1/96, with S₁₂ = 4/3 = −1/N_Xy; the generator of R₁,
  vanishing on X = x, is S₂(x, X) = (X − x)²/2 with S₁₂ = −1 = −1/R_Xy. Dropping the normalization
  changes S₁ by 1/96 and every action value of §5.2 by the same constant.
- For the density ρ_t = 1 + ε sin(2πx), |ε| < 1, the data are ḡ_t = 0, a_t = 0 and
  b_t = ε(1 − cos 2πx)/(2π), periodic, with dβ_t = ε sin(2πx) dx ∧ dy = (ρ_t − 1) dx ∧ dy; the field
  has zero y-component everywhere, so it is tangent to both boundary circles. Defining the field by
  ι_X ω_(t,s) = +β_t instead of −β_t gives d/ds(ψ_(t,s)^*ω_(t,s)) = ψ_(t,s)^*(2dβ_t) ≠ 0, so ψ_(t,1)
  pulls ω_(t,1) back to (1 + 2ε sin(2πx)) dx ∧ dy + O(ε²) instead of dx ∧ dy: the sign in
  ι_X ω = −β_t is what makes the flow correct the density rather than double its defect.

### 5.2 Finite action, quotient and periodic-orbit dictionary

Use cyclic configurations (x₁, …, x_(2K)), x_(2K+1) = x₁, in the common open domain of the S_k,
modulo simultaneous integer translation of all positions. The quotient is an open subset of
ℝ^(2K)/ℤ ≅ S¹ × ℝ^(2K−1), with coordinates (x₁ mod 1, x₂ − x₁, …, x_(2K) − x₁). Define
W = Σ S_k(x_k, x_(k+1)), a smooth function on that quotient. The diagonal integer quotient is
needed for compactness and for counting marked fixed points correctly. The Euclidean metric of
position space is deck invariant and descends to the metric used for −grad W.

For every configuration put y_k = −∂₁S_k(x_k, x_(k+1)) and Y_k = ∂₂S_k(x_k, x_(k+1)), so that
F_k(x_k, y_k) = (x_(k+1), Y_k). CotangentLagrangian §3.1's chain dictionary gives the bijection
between the critical configurations of a cyclic action and the fixed points of the composite
whose every intermediate state is admissible; instantiate it with the base ℝ, the generators −S_k
of §5.0 and the composite F = F_(2K) ∘ ⋯ ∘ F₁, so that its critical equations read Y_(k−1) = y_k
at every k. Prove what the dictionary does not say: W and the dictionary descend to the diagonal
ℤ-quotient, on which the dictionary is injective on (x₁ mod 1, y₁), so two critical points of W on
the quotient give two distinct zero-displacement fixed points of F on the annulus. Different lifts
of one point or different cyclic markings are not distinct points. *Needs:* §5.1;
CotangentLagrangian §3.1.

**Checks.**
- For the K = 1 example of §5.1, with d = x₂ − x₁, the admissible band is −7/8 ≤ d ≤ −1/8 and
  W(d) = S₁(x₁, x₂) + S₂(x₂, x₁) = 1/32 − (d + 1/2)²/6; its critical set is the circle d = −1/2,
  where y₁ = −(4/3)d − 1/6 = 1/2, matching the circle of fixed points {y = 1/2} of F. Without the
  normalization of §5.1 the constant 1/32 becomes 1/24.
- W is invariant under the diagonal translation (x₁ + 1, x₂ + 1) but not under translating x₂
  alone, since S₁ depends on x₁ − x₂; only the diagonal quotient carries W.
- The momentum y₁ = −(4/3)d − 1/6 lies in [0, 1] exactly for d in the admissible band, taking the
  values 0 and 1 at d = −1/8 and d = −7/8. With CotangentLagrangian's sign of S the same computation
  gives the momenta (4/3)d + 1/6 ∈ [−1, 0], outside [0, 1] at every point of the band except
  d = −1/8.

### 5.3 The compact block and all face directions

Let P be the closed admissible configurations with 0 ≤ y_k ≤ 1 for every k. P is compact after the
diagonal quotient: x₁ lies on S¹ and every successive displacement X_k(x_k, y_k) − x_k is uniformly
bounded on its compact periodic strip. All boundary and generating functions extend to an open
neighbourhood of P. There, multiply −grad W by a compactly supported smooth cut-off equal to 1 near
P and extend by zero in S¹ × ℝ^(2K−1); DifferentialGeometry §3.3 gives a complete flow Φ, and the
dynamics on P are unchanged. Only the critical points of W in the maximal invariant set Inv(P) are
counted.

At a face y_k = c ∈ {0, 1}, boundary preservation gives Y_k = c. Let B_k(x) = X_k(x, c), so B_k′ > 0.
Differentiating c = −∂₁S_k(x, B_k(x)) gives S₁₁ = −S₁₂ B_k′ at that face, and S₁₂ = −1/X_ky, negative
for even factors and positive for odd ones. Along the negative gradient,
`ẏ_k = S_11 (Y_(k−1) − y_k) + S_12 (Y_k − y_(k+1))`. For a positive (even) factor this points weakly
inward on both faces; for a negative (odd) factor, weakly outward. Equality holds exactly when both
neighbouring incoming momenta equal the same c: Y_(k−1) = c iff y_(k−1) = c, because the preceding
factor is a boundary-preserving diffeomorphism. Evaluate these derivatives at the stated
action-coordinate pair.

Prove the edge cases, not only open faces. Take a maximal cyclic run of inputs equal to c. It cannot
be the full cycle, which would give a fixed lift on the corresponding boundary, contradicting the
strict boundary inequality. If the run has a negative-factor endpoint, its outward derivative is
strict. If both endpoints are positive-factor inputs and the run contains a negative-factor input,
an adjacent negative input has zero first derivative but a strict outward second derivative: on a
boundary face dY_j = (1/B_j′) dy_j, and at a negative face with zero first derivative the
coefficient-derivative terms vanish, giving `ÿ_k = S_11 ẏ_(k−1) / B_(k−1)′ − S_12 ẏ_(k+1)`, whose
neighbouring positive-face derivatives have the inward sign, one of them strict at a run endpoint.
If the boundary point has only positive-factor faces, each has a strict inward derivative, so the
reverse flow exits. Thus every boundary point exits in at least one time direction, and the closed
positive exit set is exactly `L = {x ∈ P : y_k = 0 or 1 for some odd k}`. Prove the Taylor-sign
statements in a common smooth extension neighbourhood. No critical point lies on the boundary.

Establish the index-pair data of the cut-off flow Φ on (P, L): first exit is immediate on L; its
time tends to 0 for points of P approaching L, by the strict first- or second-order exit; away from
L all active positive faces are strictly entering, and every positive-time trajectory before its
first exit is interior. An interior trajectory's first finite exit cannot have only second-order
outward tangencies: such a face is outside for both small positive and small negative times about
that event, contradicting its first-exit property. Therefore some active odd face has a strict
first-order outward derivative at every first finite exit reached from the interior. The implicit
function theorem and a compact-time interior margin give continuity of that exit time away from L.
At L, for every small positive reference time the actual trajectory is already strictly outside P;
continuous dependence makes nearby points exit by that time, so their exit times tend to 0. At an
inflow point with no odd face active, every active positive face is strictly inward, giving a
common initial interior segment for nearby points of P. These statements also give lower
semicontinuity at infinite exit time. Prove the corresponding joint quotient-flow continuity,
including time 0 and the base point, from these estimates and compactness. The exit time
τ : P → [0, ∞], continuous in this sense with τ = 0 exactly on L, is the input of the injectivity
lemma of §5.4; the raw image Φ^t(P) is not used as a subset of P. *Needs:* §5.2; DifferentialGeometry
§3.3 with Tau Ceti `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`.

**Checks.**
- In the K = 1 example, y₂ = −d ∈ [1/8, 7/8] on P, so the even faces are inactive; the descended
  negative gradient is d′ = (2/3)(d + 1/2), hence ẏ₁ = −(8/9)(d + 1/2) equals −1/3 at d = −1/8 (the
  face y₁ = 0) and +1/3 at d = −7/8 (the face y₁ = 1), both outward. So L is both boundary circles
  of the band and the relative orientation degree is 1. With CotangentLagrangian's sign of S, W
  changes sign, the flow reverses and both derivatives point inward: the exit set is empty, and the
  pair (P, ∅) fails the cup-module isomorphism of §5.4, since Ȟ²(P) = 0 while Ȟ¹(P₀) = ℝ.
- At y_k = 0 for an even factor (S₁₂ < 0) the formula gives ẏ_k = S₁₂(−B_k′Y_(k−1) − y_(k+1)) ≥ 0,
  into y_k ≥ 0; for an odd factor (S₁₂ > 0) the same expression is ≤ 0, outward. The identity
  S₁₁ = −S₁₂B_k′ is what makes the two terms combine with one sign.
- All inputs y_k = 0 would be a lifted fixed point on the lower boundary, excluded by
  F^x(x, 0) < x; in the K = 1 example y₁ = 0 forces d = −1/8 and then y₂ = 1/8 ≠ 0.

### 5.4 Pair deformation, the shifted cup module and the cup-length bound

Use (x₁, y₁, …, y_(2K)) to reconstruct successive positions by X_k and impose the single equation
G = x_(2K+1) − x₁ = 0. Put u for the K even (positive) incoming momenta and v for the K odd
(negative) momenta. Since every X_kx > 0, the chain rule gives ∂G/∂uᵢ > 0 and ∂G/∂vᵢ < 0. At all
inputs 0, G = F^x(x₁, 0) − x₁ < 0; at all inputs 1, G = F^x(x₁, 1) − x₁ > 0. So for each (x₁, v),
G(x₁, 0, v) < 0 < G(x₁, 1, v), and the unique diagonal root u = t(x₁, v)·1 lies in the open
positive cube and depends smoothly and periodically on (x₁, v).

Construct an explicit strong deformation retraction of each positive-input level fibre to that
root. For u with G = 0, first interpolate a_s = (1 − s)u + s t·1. Choose τ ∈ [−1, 1] with
G(x₁, clamp(a_s + τ·1, 0, 1), v) = 0, by the endpoint signs and the intermediate value theorem.
Although τ can have a plateau at a vertex, the resulting vector is unique: increasing τ makes every
coordinate nondecreasing, and any strict coordinate increase strictly increases G. Continuity
follows by compactness of [−1, 1], subsequences and uniqueness of that vector. At s = 0 it is u, at
s = 1 it is t·1, the root stays fixed throughout, the construction preserves (x₁, v) and it is
periodic in x₁. Therefore it is a homotopy equivalence of pairs
`(P, L) ≃ (S^1 × [0,1]^K, S^1 × ∂([0,1]^K))`, commuting with the circle projection, for every K; in
particular the relative orientation class has degree K.

Choose v₀ in the open negative cube. The root section at v₀ embeds a circle P₀ ⊂ P, and α : P → P₀
given by x₁ is a retraction. CharacteristicClasses §1.2b supplies the Čech cohomology of a
topological space with constant coefficients, as the colimit over open covers, its homotopy
invariance and its cup-compatible comparison with singular cohomology on closed CW pairs. Prove
here its compact-pair theory: for compact metric pairs (X, A), the relative groups Ȟ^*(X, A; ℝ), the
exact sequence of the pair, homotopy invariance for maps of pairs, excision for closed covers
X = A ∪ B (Ȟ^*(X, A) ≅ Ȟ^*(B, A ∩ B)), continuity for a compact subset S ⊂ X (a class of Ȟ^*(X)
vanishing on S vanishes on a closed neighbourhood of S), and the relative cup product
Ȟ^j(X) ⊗ Ȟ^k(X, A) → Ȟ^(j+k)(X, A) with its naturality under maps of pairs. Prove these as Spanier's
theorems for Alexander–Spanier cohomology (Spanier, Algebraic Topology, Ch. 6, §§6.6–6.9), and prove
the transport: a natural isomorphism, for compact Hausdorff pairs (X, A) with A closed, between the
open-cover Čech cohomology of §1.2b and Alexander–Spanier cohomology, compatible with maps of pairs
and with cup products, so that every statement above holds for the groups of §1.2b. On the model
pair (S¹ × [0, 1]^K, S¹ × ∂[0, 1]^K) the comparison identifies these with AlgebraicTopology's
singular products (§6.2, the absolute-relative module action) and its Künneth isomorphism over the
field ℝ (§5.1). Transporting the pair homotopy equivalence above, obtain u ∈ Ȟ^K(P, L; ℝ), the
pullback of the generator of H^K([0, 1]^K, ∂[0, 1]^K; ℝ), such that v ↦ u ∪ α^*v is an isomorphism
Ȟ^j(P₀; ℝ) → Ȟ^(j+K)(P, L; ℝ) for every j; identify the chosen relative cube orientation and the
Koszul sign (−1)^(Kj) when changing the cup order in degree j.

Prove the two flow-theoretic statements the count rests on (Conley–Zehnder, Invent. Math. 73 (1983),
pp. 33–49, whose torus argument they are). Let Φ be the complete cut-off flow of §5.3, S = Inv(P)
the maximal invariant subset of P, and L the exit set.

- *The injectivity lemma.* If cup product with a class u ∈ Ȟ^K(P, L) is an isomorphism
  Ȟ^j(P) → Ȟ^(j+K)(P, L) for every j, then restriction Ȟ^*(P) → Ȟ^*(S) is injective. Route: for
  t ≥ 0 let N_t be the points whose forward orbit stays in P for time t and E_t those leaving by
  time t, closed sets with P = N_t ∪ E_t; the map r_t sending p to its position at time
  min(t, τ(p)), with τ the exit time of §5.3, is continuous, maps L and E_t into L, and is homotopic
  to the identity as a map of pairs (P, L) → (P, L). So the pair inclusion (P, L) → (P, E_t) is a
  left inverse of r_t up to homotopy; for v ∈ Ȟ^j(P) vanishing on N_t, u ∪ v = j^*(r_t^*u ∪ v), and
  r_t^*u ∪ v lies in Ȟ^*(P, E_t) ≅ Ȟ^*(N_t, N_t ∩ E_t), where it restricts to
  (r_t^*u)| ∪ (v|_(N_t)) = 0 by naturality; hence u ∪ v = 0, v = 0, and Ȟ^*(P) → Ȟ^*(N_t) is
  injective. Continuity passes to S⁺ = ∩_t N_t, the points whose forward orbit stays in P. From S⁺
  to S: every ω-limit set of a point of S⁺ lies in S, so by compactness Φ^t maps S⁺ into any
  prescribed neighbourhood of S in S⁺ for t large; Φ^t on S⁺ is homotopic to the identity, so a
  class vanishing on S, hence on that neighbourhood by continuity, vanishes on S⁺.
- *The cup-length bound.* A flow on a nonempty compact metric space S with a continuous Lyapunov
  function strictly decreasing along every nonconstant orbit has at least cl(Ȟ^*(S; ℝ)) + 1 rest
  points, where the cup length cl is the largest ℓ with a nonzero ℓ-fold product of positive-degree
  classes (0 if there is none, ∞ if there is no largest). Route: the Lusternik–Schnirelmann minimax
  over the sublevel sets of the Lyapunov function, with the deformation lemma supplied by the flow
  and compactness, continuity to pass from a finite rest-point set at a level to a neighbourhood,
  and the standard argument that a repeated minimax level carries infinitely many rest points.

Here the Lyapunov function is W; the class of S¹ survives in Ȟ¹(S) by the injectivity lemma, so
S is nonempty, cl(Ȟ^*(S)) ≥ 1 and W has at least two critical points in Inv(P), which §5.2
converts into the two fixed points. Every topology, flow, relative-cup and orbit-dictionary construction above is a
required part of the theorem, proved on the constructed carriers. *Needs:* §§5.2–5.3;
CharacteristicClasses §1.2b; AlgebraicTopology §5.1 and §6.2; DifferentialGeometry Layer 3.

**Checks.**
- In the K = 1 example, G(x₁, u, v) = u − (6v + 1)/8 with ∂_uG = 1 > 0 and ∂_vG = −3/4 < 0;
  G(x₁, 0, 0) = −1/8 is F^x(x, 0) − x and G(x₁, 1, 1) = 1/8 is F^x(x, 1) − x; the root
  t(v) = (6v + 1)/8 lies in (0, 1) for every v ∈ [0, 1].
- For K = 1 the pair is (S¹ × [0, 1], S¹ × {0, 1}), u is the class of ([0, 1], {0, 1}), and
  v ↦ u ∪ α^*v is an isomorphism Ȟ⁰(P₀) → Ȟ¹(P, L) and Ȟ¹(P₀) → Ȟ²(P, L) between one-dimensional
  spaces; the Koszul sign for j = 1 is −1.
- Negative control for the injectivity lemma: for the flow ẏ = 1 on P = S¹ × [0, 1], L is the upper
  circle, Ȟ^*(P, L) = 0, so the cup hypothesis fails for every u, and indeed Inv(P) = ∅ has
  Ȟ^*(∅) = 0.
- The cup-length bound is sharp: the gradient flow of the height function on S¹ has exactly
  2 = cl(Ȟ^*(S¹)) + 1 rest points; the K = 1 example has the whole circle d = −1/2 of rest points,
  infinitely many, consistent with the bound.
- Negative control for nonemptiness: the empty space carries a flow, the Lyapunov condition holds
  vacuously and Ȟ^*(∅) = 0 has no nonzero product, so cl = 0 and the bound would ask for one rest
  point where there is none. On a nonempty S the case cl = 0 holds, since a point where the
  Lyapunov function attains its minimum on S is a rest point.

### 5.5 The strict annulus fixed-point theorem

Prove `strict_annulus_two_fixed_points`, the lifted form of the theorem on open partial
homeomorphisms of the plane (Le Calvez–Wang, Thm. 1, p. 704; Conley–Zehnder): let F be an open
partial homeomorphism of ℝ² whose source and target contain the closed strip `strip`, smooth on its
source with smooth inverse on its target, mapping the strip onto itself, commuting with T on the
strip, and preserving the area form ρ dx ∧ dy of a smooth positive density ρ on the strip that is
1-periodic in x, in the sense ρ(F(p)) det DF_p = ρ(p) for p in the strip. Suppose F preserves both
boundary lines with F^x(x, 0) < x and F^x(x, 1) > x for every x. Then F has two fixed points p ≠ q
in `interiorFundamentalDomain`, which are therefore distinct points of the annulus. No
nondegeneracy and no monotone interior twist is assumed. The constant density is the standard-area
case, and §5.0 reduces every density to it. Route: §5.0 normalizes the area, §5.1 factors F into
twists with generating functions, §5.2 turns fixed points into critical points of W, §5.3 builds the
block (P, L), and §5.4 proves that W has two critical points in Inv(P). *Needs:* §§5.0–5.4.

**Checks.**
- For F(x, y) = (x + (2y − 1)/8, y), take c = 1 and K = 1. With d = x₂ − x₁, −7/8 ≤ d ≤ −1/8 and
  W(d) = 1/32 − (d + 1/2)²/6 with the S_k normalized on their lower boundary graphs; the descended
  Euclidean negative gradient has d′ = (2/3)(d + 1/2), so both endpoints exit and the relative
  orientation degree is 1, and the fixed points of F fill the circle y = 1/2.
- The rigid rotation (x + 1/4, y) preserves area and both boundaries but displaces both boundary
  circles in the same direction, and it has no fixed point: the strict opposite displacements are
  not removable.
- Fixed points of an iterate F^k are marked phase points; a statement about geometrically distinct
  periodic orbits needs a separate orbit count.

### Examples

The worked example of §§5.1–5.5 is the shear F(x, y) = (x + (2y − 1)/8, y), whose fixed points form
the circle y = 1/2; every check of the layer is computed on it.

### Dependencies

§2.0 (the circle `AddCircle 1`); CotangentLagrangian Layer 3 and §3.1; DifferentialGeometry Layer 3
(§§3.2, 3.3, 3.5) with Tau Ceti's flows; CharacteristicClasses §1.2b; AlgebraicTopology §5.1 and §6.2;
Mathlib's translation numbers of circle lifts; Smale's and Epstein's theorems. Nothing of Layers 1, 3
or 4.

## Downstream consumers

The suspension construction S0 of the SymplecticGeometry family uses the period-1 circle of §2.0;
MathematicalBilliards uses the compact-pair Čech continuity and the cup-length bound of §5.4;
LocalVariationalFieldTheory uses the particle mechanics of Layer 3.

## Scope and ownership

**This roadmap owns** the local commuting-flow, Carathéodory–Jacobi–Lie and Williamson theory of
Layer 1 (§§1.2–1.4); the deck action, fibre atlas, association, open-restriction, finite-family and
estimate parts of the positive-period circles (§2.0); the Liouville–Arnold theorem without global
completeness, the saturated neighbourhood, the smooth period lattice, action–angle coordinates and
actions as periods (§§2.1–2.5); the symplectic and Lagrangian obstruction theory of Lagrangian torus
fibrations, which SmoothBundlesConnections B6.6 leaves to this roadmap, and the global action–angle
criteria (§§2.6–2.7); the Lagrangian vector field, the Legendre transform of hyperregular Lagrangians, time-dependent mechanics, the first variation and
Noether's theorem (Layer 3); the examples of Layer 4 beyond the library's computations; and the
strict annulus fixed-point theorem with its annulus isotopy theorem (§5.1), its index-pair data
(§5.3), the compact-pair Čech theory with its Alexander–Spanier comparison and the Conley–Zehnder
injectivity and cup-length statements (§5.4).

**Already in the library and consumed by name in the supplier contracts.** Integrable systems and
first integrals, the rank of a map, regular fibres, the linear involutive theory, factorization of
functions in involution, invariance of integrability, commuting complete flows, completeness for
proper systems, the Hamiltonian flow action with its transitivity, stabilizer and quotient
homeomorphism, quadratic Hamiltonians, local Darboux, the manifold inverse function theorem
(Tau Ceti); the circles `AddCircle p` with their atlas, Lie group structure, translation flow,
orientation, time form and rescalings, tori with coordinate time forms, volume form and orientation,
the total family of circles and its pullback families with their forms (Tau Ceti), and Mathlib's
topological `AddCircle` and its covering map; families of lattices and their tori (Tau Ceti); the
Legendre map, energy, fibre Hessian, regularity, Cartan forms, mechanical Lagrangians, kinetic energy
and the cotangent-lift moment map with the Hamiltonian Noether theorem (Tau Ceti); the central-force
Hamiltonian, angular momentum and its conservation, independence and integrability of (H, L), radial reduction, the Runge–Lenz vector,
Kepler orbits, radial actions, periods and apsidal angles for Kepler and the isotropic oscillator,
the oscillator action–angle parametrization, period lattice and resonance, and the unit-mass
free-particle generating function (Tau Ceti); translation numbers of circle lifts and the
Levi–Civita connection (Mathlib); flows, time-dependent flows and completeness of compactly
supported fields (Tau Ceti, as recorded by DifferentialGeometry Layer 3).

**Owned elsewhere and consumed here.** Generic smooth free and properly discontinuous quotients are
Tau Ceti's manifold quotient API; generic forms, wedge, exterior derivative and integration of forms
over chains are DifferentialGeometry Layers 0–1 and §8.4; flows and commuting flows
DifferentialGeometry Layer 3 (§§3.2–3.5); Frobenius DifferentialGeometry Layer 4; cotangent forms,
canonical transformations, generating functions and the chain dictionary CotangentLagrangian
(Layer 3, §3.1); moment maps and regular reduced spaces HamiltonianReduction (Layers 1 and 3); the period
and weight lattices of tori ConvexityToric §1.1, on the exponential of
RepresentationTheory/LieGroups; geodesics and their flow HopfRinow Layer 1; regular fibres,
Ehresmann's fibration theorem, sheaves and Čech comparisons, and the topological classification of
affine torus bundles SmoothBundlesConnections (B1.0, B1.5, B6.1, B6.6); local-coefficient
cohomology, products and the Künneth isomorphism AlgebraicTopology (§§2.6, 5.1, 6.2); Čech
cohomology of spaces and its comparison with singular cohomology CharacteristicClasses §1.2b. A
classification of central potentials with closed orbits and a count of geometrically distinct
periodic orbits of iterates are not part of this roadmap.

**Earlier numbering.** I1, I2, I3, I4 and I5 are now Layers 1–5, the theorem stated under I5 being
§5.5; I2.0 is now §2.0; and I5.0, I5.1, I5.2, I5.3 and I5.4 are now §§5.0, 5.1, 5.2, 5.3 and 5.4.

## Exact supplier contracts

### From Mathlib

- `AddCircle`, with `AddCircle.isCoveringMap_coe` (the quotient map ℝ → `AddCircle p` is a covering
  map), and `properlyDiscontinuousSMul_iff_properSMul`.
- `CircleDeg1Lift` and its translation number, with
  `CircleDeg1Lift.translationNumber_lt_of_forall_lt_add`,
  `CircleDeg1Lift.lt_translationNumber_of_forall_add_lt` (a continuous lift with uniform
  displacement below or above z has translation number below or above z) and
  `CircleDeg1Lift.translationNumber_of_eq_add_int` (a point moved by an integer m gives translation
  number m).
- `CovariantDerivative.leviCivitaConnection`, the Levi–Civita connection of a Riemannian metric.
- `skewAdjointLieSubalgebra`, the symplectic Lie algebra sp(V, ω) of the form ω.
- `ContinuousAlternatingMap.ofSubsingletonLIE`, `ContMDiffSection`, `IsCancelSMul`,
  `connectedComponentIn`, `OpenPartialHomeomorph`, `LinearMap.det`, `Flow`.

### From Tau Ceti

All the declarations below are proved at the pin.

- *Hamiltonian calculus*: `TauCeti.SmoothTwoForm.hamiltonianVectorField`,
  `TauCeti.SmoothTwoForm.poissonBracket`, `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_eq_mvfderiv`,
  `TauCeti.SymplecticForm.poissonBracket_constSmooth`, `TauCeti.CotangentBundle.symplecticForm`,
  `TauCeti.CotangentBundle.liouvilleForm`, `TauCeti.SmoothBundleForm.eval₂`.
- *Integrable systems*: `TauCeti.SmoothTwoForm.IsIntegrableSystem` (smooth F : M → (ι → ℝ), pairwise
  Poisson-commuting components, regular points dense, 2·|ι| = dim M),
  `TauCeti.SmoothTwoForm.IsFirstIntegral`, `TauCeti.SmoothTwoForm.IsIntegrableSystem.isOpen_setOf_isRegularPoint`,
  `TauCeti.SmoothTwoForm.IsIntegrableSystem.isLagrangian_ker_mfderiv`,
  `TauCeti.SmoothTwoForm.IsIntegrableSystem.exists_eventuallyEq_comp`,
  `TauCeti.SmoothTwoForm.IsIntegrableSystem.exists_eqOn_comp` (on a boundaryless manifold),
  `TauCeti.SmoothTwoForm.IsIntegrableSystem.comp_isLocalDiffeomorph` (M nonempty),
  `TauCeti.SmoothTwoForm.IsIntegrableSystem.comp_left`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.orthogonal_ker_mfderiv`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.isCoisotropic_ker_mfderiv_iff`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.two_mul_card_le_finrank`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.ker_mfderiv_eq_span_hamiltonianVectorField`,
  `TauCeti.isIntegrableSystem_harmonicOscillator`.
- *Rank and regular fibres*: `TauCeti.IsRegularPoint`, `TauCeti.mfderivRank`,
  `TauCeti.isRegularPoint_iff_mfderivRank_eq`, `TauCeti.not_isRegularPoint_iff_mfderivRank_lt`,
  `Diffeomorph.mfderivRank_diffeomorph_comp`, `Diffeomorph.mfderivRank_comp_diffeomorph`,
  `TauCeti.exists_regularFiber_smoothEmbedding` (for C^m maps, 1 ≤ m, at a value in the interior of
  the target model, with no separation hypothesis).
- *Flows*: `TauCeti.flowOf`, `TauCeti.IsCompleteVectorField`,
  `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`,
  `TauCeti.isCompleteVectorField_timeDependentSuspensionField`, `TauCeti.timeDependentFlowDiffeomorph`,
  `TauCeti.SmoothTwoForm.IsSymplectic.commute_globalFlowDiffeomorph`,
  `TauCeti.SmoothTwoForm.IsIntegrableSystem.isCompleteVectorField_hamiltonianVectorField_of_isProperMap`
  (these two on a finite-dimensional Hausdorff boundaryless M).
- *The flow action on a level* (complete fields on a finite-dimensional Hausdorff boundaryless M of
  dimension 2·|ι|):
  `TauCeti.SmoothTwoForm.IsSymplectic.hamiltonianFlowAction`,
  `TauCeti.SmoothTwoForm.IsSymplectic.range_hamiltonianFlowAction_apply`,
  `TauCeti.SmoothTwoForm.IsSymplectic.discreteTopology_hamiltonianFlowStabilizer`,
  `TauCeti.SmoothTwoForm.IsSymplectic.quotientHamiltonianFlowStabilizerHomeomorph`,
  `TauCeti.SmoothTwoForm.IsSymplectic.compactSpace_quotient_hamiltonianFlowStabilizer`.
- *Linear and local symplectic geometry*: `TauCeti.SymplecticForm.commute_fderiv_hamiltonianVectorField`
  (at a common critical point of two C² functions Poisson-commuting near it, the linearizations of
  their Hamiltonian fields commute), `TauCeti.SymplecticForm.hamiltonianEndEquiv`,
  `TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` (Darboux, on an open
  subset of a finite-dimensional space), `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` (the manifold
  inverse function theorem, at an interior point, for a complete model).
- *Circles, tori and families*: `TauCeti.PeriodLine`, `TauCeti.PeriodLine.instIsCancelSMul`,
  `TauCeti.PeriodLine.instProperlyDiscontinuousSMul`, `TauCeti.PeriodLine.quotientDiffeomorph`,
  `TauCeti.instIsManifoldQuotient`, `AddCircle.instIsManifold`, `AddCircle.coe_apply_of_mem_atlas`,
  `AddCircle.exists_eventuallyEq_add_zsmul`, `AddCircle.mem_maximalAtlas_of_coe_apply`, `AddCircle.isLocalDiffeomorph_coe`,
  `AddCircle.instLieAddGroup`, `AddCircle.translationFlow`, `AddCircle.globalFlow_timeVectorField`,
  `AddCircle.instOrientable`, `AddCircle.orientation`, `AddCircle.timeForm`, `AddCircle.eq_timeForm_iff`,
  `AddCircle.pathIntegral_timeForm_coe`, `AddCircle.mpullback_zsmul_timeForm`,
  `AddCircle.degreeOneEquiv_timeForm`, `AddCircle.diffeomorphAddCircle`,
  `AddCircle.mfderiv_diffeomorphAddCircle`, `AddCircle.mpullback_diffeomorphAddCircle_timeForm`,
  `AddCircle.diffeomorphAddCircle_self`, `AddCircle.diffeomorphAddCircle_symm`,
  `AddCircle.diffeomorphAddCircle_trans`, `TauCeti.instIsManifoldPi`, `TauCeti.torusTimeForm`,
  `TauCeti.torusVolumeForm`, `TauCeti.torusOrientation`,
  `TauCeti.orientationSign_torusOrientation_reindex`, `TauCeti.CircleFamily`,
  `TauCeti.CircleFamily.angleForm`, `TauCeti.CircleFamily.timeForm`, `TauCeti.CircleFamily.totalForm`,
  `TauCeti.CircleFamily.orientation`, `TauCeti.CircleFamily.Pullback`,
  `TauCeti.CircleFamily.Pullback.rescale`, `TauCeti.SmoothForm.degreeOneEquiv`,
  `TauCeti.mpullback_inclusion_apply`, `TauCeti.Manifold.Orientation.restrict`,
  `TauCeti.Manifold.Orientation.prod`.
- *Lattice families*: `TauCeti.periodAddAction`, `TauCeti.isManifold_torusFamily`,
  `TauCeti.torusFamilyDiffeomorphProd` (for a C^n family of full lattices over a real manifold Y,
  the orbit space (Y × E)/Λ is a C^n manifold, C^n-diffeomorphic over Y to Y × ℝ^ι/ℤ^ι).
- *Mechanics*: `TauCeti.legendreMap`, `TauCeti.lagrangianEnergy`, `TauCeti.fiberHessian`,
  `TauCeti.IsRegularLagrangian`, `TauCeti.isLocalDiffeomorph_legendreMap_iff` (on a boundaryless
  tangent bundle), `TauCeti.cartanForm`, `TauCeti.cartanTwoForm`,
  `TauCeti.mpullback_legendreMap_symplecticForm`, `TauCeti.mechanicalLagrangian`,
  `TauCeti.CotangentBundle.kineticEnergy`, `TauCeti.CotangentBundle.momentMap`,
  `TauCeti.CotangentBundle.isEquivariantMomentMap_momentMap` (on a finite-dimensional Hausdorff
  boundaryless Q, for a Hausdorff boundaryless Lie group on a complete model),
  `TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff` (Noether's theorem: for a moment
  map of a nondegenerate form on a finite-dimensional manifold, {⟨μ, ξ⟩, f} = 0 exactly when the
  derivative of f along ξ_M vanishes).
- *Oscillators and the free particle*: `TauCeti.oscillatorHamiltonian`, `TauCeti.oscillatorActionAngle`,
  `TauCeti.oscillatorAction`, `TauCeti.oscillatorAngle`, `TauCeti.oscillatorActionAngle_add_eq_self_iff`,
  `TauCeti.isClosedEmbedding_oscillatorTorusEmbedding`, `TauCeti.closure_range_oscillatorActionAngle_eq_iff`,
  `TauCeti.freeParticleGeneratingFunction`,
  `TauCeti.cotangentGeneratingTarget_freeParticleGeneratingFunction_eq_cotangentGeneratingSource`
  (on a real Hilbert space, unit mass, t ≠ 0).
- *Central forces*: `TauCeti.centralForceHamiltonian`, `TauCeti.angularMomentum`,
  `TauCeti.stdSymplecticForm_poissonBracket_centralForceHamiltonian_angularMomentum` (q ≠ 0, the
  potential differentiable at ‖q‖), `TauCeti.isRegularPoint_centralForceEnergyMomentum_iff`
  (m ≠ 0, q ≠ 0, U with derivative U′ at ‖q‖: regular iff not both ⟨q, p⟩ = 0 and
  U′ = L²/(m‖q‖³)), `TauCeti.isIntegrableSystem_centralForceEnergyMomentum` (m ≠ 0, U smooth on
  (0, ∞)), `TauCeti.radialProjection`,
  `TauCeti.fderiv_radialProjection_hamiltonianVectorField_centralForceHamiltonian`,
  `TauCeti.effectivePotential_le_centralForceHamiltonian`,
  `TauCeti.centralForceHamiltonian_eq_effectivePotential_iff`, `TauCeti.forall_hasDerivAt_circularMotion_iff`,
  `TauCeti.stdSymplecticForm_poissonBracket_inner_rungeLenz`, `TauCeti.norm_rungeLenz_sq_of_orthonormalBasis`,
  `TauCeti.norm_fst_eq_div_one_add_sqrt_mul_cos_angle` (m, κ > 0, ℓ² ≠ 0),
  `TauCeti.radialPeriod`, `TauCeti.apsidalAngle`, `TauCeti.kepler_radialAction_turningRadii`
  (m, κ > 0, ℓ ≠ 0, −mκ²/(2ℓ²) ≤ E < 0), `TauCeti.kepler_energy_eq_neg_div_sq_radialAction_add_abs`,
  `TauCeti.kepler_radialPeriod`, `TauCeti.kepler_kappa_eq`, `TauCeti.kepler_apsidalAngle`,
  `TauCeti.isotropicOscillator_radialAction` (between two distinct positive turning points, m, ν > 0).

### From TauCetiRoadmap.SymplecticGeometry

The family conventions: real finite-dimensional smooth manifolds, ω = −dλ, ι_(X_f)ω = df,
{f, g} = df(X_g), default circle period 2π. Its suspension S0 consumes §2.0 and is not an input.

### From TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian

Layer 3 (correspondences and generating functions), the generating calculus of correspondences
with the convention p = ∂_qS, P = −∂_QS, used in §4.1 and, with the opposite sign, throughout
Layer 5 here. Its §3.1 (discrete action, iterates and convex billiards), the chain dictionary
`exists_equiv_periodic_of_generating`: for generating functions S₀, …, S_(N−1) whose relations are
the graphs of maps φᵢ, the bijection by base points between critical configurations of the cyclic
action and the cyclic sequences of states fixed by the composite with every intermediate state
admissible, using neither finite dimension, nor a boundaryless model, nor symplecticity; used in
§5.2.

### From TauCetiRoadmap.SymplecticGeometry.HamiltonianReduction

Layer 1 (smooth actions, moment maps and equivariance), group-level moment maps and the
cotangent-lift moment map μ(q, p)(ξ) = p(ξ_Q(q)) with its equivariance, used in §4.2 here. Its
Layer 3 (regular reduction and its universal property), regular reduced spaces, used for the
reduction of the planar central-force system at L = ℓ in §4.2.

### From TauCetiRoadmap.SymplecticGeometry.ConvexityToric

§1.1, the 2π-normalized period and weight dictionary of a torus, Λ_Z = (2π)⁻¹ ker(exp), used for
the lattices of Layer 2.

### From TauCetiRoadmap.DifferentialGeometry

Layers 0–1 (forms, wedge, exterior derivative), Layer 3 (§3.2 maximal flows, §3.3 completeness of
compactly supported fields, §3.4 commuting flows for commuting fields, §3.5 time-dependent flows),
Layer 4 (Frobenius) and §8.4 (integrals of forms over smooth chains).

### From TauCetiRoadmap.RepresentationTheory.LieGroups

The exponential map of a Lie group, on which ConvexityToric §1.1's lattices of a torus are built.

### From TauCetiRoadmap.HopfRinow

Layer 1, the geodesic equation and the geodesic flow of the Levi–Civita connection, used in §3.1.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.0, the regular fibres of smooth maps (Tau Ceti's `TauCeti.exists_regularFiber_smoothEmbedding`)
with open restriction; B1.5, Ehresmann's fibration theorem for proper surjective submersions with
connected base, used in §2.2; B6.1, sheaves, Čech complexes and their comparisons on good covers;
B6.6, lattice local systems and the classification of affine torus bundles with fixed lattice local
system Λ by H²(M; Λ), used in §2.6.

### From TauCetiRoadmap.AlgebraicTopology

§2.6, local coefficient systems and twisted chains, the carrier of H²(B; Λ) in §2.6; §5.1, the
Eilenberg–Zilber and Künneth theorems; §6.2, cup products and the absolute-relative module action;
both used on the model pair of §5.4.

### From TauCetiRoadmap.CharacteristicClasses

§1.2b, the Čech cohomology Ȟ^q(X; A) of a topological space as a colimit over open covers, its
homotopy invariance and its cup-compatible comparison with singular cohomology on closed CW pairs,
used in §5.4.

## References

- Ana Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
  §18.4, Thm. 20.10 and Thm. 24.1.
- V. I. Arnold, *Mathematical Methods of Classical Mechanics*, Ch. 2 (central forces) and Ch. 10
  (§§49–50 for Liouville's theorem and action–angle variables).
- J. J. Duistermaat, *On global action-angle coordinates*, Comm. Pure Appl. Math. 33 (1980),
  687–706.
- R. Sjamaar, *Hans Duistermaat's contributions to Poisson geometry*, Bull. Braz. Math. Soc. (N.S.)
  42 (2011), 783–803, [arXiv:1110.5627v1](https://arxiv.org/abs/1110.5627v1), pp. 6–10, whose page
  numbers are the ones cited.
- N. T. Zung, *Symplectic topology of integrable Hamiltonian systems, II: Topological
  classification*, Compositio Math. 138 (2003), [arXiv:math/0010181v2](https://arxiv.org/abs/math/0010181v2),
  §2.3, whose numbering is the one cited.
- J. Marsden and T. Ratiu, *Introduction to Mechanics and Symmetry*, Ch. 7 (Lagrangian mechanics and
  the Legendre transform) and Ch. 11 (momentum maps and Noether's theorem).
- K. Efstathiou, A. Giacobbe, P. Mardešić and D. Sugny, *Rotation forms and local Hamiltonian
  monodromy*, J. Math. Phys. 58 (2017), [arXiv:1608.01579v2](https://arxiv.org/abs/1608.01579v2),
  whose section and page numbers are the ones cited.
- C. Laurent-Gengoux, E. Miranda and P. Vanhaecke, *Action-angle coordinates for integrable systems
  on Poisson manifolds*, [arXiv:0805.1679v2](https://arxiv.org/abs/0805.1679v2), Thm. 2.1 and
  Remark 2.2.
- E. Miranda and N. T. Zung, *Equivariant normal form for nondegenerate singular orbits of
  integrable Hamiltonian systems*, [arXiv:math/0302287v4](https://arxiv.org/abs/math/0302287v4),
  §§2.1–2.3.
- P. Le Calvez and J. Wang, [*Some remarks on the Poincaré–Birkhoff theorem*](https://www.ams.org/journals/proc/2010-138-02/S0002-9939-09-10105-3/),
  Proc. AMS 138 (2010), 703–715, Thm. 1.
- C. Conley and E. Zehnder, *The Birkhoff–Lewis fixed point theorem and a conjecture of V. I.
  Arnold*, Invent. Math. 73 (1983), 33–49.
- S. Smale, [*Diffeomorphisms of the 2-sphere*](https://www.ams.org/journals/proc/1959-010-04/S0002-9939-1959-0112149-8/),
  Proc. AMS 10 (1959), 621–626, Thm. B.
- D. B. A. Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. 115 (1966), 83–107, Thm. 6.4.
- A. Gramain, [*Le type d'homotopie du groupe des difféomorphismes d'une surface compacte*](https://www.numdam.org/item/ASENS_1973_4_6_1_53_0/),
  Ann. Sci. ÉNS 6 (1973), 53–66, Thm. 1.
- E. H. Spanier, *Algebraic Topology*, Springer, Ch. 6 (Alexander–Spanier and Čech cohomology).
