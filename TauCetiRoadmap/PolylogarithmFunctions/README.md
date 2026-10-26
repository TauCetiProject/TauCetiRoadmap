# Roadmap: polylogarithm functions

**Summary.** Construct the classical polylogarithms `Liₙ` as analytic functions of a complex variable in every integer weight, starting from Mathlib's principal logarithm, Bochner integral, Bernoulli numbers and zeta values. Continue the whole tower `(Log, Li₁, Li₂, …)` coherently along paths in `ℂ∖{0,1}` with Tau Ceti's analytic-continuation and universal-cover API, and compute its monodromy. Prove the classical functional equations (distribution, Bernoulli inversion, Euler reflection, Abel's five-term identity) on explicit principal domains and along common paths. Build Zagier's real single-valued polylogarithms `Lₙ` for every weight `n ≥ 2`, prove that they are branch independent, real analytic off `{0,1}`, continuous on the Riemann sphere, and give their real differential in every weight. Specialise to the Bloch–Wigner function `D = L₂`: its one-form, Laplacian, strict positivity on the upper half-plane and the five-term relation in affine, Abel and projective form, proved analytically. Construct the interval Rogers dilogarithm with its reflection, pentagon and golden-ratio values, and export the quantitative estimates (truncation, Fourier and endpoint bounds) that arithmetic consumers need.

`README.md` is normative. `Suggested.lean` states headline theorems against the pinned Mathlib and Tau Ceti, using concrete definitions where needed; it is not exhaustive, and its docstrings cite the subsections of this file as §k.n. Names in the target descriptions specify the library to develop; the statements included in `Suggested.lean` are identified explicitly in their subsections. Checks are mathematical tests of the specified definitions and theorems. The proposed home is `TauCeti/Analysis/SpecialFunctions/Polylogarithm/`, with the declarations in the namespace `TauCeti.Polylog`. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source and the earlier statements or library declarations it rests on.

## Scope and ownership

The roadmap owns:

- the principal polylogarithm `Liₙ` for every `n ∈ ℤ`, its logarithmic radial integral, disc series, rationality in nonpositive weight, holomorphy and derivative recursion on `ℂ∖[1,∞)`, conjugation, closed-disc continuity and the zeta and exponential-zeta boundary values (Layer 1);
- the coherent continuation of the tower `(Log, Li₁, …, Li_N)` along paths in `ℂ∖{0,1}`, the function it defines on the universal cover, its determinations on subsets, its monodromy under the two peripheral loops and arbitrary loop words, and the jump of the principal branch across `[1,∞)` (Layer 2);
- distribution, Bernoulli inversion, Euler reflection and Abel's five-term identity with explicit principal domains, their continuation along common argument paths, and the exact values of `Li₂` at 1, −1 and `1/2` (Layer 3);
- the Bernoulli coefficients `cₖ = 2^kBₖ/k!`, Zagier's real single-valued functions `Lₙ` for every `n ≥ 2` with their branch independence, real analyticity, real differential, inversion, conjugation, distribution, continuity on the Riemann sphere and the weight-three diagnostics (Layer 4);
- the Bloch–Wigner function `D` with its sixfold symmetry, one-form, Laplacian, positivity, the affine, Abel and projective five-term relations and the cross-ratio dictionary (Layer 5);
- the interval Rogers dilogarithm with its regularity, derivative, monotonicity, reflection, pentagon and special values (Layer 6);
- truncation, Fourier, sectorial, endpoint, derivative and global bounds for all of these functions (Layer 7).

It does not construct any algebraic object attached to these functions: no pre-Bloch or Bloch group, no symbol complex, no algebraic K-theory, no regulator map or its normalisation against Borel's regulator, no hyperbolic volume, no arithmetic certificate format, no configuration complex, no multiple polylogarithm or multiple zeta value, no p-adic polylogarithm or formal polylogarithm series over a general ring, and no quantum dilogarithm. Those subjects consume the analytic statements here; the roadmaps that do so are listed under Downstream consumers, and none of them is an input to this roadmap. A complex embedding of a number field enters only as a complex argument, with no condition on the field.

The general Lerch transcendent is a downstream construction of **AnalyticNumberTheoryPartII** §4.1. Its comparison with `Liₙ` and the continuation of that comparison from matching initial germs belong there; the principal integer-weight family and its analytic API belong here.

It leaves to named roadmaps and libraries:

- the thrice-punctured sphere `U = ℂ∖{0,1}` as a space, its basepoint `1/2`, the two counterclockwise peripheral loops `γ₀(t) = e^{2πit}/2` and `γ₁(t) = 1 − e^{2πit}/2`, their classes `periph0` and `periph1`, the semilocal simple connectivity of `U` and the computation `π₁(U, 1/2) ≅ FreeGroup (Fin 2)` whose inverse sends the free generators to `periph0` and `periph1`, to Tau Ceti **BelyiMaps**, Layer 5 (§§5.1, 5.2, 5.6); this roadmap uses those loops and that computation and does not prove generation of `π₁` again;
- analytic continuation along a path, its uniqueness, concatenation, the monodromy theorem and the global branch on a simply connected domain, to Tau Ceti **ConformalMapping**, layer L4, which the Tau Ceti library implements (`TauCeti.IsAnalyticContinuationAlong`, `TauCeti.monodromy_theorem`, `TauCeti.ContinuesInside.exists_analyticOnNhd`); the polylogarithm tower is one germ to which that theory is applied;
- the universal cover, its covering projection and the action of the fundamental group, to the Tau Ceti library (`TauCeti.UniversalCover`, from the completed UniversalCovers roadmap);
- the weak and strong minimum principles for superharmonic functions, to the Tau Ceti library (`TauCeti.ge_of_laplacian_nonpos_ge_frontier`, `TauCeti.eqOn_const_of_laplacian_nonpos_of_isMinOn`); only their application to `D` is new here;
- affine cross-ratio invariance for maps with factorized difference quotients, to Tau Ceti `TauCeti.crossRatio_comp_eq_of_sub_eq_div` in `TauCeti/Algebra/Field/LinearFractional.lean`. For a field, `φ(s) − φ(t) = κ(s − t)/(d(s)d(t)), κ ≠ 0` and `d` nonzero on a set `S` imply invariance of `(p − r)(q − s)/((p − s)(q − r))` for `p, q, r, s ∈ S`, with exactly the normalization used here. A Möbius map supplies this factorization wherever its denominator is nonzero. Section 5.8 consumes that theorem and owns the field-general sphere extension, projective normalization and the D-valued projective identities; it does not redevelop affine invariance.

Already in the pinned libraries, and therefore cited rather than stated here:

- The weight-one Taylor series `∑_{k≥1} z^k/k = −Log(1−z)` on the open unit disc: Mathlib `Complex.hasSum_taylorSeries_neg_log'` (and its zero-indexed form `Complex.hasSum_taylorSeries_neg_log`); the derivative of the principal logarithm on the slit plane, `Complex.hasDerivAt_log`.
- Euler's value `ζ(2) = π²/6`: Mathlib `riemannZeta_two`; the identification of exponential zeta at circle parameter zero with `ζ`, `HurwitzZeta.expZeta_zero`; the convergent series `∑ e^{2πian}/n^s = expZeta(a,s)` for `Re s > 1`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`.
- The paired Fourier series of the Bernoulli polynomials, `∑_{n≥1} n^{−k}(e^{2πinx} + (−1)^k e^{−2πinx}) = −(2πi)^k B_k(x)/k!` for `k ≥ 2` and `x ∈ [0,1]`: Mathlib `hasSum_one_div_nat_pow_mul_fourier`; the Bernoulli polynomial reflection `B_n(1−x) = (−1)^n B_n(x)`, `Polynomial.bernoulli_eval_one_sub`; the derivative of `B_n`, `Polynomial.derivative_bernoulli`; the generating identity of the Bernoulli numbers, `bernoulliPowerSeries_mul_exp_sub_one`.
- Isolated logarithmic integrability: Mathlib `MeromorphicOn.intervalIntegrable_log_norm`.
- The identity principle `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, path connectedness of the complement of a countable set in `ℂ` (`Set.Countable.isPathConnected_compl_of_one_lt_rank`), and constancy of a function with zero derivative on a connected open set (`IsOpen.exists_is_const_of_fderiv_eq_zero`).
- Primitives on discs, `DifferentiableOn.isExactOn_ball`; Abel's limit theorem, `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzCone`; the Laplacian `Laplacian.laplacian` of a function on a finite-dimensional real inner product space.

The integer-weight API follows [Mathlib's complex-order polylogarithm proposal](https://github.com/leanprover-community/mathlib4/pull/44531): `Complex.polylog (s z : ℂ)`, the lower boundary value on `[1,∞)`, and its disc-series, differential-recursion, analyticity and zero-argument API. `Liₙ` here agrees with that complex-order function at `s = n` off `z = 1`, and also at `z = 1` for `n ≥ 2`. Adopt Mathlib's definition and API when available, retaining the integer-weight analytic theory and all higher layers. [LeanPolyLog](https://reservoir.lean-lang.org/@rainrzk/LeanPolyLog) treats related integral identities; any reuse of its code requires its authors' agreement and a compatible licence.

## Conventions

**Domains.** `Ω = ℂ∖[1,∞) = {z : 1 − z ∈ Complex.slitPlane}` is the principal domain; `U = ℂ∖{0,1}` is the thrice-punctured sphere of BelyiMaps Layer 5, with basepoint `b = 1/2`; the Riemann sphere is Mathlib's `OnePoint ℂ`. For an integer `m ≥ 1`, `Ω_m = {z : ζz ∈ Ω for every ζ with ζ^m = 1}`, the plane minus the `m` rays `{rζ⁻¹ : r ≥ 1}`.

**Logarithm and boundary values.** `Log` and `Arg` are Mathlib's principal `Complex.log` and `Complex.arg`, with `Arg ∈ (−π, π]`. Consequently the total value of every principal `Liₙ` at a real point `x > 1` is its limit from the **lower** half-plane. The two-term witness: `Li₁(3) = −Log(−2) = −log 2 − πi`, while the limit from above is `−log 2 + πi`, so the upper-minus-lower jump of `Li₁` at 3 is `+2πi`, and a counterclockwise loop about 1 changes `Li₁` by `−2πi` (§2.3, §2.4). Real logarithms of norms are `Real.log ‖z‖`, written `ℓ = log|z|`; the derivative of `ℓ` in the direction `v` is `Re(v/z)` for `z ≠ 0`.

**Totalised values.** The functions are total in Lean. A value assigned at a pole (`Liₙ(1)` for `n ≤ 1`) carries no analytic statement, and every theorem below states the hypotheses under which its two sides are honest. Divisions follow Lean's convention `a/0 = 0` and `0⁻¹ = 0`; where that convention makes an identity true at a degenerate point, the statement says so, and where it makes it false, the hypothesis that excludes the point is stated.

**Bernoulli numbers.** `Bₖ` is Mathlib's `bernoulli k`, with `B₁ = −1/2` (`bernoulli_one`); `Bₖ(x)` is Mathlib's `Polynomial.bernoulli k`, with `B₁(x) = x − 1/2`. The coefficients of the single-valued functions are `cₖ = 2^kBₖ/k!`, so `c₀ = 1, c₁ = −1, c₂ = 1/3` and `cₖ = 0` for odd `k ≥ 3`. Using `B₁ = +1/2` instead would give `c₁ = +1` and destroy the cancellation of §4.3; this is why `c₁ = −1` is pinned by a check.

**Parity projection.** `πₙ : ℂ → ℝ` is the real part for odd `n` and the imaginary part for even `n`. `Lₙ` is real-valued in this scalar normalisation. For `n ≥ 2`, Zagier's `Pₙ` equals `Lₙ` in every weight ([Z90] §7, (33), p. 413 and `P₂ = D` on p. 414); Oesterlé's `Pₙ` equals `Lₙ` for odd `n` and `i·Lₙ` for even `n` ([O93] §3.1, (18)–(19), p. 57). Thus at `z = i`, Zagier's `P₂(i) = D(i) > 0` is real, while Oesterlé's `P₂(i) = iD(i)` is imaginary. These are two different codomain conventions. A map into a Tate twist `(2πi)^{n−1}ℝ` is a separate period convention owned by an arithmetic consumer. For `n ≥ 2`, `ζ(n)` is Mathlib's `riemannZeta n`, real for real `n > 1`; no value `ζ(1)` is used.

**Integer weights.** Weights are integers. Integer powers of a positive integer `m`, such as `m^{n−1}` in distribution, are zpow powers in `ℂ` or `ℝ`; for `n ≤ 0` the factor is a negative power, `1/m` in weight zero, and is never truncated to a natural exponent.

**Coherent branches.** An expression that contains several weights on a branch uses all of them continued along the same path from `b = 1/2`, as one vector-valued germ (§2.1). Inversion, reflection or a five-term formula uses the corresponding argument paths and the logarithms continued along them together. Independent choices of branch for different weights are corrected by the explicit monodromy of §2.3.

**Paths, loops and the universal cover.** A point of the universal cover `TauCeti.UniversalCover b` is a pair `⟨z, [γ]⟩` of an endpoint `z ∈ U` and a homotopy class of paths from `b` to `z`. Tau Ceti's fundamental-group action prepends the **inverse** loop: `g • ⟨z, [γ]⟩ = ⟨z, [g⁻¹ followed by γ]⟩` (`TauCeti.UniversalCover.smul_mk`). Mathlib's product in `FundamentalGroup` reads right to left: `γ * γ′` is the class of `γ′` followed by `γ`. Oesterlé's prefixing operator, which runs the loop `γⱼ` first, is therefore `Tⱼ(p) = (periphⱼ)⁻¹ • p`. The witness: `T₁` applied to the base point `⟨b, [const]⟩` gives the branch with `Li₁ = log 2 − 2πi` and `Log = −log 2`.

**Cross-ratios.** Comparisons between projective cross-ratio conventions concern four pairwise distinct points; totalised finite-coordinate degeneracies are treated separately in §5.8. On finite coordinates, `r(a,b,c,d) = (a−c)(b−d)/((a−d)(b−c))` on finite points, extended by its cancellation limits when one point is `∞`; it satisfies `r(∞,0,1,z) = z`. This is Oesterlé's birapport ([O93] §4.1, p. 60) and Zagier's argument of `D̃` ([Z07] Part I §3, (5), p. 11). Goncharov–Rudenko's bracket `[a,b,c,d] = (a−b)(c−d)/((a−d)(c−b))`, normalised by `[∞,1,0,x] = x` ([GR] §1.1, (3), p. 4), equals `1 − r(a,b,c,d)`. A cross-ratio normalised by `cr(0,∞,1,z) = z` equals `1/r(a,b,c,d)` on the same ordered tuple. Each change of coordinate changes `D` by one of its sixfold signs (§5.3); none of these functions is identified with another.

## Exact supplier contracts

The library vocabulary is that of Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; `Suggested.lean` imports `Mathlib` and the specific Tau Ceti modules used in its statements. The contracts below also supply the README targets. A prerequisite on a Tau Ceti roadmap layer refers to that layer's stated development.

### From Mathlib

| Use here | Exact declarations |
|---|---|
| logarithm, argument, slit plane | `Complex.log`, `Complex.arg`, `Complex.slitPlane`, `Complex.arg_neg_one`, `Complex.hasDerivAt_log` `(z ∈ slitPlane)`, `Complex.hasStrictDerivAt_log`, `Complex.hasSum_taylorSeries_neg_log'`, `Complex.exp`, `Complex.ofReal_log` |
| integration | `intervalIntegral` with `IntervalIntegrable`, `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`, `MeromorphicOn.intervalIntegrable_log_norm`, Fubini for the Bochner integral, dominated differentiation under the integral sign |
| analyticity and calculus | `AnalyticOnNhd`, `AnalyticAt`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `HasDerivAt`, `HasFDerivAt`, `fderiv`, `DifferentiableAt`, `ContDiffAt`, `DifferentiableOn.isExactOn_ball`, `IsOpen.exists_is_const_of_fderiv_eq_zero`, `Laplacian.laplacian` (`Mathlib.Analysis.InnerProductSpace.Laplacian`) |
| series, zeta and Bernoulli | `HasSum`, `Summable`, `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzCone`, `riemannZeta`, `riemannZeta_two`, `zeta_nat_eq_tsum_of_gt_one`, `HurwitzZeta.expZeta`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `HurwitzZeta.expZeta_zero`, `bernoulli`, `bernoulli_one`, `bernoulli_two`, `bernoulliPowerSeries_mul_exp_sub_one`, `Polynomial.bernoulli`, `Polynomial.derivative_bernoulli`, `Polynomial.bernoulli_eval_one_sub`, `hasSum_one_div_nat_pow_mul_fourier`, `PowerSeries.rescale` |
| topology | `Path`, `Path.Homotopic.Quotient`, `FundamentalGroup`, `unitInterval`, `OnePoint` with `OnePoint.elim` and `OnePoint.infty`, `Set.Countable.isPathConnected_compl_of_one_lt_rank`, `IsCoveringMap.liftPath`, `Metric.closedBall` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| analytic continuation (`Analysis/Complex/Conformal/Continuation/{Basic,Trans,Etale}.lean`) | `TauCeti.IsAnalyticContinuationAlong f γ s` for families `f : X → ℂ → E` into a complex Banach space, with `.const`, `.of_differentiableOn`, `.eventuallyEq` (uniqueness from the initial germ), `.reparam`, `.trans` and `TauCeti.transFamily` (concatenation), `TauCeti.ContinuesAlong`, `TauCeti.ContinuesInside f₀ U z₀` with `ContinuesInside.of_differentiableOn` and `continuesInside_congr`, `TauCeti.isAnalyticContinuationAlong_iff_continuousOn_germPoint` (continuations are lifts to the étalé space of germs of `TauCeti.holomorphicSheaf`) |
| monodromy and global branches (`Conformal/Monodromy.lean`, `Conformal/GlobalBranch.lean`) | `TauCeti.monodromy_theorem` (homotopy rel endpoints), `TauCeti.monodromy_theorem_of_free_homotopy`, `TauCeti.monodromy_theorem_of_free_homotopy_loop`, `TauCeti.ContinuesInside.eventuallyEq_at_one` (path independence on a simply connected set), `TauCeti.ContinuesInside.exists_analyticOnNhd`, `TauCeti.continuesInside_iff_exists_analyticOnNhd` |
| universal cover (`AlgebraicTopology/UniversalCover/{Basic,Covering,Action}.lean`) | `TauCeti.UniversalCover x₀` with fields `proj`, `path`, `TauCeti.UniversalCover.isCoveringMap` (for a path-connected, locally path-connected, semilocally simply connected space), the `MulAction (FundamentalGroup X x₀)` instance with `smul_mk`, `proj_smul`, `basepointLift`, `TauCeti.SemilocallySimplyConnectedSpace` |
| logarithms of nonvanishing maps (`Analysis/Complex/ContinuousLog/{Basic,Path}.lean`, `Analysis/Complex/BranchLogRoot.lean`) | `TauCeti.HasContinuousLogOn` with `hasContinuousLogOn_of_mapsTo_slitPlane`, `HasContinuousLogOn.mul`, `.div`; `TauCeti.exists_differentiableOn_eqOn_exp_comp` (holomorphic logarithm on a simply connected open set) |
| minimum principles (`Analysis/InnerProductSpace/Laplacian/{WeakMaximumPrinciple,StrongMaximumPrinciple}.lean`) | `TauCeti.ge_of_laplacian_nonpos_ge_frontier` (compact `K`, continuity on `K, C²` and `Δf ≤ 0` on the interior, a lower bound on the frontier), `TauCeti.eqOn_const_of_laplacian_nonpos_of_isMinOn` (open preconnected `U, C², Δu ≤ 0`, an interior minimum) |
| affine cross-ratio invariance (`Algebra/Field/LinearFractional.lean`) | `TauCeti.crossRatio_comp_eq_of_sub_eq_div`: over any field, for `φ, d : 𝕜 → 𝕜`, `κ ≠ 0`, a set `S` with `d t ≠ 0` for every `t ∈ S`, and `φ s − φ t = κ * (s − t) / (d s * d t)` for `s,t ∈ S`, the cross-ratio `(p − r) * (q − s) / ((p − s) * (q − r))` is preserved for `p,q,r,s ∈ S`, including coincidences under field totalisation. |

### From TauCetiRoadmap.BelyiMaps, Layer 5

The subtype `U = {z : ℂ // z ≠ 0 ∧ z ≠ 1}` with basepoint `b = 1/2` and its instances, including `TauCeti.SemilocallySimplyConnectedSpace U` (§5.1); the six anharmonic self-homeomorphisms of `U`, of which `z ↦ 1 − z` fixes `b` (§5.1); the loops `γ₀(t) = e^{2πit}/2` and `γ₁(t) = 1 − e^{2πit}/2`, both counterclockwise, meeting only at `b`, with classes `periph0`, `periph1` in `FundamentalGroup U b` and the pointwise identities that `z ↦ 1 − z` exchanges them (§5.2); the isomorphism `FundamentalGroup U b ≃* FreeGroup (Fin 2)` sending `periph0 ↦ of 0` and `periph1 ↦ of 1` (its inverse sends the free generators to the peripheral classes), and the universal property that a homomorphism out of `π₁(U, b)` is determined by, and can be prescribed on, these two classes (§5.6). Layer 2 here uses these as given; the counterclockwise orientation of both loops is the one fixed there.

### From TauCetiRoadmap.ConformalMapping, layer L4

The monodromy theorem for analytic continuation along homotopic paths and its consequences on simply connected domains, implemented in Tau Ceti as listed above. This roadmap continues one specific germ, the vector-valued tower of §2.1, and does not restate the general theory.

## How to read the build

The layers are built in the order `1 → 2 → 3 → 4 → 5 → 6 → 7`, and each `### k.n` subsection lists its statements in dependency order; *Needs:* at the end of a subsection names the earlier statements and the library declarations it rests on. Layer 1 delivers the principal functions `Liₙ` for `n ∈ ℤ` with their analytic theory on `Ω` and on the closed disc. Layer 2 delivers the tower as one germ, its continuation along every path in `U`, the branch function on the universal cover, the monodromy of the two peripheral loops and of every word in them, and the jump across the cut. Layer 3 delivers the classical functional equations on their principal domains and along common paths, and the exact dilogarithm values. Layer 4 delivers Zagier's `Lₙ` and its analytic theory in every weight `n ≥ 2`. Layer 5 delivers the Bloch–Wigner function with its differential, Laplacian, positivity and five-term relations, all proved without any algebraic group. Layer 6 delivers the interval Rogers dilogarithm. Layer 7 delivers the estimates. Each definition gives its API as named lemmas and its checks as a `**Checks.**` list; every layer ends with its examples and its dependencies.

## Layer 1: principal polylogarithms

This layer constructs `Liₙ` for every integer `n`, from the principal logarithm and the Bochner integral alone, and proves its analytic theory on the principal domain `Ω` and on the closed unit disc. Nothing in it uses a branch other than the principal one.

Standing assumptions for this layer: `n` ranges over `ℤ` and `k` over `ℕ` unless a statement says otherwise; `z ∈ ℂ` is arbitrary unless a hypothesis restricts it; `t` is a real parameter in `[0,1]`. The integral of a statement is Mathlib's interval integral over `[0,1]` of a complex-valued function of the real variable `t`.

### 1.1 The integer-weight family

References: [O93] §1.1, (1)–(3), p. 50 (disc series, principal determination on `ℂ∖[1,∞)`, the recursion `Li₁ = −Log(1−z), Li′ₖ = Liₖ₋₁/z`); [Z07] Part I, introduction, p. 5 (the series and the cut-plane continuation, with `Li₂(z) = −∫₀^z log(1−u) du/u`); [G95] §1.0, (1.1), p. 201 (the same recursion as a differential equation). Built on Mathlib `Complex.log` and `intervalIntegral`.

**The principal polylogarithm.** Define `polylog : ℤ → ℂ → ℂ`, written `Liₙ(z)`, by cases on the weight:

```text
Li₀(z)      = z / (1 − z)
Li₁(z)      = −Log(1 − z)
Li_{k+2}(z) = (1/k!) ∫₀¹ (−log t)^k · (−Log(1 − t z)) dt / t          (k ≥ 0)
Li_{−r}(z)  = (z d/dz)^r applied to z/(1 − z), evaluated at z          (r ≥ 1)
```

The integral formula is the iterated radial integral `Liₙ₊₁(z) = ∫₀¹ Liₙ(tz) dt/t` of [O93] (3) collapsed by Fubini; at a real point `x > 1` its integrand takes Mathlib's value `Log(1 − tx) = log|1 − tx| + πi` for `t > 1/x`, which selects the lower boundary value. The nonpositive weights are Euler derivatives of an honest rational function, computed with Mathlib's `deriv`; at `z ≠ 1` they only see values near `z`, so no value at the pole enters. No function chosen to satisfy the identities of later layers replaces these formulas.

The basic theory to develop comprises vanishing at zero (`Liₙ(0) = 0` for every `n ∈ ℤ`, a simp lemma), the weight-one formula (`Li₁(z) = −Log(1−z)` for every `z`, by definition, including the totalised value at `z = 1`), the weight-zero formula (`Li₀(z) = z/(1−z)`), the negative-weight recursion (for `r ≥ 0` and `z ≠ 1, Li₋₍ᵣ₊₁₎(z) = z·(d/dz)Li₋ᵣ(z)`), the defining radial-integral identity (the defining integral for `n ≥ 2`, as a rewrite lemma), the recursive radial-integral identity (§1.5) and congruence under equal weights and arguments (equal weights and equal arguments give equal values, for rewriting along casts `ℕ → ℤ`). The natural-number weights are the coercions `ℕ → ℤ`, so `polylog (n : ℕ)` needs no separate realisation.

**Checks.**
- Every weight vanishes at zero: `Liₙ(0) = 0` for `n = −3, …, 3` (a definition that started the series at `k = 0` would give 1).
- `Li₀(1/2) = 1`; the weight-zero function is `z/(1−z)`, not `1/(1−z)`.
- `Li₋₁(z) = z/(1−z)²` for `z ≠ 1`; a definition that applied `d/dz` without the factor `z` would give `1/(1−z)²`.
- For `|z| < 1`, `Li₁` agrees with Mathlib's Taylor series `Complex.hasSum_taylorSeries_neg_log'`, term by term; this is a compatibility with the library, not a second development of the logarithm series.
- At `x = 3`, the weight-one formula gives the total value `Li₁(3) = −log 2 − πi`, the lower boundary value (§2.4); an alternative definition by holomorphic continuation across the cut would not be total and would not agree with Mathlib's argument convention.
- `Li₀` is not continuous at its pole 1 although `polylog 0 1` has the totalised value 0 (`not_continuousAt_one_polylog_neg`, §1.4); field totalisation does not make a pole analytic.

*Needs:* Mathlib `Complex.log`, `intervalIntegral`, `deriv`.

### 1.2 Integrability of the radial integrand

References: [O93] §1.1, (3), p. 50, and §1.4, p. 51 (the recursive integral and the finite limit at 1 for `k ≥ 2`); the integrability argument is this roadmap's. Built on Mathlib `MeromorphicOn.intervalIntegrable_log_norm` and `Complex.hasSum_taylorSeries_neg_log'`.

Prove `intervalIntegrable_polylog_integrand`: for every `k ∈ ℕ` and **every** `z ∈ ℂ` the function `t ↦ (−log t)^k·(−Log(1 − tz))/t` is interval integrable on `[0,1]`. Near `t = 0`, `−Log(1 − tz) = O(t)` uniformly for bounded `z`, so the integrand is dominated by `C·|log t|^k`, whose integral over `[0,1]` is `k!·C`. Near an interior point `t = 1/z` (real `z > 1`) and near `t = 1` (`z = 1`), write `−Log(1 − tz) = −log|1 − tz| − i Arg(1 − tz)`: the argument is bounded by `π`, and `−log|1 − tz| = −log|z| − log|t − 1/z|` is integrable by the meromorphic logarithmic integrability theorem applied to `t ↦ t − 1/z`; the factor `(−log t)^k/t` is bounded near `t = 1/z > 0`. Prove invariance of the integral under changes on null sets: changing the integrand at the single point `t = 1/z` or `t = 1` does not change the integral. Prove also `uniformIntegrable_polylog_integrand`: for bounded `z`, the integrands form a uniformly integrable family on `[0,1]`. On a compact `K ⊂ Ω` there is a single integrable majorant, since away from `t = 0` the factors `1 − tz` stay uniformly away from zero. On a general bounded parameter set, separate a fixed neighbourhood of `t = 0`, where `C|log t|^k` is a common majorant, from the possible moving logarithmic singularities, which stay away from 0. The latter have uniformly small `L¹` mass on sets of small measure: the worst negative logarithm is controlled by a translate of `|log|t − s||`, and its integral over an interval of length `δ` is `O(δ(1 + |log δ|))`, uniformly in the centre `s`. This is uniform integrability, not a common pointwise majorant as `s` varies. Together with almost-everywhere convergence it gives continuity of the integral at `z = 1` and relative continuity on the closed lower half-plane (§§1.7, 2.4); it does not give continuity across the cut at `x > 1`, where the pointwise logarithm has different one-sided limits.

**Checks.**
- For `k = 0` and `z = 1` the integrand is `−Log(1−t)/t`, unbounded at `t = 1` but integrable, with integral `ζ(2)` (§1.7).
- For `k = 0` and `z = 3` the integrand has an interior logarithmic singularity at `t = 1/3`; it is integrable, and the imaginary part of the integral is `−π log 3`, the lower boundary value of `Im Li₂` at 3.
- For `k = 1` and `z = 0` the integrand vanishes identically (degenerate case).

*Needs:* §1.1; Mathlib `MeromorphicOn.intervalIntegrable_log_norm`, the integrability of `|log t|^k` on `(0,1]`.

### 1.3 The disc series

References: [O93] §1.1, (1), p. 50; [Z07] Part I, introduction, p. 5. Built on Mathlib `Complex.hasSum_taylorSeries_neg_log'` and `HasSum`.

Prove the disc-series identification: for every `n ∈ ℤ` and `|z| < 1`,

```text
HasSum (k ↦ z^(k+1) / (k+1)^n) (Liₙ(z)),
```

with the integer power `(k+1)^n` of the positive integer `k+1` taken in `ℂ`. The convergence is absolute and locally uniform on the open disc. For `n ≥ 2`, expand `−Log(1 − tz)` by Mathlib's Taylor series and integrate term by term against `(−log t)^{n−2}/t` using the radial majorant of §1.2 and `∫₀¹ t^{j−1}(−log t)^{n−2} dt = (n−2)!/j^{n−1}` (integration by parts, or Mathlib's Gamma integral after `t = e^{−u}`). For `n = 1` it is Mathlib's theorem. For `n ≤ 0`, differentiate the geometric series `z/(1−z) = ∑ z^{k+1}` termwise `r` times; the polynomial growth of `(k+1)^{−n}` is dominated by any geometric ratio strictly between `|z|` and 1. Read off the constant and linear coefficients: prove vanishing at zero and `hasDerivAt_polylog_zero` (`Liₙ` has complex derivative 1 at 0 for every `n ∈ ℤ`).

