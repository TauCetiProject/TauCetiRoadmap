module

public import Mathlib
public import TauCeti.GroupTheory.SpecificGroups.Heisenberg
public import TauCeti.RepresentationTheory.Continuous.MatrixCoefficient
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
public import TauCeti.RepresentationTheory.Continuous.LeftRegular
public import TauCeti.RepresentationTheory.Continuous.OneParameter

/-!
# Function-space models of noncompact groups: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the targets of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other targets of the README have the same standing, stated in prose.
Discharging this file finishes neither a layer nor the roadmap.

Bold headlines of the README that are not stated here, and what each lacks:
* the irreducibility and inequivalence of the sphere models (README 2.6) need the sphere
  `S^{n-1}` as an `M(n)`-space with its surface measure as a carrier of `multiplierRep`; the
  representation law and the norm identity of the sphere model are stated pointwise
  (`motionAction_mul`, `lintegral_motionAction`).

Prose bullets of the README that name results owned by other roadmaps are not stated either:
the irreducibility, equivalences, invariant forms, Hilbert completions and Casimir values of the
unitary representations of `SU(1,1)` (NoncompactQuantumSymmetry M4), the irreducibility of the
Schrödinger representation (NoncompactQuantumSymmetry M2, MetaplecticAutomorphicForms 1.2), the
derived action of a strongly continuous representation (SmoothBanachRepresentations), and the
facts about `SU(2)` that SpecialFunctionsSU2MatrixElements owns. This file states the concrete
models and the dictionaries to those roadmaps.

The definitions are roadmap-local and stated with their intended bodies. Representations on
`L²` are chosen by uniqueness: `multiplierRep μ α` and `SU11.principalSeries τ e` are the
continuous representations whose operators agree almost everywhere with the pointwise formulas
when one exists, and the trivial representation otherwise; the theorems say that one exists.
Theorems are stated with `sorry`. Section numbers in docstrings are those of the README.
-/

@[expose] public section

noncomputable section

universe u

namespace TauCetiRoadmap.SpecialFunctionsGroupModels

open MeasureTheory Filter Topology Set Matrix AddCircle
open scoped Real ComplexConjugate ComplexOrder ENNReal NNReal InnerProductSpace ContDiff

/-! ## Layer 0: groups in coordinates -/

/-- README 0.1. The group `SU(1,1)` of matrices `[[a, b], [conj b, conj a]]` of determinant `1`,
as a subgroup of `SL(2, ℂ)`. -/
def su11 : Subgroup (SpecialLinearGroup (Fin 2) ℂ) where
  carrier := {g | g.1 1 0 = conj (g.1 0 1) ∧ g.1 1 1 = conj (g.1 0 0)}
  mul_mem' := by
    rintro g h ⟨hg₁, hg₂⟩ ⟨hh₁, hh₂⟩
    show (g.1 * h.1) 1 0 = conj ((g.1 * h.1) 0 1) ∧ (g.1 * h.1) 1 1 = conj ((g.1 * h.1) 0 0)
    simp only [Matrix.mul_apply, Fin.sum_univ_two, hg₁, hg₂, hh₁, hh₂, map_add, map_mul,
      Complex.conj_conj]
    constructor <;> ring
  one_mem' := by simp
  inv_mem' := by
    rintro g ⟨hg₁, hg₂⟩
    show (adjugate g.1) 1 0 = conj ((adjugate g.1) 0 1) ∧
      (adjugate g.1) 1 1 = conj ((adjugate g.1) 0 0)
    simp [Matrix.adjugate_fin_two, hg₁, hg₂]

/-- README 0.1. `SU(1,1)` as a type, with the subspace topology of `SL(2, ℂ)`. -/
abbrev SU11 := ↥su11

/-- README 0.1. **`SU(1,1)` is the isometry group of `|z₀|² - |z₁|²` in `SL(2, ℂ)`**: the
group `SU(1,1)` of RealSemisimpleLieGroups §5.7 at `n = 1`, with `J = diag(1, -1)`. -/
theorem mem_su11_iff (g : SpecialLinearGroup (Fin 2) ℂ) :
    g ∈ su11 ↔ g.1ᴴ * !![1, 0; 0, -1] * g.1 = !![1, 0; 0, -1] := by
  sorry

namespace SU11

/-- The Borel σ-algebra on `SU(1,1)`. -/
instance : MeasurableSpace SU11 := borel SU11

instance : BorelSpace SU11 := ⟨rfl⟩

/-- README 0.1. The entry `a = g₀₀` of `g = [[a, b], [conj b, conj a]]`. -/
def entryA (g : SU11) : ℂ := g.1.1 0 0

/-- README 0.1. The entry `b = g₀₁` of `g = [[a, b], [conj b, conj a]]`. -/
def entryB (g : SU11) : ℂ := g.1.1 0 1

/-- README 0.1. The element `[[a, b], [conj b, conj a]]` of `SU(1,1)` for `|a|² - |b|² = 1`. -/
def ofPair (a b : ℂ) (h : Complex.normSq a - Complex.normSq b = 1) : SU11 :=
  ⟨⟨!![a, b; conj b, conj a], by
      rw [Matrix.det_fin_two_of, Complex.mul_conj, Complex.mul_conj]
      exact_mod_cast h⟩, by
    show _ ∧ _
    simp⟩

/-- README 0.1. The rotation `k_α = diag(e^{iα/2}, e^{-iα/2})`. -/
def rotation (α : ℝ) : SU11 :=
  ofPair (Complex.exp (((α / 2 : ℝ) : ℂ) * Complex.I)) 0 (by
    rw [map_zero, sub_zero, Complex.normSq_eq_norm_sq, Complex.norm_exp_ofReal_mul_I]
    norm_num)

/-- README 0.1. The boost `b_t = [[cosh (t/2), sinh (t/2)], [sinh (t/2), cosh (t/2)]]`. -/
def boost (t : ℝ) : SU11 :=
  ofPair (Real.cosh (t / 2) : ℂ) (Real.sinh (t / 2) : ℂ) (by
    rw [Complex.normSq_ofReal, Complex.normSq_ofReal]
    linear_combination Real.cosh_sq_sub_sinh_sq (t / 2))

/-- README 0.1. The second boost `[[cosh (t/2), i sinh (t/2)], [-i sinh (t/2), cosh (t/2)]]`. -/
def boostY (t : ℝ) : SU11 :=
  ofPair (Real.cosh (t / 2) : ℂ) ((Real.sinh (t / 2) : ℂ) * Complex.I) (by
    rw [Complex.normSq_mul, Complex.normSq_I, Complex.normSq_ofReal, Complex.normSq_ofReal]
    linear_combination Real.cosh_sq_sub_sinh_sq (t / 2))

/-- README 0.1. The Euler parametrization `g(α, t, γ) = k_α b_t k_γ`, with the letters and order
of the `SU(2)` Euler angles of SpecialFunctionsSU2MatrixElements. -/
def euler (α t γ : ℝ) : SU11 := rotation α * boost t * rotation γ

/-- README 0.1. The circle subgroup `K = {k_α}`, the elements with `b = 0`. -/
def diagonalSubgroup : Subgroup SU11 where
  carrier := {g | g.1.1 0 1 = 0}
  mul_mem' := by
    rintro g h (hg : g.1.1 0 1 = 0) (hh : h.1.1 0 1 = 0)
    show (g.1.1 * h.1.1) 0 1 = 0
    simp [Matrix.mul_apply, Fin.sum_univ_two, hg, hh]
  one_mem' := by
    show (1 : SpecialLinearGroup (Fin 2) ℂ).1 0 1 = 0
    simp
  inv_mem' := by
    rintro g (hg : g.1.1 0 1 = 0)
    show (adjugate g.1.1) 0 1 = 0
    simp [Matrix.adjugate_fin_two, hg]

/-- README 0.1. **Euler factorization**, first entry: `a = cosh(t/2) e^{i(α+γ)/2}`. -/
theorem entryA_euler (α t γ : ℝ) :
    entryA (euler α t γ) =
      (Real.cosh (t / 2) : ℂ) * Complex.exp ((((α + γ) / 2 : ℝ) : ℂ) * Complex.I) := by
  sorry

/-- README 0.1. **Euler factorization**, second entry: `b = sinh(t/2) e^{i(α-γ)/2}`. -/
theorem entryB_euler (α t γ : ℝ) :
    entryB (euler α t γ) =
      (Real.sinh (t / 2) : ℂ) * Complex.exp ((((α - γ) / 2 : ℝ) : ℂ) * Complex.I) := by
  sorry

/-- README 0.1. The Euler-angle domain `[0, 2π) × (0, ∞) × [-2π, 2π)`. -/
def eulerDomain : Set (ℝ × ℝ × ℝ) := Ico 0 (2 * π) ×ˢ Ioi 0 ×ˢ Ico (-(2 * π)) (2 * π)

/-- README 0.1. **Euler angles exist**: every element is `g(α, t, γ)` with `0 ≤ α < 2π`,
`t ≥ 0` and `-2π ≤ γ < 2π`. -/
theorem exists_euler_eq (g : SU11) :
    ∃ α ∈ Ico 0 (2 * π), ∃ t, 0 ≤ t ∧ ∃ γ ∈ Ico (-(2 * π)) (2 * π), g = euler α t γ := by
  sorry

/-- README 0.1. **Euler angles are unique for `t > 0`**: the Euler map is a bijection from
`eulerDomain` onto the elements with `b ≠ 0`. -/
theorem bijOn_euler :
    BijOn (fun p : ℝ × ℝ × ℝ => euler p.1 p.2.1 p.2.2) eulerDomain {g : SU11 | entryB g ≠ 0} := by
  sorry

/-- README 0.1. **Conversion to the `SU(2)` Euler angles**, first part: the `SU(2)` middle factor
`[[cos (β/2), sin (β/2)], [-sin (β/2), cos (β/2)]]` at `β = it` is `boostY t`. -/
theorem coe_boostY (t : ℝ) :
    (boostY t).1.1 =
      !![Complex.cos ((t : ℂ) * Complex.I / 2), Complex.sin ((t : ℂ) * Complex.I / 2);
        -Complex.sin ((t : ℂ) * Complex.I / 2), Complex.cos ((t : ℂ) * Complex.I / 2)] := by
  sorry

/-- README 0.1. **Conversion to the `SU(2)` Euler angles**, second part:
`k_α b_{it} k_γ = g(α + π/2, t, γ - π/2)`. -/
theorem rotation_mul_boostY_mul_rotation (α t γ : ℝ) :
    rotation α * boostY t * rotation γ = euler (α + π / 2) t (γ - π / 2) := by
  sorry

