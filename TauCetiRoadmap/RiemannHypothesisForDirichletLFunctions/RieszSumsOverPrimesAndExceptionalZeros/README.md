# Roadmap: Riesz sums over primes and exceptional zeros

**Summary.** The distribution of primes in arithmetic progressions, and of prime ideals in ray classes, is governed by the zeros of Dirichlet and Hecke `L`-functions near the point `1`. This roadmap states the classical theorems of that subject in their published form, in which the possible exceptional real zero of a real character is kept as an explicit term rather than excluded: the logarithmic derivative `L′/L` near the line one, smoothed prime sums controlled by a box free of zeros, the prime number theorem for a character with its exceptional term, the Riesz remainder of a character, the Deuring–Heilbronn repulsion and Linnik's theorem, and prime ideals of a ray class in short intervals, uniformly in the field and the modulus. Throughout, `χ` is a Dirichlet character, `L(s, χ)` its `L`-function and `Λ` the von Mangoldt function.

The headline theorems are these. (1) The Riesz remainder `G_χ(y) = Σ_{n≤y} Λ(n)χ(n)(y/n − 1) + y(L′/L)(1, χ)` of a primitive nonprincipal character `χ` of conductor `f_χ` satisfies `|G_χ(y) − y^β/(β(1 − β))| ≤ C y (log 3f_χ)^5 exp(−c log y/(√(log y) + log f_χ))` for every `y ≥ 2`, with absolute `C, c`, the term present only if `χ` is real and `L(s, χ)` has an exceptional zero `β`. With the uniform exclusion of Landau–Siegel zeros the term can be dropped: `|G_χ(y)| ≤ C y (log 3f_χ)^5 exp(−c log y/(√(log y) + log f_χ))` for every such `χ` and every `y ≥ 2`, and the remainder `G_1(y) = Σ_{n≤y} Λ(n)(y/n − 1) − y log y + (1 + γ)y` of the trivial character satisfies `|G_1(y)| ≤ C y exp(−c√(log y))`. Consequently, for every `α ∈ [1/2, 1)` and `c_ex ∈ (0, 1/2]` there is `y₀(α, c_ex)` such that, if `E/ℚ` is a finite abelian extension of conductor `f_E` and every exceptional zero `β` of the `L`-functions of the primitive characters `χ*` attached to its characters has `1 − β ≥ c_ex`, then `|G_{χ*}(y)| ≤ y exp(−c₁(log y)^(1−α))` for all these characters and all `y ≥ y₀(α, c_ex)` with `log f_E ≤ (log y)^α`, where `c₁` is absolute. (2) Linnik's theorem: there is an absolute `L` such that the least prime `p ≡ a (mod q)` is at most `q^L` for every `q ≥ 3` and every `a` coprime to `q`. It follows from the prime number theorem in progressions with relative error in Linnik's range `x ≥ q^L`, which rests on the Deuring–Heilbronn repulsion: let `q ≥ 3`, let `χ₁` be a real nonprincipal character modulo `q` and `β₁ ∈ [1/2, 1)` a zero of `L(s, χ₁)`; every zero `β + iγ` with `β ≥ 1/2` of every `L(s, χ)`, `χ` modulo `q`, satisfies `1 − β ≥ c log(c/((1 − β₁)ℒ))/ℒ` for every `ℒ ≥ log(q(|γ| + 2))`, with an absolute effective `c`, except the zero `β₁` of `L(s, χ₁)` itself when it is simple. (3) There are absolute `c, c′, X₀ > 0` such that for every imaginary quadratic field `K`, every integer `M ≥ 3` and `B = |d_K| M²`, the number of primes `p ∈ (X, X(1 + h)]` of the form `p = N_{K/ℚ}(α)` with `α ∈ 𝒪_K`, `α ≡ 1 (mod M𝒪_K)`, is at least `c′hX/(B² log X)` whenever `X ≥ X₀`, `log B ≤ c√(log X)` and `e^(−c√(log X)) ≤ h ≤ 1`.

On the way the roadmap proves the character prime number theorem with the exceptional term: for a primitive nonprincipal `χ` of conductor `N ≥ 3` and every sufficiently large `X`, `Σ_{m≤X} χ(m)Λ(m) = −X^(β₁)/β₁ + O(X exp(−c log X/(√(log X) + log N)) (log N)^4)` with absolute constants, the term present only if `χ` is real and `L(s, χ)` has a real zero `β₁ ∈ (1 − c₁/log N, 1)`. It and the repulsion are proved without the exclusion of Landau–Siegel zeros; with that exclusion both are corollaries of statements of AnalyticNumberTheoryPartI.

The roadmap extends [AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md), which supplies the exceptional-zero predicate, the effective gap for a real zero and the uniform exclusion of Landau–Siegel zeros, Page's theorem across moduli, the half-interval explicit formula and the mollifier zero-density estimate; [ZerosOfLFunctions](../../ZerosOfLFunctions/README.md) supplies Jensen's bound for zeros in a disc, the zero-free regions with their one possible exceptional zero, and the explicit formulas of Weil and of the prime ideal theorem in a ray class; [ClassFieldTheory](../../ClassFieldTheory/README.md) and GlobalNumberFields supply ray class groups and the identification of abelian characters with primitive Hecke characters. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [RiemannHypothesisStatementsAndConsequences](../RiemannHypothesisStatementsAndConsequences/README.md) supplies the Riesz sums of an `L`-series and the predicates of the Riemann hypotheses; the twist selection of [QuadraticTwistSelectionOverPrimes](../QuadraticTwistSelectionOverPrimes/README.md) uses the zero-free boxes and Linnik's range, the Frobenius-restricted Riesz sums of [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) use the Riesz remainders, the theta-chain roadmaps use the least primes `≡ 1 (mod M)` and the norms from imaginary quadratic fields in short intervals, and [GeneralizedRiemannHypothesisFromWindowBounds](../GeneralizedRiemannHypothesisFromWindowBounds/README.md) uses the Riemann hypothesis of an Artin `L`-function.

Layer 0 bounds the Taylor coefficients of `−L′/L(·, χ)` at `2 + it` by its pole and the zeros in a disc of radius `3`, for every character. Layer 1 controls a smoothed twisted prime sum and `L′/L(1, χ)` inside a zero-free box (1.4e–1.4f), proves the character prime number theorem with its exceptional term by summing the half-interval explicit formula over dyadic blocks (1.4g), bounds the Riesz remainder and proves its prime number theorem with the exceptional term and, through the exclusion of Landau–Siegel zeros, without it (1.4h–1.4i), and then proves a power-sum inequality with a dominant term (1.7a), the Deuring–Heilbronn repulsion, the prime number theorem in progressions in Linnik's range with relative error, and Linnik's theorem (1.7b). Layer 2 bounds ray class numbers, counts prime ideals of a ray class in short intervals with the exceptional zero explicit, uniformly in the field of fixed degree and the modulus, with an effective polynomial gap for the exceptional zero and the imaginary quadratic norm form (2.9b), and defines the generalized Riemann hypothesis of an Artin `L`-function (2.41a).

## Conventions

Notation and conventions not restated here are those of the Conventions of AnalyticNumberTheoryPartI and of ZerosOfLFunctions, together with the `c`-exceptional predicate (AnalyticNumberTheoryPartI §0.1), the prime counts `ψ(x;a,q)` and `π(x;a,q)` (AnalyticNumberTheoryPartI §0.2), the constant `c_star` (AnalyticNumberTheoryPartI §0.17), the integer `k₀` (AnalyticNumberTheoryPartI §1.4), the analytic conductor `q(χ, s)` (ZerosOfLFunctions Layer 2) and the predicate *IsExceptionalZero* (ZerosOfLFunctions 6.3).

- `χ` is a Dirichlet character modulo `q ≥ 1`, `χ₀` the principal character and `χ*` the primitive character inducing `χ`; the conductor of a primitive character is written `N` or `f_χ`. A character is real when its values are real, that is in `{0, ±1}`. `L(s, χ)` is the continued Dirichlet `L`-function (Mathlib's `DirichletCharacter.LFunction`); for the principal character it has a pole at `s = 1`, and its totalized value there is never used as a value of the function.
- `Λ` is the von Mangoldt function, `ψ(y) = Σ_{n≤y} Λ(n)`, `ψ_χ(y) = Σ_{n≤y} Λ(n)χ(n)` and `θ` the sum of `log p` over primes. Zeros carry their multiplicities; `ρ = β + iγ` denotes a zero.
- `Li x = ∫_2^x dt/log t` is Tau Ceti's `TauCeti.Real.logIntegral`, as in ZerosOfLFunctions 8.5.
- The Riesz sum `S̃_χ` is introduced in 1.4e; the Riesz remainders `G_χ`, `G_1` and the constants `S_Λ`, `C_Λ` in 1.4h; exceptional pairs modulo `q` at a width `c₁` in 1.7b; the notation for number fields, moduli and ray class groups in 2.9b.
- Positive constants `c, c₁, C, L, …` are absolute unless their dependence is stated; a constant is effective when its value can be computed from the proof, and an effective constant includes an effective threshold.
- The section numbers 0.30b, 1.4e–1.4i, 1.7a–1.7b, 2.9b and 2.41a are this roadmap's own; a section of AnalyticNumberTheoryPartI or of any other roadmap is cited with that roadmap's name, or under its heading in the supplier contracts.

## Layer 0: Logarithmic derivatives of L-functions near the line one

Near the line one the logarithmic derivative of every Dirichlet `L`-function is its pole term minus the contribution of the zeros in a disc of fixed radius, up to an error `C log(q(|t| + 2)) 2^(−k)` in its `k`-th Taylor coefficient at `2 + it`. This is the local input of the repulsion 1.7b (i).

### 0.30b Taylor coefficients of the logarithmic derivative near the line one, for every character

For a Dirichlet character `χ` modulo `q ≥ 1` and `z` with `Re z > 1` write
```text
a_k(χ; z) = Σ_{n≥1} Λ(n) χ(n) (log n)^k n^(−z) / k! ,
```
the `k`-th Taylor coefficient of `−L′/L(·,χ)` at `z` in the convention `f(z − u) = Σ_k a_k u^k`. There is an absolute
`C` such that for every `q ≥ 1`, every character `χ` modulo `q` (principal or not, primitive or not), every real `t`
and every `k ∈ ℕ`, with `z = 2 + it` and `ℒ_t = log(q(|t| + 2))`:

- (a) the zeros `w` of `L(s,χ)` with `|w − z| ≤ 3`, the point `s = 1` excluded, have `Re w < 1`, and their number
  with multiplicity `m_w` is at most `C ℒ_t`;
- (b) with `δ_χ = 1` if `χ` is principal and `0` otherwise,
```text
| a_k(χ; z) − δ_χ (z − 1)^(−k−1) + Σ_{|w−z|≤3} m_w (z − w)^(−k−1) | ≤ C ℒ_t 2^(−k) .
```

*Route.* Let `F(s) = L(s,χ)` for nonprincipal `χ`. For the principal one let `F` be the entire function equal to
`(s − 1)L(s,χ)` for `s ≠ 1` and to its limit `φ(q)/q` at `s = 1` (the residue of `L(s,χ₀) = ζ(s)∏_{p∣q}(1 − p^(−s))`):
the pointwise product `(s − 1)·L(s,χ)` vanishes at `s = 1` whatever value the totalized `L(1,χ)` has, and is not this
function. In both cases `F` is entire, `F(1) ≠ 0`, and its zeros are those of `L(·,χ)` other than `s = 1`, with the same
multiplicities. At the centre,
`|F(z)| ≥ |L(z,χ)| ≥ ζ(4)/ζ(2) > 1/2` (Euler product, `|z − 1| ≥ 1`). On `|s − z| ≤ 15/4`, so `Re s ≥ −7/4`, write
`L(s,χ) = L(s,χ*) ∏_{p∣q}(1 − χ*(p)p^(−s))` with `χ*` primitive (ZerosOfLFunctions 6.4 (4b), Dirichlet form): each
deleted factor has modulus at most `1 + p^(7/4) ≤ p³`, and the wide-strip growth of ZerosOfLFunctions 3.3–3.4 (for
`(s − 1)ζ(s)` when `χ*` is trivial) gives `|F(s)| ≤ C (q(|t| + 2))^B`. So `|F(s)| ≤ e^M |F(z)|` on `|s − z| ≤ 15/4` with
`M = log(2C) + B ℒ_t ≤ C′ ℒ_t`. Jensen's bound (ZerosOfLFunctions 4.3) on the radii `3 < 15/4` gives (a), and Landau's
lemma (AnalyticNumberTheoryPartIII 8.3, with `R = 15/4`, `r₂ = 4/5`, `r₁ = 2/3`, so that `r₂R = 3` and `r₁R = 5/2`) shows
that `g(s) = F′/F(s) − Σ_{|w−z|≤3} m_w/(s − w)`, holomorphic on `|s − z| < 3` once its removable singularities at the
zeros are filled, has `|g| ≤ C(r₁, r₂) M/R ≤ C″ ℒ_t` on `|s − z| ≤ 5/2`. On `Re s > 1`,
`F′/F = L′/L(·,χ) + δ_χ/(s − 1)`, so the `k`-th Taylor coefficient of `−g` at `z` is the left side of (b) inside the
absolute value; Cauchy's estimate on the circle of radius `2` about `z` bounds it by `C ℒ_t 2^(−k)`. Nonvanishing on
`Re s ≥ 1` gives `Re w < 1`.

**Checks.**

- (a) counts every zero in the disc, those of the deleted Euler factors on `Re s = 0` included: for the principal
  character modulo `6`, `L(s,χ₀) = (1 − 2^(−s))(1 − 3^(−s))ζ(s)` vanishes at `2πim/log 2` and `2πim/log 3`, `m ∈ ℤ`,
  and the segment `|Im s − t| ≤ √5` of `Re s = 0` inside the disc contains at most one of each. In general a deleted
  factor at `p` contributes `O(1 + log p)` zeros, consistent with the bound `C ℒ_t`.
- The pole term: at `q = 1`, `t = 0` the disc `|s − 2| ≤ 3` contains no zero of `ζ` (the trivial zeros are at distance
  `≥ 4`, the others have `|Im s| > 14`), so (b) says `|a_k(1; 2) − 1| ≤ C (log 2) 2^(−k)`; indeed `a_k(1; 2) − 1` is the
  `k`-th coefficient of `−ζ′/ζ(s) − 1/(s − 1)`, analytic on `|s − 2| < 4`, and `a_0(1; 2) = −ζ′/ζ(2) ≈ 0.570`. Without
  the pole term the left side would tend to `1`, and with the pole term of opposite sign it would tend to `2`.
- A zero of multiplicity `2` enters with `m_w = 2`.
- The value of `F` at `1`: at `q = 1`, `F(1) = 1` (`(s − 1)ζ(s) → 1`), and at `q = 6`, `F(1) = 1/3`
  (numerically `(s − 1)L(s,χ₀) ≈ 0.333339` at `s = 1 + 10^(−5)`); a function with `F(1) = 0` would have a spurious zero
  at `1`, inside the disc whenever `|t| ≤ √8`.

*Needs:* AnalyticNumberTheoryPartI §0.30; AnalyticNumberTheoryPartIII 8.3; ZerosOfLFunctions 3.3–3.4; ZerosOfLFunctions 4.3–4.4;
ZerosOfLFunctions 6.3–6.4 (4b); Mathlib `DirichletCharacter.LFunction_changeLevel`,
`DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`.

### Examples

For the principal character modulo `6`, `L(s,χ₀) = (1 − 2^(−s))(1 − 3^(−s))ζ(s)` vanishes at `2πim/log 2` and `2πim/log 3`, `m ∈ ℤ`, zeros on `Re s = 0` that the count of 0.30b (a) includes, and the entire function `F` of its route has `F(1) = 1/3`; at `q = 1`, `F(1) = 1`. At `q = 1` and `t = 0` the disc `|s − 2| ≤ 3` contains no zero of `ζ`, so 0.30b (b) reads `|a_k(1; 2) − 1| ≤ C (log 2) 2^(−k)`, with `a_0(1; 2) = −ζ′/ζ(2) ≈ 0.570` (0.30b, Checks).

### Dependencies

AnalyticNumberTheoryPartI §0.30; AnalyticNumberTheoryPartIII 8.3; ZerosOfLFunctions 3.3–3.4, 4.3–4.4, 6.3–6.4; Mathlib's Dirichlet `L`-functions with their change of level and their nonvanishing on `Re s ≥ 1`, and Cauchy's estimate.

## Layer 1: Zero-free boxes, Riesz remainders, exceptional zeros and Linnik's theorem

Smoothed prime sums twisted by a character are controlled inside a box free of zeros, with no sum over zeros (1.4e–1.4f). The half-interval explicit formula of AnalyticNumberTheoryPartI §1.4, summed over dyadic blocks, gives the character prime number theorem with its exceptional term (1.4g), and partial summation turns it into the prime number theorem for the Riesz remainder (1.4h–1.4i). A power-sum inequality with a dominant term (1.7a) and the local expansion 0.30b give the Deuring–Heilbronn repulsion, from which Gallagher's prime number theorem in Linnik's range and Linnik's theorem follow (1.7b).

### 1.4e A zero-free box controls a smoothed twisted prime sum

Let `0 < δ < δ₀ ≤ 1/2`. There is `K = K(δ₀, δ)` such that for
every nonprincipal Dirichlet character `χ` modulo `q` (primitive or not), every `Q ≥ max(q, 2)` such that `L(s,χ) ≠ 0`
for `Re s > 1 − δ₀`, `|Im s| ≤ Q`, every `z ≥ 1` and every `0 < η ≤ 1`,
```text
| S̃_χ(z(1+η)) − S̃_χ(z) + zη (L′/L)(1, χ) | ≤ K log Q · ( η z^(1−δ₀+δ) log Q + z²/Q ),       S̃_χ(y) = Σ_{n≤y} Λ(n) χ(n) (y/n − 1).
```
*Corollary (tail of `L′/L` at `1`).* Under the same hypotheses, for every `x ≥ 2` with `Q ≥ x^(1/δ₀ + 3)`,
```text
| (L′/L)(1, χ) + Σ_{n ≤ x^(1/δ₀)} Λ(n) χ(n)/n | ≤ K′ x^(−1 + δ/δ₀) (log Q)² ,
```
with `K′` depending on `δ₀, δ` only.

*Route.* `S̃_χ` is the Riesz sum of RiemannHypothesisStatementsAndConsequences §8.4a for the coefficients `Λ(n)χ(n)`, whose inversion gives
`S̃_χ(y) = (2πi)^(−1) ∫_(c) −(L′/L)(w,χ) y^w dw/(w(w−1))`, `c = 2`, absolutely convergent; it rests on the kernel
identity `(2πi)^(−1) ∫_(c) x^w dw/(w(w−1)) = max(x − 1, 0)` for `x > 0`, `c > 1`, the residues `x` at `1` and `−1` at
`0`. Move the part `|Im w| ≤ Q/2` to `Re w = 1 − δ₀ + δ`; the only pole crossed is `w = 1`, with residue
`−y (L′/L)(1,χ)`. Inside the box, AnalyticNumberTheoryPartI §0.30a's window expansion (for the primitive character; the deleted Euler factors
add `O(log q)` on `Re w ≥ 1/2`) gives `|L′/L(w,χ)| ≤ K log Q` at distance `≥ δ` from every zero. The horizontal
segments and the tails `|Im w| > Q/2` cost `O(log Q · y²/Q)`. On the vertical segment take the difference of the two
endpoints: `|(z(1+η))^w − z^w| ≤ 2|w| η z^(Re w)`, and `∫ |L′/L|/|w − 1| ≪ log Q · log Q`. No sum over zeros appears.
For the corollary, the elementary bound `|S̃_χ(z+h) − S̃_χ(z) − h Σ_{n≤z} Λ(n)χ(n)/n| ≤ h(h+1) log(z+h)/z` at `h = zη`,
`z = x^(1/δ₀)`, `η = x^(−2)`, divided by `zη`.

