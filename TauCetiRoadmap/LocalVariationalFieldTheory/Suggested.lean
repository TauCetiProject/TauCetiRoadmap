import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Calculus.ContDiff.Operations
import Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.ThreeOne

/-!
These are suggested forms, not an exhaustive checklist. The README is the
specification. The first namespace gives a concrete one-dimensional scalar
finite-stage direct-limit prototype; its relation is equality after pullback
to a common jet stage. The second is a coordinate first-order multiplet
prototype. The definitive API constructs jets of general smooth fiber bundles,
compares the vector-bundle specialization with PDO P1.0's linear jets, and adds
graded-valued fields and horizontal/contact differential forms.
-/

noncomputable section
open scoped ContDiff

namespace TauCetiRoadmap.LocalVariationalFieldTheory

namespace ScalarStage

/-- A base coordinate and the scalar one-dimensional order-r jet data. -/
abbrev Jet (r : ℕ) := ℝ × EuclideanSpace ℝ (Fin (r + 1))

structure LocalFunction (r : ℕ) where
  toFun : Jet r → ℝ
  smooth : ContDiff ℝ ∞ toFun

def truncate {r s : ℕ} (h : r ≤ s) (j : Jet s) : Jet r :=
  (j.1, WithLp.toLp 2 (fun i => j.2 (Fin.castLE (Nat.succ_le_succ h) i)))

/-- Pullback along the jet truncation `J^s → J^r`. -/
def pullback {r s : ℕ} (h : r ≤ s) (f : LocalFunction r) : LocalFunction s where
  toFun := f.toFun ∘ truncate h
  smooth := by
    -- Smoothness of composition with the continuous linear truncation map.
    sorry

abbrev Representative := Σ r : ℕ, LocalFunction r

/-- Two finite-stage functions agree if their pullbacks agree at a common stage. -/
def SameLocalFunction (f g : Representative) : Prop :=
  ∃ t : ℕ, ∃ hf : f.1 ≤ t, ∃ hg : g.1 ≤ t,
    pullback hf f.2 = pullback hg g.2

/-- The filtered colimit of finite-order local scalar functions. -/
def localFunctionSetoid : Setoid Representative where
  r := SameLocalFunction
  iseqv := {
    refl := by
      intro f
      exact ⟨f.1, le_rfl, le_rfl, by rfl⟩
    symm := by
      intro f g h
      rcases h with ⟨t, hf, hg, hfg⟩
      exact ⟨t, hg, hf, hfg.symm⟩
    trans := by
      intro f g k hfg hgk
      -- Pull both equalities to max of their witness stages and compose.
      sorry
  }

def LocalObservable := Quotient localFunctionSetoid

/-- Total differentiation maps order r to order r+1, never back to a fixed stage. -/
def totalDerivative {r : ℕ} (f : LocalFunction r) : LocalFunction (r + 1) where
  toFun := fun j =>
    fderiv ℝ f.toFun (truncate (Nat.le_succ r) j)
      (1, WithLp.toLp 2 (fun i => j.2 (Fin.succ i)))
  smooth := by
    -- The derivative of a smooth function, evaluated on the linear jet shift, is smooth.
    sorry

def totalDerivativeRepresentative (f : Representative) : Representative :=
  ⟨f.1 + 1, totalDerivative f.2⟩

/-- Partial derivative in the jet coordinate `u_k` on the finite stage. -/
def jetPartial {r : ℕ} (f : LocalFunction r) (k : Fin (r + 1)) : LocalFunction r where
  toFun := fun z => fderiv ℝ f.toFun z
    (0, WithLp.toLp 2 (fun i => if i = k then 1 else 0))
  smooth := by
    -- Derivatives of a smooth map are smooth; evaluation on this fixed direction
    -- preserves smoothness.
    sorry

/-- Iterated total derivative: the kth derivative of an order-r expression has
order at most r+k. -/
def totalIter : (k : ℕ) → {r : ℕ} → LocalFunction r → LocalFunction (r + k)
  | 0, r, f => pullback (by omega) f
  | k + 1, r, f => totalDerivative (totalIter k f)

/-- Pullback of an iterated derivative to the common order-2r stage. -/
def eulerTerm {r : ℕ} (L : LocalFunction r) (k : Fin (r + 1)) : LocalFunction (2 * r) :=
  pullback (by have hk := k.isLt; omega) (totalIter k.val (jetPartial L k))

/-- Compatibility with every truncation pullback, required to descend to the colimit. -/
theorem totalDerivativeRepresentative_respects (f g : Representative)
    (h : SameLocalFunction f g) :
    SameLocalFunction (totalDerivativeRepresentative f)
      (totalDerivativeRepresentative g) := by
  -- Pull both representatives and their total derivatives to one common stage.
  sorry

