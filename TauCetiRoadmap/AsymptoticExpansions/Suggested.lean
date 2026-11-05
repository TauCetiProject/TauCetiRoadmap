import Mathlib
import TauCeti.Analysis.Contour.Residue.Basic

/-!
# Asymptotic expansions: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a milestone
nor the roadmap.

The definitions have real bodies. The scale functions are named `phi`, because `φ` is
Mathlib's scoped notation for Euler's totient. Every theorem is stated with `sorry`.
In Tau Ceti the general targets live in the namespace `Asymptotics` (and in Mathlib's
namespaces where they extend Mathlib objects, such as `Complex`); here they are collected in
`TauCetiRoadmap.AsymptoticExpansions`.
-/

noncomputable section

namespace TauCetiRoadmap.AsymptoticExpansions

open Complex Filter Topology Asymptotics Set MeasureTheory Finset PowerSeries
open scoped Real Nat

/-! ## Milestone 1: scales and expansions -/

section Expansions

variable {α 𝕜 E : Type*} [NormedField 𝕜] [NormedAddCommGroup E] [NormedSpace 𝕜 E]

/-- **M1.1** An asymptotic scale (DLMF 2.1.19): each function is `o` of the previous one. -/
def IsAsymptoticScale (l : Filter α) (phi : ℕ → α → 𝕜) : Prop :=
  ∀ n, phi (n + 1) =o[l] phi n

/-- **M1.1** The asymptotic expansion `f ~ ∑ φₙ aₙ` along `l` (DLMF 2.1.13, 2.1.20): for every
`N`, the remainder after `N` terms is `O(φ_N)`. -/
def HasAsymptoticExpansion (l : Filter α) (phi : ℕ → α → 𝕜) (a : ℕ → E) (f : α → E) : Prop :=
  ∀ N, (fun x => f x - ∑ n ∈ range N, phi n x • a n) =O[l] phi N

/-- **M1.1** Uniqueness of the coefficients. -/
theorem HasAsymptoticExpansion.unique {l : Filter α} {phi : ℕ → α → 𝕜} {a b : ℕ → E}
    {f : α → E} (hphi : IsAsymptoticScale l phi) (hne : ∀ n, ∃ᶠ x in l, phi n x ≠ 0)
    (ha : HasAsymptoticExpansion l phi a f) (hb : HasAsymptoticExpansion l phi b f) : a = b :=
  sorry

/-- **M1.1** Sums of expansions. -/
theorem HasAsymptoticExpansion.add {l : Filter α} {phi : ℕ → α → 𝕜} {a b : ℕ → E}
    {f g : α → E} (hf : HasAsymptoticExpansion l phi a f) (hg : HasAsymptoticExpansion l phi b g) :
    HasAsymptoticExpansion l phi (a + b) (f + g) :=
  sorry

/-- **M1.1** The remainder after `N + 1` terms is `o(φ N)`. -/
theorem HasAsymptoticExpansion.isLittleO {l : Filter α} {phi : ℕ → α → 𝕜} {a : ℕ → E}
    {f : α → E} (hphi : IsAsymptoticScale l phi) (hf : HasAsymptoticExpansion l phi a f) (N : ℕ) :
    (fun x => f x - ∑ n ∈ range (N + 1), phi n x • a n) =o[l] phi N :=
  sorry

end Expansions

/-- **M1.3** The Poincaré scale `z⁻ⁿ` at infinity in any set `X ⊆ ℂ`. -/
theorem isAsymptoticScale_inv_pow (X : Set ℂ) :
    IsAsymptoticScale (Bornology.cobounded ℂ ⊓ 𝓟 X) fun (n : ℕ) (z : ℂ) => (z ^ n)⁻¹ :=
  sorry

