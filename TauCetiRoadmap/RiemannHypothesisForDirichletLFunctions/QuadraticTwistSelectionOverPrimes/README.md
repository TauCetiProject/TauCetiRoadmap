# Roadmap: quadratic twists selected over primes

**Summary.** For `m₀ ≥ 1`, a residue `a₀` prime to `m₀` and `U ≥ 4`, let `P = P(m₀, a₀; U)` be the set of primes `q ≡ a₀ (mod m₀)` with `√U < q ≤ U`. This roadmap averages Jacobi symbols `(n/q)` over the primes `q ∈ P` against short moduli and uses the averages to select auxiliary primes. Quadratic reciprocity on the class turns `(n/q)` into a fixed sign times `(q/s)` for the odd part `s` of `n` prime to `m₀`, and the prime number theorem in progressions makes the characters `q ↦ (q/s)` nearly orthogonal on `P`. From this follow a mean square of quadratic twists of short weighted prime sums over the prime moduli `q ∈ P`, its maximal form on a whole window of scales, and the selection of the primes `q` whose quadratic twists have a zero-free box near `s = 1`, a bounded logarithmic derivative at `1` and square-root cancellation in their smoothed prime sums. For a nonprincipal Dirichlet character `χ` write `G_χ(y) = Σ_{n≤y} Λ(n) χ(n) (y/n − 1) + y (L′/L)(1, χ)`.

The headline theorems are these. (1) There are absolute `L, c, C` such that for `8 ∣ m₀`, `a₀` prime to `m₀` and every odd squarefree `s > 1` prime to `m₀` with `m₀s ≤ U^(1/L)`, `|Σ_{q∈P} (q/s)| ≤ C |P| (e^(−c log U/log(m₀s)) + e^(−c√log U))` and `|P| ≥ U/(3φ(m₀) log U)`; the form that keeps the term of a possible exceptional zero allows one exceptional modulus `s`. (2) Twist selection: fix `δ₀ ∈ (0, 1/12)`, `K ≥ 1`, `τ, η, ε > 0`, `R ∈ ℕ`, `0 < b < 1/4` and `0 ≤ a < 1/2`. There are `C₁, Y₀` depending only on `(δ₀, K, τ, η, R, a, b)` and `C₂` depending only on `(δ₀, ε)` such that, whenever `Y ≥ Y₀`, `C₁ log Y·(log m₀ + log Y) ≤ log U`, `1 ≤ F ≤ U^(1/2)`, `log(FU) ≤ Y^b` and at most `Y^a` primes `p ≤ Y^(K/δ₀)` divide `m₀`, and `Ξ` is a set of at most `R` primitive Dirichlet characters of conductor `≤ F`, the set `P` is nonempty and all but at most `η|P|` primes `q ∈ P` have the following property for every `ξ ∈ Ξ`: the primitive character `χ` inducing `ξ·(·/q)` has `L(s, χ) ≠ 0` for `Re s > 1 − δ₀` and `|Im s| ≤ FU`, satisfies `|(L′/L)(1, χ)| ≤ ((2 + ε)/δ₀) log log(FU) + C₂`, and satisfies `|G_χ(y)| ≤ y^(1/2+τ)` for every `y ∈ [Y, Y^K]`. (3) Two-step selection: with the same constants, let `Ξ₀` be a set of primitive characters of conductor `≤ N₀`, let `(m₁, a₁, U₁)` satisfy the hypotheses of (2) with a conductor bound `F₁ ≥ N₀`, and for each `q ∈ P(m₁, a₁; U₁)` let `(m₂(q), a₂(q), U₂)` satisfy them with a conductor bound `F₂(q) ≥ N₀q`. Then a proportion at least `1 − η` of the `q`, and for each such `q` a proportion at least `1 − η` of the `d ∈ P(m₂(q), a₂(q); U₂)`, make every twist `ξ·(·/q)^i·(·/d)^j` with `ξ ∈ Ξ₀` and `(i, j) ≠ (0, 0)` satisfy the three conclusions of (2), with box height `F₁U₁` if `j = 0` and `F₂(q)U₂` if `j = 1`.

The roadmap extends Layer 2 of [SieveMethodsAndPrimePatterns](../../SieveMethodsAndPrimePatterns/README.md), whose quadratic large sieve averages real characters over many moduli; here the average is over the primes of one residue class, and no large sieve is needed. Its analytic inputs are Mertens's theorem, the effective gap for real zeros, Page's theorem across moduli and the log-free zero-density estimate of [AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md), and the prime number theorem in progressions in Linnik's range and the control of smoothed prime sums by zero-free boxes of [RieszSumsOverPrimesAndExceptionalZeros](../RieszSumsOverPrimesAndExceptionalZeros/README.md). In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the two-step selection provides the auxiliary primes of the cyclic hosts of ThetaChainsAndFrobeniusPrimeSums, a later roadmap of the family.

There is one layer, numbered 2 after the layer of SieveMethodsAndPrimePatterns it extends. Its section 2.7a proves reciprocity on a residue class and the orthogonality of the characters `q ↦ (q/s)` on `P`, with one exceptional modulus and, through the exclusion of Landau–Siegel zeros, without one; 2.7b deduces the mean square of short twisted prime sums and, by a Sobolev inequality on dyadic blocks, its maximal form on a window; 2.7c completes the selection with the zero-free boxes of a zero-density estimate; and 2.7d applies it twice, to two primes chosen in succession.

## Conventions

