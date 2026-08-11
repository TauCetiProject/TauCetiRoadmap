# Roadmap: zeros of L-functions — growth, zero-free regions, counting, and the explicit formula

The zeros of an L-function are what the LMFDB's L-function pages are mostly about, and they
are the part of the analytic theory that Mathlib has least of. In the Mathlib the
repository currently builds, the only zeros in the library are `riemannZetaZeros`, known to be
closed and discrete (`isDiscrete_riemannZetaZeros`, `IsCompact.inter_riemannZetaZeros_finite`),
together with the classical trivial zeros and the `RiemannHypothesis` `Prop`. There is no
zero counting, no zero-free region, no explicit formula, and no way to say that a computed
list of zeros is complete.

The complex analysis needed is in better shape than that suggests. Mathlib has Jensen's
formula (`MeromorphicOn.circleAverage_log_norm`) and the disc zero bound it implies
(`AnalyticOnNhd.sum_divisor_le`), Phragmén–Lindelöf on horizontal and vertical strips
(`Complex.PhragmenLindelof.vertical_strip`), the Hadamard three-lines theorem, holomorphic
branches of the logarithm on simply connected sets
(`Complex.exists_continuousOn_eqOn_exp_comp`), and — the piece that matters most for stating
anything about zeros correctly — the divisor of a meromorphic function,
`MeromorphicOn.divisor f U : Function.locallyFinsuppWithin U ℤ`, which records order with
sign and multiplicity. What is missing is the growth theory: nothing in Mathlib bounds
`Complex.Gamma` on a vertical strip, nothing defines the order of an entire function, and
there is no Hadamard factorization. The contour theory is missing too — no argument
principle, no winding number, no residue theorem — but that is the
[contour integration roadmap](../ContourIntegration/README.md)'s to build, and Layers 7 and 8
here consume it rather than repeating it.

This roadmap builds the zeros program on top of the completed L-functions produced by the
[L-functions roadmap](../LFunctions/README.md): the growth theory of the completed function,
the analytic conductor, zero counting with multiplicity, the classical zero-free regions, the
Riemann–von Mangoldt formula, the explicit formula, and the semantics of a certified list of
zeros.

Home: `TauCeti/NumberTheory/LFunctions/Zeros/`, with subdirectories per layer
(`Growth/`, `GammaAsymptotics/`, `AnalyticConductor/`, `Convexity/`, `Counting/`,
`Hadamard/`, `ZeroFree/`, `ExplicitFormula/`, `Certificates/`).

## Scope

### In scope

Every numbered milestone in *The build, in layers*. In one sentence: the analytic theory of
the zeros of a completed L-function that has already been shown to continue meromorphically
and satisfy a functional equation, for the two families where that theory is classical —
the Dedekind zeta function of a number field, and the L-function of a finite-order Hecke
character — plus the general growth, counting, and certificate machinery that those two
instantiate. Effective prime-ideal and Chebotarev estimates derived from zero-free information
are included, using the counting carriers owned by their supplier roadmaps.

### Out of scope

- Constructing L-functions, continuing them, or proving functional equations. All of that is
  the L-functions roadmap's, and this roadmap consumes its output.
- Any statement about the zeros of an L-function whose continuation has not been proved.
  There is no zero theorem here for a bare record of data satisfying the L-functions
  roadmap's predicates: each zero-free region and each counting formula names its family.
- Proving the Riemann hypothesis, the generalized Riemann hypothesis, or the nonexistence of
  Siegel zeros. GRH is stated as a `Prop`; the zero-free region theorems carry an explicit
  exceptional-zero disjunction and no milestone removes it.
- Identifying an exceptional zero as the zero of a quadratic character's L-function. That is
  a Stark-type theorem with its own hypotheses; Layer 6 states only what the zero-free region
  argument proves, namely that at most one such zero exists and that it is real and simple.
- Interval arithmetic, numerical evaluation, and decision procedures for discharging a zero
  certificate. The *semantics* of a certificate is in scope (Layer 9); nothing here proves a
  numerical fact about a particular zero, and no acceptance criterion below asks for one.
- The residue calculus itself: winding numbers, residues, the residue theorem, and the
  homology form of Cauchy's theorem. Those are the
  [contour integration roadmap](../ContourIntegration/README.md)'s. Layer 7 specializes them
  to rectangles and identifies the resulting count with Layer 4's divisor sum; nothing here
  re-derives them.
- Weierstrass factorization at genus above zero: the elementary factors `E_p` for `p ≥ 2`,
  canonical products of higher genus, and Hadamard's theorem beyond order `1`. A completed
  L-function has order `1`, and Layer 5 is stated there.
- Fully numerical constants and machine-evaluated bounds. The zero-free regions and effective
  prime estimates here track how constants depend on the field, representation, conductor, and
  exceptional zero, but constants such as `c` may remain existentially quantified. Producing a
  decimal constant suitable for computation is separate numerical-analysis work.
- The Selberg class, converse theorems, and degree classification.

### Interfaces supplied to other roadmaps

- **A zero-counting divisor for a completed L-function** (Layer 4), together with the
  distinction this roadmap pins between the signed divisor count and the natural-number zero
  count. Any roadmap wanting "the zeros of `Λ` in a region, with multiplicity" should use
  these rather than a set-theoretic preimage of `{0}`.
- **Growth of `Gammaℝ` and `Gammaℂ` on vertical strips**, and a holomorphic branch of
  `log Γ` on a sector (Layer 1). This is ordinary complex analysis of the Gamma function and
  is useful well outside this roadmap.
- **The analytic reciprocal of a gamma factor** (Layer 1.6): the entire function that is
  `1/γ` off the poles of `γ` and `0` at them, with its order and its zero set. It exists
  because `γ` has no zeros, and it is what lets every statement about an uncompleted
  L-function be written as a product rather than as a quotient by a function whose total
  representative is junk at its poles. Any roadmap that needs to divide by a gamma factor
  should use this rather than `/`.
- **The analytic conductor** `q(s)` (Layer 2), with the comparison lemmas relating it to
  degree, arithmetic conductor, and spectral parameters. This roadmap owns the general
  definition; the modular forms roadmap displays the same Iwaniec–Kowalski (5.7) quantity for
  a newform without naming it, and Layer 2.4 proves the specialization that matches it.
- **The order predicate, the Weierstrass elementary factor `E₁`, and Hadamard factorization
  at order at most one** (Layer 5), stated for a general entire function rather than only
  for `Λ`.
- **The rectangle as a contour** (Layer 7.1–7.3): the positively oriented boundary of a
  *nondegenerate* closed rectangle as a closed piecewise-`C¹` immersion, its winding numbers,
  its null-homology, the resulting argument principle over an explicit finite singular set,
  the bridge from a Cauchy principal value to the ordinary interval integral, and the
  continuous argument lift along an image curve that is proved to miss `0`. These are generic
  complex analysis rather than L-function mathematics, and this roadmap owns them: the contour
  integration roadmap builds the residue calculus for a general cycle, and the rectangle
  interface on top of it is built and exported here.
- **The bridge from a meromorphic germ to an analytic representative** (Layer 7.2): the
  hypothesis that every point of nonnegative meromorphic order is a point of analyticity of
  the chosen representative, which is what turns `MeromorphicOn` plus a divisor into the
  `DifferentiableOn`-off-a-finite-set hypothesis that the residue theorem actually takes. The
  L-functions roadmap's records satisfy it by their `regular_away` field; a general
  meromorphic function does not.
- **Effective refinements of the qualitative Chebotarev count** (Layer 8.7), stated against
  `Chebotarev.frobeniusPrimeSet`, `frobeniusPsi`, `frobeniusTheta`, and
  `frobeniusPrimeCount`. The qualitative carrier and asymptotic remain Chebotarev's; this roadmap
  contributes only the error term derived from zero-free and explicit-formula input.

## Dependencies

The direct roadmap dependencies are exactly `LFunctions`, `ArithmeticDirichletSeries`,
`Chebotarev`, and `ContourIntegration`. Every crossing below ends in a declaration name.
Character carriers reach this roadmap through the analytic objects exported by L-functions;
there is no direct dependency on Global Number Fields or Class Field Theory.

### From the L-functions roadmap

L-functions owns the completed analytic records and named continued functions. It consumes the
underlying character carriers from its own suppliers; this roadmap does not import those carriers
separately.

| Consumer layer | Supplier layer | Exact object or theorem | Exact declaration name |
|---|---|---|---|
| 0.1–0.5 | LF 0 | the data record, and its derived degree, archimedean factor, conjugate dual, and reflection point | `LFunctions.AnalyticLFunctionData`, with `.coeff`, `.conductor`, `.gammaR`, `.gammaC`, `.rootNumber`, `.completed`, `.polarOrder`; `AnalyticLFunctionData.degree`, `.gammaFactor`, `.dual`, `.dualCompleted`, `.reflectedPoint` |
| 0.1 | LF 0 | Dirichlet agreement on `Re s > 1` | `AnalyticLFunctionData.HasDirichletAgreement`, field `completes` |
| 0.2 | LF 0 | exact polar orders, and analyticity of the chosen representative away from them | `AnalyticLFunctionData.HasMeromorphicContinuation`, fields `meromorphic`, `exact_pole_order`, `regular_away` |
| 0.4 | LF 0 | the functional equation off the polar loci, reflected polar divisor, and `‖ε‖ = 1` | `AnalyticLFunctionData.HasFunctionalEquation`, fields `eq_away`, `polarOrder_reflect`, `norm_rootNumber` |
| 0.5 | LF 0 | the average coefficient bound giving the right-edge estimate | `AnalyticLFunctionData.HasAverageCoefficientBound`, field `coeff_avg` |
| 2.3 | LF 0.4 | the normalization translation, which is what makes "critical line" well defined | `NormalizationTranslation`, fields `gammaR_eq`, `gammaC_eq`, `completed_eq`, `polarOrder_eq`, `conductor_eq`, `rootNumber_eq`; `ArithmeticLFunctionData` |
| 1.6, 3.4, 7.6 | LF 0, 3 | the named Riemann-zeta card and the continued and completed Dedekind zeta functions and their card | `riemannZetaData`, `dedekindZetaC`, `completedDedekindZeta`, `dedekindZetaData`, `analyticAt_dedekindZetaC`, `analyticAt_completedDedekindZeta`, `completedDedekindZeta_one_sub` |
| 6.2, 7.6 | LF 4 | continued quadratic and cyclotomic factorizations | `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`, `dedekindZetaC_cyclotomic_four` |
| 4.7, 6 | LF 8 | the Dedekind-zeta logarithmic derivative and its nonnegative von Mangoldt coefficients | `dedekindZeta_logDeriv_eq`, `dedekindZeta_idealVonMangoldt_nonneg` |
| 3.4, 6.4, 8.6 | LF 5 | primitive finite-order Hecke L-functions, completions, cards, and root numbers | `heckeLFunctionC`, `completedHeckeLFunction`, `heckeRootNumber`, `heckeData`, `norm_heckeRootNumber`, `completedHeckeLFunction_one_sub` |
| 6.5 | LF 7 | intrinsic boundary nonvanishing | `heckeLFunction_ne_zero_of_one_le_re` |

The zero-distribution theory is polymorphic in `LFunctions.AnalyticLFunctionData`. A future
`ArtinRepresentations` roadmap may supply an Artin card satisfying these generic predicates, but
this roadmap currently owns no Artin instance and assumes no Artin-specific coefficient carrier.

### From the Arithmetic Dirichlet Series roadmap

| Consumer layer | Exact declaration | Use |
|---|---|---|
| 4.7, 6 | `ArithmeticDirichletSeries.EulerProductData`, `idealVonMangoldt` | the generic Euler-product package and von Mangoldt transform; the Dedekind-zeta nonnegativity theorem is exported by L-functions |
| 8 | `ArithmeticDirichletSeries.abelSummation` | transfer between weighted and unweighted effective counts |
| 8.1 | `ArithmeticDirichletSeries.perronFormula`, `perronFormula_endpoint` | the truncated Perron kernel and exact endpoint value |
| 8.5--8.7 | `ArithmeticDirichletSeries.wienerIkehara`, `primeNumberTheoremTransfer` | recovery of the qualitative asymptotic from the stronger effective estimate |

The generic declarations are imported, not rebuilt. This roadmap defines no `primeTheta`,
`primeCount`, density predicate, or second ideal-weight carrier.

### From the Chebotarev roadmap

| Consumer layer | Exact declaration | Use |
|---|---|---|
| 8.7 | `Chebotarev.frobeniusPrimeSet` | the exact prime set whose count is refined |
| 8.7 | `frobeniusVonMangoldtCoeff`, `frobeniusPsi`, `frobeniusTheta`, `frobeniusPrimeCount` | the canonical coefficient and counting functions |
| 8.7 | `tendsto_frobeniusPrimeCount`, `hasNaturalDensity_frobeniusPrimeSet` | qualitative endpoint recovered after discarding the error term |

No Frobenius carrier or qualitative Chebotarev proof is repeated here.

### From the contour integration roadmap

⚠ Layer 7 consumes that roadmap's **Layer 4**, not its Layers 0–3. Its `argumentPrinciple`
and `classicalResidueTheorem_circle` are stated for a circle and do not apply to a rectangle;
`hungerbuhlerWasem_residueTheorem` is the first statement there that does.

| Consumer layer | Supplier layer | Exact object or theorem | Exact declaration name |
|---|---|---|---|
| 7.1 | CI 0 | the winding number of a closed piecewise-`C¹` curve, and null-homology | `windingNumber`, `IsNullHomologous` |
| 7.1 | CI 0 | the curve regularity the Layer-4 summit hypothesizes, with its non-vanishing one-sided tangent on every piece — which is why 7.1 carries `Rect.Nondegenerate` | `IsPwC1ImmersionOn` (and the weaker `IsPiecewiseC1On`) |
| 7.2 | CI 0 | residues, the principal-value predicate, and the two on-cycle regularity conditions | `residue`, `HasCauchyPV`, `ConditionAprime`, `ConditionB` |
| 7.2 | CI 2 | the local argument principle, read through `residue` | `argumentPrinciple_local` |
| 7.2 | CI 4 | the general null-homologous-cycle residue theorem, whose hypotheses `hf : DifferentiableOn ℂ f (U \ ↑S)` and `hmero : ∀ s ∈ S, MeromorphicAt f s` are what force the explicit singular set and the analytic-representative bridge of 7.2 | `hungerbuhlerWasem_residueTheorem` |

### From Mathlib, and one convention crossing

| Consumer layer | Supplier | Exact object or theorem | Exact declaration name |
|---|---|---|---|
| 2.4 | [Modular forms roadmap](../ModularForms/README.md) Layer 7 | the newform analytic conductor `𝔮(f,s)`, a displayed Iwaniec–Kowalski (5.7) formula with no declaration; this roadmap owns the general definition and 2.4 proves the newform specialization | *unnamed*, and the crossing is convention only |
| 4 | Mathlib `Analysis/Complex/JensenFormula.lean` | Jensen's formula and the disc zero bound | `MeromorphicOn.circleAverage_log_norm`, `AnalyticOnNhd.sum_divisor_le` |
| 4 | Mathlib `Analysis/Meromorphic/Divisor.lean`, `Topology/LocallyFinsupp.lean` | the divisor, its restriction and positive part, and local finiteness of the support | `MeromorphicOn.divisor`, `MeromorphicOn.divisor_restrict`, `Function.locallyFinsuppWithin.posPart`, `LocallyFiniteSupport.finite_inter_support_of_isCompact` |
| 0.4, 3.1 | Mathlib `Analysis/Complex/PhragmenLindelof.lean` | convexity on a vertical strip, and the three-lines theorem | `Complex.PhragmenLindelof.vertical_strip` |
| 1.1, 5.5, 7.3 | Mathlib `Analysis/Complex/BranchLogRoot.lean` | a continuous logarithm on a simply connected set | `Complex.exists_continuousOn_eqOn_exp_comp` |
| 5 | Mathlib `Analysis/Normed/Module/MultipliableUniformlyOn.lean`, `Analysis/Calculus/LogDerivUniformlyOn.lean` | locally uniform convergence of a product, and its logarithmic derivative | `multipliableLocallyUniformlyOn_one_add`, `logDeriv_tprod_eq_tsum` |
| 5.6 | Mathlib `Analysis/Complex/BorelCaratheodory.lean` | the bound on `‖f‖` from a bound on `Re f` | `Complex.borelCaratheodory` |

L-functions supplies analytic objects and intrinsic boundary nonvanishing. Arithmetic Dirichlet
Series supplies the generic summation and Tauberian layer, and Chebotarev supplies qualitative
prime-set counting. This roadmap begins where zero distribution and effective error terms begin.

## Standing hypotheses and conventions

