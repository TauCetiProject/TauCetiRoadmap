module

public import Mathlib
public import TauCeti.Analysis.Contour.Residue.Basic

/-!
# Asymptotic expansions: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for headline targets of the layers, so that contributors
and reviewers converge on names and signatures; discharging all of them finishes neither a layer
nor the roadmap. Stationary phase (6.2) is stated for a finite upper limit `b` with `p(b)`
finite; the case `p(b) = ∞` of the README is not stated here.

The definitions have real bodies. The scale functions are named `phi`, because `φ` is
Mathlib's scoped notation for Euler's totient. Every theorem is stated with `sorry`.
In Tau Ceti the general targets live in the namespace `Asymptotics` (and in Mathlib's
namespaces where they extend Mathlib objects, such as `Complex`); here they are collected in
`TauCetiRoadmap.AsymptoticExpansions`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.AsymptoticExpansions

open Complex Filter Topology Asymptotics Set MeasureTheory Finset PowerSeries
open scoped Real Nat ContDiff

/-! ## Layer 1: scales and expansions -/

section Expansions

variable {α 𝕜 E : Type*} [NormedField 𝕜] [NormedAddCommGroup E] [NormedSpace 𝕜 E]

/-- **1.1** An asymptotic scale (DLMF 2.1.19): each function is `o` of the previous one. -/
def IsAsymptoticScale (l : Filter α) (phi : ℕ → α → 𝕜) : Prop :=
  ∀ n, phi (n + 1) =o[l] phi n

/-- **1.1** The asymptotic expansion `f ~ ∑ φₙ aₙ` along `l` (DLMF 2.1.13, 2.1.20): for every
`N`, the remainder after `N` terms is `O(φ_N)`. -/
def HasAsymptoticExpansion (l : Filter α) (phi : ℕ → α → 𝕜) (a : ℕ → E) (f : α → E) : Prop :=
  ∀ N, (fun x => f x - ∑ n ∈ range N, phi n x • a n) =O[l] phi N

/-- **1.1** Uniqueness of the coefficients. -/
theorem HasAsymptoticExpansion.unique {l : Filter α} {phi : ℕ → α → 𝕜} {a b : ℕ → E}
    {f : α → E} (hphi : IsAsymptoticScale l phi) (hne : ∀ n, ∃ᶠ x in l, phi n x ≠ 0)
    (ha : HasAsymptoticExpansion l phi a f) (hb : HasAsymptoticExpansion l phi b f) : a = b :=
  sorry

end Expansions

/-- **1.3** The Poincaré scale `z⁻ⁿ` at infinity in any set `X ⊆ ℂ`. -/
theorem isAsymptoticScale_inv_pow (X : Set ℂ) :
    IsAsymptoticScale (Bornology.cobounded ℂ ⊓ 𝓟 X) fun (n : ℕ) (z : ℂ) => (z ^ n)⁻¹ :=
  sorry

/-- **1.3** DLMF 2.1.15: the Poincaré expansion at infinity in `X` is equivalent to the limits
`zⁿ (f z − ∑_{s<n} a_s z⁻ˢ) → a_n`. -/
theorem hasAsymptoticExpansion_inv_pow_iff (X : Set ℂ) (a : ℕ → ℂ) (f : ℂ → ℂ) :
    HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 X) (fun n z => (z ^ n)⁻¹) a f ↔
      ∀ n, Tendsto (fun z => z ^ n * (f z - ∑ s ∈ range n, (z ^ s)⁻¹ * a s))
        (Bornology.cobounded ℂ ⊓ 𝓟 X) (𝓝 (a n)) :=
  sorry

/-- **1.3** A series in `z⁻¹` convergent for `‖z‖ > R` is the expansion of its sum. -/
theorem hasAsymptoticExpansion_of_hasSum {R : ℝ} {a : ℕ → ℂ} {f : ℂ → ℂ}
    (hf : ∀ z : ℂ, R < ‖z‖ → HasSum (fun s => (z ^ s)⁻¹ * a s) (f z)) :
    HasAsymptoticExpansion (Bornology.cobounded ℂ) (fun n z => (z ^ n)⁻¹) a f :=
  sorry

/-- **1.4** Products of asymptotic power series in a small variable `w` (DLMF §2.1(iii)). -/
theorem hasAsymptoticExpansion_pow_mul {α : Type*} {l : Filter α} {w : α → ℂ}
    (hw : Tendsto w l (𝓝 0)) {P Q : ℂ⟦X⟧} {f g : α → ℂ}
    (hf : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n P) f)
    (hg : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n Q) g) :
    HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n (P * Q)) (f * g) :=
  sorry

/-- **1.4** Reciprocals of asymptotic power series with nonzero constant term. -/
theorem hasAsymptoticExpansion_pow_inv {α : Type*} {l : Filter α} {w : α → ℂ}
    (hw : Tendsto w l (𝓝 0)) {P : ℂ⟦X⟧} {f : α → ℂ} (hP : constantCoeff P ≠ 0)
    (hf : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n P) f) :
    HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n P⁻¹) f⁻¹ :=
  sorry

/-- **1.4** Composition of asymptotic power series. The inner map `y` carries `l` to `m`;
`H ~ P` in the small variable `σ` along `m`, and `σ ∘ y ~ Q` in `w` along `l`. -/
theorem hasAsymptoticExpansion_pow_subst {α β : Type*} {l : Filter α} {m : Filter β}
    {w : α → ℂ} {σ H : β → ℂ} {y : α → β} {P Q : ℂ⟦X⟧} (hw : Tendsto w l (𝓝 0))
    (hy : Tendsto y l m) (hQ : constantCoeff Q = 0)
    (hH : HasAsymptoticExpansion m (fun n x => σ x ^ n) (fun n => coeff n P) H)
    (hs : HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n Q) fun x => σ (y x)) :
    HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => coeff n (P.subst Q))
      fun x => H (y x) :=
  sorry

