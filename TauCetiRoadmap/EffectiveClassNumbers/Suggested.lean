import Mathlib
import TauCeti.NumberTheory.BinaryQuadraticForm.Reduced
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion

/-!
# EffectiveClassNumbers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, with the simple definitions they need.

The end theorems are Oesterlé's technical theorem (§1.8), analytic and arithmetic rank three
for the two explicit elliptic curves (§§2.12–2.13), the uniform constants 7000 and 55
(§§3.6–3.7), the effective logarithmic bound and fixed-class-number cutoff (§§4.7–4.8),
and the sixteen-discriminant classification (§5.8). The integrated nonaxial lattice estimate
(§0.7) and Montgomery–Weinberger exclusion (§5.4) are also deep results stated here.

The full Gross–Zagier formulas (§2.8) and vanishing of the geometric conductor-37 Heegner
trace (§2.11) are not statable at the pins: the arithmetic Heegner-point construction on
X₀(N), its Jacobian isotypic components and their modular-parametrisation height comparison
are missing. The all-factor symmetric-square/Rankin–Selberg comparison (§3.1) is not
statable either: the elliptic Weil–Deligne local parameters with inertia and monodromy,
and the associated symmetric-square L-function, are missing. These remain README targets.

An elliptic L-function below is an entire function agreeing with the curve's native
`WeierstrassCurve.LSeries` on Re s > 3/2; the continuation is supplied by
EllipticCurveModularity R29.6. The rank statements name the concrete curves and their
native rational points modulo torsion. Imaginary quadratic fields have degree two and
negative native discriminant, and their class number is that of the maximal order.
-/

open Filter MeasureTheory
open scoped BigOperators Topology NumberField

namespace TauCetiRoadmap.EffectiveClassNumbers

noncomputable section

/-! ## Layer 0: imaginary quadratic fields, discriminant weights and small split primes -/

/-- §0.3: the ramified-prime weight θ(d), with the largest distinct prime divisor omitted. -/
def ramifiedWeight (d : ℕ) : ℝ :=
  ∏ p ∈ d.primeFactors.erase (d.primeFactors.sup id),
    (1 - (⌊2 * Real.sqrt p⌋₊ : ℝ) / (p + 1))

