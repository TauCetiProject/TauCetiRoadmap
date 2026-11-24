module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.JacobiElliptic.Basic
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre
public import TauCeti.Analysis.Complex.UpperHalfPlane.PeriodPair

/-!
# Lamé functions: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the targets of `README.md` that carry
a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other targets of the README have the same standing, stated in prose.
Discharging this file finishes neither a layer nor the roadmap.

The real theory (Layers 1–4 and 6) is stated with Tau Ceti's real Jacobi functions
`TauCeti.Real.jacobiSn`, `jacobiCn`, `jacobiDn`, `jacobiAm` and the complete integral
`TauCeti.Real.legendreK`, for a real modulus `0 < k < 1`. Layer 5 is stated with Mathlib's
`PeriodPair.weierstrassP` and Tau Ceti's `UpperHalfPlane.periodPair`; the bridge between the two
(README 1.3) is prose, because it needs the complex Jacobi functions of
SpecialFunctionsJacobiElliptic.

`nthLeast`, `IsHillSolution`, `hillWI`, `hillWII`, `hillDiscriminant`, `realRootCount`,
`hillPeriodicEigenvalue` and `hillAntiperiodicEigenvalue` are local copies of the definitions of
SpecialFunctionsMathieu, with that roadmap's bodies; in Tau Ceti they live in the namespace
`TauCeti`. The definitions owned here have their intended bodies, so that the conventions (the
boundary conditions of the four eigenvalue families, the normalization and signs of the Lamé
functions, the eight polynomial types, the matrix of DLMF 29.15.2) are checked by the compiler.
Theorems are stated with `sorry`. Section numbers in docstrings are those of the README; equation
numbers are DLMF's.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsLame

open Complex Filter Topology Set MeasureTheory intervalIntegral
open scoped Real Classical
open TauCeti.Real (jacobiSn jacobiCn jacobiDn jacobiAm legendreK)

/-! ## Local copies from SpecialFunctionsMathieu -/

/-- Local copy: SpecialFunctionsMathieu, Conventions and §3.1. The `m`-th smallest element of a
set of reals, counted from `0`. Used only for sets that are closed, discrete, bounded below and
infinite. -/
def nthLeast (S : Set ℝ) : ℕ → ℝ
  | 0 => sInf S
  | m + 1 => sInf (S ∩ Ioi (nthLeast S m))

/-- Local copy: SpecialFunctionsMathieu, §1.1. `w` solves Hill's equation `w″ + (λ + Q(x)) w = 0`
(DLMF 28.29.1) on `ℝ`. -/
def IsHillSolution (Q : ℝ → ℝ) (lam : ℂ) (w : ℝ → ℂ) : Prop :=
  ContDiff ℝ 2 w ∧ ∀ x, deriv (deriv w) x + (lam + Q x) * w x = 0

/-- Local copy: SpecialFunctionsMathieu, §1.1. The basic solution `w_I(x, λ)`: `w(0) = 1`,
`w′(0) = 0`. -/
def hillWI (Q : ℝ → ℝ) (lam : ℂ) : ℝ → ℂ :=
  if h : ∃ w, IsHillSolution Q lam w ∧ w 0 = 1 ∧ deriv w 0 = 0 then h.choose else 0

/-- Local copy: SpecialFunctionsMathieu, §1.1. The basic solution `w_II(x, λ)`: `w(0) = 0`,
`w′(0) = 1`. -/
def hillWII (Q : ℝ → ℝ) (lam : ℂ) : ℝ → ℂ :=
  if h : ∃ w, IsHillSolution Q lam w ∧ w 0 = 0 ∧ deriv w 0 = 1 then h.choose else 0

/-- Local copy: SpecialFunctionsMathieu, §2.1. The discriminant `Δ(λ) = w_I(π, λ) + w_II′(π, λ)`
(DLMF 28.29.15). -/
def hillDiscriminant (Q : ℝ → ℝ) (lam : ℂ) : ℂ :=
  hillWI Q lam π + deriv (hillWII Q lam) π

/-- Local copy: SpecialFunctionsMathieu, §3.3. The number of real roots `≤ t` of `f`, counted with
multiplicity. -/
def realRootCount (f : ℂ → ℂ) (t : ℝ) : ℕ :=
  ∑ᶠ x ∈ {x : ℝ | x ≤ t}, analyticOrderNatAt f (x : ℂ)

/-- Local copy: SpecialFunctionsMathieu, §3.3. `λ_n`: the `n`-th root of `Δ − 2`, with
multiplicity, counted from `0` (DLMF 28.29.16). -/
def hillPeriodicEigenvalue (Q : ℝ → ℝ) (n : ℕ) : ℝ :=
  sInf {t : ℝ | n + 1 ≤ realRootCount (fun lam => hillDiscriminant Q lam - 2) t}