/-- **M1.3** DLMF 2.1.15: the Poincaré expansion at infinity in `X` is equivalent to the limits
`zⁿ (f z − ∑_{s<n} a_s z⁻ˢ) → a_n`. -/
theorem hasAsymptoticExpansion_inv_pow_iff (X : Set ℂ) (a : ℕ → ℂ) (f : ℂ → ℂ) :
    HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 X) (fun n z => (z ^ n)⁻¹) a f ↔
      ∀ n, Tendsto (fun z => z ^ n * (f z - ∑ s ∈ range n, (z ^ s)⁻¹ * a s))
        (Bornology.cobounded ℂ ⊓ 𝓟 X) (𝓝 (a n)) :=
  sorry

/-- **M1.3** A series in `z⁻¹` convergent for `‖z‖ > R` is the expansion of its sum. -/
theorem hasAsymptoticExpansion_of_hasSum {R : ℝ} {a : ℕ → ℂ} {f : ℂ → ℂ}
    (hf : ∀ z : ℂ, R < ‖z‖ → HasSum (fun s => (z ^ s)⁻¹ * a s) (f z)) :
    HasAsymptoticExpansion (Bornology.cobounded ℂ) (fun n z => (z ^ n)⁻¹) a f :=
  sorry

/-- **M1.4** Products of asymptotic power series in a small variable `w` (DLMF §2.1(iii)). -/
theorem hasAsymptoticExpansion_pow_mul {α : Type*} {l : Filter α} {w : α → ℂ}
    (hw : Tendsto w l (𝓝 0)) {P Q : ℂ⟦X⟧} {f g : α → ℂ}
    (hf : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n P) f)
    (hg : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n Q) g) :
    HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n (P * Q)) (f * g) :=
  sorry

/-- **M1.4** Reciprocals of asymptotic power series with nonzero constant term. -/
theorem hasAsymptoticExpansion_pow_inv {α : Type*} {l : Filter α} {w : α → ℂ}
    (hw : Tendsto w l (𝓝 0)) {P : ℂ⟦X⟧} {f : α → ℂ} (hP : constantCoeff P ≠ 0)
    (hf : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n P) f) :
    HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n P⁻¹) f⁻¹ :=
  sorry

/-- **M1.5** Ritt's theorem (DLMF §2.1(ii)): `O`-bounds differentiate into closed subsectors. -/
theorem isBigO_deriv_of_isBigO_sector {f : ℂ → ℂ} {R θ θ' ν : ℝ} (hθ : θ ≤ π)
    (hθ' : θ' < θ) (hf : DifferentiableOn ℂ f {z | R < ‖z‖ ∧ |arg z| < θ})
    (hO : f =O[Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| < θ}] fun z => ‖z‖ ^ ν) :
    deriv f =O[Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ'}] fun z => ‖z‖ ^ (ν - 1) :=
  sorry

/-- **M1.6** Borel–Ritt (DLMF §2.1(iii)): every coefficient sequence is the Poincaré expansion
of a function holomorphic in a sector of opening less than `2π`. -/
theorem exists_hasAsymptoticExpansion_sector (a : ℕ → ℂ) {θ : ℝ} (hθ : 0 < θ) (hθπ : θ < π) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f {z | 1 < ‖z‖ ∧ |arg z| < θ} ∧
      HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ})
        (fun n z => (z ^ n)⁻¹) a f :=
  sorry

/-! ## Milestone 2: transcendental equations -/

/-- **M2.3** The reversion coefficients of DLMF 2.2.8: `F₀ = f₀` and, for `s ≥ 1`, `s F_s` is
the coefficient of `X^{s+1}` in `(1 + f₀ X + f₁ X² + ⋯)^s`. -/
def reversionCoeff (fc : ℕ → ℝ) (s : ℕ) : ℝ :=
  if s = 0 then fc 0 else (s : ℝ)⁻¹ * coeff (s + 1) ((1 + X * PowerSeries.mk fc) ^ s)