/-- README 0.1. The Haar measure `(8π²)⁻¹ sinh t dα dt dγ` in Euler angles. -/
def eulerHaar : Measure SU11 :=
  (ENNReal.ofReal (8 * π ^ 2)⁻¹ •
    (volume.restrict eulerDomain).withDensity (fun p => ENNReal.ofReal (Real.sinh p.2.1))).map
      (fun p => euler p.1 p.2.1 p.2.2)

/-- README 0.1. **Haar measure of `SU(1,1)`.** -/
theorem isHaarMeasure_eulerHaar : eulerHaar.IsHaarMeasure := by
  sorry

/-- README 0.1. **`SU(1,1)` is unimodular**: `eulerHaar` is right invariant. -/
theorem isMulRightInvariant_eulerHaar : eulerHaar.IsMulRightInvariant := by
  sorry

/-- README 0.1. The basis `b₁` of `su(1,1)`. -/
def lieB₁ : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1 / 2; 1 / 2, 0]

/-- README 0.1. The basis `b₂` of `su(1,1)`. -/
def lieB₂ : Matrix (Fin 2) (Fin 2) ℂ := !![0, Complex.I / 2; -Complex.I / 2, 0]

/-- README 0.1. The basis `b₃` of `su(1,1)`. -/
def lieB₃ : Matrix (Fin 2) (Fin 2) ℂ := !![Complex.I / 2, 0; 0, -Complex.I / 2]

/-- README 0.1. **Lie algebra of `SU(1,1)`.** The brackets of the basis, and `boost`, `boostY`,
`rotation` are one-parameter subgroups with tangents `b₁`, `b₂`, `b₃`. -/
theorem lieBasis :
    (lieB₁ * lieB₂ - lieB₂ * lieB₁ = -lieB₃ ∧ lieB₂ * lieB₃ - lieB₃ * lieB₂ = lieB₁ ∧
      lieB₃ * lieB₁ - lieB₁ * lieB₃ = lieB₂) ∧
    (∀ s t : ℝ, boost (s + t) = boost s * boost t ∧ boostY (s + t) = boostY s * boostY t ∧
      rotation (s + t) = rotation s * rotation t) ∧
    ∀ i j : Fin 2, HasDerivAt (fun s => (boost s).1.1 i j) (lieB₁ i j) 0 ∧
      HasDerivAt (fun s => (boostY s).1.1 i j) (lieB₂ i j) 0 ∧
      HasDerivAt (fun s => (rotation s).1.1 i j) (lieB₃ i j) 0 := by
  sorry

end SU11

/-- README 0.2. The left Haar measure `a⁻² da db` of the `ax + b` group in coordinates. -/
def axbLeftHaar : Measure (ℝ × ℝ) :=
  (volume.restrict {p : ℝ × ℝ | 0 < p.1}).withDensity fun p => ENNReal.ofReal (p.1 ^ 2)⁻¹

/-- README 0.2. The right Haar measure `a⁻¹ da db` of the `ax + b` group in coordinates. -/
def axbRightHaar : Measure (ℝ × ℝ) :=
  (volume.restrict {p : ℝ × ℝ | 0 < p.1}).withDensity fun p => ENNReal.ofReal p.1⁻¹

/-- README 0.2. **Haar measures of the `ax + b` group.** With `(a, b)(a', b') = (aa', ab' + b)`,
`a⁻² da db` is left invariant, `a⁻¹ da db` is right invariant, and the left measure is not
right invariant. -/
theorem axb_haar :
    (∀ a b : ℝ, 0 < a →
      Measure.map (fun p : ℝ × ℝ => (a * p.1, a * p.2 + b)) axbLeftHaar = axbLeftHaar) ∧
    (∀ a b : ℝ, 0 < a →
      Measure.map (fun p : ℝ × ℝ => (p.1 * a, p.1 * b + p.2)) axbRightHaar = axbRightHaar) ∧
    ∀ a b : ℝ, 0 < a → a ≠ 1 →
      Measure.map (fun p : ℝ × ℝ => (p.1 * a, p.1 * b + p.2)) axbLeftHaar ≠ axbLeftHaar := by
  sorry

/-- README 0.2. **Haar measure of the Heisenberg group.** Lebesgue measure in the coordinates
`(x, y, z)` of Tau Ceti's `HeisenbergGroup ℝ` is left and right invariant. -/
theorem heisenberg_haar (g : TauCeti.HeisenbergGroup ℝ) :
    Measure.map (fun p : ℝ × ℝ × ℝ => TauCeti.HeisenbergGroup.equivProd
        (g * TauCeti.HeisenbergGroup.equivProd.symm p)) volume = volume ∧
    Measure.map (fun p : ℝ × ℝ × ℝ => TauCeti.HeisenbergGroup.equivProd
        (TauCeti.HeisenbergGroup.equivProd.symm p * g)) volume = volume := by
  sorry

/-- README 0.2. The oscillator-group matrix `s(w, α, δ)`, in the corrected form of the
Klimyk–Vilenkin parametrization. -/
def oscillatorMatrix (w : ℂ) (α δ : ℝ) : Matrix (Fin 3) (Fin 3) ℂ :=
  !![1, Complex.exp (-(α : ℂ) * Complex.I) * conj w / 2,
      (δ : ℂ) * Complex.I - (Complex.normSq w : ℂ) / 8;
    0, Complex.exp (-(α : ℂ) * Complex.I), -w / 2;
    0, 0, 1]

/-- README 0.2. **Oscillator group law.** -/
theorem oscillatorMatrix_mul (w₁ w₂ : ℂ) (α₁ α₂ δ₁ δ₂ : ℝ) :
    oscillatorMatrix w₁ α₁ δ₁ * oscillatorMatrix w₂ α₂ δ₂ =
      oscillatorMatrix (w₁ + Complex.exp (-(α₁ : ℂ) * Complex.I) * w₂) (α₁ + α₂)
        (δ₁ + δ₂ - (Complex.exp (-(α₁ : ℂ) * Complex.I) * conj w₁ * w₂).im / 4) := by
  sorry

/-- README 0.2. The `ax + b` group `{x ↦ a x + b, a > 0}`. -/
@[ext]
structure AxB where
  /-- The dilation `a > 0`. -/
  a : ℝ
  /-- The translation `b`. -/
  b : ℝ
  a_pos : 0 < a

namespace AxB

instance : Mul AxB := ⟨fun g h => ⟨g.a * h.a, g.a * h.b + g.b, mul_pos g.a_pos h.a_pos⟩⟩

instance : One AxB := ⟨⟨1, 0, one_pos⟩⟩

instance : Inv AxB := ⟨fun g => ⟨g.a⁻¹, -(g.a⁻¹ * g.b), inv_pos.2 g.a_pos⟩⟩

@[simp] theorem mul_a (g h : AxB) : (g * h).a = g.a * h.a := rfl
@[simp] theorem mul_b (g h : AxB) : (g * h).b = g.a * h.b + g.b := rfl
@[simp] theorem one_a : (1 : AxB).a = 1 := rfl
@[simp] theorem one_b : (1 : AxB).b = 0 := rfl
@[simp] theorem inv_a (g : AxB) : g⁻¹.a = g.a⁻¹ := rfl
@[simp] theorem inv_b (g : AxB) : g⁻¹.b = -(g.a⁻¹ * g.b) := rfl

