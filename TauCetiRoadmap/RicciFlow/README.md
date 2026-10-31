# Roadmap: Ricci flow, preserved curvature cones, and sphere theorems

**Summary.** Build Ricci flow on closed smooth real manifolds, from the actual space of
Riemannian metrics and the Ricci–DeTurck initial-value problem to curvature pinching and smooth
convergence. The end theorems are Hamilton's positive-Ricci theorem in dimension three,
Böhm–Wilking's 2-positive-curvature-operator theorem in dimensions at least three, Brendle–Schoen's
pointwise quarter-pinched theorem in dimensions at least four, the positive-Gauss-curvature surface
theorem, and the global quarter-pinched sphere theorem in every dimension at least two. The basic
library on the way includes metric variations, scaling and normalization, short-time existence,
uniqueness, maximal intervals, curvature continuation, derivative estimates, tensor maximum
principles, algebraic curvature cones, pinching sets, smooth metric convergence, and naturality
under isometries and coverings. Every convergence theorem specifies an actual limit metric on the
original smooth manifold; a subsequential limit after changing coordinates is an intermediate
construction, not the final convergence statement.

## Scope and ownership

This roadmap owns, on closed finite-dimensional smooth real manifolds:

- the metric-family calculus of Layer 1 (the symmetric two-tensor subbundle, interval families of
  smooth metrics with joint regularity, variation formulas, the Lie derivative of covariant
  two-tensors, scaling, volume normalization and solitons);
- the closed-bundle parabolic theory of Layer 2 (parabolic Hölder spaces of bundle sections, the
  closed-bundle Schauder estimate, the spectral base solution and its comparison with the weak
  theory, coefficient continuation, the quasilinear scalar-principal tensor theorem) and the
  DeTurck gauge, short-time existence and forward uniqueness of Ricci flow;
- maximal flows, Shi's derivative estimates and curvature continuation (Layer 3);
- the curvature evolution equations, the moving-frame comparison, the scalar and convex-bundle
  maximum principles on an evolving closed manifold and the finite-dimensional ODE invariance
  criterion (Layer 4);
- the algebraic curvature tensors, the reaction tensor, the curvature cones (nonnegative and
  2-nonnegative operator, nonnegative sectional, PIC, PIC2), the Böhm–Wilking deformation and the
  Brendle–Schoen PIC2 family (Layer 5);
- pinching sets, the Klingenberg injectivity estimate from a pinching hypothesis, the Cheeger–Ebin
  path-deformation lemma on finite-vertex path models, the global roundness and fixed-manifold
  smooth convergence arguments (Layer 6);
- the sphere theorems of Layers 7 and 8, their space-form and equivariance consequences, and the
  surface potential, Harnack, entropy and soliton-rigidity arguments.

It leaves to named roadmaps, and consumes from them:

- [RiemannianGeometry](../RiemannianGeometry/README.md) R1 (the curvature, Gram and exterior
  dictionaries and the curvature operator on the bivector bundle), R2–R3 (Jacobi fields, second
  variation, finite broken-geodesic path models), R4 (Rauch and Günther comparison, Myers, the
  injectivity-radius carrier of item 6, Schur's theorem and the Killing–Hopf space-form
  classification of item 7) and R7.0 (the scalar Bochner identity). The curvature operator on
  bivectors is RiemannianGeometry R1's object on SmoothBundlesConnections B2's exterior square;
  this roadmap compares its four-tensor carrier with it and never builds a second one.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B2–B4 (tensor, dual and Hom
  bundles, frames, fibre metrics and induced connections).
- [DifferentialGeometry](../DifferentialGeometry/README.md) 2.3–2.4 (covering maps and the
  orientation double cover), 3.5 (time-dependent flows) and Layer 5 (integration, densities and
  Stokes).
- [PDE](../PDE/README.md) Lane F items 24–25 (Bochner spaces, the Gelfand triple, Galerkin
  existence for linear parabolic equations) and F27.1–F27.5 (the scalar Euclidean parabolic
  Schauder model).
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K5a (bundle Sobolev spaces, the
  compact pair `H¹ ⊂ L²` and Sobolev embeddings on compact manifolds).
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md) P1 (differential
  operators and scalar jets), P5 (Hölder spaces of bundle sections, §5.4), P6 (elliptic regularity)
  and P7 (powers of `1 + ∇*∇` and their Sobolev domains, §7.1).
- [VariationalMethods](../VariationalMethods/README.md) Layers 1–5 (compact form pairs, the
  kernel-orthogonal Poincaré connector of §3.4, Courant–Fischer of §4.4 and the differential-energy
  adapter of §5.3).
- [MorseTheory](../MorseTheory/README.md) M1–M3 (critical Hessians, compact-band deformation and
  handles, relative `C²` Morse approximation).
- [HopfRinow](../../Completed/HopfRinow/README.md) (geodesics, exponential maps, completeness and
  smooth dependence) and [UniversalCovers](../../Completed/UniversalCovers/README.md) (the universal
  cover and its deck group).

Ricci flow with surgery, geometrization and Kähler–Ricci flow are not part of this roadmap; the
convergence theorems here are the inputs of [Poincare3D](../Poincare3D/README.md) and
[GeometricTopology](../GeometricTopology/README.md), which cite Layers 1–5 and the sphere theorems.
Every claim that a cited convergence result holds is proved through Layers 6 and 8's explicit
estimates and comparison maps, never used as an additional hypothesis.

## Conventions

Work on finite-dimensional smooth real boundaryless manifolds; closed means compact and
boundaryless. Connectedness and nonemptiness are imposed for volume averages and space-form
conclusions. Existence applies to disconnected closed manifolds componentwise, with a common short
time. Curvature and cone calculations use real tensor spaces; complexified isotropic descriptions
are compared with their real four-frame inequalities.

A smooth metric is Mathlib's `ContMDiffRiemannianMetric I ∞ E (fun x => TangentSpace I x)`,
abbreviated `SmoothMetric`. Its `inner`, symmetry, positivity and smoothness fields are the
metric data; `toRiemannianMetric` supplies the local `RiemannianBundle` and
`IsContMDiffRiemannianBundle` instances. A fixed smooth reference metric `ḡ` sets section norms and
charts, while each evolving metric determines its own Levi-Civita connection, contractions and
volume. Changing a metric never changes the smooth manifold or silently changes the topology of a
section space. Time-dependent metrics are sections of `Sym²T*M` on an interval, with the native
metric object at each time. Interval equality is the equality of these restrictions; values
outside an interval are not flow data.

Use the existing `CovariantDerivative.leviCivitaConnection`, `curvatureTensor`, `ricciTensor` and
`scalarCurvature`, with the metric's instance installed locally as in `metricRicci`,
`metricScalar` and `metricSectional`. The curvature convention is

`R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`,

and `Ric(u,v) = tr(w ↦ R(w,u)v)`. Write the four-tensor `r(u,v,z,w) = g(R(u,v)w,z)`. Thus
`r(u,v,u,v)` is positive on the unit sphere, and the bivector curvature operator is characterized
by `⟨Rop(u∧v), z∧w⟩ = r(u,v,z,w)`; its value on constant curvature `κ` is `κ Id`. Sectional
curvature on linearly independent `u, v` is `r(u,v,u,v)/det Gram(u,v)`; Tau Ceti's
`sectionalCurvature` extends it by a junk value to dependent pairs, so every sectional-curvature
hypothesis quantifies over `LinearIndependent ℝ ![u, v]`.

The tensor heat generator is `L_g = tr_g ∇²`, with scalar restriction `div grad`. It is the
negative of the positive rough and Hodge Laplacians used in ComplexKahlerGeometry and
PseudodifferentialOperators. In PseudodifferentialOperators' Fourier convention its principal
symbol is `−|ξ|² Id`; the real geometric symbol is `+|ξ|² Id`. Uniform parabolicity means
positivity of the real principal coefficient, not positivity of this Fourier symbol.

Unnormalized flow is `∂_t g = −2 Ric(g)`. Volume-normalized flow, for `n ≥ 1`, is
`∂_τ g = −2 Ric(g) + (2/n) r̄(g) g`, with `r̄ = Vol(g)⁻¹ ∫ Scal(g) dμ_g`. In dimension zero the
normalized flow is stationary, with `r̄ = 0` and no `2/n` term; dimension one is stationary because
curvature vanishes. Moving orthonormal frames satisfy `∂_t e = Ric# e` in the unnormalized flow and
`∂_τ e = (Ric# − (r̄/n) Id) e` in the normalized flow. The curvature-operator equation is

`D_t Rop = L_g Rop + Q(Rop)`, `Q(R) = 2(R² + R#)`.

Here `R# = ad ∘ (R∧R) ∘ ad*` after identifying `Λ²E` with `so(E)`, with scalar product
`−½ tr(AB)` on `so(E)`. Write `Id_E` for the identity on `E` and `I = Id_E ∧ Id_E` for the identity
curvature operator on `Λ²E`, the curvature of the unit sphere. Normalize `I# = (n−2) I`.
Böhm–Wilking's algebraic vector field is `X = Q/2`; formulas for its deformation discrepancy acquire
a factor of two when used for `Q`. Normalized flow adds `−(2r̄/n) Rop`.

PIC names the closed cone of nonnegative isotropic curvature and "positive isotropic curvature" its
strict form; PIC2 is nonnegative isotropic curvature of the zero extension to `E ⊕ ℝ²`. A pinching
family is a continuous family of closed convex `O(n)`-invariant cones as defined in 6.1. Pointwise
strict quarter pinching at `x` means `0 < K_x(π) < 4 K_x(π′)` for all two-planes `π, π′` at `x`;
global quarter pinching means fixed constants `0 < a ≤ K ≤ b < 4a` over all points.

## Exact supplier contracts