/-- **M2.3** Lagrange's reversion (DLMF 2.2.7–2.2.8). -/
theorem hasAsymptoticExpansion_reversion {f : ℝ → ℝ} {a : ℝ} {fc : ℕ → ℝ}
    (hcont : ContinuousOn f (Ici a)) (hmono : StrictMonoOn f (Ici a))
    (hf : HasAsymptoticExpansion atTop (fun n x => (x ^ n)⁻¹) fc fun x => f x - x)
    {x : ℝ → ℝ} (hx : ∀ y, f a < y → x y ∈ Ioi a ∧ f (x y) = y) :
    HasAsymptoticExpansion atTop (fun n y => (y ^ n)⁻¹) (reversionCoeff fc) fun y => y - x y :=
  sorry

/-! ## Milestones 3–4: Laplace transforms, Watson's lemma -/

/-- **M4.1** The Gamma integral with complex exponential rate. Mathlib's
`Complex.integral_cpow_mul_exp_neg_mul_Ioi` is the case of real rate. -/
theorem integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos {s z : ℂ} (hs : 0 < s.re) (hz : 0 < z.re) :
    ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (s - 1) * cexp (-(z * t)) = Gamma s * z ^ (-s) :=
  sorry

/-- **M4.2** Watson's lemma in the sector `|ph z| ≤ π/2 − δ` (DLMF 2.4.1), for a general
exponent sequence `α` with strictly increasing real parts; DLMF's case is `α s = (s + λ)/μ`. -/
theorem hasAsymptoticExpansion_laplace_sector {q : ℝ → ℂ} {α c : ℕ → ℂ} {σ δ : ℝ}
    (hα0 : 0 < (α 0).re) (hα : StrictMono fun s => (α s).re) (hδ : 0 < δ)
    (hint : IntegrableOn (fun t => Real.exp (-σ * t) • q t) (Ioi 0))
    (hq : ∀ N, (fun t : ℝ => q t - ∑ s ∈ range N, c s * (t : ℂ) ^ (α s - 1))
      =O[𝓝[>] 0] fun t => t ^ ((α N).re - 1)) :
    HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π / 2 - δ})
      (fun s z => z ^ (-α s)) (fun s => Gamma (α s) * c s)
      fun z => ∫ t in Ioi (0 : ℝ), cexp (-(z * t)) * q t :=
  sorry

/-! ## Milestone 5: Laplace's method -/

/-- **M5.1** The power `P^r` of a formal power series whose constant term is `exp ℓ`, with the
constant term's power fixed as `exp (r ℓ)`. -/
def formalCpow (ℓ r : ℂ) (P : ℂ⟦X⟧) : ℂ⟦X⟧ :=
  C (cexp (r * ℓ)) * (PowerSeries.binomialSeries ℂ r).subst (C (cexp (-ℓ)) * P - 1)

/-- **M5.1** The coefficients `b_s` of Laplace's method (DLMF 2.3.15–2.3.18):
`b_s = μ⁻¹ [Xˢ] Q P^{−(λ+s)/μ}`, where `p(t) − p(a) = (t−a)^μ P(t−a)`, `q(t) = (t−a)^{λ−1} Q(t−a)`
and `ℓ` is the chosen logarithm of `p₀`. -/
def laplaceCoeff (μ : ℝ) (lam ℓ : ℂ) (P Q : ℂ⟦X⟧) (s : ℕ) : ℂ :=
  (μ : ℂ)⁻¹ * coeff s (Q * formalCpow ℓ (-(lam + s) / μ) P)

