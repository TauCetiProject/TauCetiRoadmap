import Mathlib
import TauCeti.NumberTheory.ModularForms.DiamondOperators
import TauCeti.NumberTheory.ModularForms.Fricke.Matrix
import TauCeti.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
import TauCeti.Analysis.Complex.Fuchsian.Covolume

/-!
# Maass forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: every
definition below has its real body, and only theorem proofs are `sorry`. The other targets (among
them the `K`-Bessel function, the `χ`-isotypic Laplacian, the scattering matrix, the `L`-function
card and the Picard-group layer), with their definitions and Checks, are specified in `README.md`
only. Discharging every declaration here would finish neither a layer nor the roadmap. The bridge
check `setIntegral_normSq_eq_of_isFundamentalDomain` has a real proof, an application of a Mathlib
lemma with the promised instances as binders, so that the elaborator checks the instance list.

The congruence Laplacian on `L²(Γ\ℍ)`, its compact cuspidal resolvent, its spectral description
and the bound `21/100` are consumed from the congruence spectral gap roadmap (see `README.md`,
Layers 3 and 5) and are not declared here; Layer 3 below states their consequences on the carrier.

The carrier is a **weight-`0` Maass cusp form for `Γ₀(N)` with nebentypus `χ`**, a function
`ℍ → ℂ` on Mathlib's `UpperHalfPlane`, cut out by the predicate `IsMaassCuspForm N χ lam` and
packaged as the submodule `maassCuspSpace N χ lam` of `ℍ → ℂ`; `χ : DirichletCharacter ℂ N` is
evaluated at the lower-right entry `Gamma0Map N γ`. The level-one carrier of
AutomorphicFormsOnReductiveGroups §4.5 is the case `N = 1`, trivial `χ`, and is not redeclared.

Conventions visible in the signatures (`README.md`, *Pinned conventions*). The Laplacian is the
**nonnegative** operator `-y²(∂ₓ² + ∂ᵧ²)`, built from Mathlib's `Δ` on `ℂ` as a real inner product
space; eigenvalues are real with `lam = 1/4 + r²`, and `spectralParameter lam = √(lam - 1/4)` is the
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

/-- `README.md`, Layer 0, 0.1. `Δ y^s = s(1 - s) y^s`, the sign check of the convention. -/
theorem hyperbolicLaplacian_im_cpow (s : ℂ) (z : ℍ) :
    hyperbolicLaplacian (fun w => (w.im : ℂ) ^ s) z = s * (1 - s) * (z.im : ℂ) ^ s := by
  sorry

/-- `README.md`, Layer 0, 0.1. Real smoothness of a function on `ℍ`: `f ∘ ofComplex` is `C^∞` on the
open set `{im > 0}` of `ℂ`. This is the regularity every Maass form carries. -/
def IsSmoothOnUpperHalfPlane (f : ℍ → ℂ) : Prop :=
  ContDiffOn ℝ ∞ (fun w : ℂ => f (ofComplex w)) {w : ℂ | 0 < w.im}

/-- `README.md`, Layer 0, 0.2. `Δ` commutes with the Möbius action of `SL(2, ℤ)` on `C²`
functions. -/
theorem hyperbolicLaplacian_comp_smul (f : ℍ → ℂ) (hf : IsSmoothOnUpperHalfPlane f)
    (γ : SL(2, ℤ)) (z : ℍ) :
    hyperbolicLaplacian (fun w => f (γ • w)) z = hyperbolicLaplacian f (γ • z) := by
  sorry

/-- `README.md`, Layer 0, 0.3. Automorphy with nebentypus `χ` at weight `0`:
`f(γz) = χ(d_γ) f(z)` for `γ ∈ Γ₀(N)`, the character evaluated at the lower-right entry. -/
def IsAutomorphic (N : ℕ) (χ : DirichletCharacter ℂ N) (f : ℍ → ℂ) : Prop :=
  ∀ γ : Gamma0 N, ∀ z : ℍ, f (γ • z) = χ (Gamma0Map N γ) * f z

/-- `README.md`, Layer 0, 0.3. The automorphic functions `A(N, χ)` as a submodule of `ℍ → ℂ`. -/
def automorphicSpace (N : ℕ) (χ : DirichletCharacter ℂ N) : Submodule ℂ (ℍ → ℂ) where
  carrier := {f | IsAutomorphic N χ f}
  add_mem' := by
    intro f g hf hg γ z
    simp only [Pi.add_apply, hf γ z, hg γ z, mul_add]
  zero_mem' := by
    intro γ z
    simp
  smul_mem' := by
    intro c f hf γ z
    simp only [Pi.smul_apply, smul_eq_mul, hf γ z]
    ring