**Checks.**

- The principal character is excluded: for `ζ`, `(L′/L)(1)` is a pole and `S̃(z(1+η)) − S̃(z) ∼ zη log z` has a main
  term; the statement would be false.
- A form for the unsmoothed `ψ(x,χ)` with error `x log²/T` is a different statement (it needs zero counts and a sum
  over zeros); the smoothed difference needs none, and its error has the shape `z²/Q`.
- At `δ₀ = 1/2` the hypothesis is a zero-free half-plane `Re s > 1/2` up to height `Q`, and the corollary gives
  `L′/L(1,χ) = −Σ_{n≤x²} Λ(n)χ(n)/n + O(x^(−1+2δ) log²Q)`.

*Needs:* AnalyticNumberTheoryPartI §0.30a; AnalyticNumberTheoryPartI §0.11b; RiemannHypothesisStatementsAndConsequences §8.4a; Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`.

### 1.4f `L′/L(1,χ)` under a zero-free box

For `0 < δ₀ ≤ 1/2` and `ε > 0` there is `C` such that for every nonprincipal
`χ` modulo `q` and every `Q ≥ max(q, 3)` with `L(s,χ) ≠ 0` on `Re s > 1 − δ₀`, `|Im s| ≤ Q`,
```text
| (L′/L)(1, χ) | ≤ ((2 + ε)/δ₀) log log Q + C .
```
*Route.* 1.4e's corollary with `x = (log Q)^(2+ε)` and `δ = δ₀ε/(2 + ε)` (so that `x^(−1+δ/δ₀)(log Q)² = 1`): the tail
is `O(1)`, and Mertens (AnalyticNumberTheoryPartI §0.11) bounds `Σ_{n≤x^(1/δ₀)} Λ(n)/n` by `(1/δ₀) log x + O(1)`. The condition
`Q ≥ x^(1/δ₀+3)` holds once `Q` exceeds a constant; the finitely many characters below are absorbed in `C`.

**Checks.**

- The bound `|L′/L(1,χ)| ≪ log log q` that the Riemann hypothesis for `L(s,χ)` gives is the limiting case: the Riemann
  hypothesis for `L(s,χ)` gives every box with `δ₀ < 1/2`.
- The constant grows like `1/δ₀`: a narrow box controls the tail only beyond `x^(1/δ₀)`.

*Needs:* 1.4e; AnalyticNumberTheoryPartI §0.11.

### 1.4g The character prime number theorem with the exceptional term

Throughout, `χ` is a primitive nonprincipal Dirichlet character of conductor `N ≥ 3`, `ρ` runs over the nontrivial
zeros of `L(s,χ)` with their multiplicities `m_ρ`, and `k₀` is the integer of AnalyticNumberTheoryPartI §1.4.

**(a) Explicit formula over the whole range.** There is an absolute `C` such that for all
real `2 ≤ T ≤ X` the following holds. Let `J ≥ 0` be the least integer with `⌊X/2^J⌋ < max(k₀, T)` and put
`k_* = ⌊X/2^J⌋`, so that `1 ≤ k_* < max(k₀, T)`. Then
```text
Σ_{m≤X} χ(m) Λ(m) = −Σ_{|Im ρ|≤T} m_ρ (X^ρ − k_*^ρ)/ρ + R,       |R| ≤ C ( X log²(NX)/T + T log³(NX) ),
```
and each kernel `(X^ρ − k_*^ρ)/ρ = ∫_{k_*}^X t^(ρ−1) dt` has absolute value at most `X^(Re ρ) log X`.

**(b) The estimate with the exceptional term.** There are absolute
`c, c₁ > 0` such that for every `χ` as above and every sufficiently large `X` (threshold absolute),
```text
Σ_{m≤X} χ(m) Λ(m) = −X^(β₁)/β₁ + O( X exp(−c log X/(√(log X) + log N)) (log N)^4 ),
```
where the term `X^(β₁)/β₁` is present only if `χ` is real and `L(s,χ)` has a real zero `β₁ ∈ (1 − c₁/log N, 1)`, that
is, only if `χ` is `c₁`-exceptional at `β₁` in the sense of AnalyticNumberTheoryPartI §0.1 (then `β₁` is unique and simple). The implied
constant is absolute (Iwaniec–Kowalski, Theorem 5.27; restated as Bennett–Siksek, Theorem 5, (26), where `c` is effective
and the implied constant absolute). The constants here are asserted to exist, not to be effective: the route below takes
its zero-free region from ZerosOfLFunctions 6.3–6.4, whose constant is existential and whose small conductors are settled
by a minimum over finitely many characters (6.4 (4e)).

*Corollary (no exceptional zero).* For every `c₀ > 0` there are `c′, C′ > 0` such that if `χ` is as above and, when
real, `L(s,χ)` has no zero in `(1 − c₀, 1)`, then `|Σ_{m≤X} χ(m)Λ(m)| ≤ C′ X exp(−c′ log X/(√(log X) + log N))(log N)^4`
for `X ≥ 2`.

*Route.* (a): sum AnalyticNumberTheoryPartI §1.4 over the blocks `(k_{j+1}, k_j]`, `k_j = ⌊X/2^j⌋`, `0 ≤ j < J`. Since `k_{j+1} = ⌊k_j/2⌋`, they
tile the integers of `(k_*, X]` exactly, and `k_j ≥ max(k₀, T)` makes AnalyticNumberTheoryPartI §1.4 applicable at height `T`. The block errors
add up to `O(X log²(NX)/T + log X · log²(NX))`, and the integers `m ≤ k_*` contribute `O(T)` by Chebyshev's bound. On
the zero side the blocks telescope to `X^ρ − k_*^ρ` up to the mismatches of `(k_j/2)^ρ` against `k_{j+1}^ρ` and of
`⌊X⌋^ρ` against `X^ρ`; each is `ρ` times the integral of `t^(ρ−1)` over an interval of length at most `1` in `[1, ∞)`,
so after division by `ρ` it is at most `1` in absolute value. There are `O(log X)` of them per zero, and at most
`(T + 1) · C log²(N(T + 2))` zeros of height `≤ T` (AnalyticNumberTheoryPartI §1.4d, each weight `min(1, 1/|ρ|)` being at least `1/(T + 1)`):
together `O(T log³(NX))`. The kernel bound is `|t^(ρ−1)| ≤ X^(Re ρ)/t` on `[k_*, X]`.

(b): use the blocks of (a), but telescope only the possible exceptional zero. By ZerosOfLFunctions 6.3–6.4 (through
AnalyticNumberTheoryPartI §0.30 and the comparison of AnalyticNumberTheoryPartI §0.1), every zero of height `≤ T` other than a possible simple real `β₁` has
`1 − Re ρ ≥ c₂/ℓ`, `ℓ = log(N(T + 2))`; take `c₂ ≤ min(c₁, 1)`, so that such a `β₁` lies in the window of the
statement, while a real zero of the window outside the region contributes `X^(β₁)/β₁ ≤ 2X exp(−c₂ log X/ℓ)`, within
the error. In the block `(k_{j+1}, k_j]`, AnalyticNumberTheoryPartI §1.4c bounds the kernel of every other zero by
`2k_j^(1−c₂/ℓ) min(1, 1/|ρ|)`, and AnalyticNumberTheoryPartI §1.4d sums the weights to at most `Cℓ²`; as `k_j ≤ X/2^j`, the blocks add up to a
geometric series, at most `8Cℓ² X exp(−c₂ log X/ℓ)`. The terms of `β₁` telescope to
`−(X^(β₁) − k_*^(β₁))/β₁ = −X^(β₁)/β₁ + O(T)`, with `O(log X)` from the mismatches. With the block errors and the
integers `m ≤ k_*`,
`Σ_{m≤X} χ(m)Λ(m) = −X^(β₁)/β₁ + O(ℓ² X exp(−c₂ log X/ℓ) + X log²(NX)/T + T + log X · log²(NX))`.
For `N > X^(1/2)` the statement is trivial, as in AnalyticNumberTheoryPartI §0.18's Checks, since then `exp(−c log X/log N) ≥ e^(−2c)`. For
`N ≤ X^(1/2)` take `T = max(exp(√(log X)), N) ≤ X^(1/2)`: if `log N ≤ √(log X)` the logarithmic factors are absorbed
by lowering `c`, and otherwise `log X < log² N`, which gives the factor `(log N)^4`; the term `T ≤ X^(1/2)` is absorbed
as well. For the corollary, the exceptional term is present only when `c₁/log N > c₀`, for finitely many `N`, and then
`X^(β₁)/β₁ ≤ 2X^(1−c₀)`, absorbed after adjusting `c′`; small `X` are absorbed in `C′` by Chebyshev's bound.

**Checks.**

- The kernel of (a) at a zero close to `0`: if `χ` is real and `β₁` is a real zero close to `1`, the zero `1 − β₁` has
  kernel `∫_{k_*}^X t^(−β₁) dt ≤ X^(1−β₁) log X`, bounded as `β₁ → 1`, while its two halves `X^(1−β₁)/(1 − β₁)` and
  `k_*^(1−β₁)/(1 − β₁)` are each of size `1/(1 − β₁)`; the error term of (a) does not bound them separately.
- The exceptional term has the sign `−`: a real zero near `1` makes `Σ χ(m)Λ(m)` close to `−X`, so the primes with
  `χ(p) = −1` dominate.
- The principal character is excluded, as in AnalyticNumberTheoryPartI §0.18.

*Needs:* AnalyticNumberTheoryPartI §0.1; AnalyticNumberTheoryPartI §0.30; AnalyticNumberTheoryPartI §1.4; AnalyticNumberTheoryPartI §1.4c; AnalyticNumberTheoryPartI §1.4d; ZerosOfLFunctions 6.3–6.4; Mathlib `Chebyshev.psi_le_const_mul_self`.

### 1.4h Lipschitz and size bounds for the Riesz remainder

Notation. For a Dirichlet character `χ` and real `y`, `S̃_χ(y) = Σ_{n≤y} Λ(n) χ(n) (y/n − 1)` is the Riesz sum of 1.4e
(`0` for `y < 1`), and `ψ_χ(y) = Σ_{n≤y} Λ(n) χ(n)`, `ψ = ψ_1`. The *Riesz remainder* is
```text
G_χ(y) = S̃_χ(y) + y (L′/L)(1, χ)              for nonprincipal χ (primitive or not),
G_1(y) = S̃_1(y) − y log y + (1 + γ) y          for the trivial character 1 modulo 1,
```
with `γ` Euler's constant (`Real.eulerMascheroniConstant`) and `(L′/L)(1, χ)` defined because `L(1, χ) ≠ 0` (Mathlib
`DirichletCharacter.LFunction_apply_one_ne_zero`). For primitive `χ` these are the Riesz remainder `G_χ(y)` of
RiemannHypothesisStatementsAndConsequences §8.4a (b); for imprimitive `χ` the display is notation, not a new definition.
Put `S_Λ = sup_{y≥1} |Σ_{n≤y} Λ(n)/n − log y|`, finite by Mertens's theorem (AnalyticNumberTheoryPartI §0.11, with the convergent
`Σ_p Σ_{k≥2} (log p)/p^k` for the prime powers), and `C_Λ = 2 + γ + S_Λ`, an absolute constant.

For every nonprincipal
Dirichlet character `χ`, primitive or not:

- (a) for `a, w, w′ > 0`, `|w·G_χ(a/w) − w′·G_χ(a/w′)| ≤ 3 (a/min(w, w′)) |w − w′|`, and the same for `G_1`;
- (b) for `y, z ≥ 1`, `|G_χ(y) − G_χ(z)| ≤ |y − z| (log max(y, z) + C_Λ + |(L′/L)(1, χ)|)`, and
  `|G_1(y) − G_1(z)| ≤ C_Λ |y − z|`;
- (c) for `y ≥ 1`, `|G_χ(y)| ≤ y (log y + C_Λ + |(L′/L)(1, χ)|)`, and `|G_1(y)| ≤ C_Λ y`.

Every larger value of `C_Λ` serves as well.

*Route.* Chebyshev's bound in the form `ψ(y) ≤ 3y` for `y ≥ 0`: Mathlib `Chebyshev.psi_le` gives
`ψ(y) ≤ (log 4) y + 2√y log y` for `y ≥ 1`, and `log y ≤ (2/e)√y`, so `ψ(y) ≤ (log 4 + 4/e) y < 2.86 y`; `ψ(y) = 0`
for `y < 2`. (a) `F(w) = w·G_χ(a/w)` is continuous on `(0, ∞)` (the Riesz sum is continuous) and continuously
differentiable off the finitely many points `w = a/n` of each compact interval. There `F′(w) = −ψ_χ(a/w)` for
nonprincipal `χ`, of absolute value at most `ψ(a/w) ≤ 3a/w`; for the trivial character
`F(w) = w S̃_1(a/w) − a log(a/w) + (1 + γ)a`, so `F′(w) = a/w − ψ(a/w)`, whose absolute value is at most
`max(a/w, ψ(a/w)) ≤ 3a/w`. Integrating
`|F′(t)| ≤ 3a/t ≤ 3a/min(w, w′)` between `w` and `w′` gives (a). (b) `G_χ` is continuous and affine on each `[n, n + 1]`,
with slope `Σ_{m≤n} Λ(m)χ(m)/m + (L′/L)(1, χ)` on `(n, n + 1)`, at most `log t + S_Λ + |(L′/L)(1, χ)|` in absolute value
at every `t` of that interval; `G_1` is continuously differentiable off the integers with derivative
`Σ_{m≤t} Λ(m)/m − log t + γ`, at most `S_Λ + γ` in absolute value. (c) `|S̃_χ(y)| ≤ y Σ_{n≤y} Λ(n)/n ≤ y (log y + S_Λ)`;
and `G_1(y)/y = (Σ_{n≤y} Λ(n)/n − log y) + (1 − ψ(y)/y) + γ`, where `0 ≤ ψ(y)/y ≤ 3`.

**Checks.**

- The trivial character is not piecewise linear in the weight: at `a = 1` and `w > 1` no Riesz term enters, and
  `w·G_1(1/w) = log w + 1 + γ`, with slope `1/w = a/w`; for nonprincipal `χ` the same range gives the constant
  `w·G_χ(1/w) = (L′/L)(1, χ)`. One constant `3` covers both, the slope being `a/w − ψ(a/w)` in general.
- The term `|(L′/L)(1, χ)|` in (b) is the slope itself on `[1, 2)`, where `S̃_χ = 0` and `G_χ(y) = y (L′/L)(1, χ)`; it
  cannot be replaced by a constant independent of `χ` unless `L′/L(1, χ)` is bounded.
- Numbers: `S_Λ ≥ log 3 − (log 2)/2 ≈ 0.7520`, the value of `|Σ_{n≤y} Λ(n)/n − log y|` as `y → 3⁻`, and on `[1, 2·10⁶]`
  the supremum is this value (the difference tends to `−γ ≈ −0.5772`), so `C_Λ ≥ 3.329`; `ψ(n)/n ≤ 1.0389` for
  `n ≤ 2·10⁶`, against the bound `3` used. At `y = 1`, `G_1(1) = 1 + γ ≈ 1.5772 ≤ C_Λ`, as (c) requires.

*Needs:* AnalyticNumberTheoryPartI §0.11; 1.4e (the Riesz sum); RiemannHypothesisStatementsAndConsequences §8.4a (b); Mathlib `Chebyshev.psi_le`,
`DirichletCharacter.LFunction_apply_one_ne_zero`, `Real.eulerMascheroniConstant`.

### 1.4i The Riesz remainder and the prime number theorem with the exceptional term

Notation of 1.4h. For a primitive character `χ` of conductor `f_χ`, an *exceptional zero* of `L(s, χ)` is a `β` with
*IsExceptionalZero* of ZerosOfLFunctions 6.3 for the primitive ray class character of `ℚ` attached to `χ` (AnalyticNumberTheoryPartI §0.30): there
is at most one, it is real, simple and `≥ 1/2`, and only real `χ` have one.

**(a)** There are absolute `C, c > 0` such that for every primitive nonprincipal
Dirichlet character `χ` of conductor `f_χ` and every `y ≥ 2`,
```text
| G_χ(y) − y^β/(β(1 − β)) | ≤ C y (log 3f_χ)^5 exp( −c log y/(√(log y) + log f_χ) ),
```
the term `y^β/(β(1 − β))` present only if `χ` is real and `L(s, χ)` has an exceptional zero `β`; and
`|G_1(y)| ≤ C y exp(−c √(log y))` for `y ≥ 2`.

**(b)** There is an absolute
`c₁ > 0` such that for every `α ∈ [1/2, 1)` and `c_ex ∈ (0, 1/2]` there is `y₀ = y₀(α, c_ex)` with the following
property. Every primitive Dirichlet character `χ`, the trivial one included, whose exceptional zero `β`, if there is
one, has `1 − β ≥ c_ex` satisfies
```text
|G_χ(y)| ≤ y exp( −c₁ (log y)^(1−α) )      for every y ≥ y₀ with log f_χ ≤ (log y)^α .
```
In particular, let `E/ℚ` be a finite abelian extension with group `G` and conductor `f_E`, read each `χ ∈ Ĝ` as a
Dirichlet character modulo `f_E` through `E ⊆ ℚ(ζ_{f_E})` (class field theory over `ℚ`), and let `χ*` be its primitive
character, of conductor dividing `f_E`. If every exceptional zero `β` of an `L(s, χ*)`, `χ ∈ Ĝ`, has `1 − β ≥ c_ex`, then
`|G_{χ*}(y)| ≤ y exp(−c₁ (log y)^(1−α))` for all `χ ∈ Ĝ` and all `y ≥ y₀(α, c_ex)` with `log f_E ≤ (log y)^α`. The
threshold does not depend on `E`, `f_E` or the characters.

*Route.* (a) *The prime sums.* 1.4g (b) gives, for `u` above its absolute threshold,
`|ψ_χ(u) + δ u^β/β| ≤ C u (log 3f_χ)^4 exp(−c log u/(√(log u) + log f_χ))`, with `δ = 1` exactly when the term of
1.4g (b) is present; below the threshold `|ψ_χ(u)| ≤ 3u` and `u^β/β ≤ 2u` are absorbed into `C`. The window of 1.4g (b),
`(1 − c_g/log f_χ, 1)` with `c_g` its width (the `c₁` of 1.4g (b)), and that of ZerosOfLFunctions 6.3,
`[1 − c_Z/log q(χ, 0), 1)` with `log q(χ, 0) ≤ log(4f_χ) ≤ 3 log f_χ`, need not agree; a real zero lying in one and
not in the other has `1 − β ≥ c₃/log f_χ`, `c₃ = min(c_g, c_Z/3)`, so that its term `u^β/β ≤ 2u exp(−c₃ log u/log f_χ)`
lies within the error after lowering `c`. So the display holds with `δ = 1` exactly when `L(s, χ)` has an exceptional
zero `β`. *The integral representation.* By partial summation (Mathlib `LSeries_eq_mul_integral'` with exponent `1`, the
partial sums of `|Λ(n)χ(n)|` being at most `ψ(n) ≤ 3n`) and `DirichletCharacter.LSeries_twist_vonMangoldt_eq`,
`−(L′/L)(s, χ) = s ∫_1^∞ ψ_χ(u) u^(−s−1) du` for real `s > 1`. The display makes `|ψ_χ(u)| u^(−2)` integrable on
`(1, ∞)`: it is at most `2u^(β−2)` plus a function that is bounded on `log u ≤ (log f_χ)²` and at most
`C(log 3f_χ)^4 exp(−(c/2)√(log u))/u` beyond. So dominated convergence as `s → 1⁺` and the continuity of `L′/L(·, χ)`
at `1` give `(L′/L)(1, χ) = −∫_1^∞ ψ_χ(u) u^(−2) du`. Since `y/n − 1 = y ∫_n^y u^(−2) du`,
`S̃_χ(y) = y ∫_1^y ψ_χ(u) u^(−2) du`, and therefore
```text
G_χ(y) = −y ∫_y^∞ ψ_χ(u) u^(−2) du        (y ≥ 1).
```
*Integration.* The term `−δu^β/β` gives exactly `(δy/β) ∫_y^∞ u^(β−2) du = δ y^β/(β(1 − β))`. For the error put
`v = log u`, `V = log y`, `ℓ = log f_χ`: it is at most `C y (log 3f_χ)^4 ∫_V^∞ exp(−cv/(√v + ℓ)) dv`. On `v ≤ ℓ²`,
`√v + ℓ ≤ 2ℓ` and `∫_V^∞ e^(−cv/(2ℓ)) dv = (2ℓ/c) e^(−cV/(2ℓ)) ≤ (2ℓ/c) e^(−(c/2)V/(√V + ℓ))`, which costs the fifth power
of `log 3f_χ`. On `v ≥ W = max(V, ℓ²)`, `√v + ℓ ≤ 2√v` and `∫_W^∞ e^(−(c/2)√v) dv = (8/c²)(1 + (c/2)√W) e^(−(c/2)√W) ≤ (16/c²) e^(−(c/4)√W)`, with `√W ≥ √V ≥ V/(√V + ℓ)`. Together the error is at most
`C′ y (log 3f_χ)^5 exp(−(c/4) log y/(√(log y) + log f_χ))`. *The trivial character.* For `s > 1`,
`s ∫_1^∞ (ψ(u) − u) u^(−s−1) du = −(ζ′/ζ)(s) − 1/(s − 1) − 1` (`LSeries_vonMangoldt_eq_deriv_riemannZeta_div`), which
tends to `−γ − 1` as `s → 1⁺` (Mathlib `log_deriv_riemannZeta_add_inv_sub_sub_isBigO`); the prime number theorem
`|ψ(u) − u| ≤ C u exp(−c√(log u))` (ZerosOfLFunctions 8.5 at `K = ℚ`, where `ζ` has no exceptional zero) gives the
domination, so `∫_1^∞ (ψ(u) − u) u^(−2) du = −1 − γ`, and with `S̃_1(y) = y ∫_1^y ψ(u) u^(−2) du`,
`G_1(y) = −y ∫_y^∞ (ψ(u) − u) u^(−2) du`, at most `C y ∫_{log y}^∞ e^(−c√v) dv ≤ C′ y e^(−(c/2)√(log y))`.

