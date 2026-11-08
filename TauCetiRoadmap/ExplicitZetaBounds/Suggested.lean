module

import Mathlib

/-!
# Explicit bounds for the zeta function and Dirichlet L-functions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the five definitions they
need: the bounded-height Riemann hypothesis `RiemannHypothesisUpTo` of Layer 0.2, the zero counts
`zetaZeroCount` and `dirichletZeroCount` of Layer 5 and `zetaZeroDensityCount` of Layer 8 (each
written with the meromorphic order, in the rectangle of the source it serves), and Vinogradov's
count `vinogradovCount` of Layer 4.9a. Every constant below is a literal decimal of its source.

Stated here:

* Layer 2.5, the two-sided bound for `‖Γ(σ + it)‖` on vertical lines;
* Layer 3.2, Rademacher's convexity bound for primitive Dirichlet L-functions;
* Layer 4.7, `‖ζ(1/2 + it)‖ ≤ 0.618 t^{1/6} log t` (Hiary–Patel–Yang); Layer 4.8, Patel's and
  Hiary–Leong–Yang's bounds for `‖ζ(1 + it)‖`; Layer 4.9a, Ford's explicit Vinogradov mean value
  theorem; Layer 4.10, Ford's Richert-type bound for `ζ` and the Hurwitz zeta function;
