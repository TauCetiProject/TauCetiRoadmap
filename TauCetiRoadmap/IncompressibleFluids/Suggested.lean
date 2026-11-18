module

public import Mathlib
public import TauCeti.Analysis.Distribution.TestFunction.Divergence
public import TauCeti.Analysis.PDE.HeatKernel.Smoothing

/-!
# Incompressible fluids: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti and each with `sorry`, the definitions and headline theorems of the roadmap whose
carriers exist at the pins. Everything else the roadmap plans, including every API bullet and
every Check, lives in the README.

Stated here: the weak divergence of a locally integrable field and the solenoidal subspace
`L²_σ` (§1.1); the Leray projection as the orthogonal projection onto it, with its commutation
with the heat semigroup (§1.2); the off-diagonal `Lᵖ`–`L^q` estimate for the heat semigroup
(§2.1); Ladyzhenskaya's inequality in dimension two (§3.1); and the bilinear fixed-point lemma
(§5.1).

Headline theorems not statable at the pins, and what each lacks:

* §1.2–§1.3 (the Riesz-transform formula for the Leray projection, its `Lᵖ` bounds and the
  pressure operator): the Riesz transforms are on Tau Ceti's `main` and newer than the pin, and
  act on complex-valued functions, so the formula for a real field needs the componentwise
  real-part carrier that §1.2 builds.
* §2.2–§2.3 (the Stokes semigroup, the Oseen kernel and the Stokes system): the restriction of
  a contraction semigroup to an invariant closed subspace and convolution with a matrix-valued
  kernel are targets of §2.2.
* §3.2–§3.4 (the trilinear form, the product and commutator estimates, Aubin–Lions): the
  vector-valued space `H¹(E; E)` with its solenoidal subspace is a target of §1.4, the real
  Bessel scale is PDE §1.3, and the weak time derivative of an `L^r(0,T; X₁)`-valued function
  for a general Banach space `X₁` is PDE §6.1.
* Layer 4 (weak and Leray–Hopf solutions), §5.2–§5.4 (mild solutions) and Layer 6 (the Euler
  equations): the energy class `L^∞(0,T; L²_σ) ∩ L²(0,T; H¹)`, the solenoidal Sobolev spaces
  `Hˢ_σ` and the Biot–Savart kernels all rest on the carriers of Layers 1–3.
-/

@[expose] public section

open MeasureTheory TauCeti TopologicalSpace Filter Set Real
open scoped ENNReal NNReal InnerProductSpace Distributions

noncomputable section

namespace TauCetiRoadmap.IncompressibleFluids

/-! ## Layer 1: solenoidal fields and the Leray projection -/

section Layer1

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **Weak divergence** (§1.1). A locally integrable vector field `u` has weak divergence `g` on
the open set `Ω` when `∫ ⟪u, ∇φ⟫ = −∫ φ g` for every scalar test function `φ` on `Ω`. This asks
only for the scalar `div u`, not for the full weak derivative `TauCeti.HasWeakFDerivOn`. -/
def HasWeakDivergenceOn (Ω : Opens E) (u : E → E) (g : E → ℝ) : Prop :=
  LocallyIntegrableOn u Ω volume ∧ LocallyIntegrableOn g Ω volume ∧
    ∀ φ : 𝓓(Ω, ℝ), ∫ x, ⟪u x, gradient (φ : E → ℝ) x⟫_ℝ = -∫ x, (φ : E → ℝ) x * g x

/-- A field is **solenoidal** on `Ω` when its weak divergence there is zero (§1.1). -/
def IsSolenoidalOn (Ω : Opens E) (u : E → E) : Prop :=
  HasWeakDivergenceOn Ω u 0

