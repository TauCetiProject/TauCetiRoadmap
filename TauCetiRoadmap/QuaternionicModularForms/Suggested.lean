import Mathlib.Algebra.Quaternion
import TauCeti.Algebra.Quaternion.NormForm
import Mathlib.Algebra.Algebra.Subalgebra.Centralizer
import Mathlib.RingTheory.SimpleRing.Basic
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Lean.Elab.Tactic.Omega

/-!
# Quaternionic modular forms: representative interfaces

`README.md` is definitive; this file gives representative interfaces, not an exhaustive checklist.
Every definition here has a mathematical body. The `sorry`s are
theorem targets, not completed proofs; there are no admitted definitions or instances. Production
code must import the shared series, functional-analysis and Fredholm interfaces rather than copy
them into this namespace. In particular this file introduces no new Tate algebra or determinant.

The stabiliser signatures include compact subgroups that need not be open. The other signatures
pin right actions, invariant-coordinate evaluation, certificate transport,
normalisation of determinant characters, the representative constants in theta, and
the annular Mahler coordinate change with proved integer row/column estimates.
-/

namespace TauCetiRoadmap.QuaternionicModularForms

noncomputable section

open IsDedekindDomain
open scoped TensorProduct Quaternion Classical

attribute [local instance] Algebra.TensorProduct.rightAlgebra

section QuaternionNorm

/-- The arithmetic Hamilton norm is the native Tau Ceti norm form (§0.1). -/
theorem hamilton_normForm_eq_normSq {R : Type*} [CommRing R] (q : ℍ[R]) :
    QuaternionAlgebra.normForm (-1 : R) 0 (-1) q = Quaternion.normSq q := rfl

end QuaternionNorm

section Adelic

variable (F : Type*) [Field F] [NumberField F] (D : Type*) [Ring D] [Algebra F D]

abbrev Df := D ⊗[F] FiniteAdeleRing (NumberField.RingOfIntegers F) F

abbrev Dfx := (Df F D)ˣ

def unitsIncl : Dˣ →* Dfx F D :=
  Units.map (Algebra.TensorProduct.includeLeftRingHom (R := F) (A := D)).toMonoidHom

def globalUnits : Subgroup (Dfx F D) := (unitsIncl F D).range

def centralGlobalUnits : Subgroup (Dfx F D) :=
  ((unitsIncl F D).comp (Units.map (algebraMap F D).toMonoidHom)).range

abbrev classSet (U : Subgroup (Dfx F D)) :=
  DoubleCoset.Quotient (globalUnits F D : Set (Dfx F D)) (U : Set (Dfx F D))

def stabilizer (U : Subgroup (Dfx F D)) (x : Dfx F D) : Subgroup (Dfx F D) :=
  U ⊓ (globalUnits F D).comap (MulAut.conj x).toMonoidHom

def centralStabilizer (U : Subgroup (Dfx F D)) (x : Dfx F D) :
    Subgroup (stabilizer F D U x) :=
  (centralGlobalUnits F D).subgroupOf (stabilizer F D U x)

theorem centralStabilizer_normal (U : Subgroup (Dfx F D)) (x : Dfx F D) :
    (centralStabilizer F D U x).Normal := by
  sorry

theorem stab_top (x : Dfx F D) :
    stabilizer F D ⊤ x = (globalUnits F D).comap (MulAut.conj x).toMonoidHom := by
  simp [stabilizer]

theorem unitsIncl_injective : Function.Injective (unitsIncl F D) := by
  sorry

/-- The FLT comparison, with the canonical module topology rather than an arbitrary topology.
The general division-algebra proof is a supplier; §0.3 owns its quaternionic adapter. -/
theorem finite_classSet [IsDomain D] [FiniteDimensional F D] [Algebra.IsCentral F D]
    [TopologicalSpace (Df F D)]
    [IsModuleTopology (FiniteAdeleRing (NumberField.RingOfIntegers F) F) (Df F D)]
    (U : Subgroup (Dfx F D)) (hU : IsOpen (U : Set (Dfx F D))) :
    Finite (classSet F D U) := by
  sorry

namespace DefiniteQuaternion