(b) For nonprincipal `χ`, put `V = log y ≥ 1` and `ℓ = log f_χ ≤ V^α`. As `α ≥ 1/2`, `√V + ℓ ≤ 2V^α`, so the exponent of
(a) is at least `(c/2)V^(1−α)`, and `(log 3f_χ)^5 ≤ (2V)^5`; hence the error of (a) is at most `½ y exp(−(c/4)V^(1−α))`
for `V ≥ V₀(α)`. An exceptional term has `β ≥ 1/2` and `1 − β ≥ c_ex`, so it is at most `(2/c_ex) y e^(−c_ex V)`, at most
`½ y exp(−(c/4)V^(1−α))` for `V ≥ V₁(α, c_ex)`. For the trivial character, `C y e^(−c√V) ≤ y exp(−(c/4)V^(1−α))` once
`V ≥ V₂`, since `V^(1−α) ≤ √V`. Take `c₁ = c/4` and `y₀ = exp(max(1, V₀, V₁, V₂))`. For the field form, the conductor of
each `χ*` divides `f_E`, so `log f_{χ*} ≤ log f_E ≤ (log y)^α`; a nonreal `χ*` has no exceptional zero.

**(c) The exception-free form.** `norm_rieszRemainder_le`: there are absolute `C, c > 0` such that for every primitive
nonprincipal Dirichlet character `χ` of conductor `f_χ` and every `y ≥ 2`,
```text
| G_χ(y) | ≤ C y (log 3f_χ)^5 exp( −c log y/(√(log y) + log f_χ) ),
```
and `|G_1(y)| ≤ C y exp(−c √(log y))` for every `y ≥ 2`.

*Route.* (a), and AnalyticNumberTheoryPartI §0.34 for the exceptional term. An exceptional zero `β` of a real `χ` is a
real zero in `[1/2, 1)` of a primitive nonprincipal real character of conductor `f_χ ≥ 3`, so
`(1 − β) log f_χ ≥ c_LS`. With `1/β ≤ 2` and `y^β = y e^(−(1−β) log y)`,
`y^β/(β(1 − β)) ≤ (2/c_LS) log f_χ · y exp(−c_LS log y/log f_χ)`, at most
`(2/c_LS) y (log 3f_χ)^5 exp(−c_LS log y/(√(log y) + log f_χ))` because `log 3f_χ ≥ log 9 > 1`; so (a) gives the display
with `min(c, c_LS)` in place of `c` and `C + 2/c_LS` in place of `C`. The bound for `G_1` is that of (a).

**Checks.**

