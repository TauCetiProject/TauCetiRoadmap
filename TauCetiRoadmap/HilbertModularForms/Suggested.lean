module

import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.NormCoeff
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite
import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# Hilbert modular forms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
Fourier expansion, Koecher, nonparallel cuspidality, finite dimensionality, coefficient bound
and absolute L-series convergence theorems against the pinned Mathlib and Tau Ceti APIs.
The real definitions below describe the analytic function carriers required by those statements;
their parallel specialization is compared with the supplier in README.md, Scope and ownership.

The other headlines are not statable at these pins: the cusp–Eisenstein decomposition lacks
constructed Hilbert Eisenstein series; the classical–adelic dictionary lacks the adelic Hilbert
form carrier and comparison; newform decomposition and coefficient-field rationality lack the
Hilbert Hecke operators and newform carrier; the functional equation and card comparison lack
the completed Hilbert L-function and card; twisting, CM induction, base change, Doi–Naganuma
and Jacquet–Langlands lack these Hilbert newforms and their transfer maps. They are specified
in README.md without substitute signatures here. Finite nebentypus comparison also requires
its character carrier and is not asserted by the unramified signatures below.

The arithmetic slash and normalized ideal coefficients use README.md's conventions. Full
expansion injectivity retains the standard constant on every component; positive coefficients
alone detect cusp forms. Degree at least two and nonzero level are explicit wherever needed.
-/

noncomputable section

open NumberField UpperHalfPlane IsDedekindDomain TauCeti
open scoped UpperHalfPlane nonZeroDivisors

namespace TauCetiRoadmap.HilbertModularForms

variable (F : Type*) [Field F] [NumberField F] [IsTotallyReal F]

/-! ## Layer 0: the domain, the group, the slash action, holomorphy -/

/-- `ℍ^Σ`, one upper half-plane per infinite place of `F` (`README.md`, Layer 0, 0.1). -/
abbrev UpperHalfSpace := InfinitePlace F → ℍ

/-- The real embedding `σ_w : F →+* ℝ` at the (real) infinite place `w` (`README.md`, Layer 0,
0.1); `Standing hypotheses`. -/
def realEmbedding (w : InfinitePlace F) : F →+* ℝ :=
  InfinitePlace.embedding_of_isReal (IsTotallyReal.isReal w)

/-- `σ_w` on `GL₂`, `GL (Fin 2) F →* GL (Fin 2) ℝ` (`README.md`, Layer 0, 0.1). -/
def toGLReal (w : InfinitePlace F) : GL (Fin 2) F →* GL (Fin 2) ℝ :=
  Matrix.GeneralLinearGroup.map (realEmbedding F w)

/-- `GL₂⁺(F)`, the matrices of totally positive determinant (`README.md`, Layer 0, 0.1). The
closure proofs are bridge checks of Tau Ceti's `IsTotallyPositive` API. -/
def GL2Pos : Subgroup (GL (Fin 2) F) where
  carrier := {γ | IsTotallyPositive ((Matrix.GeneralLinearGroup.det γ : Fˣ) : F)}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simpa only [Set.mem_ofPred_eq, map_mul, Units.val_mul] using
      IsTotallyPositive.mul (K := F) ha hb
  inv_mem' {a} ha := by
    simpa only [Set.mem_ofPred_eq, map_inv, Units.val_inv_eq_inv_val] using
      IsTotallyPositive.inv (K := F) ha

/-- The determinant of `γ ∈ GL₂⁺(F)` as an element of `F`. -/
def det₀ (γ : GL2Pos F) : F := ((Matrix.GeneralLinearGroup.det (γ : GL (Fin 2) F) : Fˣ) : F)

