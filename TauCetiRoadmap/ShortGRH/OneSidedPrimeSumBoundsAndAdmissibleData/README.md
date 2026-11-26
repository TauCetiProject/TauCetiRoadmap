# Roadmap: one-sided prime sum bounds and admissible data

This roadmap states the frame of the shorter route [ShortProof] to the Riemann hypothesis for Dirichlet L-functions:
the analytic step at the start and at the end, the data on which the arithmetic part is built, and the inequality in
which the arithmetic parts meet. The other roadmaps of the family `ShortGRH` prove the inputs of Theorems A and B,
which this roadmap states (Layer 5), and Theorem C (DeterminantsOfThetaLiftChains §6.3), and refer to its set-up
(Layers 1–4) for their data and letters.

The argument has this shape. Fix a positive multiple `q₀` of `18480` and a prime `d ≡ q₀/2 − 1 (mod q₀)`, and let
`K = ℚ(√−d)` with quadratic character `χ_K = (·/d)`. The remainder `R_{q₀}(y)` is a smoothed sum of
`Λ(n)(1 − χ_K(n))` over the integers `n ≡ 1 (mod q₀)` up to `y`, less its main term and its constant, divided by `y`
(0.1). An upper bound `R_{q₀}(y) ≤ y^{β−1}` for all large `y`, asked for every prime `d` of a residue class, excludes
zeros of the L-functions modulo `q₀` in `Re s > β` (0.2): only an upper bound is needed, by Landau's theorem. To prove
such a bound at a large integer `x`, one builds admissible data (Layers 2 and 3): a CM field `E = K(ζ_{q₁})` whose
degree `2f` lies between `2x^{11}` and `2x^{12}`, a weight `κ` on its infinite places, three scales `x ≤ x₁ ≤ b`, ranks, three auxiliary primes
and the twists. Prime sums restricted by the place of a Frobenius element (Layer 4) combine into a total remainder
`rem`, which is a positive multiple of `R_{q₀}(x)` up to remainders at the much larger scale `x₁`. A lattice of theta
lifts of automorphic forms on definite unitary groups carries an upper bound for its covolume (Theorems A and B) and a
lower bound (Theorem C), both read in a twisted lattice (Layer 1). The main amount cancels between them and leaves
`m·rem ≤ f·a·(log b)⁵` (6.1). Dividing by the size of `m·rem` and using the prime number theorem at `x₁` gives
`R_{q₀}(x) ≤ (64 φ(q₀) + 3) x^{−1/2+6ε}` (6.2), the bound that the criterion needs; the last section passes to every
Dirichlet character (6.3), and to the critical line and the Riemann hypothesis (6.4).

The roadmaps of the family that prove the inputs are:
`DivisibilityOfThetaDerivatives` (divisibility of jets of theta functions of CM lattices, the field and its characters,
the integral vacuum vector), `ThetaLiftChainsAndTheSeesawIdentity` (source forms, target forms, chains of lifts, the
Poincaré map and the seesaw identity), `CompositeThetaLiftsAndShortForms` (the divisibility and the size of the
composite lift and the short source forms, the inputs of Theorem A), `SecondMomentsOfPoincareSeries` and
`RemainingAndMainTermsOfSecondMoments` (the second moment of the Poincaré map, the input of Theorem B),
`DeterminantsOfThetaLiftChains` (norms of chains, their determinants, auxiliary forms and Theorem C),
`NormsOfThetaLiftsAndExchangeIdentities` (the lower bound for one lift), `PairsOfFramesAtOnePlace` (the local
integrals of the main term), `CongruencesOfTwistedThetaLifts` (congruences and regular families of twists) and
`SelmerBoundsForAnticyclotomicTwists` (the twisting theorem and the local losses).

Layer 0 defines the remainders `R_q` and proves the one-sided criterion. Layer 1 gives the bookkeeping of colengths,
heights and twisted lattices, and the lower bound for a covolume by a twist for each prime. Layer 2 fixes the
parameters, the field `E` and its group of infinite places. Layer 3 defines admissible data, records their sizes, the
twists and the characters of the lifts, and proves that admissible data exist at every large integer. Layer 4 defines
the prime sums and writes the total remainder through `R_{q₀}` and `R₁`. Layer 5 defines the target lattice and the
normalised Poincaré maps, states Theorems A and B, and names Theorem C, which DeterminantsOfThetaLiftChains §6.3
states and proves. Layer 6 proves the main inequality and the one-sided bound, and from them the
end theorems, which GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 state, in all their forms.

## Conventions and notation

**Labels.** Every section that states something carries, under its heading, `*Origin:*` (one of `published:`,
`adapted from`, `particular to this proof:`, `this roadmap's own formulation:`, `definitions and conventions`) and
`*Method of the formal proof:*`, how [ShortProof] proves it. The last line of a section names where [ShortProof] proves
it, as `[ShortProof], path (declaration)`, with the path relative to its directory `src/`; the names on that line, which begin
`New.`, are declarations of [ShortProof] and not names of this roadmap or of its `Suggested.lean`. Theorems A and B (5.3, 5.4)
are stated here and proved from the sections named on their `*Needs:*` lines; Theorem C is
DeterminantsOfThetaLiftChains §6.3. A section of another roadmap of the family is cited by number, `<Roadmap> §k.n`.

**Background.** `ShortGRH background (…)` on a `*Needs:*` line names, in words, a published result that [ShortProof]
proves among its background results (its folder `src/Lib`) and that no roadmap section states in the form used; the
parenthesis gives that form and the declaration of [ShortProof].

**Statements of the formal proof.** The hypotheses, ranges and constants of a target are those of [ShortProof]; where a
section states more, its last sentence says which case [ShortProof] proves.

**Quantifiers.** "For all large `y`" means: there is `Y` with the property for every real `y ≥ Y`; "for every large
integer `x`" likewise over the integers. Constants written as numerals (`10¹²`, `13`, `64 φ(q₀) + 3`, …) are those of
[ShortProof].

**Places of ℂ.** A *pair* `ι` is a prime `ℓ = ℓ(ι)` with a ring isomorphism `ι : ℂ → ℚ̄_ℓ`, `ℚ̄_ℓ` an algebraic closure
of `ℚ_ℓ` with the absolute value extending `|·|_ℓ`. Write `ῑ(z) = ι(z̄)` (a pair with the same prime) and
`𝒪_ι = {z ∈ ℂ : |ι(z)| ≤ 1}`, a valuation ring. `Aut(ℂ)` is the group of all field automorphisms of `ℂ`.

**Analytic notation.** `Λ` is the von Mangoldt function, `φ` Euler's function, `γ` Euler's constant, `z₊ = max(z, 0)`.
For a Dirichlet character `ψ`, `L(s, ψ)` is Mathlib's `DirichletCharacter.LFunction`, imprimitive characters included.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `q₀, d, K, χ_K` | the modulus (a multiple of `18480`), the prime `d ≡ q₀/2 − 1 (mod q₀)`, `K = ℚ(√−d)`, `χ_K = (·/d)` | 2.1 |
| `E_ψ, λ_q, G_q, c_q, R_q` | `L(s, ψ)`, times `s − 1` if `ψ` is principal; the weight `Λ(n)(1 − χ_K(n))` on `n ≡ 1 (mod q)`, a mean of logarithmic derivatives, its real value at `1`, the remainder; `c₁` is the case `q = 1` | 0.1 |
| `s, l₀, T, q₁, q₂` | the exponent of the tower, the least power of `3` above `27s`, `T = 3l₀2^s`, `q₁ = q₀T`, `q₂ = (q₀d)^{s+6}` | 2.1 |
| `E, ζ, Φ, Φ_v, f` | `E = K(ζ)`, `ζ` of order `q₁`; the group of infinite places of `E`, isomorphic to `(ℤ/q₁)^×`; the embedding chosen at `v`; `f = #Φ` | 2.2 |
| `[ν], ν·σ, −νσ` | the place named by an integer `ν` (the identity place if `ν` is not prime to `q₁`); products in `Φ` | 2.2 |
| `rd_E, Ω` | the root discriminant of `E`; `Ω = exp(γ − Re (L′/L)(1, χ_K))·2π/rd_E` | 2.2 |
| `C_P` | a constant depending on `q₀` and `d` only | 3.1 |
| `x, x₁, b, a` | the length of the prime sum, the second cut-off, the weight at the `b`-places (integers), `a = xb` | 3.2 |
| `m, r, k, t, n_j` | the number of lifts (a power of `2`), the rank of the target (a power of `3`), `k = r + 1 − m`, `t = 5r`, `n_j = k + j(t + 1)` | 3.2 |
| `Φ_a, Φ_b` | the `a`-places (class `1` modulo `q₀`) and the `b`-places (a sparse set of places of class `−1`) | 3.2 |
| `κ, Δ, κ_j, κ_{(i)}` | the weight (`b` on `Φ_b`, `a/x₁` elsewhere), the gap `Δ = 2r⁸`, `κ_j = κ + (j + 1/2)Δ`, `κ_{(i)} = κ + (i + 1)Δ/2` | 3.2 |
| `p₀, p₁, M, N, π_M, π_N` | the primes of the principal level, `M = p₀p₁`, the level `N`, `π_M ∈ 𝒪_K` with `π_M π̄_M = M`, `π_N ∈ 𝒪_E` with `π_N π̄_N = N` | 3.2 |
| `N₋` | the lower end of the range of the level | 3.1 |
| `δ_E` | the generator of the different of `E` of DivisibilityOfThetaDerivatives §1.1 (b), whose absolute value at an infinite place `v` is that of `Φ_v(δ_E)` | DivisibilityOfThetaDerivatives §1.1; 3.3 |
| chosen places | the finite places of `E` dividing `π_M` | DivisibilityOfThetaDerivatives §1.5 |
| `ξ, Q(ξ), Nm Q(ξ)` | a twist (written `ϑ` in [ShortProof]), its modulus, the product of the norms of the places of the modulus | 3.4 |
| `μ_j⁰, μ♭, χ, ω, υ` | the character of lift `j`; the characters of weight `−κ₀` and of weight `0` with tame part `ω`; the residue characters at the chosen places; the splitting character on `U(1)` | 3.4; `ω`: DivisibilityOfThetaDerivatives §1.5; `μ♭, χ` (there `χ₀, χ_M`): §1.6 (a); `υ`: §1.4 (c) |
| `s_fin, s_∞, s_main` | the prime sum at an order and a place, the size of a derivative, the expected value | 4.1 |
| `s_p(y, σ), S_p` | the local prime sum at a prime `p` and its total `S_p = Σ_σ s_p(κ(σ), σ)` (written `F(p)` in CompositeThetaLiftsAndShortForms) | 4.1 |
| `h_dir, h_main, rem, u_E` | the direction amount, the main amount `mk·h_dir`, the total remainder, the error unit `f·a·(log b)³` | 4.1 |
| `X_j, Y_j, W_j, V_j` | the definite and indefinite Hermitian spaces of the chains | ThetaLiftChainsAndTheSeesawIdentity §2.1 |
| `𝒮, 𝒮_ram, 𝒯, d_T` | the source forms on `X₀` (there `𝒮_X`), the ramified ones, the target forms on `Y₀`, `d_T = dim 𝒯` | ThetaLiftChainsAndTheSeesawIdentity §2.8 (`𝒮`, `𝒮_ram`), §2.7 (`𝒯`) |
| `Ḡ, ρ, e₀, 𝒫` | the finite group `∏ GL_r(𝔽_w)` over the chosen places (there `𝖦`), its action on forms of principal level on `Y₀`, the central idempotent of the good forms, the Poincaré map | ThetaLiftChainsAndTheSeesawIdentity §2.5 (`Ḡ`, `e₀`), §2.7 (`ρ`), §2.19 (`𝒫`); 5.2 |
| `Θ_ξ, Z(ξ)` | the chain of `m` lifts with twist `ξ` on the target forms, `Z(ξ) = det(Θ_ξ^*Θ_ξ)` | ThetaLiftChainsAndTheSeesawIdentity §2.15; 5.1 |
| `J_m(ξ), ι_ξ, B_ξ(Ψ)` | the level of the forms on `Y_m` for the twist `ξ`; the chain of lifts from `Y₀` to `Y_m` (`ι_ξ = Θ_ξ`); the composite lift with chain datum `Ψ` | ThetaLiftChainsAndTheSeesawIdentity §§2.6, 2.12, 2.15; 5.1, 5.2 |
| `gain_ℓ, err_ℓ, g_ℓ, c_B, c_ss, s𝔭, 𝒮_int` | the divisibility asked at `ℓ`, the allowed error, `⌊gain_ℓ − err_ℓ⌋`, `∏ ℓ^{−g_ℓ}`, the seesaw constant, the normalised Poincaré map translated by `s ∈ Ḡ`, the ramified source forms integral at every pair | 5.2 |
| `‖·‖²_σ` | the squared norm of the conjugate by `σ ∈ Aut(ℂ)` | 1.3, 5.1 |

## Layer 0: the remainders `R_q` and the one-sided criterion

The remainder `R_q` belongs to a signed family: the characters modulo `q` enter with weight `+1` and their twists by
`χ_K` with weight `−1`, so the poles of its transform at zeros of the twisted L-functions have the opposite sign. The
criterion therefore asks the bound for every prime `d` of a residue class and chooses one `d` whose twists have no zero
in the relevant box.

### 0.1 The remainders `R_q`

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions are those of [ShortProof]; (a) and (b) are read off the definitions, and
(c) writes `R_q(y)` as `∫₁^y 𝓔_q(t) t^{−2} dt − c_q`, with `𝓔_q(t) = Σ_{n≤t} λ_q(n) − t/φ(q)`, and bounds `|𝓔_q(t)| ≤ 13t`
by Chebyshev's bound `Σ_{n≤t} Λ(n) ≤ 6t`.

Let `d` be a prime, `χ_K = (·/d)` the Legendre symbol, and `q ≥ 1`.

- `λ_q(n) = Λ(n)(1 − χ_K(n))` if `n ≡ 1 (mod q)`, and `λ_q(n) = 0` otherwise.
- For a Dirichlet character `ψ` modulo `q` let `E_ψ(s) = L(s, ψ)` if `ψ` is not principal and the entire continuation of
  `(s − 1)L(s, ψ)` if it is; let `ψχ_K` be the product, a character modulo `qd`, and
  `G_q(s) = φ(q)^{−1}(Σ_ψ (E′_{ψχ_K}/E_{ψχ_K}(s) − E′_ψ/E_ψ(s)) − 1)`, the sum over all characters modulo `q`.
