# Roadmap: positivity of Dirichlet series with kernels

**Summary.** This roadmap proves Landau's theorem for Laplace transforms in a classical and a windowed form (Layer 6), and, independently of it, Laplace's method in several variables and stationary phase over `ℂ^n` and over non-archimedean rings (Layers 7 and 8). Landau's theorem says that the real abscissa of convergence of the Laplace transform of an eventually nonnegative function is a singularity of the transform. Applied to `C e^(θu) − g`, it says that a function bounded above by `C e^(θu)` has its rightmost singularity on the real axis, with a sign. This roadmap proves that theorem, and a windowed form in which the bound is known only on windows arbitrarily far out, for the one-sided transform `Φ(s) = ∫₀^∞ g(u) e^(−su) du` of a measurable real function `g` with `∫₀^∞ |g(u)| e^(−σu) du < ∞` for every real `σ > A`, continued meromorphically to a half-plane `Re s > θ` with `θ < A`. The windowed form is stated twice: in the form of the formal proof [FormalProof], for transforms with simple poles and positive residues at the real poles under a pointwise bound, and for poles of any finite order, as this roadmap's extension. The windowed proof is a positivity argument applied to one Taylor coefficient of `Φ` at a time: the coefficient is the integral of `g` against the Gamma kernel `u^k e^(−au)/k!`, which is small off a window. The windowed form also follows, by a short argument, from a theorem of Kaczorowski and Pintz (1986) on sign changes in every interval `[Y^(1−ε), Y]` with `Y` large (6.8); the proof here is direct. Layers 7 and 8 prove Laplace's method in several variables with the non-vanishing of the integrals it controls, the leading term of stationary phase for holomorphic phases on `ℂ^n`, and an exact stationary-phase formula over finite products of `p`-adic fields, both applied to the phase `Σ x_k + D/∏ x_k`.

The headline theorems are these. (1) If `g(u) ≤ C e^(θu)` for almost every `u ≥ u₀`, then either `Φ` has no pole in `Re s > θ` and the transform converges absolutely there, or the poles of `Φ` in `Re s > θ` have a largest real part, attained at a real pole `β` whose leading Laurent coefficient is negative, and the transform converges absolutely on `Re s > β`; so positive leading coefficients at the real poles exclude every pole. (2) When the bound is known only on windows: let `|g(u)| ≤ C₀ e^(2u)`, let `Φ` continue meromorphically to `Re s > 0` with simple poles only and positive residues at the real poles, and let `0 < θ < 1`. If for some `δ > 0` and every `η > 0` there are arbitrarily large `U` with `∫_U^((1+δ)U) max(g, 0)(u) e^(−θu) du ≤ e^(ηU)`, then `Φ` has no pole in `Re s > θ`. This roadmap's extension gives the dichotomy of (1) for the poles under the same windows, for poles of any finite order, under the integrability hypothesis alone and with continuation only to `Re s > θ`. Windows of bounded length do not suffice, and without a one-sided bound the conclusion fails: `e^(βu) cos(γu)` has only the nonreal poles `β ± iγ`. (3) In the variable `y = e^u` the windows are `[Y, Y^λ]` and the transform is the Mellin transform `∫₁^∞ G(y) y^(−s−1) dy`. If `|G(y)| ≤ C₀ y²`, the transform continues meromorphically to `Re s > 0` with simple poles only and positive residues at the real poles, `0 < θ < 1`, and if for a fixed `λ > 1` the set of `y ≥ 1` with `G(y) ≤ C y^θ` contains intervals `[Y, Y^λ]` with `Y` arbitrarily large, then the transform has no pole in `Re s > θ`. In the extension, if the transform converges absolutely for every real `s > A` and continues meromorphically to `Re s > θ`, the same windows give that either the transform has no pole in `Re s > θ`, or its poles there have a largest real part, attained at a real pole with negative leading coefficient. Of (2), [FormalProof] proves the case of simple poles with positive residues at the real poles, under a pointwise bound `|g(u)| ≤ C₀ e^(2u)`, and that case of (3) follows from it by `y = e^u` (the formal proof states the Mellin form only for a weighted family of Dirichlet characters); (1) is this roadmap's own formulation of the one-sided use of Landau's theorem; [FormalProof] states and proves Landau's theorem itself in the Mellin variable (6.3), and its main theorems do not depend on it. (4) Laplace's method in several variables: let `E` be a finite-dimensional real normed space of dimension `n` with a Haar measure, `B` a real-bilinear form on `E` with complex values, and `c, γ > 0`; if functions `f_t` on `E`, indexed by the positive integers and measurable for large `t`, satisfy `f_t(Y/√t) → e^(−B(Y,Y))` for every `Y` as `t → ∞` and `|f_t(Y)| ≤ (1 + c‖Y‖²)^(−γt)` for all large `t` and all `Y`, then `Re B(Y,Y) > 0` for `Y ≠ 0`, `t^(n/2) ∫ f_t → ∫ e^(−B(Y,Y)) dY`, this limit is not zero, and so `∫ f_t ≠ 0` for all large `t`. (5) Stationary phase on `ℂ^n`: let `g` be holomorphic on the polydisc of radius `2r` about `x₀` and bounded by `Λ` there, with `∇g(x₀) = 0` and `‖x − x₀‖ ≤ Λ‖∇g(x)‖` on the closed polydisc of radius `r`, and let `a` be a `C^(2n+2)` function with values in a complex Banach space, vanishing outside that closed polydisc, whose derivatives of order at most `2n + 2` are bounded by `S`; then the Hessian `H` of `g` at `x₀` is invertible, and the integral of `exp(i Re(βg(x)/t)) a(x)` against the `n`-th power of the Haar measure on `ℂ` self-dual for `w ↦ exp(i Re(βw))` differs from `exp(i Re(βg(x₀)/t)) |t|^n |det H|^(−1) a(x₀)` by at most `C S |t|^(n+1)` for every `t ≠ 0`, with `C` depending only on `n`, `β`, `r` and `Λ`.

The transform and its convergence are the predicate `HasLaplace` of [ArithmeticDirichletSeriesPartII](../../ArithmeticDirichletSeriesPartII/README.md), whose §0.1b states Landau's theorem for functions of one sign (6.3), whose boundary data fix the normalisation of the leading coefficient and whose counting-function transform gives the Dirichlet-series form (for coefficients of any sign, its §4.1a, of which the transform identity of 6.9 (c) is a corollary). Landau's theorem for Dirichlet series with nonnegative coefficients is that of the completed [ArithmeticDirichletSeries](../../../Completed/ArithmeticDirichletSeries/README.md), with which the transform form agrees. [AsymptoticExpansions](../../AsymptoticExpansions/README.md) states the holomorphy of the Laplace integral with its derivatives (§4.1a, of which 6.1 (a), the formula of 6.1 (b) and the conjugation in 6.1 (c) are corollaries) and Darboux's method for meromorphic functions (§13.6a, of which the first estimate of 6.6 (b) is a corollary). Laplace's method and stationary phase in one variable are AsymptoticExpansions Layers 5 and 6; Layers 7 and 8 are their analogues in several variables and over non-archimedean rings, and use no statement of them; the Gauss factor of the non-archimedean Gaussian integrals of Layer 8 is identified with the Weil index of [MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md). In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [GeneralizedRiemannHypothesisFromWindowBounds](../GeneralizedRiemannHypothesisFromWindowBounds/README.md) applies the one-sided and windowed theorems to sums over primes, [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) uses the window predicate, and [BesselPoincareSeriesAndGramBounds](../BesselPoincareSeriesAndGramBounds/README.md) uses Layers 7 and 8 for archimedean and local integrals.

Layer 6 first expresses the Taylor coefficients of a transform as integrals against the Gamma kernel (6.1, 6.2), states the classical theorem as ArithmeticDirichletSeriesPartII §0.1b has it (6.3) and proves its meromorphic, one-sided and rightmost-pole forms (6.4). It then proves the three ingredients of the windowed theorem: one coefficient per window is bounded by positivity (6.5), a pole makes coefficients large (6.6), and a suitable expansion point exists (6.7). 6.8 is the windowed theorem, in the form of the formal proof (simple poles with positive residues at the real poles, under a pointwise bound) and in this roadmap's extension to poles of any finite order, 6.9 its Mellin and Dirichlet-series forms with the window predicate, and 6.10 its agreement with Landau's theorem for Dirichlet series. Layer 7 is Laplace's method in several variables with a majorant uniform in the integer parameter, and the non-vanishing of the integrals for large parameter. Layer 8 is, over `ℂ^n`, the leading term of stationary phase for holomorphic phases with Banach-valued amplitudes and a remainder bounded by finitely many derivatives of the amplitude, with the critical data of the phase `Σ x_k + D/∏ x_k`; and, over a finite product of `p`-adic fields with a self-dual compact open subring, Gaussian integrals over admissible lattices and the exact stationary-phase formula for the same phase. Layers 7 and 8 use nothing of Layer 6.

## Conventions

Notation and conventions not restated here are those of ArithmeticDirichletSeriesPartII for Layer 6 (its Conventions, among them the ordinary one-sided Laplace transform, the inclusive counting function `S_c(X) = Σ_{1≤n≤X} c(n)` and `X^a` as `Real.rpow`, and the predicate `HasLaplace` of ArithmeticDirichletSeriesPartII §0.1). Layers 7 and 8 use only the notation of the last three rows below.

