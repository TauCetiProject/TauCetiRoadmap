import Mathlib
import TauCeti.Analysis.Meromorphic.Continuation
import TauCeti.Analysis.SpecialFunctions.LogIntegral
import TauCeti.NumberTheory.ArithmeticDirichletSeries.VonMangoldt
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.VonMangoldt
import TauCeti.NumberTheory.LFunctions.Dirichlet.Basic
import TauCeti.NumberTheory.LFunctions.Hecke.Basic
import TauCeti.NumberTheory.LFunctions.Hecke.Primitive
import TauCeti.NumberTheory.NumberField.Global.RayClass.Basic
import TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus

/-!
# Zeros of L-functions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need: the order predicate `OrderLE` of Layer 0, the zero count `zeroCount` of
Layer 4, the entire completion `zetaEntireCompletion` of the Riemann zeta function (the `ζ`
instance of the entire completion of Layer 0), and the gamma constant `gammaLogDerivBound` of
6.4a.

The continued Dedekind zeta function of a number field `K` is Tau Ceti's canonical continuation
`TauCeti.meromorphicContinuation 1 (NumberField.dedekindZeta K)`, and the L-function of a
primitive finite-order ray-class character `ψ` is `TauCeti.LFunctions.heckeLFunctionC ψ.character`,
the canonical continuation of its series presented at its conductor. Both are `0` when no
continuation exists, so none of the zero statements below can be proved without the
continuation.

Stated here:

* Layer 3, the convexity bound on the critical line, uniform over primitive Dirichlet characters;
* Layer 5, Hadamard's factorization of an entire function of order at most one, and its instance
  `zetaEntireCompletion`; the summability of `m_ρ / (1 + (Im ρ)²)` over the zeros of the completed
  zeta function (5.6a);
* Layer 6, the de la Vallée Poussin region for `ζ_K` uniform over the fields of degree `n` (6.2)
  and its instance `ζ`; the region for primitive ray-class L-functions uniform over the fields of
  degree `n` and their characters (6.4), and its Dirichlet instance with the normalization
  `c ≤ log 3 / 2`; and, from 6.4a, the order bound of the completed Dirichlet record and the
  finite-sum retained-zero inequality with the gamma constant; and the two bounds for `−Re ζ'/ζ`
  off the real axis on which the region for `ζ` rests (6.4d);
* Layer 7, the Riemann–von Mangoldt formula for `ζ`, and its uniform forms (7.5): for `ζ_K` with
  one constant for all number fields, for primitive ray-class L-functions with a constant
  depending on the degree only, and for primitive Dirichlet characters with one constant;
* Layer 8, the truncated explicit formula for `Chebyshev.psi` and the Weil explicit formula for
  `ζ` (8.3–8.4 at `K = ℚ`), the Weil explicit formula for `ζ_K` (8.4) and for a nontrivial
  primitive ray-class character (8.6), the effective prime ideal theorem (8.5), the effective
  prime count in a ray class (8.7) with its `K = ℚ` case, and the effective abelian Chebotarev
  count (8.8).

The counts of 7.5 and the Weil formulas 8.4 and 8.6 over a general field run over the open strip
`0 < Re s < 1`, where the zeros of the continued functions are those of their completions with the
same multiplicities; this leaves out the trivial zeros at `s = 0`.

Not stated here:

* The completed Dedekind zeta function and the completed Hecke L-functions (L-functions Layers 3
  and 5) are not at the pins; the headline theorems are therefore stated through the continued
  functions, which carry the same zeros in the open critical strip.
* The exceptional-zero terms of 8.5–8.8 are defined (6.3) from the region constant of 6.4, the
  witness of a theorem stated here with `sorry`, so they are not defined here. For a fixed field,
  modulus or extension they are `O(x^β)` with `β < 1` and are absorbed by the error term, which is
  the form in which 8.5, 8.7 and 8.8 are stated.
* The convexity bound 3.4 and the truncated explicit formulas 8.3 and 8.6 over a general field are
  steps toward the end theorems and stay README targets, as do the growth, gamma-factor,
  conductor, counting, rectangle-contour and certificate statements of Layers 0–2, 4, 7.1–7.3 and
  9, and the completion comparisons, gamma bound, one-zero inequality and finite-family radius of
  6.4a.
-/

namespace TauCetiRoadmap.ZerosOfLFunctions

open Complex Filter Asymptotics Set NumberField
open scoped Real ContDiff nonZeroDivisors

/-- **Layer 0.1, the order predicate.** `f` has order at most `A`: for every `A' > A`,
`f(s) = O(exp ‖s‖^{A'})` as `‖s‖ → ∞`. Entirety is a hypothesis of the theorems that use the
predicate, not part of it. -/
def OrderLE (f : ℂ → ℂ) (A : ℝ) : Prop :=
  ∀ A' > A, f =O[Bornology.cobounded ℂ] fun s ↦ Real.exp (‖s‖ ^ A')