/-- Local copy: SpecialFunctionsMathieu, §3.3. `μ_{n+1}`: the `n`-th root of `Δ + 2`, with
multiplicity, counted from `0` (DLMF 28.29.17). -/
def hillAntiperiodicEigenvalue (Q : ℝ → ℝ) (n : ℕ) : ℝ :=
  sInf {t : ℝ | n + 1 ≤ realRootCount (fun lam => hillDiscriminant Q lam + 2) t}

/-! ## Layer 1: Lamé's equation and its forms -/

/-- README 1.1: the coefficient `Q(x) = −ν(ν + 1) k² sn²(x, k)`, so that Lamé's equation
`w″ + (h − ν(ν + 1) k² sn²(x, k)) w = 0` (DLMF 29.2.1) is Hill's equation
`w″ + (h + Q(x)) w = 0`. -/
def lamePotential (ν k x : ℝ) : ℝ :=
  -(ν * (ν + 1) * k ^ 2 * jacobiSn k x ^ 2)

/-- README 1.1: the factor `(2K/π)²` of the rescaling `x ↦ 2Kx/π`. -/
def lameScale (k : ℝ) : ℝ :=
  (2 * legendreK k / π) ^ 2

/-- README 1.1: the `π`-periodic coefficient `Q̃(x) = (2K/π)² Q(2Kx/π)`. -/
def lameHillPotential (ν k x : ℝ) : ℝ :=
  lameScale k * lamePotential ν k (2 * legendreK k * x / π)

/-- Sanity check of the definition: for `k = 0` Lamé's equation is `w″ + h w = 0`. -/
theorem lamePotential_zero_modulus (ν x : ℝ) : lamePotential ν 0 x = 0 := by
  simp [lamePotential]

/-- README 1.1: `Q` is continuous, even, `2K`-periodic and even about `K`. -/
theorem lamePotential_periodic {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) :
    Continuous (lamePotential ν k) ∧
      Function.Periodic (lamePotential ν k) (2 * legendreK k) ∧
      (∀ x, lamePotential ν k (-x) = lamePotential ν k x) ∧
      ∀ x, lamePotential ν k (legendreK k - x) = lamePotential ν k (legendreK k + x) := by
  sorry

/-- README 1.1, the Hill normalization: `Q̃` is continuous and `π`-periodic, and `w` solves Lamé's
equation with eigenvalue `h` iff `x ↦ w(2Kx/π)` solves Hill's equation for `Q̃` with
`λ = (2K/π)² h`. -/
theorem lameHillPotential_spec {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) :
    Continuous (lameHillPotential ν k) ∧ Function.Periodic (lameHillPotential ν k) π ∧
      ∀ (h : ℝ) (w : ℝ → ℂ), IsHillSolution (lamePotential ν k) h w ↔
        IsHillSolution (lameHillPotential ν k) ((lameScale k * h : ℝ) : ℂ)
          (fun x => w (2 * legendreK k * x / π)) := by
  sorry

/-- README 1.2: Dassios's form (2.63) of Lamé's equation,
`(x² − h₃²)(x² − h₂²) E″ + x(2x² − h₃² − h₂²) E′ + (−ν(ν + 1) x² + B) E = 0` on `(−h₃, h₃)`,
becomes the Jacobi form with `k = h₃/h₂` and `h = B/h₂²` under `x = h₃ sn(z, k)`. -/
theorem lame_dassios_form {h₂ h₃ : ℝ} (h₃pos : 0 < h₃) (h₃₂ : h₃ < h₂) (ν B : ℝ) {E : ℝ → ℝ}
    (hE : ContDiffOn ℝ 2 E (Ioo (-h₃) h₃))
    (hEq : ∀ x ∈ Ioo (-h₃) h₃, (x ^ 2 - h₃ ^ 2) * (x ^ 2 - h₂ ^ 2) * deriv (deriv E) x +
      x * (2 * x ^ 2 - h₃ ^ 2 - h₂ ^ 2) * deriv E x + (-(ν * (ν + 1)) * x ^ 2 + B) * E x = 0) :
    let k := h₃ / h₂
    let w : ℝ → ℝ := fun z => E (h₃ * jacobiSn k z)
    ∀ z ∈ Ioo (-legendreK k) (legendreK k),
      deriv (deriv w) z + (B / h₂ ^ 2 + lamePotential ν k z) * w z = 0 := by
  sorry

/-- README 1.3: Lamé's equation in Weierstrass form, `Λ″ = (n(n + 1) ℘(u) + B) Λ` on `U`
(Whittaker–Watson §23.4, p. 555; DLMF 29.2.9 with `B = −g`). -/
def IsLameWeierstrassSolution (L : PeriodPair) (n : ℕ) (B : ℂ) (Λ : ℂ → ℂ) (U : Set ℂ) : Prop :=
  DifferentiableOn ℂ Λ U ∧
    ∀ u ∈ U, deriv (deriv Λ) u = ((n * (n + 1) : ℂ) * L.weierstrassP u + B) * Λ u

/-! ## Layer 2: the eigenvalues `a^m_ν`, `b^m_ν` -/