/-- The `(i, j)` entry of `γ ∈ GL₂⁺(F)`. -/
def entry (γ : GL2Pos F) (i j : Fin 2) : F := ((γ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) i j

/-- The componentwise action `(γ • z) w = σ_w(γ) • z w` (`README.md`, Layer 0, 0.1). -/
instance upperHalfSpaceSMul : SMul (GL2Pos F) (UpperHalfSpace F) :=
  ⟨fun γ z w => toGLReal F w (γ : GL (Fin 2) F) • z w⟩

omit [NumberField F] in
/-- The component action is the real Möbius action at each place. -/
theorem smul_apply (γ : GL2Pos F) (z : UpperHalfSpace F) (w : InfinitePlace F) :
    (γ • z) w = toGLReal F w (γ : GL (Fin 2) F) • z w := rfl

/-- `GL₂⁺(F)` acts on `ℍ^Σ` (`README.md`, Layer 0, 0.1); a bridge check of Mathlib's
`UpperHalfPlane.glAction` through `Matrix.GeneralLinearGroup.map`. -/
instance upperHalfSpaceMulAction : MulAction (GL2Pos F) (UpperHalfSpace F) where
  one_smul z := funext fun w => by rw [smul_apply, OneMemClass.coe_one, map_one, one_smul]
  mul_smul γ δ z := funext fun w => by
    rw [smul_apply, smul_apply, smul_apply, Subgroup.coe_mul, map_mul, mul_smul]

/-- A weight `k ∈ ℤ^Σ` with all `k_w` of one parity (`README.md`, Layer 0, 0.3). -/
structure Weight where
  /-- The weight at each place. -/
  k : InfinitePlace F → ℤ
  /-- The parity condition. -/
  parity : ∀ v w, Even (k v - k w)

namespace Weight

variable {F}

/-- `k` is parallel (`README.md`, Layer 0, 0.3). -/
def IsParallel (k : Weight F) : Prop := ∃ a, ∀ w, k.k w = a

/-- `k₀ := max_w k_w` (`README.md`, Layer 0, 0.3). -/
def top (k : Weight F) : ℤ := Finset.univ.sup' Finset.univ_nonempty k.k

/-- `m_w := (k₀ - k_w)/2` (`README.md`, Layer 0, 0.3). -/
def m (k : Weight F) (w : InfinitePlace F) : ℤ := (k.top - k.k w) / 2

end Weight

/-- The weight-`k` slash in the arithmetic normalization (`README.md`, Layer 0, 0.3; *Pinned
conventions*, Slash). -/
def slash (k : Weight F) (γ : GL2Pos F) (f : UpperHalfSpace F → ℂ) : UpperHalfSpace F → ℂ :=
  fun z => (∏ w, (((realEmbedding F w (det₀ F γ) : ℝ) : ℂ) ^ (k.k w + k.m w - 1) *
    (denom (toGLReal F w (γ : GL (Fin 2) F)) (z w)) ^ (-(k.k w)))) * f (γ • z)

variable {F}

/-- The arithmetic slash preserves addition. -/
theorem slash_add (k : Weight F) (γ : GL2Pos F) (f g : UpperHalfSpace F → ℂ) :
    slash F k γ (f + g) = slash F k γ f + slash F k γ g := by
  funext z
  simp only [slash, Pi.add_apply, mul_add]

/-- The arithmetic slash preserves complex scalar multiplication. -/
theorem slash_smul (k : Weight F) (γ : GL2Pos F) (a : ℂ) (f : UpperHalfSpace F → ℂ) :
    slash F k γ (a • f) = a • slash F k γ f := by
  funext z
  simp only [slash, Pi.smul_apply, smul_eq_mul]
  ring

/-- The arithmetic slash preserves zero. -/
theorem slash_zero (k : Weight F) (γ : GL2Pos F) : slash F k γ 0 = 0 := by
  funext z
  simp only [slash, Pi.zero_apply, mul_zero]

variable (F)

/-- Holomorphy on `ℍ^Σ`, as differentiability of the coordinatewise `ofComplex` extension on the
open polyhalf-plane (`README.md`, Layer 0, 0.2; *Pinned conventions*, Holomorphy). -/
def IsHolomorphic (f : UpperHalfSpace F → ℂ) : Prop :=
  DifferentiableOn ℂ (fun z : InfinitePlace F → ℂ => f fun w => ofComplex (z w))
    {z | ∀ w, 0 < (z w).im}

/-- `Tr(μz) = Σ_w σ_w(μ) z_w` (`README.md`, Layer 2, 2.1). -/
def tracePairing (μ : F) (z : UpperHalfSpace F) : ℂ :=
  ∑ w, ((realEmbedding F w μ : ℝ) : ℂ) * (z w : ℂ)

/-- `e(Tr(μz)) = exp(2πi Tr(μz))` (`README.md`, Layer 2, 2.1). -/
def expTrace (μ : F) (z : UpperHalfSpace F) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * tracePairing F μ z)