- `c_q = Re G_q(1)`, and for real `y > 0`
  `R_q(y) = Σ_{1≤n≤y} λ_q(n)(1/n − 1/y) − (log y)/φ(q) − c_q`.

When `d` varies, `R_q^{(d)}` is written. Facts:

- (a) `0 ≤ λ_q(n) ≤ 2Λ(n)` for every `n`.
- (b) For `0 < z ≤ A`, `A` an integer: `Σ_{n=1}^{A} λ_q(n)(A/n − A/z)₊ = A(R_q(z) + (log z)/φ(q) + c_q)`.
- (c) For `1 ≤ y ≤ z`: `|R_q(z) − R_q(y)| ≤ 13(z − y)/y`.

For odd `d` prime to `q`, `G_q(s)` continues `Σ λ_q(n)n^{−s} − s/(φ(q)(s − 1))` from `Re s > 1`, and `R_q(y) → 0`; so
`c_q` is the constant that makes `R_q` tend to `0` (see 0.2 and 6.2 for where these are used). Write `𝒢_1` and
`𝒢_{χ_K}` for the Riesz remainders of the trivial character and of `χ_K` in
RiemannHypothesisStatementsAndConsequences §8.4a (b) (written `G` there; they are functions of `y`, not the function
`G_q(s)` above). Then `y·R₁(y) = 𝒢_1(y) − 𝒢_{χ_K}(y)` for odd `d`, since `c₁ = −1 − γ + Re (L′/L)(1, χ_K)`.

*Needs:* Mathlib `ArithmeticFunction.vonMangoldt`, `DirichletCharacter.LFunction`, `Chebyshev.psi_le_const_mul_self`.

[ShortProof], `New/Reduction/Zeros/PrimeError` (`New.lambdaKResidueClass`, `New.logDerivMean`, `New.primeRemainder`,
`New.lambdaKResidueClass_le_two_mul_vonMangoldt`, `New.primeRemainder_eq_sum`, `New.re_logDerivMean_one`);
`New/Reduction/Zeros/PrimeNumberTheorem` (`New.abs_primeRemainder_sub_le`)

### 0.2 The one-sided criterion

*Origin:* adapted from Landau (1905): Landau's theorem for Laplace integrals of functions of one sign
(PositivityOfDirichletSeriesWithKernels §6.4), here applied to the remainder `R_{q₀}^{(d)}`, whose characters carry weights of
both signs, under an upper bound asked for every prime `d` of a residue class.

*Method of the formal proof:* by orthogonality modulo `q`, `λ_q` is `φ(q)^{−1}Σ_ψ (ψΛ − ψχ_KΛ)`; for odd `d` prime to `q`
its Dirichlet series is `s/(φ(q)(s − 1)) + G_q(s)` on `Re s > 1`, and partial summation gives the transform
`∫₀^∞ R_q(e^v)e^{(1−s)v} dv = (G_q(s)/s − c_q)/(s − 1)` on `Re s > 2`. The right side is meromorphic on `ℂ`; at `s = 1`
it has no pole, because `G_q(1)` is real (the transform is real on the real axis); elsewhere in `Re s > 0` its poles are
at most simple, with residue `Σ_ψ (ord_s E_ψ − ord_s E_{ψχ_K})/(φ(q)·s(1 − s))`, by the local form of a logarithmic
derivative. Given `β < Re ρ`, the proof chooses a prime `d` of the class for which no `L(s, ψχ_K)` vanishes in
`β ≤ Re s`, `|Im s| ≤ |Im ρ|`. In that box the residue is `Σ_ψ ord_s E_ψ/(φ(q₀)s(1 − s))`, which is `≥ 0` at real
`s > β` (for `s ≥ 1` there is no zero). Landau's lemma for the transform of a function bounded above by `e^{(β−1)v}`
then forbids a pole at `ρ`; so every `E_ψ`, hence every `L(·, ψ)`, is nonzero at `ρ ≠ 1`.

Let `q₀ ≥ 1` with `8 | q₀`, let `d₀ ≡ 7 (mod 8)` be prime to `q₀`, and let `β > 1/2`. Suppose that for every prime
`d ≡ d₀ (mod q₀)` one has `R_{q₀}^{(d)}(x) ≤ x^{β−1}` for all large real `x`. Then `L(ρ, ψ) ≠ 0` for every Dirichlet
character `ψ` modulo `q₀` and every `ρ ≠ 1` with `Re ρ > β`.

*Needs:* 0.1; RiemannHypothesisStatementsAndConsequences §8.4a (the transform of a Riesz sum and its poles at zeros);
PositivityOfDirichletSeriesWithKernels §6.4 (Landau's theorem in one-sided form); ZeroFreeRegionsAndPrimesInShortWindows §3.5 (for `β > 1/2`,
real `H` and an invertible class modulo `N` all of whose primes are `≡ 7 (mod 8)` and prime to `N`, some prime `d` of
the class has no zero of any `L(s, ξ·(·/d))`, `ξ` modulo `N`, in `β ≤ Re s`, `|Im s| ≤ H`).

[ShortProof], `New/Reduction/Zeros/Criterion` (`New.LFunction_ne_zero_of_primeRemainder_le`);
`New/Reduction/Zeros/PrimeError` (`New.LSeries_lambdaKResidueClass_eq_add_logDerivMean`,
`New.integral_primeRemainder`, `New.isPolar_primeRemainder`)

## Layer 1: colength, heights and twisted lattices

This layer is general: no data occur. A twisted lattice is a family of maps `Θ_ξ`, one for each twist `ξ`, out of one
complex space; integrality at a pair `ι` is read through the twists allowed at its prime, while sizes are read through
the trivial twist alone. The product formula, in the form of 1.2, turns the three kinds of bounds into the lower bound
for a covolume of 1.4.

### 1.1 Colength dividing an element

*Origin:* particular to this proof: a matrix form of a colength bound, which needs no bases and no inclusion between
the two modules, with its calculus; (f) and (g) rest on the elementary divisor theorem over valuation rings.

*Method of the formal proof:* (b)–(e) compose the matrices, the second part of (e) chaining the bounds along a list;
(f) writes a square matrix over a valuation domain in Smith normal form and adds one coordinate condition at a time,
each of colength dividing one elementary divisor; (g) applies the Smith normal form to the matrix given by the
hypothesis for a finite generating family, and compares with the length of `∏ O/(a_j)` over a discrete valuation
ring.

Let `O` be a commutative ring, `V`, `U` modules over `O`, `M, N, P ⊂ V` submodules and `z ∈ O`. Say that *the colength
of `N` in `M` divides `z`*, written `M ⊸_z N`, if for every `n` and every family `Φ_1, …, Φ_n ∈ M` there is an
`n × n` matrix `m` over `O` with `det m | z` and `Σ_k m_{ik}Φ_k ∈ N` for every `i`. Say that an endomorphism `y` of `V`
is *onto `M` modulo `p^n` up to colength `c`* (`p ∈ O`, `c ∈ ℝ`) if `y(M) ⊂ M` and `M ⊸_{p^l} (y(M) + p^n M)` for some
integer `0 ≤ l ≤ c`.

- (a) If `M ⊂ N` then `M ⊸_1 N`; if `M ⊸_z N` and `z | z′` then `M ⊸_{z′} N`.
- (b) `M ⊸_z N` and `N ⊸_a P` give `M ⊸_{za} P`.
- (c) For `f : U → V` linear and `M′, N′ ⊂ U` with `f(M′) ⊂ M` and `x ∈ N′` whenever `x ∈ M′`, `f(x) ∈ N`:
  `M ⊸_z N` gives `M′ ⊸_z N′`.
- (d) For `f : V → U` linear and `M′, N′ ⊂ U` with `M′ ⊂ f(M) + N′` and `f(N) ⊂ N′`: `M ⊸_z N` gives `M′ ⊸_z N′`.
- (e) If an endomorphism `f` keeps `M`, `M ⊸_z (f(M) + aM)` and `M ⊸_{z′} (N + aM)`, then `M ⊸_{zz′} (f(N) + aM)`;
  and if each `y_i` of a finite list is onto `M` modulo `p^n` up to colength `c_i`, the product is onto `M` modulo `p^n`
  up to colength `Σ c_i`.
- (f) Let `O` be a valuation domain and `ι` a finite set. If a square matrix `A` over `O` has `det A | z` and its image
  lies in `L ⊂ O^ι`, then `O^ι ⊸_z L`. In particular `O^ι ⊸_{a^{#ι}} aO^ι`; for a linear form `λ : V → O`,
  `M ⊸_a {v ∈ M : a | λ(v)}`; and for a finite set `S ⊂ V`, `(N + span S) ⊸_{z^{#S}} (N + zV)`.
- (g) Let `O` be a discrete valuation ring and `M` finitely generated. If `M ⊸_z N` then the length of `M/(M ∩ N)` is at
  most the length of `O/(z)`. If `y` is onto `M` modulo `p^n` up to colength `c`, the length of `M/(y(M) + p^nM)` is at
  most `l` times the length of `O/(p)` for some integer `0 ≤ l ≤ c`.

*Needs:* Mathlib `Ring.ord_eq_addVal` (over a discrete valuation ring, the length of `O/(z)` is the valuation of
`z`; [ShortProof] `Lib/General/Algebra/FittingIdealsAndLengths.lean` (`New.relLength`,
`New.length_quot_span_eq_addVal`)); ShortGRH background (the Smith normal form of a square matrix over a valuation
domain `O`: `A = L·diag(a)·R` with `L`, `R` invertible over `O`, the `a_j` not required to divide one another;
[ShortProof] `Lib/General/LinearAlgebra/IntegralLattices.lean` (`New.IsValuationPair.smith_normal_form`),
`Lib/General/LinearAlgebra/HermiteForm.lean` (`New.isValuationPair_top`)).

*Relation to the library.* Tau Ceti `Matrix.exists_smith_normal_form_of_isDiscreteValuationRing` gives the Smith normal
form over a discrete valuation ring. Item (f) is used over the valuation rings `𝒪_ι`, which are not discrete, so the
background entry stands.

[ShortProof], `New/Reduction/Lattices/Colength` (`New.ColengthDvd`, `New.ColengthDvd.trans`, `New.ColengthDvd.comap`,
`New.ColengthDvd.map`, `New.ColengthDvd.comp`, `New.IsOntoUpToColength`, `New.IsOntoUpToColength.prod`,
`New.ColengthDvd.of_det_dvd`, `New.colengthDvd_top_smul_top`, `New.colengthDvd_inf_comap_span`,
`New.colengthDvd_sup_span`, `New.ColengthDvd.relLength_le`, `New.IsOntoUpToColength.exists_relLength_le`)

### 1.2 Heights of families over all places

*Origin:* particular to this proof: an upper bound for the height of a family of complex numbers with one member for
each pair `ι`, with a multiplier common to all pairs; its calculus and the product formula.

*Method of the formal proof:* the calculus multiplies the multipliers and adds the exponents. For (f), a multiplier `H`
whose images under all pairs at one prime are bounded is algebraic; the norm `q` of `H` from `ℚ(H)` to `ℚ` is a product
of conjugates, each the image of `H` under some automorphism of `ℂ` or some pair, because every embedding of `ℚ(H)`
extends to such a map; so `log|q| ≤ nα` and `log|q|_ℓ ≤ n h_ℓ log ℓ` with `n = [ℚ(H) : ℚ]`, and the product formula for
`q ∈ ℚ^×` gives `0 ≤ nc`.

A family `y = (y_ι)` of complex numbers indexed by the pairs has *height at most `c`* if there are `H ∈ ℂ^×`, `α ∈ ℝ`
and `h_ℓ ≥ 0` (one for each prime `ℓ`) with `|σ(H)| ≤ e^α` for every `σ ∈ Aut(ℂ)`, `|ι(H y_ι)| ≤ ℓ(ι)^{h_{ℓ(ι)}}` for
every pair `ι`, and `α + Σ_{ℓ∈S} h_ℓ log ℓ ≤ c` for every finite set `S` of primes. Only this upper bound is defined.

- (a) If `y` has height at most `c ≤ c′` and `|ι(y′_ι)| ≤ |ι(y_ι)|` for every `ι`, then `y′` has height at most `c′`;
  multiplying each `y_ι` by a real power `N_ι^{e_ι}` with `e_ι ∈ ℚ` and `N_ι` a positive integer prime to `ℓ(ι)` keeps
  the bound.
- (b) If `H ≠ 0`, `|σ(H)| ≤ e^α` for all `σ`, `|ι(Hy_ι)| ≤ e^{e_{ℓ(ι)}}` for all `ι` with real numbers `e_ℓ` of any sign,
  and `α + Σ_{ℓ∈S} e_ℓ ≤ c` for every finite set `S` of primes, then `y` has height at most `c`.
- (c) If `H ≠ 0` and `|σ(H)| ≤ e^c` for all `σ`, the constant family `H^{−1}` has height at most `c`.
- (d) Heights add: if `y` and `y′` have heights at most `c` and `c′`, the product `yy′` has height at most `c + c′`;
  the same for finite products, and `y^n` has height at most `nc`.
- (e) For `q ∈ ℚ` and `B` larger than the numerator and the denominator of `|q|`,
  `log|q| + Σ_{p<B prime} log|q|_p = 0` (with `log 0 = 0`).
- (f) If the constant family `1` has height at most `c`, then `c ≥ 0`. Consequently, if `z ≠ 0`, the constant family
  `z` has height at most `c` and `|σ(z)| ≤ e^{c′}` for every `σ ∈ Aut(ℂ)`, then `−c ≤ c′`.

*Needs:* ShortGRH background (a complex number whose images under all isomorphisms `ℂ → ℚ̄_ℓ`, for one prime `ℓ`,
are bounded is algebraic; for a countable ring `K` with injective maps to `ℂ` and to an algebraically closed field `L`
of the cardinality of `ℂ`, some isomorphism `ℂ → L` carries the first map to the second, so every embedding of a number
field into `ℚ̄_ℓ` extends to an isomorphism `ℂ → ℚ̄_ℓ`; [ShortProof] `Lib/General/NumberTheory/PadicLimitsValuation.lean`
(`New.isAlgebraic_of_norm_complexToCp_le`), `Lib/General/Geometry/GaloisCovers.lean` (`New.exists_ringEquiv_extend`));
Mathlib `padicNorm`, `Algebra.norm_eq_prod_embeddings`.

