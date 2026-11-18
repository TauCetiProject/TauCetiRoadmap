import Mathlib

/-!
# Elliptic integrals, the AGM, and Jacobi elliptic functions: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a milestone nor the roadmap.

The definitions below are roadmap-local copies of the definitions `README.md` pins (in Tau Ceti
they live in `TauCeti.Real` and `TauCeti.Complex`). They are stated with their intended bodies
so that the conventions are checked by the compiler: the modulus `k` (never the parameter
`k ^ 2`), real powers `(· : ℝ) ^ (-1 / 2 : ℝ)` of the Legendre integrands, principal complex
powers of each linear factor in the Carlson integrands, and Mathlib's `NNReal.agm`. Theorems are
stated with `sorry` (allowed in this human-owned roadmap library).

The Milestone 8 statements about `WeierstrassCurve.realPeriod` are given in `README.md`: the
Tau Ceti dependency pinned by this repository predates that declaration.
-/

noncomputable section

namespace TauCetiRoadmap.EllipticIntegrals

open Real Set Filter Topology MeasureTheory intervalIntegral
open scoped NNReal

/-! ### Milestone 1: the Legendre integrals -/

/-- Legendre's incomplete elliptic integral of the first kind (DLMF 19.2.4). -/
def legendreF (φ k : ℝ) : ℝ :=
  ∫ θ in (0 : ℝ)..φ, (1 - k ^ 2 * sin θ ^ 2) ^ (-1 / 2 : ℝ)

/-- Legendre's incomplete elliptic integral of the second kind (DLMF 19.2.5). -/
def legendreE (φ k : ℝ) : ℝ :=
  ∫ θ in (0 : ℝ)..φ, (1 - k ^ 2 * sin θ ^ 2) ^ (1 / 2 : ℝ)

/-- Legendre's incomplete elliptic integral of the third kind (DLMF 19.2.7), with
characteristic `α2` (written `α²` in prose; it may be negative). -/
def legendrePi (φ k α2 : ℝ) : ℝ :=
  ∫ θ in (0 : ℝ)..φ, (1 - α2 * sin θ ^ 2)⁻¹ * (1 - k ^ 2 * sin θ ^ 2) ^ (-1 / 2 : ℝ)

/-- The complete elliptic integral of the first kind, `K(k) = F(π/2, k)`. -/
def legendreK (k : ℝ) : ℝ := legendreF (π / 2) k

/-- The complete elliptic integral of the second kind, `E(k) = E(π/2, k)`. -/
def legendreEc (k : ℝ) : ℝ := legendreE (π / 2) k

/-- The complete elliptic integral of the third kind, `Π(k, α²) = Π(π/2, k, α²)`. -/
def legendrePic (k α2 : ℝ) : ℝ := legendrePi (π / 2) k α2

theorem legendreK_pos {k : ℝ} (hk : k ^ 2 < 1) : 0 < legendreK k := sorry

/-- **M1.3** Quasi-periodicity in the amplitude. -/
theorem legendreF_add_pi {k : ℝ} (hk : k ^ 2 < 1) (φ : ℝ) :
    legendreF (φ + π) k = legendreF φ k + 2 * legendreK k := sorry

/-- **M1.4** The integral of the first kind is an order isomorphism of `ℝ` in the amplitude;
`jacobiAm` (Milestone 7) is its inverse. -/
theorem exists_orderIso_legendreF {k : ℝ} (hk : k ^ 2 < 1) :
    ∃ e : ℝ ≃o ℝ, ⇑e = fun φ ↦ legendreF φ k := sorry

/-- **M1.5** The degenerate modulus `k = 1`. -/
theorem legendreF_one {φ : ℝ} (hφ : |φ| < π / 2) : legendreF φ 1 = artanh (sin φ) := sorry

theorem tendsto_legendreK_one : Tendsto legendreK (𝓝[<] 1) atTop := sorry

/-- **M1.6** Third kind with characteristic `k²` (DLMF 19.6.13). -/
theorem legendrePi_sq {k : ℝ} (hk : k ^ 2 < 1) (φ : ℝ) :
    legendrePi φ k (k ^ 2) =
      (legendreE φ k - k ^ 2 * sin φ * cos φ / √(1 - k ^ 2 * sin φ ^ 2)) / (1 - k ^ 2) :=
  sorry

/-! ### Milestone 2: dependence on the modulus -/

/-- **M2.2** (DLMF 19.4.1). -/
theorem hasDerivAt_legendreK {k : ℝ} (hk₀ : 0 < k) (hk₁ : k < 1) :
    HasDerivAt legendreK
      ((legendreEc k - (1 - k ^ 2) * legendreK k) / (k * (1 - k ^ 2))) k := sorry

theorem hasDerivAt_legendreEc {k : ℝ} (hk₀ : 0 < k) (hk₁ : k < 1) :
    HasDerivAt legendreEc ((legendreEc k - legendreK k) / k) k := sorry