- The sign: for a real `χ` with an exceptional zero, `ψ_χ(u) ≈ −u^β/β` is negative (the primes with `χ(p) = −1`
  dominate, 1.4g's Check), while `G_χ(y) ≈ +y^β/(β(1 − β))` is positive: the integral representation reverses the sign.
- At `y = 1`: `G_1(1) = 1 + γ`, and the representation gives `∫_1^∞ (ψ(u) − u) u^(−2) du = −1 − γ ≈ −1.5772`; numerically
  `∫_1^X (ψ(u) − u) u^(−2) du = Σ_{n≤X} Λ(n)(1/n − 1/X) − log X ≈ −1.57722` at `X = 2·10⁶`.
- The route of (b) from (a) needs the gap `c_ex`: if `(1 − β) log y ≤ 1`, then `y^β ≥ y/e` and `β(1 − β) ≤ 1/log y`, so
  the exceptional term of (a) is at least `(y log y)/e`, larger than `y`, while the error of (a) is `o(y)` under
  `log f_χ ≤ (log y)^α`. The statement of (b) does not need it: by AnalyticNumberTheoryPartI §0.34,
  `(1 − β) log y ≥ c_LS log y/log f_χ ≥ c_LS (log y)^(1−α)`, so such a zero does not occur once `y` is large, and (c)
  gives the bound of (b), with `c₁ = c/4` for the constant `c` of (c), for every primitive `χ` with
  `log f_χ ≤ (log y)^α` and every `y ≥ y₀(α)`.
- The conductor condition is needed in (b), whatever the zeros: for a prime `D ≡ 1 (mod 8 ∏_{2<p≤y} p)` (Dirichlet),
  the real primitive character `χ_D` of conductor `D` has `χ_D(n) = 1` for every `n ≤ y`, so the terms `y(L′/L)(1, χ_D)`
  cancel in `G_{χ_D}(y) − 2G_{χ_D}(y/2) = y log 2 + G_1(y) − 2G_1(y/2)`. By (a) for `G_1` this is `(log 2 + o(1)) y`
  (numerically `0.6932 y` at `y = 10⁶`), so `|G_{χ_D}(t)| > t/3` at `t = y` or `t = y/2` for large `y`. Here
  `log D > ϑ(y)`; already at `y = 20`, `D = 193993801`.

*Needs:* AnalyticNumberTheoryPartI §0.30; AnalyticNumberTheoryPartI §0.34 (for (c)); 1.4g; 1.4h (notation); ZerosOfLFunctions 6.3–6.4; ZerosOfLFunctions 8.5 (at
`K = ℚ`); RiemannHypothesisStatementsAndConsequences §8.4a (b); ClassFieldTheory Layer 11 (the field form); Mathlib
`LSeries_eq_mul_integral'`, `DirichletCharacter.LSeries_twist_vonMangoldt_eq`,
`DirichletCharacter.LFunction_apply_one_ne_zero`, `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`,
`log_deriv_riemannZeta_add_inv_sub_sub_isBigO`, `Chebyshev.psi_le`.

### 1.7a Power sums with a dominant term

**(a)** *Fejér weights.* For `J ≥ 1` and real `θ` put
`c_j = (1 − j/(J+1))(1 + cos jθ)` for `1 ≤ j ≤ J`, so `0 ≤ c_j ≤ 2`. Then `Σ_{j=1}^J c_j Re(w^j) ≥ −1` for every complex
`|w| ≤ 1`, and `Σ_{j=1}^J c_j cos(jθ) ≥ J/4 − 3/4`.

**(b)** *Power sums with a dominant term.* Let `0 < r < 1` and `x₀ ≥ 0` with
`ρ₀ = (1 + x₀) r < 1`, and put `C = 144 (1 + ρ₀)/(1 − ρ₀)`. Let `L ≥ 1`, `δ > 0`, `0 ≤ x ≤ x₀`, and let `y_1, …, y_N` be
complex numbers, repetitions allowed, with `N ≤ L` and `max_i |y_i| ≥ 1/(1 + x)`. If
```text
Re Σ_{i=1}^N y_i^j ≤ j δ + L r^j      for every j ≥ 1 ,
```
then `x ≥ log(1/(C L δ))/(C L)`.

Part (a) is the Fejér positivity on which the power-sum lemma of AnalyticNumberTheoryPartI §2.9a (in Zaman's repulsion) and the
Lagarias–Montgomery–Odlyzko power-sum repulsion of AnalyticNumberTheoryPartI §2.49 rest; part (b) is a different statement, a power-sum bound
that tolerates an error term `L r^j` for every `j ≥ 1`, which the lemma of AnalyticNumberTheoryPartI §2.9a, a lower bound for `Re Σ z_i^k` at
some `1 ≤ k ≤ (12+ε)M`, does not give, since `L r^k` is not small at small `k`.

*Route.* (a): `1 + 2 Σ_{j=1}^J (1 − j/(J+1)) Re(w^j)` is, at `w = re^(iφ)`, the Poisson integral of the Fejér kernel
`Σ_{|j|≤J} (1 − |j|/(J+1)) e^(ijφ) = |Σ_{j=0}^J e^(ijφ)|²/(J+1) ≥ 0`, hence `≥ 0`; so
`G(w) = Σ_j (1 − j/(J+1)) Re(w^j) ≥ −1/2` on the closed disc. Since `cos(jθ) Re(w^j) = ½ Re((we^(iθ))^j) + ½ Re((we^(−iθ))^j)`,
the weighted sum is `G(w) + ½ G(we^(iθ)) + ½ G(we^(−iθ)) ≥ −1`. At `w = e^(iθ)` it is
`½ Σ_j (1 − j/(J+1)) + G(e^(iθ)) + ½ G(e^(2iθ)) ≥ J/4 − 1/2 − 1/4`. (b): let `R = |y_{i₁}| = max_i |y_i|`,
`θ = arg y_{i₁}`, and `w_i = y_i/R`, so `|w_i| ≤ 1` and `w_{i₁} = e^(iθ)`. By (a), `Σ_i F(w_i) ≥ (F(e^(iθ)) + 1) − N ≥ J/4 − L`,
with `F(w) = Σ_j c_j Re(w^j)`. On the other hand `Σ_i F(w_i) = Σ_j c_j R^(−j) Re Σ_i y_i^j`, and with `c_j ≥ 0`,
`R^(−1) ≤ 1 + x` and the hypothesis this is at most `2 J² δ (1 + x)^J + 2L ρ₀/(1 − ρ₀)`. Take `J = ⌈8KL⌉`,
`K = (1 + ρ₀)/(1 − ρ₀)`: then `J/8 ≤ 2J² δ (1 + x)^J`, so `1 ≤ 16 J δ e^(xJ) ≤ 144 K L δ e^(9KLx)`, which is the claim.

**Checks.**

- The factor `1 − j/(J+1)` is needed in (a): without it, `Σ_{j=1}^J cos(jφ) = (sin((J + ½)φ)/sin(φ/2) − 1)/2` is below
  `−J/5` at `φ = 3π/(2J+1)` for every `J ≥ 1`, so no bound `−1` holds.
- The hypothesis of (b) is needed for `j` up to a multiple of `L`: the `N = L` points `y_i = ω^i/(1 + x)`,
  `ω = e^(2πi/L)`, have `Σ_i y_i^j = 0` for `1 ≤ j < L`, whatever `x ≥ 0` and `δ > 0`; at `j = L` the hypothesis reads
  `(1 + x)^(−L) ≤ δ + r^L`, which for `δ ≥ r^L` forces `x ≥ log(1/(2δ))/L`, the order of the conclusion.

*Needs:* none (finite trigonometric sums and complex numbers).

### 1.7b The Deuring–Heilbronn repulsion, Gallagher's theorem in Linnik's range, and Linnik's theorem

Convention. For `q ≥ 3` and `c₁ > 0`, an *exceptional pair modulo `q` at width `c₁`* is a real nonprincipal character
`χ₁` modulo `q` and a real `β₁` with `L(β₁, χ₁) = 0` and `1 − c₁/log q < β₁ < 1`. If `c₁ ≤ log 3`, so that
`1 − c₁/log q ≥ 0` and `β₁ > 0`, this is equivalent to: the primitive character `χ₁*` inducing `χ₁`, of conductor
`N ∣ q`, `N ≥ 3`, is `c₁`-exceptional at `β₁` in the sense of AnalyticNumberTheoryPartI §0.1 (the deleted Euler factors vanish only on `Re s = 0`,
and `c₁/log q ≤ c₁/log N`), and moreover `β₁ > 1 − c₁/log q`. For larger widths the window can reach `Re s ≤ 0`, where a
deleted factor may vanish (*Check of the convention* below). For `0 < c₁ ≤ min(3c_star/2, c_cmp)`, with
`c_cmp = min(c_Z/3, (log 3)/2)` the width of AnalyticNumberTheoryPartI §0.1's comparison with ZerosOfLFunctions 6.3–6.4 (`c_Z` the degree-one
constant there; so `c₁ ≤ (log 3)/2` and `β₁ > 1/2`), there is at most one such pair modulo `q`, and `β₁` is simple: for
one character by that comparison (*IsExceptionalZero* holds for at most one `β`, of multiplicity one), for two by AnalyticNumberTheoryPartI §0.17
(their primitive sources have conductors with `log(N₁N₂) ≤ 2 log q`). By AnalyticNumberTheoryPartI §0.12, through AnalyticNumberTheoryPartI §0.34a,
`1 − β₁ ≥ c_ε q^(−1/2−ε)`. Prime counts use AnalyticNumberTheoryPartI §0.2's `π(x;a,q)` and
`ψ(x;a,q)`, and `Li = TauCeti.Real.logIntegral`, `Li x = ∫_2^x dt/log t`, as in ZerosOfLFunctions 8.5.

*Check of the convention.* The bound `c₁ ≤ log 3` in the equivalence is needed: at `q = 14` and `c₁ = 3` the window is
`(1 − 3/log 14, 1) ∋ 0` (`1 − 3/log 14 ≈ −0.137`). The quadratic character `χ₋₇` of conductor `7` has `χ₋₇(2) = 1`, so the
character `χ₁` modulo `14` that it induces has `L(s,χ₁) = (1 − 2^(−s))L(s,χ₋₇)`, which vanishes at `0`, while
`L(0,χ₋₇) = −(1/7)Σ_{a=1}^7 aχ₋₇(a) = 1`: `(χ₁, 0)` is a pair modulo `14` at width `3` whose primitive source has no zero
at `0`.

**(i) The Deuring–Heilbronn repulsion.** There is an absolute effective `c > 0` with the
following property. Let `q ≥ 3`, let `χ₁` be a real nonprincipal character modulo `q`, and let `β₁ ∈ [1/2, 1)` with
`L(β₁, χ₁) = 0`. Let `χ` be any character modulo `q` (the principal character and `χ₁` included) and `ρ = β + iγ` a
zero of `L(s,χ)` with `β ≥ 1/2`; if `χ = χ₁` and `ρ = β₁`, assume that `β₁` is a multiple zero of `L(s,χ₁)`. Then for
every `ℒ ≥ log(q(|γ| + 2))`,
```text
1 − β ≥ c · log( c/((1 − β₁) ℒ) ) / ℒ .
```
In particular, with `ℒ = log(q(T + 2))`, no zero of `∏_{χ mod q} L(s,χ)` other than one copy of `β₁` lies in
`σ > max(1/2, 1 − c log(c/((1 − β₁)ℒ))/ℒ)`, `|t| ≤ T`.

Linnik proved the repulsion at heights `|t| ≤ log³ q`, for the characters of all moduli up to `q²` (Linnik 1944 II, §3,
the second basic theorem, p. 348). For the primitive characters of all moduli up to `T`, at heights up to `T`, it is
Bombieri 1987, Théorème 16, p. 41, and Gallagher 1970, (27), p. 336; Gallagher credits the form for the characters of one
modulus to Knapowski. The statement above is the form for one modulus, at every height through `ℒ ≥ log(q(|γ| + 2))`.

This differs from the repulsion table of AnalyticNumberTheoryPartI §2.9a, which repels the zeros of a Dedekind zeta function `ζ_L` in the scale
`log D_L` under `ZamanDigammaInput`: here the scale is `log(q(|γ| + 2))` for the characters of one modulus `q` (at
`L = ℚ(ζ_q)` the scale `log D_L` is of order `φ(q) log q`), and no numerical hypothesis enters.

*Route.*
1. *Positivity.* With the coefficients `a_k(χ; z)` of 0.30b, for every `k ≥ 0`,
   `Re[a_k(χ₀; 2) + a_k(χ₁; 2) + a_k(χ; 2 + iγ) + a_k(χχ₁; 2 + iγ)] ≥ 0`: for `n` prime to `q` the four coefficients of
   `n` add up to `Λ(n)(log n)^k n^(−2)(1 + χ₁(n))(1 + χ(n)n^(−iγ))/k!`, whose real part is `≥ 0` since `χ₁(n) = ±1`, and
   for the other `n` all four vanish.
2. *Local expansion.* 0.30b at the centres `2` (for `χ₀`, `χ₁`) and `2 + iγ` (for `χ`, `χχ₁`) replaces each `a_k` by
   its pole term minus `Σ m_w (z − w)^(−k−1)` over the zeros in the disc of radius `3`, up to `C ℒ 2^(−k)`. All zeros
   within distance `3` of the centre are kept; those farther away are inside the error, through the remainder bound of
   0.30b. There are at most `4Cℒ` of them, and `y = 1/(z − w)` has `|y| ≤ 1` since `Re w < 1`.
3. *The pole cancels against `β₁`.* For `Re z = 2`, `|(z − 1)^(−j) − (z − β₁)^(−j)| ≤ j(1 − β₁)`, because both bases
   have modulus `≤ 1` and differ by `(1 − β₁)/((z − 1)(z − β₁))`; if `|β₁ − z| > 3`, then `|z − 1| ≥ 2` and the pole term
   alone is `≤ 2^(−j)`. At the centre `2` the pole of `L(s,χ₀)` is paired with `β₁` in the disc of `χ₁`. At `2 + iγ` a pole
   occurs only if `χ` or `χχ₁` is principal, that is `χ ∈ {χ₀, χ₁}`; then the other of the two is `χ₁`, and the pole is
   paired with one copy of `β₁` in its disc. When `χ = χ₁`, the zero `ρ` stays in the list because `ρ ≠ β₁` or `β₁` is
   multiple.
4. *Power sums.* Let `M` be the multiset of the `y = 1/(z − w)` over the remaining zeros, with multiplicity. Steps 1–3
   give `Re Σ_{y∈M} y^j ≤ 2j(1 − β₁) + C′ℒ 2^(−j)` for every `j ≥ 1`, with `#M ≤ C′ℒ`; and `M` contains
   `y₀ = 1/(2 + iγ − ρ) = 1/(1 + x)`, `x = 1 − β ≤ 1/2`.
5. 1.7a (b) with `r = 1/2`, `x₀ = 1/2`, `L = C′ℒ` and `δ = 2(1 − β₁)` gives `x ≥ log(1/(2CC′ℒ(1 − β₁)))/(CC′ℒ)`, which is
   the claim with `c = 1/(2CC′)`. The disc radius `3`, the centre at distance `1` right of the line `Re s = 1`, and the
   range `j ≤ J ≍ ℒ` of the Fejér average are fixed by 0.30b and 1.7a.

**Checks.**

- The repulsion bounds `1 − β₁` from below: `L(s,χ₀)` has the zero `ρ = 1/2 + iγ₁` of `ζ`, `γ₁ ≈ 14.13`, so at
  `ℒ = log(q(γ₁ + 2))` the bound gives `c log(c/((1 − β₁)ℒ)) ≤ ℒ/2`, that is `1 − β₁ ≥ c e^(−ℒ/(2c))/ℒ`, a polynomial
  lower bound in `q`, consistent with AnalyticNumberTheoryPartI §0.12.
- The bound is positive only when `(1 − β₁)ℒ < c`, and it improves on the region `1 − β ≥ c₀/ℒ` of ZerosOfLFunctions
  6.3–6.4 only when `(1 − β₁)ℒ ≤ c e^(−c₀/c)`: the repulsion concerns exceptional zeros very close to `1`.
- The route needs the multiplicity clause: for `χ = χ₁` and `ρ = β₁` simple, step 3 pairs the only copy of `β₁` with
  a pole, so `ρ` is not in the multiset of step 4, and the conclusion would read
  `1 − β₁ ≥ c log(c/((1 − β₁)ℒ))/ℒ`, which fails when `(1 − β₁)ℒ` is small. The statement does not need the clause:
  AnalyticNumberTheoryPartI §0.34, in its form for an imprimitive character, gives `(1 − β₁) log q ≥ c_LS`, and
  `ℒ ≥ log 2q > log q`, so for `c ≤ c_LS` the right side is negative and the conclusion holds for every zero.

*Needs:* 0.30b; 1.7a.

**(ii) Gallagher's prime number theorem in Linnik's range.** There are absolute
`L, c, c₁, C > 0` such that for every `q ≥ 3`, every `a` coprime to `q` and every `x ≥ q^L`,
```text
| ψ(x;a,q) − E_ψ(x) | ≤ C ( e^(−c log x/log q) + e^(−c√(log x)) ) · E_ψ(x),       E_ψ(x) = ( x − χ₁(a) x^(β₁)/β₁ ) / φ(q),
| π(x;a,q) − E_π(x) | ≤ C ( e^(−c log x/log q) + e^(−c√(log x)) ) · E_π(x),       E_π(x) = ( Li x − χ₁(a) Li(x^(β₁)) ) / φ(q),
```
where `(χ₁, β₁)` is the exceptional pair modulo `q` at width `c₁` (with `c₁ ≤ min(3c_star/2, c_cmp)`, so that it is
unique and `β₁ > 1/2`), the terms with `β₁` present only if it exists.

Gallagher's theorem (Gallagher 1970, Theorem 7, (29), p. 337) bounds, for `x/Q ≤ h ≤ x` and `Q` between
`exp(√(log x))` and a fixed power of `x`, the sum over all primitive characters of moduli `≤ Q` of the absolute values
of the prime sums `Σ χ(p) log p` over `(x, x + h]` by `h exp(−c log x/log Q)`, the trivial and the exceptional character
entering with their main terms subtracted; after (29) it notes that an exceptional zero `1 − δ` lowers the bound by the
factor `(δ log Q)²`. The statement above is a form for one modulus, with the error relative to `E_ψ(x)` and `E_π(x)`;
the route below proves it directly, not from (29).

*Route.* Orthogonality of characters modulo `q` (`DirichletCharacter.sum_char_inv_mul_char_eq`) and the passage to
primitive characters (AnalyticNumberTheoryPartI §0.30; deleted factors change `ψ(x,χ)` by `O(log q log x)`). For a nonprincipal primitive `χ`,
the explicit formula 1.4g (a) at height `T = q² e^(√(log x))` (`T ≤ x` for `x ≥ q^L`); for the principal character, the
truncated formula for `ζ` (ZerosOfLFunctions 8.3, stated for `x` not a prime power; at a prime power take the limit
from the right at fixed `T`: `ψ` is right-continuous, and the other terms and the error bound are continuous in `x`).
The bound `1 − β₁ ≥ c q^(−3/4)` (AnalyticNumberTheoryPartI §0.12 through AnalyticNumberTheoryPartI §0.34a) and
`1 − x^(β₁−1)/β₁ ≥ min(1, (1 − β₁) log x)/4` give `E_ψ(x) ≥ c x q^(−7/4)`, against which the truncation errors of
1.4g (a) are negligible. The exceptional zero gives `−(x^(β₁) − k_*^(β₁))/β₁ = −x^(β₁)/β₁ + O(T)`. The zeros with
`Re ρ < 1/2` are outside the range of AnalyticNumberTheoryPartI §1.7: their kernels are at most `2x^(1/2) log x · min(1, 1/|ρ|)` (the bound of
1.4g (a), and `|x^ρ − k_*^ρ| ≤ 2x^(Re ρ)`), so by AnalyticNumberTheoryPartI §1.4d they contribute at most `C x^(1/2) log x · log²(qT)` to
`ψ(x;a,q)`, negligible against `E_ψ(x)` for `x ≥ q^L`. The zeros with `Re ρ ≥ 1/2` other than `β₁` have kernels at
most `4x^(Re ρ)`; they satisfy the region of ZerosOfLFunctions 6.3–6.4 and, by (i),
`1 − Re ρ ≥ c log(c/((1 − β₁)ℒ))/ℒ`, `ℒ = log(q(T + 2))`. Integrating `x^(Re ρ − 1)` against the log-free density for one
modulus (AnalyticNumberTheoryPartI §1.7 at `Q = q`) from the edge `u₀` of this zero-free region gives at most `x^(−u₀/2)` for `x ≥ q^L`, `L` large;
splitting `x^(−u₀/2) = x^(−u₀/4) x^(−u₀/4)` and using `x^(−u₀/4) ≤ (1 − β₁)ℒ/c` from (i) yields Linnik's zero sum
`Σ_{χ mod q} Σ_{ρ ≠ β₁, |Im ρ|≤T} x^(Re ρ − 1) ≪ min(1, (1 − β₁)ℒ)(e^(−c log x/log q) + e^(−c√(log x)))`. Since
`ℒ ≤ 4 log x` there, the factor `min(1, (1 − β₁)ℒ)` makes the error relative to `E_ψ(x)`, which an exceptional zero with
`χ₁(a) = 1` makes as small as `≍ (1 − β₁) x log x/φ(q)`. For `π`, first pass from `ψ` to `θ`: the prime powers
`p^k ≤ x`, `k ≥ 2`, of the class contribute at most `ψ(x) − θ(x) ≤ 2√x log x` (Mathlib
`Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`), so the estimate for `ψ(x;a,q)` holds for `θ(x;a,q)` with this extra
error. Then split at `√x` and use partial summation (completed ArithmeticDirichletSeries Layer 6) of `θ(t;a,q)` against
`1/log t` on `(√x, x]`, which gives `π(x;a,q) − π(√x;a,q)`; partial summation of `ψ` itself would count each `p^k` with
weight `1/k` (`4 ≡ 1 (mod 3)` enters with `1/2`). Then `π(√x;a,q) ≤ √x`, the constant `Li(2^(β₁)) = O(1)`, the term
`2√x log x` and the truncation errors `x log²(qx)/T`, `T log³(qx)` are compared with
`E_π(x) ≥ c x q^(−3/4)/(φ(q) log x)`, which follows from `1 − β₁ ≥ c q^(−3/4)` (AnalyticNumberTheoryPartI §0.12 through AnalyticNumberTheoryPartI §0.34a); `L` is doubled for
this form.

**Checks.**

- Both exponentials are needed: for fixed `q` and `x → ∞` a bound with `e^(−c log x/log q)` alone would be a power
  saving, which needs a zero-free strip of fixed width for the characters modulo `q`.
- If an exceptional pair with `χ₁(a) = 1` exists and `(1 − β₁) log x` is small, the class has only
  `≍ (1 − β₁) log x · Li x/φ(q)` primes up to `x`; a proof of the relative form with the main term `Li x/φ(q)` must
  exclude such a pair, as (iv) does through AnalyticNumberTheoryPartI §0.34.
- `q = 3`, no exceptional pair (ζ and `L(s,χ₋₃)` have no zero in `(0,1)`): `π(x;a,3) = (Li x/2)(1 + O(e^(−c√(log x))))`.

*Needs:* (i); AnalyticNumberTheoryPartI §1.7; 1.4g; AnalyticNumberTheoryPartI §1.4d; AnalyticNumberTheoryPartI §0.1; AnalyticNumberTheoryPartI §0.2; AnalyticNumberTheoryPartI §0.17; AnalyticNumberTheoryPartI §0.30; AnalyticNumberTheoryPartI §0.12; AnalyticNumberTheoryPartI §0.34a; ZerosOfLFunctions 6.3–6.4;
ZerosOfLFunctions 8.3; ArithmeticDirichletSeries Layer 6; `DirichletCharacter.sum_char_inv_mul_char_eq`,
`Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`.

**(iii) Linnik's theorem.** There are absolute `L, c > 0` such
that for every `q ≥ 3`, every `a` coprime to `q` and every `x ≥ q^L`,
```text
π(x;a,q) ≥ c · min(1, (1 − β₁) log x) · x/(φ(q) log x),
```
the factor present only if the exceptional pair modulo `q` exists and `χ₁(a) = 1`. Consequently
`π(x;a,q) ≥ c′ x/(q^(7/4) log x)` for `x ≥ q^L`, the least prime `p ≡ a (mod q)` is at most `q^L` (`exists_prime_modEq_le`), and for every `M ≥ 3`
the least prime `≡ 1 (mod M)` is at most `M^L`; for each `r ≥ 1` there are `r` such primes below `M^(L_r)`.

The bound `q^L` for the least prime is Linnik's theorem (Linnik 1944 I, (2), p. 139, proved in Linnik 1944 II, Theorem,
p. 347; Bombieri 1987, Théorème 13, p. 39). The lower bound for `π(x;a,q)`, with its factor `min(1, (1 − β₁) log x)`,
is the consequence of (ii) drawn in the route.

