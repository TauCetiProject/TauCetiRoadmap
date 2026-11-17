# Roadmap: the quasi-Riemann hypothesis — a zero-free half-plane `Re s > 11/12` for Dirichlet and Hecke L-functions

**Summary.** This roadmap proves that every Dirichlet `L`-function, the Riemann zeta function
included, and every finite-order Hecke `L`-function of `F = ℚ(√−3)` has no zero in the half-plane
`Re s > 11/12`, the pole at `s = 1` of a character induced from the trivial one being allowed. The
argument is the first stage of the cubic-theta method of `openai2026quasiRH` (its Part I): a
smoothed average of cubic Gauss sums is bounded directly through the automorphy of Kubota's cubic
theta function and a quadratic large sieve, and is compared, after Poisson summation, with a Mellin
integral whose integrand carries `1/L` of the target character; zero detection and a sextic large
sieve control the remaining rows, and an abstract continuation principle turns the two estimates
into the half-plane. On the way the roadmap builds the general library the argument needs: zero-free
half-planes and the continuation principle for an abstract family of Euler products; power residue
symbols as ray class characters over any number field containing `μ_n`, reciprocity and Gauss sums
at composite moduli of `ℤ[ω]`; smooth Mellin and Fourier kernels; uniform analytic bounds and zero
detection for the finite-order Hecke `L`-functions of any number field; large sieves over number
fields (additive, quadratic and `n`-th order); Eisenstein series with a unitary character on `ℍ³`,
Kubota's character among them, and their theta residues, with Patterson's cubic theta function of
`ℚ(ω)`; and the transfer of half-planes from the Hecke `L`-functions of an abelian field to all
Dirichlet `L`-functions. The end theorems are the `11/12` half-plane, the zero strip
`1/12 ≤ Re ρ ≤ 11/12` for primitive characters, the conditional bound `(log q)^(1/(1−θ))` for the
least character value different from `0` and `1` under a zero-free half-plane `Re s > θ`, and its
instance: the least quadratic nonresidue modulo an odd prime `p` is at most `C (log p)^12`, which
proves Vinogradov's conjecture `n(p) ≪_δ p^δ`.

Suggested home: `TauCeti/NumberTheory/QuasiRiemann/`, divided into `ZeroFree/`, `PowerResidue/`,
`GaussSum/`, `SmoothProfile/`, `HeckeAnalytic/`, `LargeSieve/`, `ZeroDetection/`, `Kubota/`,
`CubicReflection/`, `Probe/` and `Consequences/`. [`Suggested.lean`](Suggested.lean) states the
headline theorems against the pinned libraries; it is not the roadmap.

## Scope and ownership

**The sources.** The `11/12` half-plane is `openai2026quasiRH` Theorem 3.1, an unrefereed
preprint; `liu2026improved` §§3–6 gives a second account of the same argument and
`openai2026quasiRHalt` a second proof by a mean square of sextic-twisted Möbius sums. Every
numerical constant of Layer 10 is a closed-form rational inequality stated with its target.

### Owned here

- the germ-level predicate *zero-free right of `σ`*, the zero abscissa `β*` of a family, the
  continuation principle for an abstract family of Euler products and the choice of the height
  exponent before the decay order (Layer 1);
- the fixed-numerator theorem over every number field containing `μ_n`, the primary
  normalization `c ≡ 1 (mod 3)` of `ℤ[ω]` and its translation to Tau Ceti's, the sextic symbol at
  composite moduli, cubic reciprocity for coprime composite primary elements and its supplements
  (Layer 2);
- profiles with compact logarithmic support, their seminorms and separation norms, the Gaussian
  Mellin weight, finite
  seminorm bounds for Fourier and Mellin kernels, the self-dual normalization of `ℤ[ω]` and Poisson
  summation on its cosets (Layer 3); AnalyticNumberTheoryPartIII §9.2 bounds the Mellin transform of
  one compactly supported bump with a constant depending on the bump, and §3.2 here is the form with
  explicit seminorms, uniform over families of profiles and allowing Schwartz decay at `∞`;
- Gauss sums modulo ideals of a number field containing `μ_n` for the powers of the power residue
  symbol, which in general are not residue characters of Hecke characters (`χ_p³(−1) = −1` at
  `p = 1 + 3ω`),
  and their twisted multiplicativity, the Gauss sums of the sextic symbol at primes of `ℤ[ω]`, the
  closed form of the quadratic Gauss sum `Γ(c)`, sextic reciprocity with its phases `R` and `G`, the
  Gauss sums at squarefree moduli and finite Fourier expansions on ray class groups (Layer 4);
