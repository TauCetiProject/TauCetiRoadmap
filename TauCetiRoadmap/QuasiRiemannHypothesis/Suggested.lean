module

import Mathlib
import TauCeti.NumberTheory.LFunctions.Hecke.Basic

/-!
# The quasi-Riemann hypothesis: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the one
definition they need: the order predicate `ZeroFreeRightOf` of Layer 1.1 (no zero in
`Re s > σ`, poles allowed).

The L-function of a ray class character `χ` of a modulus of a number field is Tau Ceti's
`TauCeti.LFunctions.heckeLFunctionC χ`, the canonical meromorphic continuation of its series at
the presentation modulus; it is `0` when no continuation exists, and its values at poles are those
of its meromorphic normal form. Every statement about it is therefore made through
`meromorphicOrderAt`, never through values, and none of them is satisfied vacuously by the junk
value `0`: the zero function is zero-free right of no `σ`.

Stated here:

* Layer 5.5, the transfer: for an abelian number field `K`, a zero-free half-plane for every
  primitive finite-order Hecke L-function of `K` gives the same half-plane for every Dirichlet
  L-function;
* Layer 10.7, the `11/12` half-plane: every finite-order Hecke L-function of `ℚ(√−3)`, presented at
  any modulus, every Dirichlet L-function at any level, and the Riemann zeta function have no zero
  in `Re s > 11/12`;
* Layer 11.1, the zero strip `1/12 ≤ Re ρ ≤ 11/12` for the zeros with `Re ρ > 0` of the primitive
  Dirichlet L-functions and of the primitive finite-order Hecke L-functions of `ℚ(√−3)`;
* Layer 11.2, the least character value outside `{0, 1}` under a zero-free half-plane `Re s > θ`,
  for Dirichlet characters (in `log q`) and for ray class characters of a number field (in the
  norm of the finite part of the modulus);
* Layer 11.3, the least quadratic nonresidue `n(p) ≤ C (log p)^12`, and Vinogradov's conjecture
  `n(p) ≪_δ p^δ`.

Not stated here:

* The continuation principle (1.3), the zero abscissa (1.2), the choice of the height exponent
  before the decay order (1.4), the probe with its low estimate and its comparison with the Mellin
  integral (Layer 10) and the detection of zeros by Dirichlet polynomials (Layer 7) are the
  mechanism of the proof and stay README targets, as do the arithmetic of Layers 2 and 4, the
  kernels of Layer 3 and the bounds of Layer 5.1–5.3.
* The large sieves of Layer 6 are supplier results of the roadmap, not its headlines, and stay
  README targets; the large sieve for `n`-th order characters (6.4) would in addition need the
  Fisher–Friedberg characters, a construction with chosen generators that is not at the pins.
* Layer 8, Kubota's Eisenstein series on `ℍ³` with a unitary character, their theta residues and
  Patterson's cubic theta function with its Fourier expansions, is not statable at the pins:
  Mathlib and Tau Ceti have no hyperbolic `3`-space with the action of `SL₂(ℂ)` by isometries and
  its Laplacian, no automorphic function on it with a character, and no `K`-Bessel function.
* The cubic reflection of Layer 9 needs Layer 8's theta function and is not statable for the same
  reason.
-/

namespace TauCetiRoadmap.QuasiRiemannHypothesis

open Complex TauCeti.GlobalNumberFields TauCeti.LFunctions
open scoped NumberField

/-! ## Layer 1: zero-free half-planes and the continuation principle -/

/-- **Layer 1.1, zero-free right of `σ`.** The function `f` has no zero in the half-plane
`Re s > σ`: its meromorphic order is at most `0` at every point there. Poles are allowed, and
nothing is read off a value, so the predicate is a property of germs. The zero function, of order
`⊤` everywhere, is zero-free right of no `σ`; a function meromorphic at no point has Mathlib's junk
order `0` everywhere, so the predicate carries information for meromorphic `f` (`openai2026quasiRH`
Theorem 1.1, p. 4, and (2.1), p. 8). -/
def ZeroFreeRightOf (σ : ℝ) (f : ℂ → ℂ) : Prop :=
  ∀ s : ℂ, σ < s.re → meromorphicOrderAt f s ≤ 0

/-! ## Layer 5: analytic inputs for Hecke L-functions, and the transfer to Dirichlet L-functions -/