**Checks.**
- `Li₀(1/2) = ∑ 2^{−(k+1)} = 1` and `Li₋₁(1/2) = ∑ (k+1) 2^{−(k+1)} = 2`, agreeing with the rational formulas of §1.4.
- At `n = 1` the series is exactly Mathlib's `Complex.hasSum_taylorSeries_neg_log'`; at `n = 2` and `z = 1/2` the first partial sum `1/2` is within `1/8` of `Li₂(1/2)` (§7.1).
- The derivative at 0 is 1 for `n = −2` as well as for `n = 5`; the quotient form `Liₙ′ = Liₙ₋₁/z` is not used at 0.

*Needs:* §§1.1–1.2; Mathlib `Complex.hasSum_taylorSeries_neg_log'`, termwise differentiation of power series, dominated convergence.

### 1.4 Nonpositive weights are rational

References: [O93] §1.1, (2)–(3), p. 50 (the recursion, read for `k ≤ 1` as Euler differentiation of the disc series); the rational form is its elementary consequence.

Prove `exists_polylog_neg_eq_div`: for every `r ∈ ℕ` there is a polynomial `A_r ∈ ℤ[X]` with `A_r(1) ≠ 0` such that

```text
Li_{−r}(z) = z · A_r(z) / (1 − z)^(r+1)        for every z ≠ 1,
```

with `A₀ = 1, A₁ = 1, A₂ = 1 + X` (so `Li₋₂(z) = z(1+z)/(1−z)³`), and `A_r(1) = r!`. Induct on `r`, differentiating the rational expression away from its pole; the recursion is `A_{r+1} = (1 + rX)A_r + X(1 − X)A_r′`. Prove `not_continuousAt_one_polylog_neg`: for every `r`, `Li₋ᵣ` is not continuous at 1 (its modulus tends to `∞` like `r!/|1−z|^{r+1}`); in particular the totalised value at 1 is never an analytic value. Prove `analyticOnNhd_polylog_nonpos`: `Li₋ᵣ` is analytic on `ℂ∖{1}`, not merely on `Ω`, so all continuation of nonpositive weights is trivial (§2.1).

**Checks.**
- `Li₀(z) = z/(1−z) (A₀ = 1)` and `Li₋₁(z) = z/(1−z)² (A₁ = 1)`: the first Euler derivative has numerator `z`, not 1.
- `A₂(1) = 2 = 2!`: the pole of `Li₋₂` at 1 has order exactly 3.
- `Li₋₁(−1) = −1/4`, the value of the series `∑(−1)^{k+1}(k+1)` in the Abel sense; a sign error in the Euler operator gives `+1/4`.

*Needs:* §§1.1, 1.3; Mathlib `Polynomial`, `HasDerivAt.div`.

### 1.5 Holomorphy and the derivative recursion

References: [O93] §1.1, (2)–(3), p. 50 (the recursion characterises the principal continuation); [G95] §1.0, (1.1), p. 201. Built on Mathlib `Complex.hasDerivAt_log`, differentiation under the integral sign, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

Prove `analyticOnNhd_polylog`: for every `n ∈ ℤ`, `Liₙ` is complex analytic on `Ω`. Prove the Euler differential recursion: for every `n ∈ ℤ` and `z ∈ Ω`,

```text
z · (d/dz) Li_{n+1}(z) = Liₙ(z),
```

including `z = 0`, where both sides are 0; for `z ≠ 0` this is `Li′ₙ₊₁ = Liₙ/z`, and the quotient form is never asserted at 0. Prove the recursive radial-integral identity: for `n ≥ 1` and `z ∈ Ω`, `Liₙ₊₁(z) = ∫₀¹ Liₙ(tz) dt/t`. For `n ≥ 2` differentiate the parameter integral on compact subsets of `Ω` with the majorants of §1.2 and integrate by parts in `t`; the case `n + 1 = 2` differentiates `−Log(1 − tz)/t` in `z` directly. The weight-one case is Mathlib's logarithm derivative, and `n ≤ 0` is the definition. Analyticity follows from complex differentiability on the open set `Ω`; the identity principle on the connected set `Ω` glues the parameter-integral derivative with the disc germ of §1.3.

The principal analytic continuation is stated as `analyticOnNhd_polylog` in `Suggested.lean`.

**Checks.**
- At weight three, `z·Li₃′(z) = Li₂(z)` on `Ω`; at `z = −1` this reads `−Li₃′(−1) = Li₂(−1) = −π²/12`.
- The derivative of `Li₁` at `z ∈ Ω` is `1/(1−z) = Li₀(z)/z` for `z ≠ 0`, and 1 at `z = 0`.
- Analyticity is asserted on `Ω` only: `not_continuousAt_polylog_one_three` states that `Li₁` is not continuous at 3 (already from the principal logarithm; §2.4 gives the jump), and `Li₀` is not analytic at 1 (§1.4).

*Needs:* §§1.1–1.4; Mathlib `Complex.hasDerivAt_log`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

### 1.6 Conjugation

References: [O93] §§1.1–1.3, pp. 50–51 (real coefficients and the conjugation-invariant domain `Ω`). Built on Mathlib `starRingEnd ℂ`.

Prove conjugation compatibility: for every `n ∈ ℤ` and `z ∈ Ω, Liₙ(z̄) = conj(Liₙ(z))`. Conjugate the disc series, whose coefficients are real; `Ω` is invariant under conjugation and connected, so the identity principle applied to `z ↦ conj(Liₙ(z̄))` extends the identity. At a real point `x > 1` and positive weight `n ≥ 1` the identity is **false** for the total function: `Liₙ(x)` is the lower value, its conjugate is the upper value, and these differ by the jump of §2.4. Nonpositive weights are rational with real coefficients, so their conjugation identity extends to all of `ℂ` (including the totalised value at 1); this exception is not a cut jump.

**Checks.**
- `Li₂(−1)` is real (`−1 ∈ Ω` and is its own conjugate).
- `Li₁(3) = −log 2 − πi` while `conj(Li₁(3)) = −log 2 + πi`: the identity is not stated on the cut.
- For `n = 0` the identity is the rational identity `z̄/(1−z̄) = conj(z/(1−z))`, valid for all `z ≠ 1`.

*Needs:* §§1.3, 1.5.

### 1.7 The closed disc, zeta values and the circle