- finite Euler products at the primes of a squarefree ideal, the strip bound `(Q (3 + |t|)^d)^(3/5)`
  (the instance of ExplicitZetaBounds §3.2 at the Hecke records, with the pole of `ζ_K` cleared) and
  bounds for `L`, `1/L` and `L'/L` in a zero-free disc for the finite-order Hecke `L`-functions of any
  number field, the norm-composed characters of an abelian field, the `S`-deleted base-change
  factorization over an abelian `K` (AnalyticNumberTheoryPartI §2.18a's induction identity for the
  restriction `σ` of `χ` to `Gal(ℚ̄/K)`, split by `Ind σ = ⊕_{ψ ∈ X(K)} χψ` and read on
  `heckeLFunctionC` and Mathlib's Dirichlet `L`-functions) and the transfer of zero-free half-planes
  to Dirichlet `L`-functions (Layer 5); LFunctions Layer 4 factors
  `ζ_K` itself over quadratic and cyclotomic `K`, and §5.4 here is the factorization of the twist by
  `χ ∘ N_{K/ℚ}` over every abelian `K`;
- large sieves over number fields: the additive large sieve on a torus `ℝ^d/Λ`, the quadratic large
  sieve over a number field, the Fisher–Friedberg characters and the large sieve for `n`-th order
  characters, and its cubic and sextic residue-symbol forms over `ℤ[ω]` (Layer 6);
- zero detection for finite-order Hecke `L`-functions: zero-free rectangles with a margin, chosen by
  pigeonhole, upper bounds for the detecting polynomials in them, and the lower bounds that a zero
  forces on those polynomials (Layer 7);
- Patterson's character `κ_P` of `Γ₂ ⊂ SL₂(𝓞_F)`, automorphic functions on `ℍ³` with a unitary
  character, their Eisenstein series, continuation and functional equations, the theta functions as
  residues, the Gauss-sum Dirichlet series of the Kubota Eisenstein coefficients, Patterson's
  converse theorem and the cubic theta function of `ℚ(ω)` with its expansions at three cusps
  (Layer 8);
- the reflection of the completed Gauss-sum series through the cubic theta function, and their mean
  square over the frequencies (Layer 9);
- the probe at `11/12` and the `11/12` half-plane (Layer 10);
- the zero strip, the conditional bound for least character values and the least quadratic
  nonresidue (Layer 11).

### Consumed, not redefined

- Dirichlet `L`-functions and their completions and functional equations: Mathlib
  `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction`; the finite-order Hecke
  `L`-function of a presented ray class character, its primitive comparison and Euler correction:
  Tau Ceti `TauCeti.LFunctions.heckeLFunctionC`, `PrimitiveRayClassCharacter`,
  `RayClassCharacter.eulerCorrection`; their continuation, functional equation with root number of
  modulus one and, for a nontrivial primitive character, nonvanishing on `Re s = 1`:
  [LFunctions](../LFunctions/README.md) Layers 4, 5 and 7.
- The continued `L`-function of a record and its value at the Hecke records, finite order of the
  completed Hecke functions, local zero counts, the Weil explicit formula for the two families and
  the prime ideal theorem: [ZerosOfLFunctions](../ZerosOfLFunctions/README.md) §§1.6, 3.1,
  4.4–4.5, 8.4–8.6.
- Rademacher's convexity bound on records of finite-order type:
  [ExplicitZetaBounds](../ExplicitZetaBounds/README.md) §3.2; §5.2 here is its instance at the
  Hecke records `heckeData ψ`, written in `Q (3 + |t|)^d` with the pole of `ζ_K` cleared.
- The `n`-th power residue symbol at primes and ideals, the Frobenius action on `n`-th roots,
  primary associates, prime cubic reciprocity and the supplement at `1 − ω`:
  [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md)
  §§1.12, 1.23, 1.33, 1.34, 1.38, 1.72, 1.75, as Tau Ceti realizes them
  (`Ideal.powerResidueSymbol`, `Ideal.powerResidueSymbolIdeal`,
  `TauCeti.IsPrimaryEisenstein.cubic_reciprocity`).
- Mennicke symbols, Kubota's homomorphism `σ ↦ [b/a]` on `GL₂(A, I)` over a Dedekind domain, the
  exponent `r(I)` and the power-residue Mennicke symbol `[b/a] = (b/a)_{r(I)}` of a totally imaginary
  field: [KTheoryLowDegrees](../KTheoryLowDegrees/README.md) §§10.1–10.2, 11.1–11.2; §8.1 here reads
  Kubota's normalization `(c/d)_n` as its `r(N)/n`-th power.
- Global Artin reciprocity and ray class fields: [ClassFieldTheory](../ClassFieldTheory/README.md)
  Layers 11 and 13. Moduli, ray class groups and characters, conductors: Tau Ceti
  `TauCeti.GlobalNumberFields` ([GlobalNumberFields](../../Completed/GlobalNumberFields/README.md)
  Layers 2 and 9).
- Gauss sums over a finite ring: Mathlib `gaussSum`; their absolute value `√q` over a finite field:
  Tau Ceti `TauCeti.norm_gaussSum`; the quadratic and small-order Gauss sums and the duplication
  formula: CharacterSumsOverFiniteFields §§1.4–1.5 and §3.4. The Gauss sum of the
  residue character of a finite-order Hecke character modulo an ideal, for the character
  `x ↦ e^(2πi Tr(xy))` with `y ∈ 𝔪₀⁻¹𝔡⁻¹`, its shift law and its absolute value:
  [LFunctions](../LFunctions/README.md) Layer 5 (`gaussSum`, `gaussSum_mul`, `norm_gaussSum`).
- Poisson summation for a full-rank lattice: [ThetaSeries](../ThetaSeries/README.md) Layer 1 (1A).
- The count of the ideals of a ray class with norm at most `x`, with main term a multiple of the
  residue of `ζ_K` and error `O(x^(1 − 1/[K : ℚ]))`: Tau Ceti
  `TauCeti.GlobalNumberFields.isBigO_rayClassIdealCountingFunction_sub`; the residue itself:
  Mathlib `NumberField.Ideal.tendsto_norm_le_div_atTop`. §3.5 reads the ideal count of `ℤ[ω]` off
  them.
- Bianchi groups, the hyperbolic quotient and cusps: BianchiModularForms §§0.3–0.4; the Laplacian
  on `ℍ³`: MaassForms §7.1. MaassForms §7.3 states the Fourier–Bessel expansion for `PSL₂(ℤ[i])` with
  trivial character; §8.2 here is the expansion for a cofinite `Γ` with a unitary character at an
  essential cusp, and agrees with it under `μ = n/2`. The `K`-Bessel function:
  [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md) §4.5;
  analytic Fredholm continuation: AutomorphicSpectralTheory §0.16.
- The least quadratic nonresidue `SieveApplications.leastNonresidue`:
  [SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) §2.9.
- Carathéodory's derivative inequality: [AnalyticNumberTheoryPartIII](../AnalyticNumberTheoryPartIII/README.md)
  §8.2.
- The characters of an abelian field: for `K ⊆ ℚ(ζ_f)` abelian over `ℚ`, the primitive characters
  inducing the `[K : ℚ]` Dirichlet characters modulo `f` trivial on the subgroup of `(ℤ/f)ˣ` fixing
  `K`, with `ζ_K(s) = ∏ L(s, χ*)`: [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md)
  §2.42. §5.4 here calls this set `X(K)` and twists it by `χ ∘ N_{K/ℚ}`. Artin induction at every
  finite place and the one-dimensional comparison with primitive Hecke `L`-functions:
  AnalyticNumberTheoryPartI §2.18a.

### Not owned here

- The `7/8` half-plane and its proof (`openai2026quasiRH` Part II, Sections 12–20): a second probe
  for the continuation principle of §1.3 at `(σ₀, C) = (7/8, s − 11/16)`, with the bound
  `|J_η| ≪ Z^(C(σ₀)+ω)` and the comparison with `f_η` that §1.3 asks of it; the Gauss sums of the
  sextic symbol modulo prime powers and the complete correlation sums of two sextic symbols (its
  Lemmas 13.2–13.4); a mean-value bound for a bilinear form in quadratic and cubic residue symbols
  (its Lemma 14.2); Poisson summation for a primitive finite-order character over the elements prime
  to a fixed ideal (its Lemma 17.5); the strip `1/8 ≤ Re ρ ≤ 7/8` and the Landau–Siegel constant
  `(log 3)/8`: QuasiRiemannHypothesisPartII, which takes Layers 1–10 here as its base.
- Uniform exclusion of Landau–Siegel zeros with its own proof and constant:
  [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) §0.34, which keeps its
  statement; §10.7 here implies a stronger bound and is not its supplier.
- The generalized Riemann hypothesis as a predicate: ZerosOfLFunctions Layer 9 and
  AnalyticNumberTheoryPartI §1.6.
- Large sieves over `ℚ`: SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9 and
  AnalyticNumberTheoryPartII §5.29, which keep their statements; §§6.1–6.2 here are the
  number-field generalizations, and at `K = ℚ` §6.2 is implied by AnalyticNumberTheoryPartII §5.29.
- Theta functions and Eisenstein series with a Kubota character on `(ℍ³)^r` for totally imaginary
  fields of degree `2r > 2`: forms with a Kubota character are not automorphic forms of a reductive
  group, so their continuation is outside AutomorphicSpectralTheory §§1.15a–1.15c (Eisenstein series
  of connected reductive groups), and no roadmap plans it; this roadmap reads the Kubota character
  for every totally imaginary `K ⊇ μ_n` off KTheoryLowDegrees §§10.2 and 11.2 (§8.1) and states the
  analysis on `ℍ³` (imaginary quadratic `K`), which is all the cubic theta function needs.
- Consequences for the counting of primes (`ψ(x) − x ≪ x^(11/12+ε)`, power savings in ray classes
  and abelian Chebotarev over `F`, `N(σ, T, χ) = 0` for `σ > 11/12`): Part IIs of
  ExplicitPrimeCounting, AnalyticNumberTheoryPartIII and ZerosOfLFunctions (Downstream consumers).
- Deterministic square roots modulo `p`: the algorithmic clause of `openai2026quasiRH`
  Corollary 1.2 is background for §11.3, not a target.

## Conventions

- **The field.** `F` is a number field with `[IsCyclotomicExtension {3} ℚ F]`, `𝓞 = 𝓞 F = ℤ[ω]`
  with `ω` its primitive cube root of unity (`IsCyclotomicExtension.zeta_spec`), embedded in `ℂ` by
  the embedding `ι` with `ι ω = e^(2πi/3)`. Put `λ = 1 + 2ω = ω − ω²`, so `λ² = −3` and `(λ)` is the
  prime above `3` and the different of `𝓞`. For `a ∈ 𝓞` write `q_a = |a|² = N(a)` and, for
  `a ≠ 0`, `α(a) = a/|a|`; `q_𝔞` is also the norm of an ideal. `F` is totally complex, so every
  modulus of `F` has empty infinite part and a finite-order Hecke character of `F` is a ray class
  character `TauCeti.GlobalNumberFields.RayClassCharacter 𝔪` of some modulus.
- **Primary elements.** An element `c ∈ 𝓞` is *primary* when `c ≡ 1 (mod 3)`. Every ideal prime
  to `3` has exactly one primary generator, and primary elements form a multiplicative monoid.
  Tau Ceti's `TauCeti.IsPrimaryEisenstein` uses `c ≡ 2 (mod 3)`, which is not closed under
  products; `c` is primary exactly when `−c` satisfies `IsPrimaryEisenstein` (§2.2). Witness: the
  prime of norm `7` has primary generator `1 + 3ω` and `IsPrimaryEisenstein` associate `−1 − 3ω`.
  The two conventions give the same cubic symbol, and different quadratic and sextic symbols of
  the generator as a numerator: the sextic symbol of `−1` at that prime is `(−1)^((7−1)/6) = −1`.
- **Excluded primes.** `S` is a finite set of primes of `𝓞` containing `(2)` and `(λ)` and the
  primes of the defining moduli of the fixed characters of the statement at hand; a prime or ideal
  is *good* when it avoids `S`. Ideal sums run over good ideals, represented by primary generators.
- **Symbols.** For primary `c` prime to `6` the sextic symbol is `χ_c(a) = (a/c)_6`, Tau Ceti's
  `Ideal.powerResidueSymbolIdeal (span {c}) 6` at the class of `a`, read in `ℂ` through `ι`;
  `χ_1 = 1` identically, also at `a = 0`. Every power `χ_c^j`, `j ∈ ℤ`, means the usual power at
  `a` prime to `c` and `0` otherwise: `χ_c^6` is the indicator of `(a, c) = 1`, not the constant
  `1`. `χ_c²` is the cubic symbol `(·/c)_3` and `χ_c³` the quadratic symbol `(·/c)_2`.
  `χ_•(m)` denotes the function `𝔫 ↦ χ_n(m)` of the primary generator `n` of `𝔫`.
- **Additive character and measure.** `e(z) = exp(2πi Tr_{F/ℚ}(z/λ))`, which on `ℂ` is
  `exp(4πi Im z/√3)`; `ě(z) = exp(2πi(z + z̄)) = e(λz)` is the character of `dunnradziwill2024` and
  `patterson1977`. The measure `dμ = (2/√3) dx dy` makes `𝓞` self-dual for `(x, y) ↦ e(xy)`, with
  covolume `1` (§3.5). The Fourier transform on `ℂ` is `f̂(y) = ∫ f(x) e(−xy) dμ(x)`.
- **Gauss sums.** For primary squarefree `c` prime to `6` and `j ∈ ℤ`,
  `γ_j(c) = q_c^(−1/2) Σ_{x mod c} χ_c(x)^j e(x/c)`, with `γ_j(1) = 1`.
- **Zeros.** A function `f : ℂ → ℂ` has a zero at `ρ` when `0 < meromorphicOrderAt f ρ`; "no zero
  in `Re s > σ`, poles allowed" is §1.1's predicate. The value of a meromorphic function at a pole
  is junk and is never read: Tau Ceti's `heckeLFunctionC` is in normal form and is `0` when no
  continuation exists, so a value-based statement would be false at `s = 1` or vacuous.
- **Mellin and Fourier transforms.** `MW(s) = ∫₀^∞ W(y) y^s dy/y` is Mathlib's `mellin W s`;
  a norm twist `y^(iw)` translates it: `M[W(y) y^(iw)](s) = MW(s + iw)`.
- **Uniformity.** Uniformity is a quantifier order. "Independent of the target" means the number
  is chosen before the target character; implied constants and lower thresholds written `≪_η`
  may depend on the target and on its fixed arithmetic data (the presentations of the fixed
  characters, their moduli, `S`).
- **Smooth.** "Smooth" is `ContDiff ℝ ∞`; an *annular* function on `(0, ∞)^d` is smooth with support
  in a fixed compact subset of `(0, ∞)^d`.

## Exact supplier contracts

### From Mathlib

- `meromorphicOrderAt`, `meromorphicOrderAt_mul`, `meromorphicOrderAt_ne_top_iff` and
  `MeromorphicNFOn`: order is a germ invariant with values in `WithTop ℤ`, additive on products of
  meromorphic functions, `⊤` exactly on the germ of `0`. No regularity is read off a value.
- `riemannZeta`, `differentiableAt_riemannZeta` (analytic off `s = 1`),
  `riemannZeta_ne_zero_of_one_le_re`; `DirichletCharacter.LFunction`,
  `DirichletCharacter.differentiableAt_LFunction` (analytic off `s = 1`, and at `1` for `χ ≠ 1`),
  `DirichletCharacter.LFunction_modOne_eq` (level one is `ζ`), `DirichletCharacter.LFunction_changeLevel`
  (imprimitive versus primitive, with the finite Euler correction),
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `DirichletCharacter.LFunction_apply_one_ne_zero`,
  `DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos` (the trivial zeros of a primitive
  character), `DirichletCharacter.completedLFunction`, `DirichletCharacter.gammaFactor` and
  `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` (the functional equation
  `Λ(1 − s, χ) = ε(χ) Λ(s, χ⁻¹)`).
- `mellin`, `mellinInv`, `mellinInv_mellin_eq` (Mellin inversion under `MellinConvergent`).
- `gaussSum` over a finite commutative ring with `gaussSum_mulShift` and
  `gaussSum_mul_gaussSum_eq_card` (over a finite field); `AddChar.complexBasis`
  (`Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean`): the complex characters of a
  finite abelian group are a basis of the complex functions on it, with no coefficient formula.
- `Complex.borelCaratheodory`; `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`
  (Hadamard's three-lines theorem, which gives the three-circles inequality through the exponential
  map); `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
  (`Mathlib/Analysis/Complex/CauchyIntegral.lean`, Cauchy's theorem on a rectangle).
- Kummer theory `autAdjoinRootXPowSubCEquiv` (`FieldTheory/KummerExtension.lean`): for `μ_n ⊆ K`
  the Galois group of `X^n − a` embeds in `μ_n`; `AlgHom.IsArithFrobAt`.
- `IsAbelianGalois` (abelian extensions, §§5.4–5.5); `NumberField.Ideal.tendsto_norm_le_div_atTop`
  (the number of ideals of norm at most `x`, divided by `x`, tends to
  `2^(r₁) (2π)^(r₂) h R/(w √|d_K|)`); `riemannZeta_one` (Mathlib's value `ζ(1) = (γ − log 4π)/2`)
  and `riemannZeta_one_ne_zero` (it is not `0`); `DirichletCharacter.IsPrimitive`; `MulChar`.
- `IsCyclotomicExtension.zeta_spec`, `Ideal.absNorm`, `UniqueFactorizationMonoid.normalizedFactors`,
  `jacobiSym`, `ZLattice.covolume`, `SchwartzMap`; the Fourier transform
  `VectorFourier.fourierIntegral` with its real inner-product specialization `Real.fourier_eq`
  (`𝓕f(ξ) = ∫ e^(−2πi⟨x, ξ⟩) f(x) dx`, `Mathlib/Analysis/Fourier/FourierTransform.lean`) and
  Fourier inversion `MeasureTheory.Integrable.fourierInv_fourier_eq`.

### From Tau Ceti

- `TauCeti.LFunctions.heckeLFunctionC` (the canonical continuation of the series of a ray class
  character at its presentation modulus, `0` if none exists, in meromorphic normal form),
  `TauCeti.LFunctions.heckeLFunctionC_eventuallyEq_primitive` (the presented function has the
  germ of the primitive one times the Euler correction at every point),
  `TauCeti.LFunctions.PrimitiveRayClassCharacter` with `.of`, `.conductor`, `.character`;
  `TauCeti.GlobalNumberFields.RayClassCharacter.eulerCorrection` with
  `differentiable_eulerCorrection` and `eulerCorrection_ne_zero` (no zero on `Re s > 0`);
  `TauCeti.LFunctions.meromorphicNFOn_heckeLFunctionC` (normal form on the whole plane, also when it
  is `0`) and `TauCeti.LFunctions.analyticOnNhd_heckeLFunctionC` (holomorphic on `Re s > 1`). That
  `heckeLFunctionC` agrees with its series on `Re s > 1`, that is, that a continuation exists, is
  LFunctions Layer 5.
- `TauCeti.GlobalNumberFields.Modulus`, `RayClassGroup`, `RayClassCharacter`
  (`RayClassGroup 𝔪 →* ℂˣ`), `idealClass`, `RayClassCharacter.conductor`,
  `RayClassCharacter.toMultiplicativeIdealWeight`; column orthogonality for the characters
  `χ : G →* ℂˣ` of a finite commutative group, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`
  (`Σ_χ χ(σ)⁻¹ χ(g) = |G|` if `g = σ` and `0` otherwise;
  `GroupTheory/FiniteAbelian/CharacterOrthogonality.lean`), and its form on a ray class group,
  `TauCeti.LFunctions.sum_inv_smul_toUnitaryIdealWeight` (`#Cl_𝔪 · 1_c = Σ_χ χ(c)⁻¹ χ` on ideal weights;
  `NumberTheory/LFunctions/Hecke/Orthogonality.lean`).
- `Ideal.powerResidueSymbol` (prime symbol, trivial by convention when `N P` is not prime to `n`),
  `Ideal.powerResidueSymbolIdeal` (the product over the prime factors, `0` exactly on classes not
  prime to the ideal), `Ideal.powerResidueSymbolIdeal_mul_right`, `Ideal.powerResidueSymbolIdeal_neg`.
- `TauCeti.IsPrimaryEisenstein` (`c ≡ 2 mod 3`),
  `TauCeti.IsPrimaryEisenstein.cubic_reciprocity` (primary primes of different norms) and
  `TauCeti.IsPrimaryEisenstein.cubic_reciprocity_intCast`,
  `Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq` (`g³ = N π · π` at a primary prime).
- `TauCeti.meromorphicContinuation` and `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.
- `TauCeti.GlobalNumberFields.rayClassIdealCountingFunction`,
  `TauCeti.GlobalNumberFields.rayClassIdealMainTerm` and
  `TauCeti.GlobalNumberFields.isBigO_rayClassIdealCountingFunction_sub`: the number of nonzero
  integral ideals prime to `𝔪` in a ray class of `𝔪` with norm at most `x` is
  `rayClassIdealMainTerm 𝔪 · x + O(x^(1 − 1/[K : ℚ]))` as `x → ∞`, the main term being the residue
  of `ζ_K` at `1` divided by the order of the ray class group, times `1 − N𝔭⁻¹` at each prime of
  `𝔪`.
- `TauCeti.norm_gaussSum`: `|g(χ, ψ)| = √#F` over a finite field `F` for nontrivial `χ` and
  primitive `ψ`.
- `Ideal.powerResidueSymbolIdeal_intCast_three`: in `ℚ(ω)` the cubic symbol of a rational integer
  at the ideal of a coprime rational integer is `1`.
- `TauCeti.ClassFieldTheory.kroneckerWeber`: an abelian number field (`IsAbelianGalois ℚ E`) embeds
  in a cyclotomic field.

### From TauCetiRoadmap.LFunctions

Layer 4 (Dirichlet `L`-functions and the quadratic factorization `ζ_K = ζ · L(·, χ_K)` with its
three readings: on `Re s > 1`, as germs, and pointwise away from `1`), Layer 5 (continuation of
`heckeLFunctionC` to a meromorphic function on `ℂ`, entire for a nontrivial primitive character,
the completed function with root number of modulus one and the functional equation
`Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)`; the Gauss sum `gaussSum` of a residue character against
`x ↦ e^(2πi Tr(xy))` for `y ∈ 𝔪₀⁻¹𝔡⁻¹`, the domain on which this additive character is defined
on `𝓞/𝔪₀`, with `gaussSum_mul` and `norm_gaussSum` under `y 𝔪₀ 𝔡` prime to `𝔪₀`; the analytic
record `heckeData ψ` of a primitive character: degree `[K : ℚ]`, conductor `|d_K| N𝔣`, one real
gamma shift in `{0, 1}` per real place, one complex gamma shift `0` per complex place, simple poles
at `0` and `1` exactly for the trivial character), Layers 6 and 8 (`heckeData ψ` agrees off the
coefficient at `0` with the record `grossencharacterData` of its Grossencharacter, which satisfies
`HasDirichletAgreement`, `HasMeromorphicContinuation` and `HasFunctionalEquation`), Layer 7
(for a nontrivial primitive `ψ`, `heckeLFunctionC ψ.character` has no zero on `Re s = 1`; the layer
makes no statement for the trivial character, whose `L`-function `ζ_K` has its pole at `1`).

### From TauCetiRoadmap.ZerosOfLFunctions

§1.6 (*continuedL* `d`, the uncompleted `L`-function of a record, with
`continuedL (heckeData ψ) = heckeLFunctionC ψ.character`), §3.1 (finite order of the entire
completion of `heckeData ψ` for primitive `ψ`: *IsFiniteOrder* holds),
§§4.4–4.5 (zeros in unit windows
`≪ log(N𝔣 (|T| + 2))` and the counting functions, uniformly in the conductor), §§8.4 and 8.6 (the
Weil explicit formula for primitive finite-order Hecke characters of any number field, test class
`ContDiff ℝ ∞` with compact support in `(0, ∞)`, zero side summable), §8.5 (the prime ideal
theorem).

### From TauCetiRoadmap.ExplicitZetaBounds

§3.2 (Rademacher's convexity bound `norm_continuedL_le_rademacher`): for a record `d` of
finite-order type — the three predicates of LFunctions Layer 0, real gamma shifts in `{0, 1}` and
complex gamma shifts `0`, polar divisor supported in `{0, 1}` with order at most one and a pole of
the gamma factor at `0` when the completion has one there, `s (s − 1) Λ(s)` of finite order, and the
coefficient majorant `Σ_m |a_m| m^(−σ) ≤ ζ(σ)^n` for real `σ > 1` — and for `0 < η ≤ 1/2`,
`−η ≤ σ ≤ 1 + η`, `s ≠ 1`: `‖continuedL d s‖ ≤ P(s) (N (|1 + s|/(2π))^n)^((1+η−σ)/2) ζ(1 + η)^n`, where
`n` is the degree, `N` the conductor, and `P(s) = 3 |(1 + s)/(1 − s)|` when the completion has a pole
at `1` and `P(s) = 1` otherwise. Consumed in §5.2 at `η = 1/10` and the Hecke records.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.12 (primary Eisenstein integers, `≡ 2 mod 3`), §1.23 and §1.33 (the symbol at primes and at
ideals prime to `n`), §1.34 (an arithmetic Frobenius acts on `n`-th roots by the symbol), §1.38 (every
Eisenstein prime of norm other than `3` has exactly one primary associate), §1.72 (cubic reciprocity
at primes), §1.75 (Eisenstein's supplement at `1 − ω`).

### From TauCetiRoadmap.KTheoryLowDegrees

§10.1 (a Mennicke symbol `[b/a] = s(a, b)` on the pairs with `a ≡ 1`, `b ≡ 0` modulo `I` and
`aA + bA = A`: invariance under `b ↦ b + ta` for `t ∈ I` and under `a ↦ a + tb` for `t ∈ A`,
multiplicativity in the numerator and in the denominator on such pairs, and the value `1` when the
first entry is a unit), §10.2 (for a Dedekind domain `A`, `κ(g) = [b/a]`, read off the first row
`(a, b)` of `g`, is a homomorphism on `GL₂(A, I)`, trivial on `E₂(A, I)` and on the congruence
diagonal matrices, with `κ(gᵀ) = κ(g)⁻¹`), §11.1 (the exponent `r(I) = ∏_{p ∣ m} p^(j(I, p))` of a
nonzero ideal `I` of the integers of a totally imaginary field with `m` roots of unity) and §11.2
(`(b/a)_{r(I)}` is a Mennicke symbol at level `I`, surjective onto `μ_{r(I)}`), used in §8.1 through
the first-row value `[b/a]`.

### From TauCetiRoadmap.ClassFieldTheory

Layer 11 (global Artin reciprocity: the Artin map of a finite abelian extension factors through
the ray class group of an admissible modulus) and §13.1, as Tau Ceti realizes them (`TauCeti.ClassFieldTheory.rayClassField`,
`TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_le_rayClassField`;
`TauCeti.ClassFieldTheory.abelianConductor`, the least admissible modulus, with
`TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor` (it is admissible) and
`TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_abelianConductor_dvd` (the admissible moduli are its
multiples); `TauCeti.ClassFieldTheory.conductorExponent_eq_zero_of_isUnramified`: an unramified
extension of local fields has conductor exponent `0`, so its norms contain the local units;
`TauCeti.ClassFieldTheory.kroneckerWeber`).

### From TauCetiRoadmap.ThetaSeries

Layer 1 (1A): for a full-rank lattice `L` in a finite-dimensional real inner product space, a
Schwartz `f` and a shift `v`, `∑_ℓ f(v + ℓ) = covolume(L)⁻¹ ∑_{m ∈ L^∨} 𝓕f(m) e(⟨v, m⟩)`, with
Mathlib's sign convention.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

§§1.4–1.5 (the quadratic Gauss sum over the prime field and the Gauss sums of characters of small
order, used in Checks); §3.4 (the
duplication formula `g(χ) g(χη) = χ(4)⁻¹ g(χ²) g(η)` in odd characteristic, `η` the quadratic
character, for every `χ`).

### From TauCetiRoadmap.BianchiModularForms

§0.3 (discreteness and finite covolume of the image of `Γ₀(𝔫, 𝔞)`, and of `PSL₂(𝓞_K)`, acting on
`ℍ³`; a finite-index subgroup of `SL₂(𝓞_K)`, such as `Γ₂` or `Γ(N) ∩ SL₂(𝓞_K)`, inherits both) and
§0.4 (cusps as `Γ`-orbits on `ℙ¹(K)`, cusp stabilizers as extensions of a finite group by a
rank-two translation lattice), used in §§8.2–8.4.

### From TauCetiRoadmap.MaassForms

§7.1 (the Laplacian `Δ₃ = −v²(∂_x² + ∂_y² + ∂_v²) + v ∂_v` on `ℍ³`, invariant under `PSL₂(ℂ)`,
symmetric for `v⁻³ dx dy dv`, with `Δ₃ v^s = s(2 − s) v^s`), used in §§8.2–8.5; §7.3 (the
Fourier–Bessel expansion for `PSL₂(ℤ[i])` with trivial character) is compared with §8.2 in a Check.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§4.5 (the `K`-Bessel function `K_ν(u) = ∫₀^∞ e^(−u cosh t) cosh(νt) dt` for `u > 0` and complex
`ν`, its differential equation and exponential decay), used in §§8.2, 8.5–8.7.

### From TauCetiRoadmap.AutomorphicSpectralTheory

§0.15 (weak and strong meromorphic operator families) and §0.16 (analytic Fredholm continuation),
used as functional analysis in §8.4.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

§2.9 `SieveApplications.leastNonresidue p`: the least `n ≥ 1` with `jacobiSym n p = −1` for an odd
prime `p`, and `0` otherwise.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§2.42 (for `K/ℚ` abelian and `K ⊆ ℚ(ζ_f)`, with `H ⊆ (ℤ/f)ˣ` the `a` whose automorphism
`ζ_f ↦ ζ_f^a` fixes `K`: the `[K : ℚ]` Dirichlet characters modulo `f` trivial on `H`, their primitive
characters `χ*`, `Gal(K/ℚ) ≅ (ℤ/f)ˣ/H`, and `ζ_K(s) = ∏_χ L(s, χ*)` as meromorphic functions), used in
§5.4 to name the set `X(K)`; §2.18a (for a finite extension `M/F` and a finite-image character `σ` of
`Gal(F̄/M)`, `L_F(s, Ind σ) = L_M(s, σ)` on `Re s > 1`, with local factors on inertia invariants at
every finite place; a one-dimensional Artin `L`-function is the primitive Hecke `L`-function of the
character attached by global reciprocity), used in §5.4.

### From TauCetiRoadmap.AnalyticNumberTheoryPartIII

§8.2 (Carathéodory's coefficient inequality and its derivative form), used in §5.3.

## How to read the build

Layer 1 is pure complex analysis and fixes what a zero-free half-plane is and how two estimates
for one average continue a reciprocal across the rightmost zeros. Layers 2–4 are the arithmetic
and harmonic-analytic substrate: symbols at composite moduli of `ℤ[ω]` and their general forms
over fields containing `μ_n` (Layer 2), smooth Mellin and Fourier kernels and the self-dual lattice
`ℤ[ω]` (Layer 3), and Gauss sums modulo ideals with the sextic reciprocity phase (Layer 4, which
uses the symbols and cubic reciprocity of Layer 2 and Poisson summation from Layer 3). Layer 5
supplies the uniform analytic bounds for Hecke `L`-functions and the transfer from an abelian
field to Dirichlet `L`-functions, and uses Layer 1 (§§1.1–1.2). Layers 6 (large sieves) and 8
(Kubota's character and theta functions) are self-contained supplier blocks: of this roadmap's
layers, Layer 6 needs Layers 2–4 and Layer 8 needs Layers 2 and 4; beyond them Layer 6 uses the
Hecke functional equation of LFunctions Layer 5 and Poisson summation (ThetaSeries Layer 1), and
Layer 8 Kubota's homomorphism, the Bianchi groups, the Laplacian on `ℍ³`, the `K`-Bessel function
and analytic Fredholm continuation (KTheoryLowDegrees, BianchiModularForms, MaassForms,
AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory); neither needs Layers 7 or 9–11.
Layer 7 detects zeros of Hecke `L`-functions by large values of short Dirichlet polynomials and
needs Layers 1 (§1.2), 3 and 5.
Layer 9 transforms the completed sum of cubic Gauss coefficients by the cubic theta function and
bounds its mean square; it needs Layers 2, 3, 4, 6 and 8. Layer 10 assembles the probe at `11/12`:
the direct estimate (Layers 6 and 9), the Poisson representation with its Euler factors (Layers
3–5), the row count (Layers 6–7) and the contour estimates, and closes with the `11/12` half-plane
through Layer 1 and the transfer of Layer 5. Layer 11 draws the consequences from Layers 1, 5 and 10.

## Layer 1: zero-free half-planes and the continuation principle

### 1.1 Zero-free half-planes

Define `ZeroFreeRightOf σ f`, for `σ : ℝ` and `f : ℂ → ℂ`, to mean that
`meromorphicOrderAt f s ≤ 0` for every `s` with `σ < Re s`: `f` has no zero there, and poles are
allowed. *Zero-free right of `σ`* is this predicate in prose. This is the reading of "no zero in `Re s > σ`, the principal pole allowed" of
`openai2026quasiRH` Theorem 1.1 (p. 4) and of its supremum (2.1) (p. 8).

- For `σ ≤ σ'`, `ZeroFreeRightOf σ f` implies `ZeroFreeRightOf σ' f`.
- The predicate depends only on punctured germs: if `f` and `g` agree on a punctured
  neighbourhood of every `s` with `σ < Re s`, then `ZeroFreeRightOf σ f` holds exactly when
  `ZeroFreeRightOf σ g` does.
- If `f` is meromorphic at every point of `Re s > σ` and `D` is analytic and nonzero at every such
  point, then `f · D` is zero-free right of `σ` exactly when `f` is; if `f` and `g` are meromorphic
  there and both zero-free right of `σ`, so is `f · g` (`meromorphicOrderAt_mul`).
- At a point where `f` is analytic, `meromorphicOrderAt f s ≤ 0` holds exactly when `f s ≠ 0`.
- For a Dirichlet character `χ` of level `N ≥ 1`, `ZeroFreeRightOf σ (DirichletCharacter.LFunction χ)`
  holds exactly when every `s` with `σ < Re s` has `LFunction χ s ≠ 0` or `χ = 1 ∧ s = 1`
  (`DirichletCharacter.differentiableAt_LFunction` off the pole, order `−1` at it).
- For a ray class character `χ` of a modulus `𝔪` of a number field and `σ ≥ 0`,
  `ZeroFreeRightOf σ (heckeLFunctionC χ)` holds exactly when it holds for
  `heckeLFunctionC (PrimitiveRayClassCharacter.of χ).character`, by the germ comparison
  `heckeLFunctionC_eventuallyEq_primitive` and `eulerCorrection_ne_zero` on `Re s > 0`.

**Checks.**

- `s ↦ s − 2` is zero-free right of `2` and not right of `3/2`: its order at `2` is `1`.
- The zero function is zero-free right of no `σ`, its order being `⊤` everywhere; a statement about
  `heckeLFunctionC`, which is `0` when no continuation exists, is therefore never satisfied
  vacuously.
- `s ↦ 1/(s − 1)` is zero-free right of every `σ`: its order at `1` is `−1`, so a principal pole
  is allowed.
- Complex conjugation `s ↦ s̄` is meromorphic at no point, so its order is Mathlib's junk value
  `0` everywhere (`meromorphicOrderAt_of_not_meromorphicAt`) and it is zero-free right of every `σ`
  although it vanishes at `0`: the predicate carries information only for meromorphic `f`, which
  is why the third bullet above and §1.3 assume meromorphy.
- The function equal to `s − 2` off `s = 2` and to `1` at `s = 2` has a nonzero value at `2` and
  order `1` there: it is not zero-free right of `3/2`, while a definition through values would
  accept it.
- `riemannZeta` is zero-free right of `1`: on `Re s > 1` it is analytic
  (`differentiableAt_riemannZeta`, since `s ≠ 1`) and nonzero (`riemannZeta_ne_zero_of_one_le_re`),
  so its order there is `0`. The point `s = 1`, where the order is `−1`, has `Re s = 1` and lies
  outside this half-plane; it enters only for `σ < 1` (§10.7), and there the predicate reads the
  order `−1`, not Mathlib's value `ζ(1) = (γ − log 4π)/2`.

*Needs:* Mathlib `meromorphicOrderAt`, `meromorphicOrderAt_mul`, `riemannZeta_ne_zero_of_one_le_re`,
`DirichletCharacter.differentiableAt_LFunction`; Tau Ceti `heckeLFunctionC_eventuallyEq_primitive`,
`RayClassCharacter.eulerCorrection_ne_zero`.

### 1.2 The zero abscissa of a family

For a family `L : ι → ℂ → ℂ` define *zeroAbscissa* `L` as the supremum of `1/2` and of the real
parts of the points `ρ` with `1/2 ≤ Re ρ` and `0 < meromorphicOrderAt (L η) ρ` for some `η`
(`openai2026quasiRH` (2.1), p. 8; `liu2026improved` (1.2)). For the family of primitive finite-order
Hecke `L`-functions of `F` it is the number `β*` of `openai2026quasiRH` (2.1).

- If every `L η` is zero-free right of `1`, then `1/2 ≤ zeroAbscissa L ≤ 1`.
- Under the same hypothesis, for every `σ ≥ 1/2`: `zeroAbscissa L ≤ σ` holds exactly when every
  `L η` is zero-free right of `σ`.
- Under the same hypothesis, if `zeroAbscissa L > 1/2` then for every `ε > 0` there are `η` and a
  zero `ρ` of `L η` with `zeroAbscissa L − ε < Re ρ ≤ zeroAbscissa L`.
- Replacing each `L η` by `L η · D_η`, with `L η` meromorphic and `D_η` analytic and nonzero on
  `Re s > 0`, does not change the zero abscissa.

**Checks.**

- The empty family has zero abscissa `1/2`.
- The family `{s ↦ s − 3/4}` has zero abscissa `3/4`; the family `{s ↦ s − 1/4}` has `1/2`,
  since a zero left of `1/2` is not counted.
- The family `{s ↦ s − 3/4, s ↦ 1/(s − 1)}` has zero abscissa `3/4`: the pole at `1` is not a zero.
- A family containing the zero function has an unbounded set of real parts, and Mathlib's `sSup`
  returns its junk value `0` there; the hypothesis "zero-free right of `1`" in every statement
  above excludes it. The family `{s ↦ s − 2}` violates that hypothesis and has zero abscissa
  `2 ∉ [1/2, 1]`.

*Needs:* §1.1; Mathlib `sSup`, `meromorphicOrderAt`.

### 1.3 The continuation principle

Let `L : ι → ℂ → ℂ` be a family with every `L η` meromorphic on `Re s > 1/2` and analytic and
nonvanishing on `Re s > 1`; put `β* = zeroAbscissa L`. Fix `σ₀ ∈ (1/2, 1)` and a real `c`, and put
`C(s) = s + c`. Prove that if `σ₀ < β*`, there are no numbers `ω` and `σ` with
`0 < ω < β* − σ₀` and `σ > 0` together with, for every `η`, the following data: a function `D_η`
analytic and nonvanishing on `Re s > 0` (the deleted Euler factors) with `1/(L_η D_η)` bounded on
`Re s ≥ 2`; a function `H_η` holomorphic on `Re s > σ₀` with `|H_η(s) − 1| ≤ 1/2` there; and a
function `J_η` of a real variable such that, for `Z` beyond a threshold depending on `η`,
`|J_η(Z)| ≤ A_η Z^(C(σ₀)+ω)` and `|J_η(Z) − f_η(Z)| ≤ B_η Z^(C(β*)−σ)`, where

```text
f_η(Z) = (2πi)⁻¹ ∫_{Re s = 2} Z^(C(s)) e^((s − 5/6)²) H_η(s) / (L_η(s) D_η(s)) ds.
```

The numbers `ω`, `σ` are independent of `η`; `A_η`, `B_η`, the threshold, `D_η` and `H_η` may
depend on `η`. Equivalently: whenever such data exist, `β* ≤ σ₀`
(`openai2026quasiRH` Proposition 2.1, p. 8; `liu2026improved` Proposition 3.1).

Route: put `E* = min(β* − σ₀ − ω, σ)`, so `|f_η(Z)| ≪_η Z^(C(β*)−E*)` for large `Z`; moving the
line to `Re s = B` gives `|f_η(Z)| ≪_{η,B} Z^(B+c)` for `0 < Z ≤ 1`; the Mellin transform
`F_η(s) = ∫₀^∞ f_η(Z) Z^(−C(s)) dZ/Z` is holomorphic on `Re s > β* − E*`; Fourier inversion on
`Re s = 2` and the identity theorem give `F_η(s) = e^((s−5/6)²) H_η(s)/(L_η D_η)(s)` on `Re s > 1`;
since `|H_η| ≥ 1/2`, `e^(−(s−5/6)²) F_η/H_η` continues `1/(L_η D_η)` holomorphically to
`Re s > β* − E* > σ₀`, which excludes zeros of every `L_η` there; the third bullet of §1.2 supplies
a zero with real part above `β* − E*`.

*Needs:* §§1.1–1.2; Mathlib `mellin`, `mellinInv_mellin_eq`, `Complex.exp`; the identity theorem
for analytic functions; the residue-free contour shift on `2 ≤ Re s ≤ B`
(Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`).

### 1.4 Fixing the height exponent before the decay order

Fix `σ₀ ∈ (1/2, 1)`, `β* > σ₀`, `C(s) = s + c`, numbers `m > 0` and `0 < ω < β* − σ₀`, and
`d_min > 0`, all independent of the target `η`. Suppose that for every target there are functions
`J_η`, `f_η` with `|J_η(Z)| ≪_η Z^(C(σ₀)+ω)`, numbers `A_η ≥ 0`, `B_η` and `τ_{0,η} > 0` such
that for every integer `N ≥ 0` and every `τ ∈ (0, min(d_min/100, τ_{0,η})]` there are `K` and a
threshold, both allowed to depend on `η, N, τ`, with

```text
|J_η(Z) − f_η(Z)| ≤ K (Z^(C(β*)−m) (1 + Z^τ)^(A_η) + Z^(B_η − N τ))   for Z beyond the threshold.
```

Prove that `|J_η(Z) − f_η(Z)| ≪_η Z^(C(β*)−m/2)`: choose `τ` with `A_η τ ≤ m/4` and then `N` with
`B_η − Nτ < C(β*) − m/2` (`openai2026quasiRH` Lemma 11.1, p. 82). With §1.3 the saving `m/2` has
the required quantifier order.

*Needs:* nothing beyond real arithmetic.

### Examples

- The two instances of §1.3 are `(σ₀, C) = (11/12, s − 2/3)` with `C(σ₀) = 1/4` (§10.7) and
  `(7/8, s − 11/16)` with `C(σ₀) = 3/16` (the `7/8` stage).
- `riemannZeta` is zero-free right of `1`, and no `σ < 1` is known to Mathlib; §10.7 gives
  `σ = 11/12`.
- The Gaussian factor of §1.3 has `|e^((2 + it − 5/6)²)| = e^((7/6)² − t²)`, integrable in `t`.

### Dependencies

Mathlib `meromorphicOrderAt`, `meromorphicOrderAt_mul`, `mellin`, `mellinInv_mellin_eq`,
`riemannZeta_ne_zero_of_one_le_re`, `DirichletCharacter.differentiableAt_LFunction`; Tau Ceti
`heckeLFunctionC_eventuallyEq_primitive`, `eulerCorrection_ne_zero`.

## Layer 2: power residue symbols as ray class characters, and primary elements of `ℤ[ω]`

### 2.1 The fixed-numerator theorem

Let `K` be a number field with `μ_n ⊆ 𝓞 K` and `ι : K → ℂ` an embedding. For a nonzero `a ∈ 𝓞 K`,
prove that there are a modulus `𝔪` of `K`, whose finite part is divisible only by primes dividing
`n a` and whose infinite part is empty when `n ≥ 3`, and a character
`ψ_a : TauCeti.GlobalNumberFields.RayClassCharacter 𝔪` with
`ψ_a(idealClass 𝔟) = ι((a/𝔟)_n)` for every nonzero integral ideal `𝔟` prime to `n a`, the symbol
being `Ideal.powerResidueSymbolIdeal 𝔟 n` at the class of `a`. No bound on the exponents of `𝔪` is
asserted, and the identification says nothing at ideals meeting `n a`, where the symbol is `0`
(`openai2026quasiRH` Lemma 4.1, p. 11, for `n = 6` and `K = F`; `milnecft2020` Chapter VIII, 5.3
and 5.5, p. 245).

Route: `L = K(a^(1/n))` is the splitting field of `X^n − a`, abelian over `K` with
`Gal(L/K) ↪ μ_n` (Mathlib's Kummer theory), unramified outside `n a` (the discriminant of
`X^n − a` divides `n^n a^(n−1)`). At a prime `𝔭 ∤ n a` an arithmetic Frobenius acts on `a^(1/n)` by
`(a/𝔭)_n` (ClassicalArithmeticCompletion §1.34); the Artin map is multiplicative; global Artin
reciprocity factors it through the ray class group of the conductor `abelianConductor K L`, which is
admissible (ClassFieldTheory Layer 11, §13.1). The conductor has exponent `0` at every finite place
`v ∤ n a`: there `L/K` is unramified, so the local units at `v` are norms from `L_w`
(`conductorExponent_eq_zero_of_isUnramified`), an idele that is such a norm at `v` and `1` elsewhere is an
idele norm from `L`, so the conductor with its `v`-exponent lowered to `0` is still admissible and, the
conductor dividing every admissible modulus (`isAdmissibleModulus_iff_abelianConductor_dvd`), its
`v`-exponent is `0` (`milnecft2020` Chapter V, Theorem 3.5 and Remark 3.8, p. 158). A field containing
`μ_n` with `n ≥ 3` has no real place.

- For nonzero `a, b`: `ψ_(ab) = ψ_a ψ_b` and `ψ_(a c^n) = ψ_a` on ideals prime to `n a b c`.
- `ψ_a` is trivial when `a` is an `n`-th power in `𝓞 K`.

**Checks.**

- `K = ℚ`, `n = 2`, `a = −1`: `ψ` is the character `p ↦ (−1)^((p−1)/2)` of conductor `4∞`; the
  real place is needed, so the clause "empty infinite part" is stated for `n ≥ 3` only.
- `K = ℚ`, `n = 2`, `a = 5`: `ψ(3) = (5/3) = −1 = (3/5)`; the conductor is `5`, prime to `2`
  although `2 ∣ n a`, so the finite part divides a power of `10` without being equal to it.
- `K = F`, `n = 6`, `a = −1`: at the prime of norm `7` the value is `(−1)^((7−1)/6) = −1`, at a
  prime of norm `13` it is `+1`; the prime `(2)` of norm `4` divides `n` and is excluded.
- `a = b^n`: the character is trivial on ideals prime to `n b`; at `𝔟 ∣ b` the symbol is `0`,
  which is not a character value, which is why the identification is restricted.

*Needs:* Tau Ceti `Ideal.powerResidueSymbolIdeal`, `Ideal.powerResidueSymbolIdeal_mul_right`;
ClassicalArithmeticCompletion §§1.33, 1.34; ClassFieldTheory Layer 11 and §13.1
(`TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_le_rayClassField`,
`TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor`,
`TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_abelianConductor_dvd`,
`TauCeti.ClassFieldTheory.conductorExponent_eq_zero_of_isUnramified`);
Mathlib `autAdjoinRootXPowSubCEquiv`, `AlgHom.IsArithFrobAt`.

### 2.2 Primary elements of `ℤ[ω]`

Define *IsPrimary* `c` for `c ∈ 𝓞` by `3 ∣ c − 1` (Conventions; `openai2026quasiRH` §4.1, p. 10;
`dunnradziwill2024` (1.4)).

- `c` is primary exactly when `−c` satisfies `TauCeti.IsPrimaryEisenstein`.
- `1` is primary and products of primary elements are primary.
- `a + bω` with `a, b ∈ ℤ` is primary exactly when `a ≡ 1` and `b ≡ 0 (mod 3)`.
- Every element prime to `λ` has exactly one primary unit multiple, so every ideal prime to `3`
  has exactly one primary generator (Tau Ceti's `existsUnique_isPrimaryEisenstein_unit_mul`,
  transported by negation); a primary element has norm `≡ 1 (mod 3)`.

**Checks.**

- `1`, `−2` (norm `4`, the inert prime above `2`) and `1 + 3ω` (norm `7`) are primary; `−1 − 3ω`
  satisfies `IsPrimaryEisenstein` and is not primary.
- Of the six units only `1` is primary: their residues modulo `3` are the six units of `𝓞/3`.
- Tau Ceti's convention is not multiplicative: `−1` satisfies `IsPrimaryEisenstein` while
  `(−1)(−1) = 1` does not; the convention here is.
- `λ = 1 + 2ω` has no primary unit multiple, since `λ ∣ 3`: the hypothesis "prime to `λ`" cannot
  be dropped.

*Needs:* Tau Ceti `TauCeti.IsPrimaryEisenstein`, `IsPrimitiveRoot.existsUnique_isPrimaryEisenstein_unit_mul`,
`IsPrimitiveRoot.isPrimaryEisenstein_add_mul_iff`; ClassicalArithmeticCompletion §§1.12, 1.38.

### 2.3 The sextic symbol at composite moduli

Define the sextic symbol `χ_c(a)` for primary `c` prime to `6` as in Conventions, through
`Ideal.powerResidueSymbolIdeal (span {c}) 6` and `ι`, with the zero extension on nonunits and
`χ_1 = 1` (`openai2026quasiRH` §4.1, p. 11).

- `χ_c(ab) = χ_c(a) χ_c(b)` and `χ_(cd)(a) = χ_c(a) χ_d(a)`; `χ_c(a)` depends on `a mod c` and
  vanishes exactly when `(a, c) ≠ 1`.
- At a primary prime `p`, `χ_p(a)` is the sixth root of unity congruent to `a^((q_p−1)/6)` modulo
  `p`; in particular `χ_p(ζ) = ζ^((q_p−1)/6)` for a sixth root of unity `ζ`.
- `χ_c²` is the cubic symbol `(·/c)_3` and `χ_c³` the quadratic symbol `(·/c)_2`
  (`Ideal.powerResidueSymbol_pow_div` at each prime factor).
- `χ_c` depends only on the ideal `(c)`.

**Checks.**

- At `p = 1 + 3ω` (`q_p = 7`): `𝓞/p ≅ 𝔽₇` with `ω ↦ 2`, so `χ_p(2) = ω` and `χ_p(3) = −ω²`, and
  `χ_p(−1) = −1`.
- `χ_p^6(7) = 0` since `p ∣ 7`, whereas `χ_p^6(2) = 1`: the sixth power is the coprimality
  indicator, not the constant `1`.
- `χ_(p²)(a) = χ_p(a)²`, so `χ_(p²)³ = 1` on units: the quadratic symbol at `p²` detects no
  residues, as for the Jacobi symbol.
- `χ_1(0) = 1`: the empty product, also at `a = 0`.

*Needs:* §2.2; Tau Ceti `Ideal.powerResidueSymbolIdeal`, `Ideal.powerResidueSymbol_pow_div`,
`Ideal.mk_powerResidueSymbol`, `Ideal.powerResidueSymbol_mk_of_pow_eq_one`.

### 2.4 Finite families of fixed-numerator characters over `ℚ(ω)`

Fix `S` and a generator `π_𝔭` of each `𝔭 ∈ S`. Prove that, on primary good `A`, the functions
`A ↦ χ_A(u ∏_{𝔭 ∈ S} π_𝔭^(v_𝔭))` for units `u` and exponents `v_𝔭 ≥ 0` depend only on `u` and the
residues `v_𝔭 mod 6`, number at most `6^(|S|+1)`, and are ray class characters (through §2.1)
with one common modulus supported on `S` (`openai2026quasiRH` Lemma 4.1, second assertion, p. 11).
The family, the bound `6^(|S|+1)` and the common modulus are determined by `S` and the chosen
generators alone; a numerator divisible by a good prime, for instance a prime that varies with the
summation variable, lies outside the family.

*Needs:* §§2.1, 2.3.

### 2.5 Cubic reciprocity at composite moduli and its supplements

Prove that `(a/b)_3 = (b/a)_3` for coprime primary `a, b ∈ 𝓞` prime to `3`, the symbols being
`Ideal.powerResidueSymbolIdeal` at the ideals `(b)` and `(a)` with `n = 3`
(`dunnradziwill2024` (1.4); ClassicalArithmeticCompletion §1.72 at primes). Route: both sides are
multiplicative, so reduce to primary primes `π₁ ≠ π₂`; for different norms apply
`TauCeti.IsPrimaryEisenstein.cubic_reciprocity` to `−π₁`, `−π₂`, `−1` being a cube; for conjugate
primes of one split norm put `t = π + π̄ ∈ ℤ`, prime to `3`, so `π̄ ≡ t (mod π)` and `π ≡ −π̄ (mod t)`,
and `cubic_reciprocity_intCast` with Galois conjugation (`map_powerResidueSymbolIdeal`) shows that
`(π/t)_3` is real, hence `1`, and both symbols equal `1`.

Prove the supplements (`dunnradziwill2024` (1.5); ClassicalArithmeticCompletion §1.75): if
`d ≡ 1 + α₂λ² + α₃λ³ (mod 9)` with `α₂, α₃ ∈ {−1, 0, 1}`, then `(ω/d)_3 = ω^(α₂)` and
`(λ/d)_3 = ω^(−α₃)`; and, for primary `c` prime to `2`, `χ_c(4) = (2/c)_3 = (c/(−2))_3`, a function
of `c mod 2` (`openai2026quasiRH` proof of Lemma 4.4, p. 16).

**Checks.**

- `d = 1 + 3ω`: `d ≡ 1 − λ² + λ³ (mod 9)` (`λ² = −3`, `λ³ = −3 − 6ω`), so `(ω/d)_3 = ω^(−1) = ω²`,
  which is `ω^((7−1)/3)` by Euler's criterion.
- `c = 1 + 3ω`: `c ≡ 1 + ω = −ω² (mod 2)` and `(ω²/(2))_3 = ω^(2·(4−1)/3) = ω²`, so
  `χ_c(4) = ω²`; directly `2^((7−1)/3) = 4 ≡ ω² (mod c)`.
- Conjugate pair `π = −2 + 3ω`, `π̄` (norm `19`): `t = π + π̄ = −7` and `(π̄/π)_3 = (−7/π)_3 = 1`, the
  case that `TauCeti.IsPrimaryEisenstein.cubic_reciprocity`, stated for primes of different norms,
  does not cover.

*Needs:* §2.2; Tau Ceti `IsPrimaryEisenstein.cubic_reciprocity`,
`IsPrimaryEisenstein.cubic_reciprocity_intCast`, `map_powerResidueSymbolIdeal`;
ClassicalArithmeticCompletion §§1.72, 1.75.

### Examples

- `χ_p` at `p = 1 + 3ω`: values `1, ω, ω², −1, −ω, −ω²` at the residues `1, 2, 4, 6, 5, 3` of `𝔽₇`.
- The fixed-numerator character `𝔟 ↦ (2/𝔟)_3` of `F` is `𝔟 ↦ (c/(−2))_3` on primary generators
  `c`: a function of `c mod 2`, hence, through the primary normalization, a ray class character
  of modulus supported on `{(2), (λ)}`; its value at `(1 + 3ω)` is `ω²`.

### Dependencies

Mathlib Kummer theory and `IsArithFrobAt`; Tau Ceti power residue symbols, `IsPrimaryEisenstein`,
prime cubic reciprocity, ray class characters; ClassicalArithmeticCompletion §§1.12, 1.33, 1.34,
1.38, 1.72, 1.75; ClassFieldTheory Layer 11 and §13.1.

## Layer 3: smooth profiles, Mellin and Fourier kernels, and the lattice `ℤ[ω]`

### 3.1 Profiles with compact logarithmic support and their separation norms

Fix `d ≥ 1` and a compact `Ω ⊂ ℝ^d`. A *profile* is a function `w` on `(0, ∞)^d` whose logarithmic
form `w_log(u) = w(e^(u₁), …, e^(u_d))` is smooth with support in `Ω`. Define its seminorms
`p_j(w) = Σ_{|α| ≤ j} sup |∂^α w_log|`, its logarithmic Fourier transform
`ŵ(t) = ∫_{ℝ^d} w_log(u) e^(−i t·u) du`, and its *separation norm*
`‖w‖_{J,sep} = (2π)^(−d) ∫ |ŵ(t)| (1 + |t|)^J dt`; for a finite tuple `w = (w₁, …, w_r)` put
`p(w) = 1 + Σ p(w_i)` (`openai2026quasiRH` §4.3, p. 17).

- Monomial separation: `w(x₁, …, x_d) = (2π)^(−d) ∫ ŵ(t) ∏_j x_j^(i t_j) dt`, so a norm monomial in
  several variables is written as an integral of products of pure twists, with coefficient
  measure common to every row.
- A norm twist translates the transform: for `w'(x) = x^(iτ) w(x)` (`d = 1`), `ŵ'(t) = ŵ(t − τ)` and
  `‖w'‖_{J,sep} ≤ (1 + |τ|)^J ‖w‖_{J,sep}`.
- Rescaling, `w_k(x) = w(e^k x)` (`d = 1`), gives a profile for the translated set `Ω − k`
  (`(w_k)_log(u) = w_log(u + k)`), multiplies `ŵ` by the unit phase `e^(ikt)` and leaves `‖·‖_{J,sep}` and
  every `p_j` unchanged, so the constant `≪_{J,d,Ω}` of §3.2 is the same for `Ω` and `Ω − k`.

**Checks.**

- At `x = (1, …, 1)` monomial separation reads `w_log(0) = (2π)^(−d) ∫ ŵ`, Fourier inversion; a
  transform without the factor `(2π)^(−d)` is off by `(2π)^d`.
- The zero profile has every seminorm `0`, while `p(w) ≥ 1` for every tuple, so a bound
  `≪ p(w)^k` never collapses to `0`.
- The indicator of `[1, 2]` (`d = 1`) is not a profile: its transform decays only like `1/|t|`, and
  `‖·‖_{1,sep}` diverges.

*Needs:* Mathlib `VectorFourier.fourierIntegral`, `Real.fourier_eq`,
`MeasureTheory.Integrable.fourierInv_fourier_eq` (Fourier inversion for monomial separation).

### 3.2 Seminorm bounds: separation norms, a Sobolev sup bound, Mellin decay

Prove, for integers `J, N ≥ 0`: `‖w‖_{J,sep} ≪_{J,d,Ω} p_{J+d+2}(w)`; on a unit box `I ⊂ ℝ^d` and a
smooth `F` on `I + [−1, 1]^d`, `sup_I |F|² ≪_d Σ_{α ∈ {0,1}^d} ∫_{I+[−1,1]^d} |∂^α F|²`; the tail
bound `∫_{|t| > T₁} |ŵ(t)| (1 + |t|)^J dt ≤ (2π)^d T₁^(−N) ‖w‖_{J+N,sep}` for `T₁ ≥ 1` (the factor
`(2π)^d` undoes the normalization of `‖·‖_{J+N,sep}`; route: `(1 + |t|)^N ≥ T₁^N` on `|t| > T₁`); the pointwise Mellin
bound `|MW(σ + iT)| ≪_{I,N} (1 + |T|)^(−N) Σ_{j ≤ N} ∫₀^∞ y^σ |(y∂_y)^j W(y)| dy/y` uniformly for
`σ` in a compact `I` and `T ∈ ℝ`, whenever the integrals converge and the boundary terms of `N`
logarithmic integrations by parts vanish (annular `W`, or `W` smooth at `0` and Schwartz at `∞`
with `I ⊂ (0, ∞)`); and the joint bound: for measurable `a, b` on `ℝ`, integers `J, N ≥ 0` and `T ∈ ℝ`,
`∫∫_{ℝ²} e^(−(T+u)²) |a(u) b(w)| (1 + |T| + |u| + |w|)^J du dw ≪_{J,N} (1 + |T|)^(−N) sup_u (1 + |u|)^(J+N) |a(u)| · ∫_ℝ (1 + |w|)^J |b(w)| dw`
whenever the right side is finite (`openai2026quasiRH` Lemma 4.5 and (4.9)–(4.12), pp. 17–19).

*Needs:* §3.1; Mathlib `mellin`, integration by parts, the Fourier transform on `ℝ^d`.

### 3.3 The Gaussian Mellin weight

Define `W_G(y) = (2√π)⁻¹ exp(−(log y)²/4)` on `(0, ∞)` (`openai2026quasiRH` Lemma 4.6, p. 19).

- `MW_G(s) = e^(s²)` for every `s ∈ ℂ`.
- For a fixed smooth compactly supported `χ` with `Σ_{k ∈ ℤ} χ(u − k) = 1`, the pieces
  `w_k(x) = W_G(e^k x) χ(log x)` have one fixed compact logarithmic support and
  `Σ_k e^(A|k|) p_j(w_k) < ∞` for every `A ≥ 0` and `j ≥ 0`.
- For fixed `κ > 0`, `A, B, C₀ ≥ 0` and `M > 0`, the part of this decomposition with
  `|k| > κ log Z − C₀`, weighted by `Z^B e^(A|k|)`, is `O(Z^(−M))`.

**Checks.**

- `MW_G(0) = 1`: the total mass `(2√π)⁻¹ ∫ e^(−u²/4) du` is `1`; `MW_G(1) = e`.
- The variant `exp(−(log y)²)` has Mellin transform `√π e^(s²/4)`: the normalization is pinned by
  the value `1` at `s = 0` and the exponent `s²`.
- `W_G` is not annular (it is positive on all of `(0, ∞)`), which is why the decomposition is
  needed before §3.2 applies.

*Needs:* §§3.1–3.2; Mathlib `mellin`, `integral_gaussian`.

### 3.4 Decay of Fourier transforms and Mellin kernels in terms of `L¹` seminorms

Let `f` be a Schwartz function on `ℝ^d` and `s_j(f) = Σ_{|α|,|β| ≤ j} ‖x^α ∂^β f‖_{L¹}`. Prove
`sup (1 + |ξ|)^A |∂^β f̂(ξ)| ≪_{A,β,d} s_{⌈A⌉+|β|}(f)`, for every fixed nondegenerate linear Fourier
pairing and for radial transforms. For `m` holomorphic on a closed vertical strip with
`|m(σ + it)| ≤ C (1 + |t|)^h` and `K_W(x) = (2πi)⁻¹ ∫_{(σ)} MW(−s) m(s) x^(−s) ds`, prove
`|(x∂_x)^j K_W(x)| ≪ x^(−σ) ∫ |MW(−σ − it)| (1 + |t|)^(h+j) dt`, with an extra factor
`(1 + |w|)^(h+j)` for `W(y) y^(iw)` (`openai2026quasiRH` Lemma 4.7, p. 20).

**Checks.**

- `m ≡ 1` (`h = 0`), `j = 0`: after `s ↦ −s`, Mellin inversion gives `K_W(x) = W(1/x)`, and the bound
  is the inversion estimate `|W(1/x)| ≤ (2π)⁻¹ x^(−σ) ∫ |MW(−σ − it)| dt`; a kernel written with
  `MW(s)` in place of `MW(−s)` would be `W(x)`, with the reciprocal power of `x`.
- `m(s) = s` (`h = 1`): `x∂_x x^(−s) = −s x^(−s)` gives `K_W(x) = (y∂_y W)(1/x)`, and the bound carries
  the weight `(1 + |t|)^1`, the exponent `h + j` at `j = 0`.
- `d = 1`, `f(x) = e^(−πx²)`: with Mathlib's normalization `f̂ = f` and `s_0(f) = ‖f‖_{L¹} = 1`, so the
  case `A = 0`, `β = 0` is `sup |f̂| ≤ s_0(f)` with equality; the indicator of `[0, 1]` has `s_0 = 1`
  and `s_1 = ∞`, and `(1 + |ξ|)² |sin(πξ)/(πξ)|` is unbounded, so no bound by `s_0` alone holds at
  `A = 2`.

*Needs:* §§3.1–3.2; Mathlib `SchwartzMap`, `VectorFourier.fourierIntegral`, `Real.fourier_eq`,
`mellin`, `mellinInv_mellin_eq`.

### 3.5 The self-dual lattice `ℤ[ω]` and Poisson summation on cosets

Prove: `e(z) = exp(4πi Im z/√3)` for `z ∈ ℂ`; the dual of `𝓞` for the pairing `(x, y) ↦ e(xy)` is
`𝓞`, and `𝓞` has covolume `1` for `dμ = (2/√3) dx dy`. For a Schwartz `f` on `ℂ`, nonzero `b ∈ 𝓞`
and `v ∈ 𝓞`, `Σ_{x ∈ v + b𝓞} f(x) = q_b⁻¹ Σ_{y ∈ b⁻¹𝓞} f̂(y) e(vy)`, the specialization of
ThetaSeries Layer 1 (1A) to `L = b𝓞`, `L^∨ = b⁻¹𝓞`. The ideal count the later layers use is
consumed, not proved here: the number of nonzero ideals of `𝓞` of norm at most `H` is
`πH/(3√3) + O(√H + 1)` for `H ≥ 0` (`openai2026quasiRH` §4.1, p. 11). It is Tau Ceti's
`isBigO_rayClassIdealCountingFunction_sub` at the modulus `(1)` of `F`, whose ray class group is
the class group, of order one, with error `O(H^(1 − 1/2))`; its main term is the residue of `ζ_F`
at `1`, which Mathlib's `NumberField.Ideal.tendsto_norm_le_div_atTop` evaluates as
`2π h R/(w √3) = π/(3√3)` (`h = R = 1`, `w = 6`); for bounded `H` the count is bounded.

**Checks.**

- `e(1) = e(ω) = 1`, while `e(ω/2) = e^(πi) = −1`: `1/2 ∉ 𝓞^∨`.
- The parallelogram spanned by `1, ω` has area `√3/2`, and `(2/√3)(√3/2) = 1`.
- `H = 3`: the ideals `(1)` and `(λ)`, two against `π/√3 ≈ 1.81`; the constant `π/(3√3)` is the
  residue of `ζ_F` at `1` (`2π h/(w √3)` with `h = 1`, `w = 6`).

*Needs:* ThetaSeries Layer 1 (1A); Mathlib `ZLattice.covolume`, `SchwartzMap`, `Real.fourier_eq`;
for the ideal count, Tau Ceti `TauCeti.GlobalNumberFields.isBigO_rayClassIdealCountingFunction_sub`
and Mathlib `NumberField.Ideal.tendsto_norm_le_div_atTop`.

### Examples

- `MW_G(1/2 + it) = e^(1/4 − t² + it)`, of modulus `e^(1/4 − t²)`.
- Poisson at `b = 2`, `v = 1`: the coset `1 + 2𝓞` and the dual `(1/2)𝓞`, with factor `q_2⁻¹ = 1/4`.

### Dependencies

Mathlib `mellin`, `SchwartzMap`, `VectorFourier.fourierIntegral`, `Real.fourier_eq`,
`ZLattice.covolume`, `NumberField.Ideal.tendsto_norm_le_div_atTop`; Tau Ceti
`TauCeti.GlobalNumberFields.isBigO_rayClassIdealCountingFunction_sub`; ThetaSeries Layer 1.

## Layer 4: Gauss sums modulo ideals and the sextic reciprocity phase

### 4.1 Gauss sums modulo an ideal

Let `K ⊇ μ_n` with embedding `ι` and different `𝔡`. For a nonzero ideal `𝔠` prime to `n` and
`y ∈ 𝔠⁻¹𝔡⁻¹`, let `ψ_y(x) = exp(2πi Tr_{K/ℚ}(xy))` be the additive character of `𝓞/𝔠` of LFunctions
Layer 5's `gaussSum` (well defined on `𝓞/𝔠` for this `y`). For `j ∈ ℤ` define the Gauss sum
`g_j(𝔠, y) = gaussSum (ι ∘ ((·/𝔠)_n)^j) ψ_y`, the power of the multiplicative character
`Ideal.powerResidueSymbolIdeal 𝔠 n` being zero on nonunits (Mathlib's `MulChar` convention, also
for `j ≡ 0`). This is LFunctions Layer 5's Gauss sum with the residue character of a Hecke
character replaced by a power of the power residue symbol, which in general is no such residue
character: the residue character of a finite-order Hecke character of `F` is trivial on units, while
`x ↦ χ_p(x)³` at `p = 1 + 3ω` takes the value `χ_p(−1)³ = −1` at the unit `−1`. When
`((·/𝔠)_n)^j` is the residue character of a finite-order Hecke character of finite conductor `𝔠`,
`g_j(𝔠, y)` is that `gaussSum`. Over `ℤ[ω]` with `n = 6` and primary squarefree `c` prime to `6`,
`γ_j(c) = q_c^(−1/2) g_j((c), 1/(cλ))` is the normalized sum of Conventions, since
`ψ_(1/(cλ))(x) = e(x/c)` (`openai2026quasiRH` §4.1, p. 11).

- `g_j(𝔠, ay) = ι((a/𝔠)_n)^(−j) g_j(𝔠, y)` for `a` prime to `𝔠` (Mathlib `gaussSum_mulShift`, the law
  that LFunctions Layer 5 `gaussSum_mul` states for residue characters).
- `g_j(𝓞, y) = 1`: the residue ring has one element, a unit, where the character is `1`.
- At a prime `𝔭` with `y𝔭𝔡` prime to `𝔭` (so `ψ_y` is nontrivial, hence primitive on the field
  `𝓞/𝔭`): `|g_j(𝔭, y)| = √N𝔭` for `j ≢ 0 (mod n)` and `g_j(𝔭, y) = −1` for `j ≡ 0`.
- `conj g_j(𝔠, y) = ι((−1/𝔠)_n)^j g_(−j)(𝔠, y)`.

**Checks.**

- `K = ℚ`, `n = 2`, `𝔠 = (5)`, `y = 1/5`: `g_1 = √5`, the value of CharacterSumsOverFiniteFields
  §1.4 and of LFunctions Layer 5.
- `p = 1 + 3ω`: `γ_6(p) = −1/√7`, not of modulus one; reading `χ_p^6` as the constant `1` would give
  `Σ_x e(x/p) = 0` instead.
- `p = 1 + 3ω`: `γ_3(p)² = χ_p(−1) = −1`, so `γ_3(p) = ±i`; §4.4 pins `γ_3(p) = i`.

*Needs:* LFunctions Layer 5 (the additive character of `gaussSum` and its domain); Mathlib `gaussSum`,
`gaussSum_mulShift`; Tau Ceti `Ideal.powerResidueSymbolIdeal`, `TauCeti.norm_gaussSum` (the prime
case); CharacterSumsOverFiniteFields §1.4 (the Check at `(5)`).

### 4.2 Twisted multiplicativity

For coprime `a, b ∈ 𝓞_K` with `(a)`, `(b)` prime to `n`, `j ∈ ℤ` and `h ∈ 𝔡⁻¹`, prove
`g_j((ab), h/(ab)) = ι((b/a)_n^j (a/b)_n^j) g_j((a), h/a) g_j((b), h/b)`: write `x = bu + av` with
`u mod a`, `v mod b` (Chinese remainder theorem). Over `ℤ[ω]`:
`γ_j(ab) = (χ_a(b) χ_b(a))^j γ_j(a) γ_j(b)` (`openai2026quasiRH` proof of Lemma 4.4, p. 16).

**Checks.**

- `K = ℚ`, `n = 2`, `a = 3`, `b = 5`: `(3/5)(5/3) = 1` and `g(15) = g(3) g(5) = i√3 · √5 = i√15`.
- `j = 0`: Ramanujan sums, `g_0(p) g_0(q) = 1 = g_0(pq)` for distinct primes.
- `a = 1`: both sides are `g_j((b), h/b)`.

*Needs:* §4.1; the Chinese remainder theorem for coprime ideals of `𝓞_K`.

### 4.3 Gauss sums of the sextic symbol at a prime of `ℤ[ω]`

For a good primary prime `p`, with `H = χ_p` and `P = q_p`, prove `γ_2(p)³ = −α(p)`,
`γ_1(p) γ_2(p) = H̄(4) γ_3(p) γ_2(p)³` (`H̄(4)` the complex conjugate of `H(4)`) and `|γ_j(p)| = 1`
for `j ≢ 0 (mod 6)`
(`openai2026quasiRH` Lemma 4.2, p. 13). Route: the first is
`Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq` (`g³ = N π · π` for the
`IsPrimaryEisenstein` prime `π = −p` and any primitive additive character), normalized; the second
is the duplication formula `g(H) g(H⁴) = H(4)⁻¹ g(H²) g(H³)` (CharacterSumsOverFiniteFields §3.4 at
`χ = H`, `η = H³`, the residue characteristic of a good prime being odd) with `g(H²) g(H⁴) = P`
(`g(χ) g(χ⁻¹) = χ(−1) q` and `H²(−1) = 1`), which give `γ_1 = H(4)⁻¹ γ_2² γ_3`; the duplication
formula holds for every nontrivial additive character, both sides being multiplied by `H(a)` when
`ψ` is replaced by `x ↦ ψ(ax)`. The identity `g(χ) g(χ⁻¹) = χ(−1) q` is Mathlib's
`gaussSum_mul_gaussSum_eq_card` with `gaussSum_mulShift` at `a = −1`.

**Checks.**

- `p = 1 + 3ω`: `γ_2(p)³ = −(1 + 3ω)/√7`, and `7^(3/2) γ_2(p)³ = −7(1 + 3ω) = 7 · (−1 − 3ω)`, Tau
  Ceti's `N π · π` for `π = −1 − 3ω`.
- `γ_2(c)³` equals `g̃(c)³ = μ(c) c/|c|` of `dunnradziwill2024` (1.8): `γ_2(c) = χ_c(λ)² g̃(c)` and
  `χ_c(λ)^6 = 1`.
- `j = 6`: `|γ_6(p)| = 1/√7`, so the restriction `j ≢ 0` is needed.
- The conjugate is forced: at `p = 1 + 3ω`, `χ_p(4) = ω²` and `γ_3(p) = i`, and
  `γ_1(p) γ_2(p) = −α(p) · ω · i ≈ −0.6547 + 0.7559i`, while `−α(p) · ω² · i ≈ −0.3273 − 0.9449i`; at
  `p = −2 + 3ω` (norm `19`, where `2` is a non-residue) the same comparison separates `χ̄_p(4)` from
  `χ_p(2)`.

*Needs:* §4.1; Tau Ceti `Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq`;
CharacterSumsOverFiniteFields §3.4; Mathlib `gaussSum_mul_gaussSum_eq_card`, `gaussSum_mulShift`.

### 4.4 The quadratic Gauss sum `Γ(c)` of `ℤ[ω]` in closed form

For nonzero `c ∈ 𝓞` prime to `2` define `Γ(c) = |c|⁻¹ Σ_{x mod c} e(x²/c)`, and for nonzero `a, b`
prime to `2` the quotient `τ(a, b) = Γ(ab)/(Γ(a)Γ(b))`. Prove (`openai2026quasiRH` Lemma 4.3, p. 14):

- the reciprocity form `Γ(c) = ½ Σ_{y mod 2} e(−cy²/4)`, and explicitly
  `Γ(a + bω) = (1 + i^(−b) + i^a + i^(b−a))/2` for `a, b ∈ ℤ` with `a + bω` prime to `2`;
- `Γ(c)` depends only on `c mod 4`, `Γ(cv²) = Γ(c)` for `v` prime to `2`, and `|Γ(c)| = 1`;
- `(𝓞/4)ˣ ≅ 𝔽₄ˣ × (1 + 2𝓞)/(1 + 4𝓞)` has the squares `{1, ω, ω²}`, so `Γ` is a function on the
  square-class group `(𝓞/4)ˣ/{1, ω, ω²}`, of order `4`; on its representatives `1, −1, λ, −λ` it
  takes the values `1, 1, i, −i`;
- `τ` is a symmetric `{±1}`-valued bicharacter of the square-class group, with
  `τ((−1)^e λ^f, (−1)^g λ^h) = (−1)^(eh + fg + fh)`.

Route: Poisson summation on `𝓞` (§3.5) for the Gaussian-damped phase `e(z²/c) e^(−πε|z|²)` and
`ε → 0`.

**Checks.**

- `Γ(1) = 1`; `Γ(λ) = |λ|⁻¹ (1 + 2e(1/λ)) = (1 + 2ω)/√3 = i`, since the squares modulo `λ` are
  `0, 1, 1` and `e(1/λ) = exp(2πi Tr(1/λ²)) = exp(−4πi/3) = ω`, agreeing with the closed form
  `(1 + i^(−2) + i + i)/2 = i`; the slip `e(1/λ²)` would give `e(1/λ²) = 1` (`Tr(1/λ³) = 0`) and
  `Γ(λ) = √3`, not of modulus one.
- `τ(λ, λ) = Γ(−3)/Γ(λ)² = 1/(−1) = −1`; `τ(−1, λ) = Γ(−λ)/(Γ(−1)Γ(λ)) = −i/i = −1`; `τ(−1, −1) = 1`.
- `Γ(1 + 3ω) = (1 + i^(−3) + i + i²)/2 = i`, so `γ_3(1 + 3ω) = i` by §4.5.

*Needs:* §3.5; ThetaSeries Layer 1 (1A).

### 4.5 Sextic reciprocity for primary elements and the phases `R` and `G`

For primary `a, b` outside `S` define `R(a, b) = τ(a, b)` (on noncoprime pairs too, by the
bicharacter), and for primary `c` outside `S` define `G(c) = χ̄_c(4) Γ(c)`, with `χ̄_c(4)` the complex
conjugate of the multiplicative extension `χ_c(4)` for nonsquarefree `c`. Prove (`openai2026quasiRH` Lemma 4.4, (4.5)–(4.8),
pp. 15–16):

- sextic reciprocity: `χ_b(a) = R(a, b) χ_a(b)` for coprime primary `a, b` outside `S`;
- `|G| = 1`, `G` factors through the ray class group modulo `12`, `G(1) = 1` and
  `G(vw) = G(v) G(w) R(v, w)`; `G(v²) = χ_v(4)` (`χ̄_v(4)² = χ_v(4)`, its order dividing `3`); at good primes `R(p, p) = γ_3(p)² = χ_p(−1)`, and
  the diagonal `n ↦ R(n, n) = χ_n(−1)` is a ray class character;
- the Gauss sums at squarefree moduli: for squarefree primary `c` outside `S`,
  `γ_2(c)³ = μ(c) α(c)`, `γ_1(c) γ_2(c) = μ(c) α(c) G(c)`, `G(c) = χ̄_c(4) γ_3(c)`, `|G(c)| = 1`;
- the zero-preserving identity: writing `0 ≠ m = u ∏_{𝔭 ∈ S} π_𝔭^(v_𝔭) m_good` with `m_good` primary,
  `χ_A(m) = χ_A(u ∏ π_𝔭^(v_𝔭)) R(A, m_good) ∏_{p ∣ m_good} χ_p(A)^(v_p(m))` for every primary good `A`,
  both sides vanishing when `(A, m_good) ≠ 1`.

Route: `Γ(c) = γ_3(c)` for squarefree `c` by counting square roots in residue fields and the
Chinese remainder theorem; twisted multiplicativity (§4.2) at `j = 3` gives
`Γ(pq)/(Γ(p)Γ(q)) = (χ_p(q) χ_q(p))³`, so the quadratic part of sextic reciprocity is `τ`; cubic
reciprocity (§2.5) gives the cubic part; induction on the number of prime factors with §4.3.

**Checks.**

- `a = 1 + 3ω` (norm `7`), `b = −2 + 3ω` (norm `19`): `𝓞/b ≅ 𝔽₁₉` with `ω ↦ 7`, `a ≡ 3` and
  `χ_b(a) = 3³ = 8 ≡ −ω²`; `𝓞/a ≅ 𝔽₇` with `ω ↦ 2`, `b ≡ 4` and `χ_a(b) = ω²`; so
  `χ_b(a)/χ_a(b) = −1`. Both lie in the square class of `λ` modulo `4`, and `τ(λ, λ) = −1`.
- The cubic part agrees: `χ_b(a)² = ω = χ_a(b)²`; the quadratic part is `(−1)(1) = −1`.
- `p = 1 + 3ω`: `R(p, p) = γ_3(p)² = i² = −1 = χ_p(−1)`, and `G(p) = χ̄_p(4) Γ(p) = ω i`; at
  `p = 4 + 3ω` (norm `13`), `Γ(p) = γ_3(p) = 1` and `R(p, p) = 1 = χ_p(−1)`.

*Needs:* §§2.5, 4.2–4.4.

### 4.6 Finite Fourier expansions on ray class groups

For a finite abelian group `T` and `Φ : T → ℂ`, prove `Φ = Σ_{θ ∈ T̂} a_θ θ` with
`a_θ = |T|⁻¹ Σ_t Φ(t) θ̄(t)` and `Σ |a_θ| ≤ |T|^(1/2) max |Φ|`; on `T × T` this writes `R(a, b)` as
`Σ_{θ, θ' ∈ T̂} c_(θ,θ') θ(a) θ'(b)` with finitely many constants `c_(θ,θ')`; since
`R(a, b) = τ(a, b)` is read off the classes of `a` and `b` modulo `4` (§4.4) with no coprimality
condition, the expansion holds for every pair of primary `a, b`, also when they have a common
prime factor; and `χ_n(p) · conj(χ_p(n)) = R(p, n) 1_{(n,p)=1}` for a good prime `p` and primary
`n` outside `S` (`openai2026quasiRH` §4.2, p. 17): for coprime `n, p` it is the sextic reciprocity law
`χ_n(p) = R(p, n) χ_p(n)` of §4.5 multiplied by `conj(χ_p(n))`, of modulus one, and on the other pairs
both sides vanish.

**Checks.**

- `T = ℤ/2`, `Φ` the indicator of `0`: `a_θ = 1/2` for both characters and `Σ |a_θ| = 1 ≤ √2`.
- `Φ` a character `θ₀`: `a_θ = 1` at `θ₀` and `0` elsewhere.
- `n = p`: `χ_p(p) · conj(χ_p(p)) = 0` and `1_{(p,p)=1} = 0`, so the coprimality indicator cannot be
  dropped.
- `p = 1 + 3ω`, `n = −2 + 3ω` (the pair of §4.5): `χ_n(p) = −ω²` and `χ_p(n) = ω²`, so
  `χ_n(p) · conj(χ_p(n)) = (−ω²) ω = −1 = τ(λ, λ) = R(p, n)`; without the conjugate the left side
  is `(−ω²)(ω²) = −ω`, which is `R(p, n) χ_p(n)²`, a cubic symbol times `R`.

*Needs:* §§4.4–4.5; Tau Ceti `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` (column orthogonality, on
`T` and on `T × T`), with `TauCeti.LFunctions.sum_inv_smul_toUnitaryIdealWeight` when `T` is a ray class
group; Mathlib `AddChar.complexBasis` (the characters of a finite abelian group form a basis of its
complex functions, read on `Additive T`) for the existence of the expansion.

### Examples

- `γ_j(1 + 3ω)` for `j = 1, …, 5`: modulus `1`, with `γ_2³ = −(1 + 3ω)/√7`, `γ_3 = i` and
  `γ_1 γ_2 = −α(1 + 3ω) ω i`.
- The ray class group modulo `(12)` of `F`, which carries `G`, is `(𝓞/12)ˣ/𝓞ˣ` (class number
  one, the six units injecting modulo `3`), of order `|(𝓞/4)ˣ| · |(𝓞/λ²)ˣ|/6 = 12 · 6/6 = 12`.

### Dependencies

Mathlib `gaussSum`, `gaussSum_mulShift`, `gaussSum_mul_gaussSum_eq_card`, `AddChar.complexBasis`;
Tau Ceti `Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq`, `Ideal.powerResidueSymbolIdeal`,
`TauCeti.norm_gaussSum` and, for orthogonality, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`;
CharacterSumsOverFiniteFields §§1.4, 3.4; LFunctions Layer 5 (`gaussSum`); Layer 2 (§§2.3, 2.5);
Layer 3 (§3.5).

## Layer 5: analytic inputs for Hecke `L`-functions, and the transfer to Dirichlet `L`-functions

Throughout, `K` is a number field of degree `d`, `ψ` a primitive finite-order Hecke character of
`K` (`PrimitiveRayClassCharacter K`) of conductor norm `Q`, `L(s, ψ) = heckeLFunctionC ψ.character`,
and for the trivial character `ℒ(s) = (s − 1) ζ_K(s)/(s + 1)` with its removable value at `1` and
`Q = 1`; for nontrivial `ψ`, `ℒ = L(·, ψ)`.

### 5.1 Finite Euler products at the primes of a squarefree ideal

For a squarefree integral ideal `𝔯` and complex `a_𝔭` with `|a_𝔭| ≤ 1` (`𝔭 ∣ 𝔯`) put
`D_𝔯(s) = ∏_{𝔭 ∣ 𝔯} (1 − a_𝔭 N𝔭^(−s))`. Prove: for fixed `σ₀ > 0` and `ε > 0`,
`|D_𝔯(s)| + |D_𝔯(s)|⁻¹ ≪_{K,σ₀,ε} N𝔯^ε` on `Re s ≥ σ₀`; for every real `σ`,
`|D_𝔯(σ + it)| ≪_{K,ε} N𝔯^((−σ)₊ + ε)` uniformly in `t`; and `|D_𝔯'/D_𝔯(s)| ≪_{σ₀} log(2N𝔯)` on
`Re s ≥ σ₀`. Consequently, for `Z ≥ 1` and `B ≥ 0`, if `N𝔯 ≤ Z^B`, then `|D_𝔯(s)|` and `|D_𝔯(s)|⁻¹` are
`≪_{K,σ₀,B,ε} Z^ε` on `Re s ≥ σ₀` for every `ε > 0` (`openai2026quasiRH` Lemma 4.10, p. 23). With
`a_𝔭 = χ(𝔭)` this bounds Tau Ceti's `RayClassCharacter.eulerCorrection`.

**Checks.**

- `𝔯 = 𝓞`: the empty product, `D_𝓞 = 1`, so `|D| + |D|⁻¹ = 2 = 2 N𝔯^ε` and `D'/D = 0`.
- `K = ℚ`, `𝔯 = (2)`, `a_2 = 1`: `D(s) = 1 − 2^(−s)` vanishes at `s = 2πik/log 2` on `Re s = 0`, so the
  reciprocal bound needs `σ₀ > 0`; at `σ₀ = 1`, `|D(s)|⁻¹ ≤ (1 − 1/2)⁻¹ = 2`.
- `K = ℚ`, `𝔯 = (p)`, `a_p = 1`, `σ = −1`: `D(−1) = 1 − p`, of size `N𝔯^1 = N𝔯^((−σ)₊)`, so the exponent
  `(−σ)₊` of the second bound cannot be lowered.
- `B = 0` and `0 < Z < 1`: `N𝔯 ≤ 1` allows `𝔯 = 𝓞`, where `D = 1`, while `Z^ε → 0` as `Z → 0`; so the
  consequence needs `Z ≥ 1`, where `N𝔯^ε ≤ Z^(Bε)` turns the first bound into it (with `ε/B` for
  `ε` when `B > 0`).
- `K` of degree `d` in which `2` splits completely (such fields exist in every degree), `𝔯` the
  product of the `d` primes above `2`, `a_𝔭 = −1`: `D_𝔯(0) = 2^d = N𝔯` against `N𝔯^ε = 2^(dε)` in the
  second bound (`σ = 0`), and `D_𝔯(σ₀) = (1 + 2^(−σ₀))^d` against `2^(dε)` in the first, which grows with
  `d` once `2^ε < 1 + 2^(−σ₀)`; so both constants depend on `K`, while the logarithmic-derivative bound
  `Σ log N𝔭/(N𝔭^(σ₀) − 1) ≤ log N𝔯/(2^(σ₀) − 1)` does not.

*Needs:* the bound `ω(𝔯) ≪ log N𝔯/log log N𝔯` for the number of prime factors; Tau Ceti
`eulerCorrection_ne_zero`.

### 5.2 Strip growth uniform in the conductor

Prove `|ℒ(σ + it)| ≤ C_K (Q (3 + |t|)^d)^(3/5)` for `−1/10 ≤ σ ≤ 11/10` and all `t`, with
`C_K = 3 |d_K|^(3/5) ζ(11/10)^d` depending on `K` only (`openai2026quasiRH` Lemma 4.8, p. 21, for
`K = F`, where it is stated with the weaker factor `Q^(3/5) (3 + |t|)²`). This is Rademacher's convexity
bound, ExplicitZetaBounds §3.2 (`norm_continuedL_le_rademacher`), at `η = 1/10` and the record
`heckeData ψ` of LFunctions Layer 5: degree `d`, conductor `N = |d_K| Q`, real gamma shifts in
`{0, 1}`, complex gamma shifts `0`, and simple poles at `0` and `1` exactly when `ψ = 1`, the pole at
`0` then meeting the pole of the gamma factor at `0`; its *continuedL* is `heckeLFunctionC ψ.character`
(ZerosOfLFunctions §1.6). Route: the other conditions of finite-order type are the three predicates
of the record (LFunctions Layers 6 and 8: `heckeData ψ` agrees, off the coefficient at `0`, with the
record `grossencharacterData` of its Grossencharacter), finite order of its completion
(ZerosOfLFunctions §3.1), and the majorant `Σ_m |a_m| m^(−σ) ≤ ζ(σ)^d` for real `σ > 1`, which holds
because `|a_m|` is at most the number of ideals of norm `m` and, prime by prime,
`∏_{𝔭 ∣ p} (1 − p^(−f_𝔭 σ))⁻¹ ≤ (1 − p^(−σ))^(−d)`, from `(1 − x)^f ≤ 1 − x^f` for `0 < x < 1` and
`Σ_{𝔭 ∣ p} f_𝔭 ≤ d`. On the strip the exponent `(11/10 − σ)/2` lies in `[0, 3/5]`, and
`x = N (|1 + s|/(2π))^d ≤ N (3 + |t|)^d` because `|1 + s| ≤ 21/10 + |t|`; so
`x^((11/10 − σ)/2) ≤ max(1, x)^(3/5) ≤ (N (3 + |t|)^d)^(3/5)`. For `ψ ≠ 1` the pole factor `P(s)` of
§3.2 is `1`; for `ψ = 1` it is `3 |(1 + s)/(1 − s)|`, so `|(s − 1)/(s + 1)| P(s) = 3` for `s ≠ 1`, and the
bound passes to the removable value of `ℒ` at `s = 1` by continuity.

**Checks.**

- `K = ℚ`, `ψ = 1`: `ℒ(s) = (s − 1) ζ(s)/(s + 1)`, and on `σ = −1/10` the functional equation gives
  `|ζ(−1/10 + it)| ≍ |t|^(3/5)`, so the exponent `(3 + |t|)^(3d/5)` with `d = 1` is attained at that
  edge.
- `K = ℚ`, `ψ = 1`, `s = −1/10`: `|ℒ(−1/10)| = 0.5099`; §3.2 gives
  `3 (0.9/(2π))^(3/5) ζ(11/10) = 9.895`, with `ζ(11/10) = 10.5844`, and the stated bound is
  `C_ℚ 3^(3/5) = 3 · 10.5844 · 1.9332 = 61.385`. Without the clearing factor the bound for `ζ` alone
  would carry the unbounded `|(1 + s)/(1 − s)|` near `s = 1`.
- `K = F` (`d = 2`): the edge bound `Q^(3/5) (3 + |t|)^(6/5)` is the bound on `Re s = −1/10` proved in
  the proof of `openai2026quasiRH` Lemma 4.8, p. 21, and the statement improves the strip factor
  `(3 + |t|)²` of its (4.14) to `(3 + |t|)^(6/5)`.
- At `σ = 11/10` the bound `(Q (3 + |t|)^d)^(3/5) ≥ 1` is weak but true, `|ℒ| ≤ ζ_K(11/10)` being
  uniform in `Q`; at `s = 1` for `ψ = 1` the removable value `Res_{s=1} ζ_K/2` is finite, so the
  clearing factor `(s − 1)` is needed.

*Needs:* ExplicitZetaBounds §3.2 (Rademacher's convexity bound); LFunctions Layers 5, 6 and 8
(`heckeData` and its three predicates); ZerosOfLFunctions §§1.6, 3.1 (*continuedL* of the Hecke
records and finite order of their completions).

### 5.3 Bounds for `ℒ`, `1/ℒ` and `ℒ'/ℒ` in a zero-free disc

Fix `a ∈ [1/2, 1]` and `0 < ε < 10⁻³`. If `ℒ` has no zero in the open disc of radius `2 − a − 2ε`
about `2 + it`, prove that on the closed disc of radius `2 − a − 6ε` about the same centre,
`|ℒ(s)| + |ℒ(s)|⁻¹ ≪_{K,ε,ε₁} (2Q(3 + |t|)^d)^(ε₁)` for every `ε₁ > 0`, and that on the disc of radius
`2 − a − 8ε`, `|ℒ'/ℒ(s)| ≪_{K,ε} log(2Q(3 + |t|))`. Consequently both bounds hold throughout
`Re s ≥ b + ν`, with `t = Im s`, whenever `ν > 0` and `b` is at least the zero abscissa of the
primitive finite-order Hecke family of `K`, the constants then depending on `ν` and `ε₁` too. For the
trivial character `|1/ζ_K(s)| ≤ |ℒ(s)|⁻¹` on `Re s ≥ 0`, since `|(s − 1)/(s + 1)| ≤ 1` there, so the bound
for `|ℒ|⁻¹` bounds `1/ζ_K` (`openai2026quasiRH` Lemma 4.9, p. 22, for `K = F`). Route: a holomorphic
logarithm `g` of `ℒ` on the zero-free disc, normalized
by the Euler logarithm at the centre; `Re g ≪ log C` from §5.2 and the Euler product right of
`11/10`; Borel–Carathéodory between two radii; Hadamard's three-circles inequality against the
disc of radius `49/100`, where the Euler logarithm is bounded; `exp(C (log C)^θ) ≪_ε C^ε` for
`θ < 1`; Cauchy's estimate for `g'`.

*Needs:* §5.2; Mathlib `Complex.borelCaratheodory`,
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`; AnalyticNumberTheoryPartIII
§8.2; Layer 1 (§1.2) for the abscissa.

### 5.4 Norm-composed characters and the base-change factorization

Let `K` be abelian over `ℚ` (`[IsAbelianGalois ℚ K]`) and `χ` a Dirichlet character modulo `q`.
Let `f_K` be the least `f ≥ 1` with `K ⊆ ℚ(ζ_f)` (one exists by
`TauCeti.ClassFieldTheory.kroneckerWeber`) and `H_K ⊆ (ℤ/f_K)ˣ` the subgroup of the `a` whose
automorphism `ζ ↦ ζ^a` of `ℚ(ζ_(f_K))` fixes `K`. Define the *character group* `X(K)` as the set of the
primitive characters `χ'*` inducing the Dirichlet characters `χ'` modulo `f_K` that are trivial on
`H_K`, the characters of the abelian Dedekind product of AnalyticNumberTheoryPartI §2.42 at `f = f_K`.

- `χ' ↦ χ'*` is injective, and through `(ℤ/f_K)ˣ/H_K ≅ Gal(K/ℚ)` it identifies `X(K)` with the
  character group of `Gal(K/ℚ)`; with the primitive character inducing `ψψ'` as product, `X(K)` is a
  group of order `[K : ℚ]`. Every `f` with `K ⊆ ℚ(ζ_f)` is a multiple of `f_K`, and the characters
  modulo `f` trivial on the subgroup fixing `K` have the same primitive characters.
- The primes dividing `f_K` are exactly the primes ramified in `K`; for a prime `p` unramified in `K`
  and `ψ ∈ X(K)`, `ψ(p)` is the value at the Frobenius of `p` of the character of `Gal(K/ℚ)` attached
  to `ψ`, a root of unity (`milnecft2020` Chapter V, Example 3.2, p. 157, Remark 3.8, p. 158, and
  Example 3.10, p. 159).

Define the *norm-composed character* `χ ∘ N_{K/ℚ}`: the ray class character of `K` modulo
`q𝓞_K` times all real places of `K` whose value on an ideal `𝔞` prime to `q` is `χ(N𝔞)`.

- At a prime `𝔭 ∤ q` of residue degree `f` over `p`, the value is `χ(p)^f`.
- `χ₁ ∘ N · χ₂ ∘ N = (χ₁χ₂) ∘ N`, and `1 ∘ N` is the trivial character of that modulus.
- For `K` totally complex the modulus has no infinite part, `N_{K/ℚ}` being positive on `K^×`.

**Checks.**

- `K = F`, `χ` the character modulo `7` of order `3` with `χ(3) = ω`: at the split prime
  `(1 + 3ω)` of norm `7` the value is `χ(7) = 0` (excluded, `7 ∣ q`); at the inert prime `(2)` of norm `4`
  it is `χ(2)² = χ(4)`.
- `K = ℚ(i)`, `χ` modulo `5` with `χ(2) = i`: at the prime `(1 + i)` of norm `2` the value is
  `χ(2) = i`, and at the inert prime `(3)` of norm `9` it is `χ(3)² = χ(9) = χ(4) = −1`.
- `K = ℚ`: `f_ℚ = 1` and `X(ℚ) = {1}`, so the factorization below reads `L^S(s, χ) = L^S(s, χ)`.
  `K = F`: `f_F = 3`, `H_F` is trivial and `X(F) = {1, χ₋₃}`, the set used in §10.7.
- `K = ℚ(√5)`: `f_K = 5`, `H_K = {±1}` and `X(K) = {1, (·/5)}`; at the inert prime `2`, `(2/5) = −1` is
  the value at the nontrivial Frobenius. With `f = 10` instead, the characters modulo `10` trivial on
  `{1, 9}` are the principal one and the one induced by `(·/5)`, with the same primitive characters;
  the principal character modulo `10` itself vanishes at the unramified prime `2`, which is why `X(K)`
  consists of primitive characters.
- `K = ℚ(√2)` (real), `χ` the odd character modulo `3`: `α = 1 + 3√2 ≡ 1 (mod 3)` has
  `N_{K/ℚ}(α) = 1 − 18 = −17`, and `χ(N(α𝓞_K)) = χ(17) = χ(2) = −1 ≠ 1`, so `χ ∘ N` is not trivial on
  the principal ray modulo `3𝓞_K` without the real places, and the real places are needed in the
  modulus. A unit such as `1 + √2`, of norm `−1`, tests nothing: its ideal is `𝓞_K`, of norm `1`, and
  it is not `≡ 1` modulo any `q > 1`.

Prove the base-change factorization: with `S` the primes dividing `q d_K`,
`L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)` on `Re s > 1`, as germs at every point, and pointwise
away from `s = 1`, the superscript deleting the Euler factors at `S` on both sides. Route: on
`Re s > 1`, away from `S`, this is the induction identity of AnalyticNumberTheoryPartI §2.18a for
`K/ℚ` and the restriction `σ` of `χ` (read through global reciprocity) to `Gal(ℚ̄/K)`, with
`Ind σ = ⊕_{ψ ∈ X(K)} χψ` and the one-dimensional comparison, under which `σ` gives `χ ∘ N`; or
directly, at an unramified `p` with residue degree `f` and `g = [K : ℚ]/f` primes above it, `ψ(p)`
runs over the `f`-th roots of unity, each `g` times, so
`∏_ψ (1 − χ(p)ψ(p) p^(−s)) = (1 − χ(p)^f p^(−fs))^g`; then
uniqueness of meromorphic continuation (`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`)
(`openai2026quasiRH` (11.2), p. 85, for `K = F`: `L^S_F(s, χ ∘ N) = L^S(s, χ) L^S(s, χχ₋₃)`).

*Needs:* ClassFieldTheory Layer 11 and §13.1 (`TauCeti.ClassFieldTheory.kroneckerWeber`, the conductor
of `K`); AnalyticNumberTheoryPartI §2.42 (the characters of an abelian field) and, for the first
route, §2.18a (induction at every finite place, with the one-dimensional comparison); the splitting of
unramified primes in cyclotomic fields (LFunctions Layer 4, cyclotomic factorization with level
characters); Tau Ceti `TauCeti.GlobalNumberFields.RayClassCharacter`, `heckeLFunctionC`; Mathlib
`DirichletCharacter.LFunction`.

### 5.5 The transfer of zero-free half-planes

Let `K` be abelian over `ℚ` (`[IsAbelianGalois ℚ K]`) and `σ₀ ≥ 0`. Suppose `heckeLFunctionC ψ.character`
is zero-free right of `σ₀` for every `ψ : PrimitiveRayClassCharacter K`. Prove: (a) `heckeLFunctionC χ`
is zero-free right of `σ₀` for every modulus `𝔪` and every `χ : RayClassCharacter 𝔪`; (b) for every
`N ≥ 1` and every `χ : DirichletCharacter ℂ N`, `DirichletCharacter.LFunction χ` is zero-free right of
`σ₀` (`zeroFreeRightOf_LFunction_of_isAbelianGalois`; `openai2026quasiRH` Proposition 11.3, p. 84, for
`K = F`). Route: (a) is §1.1. For (b), pass to the
primitive character (`DirichletCharacter.LFunction_changeLevel`; the deleted factors vanish only
on `Re s = 0`); at a point `ρ ≠ 1` with `Re ρ > σ₀` every factor of §5.4 is holomorphic, so a zero of
`L(s, χ)` is a zero of `L^S_K(s, χ ∘ N)`, excluded by (a); at `ρ = 1`, `L(1, χ) ≠ 0` for `χ ≠ 1`
(`DirichletCharacter.LFunction_apply_one_ne_zero`) and the trivial character has its pole. For a
non-abelian `K` the cofactor is an Artin `L`-function whose holomorphy is not known, which is why
`K` is abelian.

**Checks.**

- `q = 1`, `K = F`: `ζ_F(s) = ζ(s) L(s, χ₋₃)`; the pole of `ζ` at `1` is not cancelled because
  `L(1, χ₋₃) = π/(3√3) ≠ 0` (the class number formula with `h = 1`, `w = 6`, `|d| = 3`); only
  `L(1, χ) ≠ 0` enters the proof.
- `χ = χ₋₃`, `K = F`: the cofactor `χχ₋₃` is the principal character modulo `3`, with a pole at `1`;
  a zero of `L(s, χ₋₃)` at `1` would be cancelled, and `L(1, χ₋₃) ≠ 0` excludes it.
- `σ₀ = 1`: the conclusion is Mathlib's `DirichletCharacter.LFunction_ne_zero_of_one_le_re` read
  through §1.1, and the hypothesis holds for every primitive `ψ`, the trivial one included, by the
  Euler product on `Re s > 1`, where `heckeLFunctionC` is the series once LFunctions Layer 5 gives the
  continuation, so the content of the statement lies in `σ₀ < 1`.
- The bound `σ₀ ≥ 0` is what the route uses: the principal character modulo `4` has
  `L(s, χ₀) = ζ(s)(1 − 2^(−s))`, whose deleted factor vanishes at `s = 2πik/log 2` on `Re s = 0`,
  outside `Re s > σ₀`. For `σ₀ < 1/2` the hypothesis fails (`ζ_K = ζ · ∏_{ψ ≠ 1} L(s, ψ)` has the
  zero `1/2 + 14.1347…i` of `ζ`), so the statement has content only for `1/2 ≤ σ₀ < 1`.

*Needs:* §§1.1, 5.4; Mathlib `DirichletCharacter.LFunction_changeLevel`,
`DirichletCharacter.LFunction_apply_one_ne_zero`.

### Examples

- For `F` the norm-composed characters of the Dirichlet characters modulo `q` are ray class
  characters modulo `q𝓞`, and the transfer gives every Dirichlet `L`-function from the Hecke family
  of `F` alone.
- §5.2 at `K = F`, `d = 2`: `|L(σ + it, ψ)| ≪ Q^(3/5) (3 + |t|)^(6/5)` on `−1/10 ≤ σ ≤ 11/10`.

### Dependencies

ExplicitZetaBounds §3.2; ZerosOfLFunctions §§1.6, 3.1; LFunctions Layers 4–6 and 8; ClassFieldTheory
§13.1; AnalyticNumberTheoryPartI §§2.18a, 2.42; AnalyticNumberTheoryPartIII §8.2; Mathlib
Borel–Carathéodory and three-lines; Tau Ceti Hecke `L`-functions and Euler corrections; Layer 1.

## Layer 6: large sieves over number fields

### 6.1 The additive large sieve on a torus

Let `Λ ⊂ ℝ^d` be a full-rank lattice, `B` a nondegenerate real bilinear pairing with dual lattice
`Λ^∨ = {y : B(Λ, y) ⊆ ℤ}`, `0 < δ ≤ 1`, `Q ≥ 1`, and `z₁, …, z_J ∈ ℝ^d/Λ` with
`min_{n ∈ Λ} |z_j − z_k − n| ≥ δ` for `j ≠ k`. Prove, for complex `a_j`,
`Σ_{m ∈ Λ^∨, |m| ≤ Q} |Σ_j a_j e^(2πi B(z_j, m))|² ≪_{Λ,B,d} (Q^d + δ^(−d)) Σ_j |a_j|²`, the dual
lattice pairing in the second slot, so that each phase is a function of `z_j ∈ ℝ^d/Λ`; a fixed multiple
of `Q` changes only the constant (`openai2026quasiRH` Lemma 6.1, p. 47, for `ℂ/𝓞` with `e(xy)`, where
`q_m ≤ Q` is `|m| ≤ √Q`; `baierbansal2018` §3, Theorem 3, for `Λ = ℤ^d` with the dot product, in a form
that counts close pairs of points instead of assuming separation, used there at `d = 2` for `ℤ[i]`).
Route: a nonnegative Schwartz majorant `F ≥ 1` on the unit ball whose Fourier transform is supported in
a fixed ball (the square of the transform of a smooth bump of small support), Poisson summation
(ThetaSeries Layer 1), and the count of `δ`-separated lifts in a ball.

**Checks.**

- `J = 1`, `a₁ = 1`: the left side is the number of dual points in the ball, `≍ Q^d`, so the term
  `Q^d` is needed.
- `d = 1`, `Λ = ℤ`, `z_j = j/N` (`δ = 1/N`), `a_j = 1`, `Q < N`: only `m = 0` survives and the left
  side is `N² = N · N`, so the term `δ^(−d)` is needed.
- `J = 0`: both sides are `0`.
- The slot of `B` matters when `B` is not symmetric: for `d = 2`, `Λ = ℤ²` and
  `B(x, y) = x₁y₁ + x₁y₂/2 + x₂y₂`, the point `m = (1/2, 1)` has `B(e₁, m) = B(e₂, m) = 1`, so
  `m ∈ Λ^∨`, while `B(m, e₂) = 1/4 + 1 = 5/4`: the phase `e^(2πi B(m, z))` would be multiplied by
  `e^(5πi/2) = i` under `z ↦ z + e₂`, and is not a function on the torus; `e^(2πi B(z, m))` is.

*Needs:* ThetaSeries Layer 1 (1A); Mathlib `SchwartzMap`, `Real.fourier_eq`.

### 6.2 Hecke families and the quadratic large sieve over a number field

Let `k` be a number field containing `μ_n`, `𝔠` an integral ideal and `I(𝔠)` the monoid of integral
ideals prime to `𝔠`. An *`n`-th order Hecke family with respect to `𝔠`* attaches to every squarefree
`𝔞 ∈ I(𝔠)` a primitive Hecke character `χ_𝔞` of `k`, with `χ_𝔞^n = 1` and trivial infinite type,
subject to two axioms. The *reciprocity law*: for some finite group `G`, monoid homomorphism
`𝔞 ↦ [𝔞]` from `I(𝔠)` to `G` and function `C` on `G × G` with values in `μ_n`, the identity
`χ_𝔞(𝔟) = C([𝔞], [𝔟]) χ_𝔟(𝔞)` holds at every coprime pair of squarefree `𝔞, 𝔟 ∈ I(𝔠)`. The
*primitivity axiom*: at every such pair with `[𝔞] = [𝔟]`, the primitive character inducing
`χ_𝔞 χ̄_𝔟` has conductor `𝔞𝔟` (`goldmakherlouvel2013` Definition 1, pp. 1–2, read with the conjugate
that its verification in §2, p. 5, computes; `bgl2014` Lemma 2.3, p. 7). For `n = 2` the values are
real and `χ̄_𝔟 = χ_𝔟`; for `n ≥ 3` the conjugate is needed (§6.3, Checks).

- For `d ∣ n` with `d > 1`, the primitive characters inducing the `χ_𝔞^(n/d)` have trivial infinite
  type and order dividing `d`, and they satisfy the reciprocity law with `C^(n/d)` at every coprime
  pair `𝔞, 𝔟` with `𝔟` prime to the conductor of `χ_𝔞` and `𝔞` prime to that of `χ_𝔟`. They form a
  `d`-th order Hecke family when they also satisfy the reciprocity law at the other coprime pairs
  and the primitivity axiom; these are hypotheses, not consequences: the primitivity axiom fails
  when every `χ_𝔞` has order dividing `n/d` (`goldmakherlouvel2013` Remark 3, p. 2, states the
  passage to powers without them).
- Over `ℤ[ω]`, the quadratic residue symbols `𝔞 ↦ χ_a(·)³` read at primary generators, extended to
  their primitive inducing characters (conductor `a` or `λa`), form a quadratic Hecke family with
  `G` the square classes modulo `4` and `C = R` of §4.5 (`openai2026quasiRH` §5.4, p. 36).

**Checks.**

- `k = ℚ`, `n = 2`, `𝔠 = (4)`: `χ_a = (a/·)` for odd squarefree `a > 0`, with `G = (ℤ/4)ˣ` and `C`
  the sign `(−1)^((a−1)(b−1)/4)`; for `a = 3`, `b = 7` (one class) `χ₃χ₇ = (21/·)` is primitive
  modulo `21` (and equals `χ₃χ̄₇`, the values being real), while for `a = 3`, `b = 5` (two classes)
  `(15/·)` has conductor `60`, which is why primitivity is required only within a class.
- The trivial family `χ_𝔞 = 1` fails the primitivity axiom at `𝔞 ≠ 𝔟` in one class.
- Over `ℤ[ω]`, `χ_p³` for `p = 1 + 3ω` has `χ_p(−1)³ = −1`, so its primitive inducing character is odd
  at `λ` and the conductor is `λp`, not `p`.
- A quadratic Hecke family over `ℚ(i)` (for instance the Fisher–Friedberg family of
  `goldmakherlouvel2013` §2 with `n = 2`) is also a fourth-order family, its orders dividing `4`
  and `C` taking values in `μ_2 ⊂ μ_4`; its squares are induced by the trivial character, so they
  fail the primitivity axiom.
  With `λ_𝔟 = 1` and `M = N` the squares `χ_𝔟(𝔞)²` are `1` whenever `𝔞` is prime to the conductor of
  `χ_𝔟`, the double sum of the corollary below is `≫ N³`, and its right side is `≍ N^(2+ε)`: the
  corollary needs the primitivity of the powers.

Prove the quadratic large sieve: for a quadratic Hecke family with respect to `𝔠`, `ε > 0`, `M, N ≥ 1`
and complex `λ_𝔟`, `Σ*_{N𝔞 ≤ M} |Σ*_{N𝔟 ≤ N} λ_𝔟 χ_𝔟(𝔞)|² ≪_{k,𝔠,ε} (MN)^ε (M + N) Σ*_{N𝔟 ≤ N} |λ_𝔟|²`,
`Σ*` over squarefree ideals prime to `𝔠`; and, for an `n`-th order family with `n ≥ 4` even whose
`n/2`-th powers (through their primitive inducing characters) form a quadratic Hecke family with
respect to `𝔠`, the same bound for `χ_𝔟^(n/2)` (`goldmakherlouvel2013` Theorem 1.1 and Corollary 1.2,
p. 2; the corollary there omits the hypothesis on the powers, which `bgl2014` p. 11 verifies for the
Fisher–Friedberg characters through its Lemmas 2.1 and 2.3). Over `ℤ[ω]`:
`Σ_{a sf, q_a ≤ U} |Σ_{b sf, q_b ≤ V} c_b χ_a(b)³|² ≪_ε (UV)^ε (U + V) Σ |c_b|²` on squarefree primary
good indices (`openai2026quasiRH` (5.26)). At `k = ℚ` this is implied by AnalyticNumberTheoryPartII
§5.29.

*Needs:* Layers 2 and 4 (the reciprocity law of the family); LFunctions Layer 5 (the functional
equation with root numbers, for the Poisson–Voronoi step of `goldmakherlouvel2013` §3); Layer 3
(§3.5) and ThetaSeries Layer 1.

### 6.3 The Fisher–Friedberg characters

Let `K ⊇ μ_n` with `n ≥ 3`. Fix a finite set `S` of finite places containing those above `n` with
`𝓞_S` of class number one, an ideal `𝔠 = ∏_{𝔭 ∈ S} 𝔭^(e_𝔭)` with `e_𝔭` large enough that
`ord_𝔭(a − 1) ≥ e_𝔭` makes `a` an `n`-th power in `K_𝔭`, a set `ℰ` of ideals prime to `S`
representing `R_𝔠 = H_𝔠 ⊗ ℤ/n` built from chosen generators with chosen `m_E ∈ K^×` generating `E` as
`𝓞_S`-ideals, `m_(1) = 1`. For coprime ideals `𝔞, 𝔟` prime to `S` write `𝔞 = (x) E 𝔤^n` with
`x ≡ 1 (mod 𝔠)`, `E ∈ ℰ`, `(𝔤, 𝔟) = 1`, and define `χ_𝔞(𝔟) = (x m_E/𝔟)_n`; from then on `χ_𝔞` denotes
the primitive character that induces it (`bgl2014` Appendix II, p. 20, and §2; `goldmakherlouvel2013` §2).

- `χ_𝔞` is well defined, a primitive `n`-th order Hecke character of trivial infinite type, and
  `χ_𝔞 = (a/·)_n` on ideals prime to `𝔠𝔞` when `𝔞 = (a)` with `a ≡ 1 (mod 𝔠)`.
- `χ_𝔞 χ_𝔟 = χ_𝔞𝔟` if `𝔞𝔟` is `n`-th power free, and `χ_(𝔞𝔟^n) = χ_𝔞`; for `𝔞 = 𝔞₁𝔞₂^n` with `𝔞₁`
  `n`-th power free the conductor lies between `𝔞₀` and `𝔠𝔞₀`, `𝔞₀` the squarefree kernel of `𝔞₁`;
  `χ_𝔞(𝔟) χ_𝔟(𝔞)⁻¹` depends only on `[𝔞], [𝔟] ∈ R_𝔠` (`bgl2014` Lemma 2.1, p. 6).
- For squarefree `𝔞`, every prime of `𝔞` divides the conductor, so `χ_𝔞(𝔟) = 0` when `𝔟` meets `𝔞`.
- The `χ_𝔞` at squarefree `𝔞` prime to `S` form an `n`-th order Hecke family with respect to `𝔠`
  (§6.2), with `G = R_𝔠` and `[·]` the projection of `I(𝔠)` onto it: the reciprocity law is the last
  clause of the second bullet, and the primitivity axiom, for `χ_𝔞 χ̄_𝔟` with `[𝔞] = [𝔟]`, is `bgl2014`
  Lemma 2.3 at `j = 1` (p. 7; `goldmakherlouvel2013` §2, pp. 4–5).

**Checks.**

- `K = F`, `n = 3`, `S = {(λ)}`, `𝔠 = (9) = (λ)⁴`: cubing maps the units `≡ 1 (mod λ²)` of `F_λ` onto
  those `≡ 1 (mod λ⁴)`, so `e_λ = 4` suffices. For `𝔞 = (10)` (`10 ≡ 1 (mod 9)`, squarefree, prime to
  `λ`) and `𝔟 = (1 + 3ω)`: `χ_(10)(𝔟) = (10/𝔟)_3 ≡ 10² ≡ 2 ≡ ω (mod 𝔟)`, so the value is `ω`.
- `𝔞 = 𝔟^n` gives the trivial character: the primitive character inducing `(x m_E/·)_n` on such
  a power is `1`.
- A choice of a different set `ℰ` changes `χ_𝔞` by a character depending only on `[𝔞]`; the large
  sieve of §6.4 is insensitive to this.
- The conjugate in the primitivity axiom: `K = F`, `n = 3`, `S = {(λ)}`, `𝔠 = (9)`, `𝔞 = (−2)` and
  `𝔟 = (7)` are squarefree, coprime and prime to `λ`, and `−2 ≡ 7 (mod 9)` puts them in one class of
  `R_𝔠`, so `(−2) = (x_a) E 𝔤_a³` and `(7) = (x_b) E 𝔤_b³` with one `E` and `x_a ≡ x_b ≡ 1 (mod 9)`.
  The character `χ_𝔞 χ̄_𝔟` is the cubic symbol of `x_a/x_b ≡ 1 (mod 9)`, a cube in `F_λ`, so it is
  unramified at `λ` and has conductor `(2)(7) = (14) = 𝔞𝔟`. The product `χ_𝔞 χ_𝔟` is the cubic
  symbol of `x_a x_b m_E² = 14 w λ^(2k) h³` with `w` a unit, `(m_E) = E λ^k` and `h` prime to `λ`. A
  Kummer extension `F_λ(∛y)/F_λ` is unramified only when `3 ∣ v_λ(y)` and
  `y λ^(−v_λ(y)) ≡ ±1 (mod λ³)`, and the cube of a unit of `F_λ` is `≡ ±1 (mod λ³)`; so `χ_𝔞 χ_𝔟` is
  unramified at `λ` only if `14 ≡ ζ (mod λ³)` for one of the six units `ζ`. But `14 ≡ 5 (mod λ³)`, and
  `v_λ(5 + 1) = v_λ(6) = 2`, `v_λ(5 + ω) = v_λ(5 + ω²) = 1`, while `5 − 1`, `5 − ω`, `5 − ω²` are units.
  So `λ` divides the conductor of `χ_𝔞 χ_𝔟`, and the axiom stated with `χ_𝔞 χ_𝔟` fails for this family.

*Needs:* §§2.1, 6.2.

### 6.4 The large sieve for `n`-th order characters

For `n ≥ 3`, the Fisher–Friedberg characters of §6.3, `M, N ≥ 1/2`, complex `λ_𝔟` and `ε > 0`, prove
`Σ*_{N𝔞 ≤ M} |Σ*_{N𝔟 ≤ N} λ_𝔟 χ_𝔞(𝔟)|² ≪_{n,K,S,𝔠,ε} (MN)^ε (M + N + (MN)^(2/3)) Σ*_{N𝔟 ≤ N} |λ_𝔟|²`,
`Σ*` over squarefree ideals prime to `S` (`bgl2014` Theorem 1.3, p. 4). Route: the norm recursion
of `bgl2014` §3 (Lemmas 3.1–3.5), with the Poisson–Voronoi formula `bgl2014` Lemma 2.2 for
`χ_𝔟₁^j χ̄_𝔟₂^j` (Lemma 2.3: primitive of conductor `𝔟₁𝔟₂` in a common class), and, for even `n`, the
corollary of §6.2 for the powers `χ^(n/2)`. Its hypothesis holds here: the primitive characters
inducing the `χ_𝔞^(n/2)` satisfy the reciprocity law with `C^(n/2)` at every coprime pair of
squarefree ideals prime to `S`, since each conductor lies between the index and `𝔠` times it
(`bgl2014` Lemma 2.1), and the primitivity axiom, by `bgl2014` Lemma 2.3 at `j = n/2`, where
`χ̄^(n/2) = χ^(n/2)` because the values are `0` and `±1` (`bgl2014` p. 11 applies the corollary in
this way).

*Needs:* §§6.2–6.3; LFunctions Layer 5 (functional equation and root numbers of primitive finite-order
characters); Layer 3 (§§3.2, 3.5).

### 6.5 Residue-symbol forms over `ℤ[ω]`: the cubic and sextic large sieves

Prove, for complex `c_n` on squarefree primary indices and `ε > 0`:

- the cubic large sieve `Σ*_{q_m ≤ M} |Σ*_{q_n ≤ N} c_n (n/m)_3|² ≪_ε (M + N + (MN)^(2/3)) (MN)^ε Σ* |c_n|²`,
  `Σ*` over squarefree elements of `ℤ[ω]` congruent to `1 (mod 3)` (`heathbrown2000` Theorem 2, p. 3);
- the sextic large sieve `Σ_{k sf, q_k ≤ K} |Σ_{n sf, q_n ≤ D} c_n χ_n(k)^s|² ≪_{S,ε} (KD)^ε (K + D + (KD)^(2/3)) Σ |c_n|²`
  for `s ∈ {−1, 1}`, `k`, `n` squarefree primary good, coefficients independent of `k`, with every
  symbol keeping its zero values; fixed restrictions of the row set, and of the coefficient support by
  extension by zero, are allowed (`openai2026quasiRH` Lemma 9.1, p. 61; `gaozhao2024` Lemma 2.9).

Route: split the rows into the finitely many classes of `R_𝔠` and of the `S`-units modulo `n`-th
powers; within a class the residue symbol with the row as numerator is the Fisher–Friedberg
character times a fixed character of the column (§2.4), absorbed into `c_n`; cubic reciprocity (§2.5)
or sextic reciprocity (§4.5) moves the row to the numerator; then §6.4 with `n = 3` or `n = 6`.

**Checks.**

- `M = N = 1`: one row and one column (`m = n = 1`), symbol `1`, both sides `|c₁|²` up to the constant.
- `(n/m)_3` with `m = n` is `0`: squarefree rows and columns meet only through such zeros, which
  the zero convention keeps.
- The term `(MN)^(2/3)` dominates `M + N` exactly when `M^(1/2) < N < M²`; at `M = N` the bound is
  `N^(4/3+ε)` against the conjectured `N^(1+ε)`.

*Needs:* §§2.4, 2.5, 4.5, 6.4.

### Examples

- §6.1 on `ℂ/𝓞`: the distinct fractions `d/s` with `(d, s) = 1`, `q_s ≤ r₊Y`, satisfy
  `|d/s − d'/s' − n| ≥ 1/|ss'| ≥ 1/(r₊Y)` for `n ∈ 𝓞`, so they are `min(1, 1/r₊)/Y`-separated for `Y ≥ 1`
  (`openai2026quasiRH` Lemma 6.2 and its proof, pp. 48–49); with `δ⁻² ≤ max(1, r₊²) Y²` and coefficient
  mass `O(Y⁻¹)` their sum over `q_m ≤ Q` is `≪ (Q + Y²)/Y`. For `r₊ = 13`, `Y = 1`, `s = 1 + 3ω`,
  `s' = 4 + 3ω` the distance can be `1/√91 ≈ 0.105`, below `min(1, r₊)/Y = 1`, so the reciprocal is
  needed.
- §6.2 and §6.5 concern different powers of the sextic symbol: `χ_n(k)³` is the quadratic symbol,
  for which §6.2 over `ℤ[ω]` gives the factor `K + D`, while §6.5 treats `χ_n(k)^(±1)` with the extra
  term `(KD)^(2/3)` (at `K = D`, `D^(1+ε)` against `D^(4/3+ε)`); neither statement implies the other.
  The route to §6.5 passes through §6.2: §6.4 at `n = 6` treats the cubes `χ^3` by the corollary of
  §6.2.

### Dependencies

Layers 2–4; LFunctions Layer 5; ThetaSeries Layer 1; AnalyticNumberTheoryPartII §5.29 (the case
`k = ℚ`, not a supplier of the general statement).

## Layer 7: zero detection for finite-order Hecke `L`-functions

Throughout, `K` is a number field of degree `d`; a *presentation* `ψ` is a ray class character of a
modulus of `K` with its zero extension, `ψ*` its primitive inducing character, and
`L^orig(s, ψ) = L(s, ψ*) ∏_{𝔭 ∈ E_ψ} (1 − ψ*(𝔭) N𝔭^(−s))` its presented `L`-function
(`heckeLFunctionC`), `E_ψ` the primes of the defining modulus not dividing the conductor.

### 7.1 Detecting polynomials

For a presentation `ψ`, a base `U > 1`, log-lengths `r, m ≥ 0` and profiles `W` (annular, possibly
with a norm twist `x^(iv)`), define the *plain polynomial* `S_m = U^(−m/2) Σ_𝔫 ψ(𝔫) W(N𝔫/U^m)` and the
*inverse polynomial* `M_r = U^(−r/2) Σ_𝔫 μ(𝔫) ψ(𝔫) W(N𝔫/U^r)`, sums over nonzero integral ideals with
the zero extension of `ψ` kept (`openai2026quasiRH` (4.1)–(4.2), p. 12).

- For `c > 1`: `M_r = (2πi)⁻¹ ∫_{(c)} MW(s) U^(r(s − 1/2)) L^orig(s, ψ)⁻¹ ds` and
  `S_m = (2πi)⁻¹ ∫_{(c)} MW(s) U^(m(s − 1/2)) L^orig(s, ψ) ds`.
- `|M_r|, |S_m| ≪_W U^(r/2), U^(m/2)` by the ideal count (Tau Ceti
  `isBigO_rayClassIdealCountingFunction_sub`, summed over the ray classes of the trivial modulus).
- A norm twist `x^(iv)` in `W` moves the `L`-argument: with `W_v(y) = W(y) y^(iv)`,
  `MW_v(s) = MW(s + iv)` (Conventions), and the substitution `s ↦ s − iv` shows that, against
  `MW(s)`, `M_r` sees `L^orig(s − iv, ψ)⁻¹` (and `U^(r(s − iv − 1/2))`).

**Checks.**

- `r = 0` and `W` supported in `(1/2, 2)`: only `𝔫 = 𝓞` contributes and `M_0 = W(1)`.
- `K = ℚ`, `ψ` trivial: `M_r` is the smoothed Möbius sum `U^(−r/2) Σ μ(n) W(n/U^r)`.
- A presentation at a modulus with an extra prime `𝔭` vanishes at `𝔭`, so its `M_r` differs from
  the primitive one by the terms divisible by `𝔭`; the definition uses the presentation.
- `K = ℚ`, `ψ` trivial, `W_v(y) = W(y) y^(iv)`: `Σ μ(n) n^(iv) n^(−s) = ζ(s − iv)⁻¹`, so the twisted
  Möbius sum sees `ζ(s − iv)⁻¹` against `MW(s)`; the sign `s + iv` would put the pole of `ζ` at
  `s = 1 − iv` instead of `1 + iv`.

*Needs:* §3.1; Tau Ceti `heckeLFunctionC`; Mathlib `mellin`, `mellinInv_mellin_eq`.

### 7.2 A zero-free rectangle with margin, chosen by pigeonhole

Fix a floor `a₀ ∈ (1/2, 1)` (`openai2026quasiRH` Lemma 8.1 takes `a₀ = 51/100`), `0 < ε < 10⁻³`, `I = ⌈1/ε⌉ + 2` and
`2 ≤ T₁ ≤ U^(1/100)`. Let `𝒳` be a family of nonprincipal presentations of bounded size whose primitive
conductors and products `∏_{𝔭 ∈ E_ψ} 𝔭` have norm `≪ U`. Put
`M_j = max({a₀} ∪ {Re ρ : ψ ∈ 𝒳, L(ρ, ψ*) = 0, Re ρ ≥ a₀, |Im ρ| ≤ 3jT₁})`. Prove: there are
`i ∈ {1, …, I − 1}` and `a ∈ (a₀ + εℤ_{≥0}) ∩ [a₀, 1]` with `a ≤ M_i < a + ε` and `M_{i+1} < a + 2ε`
(such a pair `(i, a)` is a *bin* of parameter `ε`); if `a > a₀`, some `ψ ∈ 𝒳` has a zero `ρ` with
`a ≤ Re ρ < a + ε`, `|Im ρ| ≤ 3iT₁`; for every `ε₁ > 0`, uniformly in the family,
`|L^orig(s, ψ)| + |L^orig(s, ψ)|⁻¹ ≪_{K,ε,ε₁} U^(ε₁)` on `Re s ≥ a + 6ε`, `|Im s| ≤ (3i + 2)T₁`; on the
reflected line `|L^orig(1 − a − 6ε + it, ψ)| ≪_{K,ε,ε₁} U^(a − 1/2 + 12ε + ε₁) (3 + T₁)^C` for
`|t| ≤ (3i + 2)T₁`, `C` depending on `K`; and there are `O_ε(1)` pairs `(i, a)` (`openai2026quasiRH`
Lemma 8.1, p. 56, for `K = F` and the family `𝒳_u` of §10.4). Route: pigeonhole on the nondecreasing
`M_j`; §5.3 on the zero-free discs of radius `2 − a − 2ε`; §5.1 for the deleted factors; the functional
equation (LFunctions Layer 5) and §5.2 on the reflected line.

**Checks.**

- No zero of the family with `Re ρ ≥ a₀` and `|Im ρ| ≤ 3IT₁`: every `M_j = a₀`, the pigeonhole returns
  `i = 1`, `a = a₀` (`a₀ ≤ M_1 < a₀ + ε`, `M_2 = a₀ < a₀ + 2ε`) and there is no witness, which is why the
  witness clause assumes `a > a₀`.
- `M_j` constant in `j` (all relevant zeros at height at most `3T₁`): the bin is `i = 1` with
  `a ≤ M_1 < a + ε` and `M_2 = M_1 < a + 2ε`, whatever the value of `M_1`.
- The count `I = ⌈1/ε⌉ + 2` suffices: if every `i ≤ I − 1` failed, each failure gives
  `M_(i+1) ≥ a_i + 2ε > M_i + ε`, so `M_I > a₀ + (I − 1)ε ≥ a₀ + 1 + ε > 1`, while `M_j < 1` because a
  nonprincipal primitive Hecke `L`-function has no zero on `Re s > 1` (Euler product) nor on `Re s = 1`
  (LFunctions Layer 7, which is stated for nontrivial primitive characters, as the members of `𝒳` are).

*Needs:* §§5.1–5.3; LFunctions Layers 5 and 7; Layer 1 (§1.2).

### 7.3 Upper bounds for the detecting polynomials in a zero-free rectangle

In the setting of §7.2 with a bin `(i, a)` of parameter `ε` and `δ = 2a − 1`, fix `r_max ≥ 1` and the
ranges `0 ≤ r, m ≤ r_max`, profiles with uniformly bounded seminorms on a fixed annulus and norm twists
of height at most `(3i + 1)T₁`. Prove: for every `ε' > 0` there are `ε₀ > 0`, depending only on `ε'`
and `r_max`, and an exponent `A ≥ 0` such that, when the bin parameter satisfies `ε ≤ ε₀` and the
height factor satisfies `(1 + T₁)^A ≤ U^(ε'/10)`, `|M_r|² ≪ U^(δr + ε')` and
`|S_m|² ≪ U^(δ min(m, 1 − m) + ε')` for `ψ ∈ 𝒳`; `A` does not depend on the decay order `N` of the
tail bound of §3.2 applied above a fixed fraction of `T₁`, so `N` may be fixed after `T₁`
(`openai2026quasiRH` Lemma 8.2, p. 57). Route: §7.1's Mellin formulas, shifted on the portion of
height at most a fraction of `T₁` to `Re s = a + 6ε` inside the zero-free rectangle, the tails left on
`Re s = 2` and bounded by §3.2 ((4.10)–(4.11)); for `S_m` the better of the direct shift and the
functional equation. The bounds of §7.2, squared, give `|M_r|² ≪ U^(δr + 12εr + 2ε₁)` on the shifted
line and `|S_m|² ≪ U^(δ(1 − m) + (24 − 12m)ε + 2ε₁) (3 + T₁)^(2C)` on the reflected one, so the bin
parameter must be small in terms of the loss: `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8` and `A ≥ 2C` give
exponents at most `δr + ε'/2` and `δ(1 − m) + 3ε'/4`, and a height factor at most `9^C U^(ε'/10)`.

*Needs:* §§7.1–7.2; §3.2.

### 7.4 Lower bounds for the detecting polynomials forced by a zero

In the setting of §7.3 with `a > a₀`, prove: for every `t ∈ [1, 3/2]` and `ε' > 0`, when the bin
parameter `ε` and the loss of §7.3 are small enough in terms of `ε'`, there are `ψ ∈ 𝒳`, a zero `ρ` as
in §7.2, dyadic lengths `U^r`, `U^m` and polynomials `M_r`, `S_m` of the same presentation `ψ` and the
same twist height (`|v| ≤ cT₁`), with uniformly smooth annular profiles, such that
`r ≤ t + O(1/log U)`, `r + m ≥ t − O(1/log U)`, `t − 1/2 − O(ε') ≤ r`, `0 ≤ m ≤ 1/2 + O(ε')`,
`|M_r S_m|² ≫ U^(δ(r+m) − ε')`, `|M_r|² ≫ U^(δr − ε')` and `|S_m|² ≫ U^(δm − ε')`; the `O(ε')`
constants depend only on the floor `a₀` (they are `O(1/(2a₀ − 1))`, absolute at
`a₀ = 51/100`) and the dyadic pair is one of `O((log U)²)` (`openai2026quasiRH` Proposition 8.3,
p. 59; `liu2026improved` Proposition 5.1). Route: the truncated inverse
`C_ψ(s) = Σ μ(𝔩) ψ(𝔩) V(N𝔩/U^t) N𝔩^(−s)` inserted in `(2πi)⁻¹ ∫_{(2)} Y^z Γ(z) L^orig(ρ + z, ψ) C_ψ(ρ + z) dz`
with `Y` a fixed power of `U`; the residue at `z = 0` vanishes at the zero; the shifted line is small
by §§5.1–5.2; the coefficients of `L C_ψ` cancel up to length `U^t` except at `𝓞`; dyadic splitting
gives the product lower bound, and comparison with the two bounds of §7.3 gives `2δ(m − 1/2)₊ ≪ ε'`,
hence `m ≤ 1/2 + O(ε'/δ)` with `δ > 2a₀ − 1`, and the individual lower bounds (`maynardpratt2024`
Appendix C; `guthmaynard2026` §13.1).

*Needs:* §§7.1–7.3; §§5.1–5.2; Mathlib `Complex.Gamma`.

### Examples

- With `t = 1` and `δ = 2a − 1 > 1/50` (the floor `51/100`), the witness `M_r` has `r ≥ 1/2 − O(ε')`
  and `|M_r|² ≫ U^(δ/2 − O(ε'))`, since `δr − ε' ≥ δ/2 − (C'δ + 1)ε'` when `r ≥ 1/2 − C'ε'`: a power
  saving below the trivial size `U^r`.
- The comparison `2δ(m − 1/2)₊ ≤ C''ε'` of §7.4 gives `m − 1/2 ≤ C''ε'/(2δ)`: at the floor `51/100`,
  `δ > 1/50` and `m − 1/2 < 25C''ε'`; at the floor `a₀ = 1/2 + 10⁻⁶`, `δ` may be as small as about
  `2 · 10⁻⁶` and the bound is only `2.5 · 10⁵ C''ε'`, so the constants depend on the floor.
- At the floor `a = a₀` the bin carries no witness, and its rows are counted by the trivial bound.

### Dependencies

Layer 5 (§§5.1–5.3); Layer 3 (§3.2); Layer 1 (§1.2); LFunctions Layers 5 and 7.

## Layer 8: Kubota's character, Eisenstein series on `ℍ³` and theta functions

### 8.1 The Kubota character

Let `K` be a totally imaginary number field containing `μ_n` and `N` a positive integer divisible by
`n²`. For `σ = (a b; c d)` in the principal congruence subgroup `Γ(N) = {σ ∈ GL₂(𝓞_K) : σ ≡ 1 (mod N)}`
define `κ(σ) = (c/d)_n` if `c ≠ 0` and `κ(σ) = 1` if `c = 0`. Prove that `κ` is the `(r(N)/n)`-th
power of Kubota's homomorphism `σ ↦ [b/a]` of KTheoryLowDegrees §10.2 at the power-residue Mennicke
symbol `[b/a] = (b/a)_{r(N)}` of its §11.2 at level `N𝓞_K`, `r(N)` being the exponent of its §11.1,
hence a homomorphism `Γ(N) → μ_n` (`kubota1969` §3, Propositions 1–2, pp. 24–25), and that on
`Γ(N) ∩ SL₂(𝓞_K)` it is also `κ(σ) = (c/a)_n⁻¹` for `c ≠ 0`. Route: `n ∣ r(N)`, because for
`p^e ∥ n` and every prime `P` above `p` the hypothesis `n² ∣ N` gives
`ord_P(N)/ord_P(p) − 1/(p − 1) ≥ 2e − 1 ≥ e`, and `p^e` divides `|μ(K)|`;
`(x/𝔞)_n = (x/𝔞)_{r(N)}^(r(N)/n)` for `𝔞` prime to `r(N)`; and with `u = ad − bc`, a unit
`≡ 1 (mod N)`, the Mennicke relations of KTheoryLowDegrees §10.1 give
`[b/a][c/a] = [bc/a] = [(a − u)/a] = [(a − u)/u] = 1` (numerator multiplicativity, `bc ≡ a − u`
modulo `aN`, subtracting the second entry from the first, and a unit first entry) and
`[c/d][c/a] = [c/(u + bc)] = [c/u] = 1` (denominator multiplicativity at `ad = u + bc`, then
subtracting `b` times the second entry from the first), so `[c/d] = [b/a] = [c/a]⁻¹`; at `c = 0`, `a`
is a unit and `[b/a] = 1`.

For `K = F` and `n = 3` the cubic theta function uses Patterson's character `κ_P`, a different
object: on `Γ₁(3) = {γ ∈ SL₂(𝓞) : γ ≡ I (mod 3)}`, of level `3`, which `n² = 9` does not divide,
`κ_P(γ) = (c/a)_3` (`c ≠ 0`), `κ_P(γ) = 1` (`c = 0`), equal to `(b/d)_3` there, is a homomorphism, and it
extends to `Γ₂ = SL₂(ℤ) Γ₁(3)` by `κ_P = 1` on `SL₂(ℤ)`; `[SL₂(𝓞) : Γ₂] = 27` (`patterson1977` §2 and
(1.1), pp. 125–128; `dunnradziwill2024` (5.2)–(5.5)). On `Γ(9) ∩ SL₂(𝓞) ⊂ Γ₁(3)` the second
statement above gives `κ_P = κ⁻¹ = κ̄` for the Kubota character `κ` of `F`, `n = 3`, `N = 9`: `κ_P` is the
complex conjugate of the restriction of `κ`, and its properties on `Γ₂` are Patterson's statements,
not instances of Kubota's.

- `κ` is trivial on the upper triangular elements of `Γ(N)` and is not trivial on `Γ(N)`.
- `κ` takes every value of `μ_n` on `Γ(N)` (`kubota1969` proof of Proposition 4).
- `κ_P` is trivial on the upper triangular elements of `Γ₂`; for `g, g' ∈ SL₂(𝓞)`, `g ≡ g' (mod 3)`
  implies `Γ₂ g = Γ₂ g'` (`dunnradziwill2024` (5.3)).

**Checks.**

- `γ = (1 + 3ω, −3ω²; 3, 1 − 3ω) ∈ Γ₁(3)`: `(c/a)_3 = (3/(1 + 3ω))_3 ≡ 3² = 9 ≡ 2 ≡ ω` in `𝔽₇`, and
  `(b/d)_3 = (−3ω²/(1 − 3ω))_3` in `𝔽₁₃` (`ω ↦ 9`) is `4⁴ ≡ 9 ≡ ω`; both give `κ_P(γ) = ω`, while
  `(c/d)_3 = 3⁴ ≡ 3 ≡ ω²` in `𝔽₁₃`, the inverse.
- `γ = (10, b; 9 + 27ω, d) ∈ Γ(9) ∩ SL₂(𝓞)` with `10d − (9 + 27ω) b = 1` and `9 ∣ b` (so `d ≡ 1 (mod 9)` and
  `d ≡ 5` modulo `1 + 3ω`): `κ_P(γ) = (c/a)_3 = ((1 + 3ω)/10)_3 = (10/(1 + 3ω))_3 = 3² ≡ ω` in `𝔽₇`
  (`(9/10)_3 = 1` for rational integers, then cubic reciprocity), while
  `κ(γ) = (c/d)_3 = ((1 + 3ω)/d)_3 = (d/(1 + 3ω))_3 = 5² ≡ ω²` (`c = λ⁴(1 + 3ω)` and `(λ/d)_3 = 1` by the
  supplement of §2.5 at `d ≡ 1 (mod 9)`); reading
  `κ_P` as the case `n = 3` of `κ` gives the conjugate character. With `b = −486 − 459ω` and
  `d = 802 − 486ω` the first-row symbol is `(b/10)_3 = (b/2)_3 (b/5)_3 = ω · ω = ω²` (`b ≡ ω (mod 2)`;
  `b ≡ 4 + ω (mod 5)` and `(4 + ω)⁸ ≡ ω` in `𝓞/5`), equal to `κ(γ)`, as `r(9) = 3 = n`; the inverse
  `(c/d)_3⁻¹ = ω` is `κ_P(γ)`, not `κ(γ)`.
- `κ_P((1 0; 3 1)) = (3/1)_3 = 1`: the symbol at the unit ideal is `1`.
- `κ_P(T) = 1` for `T = (1 1; 0 1)`, and `κ_P((0 −1; 1 0)) = 1` since it lies in `SL₂(ℤ)`; a definition
  by `(c/a)_3` on all of `Γ₂` would be undefined there (`a = 0`).

*Needs:* §2.3; §2.5 (cubic reciprocity, for `κ_P = (b/d)_3` on `Γ₁(3)`); Tau Ceti
`Ideal.powerResidueSymbolIdeal`, `Ideal.powerResidueSymbolIdeal_mul_right`; KTheoryLowDegrees §10.1
(the Mennicke relations), §10.2 (Kubota's homomorphism), §11.1 (the exponent `r(I)`) and §11.2 (the
power-residue Mennicke symbol).

### 8.2 Automorphic functions on `ℍ³` with a unitary character

Let `Γ ⊂ SL₂(ℂ)` be a discrete group of finite type (cofinite, with every boundary point of a
fundamental domain a cusp) and `χ` a unitary character of `Γ`. A cusp `c` is *essential* for `χ`
when `χ` is trivial on its stabilizer `Γ_c`. Define the automorphic functions of `(Γ, χ)`: smooth
`f` on `ℍ³` with `f(γw) = χ(γ) f(w)` (`kubota1968` §§2–3, pp. 262–264).

- At an essential cusp with `σ_c ∞ = c` and translation lattice of `σ_c⁻¹ Γ_c σ_c` of covolume one, a
  `Δ₃`-eigenfunction `f` with eigenvalue `s(2 − s)` and moderate growth has the expansion
  `f(σ_c w) = α v^s + β v^(2−s) + Σ_{μ ≠ 0} a(μ) v K_{s−1}(4π|μ|v) ě(μz)` over the dual lattice (`α v + β v log v`
  at `s = 1`); at a nonessential cusp the constant term vanishes.
- The growing solutions `v I_{±(s−1)}` are excluded by moderate growth; the coefficients are bounded
  polynomially in `|μ|`.

**Checks.**

- `Γ = SL₂(𝓞)`, `χ = 1`: every cusp is essential, and the constant function has `α = 1`, `s = 0`.
- `Γ₂` with `κ_P`: `∞` is essential (`κ_P = 1` on the upper triangular elements of `Γ₂`).
- `Δ₃ (v K_{1/3}(4π|μ|v) ě(μz)) = (8/9) · (v K_{1/3}(4π|μ|v) ě(μz))`: order `s − 1 = 1/3` gives
  `s(2 − s) = 8/9`; the order `1/3` with eigenvalue `1 − 1/9` is the theta eigenvalue of §8.5.
- `Γ = PSL₂(ℤ[i])`, `χ = 1`, the cusp `∞`: the translation lattice is `ℤ[i]`, of covolume one, and its
  dual `{μ : Tr(μb) ∈ ℤ for all b ∈ ℤ[i]}` is `(1/2)ℤ[i]`; at `μ = n/2` with `n ∈ ℤ[i]`,
  `ě(μz) = exp(4πi Re(nz/2)) = e(Re(nz))` and `4π|μ| = 2π|n|`, and `K_{s−1} = K_{ir}` at `s = 1 + ir`, so
  the expansion is MaassForms §7.3's `y K_{ir}(2π|n|y) e(Re(n x))`; taking the dual lattice to be `ℤ[i]`
  would keep only the even frequencies `n ∈ 2ℤ[i]`.

*Needs:* BianchiModularForms §§0.3–0.4; MaassForms §7.1; AutomorphicFormsOnReductiveGroups §4.5.

### 8.3 Eisenstein series at essential cusps

For `(Γ, χ)` as in §8.2 and an essential cusp `κ_i` with `σ_i`, define
`E_i(w, s, χ) = Σ_{σ ∈ Γ_i \ Γ} χ̄(σ) v(σ_i⁻¹ σ w)^s` (`kubota1968` (8), (18), pp. 263, 266; `patterson1977` (3.1),
p. 129).

- It converges absolutely and locally uniformly for `Re s > 2`, is holomorphic in `s` there,
  satisfies `E_i(γw, s, χ) = χ(γ) E_i(w, s, χ)` and `Δ₃ E_i = s(2 − s) E_i`.
- For essential cusps `κ_i`, `κ_j` and `γ ∈ σ_i⁻¹ Γ σ_j` with bottom row `(c, d)` put
  `χ_ij(c, d) = χ(σ_i γ σ_j⁻¹)`; it depends only on
  `(c, d)`, and is unchanged by `d ↦ d + cℓ` for `ℓ` in the translation lattice `Λ_j` of `σ_j⁻¹ Γ_j σ_j`
  and by `(c, d) ↦ u(c, d)` for `u` in the finite group `U_i` of the `u ∈ ℂ^×` with some
  `(u x; 0 u⁻¹) ∈ σ_i⁻¹ Γ_i σ_i`, because `χ` is trivial on `Γ_i` and `Γ_j` (`U_i ∋ −1` when `−1 ∈ Γ`).
  At an essential cusp `κ_j` the constant term of `E_i(σ_j w, s, χ)` is `δ_ij v^s + φ_ij(s, χ) v^(2−s)`, with
  `φ_ij(s, χ) = (π/(s − 1)) |U_i|⁻¹ Σ_{(c,d)} χ̄_ij(c, d) |c|^(−2s)`, the sum over the bottom rows `(c, d)`
  with `c ≠ 0` of the elements of `σ_i⁻¹ Γ σ_j`, `d` taken modulo `c Λ_j`; its nonconstant coefficients
  are `|U_i|⁻¹ Σ_{(c,d)} χ̄_ij(c, d) ě(μd/c) |c|^(−2s)`, over the same rows, times `v K_{s−1}(4π|μ|v)` and an
  explicit gamma factor (`kubota1968` (12), (16)–(17), (22)–(25), pp. 264–267, where the cusp stabilizers
  are `±` a lattice, `U_i = {±1}` and `|U_i|⁻¹ = 1/2`; `kubota1969` (36)–(42), pp. 43–47).

**Checks.**

- `Γ = SL₂(ℤ[i])`, `χ = 1`, `Re s > 2`: the series is `Σ v^s/(|cz + d|² + |c|²v²)^s` over coprime
  pairs up to the four units, since `diag(i, −i)` fixes `∞`.
- At a nonessential cusp the series would be ill defined: a stabilizer element with `χ ≠ 1`
  changes a term by a nontrivial root of unity.
- `Γ = SL₂(ℤ[i])`, `χ = 1`, one cusp, `Λ = ℤ[i]` of covolume one, `U = {±1, ±i}`: there are
  `#(ℤ[i]/c)^×` classes `d mod c` prime to `c`, and `Σ_{c ≠ 0} #(ℤ[i]/c)^× N(c)^(−s) = 4 ζ_K(s − 1)/ζ_K(s)`
  with `K = ℚ(i)`, so
  `φ(s) = (π/(s − 1)) ζ_K(s − 1)/ζ_K(s)` and `φ(1) = π ζ_K(0)/Res_{s=1} ζ_K = π(−1/4)/(π/4) = −1`, of modulus
  one as §8.4 requires; Kubota's factor `1/2`, which counts rows only up to `±1`, would give `−2`.

*Needs:* §8.2.

### 8.4 Continuation and functional equations

For `(Γ, χ)` as in §8.2 with `h` essential cusps, prove: each `E_i(w, s, χ)` continues to a meromorphic
function of `s ∈ ℂ`; with `ℰ = (E_1, …, E_h)` and `Φ(s, χ) = (φ_ij(s, χ))`, `ℰ` and `Φ` are holomorphic on
`Re s ≥ 1` except for finitely many simple poles in `(1, 2]`, the point `2` being a pole exactly when
`χ` is trivial (residue a constant), `Φ(1 + it, χ)` is unitary, `Φ(s, χ) Φ(2 − s, χ) = I` and
`ℰ(w, s, χ) = Φ(s, χ) ℰ(w, 2 − s, χ)`; the residue of `ℰ` at a pole in `(1, 2]` is square integrable on
`Γ \ ℍ³` and a `Δ₃`-eigenfunction with eigenvalue `s(2 − s)` (`kubota1968` §3, p. 265, and §4, (28)–(29), p. 268;
`patterson1977` §3, (3.9)–(3.11), pp. 130–131; `kubota1968` p. 265 writes the open interval `1 < s < 2`,
and the pole at `s = 2` for trivial `χ` is the one of §8.3's example, where `ζ_K(s − 1)` has its pole).
Route: the Maass–Selberg relations for truncated Eisenstein series (`patterson1977` (3.9)–(3.10)) and
analytic Fredholm continuation of the resolvent of the Laplacian on `L²(Γ \ ℍ³, χ)`
(AutomorphicSpectralTheory §§0.15–0.16), as in Selberg's method.
For trivial `χ` on a congruence subgroup of `SL₂(𝓞_K)` the statement is the classical form of the
continuation of AutomorphicSpectralTheory §1.15a for `SL₂` over `K` and its Borel subgroup; for a
Kubota character, whose kernel is not a congruence subgroup, it is not covered there.

**Checks.**

- `χ` trivial: the residue at `s = 2` is constant, eigenvalue `2(2 − 2) = 0`; an interval `(1, 2)` would
  omit it.
- `(Γ₂, κ_P)`: the pole of interest is at `4/3` (§8.7), inside `(1, 2)`, with eigenvalue `8/9`.
- On `Re s = 1` there is no pole and `|φ_ii(1 + it)| ≤ 1` by unitarity.

*Needs:* §§8.2–8.3; MaassForms §7.1; BianchiModularForms §0.3; AutomorphicSpectralTheory §§0.15–0.16.

### 8.5 Theta functions as residues

Let `K` be imaginary quadratic with `μ_n ⊆ K` (`n ∈ {2, 3, 4, 6}`), `N` with `n² ∣ N` an `n`-th power
in `K`, and `κ` the Kubota character on `Γ = Γ(N) ∩ SL₂(𝓞_K)`. Define the *theta function* of
`(Γ, κ)` as the residue at `s = 1 + 1/n` of the Eisenstein series at `∞`. Prove that the pole is at most
simple and the residue is nonzero, square integrable, automorphic with character `κ`, with
`Δ₃ θ = (1 + 1/n)(1 − 1/n) θ` (`kubota1969` §6, Theorem 6 and (45), pp. 49–50).

- The constant term of `θ` at `∞` is a multiple of `v^(1 − 1/n)`, and its nonconstant terms are
  `v K_(1/n)(4π|μ|v) ě(μz)`.
- The square-integrable limits at `s = 1 + 1/n` of the combinations `Σ_i w_i(s) E_i(w, s, κ)` with
  entire `w_i`, among them the residues of the Eisenstein series at the essential cusps, form a
  finite-dimensional space of automorphic `Δ₃`-eigenfunctions with character `κ` and eigenvalue
  `(1 + 1/n)(1 − 1/n)` (`kubota1969` §6, p. 49); `θ` is the element given by the cusp `∞`, and no
  bound on the dimension of this space is asserted. For `K = F`, `n = 3` and Patterson's pair
  `(Γ₁(3), κ_P)` of §8.1, the essential cusp classes are those of `∞, 0, 1, −1` among the twelve
  classes `∞, 0, ±1, ±ω, ±ω², ±(1 − ω), ±(1 − ω)⁻¹` (`patterson1977` §2, pp. 126–127), and the
  residues at `4/3` of the Eisenstein series at these four cusps are all proportional to the cubic
  theta function of §8.7 (`patterson1977` Theorem 8.1, p. 152); the four are `SL₂(ℤ)`-translates of
  `∞`, hence one class under `Γ₂`.
- The theta function of `κ̄` is the complex conjugate of that of `κ`: `E(w, s, κ̄) = conj E(w, s̄, κ)`.
  For `K = F`, `n = 3`, Patterson's `κ_P` of §8.1 restricts on `Γ(N) ∩ SL₂(𝓞)` to `κ̄` (§8.1, `9 ∣ N`),
  so the cubic theta function of §8.7, restricted to that group, is automorphic with the character of
  the theta function of `κ̄`, not of `κ`; §8.7 is stated for the pair `(Γ₂, κ_P)` itself.

**Checks.**

- `n = 3`: the pole is at `4/3`, the eigenvalue `(4/3)(2/3) = 8/9`, the Bessel order `1/3`, the
  constant term `σ v^(2/3)`.
- `n = 2`: the pole is at `3/2`, eigenvalue `3/4`, Bessel order `1/2`, where `K_(1/2)` is elementary.
- A pole at `s = 1` would give eigenvalue `1` and the order-zero Bessel function; the residue at
  `1 + 1/n` is not at `1`.
- Cusp count for Patterson's pair: `−I ∉ Γ₁(3)`, so its image in `PSL₂(𝓞)` has index `648/2 = 324`;
  the stabilizer of `∞` in `PSL₂(𝓞)` meets it with index `3 · |𝓞/3𝓞| = 27` (no unit `≠ 1` is
  `≡ 1 (mod 3)`), so `Γ₁(3)` has `324/27 = 12` cusp classes, of which `4` are essential. The
  proportionality of the residues is a statement about these four; at the eight others no
  Eisenstein series is defined (§8.3).

*Needs:* §§8.1, 8.4.

### 8.6 Patterson's converse theorem

Let `M₀ = λ⁻³𝓞`, `M₁ = 1/9 + M₀` and `M₂ = −1/9 + M₀` (cosets of `M₀` in `ℂ`), and let `c_a : M_a → ℂ`
(`a = 0, 1, 2`) be three functions with
`c₀(μ) = ě(μ) c₀(μ)`, `c₁(ωμ) = ω ě(ω²μ) c₁(μ)` and `c₂(ω²μ) = ω² ě(ωμ) c₂(μ)`.
For `l ∈ ℤ` and `b ∈ {0, 1, −1}` form the nine angularly twisted Dirichlet series
`L_a(s, l, b) = Σ_{0 ≠ μ ∈ M_a} c_a(μ) ě(β_(a,b) μ) |μ|^(1−2s) (μ̄/|μ|)^l`, with the additive shifts
`β_(a,0) = 0`, `(β_(0,1), β_(0,−1)) = (ω, −ω)`, `(β_(1,1), β_(1,−1)) = (1, ω)` and
`(β_(2,1), β_(2,−1)) = (1, ω²)`, and complete them as
`ξ_a(s, l, b) = (2π)^(−2s) Γ(s + |l|/2 − 1/3) Γ(s + |l|/2 − 2/3) L_a(s, l, b)`. Suppose that every
`L_a(s, l, b)` converges absolutely in some right half-plane; that every `ξ_a(s, l, b)` continues
meromorphically to `ℂ`, entire for `l ≠ 0` and, for `l = 0`, with at most simple poles at `4/3` and
`2/3`; that every `ξ_a(s, l, b)` is bounded on each vertical strip of finite width for `|Im s|` large;
and that the six functional equations under `(s, l) ↦ (2 − s, −l)` hold:

```text
ξ_a(s, l, 0) = (−1)^l ξ_a(2 − s, −l, 0)                  (a = 0, 1, 2)
ξ_0(s, l, 1) = (−1)^l ω^(l−1) ξ_1(2 − s, −l, −1)
ξ_0(s, l, −1) = (−1)^l ω^(1−l) ξ_2(2 − s, −l, −1)
ξ_1(s, l, 1) = (−1)^l ξ_2(2 − s, −l, 1)
```

Put `r(a, b) = Res_{s=4/3} ξ_a(s, 0, b)`. Prove that
`f(w) = π r(0, 0) v^(2/3) + Σ_{0 ≠ μ ∈ M₀} c₀(μ) v K_(1/3)(4π|μ|v) ě(μz)` is automorphic under `Γ₂` with
character `κ_P` (§8.1), that `r(0, 0) = ω² r(1, −1) = ω r(2, −1)`, and that the other `r(a, b)` vanish
(`patterson1977` (7.1)–(7.3), p. 145, Theorem 7.1 and Lemma 7.2, pp. 146–147). Route: the 27
functions `F_j = f ∘ γ_j` over the coset representatives `γ_j` of `Γ₂ \ SL₂(𝓞)` (`patterson1977`
Table II, p. 129) must satisfy `F_j(g w) = κ_P(g_j(g)) F_(k_j(g))(w)`, where `γ_j g = g_j(g) γ_(k_j(g))`
with `g_j(g) ∈ Γ₂`, for the generators `(1 1; 0 1)`, `(ω 0; 0 ω²)` and `(0 −1; 1 0)` of `SL₂(𝓞)`; the
first two follow from the expansions and the relations on `c_a`, and the inversion is the Maass-type
identity of Lemma 7.2, which turns a functional equation `Φ₁(s, l) = (−1)^l Φ₂(2 − s, −l)` of two
completed series into the transformation of the two attached Bessel expansions under
`w ↦ (0 −1; 1 0) w`.

**Checks.**

- The functional equations pair `4/3` with `2 − 4/3 = 2/3`, the two admitted poles at `l = 0`, and
  `l` with `−l`; at `l = 0`, `b = 0` they make each `ξ_a(s, 0, 0)` symmetric about `s = 1`.
- `M₁ ≠ M₀`: `1/9 ∉ λ⁻³𝓞`, since `λ³ = −3λ` and `λ³/9 = −λ/3 ∉ 𝓞`; so the three series families live
  on three different cosets and no `μ` is shared.
- The constant term of `f` is `π r(0, 0) v^(2/3)`, the exponent `2/3 = 2 − 4/3` of the theta residue of
  §8.5 at `n = 3`, and its Bessel order `1/3` matches the gamma factor `Γ(s − 1/3) Γ(s − 2/3)` at `l = 0`.

*Needs:* §§8.1–8.2; Mathlib `mellinInv_mellin_eq` (Mellin inversion); AutomorphicFormsOnReductiveGroups §4.5.

### 8.7 The cubic theta function of `ℚ(ω)` and its expansions at three cusps

Prove that there is a smooth `θ` on `ℍ³`, automorphic under `Γ₂` with character `κ_P` (§8.1), proportional to the
residue at `4/3` of the Eisenstein series of `(Γ₁(3), κ_P)` at each of its essential cusps `∞, 0, 1, −1`
(§8.5), with expansion at `∞`
`θ(w) = σ v^(2/3) + Σ_{0 ≠ μ ∈ λ⁻³𝓞} τ(μ) v K_(1/3)(4π|μ|v) ě(μz)`, where `σ² = 3⁵/4` and, for primary
`c, d` with `c` squarefree, `g(r, c) = Σ_{x mod c} (x/c)_3 ě(rx/c)` and `conj` the complex conjugate:
`τ(±λ^(3n−4) c d³) = conj g(λ², c) |d/c| 3^(n/2 + 2)`,
`τ(±ωλ^(3n−4) c d³) = e^(−2πi/9) conj g(ωλ², c) |d/c| 3^(n/2 + 2)`,
`τ(±ω²λ^(3n−4) c d³) = e^(2πi/9) conj g(ω²λ², c) |d/c| 3^(n/2 + 2)` for `n ≥ 1`,
`τ(±λ^(3n−3) c d³) = conj g(1, c) |d/c| 3^(n/2 + 5/2)` for `n ≥ 0`, and `τ(μ) = 0` otherwise
(`patterson1977` Theorem 8.1 and (8.1)–(8.3), pp. 152–153; `dunnradziwill2024` (5.6)–(5.8), where
`σ = 3^(5/2)/2`); write `g̃(c) = g(1, c)/|c|` for the normalized sum (`dunnradziwill2024` (1.7)). Layer 9
uses the conjugate function `θ̄`, automorphic under `Γ₂` with the character `κ̄_P`. Prove its expansions
at the cusps `H_j ∞` for `H_j = (1 0; t_j 1)`, `(t₀, t₁, t₂) = (0, ω², ω)`:
`θ̄(H_j(z, v)) = C_j(v) + Σ_{0 ≠ μ ∈ λ⁻⁴𝓞} d_j(μ) v K_(1/3)(4π|μ|v) ě(μz)`, where `d_j(μ)` is the complex
conjugate of the coefficient of `θ ∘ H_j` at `−μ` (`ě(μz)` has conjugate `ě(−μz)` and `K_(1/3)` is real),
`C₀ = σ v^(2/3)`, `C₁ = C₂ = 0`, and the coefficients of `θ ∘ H_j` are given by `τ`, `τ₁`, `τ₂`
(`patterson1977` (8.8)–(8.9), p. 154, which carry the same conjugation bars as Theorem 8.1, and Table III,
p. 151; `dunnradziwill2024` (5.9), (5.12)–(5.16) and Appendix A, rows 1, 10, 19; `openai2026quasiRH`
(5.7), p. 27). The support and size:
`d_j(μ) = 0` unless `μ = uλ^k n b³` with a unit `u`, `k ≥ −4`, `n, b` primary and `n` squarefree, and
then `|d_j(μ)| ≤ 27 · 3^(k/6) |b|`, with no coprimality between `n` and `b`
(`openai2026quasiRH` (5.2), p. 26). Route: Patterson's Dirichlet series of Gauss sums (the Fourier
coefficients of §8.3 for `κ_P`) with their functional equations (`patterson1977` Theorem 6.1, p. 143, and
Corollary 5.2, p. 142) and residues (Theorem 9.1, p. 160) supply the hypotheses of §8.6; the coefficients at the other
cusps are the entries of the 27-vector built in the proof of §8.6; the bound uses `|g(r, c)| = |c|` for
squarefree primary `c` and `r` prime to `c`.

**Checks.**

- `μ = λ⁻³ c d³` (`n = 0`): `τ(μ) = 3^(5/2) |d| conj g(1, c)/|c| = 3^(5/2) |d| conj g̃(c)`, and `τ` is even,
  so `d₀(λ⁻³nb³) = conj τ(−λ⁻³nb³) = 3^(5/2)|b| g̃(n)`, the coefficient of `openai2026quasiRH` (5.9); with
  `k = −3` the bound is `27 · 3^(−1/2) |d| = 3^(5/2) |d|`, attained. At `c = 1 + 3ω` (norm `7`),
  `g̃(c) ≈ 0.8960 − 0.4441i` with `g̃(c)³ = −α(c) ≈ 0.1890 − 0.9820i`, not real, so `|g̃(c) − conj g̃(c)| ≈ 0.888`
  and dropping the bar changes the value.
- `μ = λ^(3n−4) c d³`: `|τ(μ)| = 3^(n/2+2) |d|`, below `27 · 3^((3n−4)/6) |d| = 3^(n/2 + 7/3) |d|`.
- The cusp coefficients `τ₁`, `τ₂` have modulus `9|d|` at `k = −4`, below `27 · 3^(−2/3) |d| ≈ 12.98 |d|`;
  a bound `27 · 3^(k/6)` without the factor `|b|` fails at the primary `d = −2`, where `9|d| = 18`.

*Needs:* §§8.4–8.6; §§4.1, 4.3; §2.5.

### Examples

- The coefficient of `θ` at `μ = λ⁻³` (`c = d = 1`): `τ = 3^(5/2) conj g(1, 1) = 3^(5/2)`, real, so `θ` and
  `θ̄` share it.
- `g̃(c)³ = μ(c) c/|c|` (`dunnradziwill2024` (1.8)) and §4.3 agree: `γ_2(c) = χ_c(λ)² g̃(c)`.

### Dependencies

Layer 2 (§§2.3, 2.5), Layer 4 (§§4.1–4.3); KTheoryLowDegrees §§10.1–10.2, 11.1–11.2;
BianchiModularForms §§0.3–0.4; MaassForms §7.1; AutomorphicFormsOnReductiveGroups §4.5;
AutomorphicSpectralTheory §§0.15–0.16.

## Layer 9: completed Gauss-sum series and their reflection by the cubic theta function

### 9.1 The completed theta series

For a finite-order character `Ψ` of primary elements, zero-extended, define
`D(s, Ψ) = Σ_{c sf} γ_2(c) ᾱ(c) Ψ(c) q_c^(−s)`, `L₀(s, Ψ) = Σ_n ᾱ(n)³ Ψ(n)³ q_n^(−3s+1/2)` and
`T(s, Ψ) = L₀(s, Ψ) D(s, Ψ)`, sums over primary indices prime to the defining modulus, and, for `X > 0`
and a test `V`, the *completed sum* `C_V(X; Ψ) = Σ_{c sf, n} γ_2(c) ᾱ(cn³) Ψ(cn³) q_c^(−1/2) q_n^(−1) V(q_c q_n³/X)`,
no coprimality between `c` and `n` being imposed, with `ᾱ` the complex conjugate of `α`
(`openai2026quasiRH` §5.1, p. 25; `liu2026improved` (4.1)); `V̂(t) = ∫₀^∞ V(x) x^t dx/x`.

- All three series converge absolutely on `Re s > 1`, and
  `C_V(X; Ψ) = (2πi)⁻¹ ∫_{(a)} V̂(s − 1/2) X^(s−1/2) T(s, Ψ) ds` for `a > 1`.
- `ᾱ` and the zero-extended `Ψ` are completely multiplicative, so
  `ᾱ(cn³) Ψ(cn³) = ᾱ(c) Ψ(c) (ᾱ(n) Ψ(n))³` also when `c` and `n` have a common prime factor, and
  the Dirichlet series in the Mellin integrand of `C_V` is the product `T = L₀ D`; a primary index
  `A` is of the form `cn³` exactly when every valuation of `A` is `0` or `1` modulo `3`, and then
  `c`, `n` are unique.

**Checks.**

- `Ψ = 1` and `c = n = 1`: the term is `V(1/X)`.
- `A = p²` is not of the form `cn³`, while `p³ = 1 · p³` and `p⁴ = p · p³` are.
- `T(s, Ψ)` is not `Σ γ_2(A) …` over all `A`: at `A = p³` the coefficient is `ᾱ(p)³ Ψ(p)³ q_p^(1/2) q_p^(−3s)`,
  from `L₀`, while `γ_2` is defined only on squarefree indices.
- The conjugate is forced: `γ_2(c) α(c) Ψ(c) = γ_2(c) ᾱ(c) (α² Ψ)(c)`, so a series written with `α`
  is the series of `Ψ` times the angular character `c ↦ α(c)²` of infinite order, which is no
  finite-order `Ψ`, and the kernel `V♯` of §9.2, built on the gamma factor of angular frequency `0`
  of the theta expansion, does not reflect it.

*Needs:* §§4.1, 4.5; Mathlib `mellin`, `mellinInv_mellin_eq`.

### 9.2 The functional equation of the completed sums through the cubic theta function

Fix a finite family `𝒳` of ray class characters of moduli of `F`, each read on primary elements with
its zero extension and each of conductor divisible only by primes of `S`, a modulus `𝔈`
with support exactly `S` divisible by each conductor, and `L ∈ 𝓞` with support `S`, `18 ∣ L`, `λ ∣ L`,
such that for every `Ψ₀ ∈ 𝒳` the function `Φ(x) = χ_x(λ)² Ψ₀(x)` on primary `x` prime to `𝔈` (and `0`
elsewhere) is `L`-periodic (possible by §2.5 and ray periodicity). For a finite set `P` of primary good
primes not dividing `L`, exponents `j_p ∈ {0, …, 5}` and `Ψ = Ψ₀ ∏_p χ_p^(j_p)`, prove
(`openai2026quasiRH` Proposition 5.1 and (5.1)–(5.6), pp. 24–27; `liu2026improved` Proposition 4.1):

- `T(s, Ψ)` continues to an entire function of polynomial growth on every vertical strip;
- for `X > 0` and smooth `V` on `(0, ∞)` with `(x∂_x)^j V(x) = O(x^C)` at `0` and `O(x^(−C))` at `∞` for
  all `C, j`: `C_V(X; Ψ)` is a finite sum, over terms `t` indexed by `h₀ mod L` and a set of active
  primes containing every `p` with `j_p ≠ 0` (`O(2^|P|)` terms), of
  `ζ_t Σ_{0 ≠ μ ∈ λ⁻⁴𝓞} d_t(μ) α(μ) ϑ_t(λ⁴μ) q_μ^(−1/2) ∏_{p active} B_p(λ⁴μ) V♯(q_μ X/q_(c_t)²)`, where
  `d_t` is one of the three cusp coefficient functions of §8.7, there is an additive character `ϑ_t`
  of `𝓞` modulo a modulus depending only on `L`, `c_t = c_F r_t` with `r_t = ∏_{p active} p` and `c_F`
  the reduced denominator of `λ²h₀/L` (times a normalizing unit), and
  `B_p(x) = χ_p(x)^(−j_p−2)` (`j_p ≠ 0, 4`), `q_p^(−1/2)(−1 + q_p 1_{p ∣ x})` (`j_p = 4`),
  `q_p^(−1/2) χ_p(x)^(−2)` (`j_p = 0`, `p` active);
- the scalar `ζ_t` does not depend on `μ`, has `|ζ_t| ≤ 1/81`, and its dependence on the primes of `P`
  is explicit: with `τ^±_(p,m) = q_p^(−1/2) Σ_{y mod p} χ_p(y)^m e(±y/p)` for `m ≢ 0 (mod 6)` (of modulus
  one, indices read modulo six), for each active `p` the units modulo `p`
  `σ_p = λ² c_t/p` and `ε_p = −((λ³ c_t/p) σ_p)⁻¹`, and
  `ω_(p,j) = τ^−_(p,j) τ^+_(p,j+2) χ_p(ε_p)^(−j−2)` (`j ≠ 0, 4`), `ω_(p,4) = τ^−_(p,4)`,
  `ω_(p,0) = −τ^+_(p,2) χ_p(ε_p)^(−2)`, there is `κ_F` of modulus one, depending only on `h₀` and the
  class of `r_t` modulo `M²` with `M = λ¹² L⁴`, such that
  `ζ_t = −(i/81) ᾱ(c_t)² φ̂(h₀) κ̄_F ∏_{p inactive} (1 − q_p⁻¹) ∏_{p active} χ_p(σ_p)^(−2) ω_(p,j_p)`, where
  `φ̂(h) = q_L⁻¹ Σ_{x mod L} φ(x) e(−hx/L)` is the finite Fourier transform of the `L`-periodic `φ`
  above; on each class of `h₀` and of `r_t` modulo `M²`, `d_t` and `ϑ_t` are fixed;
- `V♯(x) = (2πi)⁻¹ ∫_{(v)} V̂(−t) ∏_± Γ(1 + t ± 1/6)/Γ(1 − t ± 1/6) ((2π)⁴ x/27)^(−t) dt`, independent of
  `v ≥ 0`, with `|(x∂_x)^j V♯(x)| ≪_{A,j} min{x^(1/4), (1 + x)^(−A)} 𝓜_{A,⌈4A⌉+j+2}(V)` for `A ≥ 0` and
  integers `j ≥ 0`, where `𝓜_{A,B}(V) = sup_{−A ≤ η ≤ 1/4} ∫ (1 + |u|)^B |V̂(η + iu)| du`; and, for a
  fixed `χ ∈ C_c^∞(0, ∞)`, `Y > 0` and an integer `J ≥ 0`, the integrated form
  `∫_ℝ (1 + |u|)^J |∫₀^∞ χ(y) V♯(Yy) y^(−iu) dy/y| du ≪_{A,J,χ} min{Y^(1/4), (1 + Y)^(−A)} 𝓜_{A,⌈4A⌉+J+4}(V)`;
  moreover `𝓜_{A,B}(V) ≪_{A,B} ∫₀^∞ (1 + x^(−A) + x^(1/4)) (|V(x)| + |(x∂_x)^(B+2) V(x)|) dx/x`, and
  replacing `V(x)` by `x^(iu₀) V(x)` multiplies `𝓜_{A,B}` by at most `(1 + |u₀|)^B`;
- adding a good prime with exponent `0` as an inactive prime leaves `c_F`, `c_t`, `d_t`, `ϑ_t`, `κ_F`, the
  data at the other active primes and the kernel unchanged and multiplies the scalar by `1 − q_p⁻¹`.

**Checks.**

- `j_p = 4`: `B_p(x) = −q_p^(−1/2)` for `p ∤ x` and `q_p^(1/2)(1 − q_p⁻¹)` for `p ∣ x`, the normalized
  Ramanujan sum; the generic formula `χ_p(x)^(−j_p−2)` at `j_p = 4` would give `χ_p(x)^(−6)`, the
  coprimality indicator (`1` off `p`, `0` on `p`), so the case is separate.
- `V = V_G`, the Gaussian of §3.3 with `V̂_G(t) = e^(t²)`: `|V̂_G(η + iu)| = e^(η² − u²)`, so
  `𝓜_{0,0}(V_G) = sup_{0 ≤ η ≤ 1/4} e^(η²) ∫ e^(−u²) du = √π e^(1/16) ≈ 1.887`, finite for every `A, B`.
- The gamma quotient `∏_± Γ(1 + t ± 1/6)/Γ(1 − t ± 1/6)` equals `1` at `t = 0` and has its poles at
  `t = −5/6, −7/6, …`, all with `Re t < 0`, while `V̂(−t)` is entire for such `V`; so the line `Re t = v`
  may be any `v ≥ 0`, the bound `x^(1/4)` comes from the line `Re t = −1/4` (where `V̂(−t)` is read at
  `η = 1/4`) and `(1 + x)^(−A)` from `Re t = A` (`η = −A`), where the quotient grows like `|Im t|^(4A)`,
  which is the weight `(1 + |u|)^(⌈4A⌉)` in `𝓜_{A,⌈4A⌉+j+2}`.

Route: write the periodic weights on the index (the `L`-periodic `Φ` and the twists `χ_p^(j_p)`,
periodic modulo `p`), with their zero extensions kept, by finite Fourier inversion (`openai2026quasiRH`
(5.11)–(5.12)), which turns the sum into finitely many translated values of `θ̄`; move each rational
cusp to one of the three cusps of §8.7 by the automorphy of `θ̄` (character `κ̄_P`, §§8.1, 8.7); compute
the multipliers and local Fourier factors; compare Mellin transforms with the gamma factor of the theta
expansion.

*Needs:* §§8.1, 8.7; §§4.1–4.5; §2.5; §§3.2–3.4; Mathlib `Complex.Gamma`, `mellin`.

### 9.3 Uniformity of the reflection over twisted characters, kernel families and lattice sums

Prove: (sectors of twisted characters) for a fixed finite family of base characters, the twisted
characters `A ↦ χ_A(m) Ψ_base(A)` of the nonzero elements `m` fall, after fixing the `S`-valuations of
`m` modulo `6`, its unit and the ray class of `m_good`, into finitely many sectors on each of which one
pair `(𝔈, L)` of §9.2 and one choice of `d_t`, `ϑ_t` serve; (common kernel profiles) for `V` as in
§9.2, `d ≥ 1`, a compact `Ω ⊂ ℝ^d`, real exponents `a_1, …, a_d`, a profile `W` with logarithmic
support in `Ω` (§3.1) and `Y > 0`, put `h(y) = ∏ y_i^(a_i)` and `F_Y(y) = W(y) V♯(Y h(y))`; then for
`A ≥ 0` and integers `j, J ≥ 0`, uniformly in `Y`,
`p_j(F_Y) ≪_{A,j,d,Ω,a} min{Y^(1/4), (1 + Y)^(−A)} p_j(W) 𝓜_{A,⌈4A⌉+j+2}(V)` and
`‖F_Y‖_{J,sep} ≪_{A,J,d,Ω,a} min{Y^(1/4), (1 + Y)^(−A)} p_{J+d+2}(W) 𝓜_{A,⌈4A⌉+J+d+4}(V)`;
(lattice sums of decaying kernels) for the lattice `Λ = 𝓞` or `λ⁻⁴𝓞` and
`|K(x)| ≤ C_A x^(−A)` on `x ≥ 1` with `A > 1`,
`Σ_{μ ∈ Λ, a q_μ > U} |K(a q_μ)| ≪_A C_A (1 + a⁻¹) U^(1−A)` for `a > 0`, `U ≥ 1`, and
`C_A ≪ 𝓜_{A,⌈4A⌉+2}(V)` for `K = V♯` (`openai2026quasiRH` Lemmas 5.2–5.4, pp. 34–36).

*Needs:* for the sectors, §§2.4, 4.5 and 9.2; for the kernel profiles, §§3.2 and 9.2; for the lattice
sums, §3.5, and §9.2 for `K = V♯`.

### 9.4 A large sieve for cubed symbols of products, and the mean square of the completed sums

Prove (`openai2026quasiRH` Lemma 5.5, (5.27)–(5.29), p. 37): for squarefree primary good `k` with
`q_k ≤ K`, squarefree primary `n` with `q_n ≍ N`, primary `b` with `q_b ≍ B` (`n`, `b` allowed to meet `S`
away from `λ`) and coefficients `|β(n, b)| ≤ 1` independent of `k`,
`Σ_k |Σ_{n,b} β(n, b) χ_k(nb)³|² ≪_ε (KNB)^ε (K + NB) NB`; the route writes `b = g t²`, `n = cm`, `g = ch`,
uses `χ_k(nb)³ = χ_k(mh)³ 1_{(k, ct) = 1}` and Möbius inversion for the coprimality, then §6.2.

Prove (`openai2026quasiRH` Definition 5.6, Lemmas 5.7–5.8 and (5.39), pp. 38–44; `liu2026improved`
Lemma 4.2): for a fixed ray class character `ν` of `F`, read on primary elements with its zero
extension, bounded exponents `M, O ≥ 0` and `N`, and every
`ε > 0`, there are finite orders `A, J` with
`Σ_{0 < q_m ≪ Z^M, q_(m_pow) ≍ Z^O} |C_V(Z^N; ν χ_•(m))|² ≪ Z^(O/2 + max(M − O, 2M − O − N) + ε) 𝓜_{A,J}(V)²`, the
sum over nonzero elements `m` with all unit associates and `m_pow` the powerful part; at
`M = N = 1` summed over `O`: `Σ_{q_m ≤ Z} |C_V(Z; ν χ_•(m))|² ≪ Z^(1+ε) 𝓜_{A,J}(V)²`, which applies directly
to the Gaussian test `V_G` of §3.3 (`V̂_G(t) = e^(t²)`).

*Needs:* for the first statement, §6.2 and the multiplicativity of the symbols in the numerator
(§2.3); for the mean square, §§9.2–9.3, the first statement and §3.3.

### Examples

- At `M = N = 1`, `O = 0` the exponent is `0 + max(1, 1) = 1`: the mean square has the size of the
  number of frequencies `m`.
- `V = V_G`: `𝓜_{A,J}(V_G) = sup_{−A ≤ η ≤ 1/4} ∫ (1 + |u|)^J e^(η² − u²) du < ∞` for all `A, J`.

### Dependencies

Layers 2–4, 6 (§6.2) and 8 (§§8.1, 8.7).

## Layer 10: the probe at `11/12` and the `11/12` half-plane

Throughout, `η` is a primitive finite-order Hecke character of `F` (the *target*), `T` a finite
quotient of a ray class group of `F` (independent of `η`) through which `R`, `G` and the diagonal
`n ↦ R(n, n) = χ_n(−1)` of §4.5 factor (the ray class group modulo `12` is one such group),
`Θ = ⟨η, T̂⟩`, `S` the excluded set for the family `{ηθ : θ ∈ T̂}`, which contains all primes of norm
`≤ P₀` for a fixed `P₀`, `b*` the squarefree product of the primes of `S` and `ξ` a primitive character modulo
`b*` of order dividing `6`, nonprincipal at each prime of `S`.

### 10.1 The probe

Define, for `X, Y, Z > 0`, fixed nonnegative nonzero annular `W₀, W₁` and `Φ(t) = e^(t²)`, the *probe*
`I_η(X, Y, Z) = Y⁻¹ Σ_v W₁(q_v/Y) χ_v(b*) τ*⁻¹ ξ̄(v) (q_(b*) q_v X)^(−1/2) Σ_{m ≠ 0} ξ(m) q_v^(−1/2) g_(χ_v)(v, −m) W₀(q_m/(q_(b*) q_v X)) (2πi)⁻¹ ∫_{(4)} Z^t Φ(t) T_(m,v,η)(t) dt`,
`v` over primary generators of good ideals, with `g_ψ(c, k) = Σ_{d mod c} ψ(d) e(kd/c)` for a residue
character `ψ` modulo `c` extended by zero, `τ* = q_(b*)^(−1/2) g_ξ(b*, 1)`,
`Ψ_(m,v,η)(A) = η(A) Ξ(A)⁻¹ R(A, v) χ_A(m)`, `Ξ(A) = ξ(A) χ_A(b*)` and
`T_(m,v,η)(t) = Σ_{c sf, n} γ_2(c) ᾱ(cn³) Ψ_(m,v,η)(cn³) Ḡ(cn³) q_c^(−1/2−t) q_n^(−1−3t)`, with `ᾱ`, `Ḡ` the
complex conjugates of `α` and of the phase `G` of §4.5 (`openai2026quasiRH` (6.1) and the display
defining `T_(m,v,η)` before it, pp. 45–46; `liu2026improved` (4.5)).

- Both sums are finite on the support of `W₀, W₁`, and the `t`-integral converges absolutely;
  `m = 0` is excluded by the annular `W₀`.
- `T_(m,v,η)(t) = Σ_θ a_θ T(t + 1/2, Ψ_(m,v,η) θ)` with `Ḡ = Σ_θ a_θ θ`, `a_θ = |T|⁻¹ Σ_{v ∈ T} Ḡ(v) θ̄(v)`
  (§4.6 applied to `Ḡ`), so the probe is a weighted average of completed sums `C_(V_G)(Z; ·)` (§9.1)
  with `V_G` the Gaussian of §3.3; the conjugates match those of `D` and `L₀` in §9.1, since
  `ᾱ(cn³) = ᾱ(c) ᾱ(n)³`.

**Checks.**

- `|τ*| = 1` and `|Ξ| ≤ 1`: `ξ` is primitive modulo `b*`, and `χ_A(b*)` is a fixed-numerator character
  (§2.4).
- `ξ(m) = 0` when `m` meets `b*`: every surviving frequency is prime to `S`.
- `V_G = (2πi)⁻¹ ∫_{(4)} Φ(t) x^(−t) dt`, so the `t`-integral is the Mellin form of `C_(V_G)` (§9.1).
- `t ↦ t + 1/2` matches the exponents: `T(s, Ψ)` of §9.1 at `s = t + 1/2` has `q_c^(−1/2−t)` and
  `q_n^(−3(t+1/2)+1/2) = q_n^(−1−3t)`, the exponents of `T_(m,v,η)(t)`.

*Needs:* §§3.3, 4.6, 9.1.

### 10.2 The bound `Z^(1/4+ε)` for the probe at `X = Y = Z^(1/2)`

Put `Q = q_(b*) XY`; let `0 < r₋ < r₊` with `supp W₁ ⊂ [r₋, r₊]`, and let `Ω` be a smooth compactly
supported function on `(0, ∞)` equal to `1` at every value of `q_m/Q` that occurs on the support of
`W₁(q_v/Y) W₀(q_m/(q_(b*) q_v X))`. For a ray class `σ ∈ T` fix a representative `v_σ`, and put
`ν_σ(a) = η(a) Ξ(a)⁻¹ R(a, v_σ)` for primary `a` prime to `S` (and `0` elsewhere); for `t₀ ∈ ℝ` define the
additive factor and the completed row

```text
A_(m,σ,t₀)(Y) = Y⁻¹ Σ_{v ∈ σ} W₁(q_v/Y) χ_v(b*) τ*⁻¹ ξ̄(v) (q_v/Y)^(−1/2+it₀) q_v^(−1/2) g_(χ_v)(v, −m),
B_(m,σ)(Z)   = Σ_θ a_θ (2πi)⁻¹ ∫_{(4)} Z^t Φ(t) T(t + 1/2, ν_σ θ χ_•(m)) dt = Σ_θ a_θ C_(V_G)(Z; ν_σ θ χ_•(m)),
```

with `a_θ` the coefficients of `Ḡ` of §10.1 and `Ŵ₀(it₀) = ∫₀^∞ W₀(r) r^(it₀) dr/r`. Prove:

- the separation identity
  `I_η(X, Y, Z) = (Q^(−1/2)/2π) Σ_{σ ∈ T} ∫_ℝ Ŵ₀(it₀) Σ_{m ≠ 0} Ω(q_m/Q) ξ(m) (q_m/Q)^(−it₀) A_(m,σ,t₀)(Y) B_(m,σ)(Z) dt₀`
  (`openai2026quasiRH` (6.2), p. 46), by Mellin inversion of `W₀` and `R(A, v) = R(A, v_σ)` for `v ∈ σ`;
- the mean square of the additive factors: for `Y, Q ≥ 1`, `σ ∈ T` and a constant `C > 0`,
  `Σ_{0 < q_m ≤ CQ} |A_(m,σ,t₀)(Y)|² ≪_{W₁,C} (Q + Y²)/Y` uniformly in `t₀` (Lemma 6.2, p. 48). Route: the
  Gauss expansion writes `A` as `Σ_{v,d} a_(v,d) e(−md/v)` over reduced fractions `d/v` modulo `𝓞`, which
  are distinct and, by `|d/v − d'/v' − n| ≥ 1/|vv'| ≥ 1/(r₊Y)` for `q_v, q_(v') ≤ r₊Y`, separated by
  `δ_Y = min(1, 1/r₊)/Y`; the coefficient mass is `O(Y⁻¹)`, and §6.1 with `δ_Y⁻² ≤ max(1, r₊²) Y²` gives
  the bound (pp. 48–49);
- the low estimate at `X = Y = Z^(1/2)`: `|I_η(Z^(1/2), Z^(1/2), Z)| ≪_{η,ε} Z^(1/4+ε)` for every
  `ε > 0`, the exponent being independent of `η` (Proposition 6.3, p. 49; `liu2026improved` (6.1)): at
  `X = Y = Z^(1/2)`, `Q = q_(b*) Z`, §9.4 at `M = N = 1` gives
  `Σ_{0 < q_m ≤ C_Ω Q} |B_(m,σ)(Z)|² ≪ Z^(1+ε)`, and Cauchy–Schwarz gives
  `Q^(−1/2) (Q/Y)^(1/2) Z^(1/2+ε/2) = Z^(1/4+ε/2)`.

**Checks.**

- `r₊ = 13`, `Y = 1`, `v = 1 + 3ω`, `v' = 4 + 3ω` (norms `7`, `13`): with `dv' − d'v = 1` the two fractions
  are at distance `1/√91 ≈ 0.105`, below `min(1, r₊)/Y = 1` and above `min(1, 1/r₊)/Y = 1/13`.
- `Ω` is bounded with compact support, so all rows of the identity have `0 < q_m ≤ C_Ω Q`, the range of
  the additive norm; `m = 0` does not occur because `W₀` is annular.
- `|τ*⁻¹ ξ̄(v) χ_v(b*)| = 1` for `v` prime to `S`, so the coefficient of each fraction has modulus at
  most `Y^(−3/2) |W₁(r_v)| r_v^(−1)` with `r_v = q_v/Y`, which gives the mass `O(Y⁻¹)` over the `O(Y)`
  ideals with `q_v ≤ r₊Y`.

*Needs:* §10.1; §6.1; §9.4; §4.6; Mathlib `mellinInv_mellin_eq`.

### 10.3 Poisson summation in the frequency and the Euler product of the dual series

Write `A = cn³` for the completed index of §10.1. Prove (`openai2026quasiRH` Lemma 7.1 and (7.1)–(7.15),
pp. 50–54; `liu2026improved` (4.8)–(4.12)):

- Poisson summation in `m` (§3.5) on the classes modulo `v b* A` gives the frequency expansion with
  coefficients `F(v, A, H) = Σ_{d mod v, H ≡ b* A d (mod v)} χ_v(d) g_(ξχ_A)(b* A, (H − b* A d)/v)`, the
  finite Fourier transform of `m ↦ ξ(m) χ_A(m) q_v^(−1/2) g_(χ_v)(v, −m)` modulo `v b* A` being
  `q_v^(1/2) F(v, A, H)` and the Poisson prefactor of the row scale `X/q_A`; `F(v, A, H)` vanishes unless
  `(H, S) = 1`, and each remaining frequency is uniquely `H = u a⁶` with `u` sixth-power-free (its unit
  included) and `a` primary.
- With `W̃₀(|y|²)` the Fourier transform on `ℂ` (Conventions) of `x ↦ W₀(|x|²)`,
  `M(z) = ∫₀^∞ W̃₀(r) r^(z−1) dr`, `Ŵ₁(w) = ∫₀^∞ W₁(r) r^(w−1) dr`,
  `W(X, Y, Z; x, w, z) = X^(1/2−z) Z^(x+z−1) Y^(w−1) Φ(x + z − 1) M(z) Ŵ₁(w)` and, for nonzero
  sixth-power-free `u` prime to `S`,
  `F_(η,u)(x, w, z) = Σ_{c sf, n, v, a} K_η(c, n, v, a; u) q_c^(−1/2−x) q_n^(−1−3x) q_v^(−w) q_a^(−6z)`,
  `K_η(c, n, v, a; u) = F(v, A, u a⁶) χ_v(b*) (q_(b*)^(1/2) τ* ξ(v) ξ̄(u))⁻¹ γ_2(c) ᾱ(A) Ḡ(A) η(A) Ξ(A)⁻¹ R(A, v)`,
  the high identity
  `I_η(X, Y, Z) = (2πi)⁻³ ∫_{(3)} ∫_{(3)} ∫_{(2)} W(X, Y, Z; x, w, z) Σ_u q_u^(−z) ξ̄(u) F_(η,u)(x, w, z) dz dw dx`
  holds with absolute convergence on these lines (`x = t + 1 − z`; (7.3)–(7.5)).
- The complete local identity: `F_(η,u)(x, w, z) = ζ^S_F(6z) L^S(w, χ_•(u)) L^S(x, η χ̄_•(u))⁻¹ H_(η,u)(x, w, z)`
  with `H_(η,u) = ∏_{p ∉ S} H_p` and `H_p = P_p (1 − V_p)(1 − W_p)/(1 − D_p)`. At `p ∉ S` put `j = v_p(u) ∈ {0, …, 5}`,
  `ρ_p = χ_p(u/p^j)`, `a_p = ᾱ(p)³ η(p)³`, `b_p = ᾱ(p)² η(p)² χ̄_p(4)` (so `b_p³ = a_p²`), `V_p = q_p^(−6z)`,
  `R_p = a_p² q_p^(4−6x−6z)`, `W_loc = ρ_p q_p^(−w)`, `W_p = χ_p(u) q_p^(−w)` and `D_p = η(p) χ̄_p(u) q_p^(−x)`
  (zero extensions kept at `p ∣ u`); then

```text
P_p  = 1/(1 − V_p) + 1_{j=0} W_loc/(1 − W_loc) + P*_p,
P*_p = (1 − R_p)⁻¹ ( [R_p (1 − q_p⁻¹) − η(p)(q_p − 1) q_p^(−x−w) V_p^(1_{j≤1})]/(1 − V_p) + J_j ),
J_0 = −η(p) ρ_p⁻¹ q_p^(−x) + W_loc R_p,        J_1 = η(p) q_p^(−x−w),
J_2 = a_p ρ_p⁻³ q_p^(3/2−3x),                   J_3 = −η(p) b_p ρ_p⁻² q_p^(2−3x−w) + b_p² ρ_p⁻⁴ q_p^(2−4x),
J_4 = −η(p) a_p ρ_p⁻³ q_p^(5/2−4x−w),           J_5 = −a_p² q_p^(3−6x),
```

  `P*_p` being the part of the local series with `v_p(A) > 0` ((7.6), (7.10)–(7.12)). `H_(η,u)` is holomorphic
  on a neighbourhood of every point of
  `D₁(ε₀) : Re x ≥ 51/100, Re z ≥ 17/50, Re w ≥ −1/100, Re x + Re w ≥ 1 + ε₀` (every `ε₀ > 0`) and of
  `D₂ : Re x ≥ 7/8, Re z ≥ 33/200, Re w ≥ 19/20`, with `H_(η,u) ≪_ε q_u^ε` uniformly in heights and unit
  phases (the constant depending also on `ε₀` in `D₁`) and `H_(η,1) = 1 + O(P₀^(−4/5))` on `D₂`.

Prove `M(1/6) > 0` (7.2), through `|y|^(2σ−2) = Γ(1 − σ)⁻¹ ∫₀^∞ t^(−σ) e^(−t|y|²) dt` and Fourier duality,
without positivity of `W̃₀`. Define the principal correction `H_η(s) = H_(η,1)(s, 1, 1/6)` and the constant
`c_S = Ŵ₁(1) M(1/6) (Res_{s=1} ζ^S_F(s))²/6 > 0`, the `1/6` from `Res_{z=1/6} ζ^S_F(6z)`; for `P₀` large
(independently of `η`), `sup_{Re s > 7/8} |H_η(s) − 1| ≤ 1/2` (`liu2026improved` (4.13)–(4.14)).

**Checks.**

- `u = 1`: `χ_•(1) = 1`, so the identity reads `ζ^S_F(6z) ζ^S_F(w)/L^S(x, η) · H_(η,1)`; the poles at `w = 1`
  and `z = 1/6` produce the principal term with `1/L^S(x, η)`.
- `(s, 1, 1/6) ∈ D₂` for `Re s > 7/8`: `Re z = 1/6 ≥ 33/200 = 0.165` and `Re w = 1 ≥ 19/20`; a residue point
  `z = 1/6` below `33/200` would fail.
- A nontrivial unit `u` or a good prime dividing `u` makes `χ_•(u)` nonprincipal, so the numerator has
  no pole at `w = 1` for `u ≠ 1`.
- The conjugate in `D_p` is forced: at `j = 0` (`ρ_p = χ_p(u)`), `P_p (1 − V_p)(1 − W_p) = 1 − V_p W_p +
  P*_p (1 − V_p)(1 − W_p)` and `P*_p` begins with `J_0 ∋ −η(p) ρ̄_p q_p^(−x) = −D_p`, which cancels the
  first-order term of `(1 − D_p)⁻¹`, so that `H_p − 1` is summable on `D₂`; with `η(p) χ_p(u) q_p^(−x)` in
  place of `D_p` the term `η(p)(χ_p(u) − χ̄_p(u)) q_p^(−x)`, of size `q_p^(−7/8)` on `D₂`, would survive for
  non-real `χ_p(u)`, and `∏ H_p` would not converge.

*Needs:* §10.1; §§3.5, 4.2, 4.5, 5.1; Mathlib `mellinInv_mellin_eq`, `Complex.Gamma`.

### 10.4 Counting the rows of a bin by the sextic large sieve

For a nonzero sixth-power-free `u` prime to `S` put `𝒳_u = {ν(·) χ_·(u)^(±1) : ν ∈ Θ}`; a presentation in
`𝒳_u` can be principal only when `u` is supported on `S`, finitely many rows that are treated
separately. Prove (`openai2026quasiRH` Proposition 9.2, p. 67; `liu2026improved` (6.2)): for a bounded
dyad `U = Z^d`, `d_min ≤ d ≤ d_max`, a set `B` of rows with `q_u ≍ U` in one bin `(i, a)` of §7.2
for the family `𝒳_u` with `a > 51/100`, and `δ = 2a − 1`: for every `ε' > 0`, with the bin parameter `ε`
small enough in terms of `ε'` as in §7.4, `#B ≪ U^(R(δ) + ε') (1 + T₁)^A` with
`R(δ) = min{1, max(1 − δ/2, 4/3 − δ)}` and a finite order `A` fixed before `T₁ = Z^τ`; the floor bin has
`#B ≪ U`, agreeing with `R(1/50) = 1`. Route: §7.4 with `t = 1` and the floor `51/100`
gives `|M_u(D; W)|² ≫ U^(δr − ε')` with `1/2 − O(ε') ≤ r ≤ 1 + O(1/log U)`; fix the part of `u` with
valuations at least `2` and apply the sextic large sieve §6.5 to the squarefree part; compare with the
trivial count by the size of the fixed part.

**Checks.**

- `δ = 1/50`: `max(1 − 1/100, 4/3 − 1/50) = 1.313…`, so `R = 1`, the trivial count.
- `δ = 1`: `max(1/2, 1/3) = 1/2`, so `R(1) = 1/2`.
- `δ = 2/3`: both branches give `2/3`; the kink of `R` is at `δ = 2/3`.

*Needs:* §§6.5, 7.2, 7.4.

### 10.5 Contour shifts in the triple Mellin integral

*Data of an exact high representation* (`openai2026quasiRH` Definition 10.1, (10.3)–(10.5), p. 72): real
numbers `l_x, l_y > 0` and `ℓ ≥ 0`, fixed before the target, with `X = Z^(l_x)`, `Y = Z^(l_y)`,
`h = 1 − l_x + ℓ > 0` and `C(s) = s + l_x/2 − 1 + h/6 = s − 5/6 + l_x/3 + ℓ/6`; the data `S`, `ξ`, `W₀`, `W₁`
of §10.1 for each target `η`; a quantity `𝒥_η(Z)` that is, for each large `Z`, a finite combination of
probes of §10.1 (with restrictions on `A` and rescaled scales allowed); for every nonzero sixth-power-free
`u` prime to `S` a correction `𝔥_(η,u,Z)(x, w, z)`, holomorphic near every point of `D₂` and of every
`D₁(ε₀)` (§10.3), such that for every `D > 0` and every compact box `𝒦` of real parts in one of these
regions `|𝔥_(η,u,Z)| ≪_(η,𝒦,D) Z^(B_(η,𝒦,D)) (1 + |Im x| + |Im w| + |Im z|)^(J_(η,𝒦,D))` uniformly for
`1 ≤ q_u ≤ Z^D`, the constants independent of `Z` and `u`; and the identity, absolutely convergent on the
lines,
`𝒥_η(Z) = (2πi)⁻³ ∫_{(3)} ∫_{(3)} ∫_{(2)} W(X, Y, Z; x, w, z) Σ_u q_u^(−z) ξ̄(u) ζ^S_F(6z) L^S(w, χ_•(u)) L^S(x, η χ̄_•(u))⁻¹ 𝔥_(η,u,Z)(x, w, z) dz dw dx`.
For the probe of §10.1 the data are `l_x = l_y = 1/2`, `ℓ = 0`, `h = 1/2`, `C(s) = s − 2/3`,
`𝒥_η(Z) = I_η(Z^(1/2), Z^(1/2), Z)` and `𝔥_(η,u,Z) = H_(η,u)`, by §10.3. Throughout, `σ₀ ∈ [7/8, 1)` with
`β* > σ₀` (which contains `σ₀ = 11/12`), `0 < ε < 10⁻³`, `z₀ = 17/50`, and `T₁ = Z^τ ≥ 2` with
`0 < τ ≤ d_min/100`. Prove (`openai2026quasiRH` §10, pp. 72–82):

- **Tails of rapidly decaying kernels** (Lemma 10.2, p. 73). Let `m ≥ 2`, `𝒦 ⊂ ℝ` a compact set of
  contour parameters `r`, and for `r ∈ 𝒦`, `Z ≥ 2` let `K_(r,Z) ≥ 0` be a kernel on `ℝ^m`, Borel in
  `(r, t)`, with `K_(r,Z)(t) ≪_L (1 + |t|)^(−L)` for every `L` uniformly in `r, Z, t`; let `𝒟 ⊆ ℝ^m` be
  Borel and `|F_Z(t)| ≤ C Z^B (1 + |t|)^J` on `𝒟`, with `B, J, C` independent of `Z` and `N`. Then
  uniformly for `T ≥ 1` and `r ∈ 𝒦`, `∫_{𝒟 ∩ {max_j |t_j| > T}} K_(r,Z) |F_Z| dt ≪_N Z^B T^(−N)`, and,
  for every `j` and either sign of `T`, `∫_{𝒟 ∩ {t_j = T}} K_(r,Z) |F_Z| ≪_N Z^B (1 + |T|)^(−N)` in the
  other `m − 1` coordinates; both survive integration over a bounded real interval of contour
  parameters.
- **Shifting the contours for the rows of one bin** (Lemma 10.3, p. 74). Let `U = Z^d` with
  `0 < d_min ≤ d ≤ d_max < ∞` and `𝓑` a finite set of rows with `q_u ≍ U` in one bin `(i, a)` of §7.2
  for the families `𝒳_u` of §10.4, fixed before any Mellin variable moves, and fix
  `c_x, c_w, c_z ∈ (0, 1/2]`. Then the contribution of `𝓑` to the identity equals its integral over the
  segments `|Im x| ≤ c_x T₁`, `|Im w| ≤ c_w T₁`, `|Im z| ≤ c_z T₁` of `Re x = a + 16ε`,
  `Re w = 1 − a − 6ε`, `Re z = z₀`, up to `O_(η,N)(Z^(B_η) T₁^(−N))` for every `N`, with `B_η` fixed
  before `N`; an empty `𝓑` contributes `0`.
- **Bounding the shifted integral of a bin** (Lemma 10.4, p. 77). In the setting of the
  previous bullet put `δ = 2a − 1`; suppose that on the central segments of the previous bullet
  `𝔥_(η,u,Z) = Σ_{λ ∈ Λ} 𝔥^(λ)_(η,u,Z)` with `Λ` finite, nonempty and fixed before `Z`, and that at each
  point of these segments and for each `λ`, `𝓑` is partitioned into at most `C(1 + log Z)^D` sets `𝓑'`,
  each with real numbers `(R, g)` in a fixed bounded range, such that
  `Σ_{u ∈ 𝓑'} |L^S(w, χ_•(u)) 𝔥^(λ)_(η,u,Z)(x, w, z)| ≪_η U^(R+δ/2+ε_c) Z^(ℓ(z₀−1/2)+g+ε_c) (1 + T₁)^(A_η)`,
  for fixed `ε_c ≥ 0` and finite `A_η`, uniformly on these segments. Here the points are restricted in
  height: wherever that bound evaluates the `L`-function of a presentation in `𝒳_u`, its inverse or its
  logarithmic derivative, the argument has imaginary part `γ_j + Σ_{k ≤ n_v} a_jk v_k`, with a fixed
  real matrix `(a_jk)`, `|γ_j| ≤ (3i + 1)T₁` and external heights `v_1, …, v_(n_v)` (the three Mellin
  heights among them, with zero coefficients where they do not occur), and these are restricted to
  `|v_k| ≤ T₁/(2n_v(1 + max_j |a_jk|))` (`openai2026quasiRH` (10.14), p. 77); then
  `|Σ_k a_jk v_k| < n_v · T₁/(2n_v) = T₁/2`, so every such argument has imaginary part of absolute value
  below `(3i + 1)T₁ + T₁/2 < (3i + 2)T₁`, inside the zero-free rectangle of §7.2; the successive
  estimates share this single margin `T₁/2`, none of them being granted a margin of its own. Put
  `E(d; R, g) = a − σ₀ + h(z₀ − 1/6) − a l_y − ℓ/2 + g + d(R + δ/2 − z₀)` and `E^max(d)` its supremum
  over the occurring pairs. Then for every `ε_d, ε_p > 0` the contribution of `𝓑` on the central
  contours is `≪_η Z^(C(σ₀) + E^max(d) + (16 − 6l_y)ε) Z^((1+d)ε_c + dε_d + ε_p) (1 + T₁)^(A_η)`, and
  the discarded portions are `O_(η,N)(Z^(B_η) T₁^(−N))`.
- **The row `u = 1` and its residue at `w = 1`, `z = 1/6`** (Lemma 10.5, pp. 78–80). Assume
  `sup_{Re s > 7/8} |H_η(s) − 1| ≤ 1/2` (§10.3). Suppose that for every `ε' > 0`, uniformly in the
  imaginary parts on `Re x = β* + ε`, `19/20 ≤ Re w ≤ 1 + ε`, `33/200 ≤ Re z ≤ 1/6 + ε`,
  `|𝔥_(η,1,Z)| ≪ Z^(ℓ Re z + ε') (1 + |Im x| + |Im w| + |Im z|)^J` with `J` fixed before the decay order
  of any tail bound; that `A_η(Z) ≠ 0` for large `Z` with `|A_η(Z)|⁻¹ ≪_(η,ε') Z^(ε')`; and that on
  `Re s = β* + ε`, `𝔥_(η,1,Z)(s, 1, 1/6) = H_η(s) Z^(ℓ/6) A_η(Z) (1 + ℛ_(η,Z)(s))` with `ℛ ≡ 0` or
  `|ℛ_(η,Z)(s)| ≪_η Z^(−μ)` for some `μ > 0` independent of `η`. Let `𝒫_η(Z)` be the `u = 1` term of the
  identity and `f_η(Z) = (2πi)⁻¹ ∫_{(2)} Z^(C(s)) e^((s−5/6)²) H_η(s)/L^S_F(s, η) ds`, the `f_η` of §1.3
  with `L_η D_η = L^S_F(·, η)`. Then `c_S > 0` and, for every `ε' > 0`,
  `𝒫_η(Z)/(c_S A_η(Z)) − f_η(Z) ≪_(η,ε,ε') Z^(C(β*) + (1+h)ε − l_y/20 + ε') + Z^(C(β*) + ε − h/600 + ε') + Z^(C(β*) + ε − μ + ε')`,
  the last term omitted when `ℛ ≡ 0`. For the probe of §10.1, `A_η = 1`, `ℛ ≡ 0`, and the two savings
  are `l_y/20 = 1/40` and `h/600 = 1/1200`.
- **Rows outside the intermediate range** (Lemma 10.6, pp. 80–82). Let `ℛ_η(U; Z)` be the contribution
  of the rows `U ≤ q_u < 2U`, `u ≠ 1`, for dyadic `U ≥ 1`. If for every `ε' > 0` and all rows with
  `q_u ≤ 2Z^(d_min)`, uniformly in the imaginary parts on `(Re x, Re w, Re z) = (β* + ε, 1/2, z₀)`,
  `|𝔥_(η,u,Z)| ≪ Z^(ℓz₀+ε') q_u^(ε') (1 + |Im x| + |Im w| + |Im z|)^J`, then for `1 ≤ U ≤ Z^(d_min)`,
  `|ℛ_η(U; Z)| ≪ Z^(C(β*) + h(z₀−1/6) − l_y/2 + ε + ε') U^(63/50 + ε')`, and these dyads sum to
  `≪ Z^(C(β*) + h(z₀−1/6) − l_y/2 + ε + (63/50) d_min + ε')`. If for every fixed `v > 2` and `ε' > 0`,
  for every row, uniformly on `(2, 2, v)`,
  `|𝔥_(η,u,Z)| ≪ Z^(ℓv+ε') q_u^(ε') (1 + |Im x| + |Im w| + |Im z|)^J`, then with `B₀ = l_x/2 + 1 + l_y`,
  `|ℛ_η(U; Z)| ≪ Z^(B₀ + hv + ε') U^(1+ε'−v)` for every dyad, and for fixed `ς > 0` and `ε' < v − 1` the
  dyads `U > Z^(h+ς)` sum to `≪ Z^(B₀ + (h+ς)(1+ε') − ςv + ε')`. For the probe of §10.1 with
  `d_min = 1/63`, `ς = 1/1000` and `v = 4000`: the small rows save
  `−(h(z₀ − 1/6) − l_y/2 + (63/50) d_min) = 43/300` relative to `C(β*)`, and the large rows have
  exponent `7/4 + 501/1000 − 4 + O(ε') < −1`, below `C(β*) ≥ 1/4` by more than `1`.

**Checks.**

- `C(s)` of the probe: `s + 1/4 − 1 + 1/12 = s − 2/3`, and `C(11/12) = 1/4`, the exponent of §10.2.
- Small-row saving: `h(z₀ − 1/6) = (1/2)(17/50 − 1/6) = (1/2)(13/75) = 13/150` and `(63/50)(1/63) = 1/50`, so
  `13/150 − 1/4 + 1/50 = −43/300`; the row power `1 + 3/5 − z₀ = 63/50` is the strip exponent `3/5` of §5.2
  plus the row count minus `q_u^(−z₀)`. The value `z₀ = 17/50` is the least `Re z` of `D₁` and has
  `6z₀ = 51/25 > 1`, so `ζ^S_F(6z)` has no pole on these moves; `z₀ = 1/6` would sit on that pole.
- At the starting lines `(Re x, Re w, Re z) = (3, 3, 2)` the identity converges absolutely
  (`Re t = Re x + Re z − 1 = 4`, the line of §10.1), and the moved bin of the second bullet satisfies
  `Re x + Re w = 1 + 10ε` and `Re w = 1 − a − 6ε ≥ −6ε > −1/100`, inside `D₁(10ε)`.
- The height restriction of the shifted integral of a bin, for the three Mellin heights alone
  (`n_v = 3`) and one argument with coefficients `(a_11, a_12, a_13) = (1, −3, 0)`:
  `|v_1| ≤ T₁/(2 · 3 · 2) = T₁/12`, `|v_2| ≤ T₁/(2 · 3 · 4) = T₁/24` and `|v_3| ≤ T₁/6`, so
  `|v_1 − 3v_2| ≤ T₁/12 + T₁/8 = 5T₁/24 < T₁/2`; without the factor `1 + max_j |a_jk|` (the bound
  `|v_k| ≤ T₁/6`) the same argument could move by `T₁/6 + T₁/2 = 2T₁/3`, more than the margin `T₁/2`.

*Needs:* for the tails, §3.2; for the contour shift of one bin, §§7.2 and 10.3–10.4, §5.1 and the
tails; for the shifted integral of a bin, §§7.2, 5.3 and 3.2, the contour shift and the tails; for
the row `u = 1`, §§1.3, 10.3, 5.3 and 3.4 and the tails; for the rows outside the intermediate range,
§§5.1–5.3 and 10.3 and the tails.

### 10.6 The comparison of the probe with the Mellin integral, with saving `1/4800`

With `J_(I,η)(Z) = I_η(Z^(1/2), Z^(1/2), Z)/c_S`, `C_I(s) = s − 2/3` and `f_(I,η)` the `f_η` of §1.3 for
`C_I`, prove: if `β* > 11/12`, then `|J_(I,η)(Z) − f_(I,η)(Z)| ≪_η Z^(C_I(β*) − 1/4800)` for every
target `η` and large `Z`, the saving being independent of `η` (`openai2026quasiRH` Proposition 11.2, p.
83). Route: §10.5 at the data of the probe (`l_x = l_y = h = 1/2`, `ℓ = 0`, `d_min = 1/63`,
`ς = 1/1000`, `v = 4000`) bounds five pieces of the identity by powers of `Z` below `C_I(β*)`, each
before the losses chosen afterwards. The rows with `Z^(1/63) < q_u ≤ Z^(501/1000)`, through the shifted
integral of a bin (§10.5) and the row count of §10.4, lie `1/24 − (62/75)(1/1000) = 1021/25000` below:
the exponent grows with the dyad exponent `d` at a rate between `33/50` and `62/75`, is at least `1/24`
below at `d = h`, and the range beyond `h` has length `ς` (`openai2026quasiRH` (10.12), p. 76). The row
`u = 1` leaves, besides its residue at `w = 1`, `z = 1/6` (the principal term), its `w`-integral on
`Re w = 19/20`, which lies `l_y/20 = 1/40` below, and its `z`-integral on `Re z = 33/200 = 1/6 − 1/600`,
which lies `h/600 = 1/1200` below. The rows with `q_u ≤ Z^(1/63)` lie `43/300` below, and those with
`q_u > Z^(501/1000)`, estimated on `Re z = 4000`, more than `1` below (`openai2026quasiRH` §11, p. 82).
With `m₀ = 1/1200`, the least of the five, fix before the target the loss budget `ε_b = 10⁻⁶`: the bin
parameter `ε < ε_b` of §10.5; the losses `ε_r` of the row count (the `ε'` of §10.4), `ε_n` of the
numerator `L^S(w, χ_•(u))` on the reflected line (the `ε₁` of §7.2) and `ε_H` of the correction
(`H_(η,u) ≪ q_u^(ε_H)` of §10.3), each equal to `ε_b`; the losses `ε_d`, `ε_p` of §10.5 and the loss of
summing the `O(log Z)` dyads, each at most `ε_b`. The shifted integral of a bin (§10.5) then holds with
`ε_c = 12ε + ε_r + ε_n + ε_H ≤ 15ε_b`, the `12ε` coming from the reflected-line bound of §7.2
(`openai2026quasiRH` §10.5, p. 75). With `l_y = 1/2` and `d ≤ 501/1000 < 1`, the losses
`(16 − 6l_y)ε + (1 + d)ε_c + dε_d + ε_p` of §10.5 and the dyadic sum come to at most
`13ε_b + 2 · 15ε_b + ε_b + ε_b + ε_b = 46ε_b < m₀/4` (`openai2026quasiRH` proof of Proposition 11.2,
p. 83); every piece keeps at least `3m₀/4 = 1/1600`, and §1.4 with `m = 1/2400` gives `m/2 = 1/4800`.

**Checks** (the closed-form inequalities).

- `46ε_b = 46 · 10⁻⁶ = 4.6 · 10⁻⁵ < (1/1200)/4 ≈ 2.08 · 10⁻⁴`; the count `46 = 13 + 30 + 3` is the
  `13ε` of the bin parameter, `(1 + d)ε_c ≤ 2 · 15ε_b`, and `ε_d`, `ε_p` and the dyadic sum. Taking
  `ε_c = ε_b`, as if the row count were the only loss in it, would give `13 + 2 + 3 = 18` and hide the
  `12ε` that the reflected-line bound of §7.2 puts into every bin.
- `3m₀/4 = 1/1600`, and `1/1600 > 1/2400 = m`.
- The least of the five is `1/1200 < 1/40 < 1021/25000 < 43/300`: the `z`-integral of the row `u = 1`
  fixes `m₀`.
- `1/24 − 62/75000 = (3125 − 62)/75000 = 3063/75000 = 1021/25000`; the shift `1/6 − 33/200 = 1/600`
  times `h = 1/2` is `1/1200`, and `(1 − 19/20) l_y = 1/40`.

*Needs:* §§1.4, 10.5; for the loss budget, §§7.2, 10.3 and 10.4.

### 10.7 The zero-free half-plane `Re s > 11/12`

Prove (`openai2026quasiRH` Theorem 3.1, p. 10; `liu2026improved` Proposition 6.3; `openai2026quasiRHalt`
Theorem 1.1, p. 2): for every modulus `𝔪` of `F` and every `χ : RayClassCharacter 𝔪`,
`heckeLFunctionC χ` is zero-free right of `11/12` (`zeroFreeRightOf_heckeLFunctionC`); for every `N ≥ 1`
and every `χ : DirichletCharacter ℂ N`, `DirichletCharacter.LFunction χ` is zero-free right of `11/12`
(`zeroFreeRightOf_LFunction`); in particular `riemannZeta s ≠ 0` for every `s` with `Re s > 11/12`
(`riemannZeta_ne_zero_of_eleven_twelfths_lt_re`; at `s = 1` Mathlib's value `(γ − log 4π)/2` is not `0`,
`riemannZeta_one_ne_zero`, so no point needs excluding, as in `riemannZeta_ne_zero_of_one_le_re`).
Route: the primitive family of `F`, the trivial character included, is analytic and zero-free on
`Re s > 1` (Euler product; there `heckeLFunctionC` is the series by the continuation of LFunctions
Layer 5), so it is zero-free right of `1` and satisfies the hypothesis of §1.3; suppose its zero
abscissa `β*` exceeds `11/12` and apply §1.3 with `σ₀ = 11/12`, `c = −2/3`,
`ω = (β* − 11/12)/2`, `σ = 1/4800`, `J_η = J_(I,η)`, `H_η` of §10.3 and `D_η` the Euler factors at `S`:
§10.2 gives `|J_η| ≪ Z^(1/4 + ε)` with `C(11/12) = 1/4` and `ε < ω`, and §10.6 the comparison. Hence
`β* ≤ 11/12`, and §5.5 with `K = F` (abelian, `X(F) = {1, χ₋₃}`) transfers the half-plane to every
presentation and to every Dirichlet `L`-function. A second proof, through the mean square of
sextic-twisted Möbius sums `Σ μ(𝔫) η(𝔫) χ_n(u) W(N𝔫/D)` and Littlewood's criterion, is
`openai2026quasiRHalt` Proposition 3.1 and Section 3.

*Needs:* §§1.2–1.3, 5.5, 10.2, 10.3, 10.6; LFunctions Layer 5; Tau Ceti `heckeLFunctionC`,
`PrimitiveRayClassCharacter`; Mathlib `DirichletCharacter.LFunction`, `riemannZeta`,
`riemannZeta_one_ne_zero`.

**Checks.**

- For a real primitive `χ` of conductor `q ≥ 3` and a real zero `β`, `β ≤ 11/12` gives
  `(1 − β) log q ≥ (log 3)/12`, a uniform Landau–Siegel bound; AnalyticNumberTheoryPartI §0.34 keeps its
  own statement.
- The principal character modulo `4`: `L(s, χ₀) = ζ(s)(1 − 2^(−s))` has its pole at `1` (order `−1`) and
  zeros on `Re s = 0`, none right of `11/12`; the statement holds at every level.
- `C_I(11/12) = 11/12 − 8/12 = 1/4`, the exponent of §10.2.
- `s = 1`: Mathlib's `ζ(1) = (γ − log 4π)/2 ≈ (0.5772 − 2.5310)/2 ≈ −0.977 ≠ 0`, and at `s = 2`,
  `ζ(2) = π²/6`; the statement about `riemannZeta` holds on the whole half-plane.

### Examples

- `X = Y = Z^(1/2)`, `Q = q_(b*) Z`: `Q^(−1/2) (Q/Y)^(1/2) Z^(1/2) = Z^(−1/2 + 1/4 + 1/2) = Z^(1/4)` up to constants.
- The principal residue has exponent `X^(1/3) Z^(s − 5/6) = Z^(s − 2/3)` at `X = Z^(1/2)`.

### Dependencies

Layers 1, 3–7 and 9; LFunctions Layers 5 and 7.

## Layer 11: consequences

### 11.1 The zero strip

Let `θ ∈ [1/2, 1)`. Prove: if `DirichletCharacter.LFunction χ` is zero-free right of `θ` for every
primitive `χ`, then every zero `ρ` with `Re ρ > 0` of a primitive Dirichlet `L`-function satisfies
`1 − θ ≤ Re ρ ≤ θ`; and the same for the primitive finite-order Hecke characters of any number field
`K`, a zero being a point of positive meromorphic order, under the hypothesis for the family of `K`.
Route: for `0 < Re ρ < 1` the gamma factors (`Γ_ℝ(s + a)` with `a ∈ {0, 1}`, and `Γ_ℂ(s)`) are finite
and nonzero, and the poles at `0` and `1` of the completion of the trivial character lie outside the
strip, so `L(ρ, χ) = 0` gives `L(1 − ρ̄, χ) = 0` by the functional equation
(`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, LFunctions Layer 5 for `K`) and complex
conjugation; `Re ρ > θ`, which contains `Re ρ ≥ 1`, is excluded by the hypothesis itself, read
through §1.1: a Dirichlet `L`-function is analytic off `s = 1` and at `1` for `χ ≠ 1`
(`DirichletCharacter.differentiableAt_LFunction`), so a zero of its value there has positive order,
and at level `1` the value at `1` is `riemannZeta 1 ≠ 0` (`DirichletCharacter.LFunction_modOne_eq`,
`riemannZeta_one_ne_zero`); `Re ρ > 0` excludes the trivial zeros
(`DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos`).
The instance `θ = 11/12` (§10.7) gives `1/12 ≤ Re ρ ≤ 11/12` (`openai2026quasiRH` proof of Corollary 1.2,
p. 7, at `7/8`): for a primitive Dirichlet character, at a zero `ρ` of the value with `Re ρ > 0`
(`re_mem_Icc_of_LFunction_eq_zero`; a primitive character of level `N ≥ 2` is nontrivial, so its
`L`-function is entire, and at level `1` Mathlib's value `ζ(1)` is not `0`), and for a primitive
finite-order Hecke character of `F`, at a point `ρ` with `Re ρ > 0` and
`0 < meromorphicOrderAt (heckeLFunctionC ψ.character) ρ` (`re_mem_Icc_of_heckeLFunctionC`).

**Checks.**

- `θ = 1/2` gives `Re ρ = 1/2`: the hypothesis is GRH for the family.
- The principal character modulo `p` is not primitive and has zeros on `Re s = 0` from `1 − p^(−s)`; the
  strip is stated for primitive characters and `Re ρ > 0`.
- `ζ` is the primitive character modulo `1`: its nontrivial zeros satisfy `1/12 ≤ Re ρ ≤ 11/12`.
- `K = ℚ`: the primitive finite-order Hecke characters of `ℚ` are the primitive Dirichlet characters
  read on ideals, and the Hecke clause is the Dirichlet clause; the trivial character gives `ζ`, whose
  pole at `1` has order `−1` and is no zero.
- `K = ℚ(√2)`, trivial character: `ζ_K` vanishes at `s = 0` to order `r₁ + r₂ − 1 = 1`, the poles of
  `Γ_ℝ(s)²` against the simple pole of the completion there; real part `0`, excluded by `Re ρ > 0`.

*Needs:* §1.1; Mathlib `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`,
`DirichletCharacter.differentiableAt_LFunction`, `DirichletCharacter.LFunction_modOne_eq`,
`riemannZeta_one_ne_zero`, `DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos`; LFunctions Layer 5.

### 11.2 Least character values under a zero-free half-plane

For a nonprincipal Dirichlet character `χ` modulo `q` define *leastNonOne* `χ` as the least `n ≥ 1` with
`χ(n) ∉ {0, 1}`; it is at most `q`.

- It is at least `2`. For the primitive character `χ*` inducing `χ`, `χ(n) = χ*(n)` for `n` prime to `q`,
  and the least `n` with `χ(n) ∉ {0, 1}` is prime to `q`, so *leastNonOne* `χ* ≤` *leastNonOne* `χ`;
  equality can fail (modulo `12`: `2` against `5`).
- Every `n ≥ 1` below it has `χ(n) ∈ {0, 1}`, and for a real `χ` its value there is `−1`.
- For the Legendre character modulo an odd prime `p`, it is `SieveApplications.leastNonresidue p`.

**Checks.**

- `χ` the character modulo `5` with `χ(2) = i`: the value is `2`.
- `χ = (·/7)`: `(2/7) = 1`, `(3/7) = −1`, so the value is `3`, the least nonresidue modulo `7`.
- `χ` modulo `12` induced by `(·/3)`: `χ(2) = χ(3) = χ(4) = 0`, `χ(5) = (5/3) = −1`, so the value is `5`;
  reading `0` as a value outside `{0, 1}` would give `2`, and so does the primitive `(·/3)`, with
  `(2/3) = −1`.

Prove: for every `θ ∈ [1/2, 1)` there is `C_θ` such that for every `q ≥ 2` and every nonprincipal
`χ` modulo `q` whose `L`-function is zero-free right of `θ`, *leastNonOne* `χ ≤ C_θ (log q)^(1/(1−θ))`,
that is, some `n ≥ 1` with `n ≤ C_θ (log q)^(1/(1−θ))` has `χ(n) ∉ {0, 1}`
(`exists_ne_zero_ne_one_le_log_rpow`).
Prove the Hecke analogue: for a number field `K`, `θ ∈ [1/2, 1)`, a modulus `𝔪` of `K` and a
nontrivial `η : RayClassCharacter 𝔪`, read on ideals with the value `0` on those not prime to `𝔪`,
whose `L`-function `heckeLFunctionC η` is zero-free right of `θ` (equivalently, by §1.1, that of its
primitive character), some nonzero prime ideal `𝔭` with `η(𝔭) ∉ {0, 1}` has
`N𝔭 ≤ C_{K,θ} (log N𝔪₀ + 2)^(1/(1−θ))`, where `𝔪₀` is the finite part of `𝔪`
(`exists_prime_ne_zero_ne_one_le_log_rpow`, with `η` read on ideals through
`RayClassCharacter.toMultiplicativeIdealWeight`); for primitive `η` this is
the bound in the norm of the finite part of the conductor. As for Dirichlet characters, the bound
is in the presentation modulus, not the conductor. Route: if `χ(n) ∈ {0, 1}` for
`n ≤ x`, compare the Weil formula (ZerosOfLFunctions §§8.4, 8.6) for `χ*` and for `ζ` (or `ζ_K`) with a
fixed nonnegative test supported in `[1/2, 1]` at scale `x`: the prime sides differ by
`O(log q log x)` (by `O(log N𝔪₀ log x)` over `K`, from the primes dividing `𝔪₀`), the zero side of
`χ*` is `O(x^θ log q)` by the counts of §§4.4–4.5, the archimedean
term is `O(x^(1/2) log x)`, and the `ζ` side is `x φ̃(1)(1 + o(1))` (§8.5); so `x^(1−θ) ≪ log q`
(`lamzourilisound2015` Lemma 2.2 and Theorem 1.1, the case `θ = 1/2`).

**Checks** (the Hecke analogue).

- `K = ℚ`, `η` the character modulo `3 ∏_{p ≤ y} p` induced by `(·/3)`: its conductor is `3`, but
  `η(p) = 0` for every `p ≤ y`, so the least prime with `η(p) ∉ {0, 1}` is the least `p > y` with
  `p ≡ 2 (mod 3)`, which exceeds `y`. A bound in `log N𝔣 = log 3` would be false for large `y`; the
  stated bound has `log N𝔪₀ = log 3 + Σ_{p ≤ y} log p ≍ y`, so it is `≫ y²`, while that prime is at
  most `2y` for large `y` (the prime number theorem in progressions modulo `3`).
- `K = ℚ(i)`, `𝔪 = (3)`, `η = (·/3) ∘ N`, of order `2` (§5.4, with no infinite part): the prime `(1 + i)`
  of norm `2` has `η = (2/3) = −1`, so the least such prime has norm `2`.
- The trivial character of a modulus is excluded: `η(𝔭) ∈ {0, 1}` at every prime, while for `K = F`
  its `L`-function, `ζ_F` without its Euler factors at `𝔪`, is zero-free right of `11/12` by
  §10.7, so the hypothesis holds and the conclusion fails.

*Needs:* §1.1 (presented versus primitive); ZerosOfLFunctions §§4.4–4.5, 8.4–8.6; Mathlib
`DirichletCharacter.LFunction_changeLevel`; Tau Ceti `heckeLFunctionC`, `RayClassCharacter`.

### 11.3 The least quadratic nonresidue

Prove: there is an absolute `C` with `SieveApplications.leastNonresidue p ≤ C (log p)^12` for every odd
prime `p`; and for every `δ > 0`, `SieveApplications.leastNonresidue p ≪_δ p^δ`, Vinogradov's conjecture
in the form of `tao2015` Conjecture 1.1 (`openai2026quasiRH` Corollary 1.2, p. 7, with exponent `32` at
`7/8`). Since the least nonresidue is at most every nonresidue, the two bounds say that some `n ≥ 1`
below the bound has `jacobiSym n p = −1` (`exists_jacobiSym_eq_neg_one_le_log_pow`,
`exists_jacobiSym_eq_neg_one_le_rpow`). Route: §10.7 and §11.2 with `θ = 11/12` and the Legendre character, whose least value outside
`{0, 1}` is below `p` for large `p` and is then a nonresidue.

**Checks.**

- `θ = 1/2` in §11.2 gives exponent `2`, Ankeny's `O((log q)²)` under GRH.
- The route of `bimsissac2017` (Conjecture 6.3, Theorem 6.7, exponent `4/(1 − 2ϵ)`) needs the open strip
  `1/2 − ϵ < Re ρ < 1/2 + ϵ` for some `ϵ < 1/2`; since §11.1 gives the closed strip `[1/12, 11/12]`, every
  `ϵ` with `5/12 < ϵ < 1/2` is admissible and that route gives every exponent above `4/(1 − 5/6) = 24`
  (`48` at `ϵ = 11/24`), against `12` here; at `7/8` it admits every `ϵ` with `3/8 < ϵ < 1/2` and gives
  every exponent above `16` (`32` at `ϵ = 7/16`, the choice of `openai2026quasiRH`
  Corollary 1.2). Its proof also uses `ψ(x)`, which must be read through `ζ`, the character modulo `1`.
- `p = 7`: the least nonresidue is `3 ≤ C (log 7)^12` for any `C ≥ 1`.

*Needs:* §§10.7, 11.2; SieveMethodsAndPrimePatterns §2.9.

### Examples

- `θ = 11/12`: `1/(1 − θ) = 12`; `θ = 7/8`: `8`.
- The zero strip at `θ = 11/12` contains the critical line.

### Dependencies

Layers 1, 5 and 10; LFunctions Layer 5; ZerosOfLFunctions §§4.4–4.5, 8.4–8.6; SieveMethodsAndPrimePatterns
§2.9; Mathlib Dirichlet `L`-functions.

## Downstream consumers

- **QuasiRiemannHypothesisPartII**: the `7/8` half-plane by the second probe of `openai2026quasiRH`
  Part II (Sections 12–20), consuming Layers 1–10: the continuation principle and the choice of the height
  exponent before the decay order (§§1.3–1.4), the reflection (§9.2), the sieves (§§6.2, 6.5), the zero
  detection (§§7.2–7.4), the Poisson identity and principal correction (§10.3) and the `11/12` bound
  itself (§10.7), which enters through `κ = 2β* − 1 ≤ 5/6`; then the strip `1/8 ≤ Re ρ ≤ 7/8` (§11.1 at
  `θ = 7/8`), the exponent `8` in §11.3 and the Landau–Siegel constant `(log 3)/8`.
- **ExplicitPrimeCounting, Part II**: conditional bounds under a zero-free half-plane, unconditional
  at `11/12` by §10.7.
- **AnalyticNumberTheoryPartIII, Part II**: `ψ(x) − x ≪ x^(11/12+ε)` and its
  fixed-modulus analogue, from §10.7 and the explicit formula.
- **ZerosOfLFunctions, Part II**: over `F`, power savings in ray-class prime counts and abelian
  Chebotarev, and the removal of the exceptional-zero alternative right of `11/12`.
- **SieveMethodsAndPrimePatterns, Part II**: the bound on the least quadratic nonresidue (§11.3), for
  the function its §2.9 defines.
- **ExplicitMultiplicativeFunctions, Part II**: qualitative power savings `M(x) = O(x^(11/12+ε))`.
- The supplier blocks: Layer 6 (moments of `n`-th order twists, `bgl2014`; quadratic and sextic Hecke
  families over imaginary quadratic fields, `gaozhao2020`, `gaozhao2024`) and Layer 8 (the distribution
  of cubic Gauss sums, `dunnradziwill2024`).

## References

- `openai2026quasiRH` — OpenAI, *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re(s) > 7/8*,
  preprint of 30 September 2026, repository `openai/math` at revision `adc7f12`; §§1–11 (Part I),
  Theorem 3.1, Proposition 2.1, Lemmas 4.1–4.10, Proposition 5.1, Lemmas 5.2–5.8, Lemmas 6.1–6.2,
  Proposition 6.3, Lemma 7.1, Lemmas 8.1–8.2, Proposition 8.3, Lemma 9.1, Proposition 9.2, §10,
  Lemma 11.1, Propositions 11.2–11.3, Corollary 1.2.
- `openai2026quasiRHalt` — OpenAI, *The Quasi-Riemann Hypothesis*, preprint of 5 October 2026, same
  repository; Theorem 1.1, Proposition 3.1 and Section 3.
- `liu2026improved` — B. Liu, *Improved zero-free half-planes for the quasi-Riemann hypothesis*,
  arXiv:2610.12234v2; Part I, §§3–6.
- `kubota1969` — T. Kubota, *On automorphic functions and the reciprocity law in a number field*,
  Lectures in Mathematics, Kyoto University 2 (1969); §§3, 5, 6.
- `kubota1968` — T. Kubota, *Über diskontinuierliche Gruppen Picardschen Typus und zugehörige
  Eisensteinsche Reihen*, Nagoya Math. J. 32 (1968), 259–271; §§2–4.
- `patterson1977` — S. J. Patterson, *A cubic analogue of the theta series*, J. Reine Angew. Math. 296
  (1977), 125–161; §§2–3, 6–9, Table III; cited by printed page.
- `dunnradziwill2024` — A. Dunn, M. Radziwiłł, *Bias in cubic Gauss sums: Patterson's conjecture*,
  Ann. of Math. 200 (2024); (1.4)–(1.8), §5.1, Appendix A (arXiv v3 numbering).
- `goldmakherlouvel2013` — L. Goldmakher, B. Louvel, *A quadratic large sieve inequality over number
  fields*, Math. Proc. Cambridge Philos. Soc. 154 (2013); Definition 1, Remark 3, Theorem 1.1, Corollary 1.2,
  §2.
- `bgl2014` — V. Blomer, L. Goldmakher, B. Louvel, *L-functions with n-th-order twists*, IMRN 2014;
  Theorem 1.3, Lemmas 2.1–2.3, §3, Appendix II.
- `heathbrown2000` — D. R. Heath-Brown, *Kummer's conjecture for cubic Gauss sums*, Israel J. Math. 120
  (2000); Theorem 2.
- `baierbansal2018` — S. Baier, A. Bansal, *The large sieve with power moduli for ℤ[i]*, IJNT 14 (2018);
  §3, Theorem 3.
- `gaozhao2024` — P. Gao, L. Zhao, *Moments and one level density of sextic Hecke L-functions of ℚ(ω)*,
  Funct. Approx. 70 (2024); Lemma 2.9.
- `gaozhao2020` — P. Gao, L. Zhao, *Moments of quadratic Hecke L-functions of imaginary quadratic number
  fields*, J. Number Theory 209 (2020); (1.1).
- `maynardpratt2024` — J. Maynard, K. Pratt, *Half-isolated zeros and zero-density estimates*, IMRN 2024;
  Appendix C.
- `guthmaynard2026` — L. Guth, J. Maynard, *New large value estimates for Dirichlet polynomials*, Ann. of
  Math. 203 (2026); §13.1.
- `milnecft2020` — J. S. Milne, *Class Field Theory*, v4.03 (2020); Chapter V, Example 3.2, p. 157,
  Theorem 3.5 and Remark 3.8, p. 158, and Example 3.10, p. 159; Chapter VIII, 5.3 and 5.5, p. 245.
- `lamzourilisound2015` — Y. Lamzouri, X. Li, K. Soundararajan, *Conditional bounds for the least
  quadratic non-residue and related problems*, Math. Comp. 84 (2015); Lemma 2.2, Theorem 1.1.
- `tao2015` — T. Tao, *The Elliott–Halberstam conjecture implies the Vinogradov least quadratic
  nonresidue conjecture*, Algebra Number Theory 9 (2015); Conjecture 1.1.
- `bimsissac2017` — V. Bhargava, G. Ivanyos, R. Mittal, N. Saxena, *Irreducibility and deterministic r-th
  root finding over finite fields*, ISSAC 2017 (arXiv v1); Conjecture 6.3, Theorem 6.7.