/-- **1.4** Inversion of asymptotic power series. `Tendsto y l m` selects the branch of the
inverse; the equation `H (y x) = w x` alone does not. -/
theorem hasAsymptoticExpansion_pow_substInv {α β : Type*} {l : Filter α} {m : Filter β}
    {w : α → ℂ} {σ H : β → ℂ} {y : α → β} {P : ℂ⟦X⟧} (hσ : Tendsto σ m (𝓝 0))
    (hH : HasAsymptoticExpansion m (fun n x => σ x ^ n) (fun n => coeff n P) H)
    (hP0 : constantCoeff P = 0) (hP1 : coeff 1 P ≠ 0) (hy : Tendsto y l m)
    (heq : ∀ᶠ x in l, H (y x) = w x) :
    HasAsymptoticExpansion l (fun n x => w x ^ n)
      (fun n => coeff n (P.substInvOfIsUnit hP1.isUnit)) fun x => σ (y x) :=
  sorry

/-- **1.5** Ritt's theorem (DLMF §2.1(ii)): `O`-bounds differentiate into closed subsectors. -/
theorem isBigO_deriv_of_isBigO_sector {f : ℂ → ℂ} {R θ θ' ν : ℝ} (hθ : θ ≤ π)
    (hθ' : θ' < θ) (hf : DifferentiableOn ℂ f {z | R < ‖z‖ ∧ |arg z| < θ})
    (hO : f =O[Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| < θ}] fun z => ‖z‖ ^ ν) :
    deriv f =O[Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ'}] fun z => ‖z‖ ^ (ν - 1) :=
  sorry

/-- **1.6** Borel–Ritt (DLMF §2.1(iii)): every coefficient sequence is the Poincaré expansion
of a function holomorphic in a sector of opening less than `2π`. -/
theorem exists_hasAsymptoticExpansion_sector (a : ℕ → ℂ) {θ : ℝ} (hθ : 0 < θ) (hθπ : θ < π) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f {z | 1 < ‖z‖ ∧ |arg z| < θ} ∧
      HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ})
        (fun n z => (z ^ n)⁻¹) a f :=
  sorry

/-! ## Layer 2: transcendental equations -/

/-- **2.3** The reversion coefficients of DLMF 2.2.8: `F₀ = f₀` and, for `s ≥ 1`, `s F_s` is
the coefficient of `X^{s+1}` in `(1 + f₀ X + f₁ X² + ⋯)^s`. -/
def reversionCoeff (fc : ℕ → ℝ) (s : ℕ) : ℝ :=
  if s = 0 then fc 0 else (s : ℝ)⁻¹ * coeff (s + 1) ((1 + X * PowerSeries.mk fc) ^ s)

/-- **2.3** Lagrange's reversion (DLMF 2.2.7–2.2.8). -/
theorem hasAsymptoticExpansion_reversion {f : ℝ → ℝ} {a : ℝ} {fc : ℕ → ℝ}
    (hcont : ContinuousOn f (Ici a)) (hmono : StrictMonoOn f (Ici a))
    (hf : HasAsymptoticExpansion atTop (fun n x => (x ^ n)⁻¹) fc fun x => f x - x)
    {x : ℝ → ℝ} (hx : ∀ y, f a < y → x y ∈ Ioi a ∧ f (x y) = y) :
    HasAsymptoticExpansion atTop (fun n y => (y ^ n)⁻¹) (reversionCoeff fc) fun y => y - x y :=
  sorry

/-! ## Layers 3–4: Laplace transforms, Watson's lemma -/

/-- **4.1** The Gamma integral with complex exponential rate. Mathlib's
`Complex.integral_cpow_mul_exp_neg_mul_Ioi` is the case of real rate. -/
theorem integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos {s z : ℂ} (hs : 0 < s.re) (hz : 0 < z.re) :
    ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (s - 1) * cexp (-(z * t)) = Gamma s * z ^ (-s) :=
  sorry

/-- **4.2** Watson's lemma in the sector `|ph z| ≤ π/2 − δ` (DLMF 2.4.1), for a general
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

/-- **4.3** The Laplace integral along the ray `ph t = θ`, as a function of the logarithmic
coordinate `ζ` of `z = exp ζ`. For `θ = 0` it is the Laplace integral at `exp ζ`. -/
def rayLaplace (q : ℂ → ℂ) (θ : ℝ) (ζ : ℂ) : ℂ :=
  cexp (θ * I) * ∫ r in Ioi (0 : ℝ), cexp (-(cexp (ζ + θ * I) * r)) * q (r * cexp (θ * I))

/-- **4.3** The strip `S_θ` of logarithmic coordinates on which `rayLaplace q θ` is used. -/
def rayLaplaceDomain (σ θ : ℝ) : Set ℂ :=
  {ζ | |ζ.im + θ| < π / 2 ∧ σ < (cexp (ζ + θ * I)).re}