variable (E) in
/-- **The solenoidal subspace** `L²_σ(E)` of square-integrable vector fields on the whole space
with zero weak divergence (§1.1). -/
def solenoidalL2 : Submodule ℝ (Lp E 2 (volume : Measure E)) where
  carrier := {u | IsSolenoidalOn ⊤ (u : E → E)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- `L²_σ(E)` is closed in `L²(E; E)` (§1.1). -/
theorem isClosed_solenoidalL2 :
    IsClosed (solenoidalL2 E : Set (Lp E 2 (volume : Measure E))) := by
  sorry

/-- The orthogonal projection onto `L²_σ(E)` exists, as `L²_σ(E)` is closed (§1.2). -/
instance : (solenoidalL2 E).HasOrthogonalProjection := by
  sorry

variable (E) in
/-- **The Leray projection** `ℙ`: the orthogonal projection of `L²(E; E)` onto the solenoidal
subspace (§1.2). -/
def lerayProjection : Lp E 2 (volume : Measure E) →L[ℝ] Lp E 2 (volume : Measure E) :=
  (solenoidalL2 E).starProjection

/-- **Helmholtz–Weyl** (§1.2). The orthogonal complement of `L²_σ(E)` is the closure of the
gradients of scalar test functions: an `L²` field is orthogonal to every solenoidal field
exactly when it is an `L²` limit of test gradients. -/
theorem mem_orthogonal_solenoidalL2_iff (u : Lp E 2 (volume : Measure E)) :
    u ∈ (solenoidalL2 E)ᗮ ↔
      ∀ ε > 0, ∃ φ : 𝓓((⊤ : Opens E), ℝ),
        eLpNorm (fun x ↦ u x - gradient (φ : E → ℝ) x) 2 volume < ENNReal.ofReal ε := by
  sorry

/-- **The Leray projection commutes with the heat semigroup** (§1.2). -/
theorem lerayProjection_heatSemigroup [CompleteSpace E] (t : ℝ≥0)
    (u : Lp E 2 (volume : Measure E)) :
    lerayProjection E (heatSemigroup (p := 2) ENNReal.ofNat_ne_top t u) =
      heatSemigroup (p := 2) ENNReal.ofNat_ne_top t (lerayProjection E u) := by
  sorry

end Layer1

/-! ## Layer 2: linear estimates -/

section Layer2

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E] [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]

/-- **Off-diagonal estimate for the heat semigroup** (§2.1). For `1 ≤ p ≤ q ≤ ∞`, `p < ∞` and
`t > 0`, `‖e^{tΔ}f‖_q ≤ (4πt)^{−(d/2)(1/p − 1/q)}‖f‖_p`. The case `q = ∞` is the pinned
`TauCeti.eLpNorm_heatSemigroup_top_le`; there `q.toReal⁻¹ = 0`. -/
theorem eLpNorm_heatSemigroup_le {p q : ℝ≥0∞} [Fact (1 ≤ p)] (hp : p ≠ ∞) (hpq : p ≤ q)
    {t : ℝ≥0} (ht : t ≠ 0) (f : Lp F p (volume : Measure E)) :
    eLpNorm (heatSemigroup hp t f) q volume ≤
      ENNReal.ofReal ((4 * π * (t : ℝ)) ^
        (-(Module.finrank ℝ E : ℝ) / 2 * (p.toReal⁻¹ - q.toReal⁻¹))) * eLpNorm f p volume := by
  sorry

end Layer2

/-! ## Layer 3: nonlinear estimates -/

section Layer3

/-- **Ladyzhenskaya's inequality in dimension two** (§3.1). For a compactly supported `C¹`
function on the plane, `‖u‖₄⁴ ≤ 2‖u‖₂²‖∇u‖₂²`. -/
theorem integral_pow_four_le_of_finrank_eq_two {u : EuclideanSpace ℝ (Fin 2) → ℝ}
    (hu : ContDiff ℝ 1 u) (h2u : HasCompactSupport u) :
    ∫ x, u x ^ 4 ≤ 2 * (∫ x, u x ^ 2) * ∫ x, ‖fderiv ℝ u x‖ ^ 2 := by
  sorry

end Layer3

/-! ## Layer 5: mild solutions -/

section Layer5

variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]

/-- **The bilinear fixed-point lemma** (§5.1). If `‖B(x, y)‖ ≤ η‖x‖‖y‖` and `4η‖a‖ < 1`, the
equation `x = a + B(x, x)` has a solution with `‖x‖ ≤ 2‖a‖`, and it is the only solution of
norm less than `1/(2η)`. -/
theorem exists_eq_add_bilin_self (B : X →L[ℝ] X →L[ℝ] X) {η : ℝ} (hη : 0 < η)
    (hB : ∀ x y, ‖B x y‖ ≤ η * ‖x‖ * ‖y‖) {a : X} (ha : 4 * η * ‖a‖ < 1) :
    ∃ x : X, x = a + B x x ∧ ‖x‖ ≤ 2 * ‖a‖ ∧
      ∀ y : X, y = a + B y y → ‖y‖ < 1 / (2 * η) → y = x := by
  sorry

end Layer5

end TauCetiRoadmap.IncompressibleFluids