/-- **M5.2** Laplace's method at a minimum at the left endpoint (DLMF 2.3.13–2.3.15). -/
theorem hasAsymptoticExpansion_laplace_method {p : ℝ → ℝ} {q : ℝ → ℂ} {a μ : ℝ} {lam : ℂ}
    {ps : ℕ → ℝ} {qs : ℕ → ℂ} (hμ : 0 < μ) (hlam : 0 < lam.re) (hp0 : 0 < ps 0)
    (hp : ∀ N, (fun t => p t - p a - ∑ s ∈ range N, ps s * (t - a) ^ ((s : ℝ) + μ))
      =O[𝓝[>] a] fun t => (t - a) ^ ((N : ℝ) + μ))
    (hp' : ∀ N, (fun t => deriv p t - ∑ s ∈ range N, ps s * ((s : ℝ) + μ) *
      (t - a) ^ ((s : ℝ) + μ - 1)) =O[𝓝[>] a] fun t => (t - a) ^ ((N : ℝ) + μ - 1))
    (hq : ∀ N, (fun t => q t - ∑ s ∈ range N, qs s * ((t - a : ℝ) : ℂ) ^ ((s : ℂ) + lam - 1))
      =O[𝓝[>] a] fun t => (t - a) ^ ((N : ℝ) + lam.re - 1))
    (hpm : Measurable p)
    (hcont : ∃ ε > 0, ContinuousOn (deriv p) (Ioo a (a + ε)) ∧ ContinuousOn q (Ioo a (a + ε)))
    (hmin : ∀ c > a, ∃ η > 0, ∀ t ≥ c, p a + η ≤ p t)
    (hconv : ∃ x₀ : ℝ, IntegrableOn (fun t => Real.exp (-(x₀ * p t)) • q t) (Ioi a)) :
    HasAsymptoticExpansion atTop (fun s (x : ℝ) => (x : ℂ) ^ (-(((s : ℂ) + lam) / μ)))
      (fun s => Gamma (((s : ℂ) + lam) / μ) *
        laplaceCoeff μ lam (Real.log (ps 0)) (PowerSeries.mk fun s => (ps s : ℂ))
          (PowerSeries.mk qs) s)
      fun x : ℝ => cexp (x * p a) * ∫ t in Ioi a, cexp (-(x * p t)) * q t :=
  sorry

/-! ## Milestone 7: coalescing critical points -/

/-- **M7.2** The functions `F_s` of DLMF 2.3.33. -/
def bleisteinF (lam : ℝ) (s : ℕ) (y : ℝ) : ℝ :=
  ∫ τ in Ioi (0 : ℝ), Real.exp (-τ ^ 2 / 2 + y * τ) * (τ - y) ^ s * τ ^ (lam - 1)

/-- **M7.2** The comparison functions `G_N` of the Bleistein remainder bound. -/
def bleisteinG (lam : ℝ) (N : ℕ) (y : ℝ) : ℝ :=
  ∫ τ in Ioi (0 : ℝ), Real.exp (-τ ^ 2 / 2 + y * τ) * |τ - y| ^ N * τ ^ (lam - 1)

/-- **M7.2** The uniform remainder bound behind DLMF 2.3.32 (`κ = ∞`). The constant `C` and
the data `a`, `φ` may depend on the parameter `α`; the bound is uniform in whatever `C` is. -/
theorem norm_bleistein_remainder_le {lam a C x : ℝ} {N : ℕ} {f : ℝ → ℂ} {phi : ℕ → ℂ}
    (hlam : 0 < lam) (hx : 0 < x) (hfm : AEStronglyMeasurable f (volume.restrict (Ioi 0)))
    (hf : ∀ w > 0, ‖f w - ∑ s ∈ range N, phi s * ((w - a) ^ s : ℝ)‖ ≤ C * |w - a| ^ N) :
    ‖(∫ w in Ioi (0 : ℝ), (Real.exp (-x * (w ^ 2 / 2 - a * w)) * w ^ (lam - 1) : ℝ) * f w) -
        (x ^ (-lam / 2) : ℝ) * ∑ s ∈ range N,
          phi s * (bleisteinF lam s (a * Real.sqrt x) * x ^ (-(s : ℝ) / 2) : ℝ)‖ ≤
      C * x ^ (-((N : ℝ) + lam) / 2) * bleisteinG lam N (a * Real.sqrt x) :=
  sorry