/-- **4.3** Holomorphy and gluing of the rotated Laplace integrals (DLMF §2.4(i)). The
agreement is on overlaps of strips in `ζ`; in `z` it fails for rays more than `π` apart. -/
theorem rayLaplace_differentiableOn_and_eqOn {q : ℂ → ℂ} {α₁ α₂ σ θ θ' : ℝ} {α c : ℕ → ℂ}
    (hα₁ : -π < α₁) (hα₁0 : α₁ < 0) (hα₂0 : 0 < α₂) (hα₂ : α₂ < π) (hσ : 0 ≤ σ)
    (hq : DifferentiableOn ℂ q {t | t ≠ 0 ∧ α₁ < arg t ∧ arg t < α₂})
    (hα0 : 0 < (α 0).re) (hα : StrictMono fun s => (α s).re)
    (hexp : ∀ δ > 0, ∀ N, (fun t => q t - ∑ s ∈ range N, c s * t ^ (α s - 1))
      =O[𝓝[{t | t ≠ 0 ∧ α₁ + δ ≤ arg t ∧ arg t ≤ α₂ - δ}] 0] fun t => ‖t‖ ^ ((α N).re - 1))
    (hgrowth : ∀ δ > 0,
      q =O[Bornology.cobounded ℂ ⊓ 𝓟 {t | α₁ + δ ≤ arg t ∧ arg t ≤ α₂ - δ}]
        fun t => Real.exp (σ * ‖t‖))
    (hθ : θ ∈ Ioo α₁ α₂) (hθ' : θ' ∈ Ioo α₁ α₂) :
    DifferentiableOn ℂ (rayLaplace q θ) (rayLaplaceDomain σ θ) ∧
      EqOn (rayLaplace q θ) (rayLaplace q θ') (rayLaplaceDomain σ θ ∩ rayLaplaceDomain σ θ') :=
  sorry

/-- **4.3** Watson's lemma along a rotated ray, in logarithmic coordinates. -/
theorem hasAsymptoticExpansion_rayLaplace {q : ℂ → ℂ} {α₁ α₂ σ θ δ : ℝ} {α c : ℕ → ℂ}
    (hα₁ : -π < α₁) (hα₁0 : α₁ < 0) (hα₂0 : 0 < α₂) (hα₂ : α₂ < π)
    (hq : DifferentiableOn ℂ q {t | t ≠ 0 ∧ α₁ < arg t ∧ arg t < α₂})
    (hα0 : 0 < (α 0).re) (hα : StrictMono fun s => (α s).re)
    (hexp : ∀ δ > 0, ∀ N, (fun t => q t - ∑ s ∈ range N, c s * t ^ (α s - 1))
      =O[𝓝[{t | t ≠ 0 ∧ α₁ + δ ≤ arg t ∧ arg t ≤ α₂ - δ}] 0] fun t => ‖t‖ ^ ((α N).re - 1))
    (hgrowth : ∀ δ > 0,
      q =O[Bornology.cobounded ℂ ⊓ 𝓟 {t | α₁ + δ ≤ arg t ∧ arg t ≤ α₂ - δ}]
        fun t => Real.exp (σ * ‖t‖))
    (hθ : θ ∈ Ioo α₁ α₂) (hδ : 0 < δ) :
    HasAsymptoticExpansion (comap Complex.re atTop ⊓ 𝓟 {ζ | |ζ.im + θ| ≤ π / 2 - δ})
      (fun s ζ => cexp (-(α s * ζ))) (fun s => Gamma (α s) * c s) (rayLaplace q θ) :=
  sorry

/-- **4.4** The inverse Laplace transform of a function with an expansion and differentiated
expansion on `Re z ≥ c` (DLMF 2.4.4–2.4.5): the improper Bromwich integral exists, does not
depend on the line `Re z = σ ≥ c`, and has the expansion of Watson's lemma read backwards. -/
theorem exists_inverseLaplace_hasExpansion {Q : ℂ → ℂ} {c : ℝ} {α a : ℕ → ℂ} (hc : 0 < c)
    (hQ : ∃ U : Set ℂ, IsOpen U ∧ {z | c ≤ z.re} ⊆ U ∧ DifferentiableOn ℂ Q U)
    (hα0 : 0 < (α 0).re) (hα : StrictMono fun s => (α s).re)
    (hexp : HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 {z | c ≤ z.re})
      (fun s z => z ^ (-α s)) (fun s => Gamma (α s) * a s) Q)
    (hexp' : HasAsymptoticExpansion (Bornology.cobounded ℂ ⊓ 𝓟 {z | c ≤ z.re})
      (fun s z => z ^ (-α s - 1)) (fun s => -(α s * Gamma (α s) * a s)) (deriv Q)) :
    ∃ q : ℝ → ℂ,
      (∀ t : ℝ, 0 < t → ∀ σ : ℝ, c ≤ σ → Tendsto (fun η : ℝ => (2 * π * I)⁻¹ *
          ∫ y in -η..η, cexp (t * (σ + y * I)) * Q (σ + y * I) * I) atTop (𝓝 (q t))) ∧
      ∀ N, (fun t : ℝ => q t - ∑ s ∈ range N, a s * (t : ℂ) ^ (α s - 1))
        =O[𝓝[>] 0] fun t => t ^ ((α N).re - 1) :=
  sorry

/-! ## Layer 5: Laplace's method -/

/-- **5.1** The power `P^r` of a formal power series whose constant term is `exp ℓ`, with the
constant term's power fixed as `exp (r ℓ)`. -/
def formalCpow (ℓ r : ℂ) (P : ℂ⟦X⟧) : ℂ⟦X⟧ :=
  C (cexp (r * ℓ)) * (PowerSeries.binomialSeries ℂ r).subst (C (cexp (-ℓ)) * P - 1)

/-- **5.1** The coefficients `b_s` of Laplace's method (DLMF 2.3.15–2.3.18):
`b_s = μ⁻¹ [Xˢ] Q P^{−(λ+s)/μ}`, where `p(t) − p(a) = (t−a)^μ P(t−a)`, `q(t) = (t−a)^{λ−1} Q(t−a)`
and `ℓ` is the chosen logarithm of `p₀`. -/
def laplaceCoeff (μ : ℝ) (lam ℓ : ℂ) (P Q : ℂ⟦X⟧) (s : ℕ) : ℂ :=
  (μ : ℂ)⁻¹ * coeff s (Q * formalCpow ℓ (-(lam + s) / μ) P)

/-- **5.2** Laplace's method at a minimum at the left endpoint (DLMF 2.3.13–2.3.15). -/
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

/-! ## Layer 6: stationary phase -/