| object | convention |
|---|---|
| normalization | Everything is stated in the **analytic** normalization: the functional equation reflects in `s ↦ 1 − s`, the critical strip is `0 ≤ Re s ≤ 1`, and the critical line is `Re s = 1/2`. An arithmetic-normalized instance reaches these theorems through the L-functions roadmap's translation, and every statement about the critical line for such an instance is that translation applied to a theorem here — never a restatement with a shifted line. |
| order and vanishing | Order is `meromorphicOrderAt f z : WithTop ℤ`, and the divisor is `MeromorphicOn.divisor f U`. "`f` has a zero of order `m` at `ρ`" is `meromorphicOrderAt f ρ = (m : WithTop ℤ)` with `0 < m`; "`f` has no zeros on `S`" is `∀ z ∈ S, meromorphicOrderAt f z ≤ 0`; "`f` has no zeros and no poles on `S`" is `∀ z ∈ S, meromorphicOrderAt f z = 0`. ⚠ Never characterize a zero or a pole through the value `f z`. Mathlib's meromorphic functions are total, and at a pole the representative takes a junk value which for `Complex.Gamma` and `Gammaℝ` is `0`; `f z ≠ 0` is therefore neither necessary nor sufficient for regularity. ⚠ `MeromorphicOn.divisor` is likewise total, with junk value `0` where `f` is not meromorphic on `U`, so meromorphy on a stated open set is a hypothesis of every theorem about a count. |
| order and values, the other direction | ⚠ `meromorphicOrderAt f z = 0` is a statement about the **punctured** germ, and it constrains no value, no derivative, and no continuity at `z`. It does **not** give `AnalyticAt ℂ f z`, does **not** give `f z ≠ 0`, does **not** make `logDeriv f` defined or continuous at `z`, and does **not** make the image curve `f ∘ γ` miss `0`. The countermodel is one line: let `f` be `1` on a neighbourhood of `z` except that `f z = 0`. Then `MeromorphicAt f z` holds, every order is `0`, the divisor is identically `0` — and the image curve of any path through `z` hits `0`. Germ-level order is the right hypothesis for a **count** (Layers 4 and 9), and is exactly the wrong hypothesis for anything evaluated pointwise: the argument lift of 7.3 and the `DifferentiableOn` hypothesis of the residue theorem both need `AnalyticAt ℂ f z` and, where the value is used, `f z ≠ 0`, written out. Where the object is a record of the L-functions roadmap, the missing analyticity is supplied by its `HasMeromorphicContinuation.regular_away`; where it is a general meromorphic function, it is a hypothesis. |
| the two counts | Two deliberately different notions, and no theorem may substitute one for the other. `divisorCount f U R : ℤ` is `∑ᶠ ρ ∈ R, MeromorphicOn.divisor f U ρ` for `R ⊆ U`, in which poles contribute negatively; it is what the argument principle computes. `zeroCount f U R : ℕ` is `∑ᶠ ρ ∈ R, (MeromorphicOn.divisor f U ρ).toNat`, the multiplicities of the *positive* part of the divisor, and is the count of zeros; it is what `N(T)`, the Riemann–von Mangoldt formula, and every certificate use. They agree exactly when `R` contains no pole, which is a hypothesis, never an inference. |
| rectangles | A closed rectangle is `Set.Icc σ₁ σ₂ ×ℂ Set.Icc t₁ t₂` and a half-open one is `Set.Icc σ₁ σ₂ ×ℂ Set.Ioc t₁ t₂`, written with `Complex.reProdIm`; the half-open direction is the imaginary one. Closed rectangles with regular boundary carry contour integrals and certificates; half-open rectangles carry exact subdivisions in height and `N(T)`. Neither spelling is abbreviated to "box" in a statement. Two predicates, and they are not interchangeable. **`Rect.Valid`** is `σ₁ ≤ σ₂ ∧ t₁ ≤ t₂`, the weak ordering that keeps the *sets and counts* meaningful: `Set.Icc` of a reversed pair is empty, so the definitions stay total and a reversed rectangle simply has count `0`. **`Rect.Nondegenerate`** is `σ₁ < σ₂ ∧ t₁ < t₂`, and it is what every *geometric* statement carries — the boundary curve, its winding numbers, its null-homology, and the argument principle. ⚠ `Valid` is not enough for any of those: a rectangle with a zero-length edge has a constant edge, whose derivative vanishes identically, so its boundary is not an `IsPwC1ImmersionOn` curve, and the supplier's residue theorem does not apply to it. A degenerate rectangle also has empty interior, so "winding number `1` about each interior point" is vacuous rather than informative. |
| counting convention | `N(T)` is `zeroCount` of the *completed* function `Λ` over the half-open rectangle `Icc 0 1 ×ℂ Ioc 0 T`: zeros with `0 < Im ρ ≤ T` and `0 ≤ Re ρ ≤ 1`, with multiplicity. The real axis is excluded by the half-open convention, and a zero at height exactly `T` is counted. The symmetric count over `\|Im ρ\| ≤ T` is a separate named quantity, and the relation between the two is a theorem with explicit reality hypotheses (Layer 4.9), never an assumption. Trivial zeros do not appear: they are the points where the gamma factor has a pole and `L` a compensating zero, and the completed function is regular and nonvanishing there. |
| finite order | An entire `f` has order `≤ A`, written `OrderLE f A`, when `f =O[cobounded] fun s ↦ Real.exp (‖s‖ ^ A')` for every `A' > A`. This predicate is the only notion of order in the roadmap: no numeric order and no type is defined, and no milestone needs one. ⚠ Do not introduce a limsup-of-`log log` order, or the Nevanlinna order `limsup log T(r,f)/log r` read off `ValueDistribution.characteristic`, unless a lemma proves it agrees with `OrderLE`. |
| conductors | Three names, never one. `arithmeticConductor d : ℕ+` is the finite conductor `N` of the data record. `analyticConductorAt d s : ℝ` is the Iwaniec–Kowalski (5.7) quantity `N · ∏_j (\|s + μ_j\| + 3) · ∏_k (\|s + ν_k\| + 3)(\|s + ν_k + 1\| + 3)`, where each `Gammaℂ(s + ν)` contributes the *pair* of shifts `ν, ν + 1` it splits into under duplication rather than the square of one of them. `centralAnalyticConductor d` is `analyticConductorAt d (1/2)`, the central point in the analytic normalization. The `+3` is part of the convention, not a slack constant to be optimized, and `q(s)` in prose always means `analyticConductorAt`. |
| gamma factors | `Complex.Gammaℝ s = π^{-s/2} Γ(s/2)` and `Complex.Gammaℂ s = 2(2π)^{-s} Γ(s)` as in Mathlib, with `Gammaℝ_mul_Gammaℝ_add_one : Gammaℝ s * Gammaℝ (s + 1) = Gammaℂ s`. ⚠ The Gamma function has **no zeros**; it has simple poles, at `s ∈ {0, −2, −4, …}` for `Gammaℝ` and `s ∈ {0, −1, −2, …}` for `Gammaℂ`. Mathlib's total representative is `0` at those poles, and `Gammaℝ_eq_zero_iff` is a statement about that junk value, not about vanishing. All pole statements go through `meromorphicOrderAt`. |

Work with a fixed completed L-function throughout; do not bundle "L-function with a
zero-free region" into a class.

## What Mathlib already has (consume)

- **Jensen's formula and disc zero counts.** `Mathlib/Analysis/Complex/JensenFormula.lean`:
  `MeromorphicOn.circleAverage_log_norm` (the circle average of `log ‖f‖` equals
  `log ‖trailing coefficient‖` plus the counting sum), `AnalyticOnNhd.circleAverage_log_norm`,
  and `AnalyticOnNhd.sum_divisor_le`, which bounds the number of zeros in a disc of radius
  `r` by the maximum modulus on a larger circle *divided by the value at the center*. Every
  counting statement in Layer 4 is proved from this rather than from the argument principle,
  which arrives only in Layer 7 and from another roadmap.
- **Divisors of meromorphic functions.** `Mathlib/Analysis/Meromorphic/Divisor.lean`:
  `MeromorphicOn.divisor f U : Function.locallyFinsuppWithin U ℤ` built from
  `meromorphicOrderAt`, with congruence lemmas, `AnalyticOnNhd.divisor_nonneg`, and
  `MeromorphicOn.divisor_restrict` (restriction along `V ⊆ U`). The positive part `D⁺`
  (`Function.locallyFinsuppWithin.posPart`) is what the natural-valued zero count sums. Local
  finiteness of the support comes from `Function.locallyFinsupp.locallyFiniteSupport` together
  with `LocallyFiniteSupport.finite_inter_support_of_isCompact`
  (`Mathlib/Topology/LocallyFinsupp.lean`), and `Function.locallyFinsuppWithin.finiteSupport`
  is the compact-domain shortcut. Also
  `Meromorphic/{Order,IsolatedZeros,NormalForm,FactorizedRational,TrailingCoefficient}.lean`,
  in particular `MeromorphicOn.extract_zeros_poles`, which writes a meromorphic `f` as
  `(∏ᶠ u, (· − u)^{divisor f U u}) • g` with `g` analytic and nonvanishing, and
  `meromorphicTrailingCoeffAt`.
- **Branches of the logarithm.** `Mathlib/Analysis/Complex/BranchLogRoot.lean`:
  `Complex.exists_continuousOn_eqOn_exp_comp` produces, for a continuous nonvanishing `g` on
  an open simply connected `U`, a continuous `f` on `U` with `exp ∘ f = g`. This is what
  Layer 1 uses for `log Γ` on a sector, what Layer 5 uses for the entire logarithm of a
  nonvanishing entire function, and what Layer 7 uses to lift `arg Λ` continuously along a
  contour; holomorphy of the branch follows from `exp` being a local biholomorphism, and that
  step is a milestone rather than an assumption.
- **Nevanlinna theory, which does not do this roadmap's counting.**
  `Mathlib/Analysis/Complex/ValueDistribution/` has the proximity function, the log-counting
  function `Function.locallyFinsuppWithin.logCounting`, the characteristic function, and the
  First Main Theorem in both parts (`FirstMainTheorem.lean`). ⚠ None of it is a zero count:
  `logCounting` is the `ℝ`-valued log-weighted `N(r) = ∫₀ʳ (n(t) − n(0))/t dt + n(0) log r`,
  every definition centers its discs at the origin, and the theory is discs and circles where
  this roadmap counts in rectangles and in discs centered on the critical line. Layer 4
  therefore keeps its own counts and consumes `AnalyticOnNhd.sum_divisor_le` instead; the
  comparison with `logCounting` is a Layer 4 milestone so that the two counts are relatable
  rather than rival. Mathlib has no unintegrated `n(r,f)`.
- **Infinite products and logarithmic derivatives.** `multipliableLocallyUniformlyOn_one_add`
  and `hasProdLocallyUniformlyOn_one_add`
  (`Analysis/Normed/Module/MultipliableUniformlyOn.lean`) give locally uniform convergence of
  `∏ (1 + f_i)` from a summable dominating sequence; `Analysis/SpecialFunctions/Log/Summable.lean`
  has the log-to-product dictionary and `tprod_one_add_ne_zero_of_summable`;
  `SummableLocallyUniformlyOn.differentiableOn` and `Analysis/Complex/LocallyUniformLimit.lean`
  give holomorphy of the limit; and `logDeriv_tprod_eq_tsum`
  (`Analysis/Calculus/LogDerivUniformlyOn.lean`) differentiates through the product. The whole
  arc is carried out at genus `0` in `Analysis/SpecialFunctions/Trigonometric/Cotangent.lean`,
  from `Complex.multipliable_sineTerm` to `Complex.cot_series_rep`, which is the exact shape of
  Layer 5.
- **Borel–Carathéodory.** `Mathlib/Analysis/Complex/BorelCaratheodory.lean`:
  `Complex.borelCaratheodory` bounds `‖f‖` on a smaller ball from an upper bound on `Re f` on
  a larger one. Layer 5 runs its exponential-factor argument on this rather than rebuilding it.
- **Convexity.** `Mathlib/Analysis/Complex/PhragmenLindelof.lean`
  (`horizontal_strip`, `vertical_strip`, the quadrant and half-plane versions, and the
  `isBigO_sub_exp_rpow` growth hypotheses they take) and
  `Mathlib/Analysis/Complex/Hadamard.lean` (the three-lines theorem).
- **The Gamma function.** `Gamma/{Basic,Beta,BohrMollerup,Deriv,Digamma,Deligne}.lean`:
  `Complex.Gamma`, `Gamma_ne_zero`, the reflection and duplication formulas, `Complex.digamma`,
  and `Gammaℝ`/`Gammaℂ`. ⚠ There is **no** Stirling estimate for `Complex.Gamma`;
  `Analysis/SpecialFunctions/Stirling.lean` is the factorial asymptotic only, and
  `BohrMollerup` is the real characterization. Layer 1 builds this.
- **Zeta zeros.** `Mathlib/NumberTheory/LSeries/ZetaZeros.lean`: `riemannZetaZeros`,
  `isClosed_riemannZetaZeros`, `isDiscrete_riemannZetaZeros`,
  `IsCompact.inter_riemannZetaZeros_finite`; and in `RiemannZeta.lean` the trivial zeros
  `riemannZeta_neg_two_mul_nat_add_one`, `riemannZeta_zero`, and `RiemannHypothesis`.
- **Nonvanishing on the edge.** `LSeries/Nonvanishing.lean`:
  `riemannZeta_ne_zero_of_one_le_re`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
  and the `3-4-1` product bound `norm_LFunction_product_ge_one` — the qualitative statement
  Layer 6 makes quantitative.
- **Complex analysis substrate.** `Analysis/Complex/{RemovableSingularity, AbsMax,
  LocallyUniformLimit, Liouville, CauchyIntegral}.lean`, `Analysis/Analytic/`, and
  `Analysis/SpecialFunctions/Complex/{Log, LogBounds, LogDeriv, Arg}.lean`.

## What is missing (build here)

The order predicate for an entire function and finite order of a completed L-function. A
holomorphic branch of `log Γ` on a sector and the Stirling asymptotics on it: nothing in
Mathlib bounds `Γ(σ + it)` as `|t| → ∞`. The analytic reciprocal of a gamma factor, and the
continued *uncompleted* L-function built from it: the record carries a completed continuation
and a coefficient sequence, and `LSeries` is a junk value off its half-plane, so the object
every later layer evaluates on the critical line has to be constructed. The analytic conductor
and its comparison lemmas. Convexity bounds for the model class, by Phragmén–Lindelöf on the
pole-cleared uncompleted function. The two zero counts in a rectangle and the counting
function `N(T)`. The Weierstrass elementary factor and the
canonical product indexed by a divisor, Hadamard factorization at order at most one, and the
resulting partial-fraction expansion of `Λ'/Λ`. The quantitative `3-4-1` argument and the de
la Vallée Poussin zero-free region for the Dedekind zeta function and for Hecke L-functions,
with the exceptional-zero disjunction. The Riemann–von Mangoldt formula, in the
degree-and-conductor-uniform form. The L-function specialization of the imported Perron formula
and the contour shift it runs on. The explicit formula relating ideal von Mangoldt sums to zeros.
Certificate semantics for a verified list of zeros. None of this exists upstream.

⚠ Two of the layers here run on contour integration, and Mathlib has none of it: no argument
principle, no winding number, no Rouché, no residue theorem, and no continuous branch of
`arg` along a path. What Mathlib has is Cauchy–Goursat for a rectangle
(`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`), the Cauchy integral formula
for circles, and Jensen's formula, which gives inequalities for a count rather than the exact
count Layer 7 needs. That material is the
[contour integration roadmap](../ContourIntegration/README.md)'s, whose Layers 0–3 build the
winding number of a closed piecewise-`C¹` curve, residues, the homology form of Cauchy's
theorem, and the argument principle **for a circle**, and whose Layer 4 proves the general
null-homologous-cycle residue theorem `hungerbuhlerWasem_residueTheorem`. ⚠ It is that Layer-4
theorem that Layer 7 here consumes: a rectangle is not a circle, so the Layer-2 statements do
not apply to it, and every dependency row and every graph edge below names Layer 4. Consume
those; do not re-derive them. What this roadmap adds on top is the rectangle contour, the
canonical-representative and principal-value bridges, and the argument lift (Layer 7.1–7.3),
which that roadmap does not construct, and the L-function-specific Perron contour shift (Layer 8).

---

## The build, in layers

Layers 0–5 are general analysis and depend on the L-functions roadmap only for the data
record, with four exceptions that name their family: 1.6's two comparison theorems (which
identify `continuedL` with that roadmap's own continued objects), 3.4 (finite order, from its
Mellin representation), 4.7–4.8 (the local zero count, from its Euler product), and 5.7 (the
partial-fraction corollaries, which need 3.4). Layers 6–8 are the arithmetic payoff and depend
throughout on its Dedekind zeta and Hecke L-function instances; 7 and 8 additionally consume
the contour integration roadmap's Layer-4 residue theorem. Layer 9 depends on Layers 0 and 4A.

⚠ No milestone names a later milestone among its prerequisites. The one place that rule was
broken — `continuedL` in Layer 0, whose construction used the gamma divisor of 1.5 and whose
normalization theorem was assigned to 2.3 — is repaired by placing it at 1.6 and moving the
translation to 2.3.

### Layer 0: growth predicates and the entire completion

The data record of the L-functions roadmap carries coefficients, conductor, spectral
parameters, root number, a total representative of the completed function, and an exact polar
divisor. It records no growth, which is why no zero theorem can be stated against it as it
stands. This layer adds the growth predicates, proves the reductions between them, and builds
the entire function whose zeros the later layers count.

1. `OrderLE (f : ℂ → ℂ) (A : ℝ) : Prop`, for entire `f`: `∀ A' > A, f =O[cobounded ℂ] fun s ↦ Real.exp (‖s‖ ^ A')`.
   Basic API: closure under sums, products, and multiplication by a polynomial; `OrderLE` for
   `exp`, for polynomials, and for `s ↦ exp (a * s)`; monotonicity in `A`. Entirety is a
   hypothesis of the theorems that use `OrderLE`, not part of the predicate, so that the
   predicate composes.
2. **The entire completion.** ⚠ Not a pointwise product: at a pole the record's total
   representative takes a junk value, so `s ↦ (∏_p (s − p)^{polarOrder p}) · Λ(s)` need not
   take the analytically continued value there, and for the zeta instance the raw product is
   `0` at `0` and `1` — exactly fake zeros where the clearing polynomial is meant to remove
   poles. Build it in this order:
   - the clearing polynomial `P(s) = ∏_{p ∈ polarOrder.support} (s − p)^{polarOrder p}`,
     finite because `polarOrder : ℂ →₀ ℕ`;
   - the product `P · Λ` on `Set.univ \ polarOrder.support`, meromorphic there and analytic;
   - the theorem that each point of `polarOrder.support` is a removable singularity of `P · Λ`
     with `meromorphicOrderAt (P · Λ) p = 0`, from the continuation predicate's
     `meromorphicOrderAt Λ p = −polarOrder p`;
   - `entireCompletion d : ℂ → ℂ`, defined as the analytic extension across that finite set
     (`Complex.analyticAt_of_removable`-style removability plus uniqueness of the extension),
     with the theorem that it agrees with `P · Λ` off the polar support and is entire;
   - `meromorphicOrderAt (entireCompletion d) z = meromorphicOrderAt Λ z + polarOrder z` for
     every `z`, hence `divisor (entireCompletion d) univ = divisor Λ univ + polarOrder`;
   - `entireCompletion d p ≠ 0` at each former pole `p`, which is the content of the polar
     orders being exact.
   The normalizing constant is `1`: for the Dedekind zeta instance `entireCompletion` is
   `s(s−1)Λ_K(s)`, not `s(s−1)Λ_K(s)/2`.
