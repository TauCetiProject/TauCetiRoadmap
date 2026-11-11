# Roadmap: minimal surfaces

**Summary.** Develop the theory of smooth minimal hypersurfaces in Riemannian manifolds, with
submanifold statements in arbitrary codimension where the proof is the same, and of minimal
surfaces in three-manifolds where the arguments are specific to dimension two. The headline
results are the half-space theorem (MS4), local compactness and ε-regularity (MS5), the
Morse index and stability (MS6), the curvature estimate for stable surfaces (MS7), removable
singularities and compactness under bounded total curvature (MS8 and MS9), Frankel's theorem
(MS11) and the Choi–Schoen compactness theorem for minimal surfaces of bounded genus in
three-manifolds of positive Ricci curvature (MS12). Every hypothesis is explicit and every
proof has a written source; the main references throughout are Colding and Minicozzi's book
[CM], White's lecture notes [White] and Chodosh's lecture notes [Chodosh].

This README is the roadmap. `Suggested.lean` states the targets that are statable against the
pinned Mathlib without the immersion carriers of the parent roadmap; its docstring says which.

## Scope and ownership

This sub-roadmap of [RiemannianGeometry](../README.md) is independently definitive. Its
sections are labelled MS1–MS12, and an item is cited by section and position: 7.4 is the
fourth item of MS7. MS1 is the list of suppliers from the parent roadmap and owns one
corollary, stated there. MS2–MS12 own:

- MS2: the minimal-surface equation for graphs in `ℝ^(n+1)` and in coordinates on a
  Riemannian manifold, its interior estimates, the small-data Dirichlet problem with its
  foliation by minimal graphs, graphical neighbourhoods under a curvature bound with the
  scaling laws, the linear equation satisfied by the difference of two sheets with its
  Harnack and gradient estimates, and multi-valued graphs.
- MS3: monotonicity for proper minimal immersions with its affine-plane rigidity case, the
  boundary form of the tangency principle, the convex hull property, the maximum principle
  in a small ball, the mean value inequality, and the forms of Simons' identity used below.
- MS4: the first-contact lemma, unique continuation, the catenoid barriers and the half-space
  theorem.
- MS5: ε-regularity under small total curvature, compactness under bounded area and
  curvature for embedded and for immersed minimal hypersurfaces, including varying metrics,
  the point-picking lemma, and the smooth version of Allard regularity.
- MS6: the Morse index of a minimal submanifold, compact or by exhaustion, its identification
  with the number of negative eigenvalues of the Jacobi operator, the hypersurface and
  one-sided specializations, the instability of closed two-sided minimal hypersurfaces under
  `Ric > 0`, and the examples in `S³` and `ℝP³`.
- MS7: the equivalence between stability and positive Jacobi functions, Jacobi functions
  from Killing fields, the gradient estimate for positive Jacobi fields, the curvature
  estimate for stable surfaces, Bernstein's theorem, and limits of stable hypersurfaces.
- MS8: the removable-singularity theorem for embedded minimal surfaces with quadratic area
  growth and finite total curvature.
- MS9: compactness under bounded area and total curvature, multiplicity-one regularity, and
  the stability of limit components of higher multiplicity.
- MS10: Reilly's formula, the Choi–Wang eigenvalue estimate, Hersch's balancing lemma, the
  Yang–Yau eigenvalue bound, and the area bound from the genus under `Ric > 0`.
- MS11: the second variation of length between two submanifolds, Frankel's theorem, and the
  connectedness of preimages in finite covers.
- MS12: the Choi–Schoen compactness theorem.

Boundaries with the parent and with other roadmaps:

- The parent's R5a owns immersion geometry in arbitrary codimension, the first variation of
  volume and the catenoid and helicoid computations. R5b owns the second variation of
  volume, the normal Jacobi operator, its Dirichlet realization on relatively compact smooth
  domains with the index statement there, the scalar form on two-sided hypersurfaces and the
  double-cover description on one-sided ones. MS6 and MS7 consume them. MS6 owns the Morse
  index as an invariant of a minimal immersion: on closed sources, by exhaustion on
  noncompact ones, and in the examples. MS7 owns the theory of positive Jacobi functions and
  what follows from it.
- The parent's R5c owns the spectrum, the principal eigenfunction and the Dirichlet problem
  of Schrödinger operators on compact manifolds; R7.9 owns separating and two-sided
  hypersurfaces; R4.1 owns the Hessian of the distance and the smooth upper distance
  barriers; R4.5 owns Bonnet–Myers; R7.0 owns the scalar Bochner identity; R1 owns the
  Euclidean limits of rescaled metrics. The sub-roadmap
  [Local geometry of Riemannian surfaces](../Surfaces/README.md) owns the intrinsic geometry
  of surfaces (S1–S6). MS1 says which statement of each is consumed.
- [GeometricCurrents](../../GeometricCurrents/README.md) G6 owns monotonicity for stationary
  varifolds, the strong one-sided maximum principle for smooth minimal hypersurfaces, and
  Simons' identity and inequality. The interior tangency principle of 3.2 is that maximum
  principle: it is one theorem, consumed here, and 3.2 owns its boundary form. Item 3.1 is
  the statement for smooth proper minimal immersions, with its exact remainder, proved from
  the first variation without varifolds. Item 3.6 is Simons' identity in the forms and with
  the conventions used here; it is the same identity as G6's.
- [PDE](../../PDE/README.md) owns the linear elliptic theory: maximum principles and the
  Hopf lemma (PDE C13), Harnack inequalities (PDE C14), De Giorgi–Nash–Moser (PDE E23) and
  the Schauder estimates (PDE E22 and E25). This sub-roadmap owns their application to the
  minimal-surface equation and to the Jacobi equation.
- [PseudoholomorphicCurveAnalysis](../../PseudoholomorphicCurveAnalysis/README.md) PH2.4
  owns isothermal coordinates and PH7.2 owns Riemann–Roch. Item 10.4 consumes them.
- The one-sided curvature estimate [CM4, Theorem 0.2] and the uniqueness of the helicoid use
  most of this sub-roadmap, especially the curvature estimate of MS7 and the graphical
  neighbourhoods and multi-valued graphs of MS2, together with the multi-valued graph
  machinery of [CM4]; they are outside this sub-roadmap. So are the strong half-space theorem
  (the version for two disjoint surfaces), existence theory (the Plateau problem) and
  singular hypersurfaces.

## Conventions

The ambient manifold is as in the parent: finite-dimensional, real, Hausdorff,
second-countable, boundaryless and smooth, with a smooth positive-definite Riemannian metric.
Submanifolds are smoothly immersed without branch points in a Riemannian manifold N and carry
the induced metric: n-dimensional (`1 ≤ n < m`) in an m-manifold N when arbitrary codimension
is stated, and otherwise hypersurfaces (`n ≥ 2`, `m = n+1`), with a surface being the case
`n = 2` in a three-manifold. A submanifold may have boundary, and "interior" refers to it.
A two-sided hypersurface is one admitting a global smooth unit normal ν. "Closed" means
compact without boundary. Genus refers to a connected orientable surface.

Curvature follows the parent: `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y]Z`. Write
`Rm(X,Y,Z,W) = ⟨R(X,Y)Z,W⟩`, so that `Rm(X,Y,Y,X) = K(span(X,Y))` for orthonormal X and Y,
`Ric` for the Ricci tensor and `R_g` for the scalar curvature of a metric g.

Write `Area` for the n-dimensional volume, also written `|Σ|`; `II` for the
normal-bundle-valued second fundamental form in general codimension, which is the parent's
B; A for the scalar second fundamental form of a hypersurface with respect to a unit normal,
and `|A|²` for the sum of the squares of its principal curvatures, which is `|II|²` and does
not depend on the normal; `B_r(p)` for an ambient ball and `B_r^Σ(p)` for an intrinsic one.

`Δ = div grad` is the Laplacian with the analyst's sign. On functions it is Tau Ceti's
`TauCeti.Manifold.laplaceBeltrami`, and it is the negative of the parent's nonnegative
Laplacian: `Δ = −Δ⁺`. Every formula below is written with Δ. In particular the stability
operator of a two-sided hypersurface is `J = Δ + |A|² + Ric_N(ν,ν)`, and R5b's hypersurface
Jacobi operator `L = Δ⁺ − (|A|² + Ric_N(ν,ν))` is `−J`; the quadratic form Q and the notion
of stability are the same. For a closed connected Riemannian manifold, `λ₁(−Δ)` is the first
positive eigenvalue of `−Δ = Δ⁺`, so an eigenfunction satisfies `Δφ + λ₁φ = 0`.

The parent's mean curvature is the averaged vector `H = (1/n) tr II`. A submanifold is
minimal when `H = 0`, which does not depend on the normalization. A nonzero mean curvature
enters only in Reilly's formula (10.1), which uses the sum of the principal curvatures and
states its own sign convention.

## Exact supplier contracts

### MS1. Background from TauCetiRoadmap.RiemannianGeometry

Sections R5a (immersion geometry and first variation) and R5b (second variation) of the
parent supply the following, in arbitrary codimension before specializing to hypersurfaces.

- Induced connections, the normal bundle and normal connection, the second fundamental
  form, the mean-curvature vector, and the Gauss, Codazzi and Ricci equations in arbitrary
  codimension [CM, §1.1]. MS1 owns their corollary for a minimal surface in `ℝ³`:
  `K = −½|A|²` [CM, §1.1] [White, §§2–3] [Chodosh, Corollary 7.9].
- First variation of volume in arbitrary codimension, and the equivalence between vanishing
  mean curvature and stationarity under compactly supported variations [CM, §§1.1, 1.3]
  [White, §1, Theorem 1] [Chodosh, §7]. In `ℝ^m`, minimality of an n-dimensional submanifold
  is equivalent to harmonicity of the coordinate functions [CM, Lemma 1.8]
  [White, Theorem 13] [Chodosh, Theorem 8.1].
- Second variation of volume, the normal-bundle Jacobi operator in arbitrary codimension and
  its scalar specialization on two-sided hypersurfaces, with the normal-bundle and
  double-cover form on one-sided hypersurfaces, and stability under compactly supported
  normal variations [CM, §1.8] [White, §3, Theorem 28] [Chodosh, §§23–24].
- The geometry of the plane, catenoid and helicoid in `ℝ³`, including verification of
  minimality and computation of their curvature [CM, §1.2] [White, §§1–2]
  [Chodosh, §§13–14]; minimality of the plane and of the helicoid also follows without
  computation from reflection symmetries [Chodosh, Lemma 13.1].

The parent and its sub-roadmap on surfaces also supply the Riemannian tools of the arguments
below.

- **Intrinsic geometry of surfaces.** The sub-roadmap
  [Local geometry of Riemannian surfaces](../Surfaces/README.md) develops the intrinsic
  geometry of a surface Σ (`n = 2`), without assuming it complete:
  - geodesic polar coordinates on a normal ball `B_r^Σ(p)`, where the length `L(r)` of the
    geodesic circle and the area `V(r)` of the disk satisfy `V′ = L` and
    `L′(r) = 2π − ∫_(B_r^Σ(p)) K` (S1; see also [CM, §2.3] [White, Proposition 32, Lemma 34]);
  - integration in normal coordinates from a boundary arc or circle of a compact domain, up
    to the cut time, with `|∇d| = 1` almost everywhere and the coarea formula for the
    intrinsic distance d to the arc (S2);
  - Gauss–Bonnet for a disk with piecewise smooth boundary (S3);
  - normal balls without completeness (S4): on an intrinsic ball with compact closure in the
    interior on which `K ≤ 0` (or `K ≤ κ` with radius below `π/√κ`, by Jacobi comparison),
    `exp_p` is defined on the tangent ball and is a local diffeomorphism, and when `K ≤ 0`
    and the ball is simply connected and contained in one coordinate chart (for instance a
    ball in a disk parametrized by one chart), `exp_p` maps the tangent ball
    diffeomorphically onto it, radial geodesics realizing the distance;
  - the conformal invariance of the Dirichlet energy `∫|∇φ|²` of a function on a surface
    (S5);
  - the logarithmic cutoff (S6): for a point p of a Riemannian surface Σ, a radius δ below a
    normal-ball radius at p and `0 < 4ε ≤ δ`, there is a smooth function
    `χ_ε : Σ → [0,1]` with `χ_ε = 0` on `B_ε^Σ(p)` and `χ_ε = 1` outside `B_δ^Σ(p)` whose
    Dirichlet energy `∫_Σ |∇χ_ε|² dμ` is `2π/log(δ/ε)` up to an error of order
    `1/log(δ/ε)²`, and so tends to 0 as `ε → 0⁺`: a point of a Riemannian surface has zero
    2-capacity, the capacity of the Dirichlet energy. The cutoff is `χ_ε = ψ ∘ r`, where `r = dist_g(p,·)`
    and ψ is a smooth nondecreasing function equal to 0 on `[0,ε]`, to 1 on `[δ,∞)` and to
    `log(r/ε)/log(δ/ε)` on `[2ε, δ/2]`, and the energy is computed in the geodesic polar
    coordinates of S1. Consequently an inequality `∫ Vφ² ≤ ∫ |∇φ|²`, with V continuous,
    that holds for the test functions supported away from a finite set of points holds for
    every compactly supported test function.

  These are the intrinsic surface tools used below: Gauss–Bonnet and the logarithmic cutoff
  in MS9, and conformal invariance of the Dirichlet energy in MS10.
- **Bochner formula.** The Bochner formula for functions (R7.0),
  `½Δ|∇f|² = |∇²f|² + ⟨∇f,∇Δf⟩ + Ric(∇f,∇f)`, and for 1-forms, giving `b₁(M) = 0` on a
  closed manifold with `Ric > 0` (R7.6). They are used in MS6, in the gradient and curvature
  estimates of MS7, and in Reilly's formula and the Choi–Wang estimate (MS10). The identity
  on a surface, `2|∇²f|² = |∇q|²/q − 2⟨∇q,∇f⟩Δf/q + 2(Δf)²` where `q = |∇f|² > 0`, is a
  target of 7.4.
