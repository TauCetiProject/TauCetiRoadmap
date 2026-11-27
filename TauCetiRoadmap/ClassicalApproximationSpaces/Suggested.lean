/-
Copyright (c) 2026 Mario Ullrich. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.MeasureTheory.Integral.MaximalFunction
public import TauCetiRoadmap.ApproximationSpaces.Suggested

/-!
# Moduli of smoothness, classical approximation and Besov spaces: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`, the definitive
specification; this file states some of the roadmap's targets against the pinned Mathlib and Tau
Ceti, each with `sorry`, together with the definitions they need. Every other target, API fact and
check is in the README.

The approximation schemes, the schemes of functions with their errors `lpError` and Besov
quasi-norms `besovENorm`, and the quasi-norms of `L_p` are those of ApproximationSpaces, imported
above (README, Convention 2). The trigonometric scheme is a scheme of functions in that sense.

The pinned Tau Ceti has no Littlewood–Paley blocks and no Besov spaces, so Part B writes the
blocks through Mathlib's `TemperedDistribution.fourierMultiplierCLM` with the symbols `ψ₀ = φ`,
`ψⱼ = φ(2⁻ʲ ·) - φ(2¹⁻ʲ ·)`. These are the blocks of Tau Ceti's
`TemperedDistribution.littlewoodPaleyBlock`, and for `1 ≤ p, q` the finiteness of `besovENorm` is
Tau Ceti's `TemperedDistribution.MemBesov` (README, Conventions 5 and 6, CA-B05).

## Targets stated below

* Part A: the modulus of smoothness and its `ρ`-subadditivity (CA-A02, CA-A03), Marchaud's
  inequality (CA-A05), the modulus on an interval and Whitney's inequality (CA-A08, CA-A09);
* Part B: the Besov formula for every exponent and its independence of the bump (CA-B05),
  Peetre's maximal function (CA-B03);
* Part C: the trigonometric polynomials and the trigonometric scheme (CA-C01), Jackson's theorem
  (CA-C04), the description by moduli (CA-C06) and Nikolskii's inequality (CA-C10).

## Headline theorems not stated here

A definition in this file carries real proofs, and the remaining headline theorems of the Summary
rest on carriers whose definitions need proofs of their own, so the README alone states them: the
band-limited scheme in `L_p(E)` for the description on `E` (CA-D01–CA-D05; closure under addition
uses the Fourier support of `L_p` functions); the periodic formula (CA-B07) and the realisation of
CA-B09 for the identification with the Littlewood–Paley spaces for `s > σ_p` (CA-C06, CA-D05); a
quasi-normed couple of two `besovENorm`s on `𝓢'(E, F)` for their interpolation (CA-B08; the
quasi-triangle inequality of `besovENorm` is a theorem); the dyadic spline and step schemes and
the Haar functions on the cube (CA-E04–CA-E06, CA-E11, CA-E13; Tau Ceti's Haar basis is newer than
the pin).
-/

@[expose] public section

noncomputable section

open scoped ENNReal NNReal SchwartzMap
open MeasureTheory Filter Topology
open TauCetiRoadmap.ApproximationSpaces

namespace TauCetiRoadmap.ClassicalApproximationSpaces

/-! ## Part A: moduli of smoothness -/

/-- The modulus of smoothness `ω_r(f, t)_p = sup_{‖h‖ ≤ t} ‖Δ_h^r f‖_p` on a normed group with a
measure (`E` or `𝕋^d`).

Roadmap: `CA-A02`. -/
def modulusOfSmoothness {G : Type*} [NormedAddCommGroup G] [MeasurableSpace G] (μ : Measure G)
    (p : ℝ≥0∞) (r : ℕ) (f : G → ℂ) (t : ℝ) : ℝ≥0∞ :=
  ⨆ (h : G) (_ : ‖h‖ ≤ t),
    eLpNorm (fun x => ∑ k ∈ Finset.range (r + 1),
      ((-1 : ℂ) ^ (r - k) * (r.choose k : ℂ)) * f (x + k • h)) p μ

/-- The `ρ`-th power of the modulus of smoothness is subadditive, `ρ = min 1 p`.

