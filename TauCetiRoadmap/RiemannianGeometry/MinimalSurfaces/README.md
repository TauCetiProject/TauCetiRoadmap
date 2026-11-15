# Roadmap: minimal surfaces

**Summary.** Develop the theory of smooth minimal hypersurfaces in Riemannian manifolds, with
submanifold statements in arbitrary codimension where the proof is the same, and of minimal
surfaces in three-manifolds where the arguments are specific to dimension two. The headline
results are the half-space theorem (MS4), local compactness and ε-regularity (MS5), the
Morse index and stability (MS6), the curvature estimate for stable surfaces (MS7), removable
singularities and compactness under bounded total curvature (MS8 and MS9), Frankel's theorem
(MS11) and the Choi–Schoen compactness theorem for minimal surfaces of bounded genus in
three-manifolds of positive Ricci curvature (MS12). Every hypothesis is explicit; the main
references throughout are Colding and Minicozzi's book [CM], White's lecture notes [White]
and Chodosh's lecture notes [Chodosh].

This README is the roadmap. `Suggested.lean` states the targets that are statable against the
pinned Mathlib and Tau Ceti: the half-space theorem (4.2), ε-regularity (5.1) and the
curvature estimate for stable surfaces (7.5) in `ℝ³`, Bernstein's theorem (7.6) and Hersch's
balancing lemma (10.3). Its docstring names, for each other headline, the carrier of the
parent roadmap that the statement needs.

## Scope and ownership

This sub-roadmap of [RiemannianGeometry](../README.md) is independently definitive. Its
sections are labelled MS1–MS12, and an item is cited by section and position: 7.4 is the
fourth item of MS7. MS1 is the supplier contract of the parent roadmap and of its
sub-roadmap on surfaces, and owns one corollary, item 1.1. MS2–MS12 are the layers of the
build, Layer k being MSk, and own:

- MS2: the minimal-surface equation for graphs in `ℝ^(n+1)` and in coordinates on a
  Riemannian manifold, its interior estimates, the small-data Dirichlet problem with its
  foliation by minimal graphs, graphical neighbourhoods under a curvature bound with the
  scaling laws, the linear equation satisfied by the difference of two sheets with its
  Harnack and gradient estimates, and multi-valued graphs.
- MS3: monotonicity for proper minimal immersions with its affine-plane rigidity case, the
  boundary form of the tangency principle, the convex hull property, the maximum principle
  in a small ball, the mean value inequality, the improved Kato inequality and the
  two-dimensional forms of G6's Simons identity, and the two-dimensional Kato form of G6's
  Riemannian Simons inequality.
- MS4: the first-contact lemma, the global tangency principle, the catenoid barriers and the
  half-space theorem.
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
  bound `λ₁(−Δ_Σ) |Σ| ≤ 8πd` for a holomorphic map of degree d to the sphere, the
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
- The parent's R5c owns, on R5b's Dirichlet realization and on closed manifolds, the index
  of a symmetric Schrödinger operator on smooth sections, the principal eigenfunction of a
  scalar one with strict domain monotonicity, the first positive eigenvalue of the Laplacian
  with its Rayleigh characterization, and the scalar Dirichlet problem; R7.9 owns separating
  and two-sided hypersurfaces; R4.1 owns the Hessian of the distance and the smooth upper
  distance barriers; R4.5 owns Bonnet–Myers; R7.0 owns the scalar Bochner identity; R1 owns
  the Euclidean limits of rescaled metrics. The sub-roadmap
  [Local geometry of Riemannian surfaces](../Surfaces/README.md) owns the intrinsic geometry
  of surfaces (S1–S6). MS1 states what each of them supplies and which of these statements
  the items consume.
- [PositiveMass](../../PositiveMass/README.md) §3.1 owns the Gauss–Bonnet theorem for closed
  surfaces, built on S3; the opening of MS9 consumes it. The Euler characteristic, which
  defines the genus, and its multiplicativity under finite covers are Tau Ceti's
  ([AlgebraicTopology](../../AlgebraicTopology/README.md) §7.1 and §7.3); 11.3 consumes them.
- [GeometricCurrents](../../GeometricCurrents/README.md) G6 owns monotonicity for stationary
  varifolds, the strong one-sided maximum principle for smooth minimal hypersurfaces, and
  Simons' identity and inequality. The interior tangency principle of 3.2 is that maximum
  principle: it is one theorem, consumed here, and 3.2 owns its boundary form. Item 3.1 is
  the statement for smooth proper minimal immersions, with its exact remainder, proved from
  the first variation without varifolds. Item 3.6 consumes Simons' identity and inequality
  and owns what G6 does not state: the improved Kato inequality, the two-dimensional
  equalities, and the two-dimensional Kato form of G6's Riemannian Simons inequality.
- [PDE](../../PDE/README.md) owns the linear elliptic theory: maximum principles and the
  Hopf lemma (PDE C13), Harnack inequalities (PDE C14), De Giorgi–Nash–Moser (PDE E23) and
  the Schauder estimates (PDE E22 and E25). This sub-roadmap owns their application to the
  minimal-surface equation and to the Jacobi equation.
- [PseudoholomorphicCurveAnalysis](../../PseudoholomorphicCurveAnalysis/README.md) PH2.4
  owns isothermal coordinates and PH7.2 owns Riemann–Roch. Item 10.4 consumes them.
- Hersch's balancing lemma (10.3) and the bound `λ₁(−Δ_Σ) |Σ| ≤ 8πd` for a holomorphic map
  of degree d from a closed Riemannian surface to the sphere (10.4) have this sub-roadmap
  as their single owner. A roadmap that needs this bound for a holomorphic map of degree d
  on a compact Riemann surface, as CanonicalModelsAndGonality §8.4 does,
  cites 10.3 and 10.4.
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
compact without boundary. The genus γ of a closed connected orientable surface Σ is defined
by `χ(Σ) = 2 − 2γ`, where χ is Tau Ceti's Euler characteristic `TauCeti.eulerChar`; a compact
smooth manifold has finite CW type by AlgebraicTopology §8.7. This is the genus that PH7.2
uses.

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
  codimension [CM, §1.1]. Item 1.1 below is their corollary for a minimal surface in `ℝ³`.
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
    interior on which `K ≤ 0`, and which is simply connected and contained in one coordinate
    chart (for instance a ball in a disk parametrized by one chart), `exp_p` maps the
    tangent ball diffeomorphically onto it, radial geodesics realizing the distance;
  - the conformal invariance of the Dirichlet energy `∫|∇φ|²` of a function on a surface
    (S5);
  - the logarithmic cutoff (S6): for a point p of a Riemannian surface Σ, a radius δ below a
    normal-ball radius at p and `0 < 4ε ≤ δ`, there is a smooth function
    `χ_ε : Σ → [0,1]` with `χ_ε = 0` on `B_ε^Σ(p)` and `χ_ε = 1` outside `B_δ^Σ(p)` whose
    Dirichlet energy `∫_Σ |∇χ_ε|² dμ` is `2π/log(δ/ε)` up to an error of order
    `1/log(δ/ε)²`, and so tends to 0 as `ε → 0⁺`: a point of a Riemannian surface has zero
    2-capacity, the capacity of the Dirichlet energy. The cutoff is `χ_ε = ψ ∘ r`, where
    `r = dist_g(p,·)` and ψ is a smooth nondecreasing function equal to 0 on `[0,ε]`, to 1 on
    `[δ,∞)` and to `log(r/ε)/log(δ/ε)` on `[2ε, δ/2]`, and the energy is computed in the
    geodesic polar coordinates of S1. Consequently an inequality `∫ Vφ² ≤ ∫ |∇φ|²`, with V
    continuous, that holds for the test functions supported away from a finite set of points
    holds for every compactly supported test function.

  Of these, the items below use S3 through the Gauss–Bonnet theorem for closed surfaces of
  PositiveMass §3.1 (the opening of MS9), S5 in 10.4 and S6 in 9.3; the Checks of 6.2 also
  use S5 and S6. No item uses S1, S2 or S4: the curvature estimate of MS7 does not go
  through the areas of intrinsic balls.
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
- **Smooth upper distance barriers.** R4.1 [Lynch, Proposition B.1]: given a unit-speed
  minimizing geodesic `γ : [0,ℓ] → M` in a Riemannian m-manifold (`m ≥ 2`,
  `ℓ = dist_g(p,p̄) > 0`) with `Ric_g(γ′,γ′) ≥ −(m−1)k` along γ for some `k ≥ 0`, there is a
  smooth function r̃ on a neighbourhood of p̄, the arc length of a smooth family of curves
  from p obtained by varying γ along parallel fields modulated by `sinh(√k t)/sinh(√k ℓ)`
  (or `t/ℓ` when `k = 0`), with `r̃ ≥ dist_g(p,·)`, `r̃(p̄) = ℓ`, `|∇r̃(p̄)| = 1` and
  `Δr̃(p̄) ≤ (m−1)√k coth(√k ℓ) ≤ (m−1)(√k + 1/ℓ)`. It requires only first and second
  variation of arc length and no cut-locus theory, and handles interior maxima at cut points
  in 7.4.
- **Geodesic variations and Riemannian coverings.** First and second variation of geodesic
  arc length and energy, including the first variation with a moving endpoint (R4.2) and
  the second variation of length with free endpoints (R3) [Lee, Chapters 6, 10], and the
  complete pullback metric with inherited curvature bounds on the universal cover of a
  complete Riemannian manifold (R4.3). They are used in MS7 and in Frankel's theorem and the
  finite-cover reduction (MS11 and MS12).
- **Bonnet–Myers.** R4.5 [Lee, Chapter 12]: on a complete connected Riemannian m-manifold
  (`m ≥ 2`) with `Ric_g ≥ (m−1)δ g`, `δ > 0`, the diameter is at most `π/√δ`, so the
  manifold is compact and its universal Riemannian cover is compact and hence a finite
  cover, with `π₁` finite. It is used in the finite-cover reduction of MS11 and MS12.
- **Hypersurface separation and two-sidedness.** R7.9 [BT, §5]: in a connected closed
  Riemannian manifold M with `H¹_dR(M) = 0`, in particular when `Ric_g > 0` by R7.6, every
  connected closed two-sided embedded hypersurface `Σ ⊂ M` separates M into two compact
  manifolds with common smooth boundary Σ and opposite outward unit normals; and a simply
  connected manifold contains no closed embedded one-sided hypersurface. It is used in MS6,
  MS10, MS11 and MS12.
- **Spectrum and Dirichlet problem for Schrödinger operators on compact manifolds.** R5b
  and R5c [GT, Chapter 8]: let `(M,g)` be a compact Riemannian m-manifold (`m ≥ 1`), closed
  or with smooth boundary `∂M`, and `L = −Δ_g + q` with q smooth. R5b owns the Dirichlet
  realization of a symmetric bundle Schrödinger operator, with its eigenbasis and its index
  statement on `W^(1,2)₀`; R5c consumes it and owns the closed case, the index on smooth
  sections and the scalar statements. Both state the Dirichlet case for the closure of a
  relatively compact smooth domain of a boundaryless manifold, and the compact manifolds
  with boundary of this sub-roadmap are used in that form: a compact domain with smooth
  boundary in the source of an immersion, or in the ambient manifold.
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

#### 1.1 The Gauss curvature of a minimal surface in `ℝ³`

*Sources:* [CM, §1.1]; [White, §§2–3]; [Chodosh, Corollary 7.9].

For a minimal surface in `ℝ³`, prove `K = −½|A|²`: by R5a's Gauss equation K is the product
of the two principal curvatures, which are opposite, and `|A|²` is the sum of their squares.
Also prove, from R5a's Gauss formula, that `Hess_Σ(x_i ∘ f) = ⟨II, e_i⟩` for an isometric
immersion `f : Σ → ℝ^m`. Hence `|II|² = Σ_i |Hess_Σ(x_i ∘ f)|²`; for `m = 3`, `n = 2` this sum
is `hessianCoordNormSq`.

**Checks.**

- Catenoid `(cosh v cos θ, cosh v sin θ, v)`: the principal curvatures are `±1/cosh² v`, so
  `K = −1/cosh⁴ v` and `|A|² = 2/cosh⁴ v`.
- Helicoid `(ρ cos t, ρ sin t, t)`: `K = −1/(1+ρ²)²` and `|A|² = 2/(1+ρ²)²`.
- A plane: both sides vanish.
- Negative control for minimality: the unit sphere has `K = 1` and `|A|² = 2`; the identity
  for an arbitrary surface is `2K = (κ₁+κ₂)² − |A|²`, here `2 = 4 − 2`.
- Round sphere of radius ρ: `Hess_Σ(x_i ∘ f) = −(ν_i/ρ) g`, so the sum is `2/ρ² = |A|²`; on the
  catenoid it is `2/cosh⁴ v`.
- Negative control for isometry: for `2ι` on the unit sphere the sum is 8, while the image
  sphere has `|A|² = ½`.

*Needs:* R5a's Gauss equation and Gauss formula.

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
- [PositiveMass](../../PositiveMass/README.md) §3.1: the Gauss–Bonnet theorem
  `∫_Σ K dμ = 2πχ(Σ)` for a closed oriented Riemannian surface, the case `∂Σ = ∅` of its
  theorem for compact domains.
- [AlgebraicTopology](../../AlgebraicTopology/README.md) §7.1, the Euler characteristic,
  §7.3, its multiplicativity under finite covers, and §8.7, the finite CW type of a compact
  smooth manifold.
- [DifferentialGeometry](../../DifferentialGeometry/README.md) 10.2, Sard's theorem, and
  12.5, the divergence theorem on a compact manifold with boundary.
- [SmoothBundlesConnections](../../SmoothBundlesConnections/README.md) B5.0: parallel
  transport along a curve.

### From Tau Ceti and Mathlib

- `TauCeti.Manifold.laplaceBeltrami`, the Laplacian `Δ = div grad` of the conventions.
- `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic`, the finite holomorphic map to
  the Riemann sphere of a nonconstant meromorphic function on a compact Riemann surface
  (10.4).
- `TauCeti.noRetraction_diskBoundary`, Brouwer's no-retraction theorem (10.3).
- `TauCeti.Manifold.integral_mul_laplaceBeltrami`, Green's first identity
  `∫ f Δg = −∫ ⟨∇f,∇g⟩` for a compactly supported f on a manifold without boundary (MS7), and
  `TauCeti.Manifold.laplaceBeltrami_nonpos_of_isLocalMax`, `Δf(x) ≤ 0` at a local maximum of
  a function that is `C²` at x (3.3, 3.4, 7.4).
- `TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient`, the scalar Bochner identity of R7.0
  (7.4).
- `TauCeti.eulerChar` and `TauCeti.eulerChar_eq_mul_of_isCoveringMap`, the Euler
  characteristic of a space of finite CW type and `χ(E) = d χ(B)` for a covering with fibres
  of d points (the conventions, 11.3).
- Mathlib's implicit function theorem in Banach spaces,
  `HasStrictFDerivAt.implicitFunctionOfProdDomain` (2.3), its Fourier series on the circle,
  `fourierBasis` (6.5), the Arzelà–Ascoli theorem `BoundedContinuousFunction.arzela_ascoli`
  (5.2, 5.3), the extreme value theorem `IsCompact.exists_isMaxOn` (5.4) and dominated
  convergence, `MeasureTheory.tendsto_integral_of_dominated_convergence` (10.3).

## How to read the build

MS3 (first consequences of minimality) rests on MS1 and MS2. MS4 (the half-space theorem) rests
on MS2 and MS3. MS5 (local compactness and ε-regularity) uses MS1, MS2 and MS3 for compactness
under curvature bounds, including varying metrics on exhaustions for ambient blow-ups, and for
the smooth version of Allard regularity, specifically affine-plane rigidity in monotonicity;
and it uses Simons' inequality, monotonicity and the mean value inequality (MS3) for
ε-regularity.

MS6 (the Morse index and stability) rests on MS1: second variation in arbitrary codimension,
normal double covers, Riemannian coverings, the Bochner formula and the spherical-harmonic
spectrum of R8.2, and the bundle and scalar Schrödinger spectral theory of R5b and R5c; and on
Fourier series on the two-torus.

The positive-Jacobi-field and curvature estimates in MS7 follow [Lynch] in `ℝ³`; their
adaptation to a Riemannian three-manifold is this roadmap's own argument. They use MS6 (the
stability quadratic form), the Bochner formula, the two-dimensional form of Simons' identity
and the two-dimensional Kato form of G6's Riemannian Simons inequality (3.6), the Gauss
equation (MS1), and the smooth
upper distance barriers of R4.1. This route is independent of MS2, MS4 and MS5, and does not
need point-picking, ambient blow-up, pointed compactness for immersed surfaces, Pogorelov's
area bound, the logarithmic cutoff or graphical neighbourhoods. The implication from stability
to a positive Jacobi field uses the Schrödinger spectral and Dirichlet theory on compact
manifolds with boundary (R5c), together with interior Harnack and elliptic compactness on an
exhaustion in the noncompact case. Item 7.7 on limits of stable hypersurfaces additionally uses
MS2 (graph differences), MS5 (compactness under bounded curvature) and MS6 (one-sided stability
on the normal double cover).

MS8 (removable singularities) rests on MS1 (Hessian of `r²` and ambient blow-up), on MS2 (the
small-data Dirichlet problem for minimal graphs, built by the Banach-space implicit function
theorem from the boundary Schauder theory of [PDE](../../PDE/README.md) §5.6, and the interior
estimates), on MS3 and MS4 (monotonicity, the first-contact lemma and the tangency principle),
and on MS5 (ε-regularity and varying-metric bounded-curvature compactness).

MS9 (compactness under bounded total curvature) rests on the Gauss–Bonnet theorem for closed
surfaces (PositiveMass §3.1) and the logarithmic cutoff (S6), graphical neighbourhoods and the
Harnack and gradient bounds for graph differences (MS2), monotonicity (MS3), positive Jacobi
fields and limits of stable hypersurfaces (MS7), local compactness, ε-regularity and smooth
Allard regularity (MS5), and removable singularities (MS8).

MS10 (eigenvalue estimates) rests on Reilly's formula, which requires the ambient Bochner
formula and the divergence theorem on a compact manifold with boundary (DifferentialGeometry
12.5); on the closed-manifold spectral theory and the Dirichlet theory on manifolds with
boundary for `−Δ` (R5c) and on separation by two-sided embedded hypersurfaces (R7.9); on
isothermal coordinates and closed Riemann–Roch (PH2.4 and PH7.2, together with Tau Ceti's
finite holomorphic sphere maps); and on Brouwer's no-retraction theorem for Hersch's conformal
balancing argument, which gives the Yang–Yau bound `8π(γ+1)`; the sharper `8π⌊(γ+3)/2⌋` would
also require the Brill–Noether gonality bound and is not a target.