/-- **6.1** The Fourier analogue of Watson's lemma (DLMF 2.3.20), for a general exponent
sequence: `q` is smooth on `(0, ∞)`, its expansion at `0+` differentiates termwise to every
order, and every derivative tends to `0` at `∞` with the next one integrable on `[1, ∞)`. -/
theorem hasAsymptoticExpansion_fourier {q : ℝ → ℂ} {α c : ℕ → ℂ}
    (hα0 : 0 < (α 0).re) (hα : StrictMono fun s => (α s).re)
    (hq : ContDiffOn ℝ ∞ q (Ioi 0))
    (hexp : ∀ k N : ℕ, (fun t : ℝ => iteratedDerivWithin k q (Ioi 0) t -
        ∑ s ∈ range N, c s * (descPochhammer ℂ k).eval (α s - 1) * (t : ℂ) ^ (α s - 1 - k))
      =O[𝓝[>] 0] fun t => t ^ ((α N).re - 1 - k))
    (hint : ∀ k : ℕ, IntegrableOn (iteratedDerivWithin (k + 1) q (Ioi 0)) (Ici 1))
    (hlim : ∀ k : ℕ, Tendsto (iteratedDerivWithin k q (Ioi 0)) atTop (𝓝 0)) :
    ∃ F : ℝ → ℂ,
      (∀ x : ℝ, 0 < x →
        Tendsto (fun T : ℝ => ∫ t in (0 : ℝ)..T, cexp (((x * t : ℝ) : ℂ) * I) * q t) atTop
          (𝓝 (F x))) ∧
      HasAsymptoticExpansion atTop (fun s (x : ℝ) => (x : ℂ) ^ (-α s))
        (fun s => cexp (π * I * α s / 2) * Gamma (α s) * c s) F :=
  sorry