References: [O93] §1.4, p. 51 (finite limit at 1 equal to `ζ(k)` for `k ≥ 2`); [Z07] Part I §1, p. 6 (`Li₂(1) = π²/6` among the special values). Built on Mathlib `riemannZeta_two`, `zeta_nat_eq_tsum_of_gt_one`, `HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `HurwitzZeta.expZeta_zero`, `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzCone`.

For every natural `n ≥ 2`, prove `hasSum_polylog_of_norm_le_one` (the disc series converges absolutely and uniformly on `|z| ≤ 1` to `Liₙ(z)`), `continuousOn_polylog_closedBall` (`Liₙ` is continuous on the closed unit disc), `continuousAt_polylog_one` (`Liₙ` is continuous at 1 for unrestricted complex approach), the zeta endpoint identity (`Liₙ(1) = ζ(n)`, Mathlib's zeta value) and the exponential-zeta comparison (for every real `a, Liₙ(e^{2πia}) =` `HurwitzZeta.expZeta a n`). After `continuousOn_polylog_closedBall`, prove closed-disc conjugation compatibility: for `n ≥ 2` and `‖z‖ ≤ 1`, `Liₙ(z̄) = conj(Liₙ(z))`, extending §1.6 by continuity from the open disc. The uniform convergence comes from `∑ k^{−n} < ∞`; the boundary values of the integral of §1.1 agree with the series by Abel's limit theorem along radii, together with continuity of the integral on the closed disc (dominated convergence with the majorants of §1.2). For the unrestricted limit at 1, use the uniform integrability of §1.2 and almost-everywhere convergence of the integrand as `z → 1`; for `t < 1` the limiting argument `1 − t` is positive, so there is no logarithmic branch discontinuity. This supplies the full complex limit used in Layers 2 and 4, beyond closed-disc continuity. The exponential-zeta comparison is a term-by-term identification with Mathlib's series, whose `k = 0` term `1/0^n` vanishes for `n ≥ 1`, so no competing circle function is introduced. For `n = 1` there is no such statement: `|Li₁(z)| → ∞` as `z → 1` inside the disc, whatever the totalised value `polylog 1 1 = 0`.

**Checks.**
- `Li₂(1) = π²/6`, through `riemannZeta_two`; Euler's evaluation is not proved again.
- At `a = 0` the circle identity is `Liₙ(1) = expZeta 0 n = ζ(n)`, consistent with `HurwitzZeta.expZeta_zero`.
- `Li₂(−1) = expZeta (1/2) 2 = −π²/12` (§3.6); `Li₂(i)` has real part `−π²/48` and imaginary part Catalan's constant `∑(−1)^k/(2k+1)²`.
- `polylog 1 1 = 0` is a totalised value, and `continuousOn_polylog_closedBall` is not stated for `n = 1`.

*Needs:* §§1.1–1.3, 1.5–1.6; the Mathlib declarations above; `continuousOn_polylog_closedBall` precedes closed-disc conjugation compatibility.

### Examples

The weight-zero value `Li₀(1/2) = 1` and the Euler derivative `Li₋₁(z) = z/(1−z)²` test the weight-zero normalization and the Euler operator. The lower boundary convention is visible already in weight one: `Li₁(3) = −log 2 − πi`. The endpoint values `Li₂(1) = π²/6` and `Li₃(1) = ζ(3)`, and the circle values through `HurwitzZeta.expZeta`, connect the family with Mathlib's zeta functions.

### Dependencies

Mathlib only: the principal logarithm, the interval integral, power series and their termwise calculus, the identity principle, Abel's limit theorem, Riemann and exponential zeta values.

## Layer 2: branches and monodromy

This layer continues the whole tower `(Log, Li₁, …, Li_N)` as one germ along paths in `U = ℂ∖{0,1}`, defines the function it induces on the universal cover, and computes the action of the fundamental group. The general theory of analytic continuation, the monodromy theorem and the universal cover are Tau Ceti's; the peripheral loops and the free fundamental group are BelyiMaps Layer 5. What is new here is the specific germ, the existence of its continuation along every path, and its monodromy.

Standing assumptions for this layer: `N ∈ ℕ` is the height of the tower and is arbitrary; `b = 1/2`; paths are parametrised by Mathlib's `unitInterval`; a continuation is a family `f : unitInterval → ℂ → (Fin (N+1) → ℂ)` with `TauCeti.IsAnalyticContinuationAlong f c univ`, valued in the complete normed space `Fin (N+1) → ℂ`. `V₀ = ℂ∖((−∞,0] ∪ [1,∞)) = {z : z ∈ slitPlane ∧ 1 − z ∈ slitPlane}`, which is star-shaped about `b` and so simply connected.

### 2.1 The tower germ and its continuation

References: [O93] §2.1, p. 52 (the polylogarithms as holomorphic functions on the universal cover, obtained by induction from (2)–(3)); [O93] §2.3, remark and (15), p. 54 (the tower solves a unipotent linear differential equation); [Z90] §7, discussion before (33), p. 413 (all weights on one branch). Built on Tau Ceti `TauCeti.IsAnalyticContinuationAlong`, `TauCeti.ContinuesInside`, Mathlib `DifferentiableOn.isExactOn_ball`.

**The tower germ.** Define `polylogTower N : ℂ → (Fin (N+1) → ℂ)` by

```text
polylogTower N z 0 = Log z,        polylogTower N z i = Liᵢ(z)   (1 ≤ i ≤ N).
```

The basic theory to develop comprises the logarithm entry and the positive-weight entries (the two kinds of entry, by definition), `analyticOnNhd_polylogTower` (the tower is analytic on `V₀`), coherence under truncation (for `N′ ≤ N`, the first `N′+1` entries of `polylogTower N` are `polylogTower N′`, and the same truncation sends a continuation of the N-tower to a continuation of the N′-tower, so heights are coherent), the coupled differential and exponential relations (if `c` starts at `b` and `f` starts at the germ of `polylogTower N` at `b`, then at every parameter time `t` and near `c t`: `exp(f t z 0) = z`, `(d/dz) f t z 0 = 1/z`, `(d/dz) f t z 1 = 1/(1−z)` when `N ≥ 1`, and `(d/dz) f t z i = f t z (i−1)/z` for `2 ≤ i ≤ N`) and `continuesInside_polylogTower` (the germ at `b` continues along every path in `U` starting at `b`, `TauCeti.ContinuesInside (polylogTower N) U (1/2)`). The differential relations hold for the initial germ by §1.5 and `Complex.hasDerivAt_log`, and propagate along a continuation by the identity principle, since each relation is an analytic identity between germs.

Prove `continuesInside_polylogTower` as follows. A germ at a point `w` of an open disc `B ⊂ U` satisfying the relations of the coupled differential and exponential relations is the germ of a function analytic on all of `B`: on `B` the right-hand sides are analytic, so the entries are obtained successively as primitives on the disc (Mathlib `DifferentiableOn.isExactOn_ball`), with constants fixed by the germ at `w`, and the exponential relation propagates because `exp(f₀)/z` has zero derivative on `B`. Given a path `c` in `U`, choose by compactness a subdivision `0 = t₀ < … < t_m = 1` and discs `Bⱼ ⊂ U` containing `c([tⱼ, tⱼ₊₁])`; extend successively and glue the pieces with `TauCeti.IsAnalyticContinuationAlong.union` and `.trans`. Nonpositive weights need no continuation: they are analytic on `ℂ∖{1}` (`analyticOnNhd_polylog_nonpos`, §1.4) and every determination of them is the rational function.

**Checks.**
- At `b` the tower is `(Log(1/2), Li₁(1/2), Li₂(1/2)) = (−log 2, log 2, π²/12 − (log 2)²/2)`: entry 0 is the logarithm and entry 1 is `−Log(1−z)`, so the indexing is not shifted.
- Truncation: the first two entries of `polylogTower 3` are `polylogTower 1` (coherence under truncation). Separately continuing the components along the same path gives the coupled ODE by analytic uniqueness. Choosing different paths for different weights need not do so: at `b`, keep the principal `Li₂` but replace `Li₁` by its `T₁` branch `Li₁ − 2πi`; then `Li₂′(b) ≠ (Li₁(b) − 2πi)/b` (from §2.3).
- Continuation along the upper half of the circle `|z + 1/4| = 3/4` from `b` to −1 (in `V₀` except at its endpoint) ends at the principal values `Li₂(−1) = −π²/12` and `Log(−1) = πi`; along the lower half it ends at the same `Li₂(−1)` but at `Log = −πi`. The straight segment from `b` to −1 is not admissible: it passes through 0. Continuation along a path from `b` to 3 through the lower half-plane ends at the total values `Liₙ(3)` of Layer 1; through the upper half-plane it ends at the upper values, which differ by the jump of §2.4.
- For `N ≥ 1` the germ of `polylogTower N` at 3 is not analytic (`Log` is analytic there, `Li₁` is not continuous). At `N = 0` the tower contains only `Log` and is analytic at 3; the uniform principal determination for all heights is the one on `V₀`.

*Needs:* Layer 1; Tau Ceti `TauCeti.IsAnalyticContinuationAlong` with `.union`, `.trans`, `.eventuallyEq`, `TauCeti.ContinuesInside`; Mathlib `DifferentiableOn.isExactOn_ball`, `Complex.hasDerivAt_log`.

### 2.2 The branch function on the universal cover

References: [O93] §2, introduction and §2.1, pp. 51–52 (the universal cover based at `1/2` as homotopy classes of paths, the k-logarithm as a holomorphic function on it, and a determination on `A ⊂ U` as its composite with a continuous section of the projection). Built on Tau Ceti `TauCeti.UniversalCover`, `TauCeti.UniversalCover.isCoveringMap`, `TauCeti.monodromy_theorem`, BelyiMaps §5.1 (`TauCeti.SemilocallySimplyConnectedSpace U`).

**The branch function.** Define `polylogBranch N : TauCeti.UniversalCover (b : U) → (Fin (N+1) → ℂ)` by: for `p = ⟨z, [γ]⟩`, take a continuation `f` along (the path in `ℂ` underlying) `γ` starting at the germ of `polylogTower N` at `b`, and set `polylogBranch N p = f 1 z`. It is well defined: the continuation along a fixed path is unique (`TauCeti.IsAnalyticContinuationAlong.eventuallyEq`), it exists by §2.1, and by `TauCeti.monodromy_theorem` its terminal germ depends only on the homotopy class of `γ` rel endpoints. Write `Log^[p]` and `Liₙ^[p]` for its entries. The defining value is independent of both choices; its intended signature is the one displayed above.

The basic theory to develop comprises `polylogBranch_basepointLift` (at the constant path the value is `polylogTower N b`), `polylogBranch_eq_of_isAnalyticContinuationAlong` (for any continuation `f` along a representative `γ` of `p` from the tower germ, `polylogBranch N p = f 1 (proj p)`), `polylogBranch_trans` (the value at `⟨z, [γ followed by δ]⟩` is the value at the end of `δ` of the continuation along `δ` of the terminal germ of `γ`), `polylogBranch_trunc` (truncation in `N`, as in §2.1), `analyticOn_polylogBranch_comp_section` (for an open `V ⊆ U` and a continuous section `s : V → cover` of `proj`, the determination `z ↦ polylogBranch N (s z)` is analytic on `V` and satisfies the coupled differential and exponential relations of §2.1), `exists_section_of_isSimplyConnected` (over a simply connected open `V ⊆ U`, through every point of the cover over `V` passes a unique continuous section; this is the lifting property of the covering map `TauCeti.UniversalCover.isCoveringMap`), and `polylogBranch_principal` (the section over `V₀` through `⟨b, [const]⟩` gives the principal determination: `polylogBranch N (s z) = polylogTower N z` for `z ∈ V₀`). Also prove `polylogBranch_principal_entries`: if a representative path from `b` to `z` stays in `Ω∩U`, then `Liᵢ^[p] = Liᵢ(z)` for every `1 ≤ i ≤ N`, by uniqueness and the holomorphy of `Liᵢ` on `Ω`. The logarithm entry need not be principal along such a path, since it may wind around 0; this assertion forgets entry 0. The determination on `V₀` is also the global branch of Tau Ceti `TauCeti.ContinuesInside.exists_analyticOnNhd` applied to the tower germ on the simply connected set `V₀`.

**Checks.**
- At the constant path: `Li₁^[base] = log 2` and `Log^[base] = −log 2` (degenerate case).
- For `p = ⟨−1, [upper half-circle]⟩` (the path of §2.1) the branch is principal: `Li₂^[p] = −π²/12`, a finite real value, and `Log^[p] = πi`. Prefixing `T₁` instead gives `Li₂^[T₁p] = 23π²/12`, still real (§2.3); the exact value distinguishes these branches.
- For `p = T₁(base) = periph1⁻¹ • base` (the loop `γ₁` run once): `Li₁^[p] = log 2 − 2πi, Log^[p] = −log 2` and `Li₂^[p] = Li₂(1/2) + 2πi log 2` (§2.3); this point lies over `b` but is not the base point.
- A section over a simply connected `V ⊆ U` exists, but over `U` itself none exists: `Log^[·]` cannot be a single-valued function of `z`.

*Needs:* §2.1; Tau Ceti `TauCeti.UniversalCover`, `isCoveringMap`, `TauCeti.monodromy_theorem`, `IsAnalyticContinuationAlong.eventuallyEq`, `ContinuesInside.exists_analyticOnNhd`; BelyiMaps §5.1.

### 2.3 Monodromy of the tower

References: [O93] §2.2, Proposition 1, (8)–(9), p. 53 (the monodromy of the k-logarithm and of the logarithm under the two loops, with the group acting by prefixing loops); [O93] §2, introduction, pp. 51–52 (the left action `g[c] = [ℓc]`); [O93] §2.2, remark after Corollary 2, p. 53 (the relations follow by induction from (2)–(3)). Built on §2.1, Tau Ceti `IsAnalyticContinuationAlong.trans`, BelyiMaps §§5.2, 5.6.

**Generator monodromy on germs.** Prove the germ monodromy about 0: if `f` is a continuation of the tower germ along `γ₀(t) = e^{2πit}/2` from `b`, then near `b`

```text
f 1 z 0 = Log z + 2πi,        f 1 z i = Liᵢ(z)   (1 ≤ i ≤ N).
```

Prove the germ monodromy about 1: if `f` is a continuation along `γ₁(t) = 1 − e^{2πit}/2` from `b`, then near `b`

```text
f 1 z 0 = Log z,        f 1 z i = Liᵢ(z) − 2πi · (Log z)^(i−1) / (i−1)!   (1 ≤ i ≤ N).
```

For `γ₀`: `Liᵢ` is analytic on the disc `|z| < 1` containing `γ₀`, so its germ continues to itself, while `Log` changes by `∫_{γ₀} dz/z = 2πi`. For `γ₁`: `Li₁ = −Log(1−z)` changes by `−2πi` because `1 − γ₁(t) = e^{2πit}/2` winds once counterclockwise about 0; `Log` is analytic on the disc `|z − 1| < 1` containing `γ₁`. For `i ≥ 2` the monodromy difference `Δᵢ` has derivative `Δᵢ₋₁/z`. Fix the integration constants by deforming `γ₁` to a path towards 1, a small counterclockwise circle about 1, and the reversed path. As the circle radius tends to zero, its integral of `Liᵢ₋₁ dz/z` tends to zero: `Li₁` has only a logarithmic singularity and every higher principal weight has a finite limit at 1 (§1.7). Thus `Δᵢ` tends to 0 at 1 for `i ≥ 2`. Inductively integrating `Δᵢ₋₁/z` from 1 to `z`, with `Log 1 = 0` on this disc, gives `Δᵢ = −2πi Log^{i−1}/(i−1)!` with no additive constant. The derivative relations alone would leave those constants undetermined. Homotopy invariance and uniqueness of continuation transport the result back to the original loop.

**The action on the universal cover.** Write `T₀ p = periph0⁻¹ • p` and `T₁ p = periph1⁻¹ • p`; by the convention of Tau Ceti's action (Conventions), `Tⱼ` prefixes the counterclockwise loop `γⱼ`. Prove `polylogBranch_T₀` and `polylogBranch_T₁`: for every `p` in the cover and `1 ≤ n ≤ N`,

```text
Log^[T₀p] = Log^[p] + 2πi,      Liₙ^[T₀p] = Liₙ^[p];
Log^[T₁p] = Log^[p],            Liₙ^[T₁p] = Liₙ^[p] − 2πi · (Log^[p])^(n−1) / (n−1)!.
```

The inverse operators are `periphⱼ • p`, with `Log^[periph0 • p] = Log^[p] − 2πi` and `Liₙ^[periph1 • p] = Liₙ^[p] + 2πi(Log^[p])^{n−1}/(n−1)!`. Prove `polylogBranch_smul`: there is a homomorphism `Φ` from `FundamentalGroup U b` to the group of polynomial automorphisms of `ℂ^{N+1}` (under composition) with `Φ(periph0⁻¹) = τ₀, Φ(periph1⁻¹) = τ₁`, where `τ₀(L, ℓ₁, …, ℓ_N) = (L + 2πi, ℓ₁, …, ℓ_N)` and `τ₁(L, ℓ₁, …, ℓ_N) = (L, ℓ₁ − 2πi, …, ℓₙ − 2πi L^{n−1}/(n−1)!, …)`, such that `polylogBranch N (g • p) = Φ(g)(polylogBranch N p)` for every `g` and `p`. `Φ` exists by the universal property of `π₁(U, b) ≅ FreeGroup (Fin 2)` (BelyiMaps §5.6); the identity holds for the two generators by the formulas above and for products because the action is a left action and both sides compose in the same order. The relations describe prefixing loops at the base point; continuing an already changed branch once more around a loop at its endpoint is the conjugate action and need not fix `Liₙ` under a loop about 0.

`exists_polylogBranch_monodromy` in `Suggested.lean` states the existence of the branch characterized by terminal continuations together with the polynomial fundamental-group action and both generator formulas. Polynomiality uses coordinate polynomials on `Fin (N+1) → ℂ`; the action of the inverse group element supplies the polynomial inverse.

**Checks.**
- For `n = 1`, `T₁` changes `Li₁` by `−2πi`, the negative of the upper-minus-lower jump of §2.4.
- Noncommutativity: `Li₂^[T₁T₀p] − Li₂^[T₀T₁p] = −(2πi)² = 4π²` for every `p` (compute with the two formulas; an action by independent winding numbers would give 0).
- `T₀` fixes every `Liₙ`, including `Li₁` and `Li₂`: no weight `n ≥ 1` changes under the loop about 0 alone.
- Nonpositive weights are unchanged by every loop (they are rational on `ℂ∖{1}`).
- After `T₁`, the branch `Li₂^[T₁·]` near 0 is `Li₂(z) − 2πi Log z`, which is unbounded as `z → 0` (§7.3); "all branches are `O(z)` at 0" is false.

*Needs:* §§1.2, 1.7, 2.1–2.2; Tau Ceti `IsAnalyticContinuationAlong.trans`, `.eventuallyEq`, the `MulAction` of `FundamentalGroup` on `TauCeti.UniversalCover`; BelyiMaps §§5.2, 5.6.

### 2.4 The principal jump

References: [O93] §1.3, (6), p. 51 (the jump of `Liₖ` across the cut, derived there from inversion); [O93] §2.2, (8), p. 53 (its relation to monodromy). Built on Layer 1 and Mathlib `Complex.arg`.

Prove `tendsto_polylog_jump`: for every natural `n ≥ 1` and real `x > 1`,

```text
lim_{t→0+} ( Liₙ(x + it) − Liₙ(x − it) ) = 2πi (log x)^(n−1) / (n−1)!.
```

Prove `tendsto_polylog_lower`: for every `n ∈ ℤ` and `x > 1`, `Liₙ(x − it) → Liₙ(x)` as `t → 0+`; the total value on the cut is the lower boundary value (for `n ≤ 0` this is continuity at `x ≠ 1`). Prove `continuousWithinAt_polylog_closedLowerHalfPlane`: for `n ≥ 1` and `x > 1, Liₙ` restricted to `{Im z ≤ 0}` is continuous at `x`. For `n = 1` use `Arg(1 − x ∓` i0) `= ∓π`. For `n = k + 2` use the radial integral directly. Its lower-value imaginary part is `−π/k!` times `∫_{1/x}¹ (−log t)^k dt/t = −π(log x)^{k+1}/(k+1)!`, and the upper limit is its conjugate by §1.6. Uniform integrability (§1.2) justifies both boundary limits; almost-everywhere convergence of `Log` from the closed upper side of its negative-real cut gives the lower value selected by the totalised integrand. This proves the jump without using monodromy or inversion, and it also gives relative continuity for every approach in the closed lower half-plane. Upper and lower values are related to monodromy as follows: continuing the principal determination from the lower half-plane upwards across `(1, ∞)` gives, in the upper half-plane, the principal determination minus the jump continued with `Log z`, which is the determination produced by the counterclockwise loop `γ₁` (a path from `b` passing below 1, crossing the cut upwards and returning above 1 encircles 1 counterclockwise). So counterclockwise monodromy about 1 is the negative of the upper-minus-lower jump.

**Checks.**
- At `x = 3`, the jump of `Li₁` is `+2πi`; hence no continuous function on `U` agrees with principal `Li₁` on `V₀`.
- At weight two the imaginary part of the jump is `+2π log x`, while the argument correction `Arg(1−z)·log|z|` of `D` jumps by `−2π log x`; their sum is continuous (§5.2).
- `Im Li₂(3) = −π log 3` is the lower value; the upper value is `+π log 3`.

*Needs:* §§1.1, 1.2, 1.6.

### Examples

The two loops at `1/2` give, on the base point, `Log ↦ −log 2 + 2πi` under `γ₀` and `(Li₁, Li₂) ↦ (log 2 − 2πi, Li₂(1/2) + 2πi log 2)` under `γ₁`. The commutator of the two generators moves `Li₂` by `4π²`, which a winding-number model cannot see.

### Dependencies

Layer 1; Tau Ceti's analytic continuation, monodromy theorem, global branch and universal cover (ConformalMapping L4 and the UniversalCovers material in the library); BelyiMaps Layer 5 for `U`, the peripheral loops and `π₁(U, 1/2) ≅ F₂`.

## Layer 3: classical functional equations

This layer proves the four classical functional equations with their exact principal domains (extended to the boundary rays where Mathlib's total values make them hold), continues them along common argument paths, and evaluates the standard dilogarithm constants.

Standing assumptions for this layer: `n ∈ ℤ` or `n ∈ ℕ` as each statement says; `m ≥ 1` is an integer and `ζ_j = e^{2πij/m}` for `0 ≤ j < m`; logarithms are principal; every identity is an equality in `ℂ`.

### 3.1 Distribution

References: [O93] §1.2, `(4_r)`, p. 50 (distribution for `|z| < 1` and `k, r ≥ 1`); [Z07] Part I §2, p. 9 (duplication and distribution of `Li₂`). Built on §§1.3–1.5, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

Prove `polylog_distribution`: for every `n ∈ ℤ`, `m ≥ 1` and `z ∈ Ω_m` (every `ζ_j z ∈ Ω`),

```text
Liₙ(z^m) = m^(n−1) · ∑_{j=0}^{m−1} Liₙ(ζ_j z).
```

Prove first `pow_mem_principalDomain`: `z ∈ Ω_m` implies `z^m ∈ Ω` (if `z^m = r ≥ 1` then `z = r^{1/m}ζ` for an m-th root of unity `ζ`, and `ζ⁻¹z = r^{1/m} ∈ [1, ∞)`). On the open disc interchange the finite sum with the absolutely convergent series and use `∑_j ζ_j^k = m` if `m ∣ k` and 0 otherwise; `Ω_m` is star-shaped about 0, hence connected, and both sides are analytic on it, so the identity principle extends the disc identity. Prove rational distribution: for `n ≤ 0` the identity holds wherever `z^m ≠ 1`, as an identity of rational functions (both sides are analytic on `{z^m ≠ 1}`, which is connected).

The integer-weight distribution headline is `polylog_distribution` in `Suggested.lean`.

**Checks.**
- `m = 2, n = 2, z = 1/2: Li₂(1/4) = 2(Li₂(1/2) + Li₂(−1/2))`.
- `n = 0, m = 2: Li₀(z²) = (1/2)(Li₀(z) + Li₀(−z)) = z²/(1−z²)`; the factor is `1/m`, not `m`.
- `m = 1` is the identity `Liₙ(z) = Liₙ(z)` (degenerate case).
- At `z = i` with `m = 2` and `n = 2, z ∈ Ω₂` although `|z| = 1`, and the identity gives `Li₂(−1) = 2(Li₂(i) + Li₂(−i)) = 4 Re Li₂(i) = −π²/12`.

*Needs:* §§1.3–1.5.

### 3.2 Bernoulli inversion

References: [O93] §1.3, (5), p. 51 (inversion for `k ≥ 1` on `ℂ∖[0, ∞)`, with the logarithm of imaginary part in `]0, 2π[`, proved by induction from (2)–(3) and the mean value zero of `Bₖ` on `[0,1]`); [Z07] Part I §2, p. 8 (the weight-two case). Built on Mathlib `Polynomial.derivative_bernoulli`, `hasSum_one_div_nat_pow_mul_fourier`, §§1.5, 1.7.

Prove `polylog_inversion`: for every natural `n ≥ 1` and every `z ∈ ℂ∖[0,1]`,

```text
Liₙ(z) + (−1)^n Liₙ(1/z) = −(2πi)^n / n! · Bₙ( 1/2 + Log(−z)/(2πi) ).
```

Oesterlé's logarithm with imaginary part in `(0, 2π)` is `Log(−z) + πi` on `ℂ∖[0, ∞)`, which turns his formula into this one. For `n = 1` the identity is `Log(1 − 1/z) = Log(1 − z) − Log(−z)`, checked by comparing arguments: for `z ∉ [0, ∞)` both `Arg(1 − z)` and `Arg(−z)` lie in one open half-plane interval, so no multiple of `2πi` appears. For `n ≥ 2` differentiate both sides on `ℂ∖[0, ∞)` using the recursion of §1.5 and `B′ₙ = nBₙ₋₁`, so the difference is constant on this connected set; evaluate at `z = −1` with the circle series of §1.7 and Mathlib's paired Bernoulli Fourier theorem at `x = 1/2`. On the ray `(1, ∞)` every term is the limit from the lower half-plane (`Liₙ(z)` by §2.4, `Log(−z)` because Mathlib's argument of a negative real is `π`), so the identity extends there. On `(0, 1)` it fails by the jump of §2.4, and at `z = 1` it holds for `n ≥ 2` (where it reads `2ζ(n) = −(2πi)^n Bₙ/n!` for even `n` and `0 = 0` for odd `n`) but fails for `n = 1`. Prove also `polylog_inversion_of_nonpos`: for `n ≤ 0` and `z ∉ {0, 1}`,

```text
Liₙ(z) + (−1)^n Liₙ(1/z) = −1 if n = 0,   and = 0 if n < 0,
```

since `z/(1−z) + (1/z)/(1 − 1/z) = −1` and the Euler operator `z d/dz` anticommutes with `z ↦ 1/z`. The value −1 at `n = 0` is the Bernoulli formula with `B₀ = 1`, so the two statements together cover every integer weight.

The inversion headlines are `polylog_inversion` and `polylog_inversion_of_nonpos` in `Suggested.lean`.

**Checks.**
- `n = 2, z = −1: 2Li₂(−1) = −π²/6`, since `B₂(1/2) = −1/12`.
- `n = 2` in general: `Li₂(z) + Li₂(1/z) = −π²/6 − (1/2)Log²(−z)`, Zagier's form.
- `z = 1, n = 2: 2ζ(2) = −(2πi)²B₂/2 = π²/3`, the classical even-zeta formula (Mathlib `riemannZeta_two`).
- Non-example: at `z = 1/2` the formula is false for every `n ≥ 1` (the left side uses the lower value `Liₙ(2)`, the right side corresponds to the upper one); the domain is part of the theorem and is not dropped because both sides have total values.
- `n = 0: Li₀(z) + Li₀(1/z) = −1` for `z = 2, i, −3`.

*Needs:* §§1.5, 1.7, 2.4; Mathlib `Polynomial.derivative_bernoulli`, `hasSum_one_div_nat_pow_mul_fourier`, `Complex.hasDerivAt_log`.

### 3.3 Euler's reflection

References: [O93] §4.1, (29), p. 59 (reflection with principal determinations on `ℂ∖(]−∞,0] ∪ [1,+∞[)`, proved by differentiation); [Z07] Part I §2, p. 8. Built on §§1.5, 1.7.

Prove `polylog_reflection`: for every `z ∈ ℂ`,

```text
Li₂(z) + Li₂(1 − z) = π²/6 − Log z · Log(1 − z).
```

On `V₀ = ℂ∖((−∞,0] ∪ [1,∞))` all four functions are principal and analytic; the derivative of the difference vanishes by §1.5 and `Complex.hasDerivAt_log`, `V₀` is connected, and the limit `z → 0` through `(0,1)` fixes the constant using `Li₂(1) = π²/6` and `z log z → 0`. On the ray `(−∞, 0)` the only terms with a cut there are `Log z` (Mathlib's value is the limit from above) and `Li₂(1 − z)` with `1 − z > 1` (the lower value of `Li₂` at `1 − z`, i.e. the limit as `z` approaches from above); so every term is a limit from the upper half-plane and the identity extends. On `(1, ∞)` symmetrically every term is a limit from the lower half-plane. At `z = 0` and `z = 1` both sides equal `π²/6` (`Log 1 = 0`, and Mathlib's `Log 0 = 0` multiplies it). The statement therefore needs no hypothesis.

Euler reflection is stated as `polylog_reflection` in `Suggested.lean`.

**Checks.**
- `z = 1/2: 2Li₂(1/2) = π²/6 − (log 2)²`.
- `z = −1: Li₂(−1) + Li₂(2) = π²/6 − πi log 2`, so the lower value `Li₂(2) = π²/4 − πi log 2`.
- `z = 0` and `z = 1`: both sides are `π²/6`; the totalised `Log 0 = 0` is harmless here only because it multiplies `Log 1 = 0`.

*Needs:* §§1.5, 1.7, 2.4.

### 3.4 Abel's five-term identity

References: [O93] §4.1, (30), p. 59 (the five-term equation with principal determinations for `|x| + |y| < 1`); [Z07] Part I §2, p. 9 (the Spence–Abel five-term relation and its cyclic structure). Built on §§1.5, 3.3.

Prove `polylog_abel`: for `x, y ∈ ℂ` with `|x| + |y| < 1`, put `a = x/(1−y), b = y/(1−x)` and `c = xy/((1−x)(1−y))`; then

```text
Li₂(c) = Li₂(a) + Li₂(b) − Li₂(x) − Li₂(y) − Log(1 − x) Log(1 − y).
```

The norm condition gives `|a|, |b|, |c| < 1: |a| ≤ |x|/(1 − |y|) < 1`, and `|c| < 1` is equivalent to `|x||y| < (1 − |x|)(1 − |y|)`, that is `|x| + |y| < 1`. For fixed `y` differentiate in `x` on the disc `|x| < 1 − |y|` with the recursion of §1.5; the logarithmic product identities `Log(1 − a) = Log(1 − x − y) − Log(1 − y)` and its companions hold there because every argument has positive real part. At `x = 0` both sides vanish; the domain is star-shaped about 0, so the identity holds on it.

The principal five-term headline is `polylog_abel` in `Suggested.lean`.

**Checks.**
- `x = 0`: both sides reduce to `Li₂(0) = 0` after cancelling `Li₂(y)` (degenerate case); likewise `y = 0`.
- `x = y = 1/4`: the arguments are `a = b = 1/3` and `c = 1/9`.
- Without the logarithmic product the identity fails already at `x = y = 1/4`, where `Log(3/4)² ≈ 0.0828`.

*Needs:* §§1.5, 3.3.

### 3.5 Functional equations on coherent branches

References: [O93] §2.1–2.2, pp. 52–53 (continuation on the universal cover and its monodromy); [O93] §4.1, pp. 59–60 (the dilogarithm identities and their single-valued forms); [Z90] §7, discussion before (33), p. 413. Built on Layer 2 and §§3.1–3.4.

Initialize each polylogarithm continuation at the principal germ at its base argument. Continue logarithms of nonvanishing argument maps on `ℂ∖{0}`, independently of the full tower when the logarithm's argument may equal 1. Initial germs, rather than just initial values, are required. In inversion, continue `Log(−z)` along `−c`, initialized at the germ of `Complex.log` at 1 with value 0; the full tower of positive height has a singular entry `Li₁` at 1 and cannot supply that germ. The target `polylog_inversion_continuation` states the Bernoulli identity with these initial germs for the two polylogarithm families at −1 and the logarithm family at 1.

State and prove `isAnalyticContinuationAlong_functionalEquation` for each of the four identities: along a path `c` in its nonsingular argument space from the specified base point, continue each principal polylogarithm germ along its argument path and each principal logarithm germ along its nonvanishing argument path. The argument spaces and base points are: for distribution, `z ≠ 0` and `z^m ≠ 1`, with argument paths `z^m` and `ζ_j z`, from a small positive real base point; for inversion, `z ∈ U`, with paths `z`, `1/z` and logarithm path `−z`, from −1; for reflection, `z ∈ U`, with paths `z`, `1 − z`, from `1/2`; for Abel, `M = {(x, y) : xy(1−x)(1−y)(1−x−y) ≠ 0}`, with the five dilogarithm arguments and logarithms of `1−x`, `1−y`, from `(1/4, 1/4)`. For the first three identities, compose the continued germs with the analytic argument maps on the one-dimensional base and apply `TauCeti.IsAnalyticContinuationAlong.eventuallyEq` to the difference and the zero germ.

For Abel first prove `abel_functionalEquation_continuation`, a two-variable propagation theorem owned here, from [O93] §4.1, (30), p. 59 and the following identity-principle argument. Set `a = x/(1−y)`, `b = y/(1−x)`, `d = xy/((1−x)(1−y))`. Carry seven germs on `ℂ × ℂ`, initially the germs of `(Li₂(d), Li₂(a), Li₂(b), Li₂(x), Li₂(y), Log(1−x), Log(1−y))` at `(1/4,1/4)`. Require `AnalyticAt ℂ` for their vector at every path point and local germ agreement at nearby parameter times, for each of the seven entries. These conditions are obtained by composing the one-variable continuations with the analytic argument maps on `M`. On small polydiscs the difference `F₀−F₁−F₂+F₃+F₄+F₅F₆` is analytic and initially zero as a germ by §3.4. Local germ agreement and the identity principle on connected overlapping polydiscs propagate its vanishing along the continuous path. The conclusion is Abel's identity at the endpoint. Mathlib's `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` applies to `ℂ × ℂ`; the one-variable Tau Ceti continuation predicate does not.

Prove `functionalEquation_branch_change`: changing one branch independently by a loop word gives the defect obtained by substituting `Φ` of §2.3 for that branch, including every continued logarithm in the polynomial or product term. No uncorrected identity between independently chosen branches is asserted.

The coherent-continuation statements in `Suggested.lean` are `polylog_inversion_continuation` and `abel_functionalEquation_continuation`, retaining the separately initialized logarithm and the two-variable germs respectively.

**Checks.**
- At the inversion base point −1, the logarithm argument is 1 and its initial value is 0; this is regular for `Log` and singular for the positive-height tower.
- On the constant Abel path at `(1/4,1/4)`, the seven initial germs recover §3.4 with arguments `1/9, 1/3, 1/3, 1/4, 1/4` and logarithmic product `Log(3/4)²`.
- Changing the branch of `Li₁` alone by `T₁` in an otherwise principal identity changes it by `−2πi` times the coefficient of `Li₁`.
- Two loop words with the same winding numbers about 0 and 1 (for instance `T₁T₀` and `T₀T₁`) can change `Li₂` differently, by `4π²` (§2.3); a correction computed from winding numbers alone is wrong.
- The continued reflection along a path from `1/2` that encircles 1 once counterclockwise changes `Li₂(z)` by `−2πi Log z` and `Log(1−z)` by `2πi`, and the identity still holds: `−2πi Log z` on the left equals `−Log z · 2πi` on the right.

*Needs:* Layer 2; §§3.1–3.4; Tau Ceti `IsAnalyticContinuationAlong.eventuallyEq` for the one-variable cases; the separately initialized logarithm continuations and `abel_functionalEquation_continuation` above; Mathlib `AnalyticAt`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` on `ℂ × ℂ`.

### 3.6 Exact dilogarithm values

References: [Z07] Part I §1, pp. 6–7 (the closed-form values, among them `Li₂(1), Li₂(−1), Li₂(1/2)` and the golden-ratio values) and Part I §2, pp. 8–9 (the functional equations that produce them). Built on §§1.7, 3.1, 3.3.

Prove the value at 1 (`Li₂(1) = π²/6`, from `riemannZeta_two`), the value at −1 (`Li₂(−1) = −π²/12`, from duplication at `z = 1` by closed-disc continuity: `Li₂(1) = 2(Li₂(1) + Li₂(−1))`) and the value at 1/2 (`Li₂(1/2) = π²/12 − (log 2)²/2`, from reflection at `z = 1/2`). These three are complex equalities with zero imaginary part. The golden-ratio values are proved after the Rogers pentagon in §6.5.

**Checks.**
- At the upper half-circle lift `p` of −1 the principal value is `−π²/12`; prefixing `T₁` changes it to `23π²/12`, still real. The exact real value detects this branch change. The target `polylogBranch_two_T1_neg_one`, for `2 ≤ N`, states this using the continuation of the `T₁`-changed tower germ along that half-circle: `−π²/12 − 2πi·πi = 23π²/12`.
- `Li₂(1/2) ≠ π²/12`: the logarithmic correction `−(log 2)²/2` is part of the value.
- `Li₂(1) = π²/6` but `Li₂(−1) = −π²/12`: duplication fixes the factor `−1/2` between the two endpoint values.

*Needs:* §§1.7, 3.1, 3.3.

### Examples

At `z = −1`, inversion, duplication and the circle series all give `Li₂(−1) = −π²/12`, and reflection at `z = −1` then forces the lower value `Li₂(2) = π²/4 − πi log 2`, the value Layer 1's integral assigns. Abel's identity at `x = y = 1/4` relates `Li₂(1/9), Li₂(1/3)` and `Li₂(1/4)` with the correction `log²(3/4)`.

### Dependencies

Layers 1 and 2; Mathlib's Bernoulli polynomials and their Fourier series, zeta values, the identity principle.

## Layer 4: single-valued polylogarithms

This layer builds Zagier's real single-valued functions `Lₙ` for every `n ≥ 2` and proves their analytic theory: branch independence for every loop word, real analyticity off `{0,1}` including the classical cut, the real differential in every weight, inversion, conjugation and distribution, and continuity on the Riemann sphere. The weight-three statements fix the endpoint conventions that odd-weight consumers depend on.

Standing assumptions for this layer: `n ≥ 2` is a natural number unless a statement says otherwise; `ℓ = log|z|`; `cₖ` and `πₙ` are as in Conventions; `z ∈ ℂ` is arbitrary, and the hypotheses `z ≠ 0, z ≠ 1` are stated where they are needed.

### 4.1 The Bernoulli coefficients and their even transform

References: [Z90] §7, (35), p. 413, and the computation on p. 414 (the coefficients `2^jBⱼ/j!`, their generating function `2x/(e^{2x} − 1)`, and the even series `x/sinh x`). Built on Mathlib `bernoulli`, `bernoulliPowerSeries_mul_exp_sub_one`, `Polynomial.bernoulli_eval_one_sub`.

**The coefficients.** Define `bernoulliCoeff : ℕ → ℚ`, written `cₖ`, by `cₖ = 2^k Bₖ / k!`. The basic theory to develop comprises the constant coefficient (`c₀ = 1`), the linear coefficient (`c₁ = −1`), the quadratic coefficient (`c₂ = 1/3`), vanishing in higher odd degree (`cₖ = 0` for odd `k ≥ 3`), the generating-series identity (in `ℚ⟦s⟧`, `(∑ cₖ s^k)·(exp(2s) − 1) = 2s`, the variable-scaled form of Mathlib's identity, with no division by the non-unit `s`), and `sum_bernoulliCoeff_div_factorial_of_odd` (for odd `k`, `∑_{j≤k} cⱼ/(k−j)! = 0`, that is, `exp(s)·∑ cₖ s^k` is an even series; it equals `s/sinh s` after cancelling `s`). The even transform also follows from `∑_{j≤k} C(k,j) 2^j Bⱼ = 2^k Bₖ(1/2)` and Mathlib's reflection `Bₖ(1 − x) = (−1)^k Bₖ(x)` at `x = 1/2`.

**Checks.**
- `c₁ = −1` and `c₂ = 1/3`; `c₃ = 0`.
- The even transform at `k = 1` is `c₀ + c₁ = 0` and at `k = 3` is `1/6 − 1/2 + 1/3 + 0 = 0`.
- Non-example: with the convention `B₁ = +1/2` (Mathlib's `bernoulli'`) one gets `c₁ = +1` and `c₀ + c₁ = 2 ≠ 0`, so the cancellation of §4.3 fails; the definition uses `bernoulli`, never `bernoulli'`.

*Needs:* Mathlib `bernoulli`, `bernoulli_one`, `bernoulli_two`, `bernoulliPowerSeries_mul_exp_sub_one`, `PowerSeries.rescale`, `Polynomial.bernoulli_eval_one_sub`.

### 4.2 Zagier's single-valued family

References: [Z90] §7, (33), p. 413 (the function `Pₘ` as the parity projection of `∑ 2^jBⱼ/j! log^j|z| Li_{m−j}(z)`, with `B₁ = −1/2`, `Re` for odd and `Im` for even `m`); [O93] §3.1, (18), p. 57 (the same combination, valued in `i^{k−1}ℝ`, obtained from Deligne's real matrix); [GR] §1.1, (1) and the display after it, p. 3 (the projection `πₙ` and `Lₙ` on `ℂℙ¹∖{0,1,∞}`). Built on §§1.1, 4.1.

**The single-valued polylogarithm.** Define `singleValued : ℕ → ℂ → ℝ`, written `Lₙ(z)`, by

```text
Lₙ(z) = πₙ( ∑_{k=0}^{n−1} cₖ · Li_{n−k}(z) · ℓ^k )        for z ≠ 0, 1,
Lₙ(0) = 0,        Lₙ(1) = ζ(n) for odd n,   Lₙ(1) = 0 for even n,
```

with principal `Li` and the lower boundary values on the cut, and define `singleValuedSphere n : OnePoint ℂ → ℝ` by extending with the value 0 at `∞`. The endpoint assignments are the continuous values (§4.7); they are part of the definition, not a convenience. For `n ≥ 2` this is exactly Zagier's real `Pₙ` in [Z90], whereas Oesterlé's even-weight `Pₙ` is `i·Lₙ`. In [Z90] (33) the sum also has a `k = n` term with the auxiliary convention `Li₀ = −1/2`; its projection vanishes, since `Bₙ = 0` for odd `n ≥ 3` and the term is real for even `n`. That auxiliary `Li₀` is not the rational `Li₀` of Layer 1, and neither is inserted as an extra term here. This family is not Zagier's earlier `Dₙ` (the modified Ramakrishnan function of [Z07] Part I §3, p. 12) nor any other normalisation. For `n = 1` our truncated formula gives `−log|1 − z|`, whereas [Z90] p. 414 has `P₁ = (1/2)log|z| − log|1 − z|` because its auxiliary `k = n` term survives. Neither is `log|z|`, and no weight-one identification with [Z90] is claimed; this definition is used only for `n ≥ 2`. No restriction to arguments coming from a number field or a particular embedding is present.

The basic theory to develop comprises the displayed sum for `z ∉ {0, 1}`, the values `Lₙ(0) = 0` and the parity-dependent value at 1, the sphere value 0 at `∞` and its agreement with `Lₙ` on `ℂ`, the unit-circle formula (for `|z| = 1, Lₙ(z) = πₙ(Liₙ(z))`, including `z = 1`; equivalently the parity projection of Mathlib's `HurwitzZeta.expZeta`, by §1.7), and the identification of weight two with the Bloch–Wigner function (§5.2).

**Checks.**
- `L₃(1) = ζ(3)` and `L₂(1) = 0` (the value at 1): the odd-weight endpoint keeps the zeta value; dropping it changes every odd-weight regulator convention downstream.
- `L₃(−1) = −3ζ(3)/4` (§4.8): odd weights do not vanish on the real axis.
- Weight-one distinction: at `z = 1/2` the weight-one formula gives `−log|1/2| = log 2`, whereas `log|z| = −log 2`.
- On the unit circle, `L₃(z) = Re Li₃(z)` for `‖z‖ = 1, z ≠ 1`; in weight two the projection is the imaginary part, so the parity alternates.
- `L₂(z) = Im Li₂(z) + Arg(1 − z)·ℓ` for `z ∉ {0, 1}`, the Bloch–Wigner function (§5.2), because `c₁ = −1` and `Im Li₁ = −Arg(1 − z)`.

*Needs:* §§1.1, 1.7, 4.1.

### 4.3 Branch independence for every loop word

References: [Z90] §7, (34)–(35) and the computation on p. 414 (single-valuedness of `Pₘ` from the even series); [O93] §3.1, p. 57 (the matrix `Tₙ(z)` does not depend on the path because the monodromy matrices are real). Built on §§2.1–2.3, 4.1.

Prove `singleValued_eq_of_isAnalyticContinuationAlong`: for every `n ≥ 2`, every path `c` in `U` from `b = 1/2` and every continuation `f` of `polylogTower n` along `c`,

```text
Lₙ(c 1) = πₙ( ∑_{k=0}^{n−1} cₖ · f 1 (c 1) (n−k) · log^k|c 1| ).
```

Equivalently, on the universal cover: for every point `p` of the universal cover, `Lₙ(proj p) = πₙ(∑ cₖ Li_{n−k}^[p] log^k|proj p|)`. It suffices to prove that the projected combination is invariant under `T₀` and `T₁` at every point of the cover (then under every element of `π₁` by §2.3, hence equal to its value on the principal determination). Under `T₀` every `Liₖ` and `log|z|` are unchanged. Under `T₁`, `Li_{n−k}` changes by `−2πi L^{n−k−1}/(n−k−1)!` with `L = Log^[p] = ℓ + iθ`, so the combination changes by `−2πi` times the coefficient of `s^{n−1}` in `e^{iθs}·(e^{ℓs}∑ cₖ(ℓs)^k)`. The second factor is an even series in `s` with real coefficients (§4.1), so only the terms of `e^{iθs}` of parity `n − 1` contribute; they carry the factor `i^{j}` with `j ≡ n − 1 (mod 2)`, and after multiplication by `−2πi` the change is purely imaginary when `n` is odd and real when `n` is even, so its projection `πₙ` vanishes. The computation holds for every value of `θ`, in particular after any number of loops about 0. A test of the cut jump alone does not prove this statement.

Branch independence along every path is stated as `singleValued_eq_of_isAnalyticContinuationAlong` in `Suggested.lean`.

**Checks.**
- `n = 2` at real `x > 1`: `Im Li₂` jumps by `+2π log x` and `c₁ Li₁ ℓ = log|z|·Log(1 − z)` has imaginary part jumping by `−2π log x`; the sum is continuous.
- The unprojected complex sum is not branch independent: for `n = 2`, under `T₁` the complex combination `Li₂ − Li₁ ℓ` changes by `−2πi(ℓ + iθ) + 2πi ℓ = 2πθ`, a real number, so only its imaginary part is invariant.
- With `c₁ = +1` the weight-two combination changes by `−2πi(ℓ + iθ) − 2πi ℓ`, whose imaginary part `−4πℓ` is not zero.

*Needs:* §§2.1–2.3, 4.1, 4.2; BelyiMaps §5.6.

### 4.4 Real analyticity across the classical cut

References: [O93] §3.2, p. 57 (`Pₖ` is real analytic on `ℂ∖{0,1}`); [GR] §1.1, p. 3 (single-valuedness of `Lₙ` on `ℂℙ¹∖{0,1,∞}`). Built on §§2.2, 4.3.

Prove `analyticOnNhd_singleValued`: for `n ≥ 2`, `Lₙ` is real analytic (`AnalyticOnNhd ℝ`) on `ℂ∖{0, 1}`, including the points of `(1, ∞)`. Near `z ∈ U` choose a disc `B ⊂ U` and a section `s` of the universal cover over `B`; by §4.3, `Lₙ = πₙ(∑ cₖ Li_{n−k}^[s(·)] log^k|·|)` on `B`, a polynomial in holomorphic functions, their conjugates and the real-analytic function `log|z|` on `B ∌ 0`. Consequently `Lₙ` is `C^r` on `U` for every `r` (`contDiffOn_singleValued`).

Real analyticity across the cut is stated as `analyticOnNhd_singleValued` in `Suggested.lean`.

**Checks.**
- At `z = 2`, `Lₙ` has a genuine real derivative for every `n ≥ 2`, although principal `Liₙ` jumps there.
- Real analyticity is not asserted at 0 or `1`: `D = L₂` is not differentiable at 0 (§7.6).
- At `1`, `L₃` is differentiable with derivative 0 (§4.8) although it is not asserted to be analytic there.

*Needs:* §§2.2, 4.3.

### 4.5 The real differential in every weight

References: [O93] §3.3, (27)–(28), p. 58 (the Wirtinger derivatives `∂Pₖ/∂z` and `∂Pₖ/∂z̄`); [G00] §4, item 1, Proposition 4.1, (28) and Lemma 4.2, (29)–(32), pp. 17–18 (the differential equations of the single-valued functions in every weight). The branchwise form below is obtained by differentiating the finite sum. Built on §§1.5, 2.2, 4.4.

Prove the real differential formula in every weight: for `n ≥ 2, z ∉ {0, 1}` and every direction `v ∈ ℂ`, `Lₙ` is real differentiable at `z` and

```text
dLₙ(z)[v] = πₙ( ∑_{k=0}^{n−1} cₖ Li_{n−k−1}(z) ℓ^k · (v/z)  +  ∑_{k=1}^{n−1} k cₖ Li_{n−k}(z) ℓ^{k−1} · Re(v/z) ),
```

with `Li₀(z) = z/(1−z)`, where `Li` may be taken on any coherent local branch, in particular principal off the cut. Differentiate the local expression of §4.4 with `dLiⱼ = Liⱼ₋₁·v/z` and `dℓ = Re(v/z)`; the linear map obtained does not depend on the branch because it is the derivative of the branch-independent function, not because a continuous function was differentiated across a cut.

**Checks.**
- Both sums have nonnegative logarithm exponents; the second starts at `k = 1`, so no `ℓ^{−1}` occurs.
- `n = 2` gives `dD(z)[v] = −ℓ Im(v/(1−z)) − log|1−z| Im(v/z)` (§5.4); `n = 3` gives the formula of §4.8.
- At `z = 0.3 + 0.7i` and `v = 0.6 + 0.8i` the formula agrees with central difference quotients of `Lₙ` for `n = 2, …, 5`; a version with `Re(v/z)` replaced by `v/z` in the second sum fails this test.

*Needs:* §§1.5, 2.2, 4.4.

### 4.6 Inversion, conjugation and distribution

References: [O93] §3.2, (20)–(22), pp. 57–58 (conjugation, distribution and inversion of `Pₖ`); [Z90] §7, p. 413 (the `(−1)^{m−1}` symmetry under `z ↦ 1/z` and `z ↦ z̄` required of `Pₘ`). Built on §§1.6, 1.7, 3.1, 3.2, 4.1, 4.3, 4.4.

Prove `singleValued_inv`: for `n ≥ 2` and `z ≠ 0`, `Lₙ(z) + (−1)^n Lₙ(1/z) = 0`, including `z = 1` and `z = −1`. Prove conjugation parity: for every `z ∈ ℂ`, `Lₙ(z̄) = (−1)^{n−1} Lₙ(z)`. Prove `singleValued_distribution`: for every `m ≥ 1` and every `z ∈ ℂ`, `Lₙ(z^m) = m^{n−1} ∑_j Lₙ(ζ_j z)`. For inversion, insert the classical inversion of §3.2 into the finite sum for `z ∉ [0, ∞)` (`ℓ` changes sign under `z ↦ 1/z`); the Bernoulli-polynomial correction contributes the parity projection of `−2πi` times a coefficient of `e^{iθs}·(even real series)`, which vanishes as in §4.3; extend to `U` by continuity on `U` from real analyticity (§4.4), since the omitted ray has empty interior. At `z = 1` the identity follows directly from the assigned parity-dependent value, so no endpoint continuity is used. Conjugation follows from §1.6 and the reality of `cₖ` and `ℓ` off the cut, extends over the cut by §4.4, and holds at 0 and 1 by their explicit values. For distribution on `Ω_m`, `ℓ(z^m) = mℓ(z)`, so the k-th term acquires `m^k·m^{n−k−1} = m^{n−1}`; extend by §4.4 away from 0 and the m-th roots of 1. At 0 every summand is zero. At an m-th root of 1 all arguments have norm 1, so §4.2 reduces the formula to the parity projection of the closed-disc distribution identity, obtained from §3.1 by radial limits using §1.7. This proves all three identities before sphere continuity.

The inversion and distribution headlines are `singleValued_inv` and `singleValued_distribution` in `Suggested.lean`.

**Checks.**
- `L₂(1/z) = −L₂(z)` and `L₃(1/z) = L₃(z)`: the sign alternates with the weight.
- Conjugation negates `L₂` and fixes `L₃`. Inversion acts with the same sign `(−1)^{n−1}`, so `Lₙ(1/z̄) = Lₙ(z)` for `z ≠ 0`: `Lₙ` is invariant under reflection in the unit circle, although conjugation and inversion are different maps (`z = 2i` has `z̄ = −2i` and `1/z = −i/2`).
- Distribution at `z = 1, m = 2, n = 3` gives `ζ(3) = 4(ζ(3) + L₃(−1))`, hence `L₃(−1) = −3ζ(3)/4`.
- At real `x > 1` conjugation gives `L₂(x) = −L₂(x)`, so `L₂` vanishes on the cut, as the lower-value formula confirms: `Im Li₂(x) = −π log x` and `Arg(1 − x) log x = π log x`.

*Needs:* §§1.6, 1.7, 3.1, 3.2, 4.1–4.4.

### 4.7 Continuity on the Riemann sphere

References: [O93] §3.2, (23)–(24), p. 58 (`Pₖ` extends continuously to `ℙ¹(ℂ)` with `Pₖ(0) = Pₖ(∞) = 0` and `Pₖ(1) = ζ(k)` or 0 by parity); [Z90] §7, p. 414 (continuity at `0, ∞` and 1 and the parity of the value at 1). Built on §§1.3, 1.7, 4.3, 4.4, 4.6.

Prove `continuous_singleValuedSphere`: for `n ≥ 2` the function `singleValuedSphere n` on `OnePoint ℂ` is continuous; hence `continuous_singleValued` on `ℂ`. The limits at `0, ∞` and 1 are 0, 0 and `ζ(n)` or 0 by parity, and do not depend on the direction of approach or on a branch. Near `0`, `Liⱼ(z) = O(|z|)` for every `j ≥ 1` and the factor `ℓ^k` grows at most like `|log|z||^{n−1}`. At `∞`, use the inversion identity already proved in §4.6 and the behaviour at 0. Near `1`, `Liⱼ → ζ(j)` for `j ≥ 2` by §1.7, while the logarithmic singularity of `Li₁` is multiplied by `ℓ^{n−1} = O(|z − 1|^{n−1})`; the cut corrections cancel by §4.3, so the estimates hold uniformly on both half-neighbourhoods.

The path limits below use the continuous sphere extension, with every complex argument coerced into `OnePoint ℂ`. Prove the endpoint value at infinity and agreement of the sphere extension with the planar function.

Sphere continuity is stated as `continuous_singleValuedSphere` in `Suggested.lean`.

**Checks.**
- As `t → 0+`, `singleValuedSphere 2 (t·i) → 0` (filter `𝓝[>] 0`).
- As `t → +∞`, `singleValuedSphere 3 (t·i) → 0` (filter `atTop`).
- As `t → 0` from either side, `singleValuedSphere 3 (1 + t·i) → Re ζ(3)` (filter `𝓝 0`): odd weight retains a nonzero endpoint.

*Needs:* §§1.3, 1.7, 4.3, 4.4, 4.6.

### 4.8 The trilogarithm

References: [Z90] §7, (33), p. 413 (the weight-three combination); the differential is the `n = 3` case of §4.5; [O93] §3.2, (21), p. 57 (distribution, used at `z = 1`). Built on §§4.5–4.7.

Prove the weight-three differential formula: for `z ∉ {0, 1}`, with `ℓ = log|z|`,

```text
dL₃(z)[v] = −L₂(z)·Im(v/z) + (ℓ·log|1−z|/3)·Re(v/z) + (ℓ²/3)·Re(v/(1−z)).
```

Expand the `n = 3` case of §4.5 with `c₀ = 1, c₁ = −1, c₂ = 1/3` and combine the imaginary parts of `Li₂` and `Li₁` into `L₂`. Prove `hasFDerivAt_singleValued_three_one`: `L₃` is real differentiable at 1 with derivative 0. By §4.7, `L₂(z) → 0` as `z → 1`. With `ρ = |z − 1|`, we have `ℓ = O(ρ)` and `1/|z|` bounded near 1, so the displayed differential satisfies

```text
‖dL₃(z)‖ ≤ C (|L₂(z)| + ρ |log ρ| + ρ) → 0.
```

Apply this uniform bound along radial segments punctured at 1, then use continuity of `L₃` at 1 from §4.7 to obtain `L₃(1 + h) − L₃(1) = o(|h|)`. Prove the weight-three value at −1: `L₃(−1) = −3ζ(3)/4`, from the circle formula `Li₃(−1) = −(3/4)ζ(3)` or from distribution at `z = 1`; and positivity of the weight-three value at 1: `L₃(1) = ζ(3) > 0`, from the positive series.

**Checks.**
- The differential formula agrees with difference quotients at `z = 0.3 + 0.7i` and at the cut point `z = 2.5`.
- Difference quotients `(L₃(1 + hv) − ζ(3))/h` tend to 0 for `v = 1, i, −1` as `h → 0`: the weight-two nondifferentiability at the punctures is not extrapolated to weight three.
- On the unit circle `L₃` is the real, not the imaginary, part of `Li₃`.

*Needs:* §§4.5–4.7, 1.7, 3.1.

### Examples

At `z = 1/2` the three weights give `L₂(1/2) = 0, L₃(1/2) = Re(Li₃(1/2) + log 2·Li₂(1/2) + (1/3)log²2·Li₁(1/2)) = Li₃(1/2) + log 2·Li₂(1/2) + (log³2)/3`, and the inversion `L₃(2) = L₃(1/2)`. The values `L₃(1) = ζ(3)` and `L₃(−1) = −3ζ(3)/4` pin the odd-weight endpoint convention; `L₂ = D` vanishes on the whole real axis.

### Dependencies

Layers 1–3; Tau Ceti's continuation and universal-cover API through Layer 2; BelyiMaps §5.6 for the reduction to two generators; Mathlib's Bernoulli numbers.

## Layer 5: the Bloch–Wigner dilogarithm and the five-term relation

This layer specialises Layer 4 to weight two. It proves the symmetries, the one-form and the Laplacian of `D`, its strict positivity on the upper half-plane by the minimum principle, and the five-term relation in its alternating, cyclic, Abel and projective forms. Every proof is analytic; no Bloch group, regulator or hyperbolic volume enters, so these statements can be used to construct such objects downstream without circularity.

Standing assumptions for this layer: `z, x, y ∈ ℂ`; `D = blochWigner`; `η(f, g) = log|f| d arg g − log|g| d arg f` for nonvanishing holomorphic `f, g` on an open set, a real 1-form that is well defined without choosing arguments because `d arg f = Im(df/f)`.

### 5.1 The Bloch–Wigner function

References: [Z07] Part I §3, p. 10 (the definition `D(z) = Im Li₂(z) + arg(1 − z) log|z|`, its continuity, real analyticity off 0 and 1 with `r log r` singularities there, `D(z̄) = −D(z)`, and the maximum 1.0149… at `(1 + i√3)/2`) and p. 11 (the unit-circle series); [G95] §1.0, (1.2), p. 201 (`D₂` on `ℂℙ¹` with `D₂(0) = D₂(1) = D₂(∞) = 0`); [O93] §3.1, (19), p. 57 (`P₂ = iD`). Built on §1.1.

**The Bloch–Wigner function.** Define `blochWigner : ℂ → ℝ` by `D(z) = Im Li₂(z) + Arg(1 − z)·log|z|` for `z ∉ {0, 1}`, and `D(0) = D(1) = 0`; its sphere extension is `singleValuedSphere 2` (§4.2), with value 0 at `∞`. The logarithm and argument are the principal ones of Layer 1, and at real `x > 1` the lower value `Im Li₂(x) = −π log x` is corrected by `Arg(1 − x)·log x = π log x`. The definition is made before, and independently of, any Bloch group or volume.

The basic theory to develop comprises the defining formula (the displayed expression on `ℂ∖{0, 1}`), the value at 0 and the value at 1 (simp), vanishing on the real axis (§5.3), `hasSum_blochWigner_exp` (for every real `t`, `D(e^{it}) = ∑_{k≥1} sin(kt)/k²`), the exponential-zeta comparison (`D(e^{2πia}) = Im HurwitzZeta.expZeta a 2`) and the identification of weight two with the Bloch–Wigner function (§5.2).

**Checks.**
- `D(0) = D(1) = D(2) = 0` (degenerate values; `D(2) = 0` is the cancellation of the lower value: `D(2) = Im Li₂(2) + π log 2`).
- `D(i) = ∑(−1)^k/(2k+1)² = 0.91596… > 0`, Catalan's constant; the zero function satisfies every symmetry of §5.3 and fails this test.
- `D(−i) = −D(i) < 0`.
- On the unit circle `D(i) = Im Li₂(i)`; off the circle `D` is not `Im Li₂` (at `z = 2, Im Li₂(2) = −π log 2 ≠ 0 = D(2)`).

*Needs:* §1.1; Mathlib `Complex.arg`, `HurwitzZeta.expZeta`.

### 5.2 Weight two is the Bloch–Wigner function

References: [O93] §3.1, (19), p. 57 (`P₂ = iD`); [Z90] §7, p. 414 (`D₂ = D` and `P₂ = D` for the Bernoulli normalisation); [GR] §1.1, p. 3 (`L₂` is the Bloch–Wigner dilogarithm). Built on §§4.1–4.7, 5.1.

Prove the identification of weight two with the Bloch–Wigner function: for every `z ∈ ℂ`, `L₂(z) = D(z)`. Off `{0, 1}` the two formulas agree because `c₀ = 1, c₁ = −1` and `Im Li₁(z) = −Arg(1 − z)`; at 0 and 1 both are 0. Consequently `D` is continuous on `ℂ` and on the Riemann sphere (§4.7), real analytic on `U` including the cut (§4.4), and `D(e^{it})` is the imaginary part of the absolutely convergent `Li₂` series.

**Checks.**
- At `x > 1` the jump `+2π log x` of `Im Li₂` and the jump `−2π log x` of `Arg(1 − z)·log|z|` cancel, so `D` is continuous across the cut.
- `L₂(i) = Im(Li₂(i) − Li₁(i)·0) = D(i)`: on `|z| = 1` the correction term vanishes.
- The sign of the correction is forced: `Im Li₂(z) − Arg(1 − z)·log|z|` jumps by `4π log x` at `x > 1`.

*Needs:* §§4.1–4.7, 5.1.

### 5.3 Sixfold symmetry, conjugation and the real axis

References: [Z07] Part I §3, (3), p. 11 (the six symmetries) and p. 10 (conjugation); [O93] §4.1, (31), p. 59 and (33), p. 60 (the same relations for `P₂` on `ℙ¹(ℂ)`). Built on §§3.3, 4.6, 5.2.

Prove reflection symmetry (`D(1 − z) = −D(z)`), inversion symmetry (`D(1/z) = −D(z)`), conjugation symmetry (`D(z̄) = −D(z)`) and vanishing on the real axis (`D(x) = 0` for every real `x`), each for **every** `z ∈ ℂ` with Lean's conventions `(D(1/0) = D(0) = 0 = −D(0), D(1 − 1) = D(0) = −D(1))`. Derive the sixfold symmetry:

```text
D(z) = D(1 − 1/z) = D(1/(1 − z)) = −D(1/z) = −D(1 − z) = −D(z/(z − 1))     for every z ∈ ℂ.
```

The reflection identity `D(z) + D(1 − z) = 0` is the imaginary part of Euler's reflection of §3.3, which holds for all `z: Im(Log z·Log(1 − z)) = log|z|·Arg(1 − z) + Arg z·log|1 − z|`, and these are exactly the two corrections. Inversion is §4.6 at `n = 2`, conjugation is §4.6 at `n = 2`, and the real axis follows from conjugation. The six identities are the orbit of the two generators `z ↦ 1 − z` and `z ↦ 1/z`, the anharmonic group of BelyiMaps §5.1, with the sign of the permutation they induce on `{0, 1, ∞}`.

**Checks.**
- `D(1/2) = D(−1) = D(2) = 0`.
- `D(−i) = −D(i)` while `D(1 − 1/i) = D(1 + i) = D(i)` and `D(1/(1 − i)) = D((1 + i)/2) = D(i)`.
- The signs follow the parity of the permutation of `{0, 1, ∞}: z ↦ 1 − 1/z` is a 3-cycle (sign `+`), `z ↦ 1 − z` a transposition (sign −).

*Needs:* §§3.3, 4.6, 5.2; BelyiMaps §5.1.

### 5.4 The Bloch–Wigner one-form

References: [G00] §4, item 1, Lemma 4.2, (29), pp. 17–18 (the differential of the weight-two function as `log|z| d arg(1 − z) − log|1 − z| d arg z`); [Z07] Part I §3, p. 10 (real analyticity off 0, 1). Built on §§4.4–4.5, 5.2.

Prove the Bloch–Wigner one-form formula: for every `z ∉ {0, 1}`, `D` is real differentiable at `z` and for every `v ∈ ℂ`

```text
dD(z)[v] = −log|z|·Im(v/(1 − z)) − log|1 − z|·Im(v/z),
```

including the cut points `x > 1`. Equivalently, prove the one-form identity `dD = η(z, 1 − z) = log|z|·d Arg(1 − z) − log|1 − z|·d Arg z` on any open set of `U` where branches of the arguments are chosen. This is the `n = 2` case of §4.5 with `Li₀ = z/(1 − z)` and `Li₁ = −Log(1 − z)`; on a neighbourhood of a cut point it is the derivative of the local branch expression, never the extension of a derivative from equality of boundary values.

**Checks.**
- `z = i, v = 1: dD = −log|1 − i|·Im(1/i) = (log 2)/2`; `z = i, v = i: dD = 0`.
- `z = 2: dD(2)[v] = −log 2·Im(v/(−1)) = log 2·Im v`, a nonzero transverse derivative at a point of the cut.
- At `z = −1.5 + 0.2i` and `z = 0.3 + 0.7i` the formula agrees with central difference quotients; replacing `Im` by `Re` in either term fails.

*Needs:* §§4.4–4.5, 5.2.

### 5.5 The Laplacian

References: the formula is derived by differentiating the one-form of [G00] (29), p. 18; it is not a separately numbered statement of a source. Built on §§4.4, 5.4 and Mathlib `Laplacian.laplacian`.

Prove `laplacian_blochWigner`: for every `z ∉ {0, 1}`, with the Euclidean Laplacian `∂²/∂x² + ∂²/∂y²` on `ℂ ≅ ℝ²`,

```text
ΔD(z) = −2·Im z / (|z|²·|1 − z|²).
```

Write `dD = log|z|·dθ₁ − log|1 − z|·dθ₀` with `θ₀ = Arg z, θ₁ = Arg(1 − z)` locally; the `θ`'s are harmonic, `∇log|z| = (x, y)/|z|², ∇log|1 − z| = (x − 1, y)/|1 − z|², ∇θ₀ = (−y, x)/|z|²` and `∇θ₁ = (−y, x − 1)/|1 − z|²`, so `ΔD = ∇log|z|·∇θ₁ − ∇log|1 − z|·∇θ₀ = −2y/(|z|²|1 − z|²)`. Real analyticity (§4.4) makes the second derivatives legitimate across the cut. Consequently `D` is strictly superharmonic on the upper half-plane and strictly subharmonic on the lower one.

The Laplacian headline is `laplacian_blochWigner` in `Suggested.lean`.

**Checks.**
- `ΔD(i) = −2/(1·2) = −1`.
- On the real axis `x ∉ {0, 1}, ΔD = 0` while the transverse first derivative can be nonzero (at `x = 2` it is `log 2`, §5.4).
- At `z = 0.3 + 0.7i, ΔD = −1.4/(0.58·0.98) ≈ −2.463`, agreeing with a five-point difference quotient.

*Needs:* §§4.4, 5.4.

### 5.6 Strict positivity on the upper half-plane

References: [Z07] Part I §3, p. 10 (the level curves in the upper half-plane and `D(z̄) = −D(z)`); the proof by the minimum principle is this roadmap's. Built on §§4.7, 5.2, 5.3, 5.5 and Tau Ceti `TauCeti.ge_of_laplacian_nonpos_ge_frontier`, `TauCeti.eqOn_const_of_laplacian_nonpos_of_isMinOn`.

Prove `blochWigner_pos`: `D(z) > 0` whenever `Im z > 0`, and strict negativity on the lower half-plane: `D(z) < 0` whenever `Im z < 0`. Let `ε > 0`. By continuity at `∞` (§4.7) choose `R > 1` with `|D| ≤ ε` on `|z| ≥ R`. Apply the weak minimum principle on the compact half-disc `K_R = {|z| ≤ R, Im z ≥ 0}`: `D` is continuous on `K_R` (including at 0 and 1, which lie on its boundary), `C²` with `ΔD < 0` on its interior (§§4.4, 5.5), `D = 0` on the diameter (§5.3) and `D ≥ −ε` on the arc, so `D ≥ −ε` on `K_R`. Letting `R → ∞` and `ε → 0` gives `D ≥ 0` on the upper half-plane `H`. If `D(z₀) = 0` for some `z₀ ∈ H`, then `z₀` is a minimum of `D` on the open connected set `H`, so the strong minimum principle makes `D` constant on `H`, contradicting `ΔD < 0` there. The lower half-plane follows by conjugation. No hyperbolic-volume interpretation is used.

Strict positivity is stated as `blochWigner_pos` in `Suggested.lean`.

**Checks.**
- `D(i) > 0` and `D(−i) < 0`; `D(e^{iπ/3}) = 1.0149…` is the maximum recorded in [Z07] p. 10, and is positive.
- The hypotheses of the weak principle are checked on the bounded set `K_R` before passing to the unbounded `H`: continuity on `K_R` uses §4.7 at 0 and 1, where `D` is not differentiable.
- On the real axis `D = 0`, so "`D > 0` for `Im z ≥ 0`" is false: the strict inequality needs `Im z > 0`.

*Needs:* §§4.4, 4.7, 5.2, 5.3, 5.5; Tau Ceti minimum principles.

### 5.7 The five-term relation

References: [O93] §4.1, (34), p. 60 (the alternating form, for `(x, y) ∈ ℙ¹(ℂ)²` other than `(0,0), (1,1), (∞,∞)`) and (32), p. 59 (the Abel form, for `(x, y)` other than `(0,1), (1,0), (∞,∞)`); [Z07] Part I §3, (4), p. 11 (the cyclic form) and Part I §2, p. 9 (the cyclic structure `1 − zₙ = z_{n−2}z_{n+2}` of its five arguments); [GR] §1.1, (3)–(4) and footnote 1, pp. 3–4 (the cyclic form in brackets and its equivalence with an alternating form). Built on §§4.7, 5.3, 5.4 and Mathlib `Set.Countable.isPathConnected_compl_of_one_lt_rank`, `IsOpen.exists_is_const_of_fderiv_eq_zero`.

Prove `blochWigner_fiveTerm`: for `x, y ∈ ℂ` with `x ≠ 0` and `y ≠ 0`,

```text
D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 − x)/(1 − y)) = 0.
```

With Lean's conventions these two hypotheses are exactly what is needed: at `x = 1`, at `y = 1` and at `x = y` every term is defined and the identity holds (at `x = y` it reads `D(1) = 0`), while at `x = 0` the totalised value `0⁻¹ = 0` replaces `∞` and the left side becomes `D(y)`, which is nonzero off the real axis. Prove the Abel form: for **all** `x, y ∈ ℂ`,

```text
D(xy/((1 − x)(1 − y))) = D(y/(1 − x)) + D(x/(1 − y)) − D(x) − D(y),
```

and the cyclic form: for `x, y ∈ ℂ` with `xy ≠ 1`,

```text
D(x) + D(y) + D((1 − x)/(1 − xy)) + D(1 − xy) + D((1 − y)/(1 − xy)) = 0.
```

Proof of the cyclic form for `x, y` in the open set `W` where all five arguments lie in `U`: order them as `z₁ = x, z₂ = (1 − x)/(1 − xy), z₃ = (1 − y)/(1 − xy), z₄ = y, z₅ = 1 − xy`; clearing denominators gives `1 − zₙ = z_{n−1}z_{n+1}` (indices `mod 5`). By §5.4, `dD(zₙ) = η(zₙ, 1 − zₙ) = η(zₙ, z_{n−1}) + η(zₙ, z_{n+1})`, by bilinearity of `η` in products; summing over `n`, the two families cancel by antisymmetry of `η`. So the sum has zero derivative on `W`; for fixed `y` the admissible `x` form `ℂ` minus finitely many points, which is connected, so the sum is constant in `x`; letting `x → 0` and using continuity (§4.7) the sum tends to `D(y) + D(1 − y) + 2D(1) + D(0) = 0` (§5.3). Extend to all `x, y` with `xy ≠ 1` by continuity. The alternating and Abel forms follow from the cyclic one by the sixfold symmetry (§5.3); the degenerate cases are checked directly with `D(0) = D(1) = 0` and `D(1/(1 − y)) = D(y)`.

The affine five-term headline is `blochWigner_fiveTerm` in `Suggested.lean`.

**Checks.**
- `x = i, y = −1`: the alternating form reads `2D(i) − 2D((1 + i)/2) = 0`, so `D((1 + i)/2) = D(i)`, consistent with §5.3.
- `x = i/2, y = (1 + i)/2`: the five arguments of the alternating form are `i/2, (1 + i)/2, 1 − i, 2 − i` and `(3 + i)/2`, with signs `+, −, +, −, +`; no term is replaced by its conjugate.
- `x = y`: the alternating form holds trivially; `x = 0` with `y = 0.3 + 0.8i`: the left side computed with Lean's `0⁻¹ = 0` is `D(0.3 + 0.8i) ≈ 0.995`, so the hypothesis `x ≠ 0` cannot be dropped.
- The Abel form at `x = 1, y = i`: both sides are 0, since `D(1/(1 − i)) = D(i)`.

*Needs:* §§4.7, 5.3, 5.4; Mathlib `Set.Countable.isPathConnected_compl_of_one_lt_rank`, `IsOpen.exists_is_const_of_fderiv_eq_zero`.

### 5.8 Cross-ratios and the projective forms

References: [O93] §4.1, (35)–(38), p. 60 (the birapport, the function `P̃₂(a, b, c, d) = P₂(r(a, b, c, d))`, its alternating behaviour under permutations, PGL₂-invariance and the five-point relation); [Z07] Part I §3, (5)–(6), p. 11 (`D̃` and the alternating sum over five points of `ℙ¹(ℂ)`); [GR] §1.1, (3)–(4) and footnote 1, p. 4 (the cyclic bracket form). Built on §§5.3, 5.7.

**The cross-ratio.** Define `crossRatio : ℂ → ℂ → ℂ → ℂ → ℂ`, written `r(a, b, c, d) = (a − c)(b − d)/((a − d)(b − c))`. The basic theory to develop comprises `crossRatio_swap` (`r(b, a, d, c) = r(a, b, c, d)`, invariance under the product of two disjoint transpositions), `crossRatio_zero_one` (`r(a, 0, 1, z) = z(a − 1)/(a − z)` for `a ≠ z`, whose limit as `a → ∞` is `z`) and `crossRatioSphere` (over any field `K`, the extension to `OnePoint K` by the finite expression and four one-infinity cancellation formulas below; set it to 0 when two or more entries are infinity, outside the distinct-tuple locus). Write `D̃(a, b, c, d) = D(r(a, b, c, d))`, Zagier's notation.

The projective five-term headline in `Suggested.lean` is `blochWignerSphere_crossRatio_fiveTerm`, with all five points on `OnePoint ℂ`. The sphere cross-ratio definition `crossRatioSphere` is field-general.

**Checks.**
- `r(∞, 0, 1, z) = z`; the Goncharov–Rudenko bracket of the same tuple is `[∞, 0, 1, z] = 1 − z`, and a cross-ratio normalised by `cr(0, ∞, 1, z) = z` gives `1/z` on `(∞, 0, 1, z)`.
- Coincidences give `r(a, b, a, d) = 0`. If the denominator is nonzero, `r(a, a, c, d) = r(a, b, c, c) = 1`; if the denominator vanishes, Lean instead gives 0. In particular `r(0, 0, 1, 2) = 1` but `r(0, 0, 0, 2) = 0`, a negative control for the missing hypothesis. If `a = d` and `b, c, a` are otherwise distinct, the projective cancellation limit is `∞` while the finite Lean expression is 0. `D` vanishes at 0, 1 and `∞`, so its degenerate values still agree; the projective theorems below assume distinct points.
- `D(r(σa, σb, σc, σd)) = sign(σ)·D(r(a, b, c, d))` for every permutation `σ` of four distinct points ([O93] (36)); for `σ = (a b)` the sign is −1.

**Projective normalization and invariance.** From [O93] §4.1, (35)–(38), p. 60, prove the elementary coordinate prerequisites over every field `K`. Use Mathlib's `GL (Fin 2) K` action on `OnePoint K` and `OnePoint.equivProjectivization_smul` (`Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean`, lines 124–129). Prove agreement with the finite expression (agreement with the finite formula), and the four one-infinity cancellation formulas:

```text
r(∞,b,c,d) = (b−d)/(b−c),     r(a,∞,c,d) = (a−c)/(a−d),
r(a,b,∞,d) = (b−d)/(a−d),     r(a,b,c,∞) = (a−c)/(b−c).
```

Prove the homogeneous determinant formula: for an injective four-tuple with nonzero homogeneous representatives `vᵢ`, this value is `Δ(v₀,v₂)Δ(v₁,v₃)/(Δ(v₀,v₃)Δ(v₁,v₂))`, where `Δ(v,w) = v₀w₁−v₁w₀`; all rescaling factors cancel. Prove Möbius invariance: every `g : GL (Fin 2) K` preserves the cross-ratio of an injective four-tuple, by determinant covariance. Prove `normalize_five`: for every injective `s : Fin 5 → OnePoint K` there exist `g : GL (Fin 2) K` and `x,y : K` with `x,y ∉ {0,1}`, `x ≠ y`, and `g • s = (∞,0,1,x,y)` pointwise. Construct the map using representatives of the first three points, whose pairwise determinants are nonzero. This field-general algebra supplies the complex projective proof and the downstream projective-coordinate APIs under the bracket translation `1−r` on distinct tuples. Symbol complexes and scalar-to-group descent belong to the consumers listed below.

**Checks.**
- Over `ℚ`, `r(∞,0,1,3) = 3` and `r(0,∞,1,3) = 1/3`, a paired cancellation test for `crossRatioSphere`.
- Over `ZMod 3`, the coordinate swap `g = [[0,1],[1,0]]` sends `(∞,0,1,2)` to `(0,∞,1,2)`; both cross-ratios are 2. This tests Mathlib's action on `OnePoint (ZMod 3)`, including the pole at 0.
- Over `ℚ`, rescale the homogeneous representatives of `(∞,0,1,3)` to `(2,0),(0,3),(5,5),(21,7)`. The determinant quotient is `10·(−63)/(14·(−15)) = 3`, so independent rescaling preserves the value.
- The identity matrix already normalizes `(∞,0,1,x,y)` when `x,y ∉ {0,1}`, `x ≠ y`; no map can send a coincident first pair to the distinct points `∞,0`, so injectivity is essential.
- On distinct tuples the homogeneous bracket `Δ(v₀,v₁)Δ(v₂,v₃)/(Δ(v₀,v₃)Δ(v₂,v₁))` equals `1−r`; the equality need not survive totalised coincident tuples.

Prove the finite-coordinate projective relation: for five pairwise distinct points `s₀, …, s₄` of `ℂ`,

```text
∑_{j=0}^{4} (−1)^j D(r(s₀, …, ŝⱼ, …, s₄)) = 0,
```

and `blochWignerSphere_crossRatio_fiveTerm`: the same for five distinct points of `OnePoint ℂ` with the sphere cross-ratio. For the D-valued identities use Möbius invariance and `normalize_five` above, then the four cancellation formulas reduce the normalized tuple to §5.7. The finite theorem follows by restriction. Prove the cyclic bracket relation: for five distinct points `x₁, …, x₅, ∑_{i ∈ ℤ/5} D([xᵢ, xᵢ₊₁, xᵢ₊₂, xᵢ₊₃]) = 0`, translating by `[a, b, c, d] = 1 − r(a, b, c, d)` and the sixfold symmetry; writing `bᵢ = [xᵢ, xᵢ₊₁, xᵢ₊₂, xᵢ₊₃]`, direct cancellation gives `1 − bᵢ = −bᵢ/(bᵢ₊₂bᵢ₊₃)`. These are coordinate identities for values of `D`; no configuration complex, regulator or group-descent statement is inferred from them.

**Checks.**
- For `(s₀, …, s₄) = (∞, 0, 1, x, y)` the projective relation is the alternating form of §5.7.
- Replacing `r` by the bracket `[a, b, c, d] = 1 − r` in the alternating sum replaces each term by its negative (`D(1 − w) = −D(w)`), so that sum still vanishes; the cyclic bracket sum is a different identity, equivalent to it by footnote 1 of [GR], p. 4.
- Non-example: the sum of the five values `D(r(s₀, …, ŝⱼ, …, s₄))` without the alternating signs is not zero in general (about 2.85526 for the ordered tuple `(0, 1, 2, i, 1 + i)`), so the signs are part of the statement.

*Needs:* §§5.3, 5.7; Mathlib `OnePoint.equivProjectivization_smul` and the `GL (Fin 2) K` action; first the finite/cancellation and homogeneous comparison targets, then Möbius invariance and `normalize_five` above, then the projective five-term identities.

### Examples

`D(i) = G` (Catalan's constant), `D((1 + i)/2) = D(1 + i) = D(i)` by sixfold symmetry and by the five-term relation at `(x, y) = (i, −1)`; `D(e^{iπ/3}) = 1.0149…` is the maximum. At `z = 2` the function vanishes and has transverse derivative `log 2·Im v`.

### Dependencies

Layers 1–4; Tau Ceti's weak and strong minimum principles; Mathlib's Laplacian, path connectedness of cofinite subsets of `ℂ` and zero-derivative constancy.

## Layer 6: the Rogers dilogarithm

This layer constructs the real Rogers function on `[0, 1]`, with endpoint values 0 and `π²/6`, and proves its regularity, derivative and monotonicity, the reflection and the exact interval pentagon, and its special values. On the closed unit interval these identities hold exactly in `ℝ`, with no reduction modulo a multiple of `π²`.

Standing assumptions for this layer: `x, y` are real; `R = rogers`; `ρ = (√5 − 1)/2`, so `0 < ρ < 1` and `ρ² = 1 − ρ`.

### 6.1 The interval Rogers dilogarithm

References: [Z07] Part II §1.A, p. 23 (the definition `L(x) = Li₂(x) + (1/2) log x log(1 − x)` on `(0, 1), L(0) = 0, L(1) = π²/6`, monotonicity and continuity, the reflection and the five-term equation) and p. 24 (`L(1/2) = π²/12` and `L((3 − √5)/2) = π²/15`). Built on §§1.1, 3.6.

**The Rogers dilogarithm.** Define `rogers : ℝ → ℝ` by `R(x) = Re Li₂(x) + (1/2)·log x·log(1 − x)` for `x ∈ (0, 1), R(0) = 0` and `R(1) = π²/6`. On `(0, 1)` the principal `Li₂(x)` is real (§1.6), so `R(x) = Li₂(x) + (1/2) log x log(1 − x)` there. The object is the restriction to `[0, 1]`; the values of the total expression off `[0, 1]` carry no theorem, and Zagier's extension of `L` to `ℝ` and to `ℙ¹(ℝ)` modulo `π²/2` ([Z07] Part II §1.A, p. 23) is not constructed here.

The basic theory to develop comprises the defining formula (the displayed expression on `(0, 1)`), the value at 0 and the value at 1 (simp), the complex-valued comparison (on `(0, 1), (R(x) : ℂ) = Li₂(x) + (1/2) log x log(1 − x)`, since `Im Li₂(x) = 0`), `continuousOn_rogers` and `strictMonoOn_rogers` (§6.2), and the interval range bound (`R` maps `[0, 1]` into `[0, π²/6]`).

**Checks.**
- `R(0) = 0` and `R(1) = π²/6` (the value at 0, the value at 1); a unit-normalised Rogers function with `R(1) = 1` fails the second.
- `R(1/2) = π²/12`, while `Li₂(1/2) = π²/12 − (log 2)²/2`: the logarithmic correction is not zero. Directly from the definition, `R(1/2) = Re Li₂(1/2) + (log 2)²/2`.
- `R(ρ) = π²/10` and `R(ρ²) = π²/15` (§6.5).
- `R′(1/2) = 2 log 2 > 0` (§6.2).

*Needs:* §§1.1, 1.6, 3.6.

### 6.2 Regularity, derivative and monotonicity

References: [Z07] Part II §1.A, p. 23 (monotone, continuous, analytic except at 0 and 1, and `L′(x) = −log(1 − x)/(2x) − log x/(2(1 − x))`). Built on §§1.5, 1.7, 6.1.

Prove `hasDerivAt_rogers`: for `x ∈ (0, 1)`, `R′(x) = −(1/2)(log(1 − x)/x + log x/(1 − x))`, from `Li₂′(x) = −log(1 − x)/x` (§1.5) and the derivative of the logarithmic product. Prove `analyticOnNhd_rogers` on `(0, 1)`, `continuousOn_rogers` on `[0, 1]` (the products `log x·log(1 − x)` tend to 0 at both endpoints, and `Li₂` is continuous on the closed disc by §1.7) and `strictMonoOn_rogers` on `[0, 1]` (both logarithms are negative on `(0, 1)`, so `R′ > 0`; apply the mean value theorem and pass to the endpoints).

**Checks.**
- `R′(1/2) = −(1/2)(2 log(1/2) + 2 log(1/2)) = 2 log 2`.
- `R′(x) = R′(1 − x)`: the derivative is symmetric about `1/2`, as reflection requires.
- `R′(x) → +∞` as `x → 0+` and as `x → 1−`: `not_differentiableAt_rogers_zero` and `not_differentiableAt_rogers_one` state that `R` is not differentiable at those endpoints.

*Needs:* §§1.5, 1.7, 6.1.

### 6.3 Rogers reflection

References: [Z07] Part II §1.A, p. 23 (`L(x) + L(1 − x) = L(1)`); [O93] §4.1, (29), p. 59 (Euler reflection). Built on §§3.3, 6.2.

Prove Rogers reflection: for every `x ∈ [0, 1], R(x) + R(1 − x) = π²/6`. On `(0, 1)` add the two logarithmic corrections, `(1/2)log x log(1 − x) + (1/2)log(1 − x) log x = log x log(1 − x)`, to Euler's reflection of §3.3; the products cancel exactly. At `x = 0` and `x = 1` it is `R(0) + R(1) = π²/6`.

**Checks.**
- `x = 1/2` gives `R(1/2) = π²/12`.
- `x = ρ` gives `R(ρ) + R(ρ²) = π²/6`, since `1 − ρ = ρ²`.
- `x = 0` is the endpoint identity `0 + π²/6 = π²/6` (degenerate case).

*Needs:* §§3.3, 6.1, 6.2.

### 6.4 The exact interval pentagon

References: [Z07] Part II §1.A, p. 23 (the five-term equation for `L`, whose right-hand side is `3L(1)` when `0 < x, y < 1`); [O93] §4.1, (30), p. 59 (Abel's identity, from which the interval form follows). Built on §§6.2, 6.3.

Prove `rogers_pentagon`: for `x, y ∈ (0, 1)`,

```text
R(x) + R(y) = R(xy) + R( x(1 − y)/(1 − xy) ) + R( y(1 − x)/(1 − xy) ),
```

an equality in `ℝ` with no reduction modulo `π²` and no additive constant. First check that every argument on the right lies in `(0, 1): 0 < xy < 1`, and `x(1 − y)/(1 − xy) < 1` is equivalent to `x < 1`. Differentiate the difference of the two sides in `x` for fixed `y` with §6.2; the derivative vanishes by real identities among logarithms of the positive quantities `x, y, 1 − x, 1 − y` and `1 − xy`. The square `(0, 1)²` is connected; letting `x → 0` the difference tends to `R(0) + R(y) − R(0) − R(0) − R(y) = 0`. With reflection (§6.3) the statement is equivalent to Zagier's form `R(x) + R(y) + R((1 − x)/(1 − xy)) + R(1 − xy) + R((1 − y)/(1 − xy)) = π²/2` on `(0, 1)²`.

The exact interval pentagon is stated as `rogers_pentagon` in `Suggested.lean`.

**Checks.**
- `x = y = ρ`: the three arguments on the right are `ρ², ρ/(1 + ρ) = ρ²` and `ρ²`, so `2R(ρ) = 3R(ρ²)`.
- `x = y = 1/2`: the right-hand arguments are `1/4, 1/3` and `1/3`, so `R(1/4) + 2R(1/3) = 2R(1/2) = π²/6`.
- Without the logarithmic correction (`Li₂` in place of `R`) the pentagon fails at `x = y = 1/2`: the left side minus the right side is then `log²(3/2) ≠ 0`.

*Needs:* §§6.2, 6.3.

### 6.5 Midpoint and golden-ratio values

References: [Z07] Part II §1.A, p. 24 (`L(1/2) = π²/12, L((3 − √5)/2) = π²/15`) and Part I §1, p. 7 (the corresponding values of `Li₂`). Built on §§6.3, 6.4.

Prove the midpoint value (`R(1/2) = π²/12`) and `rogers_golden` (`R(ρ) = π²/10` and `R(ρ²) = π²/15`). Reflection fixes the midpoint; at `x = y = ρ` the pentagon gives `2R(ρ) = 3R(ρ²)` and reflection gives `R(ρ) + R(ρ²) = π²/6`; solve the two linear equations. Prove the golden-ratio dilogarithm values by translating back through §6.1: `Li₂(ρ) = π²/10 − log²ρ` and `Li₂(ρ²) = π²/15 − log²ρ`, as equalities in `ℂ` with zero imaginary part. The same logarithmic correction occurs in both because `log(ρ²) = 2logρ`.

The golden-ratio evaluation is stated as `rogers_golden` in `Suggested.lean`.

**Checks.**
- `R(ρ) = π²/10 > π²/12 = R(1/2)`, as strict monotonicity requires since `ρ > 1/2`; `R(ρ²) = π²/15 < π²/12` since `ρ² < 1/2`.
- The two values sum to `π²/6`.
- `R(ρ²)/R(ρ) = 2/3`, the ratio forced by the pentagon.
- With `φ = 1/ρ = (1 + √5)/2, Li₂(ρ) = π²/10 − log²φ` and `Li₂(ρ²) = π²/15 − log²φ`, the form in [Z07] Part I §1, p. 7; a sign error in the Rogers correction would give `+log²φ`.

*Needs:* §§1.6, 6.1, 6.3, 6.4.

### Examples

The golden ratio is the fixed point of the pentagon: at `x = y = ρ` all three right-hand arguments coincide, and the two linear equations give `R(ρ) = π²/10, R(ρ²) = π²/15`. The midpoint `R(1/2) = π²/12` is the reflection-symmetric point.

### Dependencies

Layers 1 and 3; Mathlib's real logarithm and mean value theorem.

## Layer 7: analytic estimates

This layer exports quantitative bounds: truncation of the disc series, uniform tails on the closed disc and the circle, growth of every continued branch in sectors, moduli of continuity of `Lₙ` at its three special points, bounds for every real derivative on compact subsets of `U`, the logarithmic behaviour of `D` at its punctures, and global bounds. They are analytic inequalities for evaluations at arbitrary complex numbers; no arithmetic certificate type is constructed.

Standing assumptions for this layer: `n, N` are natural numbers or integers as each statement says; `S_N(z) = ∑_{k=1}^{N} z^k/k^n`; `r` is real with `0 ≤ r < 1`.

### 7.1 Truncation of the disc series

References: [O93] §1.1, (1), p. 50 (the series); the inequalities are derived here by termwise estimates. Built on §§1.3, 1.4.

Prove the geometric truncation bound: for natural `n ≥ 1, N ≥ 0, 0 ≤ r < 1` and `|z| ≤ r`,

```text
|Liₙ(z) − S_N(z)| ≤ r^{N+1} / ((N + 1)^n (1 − r)),
```

bounding `k^{−n}` by `(N + 1)^{−n}` for `k > N` and summing the geometric tail. Prove `norm_polylog_sub_partialSum_le_of_nonpos`: for `n ≤ 0` the tail is bounded by `∑_{k>N} k^{−n} r^k`, which equals `(r d/dr)^{−n}` applied to `r^{N+1}/(1 − r)`, an explicit rational function of `r` (continuous at `r = 0`); for `n = −1` it is `r^{N+1}((N + 1) − N r)/(1 − r)²`.

**Checks.**
- `n = 2, z = 1/2, N = 1`: the bound is `(1/4)/(4·(1/2)) = 1/8`, and the actual error `|Li₂(1/2) − 1/2| ≈ 0.0822`.
- `N = 0` gives `|Liₙ(z)| ≤ r/(1 − r)` (degenerate case).
- The positive-weight bound is not valid for `n = −1`: it would give `(N + 1)r^{N+1}/(1 − r)`, which is smaller than the true tail `r^{N+1}((N + 1) − N r)/(1 − r)²` for every `r ∈ (0, 1)`.

*Needs:* §§1.3, 1.4.

### 7.2 Closed-disc and Fourier tails

References: [Z07] Part I §3, p. 11 (the Fourier series of `D` on the circle); [O93] §1.4, p. 51 (finite boundary values for `k ≥ 2`). The bound is the integral comparison for `∑ k^{−n}`. Built on §§1.7, 4.2, 5.1.

Prove the uniform closed-disc truncation bound: for `n ≥ 2, N ≥ 1` and `|z| ≤ 1, |Liₙ(z) − S_N(z)| ≤ N^{1−n}/(n − 1)`, since `∑_{k>N} k^{−n} ≤ ∫_N^∞ t^{−n} dt`. Prove `abs_singleValued_exp_sub_le`: on the unit circle the same bound holds for `Lₙ(e^{it})` and the parity projection of `S_N(e^{it})` (the projections have norm one and `log|z| = 0`). Prove `abs_blochWigner_exp_sub_le`: for `N ≥ 1` and every real `t, |D(e^{it}) − ∑_{k=1}^{N} sin(kt)/k²| ≤ 1/N`.

**Checks.**
- At `n = 2` the exponent is `N^{−1}`; no uniform absolute boundary series is claimed for `n = 1`.
- For `t = 1` and `N = 20` the actual error of the `D` series is about `2·10^{−5}`, far below the bound `1/20`.
- `N = 1` gives `|D(e^{it}) − sin t| ≤ 1`.

*Needs:* §§1.7, 4.2, 5.1.

### 7.3 Sectorial growth of every branch

References: [O93] §2.2, Corollaries 1–2, p. 53 (every determination near 0 or `∞` in a sector is dominated by `log^{k−1}|z|`, respectively `log^k|z|`, and has a limit at 1 differing from `ζ(k)` by an integer multiple of `(2πi)^k/(k−1)!`); [O93] §1.3, (7), p. 51 (the principal growth at `∞`). Built on §§1.3, 1.7, 2.3, 3.2.

Let `A` be an open angular sector with vertex 0, 1 or `∞` and `s` a continuous section of the universal cover over `A ∩ {0 < |z − vertex| < δ}` (for `∞`, over `A ∩ {|z| > 1/δ}`). Prove `polylogBranch_isBigO_zero`: for `n ≥ 1`, `Liₙ^[s(z)] = O(1 + |log|z||^{n−1})` as `z → 0` in `A`, and the principal branch improves to `O(|z|)`. Prove `polylogBranch_isBigO_infty`: `Liₙ^[s(z)] = O(1 + log^n|z|)` as `z → ∞` in `A`. Prove `polylogBranch_tendsto_one`: for `n ≥ 2`, `Liₙ^[s(z)]` has a limit as `z → 1` in `A`, equal to `ζ(n) + m·(2πi)^n/(n − 1)!` for some integer `m` depending on the section; for `n = 1` the branch has a logarithmic singularity and no finite limit. The constants depend on `n`, the sector and the section. Expand the section's branch by the monodromy of §2.3: it differs from the principal one by a polynomial of degree at most `n − 1` in a continued logarithm, with coefficients in the lattice generated by the periods; combine with the principal small-disc estimate (§7.1), the inversion polynomial at `∞` (§3.2) and `Log z → 2πij` near 1 on the chosen section. Nonpositive weights have the exact rational behaviour of §1.4.

The growth and period-lattice limits apply to arbitrary continuous determinations on punctured sectors of opening `2·width` with `0 < width < π` and radius less than `1/2`; translation by 1 and inversion give the charts at 1 and `∞`.

**Checks.**
- After `T₁` the branch of `Li₂` near 0 is `Li₂(z) − 2πi Log z`, which is `O(|log|z||)` but not `O(|z|)`: "every branch is `O(z)` at 0" is false.
- The principal `Liₙ` tends to 0 at 0 in every sector.
- For `n = 2` the possible limits at 1 are `ζ(2) + m(2πi)² = π²/6 − 4π²m`.

*Needs:* §§1.3, 1.7, 2.3, 3.2, 7.1.

### 7.4 Moduli of `Lₙ` at 0, 1 and `∞`

References: [Z90] §7, p. 414 (continuity at `0, ∞` and 1 from the Bernoulli formula and inversion); [O93] §§1.3–1.4, p. 51, and §3, pp. 57–58 (the logarithmic behaviour and the single-valued differential). The rates are derived here. Built on §§4.5–4.7, 7.1.

Prove the small-argument bound: for `n ≥ 2` there is `Cₙ > 0` with `|Lₙ(z)| ≤ Cₙ|z|(1 + |log|z||^{n−1})` for `0 < |z| ≤ 1/2`. Prove `exists_abs_singleValued_le_of_two_le_norm`: `|Lₙ(z)| ≤ Cₙ|z|^{−1}(1 + log^{n−1}|z|)` for `|z| ≥ 2`. Prove the modulus at 1: there is `Aₙ > 0` with `|Lₙ(z) − Lₙ(1)| ≤ Aₙ|z − 1|(1 + |log|z − 1||)` for `0 < |z − 1| ≤ 1/2`. All three are uniform in direction, including across the cut. Use `|Liⱼ(z)| ≤ 2|z|` on `|z| ≤ 1/2` for `j ≥ 1` and the finite sum of `|cₖ|`; invert for large `z` by §4.6; near 1 bound the differential of §4.5 by `O(1 + |log ρ|)` with `ρ = |z − 1|` and integrate along radial segments from 1 in each half-neighbourhood. Inversion gives the estimate at `∞`.

**Checks.**
- The bounds force `Lₙ → 0` at 0 and `∞` and keep `L₃(1) = ζ(3)`.
- For `D`, the modulus at 1 is attained up to constants: `D(1 + it) ~ −t log|t|` (by §7.6 and `D(1 − z) = −D(z)`).
- The weight-three statement of §4.8 (derivative 0 at 1) is stronger than this common modulus.

*Needs:* §§4.5–4.7, 7.1.

### 7.5 Bounds for every real derivative on compact sets

References: [O93] §2.1, p. 52 (holomorphic determinations on simply connected sets) and §3.2, p. 57 (real analyticity of `Pₖ`). Built on §§2.2, 4.4, 4.5.

Prove `exists_norm_iteratedFDeriv_singleValued_le`: for `n ≥ 2`, every compact `K ⊂ U` and every `r ∈ ℕ`, the r-th real Fréchet derivative of `Lₙ` is bounded on `K`; the same for `D`. Prove `lipschitzOnWith_singleValued`: on each compact convex `K ⊂ U`, `Lₙ` is Lipschitz with the constant `sup_K ‖dLₙ‖`. For a fixed section of the universal cover over an open set `V ⊆ U`, the same statements hold for the branch on compact subsets of `V`. No Lipschitz constant uniform near 0, 1 or `∞` is asserted.

**Checks.**
- A compact set crossing the principal cut, such as the closed disc of radius `1/2` about 2, is admissible for `Lₙ` and `D`.
- No derivative bound for `D` holds on a punctured neighbourhood of 0 (§7.6).
- On a nonconvex compact set the Lipschitz statement needs a path-length bound and is not asserted.

*Needs:* §§2.2, 4.4, 4.5.

### 7.6 The logarithmic singularities of `D`

References: [Z07] Part I §3, p. 10 (`D` is continuous but not differentiable at 0 and 1, with singularities of type `r log r`); [G95] §1.0, p. 201 (singularities of type `|x| ln |x|` at `0, 1, ∞`). The expansion is derived from the definition. Built on §§1.3, 5.3, 5.4, 7.1.

Prove the two-sided logarithmic expansion: as real `t → 0` with `t ≠ 0`, `D(it) = t(1 − log|t|) + O(|t|³(1 + |log|t||))`. From the series, `Im Li₂(it) = t − t³/9 + O(t⁵)`; from the Taylor expansion of the argument, `Arg(1 − it) = −arctan t = −t + O(t³)`; multiply by `log|it| = log|t|`. Consequently `not_differentiableAt_blochWigner_zero`: `D(it)/t = 1 − log|t| + o(1) → +∞`, so `D` has no real derivative at 0. `not_differentiableAt_blochWigner_one` follows by `D(1 − z) = −D(z)`. By this symmetry and `D(1/z) = −D(z)` (§5.3) the same failure holds at 1 and, in the coordinate `w = 1/z`, at `∞`. This behaviour is specific to weight two: `L₃` is differentiable at 1 (§4.8).

**Checks.**
- The expansion is odd in `t` to leading order, as `D(z̄) = −D(z)` requires.
- Numerically `D(it)/(t(1 − log|t|)) = 0.99999…` at `t = ±10^{−3}`.
- For `L₃` the difference quotient `(L₃(1 + it) − ζ(3))/t` tends to 0, not to `∞`.

*Needs:* §§1.3, 5.3, 5.4, 7.1.

### 7.7 Global bounds and finite sums

References: [Z90] §7, p. 414 (continuity on the compact sphere); [Z07] Part I §3, p. 10 (the maximum of `D`) and Part II §1.A, p. 23 (monotonicity of the Rogers function). Built on §§4.7, 6.2, 7.1–7.4.

Prove `exists_abs_singleValued_le_const`: for `n ≥ 2` there is `Mₙ` with `|Lₙ(z)| ≤ Mₙ` for all `z ∈ ℂ` (a continuous function on the compact sphere); in particular `D` is bounded. Prove the interval range bound (§6.1) from monotonicity and the endpoint values. Prove `abs_sum_singleValued_sub_le`: for a finite family of complex numbers `zⱼ` and real coefficients `aⱼ`, and approximations of each `Lₙ(zⱼ)` by the truncations of §§7.1–7.2 or the endpoint bounds of §7.4, the error of `∑ aⱼLₙ(zⱼ)` is at most `∑ |aⱼ|` times the individual error bounds. Applied under every complex embedding `σ : F → ℂ` of a number field `F`, these bounds impose no condition on `F`.

**Checks.**
- For `D` the optimal constant is the maximum 1.0149… attained at `e^{iπ/3}` ([Z07] Part I §3, p. 10), a fixed point of `z ↦ 1 − 1/z`; the minimum `−1.0149…` is attained at `e^{−iπ/3}`, and `D = 0` on the real axis.
- `R` takes values in `[0, π²/6]` on `[0, 1]`, with both endpoints attained.
- A weighted sum with one coefficient `aⱼ = −3` multiplies that term's error by 3, not by −3.

*Needs:* §§4.7, 6.2, 7.1–7.4.

### Examples

The circle partial sum with `N = 1000` differs from `D(i)` by at most `10^{−3}` (§7.2); the disc partial sums for `Li₂(1/2)` have error at most `1/8` with one term and `2^{−10}/121` with ten (§7.1). The asymptotic of §7.6 shows why no Lipschitz bound for `D` holds near 0.

### Dependencies

Layers 1–6.

## Downstream consumers

These roadmaps take the analytic statements of this roadmap as inputs; none of them supplies an input used here.

- **Polylogarithms** (polylogarithms, explicit regulators and Zagier statements): its regulator and analytic-estimate layer takes `D`, the five-term relations of §5.7–5.8, positivity (§5.6) and the bounds of Layer 7; its higher layers take `Lₙ` in every weight, the real differential (§4.5), conjugation and inversion parity (§4.6) and the odd-weight endpoint convention `Lₙ(1) = ζ(n)` (§4.2). It descends `D` to its algebraic quotients only after the analytic relation is proved here.
- **K3BlochGroups**: keeps the algebraic cross-ratio configurations, Bloch groups and torsion; where it compares with complex embeddings it uses the five-term relations of §§5.7–5.8, the Rogers function of Layer 6 and the cross-ratio dictionary of Conventions.
- **BorelRegulators**: its weight-two coefficient (`D` of Suslin's image divided by `π`) takes `D`, the cross-ratio `r` with `r(∞, 0, 1, z) = z` and the alternating five-term relation for distinct `x, y ∉ {0, 1}`; its higher weights take `Lₙ` and the bounds of §7.7.
- **EllipticRegulators**: takes the Bloch–Wigner one-form `dD = η(z, 1 − z)` (§5.4), continuity of `D` (§5.2), inversion, conjugation and distribution (§§4.6, 5.3) and `Li₂` on the closed disc (§1.7).
- **ArithmeticQuantumTopology**: takes `D` at the shapes of ideal tetrahedra and its sign under conjugation (§§5.1, 5.3, 5.6); the volume interpretation is its own.
- **HabiroNahmSeries**: takes `D` at all complex embeddings of algebraic Nahm solutions (§5.1), its conjugation sign (§5.3), the Rogers values (§6.5) and the finite-sum bounds (§7.7).
- **HabiroNumberFields**: takes the complex five-term identity on an explicit branch domain (§3.4, §3.5) for comparison with its cyclic quantum dilogarithm, which remains its own object.
- **PeriodsAndSpecialValues**: takes the classical analytic realisation `Liₙ, Lₙ` and the zeta endpoint values (§§1.7, 4.2) alongside its multiple-zeta and motivic objects.
- **AnalyticNumberTheoryPartII** §4.1: owns `lerch_transcendent.polylog`, the comparison `Liₙ(z) = z Φ(z,n,1)` for every `n ∈ ℤ` and `‖z‖ < 1`, where `Φ(z,s,c) = ∑_{k≥0} z^k exp(−s Log(k+c))`. Reindexing the series of §1.3 proves the initial equality; at `z = 0` the prefactor gives `Liₙ(0) = 0` although `Φ(0,n,1) = 1`. It also owns continuation of the comparison from matching initial germs along the same paths in `U`, using Layer 2; principal values and lower boundary values agree when the branches match.
- **ColemanIntegration**: its consumer contract assigns the complex analytic construction, closed-disc/distribution/expZeta API and single-valued inversion/distribution/conjugation to this roadmap. L2.Fa obtains `complexPolylog` by restricting §§1.1–1.7 and §3.1: `complexPolylog k z = polylog k z` for `k ≥ 1, ‖z‖ ≤ 1` (the value at `k = 1, z = 1` is totalised); off-disc values of that wrapper carry no analytic contract. L3.Fc.3 obtains `zagierPolylog` from §§4.2–4.7: for `n ≥ 2, z ∉ {0,1}`, it is `(singleValued n z : ℂ)` in odd weight and `Complex.I * singleValued n z` in even weight. Its ordered weight-one root-of-unity boundary series, formal and p-adic functions and arithmetic comparisons are its own targets. L2.Fb transports §5.8's homogeneous comparison, Möbius invariance and `normalize_five` through `OnePoint.equivProjectivization`, with its bracket equal to `1 − crossRatioSphere` on distinct tuples. The symbol constructions, the algebraic field-map API and the Bloch groups are K3BlochGroups §§3.1, 3.3–3.5, and ColemanIntegration consumes them there; what it takes from this roadmap is unchanged: the complex analytic construction, closed-disc, distribution and exponential-zeta API of §§1.1–1.7 and §3.1, the single-valued family of §§4.2–4.7 and the cross-ratio adapter of §5.8. Its scalar-to-group descent and p-adic comparisons are its own targets.

## References

All locators above refer to the following freely readable texts; source statements are translated into the conventions of this roadmap.

- **[O93]** Joseph Oesterlé, *Polylogarithmes*, Séminaire Bourbaki, exposé 762, Astérisque 216 (1993), pp. 49–67. [Numdam](https://www.numdam.org/item/SB_1992-1993__35__49_0.pdf). Used: §1.1–1.4, (1)–(7), pp. 50–51; §2, introduction and §§2.1–2.3 with Proposition 1, (8)–(9), Corollaries 1–2 and (15), pp. 51–54; §§3.1–3.3, (17)–(28), pp. 56–58; §4.1, (29)–(38), pp. 59–60. Accessed 2026-10-20.
- **[Z07]** Don Zagier, *The dilogarithm function*, in Frontiers in Number Theory, Physics, and Geometry II, Springer (2007), pp. 3–65. [Author's copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf). Used: Part I, introduction and §§1–3, pp. 5–12, with (3)–(6) on p. 11; Part II §1.A, pp. 23–24. Accessed 2026-10-20.
- **[Z90]** Don Zagier, *Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields*, in Arithmetic Algebraic Geometry (Texel, 1989), Progress in Mathematics 89, Birkhäuser (1991), pp. 391–430. [Author's copy](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf). Used: §7, pp. 410–414, especially (33)–(36) and Proposition 3, pp. 413–414. Accessed 2026-10-20.
- **[G95]** Alexander B. Goncharov, *Geometry of configurations, polylogarithms, and motivic cohomology*, Advances in Mathematics 114 (1995), pp. 197–318. [Author's copy](https://sasha-goncharov.github.io/Advances1995.pdf). Used: §1.0, (1.1)–(1.2), p. 201 (the recursion and the Bloch–Wigner function on `ℂℙ¹`). Accessed 2026-10-20.
- **[G00]** Alexander B. Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*, [arXiv:math/0003086v1](https://arxiv.org/abs/math/0003086v1) (2000). Used: §4, item 1, Proposition 4.1, (28) and Lemma 4.2, (29)–(32), pp. 17–18 (the differential equations of the single-valued functions). Accessed 2026-10-20.
- **[GR]** Alexander Goncharov and Daniil Rudenko, *Motivic correlators, cluster varieties and Zagier's conjecture on `ζ_F(4)`*, [arXiv:1803.08585v5](https://arxiv.org/abs/1803.08585v5). Used: §1.1, item 1, (1)–(4) and footnote 1, pp. 2–4 (the projection `πₙ`, the functions `Lₙ`, the bracket and the cyclic five-term relation). Accessed 2026-10-20.
- [Mathlib complex-order polylogarithm proposal](https://github.com/leanprover-community/mathlib4/pull/44531), *feat(Analysis/SpecialFunctions): add the polylogarithm function*, for the integer-weight API shape.