/-- **Layer 4.1, the zero count.** The number of zeros of `f` in `R`, with multiplicity: the
finite sum over `R` of the positive part of the divisor of `f` on `U`. Poles contribute `0`,
and the sum is meaningful when `f` is meromorphic on `U ⊇ R` and its divisor has finite support
in `R` (a finsum over an infinite support is `0`). -/
noncomputable def zeroCount (f : ℂ → ℂ) (U R : Set ℂ) : ℕ :=
  ∑ᶠ ρ ∈ R, (MeromorphicOn.divisor f U ρ).toNat

/-- **Layer 0.2 at the `ζ` instance, the entire completion.**
`zetaEntireCompletion s = s (s − 1) Λ(s)`, where `Λ = completedRiemannZeta`; it is written
through the entire function `completedRiemannZeta₀ = Λ + 1/s + 1/(1 − s)`, so that it is a
genuine entire function with the correct value `1` at `s = 0` and `s = 1`, where `Λ` has simple
poles. It is twice Riemann's `ξ`, whose normalization carries a factor `1/2`. -/
noncomputable def zetaEntireCompletion (s : ℂ) : ℂ :=
  s * (s - 1) * completedRiemannZeta₀ s + 1

/-! ## Layer 3: convexity -/

/-- **Layer 3.4, the convexity bound, uniform in the conductor.** For every `ε > 0` there is
`C` such that every primitive Dirichlet character `χ` modulo `q` satisfies
`‖L(1/2 + it, χ)‖ ≤ C (q (|t| + 3))^{1/4 + ε}` for all real `t`. At `q = 1` this is
`ζ(1/2 + it) ≪ |t|^{1/4 + ε}` (Titchmarsh §5.1); the general form is the convexity bound of
Iwaniec–Kowalski §5.2 for the analytic conductor `q(|t| + 3)`. -/
theorem dirichletLFunction_convexity (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive → ∀ t : ℝ,
      ‖DirichletCharacter.LFunction χ (1 / 2 + t * I)‖ ≤
        C * ((q : ℝ) * (|t| + 3)) ^ (1 / 4 + ε) := sorry

/-! ## Layer 5: Hadamard factorization -/

/-- **Layer 5.5, Hadamard's factorization at order at most one.** An entire `f` of order at most
`1` with `f 0 ≠ 0` is `exp (a + b s) ∏_ρ ((1 − s/ρ) e^{s/ρ})^{m_ρ}`, the product over its zeros
`ρ` with their multiplicities `m_ρ`, unconditionally convergent for every `s` (Davenport,
*Multiplicative Number Theory*, §11). The index is all of `ℂ`, the exponent being `0` off the
zeros; `f 0 ≠ 0` makes the factor at `ρ = 0` equal to `1`. -/
theorem hadamard_of_orderLE_one (f : ℂ → ℂ) (hf : Differentiable ℂ f) (h0 : f 0 ≠ 0)
    (hord : OrderLE f 1) :
    ∃ a b : ℂ, ∀ s : ℂ,
      Multipliable (fun ρ : ℂ ↦ ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor f univ ρ).toNat) ∧
      f s = cexp (a + b * s) * ∏' ρ : ℂ, ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor f univ ρ).toNat :=
  sorry

/-- **Layer 5.5 at the `ζ` instance.** There are constants `A, B` with
`zetaEntireCompletion s = exp (A + B s) ∏_ρ ((1 − s/ρ) e^{s/ρ})^{m_ρ}` for every `s`, the
product over the zeros of `zetaEntireCompletion` with their multiplicities and unconditionally
convergent (Davenport §12). Its content beyond `hadamard_of_orderLE_one` is that
`zetaEntireCompletion` has order at most `1` (Layer 3.1). -/
theorem zetaEntireCompletion_hadamard :
    ∃ A B : ℂ, ∀ s : ℂ,
      Multipliable (fun ρ : ℂ ↦ ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor zetaEntireCompletion univ ρ).toNat) ∧
      zetaEntireCompletion s = cexp (A + B * s) * ∏' ρ : ℂ, ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor zetaEntireCompletion univ ρ).toNat :=
  sorry

/-- **Layer 5.6a at the `ζ` instance, ordinate summability.** With `m_ρ` the multiplicity of `ρ`
as a zero of the completed zeta function, the family `ρ ↦ m_ρ / (1 + (Im ρ)²)` over `ℂ` is
summable. A weight in the ordinate alone is legitimate because the zeros lie in
`0 ≤ Re ρ ≤ 1`; over the zeros of `riemannZeta` the trivial zeros, each of ordinate `0`, would
make the family diverge. -/
theorem riemannZeta_zeros_summable_ordinate :
    Summable (fun ρ : ℂ ↦
      ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℝ) / (1 + ρ.im ^ 2)) :=
  sorry

/-! ## Layer 6: zero-free regions -/

