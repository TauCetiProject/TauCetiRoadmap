# Roadmap: Weil positivity and Li's criterion

**Summary.** The Riemann hypothesis has several classical reformulations as a positivity
statement about the nontrivial zeros `ρ` of the Riemann zeta function, counted with multiplicity.
This roadmap states and proves these equivalences on the zeros themselves: every sum over the
zeros below converges absolutely, and Li's original sum, which does not, appears only as a limit
of sums over discs. It proves no case of the Riemann hypothesis: each theorem about `ζ` is
unconditional, an equivalence with the Riemann hypothesis, or a consequence of it.

The first headline is Li's criterion. For `n ≥ 1` put
`λₙ = ½ ∑_ρ Re[(1 − (1 − 1/ρ)^n) + (1 − (1 − 1/(1 − ρ))^n)]`, a symmetric form of Li's
coefficient that converges absolutely. The Riemann hypothesis holds if and only if `λₙ ≥ 0` for
every `n ≥ 1`, and under it every `λₙ` is positive. For example `λ₁ = 1 + γ/2 − ½ log 4π ≈ 0.0231`.

The second is the multiset theorem of Bombieri and Lagarias, which has nothing to do with `ζ`. Let
a multiset of complex numbers omit `1` and satisfy `∑ (1 + |Re ρ|)/(1 + |ρ|)² < ∞`. Then every
point has real part at most `1/2` if and only if `∑_ρ Re(1 − (ρ/(ρ − 1))^n) ≥ 0` for every `n`.
Li's criterion is this theorem applied to the zeros of `ζ`, which are symmetric under `ρ ↦ 1 − ρ`.

The third is Weil's criterion, in Bombieri's form. For a smooth compactly supported function `g`
on `(0, ∞)` with Mellin transform `ĝ`, the sum `W(g) = ∑_ρ ĝ(ρ) conj ĝ(1 − conj ρ)` converges
absolutely and is real. The Riemann hypothesis holds if and only if `W(g) ≥ 0` for every such
`g`, and under it `W(g) > 0` for every nonzero `g`.

The fourth links the two. Li's test functions `Gₙ(s) = 1 − (1 − 1/s)^n` pair over the zeros as
`∑_ρ Gₙ(ρ) conj Gₖ(1 − conj ρ) = λₙ + λₖ − λ_|n − k|`. Hence the Riemann hypothesis holds if and
only if every matrix `(λ_(i+1) + λ_(j+1) − λ_|i − j|)` with `0 ≤ i, j < N` is positive
semidefinite, and under it each of these matrices is positive definite.

The roadmap builds on the zeros of L-functions roadmap for the summability of the zeros, the
Hadamard product, the zero-free region, the zero count, and the identification of the Riemann
hypothesis for the completed function with Mathlib's. Mellin transforms of smooth bumps come
from Analytic Number Theory Part III. The explicit formula of the zeros of L-functions roadmap
turns `W(g)` into a sum over primes; that form is described, not restated.

Layer 1 below fixes the zero multiset and its two symmetries. Layer 2 proves the Bombieri–Lagarias
theorem. Layer 3 defines the Li coefficients and proves Li's criterion and Li's derivative
formula. Layer 4 pairs Li's test functions and proves the Gram-matrix criterion. Layer 5 treats
Weil's form; its converse direction uses Layers 3 and 4.

## Conventions

- **Zeros.** `zetaZeroMult ρ` is `(MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat`, the
  positive part of the divisor of Mathlib's completed zeta function `Λ(s) = π^(−s/2) Γ(s/2) ζ(s)`.
  `Λ` is meromorphic on `ℂ` with simple poles at `0` and `1`, where the divisor is `−1` and
  `zetaZeroMult` is `0`. At the trivial zeros `−2, −4, …` of `ζ` the function `Λ` is regular and
  nonzero, so `zetaZeroMult` is `0` there too. At every other point it is the multiplicity of `ρ`
  as a zero of `ζ`; every `ρ` with `zetaZeroMult ρ ≠ 0` lies in `0 ≤ Re ρ ≤ 1` and differs from
  `0` and `1`. Neither the zeros of `riemannZeta` nor the signed divisor is ever used.
- **Division by zero.** Lean's `1/0 = 0`. In `liCoeff`, `weilForm` and the pairing of 4.1 every
  summand carries the factor `zetaZeroMult ρ`, which vanishes at `0` and `1`, so no junk value of
  `1/ρ` or `1/(1 − ρ)` is ever weighted. In 2.1 the multiset `m` is arbitrary: the term is written
  with `ρ/(ρ − 1)`, which is `0` at `ρ = 0`, the true limit of `(1 − 1/ρ)^(−1)`; the junk value at
  `ρ = 1` is excluded by the hypothesis `m 1 = 0`.
- **Infinite sums.** Every sum over the zeros is a `tsum` of a family that is shown to be
  summable, and the summability is part of each statement. Li's original sum
  `∑_ρ (1 − (1 − 1/ρ)^n)` converges only as a limit over discs, because `∑ 1/|ρ|` diverges; a
  `tsum` of it would be the junk value `0`, so it appears only through the symmetric form
  `liCoeff` and as the limit of finite sums in 3.3.
- **Mellin transform.** `ĝ = mellin g`, `mellin g s = ∫_(0,∞) t^(s−1) g(t) dt` (Mathlib), which
  is Bombieri's convention. A *test function* is `g : ℝ → ℂ` with `ContDiff ℝ ∞ g`,
  `HasCompactSupport g` and `tsupport g ⊆ Ioi 0`, the class of ZerosOfLFunctions 8.4. Here
  `∞ = ((⊤ : ℕ∞) : WithTop ℕ∞)`; `ContDiff ℝ ⊤` would mean real-analytic and admit only `g = 0`.
- **Conjugation.** `conj` is complex conjugation. The map `ρ ↦ 1 − conj ρ` fixes exactly the
  critical line `Re ρ = 1/2`.
- **Natural numbers.** Li coefficients are indexed by `n : ℕ`, and `liCoeff 0 = 0`. Every statement
  quantified over `n` either holds at `n = 0` or assumes `1 ≤ n`; `n − 1` in 3.4 is taken under
  `1 ≤ n`. The index `|n − k|` is written `max n k − min n k`, which is exact in `ℕ`.