/-! ## Layer 1: lattices, the groups `Γ₀(𝔫)_𝔟`, systems of representatives -/

omit [NumberField F] [IsTotallyReal F] in
/-- Matrix multiplication on two-dimensional entries. -/
theorem entry_mul (γ δ : GL2Pos F) (i j : Fin 2) :
    entry F (γ * δ) i j = entry F γ i 0 * entry F δ 0 j + entry F γ i 1 * entry F δ 1 j := by
  simp [entry, Matrix.mul_apply, Fin.sum_univ_two]

omit [NumberField F] [IsTotallyReal F] in
/-- The field-valued determinant preserves products. -/
theorem det₀_mul (γ δ : GL2Pos F) : det₀ F (γ * δ) = det₀ F γ * det₀ F δ := by
  simp [det₀]

omit [NumberField F] [IsTotallyReal F] in
/-- The determinant of an inverse is the inverse determinant. -/
theorem det₀_inv (γ : GL2Pos F) : det₀ F γ⁻¹ = (det₀ F γ)⁻¹ := by
  simp [det₀]

omit [NumberField F] [IsTotallyReal F] in
/-- The inverse matrix has the two-dimensional adjugate formula. -/
theorem entry_inv (γ : GL2Pos F) :
    entry F γ⁻¹ 0 0 = (det₀ F γ)⁻¹ * entry F γ 1 1 ∧
    entry F γ⁻¹ 0 1 = (det₀ F γ)⁻¹ * -entry F γ 0 1 ∧
    entry F γ⁻¹ 1 0 = (det₀ F γ)⁻¹ * -entry F γ 1 0 ∧
    entry F γ⁻¹ 1 1 = (det₀ F γ)⁻¹ * entry F γ 0 0 := by
  simp [entry, det₀, Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two,
    Matrix.GeneralLinearGroup.val_det_apply]