3. `IsFiniteOrder d`: `∃ A, OrderLE (entireCompletion d) A`. ⚠ `IsFiniteOrder → OrderLE _ 1`
   is not free; it is proved per family in Layer 3.4 and the predicate does not assume it.
4. `HasVerticalStripGrowth`: for all `σ₁ σ₂ : ℝ` with `σ₁ < σ₂` there are `C > 0`, `A ≥ 0`,
   and a height threshold `T₀ ≥ 0` with `‖Λ(σ + it)‖ ≤ C (1 + |t|)^A` for `σ ∈ [σ₁, σ₂]` and
   `T₀ ≤ |t|`. ⚠ The threshold is existentially quantified and is not `1`. The data record
   permits an arbitrary finite polar divisor, so a record may have a pole at height `T ≥ 1`,
   and no bound on a strip through that pole can hold: the shifted product
   `s ↦ Λ_ζ(s − iT) Λ_ζ(s + iT)` satisfies every predicate of the model and has poles at
   `1 ± iT`, so a fixed threshold of `1` would make this predicate false for it. The layer's
   main theorem: the predicate follows from `IsFiniteOrder` together with the functional
   equation and the Dirichlet-series bound on `Re s > 1`, by Phragmén–Lindelöf, with `T₀`
   any bound for the imaginary parts of the polar support. Prove the companion statement for
   `entireCompletion d`, where the poles are cleared and every `T₀` works, and for the two
   families prove the concrete threshold `T₀ = 2` from the fact that their polar supports lie
   on the real axis. Later layers hypothesize the predicate and carry its threshold.
5. The relation to the average coefficient bound: a record with the average Ramanujan bound
   has its Dirichlet series bounded on `Re s ≥ 1 + δ`, hence `Λ` of at most polynomial growth
   there. State this so that the vertical-strip bound has a starting edge.
⚠ The continued *uncompleted* L-function is **not** built here. It needs the divisor of the
gamma factor, which is Layer 1.5, and it is therefore Layer 1.6; a milestone may not name a
later layer among its prerequisites. Nothing in Layer 0 mentions `L(s)` for that reason.

Acceptance: the predicates elaborate over the L-functions roadmap's record and have the API
of 1; `entireCompletion` satisfies the divisor identity and the nonvanishing of 2 for a record
with an exact polar divisor; and the implication of 4 is proved. ⚠ No acceptance criterion
here names the Dedekind zeta instance: finite order for the two families is Layer 3.4, and a
layer's acceptance may not depend on a later one.

### Layer 1: gamma-factor asymptotics, and the continued L-function

Items 1 to 4 are complex analysis with no arithmetic content, are independently
Mathlib-worthy, and are all missing upstream. Item 5 assembles them into the gamma factor of
a record and computes its divisor, and item 6 uses that divisor to build the continued
uncompleted L-function, which is the carrier every later layer evaluates on the critical
line. ⚠ Item 6 is here and not in Layer 0 because it consumes item 5.

1. **A holomorphic branch.** On the sector `S_δ = {s : |arg s| < π − δ, 1 < ‖s‖}`, which is
   open, simply connected, and free of poles and zeros of `Γ`, define `logGamma δ` by
   `Complex.exists_continuousOn_eqOn_exp_comp` applied to `Γ`, prove `exp ∘ logGamma δ = Γ`
   on `S_δ`, prove it is holomorphic there (`exp` is a local biholomorphism), and pin the
   remaining `2πi ℤ` ambiguity by the equation `logGamma δ 2 = 0`, which is consistent because
   `Γ 2 = 1` and `2 ∈ S_δ`. ⚠ Without that equation the branch is determined only up to
   `2πi k`, which changes the constant term of the asymptotic in 2. ⚠ `Complex.log ∘ Gamma`
   is **not** a branch of
   `log Γ`: nonvanishing of `Γ` does not make the principal logarithm of its image
   continuous, and no milestone may use that composition.
2. `Complex.logGamma_asymptotic`: on `S_δ`,
   `logGamma δ s = (s − 1/2) * Complex.log s − s + Real.log (2π)/2 + O(1/‖s‖)` as `‖s‖ → ∞`,
   with `Complex.log` the principal branch, which is legitimate here because `s` itself stays
   in the slit plane.
3. `Complex.norm_Gamma_asymptotic`: for every compact `[a, b] ⊆ ℝ`,
   `log ‖Γ(σ + it)‖ = (σ − 1/2) * Real.log |t| − π|t|/2 + Real.log (2π)/2 + O(1/|t|)`
   uniformly for `σ ∈ [a, b]`, along the filter `cocompact ℝ` in `t`, that is as `|t| → ∞` in
   both directions. This is the estimate every later layer uses; state it in this additive
   `log ‖·‖` form rather than as a ratio tending to `1`, so that it composes over products.
4. The digamma bound `Complex.digamma s = Complex.log s + O(1/‖s‖)` on `S_δ`, from Mathlib's
   `Complex.digamma` and 2; and the logarithmic derivatives of the gamma factors, exactly:
   `logDeriv Gammaℝ s = (Complex.digamma (s/2))/2 − (Real.log π)/2` and
   `logDeriv Gammaℂ s = Complex.digamma s − Real.log (2π)`.
5. **The gamma factor of a record.** For `γ(s) = ∏_j Gammaℝ(s + μ_j) ∏_k Gammaℂ(s + ν_k)` of
   degree `d = #gammaR + 2 * #gammaC`, and every compact `[a, b]`:
   `log ‖γ(σ + it)‖ = −(π d / 4) |t| + A(σ) * Real.log |t| + O(1)` uniformly for `σ ∈ [a, b]`
   as `|t| → ∞`, where
   `A(σ) = ∑_j (σ + Re μ_j − 1)/2 + ∑_k (σ + Re ν_k − 1/2)`.
   Both constants are part of the milestone; a statement with an unnamed coefficient does not
   discharge it. Also: `γ` has no zeros, and its poles are exactly the points
   `−μ_j − 2n (n : ℕ)` and `−ν_k − n (n : ℕ)`, with the orders read off `meromorphicOrderAt`
   and assembled into the divisor of `γ`.
6. **The continued uncompleted L-function**, which is here rather than in Layer 0 because it
   is built from the gamma divisor of 5. ⚠ The record carries the coefficients and a total
   representative of the *completed* continuation, and nothing else: `LSeries d.coeff s` is a
   junk value off the half-plane of convergence, so no statement about `L` at `1/2 + it` or on
   the left of the critical strip may be phrased through it. ⚠ And `continuedL` is **not** the
   raw quotient `Λ(s) / (N^{s/2} γ(s))`. Where `Λ` and `γ` share a pole the quotient is
   regular but the pointwise expression divides two junk values, and Mathlib's convention
   makes the answer `0`. The ζ instance is the countermodel and is the test below: `Λ_ζ` and
   `Gammaℝ` both have a simple pole at `s = 0`, so `ζ` is regular there with `ζ(0) = −1/2`,
   while `completedRiemannZeta 0 / Gammaℝ 0` is a division by the junk value `Gammaℝ 0 = 0`
   and is therefore `0`. Mathlib's own `riemannZeta_def_of_ne_zero` carries the hypothesis
   `s ≠ 0` for exactly this reason, and `riemannZeta_zero` supplies the value separately.
   Build it in this order:
   - **the analytic reciprocal gamma factor** `invGammaFactor d : ℂ → ℂ`: `γ` has no zeros by
     5, so `1/γ` is analytic off the poles of `γ` and extends analytically across each of them
     by the value `0`. The milestone is that extension, together with
     `invGammaFactor d s * d.gammaFactor s = 1` off the polar set,
     `meromorphicOrderAt (invGammaFactor d) z = − meromorphicOrderAt (d.gammaFactor) z` for
     every `z`, and the fact that its zero set is exactly the pole set of `γ` with the pole
     orders as multiplicities. This object is entire, and it replaces every division by `γ`;
   - **the raw product** `R d s = (N : ℂ)^(−s/2) * d.completed s * invGammaFactor d s`, which
     is a correct representative at every point where `d.completed` is analytic, that is off
     `d.polarOrder.support` by the supplier's `regular_away`;
   - **the removable set** `{p ∈ d.polarOrder.support | d.polarOrder p ≤ m p}`, where `m p` is
     the order of the pole of `γ` at `p` (so `m p = 0` off the gamma poles). This is the
     finite intersection where the gamma zero cancels the completed pole, and it is where the
     germ of `R` is removable;
   - `continuedL d : ℂ → ℂ`, the analytic extension of `R d` across that removable set, with
     the theorem that it agrees with `R d` off it and is meromorphic on `ℂ`;
   - **the order formula**
     `meromorphicOrderAt (continuedL d) z = meromorphicOrderAt d.completed z − meromorphicOrderAt (d.gammaFactor) z`
     for every `z`, hence `divisor (continuedL d) univ = divisor Λ univ − divisor γ univ`.
     This is what makes the trivial zeros visible: at a pole of `γ` where `Λ` is regular and
     nonzero, `continuedL` has a zero of exactly the pole order;
   - **analyticity at every non-pole**: `0 ≤ meromorphicOrderAt (continuedL d) z` implies
     `AnalyticAt ℂ (continuedL d) z`. ⚠ This does not follow from the order and is not free;
     it is proved from the supplier's `regular_away` off the polar support and from the
     removable extension on it, and without it no later layer may evaluate `continuedL`;
   - **agreement with the series**: `continuedL d s = LSeries d.coeff s` for `1 < Re s`. This
     is `HasDirichletAgreement.completes` divided by the reciprocal factor, and it is the
     *only* place the series representation may be used. The finitely many points of that
     half-plane at which `γ` has a pole — possible only when a shift has real part below
     `−1` — are covered by the identity theorem from the previous item, not by the division;
   - **the global identity** `d.completed s = (N : ℂ)^(s/2) * d.gammaFactor s * continuedL d s`
     as an equality of meromorphic germs at every `s`, including at the poles of `γ` and of
     `Λ`. State it as this product, never as a quotient. ⚠ It is an identity of *germs* and its
     pointwise form is false at the poles of `γ`: there the product multiplies the junk value
     `0` by the compensating trivial zero of `continuedL` and gives `0`, while `Λ` is analytic
     and nonzero. `s = −2` at the ζ instance is the smallest witness, and it is the same fact
     as "the trivial zeros are not zeros of `Λ`" in the worked examples. The pointwise
     statement therefore carries the hypothesis that `γ` is regular at `s`;
   - **the dual record**, `AnalyticLFunctionData.dual`, consumed by name from the L-functions
     roadmap's Layer 0.2 together with `dual_gammaFactor`, `dual_dual`, `dual_degree` and the
     three predicate-transport theorems. ⚠ It is that roadmap's object and not this one's: a
     functional equation for a non-self-dual record names a second *record*, so the supplier has
     to own it, and every statement below cites `d.dual`;
   - **the functional equation, against that dual record**, as an equality of meromorphic
     germs and with no division:
     `d.gammaFactor s * continuedL d s = d.rootNumber * (N : ℂ)^(1/2 − s) * d.dual.gammaFactor (1 − s) * continuedL d.dual (1 − s)`.
     ⚠ It relates `d` to `d.dual`, not `d` to itself. For a self-dual record — real
     coefficients and real shifts, which covers `ζ_K` and a real character — `d.dual = d`
     and this reduces to the familiar reflection; for a non-real finite-order Hecke character
     it does not, and that character is the test that catches a statement written as
     `continuedL d s ↔ continuedL d (1 − s)`;
   - **the mandatory ζ test.** `continuedL riemannZetaData = riemannZeta`, and in particular
     `continuedL riemannZetaData 0 = −1/2`. The value at `0` is not a corollary of the others
     and is the one check that the removable extension was taken rather than the quotient;
   - **the two family comparisons**, that `continuedL` of the `ζ_K` record is the L-functions
     roadmap's continued Dedekind zeta function and that `continuedL` of the Hecke record is
     its continued Hecke L-function. ⚠ Both are stated against objects that roadmap currently
     leaves unnamed (see the dependency table), so both wait on a name there; neither may be
     replaced by an existential.
   Every unqualified `L(s)` in later layers means `continuedL d s`. The effect of the
   normalization translation on `continuedL` is **not** here: it is Layer 2.3, with the
   conductor translation it belongs next to.

Acceptance: 5 specializes at `d = 1`, `gammaR = {0}`, `gammaC = ∅` to
`log ‖Gammaℝ(σ + it)‖ = −π|t|/4 + ((σ−1)/2) log |t| + O(1)`, the estimate the Riemann–von
Mangoldt formula for `ζ` runs on; and 6 specializes at `riemannZetaData` to
`continuedL riemannZetaData = riemannZeta` with the value `−1/2` at `0`. ⚠ The second is not
optional and is not implied by the first: a `continuedL` defined as the raw quotient
satisfies every other clause of 6 and fails this one.

### Layer 2: the analytic conductor

1. The three definitions of the conventions table: `arithmeticConductor`,
   `analyticConductorAt`, and `centralAnalyticConductor = analyticConductorAt d (1/2)`, with
   `1 ≤ analyticConductorAt d s` and positivity of each factor.
2. **Two-sided comparison on a strip.** For every `a ≤ b` there are `C₁, C₂ > 0`, depending
   only on `a`, `b`, the degree, and a bound on the spectral parameters — and *not* on the
   arithmetic conductor — with
   `C₁ * arithmeticConductor d * (|t| + 3)^d ≤ analyticConductorAt d (σ + it) ≤ C₂ * arithmeticConductor d * (|t| + 3)^d`
   for `σ ∈ [a, b]`. ⚠ Do not state monotonicity in `|Im s|`: with a complex shift `μ`, the
   factor `|s + μ| + 3` decreases as `Im s` approaches `−Im μ`. Eventual monotonicity in `|t|`
   beyond `max_j |Im μ_j| + max_k |Im ν_k|` is a corollary that may be added with those exact
   hypotheses.
3. **The normalization translation, as an equality.** For a `NormalizationTranslation` of
   weight `w`, `analyticConductorAt (analytic) s = analyticConductorAt (arithmetic) (s + w/2)`
   for every `s`, and `arithmeticConductor` is the same on both sides. State it as this
   equality rather than as a statement that "`q` is invariant and the parameters shift".
   ⚠ It holds for one sign convention only, the supplier's `gammaR_eq` and `gammaC_eq`: the
   analytic shifts are the arithmetic ones **plus** `w/2`, which is what
   `Λ_an(s) = N^{−w/4} Λ_ar(s + w/2)` forces. Under `μ_an = μ_ar − w/2` the displayed equality
   is false. Two instance tests are part of this milestone, and neither is optional: at
   `w = 0` every field reduces to `rfl` and the two conductors agree literally; and at a
   weight-`k` newform, arithmetic `gammaC = {0}` becomes analytic `gammaC = {(k−1)/2}`, the
   central points `k/2` and `1/2` correspond, and 4 becomes an identity. A wrong sign is
   invisible until the second test. **The same translation for the continued L-function of
   Layer 1.6** belongs here and not there, because it is the companion of the conductor
   equality above and not part of the construction:
   `continuedL (analytic) s = continuedL (arithmetic) (s + w/2)`, an equality of meromorphic
   germs at every `s`. ⚠ Derive it from `completed_eq`, `gammaR_eq`, `gammaC_eq`, and
   `conductor_eq` together, not from `coeff_eq`: the coefficient relation gives the identity
   only on the common half-plane of absolute convergence, and the point of `continuedL` is
   everywhere else. The constant `N^{−w/4}` cancels against `N^{s/2}` versus `N^{(s+w/2)/2}`,
   which is a check on the sign convention and is part of the milestone.
4. **The newform specialization, which is where the modular forms roadmap meets this one.**
   This roadmap owns the general `analyticConductorAt` of a record. The modular forms roadmap
   fixes the newform quantity `𝔮(f, s) = N · (|s_an + (k−1)/2| + 3) · (|s_an + (k+1)/2| + 3)`
   as a displayed formula in its Layer 7 and names no declaration for it, so the milestone
   here is the specialization, stated so that it *becomes* the agreement the moment that side
   names its quantity: for the newform record of weight `k` and level `N`, which has
   `gammaR = ∅` and `gammaC = {(k−1)/2}`,
   `analyticConductorAt d s = N * (‖s + (k−1)/2‖ + 3) * (‖s + (k+1)/2‖ + 3)` by unfolding, and
   `centralAnalyticConductor d` is that expression at `s = 1/2`, corresponding to `𝔮(f, k/2)`
   through the translation of 3. ⚠ Prove the displayed unfolding. "The two roadmaps use the
   same convention" is not a theorem, and cannot become one until the other side has a name
   for its quantity.
5. The instances: `arithmeticConductor` is `|d_K|` for the Dedekind zeta record and
   `|d_K| * 𝔑(𝔣)` for a Hecke L-function of primitive conductor `𝔣`. ⚠ These are equalities
   of *arithmetic* conductors; the analytic conductor at a point is that quantity times the
   archimedean factors of 1, and no row of this roadmap equates the two.

### Layer 3: convexity in vertical strips