/-- The stabiliser contract of §0.3, including compact subgroups that are not open.
The coset type in the first conclusion is defined without a normality instance; the separate
`centralStabilizer_normal` theorem provides the normality needed for its group structure. -/
theorem finite_stab [NumberField.IsTotallyReal F]
    [IsDomain D] [FiniteDimensional F D] [Algebra.IsCentral F D] [IsSimpleRing D]
    (hdim : Module.finrank F D = 4)
    (hdef : ∀ σ : F →+* ℝ,
      letI : Algebra F ℝ := σ.toAlgebra
      Nonempty ((D ⊗[F] ℝ) ≃ₐ[ℝ] ℍ[ℝ]))
    [TopologicalSpace (Df F D)]
    [IsModuleTopology (FiniteAdeleRing (NumberField.RingOfIntegers F) F) (Df F D)]
    (U : Subgroup (Dfx F D)) (hU : IsCompact (U : Set (Dfx F D))) (x : Dfx F D) :
    Finite ((stabilizer F D U x) ⧸ centralStabilizer F D U x) ∧
      (Module.finrank ℚ F = 1 → Finite (stabilizer F D U x)) := by
  sorry

theorem hamilton_negative_norm [NumberField.IsTotallyReal F] :
    ¬ ∃ q : ℍ[F], Quaternion.normSq q = -1 := by
  sorry

end DefiniteQuaternion

end Adelic

section LocalData

variable (F L D : Type*) [Field F] [Field L] [Ring D] [Algebra F D] [Algebra F L]

/-- A chosen local splitting is linear over the completed local field (§0.1). -/
structure Rigidification where
  equiv : (D ⊗[F] L) ≃ₐ[L] Matrix (Fin 2) (Fin 2) L

variable {K : Type*} [Field K]

/-- Unit-part normalisation; `ord` is the additive valuation of nonzero local elements. -/
def normalizedDetCharacter (π : Lˣ) (ord : Lˣ → ℤ) (χ : Lˣ →* Kˣ) : Lˣ → Kˣ :=
  fun x ↦ χ (π ^ (-ord x) * x)

theorem detCharacter_comparison (π : Lˣ) (ord : Lˣ → ℤ) (χ : Lˣ →* Kˣ) (x : Lˣ) :
    χ x = χ π ^ (ord x) * normalizedDetCharacter L π ord χ x := by
  sorry

theorem normalizedDetCharacter_mul (π : Lˣ) (ord : Lˣ → ℤ)
    (hord : ∀ x y, ord (x * y) = ord x + ord y) (χ : Lˣ →* Kˣ) (x y : Lˣ) :
    normalizedDetCharacter L π ord χ (x * y) =
      normalizedDetCharacter L π ord χ x * normalizedDetCharacter L π ord χ y := by
  sorry

theorem normalizedDetCharacter_uniformizer (π : Lˣ) (ord : Lˣ → ℤ)
    (hπ : ord π = 1) (χ : Lˣ →* Kˣ) :
    normalizedDetCharacter L π ord χ π = 1 := by
  sorry

end LocalData

section Forms

variable {R : Type*} [CommRing R] {G : Type*} [Group G]
variable (Γ : Subgroup G) (Δ : Submonoid G)
variable {A : Type*} [AddCommGroup A] [Module R A]
variable (ρ : Δᵐᵒᵖ →* Module.End R A)

/-- Right action on the coefficient module, using an actual opposite-monoid representation. -/
def rightAct (δ : Δ) : Module.End R A := ρ (MulOpposite.op δ)

def slash (φ : G → A) (δ : Δ) : G → A :=
  fun g ↦ rightAct Δ ρ δ (φ (g * (δ : G)⁻¹))

theorem slash_mul (φ : G → A) (δ ε : Δ) :
    slash Δ ρ (slash Δ ρ φ δ) ε = slash Δ ρ φ (δ * ε) := by
  sorry

/-- The defining transformation law includes both global invariance and the level action. -/
def Forms (U : Subgroup G) (hU : (U : Set G) ⊆ Δ) : Submodule R (G → A) where
  carrier := {φ | ∀ (γ : Γ) (g : G) (u : U),
    φ ((γ : G) * g * (u : G)) = rightAct Δ ρ ⟨u, hU u.2⟩ (φ g)}
  zero_mem' := by intro γ g u; simp [rightAct]
  add_mem' := by
    intro φ ψ hφ hψ γ g u
    simp only [Pi.add_apply, map_add]
    rw [hφ γ g u, hψ γ g u]
  smul_mem' := by
    intro r φ hφ γ g u
    simp only [Pi.smul_apply, map_smul]
    rw [hφ γ g u]