/-- **Layer 6.2, the de la Vallée Poussin region for `ζ_K`.** For each degree `n` there is
`c > 0` such that for every number field `K` of degree `n`, the continued Dedekind zeta function
has at most one zero `ρ` with `Re ρ ≥ 1 − c / log (|d_K| (|Im ρ| + 3)^n)`, and such a zero is real
and simple. Zeros are read through the meromorphic order, so the pole at `s = 1` is never one.
The quantity `|d_K| (|Im ρ| + 3)^n` is the analytic conductor up to a factor depending on `n`
(Kadiri, Theorem 1.1, for `d_K` large; the passage to every field of degree `n` is README
6.4e). -/
theorem dedekindZeta_zeroFreeRegion (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type*) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ ρ₁ ρ₂ : ℂ,
        1 - c / Real.log (|(discr K : ℝ)| * (|ρ₁.im| + 3) ^ n) ≤ ρ₁.re →
        1 - c / Real.log (|(discr K : ℝ)| * (|ρ₂.im| + 3) ^ n) ≤ ρ₂.re →
        0 < meromorphicOrderAt (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) ρ₁ →
        0 < meromorphicOrderAt (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) ρ₂ →
        ρ₁ = ρ₂ ∧ ρ₁.im = 0 ∧
          meromorphicOrderAt (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) ρ₁ = 1 :=
  sorry

/-- **Layer 6.2 at `K = ℚ`, the de la Vallée Poussin region.** There is `c > 0` such that
`ζ(s) ≠ 0` whenever `s ≠ 1` and `Re s ≥ 1 − c / log (|Im s| + 3)` (Davenport §13). -/
theorem riemannZeta_zeroFreeRegion :
    ∃ c : ℝ, 0 < c ∧ ∀ s : ℂ, s ≠ 1 → 1 - c / Real.log (|s.im| + 3) ≤ s.re →
      riemannZeta s ≠ 0 := sorry

/-- **Layer 6.4, the region for primitive ray-class L-functions.** For each degree `n` there is
`c > 0` such that for every number field `K` of degree `n` and every primitive finite-order
ray-class character `ψ` of conductor `𝔣`, the L-function `heckeLFunctionC ψ.character` has at most
one zero `ρ` with `Re ρ ≥ 1 − c / log (|d_K| 𝔑𝔣 (|Im ρ| + 3)^n)`; such a zero is real and simple,
and occurs only for a real character (`ψ² = 1`). At the trivial character this is the region of
`dedekindZeta_zeroFreeRegion`. -/
theorem heckeLFunction_zeroFreeRegion (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type*) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ (ψ : TauCeti.LFunctions.PrimitiveRayClassCharacter K) (ρ₁ ρ₂ : ℂ),
        1 - c / Real.log (|(discr K : ℝ)| * (Ideal.absNorm ψ.conductor.finitePart : ℝ) *
          (|ρ₁.im| + 3) ^ n) ≤ ρ₁.re →
        1 - c / Real.log (|(discr K : ℝ)| * (Ideal.absNorm ψ.conductor.finitePart : ℝ) *
          (|ρ₂.im| + 3) ^ n) ≤ ρ₂.re →
        0 < meromorphicOrderAt (TauCeti.LFunctions.heckeLFunctionC ψ.character) ρ₁ →
        0 < meromorphicOrderAt (TauCeti.LFunctions.heckeLFunctionC ψ.character) ρ₂ →
        ρ₁ = ρ₂ ∧ ρ₁.im = 0 ∧ ψ.character ^ 2 = 1 ∧
          meromorphicOrderAt (TauCeti.LFunctions.heckeLFunctionC ψ.character) ρ₁ = 1 :=
  sorry

/-- **Layer 6.3–6.4 at `K = ℚ`, the region for Dirichlet L-functions.** There is one absolute
constant `c`, with `0 < c ≤ log 3 / 2`, such that for every modulus `q ≥ 1` and every Dirichlet
character `χ` modulo `q`, primitive or not, a zero `ρ` of `L(·, χ)` with
`Re ρ ≥ 1 − c / log (q (|Im ρ| + 3))` is real, simple, and occurs only for a real character
(`χ² = 1`), and there is at most one such zero (Davenport §14). Zeros are read through the
meromorphic order, so the pole of the principal character at `s = 1` is never one. For primitive
`χ` this is the case `n = 1` of `heckeLFunction_zeroFreeRegion`. An imprimitive `χ` inherits it
from its primitive character `χ*` of conductor `q* ∣ q`: `L(s, χ)` is `L(s, χ*)` times Euler
factors vanishing only on `Re s = 0` (`DirichletCharacter.LFunction_changeLevel`), the bound
`c ≤ log 3 / 2` puts the whole region in `Re s ≥ 1/2`, and the region at `q` lies inside the
region at `q*`. -/
theorem dirichletLFunction_zeroFreeRegion :
    ∃ c : ℝ, 0 < c ∧ c ≤ Real.log 3 / 2 ∧
      ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
        (∀ ρ : ℂ, 1 - c / Real.log (q * (|ρ.im| + 3)) ≤ ρ.re →
          0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ →
          ρ.im = 0 ∧ χ ^ 2 = 1 ∧ meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ = 1) ∧
        ∀ ρ₁ ρ₂ : ℂ, 1 - c / Real.log (q * (|ρ₁.im| + 3)) ≤ ρ₁.re →
          1 - c / Real.log (q * (|ρ₂.im| + 3)) ≤ ρ₂.re →
          0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ₁ →
          0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ₂ → ρ₁ = ρ₂ := sorry