*Route.* (ii) with `L` large: the relative error is `≤ 1/2`, and
`E_π(x) ≥ (Li x − Li(x^(β₁)))/φ(q) ≥ x(1 − x^(β₁−1))/(φ(q) log x) ≥ min(1/2, (1 − β₁)(log x)/2) · x/(φ(q) log x)`, using
`1 − e^(−u) ≥ min(1, u)/2`. The consequences use `1 − β₁ ≥ c q^(−3/4)` (AnalyticNumberTheoryPartI §0.12 through AnalyticNumberTheoryPartI §0.34a).

**Checks.**

- If an exceptional pair with `χ₁(a) = 1` exists, (ii) shows that the factor `min(1, (1 − β₁) log x)` is of the true
  order; a proof of `π(x;a,q) ≫ x/(φ(q) log x)` for every class must exclude such pairs, as (iv) does through AnalyticNumberTheoryPartI §0.34.
- `L ≥ 1` is forced: the least prime `≡ −1 (mod q)` is at least `q − 1`.

*Needs:* (ii); AnalyticNumberTheoryPartI §0.12; AnalyticNumberTheoryPartI §0.34a.

**(iv) Exception-free forms.** There are absolute
`L, c, C > 0` such that for every `q ≥ 3`, every `a` coprime to `q` and every `x ≥ q^L`,
```text
| ψ(x;a,q) − x/φ(q) |    ≤ C ( e^(−c log x/log q) + e^(−c√(log x)) ) · x/φ(q),
| π(x;a,q) − Li x/φ(q) | ≤ C ( e^(−c log x/log q) + e^(−c√(log x)) ) · Li x/φ(q),
π(x;a,q) ≥ x/(3φ(q) log x).
```

*Route.* By AnalyticNumberTheoryPartI §0.34 the exceptional pair of (ii), if it exists, has `(1 − β₁) log q ≥ (1 − β₁) log q′ ≥ c_LS`, where
`q′ ≤ q` is the conductor of the primitive character inducing `χ₁` (the deleted Euler factors vanish only on
`Re s = 0`). Hence `x^(β₁)/β₁ ≤ 2x e^(−c_LS log x/log q)` and `Li(x^(β₁)) ≤ 3x^(β₁−1) Li x ≤ 3e^(−c_LS log x/log q) Li x`
(for `β₁ ≥ 1/2` and `x` large), so `E_ψ(x)` and `E_π(x)` differ from `x/φ(q)` and `Li x/φ(q)` by relative errors that
the first two bounds absorb once `c ≤ c_LS`. For the third, take `L` so large that the relative error is at most `1/3`,
and use `Li x ≥ (x − 2)/log x`.

*Needs:* (ii); AnalyticNumberTheoryPartI §0.34.

*Effectivity.* The constant `c` of (i) is effective: its route uses 0.30b and 1.7a and no zero-free region. The constants
of (ii)–(iv) are asserted to exist, not to be effective. Their routes take the zero-free region and the width `c_cmp`
from ZerosOfLFunctions 6.3–6.4, whose constant is existential and whose small conductors are settled by a minimum over
finitely many characters (6.4 (4e)), as in 2.9b (iv) below. The published proofs give an effective `L` (Bombieri 1987,
Théorème 13, p. 39).

### Examples

- At `δ₀ = 1/2` the hypothesis of 1.4e is a zero-free half-plane `Re s > 1/2` up to height `Q`, and its corollary reads `L′/L(1,χ) = −Σ_{n≤x²} Λ(n)χ(n)/n + O(x^(−1+2δ) log²Q)` (1.4e, Checks).
- `S_Λ ≥ log 3 − (log 2)/2 ≈ 0.7520`, the value of `|Σ_{n≤y} Λ(n)/n − log y|` as `y → 3⁻`, so `C_Λ ≥ 3.329`; and `G_1(1) = 1 + γ ≈ 1.5772` (1.4h, Checks), matching `∫_1^∞ (ψ(u) − u) u^(−2) du = −1 − γ` (1.4i, Checks).
- For a prime `D ≡ 1 (mod 8 ∏_{2<p≤y} p)` the character `χ_D` has `|G_{χ_D}(t)| > t/3` at `t = y` or `t = y/2` for large `y`, so the conductor condition of 1.4i (b) is needed; already at `y = 20`, `D = 193993801` (1.4i, Checks).
- The `N = L` points `y_i = ω^i/(1 + x)`, `ω = e^(2πi/L)`, have `Σ_i y_i^j = 0` for `1 ≤ j < L` (1.7a, Checks).
- At `q = 14` the character induced by `χ₋₇` and the point `0` form a pair modulo `14` at width `3` whose primitive source has no zero at `0` (1.7b, Check of the convention); at `q = 3`, where there is no exceptional pair, `π(x;a,3) = (Li x/2)(1 + O(e^(−c√(log x))))` (1.7b (ii), Checks).

### Dependencies

Layer 0 (0.30b, for 1.7b (i)); AnalyticNumberTheoryPartI §§0.1, 0.2, 0.11, 0.11b, 0.12, 0.17, 0.30, 0.30a, 0.34, 0.34a, 1.4, 1.4c, 1.4d, 1.7; ZerosOfLFunctions 6.3–6.4, 8.3, 8.5; RiemannHypothesisStatementsAndConsequences §8.4a; ClassFieldTheory Layer 11; ArithmeticDirichletSeries Layer 6; Mathlib's Chebyshev bounds, partial summation of Dirichlet series, orthogonality of Dirichlet characters and the logarithmic derivative of `ζ` near `1`; Tau Ceti's logarithmic integral.

## Layer 2: Prime ideals in short intervals and Artin L-functions