| Subject | Convention |
| --- | --- |
| Taylor coefficients (Layer 6) | For `Φ` analytic near `z`, `a_k(z) = (−1)^k Φ^(k)(z)/k!`, so that `Φ(z − t) = Σ_k a_k(z) t^k`. For a Laplace transform this makes `a_k(z) = ∫₀^∞ g(u) u^k e^(−zu)/k! du`, with no sign `(−1)^k`. The normalisation of `a_k` is that of [FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauCoeff.lean` (`Deduction.landau_coeff`). |
| Gamma kernel (Layer 6) | `w_k^a(u) = u^k e^(−au)/k!` for `u > 0`, every real rate `a` and `k ∈ ℕ`; 6.1 (b) and 6.5 (a) use it at every rate `σ > A`, which may be `≤ 0`. This is notation, not a new definition. For `a > 0`, `w_k^a = a^(−k−1) · ProbabilityTheory.gammaPDFReal (k + 1) a` on `(0, ∞)`, and the lemmas of 6.2, all at positive rate, are stated for that expression; for `a ≤ 0` the kernel has infinite mass and no such form (at `a = 0`, `k = 0` it is the constant `1`, while the displayed expression vanishes, `gammaPDFReal 1 0` carrying the factor `0^1`). |
| meromorphic continuation (Layer 6) | One function `Φ : ℂ → ℂ` with `MeromorphicOn Φ {s | θ < s.re}` and `HasLaplace g s (Φ s)` for `Re s > A` (in the forms with the hypotheses of the formal proof of 6.8 and 6.9 (b), `MeromorphicOn Φ {s | 0 < s.re}` with `A = 2`). A pole is a point `ρ` with `meromorphicOrderAt Φ ρ < 0`; its order is `m = −meromorphicOrderAt Φ ρ`. Mathlib's meromorphic functions have poles of finite order only. A meromorphic function may take arbitrary values at its poles and at its removable singularities, so Layer 6 says "`Φ` has no pole in" a region, never "`Φ` is holomorphic on" it, and it uses values of `Φ` near a pole or on a circle only after passing to the normal form `toMeromorphicNFOn Φ {s | θ < s.re}` (6.1 (c)). |
| leading coefficient (Layer 6) | At a pole `ρ` of order `m`, `meromorphicTrailingCoeffAt Φ ρ`: the value `h(ρ)` in `Φ(s) = (s − ρ)^(−m) h(s)` near `ρ`, `h` analytic, `h(ρ) ≠ 0`. It depends only on `Φ` on a punctured neighbourhood of `ρ` (`meromorphicTrailingCoeffAt_congr_nhdsNE`), so `Φ` and its normal form have the same leading coefficients. This is the normalisation of the leading coefficient `A` of `PoleBoundary` (ArithmeticDirichletSeriesPartII §0.2); at a simple pole it is the residue. For real `g` the Laurent coefficients at a real pole are real (6.1 (c)); "negative leading coefficient" means a negative real number. |
| windows (Layer 6) | In the Laplace variable, `[U, λU]` with a fixed `λ > 1` (written `λ = 1 + δ`) and `U → ∞`; in the Mellin variable `y = e^u`, `[Y, Y^λ]` with `Y^λ = Real.rpow`. `g⁺ = max(g, 0)`. The windows are those of [FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean` (`Deduction.WindowHypU`), `Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.WindowHyp`). |
| several variables (Layer 7) | `E` is a finite-dimensional real normed space with a Haar measure `μ`, `n = dim E`; the parameter `t` runs over the positive integers, and `t → ∞` means `t → +∞`. |
| characters and measures on `ℂ` (8.1) | For `β ∈ ℂ^×`, `ψ_β(w) = exp(i Re(βw))`; these are the nontrivial continuous characters of `ℂ`. `μ_β = (|β|/2π) ·` Lebesgue measure on `ℂ = ℝ²` is the Haar measure self-dual for `ψ_β`; `ℂ^n` carries the product measure `μ_β^n` and the sup norm `‖x‖ = max_k |x_k|`, and `B(x₀, r)`, `B̄(x₀, r)` are the open and closed polydiscs. For a function on `ℂ^n = ℝ^(2n)`, `D^j` is its `j`-th real Fréchet derivative with the operator norm; for a holomorphic `g`, `∇g = (∂g/∂x_k)_k` (with the sup norm) and `D_ℂ^j g` is its `j`-th complex derivative. The characters `ψ_β` and the measures `μ_β`, `μ_β^n` are those of [FormalProof], `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.psi`), `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.mu`), `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.muPi`). |
| the non-archimedean ring (8.2) | `K` is a finite product of finite extensions of fields `ℚ_p`, `𝔒 ⊂ K` a compact open subring, and `ψ : K → S¹` an additive character with `{a ∈ K : ψ(a𝔒) = 1} = 𝔒`. A *lattice* is a compact open subgroup of `(K, +)`; `L^⊥ = {a ∈ K : ψ(aL) = 1}`; `dx` is the Haar measure on `K` with `vol(𝔒) = 1`; `|a|` is the module of `a ∈ K^×`, `d(ax) = |a| dx`. Integrals over `K^m` are of locally constant functions with compact support. `𝟙` is the all-ones vector and `H_m(a) = a^(−1)(1 + 𝟙𝟙ᵀ) ∈ M_m(K)` for `a ∈ K^×`. |

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The statements of 6.4 and 6.10 are not statements
of [FormalProof], which states 6.3 only in the Mellin variable and whose main theorems do not depend on it: 6.3 is Landau's theorem as ArithmeticDirichletSeriesPartII §0.1b states it; 6.4 draws from it meromorphic and one-sided forms, which are this
roadmap's own formulations; 6.10 compares the transform of the counting function with Landau's theorem for Dirichlet
series, completed ArithmeticDirichletSeries 8.1. The parts of the other sections that [FormalProof] does not state are
named with each and in the entry [FormalProof] of the References.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary
of:*`, which names a general theorem and the roadmap section that states it, and the clauses it covers when it does
not cover the whole section. The general theorem is proved in the roadmap that states it, and what the line covers
is deduced from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the
general theorem in full: the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which
form of the statement when that proof has a narrower one. Where the route given with the section is not the
deduction, it is a second proof, [FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists
what that route needs, and the deduction needs the section that the `*Corollary of:*` line names.

## Layer 6: Landau's theorem for Laplace transforms, classical and windowed

Landau's theorem says that the real abscissa of convergence of the transform of an eventually
nonnegative function is a singularity. Applied to `C e^(θu) − g`, it says that a function bounded
above for all large `u` has its rightmost singularity on the real axis, with a sign. This layer
states that theorem as ArithmeticDirichletSeriesPartII §0.1b has it, proves its meromorphic and one-sided forms, and then a windowed form, in which the
bound is known only on windows `[U, (1+δ)U]` arbitrarily far out. The windowed proof expands the
transform at a far-out point `σ + iγ`, uses one Taylor coefficient per window, bounds it through
the window by positivity of the Gamma kernel, and shows that a pole right of `θ` makes the same
coefficient too large. Meromorphy of the continuation is assumed: unlike the classical case,
convergence of the transform left of its abscissa cannot be proved, since `g` is controlled only
on the windows. In the extensions of 6.8 and 6.9 (b), growth enters only through integrability:
`∫₀^∞ |g(u)| e^(−σu) du < ∞` for every `σ > A`; no pointwise bound on `g` and no normalisation of `A` or `θ`
is used. Their forms with the hypotheses of the formal proof assume `|g(u)| ≤ C₀ e^(2u)`, continuation to
`Re s > 0` and `0 < θ < 1`, a normalisation (6.8).

Throughout, `g : ℝ → ℝ` is measurable and only its values on `(0, ∞)` matter; its transform is
`HasLaplace (fun u ↦ (g u : ℂ)) s (Φ s)` in the notation of ArithmeticDirichletSeriesPartII §0.1.

### 6.1 Taylor coefficients of a Laplace transform

*Origin:* published: Widder (1941), chapter II, for (a) and the formula of (b): the transform is analytic on its
half-plane of absolute convergence and is differentiated under the integral sign (AsymptoticExpansions §4.1a, which
states these with the conjugation `Φ(s̄) = conj Φ(s)` of (c)). [FormalProof] has the formula of (b), and of (c) a bound
for `Φ` and `Re ρ ≤ 2` at the poles, only for `|g(u)| ≤ C e^(2u)` (`u ≥ 0`) on `Re s > 2`; beyond that case go (a) and
(b) for every `A` under the integrability hypothesis alone, the reality of `a_k(σ)`, the conjugation and the normal form
of (c). The bound of `a_k` by the Gamma kernel in (b), the bound of `Φ` in (c) in the form
`|Φ(s)| ≤ ∫₀^∞ |g(u)| e^(−σ′u) du` and the normal form of a meromorphic continuation in (c), with the symmetry of its
poles and the real Laurent coefficients at a real pole, are this roadmap's own formulation.

*Method of the formal proof:* only for measurable `g` with `|g(u)| ≤ C e^(2u)` for `u ≥ 0`, at the points `s` with
`Re s > 2`: by induction on `k`, differentiating under the integral sign, the integral of `g(u)(−u)^k e^(−su)` has
complex derivative the integral of `g(u)(−u)^(k+1) e^(−su)` (at `k = 0`, the transform is complex differentiable), so
`(−1)^k Φ^(k)(s)/k! = ∫₀^∞ g(u) u^k e^(−su)/k! du`, the formula of (b); of (c) it has `|Φ(s)| ≤ ∫₀^∞ C e^(−(σ′−2)u) du`
on `Re s ≥ σ′` for each `σ′ > 2`, and `Re ρ ≤ 2` at the poles of a meromorphic continuation. The route written here is
the same induction for every `A` under the integrability hypothesis alone, and it proves the other clauses of (c),
which are not in [FormalProof], by conjugation under the integral, `|e^(−su)| = e^(−σu)` and Mathlib's normal form with
the identity theorem.

*Corollary of:* AsymptoticExpansions §4.1a (holomorphy of the Laplace integral `Q(z) = ∫₀^∞ e^(−zt) q(t) dt` on
`Re z > c` when `e^(−σt) q(t)` is integrable on `(0, ∞)` for every real `σ > c`, with
`Q^(k)(z) = (−1)^k ∫₀^∞ t^k e^(−zt) q(t) dt` and `Q(z̄) = conj Q(z)` for real-valued `q`), for (a), the integrability and
the formula of (b) and the conjugation in (c) only; the bounds in (b) and (c) and the normal form of (c) are not
corollaries of it.

Let `A ∈ ℝ` and let `g` be measurable with
`u ↦ g(u) e^(−σu)` integrable on `(0, ∞)` for every real `σ > A`. Then:

- (a) `HasLaplace g s (Φ s)` for every `s` with `Re s > A`, where `Φ(s) = ∫₀^∞ g(u) e^(−su) du`, and
  `Φ` is analytic on `{Re s > A}`;
- (b) for every `k ∈ ℕ` and every `z` with `Re z > A`, `u ↦ g(u) u^k e^(−zu)` is integrable on
  `(0, ∞)` and
  ```text
  a_k(z) = (−1)^k Φ^(k)(z)/k! = ∫₀^∞ g(u) u^k e^(−zu)/k! du ;
  ```
  in particular `a_k(σ)` is real for real `σ > A`, and `|a_k(σ + iγ)| ≤ ∫₀^∞ |g| w_k^σ` for real `γ`;
- (c) `Φ(s̄) = conj Φ(s)` on `Re s > A`, and `|Φ(s)| ≤ ∫₀^∞ |g(u)| e^(−σ′u) du` on `Re s ≥ σ′ > A`.
  Let `Φ̃` be meromorphic on `{Re s > θ}`, `θ < A`, with `Φ̃(s) = Φ(s)` on `Re s > A`, and let
  `Φ̂ = toMeromorphicNFOn Φ̃ {Re s > θ}` be its normal form. Then the poles of `Φ̃` lie in
  `θ < Re s ≤ A` and form a closed discrete subset of `{Re s > θ}`; `Φ̂` has the same poles, orders
  and leading coefficients as `Φ̃`, is analytic at every other point of the half-plane, and equals
  `Φ` on `Re s > A`; the set of poles is invariant under `s ↦ s̄`, `Φ̂(s̄) = conj Φ̂(s)` at every
  point that is not a pole, and at a real pole every Laurent coefficient is real.

*Proof sketch.* (a), (b): induction on `k`, differentiating under the integral sign
(`hasDerivAt_integral_of_dominated_loc_of_deriv_le`) on the disc of radius `r = (Re z₀ − A)/2` about
`z₀`; on it `|g(u) u^(k+1) e^(−zu)| ≤ C_k |g(u)| e^(−(A + r/2)u)`, which is integrable, and
`(d/dz)(u^k e^(−zu)/k!) = −(k + 1) u^(k+1) e^(−zu)/(k + 1)!`. (c): conjugation under the integral and
`|e^(−su)| = e^(−σu)`. On `Re s > A` the continuation equals the analytic `Φ`, so it has no pole
there, and the normal form does not change values at points of analyticity; Mathlib gives
discreteness of the poles, analyticity of the normal form off them, and equality of punctured germs
(hence of orders and leading coefficients). The function `s ↦ conj Φ̂(s̄)` is meromorphic in normal
form on the half-plane and agrees with `Φ̂` on `Re s > A`; by the identity theorem on the connected
complement of the discrete pole set the two agree off the poles, so the poles and their Laurent
expansions are symmetric, and at a real pole the coefficients are real.
*Needs:* ArithmeticDirichletSeriesPartII §0.1; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `MeromorphicOn`,
`meromorphicOrderAt`, `toMeromorphicNFOn` and its API, `meromorphicTrailingCoeffAt_congr_nhdsNE`, the
identity theorem.

**Checks.**

- `g = 1`: `Φ(s) = 1/s` on `Re s > 0` and `a_k(z) = z^(−k−1)`, which is `∫₀^∞ u^k e^(−zu)/k! du`. A
  convention without the sign `(−1)^k` would give `(−1)^k z^(−k−1)`.
- `g(u) = e^(Au)` has a pole at `s = A` on the boundary line: the bound on poles is `Re ρ ≤ A`, not
  `Re ρ < A`.
- For `g = 1` (`A = 0`) and `θ = −1`, the function `Φ̃` equal to `1/s` except at `s = −1/2`, where it
  is `0`, is meromorphic on `Re s > −1` and equals `Φ` on `Re s > 0`; it has no pole at `−1/2` but is
  not analytic there, and its normal form is `1/s`. "No pole" is the property that passes to the
  normal form; "holomorphic" is not.

### 6.2 The Gamma kernel

*Origin:* particular to this proof: the mass, the supremum and the tails of the kernels `u^k e^(−au)/k!` (the kernels
of the Post–Widder inversion formula, Widder (1941)) in the forms the windowed theorem uses; the profile (c) and the
supremum off a window (d) are this roadmap's own formulation.

*Method of the formal proof:* the mass is the Gamma integral, the supremum is `(au)^k/k! ≤ e^(au)`, and the mass off
`[U, V]` comes from the pointwise bound `e^(−au) ≤ e^(−lV) e^(−(a−l)u) + e^(lU) e^(−(a+l)u)` off the interval (an
exponential tilt on each side), integrated with the Gamma integral; the window form takes `l = 2 + 6/δ`,
`σ = l(1 + δ)(l + 2)`, `k = ⌈(1 + δ/2)σU⌉` and uses `1 + x ≤ e^x`. The lower bound and the shift of (b), the profile (c)
and the supremum off a window (d) are not in [FormalProof].

The kernel `w_k^a(u) = u^k e^(−au)/k!` of the Conventions, at a positive rate. Let `a > 0` and `k ∈ ℕ`; then
`w_k^a(u) = a^(−k−1) gammaPDFReal (k + 1) a u` for `u > 0`.

- (a) *Mass.* `∫₀^∞ w_k^a(u) du = a^(−k−1)`. This is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/kernelIntegral.lean` (`Deduction.kernel_integral`).
- (b) *Supremum and shift.* `0 ≤ w_k^a(u) ≤ a^(−k)` for `u ≥ 0`; and `w_k^(a′)(u) = e^(−bu) w_k^(a′−b)(u)` for all
  real `a′` and `b` (the kernel at every rate of the Conventions), so that a kernel at any rate is an exponential
  times one at a positive rate. The upper bound `w_k^a(u) ≤ a^(−k)` for `u ≥ 0` is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauKernelMax.lean` (`Deduction.landau_kernel_max`).
- (c) *Profile.* Put `φ(t) = t e^(1−t)` for `t > 0`. For `k ≥ 1` and `t > 0`,
  `w_k^a(tk/a) ≤ a^(−k) φ(t)^k`.
- (d) *Supremum off a window.* For `λ > 1` put
  ```text
  q_λ = max( φ(λ^(−1/2)), φ(λ^(1/4)) ) < 1,      U_λ(τ) = 1/(τ λ^(1/2) (λ^(1/4) − 1)) .
  ```
  For `τ ≥ 1` and `U ≥ U_λ(τ)` the integer `k = ⌈τ λ^(1/2) U⌉` satisfies `k ≥ U` and
  ```text
  w_k^τ(u) ≤ τ^(−k) q_λ^k      for every u > 0 with u ∉ [U, λU] .
  ```
- (e) *Mass off an interval.* For `k ∈ ℕ`, reals `U, V` and `0 ≤ l < a`:
  `∫_((0,∞)∖[U,V]) w_k^a(u) du ≤ e^(−lV) (a − l)^(−k−1) + e^(lU) (a + l)^(−k−1)`. This is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauTails.lean` (`Deduction.landau_tails_chernoff`).