/-- **6.4a, order of the completion.** For a primitive `χ ≠ 1` modulo `q`, the completed
function `q^{s/2} Λ(s, χ)` of the Tau Ceti record `dirichletData` is entire of order at most one,
from partial summation on `Re s ≥ 1/2`, Stirling's formula and the functional equation
(Davenport §12); it is the order-one input of the Hadamard product of Montgomery–Vaughan,
Theorem 10.16, p. 351. -/
theorem completed_orderLE_one {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q)
    (hprim : χ.IsPrimitive) (hne : χ ≠ 1) :
    OrderLE (TauCeti.LFunctions.dirichletData χ hprim).completed 1 :=
  sorry

/-- **6.4a, the gamma constant** `C_Γ = ½ (|ψ(1/2)| + |ψ(3/2)| + |log π|)`, written in Euler's
constant and elementary logarithms (`ψ(1/2) = −γ_E − 2 log 2`, `ψ(3/2) = 2 − γ_E − 2 log 2`,
DLMF 5.4.13 and 5.5.2). Its value is `1 + (log π)/2`, and it bounds `‖logDeriv Gammaℝ s‖` for
real `1 ≤ s ≤ 3`, the interval covering both parity shifts `σ + κ` with `1 < σ ≤ 2` and
`κ ∈ {0, 1}`. -/
noncomputable def gammaLogDerivBound : ℝ :=
  (|-Real.eulerMascheroniConstant - 2 * Real.log 2| +
    |2 - Real.eulerMascheroniConstant - 2 * Real.log 2| + |Real.log Real.pi|) / 2

/-- **6.4a, the finite-sum retained-zero inequality.** For a primitive `χ ≠ 1` of conductor
`q`, real or not, any finite set `S` of zeros of `L(·, χ)` in the critical strip, each weighted
by its analytic multiplicity `analyticOrderNatAt`, and `1 < σ ≤ 2`,
`∑_{ρ ∈ S} m_ρ Re (1/(σ − ρ)) ≤ Re (L'/L)(σ, χ) + ½ log q + C_Γ`, with `C_Γ` fixed before `S`,
`q`, `χ` and `σ`. The route is the partial-fraction expansion of `L'/L` with the real-part
cancellation `Re B(χ) = −∑_ρ Re (1/ρ)` (Montgomery–Vaughan, Corollary 10.18, (10.37)–(10.38),
pp. 352–353): every zero of the completion contributes `Re (1/(σ − ρ)) ≥ 0`, the zeros outside
`S` are discarded, and the gamma term is at most `C_Γ`. Reality of `χ` is not used, and
`χ ≠ 1` forces `q ≥ 3`. -/
theorem finite_zero_sum_le_logDeriv {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q)
    (hprim : χ.IsPrimitive) (hne : χ ≠ 1)
    (S : Finset ℂ) (hS : ∀ ρ ∈ S, 0 < ρ.re ∧ ρ.re < 1 ∧ χ.LFunction ρ = 0)
    (σ : ℝ) (hσ : 1 < σ) (hσ2 : σ ≤ 2) :
    (∑ ρ ∈ S, (analyticOrderNatAt χ.LFunction ρ : ℝ) * (1 / ((σ : ℂ) - ρ)).re) ≤
      (logDeriv χ.LFunction (σ : ℂ)).re + Real.log q / 2 + gammaLogDerivBound :=
  sorry

/-- **Layer 6.4d at `K = ℚ`, off the real axis.** For every `t₀ > 1` there is `C` such that, for
`δ > 0` and `|t| ≥ t₀`, `−Re (ζ'/ζ)(1 + δ + 2it) ≤ C log |t|`, and
`−Re (ζ'/ζ)(1 + δ + it) ≤ −1/(1 + δ − β) + C log |t|` whenever `β + it` is a zero of `ζ`: the two
inputs of the `3-4-1` argument at height `t` (Davenport §13). Off the real axis `ζ` is analytic,
so vanishing there is a zero. The threshold keeps `log |t|` positive: as `t → 0` with `δ = 2|t|`,
the first left side is `1/(4|t|) + O(1)`. -/
theorem neg_re_logDeriv_riemannZeta_le (t₀ : ℝ) (ht₀ : 1 < t₀) :
    ∃ C : ℝ, ∀ δ : ℝ, 0 < δ → ∀ t : ℝ, t₀ ≤ |t| →
      -(logDeriv riemannZeta (1 + δ + 2 * t * I)).re ≤ C * Real.log |t| ∧
        ∀ β : ℝ, riemannZeta (β + t * I) = 0 →
          -(logDeriv riemannZeta (1 + δ + t * I)).re ≤ -1 / (1 + δ - β) + C * Real.log |t| :=
  sorry