/-- **M2.4** The hypergeometric series (DLMF 19.5.1). -/
theorem legendreK_eq_ordinaryHypergeometric {k : ℝ} (hk : k ^ 2 < 1) :
    legendreK k = π / 2 * ordinaryHypergeometric (1 / 2 : ℝ) (1 / 2) 1 (k ^ 2) := sorry

/-! ### Milestone 3: the logarithmic singularity and Legendre's relation -/

/-- **M3.1** (DLMF 19.12.1). -/
theorem tendsto_legendreK_sub_log :
    Tendsto (fun k ↦ legendreK k - log (4 / √(1 - k ^ 2))) (𝓝[<] 1) (𝓝 0) := sorry

/-- **M3.2** Legendre's relation (DLMF 19.7.1). -/
theorem legendre_relation {k : ℝ} (hk₀ : 0 < k) (hk₁ : k < 1) :
    legendreEc k * legendreK √(1 - k ^ 2) + legendreEc √(1 - k ^ 2) * legendreK k -
      legendreK k * legendreK √(1 - k ^ 2) = π / 2 := sorry

/-! ### Milestone 4: the arithmetic–geometric mean -/

/-- **M4.1** One AGM step shrinks the gap quadratically. -/
theorem add_div_two_sub_sqrt_mul_le {x y : ℝ} (hy : 0 < y) (hxy : y ≤ x) :
    (x + y) / 2 - √(x * y) ≤ (x - y) ^ 2 / (8 * y) := sorry

/-- **M4.2** The AGM integral, named and shaped as in mathlib4#34397. -/
def agmIntegral (a b : ℝ) : ℝ :=
  ∫ x in Ioi 0, (√((x ^ 2 + a ^ 2) * (x ^ 2 + b ^ 2)))⁻¹

theorem agmIntegral_eq_pi_div_two_div_agm (a b : ℝ≥0) :
    agmIntegral a b = π / 2 / NNReal.agm a b := sorry

/-- **M4.4** Gauss's theorem. -/
theorem legendreK_eq_pi_div_agm {k : ℝ} (hk : k ^ 2 < 1) :
    legendreK k = π / (2 * NNReal.agm 1 (NNReal.sqrt (1 - k ^ 2).toNNReal)) := sorry

/-- **M4.5** Landen's descending transformation of `K` (DLMF 19.8.12). -/
theorem legendreK_landen {k : ℝ} (hk₀ : 0 ≤ k) (hk₁ : k < 1) :
    legendreK k = (1 + (1 - √(1 - k ^ 2)) / (1 + √(1 - k ^ 2))) *
      legendreK ((1 - √(1 - k ^ 2)) / (1 + √(1 - k ^ 2))) := sorry

/-! ### Milestone 5: special values -/

/-- The lemniscate constant `ϖ = 2 ∫₀¹ (1 - t⁴)^(-1/2) dt`. -/
def lemniscateConstant : ℝ :=
  2 * ∫ t in (0 : ℝ)..1, (1 - t ^ 4) ^ (-1 / 2 : ℝ)

theorem legendreK_inv_sqrt_two :
    legendreK (1 / √2) = Gamma (1 / 4) ^ 2 / (4 * √π) := sorry

/-- **M5.3** Gauss's identity `ϖ = π / M(1, √2)`. -/
theorem lemniscateConstant_eq_pi_div_agm :
    lemniscateConstant = π / NNReal.agm 1 (NNReal.sqrt 2) := sorry

/-! ### Milestone 6: Carlson's symmetric integrals -/

section Carlson

open Complex

/-- Carlson's symmetric integral of the first kind (DLMF 19.16.1). -/
def carlsonRF (x y z : ℂ) : ℂ :=
  (1 / 2 : ℂ) * ∫ t in Ioi (0 : ℝ),
    ((t : ℂ) + x) ^ (-(1 / 2) : ℂ) * ((t : ℂ) + y) ^ (-(1 / 2) : ℂ) *
      ((t : ℂ) + z) ^ (-(1 / 2) : ℂ)

/-- Carlson's symmetric integral of the third kind (DLMF 19.16.2). -/
def carlsonRJ (x y z p : ℂ) : ℂ :=
  (3 / 2 : ℂ) * ∫ t in Ioi (0 : ℝ),
    ((t : ℂ) + x) ^ (-(1 / 2) : ℂ) * ((t : ℂ) + y) ^ (-(1 / 2) : ℂ) *
      ((t : ℂ) + z) ^ (-(1 / 2) : ℂ) * ((t : ℂ) + p)⁻¹

/-- Carlson's `R_D` (DLMF 19.16.5). -/
def carlsonRD (x y z : ℂ) : ℂ := carlsonRJ x y z z

/-- Carlson's `R_C` (DLMF 19.2.17). -/
def carlsonRC (x y : ℂ) : ℂ := carlsonRF x y y