[ShortProof], `New/Reduction/Lattices/Heights` (`New.PrimePadicIso`, `New.HeightLe`, `New.HeightLe.mono`,
`New.HeightLe.rpow_mul`, `New.HeightLe.of_mul_le`, `New.HeightLe.inv_const`, `New.HeightLe.mul`, `New.HeightLe.prod`,
`New.HeightLe.pow`, `New.log_product_formula`, `New.HeightLe.nonneg_of_one`, `New.HeightLe.neg_le_of_norm_map_le`)

### 1.3 Twisted lattices, index and covolume

*Origin:* definitions and conventions.

*Method of the formal proof:* (a)–(d) combine the matrices of the index in diagonal blocks and sort a family by the
set it comes from; (e) is Hadamard's inequality and (f) Fischer's inequality, for the positive semidefinite Gram
matrices taken with the rational matrix `G`; (g) uses that `G` is rational, so that `σ` of a Gram determinant pairs the
conjugates by `σ` and by `z ↦ conj σ(conj z)`, and the Cauchy–Schwarz inequality for the determinant of a pairing.

Let `V` be a complex vector space and `T` a set with an element `1` (the twists, `1` the trivial twist). A *twisted
lattice* on `V` consists of:

- for each `ξ ∈ T` a complex inner product space `S_ξ` and a linear map `Θ_ξ : V → S_ξ`;
- a relation "`ξ` is allowed at `ℓ`" between twists and primes;
- for each `ξ` and each pair `ι` an `𝒪_ι`-submodule `Λ_{ξ,ι} ⊂ S_ξ` (the vectors integral at `ι`), such that
  `|ι⟨φ, φ′⟩| ≤ 1` whenever `ξ` is allowed at `ℓ(ι)`, `φ ∈ Λ_{ξ,ῑ}` and `φ′ ∈ Λ_{ξ,ι}`;
- a finite set `C`, a linear map `coord : S_1 → ℂ^C` and a matrix `G ∈ M_C(ℚ)`, positive definite as a complex matrix,
  with `⟨φ, φ′⟩ = coord(φ)^* G coord(φ′)`.

A vector `v ∈ V` is *integral at `ι`* if `Θ_ξ v ∈ Λ_{ξ,ι}` for every `ξ` allowed at `ℓ(ι)`. For `σ ∈ Aut(ℂ)` let
`σΘ₁v ∈ ℂ^C` be `coord(Θ₁v)` with `σ` applied to each coordinate, and `‖v‖²_σ = (σΘ₁v)^* G (σΘ₁v)`. For a finite family
`y = (y_i)_{i∈I}` in `V`:

- `y` has *index at most `δ`* if there are `δ_ℓ ≥ 0`, one for each `ℓ`, with `Σ_{ℓ∈S} δ_ℓ log ℓ ≤ δ` for every finite
  set `S` of primes, such that for every pair `ι` some matrix `u ∈ M_I(𝒪_ι)` has `|ι(det u)| ≥ ℓ(ι)^{−δ_{ℓ(ι)}}` and
  `Σ_k u_{ik}y_k` integral at `ι` for every `i`; the matrix is the same for all twists;
- `y` has *covolume at most `c`* if `|det((σΘ₁y_i)^* G (σΘ₁y_k))_{i,k}| ≤ e^c` for every `σ ∈ Aut(ℂ)`.

If `V` is a finite-dimensional inner product space, `Z(ξ) = det(Θ_ξ^*Θ_ξ)`, the Gram determinant of the images of an
orthonormal basis. Facts:

- (a) Index bounds increase with `δ` and do not depend on the numbering of the family.
- (b) If `y` and `y′` have index at most `δ` and `δ′`, the union has index at most `δ + δ′`.
- (c) Let `e_ℓ ≥ 0` with `Σ_{ℓ∈S} e_ℓ log ℓ ≤ δ` for every finite set `S` of primes. If for every pair `ι` some
  `𝒪_ι`-module `M ⊂ V` contains the family and the colength of the vectors integral at `ι` in `M` divides `ℓ(ι)^j`
  (1.1) for an integer `0 ≤ j ≤ e_{ℓ(ι)}`, then the family has index at most `δ`.
- (d) Let `t` be a finite set and `A_s ⊂ V` (`s ∈ t`) sets such that every finite family in `A_s` has index at most
  `δ`. Then every finite family with members in `⋃_{s∈t} A_s` has index at most `#t·δ`.
- (e) If `‖z_i‖²_σ ≤ e^h` for `i = 1, …, n` and every `σ`, then `(z_i)` has covolume at most `nh`.
- (f) If `y` has covolume at most `c` and `‖z_i‖²_σ ≤ e^h` for `i = 1, …, n` and every `σ`, then `y` together with
  `z_1, …, z_n` has covolume at most `c + nh`.
- (g) If `y` has covolume at most `c`, then `|σ(det⟨Θ₁y_i, Θ₁y_k⟩)| ≤ e^c` for every `σ ∈ Aut(ℂ)`.
- (h) `Z(ξ) ≠ 0` if `Θ_ξ` is injective, and `Z(ξ) = det(Θ_ξ^*Θ_ξ)` when `S_ξ` is finite-dimensional.