⚠ Read this warning before writing any milestone here. Convexity is a statement about the
**uncompleted** `continuedL`, and it is not obtained by bounding the completed function and
dividing. Write `n` for `d.degree`. Layer 1.5 gives
`|γ(σ + it)| = exp(−π n |t|/4) · |t|^{A(σ) + o(1)}`, so a polynomial bound
`‖Λ(σ + it)‖ ≤ C(1 + |t|)^A` — which is true, and is what Layer 0.4 proves — divides to give
`‖continuedL(σ + it)‖ ≤ C(1 + |t|)^{A'} exp(+π n |t| / 4)`. That is an exponentially growing
bound, not `q^{1/4 + ε}`, and no choice of `A` repairs it: the completed function is
exponentially *small* on every vertical line, and a polynomial upper bound for it throws away
exactly the factor the division then needs back. The Phragmén–Lindelöf interpolation must
therefore be run on the uncompleted function, whose two edge bounds are polynomial in the
analytic conductor with no exponential in either.

1. **The Phragmén–Lindelöf input**, packaged once and consumed twice, stated for a function
   with **no poles in the strip**: if `g` is holomorphic on a closed strip, of finite order
   there, and bounded by `C(1 + |t|)^{a}` on the left edge and `C(1 + |t|)^{b}` on the right
   edge, then it is bounded by `C'(1 + |t|)^{ℓ(σ)}` on the strip, `ℓ` the linear
   interpolation. Consume `Complex.PhragmenLindelof.vertical_strip`; the work is checking its
   growth hypothesis (`isBigO_sub_exp_rpow`) — which admits growth as fast as
   `exp(B exp(c|t|))` for `c` below `π` over the width of the strip, so order-one growth is
   comfortably inside it. ⚠ Poles are never inside: the two consumers are 0.4, which applies
   it to `entireCompletion d`, and 3 below, which applies it to a pole-cleared multiple of
   `continuedL d`. It is never applied to `Λ` or to `continuedL` on a strip meeting their
   polar supports, and the passage back to the original function is division by the clearing
   polynomial and by nothing else.
2. **The two edges**, both stated for `continuedL d` of Layer 1.6:
   - on `Re s = 1 + δ`, `‖continuedL d s‖ ≤ C(δ)` from absolute convergence of the Dirichlet
     series through the agreement of 1.6 and the average coefficient bound;
   - on `Re s = −δ`, `‖continuedL d s‖ ≤ C(δ) * analyticConductorAt d s ^ (1/2 + δ)` from the
     functional equation of 1.6 against `d.dual`, together with the **uniform Stirling
     estimate for the gamma quotient**: by Layer 1.5 applied to both records,
     `log ‖d.dual.gammaFactor (1 − s) / d.gammaFactor s‖ = (n/2)(1 + 2δ) log |t| + O(1)`,
     the two exponentials `exp(−π n |t| / 4)` cancelling because conjugating the shifts
     changes no real part. ⚠ That cancellation is the whole content of this edge and
     is a named sub-milestone; a proof that estimates the two gamma factors separately and
     multiplies the bounds proves nothing. With `N^{1/2−σ}` from the conductor powers and the
     two-sided comparison of 2.2, the right-hand side is the displayed power of `q`.
3. **The strip bound for the pole-cleared continued L-function**, which is the named theorem
   the later layers cite, and which is stated on the whole closed strip rather than only on
   the central line. Two objects come first, and the second of them is where the previous
   draft was wrong.

   - **The clearing polynomial** `clearingPoly d δ : Polynomial ℂ`, the monic
     `∏_p (X − p)^{n_p}` over the points `p` with `Re p ∈ [−δ, 1 + δ]` and
     `n_p = −meromorphicOrderAt (continuedL d) p > 0`. By the order formula of 1.6 those are
     the points of `d.polarOrder.support` in the strip where the gamma zero does not cancel the
     pole, a finite set, so this is a genuine polynomial; its degree and its root
     multiplicities are part of the milestone.
   - **⚠ The pole-cleared function is an analytic extension, not a product.**
     `poleClearedContinuedL d P : ℂ → ℂ`, for a polynomial `P` whose root multiplicities
     dominate the pole orders of `continuedL d` in the strip, is the **removable analytic
     extension** of `s ↦ P.eval s * continuedL d s` across the roots of `P`. Writing
     `P · continuedL d` instead is the same defect as the raw quotient 1.6 exists to avoid, and
     it is not a small one: the raw product is not continuous at a cleared pole, so
     Phragmén–Lindelöf does not apply to it. At the ζ instance with `P = X − 1` the raw product
     has the value `(1 − 1) · riemannZeta 1 = 0`, because `riemannZeta 1` is a junk value,
     whereas the extension has the value `1`, the residue. An inequality stated for the raw
     product may typecheck, since `0` satisfies any upper bound, and still bound nothing.

     The API, each clause a named theorem: agreement with `s ↦ P.eval s * continuedL d s` off
     the roots of `P`; the removable analytic extension at each root; `AnalyticOnNhd ℂ` on an
     open neighbourhood of the closed strip; the order formula
     `meromorphicOrderAt (poleClearedContinuedL d P) z = meromorphicOrderAt (continuedL d) z + meromorphicOrderAt P z`
     at every `z`; and finite order on the strip, which is the hypothesis 1 needs. ⚠ The
     mandatory test is `poleClearedContinuedL riemannZetaData (X − 1) 1 = 1`. It is not a
     corollary of the other clauses, and a definition by the raw product satisfies all of them
     and fails this one — exactly as `continuedL riemannZetaData 0 = −1/2` works in 1.6.

   Then 1 applied to `poleClearedContinuedL d P` with the edges of 2 gives, for every `δ > 0`,
   a constant `C` with
   `‖poleClearedContinuedL d P s‖ ≤ C * (1 + |Im s|)^{deg P} * analyticConductorAt d s ^ ((1/2 + δ)(1 + δ − σ)/(1 + 2δ))`
   throughout `σ = Re s ∈ [−δ, 1 + δ]`. ⚠ The factor `(1 + |Im s|)^{deg P}` is `P`'s own growth
   and is not optional: the edges of 2 bound `continuedL`, so multiplying them by `P`
   multiplies them by that factor, which then interpolates unchanged. ⚠ The conductor is
   **not** an interpolated quantity: `Complex.PhragmenLindelof.vertical_strip` interpolates the
   exponent of `(1 + |t|)` with a constant fixed in advance, so the two arithmetic-conductor
   powers at the edges, `N^{1/2+δ}` and `N^0`, are carried by hand and only then reassembled
   with `q ≍ N(|t| + 3)^{degree}` from 2.2. Interpolating on `q` directly is what loses the
   conductor-uniformity this milestone is about. ⚠ The final division is by `P` only. Nothing
   here divides by `γ`, and no exponential appears on either side at any step.
   Two corollaries, both part of the milestone:
   - **the central-line convexity bound**, at `σ = 1/2`, where the exponent
     `(1/2 + δ)(1/2 + δ)/(1 + 2δ)` is exactly `1/4 + δ/2`: for every `ε > 0` there is `C` with
     `‖poleClearedContinuedL d P (1/2 + it)‖ ≤ C * (1 + |t|)^{deg P} * analyticConductorAt d (1/2 + it) ^ (1/4 + ε)`,
     and hence, since the critical line misses the roots of `P` and the extension agrees with
     the product there, after dividing by `P` — whose modulus is bounded below by
     `c (1 + |t|)^{deg P}` on a line at positive distance from its roots —
     `‖continuedL d (1/2 + it)‖ ≤ C * analyticConductorAt d (1/2 + it) ^ (1/4 + ε)` for a
     record whose polar support does not meet the critical line, with `C` depending in
     addition on a lower bound for the distance from that line to the polar support. ⚠ The
     clearing factor may not be dropped silently: a record is permitted a pole at `1/2 + it₀`,
     and there the uncleared statement is false. ⚠ Pin the uniformity: `C` depends on `ε`, on
     the degree, on a bound for the spectral parameters, and on the constant in the average
     coefficient bound, and **not** on the arithmetic conductor. A version whose constant may
     depend on the conductor is a different, weaker theorem and does not discharge this
     milestone;
   - **the wide-strip bound above the polar heights**, which is the shape Layer 4.7 consumes:
     for every closed strip `[a, b]` there are `C`, `B`, and `T₀` with
     `‖continuedL d (σ + it)‖ ≤ C * analyticConductorAt d (σ + it) ^ B` for `σ ∈ [a, b]` and
     `|t| ≥ T₀`, `T₀` any bound for the imaginary parts of the polar support. Above that height
     the roots of `P` are behind us, so `poleClearedContinuedL d P` and the product agree, `P`
     is bounded away from `0`, and the division is harmless. Layer 4.7 uses it on `[−2, 6]`.
     ⚠ This corollary is the only one of the three stated for `continuedL` itself, and that is
     legitimate precisely because of the height restriction; on the strip as a whole the named
     theorem is about `poleClearedContinuedL`, and Layer 4.7 cites this corollary and not the
     strip bound.
4. **Finite order and vertical-strip growth for the two families.** `entireCompletion` of
   `ζ_K`, and of `Λ(χ, ·)` for a primitive finite-order ray-class character `χ`, satisfies
   `OrderLE _ 1`; with Layer 0.4 both families then satisfy `HasVerticalStripGrowth`. Proof:
   the Mellin representation of the L-functions roadmap's Layers 3 and 5 gives an integral
   bound, which 1 turns into the growth hypothesis `isBigO_sub_exp_rpow` wants, and the
   functional equation reflects it to the left half-plane. This discharges the hypothesis
   Layer 0.3 leaves open. ⚠ It lives here, not in Layer 6, because every later family
   statement needs it: Layer 4.7's local count uses the vertical-strip bound and Layer 5.7's
   corollaries use `OrderLE _ 1`, and both come before the zero-free regions. Its only
   arithmetic input is the Mellin representation, so it needs nothing from Layers 4 to 6.

⚠ Subconvexity is out of scope. No milestone improves the exponent `1/4`.

### Layer 4: zero counting

Items 1–6 are generic complex analysis over an arbitrary meromorphic function (4A in the
dependency graph); 7–8 are the family-specific local count that needs the Euler product (4B);
9–11 are the counting function and its API.

1. `divisorCount f U R : ℤ`, the finsum of `MeromorphicOn.divisor f U` over `R ⊆ U`, and
   `zeroCount f U R : ℕ`, the finsum of the positive part `(MeromorphicOn.divisor f U)⁺`.
   Both take the ambient open `U` on which `f` is meromorphic and the counting region `R`
   separately. Theorems: each is finite when `R` is bounded and `f` is meromorphic on a
   neighborhood of its closure (through `Function.locallyFinsupp.locallyFiniteSupport` and
   `LocallyFiniteSupport.finite_inter_support_of_isCompact`); `divisorCount = zeroCount` when
   `R` contains no pole, stated as `∀ z ∈ R, 0 ≤ divisor f U z`; and both are `0` when `R` is
   empty. ⚠ A `∑ᶠ` over an infinite support is silently `0`, so finiteness is a hypothesis or
   a companion theorem of every statement below, never left implicit.
2. `zeroDivisor`: for a record satisfying the continuation predicate, `divisor Λ U` on an open
   `U`, with the theorem that it is nonnegative away from the polar divisor's support and
   agrees with `−polarOrder` on it; and the identity relating it to
   `divisor (entireCompletion d) univ` from Layer 0.2.
3. **Exact additivity, on half-open rectangles.** For a subdivision of
   `Icc σ₁ σ₂ ×ℂ Ioc t₁ t₃` at a height `t₂` into the two half-open rectangles it splits
   into, the counts add; and likewise for a finite subdivision by heights, since the pieces
   are pairwise disjoint with union the whole. ⚠ Finiteness is a hypothesis: `∑ᶠ` is `0` on
   an infinite support, so the statement carries meromorphy on `U`, containment of the closed
   rectangle in `U`, and finiteness of the divisor support there, and says nothing without
   them. ⚠ The half-open direction is the imaginary one, so this is a subdivision in height.
   A subdivision in `Re s` shares a vertical edge, which the convention leaves closed on both
   sides: state that case either with a half-open real interval as well, or under the
   hypothesis that the shared internal edge carries no zeros or poles
   (`meromorphicOrderAt f z = 0` there). ⚠ The fully closed version is false as stated: two
   closed rectangles sharing an edge both contain a zero on it, so it is counted twice.
4. **Monotonicity and enlargement.** Where the divisor is nonnegative, `R ⊆ R'` gives
   `zeroCount f U R ≤ zeroCount f U R'`, by `MeromorphicOn.divisor_restrict` and summation of
   a nonnegative function. The count is unchanged under enlargement exactly when the divisor
   vanishes on `R' \ R`; ⚠ zero-freeness of the two boundaries is not enough, since the
   region between them can contain zeros.
5. **Jensen's bound on a disc, generic.** From `AnalyticOnNhd.sum_divisor_le` with its actual
   hypotheses — `0 < |r| < |R|`, `1 ≤ M`, `f` analytic on `closedBall c |R|`, `f c ≠ 0`, and
   `‖f‖ ≤ M` on `sphere c |R|` — the count of zeros in `closedBall c |r|`, with multiplicity,
   is at most `Real.log (M / ‖f c‖) / Real.log (R / r)`. Its left-hand side is literally
   `zeroCount` for analytic `f`, so no translation lemma is needed. Its trailing-coefficient
   variant drops `f c ≠ 0` in favor of `log ‖meromorphicTrailingCoeffAt f c‖` on the right
   (`MeromorphicOn.circleAverage_log_norm` already tolerates `f c = 0`, and the ingredients are
   in `JensenFormula.lean`). ⚠ Both forms need a **lower** bound on the denominator to yield a
   numerical count. Growth of `f` alone gives none, and no milestone here claims otherwise.
6. **Box-to-disc reduction.** A closed rectangle lies in the disc through its corners:
   `Icc σ₁ σ₂ ×ℂ Icc t₁ t₂ ⊆ closedBall c r₀` with `c` the center and
   `r₀ = ½√((σ₂ − σ₁)² + (t₂ − t₁)²)`. ⚠ Only upper bounds transfer, by 4 and nonnegativity
   of the divisor; the disc count exceeds the rectangle count by the zeros in the four
   circular segments, and no combination of disc counts is an exact rectangle count.
   Subdividing `Icc 0 1 ×ℂ Ioc t (t + T)` into unit-height rectangles puts each inside the
   disc of radius `√2/2` centered on the critical line at `1/2 + i(t + k + 1/2)`.
7. **The local count for the two families.** For `Λ_K` and for `Λ(χ, ·)` with `χ` a primitive
   finite-order ray-class character, and every `T ≥ 2`, the number of zeros of
   `Λ₀ = entireCompletion` in `closedBall (1/2 + iT) 1` is
   `O(log (analyticConductorAt d (iT)))`. ⚠ What Jensen's bound of 5 consumes is the *ratio*
   `M/‖Λ₀ c‖`, and it must be bounded before the two factors are estimated separately: the
   gamma factor contributes `exp(−π d |t| / 4)` to both numerator and denominator, and an
   upper bound `M = O(q(iT)^B)` against a lower bound carrying that exponential would give
   `log(M/‖Λ₀ c‖) = O(T)`, which is useless. The milestone is therefore the ratio bound
   itself, and the exponential factors are cancelled inside it, never estimated apart:
   - basepoint `c = σ₀ + iT` with `σ₀ = 2`, where the Dirichlet series converges absolutely,
     so `continuedL d (σ₀ + iT) = LSeries d.coeff (σ₀ + iT)` by Layer 1.6 and
     `|continuedL d (σ₀ + iT)| ≥ ζ_K(σ₀)^{-1} > 0`, since each Euler factor satisfies
     `|1 − χ(𝔭) 𝔑𝔭^{-s}| ≤ 1 + 𝔑𝔭^{-σ₀}` and `∏_𝔭 (1 + 𝔑𝔭^{-σ₀}) ≤ ζ_K(σ₀)`. This is the
     nonvanishing input Jensen's formula needs and the reason this item consumes the
     L-functions roadmap's Layer 1. ⚠ The Euler product is used **only here**, on
     `Re s = 2 > 1`; nothing below applies Dirichlet agreement off that half-plane;
   - radii `r = 3` and `R = 4`, so that `closedBall (1/2 + iT) 1 ⊆ closedBall c 3` and the
     sphere `sphere c 4` lies in the strip `Re s ∈ [−2, 6]` and in the height range
     `|Im s − T| ≤ 4`;
   - the ratio bound `sup_{z ∈ sphere c 4} ‖Λ₀ z‖ / ‖Λ₀ c‖ ≤ analyticConductorAt d (iT) ^ B`
     for an explicit `B` and all `T ≥ T₀`. Both sides are written through
     `Λ₀ = (clearing polynomial) · conductor^{s/2} · γ · continuedL d` of Layer 1.6, which is
     an identity of meromorphic germs on all of `ℂ` and so is legitimate on the whole sphere;
     the two gamma factors are compared by Layer 1.5 on the same height range, where
     `|Im z| = T + O(1)` makes their exponential parts agree to within a bounded factor and
     leaves a power of `T`. ⚠ The exponential decay cancels only when the numerator keeps it:
     the numerator's `γ(z)` and the denominator's `γ(c)` both carry `exp(−π d T/4 + O(1))`,
     and the ratio is a power of `T` precisely because the *uncompleted* factor is bounded by
     a power of the conductor on the whole sphere. That bound is Layer 3.3's wide-strip
     corollary on `Re z ∈ [−2, 6]`, and it is the only route: ⚠ bounding `Λ₀` itself by
     Layer 3.1 and dividing would discard the numerator's exponential and leave
     `exp(+π d T/4)` in the ratio, which is exactly the error Layer 3's opening warning
     describes. Layer 3.3's own proof splits the strip into `Re z ≥ 1 + δ` by absolute
     convergence, `Re z ≤ −δ` by the functional equation of Layer 1.6 against `d.dual`,
     and the middle by Phragmén–Lindelöf on the pole-cleared function; this item cites the
     resulting theorem and does not repeat the split. Bounded `T ≤ T₀` is a separate finite
     statement;
   - conclude by 5. Both radii, the basepoint, the exponent `B`, and the three-region split
     are part of the statement.
