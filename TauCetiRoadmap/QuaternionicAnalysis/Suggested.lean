import Mathlib

/-!
# Quaternionic analysis: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them: the two one-sided quotient-derivative predicates, the left
and right Fueter predicates, the Cauchy–Fueter kernel, the coordinate identification of `ℍ` with
`Fin 4 → ℝ`, and the ordered boundary sum of an axis-aligned box in the form of Mathlib's
divergence theorem.

Headline theorems not statable at the pins:

* the Cauchy theorem and the Cauchy–Fueter formula on an affine parallelepiped `A([0,1]⁴)` with
  `det A > 0` (README §5.5 and §5.6): their boundary integral is the raw affine face functional
  of README §5.2, a Layer 5 target with no carrier in the pinned libraries. Only the axis-aligned
  box case is stated here, through `boxBoundarySum`;
* the facetwise agreement of the face integrals with the integral of a top form (README §5.3):
  the DifferentialGeometry roadmap's `integralTopForm` is not in the pinned Tau Ceti.

Multiplication order is part of every statement: `h ↦ h * b` is the derivative of a
left-quotient-differentiable function, `h ↦ a * h` that of a right-quotient-differentiable one,
and the kernel stands to the left of `Dq` in the left Cauchy–Fueter formula and to its right in the
right one.
-/

open scoped Quaternion
open MeasureTheory Laplacian

namespace TauCetiRoadmap.QuaternionicAnalysis

/-! ## Layer 2: one-sided quotient calculus -/

/-- The quaternion unit `i`, the constructor `⟨0, 1, 0, 0⟩`. -/
def qi : ℍ := ⟨0, 1, 0, 0⟩

/-- The quaternion unit `j`, the constructor `⟨0, 0, 1, 0⟩`. -/
def qj : ℍ := ⟨0, 0, 1, 0⟩

/-- The quaternion unit `k`, the constructor `⟨0, 0, 0, 1⟩`. -/
def qk : ℍ := ⟨0, 0, 0, 1⟩

/-- `f` has left quotient derivative `b` at `q`: the limit of `h⁻¹ * (f (q + h) - f q)` as
`h → 0` is `b`, equivalently the real Fréchet derivative of `f` at `q` is right multiplication
`h ↦ h * b`. -/
def HasLeftQuotientFDerivAt (f : ℍ → ℍ) (q b : ℍ) : Prop :=
  HasFDerivAt f ((ContinuousLinearMap.mul ℝ ℍ).flip b) q

/-- `f` has right quotient derivative `a` at `q`: the limit of `(f (q + h) - f q) * h⁻¹` as
`h → 0` is `a`, equivalently the real Fréchet derivative of `f` at `q` is left multiplication
`h ↦ a * h`. -/
def HasRightQuotientFDerivAt (f : ℍ → ℍ) (q a : ℍ) : Prop :=
  HasFDerivAt f (ContinuousLinearMap.mul ℝ ℍ a) q

/-- Left product criterion. If `f` and `g` have left quotient derivatives `bf` and `bg` at `q`,
their product has the left quotient derivative `bf * g q + f q * bg` at `q` exactly when `bg = 0`
or `f q` is real. The slope of a left-quotient-differentiable product is forced to be this one
(evaluate the real derivative at `h = 1`), so the equivalence also characterises when the product
has any left quotient derivative. -/
theorem left_product_quotient_iff (f g : ℍ → ℍ) (q bf bg : ℍ)
    (hf : HasLeftQuotientFDerivAt f q bf) (hg : HasLeftQuotientFDerivAt g q bg) :
    HasLeftQuotientFDerivAt (fun x => f x * g x) q (bf * g q + f q * bg) ↔
      (bg = 0 ∨ ∃ r : ℝ, f q = r) := by
  sorry

/-- Right product criterion. If `f` and `g` have right quotient derivatives `af` and `ag` at `q`,
their product has the right quotient derivative `af * g q + f q * ag` at `q` exactly when `af = 0`
or `g q` is real. -/
theorem right_product_quotient_iff (f g : ℍ → ℍ) (q af ag : ℍ)
    (hf : HasRightQuotientFDerivAt f q af) (hg : HasRightQuotientFDerivAt g q ag) :
    HasRightQuotientFDerivAt (fun x => f x * g x) q (af * g q + f q * ag) ↔
      (af = 0 ∨ ∃ r : ℝ, g q = r) := by
  sorry