/-! ## Layer 7: the Riemann–von Mangoldt formula -/

/-- **Layer 7.4–7.5, Riemann–von Mangoldt for `ζ`.** With `N(T)` the number of zeros of the
completed zeta function `Λ` in `0 ≤ Re s ≤ 1`, `0 < Im s ≤ T`, counted with multiplicity,
`N(T) = (T/2π) log (T/2πe) + O(log T)` for every `T ≥ 2` (Titchmarsh, Theorem 9.4). The poles of
`Λ` at `0` and `1` lie on the excluded real axis. -/
theorem riemannVonMangoldt :
    ∃ C : ℝ, ∀ T : ℝ, 2 ≤ T →
      |(zeroCount completedRiemannZeta univ (Icc (0 : ℝ) 1 ×ℂ Ioc (0 : ℝ) T) : ℝ) -
          T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤ C * Real.log T := sorry

/-- **Layer 7.5 for `ζ_K`, uniform in the field and the degree.** There is an absolute `C` such
that for every number field `K`, of degree `n`, and every `T ≥ 2`, the number `N±_K(T)` of zeros
of the continued Dedekind zeta function in `0 < Re s < 1`, `|Im s| ≤ T`, with multiplicity,
satisfies
`|N±_K(T) − (T/π) log (|d_K| (T/2πe)^n)| ≤ C log (|d_K| T^n)`. In the open strip these are the
zeros of the completed function, which has none on the two edges; the open strip leaves out the
trivial zero at `0`. With explicit constants this is Hasanalizade–Shen–Wong, Theorem 1.1, p. 2
(arXiv:2102.04663v3), whose error `0.22737 log (|d_K| ((T + 2)/2π)^n) + 23.02528 n + 4.51954`,
with the term `r₁/4`, is at most `41 log (|d_K| T^n)` for `T ≥ 2`. -/
theorem riemannVonMangoldt_dedekindZeta :
    ∃ C : ℝ, ∀ (K : Type*) [Field K] [NumberField K] (T : ℝ), 2 ≤ T →
      |(zeroCount (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) univ
            (Ioo (0 : ℝ) 1 ×ℂ Icc (-T) T) : ℝ) -
          T / π * Real.log (|(discr K : ℝ)| * (T / (2 * π * Real.exp 1)) ^ Module.finrank ℚ K)| ≤
        C * Real.log (|(discr K : ℝ)| * T ^ Module.finrank ℚ K) :=
  sorry

/-- **Layer 7.5 for primitive ray-class L-functions, uniform in the field and the conductor.** For
each degree `n` there is `C` such that for every number field `K` of degree `n`, every primitive
finite-order ray-class character `ψ` of conductor `𝔣` and every `T ≥ 2`, the number of zeros of
`heckeLFunctionC ψ.character` in `0 < Re s < 1`, `|Im s| ≤ T`, with multiplicity, is
`(T/π) log (|d_K| 𝔑𝔣 (T/2πe)^n) + O(log (|d_K| 𝔑𝔣 T^n))`, the implied constant `C`. -/
theorem riemannVonMangoldt_heckeLFunction (n : ℕ) :
    ∃ C : ℝ, ∀ (K : Type*) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ (ψ : TauCeti.LFunctions.PrimitiveRayClassCharacter K) (T : ℝ), 2 ≤ T →
        |(zeroCount (TauCeti.LFunctions.heckeLFunctionC ψ.character) univ
              (Ioo (0 : ℝ) 1 ×ℂ Icc (-T) T) : ℝ) -
            T / π * Real.log (|(discr K : ℝ)| * (Ideal.absNorm ψ.conductor.finitePart : ℝ) *
              (T / (2 * π * Real.exp 1)) ^ n)| ≤
          C * Real.log (|(discr K : ℝ)| * (Ideal.absNorm ψ.conductor.finitePart : ℝ) * T ^ n) :=
  sorry

/-- **Layer 7.5 at `K = ℚ`, the conductor-uniform count.** One constant `C` serves every
primitive Dirichlet character `χ` modulo `q`: the number `N±(T, χ)` of zeros of the completed
L-function in `0 ≤ Re s ≤ 1`, `|Im s| ≤ T` satisfies
`|N±(T, χ) − (T/π) log (qT/2πe)| ≤ C log (qT)` for `T ≥ 2` (Davenport §16; for conductor `q > 1`
with explicit constants, Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.2). The conductor
enters as `q`, not `q^{1/2}`; at `q = 1` this is twice the count of `riemannVonMangoldt`. -/
theorem riemannVonMangoldt_dirichlet :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive →
      ∀ T : ℝ, 2 ≤ T →
        |(zeroCount (DirichletCharacter.completedLFunction χ) univ
              (Icc (0 : ℝ) 1 ×ℂ Icc (-T) T) : ℝ) -
            T / π * Real.log (q * T / (2 * π * Real.exp 1))| ≤ C * Real.log (q * T) := sorry