- (f) *Mass off a window.* For every `δ > 0` there are `σ > 2` and `C_δ` such that for every `U ≥ 1` there is an integer
  `k ≥ U` with `∫_((0,∞)∖[U,(1+δ)U]) w_k^(σ−2)(u) du ≤ C_δ σ^(−k)`. This is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauTails.lean` (`Deduction.landau_tails`).

*Proof sketch.* (a) is `Γ(k + 1) = k!` (`Real.integral_rpow_mul_exp_neg_mul_Ioi`), equivalently the
total mass `1` of the Gamma density (`lintegral_gammaPDF_eq_one`). (b) is `(au)^k/k! ≤ e^(au)`
(`Real.pow_div_factorial_le_exp`). (c): `w_k^a(tk/a) = a^(−k) t^k k^k e^(−tk)/k!` and `k! ≥ (k/e)^k`
(the same lemma at `x = k`). (d): `φ` increases on `(0, 1]`, decreases on `[1, ∞)` and is `< 1` off
`t = 1`, so `q_λ < 1`. Write `u = tk/τ`. Since `k ≥ τλ^(1/2)U`, `u < U` gives `t < λ^(−1/2)`; since
`k ≤ τλ^(1/2)U + 1 ≤ τλ^(3/4)U` (this is `U ≥ U_λ(τ)`), `u > λU` gives `t > λ^(1/4)`; in both cases
(c) gives `w_k^τ(u) ≤ τ^(−k) q_λ^k`. Finally `k ≥ τλ^(1/2)U ≥ U` as `τ ≥ 1`.
(e): off `[U, V]`, `e^(−au) ≤ e^(−lV) e^(−(a−l)u) + e^(lU) e^(−(a+l)u)`; multiply by `u^k/k!` and use (a).
(f): `l = 2 + 6/δ`, `σ = l(1 + δ)(l + 2)`, `k = ⌈(1 + δ/2)σU⌉`, and (e) with `a = σ − 2`, `V = (1 + δ)U`.
The estimates (c) and (d) are the roadmap's; [FormalProof] bounds the mass of the kernel off the window instead,
(e) and (f), under a pointwise bound for `g` (6.5 (c)).
*Needs:* Mathlib `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.pow_div_factorial_le_exp`,
`ProbabilityTheory.gammaPDFReal`, `ProbabilityTheory.lintegral_gammaPDF_eq_one`.

**Checks.**

- `λ = 4`: `φ(1/2) = e^(1/2)/2 ≈ 0.824` and `φ(√2) = √2 e^(1−√2) ≈ 0.935`, so `q_4 ≈ 0.935`, and
  `U_4(1) = 1/(2(√2 − 1)) ≈ 1.21`.
- At `λ = 1` the construction breaks: `φ(1) = 1`, so off a window of ratio one only the trivial
  supremum `τ^(−k)` of (b) is available. The ratio `λ > 1` is what makes the kernel small off the
  window.
- (a) at `k = 0` is `∫₀^∞ e^(−au) du = 1/a`; (c) is an equality up to the factor `k^k e^(−k)/k!`
  at `t = 1`, where the kernel has its maximum `w_k^a(k/a)`.

### 6.3 Landau's theorem

*Origin:* published: Landau (1905), Landau's theorem for the Laplace transforms of functions of one sign, as
ArithmeticDirichletSeriesPartII §0.1b states it.

*Method of the formal proof:* its main theorems do not depend on this statement. [FormalProof] states it in the
variable `x = e^u`, for `H` with `H(x) ≥ 0` at every `x > 1`: if `a′ < a`, `x ↦ H(x) x^(−σ−1)` is integrable on
`(1, ∞)` for every real `σ > a`, and `Φ` is analytic on `Re s > a` and at every real point of `(a′, a]`, with
`Φ(s) = ∫₁^∞ H(x) x^(−s−1) dx` on `Re s > a`, then the integral converges absolutely and equals `Φ(σ)` for every real
`σ > a′` (`Formalism/ZetaRealNonvanish.lean` (`Formalism.LandauLemma`), `Formalism/DefsOC.lean`
(`Formalism.LandauEq`)). It proves it by the classical argument: the Taylor coefficients of `Φ` at a real point are
integrals of `H` against powers of `log x`, and positivity carries the convergence of the Taylor series to that of the
integral (`Formalism/ZetaNonvanishing/LandauLemma.lean` (`Formalism.landauLemma_of`),
`Formalism/ZetaNonvanishing/LandauEq.lean` (`Formalism.landauEq`)).

Let `a ∈ ℝ`, `u₀ ≥ 0`, and let
`f : ℝ → ℝ` be measurable with `f(u) ≥ 0` for almost every `u ≥ u₀` and `HasLaplace f s (F s)` for
every `s` with `Re s > a`. If there are `r > 0` and `F₁` analytic on the ball `B(a, r)` with
`F₁(s) = F(s)` for `s ∈ B(a, r)` with `Re s > a`, then there is `a′ < a` such that `HasLaplace f s`
holds for every `s` with `Re s > a′`, and its value equals `F₁(s)` on `B(a, r) ∩ {Re s > a′}`.
Equivalently: if the infimum `σ_c` of the real `σ` at which `u ↦ f(u) e^(−σu)` is integrable is
finite, then `F` has no analytic continuation to a neighbourhood of `σ_c`.

This is ArithmeticDirichletSeriesPartII §0.1b with `A = a` and `H = F₁`: on the convex set `B(a, r) ∩ {Re s > a′}` the
value is analytic and equals `F₁` where `Re s > a`, hence everywhere by the identity theorem.
*Needs:* ArithmeticDirichletSeriesPartII §0.1b; Mathlib the identity theorem.

**Checks.**

- `f(u) = e^(−u)`: `F = 1/(s + 1)` is analytic at `0`, and indeed the transform converges on `Re s > −1`.

### 6.4 Meromorphic and one-sided forms

*Origin:* this roadmap's own formulation: the meromorphic form (a) of Landau's theorem (ArithmeticDirichletSeriesPartII
§0.1b, through 6.3) and its one-sided forms (b)–(d), for `C e^(θu) − g` and `C e^(θu) + g`, with the signs of the leading coefficients at
real poles of any finite order, drawn from Landau's theorem as in the one-sided oscillation theorems of Montgomery and
Vaughan (2007), §15.1.

*Method of the formal proof:* none; the statement is not in [FormalProof].

(a) Let `f` be as in 6.3
(eventually nonnegative, transform `F` on `Re s > a`) and let `b < a`. If `F₂` is meromorphic on
`{Re s > b}`, `F₂ = F` on `Re s > a`, and `F₂` has no pole on the real segment `(b, a]`, then
`F₂` has no pole in `Re s > b`, `HasLaplace f s` holds for every `s` with `Re s > b`, and its value
is that of the normal form of `F₂` (6.1 (c)), which equals `F₂` wherever `F₂` is analytic.

In (b)–(d), let `θ < A`, let `g` be measurable with `HasLaplace g s (Φ s)` for `Re s > A`, and let
`Φ` be meromorphic on `{Re s > θ}`.

(b) *Positive leading
coefficients exclude poles.* Suppose `g(u) ≤ C e^(θu)` for almost every `u ≥ u₀`, for some real `C`
and `u₀`. If `meromorphicTrailingCoeffAt Φ β > 0` at every real pole `β ∈ (θ, A]` of `Φ` (in
particular, if `Φ` has no real pole there), then `Φ` has no pole in `Re s > θ`, `HasLaplace g s`
holds for every `s` with `Re s > θ`, and `∫₀^∞ |C e^(θu) − g(u)| e^(−σu) du < ∞` for every real
`σ > θ`.

(c) *The rightmost pole is real.* Under the
one-sided bound of (b), without the condition on signs, exactly one of the following holds:

- (i) `Φ` has no pole in `Re s > θ`, and `HasLaplace g s` holds for every `s` with `Re s > θ`;
- (ii) `Φ` has a real pole `β > θ` such that every pole `ρ` of `Φ` in `Re s > θ` has `Re ρ ≤ β`,
  the leading coefficient `meromorphicTrailingCoeffAt Φ β` is a negative real number, and
  `HasLaplace g s` holds for every `s` with `Re s > β`.

Stated as `rightmost_pole_real_of_le` in `Suggested.lean`.

(d) *Lower bounds.* If instead `g(u) ≥ −C e^(θu)` for almost every `u ≥ u₀`, then (b) and (c) hold
with the signs of the leading coefficients reversed: negative leading coefficients at the real
poles in `(θ, A]` exclude every pole in `Re s > θ`, and otherwise the rightmost pole is real with
positive leading coefficient.

*Proof sketch.* (a): let `σ_c` be the abscissa of `f`; the transform is analytic on `Re s > σ_c` and
equals `F₂` there off the poles (identity theorem). If `σ_c > b`, the normal form of `F₂` is
analytic at the real point `σ_c`, contradicting 6.3; so `σ_c ≤ b`, and a pole in `Re s > b`
would be a point where `F₂` agrees off a discrete set with an analytic function. (c): apply (a)
and 6.3 to `h = C e^(θu) − g`, eventually nonnegative, with transform `H(s) = C/(s − θ) − Φ(s)`,
meromorphic on `Re s > θ` with the poles of `Φ`. If its abscissa is `≤ θ`, (i) holds. Otherwise the
abscissa `β > θ` is a singularity of `H` (6.3), hence a real pole of `Φ`, and `H`, `Φ` have no pole
in `Re s > β`. For real `σ ↓ β`, `H(σ) = ∫₀^(u₀) h e^(−σu) + ∫_(u₀)^∞ h e^(−σu)` is bounded below,
while `H(σ) ~ c_H (σ − β)^(−m)` with `c_H` real and nonzero (6.1 (c)); so `c_H > 0`, and the leading
coefficient of `Φ` at `β` is `−c_H`. (b): the sign condition excludes (c)(ii); then (c)(i) and (a)
for `h` give the convergence, which is absolute since `HasLaplace` includes integrability. (d) is
(b) and (c) for `−g`.
*Needs:* 6.1, 6.3 (ArithmeticDirichletSeriesPartII §0.1b).

**Checks.**

- `g(u) = −e^(βu)`, `θ < β ≤ A`: case (c)(ii) with leading coefficient `−1`. So in (b) the sign
  condition cannot be dropped.
- `g(u) = −u e^(βu)`, `θ < β < A`: `Φ(s) = −(s − β)^(−2)` has residue `0` and leading coefficient
  `−1`: the sign is carried by the leading coefficient, not by the residue.
- `g(u) = e^(βu) cos(γu)`, `γ ≠ 0`, is not bounded above by `C e^(θu)` for `θ < β`, and its transform
  `(s − β)/((s − β)² + γ²)` has only the nonreal poles `β ± iγ`: the one-sided bound is needed.

### 6.5 Coefficient inequalities on a window

*Origin:* adapted from Pintz (1980), §§10–12: his window inequality, a twisted integral bounded by the untwisted one where
the function has one sign, with the kernel's tails off the window, here for one Taylor coefficient of the Laplace
transform, with the kernel `u^k e^(−σu)/k!`; the step `k = 0` is written out in Mahatab and Mukhopadhyay (2015),
proof of Theorem 3.2. The form (b), with the supremum of the kernel off the window, is this roadmap's own formulation.

*Method of the formal proof:* `|a_k(σ + iγ)| + a_k(σ)` is at most the integral of `|g| + g` against `u^k e^(−σu)/k!`;
on the window `|g| + g` is at most twice a nonnegative majorant of `g` and the kernel is at most
`(σ − θ′)^(−k) e^(−θ′u)`, off the window `|g| + g ≤ 2C₀ e^(2u)` leaves only the kernel's mass at the rate `σ − 2`, and an
exponential-moment bound for that mass gives an index `k ≥ U` for every window. Pintz (1980) uses a Gaussian kernel
concentrated on the window where this route uses single Taylor coefficients.

Let `g` be as in 6.1 with
transform `Φ` on `Re s > A`, `σ > A` real, `γ` real and `k ∈ ℕ`.

- (a) *Positivity.* `|a_k(σ + iγ)| + a_k(σ) ≤ 2 ∫₀^∞ g⁺(u) w_k^σ(u) du`.
- (b) *One index per window.* Let `A′ > A`, `I = ∫₀^∞ |g(u)| e^(−A′u) du`, `λ > 1` with `q_λ` and
  `U_λ` as in 6.2 (d), `θ′ < A′`, and
  ```text
  σ ≥ max( A′ + 1, (A′ − q_λ θ′)/(1 − q_λ) ) .
  ```
  Then for every `U ≥ U_λ(σ − A′)` the integer `k = ⌈(σ − A′) λ^(1/2) U⌉` satisfies `k ≥ U` and, for
  every real `γ`,
  ```text
  |a_k(σ + iγ)| + a_k(σ) ≤ 2 (σ − θ′)^(−k) ( ∫_U^(λU) g⁺(u) e^(−θ′u) du + I ) .
  ```
- (c) *Window inequality under a pointwise bound.* Let `A = 2`, and suppose moreover that `|g(u)| ≤ C₀ e^(2u)` for
  `u ≥ 0`, for some real `C₀`, and `σ > 2`. For `θ′ < σ` and `0 < U ≤ V`:
  ```text
  |a_k(σ + iγ)| + a_k(σ) ≤ 2 (σ − θ′)^(−k) ∫_U^V g⁺(u) e^(−θ′u) du + 2 C₀ ∫_((0,∞)∖[U,V]) w_k^(σ−2)(u) du .
  ```
  Consequently, for `δ > 0` and `0 ≤ θ′ < σ` with `σ`, `C_δ` as in 6.2 (f): for every `U ≥ 1` there is an integer `k ≥ U`
  with `|a_k(σ + iγ)| + a_k(σ) ≤ 2 (σ − θ′)^(−k) ( ∫_U^((1+δ)U) g⁺(u) e^(−θ′u) du + C₀ C_δ )` for every real `γ`.
  The display follows from [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindowIneq.lean` (`Deduction.landau_window_ineq`),
  and the consequence is a step of the proof of [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean` (`Deduction.landau_window_key`).

*Proof sketch.* (a): `|a_k(σ + iγ)| ≤ ∫ |g| w_k^σ` (6.1 (b), `|e^(−iγu)| = 1`) and
`a_k(σ) = ∫ g w_k^σ`, and `|g| + g = 2g⁺`. This is the positivity of `1 + cos`, applied to one Taylor
coefficient. [FormalProof] has (a) for `σ > 2` under the pointwise bound of (c), as a step of (c).
(b): split the integral of (a). On `[U, λU]`,
`w_k^σ(u) = e^(−θ′u) w_k^(σ−θ′)(u) ≤ e^(−θ′u) (σ − θ′)^(−k)` (6.2 (b); `σ > θ′` because `σ > A′ > θ′`).
Off it, `g⁺ ≤ |g|` and `w_k^σ(u) = e^(−A′u) w_k^(σ−A′)(u) ≤ e^(−A′u) (σ − A′)^(−k) q_λ^k` (6.2 (d) with
`τ = σ − A′ ≥ 1`), so that part is at most `2I (σ − A′)^(−k) q_λ^k`. The condition on `σ` is
`q_λ(σ − θ′) ≤ σ − A′`, that is `q_λ^k (σ − A′)^(−k) ≤ (σ − θ′)^(−k)`. Only the supremum of the
kernel is used on the window; off the window only its supremum there. This estimate is the roadmap's;
[FormalProof] bounds the mass of the kernel off the window instead, under a pointwise bound for `g`: that is (c).
(c): split the integral of (a) at `[U, V]`; on it bound `w_k^σ` as in (b), off it use `g⁺ ≤ C₀ e^(2u)` and
`e^(2u) w_k^σ = w_k^(σ−2)`. The consequence is 6.2 (f) with `V = (1 + δ)U` and `σ^(−k) ≤ (σ − θ′)^(−k)`, which
needs `θ′ ≥ 0`.
*Needs:* 6.1, 6.2.

**Checks.**

- For `g ≥ 0` and `γ = 0`, (a) is an equality: the constant `2` is sharp.
- For `g = −1` the right side of (a) is `0`; at `γ = 0` the left side is `0` too, and for `γ ≠ 0` it
  is `|σ + iγ|^(−k−1) − σ^(−k−1) < 0`.
- (a) holds at rates `σ ≤ 0`, with the kernel of the Conventions at every real rate: for `A = −1`,
  `g = 1_(0,1)`, `σ = 0`, `γ = 0` and `k = 0`, `a_0(0) = ∫₀¹ du = 1` and the inequality reads `2 ≤ 2∫₀¹ w_0^0 = 2`,
  with `w_0^0 ≡ 1`; a kernel read as `a^(−k−1)·gammaPDFReal (k + 1) a` would be `0` at rate `0` and give `2 ≤ 0`. Only
  (b) and (c), at the positive rates `σ − θ′`, `σ − A′` and `σ − 2`, use 6.2.

### 6.6 Taylor coefficients near a pole

*Origin:* adapted from Flajolet and Sedgewick (2009), chapters IV–V, coefficient asymptotics of meromorphic functions
(AsymptoticExpansions §13.6a): the coefficients are those of `a_k(z) = (−1)^k Φ^(k)(z)/k!` at a point `z`, the main term
is written out, and lower bounds for large `k` are added; (a) is Cauchy's estimate.

*Method of the formal proof:* the Taylor coefficients at `z` are those of the Cauchy power series on a circle of radius
`r′` and are bounded by the mean of `|Φ|` on the circle divided by `r′^k`; at a simple pole, `c/(s − ρ)` is subtracted,
the difference is extended analytically over `ρ`, the Cauchy bound is applied to it, and the Taylor coefficients of
`c/(s − ρ)` are computed exactly. Poles of higher order in (b) are not in [FormalProof]; the route written here treats
them as the simple pole, subtracting the whole principal part.

*Corollary of:* AsymptoticExpansions §13.6a (Darboux's method in the meromorphic case: up to `O(r′^(−k))` for every
`r′ < r`, the Taylor coefficients of a function with finitely many poles inside the disc of radius `r` are those of the
sum of its principal parts), for the first estimate of (b) and of the simple-pole form: apply it to `w ↦ Φ(z − w)`,
with the one pole `z − ρ`; the Taylor coefficients of the principal part, which that section does not write out, are
computed here. (a) is Cauchy's estimate, and the lower bounds are deduced here from the first estimate.

Let `z ∈ ℂ` and `r > 0`.

- (a) *Cauchy.* If `Φ` is analytic on `B(z, r)` and `0 < r′ < r`, there is `M` with
  `|a_k(z)| ≤ M r′^(−k)` for all `k`. This is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauCauchy.lean` (`Deduction.landau_cauchy`).
- (b) *Pole of finite order.* Let `ρ ∈ B(z, r)`, `ρ ≠ z`, let `Φ` be analytic on `B(z, r) ∖ {ρ}`,
  and let `ρ` be a pole of order `m ≥ 1` with principal part `Σ_{j=1}^m c_j (s − ρ)^(−j)`, `c_m ≠ 0`.
  Then for `0 < r′ < r` there is `M` with
  `|a_k(z) − Σ_{j=1}^m c_j C(k+j−1, j−1) (z − ρ)^(−k−j)| ≤ M r′^(−k)` for all `k`.
  If `d = |z − ρ| < r′`, there is `k₀` with `|a_k(z)| ≥ ½ |c_m| d^(−k−m)` for `k ≥ k₀`. If moreover
  `z` and `ρ` are real, `z > ρ`, the `c_j` are real and `c_m > 0`, then `Re a_k(z) ≥ ½ c_m d^(−k−m)`
  for `k ≥ k₀`.

*Simple poles*, the case of (b) that the form of the formal proof of 6.8 uses. Let `ρ ∈ B(z, r)`, `ρ ≠ z`, let `Φ` be
analytic on `B(z, r) ∖ {ρ}`, and let `Φ(s) = c/(s − ρ) + h(s)` near `ρ` with `h` analytic at `ρ`. Then for `0 < r′ < r`
there is `M` with `|a_k(z) − c (z − ρ)^(−k−1)| ≤ M r′^(−k)` for all `k`. If `c ≠ 0` and `d = |z − ρ| < r′`, there is `k₀`
with `|a_k(z)| ≥ ½ |c| d^(−k−1)` for `k ≥ k₀`; if moreover `z`, `ρ` are real, `z > ρ` and `Re c > 0`, then
`Re a_k(z) ≥ ½ (Re c) d^(−k−1)` for `k ≥ k₀`. This follows from [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauPoleAsym.lean` (`Deduction.landau_pole_asym`).

(b) is the meromorphic case of Darboux's method, AsymptoticExpansions §13.6a, with the principal part as
comparison function and the pole strictly inside the disc of analyticity, so that the error is `O(r′^(−k))` for every
`r′ < r` where Darboux's method, with the singularity on the circle of radius `d`, gives `o(d^(−k))`.

*Proof sketch.* (a) is `norm_cauchyPowerSeries_le` on the circle of radius `r′`. (b): `Φ` minus its
principal part extends analytically to `B(z, r)` (removable singularity); apply (a). The `k`-th
coefficient of `(s − ρ)^(−j)` at `z` is `(−1)^k (d/ds)^k (s − ρ)^(−j)/k! = C(k+j−1, j−1)(z − ρ)^(−k−j)`.
For the lower bound, `C(k+j−1, j−1)/C(k+m−1, m−1) → 0` for `j < m`, so the main term is at least
`(3/4)|c_m| C(k+m−1, m−1) d^(−k−m) ≥ (3/4)|c_m| d^(−k−m)` for large `k`, and `(r′/d)^k` grows
geometrically; in the real case the main term is real and positive, so the same bound holds for the
real part of `a_k(z)` (the analytic remainder need not be real at `z`). For a simple pole the display is (a) for
`Φ − c/(s − ρ)`, and the lower bounds follow from it since `d < r′`.
*Needs:* Mathlib `norm_cauchyPowerSeries_le`, `deriv_zpow`, removable singularities; Tau Ceti
`TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (finite principal part at a meromorphic
point).

**Checks.**

- `Φ(s) = 1/(s − ρ)` (`m = 1`, `c_1 = 1`): `a_k(z) = (z − ρ)^(−k−1)` exactly, so (b) holds with
  `M = 0`.
- `Φ(s) = (s − ρ)^(−2)`: `a_k(z) = (k + 1)(z − ρ)^(−k−2)`; dropping the binomial factor gives
  `(z − ρ)^(−k−2)`, and dropping `(−1)^k` in `a_k` gives alternating signs.

### 6.7 Choosing the expansion point

*Origin:* particular to this proof: an elementary lemma on closed discrete sets, which moves the expansion point `σ`
vertically to `σ + iγ` until one point of `Z` is strictly nearest, unless the point of `Z` nearest to `σ` is real and
rightmost.

*Method of the formal proof:* compactness gives finitely many points of `Z` in a closed disc; either the point of `Z`
nearest to `σ` is real and rightmost, or the centre is moved to `σ + iγ` with `γ` outside the finitely many values at
which two points of `Z` are equidistant from it.

Let `θ₀ < θ < σ` be real and let `Z` be a closed
discrete subset of `{Re s > θ₀}` (every point of the half-plane has a neighbourhood meeting `Z` in
finitely many points) with `Re ρ < σ` for every `ρ ∈ Z` and `Z ∩ {Re s > θ} ≠ ∅`. Then:

- (local finiteness) `Z ∩ B̄(w, r)` is finite whenever `B̄(w, r) ⊆ {Re s > θ₀}`;
- (dichotomy) either
  - (A) there are a real `γ`, a point `ρ ∈ Z` and `0 < d < r ≤ σ − θ` with `|σ + iγ − ρ| = d`,
    `Z ∩ B(σ + iγ, r) = {ρ}` and `Z ∩ B(σ, r) = ∅`; or
  - (B) there are a real `β ∈ Z` with `β > θ` and `r` with `σ − β < r ≤ σ − θ`, `Z ∩ B(σ, r) = {β}`,
    and `Re ρ ≤ β` for every `ρ ∈ Z`.

This follows from [FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauFinite.lean`
(`Deduction.landau_finite`), `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauDichotomy.lean`
(`Deduction.landau_dichotomy`), `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauNearest.lean`
(`Deduction.landau_nearest`).

*Proof sketch.* Local finiteness: a closed disc in the half-plane is compact. Let
`F = Z ∩ B̄(σ, σ − θ)`, finite. If `F = ∅`, take `D = σ − θ` and any `ρ₁ ∈ Z` with `Re ρ₁ > θ`.
Otherwise let `D = dist(σ, Z) ≤ σ − θ`, so `Z ∩ B(σ, D) = ∅`. If some `ρ₁ ∈ Z` has `σ − Re ρ₁ < D`,
we are in the situation of (A) below. If none has, a point of `Z` at distance `D` from `σ` with
`σ − Re w ≥ D` is the real point `σ − D`; so the nearest point is the real `β = σ − D`, unique at
its distance, and finiteness gives `r`: this is (B), and every `w ∈ Z` has `Re w ≤ β`. For (A):
put `ε = min(D − (σ − Re ρ₁), σ − D − θ₀)/2 > 0`, `c₀ = σ + i Im ρ₁`, and let `F′ = Z ∩ B̄(c₀, D + ε)`,
finite. For two distinct points `p, p′` with real parts `< σ` there is at most one real `γ` with
`|σ + iγ − p| = |σ + iγ − p′|` (none if `Im p = Im p′`); choose `γ ∈ (Im ρ₁ − ε, Im ρ₁ + ε)` outside
these finitely many values, let `ρ` be the point of `F′` nearest to `σ + iγ` (unique), and `r` the
minimum of `D` and the next distance. Then `|σ + iγ − ρ| < D − ε`, and every point of `Z` in
`B(σ + iγ, r)` lies in `F′`.
*Needs:* Mathlib compactness of closed balls, finiteness of discrete subsets of compact sets.

**Checks.**

- `Z = {β + iγ₀, β − iγ₀}`, `γ₀ ≠ 0`, `θ < β < σ`: the two points are equidistant from `σ`, case (B)
  is impossible, and a shift `γ` near `γ₀` makes `β + iγ₀` the unique nearest point: case (A).
- `Z = {β}` real: case (B); case (A) would need a point `ρ₁` with `σ − Re ρ₁ < dist(σ, Z) = σ − β`.

### 6.8 The windowed Landau theorem

*Origin:* adapted from Kaczorowski and Pintz (1986), Theorem 1 and Corollary 1: a real function whose Mellin transform
converges absolutely in some half-plane, is regular for `Re s > Θ` but in no larger half-plane, and is meromorphic on
`Re s ≥ Θ − c₀` for some `c₀ > 0`, changes sign in every interval `[Y^(1−ε), Y]` with `Y` large; their proof also uses
regularity at the real point `Θ`, which their statement does not display, and part II (1987) allows algebraic and
logarithmic singularities. In the variable `y = e^u` the form of the formal proof, Landau's theorem with the one-sided
hypothesis assumed only on windows `[U, (1 + δ)U]` along a sequence, follows from it by a short argument: fix `θ′` with
`θ < θ′ < Θ`, `Θ` the supremum of the real parts of the poles; the average of `g` over `[u − 1, u]` is at most `e^(θ′u)`
on a slightly shorter window; if `Θ` is a pole, its residue is positive and the pole is replaced by two conjugate poles on
the line `Re s = Θ`, which only lowers the function; the theorem is then applied to the result less `e^(θ′u)`. Particular
to this proof is its direct proof (method label), through single Taylor coefficients against the Gamma kernels, which
treats the hypothesis in mean and the real poles at once. The extension, for poles of any finite order with the dichotomy as conclusion, is this
roadmap's own formulation.

*Method of the formal proof:* if there were a pole to the right of `θ`, a centre on the line `Re s = σ` would have exactly
one nearest pole, at distance `d`, and its Taylor coefficients there would grow like `d^(−k)`; the window inequality of
6.5 bounds that coefficient plus the real coefficient at `σ` by `C e^(ηU) (σ − θ)^(−k)` for an index `k ≥ U`, the
coefficient at `σ` is bounded below by Cauchy estimates or, for a real nearest pole, by its positive residue, and the two
are incompatible for small `η`. The route combines, on single Taylor coefficients of a general meromorphic transform, the
window kernel and the positivity between a complex and a real centre of Pintz (1980), Theorems 1 and 2, with one
smoothing order per window and the dominance of the nearest pole, without power sums, of Kaczorowski (1984), sections
3–7, both proved for the remainder term of the prime number theorem.

*The form of the formal proof.* Let `δ > 0` and `0 < θ < 1`. Let `g : ℝ → ℝ` be measurable with `|g(u)| ≤ C₀ e^(2u)`
for all `u ≥ 0`, for some real `C₀`, and let `Φ` be meromorphic on `{Re s > 0}` with `Φ(s) = ∫₀^∞ g(u) e^(−su) du` for
`Re s > 2`. Suppose that every pole of `Φ` in `Re s > 0` is simple and that the residue of `Φ` at every real pole in
`Re s > 0` is a positive real number. Suppose that for every `η > 0` and every `U₀` there is `U ≥ U₀` with
```text
∫_U^((1+δ)U) g⁺(u) e^(−θu) du ≤ e^(ηU) .
```
Then `Φ` has no pole in `Re s > θ`. Stated as `windowedLandau_simplePole` in `Suggested.lean`.
It follows from [FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean`
(`Deduction.landau_window`), `Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean`
(`Deduction.PoleData`), `Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean`
(`Deduction.WindowHypU`), and is equivalent to its statement.

The exponent `2` and the half-plane `Re s > 0` are a normalisation: for `g` with `|g(u)| ≤ C₀ e^(Au)`, transform
meromorphic on `Re s > θ₀` with simple poles and positive residues at the real ones, and `θ₀ < θ < A`, apply the
statement to `u ↦ e^(−tθ₀u) g(tu)` with `t = 2/(A′ − θ₀)` and `A′ ≥ A` so large that `t(θ − θ₀) < 1`.

*Extension.* Let `θ < A` and `δ > 0`, let `g : ℝ → ℝ` be
measurable, and let `Φ` be meromorphic on `{Re s > θ}` with `HasLaplace g s (Φ s)` for `Re s > A`;
equivalently, since `HasLaplace` includes integrability (ArithmeticDirichletSeriesPartII §0.1), `∫₀^∞ |g(u)| e^(−σu) du < ∞` for
every real `σ > A` and `Φ(s) = ∫₀^∞ g(u) e^(−su) du` on `Re s > A`. Suppose that for every `η > 0`
and every `U₀` there is `U ≥ U₀` with
```text
∫_U^((1+δ)U) g⁺(u) e^(−θu) du ≤ e^(ηU) .
```
Then either `Φ` has no pole in `Re s > θ`, or `Φ` has a real pole `β > θ` such that every pole `ρ`
of `Φ` in `Re s > θ` has `Re ρ ≤ β` and `meromorphicTrailingCoeffAt Φ β` is a negative real number.
In particular, if the leading coefficient of `Φ` at every real pole in `(θ, A]` is positive (or
there is no real pole there), `Φ` has no pole in `Re s > θ`. Stated as `windowedLandau` in
`Suggested.lean`.

*Corollary (simple poles).* If every pole of `Φ` in `Re s > θ` is simple, the leading coefficient
is the residue: either `Φ` has no pole in `Re s > θ`, or its poles there have a largest real part,
attained at a real pole with negative residue.

The form of the formal proof is, for `θ < 2`, the case `A = 2` of the extension: the pointwise bound gives
`HasLaplace g s (Φ s)` for `Re s > 2`, `Φ` is meromorphic on `Re s > θ` since `θ > 0`, and a real pole `β > θ` with
negative leading coefficient would contradict the positive residue there, the leading coefficient at a simple pole being
the residue. For `θ ≥ 2` its conclusion holds because `Φ` is the transform, which is analytic, on `Re s > 2`. So `θ < 1`
is not needed for its conclusion, nor is the simplicity of the poles once positivity is asked of the leading coefficients
at the real poles; they are hypotheses of the statement the formal proof makes, and are kept as such.

The windows are needed only along some sequence `U → ∞`, which may depend on `η`; the ratio
`1 + δ` is fixed but arbitrary. Every pole has finite order, since `Φ` is meromorphic.

*Proof sketch.* Steps 1–5 prove the extension; the form of the formal proof follows the same steps, as said after them.

1. *Reductions.* Replace `Φ` by its normal form on `{Re s > θ}` (6.1 (c)): it has the same poles,
   orders and leading coefficients, is analytic off the poles, and is the transform on `Re s > A`.
   Suppose `Φ` has a pole `ρ₀` with `Re ρ₀ > θ`, and fix `θ′ ∈ (θ, Re ρ₀)`. Since
   `e^(−θ′u) ≤ e^(−θu)` for `u ≥ 0`, the window hypothesis holds at `θ′`. The set `Z` of poles in
   `Re s > θ` is closed and discrete there and lies in `Re s ≤ A` (6.1 (c)).
2. *Parameters.* Put `λ = 1 + δ`, fix `A′ > A`, put `I = ∫₀^∞ |g| e^(−A′u) < ∞`, and fix a real
   `σ ≥ max(A′ + 1, (A′ − q_λθ′)/(1 − q_λ))`; then `σ > A ≥ Re ρ` for every `ρ ∈ Z`. By 6.5 (b), for
   every `η > 0` and every window `U ≥ U_λ(σ − A′)` satisfying the hypothesis at `θ′`, the index
   `k = k(U) ≥ U` satisfies, for every real `γ`,
   `|a_k(σ + iγ)| + a_k(σ) ≤ 2 (e^(ηU) + I)(σ − θ′)^(−k)`.
3. *The dichotomy.* Apply 6.7 to `Z` with `(θ₀, θ) := (θ, θ′)`; its discs lie in `Re s > θ`, where
   `Φ` is meromorphic.
4. *Case (A) is impossible.* Let `ρ` have order `m` and leading coefficient `c_m ≠ 0`, put
   `z = σ + iγ` and `r′ = (d + r)/2`, so `d < r′ < r ≤ σ − θ′`. By 6.6 (b) at `z`,
   `|a_k(z)| ≥ ½ |c_m| d^(−k−m)` for `k ≥ k₀`; by 6.6 (a) at `σ` (no pole in `B(σ, r)`),
   `a_k(σ) ≥ −M′ r′^(−k)`. With step 2 and `(σ − θ′)^(−k) ≤ r′^(−k)`, multiplying by `r′^k` gives
   `½ |c_m| d^(−m) (r′/d)^k ≤ M′ + 2(e^(ηU) + I)`. Take `η = ½ log(r′/d) > 0`: since `k ≥ U`, the left
   side is at least `½ |c_m| d^(−m) e^(2ηU)`, which exceeds the right side for the arbitrarily large
   `U` that the hypothesis provides.
5. *Case (B) forces a negative coefficient.* Here `β` is real, `β > θ′ > θ`, every pole has real
   part `≤ β`, and the Laurent coefficients at `β` are real (6.1 (c)). If `c_m > 0`, 6.6 (b) at
   `z = σ` gives `Re a_k(σ) ≥ ½ c_m d^(−k−m)` with `d = σ − β`, and `a_k(σ)` is real (6.1 (b)), so
   `|a_k(σ)| + a_k(σ) ≥ c_m d^(−k−m)`, and step 2 at `γ = 0` gives the contradiction of step 4.
   Hence `c_m < 0`.

The simple-pole corollary is the case `m = 1`, where `c_1` is the residue.

The form of the formal proof: in step 1 the normal form is taken on `{Re s > 0}` and no `θ′` is chosen (`θ′ = θ`); the
set `Z` of poles in `Re s > 0` is closed and discrete there and lies in `Re s ≤ 2`. Step 2 becomes: by 6.5 (c) there are
`σ > 2` and `C`, depending only on `δ`, `C₀`, such that for every `η > 0` and `U₀` there are `U ≥ U₀` and an integer `k ≥ U`
with `|a_k(σ + iγ)| + a_k(σ) ≤ C e^(ηU) (σ − θ)^(−k)` for every real `γ`. Step 3 applies 6.7 with `(θ₀, θ) := (0, θ)`. In
steps 4 and 5 put `m = 1` and `θ′ = θ`, with 6.6 (b) for simple poles; step 5 ends with `c_1 < 0`, which contradicts the
positivity of the residue.
*Needs:* 6.1, 6.2 (d), 6.5 (b), 6.6, 6.7 for the extension; 6.1, 6.2 (f), 6.5 (c), 6.6, 6.7 for the form of the formal
proof.

*Source.* [FormalProof] proves the following case, the form of the formal proof: `|g(u)| ≤ C₀ e^(2u)` for `u ≥ 0`; `Φ`
meromorphic on `Re s > 0`, equal to the transform on `Re s > 2`, with simple poles only and a positive real residue at
every real pole; `0 < θ < 1`; conclusion: `Φ` has no pole in `Re s > θ`. The extension above, for poles of any finite
order, under the integrability hypothesis alone, with continuation only to `Re s > θ`, and with the dichotomy as
conclusion, is this roadmap's; it is not proved in [FormalProof].

**Checks.**

- *Bounded windows do not suffice.* `g(u) = e^(βu) cos(γu)`, `γ > 0`, `θ < β ≤ A`: the transform
  `(s − β)/((s − β)² + γ²)` has simple poles at `β ± iγ` and no real pole, and `g ≤ 0` on every
  `[U_j, U_j + π/γ]`, `U_j = (2j + ½)π/γ`. These windows satisfy the integral bound, the conclusion
  fails, and they are not of the form `[U, (1+δ)U]`.
- *The sign condition cannot be dropped.* `g(u) = −e^(βu)`, `θ < β ≤ A` (the integrability
  hypothesis forces `β ≤ A`): every window satisfies the bound (`g⁺ = 0`), and `Φ = −1/(s − β)` has
  a real pole with leading coefficient `−1`.
- *Coexisting poles (extension).* `g(u) = −e^u + 2e^(bu) cos(cu)` with `θ < b < 1 ≤ A` and `c ≠ 0`: `g(u) < 0` for
  large `u`, so every far window satisfies the bound; the poles `1` (leading coefficient `−1`) and
  `b ± ic` all lie in `Re s > θ`, and the rightmost one is the real pole with negative coefficient,
  as the extension says.
- *Higher order (extension).* `g(u) = −u e^(βu)`, `θ < β < A`: `Φ = −(s − β)^(−2)`, the windows hold since
  `g ≤ 0`, and the conclusion holds with leading coefficient `−1` and residue `0`; a version phrased
  with residues would be false here. For `g(u) = u e^(βu)` the leading coefficient is `+1`, so the
  window hypothesis must fail, and it does: `∫_U^((1+δ)U) u e^((β−θ)u) du` grows exponentially in `U`.
- *Integrability, not pointwise growth (extension).* `g(u) = u e^(Au)` satisfies the hypothesis at `A`
  (`∫|g| e^(−σu) < ∞` for `σ > A`) but no bound `|g(u)| ≤ C₀ e^(Au)`; this is the growth of
  `G(y) = y log y` in the Mellin variable.
- *The classical theorem is the case of one infinite window (extension).* If `g(u) ≤ C e^(θu)` for all `u ≥ u₀`,
  every `[U, (1+δ)U]` with `U ≥ u₀` satisfies `∫ g⁺ e^(−θu) ≤ C⁺ δ U ≤ e^(ηU)` for large `U`, and the
  conclusion is that of 6.4 (c) (without its convergence statement).

### 6.9 Windows of scales, the Mellin form and the Dirichlet-series form

*Origin:* adapted from Landau's theorem: the windowed theorem of 6.8 in the Mellin variable `y = e^u`, with windows
`[Y, Y^λ]`, the variable and the intervals of Kaczorowski and Pintz (1986), from whose theorem the form of (b) with the
hypotheses of the formal proof follows as in 6.8, and for Dirichlet series through the counting function, whose transform `F(s)/s` is that of Montgomery and
Vaughan (2007), chapter 1 (ArithmeticDirichletSeriesPartII §4.1a); the window form is that of 6.8, and the extension in
(b) and the Dirichlet-series form (c) are this roadmap's own formulation.

*Method of the formal proof:* for the remainder of a weighted family of Dirichlet characters, the integral window
hypothesis on `[Y, Y^(1+δ)]` is carried to `[log Y, (1 + δ) log Y]` by the substitution `y = e^u`, and the windowed
theorem of 6.8 is applied to its transform, whose poles in `Re s > 0` are the zeros of the L-functions of the family and
their conjugates, simple and with positive residue at the real ones; a pointwise bound `C y^θ` on a window gives the
integral hypothesis because `∫ dy/y` over the window is `δ log Y ≤ Y^η` for large `Y`. The extension in (b) and the
Dirichlet-series form (c) are not in [FormalProof]; the route written here proves them from the extension of 6.8 and,
for the transform identity of (c), from ArithmeticDirichletSeriesPartII §4.1 applied to `max(c, 0)` and `max(−c, 0)`.

*Corollary of:* ArithmeticDirichletSeriesPartII §4.1a (the counting-function transform for coefficients of any sign:
`∫₁^∞ S_c(y) y^(−s−1) dy = F(s)/s` wherever the series converges absolutely with `Re s > 0`), for the transform identity
of (c) only; (a), (b), the bound of `∫₁^∞ |S_c(y)| y^(−σ−1) dy` and the windowed conclusion of (c) are not corollaries
of it.

(a) *Windows of scales.* For `S ⊆ ℝ` and `λ > 1`, `HasWindows S λ` means: for
every `Y₀` there is `Y ≥ max(Y₀, 1)` with `Set.Icc Y (Y ^ λ) ⊆ S`. API:

- monotone in `S`; for `1 < λ′ ≤ λ`, `HasWindows S λ` gives `HasWindows S λ′`;
- `HasWindows (Set.Ici x₀) λ` for every `x₀` and `λ > 1`;
- if `HasWindows S λ` and `S ∩ Set.Ici x₀ ⊆ S′`, then `HasWindows S′ λ`. This follows from [FormalProof],
  `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows.mono`).

The predicate is `HasWindows` of `Suggested.lean`. This is [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows`).

(b) *Mellin form.* *The form with the hypotheses of the formal proof.* Let `G : ℝ → ℝ` be measurable with
`|G(y)| ≤ C₀ y²` for `y ≥ 1`, and
let `Ψ` be meromorphic on `{Re s > 0}` with `Ψ(s) = ∫₁^∞ G(y) y^(−s−1) dy` for `Re s > 2`, with simple poles only in
`Re s > 0` and a positive real residue at every real pole there. Then `g(u) = G(e^u)` satisfies `|g(u)| ≤ C₀ e^(2u)` for
`u ≥ 0`, its transform is `Ψ` on `Re s > 2`, and `∫_U^(λU) g⁺(u) e^(−θu) du = ∫_(e^U)^(e^(λU)) G⁺(y) y^(−θ−1) dy`.
Consequently, if `0 < θ < 1` and, for some `λ > 1` and every `η > 0`, there are arbitrarily large `Y` with
`∫_Y^(Y^λ) G⁺(y) y^(−θ−1) dy ≤ Y^η`, then `Ψ` has no pole in `Re s > θ`. This mean hypothesis holds in particular when
`HasWindows {y ≥ 1 | G(y) ≤ C y^θ} λ` for some real `C`. Stated, with this hypothesis, as
`windowedLandau_mellin_simplePole` in `Suggested.lean`. For `θ < 2` it is the case `A = 2` of the extension below, the
bound giving `∫₁^∞ |G(y)| y^(−σ−1) dy ≤ C₀/(σ − 2)` for `σ > 2`; as in 6.8, `θ < 1` is not needed for its conclusion, nor
is the simplicity of the poles once positivity is asked of the leading coefficients at the real poles. It follows from [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean` (`Deduction.landau_window`),
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/poleData.lean` (`Deduction.poleData_change`),
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/lemmaL.lean` (`Deduction.lemmaL`); the formal
proof states the Mellin form only for the remainder of a weighted family of Dirichlet characters (see the extension below).
*Extension.* Let `G : ℝ → ℝ` be measurable with
`∫₁^∞ |G(y)| y^(−σ−1) dy < ∞` for every real `σ > A`, and `Ψ(s) = ∫₁^∞ G(y) y^(−s−1) dy` for
`Re s > A`. Then `g(u) = G(e^u)` satisfies `∫₀^∞ |g(u)| e^(−σu) du = ∫₁^∞ |G(y)| y^(−σ−1) dy`,
`HasLaplace g s (Ψ s)` for `Re s > A`, and
`∫_U^(λU) g⁺(u) e^(−θu) du = ∫_(e^U)^(e^(λU)) G⁺(y) y^(−θ−1) dy`. Consequently, if `Ψ` continues
meromorphically to `Re s > θ` (`θ < A`) and, for some `λ > 1` and every `η > 0`, there are
arbitrarily large `Y` with `∫_Y^(Y^λ) G⁺(y) y^(−θ−1) dy ≤ Y^η`, the conclusion of 6.8 holds for
`Ψ`. This mean hypothesis holds in particular when `HasWindows {y ≥ 1 | G(y) ≤ C y^θ} λ` for some
real `C`. Stated, with this hypothesis, as `windowedLandau_mellin` in `Suggested.lean`. This general form is this
roadmap's extension; [FormalProof] proves this passage only for the remainder of a weighted family of Dirichlet
characters, with the conclusion that the family has no zero in `Re s > θ`: [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean`
(`Deduction.zeroFree_of_rpow_window`),
`Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.Gm`),
`Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.ZeroFree`).

(c) *Dirichlet-series form.* Let `A ≥ 0` and
`c : ℕ → ℝ` with `Σ_n |c(n)| n^(−σ) < ∞` for every `σ > A`, sum `F(s)` on `Re s > A`, and
`S_c(y) = Σ_{1≤n≤y} c(n)` (the counting function of the Conventions of ArithmeticDirichletSeriesPartII). Then
`∫₁^∞ |S_c(y)| y^(−σ−1) dy ≤ σ^(−1) Σ_n |c(n)| n^(−σ)` for `σ > A`, `∫₁^∞ S_c(y) y^(−s−1) dy = F(s)/s`
on `Re s > A`, and the extension in (b) applies to `G = S_c`, `Ψ = F/s`: if `F/s` continues meromorphically to
`Re s > θ` and `HasWindows {y ≥ 1 | S_c(y) ≤ C y^θ} λ`, then either `F/s` has no pole in `Re s > θ`
or its rightmost pole there is real with negative leading coefficient.

*Proof sketch.* (a): `Y^λ′ ≤ Y^λ` for `Y ≥ 1`; `[Y, Y^λ] ⊆ [x₀, ∞)` once `Y ≥ max(x₀, 1)`. (b): the
substitution `y = e^u` on `(0, ∞)` (`integral_comp_exp_Ioi`, `integrableOn_comp_exp_Ioi`); windows
`[U, λU]` become `[Y, Y^λ]` and `e^(ηU) = Y^η`; then 6.8 with `δ = λ − 1` (its form of the formal proof for the form of
(b) with its hypotheses, its extension for the extension). On a window of
`{G ≤ C y^θ}`, `∫_Y^(Y^λ) G⁺ y^(−θ−1) ≤ C⁺(λ − 1) log Y ≤ Y^η` for large `Y`. (c): Tonelli,
`∫₁^∞ |S_c(y)| y^(−σ−1) dy ≤ Σ_n |c(n)| ∫_n^∞ y^(−σ−1) dy = σ^(−1) Σ_n |c(n)| n^(−σ)`. For the
transform, apply ArithmeticDirichletSeriesPartII §4.1 as stated to `c⁺ = max(c, 0)` and `c⁻ = max(−c, 0)`, which are nonnegative with
absolutely convergent series on `Re s > A ≥ 0`: it gives `HasLaplace` of `S_(c^±)(e^t)` with values
`F^±(s)/s`, and `S_c = S_(c⁺) − S_(c⁻)`, `F = F⁺ − F⁻`, so additivity and scalar multiplication of
`HasLaplace` (ArithmeticDirichletSeriesPartII §0.1) and the substitution `y = e^u` give `∫₁^∞ S_c(y) y^(−s−1) dy = F(s)/s`.
*Needs:* 6.8; ArithmeticDirichletSeriesPartII §§0.1, 4.1; Mathlib `MeasureTheory.integral_comp_exp_Ioi` and
`MeasureTheory.integrableOn_comp_exp_Ioi` (the substitution `y = e^u` on `Ioi a`).

**Checks.**

- A set containing `[Y, 2Y]` for arbitrarily large `Y` need not have windows of any exponent
  `λ > 1`: `⋃_{j≥1} [2^(2^j), 2^(2^j + 1)]` contains no `[Y, Y^λ]` with `Y^(λ−1) > 2`, since its intervals are
  disjoint (`2^j + 1 < 2^(j+1)` for `j ≥ 1`) and a window inside `[2^(2^j), 2^(2^j+1)]` has `Y^λ ≤ 2Y`. The index must
  start at `1`: with `j = 0` the union contains `[2, 4] ∪ [4, 8] = [2, 8] = [Y, Y³]` at `Y = 2`, where `Y^(λ−1) = 4`.
- `HasWindows S λ` uses multiplicative windows `[Y, Y^λ]`, not `[Y, λY]`; the second are the
  bounded windows of the first Check of 6.8.
- `c(n) = log n`, `A = 1`: `S_c(y) ∼ y log y` admits no bound `C₀ y^A`, and the extension in (b) applies since
  `∫₁^∞ y log y · y^(−σ−1) dy = (σ − 1)^(−2)` for `σ > 1`.

### 6.10 Agreement with Landau's theorem for Dirichlet series

*Origin:* adapted from Landau (1905): Landau's theorem for Dirichlet series with nonnegative coefficients (completed
ArithmeticDirichletSeries 8.1), read through the transform `F(s)/s` of the counting function, whose abscissa equals that
of the series when it is positive.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `c n ≥ 0` for all `n` and suppose the
abscissa of absolute convergence `σ_a` of `Σ c(n) n^(−s)` is a positive real number. Then the
infimum of the real `σ` at which the transform of `α(t) = S_c(e^t)` (ArithmeticDirichletSeriesPartII §4.1) converges is `σ_a`, the
transform is `F(s)/s` on `Re s > σ_a`, and 6.3 shows that `F` has no analytic continuation to a
neighbourhood of `σ_a`. This is Landau's theorem of completed ArithmeticDirichletSeries 8.1 (Tau Ceti
`TauCeti.LSeries.landau`) for `σ_a > 0`; the cases `σ_a ≤ 0` remain that theorem's alone, since
ArithmeticDirichletSeriesPartII §4.1 needs `Re s > 0`.

*Proof sketch.* Tonelli: `∫₀^∞ α(t) e^(−σt) dt = σ^(−1) Σ c(n) n^(−σ)` for real `σ > 0`, finite or
not, so the transform converges at a real `σ > 0` exactly when the series does, and the two
infima agree; at `σ_a > 0`, `F/s` and `F` are analytic together. The series may converge at
`σ_a` itself (`c(n) = n^(σ_a − 1)/log²(n + 1)`), so the statement is about the infimum, not about
the half-plane of convergence.
*Needs:* 6.3; ArithmeticDirichletSeriesPartII §4.1; completed ArithmeticDirichletSeries 8.1 for the comparison.

**Checks.**

- `c n = 1`: `σ_a = 1`, `F = ζ`, and `ζ(s)/s` is singular at `1`.
- `c(n) = n^(σ_a − 1)/log²(n + 1)`, `σ_a > 0`: the series and the transform both converge at
  `σ = σ_a` and at no real `σ < σ_a`; the infimum is attained.

### Examples

- The model transforms `k!/(s − a)^(k+1)` of `e^(au) u^k` (AnalyticNumberTheoryPartII §4.5c) have a single real pole with positive leading coefficient; by
  6.4 (b), no function bounded above by `C e^(θu)`, `θ < a`, has such a transform.
- `g = 1`: `Φ(s) = 1/s` on `Re s > 0` and `a_k(z) = z^(−k−1)` (6.1), singular at the abscissa `0`;
  `f(u) = sin u`, which changes sign, has the transform `1/(s² + 1)`, analytic at its abscissa `0`
  (6.3).
- `g(u) = −u e^(βu)`, `θ < β < A`: `Φ = −(s − β)^(−2)` has residue `0` and leading coefficient `−1`, and
  every window satisfies the bound since `g ≤ 0`: the sign is carried by the leading coefficient,
  not by the residue (6.4, 6.8).
- `g(u) = e^(βu) cos(γu)`, `γ ≠ 0`: the transform `(s − β)/((s − β)² + γ²)` has only the nonreal
  poles `β ± iγ`; `g` is bounded above by no `C e^(θu)` with `θ < β`, and the windows of bounded
  length on which `g ≤ 0` are not of the form `[U, (1+δ)U]` (6.4, 6.8).
- At `λ = 4`, `q_4 ≈ 0.935` and `U_4(1) ≈ 1.21` (6.2 (d)); the set `⋃_{j≥1} [2^(2^j), 2^(2^j + 1)]`
  contains `[Y, 2Y]` for arbitrarily large `Y` but has no windows of any exponent `λ > 1` (6.9).

### Dependencies

ArithmeticDirichletSeriesPartII §0.1, ArithmeticDirichletSeriesPartII §0.1b (Landau's theorem, 6.3), ArithmeticDirichletSeriesPartII §0.2 (for the normalisation of the leading
coefficient) and ArithmeticDirichletSeriesPartII §4.1 for 6.9 (c) and 6.10, with ArithmeticDirichletSeriesPartII §4.1a, the general theorem of which
the transform identity of 6.9 (c) is a corollary; AsymptoticExpansions §4.1a, the general theorem of which 6.1 (a), the formula of 6.1 (b) and the conjugation in 6.1 (c) are corollaries, and AsymptoticExpansions §13.6a, the general theorem of which the first estimate of 6.6 (b) is a
corollary; AnalyticNumberTheoryPartII §4.5c for the model transforms
of the Examples. Mathlib meromorphic functions and their normal form,
Cauchy estimates, Bochner integration and the Gamma integral; Tau Ceti's Laurent data at a
meromorphic point; completed ArithmeticDirichletSeries 8.1 for 6.10.

## Layer 7: Laplace's method in several variables

This layer proves Laplace's method for a family of integrals over a finite-dimensional real space whose integrands, rescaled by `√t`, converge pointwise to a Gaussian `e^(−B(v,v))` with complex-valued `B`, under a majorant uniform in the integer parameter `t`; it concludes that the integrals do not vanish for large `t`. It is the several-variable analogue of Laplace's method on the real line (AsymptoticExpansions §5.2) and uses no statement of it.

### 7.1 Laplace's method in several variables with a uniform majorant

*Origin:* adapted from Wong (1989), chapters VIII–IX, Laplace's method for multiple integrals, and Hörmander (1990),
§7.6, the Fourier transforms of Gaussian functions: here the integrands are indexed by the positive integers, converge
only pointwise after rescaling by `√t` to a complex Gaussian `e^(−B(v,v))` under the uniform majorant
`(1 + c‖v‖²)^(−γt)`, and the conclusion includes the non-vanishing of the integrals for large `t`.

*Method of the formal proof:* after the rescaling `w ↦ w/√t` the majorant `(1 + c‖w‖²/t)^(−γt)` decreases in `t`
(weighted arithmetic and geometric means), so one integrable function dominates for all large `t` and dominated
convergence gives the limit; the same majorant bounds the limit, which gives `Re B(v, v) > 0`; and the Gaussian integral
is not zero by simultaneous diagonalisation of the real and imaginary parts of the form, which reduces it to a product of
integrals `∫ e^(−bx²) dx` with `Re b > 0`.

Let `(f_t)_{t≥1}` be complex functions on `E`, indexed by the positive integers, `B : E × E → ℂ` a real-bilinear form, and `c, γ > 0`. Suppose that `f_t` is `μ`-almost everywhere strongly measurable for all large `t`, that `f_t(v/√t) → e^(−B(v,v))` as `t → ∞` for every `v ∈ E`, and that there is `t₀` with `|f_t(v)| ≤ (1 + c‖v‖²)^(−γt)` for all `t ≥ t₀` and all `v ∈ E` (one `t₀` for all `v`). Prove that:

- (a) *Positivity.* `Re B(v, v) > 0` for every `v ≠ 0`.
- (b) *The Gaussian integral.* For every real-bilinear `B′ : E × E → ℂ` with `Re B′(v, v) > 0` for all `v ≠ 0`, the function
  `v ↦ e^(−B′(v,v))` is integrable and `∫_E e^(−B′(v,v)) dμ(v) ≠ 0`.
- (c) *The limit.* `f_t` is `μ`-integrable for all large `t`, and
  ```text
  t^(n/2) · ∫_E f_t dμ  →  ∫_E e^(−B(v,v)) dμ(v)      as t → ∞ .
  ```
- (d) *Non-vanishing.* `∫_E f_t dμ ≠ 0` for all large `t`.

No symmetry or positivity of `B` is assumed; convergence is pointwise, with no uniformity. Clauses (a), (c) and (d) are stated as `tendsto_integral_of_laplaceMethod` in `Suggested.lean`.
Clause (d), with the integrability of `f_t` for all large `t`, is [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/LaplaceOperators/LaplaceFoundations/RaisingLoweringNormIdentities.lean`
(`ReciprocityTheory.ChartRestriction.DS.Lap.Base.GaussianLimitHaar`); (a) and the limit of (c) are steps of its proof,
not statements of it; (b) follows from [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/LaplaceOperators/Laplace.lean`
(`ReciprocityTheory.ChartRestriction.DS.Lap.Laplace.gauss_ne_zero`).

*Route.* Fix an integer `N ≥ 1` beyond which the hypotheses hold and with `n < 2γN`. For `x ≥ 0` and `0 < s ≤ t`,
`(1 + x/s)^s ≤ (1 + x/t)^t` (weighted arithmetic–geometric mean inequality), so for `t ≥ N`,
`|f_t(w/√t)| ≤ (1 + c‖w‖²/t)^(−γt) ≤ (1 + (c/N)‖w‖²)^(−γN)`, an integrable function of `w` because `2γN > n`. Dominated
convergence gives `∫ f_t(w/√t) dμ(w) → ∫ e^(−B(w,w)) dμ(w)`, and the left side is `t^(n/2) ∫ f_t dμ` by the dilation
`w ↦ w/√t`: this is (c), the integrability of `f_t` being the majorant with `2γt > n`. For (a), the pointwise limit
`e^(−B(v,v))` is bounded by the same majorant, so `e^(−Re B(v,v)) ≤ (1 + (c/N)‖v‖²)^(−γN) < 1` for `v ≠ 0`. For (b), in a basis let
`A` and `C` be the real and imaginary parts of the symmetric matrix of `v ↦ B′(v, v)`; `A` is positive definite, so there is
an invertible real `P` with `PᵀAP = 1` and `PᵀCP` diagonal with entries `c_i`; then `B′(Pw, Pw) = Σ_i (1 + i c_i) w_i²` and the
integral is a positive multiple of `∏_i ∫_ℝ e^(−(1 + i c_i)x²) dx = ∏_i (π/(1 + i c_i))^(1/2) ≠ 0`. (d) follows from (a), (b), (c).
*Needs:* Mathlib `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`,
`integrable_rpow_neg_one_add_norm_sq`, `MeasureTheory.Measure.integral_comp_smul`,
`GaussianFourier.integral_cexp_neg_sum_mul_add`, `Real.geom_mean_le_arith_mean2_weighted`, the spectral theorem for real
symmetric matrices.

**Checks.**

- `E = ℝ`, `f_t(Y) = e^(−(1+i)tY²)`, `B(Y, Y′) = (1 + i)YY′`, `c = γ = 1`: `f_t(Y/√t) = e^(−(1+i)Y²)` for every `t`, the majorant
  holds because `e^x ≥ 1 + x`, (a) holds since `Re B(Y, Y) = Y²`, and both sides of (c) equal `(π/(1 + i))^(1/2)`, of
  modulus `2^(−1/4)√π`, for every `t ≥ 1`. With `f_t(Y) = (1 + Y²)^(−t)` and `B(Y, Y) = Y²`, (c) reads
  `√(πt) · Γ(t − ½)/Γ(t) → √π`.
- The majorant cannot be dropped: `f_t(Y) = e^(−tY²) − e^(−t(Y − t)²)` on `ℝ` satisfies
  `f_t(Y/√t) = e^(−Y²) − e^(−(Y − t^(3/2))²) → e^(−Y²)` for every `Y`, and `∫_ℝ f_t = 0` for every `t`. It satisfies
  the bound for each fixed `Y` once `t` is large in terms of `Y`, so the uniformity in `v` cannot be dropped either.

### Examples

- `E = ℝ`, `B(Y, Y′) = (1 + i)YY′`, `f_t(Y) = e^(−(1+i)tY²)`: both sides of 7.1 (c) equal `(π/(1 + i))^(1/2)`, which is not zero, for every `t` (7.1 (b), (d)).
- `f_t(Y) = (1 + Y²)^(−t)` on `ℝ`: 7.1 (c) is `√(πt) · Γ(t − ½)/Γ(t) → √π`.
- `f_t(Y) = e^(−tY²) − e^(−t(Y − t)²)` has the pointwise limit `e^(−Y²)` after rescaling but integral `0` for every `t`: without the majorant, 7.1 (d) fails.

### Dependencies

No earlier layer and no other roadmap. Mathlib dominated convergence, Haar measure and dilations on finite-dimensional real spaces, the Gaussian integral with complex parameter, weighted arithmetic–geometric means and the spectral theorem for real symmetric matrices.

## Layer 8: Stationary phase over `ℂ^n` and over non-archimedean rings

This layer proves stationary phase in two settings, both used for the phase `Σ x_k + D/∏ x_k`. Over `ℂ^n` (8.1) it evaluates complex Gaussian integrals through the Autonne–Takagi factorisation and proves, for arbitrary holomorphic phases and Banach-valued amplitudes, a non-stationary bound and the leading term at a nondegenerate critical point, with remainders bounded by finitely many derivatives of the amplitude; it then records the critical data of the phase `Σ x_k + D/∏ x_k`. Only the leading term is asserted, no asymptotic expansion. Over a finite product of `p`-adic fields with a compact open subring that is its own orthogonal (8.2) it proves Gaussian integrals over admissible lattices and an exact stationary-phase formula for the same phase. Both are analogues of stationary phase on the real line (AsymptoticExpansions Layer 6) and use no statement of it.

### 8.1 Stationary phase for holomorphic phases on `ℂ^n`, and the phase `Σ x_k + D/∏ x_k`

*Origin:* adapted from Hörmander (1990), Theorems 7.7.1 and 7.7.5: the non-stationary estimate and stationary phase with
remainder, here for holomorphic phases in the `2n` real coordinates of `ℂ^n`, with Banach-valued amplitudes, constants
that depend on the phase only through `(η, P)` and `(r, Λ)` and the leading term only, together with the damped complex
Gaussian integrals of (a) and the critical data of the phase `g_D` in (d); `det H ≠ 0` in (c) is this roadmap's own
formulation.

*Method of the formal proof:* for (c), in the `2n` real coordinates the amplitude is split into a cut-off times its
first-order Taylor polynomial at the critical point and a remainder vanishing to second order; the phase is joined to its
quadratic part by a linear deformation and the integral is expanded to first order in the deformation parameter; every
error term is bounded by repeated integration by parts with the regularised denominator `|∇φ|² + |t|`, for functions
whose derivatives are measured against the weight `‖x‖ + |t|^(1/2)`; the term of the linear amplitude vanishes by
oddness, and the quadratic integral with cut-off is compared with the damped Gaussian integral of (a). This follows the
deformation argument of Hörmander's proof, carried out for the leading term only, with a weighted estimate in place of
his non-stationary bound and a damped Gaussian in place of the Fourier transform of a Gaussian.

Let `n ∈ ℕ` and `β ∈ ℂ^×`. Prove that:

- (a) *Complex Gaussian integrals.* For `a ∈ ℂ` and `δ > 0`,
  `∫_ℂ e^(−δ|w|²) ψ_β(a w²/2) dμ_β(w) = |β| / √(4δ² + |β|²|a|²)`. For a symmetric matrix `H ∈ M_n(ℂ)` (`Hᵀ = H`) with
  `det H ≠ 0` and `t ∈ ℂ^×`,
  `lim_{δ→0+} ∫_{ℂ^n} e^(−δ Σ_k |x_k|²) ψ_β(xᵀHx/(2t)) dμ_β^n(x) = |t|^n / |det H|`. This is [FormalProof],
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.GaussOneDamped`),
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.GaussMulti`),
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.gaussInt`).
- (b) *Non-stationary phase.* For every `q ∈ ℕ` there is a constant `C = C(n, q, β)` such that: for every open `Ω ⊂ ℂ^n`,
  every holomorphic `g : Ω → ℂ`, all `η, P > 0` with `‖D_ℂ g(x)‖ ≥ η` and `‖D_ℂ^(j+1) g(x)‖ ≤ ‖D_ℂ g(x)‖ P^j` for `1 ≤ j ≤ q` and
  `x ∈ Ω`, every complex Banach space `V`, every `a : ℂ^n → V` of class `C^q` with compact support contained in `Ω` and
  `‖D^j a(x)‖ ≤ S P^j` for `j ≤ q` and all `x`, and every `t ∈ ℂ^×`,
  `‖∫_{ℂ^n} ψ_β(g(x)/t) a(x) dμ_β^n(x)‖ ≤ C · S · (|t| P/η)^q · μ_β^n(supp a)`. This is [FormalProof],
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.NonStatPhase`).
- (c) *Stationary phase at a nondegenerate critical point.* For all `r, Λ > 0` there is a constant `C = C(n, β, r, Λ)` such
  that the following holds. Let `x₀ ∈ ℂ^n`, let `g` be holomorphic on `B(x₀, 2r)` with `|g| ≤ Λ` there and `∇g(x₀) = 0`, let
  `H = (∂²g/∂x_i∂x_j (x₀))` be its Hessian at `x₀`, and suppose `‖x − x₀‖ ≤ Λ ‖∇g(x)‖` for all `x ∈ B̄(x₀, r)`. Let `V` be a
  complex Banach space and `a : ℂ^n → V` of class `C^(2n+2)`, zero outside `B̄(x₀, r)`, with `‖D^j a(x)‖ ≤ S` for all
  `j ≤ 2n + 2` and all `x`. Then `det H ≠ 0` and, for every `t ∈ ℂ^×`,
  `‖∫_{ℂ^n} ψ_β(g(x)/t) a(x) dμ_β^n(x) − ψ_β(g(x₀)/t) · (|t|^n/|det H|) · a(x₀)‖ ≤ C · S · |t|^(n+1)`.
  The constant does not depend on `x₀`, `g`, `V`, `a`, `S` or `t`. The leading term carries no root of unity. This is the
  case `k = n + 1` of Hörmander's stationary-phase theorem with remainder (Hörmander, Theorem 7.7.5) in the `2n` real
  coordinates of `ℂ^n`, with its uniformity in the phase. The route of (c) below, through [Hörmander], is this roadmap's,
  not that of [FormalProof]. Stated as `stationaryPhase_leadingTerm` in `Suggested.lean`. The estimate follows from
  [FormalProof], `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.StationaryPhase`),
  `Formalism/HermitianCurvature/HermitianCurvatureProofs/StationaryPhaseModel.lean`
  (`Formalism.FourierDecayAlt.P.stationary_phase_holomorphic`); `det H ≠ 0` is not part of that statement and is this
  roadmap's addition.
- (d) *The phase `g_D(x) = Σ_{k=1}^n x_k + D/∏_{k=1}^n x_k` on `(ℂ^×)^n`, `D ∈ ℂ^×`.*
  (i) `∂g_D/∂x_k = 1 − D/(x_k ∏_i x_i)`; the critical points are the points `(z, …, z)` with `z^(n+1) = D`; there
  `g_D = (n + 1)z`, the Hessian is `z^(−1)(1 + 𝟙𝟙ᵀ)` and its determinant is `(n + 1) z^(−n)`. This is [FormalProof],
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.PhaseFunctionCritical`),
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.HessCrit`),
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.HessDet`).
  (ii) If `0 < η ≤ 1/(4(n + 1))` and `|∂g_D/∂x_k (x)| < η` for all `k`, there is `z` with `z^(n+1) = D` and `|x_k − z| ≤ 6η|z|` for
  all `k`. Consequently, for every compact `K_c ⊂ ℂ^×` and `δ > 0` there is `c_δ > 0` with `‖∇g_D(x)‖ ≥ c_δ` for all `D ∈ K_c`
  and all `x ∈ (ℂ^×)^n` with `‖x − (z, …, z)‖ ≥ δ` for every root `z`. This is [FormalProof],
  `Formalism/HermitianCurvature/HermitianCurvatureProofs/PhaseFunctionCriticalPoints.lean`
  (`Formalism.FourierDecayAlt.P.G1.gradSmall6`),
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.GradLower`).
  (iii) For `δ, R > 0` there is `Λ` such that for every `z` with `100(n + 1)δ ≤ |z| ≤ R`, `x₀ = (z, …, z)` and `D = z^(n+1)`:
  `B(x₀, 4δ) ⊂ (ℂ^×)^n`, `|g_D| ≤ Λ` on `B(x₀, 4δ)`, and `‖x − x₀‖ ≤ Λ‖∇g_D(x)‖` on `B̄(x₀, 2δ)`. This is [FormalProof],
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.PhaseFunctionNearCritical`).
  (iv) `‖∇g_D(x)‖ ≤ ‖D_ℂ g_D(x)‖ ≤ n‖∇g_D(x)‖`, and for every `j ≥ 1` there is `C_j`, independent of `D`, with
  `‖D_ℂ^(j+1) g_D(x)‖ ≤ C_j (1 + ‖∇g_D(x)‖) ρ^(−j)` whenever `|x_k| ≥ ρ > 0` for all `k`. This is [FormalProof],
  `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.PhaseFunctionRelativeDeriv`).