- **Blow-up of the ambient metric.** Item 5 of R1: let C be a compact subset of a Riemannian
  `(n+1)`-manifold N. Pulling the metric back by `x ↦ exp_p(x/λ)`, where `p ∈ C` and `T_pN`
  is identified with `ℝ^(n+1)` by an orthonormal frame, and multiplying it by `λ²` gives
  metrics on a fixed ball of `ℝ^(n+1)` that converge to the Euclidean metric in every `C^m`
  norm as `λ → ∞`, uniformly in `p ∈ C` and in the frame. The rate depends on the metric
  near C: bounds on the sectional curvature alone do not control the higher derivatives of
  the metric. This is what blow-up arguments in a Riemannian manifold need (MS2, MS5, MS8
  and MS9).
- **Hessian of the distance.** R4.1: on a normal ball centred at p in a Riemannian manifold,
  the squared distance `r²` to p is smooth and its Hessian at p is twice the metric; bounds
  on the sectional curvature give comparison bounds for the Hessian of r; and if the
  sectional curvature is at most κ, then `Hess(r²)` is positive definite on every normal
  ball of radius below `π/(2√κ)`, on every normal ball when `κ ≤ 0`. This is what the
  Riemannian version of monotonicity and the maximum principles on small balls (MS3) and the
  distance-level-set analysis in MS8 use.
- **Smooth upper distance barriers.** R4.1 [Lynch, Appendix B]: given a unit-speed minimizing
  geodesic `γ : [0,ℓ] → M` in a Riemannian m-manifold (`m ≥ 2`, `ℓ = dist_g(p,p̄) > 0`) with
  `Ric_g(γ′,γ′) ≥ −(m−1)k` along γ for some `k ≥ 0`, there is a smooth function r̃ on a
  neighbourhood of p̄, the arc length of a smooth family of curves from p obtained by varying
  γ along parallel fields modulated by `sinh(√k t)/sinh(√k ℓ)` (or `t/ℓ` when `k = 0`), with
  `r̃ ≥ dist_g(p,·)`, `r̃(p̄) = ℓ`, `|∇r̃(p̄)| = 1` and
  `Δr̃(p̄) ≤ (m−1)√k coth(√k ℓ) ≤ (m−1)(√k + 1/ℓ)`. It requires only first and second
  variation of arc length and no cut-locus theory, and handles interior maxima at cut points
  in 7.4.
- **Geodesic variations and Riemannian coverings.** First and second variation of geodesic
  arc length and energy, including variations with moving endpoints (R3 and R4.2;
  [Lee, Chapters 6, 10]), and the complete pullback metric with inherited curvature bounds
  on the universal cover of a complete Riemannian manifold (R4.3). They are used in MS7 and
  in Frankel's theorem and the finite-cover reduction (MS11 and MS12).
- **Bonnet–Myers.** R4.5 [Lee, Chapter 12]: on a complete connected Riemannian m-manifold
  (`m ≥ 2`) with `Ric_g ≥ (m−1)δ g`, `δ > 0`, the diameter is at most `π/√δ`, so the
  manifold is compact and its universal Riemannian cover is compact and hence a finite
  cover, with `π₁` finite. It is used in the finite-cover reduction of MS11 and MS12.
- **Hypersurface separation and two-sidedness.** R7.9 [BT, §5]: in a connected closed
  Riemannian manifold M with `H¹_dR(M) = 0`, in particular when `Ric_g > 0` by R7.6, every
  connected closed two-sided embedded hypersurface `Σ ⊂ M` separates M into two compact
  manifolds with common smooth boundary Σ and opposite outward unit normals; and a simply
  connected manifold contains no closed embedded one-sided hypersurface. It is used in MS10,
  MS11 and MS12.
- **Spectrum and Dirichlet problem for Schrödinger operators on compact manifolds.** R5c
  [GT, Chapter 8]: let `(M,g)` be a compact Riemannian m-manifold (`m ≥ 1`), closed or with
  smooth boundary `∂M`, and `L = −Δ_g + q` with q smooth.
  - (a) On closed M, or with homogeneous Dirichlet boundary condition `u|_∂M = 0` when
    `∂M ≠ ∅`, the operator L, and more generally a symmetric bundle Schrödinger operator
    `L = −Δ^E + 𝒦` on a smooth Riemannian vector bundle `(E,∇^E)` with 𝒦 a smooth symmetric
    endomorphism field, has a discrete real spectrum `μ₁ ≤ μ₂ ≤ ⋯ → +∞` with
    finite-dimensional eigenspaces of sections smooth up to `∂M`, forming an
    `L²`-orthonormal basis and characterized variationally by the Rayleigh min–max
    principle. So the supremum of the dimensions of the subspaces of smooth admissible
    sections (or of compactly supported interior sections in the Dirichlet case) on which
    `⟨u,Lu⟩_(L²)` is negative definite is finite and equals the number of strictly negative
    eigenvalues `μ_k < 0` counted with multiplicity. In the scalar case with M connected,
    the lowest eigenvalue `μ₁(L)` is simple with an eigenfunction that is strictly positive
    in the interior; so on closed connected M a global smooth `h > 0` with `Lh = 0` exists
    if and only if `μ₁(L) = 0`; and for connected smooth domains `D₁ ⊊ D₂` with the closure
    of `D₁` in the interior of `D₂` (or `D₂ = M` closed), strict domain monotonicity
    `μ₁(L,D₁) > μ₁(L,D₂)` holds. For `q = 0` on closed connected M, `μ₁(−Δ_g) = 0` is
    spanned by the constants, and the first positive eigenvalue `λ₁(−Δ_g) = μ₂(−Δ_g) > 0`
    has a smooth eigenfunction and equals the Rayleigh infimum over nonzero smooth
    functions with zero mean.
  - (b) For scalar `L = −Δ_g + q` on a compact `(Ω,g)` all of whose connected components
    meet `∂Ω`, whenever `μ₁(L,Ω) > 0` (in particular for `L = −Δ_g`, by the Friedrichs
    inequality), for every `f ∈ C^∞(Ω̄)` and `φ ∈ C^∞(∂Ω)` there is a unique `u ∈ C^∞(Ω̄)`
    solving `Lu = f` in Ω with `u|_∂Ω = φ`, and `u > 0` on Ω̄ when `f ≥ 0` and `φ > 0`.

  It is used for `L = −J` in MS6 and MS7, for `L = −J^⊥` on the normal bundle in MS6, and
  for `L = −Δ` in MS10.

### From the other roadmaps

- [PDE](../../PDE/README.md): maximum principles and the Hopf boundary point lemma (its
  §3.2, C13); Harnack inequalities (§3.3, C14); De Giorgi–Nash–Moser (§5.4, E23);
  divergence-form and non-divergence Schauder estimates, interior and at the boundary
  (§5.3, E22, and §5.6, E25).
- [GeometricCurrents](../../GeometricCurrents/README.md) G6: the strong one-sided maximum
  principle for smooth minimal hypersurfaces, and Simons' identity and inequality.
- [PseudoholomorphicCurveAnalysis](../../PseudoholomorphicCurveAnalysis/README.md): its
  §2.4 (PH2.4), isothermal coordinates; its §7.2 (PH7.2), Riemann–Roch.
- [HopfRinow](../../../Completed/HopfRinow/README.md), Layers 0–4: geodesics, the
  exponential map, completeness and minimizing geodesics.

### From Tau Ceti and Mathlib

- `TauCeti.Manifold.laplaceBeltrami`, the Laplacian `Δ = div grad` of the conventions.
- `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic`, the finite holomorphic map to
  the Riemann sphere of a nonconstant meromorphic function on a compact Riemann surface
  (10.4).
- `TauCeti.noRetraction_diskBoundary`, Brouwer's no-retraction theorem (10.3).
- Mathlib's implicit function theorem in Banach spaces (2.3) and its Fourier series on the
  circle, `fourierBasis` (6.5).

## How to read the build

MS3 (first consequences of minimality) rests on MS1 and MS2. MS4 (the half-space theorem)
rests on MS2 and MS3. MS5 (local compactness and ε-regularity) uses MS1, MS2 and MS3 for
compactness under curvature bounds, including varying metrics on exhaustions for ambient
blow-ups, and for the smooth version of Allard regularity, specifically affine-plane rigidity
in monotonicity; and it uses Simons' inequality, monotonicity and the mean value inequality
(MS3) for ε-regularity.

MS6 (the Morse index and stability) rests on MS1: second variation in arbitrary codimension,
normal double covers, Riemannian coverings, the Bochner formula and the spherical-harmonic
spectrum of R8.2, and the bundle and scalar Schrödinger spectral theory of R5c; and on
Fourier series on the two-torus.

The positive-Jacobi-field and curvature estimates in MS7, following [Lynch] in `ℝ³` and its
adaptation to a Riemannian three-manifold, use MS6 (the stability quadratic form), the
Bochner formula, Simons' identity in both its Euclidean and Riemannian forms (MS3), the
Gauss equation (MS1), and the smooth upper distance barriers of R4.1. This route is
independent of MS2, MS4 and MS5, and does not need point-picking, ambient blow-up, pointed
compactness for immersed surfaces, Pogorelov's area bound, the logarithmic cutoff or
graphical neighbourhoods. The implication from stability to a positive Jacobi field uses the
Schrödinger spectral and Dirichlet theory on compact manifolds with boundary (R5c), together
with interior Harnack and elliptic compactness on an exhaustion in the noncompact case. Item
7.7 on limits of stable hypersurfaces additionally uses MS2 (graph differences), MS5
(compactness under bounded curvature) and MS6 (one-sided stability on the normal double
cover).

MS8 (removable singularities) rests on MS1 (Hessian of `r²` and ambient blow-up), on MS2
(the small-data Dirichlet problem for minimal graphs, built by the Banach-space implicit
function theorem from the boundary Schauder theory of [PDE](../../PDE/README.md) §5.6, and
the interior estimates), on MS3 and MS4 (monotonicity, the first-contact lemma and the
tangency principle), and on MS5 (ε-regularity and varying-metric bounded-curvature
compactness).

MS9 (compactness under bounded total curvature) rests on Gauss–Bonnet and the logarithmic
cutoff (MS1), graphical neighbourhoods and the Harnack and gradient bounds for graph
differences (MS2), monotonicity (MS3), positive Jacobi fields and limits of stable
hypersurfaces (MS7), local compactness, ε-regularity and smooth Allard regularity (MS5), and
removable singularities (MS8).