/-! ## Layer 8: the explicit formula and effective prime counts -/

/-- **Layer 8.3 at `K = ℚ`, the truncated explicit formula.** For `2 ≤ T ≤ x`,
`ψ(x) = x − ∑_{|Im ρ| ≤ T} x^ρ/ρ − log 2π − ½ log (1 − x^{−2}) + O(x log² x / T)`, the sum over
the zeros of the completed zeta function with multiplicity (the poles at `0` and `1` contribute
nothing, being points of negative divisor). This is Davenport §17's formula; the hypothesis
`T ≤ x` absorbs both its `log x` term near prime powers and the difference between `ψ` and its
half-value normalization. -/
theorem chebyshevPsi_explicitFormula :
    ∃ C : ℝ, ∀ x T : ℝ, 2 ≤ T → T ≤ x →
      ‖((Chebyshev.psi x : ℝ) : ℂ) -
          ((x : ℂ) - (∑ᶠ ρ ∈ Icc (0 : ℝ) 1 ×ℂ Icc (-T) T,
              ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℂ) * (x : ℂ) ^ ρ / ρ) -
            ((Real.log (2 * π) : ℝ) : ℂ) - ((Real.log (1 - x ^ (-2 : ℤ)) / 2 : ℝ) : ℂ))‖ ≤
        C * x * Real.log x ^ 2 / T := sorry

/-- **Layer 8.4, the Weil explicit formula for the Dedekind zeta function.** Let `K` be a number
field with `r₁` real and `r₂` complex places, and `φ` smooth with compact support in `(0, ∞)`, with
Mellin transform `φ̃`. With `m_ρ` the multiplicity of `ρ` as a zero of `ζ_K` in the open strip
`0 < Re ρ < 1`, the family `ρ ↦ m_ρ φ̃(ρ)` over `ℂ` is summable, and
`∑_ρ m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + (log |d_K|) φ(1) + A_K(φ) − ∑_𝔞 Λ_K(𝔞) (φ(𝔑𝔞) + φ(1/𝔑𝔞)/𝔑𝔞)`,
the last sum over the nonzero ideals `𝔞` of `𝓞 K` with the ideal von Mangoldt function `Λ_K`, where
`A_K(φ) = (2π)⁻¹ ∫ (r₁ Γℝ'/Γℝ + r₂ Γℂ'/Γℂ)(2 + it) (φ̃(2 + it) + φ̃(−1 − it)) dt` is the
archimedean term (Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1, for this test class).
On the open strip the zeros of the continued `ζ_K` are those of
`Λ_K(s) = |d_K|^{s/2} Γℝ(s)^{r₁} Γℂ(s)^{r₂} ζ_K(s)` with the same multiplicities, and `Λ_K` has no
zeros off the open strip; the poles of `Λ_K` at `0` and `1` give
`φ̃(0) + φ̃(1)`, and `(log |d_K|) φ(1)` is the constant `½ log |d_K|` of `Λ_K'/Λ_K` integrated once
against `φ̃(s)` and once against `φ̃(1 − s)`. At `K = ℚ` this is `riemannZeta_weilExplicitFormula`.
-/
theorem dedekindZeta_weilExplicitFormula (K : Type*) [Field K] [NumberField K] (φ : ℝ → ℂ)
    (hφ : ContDiff ℝ ∞ φ) (hsupp : HasCompactSupport φ) (hpos : tsupport φ ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦ (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) univ ρ).toNat :
          ℂ) * mellin φ ρ) ρ) ∧
      ∑' ρ : ℂ, (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) univ ρ).toNat :
          ℂ) * mellin φ ρ) ρ =
        mellin φ 0 + mellin φ 1 + (Real.log |(NumberField.discr K : ℝ)| : ℂ) * φ 1 +
          (2 * π : ℂ)⁻¹ * (∫ t : ℝ,
            ((NumberField.InfinitePlace.nrRealPlaces K : ℂ) * logDeriv Gammaℝ (2 + t * I) +
              (NumberField.InfinitePlace.nrComplexPlaces K : ℂ) * logDeriv Gammaℂ (2 + t * I)) *
            (mellin φ (2 + t * I) + mellin φ (1 - (2 + t * I)))) -
          ∑' 𝔞 : (Ideal (NumberField.RingOfIntegers K))⁰,
            TauCeti.IdealArithmeticFunction.vonMangoldt (K := K) 𝔞 *
              (φ (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K))) +
                φ ((Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℝ))⁻¹ /
                  (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℂ)) :=
  sorry