MS11 (Frankel's theorem) rests on the suppliers: Hopf–Rinow, first and second variation of
geodesic arc length with moving endpoints, parallel transport and the second fundamental form.
Its finite-cover corollary 11.3 also uses Riemannian coverings, Tau Ceti's multiplicativity of
the Euler characteristic under finite covers, and Bonnet–Myers (R4.5).

MS12 (Choi–Schoen compactness) combines MS6–MS11: it uses the area bound from the genus (MS10),
Gauss–Bonnet, compactness under bounded total curvature, multiplicity-one regularity and the
stability of components of higher multiplicity (MS9), removable singularities (MS8), the
nonexistence of closed two-sided stable hypersurfaces under `Ric > 0` (MS6), and, for general
ambient manifolds, the finite-cover reduction from Bonnet–Myers and Frankel's theorem (MS11).

Every item below ends with the inputs it needs, and every layer with its Examples and its
Dependencies. The Lean name at a target is its signature in `Suggested.lean`.

## Layer 2 (MS2): minimal graphs and local geometry

### 2.1 The minimal-surface equation

*Sources:* [CM, §1.1]; [Chodosh, §18].

Let `Ω ⊂ ℝⁿ` be open and `u ∈ C²(Ω)`. The graph `x_(n+1) = u(x₁,…,x_n)` in `ℝ^(n+1)` has area
`∫_Ω √(1+|Du|²)`, and it is minimal precisely when

`div(Du/√(1+|Du|²)) = 0`, equivalently `(1+|Du|²) Δu − Σ_(i,j=1)^n D_i u D_j u D_ij u = 0`.

When `|Du| ≤ M` the equation is uniformly elliptic, with constants depending on n and M.
Establish the corresponding equation for a graph in coordinates on a Riemannian
`(n+1)`-manifold N [CM, §2.6], which is a quasilinear equation whose coefficients depend
smoothly on x, u and Du through the ambient metric and its first derivatives, and is uniformly
elliptic when `|Du| ≤ M` and the graphs stay in a fixed compact coordinate cylinder on which
the metric is uniformly positive definite.

**Checks.**

- Affine u: `Du` is constant and `D²u = 0`, so the equation holds; the graph is a hyperplane.
- The half-catenoid `u = arccosh ρ` over `{ρ > 1} ⊂ ℝ²`, `ρ = |x|`: `u′ = (ρ² − 1)^(−1/2)` and
  `√(1 + u′²) = ρ (ρ² − 1)^(−1/2)`, so `ρ u′/√(1 + u′²) = 1` and
  `div(Du/√(1+|Du|²)) = ρ⁻¹ (ρ u′/√(1 + u′²))′ = 0`.
- Scherk's graph `u = log cos x − log cos y` on `|x|, |y| < π/2`: `u_xx = −sec² x`,
  `u_yy = sec² y` and `u_xy = 0`, so
  `(1 + u_y²) u_xx + (1 + u_x²) u_yy = −sec² y sec² x + sec² x sec² y = 0`.
- Negative control: `u = xy` is harmonic and not minimal, the left-hand side of the second form
  being `−2 u_x u_y u_xy = −2xy`; for `u = x² + y²` it is `4 + 8(x² + y²)`.
- Ellipticity: the matrix `(1 + |p|²) δ_ij − p_i p_j` has the eigenvalue 1 on p and `1 + |p|²`
  on the orthogonal complement of p, so the ellipticity ratio is `1 + |p|² ≤ 1 + M²`.

*Needs:* R5a's mean curvature and first variation of volume, for graphs.

### 2.2 Interior estimates

If u solves the minimal-surface equation on the ball `B_R ⊂ ℝⁿ` with `|Du| ≤ M`, then for every
`k ≥ 2`

`sup_(B_(R/2)) |D^k u| ≤ C(n,k,M) R^(1−k)`.

For a minimal graph in coordinates on a Riemannian `(n+1)`-manifold, the same holds for R below
a scale and with constants depending also on the ambient metric in the chosen coordinates, with
the graphs in a fixed compact coordinate cylinder. The proof is elliptic theory: De
Giorgi–Nash–Moser for Du, then the Schauder bootstrap of [Chodosh, Lemma 19.1]. The linear
estimates are those of [PDE](../../PDE/README.md) (E23, then E22 and E25); their application to
the minimal-surface equation is the target here.

**Checks.**

- Scaling: if u solves the equation on `B_R` with `|Du| ≤ M`, then `u_λ(x) = λ u(x/λ)` solves
  it on `B_(λR)` with the same bound, and `D^k u_λ(x) = λ^(1−k) D^k u(x/λ)`: this is the factor
  `R^(1−k)` of the estimate.
- Affine u: both sides vanish for every `k ≥ 2`.

*Needs:* 2.1; PDE E23, then E22 and E25.

### 2.3 Small-data Dirichlet problem for minimal graphs

*Sources:* [Chodosh, proof of Theorem 32.5], for `g = g_Eucl`. The dependence on g is this
roadmap's extension: the same implicit-function argument, with g as a parameter.

Let `B₁ ⊂ ℝⁿ` (`n ≥ 2`) be the unit ball and `0 < α < 1`. For a smooth (or `C⁴`) Riemannian
metric g on `B̄₁ × [−1,1]` close to `g_Eucl` in `C⁴(B̄₁ × [−1,1])` and `u ∈ C^(2,α)(B̄₁)` with
small norm, let `M_g(u)` denote the coordinate g-minimal-graph operator of 2.1: `M_g(u)(x)` is
the trace of the second fundamental form of the graph of u at `(x,u(x))` for the metric g,
paired with the upward g-unit normal ν, `M_g(u) = ⟨tr II, ν⟩_g`. The graph is g-minimal exactly
when `M_g(u) = 0`, and `M_(g_Eucl)(u) = div(Du/√(1+|Du|²))`. The nonlinear map
`(g,u) ↦ (M_g(u), u|_∂B₁)` from a neighbourhood of `(g_Eucl,0)` in
`C⁴(B̄₁ × [−1,1]) × C^(2,α)(B̄₁)` to `C^(0,α)(B̄₁) × C^(2,α)(∂B₁)` is `C¹`, sends `(g_Eucl,0)`
to `(0,0)`, and has partial Fréchet derivative in u at `(g_Eucl,0)` equal to
`v ↦ (Δ_Eucl v, v|_∂B₁)`, a Banach-space isomorphism by boundary Schauder theory
([PDE](../../PDE/README.md) §5.6, E25; [GT, Theorems 6.6, 6.14]). By the Banach-space implicit
function theorem, there exist `δ₀(n,α), C(n,α) > 0` such that whenever
`‖g − g_Eucl‖_(C⁴) + ‖φ‖_(C^(2,α)(∂B₁)) ≤ δ₀`, there is a unique small solution
`u ∈ C^(2,α)(B̄₁)` of `M_g(u) = 0` with `u|_∂B₁ = φ`, satisfying

`‖u‖_(C^(2,α)(B̄₁)) ≤ C(‖φ‖_(C^(2,α)) + ‖g − g_Eucl‖_(C⁴))`,

and smooth in `B₁` when g is smooth, by 2.2. Moreover, u varies `C¹`-smoothly with `(g,φ)`: for
`φ_t = φ + t` (`|t|` small), `∂_t u_t` equals 1 at `(g_Eucl,0,0)`, so after shrinking `δ₀` one
has `∂_t u_t ≥ ½ > 0` on `B̄₁`, producing an increasing foliation by g-minimal graphs, used in
MS8. Rescaling `x ↦ x/R` gives the corresponding statement over `B_R ⊂ ℝⁿ`.

**Checks.**

- Euclidean values: `M_(g_Eucl)(u) = 0` for affine u, and for `u = ½|x|²`,
  `M_(g_Eucl)(u) = (n + (n−1)|x|²)/(1 + |x|²)^(3/2)`, equal to `n = Δu` at the origin.
- Linearization: for `v = ½|x|²`, `M_(g_Eucl)(tv) = t (n + (n−1)t²|x|²)/(1 + t²|x|²)^(3/2)`,
  which is `tΔv + O(t³)`; the derivative in u at `(g_Eucl,0)` is `Δ_Eucl`, and with the
  downward normal it would be `−Δ_Eucl`.
- Constant rescaling: `M_(λ² g_Eucl)(u) = λ⁻¹ M_(g_Eucl)(u)` for a constant `λ > 0`, so the two
  metrics have the same minimal graphs.
- A metric that is not flat: for `g = e^(2at)(dx² + dt²)`, t being the last coordinate, the
  constant function `u ≡ t₀` has `M_g(u) = −n a e^(−a t₀)`, so the horizontal slices are
  g-minimal only for `a = 0`. For the hyperbolic metric `t⁻²(dx² + dt²)` on `{t > 0}` the same
  computation gives `M_g(u) = n`: the horospheres have all principal curvatures equal to 1.
- Foliation: for `g = g_Eucl` and `φ = 0` the solutions are `u_t ≡ t`, with `∂_t u_t = 1`.

*Needs:* 2.1, 2.2; PDE E25 (the Dirichlet problem for the Laplacian in `C^(2,α)` with its
global estimate); `HasStrictFDerivAt.implicitFunctionOfProdDomain`.

### 2.4 Graphical neighbourhoods and scaling

*Sources:* [CM, Lemma 2.4]; [Chodosh, Lemmas 28.1–28.3].

Let C be a compact subset of a Riemannian `(n+1)`-manifold N. There are constants
`c(n), C(n) > 0` and a scale `r₀ > 0` depending on the metric near C (`r₀ = ∞` when
`N = ℝ^(n+1)`) with the following property. If `Σ ⊂ N` is a minimal hypersurface, `p ∈ Σ ∩ C`,
`0 < r ≤ r₀`, the closure of `B_r^Σ(p)` is compact and contained in the interior of Σ, and
`r sup_(B_r^Σ(p)) |A| ≤ c`, then in normal coordinates at p (the blow-up of MS1; Euclidean
coordinates when `N = ℝ^(n+1)`) there is a graphical neighbourhood of p contained in `B_r^Σ(p)`
over the tangent ball of radius `r/2`. Its graphing function satisfies `u(0) = 0`, `Du(0) = 0`
and

`|Du| + r|D²u| ≤ C(r sup_(B_r^Σ(p)) |A| + K₀r²)`,

where `K₀` bounds the ambient curvature near C, and `r₀` is also chosen so that `K₀r₀²` is
small. In Euclidean space `K₀ = 0`. The Riemannian estimate includes the Christoffel-symbol
terms in the coordinate expression for the second fundamental form. Under `x ↦ λx` in
`ℝ^(n+1)`, lengths, n-dimensional volume and `|A|²` scale by λ, `λⁿ` and `λ⁻²`, respectively.

**Checks.**

- A hyperplane of `ℝ^(n+1)`: `A = 0`, the graph is `u ≡ 0` over every tangent ball, and both
  sides of the estimate vanish.
- The catenoid `𝒞`: `|A|² = 2/cosh⁴ x₃`, so `sup |A| = √2`, attained on the waist circle, and
  the hypothesis `r sup |A| ≤ c` holds at every point for `r ≤ c/√2`.
- Scaling: on `λ𝒞`, `|A|²(λx) = 2/(λ² cosh⁴ x₃)`, which is `λ⁻²` times the value on `𝒞`, and
  the hypothesis `r sup |A| ≤ c` is invariant under `(Σ, r) ↦ (λΣ, λr)`.

*Needs:* 2.1; R5a's second fundamental form in graph coordinates; R1's Euclidean limits of
rescaled metrics (MS1).

### 2.5 Several sheets

*Sources:* [CM, §1.7]; [Chodosh, Proposition 19.3, Lemma 33.2].

If `u₁` and `u₂` solve the minimal-surface equation in a fixed compact coordinate cylinder over
`B_R ⊂ ℝⁿ` in a Riemannian `(n+1)`-manifold (or in `ℝ^(n+1)`) with `|Du_i| ≤ M`, then
`w = u₂ − u₁` satisfies a linear elliptic equation `Σ a_ij D_ij w + Σ b_i D_i w + c w = 0`
(`c = 0` in `ℝ^(n+1)`), whose coefficients are built from `u_i`, `Du_i` and `D²u₁` and are
controlled by the interior estimates. When `w > 0` and R is below a scale depending on M and
the ambient metric (for every `R > 0` in `ℝ^(n+1)`), Harnack's inequality and the gradient
estimate for this equation give

`sup_(B_(R/2)) w ≤ C inf_(B_(R/2)) w` and `|Dw| ≤ (C/R) w` on `B_(R/2)`,

with C depending on n, M and the ambient metric (only on n and M in `ℝ^(n+1)`).

**Checks.**

- Parallel planes `u₁ = 0`, `u₂ = c > 0`: `w = c`, with `sup w = inf w` and `Dw = 0`.
- Two planes over `B_R ⊂ ℝ²`, `u₁ = 0` and `u₂ = 1 + x₁/(2R)`: w is affine, so it solves the
  linear equation, whose coefficients are constant with `c = 0`. On `B_(R/2)` it takes its
  values in `[3/4, 5/4]`, with ratio `5/3`, and `|Dw| = 1/(2R) ≤ (2/(3R)) w`.
- Negative control for positivity: `w = x₁` solves the same equation and changes sign, and no
  inequality `sup w ≤ C inf w` holds.

*Needs:* 2.1, 2.2; PDE C14 with E23 (Harnack inequality), E22 and E25 (interior estimates, for
the gradient bound).

### 2.6 Multi-valued graphs

*Sources:* [CM4, §0, notation for multi-valued graphs].

In `ℝ³`, let `P = {(ρ,θ) : ρ > 0, θ ∈ ℝ}` be the universal cover of the punctured plane, with
covering map `(ρ,θ) ↦ (ρ cos θ, ρ sin θ)`. A graph over a domain `Ω ⊂ P` is the surface
`{(ρ cos θ, ρ sin θ, u(ρ,θ))}`; since the covering map is a local isometry, it is minimal
precisely when u solves the minimal-surface equation in the local coordinates
`(ρ cos θ, ρ sin θ)`. Its separation is `w(ρ,θ) = u(ρ,θ+2π) − u(ρ,θ)` wherever both terms are
defined. No later item of this sub-roadmap consumes 2.6; its consumer is the multi-valued graph
analysis of [CM4] and the one-sided curvature estimate.

**Checks.**

- The helicoid `(ρ cos θ, ρ sin θ, θ)` is the graph of `u = θ` over P. In the local coordinates
  `(x,y) = (ρ cos θ, ρ sin θ)`, `u_x = −y/ρ²`, `u_y = x/ρ²`, `u_xx = 2xy/ρ⁴`, `u_yy = −2xy/ρ⁴`
  and `u_xy = (y² − x²)/ρ⁴`, and the left-hand side of the minimal-surface equation of 2.1 is
  `(2x³y − 2xy³ + 2xy(y² − x²))/ρ⁸ = 0`. Its separation is `w ≡ 2π`.
- `u = cθ`, for a constant c, is the helicoid of pitch `2πc`, with `w ≡ 2πc`; as `c → 0` the
  sheets collapse onto the punctured plane.
- A function with `u(ρ,θ+2π) = u(ρ,θ)`, such as the half-catenoid `u = arccosh ρ` on `{ρ > 1}`,
  is a graph over a domain of the punctured plane and has `w ≡ 0`.
- Domain: for `Ω = {ρ > 0, 0 < θ < 3π}`, w is defined on `{0 < θ < π}` only.
- Where it is defined, w is a difference of two solutions, so it satisfies the linear equation
  of 2.5; on the helicoid `w = 2π` is constant, and that equation has `c = 0`.

*Needs:* 2.1, 2.5.

### Examples

- The hyperplane, the half-catenoid `u = arccosh ρ` and Scherk's graph of 2.1, with the
  negative controls `u = xy` and `u = x² + y²`.
- The half-catenoid has `|Du| = (ρ² − 1)^(−1/2)`, unbounded as `ρ → 1`: the estimates of 2.2
  hold on balls of `{ρ ≥ ρ₀}` for each `ρ₀ > 1`, with constants depending on the gradient bound
  `(ρ₀² − 1)^(−1/2)`, and on no neighbourhood of the waist circle.
- The helicoid as a multi-valued graph with separation `2π` (2.6).

### Dependencies

R5a's mean curvature of a graph and first variation of volume; R1's Euclidean limits of
rescaled metrics; PDE C14, E22, E23 and E25; Mathlib's implicit function theorem. No stability
and no curvature sign of the ambient manifold enters.

## Layer 3 (MS3): first consequences of minimality

### 3.1 Monotonicity

*Sources:* [CM, §1.3]; [White, Theorem 3]; [Chodosh, Theorem 9.3, Corollary 9.4].

Let `f : Σ → ℝ^m` be a proper minimal immersion of an n-manifold (`1 ≤ n < m`), and let
`B_R(p)` be an ambient ball disjoint from `f(∂Σ)`. For `0 < σ < ρ < R`, testing `div_Σ X^⊤ = n`
(`X(q) = f(q) − p`) with a radial cutoff gives

`Area(f⁻¹(B_ρ(p)))/(ω_n ρⁿ) − Area(f⁻¹(B_σ(p)))/(ω_n σⁿ)`
`= (1/ω_n) ∫_(f⁻¹(B_ρ(p) ∖ B_σ(p))) |(f(q)−p)^⊥|² / |f(q)−p|^(n+2) dμ(q)`,

where `ω_n` is the volume of the unit ball in `ℝⁿ` and `(f(q)−p)^⊥` is the component normal to
`df_q(T_qΣ)` in `ℝ^m`. In particular, `r ↦ Area(f⁻¹(B_r(p)))/(ω_n rⁿ)` is nondecreasing on
`(0,R)` and tends, as `r → 0`, to the number of points of `f⁻¹(p)`: area counts sheets with
multiplicity. Include the affine-plane-rigidity equality case [White, Theorem 4]: if
`f : Σ → ℝ^m` is a proper minimal immersion of a nonempty n-manifold without boundary
satisfying `lim_(R→∞) Area(f⁻¹(B_R(0)))/(ω_n Rⁿ) ≤ 1`, then translation invariance of the
asymptotic ratio and the small-ball limit `#f⁻¹(p₀) ≥ 1` at `p₀ ∈ f(Σ)` force the ratio at p₀
to be identically 1, hence `(f−p₀)^⊥ ≡ 0`, and f is an embedding onto an affine n-plane
through p₀. In a Riemannian m-manifold N, for p
in a compact subset `C ⊂ N` and R below a scale depending on the metric near C, there is
`a ≥ 0` depending on the sectional curvature bound near C such that
`r ↦ e^(ar) Area(f⁻¹(B_r(p)))/(ω_n rⁿ)` is nondecreasing for `0 < r < R` whenever `B_R(p)` is
disjoint from `f(∂Σ)`. [GeometricCurrents](../../GeometricCurrents/README.md) G6 develops
monotonicity for stationary varifolds; 3.1 is the smooth statement and uses no varifold.

**Checks.**

- An n-plane through p: `(f−p)^⊥ ≡ 0` and the ratio is 1 for every r.
- An n-plane at distance `d > 0` from p: the ratio is `(1 − d²/r²)^(n/2)` for `r > d` and 0 for
  `r ≤ d`, nondecreasing with limit `0 = #f⁻¹(p)` as `r → 0`. Here `|(f−p)^⊥| = d`, and with s
  the distance in the plane to the foot of p the remainder is
  `n ∫ s^(n−1) d² (d² + s²)^(−(n+2)/2) ds = [sⁿ (d² + s²)^(−n/2)]`, the difference of the two
  ratios.
- Two planes through p, as an immersion of their disjoint union: the ratio is 2, the number of
  points of `f⁻¹(p)`.
- The catenoid `𝒞`, with `p = 0`: `Area(𝒞 ∩ {|x₃| ≤ V}) = 2π(V + sinh V cosh V)` and
  `|x|² = cosh² x₃ + x₃²` on `𝒞`, so the ratio tends to 2 as `r → ∞`; the rigidity hypothesis
  fails, as it must.
- Negative control for minimality: on the unit sphere of `ℝ³` the cap `S² ∩ B_r(p)`, `p ∈ S²`,
  has area `πr²` for `r ≤ 2`, so the ratio is 1 on `(0,2]` although `(x−p)^⊥ ≠ 0`, and it
  decreases for `r > 2`.

*Needs:* R5a's first variation of volume, with the harmonicity of the coordinate functions
(MS1); R4.1's Hessian of the distance (MS1), for the Riemannian form.

### 3.2 Tangency principle

*Sources:* [CM, §1.7]; [Chodosh, Proposition 19.3, Corollary 19.6].

Let `Σ₁, Σ₂` be minimal hypersurfaces in a Riemannian `(n+1)`-manifold, p an interior point of
both with `T_pΣ₁ = T_pΣ₂`, and suppose that near p the hypersurface `Σ₂` lies on one side of
`Σ₁`: in coordinates in which both are graphs over the common tangent hyperplane, `u₁ ≤ u₂`.
Then `Σ₁` and `Σ₂` coincide near p; the difference `u₂ − u₁ ≥ 0` solves the linear equation of
2.5 and vanishes at an interior point. This interior statement is the strong one-sided maximum
principle for smooth minimal hypersurfaces of
[GeometricCurrents](../../GeometricCurrents/README.md) G6: one theorem, consumed here. Prove
the boundary version, the Hopf boundary point lemma: if `u₁ ≤ u₂` are minimal graphs in
coordinates over a connected domain in `ℝⁿ` with smooth boundary, smooth up to the boundary,
and `u₁ = u₂`, `Du₁ = Du₂` at a boundary point, then `u₁ = u₂`.

**Checks.**

- The catenoid `𝒞` and its tangent plane `{x₁ = 1}` at `(1,0,0)`: on `𝒞` near that point,
  `x₁ − 1 = ½(x₃² − x₂²) + O(x₂⁴ + x₃⁴)`, which changes sign. Neither surface lies on one side
  of the other, as the principle requires of two distinct minimal surfaces.
- Negative control for minimality: the unit sphere lies on one side of each of its tangent
  planes and coincides with none.
- Boundary form: on `{x₁ ≥ 0}`, `u₁ = 0` and `u₂ = x₁` are minimal graphs with `u₁ ≤ u₂` and
  `u₁ = u₂` at the boundary point 0, but `Du₁ ≠ Du₂` there and `u₁ ≠ u₂`. The condition on the
  gradients is needed.

*Needs:* 2.5; GeometricCurrents G6 (the interior principle); PDE C13 (the Hopf boundary point
lemma).

### 3.3 Convex hull property

*Sources:* [CM, §1.3]; [Chodosh, Corollaries 8.2–8.3].

The image of a compact minimal n-submanifold (`1 ≤ n < m`) in `ℝ^m` with boundary is contained
in the convex hull of the image of its boundary. In particular, there is no compact minimal
submanifold without boundary in `ℝ^m`. This follows from the harmonicity of the coordinate
functions (MS1) and the maximum principle applied to the linear functions `x ↦ ⟨x,a⟩`
(supporting hyperplanes).

**Checks.**

- The piece `𝒞 ∩ {|x₃| ≤ h}` of the catenoid: its boundary is two circles of radius `cosh h` at
  the heights `±h`, and `ρ = cosh x₃ ≤ cosh h` on it, so it lies in the solid cylinder
  `{ρ ≤ cosh h, |x₃| ≤ h}`, the convex hull of the two circles.
- On that piece the coordinate `x₃` is harmonic and attains its extreme values `±h` on the
  boundary.
- Negative control for minimality: a spherical cap larger than a hemisphere is not contained in
  the convex hull of its boundary circle, a flat disk.

*Needs:* the harmonicity of the coordinate functions (MS1, R5a);
`TauCeti.Manifold.laplaceBeltrami_nonpos_of_isLocalMax`.

### 3.4 Maximum principle in a small ball

*Sources:* [CM4, Appendix C, proof of Lemma C.1].

Let `B_R(p)` be a ball in a Riemannian m-manifold (`m ≥ 2`) with R below the injectivity radius
at p and, if the sectional curvature is bounded above by some `κ > 0`, also `R < π/(2√κ)`;
there is no additional curvature restriction when the bound is `≤ 0`, and the
injectivity-radius restriction remains. If a compact minimal n-submanifold (`1 ≤ n < m`) lies
in `B_R(p)`, then the distance to p, restricted to the submanifold, attains its maximum on the
boundary of the submanifold: on a minimal submanifold the Laplacian of `r²` is the trace of
`Hess(r²)` over the n-dimensional tangent space, because the mean-curvature vector vanishes,
and this trace is positive (MS1, R4.1). In particular such a ball contains no closed minimal
submanifold. This argument, applied to the squared distance from a point of a small ball,
controls the topology of a minimal surface inside the ball [CM4, Lemma C.1].

**Checks.**

- The unit sphere `S^m`, `κ = 1`: `Hess(r²) = 2 dr² + 2 r cot r (g − dr²)`, positive definite
  exactly for `r < π/2 = π/(2√κ)`.
- Sharpness of that radius: the equator of `S²`, a closed geodesic, lies in the ball of radius
  R about the pole for every `R > π/2` and for no `R ≤ π/2`.
- The injectivity radius is needed when the curvature is nonpositive: on the flat torus `ℝ²/ℤ²`
  a closed geodesic of length 1 through p lies in `B_R(p)` for every `R > ½`, and the
  injectivity radius is ½.
- In `ℝ^m` every ball qualifies, and the statement is the absence of closed minimal
  submanifolds of 3.3.

*Needs:* R4.1's Hessian of the squared distance (MS1); R5a's induced connection and
mean-curvature vector; `TauCeti.Manifold.laplaceBeltrami_nonpos_of_isLocalMax`.

### 3.5 Mean value inequality

*Sources:* [CM, §1.3, Theorem 1.12, §2.2].

Let `f : Σ → ℝ^m` be a proper minimal immersion of an n-manifold (`1 ≤ n < m`) and `p ∈ f(Σ)`
with `B_R(p)` disjoint from `f(∂Σ)`. If `u ≥ 0` is a smooth function on Σ satisfying `Δu ≥ −au`
for some `a ≥ 0`, then

`u(q) ≤ (C(n,aR²)/Rⁿ) ∫_(f⁻¹(B_R(p))) u dμ`

for every `q ∈ f⁻¹(p)`, where `C(n,aR²)` depends only on n and `aR²`, and only on n when u is
subharmonic (`a = 0`). This is used in the ε-regularity argument of 5.1, applied with
`u = |A|²`, for which Simons' inequality gives `Δ|A|² ≥ −2|A|⁴`, on a ball of radius
`R ∼ |A|(q₀)⁻¹` where `aR²` is bounded. In a Riemannian m-manifold, the same holds for R below
a scale depending on the metric near a compact set.

**Checks.**

- `u ≡ 1`, `a = 0`: the inequality reads `Rⁿ ≤ C(n) Area(f⁻¹(B_R(p)))`, which 3.1 gives with
  `C(n) = 1/ω_n`, with equality on a plane.
- A straight line (`n = 1`, `ω₁ = 2`) with `u = cos(√a x)` on `|x| < R`, `√a R ≤ π/2`: `u ≥ 0`,
  `Δu = −au`, `u(0) = 1` and `∫ u = 2 sin(√a R)/√a`, so `C(1,aR²) ≥ √a R/(2 sin(√a R))`. This
  is ½ in the limit `a = 0` and `π/4` at `aR² = π²/4`: the constant depends on `aR²`.
- On a plane the harmonic function `u = 1 + x₁/R` has `u(p) = 1` and mean value 1 over
  `B_R(p)`, `p = 0`: equality with `C(n) = 1/ω_n`.

*Needs:* 3.1; R5a's first variation of volume.

### 3.6 Consequences of Simons' identity

*Sources:* [Simons]; [CM, Lemma 2.1].

Consume the Simons identity and inequality of
[GeometricCurrents](../../GeometricCurrents/README.md) G6, translated by `Δ = −Δ⁺`: for a
minimal hypersurface in `ℝ^(n+1)`, `½Δ|A|² = |∇A|² − |A|⁴`. G6 owns them, and they are not
proved again here. From the identity prove, for a minimal hypersurface in `ℝ^(n+1)`, the
improved Kato inequality

`|∇A|² ≥ ((n+2)/n) |∇|A||²` where `A ≠ 0`.

Hence `Δ|A|² ≥ −2|A|⁴`, and `|A|Δ|A| − (2/n)|∇|A||² ≥ −|A|⁴` where `A ≠ 0`. For `n = 2` prove
the equalities `|∇A|² = 2|∇|A||²`, `Δs = |∇s|²/s − 2s²` (`s = |A|² > 0`) and
`Δ log|A| = −|A|²`.

*Ambient curvature terms.* For a minimal hypersurface of a Riemannian `(n+1)`-manifold N,
consume G6's Simons identity and inequality, whose ambient terms are bounded pointwise by
`C(n)(|Rm_N| |A|² + |∇Rm_N| |A|)`; 5.1 uses this inequality. For `n = 2` the Codazzi term of
R5a enters the Kato equality, and this form is owned here: for every `ε ∈ (0,1)` there is `C_ε`
such that, where `s = |A|² > 0`,

`Δs ≥ (1−ε)|∇s|²/s − 2s² − C(|Rm_N| s + |∇Rm_N| √s) − C_ε |Rm_N|²`

with a universal C.

**Checks.**

- Catenoid: in the coordinates `(v,θ)` the metric is `cosh² v (dv² + dθ²)`,
  `Δ = cosh⁻² v (∂_v² + ∂_θ²)` and `s = |A|² = 2/cosh⁴ v`. Then
  `Δ log|A| = cosh⁻² v (−2 log cosh v)″ = −2/cosh⁴ v = −|A|²`, and
  `Δs = (40 sinh² v − 8 cosh² v)/cosh⁸ v` equals `|∇s|²/s − 2s² = (32 sinh² v − 8)/cosh⁸ v`.
- Helicoid `(ρ cos t, ρ sin t, t)`: `|A|² = 2/(1+ρ²)²`, the metric is `dρ² + (1+ρ²) dt²`, and
  `Δ log|A| = (1+ρ²)^(−1/2) ((1+ρ²)^(1/2) (−2ρ/(1+ρ²)))′ = −2/(1+ρ²)² = −|A|²`.
- Negative control for minimality: on the round cylinder `S¹ × ℝ ⊂ ℝ³`, `|A|² = 1` and
  `∇A = 0`, so `½Δ|A|² = 0` while `|∇A|² − |A|⁴ = −1`.
- Ambient terms: on the Clifford torus of 6.5, `|A|² = 2` and `∇A = 0`, so
  `½Δ|A|² − |∇A|² + |A|⁴ = 4 = 2|A|²`, a contraction of `Rm_N` with `A ⊗ A` on the unit `S³`;
  the Euclidean identity would give `½Δ|A|² = −4`. On the equatorial sphere all terms vanish.

*Needs:* GeometricCurrents G6 (Simons' identity and inequality); R5a's Gauss and Codazzi
equations.

### Examples

- The plane, the plane at distance d and the catenoid of 3.1, with the unit sphere as the
  negative control for minimality.
- The catenoid and the helicoid satisfy `Δ log|A| = −|A|²` (3.6) and `K = −½|A|²` (1.1).
- The closed geodesics of the round sphere and of the flat torus of 3.4, which show that both
  restrictions on the radius are needed.

### Dependencies

R5a's first variation of volume and its Gauss and Codazzi equations; R4.1's Hessian of the
squared distance; Layer 2 for the graph equation and the difference of two sheets;
GeometricCurrents G6 for the interior tangency principle and for Simons' identity and
inequality; PDE C13 for the Hopf boundary point lemma; the pinned maximum principle at a local
maximum.

## Layer 4 (MS4): the half-space theorem

### 4.1 First-contact lemma and catenoid barriers

Establish a first-contact lemma ([Chodosh, proof of Theorem 20.1]): let `f : Σ → ℝ^(n+1)` be a
proper immersion of an n-manifold
without boundary, `S ⊂ ℝ^(n+1)` a properly embedded hypersurface with boundary, `e ∈ ℝ^(n+1)` a
vector transversal to S at its interior points, and `S_t = S + te` for `t ∈ [0,T]`. If
`S_T ∩ f(Σ) = ∅`, `S₀ ∩ f(Σ) ≠ ∅`, no `∂S_t` meets `f(Σ)`, and `⋃_t (S_t ∩ f(Σ))` is bounded,
then there is a largest `t₀` with `S_(t₀) ∩ f(Σ) ≠ ∅`, and at every point of `S_(t₀) ∩ f(Σ)`
each local sheet of the immersion is tangent to and lies on one side of `S_(t₀)`. If both
hypersurfaces are minimal, the tangency principle 3.2 applies. The same assertion holds with
boundary on Σ if no `S_t` meets `f(∂Σ)`. Include the global tangency principle
[Chodosh, Corollary 19.6]: if Σ is connected and without boundary, `f : Σ → N` is a minimal
immersion into a Riemannian `(n+1)`-manifold, `S ⊂ N` is a properly embedded minimal
hypersurface, possibly with boundary, with `f(Σ) ∩ ∂S = ∅`, and every point of `f⁻¹(S)` has a
neighbourhood whose image lies on one side of S, then `f⁻¹(S)` is empty or all of Σ. It is
closed, and it is open by 3.2, since one-sided contact forces equal tangent planes.
In `ℝ³`, let
`𝒞 = {x₁² + x₂² = cosh² x₃}` be the catenoid [CM, §1.2] [Chodosh, §14] and `ρ = √(x₁² + x₂²)`;
the halves of `λ𝒞` are the graphs `x₃ = ±λ arccosh(ρ/λ)` over `{ρ ≥ λ}`, and as `λ → 0` these
graphs converge to the punctured plane `{x₃ = 0} ∖ {0}`, smoothly on compact subsets.

**Checks.**

- First contact: Σ the unit sphere of `ℝ³`, `S = {x₃ = 0}`, `e = e₃`, `T = 2`. Then `S_t ∩ Σ`
  is nonempty exactly for `t ≤ 1`, so `t₀ = 1`, and `S₁` is tangent to Σ at the north pole,
  with Σ below it.
- Negative control for boundedness: the graph `x₃ = 1 − e^(−ρ²)` meets `S_t = {x₃ = t}` in the
  circle `ρ² = −log(1−t)` for `0 ≤ t < 1` and not at all for `t ≥ 1`. The union of these
  circles is unbounded and there is no last time of contact.
- Catenoid barriers: `λ arccosh(ρ/λ) ≤ λ log(2ρ/λ)` and the slope is `λ (ρ² − λ²)^(−1/2)`; both
  tend to 0 as `λ → 0`, uniformly on `{ρ₀ ≤ ρ ≤ ρ₁}` for `0 < ρ₀ < ρ₁`. At `ρ = 1`, `λ = 1/100`
  the height is `0.0530`.
- The lower half-catenoid `x₃ = t − λ arccosh(ρ/λ)` meets `{x₃ ≥ 0}` in the compact set
  `{λ ≤ ρ ≤ λ cosh(t/λ)}`.

*Needs:* 3.2, 2.5; R5a's catenoid (MS1).

### 4.2 Half-space theorem

*Sources:* [HM, Theorem 1]; [Chodosh, Theorem 20.1].

Let `f : Σ → ℝ³` be a proper minimal immersion, where Σ is a connected, nonempty surface
without boundary. If `f(Σ)` is contained in a closed half-space, then `f(Σ)` is a plane
parallel to the boundary of that half-space. Properness here is properness as a map into all of
`ℝ³`. After translating the half-space to `{x₃ ≥ 0}` with `inf_(f(Σ)) x₃ = 0`, if `f(Σ)` meets
`{x₃ = 0}` then the global tangency principle of 4.1 gives `f(Σ) ⊂ {x₃ = 0}`. By
properness the image is open and closed in the plane, so it is the plane.
Otherwise `f(Σ) ⊂ {x₃ > 0}`, and one translates a rescaled lower half-catenoid
`x₃ = t − λ arccosh(ρ/λ)` upwards from `{x₃ ≤ 0}`, keeping its waist circle in a small ball
around the origin disjoint from `f(Σ)`; it bends into `{x₃ < 0}` as `ρ → ∞`, so that its
intersection with `{x₃ ≥ 0}` is compact. Fix a small positive final height and then take λ
small enough that the final barrier meets the surface, using a point of the surface below that
height and the convergence to the punctured plane. Apply the first-contact lemma with the
parameter reversed. The global tangency principle of 4.1 then puts `f(Σ)` in the compact set
`{λ ≤ ρ ≤ λ cosh(t/λ)}` of the contact barrier. By properness Σ is then compact, which 3.3
excludes; the higher-dimensional catenoid in `ℝ^(n+1)`
for `n ≥ 3`, by contrast, lies in a slab [Chodosh, §14.2].

Lean name: `range_eq_plane_of_minimal_of_nonneg`.

**Checks.**

- A horizontal plane `{x₃ = c}`, `c ≥ 0`, satisfies the hypotheses and the conclusion.
- The catenoid and the helicoid lie in no half-space: on `𝒞`, `x₃` takes every real value and
  `x₁ = cosh x₃ cos θ` is unbounded above and below; the helicoid contains the `x₃`-axis and a
  horizontal line in every direction.
- Negative control for minimality: the paraboloid `x₃ = x₁² + x₂²` is properly embedded in
  `{x₃ ≥ 0}`.
- Negative control for properness: there is a complete minimal immersion into `ℝ³` whose image
  lies between two parallel planes [Chodosh, Theorem 20.2].

*Needs:* 4.1, 3.2, 3.3; the harmonicity of the coordinate functions (MS1);
`TauCeti.Manifold.laplaceBeltrami`, for the statement in `Suggested.lean`.

### Examples

- The unit sphere and the graph `x₃ = 1 − e^(−ρ²)` of 4.1: the first-contact lemma and its
  failure without boundedness.
- The plane, the catenoid, the helicoid and the paraboloid of 4.2.

### Dependencies

Layer 2 for the catenoid halves as minimal graphs and for the difference of two sheets; Layer 3
for the tangency principle; R5a's catenoid. No curvature estimate and no stability enters.

## Layer 5 (MS5): local compactness and ε-regularity

### 5.1 Small total curvature (ε-regularity)

*Sources:* [ChoiSchoen]; [CM, §2.2].

There are universal constants `ε, C₀ > 0` with the following property. Let Σ be a compact
minimal surface and `f : Σ → B̄_r(x) ⊂ ℝ³` with `f(∂Σ) ⊂ ∂B_r(x)` and `∫_Σ |A|² ≤ ε`. Then

`σ² |A|²(q) ≤ C₀ ∫_Σ |A|²` for `0 < σ ≤ r` and `q ∈ Σ` with `f(q) ∈ B_(r−σ)(x)`.

The same holds for a minimal immersion of a surface without boundary that is proper into the
open ball `B_r(x)`: apply it to `f⁻¹(B̄_(r′)(x))` for regular values `r′ ↑ r` of `|f − x|`. Lean
name: `exists_sq_mul_hessianCoordNormSq_le_lintegral`, for this form in `ℝ³`.

In a Riemannian three-manifold N, for x in a compact subset `C ⊂ N` and `0 < r ≤ r₀` with
`r₀, ε, C₀ > 0` depending on the metric near C, the same hypotheses give
`σ² |A|²(q) ≤ C₀(∫_Σ |A|² + r²)`; in particular `σ² |A|²(q) ≤ 1` after decreasing ε and `r₀` so
that `C₀(ε + r₀²) ≤ 1`. No stability is assumed. The proof uses Simons' inequality (G6, as
consumed in 3.6) and
the mean value inequality on minimal surfaces (3.5), which is proved like monotonicity (3.1).

**Checks.**

- Scaling: under `x ↦ λx` both `σ² |A|²(q)` and `∫_Σ |A|²` are unchanged for a surface, since
  `|A|²` scales by `λ⁻²` and the area by `λ²`. The Riemannian term `r²` is not invariant, and
  `C₀` there depends on the metric.
- A plane: both sides vanish.
- The smallness is needed: on the catenoid `∫_𝒞 |A|² = ∫ 2 cosh⁻⁴ v · cosh² v dv dθ = 8π`, so
  `λ𝒞 ∩ B̄₁(0)` has total curvature below `8π` for every λ, while at a point q of the waist
  circle, where `|f(q)| = λ`, `σ² |A|²(q) = 2σ²/λ²` is unbounded as `λ → 0` for `σ = ½`. Hence
  `ε < 8π`.

*Needs:* 3.5, 3.6, 3.1; GeometricCurrents G6 (Simons' inequality); R1's Euclidean limits of
rescaled metrics (MS1), for the Riemannian form; DifferentialGeometry 10.2.

### 5.2 Compactness with bounded area and curvature

*Sources:* [Chodosh, Theorem 28.5]; [White, Theorem 22]; [CM, Lemma 2.4].

Let U be an open subset of a Riemannian `(n+1)`-manifold and `Σ_i ⊂ U` properly embedded
minimal hypersurfaces without boundary such that, for every compact `K ⊂ U`, `Area(Σ_i ∩ K)`
and `sup_(Σ_i ∩ K) |A|` are bounded independently of i. Then a subsequence converges, smoothly
on compact subsets of U and with finite multiplicity, to a properly embedded minimal
hypersurface `Σ ⊂ U`, possibly disconnected or empty. Convergence means that every point of Σ
has a neighbourhood V in which, for i large, `Σ_i ∩ V` is a union of m graphs over `Σ ∩ V`
converging smoothly to `Σ ∩ V`, and that `Σ_i ∩ K = ∅` for i large whenever `K ⊂ U ∖ Σ` is
compact. The limit is embedded because of the tangency principle 3.2. If points `p_i ∈ Σ_i`
converge to a point of U, then Σ is not empty and contains that point, by monotonicity (3.1)
[Chodosh, Corollary 9.5]. Include the varying-metric exhaustion version needed for ambient
blow-ups: given open sets `U_i ↑ U`, smooth metrics `g_i` on `U_i` converging in `C^∞_loc(U)`
to a smooth metric g on U, and properly embedded `g_i`-minimal hypersurfaces `Σ_i ⊂ U_i`
without boundary in `U_i` whose `g_i`-areas and `|A_(g_i)|`-suprema are uniformly bounded on
every compact `K ⊂ U`, a subsequence converges in the same sense to a properly embedded
g-minimal hypersurface `Σ ⊂ U`, using the uniform `C^m` metric control of MS2 and a diagonal
argument.

**Checks.**

- The planes `{x₃ = 1/i}` converge to `{x₃ = 0}` with multiplicity 1, the unions
  `{x₃ = 1/i} ∪ {x₃ = −1/i}` with multiplicity 2, and the planes `{x₃ = i}` to the empty set.
- Blow-downs of the catenoid in `U = ℝ³ ∖ {0}`: on `λ𝒞`, `|A| = √2 λ/ρ²`, which tends to 0
  uniformly on the compact subsets of U as `λ → 0`, and the surfaces converge to the punctured
  plane `{x₃ = 0} ∖ {0}` with multiplicity 2 [Chodosh, §28].
- Negative control for the curvature bound: in `U = ℝ³` the same sequence has `|A| = √2/λ` on
  the waist circle, and it does not converge smoothly near the origin.

*Needs:* 2.4, 2.2, 2.5; 3.1; 3.2; R1's Euclidean limits of rescaled metrics (MS1);
`BoundedContinuousFunction.arzela_ascoli`.

### 5.3 Compactness for immersed minimal surfaces with bounded curvature

*Sources:* [White, Theorem 22].

Let U be an open subset of a Riemannian `(n+1)`-manifold and let `f_i : Σ_i → U` be a sequence
of properly immersed minimal hypersurfaces without boundary such that, for every compact
`K ⊂ U`, `Area(f_i⁻¹(K))` and `sup_(f_i⁻¹(K)) |A|` are bounded independently of i. Then a
subsequence converges, smoothly on compact subsets of U and with finite multiplicity, to a
properly immersed minimal hypersurface `f : Σ → U`: every point `q ∈ Σ` has a neighbourhood in
which `f_i` factors through m smooth sheets converging to f, and `f_i⁻¹(K)` is empty for i
large whenever `K ⊂ U ∖ f(Σ)` is compact. The proof is the same as in the embedded case (graph
convergence from local curvature bounds by MS2), without the tangency-principle step; the limit
need not be embedded. This theorem is used in the blow-up arguments of 5.5 and of MS9 (for
example in the proof of Allard regularity and in the bounded-total-curvature compactness),
where the rescaled limit `Σ̃_∞` is a priori only an immersion, and embeddedness is recovered
afterwards from the affine-plane rigidity of 3.1 or the multiplicity-one regularity of 9.2.

**Checks.**

- Two transverse planes, as a constant sequence of immersions of two disjoint planes: the limit
  is the same immersion, which is not an embedding.
- The planes `{x₃ = 0}` and `{x₃ = x₁/i}`, as immersions of two disjoint planes: they cross
  along a line for every i, and they converge to `{x₃ = 0}` with `m = 2`.

*Needs:* 2.4, 2.2; 3.1; R1's Euclidean limits of rescaled metrics (MS1);
`BoundedContinuousFunction.arzela_ascoli`.

### 5.4 Point-picking lemma

*Sources:* [Chodosh, proof of Lemma 29.1 and of Theorem 5.5].

Let `(X,d)` be a metric space, `x₀ ∈ X`, `R₀ > 0`, S a compact subset of the closed ball
`B̄_(R₀)(x₀)`, and `f : S → [0,∞)` a continuous function; in applications,
`S = Σ ∩ B̄_(R₀)(x₀)` on a relatively compact ball and `f = |A|`. If `x ∈ S ∩ B_(R₀)(x₀)`
satisfies `(R₀ − d(x,x₀)) f(x) = M > 0`, then `q ↦ (R₀ − d(q,x₀)) f(q)` attains its maximum
`M_* ≥ M` on S at an interior point `q_* ∈ S ∩ B_(R₀)(x₀)`; setting
`ρ_* = ½(R₀ − d(q_*,x₀)) > 0` gives `B_(ρ_*)(q_*) ⊂ B_(R₀)(x₀)`, `ρ_* f(q_*) = ½M_* ≥ ½M`, and
`sup_(S ∩ B_(ρ_*)(q_*)) f ≤ 2f(q_*)`. Rescaling normal coordinates around `q_*` by
`λ_* = f(q_*)` therefore produces a ball of radius `λ_* ρ_* ≥ M/2` on which the rescaled
quantity equals 1 at the origin and is bounded above by 2.

**Checks.**

- `X = ℝ`, `x₀ = 0`, `R₀ = 1`, `S = [−1,1]`, `f ≡ 1`, `x = 0`: `M = 1`, the weight `1 − |y|` is
  maximal at `q_* = 0`, `ρ_* = ½`, `ρ_* f(q_*) = ½ = M/2` and `f ≤ 2 f(q_*)`.
- The same X, `x₀`, `R₀` and S with `f(y) = |y|` and `x = ½`: `M = ¼`, the weight
  `(1 − |y|)|y|` is maximal at `q_* = ±½` with `M_* = ¼`, `ρ_* = ¼` and `ρ_* f(q_*) = ⅛ = M/2`,
  and on `B_(¼)(½)` the supremum of f is `¾ ≤ 1 = 2 f(q_*)`. The factor 2 cannot be replaced by
  1.
- Negative control for the interior hypothesis: for `x = 1` in the first example `M = 0`, and
  no rescaling is produced; `M > 0` forces `d(x,x₀) < R₀`.

*Needs:* `IsCompact.exists_isMaxOn`.

### 5.5 Smooth version of Allard regularity

*Sources:* [Chodosh, Theorem 30.1]; [WhiteReg].

Establish the smooth minimal-hypersurface version of Allard regularity, valid in all dimensions
`n ≥ 2`, without varifold theory: there exist `ε₀(n), C(n) > 0` and `σ(n) ∈ (0,1)` such that if
`Σ ⊂ B_R(x) ⊂ ℝ^(n+1)` is a properly embedded minimal hypersurface without boundary in `B_R(x)`
satisfying `Area(Σ ∩ B_R(x))/(ω_n Rⁿ) ≤ 1 + ε₀`, then `sup_(Σ ∩ B_(σR)(x)) |A| ≤ C(n)/R`.
Include the Riemannian small-ball version: for x in a compact subset `C ⊂ N` and `0 < R ≤ r₀`,
with `r₀, ε₀, C, σ` depending on the metric near C, the same area-ratio bound gives
`sup_(Σ ∩ B_(σR)(x)) |A| ≤ C/R`. Prove first the centre estimate `|A|(x) ≤ C′/R` for `x ∈ Σ`,
under an area-ratio bound `1 + ε_c` on `B_R(x)`, by contradiction: if `Σ_j` has area ratio
`≤ 1 + 1/j` on `B_(R_j)(x_j)` and `R_j |A_(Σ_j)|(x_j) > j²`, the point-picking lemma 5.4 on the
shrinking ball `B_(R_j/j)(x_j)` and rescaling around the maximizer `q_j`, by the ambient
blow-up of MS1 and the varying-metric compactness of 5.2, produce a complete properly embedded
minimal hypersurface `Σ̃_∞ ⊂ ℝ^(n+1)` through 0 with bounded curvature (`|A| ≤ 2`);
monotonicity from `q_j` up to radius `(1 − 1/j)R_j` transfers asymptotic area ratio `≤ 1` to
`Σ̃_∞`, forcing multiplicity-one convergence, so `|A_(Σ̃_∞)|(0) = 1`, while affine-plane
rigidity (3.1) forces `Σ̃_∞` to be flat, a contradiction. Choosing `ε₀` and σ small so that
`(1+ε₀)/(1−σ)ⁿ ≤ 1 + ε_c` then gives the bound on `B_(σR)(x)` by applying the centre estimate
on `B_((1−σ)R)(y)` for `y ∈ Σ ∩ B_(σR)(x)`.

**Checks.**

- A hyperplane through x: the area ratio is 1 and `A = 0`.
- The bound `1 + ε₀` cannot be replaced by 2: by 3.1 the catenoids `λ𝒞` have area ratio at most
  2 in every ball `B_R(0)`, and `|A| = √2/λ` on the waist circle, which lies in `B_(σR)(0)` for
  `λ < σR`.
- Two parallel hyperplanes at distance `2δ`, in the ball `B_R(x)` centred at the midpoint x:
  `A = 0` and the area ratio is `2(1 − δ²/R²)^(n/2)`, above `1 + ε₀` for small δ. The
  hypothesis selects one sheet.

*Needs:* 5.4, 5.2, 5.3; 3.1, with its affine-plane rigidity; R1's Euclidean limits of rescaled
metrics (MS1).

### Examples

- The catenoids `λ𝒞`, `λ → 0`: total curvature `8π`, curvature `√2/λ` on the waist circle, area
  ratio tending to 2, and convergence to the punctured plane with multiplicity 2 away from the
  origin. They show that the smallness in 5.1, the curvature bound in 5.2 and the ratio
  `1 + ε₀` in 5.5 are needed.
- Sequences of parallel planes: with multiplicity one, with multiplicity two and with empty
  limit.

### Dependencies

Layer 2 for graphical neighbourhoods, interior estimates and the difference of two sheets;
Layer 3 for monotonicity with its rigidity case, the tangency principle, the mean value
inequality; GeometricCurrents G6 for Simons' inequality; R1's Euclidean limits of rescaled
metrics; DifferentialGeometry 10.2; Mathlib's Arzelà–Ascoli theorem and extreme value theorem.
No stability is assumed.

## Layer 6 (MS6): Morse index and stability of minimal submanifolds

For a minimal immersion `f : Σ → N` of an n-manifold (`1 ≤ n < m`) into a Riemannian m-manifold
`(N,g)`, with pullback normal bundle `ν_f`, normal connection `∇^⊥` and normal-bundle-valued
second fundamental form II, the second variation of n-dimensional volume along normal fields
(MS1) is the index form

`Q(V) = ∫_Σ (|∇^⊥V|² − Σ_(i=1)^n Rm_N(V,e_i,e_i,V) − Σ_(i,j=1)^n ⟨II(e_i,e_j),V⟩²) dμ`
`= −∫_Σ ⟨V, J^⊥V⟩ dμ`,

where `{e_i}` is a local orthonormal frame of `TΣ` and `J^⊥ = Δ^⊥ + ℛ + 𝒜` is the normal-bundle
Jacobi operator, with `Δ^⊥ = tr_Σ (∇^⊥)²`, `⟨ℛ(V),W⟩ = Σ_(i=1)^n Rm_N(V,e_i,e_i,W)` and
`⟨𝒜(V),W⟩ = Σ_(i,j=1)^n ⟨II(e_i,e_j),V⟩⟨II(e_i,e_j),W⟩` [Simons] [CM, §1.8]. This Q is the
diagonal of R5b's polarized form.

*Needs:* R5b's second variation of volume and normal Jacobi operator; R5a's normal bundle and
normal connection.

### 6.1 Morse index on compact minimal submanifolds and negative eigenvalues of `−J^⊥`

*Sources:* [Simons]; [CM, §1.8]; [Chodosh, §24].

Let Σ be compact: when Σ is closed (`∂Σ = ∅`), take `Γ(ν_f) = C^∞(Σ;ν_f)` as the space of
admissible normal sections; when Σ has nonempty smooth boundary `∂Σ`, impose homogeneous
Dirichlet boundary conditions, taking `Γ₀(ν_f) = {V ∈ C^∞(Σ;ν_f) : V|_∂Σ = 0}`. Define the
Morse index `index(Σ)` as the supremum of `dim E` over linear subspaces E of admissible
sections on which Q is negative definite (`Q(V) < 0` for all `V ∈ E ∖ {0}`). In the Dirichlet
case, density of `C^∞_c(Σ ∖ ∂Σ;ν_f)` in `W^(1,2)₀(Σ;ν_f)` and continuity of Q in `W^(1,2)` give
the same supremum over subspaces of `C^∞_c(Σ ∖ ∂Σ;ν_f)`, of `Γ₀(ν_f)` and of `W^(1,2)₀(Σ;ν_f)`;
in particular `index(Σ) = 0` if and only if Σ is stable. By the bundle Schrödinger spectral
theory of R5b and R5c (MS1) applied to `L = −J^⊥ = −Δ^⊥ − ℛ − 𝒜` on `(ν_f,∇^⊥)`, closed or with
Dirichlet boundary condition `V|_∂Σ = 0`, the operator `−J^⊥` has a discrete real spectrum
`μ₁ ≤ μ₂ ≤ ⋯ → +∞` with finite-dimensional smooth eigenspaces forming an `L²`-orthonormal
basis, and `index(Σ)` is finite and equals the number of strictly negative eigenvalues
`μ_k < 0` counted with multiplicity, attained on the span of their smooth eigensections, while
the nullity `null(Σ) = dim ker(−J^⊥)` is the multiplicity of 0.

**Checks.**

- The equatorial sphere `S²_eq ⊂ S³` of 6.5: `−J = −Δ − 2` has the eigenvalues `j(j+1) − 2`,
  that is `−2` once, 0 three times, then 4, so `index = 1` and `null = 3`.
- Definite, not semidefinite: on `S²_eq`, `Q(a + b x₁) = −8π a²`, so Q is negative semidefinite
  and not definite on the span of 1 and `x₁`. Counting semidefinite subspaces would give
  `1 + 3 = 4`.
- Dirichlet index: on the closed hemisphere `{x₃ ≥ 0}` of `S²_eq` the function `x₃` is positive
  inside, vanishes on the boundary and satisfies `−Δx₃ = 2x₃`, so `μ₁(−J) = 0`: the index is 0
  and the nullity 1. A geodesic disk of `S²_eq` of radius `r < π/2` has index 0 and nullity 0,
  and one of radius `r > π/2` has index at least 1, by strict domain monotonicity (R5c).
- A compact domain of an affine n-plane of `ℝ^m`: `Q(V) = ∫ |∇^⊥V|² dμ`, which vanishes on
  `Γ₀(ν_f)` only for `V = 0`, so the index and the nullity are 0.

*Needs:* R5b (the index form and the Dirichlet realization of `−J^⊥`); R5c (the closed case,
the index on smooth sections and the smoothness of eigensections).

### 6.2 Morse index of minimal submanifolds in `ℝ^m` via exhaustions

*Sources:* [FCS]; [CM, §1.8].

Let `f : Σ → ℝ^m` (`1 ≤ n < m`) be a minimal immersion of an n-manifold without boundary, where
`ℛ = 0`, so `Q(V) = ∫_Σ (|∇^⊥V|² − Σ_(i,j=1)^n ⟨II(e_i,e_j),V⟩²) dμ` and `J^⊥ = Δ^⊥ + 𝒜`;
include the same construction on the interior `Σ ∖ ∂Σ` of a general minimal immersion into a
Riemannian m-manifold N. Given an exhaustion `Ω₁ ⋐ Ω₂ ⋐ ⋯` of Σ (or of `Σ ∖ ∂Σ`) by compact
domains with smooth boundary (`Ω_k` contained in the interior of `Ω_(k+1)`,
`⋃_k Ω_k = Σ ∖ ∂Σ`), extending compactly supported interior sections by zero shows that the
Dirichlet indices satisfy `index(Ω₁) ≤ index(Ω₂) ≤ ⋯`; define

`index(Σ) = lim_(k→∞) index(Ω_k) ∈ ℕ ∪ {∞}`.

Prove that `index(Σ)` is independent of the choice of smooth exhaustion and equals the supremum
of `dim E` over finite-dimensional subspaces `E ⊂ C^∞_c(Σ ∖ ∂Σ;ν_f)` on which Q is negative
definite, agreeing with the compact definition 6.1 when Σ is closed or compact with smooth
boundary. In particular, `index(Σ) = 0` if and only if Σ is stable; so affine n-planes in `ℝ^m`
have index 0, since `II = 0` gives `Q(V) = ∫_Σ |∇^⊥V|² dμ ≥ 0`.

**Checks.**

- An affine n-plane: every `Ω_k` has index 0, so `index = 0`.
- The catenoid `𝒞`: its Gauss map ν is a conformal diffeomorphism onto the sphere minus two
  points, with `ν^* g_(S²) = sech² v (dv² + dθ²) = ½|A|² g`. By S5,
  `Q(φ) = ∫_(S²) (|∇φ̃|² − 2φ̃²)` for `φ = φ̃ ∘ ν` with compact support, so the index of `𝒞` is
  the index of `−Δ − 2` on the compactly supported functions of the twice punctured sphere.
  This is 1: at most 1 by 6.1 on `S²`, and at least 1 since the logarithmic cutoffs of S6 at
  the two punctures have `Q < 0`.
- Monotonicity along an exhaustion: on `𝒞`, where `x₃ = v`, the function `h = 1 − v tanh v`
  satisfies `Jh = cosh⁻² v h″ + 2 cosh⁻⁴ v h = 0`, is positive for `|v| < v₀` and vanishes at
  `|v| = v₀`, where `v₀ tanh v₀ = 1`. So `μ₁(−J) = 0` on the slab `{|x₃| ≤ v₀}`, a positive
  Dirichlet eigenfunction belonging to the lowest eigenvalue (R5c). By strict domain
  monotonicity (R5c) the slab `{|x₃| ≤ V}` has index 0 for `V ≤ v₀`, and for `V > v₀` index at
  least 1, hence 1 by the previous Check.

*Needs:* 6.1; R5b; R5c (the Dirichlet index on each `Ω_k`).

### 6.3 Specialization to hypersurfaces and two-sided hypersurfaces

*Sources:* [FCS]; [CM, §1.8]; [Chodosh, §§24, 33].

For any minimal hypersurface (`m = n+1`, possibly one-sided), `ν_f` is a real line bundle on
which any local unit normal `±ν` is `∇^⊥`-parallel, and `|A|² + Ric_N(ν,ν)` is a well-defined
smooth scalar function on Σ independent of the sign of ν, giving

`Q(V) = ∫_Σ (|∇^⊥V|² − (|A|² + Ric_N(ν,ν))|V|²) dμ`,
`J^⊥V = Δ^⊥V + (|A|² + Ric_N(ν,ν))V`.

When Σ is one-sided, let `π : Σ̃ → Σ` be its two-sided normal orientation double cover with
deck involution τ and tautological unit normal ν̃ (`τ^*ν̃ = −ν̃`): pulling back sections by
`π^*V = φ̃ ν̃` identifies `Γ(ν_f)` (and `Γ₀(ν_f)`) with the deck-odd scalar functions
`φ̃ ∘ τ = −φ̃` on Σ̃, with `Q_Σ(V) = ½Q_(Σ̃)(φ̃)`. So on compact Σ, closed or Dirichlet,
`index(Σ)` equals the number of strictly negative eigenvalues, with multiplicity, of the scalar
Schrödinger operator `−J̃ = −Δ_(Σ̃) − (|A|² + Ric_N(ν̃,ν̃))` on Σ̃ within the τ-odd subspace,
by the scalar Schrödinger spectral theory of R5b and R5c on Σ̃, since τ commutes with `−J̃`.

When Σ is two-sided with global unit normal ν, setting `V = φν` (`φ ∈ C^∞(Σ)`) reduces Q and
`J^⊥` to the scalar quadratic form `Q(φ)` and scalar Jacobi operator
`J = Δ + |A|² + Ric_N(ν,ν)` of MS7. On compact Σ, closed or with smooth boundary under the
Dirichlet condition `φ|_∂Σ = 0`, applying R5c's scalar spectral theorem to
`L = −J = −Δ − (|A|² + Ric_N(ν,ν))` identifies `index(Σ)` with the number of strictly negative
eigenvalues `μ_k(−J) < 0` counted with multiplicity: in particular `index(Σ) = 0` if and only
if `μ₁(−J) ≥ 0` (stability), and when Σ is connected, simplicity of `μ₁(−J)` gives
`index(Σ) = 1` if and only if `μ₁(−J) < 0 ≤ μ₂(−J)`. On a closed `(n+1)`-manifold with
`Ric_g > 0`, 6.4 gives `μ₁(−J) < 0`, so every closed two-sided minimal hypersurface has
`index(Σ) ≥ 1`. On a noncompact two-sided minimal hypersurface in `ℝ^(n+1)` (`−J = −Δ − |A|²`),
or in `N^(n+1)`, exhausted by `Ω₁ ⋐ Ω₂ ⋐ ⋯`, `index(Σ) = lim_(k→∞) #{j : μ_j(−J,Ω_k) < 0}`.

**Checks.**

- Two-sided: `S²_eq ⊂ S³` has `μ₁(−J) = −2 < 0 = μ₂(−J)`, so `index = 1`.
- One-sided: `ℝP² ⊂ ℝP³` has the double cover `S²_eq`, and the τ-odd eigenfunctions of `−Δ − 2`
  are the spherical harmonics of odd degree j, with eigenvalues `j(j+1) − 2 ≥ 0`, so
  `index = 0`. The constant function, with eigenvalue `−2`, is τ-even and is not a section of
  the normal bundle.
- The factor ½: π is a local isometry with fibres of two points, so `Q_(Σ̃)(φ̃) = 2 Q_Σ(V)` for
  `π^*V = φ̃ ν̃`.

*Needs:* 6.1, 6.2; R5b (the scalar form on two-sided hypersurfaces and the double-cover
description of one-sided ones); R5c.

### 6.4 Nonexistence of closed stable minimal hypersurfaces under `Ric > 0`

*Sources:* [SY]; [Chodosh, Corollary 24.1].

Let `(M^(n+1),g)` be a closed Riemannian `(n+1)`-manifold (`n ≥ 2`) with `Ric_g > 0`, and let Σ
be a closed two-sided minimal hypersurface in M. The constant test function `φ = 1` is
admissible in the stability inequality: `Q(1) = −∫_Σ (|A|² + Ric_g(ν,ν)) dμ < 0`, since
`|A|² ≥ 0` and `Ric_g(ν,ν) > 0`. Therefore Σ is not stable. On a closed manifold with
`Ric_g > 0`, `b₁(M) = 0` by R7.6, so every connected closed embedded two-sided hypersurface
separates M, by R7.9.

**Checks.**

- `S²_eq ⊂ S³`: `Q(1) = −∫ (0 + 2) dμ = −8π`.
- The Clifford torus: `Q(1) = −∫ (2 + 2) dμ = −8π²`.
- Negative control for `Ric > 0`: a totally geodesic `T² × {t}` in a flat `T³` has
  `Q(φ) = ∫ |∇φ|² dμ ≥ 0` and is stable.
- Negative control for two-sidedness: `ℝP² ⊂ ℝP³` is stable (6.5); the constant 1 is not a
  section of its normal bundle.

*Needs:* 6.3; R7.6 and R7.9, for the separation statement.

### 6.5 Examples in `S³` and `ℝP³`: equatorial sphere, projective plane, Clifford torus

*Sources:* [Simons, §5].

Equip the unit three-sphere `S³ ⊂ ℝ⁴` with its round metric (`Ric_(S³) = 2g`). The equatorial
sphere `S²_eq = S³ ∩ {x₄ = 0}`, and more generally `Sⁿ_eq = S^(n+1) ∩ {x_(n+2) = 0} ⊂ S^(n+1)`,
is fixed by the ambient isometric reflection `x₄ ↦ −x₄`, with parallel unit normal `ν = e₄` in
`S³`, so it is totally geodesic: `A ≡ 0`, hence minimal, with the unit round metric, area `4π`
and genus 0. Here `−J = −Δ_(S²) − 2` (`−Δ_(Sⁿ) − n` on `Sⁿ_eq`): the constant 1 gives
`μ₁(−J) = −2 < 0` (`−n`), while integrating the Bochner formula of MS1 on the unit `Sⁿ` with
`|∇²φ|² ≥ (1/n)(Δφ)²` and `Ric_(Sⁿ) = (n−1)g` gives Lichnerowicz's bound `λ₁(−Δ_(Sⁿ)) ≥ n`, and
R8.2 of the parent identifies the full spherical-harmonic spectrum `λ_d = d(d+n−1)`. So
`μ_k(−J) ≥ 0` for `k ≥ 2` and `index(S²_eq) = 1`; more generally `index(Sⁿ_eq) = 1`, with
nullity `n+1` spanned by `x₁,…,x_(n+1)`, that is nullity 3 on `S²_eq`.

Passing to the antipodal quotient `ℝP³ = S³/{±1}` with the induced round metric
(`Ric_(ℝP³) = 2g > 0`; `ℝP³` is orientable since `x ↦ −x` preserves orientation on `S³`, and
more generally on `S^(n+1)` when n is even), the image `ℝP² = S²_eq/{±1} ⊂ ℝP³`, and more
generally `ℝPⁿ ⊂ ℝP^(n+1)`, is a closed connected embedded totally geodesic minimal
hypersurface (`A ≡ 0`, area `2π` for `n = 2`). Because the antipodal map `τ(x) = −x` preserves
`Sⁿ_eq` and reverses its unit normal `ν̃ = e_(n+2)` (`dτ(ν̃) = −ν̃`), `ℝPⁿ ⊂ ℝP^(n+1)` is
one-sided, with two-sided normal double cover `Sⁿ_eq → ℝPⁿ`: if a global unit normal existed,
its pullback would be a nonvanishing τ-odd function on the connected `Sⁿ_eq`. Every τ-odd
function φ̃ on `Sⁿ_eq` has `∫_(Sⁿ_eq) φ̃ dμ = 0` since τ is an isometry, so the Rayleigh
characterization of `λ₁(−Δ_(Sⁿ))` (R5c) and Lichnerowicz's bound give

`Q_(ℝPⁿ)(V) = ½ ∫_(Sⁿ_eq) (|∇φ̃|² − n φ̃²) dμ ≥ 0`.

Thus `ℝPⁿ ⊂ ℝP^(n+1)` is stable, with `index(ℝPⁿ) = 0` and nullity `n+1` (nullity 3 on `ℝP²`),
spanned by the τ-odd coordinate functions `x₁,…,x_(n+1)`, since `λ_d > n` for `d ≥ 2`. In
particular `ℝP² ⊂ ℝP³` is a closed embedded one-sided stable minimal surface in a closed
orientable three-manifold with `Ric > 0`, showing both that ambient orientability does not
imply two-sidedness and that two-sidedness is essential in 6.4 (compare MS9 and MS12).

The Clifford torus
`𝕋² = S¹(1/√2) × S¹(1/√2) = {(x₁,x₂,x₃,x₄) ∈ ℝ⁴ : x₁² + x₂² = x₃² + x₄² = ½} ⊂ S³`,
parametrized on `(ℝ/2πℤ)²` by `F(θ,ψ) = (1/√2)(cos θ, sin θ, cos ψ, sin ψ)` with global unit
normal `ν(θ,ψ) = (1/√2)(cos θ, sin θ, −cos ψ, −sin ψ)` in `TS³`, has flat induced metric
`g_(𝕋²) = ½(dθ² + dψ²)` (`K ≡ 0`, area `2π²`, genus 1) and principal curvatures `−1` and `+1`
along the two circle factors, so its mean curvature vanishes (it is minimal) and `|A|² = 2`.
Since `|A|² + Ric_(S³)(ν,ν) = 4` and `Δ_(𝕋²) = 2(∂_θ² + ∂_ψ²)`, we have
`−J = −2(∂_θ² + ∂_ψ²) − 4`. By `L²`-completeness of the Fourier basis on `(ℝ/2πℤ)²`, the
eigenvalues of `−J` indexed by `(k,ℓ) ∈ ℤ²` are `2(k² + ℓ²) − 4`, which are strictly negative
solely at `(0,0)` (`μ = −4`, multiplicity 1, the constants) and at `(±1,0), (0,±1)` (`μ = −2`,
real multiplicity 4, spanned by `x₁, x₂, x₃, x₄`), giving `index(𝕋²) = 5`, and nullity 4 at
`(±1,±1)`, spanned by `x_i x_j` for `i ∈ {1,2}`, `j ∈ {3,4}`. The completeness of the Fourier
basis on the two-torus, from Mathlib's Fourier series on the circle, is part of this target.

*Needs:* 6.1, 6.3; R7.0 and R8.2 (the Bochner formula and the spherical-harmonic spectrum); R5c
(the Rayleigh characterization of `λ₁`); Mathlib's `fourierBasis`.

### Examples

- The equatorial sphere (index 1, nullity 3), the projective plane (index 0, nullity 3) and the
  Clifford torus (index 5, nullity 4) of 6.5.
- The catenoid: index 1, through its Gauss map and through the exhaustion by the slabs
  `𝒞 ∩ {|x₃| ≤ V}` (6.2).
- The hemisphere of `S²_eq`: Dirichlet index 0 and nullity 1 (6.1).

### Dependencies

R5b's second variation, normal Jacobi operator, Dirichlet realization, scalar form and
double-cover description; R5c's index on smooth sections, simplicity of the lowest eigenvalue,
strict domain monotonicity and Rayleigh characterization of `λ₁`; R7.0, R7.6, R7.9 and R8.2; S5
and S6 for the catenoid; Mathlib's Fourier series. Independent of Layers 2–5.

## Layer 7 (MS7): stability and the curvature estimate

For a two-sided minimal hypersurface in a Riemannian `(n+1)`-manifold N, set

`J = Δ + |A|² + Ric_N(ν,ν)`, `Q(φ) = ∫_Σ (|∇φ|² − (|A|² + Ric_N(ν,ν))φ²) dμ`.

Stability means `Q(φ) ≥ 0` for every smooth function φ compactly supported in the interior;
`Q(φ) = −∫_Σ φ Jφ dμ` is the second variation of area along `φν`. In 7.4 and 7.5 the letter Q
also denotes the function `q + cs` of [Lynch]; the two uses do not meet in one formula.

**Checks.**

- Sign: `S²_eq ⊂ S³` has `J = Δ + 2`, `J1 = 2` and `Q(1) = −∫ 1·J1 dμ = −8π`; R5b's operator is
  `L = Δ⁺ − 2 = −J`.
- A plane in `ℝ³`: `J = Δ` and `Q(φ) = ∫ |∇φ|² dμ ≥ 0`.
- Catenoid: in the coordinates of 3.6, `J = cosh⁻² v (∂_v² + ∂_θ²) + 2 cosh⁻⁴ v`, and the unit
  normal is `ν = (−cos θ, −sin θ, sinh v)/cosh v`. The functions `tanh v = ⟨ν,e₃⟩`,
  `cos θ/cosh v = −⟨ν,e₁⟩` and `1 − v tanh v = −⟨ν,x⟩` satisfy `Jh = 0`; for the first,
  `cosh⁻² v (−2 sech² v tanh v) + 2 sech⁴ v tanh v = 0`.
- Negative control for the sign of the potential: `(Δ − |A|²) tanh v = −4 sech⁴ v tanh v ≠ 0`.
- `Q(φ) = −∫ φ Jφ dμ` for φ with compact support in the interior, by Green's first identity
  `TauCeti.Manifold.integral_mul_laplaceBeltrami`.

*Needs:* R5b (the hypersurface Jacobi operator and the stability form); 6.3;
`TauCeti.Manifold.integral_mul_laplaceBeltrami`.

### 7.1 A positive solution implies stability

*Sources:* [CM, §1.8]; [White, Theorem 30]; [Chodosh, Proposition 33.4].

If `h > 0` and `Jh = 0` on a two-sided minimal hypersurface in a Riemannian `(n+1)`-manifold,
prove the identity

`Q(φ) = ∫_Σ h² |∇(φ/h)|² dμ`

for compactly supported test functions; or, setting `w = log h`, use
`Δw = −(|A|² + Ric_N(ν,ν)) − |∇w|²` and Cauchy–Schwarz as in [Chodosh, Proposition 33.4]. In
particular the hypersurface is stable.

**Checks.**

- A plane with `h = 1`: the identity is `Q(φ) = ∫ |∇φ|² dμ`.
- The half-catenoid `{v > 0}` with `h = tanh v > 0`: it is stable, in agreement with 7.3, the
  half-catenoid being a graph.
- Negative control for positivity: on the whole catenoid `tanh v` and `1 − v tanh v` solve
  `Jh = 0` and change sign, and the catenoid is not stable (6.2).

*Needs:* the definitions of this layer; `TauCeti.Manifold.integral_mul_laplaceBeltrami`.

### 7.2 Stability and positive solutions

*Sources:* [CM, Proposition 1.39]; [FCS].

On a connected, stable, two-sided minimal hypersurface, every relatively compact domain whose
closure is a proper subset of the interior admits a smooth positive solution of `Jh = 0`:
enclose its closure in nested connected smooth proper subdomains `D₁ ⊊ D₂`, use stability
(`μ₁(−J,D₂) ≥ 0`) and strict domain monotonicity for the Schrödinger operator `L = −J` (R5c) to
obtain `μ₁(−J,D₁) > 0`, and solve `(−J)h = 0` on `D₁` with boundary value 1. On a connected
noncompact two-sided minimal hypersurface without boundary, exhaustion and interior Harnack
compactness give the equivalence between stability and a global positive solution of `Jh = 0`.
For a closed connected hypersurface, stability gives `μ₁(−J) ≥ 0`; by simplicity and positivity
of the principal eigenfunction (R5c), a positive solution of `Jh = 0` on the whole hypersurface
exists if and only if `μ₁(−J) = 0`.

**Checks.**

- Closed case: `S²_eq ⊂ S³` has `μ₁(−J) = −2 ≠ 0` and no positive Jacobi function; a totally
  geodesic `T² × {t}` in a flat `T³` has `J = Δ`, `μ₁(−J) = 0` and `h = 1`.
- Noncompact case: a plane, with `h = 1`.
- Domains: on the slab `𝒞 ∩ {|x₃| ≤ V}` of the catenoid with `V tanh V < 1` the function
  `1 − v tanh v` is a positive solution; for `V tanh V > 1` the slab is unstable (6.2) and
  admits none, by 7.1.

*Needs:* 7.1; R5c (strict domain monotonicity, the Dirichlet problem, simplicity and positivity
of the principal eigenfunction); PDE C14 with E23 (Harnack inequality) and E25 (interior
estimates), for the exhaustion.

### 7.3 Jacobi functions from translations; minimal graphs are stable

*Sources:* [CM, §1.8]; [Chodosh, Theorem 18.1].

For a minimal hypersurface in `ℝ^(n+1)` and a constant vector e, the function `⟨ν,e⟩` satisfies
`J⟨ν,e⟩ = 0`; more generally, `J⟨ν,X⟩ = 0` whenever X is a Killing vector field on N. For a
minimal graph in `ℝ^(n+1)` with upward unit normal, `h = ⟨ν,e_(n+1)⟩ > 0`, so the graph is
stable for variations compactly supported in its interior, by 7.1; by 6.2 its index is 0.

**Checks.**

- Catenoid: `⟨ν,e₃⟩ = tanh v` and `⟨ν,e₁⟩ = −cos θ/cosh v` satisfy `Jh = 0` (the Checks of this
  layer), and the rotation field `X = (−x₂, x₁, 0)` about the axis gives `⟨ν,X⟩ = 0`.
- A graph `x_(n+1) = u(x)` with upward normal: `⟨ν,e_(n+1)⟩ = (1 + |Du|²)^(−1/2) > 0`.
- The half-catenoid `{v > 0}` is the graph `x₃ = arccosh ρ`, with `⟨ν,e₃⟩ = tanh v > 0`.

*Needs:* 7.1; 6.2; R5b (the Jacobi operator as the linearization of the mean curvature).

### 7.4 Gradient estimate for positive Jacobi fields on minimal surfaces

*Sources:* [Lynch, Theorem 1.1, §4].

Let `Σ → ℝ³` be a minimally immersed surface, and let `u > 0` be a positive Jacobi field on an
open subset of `Σ ∖ ∂Σ`. Set `f = log u`, `q = |∇f|²`, `s = |A|²`. The key computation combines
the Bochner formula (MS1, applied to f, using `Δf = −s − q` from the Jacobi equation and
`Ric = −½ s g` from the Gauss equation on a minimal surface in `ℝ³`) with Simons' identity in
dimension two, `Δs = |∇s|²/s − 2s²` where `s > 0` (3.6). On a surface the Hessian term of the
Bochner formula is evaluated by the identity `2|∇²f|² = |∇q|²/q − 2⟨∇q,∇f⟩Δf/q + 2(Δf)²` where
`q > 0`, which is part of this target.

*Differential inequality* [Lynch, Proposition 4.1]. For `Q = q + cs` with `c > 0`, at every
point where `Q > 0`:

`ΔQ ≥ |∇Q|²/Q + 2q² + (3 − 1/c) q s + (1 − 2c) s²`.

A route: the Bochner formula gives `Δq = |∇q|²/q + 2s⟨∇f,Y⟩ + 2q² + 3qs + 2s²`, where
`Y = ∇log q − ∇log s`. One adds `c Δs` and writes the gradient terms as
`|∇Q|²/Q + (csq/Q)|Y|²`. The cross term `(csq/Q)|Y|² + 2s⟨∇f,Y⟩` is controlled by completing
the square, discarding a nonnegative term, and absorbing `−sQ/c` into the reaction terms. See
[Lynch, Proposition 4.1] for the treatment of the boundary cases `q = 0` or `s = 0`. Setting
`c = ⅓` gives `Q = q + ⅓s` and `ΔQ ≥ |∇Q|²/Q + (6/5)Q²`.

*Maximum principle* [Lynch, §4, Appendix B]. Fix `p ∈ Σ ∖ ∂Σ` and `R > 0` such that the closure
of `B_R^Σ(p)` is compact and contained in the domain of u. Set `r(x) = dist_g(p,x)` and
`φ = (R² − r²)²`, and choose a positive interior maximum `p̄ ∈ B_R^Σ(p)` of `φQ`. When
`p̄ ≠ p`, along a minimizing geodesic γ in `B_R^Σ(p)` from p to p̄, maximality
`φQ ≤ φ(p̄)Q(p̄)` gives `Q ≤ Q(p̄)`, hence `Ric = −½ s g ≥ −(3/2) Q(p̄) g` along γ. Replacing r
near p̄ by the smooth upper barrier `r̃ ≥ r` with `r̃(p̄) = r(p̄)` of R4.1 (MS1), the smooth
function `φ̃Q = (R² − r̃²)² Q ≤ φQ` still has a local maximum at p̄, with `|∇r̃(p̄)| = 1` and
`Δr̃(p̄) ≤ C(√Q(p̄) + 1/r(p̄))`; at `p̄ = p`, use the smooth squared distance directly.
Evaluating `∇(φ̃Q)(p̄) = 0` and `Δ(φ̃Q)(p̄) ≤ 0` with the differential inequality for Q gives

`−4ζ(1 + r̃ Δr̃) − 8r̃² + (6/5) φ(p̄) Q(p̄) ≤ 0` at p̄, where `ζ = R² − r̃²`:

the barrier Laplacian bound only produces lower-order terms, so Young's inequality and
rearranging give `R² Q(p) ≤ C` for a universal C, hence `R² (q + s)(p) ≤ 3C`. When Σ is
complete and `u > 0` on `Σ ∖ ∂Σ`, letting `R ↑ dist_g(p,∂Σ)` completes the proof.

*Riemannian adaptation.* [Lynch] treats hypersurfaces of `ℝ³` and `ℝ⁴` only; the following
adaptation is this roadmap's own argument. Let `Σ → N` be a minimally immersed surface in a
Riemannian three-manifold, let `u > 0` solve `Δu + (|A|² + Ric_N(ν,ν))u = 0` on an open subset
of `Σ ∖ ∂Σ`, and let p and R be as above, with `|Rm_N| ≤ Λ₀` and `|∇Rm_N| ≤ Λ₁` on the image of
`B_R^Σ(p)`. Then `Δf = −s − q − Ric_N(ν,ν)`. Choose `c ∈ (⅓, ½)`, for instance `c = ⅖`, so that
both `3 − 1/c > 0` and `1 − 2c > 0`. The Bochner formula and the Gauss equation
`Ric_Σ = (K_N(TΣ) − ½s) g` give, where `q > 0`, the Euclidean expression for `Δq` plus terms
bounded below by `−C(Λ₀ |∇q|/√q + Λ₀(q+s) + Λ₁ √q)`, the last one coming from
`−2⟨∇f, ∇(Ric_N(ν,ν))⟩`; the two-dimensional Kato form of 3.6 gives, where
`s > 0`, `Δs ≥ (1−ε₀)|∇s|²/s − 2s² − C(Λ₀ s + Λ₁ √s) − CΛ₀²`, and `Δs ≥ 0` where `s = 0`.
Splitting the gradient terms as `(1−ε₀)(|∇q|²/q + c|∇s|²/s) + ε₀(|∇q|²/q + c|∇s|²/s)` with
small `ε₀ > 0` still leaves a strictly positive quadratic term `c₀Q²` after completing the
square on the Y cross term, while the reserved `ε₀` fraction absorbs the first-order term
`Λ₀ |∇q|/√q` by Young's inequality. The remaining terms are absorbed by `Λ₀ Q ≤ δQ² + C_δ Λ₀²`
and `Λ₁ √Q ≤ δQ² + C_δ Λ₁^(4/3)`; the points where q or s vanishes are treated as in the
Euclidean case. This yields, where `Q > 0`,

`ΔQ ≥ (1−ε₀)|∇Q|²/Q + (c₀/2)Q² − C(Λ₀² + Λ₁^(4/3))`,

with `c₀ > 0` and C depending only on c and `ε₀`. Every term scales by `λ⁻⁴` under `g ↦ λ²g`,
for which `Q`, `Λ₀` and `Λ₁` scale by `λ⁻²`, `λ⁻²` and `λ⁻³`. Along a minimizing geodesic in
`B_R^Σ(p)` from p to p̄, the Gauss equation gives
`Ric_Σ = (K_N(TΣ) − ½s) g ≥ −(Λ₀ + Q(p̄)/(2c)) g`, so the upper barrier r̃ of R4.1 satisfies
`Δr̃(p̄) ≤ C(√Q(p̄) + √Λ₀ + 1/r(p̄))` and the maximum principle gives

`R² Q(p) ≤ C(1 + (Λ₀ + Λ₁^(2/3))R²)`,

both sides being invariant under `g ↦ λ²g`.

**Checks.**

- The constant: `2q² + (1 − ⅔)s² − (6/5)(q + ⅓s)² = (1/5)(2q − s)² ≥ 0`, with equality on
  `s = 2q`.
- A plane, where `J = Δ` and `s = 0`: letting `R → ∞` gives `q = 0`, the Liouville theorem for
  positive harmonic functions on `ℝ²`. On the strip `|x₂| < π/2` the function
  `u = e^(x₁) cos x₂` is positive and harmonic with `q = sec² x₂`, so `q(0) = 1`; the balls
  about 0 inside the strip have `R < π/2`, and the estimate requires `3C ≥ π²/4`.
- The half-catenoid `{v ≥ 0}` with `u = tanh v`: `q = 1/(sinh² v cosh⁴ v)`, `s = 2/cosh⁴ v` and
  `dist(·,∂Σ) = sinh v`, so `dist² (q + s) = (2 cosh² v − 1)/cosh⁴ v ≤ 1`, with limit 1 at the
  boundary.
- Riemannian form: under `g ↦ λ²g` the quantities `Q²`, `Λ₀²` and `Λ₁^(4/3)` scale by `λ⁻⁴`,
  and `R² Q`, `Λ₀ R²` and `Λ₁^(2/3) R²` are invariant. With `Λ₁²` and `Λ₁ R²` in their place
  the two sides of each estimate would scale differently.

*Needs:* R7.0 (the Bochner formula, `TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient`); 1.1
and R5a's Gauss equation; 3.6; R4.1's smooth upper distance barriers (MS1);
`TauCeti.Manifold.laplaceBeltrami_nonpos_of_isLocalMax`; HopfRinow Layers 0–4, for the
minimizing geodesic from p to p̄.

### 7.5 Curvature estimate for stable surfaces

*Sources:* [Schoen]; [White, Theorem 29].

Let `Σ → ℝ³` be a two-sided stable minimal immersion. Whenever the closure of `B_R^Σ(p)` is
compact and contained in the interior `Σ ∖ ∂Σ`, 7.2 ([CM, Proposition 1.39], [FCS]) gives a
positive Jacobi field `u > 0` on a relatively compact neighbourhood of that closure in the
interior, and the gradient estimate 7.4 yields `R² |A|²(p) ≤ 3R² Q(p) ≤ C` with a universal
constant C. In particular, `sup_(B_r^Σ(p)) |A|² ≤ C₀/r²` whenever the closure of `B_(2r)^Σ(p)`
is compact and contained in the interior, and when Σ is complete,

`|A|²(p) ≤ C / dist(p,∂Σ)²`.

Stability enters only through the scalar inequality `Q(φ) ≥ 0`, so the estimate holds for every
minimal immersion that satisfies it. Lean name: `exists_sq_mul_hessianCoordNormSq_le_of_stable`,
for the form in `ℝ³`.

In a Riemannian three-manifold N, for p in a compact subset `C ⊂ N` and `0 < r ≤ r₀` with
`r₀, C₀ > 0` depending on the metric near C, the Riemannian adaptation of 7.4 gives the
Riemannian Schoen estimate [Schoen]: `sup_(B_r^Σ(p)) |A|² ≤ C₀/r²` whenever the closure of
`B_(2r)^Σ(p)` is compact and contained in the interior. Both in `ℝ³` and in N, this
Laplacian-comparison route avoids point-picking, ambient blow-up, pointed compactness for
immersed surfaces, Pogorelov's area bound [Pogorelov] [White, Lemma 34], the logarithmic cutoff
and the graphical neighbourhoods of 2.4.

**Checks.**

- A plane: `A = 0`.
- The half-catenoid `{v ≥ 0}`, stable by 7.3: `dist(·,∂Σ)² |A|² = 2 sinh² v/cosh⁴ v ≤ ½`, with
  equality at `sinh v = 1`.
- The catenoid and the helicoid are complete without boundary and have `A ≠ 0`, so by the
  estimate neither is stable.

*Needs:* 7.2, 7.4.

### 7.6 Rigidity and Bernstein's theorem

*Sources:* [CM, §1.5]; [White, Theorem 29].

Every complete, connected, two-sided stable minimal immersion of a surface without boundary in
`ℝ³` has a plane as its image [FCS] [dCP] [Pogorelov]. Consequently, every `C²` solution of
the minimal-surface equation on all of `ℝ²` is affine: it is smooth by the regularity of 2.2,
an entire graph is complete, and it is stable by 7.3 (see also [Chodosh, Theorem 25.1] for a
direct proof for entire graphs using area minimization). By completeness and the absence of
boundary, `dist(p,∂Σ) = ∞` for every p, so the curvature estimate 7.5 gives `|A|²(p) = 0`,
hence `A ≡ 0`.

Lean name: `exists_affine_of_minimalSurfaceEquation`, for the statement on entire graphs.

**Checks.**

- Affine `u = ax + by + c`: all second derivatives vanish and the equation holds.
- The non-affine solutions of 2.1 are not entire: Scherk's graph lives on a square and the
  half-catenoid on `{ρ > 1}`.
- `u = xy` and `u = x² − y²` are entire and harmonic, and the left-hand side of the
  minimal-surface equation of 2.1 takes the values `−2xy` and `8(y² − x²)` on them.

*Needs:* 7.5, 7.3; 2.2 (smoothness of a `C²` solution).

### 7.7 Limits of stable hypersurfaces

*Sources:* [CM, §7.5]; [Chodosh, Theorem 33.1, Propositions 33.3–33.4].

In the compactness theorem with bounded area and curvature (5.2), if the `Σ_i` are two-sided
and stable, then every two-sided component of Σ is stable: when the convergence has
multiplicity one, the stability inequality passes directly to the limit; when the multiplicity
is larger than one, the sheets are ordered graphs over Σ, and their differences, normalized at
a point, converge by 2.5 to a positive solution of `Jh = 0`, which by 7.1 gives stability. For
a one-sided component, work on its normal double cover and interpret stability downstairs using
sections of the normal bundle, rather than scalar test functions (6.3). In a three-manifold
(`n = 2`), combine this with the curvature estimate 7.5 to obtain: two-sided stable properly
embedded minimal surfaces in U with locally bounded area have a subsequence converging as in
5.2.

**Checks.**

- The unions `{x₃ = 1/i} ∪ {x₃ = −1/i}` of stable planes converge to `{x₃ = 0}` with
  multiplicity 2; the normalized difference of the two sheets is the constant 1, a positive
  solution of `Jh = 0` on the limit.
- The implication does not reverse: the catenoids `λ𝒞` are unstable and converge in `ℝ³ ∖ {0}`
  to the punctured plane, which is stable.

*Needs:* 5.2, 2.5, 7.1, 6.3; 7.5, for surfaces.

### Examples

- The catenoid: three explicit Jacobi functions, the stable half `{v ≥ 0}` with
  `dist² (q + s) ≤ 1` and `dist² |A|² ≤ ½`, and the instability of the whole surface.
- The plane and the strip of 7.4: the Liouville theorem, and the lower bound `3C ≥ π²/4` for
  the constant.
- Entire and non-entire solutions of the minimal-surface equation (7.6).

### Dependencies

Layer 6 for the stability form and the index; R5b's Jacobi operator; R5c's principal
eigenfunction, strict domain monotonicity and Dirichlet problem; R7.0's Bochner formula; 1.1
and 3.6 for the Gauss curvature, the two-dimensional Simons identity and its ambient terms;
R4.1's smooth upper distance barriers; the pinned Green identity and maximum principle at a
local maximum; PDE C14, E23 and E25 for the exhaustion in 7.2. Items 7.1–7.5 are independent of
Layers 2, 4 and 5; 7.6 uses 2.2, and 7.7 uses 2.5 and 5.2.

## Layer 8 (MS8): removable singularities

### 8.1 Statement and curvature decay

*Sources:* [Chodosh, §32 opening paragraph, Theorem 32.5]; [ChoiSchoen].

Let `B_(r₀)(p)` be a normal ball in a smooth Riemannian three-manifold `(N³,g)` and let
`Σ ⊂ B_(r₀)(p) ∖ {p}` be properly embedded and minimal, without boundary in `B_(r₀)(p) ∖ {p}`.
Suppose that p lies in the closure of Σ, that `Area(Σ ∩ B_ρ(p)) ≤ C₁ρ²` for `0 < ρ < r₀`, and
that `∫_Σ |A|² dμ < ∞`. Then `Σ ∪ {p}` is a smooth properly embedded minimal surface in
`B_(r₀)(p)`. The quadratic area-growth hypothesis is the exact bound supplied by monotonicity
in 9.1; finite area alone is not the hypothesis of [Chodosh, §32]. The Riemannian normal-ball
statement, working with the rescaled ambient metrics rather than in `ℝ³` alone, is required
directly for the compactness application. As a first step, `∫_Σ |A|² dμ < ∞` gives
`∫_(Σ ∩ B_(2s)(p)) |A|² dμ → 0` as `s → 0⁺`, so applying the Riemannian small-total-curvature
estimate 5.1 on `B_(s/2)(x) ⊂ B_(2s)(p) ∖ {p}` for `x ∈ Σ` with `s = d_g(x,p) < r₀/2`, with
`r = s/2` and `σ = s/4`, yields

`(s/4)² |A|²(x) ≤ C₀(∫_(Σ ∩ B_(s/2)(x)) |A|² dμ + (s/2)²) → 0`,

hence `d_g(x,p) |A|(x) → 0` as `x → p`. The estimate is applied to the compact surface
`Σ ∩ B̄_r(x)` after decreasing `r = s/2` to a radius in `(s/4, s/2]` whose sphere `∂B_r(x)`
meets Σ transversally, so that its boundary lies on `∂B_r(x)`; the centre x lies in
`B_(r−σ)(x)`.

**Checks.**

- A plane through p in `ℝ³` with p removed: the hypotheses hold with `C₁ = π` and `A = 0`, and
  the extension is the plane.
- The radii: with `r = s/2` and `σ = s/4`, `B_(r−σ)(x) = B_(s/4)(x)` contains x, and
  `B_(s/2)(x)` lies in `B_(3s/2)(p) ∖ B_(s/2)(p)`. With `σ = r` the set `B_(r−σ)(x)` is empty
  and 5.1 gives nothing at x.
- The conclusion `d_g(x,p) |A|(x) → 0` is invariant under rescaling, and it holds for every
  smooth surface through p, on which `|A|` is bounded.

*Needs:* 5.1; DifferentialGeometry 10.2 (Sard's theorem, for the transversal radius). The
extension is completed in 8.2 and 8.3.

### 8.2 Annular punctured-plane blow-ups and punctured-disk decomposition

*Sources:* [Chodosh, Lemmas 32.1–32.3, Proposition 32.4].

Write `r(x) = d_g(x,p)`. At any critical point `x ∈ Σ` of `r²|_Σ`, `∇r²(x)` is normal to
`T_xΣ`, so

`Hess_Σ(r²) = Hess_N(r²)|_(T_xΣ) + ⟨∇r²(x), II⟩ = 2g_Σ + O(r²) + O(r|A|(x))`

is strictly positive definite for `0 < r(x) < r₁` sufficiently small (R4.1 and `r|A| → 0`).
Every critical point of `r²|_Σ` in `B_(r₁)(p) ∖ {p}` is therefore a strict local minimum; by
monotonicity (3.1) only finitely many components of `Σ ∩ B_(r₁)(p)` can meet `B_(r₁/2)(p)`
while missing p, so after shrinking `r₁` (to a regular value of `r|_Σ`) every component has p
in its closure and `r : Σ ∩ (B_(r₁)(p) ∖ {p}) → (0,r₁)` is a proper submersion without critical
points. Thus `Σ ∩ (B_(r₁)(p) ∖ {p})` is a finite disjoint union of punctured disks
`D₁^*,…,D_k^*` (`D_ℓ^* ≅ S¹ × (0,r₁)`, `k ≥ 1`). In geodesic normal coordinates at p, for any
`s_j → 0⁺` the rescaled surfaces `s_j⁻¹ exp_p⁻¹(D_ℓ^*)` have uniformly bounded area on bounded
balls (from quadratic area growth) and curvature tending to 0 on compact subsets of `ℝ³ ∖ {0}`
(from `r|A| → 0`); by varying-metric bounded-curvature compactness (5.2) and ambient blow-up
(MS1), a subsequence converges in `C^∞_loc(ℝ³ ∖ {0})` to a flat (`A ≡ 0`) properly embedded
surface in `ℝ³ ∖ {0}`. Because every level curve `D_ℓ^* ∩ ∂B_s(p) ≅ S¹` is a single connected
circle (`0 < s < r₁`), the limit meets `∂B_δ(0)` for every `δ > 0`, contains no second circle
on any sphere, and has sheet multiplicity 1 in the ordered annular collar of its great-circle
link in `S²`, so it is a single punctured plane `Π ∖ {0}` through 0 with multiplicity one.

**Checks.**

- A plane through p in `ℝ³`: `r²|_Σ` has no critical point on `Σ ∖ {p}`, `k = 1`, and every
  blow-up is the plane.
- A plane at distance `d > 0` from p: the only critical point of `r²|_Σ` is the foot of p,
  where `Hess_Σ(r²) = 2g_Σ`, a strict local minimum. This component does not have p in its
  closure, as in the count by monotonicity.
- On a plane of `ℝ³` the formula is `Hess_Σ(r²) = 2g_Σ` exactly: the terms `O(r²)` and
  `O(r|A|)` vanish.

*Needs:* 8.1; R4.1's Hessian of the squared distance (MS1); 3.1; 5.2 with R1's Euclidean limits
of rescaled metrics (MS1); DifferentialGeometry 10.2 (a regular value of `r|_Σ`).

### 8.3 Minimal-graph barrier trapping and smooth extension across the puncture

*Sources:* [Chodosh, Proposition 32.4, Theorem 32.5]; [ChoiSchoen].

Fix `D^* = D_ℓ^*`. By the multiplicity-one blow-up on dyadic annuli, at a sufficiently small
scale `ρ₀ ∈ (0,r₁)` the rescaled normal coordinates `y = ρ₀⁻¹ exp_p⁻¹(x)` with metric
`g̃(y) = ρ₀⁻² (exp_p(ρ₀y))^*g` (`‖g̃ − g_Eucl‖_(C⁴) ≤ Cρ₀² ≪ ε₂ ≪ δ₀`) can be rotated so that
`D^*` near `∂D²₁ × {0}` is a graph `y₃ = u(y₁,y₂)` with `‖u‖_(C^(2,α)(∂D²₁)) ≤ ε₁ ≪ ε₂`, while
sub- and superharmonicity of `y₃ ± Cρ₀²|y|²` keeps `|y₃| < ε₂/2` on `D^*` over `D²₁`. Solving
the small-data Dirichlet problem 2.3 for `M_(g̃)(v_t) = 0` on `D²₁` with `v_t|_∂D²₁ = u + t`
(`|t| ≤ ε₂`) gives a smooth foliation with `∂_t v_t ≥ ½` and a unique `t_* ∈ (−ε₂,ε₂)` with
`v_(t_*)(0) = 0`. Sweeping `t ↓ max(t_*,0)` from `+ε₂` and `t ↑ min(t_*,0)` from `−ε₂`, along
which `graph(v_t)` avoids both 0 and `∂D^*`, and applying the first-contact lemma 4.1 and the
tangency principle 3.2 traps `D^*` on one side of the smooth g̃-minimal disk
`G_* = graph(v_(t_*))` through 0. Every blow-up plane Π of `D^*` at 0 therefore lies on one
side of `T₀G_*` and hence equals `T₀G_*`: the tangent plane cannot rotate as the scale shrinks,
so in normal coordinates adapted to `T₀G_* = {z₃ = 0}`, `D^*` is a g̃-minimal graph
`z₃ = w(z₁,z₂)` over `D²_(r₂) ∖ {0}` with `|Dw(z)| → 0` as `z → 0` (`w ∈ W^(1,∞)(D²_(r₂))`).
Cutting off test functions on `B_(2ε)(0) ∖ B_ε(0)` produces an `O(ε)` error in the
divergence-form minimal-surface equation since `|Dw|` is bounded, so w is a weak solution
across 0 and is smooth on `D²_(r₂)` by the interior estimates 2.2. Thus each `D_ℓ^* ∪ {p}` is a
smooth minimal disk through p; if `k ≥ 2`, two disjoint punctured disks `D₁^*, D₂^*` could
neither cross transversely at p nor share `T_pD₁ = T_pD₂`, by the tangency principle 3.2,
forcing `k = 1`.

**Checks.**

- A punctured plane `{y₃ = 0} ∖ {0}` in `ℝ³`: `u = 0`, the foliation is `v_t ≡ t`, `t_* = 0`,
  `G_* = {y₃ = 0}` and `w = 0`.
- The cutoff error in `ℝ³`: for a test function ζ and a cutoff η with `|Dη| ≤ 2/ε` supported in
  `B_(2ε)(0) ∖ B_ε(0)`, the term containing `Dη` is bounded by `sup|ζ| · (2/ε) · 3πε² = O(ε)`,
  the flux `Dw/√(1+|Dw|²)` having norm at most 1.

*Needs:* 8.2; 2.3, 2.2; 4.1; 3.2; R1's Euclidean limits of rescaled metrics (MS1); PDE E23 and
E22, for the regularity of the weak solution.

### Examples

- A smooth minimal surface through p, punctured at p: every hypothesis holds and the extension
  is the surface itself.
- Codimension one is needed. The image of `z ↦ (z², z³)`, `z ≠ 0`, in `ℂ² = ℝ⁴` is a properly
  embedded surface in a punctured ball, minimal because its coordinate functions are harmonic
  for the induced conformal structure (MS1). Its induced metric is `(4|z|² + 9|z|⁴)|dz|²`, its
  area in `B_ρ(0)` is `2πρ²(1 + o(1))` as `ρ → 0`, and `K dμ = −½ Δ log(4 + 9|z|²) dx dy` is
  integrable near 0, so that `∫ |II|² = −2 ∫ K dμ < ∞`. Its closure is the cuspidal curve
  `y² = x³`, whose area ratio at 0 tends to 2: it is not a smooth surface there.

### Dependencies

Layer 5 for ε-regularity and compactness under varying metrics; Layer 2 for the small-data
Dirichlet problem with its foliation and for the interior estimates; Layers 3 and 4 for
monotonicity, the tangency principle and the first-contact lemma; R4.1's Hessian of the squared
distance; R1's Euclidean limits of rescaled metrics; DifferentialGeometry 10.2; PDE E22 and
E23.

## Layer 9 (MS9): compactness under bounded total curvature

For a closed connected orientable minimal surface `Σ²` in a fixed closed Riemannian
three-manifold `(M³,g)`, the traced Gauss equation gives `|A|² = R_g − 2Ric_g(ν,ν) − 2K_Σ`, so
by the Gauss–Bonnet theorem for closed surfaces (PositiveMass §3.1) [Chodosh, Remark 31.1]

`∫_Σ |A|² ≤ C_g |Σ| − 4πχ(Σ) = C_g |Σ| + 8π(genus(Σ) − 1)`,

where `C_g` is the maximum of `R_g − 2Ric_g(v,v)` over the unit tangent vectors v of M. Bounded
area and genus therefore imply bounded total curvature `∫_Σ |A|²`.

**Checks.**

- `S²_eq ⊂ S³`: `R_g = 6`, `Ric_g(ν,ν) = 2` and `K_Σ = 1`, so `|A|² = 6 − 4 − 2 = 0`.
- The Clifford torus: `K_Σ = 0`, so `|A|² = 6 − 4 − 0 = 2`.
- Sign of the Euler term: on the unit `S³`, `C_g = 2`. For `S²_eq` the bound reads
  `0 ≤ 2 · 4π − 8π`, and for the Clifford torus `2 · 2π² ≤ 2 · 2π² − 0`; both are equalities.

*Needs:* R5a's Gauss equation; PositiveMass §3.1 (the Gauss–Bonnet theorem for closed
surfaces); the genus of the conventions.

### 9.1 Compactness under bounded area and total curvature

*Sources:* [ChoiSchoen]; [Chodosh, Theorem 31.3, §34].

Let `Σ_j ⊂ (M³,g)` be nonempty closed embedded minimal surfaces in a fixed closed
three-manifold with uniformly bounded area and total curvature `∫_(Σ_j) |A|² ≤ Λ`. After
passing to a subsequence, there is a nonempty closed embedded minimal surface `Σ_∞` and a
finite set of points `B ⊂ M` with `|B| ≤ Λ/ε` (choose `ε > 0` valid for the fixed ambient
metric in the small-total-curvature estimate 5.1) such that `Σ_j` converges in `C^∞_loc(M ∖ B)`
to `Σ_∞ ∖ B`, possibly with multiplicity `> 1` on some components. The proof uses: the
point-picking lemma 5.4 [Chodosh, Lemma 29.1] and ambient blow-up (MS1) to reduce curvature
blow-up to a renormalized limit `Σ̃_∞ ⊂ ℝ³` with `|A|(0) = 1` and `|A| ≤ 2`; the scale
invariance of `∫|A|²` to transfer the energy bound to the blow-up; the quantitative lower bound
`∫_Σ |A|² ≥ ε > 0` for any complete non-flat minimal surface in `ℝ³` with `|A|(0) = 1` and
`|A| ≤ 2`, proved by graphical neighbourhoods (2.4) [Chodosh, Lemma 31.2]; compactness under
bounded area and curvature (5.2) on the complement `M ∖ B`; and the removable-singularity
theorem of MS8 to extend the limit smoothly across B, since monotonicity (3.1) and the area
bound give quadratic area growth `Area(Σ_∞ ∩ B_ρ(b)) ≤ Cρ²` near each `b ∈ B`, and lower
semicontinuity gives `∫_(Σ_∞ ∖ B) |A|² ≤ Λ < ∞`. Choose B to contain only actual points of
failure of smooth convergence, discarding any unnecessary exceptional points.

**Checks.**

- Great spheres `S³ ∩ a_j^⊥` with `a_j → a`: `A = 0`, `B = ∅`, and the convergence to
  `S³ ∩ a^⊥` is smooth with multiplicity one.
- Multiplicity: in the flat torus `T³ = ℝ³/ℤ³` the surfaces `Σ_j = T² × {1/j} ∪ T² × {−1/j}`
  converge to `T² × {0}` with multiplicity 2 and `B = ∅`.
- The bound on B: each point of B carries at least ε of total curvature, so `|B| ≤ Λ/ε`. The
  catenoids `λ_j 𝒞 ∩ B₁(0)`, `λ_j → 0`, are the local model of one such point: their total
  curvature tends to `8π` and concentrates at the origin.

*Needs:* 5.1, 5.2, 5.4, 2.4, 3.1; 8.1–8.3; R1's Euclidean limits of rescaled metrics (MS1).

### 9.2 Multiplicity-one regularity

*Sources:* [Chodosh, Lemma 31.4].

In 9.1, once `Σ_∞` is extended smoothly across B by MS8, any component of `Σ_∞` occurring with
multiplicity one on `Σ_∞ ∖ B` has smooth multiplicity-one convergence everywhere, including at
candidate points `b ∈ B`: on a ball `B_r(b)` meeting no other component of `Σ_∞` and no other
point of B, smooth multiplicity-one convergence on the annulus `B_r(b) ∖ B_(ηr)(b)` combined
with monotonicity (3.1) on `B_(ηr)(b) ⊂ B_r(b)` shows `Area(Σ_j ∩ B_r(b))/(πr²) ≤ 1 + ε₀` for
small r, η and large j, so the smooth Allard regularity theorem 5.5 bounds `|A|` uniformly near
b and bounded-curvature compactness (5.2) upgrades the convergence across b. Consequently every
component meeting the reduced set B has multiplicity greater than one. This regularity step is
separate from the positive-Jacobi-field argument.

**Checks.**

- The area count: multiplicity one on the annulus `B_r(b) ∖ B_(ηr)(b)` gives area
  `(1 + o(1)) π r² (1 − η²)` there, and monotonicity bounds the area in `B_(ηr)(b)` by
  `e^(ar) η² Area(Σ_j ∩ B_r(b))`. Together,
  `Area(Σ_j ∩ B_r(b))/(πr²) ≤ (1 + o(1))(1 − η²)/(1 − e^(ar) η²)`, which is at most `1 + ε₀`
  for small r and η and large j.
- With multiplicity 2 the same count gives a ratio near 2 and 5.5 does not apply; the catenoids
  `λ𝒞` are the model.

*Needs:* 9.1; 3.1; 5.5; 5.2.

### 9.3 Multiplicity implies stability

*Sources:* [Chodosh, Theorem 33.1, Propositions 33.3–33.4].

In 9.1, if a two-sided component of `Σ_∞` occurs with multiplicity `> 1`, then that component
is stable. In particular this holds for a two-sided component meeting the reduced set B, by
9.2. As in the argument for limits of stable hypersurfaces (7.7), the ordered graph sheets on
`Σ_∞ ∖ B` converge after normalization to a positive solution of `Jh = 0` on `Σ_∞ ∖ B` (2.5,
[Chodosh, Proposition 33.3]), which makes `Σ_∞ ∖ B` stable (7.1, [Chodosh, Proposition 33.4]),
and the logarithmic cutoff argument [Chodosh, Lemma 33.5] removes the finite set B to give
stability of the closed component: because a point in a Riemannian surface has zero 2-capacity
(S6 of the surfaces sub-roadmap), any compactly supported test function can be replaced by one
vanishing near each `b ∈ B` with arbitrarily small increase in the Dirichlet energy, so the
stability inequality `Q(φ) ≥ 0` on `Σ_∞ ∖ B` extends to all of `Σ_∞`. Combined with the
nonexistence of closed stable minimal hypersurfaces under `Ric > 0` (6.4), this shows that the
convergence is smooth with multiplicity one when `Ric > 0` and all limit components are
two-sided. Ambient orientability alone does not ensure this; MS11 and MS12 use a finite cover
to handle that issue.

**Checks.**

- The tori `T² × {±1/j}` of 9.1 in the flat `T³`: the limit `T² × {0}` has multiplicity 2 and
  is stable, with `J = Δ` and `Q(φ) = ∫ |∇φ|² dμ ≥ 0`; the normalized difference of the two
  sheets is the constant 1.
- Capacity: the cutoff of S6 has Dirichlet energy `2π/log(δ/ε)` up to an error of order
  `1/log(δ/ε)²`, which tends to 0 with ε. In dimension one a cutoff from 0 at a point to 1 at
  distance δ has energy at least `1/δ`, so the argument is two-dimensional.

*Needs:* 9.1, 9.2; 7.7 with 2.5 and 7.1; S6 (the logarithmic cutoff); 6.4.

### Examples

- Great spheres of `S³`: smooth convergence with multiplicity one and `B = ∅`.
- Parallel flat tori in a flat `T³`, where `Ric = 0`: multiplicity 2 with a stable limit.
- The catenoids `λ𝒞` in a ball of `ℝ³`: the local model of a point of B, with total curvature
  `8π` concentrating at the origin and limit the disk with multiplicity 2.

### Dependencies

PositiveMass §3.1's Gauss–Bonnet theorem for closed surfaces, which rests on S3; S6's
logarithmic cutoff; Layer 2 for graphical neighbourhoods and the difference of two sheets;
Layer 3 for monotonicity; Layer 5 for ε-regularity, compactness, point picking and Allard
regularity; Layer 7 for positive Jacobi functions and limits of stable hypersurfaces; Layer 8
for removable singularities; 6.4.

## Layer 10 (MS10): eigenvalue estimates and area bounds

### 10.1 Reilly's formula

*Sources:* [Reilly]; [Chodosh, §34.1].

Let `(Ω,g)` be a compact Riemannian `(n+1)`-manifold with smooth boundary Σ and outward unit
normal ν, and let D be its Levi-Civita connection. In this formula use `A(X,Y) = ⟨D_Xν,Y⟩`,
which is `−⟨II(X,Y),ν⟩` in the parent's convention, and let `H = tr A` be the sum of the
principal curvatures with respect to ν: it is n times the average `(1/n) tr A` of the principal
curvatures of this A, that is `−n⟨H⃗,ν⟩` for the parent's averaged mean-curvature vector H⃗.
Set `z = f|_Σ` and `h = ∂_ν f`. For `f ∈ C^∞(Ω̄)`:

`∫_Ω ((Δf)² − |D²f|²) dV`
`= ∫_Ω Ric(∇f,∇f) dV + ∫_Σ (2h Δ_Σ z + H h² + A(∇_Σ z,∇_Σ z)) dμ`.

All objects on the left are ambient. For a harmonic extension, the left-hand side equals
`−∫_Ω |D²f|² dV ≤ 0`; minimality of the boundary does not make it nonnegative.

**Checks.**

- Unit ball of `ℝ^(n+1)`, `f = ½|x|²`: `Δf = n+1`, `|D²f|² = n+1`, `z = ½`, `h = 1`, `A = g_Σ`
  and `H = n`, so both sides equal `n(n+1)ω_(n+1)`. With the opposite sign of A the right-hand
  side would be negative.
- Unit ball, `f = x₁`: the left-hand side is 0. On the boundary `h = z = x₁`, `Δ_Σ z = −n x₁`
  and `|∇_Σ z|² = 1 − x₁²`, so the integrand is `1 − (n+1)x₁²`, of integral 0.
- Unit ball, `f = x₁² − x₂²`: the left-hand side is `−8ω_(n+1)`. On the boundary `h = 2z`,
  `Δ_Σ z = −2(n+1)z` and `|∇_Σ z|² = 4(x₁² + x₂²) − 4z²`, so the integrand is
  `4(x₁² + x₂²) − (4n+12)z²`, of integral `(8 − 16)|Sⁿ|/(n+1) = −8ω_(n+1)`.

*Needs:* R7.0 (the Bochner formula); DifferentialGeometry 12.5 (the divergence theorem on a
compact manifold with boundary); R5a's second fundamental form of the boundary.

### 10.2 Choi–Wang first eigenvalue estimate

*Sources:* [ChoiWang]; [Chodosh, Theorem 34.3].

Let `(M^(n+1),g)` be a closed connected orientable Riemannian manifold with `Ric_g ≥ k g`,
`k > 0`, and let `Σⁿ ⊂ M` be a closed connected embedded two-sided minimal hypersurface. Then
`λ₁(−Δ_Σ) ≥ k/2`. By the spectral and Dirichlet theory of R5c for `q = 0`, choose a smooth
eigenfunction φ on Σ with `Δ_Σ φ + λ₁φ = 0` and extend it smoothly as a harmonic function
`f ∈ C^∞(Ω̄)` into one of the two components of `M ∖ Σ`, which exist because Σ separates M
(R7.9). Apply Reilly's formula, choosing the side so that its outward normal gives
`∫_Σ A(∇φ,∇φ) dμ ≥ 0`; reversing the normal reverses this integral. Green's identity then gives
`0 ≥ (k − 2λ₁) ∫_Ω |∇f|² dV`. The integral is positive because φ is nonconstant, proving the
bound.

**Checks.**

- `Sⁿ_eq ⊂ S^(n+1)`: `k = n` and `λ₁(−Δ_(Sⁿ)) = n ≥ n/2`.
- The Clifford torus in `S³`: `k = 2`, and by 6.5 the eigenvalues of `−Δ` are `2(a² + b²)`,
  `(a,b) ∈ ℤ²`, so `λ₁ = 2 ≥ 1`.
- The Green step: for the harmonic extension f of φ, `∫_Σ φ ∂_ν f dμ = ∫_Ω |∇f|² dV`, which is
  positive for a nonconstant φ.

*Needs:* 10.1; R5c (the eigenfunction of `λ₁` and the Dirichlet problem for `−Δ`); R7.9
(separation).

### 10.3 Hersch's conformal balancing lemma on `S²`

*Sources:* [Hersch]; [YangYau, p. 59]; [Chodosh, proof of Theorem 34.5].

Let `(Σ,μ)` be a finite positive Borel measure space (`μ(Σ) > 0`) and let `Φ : Σ → S² ⊂ ℝ³` be
a measurable map whose fibres over antipodal points are null: `μ(Φ⁻¹({−v})) = 0` for every
`v ∈ S²`; this is automatic when Φ is a nonconstant holomorphic map on a compact Riemann
surface, whose fibres are finite. For `a ∈ B³ = {y ∈ ℝ³ : |y| < 1}`, consider the
orientation-preserving conformal Möbius diffeomorphism `T_a : S² → S²` given for `x ∈ S²` by

`T_a(x) = (√(1−|a|²) x + (⟨a,x⟩/(1+√(1−|a|²)) + 1) a) / (1 + ⟨a,x⟩)`,

which is smooth across `a = 0` with `T₀ = id` and `T_a⁻¹ = T_(−a)`, and conjugate under
stereographic projection from `−a/|a|` to the dilation `z ↦ √((1−|a|)/(1+|a|)) z` when `a ≠ 0`.
As `a → v ∈ S²`, `T_a(x) → v` for every `x ∈ S² ∖ {−v}`; by dominated convergence,
`F(a) = μ(Σ)⁻¹ ∫_Σ (T_a ∘ Φ) dμ` extends continuously from `B³` to its closure with
`F|_(S²) = id`. By Brouwer's no-retraction theorem (if `F ≠ 0` on `B³`, then `F/|F|` would
retract the closed ball onto `S²`), there exists `a ∈ B³` such that
`∫_Σ (T_a ∘ Φ) dμ = 0 ∈ ℝ³`.

Lean names: `herschMap` for `T_a`, as a map of the ambient space, and
`exists_integral_herschMap_eq_zero` for the balancing lemma.

**Checks.**

- For `x ⊥ a`, `T_a(x) = √(1−|a|²) x + a`, of norm 1. For `a = (0,0,3/5)` and `x = e₁` this is
  `(4/5, 0, 3/5)`.
- `T_a` fixes `±a/|a|`: at `x = a/|a|` the numerator is `(1+|a|) a/|a|` and the denominator
  `1+|a|`; at `x = −a/|a|` they are `−(1−|a|) a/|a|` and `1−|a|`. Without the factor
  `(1+⟨a,x⟩)⁻¹` the image of `−a/|a|` would have norm `1−|a|`, off the sphere.
- Dilation factor: stereographic projection from `−a/|a|` sends a unit `x ⊥ a` to a point of
  norm 1 and `T_a(x)` to a point of norm `√(1−|a|²)/(1+|a|) = √((1−|a|)/(1+|a|))`, which is ½
  for `|a| = 3/5`.
- Inverse: for `x ⊥ a` and `y = T_a(x)`, `⟨−a,y⟩ = −|a|²` and
  `T_(−a)(y) = ((1−|a|²) x + √(1−|a|²) a − √(1−|a|²) a)/(1−|a|²) = x`.
- The lemma: for μ the area measure of `S²` and `Φ = T_b`, `a = −b` balances. For a Dirac mass
  `μ = δ_p`, `∫ (T_a ∘ Φ) dμ = T_a(Φ(p))` is a unit vector for every a: the hypothesis on the
  fibres fails at `v = −Φ(p)`, and so does the conclusion.

*Needs:* `TauCeti.noRetraction_diskBoundary`;
`MeasureTheory.tendsto_integral_of_dominated_convergence`.

### 10.4 The degree bound and the Yang–Yau eigenvalue bound

*Sources:* [YangYau, §2, Proposition, p. 58, and Theorem 1, p. 55]; [Chodosh, Theorem 34.5
and its proof].

Let `(Σ,g)` be a closed connected orientable Riemannian surface, with an orientation chosen.
Endowing Σ with the smooth almost complex structure j given by rotation by `+π/2` in oriented
g-orthonormal frames, isothermal coordinates
([PseudoholomorphicCurveAnalysis](../../PseudoholomorphicCurveAnalysis/README.md) §2.4, PH2.4)
give `(Σ,j)` the holomorphic atlas of a compact connected Riemann surface in which g is
conformal to `dz dz̄`.

*Degree bound* [Chodosh, proof of Theorem 34.5]. Let `Φ : Σ → S² ⊂ ℝ³` be a nonconstant
holomorphic map of degree d, the unit sphere carrying the complex structure of the Riemann
sphere through stereographic projection; such a Φ is a smooth orientation-preserving branched
conformal map. Then

`λ₁(−Δ_Σ) |Σ| ≤ 8πd`.

Away from the finite critical set `{dΦ = 0}`, conformality `Φ^*g_(S²) = λg` gives
`|dΦ|²_g = Σ_(i=1)^3 |∇_g Φ_i|² = 2λ = 2 Jac_g(Φ)`, and deleting the finite branch-value set
`S ⊂ S²` and `Φ⁻¹(S)` restricts Φ to a d-sheeted covering map, so the Dirichlet energy
satisfies `E(Φ) = ½ ∫_Σ |dΦ|²_g dμ_g = d·Area(S²) = 4πd`. Composing with `T_a` from 10.3 gives
a branched conformal map `Φ̃ = T_a ∘ Φ` of degree d with `∫_Σ Φ̃_i dμ_g = 0` (`i = 1,2,3`) and
`E(Φ̃) = 4πd` (S5). Testing the Rayleigh quotient for `λ₁(−Δ_Σ)` (R5c) against `Φ̃₁, Φ̃₂, Φ̃₃`
and summing with `Σ_(i=1)^3 Φ̃_i² ≡ 1` yields `λ₁(−Δ_Σ) |Σ| ≤ 2E(Φ̃) = 8πd`. This bound and
10.3 are the single statement of Hersch's argument for holomorphic maps to the sphere; the
roadmaps that need it cite them.

*Yang–Yau bound.* If Σ has genus γ, then

`λ₁(−Δ_Σ) |Σ| ≤ 8π(γ+1)`.

Fixing `p ∈ Σ`, Riemann–Roch (§7.2, PH7.2, of the same roadmap, applied in divisor form to
`D = (γ+1)p`, without Brill–Noether theory) gives `dim_ℂ H⁰(𝒪((γ+1)p)) ≥ (γ+1) + 1 − γ = 2`,
producing a nonconstant meromorphic function whose sole pole at p has order `d ≤ γ+1`, hence by
stereographic projection a finite holomorphic map `Φ : Σ → S² ⊂ ℝ³` of degree `d ≤ γ+1` (Tau
Ceti's `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic`), to which the degree bound
applies. The sharper bound `8π⌊(γ+3)/2⌋`, which needs a map of degree at most `⌊(γ+3)/2⌋` from
Brill–Noether theory, is not a target of this sub-roadmap, and no item uses it.

**Checks.**

- The round `S²` with `Φ = id`: `d = 1`, `|dΦ|² = 2` and `E(Φ) = 4π`, and
  `λ₁ |Σ| = 2 · 4π = 8π`: equality in the degree bound, and in the Yang–Yau bound for `γ = 0`.
- Flat tori, `γ = 1`, with the bound `16π ≈ 50.27`: the square torus `ℝ²/(2πℤ)²` has `λ₁ = 1`
  and area `4π²`, so `λ₁ |Σ| = 4π² ≈ 39.48`; the torus of the lattice spanned by `(1,0)` and
  `(½, √3/2)` has `λ₁ = 16π²/3` and area `√3/2`, so `λ₁ |Σ| = 8π²/√3 ≈ 45.59`.
- The Riemann–Roch count for `γ = 0`: `dim_ℂ H⁰(𝒪(p)) ≥ 2` gives a function with one simple
  pole, and `d = 1`.

*Needs:* 10.3; PH2.4 and PH7.2; `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic`; S5
(conformal invariance of the Dirichlet energy); R5c (the Rayleigh characterization of `λ₁`).

### 10.5 Area bound from genus under `Ric > 0`

*Sources:* [ChoiSchoen]; [Chodosh, §34.3].

Let `(M³,g)` be a fixed closed connected orientable three-manifold with `Ric_g ≥ k g`, `k > 0`.
A closed connected orientable embedded minimal surface `Σ ⊂ M` of genus γ is two-sided:
orientations of M and of Σ orient its normal line bundle, which then has a unit section (R7.9).
For such a surface the Choi–Wang and Yang–Yau estimates give

`|Σ| ≤ (2/k) λ₁(−Δ_Σ) |Σ| ≤ (16π/k)(γ+1)`.

For the fixed ambient metric, the area is therefore bounded in terms of the genus.

**Checks.**

- `S²_eq ⊂ S³`: `k = 2`, `γ = 0` and `|Σ| = 4π ≤ 8π`.
- The Clifford torus: `γ = 1` and `|Σ| = 2π² ≈ 19.74 ≤ 16π ≈ 50.27`.
- Negative control for `Ric > 0`: in the flat torus `ℝ³/ℤ³` the plane `p x₁ + q x₃ = 0`, with p
  and q coprime, descends to a totally geodesic torus of area `√(p² + q²)`: genus 1 and
  unbounded area.

*Needs:* 10.2, 10.4; R7.9 (two-sidedness as the existence of a unit section of the normal line
bundle).

### Examples

- The unit ball with `f = ½|x|²`, `x₁` and `x₁² − x₂²`: three evaluations of Reilly's formula.
- The round `S²` and the two flat tori of 10.4.
- The equatorial sphere and the Clifford torus in `S³` (10.2, 10.5), with the flat `T³` as the
  negative control for the area bound.
- The maps `T_a` for `a = (0,0,3/5)` (10.3).

### Dependencies

R7.0's Bochner formula and DifferentialGeometry 12.5's divergence theorem for Reilly's formula;
R5c for `λ₁`, its Rayleigh characterization and the Dirichlet problem for `−Δ`; R7.9 for
separation and two-sidedness; PH2.4 and PH7.2 with Tau Ceti's finite holomorphic maps to the
sphere; S5; Tau Ceti's no-retraction theorem. Independent of Layers 2–9.

## Layer 11 (MS11): Frankel's theorem

### 11.1 Second variation of length between submanifolds

*Sources:* [Lee, Chapters 6, 10]; [Frankel, §2, the second variation in the proof of the
generalized Hadamard theorem, pp. 69–70].

Let `γ : [0,ℓ] → M` (`ℓ > 0`) be a unit-speed geodesic in a Riemannian m-manifold `(M,g)`
(`m ≥ 2`) minimizing the distance between two smoothly immersed submanifolds `f₁ : Σ₁ → M` and
`f₂ : Σ₂ → M` of arbitrary dimensions, with `γ(0) = f₁(x₁)`, `γ(ℓ) = f₂(x₂)` and `x₁, x₂`
interior points of `Σ₁, Σ₂`. First variation of length along variations moving one endpoint and
holding the other fixed gives orthogonality at both ends: `γ′(0) ⊥ df₁(T_(x₁)Σ₁)` and
`γ′(ℓ) ⊥ df₂(T_(x₂)Σ₂)`. For a smooth variation `γ_s : [0,ℓ] → M` of `γ₀ = γ` with
`γ_s(0) = f₁(σ₁(s))`, `γ_s(ℓ) = f₂(σ₂(s))` and transverse variation field
`V(t) = ∂_s γ_s(t)|_(s=0)` orthogonal to `γ′(t)`, the second variation of length satisfies

`0 ≤ d²/ds²|_(s=0) L(γ_s)`
`= ⟨II₂(v₂,v₂),γ′(ℓ)⟩ − ⟨II₁(v₁,v₁),γ′(0)⟩ + ∫₀^ℓ (|D_tV|² − Rm_g(V,γ′,γ′,V)) dt`,

where `v_i = σ_i′(0)`, `II_i` is the normal-bundle-valued second fundamental form of `f_i`, and
`Rm_g(V,γ′,γ′,V) = K_g(span(V,γ′)) |V|²` for `V ⊥ γ′`. The equality is R3's second variation of
length with free endpoints, which is consumed:
`∫₀^ℓ (|D_tV^⊥|² − ⟨R(V^⊥,γ′)γ′,V^⊥⟩) dt + ⟨D_s ∂_s γ_s|_(s=0), γ′⟩|₀^ℓ`. Here `V^⊥ = V`, and
at the two ends the transverse acceleration `D_s ∂_s γ_s|_(s=0)` is
`df_i(∇^(Σ_i)_s σ_i′(0)) + II_i(v_i,v_i)`, whose first term is orthogonal to `γ′`. This item
owns the form with the second fundamental forms. Realizing a prescribed field V along γ with
`V(0) = df₁(v₁)` and `V(ℓ) = df₂(v₂)` uses local endpoint chart corrections of
`exp_(γ(t))(sV(t))` and requires no single normal neighbourhood containing γ.

**Checks.**

- Two parallel hyperplanes of `ℝ^m` and a parallel field V: `II_i = 0` and `D_tV = 0`, and the
  second variation is 0.
- Concentric spheres of radii 1 and 2 in `ℝ³`, γ a radial segment and V a unit parallel field:
  `II_i(v,v) = −γ′/ρ_i` for the radius `ρ_i`, so the formula gives `−½ + 1 = ½`. Directly, the
  endpoints move through the angles s and `s/2`, and
  `L(s) = (5 − 4 cos(s/2))^(1/2) = 1 + s²/4 + O(s⁴)`, with second derivative ½.
- Sign: with the two endpoint terms exchanged the same example would give `−½`, against
  `0 ≤ d²L/ds²` for the minimizing segment.

*Needs:* R3 (the second variation of length with free endpoints) and R4.2 (the first variation
with a moving endpoint); R5a's second fundamental form; HopfRinow Layers 0–4 (the exponential
map).

### 11.2 Frankel's theorem

*Sources:* [Frankel, §2, generalized Hadamard theorem, p. 69]; [Chodosh, Exercise 20.2], for
the round sphere.

Let `(M^(n+1),g)` be a complete connected Riemannian `(n+1)`-manifold with `Ric_g > 0`, and let
`f₁ : Σ₁ → M` and `f₂ : Σ₂ → M` be minimal immersions of nonempty closed n-manifolds; in
particular, two nonempty closed embedded minimal hypersurfaces; more generally, it suffices
that one is closed and the other is properly immersed without boundary. Then
`f₁(Σ₁) ∩ f₂(Σ₂) ≠ ∅`. If the images are disjoint, compactness and completeness (Hopf–Rinow)
provide points `x₁ ∈ Σ₁`, `x₂ ∈ Σ₂` attaining `ℓ = dist_g(f₁(Σ₁),f₂(Σ₂)) > 0` and a unit-speed
minimizing geodesic `γ : [0,ℓ] → M` from `f₁(x₁)` to `f₂(x₂)`. Parallel transport along γ
carries an orthonormal basis of `df₁(T_(x₁)Σ₁) = γ′(0)^⊥` to parallel fields `E₁,…,E_n` that
form an orthonormal basis of `df₂(T_(x₂)Σ₂) = γ′(ℓ)^⊥` at `t = ℓ`. Summing the second-variation
inequality 11.1 over `V = E₁,…,E_n`, the endpoint terms vanish by minimality
(`Σ_(j=1)^n II_i(e_j,e_j) = 0`), leaving `0 ≤ −∫₀^ℓ Ric_g(γ′(t),γ′(t)) dt < 0`, a
contradiction. Neither orientability of M nor two-sidedness of `Σ₁, Σ₂` is needed.

**Checks.**

- Two great hyperspheres `S^(n+1) ∩ a^⊥` and `S^(n+1) ∩ b^⊥`, `n ≥ 1`, meet along
  `S^(n+1) ∩ a^⊥ ∩ b^⊥`, which is nonempty.
- The Clifford torus meets the great sphere `{x₄ = 0}` in the points with `x₃² = ½`.
- Negative control for `Ric > 0`: `T² × {t₁}` and `T² × {t₂}` in a flat `T³`, and `S² × {θ₁}`
  and `S² × {θ₂}` in `S² × S¹`, where `Ric(∂_θ,∂_θ) = 0`, are disjoint closed minimal
  hypersurfaces.
- Negative control for minimality: two disjoint geodesic spheres of small radius in `S³`.

*Needs:* 11.1; HopfRinow Layers 0–4 (a minimizing geodesic realizing the distance);
SmoothBundlesConnections B5.0 (parallel transport along γ); R5a (minimality as the vanishing of
the trace of II).

### 11.3 Connectedness of preimages in finite covers

*Sources:* [Frankel, §1, Theorem, p. 69, with its proof through the universal cover,
pp. 70–71]; [Bernstein, Theorem 3.1].

Let `(M^(n+1),g)` be a closed connected Riemannian manifold with `Ric_g > 0`. Compactness of M
gives `Ric_g ≥ k g` for some `k > 0`, so by Bonnet–Myers (R4.5) the universal Riemannian cover
`π : M̃ → M` is compact and hence a finite cover of degree `d = |π₁(M)|`. For any nonempty
closed connected embedded minimal hypersurface `Σ ⊂ M`, the full preimage `Σ̃ = π⁻¹(Σ) ⊂ M̃` is
a nonempty closed embedded minimal hypersurface in `(M̃,π^*g)` whose connected components are
pairwise disjoint; since `Ric_(π^*g) > 0`, Frankel's theorem implies that Σ̃ is connected
(equivalently, `π₁(Σ) → π₁(M)` is surjective [Frankel, §1, Theorem, p. 69]). Because M̃ is
simply connected, M̃ is
orientable with `b₁(M̃) = 0`, so Σ̃ separates M̃ and is two-sided, hence orientable (R7.9).
Moreover, `π|_(Σ̃) : Σ̃ → Σ` is a d-sheeted covering, so `χ(Σ̃) = d χ(Σ)` by Tau Ceti's
`TauCeti.eulerChar_eq_mul_of_isCoveringMap`; when `n = 2` and Σ is orientable of genus γ, Σ̃
has genus γ̃ with `γ̃ − 1 = d(γ − 1)`.

**Checks.**

- `ℝP³`, `d = 2`: the preimage of `ℝP²` is the connected `S²_eq`, and `χ(S²) = 2 = 2 χ(ℝP²)`.
- The image of the Clifford torus in `ℝP³` is a torus; its preimage is the connected Clifford
  torus, and `γ̃ − 1 = 0 = 2(γ − 1)`.
- An embedded minimal sphere in `ℝP³` would have `γ̃ − 1 = 2(0 − 1)`, that is `γ̃ = −1`: there
  is none, as the surjectivity of `π₁(Σ) → π₁(M)` also shows.

*Needs:* 11.2; R4.5 (Bonnet–Myers) and R4.3 (the universal Riemannian cover); R7.9;
`TauCeti.eulerChar_eq_mul_of_isCoveringMap` (AlgebraicTopology §7.3), with AlgebraicTopology
§8.7.

### Examples

- Great hyperspheres and the Clifford torus in the round sphere (11.2), with the flat torus and
  `S² × S¹` as negative controls.
- `ℝP³`: the projective plane, the quotient of the Clifford torus and the absence of embedded
  minimal spheres (11.3).
- The concentric spheres of 11.1, where the formula is checked against a direct computation.

### Dependencies

R3's second variation of length with free endpoints and R4.2's first variation with a moving
endpoint; HopfRinow; SmoothBundlesConnections B5.0 for parallel transport; R5a's second
fundamental form; R4.3 and R4.5 for the universal cover; R7.9; Tau Ceti's finite-cover
multiplicativity of the Euler characteristic. Independent of Layers 2–10.

## Layer 12 (MS12): Choi–Schoen compactness

### 12.1 Choi–Schoen compactness

*Sources:* [ChoiSchoen]; [Chodosh, Theorem 34.6].

Let `(M³,g)` be a closed connected orientable three-manifold with `Ric_g > 0`, and let `Σ_j` be
a sequence of nonempty closed connected orientable embedded minimal surfaces in M with
uniformly bounded genus. Then a subsequence converges smoothly, with multiplicity one, to a
closed connected orientable embedded minimal surface `Σ_∞ ⊂ M`. First prove the statement when
M has no closed embedded one-sided surfaces, in particular when M is simply connected, as in
[Chodosh, Theorem 34.6]:

1. The area bound from the genus (10.5) ensures bounded area.
2. Gauss–Bonnet (the opening of MS9) converts bounded area and genus to bounded total
   curvature.
3. Compactness under bounded total curvature (9.1) gives a limit `Σ_∞`, smooth away from a
   finite set B.
4. Removable singularities (MS8) extend `Σ_∞` smoothly across B.
5. All limit components are two-sided. A component with multiplicity `> 1` is stable (9.3),
   contradicting `Ric > 0` (6.4). Multiplicity-one regularity (9.2) then removes all points of
   non-smooth convergence. Smooth multiplicity-one convergence on the compact limit identifies
   the surfaces by normal graphs for large j, so connectedness and orientability pass to the
   limit.

For general M, pass to the universal Riemannian cover `π : M̃ → M` as in 11.3 (following
[Bernstein, Theorem 3.1]): Bonnet–Myers makes π a finite cover of degree d, and by Frankel's
theorem the lifted surfaces `Σ̃_j = π⁻¹(Σ_j)` are connected closed orientable embedded minimal
surfaces with uniformly bounded genus `γ̃_j = 1 + d(γ_j − 1)`. Apply the simply connected case
upstairs. The smooth limit `Σ̃_∞` is invariant under the deck group Γ, and for large j the
Γ-equivariant normal projection onto `Σ̃_∞` is a diffeomorphism `Σ̃_j → Σ̃_∞` that descends to
a diffeomorphism `Σ_j → Σ_∞ = Σ̃_∞/Γ`: thus `Σ_∞` is connected and orientable, since the `Σ_j`
are, and local covering charts descend smooth multiplicity-one convergence to M. Orientability
of M alone could not exclude one-sided limits before passing to M̃; compare `ℝP² ⊂ ℝP³` in 6.5.

**Checks.**

- The round `S³`: great spheres `S³ ∩ a_j^⊥` have a subsequence with `a_j → a`, converging
  smoothly with multiplicity one to `S³ ∩ a^⊥`; the Clifford tori `g_j(𝕋²)`, `g_j ∈ SO(4)`,
  have a subsequence with `g_j → g`, converging to `g(𝕋²)`.
- Negative control for `Ric > 0`: the totally geodesic tori of area `√(p² + q²)` in the flat
  `T³` (10.5) have genus 1 and no convergent subsequence as `p² + q² → ∞`.
- The cover: in `ℝP³`, `d = 2`, and a surface of genus γ lifts to a connected surface of genus
  `2γ − 1`.

*Needs:* 10.5; the opening of MS9; 9.1, 9.2, 9.3; 8.1–8.3; 6.4; 11.3; R7.9.

### Examples

- Great spheres and Clifford tori in the round `S³`: compact families, parametrized by `ℝP³`
  and by a quotient of `SO(4)`.
- The flat `T³`: tori of genus 1 and unbounded area, with no convergent subsequence.
- `ℝP³`: the reduction to the universal cover `S³`, with `d = 2`.

### Dependencies

Layers 6–11: 6.4, the opening of MS9 with 9.1–9.3, Layer 8, 10.5 and 11.3; R7.9 for
two-sidedness in the simply connected case.

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