| Supplier | Exact interface consumed |
| --- | --- |
| Mathlib, at the pin | `ContMDiffRiemannianMetric` (`inner`, `symm`, `pos`, `isVonNBounded`, `contMDiff`), `Bundle.ContMDiffRiemannianMetric.toRiemannianMetric` and its `IsContMDiffRiemannianBundle` instance; `CovariantDerivative.leviCivitaConnection` and `CovariantDerivative.isMetricCompatible_leviCivitaConnection`; `ContinuousMultilinearMap` with `ContinuousMultilinearMap.mkPiAlgebraFin` and `compContinuousLinearMap`; `innerSL`, `stdOrthonormalBasis`, `OrthonormalBasis`; `exteriorPower`; `LinearMap.IsSymmetric` and the finite-dimensional spectral theorem; `InnerProductSpace.instLaplacian` (notation `Δ`) and `InnerProductSpace.laplacianWithin`; `ConvexCone`, `ProperCone` (the closed submodule over `ℝ≥0`, containing zero, not necessarily salient) and `ProperCone.map`; `tangentConeAt ℝ≥0`; Picard–Lindelöf; `ContMDiffOn`, `HasDerivWithinAt`, `Diffeomorph`; `SimplyConnectedSpace`; the charted-space and `IsManifold (𝓡 n)` instances of `Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1`. |
| Tau Ceti, at the pin | `CovariantDerivative.curvatureTensor` (Lee's sign convention, equal to the one above), `CovariantDerivative.ricciTensor`, `CovariantDerivative.scalarCurvature`, `CovariantDerivative.sectionalCurvature`, `CovariantDerivative.HasConstantSectionalCurvature`, `Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor` (`R(w,u)v = κ(⟪u,v⟫w − ⟪w,v⟫u)` for the Levi-Civita connection of a smooth metric), the metric-compatible curvature symmetries, the Ricci and scalar trace formulas in orthonormal bases, `contMDiffOn_leviCivitaConnection` and the `ContMDiffCovariantDerivative` instance of the Levi-Civita connection, `TauCeti.riemannianVolume` and the canonical density, `TauCeti.Manifold.contMDiffOn_maximalIntegralCurve` and the compact-manifold flows. The `Riemannian/MetricVariation` files concern total variation of paths, not derivatives of metric families: the metric-family derivatives are Layer 1 targets. |
| RiemannianGeometry | R1 (curvature/Gram/exterior dictionaries, normal-coordinate jets, the curvature operator on `Λ²TM`, Schur's theorem), R2 (Jacobi fields), R3 (second variation, index forms; R3.2 finite broken geodesics, subdivision/straightening, node-value Hessians and the Morse index theorem; the no-critical-value deformation and compact-band comparison), R4 (item 1 Rauch and Günther comparison, item 5 Bonnet–Myers, item 6 the injectivity radius `inj`, item 7 the round models and the Killing–Hopf classification of complete constant-curvature manifolds), R7.0 (the scalar Bochner identity and the first positive eigenvalue). |
| SmoothBundlesConnections | B2 (associated, tensor, dual and Hom bundles, fibre metrics, frames, the exterior square `Λ²TM`), B3 (induced connections on associated bundles), B4 (curvature and the exterior covariant derivative). |
| DifferentialGeometry | 2.3 (smooth structures on covers), 2.4 (the orientation double cover), 3.5 (`exists_timeDependentFlow`, time-dependent flows and their suspension), Layer 5 (integration of densities, Stokes). |
| PDE | Lane F item 24 (Bochner spaces `L²(0,T;V)`, `H¹(0,T;V*)`, the Gelfand triple `V ↪ H ↪ V*`), item 25 (Galerkin existence and uniqueness for `∂_t u + Lu = f`, `u(0) = u₀`), F27.1 (Euclidean parabolic Hölder spaces, interpolation and absorption), F27.2 (constant-coefficient kernel derivative and cancellation estimates, trace attainment, linear coordinate changes), F27.3 (freezing, cutoff localization, the method of continuity), F27.5 (higher-order estimates). |
| ComplexKahlerGeometry | K5a (`BundleSobolev`, the real compact pair `H¹ ⊂ L²`, Sobolev embeddings and elliptic regularity on compact manifolds). |
| PseudodifferentialOperators | P1 (differential operators, scalar jets and symbols), P5 (§5.4 Hölder spaces `C^(k,α)` of bundle sections on a compact base), P6 (elliptic regularity and solvability), P7 (§7.1 powers of `1 + ∇*∇` and their Sobolev domains). |
| VariationalMethods | Layers 1–5: compact form pairs (§3.1), the kernel-orthogonal Poincaré connector (§3.4), successive minima and Courant–Fischer (§4.4), the represented operator and the differential-energy adapter (§5.3). |
| MorseTheory | M1 (critical Hessians and indices), M2 (compact-band deformation, handles and the handle homeomorphism), M3 (relative `C²` Morse approximation). |
| HopfRinow (completed) | geodesics, exponential maps, completeness, smooth dependence on data. |
| UniversalCovers (completed) | the universal cover, its deck group and the identification with `π₁`. |

Every declaration named in this table is consumed, never restated. The closed-bundle and
Ricci-specific adapters are owned here; the cited scalar and linear provider contracts are
prerequisites for those adapters. Elliptic estimates or a static eigenbasis alone are not a
time-dependent existence theorem: Layer 2 proves one.

## How to read the build

The construction order is Layer 1 (metric families and variations), Layer 2 (parabolic foundations
and the DeTurck gauge), 5.1–5.2 (algebraic curvature carriers and the reaction tensor), 4.1–4.3
(curvature evolution, maximum principles, the ODE criterion), Layer 3 (maximal flows, Shi
estimates, continuation), 5.3–5.6 (cones, deformations, PIC2, quarter pinching), then Layers 6–8.
Layer 1's metric-family equation predicate is available before curvature evolution; Layer 3 adds
maximal intervals and estimates. Layer 6 turns an invariant pinching set into global roundness and
smooth convergence; Layer 7 applies it to 2-positive operators and PIC2 interiors; Layer 8 treats
surfaces separately and assembles the global quarter-pinched theorem in every dimension.

## Layer 1: metric families and variation calculus

### 1.1 Section and metric API (R1.1)

Construct `Sym²T*M` as the symmetric subbundle of the bilinear Hom bundle of SmoothBundlesConnections
B2, the image of the smooth fibre idempotent `B ↦ (B + Bᵀ)/2`. Prove the image/kernel splitting,
constant rank `n(n+1)/2`, closed fibre submodules, smooth local symmetric-matrix frames, transition
maps and the evaluation and contraction API. Compare its sections literally with the symmetric
native fibre continuous bilinear maps and with `SmoothMetric` objects. This metric subbundle is
distinct from PseudodifferentialOperators P1's jet carrier; construct their canonical fibre
symmetrization and evaluation comparison. For scalar second jets identify the kernel of `J² → J¹`
with this symmetric cotangent fibre, pinning the Hessian versus Taylor-coefficient factor `1/2`. A
connection supplies a splitting of the full jet sequence; do not assume a canonical inclusion of
lower jets.

On this carrier construct interval metric families with joint space/time regularity
(`IsSmoothMetricFamilyOn`), evaluation and restriction, translation of time, reparametrization,
pullback and positive scaling. Prove the positive-definite metrics form an open cone in the `C^k`
and `C^(k,α)` section spaces on a compact base, with explicit uniform two-sided bounds against the
reference metric `ḡ`. Include smooth inverse metrics, musical maps, orthonormal-frame changes,
contractions, induced tensor metrics and equivalence of all fixed-time norms. Positivity holds on
every nonzero tangent vector, not only on a chosen basis.

- The symmetrization idempotent fixes symmetric bilinear forms, kills antisymmetric ones, and its
  image bundle has rank `n(n+1)/2` with symmetric-matrix local frames.
- A family is in `IsSmoothMetricFamilyOn g s` exactly when the coefficient map `(t,x) ↦ g_t(x)`
  is smooth as a section over `s × M`; smoothness of each `g_t` separately does not suffice.
- On a compact base the positive-definite sections are open in every `C^k` and `C^(k,α)` norm,
  and each has uniform constants `λ ḡ ≤ g ≤ Λ ḡ`.
- Inverse metrics, musical isomorphisms, contractions and induced metrics on tensor bundles are
  smooth in the metric, with norm bounds in terms of `λ, Λ` and the `C^k` norm of `g`.

**Checks.**

- In dimension two the symmetric subbundle has rank `3` and in dimension three rank `6`; a
  definition using `(B − Bᵀ)/2` would give ranks `1` and `3` and its image would contain no metric.
- The matrix `[[1, 2], [2, 1]]` has positive diagonal entries but determinant `−3`: it is not a
  metric, so a positivity test on basis vectors alone admits a non-metric.
- For `f(x) = x²` on `ℝ` the Hessian at `0` is `2` and the second Taylor coefficient is `1`: the
  identification of `ker(J² → J¹)` with `Sym²T*` carries the factor `1/2`.
- The family `g_t = (1 + t) ḡ` on `ℝ` is in `IsSmoothMetricFamilyOn` on every interval; the family
  `g_t = (1 + |t|) ḡ` is smooth at each time but not jointly smooth at `t = 0`.

*Needs:* SmoothBundlesConnections B2 (Hom and tensor bundles, frames); Mathlib
`ContMDiffRiemannianMetric`, `ContMDiffOn`; PseudodifferentialOperators P1 (scalar jets) for the
jet comparison only.

### 1.2 Variations (R1.2)

For `h = ∂_t g` prove `∂_t g⁻¹ = −g⁻¹ h g⁻¹`, `∂_t dμ_g = ½ tr_g(h) dμ_g`, and
`∂_t Γ^k_ij = ½ g^kℓ (∇_i h_jℓ + ∇_j h_iℓ − ∇_ℓ h_ij)` (Topping, Propositions 2.3.1 and 2.3.9,
pp. 28–31). Define the connection difference as the native tensorial difference of two
`CovariantDerivative`s, prove its chart expression, and derive the curvature, Ricci, scalar and
Laplacian variations; in particular `∂_t Scal = −⟨h, Ric⟩ + div div h − L_g tr_g h` (Topping,
Proposition 2.3.12, p. 32). Construct `L_X` on covariant two-tensors by the derivative of pullback
along DifferentialGeometry 3.5's local flow and prove its tensorial coordinate formula and
`(L_X g)(Y,Z) = g(∇_Y X, Z) + g(Y, ∇_Z X)`. Derive Lie differentiation and
`∂_t(φ_t* g_t) = φ_t*(∂_t g_t + L_(∂_tφ_t ∘ φ_t⁻¹) g_t)`. Prove that differentiating an integral
includes the volume-variation term; the formulas apply to densities without an orientation
assumption. Include product, restriction, pullback and scaling compatibility and quantitative
estimates on all these maps between the stated section spaces.

- The inverse, volume, Christoffel, curvature, Ricci and scalar variations hold for every smooth
  metric family on an interval, with `h` the time derivative.
- `L_X g` is a symmetric covariant two-tensor depending on the first derivatives of `X`, given by
  the displayed formula, and it vanishes exactly on Killing fields.
- The pullback-variation formula holds for every smooth time-dependent diffeomorphism family.

**Checks.**

- For `g_t = c(t) g₀`: `g_t⁻¹ = c⁻¹ g₀⁻¹` has derivative `−c′ c⁻² g₀⁻¹ = −g⁻¹ h g⁻¹`; `dμ_g =
  c^(n/2) dμ₀` has derivative `(n c′/2c) dμ_g = ½ tr_g(h) dμ_g` since `tr_g h = n c′/c`; the
  Christoffel variation is `0` because `h = c′ g₀` is parallel, and `∂_t Scal = −c′ c⁻² Scal₀`
  equals `−⟨h, Ric⟩_g = −c′ c⁻² g₀^(ab) Ric_ab`, the other two terms vanishing.
- On Euclidean space with the radial field `X = x`, `∇_Y X = Y`, so `L_X g = 2g`; the opposite
  sign convention would give `−2g` and is excluded.
- A rotation field on the round sphere has `L_X g = 0`; the formula gives
  `g(∇_Y X, Z) + g(Y, ∇_Z X) = 0` by skew-symmetry of `∇X`.
- With `g_t = g` constant and `φ_t` the flow of `X`, the pullback formula reduces to
  `∂_t(φ_t* g) = φ_t*(L_X g)`.

*Needs:* 1.1; DifferentialGeometry 3.5 (flows) and Layer 5 (densities); Tau Ceti `curvatureTensor`,
`ricciTensor`, `scalarCurvature`; RiemannianGeometry R1 (curvature dictionaries).

### 1.3 Scaling and normalization (R1.3)

Prove constant scaling `g ↦ c g` preserves the connection and the covariant Ricci tensor, while
scalar and sectional curvature scale by `c⁻¹` and volume by `c^(n/2)`. For `n ≥ 1` and an
unnormalized flow `g(t)`, define `a(t) = (Vol(g₀)/Vol(g(t)))^(2/n)` and `τ(t) = ∫₀ᵗ a(s) ds`, and
prove `ĝ(τ(t)) = a(t) g(t)` solves the volume-normalized equation (Topping, §1.2.3, p. 11).
Construct the inverse time change on its image, initial normalization and maximal-interval
comparisons. Include `c g(t/c)` as parabolic scaling and time translation. Every later claim that
normalized time tends to infinity proves that fact, rather than identifying finite unnormalized and
infinite normalized intervals by notation.

- Scaling laws for connection, Ricci, scalar, sectional curvature, volume and `|Rm|`.
- The normalized family has constant volume `Vol(g₀)` and satisfies
  `∂_τ ĝ = −2 Ric(ĝ) + (2/n) r̄(ĝ) ĝ`.
- Parabolic scaling and time translation map Ricci flows to Ricci flows.

**Checks.**

- On the round sphere of radius `ρ`, `g = ρ² g₁` and `K = ρ⁻²`: sectional curvature scales by
  `c⁻¹` with `c = ρ²`.
- For the shrinking Einstein solution `g(t) = (1 − 2λt) g₀` in dimension `n`,
  `Vol(g(t)) = (1 − 2λt)^(n/2) Vol(g₀)`, so `a(t) = (1 − 2λt)⁻¹` and `ĝ = a g = g₀` is stationary,
  as the normalized equation requires for an Einstein metric.
- In the same example `τ(t) = −(2λ)⁻¹ log(1 − 2λt) → ∞` as `t ↑ 1/(2λ)`: finite unnormalized
  lifetime, infinite normalized lifetime.
- If `g(t)` is a Ricci flow then `∂_t(c g(t/c)) = g′(t/c) = −2 Ric(g(t/c)) = −2 Ric(c g(t/c))`
  because Ricci is scale invariant.

*Needs:* 1.1, 1.2; DifferentialGeometry Layer 5 (volume).

### 1.4 Examples and solitons (R1.4)

Compute the Einstein solutions `g(t) = (1 − 2λt) g₀` for `Ric(g₀) = λ g₀` on their positive-scale
interval (Topping, §1.2.1, p. 8) and the stationary volume-normalized solution. Include round
spheres, flat metrics, products with independent scale factors, and dimensions zero and one.
Define Ricci solitons by `Ric + ½ L_X g = λ g` and gradient solitons by `Ric + Hess f = λ g`
(Topping, equation (1.2.4), p. 10); construct their scaling/pullback flow and the converse
self-similar comparison. Normalize `λ` by scaling, record gradient-potential additive constants
and completeness hypotheses on `X`, and distinguish a metric limit from a soliton limit in moving
coordinates. Layer 8 proves the closed-surface soliton rigidity.

- Einstein metrics give explicit flows; the flow is unique by 2.4.
- A gradient soliton is a soliton with `X = grad f`, since `L_(grad f) g = 2 Hess f`.
- Solitons generate self-similar flows `g(t) = (1 − 2λt) φ_t* g` and conversely.

**Checks.**

- The round unit `Sⁿ` has `Ric = (n−1) g`, so `λ = n − 1` and the flow dies at `T = 1/(2(n−1))`:
  `T = 1/2` for `S²`, `T = 1/4` for `S³`.
- A flat metric is stationary; a product `S² × S²` with radii `ρ₁ ≠ ρ₂` has two factor lifetimes
  `ρ_i²/2`, and the flow dies at the smaller one.
- The Gaussian soliton `(ℝⁿ, g_eucl, f = λ|x|²/2)` has `Hess f = λ g` and `Ric = 0`, so it is a
  gradient soliton with constant `λ`; the sign convention `Ric − Hess f = λ g` would need `−f`.
- In dimension one every metric has `Ric = 0`; the flow is stationary and the normalized flow has
  `r̄ = 0`.

*Needs:* 1.2, 1.3; Tau Ceti round-sphere and constant-curvature instances; RiemannianGeometry
R4 item 7 (round models).

### Examples

Round spheres and their lifetimes `1/(2(n−1))`, flat tori, products with independent scale
factors, the Gaussian soliton, the stationary normalized Einstein flow.

### Dependencies

Layer 1 uses Mathlib's smooth Riemannian metrics and manifold derivatives, Tau Ceti's
Levi-Civita connection and curvature traces, SmoothBundlesConnections B2, DifferentialGeometry 3.5
and Layer 5, and RiemannianGeometry R1 and R4 item 7. It uses nothing from Layers 2–8.

## Layer 2: compact-bundle parabolic foundations and DeTurck gauge

### 2.1 Parabolic section spaces (R2.1)

For `0 < α < 1` construct the Banach spaces `C^(α,α/2)` and `C^(2+α,1+α/2)` of sections of a
smooth finite-rank real bundle over `M × [0,T]`, using finite smooth frames and the parabolic
distance `|x − y| + |t − s|^(1/2)` (the Euclidean model is PDE F27.1). Include the complete norm,
closed symmetry subspaces, endpoint trace, restriction, multiplication, contraction and composition,
interpolation, adjacent-slab gluing (the combined parabolic Hölder seminorm is bounded by the two
slab norms when the traces match), partition and chart-change estimates. Compare time slices with
PseudodifferentialOperators P5's spatial Hölder objects (§5.4). Define higher parabolic regularity
and compact inclusions into strictly lower exponents.

Build the smooth one-sided-time extension used by 2.4 on a compact slab. In each fixed bundle frame
use negative dyadic numbers `b_k` and coefficients `a_k` with `Σ_k a_k b_k^j = 1` for every
`j ≥ 0` and `Σ_k |a_k| |b_k|^j < ∞`; construct them by finite polynomial interpolation and uniform
summability estimates. For `t < 0` use `Σ_k a_k χ(b_k t) u(b_k t)`, where `χ` is one near zero and
supported inside the positive slab. Prove every mixed space/time jet matches at zero, locally
finite sums away from zero, uniform differentiated convergence at zero, and compatibility and
gluing under fixed smooth frame changes. Open metric positivity persists on a sufficiently small
negative slab. Coefficients are actual tensors, not an unspecified predicate of being parabolic.

- The parabolic Hölder spaces are Banach, independent of the finite frame and atlas up to
  equivalent norms, and their fixed-time slices are P5's `C^(k,α)` spaces.
- Products, contractions and compositions with smooth fibre maps are bounded with explicit
  constants; interpolation controls intermediate norms by an arbitrarily small multiple of the top
  norm plus a `C⁰` norm.
- The one-sided extension is a bounded linear map `C^(2+α,1+α/2)(M × [0,T]) →
  C^(2+α,1+α/2)(M × [−T′,T])` that is the identity on `[0,T]` and preserves smoothness.

**Checks.**

- `u(x,t) = |t|^(1/2)` lies in `C^(α,α/2)` for every `α < 1` but not in `C^(2+α,1+α/2)`, which
  requires a time derivative; `u(x,t) = t` lies in both.
- The two-term extension with `b₁ = −1`, `b₂ = −2` needs `a₁ + a₂ = 1` and `−a₁ − 2a₂ = 1`, so
  `a₁ = 3`, `a₂ = −2`: `3u(−t) − 2u(−2t)` has one-sided value `u(0)` and derivative
  `(−3 + 4) u′(0) = u′(0)` at zero, while the one-term reflection `u(−t)` flips the derivative.
- Gluing the slabs `[0,1]` and `[1,2]` with matching traces gives a section on `[0,2]` whose
  parabolic seminorm is at most the sum of the slab seminorms; without matching traces the glued
  section is not even continuous.
- A frame change by a smooth invertible matrix function multiplies every norm by at most a
  constant depending on its `C^(2,α)` norm.

*Needs:* PDE F27.1; PseudodifferentialOperators P5 (§5.4); SmoothBundlesConnections B2 (frames);
1.1.

### 2.2 Linear solution and Schauder theory (R2.2)

Fix a smooth fibre metric and compatible connection `∇̄` on the real bundle, using `ḡ`'s
Levi-Civita connection on cotangent factors; then `Δ⁺_ḡ = ∇̄*∇̄ = −tr_ḡ ∇̄²` is the operator of the
form `q(u,v) = ∫⟨∇̄u, ∇̄v⟩`. For

`∂_t u − a^ij(x,t) ∇̄_i∇̄_j u − B^i(x,t) ∇̄_i u − C(x,t) u = f`,

assume a symmetric real principal tensor `a ∈ C^(α,α/2)` with a specified norm bound and
`λ |ξ|²_ḡ ≤ a(ξ,ξ) ≤ Λ |ξ|²_ḡ`, `λ > 0`; its principal action on the bundle is scalar times `Id`.
Lower terms are bundle endomorphisms with specified Hölder norm bounds. Prove the global initial
Schauder estimate

`‖u‖_(2+α,1+α/2) ≤ C (‖f‖_(α,α/2) + ‖u₀‖_(2+α))`,

and the corresponding interior and higher estimates, with `C` controlled by `λ, Λ`, the parabolic
Hölder norms of `a, B, C`, the atlas and a fixed upper bound `T₀` for `T`. For the Euclidean
component estimate extend `a` and the forcing constantly from `T` to `T₀`, preserving their Hölder
bounds, solve on the fixed slab, and restrict using scalar uniqueness; this gives constants uniform
for `0 < T ≤ T₀`.

In each local bundle frame apply F27.3 componentwise to the localized section `χu` with scalar
operator `∂_t − a^ij ∂_i∂_j`, taking its scalar lower coefficients to be zero. Extend the
coordinate principal matrix to all of Euclidean space by a smooth cutoff convex blend with a fixed
positive matrix, the cutoff being one on a neighbourhood of the support of `χ`; prove uniform
ellipticity and parabolic Hölder bounds for this extension. Move the coupled connection, frame,
`B` and `C` terms and the cutoff commutators into the componentwise forcing; bound them in
`C^(α,α/2)` by interpolation with an arbitrarily small multiple of the `C^(2+α,1+α/2)` norm plus a
controlled `C⁰` norm, and absorb the small multiple using F27.1. Prove uniform coefficient bounds
and Hölder regularity under the finite frame and chart changes, compare the component norms with
2.1's intrinsic norms, and patch the estimates on the compact base. The preliminary global estimate
contains `‖u‖_C⁰`; remove it by `‖u‖_C⁰ ≤ ‖u₀‖_C⁰ + T ‖∂_t u‖_C⁰` in the fixed reference fibre
norms, absorb on a sufficiently small uniform slab, then iterate using 2.1's endpoint and gluing
estimates. The final constant is uniform on the whole coefficient-continuation path and each fixed
upper bound for `T`.

Construct the base solution for `∂_t u + Δ⁺_ḡ u = f` on this closed real bundle using a real
countable (possibly finite) orthonormal eigenbasis indexed by `ι`. Construct that basis from
VariationalMethods §4.4 and §5.3 on ComplexKahlerGeometry K5a's real compact pair `H¹ ⊂ L²`, with
`q(u,v) = ∫⟨∇̄u, ∇̄v⟩` and the coercive shifted form `q + ⟨u,v⟩`. Prove its eigenvectors are smooth
by K5a and PseudodifferentialOperators P6 regularity and that its partial operator is the rough
Laplacian by the distributional energy identity. If `λ_i` are the eigenvalues of P7's shifted
`L = 1 + ∇̄*∇̄`, use `μ_i = λ_i − 1 ≥ 0` for `Δ⁺_ḡ`; compare real and complexified forms and the
finite kernel. The `i`th heat coefficient is `exp(−μ_i t)(u₀)_i + ∫₀ᵗ exp(−μ_i(t−s)) f_i(s) ds`.
Prove convergence in `C⁰_t L² ∩ L²_t H¹`, the `L²_t H⁻¹` derivative and trace, and the weak
equation by energy estimates on finite spectral sums. Compare the finite coefficient ODEs with PDE
item 25's Galerkin interface, using a finite-dimensional real trial space and a trial map injective
into the pivot `L²`; that interface is autonomous with continuous forcing, and Hölder forcing is
continuous into `H⁻¹`, so endpoint-constant extension gives the globally continuous forcing its
unique global `C¹` coordinate solution needs. This comparison does not assert a nonautonomous
Galerkin result.

Identify the spectral solution with PDE item 25's weak solution. On the real pair `H¹ ⊂ L²` supply
the complete form space, the continuous injective dense pivot inclusion, the a.e. measurable bounded
energy form and the quantitative Gårding bound with positive coercivity coefficient; the lower-bound
shift may have either sign; use `L²(0,T;H⁻¹)` forcing and the `L²` initial datum. Density of the
pivot inclusion makes the initial boundary pairing detect the full datum rather than only its
projection onto the pivot range closure. The weak conclusion is an `L²(0,T;H¹)` representative
satisfying the terminal-zero `C¹`-test integral identity. Test against each eigenvector times a
`C¹` scalar function with terminal value zero, recover the unique one-dimensional weak coefficient
ODE and its initial boundary value, and use basis completeness to prove a.e. equality. This
comparison supplies the weak solution's `L²(0,T;H⁻¹)` time derivative (the Gelfand-triple derivative
of item 24) and its `C⁰([0,T];L²)` representative with exact pivot trace; neither is part of the
weak integral conclusion itself, and this roadmap owns both.

For smooth initial data and forcing, use the spectral characterization of every power of
`1 + ∇̄*∇̄` from P7 (§7.1) to prove convergence of the heat series in every spatial `H^(2k)`,
uniformly on compact time slabs. Differentiate the coefficient ODEs to obtain the same control for
time derivatives; K5a's Sobolev embeddings then give joint smoothness, including the one-sided
initial jets. This constructs a smooth solution to which the closed-bundle Schauder estimate
applies and identifies it with the weak solution by the coefficient uniqueness just proved. For
general Hölder data use smooth approximations uniformly bounded in the stated `α` norms and
converging at each strictly lower `β` exponent (smooth functions need not be dense in the full `α`
Hölder norm); compactness at `β` and lower semicontinuity of the `α` seminorm give the stated
initial Schauder solution. Continue from this base operator along the convex interpolation of
positive principal tensors and lower coefficients: uniform estimates and operator-norm continuity
give open and closed solvability and the bounded initial-value inverse. Prove uniqueness for the
Hölder nondivergence operator from the absorbed Schauder estimate applied to zero data; energy and
Gronwall are used for the smooth metric-compatible base, not by differentiating a merely Hölder
`a`. Include the bounded initial-value inverse and parameter dependence. Higher regularity and
positive-time smoothing have the corresponding additional coefficient and forcing regularity;
all-order smoothing assumes smooth coefficients and forcing.

- The closed-bundle initial Schauder estimate, interior and higher versions, with constants
  depending only on `λ, Λ`, coefficient norms, atlas and `T₀`.
- The spectral base solution: existence, the `L²_t H¹`, `C⁰_t L²` and `L²_t H⁻¹` bounds, exact
  initial trace, smoothness for smooth data, and its identification with the weak solution.
- Coefficient continuation: the solution operator of every operator on the interpolation path is
  a bounded isomorphism `C^(α,α/2) × C^(2+α) → C^(2+α,1+α/2)`.
- Uniqueness of `C^(2+α,1+α/2)` solutions for Hölder nondivergence coefficients.

**Checks.**

- On the flat torus the modes `e^(−|k|² t) e^(ikx)` solve `∂_t u = Δu` with `μ_k = |k|²`, the
  coefficient formula with `f = 0` reproduces them, and `λ_k = 1 + |k|²` for `1 + ∇*∇`, so
  `μ_k = λ_k − 1 ≥ 0`.
- `a = Id` has `λ = Λ = 1`; `a = diag(1, −1)` violates the lower bound and is outside the theorem;
  the convex blend `(1 − χ) P + χ a` of two positive matrices stays bounded below by
  `min(λ, λ_P)`.
- The weak integral identity for the heat equation with `u₀ ∈ L²` and `f = 0` is satisfied by the
  spectral solution; a candidate differing from it on a set of positive measure fails the identity
  for some eigenvector test function.
- For a section with `u(·,0) = 0`, `‖u‖_C⁰ ≤ T ‖∂_t u‖_C⁰`, the absorption step's inequality, with
  equality for `u = t v`.

*Needs:* 2.1; PDE F27.1–F27.3, F27.5 and Lane F items 24–25; ComplexKahlerGeometry K5a;
PseudodifferentialOperators P6, P7 (§7.1); VariationalMethods §3.1, §4.4, §5.3; SmoothBundlesConnections
B3 (induced connections).

### 2.3 Quasilinear solution (R2.3)

For `a` depending smoothly on `(x,t,u)`, uniformly positive near `u₀`, and smooth lower terms
`F(x,t,u,∇̄u)`, prove local existence, uniqueness and smooth dependence for

`∂_t u = a^ij(x,t,u) ∇̄_i∇̄_j u + F(x,t,u,∇̄u)`.

The linearization has scalar principal coefficient `a`; dependence of `a` on `∇u` is not part of
this theorem. Use the linear solution operator frozen at `u₀`, a smooth reference solution with the
prescribed trace and zero-trace corrections. Prove that a positive power of `T` controls the
**lower** parabolic Hölder norms of the corrections from their top norm, and the smallness of
`a(u) − a(u₀)`; there is no small-`T` factor on the full top Schauder norm. Composition and product
estimates give a self-map and a contraction on an explicit ball after choosing its radius and `T`.
Prove positivity and open admissibility persist, regularity bootstraps to all spatial and time
orders, initial compatibility for smooth data, restart, and continuation while ellipticity and the
controlling section norms remain bounded (Topping, Theorem 5.2.1 for the DeTurck case, p. 62). This
is the analytic theorem used by the metric equation, not a new assumption.

- Existence on `[0,T]` for `T` depending on the data norms, uniqueness in `C^(2+α,1+α/2)`,
  smooth dependence on data, and all-order regularity for smooth data.
- The continuation criterion: the solution extends past `T` as long as the `C^(2+α,1+α/2)` norm
  and the ellipticity constants stay bounded.

**Checks.**

- `∂_t u = (1 + u²) u_xx` on the circle has `a(u) = 1 + u² ≥ 1` everywhere and falls under the
  theorem; `∂_t u = u u_xx` near `u₀ = 0` has `a(u₀) = 0` and does not.
- For a correction `v` with `v(·,0) = 0`, `‖v‖_C⁰ ≤ T ‖∂_t v‖_C⁰ ≤ T ‖v‖_(2+α,1+α/2)`, the lower
  norm gains a factor `T`, while `‖v‖_(2+α,1+α/2)` gains nothing from small `T`.
- The reference solution with the prescribed trace is the frozen linear solution with initial
  value `u₀`; the zero-trace corrections form a closed ball on which the fixed-point map is a
  contraction of constant `½` after shrinking `T`.

*Needs:* 2.1, 2.2.

### 2.4 Geometric gauge and uniqueness (R2.4)

Define the DeTurck field `W(g,ḡ)^k = g^ij (Γ(g)^k_ij − Γ(ḡ)^k_ij)` by tracing the connection-difference
tensor of 1.2. Prove it is a vector field and that `∂_t g = −2 Ric(g) + L_W g` has principal part
`g^ab ∂_a∂_b g_ij` (Topping, §5.2, equation (5.2.1) and step 1, p. 61). Prove the cancellation in the Ricci linearization,
including its degenerate diffeomorphism directions, and identify the remaining smooth quadratic
first-derivative terms. Apply 2.3 on `Sym²T*M`; it is the real scalar-principal tensor system just
constructed.

Integrate `−W` using DifferentialGeometry 3.5's time-dependent evolution maps and their
suspension on `ℝ × M`, smooth parameter dependence and compactness on each finite time slab. Prove
the required endpoint extension for the one-sided initial interval using 2.1's extension, and
build the metric pullback and differentiation comparisons on those diffeomorphisms. Recover Ricci
flow by pullback: this proves `exists_shortTime_ricciFlow`. For uniqueness of two Ricci flows,
solve the harmonic-map heat gauge into the same fixed target `(M,ḡ)`, starting at the identity.
Build the equation in an exponential neighbourhood of the identity as a 2.3 system with scalar
principal `g(t)⁻¹`, prove `C¹`-close maps to the identity are diffeomorphisms, and compare the
resulting DeTurck metrics and gauge ODEs; this proves `ricciFlow_unique`. Forward uniqueness
suffices; backward uniqueness is not assumed. Prove independence of `ḡ`, isometry naturality, and
the integrable-vector-field criterion: when every spatial derivative of a time-dependent
generator is time integrable, its flow converges to a limiting diffeomorphism, with inverse and
Jacobian control.

- `W` is a smooth vector field, zero when `g = ḡ`, and the Ricci–DeTurck operator is a
  quasilinear scalar-principal system in the sense of 2.3.
- Short-time existence (`exists_shortTime_ricciFlow`): for every `SmoothMetric` `g₀` on a closed
  manifold there are `T > 0` and a family `g` with `g 0 = g₀` and `IsRicciFlowOn g (Icc 0 T)`.
- Forward uniqueness (`ricciFlow_unique`): two families satisfying `IsRicciFlowOn` on `Icc 0 T`
  with the same initial metric agree on `Icc 0 T`.
- The limiting-diffeomorphism criterion, with `C^k` control of the limit and its inverse.

**Checks.**

- For `g = c ḡ` with `c` constant, `Γ(g) = Γ(ḡ)` and `W = 0`, so the DeTurck flow of a constant
  multiple of an Einstein reference is the Ricci flow itself.
- The Ricci variation is `∂_t Ric = −½ Δ_L h − ½ L_((δG(h))#) g` (Topping, Proposition 2.3.7,
  p. 30), so `−2 D Ric(h) = Δ_L h + L_((δG(h))#) g`; the variation of `L_W g` contributes exactly
  `−L_((δG(h))#) g` plus terms without derivatives of `h`, leaving the principal part
  `g^ab ∂_a ∂_b h_ij` with symbol `|ξ|² Id`. Without the DeTurck term the symbol is degenerate on
  the pure-gauge directions `h = L_V g`.
- The Einstein flow `(1 − 2λt) g₀` is the unique Ricci flow from `g₀`: any other flow from `g₀`
  agrees with it by `ricciFlow_unique`.
- A generator with `‖∇^k X(t)‖ ≤ e^(−t)` for all `k` satisfies the integrability criterion and
  its flow converges in every `C^k`; a generator with `‖X(t)‖ = 1/(1+t)` does not, and the flow of
  the constant unit field on the circle has no limit.

*Needs:* 1.2, 2.1–2.3; DifferentialGeometry 3.5; HopfRinow (exponential neighbourhoods).

### Examples

The Ricci–DeTurck flow of a constant multiple of an Einstein metric, the heat equation on a flat
torus in Fourier modes, the quasilinear scalar example `∂_t u = (1 + u²) u_xx`.

### Dependencies

Layer 2 uses Layer 1, PDE F27.1–F27.5 and Lane F items 24–25, ComplexKahlerGeometry K5a,
PseudodifferentialOperators P5–P7, VariationalMethods Layers 3–5, SmoothBundlesConnections B2–B3,
DifferentialGeometry 3.5 and HopfRinow. It uses nothing from Layers 3–8.

## Layer 3: flows, continuation and estimates

### 3.1 Maximal flow (R3.1)

Define Ricci flow on an interval with native metric initial data and the differential equation
(`IsRicciFlowOn`). From 2.4's short-time existence and uniqueness give restriction and restart,
gluing of flows on adjacent intervals, and a unique maximal interval `[0,T)`, `T ∈ (0,∞]`. Include
smooth dependence on data in the section topologies, transport under diffeomorphisms, isometries,
finite covers and products. The normalized version has its corresponding initial-value and maximal
theory through 1.3's time change.

- Every initial metric has a unique maximal flow; two flows from the same metric agree on the
  intersection of their intervals.
- Pullback by a diffeomorphism, lift to a finite cover and product with another flow are flows.
- The normalized maximal interval is the image of the unnormalized one under `τ`.

**Checks.**

- The round unit `Sⁿ` has maximal time `1/(2(n−1))`; a flat torus has `T = ∞`; `S² × S¹` with
  the product of round and flat metrics has `T = 1/2`, the lifetime of the `S²` factor.
- Gluing the Einstein flow on `[0, T/2]` with its restart from `g(T/2)` reproduces the flow on
  `[0, T)`; a candidate "flow" that jumps at `T/2` is not jointly smooth and is excluded by
  `IsSmoothMetricFamilyOn`.
- The lift of the round flow on `RP³` to `S³` is the round flow on `S³`, with the same lifetime
  `1/4`.

*Needs:* 1.1, 1.3, 2.4; DifferentialGeometry 2.3 (covers).

### 3.2 Curvature derivative estimates (R3.2)

Derive the commuted equations for `∇^k Rm` and the metric-norm evolution, with each lower term an
explicitly bounded contraction. If `|Rm| ≤ K` on `M × [0, A/K]`, prove the global Shi-type bounds
`|∇^k Rm| ≤ C(n,k,A) K t^(−k/2)` for `t > 0` (Topping, Theorem 3.3.1, p. 49, stated there on
`[0, 1/M]` with `|Rm| ≤ M`; the form here is its parabolic rescaling), and versions including the
initial higher-derivative bounds up to `t = 0`. Build the Bernstein weighted-sum argument from
Layer 4's scalar maximum principle; constants and scaling are uniform. For time-varying bundles
include the commutators of `∂_t` and `∇` and the extra normalization terms. Supply interpolation
with bounded higher covariant derivatives, so decay in the zeroth norm yields decay of every
derivative on positive-time slabs.

- Shi estimates for every `k`, uniform in the flow, scale invariant.
- Interpolation: `‖∇^j T‖_C⁰ ≤ C ‖T‖_C⁰^(1−j/k) ‖∇^k T‖_C⁰^(j/k)` on a closed manifold.

**Checks.**

- Under parabolic scaling `g ↦ c g(t/c)`, `|∇^k Rm|` scales by `c^(−1−k/2)`, `K` by `c⁻¹` and
  `t^(−k/2)` by `c^(−k/2)`, so both sides of `|∇^k Rm| ≤ C K t^(−k/2)` scale alike; a bound with
  `t^(−k)` in place of `t^(−k/2)` fails this scaling test.
- The interval `[0, A/K]` scales to `[0, c A/K]`, the interval for the scaled bound `K/c`.
- On the round sphere `∇Rm = 0`, so every Shi bound holds with equality at `k = 0` only.

*Needs:* 1.2, 3.1, 4.1, 4.2.

### 3.3 Continuation (R3.3)

For a finite maximal time `T` put `Q(t) = max_(x∈M) |Rm(x,t)|`. Prove both `sup_(t<T) Q(t) = ∞`
(Topping, Theorem 5.3.1, p. 63) and the terminal-time assertion `Q(t) → ∞` as `t ↑ T`. For the
unnormalized flow derive the upper scalar comparison `D⁺Q ≤ C_n Q²`, with a positive dimensional
constant, from Layer 4's curvature evolution and maximum principle; apply its ODE bound at every
restart time and the uniform-bound extension criterion to prove `Q(t) ≥ 1/(C_n (T − t))` for every
`0 ≤ t < T`. This supplies terminal divergence, not merely an unbounded subsequence. A curvature
bound controls `g` and `g⁻¹` on finite time intervals (Topping, Theorem 3.2.1 and Corollary 3.2.4,
p. 46), 3.2 controls all covariant derivatives, and Layer 1's connection variation transfers these
to a fixed background atlas. Construct a `C^∞` positive limit at `T` and restart Layer 2. Establish
equivalence of the relevant fixed and covariant norms before invoking an existence theorem. Give
short existence-time bounds from curvature and metric data, the scalar lower blow-up comparison
`Scal_min(t) ≥ s₀/(1 − 2 s₀ t/n)` for `s₀ > 0`, and the resulting finite-time inequality
`T ≤ n/(2 s₀)`. Positive scalar curvature alone forces finite unnormalized lifespan; it does not
prove spherical convergence.

- Bounded curvature on `[0,T)` with `T < ∞` contradicts maximality.
- The lower bound `Q(t) ≥ 1/(C_n (T − t))` and the scalar comparison.
- The short-time bound: a flow with `|Rm(g₀)| ≤ K` exists at least to time `c_n/K`.

**Checks.**

- On the round unit `Sⁿ`, `κ(t) = 1/(1 − 2(n−1)t) = 1/(2(n−1)(T − t))` and
  `|Rm| = sqrt(2n(n−1)) κ`, so `Q(t) = sqrt(n/(2(n−1)))/(T − t)`; `D⁺Q = Q²/sqrt(n/(2(n−1)))`,
  consistent with `D⁺Q ≤ C_n Q²` for `C_n ≥ sqrt(2(n−1)/n)`.
- The scalar comparison on the same sphere: `Scal = n(n−1)κ(t)` and `s₀ = n(n−1)` give
  `s₀/(1 − 2 s₀ t/n) = n(n−1)/(1 − 2(n−1)t)`, equality, and `T = n/(2 s₀) = 1/(2(n−1))`.
- On a flat torus `Q ≡ 0` and `T = ∞`: the lower bound is only asserted for finite `T`.

*Needs:* 1.2, 2.3, 3.1, 3.2, 4.1, 4.2.

### Examples

The sphere's curvature blow-up rate `1/(T − t)`, the lifetime of `S² × S¹`, the lift of a flow to
a finite cover.

### Dependencies

Layer 3 uses Layers 1–2 and 4.1–4.2, and DifferentialGeometry 2.3. It uses nothing from Layers
5–8.

## Layer 4: curvature evolution and tensor maximum principles

### 4.1 Evolution and frame comparison (R4.1)

Derive the Ricci, scalar, Riemann-tensor and volume equations from Layer 1 (Topping, Propositions
2.5.1 and 2.5.4 and equation (2.5.8), pp. 41–43). In particular `∂_t Scal = L_g Scal + 2|Ric|²`,
and volume differentiation gives `dVol/dt = −∫ Scal`. Construct the moving-frame (Uhlenbeck)
connection on the pullback tangent bundle over `M × time`; prove its metric compatibility and
compare all tensors with the native fixed-time ones. Construct isometries `ι_(t,x)` from the fixed
reference tangent fibre `(T_xM, g₀)` to `(T_xM, g(t))` by the moving-frame ODE `∂_t e = Ric# e`,
and express the curvature equation for the pullbacks of the curvature four-tensor of 5.1 in that
fixed metric bundle. Derive the operator `Q` equation `D_t Rop = L_g Rop + Q(Rop)` and its
normalized radial term, and verify it on the Einstein and round examples. Differentiate in local
frames only after proving the change-of-frame law.

- The scalar, Ricci, Riemann and volume evolution equations.
- The moving-frame isometries exist, are smooth in `(t,x)` and intertwine the evolving metrics
  with `g₀`; the pulled-back curvature satisfies the `Q` equation.

**Checks.**

- On the round `Sⁿ` with `κ(t) = 1/(1 − 2(n−1)t)`: `Scal = n(n−1)κ`, `|Ric|² = n(n−1)²κ²`, and
  `∂_t Scal = n(n−1) κ′ = 2n(n−1)²κ² = 2|Ric|²`, with `L_g Scal = 0`.
- Same sphere: `Vol = (1 − 2(n−1)t)^(n/2) Vol₀` has derivative `−n(n−1)κ Vol = −∫ Scal`.
- Along `∂_t e = Ric# e`, `d/dt g(e_i,e_j) = −2 Ric(e_i,e_j) + 2 Ric(e_i,e_j) = 0`, so frames stay
  orthonormal; with `∂_t e = −Ric# e` the derivative is `−4 Ric(e_i,e_j) ≠ 0`.
- On the sphere `Rop = κ I` and `Q(κ I) = 2(κ² I + κ² (n−2) I) = 2(n−1)κ² I`, which equals
  `D_t Rop = κ′ I`; this pins the normalization `I# = (n−2) I`.

*Needs:* 1.2, 1.3, 5.1, 5.2; SmoothBundlesConnections B3–B4 (induced connections, curvature).

### 4.2 Scalar and convex-bundle maximum principles (R4.2)

Prove comparison on a closed evolving manifold for `∂_t u ≤ L_g u + b·∇u + F(t,u)`, with locally
Lipschitz `F` and bounded coefficients on each finite slab. Include strict barriers, one-sided
extrema and time derivatives, nonnegative preservation, strong positivity, Gronwall bounds and
drifting equations. For sections of a metric vector bundle with a compatible evolving connection,
prove the ODE–PDE principle for a parallel-transport-invariant closed convex fibre set `C` and a
reaction locally Lipschitz on bounded sets: ODE invariance implies preservation by the heat system
(Topping, Theorem 9.6.1, p. 112). Build nearest-point and supporting-functional and distance-to-`C`
estimates in finite fibres and the scalar comparison for its maximal distance. Identify the convex
positive tangent cone with Mathlib's `tangentConeAt ℝ≥0`; the real cone allowing negative scalar
multiples is not the required one. Include time-dependent `C` with its stated tangent and normal
velocity condition and positive-improvement results for strict inward reactions. Do not turn an
arbitrary ODE-invariant nonconvex set into a tensor maximum-principle hypothesis.

- The scalar comparison principle with the ODE comparison function.
- The tensor maximum principle: if `C` is closed, convex, invariant under parallel transport and
  under the fibre ODE, and the section starts in `C`, it stays in `C`.
- Strict-inward improvement: a reaction pointing strictly inward on the boundary moves the section
  into the interior for positive time.

**Checks.**

- For `u = Scal` and `F(u) = 2u²/n` (from `|Ric|² ≥ Scal²/n`) the comparison ODE gives
  `s₀/(1 − 2 s₀ t/n)`, the bound of 3.3.
- For `C = [0,∞) ⊂ ℝ` at the point `0`, `tangentConeAt ℝ≥0 C 0 = [0,∞)` while the real tangent
  cone is `ℝ`; the reaction `−1` lies in the latter but leaves `C`, so the positive cone is the
  one that gives invariance.
- `C = {Ric ≥ 0}` is `Q`-invariant in dimension three (5.3) and preserved; in dimension `n ≥ 4`
  it is not ODE-invariant, so the principle makes no claim about it.
- A nonconvex ODE-invariant set, the union of two rays in a fibre, is not preserved by the heat
  system, since averaging leaves the union.

*Needs:* 1.1, 1.2, 4.1; Mathlib `tangentConeAt`; 4.3 for the fibre ODE.

### 4.3 Finite-dimensional ODE API (R4.3)

On the algebraic tensor space of 5.1 prove local existence, uniqueness, continuous dependence and
restart for the ODE `dR/dt = Q(R)` and its `εI` perturbations, from Mathlib's Picard–Lindelöf.
Prove closed convex invariance from the inward positive-tangent and supporting inequalities, with
bounded-set Lipschitz estimates and strict-barrier limits. This is the invariance criterion applied
to the concrete `Q` cones and sets constructed in Layers 5–6. A volume-normalized equation
preserves the homogeneous cones via scaling; a translated, nonhomogeneous pinching set `F` is used
in the unnormalized flow and is not assumed invariant under the normalized radial term.

- Nagumo's criterion: a closed convex set is invariant under a locally Lipschitz ODE exactly when
  the field lies in the positive tangent cone at every boundary point
  (`reaction_mem_positive_tangentCone_pic2` is this hypothesis for PIC2).
- Scaling: if `R(t)` solves the ODE then `c R(ct)` solves it.

**Checks.**

- On the round line `R = κ I` the ODE is `κ′ = 2(n−1)κ²`, solved by `κ(t) = κ₀/(1 − 2(n−1)κ₀ t)`,
  blowing up at `1/(2(n−1)κ₀)`, the lifetime of the unit sphere for `κ₀ = 1`.
- A homogeneous cone `C` satisfies `cC = C`; the translated set `F = {R : R + hI ∈ C}` satisfies
  `cF = {R : R + chI ∈ C} ≠ F` for `c ≠ 1`, so `F` is not scale invariant.
- The half-line `[0,∞)` is invariant under `x′ = x²` (field `0` at the boundary point) and not
  under `x′ = −1`.

*Needs:* 5.1, 5.2; Mathlib Picard–Lindelöf, `tangentConeAt ℝ≥0`.

### Examples

The sphere's scalar and curvature-operator evolution, the dimension-three Ricci-nonnegative cone,
the half-line as a convex invariant set.

### Dependencies

Layer 4 uses Layers 1 and 5.1–5.2, SmoothBundlesConnections B3–B4 and Mathlib's ODE theory. Its
maximum principles are consumed by Layer 3. It uses nothing from Layers 6–8.

## Layer 5: algebraic curvature operators and invariant cones

### 5.1 Finite-dimensional objects (R5.1)

Define `FourTensor V` as Mathlib's `ContinuousMultilinearMap ℝ (fun _ : Fin 4 => V) ℝ` and
`IsAlgebraicCurvature` as the pair skew-symmetries, pair interchange and the first Bianchi
identity; `algebraicCurvatureSubmodule` is the submodule they cut out. Prove it closed, and compare
it with the self-adjoint Bianchi subspace of `End(Λ²V)` through RiemannianGeometry R1's Gram and
exterior carrier. Prove basis change, orthogonal equivariance, scalar and Ricci traces, the Weyl,
scalar and traceless-Ricci projections and their reconstruction. Construct the curvature
four-tensor map of a smooth metric `g` at `x` into this submodule on `T_xM`, characterized by
`(u,v,z,w) ↦ g_x(R^g_x(u,v)w, z)` with `R^g` the native Levi-Civita `curvatureTensor`: install
`g`'s metric instance locally as for `metricRicci`, and use finite dimensionality to pass from
multilinearity to continuity. Prove its symmetry and Bianchi membership from metric compatibility
and torsion freeness, and identify its Ricci and scalar contractions and its bivector operator with
the native ones and with RiemannianGeometry R1's curvature operator. Prove smooth dependence on `x`
and equivariance under orthonormal frames; Layer 4's moving-frame equation and Layers 6–7's
pointwise cone conditions use this map. For every linear isometry `ι : V ≃ₗᵢ (T_xM, g_x)`,
construct its four-tensor pullback in the fixed space `algebraicCurvatureSubmodule` on `V`, and
prove membership in each `O(n)`-invariant cone is independent of `ι`; 4.1's time-dependent
pullbacks use this map. Define the Kulkarni–Nomizu product explicitly and compare it with the
symmetric operator product `A ∧ B`, whose value on `u ∧ v` is `½(Au ∧ Bv + Bu ∧ Av)`;
`Id_E ∧ Id_E = I`. State the dimension restrictions `n ≥ 3` on the Ricci/Weyl splitting; in
dimension three Weyl vanishes, while dimension two has its one-dimensional curvature space.

- `algebraicCurvatureSubmodule` is a closed submodule of dimension `n²(n²−1)/12`, `O(n)`-invariant.
- The curvature four-tensor of a metric lies in it, depends smoothly on the point, and its traces
  are `metricRicci` and `metricScalar`; its restriction to a plane is `metricSectional` times the
  Gram determinant.
- The Ricci/Weyl decomposition for `n ≥ 3`, with the traceless-Ricci part `(2/(n−2)) Ric₀ ∧ Id`
  and the scalar part `(Scal/(n(n−1))) I`.

**Checks.**

- The constant-curvature tensor `r(u,v,z,w) = κ(⟨u,z⟩⟨v,w⟩ − ⟨u,w⟩⟨v,z⟩)` satisfies all four
  identities (the Bianchi sum is `κ[(⟨u,z⟩⟨v,w⟩ − ⟨u,w⟩⟨v,z⟩) + (⟨v,u⟩⟨z,w⟩ − ⟨v,w⟩⟨z,u⟩) +
  (⟨z,v⟩⟨u,w⟩ − ⟨z,w⟩⟨u,v⟩)] = 0`), and `r(u,v,u,v) = κ(|u|²|v|² − ⟨u,v⟩²) > 0` for `κ > 0` and
  independent `u, v`; the tensor `⟨u,z⟩⟨v,w⟩` alone fails the first skew-symmetry.
- Tau Ceti's `IsConstantCurvatureTensor` reads `R(w,u)v = κ(⟪u,v⟫w − ⟪w,v⟫u)`, that is
  `R(u,v)w = κ(⟨v,w⟩u − ⟨u,w⟩v)`, whose four-tensor `g(R(u,v)w,z)` is the tensor above with the
  same sign.
- The dimension `n²(n²−1)/12` is `1, 6, 20` for `n = 2, 3, 4`; in dimension two every algebraic
  curvature tensor is `K` times the constant-curvature tensor.
- `Id_E ∧ Id_E (u ∧ v) = ½(u∧v + u∧v) = u ∧ v`, so the wedge convention gives the identity `I`;
  the convention without the `½` would give `2I`.

*Needs:* Mathlib `ContinuousMultilinearMap`, `exteriorPower`, finite-dimensional spectral theory;
Tau Ceti `curvatureTensor`, `ricciTensor`, `scalarCurvature`, `sectionalCurvature`;
RiemannianGeometry R1; SmoothBundlesConnections B2.

### 5.2 Reaction (R5.2)

Define the reaction `Q` by its contraction in an orthonormal basis `b`,

`Q(r)_ijkl = Σ_pq r_ijpq r_klpq + 2 Σ_pq r_ipkq r_jplq − 2 Σ_pq r_iplq r_jpkq`

(Brendle–Schoen 2008, §2, the display defining `Q(R)`, p. 5). In `Suggested.lean`
`reactionComponent b r i j k l` is this scalar, `coordFourTensor b i j k l` the rank-one tensor
`⟪b i,·⟫⟪b j,·⟫⟪b k,·⟫⟪b l,·⟫`, and `reactionTensor r` the expansion `Σ_ijkl Q(r)_ijkl
coordFourTensor b i j k l` in the standard orthonormal basis. Prove independence of the basis
(`reactionTensor_apply_orthonormalBasis`: in every orthonormal basis `Q(r)(u,v,z,w)` is the
displayed contraction with `u, v, z, w` in place of `b i, b j, b k, b l`), Bianchi preservation
(`reactionTensor_mem`), equality with `2(R² + R#)` on the operator side, orthogonal equivariance,
homogeneity of degree two, continuous bilinear polarization and bounded-set Lipschitz estimates.
Build the finite spectral calculus for `Rop` and `Ric`, ordered eigenvalues and their continuity,
and prove positivity and 2-positivity as symmetric-operator inequalities. For 2-positivity use the
sum of the two smallest eigenvalues on `Λ²`, only when that space has dimension at least two; use
the equivalent positive trace on every two-dimensional subspace.

- `reactionTensor` is a continuous quadratic map `FourTensor V → FourTensor V`, basis
  independent, `O(n)`-equivariant, mapping `algebraicCurvatureSubmodule` to itself.
- `Q(R) = 2(R² + R#)` under the bivector identification of 5.1, with `I# = (n−2) I`.
- Ordered eigenvalues of `Rop` and `Ric` are continuous and `O(n)`-invariant.

**Checks.**

- For the constant-curvature tensor `r_ijkl = κ(δ_ik δ_jl − δ_il δ_jk)`: the first sum is
  `2κ²(δ_ik δ_jl − δ_il δ_jk)`, the second `2κ²((n−2) δ_ik δ_jl + δ_ij δ_kl)`, the third
  `−2κ²((n−2) δ_il δ_jk + δ_ij δ_kl)`, so `Q(r) = 2(n−1) κ r`, matching `2(κ² I + κ² (n−2) I)`.
- For the rank-one tensor of `S² × ℝ^(n−2)` (only `r_1212 = 1` up to symmetry), `Q(r)_1212 =
  r_1212² + r_1221² + 0 − 0 = 2 = 2 r_1212`, so `Q(r) = 2r`: `R² = R` and `R# = 0` for a rank-one
  projection.
- Homogeneity: `Q(cr) = c² Q(r)`; the expansion in the standard basis and the contraction in any
  other orthonormal basis agree because each sum over `p, q` is a full contraction of two tensors
  over an orthonormal basis.
- In dimension two `Λ²` has dimension one and 2-positivity is not defined; in dimension three
  `Λ²` has dimension three and the sum of the two smallest eigenvalues is the smallest Ricci
  eigenvalue (5.3).

*Needs:* 5.1; Mathlib `stdOrthonormalBasis`, `innerSL`, `ContinuousMultilinearMap.mkPiAlgebraFin`,
`compContinuousLinearMap`, `LinearMap.IsSymmetric` spectral theorem.

### 5.3 Basic cones and the dimension-three identity (R5.3)

Define the cones of nonnegative curvature operators, 2-nonnegative operators, nonnegative sectional
curvature, PIC and PIC2 as `ProperCone ℝ` objects in `algebraicCurvatureSubmodule`, with their
interiors, strict conditions and orthogonal invariance. Use the same `ProperCone` carrier for the
deformed families and `ProperCone.map` for their invertible deformation maps; prove the underlying
set is the image, using finite-dimensional invertibility. Prove nonempty interior and salience where
asserted as separate properties. Do not assume salience for PIC: in dimension four every pure
traceless-Ricci tensor has zero isotropic expression, giving nonzero lines in that cone. Prove
operator positivity implies 2-positivity in `n ≥ 3`, 2-positivity implies positive Ricci and
scalar curvature, and in `n = 3` positive Ricci is equivalent to 2-positive `Rop`: in corresponding
three-frame and bivector bases the Ricci eigenvalues are the pairwise sums of the three operator
eigenvalues. Prove preservation of 2-nonnegativity by the eigenvalue and supporting-two-plane
reaction inequalities (Böhm–Wilking, p. 7, after Theorem 3.1, where it is
attributed to Hamilton). For `n = 3` build
the pinching family `C(s) = {Ric ≥ (s/3) Scal Id}`, `0 ≤ s < 1`, prove strict transversality for
`s > 0` by its three-eigenvalue polynomial (Topping, Theorem 9.7.5, p. 118), and the round-ray
endpoint. Do not claim positive sectional entries in one basis imply operator positivity, or
positive Ricci preservation in arbitrary dimension.

- The five cones are closed, convex, `O(n)`-invariant; the operator cones and PIC2 are salient
  with nonempty interior for `n ≥ 3`; PIC is not salient in dimension four.
- The inclusions `{Rop > 0} ⊂ {Rop 2-positive} ⊂ {Ric > 0} ⊂ {Scal > 0}` for `n ≥ 3`.
- In dimension three `{Ric ≥ 0} = {Rop 2-nonnegative}`, `Q`-invariant, with the pinching family
  `C(s)` strictly transversal for `0 < s < 1`.

**Checks.**

- With `Rop` diagonal with eigenvalues `λ₁ ≤ λ₂ ≤ λ₃` on `e₂∧e₃, e₃∧e₁, e₁∧e₂`,
  `Ric(e₁,e₁) = K(e₁,e₂) + K(e₁,e₃) = λ₃ + λ₂`, so the smallest Ricci eigenvalue is `λ₁ + λ₂`:
  `Ric > 0` iff `Rop` is 2-positive.
- In dimension four the Ricci-type tensor `A ∧ g` with `A = diag(1,−1,0,0)` has isotropic
  expression `(A₁₁ + A₃₃) + (A₁₁ + A₄₄) + (A₂₂ + A₃₃) + (A₂₂ + A₄₄) = 2 tr A = 0` on the standard
  frame and `R_1234 = 0`, so both `±(A ∧ g)` lie in PIC: PIC is not salient.
- The round ray `κ I`, `κ > 0`, lies in the interior of every one of the five cones; `S² × S²`
  (sectional curvatures in `[0,1]`) lies in the operator-nonnegative cone's boundary, since the
  mixed bivector `e₁ ∧ e₃` has `⟨Rop(e₁∧e₃), e₁∧e₃⟩ = 0`.
- The family `C(s)` has `C(0) = {Ric ≥ 0}` and `C(1) = {Ric = (Scal/3) Id}`, the Einstein, hence
  round, ray in dimension three.

*Needs:* 5.1, 5.2, 4.3; Mathlib `ProperCone`, `ProperCone.map`.

### 5.4 Böhm–Wilking deformation (R5.4)

For `n ≥ 3` define `ℓ_(a,b)(R) = R + 2(n−1)a R_I + (n−2)b R_Ric₀` and its inverse for the nonzero
eigenfactors `1 + 2(n−1)a ≠ 0` and `1 + (n−2)b ≠ 0` (Böhm–Wilking, Theorem 2, p. 2). Here
`λ̄ = Scal/n`, `Ric₀ = Ric − λ̄ Id`, `R_I = (λ̄/(n−1)) I` and `R_Ric₀ = (2/(n−2)) Ric₀ ∧ Id`, with the
wedge convention of 5.1. For `X = Q/2` compute `D_(a,b) = ℓ⁻¹X(ℓR) − X(R)`, prove independence of
Weyl, and the full tensor formula and Ricci-diagonal eigenvalue formulas of Böhm–Wilking Theorem 2
and Corollary 2.3 (pp. 2, 7). These formulas are required, with `n` and every denominator's
nonvanishing hypotheses, rather than an unexplained claim that a cone deforms. In particular prove,
writing `I` for the identity curvature operator,

`D_(a,b)(R) = ((n−2)b² − 2(a−b)) Ric₀ ∧ Ric₀ + 2a Ric ∧ Ric + 2b² Ric₀² ∧ Id + κ_(a,b) I`,

where `κ_(a,b) = tr(Ric₀²)/(n(1 + 2(n−1)a)) · (nb²(1−2b) − 2(a−b)(1 − 2b + nb²))`. The discrepancy
for `Q` is exactly `ℓ⁻¹Q(ℓR) − Q(R) = 2 D_(a,b)(R)`. For `n = 3` verify the identity with the Weyl
summand zero. Prove Proposition 3.2 (p. 7) for a closed convex `O(n)`-invariant `Q`-invariant cone
`C` whose nonzero elements have positive scalar curvature, every element has nonnegative Ricci
curvature, and which contains every nonnegative rank-one curvature operator. Its parameter
hypotheses are `2a = 2b + (n−2)b²` and `0 < b ≤ (sqrt(2n(n−2)+4) − 2)/(n(n−2))`. Prove `ℓ_(a,b)(C)`
is `Q`-invariant and `Q` points strictly into its positive tangent cone at every nonzero boundary
point.

For `n ≥ 4` set `b_* = (sqrt(2n(n−2)+4) − 2)/(n(n−2))` and `a_* = (2b_* + (n−2)b_*²)/2`. The first
piece is `A_b = ℓ_(a(b),b)(C_2)` for `0 ≤ b ≤ b_*`, where `C_2` is the cone of 2-nonnegative
curvature operators and `a(b) = (2b + (n−2)b²)/2`; show `C_2` meets every hypothesis just stated.
At the endpoint prove `A_(b_*) ⊆ {R ≥ 0}` by the smallest-curvature-operator and smallest-Ricci
eigenvalue estimates in the proof of Corollary 3.3 (p. 8).

Define the nonnegative-operator path `D_b` for `0 ≤ b ≤ 1/2` by
`D_b = ℓ_(a_b,b){R ≥ 0, Ric ≥ (p_b/n) Scal Id}`, `a_b = ((n−2)b² + 2b)/(2 + 2(n−2)b²)` and
`p_b = (n−2)b²/(1 + (n−2)b²)`. It starts at `D_0 = {R ≥ 0}` and ends at `D_(1/2)`. For `u ≥ 0`
continue with `E_u = ℓ_((1+u)/2, 1/2){R ≥ 0, Ric ≥ (p_u/n) Scal Id}`, `p_u = 1 − 4/(n+2+4u)`; its
`u = 0` cone is exactly `D_(1/2)`. Use Lemma 3.4 (p. 9) for ODE invariance of `D_b` for
`0 ≤ b ≤ 1/2`, and for strict inward transversality at every nonzero boundary tensor only for
`0 < b ≤ 1/2`. At `b = 0` the entire cone `D_0 = {R ≥ 0}` is invariant but not strictly inward: the
rank-one product curvature of `S² × ℝ^(n−2)` has `Q(R) = 2R` on its nonzero boundary ray. Use
Lemma 3.5 (p. 10) for both properties of `E_u` for every `u ≥ 0`. Concatenate the three pieces as
the single path: first `A_b` from `b = 0` to `b = b_*`; then `A_(b_*) ∩ D_b` from `b = 0` to
`b = 1/2`; then `A_(b_*) ∩ E_u` from `u = 0` to `u = ∞`. Reparametrize the concatenated
compactified interval continuously onto `[0,1)`. The first cone is `A_0 = C_2`; the second starts
at `A_(b_*) ∩ D_0 = A_(b_*)` because `A_(b_*) ⊆ {R ≥ 0}`, so the first and second pieces meet at
`A_(b_*)`. At this join strict transversality is that of `A_(b_*)`, since `b_* > 0`; it is not a
strictness claim about all of `D_0`. The last two meet at `A_(b_*) ∩ D_(1/2) = A_(b_*) ∩ E_0`.
Since intersections of invariant closed convex cones remain invariant, the strictness, full
dimension, positive scalar, continuity of scalar-normalized sections and round-ray limit must be
checked for these intersections; the endpoint inclusion alone does not prove those properties. Use
the eigenvalue estimates in Lemmas 3.4–3.5 to prove strictness, not just ODE invariance. Use 5.3's
explicit family in `n = 3`.

- `ℓ_(a,b)` is an `O(n)`-equivariant linear automorphism for the stated parameters, with the
  displayed discrepancy formula.
- The concatenated path is a pinching family in the sense of 6.1 for every `n ≥ 3`, from the
  2-nonnegative cone to the round ray (Böhm–Wilking, Theorem 3.1, p. 7).

**Checks.**

- At `a = b = 0`, `ℓ` is the identity and `D_(0,0) = 0`; the formula gives `0 · Ric₀∧Ric₀ + 0 +
  0 + κ_(0,0) I` with `κ_(0,0) = 0`.
- For `n = 4`, `b_* = (sqrt(20) − 2)/8 ≈ 0.309` and `a_* = (2b_* + 2b_*²)/2 ≈ 0.404`; both
  eigenfactors `1 + 6a_*` and `1 + 2b_*` are positive, so `ℓ_(a_*,b_*)` is invertible.
- At the join `b = 1/2`: `a_(1/2) = ((n−2)/4 + 1)/(2 + (n−2)/2) = 1/2` and
  `p_(1/2) = ((n−2)/4)/(1 + (n−2)/4) = (n−2)/(n+2)`, while `E_0` has `a = 1/2` and
  `p_0 = 1 − 4/(n+2) = (n−2)/(n+2)`: the two formulas agree. As `u → ∞`, `p_u → 1` and the cone
  tends to the round ray.
- On the ray of `S² × ℝ^(n−2)`, `Q(R) = 2R` is tangent to the ray, so `D_0` is not strictly
  inward there, while for `b > 0` the Ricci condition `Ric ≥ (p_b/n) Scal Id` excludes this
  rank-one tensor from `D_b` (its Ricci tensor has zero eigenvalues and positive scalar).

*Needs:* 5.1–5.3, 4.3.

### 5.5 Nonnegative isotropic curvature and PIC2 (R5.5)

With `r(u,v,z,w) = g(R(u,v)w,z)`, verify the complexified identity for `z = e₁ + i e₂`,
`w = e₃ + i e₄`: `r(z,w,z̄,w̄) = r₁₃₁₃ + r₁₄₁₄ + r₂₃₂₃ + r₂₄₂₄ − 2 r₁₂₃₄`. Prove it from pair
interchange and first Bianchi in the chosen convention; this is the bridge from complex isotropic
vectors to the real four-frame inequality, not an independent curvature convention. PIC means
`r_1313 + r_1414 + r_2323 + r_2424 − 2 r_1234 ≥ 0` on every orthonormal four-frame. Prove its `Q`
boundary inequality (Brendle–Schoen 2008, Propositions 8–11, pp. 8–13). The proof builds the
frame-rotation first variation identities, separates contraction sums into the four-frame block,
mixed block and orthogonal complement, and uses second variation to make the complement block
matrix positive semidefinite. Its blocks are `A_pq = r_1p1q + r_2p2q`, `B_pq = r_3p3q + r_4p4q`,
`C_pq = r_3p1q + r_4p2q`, `D_pq = r_4p1q − r_3p2q`, `E_pq = r_12pq`, `F_pq = r_34pq`, with
complement indices from `5` to `n`, at a boundary frame where the isotropic expression vanishes,
for `R` with nonnegative isotropic curvature on every orthonormal four-frame. Prove from the
second variation that `L = [[B,−F,−C,−D],[F,B,D,−C],[−Cᵀ,Dᵀ,A,−E],[−Dᵀ,−Cᵀ,E,A]]` is positive
semidefinite. Set `U = [[0,0,I,0],[0,0,0,−I],[−I,0,0,0],[0,I,0,0]]`, with blocks of size `n − 4`.
Construct these block matrices from Proposition 9 and prove `tr(AB) + tr(EF) − tr(C²) − tr(D²) ≥ 0`
from its positive-semidefinite trace pairing: expand `tr(LULUᵀ)/4` to the displayed expression and
prove it nonnegative by the trace pairing of `L` with `ULUᵀ`; include the empty-block `n = 4`
case. The first-variation identities make the other two blocks zero; the remaining squares in `Q`
are nonnegative. Include the `εI` barrier argument and passage to limits, proving PIC ODE and PDE
preservation.

Define PIC2 as the condition that the zero extension of `R` to `E ⊕ ℝ²` has nonnegative isotropic
curvature (Brendle–Schoen 2008, §3, p. 14). Prove `Q` commutes with zero extension, so PIC
preservation gives PIC2 preservation. For `n ≥ 4` prove its exact four-frame characterization
(`IsPIC2FourFrame`, with `pic2Expression` the displayed expression), for `λ, μ ∈ [−1,1]`,

`r_1313 + λ² r_1414 + μ² r_2323 + λ² μ² r_2424 − 2λμ r_1234 ≥ 0`

(Brendle–Schoen 2008, Proposition 21, p. 20). Build both directions through the two-bivector
normal-form lemmas, including the degenerate and self-dual cases and the planar rotation of the
pair; the simple choice of extended frames proves only one direction. Show PIC2 implies
nonnegative sectional curvature, contains all nonnegative operators, and its nonzero elements have
positive scalar curvature (Proposition 12, p. 14). Interior means a strict inequality with a
uniform positive margin on the compact frame and parameter space. The inward-pointing statement is
`reaction_mem_positive_tangentCone_pic2`: for `r` in the PIC2 cone, `Q(r)` lies in
`tangentConeAt ℝ≥0` of the cone at `r`. Using 5.4's discrepancy, construct the Brendle–Schoen
deformed PIC2 family with `R ∈ PIC2` in place of `R ≥ 0` (Propositions 13–15, p. 16). Define
its combined parameter `σ ≥ 0`: for `0 ≤ σ ≤ ½` take `b = σ` and the first branch's `a, p`; for
`σ ≥ ½` take `b = ½`, `a = σ` and `p = 1 − 4/(n−2+8σ)`, so 5.4's second-branch variable is
`u = 2σ − 1`. Verify the common endpoint and all inward inequalities, continuity and the round-ray
limit as `σ → ∞`. PIC alone is a weaker condition and is not the convergence hypothesis in Layer 7.

- PIC and PIC2 are closed convex `O(n)`-invariant `Q`-invariant cones; `Q` lies in the positive
  tangent cone of PIC2 at every point of PIC2 (`reaction_mem_positive_tangentCone_pic2`).
- `IsPIC2FourFrame r` iff the zero extension of `r` has nonnegative isotropic curvature, for
  `n ≥ 4`.
- The deformed PIC2 family is a pinching family in the sense of 6.1.

**Checks.**

- For constant curvature `κ ≥ 0` every `r_ijij = κ` and `r_1234 = 0`, so the isotropic expression
  is `4κ` and the PIC2 expression is `κ(1 + λ²)(1 + μ²) ≥ 0`; for `κ < 0` both are negative.
- For `S² × S²` with unit factors and `e₁, e₂` in the first factor, `e₃, e₄` in the second, every
  term vanishes and the expression is `0`; with `e₁, e₃` in the first factor and `e₂, e₄` in the
  second it is `1 + λ²μ²`. So `S² × S²` lies in PIC2 but not in its interior.
- The zero extension of the unit `S²` curvature to `ℝ² ⊕ ℝ²` is the `S² × ℝ²` tensor, whose
  isotropic expression on the frame `e₁, e₂` (sphere) and `e₃, e₄` (flat) is `0`: PIC2 of `S²`
  holds weakly, consistent with `Q(R) = 2R` on its ray.
- With `σ = ½` both branches give `b = ½`, `a = ½`, `p = (n−2)/(n+2)`, the join of 5.4's `D_(1/2)`
  and `E_0`.

*Needs:* 5.1–5.4, 4.3.

### 5.6 Quarter pinching and PIC2 (R5.6)

Prove Berger's mixed-component estimate `|r_1234| ≤ (2/3)(K_max − K_min)` from sectional
polarization and Bianchi. For positive sectional minimum `m` and maximum `M` at a point with
`M < 4m`, insert it into the PIC2 expression to prove a strictly positive value for every `λ, μ`
and frame: `m(1 + λ² + μ² + λ²μ²) − (4/3)(M − m)|λμ| > 0` (Brendle–Schoen 2008, the remark after
Theorem 3, p. 4). This is `strict_quarterPinching_isPIC2`. Treat `λμ = 0` directly; the weak
borderline `M = 4m` gives only `≥ 0`. Prove existence and continuity of the sectional minimum and
maximum on the compact Grassmann and frame fibres, and uniform strict margins over a compact base.
Do not use PIC2 interior for weak quarter pinching: complex projective space at the borderline is
the counterexample.

- Berger's estimate, with equality attained by the Fubini–Study metric.
- Pointwise strict quarter pinching on a closed manifold puts the curvature four-tensor in the
  interior of PIC2 with a uniform margin.

**Checks.**

- At `λ = μ = 1` the expression is `4m − (4/3)(M − m) = (4/3)(4m − M)`, positive exactly when
  `M < 4m` and zero at `M = 4m`; for `λμ = 0` it is `m(1 + λ² + μ²) ≥ m > 0`; in general
  `(1 + λ²)(1 + μ²) ≥ 4|λμ|` gives the bound `(4/3)|λμ|(4m − M) > 0`.
- Constant curvature has `r_1234 = 0 = (2/3)(K_max − K_min)`.
- The Fubini–Study metric on `CP²` with curvatures in `[1,4]` has `R(X, JX, Y, JY) = 2` for
  `J`-orthogonal unit `X, Y`, equal to `(2/3)(4 − 1)`: Berger's bound is sharp, and `CP²` is weakly
  but not strictly quarter pinched and is not in the interior of PIC2.

*Needs:* 5.1, 5.5; RiemannianGeometry R1 (sectional curvature on the Grassmannian).

### Examples

The constant-curvature tensor, the rank-one tensor of `S² × ℝ^(n−2)`, `S² × S²` on the boundary of
PIC2, the Fubini–Study tensor attaining Berger's bound, the dimension-three Ricci/operator
eigenvalue dictionary.

### Dependencies

Layer 5 uses Mathlib's continuous multilinear maps, exterior powers, proper cones and
spectral theory, Tau Ceti's curvature tensors, RiemannianGeometry R1, SmoothBundlesConnections B2
and 4.3. It uses nothing from Layers 6–8; 5.1–5.2 precede 4.1–4.3 in the build order.

## Layer 6: pinching sets and smooth normalized convergence

### 6.1 Pinching family to invariant set (R6.1)

A pinching family consists of closed full-dimensional convex `O(n)`-invariant cones `C(s)`,
`0 ≤ s < 1`, with positive scalar curvature on nonzero elements, strict inward `Q` on every nonzero
boundary point for positive parameters, continuity in the parameter of the scalar-normalized
compact sections in Hausdorff distance, and convergence of those sections to the positive round
ray (Böhm–Wilking, Theorem 4.1, p. 11). State this using explicit Hausdorff and epsilon conditions
on trace-one sections; prove equivalence with pointed cone convergence. For every compact initial
tensor set `K` in the initial cone interior, construct a closed convex invariant `F` containing
`K` whose tensors outside any specified later cone form a bounded set (Böhm–Wilking, Theorem 4.1;
Brendle–Schoen 2008, Propositions 16–17, pp. 16–17). Prove the translated and truncated cone lemma
with uniform transversality on compact parameter intervals, then build `F` by nested intersections
or the minimal invariant convex hull. Include all boundedness, nonempty-intersection and ODE-limit
arguments. In the PIC2 family build the Brendle–Schoen sequence with its scale fixed by `K`: choose
`h ≥ max(1, sup_(R∈K) Scal(R))` and `θ₀ > 0` with `K ⊂ C(θ₀)`, and start `F₀ = C(θ₀)`. Construct
increasing `θ_j` with `F_(j+1) = F_j ∩ {R + 2^(j+1) h I ∈ C(θ_(j+1))}` and
`F_j ∩ {Scal ≤ 2^j h} ⊂ F_(j+1)`. Prove `θ_j → 1` and that each `F_j` is closed, convex,
`O(n)`-invariant, `Q`-invariant by the translated-cone lemma, and contains `K`, and that their
intersection has the required invariance and boundedness. Equivalently normalize `K` by `h`
before the unit-shift construction and scale the resulting sets back by `h`, proving that positive
scaling preserves `Q`-invariance by the corresponding time rescaling. Here `θ = σ/(1+σ)` converts
5.5's combined unbounded parameter `σ` to the common `[0,1)` parameter; construct the inverse and
transport every continuity and transversality estimate under that reparametrization. `F` need not
be homogeneous; its asymptotic cone is the nonnegative round ray.

- The pinching-family predicate, and the equivalence of Hausdorff convergence of trace-one
  sections with pointed cone convergence.
- The translated-cone lemma: for a strictly inward cone `C(s)` and `h > 0`, the set
  `{R : R + hI ∈ C(s)}` is `Q`-invariant on the region where `Scal` is large enough.
- The invariant set `F`: closed, convex, `O(n)`-invariant, `Q`-invariant, containing `K`, with
  `F ∖ C(s)` bounded for every `s < 1`.

**Checks.**

- `θ = σ/(1+σ)` sends `σ = 0` to `0` and `σ → ∞` to `1`, with inverse `σ = θ/(1−θ)`.
- `F₀ = C(θ₀)` is a cone; `F₁ = F₀ ∩ {R + 2hI ∈ C(θ₁)}` is not scale invariant (4.3), so `F` is
  a pinching set but not a cone.
- For `K = {κ I : 1 ≤ κ ≤ 2}` every `F_j` contains the round segment and `F` is contained in a
  neighbourhood of the round ray outside a bounded set; the tensors of `F` with `Scal ≤ 2^j h`
  lie in `F_j`.
- The constant sequence `θ_j = θ₀` would give a cone, not a set whose non-round part is bounded;
  `θ_j → 1` is what makes `F ∖ C(s)` bounded for every `s < 1`.

*Needs:* 4.3, 5.3–5.5; Mathlib `ProperCone`, Hausdorff distance.

### 6.2 Coordinate and noncollapse connectors (R6.2)

Prove `C^k` control of the pullback metric on exponential balls of radius `r < π` when `K ≤ 1` and
curvature derivatives are uniformly bounded, from Jacobi equations and radial parallel frames
(RiemannianGeometry R2 and R4 item 1). Conjugate-radius control suffices here; `exp` need not be
injective. Give compactness on every smaller ball by Arzelà–Ascoli and diagonal extraction, with
positive-definite lower bounds from Rauch. Build overlapping-ball propagation and comparison of
their tensor and frame limits.

Prove the Klingenberg quantitative estimate needed after global pinching: on a closed simply
connected manifold of dimension `n ≥ 3` with `δ ≤ K ≤ 1`, `δ > ¼`, the injectivity radius is at
least `π` (Cheeger–Ebin, Theorem 5.9; Brendle–Schoen 2009, §1). Build its cut, conjugate and
short-geodesic-loop alternative on RiemannianGeometry R4 item 6's carrier `inj`. The
strict-quarter argument below applies in every `n ≥ 3`; the separate oriented even-dimensional
positive-curvature argument also includes surfaces, without a quarter-pinching hypothesis. The
`n ≥ 3` argument consumes RiemannianGeometry R3.2's finite broken-geodesic models, subdivision and
straightening, node-value Hessian and Morse index theorem, with MorseTheory M1–M3's compact-band
deformation and relative `C²` Morse approximation. Define the conjugate radius as the infimum of
first positive singular exponential times over the unit tangent bundle, with `∞` for no singular
time; include local and global versions and the `∞` conventions, isometry and pullback invariance,
`sqrt(c)` scaling, positive compact lower bounds, finite attainment and nonsingularity of every
smaller tangent ball. Prove Rauch gives `conj ≥ π` under `K ≤ 1`. Prove the Klingenberg cut lemma
(Cheeger–Ebin, Lemma 5.6): if the global injectivity minimum is less than the conjugate radius, it
is half the length of a closed geodesic, whose minimizing halves are the only minimizing segments
between its endpoints.

Own the bounded-energy version of Cheeger–Ebin Lemma 4.11 on RiemannianGeometry R3.2's finite
vertex manifold: when every critical point above `a` has Hessian index at least `2`, every path
with endpoint values at most `a` can be deformed relative to its endpoints to energy at most
`a + ε`. Prove it by compact-band finite Morse approximation, lower semicontinuity of the negative
index, and perturbing the one-dimensional path off each codimension-at-least-two positive-coordinate
locus before handle retraction. Own that relative handle retraction explicitly: on
`D^λ × D^(m−λ)` remove the cocore `{0} × D^(m−λ)`, radially retract the nonzero negative coordinate
to `∂D^λ × D^(m−λ)`, and transport through M2's handle homeomorphism, extending by the identity on
the lower sublevel. Prove continuity across the attaching overlap and fix the endpoint sublevel
pointwise. Consume RiemannianGeometry R3's no-critical-value deformation and compact-band
comparison and MorseTheory M1–M3's deformation, local Morse and relative approximation APIs; verify
here that the `C²`-small perturbation, with compact support in a larger band, preserves band
compactness and the energy error used to transport the deformed path back. This uses based paths;
no new Hilbert manifold or free-loop Morse–Bott theory is assumed.

For `δ > ¼` and `n ≥ 3`, construct the `n − 1` negative sine-parallel fields on every
fixed-endpoint geodesic of length greater than `π/sqrt(δ)`; endpoint equality has nullity and is
not counted as negative index. If a closed geodesic `γ` has length less than `2π`, choose
`max(length γ, π/sqrt(δ)) < A < 2π`. Its based nullhomotopy is captured by a finite subdivision; the
preceding lemma gives a based contraction with every length less than `A`, with the energy
normalization made explicit: for a curve on `[t₀, t₀ + T]` the pinned energy is `E(γ) = ½∫|γ′|²`,
Cauchy–Schwarz gives `Length(γ)² ≤ 2T E(γ)`, and R3.2's polygonal energy uses the same factor `½`.
Parametrize the initial geodesic loop with constant speed, so `E(γ) = Length(γ)²/(2T)`. Put
`a = max{Length(γ), π/√δ}²/(2T)` and choose `ε > 0` with `a + ε < A²/(2T)`. The based-path
deformation bound `E ≤ a + ε` then gives `Length < A` by the same inequality; this strict margin is
what the long-homotopy obstruction requires. Prove the long-homotopy obstruction: a nonconstant
geodesic loop cannot contract through based loops all of length less than `2 conj`. With a uniform
length margin, lift the contraction through `exp` to its nonsingular tangent ball; the Gauss lemma
bounds the radial escape of a closed lift by half its length, local inverse charts make the set of
liftable parameters open, and compactness makes it closed. A geodesic lift is a radial ray and
cannot be closed. Thus no closed geodesic of length less than `2π` exists. This proves the `n ≥ 3`
strict-quarter bound through Cheeger–Ebin Theorem 5.10's strict-pinch route, with the endpoint
length included in `A`.

The even-dimensional argument (Petersen, §6.2) constructs a holonomy-fixed periodic normal field,
shortens the closed cut geodesic by second variation, and takes a maximum-distance segment to the
shortened loop. At the limit this segment is perpendicular to the original loop's midpoint,
contradicting the two nonconjugate minimizing halves there. Prove the loop/cut and
endpoint-continuity lemmas used in both arguments. Also prove the closed oriented even-dimensional
positive-sectional estimate `inj ≥ π/sqrt(K_max)` used on the oriented surface cover in Layer 8.
Prove the volume lower bound of such an injectivity ball from RiemannianGeometry R4 item 1's
Günther comparison. Transfer it through the fixed finite universal-cover degree. Prove compact
connected covers have finitely many sheets (their fibres are compact discrete), and
`Vol(cover) = degree · Vol(base)` by evenly covered charts and density integration with a
partition. Myers supplies compactness of the complete universal cover once a positive Ricci lower
bound is obtained. This is a quantified noncollapse statement, not an assumption that bounded
curvature alone prevents collapse. Compare covariant derivative norms with finite-chart norms and
bound Sobolev, Hölder and interpolation constants on these controlled balls, using the shared
section spaces.

- `C^k` control and compactness of pulled-back metrics on exponential balls under curvature and
  derivative bounds.
- The conjugate radius, with `conj ≥ π` when `K ≤ 1`, and the Klingenberg cut lemma.
- Klingenberg's estimate `inj ≥ π` for closed simply connected `n ≥ 3` manifolds with
  `¼ < δ ≤ K ≤ 1`, and `inj ≥ π/sqrt(K_max)` for closed oriented even-dimensional manifolds with
  `K > 0`.
- Finite sheets and `Vol(cover) = degree · Vol(base)` for compact connected covers, and the
  volume lower bound of an injectivity ball.

**Checks.**

- The unit `Sⁿ` has `conj = inj = π`, equality in both estimates; `RPⁿ` with `K ≡ 1` and
  `n ≥ 3` has `inj = π/2 < π`, so simple connectivity cannot be dropped from Klingenberg's
  estimate; `RP²` with `K ≡ 1` has `inj = π/2 < π/sqrt(K_max)`, so orientability cannot be dropped
  from the even-dimensional estimate.
- A flat torus has `conj = ∞` and `inj` equal to half the length of its shortest closed geodesic,
  as the cut lemma asserts.
- A constant-speed curve on `[0,T]` of length `L` has `E = L²/(2T)`, so `L² = 2TE`: the
  inequality `Length² ≤ 2TE` is sharp, and a polygonal energy with factor `1` instead of `½` would
  change the threshold `a` by a factor of two.
- `Vol(Sⁿ) = 2 Vol(RPⁿ)`: the degree-two cover doubles the volume.

*Needs:* RiemannianGeometry R2, R3.2, R4 items 1, 5 and 6; MorseTheory M1–M3; HopfRinow;
UniversalCovers; DifferentialGeometry 2.3–2.4 and Layer 5; 3.2 (derivative bounds).

### 6.3 From `F` to global roundness and normalized existence (R6.3)

For `n ≥ 3` and initial tensors in `K ⊂ F`, the tensor maximum principle gives `Rm(t) ∈ F`.
Positive scalar curvature gives finite maximal unnormalized `T`. Choose curvature-record times
approaching `T`; Layer 3 supplies uniform derivative bounds after scaling the maximum sectional
curvature to one. First prove `|Rm| ≤ C_F (1 + Scal)` on `F` by the compactness of its
scalar-normalized asymptotic sections; the positive scalar minimum along this flow converts it to
the needed norm/scalar comparability. Pull back to exponential balls at a maximum point. Every
limit tensor lies on the nonnegative round ray because `F`'s non-round part is bounded. Schur in
`n ≥ 3` makes the connected-ball limit constant curvature one. Propagate on overlapping balls of
radius less than `π` to radius `2π`. The minimizing-segment index and Myers argument then bounds
the diameter by `3π/2` and makes the sectional minimum converge to one globally (Böhm–Wilking,
proof of Theorem 5.1, p. 12).

Extend from record times to all late times explicitly: scalar minima are nondecreasing; at the
record times they approach the current maximum. The last preceding record bounds the earlier
curvature maxima by a fixed multiple of the present maximum, so Layer 3's derivative estimates
apply at every late time. Repeat the local and propagation argument to obtain global min/max
ratio tending to one. This step cannot be replaced by a local limit or a subsequence-only
conclusion.

At late times global pinching is strict quarter pinching. Apply 6.2 to the simply connected finite
cover to bound the scaled volume below, and Myers and Bishop comparison to bound it above. With
fixed normalized volume these give positive lower and finite upper bounds for normalized sectional
curvature. Scalar maximum and minimum ODE comparisons now show unnormalized curvature is comparable
to `(T − t)⁻¹`; the normalization scale is comparable to that curvature. Hence `τ(t) → ∞`. Prove
normalized continuation by 3.3. These arguments establish all-time normalized existence, uniform
curvature, derivative and diameter controls, and global operator pinching tending to the round ray.

- `|Rm| ≤ C_F(1 + Scal)` on a pinching set `F`.
- Global pinching: for every `ε > 0` there is a time after which the sectional curvatures at
  every point lie within a factor `1 + ε` of each other.
- All-time normalized existence with uniform curvature, derivative and diameter bounds.

**Checks.**

- On the round `Sⁿ`, `|Rm| = sqrt(2n(n−1)) κ` and `Scal = n(n−1)κ`, so `|Rm| ≤ C_F(1 + Scal)`
  holds with `C_F = sqrt(2/(n(n−1)))`.
- On the round `Sⁿ`, `Scal_max = Scal_min = n(n−1)/(2(n−1)(T − t))`: unnormalized curvature is
  exactly comparable to `(T − t)⁻¹`, and `τ → ∞` by 1.3.
- For a flow that is never round, such as a product `S² × S²` (not in the interior of any
  pinching cone, 5.5), no conclusion is asserted.

*Needs:* 1.3, 3.2, 3.3, 4.2, 6.1, 6.2; RiemannianGeometry R1 (Schur), R4 items 1 and 5.

### 6.4 Fixed-manifold smooth convergence (R6.4)

Prove the remaining analytic convergence step intrinsically. Let `E = Ric# − (Scal/n) Id` be the
traceless Ricci endomorphism; define `(Rm*E)_ij = Σ_pq r_ipjq E_pq` in an orthonormal frame and
prove its invariant contraction formula. In normalized flow derive

`(∂_τ − L_g) E = 2 Rm*E + (2/n)(Scal − r̄) E − (2/n)|E|² Id`.

For an operator globally sufficiently close to `κ Id`, `κ = r̄/(n(n−1))` bounded above and away
from zero, the constant-curvature contraction on tracefree `E` is `−κE`. The norm equation and
6.3's global pinching give `(∂_τ − L_g)|E|² ≤ −2|∇E|² − c|E|²`, `c > 0`, for all late `τ`. Prove
the finite-dimensional contraction norm bound and choose an explicit small pinching threshold
depending on `n` to absorb every error. The maximum principle gives exponential decay of `E`;
Layer 3's derivative interpolation gives decay of every covariant derivative. Contracted Bianchi
gives `div E = ((n−2)/(2n)) d Scal`; `n ≥ 3` is essential. Diameter control therefore makes
`Scal − r̄` and all its spatial derivatives decay exponentially.

Since `∂_τ g = −2 E_cov − (2/n)(Scal − r̄) g`, its metric norm is time integrable. Integrate to get
uniform equivalence to one late reference metric. The connection-variation formula and decaying
derivatives transfer all higher estimates to this fixed connection, inductively, making `∂_τ g`
integrable in every `C^k` norm. Construct a positive `C^∞` limit `g_∞` on the original `M` and
prove exponential `C^k` convergence. 6.3's pinching tending to one makes this limit constant
positive curvature; an Einstein limit alone would not suffice. Derive also
`g(t)/(2(n−1)(T − t)) → g_round` with curvature one (Brendle–Schoen 2009, Theorem 4.7, p. 22) by
differentiating the inverse scale `b = 1/a`, with `db/dt = −2r̄(ĝ)/n`, `b(T) = 0` and
`b/(T − t) → 2(n−1)κ_∞`; the limit is `κ_∞ g_∞`, of curvature one. This gives the factors `4` in
dimension three and `6` in dimension four. This proof supplies the convergence step used by the
curvature-cone theorems; no unproved near-round stability theorem or metric-slice construction is
assumed.

- The traceless-Ricci evolution and the differential inequality for `|E|²`.
- Exponential decay of `E`, of `Scal − r̄` and of all their covariant derivatives.
- Smooth convergence of the normalized flow on the fixed manifold to a metric of constant
  positive curvature, and the unnormalized rescaling statement.

**Checks.**

- With `r_ipjq = κ(δ_ij δ_pq − δ_iq δ_pj)` and `tr E = 0`, `Σ_pq r_ipjq E_pq = κ(δ_ij tr E − E_ji)
  = −κ E_ij`: the constant-curvature contraction is `−κE`.
- `div Ric = ½ d Scal` and `div((Scal/n) g) = (1/n) d Scal` give `div E = (½ − 1/n) d Scal =
  ((n−2)/(2n)) d Scal`; in dimension two `E ≡ 0` and the formula reads `0 = 0`, so it carries no
  information there.
- On the round `Sⁿ`, `g(t) = 2(n−1)(T − t) g₀` with `T = 1/(2(n−1))`, so the rescaled metric is
  `g₀` for all `t`, of curvature one; the factor is `4` for `n = 3` and `6` for `n = 4`.
- A hyperbolic metric has `E ≡ 0` and is a stationary normalized flow with negative constant
  curvature: `E → 0` alone gives an Einstein limit, and the positivity of the limit comes from 6.3.

*Needs:* 1.2, 1.3, 3.2, 4.1, 4.2, 6.3; RiemannianGeometry R1 (contracted Bianchi).

### Examples

The round sphere's rescaled metric, the pinching set from a round segment, the flat torus's
conjugate and injectivity radii, `RPⁿ` and `RP²` as the sharp non-examples for Klingenberg's
estimates.

### Dependencies

Layer 6 uses Layers 1, 3, 4 and 5, RiemannianGeometry R1–R4, MorseTheory M1–M3, HopfRinow,
UniversalCovers and DifferentialGeometry 2.3–2.4 and Layer 5. It uses nothing from Layers 7–8.

## Layer 7: positive curvature operators and pointwise sphere theorems

### 7.1 Böhm–Wilking and Hamilton (R7.1)

Apply Layer 5's 2-nonnegative pinching family and Layer 6 to every closed connected `n ≥ 3`
initial metric with 2-positive curvature operator. Prove volume-normalized all-time `C^∞`
convergence to a positive constant-curvature metric, and the unnormalized round scaling
(Böhm–Wilking, Theorem 1, p. 1, and Theorem 5.1, p. 12). Positive operator is a special case. In
`n = 3` use the explicit Ricci-pinch family and the positive-Ricci/2-positive equivalence of 5.3;
conclude Hamilton's theorem with its full smooth metric convergence (Topping, Theorem 10.1.1,
p. 123); its metric form is `hamilton_positiveRicci_dim3`. In `n = 4` obtain the positive-operator
sphere theorem, keeping positivity on all bivectors rather than replacing it by basis-diagonal
sectional positivity.

