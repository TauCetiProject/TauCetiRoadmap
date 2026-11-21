# Roadmap: singular Hermitian metrics and L² methods

**Summary.** A hermitian metric on a holomorphic line bundle `L` over a complex manifold is *singular* when,
in a local holomorphic frame `e`, it is given by `|e|²_h = e^{−φ}` with a weight `φ` that is only locally
integrable; it is *positive* when every local weight is plurisubharmonic, and its curvature is then the closed
positive `(1,1)`-current `i∂∂̄φ`. Such metrics arise from holomorphic sections (the metric `1/Σ|s_j|²`), as
limits of smooth metrics, and on quotients of bounded symmetric domains as invariant metrics, which blow up
mildly along the boundary of a compactification. The singularities of a weight are measured by its Lelong
numbers and by its *multiplier ideal* `J(φ)`, the ideal of holomorphic germs `f` with `|f|²e^{−φ}`
integrable. This roadmap builds the analytic theory of these objects and the `L²` methods that control them.

Its headline theorems are these.

- *Hörmander's estimate with singular weights (Demailly).* Let `(X, ω)` be a Kähler manifold carrying a smooth
  plurisubharmonic exhaustion function (for instance compact, or Stein), and `L` a line bundle with a singular
  metric whose curvature current satisfies `iΘ ≥ εω` for a constant `ε > 0`. Every `∂̄`-closed `L`-valued
  `(n,q)`-form `g`, `q ≥ 1`, with `∫|g|² e^{−φ} < ∞` is `∂̄u` for a form `u` with
  `∫|u|²e^{−φ} ≤ (1/(qε))∫|g|²e^{−φ}`.
- *Nadel.* The multiplier ideal of a plurisubharmonic weight is a coherent ideal sheaf, and on a compact Kähler
  manifold `H^q(X, K_X ⊗ L ⊗ J(h)) = 0` for `q ≥ 1` whenever `iΘ_h(L) ≥ εω`.
- *Ohsawa–Takegoshi.* A holomorphic function on the hyperplane section `Ω ∩ {z_n = 0}` of a pseudoconvex domain
  `Ω ⊂ ℂ^{n−1} × D`, `D ∋ 0` a bounded planar domain, extends to `Ω` with
  `∫_Ω|F|²e^{−φ} ≤ (π/c_D(0)²)∫_{Ω∩H}|f|²e^{−φ}` for every plurisubharmonic `φ`, `c_D(0)` the logarithmic capacity of
  `D` at `0` (the constant `π/c_D(0)²` is `πr²` for the disc of radius `r`); for `n = 1` this is the Suita inequality.
  The manifold form of Manivel and Demailly extends sections from the zero locus of a section of a vector bundle.
- *Bergman kernels.* For a metric with `iΘ_h(L) + Ric(ω) ≥ εω` (the Ricci term cannot be dropped: on a curve of
  genus `g > d` a general line bundle of degree `d` has no sections, whatever `ε` its metric has), the Bergman density
  at a point is bounded below by a peak section in terms of the oscillation of the weight on a ball of radius `r` with
  `εr² ≥ C_n`; for a smooth positive metric on a compact manifold `k^{−n}B_k → c₁(L,h)^n/(n!·dV)` uniformly.

Along the way it proves the following theorems.

- *Skoda's division theorem.* On a pseudoconvex domain in `ℂ^n`, a holomorphic `f` with
  `∫|f|²|g|^{−2(αq+1)}e^{−φ} < ∞` (`g = (g_1, …, g_p)`, `q = min(n, p − 1)`, `α > 1`, `φ` plurisubharmonic) is `Σ_j g_jh_j`
  with `∫|h|²|g|^{−2αq}e^{−φ} ≤ (α/(α − 1))∫|f|²|g|^{−2(αq+1)}e^{−φ}`; iterated, it divides by powers of the ideal, and
  when the common zeros of `g_1, …, g_n` are discrete and reduced it divides by the `a`-th power of the ideal, with an
  `L²` bound, every `f` with `∫|f|²|g|^{−2(a+n−½)}e^{−φ} < ∞` (a condition that forces the jets of order `< a` of `f` to
  vanish at the common zeros). The decisive pointwise estimate is Skoda's inequality for the curvature of the kernel
  bundle of `g`, with the factor `q`, which is proved here with the curvature of sub-bundles and quotient bundles.
- *Demailly's approximation and Siu's theorem.* Every plurisubharmonic function is a limit of functions with
  analytic singularities, built from Bergman kernels, that lose at most `2n/m` of every Lelong number; hence the
  sets where the Lelong numbers are at least `c` are analytic.
- *Good metrics (Mumford).* On a compact complex manifold `X̄` with a normal crossings divisor `D`, a metric on a
  vector bundle over `X̄ ∖ D` whose frame norms have logarithmic growth and whose connection forms and their exterior
  derivatives have Poincaré growth determines its extension `Ē` across `D`, and its Chern forms are integrable currents
  representing the Chern classes of `Ē`.

The roadmap builds on [ComplexComparisonPartII](../../ComplexComparisonPartII/README.md), whose current calculus
(C5.4: positive currents, local convolution, the Skoda–El Mir extension, integration over analytic cycles and
the Poincaré–Lelong formula for smooth metrics) and smooth weighted `L²` estimate on complete Kähler manifolds
(C1.4) it extends to singular weights; on [ComplexKahlerGeometry](../../ComplexKahlerGeometry/README.md) for
Chern connections and the Kähler and Bochner–Kodaira–Nakano identities (K4, K6.0); on
[RealAnalyticGeometry](../../RealAnalyticGeometry/README.md) for the Stein theory and complete metrics from
exhaustions (R3.0–R3.1); and on [AlgebraicModuliForArithmeticGeometry](../../AlgebraicModuliForArithmeticGeometry/README.md)
§9.10, whose algebraic multiplier ideals are the analytic ones of rational weights (6.3). In the family [RiemannHypothesisForDirichletLFunctions](../README.md) it feeds the
theory of invariant metrics on automorphic bundles and Hirzebruch–Mumford proportionality in
[DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md), the arithmetic intersection theory of log-singular metrics in
[HeightsForLogSingularMetrics](../HeightsForLogSingularMetrics/README.md), the semipositivity of Hodge bundles in
[ProjectiveModelsAndPeriodBoundsOnShimuraVarieties](../ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/README.md), and, in
[ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md), the
Bergman-kernel and sup-norm bounds of the slope estimates and the Hörmander, interpolation and division theorems on which
the generation of integral forms by theta series rests.

Layers 0–2 are the pluripotential foundations: plurisubharmonic functions (on manifolds and on reduced complex
spaces) with the Riesz representation, Lelong numbers with Skoda's integrability theorem, and singular metrics with
their curvature currents. Layer 3 proves `L²` estimates for `∂̄` with plurisubharmonic weights (on pseudoconvex domains,
with the norm of the datum measured by the curvature of the weight, with a second weight of bounded gradient for the
solution of least norm, and on manifolds whose complement of an analytic set carries a complete Kähler metric), the
curvature of holomorphic sub-bundles and quotient bundles with Skoda's inequality, interpolation of jets on discrete
common zero sets, and Skoda's division theorem, and sets up Bergman spaces; Layer 4 states the Ohsawa–Takegoshi extension theorem
(Błocki's form with the optimal constant and Demailly's form on manifolds, both cited) and derives the Suita inequality. Layer 5 treats Mumford's good metrics
along a normal crossings boundary and Poincaré-type metrics. Layer 6 defines analytic multiplier ideals and proves
coherence, the comparison with algebraic multiplier ideals, restriction, subadditivity and strong openness (a cited
theorem in dimension at least two). Layer 7 approximates and regularises
plurisubharmonic and quasi-plurisubharmonic functions, with a loss of positivity controlled by Lelong numbers at a
scale, regularises log-log singular semipositive metrics compatibly with pull-back, and controls the mixed Monge–Ampère
measures of such metrics and of their regularisations near the boundary (energy, boundary mass, convergence). Layer 8 globalises the `L²` estimate to singular metrics
and proves Nadel vanishing. Layer 9 bounds Bergman kernels from below and computes their leading asymptotics.

## Conventions

- **Manifolds.** Complex manifolds are Mathlib's `IsManifold 𝓘(ℂ, E) ⊤` with `E` finite-dimensional, Hausdorff
  and second countable, without boundary, as in ComplexKahlerGeometry; `n` is the complex dimension. Holomorphic
  means `MDifferentiable ℂ`. Line and vector bundles are ComplexKahlerGeometry K4's holomorphic bundles. A
  hermitian form `ω` is a smooth positive real `(1,1)`-form; it is Kähler when closed; `dV_ω = ω^n/n!`.
  *Weakly pseudoconvex* means: there is a smooth plurisubharmonic exhaustion function (all sublevel sets
  relatively compact). Compact manifolds and Stein manifolds (RealAnalyticGeometry R3.0–R3.1) are weakly
  pseudoconvex.
- **Values `[−∞, ∞)`.** Plurisubharmonic functions take values in `EReal` and never take the value `⊤`. The
  function constant `−∞` is plurisubharmonic; most statements require a plurisubharmonic function to be not
  identically `−∞` on any connected component, and say so.
- **Normalisations.** `d^c = i(∂̄ − ∂)`, so `dd^c = 2i∂∂̄` (ComplexKahlerGeometry); this roadmap writes `i∂∂̄`
  explicitly. Currents, their degrees, signs and positivity are ComplexComparisonPartII C5.4's
  (`CurrentCalculus`). For real `(1,1)`-currents `T, S`, `T ≥ S` means that `T − S` is a positive current;
  `γ` below always denotes a continuous real `(1,1)`-form.