- **The Riemann hypothesis** is Mathlib's `RiemannHypothesis`: every `s` with `riemannZeta s = 0`
  that is not of the form `−2(n + 1)` and differs from `1` has `Re s = 1/2`.

## Layer 1: the zero multiset of the completed zeta function

### 1.1 Multiplicities

Define `zetaZeroMult` as in the conventions. The following facts are consumed, not restated:

- `Λ` is meromorphic on `ℂ`, analytic off `0` and `1`, with order `−1` at `0` and at `1` (Tau
  Ceti `TauCeti.meromorphic_completedRiemannZeta`, `TauCeti.analyticAt_completedRiemannZeta`,
  `TauCeti.meromorphicOrderAt_completedRiemannZeta_zero` and
  `TauCeti.meromorphicOrderAt_completedRiemannZeta_one`), so the divisor on `univ` is the true
  divisor and `zetaZeroMult 0 = zetaZeroMult 1 = 0`.
- Every zero lies in the closed critical strip, and the family `ρ ↦ zetaZeroMult ρ/(1 + (Im ρ)²)`
  is summable (ZerosOfLFunctions 5.6a, first clause and `riemannZeta_zeros_summable_ordinate`).
  Since `(1 + |ρ|)² ≥ 1 + (Im ρ)²` and `1 + |Re ρ| ≤ 2` on the strip, the families
  `zetaZeroMult ρ/(1 + |ρ|)²` and `zetaZeroMult ρ (1 + |Re ρ|)/(1 + |ρ|)²` are summable, and every
  disc contains finitely many zeros (also Mathlib `IsCompact.inter_riemannZetaZeros_finite`, since
  off `0` and `1` a zero of `Λ` is a zero of `riemannZeta`).
- The ζ instance of the generalized Riemann hypothesis of ZerosOfLFunctions Layer 9,
  `∀ ρ, 0 < divisor completedRiemannZeta univ ρ → ρ.re = 1/2`, is equivalent to Mathlib's
  `RiemannHypothesis` (ZerosOfLFunctions Layer 9). In the notation here it reads: every `ρ` with
  `zetaZeroMult ρ ≠ 0` has `Re ρ = 1/2`. This is the only way the roadmap passes between
  `RiemannHypothesis` and the zeros.
- `Λ` has infinitely many zeros (ZerosOfLFunctions 7.6), and their number with `0 < Im ρ ≤ T` is
  `(T/2π) log(T/2πe) + O(log T)` for `T ≥ 2` (ZerosOfLFunctions 7.4, `riemannVonMangoldt`).

**Checks.**
- `zetaZeroMult 1 = 0` although the signed divisor of `Λ` at `1` is `−1`; with the signed divisor
  the pole would enter every sum below with weight `−1`.
- `riemannZeta (−2) = 0` (Mathlib `riemannZeta_neg_two_mul_nat_add_one`), but
  `zetaZeroMult (−2) = 0`.
  Counted through `riemannZeta`, the trivial zero `−2k` would contribute
  `Re(1 − (2k/(2k + 1))^n) ≈ n/(2k + 1)` to the sum of 2.1 for the zeros (the second identity of
  3.1), and that family would not be summable; the multiset would also lose the symmetry
  `ρ ↦ 1 − ρ` of 1.2, since `1 + 2k` is not a zero.

*Needs:* Tau Ceti `TauCeti.meromorphic_completedRiemannZeta`,
`TauCeti.analyticAt_completedRiemannZeta`, `TauCeti.meromorphicOrderAt_completedRiemannZeta_zero`,
`TauCeti.meromorphicOrderAt_completedRiemannZeta_one`; Mathlib `MeromorphicOn.divisor`,
`riemannZeta_neg_two_mul_nat_add_one`, `IsCompact.inter_riemannZetaZeros_finite`;
ZerosOfLFunctions 5.6a, 7.4, 7.6 and Layer 9.

### 1.2 The two symmetries

Prove `zetaZeroMult_one_sub`: `zetaZeroMult (1 − ρ) = zetaZeroMult ρ`, and `zetaZeroMult_conj`:
`zetaZeroMult (conj ρ) = zetaZeroMult ρ`, for every `ρ`. Composed, the zero multiset is invariant
under `ρ ↦ 1 − conj ρ`, the reflection in the critical line. (Proved here.)

Route: `Λ(1 − s) = Λ(s)` (Mathlib `completedRiemannZeta_one_sub`), and
`meromorphicOrderAt_comp_of_deriv_ne_zero` applied to `s ↦ 1 − s` transports the order from `ρ`
to `1 − ρ`. For conjugation, `Λ(conj s) = conj Λ(s)` (Mathlib `completedRiemannZeta_conj`); if
`Λ(s) = (s − ρ)^k h(s)` near `ρ` with `h` analytic and `h(ρ) ≠ 0`, then
`Λ(s) = (s − conj ρ)^k conj h(conj s)` near `conj ρ`, and `s ↦ conj h(conj s)` is analytic and
nonzero at `conj ρ`. Meromorphy of `Λ` on `ℂ` (1.1) makes the divisor equal to the order at every
point.

**Checks.**
- The signed divisor is invariant under the same maps: `1 − ρ` exchanges the poles `0` and `1`,
  and conjugation fixes both.

*Needs:* 1.1; Mathlib `completedRiemannZeta_one_sub`, `completedRiemannZeta_conj`,
`meromorphicOrderAt_comp_of_deriv_ne_zero`, `meromorphicOrderAt_eq_int_iff`.

### Examples

The first zeros are `1/2 ± 14.1347…i`, and with them `1/2 ± 21.0220…i`; each comes with its
conjugate, and each is its own image under `ρ ↦ 1 − conj ρ`.

### Dependencies

Mathlib completed zeta function and meromorphic orders; Tau Ceti
`NumberTheory/LSeries/CompletedRiemannZeta.lean`; ZerosOfLFunctions 5.6a, 7.4, 7.6, Layer 9. No
other layer.

## Layer 2: the Bombieri–Lagarias criterion for multisets

### 2.1 The criterion