variable (U : Subgroup G) (hU : (U : Set G) ⊆ Δ) {ι : Type*} (c : ι → G)

theorem eval_injective
    (hc : Function.Surjective fun i ↦ DoubleCoset.mk Γ U (c i)) :
    Function.Injective (fun φ : Forms Γ Δ ρ U hU ↦ fun i ↦ φ.1 (c i)) := by
  sorry

/-- Evaluation lands in the stabiliser invariants, and every invariant tuple extends (§2.1). -/
theorem eval_mem_range_iff
    (hc : Function.Bijective fun i ↦ DoubleCoset.mk Γ U (c i)) (a : ι → A) :
    a ∈ Set.range (fun φ : Forms Γ Δ ρ U hU ↦ fun i ↦ φ.1 (c i)) ↔
      ∀ i (u : U), c i * (u : G) * (c i)⁻¹ ∈ Γ →
        rightAct Δ ρ ⟨u, hU u.2⟩ (a i) = a i := by
  sorry

variable {T : Type*} [Fintype T]

/-- The raw finite sum has a genuine definition. Preserving the level requires the separate
double-coset decomposition theorem; no arbitrary representative family is declared a Hecke map. -/
def heckeSum (x : T → Δ) (φ : G → A) : G → A :=
  fun g ↦ ∑ t, slash Δ ρ φ (x t) g

theorem heckeSum_apply_rep (x : T → Δ) (σ : ι → T → ι)
    (d : ι → T → Γ) (u : ι → T → U)
    (hcert : ∀ i t, c i * (x t : G)⁻¹ = (d i t : G) * c (σ i t) * (u i t : G))
    (φ : Forms Γ Δ ρ U hU) (i : ι) :
    heckeSum Δ ρ x φ (c i) =
      ∑ t, rightAct Δ ρ (⟨(u i t : G), hU (u i t).2⟩ * x t) (φ.1 (c (σ i t))) := by
  sorry

end Forms

section WeightColumns

variable {K : Type*} [Field K]

def linearSeries (a b : K) : PowerSeries K :=
  PowerSeries.C a * PowerSeries.X + PowerSeries.C b

/-- A matrix column with a supplied automorphy factor, using the native formal inverse. -/
def weightColumn (a b c : K) (d : Kˣ) (j : PowerSeries K) (n : ℕ) : PowerSeries K :=
  j * (linearSeries a b * PowerSeries.invOfUnit (linearSeries c (d : K)) d) ^ n

/-- Local polynomial columns for an algebraic weight, before the determinant-normalisation
comparison. This is an equality of native series, not a replacement Tate-algebra definition. -/
theorem algebraic_weightColumn (a b c : K) (d : Kˣ) (k n : ℕ) (hn : n ≤ k) :
    weightColumn a b c d (linearSeries c (d : K) ^ k) n =
      linearSeries a b ^ n * linearSeries c (d : K) ^ (k - n) := by
  sorry

/-- Bol's column identity (§5.1); generic derivative APIs are supplied by RestrictedPowerSeries. -/
theorem bol [CharZero K] (a b c : K) (d : Kˣ) (r j : ℕ) :
    (PowerSeries.derivative (R := K) : PowerSeries K → PowerSeries K)^[r]
        (linearSeries a b ^ (j + r) *
          PowerSeries.invOfUnit (linearSeries c (d : K)) d ^ (j + 1)) =
      PowerSeries.C ((a * (d : K) - b * c) ^ r * ((j + r).descFactorial r : K)) *
        linearSeries a b ^ j *
          PowerSeries.invOfUnit (linearSeries c (d : K)) d ^ (j + r + 1) := by
  sorry

end WeightColumns

section AnnularMahler

open scoped ZeroAtInfty

/-- §4.4 uses the shared null-sequence carrier, with its native supremum norm.
Its function realization is weighted; it is not an ordinary Tate-disc module. -/
abbrev AnnularMahlerCoordinates (R : Type*) [NormedCommRing R] := C₀(ℕ, R)

