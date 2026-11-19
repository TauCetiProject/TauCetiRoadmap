import Mathlib
import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre
import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.Basic
import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.RG
import TauCeti.Analysis.SpecialFunctions.JacobiElliptic.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.RealPeriod

/-!
# Elliptic integrals, the AGM, and Jacobi elliptic functions: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; it is not an
exhaustive list of the README's targets, which also carries every intermediate statement and
every Check.

The carriers are the pinned libraries' own: Tau Ceti's Legendre integrals
`TauCeti.Real.legendreK` and `TauCeti.Real.legendreEc` (with the modulus `k`, never the parameter
`k ^ 2`), Carlson's integrals `Complex.carlsonRF` and `Complex.carlsonRG`, the real Jacobi
functions `TauCeti.Real.jacobiSn`, `TauCeti.Real.jacobiCn`, `TauCeti.Real.jacobiDn`, the real period
`WeierstrassCurve.realPeriod`, and Mathlib's arithmetic–geometric mean `NNReal.agm` with its
sequences `NNReal.agmSequences`.

The headline theorems that the pinned Tau Ceti already proves (Gauss's theorem
`K(k) = π / (2 M(1, k′))`, Legendre's relation, the value `K(1/√2) = Γ(1/4)² / (4√π)` and Gauss's
lemniscate identity, the perimeter of an ellipse with `b² ≤ a²`) are supplier contracts of the
README and are not restated here. Every headline theorem that remains a target of the roadmap is
statable at the pins and is stated below.
-/

noncomputable section

namespace TauCetiRoadmap.EllipticIntegrals

open Real Filter Topology TauCeti.Real
open scoped NNReal

/-! ## Layer 1: the complete integrals at the singular modulus -/

/-- **The logarithmic singularity of `K`** (DLMF 19.12.1): as `k → 1⁻`, the complete integral of
the first kind differs from `log (4 / k′)`, `k′ = √(1 - k²)`, by a quantity tending to `0`. -/
theorem tendsto_legendreK_sub_log :
    Tendsto (fun k ↦ legendreK k - log (4 / √(1 - k ^ 2))) (𝓝[<] 1) (𝓝 0) := sorry

/-! ## Layer 2: the AGM evaluation of `E` and the Gauss–Brent–Salamin formula -/

/-- **The AGM series for `E`** (DLMF 19.8.6). Run the arithmetic–geometric mean from `a₀ = 1`,
`g₀ = k′ = √(1 - k²)`, and put `c₀ = k`, `cₙ₊₁ = (aₙ - gₙ) / 2`, so that `cₙ² = aₙ² - gₙ²` for
`n ≥ 1`. Then `∑ₙ 2^(n-1) cₙ²` converges and `E(k) = K(k) (1 - ∑ₙ 2^(n-1) cₙ²)`.