Let `m : ℂ → ℕ` with `m 1 = 0` and with `ρ ↦ m ρ (1 + |Re ρ|)/(1 + |ρ|)²` summable. Prove
`bombieriLagarias`: for every `n : ℕ` the family `ρ ↦ m ρ Re(1 − (ρ/(ρ − 1))^n)` is summable, and
`m ρ ≠ 0 → Re ρ ≤ 1/2` holds for every `ρ` if and only if `∑'_ρ m ρ Re(1 − (ρ/(ρ − 1))^n) ≥ 0`
for every `n : ℕ` (Lagarias, p. 2, the hypothesis (1.6), printed there with a different
numerator as said below, the sums (1.7) at `n ≤ 0` and the paragraph after them, where
`(1 − 1/ρ)^n` with `n ≤ 0` is `(ρ/(ρ − 1))^|n|`; Bombieri 2000, §3, pp. 191–192, for the argument
in the case of `ζ`). The theorem is due to Bombieri and Lagarias
(1999). Lagarias's (1.6) prints `Re ρ` in the numerator; with that numerator the multiset
`{i√k : k ≥ 1}` satisfies it while the sums (1.7) diverge (Checks), so the hypothesis here is
`1 + |Re ρ|`.

Route. Put `w = ρ/(ρ − 1)`; then `|w|² = 1 + (2 Re ρ − 1)/|ρ − 1|²`.

- Summability: the hypothesis gives `∑ m ρ/(1 + |ρ|)² < ∞`, so each disc holds finitely many
  points. With `δ = 1/(ρ − 1)`, `w = 1 + δ`; for `|ρ − 1| ≥ max(n, 2)`,
  `|1 − w^n + nδ| ≤ (1 + |δ|)^n − 1 − n|δ| ≤ e n² |δ|²`, and
  `|Re δ| = |Re ρ − 1|/|ρ − 1|² ≤ 4(1 + |Re ρ|)/(1 + |ρ|)²` once `|ρ| ≥ 3`.
- (⇒): `|w| ≤ 1` when `Re ρ ≤ 1/2`, so `Re(1 − w^n) ≥ 1 − |w|^n ≥ 0` termwise, including
  `ρ = 0` where `w = 0`.
- (⇐): if some point has `Re ρ > 1/2`, then `|w| > 1` there. The quantity
  `(2 Re ρ − 1)/|ρ − 1|²` exceeds a fixed `ε > 0` at finitely many points only, so the maximum
  `M > 1` of `|w|` is attained at finitely many points `ρ_1, …, ρ_K`, and every other point has
  `|w| ≤ M − η` for some `η` with `0 < η ≤ M − 1`. The `ρ_j` contribute
  `∑ m_j (1 − M^n cos(nφ_j))` with `φ_j = arg w(ρ_j)`; the other points with
  `|ρ − 1| < max(n, 2)` number `O(n²)`, each term is at most `1 + (M − η)^n ≤ 2(M − η)^n`, so they
  contribute `O(n² (M − η)^n)`, and the remaining ones contribute `O(n²)` by the summability bound.
  Dirichlet's simultaneous approximation gives infinitely many `n` with every
  `cos(nφ_j) ≥ 1/2`, and for such `n` large the sum is negative.

**Checks.**
- The multiset `{0.6 ± 3i, 0.4 ± 3i}` (closed under `ρ ↦ 1 − ρ` and conjugation) has sums
  `≥ 0` for `n ≤ 18` and the sum `≈ −0.0841` at `n = 19`, the first negative one. The multiset
  `{0.55 ± 14i, 0.45 ± 14i}` has its first negative sum at `n = 88` (`≈ −0.00101`): nonnegativity
  for `n` up to a bound proves nothing.
- The multiset `{0}` has sum `0` at `n = 0` and `1` for every `n ≥ 1`, and satisfies both sides.
  Written as `1 − (1 − 1/ρ)^(−n)` with Lean's `1/0 = 0`, its term would be `1 − 1 = 0`.
- `m 1 = 0` is needed: for the multiset `{1}`, `ρ/(ρ − 1)` is the junk value `0`, every sum with
  `n ≥ 1` is `1 ≥ 0`, and `Re 1 = 1 > 1/2`.
- The summability hypothesis is needed: for the multiset `{i√k : k ≥ 1} ∪ {2}` every term with
  `n ≥ 1` and `ρ = i√k` is positive, of size about `n(n + 1)/(2k)`, and the sums diverge to `+∞`
  (partial sums `4.20`, `6.49`, `8.79` for `n = 1` up to `k = 10², 10³, 10⁴`); the families are not
  summable, each `tsum` is `0`, so the right side holds while the point `2` has `Re 2 > 1/2`.
  Its weights `(1 + |Re ρ|)/(1 + |ρ|)²` sum like `∑ 1/k`.
- A single point `2`: `w = 2` and the sums are `1 − 2^n = −1, −3, −7` for `n = 1, 2, 3`.

*Needs:* Mathlib `Real.exists_int_int_abs_mul_sub_le` (Dirichlet's approximation for one real;
the simultaneous form for finitely many reals, by the pigeonhole principle, is proved here),
`Summable.of_norm_bounded`, `tsum_nonneg`. (Proved here, following the cited argument.)

### Examples

`{0.6 ± 3i, 0.4 ± 3i}` and `{0.55 ± 14i, 0.45 ± 14i}` above; any finite multiset on the line
`Re ρ = 1/2` has all sums nonnegative.

### Dependencies

Mathlib only. No other layer.

## Layer 3: Li coefficients and Li's criterion

### 3.1 The coefficients

Define `liCoeff n` as
`½ ∑'_ρ zetaZeroMult ρ · Re[(1 − (1 − 1/ρ)^n) + (1 − (1 − 1/(1 − ρ))^n)]`. Prove
`summable_liCoeff`: the family is summable for every `n`; and `liCoeff_eq_tsum`:
`liCoeff n = ∑'_ρ zetaZeroMult ρ · Re(1 − (ρ/(ρ − 1))^n)`, the sum of 2.1 for the zeros of `ζ`
(Bombieri 2000, (3.3), p. 191, for the symmetric form; Lagarias, (1.1) and (1.7), pp. 1–2).

Route. On the strip, `1 − (1 − 1/ρ)^n = n/ρ + O(n² 2^n/|ρ|²)` for `|ρ| ≥ 2`, and
`0 ≤ Re(1/ρ) = Re ρ/|ρ|² ≤ 1/|ρ|²`; the same holds for `1 − ρ`. With 1.1 both real-part families
are summable separately. Since `1 − 1/(1 − ρ) = ρ/(ρ − 1)`, reindexing by `ρ ↦ 1 − ρ`, which
preserves `zetaZeroMult` (1.2), shows that the two halves have equal sums.

