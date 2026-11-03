module

import Mathlib
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Ring
import TauCeti.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
import TauCeti.Analysis.Complex.UpperHalfPlane.PSL.Action

/-!
# Maass forms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs, using only definitions needed to state them.

The headline inventory is: all-cusp Fourier–Whittaker expansion (including exceptional
parameters); finite multiplicity and discreteness; Hecke newform theory and cross-level strong
multiplicity one and the character-conductor bad-prime trichotomy; Selberg's bound, the
level-one bound and even-character Weyl asymptotics;
absolute convergence, Euler product, entire completion and the character-dual functional
equation; and localization of a cuspidal eigenvalue from a nonzero residual vector.

The following headlines are not statable on the supplied carriers at the pins:
* the self-adjoint character-isotypic realization and its spectral Hilbert basis require the
  quotient Laplacian and its domain from CongruenceSpectralGap §§0.2, 0.5b;
* the character scattering functional equation and determinant estimates require the continued
  character Eisenstein family and normalized cusp-channel matrix of README §5.5;
* the completed L-function card and its dual comparison require LFunctions Layer 0's
  AnalyticLFunctionData;
* the Picard Fourier expansion, spectral theorem, Hecke eigenbasis and completed L-function
  require the Picard-group PSL₂(ℂ) action and automorphic quotient measure from
  KleinianGroups; the native TauCeti.UpperHalfSpace alone does not supply this action;
* quantitative coefficient recovery requires the joint spectral projection on the cuspidal
  Hilbert space and bounded mode functionals of README §8.3.
These statements have no surrogate declarations here. Selberg's eigenvalue conjecture,
Ramanujan–Petersson and spectral simplicity remain propositions in the README, not assertions.

The carrier is a **weight-`0` Maass cusp form for `Γ₀(N)` with nebentypus `χ`**, a function
`ℍ → ℂ` on Mathlib's `UpperHalfPlane`, cut out by the predicate `IsMaassCuspForm N χ lam` and
packaged as the submodule `maassCuspSpace N χ lam` of `ℍ → ℂ`; `χ : DirichletCharacter ℂ N` is
evaluated at the lower-right entry `Gamma0Map N γ`. The level-one carrier of
AutomorphicFormsOnReductiveGroups §4.5 is the case `N = 1`, trivial `χ`, and is not redeclared.

Conventions visible in the signatures (`README.md`, *Conventions*). The Laplacian is the
**nonnegative** operator `-y²(∂ₓ² + ∂ᵧ²)`, built from Mathlib's `Δ` on `ℂ` as a real inner product
space; eigenvalues are real with `lam = 1/4 + r²` for `lam ≥ 1/4`, and `spectralParameter lam = √(lam - 1/4)` is the
LMFDB's `R`. Cuspidality is the single width-free condition
`∀ σ ∈ SL(2, ℤ), ∀ y > 0, ∫₀^N f(σ(x + iy)) dx = 0`, equivalent to a vanishing constant term at
every regular cusp. Square-integrability is through Mathlib's `IsFundamentalDomain`. The Fourier
expansion carries the factor two of §4.5, `f(z) = 2√y Σ_{n≠0} a(n) K_{ir}(2π|n|y) e(nx)`, and the
Bessel function `K_ν`, a target of §4.5 and not a Tau Ceti module, is written as its defining
integral `∫₀^∞ e^{-u cosh t} cosh(νt) dt` wherever a statement needs it; the coefficient itself is
defined by the `K`-free limit `a(n) = lim_{y→∞} √|n| e^{2π|n|y} ∫₀¹ f(x + iy) e(-nx) dx`. Hecke
operators are unitarily normalized, `Tₙ = n^{-1/2} Σ_{ad=n} χ(a) Σ_{b mod d} f((az+b)/d)`, so that a
normalized eigenform has `Tₙ f = a(n) f`. The reflection is `f(-z̄)`; the Fricke operator is
`f(-1/(Nz))` with no scalar; the root number of a newform with trivial character is
`ε_N (-1)^δ`.
-/

namespace TauCetiRoadmap.MaassForms

open Complex Real MeasureTheory CongruenceSubgroup Filter Topology Laplacian
open UpperHalfPlane hiding I
open scoped MatrixGroups ContDiff Interval

noncomputable section

/-! ## Layer 0: the Laplacian, automorphy with character, cusps, the Petersson product -/

/-- `README.md`, Layer 0, 0.1. The hyperbolic Laplacian `Δ f = -y²(∂ₓ² + ∂ᵧ²) f`, nonnegative
convention, computed through Mathlib's Laplacian on `ℂ` as a two-dimensional real inner product
space and the junk-valued inverse `ofComplex` of the coercion `ℍ → ℂ`. -/
def hyperbolicLaplacian (f : ℍ → ℂ) (z : ℍ) : ℂ :=
  -((z.im : ℂ) ^ 2) * Δ (fun w : ℂ => f (ofComplex w)) (z : ℂ)