/-- **Layer 8.4 at `K = ℚ`, the Weil explicit formula.** For `φ` smooth with compact support in
`(0, ∞)` and Mellin transform `φ̃`, the family `ρ ↦ m_ρ φ̃(ρ)` over the zeros of the completed
zeta function is summable, and
`∑_ρ m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + A(φ) − ∑_n Λ(n) (φ(n) + φ(1/n)/n)`, where
`A(φ) = (2π)⁻¹ ∫ (Γℝ'/Γℝ)(2 + it) (φ̃(2 + it) + φ̃(−1 − it)) dt` is the archimedean term and the
poles of `Λ` at `0` and `1` give `φ̃(0) + φ̃(1)` (Lang, *Algebraic Number Theory*, XVII §3,
Theorem 3.1, for this test class). The zero side is a `tsum` over the positive part of the
divisor, never a finsum. -/
theorem riemannZeta_weilExplicitFormula (φ : ℝ → ℂ) (hφ : ContDiff ℝ ∞ φ)
    (hsupp : HasCompactSupport φ) (hpos : tsupport φ ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦
        ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℂ) * mellin φ ρ) ∧
      ∑' ρ : ℂ, ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℂ) * mellin φ ρ =
        mellin φ 0 + mellin φ 1 +
          (2 * π : ℂ)⁻¹ * (∫ t : ℝ, logDeriv Gammaℝ (2 + t * I) *
            (mellin φ (2 + t * I) + mellin φ (1 - (2 + t * I)))) -
          ∑' n : ℕ, (ArithmeticFunction.vonMangoldt n : ℂ) * (φ n + φ (n : ℝ)⁻¹ / n) :=
  sorry

/-- **Layer 8.5, the effective prime ideal theorem.** For a number field `K` there is `c > 0`
such that the number of nonzero prime ideals of `𝓞 K` of norm at most `x` is
`Li(x) + O(x exp(−c √log x))`, with `Li = TauCeti.Real.logIntegral`, `Li x = ∫₂ˣ dt / log t`, and
the constants depending on `K`. For fixed `K` a possible exceptional zero `β` of `ζ_K` contributes
`Li(x^β)`, which the error absorbs. -/
theorem primeIdealCount_effective (K : Type*) [Field K] [NumberField K] :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ ↦ (Set.ncard
            {P : IsDedekindDomain.HeightOneSpectrum (𝓞 K) |
              (Ideal.absNorm P.asIdeal : ℝ) ≤ x} : ℝ) - TauCeti.Real.logIntegral x)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) := sorry

/-- **Layer 8.6, the Weil explicit formula for a nontrivial primitive ray-class character.** Let
`ψ ≠ 1` be a primitive finite-order ray-class character of a number field `K` with `r₁` real and
`r₂` complex places, of conductor `𝔣` with finite part `𝔣₀` and set `𝔣_∞` of real places, and `φ`
smooth with compact support in `(0, ∞)`, with Mellin transform `φ̃`. With `m_ρ` the multiplicity of
`ρ` as a zero of `L(ψ, s) = heckeLFunctionC ψ.character` in the open strip `0 < Re ρ < 1`, the
family `ρ ↦ m_ρ φ̃(ρ)` over `ℂ` is summable, and
`∑_ρ m_ρ φ̃(ρ) = log(|d_K| 𝔑𝔣₀) φ(1) + A_ψ(φ) − ∑_𝔞 Λ_K(𝔞) (ψ(𝔞) φ(𝔑𝔞) + conj ψ(𝔞) φ(1/𝔑𝔞)/𝔑𝔞)`,
the last sum over the nonzero ideals of `𝓞 K`, with `ψ(𝔞) = 0` for `𝔞` not prime to `𝔣₀`, where
`A_ψ(φ) = (2π)⁻¹ ∫ (logDeriv γ_ψ)(2 + it) (φ̃(2 + it) + φ̃(−1 − it)) dt` for the gamma factor
`γ_ψ(s) = Γℝ(s + 1)^{#𝔣_∞} Γℝ(s)^{r₁ − #𝔣_∞} Γℂ(s)^{r₂}`. The completion
`Λ(ψ, s) = (|d_K| 𝔑𝔣₀)^{s/2} γ_ψ(s) L(ψ, s)` is entire, which is why there is no pole term, and
`Λ(ψ, s) = W(ψ) Λ(ψ⁻¹, 1 − s)`; the reflection to `ψ⁻¹`, of the same conductor and gamma factor,
puts `conj ψ(𝔞)` in the second prime term. The shift at a real place `w` is the real parity at `w`
of the Hecke character of `ψ`, the shift of the L-functions roadmap's `heckeData`, and it is `1`
exactly when `w ∈ 𝔣_∞` (Tau Ceti `HeckeCharacter.mem_conductor_infinitePart_iff`). At `ψ = 1` the
formula is `dedekindZeta_weilExplicitFormula`, which has the pole terms `φ̃(0) + φ̃(1)`. -/
theorem heckeLFunction_weilExplicitFormula (K : Type*) [Field K] [NumberField K]
    (ψ : TauCeti.LFunctions.PrimitiveRayClassCharacter K) (hψ : ψ ≠ 1) (φ : ℝ → ℂ)
    (hφ : ContDiff ℝ ∞ φ) (hsupp : HasCompactSupport φ) (hpos : tsupport φ ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦ (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.LFunctions.heckeLFunctionC ψ.character) univ ρ).toNat :
          ℂ) * mellin φ ρ) ρ) ∧
      ∑' ρ : ℂ, (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.LFunctions.heckeLFunctionC ψ.character) univ ρ).toNat :
          ℂ) * mellin φ ρ) ρ =
        (Real.log (|(NumberField.discr K : ℝ)| *
            (Ideal.absNorm ψ.conductor.finitePart : ℝ)) : ℂ) * φ 1 +
          (2 * π : ℂ)⁻¹ * (∫ t : ℝ,
            ((ψ.conductor.infinitePart.card : ℂ) * logDeriv Gammaℝ (3 + t * I) +
              ((NumberField.InfinitePlace.nrRealPlaces K - ψ.conductor.infinitePart.card : ℕ) :
                ℂ) * logDeriv Gammaℝ (2 + t * I) +
              (NumberField.InfinitePlace.nrComplexPlaces K : ℂ) * logDeriv Gammaℂ (2 + t * I)) *
            (mellin φ (2 + t * I) + mellin φ (1 - (2 + t * I)))) -
          ∑' 𝔞 : (Ideal (NumberField.RingOfIntegers K))⁰,
            TauCeti.IdealArithmeticFunction.vonMangoldt (K := K) 𝔞 *
              (ψ.character.toMultiplicativeIdealWeight (𝔞 : Ideal (NumberField.RingOfIntegers K)) *
                  φ (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K))) +
                (starRingEnd ℂ) (ψ.character.toMultiplicativeIdealWeight
                    (𝔞 : Ideal (NumberField.RingOfIntegers K))) *
                  φ ((Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℝ))⁻¹ /
                    (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℂ)) :=
  sorry