/-- **6.2** Stationary phase at the left endpoint (DLMF 2.3.21–2.3.23), for a finite upper limit
`b` at which `p` and every `P_s = (p′⁻¹ d/dt)^s (q/p′)` have finite limits. The expansion is the
generalized one of DLMF 2.3.23: the stationary-endpoint series minus the series at `b`. -/
theorem isBigO_stationaryPhase_remainder {p : ℝ → ℝ} {q : ℝ → ℂ} {a b μ lam pb : ℝ}
    {ps : ℕ → ℝ} {qs : ℕ → ℂ} {P : ℕ → ℝ → ℂ} {Pb : ℕ → ℂ}
    (hab : a < b) (hμ : 0 < μ) (hlam : 0 < lam) (hp0 : 0 < ps 0)
    (hp : ContDiffOn ℝ ∞ p (Ioo a b)) (hq : ContDiffOn ℝ ∞ q (Ioo a b))
    (hp' : ∀ t ∈ Ioo a b, 0 < deriv p t)
    (hpexp : ∀ k N : ℕ, (fun t => iteratedDeriv k (fun t => p t - p a) t -
        ∑ s ∈ range N, ps s * (descPochhammer ℝ k).eval ((s : ℝ) + μ) * (t - a) ^ ((s : ℝ) + μ - k))
      =O[𝓝[>] a] fun t => (t - a) ^ ((N : ℝ) + μ - k))
    (hqexp : ∀ k N : ℕ, (fun t => iteratedDeriv k q t -
        ∑ s ∈ range N, qs s * (descPochhammer ℂ k).eval ((s : ℂ) + lam - 1) *
          ((t - a : ℝ) : ℂ) ^ ((s : ℂ) + lam - 1 - k))
      =O[𝓝[>] a] fun t => (t - a) ^ ((N : ℝ) + lam - 1 - k))
    (hP0 : ∀ t ∈ Ioo a b, P 0 t = q t / deriv p t)
    (hP : ∀ s : ℕ, ∀ t ∈ Ioo a b, P (s + 1) t = deriv (P s) t / deriv p t)
    (hpb : Tendsto p (𝓝[<] b) (𝓝 pb)) (hPb : ∀ s : ℕ, Tendsto (P s) (𝓝[<] b) (𝓝 (Pb s))) :
    ∀ N : ℕ, (fun x : ℝ => (∫ t in a..b, cexp (((x * p t : ℝ) : ℂ) * I) * q t) -
        cexp (((x * p a : ℝ) : ℂ) * I) * ∑ s ∈ range N,
          cexp (((s : ℂ) + lam) * π * I / (2 * μ)) * Gamma (((s : ℂ) + lam) / μ) *
            laplaceCoeff μ lam (Real.log (ps 0)) (PowerSeries.mk fun s => (ps s : ℂ))
              (PowerSeries.mk qs) s * (x : ℂ) ^ (-(((s : ℂ) + lam) / μ)) +
        cexp (((x * pb : ℝ) : ℂ) * I) * ∑ s ∈ range N, Pb s * (I / x) ^ (s + 1))
      =O[atTop] fun x : ℝ => x ^ (-((N : ℝ) + lam) / μ) + x ^ (-((N : ℝ) + 1)) :=
  sorry

/-! ## Layer 7: coalescing critical points -/

/-- **7.2** The functions `F_s` of DLMF 2.3.33. -/
def bleisteinF (lam : ℝ) (s : ℕ) (y : ℝ) : ℝ :=
  ∫ τ in Ioi (0 : ℝ), Real.exp (-τ ^ 2 / 2 + y * τ) * (τ - y) ^ s * τ ^ (lam - 1)

/-- **7.2** The comparison functions `G_N` of the Bleistein remainder bound. -/
def bleisteinG (lam : ℝ) (N : ℕ) (y : ℝ) : ℝ :=
  ∫ τ in Ioi (0 : ℝ), Real.exp (-τ ^ 2 / 2 + y * τ) * |τ - y| ^ N * τ ^ (lam - 1)

/-- **7.2** The uniform remainder bound behind DLMF 2.3.32 (`κ = ∞`). The constant `C` and
the data `a`, `φ` may depend on the parameter `α`; the bound is uniform in whatever `C` is. -/
theorem norm_bleistein_remainder_le {lam a C x : ℝ} {N : ℕ} {f : ℝ → ℂ} {phi : ℕ → ℂ}
    (hlam : 0 < lam) (hx : 0 < x) (hfm : AEStronglyMeasurable f (volume.restrict (Ioi 0)))
    (hf : ∀ w > 0, ‖f w - ∑ s ∈ range N, phi s * ((w - a) ^ s : ℝ)‖ ≤ C * |w - a| ^ N) :
    ‖(∫ w in Ioi (0 : ℝ), (Real.exp (-x * (w ^ 2 / 2 - a * w)) * w ^ (lam - 1) : ℝ) * f w) -
        (x ^ (-lam / 2) : ℝ) * ∑ s ∈ range N,
          phi s * (bleisteinF lam s (a * Real.sqrt x) * x ^ (-(s : ℝ) / 2) : ℝ)‖ ≤
      C * x ^ (-((N : ℝ) + lam) / 2) * bleisteinG lam N (a * Real.sqrt x) :=
  sorry

/-- **7.3** The Chester–Friedman–Ursell cubic normal form (DLMF 2.4.18), in the normalization
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

/-! ## Layers 8–9: Mellin transforms and the distributional method -/

/-- **8.2** The line shift with simple poles: holomorphic on a neighbourhood `U` of the strip
`d ≤ Re t ≤ c` off a finite set `P` of simple poles inside it, integrable on both lines, with
vanishing horizontal connectors. -/
theorem integral_vertical_sub_eq_two_pi_mul_sum_residue (F : ℂ → ℂ) {c d : ℝ} (hdc : d < c)
    {U : Set ℂ} (hU : IsOpen U) (hstrip : Set.ofPred (fun t : ℂ => d ≤ t.re ∧ t.re ≤ c) ⊆ U)
    (P : Finset ℂ) (hP : ∀ p ∈ P, d < p.re ∧ p.re < c)
    (hF : DifferentiableOn ℂ F (U \ (P : Set ℂ)))
    (hpole : ∀ p ∈ P, ∃ g : ℂ → ℂ, AnalyticAt ℂ g p ∧ ∀ᶠ t in 𝓝[≠] p, F t = g t / (t - p))
    (hc : Integrable fun y : ℝ => F (c + y * I)) (hd : Integrable fun y : ℝ => F (d + y * I))
    (htop : Tendsto (fun T : ℝ => ∫ x in d..c, F (x + T * I)) atTop (𝓝 0))
    (hbot : Tendsto (fun T : ℝ => ∫ x in d..c, F (x + T * I)) atBot (𝓝 0)) :
    (∫ y : ℝ, F (c + y * I)) - ∫ y : ℝ, F (d + y * I) =
      2 * π * ∑ p ∈ P, TauCeti.Contour.residue F p := sorry

/-- **8.6** The pole-separated bound for `Γ` on a vertical strip. -/
theorem exists_norm_Gamma_le {u v η : ℝ} (hη : 0 < η) :
    ∃ C > 0, ∃ K : ℕ, ∀ x y : ℝ, u ≤ x → x ≤ v → (∀ n : ℕ, η ≤ ‖(x : ℂ) + y * I + n‖) →
      ‖Complex.Gamma (x + y * I)‖ ≤ C * (1 + |y|) ^ K * Real.exp (-(π * |y|) / 2) := sorry

/-- **8.7** Exponential Mellin inversion (the Cahen–Mellin integral). -/
theorem integral_Gamma_mul_cpow_neg {c : ℝ} (hc : 0 < c) {w : ℂ} (hw : 0 < w.re) :
    Integrable (fun y : ℝ => Complex.Gamma (c + y * I) * w ^ (-((c : ℂ) + y * I))) ∧
      ∫ y : ℝ, Complex.Gamma (c + y * I) * w ^ (-((c : ℂ) + y * I)) = 2 * π * cexp (-w) := sorry

/-- **8.3** The Mellin transform continued to the left through an expansion
`f(t) ~ ∑ a_k t^{α_k}` at `0+` (DLMF 2.5.25–2.5.26), using `n` terms; valid for
`−Re α_n < Re z` away from the points `−α_k`, and where the integral over `(1, ∞)` converges. -/
def mellinContAtZero (f : ℝ → ℂ) (a α : ℕ → ℂ) (n : ℕ) (z : ℂ) : ℂ :=
  (∫ t in Ioc (0 : ℝ) 1, (t : ℂ) ^ (z - 1) * (f t - ∑ k ∈ range n, a k * (t : ℂ) ^ α k)) +
    ∑ k ∈ range n, a k / (z + α k) + ∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * f t

/-- **8.3** The Mellin transform continued to the right through an expansion
`f(t) ~ ∑ b_k t^{−β_k}` at `+∞` (DLMF 2.5.27–2.5.28), using `n` terms; valid for
`Re z < Re β_n` away from the points `β_k`, and where the integral over `(0, 1]` converges. -/
def mellinContAtTop (f : ℝ → ℂ) (b β : ℕ → ℂ) (n : ℕ) (z : ℂ) : ℂ :=
  (∫ t in Ioc (0 : ℝ) 1, (t : ℂ) ^ (z - 1) * f t) +
    (∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * (f t - ∑ k ∈ range n, b k * (t : ℂ) ^ (-β k))) -
    ∑ k ∈ range n, b k / (z - β k)

/-- **8.3** Properties of `mellinContAtZero`: holomorphy away from the poles, independence of
`n`, agreement with `mellin`, and principal parts `a k / (z + α k)`. -/
theorem mellinContAtZero_spec {f : ℝ → ℂ} {a α : ℕ → ℂ} {b : ℝ} (n : ℕ)
    (hf : LocallyIntegrableOn f (Ioi 0)) (hα : StrictMono fun k => (α k).re)
    (hexp : ∀ N, (fun t : ℝ => f t - ∑ k ∈ range N, a k * (t : ℂ) ^ α k)
      =O[𝓝[>] 0] fun t => t ^ (α N).re)
    (htop : f =O[atTop] fun t => t ^ (-b)) :
    DifferentiableOn ℂ (mellinContAtZero f a α n)
        {z | -(α n).re < z.re ∧ z.re < b ∧ ∀ k < n, z ≠ -α k} ∧
      (∀ m, EqOn (mellinContAtZero f a α n) (mellinContAtZero f a α m)
        {z | -(α (min n m)).re < z.re ∧ z.re < b ∧ ∀ k < max n m, z ≠ -α k}) ∧
      EqOn (mellinContAtZero f a α n) (mellin f) {z | -(α 0).re < z.re ∧ z.re < b} ∧
      DifferentiableOn ℂ (fun z => mellinContAtZero f a α n z - ∑ k ∈ range n, a k / (z + α k))
        {z | -(α n).re < z.re ∧ z.re < b} :=
  sorry

/-- **8.3** The model integral `∫₁^∞ u^{w−1} e^{iκu} du` for `κ ≠ 0`, with the ray rotated to
the vertical through `1`; it is entire in `w`. -/
def oscTail (κ : ℝ) (w : ℂ) : ℂ :=
  I * Real.sign κ * cexp (κ * I) *
    ∫ y in Ioi (0 : ℝ), (1 + I * Real.sign κ * y) ^ (w - 1) * Real.exp (-|κ| * y)

/-- **8.3** `oscTail κ` is entire and is the improper integral for `Re w < 1`. -/
theorem oscTail_spec {κ : ℝ} (hκ : κ ≠ 0) :
    Differentiable ℂ (oscTail κ) ∧ ∀ w : ℂ, w.re < 1 →
      Tendsto (fun T : ℝ => ∫ u in (1 : ℝ)..T, (u : ℂ) ^ (w - 1) * cexp (κ * u * I)) atTop
        (𝓝 (oscTail κ w)) :=
  sorry

/-- **8.3** The tail Mellin transform `∫₁^∞ t^{z−1} f(t) dt` for an oscillatory expansion
`f(t) ~ e^{iκt^p} ∑ b_k t^{−β_k}` at `+∞` (DLMF 2.5.18, `κ ≠ 0`), using `n` terms; valid for
`Re z < Re β_n`. -/
def mellinContOscTop (f : ℝ → ℂ) (κ p : ℝ) (b β : ℕ → ℂ) (n : ℕ) (z : ℂ) : ℂ :=
  (∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) *
      (f t - cexp (((κ * t ^ p : ℝ) : ℂ) * I) * ∑ k ∈ range n, b k * (t : ℂ) ^ (-β k))) +
    (p : ℂ)⁻¹ * ∑ k ∈ range n, b k * oscTail κ ((z - β k) / p)