/-- `README.md`, Layer 0, 0.1. Real smoothness of a function on `ℍ`: `f ∘ ofComplex` is `C^∞` on the
open set `{im > 0}` of `ℂ`. This is the regularity every Maass form carries. -/
def IsSmoothOnUpperHalfPlane (f : ℍ → ℂ) : Prop :=
  ContDiffOn ℝ ∞ (fun w : ℂ => f (ofComplex w)) {w : ℂ | 0 < w.im}

/-- `README.md`, Layer 0, 0.3. Automorphy with nebentypus `χ` at weight `0`:
`f(γz) = χ(d_γ) f(z)` for `γ ∈ Γ₀(N)`, the character evaluated at the lower-right entry. -/
def IsAutomorphic (N : ℕ) (χ : DirichletCharacter ℂ N) (f : ℍ → ℂ) : Prop :=
  f ∈ functionCharSpace 0 (MulChar.equivToUnitHom χ)

/-- `README.md`, Layer 0, 0.4. The width of the cusp `σ∞` of `Γ₀(N)`, `N / gcd(c², N)` for the
lower-left entry `c` of `σ`. It is identified with the `width` of the Tau Ceti `CuspDatum` whose
scaling is `σ⁻¹` (`Subgroup.CuspDatum.width`). -/
def cuspWidth (N : ℕ) (σ : SL(2, ℤ)) : ℕ :=
  N / Nat.gcd (((σ : Matrix (Fin 2) (Fin 2) ℤ) 1 0).natAbs ^ 2) N

/-- `README.md`, Layer 0, 0.4. The multiplier of `(Γ₀(N), χ)` at the cusp `σ∞`: the value of `χ` on
the lower-right entry `1 + a c w` of the generator `σ T^w σ⁻¹` of the stabilizer. -/
def cuspMultiplier (N : ℕ) (χ : DirichletCharacter ℂ N) (σ : SL(2, ℤ)) : ℂ :=
  χ ((1 + (σ : Matrix (Fin 2) (Fin 2) ℤ) 0 0 * (σ : Matrix (Fin 2) (Fin 2) ℤ) 1 0 *
    (cuspWidth N σ : ℤ) : ℤ) : ZMod N)

/-- `README.md`, Layer 0, 0.4. The point `x + iy` of `ℍ` for `y > 0` (junk for `y ≤ 0`). -/
def pt (x y : ℝ) : ℍ := ofComplex (x + y * I)

/-- `README.md`, Layer 0, 0.4. The cusp integral `I_σ(f, y) = ∫₀^N f(σ(x + iy)) dx` over a full
period `N`, a common multiple of every cusp width of `Γ₀(N)`. -/
def cuspIntegral (N : ℕ) (f : ℍ → ℂ) (σ : SL(2, ℤ)) (y : ℝ) : ℂ :=
  ∫ x in (0 : ℝ)..N, f (σ • pt x y)

/-- `README.md`, Layer 0, 0.4. Cuspidality, width-free: every cusp integral vanishes. At a regular
cusp this is `N` times the constant term (`N/w_σ` periods of `w_σ c_σ`); at an irregular cusp it
holds identically. -/
def IsCuspidal (N : ℕ) (f : ℍ → ℂ) : Prop :=
  ∀ σ : SL(2, ℤ), ∀ y : ℝ, 0 < y → cuspIntegral N f σ y = 0