8. **The counting bounds that need no contour integral.** From 6 and 7:
   `N(T + 1) − N(T) = O(log (analyticConductorAt d (iT)))` for `T ≥ 2`, and
   `N(T) = O(T log (analyticConductorAt d (iT)))`. These are the strongest counting statements
   provable before Layer 7, and Layer 8.4's convergence of the zero side runs on the first of
   them.
9. `N (T : ℝ) : ℕ`, the `zeroCount` of `Λ` over `Icc 0 1 ×ℂ Ioc 0 T` per the counting
   convention, together with:
   - monotonicity in `T`, and `N 0 = 0`;
   - the symmetric count `N± (T)` over `Icc 0 1 ×ℂ Icc (−T) T`;
   - ⚠ the relation between them is **not** `N± = 2N + (real axis)` for every family. It holds
     when the zero divisor is invariant under `ρ ↦ conj ρ`, which for `ζ_K` follows from the
     reality of its coefficients, and for `L(χ, ·)` requires `χ` real. State three theorems:
     the Dedekind zeta case; the real (self-dual) Hecke character case, under the explicit
     hypothesis `Λ(χ, conj s) = conj (Λ(χ, s))`; and for a general finite-order `χ`, the
     relation between the count for `χ` above the axis and the count for `χ̄` below it. No
     bundled class: the reality hypothesis is written into each statement.
10. Finiteness of `N` on every bounded height range, and discreteness of the zero set of `Λ`
    in the critical strip — the model-class generalization of `isDiscrete_riemannZetaZeros`,
    which becomes a corollary at the ζ instance.
11. **The comparison with Nevanlinna theory**, so that the library does not grow two zero
    counts. Exactly three lemmas: `zeroCount f univ (closedBall 0 r)` is the classical
    unintegrated `n(r, f)`, which Mathlib does not name;
    `Function.locallyFinsuppWithin.logCounting (divisor f univ) r` is its log-weighted
    integral `N(r)`; and `n(r) * Real.log (R/r) ≤ N(R) − N(r)` for `0 < r < R`, with
    `logCounting_divisor_eq_circleAverage_sub_const` as the Jensen identity on the
    `logCounting` side.

### Layer 5: Hadamard factorization

The mathematics of this layer is entirely new — Mathlib has no order of an entire function,
no elementary factor, no canonical product, no genus, and no Weierstrass product even for
`Complex.Gamma` — but the infinite-product infrastructure is not. Locally uniform convergence
of `∏ (1 + f_i)`, holomorphy of the limit, and the logarithmic derivative of a product are all
upstream, and `Analysis/SpecialFunctions/Trigonometric/Cotangent.lean` carries the genus-`0`
case through end to end, from `Complex.multipliable_sineTerm` to the partial-fraction
expansion `Complex.cot_series_rep`. That arc is the model for 4 through 6 below; `Λ₀'/Λ₀` is
the same shape of statement as `π cot(πz)`. ⚠ `Analysis/Complex/Hadamard.lean` is the
three-lines theorem, not this. Everything in 1–6 is stated for a general entire function; the
identities special to an L-function are in 7.

1. The counting-function bound for an entire `f` with `OrderLE f A` and `f 0 ≠ 0`: the count
   of zeros in `closedBall 0 r` is `O(r^{A + ε})` for every `ε > 0`, from Layer 4.5 with
   center `0` and the basepoint value `‖f 0‖`. (Mathlib's First Main Theorem gives the
   integrated form `N(r, 0) ≤ log M(r) + O(1)` by
   `characteristic_sub_characteristic_inv_of_ne_zero` and `proximity_nonneg`; that is a check
   on this bound, not a second route to it, since it counts `N(r)` where the rest of this
   layer needs `n(r)`.)
2. **The zero index.** The zeros are the support of `MeromorphicOn.divisor f Set.univ`, which
   is countable and locally finite; the canonical product below is indexed by that support
   with the divisor value as multiplicity, so no enumeration is chosen and no reindexing
   lemma is needed. The milestone is the API: countability of the support, its local
   finiteness, the induced `Multipliable`/`Summable` statements over it, and the convention
   that a zero at `0` is excluded by the standing hypothesis `f 0 ≠ 0` rather than by
   factoring out a power of `s`.
3. The Weierstrass elementary factor `E₁ z = (1 − z) * Complex.exp z`, with its complete basic
   API: `E₁ 0 = 1`, `E₁ z = 0 ↔ z = 1`, `deriv E₁ z = −z * exp z`,
   `logDeriv E₁ z = −z/(1 − z)` for `z ≠ 1`, the estimate `‖E₁ z − 1‖ ≤ C‖z‖²` for
   `‖z‖ ≤ 1/2`, and the crude global bound `Real.log ‖E₁ z‖ ≤ C(1 + ‖z‖)`.
4. **The canonical product.** For `f` entire with `OrderLE f 1` and `f 0 ≠ 0`,
   `∑_ρ (divisor f univ ρ) * ‖ρ‖^{-1-ε} < ∞` for every `ε > 0` by partial summation from 1,
   hence `∑_ρ (divisor f univ ρ) * ‖ρ‖^{-2} < ∞`. The product `∏_ρ E₁(s/ρ)^{divisor f univ ρ}`
   converges locally uniformly on `ℂ` — `MultipliableLocallyUniformlyOn` via
   `multipliableLocallyUniformlyOn_one_add` with the estimate of 3 as dominating sequence —
   its limit is entire (`SummableLocallyUniformlyOn.differentiableOn`), and its divisor is
   `divisor f univ` (`tprod_one_add_ne_zero_of_summable` off the zeros).
5. **The entire logarithm.** A nonvanishing entire `g` is `exp ∘ h` for an entire `h`, unique
   up to `2πi ℤ`: consume `Complex.exists_continuousOn_eqOn_exp_comp` on `Set.univ` (open,
   simply connected) and upgrade continuity to holomorphy. This is a milestone rather than a
   step, because Hadamard's theorem is stated through it.
6. **Hadamard's theorem at order `≤ 1`.** For entire `f` with `OrderLE f 1` and `f 0 ≠ 0`
   there are `a b : ℂ` with `f s = exp (a + b*s) * ∏_ρ E₁(s/ρ)^{divisor f univ ρ}`. The half
   that needs work: the quotient of `f` by the product of 4 is entire and nonvanishing, so by
   5 it is `exp h`; bound `Re h` on a large circle by the order hypothesis, convert to a bound
   on `h` by `Complex.borelCaratheodory`, and conclude `h` is a polynomial of degree `≤ 1` by
   the Cauchy estimates. Then the logarithmic derivative
   `logDeriv f s = b + ∑_ρ (divisor f univ ρ) * (1/(s − ρ) + 1/ρ)` by
   `logDeriv_tprod_eq_tsum`, the series converging locally uniformly on `ℂ \ support`, and
   absolutely for each fixed `s` off the zeros. ⚠ State the mode of convergence in every
   statement; "converges" without one is not a statement.
7. **The L-function corollaries**, where the family enters. For `Λ₀ = entireCompletion d` of
   one of the two families:
   - the nonnegativity `0 ≤ ∑_ρ (divisor Λ₀ univ ρ) * Re (1/(s − ρ))` for `Re s > 1`, as an
     absolutely convergent sum of real parts — never as `Re ∑_ρ 1/(s − ρ)`, which needs a
     summation convention the roadmap does not fix — together with the pointwise statement
     that each summand is *strictly* positive, since `0 ≤ Re ρ ≤ 1 < Re s` gives
     `Re (1/(s − ρ)) = (Re s − Re ρ)/‖s − ρ‖² > 0`. ⚠ The sum itself is only nonnegative
     until a zero is known to exist: strict positivity of an empty sum is false, and the
     existence of a zero is Layer 7.7, which comes later. The zero-free-region argument
     discards this sum and so needs only the inequality as stated;
   - `Re b = −∑_ρ (divisor Λ₀ univ ρ) * Re (1/ρ)`, which is **false for a general entire
     function of order `≤ 1`** (multiplying by `exp (c s)` changes `b` and no zero) and is
     proved here from the functional equation together with the reality hypothesis
     `Λ₀(conj s) = conj (Λ₀ s)`, which `ζ_K` satisfies and a non-real `χ` does not. For a
     non-real character, state instead the relation between `b(χ)` and `b(χ̄)`.
   - the resulting bound on the number of zeros with `|Im ρ − T| ≤ 1`, which is Layer 4.7
     re-proved from the partial-fraction expansion, stated as a bound with the same
     `O(log (analyticConductorAt d (iT)))` shape and used in Layer 6.

### Layer 6: zero-free regions

⚠ Each statement here names its family. There is no zero-free region for a general record
satisfying the Layer-0 predicates: the argument needs the Euler product, nonnegativity of the
von Mangoldt coefficients, and the `3-4-1` inequality, none of which the model class has.

1. **Quantitative `3-4-1`.** For `σ > 1`,
   `3 (−ζ'_K/ζ_K)(σ) + 4 Re(−L'/L)(σ + it, χ) + Re(−L'/L)(σ + 2it, χ²) ≥ 0`,
   from `3 + 4cos θ + cos 2θ ≥ 0` and nonnegativity of the ideal von Mangoldt coefficients.
   This is the L-functions roadmap's Layer-7.4 argument with the inequality kept rather than
   discarded at the limit.
2. **The de la Vallée Poussin region for `ζ_K`.** There is `c > 0`, depending only on the
   degree `[K:ℚ]`, such that `ζ_K` has at most one zero `ρ` with
   `Re ρ ≥ 1 − c/log (analyticConductorAt d (i * Im ρ))`, and if such a `ρ` exists then it is
   real and simple. ⚠ Pin the constant's dependence as displayed: `c` is not absolute and is
   not allowed to depend on the individual field beyond its degree.
3. **The exceptional zero.** `IsExceptionalZero d β`, the predicate saying that `β` is real,
   lies in the region of 2, and is a zero of the completed function; together with the
   uniqueness theorem "at most one `β` satisfies it, and its order is `1`". ⚠ Do not define an
   unconditional `exceptionalZero : ℝ`; a total definition would export an arbitrary real when
   no exceptional zero exists. Either take the argument `(h : ∃ β, IsExceptionalZero d β)` or
   return `Option ℝ` with both cases specified. No milestone claims the exceptional zero does
   not exist, and none identifies it with the zero of a quadratic character's L-function:
   that is a Stark-type theorem and is out of scope.
4. **The region for Hecke L-functions.** For `χ` a primitive finite-order ray-class character:
   if `χ` is not real, `L(χ, ·)` has no zero in the region of 2; if `χ` is real, it has at
   most one, and that one is real and simple. The conductor enters through
   `arithmeticConductor = |d_K| 𝔑(𝔣)` and hence through `analyticConductorAt`.
5. **The two edge theorems, for both families**, recovering what the L-functions roadmap
   proved qualitatively: for `Λ` either `Λ_K` or `Λ(χ, ·)`,
   `∀ ρ, 0 < divisor Λ univ ρ → ρ.re ≠ 1`, and its reflection
   `∀ ρ, 0 < divisor Λ univ ρ → ρ.re ≠ 0` through the functional equation. The first is the
   boundary case of 2 and 4, and at `K = ℚ` it is the pin's
   `riemannZeta_ne_zero_of_one_le_re`. Layer 8.6 consumes the second at `s = 0`.

### Layer 7: the Riemann–von Mangoldt formula

⚠ This is where the count becomes exact, and an exact count is not a Jensen bound: Layer 4
gives inequalities, and equality needs the argument principle. Mathlib has none of the contour
machinery, and this roadmap does not build it. The
[contour integration roadmap](../ContourIntegration/README.md) does, and the theorem consumed
here is its Layer 4 summit, not its Layer 2: its pinned `argumentPrinciple` and
`classicalResidueTheorem_circle` are stated for a **circle**, and the general null-homologous
cycle is exactly what `hungerbuhlerWasem_residueTheorem` provides. Items 1–3 build the
rectangle interface that roadmap does not construct, and are stated generically for that
reason.

⚠ Two hypotheses are load-bearing throughout items 1 to 3, and a statement that omits either
is false rather than merely weak. **Nondegeneracy**: every geometric statement carries
`Rect.Nondegenerate`, not `Rect.Valid`. **Pointwise regularity**: every statement that
evaluates `f`, differentiates it, or follows its image carries `AnalyticAt ℂ f z` and, where
a value is used, `f z ≠ 0` — never `meromorphicOrderAt f z = 0` alone, which constrains the
punctured germ and nothing else. See the two conventions-table rows.

1. **The rectangle as a contour.** For a **nondegenerate** rectangle, the positively oriented
   boundary of `Icc σ₁ σ₂ ×ℂ Icc t₁ t₂` as an explicit `γ : ℝ → ℂ` on `[0, 4]`, with the exact
   structure that roadmap's theorems hypothesize: `IsPwC1ImmersionOn γ 0 4` (each edge is `C¹`
   with nonvanishing derivative, the corners being the piece boundaries and the breakpoint
   witness being `{1, 2, 3}`), `γ 0 = γ 4`, `windingNumber γ 0 4` equal to `1` about each
   interior point and `0` about each point outside the closed rectangle, and
   `IsNullHomologous γ 0 4 U` for every open `U` containing the closed rectangle.
   ⚠ `Rect.Valid` does not suffice for any of these, and the immersion claim is *false* under
   it: if `σ₁ = σ₂` the two horizontal edges are constant maps, so their `derivWithin`
   vanishes identically on a whole piece, contradicting the non-vanishing tangent that
   `IsPwC1ImmersionOn` requires; a point rectangle makes all four edges constant. The
   interior-winding statement is also vacuous under `Valid`, since a degenerate rectangle has
   empty interior. `Rect.Valid` is kept for the *set and count* definitions of Layers 4 and 9,
   where a reversed pair gives an empty region and a count of `0`, and it is not used here.
2. **The argument principle on a rectangle**, stated against an **explicit finite singular
   set** and with the supplier's actual hypotheses rather than with a divisor. For an open
   `U`, a nondegenerate closed rectangle `R ⊆ U`, a finite `S ⊆ U` disjoint from `∂R`, and `f`
   with
   - `AnalyticOnNhd ℂ f (U \ S)`;
   - `MeromorphicAt f s` for each `s ∈ S`;
   - `S` contains every point of `U` at which `meromorphicOrderAt f z ≠ 0`;
   - `AnalyticAt ℂ f z` and `f z ≠ 0` for every `z ∈ ∂R`,

   the conclusion `(2πi)⁻¹ ∮_{∂R} logDeriv f = ∑ s ∈ S, ord_s f`. ⚠ The first and third
   hypotheses are what give the supplier's `DifferentiableOn ℂ (logDeriv f) (U \ S)`, and
   neither alone does: analyticity makes `deriv f` exist, and the third makes every point of
   `U \ S` a point of order `0` — which for an *analytic* function is exactly `f z ≠ 0`, so the
   quotient is defined. That last step is where the two hypotheses have to meet, and it is why
   `MeromorphicOn` plus a divisor is not a substitute for either. It is
   `hungerbuhlerWasem_residueTheorem` applied to `logDeriv f`, and the work is discharging its
   hypotheses, each of which is a named sub-milestone:
   - `IsPwC1ImmersionOn`, `γ 0 = γ 4`, `hγa : γ 0 ∉ S`, `hγU`, and `IsNullHomologous`, all
     from 1 and the boundary disjointness;
   - `DifferentiableOn ℂ (logDeriv f) (U \ S)`, by the argument above;
   - `ConditionAprime γ 0 4 (logDeriv f) S` and `ConditionB γ 0 4 (logDeriv f)` are vacuous
     when no singularity lies on the curve, which is a lemma about those two predicates and
     not an assumption;
   - `residue (logDeriv f) z = meromorphicOrderAt f z` at each `z ∈ S`, which is the local
     content of the argument principle and is that roadmap's `argumentPrinciple_local` read
     through `residue`;
   - the weighted sum `∑ s ∈ S, windingNumber γ 0 4 s * residue (logDeriv f) s` equals
     `∑ s ∈ S ∩ R, ord_s f`, by 1 (the winding numbers are `1` inside and `0` outside). ⚠ State
     the conclusion with the supplier's generalized weights and collapse them by a separate
     named lemma; a conclusion written directly as a sum over `S ∩ R` hides the step where a
     singularity on `∂R` would have a fractional weight, and boundary disjointness is what
     rules that out.
   ⚠ The signed count is what a contour integral computes; the passage to `zeroCount` is the
   no-poles hypothesis of Layer 4.1, and for `Λ` on a rectangle meeting `0` or `1` it is
   `entireCompletion` that must be integrated.
   Two further sub-milestones of this item, each a named theorem:

   **(2a) The bridge from a canonical representative to that finite set**, which is what
   connects 2 to the divisor language every other layer uses. ⚠ `MeromorphicOn f U` together
   with a divisor does **not** give `AnalyticOnNhd ℂ f (U \ S)`: `MeromorphicAt` is a
   punctured-germ condition, so a representative may be redefined at any isolated point
   without changing any order, and the resulting defect is invisible to
   `MeromorphicOn.divisor` while destroying both differentiability and the image curve. The
   sufficient hypothesis to add is `∀ z ∈ U, 0 ≤ meromorphicOrderAt f z → AnalyticAt ℂ f z`,
   the *canonical representative* condition. The L-functions roadmap's records satisfy it by
   `HasMeromorphicContinuation.regular_away`, and `entireCompletion` and `continuedL` inherit
   it from Layers 0.2 and 1.6; that is why the family instances are fine and the generic
   statement still needs the hypothesis written out.

   ⚠ **The finite singular set has to be produced on a smaller domain, and this is not
   bookkeeping.** Item 2's third hypothesis is that `S` contains *every* point of `U` of nonzero
   order. For the functions this layer exists for that is unsatisfiable on the ambient set: a
   completed L-function has infinitely many zeros, so with `U = Set.univ` no finite `S` contains
   them all, and a statement that takes `S = {z ∈ R' | ord ≠ 0}` for a compact `R' ⊆ U` does not
   satisfy the hypothesis over `U` — it omits every zero outside `R'`. The repair is to apply 2
   over a **relatively compact open neighbourhood of the rectangle** and then compare counts.
   The named localization package, each item a theorem:

   - **the neighbourhood.** For `U` open and `R ⊆ U` a compact rectangle, an open `V` with
     `R ⊆ V`, `closure V` compact, and `closure V ⊆ U`; the standard construction from local
     compactness of `ℂ` and compactness of `R`;
   - **local finiteness.** `{z ∈ closure V | meromorphicOrderAt f z ≠ 0}` is finite, from
     Layer 4.1's local finiteness on a compact subset of the domain of meromorphy, so
     `S = {z ∈ V | meromorphicOrderAt f z ≠ 0}` is finite and contains every point of `V` of
     nonzero order — which is item 2's hypothesis **over `V`**, and is what fails over `U`;
   - **analyticity off `S`.** `AnalyticOnNhd ℂ f (V \ S)`, from the canonical-representative
     condition restricted to `V`;
   - **divisor restriction.** `divisor f V z = divisor f U z` for `z ∈ V`, since the order at a
     point is a germ condition and does not see the ambient set, and hence
     `divisorCount f V R = divisorCount f U R`. This is the step that lets a theorem proved on
     `V` be quoted as a statement about the global divisor.

   With those, the theorem is: for `f` meromorphic on `U` satisfying the canonical-representative
   condition, `R ⊆ U` a nondegenerate closed rectangle with
   `∀ z ∈ ∂R, meromorphicOrderAt f z = 0`,
   `(2πi)⁻¹ ∮_{∂R} logDeriv f = divisorCount f U R`.
   ⚠ Its hypotheses are **local**: no global finiteness of the divisor support appears, and
   `intervalIntegral_logDeriv_eq_divisorCount` is stated that way. A version carrying
   `{z ∈ U | meromorphicOrderAt f z ≠ 0}.Finite` is a theorem about a function with finitely
   many zeros, which is not the case this layer is for.

   **(2b) From the principal value to the ordinary integral.** The supplier's conclusion is
   `HasCauchyPV γ 0 4 (logDeriv f) v`, not an interval integral. The theorem is that when the
   integrand is continuous on the image of `γ` — which is what `AnalyticAt ℂ f z` and
   `f z ≠ 0` on `∂R` give, and what the order condition alone does not —
   `HasCauchyPV γ a b g v` implies `∫ t in a..b, deriv γ t • g (γ t) = v`. Without it the
   Layer-7 statements are about a principal value and the Layer-9 statements are about a
   count, and nothing connects them.