Roadmap: `CA-A03`. -/
theorem modulusOfSmoothness_add_rpow_min_le {G : Type*} [NormedAddCommGroup G]
    [MeasurableSpace G] (μ : Measure G) (p : ℝ≥0∞) (r : ℕ) (f g : G → ℂ) (t : ℝ) :
    modulusOfSmoothness μ p r (f + g) t ^ (min 1 p).toReal ≤
      modulusOfSmoothness μ p r f t ^ (min 1 p).toReal +
        modulusOfSmoothness μ p r g t ^ (min 1 p).toReal := by
  sorry

/-- **Marchaud's inequality** on `E`, for every `0 < p ≤ ∞`, with `ρ = min 1 p`.

Roadmap: `CA-A05`. -/
theorem modulusOfSmoothness_le_marchaud {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {p : ℝ≥0∞} (hp : 0 < p) {k r : ℕ} (hk : 1 ≤ k) (hkr : k < r) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ (f : E → ℂ), MemLp f p volume → ∀ t : ℝ, 0 < t →
      modulusOfSmoothness volume p k f t ≤
        C * ENNReal.ofReal t ^ (k : ℝ) *
          (∫⁻ u in Set.Ioi t, (ENNReal.ofReal u ^ (-(k : ℝ)) *
            modulusOfSmoothness volume p r f u) ^ (min 1 p).toReal *
              ENNReal.ofReal u⁻¹) ^ (1 / (min 1 p).toReal) := by
  sorry

/-- The modulus of smoothness on an interval `[a, b]`,
`ω_r(f, t)_{p,[a,b]} = sup_{0 < h ≤ t} ‖Δ_h^r f‖_{L_p[a, b - rh]}`.

Roadmap: `CA-A08`. -/
def intervalModulus (p : ℝ≥0∞) (r : ℕ) (a b : ℝ) (f : ℝ → ℂ) (t : ℝ) : ℝ≥0∞ :=
  ⨆ (h : ℝ) (_ : 0 < h) (_ : h ≤ t),
    eLpNorm (fun x => ∑ k ∈ Finset.range (r + 1),
      ((-1 : ℂ) ^ (r - k) * (r.choose k : ℂ)) * f (x + k * h)) p
      (volume.restrict (Set.Icc a (b - r * h)))

/-- **Whitney's inequality** for every `0 < p ≤ ∞`: a polynomial of degree less than `r`
approximates `f` on `[a, b]` up to `C ω_r(f, (b - a)/r)_{p,[a,b]}`, with `C` depending on `r` and
`p` only (Storozhenko 1977, Theorem 2, for `p < 1`).

Roadmap: `CA-A09`. -/
theorem exists_eLpNorm_sub_polynomial_le (r : ℕ) (hr : 1 ≤ r) {p : ℝ≥0∞} (hp : 0 < p) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ a b : ℝ, a < b → ∀ f : ℝ → ℂ,
      MemLp f p (volume.restrict (Set.Icc a b)) →
      ∃ P : Polynomial ℂ, P.natDegree < r ∧
        eLpNorm (fun x : ℝ => f x - P.eval (x : ℂ)) p (volume.restrict (Set.Icc a b)) ≤
          C * intervalModulus p r a b f ((b - a) / r) := by
  sorry

/-! ## Part B: Littlewood–Paley tools and Besov spaces in the full range -/

section LittlewoodPaley

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]
variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℂ F] [CompleteSpace F]

/-- The symbols of the inhomogeneous Littlewood–Paley partition of a bump `φ`: `ψ₀ = φ` and
`ψⱼ = φ(2⁻ʲ ·) - φ(2¹⁻ʲ ·)` for `j ≥ 1`, Tau Ceti's `ContDiffBump.inhomogeneousLittlewoodPaley`.

Roadmap: Convention 5. -/
def lpSymbol (φ : ContDiffBump (0 : E)) (j : ℕ) (ξ : E) : ℂ :=
  if j = 0 then ((φ ξ : ℝ) : ℂ)
  else ((φ ((2 : ℝ) ^ (-(j : ℤ)) • ξ) - φ ((2 : ℝ) ^ (1 - (j : ℤ)) • ξ) : ℝ) : ℂ)

/-- The `L_p` quasi-norm of the `j`-th Littlewood–Paley block of `u`, for every `0 < p ≤ ∞`: the
block is the distribution of a function `g` of temperate growth, and the value is `‖g‖_p`
(`∞` when `g ∉ L_p`).