instance : Group AxB where
  mul_assoc g h k := by ext <;> simp <;> ring
  one_mul g := by ext <;> simp
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by ext <;> simp [g.a_pos.ne']

/-- README 2.4. The `ax + b` group acts on the half-line by `g • x = x / a`, so that
`g⁻¹ • x = a x`. -/
instance : MulAction AxB ℝ where
  smul g x := x / g.a
  one_smul x := div_one x
  mul_smul g h x := by
    show x / (g.a * h.a) = x / h.a / g.a
    rw [div_div, mul_comm]

end AxB

/-- README 0.3. `SO(n)` as the special orthogonal matrices of Mathlib. -/
abbrev SOn (n : ℕ) := Matrix.specialOrthogonalGroup (Fin n) ℝ

instance (n : ℕ) : MeasurableSpace (SOn n) := borel (SOn n)

instance (n : ℕ) : BorelSpace (SOn n) := ⟨rfl⟩

/-- README 0.3. A matrix of `SO(n)` acting on `ℝⁿ`. -/
def rotE {n : ℕ} (k : SOn n) (a : EuclideanSpace ℝ (Fin n)) : EuclideanSpace ℝ (Fin n) :=
  Matrix.toEuclideanLin k.1 a

theorem rotE_mul {n : ℕ} (k k' : SOn n) (a : EuclideanSpace ℝ (Fin n)) :
    rotE (k * k') a = rotE k (rotE k' a) := by
  simp only [rotE, Submonoid.coe_mul, toEuclideanLin_eq_toLin_orthonormal]
  rw [Matrix.toLin_mul _ (EuclideanSpace.basisFun (Fin n) ℝ).toBasis]
  rfl

theorem rotE_one {n : ℕ} (a : EuclideanSpace ℝ (Fin n)) : rotE (1 : SOn n) a = a := by
  simp [rotE]

theorem rotE_add {n : ℕ} (k : SOn n) (a b : EuclideanSpace ℝ (Fin n)) :
    rotE k (a + b) = rotE k a + rotE k b := by
  simp [rotE]

/-- README 0.3. The motion group `M(n) = ℝⁿ ⋊ SO(n)`, with `(a, k)(a', k') = (a + k a', k k')`. -/
@[ext]
structure MotionGroup (n : ℕ) where
  /-- The translation part. -/
  a : EuclideanSpace ℝ (Fin n)
  /-- The rotation part. -/
  k : SOn n

namespace MotionGroup

variable {n : ℕ}

instance : Mul (MotionGroup n) := ⟨fun g h => ⟨g.a + rotE g.k h.a, g.k * h.k⟩⟩

instance : One (MotionGroup n) := ⟨⟨0, 1⟩⟩

instance : Inv (MotionGroup n) := ⟨fun g => ⟨-rotE g.k⁻¹ g.a, g.k⁻¹⟩⟩

@[simp] theorem mul_a (g h : MotionGroup n) : (g * h).a = g.a + rotE g.k h.a := rfl

@[simp] theorem mul_k (g h : MotionGroup n) : (g * h).k = g.k * h.k := rfl

@[simp] theorem one_a : (1 : MotionGroup n).a = 0 := rfl

@[simp] theorem one_k : (1 : MotionGroup n).k = 1 := rfl

@[simp] theorem inv_a (g : MotionGroup n) : g⁻¹.a = -rotE g.k⁻¹ g.a := rfl

@[simp] theorem inv_k (g : MotionGroup n) : g⁻¹.k = g.k⁻¹ := rfl

instance : Group (MotionGroup n) where
  mul_assoc g h l := by
    ext1
    · simp [rotE_add, rotE_mul, add_assoc]
    · simp [mul_assoc]
  one_mul g := by ext1 <;> simp [rotE_one]
  mul_one g := by ext1 <;> simp [rotE]
  inv_mul_cancel g := by
    ext1
    · simp
    · simp

/-- README 0.3. The topology of `ℝⁿ × SO(n)`. -/
instance : TopologicalSpace (MotionGroup n) :=
  TopologicalSpace.induced (fun g => (g.a, g.k)) inferInstance

/-- README 0.3. **`M(n)` is a topological group.** -/
instance : IsTopologicalGroup (MotionGroup n) := by
  sorry

/-- README 0.3. **`M(n)` is locally compact.** -/
instance : LocallyCompactSpace (MotionGroup n) := by
  sorry

instance : MeasurableSpace (MotionGroup n) := borel (MotionGroup n)

instance : BorelSpace (MotionGroup n) := ⟨rfl⟩

end MotionGroup

/-- README 0.3. The Haar measure `da dk` of `M(n)` in coordinates, for a measure `ν` on
`SO(n)`. -/
def motionHaar (n : ℕ) (ν : Measure (SOn n)) : Measure (MotionGroup n) :=
  (volume.prod ν).map fun p => (⟨p.1, p.2⟩ : MotionGroup n)

/-- README 0.3. **Haar measure of `M(n)`; unimodularity.** For the Haar probability measure `ν`
of `SO(n)`, `da dk` is a Haar measure of `M(n)` and is right invariant. -/
theorem motionHaar_isHaarMeasure (n : ℕ) (ν : Measure (SOn n)) [ν.IsHaarMeasure]
    [IsProbabilityMeasure ν] :
    (motionHaar n ν).IsHaarMeasure ∧ (motionHaar n ν).IsMulRightInvariant := by
  sorry

/-- README 0.3. **Polar decomposition of `M(n)`, `n ≥ 2`.** Every `g` is
`(0, k₁)(r e₁, 1)(0, k₂)` with `r = |g.a|`, and `r ≥ 0` is determined by `g`. -/
theorem motionGroup_polar (n : ℕ) (g : MotionGroup (n + 2)) :
    (∃ k₁ k₂ : SOn (n + 2), g = ⟨0, k₁⟩ * ⟨‖g.a‖ • EuclideanSpace.single 0 1, 1⟩ * ⟨0, k₂⟩) ∧
    ∀ (r : ℝ) (k₁ k₂ : SOn (n + 2)), 0 ≤ r →
      g = ⟨0, k₁⟩ * ⟨r • EuclideanSpace.single 0 1, 1⟩ * ⟨0, k₂⟩ → r = ‖g.a‖ := by
  sorry

/-- README 0.3. The Lorentz boost `Λ_s (x, y) = (x cosh s + y sinh s, x sinh s + y cosh s)`. -/
def lorentzBoost (s : ℝ) (p : ℝ × ℝ) : ℝ × ℝ :=
  (p.1 * Real.cosh s + p.2 * Real.sinh s, p.1 * Real.sinh s + p.2 * Real.cosh s)

theorem lorentzBoost_add (s s' : ℝ) (p : ℝ × ℝ) :
    lorentzBoost (s + s') p = lorentzBoost s (lorentzBoost s' p) := by
  simp only [lorentzBoost, Real.cosh_add, Real.sinh_add, Prod.mk.injEq]
  constructor <;> ring

/-- README 0.3. The group `ISO(1,1) = ℝ² ⋊ SO₀(1,1)`, with
`(a, s)(a', s') = (a + Λ_s a', s + s')`. -/
@[ext]
structure ISO11 where
  /-- The translation part. -/
  a : ℝ × ℝ
  /-- The rapidity of the boost. -/
  s : ℝ

namespace ISO11

instance : Mul ISO11 := ⟨fun g h => ⟨g.a + lorentzBoost g.s h.a, g.s + h.s⟩⟩

instance : One ISO11 := ⟨⟨0, 0⟩⟩

instance : Inv ISO11 := ⟨fun g => ⟨-lorentzBoost (-g.s) g.a, -g.s⟩⟩

@[simp] theorem mul_a (g h : ISO11) : (g * h).a = g.a + lorentzBoost g.s h.a := rfl

@[simp] theorem mul_s (g h : ISO11) : (g * h).s = g.s + h.s := rfl

instance : Group ISO11 where
  mul_assoc g h l := by
    ext1
    · simp only [mul_a, mul_s, lorentzBoost_add, add_assoc]
      simp only [lorentzBoost, Prod.fst_add, Prod.snd_add, Prod.ext_iff]
      constructor <;> ring
    · simp [add_assoc]
  one_mul g := by
    ext1
    · change (0 : ℝ × ℝ) + lorentzBoost 0 g.a = g.a
      simp [lorentzBoost]
    · change (0 : ℝ) + g.s = g.s
      simp
  mul_one g := by
    ext1
    · change g.a + lorentzBoost g.s 0 = g.a
      simp [lorentzBoost]
    · change g.s + 0 = g.s
      simp
  inv_mul_cancel g := by
    ext1
    · change -lorentzBoost (-g.s) g.a + lorentzBoost (-g.s) g.a = 0
      simp
    · change -g.s + g.s = 0
      simp

/-- README 0.3. The topology of `ℝ² × ℝ`. -/
instance : TopologicalSpace ISO11 := TopologicalSpace.induced (fun g => (g.a, g.s)) inferInstance

/-- README 0.3. **`ISO(1,1)` is a topological group.** -/
instance : IsTopologicalGroup ISO11 := by
  sorry

/-- README 0.3. **`ISO(1,1)` is locally compact.** -/
instance : LocallyCompactSpace ISO11 := by
  sorry

instance : MeasurableSpace ISO11 := borel ISO11

instance : BorelSpace ISO11 := ⟨rfl⟩

end ISO11

/-- README 0.3. **Haar measure of `ISO(1,1)`; unimodularity.** Lebesgue measure `da₁ da₂ ds` is
a Haar measure and is right invariant. -/
theorem iso11Haar_isHaarMeasure :
    let μ : Measure ISO11 := (volume : Measure ((ℝ × ℝ) × ℝ)).map fun p => ⟨p.1, p.2⟩
    μ.IsHaarMeasure ∧ μ.IsMulRightInvariant := by
  sorry

/-! ## Layer 1: G-spaces, quasi-invariant measures and multipliers -/

section Multipliers

variable {G X : Type*} [Group G] [MulAction G X]

/-- README 1.1. `μ` is quasi-invariant with Radon–Nikodym density `ρ`:
`(g • ·)_* μ = ρ g · μ` for every `g`. -/
def IsQuasiInvariantWith [MeasurableSpace X] (μ : Measure X) (ρ : G → X → ℝ≥0∞) : Prop :=
  ∀ g : G, Measure.map (fun x => g • x) μ = μ.withDensity (ρ g)

/-- README 1.2. The multiplier action `(T(g) f)(x) = α(g, x) f(g⁻¹ • x)` on functions. -/
def multiplierAction (α : G → X → ℂ) (g : G) (f : X → ℂ) (x : X) : ℂ :=
  α g x * f (g⁻¹ • x)

/-- README 1.2. The multiplier cocycle identity `α(gh, x) = α(g, x) α(h, g⁻¹ • x)`,
`α(1, x) = 1`. -/
def IsMultiplierCocycle (α : G → X → ℂ) : Prop :=
  (∀ x, α 1 x = 1) ∧ ∀ g h x, α (g * h) x = α g x * α h (g⁻¹ • x)

open scoped Classical in
/-- README 1.3. The multiplier representation on `L²(X, μ)`: the continuous representation
whose operators agree almost everywhere with `multiplierAction α`, when one exists. -/
def multiplierRep [MeasurableSpace X] (μ : Measure X) (α : G → X → ℂ) :
    ContRepresentation ℂ G (Lp ℂ 2 μ) :=
  if h : ∃ U : ContRepresentation ℂ G (Lp ℂ 2 μ),
      ∀ g f, (U g f : X → ℂ) =ᵐ[μ] multiplierAction α g f then h.choose
  else .ofMonoidHom 1

/-- README 1.1. **Radon–Nikodym cocycle.** The densities of a quasi-invariant σ-finite measure
satisfy `ρ(gh, x) = ρ(g, x) ρ(h, g⁻¹ • x)` almost everywhere. -/
theorem IsQuasiInvariantWith.cocycle [MeasurableSpace X] [MeasurableConstSMul G X]
    {μ : Measure X} [SigmaFinite μ] {ρ : G → X → ℝ≥0∞} (hρ : IsQuasiInvariantWith μ ρ)
    (hρm : ∀ g, Measurable (ρ g)) (g h : G) :
    ∀ᵐ x ∂μ, ρ (g * h) x = ρ g x * ρ h (g⁻¹ • x) := by
  sorry

/-- README 1.2. **Representation law.** `multiplierAction α` is an action on functions exactly
when `α` is a multiplier cocycle. -/
theorem multiplierAction_law_iff (α : G → X → ℂ) :
    ((∀ f x, multiplierAction α 1 f x = f x) ∧
      ∀ g h f x, multiplierAction α (g * h) f x =
        multiplierAction α g (multiplierAction α h f) x) ↔ IsMultiplierCocycle α := by
  sorry

/-- README 1.3. **Uniqueness of the `L²` realization.** Two representations on `L²(μ)` that agree
almost everywhere with the multiplier formula are equal. -/
theorem multiplierRep_unique [MeasurableSpace X] {μ : Measure X} {α : G → X → ℂ}
    {U V : ContRepresentation ℂ G (Lp ℂ 2 μ)}
    (hU : ∀ g f, (U g f : X → ℂ) =ᵐ[μ] multiplierAction α g f)
    (hV : ∀ g f, (V g f : X → ℂ) =ᵐ[μ] multiplierAction α g f) : U = V := by
  sorry

/-- README 1.3. **Existence of the `L²` realization.** A multiplier cocycle along a
quasi-measure-preserving action whose operators are bounded on `L²(μ)` is realized by a
representation. -/
theorem exists_multiplierRepresentation [MeasurableSpace X] {μ : Measure X} {α : G → X → ℂ}
    (hα : IsMultiplierCocycle α)
    (hquasi : ∀ g : G, QuasiMeasurePreserving (fun x : X => g • x) μ μ)
    (hMem : ∀ g (f : Lp ℂ 2 μ), MemLp (multiplierAction α g f) 2 μ)
    (hbound : ∀ g, ∃ C : ℝ, ∀ f : Lp ℂ 2 μ,
      ‖(hMem g f).toLp (multiplierAction α g f)‖ ≤ C * ‖f‖) :
    ∃ U : ContRepresentation ℂ G (Lp ℂ 2 μ),
      ∀ g f, (U g f : X → ℂ) =ᵐ[μ] multiplierAction α g f := by
  sorry

/-- README 1.3. **Unitarity criterion.** A unitary representation realizing `multiplierAction α`
on `L²(μ)` exists exactly when `|α(g, x)|² = ρ(g, x)` almost everywhere. -/
theorem exists_isUnitary_multiplierAction_iff [MeasurableSpace X] [MeasurableConstSMul G X]
    {μ : Measure X} [SigmaFinite μ] {ρ : G → X → ℝ≥0∞} {α : G → X → ℂ}
    (hα : IsMultiplierCocycle α) (hαm : ∀ g, Measurable (α g)) (hρm : ∀ g, Measurable (ρ g))
    (hρ : IsQuasiInvariantWith μ ρ) :
    (∃ U : ContRepresentation ℂ G (Lp ℂ 2 μ),
        U.IsUnitary ∧ ∀ g f, (U g f : X → ℂ) =ᵐ[μ] multiplierAction α g f) ↔
      ∀ g, ∀ᵐ x ∂μ, ‖α g x‖ₑ ^ 2 = ρ g x := by
  sorry

/-- README 1.3. **The multiplier representation.** Under the unitarity condition,
`multiplierRep μ α` realizes `multiplierAction α` and is unitary. -/
theorem multiplierRep_spec [MeasurableSpace X] [MeasurableConstSMul G X]
    {μ : Measure X} [SigmaFinite μ] {ρ : G → X → ℝ≥0∞} {α : G → X → ℂ}
    (hα : IsMultiplierCocycle α) (hαm : ∀ g, Measurable (α g)) (hρm : ∀ g, Measurable (ρ g))
    (hρ : IsQuasiInvariantWith μ ρ) (hu : ∀ g, ∀ᵐ x ∂μ, ‖α g x‖ₑ ^ 2 = ρ g x) :
    (∀ g f, (multiplierRep μ α g f : X → ℂ) =ᵐ[μ] multiplierAction α g f) ∧
      (multiplierRep μ α).IsUnitary := by
  sorry

/-- README 1.3. **Strong continuity.** For a continuous action of a locally compact group on a
locally compact space with a regular measure and a jointly continuous multiplier, the unitary
multiplier representation has continuous orbit maps. -/
theorem continuous_multiplierRep_apply [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    [MeasurableSpace X] [BorelSpace X] [ContinuousSMul G X]
    {μ : Measure X} [μ.Regular] [SigmaFinite μ] {ρ : G → X → ℝ≥0∞} {α : G → X → ℂ}
    (hα : IsMultiplierCocycle α) (hαc : Continuous fun p : G × X => α p.1 p.2)
    (hρm : ∀ g, Measurable (ρ g)) (hρ : IsQuasiInvariantWith μ ρ)
    (hu : ∀ g, ∀ᵐ x ∂μ, ‖α g x‖ₑ ^ 2 = ρ g x) (f : Lp ℂ 2 μ) :
    Continuous fun g => multiplierRep μ α g f := by
  sorry

/-- README 1.4. The cocycle `β(x) α(g, x) / β(g⁻¹ • x)` cohomologous to `α`. -/
def coboundaryTwist (β : X → ℂ) (α : G → X → ℂ) (g : G) (x : X) : ℂ :=
  β x * α g x / β (g⁻¹ • x)

/-- README 1.4. **Cohomologous multipliers.** Multiplication by a nowhere-vanishing `β`
intertwines `α` with its twist; the twist is a cocycle when `α` is, and has the same modulus
when `|β| = 1`. -/
theorem multiplierAction_coboundaryTwist (β : X → ℂ) (hβ : ∀ x, β x ≠ 0) (α : G → X → ℂ) :
    (∀ g f x, β x * multiplierAction α g f x =
      multiplierAction (coboundaryTwist β α) g (fun y => β y * f y) x) ∧
    (IsMultiplierCocycle α → IsMultiplierCocycle (coboundaryTwist β α)) ∧
    ((∀ x, ‖β x‖ = 1) → ∀ g x, ‖coboundaryTwist β α g x‖ = ‖α g x‖) := by
  sorry

/-- README 1.3. **Quasi-regular representation.** The square root of a Radon–Nikodym cocycle is
a multiplier cocycle of modulus squared `ρ`. -/
theorem isMultiplierCocycle_sqrt (ρ : G → X → ℝ≥0) (h₁ : ∀ x, ρ 1 x = 1)
    (hmul : ∀ g h x, ρ (g * h) x = ρ g x * ρ h (g⁻¹ • x)) :
    IsMultiplierCocycle (fun g x => ((NNReal.sqrt (ρ g x) : ℝ) : ℂ)) ∧
      ∀ g x, ‖((NNReal.sqrt (ρ g x) : ℝ) : ℂ)‖ ^ 2 = ρ g x := by
  sorry

end Multipliers

/-- README 1.3. **Left regular representation.** For a left-invariant measure on `G` acting on
itself, the multiplier representation with `α = 1` is Tau Ceti's left regular representation. -/
theorem multiplierRep_one_eq_leftRegular {G : Type*} [Group G] [MeasurableSpace G]
    [MeasurableMul G] (μ : Measure G) [SigmaFinite μ] [μ.IsMulLeftInvariant] :
    multiplierRep μ (fun (_ : G) (_ : G) => (1 : ℂ)) = μ.leftRegular ℂ ℂ 2 := by
  sorry

/-! ## Layer 2: function-space models -/

instance : Fact (0 < 2 * π) := ⟨Real.two_pi_pos⟩

/-- The circle `ℝ / 2πℤ` carrying the angle `θ`. -/
local notation "𝕋" => AddCircle (2 * π)

namespace SU11

/-- README 2.1. The denominator `b z + conj a` of the fractional linear map of `g`. -/
def circleDenominator (g : SU11) (z : ℂ) : ℂ := entryB g * z + conj (entryA g)

/-- README 2.1. The right action `e^{iθ} ↦ (a e^{iθ} + conj b) / (b e^{iθ} + conj a)` of
`SU(1,1)` on the circle, written on angles. -/
def circleAct (g : SU11) (θ : 𝕋) : 𝕋 :=
  ((Complex.arg ((entryA g * fourier 1 θ + conj (entryB g)) /
    circleDenominator g (fourier 1 θ)) : ℝ) : 𝕋)

/-- README 2.1. **The circle as an `SU(1,1)`-space**: `circleAct` is a right action. -/
theorem circleAct_mul (g h : SU11) (θ : 𝕋) : circleAct (g * h) θ = circleAct h (circleAct g θ) := by
  sorry

/-- README 2.1. The identity acts trivially on the circle. -/
theorem circleAct_one (θ : 𝕋) : circleAct 1 θ = θ := by
  sorry

/-- README 2.1. The left action `g • θ = circleAct g⁻¹ θ` associated with the right action. -/
scoped instance circleMulAction : MulAction SU11 𝕋 where
  smul g θ := circleAct g⁻¹ θ
  one_smul θ := by
    show circleAct (1 : SU11)⁻¹ θ = θ
    rw [inv_one, circleAct_one]
  mul_smul g h θ := by
    show circleAct (g * h)⁻¹ θ = circleAct g⁻¹ (circleAct h⁻¹ θ)
    rw [_root_.mul_inv_rev, circleAct_mul]

/-- README 2.1. **Poisson density.** The image of the Haar probability measure under
`circleAct g` has density `|a - b e^{iθ}|⁻²`. -/
theorem map_circleAct_haar (g : SU11) :
    Measure.map (circleAct g) (haarAddCircle (T := 2 * π)) =
      (haarAddCircle (T := 2 * π)).withDensity
        (fun θ => ENNReal.ofReal (‖entryA g - entryB g * fourier 1 θ‖ ^ 2)⁻¹) := by
  sorry

/-- README 2.1. The principal-series multiplier `|u|^{2τ} (u / |u|)^{e}`, `u = b e^{iθ} + conj a`,
with `e = 2ε ∈ {0, 1}`. -/
def principalMultiplier (τ : ℂ) (e : Fin 2) (g : SU11) (θ : 𝕋) : ℂ :=
  let u := circleDenominator g (fourier 1 θ)
  ((‖u‖ : ℂ) ^ (2 * τ)) * (u / (‖u‖ : ℂ)) ^ (e : ℕ)

/-- README 2.1. The principal-series action on functions on the circle. -/
def principalAction (τ : ℂ) (e : Fin 2) (g : SU11) (f : 𝕋 → ℂ) (θ : 𝕋) : ℂ :=
  principalMultiplier τ e g θ * f (circleAct g θ)

/-- README 2.1. **Principal series: identity.** -/
theorem principalAction_one (τ : ℂ) (e : Fin 2) (f : 𝕋 → ℂ) : principalAction τ e 1 f = f := by
  sorry

/-- README 2.1. **Principal series: representation law.** -/
theorem principalAction_mul (τ : ℂ) (e : Fin 2) (g h : SU11) (f : 𝕋 → ℂ) :
    principalAction τ e (g * h) f = principalAction τ e g (principalAction τ e h f) := by
  sorry

/-- README 2.1. **The principal-series multiplier is a multiplier cocycle** for the left action
`g • θ = circleAct g⁻¹ θ`. -/
theorem isMultiplierCocycle_principalMultiplier (τ : ℂ) (e : Fin 2) :
    IsMultiplierCocycle (principalMultiplier τ e) := by
  sorry

/-- README 2.1. A representation on `L²(𝕋)` realizes the principal series when it agrees almost
everywhere with the pointwise formula and has continuous orbit maps. -/
def IsPrincipalSeriesRealization (τ : ℂ) (e : Fin 2)
    (U : ContRepresentation ℂ SU11 (Lp ℂ 2 (haarAddCircle (T := 2 * π)))) : Prop :=
  (∀ g f, (U g f : 𝕋 → ℂ) =ᵐ[haarAddCircle] principalAction τ e g f) ∧
    ∀ f, Continuous fun g => U g f

open scoped Classical in
/-- README 2.1. The principal series `T_{(τ, e/2)}` of `SU(1,1)` on `L²(𝕋)`: the realization of
the pointwise formula when one exists, and the trivial representation otherwise. -/
def principalSeries (τ : ℂ) (e : Fin 2) :
    ContRepresentation ℂ SU11 (Lp ℂ 2 (haarAddCircle (T := 2 * π))) :=
  if h : ∃ U, IsPrincipalSeriesRealization τ e U then h.choose else .ofMonoidHom 1

/-- README 2.1. **Principal series on `L²`.** For every `τ` the formula is realized by a
representation on `L²(𝕋)` with continuous orbits. -/
theorem exists_principalSeries (τ : ℂ) (e : Fin 2) :
    ∃ U, IsPrincipalSeriesRealization τ e U := by
  sorry

/-- README 2.1. The `L²` action agrees almost everywhere with the pointwise formula. -/
theorem principalSeries_ae_eq (τ : ℂ) (e : Fin 2) (g : SU11)
    (f : Lp ℂ 2 (haarAddCircle (T := 2 * π))) :
    (principalSeries τ e g f : 𝕋 → ℂ) =ᵐ[haarAddCircle] principalAction τ e g f := by
  sorry

/-- README 2.1. Every orbit map of the principal series is continuous. -/
theorem continuous_principalSeries_apply (τ : ℂ) (e : Fin 2)
    (f : Lp ℂ 2 (haarAddCircle (T := 2 * π))) :
    Continuous fun g => principalSeries τ e g f := by
  sorry

/-- README 2.1. **Unitarity of the principal series.** `T_{(τ, e/2)}` is unitary on `L²(𝕋)`
exactly on the line `Re τ = -1/2`. -/
theorem isUnitary_principalSeries_iff (τ : ℂ) (e : Fin 2) :
    (principalSeries τ e).IsUnitary ↔ τ.re = -1 / 2 := by
  sorry

/-- README 2.1. **Hermitian adjoint.** `T_{(τ, ε)}(g)* = T_{(-conj τ - 1, ε)}(g⁻¹)`. -/
theorem inner_principalSeries (τ : ℂ) (e : Fin 2) (g : SU11)
    (f h : Lp ℂ 2 (haarAddCircle (T := 2 * π))) :
    ⟪principalSeries τ e g f, h⟫_ℂ = ⟪f, principalSeries (-conj τ - 1) e g⁻¹ h⟫_ℂ := by
  sorry

/-- README 2.1. **Weights.** `e_m = e^{inθ}`, `m = n - e/2`, satisfies
`T(k_α) e_m = e^{imα} e_m`. -/
theorem principalSeries_rotation (τ : ℂ) (e : Fin 2) (n : ℤ) (α : ℝ) :
    principalSeries τ e (rotation α) (fourierLp (T := 2 * π) 2 n) =
      Complex.exp (((n : ℂ) - (e : ℂ) / 2) * α * Complex.I) • fourierLp (T := 2 * π) 2 n := by
  sorry

/-- README 2.1. `k_{2π} = -1`. -/
theorem coe_rotation_two_pi : (rotation (2 * π)).1.1 = -1 := by
  sorry

/-- README 2.1. The rotation `k_t = [[cos t, -sin t], [sin t, cos t]]` of `SL(2, ℝ)`. -/
def rotationSL2R (t : ℝ) : SpecialLinearGroup (Fin 2) ℝ :=
  ⟨!![Real.cos t, -Real.sin t; Real.sin t, Real.cos t], by
    rw [Matrix.det_fin_two_of]
    linear_combination Real.cos_sq_add_sin_sq t⟩

/-- README 2.1. Conjugation `h ↦ C₀ h C₀⁻¹` by `C₀ = ((1 + i)/2) [[1, i], [1, -i]]`, the fixed
conjugacy of NoncompactQuantumSymmetry M4: `[[p, q], [r, s]]` goes to
`a = (p + s)/2 - i (q - r)/2`, `b = (p - s)/2 + i (q + r)/2`. -/
def ofSL2R (h : SpecialLinearGroup (Fin 2) ℝ) : SU11 :=
  ofPair ⟨(h.1 0 0 + h.1 1 1) / 2, -(h.1 0 1 - h.1 1 0) / 2⟩
    ⟨(h.1 0 0 - h.1 1 1) / 2, (h.1 0 1 + h.1 1 0) / 2⟩ (by
      have h2 := h.2
      rw [Matrix.det_fin_two] at h2
      simp only [Complex.normSq_mk]
      linear_combination h2)

/-- README 2.1. **The fixed conjugacy `SL(2, ℝ) → SU(1,1)`**: `ofSL2R` is the homomorphism
`h ↦ C₀ h C₀⁻¹`, and it maps `k_t` to `k_{2t}`. -/
theorem ofSL2R_spec :
    let C₀ : Matrix (Fin 2) (Fin 2) ℂ := ((1 + Complex.I) / 2) • !![1, Complex.I; 1, -Complex.I]
    (∀ h h', ofSL2R (h * h') = ofSL2R h * ofSL2R h') ∧
    (∀ h, (ofSL2R h).1.1 = C₀ * h.1.map (↑) * C₀⁻¹) ∧
    ∀ t, ofSL2R (rotationSL2R t) = rotation (2 * t) := by
  sorry

/-- README 2.1. The transport `(W F)(k_t) = e^{i e t} F(π - 2t)` of a function on the circle to a
function on `SO(2)`. -/
def compactTransport (e : Fin 2) (F : 𝕋 → ℂ) (t : ℝ) : ℂ :=
  Complex.exp ((e : ℂ) * t * Complex.I) * F ((π - 2 * t : ℝ) : 𝕋)

/-- README 2.1. **Agreement with normalized parabolic induction.** Under `W` and `ofSL2R`,
`T_{(τ, e/2)}` is the compact picture `f ↦ r(h⁻¹ k_t)^{-(1 + ν)} f(θ(h⁻¹ k_t))` with
`ν = -(2τ + 1)`, where `h⁻¹ k_t` has first column `r (cos θ, sin θ)`; and `W F` has parity `e`. -/
theorem principalAction_compactPicture (τ : ℂ) (e : Fin 2) (h : SpecialLinearGroup (Fin 2) ℝ)
    (F : 𝕋 → ℂ) :
    (∀ t : ℝ,
      let x := (h⁻¹ * rotationSL2R t).1
      compactTransport e (principalAction τ e (ofSL2R h) F) t =
        ((√(x 0 0 ^ 2 + x 1 0 ^ 2) : ℝ) : ℂ) ^ (2 * τ) *
          compactTransport e F (Complex.arg ⟨x 0 0, x 1 0⟩)) ∧
    ∀ t : ℝ, compactTransport e F (t + π) = (-1) ^ (e : ℕ) * compactTransport e F t := by
  sorry

end SU11

/-- README 2.2. The complementary-series weight `Γ(τ - n + 1) / Γ(-τ - n)`. -/
def complementaryWeight (τ : ℝ) (n : ℤ) : ℝ :=
  Real.Gamma (τ - n + 1) / Real.Gamma (-τ - n)

/-- README 2.2. **Complementary weights.** For `-1 < τ < 0` the weights are positive and even
in `n`; at `τ = -1/2` they are all `1`. -/
theorem complementaryWeight_pos (τ : ℝ) (hτ : τ ∈ Ioo (-1) 0) (n : ℤ) :
    0 < complementaryWeight τ n ∧ complementaryWeight τ (-n) = complementaryWeight τ n ∧
      complementaryWeight (-1 / 2) n = 1 := by
  sorry

/-- README 2.2. **Agreement with the compact eigenforms of NoncompactQuantumSymmetry M5.** With
`ν = -(2τ + 1)`, `w(j) / w(0) = ∏_{k=1}^{j} (2k - 1 - ν) / (2k - 1 + ν)`. -/
theorem complementaryWeight_ratio (τ : ℝ) (hτ : τ ∈ Ioo (-1) 0) (j : ℕ) :
    let ν := -(2 * τ + 1)
    complementaryWeight τ j / complementaryWeight τ 0 =
      ∏ k ∈ Finset.Icc 1 j, (2 * (k : ℝ) - 1 - ν) / (2 * (k : ℝ) - 1 + ν) := by
  sorry

/-- README 2.3. The weighted Bergman probability measure `((k-1)/π) (1 - |z|²)^{k-2} dA` on
the unit disc. -/
def bergmanMeasure (k : ℕ) : Measure ℂ :=
  (volume.restrict (Metric.ball (0 : ℂ) 1)).withDensity
    fun z => ENNReal.ofReal (((k : ℝ) - 1) / π * (1 - ‖z‖ ^ 2) ^ (k - 2))

namespace SU11

/-- README 2.3. The right action `z ↦ (a z + conj b) / (b z + conj a)` on the disc. -/
def diskAct (g : SU11) (z : ℂ) : ℂ :=
  (entryA g * z + conj (entryB g)) / circleDenominator g z

/-- README 2.3. The holomorphic discrete series action `(b z + conj a)^{-k} h(z · g)`. -/
def discreteAction (k : ℕ) (g : SU11) (h : ℂ → ℂ) (z : ℂ) : ℂ :=
  circleDenominator g z ^ (-(k : ℤ)) * h (diskAct g z)

/-- README 2.3. **Holomorphic discrete series.** For `k ≥ 2` the action maps the disc to itself,
is a right action on the disc, preserves holomorphy and preserves the weighted Bergman norm. -/
theorem discreteAction_isometry (k : ℕ) (hk : 2 ≤ k) (g g' : SU11) (h : ℂ → ℂ)
    (hh : DifferentiableOn ℂ h (Metric.ball 0 1)) :
    MapsTo (diskAct g) (Metric.ball 0 1) (Metric.ball 0 1) ∧
    (∀ z ∈ Metric.ball (0 : ℂ) 1,
      discreteAction k (g * g') h z = discreteAction k g (discreteAction k g' h) z) ∧
    DifferentiableOn ℂ (discreteAction k g h) (Metric.ball 0 1) ∧
    ∫⁻ z, ‖discreteAction k g h z‖ₑ ^ 2 ∂bergmanMeasure k = ∫⁻ z, ‖h z‖ₑ ^ 2 ∂bergmanMeasure k := by
  sorry

/-- README 2.3. The antiholomorphic discrete series action `conj((b z + conj a)^{-k}) h(z · g)`. -/
def antiDiscreteAction (k : ℕ) (g : SU11) (h : ℂ → ℂ) (z : ℂ) : ℂ :=
  conj (circleDenominator g z ^ (-(k : ℤ))) * h (diskAct g z)

/-- README 2.3. **Antiholomorphic discrete series.** It is the complex conjugate of the
holomorphic action; for `k ≥ 2` it is a right action on the disc, preserves antiholomorphy and
preserves the weighted Bergman norm. -/
theorem antiDiscreteAction_spec (k : ℕ) (hk : 2 ≤ k) (g g' : SU11) (h : ℂ → ℂ)
    (hh : DifferentiableOn ℂ (fun z => conj (h z)) (Metric.ball 0 1)) :
    antiDiscreteAction k g h = (fun z => conj (discreteAction k g (fun w => conj (h w)) z)) ∧
    (∀ z ∈ Metric.ball (0 : ℂ) 1,
      antiDiscreteAction k (g * g') h z = antiDiscreteAction k g (antiDiscreteAction k g' h) z) ∧
    DifferentiableOn ℂ (fun z => conj (antiDiscreteAction k g h z)) (Metric.ball 0 1) ∧
    ∫⁻ z, ‖antiDiscreteAction k g h z‖ₑ ^ 2 ∂bergmanMeasure k =
      ∫⁻ z, ‖h z‖ₑ ^ 2 ∂bergmanMeasure k := by
  sorry

/-- README 2.3. **Weights of the discrete series.** `T(k_α) zʲ = e^{i(k/2 + j)α} zʲ` in the
holomorphic model and `T(k_α) conj(z)ʲ = e^{-i(k/2 + j)α} conj(z)ʲ` in the antiholomorphic one. -/
theorem discreteAction_rotation (k j : ℕ) (α : ℝ) :
    discreteAction k (rotation α) (fun z => z ^ j) =
      (fun z => Complex.exp (((k : ℂ) / 2 + j) * α * Complex.I) * z ^ j) ∧
    antiDiscreteAction k (rotation α) (fun z => conj z ^ j) =
      (fun z => Complex.exp (-(((k : ℂ) / 2 + j) * α * Complex.I)) * conj z ^ j) := by
  sorry

end SU11

/-- README 2.3. **Bergman norms and kernel.** `‖zʲ‖² = C(k-1+j, j)⁻¹` and the reproducing
kernel is `(1 - z conj w)^{-k}`. -/
theorem bergman_monomial_kernel (k : ℕ) (hk : 2 ≤ k) (j : ℕ) (z w : ℂ) (hz : ‖z‖ < 1)
    (hw : ‖w‖ < 1) :
    ∫⁻ x, ‖x ^ j‖ₑ ^ 2 ∂bergmanMeasure k = ((Nat.choose (k - 1 + j) j : ℝ≥0∞))⁻¹ ∧
    HasSum (fun i : ℕ => (Nat.choose (k - 1 + i) i : ℂ) * (z * conj w) ^ i)
      ((1 - z * conj w) ^ (-(k : ℤ))) := by
  sorry

/-- README 2.4. The invariant measure `dx / x` on the half-line. -/
def halfLineMeasure : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity fun x => ENNReal.ofReal x⁻¹

/-- README 2.4. The multiplier `e^{i λ b x}` of the `ax + b` group on the half-line. -/
def axbCocycle (lam : ℝ) (g : AxB) (x : ℝ) : ℂ := Complex.exp ((lam * g.b * x : ℝ) * Complex.I)

/-- README 2.4. The representation `(T_λ(a, b) f)(x) = e^{i λ b x} f(a x)` on `L²(ℝ₊, dx/x)`. -/
def axbRep (lam : ℝ) : ContRepresentation ℂ AxB (Lp ℂ 2 halfLineMeasure) :=
  multiplierRep halfLineMeasure (axbCocycle lam)

/-- README 2.4. **Representations of the `ax + b` group.** For real `λ, λ' ≠ 0`, `T_λ` realizes
the formula, is unitary and is irreducible, and `T_λ ≅ T_λ'` exactly when `λ` and `λ'` have the
same sign. -/
theorem axbRep_spec (lam lam' : ℝ) (hlam : lam ≠ 0) (hlam' : lam' ≠ 0) :
    (∀ g f, (axbRep lam g f : ℝ → ℂ) =ᵐ[halfLineMeasure] multiplierAction (axbCocycle lam) g f) ∧
    (axbRep lam).IsUnitary ∧
    (∀ W : Submodule ℂ (Lp ℂ 2 halfLineMeasure), IsClosed (W : Set (Lp ℂ 2 halfLineMeasure)) →
      (∀ g, ∀ v ∈ W, axbRep lam g v ∈ W) → W = ⊥ ∨ W = ⊤) ∧
    ((∃ U : Lp ℂ 2 halfLineMeasure ≃ₗᵢ[ℂ] Lp ℂ 2 halfLineMeasure,
        ∀ g v, U (axbRep lam g v) = axbRep lam' g (U v)) ↔ 0 < lam * lam') := by
  sorry

/-- README 2.5. Tau Ceti's Heisenberg group acts on the line through `g • x = x - g.x`. -/
instance : MulAction (TauCeti.HeisenbergGroup ℝ) ℝ where
  smul g x := x - g.x
  one_smul x := sub_zero x
  mul_smul g h x := by
    show x - (g.x + h.x) = x - h.x - g.x
    ring

/-- README 2.5. The Schrödinger multiplier `e^{i(z + y x)}`. -/
def schrodingerCocycle (g : TauCeti.HeisenbergGroup ℝ) (x : ℝ) : ℂ :=
  Complex.exp ((g.z + g.y * x : ℝ) * Complex.I)

/-- README 2.5. The Schrödinger representation `(U(g) f)(x) = e^{i(z + y x)} f(x + g.x)` on
`L²(ℝ)`. -/
def schrodinger : ContRepresentation ℂ (TauCeti.HeisenbergGroup ℝ) (Lp ℂ 2 (volume : Measure ℝ)) :=
  multiplierRep volume schrodingerCocycle

/-- README 2.5. **Schrödinger representation.** It realizes the formula and is unitary. -/
theorem schrodinger_spec :
    (∀ g f, (schrodinger g f : ℝ → ℂ) =ᵐ[volume] multiplierAction schrodingerCocycle g f) ∧
    schrodinger.IsUnitary := by
  sorry

open scoped FourierTransform in
/-- README 2.5. **Fourier dictionary.** For integrable `f` and `𝓕 f(ξ) = ∫ e^{-2πivξ} f(v) dv`,
`𝓕(U(g) f)(ξ) = e^{i(2πxξ + z - xy)} 𝓕 f(ξ - y/(2π))`. -/
theorem fourier_schrodinger (g : TauCeti.HeisenbergGroup ℝ) (f : ℝ → ℂ) (hf : Integrable f)
    (ξ : ℝ) :
    𝓕 (multiplierAction schrodingerCocycle g f) ξ =
      Complex.exp ((2 * π * g.x * ξ + g.z - g.x * g.y : ℝ) * Complex.I) *
        𝓕 f (ξ - g.y / (2 * π)) := by
  sorry

/-- README 2.6. The sphere model of the motion group: `(a, k)` acts by
`e^{i R ⟨a, ξ⟩} f(k⁻¹ ξ)`. -/
def motionAction {n : ℕ} (R : ℝ) (g : MotionGroup n) (f : EuclideanSpace ℝ (Fin n) → ℂ)
    (ξ : EuclideanSpace ℝ (Fin n)) : ℂ :=
  Complex.exp ((R * ⟪g.a, ξ⟫_ℝ : ℝ) * Complex.I) * f (rotE g.k⁻¹ ξ)

/-- README 2.6. **Sphere model: representation law.** -/
theorem motionAction_mul {n : ℕ} (R : ℝ) (g h : MotionGroup n)
    (f : EuclideanSpace ℝ (Fin n) → ℂ) :
    motionAction R (g * h) f = motionAction R g (motionAction R h f) ∧ motionAction R 1 f = f := by
  sorry

/-- README 2.6. **Sphere model: unitarity.** For real `R` the action preserves the `L²` norm for
the surface measure on the unit sphere. -/
theorem lintegral_motionAction {n : ℕ} (R : ℝ) (g : MotionGroup n)
    (f : EuclideanSpace ℝ (Fin n) → ℂ) (hf : Measurable f) :
    ∫⁻ ξ, ‖motionAction R g f ξ‖ₑ ^ 2 ∂(volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere =
      ∫⁻ ξ, ‖f ξ‖ₑ ^ 2 ∂(volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere := by
  sorry

/-! ## Layer 3: matrix elements -/

section MatrixElements

variable {G H ι : Type*} [Group G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- README 3.1. The matrix element `D_{mn}(g) = ⟪e_m, U(g) e_n⟫` of a representation in a Hilbert
basis, Edmonds's `⟨m|D(g)|n⟩`. -/
def matrixElement (U : ContRepresentation ℂ G H) (e : HilbertBasis ι ℂ H) (m n : ι) (g : G) : ℂ :=
  ⟪e m, U g (e n)⟫_ℂ

/-- README 3.1. **Bridge to Tau Ceti's matrix coefficient.** When `U` is norm continuous,
`D_{mn}(g)` is the conjugate of `matrixCoeff U hU (e n) (e m) g`. -/
theorem matrixElement_eq_conj_matrixCoeff [TopologicalSpace G] (U : ContRepresentation ℂ G H)
    (hU : Continuous U) (e : HilbertBasis ι ℂ H) (m n : ι) (g : G) :
    matrixElement U e m n g = conj (U.matrixCoeff hU (e n) (e m) g) := by
  sorry

/-- README 3.1. Continuous orbit maps give continuous matrix elements. -/
theorem continuous_matrixElement [TopologicalSpace G] (U : ContRepresentation ℂ G H)
    (e : HilbertBasis ι ℂ H) (m n : ι) (h : Continuous fun g => U g (e n)) :
    Continuous (matrixElement U e m n) := by
  sorry

variable [CompleteSpace H]

/-- README 3.2. **Addition theorem.** `D_{mn}(gh) = Σₖ D_{mk}(g) D_{kn}(h)`. -/
theorem hasSum_matrixElement_mul (U : ContRepresentation ℂ G H) (e : HilbertBasis ι ℂ H)
    (m n : ι) (g h : G) :
    HasSum (fun k => matrixElement U e m k g * matrixElement U e k n h)
      (matrixElement U e m n (g * h)) := by
  sorry

/-- README 3.2. The series of the addition theorem converges absolutely. -/
theorem summable_norm_matrixElement_mul (U : ContRepresentation ℂ G H) (e : HilbertBasis ι ℂ H)
    (m n : ι) (g h : G) :
    Summable (fun k => ‖matrixElement U e m k g * matrixElement U e k n h‖) := by
  sorry

/-- README 3.2. `D_{mn}(1) = δ_{mn}`. -/
theorem matrixElement_one [DecidableEq ι] (U : ContRepresentation ℂ G H)
    (e : HilbertBasis ι ℂ H) (m n : ι) :
    matrixElement U e m n 1 = if m = n then 1 else 0 := by
  sorry

/-- README 3.2. For a unitary representation, `D_{mn}(g⁻¹) = conj D_{nm}(g)`. -/
theorem matrixElement_inv (U : ContRepresentation ℂ G H) (hU : U.IsUnitary)
    (e : HilbertBasis ι ℂ H) (m n : ι) (g : G) :
    matrixElement U e m n g⁻¹ = conj (matrixElement U e n m g) := by
  sorry

/-- README 3.2. **Unitarity relations.** A representation is unitary exactly when the columns of
its matrix are orthonormal; then the rows are orthonormal. -/
theorem isUnitary_iff_hasSum_matrixElement [DecidableEq ι] (U : ContRepresentation ℂ G H)
    (e : HilbertBasis ι ℂ H) :
    (U.IsUnitary ↔ ∀ g m n, HasSum (fun k => conj (matrixElement U e k m g) *
        matrixElement U e k n g) (if m = n then 1 else 0)) ∧
    (U.IsUnitary → ∀ g m n,
      HasSum (fun k => matrixElement U e m k g * conj (matrixElement U e n k g))
        (if m = n then 1 else 0)) := by
  sorry

/-- README 3.3. The weight space `{v | U(κ u) v = u^j v}` of a circle subgroup `κ`. -/
def weightSpace (U : ContRepresentation ℂ G H) (κ : Circle →* G) (j : ℤ) : Submodule ℂ H where
  carrier := {v | ∀ u : Circle, U (κ u) v = ((u : ℂ) ^ j) • v}
  add_mem' := by
    intro v w hv hw u
    simp only [map_add, hv u, hw u, smul_add]
  zero_mem' := by
    intro u
    simp
  smul_mem' := by
    intro c v hv u
    simp only [map_smul, hv u]
    exact smul_comm _ _ _

/-- README 3.3. **Weight decomposition.** For a unitary representation whose restriction to the
circle subgroup has continuous orbits, `H` is the Hilbert sum of the weight spaces; a matrix
element between weight vectors of weights `j_m`, `j_n` transforms by
`D_{mn}(κ u₁ g κ u₂) = u₁^{j_m} u₂^{j_n} D_{mn}(g)`. -/
theorem isHilbertSum_weightSpace (U : ContRepresentation ℂ G H) (hU : U.IsUnitary)
    (κ : Circle →* G) (hκ : ∀ v, Continuous fun u => U (κ u) v) (e : HilbertBasis ι ℂ H)
    (m n : ι) (jm jn : ℤ) (hm : e m ∈ weightSpace U κ jm) (hn : e n ∈ weightSpace U κ jn)
    (u₁ u₂ : Circle) (g : G) :
    IsHilbertSum ℂ (fun j : ℤ => weightSpace U κ j) (fun j => (weightSpace U κ j).subtypeₗᵢ) ∧
      matrixElement U e m n (κ u₁ * g * κ u₂) =
        (u₁ : ℂ) ^ jm * (u₂ : ℂ) ^ jn * matrixElement U e m n g := by
  sorry

end MatrixElements

/-- README 3.3. **Euler factorization of matrix elements.** With `e_m = e^{inθ}`, `m = n - e/2`,
`D_{m'm}(g(α, t, γ)) = e^{im'α} D_{m'm}(b_t) e^{imγ}`. -/
theorem principalSeries_matrixElement_euler (τ : ℂ) (e : Fin 2) (n' n : ℤ) (α t γ : ℝ) :
    let D := matrixElement (SU11.principalSeries τ e) (fourierBasis (T := 2 * π)) n' n
    D (SU11.euler α t γ) =
      Complex.exp (((n' : ℂ) - (e : ℂ) / 2) * α * Complex.I) * D (SU11.boost t) *
        Complex.exp (((n : ℂ) - (e : ℂ) / 2) * γ * Complex.I) := by
  sorry

/-! ## Layer 4: infinitesimal operators -/

/-- README 4.1. The derivative at `0` of the orbit of `v` along a curve `γ` through `1`. -/
def infinitesimal {G H : Type*} [Group G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (U : ContRepresentation ℂ G H) (γ : ℝ → G) (v : H) : H :=
  deriv (fun s => U (γ s) v) 0

/-- README 4.1. **Ladder operators.** On `e_m = e^{inθ}`, `m = n - e/2`, the infinitesimal
operators of the principal series exist, `J₊ = -A₁ + iA₂` raises `m` with coefficient `m - τ`,
`J₋ = -A₁ - iA₂` lowers it with coefficient `-(m + τ)`, and `J₃ = -iA₃` acts by `m`. -/
theorem principalSeries_ladder (τ : ℂ) (e : Fin 2) (n : ℤ) :
    let U := SU11.principalSeries τ e
    let m : ℂ := (n : ℂ) - (e : ℂ) / 2
    let v : ℤ → Lp ℂ 2 (haarAddCircle (T := 2 * π)) := fun j => fourierLp 2 j
    HasDerivAt (fun s => U (SU11.boost s) (v n)) (infinitesimal U SU11.boost (v n)) 0 ∧
    HasDerivAt (fun s => U (SU11.boostY s) (v n)) (infinitesimal U SU11.boostY (v n)) 0 ∧
    HasDerivAt (fun s => U (SU11.rotation s) (v n)) (infinitesimal U SU11.rotation (v n)) 0 ∧
    -infinitesimal U SU11.boost (v n) + Complex.I • infinitesimal U SU11.boostY (v n) =
      (m - τ) • v (n + 1) ∧
    -infinitesimal U SU11.boost (v n) - Complex.I • infinitesimal U SU11.boostY (v n) =
      (-(m + τ)) • v (n - 1) ∧
    -(Complex.I • infinitesimal U SU11.rotation (v n)) = m • v n := by
  sorry

/-- README 4.2. **Casimir eigenvalue.** `A₁² + A₂² - A₃²` acts on `e^{inθ}` by `τ(τ + 1)`. -/
theorem principalSeries_casimir (τ : ℂ) (e : Fin 2) (n : ℤ) :
    let U := SU11.principalSeries τ e
    let v : Lp ℂ 2 (haarAddCircle (T := 2 * π)) := fourierLp 2 n
    infinitesimal U SU11.boost (infinitesimal U SU11.boost v) +
        infinitesimal U SU11.boostY (infinitesimal U SU11.boostY v) -
        infinitesimal U SU11.rotation (infinitesimal U SU11.rotation v) = (τ * (τ + 1)) • v := by
  sorry

/-- README 4.3. **Template ODE.** The matrix element `P(t) = D_{m'm}(b_t) = ⟪e_{m'}, T(b_t) e_m⟫`,
`e_m = e^{inθ}`, `m = n - e/2`, is smooth and satisfies
`P'' + coth t P' - (m'² + m² - 2m'm cosh t) / sinh² t · P = τ(τ + 1) P` for `t > 0`. -/
theorem principalSeries_matrixElement_ode (τ : ℂ) (e : Fin 2) (n' n : ℤ) :
    let P : ℝ → ℂ := fun t =>
      matrixElement (SU11.principalSeries τ e) (fourierBasis (T := 2 * π)) n' n (SU11.boost t)
    let m' : ℂ := (n' : ℂ) - (e : ℂ) / 2
    let m : ℂ := (n : ℂ) - (e : ℂ) / 2
    ContDiff ℝ ∞ P ∧ ∀ t : ℝ, 0 < t →
      deriv (deriv P) t + ((Real.cosh t / Real.sinh t : ℝ) : ℂ) * deriv P t -
          (m' ^ 2 + m ^ 2 - 2 * m' * m * (Real.cosh t : ℂ)) / ((Real.sinh t : ℂ) ^ 2) * P t =
        τ * (τ + 1) * P t := by
  sorry

/-! ## Layer 5: Gel'fand pairs and spherical functions -/

section Gelfand

variable {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]

/-- README 5.1. `f` is bi-invariant under `K`: `f(k₁ x k₂) = f(x)`. -/
def IsBiInvariant (K : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ k₁ ∈ K, ∀ k₂ ∈ K, ∀ x, f (k₁ * x * k₂) = f x

/-- README 5.1. The convolution `(f * h)(x) = ∫ f(y) h(y⁻¹ x) dμ(y)`. -/
def conv (μ : Measure G) (f h : G → ℂ) (x : G) : ℂ := ∫ y, f y * h (y⁻¹ * x) ∂μ

/-- README 5.1. `(G, K)` is a Gel'fand pair for the Haar measure `μ`: convolution of continuous
compactly supported bi-`K`-invariant functions is commutative. -/
def IsGelfandPair (μ : Measure G) (K : Subgroup G) : Prop :=
  ∀ f h : G → ℂ, Continuous f → HasCompactSupport f → IsBiInvariant K f →
    Continuous h → HasCompactSupport h → IsBiInvariant K h → conv μ f h = conv μ h f

/-- README 5.1. **Gel'fand's criterion.** On a unimodular locally compact group with compact
`K`, a continuous involutive anti-automorphism `σ` with `σ x ∈ K x K` gives a Gel'fand pair. -/
theorem isGelfandPair_of_antiAut [IsTopologicalGroup G] [LocallyCompactSpace G] [BorelSpace G]
    (μ : Measure G) [μ.IsHaarMeasure] [μ.IsMulRightInvariant] (K : Subgroup G)
    (hK : IsCompact (K : Set G)) (σ : G → G) (hσc : Continuous σ)
    (hσmul : ∀ x y, σ (x * y) = σ y * σ x) (hσσ : ∀ x, σ (σ x) = x)
    (hσK : ∀ x, ∃ k₁ ∈ K, ∃ k₂ ∈ K, σ x = k₁ * x * k₂) :
    IsGelfandPair μ K := by
  sorry

/-- README 5.1. **Symmetric pairs.** A continuous involutive automorphism `θ` fixing `K`, with
`G = K P` for `P = {p | θ p = p⁻¹}`, gives a Gel'fand pair. -/
theorem isGelfandPair_of_involution [IsTopologicalGroup G] [LocallyCompactSpace G] [BorelSpace G]
    (μ : Measure G) [μ.IsHaarMeasure] [μ.IsMulRightInvariant] (K : Subgroup G)
    (hK : IsCompact (K : Set G)) (θ : G →* G) (hθc : Continuous θ) (hθθ : ∀ x, θ (θ x) = x)
    (hθK : ∀ k ∈ K, θ k = k) (hKP : ∀ x, ∃ k ∈ K, ∃ p, θ p = p⁻¹ ∧ x = k * p) :
    IsGelfandPair μ K := by
  sorry

/-- README 5.2. `φ` is a spherical function for `(G, K)` and the measure `ν` on `K`: continuous,
bi-`K`-invariant, `φ(1) = 1`, with `∫_K φ(x k y) dν(k) = φ(x) φ(y)`. Boundedness is not
required. -/
def IsSphericalFunction (K : Subgroup G) (ν : Measure K) (φ : G → ℂ) : Prop :=
  Continuous φ ∧ IsBiInvariant K φ ∧ φ 1 = 1 ∧ ∀ x y, ∫ k : K, φ (x * k * y) ∂ν = φ x * φ y

/-- README 5.2. **The functional equation suffices.** For compact `K` with an invariant
probability measure, a continuous `φ` is spherical exactly when it is not identically zero and
satisfies the functional equation. -/
theorem isSphericalFunction_iff [IsTopologicalGroup G] [BorelSpace G] {K : Subgroup G}
    (hK : IsCompact (K : Set G)) (ν : Measure K) [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant]
    [ν.IsMulRightInvariant] {φ : G → ℂ} (hφ : Continuous φ) :
    IsSphericalFunction K ν φ ↔
      (∃ x, φ x ≠ 0) ∧ ∀ x y, ∫ k : K, φ (x * k * y) ∂ν = φ x * φ y := by
  sorry

/-- README 5.2. The spherical transform `f ↦ ∫ f(x) φ(x⁻¹) dμ(x)`. -/
def sphericalTransform (μ : Measure G) (φ : G → ℂ) (f : G → ℂ) : ℂ := ∫ x, f x * φ x⁻¹ ∂μ

/-- README 5.2. **Multiplicativity of the spherical transform** on continuous compactly supported
bi-invariant functions. -/
theorem sphericalTransform_conv [IsTopologicalGroup G] [LocallyCompactSpace G] [BorelSpace G]
    (μ : Measure G) [μ.IsHaarMeasure] {K : Subgroup G} (hK : IsCompact (K : Set G))
    (ν : Measure K) [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] [ν.IsMulRightInvariant]
    {φ : G → ℂ} (hφ : IsSphericalFunction K ν φ) (f h : G → ℂ) (hfc : Continuous f)
    (hfs : HasCompactSupport f) (hfK : IsBiInvariant K f) (hhc : Continuous h)
    (hhs : HasCompactSupport h) (hhK : IsBiInvariant K h) :
    sphericalTransform μ φ (conv μ f h) = sphericalTransform μ φ f * sphericalTransform μ φ h := by
  sorry

/-- README 5.2. **Bounded spherical functions are the characters of `L¹(K\\G/K)`.** A bounded
spherical function gives a nonzero multiplicative functional on the integrable bi-invariant
functions; conversely every nonzero, linear, `L¹`-bounded multiplicative functional on them is
the spherical transform of a unique bounded spherical function. -/
theorem bounded_sphericalFunction_iff_character [IsTopologicalGroup G] [LocallyCompactSpace G]
    [BorelSpace G] [SecondCountableTopology G] (μ : Measure G) [μ.IsHaarMeasure] {K : Subgroup G}
    (hK : IsCompact (K : Set G)) (ν : Measure K) [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant]
    [ν.IsMulRightInvariant] :
    (∀ φ : G → ℂ, IsSphericalFunction K ν φ → (∃ C, ∀ x, ‖φ x‖ ≤ C) →
      (∀ f h, Integrable f μ → IsBiInvariant K f → Integrable h μ → IsBiInvariant K h →
        sphericalTransform μ φ (conv μ f h) =
          sphericalTransform μ φ f * sphericalTransform μ φ h) ∧
      ∃ f, Integrable f μ ∧ IsBiInvariant K f ∧ sphericalTransform μ φ f ≠ 0) ∧
    ∀ χ : (G → ℂ) → ℂ,
      (∀ f h, Integrable f μ → Integrable h μ → χ (f + h) = χ f + χ h) →
      (∀ (c : ℂ) f, Integrable f μ → χ (c • f) = c * χ f) →
      (∀ f h, f =ᵐ[μ] h → χ f = χ h) →
      (∃ C, ∀ f, Integrable f μ → IsBiInvariant K f → ‖χ f‖ ≤ C * ∫ x, ‖f x‖ ∂μ) →
      (∀ f h, Integrable f μ → IsBiInvariant K f → Integrable h μ → IsBiInvariant K h →
        χ (conv μ f h) = χ f * χ h) →
      (∃ f, Integrable f μ ∧ IsBiInvariant K f ∧ χ f ≠ 0) →
      ∃! φ : G → ℂ, IsSphericalFunction K ν φ ∧ (∃ C, ∀ x, ‖φ x‖ ≤ C) ∧
        ∀ f, Integrable f μ → IsBiInvariant K f → χ f = sphericalTransform μ φ f := by
  sorry

/-- README 5.3. The subspace of `K`-fixed vectors. -/
def fixedSubmodule {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (U : ContRepresentation ℂ G H) (K : Subgroup G) : Submodule ℂ H where
  carrier := {v | ∀ k ∈ K, U k v = v}
  add_mem' := by
    intro v w hv hw k hk
    simp only [map_add, hv k hk, hw k hk]
  zero_mem' := by
    intro k _
    simp
  smul_mem' := by
    intro c v hv k hk
    simp only [map_smul, hv k hk]

/-- README 5.3. **Spherical functions from representations.** If the `K`-fixed vectors of a
strongly continuous unitary representation are the line through a unit vector `v`, then
`g ↦ ⟪v, U(g) v⟫` is a positive-definite spherical function. -/
theorem isSphericalFunction_inner [IsTopologicalGroup G] [BorelSpace G] {H : Type*}
    [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (U : ContRepresentation ℂ G H) (hU : U.IsUnitary)
    (hc : ∀ w, Continuous fun g => U g w) {K : Subgroup G} (hK : IsCompact (K : Set G))
    (ν : Measure K) [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] [ν.IsMulRightInvariant]
    (v : H) (hv : ‖v‖ = 1) (hfix : fixedSubmodule U K = Submodule.span ℂ {v}) :
    IsSphericalFunction K ν (fun g => ⟪v, U g v⟫_ℂ) ∧
      (Matrix.of fun g h : G => ⟪v, U (g⁻¹ * h) v⟫_ℂ).PosSemidef := by
  sorry

/-- README 5.3. **Multiplicity one.** In an irreducible strongly continuous unitary
representation of a second-countable group with a Gel'fand pair `(G, K)`, the `K`-fixed vectors
form a space of dimension at most one. -/
theorem rank_fixedSubmodule_le_one [IsTopologicalGroup G] [LocallyCompactSpace G] [BorelSpace G]
    [SecondCountableTopology G] (μ : Measure G) [μ.IsHaarMeasure] (K : Subgroup G)
    (hK : IsCompact (K : Set G)) (hG : IsGelfandPair μ K) {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (U : ContRepresentation ℂ G H) (hU : U.IsUnitary)
    (hc : ∀ w, Continuous fun g => U g w)
    (hirr : ∀ W : Submodule ℂ H, IsClosed (W : Set H) → (∀ g, ∀ w ∈ W, U g w ∈ W) →
      W = ⊥ ∨ W = ⊤) :
    Module.rank ℂ (fixedSubmodule U K) ≤ 1 := by
  sorry

end Gelfand

/-- README 5.3. **Positive-definite spherical functions come from representations.** A
positive-definite spherical function is `g ↦ ⟪v, U(g) v⟫` for a strongly continuous unitary
representation `U` and a `K`-fixed unit vector `v`. -/
theorem exists_isUnitary_of_sphericalFunction {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [MeasurableSpace G] [BorelSpace G] {K : Subgroup G}
    (hK : IsCompact (K : Set G)) (ν : Measure K) [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant]
    [ν.IsMulRightInvariant] {φ : G → ℂ} (hφ : IsSphericalFunction K ν φ)
    (hpos : (Matrix.of fun g h : G => φ (g⁻¹ * h)).PosSemidef) :
    ∃ (V : Type u) (_ : NormedAddCommGroup V) (_ : InnerProductSpace ℂ V) (_ : CompleteSpace V)
      (U : ContRepresentation ℂ G V) (v : V), U.IsUnitary ∧ (∀ w, Continuous fun g => U g w) ∧
        ‖v‖ = 1 ∧ v ∈ fixedSubmodule U K ∧ ∀ g, φ g = ⟪v, U g v⟫_ℂ := by
  sorry

/-- README 5.4. **`(SU(1,1), K)` is a Gel'fand pair**, by Gel'fand's criterion with the transpose
`g(α, t, γ)ᵀ = g(γ, t, α)`. -/
theorem isGelfandPair_su11 : IsGelfandPair SU11.eulerHaar SU11.diagonalSubgroup := by
  sorry

/-- README 5.4. **Radial equation on `SU(1,1)`.** For a spherical function of `(SU(1,1), K)`,
`F(t) = φ(b_t)` is smooth and satisfies `F'' + coth t F' = c F` for `t > 0` and some `c`. -/
theorem sphericalFunction_su11_ode (ν : Measure SU11.diagonalSubgroup) [IsProbabilityMeasure ν]
    [ν.IsMulLeftInvariant] [ν.IsMulRightInvariant] {φ : SU11 → ℂ}
    (hφ : IsSphericalFunction SU11.diagonalSubgroup ν φ) :
    ∃ c : ℂ, ContDiff ℝ ∞ (fun t => φ (SU11.boost t)) ∧ ∀ t : ℝ, 0 < t →
      deriv (deriv fun s => φ (SU11.boost s)) t +
          ((Real.cosh t / Real.sinh t : ℝ) : ℂ) * deriv (fun s => φ (SU11.boost s)) t =
        c * φ (SU11.boost t) := by
  sorry


/-! ## The `SU11` names as the README writes them -/

#check @SU11.ofSL2R_spec
#check @SU11.principalAction_compactPicture
#check @SU11.discreteAction_rotation
#check @SU11.circleAct
#check @SU11.diskAct
#check @SU11.circleMulAction
#check @SU11.coe_boostY
#check @SU11.rotation_mul_boostY_mul_rotation
#check @SU11.circleDenominator
#check @SU11.entryA_euler
#check @SU11.entryB_euler
#check @SU11.exists_euler_eq
#check @SU11.bijOn_euler
#check @SU11.isHaarMeasure_eulerHaar
#check @SU11.isMulRightInvariant_eulerHaar
#check @SU11.lieBasis
#check @SU11.IsPrincipalSeriesRealization
#check @SU11.circleAct_mul
#check @SU11.circleAct_one
#check @SU11.map_circleAct_haar
#check @SU11.principalAction_one
#check @SU11.principalAction_mul
#check @SU11.isMultiplierCocycle_principalMultiplier
#check @SU11.exists_principalSeries
#check @SU11.principalSeries_ae_eq
#check @SU11.continuous_principalSeries_apply
#check @SU11.isUnitary_principalSeries_iff
#check @SU11.inner_principalSeries
#check @SU11.principalSeries_rotation
#check @SU11.coe_rotation_two_pi
#check @SU11.ofSL2R
#check @SU11.compactTransport
#check @SU11.discreteAction_isometry
#check @SU11.antiDiscreteAction_spec

end TauCetiRoadmap.SpecialFunctionsGroupModels

/-! ## Supplier declarations named in the README -/

#check @Matrix.SpecialLinearGroup
#check @Matrix.specialOrthogonalGroup
#check @MeasureTheory.Measure.toSphere
#check @MeasureTheory.Measure.IsHaarMeasure
#check @MeasureTheory.Measure.modularCharacter
#check @MeasureTheory.Measure.rnDeriv
#check @MeasureTheory.Measure.Regular
#check @HilbertBasis.hasSum_inner_mul_inner
#check @ContRepresentation.IsUnitary
#check @ContRepresentation.matrixCoeff
#check @ContRepresentation.toStronglyContinuousGroup
#check @MeasureTheory.Measure.leftRegular
#check @MeasureTheory.Measure.isUnitary_leftRegular
#check @MeasureTheory.Measure.continuous_leftRegular_apply
#check @TauCeti.HeisenbergGroup.equivProd
#check @Matrix.toEuclideanLin
#check @Real.fourier_real_eq_integral_exp_smul
#check @Complex.besselJ