MS10 (eigenvalue estimates) rests on Reilly's formula, which requires the ambient Bochner
formula and Stokes' theorem; on the closed-manifold spectral theory and the Dirichlet theory
on manifolds with boundary for `−Δ` (R5c) and on separation by two-sided embedded
hypersurfaces (R7.9); on isothermal coordinates and closed Riemann–Roch (PH2.4 and PH7.2,
together with Tau Ceti's finite holomorphic sphere maps); and on Brouwer's no-retraction
theorem for Hersch's conformal balancing argument, which gives the Yang–Yau bound
`8π(γ+1)`; the sharper `8π⌊(γ+3)/2⌋` would also require the Brill–Noether gonality bound
and is not a target.

MS11 (Frankel's theorem) rests on the suppliers: Hopf–Rinow, first and second variation of
geodesic arc length with moving endpoints, parallel transport and the second fundamental
form. Its
finite-cover corollary 11.3 also uses Riemannian coverings, the multiplicativity of the Euler
characteristic under finite covers, which is part of its target, and Bonnet–Myers (R4.5).

MS12 (Choi–Schoen compactness) combines MS6–MS11: it uses the area bound from the genus
(MS10), Gauss–Bonnet, compactness under bounded total curvature, multiplicity-one regularity
and the stability of components of higher multiplicity (MS9), removable singularities (MS8),
the nonexistence of closed two-sided stable hypersurfaces under `Ric > 0` (MS6), and, for
general ambient manifolds, the finite-cover reduction from Bonnet–Myers and Frankel's theorem
(MS11).

## MS2. Minimal graphs and local geometry

- **2.1 The minimal-surface equation** [CM, §1.1] [Chodosh, §18]. Let `Ω ⊂ ℝⁿ` be open and
  `u ∈ C²(Ω)`. The graph `x_(n+1) = u(x₁,…,x_n)` in `ℝ^(n+1)` has area `∫_Ω √(1+|Du|²)`, and
  it is minimal precisely when

  `div(Du/√(1+|Du|²)) = 0`, equivalently `(1+|Du|²) Δu − Σ_(i,j=1)^n D_i u D_j u D_ij u = 0`.

  When `|Du| ≤ M` the equation is uniformly elliptic, with constants depending on n and M.
  Establish the corresponding equation for a graph in coordinates on a Riemannian
  `(n+1)`-manifold N [CM, §2.6], which is a quasilinear equation whose coefficients depend
  smoothly on x, u and Du through the ambient metric and its first derivatives, and is
  uniformly elliptic when `|Du| ≤ M` and the graphs stay in a fixed compact coordinate
  cylinder on which the metric is uniformly positive definite.
- **2.2 Interior estimates.** If u solves the minimal-surface equation on the ball
  `B_R ⊂ ℝⁿ` with `|Du| ≤ M`, then for every `k ≥ 2`

  `sup_(B_(R/2)) |D^k u| ≤ C(n,k,M) R^(1−k)`.

  For a minimal graph in coordinates on a Riemannian `(n+1)`-manifold, the same holds for R
  below a scale and with constants depending also on the ambient metric in the chosen
  coordinates, with the graphs in a fixed compact coordinate cylinder. The proof is elliptic
  theory: De Giorgi–Nash–Moser for Du, then the Schauder bootstrap of
  [Chodosh, Lemma 19.1]. The linear estimates are those of [PDE](../../PDE/README.md) (E23,
  then E22 and E25); their application to the minimal-surface equation is the target here.
- **2.3 Small-data Dirichlet problem for minimal graphs** [Chodosh, Lemma 32.3]. Let
  `B₁ ⊂ ℝⁿ` (`n ≥ 2`) be the unit ball and `0 < α < 1`. For a smooth (or `C⁴`) Riemannian
  metric g on `B̄₁ × [−1,1]` close to `g_Eucl` in `C⁴(B̄₁ × [−1,1])` and
  `u ∈ C^(2,α)(B̄₁)` with small norm, let `M_g(u)` denote the coordinate g-minimal-graph
  operator of 2.1, with `M_(g_Eucl)(u) = div(Du/√(1+|Du|²))`. The nonlinear map
  `(g,u) ↦ (M_g(u), u|_∂B₁)` from a neighbourhood of `(g_Eucl,0)` in
  `C⁴(B̄₁ × [−1,1]) × C^(2,α)(B̄₁)` to `C^(0,α)(B̄₁) × C^(2,α)(∂B₁)` is `C¹`, sends
  `(g_Eucl,0)` to `(0,0)`, and has partial Fréchet derivative in u at `(g_Eucl,0)` equal to
  `v ↦ (Δ_Eucl v, v|_∂B₁)`, a Banach-space isomorphism by boundary Schauder theory
  ([PDE](../../PDE/README.md) §5.6, E25; [GT, Theorems 6.6, 6.14]). By the Banach-space implicit
  function theorem, there exist `δ₀(n,α), C(n,α) > 0` such that whenever
  `‖g − g_Eucl‖_(C⁴) + ‖φ‖_(C^(2,α)(∂B₁)) ≤ δ₀`, there is a unique small solution
  `u ∈ C^(2,α)(B̄₁)` of `M_g(u) = 0` with `u|_∂B₁ = φ`, satisfying

  `‖u‖_(C^(2,α)(B̄₁)) ≤ C(‖φ‖_(C^(2,α)) + ‖g − g_Eucl‖_(C⁴))`,

  and smooth in `B₁` when g is smooth, by 2.2. Moreover, u varies `C¹`-smoothly with
  `(g,φ)`: for `φ_t = φ + t` (`|t|` small), `∂_t u_t` equals 1 at `(g_Eucl,0,0)`, so after
  shrinking `δ₀` one has `∂_t u_t ≥ ½ > 0` on `B̄₁`, producing an increasing foliation by
  g-minimal graphs, used in MS8. Rescaling `x ↦ x/R` gives the corresponding statement over
  `B_R ⊂ ℝⁿ`.
- **2.4 Graphical neighbourhoods and scaling** [CM, Lemma 2.4] [Chodosh, Lemmas 28.1–28.3].
  Let C be a compact subset of a Riemannian `(n+1)`-manifold N. There are constants
  `c(n), C(n) > 0` and a scale `r₀ > 0` depending on the metric near C (`r₀ = ∞` when
  `N = ℝ^(n+1)`) with the following property. If `Σ ⊂ N` is a minimal hypersurface,
  `p ∈ Σ ∩ C`, `0 < r ≤ r₀`, the closure of `B_r^Σ(p)` is compact and contained in the
  interior of Σ, and `r sup_(B_r^Σ(p)) |A| ≤ c`, then in normal coordinates at p (the blow-up
  of MS1; Euclidean coordinates when `N = ℝ^(n+1)`) there is a graphical neighbourhood of p
  contained in `B_r^Σ(p)` over the tangent ball of radius `r/2`. Its graphing function
  satisfies `u(0) = 0`, `Du(0) = 0` and

  `|Du| + r|D²u| ≤ C(r sup_(B_r^Σ(p)) |A| + K₀r²)`,

  where `K₀` bounds the ambient curvature near C, and `r₀` is also chosen so that `K₀r₀²` is
  small. In Euclidean space `K₀ = 0`. The Riemannian estimate includes the
  Christoffel-symbol terms in the coordinate expression for the second fundamental form.
  Under `x ↦ λx` in `ℝ^(n+1)`, lengths, n-dimensional volume and `|A|²` scale by λ, `λⁿ` and
  `λ⁻²`, respectively.
- **2.5 Several sheets** [CM, §1.7] [Chodosh, Proposition 19.3, Lemma 33.2]. If `u₁` and
  `u₂` solve the minimal-surface equation in a fixed compact coordinate cylinder over
  `B_R ⊂ ℝⁿ` in a Riemannian `(n+1)`-manifold (or in `ℝ^(n+1)`) with `|Du_i| ≤ M`, then
  `w = u₂ − u₁` satisfies a linear elliptic equation
  `Σ a_ij D_ij w + Σ b_i D_i w + c w = 0` (`c = 0` in `ℝ^(n+1)`), whose coefficients are
  built from `u_i`, `Du_i` and `D²u₁` and are controlled by the interior estimates. When
  `w > 0` and R is below a scale depending on M and the ambient metric (for every `R > 0` in
  `ℝ^(n+1)`), Harnack's inequality and the gradient estimate for this equation give

  `sup_(B_(R/2)) w ≤ C inf_(B_(R/2)) w` and `|Dw| ≤ (C/R) w` on `B_(R/2)`,

  with C depending on n, M and the ambient metric (only on n and M in `ℝ^(n+1)`).
- **2.6 Multi-valued graphs.** In `ℝ³`, let `P = {(ρ,θ) : ρ > 0, θ ∈ ℝ}` be the universal
  cover of the punctured plane, with covering map `(ρ,θ) ↦ (ρ cos θ, ρ sin θ)`. A graph over
  a domain `Ω ⊂ P` is the surface `{(ρ cos θ, ρ sin θ, u(ρ,θ))}`; since the covering map is
  a local isometry, it is minimal precisely when u solves the minimal-surface equation in
  the local coordinates `(ρ cos θ, ρ sin θ)`. Its separation is
  `w(ρ,θ) = u(ρ,θ+2π) − u(ρ,θ)` wherever both terms are defined. No later item of this
  sub-roadmap consumes 2.6; its consumer is the multi-valued graph analysis of [CM4] and the
  one-sided curvature estimate.

## MS3. First consequences of minimality

- **3.1 Monotonicity** [CM, §1.3] [White, Theorem 3]
  [Chodosh, Theorem 9.3, Corollaries 9.4–9.5]. Let `f : Σ → ℝ^m` be a proper minimal
  immersion of an n-manifold (`1 ≤ n < m`), and let `B_R(p)` be an ambient ball disjoint
  from `f(∂Σ)`. For `0 < σ < ρ < R`, testing `div_Σ X^⊤ = n` (`X(q) = f(q) − p`) with a
  radial cutoff gives

  `Area(f⁻¹(B_ρ(p)))/(ω_n ρⁿ) − Area(f⁻¹(B_σ(p)))/(ω_n σⁿ)`
  `= (1/ω_n) ∫_(f⁻¹(B_ρ(p) ∖ B_σ(p))) |(f(q)−p)^⊥|² / |f(q)−p|^(n+2) dμ(q)`,

  where `ω_n` is the volume of the unit ball in `ℝⁿ` and `(f(q)−p)^⊥` is the component
  normal to `df_q(T_qΣ)` in `ℝ^m`. In particular, `r ↦ Area(f⁻¹(B_r(p)))/(ω_n rⁿ)` is
  nondecreasing on `(0,R)` and tends, as `r → 0`, to the number of points of `f⁻¹(p)`: area
  counts sheets with multiplicity. Include the affine-plane-rigidity equality case: if
  `Σ ⊂ ℝ^m` is a nonempty properly embedded minimal n-submanifold without boundary
  satisfying `lim_(R→∞) Area(Σ ∩ B_R(0))/(ω_n Rⁿ) ≤ 1`, then translation invariance of the
  asymptotic ratio and the small-ball limit 1 at `p₀ ∈ Σ` force
  `Area(Σ ∩ B_r(p₀))/(ω_n rⁿ) ≡ 1`, hence `(x−p₀)^⊥ ≡ 0` and `Σ = p₀ + T_(p₀)Σ` is an
  affine n-plane. In a Riemannian m-manifold N, for p in a compact subset `C ⊂ N` and R
  below a scale depending on the metric near C, there is `a ≥ 0` depending on the sectional
  curvature bound near C such that `r ↦ e^(ar) Area(f⁻¹(B_r(p)))/(ω_n rⁿ)` is nondecreasing
  for `0 < r < R` whenever `B_R(p)` is disjoint from `f(∂Σ)`.
  [GeometricCurrents](../../GeometricCurrents/README.md) G6 develops monotonicity for
  stationary varifolds; 3.1 is the smooth statement and uses no varifold.
- **3.2 Tangency principle** [CM, §1.7] [Chodosh, Proposition 19.3, Corollary 19.6]. Let
  `Σ₁, Σ₂` be minimal hypersurfaces in a Riemannian `(n+1)`-manifold, p an interior point of
  both with `T_pΣ₁ = T_pΣ₂`, and suppose that near p the hypersurface `Σ₂` lies on one side
  of `Σ₁`: in coordinates in which both are graphs over the common tangent hyperplane,
  `u₁ ≤ u₂`. Then `Σ₁` and `Σ₂` coincide near p; the difference `u₂ − u₁ ≥ 0` solves the
  linear equation of 2.5 and vanishes at an interior point. This interior statement is the
  strong one-sided maximum principle for smooth minimal hypersurfaces of
  [GeometricCurrents](../../GeometricCurrents/README.md) G6: one theorem, consumed here.
  Prove the boundary version, the Hopf boundary point lemma: if `u₁ ≤ u₂` are minimal graphs
  in coordinates over a connected domain in `ℝⁿ` with smooth boundary, smooth up to the
  boundary, and `u₁ = u₂`, `Du₁ = Du₂` at a boundary point, then `u₁ = u₂`.
- **3.3 Convex hull property** [CM, §1.3] [Chodosh, Corollaries 8.2–8.3]. The image of a
  compact minimal n-submanifold (`1 ≤ n < m`) in `ℝ^m` with boundary is contained in the
  convex hull of the image of its boundary. In particular, there is no compact minimal
  submanifold without boundary in `ℝ^m`. This follows from the harmonicity of the coordinate
  functions (MS1) and the maximum principle applied to the linear functions `x ↦ ⟨x,a⟩`
  (supporting hyperplanes).
- **3.4 Maximum principle in a small ball.** Let `B_R(p)` be a ball in a Riemannian
  m-manifold (`m ≥ 2`) with R below the injectivity radius at p and, if the sectional
  curvature is bounded above by some `κ > 0`, also `R < π/(2√κ)`; there is no additional
  curvature restriction when the bound is `≤ 0`, and the injectivity-radius restriction
  remains. If a compact minimal n-submanifold (`1 ≤ n < m`) lies in `B_R(p)`, then the
  distance to p, restricted to the submanifold, attains its maximum on the boundary of the
  submanifold: on a minimal submanifold the Laplacian of `r²` is the trace of `Hess(r²)`
  over the n-dimensional tangent space, because the mean-curvature vector vanishes, and this
  trace is positive (MS1, R4.1). In particular such a ball contains no closed minimal
  submanifold. This argument, applied to the squared distance from a point of a small ball,
  controls the topology of a minimal surface inside the ball [CM4, Lemma C.1].
- **3.5 Mean value inequality** [CM, §1.3, Theorem 1.12, §2.2] [Chodosh, Corollary 9.5]
  [White, Theorem 4]. Let `f : Σ → ℝ^m` be a proper minimal immersion of an n-manifold
  (`1 ≤ n < m`) and `p ∈ f(Σ)` with `B_R(p)` disjoint from `f(∂Σ)`. If `u ≥ 0` is a smooth
  function on Σ satisfying `Δu ≥ −au` for some `a ≥ 0`, then

  `u(q) ≤ (C(n,aR²)/Rⁿ) ∫_(f⁻¹(B_R(p))) u dμ`

  for every `q ∈ f⁻¹(p)`, where `C(n,aR²)` depends only on n and `aR²`, and only on n when
  u is subharmonic (`a = 0`). This is used in the ε-regularity argument of 5.1, applied with
  `u = |A|²`, for which Simons' inequality gives `Δ|A|² ≥ −2|A|⁴`, on a ball of radius
  `R ∼ |A|(q₀)⁻¹` where `aR²` is bounded. In a Riemannian m-manifold, the same holds for R
  below a scale depending on the metric near a compact set.
- **3.6 Simons' identity** [Simons] [CM, Lemma 2.1] [Chodosh, Lemma 26.1]. For a minimal
  hypersurface in `ℝ^(n+1)`,

  `½Δ|A|² = |∇A|² − |A|⁴ ≥ ((n+2)/n) |∇|A||² − |A|⁴`,

  hence `Δ|A|² ≥ −2|A|⁴` and, where `A ≠ 0`, `|A|Δ|A| − (2/n)|∇|A||² ≥ −|A|⁴`; for a
  minimal surface in `ℝ³` (`n = 2`) this is the equality `Δ log|A| = −|A|²`. Include the
  version in a Riemannian `(n+1)`-manifold N, with the ambient curvature terms built from
  `Rm_N` and `∇Rm_N`. Simons' identity and inequality are also built by
  [GeometricCurrents](../../GeometricCurrents/README.md) G6; it is one identity, stated here
  in the forms and with the Laplacian used below.

## MS4. The half-space theorem

- **4.1 First-contact lemma and catenoid barriers.** Establish a first-contact lemma: let
  `f : Σ → ℝ^(n+1)` be a proper immersion of an n-manifold without boundary,
  `S ⊂ ℝ^(n+1)` a properly embedded hypersurface with boundary, `e ∈ ℝ^(n+1)` a vector
  transversal to S at its interior points, and `S_t = S + te` for `t ∈ [0,T]`. If
  `S_T ∩ f(Σ) = ∅`, `S₀ ∩ f(Σ) ≠ ∅`, no `∂S_t` meets `f(Σ)`, and `⋃_t (S_t ∩ f(Σ))` is
  bounded, then there is a largest `t₀` with `S_(t₀) ∩ f(Σ) ≠ ∅`, and at every point of
  `S_(t₀) ∩ f(Σ)` each local sheet of the immersion is tangent to and lies on one side of
  `S_(t₀)`. If both hypersurfaces are minimal, the tangency principle 3.2 applies. The same
  assertion holds with boundary on Σ if no `S_t` meets `f(∂Σ)`. Include unique continuation
  [CM, §1.7] [Chodosh, Corollary 19.6]: if Σ is connected, `f : Σ → N` is a minimal
  immersion into a Riemannian `(n+1)`-manifold, `S ⊂ N` is a connected, complete, embedded
  minimal hypersurface, and `f(U) ⊂ S` for a nonempty open `U ⊂ Σ`, then `f(Σ) ⊂ S`. In
  `ℝ³`, let `𝒞 = {x₁² + x₂² = cosh² x₃}` be the catenoid [CM, §1.2] [Chodosh, §14] and
  `ρ = √(x₁² + x₂²)`; the halves of `λ𝒞` are the graphs `x₃ = ±λ arccosh(ρ/λ)` over
  `{ρ ≥ λ}`, and as `λ → 0` these graphs converge to the punctured plane
  `{x₃ = 0} ∖ {0}`, smoothly on compact subsets.
- **4.2 Half-space theorem** [HM, Theorem 1] [Chodosh, Theorem 20.1]. Let `f : Σ → ℝ³` be a
  proper minimal immersion, where Σ is a connected, nonempty surface without boundary. If
  `f(Σ)` is contained in a closed half-space, then `f(Σ)` is a plane parallel to the
  boundary of that half-space. Properness here is properness as a map into all of `ℝ³`.
  After translating the half-space to `{x₃ ≥ 0}` with `inf_(f(Σ)) x₃ = 0`, if `f(Σ)` meets
  `{x₃ = 0}` then the tangency principle and unique continuation force `f(Σ) = {x₃ = 0}`.
  Otherwise `f(Σ) ⊂ {x₃ > 0}`, and one translates a rescaled lower half-catenoid
  `x₃ = t − λ arccosh(ρ/λ)` upwards from `{x₃ ≤ 0}`, keeping its waist circle in a small
  ball around the origin disjoint from `f(Σ)`; it bends into `{x₃ < 0}` as `ρ → ∞`, so that
  its intersection with `{x₃ ≥ 0}` is compact. Fix a small positive final height and then
  take λ small enough that the final barrier meets the surface, using a point of the surface
  below that height and the convergence to the punctured plane. Apply the first-contact
  lemma with the parameter reversed. The tangency principle and unique continuation then
  force `f(Σ)` to be a catenoid, which is not contained in a half-space; the
  higher-dimensional catenoid in `ℝ^(n+1)` for `n ≥ 3`, by contrast, lies in a slab
  [Chodosh, §14.2].

## MS5. Local compactness and ε-regularity

- **5.1 Small total curvature (ε-regularity)** [ChoiSchoen] [CM, §2.2]. There are universal
  constants `ε, C₀ > 0` with the following property. Let Σ be a compact minimal surface and
  `f : Σ → B̄_r(x) ⊂ ℝ³` with `f(∂Σ) ⊂ ∂B_r(x)` and `∫_Σ |A|² ≤ ε`. Then

  `σ² |A|²(q) ≤ C₀ ∫_Σ |A|²` for `0 < σ ≤ r` and `q ∈ Σ` with `f(q) ∈ B_(r−σ)(x)`.

  In a Riemannian three-manifold N, for x in a compact subset `C ⊂ N` and `0 < r ≤ r₀` with
  `r₀, ε, C₀ > 0` depending on the metric near C, the same hypotheses give
  `σ² |A|²(q) ≤ C₀(∫_Σ |A|² + r²)`; in particular `σ² |A|²(q) ≤ 1` after decreasing ε and
  `r₀` so that `C₀(ε + r₀²) ≤ 1`. No stability is assumed. The proof uses Simons' inequality
  (3.6) and the mean value inequality on minimal surfaces (3.5), which is proved like
  monotonicity (3.1).
- **5.2 Compactness with bounded area and curvature** [Chodosh, Theorem 28.5]
  [White, Theorem 22] [CM, Lemma 2.4]. Let U be an open subset of a Riemannian
  `(n+1)`-manifold and `Σ_i ⊂ U` properly embedded minimal hypersurfaces without boundary
  such that, for every compact `K ⊂ U`, `Area(Σ_i ∩ K)` and `sup_(Σ_i ∩ K) |A|` are bounded
  independently of i. Then a subsequence converges, smoothly on compact subsets of U and
  with finite multiplicity, to a properly embedded minimal hypersurface `Σ ⊂ U`, possibly
  disconnected or empty. Convergence means that every point of Σ has a neighbourhood V in
  which, for i large, `Σ_i ∩ V` is a union of m graphs over `Σ ∩ V` converging smoothly to
  `Σ ∩ V`, and that `Σ_i ∩ K = ∅` for i large whenever `K ⊂ U ∖ Σ` is compact. The limit is
  embedded because of the tangency principle 3.2. If points `p_i ∈ Σ_i` converge to a point
  of U, then Σ is not empty and contains that point. Include the varying-metric exhaustion
  version needed for ambient blow-ups: given open sets `U_i ↑ U`, smooth metrics `g_i` on
  `U_i` converging in `C^∞_loc(U)` to a smooth metric g on U, and properly embedded
  `g_i`-minimal hypersurfaces `Σ_i ⊂ U_i` without boundary in `U_i` whose `g_i`-areas and
  `|A_(g_i)|`-suprema are uniformly bounded on every compact `K ⊂ U`, a subsequence
  converges in the same sense to a properly embedded g-minimal hypersurface `Σ ⊂ U`, using
  the uniform `C^m` metric control of MS2 and a diagonal argument.
- **5.3 Compactness for immersed minimal surfaces with bounded curvature**
  [White, Theorem 22]. Let U be an open subset of a Riemannian `(n+1)`-manifold and let
  `f_i : Σ_i → U` be a sequence of properly immersed minimal hypersurfaces without boundary
  such that, for every compact `K ⊂ U`, `Area(f_i⁻¹(K))` and `sup_(f_i⁻¹(K)) |A|` are
  bounded independently of i. Then a subsequence converges, smoothly on compact subsets of U
  and with finite multiplicity, to a properly immersed minimal hypersurface `f : Σ → U`:
  every point `q ∈ Σ` has a neighbourhood in which `f_i` factors through m smooth sheets
  converging to f, and `f_i⁻¹(K)` is empty for i large whenever `K ⊂ U ∖ f(Σ)` is compact.
  The proof is the same as in the embedded case (graph convergence from local curvature
  bounds by MS2), without the tangency-principle step; the limit need not be embedded. This
  theorem is used in the blow-up arguments of 5.5 and of MS9 (for example in the proof of
  Allard regularity and in the bounded-total-curvature compactness), where the rescaled
  limit `Σ̃_∞` is a priori only an immersion, and embeddedness is recovered afterwards from
  the affine-plane rigidity of 3.1 or the multiplicity-one regularity of 9.2.
- **5.4 Point-picking lemma** [Chodosh, Lemma 29.1]. Let `(X,d)` be a metric space,
  `x₀ ∈ X`, `R₀ > 0`, S a compact subset of the closed ball `B̄_(R₀)(x₀)`, and
  `f : S → [0,∞)` a continuous function; in applications, `S = Σ ∩ B̄_(R₀)(x₀)` on a
  relatively compact ball and `f = |A|`. If `x ∈ S ∩ B_(R₀)(x₀)` satisfies
  `(R₀ − d(x,x₀)) f(x) = M > 0`, then `q ↦ (R₀ − d(q,x₀)) f(q)` attains its maximum
  `M_* ≥ M` on S at an interior point `q_* ∈ S ∩ B_(R₀)(x₀)`; setting
  `ρ_* = ½(R₀ − d(q_*,x₀)) > 0` gives `B_(ρ_*)(q_*) ⊂ B_(R₀)(x₀)`,
  `ρ_* f(q_*) = ½M_* ≥ ½M`, and `sup_(S ∩ B_(ρ_*)(q_*)) f ≤ 2f(q_*)`. Rescaling normal
  coordinates around `q_*` by `λ_* = f(q_*)` therefore produces a ball of radius
  `λ_* ρ_* ≥ M/2` on which the rescaled quantity equals 1 at the origin and is bounded above
  by 2.
- **5.5 Smooth version of Allard regularity** [Chodosh, Theorem 30.1] [WhiteReg]. Establish
  the smooth minimal-hypersurface version of Allard regularity, valid in all dimensions
  `n ≥ 2`, without varifold theory: there exist `ε₀(n), C(n) > 0` and `σ(n) ∈ (0,1)` such
  that if `Σ ⊂ B_R(x) ⊂ ℝ^(n+1)` is a properly embedded minimal hypersurface without
  boundary in `B_R(x)` satisfying `Area(Σ ∩ B_R(x))/(ω_n Rⁿ) ≤ 1 + ε₀`, then
  `sup_(Σ ∩ B_(σR)(x)) |A| ≤ C(n)/R`. Include the Riemannian small-ball version: for x in a
  compact subset `C ⊂ N` and `0 < R ≤ r₀`, with `r₀, ε₀, C, σ` depending on the metric near
  C, the same area-ratio bound gives `sup_(Σ ∩ B_(σR)(x)) |A| ≤ C/R`. Prove first the centre
  estimate `|A|(x) ≤ C′/R` for `x ∈ Σ`, under an area-ratio bound `1 + ε_c` on `B_R(x)`, by
  contradiction: if `Σ_j` has area ratio `≤ 1 + 1/j`
  on `B_(R_j)(x_j)` and `R_j |A_(Σ_j)|(x_j) > j²`, the point-picking lemma 5.4 on the
  shrinking ball `B_(R_j/j)(x_j)` and rescaling around the maximizer `q_j`, by the ambient
  blow-up of MS1 and the varying-metric compactness of 5.2, produce a complete properly
  embedded minimal hypersurface `Σ̃_∞ ⊂ ℝ^(n+1)` through 0 with bounded curvature
  (`|A| ≤ 2`); monotonicity from `q_j` up to radius `(1 − 1/j)R_j` transfers asymptotic area
  ratio `≤ 1` to `Σ̃_∞`, forcing multiplicity-one convergence, so `|A_(Σ̃_∞)|(0) = 1`, while
  affine-plane rigidity (3.1) forces `Σ̃_∞` to be flat, a contradiction. Choosing `ε₀` and σ
  small so that `(1+ε₀)/(1−σ)ⁿ ≤ 1 + ε_c` then gives the bound on `B_(σR)(x)` by applying
  the centre estimate on `B_((1−σ)R)(y)` for `y ∈ Σ ∩ B_(σR)(x)`.

## MS6. Morse index and stability of minimal submanifolds

For a minimal immersion `f : Σ → N` of an n-manifold (`1 ≤ n < m`) into a Riemannian
m-manifold `(N,g)`, with pullback normal bundle `ν_f`, normal connection `∇^⊥` and
normal-bundle-valued second fundamental form II, the second variation of n-dimensional volume
along normal fields (MS1) is the index form

`Q(V) = ∫_Σ (|∇^⊥V|² − Σ_(i=1)^n Rm_N(V,e_i,e_i,V) − Σ_(i,j=1)^n ⟨II(e_i,e_j),V⟩²) dμ`
`= −∫_Σ ⟨V, J^⊥V⟩ dμ`,

where `{e_i}` is a local orthonormal frame of `TΣ` and `J^⊥ = Δ^⊥ + ℛ + 𝒜` is the
normal-bundle Jacobi operator, with `Δ^⊥ = tr_Σ (∇^⊥)²`,
`⟨ℛ(V),W⟩ = Σ_(i=1)^n Rm_N(V,e_i,e_i,W)` and
`⟨𝒜(V),W⟩ = Σ_(i,j=1)^n ⟨II(e_i,e_j),V⟩⟨II(e_i,e_j),W⟩` [Simons] [CM, §1.8]. This Q is the
diagonal of R5b's polarized form.

- **6.1 Morse index on compact minimal submanifolds and negative eigenvalues of `−J^⊥`**
  [Simons] [CM, §1.8] [Chodosh, §24]. Let Σ be compact: when Σ is closed (`∂Σ = ∅`), take
  `Γ(ν_f) = C^∞(Σ;ν_f)` as the space of admissible normal sections; when Σ has nonempty
  smooth boundary `∂Σ`, impose homogeneous Dirichlet boundary conditions, taking
  `Γ₀(ν_f) = {V ∈ C^∞(Σ;ν_f) : V|_∂Σ = 0}`. Define the Morse index `index(Σ)` as the
  supremum of `dim E` over linear subspaces E of admissible sections on which Q is negative
  definite (`Q(V) < 0` for all `V ∈ E ∖ {0}`). In the Dirichlet case, density of
  `C^∞_c(Σ ∖ ∂Σ;ν_f)` in `W^(1,2)₀(Σ;ν_f)` and continuity of Q in `W^(1,2)` give the same
  supremum over subspaces of `C^∞_c(Σ ∖ ∂Σ;ν_f)`, of `Γ₀(ν_f)` and of `W^(1,2)₀(Σ;ν_f)`; in
  particular `index(Σ) = 0` if and only if Σ is stable. By the bundle Schrödinger spectral
  theory of R5c (MS1) applied to `L = −J^⊥ = −Δ^⊥ − ℛ − 𝒜` on `(ν_f,∇^⊥)`, closed or with
  Dirichlet boundary condition `V|_∂Σ = 0`, the operator `−J^⊥` has a discrete real spectrum
  `μ₁ ≤ μ₂ ≤ ⋯ → +∞` with finite-dimensional smooth eigenspaces forming an
  `L²`-orthonormal basis, and `index(Σ)` is finite and equals the number of strictly
  negative eigenvalues `μ_k < 0` counted with multiplicity, attained on the span of their
  smooth eigensections, while the nullity `null(Σ) = dim ker(−J^⊥)` is the multiplicity of 0.
- **6.2 Morse index of minimal submanifolds in `ℝ^m` via exhaustions** [FCS] [CM, §1.8]
  [Chodosh, §24.2]. Let `f : Σ → ℝ^m` (`1 ≤ n < m`) be a minimal immersion of an n-manifold
  without boundary, where `ℛ = 0`, so
  `Q(V) = ∫_Σ (|∇^⊥V|² − Σ_(i,j=1)^n ⟨II(e_i,e_j),V⟩²) dμ` and `J^⊥ = Δ^⊥ + 𝒜`; include the
  same construction on the interior `Σ ∖ ∂Σ` of a general minimal immersion into a
  Riemannian m-manifold N. Given an exhaustion `Ω₁ ⋐ Ω₂ ⋐ ⋯` of Σ (or of `Σ ∖ ∂Σ`) by
  compact domains with smooth boundary (`Ω_k` contained in the interior of `Ω_(k+1)`,
  `⋃_k Ω_k = Σ ∖ ∂Σ`), extending compactly supported interior sections by zero shows that
  the Dirichlet indices satisfy `index(Ω₁) ≤ index(Ω₂) ≤ ⋯`; define

  `index(Σ) = lim_(k→∞) index(Ω_k) ∈ ℕ ∪ {∞}`.

  Prove that `index(Σ)` is independent of the choice of smooth exhaustion and equals the
  supremum of `dim E` over finite-dimensional subspaces `E ⊂ C^∞_c(Σ ∖ ∂Σ;ν_f)` on which Q
  is negative definite, agreeing with the compact definition 6.1 when Σ is closed or compact
  with smooth boundary. In particular, `index(Σ) = 0` if and only if Σ is stable; so affine
  n-planes in `ℝ^m` and minimal graphs in `ℝ^(n+1)` have index 0.
- **6.3 Specialization to hypersurfaces and two-sided hypersurfaces** [FCS] [CM, §1.8]
  [Chodosh, §§24, 33]. For any minimal hypersurface (`m = n+1`, possibly one-sided), `ν_f`
  is a real line bundle on which any local unit normal `±ν` is `∇^⊥`-parallel, and
  `|A|² + Ric_N(ν,ν)` is a well-defined smooth scalar function on Σ independent of the sign
  of ν, giving

  `Q(V) = ∫_Σ (|∇^⊥V|² − (|A|² + Ric_N(ν,ν))|V|²) dμ`,
  `J^⊥V = Δ^⊥V + (|A|² + Ric_N(ν,ν))V`.

  When Σ is one-sided, let `π : Σ̃ → Σ` be its two-sided normal orientation double cover
  with deck involution τ and tautological unit normal ν̃ (`τ^*ν̃ = −ν̃`): pulling back
  sections by `π^*V = φ̃ ν̃` identifies `Γ(ν_f)` (and `Γ₀(ν_f)`) with the deck-odd scalar
  functions `φ̃ ∘ τ = −φ̃` on Σ̃, with `Q_Σ(V) = ½Q_(Σ̃)(φ̃)`. So on compact Σ, closed or
  Dirichlet, `index(Σ)` equals the number of strictly negative eigenvalues, with
  multiplicity, of the scalar Schrödinger operator `−J̃ = −Δ_(Σ̃) − (|A|² + Ric_N(ν̃,ν̃))` on
  Σ̃ within the τ-odd subspace, by the scalar Schrödinger spectral theory of R5c on Σ̃, since
  τ commutes with `−J̃`.

  When Σ is two-sided with global unit normal ν, setting `V = φν` (`φ ∈ C^∞(Σ)`) reduces Q
  and `J^⊥` to the scalar quadratic form `Q(φ)` and scalar Jacobi operator
  `J = Δ + |A|² + Ric_N(ν,ν)` of MS7. On compact Σ, closed or with smooth boundary under the
  Dirichlet condition `φ|_∂Σ = 0`, applying R5c's scalar spectral theorem to
  `L = −J = −Δ − (|A|² + Ric_N(ν,ν))` identifies `index(Σ)` with the number of strictly
  negative eigenvalues `μ_k(−J) < 0` counted with multiplicity: in particular
  `index(Σ) = 0` if and only if `μ₁(−J) ≥ 0` (stability), and when Σ is connected,
  simplicity of `μ₁(−J)` gives `index(Σ) = 1` if and only if `μ₁(−J) < 0 ≤ μ₂(−J)`. On a
  closed `(n+1)`-manifold with `Ric_g > 0`, 6.4 gives `μ₁(−J) < 0`, so every closed
  two-sided minimal hypersurface has `index(Σ) ≥ 1`. On a noncompact two-sided minimal
  hypersurface in `ℝ^(n+1)` (`−J = −Δ − |A|²`), or in `N^(n+1)`, exhausted by
  `Ω₁ ⋐ Ω₂ ⋐ ⋯`, `index(Σ) = lim_(k→∞) #{j : μ_j(−J,Ω_k) < 0}`.
- **6.4 Nonexistence of closed stable minimal hypersurfaces under `Ric > 0`** [SY]
  [Chodosh, §24]. Let `(M^(n+1),g)` be a closed Riemannian `(n+1)`-manifold (`n ≥ 2`) with
  `Ric_g > 0`, and let Σ be a closed two-sided minimal hypersurface in M. The constant test
  function `φ = 1` is admissible in the stability inequality:
  `Q(1) = −∫_Σ (|A|² + Ric_g(ν,ν)) dμ < 0`, since `|A|² ≥ 0` and `Ric_g(ν,ν) > 0`.
  Therefore Σ is not stable. On a closed manifold with `Ric_g > 0`, `b₁(M) = 0` by R7.6, so
  every connected closed embedded two-sided hypersurface separates M, by R7.9.
- **6.5 Examples in `S³` and `ℝP³`: the equatorial sphere, the projective plane and the
  Clifford torus** [Simons, §5]. Equip the unit three-sphere `S³ ⊂ ℝ⁴` with its round
  metric (`Ric_(S³) = 2g`). The equatorial sphere `S²_eq = S³ ∩ {x₄ = 0}`, and more
  generally `Sⁿ_eq = S^(n+1) ∩ {x_(n+2) = 0} ⊂ S^(n+1)`, is fixed by the ambient isometric
  reflection `x₄ ↦ −x₄`, with parallel unit normal `ν = e₄` in `S³`, so it is totally
  geodesic: `A ≡ 0`, hence minimal, with the unit round metric, area `4π` and genus 0. Here
  `−J = −Δ_(S²) − 2` (`−Δ_(Sⁿ) − n` on `Sⁿ_eq`): the constant 1 gives `μ₁(−J) = −2 < 0`
  (`−n`), while integrating the Bochner formula of MS1 on the unit `Sⁿ` with
  `|∇²φ|² ≥ (1/n)(Δφ)²` and `Ric_(Sⁿ) = (n−1)g` gives Lichnerowicz's bound
  `λ₁(−Δ_(Sⁿ)) ≥ n`, and R8.2 of the parent identifies the full spherical-harmonic spectrum
  `λ_d = d(d+n−1)`. So `μ_k(−J) ≥ 0` for `k ≥ 2` and `index(S²_eq) = 1`; more generally
  `index(Sⁿ_eq) = 1`, with nullity `n+1` spanned by `x₁,…,x_(n+1)`, that is nullity 3 on
  `S²_eq`.

  Passing to the antipodal quotient `ℝP³ = S³/{±1}` with the induced round metric
  (`Ric_(ℝP³) = 2g > 0`; `ℝP³` is orientable since `x ↦ −x` preserves orientation on `S³`,
  and more generally on `S^(n+1)` when n is even), the image `ℝP² = S²_eq/{±1} ⊂ ℝP³`, and
  more generally `ℝPⁿ ⊂ ℝP^(n+1)`, is a closed connected embedded totally geodesic minimal
  hypersurface (`A ≡ 0`, area `2π` for `n = 2`). Because the antipodal map `τ(x) = −x`
  preserves `Sⁿ_eq` and reverses its unit normal `ν̃ = e_(n+2)` (`dτ(ν̃) = −ν̃`),
  `ℝPⁿ ⊂ ℝP^(n+1)` is one-sided, with two-sided normal double cover `Sⁿ_eq → ℝPⁿ`: if a
  global unit normal existed, its pullback would be a nonvanishing τ-odd function on the
  connected `Sⁿ_eq`. Every τ-odd function φ̃ on `Sⁿ_eq` has `∫_(Sⁿ_eq) φ̃ dμ = 0` since τ is
  an isometry, so the Rayleigh characterization of `λ₁(−Δ_(Sⁿ))` (R5c) and Lichnerowicz's
  bound give

  `Q_(ℝPⁿ)(V) = ½ ∫_(Sⁿ_eq) (|∇φ̃|² − n φ̃²) dμ ≥ 0`.

  Thus `ℝPⁿ ⊂ ℝP^(n+1)` is stable, with `index(ℝPⁿ) = 0` and nullity `n+1` (nullity 3 on
  `ℝP²`), spanned by the τ-odd coordinate functions `x₁,…,x_(n+1)`, since `λ_d > n` for
  `d ≥ 2`. In particular `ℝP² ⊂ ℝP³` is a closed embedded one-sided stable minimal surface
  in a closed orientable three-manifold with `Ric > 0`, showing both that ambient
  orientability does not imply two-sidedness and that two-sidedness is essential in 6.4
  (compare MS9 and MS12).

  The Clifford torus
  `𝕋² = S¹(1/√2) × S¹(1/√2) = {(x₁,x₂,x₃,x₄) ∈ ℝ⁴ : x₁² + x₂² = x₃² + x₄² = ½} ⊂ S³`,
  parametrized on `(ℝ/2πℤ)²` by `F(θ,ψ) = (1/√2)(cos θ, sin θ, cos ψ, sin ψ)` with global
  unit normal `ν(θ,ψ) = (1/√2)(cos θ, sin θ, −cos ψ, −sin ψ)` in `TS³`, has flat induced
  metric `g_(𝕋²) = ½(dθ² + dψ²)` (`K ≡ 0`, area `2π²`, genus 1) and principal curvatures
  `−1` and `+1` along the two circle factors, so its mean curvature vanishes (it is minimal) and
  `|A|² = 2`. Since
  `|A|² + Ric_(S³)(ν,ν) = 4` and `Δ_(𝕋²) = 2(∂_θ² + ∂_ψ²)`, we have
  `−J = −2(∂_θ² + ∂_ψ²) − 4`. By `L²`-completeness of the Fourier basis on `(ℝ/2πℤ)²`, the
  eigenvalues of `−J` indexed by `(k,ℓ) ∈ ℤ²` are `2(k² + ℓ²) − 4`, which are strictly
  negative solely at `(0,0)` (`μ = −4`, multiplicity 1, the constants) and at
  `(±1,0), (0,±1)` (`μ = −2`, real multiplicity 4, spanned by `x₁, x₂, x₃, x₄`), giving
  `index(𝕋²) = 5`, and nullity 4 at `(±1,±1)`, spanned by `x_i x_j` for `i ∈ {1,2}`,
  `j ∈ {3,4}`. The completeness of the Fourier basis on the two-torus, from Mathlib's
  Fourier series on the circle, is part of this target.

## MS7. Stability and the curvature estimate

For a two-sided minimal hypersurface in a Riemannian `(n+1)`-manifold N, set

`J = Δ + |A|² + Ric_N(ν,ν)`, `Q(φ) = ∫_Σ (|∇φ|² − (|A|² + Ric_N(ν,ν))φ²) dμ`.

Stability means `Q(φ) ≥ 0` for every smooth function φ compactly supported in the interior;
`Q(φ) = −∫_Σ φ Jφ dμ` is the second variation of area along `φν`. In 7.4 and 7.5 the letter
Q also denotes the function `q + cs` of [Lynch]; the two uses do not meet in one formula.

- **7.1 A positive solution implies stability** [CM, §1.8] [White, Theorem 30]
  [Chodosh, Proposition 33.4]. If `h > 0` and `Jh = 0` on a two-sided minimal hypersurface
  in a Riemannian `(n+1)`-manifold, prove the identity

  `Q(φ) = ∫_Σ h² |∇(φ/h)|² dμ`

  for compactly supported test functions; or, setting `w = log h`, use
  `Δw = −(|A|² + Ric_N(ν,ν)) − |∇w|²` and Cauchy–Schwarz as in
  [Chodosh, Proposition 33.4]. In particular the hypersurface is stable.
- **7.2 Stability and positive solutions** [CM, Proposition 1.39] [FCS]. On a connected,
  stable, two-sided minimal hypersurface, every relatively compact domain whose closure is a
  proper subset of the interior admits a smooth positive solution of `Jh = 0`: enclose its
  closure in nested connected smooth proper subdomains `D₁ ⊊ D₂`, use stability
  (`μ₁(−J,D₂) ≥ 0`) and strict domain monotonicity for the Schrödinger operator `L = −J`
  (R5c) to obtain `μ₁(−J,D₁) > 0`, and solve `(−J)h = 0` on `D₁` with boundary value 1. On a
  connected noncompact two-sided minimal hypersurface without boundary, exhaustion and
  interior Harnack compactness give the equivalence between stability and a global positive
  solution of `Jh = 0`. For a closed connected hypersurface, stability gives `μ₁(−J) ≥ 0`;
  by simplicity and positivity of the principal eigenfunction (R5c), a positive solution of
  `Jh = 0` on the whole hypersurface exists if and only if `μ₁(−J) = 0`.
- **7.3 Jacobi functions from translations; minimal graphs are stable** [CM, §1.8]
  [Chodosh, §24]. For a minimal hypersurface in `ℝ^(n+1)` and a constant vector e, the
  function `⟨ν,e⟩` satisfies `J⟨ν,e⟩ = 0`; more generally, `J⟨ν,X⟩ = 0` whenever X is a
  Killing vector field on N. For a minimal graph in `ℝ^(n+1)` with upward unit normal,
  `h = ⟨ν,e_(n+1)⟩ > 0`, so the graph is stable for variations compactly supported in its
  interior, by 7.1.
- **7.4 Gradient estimate for positive Jacobi fields on minimal surfaces**
  [Lynch, Theorem 1.1, §4]. Let `Σ → ℝ³` be a minimally immersed surface, and let `u > 0` be
  a positive Jacobi field on an open subset of `Σ ∖ ∂Σ`. Set `f = log u`, `q = |∇f|²`,
  `s = |A|²`. The key computation combines the Bochner formula (MS1, applied to f, using
  `Δf = −s − q` from the Jacobi equation and `Ric = −½ s g` from the Gauss equation on a
  minimal surface in `ℝ³`) with Simons' identity in dimension two,
  `Δs = |∇s|²/s − 2s²` where `s > 0` (3.6). On a surface the Hessian term of the Bochner
  formula is evaluated by the identity `2|∇²f|² = |∇q|²/q − 2⟨∇q,∇f⟩Δf/q + 2(Δf)²` where
  `q > 0`, which is part of this target.

  *Differential inequality* [Lynch, Proposition 4.1]. For `Q = q + cs` with `c > 0`, at
  every point where `Q > 0`:

  `ΔQ ≥ |∇Q|²/Q + 2q² + (3 − 1/c) q s + (1 − 2c) s²`.

  A route: the Bochner formula gives
  `Δq = |∇q|²/q + 2s⟨∇f,Y⟩ + 2q² + 3qs + 2s²`, where `Y = ∇log q − ∇log s`. One adds
  `c Δs` and writes the gradient terms as `|∇Q|²/Q + (csq/Q)|Y|²`. The cross term
  `(csq/Q)|Y|² + 2s⟨∇f,Y⟩` is controlled by completing the square, discarding a nonnegative
  term, and absorbing `−sQ/c` into the reaction terms. See [Lynch, Proposition 4.1] for the
  treatment of the boundary cases `q = 0` or `s = 0`. Setting `c = ⅓` gives `Q = q + ⅓s` and
  `ΔQ ≥ |∇Q|²/Q + (6/5)Q²`.

  *Maximum principle* [Lynch, §4, Appendix B]. Fix `p ∈ Σ ∖ ∂Σ` and `R > 0` such that the
  closure of `B_R^Σ(p)` is compact and contained in the domain of u. Set
  `r(x) = dist_g(p,x)` and `φ = (R² − r²)²`, and choose a positive interior maximum
  `p̄ ∈ B_R^Σ(p)` of `φQ`. When `p̄ ≠ p`, along a minimizing geodesic γ in `B_R^Σ(p)` from p
  to p̄, maximality `φQ ≤ φ(p̄)Q(p̄)` gives `Q ≤ Q(p̄)`, hence
  `Ric = −½ s g ≥ −(3/2) Q(p̄) g` along γ. Replacing r near p̄ by the smooth upper barrier
  `r̃ ≥ r` with `r̃(p̄) = r(p̄)` of R4.1 (MS1), the smooth function
  `φ̃Q = (R² − r̃²)² Q ≤ φQ` still has a local maximum at p̄, with `|∇r̃(p̄)| = 1` and
  `Δr̃(p̄) ≤ C(√Q(p̄) + 1/r(p̄))`; at `p̄ = p`, use the smooth squared distance directly.
  Evaluating `∇(φ̃Q)(p̄) = 0` and `Δ(φ̃Q)(p̄) ≤ 0` with the differential inequality for Q
  gives

  `−4ζ(1 + r̃ Δr̃) − 8r̃² + (6/5) φ(p̄) Q(p̄) ≤ 0` at p̄, where `ζ = R² − r̃²`:

  the barrier Laplacian bound only produces lower-order terms, so Young's inequality and
  rearranging give `R² Q(p) ≤ C` for a universal C, hence `R² (q + s)(p) ≤ 3C`. When Σ is
  complete and `u > 0` on `Σ ∖ ∂Σ`, letting `R ↑ dist_g(p,∂Σ)` completes the proof.

  *Riemannian adaptation.* For a minimally immersed surface `Σ → N` in a Riemannian
  three-manifold with `|Rm_N| ≤ Λ₀` and `|∇Rm_N| ≤ Λ₁` near a compact subset `C ⊂ N`,
  choose `c ∈ (⅓, ½)`, for instance `c = ⅖`, so that both `3 − 1/c > 0` and `1 − 2c > 0`.
  Splitting the gradient terms as
  `(1−ε₀)(|∇q|²/q + c|∇s|²/s) + ε₀(|∇q|²/q + c|∇s|²/s)` with small `ε₀ > 0` still leaves a
  strictly positive quadratic term `c₀Q²` after completing the square on the Y cross term,
  while the reserved `ε₀` fraction absorbs the first-order ambient curvature perturbations
  from `Ric_N(ν,ν)` in `Δq` and from the Codazzi equation in the Riemannian Simons identity
  (3.6) by Young's inequality, yielding

  `ΔQ ≥ (1−ε₀)|∇Q|²/Q + (c₀/2)Q² − C(Λ₀² + Λ₁²)`.

  Along a minimizing geodesic in `B_R^Σ(p)` from p to p̄, the Gauss equation gives
  `Ric_Σ = (K_N(TΣ) − ½s) g ≥ −(Λ₀ + Q(p̄)/(2c)) g`, so the upper barrier r̃ of R4.1
  satisfies `Δr̃(p̄) ≤ C(√Q(p̄) + √Λ₀ + 1/r(p̄))` and the maximum principle gives
  `R² Q(p) ≤ C(1 + (Λ₀ + Λ₁)R²)`.
- **7.5 Curvature estimate for stable surfaces** [Schoen] [White, Theorem 29]. Let
  `Σ → ℝ³` be a two-sided stable minimal immersion. Whenever the closure of `B_R^Σ(p)` is
  compact and contained in the interior `Σ ∖ ∂Σ`, 7.2 ([CM, Proposition 1.39], [FCS]) gives
  a positive Jacobi field `u > 0` on a relatively compact neighbourhood of that closure in
  the interior, and the gradient estimate 7.4 yields `R² |A|²(p) ≤ 3R² Q(p) ≤ C` with a
  universal constant C. In
  particular, `sup_(B_r^Σ(p)) |A|² ≤ C₀/r²` whenever the closure of `B_(2r)^Σ(p)` is compact
  and contained in the interior, and when Σ is complete,

  `|A|²(p) ≤ C / dist(p,∂Σ)²`.

  In a Riemannian three-manifold N, for p in a compact subset `C ⊂ N` and `0 < r ≤ r₀` with
  `r₀, C₀ > 0` depending on the metric near C, the Riemannian adaptation of 7.4 gives the
  Riemannian Schoen estimate [Schoen]: `sup_(B_r^Σ(p)) |A|² ≤ C₀/r²` whenever the closure of
  `B_(2r)^Σ(p)` is compact and contained in the interior. Both in `ℝ³` and in N, this
  Laplacian-comparison route avoids point-picking, ambient blow-up, pointed compactness for
  immersed surfaces, Pogorelov's area bound [Pogorelov] [White, Lemma 34], the logarithmic
  cutoff and the graphical neighbourhoods of 2.4.
- **7.6 Rigidity and Bernstein's theorem** [CM, §1.5] [White, Theorem 29]. Every complete,
  connected, two-sided stable minimal immersion of a surface without boundary in `ℝ³` has a
  plane as its image [FCS] [dCP] [Pogorelov]. Consequently, every smooth solution of the
  minimal-surface equation on all of `ℝ²` is affine: an entire graph is complete, and it is
  stable by 7.3 (see also [Chodosh, Theorem 25.1] for a direct proof for entire graphs using
  area minimization). By completeness and the absence of boundary, `dist(p,∂Σ) = ∞` for
  every p, so the curvature estimate 7.5 gives `|A|²(p) = 0`, hence `A ≡ 0`.
- **7.7 Limits of stable hypersurfaces** [CM, §7.5]
  [Chodosh, Theorem 33.1, Propositions 33.3–33.4]. In the compactness theorem with bounded
  area and curvature (5.2), if the `Σ_i` are two-sided and stable, then every two-sided
  component of Σ is stable: when the convergence has multiplicity one, the stability
  inequality passes directly to the limit; when the multiplicity is larger than one, the
  sheets are ordered graphs over Σ, and their differences, normalized at a point, converge
  by 2.5 to a positive solution of `Jh = 0`, which by 7.1 gives stability. For a one-sided
  component, work on its normal double cover and interpret stability downstairs using
  sections of the normal bundle, rather than scalar test functions (6.3). In a
  three-manifold (`n = 2`), combine this with the curvature estimate 7.5 to obtain: two-sided
  stable properly embedded minimal surfaces in U with locally bounded area have a
  subsequence converging as in 5.2.

## MS8. Removable singularities

- **8.1 Statement and curvature decay** [Chodosh, Lemma 32.1, Theorem 32.5] [ChoiSchoen].
  Let `B_(r₀)(p)` be a normal ball in a smooth Riemannian three-manifold `(N³,g)` and let
  `Σ ⊂ B_(r₀)(p) ∖ {p}` be properly embedded and minimal, without boundary in
  `B_(r₀)(p) ∖ {p}`. Suppose that p lies in the closure of Σ, that
  `Area(Σ ∩ B_ρ(p)) ≤ C₁ρ²` for `0 < ρ < r₀`, and that `∫_Σ |A|² dμ < ∞`. Then `Σ ∪ {p}` is
  a smooth properly embedded minimal surface in `B_(r₀)(p)`. The quadratic area-growth
  hypothesis is the exact bound supplied by monotonicity in 9.1; finite area alone is not
  the hypothesis of [Chodosh, §32]. The Riemannian normal-ball statement, working with the
  rescaled ambient metrics rather than in `ℝ³` alone, is required directly for the
  compactness application. As a first step, `∫_Σ |A|² dμ < ∞` gives
  `∫_(Σ ∩ B_(2s)(p)) |A|² dμ → 0` as `s → 0⁺`, so applying the Riemannian
  small-total-curvature estimate 5.1 on `B_(s/2)(x) ⊂ B_(2s)(p) ∖ {p}` for `x ∈ Σ` with
  `s = d_g(x,p) < r₀/2` yields

  `(s/2)² |A|²(x) ≤ C₀(∫_(Σ ∩ B_(s/2)(x)) |A|² dμ + (s/2)²) → 0`,

  hence `d_g(x,p) |A|(x) → 0` as `x → p`.
- **8.2 Annular punctured-plane blow-ups and punctured-disk decomposition**
  [Chodosh, Proposition 32.2]. Write `r(x) = d_g(x,p)`. At any critical point `x ∈ Σ` of
  `r²|_Σ`, `∇r²(x)` is normal to `T_xΣ`, so

  `Hess_Σ(r²) = Hess_N(r²)|_(T_xΣ) + ⟨∇r²(x), II⟩ = 2g_Σ + O(r²) + O(r|A|(x))`

  is strictly positive definite for `0 < r(x) < r₁` sufficiently small (R4.1 and
  `r|A| → 0`). Every critical point of `r²|_Σ` in `B_(r₁)(p) ∖ {p}` is therefore a strict
  local minimum; by monotonicity (3.1) only finitely many components of `Σ ∩ B_(r₁)(p)` can
  meet `B_(r₁/2)(p)` while missing p, so after shrinking `r₁` (to a regular value of
  `r|_Σ`) every component has p in its closure and
  `r : Σ ∩ (B_(r₁)(p) ∖ {p}) → (0,r₁)` is a proper submersion without critical points. Thus
  `Σ ∩ (B_(r₁)(p) ∖ {p})` is a finite disjoint union of punctured disks `D₁^*,…,D_k^*`
  (`D_ℓ^* ≅ S¹ × (0,r₁)`, `k ≥ 1`). In geodesic normal coordinates at p, for any
  `s_j → 0⁺` the rescaled surfaces `s_j⁻¹ exp_p⁻¹(D_ℓ^*)` have uniformly bounded area on
  bounded balls (from quadratic area growth) and curvature tending to 0 on compact subsets
  of `ℝ³ ∖ {0}` (from `r|A| → 0`); by varying-metric bounded-curvature compactness (5.2) and
  ambient blow-up (MS1), a subsequence converges in `C^∞_loc(ℝ³ ∖ {0})` to a flat (`A ≡ 0`)
  properly embedded surface in `ℝ³ ∖ {0}`. Because every level curve
  `D_ℓ^* ∩ ∂B_s(p) ≅ S¹` is a single connected circle (`0 < s < r₁`), the limit meets
  `∂B_δ(0)` for every `δ > 0`, contains no second circle on any sphere, and has sheet
  multiplicity 1 in the ordered annular collar of its great-circle link in `S²`, so it is a
  single punctured plane `Π ∖ {0}` through 0 with multiplicity one.
- **8.3 Minimal-graph barrier trapping and smooth extension across the puncture**
  [Chodosh, Lemmas 32.3–32.4, Theorem 32.5] [ChoiSchoen]. Fix `D^* = D_ℓ^*`. By the
  multiplicity-one blow-up on dyadic annuli, at a sufficiently small scale `ρ₀ ∈ (0,r₁)` the
  rescaled normal coordinates `y = ρ₀⁻¹ exp_p⁻¹(x)` with metric
  `g̃(y) = ρ₀⁻² (exp_p(ρ₀y))^*g` (`‖g̃ − g_Eucl‖_(C⁴) ≤ Cρ₀² ≪ ε₂ ≪ δ₀`) can be rotated so
  that `D^*` near `∂D²₁ × {0}` is a graph `y₃ = u(y₁,y₂)` with
  `‖u‖_(C^(2,α)(∂D²₁)) ≤ ε₁ ≪ ε₂`, while sub- and superharmonicity of `y₃ ± Cρ₀²|y|²` keeps
  `|y₃| < ε₂/2` on `D^*` over `D²₁`. Solving the small-data Dirichlet problem 2.3 for
  `M_(g̃)(v_t) = 0` on `D²₁` with `v_t|_∂D²₁ = u + t` (`|t| ≤ ε₂`) gives a smooth foliation
  with `∂_t v_t ≥ ½` and a unique `t_* ∈ (−ε₂,ε₂)` with `v_(t_*)(0) = 0`. Sweeping
  `t ↓ max(t_*,0)` from `+ε₂` and `t ↑ min(t_*,0)` from `−ε₂`, along which `graph(v_t)`
  avoids both 0 and `∂D^*`, and applying the first-contact lemma 4.1 and the tangency
  principle 3.2 traps `D^*` on one side of the smooth g̃-minimal disk `G_* = graph(v_(t_*))`
  through 0. Every blow-up plane Π of `D^*` at 0 therefore lies on one side of `T₀G_*` and
  hence equals `T₀G_*`: the tangent plane cannot rotate as the scale shrinks, so in normal
  coordinates adapted to `T₀G_* = {z₃ = 0}`, `D^*` is a g̃-minimal graph `z₃ = w(z₁,z₂)`
  over `D²_(r₂) ∖ {0}` with `|Dw(z)| → 0` as `z → 0` (`w ∈ W^(1,∞)(D²_(r₂))`). Cutting off
  test functions on `B_(2ε)(0) ∖ B_ε(0)` produces an `O(ε)` error in the divergence-form
  minimal-surface equation since `|Dw|` is bounded, so w is a weak solution across 0 and is
  smooth on `D²_(r₂)` by the interior estimates 2.2. Thus each `D_ℓ^* ∪ {p}` is a smooth
  minimal disk through p; if `k ≥ 2`, two disjoint punctured disks `D₁^*, D₂^*` could
  neither cross transversely at p nor share `T_pD₁ = T_pD₂`, by the tangency principle 3.2,
  forcing `k = 1`.

## MS9. Compactness under bounded total curvature

For a closed connected orientable minimal surface `Σ²` in a fixed closed Riemannian
three-manifold `(M³,g)`, the traced Gauss equation gives
`|A|² = R_g − 2Ric_g(ν,ν) − 2K_Σ`, so by Gauss–Bonnet [Chodosh, Remark 31.1]

`∫_Σ |A|² ≤ C_g |Σ| − 4πχ(Σ) = C_g |Σ| + 8π(genus(Σ) − 1)`.

Bounded area and genus therefore imply bounded total curvature `∫_Σ |A|²`.

- **9.1 Compactness under bounded area and total curvature** [ChoiSchoen]
  [Chodosh, Theorem 31.3, §34]. Let `Σ_j ⊂ (M³,g)` be nonempty closed embedded minimal
  surfaces in a fixed closed three-manifold with uniformly bounded area and total curvature
  `∫_(Σ_j) |A|² ≤ Λ`. After passing to a subsequence, there is a nonempty closed embedded
  minimal surface `Σ_∞` and a finite set of points `B ⊂ M` with `|B| ≤ Λ/ε` (choose
  `ε > 0` valid for the fixed ambient metric in the small-total-curvature estimate 5.1) such
  that `Σ_j` converges in `C^∞_loc(M ∖ B)` to `Σ_∞ ∖ B`, possibly with multiplicity `> 1` on
  some components. The proof uses: the point-picking lemma 5.4 [Chodosh, Lemma 29.1] and
  ambient blow-up (MS1) to reduce curvature blow-up to a renormalized limit `Σ̃_∞ ⊂ ℝ³` with
  `|A|(0) = 1` and `|A| ≤ 2`; the scale invariance of `∫|A|²` to transfer the energy bound
  to the blow-up; the quantitative lower bound `∫_Σ |A|² ≥ ε > 0` for any complete non-flat
  minimal surface in `ℝ³` with `|A|(0) = 1` and `|A| ≤ 2`, proved by graphical
  neighbourhoods (2.4) [Chodosh, Lemma 31.2]; compactness under bounded area and curvature
  (5.2) on the complement `M ∖ B`; and the removable-singularity theorem of MS8 to
  extend the limit smoothly across B, since monotonicity (3.1) and the area bound give
  quadratic area growth `Area(Σ_∞ ∩ B_ρ(b)) ≤ Cρ²` near each `b ∈ B`, and lower
  semicontinuity gives `∫_(Σ_∞ ∖ B) |A|² ≤ Λ < ∞`. Choose B to contain only actual points of
  failure of smooth convergence, discarding any unnecessary exceptional points.
- **9.2 Multiplicity-one regularity** [Chodosh, Lemma 31.4]. In 9.1, once `Σ_∞` is extended
  smoothly across B by MS8, any component of `Σ_∞` occurring with multiplicity one on
  `Σ_∞ ∖ B` has smooth multiplicity-one convergence everywhere, including at candidate
  points `b ∈ B`: on a ball `B_r(b)` meeting no other component of `Σ_∞` and no other point
  of B, smooth multiplicity-one convergence on the annulus `B_r(b) ∖ B_(ηr)(b)` combined
  with monotonicity (3.1) on `B_(ηr)(b) ⊂ B_r(b)` shows
  `Area(Σ_j ∩ B_r(b))/(πr²) ≤ 1 + ε₀` for small r, η and large j, so the smooth Allard
  regularity theorem 5.5 bounds `|A|` uniformly near b and bounded-curvature compactness
  (5.2) upgrades the convergence across b. Consequently every component meeting the reduced
  set B has multiplicity greater than one. This regularity step is separate from the
  positive-Jacobi-field argument.
- **9.3 Multiplicity implies stability** [Chodosh, Theorem 33.1, Propositions 33.3–33.4]. In
  9.1, if a two-sided component of `Σ_∞` occurs with multiplicity `> 1`, then that component
  is stable. In particular this holds for a two-sided component meeting the reduced set B,
  by 9.2. As in the argument for limits of stable hypersurfaces (7.7), the ordered graph
  sheets on `Σ_∞ ∖ B` converge after normalization to a positive solution of `Jh = 0` on
  `Σ_∞ ∖ B` (2.5, [Chodosh, Proposition 33.3]), which makes `Σ_∞ ∖ B` stable (7.1,
  [Chodosh, Proposition 33.4]), and the logarithmic cutoff argument [Chodosh, Lemma 33.5]
  removes the finite set B to give stability of the closed component: because a point in a
  Riemannian surface has zero 2-capacity (S6 of the surfaces sub-roadmap), any compactly
  supported test function can be replaced by one vanishing near each `b ∈ B` with
  arbitrarily small increase in the Dirichlet energy, so the stability inequality
  `Q(φ) ≥ 0` on `Σ_∞ ∖ B` extends to all of `Σ_∞`. Combined with the nonexistence of closed
  stable minimal hypersurfaces under `Ric > 0` (6.4), this shows that the convergence is
  smooth with multiplicity one when `Ric > 0` and all limit components are two-sided.
  Ambient orientability alone does not ensure this; MS11 and MS12 use a finite cover to
  handle that issue.

## MS10. Eigenvalue estimates and area bounds

- **10.1 Reilly's formula** [Reilly] [Chodosh, §34.1]. Let `(Ω,g)` be a compact Riemannian
  `(n+1)`-manifold with smooth boundary Σ and outward unit normal ν, and let D be its
  Levi-Civita connection. In this formula use `A(X,Y) = ⟨D_Xν,Y⟩`, which is `−⟨II(X,Y),ν⟩`
  in the parent's convention, and let `H = tr A` be the sum of the principal curvatures with
  respect to ν: it is n times the average `(1/n) tr A` of the principal curvatures of this
  A, that is `−n⟨H⃗,ν⟩` for the parent's averaged mean-curvature vector H⃗. Set `z = f|_Σ`
  and `h = ∂_ν f`. For
  `f ∈ C^∞(Ω̄)`:

  `∫_Ω ((Δf)² − |D²f|²) dV`
  `= ∫_Ω Ric(∇f,∇f) dV + ∫_Σ (2h Δ_Σ z + H h² + A(∇_Σ z,∇_Σ z)) dμ`.

  All objects on the left are ambient. For a harmonic extension, the left-hand side equals
  `−∫_Ω |D²f|² dV ≤ 0`; minimality of the boundary does not make it nonnegative.

  **Check.** On the unit ball of `ℝ^(n+1)` with `f = ½|x|²`: `Δf = n+1`, `|D²f|² = n+1`,
  `z = ½`, `h = 1`, `A = g_Σ` and `H = n`, so both sides equal `n(n+1)ω_(n+1)`. With the
  opposite sign of A the right-hand side would be negative.
- **10.2 Choi–Wang first eigenvalue estimate** [ChoiWang] [Chodosh, Theorem 34.3]. Let
  `(M^(n+1),g)` be a closed connected orientable Riemannian manifold with `Ric_g ≥ k g`,
  `k > 0`, and let `Σⁿ ⊂ M` be a closed connected embedded two-sided minimal hypersurface.
  Then `λ₁(−Δ_Σ) ≥ k/2`. By the spectral and Dirichlet theory of R5c for `q = 0`, choose a
  smooth eigenfunction φ on Σ with `Δ_Σ φ + λ₁φ = 0` and extend it smoothly as a harmonic
  function `f ∈ C^∞(Ω̄)` into one of the two components of `M ∖ Σ`, which exist because Σ
  separates M (R7.9). Apply Reilly's formula, choosing the side so that its outward normal
  gives `∫_Σ A(∇φ,∇φ) dμ ≥ 0`; reversing the normal reverses this integral. Green's identity
  then gives `0 ≥ (k − 2λ₁) ∫_Ω |∇f|² dV`. The integral is positive because φ is
  nonconstant, proving the bound.
- **10.3 Hersch's conformal balancing lemma on `S²`** [Hersch] [YangYau]
  [Chodosh, Theorem 34.5]. Let `(Σ,μ)` be a finite positive Borel measure space
  (`μ(Σ) > 0`) and let `Φ : Σ → S² ⊂ ℝ³` be a measurable map whose fibres over antipodal
  points are null: `μ(Φ⁻¹({−v})) = 0` for every `v ∈ S²`; this is automatic when Φ is a
  nonconstant holomorphic map on a compact Riemann surface, whose fibres are finite. For
  `a ∈ B³ = {y ∈ ℝ³ : |y| < 1}`, consider the orientation-preserving conformal Möbius
  diffeomorphism `T_a : S² → S²` given for `x ∈ S²` by

  `T_a(x) = (√(1−|a|²) x + (⟨a,x⟩/(1+√(1−|a|²)) + 1) a) / (1 + ⟨a,x⟩)`,

  which is smooth across `a = 0` with `T₀ = id` and `T_a⁻¹ = T_(−a)`, and conjugate under
  stereographic projection from `−a/|a|` to the dilation `z ↦ √((1−|a|)/(1+|a|)) z` when
  `a ≠ 0`. As `a → v ∈ S²`, `T_a(x) → v` for every `x ∈ S² ∖ {−v}`; by dominated
  convergence, `F(a) = μ(Σ)⁻¹ ∫_Σ (T_a ∘ Φ) dμ` extends continuously from `B³` to its
  closure with `F|_(S²) = id`. By Brouwer's no-retraction theorem (if `F ≠ 0` on `B³`, then
  `F/|F|` would retract the closed ball onto `S²`), there exists `a ∈ B³` such that
  `∫_Σ (T_a ∘ Φ) dμ = 0 ∈ ℝ³`.
- **10.4 Yang–Yau eigenvalue bound** [YangYau] [Chodosh, Theorem 34.5]. Let `(Σ,g)` be a
  closed connected orientable Riemannian surface of genus γ. Then

  `λ₁(−Δ_Σ) |Σ| ≤ 8π(γ+1)`.

  Endowing Σ with the smooth almost complex structure j given by rotation by `+π/2` in
  oriented g-orthonormal frames, isothermal coordinates
  ([PseudoholomorphicCurveAnalysis](../../PseudoholomorphicCurveAnalysis/README.md) §2.4,
  PH2.4) give `(Σ,j)` the holomorphic atlas of a compact connected Riemann surface in which
  g is conformal to `dz dz̄`. Fixing `p ∈ Σ`, Riemann–Roch (§7.2, PH7.2, of the same roadmap,
  applied in divisor form to `D = (γ+1)p`, without Brill–Noether theory) gives
  `dim_ℂ H⁰(𝒪((γ+1)p)) ≥ (γ+1) + 1 − γ = 2`, producing a nonconstant meromorphic function
  whose sole pole at p has order `d ≤ γ+1`, hence by stereographic projection a finite
  holomorphic (smooth orientation-preserving branched conformal) map `Φ : Σ → S² ⊂ ℝ³` of
  degree `d ≤ γ+1` (Tau Ceti's `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic`).
  Away from the finite critical set `{dΦ = 0}`, conformality `Φ^*g_(S²) = λg` gives
  `|dΦ|²_g = Σ_(i=1)^3 |∇_g Φ_i|² = 2λ = 2 Jac_g(Φ)`, and deleting the finite branch-value
  set `S ⊂ S²` and `Φ⁻¹(S)` restricts Φ to a d-sheeted covering map, so the Dirichlet energy
  satisfies `E(Φ) = ½ ∫_Σ |dΦ|²_g dμ_g = d·Area(S²) = 4πd`. Composing with `T_a` from 10.3
  gives a branched conformal map `Φ̃ = T_a ∘ Φ` of degree d with `∫_Σ Φ̃_i dμ_g = 0`
  (`i = 1,2,3`) and `E(Φ̃) = 4πd` (S5). Testing the Rayleigh quotient for `λ₁(−Δ_Σ)` (R5c)
  against `Φ̃₁, Φ̃₂, Φ̃₃` and summing with `Σ_(i=1)^3 Φ̃_i² ≡ 1` yields
  `λ₁(−Δ_Σ) |Σ| ≤ 2E(Φ̃) = 8πd ≤ 8π(γ+1)`. The sharper bound `8π⌊(γ+3)/2⌋`, which needs a
  map of degree at most `⌊(γ+3)/2⌋` from Brill–Noether theory, is not a target of this
  sub-roadmap, and no item uses it.
- **10.5 Area bound from genus under `Ric > 0`** [ChoiSchoen] [Chodosh, §34.3]. Let
  `(M³,g)` be a fixed closed connected orientable three-manifold with `Ric_g ≥ k g`,
  `k > 0`. For a closed connected orientable embedded minimal surface `Σ ⊂ M` of genus γ,
  hence two-sided, the Choi–Wang and Yang–Yau estimates give

  `|Σ| ≤ (2/k) λ₁(−Δ_Σ) |Σ| ≤ (16π/k)(γ+1)`.

  For the fixed ambient metric, the area is therefore bounded in terms of the genus.

## MS11. Frankel's theorem

- **11.1 Second variation of length between submanifolds** [Lee, Chapters 6, 10] [Frankel].
  Let `γ : [0,ℓ] → M` (`ℓ > 0`) be a unit-speed geodesic in a Riemannian m-manifold `(M,g)`
  (`m ≥ 2`) minimizing the distance between two smoothly immersed submanifolds
  `f₁ : Σ₁ → M` and `f₂ : Σ₂ → M` of arbitrary dimensions, with `γ(0) = f₁(x₁)`,
  `γ(ℓ) = f₂(x₂)` and `x₁, x₂` interior points of `Σ₁, Σ₂`. First variation of length along
  variations moving one endpoint and holding the other fixed gives orthogonality at both
  ends: `γ′(0) ⊥ df₁(T_(x₁)Σ₁)` and `γ′(ℓ) ⊥ df₂(T_(x₂)Σ₂)`. For a smooth variation
  `γ_s : [0,ℓ] → M` of `γ₀ = γ` with `γ_s(0) = f₁(σ₁(s))`, `γ_s(ℓ) = f₂(σ₂(s))` and
  transverse variation field `V(t) = ∂_s γ_s(t)|_(s=0)` orthogonal to `γ′(t)`, the second
  variation of length satisfies

  `0 ≤ d²/ds²|_(s=0) L(γ_s)`
  `= ⟨II₂(v₂,v₂),γ′(ℓ)⟩ − ⟨II₁(v₁,v₁),γ′(0)⟩ + ∫₀^ℓ (|D_tV|² − Rm_g(V,γ′,γ′,V)) dt`,

  where `v_i = σ_i′(0)`, `II_i` is the normal-bundle-valued second fundamental form of
  `f_i` (the tangential acceleration `∇^(Σ_i)_s σ_i′(0)` drops out by orthogonality of `γ′`
  at the endpoints), and `Rm_g(V,γ′,γ′,V) = K_g(span(V,γ′)) |V|²` for `V ⊥ γ′`. Realizing a
  prescribed field V along γ with `V(0) = df₁(v₁)` and `V(ℓ) = df₂(v₂)` uses local endpoint
  chart corrections of `exp_(γ(t))(sV(t))` and requires no single normal neighbourhood
  containing γ.
- **11.2 Frankel's theorem** [Frankel]. Let `(M^(n+1),g)` be a complete connected Riemannian
  `(n+1)`-manifold with `Ric_g > 0`, and let `f₁ : Σ₁ → M` and `f₂ : Σ₂ → M` be minimal
  immersions of nonempty closed n-manifolds; in particular, two nonempty closed embedded
  minimal hypersurfaces; more generally, it suffices that one is closed and the other is
  properly immersed without boundary. Then `f₁(Σ₁) ∩ f₂(Σ₂) ≠ ∅`. If the images are
  disjoint, compactness and completeness (Hopf–Rinow) provide points `x₁ ∈ Σ₁`, `x₂ ∈ Σ₂`
  attaining `ℓ = dist_g(f₁(Σ₁),f₂(Σ₂)) > 0` and a unit-speed minimizing geodesic
  `γ : [0,ℓ] → M` from `f₁(x₁)` to `f₂(x₂)`. Parallel transport along γ carries an
  orthonormal basis of `df₁(T_(x₁)Σ₁) = γ′(0)^⊥` to parallel fields `E₁,…,E_n` that form an
  orthonormal basis of `df₂(T_(x₂)Σ₂) = γ′(ℓ)^⊥` at `t = ℓ`. Summing the second-variation
  inequality 11.1 over `V = E₁,…,E_n`, the endpoint terms vanish by minimality
  (`Σ_(j=1)^n II_i(e_j,e_j) = 0`), leaving `0 ≤ −∫₀^ℓ Ric_g(γ′(t),γ′(t)) dt < 0`, a
  contradiction. Neither orientability of M nor two-sidedness of `Σ₁, Σ₂` is needed.
- **11.3 Connectedness of preimages in finite covers** [Frankel] [Bernstein, Theorem 3.1].
  Let `(M^(n+1),g)` be a closed connected Riemannian manifold with `Ric_g > 0`. Compactness
  of M gives `Ric_g ≥ k g` for some `k > 0`, so by Bonnet–Myers (R4.5) the universal
  Riemannian cover `π : M̃ → M` is compact and hence a finite cover of degree
  `d = |π₁(M)|`. For any nonempty closed connected embedded minimal hypersurface `Σ ⊂ M`,
  the full preimage `Σ̃ = π⁻¹(Σ) ⊂ M̃` is a nonempty closed embedded minimal hypersurface in
  `(M̃,π^*g)` whose connected components are pairwise disjoint; since `Ric_(π^*g) > 0`,
  Frankel's theorem implies that Σ̃ is connected (equivalently, `π₁(Σ) → π₁(M)` is
  surjective [Frankel]). Because M̃ is simply connected, M̃ is orientable with
  `b₁(M̃) = 0`, so Σ̃ separates M̃ and is two-sided, hence orientable (R7.9). Moreover,
  `π|_(Σ̃) : Σ̃ → Σ` is a d-sheeted covering, so `χ(Σ̃) = d χ(Σ)`; when `n = 2` and Σ is
  orientable of genus γ, Σ̃ has genus γ̃ with `γ̃ − 1 = d(γ − 1)`.

## MS12. Choi–Schoen compactness

- **12.1 Choi–Schoen compactness** [ChoiSchoen] [Chodosh, Theorem 34.6]. Let `(M³,g)` be a
  closed connected orientable three-manifold with `Ric_g > 0`, and let `Σ_j` be a sequence
  of nonempty closed connected orientable embedded minimal surfaces in M with uniformly
  bounded genus. Then a subsequence converges smoothly, with multiplicity one, to a closed
  connected orientable embedded minimal surface `Σ_∞ ⊂ M`. First prove the statement when M
  has no closed embedded one-sided surfaces, in particular when M is simply connected, as in
  [Chodosh, Theorem 34.6]:

  1. The area bound from the genus (10.5) ensures bounded area.
  2. Gauss–Bonnet (the opening of MS9) converts bounded area and genus to bounded total
     curvature.
  3. Compactness under bounded total curvature (9.1) gives a limit `Σ_∞`, smooth away from a
     finite set B.
  4. Removable singularities (MS8) extend `Σ_∞` smoothly across B.
  5. All limit components are two-sided. A component with multiplicity `> 1` is stable
     (9.3), contradicting `Ric > 0` (6.4). Multiplicity-one regularity (9.2) then removes
     all points of non-smooth convergence. Smooth multiplicity-one convergence on the
     compact limit identifies the surfaces by normal graphs for large j, so connectedness
     and orientability pass to the limit.

  For general M, pass to the universal Riemannian cover `π : M̃ → M` as in 11.3 (following
  [Bernstein, Theorem 3.1]): Bonnet–Myers makes π a finite cover of degree d, and by
  Frankel's theorem the lifted surfaces `Σ̃_j = π⁻¹(Σ_j)` are connected closed orientable
  embedded minimal surfaces with uniformly bounded genus `γ̃_j = 1 + d(γ_j − 1)`. Apply the
  simply connected case upstairs. The smooth limit `Σ̃_∞` is invariant under the deck group
  Γ, and for large j the Γ-equivariant normal projection onto `Σ̃_∞` is a diffeomorphism
  `Σ̃_j → Σ̃_∞` that descends to a diffeomorphism `Σ_j → Σ_∞ = Σ̃_∞/Γ`: thus `Σ_∞` is
  connected and orientable, since the `Σ_j` are, and local covering charts descend smooth
  multiplicity-one convergence to M. Orientability of M alone could not exclude one-sided
  limits before passing to M̃; compare `ℝP² ⊂ ℝP³` in 6.5.

## Downstream consumers

No roadmap on main consumes this sub-roadmap. The parent's R1, R3, R4, R5a, R5b, R5c, R7 and
R8.2 and the surfaces sub-roadmap supply it and take nothing back. The one-sided curvature
estimate and the uniqueness of the helicoid [CM4] consume MS2 and MS7.

## References

- [Bernstein] J. Bernstein, *Compactness properties of minimal surfaces in three-manifolds*,
  Math 286 lecture notes, Spring 2011, Chapter 3,
  <https://math.jhu.edu/~bernstein/math286/286Notex.pdf>.
- [BT] R. Bott and L. W. Tu, *Differential Forms in Algebraic Topology*, Graduate Texts in
  Mathematics 82, Springer, 1982, doi:10.1007/978-1-4757-3951-0.
- [Chodosh] O. Chodosh, *Introduction to minimal surfaces*, lecture notes, Stanford
  University, version of 15 September 2025,
  <https://web.stanford.edu/~ochodosh/Math286-min-surf.pdf>.
- [ChoiSchoen] H. I. Choi and R. Schoen, *The space of minimal embeddings of a surface into
  a three-dimensional manifold of positive Ricci curvature*, Invent. Math. 81 (1985),
  387–394, doi:10.1007/BF01388577.
- [ChoiWang] H. I. Choi and A. N. Wang, *A first eigenvalue estimate for minimal
  hypersurfaces*, J. Differential Geom. 18 (1983), 559–562, doi:10.4310/jdg/1214437788.
- [CM] T. H. Colding and W. P. Minicozzi II, *A Course in Minimal Surfaces*, Graduate
  Studies in Mathematics 121, American Mathematical Society, 2011.
- [CM4] T. H. Colding and W. P. Minicozzi II, *The space of embedded minimal surfaces of
  fixed genus in a 3-manifold IV; Locally simply connected*, Ann. of Math. (2) 160 (2004),
  573–615, doi:10.4007/annals.2004.160.573.
- [dCP] M. do Carmo and C. K. Peng, *Stable complete minimal surfaces in ℝ³ are planes*,
  Bull. Amer. Math. Soc. (N.S.) 1 (1979), 903–906, doi:10.1090/S0273-0979-1979-14689-5.
- [FCS] D. Fischer-Colbrie and R. Schoen, *The structure of complete stable minimal surfaces
  in 3-manifolds of non-negative scalar curvature*, Comm. Pure Appl. Math. 33 (1980),
  199–211, doi:10.1002/cpa.3160330206.
- [Frankel] T. Frankel, *On the fundamental group of a compact minimal submanifold*, Ann. of
  Math. (2) 83 (1966), 68–73, doi:10.2307/1970471.
- [GT] D. Gilbarg and N. S. Trudinger, *Elliptic Partial Differential Equations of Second
  Order*, Classics in Mathematics, Springer, 2001.
- [Hersch] J. Hersch, *Quatre propriétés isopérimétriques de membranes sphériques
  homogènes*, C. R. Acad. Sci. Paris Sér. A-B 270 (1970), A1645–A1648.
- [HM] D. Hoffman and W. H. Meeks III, *The strong halfspace theorem for minimal surfaces*,
  Invent. Math. 101 (1990), 373–377, doi:10.1007/BF01231506.
- [Lee] J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Graduate Texts in
  Mathematics 176, Springer, 2018, doi:10.1007/978-3-319-91755-9.
- [Lynch] S. Lynch, *The Cheng–Yau gradient estimate for Jacobi fields*, preprint, 2026,
  arXiv:2611.12758v1.
- [Pogorelov] A. V. Pogorelov, *On the stability of minimal surfaces*, Dokl. Akad. Nauk SSSR
  260 (1981), 293–295; English translation in Soviet Math. Dokl. 24 (1981), 274–276.
- [Reilly] R. C. Reilly, *Applications of the Hessian operator in a Riemannian manifold*,
  Indiana Univ. Math. J. 26 (1977), 459–472, doi:10.1512/iumj.1977.26.26036.
- [Schoen] R. Schoen, *Estimates for stable minimal surfaces in three-dimensional
  manifolds*, in *Seminar on Minimal Submanifolds*, Annals of Mathematics Studies 103,
  Princeton University Press, 1983, 111–126.
- [SY] R. Schoen and S.-T. Yau, *On the structure of manifolds with positive scalar
  curvature*, Manuscripta Math. 28 (1979), 159–183, doi:10.1007/BF01647970.
- [Simons] J. Simons, *Minimal varieties in riemannian manifolds*, Ann. of Math. (2) 88
  (1968), 62–105, doi:10.2307/1970556.
- [White] B. White, *Introduction to minimal surface theory*, in *Geometric Analysis*,
  IAS/Park City Math. Ser. 22, American Mathematical Society, 2016, 387–438.
- [WhiteReg] B. White, *A local regularity theorem for mean curvature flow*, Ann. of
  Math. (2) 161 (2005), 1487–1519, doi:10.4007/annals.2005.161.1487.
- [YangYau] P. C. Yang and S.-T. Yau, *Eigenvalues of the Laplacian of compact Riemann
  surfaces and minimal submanifolds*, Ann. Scuola Norm. Sup. Pisa Cl. Sci. (4) 7 (1980),
  55–63.