/-- **8.3** The oscillatory tail transform continues to an entire function. -/
theorem exists_entire_mellinContOscTop {f : ℝ → ℂ} {κ p : ℝ} {b β : ℕ → ℂ} (hκ : κ ≠ 0)
    (hp : 0 < p) (hf : LocallyIntegrableOn f (Ici 1)) (hβ : StrictMono fun k => (β k).re)
    (hβtop : Tendsto (fun k => (β k).re) atTop atTop)
    (hexp : ∀ N, (fun t : ℝ => f t - cexp (((κ * t ^ p : ℝ) : ℂ) * I) *
      ∑ k ∈ range N, b k * (t : ℂ) ^ (-β k)) =O[atTop] fun t => t ^ (-(β N).re)) :
    ∃ F : ℂ → ℂ, Differentiable ℂ F ∧
      (∀ n, EqOn F (mellinContOscTop f κ p b β n) {z | z.re < (β n).re}) ∧
      ∀ z : ℂ, z.re < (β 0).re → F z = ∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * f t :=
  sorry

/-- **9.2** The exact Stieltjes-transform identity (DLMF 2.6.27, 2.6.30) for `0 < α < 1`,
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

/-! ## Layer 10: linear differential equations in the complex domain -/

/-- **10.1** Volterra integral equations with a separable kernel bound (Olver 1997, Ch. 6,
§10), on `(a, ∞)`: existence of a solution with `|h| ≤ P Φ e^Ψ`. -/
theorem exists_volterra_solution {a : ℝ} {K : ℝ → ℝ → ℂ} {J ψ : ℝ → ℂ} {P Q : ℝ → ℝ}
    (hK : ContinuousOn (Function.uncurry K) {p | a < p.1 ∧ p.1 ≤ p.2})
    (hJ : ContinuousOn J (Ioi a)) (hψ : ContinuousOn ψ (Ioi a))
    (hP : ContinuousOn P (Ioi a)) (hQ : ContinuousOn Q (Ioi a))
    (hP0 : ∀ x ∈ Ioi a, 0 ≤ P x) (hQ0 : ∀ x ∈ Ioi a, 0 ≤ Q x)
    (hKle : ∀ x v, a < x → x ≤ v → ‖K x v‖ ≤ P x * Q v)
    (hΦ : ∀ x ∈ Ioi a, IntegrableOn (fun v => Q v * ‖J v‖) (Ioi x))
    (hΨ : ∀ x ∈ Ioi a, IntegrableOn (fun v => P v * Q v * ‖ψ v‖) (Ioi x)) :
    ∃ h : ℝ → ℂ, ContinuousOn h (Ioi a) ∧
      (∀ x ∈ Ioi a, h x = ∫ v in Ioi x, K x v * (J v + ψ v * h v)) ∧
      ∀ x ∈ Ioi a, ‖h x‖ ≤ P x * (∫ v in Ioi x, Q v * ‖J v‖) *
        Real.exp (∫ v in Ioi x, P v * Q v * ‖ψ v‖) :=
  sorry