/-- README 2.1: `a^j_ν` (DLMF Table 29.3.2). For `j = 2m` the `m`-th `h` with
`w′(0) = w′(K) = 0`, for `j = 2m + 1` the `m`-th `h` with `w(0) = w′(K) = 0`. -/
def lameA (ν k : ℝ) (j : ℕ) : ℝ :=
  if Even j then
    nthLeast {h : ℝ | deriv (hillWI (lamePotential ν k) h) (legendreK k) = 0} (j / 2)
  else nthLeast {h : ℝ | deriv (hillWII (lamePotential ν k) h) (legendreK k) = 0} (j / 2)

/-- README 2.1: `b^j_ν` for `j ≥ 1` (DLMF Table 29.3.2). For `j = 2m + 1` the `m`-th `h` with
`w′(0) = w(K) = 0`, for `j = 2m + 2` the `m`-th `h` with `w(0) = w(K) = 0`; `b^0 = 0` is junk. -/
def lameB (ν k : ℝ) (j : ℕ) : ℝ :=
  if j = 0 then 0
  else if Odd j then
    nthLeast {h : ℝ | hillWI (lamePotential ν k) h (legendreK k) = 0} ((j - 1) / 2)
  else nthLeast {h : ℝ | hillWII (lamePotential ν k) h (legendreK k) = 0} ((j - 1) / 2)

/-- README 2.1: the four boundary problems on `[0, K]` have exactly the eigenvalues `a^{2m}`,
`a^{2m+1}`, `b^{2m+1}`, `b^{2m+2}`, and these tend to `∞`. -/
theorem lame_boundary_eigenvalues {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) :
    {h : ℝ | deriv (hillWI (lamePotential ν k) h) (legendreK k) = 0} =
        range (fun m : ℕ => lameA ν k (2 * m)) ∧
      {h : ℝ | deriv (hillWII (lamePotential ν k) h) (legendreK k) = 0} =
        range (fun m : ℕ => lameA ν k (2 * m + 1)) ∧
      {h : ℝ | hillWI (lamePotential ν k) h (legendreK k) = 0} =
        range (fun m : ℕ => lameB ν k (2 * m + 1)) ∧
      {h : ℝ | hillWII (lamePotential ν k) h (legendreK k) = 0} =
        range (fun m : ℕ => lameB ν k (2 * m + 2)) ∧
      Tendsto (lameA ν k) atTop atTop ∧ Tendsto (fun j => lameB ν k (j + 1)) atTop atTop := by
  sorry

/-- README 2.2: the strict interlacing DLMF 29.3.1–29.3.4. -/
theorem lame_interlacing {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) (m : ℕ) :
    lameA ν k m < lameA ν k (m + 1) ∧ lameA ν k m < lameB ν k (m + 1) ∧
      (1 ≤ m → lameB ν k m < lameB ν k (m + 1) ∧ lameB ν k m < lameA ν k (m + 1)) := by
  sorry

/-- README 2.2: the periodic and antiperiodic eigenvalues of the rescaled Hill equation are
`(2K/π)²` times `a⁰`, the pairs `{a^{2m+2}, b^{2m+2}}` and the pairs `{a^{2m+1}, b^{2m+1}}`. -/
theorem hillEigenvalue_lame {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) :
    let Q := lameHillPotential ν k
    let s := lameScale k
    hillPeriodicEigenvalue Q 0 = s * lameA ν k 0 ∧
      ∀ m : ℕ,
        hillPeriodicEigenvalue Q (2 * m + 1) =
            s * min (lameA ν k (2 * m + 2)) (lameB ν k (2 * m + 2)) ∧
          hillPeriodicEigenvalue Q (2 * m + 2) =
            s * max (lameA ν k (2 * m + 2)) (lameB ν k (2 * m + 2)) ∧
          hillAntiperiodicEigenvalue Q (2 * m) =
            s * min (lameA ν k (2 * m + 1)) (lameB ν k (2 * m + 1)) ∧
          hillAntiperiodicEigenvalue Q (2 * m + 1) =
            s * max (lameA ν k (2 * m + 1)) (lameB ν k (2 * m + 1)) := by
  sorry

/-! ## Layer 3: Lamé functions -/

/-- README 3.1: the unnormalized eigenfunction of `a^j_ν`: `w_I` for even `j`, `w_II` for odd
`j`. -/
def lameEcRaw (ν k : ℝ) (j : ℕ) (x : ℝ) : ℝ :=
  if Even j then (hillWI (lamePotential ν k) (lameA ν k j) x).re
  else (hillWII (lamePotential ν k) (lameA ν k j) x).re

/-- README 3.1: the unnormalized eigenfunction of `b^j_ν`: `w_I` for odd `j`, `w_II` for even
`j`. -/
def lameEsRaw (ν k : ℝ) (j : ℕ) (x : ℝ) : ℝ :=
  if Odd j then (hillWI (lamePotential ν k) (lameB ν k j) x).re
  else (hillWII (lamePotential ν k) (lameB ν k j) x).re