- Böhm–Wilking: a closed connected manifold of dimension `n ≥ 3` with 2-positive curvature
  operator carries a metric of constant positive curvature, the limit of its normalized flow.
- Hamilton (`hamilton_positiveRicci_dim3`): a closed connected three-manifold with positive Ricci
  curvature carries a metric of constant positive curvature.

**Checks.**

- `RP³` with its round metric has positive Ricci curvature; the conclusion is a constant-curvature
  metric, and the space form `S³/Γ` with `Γ = {±1}` is not `S³`, so the diffeomorphism conclusion
  needs simple connectivity (7.3).
- `S² × S¹` with the product metric has `Ric ≥ 0` but `Ric(∂_θ, ∂_θ) = 0`; it carries no metric
  of positive constant curvature (its fundamental group is infinite), so strict positivity cannot
  be weakened to nonnegativity.
- On `S² × S²` the curvature operator has the eigenvalue `0` on `e₁ ∧ e₃` and the sum of its two
  smallest eigenvalues is `0`: 2-nonnegative but not 2-positive, and not a space form.
- A positive curvature operator in dimension four is 2-positive; positivity of
  `⟨Rop(e_i ∧ e_j), e_i ∧ e_j⟩` on a basis of decomposable bivectors is weaker and is not the
  hypothesis.