/-- **10.3** The series solution at a regular singularity (DLMF 2.7.2–2.7.5), for an
exponent `ρ` such that no `ρ + s`, `s ≥ 1`, is a root of the indicial polynomial. -/
theorem regularSingular_solution {z₀ ρ : ℂ} {r : ℝ} {f g w : ℂ → ℂ} {fs gs a : ℕ → ℂ}
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

/-- **10.4** The normalized solution at an irregular singularity of rank one at infinity
(DLMF 2.7.10–2.7.16), for the root `lam₁`, in logarithmic coordinates `z = exp ζ`. Here
`ℓ = log (lam₂ − lam₁)` and `((lam₂ − lam₁) z) ^ μ = exp (μ (ζ + ℓ))`. -/
theorem exists_rankOne_solution {fs gs a : ℕ → ℂ} {f g : ℂ → ℂ} {A : ℝ} {lam₁ lam₂ μ : ℂ}
    (hA : 0 < A)
    (hf : ∀ z : ℂ, A < ‖z‖ → HasSum (fun s => fs s * (z ^ s)⁻¹) (f z))
    (hg : ∀ z : ℂ, A < ‖z‖ → HasSum (fun s => gs s * (z ^ s)⁻¹) (g z))
    (h₁ : lam₁ ^ 2 + fs 0 * lam₁ + gs 0 = 0) (h₂ : lam₂ ^ 2 + fs 0 * lam₂ + gs 0 = 0)
    (hne : lam₁ ≠ lam₂) (hμ : μ = -(fs 1 * lam₁ + gs 1) / (fs 0 + 2 * lam₁))
    (ha0 : a 0 = 1)
    (ha : ∀ s : ℕ, 1 ≤ s → (fs 0 + 2 * lam₁) * s * a s =
      (s - μ) * (s - 1 - μ) * a (s - 1) +
        ∑ r ∈ Icc 1 s, (lam₁ * fs (r + 1) + gs (r + 1) - ((s : ℂ) - r - μ) * fs r) * a (s - r)) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {ζ | Real.log A < ζ.re} ∧
      (∀ ζ : ℂ, Real.log A < ζ.re → deriv (deriv W) ζ + (cexp ζ * f (cexp ζ) - 1) * deriv W ζ +
        cexp (2 * ζ) * g (cexp ζ) * W ζ = 0) ∧
      ∀ δ > 0, ∀ N : ℕ, (fun ζ => W ζ - cexp (lam₁ * cexp ζ) *
          cexp (μ * (ζ + Complex.log (lam₂ - lam₁))) * ∑ s ∈ range N, a s * cexp (-(s * ζ)))
        =O[comap Complex.re atTop ⊓ 𝓟 {ζ | -(3 * π / 2) + δ ≤ (ζ + Complex.log (lam₂ - lam₁)).im ∧
            (ζ + Complex.log (lam₂ - lam₁)).im ≤ 3 * π / 2 - δ}]
          fun ζ => ‖cexp (lam₁ * cexp ζ + μ * (ζ + Complex.log (lam₂ - lam₁)))‖ *
            Real.exp (-(N * ζ.re)) :=
  sorry

/-! ## Layer 11: Liouville–Green approximation -/

/-- **11.1** The Liouville–Green theorem (DLMF 2.7.20–2.7.25) for the solution recessive at
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

/-- **11.4** Case I without transition points (DLMF 2.8.10–2.8.13), for the solution growing
like `e^{uξ}` on `Δ₁ = [α₁, b₂)`. The solution depends on the order `n`; the expansions are
uniform along `𝓟 Δ₁ ×ˢ atTop`, the parameter being `ξ` and `u → ∞`. -/
theorem exists_caseI_solution {ψ : ℝ → ℝ} {b₁ b₂ α₁ : ℝ} {A : ℕ → ℝ → ℝ} (n : ℕ)
    (hα₁ : α₁ ∈ Ioo b₁ b₂) (hψ : ContDiffOn ℝ ∞ ψ (Ioo b₁ b₂))
    (hA0 : ∀ ξ, A 0 ξ = 1) (hA : ∀ s, ContDiffOn ℝ ∞ (A s) (Ioo b₁ b₂))
    (hrec : ∀ s, ∀ ξ ∈ Ioo b₁ b₂,
      deriv (A (s + 1)) ξ = -(iteratedDeriv 2 (A s) ξ) / 2 + ψ ξ * A s ξ / 2)
    (hA1 : IntegrableOn (fun ξ => |deriv (A 1) ξ|) (Ico α₁ b₂))
    (hAn : IntegrableOn (fun ξ => |deriv (A n) ξ|) (Ico α₁ b₂)) :
    ∃ W : ℝ → ℝ → ℝ,
      (∀ u > 0, ContDiffOn ℝ 2 (W u) (Ioo b₁ b₂) ∧
        ∀ ξ ∈ Ioo b₁ b₂, iteratedDeriv 2 (W u) ξ = (u ^ 2 + ψ ξ) * W u ξ) ∧
      (fun p : ℝ × ℝ => Real.exp (-(p.2 * p.1)) * W p.2 p.1 -
          ∑ s ∈ range n, A s p.1 * p.2 ^ (-(s : ℤ)))
        =O[𝓟 (Ico α₁ b₂) ×ˢ atTop] (fun p => p.2 ^ (-(n : ℤ))) ∧
      (fun p : ℝ × ℝ => Real.exp (-(p.2 * p.1)) * deriv (W p.2) p.1 -
          ∑ s ∈ range n, (p.2 * A s p.1 + deriv (A s) p.1) * p.2 ^ (-(s : ℤ)))
        =O[𝓟 (Ico α₁ b₂) ×ˢ atTop] (fun p => p.2 ^ (1 - (n : ℤ))) :=
  sorry

/-! ## Layer 12: difference equations -/