/-- **M7.3** The Chester–Friedman–Ursell cubic normal form (DLMF 2.4.18), in the normalization
`p = w³/3 − ζ(α) w + η(α)`. -/
theorem exists_cubic_normal_form {p : ℂ × ℂ → ℂ} {U : Set (ℂ × ℂ)} {α₀ t₀ : ℂ}
    (hU : U ∈ 𝓝 (α₀, t₀)) (hp : DifferentiableOn ℂ p U)
    (h₁ : deriv (fun t => p (α₀, t)) t₀ = 0)
    (h₂ : deriv (deriv fun t => p (α₀, t)) t₀ = 0)
    (h₃ : deriv (deriv (deriv fun t => p (α₀, t))) t₀ ≠ 0)
    (hmix : deriv (fun α => deriv (fun t => p (α, t)) t₀) α₀ ≠ 0) :
    ∃ ζ η : ℂ → ℂ, ∃ w : ℂ × ℂ → ℂ, ζ α₀ = 0 ∧ w (α₀, t₀) = 0 ∧
      (∀ᶠ α in 𝓝 α₀, DifferentiableAt ℂ ζ α ∧ DifferentiableAt ℂ η α) ∧
      deriv (fun t => w (α₀, t)) t₀ ≠ 0 ∧
      ∀ᶠ q in 𝓝 (α₀, t₀), DifferentiableAt ℂ w q ∧ p q = w q ^ 3 / 3 - ζ q.1 * w q + η q.1 :=
  sorry

/-! ## Milestones 8–9: Mellin transforms and the distributional method -/

/-- **M8.3** The Mellin transform continued to the left through an expansion
`f(t) ~ ∑ a_k t^{α_k}` at `0+` (DLMF 2.5.25–2.5.26), using `n` terms; valid for
`−Re α_n < Re z` away from the points `−α_k`, and where the integral over `(1, ∞)` converges. -/
def mellinContAtZero (f : ℝ → ℂ) (a α : ℕ → ℂ) (n : ℕ) (z : ℂ) : ℂ :=
  (∫ t in Ioc (0 : ℝ) 1, (t : ℂ) ^ (z - 1) * (f t - ∑ k ∈ range n, a k * (t : ℂ) ^ α k)) +
    ∑ k ∈ range n, a k / (z + α k) + ∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * f t

/-- **M8.3** The Mellin transform continued to the right through an expansion
`f(t) ~ ∑ b_k t^{−β_k}` at `+∞` (DLMF 2.5.27–2.5.28), using `n` terms; valid for
`Re z < Re β_n` away from the points `β_k`, and where the integral over `(0, 1]` converges. -/
def mellinContAtTop (f : ℝ → ℂ) (b β : ℕ → ℂ) (n : ℕ) (z : ℂ) : ℂ :=
  (∫ t in Ioc (0 : ℝ) 1, (t : ℂ) ^ (z - 1) * f t) +
    (∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * (f t - ∑ k ∈ range n, b k * (t : ℂ) ^ (-β k))) -
    ∑ k ∈ range n, b k / (z - β k)

/-- **M9.2** The exact Stieltjes-transform identity (DLMF 2.6.27, 2.6.30) for `0 < α < 1`,
with `(s − 1)! c_s = (−1)ˢ Mf(s)` (DLMF 2.6.18). -/
theorem stieltjes_eq {f : ℝ → ℂ} {a : ℕ → ℂ} {α : ℝ} {n : ℕ} {z : ℂ} (hα : 0 < α)
    (hα1 : α < 1) (hz : z ∈ slitPlane)
    (hf : ∀ R > 0, IntegrableOn f (Icc 0 R))
    (hexp : ∀ m, (fun t : ℝ => f t - ∑ s ∈ range m, a s * (t : ℂ) ^ (-((s : ℂ) + α)))
      =O[atTop] fun t => t ^ (-((m : ℝ) + α))) :
    ∫ t in Ioi (0 : ℝ), f t / (t + z) =
      (π / Real.sin (π * α) : ℝ) * ∑ s ∈ range n, (-1) ^ s * a s * z ^ (-((s : ℂ) + α)) -
        ∑ s ∈ Icc 1 n, (-1) ^ s *
          mellinContAtTop f a (fun k => (k : ℂ) + α) n s * (z ^ s)⁻¹ +
        (-1) ^ n * (z ^ n)⁻¹ * ∫ τ in Ioi (0 : ℝ), (τ : ℂ) ^ n *
          (f τ - ∑ s ∈ range n, a s * (τ : ℂ) ^ (-((s : ℂ) + α))) / (τ + z) :=
  sorry