* Layer 5.2, the Bellotti–Wong form of the Riemann–von Mangoldt formula for `T ≥ e`; Layer 5.3, the
  explicit zero count for primitive Dirichlet L-functions (Bennett–Martin–O'Bryant–Rechnitzer);
* Layer 7.3, the classical region with `R₀ = 5.558691` (Mossinghoff–Trudgian–Yang); Layer 7.4,
  Yang's Littlewood-type region; Layer 7.5, McCurley's region for the product of the L-functions
  modulo `q` in Thorner–Zaman's form, and Kadiri's region for `3 ≤ q ≤ 400 000`; Layer 7.6, the
  Vinogradov–Korobov region with `c = 55.241`; Layer 7.7, Bordignon's bounds for real zeros of
  quadratic L-functions of conductor above `400 000`; Layer 7.8, the absence of real zeros of
  quadratic L-functions near `1` for moduli up to `10¹⁰` (Lu–Zaman–Zhao); Layer 7.10, the
  Hiary–Leong–Yang bound for `1/‖ζ(1 + it)‖`;
* Layer 8.3, the Kadiri–Lumley–Ng density bound at `σ = 9/10`; Layer 8.5, Bellotti's log-free
  density bound near `σ = 1`;
* Layer 9.1, Ramaré's upper bounds for `‖L(1, χ)‖`; Layer 9.3, the
  Mossinghoff–Starichkova–Trudgian lower bound for non-quadratic characters.

The recorded verifications of the Riemann hypothesis up to a height (README 0.4) are the only
computational inputs taken as hypotheses, as in the README: `RiemannHypothesisUpTo 545439823`
(van de Lune, te Riele and Winter) in 7.4 and 7.10, `RiemannHypothesisUpTo 30610046000` (Platt) in
8.3, and `RiemannHypothesisUpTo (3 * 10 ^ 12)` (Platt and Trudgian) in 7.3, McCurley's region of
7.5 (for the zeros of `ζ` that its principal characters carry), 7.6 and 8.5. The
polynomial and numerical certificates that the README names in the routes are closed
propositions about literal numbers (or about finitely many values of `ζ`, `L(s, χ)` and `S(T)`):
the theorems are stated as their sources state them, and their proofs establish those
certificates.

Not statable at the pins: Rademacher's bound (3.2) at the generality of an analytic record of
finite-order type, which needs the record `AnalyticLFunctionData` of the L-functions roadmap and
its continued L-function, absent from Mathlib and Tau Ceti; its Dirichlet instance is stated.

Not stated: the README instances that rest on unrefereed preprints (the region of 7.3 with
`R₀ = 4.896` and the real-zero gap of 7.9 without a conductor cap). The Stirling, polygamma,
convexity, exponential-sum, Perron, mean-value, large-sieve and weighted-zero-sum statements of
Layers 1–6 and the general criteria of Layer 7 are README targets: they are the lemmas on the way
to the theorems below. So are the remaining instances of Layers 3–9: inputs to the theorems below
(3.3, 3.4, 4.9, the further critical-line bounds of 4.7, 5.4, 7.2, Kadiri's density 8.1), other
constants and ranges for the quantities bounded below (the further regions of 7.5–7.7, 9.2), and
the zero densities of 8.2 and 8.4 for the family of all primitive characters of bounded
conductor, which serve the prime-counting consumers.
-/

namespace TauCetiRoadmap.ExplicitZetaBounds

open Complex

open scoped Real

/-! ## Layer 0: explicit errors, verified zeros and cosine polynomials -/

/-- **Layer 0.2, the Riemann hypothesis up to height `H`.** Every zero `ρ` of `ζ` in the open
critical strip `0 < Re ρ < 1` with `|Im ρ| ≤ H` lies on the critical line. The open strip
excludes the trivial zeros and the junk value of `riemannZeta` at `1`; for `H < 0` the statement
is vacuous. -/
def RiemannHypothesisUpTo (H : ℝ) : Prop :=
  ∀ ρ : ℂ, riemannZeta ρ = 0 → 0 < ρ.re → ρ.re < 1 → |ρ.im| ≤ H → ρ.re = 1 / 2

/-! ## Layer 2: the Gamma function in the complex plane -/

/-- **Layer 2.5, the modulus of `Γ` on vertical lines.** For `s = σ + it` with `σ > 0` and
`t ≠ 0`, `√(2π) |s|^{σ − 1/2} e^{−π|t|/2} e^{−σ³/(3t²)} < |Γ(s)|` and
`|Γ(s)| ≤ √(2π) |s|^{σ − 1/2} e^{−π|t|/2} e^{1/(6|s|)}`. From Stirling's formula with Stieltjes'
sector bound for its remainder (2.1) and the positivity of the real part of the remainder on the
right half-plane (Binet, 2.4). -/
theorem norm_Gamma_bounds (s : ℂ) (hσ : 0 < s.re) (ht : s.im ≠ 0) :
    Real.sqrt (2 * π) * ‖s‖ ^ (s.re - 1 / 2) * Real.exp (-(π * |s.im| / 2)) *
        Real.exp (-(s.re ^ 3 / (3 * s.im ^ 2))) < ‖Complex.Gamma s‖ ∧
      ‖Complex.Gamma s‖ ≤ Real.sqrt (2 * π) * ‖s‖ ^ (s.re - 1 / 2) *
        Real.exp (-(π * |s.im| / 2)) * Real.exp (1 / (6 * ‖s‖)) := sorry

/-! ## Layer 3: explicit convexity and pointwise bounds -/

/-- **Layer 3.2 at a primitive Dirichlet character, Rademacher's convexity bound.** For `χ`
primitive modulo `q > 1`, `0 < η ≤ 1/2` and `−η ≤ Re s ≤ 1 + η`,
`|L(s, χ)| ≤ (q |s + 1|/(2π))^{(1 + η − Re s)/2} ζ(1 + η)` (Rademacher 1959, Theorem 3, as quoted
in `bmor2021` Lemma 5.6). -/
theorem norm_LFunction_le_rademacher {q : ℕ} [NeZero q] (hq : 1 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (η : ℝ) (hη₀ : 0 < η) (hη₁ : η ≤ 1 / 2)
    (s : ℂ) (hσ₀ : -η ≤ s.re) (hσ₁ : s.re ≤ 1 + η) :
    ‖DirichletCharacter.LFunction χ s‖ ≤
      ((q : ℝ) * ‖s + 1‖ / (2 * π)) ^ ((1 + η - s.re) / 2) * ‖riemannZeta (1 + (η : ℂ))‖ :=
  sorry

/-! ## Layer 4: explicit exponential sums and the size of `ζ` on vertical lines -/

/-- **Layer 4.7, the critical line.** `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for `t ≥ 3`
(Hiary, Patel and Yang, Theorem 1.1). -/
theorem norm_riemannZeta_criticalLine_le (t : ℝ) (ht : 3 ≤ t) :
    ‖riemannZeta (1 / 2 + t * I)‖ ≤ 0.618 * t ^ ((1 : ℝ) / 6) * Real.log t := sorry

/-- **Layer 4.8, the line one.** For `t ≥ 3`,
`|ζ(1 + it)| ≤ min(log t, (1/2) log t + 1.93, (1/5) log t + 44.02)` (Patel, Theorem 1.1) and
`|ζ(1 + it)| ≤ 1.731 log t / log log t` (Hiary, Leong and Yang, Theorem 1). -/
theorem norm_riemannZeta_one_add_le (t : ℝ) (ht : 3 ≤ t) :
    ‖riemannZeta (1 + t * I)‖ ≤
        min (Real.log t) (min (Real.log t / 2 + 1.93) (Real.log t / 5 + 44.02)) ∧
      ‖riemannZeta (1 + t * I)‖ ≤ 1.731 * Real.log t / Real.log (Real.log t) := sorry

/-- **Layer 4.9a, Vinogradov's integral as a count.** `J_{s,k}(P)` is the number of pairs of
`s`-tuples `x, y` of integers in `[1, P]` with `Σ_i x_i^j = Σ_i y_i^j` for `1 ≤ j ≤ k`; by
orthogonality it equals `∫_{[0,1]^k} |Σ_{1 ≤ x ≤ P} e(α₁x + ⋯ + α_k x^k)|^{2s} dα`
(`ford2002vinogradov` (1.3)–(1.4)). -/
noncomputable def vinogradovCount (s k : ℕ) (P : ℝ) : ℕ :=
  (((Fintype.piFinset fun _ : Fin s ↦ Finset.Icc 1 ⌊P⌋₊) ×ˢ
      (Fintype.piFinset fun _ : Fin s ↦ Finset.Icc 1 ⌊P⌋₊)).filter
    fun xy ↦ ∀ j ∈ Finset.Icc 1 k, ∑ i, xy.1 i ^ j = ∑ i, xy.2 i ^ j).card

/-- **Layer 4.9a, Ford's explicit Vinogradov mean value theorem.** For integers `k ≥ 1000` and
`2k² ≤ s ≤ (k²/2)(1/2 + log(3k/8))` and every real `P ≥ 1`,
`J_{s,k}(P) ≤ k^{2.055k³ − 5.91k² + 3s} 1.06^{sk + 2s²/k − 9.7278k³} P^{2s − k(k+1)/2 + Δ_s}` with
`Δ_s = (3/8) k² e^{1/2 − 2s/k² + 1.7/k}` (Ford, Theorem 3, first clause). -/
theorem vinogradovCount_le_ford (k s : ℕ) (hk : 1000 ≤ k) (hs₀ : 2 * k ^ 2 ≤ s)
    (hs₁ : (s : ℝ) ≤ (k : ℝ) ^ 2 / 2 * (1 / 2 + Real.log (3 * k / 8))) (P : ℝ) (hP : 1 ≤ P) :
    (vinogradovCount s k P : ℝ) ≤
      (k : ℝ) ^ (2.055 * (k : ℝ) ^ 3 - 5.91 * (k : ℝ) ^ 2 + 3 * s) *
        (1.06 : ℝ) ^ ((s : ℝ) * k + 2 * (s : ℝ) ^ 2 / k - 9.7278 * (k : ℝ) ^ 3) *
        P ^ (2 * (s : ℝ) - (k : ℝ) * (k + 1) / 2 +
          3 / 8 * (k : ℝ) ^ 2 * Real.exp (1 / 2 - 2 * s / (k : ℝ) ^ 2 + 1.7 / k)) := sorry

/-- **Layer 4.10, Richert's bound with Ford's constants.** For `|t| ≥ 3` and `1/2 ≤ σ ≤ 1`,
`|ζ(σ + it)| ≤ 76.2 |t|^{4.45 (1 − σ)^{3/2}} log^{2/3} |t|`, and the same bound holds for
`|ζ(σ + it, u) − u^{−s}|` for every `0 < u ≤ 1`, where `ζ(s, u) = Σ_{n ≥ 0} (n + u)^{−s}` is
Mathlib's `HurwitzZeta.hurwitzZeta` at the class of `u` (Ford, Theorem 1, stated there for
`t ≥ 3`; the conjugation symmetry gives `t ≤ −3`). -/
theorem norm_riemannZeta_le_richert (s : ℂ) (ht : 3 ≤ |s.im|) (hσ₀ : 1 / 2 ≤ s.re)
    (hσ₁ : s.re ≤ 1) :
    ‖riemannZeta s‖ ≤
        76.2 * |s.im| ^ (4.45 * (1 - s.re) ^ ((3 : ℝ) / 2)) * Real.log |s.im| ^ ((2 : ℝ) / 3) ∧
      ∀ u : ℝ, 0 < u → u ≤ 1 →
        ‖HurwitzZeta.hurwitzZeta (u : UnitAddCircle) s - (u : ℂ) ^ (-s)‖ ≤
          76.2 * |s.im| ^ (4.45 * (1 - s.re) ^ ((3 : ℝ) / 2)) *
            Real.log |s.im| ^ ((2 : ℝ) / 3) := sorry

/-! ## Layer 5: zero counting with explicit errors -/

/-- **Layer 5.2, the counting function `N(T)`.** The number of zeros `ρ` of `ζ` with
`0 < Re ρ < 1` and `0 < Im ρ ≤ T`, counted with multiplicity (the meromorphic order of
`riemannZeta` at `ρ`). The set of such zeros is finite, so the finite sum is the count. It agrees
with the count of `ZerosOfLFunctions` 4.5, written there for the completed function on the closed
strip. -/
noncomputable def zetaZeroCount (T : ℝ) : ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | 0 < ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im ∧ ρ.im ≤ T},
    ((meromorphicOrderAt riemannZeta ρ).untop₀).toNat

/-- **Layer 5.3, the count `N(T, χ)`.** The number of zeros `ρ` of `L(s, χ)` with
`0 < Re ρ < 1` and `|Im ρ| ≤ T`, counted with multiplicity. -/
noncomputable def dirichletZeroCount {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (T : ℝ) :
    ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | 0 < ρ.re ∧ ρ.re < 1 ∧ |ρ.im| ≤ T},
    ((meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ).untop₀).toNat

/-- **Layer 5.2, the explicit Riemann–von Mangoldt formula.** For `T ≥ e`,
`|N(T) − (T/2π) log(T/(2πe))| ≤ 0.10076 log T + 0.24460 log log T + 8.08344` and
`≤ 0.11200 log T + 0.12567 log log T + 3.77417` (Bellotti and Wong, Theorem 1.1). -/
theorem abs_zetaZeroCount_sub_le (T : ℝ) (hT : Real.exp 1 ≤ T) :
    |(zetaZeroCount T : ℝ) - T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤
        0.10076 * Real.log T + 0.24460 * Real.log (Real.log T) + 8.08344 ∧
      |(zetaZeroCount T : ℝ) - T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤
        0.11200 * Real.log T + 0.12567 * Real.log (Real.log T) + 3.77417 := sorry

/-- **Layer 5.3, the explicit zero count for primitive Dirichlet L-functions.** For `χ` primitive
modulo `q > 1` and `T ≥ 5/7`, with `ℓ = log(q(T + 2)/(2π))`: if `ℓ ≤ 1.567` then `N(T, χ) = 0`,
and if `ℓ > 1.567` then
`|N(T, χ) − ((T/π) log(qT/(2πe)) − χ(−1)/4)| ≤ 0.22737 ℓ + 2 log(1 + ℓ) − 0.5`
(Bennett, Martin, O'Bryant and Rechnitzer, Theorem 1.1). -/
theorem dirichletZeroCount_explicit {q : ℕ} [NeZero q] (hq : 1 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (T : ℝ) (hT : 5 / 7 ≤ T) :
    (Real.log (q * (T + 2) / (2 * π)) ≤ 1.567 → dirichletZeroCount χ T = 0) ∧
      (1.567 < Real.log (q * (T + 2) / (2 * π)) →
        ‖(dirichletZeroCount χ T : ℂ) -
            ((T / π * Real.log (q * T / (2 * π * Real.exp 1)) : ℝ) - χ (-1) / 4)‖ ≤
          0.22737 * Real.log (q * (T + 2) / (2 * π)) +
            2 * Real.log (1 + Real.log (q * (T + 2) / (2 * π))) - 0.5) := sorry

/-! ## Layer 7: zero-free regions with explicit constants -/

/-- **Layer 7.3, the classical region with `R₀ = 5.558691`.** Given the Riemann hypothesis up to
height `3·10¹²`, `ζ(σ + it) ≠ 0` for `|t| ≥ 2` and `σ ≥ 1 − 1/(5.558691 log |t|)`
(Mossinghoff, Trudgian and Yang, Theorem 1.3). -/
theorem riemannZeta_ne_zero_classical (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12)) (s : ℂ)
    (ht : 2 ≤ |s.im|) (hσ : 1 - 1 / (5.558691 * Real.log |s.im|) ≤ s.re) :
    riemannZeta s ≠ 0 := sorry

/-- **Layer 7.4, the Littlewood-type region.** Given the Riemann hypothesis up to height
`545 439 823`, `ζ(σ + it) ≠ 0` for `|t| ≥ 3` and `σ > 1 − log log |t|/(21.233 log |t|)` (Yang,
Corollary 1.2, whose proof uses the verification up to `5.45·10⁸` for `3 ≤ |t| ≤ 5.45·10⁸`). -/
theorem riemannZeta_ne_zero_littlewood (hRH : RiemannHypothesisUpTo 545439823) (s : ℂ)
    (ht : 3 ≤ |s.im|)
    (hσ : 1 - Real.log (Real.log |s.im|) / (21.233 * Real.log |s.im|) < s.re) :
    riemannZeta s ≠ 0 := sorry

/-- **Layer 7.5, McCurley's region in Thorner and Zaman's form.** For `q ≥ 3` let `R_q` be the
region `Re s ≥ 1 − 1/(9.645908801 log max(q, q |Im s|))`. The product of the `L(s, χ)` over all
characters `χ` modulo `q` has at most one zero in `R_q`, counted with multiplicity: a zero of some
`L(s, χ)` in `R_q` is real and simple, occurs only when `q > 400 000`, and `χ` is quadratic; and
two such zeros, of the same or of different characters, coincide (Thorner and Zaman, Lemma 2.3,
sharpening McCurley, Theorem 1). Zeros are read through the meromorphic order, so the pole of the
principal character at `1` is never one. The principal characters carry the zeros of `ζ`, which
Platt's finite-conductor computation does not cover: the Riemann hypothesis up to `3·10¹²` with the
classical region of 7.3 keeps them out of `R_q`. -/
theorem LFunction_zeroFree_mcCurley (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12)) (q : ℕ) [NeZero q]
    (hq : 3 ≤ q) :
    (∀ (χ : DirichletCharacter ℂ q) (ρ : ℂ),
        1 - 1 / (9.645908801 * Real.log (max (q : ℝ) (q * |ρ.im|))) ≤ ρ.re →
        0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ →
        400000 < q ∧ ρ.im = 0 ∧ MulChar.IsQuadratic χ ∧ χ ≠ 1 ∧
          meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ = 1) ∧
      ∀ (χ₁ χ₂ : DirichletCharacter ℂ q) (ρ₁ ρ₂ : ℂ),
        1 - 1 / (9.645908801 * Real.log (max (q : ℝ) (q * |ρ₁.im|))) ≤ ρ₁.re →
        1 - 1 / (9.645908801 * Real.log (max (q : ℝ) (q * |ρ₂.im|))) ≤ ρ₂.re →
        0 < meromorphicOrderAt (DirichletCharacter.LFunction χ₁) ρ₁ →
        0 < meromorphicOrderAt (DirichletCharacter.LFunction χ₂) ρ₂ → χ₁ = χ₂ ∧ ρ₁ = ρ₂ :=
  sorry

/-- **Layer 7.5, Kadiri's region for conductors up to `400 000`.** For `3 ≤ q ≤ 400 000` and `χ`
primitive modulo `q` (hence non-principal), `L(s, χ) ≠ 0` for
`Re s ≥ 1 − 1/(5.60 log(q max(1, |Im s|)))` (Kadiri, Theorem 1.1). -/
theorem LFunction_ne_zero_kadiri {q : ℕ} [NeZero q] (hq₀ : 3 ≤ q) (hq₁ : q ≤ 400000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℂ)
    (hσ : 1 - 1 / (5.60 * Real.log (q * max 1 |s.im|)) ≤ s.re) :
    DirichletCharacter.LFunction χ s ≠ 0 := sorry

/-- **Layer 7.6, the Vinogradov–Korobov region with `c = 55.241`.** Given the Riemann hypothesis
up to height `3·10¹²`, `ζ(σ + it) ≠ 0` for `|t| ≥ 3` and
`σ ≥ 1 − 1/(55.241 (log |t|)^{2/3} (log log |t|)^{1/3})` (Mossinghoff, Trudgian and Yang,
Theorem 1.1). -/
theorem riemannZeta_ne_zero_vinogradovKorobov (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12))
    (s : ℂ) (ht : 3 ≤ |s.im|)
    (hσ : 1 - 1 / (55.241 * Real.log |s.im| ^ ((2 : ℝ) / 3) *
      Real.log (Real.log |s.im|) ^ ((1 : ℝ) / 3)) ≤ s.re) :
    riemannZeta s ≠ 0 := sorry

/-- **Layer 7.7, real zeros of quadratic L-functions of large conductor.** For `χ` primitive and
quadratic modulo `q > 400 000`, every real zero `β` of `L(s, χ)` satisfies
`β ≤ 1 − 800/(√q log² q)` if `χ` is odd, `β ≤ 1 − 515/(√q log² q)` if `χ` is even and
`q ≤ 10⁷`, and `β ≤ 1 − 80/(√q log² q)` if `χ` is even and `q > 10⁷` (Bordignon, Theorem 1.3).
The trivial zeros `β ≤ 0` satisfy the bounds trivially. -/
theorem LFunction_real_zero_le_bordignon {q : ℕ} [NeZero q] (hq : 400000 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hχq : MulChar.IsQuadratic χ) (β : ℝ)
    (hβ : DirichletCharacter.LFunction χ β = 0) :
    (χ.Odd → β ≤ 1 - 800 / (Real.sqrt q * Real.log q ^ 2)) ∧
      (χ.Even → q ≤ 10 ^ 7 → β ≤ 1 - 515 / (Real.sqrt q * Real.log q ^ 2)) ∧
      (χ.Even → 10 ^ 7 < q → β ≤ 1 - 80 / (Real.sqrt q * Real.log q ^ 2)) := sorry

/-- **Layer 7.8, real zeros for moduli up to `10¹⁰`.** For `q ≤ 10¹⁰` and every quadratic
character `χ` modulo `q`, primitive or not, `L(σ, χ) ≠ 0` for real `σ ≥ 1 − 1/(5 log q)` (Lu, Zaman
and Zhao, Theorem 1.1). Hence every real zero `β ∈ (0, 1)` of a primitive real character of
conductor `3 ≤ q ≤ 10¹⁰` has `(1 − β) log q > 1/5`. -/
theorem LFunction_real_ne_zero_luZamanZhao {q : ℕ} [NeZero q] (hq : q ≤ 10 ^ 10)
    (χ : DirichletCharacter ℂ q) (hχ : MulChar.IsQuadratic χ) (hχ₁ : χ ≠ 1) (σ : ℝ)
    (hσ : 1 - 1 / (5 * Real.log q) ≤ σ) :
    DirichletCharacter.LFunction χ σ ≠ 0 := sorry

/-- **Layer 7.10, the reciprocal of `ζ` on the line one.** Given the Riemann hypothesis up to
height `545 439 823`, `1/|ζ(1 + it)| ≤ 431.7 log t / log log t` for `t ≥ 3` (Hiary, Leong and
Yang, Theorem 2, whose proof uses the region of 7.4). -/
theorem inv_norm_riemannZeta_one_add_le (hRH : RiemannHypothesisUpTo 545439823) (t : ℝ)
    (ht : 3 ≤ t) :
    ‖riemannZeta (1 + t * I)‖⁻¹ ≤ 431.7 * Real.log t / Real.log (Real.log t) := sorry

/-! ## Layer 8: zero-density estimates -/

/-- **Layer 8.3, the density count `N°(σ, T)` of Kadiri–Lumley–Ng.** The number of zeros `ρ` of
`ζ` with `σ < Re ρ < 1` and `0 < Im ρ < T`, counted with multiplicity: both inequalities strict,
as in `kadirilumleyng2018` (1.1). -/
noncomputable def zetaZeroDensityCount (σ T : ℝ) : ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | σ < ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im ∧ ρ.im < T},
    ((meromorphicOrderAt riemannZeta ρ).untop₀).toNat

/-- **Layer 8.3, the Kadiri–Lumley–Ng density bound at `σ = 9/10`.** Given the Riemann hypothesis
up to height `H₀ = 30 610 046 000`, for every `T ≥ H₀`,
`N°(9/10, T) < 11.499 (log T)^{16/5} T^{4/15} + 3.186 log² T`, the count being that of
`zetaZeroDensityCount` (Kadiri, Lumley and Ng, Theorem 1.1 with the parameters of their §5). -/
theorem zetaZeroDensityCount_nine_tenths_lt (hRH : RiemannHypothesisUpTo 30610046000) (T : ℝ)
    (hT : 30610046000 ≤ T) :
    (zetaZeroDensityCount (9 / 10) T : ℝ) <
      11.499 * Real.log T ^ ((16 : ℝ) / 5) * T ^ ((4 : ℝ) / 15) + 3.186 * Real.log T ^ 2 :=
  sorry

/-- **Layer 8.5, a log-free density near `σ = 1`.** Given the Riemann hypothesis up to height
`3·10¹²`, for `3·10¹² < T ≤ exp(6.7·10¹²)` and `0.9927 ≤ σ ≤ 1`,
`N°(σ, T) ≤ 1.62·10¹¹ T^{1.448 (1 − σ)}` (Bellotti, Theorem 1.1, the uniform constants). -/
theorem zetaZeroDensityCount_le_bellotti (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12)) (σ T : ℝ)
    (hσ₀ : 0.9927 ≤ σ) (hσ₁ : σ ≤ 1) (hT₀ : 3 * 10 ^ 12 < T)
    (hT₁ : T ≤ Real.exp (6.7 * 10 ^ 12)) :
    (zetaZeroDensityCount σ T : ℝ) ≤ 1.62 * 10 ^ 11 * T ^ (1.448 * (1 - σ)) := sorry

/-! ## Layer 9: the size of `L(1, χ)` -/

/-- **Layer 9.1, Ramaré's upper bounds.** For `χ` primitive modulo `q > 1`,
`|L(1, χ)| ≤ (1/2) log q` if `χ` is even and `≤ (1/2) log q + 5/2 − log 6` if `χ` is odd; and if
`q` is even, `|L(1, χ)| ≤ (1/4) log q + (1/2) log 2` for even `χ` and
`≤ (1/4) log q + 5/4 − (1/2) log 3` for odd `χ` (Ramaré 2001, Corollary 1). -/
theorem norm_LFunction_one_le_ramare {q : ℕ} [NeZero q] (hq : 1 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) :
    (χ.Even → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 2) ∧
      (χ.Odd → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 2 + 5 / 2 - Real.log 6) ∧
      (2 ∣ q → χ.Even →
        ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 4 + Real.log 2 / 2) ∧
      (2 ∣ q → χ.Odd →
        ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 4 + 5 / 4 - Real.log 3 / 2) := sorry

/-- **Layer 9.3, the lower bound for non-quadratic characters.** For `χ` primitive modulo `q ≥ 2`
and not quadratic, `|L(1, χ)| ≥ 1/(9.690292 log(q/π))` (Mossinghoff, Starichkova and Trudgian,
Theorem 1.1). Primitive non-quadratic characters exist only for `q ≥ 5`, where `log(q/π) > 0`. -/
theorem norm_LFunction_one_ge {q : ℕ} [NeZero q] (hq : 2 ≤ q) (χ : DirichletCharacter ℂ q)
    (hχ : χ.IsPrimitive) (hχq : ¬ MulChar.IsQuadratic χ) :
    1 / (9.690292 * Real.log (q / π)) ≤ ‖DirichletCharacter.LFunction χ 1‖ := sorry

end TauCetiRoadmap.ExplicitZetaBounds