*Needs:* 1.1; Tau Ceti `Matrix.det_gram_le_prod_norm_sq` (Hadamard's inequality for Gram determinants) and
`Matrix.PosSemidef.det_fromBlocks_le` (Fischer's inequality: the determinant of a positive semidefinite Hermitian
matrix in block form is at most `det(A)·det(D)` for the diagonal blocks `A`, `D`; [ShortProof]
`Lib/General/LinearAlgebra/MinorProducts.lean` (`New.fischer_det_inequality`, `New.hadamard_det_inequality`),
`Lib/General/LinearAlgebra/GramDeterminant.lean` (`New.norm_det_formGram_le`)); ShortGRH background (the
Cauchy–Schwarz inequality for determinants: for a positive semidefinite Hermitian matrix `G` and two families `(a_i)`,
`(b_i)` of vectors with the same finite index set, `|det(a_i^* G b_k)|² ≤ |det(a_i^* G a_k)|·|det(b_i^* G b_k)|`;
[ShortProof] `Lib/General/LinearAlgebra/GramDeterminant.lean` (`New.norm_det_pairing_sq_le`),
`Lib/General/LinearAlgebra/HermitianMatrices.lean` (`New.norm_det_sq_le_of_posSemidef`)).

[ShortProof], `New/Reduction/Lattices/TwistedLattice` (`New.TwistedLattice`, `New.TwistedLattice.integralVectors`,
`New.TwistedLattice.IndexLe`, `New.TwistedLattice.normSqAt`, `New.TwistedLattice.CovolumeLe`,
`New.TwistedLattice.volume`, `New.TwistedLattice.indexLe_of_colengthDvd`, `New.TwistedLattice.IndexLe.sumElim`,
`New.TwistedLattice.indexLe_card_mul`, `New.TwistedLattice.covolumeLe_of_normSqAt_le`,
`New.TwistedLattice.CovolumeLe.sumElim`, `New.TwistedLattice.CovolumeLe.norm_map_det_gram_le`,
`New.TwistedLattice.volume_ne_zero`)

### 1.4 A twist for each prime

*Origin:* particular to this proof: a lower bound for the covolume of a family in a twisted lattice by its index, the
height of `Z(1)/Z(ξ_ι)` and the sizes and denominators of vectors completing it to a basis, with sizes read for the
trivial twist and valuations for a twist allowed at each prime.

*Method of the formal proof:* write `Gram(ξ)` for the Gram determinant of the images under `Θ_ξ` of the basis
`y ∪ z`; then `Gram(ξ) = Z(ξ)·Gram_V`, with `Gram_V` the Gram determinant of the basis `y ∪ z` in `V`, so
`Gram(1) = |γ(ξ_ι)|^{2n′}Gram(ξ_ι)·|γ(ξ_ι)|^{−2n′}·Z(1)/Z(ξ_ι)` for each pair. At `ι` and at `ῑ`, the matrices of the
index together with the scalar `γ(ξ_ι)` carry the images under `Θ_{ξ_ι}` into the integral vectors, so the
integrality of inner products bounds `|ι(|γ(ξ_ι)|^{2n′}Gram(ξ_ι))|` by `ℓ^{2δ_ℓ}`: that family has height at most `2δ`.
Adding the heights of the three factors (1.2 (d)) bounds the height of the constant family `Gram(1)`, and its
conjugates are at most `e^{c + n′b_short}` by 1.3 (f), (g); the product formula (1.2 (f)) gives the inequality.

Let `V` be a finite-dimensional complex inner product space with a twisted lattice whose maps `Θ_ξ` are all injective.
Let `y_1, …, y_n, z_1, …, z_{n′}` be a basis of `V`, and choose for each pair `ι` a twist `ξ_ι` allowed at `ℓ(ι)`.
Suppose:

- `y` has covolume at most `c` and index at most `δ`;
- `γ : T → ℂ^×` is such that `γ(ξ)Θ_ξz_i ∈ Λ_{ξ,ι}` for every `i`, every pair `ι` and every `ξ` allowed at `ℓ(ι)`;
- `‖z_i‖²_σ ≤ e^{b_short}` for every `i` and every `σ ∈ Aut(ℂ)`;
- the family `ι ↦ |γ(ξ_ι)|^{−2}` has height at most `b_denom`, and the family `ι ↦ Z(1)/Z(ξ_ι)` has height at most
  `b_vol`.

Then `0 ≤ c + 2δ + n′(b_short + b_denom) + b_vol`.

*Needs:* 1.2, 1.3.

[ShortProof], `New/Reduction/Lattices/TwistedLattice` (`New.TwistedLattice.covolume_add_index_nonneg`,
`New.TwistedLattice.heightLe_pow_mul_det_gram`, `New.TwistedLattice.norm_pow_mul_det_gram_le`)

## Layer 2: the parameters and the field

The parameters `q₀` and `d` are fixed once and for all; the exponent `s`, and with it the field `E`, grows with the
point `x` at which the prime sum is bounded. The infinite places of `E` form a group, the Galois group of `E` over `K`
read through the action on `ζ`; the `a`-places, the `b`-places and the weights live on it.

### 2.1 The parameters

*Origin:* definitions and conventions.

*Method of the formal proof:* the congruence is used in the form of the two divisibilities; the facts are elementary
congruences: every prime of `q₁` divides `q₀`, hence `2(d + 1)`, and `d ≡ −1` modulo `4p` gives `(p/d) = 1` by
reciprocity for the Jacobi symbol; `d² ≡ 1 (mod q₀)` gives the last fact.

*Parameters* `P = (q₀, d)` consist of a positive integer `q₀` divisible by `18480 = 16·3·5·7·11` and a prime `d` with
`q₀ | 2(d + 1)` and `q₀ ∤ d + 1`, that is `d ≡ q₀/2 − 1 (mod q₀)`. Put `K = ℚ(√−d) ⊂ ℂ` and `χ_K = (·/d)`. For `s ≥ 0`
let `l₀(s) = 3^{⌊log₃ s⌋+4}`, `T(s) = 3^{⌊log₃ s⌋+5}·2^s = 3 l₀(s) 2^s`, `q₁(s) = q₀T(s)` and `q₂(s) = (q₀d)^{s+6}`
(with `⌊log₃ 0⌋ = 0`). Then:

- (a) `q₀ ≠ 0`, `d ≡ 7 (mod 8)` and `d > 64`; if `q₀ > 0` is even and `d ≡ q₀/2 − 1 (mod q₀)`, then `q₀ | 2(d + 1)` and
  `q₀ ∤ d + 1`.
- (b) For `s ≥ 1`, `27s < l₀(s) ≤ 81s`; `2^{s+1} | q₁(s)`.
- (c) Every prime `p | q₁(s)` divides `(d + 1)/4` and has `χ_K(p) = 1`; a prime `p` with `χ_K(p) ≠ 1` has `p ≥ 13`.
- (d) `q₁(s)` is prime to `d`, and `q₁(s)d | q₂(s)`.
- (e) No power of `d` is `≡ −1 (mod q₀)`.

So, by the splitting dictionary of ImaginaryQuadraticClassNumber §2.1, `χ_K` is the quadratic character of `K`, the
primes dividing `q₁` split in `K`, and `d` is the only prime ramified in `K`.

**Checks.** `q₀ = 18480` and `d = 9239 = q₀/2 − 1` are parameters: `9239` has no prime factor below `97` and
`97² > 9239`, and `9239 ≡ 7 (mod 8)`.

*Needs:* ImaginaryQuadraticClassNumber §2.1 (the splitting dictionary, for `K` of discriminant `D = −d`: `χ_D` is the
quadratic character of conductor `d`, that is `(·/d)`, and a prime `p` ramifies, splits or is inert in `K` as
`χ_D(p) = 0, 1, −1`); Mathlib `jacobiSym`, `legendreSym`.

[ShortProof], `New/Reduction/Data/FieldsAndPlaces` (`New.Parameters`, `New.Parameters.instPrimeSevenModEight`,
`New.Parameters.sixty_four_lt_d`, `New.l₀`, `New.towerDeg`, `New.Parameters.q₁`, `New.Parameters.q₂`,
`New.Parameters.chiK_eq_one_of_dvd`, `New.Parameters.thirteen_le_of_chiK_ne_one`, `New.Parameters.coprime_q₁_d`,
`New.Parameters.q₁_mul_d_dvd_q₂`, `New.Parameters.d_pow_ne_neg_one`); `New/Reduction/OneSidedBound`
(`New.dvd_two_mul_succ_and_not_dvd_succ`)

### 2.2 The field `E` and its infinite places

*Origin:* definitions and conventions. With `K` and `ι₀`, the field `E` is an abelian CM host in the sense of
FrobeniusRestrictedRieszSums §0.1, whose places are the elements of `Gal(E/K)`; this section fixes the one host
`K(ζ_{q₁})` and the group of its infinite places, and that section is not a supplier.

*Method of the formal proof:* the cyclotomic polynomial of order `q₁` stays irreducible over `K` because `K` embeds in
`ℚ(ζ_d)` by a Gauss sum and `[ℚ(ζ_d, ζ_{q₁}) : ℚ] ≥ φ(d)φ(q₁)`, `q₁` being prime to `d`; `E` is totally complex because
`K` is; two `K`-embeddings with the same place are equal or complex conjugate, and conjugate ones would make the
embedding of `K` real. The group law on the infinite places is transported from `Gal(E/K)` along the bijection that
sends `g` to the place of a fixed `K`-embedding composed with `g` (a bijection because `K`-embeddings with the same place
are equal and all infinite places of `E` lie over the one of `K`); the other objects are defined from it.

Fix parameters `P` and `s ≥ 0`, and write `q₁ = q₁(s)`.

- `E = E_s = K(ζ)`, the cyclotomic extension of `K` of order `q₁`, with a chosen primitive `q₁`-th root of unity `ζ`.
  The cyclotomic polynomial of order `q₁` is irreducible over `K`, so `g ↦ a` with `g(ζ) = ζ^a` is an isomorphism
  `Gal(E/K) ≅ (ℤ/q₁)^×`; `E` is totally complex; and two `K`-embeddings of `E` into `ℂ` inducing the same infinite
  place are equal.
- `Φ = Φ_s`, the set of infinite places of `E`, `f = #Φ`. Fix a `K`-embedding `ι₀ : E → ℂ`. The map
  `Gal(E/K) → Φ`, `g ↦ (place of ι₀∘g)`, is a bijection, by the last fact and because all infinite places of `E` lie
  over the one of `K`; `Φ` carries the group law that makes it an isomorphism, and `Φ ≅ Gal(E/K) ≅ (ℤ/q₁)^×`, the
  second map sending `g` to the class `a` with `g(ζ) = ζ^a`. The embedding chosen at `v ∈ Φ` is `Φ_v = ι₀ ∘ g_v`, `g_v`
  the automorphism of `v`; these form a CM type of `E`.
- For an integer `ν`, `[ν] ∈ Φ` is the place of the class of `ν` if `ν` is prime to `q₁`, and the identity place
  otherwise; for `ν ∈ ℤ` and `σ ∈ Φ`, `νσ` means `[ν]·σ`. For `m | q₁`, the *class modulo `m`* of a place is its image in
  `(ℤ/m)^×`.
- `rd_E` is the root discriminant of `E`, and `Ω = Ω_s = exp(γ − Re (L′/L)(1, χ_K))·2π/rd_E`.

*Needs:* 2.1; Mathlib `IsCyclotomicExtension`, `Polynomial.cyclotomic`, `NumberField.InfinitePlace`.

[ShortProof], `New/Reduction/Data/FieldsAndPlaces` (`New.Parameters.E`, `New.Parameters.ζ`,
`New.Parameters.irreducible_cyclotomic`, `New.Parameters.algHom_eq_of_mk_eq`, `New.Parameters.galOfPlace`,
`New.Parameters.placeMulEquiv`, `New.Parameters.placeOfInt`, `New.Parameters.placeClass`, `New.Parameters.bigOmega`)

### 2.3 Arithmetic of `E`

*Origin:* adapted from the classical theory of cyclotomic fields (Washington (1997), Chapter 2): here the extension of
`K = ℚ(√−d)` by the roots of unity of an order prime to `d`, with its infinite places read as its Galois group.

*Method of the formal proof:* (a) sends `K` into `ℚ(ζ_d) ⊂ ℚ(ζ_{q₁d})` by a Gauss sum, and the cyclotomic polynomial of
order `q₁` splits in `ℚ(ζ_{q₁d})`; (b) compares degrees of cyclotomic polynomials, the one of order `q₁` being the one
of order `q₀` evaluated at `X^T`, since the primes of `T` divide `q₀`; (d) uses that a root of unity of order not
dividing `q₁` would give a primitive `d`-th root of unity in `E`, against `φ(d)φ(q₁) > [E : ℚ]`.

Let `P` be parameters and `s ≥ 0`, `q₁ = q₁(s)`, `T = T(s)`.

- (a) `E` embeds in `ℚ(ζ_{q₁d})`, so `E` is abelian over `ℚ` and over `K`.
- (b) `f = Tφ(q₀)`, and exactly `T` places have class `1` modulo `q₀`.
- (c) `g_v(ζ) = ζ^{a}` with `a` the class of `v`; for `ν` prime to `q₀`, `g_{[ν]}(ζ) = ζ^ν` and the class of `[ν]` modulo
  every `m | q₁` is `ν`; `[ν]^i = [ν^i]`; `Φ_{vv′} = Φ_v ∘ g_{v′}`; the class of `[ν]` modulo `q₀` is `−1` exactly when
  `ν ≡ −1 (mod q₀)`.
- (d) Every root of unity of `E` is a power of `ζ`; `ζ̄ = ζ^{−1}`; `N_{E/K}(ζ) = 1`.
- (e) `∏_{v∈Φ} Φ_v(y) = N_{E/K}(y)` for `y ∈ E`.

*Needs:* 2.1, 2.2; Mathlib `IsCyclotomicExtension`, `Polynomial.cyclotomic`, `NumberField.InfinitePlace`.

[ShortProof], `New/Reduction/Data/FieldsAndPlaces` (`New.Parameters.toCycloField`, `New.Parameters.numInfPlaces_E`,
`New.Parameters.card_placeClass_eq_one_eq_towerDeg`, `New.Parameters.galOfPlace_placeOfInt_zeta`,
`New.Parameters.placeClass_placeOfInt`, `New.Parameters.placeOfInt_pow`,
`New.Parameters.placeClass_placeOfInt_eq_neg_one_iff`, `New.Parameters.exists_zeta_pow_eq`,
`New.Parameters.star_zeta`, `New.Parameters.norm_zeta_eq_one`, `New.Parameters.prod_phi_eq_norm`)

## Layer 3: admissible data

Admissible data are all the choices made at one point `x`. The scales are separated by powers that grow beyond every
constant: `(log b)^{100} ≤ x`, `x^{10⁶} ≤ x₁`, `x₁^{10⁶} ≤ b`. The `b`-places, where the weight is `b`, form a sparse
set built after Behrend; on the other places the weight is `a/x₁`, so the prime sum has length `x` at the `b`-places
and `x₁` elsewhere.

### 3.1 Sparse sets of places, the constant `C_P` and the lower end `N₋`

*Origin:* definitions and conventions.

*Method of the formal proof:* the bound on `log N₋` compares each term: the mean of `log κ` lies in `[0, log b]`,
`1 ≤ rd_E ≤ q₁d` because `q₁d` lies in the different of `E`, so `19 log b ≤ log(M rd_E/2π) ≤ 23 log b`.

Let `P` be parameters and `s ≥ 0`.

- A set `S ⊂ Φ_s` is *sparse for the primes up to `L`* if for every prime `ℓ ≤ L` and all integers `0 < i < j < l₀(s)`
  there are no `σ, τ, ρ ∈ S` (equal or not) and signs `ε, ε′ ∈ {±1}` such that the classes of `τσ^{−1}` and `ρσ^{−1}`
  modulo the part of `q₁(s)` prime to `ℓ` are `εℓ^i` and `ε′ℓ^j`.
- `C_P = c_vac + (2d + 6) + q₀ + |γ − Re (L′/L)(1, χ_K)| + Σ_ξ |log|Φ′_{q₀}(ξ)||`, the sum over the primitive `q₀`-th
  roots of unity `ξ ∈ ℂ`, `Φ_{q₀}` the cyclotomic polynomial and `c_vac ≥ 0` the constant written `C` in
  DivisibilityOfThetaDerivatives §4.6 (b), which bounds the conjugates of the integral vacuum by `exp(C·q₁²)` (it is
  not the scalar written `c_vac` in that section). It depends on `q₀` and `d` only.
- For `m ≥ 1`, `κ : Φ_s → ℕ`, `M ≥ 1` and real `L`,
  `log N₋(s, m, κ, M, L) = m·f^{−1}Σ_{τ∈Φ_s} log κ(τ) + (m − 1)·log(M·rd_E/2π) − (15/2)L`.

Fact: if `m ≥ 2`, `L ≥ 7`, `1 ≤ κ(τ) ≤ e^L` for every `τ`, `e^{20L} ≤ M ≤ e^{22L}` and `q₁(s)d ≤ e^L`, then
`mL ≤ log N₋(s, m, κ, M, L) ≤ 24mL`.

*Needs:* 2.1, 2.2; DivisibilityOfThetaDerivatives §§1.1, 4.6 (from §1.1: the different of `E` is generated by
`c·P′(ζ)·√−d` with `P′(ζ) | q₁`, so the integer `q₁d` lies in it; from §4.6 (b): the constant `C`, here `c_vac`).

[ShortProof], `New/Reduction/Data/AdmissibleData` (`New.Parameters.IsSparse`, `New.Parameters.constantBound`,
`New.Parameters.logLevelMin`, `New.Parameters.logLevelMin_mem_Icc`, `New.rootDiscr_mem_Icc`)

### 3.2 Admissible data

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions are those of [ShortProof].

Let `P` be parameters. *Admissible data* `D` for `P` consist of:

- integers `x, x₁, b ≥ 1` with `10¹²·C_P ≤ log log b`, `(log b)^{100} ≤ x`, `x^{10⁶} ≤ x₁`, `x₁^{10⁶} ≤ b` and
  `(log x₁)^6 ≤ log b`;
- integers `m`, `r`, `s` with `√x ≤ m ≤ 2√x`, `x⁵ ≤ r ≤ 3x⁵`, `m = 2^e` and `s = 22e` for some `e ≥ 1` (so
  `2^s = m^{22}`), `r = 3^{e′}` for some `e′ ≥ 1`, `s ≤ 32 log x`, and `q₁x₁ | b` with `q₁ = q₁(s)`; the field of the
  data is `E = E_s`;
- a set `Φ_b ⊂ Φ_s` of places of class `−1` modulo `q₀` with `T(s) ≤ #Φ_b·log b`, sparse for the primes up to `kt`,
  where `k = r + 1 − m` and `t = 5r`;
- the weight `κ : Φ_s → ℕ`, `κ(τ) = b` for `τ ∈ Φ_b` and `κ(τ) = xb/x₁` otherwise (an integer, as `x₁ | b`);
- distinct primes `p₀, p₁ ≡ 1 (mod q₂(s)²)` with `b^{10} ≤ p_i ≤ b^{11}`, and `π̄_M ∈ 𝒪_K` with `π̄_M·conj(π̄_M) = p₀p₁`;
- a prime `N ≡ 1 (mod q₂(s)²)` with `log N₋ ≤ log N ≤ log N₋ + √(log b)`, where `log N₋ = log N₋(s, m, κ, p₀p₁, log b)`
  (3.1), and `π_N ∈ 𝒪_E` with `π_N π̄_N = N`.

Derived numbers: `a = xb`; `k = r + 1 − m` (exact by 3.3); `t = 5r`; `n_j = k + j(t + 1)`; `Δ/2 = r⁸` and `Δ = 2r⁸`;
`κ_{(i)}(σ) = κ(σ) + (i + 1)Δ/2` and `κ_j = κ_{(2j)} = κ + (j + 1/2)Δ`; `Δ/2 − (t + 1)/2`; the number `k + j − 1` of
plus signs of `W_j` (ThetaLiftChainsAndTheSeesawIdentity §2.1); `M = p₀p₁`; `π_M = conj(π̄_M)`, read in `𝒪_E`;
`Φ_a ⊂ Φ_s`, the places of class `1` modulo `q₀`; `f = #Φ_s`; `q₁ = q₁(s)`, `q₂ = q₂(s)`, `T = T(s)`, `l₀ = l₀(s)`;
`rd_E` and `Ω = Ω_s` (2.2); the integers `1 ≤ j ≤ m`, which index the lifts.

*Needs:* 2.1, 2.2, 3.1.

[ShortProof], `New/Reduction/Data/AdmissibleData` (`New.Data`, `New.Data.a`, `New.Data.k`, `New.Data.t`, `New.Data.n`,
`New.Data.halfGap`, `New.Data.gap`, `New.Data.reducedHalfGap`, `New.Data.shiftedWeight`, `New.Data.liftWeight`,
`New.Data.posRank`, `New.Data.M`, `New.Data.aPlaces`); `New/Reduction/Data/LevelAndTwists` (`New.Data.LiftIndex`)

### 3.3 Sizes of the data

*Origin:* particular to this proof: the sizes of the data, and the comparisons between them that the later sections
use.

*Method of the formal proof:* every quantity gets an upper and a lower exponent, `|F| ≤ e^l` and `e^{l′} ≤ F`, computed
from its shape (products add exponents, sums take the larger one plus one); an inequality `F ≤ G` is proved by comparing
an upper exponent of `F` with a lower exponent of `G`, which reduces it to a linear inequality between `log x`, `log x₁`,
`log b`, `log log x₁`, `log log b` and `C_P`, settled by the five inequalities between the scales. The root
discriminant is the geometric mean of `|δ_E|_v` over the infinite places, for a generator `δ_E` of the different with
`|δ_E|_v = A_v·T·√d`, `|log A_v| ≤ C_P`.

For admissible data:

- (a) Scales: `C_P ≥ max(64, q₀, d, φ(q₀))` and `C_P ≤ log b`; `x^{10⁶} ≤ x₁`, `x₁^{10⁶} ≤ b`, `(log x₁)⁶ ≤ log b`,
  `(log b)^{100} ≤ x`; `x₁^{3l₀²} ≤ √b`; `x^{999} ≤ a/x₁ ≤ b/x^{999}`.
- (b) Ranks: `x ≤ m² ≤ 4x`, `m ≥ 10⁴`; `m` and `k` are even, `r` and `t` odd; `r + 1 = k + m`, `100m ≤ k ≤ r ≤ 2k`,
  `r + 6 ≤ t`, `k + t + 1 ≤ Δ/2`; `e^{−2}x⁵ ≤ k`, `t ≤ e⁸x⁵`, `x^{11/2} ≤ n_m ≤ e^{12}x^{11/2}`,
  `x^{40} ≤ Δ/2 ≤ Δ ≤ e^{27}x^{40}`; `1 ≤ s ≤ log x₁`, `m^{594} ≤ 2^{l₀}`.
- (c) Field: `x^{11} ≤ m^{22} ≤ f ≤ q₁ ≤ x^{12}`; `f` is even and `f = φ(q₀)T = φ(q₀)·#Φ_a`;
  `x^{11} ≤ T ≤ x^{11}(log b)^{1/5}`; `q₂ ≤ x^{33q₀d}`; `log h_E ≤ x^{30}` for the class number `h_E` of `E`;
  `x^{10} ≤ rd_E ≤ x^{12}`, and `x^{10} ≤ |δ_E|_v ≤ x^{12}` at every infinite place `v`, for the generator `δ_E` of the
  different of `E` of DivisibilityOfThetaDerivatives §1.1 (b) and `|y|_v = |Φ_v(y)|`; `x^{−13} ≤ Ω ≤ 1`.
- (d) Weights: `q₁ | κ(σ)`; `a/x₁ ≤ κ(σ) ≤ a/x = b`; `κ(σ) + x^{42} ≤ 2b`; `κ(σ) ≤ κ_j(σ) − Δ/2` and
  `κ_j = κ + jΔ + Δ/2`; for `i ≤ 4m`, `κ(σ) ≤ κ_{(i)}(σ) ≤ κ(σ) + x^{42}` and `log κ_{(i)}(σ) ≤ log κ(σ) + 1/x`; for
  `j ≤ 2m`, `κ_j(σ) ≤ 2b`.
- (e) Primes and level: `p_i ≡ 1 (mod q₁d)`, `q₂² | p_i − 1`; `b² < p_i < N`; `b^{20} ≤ M ≤ b^{22}`;
  `m log b ≤ log N₋ ≤ 24m log b` and `m log b ≤ log N ≤ 30m log b`, so `N ≥ b^{101}`; `N ≡ 1 (mod q₁d)`;
  `20 log b ≤ log(M/Ω) ≤ 23 log b` and `|log(M·rd_E/2π)| ≤ 23 log b`.

*Needs:* 2.1, 2.3, 3.1, 3.2; DivisibilityOfThetaDerivatives §1.7 (a) (the generator `δ_E` of the different of `E`
has `|δ_E|_v = A_v·T·√d` and `|log A_v| ≤ C_P` at every infinite place `v`), §1.1 (b), (c) (the generator `δ_E`;
`∏_v |δ_E|_v = rd_E^f`);
ExplicitNumberFields §5.3 (the third form, which uses no computational hypothesis: a number field of degree `n` and
discriminant of absolute value `d_E` has `h_E ≤ (2^{n−1}/(n − 1)!)·√d_E·(log d_E)^{n−1}`; as `log d_E ≤ d_E`, this
gives `h_E ≤ (2^n·d_E)^{n+1}`, the form used; [ShortProof] `Lib/General/NumberTheory/SUnitsAndClassNumber.lean`
(`New.classNumber_le`)).

[ShortProof], `New/Reduction/Data/Magnitudes` (`New.Data.HasLogBound`, `New.Data.le_constantBound`,
`New.Data.scale_inequalities`, `New.Data.le_of_hasLogBound`, `New.Data.ten_thousand_le_m`, `New.Data.r_add_one`,
`New.Data.hundred_mul_m_le_k`, `New.Data.k_even`, `New.Data.t_odd`, `New.Data.r_add_six_le_t`,
`New.Data.k_add_t_add_one_le_halfGap`, `New.Data.q₁_dvd_weight`, `New.Data.liftWeight_eq`, `New.Data.M_mem_Icc`,
`New.Data.levelPrime_modEq_one`); `New/Reduction/Data/Sizes` (`New.Data.x₁_pow_le_sqrt_b`, `New.Data.m_sq_mem_Icc`,
`New.Data.r_le_two_mul_k`, `New.Data.m_pow_le_two_pow_l₀`, `New.Data.f_mem_Icc`, `New.Data.f_even`, `New.Data.q₁_le`,
`New.Data.q₂_le`, `New.Data.log_classNumber_le`, `New.Data.a_div_x₁_mem_Icc`, `New.Data.levelPrime_mem_Ioo`,
`New.Data.bigOmega_le_one`, `New.Data.log_M_div_bigOmega_mem_Icc`, `New.Data.abs_log_M_mul_rootDisc_le`);
`New/Reduction/Data/LevelAndTwists` (`New.Data.weight_mem_Icc`, `New.Data.weight_add_x_pow_le_two_mul_b`,
`New.Data.shiftedWeight_mem_Icc`, `New.Data.log_shiftedWeight_le`, `New.Data.liftWeight_le_two_mul_b`,
`New.Data.logLevelTarget_mem_Icc`, `New.Data.log_N_mem_Icc`, `New.Data.N_modEq_one`);
`New/Derivatives/Field/ChosenPlaces` (`New.Data.hasLogBound_deltaE`, `New.Data.rootDisc_mem_Icc`)

### 3.4 The row parameter, twists and the characters of the lifts

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions are those of [ShortProof]; the weight of `μ_j⁰` adds the weights of its
factors and multiplies their tame parts; the row parameter is rewritten with `κ_j`.

Let `D` be admissible data, `E` its field and `E⁺` its maximal real subfield. `U(1)` is the norm-one torus of `E/E⁺`, a
group over `E⁺`: `U(1)(R) = {u ∈ (E ⊗_{E⁺} R)^× : uū = 1}` for an `E⁺`-algebra `R`. Its adelic points `U(1)(𝔸_{E⁺})`
are the ideles `u` of `E` with `uū = 1` (written `U(1)(𝔸_E)` in the other roadmaps of the family), and its rational
points `U(1)(E⁺)` the `u ∈ E^×` with `uū = 1`. An *automorphic character* of `U(1)` is a continuous homomorphism
`U(1)(𝔸_{E⁺}) → S¹` trivial on `U(1)(E⁺)`. For a finite place `w` of `E` let `𝔽_w` be its residue field and
`Nm w = #𝔽_w`. An automorphic character `μ` has *weight*
`e : Φ → ℤ` and *tame part* `ψ = (ψ_w)_w`, `ψ_w` a character of `𝔽_w^×`, if `ψ_w = 1` for almost all `w` and
`μ(u) = ∏_{v∈Φ} Φ_v(u_v)^{e(v)}·∏_w ψ_w(u_w mod w)` for every `u` whose finite components are integral.

- *The row parameter* at `v ∈ Φ` is the integer sequence `(λ_i(v))_{i≥0}` with `λ_i(v) = k/2 − 1 − i` for `i < k − 1`
  and `λ_i(v) = Δ/2 − κ_j(v) = −(κ(v) + jΔ)` with `j = i + 2 − k` for `i ≥ k − 1` (`k` is even).
- A *tame character* is a triple `(ξ, ψ, Q)`, written `ξ`: an automorphic character `ξ` of weight `0`, a tame part `ψ`
  of `ξ`, and a finite set `Q = Q(ξ)` of finite places of `E`, its *modulus*, such that `ψ_w = 1` for `w ∉ Q`, `Q` is
  disjoint from its complex conjugate, and `Nm Q(ξ) = ∏_{w∈Q} Nm w` is prime to `MN`. The tame part and the modulus
  belong to the datum: the character does not determine `Q`. The power `ξ^n` is `(ξ^n, ψ^n, Q)`.
- A *twist* is a tame character with `ψ_w ≠ 1` for every `w ∈ Q`; an *`m`-fold twist* is one with `ψ_w^n ≠ 1` for every
  `w ∈ Q` and `1 ≤ n ≤ m`, so that `ξ^n` is a twist for `1 ≤ n ≤ m`. The trivial character, with trivial tame part and
  `Q = ∅`, is the trivial twist `1`, an `m`-fold twist.
- *The characters of the lifts.* `μ_j⁰ = μ♭·(υ^{−Δ}χ)^j`, where `μ♭` has weight `−κ₀` and trivial tame part, `χ` has
  weight `0` and tame part `ω`, and `υ` is the splitting character of the Weil data of `E` restricted to `U(1)`, of
  weight `1` and trivial tame part (DivisibilityOfThetaDerivatives §1.6 (a) for `μ♭` and `χ`, there `χ₀` and `χ_M`;
  §1.5 for `ω`; §1.4 (c) for `υ`). For a tame character `ξ`, the character of lift `j`
  twisted by `ξ` is `μ_j⁰ξ`, and the character of lift `j` of the chain of `ξ` is `μ_j⁰ξ^j`.

Fact: `μ_j⁰` has weight `−κ_j` and tame part `ω^j`; `μ_j⁰ξ` has weight `−κ_j` and tame part `ω^jψ`.

*Needs:* 3.2, 3.3; DivisibilityOfThetaDerivatives §1.5 (the chosen places and the residue characters `ω` of order `q₂`
at them), §1.6 (the characters `μ♭` and `χ`), §1.4 (the splitting character `υ` of the Weil data of `E`);
IdelicReciprocityCountsAndCyclotomicClassGroups §7.1 (automorphic characters of `U(1)` of a CM field with a weight and a
tame part in the sense above; weights add and tame parts multiply under products and powers), §7.6 (b) (the restriction
to `U(1)` of the splitting character of Weil data has weight `1` and trivial tame part).

[ShortProof], `New/Reduction/Data/LevelAndTwists` (`New.Data.targetParameter`, `New.Data.targetParameter_eq`,
`New.Data.TameChar`, `New.Data.TameChar.pow`, `New.Data.Twist`, `New.Data.MFoldTwist`, `New.Data.MFoldTwist.powTwist`,
`New.Data.untwistedLiftChar`, `New.Data.untwistedLiftChar_hasWeight`, `New.Data.liftChar`, `New.Data.hasWeight_liftChar`,
`New.Data.chainChar`)

### 3.5 Sets with no relation of bounded length modulo an integer

*Origin:* adapted from Behrend (1946), large sets of integers without three-term arithmetic progressions, and Shapira
(2006), Behrend-type constructions for sets of linear equations (compare Alon and Shapira (2006), Lemma 4.1 in the
preprint numbering): here one set avoids simultaneously every relation `(α + α′)e₂ ≡ αe₁ + α′e₃` with positive
`α, α′` of sum at most `L`, read modulo `o`; the length `n` of the digit vectors is a parameter, and the lower bound for
the size of the set is given in closed form.
FrobeniusRestrictedRieszSums §0.8 states sets of integers with no relation of length `L`, by the same construction;
here the relations are congruences modulo `o` with positive coefficients, and the count `H^n/(nH²)` is explicit
because 3.6 uses it. Neither statement is deduced from the other.

*Method of the formal proof:* the integers whose digits in base `LH` form a vector of `{0, …, H − 1}^n` on a sphere
with the most points; in a congruence among three of them both sides have all digits below the base, so the
congruence holds digit by digit, which makes one vector a strict mean of the other two; on a sphere this forces the
three to be equal.

Let `n, H, L, o` be positive integers with `(LH)^n ≤ o`. There is a set `S ⊂ [0, o)` of at least `H^n/(nH²)` integers
such that, for `e₁, e₂, e₃ ∈ S` and integers `α, α′ > 0` with `α + α′ ≤ L`, `(α + α′)e₂ ≡ αe₁ + α′e₃ (mod o)` implies
`e₁ = e₂ = e₃`.

*Needs:* Mathlib `Behrend.sphere`, `Behrend.map`, `Behrend.map_injOn`, `Behrend.exists_large_sphere`.

[ShortProof], `New/Reduction/Data/Existence` (`New.exists_three_term_free`, `New.eq_of_add_mul_eq_of_sum_sq_eq`)

### 3.6 Large sparse sets of places

*Origin:* particular to this proof: a set of places of class `−1` modulo `q₀`, of size `T(s)` up to a small power, with
no two ratios `±ℓ^i`, `±ℓ^j` from one point modulo the part of `q₁` prime to `ℓ`.

*Method of the formal proof:* let `g = [1 + 3l₀q₀]`; writing `q₀ = 2^v u` with `u` odd, the class of `g` modulo
`2^{s+v}` has order `2^s`. The set is `{−g^e : e ∈ S}` for a set `S` of 3.5 modulo that order, with `L = 2l₀`; these
places have class `−1` modulo `3l₀q₀` and are distinct. For `ℓ = 2` a ratio `±2^i` modulo the part `3l₀ = 3^{c}` of
`q₁` would give `4^i ≡ 1 (mod 3^c)`, against the order `l₀ > i` of `4`. For odd `ℓ`, squaring the two ratios modulo
`2^{s+v}` gives `(2j)(e₂ − e₁) ≡ (2i)(e₃ − e₁)` modulo the order of `g`, a relation excluded by 3.5 unless
`e₁ = e₂ = e₃`; then `ℓ^{2i} ≡ 1 (mod 2^{s+1})`, against the order of `ℓ` there. The second statement chooses the side
`H` as a power of `2` with `H^n ≤ 2^s/W < (2H)^n`.

Let `P` be parameters and `s ≥ 0`, `l₀ = l₀(s)`.

- (a) If `n, H ≥ 1`, `(2l₀H)^n ≤ 2^s` and `2l₀(L + 1) < 2^s`, there is a set of at least `H^n/(nH²)` places of `E_s` of
  class `−1` modulo `q₀`, sparse for the primes up to `L`.
- (b) If `n ≥ 1` and the real `W` satisfies `1 ≤ W ≤ 2^s ≤ W^n`, `(2l₀)^n ≤ W`, `3l₀n2^n ≤ W³`, and
  `2l₀(L + 1) < 2^s`, there is a set `S` of places of class `−1` modulo `q₀`, sparse for the primes up to `L`, with
  `T(s) ≤ #S·W⁶`.

*Needs:* 2.1, 2.3, 3.1, 3.5.

[ShortProof], `New/Reduction/Data/Existence` (`New.Parameters.exists_orderOf_placeClass_eq`,
`New.Parameters.exists_large_isSparse`, `New.Parameters.exists_isSparse`, `New.Parameters.exists_isSparse_of_ranks`)

### 3.7 Admissible data exist at every large integer

*Origin:* particular to this proof: the construction of the data at a given `x`, with explicit scales and ranks.

*Method of the formal proof:* put `W = x^{ε/6}`. Then `m` is the least power of `2` with `m ≥ √x`, `r` the least power
of `3` with `r ≥ x⁵`, `2^s = m^{22}`, `x₁ = ⌊e^W⌋` and `b` the least multiple of `q₁x₁` above `e^{W⁶}`. The `b`-places
come from 3.6 (b) with `L = kt`, so that `T ≤ #Φ_b·W⁶ ≤ #Φ_b log b`. The primes come from windows: fix an integer
`n₀ ≥ 1` with `99q₀d < n₀ε/6`; for large `W` every window `[U, U + W]` with `W ≤ U ≤ W^{n₀+7}` contains `log p` for a
prime `p ≡ 1` modulo `(q₀d)^j`, for each `j > 1` with `(q₀d)^j ≤ W^{n₀+7}`. Taking `h_K + 1` primes
`p ≡ 1 (mod q₂²)` in disjoint windows of `[10 log b, 11 log b]`, each splits in `K` as `𝔭𝔭′` with both factors of
norm `p` (as `p ≡ 1 (mod d)`), and by the pigeonhole principle some product `𝔭_i𝔭′_j` with `i ≠ j` is principal, which
gives `π̄_M` with norm `p_ip_j`. The level `N` is a prime `≡ 1 (mod q₂²)` with `log N` in the window of length
`W ≤ √(log b)` at `log N₋`, and `N ≡ 1 (mod 4)` is a sum of two squares `u² + v²`, so `π_N = u + vi` with `i ∈ E`. The
inequalities between the scales hold for large `x` because `ε < 1/100`.

Let `P` be parameters and `0 < ε < 1/100`. For every large integer `x` there are admissible data `D` with this `x`,
`x₁ = ⌊exp(x^{ε/6})⌋`, `b` the least multiple of `q₁x₁` exceeding `exp(x^ε)`, `m` the least power of `2` with
`m ≥ √x`, `r` the least power of `3` with `r ≥ x⁵`; and then `x^{ε/6} − 1 ≤ log x₁` and
`x^ε ≤ log b ≤ x^ε + 1`.

*Needs:* 2.1, 2.3, 3.1, 3.2, 3.6; AnalyticNumberTheoryPartI §0.32 (primes `≡ 1` modulo a modulus at most a power of
`log p`, with `log p` in a window of length at least `1`); ImaginaryQuadraticClassNumber §2.1 (the splitting
dictionary, for `d` a prime `≡ 7 (mod 8)` and `K = ℚ(√−d)`, of discriminant `D = −d`: `χ_D` is a Dirichlet character
modulo `d`, so a rational prime `p ≡ 1 (mod d)` has `χ_D(p) = 1`, and `p𝒪_K` is then the product of two prime ideals,
each of norm `p`; [ShortProof] `Lib/General/NumberTheory/ImaginaryQuadraticField.lean`
(`New.QuadField.q_eq_iff_chiK_ne_neg_one`, `New.QuadField.prime_inert_or_eq_mul`)); Mathlib
`Ideal.absNorm_span_singleton` (with the norm `ππ̄` of an element `π` of `K`: a principal ideal `(π)` of `𝒪_K` of norm
`n` has `ππ̄ = n`; [ShortProof] the same file (`New.QuadField.absNorm_span_eq_mul_star`)),
`NumberField.classNumber`, `Nat.Prime.sq_add_sq`.

[ShortProof], `New/Reduction/Data/Existence` (`New.eventually_exists_data`, `New.Parameters.IsAdmissibleData`,
`New.Parameters.IsLargeScale.exists_isAdmissibleData`, `New.eventually_exists_data_of_isAdmissibleData`,
`New.Parameters.exists_prime_pair_norm`, `New.Parameters.exists_prime_log_mem_Icc_mul_star_eq`,
`New.exists_isLeast_two_pow_three_pow`)

## Layer 4: prime sums

The prime sum at a place `σ` counts the prime powers `ν` up to the length `y/κ(−νσ)`, which depends on the place
`−νσ` reached from `σ` through the Frobenius class of `ν`. Its main term is the expected value `s_main`; the size
`s_∞(j)` of a derivative of order `j` less the prime sum at the weight is what one direction of a lift costs.

### 4.1 The prime sums of the data

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions are those of [ShortProof].

Let `D` be admissible data and `d` its prime; `λ₁(ν) = Λ(ν)(1 − χ_K(ν))` (0.1 at `q = 1`), `c₁ = Re G₁(1)`.

- `s_fin(y, σ) = Σ_{1≤ν≤a} λ₁(ν)(y/ν − κ(−νσ))₊` for real `y` and `σ ∈ Φ`. The terms with `ν` not prime to `q₁`, where
  `−νσ = σ` by convention, vanish: such a `ν` with `Λ(ν) ≠ 0` is a power of a prime dividing `q₁`, and `χ_K = 1` there
  (2.1 (c)).
- `s_∞(j) = log j! + j log(M/Ω)` for integers `j ≥ 0`.
- `h_dir = Σ_{σ∈Φ} (s_∞(κ(σ)) − s_fin(κ(σ), σ))` and `h_main = m·k·h_dir`.
- `s_main = a(log a − f^{−1}Σ_{τ∈Φ} log κ(τ) + c₁)` and `rem = Σ_{τ∈Φ_a} (s_fin(a, τ) − s_main)`.
- `u_E = f·a·(log b)³`, the error unit.
- For a prime `p`, the *local prime sum* is `s_p(y, σ) = v(π_p)·Σ_{e∈I_p} (y/p^e − κ(−p^eσ))₊` for real `y` and
  `σ ∈ Φ`, with `v(π_p)` and `I_p` of DivisibilityOfThetaDerivatives §2.1 (`v(π_p) = 1/2` if `p = d` and `1`
  otherwise; `I_p` is the set of odd `e ≥ 1` if `p` is inert in `K`, of all `e ≥ 1` if `p = d`, and is empty if `p`
  splits). Its *total* is `S_p = Σ_{σ∈Φ} s_p(κ(σ), σ)`. So `2 log p·s_p(y, σ)` is the sum of the terms of `s_fin(y, σ)`
  at the powers of `p`, without the bound `ν ≤ a`.

Here `c₁ = −1 − γ + Re (L′/L)(1, χ_K)`, so `s_main = a(log a − 1 − γ + Re (L′/L)(1, χ_K) − mean log κ)`, the main term
`𝔐(a, κ)` of FrobeniusRestrictedRieszSums §1.1; and `s_fin(a, σ)` has the form (iv) of the sum `ℛ(a, σ, κ)` of that
section, the place `−νσ` playing the part of `par_σ(Frob_ν)`. No section here uses these identifications.

*Needs:* 0.1, 2.1, 3.2; DivisibilityOfThetaDerivatives §2.1 (the set `I_p` and the number `v(π_p)` at a prime).

[ShortProof], `New/Reduction/Data/AdmissibleData` (`New.Data.primeSum`, `New.Data.jetSize`, `New.Data.directionAmount`,
`New.Data.errorUnit`); `New/Reduction/PrimeSums` (`New.Data.mainAmount`, `New.Data.mainPrimeSum`,
`New.Data.totalRemainder`); `New/UpperBound/Size/ShortColumns` (`New.Data.localPrimeSum`,
`New.Data.localPrimeSumTotal`)

### 4.2 The total remainder and the sizes of the prime sums

*Origin:* particular to this proof: the sum over the `a`-places of the prime sums at the order `a`, less the expected
value, written through the remainders `R_{q₀}` and `R₁` at the two lengths `x` and `x₁`; with the sizes of the prime
sums and of the main amount.

*Method of the formal proof:* the weight is `a/x₁` except on `Φ_b`, where it is `a/x`; so each term splits into a term
of length `x₁` at every place and, when `−ντ ∈ Φ_b`, a correction. If `−ντ ∈ Φ_b` (class `−1` modulo `q₀`), then `τ`
is an `a`-place exactly when `ν ≡ 1 (mod q₀)`; so as `τ` runs over `Φ_a` the correction occurs `#Φ_b` times if
`ν ≡ 1 (mod q₀)` and never otherwise. The sums over `ν` are then the sums of 0.1 (b) at `q = 1` and `q = q₀`. The main
terms `log x`, `log x₁`, `c₁` cancel against `#Φ_a·s_main`, by `Σ_τ log κ(τ) = f(log a − log x₁) − #Φ_b(log x − log x₁)`
and `f = φ(q₀)#Φ_a`. For the sizes: only `ν ≤ x₁` contribute to `s_fin(y, σ)` for `y ≤ a`, because `κ ≥ a/x₁`, and
`Σ_{ν≤Y} Λ(ν)/ν ≤ 2 log Y` for integers `Y ≥ 1`; `log j! ≤ 2j log b` for `j ≤ a ≤ b²`.

Let `D` be admissible data, and `R_q = R_q^{(d)}` for its prime `d`.

- (a) `#Φ_a = T` and `f = φ(q₀)·#Φ_a`.
- (b) `rem = a(#Φ_b·(R_{q₀}(x) − R_{q₀}(x₁)) + #Φ_a·R₁(x₁))`.
- (c) For `0 ≤ y ≤ a` and every `σ`: `0 ≤ s_fin(y, σ) ≤ 4y log x₁ ≤ y log b`.
- (d) For integers `0 ≤ j ≤ a`: `20j log b ≤ s_∞(j) ≤ 25j log b`; hence
  `κ(σ) log b ≤ s_∞(κ(σ)) − s_fin(κ(σ), σ) ≤ 25κ(σ) log b`.
- (e) `b·#Φ_a ≤ h_dir ≤ 25 f b log b`.
- (f) `x⁴·f·a ≤ h_main`; in particular `h_main ≥ 0`.

*Needs:* 0.1, 2.3, 3.2, 3.3, 4.1.

[ShortProof], `New/Reduction/PrimeSums` (`New.Data.card_aPlaces`, `New.Data.f_eq_card_aPlaces_mul`,
`New.Data.mem_aPlaces_iff_of_mul_mem_bPlaces`, `New.Data.card_filter_mem_bPlaces`, `New.Data.sum_aPlaces_primeSum`,
`New.Data.sum_log_weight`, `New.Data.card_aPlaces_mul_mainPrimeSum`, `New.Data.totalRemainder_eq`,
`New.Data.primeSum_le`, `New.Data.primeSum_mem_Icc`, `New.Data.jetSize_mem_Icc`,
`New.Data.jetSize_sub_primeSum_mem_Icc`, `New.Data.directionAmount_mem_Icc`, `New.Data.le_mainAmount`,
`New.Data.mainAmount_nonneg`)

## Layer 5: the target lattice and Theorems A and B

The target forms `𝒯` have no integral structure of their own; a target form is integral at `ι` when its chains of lifts
are, for every `m`-fold twist of modulus prime to `ℓ(ι)` (5.1). The source is the space `𝒮_ram` of ramified source
forms, carried to the target by the translates `s𝔭` of one normalised Poincaré map (5.2). Theorem A bounds the lifts of
the images of short integral forms from above and their index; Theorem B says that few translates span almost all of
the target; Theorem C bounds from below the covolume plus twice the index of every family that spans almost all of the
target. The objects of this layer are those of the sections named in the table of symbols.

Theorem C is DeterminantsOfThetaLiftChains §6.3, which states and proves it for the target lattice of 5.1; the letter
`d` of that section is `d_T`. It is not a section of this roadmap: 6.1 takes it from there.

### 5.1 The target lattice

*Origin:* definitions and conventions.

*Method of the formal proof:* the twisted lattice is assembled from the chains of lifts; the integrality of inner
products and the identity of the conjugate norms use that the level `J_m(ξ)` is small enough that every stabiliser
`Γ ∩ gJ_m(ξ)g^{−1}` of a class is trivial.

Let `D` be admissible data. The *target lattice* is the twisted lattice (1.3) on `V = 𝒯`, the target forms with the
Petersson inner product, whose twists are the `m`-fold twists (3.4), with:

- `S_ξ` the space of algebraic forms on `Y_m` of the weight of the chains, of level `J_m(ξ)` (trivial at the chosen
  places, block upper triangular at the places of `Q(ξ)`) and of the character formed by the tame characters of the
  lifts, with the class-sum inner product of AdelicUnitaryGroupsAndAlgebraicModularForms §6.6 (f),
  `⟨φ, φ′⟩ = Σ_c ⟨φ(g_c), φ′(g_c)⟩`, the sum over representatives `g_c` of the classes `c ∈ Γ\G_f/J_m(ξ)` of the Gram
  pairings of the values in the Weyl module, `G_f` the finite adelic points of `U(Y_m)` and `Γ` its rational points (the
  stabilisers `Γ ∩ g_cJ_m(ξ)g_c^{−1}` are trivial); for `ξ = 1` this is the form `coord(φ)^* G coord(φ′)` below; and
  `Θ_ξ` the chain of `m` lifts with twist `ξ`;
- `ξ` allowed at `ℓ` when `ℓ` is prime to `Nm Q(ξ)`;
- `Λ_{ξ,ι}` the forms integral at the embedding `ℂ → ℂ_ℓ` given by `ι`, `ℂ_ℓ` the completion of `ℚ̄_ℓ`;
- `coord` the values of a form of `S_1` at representatives of the classes, in the coordinates of the Weyl module dual
  to the basis of products of minors of [ShortProof] (which differs from the semistandard basis by an invertible
  integer matrix), and
  `G` the rational Gram matrix of the invariant Hermitian form on it.

Facts: (a) these data form a twisted lattice; (b) `y ∈ 𝒯` is integral at `ι` exactly when `Θ_ξy` is integral at `ι` for
every `m`-fold twist `ξ` with `Nm Q(ξ)` prime to `ℓ(ι)`; (c) `‖y‖²_σ = ‖Θ₁y‖²_σ`, the sum over the classes of the squared
Gram norms of the conjugates by `σ` of the values of `Θ₁y`; (d) `Z(ξ) = det(Θ_ξ^*Θ_ξ)`, the determinant of the chain;
(e) every `Θ_ξ` is injective on `𝒯`.

*Needs:* 1.3, 3.4; ThetaLiftChainsAndTheSeesawIdentity §§1.1, 2.7, 2.10, 2.15 (from §2.7 the target forms; from §2.15
the chain `Θ_ξ` of `m` lifts on the target forms, there the lower chain, with its level `J_m(ξ)` and character on
`Y_m`; from §2.10 trivial stabilisers at levels inside the chosen level; from §1.1 the gauge of a vector of a Weyl
module at an embedding `ℂ → ℂ_ℓ`, through which integrality of an algebraic form is read);
DeterminantsOfThetaLiftChains §4.3 (the chain `Θ_ξ` is injective on the target forms);
AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 6.6 (algebraic forms of a given level on a definite unitary group,
with the finite adelic points `G_f`, the rational points and the levels of §3.1; from §6.6 (f) the class-sum product
`⟨φ, φ′⟩` on them and, with no condition on the stabilisers, that `n` times the class-sum product of a form integral at
`ῑ` and a form integral at `ι` is integral at `ι`, `n` a common multiple of the orders of the stabilisers of the
classes); IntegralRepresentationsOfGeneralLinearGroups §2.1 (b) (the Gram matrix of the basis of products of minors of
the Weyl module, an integer matrix, is positive definite); ShortGRH background (for algebraic forms of a level at which
every stabiliser of a class is trivial, with `coord(φ)` the values of `φ` at representatives of the classes in the
coordinates of the Weyl module dual to a basis of products of minors, and `G` the rational matrix with one copy, for
each class, of the Gram matrix in that basis, which is positive definite: the class-sum product `⟨φ, φ′⟩` is
`coord(φ)^* G coord(φ′)` and the conjugate norm `‖φ‖²_σ` is `(σ coord(φ))^* G (σ coord(φ))`; [ShortProof]
`Lib/Adelic/AutomorphicForms/PAdicGauge.lean` (`New.LevelPlaces.LevelForm.valueCoord`,
`New.LevelPlaces.LevelForm.valueMetric`, `New.LevelPlaces.LevelForm.posDef_valueMetric`,
`New.LevelPlaces.LevelForm.inner_eq_valueCoord`, `New.LevelPlaces.LevelForm.normSqAt_eq_re_valueCoord`)).

[ShortProof], `New/Reduction/IntegralTargetForms` (`New.Data.targetLattice`,
`New.Data.mem_integralVectors_targetLattice`, `New.Data.normSqAt_targetLattice`, `New.Data.volume_targetLattice`,
`New.Data.injective_lift_targetLattice`, `New.Data.classAut_lastResidueLevel_eq_bot`)

### 5.2 The normalised Poincaré maps

*Origin:* definitions and conventions.

*Method of the formal proof:* the numbers `err_ℓ` and `c_ss` are chosen from the theorems that give them; (a)–(c) are
read off the definitions, with `#S ≤ ⌈x₁⌉`, `log ℓ ≤ x₁` on `S` and `⌈x₁⌉x₁ + log N ≤ b` from 3.3, and `g_ℓ ≥
gain_ℓ − err_ℓ − 1`; (d) uses that `e₀` is central in the group algebra of `Ḡ`.

Let `D` be admissible data. Let `S` be the set of primes `ℓ < x₁` with `χ_K(ℓ) ≠ 1`.

- `gain_ℓ` is the divisibility asked of the chain at `ℓ` (CompositeThetaLiftsAndShortForms §2.1 (c), there `gain(p)`):
  `gain_ℓ = m(Σ_{τ∈Φ_a} s_ℓ(a, τ) + k·S_ℓ)`, with the local prime sums `s_ℓ` and their total `S_ℓ` of 4.1. It vanishes
  when `χ_K(ℓ) = 1` or `ℓ ≥ x₁`.
- Fix numbers `err_ℓ ≥ 0` as given by the divisibility of the composite lift (CompositeThetaLiftsAndShortForms §4.9,
  there `err(p)`): `err_ℓ = 0` unless `ℓ = N` or `ℓ ∈ S`, `Σ_{ℓ∈U} err_ℓ log ℓ ≤ u_E` for every finite set `U`, and the
  local statement §4.9 (d), used in 5.3 (b).
- `g_ℓ = ⌊gain_ℓ − err_ℓ⌋ ∈ ℤ` and `c_B = ∏_{ℓ∈S∪{N}} ℓ^{−g_ℓ} ∈ ℚ_{>0}`.
- The Poincaré map of the data is `𝒫 = 𝒫_{g,t}` (ThetaLiftChainsAndTheSeesawIdentity §2.19) for the archimedean point
  `g` of `U(Y₀)` and the linear form `t` fixed in SecondMomentsOfPoincareSeries §5.3 (b), for which `𝒫` is a Poincaré
  series of the Bessel function.
- Fix `c_ss ∈ ℂ^×` as given by the seesaw identity (ThetaLiftChainsAndTheSeesawIdentity §3.20) for this `t` and this
  `g`: for every twist `ξ` there is a chain datum `Ψ` of `ξ` with `ι_ξ(𝒫φ) = c_ss·B_ξ(Ψ)φ` for every `φ ∈ 𝒮_ram`, where
  `ι_ξ = Θ_ξ` is the chain of lifts from `Y₀` to `Y_m` and `B_ξ(Ψ)` the composite lift (§2.12 there). The constant of
  §3.20 depends on `(g, t)`; `c_ss` is the one for the pair just fixed.
- For `s ∈ Ḡ`, `s𝔭 : 𝒮_ram → 𝒯`, `s𝔭(φ) = c_B·c_ss^{−1}·#Ḡ·e₀ρ(s)𝒫(φ)`.
- `𝒮_int` is the set of `φ ∈ 𝒮_ram` that are integral at every pair `ι`.

Facts: (a) `|c_B|_ℓ = ℓ^{g_ℓ}` for every prime `ℓ`, and `g_ℓ = 0` for primes outside `S ∪ {N}`; (b)
`Σ_{ℓ∈S∪{N}} log ℓ ≤ b`; (c) `log c_B ≤ −Σ_{ℓ∈S} gain_ℓ log ℓ + u_E + b`; (d) `s𝔭 = ρ(s) ∘ 𝔭` with `𝔭 = 1𝔭`, the map
at the identity of `Ḡ`, and the image of `s𝔭` is `#Ḡ·e₀ρ(s)𝒫(𝒮_ram)`.

*Needs:* 3.2, 3.3, 4.1; ThetaLiftChainsAndTheSeesawIdentity §2.8 (the source forms and the ramified ones), §2.7 (the
target forms and the action `ρ`), §2.5 (`Ḡ` and `e₀`), §2.19 (the Poincaré map `𝒫_{g,t}`), §3.20 (the seesaw identity
with its constant); SecondMomentsOfPoincareSeries §5.3 (the point `g` and the form `t` of the data);
CompositeThetaLiftsAndShortForms §2.1 (the gains `gain_ℓ`), §2.4 (integral source forms), §4.9 (the divisibility of the
composite lift with its numbers `err_ℓ`).

[ShortProof], `New/Reduction/ShortAndEnough` (`New.Data.divisibilityError`, `New.Data.gainExponent`,
`New.Data.invGainFactor`, `New.Data.seesawConst`, `New.Data.projectedPoincare`, `New.Data.normalizedPoincare`,
`New.Data.integralRamified`, `New.Data.norm_invGainFactor`, `New.Data.sum_log_smallNonsplitPrimes_union_le`,
`New.Data.log_invGainFactor_le`, `New.Data.coe_normalizedPoincare`, `New.Data.range_normalizedPoincare`)

### 5.3 Theorem A: short forms of small index

*Origin:* particular to this proof: a spanning set of integral source forms whose images under the translates of the
normalised Poincaré map have chains of lifts bounded at every conjugate by the main amount less `m·rem`, and an index
bound for families of such images.

*Method of the formal proof:* (a) the short source forms span `𝒮_ram`; for such `φ` the seesaw identity writes
`ι_1(c_ss^{−1}𝒫φ)` as a composite lift, whose values have squared norm at most
`exp(u_E + h_main − m·rem + 2Σ_{ℓ∈S} gain_ℓ log ℓ + u_E)` at every conjugate; passing to `#Ḡ·e₀ρ(s)` adds `x^{99}`;
the factor `c_B` adds `2 log c_B`, and 5.2 (c) cancels the gains; `x^{99} + 4u_E + 2b ≤ f·a·(log b)⁴`. (b) At a pair
`ι` over `ℓ`, the local statement of the divisibility gives an `𝒪_ι`-module of colength dividing `ℓ^j`,
`j ≤ err_ℓ·dim 𝒮`, in the integral ramified forms, on which every composite lift of a twist of modulus prime to `ℓ` has
valuation at least `gain_ℓ − err_ℓ`; as `v_ι(c_B) = −g_ℓ`, its images are integral vectors of the target lattice. With
`dim 𝒮 ≤ 2 dim 𝒮_ram` and `Σ err_ℓ log ℓ ≤ u_E`, 1.3 (c) bounds the index for one translate and 1.3 (d) for `t`.

Let `D` be admissible data.

- (a) `𝒮_ram` is spanned over `ℂ` by the `φ ∈ 𝒮_int` such that `‖Θ₁(s𝔭φ)‖²_σ ≤ exp(h_main − m·rem + f·a·(log b)⁴)` for
  every `s ∈ Ḡ` and every `σ ∈ Aut(ℂ)`.
- (b) For a finite set `t ⊂ Ḡ`, every finite family `y_1, …, y_n` of target forms with `y_i ∈ s𝔭(𝒮_int)` for some
  `s ∈ t` has index at most `#t·dim 𝒮_ram·2u_E` in the target lattice.

*Needs:* 1.1, 1.3, 3.3, 4.1, 4.2, 5.1, 5.2; CompositeThetaLiftsAndShortForms §§2.11, 4.9, 5.4, 5.5, 5.7 (from §5.7
the short source forms span `𝒮_ram`; from §5.4 the size of the composite lift on short forms; from §5.5 the size and
integrality of `#Ḡ·e₀ρ(s)` applied to a form; from §4.9 the local divisibility of the composite lift; from §2.11
`dim 𝒮_ram ≥ (1 − f/(N − 1)) dim 𝒮`); ThetaLiftChainsAndTheSeesawIdentity §3.20 (the seesaw identity).

[ShortProof], `New/Reduction/ShortAndEnough` (`New.Data.span_short_integralRamified_eq_top`,
`New.Data.indexLe_normalizedPoincare`, `New.Data.normalizedPoincare_mem_integralVectors`,
`New.Data.indexLe_of_mem_image_normalizedPoincare`, `New.Data.finrank_sourceForm_le_two_mul`)

### 5.4 Theorem B: enough forms

*Origin:* particular to this proof: few translates of the image of the ramified source forms span all of the target but
a share `4/b²`, with an explicit count.

*Method of the formal proof:* the second moment of the translates of the Poincaré series shows that the maps
`#Ḡ·e₀ρ(s)𝒫`, `s ∈ Ḡ`, spread with error `3/(16b²) = 3ε/2` for `ε = (8b²)^{−1}` (SecondMomentsOfPoincareSeries §5.7 (d));
the greedy choice of SecondMomentsOfPoincareSeries §1.3 (a) at this `ε` gives a
set `t` with `#t·dim 𝒮 ≤ (5/2)(1 + log(1/(16ε)))d_T ≤ 5d_T log(1 + 2b²)` whose images of all source forms span at least
`(1 − 2/b²)d_T`; passing to `𝒮_ram` loses at most `#t(dim 𝒮 − dim 𝒮_ram) ≤ #t·b^{−8}dim 𝒮 ≤ (2/b²)d_T`
(SecondMomentsOfPoincareSeries §1.3 (b)).

Let `D` be admissible data. Then `d_T > 0`, and there is a finite set `t ⊂ Ḡ` with
`#t·dim 𝒮_ram ≤ 5d_T log(1 + 2b²)` and `dim Σ_{s∈t} s𝔭(𝒮_ram) ≥ (1 − 4/b²)d_T`.

*Needs:* 3.3, 5.2; SecondMomentsOfPoincareSeries §§1.3, 5.7 (from §5.7: the maps `#Ḡ·e₀ρ(s)𝒫` from the source forms to the
target forms spread with error `3/(16b²)`, and `d_T > 0`; from §1.3: for `0 < ε < 1/16` and a family that spreads
with error `3ε/2`, a set `t` with `#t·dim V ≤ (5/2)(1 + log(1/(16ε)))·dim W` whose images span at least
`(1 − 16ε)·dim W`, and the loss on a subspace);
CompositeThetaLiftsAndShortForms §2.11 (`dim 𝒮_ram ≥ (1 − f/(N − 1)) dim 𝒮` and `f/(N − 1) ≤ b^{−8}`).

[ShortProof], `New/Reduction/ShortAndEnough` (`New.Data.enough_forms`,
`New.Data.exists_le_finrank_iSup_range_normalizedPoincare`, `New.Data.five_halves_mul_one_add_log_le`)

## Layer 6: the main inequality and the one-sided bound

### 6.1 The main inequality

*Origin:* particular to this proof: the comparison of the upper and the lower bound for the covolume of one family of
images, in which the main amount cancels and an upper bound for the total remainder is left.

*Method of the formal proof:* take `t` from Theorem B and, among the forms `s𝔭φ` with `s ∈ t` and `φ` short of Theorem
A (a), a basis `y_1, …, y_n` of their span, so `n ≥ (1 − 4/b²)d_T`. By Hadamard (1.3 (e)) its covolume is at most
`n(h_main − m·rem + f·a·(log b)⁴)`; by Theorem A (b) and the count of Theorem B its index is at most
`d_T·10 log(1 + 2b²)·u_E`. Theorem C (DeterminantsOfThetaLiftChains §6.3) bounds `c + 2δ` from below; as `h_main + f·a·(log b)⁴ ≥ 0` and `n ≤ d_T`, the terms
`d_T·h_main` cancel and `n·m·rem ≤ d_T·err` with `err = 4f·a·(log b)⁴ + 20 log(1 + 2b²)u_E`. Dividing by
`n ≥ d_T/2` and `2|err| ≤ f·a·(log b)⁵` gives the inequality.

For all admissible data: `m·rem ≤ f·a·(log b)⁵`.

*Needs:* 1.3, 3.3, 4.2, 5.1, 5.3, 5.4; DeterminantsOfThetaLiftChains §6.3 (Theorem C: for linearly independent target
forms `y_1, …, y_n` with `n ≥ (1 − 4/b²)d_T`, of index at most `δ` and covolume at most `c` in the target lattice,
`d_T(h_main − 3f·a·(log b)⁴) ≤ c + 2δ`).

[ShortProof], `New/Reduction/MainInequality` (`New.star_inequality`)

### 6.2 The one-sided bound

*Origin:* particular to this proof: an upper bound for `R_{q₀}` at every large point, with the exponent `−1/2 + ε`,
from the main inequality at the data of that point and the prime number theorem at the second cut-off.

*Method of the formal proof:* (a) by 4.2 (b), `R_{q₀}(x) = rem/(a·#Φ_b) + R_{q₀}(x₁) − (#Φ_a/#Φ_b)R₁(x₁)`; 6.1 gives
`rem ≤ f·a·(log b)⁵/m`, and `f = φ(q₀)#Φ_a`, `#Φ_a ≤ #Φ_b log b`. (b) takes the data of 3.7 at `x`, with
`log b ≤ 2x^ε`, `m ≥ √x` and `log x₁ ≥ x^{ε/12}`; the prime number theorem for `R_q`, `|R_q(y)| ≤ (log y)^{−B}` for all
large `y`, at `q = q₀` and `q = 1` with `B ≥ 24/ε`, gives `|R_{q₀}(x₁)|, |R₁(x₁)| ≤ x^{−2}`, and the three terms add up
to at most `(64φ(q₀) + 3)x^{−1/2+6ε}`. [ShortProof] proves that prime number theorem by a Tauberian theorem for the
transform of `v ↦ R_q(e^v)` with the zero-free regions of the finitely many L-functions; it follows from the
Siegel–Walfisz theorem at the moduli `q` and `qd` by orthogonality and partial summation, the constant being `c_q` by the
Dirichlet series of `λ_q` (0.2). (c) passes from integers to real `y` by 0.1 (c), `R(y) − R(⌊y⌋) ≤ 26/y` for `y ≥ 2`,
and `⌊y⌋^u ≤ 2y^u` for `−1 ≤ u ≤ 0`, applying (b) with `min(1/200, ε/7)` in place of `ε`.

Let `P = (q₀, d)` be parameters and `R_q = R_q^{(d)}`.

- (a) For admissible data: `R_{q₀}(x) ≤ φ(q₀)(log b)⁶/m + |R_{q₀}(x₁)| + log b·|R₁(x₁)|`.
- (b) For `0 < ε < 1/100` and every large integer `x`: `R_{q₀}(x) ≤ (64φ(q₀) + 3)x^{−1/2+6ε}`.
- (c) For every `ε > 0` and all large real `y`: `R_{q₀}(y) ≤ y^{−1/2+ε}`.

*Needs:* 0.1, 2.1, 3.3, 3.7, 4.2, 6.1; AnalyticNumberTheoryPartI §0.32 (the Siegel–Walfisz theorem);
RieszSumsOverPrimesAndExceptionalZeros §1.4i (the prime number theorem for the Riesz remainder of a character);
RiemannHypothesisStatementsAndConsequences §8.4a (the transform of a Riesz sum, for the value of the constant).

[ShortProof], `New/Reduction/OneSidedBound` (`New.Data.primeRemainder_le`, `New.eventually_exists_data_scales`,
`New.eventually_abs_primeRemainder_exp_le`, `New.eventually_primeRemainder_natCast_le`,
`New.primeRemainder_sub_primeRemainder_floor_le`, `New.eventually_primeRemainder_le_rpow`);
`New/Reduction/Zeros/PrimeNumberTheorem` (`New.eventually_abs_primeRemainder_le`, `New.tendsto_primeRemainder`)

### 6.3 The half-plane and the critical line

*Origin:* particular to this proof: the passage from the one-sided bounds for the moduli `18480N` and the primes
`d ≡ 9240N − 1 (mod 18480N)` to the non-vanishing of every Dirichlet L-function in `Re s > 1/2`, through the
character induced at the modulus `18480N`.

*Method of the formal proof:* choose `β` with `1/2 < β < Re s`; every prime `d ≡ d₀ (mod q₀)` gives parameters
`(q₀, d)`, so the hypothesis with `ε = β − 1/2` is the hypothesis of 0.2 for `q₀`, `d₀`, `β` (`8 | q₀`, `d₀ ≡ 7 (mod 8)`,
`d₀` prime to `q₀ = 2(d₀ + 1)`). Then 0.2 gives `L(s, χ′) ≠ 0` for the character `χ′` modulo `q₀` induced by `χ`, and
`L(s, χ′) = L(s, χ)∏_{p|q₀}(1 − χ(p)p^{−s})`.

Let `N ≥ 1`, `χ` a Dirichlet character modulo `N`, and `s ∈ ℂ` with `Re s > 1/2` and `s ≠ 1`. Put `q₀ = 18480N` and
`d₀ = 9240N − 1`. If for every prime `d ≡ d₀ (mod q₀)` and every `ε > 0` one has `R_{q₀}^{(d)}(y) ≤ y^{−1/2+ε}` for all
large `y`, then `L(s, χ) ≠ 0`.

By 6.2 (c) the hypothesis holds for every `N`: every prime `d ≡ 9240N − 1 (mod 18480N)` gives parameters
`(18480N, d)` (2.1 (a)). So, unconditionally: for every `N ≥ 1`, every Dirichlet character `χ` modulo `N` and every `s`
with `Re s > 1/2`, if `χ ≠ 1` or `s ≠ 1` then `L(s, χ) ≠ 0` (at `s = 1` with `χ ≠ 1` by Mathlib's non-vanishing on
`Re s ≥ 1`). This is the value form `LFunction_ne_zero_of_one_half_lt_re` of
GeneralizedRiemannHypothesisFromWindowBounds §5.3, proved here by this roadmap's route. The other forms of the theorem
are the targets of 6.4.

*Needs:* 0.2, 2.1, 6.2; Mathlib `DirichletCharacter.LFunction_changeLevel`,
`DirichletCharacter.LFunction_ne_zero_of_one_le_re`.

[ShortProof], `New/Reduction/OneSidedBound` (`New.grh`)

### 6.4 The Riemann hypothesis and the forms on the critical line

*Origin:* published: the classical passage from the non-vanishing of `L(s, χ)` in `Re s > 1/2` to the critical line,
by the functional equation. The statements are the end theorems of the family; they are those of GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3, reached here from
6.3, without the window bounds of that roadmap.

*Method of the formal proof:* the statements on the critical line reflect a zero `s` to `1 − s` and apply 6.3 at both
points, which gives `Re s ≤ 1/2` and `1 − Re s ≤ 1/2`. For `L(·, χ)` in `0 < Re s < 1` the reflection is the
functional equation, which applies there because the gamma factor has no pole in `Re s > 0`; it carries the zero to
`L(1 − s, χ⁻¹) = 0`. For `ζ`, with `s` neither `1` nor one of `−2, −4, …`, the reflection goes through the completed
zeta function, which vanishes at `s` and is invariant under `s ↦ 1 − s`; 6.3 applies to `ζ` as the L-function of the
trivial character modulo `1`. Here the roadmap takes these passages from RiemannHypothesisStatementsAndConsequences
§§9.3, 9.4, which state them as equivalences.

The statements (a)–(d) are those of GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3, which owns them and
declares them in its `Suggested.lean`. The target of this section is their proof by the route of this family, from
6.3.

- (a) *Predicate form.* For every `N` with `NeZero N` and every `χ : DirichletCharacter ℂ N`,
  `χ.GeneralizedRiemannHypothesis`, that is `ZeroFreeRightOf (1/2) χ.LFunction`: the order of `χ.LFunction` at every `s`
  with `Re s > 1/2` is at most `0`. It follows from 6.3 by the value form
  `generalizedRiemannHypothesis_iff_LFunction_ne_zero` of RiemannHypothesisStatementsAndConsequences §9.4.
- (b) *Strip form.* For every `N ≥ 1`, every Dirichlet character `χ` modulo `N`, primitive or not, and every `s` with
  `0 < Re s < 1` and `L(s, χ) = 0`: `Re s = 1/2`. It follows from (a) by the strip form
  `generalizedRiemannHypothesis_iff_re_eq_half` of RiemannHypothesisStatementsAndConsequences §9.4. The case of
  primitive `χ` is the fifth theorem of [ShortProof].
- (c) *The Riemann zeta function.* `riemannZeta s ≠ 0` for every `s` with `Re s > 1/2`; and every `s` with
  `riemannZeta s = 0` that is not `1` and not one of `−2, −4, −6, …` has `Re s = 1/2`. The first is 6.3 at `N = 1`
  (`DirichletCharacter.LFunction_modOne_eq`; at `s = 1` Mathlib's value of `riemannZeta` is not `0`).
- (d) *The Riemann hypothesis.* Mathlib's `RiemannHypothesis` holds. It follows from the first part of (c) by
  `riemannHypothesis_iff_riemannZeta_ne_zero` of RiemannHypothesisStatementsAndConsequences §9.3; the second part of
  (c) is `RiemannHypothesis` written out.

So the route of this family reaches the theorems of GeneralizedRiemannHypothesisFromWindowBounds §5.1 (which is (a)),
§5.2 (which is (d)) and §5.3 (6.3, (b) and (c)); the further forms and consequences that roadmap and
RiemannHypothesisStatementsAndConsequences draw from them (completed L-functions, Dedekind zeta functions, the
predicates of other areas) follow from (a) and (d) as stated there and are not restated here.

**Checks.** The principal character modulo `2` has `L(s) = (1 − 2^{−s})ζ(s)`, with zeros `2πik/log 2` on `Re s = 0`:
(b) excludes them through `0 < Re s`, and a form with `0 ≤ Re s` would be false. `ζ(−2) = 0` with `Re(−2) < 0`: (c)
does not constrain the trivial zeros.

*Needs:* 6.3; RiemannHypothesisStatementsAndConsequences §§9.3, 9.4; Mathlib `RiemannHypothesis`,
`DirichletCharacter.LFunction_modOne_eq`, `riemannZeta_one_ne_zero`.

[ShortProof], `New/Main` (`New.zeros_on_line`, `New.zeta_zeros_on_line`); `Main` (`riemannHypothesis`); the five
statements are in `Statements`

## Downstream consumers

- The other roadmaps of `ShortGRH` (DivisibilityOfThetaDerivatives, ThetaLiftChainsAndTheSeesawIdentity,
  CompositeThetaLiftsAndShortForms, SecondMomentsOfPoincareSeries, RemainingAndMainTermsOfSecondMoments,
  DeterminantsOfThetaLiftChains, CongruencesOfTwistedThetaLifts, SelmerBoundsForAnticyclotomicTwists,
  NormsOfThetaLiftsAndExchangeIdentities and PairsOfFramesAtOnePlace) take the set-up of Layers 1–4: the parameters,
  the field `E` and its places, the admissible data with their sizes, the twists and the characters of the lifts, the
  prime sums, colengths (1.1), heights (1.2) and twisted lattices (1.3, 1.4).
- CompositeThetaLiftsAndShortForms §§4.9, 5.4, 5.5, 5.7 and SecondMomentsOfPoincareSeries §5.7
  prove the inputs of Theorems A and B (5.3, 5.4); DeterminantsOfThetaLiftChains §6.3 is Theorem C. 6.1 consumes the
  three.
- GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 state the theorems that 6.3 and 6.4 reach, and draw their
  further forms and consequences.

## Scope and ownership

### Owned here

- the remainders `R_q` and the one-sided criterion (Layer 0);
- colength bounds, heights of families over all pairs, twisted lattices with index and covolume, and the lower bound by
  a twist for each prime (Layer 1);
- the parameters, the field `E` with its group of places, the admissible data, their sizes, the row parameter, twists
  and the characters of the lifts, and the existence of admissible data (Layers 2 and 3);
- the prime sums, the local prime sums `s_p` with their total `S_p`, the main amount, the total remainder and its
  expression through `R_{q₀}` and `R₁` (Layer 4);
- the target lattice, the normalised Poincaré maps, and Theorems A and B (Layer 5);
- the main inequality, the one-sided bound, the passage to all Dirichlet characters, and the derivation of the end
  theorems from 6.3 by this route (Layer 6).

### Not owned here

- the objects of Layer 5 (spaces, source and target forms, chains of lifts, the Poincaré map, the seesaw identity):
  ThetaLiftChainsAndTheSeesawIdentity;
- the proofs of the inputs of Theorems A and B: CompositeThetaLiftsAndShortForms; SecondMomentsOfPoincareSeries with
  RemainingAndMainTermsOfSecondMoments and PairsOfFramesAtOnePlace;
- Theorem C and its proof: DeterminantsOfThetaLiftChains §6.3, with NormsOfThetaLiftsAndExchangeIdentities,
  CongruencesOfTwistedThetaLifts and SelmerBoundsForAnticyclotomicTwists;
- the field arithmetic of `E` beyond 2.3 (its integers, its different, the chosen places and their characters):
  DivisibilityOfThetaDerivatives §§1.1–1.7;
- the statements of the end theorems in their value, predicate and strip forms, with Mathlib's `RiemannHypothesis`:
  GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 (6.3 and 6.4 prove them by this route);
- the transform of a Riesz sum (RiemannHypothesisStatementsAndConsequences §8.4a), Landau's theorem
  (PositivityOfDirichletSeriesWithKernels §6.4), the Siegel–Walfisz theorem (AnalyticNumberTheoryPartI §0.32), and the
  equivalences between the forms of the hypothesis, which 6.4 uses (RiemannHypothesisStatementsAndConsequences
  §§9.3, 9.4).

## References

- [ShortProof] The shorter Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions, a rewriting by the same method of the formal proof that the family RiemannHypothesisForDirichletLFunctions
  states: the folder `grh` of github.com/lsernau/grh-lean at commit `72fead1`; paths are relative to its directory
  `src/`. It is the reference of every target whose origin is particular to this proof.
- E. Landau, *Über einen Satz von Tschebyschef*, Math. Ann. 61 (1905), 527–550: Landau's theorem on Laplace and Mellin
  transforms of functions bounded on one side (0.2, through PositivityOfDirichletSeriesWithKernels §6.4).
- F. A. Behrend, *On sets of integers which contain no three terms in arithmetical progression*, Proc. Nat. Acad. Sci.
  USA 32 (1946), 331–332; Shapira, *Behrend-type constructions for sets of linear equations*, Acta Arith. (2006);
  Alon and Shapira, *A characterization of easily testable induced subgraphs* (2006), Lemma 4.1 (preprint
  numbering): 3.5.
- L. C. Washington, *Introduction to Cyclotomic Fields*, second edition, Springer (1997), Chapter 2: 2.3.