/-! ## Milestone 10: linear differential equations in the complex domain -/

/-- **M10.2** The Frobenius solution at a regular singularity (DLMF 2.7.2–2.7.5), for an
exponent `ρ` such that no `ρ + s`, `s ≥ 1`, is a root of the indicial polynomial. -/
theorem frobenius_solution {z₀ ρ : ℂ} {r : ℝ} {f g w : ℂ → ℂ} {fs gs a : ℕ → ℂ}
    (hf : ∀ z, 0 < ‖z - z₀‖ → ‖z - z₀‖ < r →
      HasSum (fun s => fs s * (z - z₀) ^ s) ((z - z₀) * f z))
    (hg : ∀ z, 0 < ‖z - z₀‖ → ‖z - z₀‖ < r →
      HasSum (fun s => gs s * (z - z₀) ^ s) ((z - z₀) ^ 2 * g z))
    (hρ : ρ * (ρ - 1) + fs 0 * ρ + gs 0 = 0)
    (hres : ∀ s : ℕ, 1 ≤ s → (ρ + s) * (ρ + s - 1) + fs 0 * (ρ + s) + gs 0 ≠ 0)
    (ha0 : a 0 = 1)
    (ha : ∀ s : ℕ, 1 ≤ s → ((ρ + s) * (ρ + s - 1) + fs 0 * (ρ + s) + gs 0) * a s =
      -∑ r ∈ range s, ((ρ + r) * fs (s - r) + gs (s - r)) * a r)
    (hw : w = fun z => (z - z₀) ^ ρ * ∑' s, a s * (z - z₀) ^ s) :
    (∀ z, ‖z - z₀‖ < r → Summable fun s => a s * (z - z₀) ^ s) ∧
      DifferentiableOn ℂ w {z | z - z₀ ∈ slitPlane ∧ ‖z - z₀‖ < r} ∧
      ∀ z, z - z₀ ∈ slitPlane → ‖z - z₀‖ < r →
        deriv (deriv w) z + f z * deriv w z + g z * w z = 0 :=
  sorry

/-! ## Milestone 11: Liouville–Green approximation -/

/-- **M11.1** The Liouville–Green theorem (DLMF 2.7.20–2.7.25) for the solution recessive at
`a₂ = +∞`, with the error-control integral `V x = ∫ₓ^∞ |f^{−1/4} (f^{−1/4})″ − g f^{−1/2}|`. -/
theorem liouvilleGreen_recessive {f g : ℝ → ℝ} {a c : ℝ} (hc : a < c)
    (hf : ContDiffOn ℝ 2 f (Ioi a)) (hfpos : ∀ x ∈ Ioi a, 0 < f x)
    (hg : ContinuousOn g (Ioi a))
    (hV : ∀ x ∈ Ioi a, IntegrableOn (fun t => |f t ^ (-(1 / 4 : ℝ)) *
      iteratedDeriv 2 (fun s => f s ^ (-(1 / 4 : ℝ))) t - g t / Real.sqrt (f t)|) (Ici x)) :
    ∃ w ε : ℝ → ℝ, ContDiffOn ℝ 2 w (Ioi a) ∧
      (∀ x ∈ Ioi a, iteratedDeriv 2 w x = (f x + g x) * w x) ∧
      ∀ x ∈ Ioi a,
        w x = f x ^ (-(1 / 4 : ℝ)) * Real.exp (-∫ t in c..x, Real.sqrt (f t)) * (1 + ε x) ∧
        |ε x| ≤ Real.exp ((∫ t in Ici x, |f t ^ (-(1 / 4 : ℝ)) *
          iteratedDeriv 2 (fun s => f s ^ (-(1 / 4 : ℝ))) t - g t / Real.sqrt (f t)|) / 2) - 1 ∧
        |deriv ε x| / (2 * Real.sqrt (f x)) ≤ Real.exp ((∫ t in Ici x,
          |f t ^ (-(1 / 4 : ℝ)) * iteratedDeriv 2 (fun s => f s ^ (-(1 / 4 : ℝ))) t -
            g t / Real.sqrt (f t)|) / 2) - 1 :=
  sorry

/-! ## Milestone 13: sums and sequences -/

/-- **M13.1** The Euler–Maclaurin formula (DLMF 2.10.1), with the periodic Bernoulli function
`B̃ₖ(x) = Bₖ(x − ⌊x⌋)`. -/
theorem sum_Icc_eq_eulerMaclaurin {f : ℝ → ℝ} {a n : ℤ} {m : ℕ} (hm : 0 < m) (han : a < n)
    (hf : ContDiffOn ℝ (2 * m) f (Icc (a : ℝ) n)) :
    ∑ j ∈ Finset.Icc a n, f j =
      (∫ x in (a : ℝ)..n, f x) + f a / 2 + f n / 2 +
        ∑ s ∈ Finset.Ico 1 m, (bernoulli (2 * s) : ℝ) / (2 * s)! *
          (iteratedDerivWithin (2 * s - 1) f (Icc (a : ℝ) n) n -
            iteratedDerivWithin (2 * s - 1) f (Icc (a : ℝ) n) a) +
        ∫ x in (a : ℝ)..n, ((bernoulli (2 * m) : ℝ) - bernoulliFun (2 * m) (Int.fract x)) /
          (2 * m)! * iteratedDerivWithin (2 * m) f (Icc (a : ℝ) n) x :=
  sorry

/-- **M13.3** DLMF 2.10.4–2.10.6: the constant in the expansion of `∑ j log j` is
`1/12 − ζ′(−1)`. -/
theorem tendsto_sum_mul_log_sub :
    Tendsto (fun n : ℕ => ∑ j ∈ Finset.Icc 1 n, (j : ℝ) * Real.log j -
        ((n : ℝ) ^ 2 / 2 * Real.log n - (n : ℝ) ^ 2 / 4 + n / 2 * Real.log n +
          Real.log n / 12))
      atTop (𝓝 (1 / 12 - (deriv riemannZeta (-1)).re)) :=
  sorry

/-- **M13.6** The Laurent coefficient `f_n = (2πi)⁻¹ ∮_{|z|=ρ} f(z) z^{−n−1} dz` (DLMF 2.10.26). -/
def laurentCoeff (f : ℂ → ℂ) (ρ : ℝ) (n : ℤ) : ℂ :=
  (2 * π * I)⁻¹ * ∮ z in C(0, ρ), z ^ (-(n + 1)) * f z

/-- **M13.6** Darboux's method (DLMF 2.10.27–2.10.29): `f_n = g_n + o(r^{−n})` as `n → ±∞`. -/
theorem tendsto_laurentCoeff_sub {f g h : ℂ → ℂ} {r ρ : ℝ} (hρ : 0 < ρ) (hρr : ρ < r)
    (hf : DifferentiableOn ℂ f {z | 0 < ‖z‖ ∧ ‖z‖ < r})
    (hg : DifferentiableOn ℂ g {z | 0 < ‖z‖ ∧ ‖z‖ < r})
    (hh : ContinuousOn h {z | 0 < ‖z‖ ∧ ‖z‖ ≤ r})
    (hfg : ∀ z, 0 < ‖z‖ → ‖z‖ < r → h z = f z - g z) :
    Tendsto (fun n : ℤ => (r : ℂ) ^ n * (laurentCoeff f ρ n - laurentCoeff g ρ n)) cofinite
      (𝓝 0) :=
  sorry

end TauCetiRoadmap.AsymptoticExpansions