For `m₀ ≥ 1`, `a₀` coprime to `m₀` and `U ≥ 4`, `P(m₀, a₀; U)` is the finite set of
primes `q ≡ a₀ (mod m₀)` with `√U < q ≤ U`. `(n/q)` is Mathlib's `jacobiSym n q`. For `n ≥ 1`, `s_{m₀}(n)` is the
product of the primes `p ∤ m₀` dividing `n` to an odd power. For `y > 0`, `c_y(n) = Λ(n) min(1, y/n)`; for a
cutoff `Z ≥ 1`, a prime `q` and `κ : ℕ → ℂ`, `S_Z(y; q, κ) = Σ_{n≤Z} c_y(n) κ(n) (n/q)`. For a nonprincipal Dirichlet
character `χ`,
```text
G_χ(y) = Σ_{n≤y} Λ(n) χ(n) (y/n − 1) + y (L′/L)(1, χ),     T_Z(χ) = −(L′/L)(1, χ) − Σ_{n≤Z} Λ(n) χ(n)/n ,
```
with `(L′/L)(1,χ) = deriv (DirichletCharacter.LFunction χ) 1 / DirichletCharacter.LFunction χ 1`, defined because
`L(1,χ) ≠ 0` (Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`). For primitive `χ`, `G_χ` is the Riesz
remainder of RiemannHypothesisStatementsAndConsequences §8.4a (b); `G_χ` for imprimitive `χ` and `T_Z(χ)` are notation
for expressions, not new definitions. Prime counts in progressions are written `π(x;q,a)`, `ψ(x;q,a)` as in SieveMethodsAndPrimePatterns; they are
AnalyticNumberTheoryPartI §0.2's `primeCountAP` and `psiAP`, which that roadmap writes `π(x;a,q)`, `ψ(x;a,q)`.
`Li` is Tau Ceti's `TauCeti.Real.logIntegral`, `Li x = ∫_2^x dt/log t`, the function written `li` in SieveMethodsAndPrimePatterns Layer 3.

`Suggested.lean` writes `P(m₀, a₀; U)` as `primesInClass m₀ a₀ U` and `G_χ(y)` as `rieszRemainder χ y`; the hypotheses of 2.7c on `(m₀, a₀, U, F)` at the scale `Y` are `SelectionHypotheses`, and its conclusions (a)–(c) for one character, with box height `H` in (a) and in (b), are `TwistBounds`.

Notation and conventions not restated here are those of the Conventions of SieveMethodsAndPrimePatterns and of AnalyticNumberTheoryPartI; exceptional pairs modulo `q` are those of the Convention of RieszSumsOverPrimesAndExceptionalZeros §1.7b.

## Layer 2: Quadratic twists over primes in a progression and twist selection

The sections 2.7a–2.7d average Jacobi symbols over the primes of one residue class: reciprocity on the class and the prime number theorem in progressions give orthogonality, the mean square of short twisted prime sums follows, a Sobolev inequality on dyadic blocks passes from one point to a whole window, and the zero-free boxes of a zero-density estimate complete the selection.

### 2.7a Jacobi symbols over the primes of a residue class

**(i) Reciprocity on a residue class.** Let
`8 ∣ m₀`, `gcd(a₀, m₀) = 1` and `n ≥ 1`. There is `ε = ε(m₀, a₀, n) ∈ {1, −1}` such that every prime
`q ≡ a₀ (mod m₀)` with `q ∤ n` satisfies `(n/q) = ε · (q / s_{m₀}(n))`.

*Proof sketch.* Square factors of `n` contribute `1`. For `p = 2`, `(2/q)` depends on `q mod 8`, which is fixed.
For an odd `p ∣ m₀`, `8p ∣ m₀`, and reciprocity makes `(p/q)` a function of `q mod 4p`, which is fixed. For an
odd `p ∤ m₀` with odd exponent, `(p/q) = ±(q/p)` with the sign fixed by `q mod 4`. Multiply.

**Checks.**

- `m₀ = 8`, `a₀ = 3`, `n = 2`: `s = 1` and `(2/q) = −1` for every `q ≡ 3 (mod 8)`, so `ε = −1`.
- `m₀ = 8`, `a₀ = 3`, `n = 3`: `s = 3`, `ε = −1`; at `q = 11`, `(3/11) = 1` and `−(11/3) = −(2/3) = 1`.

*Needs:* Mathlib `jacobiSym.quadratic_reciprocity`, `jacobiSym.at_two`, `ZMod.χ₈`.

**(ii) Nontriviality and separation on the class of `1`.** For odd squarefree `s > 1` coprime to `m₀`, `u ↦ (u/s)` is a
nontrivial character of `{u ∈ (ℤ/m₀s)ˣ : u ≡ 1 (mod m₀)}`; for distinct odd squarefree `s₁, s₂` coprime to `m₀`,
`(·/s₁)` and `(·/s₂)` differ somewhere on `{u ≡ 1 (mod m₀), gcd(u, s₁s₂) = 1}`.

*Proof sketch.* Chinese remainder theorem: `u ≡ 1 (mod m₀)`, `u` a nonresidue modulo one prime `p ∣ s` (for the
second claim a prime dividing exactly one of `s₁, s₂`), `u ≡ 1` modulo the other primes.

*Needs:* Mathlib `ZMod.chineseRemainder`, `legendreSym.eq_neg_one_iff`.

**(iii) Orthogonality for all but one short modulus.** For `A, B > 0` there are `C₁` and `Y₀` such that for
every `Y ≥ Y₀`, every `m₀` with `8 ∣ m₀`, every `a₀` coprime to `m₀` and every `U` with
```text
C₁ log Y · (log m₀ + log Y) ≤ log U ,
```
the set `P = P(m₀, a₀; U)` satisfies

- (α) `|P| ≥ c·min(1, (1 − β₁) log U)·U/(φ(m₀) log U)`, where the factor is present only if `m₀` has an exceptional
  pair `(χ₁, β₁)` in the sense of RieszSumsOverPrimesAndExceptionalZeros §1.7b with `χ₁(a₀) = 1`; in particular
  `|P| ≥ c U/(m₀ φ(m₀) log U)`;
- (β) at most one odd squarefree `s` with `1 < s ≤ Y^A` and `gcd(s, m₀) = 1` violates
  `|Σ_{q∈P} (q/s)| ≤ Y^(−B) |P|`; equivalently, there is an integer `s*` such that every such `s ≠ s*` satisfies it.

The constant `c` is absolute and effective; `C₁` and `Y₀` depend only on `A, B`. No upper bound on `U` or `m₀` is
needed.

*Proof sketch.* (α): RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii) for the modulus `m₀` at `U` and `√U` (Linnik's range, since
`log U ≥ C₁ log Y log m₀`); the main term `(Li U − χ₁(a₀) Li(U^(β₁)))/φ(m₀)` is at least
`U(1 − U^(β₁−1))/(φ(m₀) log U)`, that at `√U` is `O(√U/φ(m₀))`, and the relative error is small. The second form uses
`1 − β₁ ≥ c m₀^(−3/4)` (AnalyticNumberTheoryPartI §0.12 through AnalyticNumberTheoryPartI §0.34a).

(β): split `Σ_{q∈P} (q/s)` along the classes `b mod M`, `M = m₀s`, above `a₀`, and apply RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii) to each class at `U`
and at `√U`: `M ≤ m₀Y^A`, and `log √U ≥ L log M` once `C₁ ≥ 2L max(A, 1)`. Write `E^(b)(x)` for the main term of
RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii) for the class `b` at `x`. The main terms `Li U/φ(M)` cancel, because `(·/s)` is nontrivial on the classes
above `a₀` (ii). The exceptional terms `−χ₁(b) Li(U^(β₁))/φ(M)` of the exceptional pair `(χ₁, β₁)` modulo `M` cancel
unless `χ₁` equals `(·/s)` on the class of `1` modulo `m₀`; in that case `χ₁` is not induced from a character modulo
`m₀`, and the surviving term has absolute value `Li(U^(β₁))/φ(m₀)`.

*Non-depletion.* Let `(χ′, β′)` be the exceptional pair modulo `m₀`, if there is one. Either `β′ > 1 − c₁/log M`: then
the character modulo `M` induced by `χ′` vanishes at `β′` (the deleted Euler factors vanish only on `Re s = 0`), so it
forms an exceptional pair modulo `M`, which by uniqueness is `(χ₁, β₁)`, and `χ₁` is induced from `m₀`. Or
`β′ ≤ 1 − c₁/log M`, or there is no pair modulo `m₀`: then `(1 − β′) log U ≥ c₁ log U/log M ≥ c₁C₁ log Y/max(A, 1) ≥ 1`
for `Y ≥ Y₀` (by the hypothesis on `U`, `log U/log M ≥ C₁ log Y/max(A, 1)`), the factor of (α) is `1`, and
`|P| ≥ c Li U/φ(m₀)`. Hence `|P| ≥ c Li U/φ(m₀)` whenever there is no pair modulo `M` or `χ₁` is not induced from `m₀`.

*The surviving exceptional term.* Let `χ₁` equal `(·/s)` on the class of `1`. If `1 − β₁ ≥ c₀/log(m₀Y^A)`, the bound
`Li(U^β) ≤ 3 U^(β−1) Li U` for `β ≥ 1/2` and `U ≥ U₀` (from `Li(U^β) ≤ (1 + o(1)) U^β/(β log U)` and
`Li U ≥ U/log U − O(1)`) bounds the surviving term by
`3 e^(−c₀ log U/log(m₀Y^A)) Li U/φ(m₀) ≤ 3 Y^(−c₀C₁/max(A,1)) Li U/φ(m₀)`, which non-depletion puts below `Y^(−B)|P|/2`
once `C₁` is large. Call `s` bad in the remaining case, `1 − β₁ < c₀/log(m₀Y^A)`. Two bad `s₁, s₂` have exceptional
characters with zeros above `1 − c₀/log(m₀Y^A)`, so by AnalyticNumberTheoryPartI §0.17 (Page's theorem across moduli, `c₀ ≤ 3c_star/2`) they are
induced by the same primitive character; then `(·/s₁) = (·/s₂)` on the class of `1` and `s₁ = s₂` by (ii).

*The relative errors.* They sum to `C(e^(−c log U/log M) + e^(−c√(log U)))` times `Σ_b (E^(b)(U) + E^(b)(√U))`. The part
at `√U` is at most `2 Li(√U)/φ(m₀)`, small against the second form of (α). At `U` there are three cases, and each gives
`Σ_b E^(b)(U) ≤ C′|P|` with `C′ = max(2, 1/c)`; as both exponentials are below `Y^(−B)/(8CC′)` by the hypothesis on
`U`, the relative errors and the surviving exceptional term together stay below `Y^(−B)|P|`. The three cases:
- `χ₁` equals `(·/s)` on the class of `1`: then `χ₁` is not induced from `m₀`, `Σ_b E^(b)(U) = Li U/φ(m₀)`, and
  non-depletion gives `|P| ≥ c Li U/φ(m₀)`;
- the exceptional terms cancel, and there is no pair modulo `M` or `χ₁` is not induced from `m₀`: again
  `Σ_b E^(b)(U) = Li U/φ(m₀)` and `|P| ≥ c Li U/φ(m₀)`;
- `χ₁` is induced by a character `χ′` modulo `m₀`: then `(χ′, β₁)` is the exceptional pair modulo `m₀`, and
  `Σ_b E^(b)(U) = (Li U − χ′(a₀) Li(U^(β₁)))/φ(m₀)` is the main term of `|P|` itself, at most `2|P|` by the route of (α).

The relative form of the error is what allows `|P|` itself to be small.

**Checks.**

- The exception `s*` cannot be removed without further input: if a real character `χ₁` modulo `m₀s` with a real
  zero very close to `1` agrees with `(·/s)` on the class of `1`, then `Σ_{q∈P} (q/s)` has the main term
  `−χ₁(a₀′) Li(U^(β₁))/φ(m₀) ≍ |P|`, where `a₀′` is the class modulo `m₀s` that is `a₀` modulo `m₀` and `1` modulo `s`.
- The factor in (α) is the true order: if `m₀` has an exceptional pair with `χ₁(a₀) = 1` and `(1 − β₁) log U` is
  small, then by RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii) the set `P` has only `≍ (1 − β₁) log U · Li U/φ(m₀)` elements. A
  proof of `|P| ≥ U/(3φ(m₀) log U)` must exclude such a pair, as (iv) does through AnalyticNumberTheoryPartI §0.34.
- The bound `Li(U^β) ≤ 3U^(β−1) Li U` of the route, tested at the ends of `[1/2, 1]`: at `β = 1` it reads
  `Li U ≤ 3 Li U`; at `β = 1/2`, `Li(√U) ∼ 2√U/log U` against `3U^(−1/2) Li U ∼ 3√U/log U`. The leading terms have the
  ratio `1/(3β)`, so no constant below `2` would do.

*Needs:* 2.7a (i)–(ii); RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii); AnalyticNumberTheoryPartI §§0.12, 0.17, 0.34a.

**(iv) Exception-free form.** Prove `abs_sum_jacobiSym_primes_le`. There are absolute `L, c, C` such
that for `8 ∣ m₀`, `a₀` coprime to `m₀`, and every odd squarefree `s > 1` coprime to `m₀` with `m₀s ≤ U^(1/L)`,
```text
|Σ_{q∈P(m₀,a₀;U)} (q/s)| ≤ C |P(m₀,a₀;U)| (e^(−c log U/log(m₀s)) + e^(−c√log U)) ,     |P(m₀,a₀;U)| ≥ U/(3φ(m₀) log U) .
```
*Proof sketch.* As (iii) with RieszSumsOverPrimesAndExceptionalZeros §1.7b (iv) in place of RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii): there is no exceptional term, so no `s*` and no
depletion.

**Checks.**

- The saving must contain `e^(−c√log U)`: for `m₀ = 8` and `s = 3` a bound `e^(−c log U/log(m₀s))` alone would be a
  power saving `U^(−c′)` for `Σ_{q≤U, q≡a₀(8)} (q/3)`, which would need a zero-free strip for the characters
  modulo `24`.

*Needs:* 2.7a (i)–(ii); RieszSumsOverPrimesAndExceptionalZeros §1.7b (iv) (which rests on AnalyticNumberTheoryPartI §0.34).

### 2.7b Mean squares of quadratic twists of short prime sums, and their maximal form

**(i) Algebraic mean-square inequality.** Let `8 ∣ m₀`,
`gcd(a₀, m₀) = 1`, `N ≥ 1`, `P` a finite set of primes `q ≡ a₀ (mod m₀)` with every `q > N²`, `c : ℕ → [0, ∞)`
supported on prime powers `≤ N`, `κ : ℕ → ℂ` with `|κ| ≤ 1`, `η ≥ 0`, and `s*` an integer. Suppose
`|Σ_{q∈P} (q/s)| ≤ η|P|` for every odd squarefree `1 < s ≤ N²` coprime to `m₀` with `s ≠ s*`. Put
`sP(p) = Σ_{k≥1} c(p^k)`, let `B ≥ max_p sP(p)`, and let `RR` be the sum of `c(p^k)` over the prime powers with `k`
even or `p ∣ m₀`. Then
```text
Σ_{q∈P} |Σ_n c(n) κ(n) (n/q)|² ≤ |P| · [ Σ_p sP(p)² + RR² + 2B² + 2B·RR + η (Σ_n c(n))² ] .
```
*Proof sketch.* Expand: the left side is at most `Σ_{n,n′} c(n)c(n′) |Σ_{q∈P} (nn′/q)|`, and
`|Σ_q (nn′/q)| = |Σ_q (q/s_{m₀}(nn′))|` by 2.7a (i) (as `q > nn′`). Bound the inner sum by `|P|` when
`s_{m₀}(nn′) ∈ {1, s*}` and by `η|P|` otherwise. Pairs of prime powers with `s_{m₀}(nn′) = 1` are pairs of powers
of one prime, or pairs of powers of two distinct primes in which each prime power separately has an even exponent or
a base dividing `m₀` (mixed pairs included: at `m₀ = 8`, `n = 9`, `n′ = 2` gives `s_8(18) = 1`); the first kind
contributes at most `Σ_p sP(p)²` and the second at most `RR²`.
For a fixed `r > 1`, `s_{m₀}(nn′) = r` forces `r` to have at most two prime factors that come from `n` and `n′`:
at most `2B² + 2B·RR`.

**Checks.**

- `c = 1_{n=p}` for one prime `p ∤ m₀` and `κ = 1`: the left side is `|P|` (each term `(p/q)² = 1`) and the right
  side is at least `sP(p)² |P| = |P|`.
- At `η = 1` the hypothesis holds for every `P` (as `|Σ_{q∈P} (q/s)| ≤ |P|`), and the right side is at least
  `|P| (Σ_n c(n))²`, which bounds the left side termwise: the content of the inequality lies in small `η`.

*Needs:* 2.7a (i).

**(ii) Mean square of the truncated twisted prime sums.** For `0 ≤ a < 1/2` there is `C = C(a)` such that for `K ≥ 1` and `L₁ ≥ K` there are `C₁` and `Y₀` with: for `Y ≥ Y₀`,
`8 ∣ m₀`, `a₀` coprime to `m₀`, and `U` with `C₁ log Y·(log m₀ + log Y) ≤ log U` and
`#{p ∣ m₀ prime : p ≤ Y^(L₁)} ≤ Y^a`, every `y ∈ [Y, Y^K]` and every `κ` with `|κ| ≤ 1` satisfy
```text
Σ_{q∈P(m₀,a₀;U)} |S_{Y^(L₁)}(y; q, κ)|² ≤ C · y log y · |P(m₀, a₀; U)| .
```
*Proof sketch.* (i) with `N = Z = Y^(L₁)` (every `q > √U ≥ Z²`), `c = c_y` restricted to `n ≤ Z`, and `η = Y^(−(K+1))`
for all `s ≤ Z²` but one, from 2.7a (iii) (β) with `A = 2L₁`, `B = K + 1`. The five terms: `Σ_p sP(p)² ≪ y log y`
(`sP(p) ≤ 3 log y`, and for `p > y`, `sP(p) ≤ 2y log p/p`); `RR ≪ √y + Y^a log y` (even powers contribute `O(√y)`,
each prime dividing `m₀` at most `3 log y`, and there are at most `Y^a ≤ y^a` of them), so `RR² ≪_a y log y` because
`2a < 1`; `B² ≪ log² y`; `B·RR ≪ √y log y + y^a log² y`; and `η(Σ_{n≤Z} c_y(n))² ≤ Y^(−(K+1))(C y L₁ log Y)² ≪ y` by
Mertens, since `y ≤ Y^K`. The bound is uniform in `κ`; the trivial bound is `(y log Z)² |P|`.

*Needs:* 2.7b (i), 2.7a (iii); AnalyticNumberTheoryPartI §0.11; Mathlib `Chebyshev.psi_le_const_mul_self`.

**(iii) From one point to a window.** Let `P` be a finite set,
`2 ≤ Y ≤ X`, `M ≥ 0`, and for `q ∈ P` let `f_q, g_q : [Y, X] → ℂ` with `g_q` integrable and
`f_q(y) = f_q(Y) + ∫_Y^y g_q(v) dv` for every `y ∈ [Y, X]`, such that
```text
Σ_{q∈P} |f_q(y)|² ≤ M y log y |P|   (y ∈ [Y, X]),        Σ_{q∈P} |g_q(v)|² ≤ M (log v / v) |P|   (a.e. v ∈ [Y, X]) .
```
Then for every `τ > 0` the number of `q ∈ P` with `|f_q(y)| > y^(1/2+τ)/2` for some `y ∈ [Y, X]` is at most
`C_τ M Y^(−τ) |P|`, with `C_τ` depending only on `τ`.

*Proof sketch.* Cover `[Y, X]` by blocks `[Y′, W]`, `Y′ = 2^i Y`, `W = min(2Y′, X)`. On a block,
`|f_q(y)|² ≤ 2|f_q(Y′)|² + 2Y′∫_{Y′}^W |g_q|²` (the primitive form and Cauchy–Schwarz), so for any choice of points
`y_q` in the block, `Σ_q |f_q(y_q)|² ≤ 4M Y′ log(2Y′)|P|`. Markov's inequality with threshold `Y′^(1+2τ)/4` bounds the
bad `q` of the block by `16M log(2Y′) Y′^(−2τ)|P|`; sum the geometric series over `i`. No grid in `y`, no
monotonicity and no differentiability are used: the mean square of `g_q` replaces them.

**Checks.**

- The hypothesis on `g_q` cannot be dropped: for `X ≥ 2Y` take `n ≥ 2^(1+2τ) Y^(2τ)/(M log Y)` functions `f_q` with
  disjoint supports in `[Y, 2Y]`, each a bump of height `(2Y)^(1/2+τ)`. At each `y` at most one is nonzero, so
  `Σ_q |f_q(y)|² ≤ (2Y)^(1+2τ) ≤ M y log y · n`, while every `q` is counted; the conclusion `C_τ M Y^(−τ) n` fails for
  large `Y`. With the second hypothesis such bumps would need `n ≤ M Y^(−2τ) log Y`, incompatible with the first.

*Needs:* Mathlib interval integrals, `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` (Hölder's inequality, here
with exponents `2, 2`, applied to `|g_q|` and `1`).

**(iv) Maximal form for the twisted prime sums.** Under
the hypotheses of (ii), for `τ, η > 0` and `Y ≥ Y₀(K, L₁, a, τ, η)`, at most `η|P(m₀, a₀; U)|` primes `q` have
`|S_{Y^(L₁)}(y; q, κ)| > y^(1/2+τ)/2` for some `y ∈ [Y, Y^K]`.

*Proof sketch.* `min(1, y/n) − min(1, Y/n) = ∫_Y^y 1_{v<n} dv/n`, so `y ↦ S_Z(y; q, κ)` has the primitive form of (iii)
with `g_q(v) = D_q(v) = Σ_{v<n≤Z} Λ(n)κ(n)(n/q)/n`, a step function, and `v D_q(v) = S_Z(v; q, κ·1_{(v,∞)})` is a sum of
the same shape with coefficients bounded by `1`. So (ii), applied to `κ` and to `κ·1_{(v,∞)}`, gives both hypotheses
of (iii) with `M = C`.

*Needs:* 2.7b (ii)–(iii).

### 2.7c Twist selection

**Twist selection.** Prove `twistSelection`. Fix a box width `δ₀ ∈ (0, 1/12)`, `K ≥ 1`, `τ > 0`,
`η > 0`, `R ∈ ℕ`, exponents `0 < b < 1/4` and `0 ≤ a < 1/2`, and `ε > 0`. There are `C₁` and `Y₀`, depending only on
`(δ₀, K, τ, η, R, a, b)`, and `C₂` depending only on `(δ₀, ε)`, such that for every `Y ≥ Y₀`, every `m₀ ≥ 1`, every `a₀`
coprime to `m₀`, every `U` and `F`, and every set `Ξ` of at most `R` primitive Dirichlet characters of conductor
`≤ F`, if
```text
C₁ log Y · (log m₀ + log Y) ≤ log U,     1 ≤ F ≤ U^(1/2),     log(FU) ≤ Y^b,     #{p ∣ m₀ prime : p ≤ Y^(K/δ₀)} ≤ Y^a,
```
then `P = P(m₀, a₀; U)` is nonempty and all but at most `η|P|` primes `q ∈ P` satisfy, for every `ξ ∈ Ξ` and the
primitive character `χ` inducing `ξ·(·/q)` (of conductor `cond(ξ)·q`):

- (a) `L(s, χ) ≠ 0` for `Re s > 1 − δ₀` and `|Im s| ≤ FU`;
- (b) `|(L′/L)(1, χ)| ≤ ((2 + ε)/δ₀) log log(FU) + C₂`;
- (c) `|G_χ(y)| ≤ y^(1/2+τ)` for every `y ∈ [Y, Y^K]`.

The values `b = 1/5`, `a = 1/4` are one admissible choice.

*Proof sketch.* First let `8 ∣ m₀`. For `0 < x ≤ Z`, `G_χ(x) = −Σ_{n≤Z} Λ(n) min(1, x/n) χ(n) − x T_Z(χ)` (expand
`min(1, x/n)` and `(L′/L)(1,χ)`). Take `Z = Y^(K/δ₀)`; since `χ(n) = ξ(n)(n/q)` for every `n`, the sum is `S_Z(x; q, ξ)`.
Let `B₁` be the set of `q` for which some `ξ·(·/q)` has a zero in the box of (a): each such `q` is the largest prime
factor of the conductor `cond(ξ)·q ≤ FU` of a primitive character with a zero in `Re s > 1 − δ₀`, `|Im s| ≤ FU`
(`q > √U ≥ F ≥ cond(ξ)`), so by AnalyticNumberTheoryPartI §1.7 at `σ = 1 − δ₀`, `T = Q = FU`,
`|B₁| ≤ C_ε′ (FU)^((8+2ε′)δ₀) ≤ C_ε′ U^((3/2)(8+2ε′)δ₀)`, which is `≤ (η/2)|P|` for `ε′` small, because `δ₀ < 1/12` and
`|P| ≥ U^(1−o(1))` (2.7a (iii) (α), with `log m₀ ≤ log U/(C₁ log Y)`). For `q ∉ B₁`, RieszSumsOverPrimesAndExceptionalZeros §1.4e's corollary at `x = Y^K` and a
small `δ` gives `x|T_Z(χ)| ≤ K′ (log FU)² Y^(Kδ/δ₀) ≤ K′ Y^(2b + Kδ/δ₀) ≤ Y^(1/2)/2` once `Kδ/δ₀ < 1/2 − 2b` (here
`FU ≥ x^(1/δ₀+3)` by the lower bound on `log U`), and RieszSumsOverPrimesAndExceptionalZeros §1.4f with `Q = FU` gives (b). Let `B₂(ξ)` be the set of `q` with
`|S_Z(y; q, ξ)| > y^(1/2+τ)/2` for some `y ∈ [Y, Y^K]`; by 2.7b (iv) with `L₁ = K/δ₀`, `|B₂(ξ)| ≤ (η/(2R))|P|`. Outside
`B₁ ∪ ⋃_ξ B₂(ξ)`, (a)–(c) hold. All thresholds are fixed before `m₀, a₀, U, F, Ξ`. For general `m₀`, put
`m₀′ = lcm(m₀, 8) ≤ 8m₀`: `P(m₀, a₀; U)` is the disjoint union of the at most four sets `P(m₀′, a′; U)` over the classes
`a′` modulo `m₀′` above `a₀` that are prime to `m₀′`. Each satisfies the hypotheses with `C₁` replaced by `C₁/2` (as
`log m₀′ ≤ log m₀ + 3`) and with the count exponent `a′ = (a + 1/2)/2 < 1/2` (the prime `2` adds at most `1` to the
count); apply the case `8 ∣ m₀` to each and add.

**Checks.**

- `R = 0` (`Ξ` empty): the statement only asserts `P ≠ ∅`, which is 2.7a (iii) (α) (for `8 ∣ m₀`).
- The window `[Y, Y^K]` is reached although no single `y` is controlled for all `q`: the exceptional proportion
  of 2.7b (iii) is `≪ Y^(−τ)`, while each fixed `y` already loses `y^(−2τ) log y`.
- (b) gives `|(L′/L)(1,χ)| ≤ C log Y` for every `C > 2b/δ₀` whenever `log(FU) ≤ Y^b` and `Y` is large (take `ε` with
  `(2 + ε)b/δ₀ < C`); a consumer needing a specific constant `C` turns this into a constraint on `b` and `δ₀`.
- The width cannot be fixed at any `δ₀ ≥ 1/12` by this route: AnalyticNumberTheoryPartI §1.7 then allows as many characters with a zero in
  the box as there are primes in `P`.
- The constraint on `b`: (c) needs the tail `y|T_Z(χ)| ≤ K′(log FU)² Y^(Kδ/δ₀) ≤ Y^(2b + Kδ/δ₀)·K′` to be at most
  `Y^(1/2+τ)/2` for some `δ > 0`, that is `2b < 1/2 + τ`. The statement's `b < 1/4` gives the tail below `Y^(1/2)/2`
  and so serves every `τ > 0` with one `b`; for a fixed `τ` the route also works for `b < 1/4 + τ/2` (at `τ = 1/10`,
  `b = 0.299` leaves the room `0.002`, `b = 0.301` none). The constraint `a < 1/2` is what the route needs: 2.7b (ii)
  needs `(Y^a log y)² ≪ y log y` on `[Y, Y^K]`, which fails at `y = Y` for `a = 1/2` by a factor `log Y`.

*Needs:* 2.7a (iii), 2.7b (iv); RiemannHypothesisStatementsAndConsequences §8.4a (b) (the remainder `G_χ` of (c)); RieszSumsOverPrimesAndExceptionalZeros §1.4e (with its corollary), RieszSumsOverPrimesAndExceptionalZeros §1.4f; AnalyticNumberTheoryPartI §§0.11, 1.7.

### 2.7d Twisting by two primes chosen in succession

**(i) Two-step selection.** Fix `δ₀, K, τ, η, a, b, ε` as in 2.7c,
`N₀ ≥ 1`, and let `Ξ₀` be a set of primitive characters of conductor `≤ N₀`. There are `C₁, Y₀` (depending on
`δ₀, K, τ, η, a, b` and `|Ξ₀|`) such that the following holds for `Y ≥ Y₀`. Let `(m₁, a₁, U₁)` satisfy the hypotheses
of 2.7c with `F = N₀`, and for each `q ∈ P(m₁, a₁; U₁)` let `(m₂(q), a₂(q), U₂)` satisfy them with `F = N₀ q`. Then a
proportion at least `1 − η` of the `q ∈ P(m₁, a₁; U₁)`, and for each such `q` a proportion at least `1 − η` of the
`d ∈ P(m₂(q), a₂(q); U₂)`, have the property: for every `ξ ∈ Ξ₀` and `(i, j) ∈ {0,1}² ∖ {(0,0)}`, the primitive
character inducing `ξ·(·/q)^i·(·/d)^j` satisfies (a)–(c) of 2.7c, with box height `N₀U₁` if `j = 0` and `N₀qU₂`
if `j = 1`. Both sets of primes are nonempty.

**(ii) Larger conductor bounds.** Prove `twistSelection_two_of_conductorBound`. With `δ₀, K, τ, η, a, b,
ε, N₀, Ξ₀` and the same `C₁, Y₀` as in (i), let `Y ≥ Y₀`, let `F₁ ≥ N₀`, and for each `q ∈ P(m₁, a₁; U₁)` let
`F₂(q) ≥ N₀q`. If `(m₁, a₁, U₁)` satisfies the hypotheses of 2.7c with `F = F₁`, and each `(m₂(q), a₂(q), U₂)` satisfies
them with `F = F₂(q)`, then the conclusion of (i) holds with box height `F₁U₁` if `j = 0` and `F₂(q)U₂` if `j = 1`, and
with `F₁U₁`, `F₂(q)U₂` in place of `FU` in the bound (b) of 2.7c. In particular `F₁ = N₀` and `F₂(q) = N₀U₁`, the same
for every `q` (as `q ≤ U₁`), give the height `N₀U₁U₂` for the twists with `j = 1`, whenever `N₀U₁ ≤ U₂^(1/2)` and
`log(N₀U₁U₂) ≤ Y^b`.

*Proof sketch.* 2.7c on `P(m₁, a₁; U₁)` with `Ξ = Ξ₀` gives the pairs `(i, j) = (1, 0)`. For a good `q`, 2.7c on
`P(m₂(q), a₂(q); U₂)` with `Ξ = {primitive characters inducing ξ·(·/q)^a : ξ ∈ Ξ₀, a ∈ {0, 1}}` (at most `2|Ξ₀|`
characters, conductor `≤ N₀q`) gives `(0, 1)` and `(1, 1)`. The threshold of 2.7c does not depend on the
progression, so it is uniform in `q`. For (ii), 2.7c asks of its characters only that their conductors be at most `F`
(this is where `d > √U₂ ≥ F` makes `d` the largest prime factor of each twisted conductor): those of the first step
have conductor `≤ N₀ ≤ F₁`, those of the second `≤ N₀q ≤ F₂(q)`; its conclusion (a) has the height `FU`, and its
constants do not depend on `F`. So the same two applications, with `F = F₁` and `F = F₂(q)`, give (ii).

**Checks.**

- The congruences that a consumer imposes on `q` and `d` (for instance `q ∣ d + 1`, or `d ≡ −1` modulo all small odd
  primes) enter only through `m₂(q)` and `a₂(q)`; they are admissible as long as the five hypotheses of 2.7c hold.
  Example, with the choice `b = 1/5`, `a = 1/4`: let `8C₁ ≤ z ≤ Y^(1/10)`, `log Y ≥ 8C₁`, `log U₁ ≤ z`,
  `log U₂ = z(log Y)²`, `m₂(q) = 16·q·∏_{3≤p≤z} p`, and `a₂(q)` the class with `a₂(q) ≡ −1` modulo `q∏_{3≤p≤z} p` and
  `a₂(q) ≡ 7 (mod 16)`, a unit modulo `m₂(q)`. Then `log m₂(q) ≤ log 16 + z + z log 4 ≤ 4z` (Chebyshev,
  `θ(z) ≤ z log 4`), so `C₁ log Y·(log m₂(q) + log Y) ≤ z(log Y)² = log U₂`; `N₀q ≤ U₂^(1/2)` since
  `log(N₀q) ≤ log N₀ + z ≤ z(log Y)²/2` once `z ≥ log N₀`; the prime factors of `m₂(q)` below `Y^(K/δ₀)` are `2` and the
  odd `p ≤ z`, at most `z ≤ Y^(1/4)`, since `q > √U₁ ≥ Y^(K/δ₀)` by the first-stage hypothesis; and
  `log(N₀qU₂) ≤ log N₀ + z + z(log Y)² ≤ Y^(1/5)` for `Y ≥ Y₁(N₀)`. This last threshold, and `z ≥ log N₀`, depend on
  `N₀`, while the `Y₀` of the statement does not: a consumer takes `Y ≥ max(Y₀, Y₁(N₀))`.
- The same example satisfies (ii) with `F₁ = N₀` and `F₂(q) = N₀U₁`: the two inequalities above used only
  `log q ≤ z`, and `log U₁ ≤ z` gives `log(N₀U₁) ≤ log N₀ + z ≤ z(log Y)²/2` and
  `log(N₀U₁U₂) ≤ log N₀ + z + z(log Y)² ≤ Y^(1/5)`. So its twists with `j = 1` are zero-free up to the height `N₀U₁U₂`,
  which is the same for every `q`, while (i) gives `N₀qU₂`, smaller by the factor `U₁/q`, up to `√U₁ = e^(z/2)` when
  `log U₁ = z`.

*Needs:* 2.7c.

### Analytic requirements

2.7a (iii) uses the prime number theorem in progressions in its relative form, with the exceptional term and both
exponentials `e^(−c log U/log M) + e^(−c√log U)`; a bound with the first exponential alone would be a power saving
for a fixed modulus, which needs a zero-free strip for the characters of that modulus, and is not available. The
window passage of 2.7b (iii) needs the mean square of the derivative, hence the mean square of 2.7b (ii) for all
coefficient sequences bounded by `1`, not only for one.

### Examples

These are worked in the Checks above. At `m₀ = 8`, `a₀ = 3`: for `n = 2`, `s = 1` and `(2/q) = −1` for every `q ≡ 3 (mod 8)`, so `ε = −1`; for `n = 3`, `s = 3` and `ε = −1`, and at `q = 11`, `(3/11) = 1 = −(11/3) = −(2/3)` (2.7a (i)). The bound `Li(U^β) ≤ 3U^(β−1) Li U` used in the route of 2.7a (iii) reads `Li U ≤ 3 Li U` at `β = 1`, and compares `Li(√U) ∼ 2√U/log U` with `3U^(−1/2) Li U ∼ 3√U/log U` at `β = 1/2`. For `c = 1_{n=p}` with one prime `p ∤ m₀` and `κ = 1`, the left side of the mean-square inequality is `|P|` and its right side is at least `sP(p)² |P| = |P|` (2.7b (i)). With `Ξ` empty, twist selection asserts only `P ≠ ∅` (2.7c), and `b = 1/5`, `a = 1/4` are admissible exponents there. With these exponents, `8C₁ ≤ z ≤ Y^(1/10)`, `log Y ≥ 8C₁`, `log U₁ ≤ z`, `log U₂ = z(log Y)²`, `m₂(q) = 16·q·∏_{3≤p≤z} p` and `a₂(q)` the class with `a₂(q) ≡ −1` modulo `q∏_{3≤p≤z} p` and `a₂(q) ≡ 7 (mod 16)` satisfy the hypotheses of the second step of 2.7d, both with `F₂(q) = N₀q` and with `F₂(q) = N₀U₁`, once `z ≥ log N₀` and `Y ≥ max(Y₀, Y₁(N₀))`.

### Dependencies

AnalyticNumberTheoryPartI §§0.11, 0.12, 0.17, 0.34a, 1.7; RiemannHypothesisStatementsAndConsequences §8.4a (b); RieszSumsOverPrimesAndExceptionalZeros §§1.4e–1.4f; RieszSumsOverPrimesAndExceptionalZeros §1.7b; Mathlib's Jacobi and Legendre symbols with quadratic reciprocity, the Chinese remainder theorem, Chebyshev's bound, interval integrals and Hölder's inequality, and Dirichlet `L`-functions; Tau Ceti's logarithmic integral.

## Downstream consumers

- ThetaChainsAndFrobeniusPrimeSums, a later roadmap of the family: the selection of auxiliary primes `q`, `d` whose quadratic twists are well behaved on a window (2.7c–2.7d). Its supply of hosts on windows (the auxiliary pair `(q, d)`) applies 2.7d (ii) with `F₁ = N₀`, `F₂(q) = N₀U₁` (box heights `N₀U₁` and `N₀U₁U₂`); the consumer fixes the progressions and sizes.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the Jacobi symbols over the primes of a residue class (2.7a–2.7d): reciprocity on the class, orthogonality for all but one short modulus, the mean square of quadratic twists of short weighted prime sums over prime moduli and its maximal form on a window, and the selection of primes whose twists have square-root cancellation on a window together with a zero-free box and a bound for `L′/L(1)`. Its sections extend Layer 2 of [SieveMethodsAndPrimePatterns](../../SieveMethodsAndPrimePatterns/README.md) and are numbered 2.7a–2.7d after that layer's §2.7 (quadratic large sieves and real-character means); these ids are this roadmap's own and name no section of SieveMethodsAndPrimePatterns.

Not owned here. SieveMethodsAndPrimePatterns §2.7 owns Heath-Brown's quadratic large sieve and the Jutila, Smith and Koymans–Pagano means, which average a real character over many moduli or over a product of two prime sets with power savings; 2.7a–2.7d average Jacobi symbols over the primes of one residue class against short moduli, through the prime number theorem in progressions, and need no quadratic large sieve. The Bombieri–Vinogradov theorem of SieveMethodsAndPrimePatterns Layer 3 is a different average (over moduli, not over the primes of one class). [AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md) owns Mertens's theorem, the effective gap for real zeros and the identification of real primitive characters with field characters, Page's theorem across moduli, the uniform exclusion of Landau–Siegel zeros and the log-free zero-density estimate (AnalyticNumberTheoryPartI §§0.11, 0.12, 0.34a, 0.17, 0.34, 1.7). [RieszSumsOverPrimesAndExceptionalZeros](../RieszSumsOverPrimesAndExceptionalZeros/README.md) owns the control of smoothed twisted prime sums and of `L′/L(1, χ)` by a zero-free box (RieszSumsOverPrimesAndExceptionalZeros §§1.4e–1.4f) and Gallagher's prime number theorem in progressions in Linnik's range with its exceptional pair (RieszSumsOverPrimesAndExceptionalZeros §1.7b). [RiemannHypothesisStatementsAndConsequences](../RiemannHypothesisStatementsAndConsequences/README.md) owns the Riesz remainder of a primitive character (§8.4a (b)), which is `G_χ` here. Although AnalyticNumberTheoryPartI §0.34 excludes Landau–Siegel zeros uniformly, 2.7a–2.7d are stated in the form with the exceptional term, which they take from RieszSumsOverPrimesAndExceptionalZeros §1.7b; 2.7a (iv) is the exception-free form through AnalyticNumberTheoryPartI §0.34. In this family, ThetaChainsAndFrobeniusPrimeSums uses 2.7c and 2.7d (ii) for the auxiliary primes of its cyclic hosts.

## Exact supplier contracts

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§0.2: the prime counts in progressions `primeCountAP` and `psiAP`, written `π(x;q,a)` and `ψ(x;q,a)` here (Conventions). §0.11 (Mertens: `Σ_{n≤x} Λ(n)/n = log x + O(1)`), for the size of the truncated prime sums in 2.7b and for 2.7c (b). §0.12 with §0.34a (the effective gap `1 − β ≥ c_ε q^(−1/2−ε)` for a real zero `β ∈ (1/2, 1)` of a real primitive character of conductor `q`, through the identification of such characters with field characters), for the lower bound of `|P|` in 2.7a. §0.17 (two distinct real primitive characters of conductors `N₁, N₂` cannot both have a real zero above `1 − 3c_star/log(N₁N₂)`), as Page's theorem across moduli in 2.7a. §1.7 (log-free zero density `Σ_{q≤Q}Σ*_χ N(σ,T,χ) ≤ C_ε(Q^(5+ε)T^(3+ε))^(1−σ)`), in 2.7c at `σ = 1 − δ₀`, `T = Q`.

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

§8.4a (b): the Riesz remainder of a primitive Dirichlet character `χ ≠ 1`, `Σ_{n≤y} Λ(n)χ(n)(y/n − 1) + y·(L′/L)(1, χ)`, which is `G_χ` of the Conventions for primitive `χ`, in the conclusion (c) of 2.7c and in 2.7d.

### From RieszSumsOverPrimesAndExceptionalZeros, a sub-roadmap of this family

RieszSumsOverPrimesAndExceptionalZeros §1.4e and its corollary (a zero-free box of height `Q` controls `S̃_χ(z(1+η)) − S̃_χ(z) + zη(L′/L)(1,χ)` and the tail of `L′/L(1,χ)` beyond `x^(1/δ₀)`) and RieszSumsOverPrimesAndExceptionalZeros §1.4f (`|(L′/L)(1,χ)| ≤ ((2+ε)/δ₀) log log Q + C` under such a box), in 2.7c. RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii) (Gallagher's prime number theorem in Linnik's range for `π(x;q,a)`, with the exceptional term and relative error, and its exceptional pair modulo `q`) and RieszSumsOverPrimesAndExceptionalZeros §1.7b (iv) (its exception-free form through AnalyticNumberTheoryPartI §0.34), in 2.7a.