/-- `README.md`, Layer 0, 0.5. The image `Γ̄₀(N)` of `Γ₀(N)` in `PSL(2, ℝ)`, the group whose
fundamental domains carry every integral below. `Gamma0 N` itself cannot be used: `-I` acts
trivially on `ℍ`, so `IsFundamentalDomain (Gamma0 N) F volume` holds for no `F`. -/
def gamma0PSL (N : ℕ) : Subgroup PSL(2, ℝ) :=
  (Gamma0 N).map (psl2zToPSL2R.comp (QuotientGroup.mk' (Subgroup.center SL(2, ℤ))))

/-- `README.md`, Layer 0, 0.5. Square-integrability on the quotient, through a measurable
fundamental domain of `Γ̄₀(N)` for Mathlib's invariant measure on `ℍ`. -/
def IsSquareIntegrable (N : ℕ) (f : ℍ → ℂ) : Prop :=
  ∃ F : Set ℍ, IsFundamentalDomain (gamma0PSL N) F volume ∧
    IntegrableOn (fun z => ‖f z‖ ^ 2) F volume

/-- `README.md`, Layer 0, 0.5. The Petersson inner product `⟨f, g⟩ = ∫_F f ḡ dμ` of weight `0`,
conjugate-linear in the second slot, unnormalized, over a classically chosen measurable fundamental
domain `F` of `Γ̄₀(N)`; the value is independent of the domain for square-integrable automorphic `f, g` (README §0.5). -/
def petersson (N : ℕ) (f g : ℍ → ℂ) : ℂ := by
  classical exact
    if h : ∃ F : Set ℍ, IsFundamentalDomain (gamma0PSL N) F volume then
      ∫ z in h.choose, f z * (starRingEnd ℂ) (g z) ∂volume
    else 0

/-- `README.md`, Layer 0, 0.5. The Petersson product vanishes when its first argument is `0`. -/
theorem petersson_zero_left (N : ℕ) (g : ℍ → ℂ) : petersson N 0 g = 0 := by
  unfold petersson
  split_ifs <;> simp

/-- `README.md`, Layer 0, 0.5. Linearity of the Petersson product in the first slot: scalars. -/
theorem petersson_smul_left (N : ℕ) (c : ℂ) (f g : ℍ → ℂ) :
    petersson N (c • f) g = c * petersson N f g := by
  unfold petersson
  split_ifs
  · simp only [Pi.smul_apply, smul_eq_mul, mul_assoc]
    exact integral_const_mul c _
  · simp

/-! ## Layer 1: the carrier and the spectral parameter -/

/-- `README.md`, Layer 1, 1.1. A weight-`0` Maass form for `Γ₀(N)` with character `χ` and Laplace
eigenvalue `lam`: smooth, automorphic, an eigenfunction of the nonnegative Laplacian,
square-integrable. -/
def IsMaassForm (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) (f : ℍ → ℂ) : Prop :=
  IsSmoothOnUpperHalfPlane f ∧ IsAutomorphic N χ f ∧
    (∀ z : ℍ, hyperbolicLaplacian f z = lam * f z) ∧ IsSquareIntegrable N f

/-- `README.md`, Layer 1, 1.1. A Maass cusp form: a Maass form with vanishing cusp integrals. -/
def IsMaassCuspForm (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) (f : ℍ → ℂ) : Prop :=
  IsMaassForm N χ lam f ∧ IsCuspidal N f

/-- `README.md`, Layer 1, 1.1. The zero function is a Maass form: a measurable fundamental domain
of `Γ̄₀(N)` exists (0.5), and `0` is integrable on it. -/
theorem isMaassForm_zero (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) :
    IsMaassForm N χ lam 0 := by
  sorry

/-- `README.md`, Layer 1, 1.1. Maass forms are closed under scalar multiplication. -/
theorem IsMaassForm.const_smul {N : ℕ} {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ} (c : ℂ)
    (hf : IsMaassForm N χ lam f) : IsMaassForm N χ lam (c • f) := by
  sorry

/-- `README.md`, Layer 1, 1.1. The zero function is a Maass cusp form. -/
theorem isMaassCuspForm_zero (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) :
    IsMaassCuspForm N χ lam 0 :=
  ⟨isMaassForm_zero N χ lam, fun σ y _ => by simp [cuspIntegral]⟩

/-- `README.md`, Layer 1, 1.1. Maass cusp forms are closed under addition (the cusp integrals of
continuous functions are additive). -/
theorem IsMaassCuspForm.add {N : ℕ} {χ : DirichletCharacter ℂ N} {lam : ℝ} {f g : ℍ → ℂ}
    (hf : IsMaassCuspForm N χ lam f) (hg : IsMaassCuspForm N χ lam g) :
    IsMaassCuspForm N χ lam (f + g) := by
  sorry

/-- `README.md`, Layer 1, 1.1. Maass cusp forms are closed under scalar multiplication. -/
theorem IsMaassCuspForm.const_smul {N : ℕ} {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ}
    (c : ℂ) (hf : IsMaassCuspForm N χ lam f) : IsMaassCuspForm N χ lam (c • f) := by
  refine ⟨hf.1.const_smul c, fun σ y hy => ?_⟩
  simp only [cuspIntegral, Pi.smul_apply, smul_eq_mul, intervalIntegral.integral_const_mul]
  rw [show (∫ x in (0 : ℝ)..N, f (σ • pt x y)) = 0 from hf.2 σ y hy, mul_zero]

/-- `README.md`, Layer 1, 1.1. The space `S(N, χ, λ)` of Maass cusp forms. At `N = 1` and trivial
`χ` it is the carrier `MaassCuspForm(SL₂(ℤ), λ)` of AutomorphicFormsOnReductiveGroups §4.5. -/
def maassCuspSpace (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) : Submodule ℂ (ℍ → ℂ) where
  carrier := {f | IsMaassCuspForm N χ lam f}
  add_mem' := IsMaassCuspForm.add
  zero_mem' := isMaassCuspForm_zero N χ lam
  smul_mem' c _ hf := hf.const_smul c

/-- `README.md`, Layer 1, 1.2. The spectral parameter `r = √(λ - 1/4)` of a non-exceptional
eigenvalue; this is the LMFDB's column `spectral_parameter` (`R`). -/
def spectralParameter (lam : ℝ) : ℝ := Real.sqrt (lam - 1 / 4)

/-- The Bessel order: imaginary above the threshold and real on the complementary branch.
Its square is `1/4 - lam`; the K-kernel is even in this order. -/
def besselOrder (lam : ℝ) : ℂ :=
  if 1 / 4 ≤ lam then I * spectralParameter lam else (Real.sqrt (1 / 4 - lam) : ℂ)

/-! ## Layer 2: the Fourier–Whittaker expansion -/

/-- `README.md`, Layer 2, 2.2. The `n`-th Fourier mode at the cusp `∞`,
`f_n(y) = ∫₀¹ f(x + iy) e(-nx) dx`. -/
def fourierMode (f : ℍ → ℂ) (n : ℤ) (y : ℝ) : ℂ :=
  ∫ x in (0 : ℝ)..1, f (pt x y) * cexp (-(2 * π * I * n * x))

/-- `README.md`, Layer 2, 2.3. The Fourier coefficient `a_f(n)`, `n ≠ 0`, of the factor-two
expansion `f(z) = 2√y Σ a_f(n) K_{ir}(2π|n|y) e(nx)`, defined by its `K`-free characterization
`a_f(n) = lim_{y → ∞} √|n| e^{2π|n|y} f_n(y)` (junk when the limit does not exist). At `N = 1` and
trivial `χ` this is `fourierCoefficient` of AutomorphicFormsOnReductiveGroups §4.5. -/
def fourierCoefficient (f : ℍ → ℂ) (n : ℤ) : ℂ :=
  limUnder atTop (fun y : ℝ =>
    (Real.sqrt |(n : ℝ)| : ℂ) * (Real.exp (2 * π * |(n : ℝ)| * y) : ℂ) * fourierMode f n y)

/-- The Fourier mode at a cusp of width `w`, for the real frequency `v`. -/
def fourierModeAt (N : ℕ) (σ : SL(2, ℤ)) (f : ℍ → ℂ) (v y : ℝ) : ℂ :=
  (cuspWidth N σ : ℂ)⁻¹ * ∫ x in (0 : ℝ)..(cuspWidth N σ : ℝ),
    f (σ • pt x y) * cexp (-(2 * π * I * v * x / cuspWidth N σ))

/-- The coefficient of `2 sqrt(y) K` at a nonzero cusp frequency, fixed by its large-height
limit. The value is junk when the limit fails to exist. -/
def fourierCoefficientAt (N : ℕ) (σ : SL(2, ℤ)) (f : ℍ → ℂ) (v : ℝ) : ℂ :=
  limUnder atTop (fun y : ℝ => (Real.sqrt (|v| / cuspWidth N σ) : ℂ) *
    (Real.exp (2 * π * |v| * y / cuspWidth N σ) : ℂ) * fourierModeAt N σ f v y)

/-- At every cusp, every nonzero allowed frequency has the decaying Bessel mode, for
both real and imaginary orders. The multiplier determines the shifted frequency lattice. -/
theorem fourierMode_eq (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ}
    {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) (σ : SL(2, ℤ))
    (κ : ℝ) (hκ : 0 ≤ κ ∧ κ < 1)
    (hm : cuspMultiplier N χ σ = cexp (2 * π * I * κ)) (n : ℤ)
    (hn : κ + n ≠ 0) {y : ℝ} (hy : 0 < y) :
    fourierModeAt N σ f (κ + n) y =
      fourierCoefficientAt N σ f (κ + n) * 2 * Real.sqrt y *
        ∫ t in Set.Ioi (0 : ℝ),
          (Real.exp (-(2 * π * |κ + n| * y / cuspWidth N σ) * Real.cosh t) : ℂ) *
            Complex.cosh (besselOrder lam * t) := by
  sorry

/-- The all-cusp shifted Fourier expansion sums to the original cusp form. At regular cusps
the zero mode vanishes; at irregular cusps the frequency lattice has no zero. -/
theorem hasSum_fourierMode (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ}
    {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) (σ : SL(2, ℤ))
    (κ : ℝ) (hκ : 0 ≤ κ ∧ κ < 1)
    (hm : cuspMultiplier N χ σ = cexp (2 * π * I * κ)) (x y : ℝ) (hy : 0 < y) :
    HasSum (fun n : ℤ => fourierModeAt N σ f (κ + n) y *
      cexp (2 * π * I * (κ + n) * x / cuspWidth N σ)) (f (σ • pt x y)) := by
  sorry

/-- `README.md`, Layer 2, 2.4. The trivial bound `|a_f(n)| ≤ C_f √|n|`. -/
theorem fourierCoefficient_le (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ}
    {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) :
    ∃ C : ℝ, ∀ n : ℤ, ‖fourierCoefficient f n‖ ≤ C * Real.sqrt |(n : ℝ)| := by
  sorry

/-- `README.md`, Layer 2, 2.4. The coefficients at `∞` determine a cusp form. -/
theorem fourierCoefficient_injective (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ)
    {f g : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) (hg : g ∈ maassCuspSpace N χ lam)
    (h : ∀ n : ℤ, n ≠ 0 → fourierCoefficient f n = fourierCoefficient g n) : f = g := by
  sorry

/-- `README.md`, Layer 2, 2.4. Exponential decay at `∞`: `f(x + iy) = O(e^{-2πy})` uniformly in
`x`. -/
theorem decay_atImInfty (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ}
    {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) :
    ∃ C : ℝ, ∀ x y : ℝ, 1 ≤ y → ‖f (pt x y)‖ ≤ C * Real.exp (-(2 * π * y)) := by
  sorry

/-! ## Layer 3: the cuspidal spectrum -/

/-- `README.md`, Layer 3, 3.4. Finite multiplicity: each cusp eigenspace is finite-dimensional
(compact resolvent on the cuspidal subspace of `Γ(N)`, restricted to the `χ`-isotypic part). This is
the LMFDB knowl `mf.maass.mwf.dimension`. -/
theorem finiteDimensional_maassCuspSpace (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) :
    FiniteDimensional ℂ (maassCuspSpace N χ lam) := by
  sorry

/-- `README.md`, Layer 3, 3.4. Discreteness: only finitely many cuspidal eigenvalues below any
bound. -/
theorem cuspidalSpectrum_finite (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (T : ℝ) :
    {lam : ℝ | lam ≤ T ∧ maassCuspSpace N χ lam ≠ ⊥}.Finite := by
  sorry

/-- `README.md`, Layer 3, 3.4. The cuspidal eigenvalue counting function
`N(T) = Σ_{λ ≤ T} dim S(N, χ, λ)`; the `∑ᶠ` has finite support by `cuspidalSpectrum_finite`. -/
def cuspCount (N : ℕ) (χ : DirichletCharacter ℂ N) (T : ℝ) : ℕ :=
  ∑ᶠ (lam : ℝ) (_ : lam ≤ T), Module.finrank ℂ (maassCuspSpace N χ lam)

/-! ## Layer 4: Hecke operators, the reflection, Fricke, newforms -/

/-- `README.md`, Layer 4, 4.1. The unitarily normalized Hecke operator
`Tₙ f(z) = n^{-1/2} Σ_{ad = n} χ(a) Σ_{b mod d} f((az + b)/d)`, with `χ(a) = 0` for `(a, N) > 1`.
At `N = 1` it is `maassHecke(n)` of AutomorphicFormsOnReductiveGroups §4.5. -/
def heckeOperator (N : ℕ) (χ : DirichletCharacter ℂ N) (n : ℕ) (f : ℍ → ℂ) : ℍ → ℂ := fun z =>
  (Real.sqrt n : ℂ)⁻¹ * ∑ ad ∈ n.divisorsAntidiagonal, χ (ad.1 : ZMod N) *
    ∑ b ∈ Finset.range ad.2, f (ofComplex (((ad.1 : ℂ) * (z : ℂ) + b) / ad.2))

/-- `README.md`, Layer 4, 4.1. `Tₙ` preserves `S(N, χ, λ)`. -/
theorem heckeOperator_mem (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) (n : ℕ)
    (hn : 0 < n) {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) :
    heckeOperator N χ n f ∈ maassCuspSpace N χ lam := by
  sorry

/-- `README.md`, Layer 4, 4.1. The coefficient formula
`a_{Tₙ f}(m) = Σ_{d ∣ (m, n)} χ(d) a_f(mn/d²)`. -/
theorem fourierCoefficient_heckeOperator (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ)
    (n : ℕ) (hn : 0 < n) {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) (m : ℤ) (hm : m ≠ 0) :
    fourierCoefficient (heckeOperator N χ n f) m =
      ∑ d ∈ (Nat.gcd m.natAbs n).divisors, χ (d : ZMod N) * fourierCoefficient f (m * n / (d ^ 2)) := by
  sorry

/-- `README.md`, Layer 4, 4.1. Multiplicativity `Tₘ Tₙ = Σ_{d ∣ (m, n)} χ(d) T_{mn/d²}` on automorphic
functions. -/
theorem heckeOperator_mul (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (m n : ℕ) (hm : 0 < m)
    (hn : 0 < n) {f : ℍ → ℂ} (hf : IsAutomorphic N χ f) :
    heckeOperator N χ m (heckeOperator N χ n f) =
      ∑ d ∈ (Nat.gcd m n).divisors, χ (d : ZMod N) • heckeOperator N χ (m * n / d ^ 2) f := by
  sorry

/-- `README.md`, Layer 4, 4.2. Adjointness `⟨Tₙ f, g⟩ = χ(n) ⟨f, Tₙ g⟩` for `(n, N) = 1`: the adjoint
of `Tₙ` is `χ̄(n) Tₙ`, so an eigenform has `conj λ_f(n) = χ̄(n) λ_f(n)`. -/
theorem petersson_heckeOperator (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) (n : ℕ)
    (hn : n.Coprime N) {f g : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam)
    (hg : g ∈ maassCuspSpace N χ lam) :
    petersson N (heckeOperator N χ n f) g =
      χ (n : ZMod N) * petersson N f (heckeOperator N χ n g) := by
  sorry

/-- `README.md`, Layer 4, 4.3. The reflection `(ιf)(z) = f(-z̄)`. -/
def reflection (f : ℍ → ℂ) : ℍ → ℂ := fun z => f (ofComplex (-(starRingEnd ℂ) (z : ℂ)))

/-- `README.md`, Layer 4, 4.3. Even and odd forms; the LMFDB's `symmetry`. -/
def IsEven (f : ℍ → ℂ) : Prop := reflection f = f

/-- `README.md`, Layer 4, 4.3. An odd form, `ιf = -f`; it vanishes on the imaginary axis. -/
def IsOdd (f : ℍ → ℂ) : Prop := reflection f = -f

/-- `README.md`, Layer 4, 4.4. The Fricke operator `(W_N f)(z) = f(-1/(Nz))`, the weight-`0` raw
slash by the Fricke matrix `[0, -1; N, 0]` of the modular-forms roadmap. -/
def frickeOperator (N : ℕ) (f : ℍ → ℂ) : ℍ → ℂ := fun z => f (ofComplex (-1 / (N * (z : ℂ))))

/-- `README.md`, Layer 4, 4.5. Level raising `B_d f = f(d ·)`. -/
def levelRaising (d : ℕ) (f : ℍ → ℂ) : ℍ → ℂ := fun z => f (ofComplex (d * (z : ℂ)))

/-- `README.md`, Layer 4, 4.5. Level raising as a `ℂ`-linear map on `ℍ → ℂ`. -/
def levelRaisingLinear (d : ℕ) : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ) where
  toFun := levelRaising d
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- `README.md`, Layer 4, 4.5. The oldspace: the span of the level-raised cusp forms of proper
levels `M ∣ N` whose character induces `χ`. -/
def oldSpace (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) : Submodule ℂ (ℍ → ℂ) :=
  ⨆ (M : ℕ) (hM : M ∣ N) (_ : M ≠ N) (_ : 0 < M) (χ' : DirichletCharacter ℂ M)
    (_ : DirichletCharacter.changeLevel hM χ' = χ) (d : ℕ) (_ : d ∣ N / M),
    (maassCuspSpace M χ' lam).map (levelRaisingLinear d)

/-- `README.md`, Layer 4, 4.5. The oldspace lies in the cusp space: `B_d` maps `S(M, χ', λ)` into
`S(N, χ, λ)` for `M ∣ N`, `changeLevel χ' = χ`, `d ∣ N/M`. -/
theorem oldSpace_le_maassCuspSpace (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) :
    oldSpace N χ lam ≤ maassCuspSpace N χ lam := by
  sorry

/-- `README.md`, Layer 0, 0.5. Additivity of the Petersson product in the first slot on the cusp
space, where every integrand `f ḡ` is integrable on every fundamental domain. -/
theorem petersson_add_left {N : ℕ} {χ : DirichletCharacter ℂ N} {lam : ℝ} {f f' g : ℍ → ℂ}
    (hf : f ∈ maassCuspSpace N χ lam) (hf' : f' ∈ maassCuspSpace N χ lam)
    (hg : g ∈ maassCuspSpace N χ lam) :
    petersson N (f + f') g = petersson N f g + petersson N f' g := by
  sorry

/-- `README.md`, Layer 4, 4.5. The newspace: the Petersson-orthogonal complement of the oldspace
inside `S(N, χ, λ)`. -/
def newSpace (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) : Submodule ℂ (ℍ → ℂ) where
  carrier := {f | f ∈ maassCuspSpace N χ lam ∧ ∀ g ∈ oldSpace N χ lam, petersson N f g = 0}
  add_mem' := fun {f f'} hf hf' => ⟨add_mem hf.1 hf'.1, fun g hg => by
    rw [petersson_add_left hf.1 hf'.1 (oldSpace_le_maassCuspSpace N χ lam hg), hf.2 g hg,
      hf'.2 g hg, add_zero]⟩
  zero_mem' := ⟨zero_mem _, fun g _ => petersson_zero_left N g⟩
  smul_mem' c f hf := ⟨Submodule.smul_mem _ c hf.1, fun g hg => by
    rw [petersson_smul_left, hf.2 g hg, mul_zero]⟩

/-- `README.md`, Layer 4, 4.5. A newform: a normalized (`a(1) = 1`) element of the newspace that is
an eigenvector of every good Hecke operator. -/
def IsNewform (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) (f : ℍ → ℂ) : Prop :=
  f ∈ newSpace N χ lam ∧ fourierCoefficient f 1 = 1 ∧
    ∀ n : ℕ, n.Coprime N → ∃ c : ℂ, heckeOperator N χ n f = c • f

/-- `README.md`, Layer 4, 4.6 (i). A newform is an eigenvector of every `Tₙ`, with eigenvalue its
`n`-th coefficient: the LMFDB's `coefficients` column. -/
theorem IsNewform.heckeOperator_eq {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    {f : ℍ → ℂ} (hf : IsNewform N χ lam f) (n : ℕ) (hn : 0 < n) :
    heckeOperator N χ n f = fourierCoefficient f n • f := by
  sorry

/-- `README.md`, Layer 4, 4.6 (i). Hecke multiplicativity of the coefficients of a newform. -/
theorem IsNewform.fourierCoefficient_mul {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    {f : ℍ → ℂ} (hf : IsNewform N χ lam f) (m n : ℕ) (hm : 0 < m) (hn : 0 < n) :
    fourierCoefficient f m * fourierCoefficient f n =
      ∑ d ∈ (Nat.gcd m n).divisors, χ (d : ZMod N) * fourierCoefficient f (m * n / d ^ 2) := by
  sorry

/-- Strong multiplicity one for normalized newforms, across levels, characters and
archimedean eigenvalues: almost all prime coefficients determine the form and its level. -/
theorem IsNewform.eq_of_eventually_eq {N M : ℕ} [NeZero N] [NeZero M]
    {χ : DirichletCharacter ℂ N} {ψ : DirichletCharacter ℂ M} {lam mu : ℝ}
    {f g : ℍ → ℂ} (hf : IsNewform N χ lam f) (hg : IsNewform M ψ mu g)
    (h : ∀ᶠ p : ℕ in atTop, p.Prime → fourierCoefficient f p = fourierCoefficient g p) :
    N = M ∧ lam = mu ∧ f = g ∧
      ∀ a : ℤ, χ (a : ZMod N) = ψ (a : ZMod M) := by
  sorry

/-- At a prime dividing the newform level, equality of the level and character conductor
exponents gives a coefficient of modulus one, including ramified nebentypus. -/
theorem IsNewform.norm_fourierCoefficient_of_conductor {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f)
    {p : ℕ} (hp : p.Prime) (hpN : p ∣ N)
    (hc : χ.conductor.factorization p = N.factorization p) :
    ‖fourierCoefficient f p‖ = 1 := by
  sorry

/-- At a prime exactly dividing the level and not the character conductor, the square
of the coefficient is the prime-to-p character value divided by p. The primitive character
has modulus prime to p here, so its value at p equals that of the prime-to-p component. -/
theorem IsNewform.fourierCoefficient_sq_of_unramified {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f)
    {p : ℕ} (hp : p.Prime) (hpN : p ∣ N) (hp2 : ¬ p ^ 2 ∣ N)
    (hc : ¬ p ∣ χ.conductor) :
    fourierCoefficient f p ^ 2 = χ.primitiveCharacter (p : ZMod χ.conductor) / (p : ℂ) := by
  sorry

/-- At a prime whose level exponent is at least two and exceeds the character conductor
exponent, the normalized newform coefficient vanishes. -/
theorem IsNewform.fourierCoefficient_eq_zero_of_conductor_lt {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f)
    {p : ℕ} (hp : p.Prime) (hp2 : p ^ 2 ∣ N)
    (hc : χ.conductor.factorization p < N.factorization p) :
    fourierCoefficient f p = 0 := by
  sorry

/-- `README.md`, Layer 4, 4.6 (v). The Fricke sign of a newform with trivial character: `+1` when
`W_N f = f` and `-1` otherwise (junk off the newforms); `frickeOperator_eq_frickeSign_smul` proves
that `W_N f = ±f` for a newform. It is the LMFDB's `fricke_eigenvalue` (whose stored `0` encodes
"not computed", not a value). -/
def frickeSign (N : ℕ) (f : ℍ → ℂ) : ℤ := by
  classical exact if frickeOperator N f = f then 1 else -1

/-- `README.md`, Layer 4, 4.6 (v). The law pinning `frickeSign`: a newform with trivial character is
a `W_N`-eigenvector with eigenvalue `frickeSign N f ∈ {±1}`. -/
theorem frickeOperator_eq_frickeSign_smul {N : ℕ} [NeZero N] {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform N 1 lam f) :
    frickeOperator N f = (frickeSign N f : ℂ) • f ∧ frickeSign N f ^ 2 = 1 := by
  sorry

/-- `README.md`, Layer 4, 4.6 (iii) and 4.3. A newform has a parity: its joint eigenspace for the
good `Tₙ` in the newspace is one-dimensional and `ι`-stable. -/
theorem IsNewform.isEven_or_isOdd {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    {f : ℍ → ℂ} (hf : IsNewform N χ lam f) : IsEven f ∨ IsOdd f := by
  sorry

/-! ## Layer 5: Selberg's `3/16`, the eigenvalue conjecture, Weyl's law -/

/-- `README.md`, Layer 5, 5.3. **Selberg's theorem**: every cuspidal eigenvalue of `(Γ₀(N), χ)` is at
least `3/16`; equivalently every exceptional parameter `t` satisfies `t ≤ 1/4`. A nonzero Maass cusp
form is a bounded nonconstant `Γ₁(N)`-invariant eigenfunction, so the congruence spectral gap
roadmap's `congruence_eigenvalue_bound` at `Gamma1 N` gives `21/100 ≤ lam`. -/
theorem selberg_three_sixteenths (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ}
    (h : maassCuspSpace N χ lam ≠ ⊥) : 3 / 16 ≤ lam := by
  sorry

/-- `README.md`, Layer 5, 5.4. Roelcke's bound at level one, `λ₁(SL₂(ℤ)) ≥ 3π²/2`, from the
standard fundamental domain and Parseval on the strip `{|x| ≤ 1/2, y ≥ √3/2}`. -/
theorem levelOne_eigenvalue_ge {lam : ℝ} (h : maassCuspSpace 1 1 lam ≠ ⊥) :
    3 * π ^ 2 / 2 ≤ lam := by
  sorry

/-- `README.md`, Layer 5, 5.5. Weyl's law for the cuspidal spectrum of `(Γ₀(N), χ)`:
`N(T) ∼ (vol(Γ₀(N)\ℍ)/(4π)) T = ([SL₂(ℤ) : Γ₀(N)]/12) T`; at `N = 1` this is `T/12`, the
`modular_weyl_estimates` of AutomorphicSpectralTheory §4.9. -/
theorem weyl_law (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (hχ : χ (-1) = 1) :
    Tendsto (fun T : ℝ => (cuspCount N χ T : ℝ) / T) atTop (𝓝 (((Gamma0 N).index : ℝ) / 12)) := by
  sorry

/-! ## Layer 6: the `L`-function of a Hecke–Maass newform -/

/-- `README.md`, Layer 6, 6.1. `L(s, f) = Σ a_f(n) n^{-s}`, Mathlib's `LSeries` of the normalized
coefficients (which ignores `n = 0`). -/
def lfunction (f : ℍ → ℂ) (s : ℂ) : ℂ := LSeries (fun n : ℕ => fourierCoefficient f n) s

/-- `README.md`, Layer 6, 6.1. Absolute convergence for `Re s > 1`, from the positive Rankin–Selberg self-pair. -/
theorem lfunction_summable {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform N χ lam f) {s : ℂ} (hs : 1 < s.re) :
    LSeriesSummable (fun n : ℕ => fourierCoefficient f n) s := by
  sorry

/-- `README.md`, Layer 6, 6.1. The Euler product `L(s, f) = ∏_p (1 - a(p) p^{-s} + χ(p) p^{-2s})⁻¹`
on `Re s > 1`. -/
theorem lfunction_eulerProduct {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    {f : ℍ → ℂ} (hf : IsNewform N χ lam f) {s : ℂ} (hs : 1 < s.re) :
    HasProd (fun p : Nat.Primes =>
      (1 - fourierCoefficient f ((p : ℕ) : ℤ) * ((p : ℕ) : ℂ) ^ (-s) +
        χ ((p : ℕ) : ZMod N) * ((p : ℕ) : ℂ) ^ (-2 * s))⁻¹)
      (lfunction f s) := by
  sorry

/-- `README.md`, Layer 6, 6.2. The parity `δ ∈ {0, 1}` of a form (`0` even, `1` odd; junk
otherwise). -/
def parity (f : ℍ → ℂ) : ℕ := by classical exact if IsEven f then 0 else 1

/-- `README.md`, Layer 6, 6.2. The completed `L`-function `Λ(s, f)`: the entire function that agrees
with `N^{s/2} Γ_ℝ(s + δ + ir) Γ_ℝ(s + δ - ir) L(s, f)` on `Re s > 1` (unique by the identity
theorem), chosen classically, and that product itself when no entire extension exists. For an
exceptional eigenvalue the chosen order is `t = √(1/4 - λ)`; changing its sign exchanges the gamma factors. -/
def completedLFunction (N : ℕ) (lam : ℝ) (f : ℍ → ℂ) : ℂ → ℂ :=
  let ir : ℂ := besselOrder lam
  let Λ₀ : ℂ → ℂ := fun s => (N : ℂ) ^ (s / 2) * Gammaℝ (s + parity f + ir) *
    Gammaℝ (s + parity f - ir) * lfunction f s
  by classical exact
    if h : ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧ ∀ s : ℂ, 1 < s.re → Λ s = Λ₀ s then h.choose
    else Λ₀

/-- `README.md`, Layer 6, 6.2. `Λ(·, f)` is entire. -/
theorem differentiable_completedLFunction {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f) :
    Differentiable ℂ (completedLFunction N lam f) := by
  sorry

/-- Conjugate reflection has the conjugate positive Fourier coefficients and the conjugate
nebentypus, with first coefficient one when the original newform is normalized. -/
def conjugateReflection (f : ℍ → ℂ) : ℍ → ℂ := fun z => star (reflection f z)

/-- The completed functional equation for every nebentypus, including exceptional eigenvalues.
The Fricke pseudo-eigenvalue has modulus one and multiplies the conjugate-reflection newform. -/
theorem completedLFunction_functional_equation {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f) :
    ∃ c : ℂ, ‖c‖ = 1 ∧ frickeOperator N f = c • conjugateReflection f ∧
      ∀ s : ℂ, completedLFunction N lam f s =
        c * (-1) ^ parity f * completedLFunction N lam (conjugateReflection f) (1 - s) := by
  sorry

/-! ## Layer 8: the LMFDB layer -/

/-- `README.md`, Layer 8, 8.3. The a-posteriori lemma behind a certificate: a smooth cuspidal
automorphic `g` with `‖(Δ - λ₀) g‖ ≤ η ‖g‖` (Petersson norms) locates a cuspidal eigenvalue within
`η` of `λ₀`, by the resolvent bound for the self-adjoint cuspidal restriction. -/
theorem exists_eigenvalue_near (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam₀ η : ℝ)
    (hη : 0 ≤ η) (g : ℍ → ℂ) (hg : IsSmoothOnUpperHalfPlane g) (ha : IsAutomorphic N χ g)
    (hc : IsCuspidal N g) (h2 : IsSquareIntegrable N g)
    (h2' : IsSquareIntegrable N (hyperbolicLaplacian g)) (hne : g ≠ 0)
    (hres : ‖petersson N (hyperbolicLaplacian g - lam₀ • g) (hyperbolicLaplacian g - lam₀ • g)‖ ≤
      η ^ 2 * ‖petersson N g g‖) :
    ∃ lam : ℝ, |lam - lam₀| ≤ η ∧ maassCuspSpace N χ lam ≠ ⊥ := by
  sorry

end

end TauCetiRoadmap.MaassForms