*Needs:* 5.3, 5.4, 6.1, 6.3, 6.4.

### 7.2 Brendle–Schoen (R7.2)

For `n ≥ 4` and a closed connected metric whose curvature lies in the interior of PIC2, apply the
deformed cones of 5.5 and Layer 6: the normalized flow exists for all time and converges smoothly
to a round metric (Brendle–Schoen 2008, Theorem 3, p. 4; Brendle–Schoen 2009, Theorem 4.7,
p. 22). Pointwise strict quarter pinching implies this hypothesis by 5.6
(`strict_quarterPinching_isPIC2`), which gives `brendleSchoen_pointwise_quarterPinched`
(Brendle–Schoen 2008, Theorem 1, p. 1). State pointwise pinching as `0 < K_x(π) < 4 K_x(π′)` for
all two-planes at the same point; it is different from one pair of global bounds over all points.
The strict theorem supplies a diffeomorphism to a spherical space form, and for simply connected
`M` a diffeomorphism to `Sⁿ` (`brendleSchoen_diffeomorph_sphere`, through 7.3). Neither PIC alone
nor weak quarter pinching is substituted for its hypothesis.

- Interior PIC2 on a closed connected `n ≥ 4` manifold gives a constant positive curvature metric,
  the limit of the normalized flow.