/-- §0.7: the number of nonaxial lattice points with q(m,n) ≤ t and n ≥ 1. -/
def nonaxialCount (q : TauCeti.BinaryQuadraticForm ℤ) (t : ℝ) : ℕ :=
  Nat.card {v : ℤ × ℤ // 1 ≤ v.2 ∧ (q.eval v.1 v.2 : ℝ) ≤ t}

/-- §0.7: Oesterlé's integrated lattice-point estimate for a reduced positive definite form
of discriminant −d (O85 §1.3, p. 312). -/
theorem integral_nonaxialCount_le (q : TauCeti.BinaryQuadraticForm ℤ) (d : ℕ)
    (hd : 0 < d) (hdiscr : q.discrim = -(d : ℤ)) (hred : TauCeti.IsReducedForm q)
    (A : ℝ) (hA : 0 ≤ A) :
    (∫ t in (0 : ℝ)..A, (nonaxialCount q t : ℝ)) ≤
      ∫ t in (0 : ℝ)..A,
        if Real.sqrt d / 2 ≤ t then Real.pi * t / Real.sqrt d else 0 := by
  sorry

/-! ## Layer 1: Goldfeld's effective analytic principle -/

/-- §1.1: the right-half-plane expression d^(s−1) M^s Γ(s)² Ψ(s) G(s), centred at one.
An entire continuation is separate data in Oesterlé’s technical theorem. -/
def goldfeldCompletion (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : ℂ → ℂ :=
  fun s ↦ (d : ℂ) ^ (s - 1) * (M : ℂ) ^ s * Complex.Gamma s ^ 2 * Ψ s * G s

/-- §1.8: Oesterlé's technical theorem. For fixed `M` and `Ψ` satisfying the `Ψ`-parts of C1 and
C4 there is `C`, independent of the field and of `G`, with
`min(1, ∏_{p ∈ P(d)} |G_p(1)|/(1 + 1/p)) · log d ≤ C h` whenever `G` satisfies C1–C2 and
an entire `F`, agreeing with the product on `re s > 3/2`, satisfies C3. -/
theorem oesterleTechnical (M : ℝ) (hM : 0 < M) (Ψ : ℂ → ℂ) (a : ℕ → ℂ)
    (hΨseries : ∀ s : ℂ, 1 < s.re → Ψ s = LSeries a s)
    (hΨcoeff : ∀ n : ℕ, 0 < n → ‖a n‖ ≤
      if (Nat.sqrt n) ^ 2 = n then (Nat.sqrt n : ℝ) * (Nat.divisors (Nat.sqrt n)).card else 0)
    (U : Set ℂ) (hU : IsOpen U) (hUc : {s : ℂ | 1 ≤ s.re} ⊆ U) (hΨan : AnalyticOnNhd ℂ Ψ U)
    (hΨzero : Ψ 1 = 0) (hΨsimple : deriv Ψ 1 ≠ 0)
    (hΨdecay : ∀ A B : ℝ, 1 ≤ A → ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ,
      A ≤ s.re → s.re ≤ B → 1 ≤ |s.im| →
        ‖(M : ℂ) ^ s * Complex.Gamma s ^ 2 * Ψ s‖ ≤ C / |s.im| ^ r) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type) [Field K] [NumberField K],
      Module.finrank ℚ K = 2 → NumberField.discr K < -4 →
      ∀ (G F : ℂ → ℂ) (b : ℕ → ℂ) (ν : ℕ → ℝ) (Gp : ℕ → ℂ → ℂ) (α β α' β' : ℕ → ℂ),
      (∀ n, 0 ≤ ν n) →
      (∀ s : ℂ, 1 < s.re → LSeries (fun n ↦ (ν n : ℂ)) s =
        NumberField.dedekindZeta K s / riemannZeta (2 * s)) →
      (∀ s : ℂ, 3 / 2 < s.re → G s = LSeries b s) →
      (∀ n : ℕ, 0 < n → ‖b n‖ ≤ Real.sqrt n * ∑ q ∈ n.divisors, ν q * ν (n / q)) →
      (∀ p : ℕ, p.Prime → ‖α p‖ ≤ Real.sqrt p ∧ ‖β p‖ ≤ Real.sqrt p ∧
        ‖α' p‖ ≤ Real.sqrt p ∧ ‖β' p‖ ≤ Real.sqrt p) →
      (∀ p : ℕ, p.Prime → ∀ s : ℂ, Gp p s =
        ((1 + α p * (p : ℂ) ^ (-s)) * (1 + β p * (p : ℂ) ^ (-s))) /
          ((1 + α' p * (p : ℂ) ^ (-s)) * (1 + β' p * (p : ℂ) ^ (-s)))) →
      (∀ s : ℂ, 3 / 2 < s.re → Tendsto
        (fun B : ℕ ↦ ∏ p ∈ (Finset.range B).filter Nat.Prime, Gp p s) atTop (𝓝 (G s))) →
      Differentiable ℂ F →
      (∀ s : ℂ, 3 / 2 < s.re →
        F s = goldfeldCompletion (NumberField.discr K).natAbs M Ψ G s) →
      (∀ s, F s = F (2 - s)) →
      (∀ j : ℕ, j < 3 → iteratedDeriv j F 1 = 0) →
      (∀ A B : ℝ, ∀ r : ℕ, ∃ T : ℝ, 0 < T ∧ ∀ s : ℂ, A ≤ s.re → s.re ≤ B → 1 ≤ |s.im| →
        ‖F s‖ ≤ T / |s.im| ^ r) →
      min 1 (∏ p ∈ (NumberField.discr K).natAbs.primeFactors.erase
          ((NumberField.discr K).natAbs.primeFactors.sup id),
          ‖Gp p 1‖ / (1 + 1 / (p : ℝ))) * Real.log (NumberField.discr K).natAbs ≤
        C * NumberField.classNumber K := by
  sorry

/-! ## Layer 2: two elliptic curves of rank three -/

/-- §2.1: the Gross–Zagier curve Y² + Y = X³ − X² − 64403X − 6220110,
the −139 twist of the conductor-37 curve y² + y = x³ + x² − 3x + 1. -/
def curve139 : WeierstrassCurve ℚ := ⟨0, -1, 1, -64403, -6220110⟩

/-- §2.2: the Buhler–Gross–Zagier curve y² + y = x³ − 7x + 6. -/
def curve5077 : WeierstrassCurve ℚ := ⟨0, 0, 1, -7, 6⟩

/-- §2.12: Gross–Zagier's example: analytic and arithmetic rank of `curve139` are `3`. -/
theorem rankThree_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) :
    analyticOrderAt L 1 ≠ ⊤ ∧ analyticOrderNatAt L 1 = 3 ∧
      Module.finrank ℤ curve139.toAffine.PointModTorsion = 3 := by
  sorry