Over a number field of fixed degree, ray class numbers are bounded by the discriminant and the norm of the modulus, and the prime ideals of a ray class are counted in short intervals, uniformly in the field and the modulus, with the exceptional zero explicit; an effective polynomial gap for the exceptional zero gives counts free of it, and over imaginary quadratic fields the primes that are norms of `α ≡ 1 (mod M)` (2.9b). The generalized Riemann hypothesis of an Artin `L`-function is defined with its first properties (2.41a).

### 2.9b Prime ideals of a ray class in short intervals, uniformly in the field and the modulus

Notation. `K` is a number field of degree `n`, `𝔪` a modulus of `K`, `Cl_𝔪` its ray class group
(`TauCeti.GlobalNumberFields.RayClassGroup 𝔪`), `h_𝔪 = #Cl_𝔪`, and `B = max(3, |d_K| 𝔑𝔪₀)` with `𝔪₀` the finite part of
`𝔪`. For a character `ψ` of `Cl_𝔪`, `ψ*` is the primitive character inducing it, and `L(s,ψ*)` its continued Hecke
`L`-function (`ζ_K` for the trivial character). For a smooth `Φ₀ : ℝ → [0, 1]` supported in `[0, 1]`, `X ≥ 3` and
`0 < h ≤ 1`, put `φ(y) = Φ₀((y − X)/(hX))` and `φ̃(s) = ∫₀^∞ φ(y) y^(s−1) dy`.

**Class numbers.** For every number field `K` of degree `n` with `r₁` real places and every
modulus `𝔪` of `K`, with `h_K = NumberField.classNumber K`,
```text
h_𝔪 ≤ 2^(r₁) 𝔑𝔪₀ h_K ≤ 8^n B .
```

*Route.* The ray class number formula `h_𝔪 · [𝒪_Kˣ : U_𝔪] = h_K · #(𝒪_K/𝔪₀)ˣ · 2^(number of real places of 𝔪)`, with
`U_𝔪` the units congruent to `1` modulo `𝔪` (`TauCeti.GlobalNumberFields.card_rayClassGroup_mul_index`, from the
ray-class exact sequence), gives the first inequality, as `#(𝒪_K/𝔪₀)ˣ ≤ 𝔑𝔪₀` and `𝔪` has at most `r₁` real places.
The second is the class-number bound `h_K ≤ 4^n |d_K|` of completed EffectiveBounds Layer 1
(`NumberField.classNumber_le_bound`: every ideal class contains an integral ideal of norm at most the Minkowski bound,
and at most `2^n X²` integral ideals have norm `≤ X`, for `X ≥ 1`), with `r₁ ≤ n` and `|d_K| 𝔑𝔪₀ ≤ B`.

**Checks.**

- `K = ℚ`, `𝔪 = (q)∞`: `Cl_𝔪 ≅ (ℤ/q)ˣ`, so `h_𝔪 = φ(q)`, against the bound `2q`.
- The factor for the real places cannot be dropped: for `K = ℚ(√3)` and `𝔪` the product of its two real places,
  `h_K = 1` and `h_𝔪 = 2`, because every unit of `ℤ[√3]` has norm `1`, so the ideal `(√3)`, whose generators all have
  norm `−3`, has no totally positive generator.

*Needs:* GlobalNumberFields Layer 2 (the ray class number formula); completed EffectiveBounds Layer 1
(`NumberField.classNumber_le_bound`).

**(i) Landau–Page for a ray class group.** For `n ≥ 1` there is `c_n > 0` such
that for every `K` of degree `n` and every `𝔪`, the product `∏_ψ L(s, ψ*)` over the characters `ψ` of `Cl_𝔪` (the
trivial character included) has at most one zero in `(1 − c_n/log B, 1)`, counted with multiplicity. So at most one
character `ψ₁` has `L(s, ψ₁*)` vanishing there; that character is real, its zero `β₁` there is simple, and
*IsExceptionalZero* `ψ₁* β₁` holds (ZerosOfLFunctions 6.3). Call `(ψ₁, β₁)` the exceptional pair of `𝔪`.

*Route.* A corollary of AnalyticNumberTheoryPartI §2.43 (i) for the ray class field of `𝔪` over `K`: by class field theory its Galois group is
`Cl_𝔪`, and its characters are the primitive Hecke characters `ψ*` of conductor dividing `𝔪`, so `Q ≤ 𝔑𝔪₀` and
`log(D_K Q n^n) ≤ log B + n log n ≤ C_n log B`. Hence, once `D_K Q n^n` exceeds AnalyticNumberTheoryPartI §2.43's threshold, `∏_ψ L(s,ψ*)` has at
most one zero, with multiplicity, in `σ ≥ 1 − 0.0875/(C_n log B)`, `|t| ≤ 1`, and it is real, simple and belongs to a
real character. Below the threshold there are, for fixed `n`, finitely many pairs `(K, ψ*)` (ZerosOfLFunctions 6.4
(4e)); each `L(s,ψ*)` is nonzero on some `[1 − ε, 1)`, analytic and nonzero at `1` or with its pole there, and
`c_n ≤ ε log 3` leaves no zero in the window. Finally choose `c_n` at most the constant of ZerosOfLFunctions 6.3 for
degree `n` divided by `1 + n log 12/log 3`: the analytic conductor of `ψ*` at `0` is at most `12^n B`, so every zero in
`(1 − c_n/log B, 1)` lies in *IsExceptionalZero*'s range.

*Needs:* AnalyticNumberTheoryPartI §2.43; ZerosOfLFunctions 6.3–6.4 (4e); ClassFieldTheory Layer 11; GlobalNumberFields Layer 2;
GlobalNumberFields Layer 9.

**(ii) The smoothed short-interval prime ideal theorem with the exceptional zero.** For `n ≥ 1` and `Φ₀` as above there are `c, C > 0` such that for every `K` of
degree `n`, every `𝔪`, every class `𝒞 ∈ Cl_𝔪`, every `X ≥ 3` with `log B ≤ c √(log X)` and every `h` with
`e^(−c√(log X)) ≤ h ≤ 1`,
```text
Σ_{𝔞 prime to 𝔪, [𝔞] = 𝒞} Λ_K(𝔞) φ(𝔑𝔞) = ( φ̃(1) − ψ₁(𝒞) φ̃(β₁) ) / h_𝔪 + R,        |R| ≤ C hX e^(−c√(log X)) / h_𝔪,
```
the term `ψ₁(𝒞) φ̃(β₁)` present only if the exceptional pair of (i) exists. Here `φ̃(1) = hX ∫Φ₀` and
`0 ≤ φ̃(β₁) ≤ X^(β₁−1) φ̃(1)`. The term `ψ₁(𝒞) φ̃(β₁)/h_𝔪` is the part, coming from zeros above `1 − c_n/log B`, of the
smoothed exceptional term `h_𝔪^(−1) Σ_ψ Σ_{β : IsExceptionalZero ψ* β} Re ψ(𝒞) φ̃(β)` (ZerosOfLFunctions 8.7's
*exceptionalRayClassTerm* with `φ̃(β)` in place of `x^β/β`); its other summands come from real zeros in
`[1 − c/log q(ψ*, 0), 1 − c_n/log B]` and are part of `R`.