/-- Left inverse criterion. If `f` has left quotient derivative `bf` at `q` and `f q ≠ 0`, the
pointwise inverse has the left quotient derivative `-((f q)⁻¹ * bf * (f q)⁻¹)` at `q` exactly
when `bf = 0` or `f q` is real. -/
theorem left_inverse_quotient_iff (f : ℍ → ℍ) (q bf : ℍ)
    (hf : HasLeftQuotientFDerivAt f q bf) (hq : f q ≠ 0) :
    HasLeftQuotientFDerivAt (fun x => (f x)⁻¹) q (-((f q)⁻¹ * bf * (f q)⁻¹)) ↔
      (bf = 0 ∨ ∃ r : ℝ, f q = r) := by
  sorry

/-- Right inverse criterion. If `f` has right quotient derivative `af` at `q` and `f q ≠ 0`, the
pointwise inverse has the right quotient derivative `-((f q)⁻¹ * af * (f q)⁻¹)` at `q` exactly
when `af = 0` or `f q` is real. -/
theorem right_inverse_quotient_iff (f : ℍ → ℍ) (q af : ℍ)
    (hf : HasRightQuotientFDerivAt f q af) (hq : f q ≠ 0) :
    HasRightQuotientFDerivAt (fun x => (f x)⁻¹) q (-((f q)⁻¹ * af * (f q)⁻¹)) ↔
      (af = 0 ∨ ∃ r : ℝ, f q = r) := by
  sorry

/-! ## Layer 3: rigidity without assumed higher regularity -/

/-- Left rigidity (Sudbery 1979, Theorem 1). On a connected open set, a function has a left
quotient derivative at every point exactly when it is of the form `q ↦ a + q * b`. No `C¹` or
`C²` hypothesis is assumed. -/
theorem leftQuotient_rigidity (Ω : Set ℍ) (hopen : IsOpen Ω) (hconn : IsConnected Ω)
    (f : ℍ → ℍ) :
    (∀ q ∈ Ω, ∃ b, HasLeftQuotientFDerivAt f q b) ↔ ∃ a b, ∀ q ∈ Ω, f q = a + q * b := by
  sorry

/-- Right rigidity. On a connected open set, a function has a right quotient derivative at every
point exactly when it is of the form `q ↦ a + b * q`. -/
theorem rightQuotient_rigidity (Ω : Set ℍ) (hopen : IsOpen Ω) (hconn : IsConnected Ω)
    (f : ℍ → ℍ) :
    (∀ q ∈ Ω, ∃ a, HasRightQuotientFDerivAt f q a) ↔ ∃ a b, ∀ q ∈ Ω, f q = a + b * q := by
  sorry

/-- Two-sided rigidity. On a connected open set, a function has both a left and a right quotient
derivative at every point exactly when it is `q ↦ a + r * q` with a real slope `r`. -/
theorem twoSidedQuotient_rigidity (Ω : Set ℍ) (hopen : IsOpen Ω) (hconn : IsConnected Ω)
    (f : ℍ → ℍ) :
    (∀ q ∈ Ω, (∃ b, HasLeftQuotientFDerivAt f q b) ∧ ∃ a, HasRightQuotientFDerivAt f q a) ↔
      ∃ (a : ℍ) (r : ℝ), ∀ q ∈ Ω, f q = a + (r : ℍ) * q := by
  sorry

/-! ## Layer 4: left and right Fueter operators and pointwise regularity -/

/-- The left Fueter equation for a real Fréchet derivative `D`: `D 1 + i * D i + j * D j + k * D k = 0`,
the value of `∂ₜf + i ∂ₓf + j ∂ᵧf + k ∂_zf` when `D` is the derivative of `f`. -/
def FueterLeft (D : ℍ →L[ℝ] ℍ) : Prop :=
  D 1 + qi * D qi + qj * D qj + qk * D qk = 0