- **Means in `[−∞, ∞)`.** For a function `u` with values in `[−∞, ∞)`, upper semicontinuous and bounded above on a
  circle, a sphere or a ball, its *mean* is the infimum of the means of the continuous functions `≥ u` there; it equals
  `∫u⁺ − ∫u⁻` (normalised measure) when `∫u⁻ < ∞` and is `−∞` otherwise. Composing with `EReal.toReal`, which sends `−∞`
  to `0`, does not give this mean (0.1's third Check is the test).
- **Euclidean form.** On `ℂ^n`, `ω_eucl = (i/2)Σ_j dz_j ∧ dz̄_j`, so that `ω_eucl^n/n! = dλ`, Lebesgue measure;
  `i∂∂̄|z|² = 2ω_eucl`, whose volume form is `2^n dλ`.
- **Weights.** A (possibly singular) hermitian metric `h` on a holomorphic line bundle `L` is given in a local
  holomorphic frame `e` by `|e|²_h = e^{−φ}`; `φ` is the local weight. Then `|s|²_h = |f|²e^{−φ}` for `s = fe`,
  the curvature current is `iΘ_h(L) = i∂∂̄φ`, and the Chern current is `c₁(L,h) = (i/2π)∂∂̄φ`. For smooth `h`
  this is ComplexComparisonPartII C1.3's convention (`e^{−φ}` has `Θ = ∂∂̄φ`, Chern form `(i/2π)Θ`). Many sources
  (Demailly's books among them) write `|e|² = e^{−2φ}`; their weight is half of ours, and every numerical
  threshold below is stated in our convention.
- **Lelong numbers.** On a manifold of dimension `n ≥ 1`, for a plurisubharmonic `u` and a point `x`, in a holomorphic chart,
  `ν(u, x) = liminf_{z→x} u(z)/log|z − x|`. Lelong numbers are defined, and every statement below that involves them is
  made, for `n ≥ 1` only: on a manifold of dimension `0` (a discrete set) `x` has no punctured neighbourhood, and the
  threshold statements of 1.2 and 6.1 fail there (1.1's last Check). Thus `ν(log|f|², x) = 2·ord_x f` and the Chern current
  `c₁(L, h)` has Lelong number `ν(φ, x)/2` at `x`, so that `c₁(O(D), |s_D|^{−2}) = [D]` has Lelong number `1`
  at a smooth point of a reduced divisor `D`.
- **`L²` norms.** For an `L`-valued `(p,q)`-form `u`, `|u|²_{h,ω}` is its pointwise norm for `h` and `ω`, and
  `‖u‖² = ∫ |u|²_{h,ω} dV_ω`. On `(n,0)`-forms the product `|u|²_{h,ω} dV_ω` does not depend on `ω`. Measurable
  forms with finite norm are the `L²` forms; `∂̄` acts in the sense of distributions (ComplexComparisonPartII
  C1.4's maximal operator).
- **Normal crossings.** A *normal crossings divisor* `D` in a complex manifold `X̄` is a reduced hypersurface such
  that every point of `X̄` has a holomorphic chart to a polydisc in which `D = {z₁⋯z_k = 0}` for some `k`; it is
  *simple* when its irreducible components are smooth. The *Poincaré polydisc* is
  `Δ*^k × Δ^{n−k}` with `Δ = {|z| < 1/2}`, `Δ* = Δ ∖ {0}`.

## Layer 0: Plurisubharmonic functions

### 0.1 Plurisubharmonic functions

Define `u : M → EReal` to be *plurisubharmonic* on an open set `U` of a complex manifold `M` if `u` is upper
semicontinuous on `U`, `u < ⊤`, and for every holomorphic map `g` from a neighbourhood of the closed unit disc
into `U`, `u(g(0))` is at most the mean (Conventions) of `u ∘ g` on the unit circle. In a chart
this is equivalent to: the restriction of `u` to every complex line is subharmonic or `≡ −∞` on each component
of the intersection. The definition is invariant under biholomorphisms, so it is local on `M`.

The API: sums and nonnegative multiples; maxima of finitely many; the upper semicontinuous regularisation
`(sup_α u_α)^*` of a locally uniformly upper-bounded family; limits of decreasing sequences; `χ ∘ u` for `χ : ℝ → ℝ`
convex and nondecreasing, extended to `[−∞, ∞)` by its limit `χ(−∞) = lim_{t→−∞} χ(t) ∈ [−∞, ∞)` (another value at `−∞` can
destroy upper semicontinuity: fifth Check); `log|f|` and
`log Σ_j |f_j|^{a_j}` (`a_j > 0`) for holomorphic `f, f_j`; for `u` of class `C²`, plurisubharmonicity is
nonnegativity of the Levi form (Tau Ceti's `TauCeti.leviForm`) at every point. A continuous `u` is *strictly
plurisubharmonic* if every point has a chart neighbourhood `V` and a constant `ε > 0` such that `u − ε|z|²` is
plurisubharmonic on `V`; equivalently, `i∂∂̄u ≥ θ` as currents for a continuous positive definite `(1,1)`-form `θ` (glue
the local constants by a partition of unity; conversely `θ ≥ ε·i∂∂̄|z|²` on a neighbourhood of each point). For smooth `u`
this is Tau Ceti's `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` at every point. A positive continuous FUNCTION `ε(z)` in place of
the local constant does not express strict positivity (fourth Check).

*Route.* The sub-mean-value form along discs makes all closure properties formal except the regularised
supremum (Choquet's lemma reduces it to countable families). The `C²` criterion: the Laplacian of `u ∘ g` on a disc
is the Levi form in the direction `g′`.

*Needs:* Mathlib `UpperSemicontinuous`, `Real.circleAverage` (for the continuous majorants), `EReal`; Tau Ceti `TauCeti.leviForm`
and `TauCeti.SubharmonicOn`; ComplexKahlerGeometry §3.1 (K3.0) (charts and
the several-variable calculus).

**Checks.**

- `|z|²`, `log|z|`, `max(log|z₁|, log|z₂|)` are plurisubharmonic on `ℂ`, `ℂ`, `ℂ²`; `−|z|²` is not.
- On `ℂ²`, `u = |z₁|² − ½|z₂|²` has positive real Laplacian `4·(1 − ½) = 2` but is not plurisubharmonic: its
  restriction to the line `z₁ = 0` is `−½|z₂|²`. A definition testing only the real Laplacian would admit it.
- `log|z₁|` on `ℂ²` takes the value `−∞` on a hyperplane and is plurisubharmonic. The function equal to `0` on
  `{|z| ≥ 1}` and to `−∞` on `{|z| < 1}` is upper semicontinuous with values in `[−∞, ∞)`, but its mean over every
  small circle centred on `|z| = 1` is `−∞ < 0`: upper semicontinuity and the value set do not make a function
  plurisubharmonic.
- On a small disc let `u` be the radial solution, with `u(0) = 0` and regular at `0`, of
  `Δu = 4[1 + (1 − r)sin(1/r)]` (`r = |z|`; the right side is `≥ 4r > 0` for `0 < r < 1`). Radial integration gives
  `u = r² + O(r³)`, so `u/|z|²` extends to a continuous positive function `ε(z)` and `u − ε(z)|z|² ≡ 0` is plurisubharmonic;
  but `Δu = 4r_k → 0` on the circles `r = r_k` where `sin(1/r_k) = −1`, so `u − ε|z|²` is subharmonic on no neighbourhood of
  `0` for any constant `ε > 0`: `u` is not strictly plurisubharmonic in the sense above.
- The value of `χ` at `−∞`: `χ ≡ 0` on `ℝ` is convex and nondecreasing, and so is its extension by `χ(−∞) = −1`; but then
  `χ(log|z|)` is `0` off the origin and `−1` at it, not upper semicontinuous. The limit `χ(−∞) = 0` gives the constant `0`.

### 0.2 Local integrability and mean values

Prove: (a) if `u` is plurisubharmonic on a connected open `U ⊂ ℂ^n` and not `≡ −∞`, then `u ∈ L¹_loc(U)`, the
set `{u = −∞}` has Lebesgue measure zero, and `u(x) ≤` the mean of `u` over every ball and every sphere centred
at `x` inside `U`, these means being nondecreasing in the radius and tending to `u(x)` as the radius tends to
zero; (b) the maximum principle: on a connected `U`, `u` attaining its supremum is constant.

*Route.* (a) is the subharmonic case on complex lines integrated over directions (spherical means are averages
of circle means), with the standard argument that a function with `−∞` mean on a ball is `−∞` on a
neighbourhood; (b) from the sub-mean-value property.

*Needs:* 0.1; Mathlib's Lebesgue measure on `ℂ^n`, `MeasureTheory.Lp`; Tau Ceti's sub-mean-value lemmas
(`IsCompact.le_of_le_setAverage_ball_le_frontier`, `IsCompact.ge_of_setAverage_ball_le_ge_frontier`).

**Checks.**

- `u = log|z|` on the unit disc: the means over the circles `|z| = r` are `log r`, nondecreasing and tending to
  `u(0) = −∞`; `u` is integrable although `u(0) = −∞`.

### 0.3 Regularisation by convolution and the distributional characterisation

Prove: (a) for `u` plurisubharmonic on an open `U ⊂ ℂ^n`, not `≡ −∞` on any component, and a smooth radial
mollifier `ρ ≥ 0` with integral one supported in the unit ball, `u_ε = u ∗ ρ_ε` is smooth and plurisubharmonic
on `U_ε = {x : B(x, ε) ⊂ U}` and decreases to `u` pointwise as `ε ↓ 0`; (b) a real distribution `T` on `U` with
`i∂∂̄T ≥ 0` (a positive current, ComplexComparisonPartII C5.4) is a locally integrable function, and agrees
almost everywhere with a unique plurisubharmonic function `u` (namely `u(x) = lim_{r→0}` of the mean of `T` on
`B(x, r)`); conversely a plurisubharmonic `u` that is not `≡ −∞` on any connected component of `U` defines a
distribution with `i∂∂̄u ≥ 0` (on two disjoint discs, `u = 0` on one and `u = −∞` on the other is plurisubharmonic and
`≢ −∞`, but not locally integrable); (c) an upper
semicontinuous `u ∈ L¹_loc(U)` is plurisubharmonic iff `i∂∂̄u ≥ 0` as a current and `u(x) = lim_{r→0}` (mean of `u`
on `B(x, r)`) for every `x ∈ U`; (d) for a holomorphic map `F` between complex manifolds and `u` plurisubharmonic on the
target, `u ∘ F` is plurisubharmonic.

*Route.* (a) Monotonicity in `ε` comes from the radial means of 0.2(a) and the radial symmetry of `ρ`;
plurisubharmonicity of `u_ε` from that of each translate. (b) Mollify `T`; the mollifiers are smooth with
nonnegative Levi form, hence plurisubharmonic, and decrease in `ε` by (a)'s argument applied to their own means;
the decreasing limit is the required representative. ComplexComparisonPartII C5.4's convolution of positive
currents supplies the commutation with `∂∂̄`. (c) If `u` is plurisubharmonic, both conditions hold by (b) and 0.2(a);
conversely (b) gives a plurisubharmonic `ũ = u` almost everywhere with `ũ(x) = lim_{r→0}` (mean of `u` on `B(x, r)`),
which is `u(x)` by the second condition. (d) Immediate from 0.1: `F` sends holomorphic discs to holomorphic discs, and
`u ∘ F` is upper semicontinuous.

*Needs:* 0.1, 0.2; ComplexComparisonPartII C5.4 (`CurrentCalculus`, local convolution); Mathlib
`Distribution`, convolution.

**Checks.**

- For `u = log|z|` on `ℂ`, `u_ε(0)` equals the mean of `log|z|` against `ρ_ε`, finite, while `u(0) = −∞`; the
  approximants are finite everywhere.
- The distribution `log|z₁| + log|z₂|` on `ℂ²` has `i∂∂̄T = π([z₁ = 0] + [z₂ = 0]) ≥ 0`; the function
  `−log|z₁|` has `i∂∂̄ ≤ 0` and is not a.e. equal to a plurisubharmonic function.

### 0.3a The Riesz representation on balls and Hartogs' lemma

Prove: (a) let `u` be plurisubharmonic and not `≡ −∞` on a neighbourhood of the closed ball `B̄ = B̄(a, R) ⊂ ℂ^n = ℝ^{2n}`.
Then the distributional Laplacian `Δu` is a positive Radon measure `μ_u` (the trace of `i∂∂̄u ≥ 0`), and for every
`x ∈ B(a, R)`, `u(x) = P_R[u](x) − ∫_{B(a,R)} G_R(x, y) dμ_u(y)`, with `P_R[u]` the Poisson integral of the restriction of
`u` to the sphere (integrable by 0.2(a)) and `G_R ≥ 0` the Dirichlet Green function of the ball in `ℝ^{2n}`; the mass
of `μ_u` on `B(a, r)`, `r < R`, is bounded in terms of `r`, `R` and the means `M(r)`, `M(R)` of `u` on the spheres of
radii `r` and `R` (for `n ≥ 2`, `μ_u(B(a, r)) ≤ (M(R) − M(r))/(c_n(r^{2−2n} − R^{2−2n}))` with `c_n > 0` depending only on
`n`; for `n = 1` the same with `log(R/r)` in place of `r^{2−2n} − R^{2−2n}`);
(b) Hartogs' lemma: if `u_k` are plurisubharmonic on a connected open `U`, locally uniformly bounded above, then either
`u_k → −∞` locally uniformly, or a subsequence `u_{k_j}` converges in `L¹_loc(U)` to a plurisubharmonic `u`, and then
`limsup_j sup_K u_{k_j} ≤ sup_K u` for every compact `K ⊂ U`.

*Route.* (a) Let `U ⊃ B̄` be the open set on which `u` is plurisubharmonic. For `ε` smaller than the distance from `B̄`
to the complement of `U`, the smooth `u_ε` of 0.3(a) is defined on a neighbourhood of `B̄`, so Green's representation
formula holds for it on `B(a, R)` itself, with the Poisson kernel and the Green function `G_R` of that ball (the planar
case is ComplexHessianEquations §7.1; in `ℝ^{2n}` the same proof with the Newtonian kernel); no smaller ball is needed.
Let `ε → 0`: the left sides decrease to `u(x)` and the Poisson integrals converge by monotone convergence on the sphere,
so the potentials `P_R[u_ε] − u_ε` converge pointwise on `B(a, R)` to the superharmonic function `P_R[u] − u`. The Green
potentials `∫_{B(a,R)} G_R(·, y)dμ_{u_ε}(y)` converge in `L¹(B(a, R))` to `∫_{B(a,R)} G_R(·, y)dμ_u(y)`: `μ_{u_ε} = μ_u ∗ ρ_ε`
converges weakly to `μ_u` on a neighbourhood of `B̄`, and `y ↦ 1_{B(a,R)}(y)·G_R(·, y)` is a continuous map into
`L¹(B(a, R))`, since `G_R(·, y) → 0` in `L¹` as `y` tends to the sphere. Two superharmonic functions equal almost
everywhere are equal, each being the limit of its means over small balls, which gives the formula at every `x`. The mass
bound is Green's formula against a cut-off. (b) Suppose that `u_k` does not tend to `−∞` locally uniformly: there are a
compact `K`, a constant `c` and a subsequence `u_{k_j}` with `sup_K u_{k_j} ≥ −c`. Bound the means along this subsequence from
below: on a ball `B(w, ρ) ⋐ U` let `M` bound all `u_k` from above; if `u_{k_j}(w) ≥ −c′`, the sub-mean-value inequality for
`u_{k_j} − M ≤ 0` on `B(w, ρ)` bounds the mean of `u_{k_j}` over every ball contained in `B(w, ρ)` (in particular over `B(y, ρ/2)`
for `|y − w| < ρ/2`) from below, and a mean bounded below gives points where `u_{k_j}` is bounded below. So the set of points
having a ball on which the means of the `u_{k_j}` are bounded below is open and closed in the connected `U`, and it is not
empty (a limit point of maximising points in `K`): the `u_{k_j}` are bounded in `L¹_loc(U)`. Then (a) and the weak
compactness of the measures `μ_{u_{k_j}}` (bounded mass by (a)) make the Poisson parts compact and the Green potentials
converge in `L¹_loc` along a further subsequence; the `limsup` inequality comes from the sub-mean-value inequality on small
balls and the `L¹_loc` convergence. The means themselves need neither tend to `−∞` nor be bounded (fourth Check), which is
why the subsequence is chosen first.

*Needs:* 0.1–0.3; ComplexHessianEquations §7.1; Tau Ceti's planar kernels and Weyl's lemma (as cited by
ComplexHessianEquations).

**Checks.**

- `u = log|z|` on the unit disc: `μ_u = 2πδ₀`, `P_1[u] = 0`, `G_1(x, 0) = (2π)^{−1}log(1/|x|)`, and the formula gives
  `u(x) = −(2π)^{−1}log(1/|x|)·2π = log|x|`.
- `u_k = k·log|z|` on the unit disc: `sup_{|z|≤ρ} u_k = k·log ρ → −∞`, so `u_k → −∞` locally uniformly on the whole
  disc (the first alternative of (b)). `u_k = (1/k)·log|z|`: uniformly bounded above, converging in `L¹_loc` to `0` (the
  second alternative), while `u_k(0) = −∞` for every `k`.
- `u_k(z) = (1/k)log|z₁ − 1/k|` converges in `L¹_loc(ℂ²)` to `0`, while `u_k(1/k, 0) = −∞`: convergence in
  `L¹_loc` does not give pointwise convergence.
- The constants `0, −1, 0, −2, 0, −3, …` on the disc: their means neither tend to `−∞` nor stay bounded, the sequence does
  not tend to `−∞` locally uniformly, and the subsequence of zeros converges, as (b) asserts.

### 0.4 Quasi-plurisubharmonic functions

Define `u` on a complex manifold to be *quasi-plurisubharmonic* if locally `u = v + ψ` with `v` plurisubharmonic and
`ψ` smooth; and, for a continuous real `(1,1)`-form `γ`, `u` to be *`γ`-plurisubharmonic* if `u` is
quasi-plurisubharmonic and `γ + i∂∂̄u ≥ 0` (the `γ`-plurisubharmonic functions, written `PSH(X, γ)`).
Prove: (a) for a fixed `γ`, `PSH(X, γ)` is closed under convex combinations, finite maxima, limits of decreasing
sequences (the limit is in `PSH(X, γ)` or `≡ −∞` on a connected component) and upper semicontinuous regularisations of
suprema of locally uniformly upper-bounded families; the quasi-plurisubharmonic functions are closed under sums,
nonnegative multiples and finite maxima, but not under decreasing limits: a decreasing limit of quasi-plurisubharmonic
functions need not be quasi-plurisubharmonic (third Check), and lying in one `PSH(X, γ)` is a sufficient condition for
it to be, not a necessary one (fourth Check); (b) if `X` is compact and
connected and `γ` is continuous, then `{u ∈ PSH(X, γ) : sup_X u = 0}` is compact in `L¹(X)` and bounded in
`L¹`, and `sup_X u` is controlled by the mean of `u`: `sup_X u ≤ ∫_X u dV_ω/∫_X dV_ω + C(X, ω, γ)`.

*Route.* (a) is local. Near a point `x₀`, in a chart, let `q` be the quadratic polynomial with `i∂∂̄q = γ(x₀)`; for
`δ > 0`, continuity of `γ` gives a ball `B_δ ∋ x₀` on which `γ(x₀) − δ·i∂∂̄|z|² ≤ γ ≤ γ(x₀) + δ·i∂∂̄|z|²`. The upper
inequality is the one that makes `u + q + δ|z − x₀|²` plurisubharmonic on `B_δ` for EVERY `u ∈ PSH(X, γ)`:
`i∂∂̄(u + q + δ|z − x₀|²) ≥ −γ + γ(x₀) + δ·i∂∂̄|z|² ≥ 0`. One function serves the whole class. Apply 0.1 to the shifted
functions: the convex combination, maximum, decreasing limit or regularised supremum `w` (if not `≡ −∞` on the component)
is quasi-plurisubharmonic, and `w + q + δ|z − x₀|²` is plurisubharmonic on `B_δ`, so by the lower inequality
`γ + i∂∂̄w ≥ γ − γ(x₀) − δ·i∂∂̄|z|² ≥ −2δ·i∂∂̄|z|²` there. On a compact neighbourhood `K` of a point of a chart,
`i∂∂̄|z|² ≤ C_K·ω`, and the balls `B_δ(x)`, `x ∈ K`, cover `K`; positivity of currents is local, so
`γ + i∂∂̄w + 2δC_K·ω ≥ 0` on the interior of `K` for every `δ > 0`, hence `γ + i∂∂̄w ≥ 0`. For finite maxima of
quasi-plurisubharmonic `u_i = v_i + ψ_i`, add `C|z|²` with `i∂∂̄(ψ_i + C|z|²) ≥ 0` for all `i`. For decreasing limits a common
class is sufficient (without one the limit can fail to be quasi-plurisubharmonic, third Check), not necessary
(fourth Check). (b) Cover `X` by finitely many coordinate balls on which `γ ≤ i∂∂̄g` for a
smooth `g` (for instance `g = C|z|²`); on each, `u + g` is plurisubharmonic; Hartogs' lemma 0.3a(b) on each ball and connectedness exclude
the alternative `u_k → −∞` under the normalisation `sup u_k = 0`, and the sub-mean-value inequality at the point
where the supremum is attained (upper semicontinuity on compact `X`) gives the mean bound. ComplexHessianEquations
§5.4 is the `C²` case of the `L¹` bound.

*Needs:* 0.1–0.3a; ComplexHessianEquations §5.4 (for comparison).

**Checks.**

- On `ℙ¹` with the Fubini–Study form `ω_FS` of total mass one, `u_a = log(|z₀ − az₁|²/(|z₀|² + |z₁|²))` is the
  logarithm of the Fubini–Study norm of a section of `O(1)`, so `2πω_FS + i∂∂̄u_a = 2π[z₀ = az₁] ≥ 0` (ComplexComparisonPartII C5.4, `lelongPoincareSection`): `u_a`
  is `2πω_FS`-plurisubharmonic, with `sup u_a = log(1 + |a|²)` and `u_a = −∞` at one point. The normalised family
  `u_a − log(1 + |a|²)`, `|a| ≤ 1`, is compact in `L¹` and not uniformly bounded below.
- `γ = −ω_FS` on `ℙ¹` has no `γ`-plurisubharmonic function: integrating `γ + i∂∂̄u ≥ 0` over `ℙ¹` gives
  `∫γ ≥ 0`, false.
- On `ℂ`, with `x = Re z`, the smooth (hence quasi-plurisubharmonic) functions `a − √(x² + a²)` decrease to `−|x|` as
  `a ↓ 0`, and `∂²(−|x|)/∂x² = −2δ_{x=0}` is a negative measure carried by a line, which no smooth form compensates: `−|x|`
  is not quasi-plurisubharmonic. Here `i∂∂̄(a − √(x² + a²))` has no lower bound uniform in `a`.
- On `ℂ`, with `x = Re z`, the smooth functions `f_j = 2^{−j}(3 + cos(4^j x))` decrease (`f_j ≥ 2^{1−j} ≥ f_{j+1}`) to `0`, which
  is quasi-plurisubharmonic, while `∂²f_j/∂x²(0) = −2^{3j}`: no continuous `γ` has `γ + i∂∂̄f_j ≥ 0` for all `j` near `0`.

### 0.5 Pluripolar sets and removable singularities

Define `E` to be *pluripolar* if every point `x ∈ E` has a CONNECTED open neighbourhood `W` carrying a plurisubharmonic `v` with
`v ≢ −∞` on `W` and `E ∩ W ⊂ {v = −∞}`; and *complete pluripolar* if the same holds with `E ∩ W = {v = −∞}`. By 0.2(a) on the
connected `W`, `v` is then not `≡ −∞` near any point of `W`, so the witness germ at `x` is nontrivial. Connectedness cannot be
dropped: a witness on a disconnected neighbourhood may be `≡ −∞` on the component containing `x` (third Check). Prove:
nowhere dense closed analytic subsets (those containing no nonempty open set) are complete pluripolar (`v = log Σ|g_j|²` on
a connected chart neighbourhood, with local generators `g_j` of the ideal, not all identically zero there); an analytic
subset containing a nonempty open set is not pluripolar, since a witness on a connected neighbourhood of an interior point
would be `−∞` on an open set, hence `≡ −∞` (0.2(a)); countable unions on a common open set: if `E_j ⊂ {v_j = −∞}` for plurisubharmonic
`v_j ≢ −∞` on the same connected open `U`, then for every `U′ ⋐ U` there is a plurisubharmonic `v` on `U′`, not
identically `−∞` on any connected component of `U′`, with `⋃_j E_j ∩ U′ ⊂ {v = −∞}`; pluripolar sets have measure
zero; and the Grauert–Remmert extension: if `E` is a closed pluripolar subset of `U` and `u` is plurisubharmonic on
`U ∖ E` and locally bounded above near `E`, then `u` extends uniquely to a
plurisubharmonic function on `U`, namely `ũ(x) = limsup_{y→x, y∉E} u(y)`.

*Route.* Measure zero: `E ∩ W ⊂ {v = −∞}` is null by 0.2(a) on the connected `W`, and countably many witness neighbourhoods
cover `E`. The extension is local: on a connected witness neighbourhood `W` of a point of `E`, shrunk so that `u` is bounded
above on `W ∖ E` and `v` on `W`, `u + εv` is plurisubharmonic on `W ∖ E` and tends to `−∞` at `E ∩ W`, so extends by `−∞`; let
`ε ↓ 0` and regularise (0.1). Uniqueness and the formula: `E` is null, so `U ∖ E` is dense; a plurisubharmonic extension `w`
has `w(x) ≥ limsup_{y→x, y∉E} w(y)` by upper semicontinuity, and `w(x) ≤` its mean over `B(x, r)` (0.2(a); trivially if
`w ≡ −∞` near `x`), which is its mean over `B(x, r) ∖ E` and at most `sup_{B(x,r)∖E} u`. Countable unions: choose a connected open `U″ ⋐ U`
containing the closure of `U′` (cover the compact closure by finitely many balls in `U` and join them by paths in the
connected `U`) and a ball `B ⊂ U″`; replace `v_j` by `c_j(v_j − sup_{U″}v_j)` with `c_j > 0` so small that
`∫_B v_j ≥ −1`; then `v = Σ_j 2^{−j}v_j` is a decreasing limit of plurisubharmonic functions on `U″` with `∫_B v ≥ −1`,
hence plurisubharmonic and not `≡ −∞` on the connected `U″`, so `{v = −∞}` has measure zero (0.2(a)) and `v` is not
`≡ −∞` on any component of `U′`; it is `−∞` on every `E_j`. The
global form, for sets that are pluripolar only near each point with neighbourhoods depending on the set, is Josefson's
theorem and is not used here.

*Needs:* 0.1–0.3; ComplexKahlerGeometry K3 (analytic subsets).

**Checks.**

- `ℝ ⊂ ℂ` has measure zero and is not pluripolar: a polar set in `ℂ` has logarithmic capacity zero, while a
  segment of length `ℓ` has capacity `ℓ/4`. Measure zero does not characterise pluripolar sets.
- `u = −log|z|` on the punctured disc is subharmonic and not bounded above near `0`; it has no subharmonic
  extension.
- Disconnected witness neighbourhoods. On `U = U₁ ⊔ U₂`, two disjoint discs, `v = −∞` on `U₁` and `v = 0` on `U₂` is
  plurisubharmonic, `≢ −∞` on `U`, and `{v = −∞} = U₁`. If the witness neighbourhood could be `U`, the disc `U₁` would be
  closed and complete pluripolar, of positive measure, and the zero function on `U ∖ U₁ = U₂` would have one plurisubharmonic
  extension to `U` for every constant chosen on `U₁`. A connected neighbourhood of a point of `U₁` lies in `U₁`, where `v ≡ −∞`.

### 0.6 Plurisubharmonic functions on complex spaces

Define `u : Y → [−∞, ∞)` to be *plurisubharmonic* on an open set `U` of a reduced complex space `Y`
(ComplexComparisonPartII C-1.1) by the condition of 0.1: `u` is upper semicontinuous and, for every holomorphic map `g`
from a neighbourhood of the closed unit disc into `U`, `u(g(0))` is at most the mean of `u ∘ g` on the unit circle.
Prove: (a) for a local closed embedding `V ↪ W` of an open `V ⊂ Y` into an open `W ⊂ ℂ^N`, the restriction to `V` of a
plurisubharmonic function on `W` is plurisubharmonic on `V`, and on a complex manifold the definition is 0.1's;
(b) the composite of a plurisubharmonic function with a holomorphic map of reduced complex spaces is plurisubharmonic;
in particular, for a resolution `π : Ỹ → Y`, `u ∘ π` is plurisubharmonic on the manifold `Ỹ`, and a continuous metric on a
line bundle over `Y` whose local weights are restrictions of plurisubharmonic functions under local embeddings
(semipositivity on singular complex points as used in arithmetic intersection theory, tested through local
embeddings) pulls back to a semipositive metric on `Ỹ`. The converse of (a), that every plurisubharmonic function in this sense is locally such a
restriction, is the theorem of Fornæss and Narasimhan and is not needed here.

*Route.* (a), (b): a holomorphic disc in `V` is a holomorphic disc in `W`, and composites of holomorphic maps with
holomorphic discs are holomorphic discs; upper semicontinuity is preserved.

*Needs:* 0.1; ComplexComparisonPartII C-1.1 (reduced complex spaces, local embeddings).

**Checks.**

- On the cone `Y = {xy = z²} ⊂ ℂ³`, `u = log(|x|² + |y|² + |z|²)` restricted to `Y` is plurisubharmonic in the sense of
  the disc condition; its pullback along the resolution (the blow-up of the vertex) is `log` of a hermitian norm of a
  section of a line bundle, plurisubharmonic and `−∞` exactly on the exceptional curve.

### Examples

`|z|²`, `log|z|` and `max(log|z₁|, log|z₂|)` are plurisubharmonic, while `|z₁|² − ½|z₂|²` on `ℂ²` has positive Laplacian and is not (0.1). For `u = log|z|` on the unit disc the circle means are `log r`, the Riesz measure is `2πδ₀`, and the Riesz formula returns `u(x) = log|x|` (0.2, 0.3a). On `ℙ¹`, `u_a = log(|z₀ − az₁|²/(|z₀|² + |z₁|²))` is `2πω_FS`-plurisubharmonic with `sup u_a = log(1 + |a|²)` (0.4). The line `ℝ ⊂ ℂ` has measure zero and is not pluripolar (0.5). On the cone `{xy = z²}`, `log(|x|² + |y|² + |z|²)` is plurisubharmonic, and its pullback to the blow-up of the vertex is `−∞` exactly on the exceptional curve (0.6).

### Dependencies

ComplexKahlerGeometry K3 and K3.0; ComplexComparisonPartII C-1.1 and C5.4; ComplexHessianEquations §§5.4 and 7.1; Tau Ceti's Levi form, subharmonic functions and sub-mean-value lemmas; Mathlib's upper semicontinuity, `EReal`, `Real.circleAverage`, Lebesgue measure, `Lp` spaces, distributions and convolution.

## Layer 1: Lelong numbers and integrability

### 1.1 Lelong numbers

Let `X` have dimension `n ≥ 1` (Conventions). Define the Lelong number `ν(u, x)` for `u` plurisubharmonic near `x`
as in the Conventions, in a holomorphic chart centred at `x`; the same formula serves for `u` quasi-plurisubharmonic near `x` (0.4), and for `u = v + ψ`
with `v` plurisubharmonic and `ψ` smooth it gives `ν(u, x) = ν(v, x)` (`ψ` is bounded near `x`). Prove: (a) independence of the chart; (b)
`ν(u, x) = lim_{r→0} (sup_{|z−x|=r} u)/log r = sup{c ≥ 0 : u(z) ≤ c·log|z − x| + O(1) near x}`, and for `u` plurisubharmonic
near `x` the function `r ↦ sup_{|z−x|=r} u` is convex and nondecreasing in `log r`; (c) if `u` is not
`≡ −∞` near `x` (for `u ≡ −∞` near `x`, `ν(u, x) = +∞` and `∂∂̄u` is not a current),
`ν(u, x)` is the limit as `r → 0` of `σ_T(B(x, r))/(r^{2n−2}π^{n−1}/(n−1)!)` for the closed real current `T = (i/π)∂∂̄u`,
with `σ_T = T ∧ (½ i∂∂̄|z|²)^{n−1}/(n−1)!` its trace measure (ComplexComparisonPartII C5.4; a signed measure in general): for
`u` plurisubharmonic, `T` is positive and the limit is its Lelong number; for `u = v + ψ` as above, `T` need not be positive
(`u = −|z|²`, first Check), and the limit is the Lelong number of the positive current `(i/π)∂∂̄v`; (d) `ν(u + v) = ν(u) + ν(v)`, `ν(max(u, v)) = min(ν(u), ν(v))`,
`ν(cu) = cν(u)`, `ν(log|f|², x) = 2·ord_x f`; (e) `x ↦ ν(u, x)` is upper semicontinuous; (f) restriction to a
complex submanifold `S ∋ x` of positive dimension with `u|_S ≢ −∞` does not decrease the Lelong number: `ν(u|_S, x) ≥ ν(u, x)`.

*Route.* First for `u` plurisubharmonic. (b) The function `r ↦ sup_{|z−x|=r} u` is a convex nondecreasing function of
`log r` (Hadamard's three-circles argument on complex lines and the maximum principle); (c) with the Riesz measure of 0.3a,
Lelong's monotonicity of the normalised mass, by Stokes' theorem with the form `i∂∂̄ log|z − x|²` (Thie's theorem in the
chart-independent form); (a) follows from (c) after comparing two charts by `C⁻¹|z − x| ≤ |z′ − x| ≤ C|z − x|` in (b). Then for
`u` quasi-plurisubharmonic: write `u = v + ψ` on a ball `B(x, r₀)` with `v` plurisubharmonic and `ψ` smooth (0.4). If `v ≡ −∞` on
`B(x, r₀)` (by 0.2(a) on the connected ball, this is the case as soon as `v ≡ −∞` near `x`), then `u ≡ −∞` there, both expressions
in (b) are `+∞` (the sphere suprema are `−∞` and `log r < 0`), (c) is excluded, and (d)–(f) are read with `ν(u, x) = +∞`; this
case is set aside. Otherwise `sup_{|z−x|=r}v` is finite for `0 < r < r₀` (were it `−∞`, the maximum principle would give
`v ≡ −∞` on `B(x, r)`), so the difference below is defined. Neither the
convexity in (b) nor the positivity in (c) passes from `v` to `u`, so every step goes through `v`:
`|sup_{|z−x|=r}u − sup_{|z−x|=r}v − ψ(x)| ≤ sup_{|z−x|=r}|ψ − ψ(x)| = O(r)`, so the limit in (b) exists for `u` and equals that for
`v`; the condition `u ≤ c·log|z − x| + O(1)` is the same for `u` and `v`, `ψ` being bounded; and in (c) the trace measure of the
smooth form `(i/π)∂∂̄ψ` has a bounded density, so its mass on `B(x, r)` is `O(r^{2n})`, which is `O(r²)` after division by
`r^{2n−2}`. (a), (d)–(f) likewise reduce to `v`.

*Needs:* 0.1–0.3a; ComplexComparisonPartII C5.4 (`CurrentCalculus`, trace measures).

**Checks.**

- Quasi-plurisubharmonic functions on `ℂ`: for `u = −|z|²`, `(i/π)∂∂̄u = −(2/π)dλ` is a negative current and
  `sup_{|z|=r}u = −r²` decreases in `r`, while `ν(u, 0) = 0`; for `u = log|z|² − |z|²` the normalised mass of `(i/π)∂∂̄u` on
  `B(0, r)` is `2 − 2r² → 2 = ν(u, 0)`.
- `ν(log|z₁|, 0) = 1` on `ℂ²`. A definition by `limsup` instead of `liminf` would give `+∞`, since the
  quotient is `+∞` along `z₁ = 0`.
- `ν(log(|z₁|² + |z₂|⁴), 0) = 2` and `ν(log(|z₁|² + |z₂|⁴), (0, b)) = 0` for `b ≠ 0`.
- `u = −√(−log|z|)` near `0` is subharmonic, unbounded below, with `ν(u, 0) = 0`.
- Dimension zero is excluded. On a point `X = {x}` (`n = 0`; Lebesgue measure on `ℂ⁰` is the unit mass) with `u = 0`, `e^{−u} = 1`
  is integrable and `J(u) = O` has empty cosupport (6.1), while `{ν ≥ 2n} = {ν ≥ 0}` would contain `x` whatever value were
  given to `ν(u, x)` (the `liminf` over the empty punctured neighbourhood is `+∞`): 1.2(b) and the inclusion of 6.1 would
  fail, and 1.1(c) contains `(n − 1)!`.

### 1.2 Skoda's integrability theorem

Prove: for `n ≥ 1` and `u` plurisubharmonic near `x ∈ ℂ^n` (or in a chart on a manifold), (a) if `ν(u, x) < 2` then
`e^{−u}` is integrable on a neighbourhood of `x`; (b) if `ν(u, x) ≥ 2n` then `e^{−u}` is not integrable on any
neighbourhood of `x`; (c) if `ν(u, x) ≥ 2(n + s)` for an integer `s ≥ 0`, then every holomorphic germ `f` with
`|f|²e^{−u}` integrable near `x` vanishes to order at least `s + 1` at `x`. Uniformly: for `A > 0` there are
`α = α(n, A) > 0` and `C` with `∫_{B(0,1)} e^{−αu} ≤ C` for every plurisubharmonic `u ≤ 0` on `B(0,2)` with
`∫_{B(0,2)}(−u) ≤ A`.

*Route.* The uniform statement is ComplexHessianEquations Layer 7's local estimate for `C²` functions,
extended to all plurisubharmonic functions by 0.3(a) and Fatou's lemma. (a) For `n = 1` a proof: let `μ` be the Riesz
measure of `u` (0.3a(a), normalised so that `log|z|` has the measure `2πδ₀`); its point mass at `x` is `2π·ν(u, x)` (split it
off as in 6.6's route), so `ν(u, x) < 2` gives a disc `B ∋ x` with `μ(B) = 2πm`, `m < 2` (the masses of shrinking discs
decrease to the point mass). Then `u = h + (1/2π)∫_B log|z − w| dμ(w)` near `x` with `h` harmonic, hence bounded. If `m = 0`,
`u = h` near `x` and `e^{−u}` is bounded there; if `m > 0`, Jensen's inequality for the probability measure `μ/(2πm)` gives `e^{−u} ≤ C·∫_B |z − w|^{−m} dμ(w)/(2πm)`; integrating in
`z` over a neighbourhood gives a finite bound, uniform in `w`, because `m < 2`. For `n ≥ 2`
this is Skoda's integrability theorem (H. Skoda, 1972; also in Demailly's book, chapter III), proof not given here. The
argument above does not carry over to the Newtonian kernel: in real dimension `2n > 2` the kernel behaves like
`|z − w|^{2−2n}` at the pole, and `exp(a|z − w|^{2−2n})` is not integrable near `w` for any `a > 0`. The threshold comes from
the complex structure. One way to see it: on a complex line `ℓ` through `x` along which the Lelong number of `u` is
`ν(u, x)` (a classical fact: the directions in which the restriction has a larger Lelong number form a pluripolar, in
particular Lebesgue-null, subset of the projective space of lines), the case `n = 1` gives integrability of `e^{−u}` on `ℓ`
near `x`; extending the constant `1` from `ℓ` to a plane, then to a three-space, and so on along a flag of linear subspaces,
each time by the Ohsawa–Takegoshi theorem 4.1 on a small polydisc with the weight `u`, gives a holomorphic `F` with
`F(x) = 1` and `∫|F|²e^{−u} < ∞` near `x`, hence integrability of `e^{−u}` there. (b) `u ≤ ν·log|z − x| + C` near
`x` and `|z|^{−2n}` is not integrable. (c) Near `x`, `e^{−u} ≥ c|z − x|^{−2(n+s)}` by (b)'s inequality; if
`f` has order `k ≤ s` at `x`, its leading homogeneous form `f_k` is nonzero on an open cone `Γ` of directions, so
`|f|² ≥ c|z − x|^{2k}` on `Γ` near `x`, and `∫_Γ |z − x|^{2k−2(n+s)}dλ` diverges (`2k − 2(n + s) + 2n − 1 ≤ −1` in the
radial integral).

*Needs:* 0.3a, 1.1; ComplexHessianEquations Layer 7 (§7.1, the local estimate).

**Checks.**

- `u = c·log|z|²` on `ℂ^n`: `ν = 2c`, and `e^{−u} = |z|^{−2c}` is integrable near `0` iff `c < n`, i.e. iff
  `ν < 2n`: (b) is sharp.
- `u = c·log|z₁|²` on `ℂ^n`: `ν = 2c`, integrable iff `c < 1`, i.e. iff `ν < 2`: (a) is sharp.

### 1.3 The complex singularity exponent

Define the complex singularity exponent `c(u, x) = sup{t ≥ 0 : e^{−tu} is integrable near x}` (`+∞` allowed). Prove, for `n ≥ 1`,
`2/ν(u, x) ≤ c(u, x) ≤ 2n/ν(u, x)` when `ν(u, x) > 0`, and that it is `+∞` iff `ν(u, x) = 0`.
(Its rationality for `u = log Σ|g_j|²` with all `g_j(x) = 0` is 6.3(d).)

*Route.* The inequalities are 1.2(a)–(b) applied to `cu`; for `ν = 0`, 1.2(a) for every `c`.

*Needs:* 1.2.

**Checks.**

- For `g = z₁^a z₂^b` on `ℂ²`, `a, b ≥ 1`, the exponent of `log|g|²` at `0` is `1/max(a, b)`; `ν = 2(a + b)`
  and the bounds read `1/(a + b) ≤ 1/max(a, b) ≤ 2/(a + b)`.

### Examples

`ν(log|z₁|, 0) = 1` on `ℂ²`, `ν(log(|z₁|² + |z₂|⁴), 0) = 2`, and `u = −√(−log|z|)` is unbounded below with `ν(u, 0) = 0` (1.1). For `u = c·log|z|²` on `ℂ^n`, `ν = 2c` and `e^{−u}` is integrable near `0` iff `ν < 2n`; for `u = c·log|z₁|²`, iff `ν < 2` (1.2). For `g = z₁^a z₂^b` with `a, b ≥ 1`, the complex singularity exponent of `log|g|²` at `0` is `1/max(a, b)` (1.3).

### Dependencies

Layer 0; ComplexComparisonPartII C5.4 (trace measures); ComplexHessianEquations Layer 7 (§7.1).

## Layer 2: Singular hermitian metrics and their curvature currents

### 2.1 Singular metrics

Define a *singular hermitian metric* on a holomorphic line bundle `L` over a complex manifold `X`: an assignment
to each local holomorphic frame `e` on an open `U` of a weight `φ_e ∈ L¹_loc(U)`, compatible with change of
frame (`φ_{ge} = φ_e − log|g|²` for holomorphic invertible `g`), so that `|e|²_h = e^{−φ_e}`. Define the
curvature current `iΘ_h(L) = i∂∂̄φ_e` (independent of `e` because `log|g|²` is pluriharmonic) and the Chern
current `c₁(L, h) = (i/2π)∂∂̄φ_e`, closed real `(1,1)`-currents. A weight is an almost-everywhere class: the metric
`h`, its Hilbert spaces and its curvature current do not change when a weight is changed on a null set. `h` is
*semipositive* (or *positive*) when every local weight agrees almost everywhere with a plurisubharmonic function, and
`iΘ_h ≥ γ` is understood in the sense of currents. If `iΘ_h ≥ γ` for a continuous `γ` (in particular if `h` is
semipositive), every local weight agrees almost everywhere with a unique quasi-plurisubharmonic function (0.3(b) applied
to `φ_e + q`, `q` a local quadratic polynomial with `i∂∂̄q ≥ −γ`; two quasi-plurisubharmonic functions equal almost
everywhere are equal, 0.3(c)), its *canonical representative*, with values in `[−∞, ∞)` at every point and compatible with
change of frame. Every pointwise use of a weight below (values `|s(x)|²_h`, Bergman densities, restrictions to
submanifolds, pull-backs) is a use of the canonical representatives; for a general `L¹_loc` weight it is not defined
(third Check).

The API: smooth metrics (ComplexKahlerGeometry K4) are singular metrics with smooth weights; tensor products
add weights, duals negate them, powers multiply them; `h′ = e^{−ψ}h` for a global `ψ ∈ L¹_loc(X)`; for metrics with
quasi-plurisubharmonic weights, pullback of the canonical representatives along a holomorphic map whose image meets the
complement of their polar set in every component (a general `L¹_loc` weight has no pullback);
the metric `h_s = 1/Σ_j|s_j|²` defined by sections `s_1, …, s_N ∈ H⁰(X, L)` not all vanishing identically on a
component, with weight `log Σ_j|f_j|²` and `iΘ ≥ 0`; comparison of singularities `h₁ ≼ h₂` (locally
`φ₁ ≤ φ₂ + O(1)`, `h₁` is more singular).

*Needs:* 0.1–0.4; ComplexKahlerGeometry K4 (holomorphic bundles, frames, smooth metrics and Chern connections).

**Checks.**

- For a smooth metric, `iΘ_h(L)` is the curvature form of the Chern connection: with `|e|² = e^{−|z|²}` on `ℂ`,
  `iΘ = i dz ∧ dz̄` and `c₁ = (i/2π)dz ∧ dz̄ > 0` (ComplexComparisonPartII C1.3's check).
- On `O(1)` over `ℙ¹`, the metric `1/|z₀|²` defined by the section `z₀` has `c₁ = [z₀ = 0]`, a Dirac current of
  mass `1 = deg O(1)`; the Fubini–Study metric has `c₁ = ω_FS`, also of mass one.
- On the unit disc with the trivial bundle, the weights `φ_c` equal to `0` off `0` and to `c` at `0` define one metric
  (the same Hilbert spaces and curvature current `0`), all locally bounded above and finite at `0`; the value
  `sup{|f(0)|²e^{−φ_c(0)} : ∫|f|²e^{−φ_c} ≤ 1} = e^{−c}/π` depends on `c`. The canonical representative is `φ_0 = 0`, giving
  `1/π`. Likewise, changing a weight on an embedded curve changes its restriction to the curve.

### 2.2 Analytic singularities

Say that a singular metric `h` whose local weights are quasi-plurisubharmonic (2.1;
`φ` below is the canonical representative) has *analytic singularities* with coefficient `c` if locally `φ = c·log Σ_j|g_j|² + w` with holomorphic `g_j`, not all identically
zero on any component, a rational `c ≥ 0` and `w` bounded on the complement of `V(g_j)` (*neat* when `w` extends smoothly).
Prove that for `c > 0` the polar set `{φ = −∞}` of such a weight
is the analytic set `V(g_j)` (for `c = 0` the weight is bounded and its polar set is empty), that `h` is smooth on
`X ∖ V(g_j)` when `w` is smooth, and that the Lelong number (1.1) at `x` is `2c·min_j ord_x g_j`, which is `2c` times the order
at `x` of the ideal `(g_j)`. The polar set and the Lelong numbers are those of the canonical representative; a weight with
a bounded remainder that is not quasi-plurisubharmonic has neither (second Check), which is why the definition asks for
quasi-plurisubharmonic weights.

*Route.* Off `V(g_j)`, `φ ≥ c·log Σ_j|g_j|² − sup|w| > −∞` near each point, and the canonical representative is the limit
of its means over small balls (0.2(a), applied to `φ` plus a local smooth function making it plurisubharmonic); at
`x ∈ V(g_j)` these means are at most `c·log sup_{B(x,r)} Σ_j|g_j|² + sup|w| + o(1) → −∞`, so `φ(x) = −∞` when `c > 0`. Lelong
numbers: the bounded `w` does not change the `liminf` that defines `ν(φ, x)`, `log Σ_j|g_j|² = log max_j|g_j|² + O(1)`, and
1.1(d) gives `ν(log max_j|g_j|², x) = min_j 2·ord_x g_j`.

*Needs:* 2.1; 0.2, 0.4, 1.1; ComplexKahlerGeometry K3 (analytic sets).

**Checks.**

- `log(|z₁|² + |z₂|²)` and `log max(|z₁|², |z₂|²)` define the same singularity class with Lelong number `2`
  at the origin, although the second is not of the form above with smooth `w` (it is with bounded `w`).
- `φ = log|z|² − |Re z|` on the disc has the form `log|z|² + w` with `w = −|Re z|` bounded, but `∂²(−|x|)/∂x² = −2δ_{x=0}`: the
  curvature of `e^{−φ}` has a negative measure on the imaginary axis, which no continuous form bounds from below near its
  points `≠ 0`. So `φ` is not quasi-plurisubharmonic, it has no canonical representative (2.1), and neither its polar set
  nor its Lelong numbers are defined by 2.1 and 1.1.

### 2.3 The Poincaré–Lelong formula for singular metrics

Prove: if `s ∈ H⁰(X, L)` vanishes identically on no component of `X` and `h` is a singular metric on `L` whose
local weights are quasi-plurisubharmonic, then `log|s|²_h ∈ L¹_loc(X)` and, as currents,
`(i/2π)∂∂̄ log|s|²_h = [div s] − c₁(L, h)`.

*Route.* Write `h = e^{−ψ}h₀` with `h₀` smooth and `ψ` a global quasi-plurisubharmonic function; then
`log|s|²_h = log|s|²_{h₀} − ψ`, ComplexComparisonPartII C5.4's `lelongPoincareSection` gives the formula for
`h₀`, and `c₁(L, h) = c₁(L, h₀) + (i/2π)∂∂̄ψ`.

*Needs:* 2.1; ComplexComparisonPartII C5.4 (`lelongPoincareSection`, `AnalyticCycleIntegration`).

**Checks.**

- For `h = 1/|s|²` itself, `log|s|²_h = 0` and the formula reads `c₁(L, h) = [div s]`.

### 2.4 The Chern current computes the first Chern class

Prove: for every singular metric `h` on `L` over `X` and every closed compactly supported smooth `(2n−2)`-form
`η`, `c₁(L, h)(η) = ∫_X c₁(L, h₀) ∧ η` for any smooth metric `h₀`; hence on compact `X`, the pairing of
`c₁(L, h)` with closed forms is the de Rham class of ComplexComparisonPartII C5.4's
`integralLineBundleChernClass L` (real image). In particular, if the weights of `h` are quasi-plurisubharmonic and
`C ⊂ X` is a compact curve, `ι : C̃ → X` its normalisation followed by the inclusion, and no component of `C̃` is mapped
into the polar set of the canonical representatives, then `ι^*h` (2.1) is a singular metric on `ι^*L` and
`∫_{C̃} c₁(ι^*L, ι^*h) = deg(L|_C)`. (A restriction of the `L¹_loc` classes themselves to `C` is not defined: 2.1, third
Check.)

*Route.* `c₁(L, h) − c₁(L, h₀) = (i/2π)∂∂̄ψ = d((i/2π)∂̄ψ)`, an exact current, which vanishes on closed forms by
the current sign conventions of C5.4. For the curve: the canonical representatives composed with `ι` are
quasi-plurisubharmonic on `C̃` (0.3(d), applied to local plurisubharmonic potentials) and not `≡ −∞` on any component, hence
locally integrable (0.2(a)); apply the first statement on the compact Riemann surface `C̃` with `η = 1`, and
`deg ι^*L = deg(L|_C)`.

*Needs:* 2.1, 2.3; ComplexComparisonPartII C5.4 (`integralLineBundleChernClass`, `chernFubiniStudyIntersection`).

### 2.5 Degrees on curves from metrics of logarithmic growth

Prove: let `C` be a compact Riemann surface, `S ⊂ C` finite, `L` a holomorphic line bundle on `C`, and `h` a
smooth hermitian metric on `L|_{C∖S}` such that (i) `c₁(L, h)` is integrable on `C ∖ S` and (ii) near each
`x ∈ S`, in a frame `e` of `L` and a coordinate `z` centred at `x`, `|log|e|²_h| ≤ m·log(−log|z|) + c` for some
`m, c`. Then `deg L = ∫_{C∖S} c₁(L, h)`. If `c₁(L, h) ≥ 0` on `C ∖ S`, then (i) follows from (ii), and `deg L ≥ 0`.

*Route.* The weight `φ = −log|e|²_h` is locally integrable near `x` by (ii), so `h` is a singular metric on `L`
over `C` (2.1). In the coordinate `z`, write the distribution `T = Δφ − f` on a disc around `x = 0`, with `f` the function
equal to `Δφ` off `0` (integrable by (i), as `c₁(L, h) = (4π)^{−1}Δφ·dλ` there) and extended by zero; `T` is supported at `0`,
hence a finite sum `Σ_α c_α∂^αδ₀`. *No derivative terms.* Let `χ`
be a cut-off equal to `1` near `0` and supported in the unit disc, `χ_r(z) = χ(z/r)`, and `P = x^ay^b` a monomial of degree
`d = a + b ≥ 1`. For small `r`, `⟨T, χ_rP⟩ = Σ_α(−1)^{|α|}c_α∂^αP(0) = (−1)^d a!b!·c_{(a,b)}`, independent of `r`. On the other
hand `⟨T, χ_rP⟩ = ∫φ·Δ(χ_rP) − ∫fχ_rP`, with `|Δ(χ_rP)| ≤ C_P r^{d−2}` on `{|z| < r}` (the terms with derivatives of `χ_r` live
on the annulus `r/2 < |z| < r` and are `O(r^{−2}·r^d)` and `O(r^{−1}·r^{d−1})`; `ΔP = O(r^{d−2})`), and
`∫_{|z|<r}|φ| ≤ C r²(log log(1/r) + 1)` by (ii); so the first integral is `O(r^d log log(1/r))` and the second is at most
`C r^d ∫_{|z|<r}|f|`. Both tend to `0` as `r → 0`, so `c_α = 0` for every `|α| ≥ 1` and `T = c₀δ₀`. *No point mass.* For the
circle means `m(r)` of `φ` (smooth for `r > 0`), Green's formula on annuli gives `2πr·m′(r) − 2πs·m′(s) = ∫_{s<|z|<r} f`, so
`κ = lim_{r→0} 2πr·m′(r)` exists (`f ∈ L¹`); testing `T` against radial `χ_r` gives `κ = c₀`. If `c₀ ≠ 0` then
`|m(r)| ≥ (|c₀|/2π − o(1))·log(1/r)`, against (ii). So `T = 0`, `c₁(L, h)` on `C` is the extension by zero of the form, and
2.4 gives the degree. (Circle means alone do not decide this: the zeroth Fourier mode of the potential of an integrable
density may be unbounded, as `−log log(1/|z|²)` shows, and the potential `δ₀` of `Δδ₀` vanishes on every circle.) If
`c₁(L, h) ≥ 0`, `φ` is subharmonic on the punctured disc; its circle maxima are a
convex function of `log r` which by (ii) is `o(|log r|)` as `r → 0`, hence nondecreasing, so `φ` is bounded above near
`x` and extends subharmonically across `x` (0.5); its Riesz measure (0.3a) is finite near `x`, which is (i).

*Needs:* 0.3a, 0.5, 2.1, 2.4.

**Checks.**

- On the unit disc with the trivial bundle, `|e|² = −log|z|` near `0` satisfies (ii) with `m = 1`; the metric
  `|e|² = |z|²` does not (it is the smooth metric of `O([0])` with `|1/z| = 1` for its frame `1/z`, read in the frame
  `1 = z·(1/z)`), and its curvature current has a Dirac mass at `0`: (ii) is what excludes point masses.
- `L = O(p)` on an elliptic curve with a metric smooth off `p` and `|e|² = −log|z|` near `p` in a frame of
  `O(p)`: the integral of the curvature form is `1`.

### 2.6 Positivity notions

Define, for `X` compact: `L` is *pseudoeffective* if it carries a singular metric with `iΘ_h ≥ 0`; *analytically
nef* if for every `ε > 0` it carries a smooth metric with `iΘ ≥ −εω`. Prove: (a) an analytically nef line bundle
has `deg(L|_C) ≥ 0` on every compact curve `C ⊂ X`, and a pseudoeffective one has `deg(L|_C) ≥ 0` on every compact
curve `C` no irreducible component of which is contained in the polar set of the metric (the canonical representatives,
2.1); for a reducible `C` it does not suffice that `C` itself is not contained in the polar set (second Check); (b) if `X` is projective and `L` is big
(AlgebraicModuliForArithmeticGeometry §1.6, `bigLineBundle`), then `L` carries a singular metric with analytic
singularities and `iΘ_h ≥ εω` for some `ε > 0`. The converse of (b) is 9.5.

*Route.* (a) `deg(L|_C)` is the sum of the degrees on the irreducible components; on each, 2.4 on its normalisation, where
the restricted weight is quasi-plurisubharmonic and not `≡ −∞` (the component is not in the polar set), gives the integral
of a positive current. For analytically nef `L`, the smooth metrics give `deg(L|_C) ≥ −(ε/2π)∫_Cω` for every `ε > 0`.
(b) Kodaira's lemma: for a very ample `A` and a smooth member `D ∈ |A|`, `h⁰(mL) ≥ c·m^n` while
`h⁰((mL)|_D) = O(m^{n−1})`, so `h⁰(mL − A) > 0` for large `m`; with `mL = A + E`, `E` effective, take
`h = (h_A ⊗ |s_E|^{−2})^{1/m}`, `h_A` the pullback of a Fubini–Study metric (ComplexKahlerGeometry §7.2 (K7.2)).

*Needs:* 2.1, 2.2, 2.4; AlgebraicModuliForArithmeticGeometry §1.6; ComplexKahlerGeometry §7.2 (K7.2);
ComplexComparisonPartII C0 (analytification of line bundles) and C2.2 (GAGA for sections).

**Checks.**

- On the blow-up `X` of `ℙ²` at a point with exceptional curve `E`, `L = O(H + E)`, `H` the pullback of a line,
  is big and not nef (`L·E = −1`). Writing `L = (H − δE) + (1 + δ)E` with `H − δE` ample for small `δ > 0` gives a
  metric with `iΘ ≥ εω`, singular along `E`; by (a) applied to `C = E` there is no smooth metric with
  `iΘ ≥ −εω` for small `ε`.
- Reducible curves. Blow up `ℙ²` at a point and then at a point of the exceptional curve; let `E` be the strict transform
  of the first exceptional curve and `F` the second exceptional curve (`E² = −2`, `F² = −1`, `E·F = 1`). The metric
  `1/|s_E|²` on `O(E)` has the weight `log|f|²` in a frame `e` with `s_E = f·e`, curvature current `iΘ = i∂∂̄log|f|² = 2π[E] ≥ 0`,
  Chern current `[E]` (Conventions) and polar set `E`. The connected curve `E ∪ F` is not contained in `E`,
  but `deg(O(E)|_{E∪F}) = E² + E·F = −1`; on its component `F`, not in the polar set, the degree is `E·F = 1 ≥ 0`.

### Examples

On `O(1)` over `ℙ¹`, the metric `1/|z₀|²` has Chern current `[z₀ = 0]` and the Fubini–Study metric has `c₁ = ω_FS`, both of mass `1 = deg O(1)` (2.1). `log(|z₁|² + |z₂|²)` has Lelong number `2` at the origin (2.2). On the unit disc, `|e|² = −log|z|` satisfies the logarithmic growth condition of 2.5 with `m = 1`, while `|e|² = |z|²` does not and its curvature current has a Dirac mass at `0` (2.5). On the blow-up of `ℙ²` at a point, `O(H + E)` is big and not nef, and carries a metric with `iΘ ≥ εω` singular along `E` (2.6).

### Dependencies

Layers 0–1; ComplexKahlerGeometry K3, K4 and K7.2; ComplexComparisonPartII C0, C2.2 and C5.4; AlgebraicModuliForArithmeticGeometry §1.6.

## Layer 3: L² estimates for ∂̄ with plurisubharmonic weights

### 3.1 Hörmander's theorem on pseudoconvex domains

Prove: let `Ω ⊂ ℂ^n` be pseudoconvex (it has a continuous plurisubharmonic exhaustion) and `φ`
plurisubharmonic on `Ω`. (a) For every `(0,1)`-form `g` with `∂̄g = 0` and `∫_Ω|g|²e^{−φ}dλ < ∞` there is `u`
with `∂̄u = g` and `∫_Ω|u|²e^{−φ}(1 + |z|²)^{−2}dλ ≤ ∫_Ω|g|²e^{−φ}dλ`. (b) If `i∂∂̄φ ≥ c·i∂∂̄|z|²` with a
constant `c > 0`, the same with `∫_Ω|u|²e^{−φ}dλ ≤ (1/c)∫_Ω|g|²e^{−φ}dλ`. The same holds for `(p,q)`-forms,
`q ≥ 1`, with the constant `1/(qc)` in (b). Pointwise norms of forms are those with `|dz̄_j| = 1`, i.e. of the
metric with Kähler form `i∂∂̄|z|² = 2ω_eucl`, and `dλ` is Lebesgue measure.

*Route.* Exhaust `Ω` by relatively compact pseudoconvex domains with smooth strictly plurisubharmonic
exhaustions; replace `φ` by smooth plurisubharmonic approximants decreasing to it (0.3(a)) on each; on each
domain apply ComplexComparisonPartII C1.4 to a complete Kähler metric `ω̂_ε = ω_eucl + ε·ω̂` (obtained from the
exhaustion, C1.5), using that for `(n,q)`-forms the norm `|g|²_{ω} dV_ω` is nonincreasing in `ω` and the
curvature term `⟨B⁻¹g, g⟩ dV` is too, so that the estimate for the Euclidean metric follows as `ε → 0`; pass to
weak limits in the weighted `L²` spaces and use monotone convergence for the decreasing weights. For (a) add
`2 log(1 + |z|²)`, whose Levi form is at least `2(1 + |z|²)^{−2}·i∂∂̄|z|²`.

*Needs:* 0.1–0.3; ComplexComparisonPartII C1.4 (`weightedDolbeaultEstimate`), C1.5 (`StronglyOneComplete`,
complete metric from an exhaustion); RealAnalyticGeometry R3.1.

**Checks.**

- `Ω = ℂ`, `φ = |z|²`, `g = dz̄`: `u = z̄` solves `∂̄u = g`, and the minimal solution is `z̄` (orthogonal to the
  weighted holomorphic functions); `∫|z̄|²e^{−|z|²} = π = ∫|1|²e^{−|z|²}`, matching (b) with `c = 1`.

### 3.2 The twisted Bochner–Kodaira–Nakano inequality

Prove: let `(X, ω)` be Kähler, `E` a hermitian holomorphic bundle, `η > 0` and `λ > 0` smooth functions. For
every compactly supported smooth `E`-valued `(n,q)`-form `u`,
`‖(η + λ)^{1/2}∂̄*u‖² + ‖η^{1/2}∂̄u‖² ≥ ⟨⟨[η·iΘ(E) − i∂∂̄η − iλ^{−1}∂η ∧ ∂̄η, Λ]u, u⟩⟩`. Consequently, with
`B = [η·iΘ(E) − i∂∂̄η − iλ^{−1}∂η ∧ ∂̄η, Λ]` positive definite on `(n,q)`-forms:

(a) if `ω` is complete and `η + λ` is bounded on `X`, every `g ∈ L²` with `∂̄g = 0` and `∫⟨B^{−1}g, g⟩dV_ω < ∞` is `∂̄u`
for some `u ∈ L²` with `∫ (η + λ)^{−1}|u|² dV_ω ≤ ∫⟨B^{−1}g, g⟩dV_ω`;

(b) for `q = 1` the same holds when `X` carries some complete Kähler metric (`ω` itself need not be complete), and, with
`u ∈ L²_loc` and `∂̄u = g` in the sense of distributions, for arbitrary smooth `η, λ > 0` when `X` is weakly pseudoconvex.

Without the bound on `η + λ`, the twisted graph norm is in general not approximated by compactly supported forms, and the
compactly supported inequality does not give the existence statement (second Check).

*Route.* Apply the Bochner–Kodaira–Nakano identity of ComplexKahlerGeometry §6.1 (K6.0) to `η^{1/2}u`, integrate by parts the
cross terms in `∂η`, and absorb them by the Cauchy–Schwarz inequality with weight `λ`. (a) *The inequality on the whole
domain.* For `v ∈ Dom ∂̄ ∩ Dom ∂̄*` there are compactly supported smooth `v_k → v` with `∂̄v_k → ∂̄v` and `∂̄*v_k → ∂̄*v` in `L²`
(density in the graph norm for the complete `ω`, RealAnalyticGeometry R3.1); as `η ≤ η + λ ≤ M`, the left sides converge,
and Fatou's lemma along an almost everywhere convergent subsequence (`B ≥ 0` pointwise) gives the inequality for `v`.
*Existence.* For `v ∈ Dom ∂̄*` write `v = v₁ + v₂` with `v₁ ∈ ker ∂̄` and `v₂ ∈ (ker ∂̄)^⊥ ⊆ ker ∂̄*`; then `v₁ ∈ Dom ∂̄ ∩ Dom ∂̄*`,
`∂̄*v₁ = ∂̄*v`, `⟨⟨v, g⟩⟩ = ⟨⟨v₁, g⟩⟩`, and pointwise and integral Cauchy–Schwarz with the inequality for `v₁` give
`|⟨⟨v, g⟩⟩|² ≤ ∫⟨B^{−1}g, g⟩·‖(η + λ)^{1/2}∂̄*v‖²`. So `(η + λ)^{1/2}∂̄*v ↦ ⟨⟨v, g⟩⟩` is a well-defined functional of norm
`≤ (∫⟨B^{−1}g, g⟩)^{1/2}`; the Riesz theorem gives `f ∈ L²` with `‖f‖² ≤ ∫⟨B^{−1}g, g⟩` and
`⟨⟨v, g⟩⟩ = ⟨⟨∂̄*v, (η + λ)^{1/2}f⟩⟩` for all `v ∈ Dom ∂̄*`. Since `η + λ` is bounded, `u = (η + λ)^{1/2}f ∈ L²`, so `u ∈ Dom ∂̄** = Dom ∂̄`,
`∂̄u = g` and `∫(η + λ)^{−1}|u|² = ‖f‖²`. (b) For `q = 1`, `B` positive definite on `(n,1)`-forms means that the twisted
curvature form is Nakano positive, which does not involve the metric; and for a second Kähler metric `ω̂ ≥ ω`
(simultaneously diagonal at a point, `ω̂ = Σγ_j i dz_j ∧ dz̄_j`, `γ_j ≥ 1`) the quantities `⟨B^{−1}g, g⟩dV` on `(n,1)`-forms and
`|u|²dV` on `(n,0)`-forms are the same for `ω` and `ω̂`, while `|g|²dV` does not increase. So (a) for the complete metric
`ω + ω̂` gives the statement for `ω`. On a weakly pseudoconvex `X` with exhaustion `ψ`, the sublevel sets `X_c = {ψ < c}` are
weakly pseudoconvex (exhaustion `ψ − log(c − ψ)`) and carry complete Kähler metrics (RealAnalyticGeometry R3.1's
construction, as in 3.1), and `η + λ` is bounded on `X_c`; this gives `u_c` on `X_c` with
`∫_{X_c}(η + λ)^{−1}|u_c|² ≤ ∫_X⟨B^{−1}g, g⟩`. On each compact `K`, `(η + λ)^{−1}` is bounded below, so the `u_c` are bounded in
`L²(K)`; a diagonal weak limit `u` satisfies `∂̄u = g` and, by weak lower semicontinuity on each `K`, the bound.

*Needs:* ComplexKahlerGeometry §6.1 (K6.0) (Bochner–Kodaira–Nakano, the Nakano bound); RealAnalyticGeometry R3.1;
ComplexComparisonPartII C1.3–C1.4.

**Checks.**

- `η ≡ 1` gives the untwisted inequality and, with `λ → 0` (the term in `∂η` vanishes), ComplexComparisonPartII C1.4's
  estimate `∫|u|² ≤ ∫⟨[iΘ(E), Λ]^{−1}g, g⟩` with the same constant `1`.
- The bound on `η + λ` in (a): on `X = ℂ` with the euclidean (complete) metric, the trivial bundle with weight
  `φ = log(1 + |z|²)`, `η = 1` and `λ = (1 + |z|²)³`, let `F` be smooth with `F = z̄^{−3}` outside a disc and `u` the top form
  with coefficient `e^φF`. Then `u` is square integrable (`e^φ|F|² ~ |z|^{−4}`) and `∂̄*u`, a multiple of `e^φ∂_zF`, has compact
  support. The functional `ℓ(u) = ∫z̄²∂_zF dA`, written through `∂̄*u`, is continuous for `‖(η + λ)^{1/2}∂̄*u‖` by
  Cauchy–Schwarz (`∫|z|⁴e^{−φ}(η + λ)^{−1}dA < ∞`), vanishes on compactly supported forms (`∂_z z̄² = 0`), and equals `π` on this
  `u` for `F = z̄^{−3}(1 − χ(|z|))` with a cut-off `χ` (it is `−π∫χ′(r)dr`): `u` is not a limit of compactly supported forms
  in the twisted graph norm.

### 3.2a Curvature of sub-bundles and quotient bundles; Skoda's inequality

*Notation.* For a hermitian holomorphic vector bundle `E` with Chern connection `D_E = D′_E + ∂̄` and curvature
`Θ_E = D_E² = Σ_{j,k}Θ_{jk̄}dz_j ∧ dz̄_k` (`Θ_{jk̄}` sections of `End E`, in local coordinates), the *Griffiths form* is
`θ_E(ξ ⊗ v) = Σ_{j,k}ξ_jξ̄_k⟨Θ_{jk̄}v, v⟩` for `ξ ∈ T^{1,0}_xX`, `v ∈ E_x`, and the *Nakano form* is
`θ_E(u) = Σ_{j,k}⟨Θ_{jk̄}u_j, u_k⟩` for `u = Σ_j ∂/∂z_j ⊗ u_j ∈ T^{1,0}_xX ⊗ E_x`; `E` is Griffiths (Nakano)
semipositive when the first (second) is `≥ 0`. For a line bundle with weight `φ` both are `|v|²` times the Levi form
`Σφ_{jk̄}ξ_jξ̄_k` (Conventions). For an `E`-valued `(n,1)`-form `u = Σ_j u_j dz_1 ∧ ⋯ ∧ dz_n ∧ dz̄_j`, in coordinates
orthonormal for `ω` at the point, `⟨[iΘ_E, Λ_ω]u, u⟩ = θ_E(Σ_j ∂/∂z_j ⊗ u_j)` (ComplexKahlerGeometry §6.1 (K6.0)).

Prove:

(a) (*sub-bundles and quotients*) Let `S ⊂ E` be a holomorphic sub-bundle with the induced metric and `Q = E/S` with the
quotient metric, identified with `S^⊥` as a smooth bundle. The *second fundamental form* `β`, `β(s) = ` the `S^⊥`-component of
`D_E s` for smooth sections `s` of `S`, is a `(1,0)`-form with values in `Hom(S, Q)`, `β = Σ_jβ_jdz_j`; with respect to
`E = S ⊕ S^⊥`, `D_E = (D_S, −β*; β, D_Q)` and `Θ_S = Θ_E|_S + β* ∧ β`, `Θ_Q = Θ_E|_Q + β ∧ β*` (the diagonal blocks of
`Θ_E`). Hence, for `v ∈ S_x`, `w ∈ Q_x` with lift `w̃ ∈ S^⊥_x`, and `u ∈ T^{1,0}_xX ⊗ S_x`,
`θ_S(ξ ⊗ v) = θ_E(ξ ⊗ v) − |β(ξ)v|²`, `θ_S(u) = θ_E(u) − |Σ_jβ_ju_j|²`, `θ_Q(ξ ⊗ w) = θ_E(ξ ⊗ w̃) + |β(ξ)*w|²`.
So the curvature decreases on sub-bundles (Griffiths and Nakano seminegativity pass to sub-bundles) and increases on
quotients (Griffiths semipositivity passes to quotients). Moreover, if `t` is the smooth section of `S^⊥` lifting a
holomorphic section of `Q`, then `∂̄t = −β*(t)` is an `S`-valued `(0,1)`-form.

(b) (*flat bundles with an indefinite form*) Let `V` be a holomorphic vector bundle with a flat connection `∇`,
`∇^{0,1} = ∂̄_V`, and a `∇`-parallel nondegenerate hermitian form `k`; let `S ⊂ V` be a holomorphic sub-bundle on which `k`
is positive definite and whose `k`-orthogonal `S^{⊥k}` is a complement on which `k` is negative definite. Give `S` the
metric `k|_S` and `S^{⊥k}` the metric `−k`, and let `σ = Σ_jσ_jdz_j`, `σ(s) = ` the `S^{⊥k}`-component of `∇s`. Then
`Θ_S = −σ* ∧ σ`: `θ_S(ξ ⊗ v) = |σ(ξ)v|²` and `θ_S(u) = |Σ_jσ_ju_j|²`, so `S` is Nakano semipositive (the curvature of the
top piece of a polarised variation of Hodge structure, `σ` its Kodaira–Spencer map).

(c) (*Skoda's inequality*) Let `E = O^p` on an open set of `ℂ^n` with the standard flat metric, `g = (g_1, …, g_p)`
holomorphic without common zero, `|g|² = Σ_l|g_l|²`, `S = ker(g : O^p → O)` with the induced metric (its orthogonal is
spanned by `ḡ = (ḡ_1, …, ḡ_p)`), and `q = min(n, p − 1)`. Then for every `u = Σ_j ∂/∂z_j ⊗ u_j ∈ T^{1,0} ⊗ S`,
`|Σ_jβ_ju_j|² ≤ q·Σ_{j,k}(∂_j∂̄_k log|g|²)⟨u_j, u_k⟩`, i.e. `θ_S(u) ≥ −q·Σ_{j,k}(∂_j∂̄_k log|g|²)⟨u_j, u_k⟩`; equivalently,
for every `S`-valued `(n,1)`-form `u` and every hermitian `ω`, `⟨[iΘ_S, Λ_ω]u, u⟩ ≥ −q·⟨[i∂∂̄log|g|², Λ_ω]u, u⟩`. For
every `n` and `p` the factor `q` cannot be lowered, and for `n = 1`, `p = 2` the inequality is an equality.

*Route.* (a) For a holomorphic section `s` of `S` (a holomorphic section of `E`), `D′_E s = D′_S s + βs` with
`D′_S s = π_S D′_E s`, the two terms orthogonal, and `∂_j∂̄_k|s|² = ⟨D′_js, D′_ks⟩ − ⟨Θ_{jk̄}s, s⟩` both in `E` and in `S`;
subtracting gives the Griffiths form of `S`. For the blocks: `β` is of type `(1,0)` because `∂̄s ∈ S`; for a section `t` of
`S^⊥`, `⟨D_Et, s⟩ = −⟨t, βs⟩` gives the block `−β*`; squaring the block matrix gives the diagonal blocks of `Θ_E`; and
`(β* ∧ β)_{jk̄} = −β_k*β_j`, `(β ∧ β*)_{jk̄} = β_jβ_k*` give the three formulas. If `t` lifts a holomorphic section of
`Q`, the `(0,1)`-part of `D_Et` is `∂̄t`, with `S`-component `−β*(t)` and `Q`-component `∂̄_Q` of that section, `0`.
(b) The same block decomposition of `∇` in `V = S ⊕ S^{⊥k}`: `π_S∇` is the Chern connection of `(S, k|_S)` (it preserves
`k` and its `(0,1)`-part is `∂̄_S`), the block from `S^{⊥k}` to `S` is the `k`-adjoint of `−σ`, which is `+σ*` since `k` is
`−1` times the metric on `S^{⊥k}`, and `∇² = 0` gives `Θ_S = −σ* ∧ σ`. (c) Write `a_j = ∂g/∂z_j ∈ ℂ^p`, `x·y = Σ_lx_ly_l`,
and `P` for the orthogonal projection of `ℂ^p` onto the orthogonal of the vector `g(z)`. Differentiating `Σ_lg_ls_l = 0`
gives `β_ju = −(a_j·u)ḡ/|g|²` for `u ∈ S`, and `a_j·u = b_j·u` with `b_j = Pa_j`; a direct computation gives
`∂_j∂̄_k log|g|² = ⟨b_j, b_k⟩/|g|²`. The vectors `b̄_j` lie in `S`, and the endomorphism `M = Σ_j⟨·, b̄_j⟩u_j` of `S_z` has
trace `Σ_jb_j·u_j`, squared Hilbert–Schmidt norm `Σ_{j,k}⟨b_j, b_k⟩⟨u_j, u_k⟩`, and rank `r ≤ min(n, dim S_z) = q`. For an
endomorphism of rank `r`, `|tr M|² = |⟨M, π⟩_{HS}|² ≤ r·‖M‖²_{HS}` with `π` the orthogonal projection onto the image of `M`
(Cauchy–Schwarz). So `|Σ_jβ_ju_j|² = |tr M|²/|g|² ≤ q‖M‖²_{HS}/|g|²`, which is the claim. Equality: when the `b̄_j` are
orthonormal (possible at a point for suitable `g`), `u_j = b̄_j` makes `M` the projection onto their span, of rank `q` if
there are `q` of them; for `n = 1`, `p = 2`, `S_z` is a line and `M` a scalar.

*Needs:* ComplexKahlerGeometry K4 (Chern connections and curvature of hermitian holomorphic bundles), K6.0 (the
curvature operator `[iΘ, Λ]` on `(n,1)`-forms).

**Checks.**

- `S = O(−1) ⊂ ℂ² ⊗ O` over `ℙ¹` with the flat metric: `θ_S = −|β|² < 0` and `θ_Q = |β*|² > 0` for `Q = O(1)`; the
  induced metric on `O(−1)` and the quotient metric on `O(1)` are the Fubini–Study metrics, with curvature forms of
  opposite signs. A formula with `+|β|²` for the sub-bundle would make `O(−1)` positive.
- (c) for `n = 1`, `p = 2`: `S` is spanned by `(−g_2, g_1)` and `iΘ_S = −i∂∂̄log|g|²` (as for `O(−1)`), so
  `θ_S = −Σ(∂∂̄log|g|²)|u|²`: equality with `q = 1`. For `p ≥ 2` and `n ≥ p − 1` the factor `q = p − 1` cannot be
  lowered (`M = id`); the inequality with `q` replaced by `1` fails for `n = p − 1 = 2`, `g = (1, z_1, z_2)` at `0`, where
  `b_1, b_2` are the coordinate vectors `e_2, e_3` and `u_1 = e_2`, `u_2 = e_3` give `|tr M|² = 4 = 2·‖M‖²_{HS}`.
- For the quotient `Q = O^p/S ≅ O` (via `g`), the quotient metric is `|g|^{−2}` and `θ_Q = |β*|² = ` the Levi form of
  `log|g|²`, positive as (a) requires.

### 3.3 Complete Kähler metrics off analytic sets

Prove: (a) if `(X, ω)` is a weakly pseudoconvex Kähler manifold and `Z ⊂ X` a closed analytic subset, then `X ∖ Z`
carries a complete Kähler metric `ω̂ ≥ ω`; `X` itself carries a complete Kähler metric `≥ ω`; (b) if `X` carries a
complete Kähler metric, `ω` is any Kähler form on `X` and `Z ⊂ X` is a compact analytic subset, then `X ∖ Z` carries a
complete Kähler metric `≥ ω`. (b) is what applies to complements `X̄ ∖ D` of divisors with their Poincaré-type metrics
(5.5), which need not be weakly pseudoconvex (second Check).

*Route.* (a) With a smooth plurisubharmonic exhaustion `ψ`, `ω + i∂∂̄χ(ψ)` for a fast-increasing convex `χ` is
complete (RealAnalyticGeometry R3.1's construction). Near `Z`, with local generators `g_j` of its ideal glued by
a partition of unity into a function `|g|²` with `log|g|²` quasi-plurisubharmonic and `|g| < e^{−1}`, add
`−ε·i∂∂̄ log(−log|g|²)` on each relatively compact sublevel set and patch with `χ(ψ)`; the added form dominates
`i∂ log(−log|g|²) ∧ ∂̄ log(−log|g|²)`, which gives infinite length to paths reaching `Z`. (b) Let `ω̂` be complete Kähler;
replacing it by `ω̂ + ω` we may assume `ω̂ ≥ ω`. Cover the compact `Z` by finitely many charts, glue local generators of
its ideal into `|g|²` as in (a) on a neighbourhood `W` of `Z`, with `|g| < e^{−1}` on `W` and `i∂∂̄log|g|² ≥ −Aω̂` there,
and let `χ` be a cut-off equal to `1` near `Z` with compact support in `W`. With `ℓ = −log|g|²`,
`i∂∂̄(−log ℓ) = i∂∂̄log|g|²/ℓ + i∂ℓ ∧ ∂̄ℓ/ℓ² ≥ −Aω̂ + i∂log ℓ ∧ ∂̄log ℓ`, and the terms of `i∂∂̄(χ·(−log ℓ))` containing
derivatives of `χ` live on a compact subset of `W ∖ Z`, where they are bounded; so for a large constant `C`,
`Cω̂ + i∂∂̄(χ·(−log ℓ)) ≥ ω̂ + χ·i∂log ℓ ∧ ∂̄log ℓ` on `X ∖ Z`. A path of finite length for this metric that leaves every
compact subset of `X ∖ Z` cannot leave every compact subset of `X` (`ω̂` is complete), and cannot accumulate at `Z`,
since `log ℓ → ∞` at `Z` while its variation along the path is bounded by a multiple of the length.

*Needs:* 2.2; RealAnalyticGeometry R3.1; ComplexComparisonPartII C1.5; ComplexKahlerGeometry K3.

**Checks.**

- `X = Δ` the unit disc, `Z = {0}`: `i dz ∧ dz̄/(|z|² log²|z|²)` near `0` gives the punctured disc infinite
  radial length `∫ dr/(r|log r²|) = ∞`.
- `X = ℙ² ∖ {pt}` (the complement of the exceptional curve in the blow-up of `ℙ²` at a point) carries a complete Kähler
  metric, by (b) with `ℙ²`, its Fubini–Study form and `Z = {pt}`, but no plurisubharmonic exhaustion: a plurisubharmonic
  function on `X` is constant on every line `ℓ ≅ ℙ¹` missing the point (its restriction is plurisubharmonic by 0.3(d) and
  attains its maximum on the compact `ℓ`, so it is constant by the maximum principle 0.2(b)), and any two points of `X`
  lie on two such lines that meet in `X`, so it is constant. (a) does not apply to `X`; (b) applied to `X` gives complete
  Kähler metrics on `X ∖ {x}` for every point `x`.

### 3.4 Extension of ∂̄-equations across analytic sets

Prove: if `Z` is a closed analytic subset of a complex manifold `X`, nowhere dense, and `u`, `g` are forms with
`L²_loc` coefficients on `X` with `∂̄u = g` on `X ∖ Z` in the sense of distributions, then `∂̄u = g` on `X`. In
particular an `L²_loc` function holomorphic on `X ∖ Z` is holomorphic on `X`.

*Route.* Locally `Z ⊂ V(g)` for a holomorphic `g ≢ 0` with `|g| < e^{−1}`. The cut-off functions
`θ_k = ρ(k^{−1}·log log(1/|g|²))`, with `ρ` smooth, `ρ = 1` on `(−∞, 1]` and `ρ = 0` on `[2, ∞)`, equal `1` off a
neighbourhood of `V(g)` shrinking with `k`, and `‖∂̄θ_k‖_{L²}` tends to zero on compacts (real codimension two).
Test `∂̄u = g` against `θ_kη`; the error `∫ u ∧ ∂̄θ_k ∧ η` tends to zero by Cauchy–Schwarz.

*Needs:* ComplexKahlerGeometry K3, K5a (local `L²` distributions); ComplexComparisonPartII C5.4.

### 3.5 Estimates for weights smooth off an analytic set

Prove: let `(X, ω)` be Kähler, `Z ⊂ X` a nowhere dense closed analytic subset such that `X ∖ Z` carries a complete
Kähler metric (by 3.3, for instance: `X` weakly pseudoconvex and `Z` arbitrary, or `X` carrying a complete Kähler metric
and `Z` compact), and `h` a singular metric on `L` that is smooth on `X ∖ Z`, with quasi-plurisubharmonic weights and
`iΘ_h(L) ≥ εω` on `X ∖ Z` (`ε > 0` constant). Then the conclusion of the first headline holds: for `q ≥ 1`,
every `∂̄`-closed `L`-valued `(n,q)`-form `g` on `X` with `∫|g|²_{h,ω}dV_ω < ∞` is `∂̄u` with
`∫|u|²_{h,ω}dV_ω ≤ (1/(qε))∫|g|²_{h,ω}dV_ω`. This is the form of the estimate due to Demailly in which the existence of
a complete Kähler metric off `Z`, not the weak pseudoconvexity of `X`, is what is used.

*Route.* Let `ω̂` be a complete Kähler metric on `X ∖ Z`. Use the complete Kähler metrics `ω̂_δ = ω + δω̂` (`δ > 0`), to which
ComplexComparisonPartII C1.4 applies. For `L`-valued `(n,q)`-forms, `|g|²_{ω̂_δ}dV_{ω̂_δ} ≤ |g|²_ω dV_ω` and the
curvature term `⟨[iΘ_h, Λ_{ω̂_δ}]^{−1}g, g⟩dV_{ω̂_δ}` is bounded by `(1/(qε))|g|²_ω dV_ω` because `iΘ_h ≥ εω`
(the monotonicity in the metric used in 3.1); the solutions are bounded uniformly in `δ`, and a weak limit as
`δ → 0` solves the equation on `X ∖ Z` with the bound for `ω`. 3.4 extends `∂̄u = g` across `Z`: the weights are
bounded above, so finite weighted `L²` norm implies `L²_loc`.

*Needs:* 2.1–2.2, 3.1, 3.3, 3.4; ComplexComparisonPartII C1.4.

**Checks.**

- `X = ℙ² ∖ {pt}` (3.3's second Check) with the complete Kähler metric of 3.3(b), `Z = ∅`: the hypothesis holds although
  `X` is not weakly pseudoconvex. A statement with "weakly pseudoconvex" in its hypothesis would not apply to
  complements of divisors with Poincaré-type metrics in general.

### 3.6 Bergman spaces and Bergman kernels

Define, for a complex manifold `X`, a line bundle `L` with a singular metric `h` whose local weights are locally
essentially bounded above (for instance quasi-plurisubharmonic weights), and a smooth positive volume form
`dV` (or, for `(n,0)`-forms, no volume form), the Bergman space `H⁰_{(2)}(X, L; h, dV)` of holomorphic sections
with `‖s‖² = ∫|s|²_h dV < ∞`; it depends only on the almost-everywhere classes of the weights. The Bergman density uses
pointwise values of the weights: for `h` with quasi-plurisubharmonic weights, their canonical representatives (2.1), and
in general a choice of weights as functions, locally bounded above, which is part of the data. Then
`B_{h,dV}(x) = sup{|s(x)|²_h : ‖s‖ ≤ 1} ∈ [0, ∞]` at points where the weight is finite; in a frame `e` with weight `φ`,
`B_{h,dV}(x) = e^{−φ(x)}·sup{|f(x)|² : s = fe, ‖s‖ ≤ 1}`, and the supremum, the unweighted evaluation kernel in the frame, does
not depend on the representative. Prove: the Bergman space is a separable Hilbert space and, in a frame `e`, the
evaluation `s = fe ↦ f(x)` is continuous at every `x`; `B(x) = Σ_j|s_j(x)|²_h` for any orthonormal basis; the Bergman
kernel `K(x, y) = Σ_j s_j(x) ⊗ s_j(y)*` reproduces sections; `B` is unchanged if `h` is multiplied by a positive constant
and divided by `c` if `dV` is multiplied by `c`; for `U ⊂ V` open, `B_U ≥ B_V` on `U`; `∫_X B dV = dim H⁰_{(2)}` when finite
(for the canonical representatives, or any representatives: they differ on a null set).

*Route.* For `s = fe` on a small ball `B` around `x`, the sub-mean-value inequality for `|f|²` (0.2(a)) and the
essential upper bound of the weight on `B` give `|f(x)|² ≤ C·e^{ess sup_B φ}‖s‖²`; this gives continuity of evaluation and
completeness (locally uniform limits of holomorphic sections are holomorphic). The rest is Hilbert-space theory
(Mathlib's `HilbertBasis`, `InnerProductSpace`).

*Needs:* 0.2; 2.1; Mathlib `HilbertBasis`, `MeasureTheory.Lp`.

**Checks.**

- The unit disc with the trivial bundle, `h = 1`, Lebesgue measure: `B(z) = 1/(π(1 − |z|²)²)`, `B(0) = 1/π`.
- `O(k)`, `k ≥ 0`, on `ℙ¹` with the Fubini–Study metric and `dV = ω_FS` (total mass one): `B ≡ k + 1`, by homogeneity
  and `∫B dV = h⁰(O(k)) = k + 1`. For `k < 0` there are no sections and `B ≡ 0` (not `k + 1`, which is negative for
  `k ≤ −2`).

### 3.7 The sub-mean-value inequality and the comparison of sup and L² norms

Prove: (a) let `f` be holomorphic on the ball `B(a, r) ⊂ ℂ^n`, `A ≥ 0`, and `φ` a function on `B(a, r)` such that
`A|z − a|² − φ` is plurisubharmonic (for instance `φ` of class `C²` with `i∂∂̄φ ≤ A·i∂∂̄|z|²`); then
`|f(a)|²e^{−φ(a)} ≤ (n!/(π^n r^{2n}))·e^{Ar²}·∫_{B(a,r)}|f|²e^{−φ}dλ`. (If the hypothesis holds for some `A < 0`, it holds
for `A = 0`.) (b) Let `(X, ω)` be hermitian, `L` with a
smooth metric `h` with `iΘ_h(L) ≤ A·ω` for some `A ≥ 0`, and `F : B(0, r) → X` a holomorphic local biholomorphism with
`F(0) = x`, `c·ω_eucl ≤ F*ω ≤ c′·ω_eucl`, and every point of `X` having at most `M` preimages. Then for every
`s ∈ H⁰_{(2)}(X, L; h, dV_ω)`, `|s(x)|²_h ≤ (n!/(π^n r^{2n}))·e^{Ac′r²}·(M/c^n)·‖s‖²`. (c) In particular, for
`X` compact and `h` smooth, `B_{h^k, dV}(x) ≤ C·k^n` for all `k ≥ 1` and `x`, with `C` depending on `(X, h, dV)`.
(d) (weighted mean value) For `f` holomorphic on a neighbourhood of the closed ball `|w| ≤ R` in `ℂ^n` and real
`λ_1, …, λ_n` of any signs, `|f(0)|²·∫_{|w|<R}e^{−Σ_jλ_j|w_j|²}dλ ≤ ∫_{|w|<R}|f|²e^{−Σ_jλ_j|w_j|²}dλ`.

*Route.* (a) `log|f|² − φ + A|z − a|²` is plurisubharmonic, so its exponential `|f|²e^{−φ+A|z−a|²}` is
plurisubharmonic and satisfies the sub-mean-value inequality over the ball (0.2(a)); bound `e^{A|z−a|²}` by
`e^{Ar²}`, which uses `A ≥ 0`. For `A < 0`, `0·|z − a|² − φ` is the sum of `A|z − a|² − φ` and the plurisubharmonic
`−A|z − a|²`. (b) Pull back `L` and `s` by `F`; choose a frame of `F*L` on the ball with weight `φ̃`,
`i∂∂̄φ̃ = F*iΘ_h ≤ A·F*ω ≤ Ac′·i∂∂̄|w|²` (`A ≥ 0`); apply (a) and the area formula for `F`. (c) Holomorphic normal coordinates of
radius `r = k^{−1/2}` with `M = 1`. (d) Average over the torus action `w_j ↦ e^{iθ_j}w_j`, which preserves the ball and
the weight: for `f = Σ_α a_αw^α`, the torus mean of `|f|²` at `w` is `Σ_α|a_α|²|w^α|² ≥ |a_0|² = |f(0)|²`; integrate
against the weight over the ball.

*Needs:* 0.1–0.2; 2.1; ComplexKahlerGeometry §3.1 (K3.0).

**Checks.**

- `n = 1`, `φ = 0`, `f ≡ 1`: equality `1 = (1/(πr²))·πr²`.
- The sign condition `A ≥ 0` in (a): on the unit disc, `f ≡ 1` and `φ = −|z|²` satisfy the hypothesis with `A = −1`
  (`A|z|² − φ = 0`), but `(1/π)·e^{−1}·∫_{|z|<1}e^{|z|²}dλ = 1 − e^{−1} < 1 = |f(0)|²e^{−φ(0)}`; with `A = 0` the bound is
  `e − 1 ≥ 1`.
- (d) against (a): for `n = 1`, `λ_1 = A = 1`, `R` large, (d) gives `|f(0)|² ≤ π^{−1}(1 + o(1))∫|f|²e^{−|w|²}`, the Fock
  value, while (a) with the best `R` gives only the constant `e/π` (minimum of `e^{R²}/(πR²)` at `R = 1`).
- A complex torus `ℂ^g/Λ` with the theta line bundle metric `e^{−π H(z,z)}`-type weight
  `φ = |z|²` (curvature `i∂∂̄|z|²`, `A = 1`) and a lattice whose nonzero vectors have length `≥ 2r`: the
  ball `B(z, r)` injects into the torus (`M = 1`), and (a) bounds `|θ(z)|²e^{−|z|²}` by
  `(g!/(π^g r^{2g}))e^{r²}` times the `L²` norm over a fundamental domain.

### 3.8 Hörmander's estimate with the norm measured by the curvature

For a real `(1,1)`-form `θ = Σ_{j,k} θ_{jk̄} i dz_j ∧ dz̄_k ≥ 0` at a point of an open set of `ℂ^n` and a `(0,1)`-covector
`v = Σ_k v_k dz̄_k` there, put `|v|²_θ = sup_{ξ≠0} |Σ_k v_kξ̄_k|²/Σ_{j,k}θ_{jk̄}ξ_jξ̄_k ∈ [0, ∞]` (with `0/0 = 0` and
`c/0 = ∞` for `c > 0`): the least `H` with `i·v̄ ∧ v ≤ H·θ`. For `θ = i∂∂̄|z|²` it is the norm of 3.1.

Prove: let `Ω ⊂ ℂ^n` be pseudoconvex and `φ` plurisubharmonic of class `C²` on `Ω`. For every `(0,1)`-form `v` with
`L²_loc` coefficients, `∂̄v = 0` and `∫_Ω|v|²_{i∂∂̄φ}e^{−φ}dλ < ∞`, there is `u` with `∂̄u = v` and
`∫_Ω|u|²e^{−φ}dλ ≤ ∫_Ω|v|²_{i∂∂̄φ}e^{−φ}dλ`; the solution of least norm in `L²(Ω, e^{−φ}dλ)` is one. This is Hörmander's
theorem in the form with the datum measured by the Levi form of the weight; it needs no lower bound for `i∂∂̄φ`, only the
finiteness of the right side. The same holds, with the same proof, on a Stein Riemann domain `Ω → ℂ^n` (a Stein manifold
with a local biholomorphism to `ℂ^n`), the coordinates and `dλ` being pulled back.

*Route.* As for 3.1, with one more approximation because the supplier needs smooth data. On a relatively compact
pseudoconvex `Ω_k ⋐ Ω` with a smooth strictly plurisubharmonic exhaustion, replace `φ` on a neighbourhood of `Ω̄_k` by its
convolutions `φ^{(η)} = φ ∗ ρ_η` (0.3(a); on a Stein Riemann domain the local convolution in the pulled-back coordinates,
with `η` uniform on the compact `Ω̄_k`): they are smooth and plurisubharmonic and, `φ` being of class `C²`, converge to `φ`
in `C²(Ω̄_k)` as `η → 0`. This is the only place where the hypothesis `C²` is used. Take the weight
`φ_ε = φ^{(η)} + ε|z|²`, whose Levi form is `≥ ε·i∂∂̄|z|²`, the `(n,1)`-form `v ∧ dz₁ ∧ ⋯ ∧ dz_n`, and the smooth complete
Kähler metrics `ω_δ = i∂∂̄φ_ε + δω̂_k` (`ω̂_k` complete on `Ω_k`, ComplexComparisonPartII C1.5). For `(n,1)`-forms the
curvature term `⟨[i∂∂̄φ_ε, Λ_ω]^{−1}g, g⟩dV_ω` is nonincreasing in `ω`, and at `ω = i∂∂̄φ_ε`, where `[i∂∂̄φ_ε, Λ_ω]` is the
identity on `(n,1)`-forms, it is `|v|²_{i∂∂̄φ_ε}` times the factor `2^n dλ` that `|u|²dV_ω` carries on `(n,0)`-forms for
every `ω`. ComplexComparisonPartII C1.4 gives `∫_{Ω_k}|u|²e^{−φ_ε} ≤ ∫_{Ω_k}|v|²_{i∂∂̄φ_ε}e^{−φ_ε}`. As `η → 0` the forms
`i∂∂̄φ_ε`, all `≥ ε·i∂∂̄|z|²`, converge uniformly on `Ω̄_k` to `i∂∂̄(φ + ε|z|²)`, so
`|v|²_{i∂∂̄φ_ε} ≤ (1 + o(1))·|v|²_{i∂∂̄(φ+ε|z|²)} ≤ (1 + o(1))·|v|²_{i∂∂̄φ}` with `o(1)` uniform on `Ω̄_k` (the dual norm
decreases when the form increases), and `e^{−φ_ε} → e^{−φ−ε|z|²} ≤ e^{−φ}` uniformly; weak limits as `δ → 0`, `η → 0`, `k → ∞` and `ε → 0` give the solution on `Ω`.

*Needs:* 0.1, 0.3; 3.1; ComplexComparisonPartII C1.4, C1.5; RealAnalyticGeometry R3.1.

**Checks.**

- `Ω = ℂ`, `φ = |z|²`, `v = dz̄`: `|v|²_{i∂∂̄φ} = 1`, the least solution is `z̄`, and `∫|z̄|²e^{−|z|²} = π = ∫e^{−|z|²}`:
  equality.
- If `i∂∂̄φ ≥ c·i∂∂̄|z|²`, then `|v|²_{i∂∂̄φ} ≤ c^{−1}|v|²`, and 3.8 gives 3.1(b) for `(0,1)`-forms. The converse fails: for
  `φ = |z₁|² + |z₂|⁴` on `ℂ²` no such `c` exists, but for `v = ∂̄χ` with `χ` smooth and compactly supported in `{z₂ ≠ 0}`
  the right side of 3.8 is finite.

### 3.8a The solution of least norm against a second weight of bounded gradient

Prove: let `Ω ⊂ ℂ^n` be pseudoconvex (an open set with a continuous plurisubharmonic exhaustion, as in 3.1) and `Ψ`, `ρ`
plurisubharmonic of class `C²` on `Ω`. For a `(0,1)`-form `v` with `L²_loc` coefficients and `∂̄v = 0` such that `∂̄u = v` has a
solution in `L²(Ω, e^{−Ψ}dλ)` (by 3.8, for instance when `∫_Ω|v|²_{i∂∂̄Ψ}e^{−Ψ}dλ < ∞`), let `u₀` be the solution of least norm
there. Norms of `(0,1)`-forms are those of 3.8.

(a) Let `s ≥ 0` and `κ_s ≥ 0` with `s²κ_s < 1` and `|∂̄ρ|²_{i∂∂̄(Ψ+sρ)} ≤ κ_s` on `Ω`. If `ρ` is bounded above or below, or if
`∫_Ω|v|²_{i∂∂̄Ψ}(1 + e^{sρ})e^{−Ψ}dλ < ∞`, then
`∫_Ω|u₀|²e^{sρ−Ψ}dλ ≤ (1 − s√κ_s)^{−2}·∫_Ω|v|²_{i∂∂̄(Ψ+sρ)}e^{sρ−Ψ}dλ` (the right side may be infinite). Two cases:
(i) (*gradient measured by the first weight*) if `|∂̄ρ|²_{i∂∂̄Ψ} ≤ κ` on `Ω` (equivalently `|∂ρ(ξ)|² ≤ κ·i∂∂̄Ψ(ξ, ξ̄)` for all
`ξ`), `s²κ < 1` and `∫_Ω|v|²_{i∂∂̄Ψ}e^{−Ψ}dλ < ∞`, then `∫_Ω|u₀|²e^{sρ−Ψ}dλ ≤ (1 − s√κ)^{−2}·∫_Ω|v|²_{i∂∂̄Ψ}e^{sρ−Ψ}dλ`;
(ii) (*gradient measured by the second weight*) if `ρ` is bounded below and `|∂̄ρ|²_{i∂∂̄ρ} ≤ 1` on `Ω`, then for `0 < s < 1`,
`∫_Ω|u₀|²e^{sρ−Ψ}dλ ≤ (s(1 − √s)²)^{−1}·∫_Ω|v|²_{i∂∂̄ρ}e^{sρ−Ψ}dλ`.

(b) (*dual form*) Let `b ≥ 0` with `b²κ < 1`, and here let `ρ` be any real function of class `C²` with `|∂̄ρ|²_{i∂∂̄Ψ} ≤ κ`. If
`f` is holomorphic on `Ω` with `∫_Ω|f|²e^{−2bρ−Ψ}dλ < ∞` and `∫_Ω F·f̄·e^{−bρ−Ψ}dλ = 0` for every holomorphic `F` with
`∫_Ω|F|²e^{−Ψ}dλ < ∞`, then `f = 0`. The same holds when `Ψ` is plurisubharmonic of class `C²` only on `Ω ∖ Z`, `Z` the zero set
of a holomorphic function that is `≢ 0` on every component of `Ω`, and locally bounded above near `Z` (the hypothesis on `ρ`
then on `Ω ∖ Z`).

This is an estimate of the type of Donnelly–Fefferman and Berndtsson; case (ii), with the gradient of `ρ` measured by its
own Levi form, has the shape of Berndtsson's estimate, with the constant that this route gives. In applications of (b),
`Ψ = Φ − bρ` for a weight `Φ` with `i∂∂̄Φ ≥ m·i∂∂̄ρ` and a potential `ρ` with `|∂ρ|² ≤ C·i∂∂̄ρ`; then `κ = C/(m − b)` and `b²κ < 1`
is the margin `m > b²C + b`.

*Route.* (a) *Case `ρ` bounded above.* Put `Φ = Ψ + sρ`, plurisubharmonic of class `C²`, and `w = u₀e^{sρ}`. Then
`w ∈ L²(e^{−Φ})` and, for holomorphic `h ∈ L²(e^{−Φ})` (which lies in `L²(e^{−Ψ})` as `e^{−Ψ} ≤ e^{s·sup ρ}e^{−Φ}`),
`∫w h̄ e^{−Φ} = ∫u₀h̄e^{−Ψ} = 0`; so `w` is the solution of least norm in `L²(e^{−Φ})` of `∂̄w = e^{sρ}(v + s·u₀∂̄ρ)`. With
`A² = ∫|u₀|²e^{sρ−Ψ}`, finite as `ρ` is bounded above, and `V² = ∫|v|²_{i∂∂̄Φ}e^{sρ−Ψ}` (assume `V < ∞`), 3.8 for the weight `Φ`
and the triangle inequality in `L²(e^{sρ−Ψ})` give
`A² = ∫|w|²e^{−Φ} ≤ ∫|v + s·u₀∂̄ρ|²_{i∂∂̄Φ}e^{sρ−Ψ} ≤ (V + s√κ_s·A)²`, hence `A(1 − s√κ_s) ≤ V`. *Case `ρ` bounded below.* The
sets `Ω_N = {ρ < N}` are pseudoconvex (if `e` is a continuous plurisubharmonic exhaustion of `Ω`, `max(e, −log(N − ρ))` is one
of `Ω_N`, by 0.1) and `ρ ≤ N` there; let `u_N` be the solution of least norm on `Ω_N` (one exists: `u₀|_{Ω_N}`). By the first
case `∫_{Ω_N}|u_N|²e^{sρ−Ψ} ≤ (1 − s√κ_s)^{−2}V²`, and since `ρ ≥ −c` the `u_N` (extended by `0`) are bounded in
`L²(Ω, e^{−Ψ})`. A weak limit `ũ` solves `∂̄ũ = v` on every `Ω_M`, hence on `Ω`, and is orthogonal to every holomorphic
`h ∈ L²(Ω, e^{−Ψ})` (each `u_N` is orthogonal to `h|_{Ω_N}`), so `ũ = u₀`; lower semicontinuity of the norm of
`L²(Ω_M, e^{sρ−Ψ})` and `M → ∞` give the bound. *General `ρ`.* Replace `ρ` by `ρ_N = M_1(ρ, −N)`, `M_1` a regularised maximum
(smooth, convex, nondecreasing in each variable, `∂_1M_1 + ∂_2M_1 = 1`, `max ≤ M_1 ≤ max + 1`, equal to `max` when the
arguments differ by at least `1`): `ρ_N` is plurisubharmonic of class `C²` and bounded below, decreases to `ρ`, and equals `ρ`
where `ρ > −N + 1`. With `θ = ∂_1M_1(ρ, −N) ∈ [0, 1]`, `∂̄ρ_N = θ∂̄ρ` and `i∂∂̄ρ_N ≥ θ·i∂∂̄ρ`; as
`θ²(i∂∂̄Ψ + s·i∂∂̄ρ) ≤ i∂∂̄Ψ + sθ·i∂∂̄ρ ≤ i∂∂̄(Ψ + sρ_N)`, `|∂̄ρ_N|²_{i∂∂̄(Ψ+sρ_N)} ≤ |∂̄ρ|²_{i∂∂̄(Ψ+sρ)} ≤ κ_s`. The minimal solution `u₀`
does not depend on `ρ`; apply the second case to `ρ_N` and let `N → ∞`: Fatou's lemma on the left, and on the right dominated
convergence, the integrands being eventually equal to the limit and bounded by `e^s·|v|²_{i∂∂̄Ψ}(1 + e^{sρ})e^{−Ψ}`.
(i) `i∂∂̄(Ψ + sρ) ≥ i∂∂̄Ψ`, so `κ_s = κ` will do and `|v|_{i∂∂̄(Ψ+sρ)} ≤ |v|_{i∂∂̄Ψ}` (the dual norm decreases when the form
increases); if the right side of (i) is finite, the last hypothesis of (a) holds. (ii) `i∂∂̄(Ψ + sρ) ≥ s·i∂∂̄ρ`, so
`|∂̄ρ|²_{i∂∂̄(Ψ+sρ)} ≤ s^{−1}` (`κ_s = 1/s`, `s²κ_s = s < 1`, `1 − s√κ_s = 1 − √s`) and `|v|²_{i∂∂̄(Ψ+sρ)} ≤ s^{−1}|v|²_{i∂∂̄ρ}`. (b)
`G = f·e^{−bρ}` lies in `L²(e^{−Ψ})` and is orthogonal there to the holomorphic functions, so it is the solution of least
norm of `∂̄G = −b·G·∂̄ρ`. 3.8 gives `∫|G|²e^{−Ψ} ≤ b²∫|G|²|∂̄ρ|²_{i∂∂̄Ψ}e^{−Ψ} ≤ b²κ∫|G|²e^{−Ψ}`, so `G = 0` since `b²κ < 1`. If `Ψ`
is `C²` only off `Z = {g = 0}`, argue on `Ω ∖ Z`, which is pseudoconvex (`max(e, −log|g|²)` is an exhaustion): a holomorphic
`F` on `Ω ∖ Z` with `∫_{Ω∖Z}|F|²e^{−Ψ} < ∞` is `L²_loc` near `Z`, where `Ψ` is locally bounded above, so it extends
holomorphically to `Ω` (3.4); hence the orthogonality on `Ω` is the orthogonality on `Ω ∖ Z`, and `f = 0` there.

*Needs:* 0.1; 3.4, 3.8.

**Checks.**

- `s = 0` in (a) is the bound of 3.8 for the solution of least norm.
- `Ω = ℂ`, `Ψ = |z|²`, `ρ = az + āz̄` (harmonic, `κ = |a|²`), `v = dz̄`: the least solution is `z̄`, and completing the square
  (`sρ − |z|² = −|z − sā|² + s²κ`) gives the left side `πe^{s²κ}(1 + s²κ)` against the right side `πe^{s²κ}(1 − s√κ)^{−2}` of (i);
  `(1 + x²)(1 − x)² ≤ 1` for `0 ≤ x < 1`.
- (ii) on the unit disc with `ρ = −log(1 − |z|²)` (`|∂̄ρ|²_{i∂∂̄ρ} = |z|² ≤ 1`, `ρ ≥ 0`), `Ψ = 0`, `v = dz̄`: here
  `|v|²_{i∂∂̄Ψ} = ∞`, but `z̄` is a solution in `L²` and the least one; the left side is `π/((1 − s)(2 − s))` and the right side
  `π/(s(1 − √s)²(3 − s))`. A statement of (a) only with the gradient measured by `i∂∂̄Ψ` would say nothing here.

### 3.9 Interpolation of jets on a discrete common zero set

Prove: let `Ω ⊂ ℂ^n` be pseudoconvex, `φ` plurisubharmonic of class `C²` on `Ω`, `g_1, …, g_N` holomorphic on `Ω` with
discrete common zero set `Z`, `|g|² = Σ_j|g_j|²`, and `s ≥ 0` an integer. Let `Z₀ ⊂ Z` be finite and, for `z ∈ Z₀`, let
`P_z` be a polynomial and `χ_z` a smooth function with compact support, equal to `1` near `z`, the supports pairwise
disjoint and each meeting `Z` only at `z`; put `F₀ = Σ_{z∈Z₀} χ_zP_z`. If the right side of the first inequality below is
finite, there is a holomorphic `F` on `Ω` whose jet of order `s` at `z` is that of `P_z` for `z ∈ Z₀` and is zero for
`z ∈ Z ∖ Z₀`, with

`∫_Ω|F − F₀|²e^{−φ}|g|^{−2(n+s)}dλ ≤ ∫_Ω|∂̄F₀|²_{i∂∂̄Φ}e^{−φ}|g|^{−2(n+s)}dλ`, `Φ = φ + (n + s)·log|g|²`,

and in particular `≤ ∫_Ω|∂̄F₀|²_{i∂∂̄φ}e^{−φ}|g|^{−2(n+s)}dλ`, since `i∂∂̄Φ ≥ i∂∂̄φ` (norms of 3.8). The right sides are integrals
over the supports of the `∂̄χ_z`, which avoid `Z`, so that `Φ` is of class `C²` there; the first is finite when `i∂∂̄Φ` is
positive definite there, which can hold where `i∂∂̄φ` is degenerate. `Z` need not be reduced.

*Route.* On each component of `Ω` choose `k` with `g_k ≢ 0` and put `Ω′ = Ω ∖ {g_k = 0}`; it is pseudoconvex (the maximum
of an exhaustion of `Ω` and `−log|g_k|²` is an exhaustion) and contains no point of `Z`, so `Φ = φ + (n + s)·log|g|²` is of
class `C²` and plurisubharmonic on `Ω′`, with `i∂∂̄Φ ≥ i∂∂̄φ` and hence `|∂̄F₀|²_{i∂∂̄Φ} ≤ |∂̄F₀|²_{i∂∂̄φ}`. 3.8 on `Ω′` with
the weight `Φ` (`e^{−Φ} = e^{−φ}|g|^{−2(n+s)}`) gives `u` with `∂̄u = ∂̄F₀` and the first bound, hence the second. `F = F₀ − u` is holomorphic on `Ω′` and locally square integrable
near `{g_k = 0}` (`e^{−φ}|g|^{−2(n+s)}` is bounded below on compact sets), so it extends holomorphically to `Ω` (3.4), and
`u = F₀ − F` there. Near `z ∈ Z`, `F₀` equals `P_z` or `0`, so `u` is holomorphic there, and `|g(w)| ≤ C|w − z|` gives
`∫|u|²|w − z|^{−2(n+s)}dλ < ∞` near `z`, which forces `u` to vanish to order `≥ s + 1` at `z` by the leading-form argument
of 1.2(c).

*Needs:* 1.2; 3.4, 3.8.

**Checks.**

- `n = 1`, `Ω = ℂ`, `g = z`, `φ = |z|²`, `s = 0`, `Z₀ = {0}`, `P₀ = 1`: the weight `|z|^{−2}e^{−|z|²}` is not integrable at
  `0`, so `F₀ − F` vanishes at `0` and `F(0) = 1`.
- `n = 2`, `g = (z₁, z₂)`, `s = 0`: `|z|^{−4}` is not integrable at `0 ∈ ℂ²` and forces the value; with the exponent
  `n + s − 1 = 1` the weight `|z|^{−2}` is integrable there and imposes nothing. `n + s` is the least exponent that fixes
  the jets of order `s`.

### 3.10 Skoda's division theorem

Prove: let `Ω ⊂ ℂ^n` be pseudoconvex, `φ` plurisubharmonic on `Ω` and not `≡ −∞` on any component, `g = (g_1, …, g_p)`
holomorphic on `Ω` and not all identically zero on any component, `|g|² = Σ_j|g_j|²`, and `q = min(n, p − 1)`.

(a) (*Skoda*) For every real `α > 1` and every holomorphic `f` on `Ω` with `I = ∫_Ω|f|²|g|^{−2(αq+1)}e^{−φ}dλ < ∞` there are
holomorphic `h_1, …, h_p` on `Ω` with `f = Σ_j g_jh_j` and `∫_Ω Σ_j|h_j|²·|g|^{−2αq}e^{−φ}dλ ≤ (α/(α − 1))·I`.

(b) (*Powers of the ideal*) For every real `β > q`, every integer `a ≥ 1` and every holomorphic `f` with
`I_{β,a} = ∫_Ω|f|²|g|^{−2(β+a)}e^{−φ}dλ < ∞` there are holomorphic `h_J`, `J = (j_1, …, j_a) ∈ {1, …, p}^a`, with
`f = Σ_J g_{j_1}⋯g_{j_a}h_J` and `Σ_J ∫_Ω|h_J|²|g|^{−2β}e^{−φ}dλ ≤ ∏_{i=0}^{a−1}((β + i)/(β + i − q))·I_{β,a}`.

(c) (*Division with jets*) Let `p = n`, let the common zero set `Z` of `g_1, …, g_n` be discrete with
`dg_1 ∧ ⋯ ∧ dg_n ≠ 0` at every point of `Z`, and let `φ` be locally bounded near `Z`. For an integer `a ≥ 1` and a
holomorphic `f`, the integral of `|f|²|g|^{−2(a+n−1/2)}e^{−φ}` over a small ball around `z ∈ Z` is finite iff `f` vanishes
to order `≥ a` at `z`. Hence if `J_a(f) = ∫_Ω|f|²|g|^{−2(a+n−1/2)}e^{−φ}dλ < ∞` (which forces `f` to vanish to order `≥ a`
at every point of `Z`, i.e. all its jets of order `< a` along `Z` vanish; given that vanishing, the finiteness is a
condition away from `Z`), then `f = Σ_J g_{j_1}⋯g_{j_a}h_J` with `Σ_J ∫_Ω|h_J|²|g|^{−(2n−1)}e^{−φ}dλ ≤ c(n, a)·J_a(f)`,
`c(n, a) = ∏_{i=0}^{a−1}(i + n − ½)/(i + ½)`.

*Route.* (a) Skoda's proof. Reduce to smooth `φ` by decreasing approximation (0.3(a)) on relatively compact pseudoconvex
`Ω_k ⋐ Ω`, with weak limits as in 3.1, and work on `Ω′ = Ω_k ∖ {g_{l₀} = 0}` for some `g_{l₀} ≢ 0` on each component: `Ω′` is
weakly pseudoconvex, so it carries complete Kähler metrics (3.3(a)), and `g` has no common zero on it. There
`h⁰ = f·ḡ/|g|²` satisfies `Σ_j g_jh⁰_j = f` and `|h⁰|² = |f|²/|g|²`, is pointwise orthogonal to `S = ker(g : O^p → O)`,
and is the lift of the section `f` of the quotient, so `∂̄h⁰ = −β*(h⁰)` is an `S`-valued `(0,1)`-form (3.2a(a)). Give `S`
the induced metric times `e^{−ψ}`, `ψ = φ + αq·log|g|² + ε|z|²` (`ε > 0`; without it the curvature operator below is only
semidefinite, since `i∂∂̄log|g|²` has rank `≤ q`). By Skoda's inequality 3.2a(c) its curvature operator on `S`-valued
`(n,1)`-forms satisfies `B = [iΘ_S + i∂∂̄ψ, Λ] ≥ (α − 1)q·[i∂∂̄log|g|², Λ] + ε` (as `i∂∂̄φ ≥ 0`), and by 3.2a(a), (c),
`|⟨∂̄h⁰, u⟩|² = |⟨h⁰, Σ_jβ_ju_j⟩|² ≤ |h⁰|²·q·⟨[i∂∂̄log|g|², Λ]u, u⟩ ≤ (|h⁰|²/(α − 1))·⟨Bu, u⟩`, hence
`⟨B^{−1}∂̄h⁰, ∂̄h⁰⟩ ≤ |h⁰|²/(α − 1)` pointwise. This bounds the inverse-curvature energy of `∂̄h⁰` by `I/(α − 1)`, but `∂̄h⁰`
need not be square integrable on `Ω′` with the weight of `S` (fourth Check), and 3.2 asks for both. So exhaust `Ω′` by
relatively compact pseudoconvex domains `Ω′_j ⋐ Ω′` (as in 3.1). On `Ω′_j`, `∂̄h⁰` is smooth up to the boundary (`|g| > 0` on
the closure) and the weights are bounded, so `∂̄h⁰ ∈ L²(Ω′_j)` with the weight of `S`; 3.2 (with `η ≡ 1`, as in its Check;
case (b), `Ω′_j` carrying a complete Kähler metric as in 3.1) gives an `S`-valued `v_j` on `Ω′_j` with `∂̄v_j = ∂̄h⁰` and
`∫_{Ω′_j}|v_j|²|g|^{−2αq}e^{−φ−ε|z|²} ≤ (1/(α − 1))∫|h⁰|²|g|^{−2αq}e^{−φ} = I/(α − 1)`, a bound independent of `j`. On each
compact subset of `Ω′` the weight is bounded below, so a diagonal subsequence converges weakly in `L²_loc(Ω′)` to some `v`,
`S`-valued (`Σ_lg_lv_l = 0` is a closed linear condition), with `∂̄v = ∂̄h⁰` on `Ω′` and, by weak lower semicontinuity on each
compact set, `∫_{Ω′}|v|²|g|^{−2αq}e^{−φ−ε|z|²} ≤ I/(α − 1)`. Then `h = h⁰ − v` is holomorphic on `Ω′`, with
`Σ_jg_jh_j = f` because `v` takes values in `S`, and, `h⁰` and `v` being pointwise orthogonal,
`∫|h|²|g|^{−2αq}e^{−φ−ε|z|²} ≤ I + I/(α − 1) = (α/(α − 1))·I`: this is where the constant comes from. Let `ε → 0` (weak
limits on the bounded `Ω_k`), extend across `{g_{l₀} = 0}` by 3.4 (`h` is locally `L²` there, the weight `|g|^{−2αq}e^{−φ}`
being locally bounded below), and let `k → ∞`. For `p = 1`, `S = 0` and `h = h⁰ = f/g`. (b) For `p = 1` (`q = 0`, where
(a) with `αq = β + a − 1` is not available) take `h = f/g^a`: it is meromorphic and locally square integrable, hence
holomorphic, and `∫|h|²|g|^{−2β}e^{−φ} = I_{β,a}`. For `p ≥ 2`, apply (a) `a` times, to `f` with `αq = β + a − 1`, then to
each quotient with `αq = β + a − 2`, and so on down to `αq = β`; each `α > 1` because `β > q`, the constants
`(β + i)/(β + i − q)` multiply, and the sum over `J` collects the quotients of the successive steps. (c) Near `z ∈ Z`, transversality gives
`c|w − z| ≤ |g(w)| ≤ C|w − z|`; if `f` vanishes to order `k ≥ a`, the integrand is `O(|w − z|^{2k−2a−2n+1})`, integrable;
if to order `k < a`, its leading form is nonzero on an open cone of directions where the integrand is at least
`c|w − z|^{−2n−1}`, not integrable. Then (b) with `β = n − ½ > q = n − 1`.

*Needs:* 0.3; 1.2; 3.1–3.5, 3.2a; ComplexComparisonPartII C1.4.

**Checks.**

- `n = p = 2`, `g = (z₁, z₂)`, `a = 1`: `|f|²|z|^{−5}` is integrable at `0 ∈ ℂ²` iff `f(0) = 0`, and then `f = z₁h₁ + z₂h₂`;
  `c(2, 1) = 3`.
- The integer exponent `a + n − 1` also detects vanishing to order `a` at a reduced point, but it corresponds to `β = q`,
  where (a) would need `α = 1` and gives nothing; the half unit in `a + n − ½` is the price of `α > 1`.
- `p = 1` (`q = 0`): (a) is division by one function, `h = f/g`, and the constant `1` already suffices.
- Why the route exhausts the punctured domain: on the unit ball of `ℂ²` with `g = (z₁, z₂)`, `f = z₁`, `φ = 0`, `α = 3/2` (`q = 1`),
  `I = ∫|z₁|²|z|^{−5}dλ = π²` is finite, and `h⁰ = z₁z̄/|z|²` has `|∂̄h⁰|² = |z₁|²/|z|⁴` (coordinate norms), so
  `∫_{ε<|z|<1}|∂̄h⁰|²|z|^{−3}dλ = π²(1/ε − 1) → ∞`: the datum is not square integrable with the weight `|g|^{−2αq}`, also after
  removing `{z₁ = 0}` (a null set whose complement still accumulates at the origin), while its inverse-curvature energy is at
  most `I/(α − 1) = 2π²`. On a relatively compact subdomain of the complement of `{z₁ = 0}` it is bounded.

### Examples

On `ℂ` with `φ = |z|²` and `g = dz̄`, the minimal solution of `∂̄u = g` is `z̄`, and `∫|z̄|²e^{−|z|²} = π = ∫e^{−|z|²}` (3.1, 3.8). For `S = O(−1) ⊂ ℂ² ⊗ O` over `ℙ¹` with the flat metric, `θ_S = −|β|² < 0` (3.2a). The metric `i dz ∧ dz̄/(|z|² log²|z|²)` gives the punctured disc infinite radial length at `0`, and `ℙ² ∖ {pt}` carries a complete Kähler metric but no plurisubharmonic exhaustion (3.3). The unit disc has Bergman density `1/(π(1 − |z|²)²)`, and `O(k)`, `k ≥ 0`, on `ℙ¹` with the Fubini–Study metric and `dV = ω_FS` has `B ≡ k + 1` (3.6). For `n = p = 2`, `g = (z₁, z₂)` and `a = 1`, `|f|²|z|^{−5}` is integrable at `0` iff `f(0) = 0`, and then `f = z₁h₁ + z₂h₂`, with `c(2, 1) = 3` (3.10).

### Dependencies

Layers 0–2; ComplexComparisonPartII C1.3, C1.4, C1.5 and C5.4; ComplexKahlerGeometry K3, K3.0, K4, K5a and K6.0; RealAnalyticGeometry R3.1; Mathlib's Hilbert bases and `Lp` spaces.

## Layer 4: The Ohsawa–Takegoshi extension theorem

### 4.1 Extension from a hyperplane

Prove: let `D ⊂ ℂ` be a bounded domain containing `0`, `G_D(·, 0)` its (negative) Green function with pole `0`, and
`c_D(0) = exp lim_{w→0}(G_D(w, 0) − log|w|)` its logarithmic capacity at `0`. Let `Ω ⊂ ℂ^{n−1} × D` be a pseudoconvex
domain, `H = {z_n = 0}`, `φ` plurisubharmonic on `Ω`, and `f` holomorphic on `Ω ∩ H` with
`∫_{Ω∩H}|f|²e^{−φ}dλ_{n−1} < ∞`. Then there is `F` holomorphic on `Ω` with `F|_{Ω∩H} = f` and
`∫_Ω|F|²e^{−φ}dλ_n ≤ (π/c_D(0)²)·∫_{Ω∩H}|f|²e^{−φ}dλ_{n−1}`. For `n = 1` (`Ω = D`, `Ω ∩ H = {0}`, `f` a value at `0`)
the right side is `(π/c_D(0)²)·|f(0)|²e^{−φ(0)}`. For the disc `D = {|z| < r}`, `c_D(0) = 1/r` and the constant is
`πr²`; the same with an unspecified absolute constant is the original theorem, and `π` is optimal.

*Route.* A known theorem: Z. Błocki, *Suita conjecture and the Ohsawa–Takegoshi extension theorem* (2013), Theorem 1, with
these hypotheses and this constant; proof not given here. What is checked here is the reduction to smooth data: if the statement holds for the smooth strongly
pseudoconvex sublevel sets `Ω_j ⋐ Ω` of a smooth strictly plurisubharmonic exhaustion and the smooth strictly
plurisubharmonic weights `φ_δ = φ ∗ ρ_δ + δ|z|²`, which decrease to `φ` (0.3(a)), then it holds for `(Ω, φ)`: each `Ω_j` lies
in `ℂ^{n−1} × D` with the same `D`, so the right sides `(π/c_D(0)²)·∫_{Ω_j∩H}|f|²e^{−φ_δ}` are at most
`(π/c_D(0)²)·∫_{Ω∩H}|f|²e^{−φ}` because `φ_δ ≥ φ`, and the factor `π/c_D(0)²` is carried through every limit below; the extensions are bounded in `L²` on each `Ω_j` because
`e^{−φ_δ} ≥ e^{−sup_{Ω_j}φ_{δ₀}}` for `δ ≤ δ₀`; a locally uniform limit as `δ → 0`, then `j → ∞` (diagonally), still restricts
to `f` on `H`, and Fatou's lemma for the fixed weight `φ_{δ₀}`, then monotone convergence as `δ₀ → 0`, give the bound. What a
proof of the smooth case must supply beyond the twisted estimate 3.2 (solved, with the weight `φ + 2G_D(z_n, 0)` and twists
`η`, `λ` that are functions of `G_D(z_n, 0)`, for the `∂̄` of a cut-off extension `θ(G_D(z_n, 0) − log ε)·f(z′)`): a bound near
the pole, for the particular twists and at a fixed cut-off parameter `ε`, showing that the solution vanishes on `H`, and
then the energy estimate with the constant `π/c_D(0)²` as `ε → 0`. The singular weight alone does not give the vanishing:
the norm of 3.2 carries the factor `(η + λ)^{−1}`, which for twists growing like `log²(1/|z_n|)` makes the constant function
square integrable against `e^{−2G_D(z_n,0)}` (third Check).

*Needs:* 0.1–0.3; 3.1, 3.2.

**Checks.**

- `Ω` the unit polydisc (`D` the unit disc, `c_D(0) = 1`), `φ = 0`, `f = 1`: every extension `F` satisfies
  `∫_Ω|F|² ≥ π·vol(Δ_1^{n−1})` (the mean value of `|F(z′, ·)|²` on the disc is at least `|F(z′,0)|² = 1`), with
  equality for `F = 1`; the constant `π` cannot be lowered.
- `D = {|z| < r}`: `G_D(w, 0) = log(|w|/r)`, so `c_D(0) = 1/r` and the constant is `πr²`.
- A weight with a logarithmic pole does not by itself force vanishing in a twisted norm: on `{|w| < 1/2}`, the constant
  function `1` has `∫|w|^{−2}(1 + log(1/|w|))^{−2}dλ = 2π∫_0^{1/2}dr/(r(1 + log(1/r))²) = 2π/(1 + log 2) < ∞`, so a twisted
  norm `∫(η + λ)^{−1}|u|²e^{−log|w|²}` with `η + λ ≍ (1 + log(1/|w|))²` is finite for a solution that is `1` on `{w = 0}`.

### 4.2 The Ohsawa–Takegoshi–Manivel theorem on manifolds

Prove: let `X` be a weakly pseudoconvex complex manifold of dimension `n` with a Kähler metric `ω`, `L` a
hermitian holomorphic line bundle, `E` a hermitian holomorphic vector bundle of rank `r`, and `s ∈ H⁰(X, E)`
generically transverse to the zero section; let `Y = {x : s(x) = 0, Λ^r ds(x) ≠ 0}`, of dimension `n − r`.
Assume that `iΘ(L) + r·i∂∂̄ log|s|²` is semipositive and that there is a continuous function `α ≥ 1` with
`iΘ(L) + r·i∂∂̄ log|s|² ≥ α^{−1}{iΘ(E)s, s}/|s|²` and `|s| ≤ e^{−α}` on `X`. Then every holomorphic section `f`
of `K_X ⊗ L` over `Y` with `∫_Y |f|²/|Λ^r(ds)|² dV_{Y,ω} < ∞` extends to a holomorphic section `F` of `K_X ⊗ L`
over `X` with `∫_X |F|²/(|s|^{2r}(−log|s|)²) dV_{X,ω} ≤ C_r ∫_Y |f|²/|Λ^r(ds)|² dV_{Y,ω}`, where `C_r` depends
only on `r`.

*Route.* A known theorem (Ohsawa–Takegoshi, Manivel; in this form Demailly's), proof not given here. The standard
method: extend `f` to a smooth section `F̃` near `Y` and put `G_ε = θ(|s|²/ε²)F̃` with a cut-off `θ`; on `X ∖ {s = 0}`, which
carries complete Kähler metrics (3.3), solve `∂̄u_ε = ∂̄G_ε` for `L`-valued `(n,1)`-forms with the weight `r·log|s|²` added to
that of `L`, by a twisted Bochner–Kodaira–Nakano inequality as in 3.2 with `η`, `λ` functions of `log(|s|² + ε²)`; the
weight forces `u_ε = 0` on `Y`, the bounds are uniform in `ε`, and the limit `ε → 0` and 3.4 conclude. The curvature
operator `B` of 3.2 obtained this way is only SEMIDEFINITE (fourth Check), so 3.2 as stated does not apply: Demailly's
proof uses a version of the a priori estimate for semidefinite `B` in which the equation is solved up to an error term,
`∂̄u + √δ·w = g` with `‖u‖² + ‖w‖²` bounded by `∫⟨(B + δ)^{−1}g, g⟩`, and the error term is removed in the limit. The
constant `C_r` depends only on `r`.

*Needs:* 3.2, 3.3, 3.4; ComplexKahlerGeometry K4 (vector bundles and their curvature).

**Checks.**

- `r = 1`, `X` projective, `E = O(Y)` for a smooth hypersurface `Y` with canonical section `s_Y`: the
  hypotheses are positivity conditions on `L` relative to `O(Y)`, and the conclusion is a bounded extension
  operator from sections over `Y` to sections over `X`, with the weight `1/(|s_Y|²log²|s_Y|)` on `X`.
- A computed case: `X` the unit disc (Stein), `L` and `E` trivial with trivial metrics, `s(z) = z/e` (so `|s| ≤ e^{−1}`,
  `α = 1`), `Y = {0}`. The hypotheses hold (`i∂∂̄log|s|² = 2π[0] ≥ 0`, `iΘ(E) = 0`); for `f = c·dz` at `0`,
  `∫_Y|f|²/|ds|² = e²|c|²`. With the Conventions (`|dz| = 1` for `i∂∂̄|z|² = i dz ∧ dz̄`, whose volume form is `2dλ`),
  `|c·dz|²dV = 2|c|²dλ`, so `F = c·dz` has
  `∫_X|F|²/(|s|²(−log|s|)²) = 2e²|c|²·2π∫_0^1 dr/(r(1 − log r)²) = 4πe²|c|²`. The weight is radial, so `F = c·dz` is the
  extension of least norm (the other Taylor coefficients are orthogonal to the constant term), and `C_1 ≥ 4π`.
- The normalisation `|s| ≤ e^{−α}` cannot be dropped: with `s(z) = z` on the unit disc, `−log|s| → 0` at the boundary
  and `∫|F|²/(|z|²log²|z|) = ∞` for every holomorphic `F` with `F(0) ≠ 0`.
- The twisting does not make `B` definite: on the unit bidisc with `L`, `E` trivial and flat, `r = 1` and `s = z₁/e`, every
  curvature term built from functions of `log(|s|² + ε²)` is a multiple of `i dz₁ ∧ dz̄₁` off `{z₁ = 0}`, so on `(2,1)`-forms
  `⟨Bu, u⟩` is a multiple of `|u₁|²` and `u = dz₁ ∧ dz₂ ∧ dz̄₂` lies in the kernel of `B` for every `ε`.

### 4.3 The Suita inequality

Prove: for a bounded domain `D ⊂ ℂ` and `z ∈ D`, `c_D(z)² ≤ π·K_D(z)`, where `K_D(z)` is the Bergman density of
`D` (3.6 with `h = 1` and Lebesgue measure) and `c_D(z) = exp lim_{w→z}(G_D(w, z) − log|w − z|)` with `G_D` the
negative Green function with pole `z`; equality holds when `D` is simply connected.

*Route.* The case `n = 1` of 4.1 for `D − z` and `φ = 0`: there is `F ∈ O(D)` with `F(z) = 1` and
`∫_D|F|² ≤ π/c_D(z)²`, so `K_D(z) ≥ |F(z)|²/‖F‖² ≥ c_D(z)²/π`. For simply connected `D` both sides transform under a
Riemann map as densities of weight `|ψ′|²`, and they are equal at the centre of the disc.

*Needs:* 4.1; 3.6.

**Checks.**

- The unit disc at `0`: `c = 1`, `K = 1/π`, equality.

### Examples

For the unit polydisc, `φ = 0` and `f = 1`, every extension satisfies `∫|F|² ≥ π·vol(Δ_1^{n−1})`, with equality for `F = 1`, so the constant `π` cannot be lowered; for `D = {|z| < r}`, `c_D(0) = 1/r` and the constant is `πr²` (4.1). On the unit disc with `s(z) = z/e` and `Y = {0}`, the extension of `c·dz` gives `C_1 ≥ 4π` (4.2). For the unit disc at `0`, `c = 1` and `K = 1/π`: the Suita inequality is an equality (4.3).

### Dependencies

Layers 0 and 3; ComplexKahlerGeometry K4.

## Layer 5: Good metrics along a normal crossings boundary

Fix a complex manifold `X̄`, a normal crossings divisor `D`, and `X = X̄ ∖ D`.

### 5.1 Poincaré growth

Define the Poincaré form on the Poincaré polydisc,
`ω_P = Σ_{i≤k} i dz_i ∧ dz̄_i/(|z_i|²(log|z_i|)²) + Σ_{i>k} i dz_i ∧ dz̄_i`, and say that a smooth `p`-form `η`
on `X` has *Poincaré growth* along `D` if at every point of `D`, in a chart to a Poincaré polydisc with
`D = {z₁⋯z_k = 0}`, `η` is bounded on smaller polydiscs with respect to the hermitian metric of `ω_P`
(`|η(t₁, …, t_p)|² ≤ C ∏_i ω_P(t_i, Jt_i)`). Prove that this does not depend on the chart, that forms with
Poincaré growth form a graded algebra, and that they are integrable near `D` in top degree (`∫ ω_P^n < ∞` on
smaller polydiscs), so that every form with Poincaré growth defines a current `[η]` on `X̄` (its extension by
zero, ComplexComparisonPartII C5.4).

*Route.* Two normal crossings charts differ by a holomorphic map preserving the coordinate hyperplanes, under
which `log|z_i|` changes by a bounded amount, so `ω_P` changes to a quasi-isometric form. Integrability:
`∫_{|z|<1/2} dλ/(|z|²log²|z|) < ∞`.

*Needs:* ComplexKahlerGeometry K3 (analytic hypersurfaces); ComplexComparisonPartII C5.4.

### 5.2 Good forms

Call a smooth form `η` on `X` *good* if `η` and `dη` both have Poincaré growth along `D`. Prove: for a good form, the currents
satisfy `d[η] = [dη]` on `X̄` (no residue along `D`); good forms are closed under products.

*Route.* Stokes on the complement of tubes `{|z_i| ≥ ε}`; the boundary integrals tend to zero because a form
with Poincaré growth restricted to `{|z_i| = ε}` is `O(1/|log ε|)` in the angular direction.

*Needs:* 5.1.

### 5.3 Good metrics and the uniqueness of the extension

Let `Ē` be a holomorphic vector bundle on `X̄` of rank `r` and `h` a smooth hermitian metric
on `E = Ē|_X`. Call `h` *good relative to `Ē`* if at every point of `D`, for a local frame `e₁, …, e_r` of `Ē` on a Poincaré polydisc with Gram
matrix `H = (h(e_i, e_j))`, `h` linear in the first and conjugate-linear in the second variable: (i) `|H_{ij}|` and
`(det H)^{−1}` are bounded by `C(Σ_{i≤k}|log|z_i||)^m`; (ii) the entries of `(∂H)H^{−1}` are good forms. With this
convention `(∂H)H^{−1}` is the transpose of the matrix `θ` of the Chern connection (`D′e_j = Σ_iθ_{ij}e_i`), and a change of
frame `e′_j = Σ_ie_ig_{ij}` (`g` holomorphic and invertible on the polydisc) gives `H′ = gᵀHḡ`. Prove: (a) the condition does not depend on the
frame; (b) if `h` is good relative to `Ē₁` and to `Ē₂`, both extending `E`, then the identity of `E` extends to
an isomorphism `Ē₁ ≅ Ē₂`; (c) direct sums, tensor products, duals, exterior and symmetric powers and
determinants of good metrics are good relative to the corresponding extensions; (d) for line bundles, condition
(i) is the logarithmic-growth condition of 2.5 in every chart, and condition (ii) says that `∂φ` and `∂∂̄φ` both have
bounded norm for the Poincaré metric, `φ` the weight; the bound for `∂φ` together with (i) does not imply the bound for
`∂∂̄φ` (second Check).

*Route.* (b) The identity map in the two frames has entries of logarithmic growth, hence is holomorphic across
`D` by the Riemann extension theorem (ComplexKahlerGeometry K3) applied to entries and their inverses. (a) With
`H′ = gᵀHḡ` and `∂ḡ = 0`, `(∂H′)H′^{−1} = gᵀ·(∂H)H^{−1}·(gᵀ)^{−1} + (∂gᵀ)(gᵀ)^{−1}`: the new entries are combinations of the old
ones with coefficients holomorphic on the closed polydisc, plus holomorphic `1`-forms. Smooth forms on `X̄` have Poincaré
growth (`ω_P ≥ c·ω_eucl` on the Poincaré polydisc), and the product of a good form with a smooth function `u` is good
(`d(uη) = du ∧ η + u·dη`, 5.1), so (ii) is preserved; (i) is preserved because `g` and `g^{−1}` are bounded. (c) The same
computation for the induced frames. With the opposite convention (`h` conjugate-linear in the first variable) the Gram
matrix changes by `H′ = g*Hg` and the connection matrix is `H^{−1}∂H`; the matrix `(∂H)H^{−1}` of the other convention is then
not a connection matrix, and its goodness depends on the frame (third Check). (d) For `r = 1`, `H = e^{−φ}`, the connection form is
`(∂H)H^{−1} = −∂φ`, and its exterior derivative is `−∂̄∂φ = ∂∂̄φ`; 5.2 asks Poincaré growth of both.

*Needs:* 5.1, 5.2; ComplexKahlerGeometry K3, K4.

**Checks.**

- On the punctured disc, the trivial bundle with `|e|² = −log|z|` is good relative to `O`: the connection form
  `∂ log(−log|z|) = dz/(2z log|z|)` and its `∂̄` have Poincaré growth. The same metric is not good relative to
  `O(−[0])`: in the frame `z·e`, `|ze|² = |z|²(−log|z|)` violates (i).
- On the punctured disc put `t = −log|z|` and `φ = t^{−2}sin(t²)`: `φ` is bounded, so (i) holds, and the Poincaré norm of
  `∂φ = −φ′(t)dz/(2z)` is a constant times `t·|φ′(t)|`, with `t·φ′(t) = 2cos(t²) − 2t^{−2}sin(t²)` bounded; but the
  Poincaré norm of `∂∂̄φ` is a constant times `t²|φ″(t)|`, with `t²φ″(t) = −4t²sin(t²) − 6cos(t²) + 6t^{−2}sin(t²)` unbounded. The metric `e^{−φ}` is not good, and
  `(i/2π)∂∂̄φ` is not even integrable near `0`.
- The convention matters in (a). On the bidisc `{|z|, |w| < 1/2}` with `D = {z = 0}`, `t = −log|z|`, let `H = diag(t, 1)` in a
  frame `e`: `(∂H)H^{−1} = diag(−dz/(2zt), 0)`, whose entry and its `∂̄` have Poincaré norms `1/2` and `1/4`, so the metric is
  good. For `g = I + wE₁₂`, the Gram matrix `gᵀHḡ` of the frame `eg` has `(∂H′)H′^{−1}` with `dw`-coefficient `E₂₁` at `w = 0`,
  bounded as (a) requires; the matrix `g*Hg` (the transformation law of the other convention) gives `dw`-coefficient
  `HE₁₂H^{−1} = t·E₁₂`, unbounded since `dw` has Poincaré norm bounded below, while `(g*Hg)^{−1}∂(g*Hg)` has the bounded
  coefficient `E₁₂`. A definition mixing `H′ = g*Hg` with `(∂H)H^{−1}` would not be frame-independent.

### 5.4 Chern–Weil theory for good metrics

Prove: let `X̄` be compact, `Ē` a holomorphic vector bundle on `X̄`, `h` good relative to `Ē`. Then for every
invariant polynomial `P` the Chern–Weil form `P(Θ_h)` on `X` is a good form, the current `[P(Θ_h)]` on `X̄` is
closed, and it represents `P(Ē)` in `H*(X̄, ℝ)`: for every closed smooth form `β` on `X̄` of complementary degree,
`∫_X P(Θ_h) ∧ β = ⟨P(Ē) ∪ [β], [X̄]⟩`. In particular `∫_X c_I(E, h) = c_I(Ē)[X̄]` for every Chern monomial of top
degree.

*Route.* Mumford's argument: the curvature matrix `∂̄θ` of a good metric (`θ` the connection matrix of 5.3, the
transpose of `(∂H)H^{−1}`) has Poincaré growth, and so does `d(∂̄θ) = d(θ ∧ θ)` (as `∂θ = −θ ∧ θ`), so Chern forms are good (5.2); compare with a smooth metric `h₀` on `Ē` through the transgression form `T(h, h₀)` of
CharacteristicClasses §4.1 (C4.1), which is a good form on `X` because the connection difference has Poincaré growth;
then `P(Θ_h) − P(Θ_{h₀}) = dT` holds as currents on `X̄` by 5.2, and CharacteristicClasses §4.2 (C4.2) identifies
`P(Θ_{h₀})` with `P(Ē)`.

*Needs:* 5.1–5.3; CharacteristicClasses §§4.1–4.2 (C4.1–C4.2); ComplexComparisonPartII C5.4.

**Checks.**

- On a compact Riemann surface `C` with a point `p` and coordinate `z` at `p`, let `h` be a smooth metric on
  `O(p)|_{C∖p}` equal to `|e|² = −log|z|` near `p`, `e = 1/z` the frame of `O(p)`. It is good relative to `O(p)`,
  and `∫_{C∖p} c₁(L, h) = 1 = deg O(p)`. The same bundle on `C ∖ p` also extends as `O`, with frame `1 = z·e` and
  `|1|² = −|z|²log|z|`, which violates 5.3(i); the degree `0` of `O` is not the integral of the curvature. A
  Chern–Weil statement that did not fix the extension would be false.

### 5.5 Poincaré-type metrics

Prove: if `X̄` is compact Kähler with Kähler form `ω` and `D = Σ D_j` a simple normal crossings divisor with
hermitian metrics on `O(D_j)` and sections `s_j` scaled so that `|s_j| < e^{−1}`, then for small `δ > 0`,
`ω_P = ω − δ·Σ_j i∂∂̄ log(−log|s_j|²)` is a complete Kähler metric on `X` with finite volume, quasi-isometric to the
Poincaré form near `D`, and of bounded geometry in quasi-coordinates: there are `r > 0`, `c > 0` and, for every
`x ∈ X`, a holomorphic local biholomorphism `F_x : B(0, r) → X`, `F_x(0) = x`, with `c·ω_eucl ≤ F_x*ω_P ≤ c^{−1}·ω_eucl`
and all derivatives of the coefficients of `F_x*ω_P` bounded independently of `x`. The volume form `ω_P^n` and
every Chern form of `ω_P` are good forms.

*Route.* Direct computation of `i∂∂̄ log(−log|s|²)` near `D`; quasi-coordinates from the universal covering
`w ↦ exp((w+1)/(w−1))` of the punctured disc restricted to a disc of fixed radius (Kobayashi, Cheng–Yau).

*Needs:* 5.1–5.4; 3.3 (for completeness, with the same functions).

**Checks.**

- On `0 < |z| < 1/2`, `ω_P = i dz ∧ dz̄/(|z|²(log|z|)²)` has finite area `4π/log 2` and infinite distance to the puncture
  (the radial length element is `√2·dr/(r·log(1/r))`); the distance to the outer circle is finite, so this disc is not complete
  by itself: completeness of `ω_P` on `X` uses the compactness of `X̄`, the cusp computation giving it near `D`. The
  quasi-coordinate map at a point with `|z| = t` is not injective once `t` is small: a point has about `|log t|`
  preimages. This multiplicity enters 3.7(b) and 9.6.

### Examples

On the punctured disc, the trivial bundle with `|e|² = −log|z|` is good relative to `O` and not relative to `O(−[0])` (5.3). On a compact Riemann surface, the metric on `O(p)` equal to `−log|z|` near `p` in the frame `1/z` is good relative to `O(p)`, and its curvature integrates to `1 = deg O(p)` (5.4). On `0 < |z| < 1/2`, `ω_P = i dz ∧ dz̄/(|z|²(log|z|)²)` has finite area `4π/log 2` and infinite distance to the puncture (5.5).

### Dependencies

Layers 2 and 3 (2.5, 3.3); ComplexKahlerGeometry K3 and K4; ComplexComparisonPartII C5.4; CharacteristicClasses §§4.1–4.2 (C4.1–C4.2).

## Layer 6: Analytic multiplier ideals

### 6.1 The multiplier ideal of a weight

Define the analytic multiplier ideal `J(φ)` for a quasi-plurisubharmonic `φ` on a complex manifold: the
ideal subsheaf of `O_X` of germs `f` at `x` with `|f|²e^{−φ}` integrable on a neighbourhood of `x`; for a
singular metric `h` with quasi-plurisubharmonic weights, `J(h)` is the ideal of its local weights. Prove:
`J(φ)` depends only on the singularity class of `φ` (`φ₁ ≤ φ₂ + O(1)` implies `J(φ₁) ⊆ J(φ₂)`);
`J(φ + ψ) = J(φ)` for bounded `ψ`; `J(cφ) ⊇ J(c′φ)` for `c ≤ c′`; `J(φ)_x = O_x` iff `e^{−φ}` is integrable near
`x`; and, for `n ≥ 1` (Lelong numbers, Conventions), the cosupport of `J(φ)` contains `{ν(φ, ·) ≥ 2n}` and is contained in
`{ν(φ, ·) ≥ 2}`, and `ν(φ, x) ≥ 2(n + s)` implies `J(φ)_x ⊆ m_x^{s+1}`. (For `n = 0`, `J(φ)_x` is `O_x` if `φ(x) > −∞` and `0`
otherwise; 1.1's last Check.)

*Needs:* 1.1–1.2; 2.1; 0.4.

**Checks.**

- `φ = c·log|z₁|²` on `ℂ^n`: `J(φ) = (z₁^{⌊c⌋})`. A definition with `⌈c⌉` would give `(z₁)` at `c = 1/2`
  instead of `O`.
- `φ = log(|z₁|² + |z₂|²)` on `ℂ²`: `J(φ) = O` (`|z|^{−2}` is integrable in real dimension four), while
  `J(2φ) = m_0`.

### 6.2 Coherence (Nadel)

Prove that `J(φ)` is a coherent ideal sheaf for every quasi-plurisubharmonic `φ`.

*Route.* The question is local. On a small ball `B` around a point, write `φ = v + ψ` with `v` plurisubharmonic and `ψ`
smooth on a neighbourhood of `B̄`, and fix `C` with `i∂∂̄ψ ≥ −C·i∂∂̄|z|²` there: `φ̃ = φ + C|z|²` is plurisubharmonic on `B`
and differs from `φ` by a bounded smooth function, so it has the same multiplier ideal and the same weighted `L²` spaces on
`B` (6.1). The logarithmic pole added below is plurisubharmonic but does not compensate a negative Levi form of `ψ` (its Levi
form vanishes in the radial direction), which is why `C|z|²` is added first. The Hilbert space `H(B, φ)` of holomorphic `f`
with `∫_B|f|²e^{−φ} < ∞` generates a coherent ideal `I` (strong Noetherian property of coherent sheaves, ComplexKahlerGeometry
K3), and `I ⊆ J(φ)` on `B`. Let `x ∈ B`, `f ∈ J(φ)_x` with `∫_V|f|²e^{−φ} < ∞` on a neighbourhood `V ⊂ B` of `x`, `k ≥ 0`, and `θ` a
cut-off equal to `1` near `x` with support in `V`. Hörmander's estimate 3.1(a) on the pseudoconvex `B` with the
plurisubharmonic weight `φ̃ + 2(n + k)log|z − x|` gives `u` with `∂̄u = f∂̄θ`: the datum is supported where `|z − x| ≥ δ > 0`,
so its weighted norm is at most a constant times `∫_V|f|²e^{−φ}`. Then `F = θf − u` is holomorphic on `B`; since
`φ̃ + 2(n + k)log|z − x| ≤ φ + C′` on `B`, `∫_B|u|²e^{−φ} < ∞` and `F ∈ H(B, φ)`; near `x`, `u = f − F` is holomorphic with
`∫|u|²|z − x|^{−2(n+k)} < ∞` (`φ` is bounded above near `x`), so `u` vanishes to order `≥ k + 1` at `x` (1.2(c)'s computation:
`∫_{|z|<ρ}|z|^{2j−2(n+k)}dλ = ∞` for `j ≤ k`). So `f ∈ I_x + m_x^{k+1}` for every `k`, and Krull's intersection theorem gives
`J(φ)_x ⊆ I_x`.

*Needs:* 6.1; 0.4, 1.2; 3.1; ComplexKahlerGeometry K3 (coherence, Noetherianity of the local rings).

### 6.3 Comparison with algebraic multiplier ideals

Prove: (a) let `X` be a smooth complex algebraic variety, `a ⊂ O_X` a nonzero coherent ideal with local generators
`g_1, …, g_N`, and `c ≥ 0` rational; then `J(c·log Σ_j|g_j|²) = (algebraicMultiplierIdeal a c)^{an}`; (b) for an
effective `ℚ`-divisor `Δ = Σ c_iD_i` on smooth `X` with local equations `s_i`,
`J(Σ_i c_i log|s_i|²) = J(X, Δ)^{an}`, the multiplier ideal of the pair of MultiplierIdealsOfPairsAndPointSeparation
§9.10b (`multiplierIdealOfPair`); (c) every point `x` of a complex manifold `X` with holomorphic germs `g_1, …, g_N`
not all zero has a neighbourhood `V` and a proper modification `π : V′ → V`, with `V′ ⊂ V × ℙ^m(ℂ)` a closed complex
submanifold, `π` the projection, biholomorphic over `V ∖ V(g_j)`, and `(g_j)·O_{V′}` invertible, locally a monomial in
holomorphic coordinates, with strict normal crossings support together with the exceptional set (analytic
principalisation), and the formula of (a) holds on `V` for `c·log Σ_j|g_j|² + O(1)`; (d) consequently, if all `g_j`
vanish at `x`, the complex singularity exponent (1.3) of `log Σ_j|g_j|²` at `x` is a positive rational number, the log
canonical threshold of the ideal `(g_j)` at `x`; if some `g_j(x) ≠ 0` (the unit ideal at `x`), it is `+∞` (1.3: the
Lelong number is `0`).

*Route.* On a principalisation (log resolution) `π : Y → X` (ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2,
analytified), `a·O_Y = O(−F)` with `F` simple normal crossings; the change of variables
`∫|f|²e^{−φ}dλ = ∫|f ∘ π|²|Jac π|²e^{−φ∘π}dλ` and `φ ∘ π = c·log|monomial of F|² + bounded`,
`|Jac π|² = |monomial of K_{Y/X}|² × unit` reduce integrability to monomials, where `∫|z|^{2a}` is finite iff
`a > −1`. This gives `π_*O_Y(K_{Y/X} − ⌊cF⌋)`, the algebraic definition. GAGA (ComplexComparisonPartII C0, C2.2)
compares the two sheaves. (c) Apply the principalisation of quasi-excellent schemes (ResolutionOfSingularitiesCharacteristicZero
§7.7) to `Spec O_{X,x}` (the ring of convergent power series, an excellent regular local ring) and the ideal `(g_j)`: a
projective birational `Y → Spec O_{X,x}`, an isomorphism off `V(g_j)`, with `Y` regular and `(g_j)·O_Y` invertible and
monomial with strict normal crossings support together with the exceptional locus. `Y` is a closed subscheme of
`ℙ^m_{O_{X,x}}` cut out by finitely many homogeneous polynomials whose coefficients are germs at `x`; on a neighbourhood
`V` where these coefficients converge, the same polynomials cut out a closed complex subspace `V′ ⊂ V × ℙ^m(ℂ)`
(ComplexComparisonPartII C-1.1's local models and open gluing), proper over `V`. At a point `y′ ∈ V′` over `x`, the
algebraic local ring `O_{Y,y}` maps to the analytic local ring `O_{V′,y′}` by a local homomorphism that induces an
isomorphism of completions (both are `ℂ[[z, w]]` modulo the same polynomials; C-1.1's completed stalks); it is therefore
flat and carries the maximal ideal onto the maximal ideal. So `V′` is regular at `y′`, and a regular system of parameters
at `y`, a generator of `(g_j)·O_{Y,y}` with its monomial form, and the local equations of the normal crossings support are
carried over directly; completions are not needed beyond this. These conditions are open, so they hold on a neighbourhood
of the fibre over `x`, which contains the preimage of a smaller `V` by properness. The isomorphism of `Y` with
`Spec O_{X,x}` off `V(g_j)` is expressed by finitely many identities among convergent series, which hold on a smaller `V`,
so `π` is biholomorphic over `V ∖ V(g_j)`. The set `π^{−1}(V(g_j))` is the zero set of the invertible ideal `(g_j)·O_{V′}`
on the `n`-dimensional manifold `V′`, a hypersurface, hence of measure zero, which the change of variables of (a) needs.
Then the monomial computation of (a) applies verbatim.

*Needs:* 6.1–6.2; AlgebraicModuliForArithmeticGeometry §9.10 (`algebraicMultiplierIdeal`);
MultiplierIdealsOfPairsAndPointSeparation §9.10b (`multiplierIdealOfPair`);
ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2, 7.7; ComplexComparisonPartII C-1.1, C0 (analytification), C2.2.

**Checks.**

- `a = (x²)` on the line, `c = 1/2`: both sides are `(x)` (AlgebraicModuliForArithmeticGeometry §9.10's check);
  `a = (xy)`, `c = 1`: both are `(xy)`.
- `a = (x, y)` on the plane, `c = 1`: `J = O` (6.1's second check), while the naive guess "`a^{⌊c⌋}`" would give
  `(x, y)`.

### 6.4 The restriction theorem

Prove: if `H ⊂ X` is a smooth hypersurface and `φ` is quasi-plurisubharmonic with `φ|_H ≢ −∞` on each component
of `H`, then `J(φ|_H) ⊆ J(φ)·O_H` (the image of `J(φ)` in `O_H`).

*Route.* At `x ∈ H` take coordinates with `H = {z_n = 0}` and a polydisc `P = P′ × Δ_r` around `x` on which `φ = v + ψ` with `v`
plurisubharmonic and `ψ` smooth on a neighbourhood of `P̄`; with `C` such that `i∂∂̄ψ ≥ −C·i∂∂̄|z|²` there, `φ̃ = φ + C|z|²` is
plurisubharmonic on `P` and `e^{−φ̃}` is between `e^{−C′}e^{−φ}` and `e^{−φ}` (4.1 needs a plurisubharmonic weight; the
bounded smooth correction changes neither multiplier ideal). For a germ `f ∈ J(φ|_H)_x`, shrink `P` so that `f` is
holomorphic on `P ∩ H` with `∫_{P∩H}|f|²e^{−φ} < ∞`; 4.1 on the pseudoconvex `P ⊂ ℂ^{n−1} × Δ_r` with the weight `φ̃` gives `F`
holomorphic on `P` with `F|_{P∩H} = f` and `∫_P|F|²e^{−φ} ≤ e^{C′}∫_P|F|²e^{−φ̃} ≤ e^{C′}πr²∫_{P∩H}|f|²e^{−φ} < ∞`, so `F ∈ J(φ)_x`.

*Needs:* 6.1; 0.4; 4.1.

**Checks.**

- `φ = log|z₁|²` on `ℂ²`, `H = {z₂ = 0}`: `J(φ|_H) = (z₁) = J(φ)|_H`. For `H = {z₁ = 0}` the hypothesis fails
  (`φ|_H ≡ −∞`).

### 6.5 Subadditivity

Prove `J(φ + ψ) ⊆ J(φ)·J(ψ)` for quasi-plurisubharmonic `φ, ψ`.

*Route.* On `X × X`, `J(φ ⊠ ψ) = J(φ) ⊠ J(ψ)` (Fubini and coherence); restrict to the diagonal by 6.4, applied
`n` times along hypersurfaces cutting out the diagonal.

*Needs:* 6.1–6.2, 6.4.

**Checks.**

- `φ = ψ = log|z|²` on `ℂ`: `J(2 log|z|²) = (z²) ⊆ (z)·(z)`, an equality.

### 6.6 Strong openness

Prove `J(φ) = ⋃_{ε>0} J((1 + ε)φ)` for every quasi-plurisubharmonic `φ`. For `n ≥ 2` this target is a known theorem, cited:
the strong openness theorem of Guan and Zhou, for a plurisubharmonic function on a ball of `ℂ^n`. For `n = 1` it is proved
here.

*Route.* What is cited is the local statement for a plurisubharmonic `φ` on a ball of `ℂ^n`: Q. Guan and X. Zhou, *A proof
of Demailly's strong openness conjecture*, Ann. of Math. 182 (2015); another proof is P. H. Hiep's (2014). The target
follows from it because `J` is local and changing `φ` by a smooth (hence locally bounded) function changes neither side
(6.1). The inclusion `⊇` is 6.1 (`J(cφ) ⊇ J(c′φ)` for `c ≤ c′`). The increasing union `⋃_{ε>0} J((1 + ε)φ)` of coherent
ideals (6.2) is stationary near each point (Noetherian property of coherent sheaves), hence equal to `J((1 + ε₀)φ)` near `x`
for some `ε₀ > 0`; so the theorem says `J(φ)_x ⊆ J((1 + ε₀)φ)_x`. A quasi-plurisubharmonic `φ` may be `≡ −∞` near `x` (0.4
allows a local plurisubharmonic part `≡ −∞`); the set of such points is open and closed (0.2(a) on connected balls), so this
happens exactly on whole components of `X`, and there both sides vanish for every `ε > 0` (`|f|²e^{−φ}` is integrable only for
`f = 0`), in every dimension; the cited theorem and the argument below are for `φ ≢ −∞` near `x`, where the local plurisubharmonic
part is a nontrivial germ. The case `n = 1`: write `φ = (ν/2)log|z − x|² + φ₁` near `x` with `ν = ν(φ, x)` (split off the point mass `2πν·δ_x` of the Riesz
measure of 0.3a, whose normalisation gives `log|z|` the measure `2πδ₀`; `φ₁` is subharmonic after correction on a null
set, 0.3(b)), so `ν(φ₁, x) = 0` and `e^{−pφ₁}` is integrable near `x` for every `p` (1.2(a)); by Hölder's inequality, and
since `φ₁` is bounded above, `|f|²e^{−φ}` is integrable near `x` iff `|z − x|^{2·ord_x f − ν}` is, i.e. iff
`ν − 2·ord_x f < 2`, and this condition is open under `φ ↦ (1 + ε)φ`. Membership in `J(φ)` does not pass to hyperplanes
through `x` (Check), so an induction on `n` cannot simply restrict `f` to such hyperplanes.

*Needs:* 6.1–6.2; 0.2, 0.3, 0.3a; 1.2.

**Checks.**

- `φ = c·log|z|²` on `ℂ²`, `1 ≤ c < 2`: `1 ∈ J(φ)_0` (`|z|^{−2c}` is integrable in real dimension four), while
  `φ|_H = c·log|w|²` on every line `H ∋ 0` has `1 ∉ J(φ|_H)_0`. 6.4 gives the inclusion `J(φ|_H) ⊆ J(φ)·O_H` only.

### Examples

`J(c·log|z₁|²) = (z₁^{⌊c⌋})` on `ℂ^n`; on `ℂ²`, `J(log(|z₁|² + |z₂|²)) = O` while `J(2 log(|z₁|² + |z₂|²)) = m_0` (6.1). For `a = (x²)` on the line and `c = 1/2` both multiplier ideals are `(x)`, and for `a = (x, y)` on the plane and `c = 1`, `J = O` (6.3). On `ℂ`, `J(2 log|z|²) = (z²) = (z)·(z)` (6.5). For `φ = c·log|z|²` on `ℂ²` with `1 ≤ c < 2`, `1 ∈ J(φ)_0` while `1 ∉ J(φ|_H)_0` for every line `H ∋ 0` (6.6).

### Dependencies

Layers 0–4; ComplexKahlerGeometry K3; ComplexComparisonPartII C-1.1, C0 and C2.2; AlgebraicModuliForArithmeticGeometry §9.10; MultiplierIdealsOfPairsAndPointSeparation §9.10b; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2 and 7.7.

## Layer 7: Approximation and regularisation

### 7.1 Demailly's Bergman-kernel approximation

Prove: let `Ω ⊂ ℂ^n` be a bounded pseudoconvex domain, `φ` plurisubharmonic on `Ω` and not `≡ −∞` (for `φ ≡ −∞` the
space below is `0`), and for `m ≥ 1` let `(σ_{m,k})_k` be an orthonormal basis of
`H(Ω, mφ) = {f ∈ O(Ω) : ∫_Ω|f|²e^{−mφ}dλ < ∞}`; put `φ_m = (1/m)log Σ_k|σ_{m,k}|²`, the logarithm of the diagonal of the
(unweighted) reproducing kernel of `H(Ω, mφ)`. Then there are constants `C₁, C₂` depending only on `n` and the diameter of `Ω`
with (a) `φ(z) − C₁/m ≤ φ_m(z) ≤ sup_{|ζ−z|<r} φ(ζ) + (1/m)log(C₂/r^{2n})` whenever `B(z, r) ⊂ Ω`; (b)
`ν(φ, x) − 2n/m ≤ ν(φ_m, x) ≤ ν(φ, x)`; (c) `φ_m → φ` pointwise and in `L¹_loc`; (d) `J(mφ)` is generated by the
`σ_{m,k}`, and `φ_m` has analytic singularities in the sense of 2.2 with `c = 1/m`: every relatively compact open subset
of `Ω` has a finite set of the `σ_{m,k}`, say `k ≤ N`, with `φ_m = (1/m)log Σ_{k≤N}|σ_{m,k}|² + O(1)` there. In general
`φ_m` is not `(1/m)log` of a finite sum of squares of holomorphic functions (Check).

*Route.* `Σ_k|σ_{m,k}(z)|² = sup{|f(z)|² : f ∈ H(Ω, mφ), ‖f‖ ≤ 1}`; in terms of the density of 3.6 (whose norm `|s|²_h` includes
the weight), `φ_m = φ + (1/m)log B_{Ω,mφ}` where `φ` is finite (adding a constant to `φ` shifts `φ_m` by that constant and leaves
`B_{Ω,mφ}` unchanged). Upper bound: 3.7(a) with `A = 0` and the constant weight `m·sup_{B(z,r)}φ`, which dominates `mφ` on `B(z, r)`:
`|f(z)|²e^{−m sup_{B(z,r)}φ} ≤ (n!/(π^n r^{2n}))∫_{B(z,r)}|f|²e^{−mφ}`, so `C₂ = n!/π^n`. Lower bound: 4.1 applied to the
zero-dimensional "hyperplane" `{z}` (iterate the hyperplane case `n` times) gives `f ∈ H(Ω, mφ)` with `f(z) = 1` and
`‖f‖² ≤ C·e^{−mφ(z)}` at points where `φ(z) > −∞`, so `Σ_k|σ_{m,k}(z)|² ≥ e^{mφ(z)}/C`. (b) from (a): the upper bound of (a) gives
`ν(φ_m) ≥ ν(φ) − 2n/m`, the lower bound gives `ν(φ_m) ≤ ν(φ)`. (d) The generation of `J(mφ)` is 6.2's argument on `Ω`.
For the singularities fix `x₀ ∈ Ω` and `N` with `σ_{m,1}, …, σ_{m,N}` generating, at `x₀`, the ideal of all `σ_{m,k}`
(an increasing chain of ideals of the Noetherian ring `O_{x₀}`). Let `σ*(ζ) = conj(σ(ζ̄))` and `𝔞` the ideal of
`O_{ℂ^{2n}, (x₀, x̄₀)}` generated by the `σ_{m,i}(z)σ*_{m,j}(ζ)`, `i, j ≤ N`. The partial sums of
`K(z, ζ) = Σ_kσ_{m,k}(z)σ*_{m,k}(ζ)` lie in `𝔞` and converge uniformly near `(x₀, x̄₀)` (Cauchy–Schwarz and Dini's theorem for
`Σ_k|σ_{m,k}|²`, the squared norm of the evaluation functional, continuous in the point by the Cauchy estimates); `𝔞` is closed under such limits, because the Taylor coefficients converge, `𝔞 + 𝔪^l` is closed (its image
in the finite-dimensional `O/𝔪^l` is a subspace) and `⋂_l(𝔞 + 𝔪^l) = 𝔞` (Krull). So `K = Σ_{i,j≤N}a_{ij}(z, ζ)σ_{m,i}(z)σ*_{m,j}(ζ)`
with `a_{ij}` holomorphic near `(x₀, x̄₀)`, and at `ζ = z̄`, by Cauchy–Schwarz,
`Σ_{k≤N}|σ_{m,k}|² ≤ Σ_k|σ_{m,k}|² ≤ (sup‖(a_{ij})‖)·Σ_{k≤N}|σ_{m,k}|²` near `x₀`; finitely many `x₀` cover a relatively
compact set.

*Needs:* 3.6, 3.7, 4.1; 1.1; 6.1–6.2; ComplexKahlerGeometry K3 (holomorphic germs, Noetherianity of the local rings).

**Checks.**

- `φ = log|z|²` on the unit disc: `H(Δ, m log|z|²)` is `z^m·(L² holomorphic functions)`, and `φ_m = log|z|² +
  (1/m)log B'` with `B'` bounded above and below near `0`: `ν(φ_m, 0) = 2 = ν(φ, 0)`.
- `φ = 0` on the unit disc, `m = 1`: `σ_k = ((k + 1)/π)^{1/2}z^k`, and `Σ_k|σ_k|² = 1/(π(1 − |z|²)²) = Σ_{k≥0}((k + 1)/π)|z|^{2k}`.
  It is not `Σ_{l≤N}|f_l|²` near `0` for holomorphic `f_l`: comparing the coefficients of `z^j z̄^k` would make the vectors of
  `j`-th Taylor coefficients `(f_{1,j}, …, f_{N,j}) ∈ ℂ^N` nonzero and mutually orthogonal for all `j`. So (d) holds only up
  to a bounded term (here `log Σ_k|σ_k|² = log|1|² + O(1)`).
- `φ ≡ c` constant on the unit disc, `m = 1`: the orthonormal basis is `e^{c/2}σ_k`, so `φ_1 = c + log(1/(π(1 − |z|²)²))`, while
  the density of 3.6 for the weight `c` is `1/(π(1 − |z|²)²)` for every `c`. So `φ_m = φ + (1/m)log B_{Ω,mφ}`; the formula
  `φ_m = (1/m)log B_{Ω,mφ}` would not move with `c`.

### 7.2 Siu's analyticity theorem

Prove: for a closed positive `(1,1)`-current of the form `T = (i/2π)∂∂̄φ` locally (in particular the Chern current
of a semipositive singular metric) and every `c > 0`, the set `E_c = {x : ν(T, x) ≥ c}` (`ν(T, x) = ν(φ, x)/2`)
is a closed analytic subset of `X`.

*Route.* Locally `E_c(φ) = ⋂_{m≥m₀} {x : ν(φ_m, x) ≥ 2c − 2n/m}` by 7.1(b); for `φ_m = (1/m)log Σ|σ_{m,k}|²`,
`{ν(φ_m, x) ≥ a}` is the common zero set of the derivatives of order `< ma/2` of all `σ_{m,k}`, an analytic set;
a decreasing intersection of analytic sets is analytic (Noetherianity of the local rings, ComplexKahlerGeometry K3).

*Needs:* 7.1; 1.1; ComplexKahlerGeometry K3.

**Checks.**

- `T = [D]` for a divisor `D` with multiplicities: `E_c` is the union of the components of multiplicity `≥ c`
  together with the points of `D` where the multiplicity of the local equation is `≥ c`.

### 7.3 Global approximation by analytic singularities

Prove: let `X` be a complex manifold with a hermitian metric `ω`, `X′ ⋐ X` relatively compact open (or `X′ = X`
if `X` is compact), `α` a smooth closed real `(1,1)`-form, `γ` a continuous real `(1,1)`-form and `φ`
quasi-plurisubharmonic with `α + i∂∂̄φ ≥ γ`. Then there are quasi-plurisubharmonic `φ_m` on `X′` with analytic
singularities (2.2, with `c = 1/m`), smooth on `X′ ∖ V(J(mφ))`, such that `φ_m → φ` pointwise and in `L¹_loc`, `φ_m ≥ φ − C/m`,
`α + i∂∂̄φ_m ≥ γ − ε_m ω` with `ε_m → 0`, and `ν(φ, x) − 2n/m ≤ ν(φ_m, x) ≤ ν(φ, x)`. No monotonicity in `m` is asserted
(8.1 does not use any).

*Route.* The approximation is Demailly's global approximation theorem (J.-P. Demailly, *Regularization of closed positive
currents and intersection theory*, 1992; also in his *Analytic Methods in Algebraic Geometry*); for the statement in the
exact form above (in particular the dependence of the constants) the proof is not given here. The standard method, at the
level of its steps: on finitely many small coordinate balls `B_j` covering `X̄′`, write
`α = i∂∂̄g_j` and choose a quadratic polynomial `q_j` with `i∂∂̄q_j = −γ(x_j)` at the centre `x_j`; since `γ` is continuous,
`ψ_j = φ + g_j + q_j + δ_j|z − x_j|²` is plurisubharmonic on `B_j` once `δ_j` exceeds the oscillation of `γ` on `B_j` (in the
coordinates), and it is to `ψ_j`, not to `φ + g_j` (whose Levi form is only bounded below by `γ`), that 7.1 applies; the
local approximants `(1/m)log Σ_k|σ_{m,k}|² − g_j − q_j − δ_j|z − x_j|²` lose a constant multiple of `δ_j` in curvature against
`γ`. They are glued by a regularised maximum after a comparison on overlaps whose error tends to `0` as `m → ∞` (in
Demailly's proof it rests on the `L²` estimates of Layers 3–4), the balls shrinking as `m → ∞` so that `ε_m → 0`. The
comparison 7.1(a) alone does not suffice for the gluing (its two sides differ by `sup_{B(z,r)}φ − φ(z)`, unbounded near the
poles), nor does the comparability of two finite generating systems of `J(mφ)`, which holds with a constant depending on
`m`. What follows from the construction directly: each local approximant is smooth off `V(J(mφ))` (7.1(d); smooth
additions to the weight do not change multiplier ideals) and is `(1/m)log Σ_{k≤N}|σ_{m,k}|² + O(1)` (7.1(d)), so the glued
function, a regularised maximum of such functions with bounded corrections, is smooth off `V(J(mφ))` and has analytic
singularities, and its Lelong numbers obey the bounds of 7.1(b) (bounded corrections do not change Lelong numbers). The
local Bergman approximants are subadditive, `φ_{m₁+m₂} ≤ (m₁φ_{m₁} + m₂φ_{m₂})/(m₁ + m₂) + C/(m₁ + m₂)` on a fixed ball (the
Ohsawa–Takegoshi theorem 4.1 on `B_j × B_j`, extending from the diagonal); since the balls of the gluing change with `m`,
this does not give a monotone subsequence of the glued functions (for `φ = 0`, the centre values at levels `m` and `2m` on
discs of radii `a` and `a³` differ by `(log(1/a) + ½log π)/m`), and none is asserted.

*Needs:* 7.1, 4.1; 0.1, 0.4.

### 7.4 Smooth regularisation with a loss controlled by Lelong numbers at a scale

Prove: let `X` be compact with hermitian metric `ω`, and `α, γ, φ` as in 7.3. Fix a finite atlas of coordinate balls;
for `x ∈ X` and `0 < r < r₀` let `λ_r(x) = (sup_{B(x,r₀)}φ − sup_{B(x,r)}φ)/log(r₀/r)`, the *Lelong number of `φ` at
scale `r`* (balls in a chart at `x`). It tends to `ν(φ, x)` as `r ↓ 0` (1.1(b)) but need not be monotone (fourth Check);
the same secant for the local plurisubharmonic potential `φ + c|z − x|²` (with `c` depending on `α`, the atlas and the lower
bound of `γ`), whose supremum over `B(x, t)` is a convex nondecreasing function of `log t` (1.1), is nonincreasing as `r ↓ 0`
and differs from `λ_r(x)` by at most `c·r₀²/log(r₀/r)`. Then there are a
constant `C`, depending only on `(X, ω, α)`, the atlas, `r₀` and a lower bound for `γ`, and smooth functions `φ_r` on `X`,
`0 < r < r₀/2`, decreasing to `φ` as `r ↓ 0`, with `φ ≤ φ_r ≤ sup_{B(x,ar)}φ + Cr` and
`α + i∂∂̄φ_r ≥ γ − (C·λ_r + ε_r)ω`, where `ε_r ≤ C·(m_γ(Cr) + r + r₀²/log(r₀/r))`, `m_γ` the modulus of continuity of `γ`
(with respect to `ω` and the atlas). Moreover, if `φ` is of class `C²` on an open set `U`, then on compact subsets of `U`,
for small `r`, `φ_r` is the convolution of `φ` at scale `r` (plus `Cr²`) and converges to `φ` in `C²`. Here `a = 2A`, with
`A ≥ 1` such that `A^{−2}ω_eucl ≤ ω ≤ A²ω_eucl` in every chart of the atlas, so that the `ω`-ball of radius `t` at `x` lies in
the chart ball of radius `At(1 + Ct)`; `a = 2` is not enough for arbitrary charts (third Check). In particular, if
all Lelong numbers of `φ` vanish uniformly at scale `r` (`sup_x λ_r(x) → 0`, for instance `φ` continuous), the loss of
positivity tends to zero. If `γ` is Lipschitz with constant `L_γ` (with respect to `ω` and the atlas; for instance `γ` of
class `C¹`), then `m_γ(t) ≤ L_γ·t` and `ε_r ≤ C(1 + L_γ)/log(r₀/r)`; for the means of the route the dependence on `L_γ` cannot be
replaced by one on a lower bound of `γ` (fifth Check). For `γ = 0`, `ε_r ≤ C(r + r₀²/log(r₀/r))`.

*Route.* The regularisation is Demailly's (J.-P. Demailly, *Regularization of closed positive currents and intersection
theory*, 1992). His estimate bounds the loss of positivity of `φ_r = Φ(·, r) + Kr²` (below) by a constant times the
logarithmic scale derivative of the corrected mean `Φ(x, t) + Kt²` at `t = r`, plus a term `O(r)` and the modulus of
continuity of `γ` at scale `Cr`. The statement above, with the chart secant `λ_r(x)` in place of that scale derivative and
with the stated dependence of `C` and range of `r`, is derived from that estimate by the convexity in `log t` of the
corrected mean and a comparison of the `exph`-balls with the chart balls (radii scaled by `A`); for it the proof is not
given here. The method: `Φ(x, t)` is
the mean of `φ` over the image of the ball of radius `t` of `(T_xX, ω_x)` under Demailly's modified exponential map `exph_x`
of the Chern connection of `(TX, ω)` (the part of the Taylor expansion of its exponential map at the zero section that is
holomorphic in the fibre variable), against a fixed smooth radial kernel supported in the unit ball; `Φ` is smooth in `x`
for `t > 0`, the corrected mean `Φ(x, t) + Kt²` is nondecreasing in `t` and tends to `φ(x)` as `t → 0`, and Demailly's Hessian
estimate for `(x, w) ↦ Φ(x, |w|)` on `X × {0 < |w| < r₀}` bounds the loss of positivity of `α + i∂∂̄` by a constant, depending
on the curvature of `TX`, times the scale derivative of the corrected mean, plus `O(|w|)`. Then `φ_r = Φ(·, r) + Kr²`, the
estimate restricted to the slice `|w| = r`; `γ` and `α` enter through their means at scale `r` (errors `m_γ(Cr)·ω` and
`O(r)`). The scale derivative in that estimate is that of the CORRECTED mean, the raw one `∂Φ/∂log t` being negative for
`φ = −|z|²` (second Check); likewise monotonicity in `r` belongs to the corrected secant, not to `λ_r` itself (fourth
Check). The bounds `φ ≤ φ_r ≤ sup_{B(x,ar)}φ + Cr` follow from the monotonicity of the corrected mean and the support of the
kernel. Where `φ` is `C²`, `φ_r` is its convolution at scale `r` plus `Kr²`, which
converges in `C²` on compact subsets. No infimum over scales is taken: an infimum of `Φ(x, t) + c·log(r/t)` over `t < r` is
`−∞` at points where `ν(φ, x) > c`, and may be finite where `ν(φ, x) = c` (for `φ = c·log|z − x|` near `x` it does not depend
on `t`).

*Needs:* 0.1–0.4; 1.1; ComplexKahlerGeometry K4 (Chern connection of `TX`).

**Checks.**

- The loss cannot be removed: on the blow-up of `ℙ²` at a point (2.6's check), a metric on `L = O(H + E)` with
  `iΘ ≥ εω` has Chern current `a[E] + R` with `R ≥ 0` of class `H + (1 − a)E`; `R·E = a − 1 > 0` forces `a > 1`, so its
  weight has Lelong number `2a > 2` along `E`; and there is no smooth metric with `iΘ ≥ −δω` for small `δ`.
- The raw mean is not monotone: in a flat chart of `ℂ` with `φ = −|z|²` near `0` (`α = 0`, `γ = −i∂∂̄|z|²`), the mean at scale `t`
  is `Φ(0, t) = −m₂t²`, `m₂ = ∫|w|²ρ(w)dλ > 0` (`m₂ = 1/4` for `ρ ∝ (1 − |w|²)²`), decreasing in `t`; `Φ(0, t) + m₂t²` is constant.
- The radius `ar`: on a flat complex torus with a coordinate `w` that is unitary for `ω`, take the chart `z = Mw` and a
  quasi-plurisubharmonic `φ` equal to `log|w|` near `0`. The mean at metric scale `r` is `log r + c_ρ`, `c_ρ = ∫log|w|·ρ(w)dλ < 0`
  (`c_ρ = −11/12` for `ρ ∝ (1 − |w|²)²`), while `sup_{|z|<2r}φ = log r + log(2/M)`; for `M > 2e^{−c_ρ}` (about `5.0` for that `ρ`)
  a bound `φ_r ≤ sup_{|z|<2r}φ + Cr` fails by a fixed amount for all small `r`. Here `A = M` and `a = 2M` works.
- `λ_r` is not monotone: for `φ = ν·log|z| − b|z|²` near `0` (`ν, b > 0`, `r₀² < ν/2b`), `sup_{|z|<t}φ = ν·log t − bt²` and
  `λ_r(0) = ν − b(r₀² − r²)/log(r₀/r)`, which increases to `ν` as `r ↓ 0` (`0.73, 0.85, 0.94` at `r = 1/4, 1/10, 1/100` for
  `ν = b = 1`, `r₀ = 1/2`); for the potential `φ + b|z|²` the secant is `ν` for every `r`.
- The modulus of continuity in `ε_r`: on a flat torus with a unitary coordinate, let `f` be a smooth compactly supported
  radial function equal to `|z|²` near `0`, `φ_d = d²f(z/d)`, `α = 0` and `γ_d = i∂∂̄φ_d = (i∂∂̄f)(z/d)`, which have a common
  lower bound. At `r = √d` the chart balls `B(0, r) ⊂ B(0, r₀)` both contain the support of `φ_d`, so `λ_r(0) = 0`; the
  mean of `φ_d` at scale `r` (here a convolution) has Laplacian `d²r^{−2}∫Δf(u)·ρ(du/r)dλ(u) = O(d⁴/r⁴) = O(d²)` at `0` (as
  `∫Δf = 0`; `−6.5·10^{−3}, −6.5·10^{−5}` at `d = 10^{−2}, 10^{−3}` for `ρ ∝ (1 − |w|²)²`), while `γ_d(0) = i∂∂̄|z|²`. So the loss at
  `0` stays of size one while `1/log(1/r) → 0`; it is accounted for by `m_{γ_d}(Cr)`, of size one at the scale `Cr ≫ d`, and
  `L_{γ_d}` is of order `1/d`.

### 7.5 Regularisation in Kähler classes and on Stein manifolds

Prove: (a) if `(X, ω)` is compact Kähler, every `ω`-plurisubharmonic function is the limit of a decreasing sequence
of smooth `ω`-plurisubharmonic functions; (b) on a Stein manifold every plurisubharmonic function is the limit of a
decreasing sequence of smooth strictly plurisubharmonic functions.

*Route.* (a) A known theorem (Błocki and Kołodziej); the following route proves it. Normalise `u ≤ −1`. *Two charts.*
Let `Ψ` be plurisubharmonic near `B̄(x, R) ⊂ ℂ^n`, `S(t) = sup_{B(x,t)}Ψ`, `4r ≤ R`, and `μ` a probability measure on
`B(x, r)` with density at most `D` times that of the normalised Lebesgue measure of `B(x, r)`. For `y ∈ B(x, r)` the
sub-mean-value inequality (0.2(a)) on `B(y, 2r) ⊃ B(x, r)`, applied to `S(4r) − Ψ ≥ 0`, gives
`S(4r) − Ψ(y) ≥ 4^{−n}(S(4r) − mean_{B(x,r)}Ψ)`, so `S(4r) − D·4^n·(S(4r) − S(r)) ≤ ∫Ψ dμ ≤ S(r)`; and `S` is convex and
nondecreasing in `log t` (1.1), so `S(4r) − S(r) ≤ log 4·(S(R) − S(r))/log(R/r)`. On charts `U_j` with `ω = i∂∂̄g_j`, the
CENTRED convolution `(u + g_j) ∗ ρ_ε − g_j` (0.3(a)) of chart `j`, read in chart `i` at a point `x`, is
`∫(u + g_i)dμ − g_i(x)` for such a `μ` with `r = Cε`, up to `Cε` (the smooth `g_j − g_i` has `∫(g_j − g_i)dμ = (g_j − g_i)(x) + O(ε)`),
and so is that of chart `i`; the raw convolutions `(u + g_j) ∗ ρ_ε` and `(u + g_i) ∗ ρ_ε` differ by about `(g_j − g_i)(x)`, which
need not be small. Hence for BOUNDED `u` the centred functions `(u + g_j) ∗ ρ_ε − g_j` of two charts differ by at most `C·(osc u + 1)/log(1/ε) + Cε` on compact parts of the overlap. (At a logarithmic pole they
need not be close: second Check.) *Bounded `u`: for every continuous `h > u` there is a smooth `ω`-plurisubharmonic `w`
with `u < w < h`.* Take finitely many charts with open sets `V̄_j ⊂ W′_j`, `W̄′_j ⊂ W_j`, `W̄_j ⊂ U_j`, `⋃_jV_j = X`, smooth
`θ_j ≤ 0` near `W̄_j`, equal to `0` on `V_j` and `≤ −1` on `W_j ∖ W′_j`, with `i∂∂̄θ_j ≥ −bω`; put
`v_j = (u + g_j) ∗ ρ_ε − g_j + δθ_j` on `W_j` (so `ω + i∂∂̄v_j ≥ −δbω`, and `v_j ≥ u` on `V_j`) and `v = M_η((v_j)_{j : x∈W_j})`,
`M_η` a regularised maximum of several arguments (smooth, convex, nondecreasing in each argument, `M_η(t + c) = M_η(t) + c`
for constants `c`, `max ≤ M_η ≤ max + η`, unchanged when an argument at least `2η` below the maximum of the others is
omitted). If `4η < δ` and the bound above is `< δ/2`, then on `W_j ∖ W′_j` the argument `v_j` lies `δ/2` below `v_i` for an
`i` with `x ∈ V_i`, so `v` is smooth; `ω + i∂∂̄v ≥ −δbω` and `v ≥ u`. With `c₀ = min_X(h − u) > 0` (a positive lower
semicontinuous function on a compact space), for small `ε` every `(u + g_j) ∗ ρ_ε − g_j < h − c₀/2` on `W̄_j` (these continuous
functions decrease to `u` as `ε ↓ 0`, and the compact sets where they are `≥ h − c₀/2` decrease to the empty set), so
`v < h − c₀/2 + η`. For small `ε, η` also `v < 0`, so `w = v/(1 + δb)` is `ω`-plurisubharmonic with
`u ≤ v ≤ w ≤ v + δb·sup|v|`, and for small `δ, η` the function `w + c₀/8` is as required. *General `u`.* `u_k = max(u, −k)`
is bounded, `ω`-plurisubharmonic (0.4(a)) and decreases to `u`. Choose continuous `f_k ↓ u` (`u` is upper semicontinuous on a
compact metric space) and put `h_k = max(f_k, −k) + 1/k`: continuous, `> u_k`, nonincreasing in `k` and tending to `u`. Take
`w_1` for `(u_1, h_1)` and `w_{k+1}` for `(u_{k+1}, min(h_{k+1}, w_k))`, admissible since `w_k > u_k ≥ u_{k+1}`; then
`w_{k+1} < w_k` and `u ≤ u_k < w_k < h_k → u`. (b) A known theorem
(Fornæss–Narasimhan, for Stein spaces). Let `ψ` be a smooth strictly plurisubharmonic exhaustion (RealAnalyticGeometry
R3.0), `X_k = {ψ < k}`, and `B` a smooth convex function on `ℝ` with `B′ ≥ 1` and `B(t) ≥ sup_{X_{t+1}}φ + 1` (the right
side is finite and nondecreasing in `t`, so such a convex majorant exists); then `B ∘ ψ` is smooth, strictly
plurisubharmonic, and `≥ φ + 1`. The construction of (a) (the comparison of two charts, the gluing for the bounded
truncations `max(φ, −j)` and the inductive choice) applies verbatim on the relatively compact `X_{k+2}`, covered by finitely
many charts of `X_{k+3}`, with `g_j = 0`, `i∂∂̄ψ` in place of `ω` in the bound for the `θ_j`, and without the final
division: with `δ = ε_j/b` at the `j`-th step it gives smooth `u_j ↓ φ` on a neighbourhood of `X̄_{k+1}` with
`i∂∂̄u_j ≥ −ε_j·i∂∂̄ψ`, `ε_j ↓ 0` (the loss comes only from the gluing), and `u^{(k)}_j = u_j + 2ε_j(ψ − inf ψ)` are smooth,
strictly plurisubharmonic and still decrease to `φ`. Choose by induction on `k`, by Dini's argument on compact sets (a
decreasing sequence of continuous functions with upper semicontinuous limit `φ` eventually lies below any continuous
function `> φ`), `w_k = u^{(k)}_{j_k} + 2^{−k}` with (i) `w_k ≤ B ∘ ψ` on `X̄_{k+1}`, (ii) `w_{k+1} ≤ w_k` on `X̄_{k+1}`, (iii)
`w_k ≤ u^{(i)}_k + 2^{1−k}` on `X̄_i` for every `i ≤ k`; then `w_k > φ` and `w_k → φ` pointwise. Let `M_η` be a regularised
maximum (smooth, convex, nondecreasing in each argument and in `η`, `max ≤ M_η ≤ max + η`, equal to `max` when the arguments
differ by at least `η`), `η_k ≤ ½` decreasing to `0`, `χ_k(t) = B(t) + t − k`, and `v_k = M_{η_k}(w_k, χ_k ∘ ψ)` on `X_{k+1}`,
`v_k = χ_k ∘ ψ` elsewhere. On `{ψ ≥ k + ½}` the second argument exceeds the first by at least `ψ − k ≥ ½` (by (i)), so the two
definitions agree near the boundary of `X_{k+1}` and `v_k` is smooth and strictly plurisubharmonic on `X`. The sequence
decreases: on `{ψ ≤ k + ½}` by (ii), `χ_{k+1} ≤ χ_k` and the monotonicity of `M`; on `{k + ½ ≤ ψ ≤ k + 3/2}`, where
`v_k = B ∘ ψ + ψ − k`, because `v_{k+1} ≤ max(w_{k+1}, χ_{k+1} ∘ ψ) + ½ ≤ B ∘ ψ + max(0, ψ − k − 1) + ½`; on
`{ψ ≥ k + 3/2}`, `v_{k+1} = χ_{k+1} ∘ ψ ≤ χ_k ∘ ψ = v_k`. It converges to `φ`: `v_k ≥ max(w_k, χ_k ∘ ψ) > φ`, and at a fixed `x`, `v_k(x) ≤ max(w_k(x), χ_k(ψ(x))) + η_k` with
`χ_k(ψ(x)) → −∞`. Alternatively, embed `X` as a closed submanifold of `ℂ^N` with a holomorphic retraction of a neighbourhood
and convolve there.

*Needs:* 0.1–0.4, 1.1; RealAnalyticGeometry R3.0.

**Checks.**

- On `ℙ¹` with `ω_FS` of mass one, `u = log(|z₀|²/(|z₀|² + |z₁|²))` satisfies `2πω_FS + i∂∂̄u = 2π[z₀ = 0] ≥ 0`: it is
  `2πω_FS`-plurisubharmonic (not `ω_FS`-plurisubharmonic), and it is the decreasing limit of
  `log((|z₀|² + ε|z₁|²)/(|z₀|² + |z₁|²))`, each `2πω_FS`-plurisubharmonic.
- Why (a) truncates first: for `u = log|z|²` and the charts `z` and `w = 2z` near `0`, the convolutions at radius `ε` at the
  origin are `2 log ε + c_ρ` and `2 log ε + c_ρ − log 4`, which differ by `log 4` for every `ε` (in the route, `S(4r) − S(r)`
  is `log 16` there); for the bounded `max(log|z|², −k)` both are `−k` once `ε ≤ e^{−k/2}`.

### 7.6 Richberg's approximation

Prove: a continuous strictly plurisubharmonic function `u` on a complex manifold (0.1) is, for every continuous
`δ > 0`, uniformly `δ`-close to a smooth strictly plurisubharmonic function `v ≥ u`.

*Route.* Local convolutions plus a small multiple of a local strictly plurisubharmonic function, glued by
regularised maxima on a locally finite cover.

*Needs:* 0.1, 0.3.

### 7.7 Regularisation of log-log singular semipositive metrics

Prove: let `X̄` be compact Kähler with Kähler form `ω`, `D = Σ_j D_j` a nonempty simple normal crossings divisor (for
`D = ∅` a smooth function `φ` with `γ + i∂∂̄φ ≥ 0` is its own regularisation, `φ_t = φ`) with metrised
canonical sections `s_j`, `|s_j| < 1/2`, `|s|² = ∏_j|s_j|²`, `ω_P` a Poincaré-type metric along `D` (5.5), and `γ` a smooth
closed real `(1,1)`-form on `X̄` (typically `γ = iΘ_{h₀}` for a smooth metric `h₀` on a line bundle `L` on `X̄`, and then
`h = e^{−φ}h₀` below is a metric on `L|_{X̄∖D}`). Let `φ` be of class `C²` on `X̄ ∖ D` with `−C·log log(1/|s|²) ≤ φ ≤ C` and
`γ + i∂∂̄φ ≥ 0` on `X̄ ∖ D` (*log-log singular and semipositive*). Then:

(a) `φ` extends to a `γ`-plurisubharmonic function on `X̄` with zero Lelong numbers, and `γ + i∂∂̄φ` is the extension by
zero of its restriction to `X̄ ∖ D`;

(b) there are smooth functions `φ_t` on `X̄`, `0 < t < t₀`, decreasing to `φ` as `t ↓ 0`, with `φ ≤ φ_t ≤ C`,
`φ_t ≥ −C·log log(1/t)`, `γ + i∂∂̄φ_t ≥ −ε(t)ω` with `ε(t) ≤ C·log log(1/t)/log(1/t)`, `φ_t → φ` in `C²` on compact
subsets of `X̄ ∖ D`, and boundary rate `δ(t) = sup_{X̄∖D}(φ_t − φ)/log(1/|s|²) → 0`;

(c) if moreover `|dφ|_ω ≤ C·(log(1/|s|²))^C/|s|` on a neighbourhood of `D` (for instance `|∂φ|_{ω_P} ≤ C`, in particular `h`
good relative to `L`, 5.3(d)), then `δ(t) ≤ C·log log(1/t)/log(1/t)`, and the regularisation is close to `φ` away from the
boundary: `φ_t ≤ φ + C·t^{1/3}` on `{|s|² ≥ t}`;

(d) (*pull-back*) let `h : X̄′ → X̄` be a holomorphic map from a compact Kähler manifold `(X̄′, ω′)` mapping no connected
component of `X̄′` into `D`, and `D′` a nonempty simple normal crossings divisor on `X̄′` whose support contains `h^{−1}(D)`,
with metrised canonical sections `s′_j` of its components, `|s′_j| < 1/2`, `|s′|² = ∏_j|s′_j|²`; let `m` be the largest
multiplicity of a component of `D′` in the divisor `h^*D`. Then `(h^*γ, φ∘h)` is log-log singular and semipositive along
`D′`. Let `(φ_t)_{0<t<t₀}` be ANY family of smooth functions on `X̄` with `φ ≤ φ_t ≤ C` on `X̄ ∖ D` and `γ + i∂∂̄φ_t ≥ −ε(t)ω` for
a function `ε(t) ≥ 0` (the families of (b), the families of 7.8, whose loss is a constant, and families that converge to `φ`
only locally uniformly are all of this kind). Then the `φ_t∘h` are smooth functions on `X̄′` with `φ∘h ≤ φ_t∘h ≤ C` and loss
`h^*γ + i∂∂̄(φ_t∘h) ≥ −C_h·ε(t)ω′`, where `h^*ω ≤ C_hω′`; they decrease as `t ↓ 0` if the `φ_t` do; a lower bound
`φ_t ≥ −C·log log(1/t)` is kept; convergence `φ_t → φ` locally uniformly, or in `C²`, on compact subsets of `X̄ ∖ D` gives the
same convergence `φ_t∘h → φ∘h` on compact subsets of `X̄′ ∖ D′`; and the boundary rate of `φ_t∘h` along `D′` (with the
denominator `log(1/|s′|²)` or `1 + log(1/|s′|²)`) is at most `C·δ(t)`. In particular, for a family of (b) the `φ_t∘h` have the
properties of (b) along `D′`, with loss `C_h·ε(t)` and boundary rate at most `C·δ(t)`. *Closeness.* If `φ_t ≤ φ + E(t)` on
`{|s|² ≥ t}` for some function `E`, then `φ_{c₀t^m}∘h ≤ φ∘h + E(c₀t^m)` on `{|s′|² ≥ t}` (for `c₀t^m < t₀`), with a constant
`0 < c₀ ≤ 1` depending on `h` and the metrics; for `E(t) = C·t^{1/3}` as in (c) this is `≤ C·t^{m/3}`, and for
`E(t) = C·log log(1/t)/log(1/t)` and `m ≥ 1` it is `≤ E(t)` once `t ≤ e^{−e}`. The reparametrised family `φ_{c₀t^m}∘h` is again
decreasing if the `φ_t` are, with loss `C_h·ε(c₀t^m)`; IF the original family satisfies `φ_t ≥ −C·log log(1/t)` (as the families
of (b) do), the reparametrised family satisfies `φ_{c₀t^m}∘h ≥ −C·log log(1/t) − C`. Without that hypothesis neither the family
nor its reparametrisation need have a lower bound of this form, whatever `C` (fourth Check). When `h` is a submersion and
`D′ = h^{−1}(D)` (for instance a projective bundle over `X̄`, or a fibre product of projective bundles over `X̄`), `m = 1`; if
moreover the sections of `D′` and their metrics are pulled back from `X̄`, so that `|s′|² = |s∘h|²`, no reparametrisation is
needed, and otherwise the closeness holds after `t ↦ c₀t`. (If `h^{−1}(D)` is empty, then `m = 0`, `φ∘h` is of class `C²` on
`X̄′`, the `φ_t∘h` converge to it in `C²` when the `φ_t` converge in `C²` on compact subsets of `X̄ ∖ D`, and no
reparametrisation is used: `h(X̄′)` is a compact subset of `X̄ ∖ D`, contained in `{|s|² ≥ t₁}` for some `t₁ > 0`, so
`φ_t∘h ≤ φ∘h + E(t)` on all of `X̄′` for `t < t₁`; the parameter `c₀t^m = c₀` would not tend to `0`.)

*Route.* (a) `γ + i∂∂̄φ ≥ 0` off `D` and `φ ≤ C` give the extension across the pluripolar set `D` (0.5; on a connected adapted
polydisc `log|z₁⋯z_k|²` is a witness, not `≡ −∞` there); the Lelong
numbers vanish because `φ ≥ −C·log log(1/|s|²)` is `o(log|s|)` (1.1(b)); the current has no mass on `D` by 2.5's argument
on discs transverse to `D` and Skoda–El Mir (ComplexComparisonPartII C5.4). (b) Apply 7.4 to `φ` with the smooth closed
form `γ` of 7.7 in the role of 7.4's `α` and the lower bound `0`, and put `φ_t = φ_r` for `r = t`. The Lelong number at scale `r` is uniformly small: `sup_{B(x,R)}φ ≤ C`, and `B(x, r)` contains
a ball of radius `r/C₀` of an adapted polydisc chart (`D = {z₁⋯z_k = 0}`, `k ≤ n`; finitely many such charts, by compactness),
in which the point `y` obtained from `x` by moving each `z_j`, `j ≤ k`, by `r/(2√n·C₀)` in the direction of `z_j(x)` (any
direction if `z_j(x) = 0`) has `|z_j(y)| ≥ r/(2√n·C₀)` for `j ≤ k`, hence `|s(y)|² ≥ c·r^{2k}`. (A point at distance `≥ r/2`
from every component through `x` need not exist: at a crossing of five coordinate hyperplanes it would have
`|z|² ≥ 5r²/4 > r²`.) So `sup_{B(x,r)}φ ≥ −C·log log(1/r) − C`; hence `λ_r(x) ≤ C·log log(1/r)/log(1/r)`, and since the lower bound `0` of 7.4's
`γ` has modulus of continuity `0`, 7.4 gives `ε_r ≤ C(r + r₀²/log(r₀/r)) ≤ C/log(1/r)`, so the loss `C·λ_r + ε_r` is at
most `C·log log(1/r)/log(1/r)`. The upper bound comes from `φ_r ≤ sup_{B(x,ar)}φ + Cr ≤ C`; the lower bound from the construction of 7.4 (`φ_r ≥ Φ(x, r)`, the mean of
`φ` at scale `r`, and the mean of `−C·log log(1/|s|²)` over a ball of radius `r` is `≥ −C·log log(1/r) − C`); `C²`
convergence off `D` is the last clause of 7.4. For the boundary rate: on
`{|s|² < τ}`, `0 ≤ φ_t − φ ≤ C + C·log log(1/|s|²)`, so the ratio is at most `C·log log(1/τ)/log(1/τ)`; on the compact
`{|s|² ≥ τ}` it tends to `0`. (c) `|s|` is Lipschitz, so for `x` with `|s(x)|² ≥ t` and `t` small every `y ∈ B(x, at)` has
`|s(y)| ≥ |s(x)|/2` (`a` the constant of 7.4), and the gradient bound gives
`sup_{B(x,at)}φ − φ(x) ≤ at·C(log(4/|s(x)|²))^C·2/|s(x)| ≤ C·t^{1/2}(log(1/t))^C ≤ C·t^{1/3}`; with
`φ_t ≤ sup_{B(x,at)}φ + Ct` this is the closeness, and the ratio of `δ(t)` there is `O(t^{1/3})`; for `|s(x)|² < t` the bound
of (b) gives `C·log log(1/t)/log(1/t)`. The Poincaré bound implies the hypothesis: near a point where
`D = {z₁⋯z_k = 0}`, `|∂φ|_{ω_P} ≤ C` gives `|dφ|_ω ≤ C·Σ_j 1/(|z_j|·log(1/|z_j|)) ≤ C/|s|`, since `|s| ≤ C|z_j|` for each `j`.
(d) In polydisc coordinates where `D′ = {z₁⋯z_k = 0}`, `s∘h` is a unit times `∏_i z_i^{m_i}` with `0 ≤ m_i ≤ m`, so by
compactness `|s∘h|² ≥ c₀|s′|^{2m}`, that is, `log(1/|s∘h|²) ≤ m·log(1/|s′|²) + C`; as `log(1/|s′|²) ≥ log 4`, this gives
`log(1/|s∘h|²) ≤ C·log(1/|s′|²)` and `log log(1/|s∘h|²) ≤ log log(1/|s′|²) + C`. Holomorphic pull-back preserves
semipositivity of `(1,1)`-forms, so `h^*γ + i∂∂̄(φ∘h) = h^*(γ + i∂∂̄φ) ≥ 0` off `D′` and
`h^*γ + i∂∂̄(φ_t∘h) ≥ −ε(t)·h^*ω ≥ −Cε(t)ω′` (`h^*ω ≤ Cω′` on the compact `X̄′`). The growth bounds and
`φ_t∘h − φ∘h ≤ δ(t)·log(1/|s∘h|²) ≤ Cδ(t)·log(1/|s′|²)` follow from this comparison (likewise with `1 + log`). Since
`h^{−1}(D) ⊆ D′`, `h` maps compact subsets of `X̄′ ∖ D′` to compact subsets of `X̄ ∖ D`; locally uniform convergence of the
`φ_t` there gives that of the `φ_t∘h`, and `C²` convergence gives `C²` convergence by the chain rule. These steps use of the
family only the bounds `φ ≤ φ_t ≤ C`, its loss and pointwise composition, which is why (d) holds for arbitrary families.
Closeness: `{|s′|² ≥ t} ⊆ {|s∘h|² ≥ c₀t^m}` (decreasing `c₀` to make `c₀ ≤ 1`), which is where the closeness of `φ_{c₀t^m}`
holds; since `φ_t` decreases as `t ↓ 0`, a factor `c₀ < 1` cannot be dropped from the parameter. For
`E(t) = C·log log(1/t)/log(1/t)`, put `x = log(1/t) ≥ e` and `x′ = log(1/(c₀t^m)) = m·x + log(1/c₀) ≥ x` (`m ≥ 1`); `y ↦ log y/y`
decreases on `[e, ∞)`, so `E(c₀t^m) ≤ E(t)`; and, when `φ_t ≥ −C·log log(1/t)`, the bound `φ_{c₀t^m} ≥ −C·log x′` with
`log x′ ≤ log x + log(m + log(1/c₀))` gives the lower bound of the reparametrised family. For a submersion `h` with `D′ = h^{−1}(D)`, `h^*D` is reduced (`m = 1`), and `c₀ = 1` when
`|s′|² = |s∘h|²`.

*A second route for (b)–(c), without 7.4.* It gives *almost monotone* families, `φ_t ≤ φ_{t′} + C·ε(t′)` for `t ≤ t′`, in
place of decreasing ones. In a polydisc chart of radius `2` adapted to `D` (`D = {z₁⋯z_k = 0}`) write `γ = i∂∂̄q` with `q`
smooth, `u = q + φ` (plurisubharmonic off `D`, `−C·log log(1/|s|²) ≤ u ≤ C`) and `S(z, r) = sup_{P(z,r)}u` over the polydisc of
radius `r`. By Hadamard's three-circle theorem on polydiscs, `S(z, r)` is convex and nondecreasing in `log r`. Every
`P(z, t/16)` with `|z| < 5/4` contains a point at distance `≥ t/32` from the coordinate hyperplanes, where
`u ≥ −C·log log(1/t)`, and `S(z, 1/4) ≤ C`; convexity then gives `S(z, 2t) − S(z, t/8) ≤ ε_C(t) = C·log log(1/t)/log(1/t)`.
Let `w_t` be the plurisubharmonic extension across `D` (0.5) of `max(u, −C′·log log(1/t))`, with `C′` so large that `S` is
unchanged for radii `≥ t/16`, and `ρ_t` a radial mollifier supported in `P(0, t)` with `ρ_t ≤ b·t^{−2n}`. At a point
`x ∈ P̄(z, t/4)` where `w_t` is maximal, `P(z, t) ⊆ P(x, 3t/2) ⊆ P(z, 2t)`, and the sub-mean-value inequality on `P(x, 3t/2)`
(0.2) gives `S(z, 2t) − (ρ_t ∗ w_t)(z) ≤ π^n(3/2)^{2n}b·(S(z, 2t) − S(z, t/4))`. So `ρ_t ∗ w_t` is smooth and plurisubharmonic,
`≥ u`, and `S(z, t) − K·ε_C(t) ≤ ρ_t ∗ w_t ≤ S(z, t)`; as `S(z, t)` increases with `t`, these local functions are almost
monotone. Away from `D` use plain convolution (0.3). Glue the functions `ρ_t ∗ w_t − q` of a finite atlas by a regularised
maximum with cut-off corrections of size `K·ε(t)`, as in 7.3 and 7.5(a): on an overlap the local functions differ by
`O(ε(t))`, because a polydisc of one chart lies between polydiscs of comparable radii of the other and the three-circle
bound applies; the gluing produces the loss `C·ε(t)·ω`, and adding `K·ε(t)` restores `φ ≤ φ_t`. Under the gradient hypothesis
of (c), `S(z, 2t) ≤ u(z) + C·t^{1/3}` on `{|s|² ≥ t}` as in the first route, which gives the bound on `δ(t)` of (c) and
`φ_t ≤ φ + C·t^{1/3} + C·ε(t)` on `{|s|² ≥ t}`; the clause of (c) with `t^{1/3}` alone comes from the first route. The
routes of 7.8 work for almost monotone families with `φ_{t₀} + C·ε(t₀)` in place of `φ_{t₀}`; exact monotonicity, which
limits of intersection numbers along monotone regularisations use, comes from the first route.

*Needs:* 0.1–0.5, 1.1, 2.5, 5.1, 5.3, 5.5, 7.3, 7.4, 7.5; ComplexComparisonPartII C5.4.

**Checks.**

- The punctured disc with `φ = −log log(1/|z|²)` (the Hodge-line weight near a cusp, up to a constant): `C²` off `0`,
  `→ −∞` like `−log log`, Lelong number `0`, and `|∂φ|_{ω_P}` bounded, so (c) applies.
- (d) for the projection `h : X̄ × F → X̄`, `F` compact Kähler: `D′ = D × F`, `s∘h` is the canonical section of `D′` with the
  pulled-back metrics, `m = 1`, `h^*ω ≤ ω + ω_F`, and every bound of (b), (c) holds for `φ_t∘h` with the same constants.
  For the map `h(z) = z²` of the disc, `D = {0}`, `m = 2`: `|s∘h|² = |z|⁴`, and the closeness of `φ_t` on `{|s|² ≥ t}` controls
  `φ_t∘h` only on `{|z|² ≥ t^{1/2}}`; on `{|z|² ≥ t}` it controls `φ_{t²}∘h`, which is why (d) reparametrises by `t ↦ c₀t^m`.
- Truncation by constants regularises the model weight but not every log-log weight. `φ = −log log(1/|z|²)` increases
  with `|z|`, so the constant `−log log(1/t)` dominates it on `{|z|² ≤ t}`, and a regularised maximum of `φ` and that
  constant is smooth and subharmonic near `0` and decreases to `φ` as `t ↓ 0`. On the bidisc with `D = {z₁ = 0}` and `γ = 0`,
  `φ = |z₁|^{1/2} + Re z₂` is log-log singular and semipositive (`Δ|z₁|^{1/2} = |z₁|^{−3/2}/4 > 0` off `D`), and for every
  constant `c` a regularised maximum of `φ` and `c` equals `φ` near the points of `D` with `Re z₂` larger than `c` plus the
  parameter of the maximum, where `φ` is not differentiable. The uniform estimates (b)–(d) for all log-log weights come
  from the convolution of 7.4.
- The lower bound in (d) is inherited, not produced. On `ℙ¹` with `D` one point, a Fubini–Study metric on `O(D) = O(1)` with
  curvature form `γ > 0`, its canonical section scaled so that `u = |s|² < 1/4`, and `φ = −log(e + log(1/u))`, take the smooth
  functions `φ_t = −log(e + L_t)`, `L_t = log(1/(u + η_t)) > 0`, `η_t = exp(−exp(1/t))`. Locally `u = |σ|²e^{−a}` with `σ` an
  equation of `D` and `i∂∂̄a = γ`; off `D`, with `ξ = ∂log u`, `i∂∂̄log(u + τ) = (uτ/(u + τ)²)·iξ ∧ ξ̄ − (u/(u + τ))·γ` for `τ ≥ 0`
  (expand `∂∂̄u = u(∂∂̄log u + ∂log u ∧ ∂̄log u)`), so `i∂∂̄φ_t ≥ −γ/(e + L_t) ≥ −γ/e`: the `φ_t` are `γ`-plurisubharmonic (zero
  loss), and so is `φ` (`τ = 0`), which is log-log singular. They satisfy `φ ≤ φ_t ≤ C`, decrease to `φ` as `t ↓ 0`, and `0 ≤ φ_t − φ ≤ log(1 + η_t/u) ≤ η_t/t` on `{u ≥ t}`; but at
  the point of `D`, `φ_t = −log(e + exp(1/t)) = −1/t + o(1)`, below `−C·log log(1/t)` for small `t`. With `h` the identity
  (`m = 1`, `c₀ = 1`), (d) returns this family unchanged.

### 7.8 Mixed Monge–Ampère measures of log-log singular weights: energy, boundary mass, convergence

*Setting.* `X̄` is compact Kähler of dimension `n` with Kähler form `ω`, `D = Σ_j D_j` a simple normal crossings divisor with
metrised canonical sections `s_j`, `|s_j| < 1`, `|s|² = ∏_j|s_j|²`, and `R_s = e + log(1/|s|²) ≥ e`. Forms are normalised as
Chern forms: this target writes `(i/2π)∂∂̄` throughout (so `(i/2π)∂∂̄ log|s|² = [D] − c₁(O(D))` by Poincaré–Lelong), and the
`γ` of a log-log weight below is `1/(2π)` times the `γ` of 7.7, with the same weight `φ`. A *log-log weight* is a pair
`(γ, φ)` of a smooth closed real `(1,1)`-form `γ` and a function `φ` of class `C²` on `X̄ ∖ D` with `γ + (i/2π)∂∂̄φ ≥ 0` there
and `−C·log R_s ≤ φ ≤ C`. A *family of regularisations* of it is a family of smooth functions `φ_t` on `X̄`, `0 < t < t₀`, with
`φ ≤ φ_t ≤ C` on `X̄ ∖ D` and `γ + (i/2π)∂∂̄φ_t ≥ −m·ω` for a constant `m`; it is *`C²`* if `φ_t → φ` in `C²` on compact subsets
of `X̄ ∖ D`, and *monotone* if `φ_t` decreases as `t ↓ 0`; its *boundary rate* is `δ(t) = sup_{X̄∖D}(φ_t − φ)/R_s`. Every
log-log weight has monotone `C²` families: for `D ≠ ∅` by 7.7 (b), applied to `2πγ` (with the sections scaled as there,
`log R_s` and `log log(1/|s|²)` are comparable); for `D = ∅`, where `φ` is only of class `C²` on `X̄` and 7.7's clause for
smooth `φ` does not apply, take smooth `ψ_k` with `‖ψ_k − φ‖_{C²} ≤ 2^{−k}` (in a fixed finite atlas) and `φ_t = ψ_k + 3·2^{−k}`
for `2^{−k−1} < t ≤ 2^{−k}`: then `φ_t − φ ≥ 2^{1−k} > 0`, `ψ_k + 3·2^{−k} − ψ_{k+1} − 3·2^{−k−1} ≥ 3·2^{−k−1} − |ψ_k − ψ_{k+1}| ≥ 0`
(monotone), `φ_t → φ` in `C²`, and the loss is `O(2^{−k})`. Log-log weights and their families pull back to log-log weights and families of the
same kind (monotone, `C²`) along holomorphic maps `h` mapping no component into `D`, for a simple normal crossings divisor
`D′` whose support contains `h^{−1}(D)` (7.7 (d), which applies to every family with `φ ≤ φ_t ≤ C` and a loss, and keeps
monotonicity and `C²` convergence). Denominators of boundary rates: 7.7 divides by `log(1/|s|²)` (with `|s_j| < 1/2`);
`1 + log(1/|s|²)` is also in use. When `D ≠ ∅`, with the sections scaled as in 7.7,
`log(1/|s|²) ≤ 1 + log(1/|s|²) ≤ R_s ≤ C·log(1/|s|²)`, and changing the metrics of the `s_j` changes each denominator by a
bounded amount; so the three rates agree up to constant factors, and a bound on one is a bound on the others. When `D = ∅`,
`|s| = 1`, `log(1/|s|²) = 0` is not a denominator, and `R_s = e`, `1 + log(1/|s|²) = 1` give rates that differ by the factor `e`.

For log-log weights `(γ_i, φ_i)`, `1 ≤ i ≤ n`, with families of regularisations, fix `m′ ≥ m`; the *mixed measures*
(positive, since every factor is `≥ (m′ − m)ω`) are the measures `∏_i(γ_i + m′ω + (i/2π)∂∂̄φ_{i,t_i})`, with any parameters
`t_i`, chosen independently, and with any of the factors replaced by `ω`; the *singular mixed measure* `μ_∞` is the measure
with the density of `∏_i(γ_i + m′ω + (i/2π)∂∂̄φ_i)` on `X̄ ∖ D` and no mass on `D`.

Prove:

(a) (*energy*) Let `ω_1, …, ω_n` be smooth closed semipositive real `(1,1)`-forms on `X̄`, and `ψ : X̄ → [−∞, 0]`
quasi-plurisubharmonic, not `≡ −∞` on any component, with `(i/2π)∂∂̄ψ ≥ −A·ω` as currents. For every `M ≥ 0` and all smooth
`v_i` with `ω_i + (i/2π)∂∂̄v_i ≥ 0` and `sup v_i − inf v_i ≤ M`,
`∫_{X̄}(−ψ)·∏_i(ω_i + (i/2π)∂∂̄v_i) ≤ ∫_{X̄}(−ψ)·∏_iω_i + A·M·Σ_j∫_{X̄}ω ∧ ∏_{i≠j}ω_i`.
The case used below is `ψ = log|s|²` with `Aω ≥ c₁(O(D))`: `∫log(1/|s|²)·∏_i(ω_i + (i/2π)∂∂̄v_i) ≤ C(1 + M)`. No property of
the divisor of `s` is used beyond its being effective.

(b) (*boundary mass*) In the setting of (a) put `r = e − ψ ≥ e` and
`C₀ = e·∫∏_iω_i + ∫(−ψ)·∏_iω_i + A·Σ_j∫ω ∧ ∏_{i≠j}ω_i`. For all `C₁ ≥ 0`, all smooth functions `u_i` on `X̄` with
`ω_i + (i/2π)∂∂̄u_i ≥ 0` and `−C₁·log r ≤ u_i ≤ 0` where `ψ > −∞`, `μ = ∏_i(ω_i + (i/2π)∂∂̄u_i)` and every `R ≥ e`:
`μ({r ≥ R}) ≤ C₀(C₁ + 3)·log R/R` and `∫_{r≥R} log r dμ ≤ 16·C₀(C₁ + 3)·log²R/R` (`{r ≥ R}` contains `{ψ = −∞}`, which is
`μ`-null). For `ψ = log|s|²`, `r = R_s`; then all mixed measures of families of regularisations of log-log weights satisfy
both bounds with one constant, independent of the parameters (it depends on the weights, on the constants `C` and `m` of
the families, in particular on their upper bound `φ_{i,t} ≤ C`, and on `m′`; fourth Check), and so does `μ_∞` if the families are `C²`; and with
`ρ = |s|²`, `μ({|s|² ≤ ρ}) ≤ C′·log log(1/ρ)/log(1/ρ)` for `0 < ρ ≤ e^{−e}`.

(c) (*convergence*) Let the families be `C²` and `μ_t` the mixed measure with all parameters `t_i = t`. For functions `g_t`,
continuous on `X̄ ∖ D` with `|g_t| ≤ C·log R_s` and converging locally uniformly on `X̄ ∖ D` to `g`, the function `g` is
`μ_∞`-integrable and `∫g_t dμ_t → ∫g dμ_∞`; the same holds for the signed forms `∏_i(γ_i + (i/2π)∂∂̄φ_{i,t})` and the signed
singular form (the density of `∏_i(γ_i + (i/2π)∂∂̄φ_i)` on `X̄ ∖ D`). In particular `μ_∞` and the signed singular form have the
cohomological total masses `∫∏_i(γ_i + m′ω)` and `∫∏_iγ_i`.

(d) (*divisors crossing the boundary*) Let the families be monotone and `C²`, and let `v` be a holomorphic section of a line
bundle with a smooth metric, `|v| ≤ 1`, whose divisor `Δ` is smooth and reduced and has no component contained in `D` (for
instance `Δ` meeting `D` with normal crossings). Then `log|v|` is `μ_∞`-integrable and `∫(−log|v|²)dμ_t → ∫(−log|v|²)dμ_∞`,
and the same holds for the signed forms.

*Route.* (a) Replace `ω_j` by `ω_j + (i/2π)∂∂̄v_j` one index at a time. With
`Φ_j = ∏_{i<j}(ω_i + (i/2π)∂∂̄v_i) ∧ ∏_{i>j}ω_i` (smooth, closed, `≥ 0`) and `w_j = v_j − inf v_j ∈ [0, M]`, the product changes
by `(i/2π)∂∂̄w_j ∧ Φ_j`. As `ψ` is integrable (0.4), the definition of the current `(i/2π)∂∂̄ψ` gives
`∫ψ·(i/2π)∂∂̄w_j ∧ Φ_j = ⟨(i/2π)∂∂̄ψ, w_jΦ_j⟩ ≥ −A∫w_j·ω ∧ Φ_j ≥ −AM∫ω ∧ Φ_j`, because `(i/2π)∂∂̄ψ + Aω` is a positive current
and `w_jΦ_j` a smooth positive form; and `∫ω ∧ Φ_j = ∫ω ∧ ∏_{i≠j}ω_i` by Stokes. Sum over `j`. All potentials are smooth on
`X̄`; the only singular object is the integrable test function `ψ`, and nothing is integrated over the divisor. For
`ψ = log|s|²`, `(i/2π)∂∂̄ψ = [D] − c₁(O(D)) ≥ −Aω` (ComplexComparisonPartII C5.4). (b) Fix `R`, `M = C₁·log R + 2`, and
`v_i = M_1(u_i, −M) − 1` with `M_1` a regularised maximum (smooth, convex, nondecreasing in each argument,
`∂_1M_1 + ∂_2M_1 = 1`, `max ≤ M_1 ≤ max + 1`, equal to `max` when the arguments differ by at least `1`): `v_i` is smooth,
`ω_i + (i/2π)∂∂̄v_i ≥ 0` (constants are `ω_i`-plurisubharmonic as `ω_i ≥ 0`, and `0 ≤ ∂_1M_1 ≤ 1`), and `−M − 1 ≤ v_i ≤ 0`. On
the open set `V = {u_i > −M + 1 for all i}`, `v_i = u_i − 1`, so `μ` and `μ_v = ∏_i(ω_i + (i/2π)∂∂̄v_i)` agree on `V`; and
`{r < R} ⊆ V`, because there `u_i ≥ −C₁·log r ≥ −C₁·log R = −M + 2 > −M + 1`. Both measures have the cohomological total mass `∫∏_iω_i`, so they
give the same mass to the complement of `V`, and hence `μ({r ≥ R}) = μ_v({r ≥ R}) ≤ R^{−1}∫r dμ_v ≤ C₀(M + 1)/R` by
Markov's inequality and (a) with `M + 1` in place of `M`; and `M + 1 ≤ (C₁ + 3)·log R`. Dyadic shells
`{2^jR ≤ r < 2^{j+1}R}`, on which `log r ≤ (j + 2)·log R`, give the second bound (`Σ_{j≥0}(j + 1)(j + 2)2^{−j} = 16`). For mixed
measures take `ω_i = γ_i + (m′ + m₁)ω` with `γ_i + m₁ω ≥ 0` and `u_i = φ_{i,t_i} − C`: then
`ω_i + (i/2π)∂∂̄u_i = γ_i + m′ω + (i/2π)∂∂̄φ_{i,t_i} + m₁ω` dominates the factor and is `≥ 0`, and `u_i ≥ φ_i − C ≥ −2C·log R_s`
(factors `ω` have `ω_i = ω`, `u_i = 0`); `C₀` depends on the `ω_i` only. For `μ_∞`: on each compact `{R ≤ R_s ≤ N}` of `X̄ ∖ D`
the densities converge uniformly, so the bounds for `∫_{R≤R_s≤N}` pass to the limit; let `N → ∞`. In terms of `ρ`:
`{|s|² ≤ ρ} = {R_s ≥ e + log(1/ρ)}`, and `log R/R` decreases on `[e, ∞)`. (c) On the compact `{R_s ≤ R}` of `X̄ ∖ D` the densities
and the `g_t` converge uniformly; on its complement `|g_t| ≤ C·log R_s` and (b) bounds both tails by `C·log²R/R` uniformly;
`D` is null for all the measures; let `R → ∞`. The second bound of (b) for `μ_∞` with `R = e` gives the integrability of `g`.
Signed forms: expand `γ_i + (i/2π)∂∂̄φ_i = (γ_i + m′ω + (i/2π)∂∂̄φ_i) − m′ω`; each term is a mixed measure. Total masses:
`g_t = 1`, each `μ_t` having the cohomological mass. (d) Write `−log|v|² = −log(|v|² + ε) + w_ε`, `w_ε = log(1 + ε/|v|²) ≥ 0`;
the first term is bounded and continuous, so (c) applies, and it suffices that `∫w_ε dμ_t ≤ η` for `ε ≤ ε₀(η)`, `t ≤ t₁(η)`
(the same then holds for `μ_∞` by (c) applied to `min(w_ε, N)`, which also gives the integrability of `log|v|`). Induct on
the number `a` of regularised factors in `J(a, ε, t) = ∫w_ε·T_1(t) ∧ ⋯ ∧ T_a(t) ∧ Ω^{n−a}`,
`T_i(t) = γ_i + m′ω + (i/2π)∂∂̄φ_{i,t}`, `Ω ≥ ω` Kähler. For `a = 0`, dominated convergence. Step: for `t ≤ t₀`,
`T_{a+1}(t) = T_{a+1}(t₀) + (i/2π)∂∂̄u` with `u = φ_t − φ_{t₀} ≤ 0` (monotone), and `S` the other factors;
`∫w_εT_{a+1}(t₀) ∧ S ≤ C(t₀)·J(a, ε, t)`, and `∫w_ε·(i/2π)∂∂̄u ∧ S = ∫u·(i/2π)∂∂̄w_ε ∧ S` with `(i/2π)∂∂̄w_ε = κ_ε − [Δ]`,
`κ_ε = c₁ + (i/2π)∂∂̄log(|v|² + ε) = (ε/(|v|² + ε))·c₁ + P_ε`, `P_ε ≥ 0` (the computation of `i∂∂̄log(|v|² + ε)` as for
`log(|s|² + τ)`), `c₁` the Chern form of the line bundle of `v`; so `∫u·(i/2π)∂∂̄w_ε ∧ S ≤ C∫(−u)ω ∧ S + ∫_Δ(−u)S`. Now
`0 ≤ −u ≤ φ_{t₀} − φ`. Split at a level `N`: on the compact set `{R_s ≤ N}` of `X̄ ∖ D`, and on its intersection with `Δ`,
`φ_{t₀} − φ ≤ η(N, t₀)`, which tends to `0` as `t₀ → 0` (`C²`, hence uniform, convergence on compact sets); on `{R_s > N}`,
`φ_{t₀} − φ ≤ C − φ ≤ 2C·log R_s`. The masses of `ω ∧ S` on `X̄` and of `S` on `Δ` are bounded uniformly (cohomological), and
(b) on `X̄`, and on `Δ` for the restricted weights with `ψ = log|s|²|_Δ` (quasi-plurisubharmonic on `Δ`, not `≡ −∞` on any
component of `Δ`), bounds the tails; so the two integrals are at most `C·η(N, t₀) + C·log²N/N`, uniformly in `t ≤ t₀` and
`ε`. Choose `N`, then `t₀`, then `ε₀` and `t₁ ≤ t₀` by the induction hypothesis.

*Needs:* 0.1, 0.4, 7.7; ComplexComparisonPartII C5.4 (Poincaré–Lelong, integration over `Δ`).

**Checks.**

- The model weight on the punctured disc: for radial `f` the mass of `(i/2π)∂∂̄f` on `{|z| < r}` is `r·f′(r)/2`, so for
  `φ = −log log(1/|z|²)` the mass on `{|z|² < ρ}` is exactly `1/log(1/ρ)`; (b) allows the factor `log log(1/ρ)` more, the price
  of uniformity over all families and of the lower bound `−C·log R_s`.
- Test functions of logarithmic growth are not allowed in (c): for the same weight,
  `∫log(1/|z|²)dμ_∞ = ∫_0^∞ μ_∞({log(1/|z|²) > y})dy = ∫^∞ dy/y = ∞`.
- The route of (d) uses (b) on `Δ` for the divisor `D|_Δ`, through `ψ = log|s|²|_Δ`; on a component of `Δ` contained in `D`
  this function is `≡ −∞` and the restricted weights are not defined, which is why such components are excluded.
- The constant of (b) depends on the upper bound of the families. On `ℙ¹` with `γ = ω_FS` (mass one), `φ = 0` and `D = {0}`,
  the smooth `u_b = log((|z|² + b²)/(1 + |z|²)) − log b²` (`0 < b < 1`) is `≥ 0`, with `γ + (i/2π)∂∂̄u_b = (i/2π)∂∂̄log(|z|² + b²) ≥ 0`
  and `sup u_b = log(1/b²)`. The family equal to `u_b` for `t ≥ t₁` and to `0` for `t < t₁` is monotone with zero loss, and at
  `t = t₁` its measure gives the mass `1/2` to `{|z| ≤ b}`, while `C′·log log(1/ρ)/log(1/ρ)` at `ρ = b²` tends to `0` with `b`.

### Examples

For `φ = 0` on the unit disc and `m = 1`, the Bergman approximant is `log(1/(π(1 − |z|²)²))`, and `Σ_k|σ_k|²` is not a finite sum `Σ_{l≤N}|f_l|²` of holomorphic `f_l` near `0` (7.1). For `T = [D]`, the set `E_c` is the union of the components of multiplicity `≥ c` and the points where the local equation has multiplicity `≥ c` (7.2). On `ℙ¹`, `log(|z₀|²/(|z₀|² + |z₁|²))` is the decreasing limit of the `2πω_FS`-plurisubharmonic functions `log((|z₀|² + ε|z₁|²)/(|z₀|² + |z₁|²))` (7.5). On the punctured disc, `φ = −log log(1/|z|²)` is log-log singular with Lelong number `0` and `|∂φ|_{ω_P}` bounded, so 7.7 (c) applies, and the mass of `(i/2π)∂∂̄φ` on `{|z|² < ρ}` is exactly `1/log(1/ρ)` (7.7, 7.8).

### Dependencies

Layers 0–6; ComplexKahlerGeometry K3 and K4; RealAnalyticGeometry R3.0; ComplexComparisonPartII C5.4.

## Layer 8: Singular L² estimates on Kähler manifolds and Nadel vanishing

### 8.1 Demailly's estimate for singular metrics

Prove the first headline: let `(X, ω)` be weakly pseudoconvex Kähler of dimension `n`, `L` a holomorphic line bundle
with a singular metric `h` whose local weights are quasi-plurisubharmonic, and `iΘ_h(L) ≥ εω` as currents for a
constant `ε > 0`. For every `q ≥ 1` and every `L`-valued `(n,q)`-form `g` with `∂̄g = 0` and
`∫_X|g|²_{h,ω}dV_ω < ∞` there is an `(n,q−1)`-form `u` with `∂̄u = g` and
`∫_X|u|²_{h,ω}dV_ω ≤ (1/(qε))∫_X|g|²_{h,ω}dV_ω`.

*Route.* Write `h = e^{−φ}h₀` with `h₀` smooth and `φ` a global quasi-plurisubharmonic function (as in 2.3), so that
`α + i∂∂̄φ ≥ εω` with `α = iΘ_{h₀}(L)`. On each sublevel set `X_c = {ψ < c}` of a smooth plurisubharmonic exhaustion `ψ`,
7.3 (with `X′ = X_c` and `γ = εω`) gives quasi-plurisubharmonic `φ_m` with analytic singularities, smooth off `V(J(mφ))`,
`φ_m ≥ φ − C/m`, `φ_m → φ` in `L¹_loc(X_c)`, and `α + i∂∂̄φ_m ≥ (ε − ε_m)ω`. `X_c` is weakly pseudoconvex (with the exhaustion
`ψ − log(c − ψ)`), so `X_c ∖ V(J(mφ))` carries a complete Kähler metric (3.3(a)); 3.5 on `X_c` for the metrics `e^{−φ_m}h₀`
gives `u_m` with `∂̄u_m = g` and `A_m = ∫_{X_c}|u_m|²_{h₀}e^{−φ_m} ≤ (1/(q(ε − ε_m)))∫|g|²_{h₀}e^{−φ_m} ≤ (e^{C/m}/(q(ε − ε_m)))‖g‖²`.
*Local bounds.* On a coordinate ball, `φ_m` plus a fixed smooth function is plurisubharmonic for all large `m` (the losses
`ε_m` are bounded), and the `φ_m` are bounded in `L¹` there; the sub-mean-value inequality bounds `φ_m` from above on compact
subsets of `X_c` uniformly in `m`. So `e^{−φ_m}` is bounded below on compact sets, the `u_m` are bounded in `L²_loc(X_c)`, and
along a subsequence (on which also `φ_m → φ` almost everywhere) they converge weakly in `L²_loc` to some `u` with `∂̄u = g`.
*The weighted bound, by duality.* No monotonicity of the `φ_m` is used. For a bounded measurable `L`-valued
`(n, q−1)`-form `w` with compact support in `X_c`, Cauchy–Schwarz gives `|⟨⟨u_m, w⟩⟩_{h₀}|² ≤ A_m·∫|w|²_{h₀}e^{φ_m}`; on the support
of `w` the `e^{φ_m}` are uniformly bounded and converge almost everywhere to `e^{φ}`, so `∫|w|²_{h₀}e^{φ_m} → ∫|w|²_{h₀}e^{φ}` by
dominated convergence, and `|⟨⟨u, w⟩⟩_{h₀}|² ≤ (1/(qε))‖g‖²·∫|w|²_{h₀}e^{φ}`. Take `w = u·e^{−φ}` on
`E = K ∩ {|u|_{h₀} ≤ N, φ ≥ −N}` (`K` compact) and `w = 0` elsewhere: then `⟨⟨u, w⟩⟩ = ∫_E|u|²_{h₀}e^{−φ} = ∫|w|²_{h₀}e^{φ}`, so
`∫_E|u|²_{h₀}e^{−φ} ≤ (1/(qε))‖g‖²`, and monotone convergence in `K` and `N` (the set `{φ = −∞}` is null) gives
`∫_{X_c}|u|²_{h,ω}dV_ω ≤ (1/(qε))‖g‖²`. Finally let `c → ∞`: the solutions on the `X_c` are bounded in `L²_loc(X)` (the weights of
`h` are locally bounded above), and a diagonal weak limit satisfies `∂̄u = g` and the bound, by weak lower semicontinuity of
the norm of `L²(X_{c′}, h)` for each `c′`.

*Needs:* 2.1, 2.3; 0.2, 3.3, 3.5, 7.3.

**Checks.**

- `X = ℂ`, `ω = i dz ∧ dz̄`, `φ = |z|² + log|z|²`: `i∂∂̄φ = ω + 2π[0] ≥ ω` as currents, so `ε = 1`. For
  `g` supported away from `0`, the solution `u` has `∫|u|²|z|^{−2}e^{−|z|²} < ∞`; `u` is holomorphic near `0`,
  so `u(0) = 0`. This is the mechanism of 9.1.

### 8.2 Nadel vanishing

Prove: let `(X, ω)` be weakly pseudoconvex Kähler (for instance compact Kähler) and `h` a singular metric on `L`
with quasi-plurisubharmonic weights and `iΘ_h(L) ≥ εω`, `ε > 0`. Then `H^q(X, K_X ⊗ L ⊗ J(h)) = 0` for every
`q ≥ 1`.

*Route.* The sheaves `L^{(n,q)}` of `L`-valued `(n,q)`-forms `u` with `|u|²_h` and `|∂̄u|²_h` locally integrable
form a fine resolution of `K_X ⊗ L ⊗ J(h)` (exactness in positive degree by 8.1 on small balls, where any weight
is plurisubharmonic up to a smooth term with curvature `≥ εω`); a `∂̄`-closed global section of
`L^{(n,q)}` can be taken with finite global `L²` norm after multiplying the weight by `e^{−χ(ψ)}` for a convex
increasing `χ` (which only increases the curvature), and 8.1 solves it globally.

*Needs:* 8.1; 6.1–6.2; ComplexKahlerGeometry K2 (Dolbeault theorem and fine resolutions).

**Checks.**

- `X = ℙ¹`, `L = O(1)`, `s ∈ H⁰(O(1))` vanishing at one point `p`, and `h = h_FS^{1−a} ⊗ |s|^{−2a}`. For
  `0 < a < 1`: `iΘ_h ≥ 2π(1 − a)ω_FS`, `J(h) = O` (Lelong number `2a < 2`), and indeed
  `H¹(ℙ¹, K ⊗ O(1)) = H¹(O(−1)) = 0`. For `a = 1` the curvature is the Dirac current alone, `iΘ ≥ εω` fails,
  `J(h) = O(−p)`, and `H¹(K ⊗ O(1) ⊗ J(h)) = H¹(O(−2)) ≅ ℂ ≠ 0`: strict positivity cannot be dropped.
- The comparison 6.3(b) with Nadel's theorem for `h = ∏|s_i|^{−2c_i} × (smooth)` on a projective manifold
  recovers, on smooth `X`, the vanishing `nadelVanishingPair` of MultiplierIdealsOfPairsAndPointSeparation §9.10c for
  `L − Δ` ample.

### 8.3 Separation of points and jets by multiplier ideals

Prove: in the setting of 8.2 with `X` compact, if `Z = V(J(h))` and `x₁, …, x_r` are pairwise distinct isolated points of `Z`,
then the restriction map `H⁰(X, K_X ⊗ L) → ⊕_i (K_X ⊗ L ⊗ O_X/J(h))_{x_i}` is surjective. (With a repeated point the target
counts its stalk twice and the map is not onto: second Check.) In particular, if
`J(h)_{x_i} = m_{x_i}` for each `i` (an isolated non-integrability point of multiplicity one), sections of
`K_X ⊗ L` separate the points `x_1, …, x_r`; if `J(h)_{x} ⊆ m_x^{s+1}` with `x` isolated, they generate all
`s`-jets at `x` modulo `J(h)_x`.

*Route.* The exact sequence `0 → K ⊗ L ⊗ J → K ⊗ L → K ⊗ L ⊗ O/J → 0` and `H¹(K ⊗ L ⊗ J) = 0` (8.2) make
`H⁰(K ⊗ L) → H⁰(K ⊗ L ⊗ O/J)` surjective; `O/J` is supported on `Z`, and the stalks at the distinct isolated points
`x_1, …, x_r` form a direct summand `⊕_i (K ⊗ L ⊗ O/J)_{x_i}` of its global sections, each point counted once.

*Needs:* 8.2; 6.1–6.2.

**Checks.**

- `X = ℙ^n`, `x` a point, `ℓ_1, …, ℓ_n ∈ H⁰(O(1))` with common zero `x`, and on `L = O(n + 1)` the metric
  `h = h_FS ⊗ (Σ_j|ℓ_j|²)^{−n}`: `iΘ_h ≥ 2πω_FS`, the weight is `n·log|z − x|² + smooth` near `x`, so
  `J(h) = m_x` (in dimension `n`, `|f|²|z|^{−2n}` is integrable iff `f(0) = 0`), and `J(h) = O` elsewhere. Here
  `K ⊗ L = O`, and 8.3 says that `H⁰(O) → O/m_x` is onto, as the constant `1` shows.
- Distinctness is needed: in the previous Check with `n = 1` and `x₁ = x₂ = x`, the map is the diagonal
  `ℂ = H⁰(O) → ℂ ⊕ ℂ`, `c ↦ (c, c)`, which is not onto.

### 8.4 Ohsawa–Takegoshi with singular weights on Stein manifolds

Prove: in 4.2 let `X` be Stein and let the metric of `L` be `h₀e^{−φ}` with `h₀` smooth satisfying the two curvature
hypotheses of 4.2 and `φ` plurisubharmonic on `X`, `φ|_Y ≢ −∞` on every component of `Y`. Then every holomorphic section
`f` of `K_X ⊗ L` over `Y` with `∫_Y |f|²_{h₀}e^{−φ}/|Λ^r(ds)|² dV_{Y,ω} < ∞` extends to `F` on `X` with
`∫_X |F|²_{h₀}e^{−φ}/(|s|^{2r}(−log|s|)²) dV_{X,ω} ≤ C_r ∫_Y |f|²_{h₀}e^{−φ}/|Λ^r(ds)|² dV_{Y,ω}`.

*Route.* By 7.5(b), `φ` is the limit of a decreasing sequence of smooth plurisubharmonic `φ_k`; the metrics `h₀e^{−φ_k}`
satisfy the hypotheses of 4.2 (adding `i∂∂̄φ_k ≥ 0` keeps both inequalities), and `e^{−φ_k} ≤ e^{−φ}`, so 4.2 gives
extensions `F_k` with norms bounded by the right side for `φ`. For fixed `k₀` and `k ≥ k₀`, `e^{−φ_{k₀}} ≤ e^{−φ_k}`: the
`F_k` are bounded in the space weighted by `e^{−φ_{k₀}}`, a weak limit `F` extends `f` and satisfies the bound with
`φ_{k₀}`; let `k₀ → ∞` by monotone convergence. On a weakly pseudoconvex Kähler manifold the regularisation of 7.3–7.4
loses positivity, which the semipositivity hypotheses of 4.2 cannot absorb; the Stein hypothesis avoids the loss.

*Needs:* 4.2, 7.5.

### Examples

On `ℂ` with `φ = |z|² + log|z|²`, `i∂∂̄φ = ω + 2π[0] ≥ ω`, and a solution `u` for data supported away from `0` vanishes at `0` (8.1). On `ℙ¹` with `h = h_FS^{1−a} ⊗ |s|^{−2a}` on `O(1)` and `0 < a < 1`, `J(h) = O` and `H¹(ℙ¹, K ⊗ O(1)) = 0`; for `a = 1` strict positivity fails and `H¹(K ⊗ O(1) ⊗ J(h)) ≅ ℂ` (8.2). On `ℙ^n` with `h = h_FS ⊗ (Σ_j|ℓ_j|²)^{−n}` on `O(n + 1)`, `J(h) = m_x`, and 8.3 says that `H⁰(O) → O/m_x` is onto (8.3).

### Dependencies

Layers 0, 2–4, 6 and 7; ComplexKahlerGeometry K2; MultiplierIdealsOfPairsAndPointSeparation §9.10c (the comparison in the second Check of 8.2).

## Layer 9: Bergman kernels: lower bounds and asymptotics

### 9.1 Peak sections

Prove: there are constants `c_n > 0` and `C_n` depending only on `n` with the following property. Let `(X, ω)` be
Kähler, `L` a line bundle with a singular metric `h` (quasi-plurisubharmonic weights) such
that `iΘ_h(L) + Ric(ω) ≥ εω` as currents for a constant `ε > 0`, where `Ric(ω)` is the curvature of `K_X^{−1}`
with the metric induced by `ω`, and `x ∈ X`; assume either (α) `X` is weakly pseudoconvex, or (β) `h` is smooth on
`X ∖ Z` for a nowhere dense closed analytic subset `Z ∌ x` and `X ∖ (Z ∪ {x})` carries a complete Kähler metric (by 3.3(b),
for instance: `X` carries a complete Kähler metric, `Z = ∅`). Let `z : U → B(0, r)` be a holomorphic chart centred at `x`
with `ω_eucl ≤ z_*ω ≤ 2ω_eucl`, and `e` a frame of `L` on `U` whose weight `φ` is bounded on `U`. If `εr² ≥ C_n`,
then `B_{h,dV_ω}(x) ≥ c_n·r^{−2n}·exp(−osc_U φ)`.

*Route.* Hörmander's construction: with a cut-off `χ` equal to `1` on `B(0, r/2)` and supported in `B(0, r)`,
solve `∂̄u = ∂̄(χe)` (an `(n,1)`-form after the canonical identification of `L` with `K_X ⊗ (L ⊗ K_X^{−1})`) for the
weight `φ + n·χ·log(|z|²/r²)`, by 8.1 under (α) and by 3.5 with the analytic set `Z ∪ {x}` under (β); the added
curvature is `≥ −C n r^{−2}ω` on the annulus and positive where `χ = 1`, so that `εr² ≥ C_n` keeps the total curvature
`≥ (ε/2)ω`. The added weight has Lelong number `2n`
at `x`, so `e^{−n log|z|²}` is not integrable (1.2(b)) and forces `u(x) = 0`; since it is `≤ 0`, `u` also has
finite `h`-norm. Then `s = χe − u` is holomorphic, `|s(x)|²_h = e^{−φ(x)}` and
`‖s‖² ≤ C r^{2n}e^{−inf_U φ}(1 + 1/(εr²))`.

*Needs:* 8.1 (case (α)); 3.3, 3.5 (case (β)); 3.6.

**Checks.**

- `X = ℂ`, `L` trivial with `φ = k|z|²`, `ω` Euclidean: the Bergman density of the Fock space is `k/π`; with
  `r = k^{−1/2}·C` the bound reads `B ≥ c·k`, of the right order in `k`.

### 9.2 Leading-order asymptotics for smooth positive metrics

Prove: let `X` be compact, `L` a line bundle with a smooth metric `h` such that `c₁(L, h)` is positive definite
everywhere, `dV` a smooth positive volume form and `B_k = B_{h^k,dV}` the Bergman density of `H⁰(X, L^k)`. Then
`k^{−n}B_k(x) → (c₁(L, h)^n/n!)/dV` uniformly on `X`.

*Route.* Upper bound: in coordinates where `φ(z) = Σ_jλ_j|z_j|² + O(|z|³)` (after a change of frame) and `dV = c·dλ` at
`x` (`c > 0`), rescale by `√k` on a ball of radius `R/√k`; the weighted mean-value inequality 3.7(d) for the model weight
`Σλ_j|w_j|²`, with the error `O(R³/√k)` of the cubic term and the factor `c(1 + O(R/√k))` of `dV`, bounds `k^{−n}B_k(x)` by
`(1 + o(1))/(c∫_{|w|<R}e^{−Σλ_j|w_j|²}dλ)`, which tends to `∏_jλ_j/(π^n c)` as `R → ∞`; this is `(c₁(L, h)^n/n!)/dV` at `x`,
since `c₁(L, h)_x = Σ_j(λ_j/π)·(i/2)dz_j ∧ dz̄_j` has `c₁^n/n! = (∏_jλ_j/π^n)dλ`. (Without the factor `c` the bound would be
false: for `φ = |z|²` on `ℂ` and `dV = ½dλ` the Bergman density is `2/π`.) Lower bound: Tian's peak sections, the construction of 9.1 at scale `(log k)/√k` with the
Gaussian section `e^{−kΣλ_j|z_j|²}`-normalised frame, whose error is `o(1)` relatively; uniformity from compactness.

*Needs:* 9.1, 3.7, 8.1.

**Checks.**

- `ℙ¹`, `O(1)`, Fubini–Study, `dV = ω_FS`: `B_k = k + 1`, and `c₁^1/1! = ω_FS = dV`, so `k^{−1}B_k → 1`.
- Normalisation: on `ℂ` with `φ = |z|²` and Lebesgue measure `dλ = (i/2)dz ∧ dz̄`,
  `c₁ = (i/2π)dz ∧ dz̄ = (1/π)dλ`, and the Bergman density of the Fock space `{f : ∫|f|²e^{−|z|²}dλ < ∞}` is
  `1/π`. With the weight `e^{−2|z|²}` of the other convention one would get `2/π`.

### 9.3 The local upper bound

Prove (Berman's local holomorphic Morse inequality): if `h` is a singular metric on `L` over a complex manifold,
`C²` near `x`, then `limsup_k k^{−n}B_{h^k,dV}(x) ≤ (c₁(L, h)_x^n/n!)/dV_x` when `c₁(L, h)_x` is positive definite,
and `k^{−n}B_{h^k,dV}(x) → 0` when it is not.

*Route.* `B_k(x)` is at most the Bergman density of a small ball around `x` (3.6, monotonicity in the domain);
in coordinates and a frame where the weight is `Σλ_j|z_j|² + o(|z|²)` and `dV = c·dλ` at `x`, rescale by `√k` and compare with the model
weight `Σλ_j|w_j|²` through the weighted mean-value inequality 3.7(d), which holds for `λ_j` of any sign: the bound is
`(1 + o(1))/(c∫_{|w|<R}e^{−Σλ_j|w_j|²}dλ)`, which tends to `∏λ_j/(π^n c) = (c₁(L, h)_x^n/n!)/dV_x` if all `λ_j > 0` and to `0` as
`R → ∞` if some `λ_j ≤ 0`.

*Needs:* 3.6, 3.7.

### 9.4 Asymptotics for singular metrics on the smooth locus

Prove: let `X` be compact Kähler and `h` a singular metric on `L` with `iΘ_h(L) ≥ δω` (`δ > 0`) as currents, smooth on
an open `U`. Then `k^{−n}B_{h^k,dV}(x) → (c₁(L, h)_x^n/n!)/dV_x` locally uniformly on `U`, where `B_{h^k}` is the
Bergman density of `H⁰(X, L^k)` with the norm of `h^k` (the sections of `L^k ⊗ J(h^k)` of finite norm).

*Route.* Upper bound 9.3; lower bound the peak-section construction of 9.2 with the global estimate 8.1 for the
singular metric `h^k ⊗ (K_X^{−1}, ω)`, whose curvature is `≥ (kδ − C)ω`.

*Needs:* 9.2, 9.3, 8.1.

### 9.5 Big line bundles

Prove: on a projective manifold `X`, `L` is big iff it carries a singular metric with `iΘ_h ≥ εω` for some
`ε > 0`.

*Route.* ⇒ is 2.6(b). ⇐: by 7.3 the metric may be taken with analytic singularities, hence smooth on a nonempty
Zariski-open `U`; by 9.4, `h⁰(X, L^k) ≥ ∫_U B_k dV ≥ c·k^n` for large `k`, which is bigness
(AlgebraicModuliForArithmeticGeometry §1.6, `bigLineBundle`).

*Needs:* 2.6, 7.3, 9.4; AlgebraicModuliForArithmeticGeometry §1.6.

### 9.6 Bergman densities for Poincaré-type metrics

Prove: in the setting of 5.5, let `L̄` be a line bundle on `X̄` with a metric `h` on `L̄|_X` that is good relative to
`L̄` (5.3) with `|iΘ_h|_{ω_P} ≤ A`. (a) For every `k ≥ 1`, `x ∈ X` and `s ∈ H⁰_{(2)}(X, L^k; h^k, ω_P^n)`,
`|s(x)|²_{h^k} ≤ C·k^n·M(x)·‖s‖²`, where `M(x)` is the multiplicity of the quasi-coordinate chart of 5.5 at `x`
(bounded on compact subsets of `X`, and `≤ C∏_j(1 + |log|s_j(x)||)` near `D`) and `C` depends only on
`(X̄, D, ω_P, A)`. (b) If `iΘ_h ≥ εω_P` on `X` for some `ε > 0`, then `B_{h^k, ω_P^n}(x) ≥ c·k^n` for `k ≥ k₀` at
every `x` at which the quasi-coordinate chart of radius `C k^{−1/2}` is injective, for a constant `C` depending only on `n`, `ε`
and the constants of 5.5, with `c, k₀` independent of `x`;
`k₀` depends on `ε` and on the bound `Ric(ω_P) ≥ −C′ω_P` given by the bounded geometry of 5.5.

*Route.* (a) is 3.7(b) with the quasi-coordinates of 5.5 at scale `r = k^{−1/2}`. (b) For `k ≥ 2C′/ε`,
`k·iΘ_h + Ric(ω_P) ≥ (kε − C′)ω_P ≥ (kε/2)ω_P`. Let `x` be a point at which the quasi-coordinate chart `F_x` of radius
`ρ = Ck^{−1/2}` is injective, and `U` its image. *Normalised chart.* By 5.5, `c·ω_eucl ≤ F_x^*ω_P ≤ c^{−1}·ω_eucl` with
derivatives of the coefficients bounded independently of `x`. A linear map `A_x` with `A_x^*(F_x^*ω_P)(0) = (3/2)·ω_eucl` has
`‖A_x‖ ≤ (3/(2c))^{1/2}`, so `G_x = F_x∘A_x` is defined and injective on `B(0, bρ) ⊆ A_x^{−1}(B(0, ρ))` with the uniform constant
`b = (2c/3)^{1/2}`, and by the derivative bounds `ω_eucl ≤ G_x^*ω_P ≤ 2ω_eucl` on `B(0, bρ)` for `k ≥ k₁`. The linear change shrinks
the available radius by at most the factor `b`, and it does shrink it in general (if `F_x^*ω_P = β²·ω_eucl` with `0 < β < 1`,
normalising it to `ω_eucl` multiplies the radius by exactly `β`); every radius below is measured in the coordinates of `G_x`. Normalising a frame at the centre (value and differential of the
weight) does not bound the oscillation of the weight on `U` by the curvature (second Check), so 9.1 is not applied with a
frame; its construction is run with a local holomorphic section instead. In a frame `e` of `L` on `G_x(B(0, bρ))`, the weight `φ` of `h` is
plurisubharmonic (`iΘ_h ≥ 0`), and so is `kφ`. On the polydisc `P = P(0, bρ/√n) ⊂ B(0, bρ)`, 4.1 applied `n` times along a flag
(from the point to a line, a plane, …, each time on a polydisc with the plurisubharmonic weight `kφ` and the constant
`π(bρ/√n)²`) gives `f` holomorphic on `P` with `f(0) = 1` and `∫_P|f|²e^{−kφ}dλ ≤ (πb²ρ²/n)^n e^{−kφ(x)}`. With `r = bρ/√n` and a
cut-off `χ` equal to `1` on `B(0, r/2)`, supported in `B(0, r)`, `|∂̄χ| ≤ C/r`, solve `∂̄u = ∂̄(χ·f·e^{⊗k})` as in 9.1's route, in
its case (β) with `Z = ∅` (`ω_P` is complete Kähler by 5.5, so `X ∖ {x}` carries a complete Kähler metric by 3.3(b), although
`X` need not be weakly pseudoconvex: 3.3's second Check), for the weight `kφ + n·χ·log(|z|²/r²)`, with total curvature
`≥ (kε/4)ω_P` once `(kε/2)r² ≥ C_n`, that is `b²C² ≥ 2nC_n/ε`. The datum is supported where `r/2 ≤ |z| ≤ r`, where the added weight
lies between `n·log(1/4)` and `0`, so its squared norm is at most `C_n r^{−2}∫_P|f|²e^{−kφ}dλ ≤ C_n r^{2n−2}e^{−kφ(x)}`; hence
`‖u‖² ≤ C_n r^{2n}e^{−kφ(x)}/(kεr²)`, and `u(x) = 0` (the added weight has Lelong number `2n` at `x`, 1.2(b)). The section
`s = χ·f·e^{⊗k} − u` of `L^k` is holomorphic, `|s(x)|²_{h^k} = e^{−kφ(x)}`, and `‖s‖² ≤ C_n r^{2n}e^{−kφ(x)}(1 + 1/(kεr²))`, so
`B_{h^k,ω_P^n}(x) ≥ c_n r^{−2n} ≥ c·k^n`, with `c` and `k₀` independent of `x`. No oscillation of the weight enters: the point
extension carries the value `e^{−kφ(x)}` into the `L²` norm.

*Needs:* 1.2, 3.3, 3.7, 4.1, 5.5, 9.1.

**Checks.**

- The modular curve with the Petersson metric on `ω^{⊗k}` and the hyperbolic volume: `iΘ` of the Petersson metric of
  `ω` is a positive multiple of the hyperbolic form, so (b) applies at points of bounded height, and (a) allows the growth
  of `M` in the cusp, where the injectivity radius tends to zero.
- Curvature does not bound the oscillation of a weight normalised at the centre: on the unit disc the weights
  `a|z|² + M·Re z²` (`a > 0`) have the same curvature `i∂∂̄ = a·i dz ∧ dz̄`, value `0` and differential `0` at `0` for every `M`, and
  oscillation at least `2Mρ²` on `{|z| < ρ}`; they are the weights of one metric in the frames `e^{−Mz²/2}·e`. The point extension
  `f = e^{Mz²/2}` absorbs the gauge: `|f|²e^{−a|z|² − M·Re z²} = e^{−a|z|²}`, `f(0) = 1`, and `∫_{|z|<r}e^{−a|z|²}dλ ≤ πr²`.
- The hypothesis of (b) cannot be weakened to `iΘ_h + Ric(ω_P) ≥ εω_P`: with `D = ∅`, `X` Fano and `L` trivial with the
  trivial metric, that holds for `ω_P` Kähler–Einstein, but `B_{h^k} ≡ 1/vol` does not grow; wherever `iΘ_h` is not
  positive definite, 9.3 gives `k^{−n}B_{h^k}(x) → 0`.

### Examples

On `ℂ` with `φ = k|z|²`, the Fock space has Bergman density `k/π`, and the peak-section bound reads `B ≥ c·k` (9.1). On `ℙ¹` with `O(1)`, the Fubini–Study metric and `dV = ω_FS`, `B_k = k + 1`, so `k^{−1}B_k → 1` (9.2). With `D = ∅`, `X` Fano and `L` trivial with the trivial metric, `iΘ_h + Ric(ω_P) ≥ εω_P` holds for a Kähler–Einstein `ω_P`, but `B_{h^k} ≡ 1/vol` does not grow (9.6).

### Dependencies

Layers 1–5, 7 and 8; AlgebraicModuliForArithmeticGeometry §1.6.

## Downstream consumers

- DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2: invariant metrics on automorphic vector bundles are good relative
  to the canonical extension (5.3, 5.5), and Hirzebruch–Mumford proportionality for several representations and their
  flag bundles (5.4).
- HeightsForLogSingularMetrics §§0.4, 4.3a, 14.1(c): arithmetic intersection numbers and volumes of log-log
  singular hermitian line bundles as limits of monotone regularisations, their rate, and the reflection formula for the
  limit numbers, using 5.3, 5.5, 7.7 (with the pull-back 7.7 (d) along projective bundles and fibre squares) and 7.8.
- ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a: logarithmic growth of the Hodge metric in the sense of 5.3(i) and semipositivity of
  the Hodge bundle of a semi-abelian scheme with abelian generic fibre over a curve, using 3.2a (curvature of the top piece of a polarised variation
  and of quotients) and 2.5.
- HeightsRationalPointsAndObstructions §5.17c: its uniform Bergman-density asymptotics and its restriction
  operators to smooth members of `|L^a|` are instances of 9.2 and 4.2.
- ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties: plurisubharmonic functions (0.1–0.3), complete Kähler metrics off analytic sets of
  complete Kähler manifolds (3.3(b)), sup-norm bounds for holomorphic forms (3.7), Bergman-kernel lower bounds by peak
  sections (9.1), `L²` estimates with weights singular at points (3.5), the regularisation of log-log singular metrics and
  its pull-back to flag bundles (7.7, also through HeightsForLogSingularMetrics §0.4), the mixed Monge–Ampère
  measures of the Hodge metrics and their limits (7.8, also through HeightsForLogSingularMetrics §§0.4, 14.1(c)),
  the good-metric Chern–Weil theory behind proportionality (Layer 5, through DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2), and, for the
  generation of integral forms by theta series, the extension across analytic sets (3.4), Hörmander's estimate with the
  datum measured by the Levi form (3.8), its weighted form for the solution of least norm and the dual form behind the
  lifting to the chart (3.8a, the dual form also for weights of class `C²` off a hypersurface), interpolation on the
  discrete zero set of generic sections (3.9) and Skoda's division by powers of their ideal with jets (3.10(b)–(c)), all
  on a Stein chart of the flag domain; the descent of these statements to the arithmetic quotient by Poincaré series is
  ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a.
- BallQuotientsAndComplexHyperbolicLattices §9.1 solves `∂̄` with weights `log|z − a|²` regularised by hand; 8.1
  is the general form of that step.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns, by layer:

- **Layer 0:** plurisubharmonic functions with values in `[−∞, ∞)` on complex manifolds and on reduced complex
  spaces, their local integrability, mean values, local regularisation by convolution and the distributional
  characterisation, the Riesz representation on balls and Hartogs' lemma, quasi-plurisubharmonic and
  `γ`-plurisubharmonic functions with `L¹`-compactness, pluripolar sets and the extension across them.
- **Layer 1:** Lelong numbers of plurisubharmonic functions, Skoda's integrability theorem, the complex singularity
  exponent.
- **Layer 2:** singular hermitian metrics on line bundles, their curvature and Chern currents, analytic
  singularities, the Poincaré–Lelong formula for singular metrics, degrees from metrics of logarithmic growth,
  pseudoeffective and analytically nef line bundles.
- **Layer 3:** Hörmander's estimate on pseudoconvex domains (also with the datum measured by the Levi form of the
  weight, and for the solution of least norm against a second weight of bounded gradient), the twisted
  Bochner–Kodaira–Nakano inequality, the curvature of holomorphic sub-bundles and quotient bundles (also for flat
  bundles with an indefinite parallel form) and Skoda's curvature inequality, complete Kähler metrics on complements of
  analytic sets,
  extension of `∂̄`-equations across analytic sets, estimates for weights smooth off analytic sets on manifolds whose
  complement of the analytic set is complete Kähler, Bergman spaces and the sub-mean-value comparison of sup and `L²`
  norms, interpolation of jets on discrete common zero sets, Skoda's division theorem with its iteration for powers of
  an ideal and its form with jets.
- **Layer 4:** the Ohsawa–Takegoshi theorem (hyperplane form over a planar domain with the optimal constant
  `π/c_D(0)²`, manifold form of Manivel and Demailly; both as cited theorems, with the reduction of the first to smooth
  data) and the Suita inequality.
- **Layer 5:** Poincaré growth, good forms and good metrics in Mumford's sense, uniqueness of the extension,
  Chern–Weil theory for good metrics, Poincaré-type Kähler metrics. In rank one, condition (i) of a good metric is the
  logarithmic growth of ArakelovGeometryAndAbelianHeights §5.1, which owns that predicate on arbitrary complex analytic
  varieties with its functoriality and the height comparison; 2.5 and 5.3 use its normal-crossings form.
- **Layer 6:** analytic multiplier ideals, Nadel's coherence, the comparison with algebraic multiplier ideals,
  restriction, subadditivity, strong openness (in dimension at least two as a cited theorem, with its reduction to the
  local statement; in dimension one with a proof).
- **Layer 7:** Demailly's Bergman approximation, Siu's analyticity theorem, global approximation by analytic
  singularities, smooth regularisation with a loss controlled by Lelong numbers at a scale, regularisation in Kähler
  classes and on Stein manifolds, Richberg's theorem, regularisation of log-log singular semipositive metrics and its
  pull-back, the energy,
  boundary mass and convergence of mixed Monge–Ampère measures of log-log singular weights and of their regularisations.
- **Layer 8:** Demailly's `L²` estimate for singular metrics, Nadel vanishing, separation of points and jets by
  multiplier ideals, the Ohsawa–Takegoshi theorem for singular weights on Stein manifolds.
- **Layer 9:** peak sections, Bergman-density asymptotics at leading order (smooth positive metrics, the local
  upper bound, singular metrics on their smooth positive locus), the characterisation of big line bundles by
  singular metrics, Bergman densities for Poincaré-type metrics.

It leaves to named roadmaps:

- ComplexComparisonPartII: the current calculus (positive currents, trace measures, local convolution, the
  Skoda–El Mir extension, integration over analytic cycles, the Poincaré–Lelong formula for smooth metrics,
  integral Chern classes) and the smooth weighted `L²` estimate on complete Kähler manifolds; Stein manifolds and
  strongly 1-complete spaces with their complete metrics. RealAnalyticGeometry R3: the Stein criterion and the
  weighted theorem it rests on.
- ComplexKahlerGeometry: holomorphic bundles, Chern connections, the Kähler, Bochner–Kodaira–Nakano and
  Akizuki–Nakano identities, analytic sets and coherence, the Dolbeault theorem.
- ComplexHessianEquations: the uniform exponential integrability of `C²` plurisubharmonic functions (Layer 7) and
  the `L¹` bound for quasi-plurisubharmonic functions of class `C²` (§5.4), which 0.4 and 1.2 extend.
- CharacteristicClasses C4: smooth Chern–Weil theory.
- AlgebraicModuliForArithmeticGeometry §9.10: algebraic multiplier ideals and the algebraic Kawamata–Viehweg
  vanishing theorem. [MultiplierIdealsOfPairsAndPointSeparation](../MultiplierIdealsOfPairsAndPointSeparation/README.md)
  §§9.10b–9.10c: multiplier ideals of pairs and Nadel vanishing for pairs; its §§9.12, 9.12b and 9.12c: isolated
  non-klt centres and Angehrn–Siu point separation. This roadmap proves the analytic counterparts and the comparison
  6.3, and nothing here is consumed by those sections.
- AlgebraicModuliForArithmeticGeometry §1.6 (bigness), ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2
  (principalisation) and §7.7 (principalisation of quasi-excellent schemes, for the analytic principalisation of 6.3).
- Not in this roadmap: Monge–Ampère operators on singular weights and pluripotential capacities (Bedford–Taylor
  theory), the full Tian–Yau–Zelditch–Catlin expansion beyond the leading term, invariance of plurigenera,
  extension of sections from non-reduced subspaces, Josefson's theorem, Poincaré series on quotients of bounded
  symmetric domains and flag domains by arithmetic groups and the gradient bound for their Bergman potentials (through
  which 3.8–3.10 on a Stein chart descend to such quotients, the lifting of sections to the chart resting on 3.8a(b)), and the arithmetic theory of
  singular metrics (ArakelovGeometryAndAbelianHeightsPartII).

## Exact supplier contracts

### From Mathlib

`UpperSemicontinuous`, `EReal`, `Real.circleAverage`, `MeasureTheory.Lp`, `MeasureTheory.Integrable`, Lebesgue measure
on `ℂ^n`, convolution, `Distribution` and `TestFunction`, `HilbertBasis`, `InnerProductSpace`, `IsManifold`,
`MDifferentiable`, `Real.log`.

### From Tau Ceti

`TauCeti.leviForm` and its API; `TauCeti.IsManifoldStrictlyPlurisubharmonicAt`; `TauCeti.SubharmonicOn` and the
sub-mean-value lemmas `IsCompact.le_of_le_setAverage_ball_le_frontier` and
`IsCompact.ge_of_setAverage_ball_le_ge_frontier`, for continuous functions; this roadmap's 0.1 covers upper
semicontinuous functions with value `−∞`.

### From TauCetiRoadmap.ComplexComparisonPartII

- C-1.1: complex analytic spaces by local models (closed subspaces `V(I)` of open sets of `ℂ^N`), open gluing and local
  embeddings, reduced complex spaces, and the completed analytic stalks `ℂ[[z₁, …, z_N]]` modulo the ideal (0.6, 6.3(c)).
- C0 and C2.2: analytification of schemes, coherent sheaves and line bundles; GAGA for sections (6.3, 2.6).
- C1.3: the Chern connection and curvature conventions (`e^{−φ}` has `Θ = ∂∂̄φ`, Chern form `(i/2π)Θ`).
- C1.4: `weightedDolbeaultEstimate`, the smooth-weight `L²` estimate for `(n,k)`-forms on complete Kähler manifolds,
  with minimal solutions and the canonical twist.
- C1.5: `SteinManifold`, `StronglyOneComplete`, the complete Kähler metric `i∂∂̄χ(ψ)` of an exhaustion.
- C5.4: `CurrentCalculus` (currents, degrees and signs, positive and strongly positive currents, order zero, trace
  measures, local convolution of currents and of locally integrable plurisubharmonic functions),
  `closedCurrentExtension` (Skoda–El Mir), `AnalyticCycleIntegration`, `lelongPoincareSection`,
  `integralLineBundleChernClass`, `chernFubiniStudyIntersection`.

### From TauCetiRoadmap.ComplexKahlerGeometry

K2 (Dolbeault cohomology, the Dolbeault theorem and fine resolutions), K3 and K3.0 (several-variable calculus,
holomorphic germs, analytic subsets, coherence, Noetherianity, the Riemann extension theorem), K4 (holomorphic
bundles, frames, smooth hermitian metrics, Chern connections and their curvature; sub-bundles, quotients and second
fundamental forms are this roadmap's 3.2a), K5a (local `L²` distributions and elliptic regularity), K6.0 (Kähler
identities, the Bochner–Kodaira–Nakano and Akizuki–Nakano identities, the Nakano curvature bound on `(n,k)`-forms, the
curvature operator `[iΘ, Λ]`), K7.2 (the Fubini–Study form).

### From TauCetiRoadmap.RealAnalyticGeometry

R3.0–R3.1: Stein manifolds, the equivalence with smooth strictly plurisubharmonic exhaustions (7.5(b), 8.4), the
complete Kähler metric from an exhaustion, the weighted `∂̄` theorem with graph-domain density.

### From TauCetiRoadmap.ComplexHessianEquations

§5.4 (the `L¹` bound for `C²` quasi-plurisubharmonic functions normalised by their supremum) and Layer 7, §7.1 (the
local uniform exponential integrability estimate for `C²` plurisubharmonic functions, and the Green representation of
a `C²` function on a planar disc, which 0.3a extends).

### From TauCetiRoadmap.CharacteristicClasses

C4.1 (invariant polynomials, Chern–Weil forms, transgression and connection independence) and C4.2 (Chern forms
represent the real Chern classes).

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§1.6 (`bigLineBundle`); §9.10 (`algebraicMultiplierIdeal` with its API), used in 6.3 and 9.5.

### From MultiplierIdealsOfPairsAndPointSeparation, a sub-roadmap of this family

§9.10b (`multiplierIdealOfPair`) and §9.10c (`nadelVanishingPair`), used only in 6.3(b) and 8.2's second check.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

§5.1 (principalisation) and §5.2 (log resolutions), analytified, in 6.3(a)–(b); §7.7 (principalisation of
quasi-excellent schemes, applied to the local rings `O_{X,x}`), in 6.3(c).

## References

- J.-P. Demailly, *Complex Analytic and Differential Geometry*, chapters I (plurisubharmonic functions,
  regularisation), III (currents, Lelong numbers, Thie's and Siu's theorems), V (hermitian vector bundles, exact
  sequences and second fundamental forms), VIII (`L²` estimates on weakly pseudoconvex and complete Kähler manifolds,
  complete metrics on complements of analytic sets, Skoda's division theorem): Layers 0–3 (in particular 3.2a, 3.5 and
  3.10), 7.2.
- P. A. Griffiths, *Hermitian differential geometry, Chern classes, and positive vector bundles*, in Global Analysis
  (papers in honour of K. Kodaira, 1969), and *Periods of integrals on algebraic manifolds III*, Publ. Math. IHÉS 38
  (1970): 3.2a(a), (b).
- J.-P. Demailly, *Analytic Methods in Algebraic Geometry* (2012): singular metrics, multiplier ideals, Nadel
  vanishing, approximation and regularisation, the Ohsawa–Takegoshi theorem (Layers 2, 6–8).
- J.-P. Demailly, *Estimations L² pour l'opérateur ∂̄ d'un fibré vectoriel holomorphe semi-positif au-dessus
  d'une variété kählérienne complète*, Ann. Sci. ÉNS 15 (1982): complete metrics on `X ∖ Z`, extension across
  analytic sets, estimates on complete Kähler manifolds and singular-weight estimates (3.3–3.5, 3.8, 8.1).
- L. Hörmander, *L² estimates and existence theorems for the ∂̄ operator*, Acta Math. 113 (1965): 3.1, 3.8.
- H. Skoda, *Application des techniques L² à la théorie des idéaux d'une algèbre de fonctions holomorphes avec
  poids*, Ann. Sci. ÉNS 5 (1972): 3.2a(c), 3.10.
- H. Donnelly and C. Fefferman, *L²-cohomology and index theorem for the Bergman metric*, Ann. of Math. 118 (1983);
  B. Berndtsson, *The extension theorem of Ohsawa–Takegoshi and the theorem of Donnelly–Fefferman*, Ann. Inst. Fourier
  46 (1996): 3.8a.
- S.-S. Chern, H. Levine and L. Nirenberg, *Intrinsic norms on a complex manifold*, in Global Analysis (papers in honour of
  K. Kodaira, 1969) (inequalities of the kind of 7.8(a)); V. Guedj and A. Zeriahi, *The weighted Monge–Ampère energy of
  quasiplurisubharmonic functions*, J. Funct. Anal. 250 (2007), and S. Boucksom, P. Eyssidieux, V. Guedj and A. Zeriahi,
  *Monge–Ampère equations in big cohomology classes*, Acta Math. 205 (2010) (non-pluripolar products and full mass): 7.8.
- [FormalProof] The Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. Its analytic part proves 7.8 (the energy inequality,
  the boundary mass bound uniformly for mixed measures with independent parameters, and the convergence statements)
  in this form, and constructs the almost monotone regularisations of the second route of 7.7 (b)–(c).
- [Announcement] The announcement of that proof by its author, 20 November 2026: <https://alpo.ge/remark.pdf>.
- J.-P. Demailly, *Regularization of closed positive currents and intersection theory*, J. Algebraic Geom. 1
  (1992): 7.3, 7.4, 7.7.
- J.-P. Demailly, *On the Ohsawa–Takegoshi–Manivel L² extension theorem*, Proceedings of the conference in honour
  of P. Lelong (2000): 3.2, 4.2.
- L. Hörmander, *An Introduction to Complex Analysis in Several Variables*, chapter IV: 3.1.
- H. Skoda, *Sous-ensembles analytiques d'ordre fini ou infini dans ℂⁿ*, Bull. SMF 100 (1972): 1.2.
- Y.-T. Siu, *Analyticity of sets associated to Lelong numbers and the extension of closed positive currents*,
  Invent. Math. 27 (1974): 7.2.
- A. M. Nadel, *Multiplier ideal sheaves and Kähler–Einstein metrics of positive scalar curvature*, Ann. of Math.
  132 (1990): 6.2, 8.2.
- T. Ohsawa and K. Takegoshi, *On the extension of L² holomorphic functions*, Math. Z. 195 (1987); L. Manivel,
  *Un théorème de prolongement L² de sections holomorphes d'un fibré hermitien*, Math. Z. 212 (1993): Layer 4.
- Z. Błocki, *Suita conjecture and the Ohsawa–Takegoshi extension theorem*, Invent. Math. 193 (2013): 4.1, 4.3.
- Q. Guan and X. Zhou, *A solution of an L² extension problem with an optimal estimate and applications*, Ann. of
  Math. 181 (2015), and *A proof of Demailly's strong openness conjecture*, Ann. of Math. 182 (2015): 4.1, 6.6.
- J.-P. Demailly, L. Ein and R. Lazarsfeld, *A subadditivity property of multiplier ideals*, Michigan Math. J. 48
  (2000): 6.4, 6.5.
- R. Lazarsfeld, *Positivity in Algebraic Geometry II*, chapter 9: multiplier ideals and their analytic
  description (6.3).
- Z. Błocki and S. Kołodziej, *On regularization of plurisubharmonic functions on manifolds*, Proc. AMS 135 (2007):
  7.5. R. Richberg, *Stetige streng pseudokonvexe Funktionen*, Math. Ann. 175 (1968): 7.6.
- D. Mumford, *Hirzebruch's proportionality theorem in the non-compact case*, Invent. Math. 42 (1977): Layer 5.
- R. Kobayashi, *Kähler–Einstein metric on an open algebraic manifold*, Osaka J. Math. 21 (1984); S.-Y. Cheng and
  S.-T. Yau, *On the existence of a complete Kähler metric on non-compact complex manifolds*, CPAM 33 (1980):
  quasi-coordinates (5.5).
- G. Tian, *On a set of polarized Kähler metrics on algebraic manifolds*, J. Differential Geom. 32 (1990); T.
  Bouche, *Convergence de la métrique de Fubini–Study d'un fibré linéaire positif*, Ann. Inst. Fourier 40 (1990);
  S. Zelditch, *Szegő kernels and a theorem of Tian*, IMRN (1998); D. Catlin, *The Bergman kernel and a theorem of
  Tian* (1999): 9.1, 9.2.
- R. Berman, *Bergman kernels and local holomorphic Morse inequalities*, Math. Z. 248 (2004): 9.3.
- X. Ma and G. Marinescu, *Holomorphic Morse Inequalities and Bergman Kernels*, Progress in Math. 254 (2007),
  chapter 6: 9.4, 9.6.
- F. Hartogs, *Zur Theorie der analytischen Funktionen mehrerer unabhängiger Veränderlichen*, Math. Ann. 62 (1906);
  L. Hörmander, *Notions of Convexity* (1994), chapter III (Hartogs' lemma, Riesz measures): 0.3a.
- G. Choquet, *Lectures on Analysis* (1969) (Choquet's lemma on upper envelopes): 0.1.
- H. Grauert and R. Remmert, *Plurisubharmonische Funktionen in komplexen Räumen*, Math. Z. 65 (1956): 0.5;
  B. Josefson, *On the equivalence between locally polar and globally polar sets for plurisubharmonic functions on
  ℂⁿ*, Ark. Mat. 16 (1978): 0.5 (the global form, not used).
- J. E. Fornæss and R. Narasimhan, *The Levi problem on complex spaces with singularities*, Math. Ann. 248 (1980): 0.6,
  7.5(b).
- P. Lelong, *Intégration sur un ensemble analytique complexe*, Bull. SMF 85 (1957); Y.-T. Siu's paper above and
  P. Thie, *The Lelong number of a point of a complex analytic set*, Math. Ann. 172 (1967): 1.1.
- T. Ransford, *Potential Theory in the Complex Plane* (1995) (Riesz decomposition, removable singularities): 0.3a, 2.5.
- R. Lazarsfeld, *Positivity in Algebraic Geometry I* (2004), §2.2 (Kodaira's lemma): 2.6.
- N. Suita, *Capacities and kernels on Riemann surfaces*, Arch. Rational Mech. Anal. 46 (1972): 4.3.
- M. Cornalba and P. Griffiths, *Analytic cycles and vector bundles on non-compact algebraic varieties*, Invent. Math. 28
  (1975): 5.5.
- P. H. Hiep, *The weighted log canonical threshold*, C. R. Math. Acad. Sci. Paris 352 (2014): 6.6.