- `brendleSchoen_pointwise_quarterPinched` and `brendleSchoen_diffeomorph_sphere`.

**Checks.**

- `CP²` with the Fubini–Study metric has `1 ≤ K ≤ 4` with both values attained at every point,
  so it is weakly but not strictly pointwise pinched; it is not diffeomorphic to `S⁴` (its second
  Betti number is `1`), so the strict inequality cannot be weakened.
- A metric on `S⁴` with `1 ≤ K ≤ 3` at every point is pointwise strictly quarter pinched; a
  metric with `K ∈ [1, 3]` at one point and `K ∈ [5, 7]` at another is pointwise strictly quarter
  pinched but not globally quarter pinched, and the theorem applies to it.
- `S² × S²` has `K ∈ [0,1]`, is not pointwise pinched, and is not a space form.

*Needs:* 5.5, 5.6, 6.1, 6.3, 6.4, 7.3.

### 7.3 Space forms, naturality and equivariance (R7.3)

On the same smooth manifold use RiemannianGeometry R4 item 7's complete positive
constant-curvature model and covering classification to construct the diffeomorphism to `Sⁿ/Γ`,
with `Γ` finite acting freely by orthogonal transformations. Simple connectivity makes `Γ`
trivial, giving `Diffeomorph I (𝓡 n) M Sⁿ ∞` for the round sphere
`Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1` with its charted-space structure. Compare
the native sphere's induced Riemannian metric and smooth structure; its ambient chordal distance
is not the round geodesic distance. Do not infer a homeomorphism or diffeomorphism merely from
vanishing Betti numbers.