### From Mathlib

`jacobiSym`, `jacobiSym.quadratic_reciprocity`, `jacobiSym.at_two` and `ZMod.χ₈` (2.7a (i)); `ZMod.chineseRemainder` and `legendreSym.eq_neg_one_iff` (2.7a (ii)); `Chebyshev.psi_le_const_mul_self` (2.7b (ii)); interval integrals and `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg`, Hölder's inequality with exponents `2, 2` (2.7b (iii)); `DirichletCharacter.LFunction`, with `DirichletCharacter.LFunction_apply_one_ne_zero` for the definition of `(L′/L)(1, χ)`, and `DirichletCharacter.IsPrimitive` (Conventions, 2.7c–2.7d).

### From Tau Ceti

`TauCeti.Real.logIntegral`, the logarithmic integral `Li x = ∫_2^x dt/log t` (Conventions).

## References

- P. X. Gallagher, *A large sieve density estimate near σ = 1*, Invent. Math. 11 (1970), 329–339: the prime number theorem in progressions in Linnik's range, with relative error and the exceptional term, that 2.7a uses in the form of RieszSumsOverPrimesAndExceptionalZeros §1.7b (ii).
- [FormalProof] The Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of the twist-selection theorem (2.7b–2.7d) and its route (mean square over prime moduli, maximal form on dyadic blocks, zero-free boxes).
- [Announcement] The announcement of that proof by its author, 20 November 2026: <https://alpo.ge/remark.pdf>.
