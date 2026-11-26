# Roadmap: statements of the Riemann hypotheses and their consequences

**Summary.** This roadmap states the Riemann hypothesis of each L-function of
[ZerosOfLFunctions](../../ZerosOfLFunctions/README.md) as one predicate, proves its equivalent
forms, and draws the first consequences of a zero-free half-plane. A zero is a point of positive
meromorphic order, so poles are allowed and no value of a function is read: a function is
*zero-free right of `σ`* when every point with `Re s > σ` has order at most `0`. The Riemann
hypothesis of a Dirichlet character, of a Dedekind zeta function, of a ray-class character and of a
Grossencharacter is this predicate on the continued L-function, at `σ = 1/2` (shifted by the
weight for a Grossencharacter), and that of an analytic record says that every zero of its
completed function lies on the critical line. Beside the predicates the roadmap builds what the
consequences need: Riesz sums and the explicit formula for the Riesz remainder of a primitive
character, Selberg's smoothed formula for the logarithmic derivative, Riesz-smoothed character
sums through a surjection of a ray class group, and the primitive Dirichlet characters as a bundled
carrier, identified with the primitive ray-class characters of `ℚ`.

The headline theorems are these. (1) For a Dirichlet character `χ` modulo `N ≥ 1`, primitive or
not, the Riemann hypothesis for `χ` holds exactly when every zero of `L(s, χ)` in the open strip
`0 < Re s < 1` has real part `1/2`, exactly when no `L(s, χ)` with `Re s > 1/2` vanishes (the pole
of the principal character at `1` excepted), and exactly when it holds for the primitive character
inducing `χ`; for the principal character modulo any `N` it is Mathlib's `RiemannHypothesis`, which
holds exactly when `ζ` is zero-free right of `1/2`; and the hypothesis for every Dirichlet
character is the hypothesis for every primitive one. (2) If `χ` is a primitive Dirichlet character
whose L-function is zero-free right of `σ`, `1/2 ≤ σ < 1`, its Riesz remainder
`∑_{n ≤ y} Λ(n) χ(n) (y/n − 1) + y · L′/L(1, χ)` (at conductor one,
`∑_{n ≤ y} Λ(n) (y/n − 1) − y log y + (1 + γ) y`) is at most `C y^σ` in absolute value for
`y ≥ 2`. (3) Let `L` be the Dedekind zeta function of a number field `K` of degree `n`, or the
L-function of a primitive ray-class character of `K`, and let `L` be zero-free right of `σ₀`,
`1/2 ≤ σ₀ < 1`. Then there is `C`, depending only on `n` and `σ₀`, such that
`log |L(σ + it)| ≤ C log 𝔮/log log 𝔮` for every `σ ≥ σ₀` and every admissible height `t` (every
`t` when `L` is entire, `|t| ≥ 2` for a Dedekind zeta function) at which the analytic conductor
`𝔮` at `σ₀ + it` is at least `16`; in particular, under the Riemann hypothesis, `log |ζ(1/2 + it)| ≤ C log |t|/log log |t|` for
`|t| ≥ 16`, and, with an absolute `C`, every primitive `χ ≠ 1` modulo `q ≥ 3` satisfying its
hypothesis has `(C log log q)⁻¹ ≤ |L(1, χ)| ≤ C log log q` (Littlewood). (4) If the Dedekind zeta
function of a number field `K` is zero-free right of `σ`, `1/2 ≤ σ < 1`, then
`ψ_K(x) = x + O(x^σ log² x)` and `π_K(x) = Li x + O(x^σ log x)`, with constants that depend on `K`
and not on `σ`; at `ℚ` under the Riemann hypothesis this is von Koch's theorem.

The roadmap extends ZerosOfLFunctions, whose growth bounds, zero counts, Hadamard factorizations,
zero-free regions, argument bounds and explicit formulas the consequences use, and
[LFunctions](../../LFunctions/README.md), whose analytic records and continued Dedekind, Dirichlet
and Hecke L-functions the predicates are read on. The zero-free half-plane predicate and its first
properties are those of [QuasiRiemannHypothesis](../../QuasiRiemannHypothesis/README.md). Mathlib
supplies the continued Dirichlet L-functions, `riemannZeta` and `RiemannHypothesis`. In the family
[RiemannHypothesisForDirichletLFunctions](../README.md), the predicates, the Riesz remainders and
the remainder bound are the statements through which
[GeneralizedRiemannHypothesisFromWindowBounds](../GeneralizedRiemannHypothesisFromWindowBounds/README.md)
proves the Riemann hypothesis for Dirichlet L-functions, and the Riesz-smoothed character sums
enter the Frobenius-restricted sums of
[FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md).

Layer 3 states Hadamard's three-circles theorem, AnalyticNumberTheoryPartIII §8.2a, in the form
that 9.7 uses. Layer 8 defines Riesz sums and the Riesz remainder
of a primitive character with its Mellin transform and explicit formula, proves Selberg's smoothed
formula for the logarithmic derivative, states that the primitive characters attached to a
reciprocity dictionary do not depend on it (ZerosOfLFunctions §8.7a), and expands Riesz-smoothed
character sums through a
surjection of a ray class group. Layer 9 adds symmetries and a change of level to the zero-free
half-plane predicate, defines the Riemann hypotheses, proves their equivalent forms and their
bridges to Mathlib's `RiemannHypothesis`, and derives from a zero-free half-plane `Re s > σ`,
`1/2 ≤ σ < 1`, the absence of exceptional zeros, the bound for the Riesz remainder, bounds for `L`
and `1/L`, Lindelöf's and Littlewood's bounds, the argument of `L` and `S(T)`, and prime counts over
a number field, in a ray class and in the Frobenius classes of an abelian extension. Layer 10 proves
that the gamma factor of a Dirichlet character has no zero on `Re s > 0`, and bundles primitive
Dirichlet characters; Layer 11 identifies them with the primitive ray-class characters of `ℚ`, with
their L-functions and cards. The layer and section numbers are this roadmap's own. A bare section
number such as 8.8 is a section of this roadmap; a section of another roadmap is cited with that
roadmap's name, as in ZerosOfLFunctions §8.8. Layers 10 and 11 use no other layer of this roadmap
and may be read first.

## Conventions

Notation and conventions not restated here are those of ZerosOfLFunctions (its Conventions: the
analytic normalization, orders and divisors, the two counts, infinite sums, analytic conductors,
gamma factors, and uniformity as a quantifier order) and of LFunctions (its Conventions and
Layer 0: the analytic records `AnalyticLFunctionData` and their predicates).

- **Zeros and poles.** A zero of `f` is a point `ρ` with `0 < meromorphicOrderAt f ρ`, a pole a
  point of negative order. Mathlib's meromorphic functions are total and take junk values at
  poles, and Mathlib's order of a function that is not meromorphic at a point is the junk value
  `0`; no statement here reads a value at a pole, and meromorphy is a separate hypothesis wherever
  it matters.
- **The L-functions.** `χ.LFunction` is Mathlib's continued Dirichlet L-function, which needs
  `[NeZero N]`; `dedekindZetaC K` is the continued Dedekind zeta function and `heckeLFunctionC χ`
  the continued L-function of a ray-class character `χ` (LFunctions Layers 3 and 5), both in
  meromorphic normal form; `dedekindZetaData K`, `heckeData ψ`, `dirichletData χ hχ` and
  `riemannZetaData` are the records of LFunctions; *continuedL* `d` and *entireCompletion* `d` are
  those of ZerosOfLFunctions §1.6 and Layer 0, and *analyticConductorAt* `d s` that of
  ZerosOfLFunctions Layer 2.
- **The conductor instance.** Mathlib's `DirichletCharacter.LFunction` takes `[NeZero N]`, so every
  statement about `χ.primitiveCharacter.LFunction` uses the instance `NeZero χ.conductor` for
  `[NeZero N]` of CharacterSumsOverFiniteFields §7.1 (`instNeZeroConductor`, from Mathlib's
  `DirichletCharacter.conductor_ne_zero`). `Suggested.lean` declares the same instance as
  `DirichletCharacter.instNeZeroConductor`, since a roadmap's module is not imported.
- **Arithmetic functions.** `Λ` is the von Mangoldt function and `Λ_K` the ideal von Mangoldt
  function, `γ` is Euler's constant, `Li x = ∫_2^x dt/log t`, `ψ_K` and `π_K` are the Chebyshev
  function and the prime-ideal count of `K`.
- **Citations.** LFunctions has no numbered sections; it is cited by layer and by declaration
  name, as in "LFunctions Layer 5 (`heckeLFunctionC_eq`)".

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The definitions of 10.3 carry
the first label only. The statements of 3.2a, 8.4b, 8.8, 9.5–9.9 and 11.1 are not statements of
[FormalProof]: 3.2a and 8.8 state, in the form used here, published theorems whose homes are
AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §8.7a; 8.4b, 9.5, 9.7, 9.8, 9.9 and 11.1
adapt published theorems, cited with each; 9.6 is this roadmap's own formulation.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels,
`*Corollary of:*`, which names a general theorem and the roadmap section that states it, and the
clauses it covers when it does not cover the whole section. The general theorem is proved in the
roadmap that states it, and what the line covers is deduced from it. The proof of the Riemann
hypothesis for Dirichlet L-functions needs only that case, not the general theorem in full: the
`*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the
statement when that proof has a narrower one. Where the route given with the section is not the
deduction, it is a second proof, [FormalProof]'s unless the label says that it differs; the
`*Needs:*` line lists what that route needs, and the deduction needs the section that the
`*Corollary of:*` line names.

## Layer 3: Three-circles convexity for analytic functions

The growth bounds of 9.7 interpolate a logarithm between three circles. This layer states the
complex three-circles theorem on an annulus in the form 9.7 uses, from AnalyticNumberTheoryPartIII
§8.2a.

### 3.2a Hadamard's three-circles theorem

*Origin:* published: Robinson (1944), Hadamard's three-circles theorem, the inequality and the
convexity of `log M` in `log r`, used in Titchmarsh (1986), Chapter XIV (AnalyticNumberTheoryPartIII
§8.2a); the bound inside the disc is the maximum modulus principle.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `0 < r₁ < r₃` and let `f` be continuous on the closed annulus `r₁ ≤ ‖z − z₀‖ ≤ r₃` and
holomorphic on the open one (`DiffContOnCl` on `{z | r₁ < ‖z − z₀‖ < r₃}`), with `M(r)` the
supremum of `‖f‖` on `sphere z₀ r`. Then for every `r₂ ∈ [r₁, r₃]`,
`M(r₂) ≤ M(r₁)^{1 − θ} M(r₃)^θ` with `θ = log(r₂/r₁)/log(r₃/r₁)`; if `f` does not vanish
identically on the closed annulus, `M` is positive on `[r₁, r₃]` and `log M` is a convex function
of `log r` there. If `f` is moreover holomorphic on a neighbourhood of `closedBall z₀ r₃`, then
`‖f z‖ ≤ M(r₂)` for every `z ∈ closedBall z₀ r₂`.

The inequality and the convexity are Hadamard's three-circles theorem, AnalyticNumberTheoryPartIII
§8.2a (there with the radii `R₁, R₂, R₃`), and the bound inside the disc is the maximum modulus
principle on `closedBall z₀ r₂`, on whose frontier `sphere z₀ r₂` the norm of `f` is at most
`M(r₂)`.

*Needs:* AnalyticNumberTheoryPartIII §8.2a; Mathlib
`Complex.norm_le_of_forall_mem_frontier_norm_le`.

### Examples

For `f z = z − z₀` and the radii `1, 2, 4`, `M(r) = r`, the exponent is `θ = 1/2` and the
inequality is the equality `2 = 1^{1/2} 4^{1/2}`; for `f z = (z − z₀)⁻¹`, holomorphic on the
annulus and not on the disc, `M(r) = 1/r` and the inequality is an equality at every triple of
radii (3.2a).

### Dependencies

AnalyticNumberTheoryPartIII §8.2a; Mathlib's maximum modulus principle
`Complex.norm_le_of_forall_mem_frontier_norm_le`.

## Layer 8: Riesz sums, smoothed explicit formulas, abelian character sums

This layer weights prime sums by the Riesz kernel `1/(s(s − 1))`, proves the explicit formula for
the Riesz remainder of a primitive character (8.4a) and Selberg's smoothed formula for the
logarithmic derivative (8.4b), states that the primitive characters attached to a reciprocity
dictionary do not depend on the dictionary (8.8), and expands Riesz-smoothed sums over the primes
of a ray class through a surjection of the ray class group (8.8a). The routes run the contour
shift of ZerosOfLFunctions §8.2 for the L-functions involved.

### 8.4a Riesz sums and the explicit formula for the Riesz remainder

*Origin:* adapted from Ihara (2006) and Ihara, Murty and Shimura (2009): the explicit formula for
the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞`, for every primitive finite-order ray-class character `ψ`
of a number field (ZerosOfLFunctions §8.6a), with the Euler–Kronecker constant of Ihara (2006) at
the trivial character; here Riesz sums as an operator on coefficients, the Riesz remainder, its
Mellin transform as a meromorphic normal form with its value at `1`, the constants `A_ψ` and `B_ψ`,
and the size bounds.

*Method of the formal proof:* over `ℚ`, the Mellin transform of the remainder is computed term by
term from `∫_n^∞ (y/n − 1) y^(−s−1) dy = n^(−s)/(s(s − 1))`, the sum and the integral being
exchanged by absolute convergence, with the main terms integrated in closed form; the continuation
is the difference quotient at `1` of the bracket, divided by `s`, and its poles in `Re s > 0` come
from the local form `m/(s − ρ)` plus an analytic function of a logarithmic derivative at a zero.
The route written here is that proof's for these clauses, read for a primitive ray-class character
of a number field; it differs in that it also proves the inversion of (a), from ExplicitZetaBounds
§6.1a, and the explicit formula of (b) with the bound `C′_ψ y` of the remark, by the contour shift of
ZerosOfLFunctions §8.2. Of these [FormalProof] has the inversion of (a), for `y ≥ 1`, for the coefficients
`Λ(n)χ(n)` of a Dirichlet character `χ` and for `Λ(n)`
(`Formalism/LandauZeroFreeBounds/ExceptionalZeroBounds/PerronChi.lean` (`Formalism.ZeroFreeDirichlet.perron_formula_character`),
`Formalism/ZeroFreeRegion/ZetaLogDerivativeBounds/Perron.lean` (`Formalism.ZF.perron_formula`)), the explicit formula
of (b) in truncated forms for Dirichlet characters, with the zeros near the line `Re s = 1` and an error term
(`Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/PNTExplMain.lean`
(`Formalism.HermitianLattices.Ext.PrimesInProgressions.smoothed_explicit_formula`),
`Formalism/LandauZeroFreeBounds/SiegelWalfiszAPOfSiegelLower.lean` (`Formalism.ZeroFreeDirichlet.smoothChi`)), and
the bound only for the trivial character of `ℚ`.

*Corollary of:* ZerosOfLFunctions §8.6a (the explicit formula for the first Riesz mean of
`Λ_K(𝔞) ψ(𝔞)/𝔑𝔞` of a primitive finite-order ray-class character `ψ` of a number field), for the
explicit formula of (b), with the summability of its zero sum and the bound `C′_ψ y` of the remark, and, through
the Mellin transform of (b), for the poles of `Φ_ψ` on `Re s > 0` with their residues; (a), and in
(b) the conjugation, the Mellin transform, the value at `1` and the bound `C_ψ y²`, are not
corollaries of it.