The zeros satisfy the hypotheses of 2.1 with `m = zetaZeroMult` (1.1), so 2.1 applies to them.

**Checks.**
- `liCoeff 0 = 0`: both brackets vanish.
- `liCoeff 1 = ½ ∑_ρ 1/(ρ(1 − ρ)) = 1 + γ/2 − ½ log 4π ≈ 0.0230957`, half of the sum
  `2 + γ − log 4π` of ExplicitPrimeCounting 2.1 and the constant of the Hadamard product in
  ZerosOfLFunctions 5.6.
- Over the first `1000` zeros above the axis and their conjugates (`T = 1419.42…`) the symmetric
  sums are `0.0223761` (`n = 1`) and `0.0894674` (`n = 2`); adding the tail estimate
  `(n²/2π)(log(T/2π) + 1)/T` gives `0.0230960` and `0.0923469`, within `1.2 · 10⁻⁶` of the values
  of 3.4.
- The unsymmetrized family `zetaZeroMult ρ (1 − (1 − 1/ρ)^n)` is not summable, its terms being of
  size `n/|ρ|` and `∑_(0 < γ ≤ T) 1/γ` growing like `(log T)²/4π`; its `tsum` is the junk `0`.

*Needs:* 1.1, 1.2; Mathlib `Equiv.tsum_eq`, `Summable.of_norm_bounded`.

### 3.2 Li's criterion

Prove `riemannHypothesis_iff_liCoeff_nonneg`: `RiemannHypothesis` holds if and only if
`0 ≤ liCoeff n` for every `n ≥ 1`; and `liCoeff_pos_of_riemannHypothesis`: under
`RiemannHypothesis`, `0 < liCoeff n` for every `n ≥ 1` (Bombieri 2000, §3, (3.3) and its proof,
pp. 191–192; Li 1997 for the original criterion, attributed in prose).

Route. (⇒) By the bridge of 1.1 every zero has `Re ρ = 1/2`, so `u = 1 − 1/ρ` has `|u| = 1` and
`1 − 1/(1 − ρ) = 1/u = conj u`; each summand is `Re(1 − u^n) ≥ 0`. It vanishes only if
`u^n = 1`, which happens at no more than `n − 1` points `ρ = 1/(1 − u)`; there are infinitely
many zeros (1.1), so the sum is positive. (⇐) 3.1 and 2.1 give `Re ρ ≤ 1/2` at every zero, and
1.2 gives `Re ρ ≥ 1/2` by `ρ ↦ 1 − ρ`; the bridge of 1.1 gives `RiemannHypothesis`.

**Checks.**
- `λ₁, …, λ₆ ≈ 0.0230957, 0.0923457, 0.2076389, 0.3687905, 0.5755427, 0.8275660` (computed from
  3.4 at 30 and 50 digits; the zero sums of 3.1 with the tail estimate agree to within
  `1.1 · 10⁻⁵` for all six).
- At `n = 0` every term is `0`, for any multiset in place of the zeros, so `liCoeff 0 = 0`: the
  index `0` carries no information, the criterion quantifies over `n ≥ 1`, and the strict form,
  false at `n = 0`, assumes `n ≥ 1`.

*Needs:* 1.1 (the bridge of ZerosOfLFunctions Layer 9, infinitely many zeros), 1.2, 2.1, 3.1.

### 3.3 The symmetric limit