Mathlib's `NNReal.agmSequences 1 k′ n` is the pair `(gₙ₊₁, aₙ₊₁)`, so the `n`-th term `s n` below
is `2ⁿ cₙ₊₁²`, and the term `n = 0` of the classical sum, `k² / 2`, is written separately. -/
theorem legendreEc_eq_agm_tsum {k : ℝ} (hk : k ^ 2 < 1) :
    let s : ℕ → ℝ := fun n ↦ 2 ^ n *
      (((NNReal.agmSequences 1 (√(1 - k ^ 2)).toNNReal n).2 : ℝ) ^ 2 -
        ((NNReal.agmSequences 1 (√(1 - k ^ 2)).toNNReal n).1 : ℝ) ^ 2)
    Summable s ∧ legendreEc k = legendreK k * (1 - k ^ 2 / 2 - ∑' n, s n) := sorry

/-- **The Gauss–Brent–Salamin formula** (Salamin 1976). Run the arithmetic–geometric mean from
`a₀ = 1`, `g₀ = 1/√2`, with `cₙ² = aₙ² - gₙ²`. Then `∑_{n ≥ 1} 2^(n+1) cₙ²` converges and
`π = 4 M(1, 1/√2)² / (1 - ∑_{n ≥ 1} 2^(n+1) cₙ²)`. The `n`-th term `s n` below is `2^(n+2) cₙ₊₁²`,
read off Mathlib's `NNReal.agmSequences 1 (1/√2) n = (gₙ₊₁, aₙ₊₁)`. -/
theorem pi_eq_four_mul_agm_sq_div_one_sub_tsum :
    let g₀ : ℝ≥0 := (NNReal.sqrt 2)⁻¹
    let s : ℕ → ℝ := fun n ↦ 2 ^ (n + 2) *
      (((NNReal.agmSequences 1 g₀ n).2 : ℝ) ^ 2 - ((NNReal.agmSequences 1 g₀ n).1 : ℝ) ^ 2)
    Summable s ∧ π = 4 * (NNReal.agm 1 g₀ : ℝ) ^ 2 / (1 - ∑' n, s n) := sorry

/-! ## Layer 3: Carlson's symmetric integrals -/

/-- **The duplication theorem** (DLMF 19.26.18) on the whole domain: for `x` in the slit plane or
`0` and `y`, `z` in the slit plane, with `λ = √x√y + √y√z + √z√x` (principal square roots),
`R_F(x, y, z) = R_F((x + λ)/4, (y + λ)/4, (z + λ)/4)`. By the symmetry of `R_F` and of `λ`, this
covers every triple of the domain, at most one of whose entries is `0`. -/
theorem carlsonRF_duplication {x y z : ℂ} (hx : x ∈ Complex.slitPlane ∪ {0})
    (hy : y ∈ Complex.slitPlane) (hz : z ∈ Complex.slitPlane) :
    let l := x ^ (1 / 2 : ℂ) * y ^ (1 / 2 : ℂ) + y ^ (1 / 2 : ℂ) * z ^ (1 / 2 : ℂ) +
      z ^ (1 / 2 : ℂ) * x ^ (1 / 2 : ℂ)
    Complex.carlsonRF x y z =
      Complex.carlsonRF ((x + l) / 4) ((y + l) / 4) ((z + l) / 4) := sorry

/-- **The complete integral of the second kind as `R_G`** (DLMF 19.25.1): for `k² < 1`,
`E(k) = 2 R_G(0, 1 - k², 1)`, the Carlson value being taken at real arguments. -/
theorem legendreEc_eq_carlsonRG {k : ℝ} (hk : k ^ 2 < 1) :
    (legendreEc k : ℂ) = 2 * Complex.carlsonRG 0 (1 - k ^ 2 : ℝ) 1 := sorry

/-! ## Layer 4: the Jacobi elliptic functions of a real variable -/

/-- **The addition theorem for `sn`** (DLMF 22.8.1): for `k² < 1` and real `u`, `v`,
`sn(u + v) = (sn u cn v dn v + sn v cn u dn u) / (1 - k² sn² u sn² v)`. -/
theorem jacobiSn_add {k : ℝ} (hk : k ^ 2 < 1) (u v : ℝ) :
    jacobiSn k (u + v) =
      (jacobiSn k u * jacobiCn k v * jacobiDn k v + jacobiSn k v * jacobiCn k u * jacobiDn k u) /
        (1 - k ^ 2 * jacobiSn k u ^ 2 * jacobiSn k v ^ 2) := sorry

/-- **The nonlinear pendulum** (DLMF 22.19.1–22.19.2, time rescaled by `ω`). For `ω > 0` and
`0 < θ₀ < π`, with `k = sin (θ₀/2)`, the function `θ t = 2 arcsin (k sn(ω t + K(k), k))` is `C²`,
solves `θ″ = -ω² sin θ` with `θ 0 = θ₀` and `θ′ 0 = 0`, and is periodic with period
`4 K(k) / ω`. -/
theorem pendulum_solution {ω θ₀ : ℝ} (hω : 0 < ω) (hθ₀ : 0 < θ₀) (hθ₀π : θ₀ < π) :
    let k := sin (θ₀ / 2)
    let θ : ℝ → ℝ := fun t ↦ 2 * arcsin (k * jacobiSn k (ω * t + legendreK k))
    ContDiff ℝ 2 θ ∧ (∀ t, deriv (deriv θ) t = -ω ^ 2 * sin (θ t)) ∧
      θ 0 = θ₀ ∧ deriv θ 0 = 0 ∧ Function.Periodic θ (4 * legendreK k / ω) := sorry

/-! ## Layer 5: geometry and the real period -/

/-- **The real period with three real roots** (Cremona §3.7). If
`Ψ₂Sq(x) = 4 (x - e₁)(x - e₂)(x - e₃)` with `e₃ < e₂ < e₁`, the real period is
`4 K(k) / √(e₁ - e₃)` with `k² = (e₂ - e₃) / (e₁ - e₃)`. -/
theorem realPeriod_eq_of_three_real_roots (W : WeierstrassCurve ℝ) {e₁ e₂ e₃ : ℝ}
    (h₃₂ : e₃ < e₂) (h₂₁ : e₂ < e₁)
    (hW : ∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * (x - e₂) * (x - e₃)) :
    W.realPeriod = 4 * legendreK √((e₂ - e₃) / (e₁ - e₃)) / √(e₁ - e₃) := sorry

/-- **The AGM formula for the real period with three real roots** (Cremona §3.7). If
`Ψ₂Sq(x) = 4 (x - e₁)(x - e₂)(x - e₃)` with `e₃ < e₂ < e₁`, the real period is
`2π / M(√(e₁ - e₃), √(e₁ - e₂))`. -/
theorem realPeriod_eq_two_mul_pi_div_agm_of_three_real_roots (W : WeierstrassCurve ℝ)
    {e₁ e₂ e₃ : ℝ} (h₃₂ : e₃ < e₂) (h₂₁ : e₂ < e₁)
    (hW : ∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * (x - e₂) * (x - e₃)) :
    W.realPeriod = 2 * π / NNReal.agm (√(e₁ - e₃)).toNNReal (√(e₁ - e₂)).toNNReal := sorry

/-- **The real period with one real root** (Cremona §3.7; Byrd–Friedman 239.00). If
`Ψ₂Sq(x) = 4 (x - e₁)((x - a)² + b²)` with `b ≠ 0`, and `A = √((e₁ - a)² + b²)`, the real period
is `2 K(k) / √A` with `k² = (A + a - e₁) / (2A)`. -/
theorem realPeriod_eq_of_one_real_root (W : WeierstrassCurve ℝ) {e₁ a b : ℝ} (hb : b ≠ 0)
    (hW : ∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * ((x - a) ^ 2 + b ^ 2)) :
    let A := √((e₁ - a) ^ 2 + b ^ 2)
    W.realPeriod = 2 * legendreK √((A + a - e₁) / (2 * A)) / √A := sorry

/-- **The AGM formula for the real period with one real root** (Cremona §3.7). If
`Ψ₂Sq(x) = 4 (x - e₁)((x - a)² + b²)` with `b ≠ 0`, and `A = √((e₁ - a)² + b²)`, the real period
is `2π / M(2√A, √(2A + 2(e₁ - a)))`. -/
theorem realPeriod_eq_two_mul_pi_div_agm_of_one_real_root (W : WeierstrassCurve ℝ)
    {e₁ a b : ℝ} (hb : b ≠ 0)
    (hW : ∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * ((x - a) ^ 2 + b ^ 2)) :
    let A := √((e₁ - a) ^ 2 + b ^ 2)
    W.realPeriod =
      2 * π / NNReal.agm (2 * √A).toNNReal (√(2 * A + 2 * (e₁ - a))).toNNReal := sorry

end TauCetiRoadmap.EllipticIntegrals