**(a) Riesz sums.** For `a : ℕ → ℂ` and real `y`, define `rieszSum a y` as
`∑_{1 ≤ n ≤ y} a(n) (y/n − 1)`, the sum over `Finset.Icc 1 ⌊y⌋₊`, which is `0` for `y < 1`. It is
`y` times the first Riesz mean of the sequence `a(n)/n`. For coefficients of the form `Λ(n) f(n)` it is
[FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.ramp`); its case
`f = χ` is `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean`
(`Formalism.HC.An.sumLamChi`), and its case `f = 1` is the real-valued `Formalism/StatementOC.lean` (`Formalism.Sz`).

- `y ↦ rieszSum a y` is continuous on `ℝ`, affine on each `[n, n + 1]`, and `0` on `(−∞, 1]`.
- Normalization: for `y > 0`, `∑_{1 ≤ n ≤ y} a(n) (1 − n/y) = y⁻¹ · rieszSum (fun n ↦ n · a n) y`,
  so the classical first Riesz mean of `a` is a Riesz sum and is not defined separately.
- If `LSeriesSummable a σ` for a real `σ ≥ 1`, then `‖rieszSum a y‖ ≤ y^σ ∑_n ‖a(n)‖ n^(−σ)` for
  `y ≥ 1`, since `0 ≤ y/n − 1 ≤ (y/n)^σ` for `1 ≤ n ≤ y`.
- Mellin transform: if `LSeriesSummable a σ` for every `σ > 1`, then for `Re s > 1` the function
  `y ↦ rieszSum a y · y^(−s−1)` is integrable on `(1, ∞)` and
  `∫_1^∞ rieszSum a y · y^(−s−1) dy = LSeries a s/(s(s − 1))`.
- Inversion: under the same hypothesis, for `c > 1` and `y > 0`,
  `rieszSum a y = (2πi)⁻¹ ∫_{c−i∞}^{c+i∞} LSeries a s · y^s/(s(s − 1)) ds`, the integral absolutely
  convergent. This is the case `j = 1` of ExplicitZetaBounds §6.1a, applied to the coefficients
  `n ↦ a(n)/n` after the shift `s = w + 1`.
- Ideal coefficients: for a coefficient function `b` on the nonzero ideals of `𝓞 K`,
  `∑_{𝔑𝔞 ≤ y} b(𝔞) (y/𝔑𝔞 − 1) = rieszSum (normCoeff b) y`; no second Riesz sum is defined.

Route: termwise, from `∫_n^∞ (y/n − 1) y^(−s−1) dy = n^(−s)/(s(s − 1))` for `Re s > 1`, which is
[FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/MellinRamp.lean` (`Deduction.mellin_ramp`).
The inversion: with `b(n) = a(n)/n` and `s = w + 1`, `LSeries a s = LSeries b w`, the kernel is
`y^{w+1}/(w(w + 1))`, and `b` is absolutely summable on `Re w > 0`, so ExplicitZetaBounds §6.1a at
`j = 1`, `x = y` and the line `Re w = c − 1 > 0` gives `∑_{n ≤ y} b(n)(y − n) = rieszSum a y`.
The normalization:
`n a(n) (y/n − 1) = y a(n) (1 − n/y)`.

**(b) The remainder of a primitive character.** Write `EK(K)` for the Euler–Kronecker constant
of `K` (ZerosOfLFunctions §8.6a: the constant term of `logDeriv (dedekindZetaC K)` at its simple
pole `s = 1`, so that `logDeriv (dedekindZetaC K) s = −1/(s − 1) + EK(K) + O(s − 1)` there);
`EK(ℚ)` is Euler's constant `γ`. For
`ψ : PrimitiveRayClassCharacter K` write `L_ψ = heckeLFunctionC ψ.character` and `a_ψ` for the
norm coefficients of `𝔞 ↦ Λ_K(𝔞) ψ(𝔞)`, `Λ_K` the ideal von Mangoldt function; they are the
coefficients of `−logDeriv L_ψ` on `Re s > 1` (ArithmeticDirichletSeries §2.3). Define
*PrimitiveRayClassCharacter.rieszRemainder* `ψ y` as

- `rieszSum a_ψ y + y · logDeriv L_ψ 1` for `ψ ≠ 1`, and
- `rieszSum a_1 y − y log y + (1 + EK(K)) y` for `ψ = 1`.

For a primitive Dirichlet character `χ` (`PrimitiveDirichletCharacter`, 10.3),
`PrimitiveDirichletCharacter.rieszRemainder χ y` is the same with the coefficients
`Λ(n) χ(n)` and `logDeriv χ.LFunction 1`, and at level `1` with `Λ(n)` and `−y log y + (1 + γ) y`;
it equals the remainder of the primitive ray-class character of `ℚ` attached to `χ`
(*toPrimitiveRayClassCharacter*, 11.1, whose L-functions agree with those of `χ`).
The Dirichlet remainder agrees on primitive characters with [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean` (`Formalism.HC.An.gChi`) and
`Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.Gchi`). Both are defined for every
character modulo `N` and branch on `χ = 1`; for the principal character modulo `N > 1` the first uses the coefficients
`Λ(n)` and the second `Λ(n) χ(n)`, so they differ there. At level `1` it is
`Formalism/StatementOC.lean` (`Formalism.Gz`), which is real-valued, cast to `ℂ`.
`Λ(ψ, ·)` denotes the completed function of the record `heckeData ψ`.

- Conjugation: `rieszRemainder ψ⁻¹ y = conj (rieszRemainder ψ y)`, from the conjugate coefficients
  and `L_{ψ⁻¹}(s) = conj L_ψ(conj s)` near `s = 1`, which holds on `Re s > 1` and extends by
  uniqueness of continuation; for real `ψ` the remainder is real. Over `ℚ` it is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/GchiConj.lean` (`Deduction.Gchi_conj`).
- Mellin transform: let `Q_ψ` be the quotient
  `Q_ψ(s) = −[logDeriv L_ψ s − s · logDeriv L_ψ 1]/(s(s − 1))` for `ψ ≠ 1` and
  `Q_1(s) = −[logDeriv ζ_K s + 1/(s − 1) + 1 − (1 + EK(K)) s]/(s(s − 1))`, and write `Φ_ψ` for
  its meromorphic normal form `toMeromorphicNFOn Q_ψ univ`, which is
  `TauCeti.meromorphicContinuation 1 Q_ψ`. On `Re s > 1` the quotient is analytic, `Φ_ψ = Q_ψ`
  there, and `∫_1^∞ rieszRemainder ψ y · y^(−s−1) dy = Φ_ψ(s)`. Over `ℚ` this transform is [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/mellinGchiModOne.lean` (`Deduction.mellin_Gchi_modOne`) and
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/mellinGchiOfNeOne.lean`
  (`Deduction.mellin_Gchi_of_ne_one`).
- Continuation and poles: `Φ_ψ` is meromorphic on `ℂ`, with the punctured germ of `Q_ψ` at every
  point. It is analytic at `1`, where `Q_ψ` has a removable singularity, with value
  `Φ_ψ(1) = D(1) − D′(1)` for `ψ ≠ 1`, `D = logDeriv L_ψ`, and `Φ_1(1) = 1 + EK(K) − c₁(K)`, where
  `logDeriv ζ_K s = −1/(s − 1) + EK(K) + c₁(K)(s − 1) + O((s − 1)²)` at `1`; at `K = ℚ`,
  `Φ_1(1) = 1 + γ + γ² + 2γ₁`, `γ₁` the first Stieltjes constant. The total function `Q_ψ` itself
  takes the value `0` at `1`, its denominator vanishing there, so it is not analytic at `1` when
  that limit is not `0`; only `Φ_ψ` is. On `Re s > 0` the poles of `Φ_ψ` are exactly the zeros `ρ`
  of `L_ψ`, each simple with residue `m_ρ/(ρ(1 − ρ))`, `m_ρ = meromorphicOrderAt L_ψ ρ`. Over `ℚ` the
  analyticity at `1` and the poles with their residues follow from [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/poleData.lean` (`Deduction.poleData_char`),
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LogDerivLocal.lean` (`Deduction.logDeriv_local`).
- Explicit formula: for `y ≥ 1`,
  `rieszRemainder ψ y = ∑'_ρ m_ρ y^ρ/(ρ(1 − ρ)) + E_ψ(y)`, the sum over the zeros of the completed
  function `Λ(ψ, ·)` with `m_ρ = (divisor Λ(ψ, ·) univ ρ).toNat`, absolutely summable; `E_ψ(y)` is
  the sum of the residues of `Φ_ψ(s) y^s` at `s = 0` and at the trivial zeros, and
  `E_ψ(y) = A_ψ + B_ψ log y + O_ψ(1/y)` for `y ≥ 2`, where `B_ψ` is the order of `L_ψ` at `0` and
  `A_ψ` a constant.
- Size: there is `C_ψ` with `‖rieszRemainder ψ y‖ ≤ C_ψ y²` for `y ≥ 1`: each of the at most `y` terms of
  the Riesz sum is at most `[K:ℚ] y` in absolute value, since `‖a_ψ(m)‖ ≤ [K:ℚ] Λ(m) ≤ [K:ℚ] m` and
  `0 ≤ y/m − 1 ≤ y/m`, and the main terms are at most a constant times `y²`. This bound makes the Mellin
  transform of the remainder converge absolutely on `Re s > 2`, and it is the only growth input of the
  windowed Landau argument.

At `K = ℚ` and `ψ = 1`: `rieszRemainder 1 y = ∑_{n ≤ y} Λ(n)(y/n − 1) − y log y + (1 + γ) y` and
`E(y) = log 2π − ∑_{k ≥ 1} y^(−2k)/(2k(2k + 1))`.

*Remark.* Sharper, there is `C′_ψ` with `‖rieszRemainder ψ y‖ ≤ C′_ψ y` for `y ≥ 1`, by the explicit formula
(`‖y^ρ‖ ≤ y` on the closed strip). This sharper form is this roadmap's own: [FormalProof] states it only for the trivial
character of `ℚ` (`Formalism/StatementU.lean` (`Formalism.GzLipschitz`), proved as
`Formalism/ZetaNonvanishing/GzLipschitz.lean` (`Formalism.zetaPrimeSumErrorLipschitz`)), and no later statement of this
roadmap uses it.

Route. The Mellin transform: (a), with `∫_1^∞ y · y^(−s−1) dy = 1/(s − 1)` and
`∫_1^∞ y log y · y^(−s−1) dy = 1/(s − 1)²`. The bracket vanishes at `s = 1` by the definitions of
`logDeriv L_ψ 1` (`L_ψ` is analytic and nonzero at `1` for `ψ ≠ 1`, LFunctions Layer 7) and of
`EK(K)`, so `Q_ψ` is bounded near `1`, its singularity there is removable, and its normal form
`Φ_ψ` is analytic at `1` with the limit as value: the denominator is `(s − 1)(1 + (s − 1))`, and
the expansions `D(s) = D(1) + D′(1)(s − 1) + O((s − 1)²)` and that of `logDeriv ζ_K` at `1` give
`D(1) − D′(1)` and `1 + EK(K) − c₁(K)`. At a zero `ρ ≠ 0` of order `m`, `logDeriv L_ψ` is
`m/(s − ρ)` plus a function analytic at `ρ` (`TauCeti.Contour.logDeriv_eventuallyEq_principalPart`).
The explicit formula, first for `y > 1`: the inversion of (a) at `c = 2`, then the contour shift of
ZerosOfLFunctions §8.2 run for `L_ψ` in place of `ζ_K`, to `Re s = −(2M + 1/2)` at the heights chosen there,
`M → ∞`: on those heights `logDeriv L_ψ = O(log² T)` (ZerosOfLFunctions §§5.6, 1.4, 4.5) and the kernel is
`O(T^(−2))`, so the horizontal edges vanish in the limit, and on the far left `logDeriv L_ψ` grows
at most logarithmically (ZerosOfLFunctions §§1.4a, 1.4) against the factor `y^{−2M − 1/2}`, which tends to `0` for
`y > 1`. Then let `y ↓ 1`: the left side is continuous in `y` ((a)); on `1 ≤ y ≤ 2` the zero terms
are bounded by `2 m_ρ/‖ρ(1 − ρ)‖`, summable (below), and the residue terms at the negative
trivial zeros `−j` by `C_K/(j(j + 1))`, `C_K` a bound for their multiplicities, so the right side
is continuous on `[1, 2]` and the formula holds at `y = 1`. The zero sum converges absolutely: no
zero lies at `0` or `1` (ZerosOfLFunctions §6.5), finitely many have `|Im ρ| < 1`
(ZerosOfLFunctions §4.5), and
`|ρ(1 − ρ)| ≥ (1 + (Im ρ)²)/2` for `|Im ρ| ≥ 1` on the closed strip, so ZerosOfLFunctions §5.6a applies. The size
bound: termwise, as stated. The remark: from `‖y^ρ‖ ≤ y` on the closed strip.

*Needs:* 10.3 (`PrimitiveDirichletCharacter`); 11.1 (*toPrimitiveRayClassCharacter*, the
comparison of its L-functions, and of its cards up to the normal form of the completed function
at conductor one); ZerosOfLFunctions §§8.2, 1.4, 1.4a, 4.5, 5.6, 5.6a, 6.5; ExplicitZetaBounds §6.1a
(the inversion of (a)); LFunctions Layer 3
(`dedekindZetaC`, `meromorphicOrderAt_dedekindZetaC_one`), Layer 5 (`heckeLFunctionC_eq`),
Layer 7 (`heckeLFunction_ne_zero_of_one_le_re`); ArithmeticDirichletSeries §2.3
(`TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform`) and
`TauCeti.normCoeff`; Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous`,
`TauCeti.Contour.logDeriv_eventuallyEq_principalPart`, `TauCeti.meromorphicContinuation`; Mathlib
`toMeromorphicNFOn`, `LSeries`, `LSeriesSummable`,
`ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`,
`DirichletCharacter.LSeries_twist_vonMangoldt_eq`, `Real.eulerMascheroniConstant`.

**Checks.**

- `a(1) = 1`, `a(n) = 0` for `n ≥ 2`: `rieszSum a y = y − 1` for `y ≥ 1`, and
  `∫_1^∞ (y − 1) y^(−s−1) dy = 1/(s − 1) − 1/s = 1/(s(s − 1))`, which is `LSeries a s/(s(s − 1))`.
- The classical first Riesz mean `∑_{n ≤ y} a(n)(1 − n/y)` has the kernel `1/(s(s + 1))`, with
  poles at `0` and `−1`; for `a = Λ` its main term is `y/2`, while that of `rieszSum Λ` is
  `y log y − (1 + γ) y`. The normalization bullet identifies the first with
  `y⁻¹ rieszSum (n ↦ n Λ(n))`; the two remainders are not interchangeable.
- At `K = ℚ`, `ψ = 1`, `y = 1`: the left side is `rieszRemainder 1 1 = 1 + γ`. On the right,
  `∑_ρ 1/(ρ(1 − ρ)) = 2 ∑_ρ Re(1/ρ) = 2 + γ − log 4π` (the value in the Checks of ZerosOfLFunctions §5.6 for
  `zetaEntireCompletion`), and `∑_{k ≥ 1} 1/(2k(2k + 1)) = 1 − log 2`, so the right side is
  `(2 + γ − log 4π) + log 2π − 1 + log 2 = 1 + γ`. A sign error in the main term
  `−y log y + (1 + γ) y`, or a kernel with residues `−1` at `1` and `+1` at `0`, fails this.
- The value at `1`: at `K = ℚ`, `ψ = 1`, `Φ_1(1) = 1 + γ + γ² + 2γ₁ = 1.7647618977…`, the limit of
  `Q_1` at `1`, while the total function `Q_1` is `0` there. For `ψ` the character of `ℚ` attached
  to `χ₋₄`, `D(1) = L′/L(1, χ₋₄) ≈ 0.245610` and `Φ_ψ(1) = D(1) − D′(1) ≈ 0.502193`. A clause
  "`Q_ψ` is analytic at `1`" is false for both; a consumer that needs the transform analytic at
  `1` reads `Φ_ψ`.
- At `K = ℚ`: for an even primitive `χ ≠ 1`, `L(0, χ) = 0` and `B_χ = 1`; for an odd `χ`,
  `L(0, χ) ≠ 0` and `B_χ = 0`.

### 8.4b Selberg's smoothed formula for the logarithmic derivative

*Origin:* adapted from Titchmarsh (1986), Chapter XIV: Selberg's smoothed formula for `ζ′/ζ`
(ZerosOfLFunctions §8.4a); here for the Dedekind zeta function and for the L-function of a
primitive ray-class character of a number field, by the same contour argument.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `d` be `dedekindZetaData K` or `heckeData ψ` for a primitive `ψ`, `L = continuedL d`, `a_L(m)`
the coefficients of `−logDeriv L` on `Re s > 1` (the norm coefficients of `Λ_K` or of `Λ_K ψ`, as
in 8.4a), and `κ = 1` if `L = dedekindZetaC K`, `κ = 0` otherwise. For `x > 1` define
*selbergWeight* `x m` as `1` for `1 ≤ m ≤ x`, `log(x²/m)/log x` for `x < m ≤ x²`, and `0` for
`m > x²`. Then for every `s` at which `L` has neither a zero nor a pole,

```text
−logDeriv L s = ∑_{m ≤ x²} a_L(m) selbergWeight x m · m^(−s) − κ (x^{2(1−s)} − x^{1−s})/((1 − s)² log x)
                + (log x)⁻¹ ∑'_ρ m_ρ (x^{2(ρ−s)} − x^{ρ−s})/(ρ − s)²,
```

the last sum over all zeros `ρ` of `L`, the trivial ones included, with
`m_ρ = meromorphicOrderAt L ρ`, absolutely summable (Titchmarsh, Chapter XIV, for `ζ`).
For `d = dedekindZetaData ℚ`, where `L = dedekindZetaC ℚ` agrees with `riemannZeta` off `1`, this
is Selberg's formula for `ζ′/ζ`, ZerosOfLFunctions §8.4a, whose *selbergSmoothingWeight* is
*selbergWeight*.

Route. For `y > 0` and `c > 0`, `(2πi)⁻¹ ∫_{(c)} y^w dw/w² = max(log y, 0)`: shift the line right
when `y < 1` and left when `y > 1`, collecting `log y` at the double pole, the integrand being
`O(|w|^{−2})`. Hence, for `c > max(0, 1 − Re s)`, `(2πi)⁻¹ ∫_{(c)} (−logDeriv L)(s + w) K_x(w) dw`
with `K_x(w) = (x^{2w} − x^w)/(w² log x)` is the finite prime sum, by Fubini, since the Dirichlet
series of `−logDeriv L` converges absolutely on `Re (s + w) = Re s + c > 1` and
`max(log(x²/m), 0) − max(log(x/m), 0) = log x · selbergWeight x m`. Shift the line to
`Re w = −(2M + 1/2) − Re s`, across the rectangle with horizontal edges at the heights of ZerosOfLFunctions §8.2, where
`logDeriv L = O(log² T)` (ZerosOfLFunctions §§5.6, 1.4, 4.5) while `K_x = O(x^{2c}/T²)`, and let `T` and `M` tend to
`∞`: on the far left `logDeriv L (s + w)` grows at most like `log(|w| + 2)` (ZerosOfLFunctions §§1.4a, 1.4) against
`‖x^w‖ = x^{−(2M + 1/2) − Re s}`. The residues: at `w = 0` the kernel is
`1/w + (3/2) log x + O(w)`, a simple pole of residue `1`, which gives `−logDeriv L s`; at
`w = 1 − s` (when `κ = 1`) `−logDeriv L` has residue `1`, which gives `K_x(1 − s)`; and at
`w = ρ − s` it has residue `−m_ρ`, which gives `−m_ρ K_x(ρ − s)`
(`TauCeti.Contour.logDeriv_eventuallyEq_principalPart`). The zero sum converges absolutely:
`‖K_x(ρ − s)‖ ≤ (x^{2(Re ρ − Re s)} + x^{Re ρ − Re s})/(‖ρ − s‖² log x)`, the nontrivial zeros
satisfy ZerosOfLFunctions §5.6a, and the trivial zeros, at `−μ − 2k` for the gamma shifts `μ ∈ {0, 1}`, give a
convergent geometric series.

*Needs:* ZerosOfLFunctions §8.2 (the heights and the edge bounds), ZerosOfLFunctions §§1.4, 1.4a,
4.5, 5.6, 5.6a and Layer 0 *entireCompletion*; LFunctions Layer 8 (`dedekindZeta_logDeriv_eq`) and
ArithmeticDirichletSeries §2.3 for the coefficients; Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous`,
`TauCeti.Contour.logDeriv_eventuallyEq_principalPart`.

**Checks.**

- The kernel has a simple pole at `0` because its numerator vanishes there; the kernel
  `x^w/(w² log x)` would have a double pole, whose residue `−logDeriv L s − (logDeriv L)'(s)/log x`
  brings in the derivative of `logDeriv L`.
- For `Re s > 1` and `x → ∞` the weights tend to `1` and the pole and zero terms to `0`
  (`Re (1 − s) < 0` and `Re (ρ − s) < 0`), so the formula tends to the Dirichlet series of
  `−logDeriv L s`.
- `ζ`, `s = 2`, `x = 2`: the weights are `1` at `m = 2`, `log(4/3)/log 2 ≈ 0.4150` at `m = 3` and
  `0` at `m = 4`, so the prime sum is `(log 2)/4 + (log 3)(log(4/3))/(9 log 2) ≈ 0.22395`, and the
  pole term contributes `−(4^{−1} − 2^{−1})/log 2 = 1/(4 log 2) ≈ 0.36067`: together `0.58462`,
  against `−ζ'/ζ(2) ≈ 0.56996`. The zero terms make up the difference `−0.01466`: each nontrivial
  term is at most `(1/4 + 1/2)/(‖ρ − 2‖² log 2)` on the critical strip, with
  `∑_ρ ‖ρ − 2‖^{−2} ≤ ∑_ρ ‖ρ‖^{−2} < 0.047` (about twice the sum of the Check of ZerosOfLFunctions §5.6, no zero having
  ordinate below `14`), and the trivial zeros give about `−0.0060`, so the zero terms are at most
  `0.06` in absolute value. A pole term of the opposite sign would leave a gap of `0.707`.

### 8.8 Primitive characters independent of the reciprocity dictionary

*Origin:* published: Milne (2020), Introduction and Chapter V, §3: two reciprocity dictionaries of an
abelian extension induce the same primitive ray-class characters, a case of the fact that characters
which agree on the ideals prime to a larger set of primes have one primitive character
(ZerosOfLFunctions §8.7a).

*Method of the formal proof:* none; the statement is not in [FormalProof].

ZerosOfLFunctions §8.8 shows that its exceptional term *exceptionalChebotarevTerm* does not depend
on the reciprocity dictionary through the fact that two dictionaries induce the same primitive
characters: if `Φ` at
`𝔪` and `Φ′` at `𝔪′` are two reciprocity dictionaries for `L/K` and `ψ` is a character of
`L ≃ₐ[K] L`, then
`PrimitiveRayClassCharacter.of (ψ.comp Φ) = PrimitiveRayClassCharacter.of (ψ.comp Φ′)`. This is
*PrimitiveRayClassCharacter.of_comp_dictionary_eq*, ZerosOfLFunctions §8.7a. The two theorems on
the exceptional term itself, its expression as the sum of *exceptionalRayClassTerm* over the fibre
`Φ⁻¹(σ_C)` and its independence of the dictionary, are ZerosOfLFunctions §8.8's.

*Needs:* ZerosOfLFunctions §8.7a (the theorem), §8.8 (the reciprocity dictionaries and their
splitting laws); LFunctions Layer 5 (`PrimitiveRayClassCharacter.of`).

### 8.8a Riesz-smoothed character sums through a surjection of a ray class group

*Origin:* adapted from Davenport (2000), §20, Ihara (2006), and Ihara, Murty and Shimura (2009):
orthogonality of characters for prime sums in a class, the sum over prime powers with the weight
`(y/𝔑𝔭^k − 1) log 𝔑𝔭` and the Euler–Kronecker constant, and the first Riesz mean of one character
with its constant `logDeriv L_ψ 1`; here the expansion of such a sum through a surjection of a ray
class group of a number field into the Riesz remainders of the primitive characters (8.4a(b)), for
every `f`, with the term `D_f`, its bound and the Frobenius reading, which is this roadmap's own
formulation of the identity that [FormalProof] has over `ℚ`.

*Method of the formal proof:* [FormalProof] has the identity in one form
(`Deduction.ch_balance`): for `K = ℚ` and the group of an abelian
CM field, given by a Frobenius element and an inertia subgroup at each prime, summed with weights
over the indicators `f` of the elements outside the CM type of the field, with the values of the
primitive characters at the primes dividing the modulus in the coefficients, so that it has no term
`D_f` and no bound, and with the constants `logDeriv L_{ψ_Φ} 1` of the main terms as free
parameters. It expands the sum by orthogonality on the group, the value of a primitive character at
a prime power entering as the mean of the character over a coset of the inertia subgroup (the
subgroup `H_𝔭` of the route below), and the definitions of the Riesz remainders (8.4a(b)) then
separate the main terms. The route written here is the same expansion for a general surjection and
a general `f`, with the terms at the primes dividing `𝔪` collected in `D_f`.

Let `𝔪` be a modulus of `K`, `G` a finite abelian group and `Φ : RayClassGroup 𝔪 →* G` a
surjective homomorphism. For `f : G → ℂ` define *rayClassRieszSum* `Φ f y` as the sum, over the
nonzero prime ideals `𝔭 ∤ 𝔪` and the integers `k ≥ 1` with `𝔑𝔭^k ≤ y`, of
`log 𝔑𝔭 · f(Φ(idealClass 𝔪 𝔭)^k) · (y/𝔑𝔭^k − 1)`. For a character `ψ` of `G` put
`f̂(ψ) = (#G)⁻¹ ∑_{g ∈ G} f(g) conj ψ(g)` and `ψ_Φ = PrimitiveRayClassCharacter.of (ψ ∘ Φ)`, the
primitive source of the ray-class character `ψ ∘ Φ` modulo `𝔪`, with `L_{ψ_Φ}` and
`rieszRemainder ψ_Φ` as in 8.4a(b). Then for `y ≥ 1`

```text
rayClassRieszSum Φ f y = f̂(1) (y log y − (1 + EK(K)) y) − y ∑_{ψ ≠ 1} f̂(ψ) logDeriv L_{ψ_Φ} 1
                         + ∑_ψ f̂(ψ) rieszRemainder ψ_Φ y − D_f(y),
```

where `D_f(y) = ∑_ψ f̂(ψ) ∑_{𝔭 ∣ 𝔪, k ≥ 1, 𝔑𝔭^k ≤ y} log 𝔑𝔭 · ψ_Φ(𝔭)^k (y/𝔑𝔭^k − 1)`, `ψ_Φ(𝔭)` being
the value of the primitive character at `𝔭` (`0` when `𝔭` divides its conductor), and

`‖D_f(y)‖ ≤ ‖f‖_∞ · y · ∑_{𝔭 ∣ 𝔪} log 𝔑𝔭/(𝔑𝔭 − 1)`.

**Frobenius reading.** Let `L/K` be a finite Galois extension with group `G` and `Φ` a reciprocity
dictionary at `𝔪` (ZerosOfLFunctions §8.8), so that `G` is abelian. Define *frobeniusRieszSum* `𝔪 f y` as the sum,
over the nonzero prime ideals `𝔭 ∤ 𝔪` unramified in `L` and the integers `k ≥ 1` with
`𝔑𝔭^k ≤ y`, of `log 𝔑𝔭 · f(Frob_𝔭^k) · (y/𝔑𝔭^k − 1)`. If every prime of `K` ramified in `L`
divides `𝔪`, then `frobeniusRieszSum 𝔪 f y = rayClassRieszSum Φ f y`, which satisfies the
identity above: the two sums then run over the same primes, and at each of them
`Φ(idealClass 𝔪 𝔭) = Frob_𝔭` by the splitting law of ZerosOfLFunctions §8.8. The condition holds when `Φ` is the ray-class
Artin map at an admissible modulus, for instance at `abelianConductor K L` (Tau Ceti
`IsAdmissibleModulus.mem_support_of_ramified`). Without it a prime `𝔭 ∤ 𝔪` ramified in `L` is in
the ray-class sum and not in the Frobenius sum, and the splitting law of ZerosOfLFunctions §8.8 says nothing at it. The
sum over all unramified primes is `frobeniusRieszSum 𝔪 f y` plus the terms of the unramified
primes dividing `𝔪`, which the identity does not contain.

Route. Orthogonality on `G` gives `f = ∑_ψ f̂(ψ) ψ`, so `rayClassRieszSum Φ f y` is
`∑_ψ f̂(ψ)` times the Riesz sum of the coefficients of `ψ ∘ Φ` presented at `𝔪`. Those
coefficients differ from the coefficients of `ψ_Φ` exactly at the powers of the primes `𝔭 ∣ 𝔪` at
which `ψ_Φ` does not vanish; that difference is `D_f`. Since `Φ` is surjective, `ψ_Φ = 1` exactly
when `ψ = 1`, and the definitions of 8.4a(b) give the main terms. For the bound fix `𝔭 ∣ 𝔪` and
let `𝔪_𝔭` be `𝔪` with the `𝔭`-part of its finite part removed. The `ψ` with `ψ_Φ(𝔭) ≠ 0` are those
for which `ψ ∘ Φ` is induced from a character modulo `𝔪_𝔭`
(`RayClassCharacter.conductor_dvd_iff`), a subgroup `A_𝔭` of the characters of `G`, the
annihilator of a subgroup `H_𝔭`; for them `ψ_Φ(𝔭) = ψ(g_𝔭)` for one `g_𝔭 ∈ G` determined modulo
`H_𝔭`, the image under `Φ` of a class modulo `𝔪` that maps to the class of `𝔭` modulo `𝔪_𝔭`.
Hence `∑_{ψ ∈ A_𝔭} f̂(ψ) ψ(g_𝔭)^k` is the mean of `f` over the coset `g_𝔭^k H_𝔭`, of norm at most
`‖f‖_∞`, and `∑_{k ≥ 1} log 𝔑𝔭 · y/𝔑𝔭^k = y log 𝔑𝔭/(𝔑𝔭 − 1)`.

*Needs:* 8.4a, ZerosOfLFunctions §8.8 (for the Frobenius reading); GlobalNumberFields
`RayClassCharacter.induced`,
`RayClassCharacter.conductor_dvd_iff`; LFunctions Layer 5 `PrimitiveRayClassCharacter.of`;
orthogonality of the characters of a finite abelian group; for the ramification condition at an
admissible modulus, ClassFieldTheory Layer 13 with Tau Ceti
`TauCeti.ClassFieldTheory.IsAdmissibleModulus.mem_support_of_ramified`.

**Checks.**

- `𝔪 = 1`, `G` trivial, `f = 1`: `D_f = 0`, and the identity is the definition of
  `rieszRemainder 1` in 8.4a(b).
- `K = ℚ`, `L = ℚ(i)`, `𝔪 = (4)∞`, `Φ` the isomorphism `(ℤ/4)ˣ ≅ G`, `f` the indicator of complex
  conjugation `τ`: `f̂(1) = 1/2` and `f̂(χ₋₄) = −1/2`, so the main terms are
  `(1/2)(y log y − (1 + γ) y) + (y/2) logDeriv L(·, χ₋₄) 1`, and the left side counts `p ≡ 3 (mod 4)`
  with odd `k` only, as `(1/2)(1 − (−1)^k)` requires. The prime `2` divides `𝔪`: `χ₋₄` vanishes at
  `2` and the trivial character does not, so `D_f(y) = (1/2) ∑_{2^k ≤ y} log 2 (y/2^k − 1)`, at most
  `(1/2) y log 2`, within the bound `y log 2`.
- A sum over the `𝔭^k` prime to `𝔪` in place of `𝔭 ∤ 𝔪` is the same sum, but one over the `𝔭^k`
  with `𝔭^k ∤ 𝔪` would add the powers of the primes dividing `𝔪` beyond their exponent in `𝔪`,
  at which `f(Φ(·))` is not defined.
- The modulus stays in the Frobenius sum: `K = L = ℚ`, `𝔪 = (2)`, `Φ` trivial, `f = 1`, `y = 3`.
  The ray-class sum runs over the odd primes and is `log 3 · (3/3 − 1) = 0`; a sum over all
  unramified primes also takes `2`, unramified in `L`, and is `log 2 · (3/2 − 1) = (log 2)/2`.

### Examples

- For `a(1) = 1` and `a(n) = 0` for `n ≥ 2`, `rieszSum a y = y − 1` for `y ≥ 1`, with Mellin
  transform `1/(s(s − 1))` (8.4a).
- At `K = ℚ`, `ψ = 1` and `y = 1`, both sides of the explicit formula equal `1 + γ`: the zero sum
  is `2 + γ − log 4π` and the residue terms give `log 2π − 1 + log 2` (8.4a).
- For `ζ` at `s = 2` and `x = 2`, the prime sum of Selberg's formula is about `0.22395` and the pole
  term about `0.36067`, against `−ζ′/ζ(2) ≈ 0.56996`; the zero terms make up the difference
  `−0.01466` (8.4b).
- For `K = ℚ`, `L = ℚ(i)`, `𝔪 = (4)∞` and `f` the indicator of complex conjugation,
  `f̂(1) = 1/2`, `f̂(χ₋₄) = −1/2`, and the prime `2`, which divides `𝔪`, contributes
  `D_f(y) = (1/2) ∑_{2^k ≤ y} log 2 (y/2^k − 1)`, within the bound `y log 2` (8.8a).

### Dependencies

ZerosOfLFunctions §§1.4, 1.4a, 4.5, 5.6, 5.6a, 6.5 and 8.2, and Layer 0 (*entireCompletion*);
ZerosOfLFunctions §8.8 for 8.8 and 8.8a, and §8.7a for 8.8. 8.4a additionally ArithmeticDirichletSeries §2.3 (the
coefficients of `−logDeriv` of a ray-class L-function), ExplicitZetaBounds §6.1a (the inversion of
Riesz sums), LFunctions Layers 3, 5 and 7, and 10.3
and 11.1 of Layers 10 and 11, which use nothing of this layer, and ZerosOfLFunctions §8.6a, the
general theorem of which its explicit formula is a corollary; 8.4b LFunctions Layer 8
(`dedekindZeta_logDeriv_eq`) and ArithmeticDirichletSeries §2.3, and ZerosOfLFunctions §8.4a, cited
for its case `ζ`; 8.8a GlobalNumberFields
`RayClassCharacter.induced` and `RayClassCharacter.conductor_dvd_iff`; 8.8 and 8.8a
LFunctions Layer 5 (`PrimitiveRayClassCharacter.of`), and, for the Frobenius reading of 8.8a at
an admissible modulus, ClassFieldTheory Layer 13 (`IsAdmissibleModulus.mem_support_of_ramified`).

## Layer 9: Riemann hypotheses as predicates and their conditional consequences

This layer states the Riemann hypothesis of every L-function of ZerosOfLFunctions as a predicate
read through meromorphic orders (9.2–9.5), and proves the first consequences of a zero-free
half-plane and of the hypothesis itself (9.6–9.9). Nothing here proves a numerical fact or a case of
the Riemann hypothesis.

**Names.** The predicates are `ZeroFreeRightOf` (QuasiRiemannHypothesis §1.1, with the clauses of
9.2), the hypothesis
*AnalyticLFunctionData.GeneralizedRiemannHypothesis* of a record (9.3),
`DirichletCharacter.GeneralizedRiemannHypothesis` (9.4), *NumberField.ExtendedRiemannHypothesis*,
*RayClassCharacter.GeneralizedRiemannHypothesis* and the Grossencharacter predicate (9.5). Each
predicate on a character or a record lives in the namespace of the type it is read on, so that
`χ.GeneralizedRiemannHypothesis` resolves by dot notation. None of these names shadows Mathlib's
`RiemannHypothesis` inside the namespaces `DirichletCharacter` and `NumberField`. Dot notation reads
the head of the type: for a character written as a composite such as `ψ.comp Φ`, whose type is a
monoid hom and not `RayClassCharacter 𝔪`, write `RayClassCharacter.GeneralizedRiemannHypothesis (ψ.comp Φ)`.
This roadmap defines no predicate for a modulus, for all characters, or on the bundles
`PrimitiveDirichletCharacter` and `PrimitiveRayClassCharacter`: the hypothesis of a bundle `ψ` is
that of `ψ.character`. Through the second strip form of 9.4, the hypothesis for every character
modulo `q` is `GRHMod q` of ExplicitNumberFields §0.5, and that for every Dirichlet character is
`GRH` of AnalyticNumberTheoryPartI §1.6.

### 9.2 Zero-free half-planes

*Origin:* this roadmap's own formulation: the predicate is that of QuasiRiemannHypothesis §1.1, and
the four clauses this section adds (the limit form of monotonicity, the converse product clause,
the symmetries and the change of level) follow from its definition, from properties of meromorphic
orders and, for the change of level, from the Euler factors of
`DirichletCharacter.LFunction_changeLevel`.

*Method of the formal proof:* only the change of level from `χ` to `χ.primitiveCharacter`, in
value and order form: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DirichletLZerosEqPrimitiveCharacterZeros.lean`
(`GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter`), proves that at every `s` with `Re s > 0`,
the pole of the principal character excepted, `L(·, χ)` and `L(·, χ.primitiveCharacter)` vanish
together and with the same analytic order, the missing Euler factors being analytic and nonzero
there.

`ZeroFreeRightOf σ f`, for `σ : ℝ` and `f : ℂ → ℂ`, is the predicate of QuasiRiemannHypothesis
§1.1: `meromorphicOrderAt f s ≤ 0` for every `s` with `σ < Re s`; in prose, *`f` is zero-free right
of `σ`*. A zero is a point of positive order, so poles are allowed and no value of `f` is read.
Mathlib's order of a function that is not meromorphic at `s` is the junk value `0`
(`meromorphicOrderAt_of_not_meromorphicAt`), so the predicate carries information only for a
function meromorphic on the half-plane; every statement below that applies it to an L-function
relies on that function's continuation theorem. QuasiRiemannHypothesis §1.1 proves that the
predicate is monotone in `σ`; that it depends only on the punctured germs of `f`; that a product of
two functions meromorphic and zero-free right of `σ` is zero-free right of `σ`, and that a factor
analytic and nonzero on the half-plane changes nothing; that at a point where `f` is analytic the
order is at most `0` exactly when `f s ≠ 0`; that for a Dirichlet character `χ`,
`ZeroFreeRightOf σ χ.LFunction` holds exactly when `χ.LFunction s ≠ 0` for every `s` with
`σ < Re s` other than the pole `s = 1` of the principal character; and that for `σ ≥ 0` a ray-class
character and its primitive source satisfy it together. `Suggested.lean` declares the predicate with
the same body, since a roadmap's module is not imported. This section adds four clauses.

- Monotonicity, the limit: `ZeroFreeRightOf σ f` holds exactly when `ZeroFreeRightOf σ' f` holds
  for every `σ' > σ`.
- Products, the converse: at a point `s` where `f` and `g` are meromorphic, `0 ≤ ord_s g`, and
  either `0 ≤ ord_s f` or (`ord_s f < 0` and `ord_s g = 0`): `ord_s (f · g) ≤ 0` holds exactly when
  `ord_s f ≤ 0` and `ord_s g ≤ 0` (`meromorphicOrderAt_mul`). So if `f` and `g` are meromorphic at
  every point right of `σ`, `g` has no pole there and every pole of `f` there is a point of order
  `0` of `g`, then `f · g` is zero-free right of `σ` exactly when `f` and `g` both are.
- Symmetries: `ZeroFreeRightOf σ (fun s ↦ conj (f (conj s))) ↔ ZeroFreeRightOf σ f`, since the
  order of the reflected function at `conj s` is that of `f` at `s`, meromorphic or not
  (`TauCeti.meromorphicOrderAt_conj_conj`); and for `a : ℂ`,
  `ZeroFreeRightOf σ (fun s ↦ f (s + a)) ↔ ZeroFreeRightOf (σ + Re a) f`
  (`meromorphicOrderAt_comp_add_const_eq_meromorphicOrderAt`).
- Change of level: for `σ ≥ 0`, `M ∣ N` and `ψ : DirichletCharacter ℂ M`,
  `ZeroFreeRightOf σ (changeLevel h ψ).LFunction ↔ ZeroFreeRightOf σ ψ.LFunction`:
  `DirichletCharacter.LFunction_changeLevel` relates the two, as germs at every point, by
  `∏_{p ∣ N} (1 − ψ(p) p^(−s))`, whose factors vanish only on `Re s = 0`. In particular `χ` and
  `χ.primitiveCharacter` satisfy the predicate together (`changeLevel_primitiveCharacter`).

*Needs:* QuasiRiemannHypothesis §1.1; Mathlib `meromorphicOrderAt`,
`meromorphicOrderAt_of_not_meromorphicAt`, `meromorphicOrderAt_mul`,
`meromorphicOrderAt_comp_add_const_eq_meromorphicOrderAt`,
`DirichletCharacter.LFunction_changeLevel`, `DirichletCharacter.changeLevel_primitiveCharacter`;
CharacterSumsOverFiniteFields §7.1 (the instance `NeZero χ.conductor`, for the primitive character);
Tau Ceti `TauCeti.meromorphicOrderAt_conj_conj`.

**Checks.**

- The continued functions of LFunctions are in meromorphic normal form, which takes
  the value `0` at a pole: `dedekindZetaC ℚ 1 = 0`, while Mathlib's
  `riemannZeta 1 = (γ − log 4π)/2 ≠ 0` (`riemannZeta_one_ne_zero`). The value form
  "`f s ≠ 0` for `Re s > 1/2`" is false for `dedekindZetaC ℚ` whatever its zeros, and holds at `1`
  for `riemannZeta` only through the junk value; both functions have order `−1` at `1`, and the
  predicate treats them alike.
- The converse product clause needs its condition at the poles: `f(s) = 1/(s − 1)` and
  `g(s) = s − 1` have product `1`, zero-free right of every `σ`, while `g` is not zero-free right
  of `1/2`. It needs its meromorphy hypothesis as well: `f(s) = (s − 2) e^{conj s}` and
  `g(s) = e^{−conj s}` are meromorphic at no point, `e^{conj s}` being complex-differentiable
  nowhere, so both have the junk order `0` everywhere, neither has a pole and both are zero-free
  right of every `σ`, while their product `s − 2` is not zero-free right of `1`.
- The translation clause adds `Re a` to the threshold: `s − 2` is zero-free right of `2` and not of
  `3/2`, so its translate `s − 1` (`a = 1`) is zero-free right of `1` and not of `1/2`. With
  `σ − Re a` in place of `σ + Re a`, the clause would tie `s − 1` being zero-free right of `1`,
  which holds, to `s − 2` being zero-free right of `0`, which fails.

### 9.3 The generalized Riemann hypothesis of a record, and `ζ`

*Origin:* adapted from Titchmarsh (1986), Chapter II, and Iwaniec and Kowalski (2004), Chapter 5:
the functional equation makes the zeros of the completed function symmetric about the critical
line, so that the Riemann hypothesis is the absence of zeros right of `1/2`, for `ζ` and for
L-functions with a functional equation; here read through meromorphic orders on an analytic
record, with the bridges to *GRH* of ZerosOfLFunctions Layer 9 and to Mathlib's
`RiemannHypothesis`.

*Method of the formal proof:* only the direction to `RiemannHypothesis` of the `ζ` clause, from the
value form: a zero `s ≠ 1` of `ζ` that is not trivial and has `Re s < 1/2` is excluded by the
functional equation `ζ(s) = 2(2π)^(−(1−s)) Γ(1−s) cos(π(1−s)/2) ζ(1−s)`, in which `ζ(1−s) ≠ 0` by
the hypothesis on `Re s > 1/2`, `Γ(1−s) ≠ 0` because `Re(1−s) > 0`, and the cosine vanishes only at
the trivial zeros, at `0`, where `ζ` does not vanish, and at points of real part at least `2`.

*Corollary of:* ZerosOfLFunctions §9.1 (for a primitive Dirichlet character, the hypothesis on the
completed function is equivalent to the absence of zeros of its L-function right of `1/2`), at
`q = 1` with the `ζ` bridge of ZerosOfLFunctions Layer 9, for the clause
`RiemannHypothesis ↔ ZeroFreeRightOf (1/2) riemannZeta` and, through the hinge, its value form; the
clauses on a record `d` are not corollaries of it.

For a record `d : AnalyticLFunctionData`, define *GeneralizedRiemannHypothesis* `d` as
`∀ ρ, 0 < meromorphicOrderAt d.completed ρ → Re ρ = 1/2`: every zero of the completed function lies
on the critical line. It reads neither the uncompleted function nor a value, and, like 9.2, it
carries information only for a record whose completed function is meromorphic on `ℂ`.

- Half-plane form: under `HasFunctionalEquation` alone,
  `d.GeneralizedRiemannHypothesis ↔ ZeroFreeRightOf (1/2) d.completed`. The direction to the right needs nothing.
  For the converse, at a point `ρ` with `Re ρ < 1/2`: `HasFunctionalEquation.eventuallyEq` gives
  `Λ = ε · Λ_dual(1 − ·)` as punctured germs at `ρ`, with `ε ≠ 0` (`norm_rootNumber`), so
  `ord_ρ Λ = ord_{1−ρ} Λ_dual` (`meromorphicOrderAt_comp_of_deriv_ne_zero` for `s ↦ 1 − s`, which
  holds whether or not the function is meromorphic); the dual's completed function is
  `s ↦ conj Λ(conj s)` (`AnalyticLFunctionData.dual_completed`), so
  `ord_{1−ρ} Λ_dual = ord_{1 − conj ρ} Λ` (`TauCeti.meromorphicOrderAt_conj_conj`), and
  `Re (1 − conj ρ) = 1 − Re ρ > 1/2`. A zero left of the line is thus a zero of the same `Λ` right
  of it: the zero set of `Λ` is invariant under `s ↦ 1 − conj s`, and no condition on the dual is
  needed.
- Dual: `d.dual.GeneralizedRiemannHypothesis ↔ d.GeneralizedRiemannHypothesis` and
  `ZeroFreeRightOf σ d.dual.completed ↔ ZeroFreeRightOf σ d.completed` for every record and every
  `σ`, by the same two identities.
- Divisor form: if `d.completed` is meromorphic on `ℂ` and its order is finite at one point, then
  `d.GeneralizedRiemannHypothesis ↔ AllOnCriticalLine d.completed univ univ` (ZerosOfLFunctions
  Layer 9): the order is
  then finite everywhere (`MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`) and equals
  the divisor on `univ`. The two families satisfy both conditions (`HasMeromorphicContinuation`,
  and the Euler product at `s = 2`); so do `riemannZetaData`, whose completed function
  `completedRiemannZeta` is meromorphic on `ℂ` with order `−1` at `1`
  (`TauCeti.meromorphicOrderAt_completedRiemannZeta_one`), and `dirichletData χ hχ` for primitive
  `χ` (`HasMeromorphicContinuation`, and order `0` at `2`, where `L(2, χ) ≠ 0` and the conductor
  power and the gamma factor are regular and nonzero). For the two families the right side is the
  hypothesis *GRH* of ZerosOfLFunctions Layer 9, read through the divisor. In particular
  `riemannZetaData.GeneralizedRiemannHypothesis ↔ AllOnCriticalLine completedRiemannZeta univ univ`,
  whose right side is that *GRH* at the `ζ` instance.
- Uncompleted form: under `HasMeromorphicContinuation` and `HasFunctionalEquation`, if every real
  gamma shift `μ` and every complex gamma shift `ν` of `d` has real part at least `−1/2`, the gamma
  factor has neither zero nor pole on `Re s > 1/2` (ZerosOfLFunctions §1.5), so the orders of `Λ`
  and of *continuedL* `d` agree there (ZerosOfLFunctions §1.6), and `d.GeneralizedRiemannHypothesis ↔ ZeroFreeRightOf (1/2) (continuedL d)`.
  The shifts `0` and `1` of the two families qualify.
- `ζ`: `riemannZetaData.GeneralizedRiemannHypothesis ↔ RiemannHypothesis`, by the divisor form and
  the bridge of ZerosOfLFunctions Layer 9, which identifies its *GRH* at `ζ` with
  `RiemannHypothesis`; and
  `RiemannHypothesis ↔ ZeroFreeRightOf (1/2) riemannZeta` (`riemannHypothesis_iff_zeroFreeRightOf`)
  and `RiemannHypothesis ↔ ∀ s, 1/2 < Re s → riemannZeta s ≠ 0`
  (`riemannHypothesis_iff_riemannZeta_ne_zero`). The value form needs no `s ≠ 1`, because Mathlib's
  `riemannZeta 1` is a nonzero junk value; the order form never reads it.
- The hinge: for `s ≠ 1`, `0 < meromorphicOrderAt riemannZeta s ↔ riemannZeta s = 0`,
  from analyticity off `1`
  (`differentiableAt_riemannZeta`) and `riemannZeta 2 ≠ 0`, which excludes local vanishing on the
  connected set `ℂ ∖ {1}`; and `meromorphicOrderAt riemannZeta 1 = −1` (`riemannZeta_residue_one`).

Route of the two forms of `RiemannHypothesis` on `riemannZeta`: by the hinge, a point of positive
order right of `1/2` is a zero other than `1`, and it is not a trivial zero, so
`RiemannHypothesis` excludes it; the value form is the same, `riemannZeta 1` being nonzero.
Conversely, a zero `s ≠ 1` of `riemannZeta` that is not trivial has `Re s > 0`
(`riemannZeta_eq_zero_iff_of_re_nonpos`); if `Re s < 1/2`, then `1 − s` is a zero
(`riemannZeta_one_sub`) with `Re (1 − s) > 1/2`; so either form gives `Re s = 1/2`.
For both forms the direction to `RiemannHypothesis` follows from [FormalProof],
`Formalism/GammaFactorNonvanishing/RhOfRight.lean` (`Formalism.VW.rh_of_right`).

*Needs:* 9.2; ZerosOfLFunctions §§1.5, 1.6 and Layer 9 (*AllOnCriticalLine*, and *GRH* with its
bridge to `RiemannHypothesis`); LFunctions Layer 0 (`AnalyticLFunctionData.dual_completed`,
`HasMeromorphicContinuation`, `HasFunctionalEquation.eventuallyEq`, the field
`HasFunctionalEquation.norm_rootNumber`); Mathlib `RiemannHypothesis`,
`meromorphicOrderAt_comp_of_deriv_ne_zero`, `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`,
`riemannZeta_eq_zero_iff_of_re_nonpos`, `riemannZeta_one_sub`, `riemannZeta_residue_one`,
`riemannZeta_one_ne_zero`, `riemannZeta_two`, `differentiableAt_riemannZeta`; Tau Ceti
`TauCeti.meromorphicOrderAt_conj_conj`, `TauCeti.meromorphicOrderAt_completedRiemannZeta_one`,
`TauCeti.LFunctions.riemannZetaData`.

**Checks.**

- The record with completed function `0`, polar divisor `0`, root number `1` and no gamma shifts
  satisfies `HasMeromorphicContinuation` and `HasFunctionalEquation` (`0 = 1 · conj 0`). Its order
  is `⊤` everywhere, so it fails the hypothesis and is zero-free right of no `σ`, as the half-plane
  form requires. Its divisor is `0` everywhere, so the definition through the divisor
  (`∀ ρ, 0 < divisor d.completed univ ρ → Re ρ = 1/2`) would hold for it and the half-plane form
  would fail; the divisor form above excludes it by its finiteness condition.
- Mathlib's junk value `riemannZeta 1 = (γ − log 4π)/2` enters no statement: the order form reads
  `−1` at `1`.
- For the quartic character `χ` modulo `5` with `χ(2) = i`, `dirichletData χ` and its dual
  `dirichletData χ⁻¹` are different records, and the zeros of the second completed function are
  the conjugates of those of the first. The functional equation reflects a zero `ρ` of `Λ(χ, ·)`
  to the zero `1 − ρ` of `Λ(χ⁻¹, ·)`, hence to the zero `1 − conj ρ` of `Λ(χ, ·)`; a reflection
  `ρ ↦ 1 − ρ` within one completed function would say that the zero set of `Λ(χ, ·)` is closed under
  conjugation, which nothing gives for a non-real character (ZerosOfLFunctions §4.5). A half-plane is closed under
  conjugation, so the hypothesis for `χ` alone is the hypothesis for its record.

### 9.4 Dirichlet characters

*Origin:* adapted from Davenport (2000), chapters 5, 9 and 14: primitive characters, the functional
equation and the absence of zeros on `Re s = 1`, which give the equivalent forms of the hypothesis
for one Dirichlet character (AnalyticNumberTheoryPartI §§1.6, 1.6a); here read through meromorphic
orders on Mathlib's `DirichletCharacter.LFunction`, with the forms over one modulus and the bridge
to *DirichletGRH*.

*Method of the formal proof:* for an imprimitive character the L-function is that of the primitive
character times the finitely many missing Euler factors, each nonzero for `Re s > 0` because its
second term has modulus below one; for the strip, the completed function is the L-function times a
gamma factor without zeros on `Re s > 0`, and the functional equation of a primitive character
sends a zero `ρ` with `Re ρ < 1/2` to the zero `1 − ρ` of the inverse character, to which the
half-plane hypothesis, assumed for every character, applies. The route written here proves each
form for one character, through the conjugation `L(χ⁻¹, conj s) = conj L(χ, s)` of the inverse
clause, and the converse directions; [FormalProof] has the forms recorded at each clause.

*Corollary of:* AnalyticNumberTheoryPartI §1.6a (the conjugation, reflection and half-plane forms
of *DirichletGRH* for one Dirichlet character) and §1.6 (primitive induction and conductor one), for
the inverse, the reflection and the strip forms, and for the change of level, the primitive
character, modulus one and the quantified forms, each read through the value form and the bridge;
the hinge, the value form and the completed-function clause are not corollaries of them.

For `[NeZero N]` and `χ : DirichletCharacter ℂ N`, primitive or not, define
`DirichletCharacter.GeneralizedRiemannHypothesis χ` as `ZeroFreeRightOf (1/2) χ.LFunction`, on Mathlib's continued
`DirichletCharacter.LFunction`. "Every character modulo `q`" and "every Dirichlet character" are
quantifiers over this predicate, and the hypothesis of a primitive character bundled as
`PrimitiveDirichletCharacter` is that of its `character`. The lemmas use Mathlib's idiom
`χ ≠ 1 ∨ s ≠ 1` for the pole of the principal character.

- **Hinge.** For `χ ≠ 1 ∨ s ≠ 1`, `0 < meromorphicOrderAt χ.LFunction s ↔ χ.LFunction s = 0`:
  the function is analytic there and not locally zero,
  `L(2, χ) ≠ 0`; and `meromorphicOrderAt (1 : DirichletCharacter ℂ N).LFunction 1 = −1`.
- **Value form.** `χ.GeneralizedRiemannHypothesis ↔ ∀ s, 1/2 < Re s → (χ ≠ 1 ∨ s ≠ 1) →
  χ.LFunction s ≠ 0` (`generalizedRiemannHypothesis_iff_LFunction_ne_zero`, from the Dirichlet
  clause of QuasiRiemannHypothesis §1.1).
- **Inverse.** For every `σ`, `ZeroFreeRightOf σ χ⁻¹.LFunction ↔ ZeroFreeRightOf σ χ.LFunction`,
  from `L(χ⁻¹, conj s) = conj L(χ, s)` (Tau Ceti `DirichletCharacter.LFunction_inv_conj`) and 9.2's
  symmetry; hence `χ⁻¹.GeneralizedRiemannHypothesis ↔ χ.GeneralizedRiemannHypothesis`. It follows from [FormalProof],
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LFunctionConj.lean` (`Deduction.LFunction_conj`),
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/GchiConj.lean` (`Deduction.Gchi_conj_LFunction`).
- **Change of level and the primitive character.**
  `(changeLevel h ψ).GeneralizedRiemannHypothesis ↔ ψ.GeneralizedRiemannHypothesis` for `M ∣ N`, and
  `χ.primitiveCharacter.GeneralizedRiemannHypothesis ↔ χ.GeneralizedRiemannHypothesis`
  (`generalizedRiemannHypothesis_primitiveCharacter_iff`), by 9.2 at `σ = 1/2`
  (AnalyticNumberTheoryPartI §1.6 states the primitive reduction for *DirichletGRH*).
  [FormalProof] has the second only for all characters at once:
  `Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean` (`UpperTheory.Top.imprimitive`) derives the
  value form for every character of every level from the nonvanishing of `L(s, ψ)` on `Re s > 1/2` for every
  primitive `ψ` of every conductor. For one `χ` it has
  `Development/AutomorphicArithmetic/CharacterBoxes/ClaimStrip.lean` (`Claim.prim_zero`): a zero of `L(·, χ)` in the
  open strip is a zero of `L(·, χ.primitiveCharacter)`. The equivalence for one `χ` is this roadmap's own.
- **Reflection.** For primitive `χ` and `0 < Re ρ < 1`,
  `meromorphicOrderAt χ.LFunction ρ = meromorphicOrderAt χ⁻¹.LFunction (1 − ρ)`, by
  `IsPrimitive.completedLFunction_one_sub` and `LFunction_eq_completed_div_gammaFactor`: the gamma
  factors of `χ` and `χ⁻¹`, of the same parity, are regular and nonzero at `ρ` and `1 − ρ`
  (10.2), and `N^(s − 1/2)` and the root number
  are nonzero. With the inverse clause, the zeros of `L(·, χ)` in the open strip are invariant under
  `ρ ↦ 1 − conj ρ`.
- **Strip forms.** For primitive `χ` and every `σ ≥ 0`,
  `ZeroFreeRightOf σ χ.LFunction ↔ ∀ ρ, 0 < Re ρ → Re ρ < 1 → χ.LFunction ρ = 0 →
  1 − σ ≤ Re ρ ∧ Re ρ ≤ σ`, by the reflection, `LFunction_ne_zero_of_one_le_re` and analyticity on
  the open strip (for `σ < 1/2` both sides say that `L(·, χ)` has no zero in the open strip, for
  `σ ≥ 1` both hold). QuasiRiemannHypothesis §11.1 derives this strip for every primitive
  character from the half-plane for all of them; here, and in 9.5, the strip and the half-plane are
  equivalent for each character separately, through the inverse clause. At `σ = 1/2` and for every
  `χ`, primitive or not:
  `χ.GeneralizedRiemannHypothesis ↔ ∀ ρ, 0 < Re ρ → Re ρ < 1 → χ.LFunction ρ = 0 → Re ρ = 1/2`
  (`generalizedRiemannHypothesis_iff_re_eq_half`) and
  `χ.GeneralizedRiemannHypothesis ↔ ∀ s, 0 < Re s → (χ ≠ 1 ∨ s ≠ 1) → χ.LFunction s = 0 →
  Re s = 1/2`, whose right side is AnalyticNumberTheoryPartI §1.6's *DirichletGRH* `χ`; an
  imprimitive `χ` has the zeros of its primitive character in the open strip, its deleted Euler
  factors vanishing only on `Re s = 0`. [FormalProof] has one direction of the first form at `σ = 1/2`, for all
  characters at once: `Development/AutomorphicArithmetic/CharacterBoxes/ClaimStrip.lean` (`Claim.strip`) derives the
  strip form for every character from the value form for every character. For one character it has the reflection
  `Claim.prim_reflect` in the same file (for primitive `ψ`, a zero `ρ` of `L(·, ψ)` in the open strip gives the zero
  `1 − ρ` of `L(·, ψ⁻¹)`) and the conjugation `L(χ⁻¹, conj s) = conj L(χ, s)`,
  `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LFunctionConj.lean` (`Deduction.LFunction_conj`).
  The equivalence for one `χ` is this roadmap's own.
- **Completed function.** For primitive `χ`,
  `χ.GeneralizedRiemannHypothesis ↔ (dirichletData χ hχ).GeneralizedRiemannHypothesis`
  (9.3, uncompleted form; *continuedL* of the record is `χ.LFunction`, ZerosOfLFunctions
  §6.4a, and at level `1` it is `riemannZeta`, `dirichletData_modOne`).
- **Modulus one and the principal character.** For `χ : DirichletCharacter ℂ 1`, which is the
  trivial character (`DirichletCharacter.level_one`), `χ.GeneralizedRiemannHypothesis ↔
  RiemannHypothesis` (`DirichletCharacter.LFunction_modOne_eq`, 9.3; AnalyticNumberTheoryPartI §1.6
  states it for *DirichletGRH*); for every `N`,
  `(1 : DirichletCharacter ℂ N).GeneralizedRiemannHypothesis ↔ RiemannHypothesis`
  (`generalizedRiemannHypothesis_one_iff`), its primitive character being the character modulo
  `1`. So the hypothesis for every character modulo any `q` contains `RiemannHypothesis`.
  [FormalProof] has the direction from modulus one to `RiemannHypothesis`, in value form:
  `Formalism/GammaFactorNonvanishing/RhOfRight.lean` (`Formalism.VW.rh_of_right`) derives `RiemannHypothesis` from
  the nonvanishing of `riemannZeta` on `Re s > 1/2` off `s = 1`, and
  `Formalism/GammaFactorNonvanishing/CritLine.lean` (`Formalism.VW.rh_of_every`) derives it from the value form for
  every character. The converse, and the equivalence for every `N`, are this roadmap's own.
- **Quantified forms.** For `q ≥ 1`,
  `(∀ χ : DirichletCharacter ℂ q, χ.GeneralizedRiemannHypothesis) ↔
  ∀ (f : ℕ) [NeZero f], f ∣ q → ∀ χ : DirichletCharacter ℂ f, χ.IsPrimitive →
  χ.GeneralizedRiemannHypothesis`; and
  `(∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.GeneralizedRiemannHypothesis) ↔
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive → χ.GeneralizedRiemannHypothesis`
  (`forall_generalizedRiemannHypothesis_iff_forall_isPrimitive`). The instance binder `[NeZero f]`
  makes `χ.LFunction` well typed. Through the strip forms at `σ = 1/2`, the left side of the first
  is `GRHMod q` of ExplicitNumberFields §0.5, and the first is the passage to imprimitive characters
  of ExplicitZetaBounds §0.2 at unbounded height. [FormalProof] has the second from right to left, in value form:
  `Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean` (`UpperTheory.Top.imprimitive`, above). The form
  over one modulus is this roadmap's own.
- **Bridge.** `χ.GeneralizedRiemannHypothesis ↔ DirichletGRH χ` (AnalyticNumberTheoryPartI §1.6),
  which is the second strip form: the two definitions read orders on `Re s > 1/2` here and values
  on `Re s > 0`, the pole of the principal character excepted, there, and are equivalent.
- **Consumer forms.** From the hypothesis, `1/2 < Re s` and `χ ≠ 1 ∨ s ≠ 1`,
  `χ.LFunction s ≠ 0`; from the hypothesis, `0 < Re s < 1` and `χ.LFunction s = 0`, `Re s = 1/2`.
  [FormalProof] has them only for all characters at once: `UpperTheory.Top.imprimitive` (above) concludes the first
  for every `χ` from the nonvanishing of every primitive L-function on `Re s > 1/2`, and `Claim.strip` (above) the
  second for every `χ` from the value form for every character. The forms for one `χ` are this roadmap's own.

*Needs:* 9.2, 9.3, 10.2; QuasiRiemannHypothesis §1.1 (the Dirichlet clause); AnalyticNumberTheoryPartI
§1.6 (`DirichletGRH`, for the bridge);
CharacterSumsOverFiniteFields §7.1 (the instance `NeZero χ.conductor`); ZerosOfLFunctions §6.4a
(completion comparisons); LFunctions Layer 4 (`dirichletData`, `dirichletData_dual`,
`dirichletData_modOne`); Mathlib `DirichletCharacter.LFunction`, `DirichletCharacter.level_one`,
`DirichletCharacter.LFunction_modOne_eq`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
`DirichletCharacter.LFunction_eq_completed_div_gammaFactor`,
`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `DirichletCharacter.IsPrimitive.inv`,
`DirichletCharacter.conductor_inv`, `DirichletCharacter.primitiveCharacter`,
`DirichletCharacter.primitiveCharacter_isPrimitive`, `DirichletCharacter.changeLevel_primitiveCharacter`,
`DirichletCharacter.isPrimitive_one_level_one`, `DirichletCharacter.LFunction_changeLevel`; Tau Ceti
`DirichletCharacter.LFunction_inv_conj`, `DirichletCharacter.LFunction_inv_conj_eq_zero_iff`.

**Checks.**

- The principal character modulo `2`: `L(s) = (1 − 2^(−s)) ζ(s)` vanishes at `2πik/log 2`, on
  `Re s = 0`; the predicate does not see these zeros, and its hypothesis is `RiemannHypothesis`. A
  strip definition over `0 ≤ Re s < 1` would make the hypothesis false for this character whatever
  the zeros of `ζ`.
- The even quadratic character modulo `5` has the trivial zero `L(0, χ) = 0` (the pole of `Gammaℝ`
  at `0` against a regular completion); a definition over `0 ≤ Re s` would again be false.
- At `s = 1` the principal character has order `−1`: the pole is not a zero, and the value
  Mathlib assigns there is not read.
- A definition through the completed record covers primitive characters only (`dirichletData`
  needs primitivity); the principal character modulo `2` has no record, and the predicate applies
  to it.
- The quartic character modulo `5` with `χ(2) = i`: the inverse clause relates two different
  functions, whose zero sets are complex conjugate (ZerosOfLFunctions §4.5).

### 9.5 Dedekind zeta functions, ray-class characters and Grossencharacters

*Origin:* adapted from Bach (1990), §3, Belabas, Diaz y Diaz and Friedman (2008), §2, and Iwaniec
and Kowalski (2004), Chapter 5: the extended and generalized Riemann hypotheses for Dedekind zeta
functions, for characters of the class group and for L-functions of any degree, Grossencharacters
included, read as the absence of zeros right of `1/2` (AnalyticNumberTheoryPartI §§2.42, 2.42a);
here read through meromorphic orders on the continued functions of LFunctions, with the forms at
every threshold `σ`, the records and the bridges.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For a number field `K` define *ExtendedRiemannHypothesis* `K` as
`ZeroFreeRightOf (1/2) (dedekindZetaC K)`, on the continued Dedekind zeta function
`dedekindZetaC K = TauCeti.meromorphicContinuation 1 (NumberField.dedekindZeta K)` of LFunctions
Layer 3, the function ZerosOfLFunctions §§6.2 and 8.4 read. For a modulus `𝔪` of `K` and `χ : RayClassCharacter 𝔪`
define *GeneralizedRiemannHypothesis* `χ` as `ZeroFreeRightOf (1/2) (heckeLFunctionC χ)`; for
`ψ : PrimitiveRayClassCharacter K` the hypothesis is that of `ψ.character`, and no predicate is
defined on the bundle. "Every ray-class character of `K`" is the quantifier over `𝔪` and `χ`; no
predicate names it.

At `σ = 1/2`, read on the zeros in the open strip, the clauses below on the inverse, the strip
forms, presented and primitive characters, the trivial character, the rationals at `(q)∞` and
Grossencharacters are those of AnalyticNumberTheoryPartI §2.42a (every modulus, inverse, half-plane
form, the rationals, algebraic Hecke characters); their readings through orders, their forms at
every threshold `σ` and the records are stated here.

- **Hinge.** For `s ≠ 1`, `0 < meromorphicOrderAt (dedekindZetaC K) s ↔ dedekindZetaC K s = 0`
  (`analyticAt_dedekindZetaC`, and `dedekindZetaC K 2 ≠ 0` by the Euler product); for a nontrivial
  primitive `ψ` the same holds for `heckeLFunctionC ψ.character` at every `s`, the function being
  entire (LFunctions Layer 5).
- **Inverse.** For every `σ`, `ZeroFreeRightOf σ (heckeLFunctionC χ⁻¹) ↔ ZeroFreeRightOf σ
  (heckeLFunctionC χ)`: the two series are conjugate at conjugate points on `Re s > 1`, so
  `heckeLFunctionC χ⁻¹` and `s ↦ conj (heckeLFunctionC χ (conj s))` have the same germ at every
  point (`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`), and 9.2's symmetry applies.
- **Strip forms.** `ExtendedRiemannHypothesis K ↔ ∀ ρ, 0 < Re ρ → Re ρ < 1 → dedekindZetaC K ρ = 0 →
  Re ρ = 1/2`, and the same for
  `heckeLFunctionC ψ.character` and primitive `ψ`; for primitive `ψ` and every `σ ≥ 0` the σ-strip
  of 9.4 holds. Route: the functional equation against `ψ⁻¹` (`completedHeckeLFunction_one_sub`,
  and `completedHeckeLFunction_one_sub_eventuallyEq` for the trivial character), the gamma factors
  being regular and nonzero on `Re s > 0` (ZerosOfLFunctions §1.5), the inverse clause, and no
  zero on `Re s = 1` (ZerosOfLFunctions §6.5). In the open strip the functions are analytic, so the strip forms read values.
  The right sides of the first two forms are AnalyticNumberTheoryPartI §2.42's ERH(`K`) and its
  GRH(`ψ`) of a primitive finite-order Hecke character. They are also `DedekindERH K` of
  ClassicalArithmeticCompletion §5.0 and, for a character `χ` of the class group (a primitive
  ray-class character of the modulus `1`), its `HeckeGRH χ`; so these forms are the bridges
  `ExtendedRiemannHypothesis K ↔` ERH(`K`) `↔ DedekindERH K` and
  `χ.GeneralizedRiemannHypothesis ↔ HeckeGRH χ`, the definitions reading orders on `Re s > 1/2`
  here and the zeros in the open strip there. At `σ = 1/2` the inverse clause for such a `χ` is the
  invariance of `HeckeGRH` under `χ ↦ χ⁻¹` of ClassicalArithmeticCompletion §5.0.
- **Presented and primitive.** `χ.GeneralizedRiemannHypothesis ↔
  (PrimitiveRayClassCharacter.of χ).character.GeneralizedRiemannHypothesis` (the ray-class clause of
  QuasiRiemannHypothesis §1.1).
- **Trivial character.** For every modulus `𝔪`, `(1 : RayClassCharacter 𝔪).GeneralizedRiemannHypothesis
  ↔ ExtendedRiemannHypothesis K`: the primitive source of `1` is the trivial character of conductor
  `Modulus.one K`, whose L-function is `dedekindZetaC K` (at that conductor,
  AnalyticNumberTheoryPartI §2.42 states that GRH of the trivial character is ERH(`K`)).
- **Records.** `ExtendedRiemannHypothesis K ↔ (dedekindZetaData K).GeneralizedRiemannHypothesis`,
  and for primitive `ψ`, `ψ.character.GeneralizedRiemannHypothesis ↔
  (heckeData ψ).GeneralizedRiemannHypothesis` (9.3, uncompleted form, with *continuedL* of ZerosOfLFunctions §1.6).
- **The rationals.** For every `σ`,
  `ZeroFreeRightOf σ (dedekindZetaC ℚ) ↔ ZeroFreeRightOf σ riemannZeta`: the two functions agree
  on `Re s > 1`, hence have the same germ at every point
  (`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`), though they differ at `1` (germ
  invariance, QuasiRiemannHypothesis §1.1); at `σ = 1/2` this is
  `ExtendedRiemannHypothesis ℚ ↔ RiemannHypothesis` (AnalyticNumberTheoryPartI §2.42 states it for
  ERH(`ℚ`)). For `q ≠ 0`, `χ : DirichletCharacter ℂ q`
  and every `σ`,
  `ZeroFreeRightOf σ (heckeLFunctionC ((ratDirichletEquiv q hq).symm χ)) ↔
  ZeroFreeRightOf σ χ.LFunction`: the ray-class series at `(q)∞` and the Dirichlet series of `χ`
  agree term by term on `Re s > 1` (`onIdeals_ratDirichletEquiv_symm`, the ideals not prime to
  `q` and the integers not prime to `q` contributing `0` to both), so the continuations have the
  same germ at every point; at `σ = 1/2` this is
  `((ratDirichletEquiv q hq).symm χ).GeneralizedRiemannHypothesis ↔
  χ.GeneralizedRiemannHypothesis`.
- **Grossencharacters.** For a Grossencharacter `χ` of LFunctions Layer 6 with ideal-side shift
  `σ_χ` (`idealShift`), define *GeneralizedRiemannHypothesis* `χ` as
  `(grossencharacterData χ).GeneralizedRiemannHypothesis`, the hypothesis of the card of its
  unitary part. It is equivalent to `ZeroFreeRightOf (1/2 + σ_χ) (lFunctionC χ)`: by 9.3 the card's
  hypothesis is `ZeroFreeRightOf (1/2)` of the continued unitary L-function, the full L-function is
  the unitary one recentred at `s − σ_χ`, the presented series differs from the primitive one by
  Euler factors vanishing only on `Re s = σ_χ`, and 9.2's translation clause moves the threshold.
  For a Grossencharacter of finite order it is the hypothesis of the ray-class character it
  presents.

*Needs:* 9.2–9.4; QuasiRiemannHypothesis §1.1 (germs, the ray-class clause); AnalyticNumberTheoryPartI
§2.42 and ClassicalArithmeticCompletion §5.0 (for the bridges); AnalyticNumberTheoryPartI §2.42a
(the forms at `σ = 1/2`); ZerosOfLFunctions
§§6.5, 1.5, 1.6; LFunctions Layer 3 (`dedekindZetaC`,
`analyticAt_dedekindZetaC`, `meromorphicOrderAt_dedekindZetaC_one`, `dedekindZetaData`), Layer 5
(`heckeLFunctionC_eq`, `heckeData`, `completedHeckeLFunction_one_sub`,
`completedHeckeLFunction_one_sub_eventuallyEq`), Layer 6 (`Grossencharacter`, `idealShift`,
`lFunctionC`, `lFunctionC_eq`, `grossencharacterData`); Tau Ceti `TauCeti.meromorphicContinuation`,
`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, `TauCeti.LFunctions.heckeLFunctionC`,
`TauCeti.LFunctions.PrimitiveRayClassCharacter.of`, `PrimitiveRayClassCharacter.character_inv`,
`TauCeti.GlobalNumberFields.ratDirichletEquiv`,
`TauCeti.GlobalNumberFields.onIdeals_ratDirichletEquiv_symm`; Mathlib `NumberField.dedekindZeta`.

**Checks.**

- `dedekindZetaC ℚ 1 = 0` (normal form) and `riemannZeta 1 ≠ 0` (junk): the functions differ at
  `1` and both have order `−1` there, so `ExtendedRiemannHypothesis ℚ ↔ RiemannHypothesis` holds
  because the predicate reads orders.
- A real quadratic field: `ζ_K` vanishes at `0` to order `r₁ + r₂ − 1 = 1` (LFunctions Layer 3);
  `Re 0 ≤ 1/2`, so this zero does not contradict the hypothesis.
- The trivial character presented at `ratModulus 4`: `heckeLFunctionC` is `ζ(s)(1 − 2^(−s))`, with
  zeros on `Re s = 0`; its hypothesis is `RiemannHypothesis`.
- `K = ℚ(i)`: `dedekindZetaC K = ζ · L(·, χ₋₄)` as germs (`dedekindZetaC_quadratic`); `L(·, χ₋₄)`
  has no pole, and the only pole of `ζ` right of `1/2` is at `1`, where `L(1, χ₋₄) = π/4 ≠ 0`, so
  by 9.2's converse product clause `ExtendedRiemannHypothesis ℚ(i)` holds exactly when
  `RiemannHypothesis` and the hypothesis for `χ₋₄` both hold, as AnalyticNumberTheoryPartI §2.42
  states for ERH(`ℚ(i)`) and *DirichletGRH* `χ₋₄`.
- The norm power `N^m` over `ℚ`, `m ≥ 1`: `lFunctionC` is `s ↦ ζ(s − m)`, whose nontrivial zeros
  have real parts in `(m, m + 1)`; its trivial zeros, at `s = m − 2k`, `k ≥ 1`, do not. A predicate
  with the threshold `1/2` in place of `1/2 + σ_χ` would be false for it, `ζ` having nontrivial
  zeros (ZerosOfLFunctions §7.6), each giving a zero of `ζ(s − m)` with real part above `m ≥ 1 > 1/2`.

### 9.6 First consequences

*Origin:* this roadmap's own formulation: the exceptional zeros of ZerosOfLFunctions §6.3 of an
L-function zero-free right of `σ` lie at most at `σ`, and there are none for `σ < 3/4`; and the
bound `C y^σ` for the Riesz remainder of 8.4a(b) of a primitive character whose L-function is
zero-free right of `σ`.

*Method of the formal proof:* none; the statement is not in [FormalProof].

(a) **Exceptional zeros.** Let `ψ : PrimitiveRayClassCharacter K` and `σ : ℝ`. If
`heckeLFunctionC ψ.character` is zero-free right of `σ`, every `β` with *IsExceptionalZero* `ψ β`
(ZerosOfLFunctions §6.3) has `β ≤ σ`; if `σ < 3/4` no `β` has it. For `ψ` other than the trivial character of `ℚ`,
`log analyticConductorAt (heckeData ψ) 0 ≥ log 9`: over `ℚ` a nontrivial primitive character has
conductor norm at least `3` and an archimedean factor at least `3`; for `[K:ℚ] ≥ 2`,
`|d_K| ≥ 3` (`NumberField.abs_discr_gt_two`) and the archimedean factors multiply to at least
`3^{r₁} 12^{r₂} ≥ 9`. With the cap `c ≤ log 3/2` of ZerosOfLFunctions §6.2 every exceptional zero therefore lies in
`[1 − (log 3/2)/log 9, 1) = [3/4, 1)`. For the trivial character of `ℚ` the set is empty (ZerosOfLFunctions §6.2).
So a primitive character satisfying its hypothesis has no exceptional zero, and at `K = ℚ` the
exceptional branch of `dirichletLFunction_zeroFreeRegion` does not occur for a Dirichlet character,
primitive or not, satisfying its hypothesis (9.4, and the rational paragraph of ZerosOfLFunctions §6.4).
Over `ℚ`, AnalyticNumberTheoryPartI §§0.1 and 0.34 show unconditionally that the exceptional
predicate of AnalyticNumberTheoryPartI §0.1 holds for no real character at the widths `c ≤ c_LS`;
(a) removes the exceptional zeros of ZerosOfLFunctions §6.3, at its width and for every `K`, under
the hypothesis. Neither statement contains the other.

(c) **The Riesz remainder.** Let `ψ` be primitive, `σ ∈ [1/2, 1)`, and
`heckeLFunctionC ψ.character` zero-free right of `σ`. Then there is `C` with
`‖rieszRemainder ψ y‖ ≤ C y^σ` for `y ≥ 2`, and the same for the remainder of a primitive
Dirichlet character zero-free right of `σ`
(`PrimitiveDirichletCharacter.norm_rieszRemainder_le_of_zeroFreeRightOf`). Route: the explicit formula of 8.4a(b). For
`χ : PrimitiveDirichletCharacter`, the remainder is that of its image `ψ` under
*toPrimitiveRayClassCharacter* (8.4a(b)), and `heckeLFunctionC ψ.character` has the germ of
`χ.character.LFunction` at every point (11.1), so it is zero-free right of `σ` with it (germ
invariance, QuasiRiemannHypothesis §1.1). Every zero of
`Λ(ψ, ·)` lies in the open strip (ZerosOfLFunctions §§5.6a, 6.5), hence in `1 − σ ≤ Re ρ ≤ σ` by the strip form of
9.5, so `‖y^ρ‖ ≤ y^σ`; the zero sum is at most `y^σ ∑_ρ m_ρ/‖ρ(1 − ρ)‖`, finite by ZerosOfLFunctions §5.6a; and
`E_ψ(y) = O(log y)`.

*Needs:* 8.4a, 9.2–9.5, 11.1 (the comparison of L-functions of *toPrimitiveRayClassCharacter*);
QuasiRiemannHypothesis §1.1 (germs); ZerosOfLFunctions §§2.1, 5.6a, 6.2–6.5; Mathlib
`NumberField.abs_discr_gt_two`.

**Checks.**

- The odd primitive character modulo `4`: `analyticConductorAt` at `0` is `4 · (1 + 3) = 16`, so
  the region of ZerosOfLFunctions §6.3 starts no further left than `1 − (log 3/2)/log 16 ≈ 0.802` (exactly there
  when the constant of ZerosOfLFunctions §6.3 equals its cap); zero-free right of `11/12` leaves at most
  `[0.802, 11/12]` for an exceptional zero, and zero-free right of any `σ < 3/4` leaves nothing.
- `ζ` is the only case in which the cap allows an exceptional zero below `3/4` (the region starts
  at `1/2`), and ZerosOfLFunctions §6.2 already excludes it.
- Zero counts: a record satisfying its hypothesis has `zeroCount d.completed univ R = 0` for every
  bounded `R` disjoint from the line `Re s = 1/2`, a count over a region without zeros; nothing
  beyond the definition is used. So a zero density vanishes under the hypothesis when its region
  misses the line: a count of the zeros with `Re ρ ≥ σ` for `σ > 1/2`, or with `Re ρ > σ` for
  `σ ≥ 1/2`. The counts of ZerosOfLFunctions §§7.4–7.5 are over the whole critical strip and do not vanish:
  `N(T) ∼ (T/2π) log T` (ZerosOfLFunctions §7.4), and the zero `1/2 + 14.1347…i` of `ζ` gives `N(15) ≥ 1`; nor does
  a density of the zeros with `Re ρ ≥ 1/2`.

### 9.7 Growth under a zero-free half-plane and under the Riemann hypothesis

*Origin:* adapted from Titchmarsh (1986), Chapter XIV, Littlewood (1928) and Iwaniec and Kowalski
(2004), Chapter 5: the bounds for `ζ` under the Riemann hypothesis (growth right of the critical
line, `log |ζ(1/2 + it)| ≪ log |t|/log log |t|`, Lindelöf's bound), Littlewood's bounds for
`L(1, χ)`, and the analytic conductor in the bounds for L-functions of any degree, all at
`σ₀ = 1/2`; here for the Dedekind zeta function and the L-function of a primitive ray-class
character under a zero-free half-plane `Re s > σ₀`, `σ₀ ∈ [1/2, 1)`, with constants depending only
on the degree and `σ₀`, which for `σ₀ > 1/2` is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `d` be `dedekindZetaData K` or `heckeData ψ` for a primitive `ψ`, of degree `n = [K:ℚ]`;
`L = continuedL d`, which is `dedekindZetaC K` or `heckeLFunctionC ψ.character` (ZerosOfLFunctions §1.6);
`𝔮(s) = analyticConductorAt d s`. Call a real `t` *admissible* if `L` is entire (`ψ` nontrivial)
or `|t| ≥ 2` (`L = dedekindZetaC K`). For `L` zero-free right of `σ₀`, its logarithm at `σ + it`,
`σ > σ₀`, is `log L(σ + it) = −∫_σ^∞ logDeriv L (u + it) du`, the logarithm along the horizontal
ray, which is the Dirichlet series `∑_m a_L(m)/(m^s log m)` for `Re s > 1`.

(i) **A zero-free half-plane.** Let `σ₀ ∈ [1/2, 1)` and `L` zero-free right of `σ₀`. For every
`δ > 0` and `ε > 0` there is `C`, depending only on `n`, `σ₀`, `δ` and `ε`, with
`‖L(σ + it)‖ ≤ C 𝔮(σ + it)^ε` and `‖L(σ + it)‖⁻¹ ≤ C 𝔮(σ + it)^ε` for every `σ ≥ σ₀ + δ` and every
admissible `t`. For a fixed `d` both are `≤ C′ |t|^ε` for `|t| ≥ 2`; at `ℚ`, under
`RiemannHypothesis`, `ζ(σ + it) ≪ |t|^ε` and `1/ζ(σ + it) ≪ |t|^ε` for `σ ≥ 1/2 + δ`.
QuasiRiemannHypothesis §5.3 bounds the Hecke L-functions of one field, with the pole of `ζ_K`
cleared, in a zero-free disc and right of the zero abscissa of the field's whole primitive family,
with constants depending on the field; (i) assumes the half-plane for the one L-function and has
constants depending only on the degree.

Route: fix an admissible `t`; it suffices to treat `σ ≤ 3/2`, since for `σ ≥ 3/2` the Dirichlet
series gives `‖log L(σ + it)‖ ≤ n log ζ(3/2)` (the coefficients of `log L` are dominated by
`n Λ(m)/log m`), and it suffices to take `δ < 3/2 − σ₀`, the statement for a smaller `δ` implying
it for a larger one. About `s₀ = 2 + it` take the radii `r₀ = 2 − σ₀ − δ/4`, `r₃ = 2 − σ₀ − δ/2`,
`r₂ = 2 − σ₀ − δ` and `r₁ = 1/2`. The disc `closedBall s₀ r₀` lies in `Re s ≥ σ₀ + δ/4` and, at an
admissible height, avoids the pole `1`; there `L` is analytic and, zero-free right of `σ₀`,
nonzero (its order is `0` there, QuasiRiemannHypothesis §1.1), so it has a holomorphic logarithm
on a neighbourhood of the disc
(`TauCeti.exists_differentiableOn_eqOn_exp_comp`), equal to the Dirichlet series of `log L` on
`closedBall s₀ r₁ ⊆ {Re s ≥ 3/2}`, where its norm is at most `n log ζ(3/2)`. On `closedBall s₀ r₀`,
`Re log L = log ‖L‖ ≤ log C₁ + B log 𝔮(s)` by ZerosOfLFunctions §3.4 (the strip bound for the pole-cleared function
on the strip of ZerosOfLFunctions §3.4 and the Dirichlet series to its right, the constants depending on `n`
only for the two families, as in ZerosOfLFunctions §4.4), and `𝔮` changes across the disc by a factor at most `(7/3)^n`. Mathlib's
Borel–Carathéodory theorem (`Complex.borelCaratheodory`) on `ball s₀ r₀`, with `r₀ − r₃ = δ/4`,
bounds `‖log L‖` by `C₂ (log 𝔮(σ₀ + δ + it) + n)` on `closedBall s₀ r₃`. Hadamard's three circles
(3.2a) at `r₁ < r₂ < r₃` then give `‖log L‖ ≤ (n log ζ(3/2))^{1 − θ} (C₂ (log 𝔮 + n))^θ` on
`closedBall s₀ r₂`, with `θ = log(r₂/r₁)/log(r₃/r₁) < 1` depending on `σ₀` and `δ`; this disc
contains `σ + it` for `σ ∈ [σ₀ + δ, 2]`. Since `θ < 1`, `(log 𝔮)^θ ≤ ε log 𝔮 + C_ε`; exponentiate
(Titchmarsh, Chapter XIV, for `ζ`).

(ii) **A zero-free half-plane: the bounds of the Riemann hypothesis.** Let `σ₀ ∈ [1/2, 1)` and
`L` zero-free right of `σ₀`. There is `C`, depending only on `n` and `σ₀`, such that for every
admissible `t`, with `𝔮 = 𝔮(σ₀ + it)` and `𝔮₁ = 𝔮(1 + it)`:

- (a) if `𝔮 ≥ 16`, `log ‖L(σ + it)‖ ≤ C log 𝔮/log log 𝔮` for every `σ ≥ σ₀`;
- (b) if `𝔮 ≥ 16`, `‖log L(σ + it)‖ ≤ C log 𝔮/log log 𝔮` for every
  `σ ≥ σ₀ + 2(1 − σ₀)/log log 𝔮`;
- (c) Lindelöf: for every `ε > 0` there is `C_ε`, depending only on `n`, `σ₀` and `ε`, with
  `‖L(σ + it)‖ ≤ C_ε 𝔮(σ + it)^ε` for every `σ ≥ σ₀`, the line `σ = σ₀` included;
- (d) Littlewood, on `Re s = 1`: if `𝔮₁ ≥ 16`, `‖log L(1 + it)‖ ≤ n log log log 𝔮₁ + C` and
  `‖logDeriv L (1 + it)‖ ≤ C log log 𝔮₁`.

At `σ₀ = 1/2` the hypothesis is the Riemann hypothesis of `L`, and the threshold of (b) is
`1/2 + 1/log log 𝔮`. At `ℚ` and `σ₀ = 1/2`: under `RiemannHypothesis`,
`log |ζ(1/2 + it)| ≤ C log |t|/log log |t|` for `|t| ≥ 16`
(`log_norm_riemannZeta_le_of_riemannHypothesis`); for a primitive `χ ≠ 1` modulo `q`
satisfying its hypothesis, with an absolute `C`,
`log |L(1/2 + it, χ)| ≤ C log (q(|t| + 3))/log log (q(|t| + 3))`, and for `q ≥ 3`
`(C log log q)⁻¹ ≤ |L(1, χ)| ≤ C log log q` and `|logDeriv L(·, χ) 1| ≤ C log log q`
(`LFunction_one_bounds_of_generalizedRiemannHypothesis`). For every
`σ₀ ∈ [1/2, 1)` the bounds (a)–(d) hold likewise for a primitive `χ ≠ 1` modulo `q` whose
`χ.LFunction` is zero-free right of `σ₀`, read on the card of its primitive ray-class character
(9.5; 11.1), with `𝔮(s) = q (‖s + a‖ + 3)`, `a` the parity, and `C` depending on
`σ₀`.

Route. Write `Λ₀` for *entireCompletion* `d` (ZerosOfLFunctions Layer 0): `logDeriv Λ₀ = logDeriv L + ½ log N +
logDeriv γ + logDeriv P₀`, with `P₀ = s(s − 1)` for `ζ_K` and `1` otherwise. Every zero
`ρ = β + iγ` of `Λ₀` has `β ≤ σ₀` (strip form of 9.5; the zeros lie in the open strip by
ZerosOfLFunctions §§5.6a and 6.5). Below, `O(·)` and the constants `A`, `B` depend on `n` only; every dependence on `σ₀` is
written out, through the factor `1/(1 − σ₀)` and the choice of `x`. For `σ ∈ [σ₀, 2]`,
`𝔮(σ + it)` lies within a factor depending on `n` of `𝔮` (ZerosOfLFunctions §2.2).

1. By ZerosOfLFunctions §§5.5–5.6 and `Re b = −∑_ρ m_ρ Re(1/ρ)`, `Re logDeriv Λ₀ (s) = ∑_ρ m_ρ (σ − β)/‖s − ρ‖²` at
   every `s` that is not a zero, and this is `≥ 0` for `σ > σ₀`. By ZerosOfLFunctions §1.4,
   `Re logDeriv γ (s) ≤ ½ log(𝔮(s)/N) + O(1)` for `σ ≥ 1/2`, the shifts of the two families being
   `0` or `1`; and `Re logDeriv P₀` is bounded at admissible heights. Hence
   `Re logDeriv L (s) ≥ −½ log 𝔮(s) − O(1)` for `σ > σ₀`.
2. Fix `x ≥ e` and put `σ₁ = σ₀ + 1/log x`, `s₁ = σ₁ + it`. In 8.4b at `s = σ + it`, `σ ≥ σ₁`: for
   a nontrivial zero, `‖x^{2(ρ − s)} − x^{ρ − s}‖ ≤ 2x^{σ₀ − σ}` and `‖s − ρ‖ ≥ ‖s₁ − ρ‖` (as
   `β ≤ σ₀ < σ₁ ≤ σ`), and `σ₁ − β ≥ 1/log x` gives
   `∑_ρ m_ρ ‖s₁ − ρ‖^{−2} ≤ log x · Re logDeriv Λ₀ (s₁)` by step 1; so the nontrivial zero sum is
   at most `2x^{σ₀ − σ} Re logDeriv Λ₀ (s₁)`. The trivial zeros contribute `O(1)`; the pole term
   (`κ = 1`, `|t| ≥ 2`) at most `x^{2(1 − σ₀)}/(2 log x)`; and the prime sum at most
   `n ∑_{m ≤ x²} Λ(m) m^{−σ₀} ≤ A x^{2(1 − σ₀)}/(1 − σ₀)`, by Chebyshev's bound `ψ(y) ≤ c y` and
   partial summation, `∑_{m ≤ y} Λ(m) m^{−σ₀} ≤ c y^{1 − σ₀} (1 + σ₀/(1 − σ₀))`. At `s = s₁` the
   factor `2x^{σ₀ − σ₁} = 2/e` is below `1`, so 8.4b and
   `Re logDeriv Λ₀ ≤ ‖logDeriv L‖ + ½ log 𝔮 + O(1)` give
   `Re logDeriv Λ₀ (s₁) ≤ (1 − 2/e)⁻¹ (A x^{2(1 − σ₀)}/(1 − σ₀) + x^{2(1 − σ₀)}/(2 log x) + ½ log 𝔮 + O(1))`.
   Now take `x = (log 𝔮)^{1/(2(1 − σ₀))}`, so that `x^{2(1 − σ₀)} = log 𝔮` and
   `log x = log log 𝔮/(2(1 − σ₀)) ≥ 1` for `𝔮 ≥ 16` (`log log 16 > 1 ≥ 2(1 − σ₀)`): then
   `σ₁ = σ₀ + 2(1 − σ₀)/log log 𝔮` and `Re logDeriv Λ₀ (s₁) ≤ B log 𝔮/(1 − σ₀)`.
3. Integrating 8.4b over `[σ, ∞)`, `σ ≥ σ₁`, with the bound of step 2 for the zero sum at every
   `u ≥ σ` (`∫_σ^∞ 2x^{σ₀ − u} du ≤ 2/(e log x)`) and the pole term integrated (at most
   `x^{2(1 − σ₀)}/(4 log² x)`):
   `log L(σ + it) = ∑_{m ≤ x²} a_L(m) selbergWeight x m/(m^{σ + it} log m) + E` with
   `‖E‖ ≤ (2/(e log x)) Re logDeriv Λ₀ (s₁) + x^{2(1 − σ₀)}/(4 log² x) + O(1)`. The prime sum is at
   most `n ∑_{m ≤ x²} Λ(m)/(m^{σ₀} log m) ≤ A x^{2(1 − σ₀)}/((1 − σ₀)² log x)`: the terms `m > x`
   have `log m > log x`, and the terms `m ≤ x` give at most `A x^{1 − σ₀}/(1 − σ₀)`, with
   `x^{−(1 − σ₀)} log x ≤ 1/(e(1 − σ₀))`. With `x` as in step 2, `1/log x = 2(1 − σ₀)/log log 𝔮`,
   and each term is at most `(A/(1 − σ₀)) log 𝔮/log log 𝔮`: this is (b).
4. For `σ ∈ (σ₀, σ₁]`, `log ‖L(σ + it)‖ = log ‖L(s₁)‖ − ∫_σ^{σ₁} Re logDeriv L (u + it) du`,
   which by step 1 and (b) is at most
   `(A/(1 − σ₀)) log 𝔮/log log 𝔮 + (σ₁ − σ₀)(½ log 𝔮 + O(1))`, and
   `(σ₁ − σ₀) log 𝔮 = 2(1 − σ₀) log 𝔮/log log 𝔮`; at `σ = σ₀` the bound follows by continuity (if
   `L(σ₀ + it) = 0` there is nothing to prove). With (b) for `σ ≥ σ₁` this is (a). (c) follows,
   since `log 𝔮/log log 𝔮 ≤ ε log 𝔮 + C_ε` and `𝔮(σ + it)` is within a factor depending on `n` of
   `𝔮` for `σ ∈ [σ₀, 2]`, the Dirichlet series covering `σ ≥ 2`. The heights with `𝔮 < 16`, which
   (a) does not cover, occur only at `K = ℚ` (a field of degree `n ≥ 2` has `𝔮 ≥ |d_K| 3^n ≥ 27`):
   for `ζ` at `2 ≤ |t| < 13` and for the odd character modulo `3` at `|t| < 2`, the conductors `4`
   and above giving `𝔮 ≥ 17.5`. There (c), and the bounds at `ℚ` above, are the bound of ZerosOfLFunctions §3.4 at bounded
   conductor.
5. For (d) let `x₀ = x₀(σ₀) ≥ 16` be such that `4x^{σ₀ − 1} ≤ (1 − σ₀) log x` for every `x ≥ x₀`
   (the left side decreases and the right side increases in `x`; `x₀ = 16` at `σ₀ = 1/2`), take
   `x = max(x₀, (log 𝔮₁)^{1/(1 − σ₀)})`, so that `x^{σ₀ − 1} log 𝔮₁ ≤ 1`, and evaluate at `1 + it`.
   As in step 2, now with `Re (1/(1 + it − ρ)) = (1 − β)/‖1 + it − ρ‖² ≥ (1 − σ₀)/‖1 + it − ρ‖²`
   and `‖u + it − ρ‖ ≥ ‖1 + it − ρ‖` for `u ≥ 1`, the nontrivial zero sum of 8.4b at `u + it` is at
   most `(2x^{σ₀ − u}/((1 − σ₀) log x)) Re logDeriv Λ₀ (1 + it)`, and the factor at `u = 1` is at
   most `1/2`. So
   `Re logDeriv Λ₀ (1 + it) ≤ 2(n ∑_{m ≤ x²} Λ(m)/m + ½ log 𝔮₁ + O(1)) = O(log x + log 𝔮₁)`.
   Then 8.4b at `1 + it` gives
   `‖logDeriv L (1 + it)‖ ≤ n ∑_{m ≤ x²} Λ(m)/m + O(1) + (2x^{σ₀ − 1}/((1 − σ₀) log x)) O(log x + log 𝔮₁) = O(log x + 1/(1 − σ₀))`,
   and `log x ≤ log x₀ + log log 𝔮₁/(1 − σ₀)`: the second bound of (d). Integrating over `[1, ∞)`,
   where the zero sum contributes
   `(2x^{σ₀ − 1}/((1 − σ₀) log² x)) O(log x + log 𝔮₁) = O(1/(1 − σ₀))`, gives
   `log L(1 + it) = ∑_{m ≤ x²} a_L(m) selbergWeight x m/(m^{1 + it} log m) + O(1/(1 − σ₀))`, and the sum is at most `n ∑_{p^k ≤ x²} 1/(k p^k) ≤ n log log x² + O(1)` by
   Mertens' product (LFunctions Layer 8, at `ℚ`), with
   `n log log x² = n log log log 𝔮₁ + n log(2/(1 − σ₀))` when `x > x₀` and `n log log x₀²`
   otherwise: the first bound of (d). At `ℚ`, `t = 0`: `|L(1, χ)| = exp(Re log L(1, χ))`,
   `log log 𝔮₁ ≤ 11 log log q` for `q ≥ 3` (`𝔮₁ ≤ 5q`), and the one character with `𝔮₁ < 16`, the
   odd character modulo `3` (`𝔮₁ = 15`), enters through its two values `L(1, χ₋₃) = π/(3√3)` and
   `logDeriv L(·, χ₋₃) 1`, absorbed in `C`.

The bounds for a Dirichlet character, at every `σ₀`: let `χ ≠ 1` be primitive modulo `q` and
`ψ = PrimitiveRayClassCharacter.of ((ratDirichletEquiv q hq).symm χ)`, which is the image under
*toPrimitiveRayClassCharacter* of the bundle of `χ` (11.1), of level `q` as `χ` is primitive. By
9.5's rational bullet and the ray-class clause of QuasiRiemannHypothesis §1.1,
`heckeLFunctionC ψ.character` is zero-free right of `σ₀` exactly when
`χ.LFunction` is. The two functions have the same germ at every point (11.1) and
both are entire (`ψ ≠ 1`), so they are equal, with the same logarithm and logarithmic
derivative. The card `heckeData ψ` has conductor `q` and real gamma shift `a`
(11.1, cards), so `𝔮(s) = q (‖s + a‖ + 3)` (ZerosOfLFunctions §2.1), and (a)–(d) for `heckeData ψ`
are the bounds for `χ`.

(Titchmarsh, Chapter XIV, for `ζ` under the Riemann hypothesis, with Selberg's formula;
Iwaniec–Kowalski, Chapter 5, for the analytic conductor; Littlewood 1928 for `L(1, χ)`.)

*Needs:* 3.2a, 8.4b, 9.2, 9.5, 11.1 (the compatibility with the primitive sources and the
comparison of L-functions and cards); QuasiRiemannHypothesis §1.1 (values, the ray-class clause);
ZerosOfLFunctions §§1.4, 2.1–2.2, 3.4, 4.4, 5.5, 5.6, 5.6a,
6.5 and Layer 0 *entireCompletion*; LFunctions Layer 8 (Mertens' product
`tendsto_prod_one_sub_inv_absNorm_div_log` at `ℚ`); Mathlib
`Complex.borelCaratheodory`, `Chebyshev.psi_le_const_mul_self`; Tau Ceti
`TauCeti.exists_differentiableOn_eqOn_exp_comp` (the holomorphic logarithm, as in ZerosOfLFunctions §5.4);
ArithmeticDirichletSeries Abel summation, for the partial summations.

**Checks.**

- For `σ ≥ 2`: `‖ζ(σ + it)‖ ≤ ζ(2)` and `‖1/ζ(σ + it)‖ = ‖∑ μ(n) n^(−σ−it)‖ ≤ ζ(2)`, so (i) holds
  there with `ε = 0`.
- Without the hypothesis the second bound of (i) fails on any line through a zero: if
  `L(β + iγ) = 0` with `β > σ₀ + δ`, then `1/L` has a pole on `Re s = β`.
- The radii matter: with Borel–Carathéodory on the disc of radius `2 − σ₀ − δ`, the point
  `σ₀ + δ + it` lies on its boundary circle, where the three-circles exponent is `1`, and the route
  gives only `O(log |t|)` there; the middle circle must pass through `σ₀ + δ + it` inside a larger
  circle on which the logarithm is already bounded.
- In step 2 the factor `2x^{1/2 − σ₁}/((σ₁ − 1/2) log x)` equals `2/e ≈ 0.736`; with
  `σ₁ = 1/2 + 1/(2 log x)` it would be `4/√e ≈ 2.43`, and step 2 would not close.
- At `σ₀ = 1/2` the choices are those of the Riemann hypothesis: `x = log 𝔮`,
  `σ₁ = 1/2 + 1/log log 𝔮`, and in step 5 `x = max(16, (log 𝔮₁)²)` with the factor
  `2x^{−1/2}/((1/2) log x) = 4x^{−1/2}/log x ≤ 1/(4 log 2) ≈ 0.36` at `u = 1`.
- The primitive character modulo `3` has `𝔮₁ = 3 · (2 + 3) = 15` and `𝔮(1/2) = 3 · 4.5 = 13.5`:
  (a), (b) and (d) do not apply to it at `t = 0`, and the bounds at `ℚ` hold for it through ZerosOfLFunctions §3.4
  and the value `L(1, χ₋₃) = π/(3√3) ≈ 0.605`.

### 9.8 The argument under a zero-free half-plane, and `S(T)`

*Origin:* adapted from Titchmarsh (1986), Chapter XIV, and Carneiro, Chandee and Milinovich (2015):
Littlewood's bound `S(T) = O(log T/log log T)` under the Riemann hypothesis, by Selberg's method,
and its extension to the argument of a class of L-functions under their Riemann hypothesis; here
(ii) for the Dedekind zeta function and the L-function of a primitive ray-class character under a
zero-free half-plane `Re s > σ₀`, `σ₀ ∈ [1/2, 1)`, with constants depending only on the degree and
`σ₀`, which for `σ₀ > 1/2` is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

(i) Under `RiemannHypothesis` there is `C` with `|S(T)| ≤ C log T/log log T` for every `T ≥ 16`
that is not an ordinate (*S* of ZerosOfLFunctions §7.3).

(ii) Let `d` and `L` be as in 9.7, `σ₀ ∈ [1/2, 1)` and `L` zero-free right of `σ₀`. There is `C`,
depending only on the degree and `σ₀`, such that for every admissible `t` with
`𝔮 = analyticConductorAt d (σ₀ + it) ≥ 16` and `L(σ₀ + it) ≠ 0`, the variation of a continuous
argument of `L` along the segment from `2 + it` to `σ₀ + it` (the lift of ZerosOfLFunctions §7.3) is at most
`C log 𝔮/log log 𝔮` in absolute value. (i) is its case `σ₀ = 1/2` at `ζ`.

Route. (i) is (ii) at `ζ` and `σ₀ = 1/2`: `π S(T)` is the variation along
`2 → 2 + iT → 1/2 + iT`, on the vertical segment the argument stays in `(−π/2, π/2)` (the
Check of ZerosOfLFunctions §7.3), and `𝔮 = ‖1/2 + iT‖ + 3` is at least `T` and at most `T + 4`. For (ii), no zero of `L`
lies on the closed ray from `σ₀ + it` to the right (the zeros right of `σ₀` are excluded by the
hypothesis, `L(σ₀ + it) ≠ 0`, and there is no pole at an admissible height), so the logarithm of
9.7, the ray integral of `−logDeriv L`, is defined at `σ₀ + it` as well, and the variation is
`Im (log L(σ₀ + it) − log L(2 + it))`. Split at `σ₁ = σ₀ + 2(1 − σ₀)/log log 𝔮`, the point of
step 2 of 9.7(ii), and put `s₁ = σ₁ + it`, `a = σ₁ − σ₀`. The terms at `s₁` and `2 + it` are
`O(log 𝔮/log log 𝔮)` by 9.7(ii)(b) and the Dirichlet series. On `[σ₀, σ₁]`,
`log L(σ₀ + it) − log L(s₁) = −∫_{σ₀}^{σ₁} logDeriv L (u + it) du`, with
`logDeriv L = logDeriv Λ₀ − ½ log N − logDeriv γ − logDeriv P₀` as in 9.7. By ZerosOfLFunctions §5.6,
`Im (logDeriv Λ₀ (u + it) − logDeriv Λ₀ (s₁)) = ∑_ρ m_ρ Im (1/(u + it − ρ) − 1/(s₁ − ρ))`. For a
zero `ρ` put `b = σ₀ − Re ρ ≥ 0`, `V = σ₁ − Re ρ = a + b` and `y = t − Im ρ`; the absolute value
of the bracket is `|y| (V² − v²)/((V² + y²)(v² + y²))` at `v = u − Re ρ`, and its integral over
`u ∈ [σ₀, σ₁]` is at most `π a · Re (1/(s₁ − ρ)) = π a V/(V² + y²)`:

- for `b ≤ a`, extend the integral to `v ∈ [0, V]`, where for `y ≠ 0` it equals
  `((V² + y²) arctan(V/|y|) − V|y|)/(V² + y²) ≤ (π/2) V²/(V² + y²)`, by
  `arctan r ≤ ((π/2) r² + r)/(1 + r²)` for `r ≥ 0` (the difference vanishes at `0` and at `∞`
  and has derivative `r(π − 2r)/(1 + r²)²`), and `V ≤ 2a` (at `y = 0` the bracket vanishes);
- for `b > a`, `v ≥ b` gives `V² − v² ≤ a(a + 2b)` and `v² + y² ≥ b² + y² ≥ 2b|y|`, so the
  bracket is at most `a(a + 2b)/(2b(V² + y²)) ≤ (3a/2)/(V² + y²)` on an interval of length `a`,
  and `3a/2 ≤ π V`.

Summed with the multiplicities, by step 1 of 9.7(ii) at `s₁`, the zero terms are at most
`π a Re logDeriv Λ₀ (s₁) ≤ π a B log 𝔮/(1 − σ₀) = 2π B log 𝔮/log log 𝔮`, by step 2 of 9.7(ii).
The remaining terms are `a ‖logDeriv Λ₀ (s₁)‖ = O(log 𝔮/log log 𝔮)`, by 8.4b at `s₁`
as in step 2, and the variation of the gamma and polynomial terms over the segment, `O(1)` by
ZerosOfLFunctions §1.4. (Titchmarsh, Chapter XIV, for `ζ`; Iwaniec–Kowalski, Chapter 5, for the
analytic conductor.)

*Needs:* 8.4b, 9.3, 9.5, 9.7; ZerosOfLFunctions §§1.4, 5.5, 5.6, 7.3.

### 9.9 Prime counts under a zero-free half-plane

*Origin:* adapted from Ingham (1932), Chapter IV, Davenport (2000), §§18 and 20, and Lagarias and
Odlyzko (1977): the prime counts at `ℚ` with the error given by an upper bound for the real parts of
the zeros of `ζ` (ZerosOfLFunctions §8.5a), the prime counts at `ℚ` and in progressions, and, under
the Riemann hypothesis for `ζ_L`, Chebotarev's theorem with an error term; here over a number
field, in a ray class and in the Frobenius classes of an abelian extension, under a zero-free
half-plane right of `σ` and with constants independent of `σ`, which is this roadmap's own
formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Fix a number field `K`. Constants and thresholds below depend on `K`, the modulus `𝔪` and, in
(iii), on `L`; they do not depend on `σ ∈ [1/2, 1)`.

(i) If `dedekindZetaC K` is zero-free right of `σ ∈ [1/2, 1)`, then `ψ_K(x) = x + O(x^σ log² x)`
and `π_K(x) = Li x + O(x^σ log x)`, with `ψ_K = TauCeti.primePsi K Set.univ`,
`π_K = TauCeti.primeCount K Set.univ` and `Li = TauCeti.Real.logIntegral`
(`primePsi_primeCount_of_zeroFreeRightOf`).

(ii) For a modulus `𝔪`: if `heckeLFunctionC χ` is zero-free right of `σ` for every
`χ : RayClassCharacter 𝔪`, then for every class `c`, *rayClassPsi* `𝔪 c x = x/#Cl_𝔪 +
O(x^σ log² x)`, and the number of prime ideals prime to `𝔪` in `c` of norm at most `x` is
`Li x/#Cl_𝔪 + O(x^σ log x)`. By the ray-class clause of QuasiRiemannHypothesis §1.1 the
hypothesis may be checked on the primitive characters.

(iii) For `L/K` with a reciprocity dictionary `Φ` at `𝔪` (ZerosOfLFunctions §8.8): if `heckeLFunctionC (ψ ∘ Φ)` is
zero-free right of `σ` for every character `ψ` of `Gal(L/K)`, then
`frobeniusPsi C x = (#C/#G) x + O(x^σ log² x)` and
`frobeniusPrimeCount C x = (#C/#G) Li x + O(x^σ log x)`.

At `σ = 1/2` the prime counts of (iii), and that of (i) for `K ≠ ℚ` (the case `L = K`), also follow
from AnalyticNumberTheoryPartI §2.49 (ii), which assumes ERH(`L`), holds for every Galois `L/K` and
is uniform in `L`, and with explicit constants from ExplicitNumberFields §7.2, under `DedekindERH L`
and further computational hypotheses; for abelian `L/K`, ERH(`L`) is the hypothesis of (iii) at
`σ = 1/2` through the factorization of `ζ_L` over the characters of `Gal(L/K)`, which is not stated
here.

At `K = ℚ` and `𝔪 = 1`: if `riemannZeta` is zero-free right of `σ`, so is `dedekindZetaC ℚ`
(9.5, rational bullet), which is the hypothesis of (i), and `Chebyshev.psi x − x` and
`Chebyshev.theta x − x` are `O(x^σ log² x)` and `π(x) − Li x = O(x^σ log x)`, with an absolute
constant; under `RiemannHypothesis` the errors are `O(√x log² x)`
(`psi_sub_self_isBigO_sqrt_mul_log_sq_of_riemannHypothesis`) and `O(√x log x)` (von Koch;
`primeCounting_sub_logIntegral_isBigO_of_riemannHypothesis`). At `𝔪 = (q)∞`: the
same for the primes in a reduced class modulo a fixed `q`, under the same zero-free half-plane
for every Dirichlet character modulo `q` (9.5, rational bullet), which is the hypothesis of (ii),
`ratDirichletEquiv q hq` being a bijection of the characters. (Ingham, Chapter IV, at `ℚ`;
Davenport, §§18 and 20, at `ℚ` and at `(q)∞`.) For a fixed `σ` the bounds for `Chebyshev.psi` and
`π` at `ℚ` are Ingham's theorem, ZerosOfLFunctions §8.5a, whose constants may depend on `σ`; the
constant independent of `σ` is that of (i) at `K = ℚ`.

At `σ = 1/2` the bound for `ψ_K` in (i) is ClassicalArithmeticCompletion §5.16a (i), which gives it
with explicit constants for `x ≥ 100` under `DedekindERH K`, that is `ExtendedRiemannHypothesis K`
(9.5); at `K = ℚ` under `RiemannHypothesis` the bound for `Chebyshev.psi` follows from it. The
bounds at `ℚ` sharpen AnalyticNumberTheoryPartI §1.9: its (i) is `O_ε(x^{1/2+ε})` for
`Chebyshev.psi x − x` under `RiemannHypothesis`, and its (ii) the same exponent for the primes in a
reduced class modulo `q` under `DirichletGRH χ` for every `χ` modulo `q`, which is the hypothesis at
`(q)∞` above at `σ = 1/2` (the bridge of 9.4). QuasiRiemannHypothesis §10.7 proves every Dirichlet
L-function, `riemannZeta` included, zero-free right of `11/12`, so the statements at `ℚ` and at
`(q)∞` above hold unconditionally at `σ = 11/12`: for instance
`Chebyshev.psi x − x = O(x^{11/12} log² x)`.

Route: the truncated formulas of ZerosOfLFunctions §§8.3 and 8.6 at height `T = x`, whose truncation error is then
`O(log² x)`; every zero in the sum has `Re ρ ≤ σ` (strip forms of 9.5), so the zero sum is at most
`x^σ ∑_{|Im ρ| ≤ x} m_ρ/‖ρ‖ = O(x^σ log² x)` by ZerosOfLFunctions §4.5, the finitely many zeros with `|Im ρ| < 1`
being at a fixed positive distance from `0` (ZerosOfLFunctions §6.5), whatever `σ`; the remaining terms are
`O(log x)`, and at a prime-power norm the jump is `O(log x)`. For (ii) the orthogonality of ZerosOfLFunctions §8.7,
for (iii) the transport of ZerosOfLFunctions §8.8; for the prime counts the higher prime powers, `O(√x log² x)`, are
removed and the Abel identity is applied as in ZerosOfLFunctions §§8.5 and 8.7, where
`∫_2^x t^{σ − 1} dt ≤ x^σ/σ ≤ 2x^σ` keeps the constant independent of `σ`.

*Needs:* 9.2, 9.5; QuasiRiemannHypothesis §1.1 (the ray-class clause); ZerosOfLFunctions §§4.5,
6.5, 8.3, 8.5–8.8; ArithmeticDirichletSeries §§5.2, 6.1–6.2 and 10.1–10.2, as in ZerosOfLFunctions
§§8.5 and 8.7; ClassicalArithmeticCompletion §5.16a (i) for `ψ_K` at `σ = 1/2`.

**Checks.**

- The range `σ ≥ 1/2` is forced: every Dedekind zeta function has infinitely many zeros (ZerosOfLFunctions §7.6), and
  the symmetry `ρ ↦ 1 − conj ρ` of 9.3 puts one of each pair at real part at least `1/2`, so the
  hypothesis fails for `σ < 1/2`.
- At `K = ℚ`, `L = ℚ(i)`, `𝔪 = (4)∞`, (iii) needs the hypothesis for `ζ` and for `L(·, χ₋₄)`; the
  primes `p ≡ 3 (mod 4)` then number `Li x/2 + O(x^σ log x)`.

### Examples

- `(1 : DirichletCharacter ℂ 2).GeneralizedRiemannHypothesis ↔ RiemannHypothesis` (9.4).
- `ExtendedRiemannHypothesis ℚ(i)` is `RiemannHypothesis` together with the hypothesis for `χ₋₄`
  (9.5).
- von Koch: under `RiemannHypothesis`, `π(x) = Li x + O(√x log x)` (9.9).
- Littlewood: for a quadratic character `χ_D` satisfying its hypothesis,
  `L(1, χ_D) ≥ (C log log |D|)⁻¹` (9.7(ii)(d)).

### Dependencies

Layers 3 and 8 (3.2a for 9.7; 8.4a and 8.4b for 9.6–9.8), and 10.2 and 11.1 of Layers 10 and 11,
which use nothing of this layer. QuasiRiemannHypothesis §1.1 for the predicate `ZeroFreeRightOf`
and its first properties; CharacterSumsOverFiniteFields §7.1 for the instance `NeZero χ.conductor`;
AnalyticNumberTheoryPartI §§1.6 and 2.42 and ClassicalArithmeticCompletion §5.0 for the bridges of
9.4 and 9.5, and AnalyticNumberTheoryPartI §§1.6a and 2.42a for their forms at `σ = 1/2` (the
inverse, reflection and strip-form clauses of 9.4 being corollaries of §1.6a, and its
change-of-level, primitive-character, modulus-one and quantified clauses of §1.6);
ClassicalArithmeticCompletion §5.16a for 9.9. ZerosOfLFunctions Layer 0 for
*entireCompletion* and Layer 9 for *AllOnCriticalLine* and *GRH* and §9.1, of whose case `q = 1`
the `ζ` clause of 9.3 is a corollary;
ZerosOfLFunctions §§1.4–1.6, 2.1–2.2, 3.4, 4.4–4.5, 5.5–5.6a, 6.2–6.5,
7.3, 7.6 and 8.3–8.8 for 9.3–9.9, and §8.5a, cited for the case `ℚ` of 9.9. LFunctions Layers 0 and 3–8. Mathlib `RiemannHypothesis`,
`meromorphicOrderAt`, `Complex.borelCaratheodory`, the continued Dirichlet L-functions and their
functional equation.

## Layer 10: Primitive Dirichlet characters, conductors and gamma factors

This layer works with Mathlib's Dirichlet characters and their L-functions: it proves that the
gamma factor has no zero on `Re s > 0`, and bundles a primitive character with its conductor. The
instance `NeZero χ.conductor` it uses is that of CharacterSumsOverFiniteFields §7.1 (Conventions).

### 10.2 The gamma factor has no zero on `Re s > 0`

*Origin:* adapted from the classical fact that the Gamma function has no zero, and no pole on
`Re s > 0`, in Mathlib's form `Complex.Gammaℝ_ne_zero_of_re_pos`: here for Mathlib's gamma factor of
a Dirichlet character, `Gammaℝ s` or `Gammaℝ (s + 1)` by parity, with its analyticity on `Re s > 0`.

*Method of the formal proof:* the gamma factor is `Gammaℝ s` for an even character and
`Gammaℝ (s + 1)` for an odd one, and `Gammaℝ` has no zero on `Re s > 0`.

Prove that for `0 < Re s`,
`χ.gammaFactor s ≠ 0`, and Mathlib's `gammaFactor χ` is analytic at `s`. The gamma factor is
`Gammaℝ s` for even `χ` and `Gammaℝ (s + 1)` for odd `χ` (`Even.gammaFactor_def`,
`Odd.gammaFactor_def`), and `Gammaℝ` has no zero and no pole on `Re s > 0`
(`Complex.Gammaℝ_ne_zero_of_re_pos`). So on `Re s > 0` the zeros of `χ.LFunction` and of
`χ.completedLFunction` coincide with multiplicity, through
`LFunction_eq_completed_div_gammaFactor`. For primitive `χ ≠ 1` this multiplicity statement is the
completion comparison of ZerosOfLFunctions §6.4a (for the record's completed function, which has
the further nonzero factor `q^(s/2)`); 10.2 gives it for every `χ`. The nonvanishing of the gamma factor is [FormalProof],
`Formalism/GammaFactorNonvanishing/CritLine.lean` (`Formalism.VW.gammaFactor_ne_zero`),
`Development/AutomorphicArithmetic/CharacterBoxes/ClaimStrip.lean` (`Claim.gamma_ne_zero`).

*Needs:* Mathlib `DirichletCharacter.gammaFactor`, `DirichletCharacter.Even.gammaFactor_def`,
`DirichletCharacter.Odd.gammaFactor_def`, `DirichletCharacter.even_or_odd`,
`Complex.Gammaℝ_ne_zero_of_re_pos`, `Complex.differentiable_Gammaℝ_inv`.

**Checks.**

- Even `χ` at `s = 0`: `Gammaℝ` has a pole, Mathlib's `gammaFactor χ 0` is the junk value `0`
  (`gammaFactor_eq_zero_iff_of_even`), and `L(0, χ) = 0` for the even nontrivial primitive
  characters, the trivial zero; the strict `0 < Re s` is needed.
- Odd `χ` at `s = 0`: `Gammaℝ(1) = 1`, nonzero; the first pole is at `s = −1`, and
  `gammaFactor_eq_zero_iff_of_odd` reads it there.

### 10.3 The bundled primitive Dirichlet character

*Origin:* definitions and conventions.

Define `PrimitiveDirichletCharacter`, a primitive Dirichlet character bundled with its conductor:
a level `level : ℕ+`, a character `character : DirichletCharacter ℂ level` and a proof
`isPrimitive : character.IsPrimitive`. It is the Dirichlet counterpart of
`PrimitiveRayClassCharacter`, built on Mathlib's characters so that its L-function is Mathlib's
`DirichletCharacter.LFunction`; a primitive character cannot carry a second level. The bundle corresponds to [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/PrimePairSizeCondition.lean` (`Formalism.HC.PChar`),
whose level is a natural number `N` with an instance `NeZero N` where the level here is in `ℕ+`.

- *PrimitiveDirichletCharacter.of* `χ`, for `[NeZero N]` and `χ : DirichletCharacter ℂ N`, the
  *bundle of `χ`*: the bundle of `χ.conductor`, `χ.primitiveCharacter` and
  `primitiveCharacter_isPrimitive`. Its level is `χ.conductor`; the bundle of the character of a
  bundle `ψ` is `ψ`; and for `M ∣ N` and `ψ : DirichletCharacter ℂ M`, `changeLevel h ψ` and `ψ`
  have the same bundle (`changeLevel_primitiveCharacter`). The bundle of `χ` corresponds to [FormalProof],
  `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/PrimePairSizeCondition.lean` (`Formalism.HC.PChar.of`).
- Equality: two bundles are equal exactly when their characters agree after lifting both to the
  product of the levels (`DirichletCharacter.changeLevel`). This and the change of level above follow from [FormalProof],
  `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean` (`Formalism.HC.An.Induces.unique`).
- `1`, the character modulo `1`; the trivial character modulo every `N` has bundle `1`.
- `ψ⁻¹`, the inverse character at the same level, primitive by `IsPrimitive.inv`; the bundle of
  `χ⁻¹` is the inverse of the bundle of `χ` (`conductor_inv`, the primitive character of `χ⁻¹`
  being the inverse of that of `χ`); `1⁻¹ = 1`.
- The L-function of a bundle `ψ` is `ψ.character.LFunction`. For `χ ≠ 1 ∨ s ≠ 1`, with
  `χ' = χ.primitiveCharacter`, whose L-function is that of the bundle of `χ`,
  `χ.LFunction s = χ'.LFunction s · ∏_{p ∣ N} (1 − χ'(p) p^(−s))` (`LFunction_changeLevel`); and
  the card of `ψ` is `dirichletData ψ.character ψ.isPrimitive`.

*Needs:* Mathlib `DirichletCharacter.conductor`, `DirichletCharacter.primitiveCharacter`,
`DirichletCharacter.primitiveCharacter_isPrimitive`, `DirichletCharacter.changeLevel`,
`DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.IsPrimitive.inv`,
`DirichletCharacter.conductor_inv`, `DirichletCharacter.isPrimitive_one_level_one`,
`DirichletCharacter.LFunction_changeLevel`; LFunctions Layer 4 (`dirichletData`); the instance
`NeZero χ.conductor` of CharacterSumsOverFiniteFields §7.1.

**Checks.**

- The bundle of the principal character modulo `6` is `1`, of level `1`, not a character of level
  `6`; a bundle that kept the level of presentation would give the principal character modulo `6` a
  card of conductor `6`.
- The bundle of the character modulo `12` induced by the character `χ*` modulo `3` has level `3`;
  the L-function of the character modulo `12` is that of `χ*` times `1 − χ*(2) 2^(−s) = 1 + 2^(−s)`
  (as `χ*(2) = −1`) and the factor `1` at `3`, where `χ*` vanishes.
- `ψ⁻¹` of the order-three character modulo `7` is its conjugate, of level `7`; `ψ⁻¹` of a
  quadratic character is itself.

### Examples

- The principal character modulo `6` has conductor `1`; its primitive character is the character
  modulo `1`, whose L-function is `riemannZeta`, and its bundle is `1`, of level `1` (10.3).
- For even `χ`, Mathlib's `gammaFactor χ 0` is the junk value `0` at the pole of `Gammaℝ`, while for
  odd `χ` the gamma factor at `0` is `Gammaℝ(1) = 1` (10.2).
- The bundle of the character modulo `12` induced by the character `χ*` modulo `3` has level `3`,
  and the L-function of the character modulo `12` is that of `χ*` times `1 + 2^(−s)` (10.3).

### Dependencies

Mathlib `DirichletCharacter.conductor`, `DirichletCharacter.gammaFactor`,
`DirichletCharacter.primitiveCharacter`, `DirichletCharacter.changeLevel`,
`DirichletCharacter.LFunction_changeLevel` and `Complex.Gammaℝ_ne_zero_of_re_pos`; LFunctions
Layer 4 (`dirichletData`); CharacterSumsOverFiniteFields §7.1 (the instance `NeZero χ.conductor`).

## Layer 11: Primitive Dirichlet characters as primitive ray-class characters

This layer identifies the primitive Dirichlet characters of Layer 10 with the primitive ray-class
characters of `ℚ`, with their values, conductors, L-functions and cards.

### 11.1 Primitive Dirichlet characters as primitive ray-class characters of `ℚ`, and their cards

*Origin:* adapted from Milne (2020), Introduction and Chapter V, §3: the ray-class characters of `ℚ`
at the modulus `(N)·∞` are the Dirichlet characters modulo `N`, their L-series are Dirichlet's, and
each has one primitive character, whose finite conductor is that of the Dirichlet character
(AnalyticNumberTheoryPartI §0.30); here as an equivalence of bundled primitive characters, with the
compatibility with the primitive sources and the comparison of the cards, the normalized card at
conductor one included.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Define *PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter*, an equivalence
`PrimitiveDirichletCharacter ≃ PrimitiveRayClassCharacter ℚ` sending `ψ` to
`ψ_ℚ = PrimitiveRayClassCharacter.of ((ratDirichletEquiv ψ.level _).symm ψ.character)`.

The conductor and parity of the image, its values and its L-function are those of the dictionary of
AnalyticNumberTheoryPartI §0.30 at `q = ψ.level`, where `ψ` is primitive; the equivalence, the
compatibility with the primitive sources and the cards are stated here.

- The image `ψ_ℚ` has finite conductor `(ψ.level)` and contains the real place exactly when `ψ` is
  odd (`TauCeti.GlobalNumberFields.RayClassCharacter.conductor_finitePart_eq_span`,
  `TauCeti.GlobalNumberFields.RayClassCharacter.conductor_infinitePart_eq_empty_iff_even`); its
  value at an ideal `(n)` prime to the level is `ψ.character n`, with no inverse or conjugation
  (`ratDirichletEquiv_absNorm`); and the map commutes with `1` and `ψ⁻¹`.
- The inverse presents a primitive ray-class character of `ℚ` at the modulus `(n)·∞` of its finite
  conductor and reads it through `ratDirichletEquiv`.
- Compatibility with the primitive sources at any level: for `[NeZero N]` and
  `χ : DirichletCharacter ℂ N`, the image of the bundle of `χ` (10.3) is
  `PrimitiveRayClassCharacter.of ((ratDirichletEquiv N _).symm χ)`. Route: `χ` is the change of
  level of `χ.primitiveCharacter` from `f = χ.conductor` (`changeLevel_primitiveCharacter`), so
  `(ratDirichletEquiv N _).symm χ` is the character of `(f)·∞` attached to `χ.primitiveCharacter`,
  induced to `(N)·∞` (`TauCeti.GlobalNumberFields.ratDirichletEquiv_induced`, with
  `TauCeti.GlobalNumberFields.ratModulus_dvd_ratModulus_iff` for `f ∣ N`), and the primitive source
  does not change under induction (`PrimitiveRayClassCharacter.of_induced`). Together with the
  bullets below, a Dirichlet character presented at any level and its ray-class character at `(N)·∞`
  have one primitive source and one card.
- L-functions: `heckeLFunctionC ψ_ℚ.character` and
  `ψ.character.LFunction` have the same germ at every point, the two series agreeing on `Re s > 1`
  term by term (`eventuallyEq_of_meromorphic_of_eqOn_halfPlane`), and agree off `s = 1`.
- Cards: `heckeData ψ_ℚ`, built by `ofSeries` (LFunctions Layer 0), and
  `dirichletData ψ.character ψ.isPrimitive` have the same coefficients at every positive index, the
  conductor `ψ.level`, the real gamma shift `0` or `1` by parity, the same root number and the same
  polar divisor, and the completed function of the first is the meromorphic normal form of that of
  the second. So `heckeData ψ_ℚ` agrees under `EqOffZero` with the
  normalized card `{ dirichletData ψ.character ψ.isPrimitive with completed :=
  toMeromorphicNFOn (dirichletData ψ.character ψ.isPrimitive).completed univ }`, for every `ψ`:
  `ofSeries_eq_normalized` applied to `dirichletData`, whose hypotheses are its three card
  predicates, its regularity on `Re s > 1` and its nonzero value at `2`. For `ψ ≠ 1` the completed
  function of `dirichletData` is entire, hence its own normal form, and the two cards themselves
  agree under `EqOffZero`: this is the comparison card of LFunctions Layer 8 for primitive Dirichlet
  and primitive ray-class characters. For `ψ = 1` they do not: `dirichletData` is then `riemannZetaData`
  (`dirichletData_modOne`), whose completed function `completedRiemannZeta` takes Mathlib's
  nonzero value `(γ − log 4π)/2` at `1` and at `0`, where the normal form takes `0`; the
  comparison at conductor one is the normalized one, `ofSeries_riemannZetaData`. In every case
  the two completed functions agree off `{0, 1}` and have the same punctured germ at every point,
  hence the same orders, zeros and poles.

*Needs:* 10.3 (`PrimitiveDirichletCharacter`); AnalyticNumberTheoryPartI §0.30 (the rational
dictionary); LFunctions Layer 0 `EqOffZero`, `ofSeries`, with Tau Ceti
`TauCeti.LFunctions.AnalyticLFunctionData.ofSeries_eq_normalized` and
`TauCeti.LFunctions.ofSeries_riemannZetaData`; Layer 3
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane`; Layer 4 `dirichletData`, with Tau Ceti
`TauCeti.LFunctions.dirichletData_hasDirichletAgreement`,
`TauCeti.LFunctions.dirichletData_hasMeromorphicContinuation`,
`TauCeti.LFunctions.dirichletData_hasFunctionalEquation` and
`TauCeti.LFunctions.dirichletData_modOne`; Layer 5
`PrimitiveRayClassCharacter`,
`PrimitiveRayClassCharacter.of`, `heckeLFunctionC`, `heckeData`, with Tau Ceti
`TauCeti.LFunctions.PrimitiveRayClassCharacter.of_induced` (the primitive source does not depend
on the presentation); Layer 8 (the comparison cards); GlobalNumberFields, in the namespace
`TauCeti.GlobalNumberFields`:
`ratModulus`, `ratFiniteModulus`, `ratDirichletEquiv`, `ratDirichletEquiv_absNorm`,
`ratDirichletEquiv_induced`, `ratModulus_dvd_ratModulus_iff`,
`RayClassCharacter.conductor_finitePart_eq_span`,
`RayClassCharacter.conductor_infinitePart_eq_empty_iff_even`; Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.conductor_dvd_level`,
`toMeromorphicNFOn`, `completedRiemannZeta_one`.

**Checks.**

- The image of `χ₋₄` under *toPrimitiveRayClassCharacter* has conductor `ratModulus 4`, the real
  place included, and its card is the comparison card of the `χ₄` Check of LFunctions Layer 8; that
  of the even quadratic character modulo `5` has conductor `ratFiniteModulus 5`, without it. A map
  that kept the modulus `(5)·∞` of `ratDirichletEquiv` would record a real place and the gamma shift
  of an odd character.
- For the quartic character modulo `5` with `χ(2) = i`, the ideal `(2)` has value `i`; a map through
  the inverse character would give `−i` and the card of `χ⁻¹`, whose root number is the conjugate.
- Compatibility at the character `χ` modulo `12` induced from the odd character `χ*` modulo `3`:
  the bundle of `χ` (10.3) has level `3` and character `χ*`, whose image has conductor
  `ratModulus 3`, the real place included; the ray-class character `(ratDirichletEquiv 12 _).symm χ`
  of `(12)·∞` has the same primitive source, of conductor `ratModulus 3`, and not `ratModulus 12`. At
  the principal character modulo `6` both sides are `1`.
- Conductor one: `completedRiemannZeta 1 = (γ − log 4π)/2 ≈ −0.9769`
  (`completedRiemannZeta_one`), while the completed function of the card of the trivial character
  of `ℚ`, a normal form with a pole at `1`, is `0` there. `EqOffZero`, which compares completed
  functions as total functions, therefore fails between that card and `dirichletData` of the
  character modulo `1`; it holds with the normalized card. A comparison stated through
  `EqOffZero` with `dirichletData` itself is true exactly for `ψ ≠ 1`.

### Examples

- The image of `χ₋₄` has conductor `ratModulus 4`, the real place included, and that of the even
  quadratic character modulo `5` has conductor `ratFiniteModulus 5`, without it (11.1).
- At conductor one, `completedRiemannZeta 1 = (γ − log 4π)/2 ≈ −0.9769`, while the completed
  function of the card of the trivial character of `ℚ`, a normal form with a pole at `1`, is `0`
  there; the comparison at conductor one is the normalized one (11.1).

### Dependencies

Layer 10 (10.3); AnalyticNumberTheoryPartI §0.30; LFunctions Layers 0, 3, 4, 5 and 8;
GlobalNumberFields (`ratModulus`,
`ratFiniteModulus`, `ratDirichletEquiv` and its lemmas); Tau Ceti
`TauCeti.LFunctions.PrimitiveRayClassCharacter.of_induced`; Mathlib `toMeromorphicNFOn`,
`completedRiemannZeta_one`.

## Downstream consumers

- In this family, GeneralizedRiemannHypothesisFromWindowBounds takes the Riesz remainders of 8.4a,
  the predicates and equivalent forms of 9.2–9.5, the
  remainder bound of 9.6 (c), the prime counts of 9.9 at `ℚ`, the bundle 10.3 and the dictionary
  11.1; its headline theorems are
  the hypotheses of 9.3 for `ζ` and of 9.4 for every Dirichlet character.
- Outside this family, ConsequencesOfTheRiemannHypothesisForDirichletLFunctions takes the
  independence of the dictionary
  of 8.8, the predicates and records of 9.2–9.5, the Riesz remainders of 8.4a, the bundle 10.3 and
  the dictionary 11.1, and feeds the headline theorems of
  GeneralizedRiemannHypothesisFromWindowBounds at `σ = 1/2` into 9.6 (a) and (c) (its
  §0.5), 9.7 (its §§1.1 and 4.1), 9.8 (its §1.2) and 9.9 (its §§2.1 and 3.1).
- FrobeniusRestrictedRieszSums takes 8.8a for the Frobenius-restricted sums of an abelian CM field,
  at the modulus `N·∞` of a cyclotomic field containing it, and 10.3 for the cyclic family of a
  primitive Dirichlet character.
- QuadraticTwistSelectionOverPrimes takes the Dirichlet remainder of 8.4a for its selection of
  twists, and RieszSumsOverPrimesAndExceptionalZeros the inversion of the kernel `1/(w(w − 1))` of
  8.4a (a); RieszSumsOverPrimesAndExceptionalZeros §2.41a states the Riemann hypothesis of an Artin
  L-function as the predicate of 9.2 on its continuation.
- On main, the Riemann hypotheses of AnalyticNumberTheoryPartI §§1.6 and 2.42 and
  ClassicalArithmeticCompletion §5.0, which AnalyticNumberTheoryPartI (§§1.9, 2.49),
  ExplicitZetaBounds (§0.2), ExplicitPrimeCounting (§6.5) and ClassicalArithmeticCompletion
  (§§5.1b–5.1c, 5.16a) carry as hypotheses, are equivalent to those of 9.4 and 9.5 by the bridges
  stated there; AnalyticNumberTheoryPartI §1.9 can take 9.7 and 9.9 at `ℚ`,
  ExplicitZetaBounds §2.9 the bound 9.8 for `S(T)`, and ExplicitMultiplicativeFunctions the bound
  9.7 (i) for `1/ζ`.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns Riesz sums and the Riesz remainder of a primitive ray-class or Dirichlet
character with its Mellin transform, continuation, poles and explicit formula (8.4a); Selberg's
smoothed formula for the logarithmic derivative of Dedekind zeta and Hecke L-functions (8.4b); the
Riesz-smoothed character sums through a surjection of a ray class group and
their Frobenius reading (8.8a); the limit form of monotonicity, the converse product clause, the
symmetries and the change of level of the zero-free half-plane predicate (9.2); the
Riemann hypothesis, read through orders, of an analytic record (9.3), of a Dirichlet character
(9.4), of a Dedekind zeta function, of a ray-class character and of a Grossencharacter (9.5), each
with its equivalent forms, its bridge to the predicate of the roadmap on main that names it where
there is one, and, at `ℚ`, its bridge to Mathlib's `RiemannHypothesis`; the consequences of a zero-free half-plane
`Re s > σ`, `σ ∈ [1/2, 1)`, the hypothesis being the case `σ = 1/2`: exceptional zeros and the
Riesz remainder (9.6), growth, the Lindelöf bound, the bound `exp(C log 𝔮/log log 𝔮)` and
Littlewood's bounds on `Re s = 1` (9.7), the argument along a horizontal segment and `S(T)` (9.8),
and prime counts (9.9); the nonvanishing of the gamma factor of a Dirichlet character on
`Re s > 0` (10.2); the bundled primitive Dirichlet character
(10.3); and its equivalence with the primitive ray-class characters of `ℚ`, with the comparison of
their L-functions and cards (11.1). The rational dictionary at every level that 11.1 reads at the
primitive level is AnalyticNumberTheoryPartI §0.30, the comparison cards, to which 11.1 adds the
normalized comparison at conductor one, are LFunctions Layer 8, and the inversion of Riesz sums in
8.4a (a) is a case of ExplicitZetaBounds §6.1a. Hadamard's three-circles theorem, of which 3.2a
states the form 9.7 uses, is AnalyticNumberTheoryPartIII §8.2a. The explicit formula for the first
Riesz mean, of which the explicit formula of 8.4a is a corollary, is ZerosOfLFunctions §8.6a, which
defines the Euler–Kronecker constant that 8.4a (b) uses; Selberg's formula for `ζ′/ζ`, the case `ζ`
of 8.4b, is ZerosOfLFunctions §8.4a; the independence of the primitive characters from the reciprocity
dictionary, which 8.8 states in the form used here, is ZerosOfLFunctions §8.7a; and the prime
counts at `ℚ` for a fixed `σ`, which 9.9 gives with a constant independent of `σ`, are
ZerosOfLFunctions §8.5a.

The theory these statements extend is owned by roadmaps on main. Growth predicates and the entire
completion, gamma factors and the continued L-function, the analytic conductor, convexity, zero
counting, Hadamard factorization, zero-free regions and exceptional zeros, the Riemann–von
Mangoldt formula and `S(T)`, the explicit formulas, the effective prime counts, the reciprocity
dictionaries with their exceptional terms, and certified zeros are
[ZerosOfLFunctions](../../ZerosOfLFunctions/README.md) Layers 0–9. Analytic records, the Dedekind,
Dirichlet and Hecke L-functions, primitive ray-class characters, Grossencharacters, nonvanishing on
`Re s = 1`, comparison cards and Mertens' product are [LFunctions](../../LFunctions/README.md)
Layers 0–8. The ideal von Mangoldt function, truncated Perron summation and Abel summation are
[ArithmeticDirichletSeries](../../../Completed/ArithmeticDirichletSeries/README.md); ray-class
characters, their induction and conductors and the rational dictionary `ratDirichletEquiv` are
[GlobalNumberFields](../../../Completed/GlobalNumberFields/README.md); admissible moduli and the
ray-class Artin map are [ClassFieldTheory](../../ClassFieldTheory/README.md). The instance
`NeZero χ.conductor` of a Dirichlet character over a nonzero level is
[CharacterSumsOverFiniteFields](../../CharacterSumsOverFiniteFields/README.md) §7.1.

The zero-free half-plane predicate `ZeroFreeRightOf`, with its monotonicity, its invariance under
germs, its product rules, its value form at points of analyticity and its forms for Dirichlet and
ray-class L-functions, is [QuasiRiemannHypothesis](../../QuasiRiemannHypothesis/README.md) §1.1.
That roadmap also bounds the Hecke L-functions of one field in a zero-free disc (§5.3) and derives
the zero strip of the primitive characters from a zero-free half-plane for all of them (§11.1);
9.7 (i) and the strip forms of 9.4 and 9.5 differ from these as said there.

Forms on main that differ. ZerosOfLFunctions Layer 9 defines *GRH* over its two families through the
divisor of the completed function; 9.3 reads the hypothesis of a record through the meromorphic
order, which for those families is the same statement (its divisor form) and which, unlike the
divisor reading, fails for an identically zero completed function. AnalyticNumberTheoryPartI §1.6
states *DirichletGRH* `χ` in the value form on `Re s > 0`, the right side of the second strip form
of 9.4, and §1.6a its conjugation, reflection and half-plane forms, of which the inverse, reflection
and strip-form clauses of 9.4 are corollaries;
AnalyticNumberTheoryPartI §2.42 states ERH(`K`) and GRH(`χ`) of a primitive Hecke
character in the strip form, the right sides of the strip forms of 9.5, and §2.42a extends them to
ray-class characters of every modulus and to algebraic Hecke characters, with the inverse, the
half-plane form and the rationals, the forms of 9.5 at `σ = 1/2`;
ClassicalArithmeticCompletion §5.0 states the hypotheses for Dedekind zeta functions and class-group
characters. These are equivalent to 9.4 and 9.5 by the bridges stated there. AnalyticNumberTheoryPartI §1.9 (i) states
`ψ(x) − x = O(x^{1/2+ε})` under `RiemannHypothesis`, which 9.9 sharpens to `O(√x log² x)`;
ClassicalArithmeticCompletion §5.16a (i) states an explicit bound for `|ψ_K(x) − x|` under the
extended Riemann hypothesis of `K`, and for `|ψ(x) − x|` under `RiemannHypothesis`, of which the
bounds of 9.9 for `ψ_K` and `ψ` at `σ = 1/2` are the `O`-forms. AnalyticNumberTheoryPartI §0.30
states the dictionary between Dirichlet characters and ray-class characters of `ℚ` at level `q`, of
which 11.1 is the primitive level, and the rational paragraph of ZerosOfLFunctions §6.4 compares the
two series at the primitive level.

Not stated here: unconditional subconvexity (9.7 gives every exponent `ε > 0` under the hypothesis
of the L-function); the equivalence between the hypothesis of a field abelian over `ℚ` and that of
its Dirichlet characters, which needs the factorization of its Dedekind zeta function
(AnalyticNumberTheoryPartI §2.42), and the descent from a Galois extension to a subfield
(AnalyticNumberTheoryPartI §2.39b); the Riemann hypothesis of an Artin L-function
and of a standard or Rankin–Selberg automorphic L-function, which belong to the roadmaps that construct those L-functions and are the predicate of
9.2 on their continuations; the Riemann–Siegel theta function and the exact formula
`N(T) = ϑ(T)/π + 1 + S(T)`, which are ExplicitZetaBounds §§0.4a, 2.9 and take `S(T)` from
ZerosOfLFunctions §7.3, and the count `N(T)` under the Riemann hypothesis that they give with the
bound 9.8;
the Riemann hypothesis to a height, the numerical records of verified zeros, and every conditional
bound with explicit constants (ExplicitZetaBounds §§0.2–0.4b; ExplicitPrimeCounting §2.2, whose
Schoenfeld bounds are explicit forms of the `ℚ` corollaries of 9.9 under further computational
hypotheses; ClassicalArithmeticCompletion §5.16a (i); ExplicitNumberFields §7.2). This roadmap proves no
case of the Riemann hypothesis: GeneralizedRiemannHypothesisFromWindowBounds, in this family,
proves it for every Dirichlet L-function, and so for `ζ`.

## Exact supplier contracts

### From TauCetiRoadmap.ZerosOfLFunctions

Conventions (orders, divisors, counts, analytic conductors, uniformity). Layer 0: *entireCompletion*
(8.4b, 9.7, 9.8). §1.4 (digamma and the logarithmic derivatives of the gamma factors), §1.4a
(conjugation and the functional equation of `ζ′/ζ`), §1.5 (the gamma factor of a record, regular
and nonzero on `Re s > 1/2` for shifts of real part at least `−1/2`), §1.6 (*continuedL* and the
agreement of its orders with those of the completed function). §§2.1–2.2: *analyticConductorAt*
and its two-sided comparison. §3.4: the strip bound and convexity, also at bounded conductor.
§§4.4–4.5: the local count and the counting functions. §5.4: the entire logarithm (route of 9.7).
§§5.5–5.6a: Hadamard's theorem at order at most one, its L-function corollaries with
`Re B = −∑_ρ Re(1/ρ)`, and the ordinate summability of the zeros. §§6.2–6.5: the regions with the
cap `c ≤ log 3/2`, *IsExceptionalZero*, the rational paragraph of §6.4 with
`dirichletLFunction_zeroFreeRegion`, the completion comparisons of §6.4a, and the edges (no zero on
`Re s = 1`, none at `0` or `1`). §7.3: the argument lift and *S*; §§7.4–7.6: `N(T)` and its
corollaries, infinitely many zeros. §8.2: the heights of the contour shift and the bound
`logDeriv L = O(log² T)` on them; §§8.3–8.7: the truncated formulas, the Weil formula, the prime
ideal theorem, the Hecke instance and effective counting in a ray class with its orthogonality and
*rayClassPsi*; §8.4a: Selberg's smoothed formula for `ζ′/ζ` (the case `ζ` of 8.4b); §8.5a: the
prime counts at `ℚ` under a zero-free half-plane, for a fixed `σ` (the case `ℚ` of 9.9); §8.6a: the
Euler–Kronecker constant and the explicit formula for the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞`
for every primitive finite-order ray-class character `ψ` (the explicit formula of 8.4a (b), a
corollary of it); §8.7a:
*PrimitiveRayClassCharacter.of_comp_dictionary_eq*, two reciprocity dictionaries induce the same
primitive characters (8.8); §8.8: reciprocity dictionaries and their splitting laws, *exceptionalChebotarevTerm*,
*exceptionalRayClassTerm*, `frobeniusPsi` and `frobeniusPrimeCount`. §9.1: for a primitive Dirichlet
character, the equivalence of the hypothesis on the completed function with the absence of zeros of
the L-function right of `1/2` (the `ζ` clause of 9.3, its case `q = 1`). Layer 9: *AllOnCriticalLine*,
and *GRH* over the two families with its bridge to `RiemannHypothesis` at `ζ` (9.3).

### From TauCetiRoadmap.QuasiRiemannHypothesis

§1.1: the predicate `ZeroFreeRightOf σ f`, `meromorphicOrderAt f s ≤ 0` for every `s` with
`σ < Re s`, with its monotonicity in `σ`, its invariance under punctured germs, its two product
rules (a product of two functions meromorphic and zero-free right of `σ`, and a factor analytic
and nonzero on the half-plane), its value form at points of analyticity, its form for
`DirichletCharacter.LFunction` with the pole of the principal character excepted, and, for `σ ≥ 0`,
the agreement of a ray-class character with its primitive source (9.2–9.9).

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

§7.1: the instance `instNeZeroConductor : NeZero χ.conductor` for `[NeZero N]` and a Dirichlet
character `χ` over a commutative monoid with zero (9.2, 9.4, 10.3).

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§0.30: the rational dictionary between Dirichlet characters and ray-class characters of `ℚ`, with
conductors, parities, values and the comparison of the continued functions (11.1). §1.6:
`DirichletGRH` (the bridge of 9.4), with conductor one and primitive induction (the modulus-one,
change-of-level, primitive-character and quantified clauses of 9.4, corollaries of them). §1.6a: the
conjugation, reflection and half-plane forms of `DirichletGRH` for one character (the inverse,
reflection and strip-form clauses of 9.4, corollaries of it). §2.42: ERH(`K`) and GRH(`χ`) of a primitive Hecke character, with
ERH(`ℚ`) `↔ RiemannHypothesis` and the trivial-character clause (the bridges of 9.5). §2.42a: the
hypotheses of §2.42 for ray-class characters of every modulus and for algebraic Hecke characters,
with the inverse, the half-plane form and the rationals (the forms of 9.5 at `σ = 1/2`).

### From TauCetiRoadmap.AnalyticNumberTheoryPartIII

§8.2a: Hadamard's three-circles theorem on an annulus (3.2a).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§5.0: `DedekindERH` and `HeckeGRH`, with the invariance under `χ ↦ χ⁻¹` (the bridges of 9.5).
§5.16a (i): the explicit bound for `ψ_K` under `DedekindERH K`, and for `ψ` under `RiemannHypothesis`
(9.9).

### From TauCetiRoadmap.ExplicitZetaBounds

§6.1a: Landau's iterated Perron identity, at `j = 1` (8.4a).

### From TauCetiRoadmap.LFunctions

- Layer 0: `AnalyticLFunctionData.dual_completed`, `HasMeromorphicContinuation`,
  `HasFunctionalEquation.eventuallyEq`, the field `HasFunctionalEquation.norm_rootNumber`,
  `EqOffZero` and `ofSeries` (9.3, 11.1).
- Layer 3: `dedekindZetaC`, `analyticAt_dedekindZetaC`, `meromorphicOrderAt_dedekindZetaC_one`,
  `dedekindZetaData`, `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, and the order of vanishing
  of `ζ_K` at `0` (8.4a, 9.5, 11.1).
- Layer 4: `dirichletData`, `dirichletData_dual`, `dirichletData_modOne`, and
  `dedekindZetaC_quadratic` (9.4, 9.5, 10.3, 11.1).
- Layer 5: `PrimitiveRayClassCharacter` with `of`, `1` and `inv`, `heckeLFunctionC`,
  `heckeLFunctionC_eq`, `heckeData`, `completedHeckeLFunction_one_sub`,
  `completedHeckeLFunction_one_sub_eventuallyEq` (8.4a, 8.8, 8.8a, 9.5, 11.1).
- Layer 6: `Grossencharacter`, `idealShift`, `lFunctionC`, `lFunctionC_eq`, `grossencharacterData`
  (9.5).
- Layer 7: `heckeLFunction_ne_zero_of_one_le_re` (8.4a).
- Layer 8: `dedekindZeta_logDeriv_eq` (8.4b); Mertens' product
  `tendsto_prod_one_sub_inv_absNorm_div_log` at `ℚ` (9.7); the comparison cards of primitive
  Dirichlet and primitive ray-class characters, with the card of the odd character modulo `4∞`
  (11.1).

### From TauCetiRoadmap.ArithmeticDirichletSeries

§2.3: the coefficients of `−logDeriv` of a ray-class L-function,
`TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform`, and the norm
coefficients `TauCeti.normCoeff` (8.4a, 8.4b). §§5.2, 6.1–6.2 and 10.1–10.2, as ZerosOfLFunctions
§§8.5 and 8.7 use them, and Abel summation (9.7, 9.9).

### From TauCetiRoadmap.GlobalNumberFields

`RayClassCharacter.induced` and `RayClassCharacter.conductor_dvd_iff`
(8.8a); `TauCeti.GlobalNumberFields.ratModulus`, `TauCeti.GlobalNumberFields.ratFiniteModulus`,
`TauCeti.GlobalNumberFields.ratModulus_dvd_ratModulus_iff`,
`TauCeti.GlobalNumberFields.ratDirichletEquiv`,
`TauCeti.GlobalNumberFields.ratDirichletEquiv_absNorm`,
`TauCeti.GlobalNumberFields.ratDirichletEquiv_induced`,
`TauCeti.GlobalNumberFields.onIdeals_ratDirichletEquiv_symm`,
`TauCeti.GlobalNumberFields.RayClassCharacter.conductor_finitePart_eq_span` and
`TauCeti.GlobalNumberFields.RayClassCharacter.conductor_infinitePart_eq_empty_iff_even` (9.5, 9.7,
11.1).

### From TauCetiRoadmap.ClassFieldTheory

Layer 13: a prime of `K` below a prime of `L` ramified over it lies in the support of every
admissible modulus, `TauCeti.ClassFieldTheory.IsAdmissibleModulus.mem_support_of_ramified`
(8.8a).

### From Mathlib

- `RiemannHypothesis`, `riemannZeta`, `riemannZeta_one_ne_zero` (the junk value at `1`),
  `riemannZeta_two`, `riemannZeta_residue_one`, `riemannZeta_eq_zero_iff_of_re_nonpos`,
  `riemannZeta_one_sub`, `differentiableAt_riemannZeta`, `completedRiemannZeta_one`,
  `Complex.Gammaℝ_ne_zero_of_re_pos`, `Complex.differentiable_Gammaℝ_inv`,
  `meromorphicOrderAt_comp_of_deriv_ne_zero` (order under `s ↦ 1 − s`, meromorphic or not),
  `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected` (9.3, 10.2, 11.1).
- `meromorphicOrderAt`, `meromorphicOrderAt_of_not_meromorphicAt`, `meromorphicOrderAt_mul`,
  `meromorphicOrderAt_comp_add_const_eq_meromorphicOrderAt`, and `MeromorphicNFAt` (the value `0`
  of the normal form at a pole) (9.2).
- `DirichletCharacter.LFunction`, `DirichletCharacter.differentiableAt_LFunction`,
  `DirichletCharacter.LFunctionTrivChar₁`, `DirichletCharacter.LFunctionTrivChar₁_apply_one_ne_zero`,
  `DirichletCharacter.level_one`, `DirichletCharacter.LFunction_modOne_eq`,
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
  `DirichletCharacter.LFunction_eq_completed_div_gammaFactor`,
  `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `DirichletCharacter.IsPrimitive.inv`,
  `DirichletCharacter.conductor`, `DirichletCharacter.conductor_ne_zero`,
  `DirichletCharacter.conductor_inv`, `DirichletCharacter.conductor_dvd_level`,
  `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.primitiveCharacter_isPrimitive`,
  `DirichletCharacter.changeLevel`, `DirichletCharacter.changeLevel_primitiveCharacter`,
  `DirichletCharacter.isPrimitive_one_level_one`, `DirichletCharacter.LFunction_changeLevel`,
  `DirichletCharacter.gammaFactor`, `DirichletCharacter.Even.gammaFactor_def`,
  `DirichletCharacter.Odd.gammaFactor_def`, `DirichletCharacter.even_or_odd` (9.2, 9.4, 10.2,
  10.3, 11.1).
- `LSeries`, `LSeriesSummable`, `DirichletCharacter.LSeries_twist_vonMangoldt_eq`,
  `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`,
  `Real.eulerMascheroniConstant`, and `toMeromorphicNFOn` (the transform `Φ_ψ` as a normal form)
  (8.4a, 11.1).
- `NumberField.dedekindZeta`, `NumberField.abs_discr_gt_two` (9.5, 9.6).
- `Complex.norm_le_of_forall_mem_frontier_norm_le`
  (3.2a); `Complex.borelCaratheodory`, `Chebyshev.psi_le_const_mul_self` (9.7); `Chebyshev.psi`,
  `Chebyshev.theta`, `Nat.primeCounting` (9.9).

### From Tau Ceti

- `DirichletCharacter.LFunction_inv_conj` (`L(χ⁻¹, conj s) = conj L(χ, s)` for `s ≠ 1 ∨ χ ≠ 1`)
  and `DirichletCharacter.LFunction_inv_conj_eq_zero_iff` (9.4).
- `TauCeti.meromorphicOrderAt_conj_conj` (the order of `conj ∘ f ∘ conj` at `x` is that of `f` at
  `conj x`, with no meromorphy hypothesis) (9.2, 9.3);
  `TauCeti.meromorphicOrderAt_completedRiemannZeta_one` and `TauCeti.LFunctions.riemannZetaData`
  (9.3).
- `TauCeti.meromorphicContinuation`, `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`,
  `TauCeti.LFunctions.heckeLFunctionC`, `TauCeti.LFunctions.meromorphicNFOn_heckeLFunctionC`,
  `TauCeti.LFunctions.PrimitiveRayClassCharacter.of`,
  `TauCeti.LFunctions.PrimitiveRayClassCharacter.of_induced` (the primitive source does not depend
  on the presentation), `PrimitiveRayClassCharacter.character_inv` (8.8, 9.5, 11.1).
- `TauCeti.Contour.classicalResidueTheorem_nullHomologous`,
  `TauCeti.Contour.logDeriv_eventuallyEq_principalPart` (8.4a, 8.4b);
  `TauCeti.exists_differentiableOn_eqOn_exp_comp` (the holomorphic logarithm) (9.7).
- `TauCeti.LFunctions.AnalyticLFunctionData.ofSeries_eq_normalized`,
  `TauCeti.LFunctions.ofSeries_riemannZetaData`, `TauCeti.LFunctions.dirichletData`,
  `TauCeti.LFunctions.dirichletData_hasDirichletAgreement`,
  `TauCeti.LFunctions.dirichletData_hasMeromorphicContinuation`,
  `TauCeti.LFunctions.dirichletData_hasFunctionalEquation`, `TauCeti.LFunctions.dirichletData_modOne`
  (11.1).
- `TauCeti.primePsi`, `TauCeti.primeCount` and `TauCeti.Real.logIntegral` (9.9).

## References

- H. Davenport, *Multiplicative Number Theory*, 3rd ed. rev. H. L. Montgomery, GTM 74 (2000) —
  chapters 5, 9 and 14: primitive characters, the functional equation and the absence of zeros on
  `Re s = 1` (9.4); §20: orthogonality for unsmoothed prime sums in a class (8.8a); §§18 and 20
  (9.9). Cited by locator.
- E. C. Titchmarsh, rev. D. R. Heath-Brown, *The Theory of the Riemann Zeta-Function*, 2nd ed.
  (1986) — Chapter II (9.3); Chapter XIV (consequences of the Riemann hypothesis: `ζ(σ + it)` and
  `1/ζ(σ + it)` right of the
  line by Borel–Carathéodory and three circles, Selberg's formula for `ζ′/ζ`, `log |ζ(1/2 + it)|`
  and `S(T)`; 3.2a, 8.4b, 9.7, 9.8). Cited by locator.
- H. Iwaniec, E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53 (2004) — Chapter 5
  (L-functions with a functional equation and their Riemann hypothesis, Grossencharacters included,
  9.3, 9.5; the analytic conductor in the bounds under the Riemann hypothesis for L-functions of any degree;
  9.7, 9.8). Cited by locator.
- R. M. Robinson, *Hadamard's three circles theorem*, Bull. Amer. Math. Soc. 50 (1944), 795–802,
  doi:10.1090/S0002-9904-1944-08205-0 — Hadamard's three-circles theorem under its name (3.2a,
  through AnalyticNumberTheoryPartIII §8.2a).
- Y. Ihara, *On the Euler–Kronecker constants of global fields and primes with small norms*, in
  *Algebraic Geometry and Number Theory*, Progress in Mathematics 253, Birkhäuser (2006), 407–451 —
  the sum over prime powers with the weight `(x/N − 1) log N`, the Euler–Kronecker constant and the
  formula with the zeros at the trivial character (8.4a, through ZerosOfLFunctions §8.6a; 8.8a).
- Y. Ihara, V. K. Murty and M. Shimura, *On the logarithmic derivatives of Dirichlet L-functions at
  s = 1*, Acta Arith. 137 (2009), no. 3, 253–276, doi:10.4064/aa137-3-6 — §2.2, Theorem 1, formula
  (2.2.1), p. 257: the explicit formula for the first Riesz mean of `Λ_K(𝔞) ψ(𝔞)/𝔑𝔞` for every
  primitive finite-order ray-class character `ψ` of a number field (8.4a, through ZerosOfLFunctions
  §8.6a; 8.8a).
- J. S. Milne, *Class Field Theory* (course notes), version 4.03 (6 August 2020),
  <https://www.jmilne.org/math/CourseNotes/CFT.pdf> — Introduction (the
  Artin map on the ideals prime to a finite set of primes factors through a ray class group; for
  `ℚ` and the modulus `(N)·∞` the ray-class characters are the Dirichlet characters modulo `N`, with
  Dirichlet's L-series) and Chapter V, §3, before Theorem 3.27 (characters that agree on the ideals
  prime to a larger set are equivalent, each class has one primitive character, conductors) (8.8,
  through ZerosOfLFunctions §8.7a; 11.1).
- Eric Bach, *Explicit bounds for primality testing and related problems*, Math. Comp. 55 (1990),
  355–380 — §3, p. 360 (9.5).
- Karim Belabas, Francisco Diaz y Diaz and Eduardo Friedman, *Small generators of the ideal class
  group*, Math. Comp. 77 (2008), 1185–1197 — §2, pp. 1187–1188 (9.5): with Bach (1990), the
  hypotheses for Dedekind zeta functions
  and for characters of the class group, read as the absence of zeros right of `1/2`.
- Carneiro, Chandee and Milinovich, *A note on the zeros of zeta and L-functions*, Math. Z. 281
  (2015), 315–332, arXiv:1503.00955 — the bound for the argument under the Riemann hypothesis for a
  class of L-functions that includes those of cuspidal automorphic representations of `GL(m)` over
  a number field (9.8, at `σ₀ = 1/2`).
- J. C. Lagarias and A. M. Odlyzko, *Effective versions of the Chebotarev density theorem*, in
  A. Fröhlich (ed.), *Algebraic Number Fields* (Durham, 1975), Academic Press (1977), 409–464 —
  Chebotarev's theorem with an error term under the
  Riemann hypothesis for `ζ_L` (9.9 (iii), at `σ = 1/2`).
- A. E. Ingham, *The Distribution of Prime Numbers*, Cambridge Tracts in Mathematics and
  Mathematical Physics 30 (1932) — Chapter IV: prime counts under a zero-free half-plane (9.9).
  Cited by chapter.
- J. E. Littlewood, *On the class-number of the corpus `P(√−k)`*, Proc. London Math. Soc. (2) 27
  (1928) — the bounds `(C log log q)⁻¹ ≪ L(1, χ) ≪ log log q` under the Riemann hypothesis for `χ`
  (9.7(ii)(d), its case `σ₀ = 1/2`).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann
  hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification
  setup: <https://github.com/leanprover-community/riemann-hypothesis>. The files and declarations cited are those
  of the first commit of that repository, the source as published, with the file paths relative to its directory
  `src/`: <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>.
  The form it has of each statement of
  8.4a, 8.8a, 9.2, 9.3, 9.4, 10.2 and 10.3 that cites it is recorded at that statement.
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
