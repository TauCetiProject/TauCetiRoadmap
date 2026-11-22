/-
Copyright (c) 2026 Bastiaan J Braams. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Bastiaan J Braams
-/
module

public import Mathlib
public import TauCeti.GroupTheory.SpecificGroups.Heisenberg
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
public import TauCeti.Analysis.SpecialFunctions.Hermite.Function.HilbertBasis
public import TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric

/-!
# Special functions from affine, triangular and Heisenberg groups: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the targets of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other targets of the README have the same standing, stated in prose.
Discharging this file finishes neither a layer nor the roadmap.

Declarations whose docstring begins "Sanity check of the definition:" are short consequences of
the definitions (unfolding, `simp`, or one Mathlib lemma); they fix the conventions and are not
headline results.

Two bold items of README 2.6 are not stated here, because as statements they belong to another
roadmap and what this roadmap adds is a derivation: the Mellin–Barnes integrals of the Whittaker
functions, which are SpecialFunctionsConfluent §2.4 (DLMF 13.16.10–13.16.12) and which README 2.6
derives from `triangularKernel_equalTranslationModulation_eq_integral` with the kernels of
README 2.4–2.5; and the differential relations, whose closed forms are SpecialFunctionsConfluent
§§1.6, 4.2 (DLMF 13.14.1, 13.15.16, 13.15.18, 13.15.21, 13.15.25) and which README 2.6 derives
by differentiating factorizations of `g_±(t) g_1(x)`.

Definitions owned by other roadmaps are local verbatim copies, so that this file imports only
Mathlib and Tau Ceti: the `ax + b` group, the oscillator matrix, the multiplier framework, the
Schrödinger representation and `matrixElement` (SpecialFunctionsGroupModels §§0.2, 1.2–1.3,
2.4–2.5, 3.1), the Laguerre polynomials (LaguerreJacobi §1.1) and Whittaker's functions
(SpecialFunctionsConfluent §§1.4, 1.6, in its namespace `Complex`). Representations on `L²` are
chosen by uniqueness through `multiplierRep`, as there. Theorems are stated with `sorry`. Section
numbers in docstrings are those of the README unless they name another roadmap.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsAffineHeisenbergGroups

open MeasureTheory Filter Topology Set Matrix Complex
open scoped Real ComplexConjugate InnerProductSpace ENNReal NNReal

/-! ## Local copies of definitions owned by other roadmaps -/

namespace Polynomial

/-- LaguerreJacobi §1.1 (local copy). The generalized Laguerre polynomial `Lₙ^{(α)}` over a
`ℚ`-algebra (DLMF 18.5.12). -/
noncomputable def laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) :
    Polynomial R :=
  ∑ k ∈ Finset.range (n + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      (ascPochhammer R (n - k)).smeval (α + k + 1))) • Polynomial.X ^ k

end Polynomial

/-- SpecialFunctionsConfluent (local copy). Olver's regularized Kummer function. -/
local notation "𝐌(" a ", " b ")" =>
  Complex.regularizedHGFun ({a} : Multiset ℂ) ({b} : Multiset ℂ)

namespace Complex

/-- SpecialFunctionsConfluent §1.4 (local copy). The bracket of DLMF 13.2.42 in logarithmic
coordinates. -/
def kummerUBracket (a b w : ℂ) : ℂ :=
  𝐌(a, b) (cexp w) * (Gamma (a - b + 1))⁻¹ -
    cexp ((1 - b) * w) * 𝐌(a - b + 1, 2 - b) (cexp w) * (Gamma a)⁻¹