*Route.* Orthogonality on `Cl_𝔪` (the smoothed form of ZerosOfLFunctions 8.7's identity), then each `ψ` replaced by `ψ*`
(prime powers of primes dividing `𝔪` in `[X, 2X]` contribute at most `log 𝔑𝔪` per character). For each `ψ*`, the Weil
formula of ZerosOfLFunctions 8.4 (trivial character) or 8.6 (nontrivial) applied to `φ`. Since `φ(1) = 0` and
`φ̌(y) = φ(1/y)/y` vanishes on norms `≥ 1`, the prime side is the smoothed sum. The pole terms of the trivial character
are `φ̃(1)` and `φ̃(0)`, with `0 ≤ φ̃(0) ≤ log(1 + h) ≤ h`. The gamma term is an integral on `Re s = 2`, where `φ̃` has size
`hX²`; move its contour to `Re s = −1/2`: it crosses only `s = 0`, where the gamma factor's logarithmic derivative has
the residue `−(#{j : a_j = 0} + r₂)`, `a_j ∈ {0, 1}` the parity of `ψ*` at the `j`-th real place (`−(r₁ + r₂)` for
`ζ_K`), at most `r₁ + r₂` in absolute value; this gives a term of absolute value at most `(r₁ + r₂)φ̃(0) ≤ nh`. The
shifted integral is `O_n(X^(−1/2) log(2/h))` because `|φ̃(−1/2 + it)| ≤ C_Φ₀ hX^(−1/2) min(1, (h|t|)^(−2))` against a
digamma bound `O(log(|t| + 2))` (ZerosOfLFunctions 1.4); its companion term with `φ̃(−1 − it)` is `O(X^(−1) log(2/h))`,
since `|φ̃(−1 − it)| ≤ C_Φ₀ (h/X) min(1, (h|t|)^(−2))`. So the gamma term is `O_n(1)`. Integration by parts gives
`|φ̃(β + iγ)| ≤ C_Φ₀ hX^β (1 + h|γ|)^(−2)`; here and below `C_Φ₀` depends on the fixed cutoff `Φ₀` only. The zeros:
orthogonality weights each of the `h_𝔪` characters by `1/h_𝔪`, so it suffices to bound the zero sum of each `ψ*` by
the target `hX e^(−cS)/h_𝔪`, `S = √(log X)`; since `h ≥ e^(−cS)` and `h_𝔪 ≤ 8^n B ≤ 8^n e^(cS)` (2.9b, class numbers), the target
is at least `X e^(−3cS)/8^n`. Split the zeros at `T = h^(−1) e^(5cS) ≤ e^(6cS)`, where
`log(B(T + 3)^n) ≤ c(1 + 6n)S + 2n`. Below `T`, every zero other than `β₁` has `1 − β ≥ η := min(c_n/log B, c₂/log(B(T + 3)^n))` (ZerosOfLFunctions 6.4 and (i)), and there are `O_n(T log(B(T + 3)^n))` of them (ZerosOfLFunctions 4.4); their sum is
`O_{n,Φ₀}(X^(1−η) e^(5cS) S)`. Above `T`, the decay `(h|γ|)^(−2)` and the count give `O_{n,Φ₀}(h^(−1)X T^(−1) S) = O_{n,Φ₀}(X e^(−5cS) S)`. Choose `c` with `c² ≤ c_n/12` and `c² ≤ c₂/(12(1 + 6n))`: then `η log X ≥ 12cS` from the first
term of the minimum, and `≥ 12cS·c(1 + 6n)S/(c(1 + 6n)S + 2n) ≥ 9cS` from the second once `S ≥ 6n/(c(1 + 6n))`; so the
sum below `T` is `O(X e^(−4cS) S)`, and every error (the two zero sums, the pole and gamma terms and the prime powers at
`𝔪`, `O_n(1 + log B) = O_n(S)`) is at most `X e^(−3cS)/8^n` for large `X`. Bounded `X` (then `B`, `1/h` and `h_𝔪` are
bounded) are absorbed into `C`.

*Needs:* (i); 2.9b (class numbers); ZerosOfLFunctions 4.4; ZerosOfLFunctions 6.3–6.4;
ZerosOfLFunctions 8.4, 8.6, 8.7; ZerosOfLFunctions 1.4; GlobalNumberFields Layer 2 and
GlobalNumberFields Layer 9 (ray class groups and their finiteness).

**(iii) The count of prime ideals, with the exceptional zero explicit.** For
`n ≥ 1` there are `c, c′, C > 0` such that under the size conditions of (ii),
```text
#{ 𝔭 prime of K, 𝔭 ∤ 𝔪, deg 𝔭 = 1, [𝔭] = 𝒞, X < 𝔑𝔭 ≤ X(1+h) } ≥ ( hX / (h_𝔪 log 2X) ) · ( c′ μ − C e^(−c√(log X)) ),
```
where `μ = min(1, (1 − β₁) log X)` if the exceptional pair of (i) exists and `ψ₁(𝒞) = 1`, and `μ = 1` otherwise.

*Route.* (ii) with `Φ₀ ≤ 1_[0,1]`, `Φ₀ = 1` on `[1/4, 3/4]`; `φ̃(1) − φ̃(β₁) ≥ φ̃(1)(1 − X^(β₁−1))` and
`1 − e^(−t) ≥ min(1, t)/2`. Prime powers `𝔭^k` with `k ≥ 2` and primes of degree `≥ 2` with norm in `[X, 2X]` number
`O(n√X)`; `log 𝔑𝔭 ≤ log 2X`.

*Needs:* (ii).

**(iv) Corollaries in every degree with an effective gap, and the imaginary quadratic norm form.**

(a) For `n ≥ 1` and `ε > 0` there is an effective `c_{n,ε} > 0` such that for every `K` of
degree `n`, every `𝔪` and every real character `ψ` of `Cl_𝔪`, with `𝔣_ψ` the conductor of `ψ*` and `𝔑𝔣_ψ` the norm of
its finite part, every real zero `β ∈ (1/2, 1)` of `L(s, ψ*)` satisfies
```text
1 − β ≥ c_{n,ε} (D_K² 𝔑𝔣_ψ)^(−(1+2ε)/(2n))   if ψ is nontrivial,        1 − β ≥ c_{n,ε} D_K^(−(1+2ε)/n)   if ψ is trivial.
```
In particular `1 − β ≥ c_{n,ε} B^(−(1+2ε)/n)` in both cases, since `D_K² 𝔑𝔣_ψ ≤ B²` and `D_K ≤ B`.

*Route.* Put `E` the quadratic extension of `K` cut out by `ψ*` if `ψ` is nontrivial, and `E = K` if `ψ` is trivial;
let `d = [E:ℚ]` (`2n` or `n`) and `D_E = |d_E|`. If `ψ` is nontrivial, `ζ_E = ζ_K L(·, ψ*)` (AnalyticNumberTheoryPartI §2.7 for `E/K`, with `ψ*`
the character of `E/K` by ClassFieldTheory Layer 11) and `D_E = D_K² 𝔑𝔣_ψ` (ClassFieldTheory Layer 13,
conductor–discriminant). If `ψ` is trivial, `E = K` and `L(·, ψ*) = ζ_K = ζ_E`, and `D_E = D_K`. In both cases
`ζ_E(β) = 0`, and the bound to prove is `1 − β ≥ c_{n,ε} D_E^(−(1+2ε)/d)`. `E ≠ ℚ`, since `ζ` has no zero in
`(0, 1)`, so `D_E ≥ 3`. If
`1 − β ≥ 1/(4 d! log D_E)`, this follows, as `log D_E ≪_{d,ε} D_E^((1+2ε)/d)` effectively. Otherwise the
quadratic-subfield lemma for near-one Dedekind zeros, the interface of AnalyticNumberTheoryPartI §2.31e ("the quadratic subfield carrying a
near-one Dedekind zero"; Stark, Lemma 8, pp. 145–146), gives a quadratic field `F ⊆ E` with `ζ_F(β) = 0`; as `ζ_F = ζ · L(·, χ_F)`
(AnalyticNumberTheoryPartI §2.7 for `F/ℚ`) and `ζ` has no zero in `(0, 1)`, `β` is a zero of the real primitive character `χ_F`, and AnalyticNumberTheoryPartI §0.12
(through AnalyticNumberTheoryPartI §0.34a) gives `1 − β ≥ c_ε D_F^(−1/2−ε)` effectively. Since `D_F ≤ D_E^(1/[E:F])` (the discriminant tower
formula, as in AnalyticNumberTheoryPartI §2.31d) and `[E:F] = d/2`, `D_F ≤ D_E^(2/d)`, which gives the bound. Only that interface of AnalyticNumberTheoryPartI §2.31e is
used, not its residue bound.

(b) For `n ≥ 1` and `ε > 0` there are `c, c′, X₀ > 0` such that for `K` of
degree `n`, every `𝔪`, every class `𝒞`, every `X ≥ X₀` with `log B ≤ c√(log X)` and every `h` with
`e^(−c√(log X)) ≤ h ≤ 1`, the count of (iii) is at least `c′ hX/(h_𝔪 B^((1+2ε)/n) log X)`.

*Route.* (iii) with `μ ≥ min(1, c_{n,ε} B^(−a) log X) ≥ c_{n,ε} B^(−a)`, `a = (1 + 2ε)/n`, by (a); and
`C e^(−c₃√(log X)) ≤ ½ c′ c_{n,ε} B^(−a)` once `c ≤ c₃/(2a)` and `X ≥ X₀`, since `B^a ≤ e^(ac√(log X))`; here `c₃`, `C`
are the constants of (iii).

(c) There are absolute
`c, c′, X₀ > 0` and, for each `ε > 0`, an effective `c_ε > 0` with the following properties, for every imaginary
quadratic field `K`, every integer `M ≥ 3`, `𝔪 = M𝒪_K` and `B = |d_K| M²`.

- *Polynomial gap.* Every real zero `β ∈ (1/2, 1)` of `L(s, ψ*)`, for a real character `ψ` of `Cl_𝔪`, satisfies
  `1 − β ≥ c_ε B^(−1/2−ε)`.
- *Norms in short intervals* (`card_primes_norm_one_mod_shortInterval_ge`). For `X ≥ X₀` with `log B ≤ c√(log X)` and `e^(−c√(log X)) ≤ h ≤ 1`, the number of primes
  `p ∈ (X, X(1+h)]` of the form `p = N_{K/ℚ}(α)` with `α ∈ 𝒪_K`, `α ≡ 1 (mod M𝒪_K)`, is at least `c′ hX/(B² log X)`.

*Route.* (a) and (b) at `n = 2` (with `ε = 1/2` for the count), and `h_𝔪 ≤ 16B` by 2.9b (class numbers; here
`r₁ = 0`, `𝔑𝔪₀ = M²` and `h_K ≤ 16|d_K|`). A prime ideal of degree one in the trivial class of `Cl_𝔪` is `(α)` with
`α ≡ 1 (mod M)`, and `α` is unique because for `M ≥ 3` no unit other than `1` is `≡ 1 (mod M)`; its norm is a prime
`p`, and each `p` comes from at most two such ideals.

*Effectivity.* The gaps `c_{n,ε}` of (a) and `c_ε` of (c) are effective: AnalyticNumberTheoryPartI §0.12 is effective, and so are the threshold
`1/(4 d! log D_E)`, the discriminant bound `D_F ≤ D_E^(2/d)` and the absorption of `log D_E` into a power. The counts of
(b) and (c) inherit the constants `c, c′, X₀` of (ii)–(iii), which rest on the constant `c_n` of (i) and on the region
constant `c₂` of ZerosOfLFunctions 6.4. Neither supplier gives these effectively: (i) uses the threshold of AnalyticNumberTheoryPartI §2.43, which
is absolute but not given as effective, and below it the minimum, over the finitely many characters of small conductor,
of their zero-free neighbourhoods of `1`; ZerosOfLFunctions 6.4 closes its small conductors by the same kind of finite
minimum (its (4e)). So (b) and (c) state the counts with constants that exist, not with effective ones.

*Needs:* (iii); 2.9b (class numbers); AnalyticNumberTheoryPartI §0.12; AnalyticNumberTheoryPartI §0.34a; AnalyticNumberTheoryPartI §2.7; AnalyticNumberTheoryPartI §2.31d; AnalyticNumberTheoryPartI §2.31e (its quadratic-subfield interface);
ClassFieldTheory Layer 11; ClassFieldTheory Layer 13 (conductor–discriminant); GlobalNumberFields Layer 2 (ray
class groups of imaginary quadratic fields, units).

**Checks for 2.9b.**

- `K = ℚ`, `𝔪 = (q)∞`: `h_𝔪 = φ(q)` and (iii) is a short-interval form of 1.7b (ii) for `log q ≤ c√(log X)`, with the
  same depletion factor at classes where the exceptional character is `1`.
- `K = ℚ(i)`, `𝔪 = 1`: one class, and the main term `φ̃(1) = hX ∫Φ₀` of (ii) counts the prime ideals, weighted by `φ`:
  each `p ≡ 1 (mod 4)` gives two ideals of norm `p`, and these primes have density `1/2`. The main term is `hX ∫Φ₀`, not
  `hX` (for `Φ₀ = 0` both sides of (ii) vanish; for the bump `exp(−1/(t(1 − t)))` on `(0, 1)`, `∫Φ₀ ≈ 0.00703`).
- The depletion: if `ψ₁` is the quadratic character of `Cl_𝔪` attached to an exceptional zero, (ii) gives main terms
  `(φ̃(1) ∓ φ̃(β₁))/h_𝔪` at classes with `ψ₁(𝒞) = ±1`. For `Φ₀ ≥ 0` nonzero and `β₁ < 1` the exceptional term is strictly
  smaller than `X^(β₁−1)φ̃(1)` (`y^(β₁−1) < X^(β₁−1)` for `y > X`; at `X = 1000`, `h = 1/2` and the bump above,
  `φ̃(0.9) ≈ 1.7231 < X^(−0.1)φ̃(1) ≈ 1.7616`), so the classes with `ψ₁(𝒞) = 1` keep at least
  `(1 − X^(β₁−1))φ̃(1)/h_𝔪` and at most `(1 − (X(1 + h))^(β₁−1))φ̃(1)/h_𝔪 ≤ (1 − β₁) log(2X) φ̃(1)/h_𝔪`: they lose a
  factor of order `(1 − β₁) log X` when
  it is small. A proof of a lower bound free of `β₁` must bound `1 − β₁` from below, as (iv)(a) does.
- The size conditions of (ii) pay for the count of zeros: with `log B = cS`, `h = e^(−cS)`, `h_𝔪 = 8^n B`, the target is
  `X e^(−3cS)/8^n` while the unweighted count below `T` costs `T ≤ e^(6cS)`, so the saving `η log X` must exceed `8cS`
  (with room for the factor `S`). The conditions `c² ≤ c_n/12`, `c² ≤ c₂/(12(1 + 6n))` give at least `9cS` for large `X`;
  with `4` in place of `12` the guaranteed saving is just below `4cS`, and with `8` just below `8cS`: neither exceeds
  `8cS`.
- At `K = ℚ`, (iv)(a) is AnalyticNumberTheoryPartI §0.12: for a nontrivial real `ψ`, `D_K = 1`, `n = 1`, `E` is the quadratic field of `ψ*` with
  `D_E = 𝔑𝔣_ψ`, and the bound reads `1 − β ≥ c_ε 𝔑𝔣_ψ^(−1/2−ε)`; for the trivial character `ζ` has no zero in
  `(1/2, 1)`.

### 2.41a The Riemann hypothesis of an Artin L-function

For a finite Galois extension `L/K` and a finite-dimensional complex representation `ρ` of
`Gal(L/K)`, the generalized Riemann hypothesis of `ρ` is the statement that the Brauer continuation
`L_K(·, ρ)` of AnalyticNumberTheoryPartI §2.18a is zero-free right of `1/2` in the sense of RiemannHypothesisStatementsAndConsequences §9.2. Poles are allowed, so the predicate does not
assume Artin holomorphy (AnalyticNumberTheoryPartI §2.41).

- Inverse and reflection: the hypotheses for `ρ` and for its contragredient `ρ^∨` are equivalent,
  by `L_K(conj s, conj ρ) = conj L_K(s, ρ)` and `conj ρ ≅ ρ^∨` for a finite image; with the
  completed functional equation of AnalyticNumberTheoryPartI §2.41, the order of the completed `Λ(·, ρ)` at `s` equals its
  order at `1 − conj s`, poles included.
- Sums and induction: the hypotheses for `ρ₁` and `ρ₂` give it for `ρ₁ ⊕ ρ₂` (the product clause of
  RiemannHypothesisStatementsAndConsequences §9.2); it is invariant under induction (AnalyticNumberTheoryPartI §2.18a).
- Through an abelian quotient: if `Ind_K^ℚ ρ` factors through `Gal(F/ℚ)` for a field `F` abelian
  over `ℚ`, it is a sum of characters `φ_i` of `Gal(F/ℚ)`, and `L_K(s, ρ) = ∏_i L(s, φ_i)` by
  induction, inflation and sums (AnalyticNumberTheoryPartI §2.18a); the one-dimensional comparison of AnalyticNumberTheoryPartI §2.18a identifies each
  `L(s, φ_i)` with the L-function of the primitive character of `ℚ` attached to `φ_i` by
  reciprocity, which is the image of a primitive Dirichlet character `χ_i` under the equivalence
  of RiemannHypothesisStatementsAndConsequences §11.1. So the generalized Riemann hypotheses of the `χ_i` (RiemannHypothesisStatementsAndConsequences
  §9.4, read on the characters of `ℚ` by the rational bullet of RiemannHypothesisStatementsAndConsequences §9.5) give the hypothesis for `ρ`, by the
  sums clause. This covers every `ρ` of `Gal(L/K)` with `L` abelian over `ℚ`, and, over `ℚ`, the
  sum `1 ⊕ χ` with a quadratic `χ` and the sign character of an `S₃`-extension, which factors
  through its quadratic subfield; it does not cover the two-dimensional irreducible representation
  of an `S₃`-extension.
- Dedekind zeta: for the regular representation, `L_K(s, ρ) = ζ_L(s)`, so the hypothesis is
  the extended Riemann hypothesis of `L` (RiemannHypothesisStatementsAndConsequences §9.5); for one-dimensional `ρ` it is the
  hypothesis of the primitive Hecke character attached by reciprocity. Under Artin holomorphy of
  every irreducible `ρ`, the extended Riemann hypothesis of `L` holds exactly when the hypothesis holds for
  every irreducible `ρ` of `Gal(L/K)` (the converse product clause of RiemannHypothesisStatementsAndConsequences §9.2: no factor has a pole right of
  `1/2` except the trivial one at `1`, where the others have order `0`).

The Brauer continuation and Brauer's induction theorem are cited as in AnalyticNumberTheoryPartI §2.18a.

*Needs:* AnalyticNumberTheoryPartI §§2.18a, 2.41; RiemannHypothesisStatementsAndConsequences §§9.2, 9.4, 9.5, 11.1.

**Checks.**

- A virtual character with a negative coefficient can have a pole right of `1/2` cancelling a
  zero of another factor; the hypothesis is stated for genuine representations. A genuine
  representation can still have a pole: under Artin holomorphy (AnalyticNumberTheoryPartI §2.41) its L-function has no pole
  except at `1`, of order `dim V^G`, and the trivial representation gives the simple pole of
  `ζ_K`. The predicate allows it.
- For the trivial representation of `Gal(L/K)` it is the extended Riemann hypothesis of `K`.
- Degree above one does not prevent a factorization into Dirichlet L-functions: over `ℚ`,
  `1 ⊕ χ₋₄` has degree two and `L(s, 1 ⊕ χ₋₄) = ζ(s) L(s, χ₋₄)`, Euler factor by Euler factor;
  its hypothesis is the Riemann hypothesis (Mathlib's `RiemannHypothesis`) together with that
  for `χ₋₄` (the converse product clause of RiemannHypothesisStatementsAndConsequences §9.2, `L(1, χ₋₄) = π/4 ≠ 0`).

### Examples

- `K = ℚ`, `𝔪 = (q)∞`: `h_𝔪 = φ(q)`, against the bound `2q`; for `K = ℚ(√3)` and `𝔪` the product of its two real places, `h_K = 1` and `h_𝔪 = 2` (2.9b, class numbers, Checks).
- `K = ℚ(i)`, `𝔪 = 1`: the main term of 2.9b (ii) is `hX ∫Φ₀`, with `∫Φ₀ ≈ 0.00703` for the bump `exp(−1/(t(1 − t)))` on `(0, 1)`; at `X = 1000`, `h = 1/2` and that bump, `φ̃(0.9) ≈ 1.7231 < X^(−0.1)φ̃(1) ≈ 1.7616` (Checks for 2.9b).
- Over `ℚ`, `L(s, 1 ⊕ χ₋₄) = ζ(s) L(s, χ₋₄)`, so the generalized Riemann hypothesis of `1 ⊕ χ₋₄` is the Riemann hypothesis together with that for `χ₋₄` (2.41a, Checks).

### Dependencies

AnalyticNumberTheoryPartI §§0.12, 0.34a, 2.7, 2.18a, 2.31d, 2.31e, 2.41, 2.43; ZerosOfLFunctions 1.4, 4.4, 6.3–6.4, 8.4, 8.6, 8.7; RiemannHypothesisStatementsAndConsequences §§9.2, 9.4, 9.5, 11.1; ClassFieldTheory Layers 11 and 13; GlobalNumberFields Layers 2 and 9; EffectiveBounds Layer 1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

It owns the statements of its layers above: the Taylor coefficients of the logarithmic derivative of every Dirichlet `L`-function near the line one (0.30b); the mean value of a twisted prime sum inside a zero-free box and the bound for `L′/L(1, χ)` it gives (1.4e–1.4f); the published, exception-tolerant form of the character prime number theorem (1.4g); the Lipschitz and size bounds of the Riesz remainder and its prime number theorem with the exceptional term and in its exception-free form, uniform in the conductor (1.4h–1.4i); the one-sided power-sum inequality behind the repulsion (1.7a); the Deuring–Heilbronn repulsion, the prime number theorem in progressions in Linnik's range with relative error, and Linnik's theorem (1.7b); the bound for ray class numbers and the short-interval prime ideal theorem in ray classes of number fields of fixed degree, with an effective polynomial gap for the exceptional zero and the imaginary quadratic norm form (2.9b); and the generalized Riemann hypothesis of an Artin `L`-function with its first properties (2.41a).

The theory these statements extend is owned by [AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md), with the zero-free regions, zero counts and explicit formulas of [ZerosOfLFunctions](../../ZerosOfLFunctions/README.md). The following statements are AnalyticNumberTheoryPartI's and are not restated here:

- The mollifier zero-density estimate near the line one is AnalyticNumberTheoryPartI §1.7 (Jutila and Montgomery, log-free: `Σ_{q≤Q} Σ*_χ N(σ,T,χ) ≤ C_ε (Q^(5+ε) T^(3+ε))^(1−σ)` for `1/2 ≤ σ ≤ 1`). Its two consequences used here are one-line specialisations: (a) at `σ = 1 − δ₀`, `T = Q`, at most `C_ε Q^((8+2ε)δ₀)` primitive characters of conductor `≤ Q` have a zero with `Re s > 1 − δ₀`, `|Im s| ≤ Q`; (b) at `Q = q`, `Σ_{χ mod q} N(σ,T,χ) ≤ C_ε (q^(5+ε)T^(3+ε))^(1−σ)` (the log-free density for one modulus), because the characters modulo `q` are induced by distinct primitive characters of conductor `≤ q` with the same zeros in `Re s > 0`.
- The prime number theorem for a character without exceptional zero is AnalyticNumberTheoryPartI §0.18 (exception-free through AnalyticNumberTheoryPartI §0.34). 1.4g is its published form with the exceptional term, and 1.4g (b) with AnalyticNumberTheoryPartI §0.34 gives AnalyticNumberTheoryPartI §0.18. Conversely, AnalyticNumberTheoryPartI §§0.18 and 0.34 give 1.4g (b) (at a width `c₁ ≤ min(c_LS, 1)` the window of 1.4g (b) contains no zero), and AnalyticNumberTheoryPartI §0.34 alone gives the repulsion 1.7b (i) (with `c ≤ c_LS` its right side is negative, as in its Checks). This roadmap keeps both as targets, proved by routes that do not invoke AnalyticNumberTheoryPartI §0.34, for the routes of 1.4i and 1.7b (ii).
- Page's theorem across moduli (two real characters of moduli `≤ Z` with real zeros above `1 − c₀/log Z` are induced by the same primitive character) is AnalyticNumberTheoryPartI §0.17 read at `N₁N₂ ≤ Z²`, with `c₀ ≤ 3c_star/2`.
- The effective gap `1 − β ≥ c_ε q^(−1/2−ε)` for a real zero `β ∈ (1/2, 1)` of a real primitive character of conductor `q` is AnalyticNumberTheoryPartI §0.12, stated there for the field characters `χ_D`; AnalyticNumberTheoryPartI §0.34a identifies every real primitive character with such a `χ_D`. It covers every use of a gap here; no ineffective Siegel bound enters any target of this roadmap.
- Landau–Page for an abelian character product is AnalyticNumberTheoryPartI §2.43 (i); 2.9b (i) is its corollary for a ray class group.

The Riesz sums of an `L`-series and the Riesz remainder of a primitive character, the zero-free half-planes, the generalized Riemann hypothesis of a Dirichlet character, the extended Riemann hypothesis of a number field, and primitive Dirichlet characters read as primitive ray class characters of `ℚ` are owned by [RiemannHypothesisStatementsAndConsequences](../RiemannHypothesisStatementsAndConsequences/README.md). Artin `L`-functions, their Brauer continuation and Artin holomorphy are AnalyticNumberTheoryPartI §§2.18a and 2.41; ray class groups and the ray class number formula are GlobalNumberFields Layer 2, in the Tau Ceti library; the class-number bound `h_K ≤ 4^n |d_K|` is EffectiveBounds Layer 1, in the Tau Ceti library.

In this family, [QuadraticTwistSelectionOverPrimes](../QuadraticTwistSelectionOverPrimes/README.md) uses 1.4e, 1.4f and 1.7b; [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) uses 1.4h and the field form of 1.4i (b); [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) and [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) use the least primes `≡ 1 (mod M)` of 1.7b (iii) and the norms from imaginary quadratic fields in short intervals of 2.9b (iv) (c); and [GeneralizedRiemannHypothesisFromWindowBounds](../GeneralizedRiemannHypothesisFromWindowBounds/README.md) uses 2.41a.

## Exact supplier contracts

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§0.1: the `c`-exceptional predicate of a nontrivial primitive quadratic character of conductor `N` (a real zero `β` of `L(s, χ)` with `1 − c/log N < β < 1`), and its comparison with *IsExceptionalZero* of ZerosOfLFunctions 6.3 for small widths (1.4g, 1.4i, 1.7b). §0.2: the prime counts `ψ(x;a,q)` and `π(x;a,q)` (1.7b). §0.11: Mertens's first theorem (1.4f, 1.4h). §0.11b: the uniform Euler logarithmic derivatives (1.4e). §0.12: the effective gap `1 − β ≥ c_ε q^(−1/2−ε)` for a real zero of `L(s, χ_D)` (1.7b, 2.9b (iv)). §0.17: the two-real-zero inequality with its constant `c_star` (1.7b). §0.30: the rational Dirichlet-to-ray-class dictionary (0.30b, 1.4g, 1.4i, 1.7b). §0.30a: the window expansion of `L′/L` for a primitive nonprincipal character (1.4e). §0.34: the uniform exclusion of Landau–Siegel zeros, `(1 − β) log q ≥ c_LS` (1.4i (c), 1.7b (ii)–(iv)). §0.34a: every real primitive character is a field character `χ_D` (1.7b, 2.9b (iv)). §1.4: the half-interval explicit formula, with its integer `k₀` (1.4g). §§1.4c–1.4d: the kernel bound and the sum of the weights `min(1, 1/|ρ|)` over the zeros of bounded height (1.4g, 1.7b (ii)). §1.7: the log-free zero-density estimate (1.7b (ii)). §2.7: the factorization of the zeta function of a quadratic extension (2.9b (iv) (a)). §2.18a: the Brauer continuation `L_K(·, ρ)` of an Artin `L`-function, its behaviour under induction, inflation and sums, and the one-dimensional comparison (2.41a). §2.31d: the discriminant tower formula, and §2.31e: its interface for the quadratic subfield carrying a near-one Dedekind zero (2.9b (iv) (a)). §2.41: Artin holomorphy as a hypothesis and the completed functional equation (2.41a). §2.43 (i): Landau–Page for an abelian character product, with its threshold (2.9b (i)).

### From TauCetiRoadmap.AnalyticNumberTheoryPartIII

8.3: Landau's local logarithmic-derivative lemma: for `0 < r₁ < r₂ < 1` there is `C(r₁, r₂)` such that, if `f` is holomorphic near `|z − z₀| ≤ R`, `f(z₀) ≠ 0` and `|f| ≤ e^M |f(z₀)|` on that disc, then `|f′/f(z) − Σ_ρ m_ρ/(z − ρ)| ≤ C(r₁, r₂) M/R` for `|z − z₀| ≤ r₁R` with `f(z) ≠ 0`, the sum over the zeros with `|ρ − z₀| ≤ r₂R` (0.30b).

### From TauCetiRoadmap.ZerosOfLFunctions

| Section | Exact contract |
| --- | --- |
| ZerosOfLFunctions 1.4 | The digamma bound `O(log(|t| + 2))` for the logarithmic derivatives of the gamma factors (2.9b (ii)). |
| ZerosOfLFunctions 3.3–3.4 | Pole-cleared conductor-uniform convexity at fixed degree and bounded shifts: the polynomial growth on wide vertical strips of `(s − 1)ζ(s)` and of primitive Dirichlet `L`-functions (0.30b). |
| ZerosOfLFunctions 4.3–4.4 | Jensen's bound for the zeros in a disc from a growth bound and a value at the centre; the local count `O(log analyticConductorAt d (iT))` in a unit disc for Dedekind and Hecke records, constant depending on the degree only (0.30b, 2.9b). |
| ZerosOfLFunctions 6.3–6.4 (4b), (4e), (4f) | *IsExceptionalZero*; the region with at most one real simple zero for a real character, constant depending on the degree only; the deleted Euler factors and their zeros on `Re s = 0`; finiteness below a conductor bound; per-character uniqueness (1.4g, 1.4i, 1.7b, 2.9b). |
| ZerosOfLFunctions 8.3 | The truncated explicit formula for `ζ` (the principal character in 1.7b (ii)). |
| ZerosOfLFunctions 8.4, 8.6 | The Weil explicit formula for smooth compactly supported tests on `(0,∞)`, for `ζ_K` (pole terms `φ̃(0) + φ̃(1)`, gamma term an integral on `Re s = 2`) and for nontrivial primitive Hecke characters (2.9b). |
| ZerosOfLFunctions 8.5 | At `K = ℚ`: `ψ(x) = x + O(x exp(−c√(log x)))`, absolute constants (the trivial character in 1.4i (a)). |
| ZerosOfLFunctions 8.7 | The orthogonality identity `#Cl_𝔪·rayClassPsi 𝔪 c x = Σ_ψ conj ψ(c) ψ_K(x,ψ)` and the exceptional term *exceptionalRayClassTerm* (2.9b). |

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

8.4a (a): Riesz sums: for `a : ℕ → ℂ` with `LSeriesSummable a σ` for every `σ > 1`, `c > 1` and `y > 0`, `Σ_{n≤y} a(n)(y/n − 1) = (2πi)^(−1) ∫_{(c)} LSeries a s · y^s ds/(s(s − 1))`, absolutely convergent (1.4e). 8.4a (b): the Riesz remainder `G_χ(y)` of a primitive character, `Σ_{n≤y} Λ(n)χ(n)(y/n − 1) + y(L′/L)(1, χ)` for `χ ≠ 1`, and `Σ_{n≤y} Λ(n)(y/n − 1) − y log y + (1 + γ)y` at level `1` (1.4h–1.4i). 9.2: zero-free half-planes, with the product clause and its converse (2.41a). 9.4 and 9.5: the generalized Riemann hypothesis of a Dirichlet character, read on the characters of `ℚ` by the rational bullet of 9.5, and the extended Riemann hypothesis of a number field (2.41a). 11.1: primitive Dirichlet characters as primitive ray class characters of `ℚ` (2.41a).

### From TauCetiRoadmap.ClassFieldTheory

Layer 11: global Artin reciprocity, identifying the finite one-dimensional Galois characters with primitive finite-order Hecke characters, and the characters of an abelian field `E ⊆ ℚ(ζ_{f_E})` with Dirichlet characters modulo `f_E` (1.4i (b), 2.9b (i), (iv) (a)). Layer 13: the conductor–discriminant formula (2.9b (iv) (a)).

### From TauCetiRoadmap.GlobalNumberFields

Layer 2: moduli, ray class groups and the ray class number formula, with the ray class groups and units of imaginary quadratic fields (2.9b). Layer 9: Hecke and ray class characters and the finiteness of ray class groups (2.9b).

### From TauCetiRoadmap.ArithmeticDirichletSeries

Layer 6: partial summation, used to pass from `θ(t;a,q)` to `π(x;a,q)` (1.7b (ii)).

### From TauCetiRoadmap.EffectiveBounds

Layer 1: the class-number bound `NumberField.classNumber_le_bound`, `h_K ≤ 4^n |d_K|` for a number field `K` of degree `n`. It rests on Mathlib's `NumberField.exists_ideal_in_class_of_norm_le` (in every ideal class, an integral ideal of norm at most the Minkowski bound `(4/π)^(r₂)(n!/n^n)√|d_K|`) and on that layer's explicit ideal count `NumberField.card_ideal_absNorm_le` (at most `2^n X²` integral ideals of norm `≤ X`, for `X ≥ 1`). The class-number bound of 2.9b takes it.

### From Mathlib

`DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_changeLevel`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `DirichletCharacter.LFunction_apply_one_ne_zero`, `DirichletCharacter.LSeries_twist_vonMangoldt_eq` and `DirichletCharacter.sum_char_inv_mul_char_eq` (0.30b, 1.4e, 1.4h, 1.4i, 1.7b); `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Cauchy's estimate, 0.30b); `Chebyshev.psi_le`, `Chebyshev.psi_le_const_mul_self` and `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log` (1.4g, 1.4h, 1.4i, 1.7b); `LSeries_eq_mul_integral'`, `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, `log_deriv_riemannZeta_add_inv_sub_sub_isBigO` and `Real.eulerMascheroniConstant` (1.4h, 1.4i); `NumberField.classNumber` (2.9b).

### From Tau Ceti

`TauCeti.Real.logIntegral` (1.7b); `TauCeti.GlobalNumberFields.RayClassGroup` and `TauCeti.GlobalNumberFields.card_rayClassGroup_mul_index` (2.9b).

## References

- P. X. Gallagher, *A large sieve density estimate near σ = 1*, Invent. Math. 11 (1970), 329–339 (Gallagher 1970): Theorem 7, (29), p. 337, the prime sums over short intervals for the primitive characters of all moduli up to `Q`, with the remark after (29) on an exceptional zero (1.7b (ii)); (26)–(27), p. 336, the Landau–Page region and its widening near an exceptional zero (1.7b (i)).
- U. V. Linnik, *On the least prime in an arithmetic progression. I. The basic theorem*, Rec. Math. (Mat. Sbornik) N.S. 15(57) (1944), 139–178 (Linnik 1944 I): (2), p. 139, the bound for the least prime (1.7b (iii)); *II. The Deuring–Heilbronn phenomenon*, the same volume, 347–368 (Linnik 1944 II): the Theorem, p. 347, that bound for every residue class (1.7b (iii)), and §3, the second basic theorem, p. 348, the repulsion (1.7b (i)).
- S. Knapowski, *On Linnik's theorem concerning exceptional L-zeros*, Publ. Math. Debrecen 9 (1962), 168–178: the repulsion for the characters of one modulus, the form of 1.7b (i), as Gallagher 1970, p. 337, credits it.
- Enrico Bombieri, *Le grand crible dans la théorie analytique des nombres*, Astérisque 18 (second edition, 1987) (Bombieri 1987): §6, Théorème 13, p. 39, Linnik's theorem with an effectively computable constant (1.7b (iii)); Théorème 16, p. 41, the Deuring–Heilbronn phenomenon for the primitive characters of moduli up to `T` (1.7b (i)).
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53 (2004): Theorem 5.27 (1.4g (b)); Chapter 18, a textbook account of the results of 1.7b.
- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Ann. of Math. 191 (2020), read as arXiv:1709.01022v1: Theorem 5, (26), p. 17, the character prime number theorem with the exceptional term, there quoted as Iwaniec–Kowalski Theorem 5.27 (1.4g (b)).
- Harold Davenport, *Multiplicative Number Theory*, 2nd ed., revised by Hugh L. Montgomery, Graduate Texts in Mathematics 74, Springer, 1980; Chapters 18–20: the prime number theorem for a character with its exceptional term, whose partial summation gives 1.4i.
- J. C. Lagarias and A. M. Odlyzko, *Effective versions of the Chebotarev density theorem*, in *Algebraic Number Fields* (A. Fröhlich, ed.), Academic Press (1977): the uniform explicit-formula method of 2.9b.
- Harold M. Stark, *Some effective cases of the Brauer–Siegel theorem*, Invent. Math. 23 (1974), 135–152, Lemma 8, pp. 145–146: the quadratic subfield carrying a near-one Dedekind zero, with the threshold `1/(4 d! log D_E)` (2.9b (iv) (a)).
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of 1.4e–1.4f (the mean value inside a zero-free box) and of the route of 1.7b (i) (positivity of four logarithmic derivatives at `2` and `2 + iγ`, the local expansion of 0.30b, the cancellation of the pole against the exceptional zero and the power-sum inequality of 1.7a).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