/-- §2.13: Buhler–Gross–Zagier's example: analytic and arithmetic rank of `curve5077` are `3`. -/
theorem rankThree_5077 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) :
    analyticOrderAt L 1 ≠ ⊤ ∧ analyticOrderNatAt L 1 = 3 ∧
      Module.finrank ℤ curve5077.toAffine.PointModTorsion = 3 := by
  sorry

/-! ## Layer 3: uniform logarithmic class-number bounds -/

/-- §3.6: Oesterlé's universal bound `θ(d) log d ≤ 7000 h`. -/
theorem global_7000 (K : Type) [Field K] [NumberField K]
    (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) :
    ramifiedWeight (NumberField.discr K).natAbs * Real.log (NumberField.discr K).natAbs ≤
      7000 * NumberField.classNumber K := by
  sorry

/-- §3.7: the bound `θ(d) log d ≤ 55 h` for discriminants prime to `5077`. -/
theorem coprime_55 (K : Type) [Field K] [NumberField K]
    (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)
    (hcop : (NumberField.discr K).natAbs.Coprime 5077) :
    ramifiedWeight (NumberField.discr K).natAbs * Real.log (NumberField.discr K).natAbs ≤
      55 * NumberField.classNumber K := by
  sorry

/-! ## Layer 4: explicit constants and effective finiteness -/

/-- §4.6: the explicit rational constant κ(q), positive for every rational q > 0. -/
def effectiveKappa (q : ℚ) : ℚ :=
  if q ≤ 0 then 0 else if 1 ≤ q then 1 / 2
  else 1 / (2 : ℚ) ^ (46 + (Int.ceil (256 * (1 - q) / q)).toNat)

/-- §4.7: the effective logarithmic class-number theorem with the rational witness `κ(q)`,
valid for every real exponent loss `ε ≥ q`. -/
theorem effectiveLogarithmic_bound (K : Type) [Field K] [NumberField K]
    (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)
    (q : ℚ) (hq : 0 < q) (ε : ℝ) (hqε : (q : ℝ) ≤ ε) :
    (effectiveKappa q : ℝ) * Real.log (NumberField.discr K).natAbs ^ (1 - ε) <
      NumberField.classNumber K := by
  sorry

/-- §4.8: a computable cutoff for a fixed class number. -/
theorem effective_cutoff (K : Type) [Field K] [NumberField K]
    (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (H : ℕ)
    (hH : NumberField.classNumber K = H) :
    ((NumberField.discr K).natAbs : ℝ) < Real.exp (2 ^ 604 * (H : ℝ) ^ 2) ∧
      (NumberField.discr K).natAbs < 2 ^ (2 ^ 605 * H ^ 2) := by
  sorry

/-! ## Layer 5: the sixteen fields of class number three -/

/-- §5.4: no class number three for `10¹² ≤ d ≤ 10²⁵⁰⁰`. -/
theorem montgomeryWeinberger (K : Type) [Field K] [NumberField K]
    (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)
    (hlo : 10 ^ 12 ≤ (NumberField.discr K).natAbs)
    (hhi : (NumberField.discr K).natAbs ≤ 10 ^ 2500) :
    NumberField.classNumber K ≠ 3 := by
  sorry

/-- §5.8: the sixteen negative fundamental discriminants of class number three. -/
def classThreeDiscriminants : Finset ℤ :=
  {-23, -31, -59, -83, -107, -139, -211, -283, -307, -331, -379, -499, -547, -643, -883, -907}

/-- §5.8: an imaginary quadratic field has class number three exactly when its discriminant is
one of the sixteen. -/
theorem classThree_enumeration (K : Type) [Field K] [NumberField K]
    (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) :
    NumberField.classNumber K = 3 ↔ NumberField.discr K ∈ classThreeDiscriminants := by
  sorry

end

end TauCetiRoadmap.EffectiveClassNumbers