Uniqueness makes every initial isometry preserve the evolving metrics and the limit. For a group
acting by smooth initial isometries, transport the action to the round quotient. In the simply
connected case obtain an equivariant diffeomorphism to `Sⁿ` and a homomorphism to `O(n+1)`
(Brendle–Schoen 2008, Theorem 2, p. 1). For a jointly smooth compact Lie action prove the resulting
orthogonal homomorphism smooth by evaluating on a fixed round-sphere frame of points; no
unconstructed general isometry-group Lie structure is needed. Include restrictions, commuting
actions, finite cover and descent, and normalized-volume compatibility.

- A closed connected manifold with a metric of constant positive curvature is diffeomorphic to
  `Sⁿ/Γ`, and to `Sⁿ` when simply connected.
- Isometries of the initial metric are isometries of every `g(t)` and of the limit; the
  equivariant diffeomorphism and the homomorphism to `O(n+1)`.

**Checks.**

- The antipodal map of `Sⁿ` is an isometry of the round flow; the quotient `RPⁿ` is the space form
  with `Γ = {±1}`.
- The chordal distance between antipodal points of the unit sphere is `2` while the round
  geodesic distance is `π`: the induced metric from `EuclideanSpace` and the round metric differ as
  metrics but define the same smooth structure.
- A homology sphere that is not simply connected (the Poincaré sphere `S³/I*`) has the Betti
  numbers of `S³` and is not diffeomorphic to it: Betti numbers alone never give the conclusion.