(b) and (c) are stated for arbitrary holomorphic phases, with constants that depend on the phase only through `(η, P)`
and `(r, Λ)`: they are applied to amplitudes whose supports and derivative bounds vary with `t`.
Only the leading term is asserted; no asymptotic expansion.

*Route.* (a) In one variable rotate `w` so that `βa/2 ≥ 0`; in real coordinates the integral is a product of two real
Gaussian integrals with parameters `δ ∓ i|βa|/2`. In `n` variables use the Autonne–Takagi factorisation `H = WΣWᵀ` (`W`
unitary, `Σ` diagonal with entries `σ_k ≥ 0`: the antilinear map `x ↦ H x̄` has an orthonormal basis of vectors `v` with
`H v̄ = σv`, `σ ≥ 0`, found one at a time from an eigenvector of the linear map `x ↦ H H̄ x`), the unitary substitution
`x ↦ Wᵀx`, which preserves `μ_β^n` and `Σ|x_k|²`, and the one-variable formula; then `δ → 0+`. (b) The integration by
parts of the non-stationary estimate (Hörmander, Theorem 7.7.1), with its constants kept explicit: with
`b_k = conj(∂_k g)/Σ_l |∂_l g|²`, `Σ_k ∂_k g · b_k = 1` and, for the Wirtinger derivatives `∂_k`,
`∫ ψ_β(g/t) a = −(2t/(iβ)) Σ_k ∫ ψ_β(g/t) ∂_k(b_k a)`; the hypotheses give `‖D^j b_k‖ ≤ C‖D_ℂ g‖^(−1) P^j`, so each integration by
parts gains a constant times `|t|P/η`; after `q` of them bound the integral by the supremum times the measure of the
support. (c) Translate to `x₀ = 0`. Since `∇g(x) = Hx + O(‖x‖²)`, the gradient hypothesis gives `‖Hv‖ ≥ ‖v‖/Λ`, so
`det H ≠ 0` and `|det H| ≥ (√n Λ)^(−n)`; for `|t| ≥ 1` this bounds both terms by a constant times `S |t|^n`. For `|t| < 1`
put `ω = 1/|t|` and `φ = Re(β|t|g/t)`, so that `ψ_β(g/t) = e^(iωφ)` with a real phase `φ` on `ℝ^(2n)`. Cauchy's estimates
bound `φ` in `C^(3n+4)` on `B(0, 3r/2)` in terms of `(n, β, r, Λ)`; the real gradient of `φ` has Euclidean length
`|β| |∇g|₂`, so `|x|₂ ≤ √n Λ |β|^(−1) |φ′(x)|₂` on `B̄(0, r)`; and the real Hessian of the real part of a holomorphic function
with complex Hessian `G` has signature `(n, n)` and determinant of modulus `|det G|²`, here `|β|^(2n) |det H|²`. Theorem
7.7.5 of Hörmander, with `k = n + 1`, the compact set `B̄(0, r)` and the open set `B(0, 3r/2)`, applies to `ℓ ∘ a` for every `ℓ` in the unit
ball of the dual of `V`, with one constant, since `φ` stays in a bounded set of `C^(3n+4)` on `B(0, 3r/2)` and `|x|/|φ′(x)|` is
bounded. Its leading term is `(2π/(ω|β|))^n |det H|^(−1) e^(iωφ(0)) ℓ(a(0))`, the factor `e^(iπ sgn/4)` being `1` because
the signature is `0`, and the density `(|β|/2π)^n` of `μ_β^n` turns it into `|t|^n |det H|^(−1) ψ_β(g(0)/t) ℓ(a(0))`. Its
further terms, of size `ω^(−n−j)` for `1 ≤ j ≤ n` with coefficients given by derivatives of order `≤ 2j` of `ℓ ∘ a` at `0`,
and its remainder are `O(S ω^(−n−1))`. (d) Direct computation; in (ii), with `ρ = D/∏ x_i` one has `x_k = ρ/(1 − ε_k)`, `|ε_k| < η`,
and `ρ^(n+1) = D ∏_k (1 − ε_k)`. The following steps are used as stated and their proofs are not given here: the induction
that produces the Takagi basis in (a); in (c), Hörmander's Theorem 7.7.5, whose proof (Hörmander, §7.7) is part of this
target; and (d)(iii), (d)(iv).
*Needs:* Mathlib Bochner integration, Cauchy estimates for holomorphic functions of several variables, smooth bump
functions (`ContDiffBump`), `integrable_one_add_norm`, the Gaussian integral with complex parameter, the spectral theorem.