/-- The right Fueter equation for a real Fréchet derivative `D`: `D 1 + D i * i + D j * j + D k * k = 0`,
the value of `∂ₜf + (∂ₓf) i + (∂ᵧf) j + (∂_zf) k` when `D` is the derivative of `f`. -/
def FueterRight (D : ℍ →L[ℝ] ℍ) : Prop :=
  D 1 + D qi * qi + D qj * qj + D qk * qk = 0

/-- `f` is left Fueter regular at `q`: it has a real Fréchet derivative at `q` satisfying the left
Fueter equation. Continuity of the derivative is not assumed. -/
def LeftFueterAt (f : ℍ → ℍ) (q : ℍ) : Prop :=
  ∃ D : ℍ →L[ℝ] ℍ, HasFDerivAt f D q ∧ FueterLeft D

/-- `f` is right Fueter regular at `q`: it has a real Fréchet derivative at `q` satisfying the
right Fueter equation. -/
def RightFueterAt (f : ℍ → ℍ) (q : ℍ) : Prop :=
  ∃ D : ℍ →L[ℝ] ℍ, HasFDerivAt f D q ∧ FueterRight D

/-- `f` is left Fueter regular at every point of `Ω`. -/
def LeftFueterOn (f : ℍ → ℍ) (Ω : Set ℍ) : Prop :=
  ∀ q ∈ Ω, LeftFueterAt f q

/-- `f` is right Fueter regular at every point of `Ω`. -/
def RightFueterOn (f : ℍ → ℍ) (Ω : Set ℍ) : Prop :=
  ∀ q ∈ Ω, RightFueterAt f q

/-! ## Layer 5: forms, Cauchy theorem and Cauchy–Fueter formula -/

/-- The Cauchy–Fueter kernel `G(q - q₀) = (q - q₀)⁻¹ / ‖q - q₀‖²`, equal to
`conj (q - q₀) / ‖q - q₀‖⁴` off `q₀` and to the junk value `0` at `q₀`. -/
noncomputable def cauchyFueterKernel (q q₀ : ℍ) : ℍ :=
  (q - q₀)⁻¹ / ‖q - q₀‖ ^ 2

/-- The coordinates `(re, imI, imJ, imK)` of a quaternion, Mathlib's real-linear equivalence
`ℍ ≃ₗ[ℝ] (Fin 4 → ℝ)`; its target is the carrier of Mathlib's divergence theorem. -/
noncomputable def toTuple : ℍ ≃ₗ[ℝ] (Fin 4 → ℝ) :=
  QuaternionAlgebra.linearEquivTuple (-1) 0 (-1)

/-- The ordered boundary sum of the axis-aligned box `[a, b] ⊆ Fin 4 → ℝ` for a family of face
integrands `F i`: the sum over `i` of the integral of `F i` over the front face `x i = b i` minus
its integral over the back face `x i = a i`, each face being the box
`Icc (a ∘ Fin.succAbove i) (b ∘ Fin.succAbove i)` in `Fin 3 → ℝ`. This is the right-hand side of
`MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable`. -/
noncomputable def boxBoundarySum (a b : Fin 4 → ℝ) (F : Fin 4 → (Fin 4 → ℝ) → ℍ) : ℍ :=
  ∑ i : Fin 4,
    ((∫ x in Set.Icc (a ∘ Fin.succAbove i) (b ∘ Fin.succAbove i),
        F i (Fin.insertNth i (b i) x)) -
      ∫ x in Set.Icc (a ∘ Fin.succAbove i) (b ∘ Fin.succAbove i),
        F i (Fin.insertNth i (a i) x))