/-- Carlson's symmetric integral of the second kind (DLMF 19.16.3). -/
def carlsonRG (x y z : ℂ) : ℂ :=
  (1 / 4 : ℂ) * ∫ t in Ioi (0 : ℝ),
    ((t : ℂ) + x) ^ (-(1 / 2) : ℂ) * ((t : ℂ) + y) ^ (-(1 / 2) : ℂ) *
      ((t : ℂ) + z) ^ (-(1 / 2) : ℂ) *
      (x / ((t : ℂ) + x) + y / ((t : ℂ) + y) + z / ((t : ℂ) + z)) * (t : ℂ)

/-- **M6.5** The duplication theorem (DLMF 19.26.18), on the slit plane. -/
theorem carlsonRF_duplication {x y z : ℂ} (hx : x ∈ slitPlane) (hy : y ∈ slitPlane)
    (hz : z ∈ slitPlane) :
    let l := x ^ (1 / 2 : ℂ) * y ^ (1 / 2 : ℂ) + y ^ (1 / 2 : ℂ) * z ^ (1 / 2 : ℂ) +
      z ^ (1 / 2 : ℂ) * x ^ (1 / 2 : ℂ)
    carlsonRF x y z = carlsonRF ((x + l) / 4) ((y + l) / 4) ((z + l) / 4) := sorry

/-- **M6.6** The Legendre dictionary (DLMF 19.25.5). -/
theorem legendreF_eq_carlsonRF {φ k : ℝ} (hk : k ^ 2 < 1) (hφ : |φ| ≤ π / 2) :
    (legendreF φ k : ℂ) =
      Real.sin φ * carlsonRF (Real.cos φ ^ 2 : ℝ) (1 - k ^ 2 * Real.sin φ ^ 2 : ℝ) 1 := sorry

theorem legendreEc_eq_carlsonRG {k : ℝ} (hk : k ^ 2 < 1) :
    (legendreEc k : ℂ) = 2 * carlsonRG 0 (1 - k ^ 2 : ℝ) 1 := sorry

end Carlson

/-! ### Milestone 7: Jacobi elliptic functions of a real variable -/

/-- The Jacobi amplitude: the inverse of `φ ↦ legendreF φ k`, for `k ^ 2 < 1`. Outside that
range it is the junk value `id`. -/
def jacobiAm (k : ℝ) : ℝ → ℝ :=
  if hk : k ^ 2 < 1 then (exists_orderIso_legendreF hk).choose.symm else id

def jacobiSn (k u : ℝ) : ℝ := sin (jacobiAm k u)

def jacobiCn (k u : ℝ) : ℝ := cos (jacobiAm k u)

def jacobiDn (k u : ℝ) : ℝ := √(1 - k ^ 2 * jacobiSn k u ^ 2)

theorem hasDerivAt_jacobiSn {k : ℝ} (hk : k ^ 2 < 1) (u : ℝ) :
    HasDerivAt (jacobiSn k) (jacobiCn k u * jacobiDn k u) u := sorry

theorem jacobiSn_periodic {k : ℝ} (hk : k ^ 2 < 1) :
    Function.Periodic (jacobiSn k) (4 * legendreK k) := sorry

/-- **M7.5** The addition theorem (DLMF 22.8.1). -/
theorem jacobiSn_add {k : ℝ} (hk : k ^ 2 < 1) (u v : ℝ) :
    jacobiSn k (u + v) =
      (jacobiSn k u * jacobiCn k v * jacobiDn k v + jacobiSn k v * jacobiCn k u * jacobiDn k u) /
        (1 - k ^ 2 * jacobiSn k u ^ 2 * jacobiSn k v ^ 2) := sorry

/-- **M7.7** The nonlinear pendulum: an explicit solution with the given initial data. -/
theorem pendulum_solution {ω θ₀ : ℝ} (hω : 0 < ω) (hθ₀ : 0 < θ₀) (hθ₀π : θ₀ < π) :
    let k := sin (θ₀ / 2)
    let θ : ℝ → ℝ := fun t ↦ 2 * arcsin (k * jacobiSn k (ω * t + legendreK k))
    ContDiff ℝ 2 θ ∧ (∀ t, deriv (deriv θ) t = -ω ^ 2 * sin (θ t)) ∧
      θ 0 = θ₀ ∧ deriv θ 0 = 0 ∧ Function.Periodic θ (4 * legendreK k / ω) := sorry

/-! ### Milestone 8: geometry -/

/-- **M8.1** The perimeter of an ellipse with semi-axes `b ≤ a`. -/
theorem eVariationOn_ellipse {a b : ℝ} (hb : 0 < b) (hab : b ≤ a) :
    eVariationOn (fun t : ℝ ↦ (a * Real.cos t : ℂ) + (b * Real.sin t : ℝ) * Complex.I)
        (Icc 0 (2 * π)) =
      ENNReal.ofReal (4 * a * legendreEc √(1 - b ^ 2 / a ^ 2)) := sorry

end TauCetiRoadmap.EllipticIntegrals