**Checks.**

- (a) at `β = 2`, `a = 1`, `δ = 1`: `ψ_2(w²/2) = e^(i(x² − y²))` for `w = x + iy`, and
  `(1/π) ∫_ℝ e^(−(1−i)x²) dx ∫_ℝ e^(−(1+i)y²) dy = (1/π) · π/√2 = 1/√2 = 2/√(4 + 4)`.
- (c) for `n = 1`, `β = 1`, `g(x) = x + 1/x`, `x₀ = 1` (so `g(x₀) = 2`, `H = (2)`, and the hypotheses hold with `r = 0.4`,
  `Λ = 7`), and the amplitude `a(x) = exp(1 − 1/(1 − |x − 1|²/r²))` for `|x − 1| < r`, `a = 0` elsewhere: the leading term
  is `e^(i Re(2/t)) |t|/2`, and numerical integration gives a difference of modulus `5.6·10^(−4)` at `t = 0.02 e^(0.7i)` and
  `5.5·10^(−5)` at `t = 0.01 e^(0.7i)`, that is `1.4|t|²` and `0.55|t|²`, against leading terms of modulus `10^(−2)` and `5·10^(−3)`.
- (d)(i) for `n = 2`: `g_D = x₁ + x₂ + D/(x₁x₂)`; `x₁²x₂ = D = x₁x₂²` forces `x₁ = x₂ = z`, `z³ = D`; the Hessian there is
  `z^(−1)[[2, 1], [1, 2]]`, of determinant `3z^(−2)`. For `n = 1`: `x + D/x`, critical points `±√D`, second derivative `2/z`.