/-- Half-weighting leaves room to prove null columns in the T-gauge. -/
def mahlerWeight (n : ℕ) : ℕ := n / 2

variable {R : Type*} [NormedCommRing R]

/-- The ordinary Mahler coefficients of a weighted coordinate vector. -/
def annularMahlerCoefficients (t : Rˣ) (b : AnnularMahlerCoordinates R) (n : ℕ) : R :=
  (t : R) ^ mahlerWeight n * b n

/-- Output-first matrix under the weighted coordinate change; no p or factorial is inverted. -/
def annularMahlerMatrix (t : Rˣ) (P : Matrix ℕ ℕ R) : Matrix ℕ ℕ R :=
  fun m n ↦ ((t⁻¹ : Rˣ) : R) ^ mahlerWeight m * P m n * (t : R) ^ mahlerWeight n

/-- The nonnegative integral exponent for a general monoid element. -/
theorem mahlerWeight_le (m n : ℕ) :
    mahlerWeight m ≤ mahlerWeight n + (m - n) := by
  unfold mahlerWeight
  omega

/-- For fixed n this lower bound tends to infinity with m; hence weighted columns are null. -/
theorem mahler_column_exponent (m n : ℕ) :
    m - m / 2 - n ≤ mahlerWeight n + (m - n) - mahlerWeight m := by
  unfold mahlerWeight
  omega

/-- The contracting matrix estimate gives a uniform bound in the output index.
This is the arithmetic step turning the Mahler divisibility theorem into null rows. -/
theorem mahler_row_exponent (p m n : ℕ) (hp : 2 ≤ p) :
    m - m / 2 ≤ mahlerWeight n + (m - n / p) - mahlerWeight m := by
  have hdiv : n / p ≤ n / 2 := Nat.div_le_div_left hp (by decide)
  unfold mahlerWeight
  omega

/-- Finite principal determinants are unchanged under weighted coordinate rescaling.
Passing to Fredholm series additionally requires the two convergence theorems in §4.4. -/
theorem annularMahlerMatrix_det (t : Rˣ) (P : Matrix ℕ ℕ R)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (e : ι → ℕ) :
    Matrix.det ((annularMahlerMatrix t P).submatrix e e) =
      Matrix.det (P.submatrix e e) := by
  sorry

end AnnularMahler

section Theta

variable {K : Type*} [Field K]
variable {G : Type*} [Group G]

/-- The raw theta formula on functions; §5.2 proves it maps the specified form spaces. -/
def thetaOnFunctions (c : G →* Kˣ) (r : ℕ) (φ : G → PowerSeries K) : G → PowerSeries K :=
  fun g ↦ PowerSeries.C ((c g : K)⁻¹ ^ r) * (PowerSeries.derivative (R := K) : PowerSeries K → PowerSeries K)^[r] (φ g)

theorem theta_eval {ι : Type*} (c : G →* Kˣ) (r : ℕ) (reps : ι → G)
    (φ : G → PowerSeries K) (i : ι) :
    thetaOnFunctions c r φ (reps i) =
      PowerSeries.C ((c (reps i) : K)⁻¹ ^ r) *
        (PowerSeries.derivative (R := K) : PowerSeries K → PowerSeries K)^[r] (φ (reps i)) := rfl

end Theta

section SmallSlope

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
variable {A B : Type*} [NormedAddCommGroup A] [NormedSpace K A]
  [NormedAddCommGroup B] [NormedSpace K B] [CompleteSpace B]

/-- The small-slope mechanism, including generalised eigenvectors. In the forms application
`s=p^(k+1)`, `θ=Θ^(k+1)`, and `‖u'‖≤1`. No trivial-stabiliser hypothesis is needed. -/
theorem theta_kills_generalized_eigenvector
    (u : A →L[K] A) (u' : B →L[K] B) (θ : A →L[K] B) (s : K)
    (hs : s ≠ 0) (hintertwine : θ.comp u = s • (u'.comp θ))
    (hnorm : ‖u'‖ ≤ 1) (eigenval : K) (hval : ‖s‖ < ‖eigenval‖)
    (N : ℕ) (f : A)
    (hf : ((u - eigenval • ContinuousLinearMap.id K A) ^ N) f = 0) :
    θ f = 0 := by
  sorry

end SmallSlope

end

end TauCetiRoadmap.QuaternionicModularForms
