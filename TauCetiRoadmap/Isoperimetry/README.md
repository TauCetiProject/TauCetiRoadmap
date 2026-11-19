# Euclidean isoperimetry, sharp inequalities, and rigidity

Build Euclidean isoperimetric theory on Mathlib and Tau Ceti, including the sharp inequality
for all finite-volume finite-perimeter sets in every dimension `n ≥ 2`, equality exactly
for balls up to null sets, and the classical theorem for every rectifiable planar Jordan
curve, with equality exactly for circles. Develop the supporting convex and functional
inequalities as reusable mathematics: Prékopa–Leindler, Brunn–Minkowski, symmetrization,
sharp BV Sobolev, and the periodic curve inequality with its equality analysis.

Develop the theory independently on canonical Mathlib and Tau Ceti APIs. Every milestone
is required. Quantitative stability, anisotropic perimeter, and
isoperimetric inequalities on curved ambient manifolds are outside this roadmap.
[Suggested.lean](Suggested.lean) illustrates interfaces; this README is definitive.

## Constants, statements, and scope

Work in `EuclideanSpace ℝ (Fin n)` and transport to arbitrary finite-dimensional real
inner-product spaces by linear isometries. Let `ω_n = volume (ball 0 1)`. Use normalized
Euclidean Hausdorff measure `μHE[k]`, written `Hᵏ`, and the perimeter measure defined by
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G3–G5. In dimension two,
`ω_2 = π` and the oriented real plane is `ℂ`.
Set measurability in the general statements is Lebesgue measurability
(`NullMeasurableSet E volume`), with Borel-representative versions and a.e. transport;
`MeasurableSet` is used where the result explicitly concerns Borel sets.

For a measurable set `E` with finite volume and finite perimeter, establish

```
P(E)^n ≥ n^n ω_n |E|^(n−1),                         n ≥ 2.
```

For `0 < |E| < ∞`, equality holds **if and only if** there are `c` and `r > 0` such that
`χ_E = χ_(ball c r)` a.e. with respect to `volume`. No boundedness, connectedness, convexity,
or boundary regularity is imposed on `E`. For zero volume, prove perimeter zero and the
corresponding degenerate inequality separately. Provide extended nonnegative statements,
and real-valued versions carrying the required finiteness hypotheses. Never turn an
infinite perimeter into zero by using `ENNReal.toReal` without those hypotheses.

For a rectifiable Jordan curve `C` let `Ω = TauCeti.filledHull C \ C`, let
`A = volume Ω`, and let `L = H¹(C)`. Establish

```
4π A ≤ L²,       4π A = L² ↔ ∃ c r, 0 < r ∧ C = sphere c r.
```

Include the raw-curve formulation for every continuous `γ : ℝ → ℂ` on `[a,b]`, `a < b`,
with `γ(a)=γ(b)`, injective on `[a,b)`, and `BoundedVariationOn γ [a,b]`. In that formulation
`C = γ '' [a,b]` and `L = eVariationOn γ [a,b]`; show agreement with the geometric formulation.
Do not require the supplied parametrization to be AC, Lipschitz, differentiable, or
piecewise smooth. The curve equality is literal equality of traces with a circle; the
set equality above is equality a.e. These are different assertions with a required bridge.

## Dependencies and ownership