/-- The total derivative on the colimit, defined only after stage compatibility. -/
def totalDerivativeOnColimit : LocalObservable → LocalObservable :=
  Quotient.lift
    (fun f => Quotient.mk localFunctionSetoid (totalDerivativeRepresentative f))
    (by
      intro f g h
      exact Quotient.sound (totalDerivativeRepresentative_respects f g h))

/-- Multi-index Euler operator after the repeated finite-stage integrations by parts. -/
def eulerAllOrders {r : ℕ} (L : LocalFunction r) : LocalFunction (2 * r) where
  toFun := fun z => ∑ k : Fin (r + 1),
    (-1 : ℝ) ^ k.val * (eulerTerm L k).toFun z
  smooth := by
    -- Smoothness follows by iterating the stagewise total derivative and pullback.
    sorry

end ScalarStage

abbrev Base (n : ℕ) := EuclideanSpace ℝ (Fin n)
abbrev Field (N : ℕ) := Fin N → ℝ
abbrev FirstJet (n N : ℕ) := Field N × (Fin n → Field N)
abbrev Hessian (n N : ℕ) := Fin n → Fin n → Field N
abbrev LocalDensity (n N : ℕ) := Base n → FirstJet n N → ℝ

def baseDirection {n : ℕ} (μ : Fin n) : Base n := EuclideanSpace.single μ 1

def fieldDirection {n N : ℕ} (a : Fin N) : FirstJet n N :=
  ((fun b => if b = a then 1 else 0), fun _ _ => 0)

def derivativeDirection {n N : ℕ} (μ : Fin n) (a : Fin N) : FirstJet n N :=
  (0, fun ν b => if ν = μ ∧ b = a then 1 else 0)

structure SymmetricHessian (n N : ℕ) where
  value : Hessian n N
  symmetric : ∀ μ ν a, value μ ν a = value ν μ a

def fieldPartial {n N : ℕ} (L : LocalDensity n N)
    (x : Base n) (j : FirstJet n N) (a : Fin N) : ℝ :=
  fderiv ℝ (L x) j (fieldDirection a)

def gradientPartial {n N : ℕ} (L : LocalDensity n N)
    (x : Base n) (j : FirstJet n N) (μ : Fin n) (a : Fin N) : ℝ :=
  fderiv ℝ (L x) j (derivativeDirection μ a)

def totalDerivative {n N : ℕ} (P : Base n → FirstJet n N → ℝ)
    (x : Base n) (j : FirstJet n N) (h : SymmetricHessian n N)
    (μ : Fin n) : ℝ :=
  fderiv ℝ (fun z : Base n × FirstJet n N => P z.1 z.2) (x, j)
    (baseDirection μ, (j.2 μ, fun ν a => h.value μ ν a))

/-- Joint smoothness in the base and field-jet coordinates, required by total differentiation. -/
def SmoothLocalDensity {n N : ℕ} (L : LocalDensity n N) : Prop :=
  ContDiff ℝ ∞ (fun z : Base n × FirstJet n N => L z.1 z.2)

def eulerLagrange {n N : ℕ} (L : LocalDensity n N)
    (_smooth : SmoothLocalDensity L) (x : Base n) (j : FirstJet n N) (h : SymmetricHessian n N) (a : Fin N) : ℝ :=
  fieldPartial L x j a - ∑ μ : Fin n,
    totalDerivative (fun y k => gradientPartial L y k μ a) x j h μ

/-- Tangent directions to the coordinate first-jet space `M × J¹`. -/
abbrev FirstJetTangent (n N : ℕ) := Base n × FirstJet n N

/-- Coordinate horizontal one-form `dx^μ` on the first-jet carrier. -/
def horizontalOneForm {n N : ℕ} (v : FirstJetTangent n N) (μ : Fin n) : ℝ :=
  v.1 μ

/-- The basic contact generator `θᵃ = duᵃ − uᵃ_μ dx^μ`, evaluated on a
first-jet tangent vector. -/
def contactZero {n N : ℕ} (j : FirstJet n N) (v : FirstJetTangent n N)
    (a : Fin N) : ℝ :=
  v.2.1 a - ∑ μ : Fin n, j.2 μ a * v.1 μ

/-- The first prolonged contact generator `θᵃ_μ = duᵃ_μ − uᵃ_{μν}dx^ν`,
realized on symmetric second-jet data. -/
def contactOne {n N : ℕ} (h : SymmetricHessian n N) (v : FirstJetTangent n N)
    (μ : Fin n) (a : Fin N) : ℝ :=
  v.2.2 μ a - ∑ ν : Fin n, h.value μ ν a * v.1 ν

/-- Contact-degree-one coordinates carry contact degree one and horizontal degree zero. -/
abbrev ContactDegreeOne (n N : ℕ) :=
  (Fin N → ℝ) × (Fin n → Fin N → ℝ)

def oscillatorDensity (m : ℝ) : LocalDensity 1 1 := fun _ j =>
  (j.2 0 0) ^ 2 / 2 - m ^ 2 * (j.1 0) ^ 2 / 2