/-- **12.1** The solution of `w(n+2) + f(n) w(n+1) + g(n) w(n) = 0` attached to a simple
characteristic root `ρ` (DLMF 2.9.4–2.9.7), under `g n ≠ 0` for every `n`. -/
theorem exists_difference_solution {f g fs gs a : ℕ → ℂ} {ρ α : ℂ}
    (hf : HasAsymptoticExpansion atTop (fun s (n : ℕ) => ((n : ℂ) ^ s)⁻¹) fs f)
    (hg : HasAsymptoticExpansion atTop (fun s (n : ℕ) => ((n : ℂ) ^ s)⁻¹) gs g)
    (hg0 : gs 0 ≠ 0) (hgne : ∀ n, g n ≠ 0) (hdisc : fs 0 ^ 2 ≠ 4 * gs 0)
    (hρ : ρ ^ 2 + fs 0 * ρ + gs 0 = 0) (hα : α = (fs 1 * ρ + gs 1) / (fs 0 * ρ + 2 * gs 0))
    (ha0 : a 0 = 1)
    (ha : ∀ s : ℕ, 1 ≤ s → ρ * (fs 0 + 2 * ρ) * s * a s =
      ∑ r ∈ Icc 1 s, (ρ ^ 2 * 2 ^ (r + 1) * Ring.choose (α + r - s) (r + 1) +
        ρ * ∑ q ∈ range (r + 2), Ring.choose (α + r - s) (r + 1 - q) * fs q + gs (r + 1)) *
          a (s - r)) :
    ∃ w : ℕ → ℂ, (∀ n, w (n + 2) + f n * w (n + 1) + g n * w n = 0) ∧
      ∀ N : ℕ, (fun n : ℕ => w n - ρ ^ n * (n : ℂ) ^ α * ∑ s ∈ range N, a s * ((n : ℂ) ^ s)⁻¹)
        =O[atTop] fun n : ℕ => ‖ρ‖ ^ n * (n : ℝ) ^ (α.re - N) :=
  sorry

/-! ## Layer 13: sums and sequences -/

/-- **13.1** The Euler–Maclaurin formula (DLMF 2.10.1), with the periodic Bernoulli function
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

/-- **13.2** The Abel–Plana formula (DLMF 2.10.2, exact form): `f` holomorphic on the open
strip `a < Re z < n`, continuous on its closure, `o(e^{2π|Im z|})` uniformly in the strip, and
real on the real segment. -/
theorem sum_Icc_eq_abelPlana {f : ℂ → ℂ} {a n : ℤ} (han : a < n)
    (hf : DifferentiableOn ℂ f {z | (a : ℝ) < z.re ∧ z.re < n})
    (hcont : ContinuousOn f {z | (a : ℝ) ≤ z.re ∧ z.re ≤ n})
    (hgrowth : Tendsto (fun z => f z * Real.exp (-(2 * π * |z.im|)))
      (comap (fun z : ℂ => |z.im|) atTop ⊓ 𝓟 {z | (a : ℝ) ≤ z.re ∧ z.re ≤ n}) (𝓝 0))
    (hreal : ∀ x : ℝ, (a : ℝ) ≤ x → x ≤ n → (f x).im = 0)
    (hinta : IntegrableOn (fun y : ℝ => (f (a + y * I)).im / (Real.exp (2 * π * y) - 1)) (Ioi 0))
    (hintn : IntegrableOn (fun y : ℝ => (f (n + y * I)).im / (Real.exp (2 * π * y) - 1)) (Ioi 0)) :
    ∑ j ∈ Finset.Icc a n, f j =
      (∫ x in (a : ℝ)..n, f x) + f a / 2 + f n / 2 -
        2 * ((∫ y in Ioi (0 : ℝ), (f (a + y * I)).im / (Real.exp (2 * π * y) - 1) : ℝ) : ℂ) +
        2 * ((∫ y in Ioi (0 : ℝ), (f (n + y * I)).im / (Real.exp (2 * π * y) - 1) : ℝ) : ℂ) :=
  sorry

/-- **13.3** DLMF 2.10.4–2.10.6: the constant in the expansion of `∑ j log j` is
`1/12 − ζ′(−1)`. -/
theorem tendsto_sum_mul_log_sub :
    Tendsto (fun n : ℕ => ∑ j ∈ Finset.Icc 1 n, (j : ℝ) * Real.log j -
        ((n : ℝ) ^ 2 / 2 * Real.log n - (n : ℝ) ^ 2 / 4 + n / 2 * Real.log n +
          Real.log n / 12))
      atTop (𝓝 (1 / 12 - (deriv riemannZeta (-1)).re)) :=
  sorry

/-- **13.6** The Laurent coefficient `f_n = (2πi)⁻¹ ∮_{|z|=ρ} f(z) z^{−n−1} dz` (DLMF 2.10.26). -/
def laurentCoeff (f : ℂ → ℂ) (ρ : ℝ) (n : ℤ) : ℂ :=
  (2 * π * I)⁻¹ * ∮ z in C(0, ρ), z ^ (-(n + 1)) * f z

/-- **13.6** Darboux's method (DLMF 2.10.27–2.10.29): `f_n = g_n + o(r^{−n})` as `n → ±∞`. -/
theorem tendsto_laurentCoeff_sub {f g h : ℂ → ℂ} {r ρ : ℝ} (hρ : 0 < ρ) (hρr : ρ < r)
    (hf : DifferentiableOn ℂ f {z | 0 < ‖z‖ ∧ ‖z‖ < r})
    (hg : DifferentiableOn ℂ g {z | 0 < ‖z‖ ∧ ‖z‖ < r})
    (hh : ContinuousOn h {z | 0 < ‖z‖ ∧ ‖z‖ ≤ r})
    (hfg : ∀ z, 0 < ‖z‖ → ‖z‖ < r → h z = f z - g z) :
    Tendsto (fun n : ℤ => (r : ℂ) ^ n * (laurentCoeff f ρ n - laurentCoeff g ρ n)) cofinite
      (𝓝 0) :=
  sorry

end TauCetiRoadmap.AsymptoticExpansions