/-- **Layer 8.7, the effective prime count in a ray class.** For each degree `n` there is
`c > 0` such that for every number field `K` of degree `n`, every modulus `𝔪` and every ray class
`a`, the number of prime ideals prime to `𝔪`, of norm at most `x` and in the class `a`, is
`Li(x)/#Cl_𝔪 + O(x exp(−c √log x))`, the implied constant depending on `K` and `𝔪`. For fixed
`K` and `𝔪` the exceptional term is `O(x^β)` with `β < 1`, which the error absorbs. The main
coefficient is `1/#Cl_𝔪`, not the ideal-counting constant. -/
theorem rayClassPrimeCount_effective (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type*) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ (𝔪 : TauCeti.GlobalNumberFields.Modulus K)
        (a : TauCeti.GlobalNumberFields.RayClassGroup 𝔪),
        (fun x : ℝ ↦ (Set.ncard {I : TauCeti.GlobalNumberFields.integralIdealsPrimeTo 𝔪 |
              (I : Ideal (𝓞 K)).IsPrime ∧ (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x ∧
                TauCeti.GlobalNumberFields.idealClass 𝔪 I = a} : ℝ) -
            TauCeti.Real.logIntegral x / Nat.card (TauCeti.GlobalNumberFields.RayClassGroup 𝔪))
          =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) :=
  sorry

/-- **Layer 8.7 at `K = ℚ`, the effective prime number theorem in arithmetic progressions.**
There is an absolute `c > 0` such that for every modulus `q ≥ 1` and residue `a` prime to `q`,
`π(x; q, a) = Li(x)/φ(q) + O(x exp(−c √log x))`, the implied constant depending on `q`
(Davenport §20; for fixed `q` a possible exceptional term `Li(x^β)/φ(q)` is absorbed). The
main term is the offset logarithmic integral `TauCeti.Real.logIntegral`, not `x / log x`. At
`q = 1` this is de la Vallée Poussin's `π(x) = Li(x) + O(x exp(−c √log x))`. -/
theorem primeCounting_progression_effective :
    ∃ c : ℝ, 0 < c ∧ ∀ q a : ℕ, 0 < q → Nat.Coprime a q →
      (fun x : ℝ ↦ ((((Nat.primesBelow (⌊x⌋₊ + 1)).filter (· ≡ a [MOD q])).card : ℕ) : ℝ) -
          TauCeti.Real.logIntegral x / q.totient)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) := sorry

/-- **Layer 8.8, effective Chebotarev for an abelian extension.** For an abelian extension `L/K`
of number fields with group `G` and a conjugacy class `C` of `G`, there is `c > 0` such that the
number of primes of `K` unramified in `L`, of norm at most `x`, whose Frobenius lies in `C` is
`(#C/#G) Li(x) + O(x exp(−c √log x))`: the ray-class count of 8.7 transported along the
ray-class Artin map of class field theory. The universe is that of the pinned reciprocity map. -/
theorem frobeniusPrimeCount_effective_abelian (K L : Type) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsAbelianGalois K L]
    (C : ConjClasses (L ≃ₐ[K] L)) :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ ↦ (NumberField.Chebotarev.frobeniusPrimeCount K L C x : ℝ) -
          (Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L) * TauCeti.Real.logIntegral x)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) :=
  sorry

end TauCetiRoadmap.ZerosOfLFunctions