/-- Left Cauchy theorem on an axis-aligned box: for `f` continuous on the closed box
`C = toTuple⁻¹ [a, b]` and left Fueter regular at every point of its interior, the ordered
boundary integral `∫_{∂C} Dq f` vanishes. In coordinates the face integrand on the `i`-th pair of
faces is `eᵢ * f`, where `eᵢ` is the `i`-th quaternion unit `1, i, j, k`. -/
theorem left_cauchy_box (a b : Fin 4 → ℝ) (hab : a ≤ b) (f : ℍ → ℍ)
    (hc : ContinuousOn f (toTuple.symm '' Set.Icc a b))
    (hd : ∀ x ∈ Set.pi Set.univ (fun i => Set.Ioo (a i) (b i)), LeftFueterAt f (toTuple.symm x)) :
    boxBoundarySum a b (fun i x => toTuple.symm (Pi.single i 1) * f (toTuple.symm x)) = 0 := by
  sorry

/-- Right Cauchy theorem on an axis-aligned box: for `f` continuous on the closed box and right
Fueter regular at every point of its interior, `∫_{∂C} f Dq = 0`, the face integrand on the
`i`-th pair of faces being `f * eᵢ`. -/
theorem right_cauchy_box (a b : Fin 4 → ℝ) (hab : a ≤ b) (f : ℍ → ℍ)
    (hc : ContinuousOn f (toTuple.symm '' Set.Icc a b))
    (hd : ∀ x ∈ Set.pi Set.univ (fun i => Set.Ioo (a i) (b i)),
      RightFueterAt f (toTuple.symm x)) :
    boxBoundarySum a b (fun i x => f (toTuple.symm x) * toTuple.symm (Pi.single i 1)) = 0 := by
  sorry

/-- Left Cauchy–Fueter formula on an axis-aligned box (Frenkel–Libine, Theorem 9, left form;
Sudbery 1979, §4): for `f` continuous on the closed box, left Fueter regular at every point of its
interior, and `q₀` interior,
`f q₀ = (1 / (2π²)) ∫_{∂C} G(q - q₀) Dq f(q)`, the face integrand on the `i`-th pair of faces being
`G(q - q₀) * eᵢ * f q`. -/
theorem left_cauchyFueter_box (a b : Fin 4 → ℝ) (f : ℍ → ℍ)
    (hc : ContinuousOn f (toTuple.symm '' Set.Icc a b))
    (hd : ∀ x ∈ Set.pi Set.univ (fun i => Set.Ioo (a i) (b i)), LeftFueterAt f (toTuple.symm x))
    (q₀ : ℍ) (hq₀ : toTuple q₀ ∈ Set.pi Set.univ (fun i => Set.Ioo (a i) (b i))) :
    f q₀ = (1 / (2 * Real.pi ^ 2)) •
      boxBoundarySum a b (fun i x =>
        cauchyFueterKernel (toTuple.symm x) q₀ * toTuple.symm (Pi.single i 1) *
          f (toTuple.symm x)) := by
  sorry

/-- Right Cauchy–Fueter formula on an axis-aligned box (Frenkel–Libine, Theorem 9, right form):
for `f` continuous on the closed box, right Fueter regular at every point of its interior, and `q₀`
interior, `f q₀ = (1 / (2π²)) ∫_{∂C} f(q) Dq G(q - q₀)`, the face integrand on the `i`-th pair of
faces being `f q * eᵢ * G(q - q₀)`. -/
theorem right_cauchyFueter_box (a b : Fin 4 → ℝ) (f : ℍ → ℍ)
    (hc : ContinuousOn f (toTuple.symm '' Set.Icc a b))
    (hd : ∀ x ∈ Set.pi Set.univ (fun i => Set.Ioo (a i) (b i)),
      RightFueterAt f (toTuple.symm x))
    (q₀ : ℍ) (hq₀ : toTuple q₀ ∈ Set.pi Set.univ (fun i => Set.Ioo (a i) (b i))) :
    f q₀ = (1 / (2 * Real.pi ^ 2)) •
      boxBoundarySum a b (fun i x =>
        f (toTuple.symm x) * toTuple.symm (Pi.single i 1) *
          cauchyFueterKernel (toTuple.symm x) q₀) := by
  sorry

/-! ## Layer 6: regularity consequences and estimates -/