### 8.2 Gaussian integrals over lattices and stationary phase for `Σ x_k + D/∏ x_k` over a non-archimedean ring

*Origin:* adapted from Dąbrowski and Fisher (1997): their exact `p`-adic stationary phase over `ℤ_p`, applied to the
phase `Σ x_k + D/∏ x_k`, is stated over a finite product of `p`-adic fields with a self-dual compact open subring that
need not be a maximal order, uniformly for `D` in a compact set. The Morse lemma (b), a bijection preserving congruences
in every residue characteristic, is particular to this proof; nearest published results: Cluckers and Herremans (2007),
Lemma 3.3, an exact `p`-adic Morse lemma for odd `p` and a unit Hessian, and Adamski (2026), stationary phase over
non-archimedean local fields of odd residue characteristic. The identification of the Gauss factor with the Weil index in
(a), which over `ℚ_p` is Dąbrowski and Fisher's Proposition 1.3 (a), is this roadmap's own formulation.

*Method of the formal proof:* Gaussian sums over a lattice are evaluated in modulus by expanding the squared modulus and
using orthogonality of characters; near a critical point an exact identity writes the phase as `(m + 1)z` plus a
quadratic form whose matrix depends on the point, and a fixed point of the matrix equation `Y = N − ϖ·Y·G·Y` on a
compact set gives a bijection preserving congruences that makes the quadratic part exact; away from the critical points
the phase is affine on small cosets with a derivative that is not small, so the sums vanish coset by coset.

Let `(K, 𝔒, ψ)` be as in the Conventions; every nonzero integer is invertible in `K`, and nothing is assumed about the
residue characteristics or about `𝔒` being a maximal order. For every lattice `L`, `L^⊥` is a lattice,
`L^(⊥⊥) = L` and `vol(L) vol(L^⊥) = 1` (AnalyticNumberTheoryPartII §5.3g at `F = ℚ`, `v = p`, `V = K_(p)` the product of the
factors of `K` over `p`, `B(x, y) = λ(xy)` with `ψ = ψ_(ℚ_p)∘λ` on `K_(p)`; a lattice is the product of its parts in the
`K_(p)`; [FormalProof], `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean`
(`Formalism.FourierDecayAlt.A6.PerpLat`), `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean`
(`Formalism.FourierDecayAlt.A6.volL`)), so `dx` is the Haar measure self-dual for `ψ`. For `m ≥ 1` and `D ∈ K^×` let
`g_D(x) = Σ_{k=1}^m x_k + D/∏_{k=1}^m x_k` on `(K^×)^m`; its critical points are the points `(z, …, z)` with `z^(m+1) = D`, finitely
many, with `g_D(z, …, z) = (m + 1)z`. An *amplitude of type `(L₀, Λ₁)`*, for lattices `L₀`, `Λ₁`, is a function `A : K^m → ℂ` that
vanishes unless every `x_k` is a unit with `x_k ∈ L₀` and `x_k^(−1) ∈ L₀`, and that is invariant under translation by `Λ₁^m`.
Prove that:

- (a) *Gaussian integrals, the Gauss factor and the Weil index.* Let `M ∈ M_m(K)` be symmetric with `det M ∈ K^×`, and
  call a lattice `L` *admissible for `M`* if `ψ(½ yᵀM^(−1)y) = 1` for all `y ∈ (L^⊥)^m`. Every lattice containing an
  admissible lattice is admissible. For every admissible `L`, `|∫_{L^m} ψ(½ ξᵀMξ) dξ| = |det M|^(−1/2)`, and the integral
  is the same for all admissible `L`. The number `γ_ψ(M) = |det M|^(1/2) ∫_{L^m} ψ(½ ξᵀMξ) dξ`, for any admissible `L`, of
  modulus `1`, is the *Gauss factor* of `M`. For `γ(a) := γ_ψ(H_m(a))`:
  `∫_{L^m} ψ(½ ξᵀH_m(a)ξ) dξ = γ(a) |m + 1|^(−1/2) |a|^(m/2)` for `L` admissible for `H_m(a)`, and `γ(ab²) = γ(a)` for all
  `a, b ∈ K^×`. For every lattice `L` and compact `Q ⊂ K^×` there is a neighbourhood `V` of `0` such that `L` is admissible
  for `H_m(zt)` whenever `t ∈ V ∩ K^×` and `z^(m+1) ∈ Q`. The modulus, the independence of `L` and the properties of
  `γ(a)` are [FormalProof],
  `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean` (`Formalism.FourierDecayAlt.A6.GaussModulus`),
  `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean` (`Formalism.FourierDecayAlt.A6.GaussIndep`),
  `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean` (`Formalism.FourierDecayAlt.A6.GaussHess`).
  *The Gauss factor is a Weil index.* Write `K = ∏_i K_i` with
  `K_i` finite extensions of fields `ℚ_p`, `M = (M_i)_i`, and `ψ_i` for the restriction of `ψ` to `K_i`, which is nontrivial
  because `𝔒` is compact. Then `γ_ψ(M) = ∏_i γ_(ψ_i)(q_i)`, the product of the Weil indices (MetaplecticAutomorphicForms
  §2.1) of the nondegenerate quadratic forms `q_i(ξ) = ½ ξᵀM_iξ` on `K_i^m`, whose polar forms are the `M_i`. For
  `K = ℚ_p`, `𝔒 = ℤ_p` and `L = ℤ_p` this is Dąbrowski–Fisher, Proposition 1.3 (a) with (1.3). This identification is this
  roadmap's: [FormalProof] defines the Gauss factor by the integral, as above, and (b), (c), (d) use only that definition,
  `|γ(a)| = 1` and `γ(ab²) = γ(a)`.
- (b) *The Morse lemma for `g_D`.* For every compact `Q ⊂ K^×` there is a neighbourhood `V` of `0` such that for every
  `𝔒`-submodule `B ⊂ V` of `K` that is a lattice and every `z ∈ K^×` with `z^(m+1) ∈ Q` there is a bijection `φ : B^m → B^m` with:
  for every `𝔒`-submodule `Λ ⊂ B` and `ξ, η ∈ B^m`, `φ(ξ) − φ(η) ∈ Λ^m` if and only if `ξ − η ∈ Λ^m`; and for every `ξ ∈ B^m` the
  elements `z + φ(ξ)_k` are units and
  `g_{z^(m+1)}(z + φ(ξ)_1, …, z + φ(ξ)_m) = (m + 1)z + ½ ξᵀ H_m(z) ξ`. This is [FormalProof],
  `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean` (`Formalism.FourierDecayAlt.A6.MorseLemma`).
- (c) *Vanishing away from the critical points.* For lattices `L₀, Λ₁, B` and compact `Q ⊂ K^×` there is a neighbourhood `V`
  of `0` such that for all `t ∈ V ∩ K^×`, `D ∈ Q` and every amplitude `A` of type `(L₀, Λ₁)`, the integral of
  `A(x) ψ(g_D(x)/t)` over the set of `x` lying in no `(z, …, z) + B^m`, `z^(m+1) = D`, is `0`. This is [FormalProof],
  `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean` (`Formalism.FourierDecayAlt.A6.NonStationary`),
  `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean` (`Formalism.FourierDecayAlt.A6.AmpHyp`).
- (d) *Stationary phase.* For lattices `L₀, Λ₁` and compact `Q ⊂ K^×` there is a neighbourhood `V` of `0` such that for all
  `t ∈ V ∩ K^×`, `D ∈ Q` and every amplitude `A` of type `(L₀, Λ₁)`,
  `∫_{K^m} A(x) ψ(g_D(x)/t) dx = |t|^(m/2) Σ_{z ∈ K^×, z^(m+1) = D} γ(zt) |m + 1|^(−1/2) |z|^(m/2) ψ((m + 1)z/t) A(z, …, z)`.
  By (a) with `L = 𝔒`, which is admissible for `H_m(zt)` once `t` is small, the term of `z` is
  `ψ((m + 1)z/t) A(z, …, z) ∫_{𝔒^m} ψ(½ ξᵀH_m(zt)ξ) dξ`. In this form, with `K = ∏_i F_i` for nonarchimedean local fields
  `F_i` of characteristic zero, (d) is stated as `stationaryPhase_nonarchimedean` in `Suggested.lean`. This is [FormalProof], `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean`
  (`Formalism.FourierDecayAlt.A6.StationaryPhase`). 
The identities (b), (c), (d) are exact, and special to the phase `g_D`; (a) holds for every nondegenerate symmetric `M`.
The Gauss factor is defined by (a); its identification with the Weil index of MetaplecticAutomorphicForms §2.1, factor by
factor, is the last clause of (a). With the self-dual measure no index of lattices appears.
For `K = ℚ_p`, `𝔒 = ℤ_p`, `t` a power of `p` and amplitudes supported on `(ℤ_p^×)^m`, (c) and (d) are
the `p`-adic stationary-phase formula of Dąbrowski–Fisher (Theorem 1.8 and Corollary 1.10; their Examples 1.16 and 1.17
apply it to the hyper-Kloosterman sums, whose phase is `g_D`).