3. **The argument-variation form and `S(T)`.** For `f` **analytic and nonvanishing at every
   point of** `∂R` — the pointwise hypothesis, not the order condition — the image curve
   `f ∘ ∂R` misses `0` and is continuous, so
   `Complex.exists_continuousOn_eqOn_exp_comp` on an open interval containing `[0, 4]` gives a
   continuous `θ : ℝ → ℝ` with `f (∂R t) = ‖f (∂R t)‖ * exp (i θ t)`. ⚠ That the image curve
   misses `0` is a *consequence of the hypothesis and not of the order*: with only
   `meromorphicOrderAt f z = 0` on `∂R`, the function equal to `1` near `∂R` except for the
   value `0` at one boundary point satisfies every order condition, and its image curve passes
   through `0`, so no lift exists and this milestone is false as it would then be stated.
   ⚠ The lift is unique only up to a global `2π ℤ`, and no basepoint value may be *asserted*:
   `θ 0` is some argument of `f (∂R 0)`, not `0`, and every statement uses only a difference
   `θ b − θ a`, which is independent of the choice. With that,
   `(divisorCount f U R : ℝ) = (θ 4 − θ 0)/(2π)`, and this real number is
   `windingNumber (f ∘ ∂R) 0 4 0` of the contour roadmap's Layer 0.
   `S (T : ℝ) : ℝ` is defined from `riemannZeta`, not from the completed function, whose gamma
   and conductor factors contribute an argument of their own: `π⁻¹` times the variation of a
   continuous argument of `ζ` along the polygonal path `2 → 2 + iT → 1/2 + iT`, started at the
   positive real value `ζ 2`, where the argument is `0` because that value is positive real and
   not by fiat, and with `T` not the ordinate of a zero. This is the form Backlund's method
   runs on; the bound on the number of sign changes of `Re ζ` along the horizontal segment that
   it needs is a Jensen argument on discs, from Layer 4.5.
4. **For `ζ`, first.** `N(T) = (T/2π) * Real.log (T/(2πe)) + O(Real.log T)` for `T ≥ 2`, with
   `N` as in Layer 4.9. Proof by 2 on `Icc (−1) 2 ×ℂ Icc 0 T`, which is nondegenerate for
   `T > 0`, applied to `entireCompletion` rather than to `Λ` — whose poles at `0` and `1` sit
   on the lower edge, so 2 does not apply to it, and clearing them is what Layer 0.2 is for.
   The canonical-representative hypothesis of 2a is discharged by Layer 0.2, which builds
   `entireCompletion` as an analytic extension and so makes it analytic at every point of
   nonnegative order. Three steps connect the contour count to
   `N(T)`: the divisor identity of Layer 4.2, so that the count for the entire completion
   differs from the one for `Λ` only at `0` and `1`; the confinement of the remaining zeros to
   the critical strip, so that the count over `Re s ∈ [−1, 2]` is the count over `[0, 1]`; and
   the half-open convention of Layer 4.9 for the bottom edge. The main term comes from Layer
   1.5 for the gamma factor, and the error from Layer 3 for `‖ζ‖` on the right edge together
   with 3 for the argument variation.
5. **Boundary heights.** 4 is proved first for `T` not the ordinate of a zero, where the top
   edge is regular. The extension to every `T ≥ 2` is a milestone, not a remark: `N` is
   right-continuous in `T` by the half-open counting convention, the set of ordinates is
   discrete by Layer 4.10, and moving the top edge up by `η → 0` past a zero of multiplicity
   `m` changes the count by exactly `m` while changing the main term by `O(η log T)`. State
   which convention the formula uses and prove that both one-sided limits satisfy it.
6. **For the two families, uniformly in the conductor.** For `Λ_K` of degree `n = [K:ℚ]`,
   `N±_K(T) = (T/π) * Real.log (|d_K| * (T/(2πe))^n) + O(Real.log (|d_K| * T^n))` for `T ≥ 2`,
   the count being `N±` of Layer 4.9, with the implied constant depending only on `n`; and the
   same statement for `L(χ, ·)`, of the same degree `n`, with `|d_K| 𝔑(𝔣)` in place of
   `|d_K|`. ⚠ The two counting conventions differ by a factor of two; each formula names which
   it uses, and the conversion is Layer 4.9's, with its reality hypothesis. The main term must
   carry the degree and the conductor explicitly — a formula stated only for `ζ` does not
   discharge this milestone.
7. **The corollaries, as a finite list of four.** For fixed `K`: `N(T)/(T log T) → n/(2π)` as
   `T → ∞`; `Λ` has infinitely many zeros; the averaged unit-height count
   `T⁻¹ ∫_0^T (N(t + 1) − N(t)) dt / log T → n/(2π)`; and the specialization of 6 to `K = ℚ`
   recovering 4. ⚠ The third is stated as an average on purpose. The error term in 6 is the
   same order as the main term of the unit-height difference, so 6 does not prove a pointwise
   asymptotic for `N(T+1) − N(T)`, and no pointwise asymptotic is a milestone here. ⚠ Nothing here
   bounds an individual gap between consecutive ordinates, and differencing 6 does not: its
   error is `O(log q(iT))`, the same size as the main term of the difference. The unit-height
   *bound* `N(T+1) − N(T) = O(log q(iT))` is Layer 4.8's and needs no contour integral.

### Layer 8: the explicit formula

Items 1 to 5 are stated for `ζ_K`; the Hecke case is item 6, which lists the exact
substitutions rather than asserting that it has "the same shape". Fix `r₁, r₂` the real and
complex places of `K`, so `γ_K(s) = Gammaℝ(s)^{r₁} Gammaℂ(s)^{r₂}` and
`Λ_K(s) = |d_K|^{s/2} γ_K(s) ζ_K(s)`.

1. **The truncated Perron input, consumed.** Apply
   `ArithmeticDirichletSeries.perronFormula` for `x > 0`, `x ≠ 1`, `c > 0`, and `T ≥ 1`, and
   `perronFormula_endpoint` at `x = 1`. The latter fixes the finite-height value as
   `π⁻¹ * Real.arctan (T / c)`, not `1/2`; half weight appears only in the limit. This roadmap
   proves the L-function-specific interchange and contour shift below, but does not restate the
   generic kernel. Item 3 excludes `x` at a prime-power norm rather than silently assigning an
   endpoint convention.
2. **The contour shift.** The integrand is `s ↦ (−ζ'_K/ζ_K)(s) * x^s / s`. Move the segment
   from `Re s = c` to `Re s = −(2N + 1/2)` across the rectangle with horizontal edges at
   `±iT`, and let `N → ∞`. The poles crossed, with their residues, are exactly:
   - `s = 1`, from the simple pole of `ζ_K`: residue `x`;
   - each `ρ` with `0 < divisor Λ_K univ ρ` and `|Im ρ| ≤ T`: residue
     `−(divisor Λ_K univ ρ) * x^ρ/ρ`;
   - `s = 0`, where `ζ_K` vanishes to order `r₁ + r₂ − 1`: residue
     `c_K − (r₁ + r₂ − 1) * Real.log x`, with
     `c_K = lim_{s→0} ((−ζ'_K/ζ_K)(s) + (r₁ + r₂ − 1)/s)`;
   - each trivial zero `s = −m`, `1 ≤ m ≤ 2N`, where `ζ_K` vanishes to order `r₁ + r₂` for `m`
     even and `r₂` for `m` odd: residue `(order) * x^{-m}/m`.
   The milestone includes: that the left edge tends to `0` as `N → ∞` for `x > 1`, so the
   trivial-zero residues sum to a convergent series; the lemma that `T` may be chosen with
   `|T − Im ρ| ≫ 1/log q(iT)` for every zero, from Layer 4.8; and the bounds on the horizontal
   edges, from Layer 5.7's partial-fraction expansion together with Layer 1.4.
3. **The truncated formula for `ψ_K`.** With `ψ_K(x) = ∑_{𝔑𝔞 ≤ x} Λ_K(𝔞)` (the
   `ArithmeticDirichletSeries.idealVonMangoldt` weight specialized through the Dedekind-zeta
   Euler-product data, summed over integral ideals of norm at most `x`, with the convention that
   a value `𝔑𝔞 = x` is included), for `2 ≤ T ≤ x` and
   `x` not a prime-ideal-norm power:
   ```
   ψ_K(x) = x − ∑_{|Im ρ| ≤ T} ((divisor Λ_K univ ρ).toNat) * x^ρ/ρ
            − (r₁ + r₂ − 1) * log x + c_K
            − ((r₁ + r₂)/2) * log (1 − x^{-2}) + (r₂/2) * log ((x + 1)/(x − 1))
            + O(x * log x * log (x*T) / T)
   ```
   with the implied constant depending only on `K`. ⚠ The `.toNat` is the same convention as in
   4: the sum is over **zeros** with their multiplicities, and the poles of `Λ_K` at `0` and `1`
   contribute through the `x` term and the `c_K` term instead. Writing the signed divisor here
   would subtract the pole at `s = 1` twice. The two logarithmic terms are the sum of
   the residues at the trivial zeros, where `ζ_K` vanishes to order `r₁ + r₂` at `−2n` and to
   order `r₂` at `−(2n−1)` for `n ≥ 1`; computing them in closed form as displayed is part of
   the milestone, and at `K = ℚ` the display must reduce to the classical
   `ψ(x) = x − ∑ x^ρ/ρ − log 2π − ½ log (1 − x^{-2})`.
4. **The Weil form**, over the test class and no other: `φ : ℝ → ℝ` with `ContDiff ℝ ⊤ φ`,
   `HasCompactSupport φ`, and `tsupport φ ⊆ Set.Ioi 0`, with Mellin transform
   `φ̃(s) = ∫ x in Set.Ioi 0, φ x * x^(s−1)` and dual `φ̌ y = φ (1/y) / y`, whose transform is
   `φ̃(1 − s)`. Then
   ```
   ∑ᶠ ρ, ((divisor Λ_K univ ρ).toNat : ℂ) * φ̃(ρ)
     = φ̃(0) + φ̃(1) + (log |d_K|) * φ 1 + A_K(φ) − ∑_𝔞 Λ_K(𝔞) * (φ (𝔑𝔞) + φ̌ (𝔑𝔞))
   ```
   ⚠ **The index set and the multiplicity are part of the statement, and the divisor here is
   the positive part.** `divisor` is the *signed* divisor everywhere else in this roadmap, and
   `Λ_K` has simple poles at `0` and `1`, so `divisor Λ_K univ` is `−1` there. A sum written
   over the whole support of the signed divisor would carry those two points with weight `−1`
   on the left and then add `φ̃(0) + φ̃(1)` again on the right, counting each pole twice. Taking
   `.toNat` makes the summand vanish at a pole, so the sum is over zeros only with their
   multiplicities, which is what the source proves and what the separate pole terms are for.
   The equivalent spelling, a sum over the support of the positive part of the divisor with the
   natural multiplicity coerced to `ℂ`, is the same statement and either may be used, provided
   the choice is stated.
   where the archimedean term is
   `A_K(φ) = (2πi)⁻¹ ∫_{(1+δ)} (logDeriv γ_K)(s) * (φ̃(s) + φ̃(1 − s)) ds` with `logDeriv γ_K`
   given explicitly by Layer 1.4 as
   `r₁ * (digamma (s/2)/2 − (log π)/2) + r₂ * (digamma s − log (2π))`. Nothing here is an
   unnamed archimedean or pole term. The supporting facts are milestones too: `φ̃` is entire;
   it decays faster than any power of `|Im s|` on every vertical strip (integration by parts,
   once per power); the zero side is **absolutely summable for exactly the carrier displayed**,
   that is the family `ρ ↦ ((divisor Λ_K univ ρ).toNat : ℂ) * φ̃ ρ` indexed by the support of
   the positive part is `Summable`, from Layer 4.8 against that decay — which is what makes the
   `∑ᶠ` independent of any ordering and is strictly stronger than the symmetric limit over
   `|Im ρ| < T` that the source states; the terms `φ̃(0)` and `φ̃(1)` come from the simple poles
   of `Λ_K` at `0` and `1`, where `logDeriv Λ_K` has residue `−1`, so each contributes once and
   the zero sum contributes nothing there; and the prime side is the Mellin
   inversion `(2πi)⁻¹ ∫_{(1+δ)} 𝔑𝔞^{-s} φ̃(s) ds = φ (𝔑𝔞)` applied to `−ζ'_K/ζ_K` term by term. The presentation over even
   `C_c^∞(ℝ)` in the coordinate `x = log y` is the same theorem and is proved as a corollary,
   not stated as a second milestone. ⚠ The class is fixed here; the wider Paley–Wiener class
   of transforms of compactly supported distributions is out of scope, and a hypothesis on the
   test function is never an adjective.
5. **The prime ideal theorem with an error term**, as two theorems covering the two branches
   of Layer 6.3's disjunction, both for fixed `K` with `c > 0` and the implied constant
   depending on `K`:
   - under `IsExceptionalZero ζ_K β`,
     `ψ_K(x) = x − x^β/β + O(x * Real.exp (−c * Real.sqrt (Real.log x)))`;
   - under `¬∃ β, IsExceptionalZero ζ_K β`,
     `ψ_K(x) = x + O(x * Real.exp (−c * Real.sqrt (Real.log x)))`.
   The exceptional zero appears as an explicit term rather than being assumed away, and
   together the two cover every `K`, strengthening the L-functions roadmap's asymptotic
   statement. ⚠ Siegel's theorem, which would bound `1 − β` from below ineffectively, is out
   of scope, so no milestone absorbs the exceptional term into the error with an effective
   constant.
6. **The Hecke instance**, for `χ` a primitive nontrivial finite-order ray-class character of
   conductor `𝔣`, whose gamma factor is `γ_χ(s) = ∏_{j ≤ r₁} Gammaℝ(s + a_j) * Gammaℂ(s)^{r₂}`
   with `a_j ∈ {0, 1}` the signature of `χ` at the real places. Items 1 to 4 hold verbatim with
   the following four substitutions, and this item is what discharges them:
   - `ψ_K(x, χ) = ∑_{𝔑𝔞 ≤ x} Λ_K(𝔞) * χ(𝔞)` in place of `ψ_K(x)`, and the zeros of
     `Λ(χ, ·)` in place of those of `Λ_K`;
   - no `x` term: `Λ(χ, ·)` is entire for nontrivial `χ`, so the contour shift crosses no pole
     at `s = 1`, and `φ̃(0) + φ̃(1)` drops out of 4. ⚠ The zero side keeps the same carrier —
     `∑ᶠ ρ, ((divisor Λ(χ,·) univ ρ).toNat : ℂ) * φ̃ ρ` — even though `Λ(χ, ·)` has no poles and
     the signed and positive divisors therefore agree. Writing the two families with different
     conventions is how a sign error survives specialization;
   - the order of vanishing of `L(χ, ·)` at `s = 0` is the order of the pole of `γ_χ` there,
     namely `#{j : a_j = 0} + r₂`, replacing `r₁ + r₂ − 1` — with the hypothesis
     `Λ(χ, 0) ≠ 0`, which Layer 6.5's edge theorem supplies and which must be cited rather
     than assumed; and the trivial zeros sit at `s = −m` with order
     `#{j : a_j ≡ m [MOD 2]} + r₂`, replacing the `r₁ + r₂` and `r₂` of 3, so the closed form
     of their residue sum changes accordingly;
   - `log (|d_K| * 𝔑𝔣)` in place of `log |d_K|` in 4, and `logDeriv γ_χ` in place of
     `logDeriv γ_K` in the archimedean term.
   The analogue of 5 is two theorems, not one, and the exceptional term appears in the first
   exactly as it does for `ζ_K`: for fixed `K` and fixed `χ` there is `c > 0` with
   - under `IsExceptionalZero χ β` (possible only for real `χ`, by Layer 6.4),
     `ψ_K(x, χ) = −x^β/β + O(x * Real.exp (−c * Real.sqrt (Real.log x)))`;
   - under `¬∃ β, IsExceptionalZero χ β`,
     `ψ_K(x, χ) = O(x * Real.exp (−c * Real.sqrt (Real.log x)))`.
   There is no `x` main term in either, since `L(χ, ·)` is entire. ⚠ Both constants depend on
   `K` and on `χ`, and neither statement is uniform in the conductor: an exceptional zero may
   sit arbitrarily close to `1`, and absorbing `x^β/β` into the error would need a lower bound
   for `1 − β` that only Siegel's theorem gives, which is out of scope. Nothing here may be
   read as the conductor-uniform disjunction.