/-- `README.md`, Layer 0, 0.3. Comparison with the modular-forms library: a weight-`0` element of
Tau Ceti's nebentypus space `modFormCharSpace 0 χ` (the joint eigenspace of the diamond operators)
is automorphic in the sense above for the Dirichlet character `MulChar.ofUnitHom χ`. -/
theorem isAutomorphic_of_mem_modFormCharSpace (N : ℕ) [NeZero N] (χ : (ZMod N)ˣ →* ℂˣ)
    (f : ModularForm ((Gamma1 N).map (Matrix.SpecialLinearGroup.mapGL ℝ)) 0)
    (hf : f ∈ modFormCharSpace 0 χ) : IsAutomorphic N (MulChar.ofUnitHom χ) ⇑f := by
  sorry

/-- `README.md`, Layer 0, 0.3. The parity lemma: `-I ∈ Γ₀(N)` acts trivially, so a nonzero
automorphic function forces `χ(-1) = 1`. -/
theorem IsAutomorphic.chi_neg_one_eq_one {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {f : ℍ → ℂ} (hf : IsAutomorphic N χ f) (hne : f ≠ 0) : χ (-1) = 1 := by
  sorry

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

/-- `README.md`, Layer 0, 0.4. A cusp is regular for `(Γ₀(N), χ)` when its multiplier is `1`; for
trivial `χ` every cusp is regular, and the cusp `∞` is regular for every `χ`. -/
def IsRegularCusp (N : ℕ) (χ : DirichletCharacter ℂ N) (σ : SL(2, ℤ)) : Prop :=
  cuspMultiplier N χ σ = 1

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

/-- `README.md`, Layer 0, 0.4. The constant term at a regular cusp, `w⁻¹ ∫₀^w f(σ(x + iy)) dx`. -/
def constantTerm (N : ℕ) (f : ℍ → ℂ) (σ : SL(2, ℤ)) (y : ℝ) : ℂ :=
  (cuspWidth N σ : ℂ)⁻¹ * ∫ x in (0 : ℝ)..(cuspWidth N σ : ℝ), f (σ • pt x y)

/-- `README.md`, Layer 0, 0.4. The multiplier is an `N/w`-th root of unity, because
`(1 + acw)^{N/w} ≡ 1 (mod N)`. -/
theorem cuspMultiplier_pow_eq_one (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (σ : SL(2, ℤ)) :
    cuspMultiplier N χ σ ^ (N / cuspWidth N σ) = 1 := by
  sorry

/-- `README.md`, Layer 0, 0.4. For an automorphic function the cusp integral is `N` times the
constant term at a regular cusp and vanishes at an irregular one; hence `IsCuspidal` is exactly
"zero constant term at every regular cusp". -/
theorem isCuspidal_iff (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (f : ℍ → ℂ)
    (hf : IsAutomorphic N χ f) (hc : Continuous f) :
    IsCuspidal N f ↔
      ∀ σ : SL(2, ℤ), IsRegularCusp N χ σ → ∀ y : ℝ, 0 < y → constantTerm N f σ y = 0 := by
  sorry

/-- `README.md`, Layer 0, 0.4. Rejection check: for `N = 9`, the cusp `1/3` (scaling
`σ = [1, 0; 3, 1]`) has width `1`, generator entry `1 + acw = 4`, and is irregular for an even
character of order `3` modulo `9`. -/
theorem not_isRegularCusp_nine (χ : DirichletCharacter ℂ 9) (hχ : χ 4 ≠ 1) :
    ¬ IsRegularCusp 9 χ ⟨!![1, 0; 3, 1], by norm_num [Matrix.det_fin_two_of]⟩ := by
  sorry

/-- `README.md`, Layer 0, 0.5. The image `Γ̄₀(N)` of `Γ₀(N)` in `PSL(2, ℝ)`, the group whose
fundamental domains carry every integral below. `Gamma0 N` itself cannot be used: `-I` acts
trivially on `ℍ`, so `IsFundamentalDomain (Gamma0 N) F volume` holds for no `F`. -/
def gamma0PSL (N : ℕ) : Subgroup PSL(2, ℝ) :=
  (Gamma0 N).map (psl2zToPSL2R.comp (QuotientGroup.mk' (Subgroup.center SL(2, ℤ))))

/-- `README.md`, Layer 0, 0.5. `Γ̄₀(N)` is a cofinite Fuchsian group (Tau Ceti's
`Subgroup.IsCofinite`), so a measurable fundamental domain exists. -/
theorem gamma0PSL_isCofinite (N : ℕ) [NeZero N] : (gamma0PSL N).IsCofinite := by
  sorry

/-- `README.md`, Layer 0, 0.5. Square-integrability on the quotient, through a measurable
fundamental domain of `Γ̄₀(N)` for Mathlib's invariant measure on `ℍ`. -/
def IsSquareIntegrable (N : ℕ) (f : ℍ → ℂ) : Prop :=
  ∃ F : Set ℍ, IsFundamentalDomain (gamma0PSL N) F volume ∧
    IntegrableOn (fun z => ‖f z‖ ^ 2) F volume

/-- `README.md`, Layer 0, 0.5. **Bridge check** (a real proof): the integral of a `Γ₀(N)`-invariant
integrand over a fundamental domain does not depend on the domain, by Mathlib's
`IsFundamentalDomain.setIntegral_eq`, once the invariance of `volume` under the subgroup and the
measurability of its action are available as instances. -/
theorem setIntegral_normSq_eq_of_isFundamentalDomain (N : ℕ) {F F' : Set ℍ}
    [Countable (gamma0PSL N)] [MeasurableSpace (gamma0PSL N)] [MeasurableSMul (gamma0PSL N) ℍ]
    [SMulInvariantMeasure (gamma0PSL N) ℍ (volume : Measure ℍ)]
    (hF : IsFundamentalDomain (gamma0PSL N) F volume)
    (hF' : IsFundamentalDomain (gamma0PSL N) F' volume)
    (f : ℍ → ℂ) (hinv : ∀ γ : gamma0PSL N, ∀ z : ℍ, ‖f (γ • z)‖ ^ 2 = ‖f z‖ ^ 2) :
    ∫ z in F, ‖f z‖ ^ 2 ∂volume = ∫ z in F', ‖f z‖ ^ 2 ∂volume :=
  hF.setIntegral_eq hF' hinv

/-- `README.md`, Layer 0, 0.5. The Petersson inner product `⟨f, g⟩ = ∫_F f ḡ dμ` of weight `0`,
conjugate-linear in the second slot, unnormalized, over a classically chosen measurable fundamental
domain `F` of `Γ̄₀(N)`; `petersson_eq_setIntegral` proves the value is the same on every fundamental
domain for square-integrable automorphic `f, g`. -/
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

/-- `README.md`, Layer 0, 0.5. The Petersson product is the integral over any fundamental domain of
`Γ₀(N)`. -/
theorem petersson_eq_setIntegral (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {F : Set ℍ}
    (hF : IsFundamentalDomain (gamma0PSL N) F volume) {f g : ℍ → ℂ}
    (hf : IsAutomorphic N χ f) (hg : IsAutomorphic N χ g)
    (hf2 : IsSquareIntegrable N f) (hg2 : IsSquareIntegrable N g) :
    petersson N f g = ∫ z in F, f z * (starRingEnd ℂ) (g z) ∂volume := by
  sorry

/-- `README.md`, Layer 0, 0.5. The hyperbolic area of `Γ₀(N)\ℍ` is `(π/3)·[SL(2, ℤ) : Γ₀(N)]`, the
index being `N ∏_{p ∣ N} (1 + 1/p)`. -/
theorem volume_fundamentalDomain (N : ℕ) [NeZero N] {F : Set ℍ}
    (hF : IsFundamentalDomain (gamma0PSL N) F volume) :
    (volume F).toReal = π / 3 * (Gamma0 N).index := by
  sorry

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

/-- `README.md`, Layer 1, 1.1. Maass forms are closed under addition: the Laplacian is linear on
smooth functions, and square-integrability does not depend on the fundamental domain (0.5). -/
theorem IsMaassForm.add {N : ℕ} {χ : DirichletCharacter ℂ N} {lam : ℝ} {f g : ℍ → ℂ}
    (hf : IsMaassForm N χ lam f) (hg : IsMaassForm N χ lam g) : IsMaassForm N χ lam (f + g) := by
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

/-- `README.md`, Layer 1, 1.1. The space `M(N, χ, λ)` of Maass forms, a submodule of `ℍ → ℂ`. -/
def maassSpace (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) : Submodule ℂ (ℍ → ℂ) where
  carrier := {f | IsMaassForm N χ lam f}
  add_mem' := IsMaassForm.add
  zero_mem' := isMaassForm_zero N χ lam
  smul_mem' c _ hf := hf.const_smul c

/-- `README.md`, Layer 1, 1.1. The space `S(N, χ, λ)` of Maass cusp forms. At `N = 1` and trivial
`χ` it is the carrier `MaassCuspForm(SL₂(ℤ), λ)` of AutomorphicFormsOnReductiveGroups §4.5. -/
def maassCuspSpace (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) : Submodule ℂ (ℍ → ℂ) where
  carrier := {f | IsMaassCuspForm N χ lam f}
  add_mem' := IsMaassCuspForm.add
  zero_mem' := isMaassCuspForm_zero N χ lam
  smul_mem' c _ hf := hf.const_smul c

/-- `README.md`, Layer 1, 1.1. Membership in `S(N, χ, λ)` is the predicate `IsMaassCuspForm`. -/
theorem mem_maassCuspSpace {N : ℕ} {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ} :
    f ∈ maassCuspSpace N χ lam ↔ IsMaassCuspForm N χ lam f := Iff.rfl

/-- The carrier is nonvacuous: the zero function is a Maass cusp form for every eigenvalue. -/
example (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) : (0 : ℍ → ℂ) ∈ maassCuspSpace N χ lam :=
  Submodule.zero_mem _

/-- `README.md`, Layer 1, 1.1. The cusp space is zero for an odd character (the parity lemma). -/
theorem maassCuspSpace_eq_bot_of_chi_neg_one {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)
    (hχ : χ (-1) ≠ 1) (lam : ℝ) : maassCuspSpace N χ lam = ⊥ := by
  sorry

/-- `README.md`, Layer 2, 2.5. A nonzero Maass cusp form has a positive eigenvalue: `λ ≥ 0` by
Green's formula on a truncated fundamental domain, and `λ = 0` only for constants. -/
theorem pos_of_maassCuspSpace_ne_bot {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    (h : maassCuspSpace N χ lam ≠ ⊥) : 0 < lam := by
  sorry

/-- `README.md`, Layer 1, 1.2. The spectral parameter `r = √(λ - 1/4)` of a non-exceptional
eigenvalue; this is the LMFDB's column `spectral_parameter` (`R`). -/
def spectralParameter (lam : ℝ) : ℝ := Real.sqrt (lam - 1 / 4)

/-- `README.md`, Layer 1, 1.2. An eigenvalue below `1/4` is exceptional; its parameter is
`t = √(1/4 - λ) ∈ (0, 1/2)`, i.e. `r = it`. -/
def IsExceptional (lam : ℝ) : Prop := lam < 1 / 4

/-- `README.md`, Layer 1, 1.2. The dictionary `λ = 1/4 + r²` for `λ ≥ 1/4`. -/
theorem spectralParameter_sq {lam : ℝ} (h : 1 / 4 ≤ lam) :
    lam = 1 / 4 + spectralParameter lam ^ 2 := by
  rw [spectralParameter, Real.sq_sqrt (by linarith)]
  ring

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

/-- `README.md`, Layer 2, 2.3. The Fourier–Whittaker expansion of a Maass cusp form with
`λ = 1/4 + r²`, `r ≥ 0`, at the cusp `∞`: the `n`-th mode is `a_f(n) · 2√y · K_{ir}(2π|n|y)`, the
Bessel function written as the integral `∫₀^∞ e^{-u cosh t} cos(rt) dt` of §4.5 (for imaginary
order `ir`, `cosh(irt) = cos(rt)`), and the zero mode vanishes. -/
theorem fourierMode_eq (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ} (hlam : 1 / 4 ≤ lam)
    {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) (n : ℤ) (hn : n ≠ 0) {y : ℝ} (hy : 0 < y) :
    fourierMode f n y = fourierCoefficient f n * 2 * Real.sqrt y *
      ∫ t in Set.Ioi (0 : ℝ),
        Real.exp (-(2 * π * |(n : ℝ)| * y) * Real.cosh t) * Real.cos (spectralParameter lam * t) := by
  sorry

/-- `README.md`, Layer 2, 2.3. The expansion converges to `f`: for `z = x + iy`,
`f(z) = Σ_{n ≠ 0} f_n(y) e(nx)`, summably. -/
theorem hasSum_fourierMode (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) {lam : ℝ}
    {f : ℍ → ℂ} (hf : f ∈ maassCuspSpace N χ lam) (x y : ℝ) (hy : 0 < y) :
    HasSum (fun n : ℤ => fourierMode f n y * cexp (2 * π * I * n * x)) (f (pt x y)) := by
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

/-- `README.md`, Layer 4, 4.3. `a_{ιf}(n) = a_f(-n)` for an automorphic `f`: the mode of `ιf` is the
mode integral of `f` over `[-1, 0]`, which the period `1` (`T ∈ Γ₀(N)`, `χ(1) = 1`) moves to
`[0, 1]`; for a non-periodic `f` the identity fails. -/
theorem fourierCoefficient_reflection {N : ℕ} {χ : DirichletCharacter ℂ N} {f : ℍ → ℂ}
    (hf : IsAutomorphic N χ f) (n : ℤ) :
    fourierCoefficient (reflection f) n = fourierCoefficient f (-n) := by
  sorry

/-- `README.md`, Layer 4, 4.3. The reflection preserves `S(N, χ, λ)` and commutes with `Tₙ`. -/
theorem reflection_mem (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (lam : ℝ) {f : ℍ → ℂ}
    (hf : f ∈ maassCuspSpace N χ lam) : reflection f ∈ maassCuspSpace N χ lam := by
  sorry

/-- `README.md`, Layer 4, 4.3. `ι Tₙ = Tₙ ι` on automorphic functions (the reflection sends the
representative `b` to `-b`, and the period `1` re-indexes `b mod d`). -/
theorem reflection_heckeOperator (N : ℕ) (χ : DirichletCharacter ℂ N) (n : ℕ) {f : ℍ → ℂ}
    (hf : IsAutomorphic N χ f) :
    reflection (heckeOperator N χ n f) = heckeOperator N χ n (reflection f) := by
  sorry

/-- `README.md`, Layer 4, 4.4. The Fricke operator `(W_N f)(z) = f(-1/(Nz))`, the weight-`0` raw
slash by the Fricke matrix `[0, -1; N, 0]` of the modular-forms roadmap. -/
def frickeOperator (N : ℕ) (f : ℍ → ℂ) : ℍ → ℂ := fun z => f (ofComplex (-1 / (N * (z : ℂ))))

/-- `README.md`, Layer 4, 4.4. The Fricke operator is the action of Tau Ceti's Fricke matrix
`TauCeti.frickeGL ℝ N = [0, -1; N, 0]` on `ℍ`. -/
theorem frickeOperator_eq_frickeGL_smul (N : ℕ) [NeZero N] (f : ℍ → ℂ) (z : ℍ) :
    frickeOperator N f z = f (TauCeti.frickeGL ℝ N • z) := by
  sorry

/-- `README.md`, Layer 4, 4.4. For trivial character `W_N` is an involution of `S(N, 1, λ)`. -/
theorem frickeOperator_frickeOperator (N : ℕ) [NeZero N] (lam : ℝ) {f : ℍ → ℂ}
    (hf : f ∈ maassCuspSpace N 1 lam) : frickeOperator N (frickeOperator N f) = f := by
  sorry

/-- `README.md`, Layer 4, 4.4. For trivial character `W_N` preserves `S(N, 1, λ)`. -/
theorem frickeOperator_mem (N : ℕ) [NeZero N] (lam : ℝ) {f : ℍ → ℂ}
    (hf : f ∈ maassCuspSpace N 1 lam) : frickeOperator N f ∈ maassCuspSpace N 1 lam := by
  sorry

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
  ⨆ (M : ℕ) (hM : M ∣ N) (_ : M ≠ N) (χ' : DirichletCharacter ℂ M)
    (_ : DirichletCharacter.changeLevel hM χ' = χ) (d : ℕ) (_ : d ∣ N / M),
    (maassCuspSpace M χ' lam).map (levelRaisingLinear d)

/-- `README.md`, Layer 4, 4.5. The oldspace lies in the cusp space: `B_d` maps `S(M, χ', λ)` into
`S(N, χ, λ)` for `M ∣ N`, `changeLevel χ' = χ`, `d ∣ N/M`. -/
theorem oldSpace_le_maassCuspSpace (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) :
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
def newSpace (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) : Submodule ℂ (ℍ → ℂ) where
  carrier := {f | f ∈ maassCuspSpace N χ lam ∧ ∀ g ∈ oldSpace N χ lam, petersson N f g = 0}
  add_mem' := fun {f f'} hf hf' => ⟨add_mem hf.1 hf'.1, fun g hg => by
    rw [petersson_add_left hf.1 hf'.1 (oldSpace_le_maassCuspSpace N χ lam hg), hf.2 g hg,
      hf'.2 g hg, add_zero]⟩
  zero_mem' := ⟨zero_mem _, fun g _ => petersson_zero_left N g⟩
  smul_mem' c f hf := ⟨Submodule.smul_mem _ c hf.1, fun g hg => by
    rw [petersson_smul_left, hf.2 g hg, mul_zero]⟩

/-- `README.md`, Layer 4, 4.5. A newform: a normalized (`a(1) = 1`) element of the newspace that is
an eigenvector of every good Hecke operator. -/
def IsNewform (N : ℕ) (χ : DirichletCharacter ℂ N) (lam : ℝ) (f : ℍ → ℂ) : Prop :=
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

/-- `README.md`, Layer 4, 4.6 (ii). Strong multiplicity one: two newforms of the same level,
character and eigenvalue with equal coefficients at all but finitely many primes are equal. -/
theorem IsNewform.eq_of_eventually_eq {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    {f g : ℍ → ℂ} (hf : IsNewform N χ lam f) (hg : IsNewform N χ lam g)
    (h : ∀ᶠ p : ℕ in atTop, p.Prime → fourierCoefficient f p = fourierCoefficient g p) : f = g := by
  sorry

/-- `README.md`, Layer 4, 4.6 (iv). Bad primes, trivial character: `p ‖ N` gives
`a(p)² = 1/p`, and `p² ∣ N` gives `a(p) = 0`. -/
theorem IsNewform.fourierCoefficient_sq_of_dvd {N : ℕ} [NeZero N] {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform N 1 lam f) {p : ℕ} (hp : p.Prime) (hpN : p ∣ N) (hp2 : ¬ p ^ 2 ∣ N) :
    fourierCoefficient f p ^ 2 = (p : ℂ)⁻¹ := by
  sorry

/-- `README.md`, Layer 4, 4.6 (iv). Bad primes, trivial character: `p² ∣ N` gives `a(p) = 0`. -/
theorem IsNewform.fourierCoefficient_eq_zero_of_sq_dvd {N : ℕ} [NeZero N] {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform N 1 lam f) {p : ℕ} (hp : p.Prime) (hp2 : p ^ 2 ∣ N) :
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

/-- `README.md`, Layer 4, 4.6 (iv)–(v). At `p ‖ N` the coefficient is `-η_p p^{-1/2}` with `η_p` the
`W_p`-eigenvalue, so for a prime level `a(p) = -ε_p p^{-1/2}`. -/
theorem IsNewform.fourierCoefficient_prime_level {p : ℕ} [hp : Fact p.Prime] {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform p 1 lam f) :
    fourierCoefficient f p = -(frickeSign p f : ℂ) * (Real.sqrt p : ℂ)⁻¹ := by
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

/-- `README.md`, Layer 5, 5.4. Selberg's eigenvalue conjecture for `(Γ₀(N), χ)`: no exceptional
cuspidal eigenvalue. -/
def SelbergEigenvalueConjecture (N : ℕ) (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ lam : ℝ, maassCuspSpace N χ lam ≠ ⊥ → 1 / 4 ≤ lam

/-- `README.md`, Layer 5, 5.4. Roelcke's bound at level one, `λ₁(SL₂(ℤ)) ≥ 3π²/2`, from the
standard fundamental domain and Parseval on the strip `{|x| ≤ 1/2, y ≥ √3/2}`. -/
theorem levelOne_eigenvalue_ge {lam : ℝ} (h : maassCuspSpace 1 1 lam ≠ ⊥) :
    3 * π ^ 2 / 2 ≤ lam := by
  sorry

/-- `README.md`, Layer 5, 5.4. Selberg's conjecture holds at level one. -/
theorem selbergEigenvalueConjecture_one : SelbergEigenvalueConjecture 1 1 := by
  intro lam h
  have := levelOne_eigenvalue_ge h
  nlinarith [Real.pi_gt_three]

/-- `README.md`, Layer 5, 5.5. Weyl's law for the cuspidal spectrum of `(Γ₀(N), χ)`:
`N(T) ∼ (vol(Γ₀(N)\ℍ)/(4π)) T = ([SL₂(ℤ) : Γ₀(N)]/12) T`; at `N = 1` this is `T/12`, the
`modular_weyl_estimates` of AutomorphicSpectralTheory §4.9. -/
theorem weyl_law (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) :
    Tendsto (fun T : ℝ => (cuspCount N χ T : ℝ) / T) atTop (𝓝 (((Gamma0 N).index : ℝ) / 12)) := by
  sorry

/-! ## Layer 6: the `L`-function of a Hecke–Maass newform -/

/-- `README.md`, Layer 6, 6.1. `L(s, f) = Σ a_f(n) n^{-s}`, Mathlib's `LSeries` of the normalized
coefficients (which ignores `n = 0`). -/
def lfunction (f : ℍ → ℂ) (s : ℂ) : ℂ := LSeries (fun n : ℕ => fourierCoefficient f n) s

/-- `README.md`, Layer 6, 6.1. Absolute convergence for `Re s > 3/2`, from the trivial bound. -/
theorem lfunction_summable {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform N χ lam f) {s : ℂ} (hs : 3 / 2 < s.re) :
    LSeriesSummable (fun n : ℕ => fourierCoefficient f n) s := by
  sorry

/-- `README.md`, Layer 6, 6.1. The Euler product `L(s, f) = ∏_p (1 - a(p) p^{-s} + χ(p) p^{-2s})⁻¹`
on `Re s > 3/2`. -/
theorem lfunction_eulerProduct {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    {f : ℍ → ℂ} (hf : IsNewform N χ lam f) {s : ℂ} (hs : 3 / 2 < s.re) :
    HasProd (fun p : Nat.Primes =>
      (1 - fourierCoefficient f ((p : ℕ) : ℤ) * ((p : ℕ) : ℂ) ^ (-s) +
        χ ((p : ℕ) : ZMod N) * ((p : ℕ) : ℂ) ^ (-2 * s))⁻¹)
      (lfunction f s) := by
  sorry

/-- `README.md`, Layer 6, 6.2. The parity `δ ∈ {0, 1}` of a form (`0` even, `1` odd; junk
otherwise). -/
def parity (f : ℍ → ℂ) : ℕ := by classical exact if IsEven f then 0 else 1

/-- `README.md`, Layer 6, 6.2. The completed `L`-function `Λ(s, f)`: the entire function that agrees
with `N^{s/2} Γ_ℝ(s + δ + ir) Γ_ℝ(s + δ - ir) L(s, f)` on `Re s > 3/2` (unique by the identity
theorem), chosen classically, and that product itself when no entire extension exists. For an
exceptional eigenvalue `ir = -t` is real, `t = √(1/4 - λ)`. -/
def completedLFunction (N : ℕ) (lam : ℝ) (f : ℍ → ℂ) : ℂ → ℂ :=
  let ir : ℂ := if 1 / 4 ≤ lam then I * spectralParameter lam else -(Real.sqrt (1 / 4 - lam) : ℂ)
  let Λ₀ : ℂ → ℂ := fun s => (N : ℂ) ^ (s / 2) * Gammaℝ (s + parity f + ir) *
    Gammaℝ (s + parity f - ir) * lfunction f s
  by classical exact
    if h : ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧ ∀ s : ℂ, 3 / 2 < s.re → Λ s = Λ₀ s then h.choose
    else Λ₀

/-- `README.md`, Layer 6, 6.2. `Λ(s, f) = N^{s/2} Γ_ℝ(s + δ + ir) Γ_ℝ(s + δ - ir) L(s, f)` for
`Re s > 3/2`, with `r` the spectral parameter. -/
theorem completedLFunction_eq {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} {lam : ℝ}
    (hlam : 1 / 4 ≤ lam) {f : ℍ → ℂ} (hf : IsNewform N χ lam f) {s : ℂ} (hs : 3 / 2 < s.re) :
    completedLFunction N lam f s =
      (N : ℂ) ^ (s / 2) * Gammaℝ (s + parity f + I * spectralParameter lam) *
        Gammaℝ (s + parity f - I * spectralParameter lam) * lfunction f s := by
  sorry

/-- `README.md`, Layer 6, 6.2. `Λ(·, f)` is entire. -/
theorem differentiable_completedLFunction {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f) :
    Differentiable ℂ (completedLFunction N lam f) := by
  sorry

/-- `README.md`, Layer 6, 6.2. The functional equation for trivial character, with root number
`ε_N (-1)^δ`. -/
theorem completedLFunction_functional_equation {N : ℕ} [NeZero N] {lam : ℝ} {f : ℍ → ℂ}
    (hf : IsNewform N 1 lam f) (s : ℂ) :
    completedLFunction N lam f (1 - s) =
      (frickeSign N f : ℂ) * (-1) ^ parity f * completedLFunction N lam f s := by
  sorry

/-- `README.md`, Layer 6, 6.3. The Ramanujan–Petersson conjecture for `f`, as a proposition:
`|a(p)| ≤ 2` at every good prime. -/
def RamanujanPetersson (N : ℕ) (f : ℍ → ℂ) : Prop :=
  ∀ p : ℕ, p.Prime → ¬ p ∣ N → ‖fourierCoefficient f p‖ ≤ 2

/-- `README.md`, Layer 6, 6.3. Under Ramanujan–Petersson, `|a(n)| ≤ τ(n)` by multiplicativity. -/
theorem norm_fourierCoefficient_le_card_divisors {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {lam : ℝ} {f : ℍ → ℂ} (hf : IsNewform N χ lam f) (hR : RamanujanPetersson N f) (n : ℕ)
    (hn : 0 < n) : ‖fourierCoefficient f n‖ ≤ n.divisors.card := by
  sorry

/-! ## Layer 8: the LMFDB layer -/

/-- `README.md`, Layer 8, 8.2. Multiplicity one for `(N, χ)`: at most one newform per eigenvalue.
The LMFDB's `mf.maass.label` knowl conjectures it for squarefree level; the roadmap reads the
conjecture for trivial `χ`. -/
def MultiplicityOne (N : ℕ) (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ lam : ℝ, ∀ f g : ℍ → ℂ, IsNewform N χ lam f → IsNewform N χ lam g → f = g

/-- `README.md`, Layer 8, 8.3. A Maass certificate for `(N, χ)`: an interval for the spectral
parameter, a parity, a Fricke sign, and finitely many coefficient intervals. -/
structure Certificate where
  /-- The centre of the spectral-parameter interval. -/
  R₀ : ℝ
  /-- Its half-width. -/
  ε : ℝ
  /-- The parity, `0` even, `1` odd. -/
  δ : ℕ
  /-- The Fricke sign. -/
  fricke : ℤ
  /-- The centres of the coefficient intervals, `n = 1, …, M`. -/
  c : ℕ → ℝ
  /-- Their half-widths. -/
  e : ℕ → ℝ
  /-- The number of certified coefficients. -/
  M : ℕ

/-- `README.md`, Layer 8, 8.3. What a certificate for `(N, 1)` proves: exactly one newform with
spectral parameter in the interval, and it has the stated parity, Fricke sign and coefficients
within the stated intervals. The rows of the LMFDB's `maass_rigor` table assert this proposition. -/
def CertifiesNewform (N : ℕ) (cert : Certificate) : Prop :=
  (∃! f : ℍ → ℂ, ∃ lam : ℝ, IsNewform N 1 lam f ∧ 1 / 4 ≤ lam ∧
      |spectralParameter lam - cert.R₀| ≤ cert.ε) ∧
    ∀ (f : ℍ → ℂ) (lam : ℝ), IsNewform N 1 lam f → 1 / 4 ≤ lam →
      |spectralParameter lam - cert.R₀| ≤ cert.ε →
        parity f = cert.δ ∧ frickeSign N f = cert.fricke ∧
          ∀ n : ℕ, 1 ≤ n → n ≤ cert.M → ‖fourierCoefficient f n - cert.c n‖ ≤ cert.e n

/-- `README.md`, Layer 8, 8.3. A completeness certificate: the number of cuspidal eigenvalues up to
`1/4 + R²`, with multiplicity, is `k`. -/
def CertifiesCount (N : ℕ) (χ : DirichletCharacter ℂ N) (R : ℝ) (k : ℕ) : Prop :=
  cuspCount N χ (1 / 4 + R ^ 2) = k

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