*Needs:* 2.4 (uniqueness and naturality), 6.4; RiemannianGeometry R4 item 7; UniversalCovers;
Mathlib `Diffeomorph`, the sphere's charted-space instances.

### Examples

`RP³` and `S³/Γ` as positive-Ricci space forms, `CP²` as the weakly pinched non-example, the
antipodal map as an equivariance example.

### Dependencies

Layer 7 uses Layers 2–6, RiemannianGeometry R4 and UniversalCovers. It uses nothing from Layer 8.

## Layer 8: positive surfaces and the complete global sphere statement

### 8.1 Surface potential, Harnack and entropy (R8.1)

In dimension two identify `Ric = (Scal/2) g`. Set `R = Scal` and `r = r̄`; normalized flow has
`∂_τ g = (r − R) g`, `∂_τ R = L_g R + R(R − r)`, and `r` is constant by variation of `∫R` and
volume (Santoro, §4.1, pp. 26–28). Preserve `R > 0`. Construct the smoothly time-dependent
potential `f` with `L_g f = R − r`, unique modulo time constants, on the shared mean-zero Sobolev
and smooth carriers (Santoro, Lemmas 4.2.1–4.2.2, pp. 33–34). Prove dependence and differentiation
of the inverse on each finite slab, using its kernel and complement projections; choose the time
constant so `∂_τ f = L_g f + r f`. For `M = Hess f − ½(L_g f) g` and `h = R − r + |∇f|²` prove
`(∂_τ − L_g) h = r h − 2|M|²` (Santoro, Lemma 4.2.3, p. 34, and Theorem 4.2.1, p. 35). This gives
curvature bounds on every finite normalized interval and all-time existence before the entropy
argument is used.

For `L = log R` and `Q = L_g L + R − r` derive `(∂_τ − L_g − 2∇L·∇) Q = 2|Hess L + ½(R − r) g|² +
r Q ≥ Q² + r Q` (Santoro, Theorem 4.4.2, p. 40). Prove `Q ≥ −r/(1 − exp(−rτ))` and integrate
along space-time paths to obtain Hamilton's Harnack inequality with the time factor
`exp(rτ) − 1` and the evolving-metric path energy (Santoro, Theorem 4.4.3, p. 41). Derive
`d/dτ ∫ R log R = ∫ (R − r)² − ∫ |∇R|²/R`. The weighted average `Z = (∫ QR)/(∫ R)` satisfies
`Z′ ≥ Z² + rZ`; global existence forces `Z ≤ 0`, so the entropy is nonincreasing.