7. **Effective Chebotarev, on Chebotarev's carriers.** For a finite Galois extension `L/K` and
   `C : ConjClasses (L ≃ₐ[K] L)`, use exactly
   `Chebotarev.frobeniusVonMangoldtCoeff C`, `frobeniusPsi C`, `frobeniusTheta C`, and
   `frobeniusPrimeCount C`. Expand the indicator of `C` in irreducible characters and apply the
   Artin/Hecke explicit formulas supplied by the preceding items. Define
   `exceptionalChebotarevTerm C x` as the resulting contribution of the unique possible real
   exceptional zero; prove that it is either zero or a single explicitly weighted `x^β/β` term.
   For fixed `L/K`, prove that there is `c > 0` such that
   ```text
   frobeniusPsi C x = (#C/#G) x - exceptionalChebotarevTerm C x
                      + O(x exp(-c sqrt(log x))).
   ```
   Track the dependence of the implied constant on `L/K`; do not call it absolute. Remove prime
   powers and apply `ArithmeticDirichletSeries.abelSummation` to obtain the corresponding effective
   estimates for `Chebotarev.frobeniusTheta C` and `frobeniusPrimeCount C`. Finally recover
   `Chebotarev.tendsto_frobeniusPrimeCount C` and
   `hasNaturalDensity_frobeniusPrimeSet C` by discarding the error term. These last two are
   consistency theorems, not a second qualitative Chebotarev proof. No declaration named
   `primeTheta`, `primeCount`, `θ_C`, `ψ_C`, or `π_C` is introduced here.

### Layer 9: certified zeros

The LMFDB stores lists of zeros with certified accuracy. This layer says what such a list
means. It depends on Layers 0 and 4 only, so it can be built early. ⚠ Nothing here proves that
a particular numerical list is correct: the numerical analysis that would discharge the
hypotheses is out of scope, and every milestone is about the shape of the statement.

1. `HasZerosInRects f U R Bs ms`, over: `U` with `IsOpen U` as a field rather than as prose;
   `f` meromorphic on `U` with `∀ z ∈ R, 0 ≤ divisor f U z` (no poles in the region — for a
   completed L-function whose region meets `0` or `1`, this is why the certificate is stated
   for `entireCompletion`); a closed rectangle `R ⊆ U` and a finite list `Bs` of closed
   rectangles, each with its endpoints in order, since a reversed pair has empty interior and
   a boundary that is not its four edges; and multiplicities `ms : List ℕ`. Its fields:
   - each `B ∈ Bs` satisfies `B ⊆ R`;
   - the interiors of the `B` are pairwise disjoint;
   - `f` is regular and nonvanishing on `∂R` and on each `∂B`, as
     `∀ z ∈ frontier _, meromorphicOrderAt f z = 0`;
   - `List.Forall₂ (fun B m ↦ zeroCount f U B = m) Bs ms`;
   - `zeroCount f U R = ms.sum`.
   ⚠ Every clause is load-bearing. Natural-number multiplicities and the no-poles hypothesis
   are what stop an omitted zero from cancelling an omitted pole in a signed total; the last
   clause is what makes the list *complete* rather than a list of zeros that happen to be
   there.
2. **Coverage**, the theorem that says the predicate means what its name says: from a term of
   `HasZerosInRects f U R Bs ms`, every `ρ ∈ R` with `0 < divisor f U ρ` lies in some
   `B ∈ Bs`. Prove it by summing the nonnegative divisor over `R` and comparing with the
   per-rectangle sums, without subtracting integer counts.
3. **Stability.** Shrinking `R` to a closed rectangle `R'` with `Bs`-membership preserved
   requires `f` regular and nonvanishing on `∂R'`, and then `HasZerosInRects f U R' Bs ms`
   holds. Replacing a rectangle `B` by a closed `B' ⊆ B` requires `f` regular and nonvanishing
   on `∂B'` and `zeroCount f U B' = zeroCount f U B`. Both hypotheses are part of the
   statement; without them the conclusions are false.
4. **`AllOnCriticalLine`**, defined semantically: `∀ ρ ∈ R, 0 < divisor f U ρ → ρ.re = 1/2`.
   ⚠ "Each rectangle meets the critical line" does not imply this and is not the definition; a
   wide rectangle can meet the line and contain off-line zeros. Two reusable sufficient
   criteria, both milestones:
   - per-rectangle localization: if every `B ∈ Bs` satisfies
     `∀ ρ ∈ B, 0 < divisor f U ρ → ρ.re = 1/2`, then with 2 the region satisfies
     `AllOnCriticalLine`;
   - symmetry and uniqueness: if `B` is invariant under `s ↦ 1 − conj s`, the divisor of `f`
     is invariant under the same map, and `zeroCount f U B = 1`, then that zero is fixed by
     the reflection, so `ρ.re = 1/2`. ⚠ The hypothesis is invariance of the *divisor*, which
     for `Λ_K` follows from the functional equation together with the reality of the
     coefficients; `f (1 − conj s) = f s` is false for `Λ`, which satisfies
     `Λ(1 − conj s) = conj (Λ s)`. ⚠ The criterion fails for multiplicity greater than `1`,
     where a reflection-conjugate pair inside `B` satisfies every other hypothesis, so
     multiplicity one is stated explicitly.
5. `GRH`, as a `Prop` over the two families: `∀ ρ, 0 < divisor Λ univ ρ → ρ.re = 1/2`. Prove
   that at the ζ instance it is Mathlib's `RiemannHypothesis`, which is the only thing making
   the definition trustworthy. The bridge is three lemmas: a point of positive divisor of
   `completedRiemannZeta` is exactly a nontrivial zero of `riemannZeta`; the trivial zeros are
   not points of positive divisor, because there `Gammaℝ` has a pole and the completion is
   regular; and `0` and `1` are poles, so they are points of negative divisor.
6. **The boundary convention, and what it does and does not give.** ⚠ `zeroCount` is taken
   over a *closed* rectangle, so a zero on `∂R` or on some `∂B` would be counted; the
   predicate does not discard it. What the predicate does instead is forbid it, through
   `regular_frontier` and `regular_frontier_box`, which is why boundary regularity is a
   hypothesis rather than a conclusion. Prove that if `meromorphicOrderAt f z ≠ 0` for some
   `z ∈ ∂R` then no certificate for `R` exists, so the hypothesis cannot be dropped.
   ⚠ The germ-level form `meromorphicOrderAt f z = 0` is the **right** hypothesis here and is
   deliberately weaker than the pointwise form Layer 7 needs: certificate semantics is about
   counts, and a count is a statement about germs. A certificate therefore does *not* on its
   own license the contour evaluation of 7.2, which additionally needs `AnalyticAt ℂ f z` and
   `f z ≠ 0` on the boundary. Layer 7.2a supplies the missing implication under the
   canonical-representative condition, and the corresponding worked example checks it; nothing
   in this layer may quietly assume it. `Rect.Valid` is likewise the right predicate here,
   since a reversed rectangle simply has count `0`; `Rect.Nondegenerate` belongs to Layer 7
   and is not a field of `HasZerosInRects`.

## Worked examples (acceptance criteria)

Each is either a theorem discharged by numbered milestones, or — where marked — a
*type-checking* criterion: the statement must be expressible and its hypotheses must be
exactly what a certificate would supply, with no numerical claim proved here.

- **`ζ`'s trivial zeros are not zeros of `Λ`.** `meromorphicOrderAt completedRiemannZeta (−2n) = 0`
  for `n ≥ 1`: the trivial zeros of `riemannZeta` are cancelled by the poles of `Gammaℝ`.
  Verify that `divisor completedRiemannZeta univ` is supported in the closed critical strip
  together with `{0, 1}`, where it is `−1`. Catches the most common confusion between `L`
  and `Λ`, and the temptation to read a pole off the value `Gammaℝ(−2n) = 0`.
- **A pole with value zero is not a zero.** At `s = 1`, `completedRiemannZeta` has a pole, and
  `meromorphicOrderAt completedRiemannZeta 1 = −1` while the total representative's value is
  junk. No *counting* hypothesis, in Layer 4, 7 or 9, may be stated as `f z ≠ 0`.
- **And an order-zero point need not have a nonzero value.** The converse check, which is what
  Layer 7 needs: for `f` equal to `1` on a neighbourhood of `z₀` except that `f z₀ = 0`,
  `MeromorphicAt f z₀` holds, `meromorphicOrderAt f z₀ = 0`, and
  `MeromorphicOn.divisor f univ = 0`, while `f` is not continuous at `z₀`, `logDeriv f` is not
  defined there, and the image of any path through `z₀` meets `0`. So the boundary hypothesis
  of 7.2 and 7.3 is `AnalyticAt ℂ f z ∧ f z ≠ 0`, and the two examples together say that
  neither of the two conditions implies the other.
- **`continuedL` of the ζ record at `s = 0`.** `continuedL riemannZetaData 0 = −1/2`, which is
  `riemannZeta_zero`. ⚠ The raw quotient `completedRiemannZeta 0 / Gammaℝ 0` is `0`: both
  functions have a simple pole at `0`, `Gammaℝ 0` is the junk value `0`, and Mathlib's
  division by zero gives `0`. Mathlib's own `riemannZeta_def_of_ne_zero` carries `s ≠ 0` for
  this reason. Catches a Layer 1.6 that takes the quotient instead of the removable extension,
  and is the reason the extension is the milestone.
- **The pole-cleared function at `s = 1`.** `poleClearedContinuedL riemannZetaData (X − 1) 1 = 1`,
  the residue of `ζ` at `1`, while the raw product `(1 − 1) * riemannZeta 1` is `0`. Catches a
  Layer 3.3 that multiplies instead of extending, which is the same defect as the previous
  example one layer up, and it is not caught by any inequality: `0` satisfies every upper bound,
  so the strip estimate written for the product typechecks and says nothing at the pole.
- **The Weil formula at `K = ℚ`, as a sign and pole-term check.** Specializing 8.4 to `K = ℚ`
  gives `r₁ = 1`, `r₂ = 0`, `d_K = 1`, so the `log |d_K|` term vanishes and the archimedean term
  is `(2πi)⁻¹ ∫_{(1+δ)} (½ digamma(s/2) − ½ log π)(φ̃(s) + φ̃(1 − s)) ds`; the zero sum runs over
  the zeros of `completedRiemannZeta`, which are exactly the nontrivial zeros of `ζ`, and the two
  terms `φ̃(0) + φ̃(1)` are the two simple poles. ⚠ This is the check that the zero side uses the
  **positive** divisor: with the signed divisor the points `0` and `1` would enter the sum with
  weight `−1` and then be added again on the right, so the identity would fail by exactly
  `2(φ̃(0) + φ̃(1))`. A formula that is off by that amount is the expected symptom.
- **The first zero of `ζ`** (type-checking criterion). `HasZerosInRects` for
  `entireCompletion` of the ζ record on `Icc 0 1 ×ℂ Icc 0 15`, with one rectangle around
  `1/2 + 14.134725…i` and multiplicity `1`, together with `AllOnCriticalLine` by the
  symmetry-and-uniqueness criterion of 9.4. ⚠ Stated for the entire completion, since `Λ`
  itself has poles at `0` and `1` on the lower edge and so admits no certificate there; that
  is the same convention as the boundary example below, not an exception to it. The numerical
  hypotheses are inputs, not milestones.
- **`N(T)` for `ζ` at `T = 100`** (type-checking criterion, conditional theorem). A supplied
  certificate for `Icc 0 1 ×ℂ Icc 0 100` with `29` rectangles of multiplicity `1` implies
  `N(100) = 29`. ⚠ `N(100) = 29` is not a consequence of Layer 7.4, whose error term carries
  no explicit constant; what the roadmap proves is the implication. The check is on the
  counting convention: the symmetric count is `58`, and the conversion is Layer 4.9's.
- **`ζ_{ℚ(i)}` versus `ζ · L(χ₋₄)`.** From the L-functions roadmap's Layer 4 factorization and
  its normalization lemma, the divisors add:
  `divisor Λ_{ℚ(i)} univ = divisor Λ_ℚ univ + divisor Λ(χ₋₄) univ`. Catches multiplicity
  handling, since a common zero would have order `2` on the left.
- **Degree and conductor in the main term.** For `K` imaginary quadratic of discriminant `D`,
  Layer 7.6 reads `N±_K(T) = (T/π) log(|D| (T/2πe)^2) + O(log(|D|T^2))`. Verify that this is
  the sum of the ζ and `L(χ_D)` counts, which is a real consistency check on the constants.
- **A boundary pole blocks a certificate.** For `Icc 0 1 ×ℂ Icc (−1) 1` and `Λ_K`, no
  certificate exists in the sense of Layer 9, by 9.6, because of the pole at `s = 1` on the
  boundary. The `entireCompletion` version does admit one.
- **Layers 7 and 9 count the same integer — and what a certificate does not supply.**
  `HasZerosInRects` gives `f` meromorphic on an open `U ⊇ R` and
  `meromorphicOrderAt f z = 0` on `∂R`, and on a pole-free region `divisorCount` and
  `zeroCount` agree by 4.1. ⚠ That is *not* enough to evaluate the contour integral of 7.2:
  the germ-level boundary condition is the right semantics for a certificate, and it neither
  makes `f` analytic on `∂R` nor makes `logDeriv f` continuous there. The bridge is 7.2's
  extra hypothesis, and the criterion is the implication — a certificate **plus** the
  canonical-representative condition of 7.2a implies that the certificate's count is the
  contour integral of 7.2. Verify that implication, and verify that it fails without the
  second hypothesis by the one-point-defect countermodel of the conventions table. Catches
  both a divergence between the two layers' rectangle conventions and the assumption that
  order-zero boundaries are analytic boundaries. ⚠ Run this check with `U = Set.univ` and a
  bounded rectangle, against a function with infinitely many zeros — `completedRiemannZeta` is
  the instance to hand. That is the case the localization of 7.2a exists for, and any version
  of the bridge that assumes the divisor support is globally finite fails it while still
  looking green on a polynomial.
- **A degenerate rectangle has no contour.** For `B` with `σ₁ = σ₂`, `B.Valid` holds and
  `zeroCount f U B.toSet` is a perfectly good number, while `rectBoundary B` is not an
  `IsPwC1ImmersionOn` curve, so 7.1 and 7.2 do not apply. A milestone stating 7.1 under
  `B.Valid` would be refuted by this rectangle. This is why the two predicates are separate.
- **A zero on a subdivision edge.** For a function with a simple zero on the common edge of
  two closed rectangles, the closed-rectangle additivity statement of 4.3 does not apply, and
  the half-open partition counts the zero exactly once. This is a check on the statement of
  4.3, not a theorem about `ζ`.
- **`exp (c s)` is not constrained by its zeros.** Layer 5.6 applied to `f s = exp (c s)`
  gives `b = c` with an empty product; no general milestone may force `c = 0`, which is why
  `Re b = −∑_ρ Re(1/ρ)` is a Layer 5.7 corollary with a reality hypothesis rather than a
  general theorem.
- **A complex gamma shift.** For a record with `gammaR = {i}`, `analyticConductorAt` still
  satisfies the two-sided comparison of 2.2, and is not monotone in `|Im s|` near `Im s = −1`.
  A milestone asserting monotonicity would be refuted by this record.
- **The exceptional zero is not excluded.** Layer 6.2 instantiated at a real character is a
  disjunction, and neither branch is provable from the other milestones. A scope check rather
  than a theorem.

## Ordering — the dependency graph

```
  L-functions Layer 0 ─────────────────▶ 0 growth predicates + entire completion
  Mathlib Gamma, BranchLogRoot ────────▶ 1.1-1.4 Stirling
  L-functions Layer 0, 1.1-1.4 ────────▶ 1.5 the gamma factor of a record + its divisor
  0 + 1.5 ─────────────────────────────▶ 1.6 continuedL (reciprocal, extension, dual, FE)
  L-functions Layer 0 spectral data, 1 ▶ 2.1-2.2, 2.4-2.5 analytic conductor
  1.6 + 2.1 + L-functions Layer 0.4 ───▶ 2.3 normalization translation (conductor + continuedL)
  0 + 1.5 + 1.6 + 2 + 2.3 ─────────────▶ 3.1-3.2 Phragmen-Lindelof input + the two edges
  3.1 + 3.2 ───────────────────────────▶ 3.3 pole-cleared strip bound, then central-line convexity
  0 + 3.1 + L-functions Layers 3,5 ────▶ 3.4 finite order for the two families
  Mathlib Jensen/Divisor ──────────────▶ 4A generic counts (4.1-4.6)
  1.5 + 1.6 + 2 + 3.3 + 3.4 + ADS Euler products ▶ 4B family local counts, then 4.9-4.11
  0 + 4A ──────────────────────────────▶ 5.1-5.6 Hadamard, general
  3.4 + 4B + 5.6 ──────────────────────▶ 5.7 the L-function corollaries
  1 + 2 + 5.7 + L-functions Layers 3,4,5,7 ▶ 6 zero-free regions
  1 + 3 + 4 + contour integration Layer 4 ▶ 7 Riemann-von Mangoldt
  ADS Perron + 1 + 4 + 5 + 7 ─────────▶ 8.1-8.4 explicit formula
  6 + 8.4 ─────────────────────────────▶ 8.5 prime ideal theorem error term
  Chebotarev carriers + L-functions Artin cards + 6 + 8.4 ▶ 8.7 effective Chebotarev
  0 + 4A ──────────────────────────────▶ 9 certificates
  7.2a ────────────────────────────────▶ the contour evaluation of a Layer-9 certificate
```