/-- **Layer 5.5, the transfer of zero-free half-planes.** Let `K` be an abelian number field and
`σ₀ ≥ 0`. If the L-function of every primitive finite-order Hecke character of `K` is zero-free
right of `σ₀`, then so is the L-function of every Dirichlet character, at every level. The route is
the base-change factorization `L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)` of 5.4 over the group
`X(K)` of the primitive characters inducing the Dirichlet characters modulo the least `f` with
`K ⊆ ℚ(ζ_f)` that are trivial on the subgroup fixing `K`, whose factors other than
`L(s, χ)` have no pole off `s = 1`, with `L(1, χ) ≠ 0` for `χ ≠ 1` (`openai2026quasiRH`
Proposition 11.3, p. 84, for `K = ℚ(√−3)`). -/
theorem zeroFreeRightOf_LFunction_of_isAbelianGalois (K : Type*) [Field K] [NumberField K]
    [IsAbelianGalois ℚ K] {σ₀ : ℝ} (hσ₀ : 0 ≤ σ₀)
    (h : ∀ ψ : PrimitiveRayClassCharacter K, ZeroFreeRightOf σ₀ (heckeLFunctionC ψ.character))
    {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    ZeroFreeRightOf σ₀ (DirichletCharacter.LFunction χ) := by
  sorry

/-! ## Layer 10: the probe at `11/12` and the `11/12` half-plane -/

/-- **Layer 10.7, the `11/12` half-plane for the Hecke L-functions of `ℚ(√−3)`.** For the field
`F = ℚ(√−3)`, every modulus `𝔪` of `F` and every ray class character `χ` of `𝔪`, the presented
L-function `heckeLFunctionC χ` has no zero in `Re s > 11/12`; the pole at `s = 1` of a character
induced from the trivial one is allowed (`openai2026quasiRH` Theorem 3.1, p. 10;
`liu2026improved` Proposition 6.3). -/
theorem zeroFreeRightOf_heckeLFunctionC (F : Type*) [Field F] [NumberField F]
    [IsCyclotomicExtension {3} ℚ F] {𝔪 : Modulus F} (χ : RayClassCharacter 𝔪) :
    ZeroFreeRightOf (11 / 12) (heckeLFunctionC χ) := by
  sorry

/-- **Layer 10.7, the `11/12` half-plane for Dirichlet L-functions.** For every level `N ≥ 1` and
every Dirichlet character `χ` modulo `N`, `L(s, χ)` has no zero in `Re s > 11/12`; the pole at
`s = 1` of a principal character is allowed (`openai2026quasiRH` Theorem 3.1, p. 10, through
Proposition 11.3, p. 84). -/
theorem zeroFreeRightOf_LFunction {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    ZeroFreeRightOf (11 / 12) (DirichletCharacter.LFunction χ) := by
  sorry

/-- **Layer 10.7, the Riemann zeta function.** `ζ(s) ≠ 0` for `Re s > 11/12`
(`openai2026quasiRH` Theorem 3.1, p. 10). At `s = 1` Mathlib's value `(γ − log 4π)/2` is not `0`
(`riemannZeta_one_ne_zero`), so, as in `riemannZeta_ne_zero_of_one_le_re`, no point is excluded. -/
theorem riemannZeta_ne_zero_of_eleven_twelfths_lt_re {s : ℂ} (hs : 11 / 12 < s.re) :
    riemannZeta s ≠ 0 := by
  sorry

/-! ## Layer 11: consequences -/

/-- **Layer 11.1, the zero strip for primitive Dirichlet L-functions.** Every zero `ρ` with
`Re ρ > 0` of the L-function of a primitive Dirichlet character satisfies
`1/12 ≤ Re ρ ≤ 11/12`, by the `11/12` half-plane and the functional equation
(`openai2026quasiRH` proof of Corollary 1.2, p. 7, at `7/8`). A primitive character of level `N ≥ 2`
is nontrivial, so its L-function is entire; at level `1` it is `ζ`, analytic off `s = 1`, and
Mathlib's value `ζ(1) = (γ − log 4π)/2` is not `0`, so the hypothesis reads a genuine zero. -/
theorem re_mem_Icc_of_LFunction_eq_zero {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) {ρ : ℂ} (hρ : 0 < ρ.re) (h : DirichletCharacter.LFunction χ ρ = 0) :
    1 / 12 ≤ ρ.re ∧ ρ.re ≤ 11 / 12 := by
  sorry

/-- **Layer 11.1, the zero strip for the primitive Hecke L-functions of `ℚ(√−3)`.** Every zero
`ρ` with `Re ρ > 0` of the L-function of a primitive finite-order Hecke character of
`F = ℚ(√−3)`, a zero being a point of positive meromorphic order, satisfies
`1/12 ≤ Re ρ ≤ 11/12`, by the `11/12` half-plane, the functional equation and complex
conjugation. -/
theorem re_mem_Icc_of_heckeLFunctionC (F : Type*) [Field F] [NumberField F]
    [IsCyclotomicExtension {3} ℚ F] (ψ : PrimitiveRayClassCharacter F) {ρ : ℂ} (hρ : 0 < ρ.re)
    (h : 0 < meromorphicOrderAt (heckeLFunctionC ψ.character) ρ) :
    1 / 12 ≤ ρ.re ∧ ρ.re ≤ 11 / 12 := by
  sorry

/-- **Layer 11.2, the least character value under a zero-free half-plane.** For every
`θ ∈ [1/2, 1)` there is `C` such that, for every `q ≥ 2` and every nonprincipal Dirichlet
character `χ` modulo `q` whose L-function is zero-free right of `θ`, some `n ≥ 1` with
`n ≤ C (log q)^(1/(1 − θ))` has `χ(n) ∉ {0, 1}`. The route compares the Weil explicit formula of
the primitive character inducing `χ` with that of `ζ` at a scale `x`
(`lamzourilisound2015` Lemma 2.2 and Theorem 1.1 for `θ = 1/2`). -/
theorem exists_ne_zero_ne_one_le_log_rpow {θ : ℝ} (hθ : θ ∈ Set.Ico (1 / 2 : ℝ) 1) :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q], 2 ≤ q → ∀ χ : DirichletCharacter ℂ q, χ ≠ 1 →
      ZeroFreeRightOf θ (DirichletCharacter.LFunction χ) →
      ∃ n : ℕ, 0 < n ∧ (n : ℝ) ≤ C * Real.log q ^ (1 / (1 - θ)) ∧ χ n ≠ 0 ∧ χ n ≠ 1 := by
  sorry

/-- **Layer 11.2, the Hecke analogue.** For a number field `K` and `θ ∈ [1/2, 1)` there is `C`
such that, for every modulus `𝔪` of `K` and every nontrivial ray class character `η` of `𝔪`
whose presented L-function is zero-free right of `θ`, some nonzero prime ideal `𝔭` with
`η(𝔭) ∉ {0, 1}` (the character being read on ideals with the value `0` on those not prime to `𝔪`)
has `N𝔭 ≤ C (log N𝔪₀ + 2)^(1/(1 − θ))`, where `𝔪₀` is the finite part of `𝔪`. The bound is in
the presentation modulus, not in the conductor. -/
theorem exists_prime_ne_zero_ne_one_le_log_rpow (K : Type*) [Field K] [NumberField K] {θ : ℝ}
    (hθ : θ ∈ Set.Ico (1 / 2 : ℝ) 1) :
    ∃ C : ℝ, ∀ (𝔪 : Modulus K) (η : RayClassCharacter 𝔪), η ≠ 1 →
      ZeroFreeRightOf θ (heckeLFunctionC η) →
      ∃ 𝔭 : Ideal (𝓞 K), 𝔭.IsPrime ∧ 𝔭 ≠ ⊥ ∧ η.toMultiplicativeIdealWeight 𝔭 ≠ 0 ∧
        η.toMultiplicativeIdealWeight 𝔭 ≠ 1 ∧
        (Ideal.absNorm 𝔭 : ℝ) ≤
          C * (Real.log (Ideal.absNorm 𝔪.finitePart) + 2) ^ (1 / (1 - θ)) := by
  sorry

/-- **Layer 11.3, the least quadratic nonresidue.** There is an absolute `C` such that every odd
prime `p` has a quadratic nonresidue `n` with `1 ≤ n ≤ C (log p)^12`: the `11/12` half-plane and
11.2 at `θ = 11/12` for the Legendre character (`openai2026quasiRH` Corollary 1.2, p. 7, with
exponent `32` from the `7/8` half-plane). -/
theorem exists_jacobiSym_eq_neg_one_le_log_pow :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime → p ≠ 2 →
      ∃ n : ℕ, 0 < n ∧ (n : ℝ) ≤ C * Real.log p ^ 12 ∧ jacobiSym n p = -1 := by
  sorry

/-- **Layer 11.3, Vinogradov's conjecture.** For every `δ > 0` the least quadratic nonresidue
modulo an odd prime `p` is `O_δ(p^δ)` (`tao2015` Conjecture 1.1; `openai2026quasiRH`
Corollary 1.2, p. 7). -/
theorem exists_jacobiSym_eq_neg_one_le_rpow {δ : ℝ} (hδ : 0 < δ) :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime → p ≠ 2 →
      ∃ n : ℕ, 0 < n ∧ (n : ℝ) ≤ C * (p : ℝ) ^ δ ∧ jacobiSym n p = -1 := by
  sorry

end TauCetiRoadmap.QuasiRiemannHypothesis
