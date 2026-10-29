# Roadmap: asymptotically Euclidean geometry and positive mass

**Summary.** This roadmap develops the geometry and analysis of asymptotically
Euclidean (AE) ends, the ADM mass, and the Riemannian positive-mass theorem with
its rigidity. It builds two independent proofs: the minimizing-hypersurface
argument in dimensions 3–7, which needs no spin structure, and Witten's spinor
argument in every dimension n≥3. The spinor argument is carried as far as
Cecchini–Zeidler's theorem for one specified AE end of a complete spin manifold
whose remaining ends are arbitrary, which is the form needed by conformal Green
blow-ups on covering spaces. The inputs are Mathlib's Riemannian manifold
carriers, Tau Ceti's Levi-Civita scalar curvature and Riemannian volume, and the
curvature, PDE, operator, spin and current roadmaps listed below. The end
theorems are Layer 8: nonnegativity of the mass of every end and Euclidean
rigidity at a zero-mass end, for finite-ended manifolds in the two settings and
for one AE end with arbitrary other ends in the spin setting.

## Scope and ownership

This roadmap owns: AE ends and finite-ended AE structures; the ADM mass, its
existence, chart invariance and normalizations; weighted Lebesgue, Sobolev and
Hölder spaces on AE manifolds and their Fredholm theory away from the indicial
weights; the round-sphere spinor restriction and its monogenic spectrum; the
harmonically flat approximation and the zero-mass deformation; the AE large-ball
volume limit; the compact torus obstruction for smooth stable hypersurfaces in
ambient dimension at most 7 and the negative-mass compactification; spinors at
infinity and the boundary mass identity; doubled Callias operators with chiral
boundary conditions; and the localized Callias argument for one AE end.

It also owns three closed-manifold conformal inputs that its compact
obstruction uses, stated in Layer 0 and Layer 3: the pointwise scalar-curvature
law of a metric `φ^(4/(n−2)) g`, the positive first eigenfunction of a
Schrödinger operator on a closed connected manifold, and the metric of positive
scalar curvature obtained from it. They are derived from RiemannianGeometry R1's
law for `e^(2u) g` and from the form realizations below. The Yamabe roadmap, a
consumer of Layer 8, plans the same closed-manifold facts inside its variational
theory; the facts this roadmap uses are owned here so that supply runs in one
direction.

It leaves to other roadmaps:

- the Levi-Civita connection, curvature, Gauss equation, hypersurface variation,
  Bishop–Gromov comparison with its small-ball limit and its equality case, and
  spherical harmonics: RiemannianGeometry R1–R5, R4.1, R7.8, R8;
- gradient, divergence, Laplace–Beltrami, Green identities, orientation cover and
  Sard: DifferentialGeometry 2, 10, 12.2–12.5;
- Euclidean weak spaces, maximum principles, elliptic existence and regularity:
  PDE Lanes A, C–E;
- the form-domain self-adjoint realization and its compact specialization:
  UnboundedOperators UO-D06 and VariationalMethods V2.3, V5.1;
- bundle distributions, local elliptic regularity and compact Sobolev comparisons:
  ComplexKahlerGeometry K5a;
- Spin lifts, spinor bundles, the Dirac operator and the Schrödinger–Lichnerowicz
  formula: SpinGeometry G3–G6;
- integral-current minimization, compactness and codimension-one regularity in
  ambient dimension at most 7: GeometricCurrents G1–G7;
- smooth triangulation of compact surfaces with boundary: GeometricTopology, the
  smoothing-and-triangulation comparison, item 1 (smooth implies PL);
- cup and cap products, Poincaré duality, degree and Euler characteristic:
  AlgebraicTopology Stages 2–3, 6–7.

Spacetime ADM momentum, the dominant energy condition and Jang's equation need
different geometric targets and are outside this roadmap.

## Conventions

Manifolds are smooth, Hausdorff, second countable and connected, of real
dimension n≥3, with a smooth Riemannian metric; in Lean they carry Mathlib's
`IsRiemannianManifold`, so the metric-space distance is the Riemannian distance.
Completeness is metric completeness of that distance. The positivity and
rigidity theorems are for manifolds without boundary; the compact-boundary
problems below are analytic constructions with explicitly stated boundary
conditions.

Scalar curvature is the full scalar curvature, `n(n−1)κ` at constant sectional
curvature κ; in Lean it is Tau Ceti's `CovariantDerivative.scalarCurvature` of
Mathlib's `CovariantDerivative.leviCivitaConnection`. The Laplacian is the
positive one, `Δ⁺ = −div grad`. The conformal constant is
`a_n = 4(n−1)/(n−2)`. Clifford multiplication satisfies
`c(v)c(w)+c(w)c(v) = −2g(v,w)`. Weights follow Bartnik: a function `O(r^(−t))`
lies in `L^p_δ` for finite p exactly when δ>−t.

The ADM mass of an AE end with coordinates x is

`m(E,g) = [2(n−1)|S^(n−1)|]⁻¹ lim_(r→∞) ∫_(|x|=r) Σ_(i,j)(∂_i g_ij − ∂_j g_ii) x_j/r dS`,

with dS the Euclidean area of the coordinate sphere and `|S^(n−1)|` the area of the
unit sphere (Cecchini–Zeidler, equation (2.1), p. 6). The radius limit, not a
selected convergent subsequence, is part of the theorems. In this normalization
`(1+c r^(2−n))^(4/(n−2)) δ` has mass 2c. Schoen–Yau's compactification paper
divides by `4(n−1)|S^(n−1)|` (Schoen–Yau 2017, §1, p. 4), so its mass is half of ours.

## Exact supplier contracts

### From Mathlib

- `EuclideanSpace ℝ (Fin n)` with `EuclideanSpace.basisFun`, `fderiv`, and
  `Measure.euclideanHausdorffMeasure` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean`),
  used with exponent n−1 for coordinate spheres. Only ratios of two such areas
  enter the mass, so the normalizing constant of the Hausdorff measure cancels.
- `IsRiemannianManifold`, `RiemannianBundle`, `IsContMDiffRiemannianBundle` and
  `IsContinuousRiemannianBundle` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`,
  `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean`). `IsRiemannianManifold`
  asserts only that the distance is the Riemannian distance; second countability,
  connectedness and completeness are separate hypotheses.
- `CovariantDerivative.leviCivitaConnection` and `CovariantDerivative.IsLeviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`).
- `mfderiv` for the end parametrizations, and `IsometryEquiv` for rigidity.
- `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
  (`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean`): the
  Gagliardo–Nirenberg–Sobolev inequality for compactly supported C¹ functions on a
  finite-dimensional space, with a non-sharp constant. At p=2 it is the Euclidean
  critical Sobolev inequality used in Layer 1 and Layer 6.

### From Tau Ceti

- `CovariantDerivative.scalarCurvature`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean`):
  the metric trace of the Ricci tensor, equal to `n(n−1)κ` for constant curvature κ.
- The instance `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`
  (`.../LeviCivita/Regularity.lean`): the Levi-Civita connection of a smooth metric
  is smooth.