open scoped Classical in
/-- SpecialFunctionsConfluent §1.4 (local copy). Kummer's `U(a, b, e^w)` on the logarithmic
plane. -/
def kummerULog (a b w : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = b then
    Complex.cos (π * b) * deriv (fun β => kummerUBracket a β w) b
  else (π : ℂ) / Complex.sin (π * b) * kummerUBracket a b w

/-- SpecialFunctionsConfluent §1.4 (local copy). The principal branch `U(a, b, z)`. -/
def kummerU (a b z : ℂ) : ℂ := kummerULog a b (Complex.log z)

/-- SpecialFunctionsConfluent §1.6 (local copy). The regularized Whittaker function. -/
def regularizedWhittakerM (κ μ z : ℂ) : ℂ :=
  cexp (-z / 2) * z ^ (1 / 2 + μ) * 𝐌(1 / 2 + μ - κ, 1 + 2 * μ) z

/-- SpecialFunctionsConfluent §1.6 (local copy). Whittaker's `M_{κ,μ}(z)` (DLMF 13.14.2). -/
def whittakerM (κ μ z : ℂ) : ℂ := Gamma (1 + 2 * μ) * regularizedWhittakerM κ μ z

/-- SpecialFunctionsConfluent §1.6 (local copy). Whittaker's `W_{κ,μ}(z)` (DLMF 13.14.3). -/
def whittakerW (κ μ z : ℂ) : ℂ :=
  cexp (-z / 2) * z ^ (1 / 2 + μ) * kummerU (1 / 2 + μ - κ) (1 + 2 * μ) z

end Complex

/-- SpecialFunctionsGroupModels §0.2 (local copy). The oscillator-group matrix `s(w, α, δ)`. -/
def oscillatorMatrix (w : ℂ) (α δ : ℝ) : Matrix (Fin 3) (Fin 3) ℂ :=
  !![1, Complex.exp (-(α : ℂ) * Complex.I) * conj w / 2,
      (δ : ℂ) * Complex.I - (Complex.normSq w : ℂ) / 8;
    0, Complex.exp (-(α : ℂ) * Complex.I), -w / 2;
    0, 0, 1]

/-- SpecialFunctionsGroupModels §0.2 (local copy). The `ax + b` group. -/
@[ext]
structure AxB where
  /-- The dilation `a > 0`. -/
  a : ℝ
  /-- The translation `b`. -/
  b : ℝ
  /-- The dilation is strictly positive. -/
  a_pos : 0 < a

namespace AxB

instance : Mul AxB := ⟨fun g h => ⟨g.a * h.a, g.a * h.b + g.b, mul_pos g.a_pos h.a_pos⟩⟩

instance : One AxB := ⟨⟨1, 0, one_pos⟩⟩

instance : Inv AxB := ⟨fun g => ⟨g.a⁻¹, -(g.a⁻¹ * g.b), inv_pos.2 g.a_pos⟩⟩

/-- The positive dilation of a product in `AxB`. -/
@[simp] theorem mul_a (g h : AxB) : (g * h).a = g.a * h.a := rfl
/-- The translation of a product in `AxB`. -/
@[simp] theorem mul_b (g h : AxB) : (g * h).b = g.a * h.b + g.b := rfl
/-- The positive dilation of the identity in `AxB`. -/
@[simp] theorem one_a : (1 : AxB).a = 1 := rfl
/-- The translation of the identity in `AxB`. -/
@[simp] theorem one_b : (1 : AxB).b = 0 := rfl
/-- The positive dilation of the inverse in `AxB`. -/
@[simp] theorem inv_a (g : AxB) : g⁻¹.a = g.a⁻¹ := rfl
/-- The translation of the inverse in `AxB`. -/
@[simp] theorem inv_b (g : AxB) : g⁻¹.b = -(g.a⁻¹ * g.b) := rfl

instance : Group AxB where
  mul_assoc g h k := by ext <;> simp <;> ring
  one_mul g := by ext <;> simp
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by ext <;> simp [g.a_pos.ne']

/-- SpecialFunctionsGroupModels §2.4 (local copy). `g • x = x / a`. -/
instance : MulAction AxB ℝ where
  smul g x := x / g.a
  one_smul x := div_one x
  mul_smul g h x := by
    show x / (g.a * h.a) = x / h.a / g.a
    rw [div_div, mul_comm]

end AxB

section Multipliers

variable {G X : Type*} [Group G] [MulAction G X]

/-- SpecialFunctionsGroupModels §1.2 (local copy). `(T(g) f)(x) = α(g, x) f(g⁻¹ • x)`. -/
def multiplierAction (α : G → X → ℂ) (g : G) (f : X → ℂ) (x : X) : ℂ :=
  α g x * f (g⁻¹ • x)

/-- SpecialFunctionsGroupModels §1.2 (local copy). The multiplier cocycle identity. -/
def IsMultiplierCocycle (α : G → X → ℂ) : Prop :=
  (∀ x, α 1 x = 1) ∧ ∀ g h x, α (g * h) x = α g x * α h (g⁻¹ • x)

open scoped Classical in
/-- SpecialFunctionsGroupModels §1.3 (local copy). The multiplier representation on `L²`. -/
def multiplierRep [MeasurableSpace X] (μ : Measure X) (α : G → X → ℂ) :
    ContRepresentation ℂ G (Lp ℂ 2 μ) :=
  if h : ∃ U : ContRepresentation ℂ G (Lp ℂ 2 μ),
      ∀ g f, (U g f : X → ℂ) =ᵐ[μ] multiplierAction α g f then h.choose
  else .ofMonoidHom 1

end Multipliers

/-- SpecialFunctionsGroupModels §2.4 (local copy). The invariant measure `dx / x`. -/
def halfLineMeasure : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity fun x => ENNReal.ofReal x⁻¹

/-- SpecialFunctionsGroupModels §2.4 (local copy). The multiplier `e^{i λ b x}`. -/
def axbCocycle (lam : ℝ) (g : AxB) (x : ℝ) : ℂ := Complex.exp ((lam * g.b * x : ℝ) * Complex.I)

/-- SpecialFunctionsGroupModels §2.5 (local copy). `g • x = x - g.x`. -/
scoped instance heisenbergLineAction : MulAction (TauCeti.HeisenbergGroup ℝ) ℝ where
  smul g x := x - g.x
  one_smul x := sub_zero x
  mul_smul g h x := by
    show x - (g.x + h.x) = x - h.x - g.x
    ring

/-- SpecialFunctionsGroupModels §2.5 (local copy). The Schrödinger multiplier `e^{i(z + y x)}`. -/
def schrodingerCocycle (g : TauCeti.HeisenbergGroup ℝ) (x : ℝ) : ℂ :=
  Complex.exp ((g.z + g.y * x : ℝ) * Complex.I)

/-- SpecialFunctionsGroupModels §2.5 (local copy). The Schrödinger representation. -/
def schrodinger :
    ContRepresentation ℂ (TauCeti.HeisenbergGroup ℝ) (Lp ℂ 2 (volume : Measure ℝ)) :=
  multiplierRep volume schrodingerCocycle

/-- SpecialFunctionsGroupModels §3.1 (local copy). `D_{mn}(g) = ⟪e_m, U(g) e_n⟫`. -/
def matrixElement {G H ι : Type*} [Group G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (U : ContRepresentation ℂ G H) (e : HilbertBasis ι ℂ H) (m n : ι) (g : G) : ℂ :=
  ⟪e m, U g (e n)⟫_ℂ

/-! ## Layer 0: the groups in coordinates -/

/-- README 0.1. The triangular group, coordinates `(a, b, d, τ)` of the matrix
`[[1, a, b], [0, e^τ, d], [0, 0, 1]]`. -/
@[ext]
structure TriangularGroup where
  /-- The `(1, 2)` entry. -/
  a : ℝ
  /-- The `(1, 3)` entry. -/
  b : ℝ
  /-- The `(2, 3)` entry. -/
  d : ℝ
  /-- The logarithm of the `(2, 2)` entry. -/
  τ : ℝ

namespace TriangularGroup

instance : Mul TriangularGroup :=
  ⟨fun g h => ⟨h.a + g.a * Real.exp h.τ, g.b + h.b + g.a * h.d, g.d + Real.exp g.τ * h.d,
    g.τ + h.τ⟩⟩

instance : One TriangularGroup := ⟨⟨0, 0, 0, 0⟩⟩

instance : Inv TriangularGroup :=
  ⟨fun g => ⟨-(g.a * Real.exp (-g.τ)), g.a * g.d * Real.exp (-g.τ) - g.b,
    -(g.d * Real.exp (-g.τ)), -g.τ⟩⟩

/-- The upper left off-diagonal entry of a product in `TriangularGroup`. -/
@[simp] theorem mul_a (g h : TriangularGroup) : (g * h).a = h.a + g.a * Real.exp h.τ := rfl
/-- The central entry of a product in `TriangularGroup`. -/
@[simp] theorem mul_b (g h : TriangularGroup) : (g * h).b = g.b + h.b + g.a * h.d := rfl
/-- The upper right off-diagonal entry in the second row of a product in `TriangularGroup`. -/
@[simp] theorem mul_d (g h : TriangularGroup) : (g * h).d = g.d + Real.exp g.τ * h.d := rfl
/-- The logarithmic dilation of a product in `TriangularGroup`. -/
@[simp] theorem mul_τ (g h : TriangularGroup) : (g * h).τ = g.τ + h.τ := rfl
/-- The upper left off-diagonal entry of the identity in `TriangularGroup`. -/
@[simp] theorem one_a : (1 : TriangularGroup).a = 0 := rfl
/-- The central entry of the identity in `TriangularGroup`. -/
@[simp] theorem one_b : (1 : TriangularGroup).b = 0 := rfl
/-- The upper right off-diagonal entry in the second row of the identity in `TriangularGroup`. -/
@[simp] theorem one_d : (1 : TriangularGroup).d = 0 := rfl
/-- The logarithmic dilation of the identity in `TriangularGroup`. -/
@[simp] theorem one_τ : (1 : TriangularGroup).τ = 0 := rfl
/-- The upper left off-diagonal entry of the inverse in `TriangularGroup`. -/
@[simp] theorem inv_a (g : TriangularGroup) : g⁻¹.a = -(g.a * Real.exp (-g.τ)) := rfl
/-- The central entry of the inverse in `TriangularGroup`. -/
@[simp] theorem inv_b (g : TriangularGroup) : g⁻¹.b = g.a * g.d * Real.exp (-g.τ) - g.b := rfl
/-- The upper right off-diagonal entry in the second row of the inverse in `TriangularGroup`. -/
@[simp] theorem inv_d (g : TriangularGroup) : g⁻¹.d = -(g.d * Real.exp (-g.τ)) := rfl
/-- The logarithmic dilation of the inverse in `TriangularGroup`. -/
@[simp] theorem inv_τ (g : TriangularGroup) : g⁻¹.τ = -g.τ := rfl

instance : Group TriangularGroup where
  mul_assoc g h k := by
    ext <;> simp [Real.exp_add] <;> ring
  one_mul g := by ext <;> simp
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by
    ext <;> simp [Real.exp_neg] <;> field_simp <;> ring

/-- README 0.1. The matrix `[[1, a, b], [0, e^τ, d], [0, 0, 1]]`. -/
def toMatrix (g : TriangularGroup) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![1, g.a, g.b; 0, Real.exp g.τ, g.d; 0, 0, 1]

/-- Sanity check of the definition: README 0.1, **Matrix realization.** -/
theorem toMatrix_mul :
    (∀ g h : TriangularGroup, toMatrix (g * h) = toMatrix g * toMatrix h) ∧
      Function.Injective toMatrix := by
  sorry

/-- README 0.1. **Centre.** The centre is the subgroup `z(t) = (0, t, 0, 0)`. -/
theorem mem_center_iff (g : TriangularGroup) :
    g ∈ Subgroup.center TriangularGroup ↔ g.a = 0 ∧ g.d = 0 ∧ g.τ = 0 := by
  sorry

/-- README 0.1. The triangular group acts on `ℝ` by `g • x = e^{-τ}(x - a)`, so that
`g⁻¹ • x = e^τ x + a`. -/
instance : MulAction TriangularGroup ℝ where
  smul g x := Real.exp (-g.τ) * (x - g.a)
  one_smul x := by
    show Real.exp (-0) * (x - 0) = x
    simp
  mul_smul g h x := by
    show Real.exp (-(g.τ + h.τ)) * (x - (h.a + g.a * Real.exp h.τ)) =
      Real.exp (-g.τ) * (Real.exp (-h.τ) * (x - h.a) - g.a)
    rw [neg_add, Real.exp_add]
    have : Real.exp (-h.τ) * Real.exp h.τ = 1 := by rw [← Real.exp_add]; simp
    linear_combination (-(Real.exp (-g.τ) * g.a)) * this

end TriangularGroup

open TriangularGroup

/-- README 0.1. `g_+(t) = (t, 0, 0, 0)`. -/
def translationElement (t : ℝ) : TriangularGroup := ⟨t, 0, 0, 0⟩

/-- README 0.1. `g_-(t) = (0, 0, t, 0)`. -/
def modulationElement (t : ℝ) : TriangularGroup := ⟨0, 0, t, 0⟩

/-- README 0.1. The central element `z(t) = (0, t, 0, 0)`. -/
def centralElement (t : ℝ) : TriangularGroup := ⟨0, t, 0, 0⟩

/-- README 0.1. The diagonal element `ε(t) = (0, 0, 0, t)`. -/
def dilation (t : ℝ) : TriangularGroup := ⟨0, 0, 0, t⟩

/-- README 0.1. `g_1(t) = [[1, t, t²/2], [0, 1, t], [0, 0, 1]]`. -/
def equalTranslationModulation (t : ℝ) : TriangularGroup := ⟨t, t ^ 2 / 2, t, 0⟩

/-- README 0.1. `g_2(t) = [[1, -t, -t²/2], [0, 1, t], [0, 0, 1]]`. -/
def oppositeTranslationModulation (t : ℝ) : TriangularGroup := ⟨-t, -(t ^ 2 / 2), t, 0⟩

/-- README 0.1. **Factorizations.** -/
theorem TriangularGroup.factorizations :
    (∀ b d τ : ℝ,
      (⟨0, b, d, τ⟩ : TriangularGroup) =
        dilation τ * modulationElement (d * Real.exp (-τ)) * centralElement b) ∧
    (∀ t : ℝ, equalTranslationModulation t =
      modulationElement t * translationElement t * centralElement (t ^ 2 / 2)) ∧
    ∀ t x : ℝ, 0 < x → 0 < x + t →
      translationElement t * equalTranslationModulation x =
        dilation (Real.log (x / (x + t)) / 2) *
          equalTranslationModulation (Real.sqrt (x * (x + t))) *
          dilation (-(Real.log (x / (x + t)) / 2)) * centralElement (t * x / 2) := by
  sorry

/-- README 0.1. The Heisenberg group as the subgroup `τ = 0`: `(x, y, z) ↦ (x, z, y, 0)`. -/
def heisenbergToTriangular : TauCeti.HeisenbergGroup ℝ →* TriangularGroup where
  toFun p := ⟨p.x, p.z, p.y, 0⟩
  map_one' := by ext <;> simp
  map_mul' p q := by ext <;> simp [add_comm]

/-- Sanity check of the definition: README 0.1, **Heisenberg subgroup.** -/
theorem heisenbergToTriangular_injective : Function.Injective heisenbergToTriangular := by
  sorry

/-- README 0.2. The oscillator group: coordinates `(w, α, δ)` with real, unreduced angle `α`. -/
@[ext]
structure Oscillator where
  /-- The translation part. -/
  w : ℂ
  /-- The rotation angle. -/
  α : ℝ
  /-- The central coordinate. -/
  δ : ℝ

/-- README 0.2. The rotation factor `e^{-iα}`. -/
def rotationFactor (α : ℝ) : ℂ := Complex.exp (-(α : ℂ) * Complex.I)

/-- Adding angles multiplies the rotation factors. -/
theorem rotationFactor_add (α β : ℝ) :
    rotationFactor (α + β) = rotationFactor α * rotationFactor β := by
  simp only [rotationFactor, ← Complex.exp_add]
  congr 1
  push_cast
  ring

/-- A rotation factor times its complex conjugate is one. -/
theorem rotationFactor_mul_conj (α : ℝ) : rotationFactor α * conj (rotationFactor α) = 1 := by
  rw [Complex.mul_conj, rotationFactor, Complex.normSq_eq_norm_sq]
  have : -(α : ℂ) * Complex.I = ((-α : ℝ) : ℂ) * Complex.I := by push_cast; ring
  rw [this, Complex.norm_exp_ofReal_mul_I]
  simp

/-- The rotation factor at angle zero is one. -/
theorem rotationFactor_zero : rotationFactor 0 = 1 := by simp [rotationFactor]

namespace Oscillator

instance : Mul Oscillator :=
  ⟨fun g h => ⟨g.w + rotationFactor g.α * h.w, g.α + h.α,
    g.δ + h.δ - (rotationFactor g.α * conj g.w * h.w).im / 4⟩⟩

instance : One Oscillator := ⟨⟨0, 0, 0⟩⟩

instance : Inv Oscillator := ⟨fun g => ⟨-(rotationFactor (-g.α) * g.w), -g.α, -g.δ⟩⟩

/-- The complex displacement of a product in `Oscillator`. -/
@[simp] theorem mul_w (g h : Oscillator) : (g * h).w = g.w + rotationFactor g.α * h.w := rfl
/-- The rotation angle of a product in `Oscillator`. -/
@[simp] theorem mul_α (g h : Oscillator) : (g * h).α = g.α + h.α := rfl
/-- The central coordinate of a product in `Oscillator`. -/
@[simp] theorem mul_δ (g h : Oscillator) :
    (g * h).δ = g.δ + h.δ - (rotationFactor g.α * conj g.w * h.w).im / 4 := rfl
/-- The complex displacement of the identity in `Oscillator`. -/
@[simp] theorem one_w : (1 : Oscillator).w = 0 := rfl
/-- The rotation angle of the identity in `Oscillator`. -/
@[simp] theorem one_α : (1 : Oscillator).α = 0 := rfl
/-- The central coordinate of the identity in `Oscillator`. -/
@[simp] theorem one_δ : (1 : Oscillator).δ = 0 := rfl
/-- The complex displacement of the inverse in `Oscillator`. -/
@[simp] theorem inv_w (g : Oscillator) : g⁻¹.w = -(rotationFactor (-g.α) * g.w) := rfl
/-- The rotation angle of the inverse in `Oscillator`. -/
@[simp] theorem inv_α (g : Oscillator) : g⁻¹.α = -g.α := rfl
/-- The central coordinate of the inverse in `Oscillator`. -/
@[simp] theorem inv_δ (g : Oscillator) : g⁻¹.δ = -g.δ := rfl

instance : Group Oscillator where
  mul_assoc g h k := by
    have key : rotationFactor (g.α + h.α) * conj (g.w + rotationFactor g.α * h.w) * k.w =
        rotationFactor (g.α + h.α) * conj g.w * k.w + rotationFactor h.α * conj h.w * k.w := by
      rw [map_add, map_mul, rotationFactor_add]
      linear_combination (rotationFactor h.α * conj h.w * k.w) * rotationFactor_mul_conj g.α
    ext
    · simp only [mul_w, mul_α, rotationFactor_add]; ring
    · simp only [mul_α]; ring
    · simp only [mul_δ, mul_w, mul_α]
      rw [key]
      simp only [mul_add, Complex.add_im, rotationFactor_add]
      ring_nf
  one_mul g := by ext <;> simp [rotationFactor_zero]
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by
    have h1 : rotationFactor (-g.α) * rotationFactor g.α = 1 := by
      rw [← rotationFactor_add]; simp [rotationFactor_zero]
    have h2 : (rotationFactor (-g.α) * conj (-(rotationFactor (-g.α) * g.w)) * g.w).im = 0 := by
      rw [map_neg, map_mul,
        show rotationFactor (-g.α) * -(conj (rotationFactor (-g.α)) * conj g.w) * g.w
        = -((rotationFactor (-g.α) * conj (rotationFactor (-g.α))) * (conj g.w * g.w)) by ring,
        rotationFactor_mul_conj, one_mul, ← Complex.normSq_eq_conj_mul_self]
      simp
    ext
    · simp only [mul_w, inv_w, inv_α, one_w]
      linear_combination (-g.w) * h1 + g.w * h1
    · simp
    · simp only [mul_δ, inv_δ, inv_w, inv_α, one_δ, h2]; ring

/-- README 0.2. The matrix realization `oscillatorMatrix w α δ`. -/
def toMatrix (g : Oscillator) : Matrix (Fin 3) (Fin 3) ℂ := oscillatorMatrix g.w g.α g.δ

/-- Sanity check of the definition: README 0.2, **Matrix realization.** -/
theorem toMatrix_mul (g h : Oscillator) : toMatrix (g * h) = toMatrix g * toMatrix h := by
  sorry

/-- Sanity check of the definition: README 0.2, **Kernel of the matrix realization.** -/
theorem toMatrix_eq_one_iff (g : Oscillator) :
    toMatrix g = 1 ↔ g.w = 0 ∧ g.δ = 0 ∧ ∃ k : ℤ, g.α = 2 * π * k := by
  sorry

/-- README 4.1. `Oscillator` acts on `ℂ` by `g • ζ = e^{-iα} ζ - w/√2`, so that
`g⁻¹ • ζ = e^{iα}(ζ + w/√2)`. -/
instance : MulAction Oscillator ℂ where
  smul g ζ := rotationFactor g.α * ζ - g.w / (Real.sqrt 2 : ℂ)
  one_smul ζ := by
    show rotationFactor 0 * ζ - 0 / (Real.sqrt 2 : ℂ) = ζ
    simp [rotationFactor_zero]
  mul_smul g h ζ := by
    show rotationFactor (g.α + h.α) * ζ - (g.w + rotationFactor g.α * h.w) / (Real.sqrt 2 : ℂ) =
      rotationFactor g.α * (rotationFactor h.α * ζ - h.w / (Real.sqrt 2 : ℂ)) -
        g.w / (Real.sqrt 2 : ℂ)
    rw [rotationFactor_add]
    ring

end Oscillator

/-- README 0.2. The Heisenberg group in the oscillator group:
`(x, y, z) ↦ (x + iy, 0, -(z - xy/2)/2)`. -/
def heisenbergToOscillator : TauCeti.HeisenbergGroup ℝ →* Oscillator where
  toFun p := ⟨⟨p.x, p.y⟩, 0, -((p.z - p.x * p.y / 2) / 2)⟩
  map_one' := by
    ext
    · apply Complex.ext <;> simp
    · simp
    · simp
  map_mul' p q := by
    ext
    · apply Complex.ext <;> simp [rotationFactor_zero]
    · simp
    · simp [rotationFactor_zero]; ring

/-- Sanity check of the definition: README 0.2, **Heisenberg subgroup.** -/
theorem heisenbergToOscillator_injective : Function.Injective heisenbergToOscillator := by
  sorry

/-! ## Layer 1: the `ax + b` group, the Mellin transform and the Gamma function -/

/-- README 1.1. Vilenkin–Klimyk's `R_λ(a, b) f(x) = e^{λ b x} f(a x)` for complex `λ`. -/
def affineAction (lam : ℂ) (g : AxB) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  Complex.exp (lam * g.b * x) * f (g.a * x)

/-- Sanity check of the definition: README 1.1, **Representation law.** -/
theorem affineAction_mul (lam : ℂ) (g h : AxB) (f : ℝ → ℂ) :
    affineAction lam (g * h) f = affineAction lam g (affineAction lam h f) := by
  sorry

/-- Sanity check of the definition: README 1.1, **Representation law**, the identity. -/
theorem affineAction_one (lam : ℂ) (f : ℝ → ℂ) : affineAction lam 1 f = f := by
  sorry

/-- Sanity check of the definition: README 1.1, **Dictionary** to SpecialFunctionsGroupModels
§2.4. -/
theorem affineAction_mul_I (ρ : ℝ) :
    affineAction (ρ * Complex.I) = multiplierAction (axbCocycle ρ) := by
  sorry

/-- README 1.1. **Euler operator.** -/
theorem mellin_mul_deriv (f : ℝ → ℂ) (w : ℂ) (hf : ContDiff ℝ 1 f)
    (hfc : HasCompactSupport f) (hf0 : (0 : ℝ) ∉ tsupport f) :
    mellin (fun x => (x : ℂ) * deriv f x) w = -w * mellin f w := by
  sorry

/-- README 1.1. **Mellin–Plancherel theorem.** `f ↦ (s ↦ (2π)^{-1/2} mellin f (is))` extends from
continuous functions with compact support in `(0, ∞)` to a unitary map from `L²(dx/x)` onto `L²(ℝ)`,
which carries the dilation representation `R_0(a, 0)` to multiplication by `a^{-is}`. -/
theorem mellin_plancherel :
    ∃ M : Lp ℂ 2 halfLineMeasure ≃ₗᵢ[ℂ] Lp ℂ 2 (volume : Measure ℝ),
      (∀ (f : ℝ → ℂ) (hf : MemLp f 2 halfLineMeasure), Continuous f → HasCompactSupport f →
        tsupport f ⊆ Ioi 0 →
        (M (hf.toLp f) : ℝ → ℂ) =ᵐ[volume]
          fun s => (((2 * π) ^ (-(1 / 2 : ℝ)) : ℝ) : ℂ) * mellin f ((s : ℂ) * Complex.I)) ∧
      ∀ (a : ℝ) (ha : 0 < a) (F : Lp ℂ 2 halfLineMeasure),
        (M (multiplierRep halfLineMeasure (axbCocycle 0) ⟨a, 0, ha⟩ F) : ℝ → ℂ) =ᵐ[volume]
          fun s => (a : ℂ) ^ (-((s : ℂ) * Complex.I)) * M F s := by
  sorry

/-- README 1.2. The Gamma kernel `Γ(w - z) a^{-w} (-λb/a)^{z-w} / (2πi)`. -/
def affineGammaKernel (lam : ℂ) (a b : ℝ) (w z : ℂ) : ℂ :=
  Gamma (w - z) * (a : ℂ) ^ (-w) * (-lam * b / a) ^ (z - w) / (2 * π * Complex.I)

/-- README 1.2. **Gamma kernel.** -/
theorem mellin_affineAction_eq_integral (lam : ℂ) (a b : ℝ) (ha : 0 < a)
    (hlam : 0 < (-lam * b).re) (f : ℝ → ℂ) (hf : ContDiff ℝ 1 f) (hfc : HasCompactSupport f)
    (hfs : tsupport f ⊆ Ioi 0) (w : ℂ) (c : ℝ) (hc : c < w.re) :
    mellin (affineAction lam ⟨a, b, ha⟩ f) w =
      Complex.I * ∫ s : ℝ, affineGammaKernel lam a b w (c + s * Complex.I) *
        mellin f (c + s * Complex.I) := by
  sorry

/-- README 1.3. **Composition of Gamma kernels** along `g(1, b) g(1, 1) = g(1, b + 1)`; after a
change of variables this is the Mellin–Barnes integral of `(1 + u)^{-a}` of
SpecialFunctionsHypergeometric §6.3. -/
theorem affineGammaKernel_composition (lam w z : ℂ) (b c : ℝ) (hb : 0 < b) (hlam : 0 < (-lam).re)
    (hzc : z.re < c) (hcw : c < w.re) :
    affineGammaKernel lam 1 (b + 1) w z =
      Complex.I * ∫ s : ℝ, affineGammaKernel lam 1 b w (c + s * Complex.I) *
        affineGammaKernel lam 1 1 (c + s * Complex.I) z := by
  sorry

/-! ## Layer 2: the triangular group and the Whittaker functions -/

/-- README 2.1. The multiplier `e^{ωτ + σ(dx + b)}`. -/
def triangularCocycle (σ ω : ℂ) (g : TriangularGroup) (x : ℝ) : ℂ :=
  Complex.exp (ω * g.τ + σ * (g.d * x + g.b))

/-- README 2.1. `(T_χ(g) f)(x) = e^{ωτ + σ(dx + b)} f(e^τ x + a)`. -/
def triangularAction (σ ω : ℂ) (g : TriangularGroup) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  triangularCocycle σ ω g x * f (Real.exp g.τ * x + g.a)

/-- README 2.1. The unitary representation at `σ = iγ`, `ω = 1/2 + iρ`. -/
def triangularRep (γ ρ : ℝ) : ContRepresentation ℂ TriangularGroup (Lp ℂ 2 (volume : Measure ℝ)) :=
  multiplierRep volume (triangularCocycle (γ * Complex.I) (1 / 2 + ρ * Complex.I))

/-- README 2.1. **Cocycle.** -/
theorem isMultiplierCocycle_triangularCocycle (σ ω : ℂ) :
    IsMultiplierCocycle (triangularCocycle σ ω) ∧
      multiplierAction (triangularCocycle σ ω) = triangularAction σ ω := by
  sorry

/-- README 2.1. **Unitarity range.** -/
theorem lintegral_triangularAction_iff (σ ω : ℂ) :
    (∀ (g : TriangularGroup) (f : ℝ → ℂ), Measurable f →
      ∫⁻ x, ‖triangularAction σ ω g f x‖ₑ ^ 2 = ∫⁻ x, ‖f x‖ₑ ^ 2) ↔
      σ.re = 0 ∧ ω.re = 1 / 2 := by
  sorry

/-- README 2.1. **Unitary representations.** -/
theorem triangularRep_spec (γ ρ γ' ρ' : ℝ) :
    (∀ g f, (triangularRep γ ρ g f : ℝ → ℂ) =ᵐ[volume]
      triangularAction (γ * Complex.I) (1 / 2 + ρ * Complex.I) g f) ∧
    (triangularRep γ ρ).IsUnitary ∧
    (γ ≠ 0 → ∀ W : Submodule ℂ (Lp ℂ 2 (volume : Measure ℝ)),
      IsClosed (W : Set (Lp ℂ 2 (volume : Measure ℝ))) →
      (∀ g, ∀ v ∈ W, triangularRep γ ρ g v ∈ W) → W = ⊥ ∨ W = ⊤) ∧
    (γ ≠ 0 → γ' ≠ 0 →
      ((∃ U : Lp ℂ 2 (volume : Measure ℝ) ≃ₗᵢ[ℂ] Lp ℂ 2 (volume : Measure ℝ),
        ∀ g v, U (triangularRep γ ρ g v) = triangularRep γ' ρ' g (U v)) ↔
        γ = γ' ∧ ρ = ρ')) := by
  sorry

/-- README 2.1. **Restriction to the Heisenberg group.** -/
theorem triangularAction_heisenberg (ω : ℂ) (p : TauCeti.HeisenbergGroup ℝ) (f : ℝ → ℂ) :
    triangularAction Complex.I ω (heisenbergToTriangular p) f =
      multiplierAction schrodingerCocycle p f := by
  sorry

/-- README 2.2. **Infinitesimal operators.** -/
theorem hasDerivAt_triangularAction (σ ω : ℂ) (f : ℝ → ℂ) (hf : ContDiff ℝ 1 f) (x : ℝ) :
    HasDerivAt (fun t => triangularAction σ ω (translationElement t) f x) (deriv f x) 0 ∧
    HasDerivAt (fun t => triangularAction σ ω (modulationElement t) f x) (σ * x * f x) 0 ∧
    HasDerivAt (fun t => triangularAction σ ω (centralElement t) f x) (σ * f x) 0 ∧
    HasDerivAt (fun t => triangularAction σ ω (dilation t) f x)
      (ω * f x + x * deriv f x) 0 := by
  sorry

/-- README 2.3. The signed Mellin transforms `F_±(λ) = ∫_0^∞ x^{λ-1} f(±x) dx`. -/
def signedMellin (f : ℝ → ℂ) (ε : ℤˣ) (lam : ℂ) : ℂ :=
  mellin (fun x => f (((ε : ℤ) : ℝ) * x)) lam

/-- README 2.3. **Diagonal and central elements.** -/
theorem signedMellin_dilation_centre (σ ω : ℂ) (f : ℝ → ℂ) (ε : ℤˣ) (lam : ℂ) (τ b : ℝ) :
    signedMellin (triangularAction σ ω (dilation τ) f) ε lam =
      Complex.exp ((ω - lam) * τ) * signedMellin f ε lam ∧
    signedMellin (triangularAction σ ω (centralElement b) f) ε lam =
      Complex.exp (σ * b) * signedMellin f ε lam := by
  sorry

/-- README 2.3. **Infinitesimal operators** in the signed Mellin realization. -/
theorem signedMellin_infinitesimal (f : ℝ → ℂ) (ε : ℤˣ) (lam : ℂ) :
    (ContDiff ℝ 1 f → HasCompactSupport f → (0 : ℝ) ∉ tsupport f →
      signedMellin (deriv f) ε lam = -(((ε : ℤ) : ℂ) * (lam - 1)) * signedMellin f ε (lam - 1)) ∧
    signedMellin (fun x => (x : ℂ) * f x) ε lam = ((ε : ℤ) : ℂ) * signedMellin f ε (lam + 1) := by
  sorry

/-- README 2.3. The matrix kernel `K_{εη}(λ, μ; χ, g)`: `e^{ωτ + σb}/(2πi)` times the integral of
`x^{λ-1} e^{σ d ε x} |e^τ ε x + a|^{-μ}` over the `x > 0` with `η(e^τ ε x + a) > 0`. -/
def triangularKernel (σ ω : ℂ) (ε η : ℤˣ) (lam μ : ℂ) (g : TriangularGroup) : ℂ :=
  Complex.exp (ω * g.τ + σ * g.b) / (2 * π * Complex.I) *
    ∫ x in Ioi (0 : ℝ) ∩ {x | 0 < ((η : ℤ) : ℝ) * (Real.exp g.τ * ((ε : ℤ) : ℝ) * x + g.a)},
      (x : ℂ) ^ (lam - 1) * Complex.exp (σ * g.d * ((ε : ℤ) : ℂ) * x) *
        ((|Real.exp g.τ * ((ε : ℤ) : ℝ) * x + g.a| : ℝ) : ℂ) ^ (-μ)

/-- README 2.3. **Kernel realization.** -/
theorem signedMellin_triangularAction (σ ω : ℂ) (hσ : σ.re = 0) (f : ℝ → ℂ)
    (hf : ContDiff ℝ 2 f) (hfc : HasCompactSupport f) (hf0 : (0 : ℝ) ∉ tsupport f)
    (g : TriangularGroup) (hg : g.a ≠ 0) (ε : ℤˣ) (lam : ℂ) (c : ℝ) (hlam : 0 < lam.re)
    (hlc : lam.re < c) (hc : c < 1) :
    signedMellin (triangularAction σ ω g f) ε lam =
      ∑ η : ℤˣ, Complex.I * ∫ s : ℝ, triangularKernel σ ω ε η lam (c + s * Complex.I) g *
        signedMellin f η (c + s * Complex.I) := by
  sorry

/-- README 2.4. **Kernels of `g_+(t)`.** -/
theorem triangularKernel_translationElement (σ ω lam μ : ℂ) (t : ℝ) (ht : 0 < t) :
    (lam.re < μ.re → 0 < lam.re →
      triangularKernel σ ω 1 1 lam μ (translationElement t) =
        Gamma (μ - lam) * Gamma lam / (2 * π * Complex.I * Gamma μ) * (t : ℂ) ^ (lam - μ)) ∧
    (0 < lam.re → μ.re < 1 →
      triangularKernel σ ω (-1) 1 lam μ (translationElement t) =
        Gamma lam * Gamma (1 - μ) / (2 * π * Complex.I * Gamma (lam - μ + 1)) *
          (t : ℂ) ^ (lam - μ)) ∧
    (lam.re < μ.re → μ.re < 1 →
      triangularKernel σ ω (-1) (-1) lam μ (translationElement t) =
        Gamma (1 - μ) * Gamma (μ - lam) / (2 * π * Complex.I * Gamma (1 - lam)) *
          (t : ℂ) ^ (lam - μ)) ∧
    triangularKernel σ ω 1 (-1) lam μ (translationElement t) = 0 := by
  sorry

/-- README 2.4. **Kernel of `g_-(t)`.** -/
theorem triangularKernel_modulationElement (σ ω lam μ : ℂ) (t : ℝ) (hσt : (σ * t).re < 0)
    (hlm : μ.re < lam.re) :
    triangularKernel σ ω 1 1 lam μ (modulationElement t) =
      Gamma (lam - μ) * (-σ * t) ^ (μ - lam) / (2 * π * Complex.I) ∧
    triangularKernel σ ω 1 (-1) lam μ (modulationElement t) = 0 ∧
    triangularKernel σ ω (-1) 1 lam μ (modulationElement t) = 0 := by
  sorry

/-- README 2.5. **Whittaker kernels of `g_1(t)`** (at `σ = -1`). -/
theorem triangularKernel_equalTranslationModulation (ω lam μ : ℂ) (t : ℝ) (ht : 0 < t) :
    (0 < lam.re →
      triangularKernel (-1) ω 1 1 lam μ (equalTranslationModulation t) =
        Gamma lam * Complex.whittakerW ((1 - lam - μ) / 2) ((lam - μ) / 2) ((t : ℂ) ^ 2) /
          (2 * π * Complex.I * t)) ∧
    (0 < lam.re → μ.re < 1 →
      triangularKernel (-1) ω (-1) 1 lam μ (equalTranslationModulation t) =
        Gamma lam * Gamma (1 - μ) *
            Complex.whittakerM ((1 - lam - μ) / 2) ((lam - μ) / 2) ((t : ℂ) ^ 2) /
          (2 * π * Complex.I * t * Gamma (lam - μ + 1))) ∧
    triangularKernel (-1) ω 1 (-1) lam μ (equalTranslationModulation t) = 0 := by
  sorry

/-- README 2.5. **Whittaker kernels of `g_2(t)`** (at `σ = -1`). -/
theorem triangularKernel_oppositeTranslationModulation (ω lam μ : ℂ) (t : ℝ) (ht : 0 < t) :
    (μ.re < 1 →
      triangularKernel (-1) ω 1 1 lam μ (oppositeTranslationModulation t) =
        Gamma (1 - μ) * Complex.whittakerW ((lam + μ - 1) / 2) ((lam - μ) / 2) ((t : ℂ) ^ 2) /
          (2 * π * Complex.I * t)) ∧
    (0 < lam.re → μ.re < 1 →
      triangularKernel (-1) ω 1 (-1) lam μ (oppositeTranslationModulation t) =
        Gamma lam * Gamma (1 - μ) *
            Complex.whittakerM ((lam + μ - 1) / 2) ((lam - μ) / 2) ((t : ℂ) ^ 2) /
          (2 * π * Complex.I * t * Gamma (lam - μ + 1))) ∧
    triangularKernel (-1) ω (-1) 1 lam μ (oppositeTranslationModulation t) = 0 := by
  sorry

/-- README 2.5. **Reflection.** -/
theorem triangularKernel_reflect (σ ω : ℂ) (ε η : ℤˣ) (lam μ : ℂ) (g : TriangularGroup) :
    triangularKernel σ ω ε η lam μ ⟨-g.a, g.b, -g.d, g.τ⟩ =
      triangularKernel σ ω (-ε) (-η) lam μ g := by
  sorry

/-- README 2.6. **Kernel composition for `g_1(t)`** at `σ = -1`, along the factorizations
`g_1(t) = g_-(t) · g_+(t) z(t²/2)` (a) and `g_1(t) = g_+(t) · g_-(t) z(-t²/2)` (b, c), on the line
`Re ν = c`. -/
theorem triangularKernel_equalTranslationModulation_eq_integral (ω lam μ : ℂ) (t c : ℝ)
    (ht : 0 < t) :
    (0 < c → c < lam.re → c < μ.re →
      triangularKernel (-1) ω 1 1 lam μ (equalTranslationModulation t) =
        ∑ η : ℤˣ, Complex.I * ∫ s : ℝ,
          triangularKernel (-1) ω 1 η lam (c + s * Complex.I) (modulationElement t) *
            triangularKernel (-1) ω η 1 (c + s * Complex.I) μ
              (translationElement t * centralElement (t ^ 2 / 2))) ∧
    (0 < lam.re → lam.re < c → μ.re < c →
      triangularKernel (-1) ω 1 1 lam μ (equalTranslationModulation t) =
        ∑ η : ℤˣ, Complex.I * ∫ s : ℝ,
          triangularKernel (-1) ω 1 η lam (c + s * Complex.I) (translationElement t) *
            triangularKernel (-1) ω η 1 (c + s * Complex.I) μ
              (modulationElement t * centralElement (-(t ^ 2 / 2)))) ∧
    (0 < lam.re → μ.re < c → c < 1 →
      triangularKernel (-1) ω (-1) 1 lam μ (equalTranslationModulation t) =
        ∑ η : ℤˣ, Complex.I * ∫ s : ℝ,
          triangularKernel (-1) ω (-1) η lam (c + s * Complex.I) (translationElement t) *
            triangularKernel (-1) ω η 1 (c + s * Complex.I) μ
              (modulationElement t * centralElement (-(t ^ 2 / 2)))) := by
  sorry

/-! ## Layer 3: the Heisenberg group, Hermite and Laguerre functions -/

/-- README 3.1. The matrix element of `U(x, y, z)` in the Hermite basis: with
`α = (-x + iy)/√2` and `A = (x² + y²)/2`, `e^{i(z - xy/2)} e^{-A/2}` times
`(n!/m!)^{1/2} α^{m-n} L_n^{(m-n)}(A)` for `n ≤ m` and `(m!/n!)^{1/2} (-conj α)^{n-m}
L_m^{(n-m)}(A)` for `m < n`. -/
def hermiteMatrixElement (m n : ℕ) (x y z : ℝ) : ℂ :=
  let α : ℂ := (-x + y * Complex.I) / (Real.sqrt 2 : ℂ)
  let A : ℝ := (x ^ 2 + y ^ 2) / 2
  Complex.exp ((z - x * y / 2 : ℝ) * Complex.I) * (Real.exp (-A / 2) : ℂ) *
    if n ≤ m then
      (Real.sqrt (n.factorial / m.factorial) : ℂ) * α ^ (m - n) *
        (Polynomial.laguerre ((m : ℂ) - n) n).eval (A : ℂ)
    else
      (Real.sqrt (m.factorial / n.factorial) : ℂ) * (-conj α) ^ (n - m) *
        (Polynomial.laguerre ((n : ℂ) - m) m).eval (A : ℂ)

/-- README 3.1. **Hermite matrix elements.** -/
theorem matrixElement_schrodinger_hermite (m n : ℕ) (g : TauCeti.HeisenbergGroup ℝ) :
    matrixElement schrodinger (TauCeti.hermiteHilbertBasis ℂ) m n g =
      hermiteMatrixElement m n g.x g.y g.z := by
  sorry

/-- README 3.1. **Unitarity bound.** -/
theorem norm_laguerre_le (m n : ℕ) (hnm : n ≤ m) (A : ℝ) (hA : 0 ≤ A) :
    Real.sqrt (n.factorial / m.factorial) * A ^ (((m : ℝ) - n) / 2) * Real.exp (-A / 2) *
      |(Polynomial.laguerre ((m : ℝ) - n) n).eval A| ≤ 1 := by
  sorry

/-- README 3.2. **Addition theorem.** -/
theorem hasSum_hermiteMatrixElement_mul (m n : ℕ) (g h : TauCeti.HeisenbergGroup ℝ) :
    HasSum (fun k => hermiteMatrixElement m k g.x g.y g.z * hermiteMatrixElement k n h.x h.y h.z)
      (hermiteMatrixElement m n (g * h).x (g * h).y (g * h).z) := by
  sorry

/-- README 3.2. **Orthogonality.** -/
theorem integral_hermiteMatrixElement (m n m' n' : ℕ) :
    ∫ p : ℝ × ℝ, hermiteMatrixElement m n p.1 p.2 0 * conj (hermiteMatrixElement m' n' p.1 p.2 0) =
      if m = m' ∧ n = n' then (2 * π : ℂ) else 0 := by
  sorry

/-- README 3.2. **Completeness.** -/
theorem hermiteMatrixElement_hilbertBasis :
    ∃ b : HilbertBasis (ℕ × ℕ) ℂ (Lp ℂ 2 (volume : Measure (ℝ × ℝ))),
      ∀ i, (b i : ℝ × ℝ → ℂ) =ᵐ[volume]
        fun p => ((2 * π) ^ (-(1 / 2 : ℝ)) : ℝ) * hermiteMatrixElement i.1 i.2 p.1 p.2 0 := by
  sorry

/-- README 3.3. The Charlier polynomial `cₙ(x; a) = ∑_{j ≤ n} C(n, j) (-1/a)^j x(x-1)⋯(x-j+1)`,
the `₂F₀(-n, -x; ; -1/a)` of DLMF 18.20.8; the junk value at `a = 0` is `1`. -/
def charlier (a : ℝ) (n : ℕ) : Polynomial ℝ :=
  ∑ j ∈ Finset.range (n + 1),
    Polynomial.C ((n.choose j : ℝ) * (-a⁻¹) ^ j) * descPochhammer ℝ j

/-- README 3.3. **Charlier matrix elements.** -/
theorem hermiteMatrixElement_charlier (x : ℝ) (hx : 0 < x) (k n : ℕ) :
    hermiteMatrixElement k n x 0 0 =
      (((-1) ^ k / Real.sqrt (k.factorial * n.factorial) * (x ^ 2 / 2) ^ (((k : ℝ) + n) / 2) *
        Real.exp (-(x ^ 2 / 4)) * (charlier (x ^ 2 / 2) k).eval (n : ℝ) : ℝ) : ℂ) := by
  sorry

/-- README 3.3. **Charlier and Laguerre.** -/
theorem charlier_eq_laguerre (a : ℝ) (ha : a ≠ 0) (n x : ℕ) :
    (charlier a n).eval (x : ℝ) =
      (-1) ^ n * n.factorial * (a ^ n)⁻¹ * (Polynomial.laguerre ((x : ℝ) - n) n).eval a := by
  sorry

/-- README 3.3. **Duality.** -/
theorem charlier_symm (a : ℝ) (n x : ℕ) :
    (charlier a n).eval (x : ℝ) = (charlier a x).eval (n : ℝ) := by
  sorry

/-- README 3.3. **Orthogonality and completeness** of the Charlier polynomials. -/
theorem charlier_orthogonality (a : ℝ) (ha : 0 < a) :
    (∀ k p : ℕ, HasSum (fun x : ℕ => a ^ k * Real.exp (-a) / k.factorial *
        (a ^ x / x.factorial * (charlier a k).eval (x : ℝ) * (charlier a p).eval (x : ℝ)))
      (if k = p then 1 else 0)) ∧
    ∃ b : HilbertBasis ℕ ℝ (lp (fun _ : ℕ => ℝ) 2),
      ∀ k x : ℕ, b k x = Real.sqrt (a ^ (k + x) * Real.exp (-a) / (k.factorial * x.factorial)) *
        (charlier a k).eval (x : ℝ) := by
  sorry

/-- README 3.4. The Fock measure `π⁻¹ e^{-|ζ|²} dζ`. -/
def fockMeasure : Measure ℂ :=
  volume.withDensity fun ζ => ENNReal.ofReal (π⁻¹ * Real.exp (-‖ζ‖ ^ 2))

open scoped Classical in
/-- README 3.4. The Fock basis vector `ζⁿ / √n!`, and `0` if it is not square integrable. -/
def fockMonomial (n : ℕ) : Lp ℂ 2 fockMeasure :=
  if h : MemLp (fun ζ : ℂ => ζ ^ n / (Real.sqrt n.factorial : ℂ)) 2 fockMeasure then h.toLp _
  else 0

/-- README 3.4. The Fock space: the closed span of the `fockMonomial n`. -/
def fockSpace : Submodule ℂ (Lp ℂ 2 fockMeasure) :=
  (Submodule.span ℂ (Set.range fockMonomial)).topologicalClosure

/-- README 3.4. The Bargmann kernel `π^{-1/4} exp(-ζ²/2 + √2 ζ u - u²/2)`. -/
def bargmannKernel (ζ : ℂ) (u : ℝ) : ℂ :=
  ((π ^ (-(1 / 4 : ℝ)) : ℝ) : ℂ) *
    Complex.exp (-ζ ^ 2 / 2 + (Real.sqrt 2 : ℂ) * ζ * u - (u : ℂ) ^ 2 / 2)

/-- README 3.4. The Heisenberg group on functions on `ℂ`:
`e^{i(z - xy/2)} e^{-|w|²/4 - conj w ζ/√2} F(ζ + w/√2)` with `w = x + iy`. -/
def fockHeisenbergAction (p : TauCeti.HeisenbergGroup ℝ) (F : ℂ → ℂ) (ζ : ℂ) : ℂ :=
  let w : ℂ := ⟨p.x, p.y⟩
  Complex.exp ((p.z - p.x * p.y / 2 : ℝ) * Complex.I) *
    Complex.exp (-(‖w‖ ^ 2 / 4 : ℝ) - conj w * ζ / (Real.sqrt 2 : ℂ)) *
      F (ζ + w / (Real.sqrt 2 : ℂ))

/-- README 3.4. **Fock space.** -/
theorem fockSpace_spec :
    Orthonormal ℂ fockMonomial ∧
      ∀ F : Lp ℂ 2 fockMeasure,
        F ∈ fockSpace ↔ ∃ G : ℂ → ℂ, Differentiable ℂ G ∧ (F : ℂ → ℂ) =ᵐ[fockMeasure] G := by
  sorry

/-- README 3.4. **Bargmann transform.** -/
theorem bargmann_spec :
    ∃ B : Lp ℂ 2 (volume : Measure ℝ) →ₗᵢ[ℂ] Lp ℂ 2 fockMeasure,
      LinearMap.range B.toLinearMap = fockSpace ∧
      (∀ n, B (TauCeti.hermiteFunctionLp ℂ n) = fockMonomial n) ∧
      (∀ f : Lp ℂ 2 (volume : Measure ℝ),
        (B f : ℂ → ℂ) =ᵐ[fockMeasure] fun ζ => ∫ u, bargmannKernel ζ u * f u) ∧
      ∀ p f, (B (schrodinger p f) : ℂ → ℂ) =ᵐ[fockMeasure] fockHeisenbergAction p (B f) := by
  sorry

/-! ## Layer 4: the oscillator group on the Fock space -/

/-- README 4.1. The multiplier `e^{iλα - 2iδ} e^{-|w|²/4 - conj w ζ/√2}`. -/
def oscillatorCocycle (lam : ℝ) (g : Oscillator) (ζ : ℂ) : ℂ :=
  Complex.exp ((lam * g.α - 2 * g.δ : ℝ) * Complex.I) *
    Complex.exp (-(‖g.w‖ ^ 2 / 4 : ℝ) - conj g.w * ζ / (Real.sqrt 2 : ℂ))

/-- README 4.1. The oscillator representation on `L²(fockMeasure)`. -/
def oscillatorFock (lam : ℝ) : ContRepresentation ℂ Oscillator (Lp ℂ 2 fockMeasure) :=
  multiplierRep fockMeasure (oscillatorCocycle lam)

/-- README 4.1. **Oscillator representations.** -/
theorem oscillatorFock_spec (lam : ℝ) :
    (∀ g F, (oscillatorFock lam g F : ℂ → ℂ) =ᵐ[fockMeasure]
      multiplierAction (oscillatorCocycle lam) g F) ∧
    (oscillatorFock lam).IsUnitary ∧
    (∀ g, ∀ F ∈ fockSpace, oscillatorFock lam g F ∈ fockSpace) ∧
    (∀ W : Submodule ℂ (Lp ℂ 2 fockMeasure), W ≤ fockSpace →
      IsClosed (W : Set (Lp ℂ 2 fockMeasure)) →
      (∀ g, ∀ v ∈ W, oscillatorFock lam g v ∈ W) → W = ⊥ ∨ W = fockSpace) ∧
    ∀ p F, multiplierAction (oscillatorCocycle lam) (heisenbergToOscillator p) F =
      fockHeisenbergAction p F := by
  sorry

/-- README 4.1. **Oscillator matrix elements.** -/
theorem inner_fockMonomial_oscillatorFock (lam : ℝ) (g : Oscillator) (m n : ℕ) :
    ⟪fockMonomial m, oscillatorFock lam g (fockMonomial n)⟫_ℂ =
      Complex.exp ((lam * g.α - 2 * g.δ + n * g.α : ℝ) * Complex.I) *
        hermiteMatrixElement m n g.w.re g.w.im (g.w.re * g.w.im / 2) := by
  sorry

/-! ## Layer 5: Miller's group `G(0, 1)` and the Laguerre addition theorem -/

/-- README 5.1. Miller's complex group `G(0, 1)` with coordinates `(a, b, c, τ)`. -/
@[ext]
structure MillerGroup where
  /-- The central coordinate. -/
  a : ℂ
  /-- The raising coordinate. -/
  b : ℂ
  /-- The lowering coordinate. -/
  c : ℂ
  /-- The diagonal coordinate. -/
  τ : ℂ

namespace MillerGroup

instance : Mul MillerGroup :=
  ⟨fun g h => ⟨g.a + h.a + Complex.exp g.τ * g.c * h.b, g.b + Complex.exp g.τ * h.b,
    g.c + Complex.exp (-g.τ) * h.c, g.τ + h.τ⟩⟩

instance : One MillerGroup := ⟨⟨0, 0, 0, 0⟩⟩

instance : Inv MillerGroup :=
  ⟨fun g => ⟨g.c * g.b - g.a, -(Complex.exp (-g.τ) * g.b), -(Complex.exp g.τ * g.c), -g.τ⟩⟩

/-- The central coordinate of a product in `MillerGroup`. -/
@[simp] theorem mul_a (g h : MillerGroup) :
    (g * h).a = g.a + h.a + Complex.exp g.τ * g.c * h.b := rfl
/-- The raising coordinate of a product in `MillerGroup`. -/
@[simp] theorem mul_b (g h : MillerGroup) : (g * h).b = g.b + Complex.exp g.τ * h.b := rfl
/-- The lowering coordinate of a product in `MillerGroup`. -/
@[simp] theorem mul_c (g h : MillerGroup) : (g * h).c = g.c + Complex.exp (-g.τ) * h.c := rfl
/-- The diagonal coordinate of a product in `MillerGroup`. -/
@[simp] theorem mul_τ (g h : MillerGroup) : (g * h).τ = g.τ + h.τ := rfl
/-- The central coordinate of the identity in `MillerGroup`. -/
@[simp] theorem one_a : (1 : MillerGroup).a = 0 := rfl
/-- The raising coordinate of the identity in `MillerGroup`. -/
@[simp] theorem one_b : (1 : MillerGroup).b = 0 := rfl
/-- The lowering coordinate of the identity in `MillerGroup`. -/
@[simp] theorem one_c : (1 : MillerGroup).c = 0 := rfl
/-- The diagonal coordinate of the identity in `MillerGroup`. -/
@[simp] theorem one_τ : (1 : MillerGroup).τ = 0 := rfl
/-- The central coordinate of the inverse in `MillerGroup`. -/
@[simp] theorem inv_a (g : MillerGroup) : g⁻¹.a = g.c * g.b - g.a := rfl
/-- The raising coordinate of the inverse in `MillerGroup`. -/
@[simp] theorem inv_b (g : MillerGroup) : g⁻¹.b = -(Complex.exp (-g.τ) * g.b) := rfl
/-- The lowering coordinate of the inverse in `MillerGroup`. -/
@[simp] theorem inv_c (g : MillerGroup) : g⁻¹.c = -(Complex.exp g.τ * g.c) := rfl
/-- The diagonal coordinate of the inverse in `MillerGroup`. -/
@[simp] theorem inv_τ (g : MillerGroup) : g⁻¹.τ = -g.τ := rfl

instance : Group MillerGroup where
  mul_assoc g h k := by
    have h1 : Complex.exp g.τ * Complex.exp (-g.τ) = 1 := by rw [← Complex.exp_add]; simp
    ext
    · simp only [mul_a, mul_b, mul_c, mul_τ, Complex.exp_add]
      linear_combination (Complex.exp h.τ * h.c * k.b) * h1
    · simp only [mul_b, mul_τ, Complex.exp_add]; ring
    · simp only [mul_c, mul_τ, neg_add, Complex.exp_add]; ring
    · simp only [mul_τ]; ring
  one_mul g := by ext <;> simp
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by
    have h0 : Complex.exp (-g.τ) * Complex.exp g.τ = 1 := by rw [← Complex.exp_add]; simp
    ext
    · simp only [mul_a, inv_a, inv_c, inv_τ, one_a]
      linear_combination (-(g.c * g.b)) * h0
    · simp only [mul_b, inv_b, inv_τ, one_b]; ring
    · simp only [mul_c, inv_c, inv_τ, neg_neg, one_c]; ring
    · simp

end MillerGroup

/-- README 5.1. Miller's operators `e^{μ(bz + a) - ωτ} f(e^τ z + e^τ c)` (Miller (4.19)). -/
def millerAction (μ ω : ℂ) (g : MillerGroup) (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  Complex.exp (μ * (g.b * z + g.a) - ω * g.τ) * f (Complex.exp g.τ * z + Complex.exp g.τ * g.c)

/-- README 5.1. The real points of `G(0, 1)` in the triangular group:
`(a, b, c, τ) ↦ (e^τ c, a, b, τ)`. -/
def millerToTriangular (a b c τ : ℝ) : TriangularGroup := ⟨Real.exp τ * c, a, b, τ⟩

/-- README 5.1. Miller's matrix element `B_{lk}(g)` as the finite sum (4.24). -/
def millerMatrixElement (μ ω : ℂ) (l k : ℕ) (g : MillerGroup) : ℂ :=
  Complex.exp (μ * g.a + (k - ω) * g.τ) *
    ∑ s ∈ Finset.range (min k l + 1),
      (k.choose s : ℂ) * g.c ^ (k - s) * (μ * g.b) ^ (l - s) / (l - s).factorial

/-- README 5.1. **Representation law.** -/
theorem millerAction_mul (μ ω : ℂ) (g h : MillerGroup) (f : ℂ → ℂ) :
    millerAction μ ω (g * h) f = millerAction μ ω g (millerAction μ ω h f) := by
  sorry

/-- README 5.1. **Real points.** -/
theorem millerAction_eq_triangularAction (μ ω : ℂ) :
    (∀ (a b c τ a' b' c' τ' : ℝ),
      millerToTriangular (a + a' + Real.exp τ * c * b') (b + Real.exp τ * b')
          (c + Real.exp (-τ) * c') (τ + τ') =
        millerToTriangular a b c τ * millerToTriangular a' b' c' τ') ∧
    ∀ (a b c τ : ℝ) (f : ℂ → ℂ) (x : ℝ),
      millerAction μ ω ⟨a, b, c, τ⟩ f x =
        triangularAction μ (-ω) (millerToTriangular a b c τ) (fun y => f y) x := by
  sorry

/-- README 5.1. **Matrix elements.** -/
theorem hasSum_millerAction_monomial (μ ω : ℂ) (g : MillerGroup) (k : ℕ) (z : ℂ) :
    HasSum (fun l => millerMatrixElement μ ω l k g * z ^ l)
      (millerAction μ ω g (fun z => z ^ k) z) := by
  sorry

/-- README 5.1. **Laguerre form.** -/
theorem millerMatrixElement_eq_laguerre (μ ω : ℂ) (g : MillerGroup) (hc : g.c ≠ 0) (l k : ℕ) :
    millerMatrixElement μ ω l k g =
      Complex.exp (μ * g.a + (k - ω) * g.τ) * g.c ^ ((k : ℤ) - l) *
        (Polynomial.laguerre ((k : ℂ) - l) l).eval (-(μ * g.b * g.c)) := by
  sorry

/-- README 5.1. **Addition theorem.** -/
theorem hasSum_millerMatrixElement_mul (μ ω : ℂ) (g h : MillerGroup) (l k : ℕ) :
    HasSum (fun j => millerMatrixElement μ ω l j g * millerMatrixElement μ ω j k h)
      (millerMatrixElement μ ω l k (g * h)) := by
  sorry

/-- README 5.1. **Generating function.** -/
theorem hasSum_laguerre_generating (m : ℕ) (x z : ℂ) :
    HasSum (fun n : ℕ => (Polynomial.laguerre ((m : ℂ) - n) n).eval x * z ^ n)
      (Complex.exp (-x * z) * (1 + z) ^ m) := by
  sorry

/-! ## Supplier names cited in the README -/

#check @mellin
#check @mellin_comp_mul_left
#check @mellin_cpow_smul
#check @mellin_comp_rpow
#check @mellinInv_mellin_eq
#check @Complex.Gamma
#check @Complex.betaIntegral
#check @Complex.Gamma_mul_Gamma_eq_betaIntegral
#check @Complex.integral_cpow_mul_exp_neg_mul_Ioi
#check @MeasureTheory.Lp
#check @HilbertBasis
#check @Orthonormal
#check @Submodule.topologicalClosure
#check @MeasureTheory.Lp.fourierTransformₗᵢ
#check @TauCeti.HeisenbergGroup
#check @TauCeti.HeisenbergGroup.equivProd
#check @TauCeti.hermiteFunction
#check @TauCeti.hermiteFunctionLp
#check @TauCeti.hermiteHilbertBasis
#check @TauCeti.coe_hermiteHilbertBasis
#check @ContRepresentation
#check @ContRepresentation.IsUnitary

end TauCetiRoadmap.SpecialFunctionsAffineHeisenbergGroups