/-- README 3.1: `Ec^j_ν(x, k²)`, normalized by `∫₀^K dn · Ec² = π/4` and `Ec(K) > 0`
(DLMF 29.3.18). -/
def lameEc (ν k : ℝ) (j : ℕ) (x : ℝ) : ℝ :=
  Real.sign (lameEcRaw ν k j (legendreK k)) *
    Real.sqrt (π / 4 / ∫ t in (0 : ℝ)..legendreK k, jacobiDn k t * lameEcRaw ν k j t ^ 2) *
    lameEcRaw ν k j x

/-- README 3.1: `Es^j_ν(x, k²)` for `j ≥ 1`, normalized by `∫₀^K dn · Es² = π/4` and
`Es′(K) < 0` (DLMF 29.3.18). -/
def lameEs (ν k : ℝ) (j : ℕ) (x : ℝ) : ℝ :=
  -Real.sign (deriv (lameEsRaw ν k j) (legendreK k)) *
    Real.sqrt (π / 4 / ∫ t in (0 : ℝ)..legendreK k, jacobiDn k t * lameEsRaw ν k j t ^ 2) *
    lameEsRaw ν k j x

/-- README 3.1: `Ec^j_ν` solves Lamé's equation with `h = a^j_ν`, has parity `(−1)^j` about `0`,
is even about `K`, satisfies `Ec(x + 2K) = (−1)^j Ec(x)`, is normalized, and has `⌊j/2⌋` zeros in
`(0, K)` (DLMF Table 29.3.2, 29.3.18). -/
theorem lameEc_spec {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) (j : ℕ) :
    let E := lameEc ν k j
    let K := legendreK k
    ContDiff ℝ 2 E ∧ (∀ x, deriv (deriv E) x + (lameA ν k j + lamePotential ν k x) * E x = 0) ∧
      (∀ x, E (-x) = (-1) ^ j * E x) ∧ (∀ x, E (K - x) = E (K + x)) ∧
      (∀ x, E (x + 2 * K) = (-1) ^ j * E x) ∧
      (∫ t in (0 : ℝ)..K, jacobiDn k t * E t ^ 2) = π / 4 ∧ 0 < E K ∧
      {x ∈ Ioo 0 K | E x = 0}.ncard = j / 2 := by
  sorry

/-- README 3.1: `Es^j_ν` (`j ≥ 1`) solves Lamé's equation with `h = b^j_ν`, has parity
`(−1)^{j+1}` about `0`, is odd about `K`, satisfies `Es(x + 2K) = (−1)^j Es(x)`, is normalized,
and has `⌊(j − 1)/2⌋` zeros in `(0, K)`. -/
theorem lameEs_spec {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) {j : ℕ} (hj : 1 ≤ j) :
    let E := lameEs ν k j
    let K := legendreK k
    ContDiff ℝ 2 E ∧ (∀ x, deriv (deriv E) x + (lameB ν k j + lamePotential ν k x) * E x = 0) ∧
      (∀ x, E (-x) = (-1) ^ (j + 1) * E x) ∧ (∀ x, E (K - x) = -E (K + x)) ∧
      (∀ x, E (x + 2 * K) = (-1) ^ j * E x) ∧
      (∫ t in (0 : ℝ)..K, jacobiDn k t * E t ^ 2) = π / 4 ∧ deriv E K < 0 ∧
      {x ∈ Ioo 0 K | E x = 0}.ncard = (j - 1) / 2 := by
  sorry