- [GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G1–G2, supplies arclength,
  normalized Hausdorff length and surface measure, area/coarea, and sphere normalization.
  G3–G5 supplies BV, finite perimeter, strict approximation, reduced boundary, and
  `P(E) ≤ Hⁿ⁻¹(frontier E)`. G6 supplies Gauss–Green and
  `P(filledHull C \ C) = H¹(C)` for rectifiable Jordan curves.
- [DifferentialGeometry](../DifferentialGeometry/README.md), 5.6.1–5.6.3, supplies AC
  winding-number calculus and Green's genuine planar area identity. It retains ownership
  of curve integration and Green's theorem. I3 below owns the sharp periodic inequalities
  and their equality cases. The area and length bridge uses the existing curve APIs.
  The [Green layer 5.6 specification](https://github.com/TauCetiProject/TauCetiRoadmap/pull/826)
  supplies these flat planar targets.
- [ConformalMapping](../../Completed/ConformalMapping/README.md), L5, owns the Jordan-separation and
  filled-hull targets: exactly two complementary components, one bounded and one unbounded,
  with inside `filledHull C \ C` and frontier `C`. Use the implemented
  `TauCeti.IsJordanCurve` and `TauCeti.filledHull`;
  no private predicate for a Jordan curve or surrogate for its inside.
- [PDE](../PDE/README.md), Lane A, owns weak Sobolev spaces, density, domain Poincaré and
  trace theory. This roadmap owns sharp Euclidean BV Sobolev and the periodic sharp
  Wirtinger equality theorem, with comparisons to that canonical weak derivative.
  PDE's nonsharp estimates do not depend on this roadmap.

The geometric foundation has no dependency on the sharp inequality. I1–I2 can be developed
alongside it. I3's analytic inequalities use the existing AC calculus and the Green/length
inputs; their identification with actual Jordan area also consumes GMT G6's Jordan index
theorem. I4 consumes GMT G2–G5, I1, and I2's set symmetrization and convex geometry.
I5 consumes I1, I2, I4, GMT G2–G5, and PDE's weak-derivative API; I6 consumes I3–I4,
GMT G6, and Jordan topology.
No optimal-transport theorem is an assumed input. Any analytic, geometric, or equality
lemma needed to complete these milestones and absent from their stated inputs is a target
here, including the proof machinery enumerated in I2 and I4.

## Existing floor and design evidence

Consume Mathlib's `Convex`, `ConvexBody`, pointwise set addition and scalar multiplication,
`volume`, Brunn–Minkowski-compatible set operations, Fourier series and Hilbert bases,
and the interval AC FTC. Keep a.e. function arguments on the existing measure-theory API.
For compact convex sets use [`ConvexBody`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Convex/Body.html)
where its hypotheses match; positive volume and nonempty interior are separate hypotheses,
not silently added to its definition. Do not model Minkowski addition as an additive group.

Follow the [Brunn–Minkowski/Prékopa–Leindler discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Brunn-Minkowski%20Inequality%20%2B%20Theory)
and [convex-body API discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Convex%20bodies).
[Mathlib4#44802](https://github.com/leanprover-community/mathlib4/pull/44802) develops
one-dimensional Brunn–Minkowski, including `Real.volume_add_volume_le` and the compact-set
version. Adopt Mathlib's resulting signatures and naming; build missing versions in Tau
Ceti in that shape without waiting for upstream. Consume imported results whenever they
express a target. These design references do not discharge the higher-dimensional,
measurability, or equality targets below.

## I1 — Prékopa–Leindler and Brunn–Minkowski

Prove Prékopa–Leindler in every finite dimension for nonnegative measurable functions,
in its weighted extended-integral form: for `0 < θ < 1`,

```
h((1−θ)x + θy) ≥ f(x)^(1−θ) g(y)^θ
⇒ ∫ h ≥ (∫ f)^(1−θ) (∫ g)^θ.
```

State the pointwise hypothesis on measurable representatives. Include integrable real
versions, zero-integral and infinite-integral cases with explicit conventions, linear
isometric transport, product/tensorization, approximation, and the one-dimensional
monotone-transport or equivalent integral argument. The induction, parameter measurability,
and Tonelli steps are part of the target. Do not assume equality characterization for
arbitrary Prékopa–Leindler functions.

Derive Brunn–Minkowski for nonempty compact sets, then nonempty bounded Borel sets and
nonempty arbitrary measurable finite-volume sets, with outer-measure formulations when
their sum is not measurable:

```
|A + B|^(1/n) ≥ |A|^(1/n) + |B|^(1/n),              n ≥ 1.
```

Retain nonemptiness even in zero-volume cases; the unweighted inequality is false when
one summand is empty and the other has positive volume. Supply the weighted Minkowski
version for `0 ≤ θ ≤ 1`,
`|(1−θ) • A + θ • B|^(1/n) ≥ (1−θ)|A|^(1/n) + θ|B|^(1/n)`
and the elementary translation/dilation laws,
monotonicity, continuity for decreasing compact sets and the neighborhood approximation
needed for passing to measurable sets. Address measurability explicitly: the sum of two
Lebesgue measurable sets is not an automatically measurable input. Include positive-volume
**compact convex** equality: for `0 < θ < 1`, equality in the weighted inequality holds
exactly when `B = c + λ • A` for some translation `c` and `λ > 0`. Prove the convex equality argument and the
bridge between positive volume and nonempty interior. A measure inequality alone does
not provide this rigidity theorem. Derive the same homothety characterization for equality
in the unweighted inequality by applying the weighted form at `θ = 1/2` to `2 • A`
and `2 • B` and using dilation laws.

## I2 — Symmetrization, rearrangements, and convex geometry

Build Steiner symmetrization along a unit direction for measurable finite-volume sets:
replace a.e. line section by the centered interval of the same one-dimensional volume.
Provide representative independence, measurability, preservation of volume, monotonicity,
translation conventions, dilation, orthogonal transport, and preservation of convexity.
Prove perimeter nonincrease for finite-perimeter sets using GMT's slicing/coarea theory,
including the nonsmooth approximation and limit argument. Prove `L¹` contraction for
indicators under Steiner symmetrization. For every measurable positive finite-volume set,
construct a sequence of unit directions whose
successive Steiner symmetrizations converge in `L¹` of their indicators to the centered
volume-matched ball. Prove convergence first for bounded finite-perimeter sets using
compactness and limit identification, then extend to arbitrary finite-volume sets by
approximation and contraction, including the control at infinity. Single-step equality is not
assumed to imply that arbitrary sets are balls.

Define Schwarz rearrangement from the distribution function for nonnegative measurable
functions with `|{f > t}| < ∞` for every `t > 0`. Include the `Lᵖ` classes, `1 ≤ p < ∞`,
as specializations and make the a.e. representative conventions explicit. Establish
equimeasurability, layer cake, all `Lᵖ` norm comparisons that reduce
to equimeasurability, order preservation, `Lᵖ` contraction for `1 ≤ p < ∞`, and the
Hardy–Littlewood inequality. I5 adds the BV and `W¹,¹` gradient comparisons after I4.

For positive-volume convex bodies construct surface area from GMT's perimeter and show
agreement with Hausdorff boundary area. Relate outer parallel volume
`(K + r • closedBall 0 1)` to that surface area by the right derivative at zero. Prove the
needed boundary charts and volume limit. For a lower-dimensional nonempty compact convex
set, ambient volume and perimeter are zero. Prove separately that the outer-parallel right
derivative is `2 Hⁿ⁻¹(K)` when its affine dimension is `n−1`, and zero when its affine
dimension is smaller. In particular it need not equal perimeter or topological boundary
area for a degenerate body. Derive the isoperimetric inequality for positive-volume convex
bodies from Brunn–Minkowski. Prove the sharp
isodiametric inequality `|E| ≤ ω_n (diam E / 2)^n` for measurable bounded sets using their
closed convex hull and the difference-body argument. The volume-maximizing convex-body
case has ball rigidity; supply the equality proof. For measurable sets, equality implies
agreement a.e. with a ball of radius `diam E / 2`. A converse also requires the diameter
bound: arbitrary null modifications can increase diameter.

## I3 — Sharp periodic inequalities and curve energy

Prove the sharp periodic Wirtinger inequality for real- and finite-dimensional
inner-product-valued AC functions on `[0,T]`, `T > 0`, with equal endpoint values,
mean zero, and square-integrable derivative:

```
∫₀ᵀ ‖f‖² ≤ (T / (2π))² ∫₀ᵀ ‖f'‖².
```

Equality holds exactly for `f(t) = a cos(2πt/T) + b sin(2πt/T)` on the interval. Include
the canonical periodic `W¹,²` formulation and its AC representative, translation of
the mean, rescaling to any parameter interval, and complex-valued specialization.
Build the Fourier/weak-derivative integration-by-parts and Parseval comparison or the
equivalent variational argument, rather than assuming the smooth inequality extends
automatically to AC functions or that its equality cases survive density.

For any closed AC plane curve with square-integrable derivative, define signed area by
the real boundary integral `½∫ (x y' − y x')`. Prove

```
4π |signedArea γ| ≤ T ∫₀ᵀ ‖γ'‖².
```

Give the complete equality analysis: equality means a constant curve, or a translated
circle traversed once at constant angular speed with one of the two orientations.
Prove the derivative relation a.e. and solve it using the AC FTC. The mean-zero
Wirtinger equality alone also permits ellipses, so the area/energy equality needs its
own argument. Compare this signed integral with DifferentialGeometry 5.6's winding-weighted
area. Use GMT G6's Jordan index theorem to prove that for a simple curve it is `σ` times
the actual volume of the inside, where `σ ∈ {−1,1}` is its orientation sign.

For a rectifiable curve use GMT G1's arclength parametrization. Prove the constant-speed
energy identity. Prove invariance of trace, length, and inside under increasing continuous
onto reparametrizations. Define geometric signed area for a continuous BV parameter via
DifferentialGeometry's rectifiable line integral and the AC arclength factorization;
prove independence of the factorization, agreement with the derivative integral for AC
parameters, and sign reversal under decreasing continuous onto reparametrizations.
Do not use a derivative integral of the original non-AC parameter. The resulting length inequality uses actual total variation;
it is not an inequality involving the energy of an arbitrarily supplied parametrization.

## I4 — Sharp Euclidean perimeter inequality and ball rigidity

Establish the full finite-volume finite-perimeter inequality stated above, including
unbounded sets. Supply the smooth/bounded case, the volume-and-perimeter approximation
passage using GMT G4, and the exact constants from ball volume and surface measure. Give
equivalent normalized forms, scaling laws, and explicit formulas for balls. State versions
with relative perimeter only when their domain terms and hypotheses are separately proved;
the headline is whole-space Euclidean perimeter.

Prove **rigidity at finite-perimeter regularity**. For every positive finite-volume set
of finite perimeter, equality holds iff it agrees a.e. with a ball. This includes
nonsmooth, disconnected, and unbounded measurable representatives. Supply the following
structural targets and their deduction of rigidity:

- For a Lebesgue-measurable `E` with `0 < |E| < ∞` and `P(E) < ∞`, and every unit
  direction `e`, write `S_e E` for I2's Steiner symmetral. If `P(S_e E) = P(E)`,
  prove that for almost every `y ∈ e⊥` the section
  `{t : ℝ | y + t • e ∈ E}` agrees a.e. in one-dimensional Lebesgue measure with a
  possibly empty interval (an `OrdConnected` subset of `ℝ`). Use `volume` on the
  orthogonal subspace `e⊥ = (ℝ ∙ e)ᗮ` and prove that `(y,t) ↦ y + t • e` is a
  measure-preserving linear equivalence from `e⊥ × ℝ`, with its product volume, to the
  ambient Euclidean space, with `‖y + t • e‖² = ‖y‖² + t²`.
  Prove the section measurability and Fubini transport from Borel representatives:
  replacing `E` by a volume-a.e. equal set preserves this conclusion for each fixed
  direction. The exceptional set of `y` may depend on `e`. Build the finite-perimeter
  slicing theorem and its reduced-boundary/normal comparison on almost every line from
  GMT G2–G5. Prove the localized perimeter comparison with Steiner symmetrization,
  including the equality implication that the set of slices with more than two essential
  boundary points has zero transverse measure. These are I4 targets; perimeter
  nonincrease obtained solely by approximation does not supply them.
- Prove the essential-convexity theorem: if a Lebesgue-measurable set of positive finite
  volume has the preceding interval-section property in every unit direction, it agrees
  a.e. with a convex set. Take the set of volume-density-one points as the representative.
  For any two distinct such points, use the direction of the segment joining them:
  density at the endpoints makes almost all nearby parallel sections meet `E` near both
  ends, and the interval property then gives density one along the segment. Prove the
  quantitative tube estimates needed for this argument; it uses only the exceptional set
  for that direction. Obtain a compact convex representative `K` with
  nonempty interior, proving boundedness from convexity and positive finite volume and
  proving that closure changes it only on a null boundary. Transport volume and perimeter
  along this a.e. equality using GMT G5.
- Isoperimetric equality for `E` forces `P(S_e E) = P(E)` for every `e`: combine I2's
  volume preservation and perimeter nonincrease with the already established inequality
  for `S_e E`. Thus the structural targets reduce the equality case to `K`. For
  `B = closedBall 0 1`, prove concavity of `f(t) = |K + t • B|^(1/n)` on `t ≥ 0`
  from I1, proving the Minkowski-sum identity
  `(1−θ) • (K + s • B) + θ • (K + t • B) = K + ((1−θ)s + θt) • B`
  for `0 ≤ θ ≤ 1` and `s,t ≥ 0` using convexity. I2's outer-parallel derivative gives
  `f'(0+) = P(K) / (n |K|^((n−1)/n))`. Isoperimetric equality makes this derivative
  `ω_n^(1/n)`. The concave tangent bound and the Brunn–Minkowski lower bound then force
  `f(t) = f(0) + t ω_n^(1/n)` for every `t ≥ 0`. Apply I1's compact convex equality
  theorem at `t > 0` to deduce that `K` is a translate and positive dilation of `B`.
  Use the nullity of the sphere to obtain the stated a.e. equality with an open ball;
  prove the converse from ball formulas and a.e. invariance.

Smooth equality plus approximation, or convergence of successive symmetrizations to a
ball without perimeter loss, does not supply these structural conclusions. The necessary
interval-section equality condition is stated in Cagnetti–Colombo–De Philippis–Maggi,
§1.2 and Theorem A, cited below. Equality in a single Steiner step does not in general
imply that `E` is a translate of `S_e E`. Every further object introduced in the rigidity
proof must receive its basic restriction, invariance, and comparison API.

Give the topological-frontier corollary for every bounded set, and the more
general finite-volume version, with `Hⁿ⁻¹(frontier E)` on the right. An infinite frontier
measure makes the extended inequality immediate; the finite case uses GMT G5's boundary
criterion and `P(E) ≤ Hⁿ⁻¹(frontier E)`. In the finite case prove that the frontier is
Lebesgue-null and hence `E` is `NullMeasurableSet` by comparison with its open interior;
the corollary therefore requires no separate measurability hypothesis. Supply its sharp-constant equality consequences:
for positive finite volume and finite frontier measure, equality implies agreement a.e.
with a ball. Do not assert literal ball equality for arbitrary representatives or a
converse for every null modification: topological frontier is sensitive to null sets.
Give exact ball rigidity for bounded regular open sets when equality holds, proving the
passage from a.e. equality to point-set equality under that hypothesis.

Specialize to bounded Lipschitz and `C¹` domains with actual Hausdorff surface area and
their classical outward normals. The surface-area/perimeter identification is GMT G6's
comparison, not a new definition chosen to make this inequality immediate.

## I5 — Sharp BV Sobolev and its equality cases

Prove BV Pólya–Szegő from GMT's scalar coarea and I4's set inequality: Schwarz rearrangement
does not increase total variation. For every nonnegative `u ∈ W¹,¹(ℝⁿ)`, `n ≥ 2`, prove
that its Schwarz rearrangement `u*` has an `L¹` weak gradient `g`, with

```
D(u*) = g · volume,       ∫ ‖g‖ ≤ ∫ ‖∇u‖.
```

Supply an approximation argument that excludes singular concentration, with the following
targets owned by I5:

- For nonnegative integrable Lipschitz functions `h`, prove that `h*` has a Lipschitz
  representative, using I1's Brunn–Minkowski inequality and the inclusions between
  neighborhoods of superlevel sets. Identify the a.e. Rademacher gradients with the
  canonical weak gradients, supplying the required integration-by-parts comparison.
  Prove the convex-integrand Pólya–Szegő estimate
  `∫ Φ(‖∇h*‖) ≤ ∫ Φ(‖∇h‖)` for finite-valued convex nondecreasing
  `Φ : [0,∞) → [0,∞)` with `Φ(0) = 0`, whenever the right side is finite. Supply the
  distribution-function and critical-level comparisons needed to derive this estimate
  from GMT G2's Lipschitz coarea, GMT G5's comparison of superlevel perimeter with level
  surface measure, Jensen's inequality, and I4.
  Explicitly, for `μ_h(t) = |{h > t}|` and
  `m_h(t) = ∫_{{h=t} ∩ {∇h≠0}} ‖∇h‖⁻¹ dHⁿ⁻¹`, prove
  `m_h(t) ≤ −μ_h'(t)` for a.e. `t > 0`, and prove that the critical part of the level
  surface has zero `Hⁿ⁻¹` measure for a.e. `t`. For `h*`, prove equality
  `m_h*(t) = −μ_h'(t)` using the nullity of critical values for its one-dimensional
  Lipschitz radial profile. Prove that `s ↦ s Φ(P/s)` is nonincreasing for `s > 0`
  and `P ≥ 0`, so Jensen and the level-perimeter inequality combine in the required
  direction. Treat empty levels and zero denominators separately.
- For nonnegative `u ∈ W¹,¹`, construct nonnegative smooth Lipschitz approximants
  `u_j = u * ρ_j` using nonnegative compactly supported smooth probability kernels.
  Prove convergence in `W¹,¹`, the convolution identity for weak gradients, and Jensen's
  bound `∫ Φ(‖∇u_j‖) ≤ ∫ Φ(‖∇u‖)`. Use a de la Vallée Poussin integrability lemma
  to choose such a `Φ` with `Φ(t)/t → ∞` and `∫ Φ(‖∇u‖) < ∞`.
- Apply the Lipschitz convex-integrand estimate both to this superlinear `Φ` and to
  `Φ(t) = t`. Prove the resulting uniform-integrability estimate: for every `ε > 0`
  there is a finite `T > 0` such that
  `∫_A ‖∇u_j*‖ ≤ T |A| + ε` for every measurable `A` and every `j`.
  I2's `L¹` contraction gives `u_j* → u*` in `L¹`. GMT G4's local lower semicontinuity
  therefore gives `|D(u*)|(U) ≤ T |U| + ε` for every open `U`. Use outer regularity of
  volume to cover volume-null sets by open sets of arbitrarily small volume and deduce
  `|D(u*)| ≪ volume`. GMT G3's measure-valued derivative and Radon–Nikodym comparison
  then supply `D(u*) = g · volume`. The identity `|D(u*)| = ‖g‖ · volume` and the
  global BV comparison prove `∫ ‖g‖ ≤ ∫ ‖∇u‖`. This explicitly excludes singular
  concentration in the limit.

The convex-integrand estimates and uniform-integrability lemmas are supporting theory
for the `p = 1` result; a general Orlicz-space development is outside this roadmap. I2's
equimeasurability supplies `u* ∈ L¹`; GMT G3's BV-to-Sobolev comparison then gives a
canonical `TauCeti.W1p` element with weak gradient `g`.

Also establish the radial-profile comparison. Pin the representative for `r > 0` by
`v(r) = sup {t > 0 | ω_n r^n < |{u > t}|}`, with value zero for an empty set and the
extended nonnegative supremum until finiteness is proved. Superlevel volumes are finite
for `t > 0` by the `L¹` bound. Prove agreement with I2's Schwarz rearrangement, finiteness
of `v(r)` for `r > 0`, and absolute continuity of `v` on every compact subinterval of
`(0,∞)`. Derive this from the established radial `W¹,¹` representative by the weak
derivative comparison on annuli, including vanishing of tangential gradient components;
build the radial restriction and composition lemmas against PDE's canonical
weak-derivative API here. Use monotonicity to transport a.e. agreement with the continuous
profile to pointwise agreement with the pinned `v`. Establish

```
n ω_n ∫₀^∞ |v'(r)| r^(n−1) dr ≤ ∫ ‖∇u‖.
```

Use GMT G2's polar integration to identify
`g(x) = v'(‖x‖) • (x / ‖x‖)` a.e. away from zero. Prove
`r^(n−1) v(r) → 0` as `r ↓ 0` from the weighted derivative bound and `n ≥ 2`.
As corollaries of the established identity `D(u*) = g · volume`, deduce that the
derivative has no jump part across spheres, no Cantor part over a null set of radii,
and no contribution at the origin. Extend the norm comparison to real-valued inputs
by rearranging `|u|` and proving its weak-gradient bound using the canonical
positive-part/truncation calculus and
`|u| = u⁺ + (−u)⁺`. A BV bound or strict smooth approximation alone does not exclude
a singular derivative in the rearranged limit. These comparisons use I4 and are not
inputs to its proof.

For `n ≥ 2`, `p = n/(n−1)`, prove on the whole space

```
‖u‖_p ≤ (n ω_n^(1/n))⁻¹ |Du|(ℝⁿ),                u ∈ BV(ℝⁿ).
```

Derive it from coarea, layer cake, and I4, with the integral Minkowski inequality and
its equality analysis made explicit. Prove membership in `Lᵖ`; the norm expression alone
is not sufficient. Equality for a nonzero real-valued `u` holds exactly when
`u = c χ_(ball a r)` a.e., with `c ≠ 0`, `r > 0`. Establish the nesting and proportionality
of superlevel sets and the absence of sign cancellation required for this classification;
do not merely classify each level set separately as a ball. Treat the zero function
separately. Give the `W¹,¹` corollary and nonattainment by nonzero `W¹,¹` functions, as well
as normalized smooth near-extremizers approximating a ball indicator. This is the sharp
endpoint complement to PDE's general Sobolev embedding theory.

## I6 — Full planar Jordan theorem and compatibility

Prove the geometric and parameterized statements in the scope section, using actual
Lebesgue area, Hausdorff length, and total variation. Supply the equivalence of the
parameterized hypotheses with the existing `IsJordanCurve` trace plus rectifiability.
Derive area positivity and finiteness, length positivity and finiteness, and the
orientation-independent inequality.

Give both compatibility results: the planar finite-perimeter specialization via GMT G6,
and the AC/arclength area–energy specialization via I3 and Green's theorem. They must
use the same inside and the same length. For the finite-perimeter equality argument,
prove that the Jordan inside is regular open, that equality a.e. with a ball implies
actual equality of the inside with the ball, and hence that its frontier is the circle.
For the curve argument, transport equality of the arclength trace back to the original
curve, without imposing constant speed on that original parametrization. Prove the
converse for every continuous rectifiable simple parametrization of a circle.

## Acceptance examples and completion

Prove the disk/circle and `n`-ball formulas with the exact constants; an ellipse and a
rectangle have strict planar inequality unless the domain is a disk (in particular every
nondegenerate ellipse with unequal axes and every rectangle are strict). Compute annulus
area and perimeter and prove strictness. Give separated unions of two positive-radius
balls as strict examples. Check a punctured ball: it has equality for perimeter and a.e.
ball rigidity, while literal ball equality fails. Check a circle traversed twice: its
trace is a circle, but its parameterized length and winding-weighted area reflect
multiplicity and it is not a simple-curve equality case. Include a circle parametrized
by `φ(t) = (t + C(t))/2` on `[0,1]`, where `C` is the Cantor–Lebesgue function constructed
in GMT's acceptance examples. Prove that `φ` is an increasing homeomorphism which is not
AC, and that the resulting circle parameter is continuous, simple, rectifiable and not
AC. This tests the full geometric statement beyond AC parameters. Verify the BV
extremizers and smooth near-extremizers.

Completion requires the full inequality **and** equality statements, the geometric bridges,
and the reusable APIs of I1–I5. An outer-neighborhood-volume inequality without the
perimeter comparison, a smooth-only theorem, a supplied area/perimeter identity, or an
equality hypothesis assumed as input does not discharge the target. Proofs must use the
ordinary kernel-checked Mathlib/Tau Ceti foundation, with no additional mathematical axioms,
and the final declarations must have explicit integrability and finiteness hypotheses.

## References and existing formalizations

- Francesco Maggi, [*Sets of Finite Perimeter and Geometric Variational Problems*](https://cvgmt.sns.it/paper/1880/),
  for finite-perimeter isoperimetry and symmetrization. GMT's roadmap owns the underlying
  measure and boundary theory.
- Cagnetti–Colombo–De Philippis–Maggi,
  [*Rigidity of equality cases in Steiner's perimeter inequality*](https://arxiv.org/abs/1309.1639),
  §1.2 and Theorem A, for the necessary interval-section condition used in I4. Translation
  rigidity for a single symmetrization needs additional hypotheses.
- Bianchi–Gardner–Gronchi–Kiderlen,
  [*The Pólya–Szegő inequality for smoothing rearrangements*](https://arxiv.org/abs/2206.09833),
  Theorem 5.8, Theorem 6.3 and Corollary 6.5, for the Lipschitz convex-integrand estimate,
  Sobolev membership, and the gradient comparison, including the uniform-integrability
  argument at the `p = 1` endpoint. I5 requires only Schwarz rearrangement at that endpoint.
- [The Brunn–Minkowski exposition by Terence Tao](https://terrytao.wordpress.com/2011/09/16/the-brunn-minkowski-inequality-for-nilpotent-groups/)
  includes the Euclidean Prékopa–Leindler argument.
- Joel Tropp's [*Lectures on Convex Geometry*](https://tropp.caltech.edu/notes/Tro18-Lectures-Convex-LN.pdf),
  Lecture 8, supplies the parallel-volume and intrinsic-volume normalization, including
  lower-dimensional convex bodies.
- [Freek Wiedijk's isoperimetric entry and HOL Light proof](https://www.cs.ru.nl/~freek/100/hol.html#43)
  provide a classical planar comparison: arbitrary rectifiable simple closed curves and
  geometric circle equality.
- **Humanfia's [public Lean source archive](https://huggingface.co/datasets/humanfia-lab/lean-eval-source/tree/main/problems/isoperimetric_inequality)**
  contains a higher-dimensional bounded-set inequality using volume and Hausdorff measure
  of the topological frontier. It is relevant prior work for I1 and I4; the canonical
  finite-perimeter theory and equality cases remain intrinsic requirements here.
- **Jonathan Ho's [isoperimetric repository](https://github.com/hojonathanho/isoperimetric)**,
  also distributed [in LeanPool](https://github.com/LeanPool/lean-pool/tree/main/LeanPool/Isoperimetric),
  develops Prékopa–Leindler, Brunn–Minkowski, and outer-neighborhood volume inequalities.
  These are relevant to I1–I2. A neighborhood inequality still requires its bridge to
  geometric perimeter and rigidity.
- **[kim-em/isoperimetric](https://github.com/kim-em/isoperimetric)** is a parallel development
  directed at the classical isoperimetric theorem. Cite and examine its mathematical
  results as existing work; neither its implementation nor any chosen dependencies
  prescribe this roadmap's design or discharge a milestone without its full requirements.

Humanfia, Jonathan Ho/LeanPool, and kim-em/isoperimetric are prior work rather than required
imports or prescribed proof strategies. Contributors develop the mathematics on the canonical
Mathlib/Tau Ceti APIs and assess every result against the statements above. Reuse of code
follows the repository's coordination and attribution rules. New definitions must receive
their full usable basic theory, and all comparisons must agree with the geometric
normalizations and a.e. conventions fixed here.