/-- `Γ₀(𝔫)_𝔟 = {(a b; c d) : a, d ∈ 𝒪_F, b ∈ 𝔟⁻¹, c ∈ 𝔫𝔟, det ∈ 𝒪_{F,+}^×}` (`README.md`, Layer 1,
1.2; *Pinned conventions*, Lattice of a component). `𝔫 = ⊤` gives the full group `Γ_𝔟`. -/
def Gamma0 (𝔫 : Ideal (𝓞 F)) (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : Subgroup (GL2Pos F) where
  carrier := {γ |
    entry F γ 0 0 ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) ∧
    entry F γ 1 1 ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) ∧
    entry F γ 0 1 ∈ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) ∧
    entry F γ 1 0 ∈ (𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) ∧
    ∃ u ∈ totallyPositiveIntegerUnits (K := F), algebraMap (𝓞 F) F (u : 𝓞 F) = det₀ F γ}
  one_mem' := by
    refine ⟨?_, ?_, ?_, ?_, 1, one_mem _, by simp [det₀]⟩
    · simp only [entry, OneMemClass.coe_one, Units.val_one, Matrix.one_apply_eq]
      exact FractionalIdeal.one_mem_one _
    · simp only [entry, OneMemClass.coe_one, Units.val_one, Matrix.one_apply_eq]
      exact FractionalIdeal.one_mem_one _
    · simp only [entry, OneMemClass.coe_one, Units.val_one, Matrix.one_apply_ne zero_ne_one]
      exact Submodule.zero_mem (((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) :
        FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F)
    · exact Submodule.zero_mem (((𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) :
        FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F)
  mul_mem' {γ δ} hγ hδ := by
    obtain ⟨a₁, d₁, b₁, c₁, u, hu, hdu⟩ := hγ
    obtain ⟨a₂, d₂, b₂, c₂, v, hv, hdv⟩ := hδ
    have add_mem : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x y : F}, x ∈ I → y ∈ I → x + y ∈ I :=
      fun {I x y} hx hy => (I : Submodule (𝓞 F) F).add_mem hx hy
    have hB : ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) *
        (𝔟 : FractionalIdeal (𝓞 F)⁰ F) = 1 := Units.inv_mul 𝔟
    have hN : (𝔫 : FractionalIdeal (𝓞 F)⁰ F) ≤ 1 := FractionalIdeal.coeIdeal_le_one
    have h1 : ∀ {x y : F}, x ∈ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) →
        y ∈ (𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) →
        x * y ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) := fun {x y} hx hy => by
      have := FractionalIdeal.mul_mem_mul hx hy
      rw [mul_left_comm, hB, mul_one] at this
      exact hN this
    have h2 : ∀ {x y : F}, x ∈ (𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) →
        y ∈ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) →
        x * y ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) := fun {x y} hx hy => mul_comm y x ▸ h1 hy hx
    have hl : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x y : F}, x ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) →
        y ∈ I → x * y ∈ I := fun {I x y} hx hy => by
      simpa using FractionalIdeal.mul_mem_mul hx hy
    have hr : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x y : F}, x ∈ I →
        y ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) → x * y ∈ I := fun {I x y} hx hy =>
      mul_comm y x ▸ hl hy hx
    refine ⟨?_, ?_, ?_, ?_, u * v, mul_mem hu hv, ?_⟩
    · rw [entry_mul]; exact add_mem (hl a₁ a₂) (h1 b₁ c₂)
    · rw [entry_mul]; exact add_mem (h2 c₁ b₂) (hl d₁ d₂)
    · rw [entry_mul]; exact add_mem (hl a₁ b₂) (hr b₁ d₂)
    · rw [entry_mul]; exact add_mem (hr c₁ a₂) (hl d₁ c₂)
    · rw [det₀_mul, ← hdu, ← hdv]; simp
  inv_mem' {γ} hγ := by
    obtain ⟨a, d, b, c, u, hu, hdu⟩ := hγ
    obtain ⟨e₀₀, e₀₁, e₁₀, e₁₁⟩ := entry_inv F γ
    have neg_mem : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x : F}, x ∈ I → -x ∈ I :=
      fun {I x} hx => (I : Submodule (𝓞 F) F).neg_mem hx
    have hdet : (det₀ F γ)⁻¹ ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) :=
      (FractionalIdeal.mem_one_iff _).2 ⟨((u⁻¹ : (𝓞 F)ˣ) : 𝓞 F), by
        rw [← hdu]; exact map_units_inv (algebraMap (𝓞 F) F) u⟩
    have hl : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {y : F}, y ∈ I → (det₀ F γ)⁻¹ * y ∈ I :=
      fun {I y} hy => by simpa using FractionalIdeal.mul_mem_mul hdet hy
    refine ⟨?_, ?_, ?_, ?_, u⁻¹, inv_mem hu, ?_⟩
    · rw [e₀₀]; exact hl d
    · rw [e₁₁]; exact hl a
    · rw [e₀₁]; exact hl (neg_mem b)
    · rw [e₁₀]; exact hl (neg_mem c)
    · rw [det₀_inv, ← hdu]; simp