/-- README 3.1: orthogonality on `[0, K]` within each of the four families (DLMF 29.3.19). -/
theorem lame_orthogonal {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) {j j' : ℕ} (hjj' : j ≠ j')
    (hpar : j % 2 = j' % 2) :
    (∫ x in (0 : ℝ)..legendreK k, lameEc ν k j x * lameEc ν k j' x) = 0 ∧
      (1 ≤ j → 1 ≤ j' → (∫ x in (0 : ℝ)..legendreK k, lameEs ν k j x * lameEs ν k j' x) = 0) := by
  sorry

/-- README 3.2: `α_p` of DLMF 29.3.11. -/
def lameAlpha (ν k : ℝ) (p : ℕ) : ℝ :=
  if p = 0 then (ν - 1) * (ν + 2) * k ^ 2 else (ν - 2 * p - 1) * (ν + 2 * p + 2) * k ^ 2 / 2

/-- README 3.2: `β_p` of DLMF 29.3.12. -/
def lameBeta (k : ℝ) (p : ℕ) : ℝ :=
  4 * p ^ 2 * (2 - k ^ 2)

/-- README 3.2: `γ_p` of DLMF 29.3.12. -/
def lameGamma (ν k : ℝ) (p : ℕ) : ℝ :=
  (ν - 2 * p + 2) * (ν + 2 * p - 1) * k ^ 2 / 2

/-- README 3.2: the Fourier series of `Ec^{2m}_ν` in `cos 2pφ`, `φ = π/2 − am(z, k)`, with
`A p = A_{2p}`: the three-term recurrence (29.6.3)–(29.6.4) for `H = 2a^{2m}_ν − ν(ν + 1)k²`,
the normalization (29.6.5), the sign (29.6.6), and the ratio limit (29.6.7) off the polynomial
case. -/
theorem lameEc_even_fourier {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (ν : ℝ) (m : ℕ) :
    let H := 2 * lameA ν k (2 * m) - ν * (ν + 1) * k ^ 2
    ∃ A : ℕ → ℝ,
      (∀ z, HasSum (fun p : ℕ => (if p = 0 then A 0 / 2 else A p) *
          Real.cos (2 * p * (π / 2 - jacobiAm k z))) (lameEc ν k (2 * m) z)) ∧
      (lameBeta k 0 - H) * A 0 + lameAlpha ν k 0 * A 1 = 0 ∧
      (∀ p, 1 ≤ p → lameGamma ν k p * A (p - 1) + (lameBeta k p - H) * A p +
        lameAlpha ν k p * A (p + 1) = 0) ∧
      HasSum (fun p : ℕ => if p = 0 then A 0 ^ 2 / 2 else A p ^ 2) 1 ∧
      0 < A 0 / 2 + ∑' p : ℕ, A (p + 1) ∧
      ((∀ n : ℕ, ν = 2 * n → n < m) →
        Tendsto (fun p => A (p + 1) / A p) atTop
          (𝓝 (k ^ 2 / (1 + Real.sqrt (1 - k ^ 2)) ^ 2))) := by
  sorry

/-- README 3.3: at `k = 0` the eigenvalues are `j²`, and they are continuous at `k = 0` (DLMF
29.5.1). -/
theorem lame_modulus_zero (ν : ℝ) (j : ℕ) :
    lameA ν 0 j = j ^ 2 ∧ (1 ≤ j → lameB ν 0 j = j ^ 2) ∧
      Tendsto (fun k => lameA ν k j) (𝓝[>] 0) (𝓝 ((j : ℝ) ^ 2)) ∧
      (1 ≤ j → Tendsto (fun k => lameB ν k j) (𝓝[>] 0) (𝓝 ((j : ℝ) ^ 2))) := by
  sorry

/-- README 3.3: as `k → 1−`, `a^m_ν` and `b^{m+1}_ν` tend to `ν(ν + 1) − μ²`,
`μ = max(ν − m, 0)` (DLMF 29.5.4). -/
theorem tendsto_lame_modulus_one {ν : ℝ} (hν : -1 / 2 ≤ ν) (m : ℕ) :
    Tendsto (fun k => lameA ν k m) (𝓝[<] 1) (𝓝 (ν * (ν + 1) - max (ν - m) 0 ^ 2)) ∧
      Tendsto (fun k => lameB ν k (m + 1)) (𝓝[<] 1) (𝓝 (ν * (ν + 1) - max (ν - m) 0 ^ 2)) := by
  sorry

/-! ## Layer 4: Lamé polynomials -/

/-- README 4.1: the type factor `sn^s cn^c dn^d` of a Lamé polynomial (DLMF Table 29.12.1). -/
def lameTypeFactor (k : ℝ) (s c d : Bool) (z : ℝ) : ℝ :=
  (if s then jacobiSn k z else 1) * (if c then jacobiCn k z else 1) *
    (if d then jacobiDn k z else 1)

/-- README 4.1: the number of factors in `sn^s cn^c dn^d`. -/
def lameTypeDegree (s c d : Bool) : ℕ :=
  s.toNat + c.toNat + d.toNat

/-- Sanity check of the definition: the type `scd` has three factors. -/
theorem lameTypeDegree_scd : lameTypeDegree true true true = 3 := by
  decide

/-- README 4.1: `sn^s cn^c dn^d P(sn²)` is a Lamé polynomial of order `n` with eigenvalue `h`:
`P ≠ 0`, `2 deg P + s + c + d = n`, and it solves Lamé's equation with `ν = n` on `ℝ`. -/
def IsLamePolynomial (n : ℕ) (k h : ℝ) (s c d : Bool) (P : Polynomial ℝ) : Prop :=
  P ≠ 0 ∧ 2 * P.natDegree + lameTypeDegree s c d = n ∧
    IsHillSolution (lamePotential n k) h
      (fun z => ((lameTypeFactor k s c d z * P.eval (jacobiSn k z ^ 2) : ℝ) : ℂ))

/-- README 4.1: for each type with `s + c + d ≤ n`, `s + c + d ≡ n (mod 2)` there are exactly
`(n − s − c − d)/2 + 1` eigenvalues; all `2n + 1` are distinct; each eigenvalue has one type and
one polynomial up to a factor; and the eigenvalues are `a^j_n` (`0 ≤ j ≤ n`) and `b^j_n`
(`1 ≤ j ≤ n`) (Whittaker–Watson §§23.41, 23.47; DLMF 29.12.1–29.12.8). -/
theorem lamePolynomial_eigenvalues {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (n : ℕ) :
    (∀ s c d : Bool, lameTypeDegree s c d ≤ n → Even (n - lameTypeDegree s c d) →
      {h : ℝ | ∃ P, IsLamePolynomial n k h s c d P}.ncard = (n - lameTypeDegree s c d) / 2 + 1) ∧
    {h : ℝ | ∃ (s c d : Bool) (P : Polynomial ℝ), IsLamePolynomial n k h s c d P}.ncard =
      2 * n + 1 ∧
    (∀ (h : ℝ) (s c d s' c' d' : Bool) (P P' : Polynomial ℝ), IsLamePolynomial n k h s c d P →
      IsLamePolynomial n k h s' c' d' P' →
        s = s' ∧ c = c' ∧ d = d' ∧ ∃ r : ℝ, P' = Polynomial.C r * P) ∧
    {h : ℝ | ∃ (s c d : Bool) (P : Polynomial ℝ), IsLamePolynomial n k h s c d P} =
      {h | ∃ j ≤ n, h = lameA n k j} ∪ {h | ∃ j, 1 ≤ j ∧ j ≤ n ∧ h = lameB n k j} := by
  sorry

/-- README 4.2: the tridiagonal matrix `M` of DLMF 29.15.2, with diagonal `β₀, …, β_n`,
superdiagonal `α₀, …, α_{n−1}` and subdiagonal `γ₁, …, γ_n`. -/
def lameUMatrix (ν k : ℝ) (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
  Matrix.of fun i j =>
    if i = j then lameBeta k i
    else if (j : ℕ) = i + 1 then lameAlpha ν k i
    else if (i : ℕ) = j + 1 then lameGamma ν k i
    else 0

/-- README 4.2: for `ν = 2n` the characteristic polynomial of `M` has the `n + 1` simple real
roots `H_m = 2a^{2m}_{2n} − ν(ν + 1)k²`, `m = 0, …, n` (DLMF 29.15.3, 29.15.7). -/
theorem lameUMatrix_charpoly_roots {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (n : ℕ) :
    (lameUMatrix ((2 * n : ℕ) : ℝ) k n).charpoly.roots =
      (Multiset.range (n + 1)).map (fun m =>
        2 * lameA ((2 * n : ℕ) : ℝ) k (2 * m) - (2 * n) * (2 * n + 1) * k ^ 2) := by
  sorry

/-- README 4.3: the zeros of `P` are simple, real, in `(0, 1) ∪ (1, k⁻²)`; those in `(0, 1)` are
as many as the zeros of the Lamé polynomial in `(0, K)`; and they satisfy Stieltjes' equilibrium
equations (DLMF 29.12.9–29.12.13). -/
theorem lamePolynomial_zeros {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) {n : ℕ} {h : ℝ} {s c d : Bool}
    {P : Polynomial ℝ} (hP : IsLamePolynomial n k h s c d P) :
    P.roots.Nodup ∧ P.roots.card = P.natDegree ∧
      (∀ ξ ∈ P.roots, ξ ∈ Ioo 0 1 ∪ Ioo 1 (k ^ 2)⁻¹) ∧
      (P.roots.filter (· < 1)).card =
        {z ∈ Ioo 0 (legendreK k) |
          lameTypeFactor k s c d z * P.eval (jacobiSn k z ^ 2) = 0}.ncard ∧
      ∀ ξ ∈ P.roots,
        ((s.toNat : ℝ) / 2 + 1 / 4) / ξ + ((c.toNat : ℝ) / 2 + 1 / 4) / (ξ - 1) +
            ((d.toNat : ℝ) / 2 + 1 / 4) / (ξ - (k ^ 2)⁻¹) +
            ((P.roots.erase ξ).map fun η => 1 / (ξ - η)).sum = 0 := by
  sorry

/-- README 4.4: the duality `k ↔ k′` of the polynomial eigenvalues (DLMF 29.3.7–29.3.8). -/
theorem lame_eigenvalue_duality {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (n : ℕ) :
    let k' := Real.sqrt (1 - k ^ 2)
    (∀ m ≤ n, lameA n k m + lameA n k' (n - m) = n * (n + 1)) ∧
      ∀ m, 1 ≤ m → m ≤ n → lameB n k m + lameB n k' (n - m + 1) = n * (n + 1) := by
  sorry

/-! ## Layer 5: Hermite's solution and the finite-gap property -/

/-- README 5.1: the equation `X‴ − 4(n(n + 1)℘ + B) X′ − 2n(n + 1)℘′ X = 0` satisfied by
products of two solutions of the Weierstrass form (Whittaker–Watson §23.7, p. 570). -/
def IsLameProductSolution (L : PeriodPair) (n : ℕ) (B : ℂ) (X : ℂ → ℂ) : Prop :=
  ∀ u ∉ L.lattice, iteratedDeriv 3 X u -
      4 * ((n * (n + 1) : ℂ) * L.weierstrassP u + B) * deriv X u -
      2 * (n * (n + 1) : ℂ) * L.derivWeierstrassP u * X u = 0

/-- README 5.1: Hermite's polynomial `F`: the monic polynomial of degree `n` with `F(℘)` a
solution of the product equation; `0` is junk. -/
def lameHermitePoly (L : PeriodPair) (n : ℕ) (B : ℂ) : Polynomial ℂ :=
  if h : ∃ F : Polynomial ℂ, F.Monic ∧ F.natDegree = n ∧
      IsLameProductSolution L n B (fun u => F.eval (L.weierstrassP u)) then h.choose
  else 0

/-- README 5.1: the invariant `X′² − 2XX″ + 4(n(n + 1)℘ + B) X²` of `X = F(℘)` (which is `4Θ²` in
Whittaker–Watson's notation, p. 572), evaluated at `u = ω₁/2`. -/
def lameHermiteInvariant (L : PeriodPair) (n : ℕ) (B : ℂ) : ℂ :=
  let X : ℂ → ℂ := fun u => (lameHermitePoly L n B).eval (L.weierstrassP u)
  let u₀ := L.ω₁ / 2
  deriv X u₀ ^ 2 - 2 * X u₀ * deriv (deriv X) u₀ +
    4 * ((n * (n + 1) : ℂ) * L.weierstrassP u₀ + B) * X u₀ ^ 2

/-- README 5.1, Hermite's product: `F` exists and is unique, the invariant is constant off the
lattice, it is a polynomial of degree `2n + 1` in `B` with leading coefficient `4/((2n − 1)!!)⁴`,
and it vanishes iff some solution has square `F(℘)` (Whittaker–Watson §23.7, pp. 570–572). -/
theorem lame_hermite (L : PeriodPair) (n : ℕ) :
    (∀ B : ℂ, (lameHermitePoly L n B).Monic ∧ (lameHermitePoly L n B).natDegree = n ∧
      IsLameProductSolution L n B (fun u => (lameHermitePoly L n B).eval (L.weierstrassP u))) ∧
    (∀ (B : ℂ) (G : Polynomial ℂ), G.Monic → G.natDegree = n →
      IsLameProductSolution L n B (fun u => G.eval (L.weierstrassP u)) →
        G = lameHermitePoly L n B) ∧
    (∀ (B : ℂ), ∀ u ∉ L.lattice,
      let X : ℂ → ℂ := fun v => (lameHermitePoly L n B).eval (L.weierstrassP v)
      deriv X u ^ 2 - 2 * X u * deriv (deriv X) u +
        4 * ((n * (n + 1) : ℂ) * L.weierstrassP u + B) * X u ^ 2 = lameHermiteInvariant L n B) ∧
    (∃ R : Polynomial ℂ, R.natDegree = 2 * n + 1 ∧
      R.leadingCoeff = 4 / ((Nat.doubleFactorial (2 * n - 1) : ℕ) : ℂ) ^ 4 ∧
      ∀ B, lameHermiteInvariant L n B = R.eval B) ∧
    ∀ B : ℂ, lameHermiteInvariant L n B = 0 ↔
      ∃ U : Set ℂ, IsOpen U ∧ U.Nonempty ∧ Disjoint U L.lattice ∧ ∃ Λ : ℂ → ℂ,
        IsLameWeierstrassSolution L n B Λ U ∧
          ∀ u ∈ U, Λ u ^ 2 = (lameHermitePoly L n B).eval (L.weierstrassP u) := by
  sorry

/-- README 5.2: for the lattice of periods `1` and `τ = iK′/K`, the zeros of Hermite's invariant
are the images of the `2n + 1` polynomial eigenvalues under `h ↦ (2K)²(n(n + 1)(1 + k²)/3 − h)`. -/
theorem lameHermiteInvariant_eq_zero_iff {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) (n : ℕ)
    (τ : UpperHalfPlane) (hτ : (τ : ℂ) = I * (legendreK (Real.sqrt (1 - k ^ 2)) / legendreK k)) :
    {B : ℂ | lameHermiteInvariant τ.periodPair n B = 0} =
      (fun h : ℝ => (((2 * legendreK k) ^ 2 * (n * (n + 1) * (1 + k ^ 2) / 3 - h) : ℝ) : ℂ)) ''
        ({h | ∃ j ≤ n, h = lameA n k j} ∪ {h | ∃ j, 1 ≤ j ∧ j ≤ n ∧ h = lameB n k j}) := by
  sorry

/-- README 5.3: coexistence (DLMF 29.3.5) and the sign of `a^m_ν − b^m_ν` (DLMF 29.3.6). -/
theorem lame_coexistence {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) :
    (∀ (n m : ℕ), n < m → lameA n k m = lameB n k m) ∧
      ∀ (ν : ℝ) (m : ℕ), -1 / 2 ≤ ν → 1 ≤ m → (∀ i < m, ν ≠ i) →
        0 < (lameA ν k m - lameB ν k m) * ∏ i ∈ Finset.range m, (ν - i) := by
  sorry

/-- README 5.4: every solution of Lamé's equation with eigenvalue `h` is bounded on `ℝ`. -/
def IsLameStable (ν k h : ℝ) : Prop :=
  ∀ w, IsHillSolution (lamePotential ν k) h w → ∃ C, ∀ x, ‖w x‖ ≤ C

/-- README 5.4: the instability intervals (DLMF §29.9): for `ν ∉ ℤ`, `h ≤ a⁰` and the closed
intervals between `a^m` and `b^m`, `m ≥ 1`; for `ν = n ∈ ℕ`, `h ≤ a⁰` and `[b^m, a^m]`,
`1 ≤ m ≤ n` only. -/
theorem lame_stability {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) :
    (∀ ν : ℝ, (∀ n : ℤ, ν ≠ n) → ∀ h : ℝ, ¬ IsLameStable ν k h ↔
      h ≤ lameA ν k 0 ∨ ∃ m, 1 ≤ m ∧ h ∈ uIcc (lameA ν k m) (lameB ν k m)) ∧
    ∀ (n : ℕ) (h : ℝ), ¬ IsLameStable n k h ↔
      h ≤ lameA n k 0 ∨ ∃ m, 1 ≤ m ∧ m ≤ n ∧ h ∈ Icc (lameB n k m) (lameA n k m) := by
  sorry

/-! ## Layer 6: ellipsoidal harmonics and integral equations -/

/-- README 6.2: the double orthogonality of the Lamé polynomials of type `u` (DLMF 29.14.1–29.14.3),
with `sn²(K + it, k) = dn(t, k′)⁻²`. -/
theorem lame_double_orthogonal {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) {n n' : ℕ} {h h' : ℝ}
    {P P' : Polynomial ℝ} (hP : IsLamePolynomial n k h false false false P)
    (hP' : IsLamePolynomial n' k h' false false false P') (hne : (n, h) ≠ (n', h')) :
    let k' := Real.sqrt (1 - k ^ 2)
    (∫ s in (0 : ℝ)..legendreK k, ∫ t in (0 : ℝ)..legendreK k',
      ((jacobiDn k' t ^ 2)⁻¹ - jacobiSn k s ^ 2) *
        (P.eval (jacobiSn k s ^ 2) * P.eval (jacobiDn k' t ^ 2)⁻¹) *
        (P'.eval (jacobiSn k s ^ 2) * P'.eval (jacobiDn k' t ^ 2)⁻¹)) = 0 := by
  sorry

/-- README 6.3: Whittaker's integral equation for the Lamé polynomials of types `u` and `s`
(Whittaker–Watson §23.6, pp. 564–566): `E(α)` is a nonzero multiple of
`∫_{−2K}^{2K} P_n(k sn α sn θ) E(θ) dθ`, with `P_n(y) = shiftedLegendre n ((1 − y)/2)`. -/
theorem lame_integral_equation {k : ℝ} (hk : k ∈ Ioo (0 : ℝ) 1) {n : ℕ} {h : ℝ} {s : Bool}
    {P : Polynomial ℝ} (hP : IsLamePolynomial n k h s false false P) :
    let E : ℝ → ℝ := fun z => lameTypeFactor k s false false z * P.eval (jacobiSn k z ^ 2)
    ∃ c : ℝ, c ≠ 0 ∧ ∀ α : ℝ, c * E α =
      ∫ θ in (-2 * legendreK k)..(2 * legendreK k),
        Polynomial.aeval ((1 - k * jacobiSn k α * jacobiSn k θ) / 2)
          (Polynomial.shiftedLegendre n) * E θ := by
  sorry

/-! ## Library declarations consumed -/

#check @TauCeti.Real.jacobiSn
#check @TauCeti.Real.jacobiCn
#check @TauCeti.Real.jacobiDn
#check @TauCeti.Real.jacobiAm
#check @TauCeti.Real.legendreK
#check @TauCeti.Real.jacobiSn_antiperiodic
#check @TauCeti.Real.jacobiSn_neg
#check @TauCeti.Real.hasDerivAt_jacobiSn
#check @TauCeti.Real.jacobiSn_legendreK
#check @TauCeti.Real.jacobiSn_zero_modulus
#check @TauCeti.Real.legendreK_pos
#check @UpperHalfPlane.periodPair
#check @PeriodPair.weierstrassP
#check @PeriodPair.derivWeierstrassP
#check @PeriodPair.derivWeierstrassP_sq
#check @PeriodPair.weierstrassZeta
#check @Polynomial.shiftedLegendre
#check @Matrix.charpoly
#check @Matrix.IsHermitian.eigenvalues
#check @Polynomial.roots
#check @Real.sign

end TauCetiRoadmap.SpecialFunctionsLame