Two starts need nothing from this roadmap: Layers 1.1–1.4 need only Mathlib, and Layer 4A
needs Mathlib plus the continuation predicate, so the counting theory can be built before any
arithmetic exists. Layer 2 needs the record's spectral parameters and Layer 1; Layer 9 needs
Layer 4A's counting API and Layer 0's entire completion, and nothing else. `continuedL` sits
at 1.6 because it is built from the gamma divisor of 1.5, and its normalization theorem sits
at 2.3 because it is the companion of the conductor translation there; the whole convexity
chain 3.1 → 3.2 → 3.3 runs on it, and so does the Jensen ratio of 4.7. The arithmetic
instances first appear in Layer 3.4, which is why finite order for the two families is proved
there rather than in Layer 6: Layer 4B's local counts and Layer 5.7's corollaries both need
it, and both come earlier than the zero-free regions. Layers 7 and 8 are where the contour
integration roadmap's Layer-4 residue theorem is needed, and everything before them is stated
and proved without it.

## Sources for the hard milestones

Layers 0 to 5 are stated from first principles and cite Mathlib declarations by name. Layers 6
to 8 make choices a source has to settle: which family, which normalization, which endpoint
convention, and what every constant may depend on. Each row below fixes those, and says so
where the milestone is a combination or a strengthening of what one source proves, because
that is where a formalizer would otherwise guess.

Each row gives the exact source location, the hypotheses that location carries, the
translation into this normalization, what every constant may depend on, and — where no single
source proves the displayed theorem — the additional steps, which are milestones here and not
citations.

| Milestone | Exact source location | Hypotheses the source carries | Translation, constants, and what is *not* in the source |
|---|---|---|---|
| 6.2, the region for `ζ_K` | Kadiri, *Explicit zero-free regions for Dedekind zeta functions*, **Theorem 1.1**, which is two statements: **(1.7)** `ζ_K` has **no** zero with `Re s ≥ 1 − 1/(12.55 log d_K + 9.69 n_K log \|Im s\| + 3.03 n_K + 58.63)` and `\|Im s\| ≥ 1`; **(1.8)** `ζ_K` has **at most one** zero with `Re s ≥ 1 − 1/(12.74 log d_K)` and `\|Im s\| ≤ 1`, and that zero is real and simple. **Corollary 1.2** sharpens the small-ordinate range. | `d_K` sufficiently large. `n_K = [K:ℚ]`, `d_K` the absolute value of the discriminant. The four numerical constants are absolute. | ⚠ The two ranges are **not** one statement, and the roadmap's single displayed region is the conjunction: "no zeros for `\|t\| ≥ 1`, at most one for `\|t\| ≤ 1`". The numerics are dropped and `c` is existential. Since `\|d_K\|` and `\|t\|` enter Kadiri's denominator exactly as `log q(it) ≍ log d_K + n_K log(\|t\| + 3)` does, the region is rewritten through `analyticConductorAt` by 2.2, and `3.03 n_K + 58.63` is absorbed using `n_K = O(log d_K)` from Minkowski. ⚠ Two steps are **not** in the source and are milestones: removing "sufficiently large `d_K`" for a fixed degree, by Hermite–Minkowski finiteness of the fields of bounded degree and bounded discriminant, which is what makes `c` depend on `[K:ℚ]` alone; and the passage from the classical to the analytic normalization. |
| 6.3, the exceptional zero | Kadiri **Theorem 1.1 (1.8)** for existence-at-most-one and for "real and simple"; Davenport, *Multiplicative Number Theory*, 3rd ed., **§14** (*Zero-Free Regions for `L(s,χ)`*) for the `K = ℚ` Landau–Page structure of the argument. | As above; Davenport's §14 is for Dirichlet characters to a modulus `q`. | Stated as a predicate plus uniqueness, never as a total function. ⚠ Identifying `β` with the zero of a quadratic character's L-function is a Stark-type theorem that neither source proves in this generality, and it is out of scope. |
| 6.4, the region for Hecke L-functions | ⚠ **No cited source proves this in the stated generality.** The exact components are: Lang, *Algebraic Number Theory*, 2nd ed., **ch. XV §4** (*Non-vanishing of the L-series*), which proves the **qualitative** statement only; Davenport **§14** for the `3-4-1` route and the real-versus-non-real split; Kadiri Theorem 1.1 for the shape of the region in the `ζ_K` case. | Lang XV §4 is a nonvanishing statement on `Re s = 1`, with no region and no constant. Davenport §14 is over `ℚ`. | The additional steps are milestones here: carrying the `3-4-1` inequality of 6.1 to a ray-class character over `K`; the real and non-real split, only a real `χ` admitting an exceptional zero; and the constant depending on `[K:ℚ]` alone, as in 6.2. ⚠ "Carried from the cited source" is a proof route and is written here as such, not as a citation. |
| 7.4, Riemann–von Mangoldt for `ζ`, and 7.5 | Titchmarsh (rev. Heath-Brown), *The Theory of the Riemann Zeta-Function*, **§9.2** for the definition of `N(T)`; **§9.3** for the definition of `S(T)`; **Theorem 9.3**, `N(T) = L(T) + S(T) + O(1/T)` with `L(T) = (T/2π) log T − ((1 + log 2π)/2π) T + 7/8` (equations (9.3.1) and (9.3.2)); **Theorem 9.4**, `S(T) = O(log T)` (9.4.2) and `N(T) = (T/2π) log T − ((1 + log 2π)/2π) T + O(log T)` (9.4.3). | `N(T)` counts zeros with `0 ≤ σ ≤ 1` and `0 < t ≤ T`. `S(T)` is `π⁻¹ arg ζ(1/2 + iT)` by continuous variation along the straight lines joining `2`, `2 + iT`, `1/2 + iT`, **starting with the value `0`**; when `T` is the ordinate of a zero the source sets `S(T) = S(T + 0)`. Theorem 9.3 assumes `T` is not the ordinate of a zero. | The source's counting range is exactly the half-open convention of 4.9, so no conversion is needed. `(T/2π) log(T/2πe)` is (9.4.3)'s main term rearranged. ⚠ Two things are the roadmap's own. The source's "starting with the value `0`" is legitimate because `ζ(2)` is a positive real, and 7.3 proves that rather than asserting it. And the extension of the formula to **every** `T ≥ 2` is milestone 7.5, since Theorem 9.3 excludes the ordinates and the source's `S(T + 0)` convention is a definition, not a theorem about both one-sided limits. |
| 4.8, the unit-height bound | Titchmarsh **Theorem 9.2**, `N(T + 1) − N(T) = O(log T)`. | As in §9.2. | This is the `K = ℚ` case of 4.8. The conductor-uniform form, with `log q(iT)` in place of `log T`, is the roadmap's own and is proved from Jensen's bound of 4.5 rather than from a contour integral, which is why 4.8 precedes Layer 7. |
| 7.6, the conductor-uniform form | **Derived here, and cited to no source.** Davenport **§16** (*The Number `N(T, χ)`*) is the conductor-carrying `K = ℚ` case and is the specialization check, not the source. | — | ⚠ This row deliberately cites nothing for the displayed theorem, because no accessible copy pinned a source statement of it, and a section-level citation does not establish that a source proves this uniformity. The proof is Titchmarsh's Theorem 9.3 argument run on `entireCompletion d` instead of on `ζ`, and it decomposes entirely into milestones that are internal or separately sourced: the main term is Layer 1.5's gamma asymptotic, which carries `d` and `N` explicitly, integrated along the contour of 7.1; the contour evaluation is 7.2 with the localization of 7.2a; the error is 7.3's argument variation, bounded by Layer 4.5's Jensen argument on discs together with 4.8's unit-height bound, both conductor-uniform by construction; and the passage between the two counting conventions is Layer 4.9. The implied constant depends on the degree only, which is what those two conductor-uniform inputs deliver; a version whose constant may depend on `\|d_K\|` is weaker and does not discharge the milestone. Iwaniec–Kowalski §5.3 proves zero counting for an axiomatic class close to the one this record models and is listed in the references as reading, not as the authority for a milestone. |
| ADS `perronFormula`, consumed at 8.1 | Titchmarsh **Lemma 3.12**, equation (3.12.1). Davenport **§17** (*The Explicit Formula for `ψ(x)`*) gives the same kernel in the form the contour shift uses. | `a_n = O(ψ(n))` with `ψ` non-decreasing; `∑ \|a_n\| n^{-u} = O((u − 1)^{-α})` as `u → 1⁺`; `c > 0`; `σ + c > 1`; and **`x` not an integer**, with `N` the nearest integer to `x`. | The generic theorem, including the exact finite-`T` endpoint `π⁻¹ arctan(T/c)`, is owned by Arithmetic Dirichlet Series. This roadmap verifies its hypotheses for the L-function coefficients and performs the subsequent contour shift. |
| 8.2, the contour shift | Davenport **§17**, for `−ζ'/ζ` over `ℚ`. | `x > 1`, `T` chosen away from the ordinates, the left edge at a half-odd-integer. | The trivial-zero residues are computed here from the gamma-factor pole orders of 1.5 rather than quoted, and at `K = ℚ` the closed form must reproduce the source's. ⚠ The passage to `ζ_K` is the same residue bookkeeping over a different gamma factor and is a milestone, not a citation. |
| 8.3, the truncated `ψ_K` formula | Davenport **§17** for the `K = ℚ` case that pins the constants; Lang **ch. XVII §§1–2** (*Weierstrass factorization of the L-series*; *An estimate for `ζ'/ζ`*) for the number-field ingredients. | Davenport §17 is over `ℚ`. Lang XVII §2 bounds `ζ'/ζ` on the horizontal edges, which is what the shift needs. | Stated for `2 ≤ T ≤ x` with the implied constant depending on `K` only, and with `x` excluded at a prime-ideal-norm power. ⚠ Uniformity in `K` is not claimed. ⚠ The closed form of the trivial-zero residue sum, `−((r₁ + r₂)/2) log(1 − x^{-2}) + (r₂/2) log((x+1)/(x−1))`, is computed here from the pole orders of `γ_K`; the sources display only the `K = ℚ` case `−½ log(1 − x^{-2})`. |
| 8.4, the Weil form | Lang **ch. XVII §3, Theorem 3.1 (Weil Explicit Formula)**, for `Λ(s, χ)` of a Hecke character over a number field, with the `f(1) log A` term, the prime sum, and the archimedean Weil functionals `W_{v,χ}` at `v ∈ S_∞`. Lang **Theorem 3.2** supplies `Λ'/Λ(s) = lim_{T→∞} ∑_{\|ρ\|<T} 1/(s − ρ)`, which is the convergence statement the zero side needs. | `F : ℝ → ℂ` satisfying the **Barner conditions**: (a) `V_ℝ(F(x) e^{(1/2 + a')\|x\|}) < ∞` for some `a' > 0`; (b) `F(x) = ½(F(x⁺) + F(x⁻))`; (c) `½(F(x) + F(−x)) = F(0) + O(\|x\|^ε)` as `x → 0`. The sum over zeros is a limit over `\|Im ρ\| < T`, not an absolutely convergent sum. | The class fixed here — `φ` smooth, compactly supported, with `tsupport φ ⊆ (0, ∞)` — corresponds under `x = log y` to a smooth compactly supported `F`, which satisfies (a) by compact support, (b) by continuity, and (c) by smoothness. So this is a special case needing no extra hypothesis, and checking those three conditions is part of the milestone rather than a remark. ⚠ Absolute convergence of the zero side is **stronger** than Lang's limit and is proved here from 4.8 against the Mellin decay, which is why 8.4 lists that decay as its own supporting fact. Every term is written out here rather than cited. |
| 8.5 and 8.6, the prime sums | Davenport **§18** (*The Prime Number Theorem*) for the `exp(−c√log x)` shape over `ℚ`, and **§20** (*The Prime Number Theorem for Arithmetic Progressions (I)*) for the character case with the exceptional term displayed; Lang **ch. XV §5** for the density statements this strengthens. ⚠ Davenport **§19** is *The Explicit Formula for `ψ(x, χ)`*, not the error-term theorem, and is the source for 8.6's contour shift rather than for its error. | Davenport §18 and §20 are over `ℚ` and over a modulus `q`; §21 is Siegel's theorem, which is out of scope here. | Split into the two exceptional-zero branches, with constants depending on `K`, and on `χ` in 8.6, and with no claim of conductor-uniformity: absorbing `x^β/β` into the error would need Siegel's theorem. ⚠ The number-field statement is not in either source in this form; it is 8.3 combined with the zero-free region of 6.2 or 6.4, and that combination is the milestone. |
| 8.7, effective Chebotarev | Lagarias--Odlyzko, *Effective versions of the Chebotarev density theorem*, in *Algebraic Number Fields* (1977), for effective counting in a fixed finite Galois extension; the explicit-formula and exceptional-zero inputs are supplied by 8.3--8.6 here. | A fixed finite Galois extension `L/K` and a conjugacy class `C`; constants may depend on the extension. | The theorem is stated on `Chebotarev.frobeniusPsi`, `frobeniusTheta`, and `frobeniusPrimeCount`, not on replacement carriers. Its main coefficient is exactly `#C/#Gal(L/K)`, and the unique possible exceptional real zero remains a named term rather than being absorbed into the error. Fully numerical constants and conductor-uniformity are not claimed. The qualitative Chebotarev theorem is consumed from the Chebotarev roadmap and recovered only as a consistency consequence. |

⚠ These rows fix the source location, the mathematical content, the hypotheses, and the
dependence of every constant. Where a row says a step is **not** in the source, that step is a
milestone of this roadmap and must be proved, not cited. Every row either gives an exact,
checked location or says outright that the milestone is derived here and cites nothing: no
milestone in this roadmap rests on a citation whose location has not been verified against a
copy, and a section-level gesture is not treated as a source.

## References

Section and theorem numbers below are the ones the *Sources* table cites, and are the ones a
formalizer should look up.

- H. Iwaniec, E. Kowalski, *Analytic Number Theory*, AMS Colloq. 53 — ch. 5, whose sections
  are §5.1 *Definitions and preliminaries* (the axioms and the analytic conductor (5.7)), §5.2
  *Approximations to L-functions* (the convexity bound), §5.3 *Counting zeros of L-functions*,
  §5.4 *The zero-free region*, §5.5 *Explicit formula*, §5.10 *L-functions of number fields*,
  and §5.A *Appendix: complex analysis*. ⚠ Listed as background reading, not as the source of
  any milestone: only the convention (5.7) is taken from it, and no within-chapter theorem
  number was verifiable against a copy, so no row of the table above cites one. The zero
  counting of §5.3 covers ground close to Layer 7.6, which is derived here instead.
- H. Davenport, *Multiplicative Number Theory*, 3rd ed. rev. Montgomery, GTM 74 — §13 *A
  Zero-Free Region for `ζ(s)`*, §14 *Zero-Free Regions for `L(s,χ)`*, §15 *The Number `N(T)`*,
  §16 *The Number `N(T,χ)`*, §17 *The Explicit Formula for `ψ(x)`* (the truncated Perron
  formula and the contour shift Layer 8 follows), §18 *The Prime Number Theorem*, §19 *The
  Explicit Formula for `ψ(x,χ)`*, §20 *The Prime Number Theorem for Arithmetic Progressions
  (I)*.
- E. C. Titchmarsh (rev. Heath-Brown), *The Theory of the Riemann Zeta-Function* — Lemma 3.12
  (truncated Perron, equation (3.12.1)); §9.2 and Theorem 9.2 (`N(T)` and the unit-height
  bound); §9.3 and Theorem 9.3 (`S(T)`, and `N(T) = L(T) + S(T) + O(1/T)`, equations (9.3.1)
  and (9.3.2)); Theorem 9.4 (`S(T) = O(log T)` and the asymptotic, equations (9.4.2) and
  (9.4.3)).
- H. Kadiri, *Explicit zero-free regions for Dedekind zeta functions*, Int. J. Number Theory 8
  (2012) — Theorem 1.1, whose two displayed regions (1.7) and (1.8) are what Layer 6.2 takes,
  and Corollary 1.2.
- NIST DLMF §5.11 — Stirling's expansion for the general branch of `log Γ` on a sector, the
  statement Layer 1.2 formalizes.
- S. Lang, *Algebraic Number Theory*, 2nd ed., GTM 110 — ch. XVII §3 Theorem 3.1 (the Weil
  explicit formula, over the Barner conditions defined in that section) and Theorem 3.2
  (`Λ'/Λ` as a limit over the zeros); ch. XVII §§1–2 for the Weierstrass factorization and the
  `ζ'/ζ` estimate; ch. XV §4 for the qualitative nonvanishing Layer 6 makes quantitative, and
  §5 for the densities Layer 8.5 strengthens.
- J. Neukirch, *Algebraic Number Theory* — ch. VII §§5, 8 for the completed functions whose
  zeros these are.
- The [L-functions roadmap](../LFunctions/README.md), which constructs everything this
  roadmap takes as given, and whose conventions table this one extends rather than restates.
- The [contour integration roadmap](../ContourIntegration/README.md), which builds the residue
  calculus and the argument principle that Layers 7 and 8 consume.