/-- A left Fueter regular function on an open set is real analytic there (Frenkel–Libine, §2.2,
remark after Theorem 9). -/
theorem leftFueter_realAnalytic (f : ℍ → ℍ) (Ω : Set ℍ) (hopen : IsOpen Ω)
    (hf : LeftFueterOn f Ω) : AnalyticOnNhd ℝ f Ω := by
  sorry

/-- A right Fueter regular function on an open set is real analytic there. -/
theorem rightFueter_realAnalytic (f : ℍ → ℍ) (Ω : Set ℍ) (hopen : IsOpen Ω)
    (hf : RightFueterOn f Ω) : AnalyticOnNhd ℝ f Ω := by
  sorry

/-- A left Fueter regular function on an open set is harmonic there: its Laplacian, Mathlib's
`Δ` on `ℍ → ℍ` for the Euclidean inner product of `ℍ`, which is the componentwise Laplacian,
vanishes at every point. -/
theorem leftFueter_harmonic (f : ℍ → ℍ) (Ω : Set ℍ) (hopen : IsOpen Ω)
    (hf : LeftFueterOn f Ω) : ∀ q ∈ Ω, Δ f q = 0 := by
  sorry

/-- A right Fueter regular function on an open set is harmonic there. -/
theorem rightFueter_harmonic (f : ℍ → ℍ) (Ω : Set ℍ) (hopen : IsOpen Ω)
    (hf : RightFueterOn f Ω) : ∀ q ∈ Ω, Δ f q = 0 := by
  sorry

/-- Uniqueness principle: two left Fueter regular functions on a connected open set that agree on
a nonempty open subset agree on the whole set. -/
theorem leftFueter_eqOn (f g : ℍ → ℍ) (Ω U : Set ℍ) (hopen : IsOpen Ω)
    (hconn : IsConnected Ω) (hf : LeftFueterOn f Ω) (hg : LeftFueterOn g Ω) (hU : IsOpen U)
    (hne : U.Nonempty) (hUΩ : U ⊆ Ω) (h : Set.EqOn f g U) : Set.EqOn f g Ω := by
  sorry

/-- Uniqueness principle for right Fueter regular functions. -/
theorem rightFueter_eqOn (f g : ℍ → ℍ) (Ω U : Set ℍ) (hopen : IsOpen Ω)
    (hconn : IsConnected Ω) (hf : RightFueterOn f Ω) (hg : RightFueterOn g Ω) (hU : IsOpen U)
    (hne : U.Nonempty) (hUΩ : U ⊆ Ω) (h : Set.EqOn f g U) : Set.EqOn f g Ω := by
  sorry

/-- Universal derivative estimate: for every order `m` there is a constant `C_m > 0`, depending on
`m` alone, such that every left Fueter regular `f` on a set containing the closed ball of radius
`R > 0` about `q₀`, bounded by `M` on that ball, satisfies
`‖iteratedFDeriv ℝ m f q₀‖ ≤ C_m R⁻ᵐ M`. -/
theorem leftFueter_iteratedFDeriv_bound (m : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (f : ℍ → ℍ) (Ω : Set ℍ), LeftFueterOn f Ω →
      ∀ (q₀ : ℍ) (R : ℝ), 0 < R → Metric.closedBall q₀ R ⊆ Ω →
      ∀ M : ℝ, (∀ q ∈ Metric.closedBall q₀ R, ‖f q‖ ≤ M) →
      ‖iteratedFDeriv ℝ m f q₀‖ ≤ C * R⁻¹ ^ m * M := by
  sorry

/-- Universal derivative estimate for right Fueter regular functions, with a constant depending
on `m` alone. -/
theorem rightFueter_iteratedFDeriv_bound (m : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (f : ℍ → ℍ) (Ω : Set ℍ), RightFueterOn f Ω →
      ∀ (q₀ : ℍ) (R : ℝ), 0 < R → Metric.closedBall q₀ R ⊆ Ω →
      ∀ M : ℝ, (∀ q ∈ Metric.closedBall q₀ R, ‖f q‖ ≤ M) →
      ‖iteratedFDeriv ℝ m f q₀‖ ≤ C * R⁻¹ ^ m * M := by
  sorry

end TauCetiRoadmap.QuaternionicAnalysis