Prove `tendsto_liCoeff`: as `T → ∞`, the finite sums
`∑ᶠ ρ ∈ {|z| ≤ T}, zetaZeroMult ρ (1 − (1 − 1/ρ)^n)` tend to `liCoeff n` in `ℂ` (Lagarias, (1.1),
p. 1, where this limit defines Li's coefficient).

Route: each disc holds finitely many zeros (1.1), so each sum is a finite sum. The disc is
invariant under conjugation, which preserves `zetaZeroMult` (1.2) and conjugates each term, so the
imaginary parts cancel. The real parts form a summable family (3.1), so their sums over the
increasing discs converge to its `tsum`, which is `liCoeff n` by the reindexing of 3.1.

**Checks.**
- Over the first `1000` conjugate pairs the imaginary part of the sum is `0` to working precision
  for `n ≤ 7`, while each single term has imaginary part of size `n/γ`.

*Needs:* 1.1, 1.2, 3.1; Mathlib `finsum_mem_eq_finite_toFinset_sum`, `Summable.hasSum` (a sum
is the limit of the partial sums along finite sets).

### 3.4 Li's derivative formula

Define `riemannXi s = (s(s − 1) completedRiemannZeta₀ s + 1)/2`. It equals
`½ s(s − 1) π^(−s/2) Γ(s/2) ζ(s)` for `s ≠ 0, 1` (Mathlib `completedRiemannZeta_eq`), is entire,
and takes the value `1/2` at `0` and `1`; it is half of ZerosOfLFunctions' `zetaEntireCompletion`
(Layer 0.2). Prove `liCoeff_eq_iteratedDeriv`: for `n ≥ 1`,
`liCoeff n = (1/(n − 1)!) · iteratedDeriv n (s ↦ s^(n−1) log ξ(s)) 1`, with `Complex.log`
(Lagarias, (1.3), p. 1, with the remark there that (1.3) is the coefficient of index `−n` of
(1.1), equal to the coefficient of index `n` by the symmetry (1.2); Li 1997, attributed in
prose).

Route. `ξ(1) = 1/2`, so `Complex.log ∘ ξ` is analytic near `1` and its derivatives there are
those of any branch of `log ξ`; an additive constant does not change the `n`-th derivative of
`s^(n−1)` times it. By the Hadamard product (ZerosOfLFunctions 5.5,
`zetaEntireCompletion_hadamard`, whose multiplicities are `zetaZeroMult` because the divisor of
`zetaEntireCompletion` is that of `Λ` plus `1` at `0` and `1`, ZerosOfLFunctions 0.2) and the
value of its linear coefficient (ZerosOfLFunctions 5.6:
`Re b = −∑ Re(1/ρ)`, and `b` is real because `ξ` is real on `ℝ`), near `1` a branch of `log ξ` is
a constant plus `b s + ∑_ρ (log(1 − s/ρ) + s/ρ)`, the sum locally uniformly convergent with the
multiplicities. Termwise, `(1/(n − 1)!) dⁿ/dsⁿ [s^(n−1) (log(1 − s/ρ) + s/ρ)]` at `s = 1` is
`1 − (ρ/(ρ − 1))^n + n/ρ`, which is `O(n² 2^n/|ρ|²)`, and the term `b s` gives `n b`. The sum is
real, since conjugation permutes the zeros (1.2); taking real parts, the terms `n Re(1/ρ)` sum to
`−n b` and cancel `n b`, leaving `∑_ρ Re(1 − (ρ/(ρ − 1))^n) = liCoeff n` by 3.1.

**Checks.**
- For `n = 1` the formula is `(log ξ)'(1) = ξ'/ξ(1)`, and `ξ'/ξ(1) = −ξ'/ξ(0) ≈ 0.0230957` by
  `ξ(1 − s) = ξ(s)`, matching 3.1.
- Termwise check at `ρ = 0.3 + 2i`, `n = 1`: the derivative of `log(1 − s/ρ)` at `1` is
  `1/(1 − ρ) ≈ 0.155902 + 0.445434i`, which is `1 − ρ/(ρ − 1)`, not `1 − (1 − 1/ρ)`
  (`≈ 0.073350 − 0.488998i`): the formula at `s = 1` produces the index `−n` of (1.1).

*Needs:* 3.1; ZerosOfLFunctions 5.5, 5.6 and Layer 0.2; Mathlib `completedRiemannZeta_eq`,
`differentiable_completedZeta₀`, `iteratedDeriv`, `Complex.log`, `logDeriv_tprod_eq_tsum`.

### Examples

The first six Li coefficients of 3.2; the sum over the first `1000` conjugate pairs of 3.1.

### Dependencies

Layers 1 and 2; ZerosOfLFunctions 5.5, 5.6, 7.6, Layer 0.2 and Layer 9 (through 1.1); Mathlib
as listed in each section.

## Layer 4: the Li class and the Gram matrices

### 4.1 The pairing of Li's test functions

Define `liTestFunction n s = 1 − (1 − 1/s)^n`, Li's function `Gₙ`. Prove
`liTestFunction_pairing`: for all `n k : ℕ`, the family
`ρ ↦ zetaZeroMult ρ · Gₙ(ρ) · conj Gₖ(1 − conj ρ)` is summable and its sum is
`λₙ + λₖ − λ_|n − k|` as a complex number (Lagarias, Theorem 3.1, (3.3) and (3.4), p. 13, where
`λ_(−k) = λₖ` for `ζ`). On the diagonal the value is `2λₙ`.

Route. With `u = 1 − 1/ρ`, `conj Gₖ(1 − conj ρ) = 1 − (ρ/(ρ − 1))^k = 1 − u^(−k)`, and
`(1 − u^n)(1 − u^(−k)) = (1 − u^n) + (1 − u^(−k)) − (1 − u^(n−k))`. The product is
`O(nk 4^(n+k)/|ρ|²)` on the strip for `|ρ| ≥ 2`, hence summable by 1.1. Sum over the finite sets
`{|ρ − 1/2| ≤ T}`, which are invariant under `ρ ↦ 1 − ρ` and conjugation: there the three pieces
sum to the corresponding sums of `1 − u^j` with `j = n`, `k`, `|n − k|` (using `ρ ↦ 1 − ρ` for
negative exponents). On such a set the sum of `1 − u^j` equals the sum of the symmetric family
`½[(1 − u^j) + (1 − u^(−j))]`, which is `O(j² 2^j/|ρ|²)` and hence absolutely summable, with real
sum `λ_j` (3.1, and conjugation for the imaginary parts); so these finite sums tend to `λ_j`.
The functions `Gₙ` with `n ≥ 1` have a pole at `0`, so they are not Mellin transforms of test
functions and 4.1 is not an instance of 5.1; the link between them is the limit argument of 5.2.

**Checks.**
- `n = 0` or `k = 0`: `G₀ = 0` and the right side is `λ₀ + λₖ − λₖ = 0`.
- Over the first `1000` conjugate pairs, `(n, k) = (1, 1), (3, 1), (2, 5)` give `0.0447523`,
  `0.1340714`, `0.4458580` on both sides; the identity holds exactly on every finite set closed
  under `ρ ↦ 1 − ρ` and conjugation.
- It does not need the Riemann hypothesis: on the set of `14` points generated by `0.3 + 5i`,
  `0.5 + 9i`, `0.8 + 2.5i`, `0.1 + 0.7i` under both maps, `(n, k) = (2, 5)` gives `−7.3295730` on
  both sides (with that set's own coefficients), a negative value.
- Without the conjugation on the second factor, `(3, 1)` on that set gives `6.0164090` instead of
  `9.7193970`.

*Needs:* 1.1, 1.2, 3.1, 3.3.

### 4.2 The Gram matrices

Define `liGramMatrix N`, the real `N × N` matrix with entries
`λ_(i+1) + λ_(j+1) − λ_|i − j|`. Prove `riemannHypothesis_iff_liGramMatrix_posSemidef`:
`RiemannHypothesis` holds if and only if `liGramMatrix N` is positive semidefinite for every `N`;
and `liGramMatrix_posDef_of_riemannHypothesis`: under `RiemannHypothesis` it is positive definite
for every `N` (Lagarias, p. 14, for positive definiteness of the pairing on the span of the `Gₙ`
under the Riemann hypothesis; the matrix form is proved here).

Route. (⇐) The diagonal entry at `i` is `2λ_(i+1)`, and a positive semidefinite matrix has
nonnegative diagonal; 3.2 concludes. (⇒) Under the Riemann hypothesis `|u(ρ)| = 1`, so by 4.1 the
entry `(i, j)` is `∑_ρ zetaZeroMult ρ (1 − u^(i+1)) conj(1 − u^(j+1))`, and for real `c`,
`∑ c_i c_j L_ij = ∑_ρ zetaZeroMult ρ |P(u(ρ))|²` with `P(u) = ∑ c_i (1 − u^(i+1))`. If `c ≠ 0`, `P`
is a nonzero polynomial with at most `N` roots, while `ρ ↦ u(ρ)` is injective and there are
infinitely many zeros (1.1); so the form is positive. For `N = 0` both statements hold trivially.

**Checks.**
- The smallest eigenvalues for `N = 1, …, 6`, from the values of 3.2 at 50 digits, are `0.0461914`,
  `1.48 · 10⁻⁵`, `8.86 · 10⁻⁹`, `3.00 · 10⁻¹²`, `8.86 · 10⁻¹⁶`, `1.75 · 10⁻¹⁹`: positive, and the
  matrices are very badly conditioned, so no finite computation decides the criterion.
- Indexing the matrix by `λ_i + λ_j − λ_|i − j|` from `i = 0` would give a zero first row: such a
  matrix is never positive definite.

*Needs:* 1.1, 3.2, 4.1; Mathlib `Matrix.PosSemidef`, `Matrix.PosDef`,
`Polynomial.card_roots'`.

### Examples

The `2 × 2` matrix `[[2λ₁, λ₁ + λ₂ − λ₁], [λ₁ + λ₂ − λ₁, 2λ₂]] = [[0.0461914, 0.0923457],
[0.0923457, 0.1846915]]`, with determinant `≈ 3.4 · 10⁻⁶ > 0`.

### Dependencies

Layers 1 and 3; Mathlib positive (semi)definite matrices and polynomial roots.

## Layer 5: Weil's quadratic form on smooth test functions

### 5.1 The form

Define `weilForm g h = ∑'_ρ zetaZeroMult ρ · ĝ(ρ) · conj ĥ(1 − conj ρ)` (Bombieri 2000, §3, (3.1),
p. 191; Lagarias, (3.1), p. 12). Prove `summable_weilForm_and_im_eq_zero`: for a test function
`g`, the family defining `weilForm g g` is summable and `Im (weilForm g g) = 0`.

Route. `ĝ` is entire and `|ĝ(s)| ≤ C (1 + |s|)^(−2)` on `−1 ≤ Re s ≤ 2` (Analytic Number Theory
Part III 9.2 with `k = 2`); every zero and its image `1 − conj ρ` lie in the strip, so the terms
are `O((1 + |ρ|)^(−4))`, summable by 1.1. The bijection `ρ ↦ 1 − conj ρ` preserves
`zetaZeroMult` (1.2) and sends each term to its conjugate, so the sum equals its conjugate.

With `g*(x) = x⁻¹ conj g(1/x)` and the Mellin convolution `f = g ⋆ g*` of Analytic Number Theory
Part III 9.1, `f̂(s) = ĝ(s) conj ĝ(1 − conj s)`, so `weilForm g g` is the zero side of the Weil
explicit formula of ZerosOfLFunctions 8.4 (`riemannZeta_weilExplicitFormula`) at `f`; through it,
5.2 is equivalent to the positivity of the prime side at every `g ⋆ g*` (Bombieri 2000, Theorem 2,
p. 193). That arithmetic form is not restated here.

**Checks.**
- `g(x) = φ(log x)(1 + i log x)` with `φ(u) = exp(−1/(1 − u²))` for `|u| < 1` and `0` otherwise, a
  complex test function supported in `[1/e, e]`: the sums over the first `1, 20, 120` conjugate
  pairs of zeros are `1.525281 · 10⁻⁴`, `1.765681 · 10⁻⁴`, `1.765696 · 10⁻⁴`, real, with
  `|ĝ(ρ)| ≈ 8.7 · 10⁻³` at the first zero and `≈ 2.0 · 10⁻⁹` at the 120th.
- Reality needs the symmetry: over the set of `10` points generated by `0.3 + 4i`, `0.8 + 7i`,
  `0.5 + 2i` under `ρ ↦ 1 − conj ρ` and conjugation the same `g` gives `0.3289364` with imaginary
  part below
  `10⁻¹⁷`, while the pair `0.3 ± 4i` alone gives `0.0392681 + 0.0109278i`.
- `g = 0` gives `weilForm 0 0 = 0`, so the strict inequality of 5.2 needs `g ≠ 0`.

*Needs:* 1.1, 1.2; Analytic Number Theory Part III 9.2; Mathlib `mellin`, `Equiv.tsum_eq`,
`Complex.conj_tsum`.

### 5.2 Weil's criterion

Prove `riemannHypothesis_iff_weilForm_nonneg`: `RiemannHypothesis` holds if and only if
`0 ≤ Re (weilForm g g)` for every test function `g`; and `weilForm_pos_of_riemannHypothesis`:
under `RiemannHypothesis`, `0 < Re (weilForm g g)` for every test function `g ≠ 0` (Bombieri
2000, Theorem 1, p. 191, which states that the Riemann hypothesis is equivalent to strict
positivity at every nonzero `g`; its proof of the converse, pp. 191–193, produces a test function
with negative value, which gives the nonnegative form stated here, the form of Theorem 2, p. 193).

Route.
- Under the Riemann hypothesis (the bridge of 1.1), `1 − conj ρ = ρ` at every zero, so the terms
  are `zetaZeroMult ρ |ĝ(ρ)|² ≥ 0`.
- Strictness: if `g ≠ 0`, Mellin inversion (Mathlib `mellinInv_mellin_eq` at `σ = 1/2`, with
  convergence and vertical integrability from 9.2 of Analytic Number Theory Part III) gives
  `ĝ ≠ 0`. If `g` vanishes off `[a, b] ⊂ (0, ∞)`, then `|ĝ(s)| ≤ C e^(A|s|)` with
  `A = max(|log a|, |log b|)`, so by Jensen's inequality (Mathlib `AnalyticOnNhd.sum_divisor_le`)
  `ĝ` has `O(R)` zeros in the disc of radius `R` about a point where it is nonzero. The zeros of
  `ζ` number at least `c R log R` in such a disc for large `R` (ZerosOfLFunctions 7.4), so some
  zero has `ĝ(ρ) ≠ 0`.
- Converse: if the Riemann hypothesis fails, 3.2 gives `n ≥ 1` with `λₙ < 0`, so the diagonal
  pairing of 4.1 is `2λₙ < 0`. `Gₙ` is the Mellin transform, for `Re s > 0`, of
  `gₙ(x) = Pₙ(log x)` on `(0, 1)` and `0` on `(1, ∞)`, with
  `Pₙ(y) = ∑_(1≤j≤n) C(n, j) y^(j−1)/(j−1)!`
  (Bombieri 2000, p. 192); `gₙ` is real, so the pairing is `∑ zetaZeroMult ρ ĝ(ρ) ĝ(1 − ρ)`.
  Truncate to `g_(n,ε) = gₙ` on `[ε, 1)`, `0` elsewhere. Its transform is `O(1/|s|)` on the strip,
  and `ĝ_(n,ε)(s) ĝ_(n,ε)(1 − s) − Gₙ(s) Gₙ(1 − s)` is
  `O(ε^(min(Re s, 1 − Re s)) (log 1/ε)^(n−1)/|s|²)` for `0 ≤ Re s ≤ 1`, `|s| ≥ 1`.
  With the zero-free region of ZerosOfLFunctions 6.2
  (`riemannZeta_zeroFreeRegion`) the pairing of `g_(n,ε)` with itself tends to `2λₙ` as `ε → 0`
  (Bombieri 2000, (3.4), p. 193). Finally convolve `g_(n,ε)` with the delta spikes of Analytic
  Number Theory Part III 9.3; the convolutions are test functions, their transforms are
  `ĝ_(n,ε)(s)` times factors bounded on the strip and tending to `1` (9.1, 9.3), and dominated
  convergence over the zeros gives a test function with `Re (weilForm g g) < 0`.

**Checks.**
- The Check of 5.1: under the Riemann hypothesis the computed sum `1.765696 · 10⁻⁴` is
  `∑ |ĝ(ρ)|²`, and its terms over the first `120` pairs are all positive.
- Off the line the diagonal pairing can be negative: for the multiset `{0.6 ± 3i, 0.4 ± 3i}` of
  2.1, `∑ Gₙ(ρ) conj Gₙ(1 − conj ρ)` is twice the sum of 2.1, `≈ −0.168` at `n = 19`.

*Needs:* 1.1, 1.2 (the zero-free region reflected to `Re s` near `0`), 3.2, 4.1, 5.1;
ZerosOfLFunctions 6.2, 7.4; Analytic Number Theory Part III 9.1–9.3;
Mathlib `mellinInv_mellin_eq`, `AnalyticOnNhd.sum_divisor_le`.

### Examples

The bump `g` of 5.1, and the truncated Li functions `g_(n,ε)` of 5.2.

### Dependencies

Layers 1, 3 and 4; ZerosOfLFunctions 6.2, 7.4, 8.4 (for the description of the arithmetic side
only); Analytic Number Theory Part III 9.1–9.3; Mathlib Mellin inversion and Jensen's inequality.

## Scope and ownership

This roadmap owns: the zero multiplicity `zetaZeroMult` of the completed zeta function and its two
symmetries (1.2); the Bombieri–Lagarias criterion for multisets (2.1); the Li coefficients of `ζ`
in symmetric form, their summability, their symmetric limit and Li's derivative formula, and Li's
criterion (Layer 3); the pairing of Li's test functions and the Gram-matrix criterion (Layer 4);
Weil's zero-side form for smooth test functions and Weil's criterion in Bombieri's form (Layer 5).
The Riemann hypothesis itself is not proved, in any case.

Stated by other roadmaps and consumed, not restated:

- ZerosOfLFunctions owns the summability of the zeros and their confinement to the critical strip
  (5.6a), the Hadamard product of the entire completion and the expansion of its logarithmic
  derivative (5.5, 5.6), the zero-free region (6.2), the zero count (7.4) and the infinitude of
  the zeros (7.6), the Weil explicit formula in every test class it states (8.4), and the
  generalized Riemann hypothesis with its identification with `RiemannHypothesis` (Layer 9). Its
  `zetaEntireCompletion` (Layer 0.2) is `2ξ`; `riemannXi` here is Riemann's normalization `ξ`,
  used only in 3.4. The explicit formula is also stated by Analytic Number Theory Part I (1.8,
  1.8a), ExplicitPrimeCounting 2.1 and ExplicitZetaBounds 7.3a; none of them is restated, and the
  arithmetic form of 5.2 is described in 5.1 only.
- The value `∑_ρ 1/(ρ(1 − ρ)) = 2 + γ − log 4π` is ExplicitPrimeCounting 2.1; here it is a Check
  of 3.1.
- Mellin convolution, Mellin transforms of compactly supported bumps and delta spikes are Analytic
  Number Theory Part III 9.1–9.3.
- Mathlib supplies the completed zeta function with its functional equation and conjugation
  symmetry, `RiemannHypothesis`, meromorphic orders and divisors, the Mellin transform and its
  inversion, Jensen's inequality and positive (semi)definite matrices; Tau Ceti supplies the
  meromorphy and the two poles of the completed zeta function.

Outside the scope, each a subject for a separate roadmap: Yoshida's local positivity of Weil's
functional on functions of small support; the arithmetic formula of Bombieri and Lagarias for
`λₙ` and the asymptotics of the Li coefficients; Li coefficients and Li's criterion for Dedekind
zeta functions and automorphic L-functions; other equivalents of the Riemann hypothesis, such as
the Nyman–Beurling criterion and Robin's inequality; any numerical verification of zeros.

## Exact supplier contracts

### From Mathlib

- `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`: `completedRiemannZeta`,
  `completedRiemannZeta₀`, `completedRiemannZeta_eq` (`Λ(s) = Λ₀(s) − 1/s − 1/(1 − s)`),
  `differentiable_completedZeta₀`, `completedRiemannZeta_one_sub` (`Λ(1 − s) = Λ(s)`),
  `riemannZeta_neg_two_mul_nat_add_one`, `RiemannHypothesis` (as in the conventions).
- `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean`: `completedRiemannZeta_conj`
  (`Λ(conj s) = conj Λ(s)` for every `s`).
- `Mathlib/NumberTheory/LSeries/ZetaZeros.lean`: `IsCompact.inter_riemannZetaZeros_finite` (a
  compact set contains finitely many zeros of `riemannZeta`).
- `Mathlib/Analysis/Meromorphic/Divisor.lean`: `MeromorphicOn.divisor`.
  `Mathlib/Analysis/Meromorphic/Order.lean`: `meromorphicOrderAt_comp_of_deriv_ne_zero` (the order
  of `f ∘ g` at `x` is the order of `f` at `g x` when `g` is analytic with nonzero derivative),
  `meromorphicOrderAt_eq_int_iff`.
- `Mathlib/Analysis/MellinTransform.lean`: `mellin`. `Mathlib/Analysis/MellinInversion.lean`:
  `mellinInv_mellin_eq` (for `f` Mellin-convergent at `σ`, with vertically integrable transform
  and continuous at `x > 0`, the inverse transform recovers `f x`).
- `Mathlib/Analysis/Complex/JensenFormula.lean`: `AnalyticOnNhd.sum_divisor_le` (for `f` analytic
  on a closed disc of radius `R`, nonzero at the centre and bounded by `M ≥ 1` on its boundary, the
  number of zeros in the disc of radius `r < R` is at most `log(M/|f c|)/log(R/r)`).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`, `Matrix.PosDef` (Hermitian, and
  the quadratic form on finitely supported vectors is nonnegative, resp. positive off `0`).
- `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`: `iteratedDeriv`.
  `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean`: `Complex.log`.
- `Mathlib/Analysis/Calculus/LogDerivUniformlyOn.lean`: `logDeriv_tprod_eq_tsum`.
  `Mathlib/Topology/Algebra/InfiniteSum/Basic.lean`: `Equiv.tsum_eq` (reindexing by a bijection);
  `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean`: `Summable.hasSum`;
  `Mathlib/Analysis/Normed/Group/InfiniteSum.lean`: `Summable.of_norm_bounded`;
  `Mathlib/Topology/Algebra/InfiniteSum/Order.lean`: `tsum_nonneg`;
  `Mathlib/Analysis/Complex/Basic.lean`: `Complex.conj_tsum`;
  `Mathlib/Algebra/BigOperators/Finprod.lean`: `finsum_mem_eq_finite_toFinset_sum`;
  `Mathlib/NumberTheory/DiophantineApproximation/Basic.lean`:
  `Real.exists_int_int_abs_mul_sub_le`; `Mathlib/Algebra/Polynomial/Roots.lean`:
  `Polynomial.card_roots'`.

### From Tau Ceti

- `TauCeti/NumberTheory/LSeries/CompletedRiemannZeta.lean`:
  `TauCeti.meromorphic_completedRiemannZeta` (`Λ` is meromorphic on `ℂ`),
  `TauCeti.analyticAt_completedRiemannZeta` (analytic off `0` and `1`),
  `TauCeti.meromorphicOrderAt_completedRiemannZeta_zero` and
  `TauCeti.meromorphicOrderAt_completedRiemannZeta_one` (order `−1` at `0` and at `1`).

### From TauCetiRoadmap.ZerosOfLFunctions

Backticked names below are declarations of that roadmap's `Suggested.lean`; the other items
(confinement to the strip, the partial-fraction expansion, the value of `Re b`, the infinitude of
the zeros and the identification with `RiemannHypothesis`) are targets of its README.

- 5.6a, ordinate summability: every zero of the entire completion lies in `0 ≤ Re ρ ≤ 1`, and
  `riemannZeta_zeros_summable_ordinate`, the summability of
  `ρ ↦ (divisor completedRiemannZeta univ ρ).toNat/(1 + (Im ρ)²)` over `ℂ`.
- 5.5, `zetaEntireCompletion_hadamard`: constants `A, B` with
  `zetaEntireCompletion s = exp(A + Bs) ∏'_ρ ((1 − s/ρ) e^(s/ρ))^(m_ρ)` for every `s`, the product
  multipliable, `m_ρ` the multiplicities of the zeros of `zetaEntireCompletion`; and the
  partial-fraction expansion `logDeriv f s = b + ∑_ρ m_ρ (1/(s − ρ) + 1/ρ)` of 5.5.
- 5.6, second clause: `Re b = −∑_ρ m_ρ Re(1/ρ)`.
- 6.2, `riemannZeta_zeroFreeRegion`: for some `c > 0`, `ζ(s) ≠ 0` whenever `s ≠ 1` and
  `Re s ≥ 1 − c/log(|Im s| + 3)`.
- 7.4, `riemannVonMangoldt`: `N(T) = (T/2π) log(T/2πe) + O(log T)` for `T ≥ 2`; 7.6: `Λ` has
  infinitely many zeros.
- 8.4, `riemannZeta_weilExplicitFormula` (described in 5.1, not used in a proof).
- Layer 0.2, `zetaEntireCompletion s = s(s − 1) completedRiemannZeta₀ s + 1`.
- Layer 9: the ζ instance of *GRH*, `∀ ρ, 0 < divisor Λ univ ρ → ρ.re = 1/2`, is Mathlib's
  `RiemannHypothesis`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartIII

- 9.1: the Mellin convolution `(f ⋆ g)(x) = ∫_(0,∞) f(y) g(x/y) dy/y`, whose Mellin transform is
  the product of the transforms under absolute convergence, with the support rule.
- 9.2: for `ν` of class `C^k`, `k ≥ 1`, supported in `[a, b] ⊂ (0, ∞)`, `mellin ν` is entire and
  `O((1 + |s|)^(−k))` on every vertical strip.
- 9.3: delta spikes, of `dx/x`-mass `1`, with Mellin transform `mellin ν (εs)`.

### From TauCetiRoadmap.ExplicitPrimeCounting

- 2.1: `∑_ρ 1/(ρ(1 − ρ)) = 2 + γ − log 4π` over the zeros of the entire completion (a Check only).

## References

- E. Bombieri, *Remarks on Weil's quadratic functional in the theory of prime numbers, I*, Rend.
  Mat. Acc. Lincei s. 9 v. 11 (2000), 183–233, open at the BDIM archive (bdim.eu): the Mellin
  transform of §2, p. 186; Theorem 1, (3.1)–(3.4) and the proof of Theorem 1, §3, pp. 191–193;
  Theorem 2, p. 193.
- J. C. Lagarias, *Li coefficients for automorphic L-functions*, arXiv:math/0404394v4 (2005):
  (1.1)–(1.3), p. 1; (1.6)–(1.7) and the paragraph after them, p. 2; (3.1), p. 12; (3.2) and
  Theorem 3.1 with (3.3)–(3.4), p. 13; positive definiteness on the Li class, p. 14. Page numbers
  are those printed in the arXiv version.
- Attributed in prose without a locator: Xian-Jin Li, *The positivity of a sequence of numbers and
  the Riemann hypothesis*, J. Number Theory 65 (1997) (Li's criterion and the derivative formula);
  E. Bombieri and J. C. Lagarias, *Complements to Li's criterion for the Riemann hypothesis*,
  J. Number Theory 77 (1999) (the multiset criterion); A. Weil (1952) for the positivity criterion.