- `TauCeti.riemannianVolume` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`):
  the chart-glued Riemannian volume, characterized by `TauCeti.eq_riemannianVolume_iff`.
- `TauCeti.W1p0.sobolevEmbeddingL` (`TauCeti/Analysis/Sobolev/Embedding.lean`): the
  embedding of `W^(1,p)_0(Ω)` into `L^(p⋆)(Ω)` at the Sobolev conjugate exponent.

### From TauCetiRoadmap.RiemannianGeometry (on main)

R1: metric connection, curvature and the conformal law
`Scal̃ = e^(−2u)(Scal + 2(n−1)Δ⁺u − (n−1)(n−2)|du|²)` for `g̃ = e^(2u) g`.
R1.4: normal-coordinate density. R2–R3: Jacobi fields and distance. R4.1: Ricci
lower bounds, relative-volume monotonicity, the small-ball limit 1, and the
equality API (equal flat volume ratio on all radii gives a global Euclidean
isometry, without assuming simple connectedness). R4.3, R4.6: covering criterion
and cut locus. R5a–R5b: Gauss equation, first and second variation, the
full-scalar stability identity `∫(2|dφ|²+Scal_Σ φ²) ≥ ∫(Scal_M+|A|²)φ²` with its
compact-support and two-sidedness hypotheses, and the normal-Jacobi Dirichlet
realization. R7.8: smooth Lipschitz approximation of distance functions. R8.1–R8.2:
scalar spherical harmonics and their completeness in the compact L² realization.

### From TauCetiRoadmap.DifferentialGeometry (on main)

Sections 12.2–12.5: gradient, divergence, Laplace–Beltrami (native Δ = div grad, so
`Δ⁺` is its negative), density and Green identities. Section 2: orientation cover.
Section 10: Sard, used for regular exhaustion boundaries.

### From TauCetiRoadmap.PDE (on main)

Lanes A, C–E: Euclidean weak spaces, local and boundary estimates, maximum and
Harnack principles, scalar Dirichlet theory. Euclidean scalar estimates do not by
themselves supply the weighted bundle and boundary inverses built here.

### From TauCetiRoadmap.VariationalMethods and TauCetiRoadmap.UnboundedOperators

VariationalMethods V2.3: realification, the complex `Complex.I` tests and the
complex-linear forcing map. UnboundedOperators UO-D06: for a dense continuous
injection `j:V→H` and a bounded Hermitian shifted-coercive form a, the operator with
`Dom A = {j u : ∃h, ∀v, a(u,v)=⟨h, j v⟩}` and `A(j u)=h`, self-adjoint over
`RCLike 𝕜`, with both adjoint inclusions and the shifted resolvent. VariationalMethods
V5.1: the shifted inverse is the V2 form solution operator, compact when the
inclusion is compact. This is the only form-realization engine used here.

### From TauCetiRoadmap.ComplexKahlerGeometry (on main)

K5a: real and complex bundle distributions, local and global elliptic regularity,
and the compact boundaryless domain and form specialization. Its compact resolvent
is not a weighted noncompact inverse and not a chiral boundary-domain theorem.

### From TauCetiRoadmap.SpinGeometry (on main)

G3–G6: geometric Spin lifts, chosen-factor spinor bundles, Clifford-compatible
connections, the Dirac operator and its formal adjoint, and the
Schrödinger–Lichnerowicz formula. Its G6.5 sphere kernel example is not the full
spectrum, which is Layer 1 here.

### From TauCetiRoadmap.GeometricCurrents (on main)

G1–G7: integral-current minimization, compactness, barriers and homology-class
closure, codimension-one interior regularity in ambient dimension at most 7, and
G7's smooth stable-limit and no-cancellation interfaces.

### From TauCetiRoadmap.GeometricTopology and TauCetiRoadmap.AlgebraicTopology (on main)

GeometricTopology, the smoothing-and-triangulation comparison, item 1 (smooth
implies PL): every smooth manifold has a smooth triangulation (Whitehead); only the
case of compact surfaces with boundary is used, for the Euler identification in 3.1.
AlgebraicTopology Stages 2–3, 6–7: integral cup and cap products, degree, Poincaré
duality, finite CW Euler characteristic.

## How to read the build

Layer k is cited as Pk and its subsection k.n as Pk.n. Layer 0 fixes ends, decay,
the mass and its normalizations, and the conformal scalar law. Layer 1 builds the
weighted analysis: spaces, the scalar and spinor indicial models on the round
sphere, and Fredholm theory with the scalar end-value problem. Layer 2 reduces to
harmonically flat metrics, proves the zero-mass deformation and the AE volume
rigidity. Layer 3 proves positivity in dimensions 3–7 without spin, by the compact
torus obstruction and the negative-mass compactification, with the AE
minimizing-hypersurface route as a second proof in dimension 3. Layers 4–6 give the
spinor route on finite-ended manifolds: spinors at infinity and the boundary mass
identity, doubled Callias operators with chiral boundary conditions, weighted
solvability and positivity. Layer 7 localizes the Callias argument to one AE end
with arbitrary other ends. Layer 8 states the theorems. Layers 3 and 4–7 are
independent of each other; both use Layers 0–2.

## Layer 0: ends, decay and the mass functional

### 0.1 Asymptotically Euclidean ends

Define `AsymptoticallyEuclideanEnd n M t` as a smooth parametrization φ of an open
subset of M by the exterior `{x ∈ ℝⁿ : |x| > R}`, R>0, injective there with
bijective derivative (so a diffeomorphism onto its open image), such that the
metric coefficients `pullbackMetricCoeff φ x i j = g(dφ_x e_i, dφ_x e_j)` satisfy
`|∂^α(g_ij − δ_ij)| ≤ C|x|^(−t−|α|)` for |α|≤2 (Cecchini–Zeidler, Definition 2.1,
p. 5–6; Lee–Parker, §8 and §9). The order of interest is t>(n−2)/2. Define
`FiniteEndedAE n M t` as a finite nonempty family of such ends with pairwise
disjoint images whose union has compact complement (Cecchini–Zeidler,
Definition 2.3, p. 6, without boundary). The spin theorem with arbitrary other
ends uses one end only and no finite-ended hypothesis. Cecchini–Zeidler's
Definition 2.1 also makes integrability of the scalar curvature on the end part of
an AE end; here it is a separate hypothesis, stated wherever a mass is asserted
(0.2, 5.2, 7.1, 8.1–8.3), so `AsymptoticallyEuclideanEnd` is the decay condition alone.

- An end image is connected and open, and the end radius `|x|∘φ⁻¹` is a proper
  function on it; a finite-ended structure gives a compact exhaustion of M by
  sublevel sets of a smooth radius function ρ equal to |x| near each end.
- On an end of order t>0, Riemannian distance from a fixed point satisfies
  `d(p,φ(x)) = |x|(1 + o(1))` as |x|→∞; the error is `O(|x|^(1−t))` for t<1, so it need not
  be bounded.
- The inverse metric, the volume density, the area density of coordinate spheres
  and their unit normals differ from the Euclidean ones by `O_2(|x|^(−t))`, with the
  product, inversion and differentiation rules for these classes.
- Two parametrizations of the same end whose coefficient differences both decay at
  order t>0 differ, outside a compact set, by a Euclidean rigid motion plus an
  `O_2(|x|^(1−t))` error (Lee–Parker, Theorem 9.5).

**Checks.**

- The identity parametrization of ℝⁿ with R=1 and the flat metric is an end of every
  order: all coefficient differences vanish. A definition that also demanded a
  positive mass would wrongly reject it.
- The parametrization `x ↦ 2x` of flat ℝⁿ has `g_ij = 4δ_ij`, so `g_ij − δ_ij = 3δ_ij`
  does not decay: it is not an end of any order t>0. A definition that only asked for
  bounded coefficients would accept it.
- On a flat three-torus the empty family of ends has compact complement (the torus),
  and a unit parallel spinor has weighted `L²_(−1/2)` norm 1 and gradient norm 0, so
  no weighted Poincaré estimate `‖u‖_(L²_(−q)) ≤ C‖∇u‖₂` can hold, and constants solve
  the scalar problem "harmonic, tending to 1 at every end". The nonemptiness clause
  of `FiniteEndedAE` excludes it.
- Two-ended Schwarzschild with m>0 (two copies of `{|x| > (m/2)^(1/(n−2))}` glued along
  the minimal sphere) is finite-ended with two ends of order n−2.

### 0.2 The ADM mass

Define `coordinateFluxIntegrand n g r x = Σ_j(Σ_i(∂_i g_ij − ∂_j g_ii)) x_j/r` and
`normalizedCoordinateFlux n g r` as its integral over the coordinate sphere of
radius r divided by `2(n−1)` times the area of the unit sphere. The mass of an end
is the limit of `normalizedCoordinateFlux n (pullbackMetricCoeff φ) r` as r→∞.

- If t>(n−2)/2 and the scalar curvature is integrable on the end, the limit exists
  and is finite: the flux integrand is the divergence of the linearized scalar
  curvature plus quadratic terms `O(|x|^(−2t−2))`, integrable exactly because
  2t+2>n (Lee–Parker, Definition 8.2, Lemma 9.4 and Theorem 9.6).
- The limit is independent of the AE parametrization of the end, including the
  rigid-motion change and the `O_2(|x|^(1−t))` errors (Lee–Parker, Theorems 9.5 and 9.6,
  which attribute them to Bartnik).
- The mass is invariant under isometric pullback and scales by `λ^((n−2)/2)` under
  `g ↦ λg`. For n≥3 an end is simply connected, so under a finite Riemannian covering
  of M each end lifts to deg copies, each with the mass of the end below.
- The mass is a continuous affine function of the metric on the space of metrics of
  order t>(n−2)/2 with integrable scalar curvature (Lee–Parker, Lemma 9.4).

**Checks.**

- Flat ℝⁿ in the identity parametrization has flux identically 0, so mass 0.
- For `g = (1+c r^(2−n))^(4/(n−2)) δ`, `Σ_i(∂_i g_ij − ∂_j g_ii) = −(n−1)∂_j w` with
  `w = (1+c r^(2−n))^(4/(n−2))`, and `∂_j w = −4c r^(1−n) x_j/r + O(r^(3−2n))`; the flux
  integral at radius r is `4(n−1)c|S^(n−1)| + O(r^(2−n))`, so the mass is 2c. A
  normalization by `4(n−1)|S^(n−1)|` would give c, and a sign error in the normal
  would give −2c.
- Spatial Schwarzschild `(1+m/(2r^(n−2)))^(4/(n−2)) δ` has mass m (Cecchini–Zeidler,
  Example 2.2, p. 6); it is the previous Check with c=m/2.
- The coefficient perturbation `g_ij = δ_ij + ε x_i x_j/r^(n)` of order n−2 has
  `Σ_i ∂_i g_ij = ε(n+1−n)x_j/r^n = ε x_j/r^n` and `Σ_i ∂_j g_ii = ε ∂_j(r^(2−n)) = ε(2−n)x_j/r^n`,
  so the flux integral is `ε(n−1)|S^(n−1)|` and the mass is ε/2: the mass sees
  non-conformal terms as well.

### 0.3 Weighted decay classes

Define the weighted `C^(k,α)_δ` and `W^(k,p)_δ` hypotheses on an end with their chart
and derivative norms, as in 1.1, and smooth cutoffs and weighted partitions of unity
with controlled derivatives. Separate the headline `O_2` class of 0.1 from the
order-dependent analytic classes of Layer 1: smoothness in the interior does not
supply uniform weighted bounds on higher derivatives, so the headline theorems are
proved through Layer 2's approximation and mass transport and keep their C² AE
hypotheses. No invariance theorem assumes that an arbitrary coordinate change
preserves a class without proof.

- `O_k(r^(−t))` implies `W^(k,p)_δ` membership for finite p exactly when δ>−t: the
  model tail integral is `∫ r^(−p(t+δ)−1) dr`, divergent logarithmically at δ=−t.
- The supremum norm at δ=−t is a different endpoint: `O(r^(−t))` lies in `C^0_(−t)`.

**Checks.**

- n=3, p=2, `v = r^(−1)`: the `L²_δ` tail is `4π∫_1^∞ r^(−2δ−3) dr`, equal to 4π at
  δ=−1/2, and divergent at δ=−1 (logarithmically) and at δ=−3/2.
- The constant 1 on ℝ³ is not in `L²_(−1/2)`: its tail is `4π∫_1^∞ 1 dr = ∞`. In
  dimension n, constants are not in `L²_(−(n−2)/2)`: the tail is `∫ r^(n−3) dr`.
- `r^(−1)` lies in `C^0_(−1)` with norm 1 although it is not in `L²_(−1)`: the
  endpoint statements differ.

### 0.4 Normalizations and conformal changes

Prove that for a metric `ĝ = φ^(4/(n−2)) g` with φ smooth and positive,
`Scal_ĝ = φ^(−(n+2)/(n−2)) (a_n Δ⁺_g φ + Scal_g φ)`, by substituting
`u = (2/(n−2)) log φ` in RiemannianGeometry R1's law for `e^(2u) g`: the two gradient
terms `2(n−1)(2/(n−2))|dφ|²/φ²` and `(n−1)(n−2)(2/(n−2))²|dφ|²/φ²` cancel
(Lee–Parker, equation (1.1) and §2). Consequently `Δ_g U = 0` and `Scal_g = 0` on a
region where `g = w^(4/(n−2)) δ` give `Δ_Eucl(Uw) = 0`. For
`u = 1 + c r^(2−n) + o_2(r^(2−n))` prove that the mass of `u^(4/(n−2)) g` is
`m(g) + 2c`, with the differentiated error bounds. Compute the lifts of ends to
finite covers, the inversion of a normalized Green expansion, and the factor between this mass and
the normalizations of Schoen–Yau 2017 and Lee–Parker (Definition 8.2).

**Checks.**

- φ constant λ: `Scal_ĝ = λ^(−4/(n−2)) Scal_g`, the scaling law for `ĝ = λ^(4/(n−2)) g`.
- g Euclidean, `φ = 1 + c r^(2−n)`: φ is harmonic, so `Scal_ĝ = 0`; this is spatial
  Schwarzschild.
- g Euclidean, `φ = (2/(1+r²))^((n−2)/2)`: `a_n Δ⁺φ = n(n−1) φ^((n+2)/(n−2))`, so
  `Scal_ĝ = n(n−1)`, the round unit sphere. A law with `(n−2)/(4(n−1))` in place of
  `a_n` would give `Scal_ĝ ≠ n(n−1)`.
- n=3: `a_3 = 8` and the exponents are `4/(n−2) = 4` and `−(n+2)/(n−2) = −5`.

### Examples

Flat ℝⁿ (one end, mass 0); spatial Schwarzschild of mass m>0 (two ends, mass m
each); the conformally flat metric `(1+c r^(2−n))^(4/(n−2)) δ` on an exterior (mass 2c).

### Dependencies

Mathlib `EuclideanSpace`, `fderiv`, `Measure.euclideanHausdorffMeasure`, `mfderiv`,
`IsRiemannianManifold`; Tau Ceti `CovariantDerivative.scalarCurvature`,
`TauCeti.riemannianVolume`; RiemannianGeometry R1, R2–R3; DifferentialGeometry 12.2–12.5.

## Layer 1: weighted scalar and bundle analysis on AE manifolds

### 1.1 Spaces, ranges, coefficients and domains

For a complete manifold with a finite nonempty family of AE ends and compact
remainder, choose a smooth positive radius ρ equal to |x| near each end. For
1≤p<∞ set `‖v‖_(L^p_δ) = (∫|v|^p ρ^(−δp−n) dV)^(1/p)` and
`‖v‖_(W^(k,p)_δ) = Σ_(j≤k) ‖∇^j v‖_(L^p_(δ−j))`; the p=∞ norm is `ess sup |v| ρ^(−δ)`, and
`H^k_δ = W^(k,2)_δ` (Cecchini–Zeidler, equations (2.3)–(2.4), p. 7; Lee–Parker, §9).
Construct these as complete spaces of sections of a Hermitian bundle with metric
connection.

- Equivalent norms for admissible radii, charts and frames; weak differentiation;
  bounded multiplication and decay operations at the exponents where they hold.
- Smooth compactly supported sections are dense for 1≤p<∞ on a boundaryless
  manifold; for `W^(k,∞)_δ` the compact-support closure is a separate space, with
  local or weak endpoint approximation only.
- On compact-boundary domains, unrestricted sections, zero-trace closures and
  graph- or trace-constrained closures are distinct spaces, with boundary trace,
  collar lifting, duality, local compactness and compact-region Rellich theorems at
  their actual exponents and trace orders.
- Under the volume pairing, `(L^p_δ)* ≅ L^(p′)_(−n−δ)` for 1≤p<∞ (p′=∞ at p=1), and
  `L¹` is a predual of `L^∞_δ` without identifying the whole dual.
- Hölder: `L^p_δ × L^q_ε → L^r_(δ+ε)` when `1/r = 1/p+1/q ≤ 1`, and its derivative
  versions with the Sobolev embedding orders they require (Lee–Parker, Lemma 9.1).
- `H¹_δ ⊂ L²_(δ′)` is compact for δ<δ′ (Cecchini–Zeidler, Proposition 2.8, p. 10).
- Weighted Poincaré: for δ<0, `‖v‖_(L²_δ) ≤ C‖∇v‖_(L²_(δ−1))` on the ends, and on a
  finite-ended manifold with nonempty ends for sections in `H¹_δ`
  (Cecchini–Zeidler, Proposition 2.7, p. 10, citing Bartnik, Theorem 1.3).

The elliptic estimates and Fredholm theorems have 1<p<∞, integer k≥2 for the scalar
operator L of order two and k≥1 for the Dirac operator D, with
`L : W^(k,p)_δ → W^(k−2,p)_(δ−2)` and `D : W^(k,p)_δ → W^(k−1,p)_(δ−1)` (Lee–Parker,
Theorem 9.2, part (a) of which is Bartnik's Proposition 1.6). They are not asserted at p=1 or
p=∞. The weighted Hölder realization is separate, for 0<α<1, with
`C^(k,α) → C^(k−2,α)` scalar and `C^(k,α) → C^(k−1,α)` Dirac domains. For each finite k a
sufficient working hypothesis is `g−δ ∈ C^(k,α)_(−s)`, s>0, with uniform
scaled-annulus bounds, uniform ellipticity and the induced frame and connection
bounds; an extra bundle connection has `C^(k−1,α)_(−1−s)` coefficients relative to
its Euclidean model; a scalar potential is `C^(k−2,α)_(−2−s)` or is handled on its
stated lower-regularity domain. Cutoff commutators are bounded before the order-k
estimate. The basic finite-p `W^(2,p)` scalar and `W^(1,p)` Dirac estimates are proved
separately for the headline `O_2` metric, using uniformly scaled Lipschitz principal
coefficients and bounded lower coefficients.

The global theorem is on a boundaryless complete finite-ended manifold, or on a
specified elliptic compact-boundary domain with its own estimate. For scalar
Dirichlet problems the domain is `{u ∈ W^(k,p)_δ : Tr u = 0}`, the trace lying in
`W^(k−1/p,p)(∂M)`, with the inhomogeneous lifting separate. For the doubled
Dirac/Callias problem it is `{u ∈ W^(k,p)_δ(S) : χ Tr u = Tr u}` with Layer 5's χ, after
the boundary elliptic estimate; the Hilbert instance is `H¹_δ(S;χ)`.

- The unrestricted exterior-ball `W^(k,p)` domain is not Fredholm: the modes
  `r^(2−n−j) Y_j` lie in it for every j when 2−n<δ<0, and negative Dirac modes give
  the first-order analogue. Avoiding an indicial weight does not replace a boundary
  condition. Model end inverses are localized parametrix inputs.

*Needs:* PDE Lanes A, C–E; ComplexKahlerGeometry K5a; DifferentialGeometry 12.2–12.5;
Layer 0 (0.1, 0.3); Mathlib `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`.

**Checks.**

- Change of radius: replacing ρ by 2ρ multiplies the `L^p_δ` norm by the constant
  `2^(−δ−n/p)`, so the spaces agree. A definition with weight `ρ^(−δp)` instead of
  `ρ^(−δp−n)` would put `O(r^(−t))` in `L^p_δ` exactly when δ > n/p − t, shifting every
  threshold of 0.3 by n/p.
- `L²_(−n/2) = L²` exactly: at δ=−n/2, `ρ^(−δp−n) = 1`.
- Duality exponent: for n=3, p=2 the dual of `L²_(−1/2)` is `L²_(−5/2)`. The function
  `r^(−3)` lies in `L²_(−5/2)` (tail `4π∫_1^∞ r^(−6) r² r² dr = 4π`) and pairs with
  `r^(−1) ∈ L²_(−1/2)` to `4π∫_1^∞ r^(−4) r² dr = 4π`. Forgetting the −n in the dual weight
  would give `L²_(1/2)`, which contains `r^(−1)` (tail `4π∫ r^(−2) r^(−4) r² dr` finite), and the
  pairing of `r^(−1)` with itself is `4π∫_1^∞ dr = ∞`.
- Weighted Poincaré fails without ends: on the flat torus with the empty family the
  constant section violates it (0.1 Checks).

### 1.2 Scalar spherical harmonics and the indicial inverse

Consume RiemannianGeometry R8.1–R8.2: on `S^(n−1)` the eigenvalue of degree j≥0 is
`j(j+n−2)` with multiplicity `binomial(n+j−1,j) − binomial(n+j−3,j−2)`, the second
term zero for j<2, with complete orthogonal eigenspaces in the compact L²
realization. Derive the positive Euclidean polar Laplacian
`Δ⁺ = −∂_r² − (n−1)r⁻¹∂_r + r⁻²Δ⁺_S`. On `r^δ Y_j` its indicial factor is
`j(j+n−2) − δ(δ+n−2) = −(δ−j)(δ+j+n−2)`, so the scalar exceptional set is
`{j : j≥0} ∪ {2−n−j : j≥0}`; for n≥3 the two roots for each j are distinct. Derive the
radial weighted norm in the cylindrical variable log r, the derivative shifts and
the Green operators away from the exceptional set, the Hilbert mode estimates, and
the finite-p kernel estimates of 1.4. Record the repeated-root logarithmic
convention of dimension two only for comparison.

*Needs:* RiemannianGeometry R8.1–R8.2; 1.1.

**Checks.**

- n=3, j=0: roots δ=0 and δ=−1, the harmonic functions 1 and `r^(−1)`.
- n=3, j=1: roots δ=1 and δ=−2, the harmonic functions `x_i` and `x_i/r³`, with
  multiplicity `binomial(3,1) − 0 = 3`.
- n=3, j=2: multiplicity `binomial(4,2) − binomial(2,0) = 5`; omitting the
  subtracted term would give 6, the dimension of all quadratics, which includes
  the non-harmonic `r²`.

### 1.3 Round Spin comparison, monogenic decomposition and full spectrum

Fix n≥3, m=n−1, the unit round sphere with outward radial normal ν. Through
SpinGeometry G3–G6 construct the round Spin lift from `TS^m ⊕ ℝ ≅ S^m × ℝ^n` and
compare its intrinsic spinor bundle, metric and Levi-Civita spin connection with
the ambient restriction: the transition and Clifford intertwiners and their
connection identity. For even n use a fixed ambient half-spin space `Σ_n^+`, whose
restriction is the intrinsic chosen-factor spinor bundle of the odd-dimensional
sphere; the opposite `Σ_n^−` constructs the other spectral branch. For odd n use one
ambient irreducible Clifford factor `Σ_n`, whose restriction is the full intrinsic
spinor bundle with both chiral parts. In both cases the intrinsic complex rank is
`2^floor(m/2)`; SpinGeometry's doubled faithful odd-dimensional module would double
the multiplicities and is not used.

On ambient spinor-valued homogeneous polynomials define `X = Σ x_j c(e_j)`,
`D = Σ c(e_j)∂_j`, `E = Σ x_j ∂_j`, and prove `X² = −r²`, `D² = Δ⁺`, `DX + XD = −(2E+n)`.
With `P_k` the degree-k polynomials and `M_k = ker(D|P_k)`, construct the Fischer
decomposition `P_k = M_k ⊕ X P_(k−1)` by induction, using, for monogenic v of degree ℓ,
`D(X^(2a) v) = −2a X^(2a−1) v` and `D(X^(2a+1) v) = −(2ℓ+n+2a) X^(2a) v`. For even n use
the chiral versions `P_k^± = M_k^± ⊕ X P_(k−1)^∓`. Compute `dim M_k` from this exact
sequence and Pascal's identity.

From the hypersurface connection comparison derive `D_R = c(ν)(∂_r + (m/2 + D_S)/r)`,
fixing the sign of the intrinsic Dirac operator, and pin the Fourier symbol `i c(ξ)`.
A degree-k monogenic polynomial restricts to eigenvalue `−(k+m/2)`; `c(ν)` times
restricted `M_k^−` (even n) or `M_k` (odd n) gives the eigenvalue `+(k+m/2)`. Hence
each eigenvalue `±(k+m/2)` has multiplicity `2^floor(m/2) · binomial(k+m−1,k)`
(Camporesi–Higuchi, §3, equation (3.44), p. 11, and the odd-dimensional case that
follows). Prove eigenspace equality and completeness: Fischer decomposition spans
the restricted polynomial spinors, which are dense by Stone–Weierstrass on
coefficient functions; the closed self-adjoint round Dirac realization from
SpinGeometry G6 and ComplexKahlerGeometry K5a gives orthogonality, excludes further
spectrum and identifies the H¹ domain. Scalar harmonic completeness, Lichnerowicz,
highest weights and positive mass are not inputs. For a homogeneous solution
`r^δ ψ` the polar equation gives `δ = −m/2 − λ`, so the Euclidean Dirac exceptional
set is `{k : k≥0} ∪ {1−n−k : k≥0}`; derive the radial mode inverse, weighted norm,
derivative shift and branch multiplicities.

*Needs:* SpinGeometry G3–G6; ComplexKahlerGeometry K5a; RiemannianGeometry R5a
(hypersurface connection); 1.1.

**Checks.**

- m=2 (n=3): eigenvalues `±(k+1)` with multiplicity `2(k+1)`; at k=0, ±1 each with
  multiplicity 2. Using the doubled module would give 4.
- m=3 (n=4): eigenvalues `±(k+3/2)` with multiplicity `(k+1)(k+2)`; at k=0, ±3/2 each
  with multiplicity 2.
- `D(Xv) = −(2ℓ+n)v` for monogenic v of degree ℓ, from `DX+XD = −(2E+n)` and Dv=0; at
  ℓ=0, n=3 the constant spinor v gives `D(Xv) = −3v`.
- n=3: the Cauchy kernel `c(x)/|x|³` is monogenic and homogeneous of degree −2 = 1−n,
  the first negative exceptional weight.

### 1.4 Finite-p estimates, gluing and kernel and range

For p=2 use the complete angular decompositions and radial Green operators. For
1<p<∞ construct a dyadic-annulus kernel parametrix with angular derivatives and
off-diagonal bounds, local Calderón–Zygmund estimates and summable radial
exponential estimates away from the exceptional weights, and prove agreement with
the Hilbert construction on common smooth compactly supported data. L² spectral
projector bounds alone do not give the `L^p` estimate. Hölder realizations have
their own Schauder estimates.

Glue to a compact-interior parametrix with Layer 0's cutoffs; prove compact error by
local Rellich and the asymptotically small coefficient perturbation; prove
Fredholmness away from the indicial sets, index invariance in each weight
component and the index jumps across modes with their multiplicities (Lee–Parker,
Theorem 9.2). Boundary conditions of 1.1 and Layer 5 are retained. The scalar
interval used is 2−n<δ<0; δ=−(n−2)/2 for Dirac lies in 1−n<δ<0. An interval alone does
not give invertibility: kernels, cokernels and coercivity are identified for each
operator and domain. Conformal-Laplace potentials are handled with their actual
decay and sign.

Construct scalar Laplace and conformal-Laplace parametrices, their compact errors
and indices on the intervals used; prove maximum-principle uniqueness and
solvability of the positive harmonic and conformal corrections tending to 1, with
asymptotic expansions, differentiated remainders and coefficient flux formula. For
the Laplacian on a finite-ended manifold solve the end-value problem with one
prescribed real constant at each end: subtract a smooth end-constant seed, solve in
a weight 2−n<δ<0, and prove index 0 and the kernel and range statements
(Lee–Parker, Theorem 9.2(b)). For nonnegative nonzero end data prove strict interior
positivity and the leading harmonic expansions on harmonically flat ends; Kelvin
removability and the positive leading coefficient used in 3.2 belong here. On
arbitrary complete ends only local theory is used.

*Needs:* 1.1–1.3; PDE Lanes C–E; Layer 0 (0.3).

**Checks.**

- On flat ℝⁿ, `Δ⁺ : W^(2,2)_δ → L²_(δ−2)` is an isomorphism for 2−n<δ<0 and has the
  constants in its kernel for 0<δ<1: crossing δ=0 adds the j=0 mode.
- The end-value problem on two-ended Schwarzschild with end constants (1,0) has a
  harmonic solution strictly between 0 and 1; with data (1,1) the solution is 1.
- On the flat torus with the empty family of ends the end-value problem has every
  constant as a solution; nonemptiness of the ends is what gives uniqueness.

### Examples

Flat ℝⁿ: the scalar exceptional weights `{j} ∪ {2−n−j}` and the Dirac exceptional
weights `{k} ∪ {1−n−k}`; the round `S²` Dirac spectrum `±(k+1)` with multiplicity `2(k+1)`.

### Dependencies

Layer 0; PDE Lanes A, C–E; ComplexKahlerGeometry K5a; SpinGeometry G3–G6;
RiemannianGeometry R5a, R8.1–R8.2; DifferentialGeometry 12.2–12.5; Mathlib
`MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`; Tau Ceti `TauCeti.W1p0.sobolevEmbeddingL`.

## Layer 2: scalar-curvature reductions and rigidity variations

### 2.1 Harmonically flat approximation

For a smooth finite-ended AE metric of order t>(n−2)/2 with integrable scalar
curvature and Scal≥0, construct metrics that are harmonically flat at infinity
(`g = h^(4/(n−2)) δ` outside a compact set with h Euclidean-harmonic), with Scal≥0. Fix
(n−2)/2<q<min(t,n−2) and p>n; require convergence in `W^(2,p)_(−q)` on the ends and in
C² on compact sets, with uniform ellipticity and completeness comparisons. Use the
strict loss q<t to place the original metric in this class. Prove separately, at
every end, `|m(E,g_j) − m(E,g)| → 0` by the divergence identity, integrable scalar
tails, quadratic metric errors and the conformal leading coefficient of 0.4.
Preserve strict negativity of a selected negative mass, then produce the strict
positivity used in 3.2 (Lee–Parker, Lemma 10.6 and its proof; Schoen–Yau 2017,
proof of Proposition 5.4, citing their earlier work). Zero rigidity uses 2.2–2.3 and
Layers 6–7, not a limit of positive masses.

*Needs:* Layer 0; 1.4; RiemannianGeometry R1.

**Checks.**

- For flat ℝⁿ the approximation is the metric itself and every mass is 0.
- For spatial Schwarzschild of mass m, the metric is already harmonically flat with
  `h = 1 + (m/2) r^(2−n)`, and the approximations have mass m.
- The family `(1+ε r^(2−n))^(4/(n−2)) δ` on an exterior has mass 2ε by 0.2, and its
  coefficient difference `O(ε r^(2−n))` tends to 0 in `W^(2,p)_(−q)` for every q<n−2 as
  ε→0: the masses converge to 0, as the continuity statement requires.

### 2.2 The zero-mass deformation

If Scal≥0, the mass of one end is 0 and Ricci is nonzero somewhere, a compactly
supported variation `g + s h` followed by the conformal correction to nonnegative
scalar curvature produces, for small s of the right sign, a metric with Scal≥0 and
negative mass at that end: the first variation of the mass along the corrected
family is a nonzero constant multiple of `∫⟨h, Ric⟩ dV`, nonzero for h a cutoff of Ric,
and both signs of s are admissible. Prove the function-space solvability and the
remainder control. After positivity, zero mass therefore implies Ric = 0
(Lee–Parker, equation (8.11) and Lemma 10.7; Schoen–Yau 1979, §5, uncertified).

*Needs:* 1.4 (conformal corrections); 2.1; 0.2 (continuity of the mass).

**Checks.**

- Flat ℝⁿ: Ric=0, so no deformation is produced and the mass stays 0.
- The variation of scalar curvature at a flat metric is
  `DScal(h) = div div h + Δ⁺ tr h` (with Δ⁺ positive), so a compactly supported `h`
  with `div div h + Δ⁺ tr h = 0` changes neither Scal to first order nor the mass.
- With `h = χ Ric` for a cutoff χ≥0 equal to 1 on a ball where Ric≠0, the variation is a
  nonzero multiple of `∫χ|Ric|² dV > 0`; since s may have either sign, the mass decreases
  for one of them whatever the sign of the constant.

### 2.3 Maximal-volume rigidity

An AE end gives `liminf_(r→∞) Vol(B_r(p))/(ω_n r^n) ≥ 1` by the distance and radius
comparison of 0.1 and the volume density of 0.1. If Ric≥0, RiemannianGeometry R4.1's
relative-volume monotonicity and small-ball limit 1 make the ratio nonincreasing
with value at most 1, so it equals 1 for all radii; R4.1's equality API then gives a
global isometry with Euclidean space, without assuming simple connectedness.

*Needs:* 0.1; RiemannianGeometry R4.1.

**Checks.**

- ℝⁿ: the ratio is identically 1 and the isometry is the identity.
- A flat cylinder `S¹ × ℝ^(n−1)` has Ric=0 but large-ball ratio tending to 0, so it has no
  AE end and the conclusion does not apply.

### Examples

Spatial Schwarzschild is harmonically flat with `h = 1 + (m/2) r^(2−n)`; flat ℝⁿ is the
only complete manifold with Ric≥0 and an AE end.

### Dependencies

Layers 0–1; RiemannianGeometry R1, R4.1.

## Layer 3: nonspin positivity and compact stable hypersurfaces

Work on oriented finite-ended AE manifolds, 3≤n≤7. All minimizing hypersurfaces
in the compact obstruction have ambient dimension at most 7, so GeometricCurrents
G6's smooth codimension-one regularity applies.

### 3.0 Closed-manifold first eigenfunctions and conformal positivity

For a closed connected smooth Riemannian k-manifold, a constant a>0 and a smooth
potential V, realize `L = aΔ⁺ + V` through UnboundedOperators UO-D06 and
VariationalMethods V5.1 with ComplexKahlerGeometry K5a's closed-base domain
comparison. Prove that its lowest eigenvalue λ₁ is the infimum of the Rayleigh
quotient, simple, with a smooth eigenfunction that can be chosen positive: a
minimizer u gives the minimizer |u|, smooth by K5a's regularity, and positive by
PDE Lane C's strong maximum principle. For k≥3, if λ₁(a_k Δ⁺ + Scal) > 0 with positive
eigenfunction φ, then by 0.4 the metric `φ^(4/(k−2)) g` has scalar curvature
`λ₁ φ^(−4/(k−2)) > 0` (Lee–Parker, Theorem 2.6, Theorem 4.1 and its proof).

*Needs:* UnboundedOperators UO-D06; VariationalMethods V2.3, V5.1;
ComplexKahlerGeometry K5a; PDE Lane C; 0.4.

**Checks.**

- V constant c: λ₁ = c with constant eigenfunction.
- Round `S²` with L = Δ⁺: λ₁ = 0 is simple with constant eigenfunction, while the next
  eigenvalue 2 has multiplicity 3, so simplicity is a property of λ₁ only.
- Two disjoint round spheres: λ₁ = 0 has multiplicity 2, so connectedness is needed.
- Round `S³` with `a_3 Δ⁺ + Scal = 8Δ⁺ + 6`: λ₁ = 6, φ = 1, and the conformal metric is the
  original one with scalar curvature 6.

### 3.1 Compact torus obstruction and boundary Gauss–Bonnet

Prove that a closed oriented d-manifold, 3≤d≤7, admitting a nonzero-degree map to
`T^d` has no metric of positive scalar curvature (Schoen–Yau, *On the structure of
manifolds with positive scalar curvature*, uncertified; Schoen–Yau 2017,
Theorems 5.1–5.2). Use the pulled-back integral H¹ classes and their nonzero cup
product pairing with [M], from AlgebraicTopology's cup and cap products, Poincaré
duality and degree, and DifferentialGeometry's degree and pullback integration.
Minimize an integral hypersurface representing the Poincaré dual of one class by
GeometricCurrents G3–G7. Its regular support has finitely many compact connected
embedded components, each oriented and two-sided with constant positive integer
multiplicity; each is stable minimal, since a normal variation in a tube disjoint
from the others is a homologous competitor by G5's homotopy formula. Apply G6 and
RiemannianGeometry R5b to its second variation. At least one component carries a
nonzero product of the remaining classes, hence a nonzero-degree map to the smaller
torus; prove this on the actual singular and current comparison maps.

For a compact stable two-sided minimal hypersurface `Σ^k` in a compact ambient
manifold with Scal>0, R5b gives `∫(2|dφ|² + Scal_Σ φ²) ≥ ∫(Scal_M + |A|²)φ²`. When k≥3,
`a_k = 4(k−1)/(k−2) > 2` gives `λ₁(a_k Δ⁺ + Scal_Σ) ≥ min Scal_M > 0`; 3.0 then gives a
metric of positive scalar curvature on that component. Iterate down to a surface.
At k=2, φ=1 in the stability inequality and Gauss–Bonnet give χ(Σ)>0. A closed
connected oriented surface with a nonzero-degree map to `T²` has two rationally
independent pulled-back H¹ classes with nonzero cup product, so b₁≥2 and
AlgebraicTopology Stage 7's Euler–Poincaré identity gives χ = 2−b₁ ≤ 0, a contradiction
without surface classification.

For compact oriented surfaces with smooth boundary prove
`∫K dA + ∫_(∂Σ) k_g ds = 2πχ(Σ)` with outward-first boundary orientation and
`k_g = ⟨∇_T T, inward conormal⟩`, including piecewise smooth corners with exterior
angles, the triangulation and Euler identification, and naturality for exhaustion
boundaries, from RiemannianGeometry R1, R5a, DifferentialGeometry's Stokes theorem,
the smooth triangulation of GeometricTopology's smoothing-and-triangulation comparison
(item 1) and AlgebraicTopology Stage 7 (do Carmo, *Differential Geometry of Curves and
Surfaces*, §4-5, Global Gauss–Bonnet theorem). A closed index
formula alone is not the boundary theorem.

*Needs:* GeometricCurrents G1–G7; RiemannianGeometry R1, R5a–R5b; AlgebraicTopology
Stages 2–3, 6–7; DifferentialGeometry 2, 10, 12.2–12.5; GeometricTopology,
smoothing-and-triangulation comparison, item 1; 3.0.

**Checks.**

- Stability inequality on the equator `S^k ⊂ S^(k+1)` (round, minimal, unstable) with φ=1:
  the left side is `k(k−1)Vol` and the right side `k(k+1)Vol`, so the inequality fails,
  as it must for an unstable hypersurface.
- `a_3 = 8`, `a_4 = 6`, `a_7 = 24/5`, all greater than 2; at k=2 the coefficient is
  undefined and the surface case is handled by Gauss–Bonnet.
- Boundary Gauss–Bonnet on the unit disc: K=0, `k_g = 1` on the boundary of length 2π,
  total 2π = 2πχ. On the annulus 1<r<2: outer boundary contributes `(1/2)(4π) = 2π`,
  inner boundary `(−1)(2π) = −2π`, total 0 = 2πχ. On the round hemisphere: area 2π, geodesic
  boundary, total 2π = 2πχ. Using the outward conormal would flip both boundary signs.
- `T³` with its flat metric has Scal=0, consistent with the obstruction, and `S³` admits
  Scal>0 but has no nonzero-degree map to `T³`.

### 3.2 Negative mass to a compact contradiction

Starting with a negative chosen mass, apply 2.1 while preserving strict negativity,
Scal≥0 and all completeness and end hypotheses; the end scalar curvature is then 0.
On the finite-ended harmonically flat metric solve, by 1.4's end-value theory, for a
g-harmonic U tending to 1 on the chosen end and 0 on the others, with 0<U≤1 and
differentiated expansions. At the chosen end `U = 1 + b r^(2−n) + o_2(r^(2−n))` with b≤0,
so by 0.4 the conformal mass is `m + 2b < 0`. On another end write `g = w^(4/(n−2)) δ`;
then `Uw = c r^(2−n) + O_2(r^(1−n))` with c>0. Because Scal_g=0 there, 0.4 converts
`Δ_g U = 0` to `Δ_Eucl(Uw) = 0`, and the Kelvin transform extends smoothly and positively
across the origin by the removable-singularity theorem. Adding these finitely many
points to `U^(4/(n−2)) g` caps those ends smoothly; construct the charts, topology,
orientation extension and gluing, and prove completeness and preservation of the
chosen end and Scal≥0.

In the remaining end write `g = h^(4/(n−2)) δ` with h positive harmonic and
`h = 1 + (m_cap/2) r^(2−n) + O_2(r^(1−n))`, `m_cap = m + 2b < 0`. Choose R₀ with h<1 for r≥R₀,
s₀ the maximum of h on R₀≤r≤R₀+1, s₀<s₁<1, and a smooth positive nondecreasing concave
F with F(s)=s for 0<s≤s₀ and F constant for s≥s₁; choose R₁ with h>s₁ for r≥R₁. Then
`Δ_Eucl F(h) = F″(h)|dh|² ≤ 0`, strictly negative somewhere, so the modified metric has
Scal≥0, positive somewhere, and is exactly Euclidean outside a compact set after
constant rescaling (Schoen–Yau 2017, Proposition 5.4; Lohkamp, Proposition 6.1). No
spin obstruction is used.

Replace a ball in a large flat `T^n` by the compact interior of this metric across the
Euclidean collar. The result is a closed oriented manifold with Scal≥0, positive
somewhere, and a smooth collapse map to `T^n` of degree 1, computed at a regular value
in the unchanged torus region. Its conformal Laplacian has λ₁>0 by the Rayleigh
quotient and compactness, so 3.0 gives a metric of positive scalar curvature,
contradicting 3.1 (Schoen–Yau 2017, Theorem 5.3 and its proof). Rigidity uses 2.2
and 2.3. The orientation double cover, with its completeness, lifted chosen-end
masses and exclusion of extra ends in the equality case, removes orientability from
the finite-ended theorem (Lee–Parker, remark after Theorem 10.3).

*Needs:* 0.4; 1.4; 2.1–2.3; 3.0; 3.1; DifferentialGeometry 2.

**Checks.**

- The sign of b: U ≤ 1 and U → 1 force b ≤ 0, so capping can only lower the mass; with
  `U = 1 + b r^(2−n)` and b>0 one would have U>1 near infinity, contradicting U≤1.
- The concavity: F″≤0 and `Δ⁺ = −Δ_Eucl` give `Δ⁺ F(h) = −F″(h)|dh|² ≥ 0`, hence
  `Scal = a_n F(h)^(−(n+2)/(n−2)) Δ⁺F(h) ≥ 0` by 0.4; a convex F would give Scal≤0.
- For `h = 1 + (m/2) r^(2−n)` with m>0, h>1 near infinity and no R₀ with h<1 exists; for
  m<0, h<1 for every r, so the construction applies exactly to negative mass.

### 3.3 AE minimizing hypersurfaces and the three-dimensional route

Construct the coordinate-plane Plateau problems and confining barriers in 2.1's
reduced negative-mass end; prove uniform local mass bounds, fixed-core intersection
and boundary avoidance; apply GeometricCurrents G3–G7 to obtain a complete two-sided
stable minimal hypersurface; prove the AE-family estimates for G7's sheeting and
no-cancellation interface (Schoen–Yau 1979, §3–§4, uncertified). In the harmonically
flat end the limit is one graph outside a compact set. For n≥4 its height is
`a + O_2(r^(3−n))`; derive the leading harmonic term from the minimal graph equation
and Layer 1, and prove the induced (n−1)-metric is AE of order n−2 with integrable
scalar curvature and mass 0. These are geometric targets, not inputs to the proof
of 8.1. For n=3 treat the logarithmic alternative, prove the total-curvature and
topology estimates, extend stability to the limiting constant test by logarithmic
cutoffs, and combine 3.1's boundary Gauss–Bonnet with the positive core
contribution of `Scal_M + |A|²` (Schoen–Yau 1979, §4, uncertified).

*Needs:* 2.1; 3.1; Layer 1; GeometricCurrents G1–G7; RiemannianGeometry R5a–R5b.

**Checks.**

- The coordinate plane `{x_n = 0}` in flat ℝⁿ is the minimizer, of height 0 and induced
  mass 0.
- In spatial Schwarzschild (n=3, m>0) the plane `{x_3 = 0}` is the fixed set of the
  reflection isometry, hence totally geodesic, of height 0; a parallel plane
  `{x_3 = a}`, a≠0, is not minimal, since the radial conformal factor has nonzero normal
  derivative along it.
- A constant test function on a stable plane in ℝ³ with logarithmic cutoff
  `φ_R = 1 − log(r/R)/log R` on `R ≤ r ≤ R²` has `∫|dφ_R|² = 2π/log R → 0`, which is why the
  constant test is admissible in dimension 3.

### Examples

The compactification of a negative-mass metric (excluded by 8.1); the flat torus `T^n`
as the model closed manifold of the obstruction.

### Dependencies

Layers 0–2; GeometricCurrents G1–G7; RiemannianGeometry R1, R5a–R5b; AlgebraicTopology
Stages 2–3, 6–7; DifferentialGeometry 2, 10, 12.2–12.5; GeometricTopology,
smoothing-and-triangulation comparison, item 1; UnboundedOperators UO-D06;
VariationalMethods V2.3, V5.1; ComplexKahlerGeometry K5a; PDE Lane C.

## Layer 4: spinors at infinity and the boundary mass identity

### 4.1 Asymptotically constant spinors

On an AE end of a spin manifold construct asymptotically constant orthonormal
frames (orthonormalize the coordinate frame), the comparison of spin connections
with the Euclidean one, and differentiated error bounds. Define a section to be
asymptotically constant on an end with value `v_∞` if it differs from a section
constant in such a frame by an element of `H¹_(−q)`, q=(n−2)/2 (Cecchini–Zeidler,
Definition 2.4, p. 8). For every constant model spinor construct an exterior
section and a global cutoff extension, and identify its Dirac and gradient errors.

*Needs:* SpinGeometry G3–G5; 0.1; 1.1.

**Checks.**

- On flat ℝⁿ a constant spinor is parallel, with zero Dirac and gradient errors.
- `|v_∞|` is independent of the representative: two representatives differ by a
  constant section in `H¹_(−q)`, and a nonzero constant is not in `L²_(−q)` (0.3 Checks).
- On an end of order t, `∇ψ₀ = O(r^(−t−1))` for the frame-constant section ψ₀, which lies in
  `L²_(−q−1)` exactly when t>q.

### 4.2 The boundary mass identity

Extend the SpinGeometry Dirac and Lichnerowicz identities to compact domains with
smooth boundary and to weak H¹ sections by density. With ν inward to the truncated
domain define `G_r(u) = ∫_(S_r) Re⟨u, c(ν)Du + ∇_ν u⟩ dS_g`. For asymptotically constant
solutions, `lim G_r(u) = −(n−1)|S^(n−1)| m |v_∞|²/2` (Cecchini–Zeidler, proof of
Proposition 2.5, p. 9–10; Lee–Parker, Theorem 10.3); the positive mass side is −G_r.
For weak solutions with correction in `H¹_(−q)` prove the annular cutoff, trace and error
limits; weighted H¹ membership alone does not give an all-radius trace limit, so a
justified exhaustion limit is used, and the mass remains the full radius limit.

*Needs:* SpinGeometry G5–G6; 0.2; 1.1; 4.1.

**Checks.**

- Flat ℝⁿ, u constant: `Du = 0`, `∇u = 0`, so `G_r(u) = 0` for every r, matching m=0.
- Sign: with the outward normal the limit would be `+(n−1)|S^(n−1)| m |v_∞|²/2`; the
  integrated identity `‖Du‖² = ‖∇u‖² + ∫Scal|u|²/4 + G_r(u)` on the truncated domain with
  inward ν then gives `(n−1)|S^(n−1)| m |v_∞|²/2 ≥ 0` for a harmonic spinor.
- The constant `(n−1)/2 · |S^(n−1)|` matches Cecchini–Zeidler's `(n−1)ω_(n−1)/2` with
  `ω_(n−1) = |S^(n−1)|`.

### Examples

Constant spinors on flat ℝⁿ; frame-constant spinors on spatial Schwarzschild, with
boundary term tending to `−(n−1)|S^(n−1)| m |v_∞|²/2`.

### Dependencies

Layers 0–1; SpinGeometry G3–G6.

## Layer 5: doubled Callias operators and compact-boundary problems

### 5.1 The doubled bundle and the chiral boundary condition

On `S = Σ ⊕ Σ` use the direct-sum connection, `c(ξ)(u₁,u₂) = (c_Σ(ξ)u₂, c_Σ(ξ)u₁)`,
`σ = [[0,−i],[i,0]]`, `𝓓 = [[0,D],[D,0]]` and `B_ψ = 𝓓 + ψσ` (Cecchini–Zeidler, §2.3,
equations (2.5)–(2.6), p. 7). Prove the Clifford, adjoint, parallelism and
anticommutation identities and `B_ψ² = ∇*∇ + Scal/4 + c(dψ)σ + ψ²` (Cecchini–Zeidler,
p. 8). For a compact boundary with inward unit normal ν set `χ = c(ν)σ` and impose
χu = u. Prove χ is a self-adjoint involution and the boundary condition is elliptic
and self-adjoint; construct the H¹ trace subspace, smooth density, collar extension
and trace inequality; prove the H¹ Gårding estimate from the integrated
Lichnerowicz identity; prove H¹ regularity of L² weak adjoint solutions by boundary
flattening, tangential Friedrichs mollification with commutator bounds and normal
derivative recovery, then higher regularity; identify the adjoint condition by
Green's formula and prove self-adjointness of the closure. Compare the mean
curvature with R5b's `A(X,Y) = ⟨B(X,Y),ν⟩` and fix its sign in the Green identity
before translating a source's H.

*Needs:* SpinGeometry G3–G6; ComplexKahlerGeometry K5a; PDE Lanes D–E;
RiemannianGeometry R5b; 1.1.

**Checks.**

- σ anticommutes with Clifford multiplication: `c(ξ)σ = diag(i c_Σ(ξ), −i c_Σ(ξ)) = −σ c(ξ)`;
  this kills the cross term `ψ(𝓓σ + σ𝓓)` in `B_ψ²`. With σ = identity the cross term
  would be `2ψ𝓓`.
- `σ² = 1` and `χ² = diag(−c_Σ(ν)², −c_Σ(ν)²) = 1`; χ is self-adjoint since `c_Σ(ν)` is
  skew-adjoint.
- With `c_Σ(ν) = diag(i,−i)` on ℂ², `χ = diag(−1, 1, 1, −1)` on `ℂ² ⊕ ℂ²`, so the +1
  eigenspace is spanned by `(e₂,0)` and `(0,e₁)` and the −1 eigenspace by `(e₁,0)` and
  `(0,e₂)`: each has half the rank.
- Mean-curvature sign: with H the averaged mean curvature `tr A/(n−1)` for the inward
  normal, the boundary of the unit ball has H = 1 (principal curvatures 1); the boundary
  of the exterior of the unit ball, whose inward normal points away from the origin, has
  H = −1; a flat half-space boundary has H = 0. The boundary term of the integrated
  Lichnerowicz identity is `tr A/2 = (n−1)H/2`, which fixes the normalization of η.

### 5.2 Integrated estimates

With `θ_ψ = Scal/4 + ψ² − |dψ|`, `θ̄_ψ = n Scal/[4(n−1)] + ψ² − |dψ|`,
`η_ψ = (n−1)H/2 + ψ` and `η̄_ψ = nH/2 + ψ`, H the averaged mean curvature `tr A/(n−1)` for
the inward normal, prove on a complete connected finite-ended AE spin manifold X with
compact boundary and integrable scalar curvature, for compactly supported ψ and
asymptotically constant u in `H¹_loc(X,S;χ)`:
`(n−1)|S^(n−1)|/2 · Σ_E m(E) |u|²_(E,∞) + ‖B_ψ u‖² ≥ ‖∇u‖² + ∫θ_ψ|u|² + ∫_(∂X) η_ψ|u|²`
and its twistor refinement with `n/(n−1)‖Pu‖²`, `θ̄_ψ`, `η̄_ψ` and the constant
`n|S^(n−1)|/2` (Cecchini–Zeidler, Proposition 2.5, p. 9). Construct the twistor operator
`P_ξ u = ∇_ξ u + c(ξ)Du/n` and the decomposition `|∇u|² = |Pu|² + |Du|²/n`.

*Needs:* 4.2; 5.1.

**Checks.**

- ψ=0 and no boundary: `θ_0 = Scal/4`, the Lichnerowicz potential.
- ψ=λ constant on flat space: `θ_λ = λ² > 0`.
- `ψ = λf` with `0≤f≤1`: `θ ≥ λ²f² − λ|df| ≥ −λ|df|`.
- `|∇u|² = |Pu|² + |Du|²/n` on flat ℝⁿ for `u = X v` (v constant): `∇_(e_j) u = c(e_j)v`,
  `|∇u|² = n|v|²`, `Du = −n v`, `|Du|²/n = n|v|²`, `Pu = 0`.

### Examples

The flat unit ball with the chiral condition: H = 1 and `η_0 = (n−1)/2 > 0`.

### Dependencies

Layers 0–1; Layer 4; SpinGeometry G3–G6; ComplexKahlerGeometry K5a; PDE Lanes D–E;
RiemannianGeometry R5b.

## Layer 6: weighted solvability and finite-ended spin positivity

### 6.1 Fredholm theory of the Callias operator

For q=(n−2)/2 prove the weighted Poincaré estimate of 1.1 on a finite-ended AE
manifold with nonempty ends and its compact-boundary version. Prove Fredholmness and
nonnegative index of `B_ψ : H¹_(−q)(S;χ) → L²(S)` for compactly supported ψ
(Cecchini–Zeidler, Theorem 2.12, p. 12), identify its adjoint and cokernel, and prove
the coercive estimate and surjectivity when `θ_ψ ≥ 0` and `η_ψ ≥ 0`, by the argument of
Cecchini–Zeidler's Lemma 3.4 (p. 14–15) applied to the unbarred estimate of 5.2: a kernel
element u has `|u|_(E,∞) = 0` at every end, so the estimate forces ∇u = 0, decay forces
u = 0 near infinity, connectedness forces u = 0, and nonnegative index gives
surjectivity. The lemma itself is stated for the barred potentials `θ̄_ψ ≥ 0`, `η̄_ψ ≥ 0`
and the twistor estimate. Include the small-negative-part estimate: if `η_ψ ≥ 0` and the
negative part of `θ_ψ` is supported in a connected region X₀ containing an AE end with
`‖θ_ψ⁻‖_(L^∞_(−2)) ≤ c₀(X₀,g)`, then `B_ψ` is an isomorphism and
`‖B_ψ u‖² ≥ c₀‖u‖²_(L²_(−q)(X₀))` (Cecchini–Zeidler, Theorem 4.1, p. 15–16). Surjectivity
is not inferred from injectivity alone.

*Needs:* 1.1; 1.4; 5.1–5.2.

**Checks.**

- Flat ℝⁿ with ψ=0: `𝓓` is injective on `H¹_(−q)` (a harmonic spinor decaying like
  `r^(1−n)` or faster vanishes), so index 0 gives an isomorphism.
- Flat torus with the empty end family: a parallel spinor is in the kernel and the
  weighted Poincaré estimate fails; nonemptiness is required.
- In the small-negative-part estimate, `θ_ψ⁻ = λ|df|` with `‖df‖_(L^∞_(−2))` fixed gives
  admissibility exactly for λ ≤ c₀/‖df‖_(L^∞_(−2)).
- Barred against unbarred potentials: when Scal≥0, `θ_ψ ≤ θ̄_ψ` since `n/(n−1) > 1`, and
  `η_ψ ≤ η̄_ψ` exactly when H≥0. On the exterior of the unit ball with ψ=0, H = −1 gives
  `η_0 = −(n−1)/2 > η̄_0 = −n/2`, so neither pair of sign hypotheses implies the other in
  general, and the unbarred surjectivity statement is not a restatement of the lemma.

### 6.2 Positivity and rigidity

For a specified end and model spinor, let ξ₀ be asymptotically constant and nonzero
at infinity on that end and zero on the other ends; solve `𝓓ξ = 𝓓ξ₀` with ψ=0 and set
`u = ξ₀ − ξ`, a harmonic spinor; the mass identity gives `m(E) ≥ 0` at each end
(Cecchini–Zeidler, proof of Theorem 3.1, p. 15; Witten 1981, uncertified;
Parker–Taubes 1982, uncertified). For zero mass the corrected spinors are parallel,
their values span the spinor fibres, and the Clifford curvature identities force
flatness; 2.3 gives the global Euclidean isometry.

*Needs:* 4.2; 5.2; 6.1; 2.3.

**Checks.**

- Flat ℝⁿ: ξ₀ constant, ξ=0, `u = ξ₀` parallel and mass 0.
- A parallel spinor family spanning the fibres gives `R(X,Y)u = 0` for all u, so the
  curvature acting through the spin representation is zero and R=0.
- On two-ended Schwarzschild with m>0 the identity gives `(n−1)|S^(n−1)| m |v_∞|²/2 ≥ ‖∇u‖² > 0`.

### Examples

Flat ℝⁿ (mass 0, parallel spinors); two-ended Schwarzschild (mass m>0 at each end).

### Dependencies

Layers 0–2, 4–5.

## Layer 7: one AE end and arbitrary other complete ends

### 7.1 Truncations and potentials

Let M be complete, connected, spin and without boundary, with Scal≥0 and one
specified AE end E satisfying 0.1 with integrable scalar curvature on E; no AE or
finite-end condition is imposed on the rest of M. Fix X₀ ⊂ E the complement of an
open coordinate ball, K ⊂ X₀ the closure of a collar neighborhood of ∂X₀ in X₀, a
smooth `f : X₀ → [0,1]` with f=0 on X₀∖K and f=1 near ∂X₀, and a section ξ₀ of S over
X₀, asymptotically constant on E with `|ξ₀|_(E,∞) ≠ 0` and support in X₀∖K, extended by
zero (Cecchini–Zeidler, proof of Theorem A, p. 16). The admissible class for λ>0
consists of connected complete spin codimension-zero submanifolds X_λ ⊃ X₀ with Scal≥0,
compact smooth (possibly empty) boundary, X_λ∖X₀ relatively compact, and
`dist(∂X₀, ∂X_λ) > 1/λ`, the condition holding vacuously for empty boundary; λ₀ is the
infimum of admissible λ. On the present
complete M every λ>0 is admissible, so λ₀=0; construct the X_λ from smooth proper
exhaustions, using RiemannianGeometry R7.8's Lipschitz approximation and
DifferentialGeometry 10's Sard theorem for regular boundaries.

On X_λ∖X₀ construct h_λ ≥ λ, equal to λ near ∂X₀, with `h_λ² − |dh_λ| ≥ 0` and
`h_λ + (n−1)H_λ/2 ≥ 0` on ∂X_λ for the inward normal (Cecchini–Zeidler, Lemma 3.3,
p. 14, and p. 17). Set `ψ_λ = λf` on X₀ and `h_λ` on X_λ∖X₀; it is smooth since both
pieces equal λ near ∂X₀. Then `η_λ ≥ 0`, `θ_λ ≥ 0` on X_λ∖K, and `θ_λ ≥ −λ|df|` on K. Each
X_λ has the finite-ended compact-interior geometry with nonempty ends of Layer 6.

*Needs:* 0.1; 5.1–5.2; RiemannianGeometry R7.8; DifferentialGeometry 10.

**Checks.**

- On flat ℝⁿ with `X₀ = {|x| ≥ R}` no coordinate ball is admissible, since no ball
  contains X₀. Admissible are `X_λ = ℝⁿ` (empty boundary, every λ>0) and, when
  `1/λ + ε < R`, the exterior `{|x| ≥ R − 1/λ − ε}`, whose boundary sphere has distance
  `1/λ + ε > 1/λ` from ∂X₀; both contain X₀ and have relatively compact `X_λ∖X₀`. On that
  exterior the inward normal points away from the origin, so `H = −1/(R − 1/λ − ε)` and
  `h_λ` must be at least `(n−1)/(2(R − 1/λ − ε))` on the boundary sphere.
- `supp ψ_λ ∩ supp ξ₀ = ∅`: on X₀∖K, f=0, so ψ_λ=0 where ξ₀ may be nonzero; at a point
  where ψ_λ = λ > 0 we have ξ₀ = 0, so the residual `ψ_λ σ ξ₀` vanishes. Without the
  support condition the choice `ξ₀ = (v,0)`, `|v| = 1`, at a point with `ψ_λ = λ` leaves the
  residual `(0, iλv)` of norm λ.
- Boundary potential sign: on a unit-sphere boundary bounding X_λ from outside, H = 1,
  so `η_λ ≥ 0` for every `h_λ ≥ 0`; on a boundary with H<0 the potential must be at least
  `(n−1)|H|/2`.

### 7.2 Solving, the mass estimate and rigidity

Since ξ₀ and ψ_λ have disjoint supports, `B_(ψ_λ) ξ₀ = 𝓓ξ₀`, which lies in `L²(X₀,S)`
and vanishes on K. For λ ∈ (λ₀, λ₁) with λ₁ = λ₁(X₀,g) from 6.1, solve
`B_(ψ_λ) ξ_λ = −𝓓ξ₀` with ξ_λ ∈ `H¹_(−q)(X_λ,S;χ)`. Then `u_λ = ξ₀ + ξ_λ` satisfies `B_(ψ_λ) u_λ = 0`
and `u_λ = ξ_λ` on `(X_λ∖X₀) ∪ K`. The integrated estimate of 5.2 and 6.1's coercive bound
give `(n−1)|S^(n−1)|/2 · m(E) |ξ₀|²_(E,∞) ≥ ‖∇u_λ‖² − λ‖df‖_(L^∞_(−2)) ‖𝓓ξ₀‖²/c₀`
(Cecchini–Zeidler, equations (4.4)–(4.7), p. 17–18). Letting λ→0 proves `m(E) ≥ 0`. At zero
mass, `‖∇u_λ‖_(L²(X)) → 0` on every fixed X with X∖X₀ relatively compact, the weighted
Poincaré inequality makes ξ_λ Cauchy in `H¹_(−q)(X)`, and the limits give parallel spinors
on M asymptotic to arbitrary constant spinors on E; hence a parallel frame, flatness,
and by 2.3 a global isometry with ℝⁿ, which excludes further ends without assuming
simple connectedness (Cecchini–Zeidler, proof of Theorem B, p. 18).

*Needs:* 6.1; 7.1; 2.3.

**Checks.**

- Flat ℝⁿ: take `ξ₀ = β v` with v a constant spinor and β a cutoff equal to 0 on K and 1
  near infinity; then `𝓓ξ₀ = c(dβ)v` is supported in the transition annulus, and the
  estimate gives `m ≥ −Cλ` with C independent of λ, hence m ≥ 0, consistent with m = 0.
- If `𝓓ξ₀ = 0` then ξ_λ = 0 and the estimate gives m ≥ 0 directly.
- The equality `u_λ = ξ_λ` on K uses supp ξ₀ ⊂ X₀∖K; with ξ₀ nonzero on K the negative part
  `λ|df|` would multiply the non-decaying ξ₀ and the bound by `‖ξ_λ‖_(L²_(−q))` would fail.

### Examples

Flat ℝⁿ; two-ended spatial Schwarzschild of mass m>0 with one end specified as E, the
other end entering only through completeness and Scal≥0.

### Dependencies

Layers 0–2, 4–6; RiemannianGeometry R7.8; DifferentialGeometry 10.

## Layer 8: theorems and conformal applications

### 8.1 Nonspin positive mass, 3 ≤ n ≤ 7

`exists_tendsto_mass_nonneg`: on a complete connected smooth Riemannian n-manifold,
3≤n≤7, carrying `IsRiemannianManifold`, with a `FiniteEndedAE n M t` structure of order
t>(n−2)/2, Scal≥0 and Scal integrable for `TauCeti.riemannianVolume`, the normalized flux
of every end converges and its limit is nonnegative.
`nonempty_isometryEquiv_of_mass_eq_zero`: under the same hypotheses, if the limit at
one end is 0 then M is isometric to `EuclideanSpace ℝ (Fin n)` (Schoen–Yau 2017,
Theorem 5.3; Lee–Parker, Theorem 10.1 and Lemma 10.7).

*Needs:* Layers 0–3.

### 8.2 Spin positive mass, every n ≥ 3

A complete finite-ended AE spin n-manifold, n≥3, with Scal≥0 and integrable scalar
curvature has nonnegative mass at every end, and zero mass at one end implies a
global isometry with ℝⁿ (Cecchini–Zeidler, Theorem 3.1 with empty boundary and ψ=0,
p. 13–15; Witten 1981, uncertified).

*Needs:* Layers 0–2, 4–6.

### 8.3 One AE end with arbitrary other ends

A complete connected spin n-manifold without boundary, n≥3, with Scal≥0 and one
specified AE end satisfying 0.1 with integrable scalar curvature on that end has
nonnegative mass at that end, and zero mass implies a global isometry with ℝⁿ
(Cecchini–Zeidler, Theorem B, p. 3, whose Definition 2.1 includes the integrability).

*Needs:* Layers 0–2, 4–7.

**Checks.**

- Integrability is needed for the mass to exist: on ℝ³ with `g = u⁴δ` and
  `u = 1 + (1+r²)^(−3/8)`, the metric is complete since u≥1, ℝ³ is spin, `g − δ = O_2(r^(−3/4))`
  so the end has order 3/4 > 1/2, and `Δu = (3/4)(1+r²)^(−19/8)(−r²/4 − 3) < 0` gives
  `Scal = −8u^(−5)Δu > 0` everywhere. But `Scal ≈ (3/2) r^(−11/4)` is not integrable against
  `u⁶ r² dr`, and the normalized flux of 0.2, `−w′(r) r²/2` with `w = u⁴`, equals
  `(3/2) u³ r³ (1+r²)^(−11/8) ≈ (3/2) r^(1/4)`: about 15 at r = 10⁴ and 150 at r = 10⁸, with
  no limit. Without the integrability clause the statement would assert the sign of an
  undefined number; with it, this metric is excluded.
- Spatial Schwarzschild of mass m is scalar-flat, satisfies every hypothesis, and has mass
  m; on two-ended Schwarzschild with m>0 either end may be the specified end, the other
  entering only through completeness and Scal≥0.

### 8.4 Stability and the Green blow-up corollary

The theorems are invariant under the admissible isometries and covers of 0.2. For a
complete scalar-flat metric satisfying the hypotheses of 8.1 (with its dimension) or
8.2–8.3 (with spin) and an identity `m = 2A`, A≥0, and A=0 gives Euclidean rigidity.

*Needs:* 8.1–8.3; 0.4.

**Checks.**

- Flat ℝⁿ: every hypothesis holds, the mass is 0, and the isometry is the identity.
- Two-ended spatial Schwarzschild, m>0: masses m and m, both positive; no end has mass 0.
- The flat torus has Scal=0 and no ends; it is excluded by nonemptiness, and the
  conclusion "isometric to ℝⁿ" would be false for it.
- n=8 lies outside 8.1 and inside 8.2 for spin manifolds.

### Examples

Flat ℝⁿ (equality); spatial Schwarzschild of mass m>0; the conformal blow-up
`G^(4/(n−2)) g` of a closed manifold at a point, with `m = 2A`.

### Dependencies

Layers 0–7.

## Downstream consumers

- Yamabe Y6–Y8 apply 8.1 and 8.3 to conformal Green blow-ups and verify for the actual
  Green metric the AE hypotheses and the identity `m = 2A`, including its
  normal-coordinate curvature terms; Yamabe owns the conformal developing map,
  lifted-pole completeness and the compactification of the conclusion.
- RiemannianGeometry R4.1's equality API is written for use in 2.3.

## References

- R. Arnowitt, S. Deser, C. W. Misner, *Coordinate invariance and energy expressions in
  general relativity*, Phys. Rev. 122 (1961) 997–1006: origin of the mass.
- R. Bartnik, *The mass of an asymptotically flat manifold*, Comm. Pure Appl. Math. 39
  (1986) 661–693, doi:10.1002/cpa.3160390505 (uncertified): Theorem 1.3 (weighted
  Poincaré, as cited by Cecchini–Zeidler, Proposition 2.7) and Proposition 1.6 (weighted
  elliptic estimates, as cited by Lee–Parker, proof of Theorem 9.2); the weight
  convention of 1.1.
- S. Cecchini, R. Zeidler, *The positive mass theorem and distance estimates in the spin
  setting*, arXiv:2108.11972v2: Definitions 2.1, 2.3, 2.4; equations (2.1)–(2.8);
  Propositions 2.5, 2.7, 2.8; Theorem 2.12; Lemmas 3.3, 3.4; Theorem 3.1; Theorem 4.1;
  proofs of Theorems A and B, equations (4.4)–(4.7).
- R. Camporesi, A. Higuchi, *On the eigenfunctions of the Dirac operator on spheres and
  real hyperbolic spaces*, arXiv:gr-qc/9505009v1 (J. Geom. Phys. 20 (1996) 1–18): §3,
  equation (3.44) and the odd-dimensional case, for the round-sphere multiplicities.
- M. do Carmo, *Differential Geometry of Curves and Surfaces*, Prentice-Hall 1976, §4-5:
  the global Gauss–Bonnet theorem with boundary.
- J. M. Lee, T. H. Parker, *The Yamabe problem*, Bull. Amer. Math. Soc. 17 (1987) 37–91:
  equation (1.1) and §2 (conformal law), Theorems 2.6 and 4.1 (strong maximum principle,
  regularity and positivity), Definition 8.2, Lemma 9.1, Theorems 9.2, 9.5, 9.6, Lemma 9.4,
  Theorem 10.1, Theorem 10.3 and the remark after it, Lemmas 10.6–10.7.
- J. Lohkamp, *Scalar curvature and hammocks*, Math. Ann. 313 (1999) 385–407, author's
  copy: Proposition 6.1.
- T. Parker, C. H. Taubes, *On Witten's proof of the positive energy theorem*, Comm.
  Math. Phys. 84 (1982) 223–238 (uncertified).
- R. Schoen, S.-T. Yau, *On the proof of the positive mass conjecture in general
  relativity*, Comm. Math. Phys. 65 (1979) 45–76 (uncertified): §3–§5.
- R. Schoen, S.-T. Yau, *On the structure of manifolds with positive scalar curvature*,
  Manuscripta Math. 28 (1979) 159–183 (uncertified).
- R. Schoen, S.-T. Yau, *Positive scalar curvature and minimal hypersurface
  singularities*, arXiv:1704.05490v1 (cited as Schoen–Yau 2017): §1 (mass
  normalization, p. 4), Theorems 5.1–5.3, Proposition 5.4.
- E. Witten, *A new proof of the positive energy theorem*, Comm. Math. Phys. 80 (1981)
  381–402 (uncertified).