/-- A system of representatives of the narrow class group by invertible fractional ideals
(`README.md`, Layer 1, 1.5; *Pinned conventions*, Components). -/
structure NarrowRepresentatives where
  /-- The representative of each narrow class. -/
  rep : NarrowClassGroup F → (FractionalIdeal (𝓞 F)⁰ F)ˣ
  /-- It represents its class. -/
  mk_rep : ∀ c, NarrowClassGroup.mk (rep c) = c

/-! ## Layer 2: Fourier expansions, Koecher's principle, the spaces -/

/-- `M_k(Γ)`: holomorphic functions with `f ∣_k γ = f` for all `γ ∈ Γ`, **no cusp condition**
(`README.md`, Layer 2, 2.3). -/
def modularForms (Γ : Subgroup (GL2Pos F)) (k : Weight F) :
    Submodule ℂ (UpperHalfSpace F → ℂ) where
  carrier := {f | IsHolomorphic F f ∧ ∀ γ ∈ Γ, slash F k γ f = f}
  add_mem' {f g} hf hg := ⟨hf.1.add hg.1, fun γ hγ => by
    rw [slash_add, hf.2 γ hγ, hg.2 γ hγ]⟩
  zero_mem' := ⟨differentiableOn_const 0, fun γ _ => slash_zero k γ⟩
  smul_mem' a f hf := ⟨hf.1.const_smul a, fun γ hγ => by
    rw [slash_smul, hf.2 γ hγ]⟩

/-- The point `x + i` of `ℍ^Σ`, with real part `x ∈ F_ℝ = (Σ → ℝ)` and imaginary part `1` at
every place (`README.md`, Layer 2, 2.1). -/
def basePoint (x : InfinitePlace F → ℝ) : UpperHalfSpace F :=
  fun w => ⟨x w + Complex.I, by simp⟩

/-- The box `[-T, T]^Σ ⊂ F_ℝ` (`README.md`, Layer 2, 2.1). -/
def box (T : ℝ) : Set (InfinitePlace F → ℝ) := Set.Icc (fun _ => -T) (fun _ => T)

/-- The mean of `g(x + i)` over `x ∈ [-T, T]^Σ` (`README.md`, Layer 2, 2.1). -/
def boxMean (g : UpperHalfSpace F → ℂ) (T : ℝ) : ℂ :=
  ⨍ x in box F T, g (basePoint F x)

/-- The Fourier coefficient `a(μ)` (`README.md`, Layer 2, 2.1): the limit as `T → ∞` of the mean
of `f(x + i) e(-Tr(μ(x + i)))` over the boxes `[-T, T]^Σ`. For a holomorphic `f` periodic under a
full lattice `Λ ⊂ F` this limit exists and is the README's mean over a fundamental parallelotope
of `Λ` (absolutely convergent expansion, and the box means of `e(Tr(λx))` tend to `0` for
`λ ≠ 0`), so the definition does not depend on a choice of period lattice. -/
def fourierCoeff (f : UpperHalfSpace F → ℂ) (μ : F) : ℂ :=
  Filter.limUnder Filter.atTop (boxMean F fun z => f z * expTrace F (-μ) z)

/-- The constant term `a_0(f)` (`README.md`, Layer 2, 2.4, 2.5). -/
def constantTerm (f : UpperHalfSpace F → ℂ) : ℂ := fourierCoeff F f 0

/-- The exponent lattice `(𝔟⁻¹)^∨` of the component `𝔟`, Mathlib's trace dual (`README.md`,
*Pinned conventions*, Translation lattice and exponents). -/
def dualLattice (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F :=
  FractionalIdeal.dual ℤ ℚ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F)

variable {F}