/-- The real Klein–Gordon density in a fixed flat Lorentzian chart.
The signature is `η = diag(+1,−1)` and
`L = ((∂₀φ)²−(∂₁φ)²−m²φ²)/2`. Under the convention
`E=∂L/∂φ−D_μ(∂L/∂(∂_μφ))`, its Euler expression is
`−∂₀²φ+∂₁²φ−m²φ`, whose zero set is `(□+m²)φ=0`. -/
def kleinGordonDensity (m : ℝ) : LocalDensity 2 1 := fun _ j =>
  ((j.2 0 0) ^ 2 - (j.2 1 0) ^ 2 - m ^ 2 * (j.1 0) ^ 2) / 2

/-- The polynomial Klein–Gordon density satisfies the joint smoothness hypothesis. -/
theorem smoothLocalDensity_kleinGordon (m : ℝ) :
    SmoothLocalDensity (kleinGordonDensity m) := by
  unfold SmoothLocalDensity kleinGordonDensity
  fun_prop

/-- The oscillator density satisfies the same base-and-jet smoothness hypothesis. -/
theorem smoothLocalDensity_oscillator (m : ℝ) :
    SmoothLocalDensity (oscillatorDensity m) := by
  unfold SmoothLocalDensity oscillatorDensity
  fun_prop

/-- Direct coordinate check of the Klein–Gordon Euler expression on symmetric
second-jet data. -/
theorem kleinGordon_euler (m : ℝ) (hL : SmoothLocalDensity (kleinGordonDensity m))
    (x : Base 2) (j : FirstJet 2 1)
    (h : SymmetricHessian 2 1) :
    eulerLagrange (kleinGordonDensity m) hL x j h 0 =
      -h.value 0 0 0 + h.value 1 1 0 - m ^ 2 * j.1 0 := by
  -- Expand the native Fréchet derivatives and the total derivative definition.
  sorry

/-- Direct coordinate check of the 1D mechanics comparison with I3. -/
theorem oscillator_euler (m : ℝ) (hL : SmoothLocalDensity (oscillatorDensity m))
    (x : Base 1) (j : FirstJet 1 1)
    (h : SymmetricHessian 1 1) :
    eulerLagrange (oscillatorDensity m) hL x j h 0 =
      -(m ^ 2 * j.1 0 + h.value 0 0 0) := by
  -- Expand the native Fréchet derivatives and the total derivative definition.
  sorry

namespace LorentzDiracCarrier

/-- Native real `Spin(3,1)` carrier, re-used through Tau Ceti's actual equivalence. -/
abbrev Spin31 := spinGroup (TauCeti.realCliffordForm 3 1)

/-- Native special-linear model of the Lorentz spin group. -/
def spinToSL₂ : Spin31 →* Matrix.SpecialLinearGroup (Fin 2) ℂ :=
  (TauCeti.realSpinThreeOneEquivSpecialLinear :
    Spin31 ≃* Matrix.SpecialLinearGroup (Fin 2) ℂ).toMonoidHom

/-- Time-first coordinates in the `(+---)` convention sent to the native time-last
`(3,1)` Clifford coordinates. The spatial map is `(x₁,x₂,x₃) ↦ (x₃,−x₂,x₁)`. -/
def timeFirstToNative (x : Fin 4 → ℝ) : Fin 4 → ℝ :=
  ![x 3, -x 2, x 1, x 0]

theorem timeFirstToNative_form (x : Fin 4 → ℝ) :
    TauCeti.realCliffordForm 3 1 (timeFirstToNative x) =
      -(x 0 ^ 2 - x 1 ^ 2 - x 2 ^ 2 - x 3 ^ 2) := by
  rw [TauCeti.realCliffordForm_three_one_apply]
  simp [timeFirstToNative]
  ring

/-- The two Weyl summands underlying the four-complex-dimensional Dirac carrier. -/
abbrev WeylSpinor := Fin 2 → ℂ
abbrev DiracSpinor := WeylSpinor × WeylSpinor

/-- The left Weyl action and its conjugate right Weyl action, through the native Spin–SL₂ map.
Use ε=[[0,1],[-1,0]] to compare this right action with (A†)⁻¹. The coordinate
change (l,r)↦(l,εr) transports the usual Dirac pairing to [[0,ε],[-ε,0]]
on these conjugate coordinates. The gamma intertwiner and chirality convention
use that same change and remain explicit targets. -/
def diracSpinAction (s : Spin31) (ψ : DiracSpinor) : DiracSpinor :=
  let A : Matrix (Fin 2) (Fin 2) ℂ := (spinToSL₂ s : Matrix (Fin 2) (Fin 2) ℂ)
  (Matrix.mulVec A ψ.1, Matrix.mulVec (fun i j => star (A i j)) ψ.2)

end LorentzDiracCarrier

end TauCetiRoadmap.LocalVariationalFieldTheory