Roadmap: `CA-B05`. -/
def blockENorm (φ : ContDiffBump (0 : E)) (p : ℝ≥0∞) (j : ℕ) (u : 𝓢'(E, F)) : ℝ≥0∞ :=
  ⨅ (g : E → F) (hg : g.HasTemperateGrowth)
    (_ : TemperedDistribution.fourierMultiplierCLM F (lpSymbol φ j) u =
      Function.HasTemperateGrowth.toTemperedDistribution volume hg),
    eLpNorm g p volume

/-- The Besov quasi-norm `‖(2^{js} ‖Δ_j u‖_p)_j‖_{ℓ_q}` for every `0 < p, q ≤ ∞`.

Roadmap: `CA-B05`. -/
def besovENorm (φ : ContDiffBump (0 : E)) (s : ℝ) (p q : ℝ≥0∞) (u : 𝓢'(E, F)) : ℝ≥0∞ :=
  eLpNorm (fun j : ℕ => (2 : ℝ≥0∞) ^ (s * j) * blockENorm φ p j u) q Measure.count

/-- Two bump functions give equivalent Besov quasi-norms, for every `0 < p, q ≤ ∞`.

Roadmap: `CA-B05`. -/
theorem exists_besovENorm_le_of_bump (φ φ' : ContDiffBump (0 : E)) (s : ℝ) {p q : ℝ≥0∞}
    (hp : 0 < p) (hq : 0 < q) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ u : 𝓢'(E, F), besovENorm φ' s p q u ≤ C * besovENorm φ s p q u := by
  sorry

/-- Peetre's maximal function `g*_{R,a}(x) = sup_y |g(x - y)| / (1 + R |y|)^a`.

Roadmap: `CA-B03`. -/
def peetreMaximal (R a : ℝ) (g : E → F) (x : E) : ℝ≥0∞ :=
  ⨆ y : E, ‖g (x - y)‖ₑ / ENNReal.ofReal ((1 + R * ‖y‖) ^ a)

/-- **Peetre's inequality** for the blocks: for `0 < r < ∞` and `a > d/r`, the Peetre maximal
function of the `j`-th block at the scale `2^j` is bounded by `C (M |g|^r)^{1/r}`, with `C`
independent of `j` and `u`.

Roadmap: `CA-B03`. -/
theorem exists_peetreMaximal_le_maximalFunction (φ : ContDiffBump (0 : E)) {r a : ℝ}
    (hr : 0 < r) (ha : (Module.finrank ℝ E : ℝ) / r < a) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ (j : ℕ) (u : 𝓢'(E, F)) (g : E → F) (hg : g.HasTemperateGrowth),
      TemperedDistribution.fourierMultiplierCLM F (lpSymbol φ j) u =
          Function.HasTemperateGrowth.toTemperedDistribution volume hg →
        ∀ x, peetreMaximal ((2 : ℝ) ^ j) a g x ≤
          C * TauCeti.maximalFunction volume (fun y => ‖g y‖ₑ ^ r) x ^ (1 / r) := by
  sorry

end LittlewoodPaley

/-! ## Part C: trigonometric approximation on the torus -/

/-- The trigonometric polynomials of coordinate degree `< n` on `𝕋^d`.

Roadmap: `CA-C01`. -/
def torusTrigPoly (d n : ℕ) : Submodule ℂ (UnitAddTorus (Fin d) → ℂ) :=
  Submodule.span ℂ
    (Set.range fun k : {k : Fin d → ℤ // ∀ i, |k i| < n} => ⇑(UnitAddTorus.mFourier k.1))

/-- The trigonometric polynomials increase with the degree.

Roadmap: `CA-C01`. -/
theorem torusTrigPoly_mono (d : ℕ) {m n : ℕ} (hmn : m ≤ n) :
    torusTrigPoly d m ≤ torusTrigPoly d n := by
  refine Submodule.span_mono ?_
  rintro _ ⟨k, rfl⟩
  exact ⟨⟨k.1, fun i => (k.2 i).trans_le (by exact_mod_cast hmn)⟩, rfl⟩

/-- The trigonometric scheme, a scheme of functions in `L_∞(𝕋^d)` in the sense of
ApproximationSpaces: `T_0 = {0}` and, for `n ≥ 1`, the classes of the trigonometric polynomials of
coordinate degree `< n`.

Roadmap: `CA-C01`. -/
def torusTrigScheme (d : ℕ) : FunctionScheme (volume : Measure (UnitAddTorus (Fin d))) where
  A n := if n = 0 then {0} else {a | ∃ T ∈ torusTrigPoly d n, ⇑a =ᵐ[volume] T}
  A_zero := ite_eq_left rfl
  mono n a ha := by
    rw [ite_eq_right n.succ_ne_zero]
    split_ifs at ha with hn
    · rw [Set.mem_singleton_iff.1 ha]
      exact ⟨0, zero_mem _, Lp.coeFn_zero ℂ ∞ volume⟩
    · obtain ⟨T, hT, haT⟩ := ha
      exact ⟨T, torusTrigPoly_mono d n.le_succ hT, haT⟩
  smul_mem c n a ha := by
    split_ifs at ha ⊢ with hn
    · rw [Set.mem_singleton_iff.1 ha, smul_zero]
      exact Set.mem_singleton _
    · obtain ⟨T, hT, haT⟩ := ha
      exact ⟨c • T, Submodule.smul_mem _ c hT, (Lp.coeFn_smul c a).trans (haT.const_smul c)⟩
  add_mem m n a b ha hb := by
    rcases eq_or_ne m 0 with rfl | hm
    · rw [ite_eq_left rfl, Set.mem_singleton_iff] at ha
      rwa [ha, zero_add, zero_add]
    rcases eq_or_ne n 0 with rfl | hn
    · rw [ite_eq_left rfl, Set.mem_singleton_iff] at hb
      rwa [hb, add_zero, add_zero]
    rw [ite_eq_right hm] at ha
    rw [ite_eq_right hn] at hb
    rw [ite_eq_right (by omega)]
    obtain ⟨T, hT, haT⟩ := ha
    obtain ⟨T', hT', hbT'⟩ := hb
    exact ⟨T + T', add_mem (torusTrigPoly_mono d (by omega) hT)
      (torusTrigPoly_mono d (by omega) hT'), (Lp.coeFn_add a b).trans (haT.add hbT')⟩
  finite _ a _ := Lp.eLpNorm_lt_top a

/-- **Jackson's theorem** on `𝕋^d` for every order `r` and every `0 < p ≤ ∞`
(Storozhenko–Oswald 1978, Theorem 3, for `0 < p < 1`).

Roadmap: `CA-C04`. -/
theorem exists_lpError_torusTrigScheme_le (d r : ℕ) (hr : 1 ≤ r) {p : ℝ≥0∞} (hp : 0 < p) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ (f : UnitAddTorus (Fin d) → ℂ), MemLp f p volume →
      ∀ n : ℕ, 1 ≤ n →
        (torusTrigScheme d).lpError p n f ≤ C * modulusOfSmoothness volume p r f (1 / n) := by
  sorry

/-- **The Besov spaces of the torus by moduli**: for `0 < s < r` and every `0 < p, q ≤ ∞`, a
function lies in the approximation space `A^s_q(L_p, T)` of the trigonometric scheme iff
`‖f‖_p + ‖(2^{ks} ω_r(f, 2^{-k})_p)_k‖_{ℓ_q} < ∞`.

Roadmap: `CA-C06`. -/
theorem besovENorm_torusTrigScheme_lt_top_iff_modulus (d r : ℕ) (hr : 1 ≤ r) {p : ℝ≥0∞}
    (hp : 0 < p) {s : ℝ} (hs : 0 < s) (hsr : s < r) {q : ℝ≥0∞} (hq : 0 < q)
    (f : UnitAddTorus (Fin d) → ℂ) (hf : MemLp f p volume) :
    (torusTrigScheme d).besovENorm p s q f < ⊤ ↔
      eLpNorm f p volume + eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) *
        modulusOfSmoothness volume p r f ((2 : ℝ) ^ (-(k : ℤ)))) q Measure.count < ⊤ := by
  sorry

/-- **Nikolskii's inequality** for trigonometric polynomials, every `0 < p ≤ r ≤ ∞`.

Roadmap: `CA-C10`. -/
theorem exists_eLpNorm_le_of_mem_torusTrigPoly (d : ℕ) {p r : ℝ≥0∞} (hp : 0 < p) (hpr : p ≤ r) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ n : ℕ, 1 ≤ n → ∀ T ∈ torusTrigPoly d n,
      eLpNorm T r volume ≤
        C * (n : ℝ≥0∞) ^ ((d : ℝ) * (1 / p.toReal - 1 / r.toReal)) * eLpNorm T p volume := by
  sorry

end TauCetiRoadmap.ClassicalApproximationSpaces