*Route.* (a) Let `Λ ⊂ L` be a lattice under which the integrand is invariant. The integral is `vol(Λ)^m S`,
`S = Σ_{y ∈ L^m/Λ^m} F(y)`, `F(y) = ψ(½ yᵀMy)`, and `F(y + w) = F(y)F(w)ψ(yᵀMw)`. For a function `F` of modulus `1` on a finite
abelian group `X` with `F(y + w) = F(y)F(w)β(y, w)`, `β` a bicharacter, and `F = 1` on the radical `X₀` of `β`:
`|Σ_X F|² = Σ_{w, h} F(w + h) conj F(w) = Σ_h F(h) Σ_w β(w, h) = #X · #X₀`. Admissibility gives `M^(−1)(L^⊥)^m ⊂ L^m`, identifies `X₀`
with `M^(−1)(L^⊥)^m/Λ^m` and gives `F = 1` on it; so
`|∫|² = vol(L)^m vol(L^⊥)^m |det M|^(−1) = |det M|^(−1)`. Independence: for admissible `L ⊂ L″`, on a coset `c + L^m ≠ L^m` in `L″^m`
the translations by `M^(−1)u`, `u ∈ (L^⊥)^m`, preserve the coset and multiply the integrand by the constant `ψ(cᵀu)`, which is
`≠ 1` for some `u` since `L^(⊥⊥) = L`; so only `L^m` contributes, and two admissible lattices are compared with their sum.
For the identification with the Weil index: a product lattice `∏_i L_i` containing `L` is admissible, `dx` is the product
of the self-dual measures of the `K_i`, and the integral over `(∏_i L_i)^m` is the product of the integrals over the
`L_i^m`. Over `K_i`, `L_i^m` is the dual for the polar form `M_i` of the lattice `M_i^(−1)(L_i^⊥)^m`, on which `ψ_i ∘ q_i` is
trivial by admissibility, so the integral over `L_i^m` is the normalised Gauss sum `vol · Σ` of `weilIndex_gaussSum` and its
unit normalisation is `γ_(ψ_i)(q_i)` (MetaplecticAutomorphicForms §2.1). `det H_m(a) = (m + 1)a^(−m)`; `ξ ↦ bξ` carries
lattices admissible for `H_m(a)` to lattices admissible for `H_m(ab^(−2))` and multiplies the integral by `|b|^m`, which
gives `γ(ab²) = γ(a)` without the Weil index. A fixed `L` is admissible for `H_m(zt)` once `zt` is small, since
`H_m(zt)^(−1) = zt(1 − 𝟙𝟙ᵀ/(m + 1))`, `(L^⊥)^m` is compact, `z` ranges over a compact set and `ψ = 1` on the open set `𝔒`. (b) For `(1 + y_k)w_k = 1`: `Σ_k y_k + ∏_k w_k − 1 = ½ yᵀM(w)y` with `M(w)_{ii} = 2w_i`,
`M(w)_{ij} = w_i w_j ∏_{k < min(i,j)} w_k`, `M(𝟙) = H := 1 + 𝟙𝟙ᵀ`; so `g_{z^(m+1)}(z(1 + y)) = (m + 1)z + ½ z yᵀM(w)y`. For matrices
`G, N` with entries in `𝔒` the equation `Y = N − ϖ YGY` (`ϖ ∈ 𝔒` a unit of `K` with `K = ⋃_j ϖ^(−j)𝔒`) has a solution with entries
in `𝔒`, as a fixed point of a map of a compact set that is contracting for the filtration by the `ϖ^j𝔒`; it is symmetric
when `G, N` are and depends on `N` compatibly with congruences modulo every `𝔒`-submodule. With `H′ = (m + 1) − 𝟙𝟙ᵀ`
(`HH′ = m + 1`), a symmetric solution of `Y = N − ϖ YH′Y` gives `P = 1 + 2ϖ H′Y` with `PᵀHP = H + 4(m + 1)ϖ N`; take
`N = (M(w) − H)/(4(m + 1)ϖ)` for `y ∈ 4(m + 1)ϖ𝔒` and `ξ = z P(y)y`; a map `T(v) = v + ϖ Y(v)v` with `Y(·)` integral and
compatible with congruences (the entries of `Y(v)v − Y(v′)v′` lie in the `𝔒`-module `Λ″` generated by those of `v − v′`) is
a bijection of `B^m` preserving congruences: `T(v) − T(v′) ≡ v − v′` modulo `ϖΛ″^m`, so for an `𝔒`-submodule `Λ ⊂ B`, which is
finitely generated and hence closed, `T(v) − T(v′) ∈ Λ^m` if and only if `v − v′ ∈ Λ^m` (`Λ″ ⊂ Λ + ϖΛ″` forces `Λ″ ⊂ Λ`);
so `T` is injective, permutes each finite quotient `B^m/(ϖ^jB)^m`, and has a dense compact image, which is `B^m`. (c) The
argument of Dąbrowski–Fisher, Theorem 1.8 (a), with `ϖ` in place of `p`: on balls of radius `ν`, `ν/t` a negative power of
`ϖ`, the amplitude is constant and the phase is affine modulo `t𝔒`; away from the critical points some `∂g_D/∂x_k` is not
small (otherwise Hensel's lemma for `(m + 1)`-th roots, as in their Lemma 1.20, puts `x` near a critical point), and the
sum of the character over the ball vanishes. (d) Split `K^m` into the balls `(z, …, z) + B^m` and the rest, for a small `𝔒`-module `B`; use (c) on
the rest; on a ball `A` is constant, (b) turns the phase into `(m + 1)z/t + ½ ξᵀH_m(zt)ξ` by a measure-preserving
bijection, and (a) evaluates the Gaussian integral over `B^m`, `B` being admissible for `H_m(zt)` when `t` is small.
The duality of lattices (`L^⊥` a lattice, `L^(⊥⊥) = L`, `vol(L) vol(L^⊥) = 1`) is AnalyticNumberTheoryPartII §5.3g, as
cited above.
*Needs:* AnalyticNumberTheoryPartII §5.3g (the duality of lattices); for the identification with the Weil index in the last clause of
(a) only, MetaplecticAutomorphicForms §2.1 (`weilIndex` with `weilIndex_gaussSum`); Mathlib additive characters (`AddChar`), Haar measure on locally compact groups, indices of
subgroups, orthogonality of characters of finite abelian groups.

**Checks.**

- (a) for `K = ℚ_3`, `𝔒 = ℤ_3`, `ψ(x) = e^(2πi{x})`, `m = 1`, `M = (2/3)`, so `½ ξᵀMξ = ξ²/3` and `|det M|^(−1/2) = 3^(−1/2)`: the
  lattices `ℤ_3` and `3^(−1)ℤ_3` are admissible and both give `(1/3)(1 + 2e^(2πi/3)) = i/√3`, so `γ_ψ(M) = i`; the lattice `3ℤ_3`
  is not admissible and gives `1/3`. Here `1 + 2e^(2πi/3) = i√3` is the quadratic Gauss sum `Σ_{r mod 3} e^(2πi r²/3)` of
  CharacterSumsOverFiniteFields §1.4.
- (d) for `K = ℚ_3`, `m = 1`, `D = 1`, `t = 9`, `A` the indicator of `ℤ_3^×`: the left side is
  `(1/9) Σ_{x ∈ (ℤ/9)^×} e^(2πi(x + x^(−1))/9) = (2/3) cos(4π/9)`; on the right `z = ±1`, `γ(±9) = 1` (as `Σ_{ξ mod 9} e^(2πiξ²/9) = 3`),
  and the sum is `(1/3)(e^(4πi/9) + e^(−4πi/9)) = (2/3) cos(4π/9)`. At `t = 3` the two sides are `−1/3` and `1`: the
  neighbourhood `V` is needed. For `K = ℚ_p` with `p` odd, `m = 1`, `A` the indicator of `ℤ_p^×`, `D ∈ ℤ_p^×` and `t = p^k`,
  the left side of (d) is `p^(−k)` times the Kloosterman sum `S(1, D; p^k)`, and (d) is Salié's evaluation of
  CharacterSumsOverFiniteFields §7.5 with the Gauss factor left as `γ`, for the `k` with `p^k ∈ V`, while that evaluation
  allows every `k ≥ 2`; at `p = 3`, `k = 2`, `D = 1` it gives the value `(2/3) cos(4π/9)` above.
- (b) for `m = 1`: `x + z²/x = 2z + ξ²/z` with `x = z(1 + y)` and `ξ = z y (1 + y)^(−1/2)`, since `y + (1 + y)^(−1) − 1 = y²/(1 + y)`.

### Examples

- 8.1 (a) at `β = 2`, `a = 1`, `δ = 1`: the one-variable Gaussian integral equals `1/√2 = 2/√(4 + 4)`.
- 8.1 (c) for `n = 1`, `g(x) = x + 1/x` at `x₀ = 1`: the leading term is `e^(i Re(2/t)) |t|/2`, and the difference from the integral against a bump amplitude is about `1.4|t|²` at `|t| = 0.02` and `0.55|t|²` at `|t| = 0.01`.
- 8.1 (d)(i) for `n = 2`: the critical points of `x₁ + x₂ + D/(x₁x₂)` are `(z, z)` with `z³ = D`, with Hessian determinant `3z^(−2)`.
- 8.2 (a) over `ℚ_3` with `M = (2/3)`: the admissible lattices `ℤ_3` and `3^(−1)ℤ_3` both give `i/√3`, so the Weil index of `ξ²/3` is `i`; the lattice `3ℤ_3` is not admissible and gives `1/3`.
- 8.2 (d) over `ℚ_3` with `m = 1`, `D = 1` and `A` the indicator of `ℤ_3^×`: both sides equal `(2/3) cos(4π/9)` at `t = 9`, and differ (`−1/3` against `1`) at `t = 3`.
- 8.2 (b) for `m = 1`: `x + z²/x = 2z + ξ²/z` with `x = z(1 + y)` and `ξ = z y (1 + y)^(−1/2)`.

### Dependencies

No earlier layer. AnalyticNumberTheoryPartII §5.3g, the duality of lattices, and MetaplecticAutomorphicForms §2.1, the Weil index (the last clause of 8.2 (a)). Mathlib Bochner integration, Cauchy estimates for holomorphic functions of several variables, smooth bump functions, the Gaussian integral with complex parameter and the spectral theorem (8.1); additive characters, Haar measure on locally compact groups, indices of subgroups and orthogonality of characters of finite abelian groups (8.2).

## Downstream consumers

- GeneralizedRiemannHypothesisFromWindowBounds: Landau's theorem for positive combinations of logarithmic derivatives of Dirichlet and ray-class `L`-functions, for all large `y` (6.4 (b), (c) and (d), at GeneralizedRiemannHypothesisFromWindowBounds §§1.1–1.3) and on windows: the forms with the hypotheses of the formal proof of 6.8 and 6.9 (b) for its main line, the zero-free conclusions at GeneralizedRiemannHypothesisFromWindowBounds §§2.1–2.3, and the extensions of 6.8 and 6.9 (b) only for its lower-bound consequences at GeneralizedRiemannHypothesisFromWindowBounds §§2.4 and 2.5; and the window predicate `HasWindows` with its API (6.9 (a), in the Conventions of that roadmap, at GeneralizedRiemannHypothesisFromWindowBounds §3.1 and in its Layers 2–5). That roadmap proves the meromorphic continuation, the location of the poles and the signs of their residues for its own transforms; Layer 6 needs none of that arithmetic.
- ThetaChainsAndFrobeniusPrimeSums: the window predicate `HasWindows` and its API (6.9 (a)), at ThetaChainsAndFrobeniusPrimeSums §§10.7, 10.10 and 10.11.
- BesselPoincareSeriesAndGramBounds: the non-vanishing of Laplace's method 7.1 (d), with `t` a positive integer, at BesselPoincareSeriesAndGramBounds §5.13d (e); the non-stationary bound, the leading term of stationary phase and the critical data of the phase `Σ x_k + D/∏ x_k`, 8.1 (b), (c), (d), at BesselPoincareSeriesAndGramBounds §5.18d (g); and the Gaussian integrals over lattices with their Gauss factor `γ(a)` and the exact stationary-phase formula over a non-archimedean ring, 8.2 (a), (d), at BesselPoincareSeriesAndGramBounds §5.17c (b1).

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns:

- Landau's theorem for one-sided Laplace transforms (Layer 6): Taylor coefficients of a transform as integrals against the Gamma kernel; the kernel's mass, supremum, profile, supremum off a window and mass off an interval and off a window; the meromorphic, one-sided and rightmost-pole forms of the classical theorem for eventually nonnegative functions; the coefficient-wise window inequality; Cauchy estimates near a pole of finite order; the choice of expansion point; the windowed theorem in the form of the formal proof and in its extension to poles of any finite order; its Mellin and Dirichlet-series forms, with the window predicate `HasWindows`; and the agreement with Landau's theorem for Dirichlet series.
- Laplace's method in several variables with a uniform majorant, with the positivity of the limiting form, the non-vanishing of complex Gaussian integrals and of the integrals for large parameter (Layer 7).
- Over `ℂ^n`: complex Gaussian integrals, the non-stationary bound and the leading term of stationary phase for holomorphic phases with Banach-valued amplitudes, and the critical data of the phase `Σ x_k + D/∏ x_k`; over a finite product of `p`-adic fields with a self-dual compact open subring: Gaussian integrals over admissible lattices with their Gauss factor, and its identification with the Weil index, the Morse lemma for the same phase, its vanishing away from the critical points, and the exact stationary-phase formula (Layer 8).

The theory these statements extend is owned by their homes. [ArithmeticDirichletSeriesPartII](../../ArithmeticDirichletSeriesPartII/README.md) owns the one-sided Laplace transform and the predicate `HasLaplace` (ArithmeticDirichletSeriesPartII §0.1), Landau's theorem for functions of one sign (ArithmeticDirichletSeriesPartII §0.1b), the boundary data `PoleBoundary` with its normalisation of the leading coefficient (ArithmeticDirichletSeriesPartII §0.2), the counting function of a Dirichlet series (its Conventions) and its transform (ArithmeticDirichletSeriesPartII §4.1, and §4.1a for coefficients of any sign), and Delange's theorem. [AsymptoticExpansions](../../AsymptoticExpansions/README.md) owns the holomorphy of the Laplace integral with its derivatives (AsymptoticExpansions §4.1a), Darboux's method with its meromorphic case (AsymptoticExpansions §§13.6, 13.6a), and Laplace's method and stationary phase in one variable (Layers 5 and 6); Layers 7 and 8 above are their analogues in several variables and over non-archimedean rings and use no statement of them.

Three statements here have relatives in other roadmaps and are kept, each in the form this roadmap needs. 6.3 is Landau's theorem of ArithmeticDirichletSeriesPartII §0.1b, stated with the value on a disc, the form 6.4 and 6.10 use. 6.1 (a), the formula of 6.1 (b) and the conjugation in 6.1 (c) are stated in AsymptoticExpansions §4.1a, from integrability alone; 6.1 adds the bound of `a_k` by the Gamma kernel and the normal form of a meromorphic continuation. 8.1 (b) is non-stationary phase for holomorphic phases, with derivative bounds relative to the gradient at a scale `P`, Banach-valued amplitudes and a constant independent of the domain, where QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §1.3 (i) treats real phases on a fixed open set with constants depending on absolute derivative bounds.

Not owned here:

- Landau's theorem for the Laplace transforms of functions of one sign is ArithmeticDirichletSeriesPartII §0.1b; 6.3 states it in the form used here.
- Landau's theorem for Dirichlet series with nonnegative coefficients is completed ArithmeticDirichletSeries 8.1, in the library as `TauCeti.LSeries.landau`; 6.10 only records the agreement.
- Weighted families of Dirichlet or ray-class characters, their Riesz-smoothed prime sums, the residues of the associated transforms and every zero-free conclusion drawn from Layer 6: GeneralizedRiemannHypothesisFromWindowBounds.
- Windows shorter than a fixed ratio, `[U, U + ψ(U)]` with `ψ(U) = o(U)`: Layer 6 does not treat them, and for bounded `ψ` the statement is false (Checks of 6.8).
- The Bessel periods, orbital integrals and local integrals to which Layers 7 and 8 are applied: BesselPoincareSeriesAndGramBounds.
- The Weil index of a nondegenerate quadratic form over a local field, with its modulus, its invariance under isometries and its Gauss-sum formula: MetaplecticAutomorphicForms §2.1. 8.2 (a) defines the Gauss factor by the Gaussian integral over an admissible lattice and, in its last clause, identifies it with the product of the Weil indices over the factors of `K`.

## Exact supplier contracts

### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII

- §0.1, `HasLaplace` and its API (convergence, value, uniqueness, almost-everywhere congruence, additivity, scalar multiplication): every transform of Layer 6 is a `HasLaplace` statement with the default measure on `(0, ∞)`; integrability is part of the predicate; additivity and scalar multiplication are used in 6.9 (c).
- §0.1b, Landau's theorem for functions of one sign: if `g ≥ 0` for large `u`, `HasLaplace g s (F s)` for `Re s > A`, and `F` agrees on `Re s > A` near `A` with a function analytic on a disc about `A`, then `HasLaplace g s` holds on `Re s > A′` for some real `A′ < A`, with a value analytic in `s` that equals `F` on `Re s > A`: the statement 6.3, used in 6.4 and 6.10.
- §0.2, `PoleBoundary`: the normalisation of its leading coefficient `A`, which is the leading coefficient `meromorphicTrailingCoeffAt` of the Conventions above.
- Conventions and §4.1: the counting function `S_c` and the transform `F(s)/s` of `S_c(e^t)` for nonnegative coefficients with an absolutely convergent series on `Re s > a ≥ 0`, used as stated in 6.9 (c) and 6.10.
- §4.1a, the counting-function transform for coefficients of any sign: for `c : ℕ → ℂ` with a series converging absolutely at `s`, `Re s > 0`, `HasLaplace` of `S_c(e^t)` with value `F(s)/s` and `∫₁^∞ S_c(y) y^(−s−1) dy = F(s)/s`: the general theorem of which the transform identity of 6.9 (c) is a corollary.

### From TauCetiRoadmap.AsymptoticExpansions

- §4.1a, the holomorphy of the Laplace integral `Q(z) = ∫₀^∞ e^(−zt) q(t) dt` of a function with `e^(−σt) q(t)` integrable on `(0, ∞)` for every real `σ > c`: `Q` is holomorphic on `Re z > c`, `Q^(k)(z) = (−1)^k ∫₀^∞ t^k e^(−zt) q(t) dt`, and `Q(z̄) = conj Q(z)` for real-valued `q`: the general theorem of which 6.1 (a), the formula of 6.1 (b) and the conjugation in 6.1 (c) are corollaries.
- §13.6a, Darboux's method in the meromorphic case: for a function holomorphic on a disc of radius `r` about `0` except for finitely many poles inside it, the Taylor coefficients at `0` are those of the sum of the principal parts up to `O(r′^(−n))` for every `r′ < r`: the general theorem of which the first estimate of 6.6 (b) is a corollary.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

- §4.5c, the complex Gamma–Laplace adapter: the model transforms `k!/(s − a)^(k+1)` of `e^(au) u^k` in the Examples of Layer 6.
- §5.3g, local characters, self-dual measures and Fourier inversion, at `F = ℚ` and a finite place `p`, for `V = K_(p)` with `B(x, y) = λ(xy)`: the annihilator `L^⊥` of a lattice is a lattice, `L^(⊥⊥) = L` and `vol(L) vol(L^⊥) = 1`, used in 8.2.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §2.1, `weilIndex` with `weilIndex_gaussSum`: the Weil index `γ_ψ(q)` of a nondegenerate quadratic form `q` over a nondiscrete local field of characteristic different from `2` and a nontrivial character `ψ`, equal to the unit normalisation of the Gauss sum over the dual, for the polar form, of a lattice on which `ψ ∘ q` is trivial. Used over each factor `K_i` of `K` in the last clause of 8.2 (a), the identification of the Gauss factor with the Weil index, with the forms `½ ξᵀM_iξ`.

### From [ArithmeticDirichletSeries](../../../Completed/ArithmeticDirichletSeries/README.md) (completed)

- Layer 8.1, Landau's theorem (`TauCeti.LSeries.landau`: a Dirichlet series with nonnegative coefficients and finite abscissa of absolute convergence `σ` has no analytic continuation across `σ`): the comparison of 6.10.

### From Mathlib

- `MeromorphicOn`, with `MeromorphicOn.eventually_codiscreteWithin_analyticAt` (the poles of a meromorphic function on an open set are discrete in it), `meromorphicOrderAt` and `meromorphicTrailingCoeffAt` (the value `h(x)` of a presentation `(z − x)^order • h z`, `h` analytic at `x`), with `meromorphicTrailingCoeffAt_congr_nhdsNE` (functions that agree on a punctured neighbourhood of `x` have the same leading coefficient at `x`): poles, orders and leading coefficients in Layer 6.
- `toMeromorphicNFOn`, with `toMeromorphicNFOn_eqOn_codiscrete`, `meromorphicNFOn_toMeromorphicNFOn`, `MeromorphicOn.toMeromorphicNFOn_eq_self_on_nhdsNE`, `meromorphicOrderAt_toMeromorphicNFOn` and `MeromorphicNFAt.meromorphicOrderAt_nonneg_iff_analyticAt`: the normal form of 6.1 (c), analytic off the poles, with the same orders and the same punctured germs.
- `norm_cauchyPowerSeries_le`: Taylor expansion on discs and Cauchy's estimate for its coefficients, 6.6; `deriv_zpow` and removable singularities, 6.6.
- `MeasureTheory.integral_comp_exp_Ioi` and `MeasureTheory.integrableOn_comp_exp_Ioi`: the substitution `y = e^u`, 6.9.
- `Real.pow_div_factorial_le_exp` (`x^n/n! ≤ e^x` for `x ≥ 0`; at `x = n` it gives `n! ≥ (n/e)^n`), `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `ProbabilityTheory.gammaPDFReal` and `ProbabilityTheory.lintegral_gammaPDF_eq_one`: the kernel of 6.2. `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the integral sign), 6.1.
- Compactness of closed balls in `ℂ` and finiteness of discrete subsets of compact sets, 6.7; the identity theorem, 6.1, 6.3 and 6.4.
- `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`, `integrable_rpow_neg_one_add_norm_sq`, `MeasureTheory.Measure.integral_comp_smul`, `GaussianFourier.integral_cexp_neg_sum_mul_add`, `Real.geom_mean_le_arith_mean2_weighted` and the spectral theorem for real symmetric matrices: 7.1.
- Bochner integration of Banach-valued functions, Cauchy estimates for holomorphic functions of several variables, smooth bump functions (`ContDiffBump`), `integrable_one_add_norm`, the Gaussian integral with complex parameter and the spectral theorem: 8.1.
- Additive characters (`AddChar`), Haar measure on locally compact groups, indices of subgroups and orthogonality of characters of finite abelian groups: 8.2.

### From Tau Ceti

- `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (the finite principal part at a meromorphic point): 6.6.
- `TauCeti.LSeries.landau` (Landau's theorem for Dirichlet series with nonnegative coefficients): the comparison of 6.10.

## References

- E. Landau, *Über einen Satz von Tschebyschef*, Math. Ann. 61 (1905): the theorem on transforms of nonnegative functions (6.3, as stated in ArithmeticDirichletSeriesPartII §0.1b), its one-sided use (6.4), and the theorem for Dirichlet series with nonnegative coefficients (6.10, as stated in completed ArithmeticDirichletSeries 8.1).
- D. V. Widder, *The Laplace Transform*, Princeton (1941), Chapter II: differentiation under the integral and the singularity at the real abscissa (6.1, 6.3); the kernels of the Post–Widder inversion formula (6.2).
- H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I. Classical Theory*, Cambridge (2007), §15.1: Landau's theorem and one-sided oscillation (6.4); chapter 1: a Dirichlet series as `s` times the Mellin integral of its summatory function (6.9 (c), through ArithmeticDirichletSeriesPartII §4.1a).
- J. Kaczorowski and J. Pintz, *Oscillatory properties of arithmetical functions. I*, Acta Math. Hungar. 48 (1986), 173–185, Theorem 1 and Corollary 1 (pp. 175–176): a sign change in every interval `[Y^(1−ε), Y]` with `Y` large, for a real function whose Mellin transform is regular for `Re s > Θ` but in no larger half-plane and meromorphic a little to the left of `Re s = Θ`, the proof using also regularity at the real point `Θ`; the form of the formal proof of 6.8, and of 6.9 (b), follows from it (6.8).
- J. Kaczorowski and J. Pintz, *Oscillatory properties of arithmetical functions. II*, Acta Math. Hungar. 49 (1987), 441–453, Theorem (pp. 441–442): the same conclusion for algebraic and logarithmic singularities (6.8).
- J. Pintz, *On the remainder term of the prime number formula I*, Acta Arith. 36 (1980), 341–365: §§10–12, a window inequality with a Gaussian kernel concentrated on a window (6.5); Theorems 1 and 2, window theorems for the remainder term of the prime number theorem, for the route of 6.8.
- J. Kaczorowski, Acta Arith. 44 (1984), 365–377, sections 3–7: one smoothing order per window, with the nearest pole dominant and no power sums, for the route of 6.8.
- Mahatab and Mukhopadhyay (2015), arXiv:1512.03144, proof of Theorem 3.2: the step `k = 0` of 6.5.
- P. Flajolet and R. Sedgewick, *Analytic Combinatorics*, Cambridge University Press (2009), Chapters IV–V: coefficient asymptotics of meromorphic functions (6.6, through AsymptoticExpansions §13.6a).
- R. Wong, *Asymptotic Approximations of Integrals*, Academic Press (1989), Chapters VIII–IX: multidimensional integrals, Laplace's method for multiple integrals (7.1).
- [Hörmander] L. Hörmander, *The Analysis of Linear Partial Differential Operators I. Distribution Theory and Fourier Analysis*, 2nd ed., Springer (1990; reprinted 2003): §7.6, the Fourier transforms of Gaussian functions (7.1); Theorem 7.7.1, the non-stationary estimate (8.1 (b)), and Theorem 7.7.5, stationary phase with remainder, with a constant bounded when the phase stays in a bounded set and `|x − x₀|/|f′(x)|` is bounded (8.1 (c)).
- [Dąbrowski–Fisher] R. Dąbrowski and B. Fisher, *A stationary phase formula for exponential sums over ℤ/p^mℤ and applications to GL(3)-Kloosterman sums*, Acta Arith. 80 (1997), 1–48: Proposition 1.3 (a) and (1.3), normalised Gauss sums as Weil indices (8.2 (a)); Theorem 1.8, Corollary 1.10 and Lemma 1.20, the `p`-adic stationary-phase formula over `ℤ_p` (8.2 (c), (d)); Examples 1.16 and 1.17, the hyper-Kloosterman phase.
- Cluckers and Herremans, Bull. SMF 135 (2007), arXiv:math/0408139, Lemma 3.3 and Proposition 3.5: an exact `p`-adic Morse lemma with an isometric change of variables, for odd `p` and a unit Hessian, used to evaluate sums modulo `p^m`; a nearest published result for 8.2 (b).
- Adamski, Confluentes Math. 18 (2026), arXiv:2502.04881, Theorems 1.5 and 1.12: additive stationary phase over non-archimedean local fields of odd residue characteristic, by an exact Morse lemma; a nearest published result for 8.2.
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The source of the windowed Landau theorem for simple poles with positive residues at the real poles (the form of the formal proof of 6.8), and of its route: the Taylor coefficients of the transform and a bound for it, for `|g(u)| ≤ C e^(2u)` on `Re s > 2` only (6.1, whose `*Origin:*` label names what goes beyond that case), the mass and supremum of the kernel and its mass off an interval and off a window (6.2 (a), (b), (e), (f)), the positivity of one Taylor coefficient per window (6.5 (a), (c)), Cauchy's estimate and the coefficients near a simple pole (6.6 (a); 6.6 (b) for simple poles), the choice of the expansion point (6.7) and the two cases of 6.8; of the window predicate (6.9 (a)); and of the statements of Layers 7 and 8 other than 7.1 (a), the limit of 7.1 (c) and `det H ≠ 0` in 8.1 (c), which it does not state, the Gauss factor of 8.2 (a) being defined there by the Gaussian integral. The tail estimate 6.2 (c), (d) with 6.5 (b), the positivity 6.5 (a) outside the range `σ > 2` with the pointwise bound, poles of higher order and the dichotomy of 6.8 and 6.9 (b), the route of 8.1 (c) through [Hörmander] and the identification of the Gauss factor with the Weil index in 8.2 (a) are this roadmap's.
- [Announcement] Levent Alpöge, the announcement of that proof (2026): <https://alpo.ge/remark.pdf>.