/-- The Fourier expansion of a component (`README.md`, Layer 2, 2.1, 2.3): absolutely convergent
over the exponent lattice, with the coefficients of `fourierCoeff`. -/
theorem hasSum_fourier {𝔫 : Ideal (𝓞 F)} (h𝔫 : 𝔫 ≠ ⊥) {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F}
    {f : UpperHalfSpace F → ℂ} (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k)
    (z : UpperHalfSpace F) :
    HasSum (fun μ : {μ : F // μ ∈ dualLattice F 𝔟} => fourierCoeff F f μ * expTrace F μ z)
      (f z) := sorry

/-- **Koecher's principle** (`README.md`, Layer 2, 2.2): for `n ≥ 2` the coefficients of a form
vanish off `{0} ∪ {μ ≫ 0}`. -/
theorem koecher (hn : 1 < Module.finrank ℚ F) {𝔫 : Ideal (𝓞 F)} (h𝔫 : 𝔫 ≠ ⊥)
    {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F} {f : UpperHalfSpace F → ℂ}
    (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k) {μ : F} (hμ : μ ≠ 0)
    (hpos : ¬ IsTotallyPositive μ) : fourierCoeff F f μ = 0 := sorry

/-- **Cuspidality in non-parallel weight** (`README.md`, Layer 2, 2.5): every constant term of a
form of non-parallel weight vanishes. -/
theorem constantTerm_slash_eq_zero_of_not_isParallel (hn : 1 < Module.finrank ℚ F)
    {𝔫 : Ideal (𝓞 F)} (h𝔫 : 𝔫 ≠ ⊥) {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F} (hk : ¬ k.IsParallel)
    {f : UpperHalfSpace F → ℂ} (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k) (γ : GL2Pos F) :
    constantTerm F (slash F k γ f) = 0 := sorry

variable (F)

/-- `S_k(Γ)`: the forms whose constant term vanishes at every cusp, that is
`a_0(f ∣_k γ) = 0` for all `γ ∈ GL₂⁺(F)` (`README.md`, Layer 2, 2.6; *Pinned conventions*, Cusp
form). The vanishing is stated as convergence of the box means of `f ∣_k γ` to `0`, together with
their integrability on every box, which holds for every holomorphic `f` since `f ∣_k γ` is then
continuous; stated this way the condition is visibly linear. -/
def cuspForms (Γ : Subgroup (GL2Pos F)) (k : Weight F) : Submodule ℂ (UpperHalfSpace F → ℂ) where
  carrier := {f | f ∈ modularForms F Γ k ∧ ∀ γ : GL2Pos F,
    (∀ T, MeasureTheory.IntegrableOn (fun x => slash F k γ f (basePoint F x)) (box F T)) ∧
      Filter.Tendsto (boxMean F (slash F k γ f)) Filter.atTop (nhds 0)}
  add_mem' {f g} hf hg := ⟨add_mem hf.1 hg.1, fun γ => by
    refine ⟨fun T => ?_, ?_⟩
    · rw [slash_add]; exact ((hf.2 γ).1 T).add ((hg.2 γ).1 T)
    · have h : boxMean F (slash F k γ (f + g)) =
          boxMean F (slash F k γ f) + boxMean F (slash F k γ g) := by
        funext T
        rw [slash_add]
        exact MeasureTheory.setAverage_add ((hf.2 γ).1 T) ((hg.2 γ).1 T)
      rw [h, ← add_zero (0 : ℂ)]
      exact (hf.2 γ).2.add (hg.2 γ).2⟩
  zero_mem' := ⟨zero_mem _, fun γ => by
    have h : boxMean F (0 : UpperHalfSpace F → ℂ) = fun _ => 0 := by
      funext T
      simp [boxMean]
    simp [slash_zero, h]⟩
  smul_mem' a f hf := ⟨Submodule.smul_mem _ a hf.1, fun γ => by
    refine ⟨fun T => ?_, ?_⟩
    · rw [slash_smul]; exact ((hf.2 γ).1 T).const_mul a
    · have h : boxMean F (slash F k γ (a • f)) = fun T => a * boxMean F (slash F k γ f) T := by
        funext T
        rw [slash_smul]
        exact MeasureTheory.average_const_mul _ a _
      rw [h, ← mul_zero a]
      exact (hf.2 γ).2.const_mul a⟩

/-- `M_k(𝔫; R) = ∏_c M_k(Γ₀(𝔫)_{rep c})`, the tuple space of forms of level `𝔫` (`README.md`,
Layer 2, 2.3; *Pinned conventions*, Components). -/
abbrev HilbertModularForms (𝔫 : Ideal (𝓞 F)) (k : Weight F) (R : NarrowRepresentatives F) :=
  ∀ c : NarrowClassGroup F, modularForms F (Gamma0 F 𝔫 (R.rep c)) k

variable {F}

/-- The tuple is a cusp form when every component is (`README.md`, Layer 2, 2.6). -/
def IsCuspForm {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) : Prop :=
  ∀ c, (f c : UpperHalfSpace F → ℂ) ∈ cuspForms F (Gamma0 F 𝔫 (R.rep c)) k

variable (F)

/-- The cusp forms of level `𝔫` as a submodule of the tuple space (`README.md`, Layer 2, 2.6). -/
def cuspSubmodule (𝔫 : Ideal (𝓞 F)) (k : Weight F) (R : NarrowRepresentatives F) :
    Submodule ℂ (HilbertModularForms F 𝔫 k R) where
  carrier := {f | IsCuspForm f}
  add_mem' hf hg c := add_mem (hf c) (hg c)
  zero_mem' _ := zero_mem _
  smul_mem' a _ hf c := Submodule.smul_mem _ a (hf c)

open Classical in
/-- The normalized coefficient `c(𝔪, f)` as a Tau Ceti `IdealArithmeticFunction F`
(`README.md`, Layer 2, 2.4; *Pinned conventions*, Ideal coefficients): for the narrow class `c`
with `[𝔪 · rep(c) · 𝔡⁻¹] = 1` and a totally positive generator `μ` of `𝔪 · rep(c) · 𝔡⁻¹`,
`c(𝔪, f) = a_{rep c}(μ) · ∏_w σ_w(μ)^(m_w)`. Such `c` and `μ` always exist; independence of the
choice of `μ` is the theorem of 2.4. -/
def coeff {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) : IdealArithmeticFunction F := fun 𝔪 =>
  if h : ∃ (c : NarrowClassGroup F) (μ : F), IsTotallyPositive μ ∧
      FractionalIdeal.spanSingleton (𝓞 F)⁰ μ =
        ((𝔪 : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F) * (R.rep c : FractionalIdeal (𝓞 F)⁰ F) *
          ((differentIdeal ℤ (𝓞 F) : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F)⁻¹ then
    fourierCoeff F (f h.choose : UpperHalfSpace F → ℂ) h.choose_spec.choose *
      ∏ w, ((realEmbedding F w h.choose_spec.choose : ℝ) : ℂ) ^ (k.m w)
  else 0


variable {F}

/-- The full standard expansions, including constants, determine a tuple of Hilbert forms. -/
theorem fullExpansion_injective (hn : 1 < Module.finrank ℚ F)
    (𝔫 : Ideal (𝓞 F)) (h𝔫 : 𝔫 ≠ ⊥) (k : Weight F) (R : NarrowRepresentatives F) :
    Function.Injective (fun f : HilbertModularForms F 𝔫 k R =>
      ((fun c => constantTerm F (f c)), coeff F f)) := sorry

/-- Positive ideal coefficients determine a Hilbert cusp form, whose cusp constants vanish. -/
theorem cusp_coeff_injective (hn : 1 < Module.finrank ℚ F)
    (𝔫 : Ideal (𝓞 F)) (h𝔫 : 𝔫 ≠ ⊥) (k : Weight F) (R : NarrowRepresentatives F) :
    Function.Injective (fun f : cuspSubmodule F 𝔫 k R => coeff F f.val) := sorry

/-! ## Layer 3: reduction theory and finite dimensionality -/

/-- The Hecke bound `|c(𝔪, f)| ≤ C_f N𝔪^{k₀/2}` for cusp forms (`README.md`, Layer 3, 3.3). -/
theorem exists_norm_coeff_le (hn : 1 < Module.finrank ℚ F) {𝔫 : Ideal (𝓞 F)} (h𝔫 : 𝔫 ≠ ⊥) {k : Weight F}
    {R : NarrowRepresentatives F} {f : HilbertModularForms F 𝔫 k R} (hf : IsCuspForm f) :
    ∃ C : ℝ, ∀ 𝔪 : (Ideal (𝓞 F))⁰,
      ‖coeff F f 𝔪‖ ≤ C * (Ideal.absNorm (𝔪 : Ideal (𝓞 F)) : ℝ) ^ ((k.top : ℝ) / 2) := sorry

/-- **Finite dimensionality** of `S_k(Γ₀(𝔫)_𝔟)` (`README.md`, Layer 3, 3.5). -/
theorem finiteDimensional_cuspForms (hn : 1 < Module.finrank ℚ F) (𝔫 : Ideal (𝓞 F)) (h𝔫 : 𝔫 ≠ ⊥)
    (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) (k : Weight F) :
    FiniteDimensional ℂ (cuspForms F (Gamma0 F 𝔫 𝔟) k) := sorry

/-- **Finite dimensionality** of `M_k(Γ₀(𝔫)_𝔟)` (`README.md`, Layer 3, 3.5). -/
theorem finiteDimensional_modularForms (hn : 1 < Module.finrank ℚ F) (𝔫 : Ideal (𝓞 F))
    (h𝔫 : 𝔫 ≠ ⊥) (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) (k : Weight F) :
    FiniteDimensional ℂ (modularForms F (Gamma0 F 𝔫 𝔟) k) := sorry

/-- The tuple space is finite dimensional (`README.md`, Layer 3, 3.5). -/
theorem finiteDimensional_hilbertModularForms (hn : 1 < Module.finrank ℚ F) (𝔫 : Ideal (𝓞 F))
    (h𝔫 : 𝔫 ≠ ⊥) (k : Weight F) (R : NarrowRepresentatives F) :
    FiniteDimensional ℂ (HilbertModularForms F 𝔫 k R) := sorry

/-- For `k₀ ≤ 0` the only forms are the constants in weight `0` (`README.md`, Layer 3, 3.5). -/
theorem modularForms_eq_bot_of_top_neg (hn : 1 < Module.finrank ℚ F) {𝔫 : Ideal (𝓞 F)} (h𝔫 : 𝔫 ≠ ⊥)
    {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F} (hk : k.top < 0) :
    modularForms F (Gamma0 F 𝔫 𝔟) k = ⊥ := sorry


/-! ## Layer 8: `L`-series -/

variable (F) in
/-- `L(f, s) = Σ_𝔪 c(𝔪, f) N𝔪^(-s)`, Mathlib's `LSeries` of Tau Ceti's `normCoeff` of the
coefficient function (`README.md`, Layer 8, 8.1; *Pinned conventions*, `L`-function). -/
def LFunction {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) (s : ℂ) : ℂ :=
  LSeries (normCoeff F (coeff F f)) s

/-- The ideal L-series of a Hilbert cusp form converges absolutely to the right of
k₀/2 + 1, using the Hecke bound and ideal counting. -/
theorem LSeriesSummable_of_isCuspForm (hn : 1 < Module.finrank ℚ F)
    {𝔫 : Ideal (𝓞 F)} (h𝔫 : 𝔫 ≠ ⊥) {k : Weight F} {R : NarrowRepresentatives F}
    {f : HilbertModularForms F 𝔫 k R} (hf : IsCuspForm f) {s : ℂ}
    (hs : (k.top : ℝ) / 2 + 1 < s.re) :
    LSeriesSummable (normCoeff F (coeff F f)) s := sorry

end TauCetiRoadmap.HilbertModularForms