- The surface potential `f`, with `L_g f = R − r` and the chosen time normalization.
- The evolution of `h`, the resulting finite-interval curvature bounds and all-time normalized
  existence for `R > 0`.
- The Harnack inequality and the monotone entropy.

**Checks.**

- With `n = 2` and `Ric = (R/2) g`, `−2 Ric + (2/n) r̄ g = (r − R) g`, and `∂_t R = L_g R + 2|Ric|²
  = L_g R + R²` becomes `∂_τ R = L_g R + R(R − r)` after normalization.
- `∫ R dμ = 4πχ(M)` by Gauss–Bonnet and the area is constant under normalized flow, so `r` is
  constant; the direct variation calculation of `∫R` gives the same.
- On the round sphere `R ≡ r`, `f` is constant, `M = 0`, `h = 0`, `Q = 0` and the Harnack bound
  `Q ≥ −r/(1 − e^(−rτ))` holds strictly; the entropy is constant.
- `Hess f = ((R − r)/2) g + M` has trace `R − r = L_g f`, consistent with the potential equation;
  the opposite sign `L_g f = r − R` would make `h` evolve with `+2|M|²`.

*Needs:* 1.2, 1.3, 3.1, 4.1, 4.2; VariationalMethods §3.4; ComplexKahlerGeometry K5a;
RiemannianGeometry R7.0.

### 8.2 Uniform surface geometry (R8.2)

Pass to the oriented cover when necessary (DifferentialGeometry 2.4). Positive `R` makes the
scalar average `r` strictly positive directly; the constancy of `∫R` is the 8.1 evolution and
Stokes calculation; no Euler-number or simple-connectivity argument is needed here. Use 6.2's
oriented even-dimensional injectivity estimate and Günther comparison on that cover. If the scalar
maximum is `A`, the short interval of length `c/A` has `R ≤ 2A`; Harnack gives `R ≥ cA` on a ball
of radius `c/sqrt(A)`, whose area is at least `c/A`. Thus the entropy is at least `c log A − C`
(bound the negative contribution outside the ball separately), proving a uniform scalar upper
bound (Santoro, Theorem 4.4.4, p. 44). Injectivity, fixed area and ball-volume comparison bound the
diameter. Harnack plus the positive constant average `r` then gives a uniform positive lower bound.
Derive uniform curvature derivatives and controlled Sobolev and Hölder constants. Construct the
uniform mean-zero inverse estimates by the Bochner–Lichnerowicz bound on the first scalar
eigenvalue (RiemannianGeometry R7.0) and VariationalMethods §3.4's kernel-orthogonal Poincaré and
§4.4's Rayleigh comparison, proving the spectral bound from the Hessian trace Cauchy–Schwarz
inequality rather than assuming it.

- Uniform two-sided bounds `0 < c ≤ R ≤ C` for all normalized times, uniform diameter and
  injectivity bounds, uniform derivative bounds.
- Uniform mean-zero elliptic estimates for `L_g` along the flow.

**Checks.**

- On the round sphere of area `4π`, `R ≡ 2`, `r = 2`, `inj = π`, `diam = π`; the uniform bounds
  hold with `c = C = 2`.
- On `RP²` with `R ≡ 2` the oriented cover is the round sphere of twice the area; `inj(RP²) =
  π/2` while the cover has `inj = π`, which is why the injectivity estimate is applied on the cover.
- The Lichnerowicz bound on a surface with `R ≥ 2c` gives first eigenvalue at least `2c`, with
  equality on the round sphere of curvature `c`; the scalar Bochner identity's Hessian term is
  bounded below by `(Δf)²/2`, the Cauchy–Schwarz step.

*Needs:* 6.2, 8.1; DifferentialGeometry 2.4; RiemannianGeometry R4 item 1, R7.0;
VariationalMethods §3.4, §4.4.

### 8.3 Soliton rigidity and convergence (R8.3)

Prove `(∂_τ − L_g)|M|² = −2|∇M|² − 2R|M|²` (Santoro, Lemma 4.4.1, p. 45) and exponential decay of
all derivatives. Pull back along `+grad f`: the modified metric derivative is `+2M`. Its
integrable derivatives give a smooth limit with `M = 0` and `Ric − Hess f = (r/2) g`; the Layer 1
gradient-soliton potential is `−f`. This is a gradient shrinking soliton, with positive `r/2`.
Prove such a soliton on a closed surface is round, using the Chen–Lu–Tian argument independently
of uniformization and Kazdan–Warner (Chen–Lu–Tian, Lemma 1, p. 1, and Proposition 2, p. 2):
`J grad f` is Killing on the oriented cover and vanishes at an extremum. Its nonzero derivative at
a zero produces an effective circle isometry action. Build the orbit-interval and polar metric
`ds² + H(s)² dθ²` from Killing-flow, normal-geodesic and isometry value/tangent uniqueness,
proving smooth pole conditions `H(0) = H(A) = 0`, `H′(0) = −H′(A) = 1`. The soliton equations imply
`f′ = aH`; multiplying the curvature equation by `HH′` and integrating gives `a ∫₀ᴬ H(H′)² = 0`, so
`a = 0`. Include the identically zero Killing field and orientation-cover descent. A compact
higher-dimensional soliton is not asserted to satisfy this rigidity.

The modified metric converges exponentially to its round limit. Curvature norms and `r` are
invariant under pullback, so the original flow has exponential decay of `R − r` and its covariant
derivatives. Integrate `∂_τ g = (r − R) g` for fixed-reference norm equivalence and use Layer 1's
connection variation, as in 6.4, to transfer all covariant decay to fixed `C^k` norms. This makes
`∂_τ g` exponentially integrable in every fixed `C^k` norm and directly constructs the original
flow's positive smooth limit, with `R ≡ r > 0` and hence round.

Uniform elliptic estimates give exponential decay of the spatially mean-zero potential in every
fixed `C^k` norm, and of every derivative of its gradient. Subtracting its time-dependent spatial
mean leaves the gradient and `M` unchanged; it need not preserve the earlier choice
`∂_τ f = L_g f + r f`. 2.4's integrable-gauge criterion therefore supplies a limiting
diffeomorphism and identifies the modified and original round limits by its pullback. The
fixed-norm transfer is required: convergence only after a time-dependent pullback is
insufficient. Conclude the positive-Gauss surface space-form theorem (`positiveScalar_surface`;
Santoro, Theorem 4.0.3, p. 26), including `S²` and `RP²` and cover descent.

- The `|M|²` evolution and exponential decay of `M` and its derivatives.
- Closed-surface shrinking gradient solitons are round.
- `positiveScalar_surface`: a closed connected surface with `R > 0` carries a metric of constant
  positive curvature, the smooth limit of its normalized flow on the fixed manifold.

**Checks.**

- The round sphere `H(s) = sin s` on `[0, π]` has `H(0) = H(π) = 0`, `H′(0) = 1`, `H′(π) = −1`,
  the pole conditions; a cone metric `H(s) = cs` with `c ≠ 1` fails smoothness at the pole.
- On a round soliton `f` is constant, `a = 0` and `∫₀ᴬ H(H′)² = ∫₀^π sin s cos² s ds = 2/3 ≠ 0`,
  so `a ∫ H(H′)² = 0` forces `a = 0`, not the integral to vanish.
- In dimension two `Ric − Hess f = (r/2) g` traced gives `L_g f = R − r`, consistent with 8.1; the
  Layer 1 convention `Ric + Hess(−f) = λ g` has `λ = r/2 > 0`, a shrinker.
- A gauge field with `‖X(τ)‖_(C^k) ≤ C_k e^(−cτ)` for every `k` satisfies 2.4's integrability
  criterion, while `‖X(τ)‖ = 1/(1+τ)` does not: exponential decay of the mean-zero potential, not
  mere decay, is what the limiting diffeomorphism needs.

*Needs:* 1.2, 1.4, 2.4, 3.2, 6.4, 8.1, 8.2; DifferentialGeometry 2.4; HopfRinow (normal geodesics).

### 8.4 The global quarter-pinched sphere theorem (R8.4)

Prove the global theorem (`global_quarterPinched_diffeomorph_sphere`): a closed simply connected
manifold of dimension `n ≥ 2` whose sectional curvatures satisfy fixed bounds `0 < a ≤ K ≤ b < 4a`
at all points is diffeomorphic to `Sⁿ` (the homeomorphism form is Berger–Klingenberg,
Brendle–Schoen 2009, Theorem 1.1, p. 1; the diffeomorphism form is Brendle–Schoen 2008, Theorem 1,
p. 1, together with Hamilton in dimension three and Layer 8 in dimension two). Myers first proves
compactness when the hypothesis is stated for a complete manifold. Apply 7.2 for `n ≥ 4`, 7.1 for
`n = 3` (global quarter pinching with `a > 0` gives positive sectional, hence positive Ricci,
curvature) and 8.1–8.3 for `n = 2` (positive sectional curvature is positive Gauss curvature);
7.3 gives the diffeomorphism and hence the homeomorphism. Record the companion statements proved
along the way: a closed simply connected three-manifold with positive Ricci curvature is
diffeomorphic to `S³` (Topping, Theorem 10.1.1, p. 123, with 7.3), and a closed simply connected
four-manifold with positive curvature operator is diffeomorphic to `S⁴` (Böhm–Wilking, Theorem 1,
p. 1, with 7.3), where positivity is on every bivector and positive entries on a selected wedge
basis do not meet the hypothesis. RiemannianGeometry R7's Bochner statement stays separate; the
flow convergence and the space-form comparison are the suppliers here.

For a compact pointwise-quarter-pinched metric the modern theorem has `n ≥ 4`; in dimensions two
and three positive sectional curvature implies the separately proved positive-Gauss and
positive-Ricci inputs. The global theorem has a fixed positive lower bound and a dimension at
least two; vacuous plane conditions in dimensions zero and one do not imply a sphere theorem. The
Checks of this roadmap include round, flat and Einstein scaling and volume normalization,
nonorientable density calculations, a round quotient with nontrivial `Γ`, the PIC2 versus PIC and
weak-quarter projective-space distinctions, and the Ricci linearization's pure gauge kernel versus
DeTurck's scalar principal part. Surgery, geometrization and Kähler–Ricci evolution belong to
their own developments and are not implied by the preceding assertions.

- `global_quarterPinched_diffeomorph_sphere`, in every dimension `n ≥ 2`.
- The three-dimensional positive-Ricci and four-dimensional positive-operator diffeomorphism
  statements for simply connected manifolds.

**Checks.**

- The hypothesis `0 < a ≤ K ≤ b < 4a` with `(a, b) = (1, 3)` is satisfied by a metric with
  `K ∈ [1, 3]`, and Brendle–Schoen 2009's normalization `K ∈ (1, 4]` is the case `b = 4`,
  `a = min K > 1`, attained by compactness.
- `CP²` with `K ∈ [1, 4]` satisfies `a ≤ K ≤ 4a` with `a = 1` but not `b < 4a`; it is not a sphere,
  so the strict inequality is necessary.
- In dimension one there are no two-planes, so the sectional hypothesis is vacuous, and there is
  no closed simply connected one-manifold; in dimension zero a point carries no curvature. The
  statement is made for `n ≥ 2`, and the hypothesis `2 ≤ n` records this.
- In dimension three a metric with `K ∈ [1, 3]` has `Ric ≥ 2 g > 0`, so 7.1 applies; in dimension
  two it has `R = 2K ≥ 2 > 0`, so 8.3 applies.

*Needs:* 7.1–7.3, 8.1–8.3; RiemannianGeometry R4 items 5 and 7.

### Examples

The round sphere with `K ∈ (1, 4]` after scaling, `CP²` at the borderline, the three-dimensional
positive-Ricci and four-dimensional positive-operator statements.

### Dependencies

Layer 8 uses Layers 1–4 and 6–7, DifferentialGeometry 2.4, RiemannianGeometry R4 and R7.0,
VariationalMethods §3.4 and §4.4, ComplexKahlerGeometry K5a and HopfRinow.

## Downstream consumers

[Poincare3D](../Poincare3D/README.md) consumes Layers 1–5 (metric families, the compact-bundle
parabolic theory, the DeTurck gauge, existence, uniqueness, continuation, curvature evolution and
the maximum principles) for its three-dimensional flow analysis.
[GeometricTopology](../GeometricTopology/README.md) consumes the sphere theorems and the
three-dimensional positive-Ricci statement and owns the Poincaré-conjecture reductions that need
surgery. [RiemannianGeometry](../RiemannianGeometry/README.md) records that this roadmap owns the
differentiable sphere theorem and Hamilton's three-dimensional theorem.

## References

- S. Brendle and R. Schoen, Manifolds with 1/4-pinched curvature are space forms, J. Amer. Math.
  Soc. 22 (2009), 287–307; [arXiv:0705.0766](https://arxiv.org/abs/0705.0766) (cited as
  Brendle–Schoen 2008, §§1–4; Theorems 1–3, Propositions 8–17 and 21, with the arXiv version's
  page numbers).
- C. Böhm and B. Wilking, Manifolds with positive curvature operators are space forms, Ann. of
  Math. 167 (2008), 1079–1097; [arXiv:math/0606187](https://arxiv.org/abs/math/0606187) (cited as
  Böhm–Wilking, §§2–5; Theorems 1, 2, 3.1, 4.1, 5.1, Proposition 3.2, Corollaries 2.3 and 3.3,
  Lemmas 3.4–3.5, with the arXiv version's page numbers).
- S. Brendle and R. Schoen, Sphere theorems in geometry, Surveys in Differential Geometry XIII
  (2009); [arXiv:0904.2604](https://arxiv.org/abs/0904.2604) (cited as Brendle–Schoen 2009;
  Theorem 1.1 for Berger–Klingenberg, Theorem 4.7 for the rescaled convergence).
- P. Topping, Lectures on the Ricci flow, London Math. Soc. Lecture Note Series 325 (2006);
  [author's notes](https://warwick.ac.uk/fac/sci/maths/people/staff/peter_topping/rfnotes/)
  (cited as Topping, with the printed page numbers of the March 2006 notes: metric variations
  §2.3, the Ricci flow evolution equations §2.5, curvature control §3.2, Shi's estimates
  Theorem 3.3.1, DeTurck's trick §5.2 and Theorem 5.2.1, blow-up Theorem 5.3.1, the vector-bundle
  maximum principle Theorem 9.6.1, the three-dimensional pinching Theorem 9.7.5 and Hamilton's
  Theorem 10.1.1).
- B. Santoro, Introduction to evolution equations in geometry, lecture notes (2012);
  [arXiv:1205.1039](https://arxiv.org/abs/1205.1039) (cited as Santoro: the surface potential,
  Harnack and entropy calculations of §§4.1–4.4, with this roadmap's conventions fixing signs and
  normalizations).
- X. Chen, P. Lu and G. Tian, A note on uniformization of Riemann surfaces by Ricci flow, Proc.
  Amer. Math. Soc. 134 (2006), 3391–3393; [arXiv:math/0505163](https://arxiv.org/abs/math/0505163)
  (cited as Chen–Lu–Tian, Lemma 1 and Proposition 2, the surface soliton rigidity).
- J. Cheeger and D. G. Ebin, Comparison theorems in Riemannian geometry, AMS Chelsea (2008):
  Lemma 4.11 (path deformation under an index hypothesis), Lemma 5.6 (the Klingenberg cut lemma),
  Theorems 5.9–5.10 (the injectivity-radius estimates); uncertified, cited by locator.
- P. Petersen, Riemannian geometry, 3rd edition, Graduate Texts in Mathematics 171, Springer
  (2016), §6.2 (the even-dimensional injectivity estimate); uncertified, cited by locator.
- R. S. Hamilton, Three-manifolds with positive Ricci curvature, J. Differential Geom. 17 (1982),
  255–306, and Four-manifolds with positive curvature operator, J. Differential Geom. 24 (1986),
  153–179: the original theorems of 7.1; uncertified, cited by locator.
- An external Lean development of Ricci flow on smooth metrics exists at
  [qinz1yang/differential-geometry](https://github.com/qinz1yang/differential-geometry/tree/main/DifferentialGeometry/Geometry/Flow/RicciFlow);
  its interfaces informed the shape of Layers 2–3, and nothing here imports it.
