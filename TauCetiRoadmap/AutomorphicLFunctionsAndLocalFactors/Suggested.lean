import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Invariants
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.Topology.Instances.Matrix
import Mathlib.Analysis.Fourier.FourierTransform
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.EulerProduct.DirichletLSeries
import Mathlib.Analysis.SpecialFunctions.Gaussian.PoissonSummation
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Analysis.Distribution.SchwartzSpace.Basic
import Mathlib.Analysis.Distribution.TemperedDistribution
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Topology.Algebra.PontryaginDual
import Mathlib.NumberTheory.LSeries.Basic
import Mathlib.NumberTheory.DirichletCharacter.GaussSum
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.Meromorphic.Divisor

/-!
# AutomorphicLFunctionsAndLocalFactors: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These suggested forms record light definitions and theorem signatures statable
against the pinned Mathlib and Tau Ceti APIs; proving every declaration does not complete a layer.

The formulas fix the positive Tate Fourier kernel, the unitary centre, canonical real and complex
gamma factors, geometric-Frobenius determinant conventions and continuation before evaluation.
The common adelic Schwartz/Fourier/Poisson space and scalar Tate continuation are consumed from
ArithmeticGaloisRepresentations §2.7 Global inputs. The README specifies their vector-space and
distribution refinements, representation spaces, shtukas and rational period comparisons.
AutomorphicFormsOnReductiveGroups §§2.3–2.7 and 3.4–3.5 supplies the general induction,
globalization and algebraic tensor constructions; §§4.3 and 5.7 supply number-field cuspidal
GLₙ genericity and Clozel rationality. The README specializes these for its Whittaker and
rational-period interfaces. The supplier’s §4.5 cosh Bessel kernel is identified with the half-integral
adapter below; order-variable holomorphy and derivatives are additional targets here.
Section 4.5 also supplies `NormalizedMaassEigenform(r,δ)`, `fourierCoefficient`,
`fourierExpansion`, `maassHecke`, `maassHeckeRecurrence`, `maassAdelization` and
`maassClassicalEquiv`. AL.2 consumes its real nonnegative parameter branch with reflection
sign `(-1)^δ`; a negative real input uses the same eigenvalue and `K_{ir}=K_{-ir}`.
The supplied subtype retains smooth level-one invariance, square-integrability, cuspidality,
the Laplace and simultaneous Hecke eigenconditions, and first Fourier coefficient one.
Its standard and adjoint L-series, local factors, completions, functional equation and
L-value norm identities are specified in AL.2 of the README.
The finite-place distribution epsilon scalar is identified unconditionally with
ArithmeticGaloisRepresentations §2.7's `tateLocalConstant` at the norm-twisted character.
The rational period datum retains its infinity generator; its Gauss twisting relation uses
transported generators, or the additional infinity comparison scalar for independent choices.
The arbitrary-level shtuka purity input is the intersection-cohomology comparison specified
in AL.3, using EtaleCohomologyFoundations §F.8 and DeligneWeightsAndPurity §§8.11–8.12.
-/

noncomputable section
open MeasureTheory
open scoped Topology NNReal ENNReal

#check AddChar.compAddMonoidHom
#check AddChar.mulShift
#check AddChar.mulShift_mul
#check AddChar.mulShift_mulShift
#check SchwartzMap.fourierTransformCLM
#check TemperedDistribution.delta
#check LSeries
#check Matrix.charpolyRev
#check Matrix.eval_charpolyRev
#check Matrix.coeff_charpolyRev_eq_neg_trace

/-! ## Layer AL.0: local Fourier analysis -/

namespace TauCeti.LocalFourier

variable {R V W : Type*} [CommRing R] [AddCommGroup V] [Module R V]
  [AddCommGroup W] [Module R W]

/-- AL.0/pairing-annihilator: native additive subgroup, not an R-submodule. -/
def pairingAnnihilator (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R)
    (U : AddSubgroup V) : AddSubgroup W :=
  ⨅ v : U, (ψ.compAddMonoidHom (L v).toAddMonoidHom).toAddMonoidHom.ker

-- TauCeti.LocalFourier.pairingAnnihilator_zmod_two
example : pairingAnnihilator (ZMod.toCircle (N := 2))
    (LinearMap.mul (ZMod 2) (ZMod 2)) ⊤ = ⊥ := by sorry

-- TauCeti.LocalFourier.pairingAnnihilator_trivial_character
example : pairingAnnihilator (1 : AddChar R Circle)
    (LinearMap.mul R R) (⊤ : AddSubgroup R) = ⊤ := by sorry

-- TauCeti.LocalFourier.pairingAnnihilator_zmultiples_eq_kernel
example (ψ : AddChar R Circle) : pairingAnnihilator ψ (LinearMap.mul R R)
    (AddSubgroup.zmultiples (1 : R)) = ψ.toAddMonoidHom.ker := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.zero
example (ψ : AddChar R Circle) (x : R) : AddChar.mulShift ψ 0 x = 1 := by sorry

-- TauCeti.LocalFourier.pairingAnnihilator_not_real_submodule
example :
    (1 : ℝ) ∈ pairingAnnihilator Real.fourierChar (LinearMap.mul ℝ ℝ)
      (AddSubgroup.zmultiples (1 : ℝ)) ∧
    (1 / 2 : ℝ) ∉ pairingAnnihilator Real.fourierChar (LinearMap.mul ℝ ℝ)
      (AddSubgroup.zmultiples (1 : ℝ)) := by sorry

/-- AL.0/closed-annihilator. -/
theorem isClosed_pairingAnnihilator [TopologicalSpace W]
    (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (h : ∀ v, Continuous (fun w => ψ (L v w))) :
    IsClosed (pairingAnnihilator ψ L U : Set W) := by sorry

/-- AL.0/open-annihilator. -/
theorem isOpen_pairingAnnihilator [TopologicalSpace V] [TopologicalSpace W]
    (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (hU : IsCompact (U : Set V))
    (h : IsLocallyConstant (fun p : V × W => ψ (L p.1 p.2))) :
    IsOpen (pairingAnnihilator ψ L U : Set W) := by sorry

section Fourier
variable [MeasurableSpace V]

/-- AL.0/vanishing-from-period: translation covariance is imported from Mathlib. -/
theorem fourierIntegral_eq_zero_of_period [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (u : V) (w : W)
    (hf : ∀ v, f (v + u) = f v) (hw : ψ (L u w) ≠ 1) :
    VectorFourier.fourierIntegral ψ μ L f w = 0 := by sorry

/-- AL.0/fourier-support. This uses ordinary support, before taking closure. -/
theorem support_fourierIntegral_subset [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (U : AddSubgroup V)
    (hf : ∀ u ∈ U, ∀ v, f (v + u) = f v) :
    Function.support (VectorFourier.fourierIntegral ψ μ L f) ⊆
      (pairingAnnihilator ψ L U : Set W) := by sorry

/-- AL.0/indicator-transform. The Bochner integral is the native totalized integral. -/
theorem fourierIntegral_indicator [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V) (hU : MeasurableSet (U : Set V)) :
    VectorFourier.fourierIntegral ψ μ L ((U : Set V).indicator (fun _ => (1 : ℂ))) =
      (pairingAnnihilator ψ L U : Set W).indicator (fun _ => (μ.real U : ℂ)) := by sorry

/-- AL.0/coset-transform: f(v-a), hence the negative phase. -/
theorem fourierIntegral_coset_indicator [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V) (hU : MeasurableSet (U : Set V))
    (a : V) :
    VectorFourier.fourierIntegral ψ μ L
      (fun v => (U : Set V).indicator (fun _ => (1 : ℂ)) (v - a)) =
      fun w => ψ (-L a w) •
        (pairingAnnihilator ψ L U : Set W).indicator (fun _ => (μ.real U : ℂ)) w := by sorry

/-- AL.0/modulation: positive modulation shifts frequency by minus w₀. -/
theorem fourierIntegral_modulation (ψ : AddChar R Circle) (μ : Measure V)
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (w₀ : W) :
    VectorFourier.fourierIntegral ψ μ L (fun v => ψ (L v w₀) • f v) =
      fun w => VectorFourier.fourierIntegral ψ μ L f (w - w₀) := by sorry

/-- AL.0/frequency-periods. -/
theorem fourierIntegral_add_of_support (ψ : AddChar R Circle) (μ : Measure V)
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (U : AddSubgroup V)
    (hf : Function.support f ⊆ (U : Set V)) (a : W)
    (ha : a ∈ pairingAnnihilator ψ L U) (w : W) :
    VectorFourier.fourierIntegral ψ μ L f (w + a) =
      VectorFourier.fourierIntegral ψ μ L f w := by sorry

/-- AL.0/locally-constant-transform. -/
theorem isLocallyConstant_fourierIntegral [TopologicalSpace V] [TopologicalSpace W]
    [IsTopologicalAddGroup W]
    (ψ : AddChar R Circle) (μ : Measure V) (L : V →ₗ[R] W →ₗ[R] R)
    (f : V → ℂ) (U : AddSubgroup V) (hU : IsCompact (U : Set V))
    (h : IsLocallyConstant (fun p : V × W => ψ (L p.1 p.2)))
    (hf : Function.support f ⊆ (U : Set V)) :
    IsLocallyConstant (VectorFourier.fourierIntegral ψ μ L f) := by sorry

/-- AL.0/compact-support-transform: compactness of the annihilator is an explicit input. -/
theorem hasCompactSupport_fourierIntegral [MeasurableAdd V]
    [TopologicalSpace W] [T2Space W]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (U : AddSubgroup V)
    (hf : ∀ u ∈ U, ∀ v, f (v + u) = f v)
    (hU : IsCompact (pairingAnnihilator ψ L U : Set W)) :
    HasCompactSupport (VectorFourier.fourierIntegral ψ μ L f) := by sorry

/-- AL.0/indicator-inversion: conditional on dual annihilators and dual measures. -/
theorem fourierIntegral_fourierIntegral_indicator [MeasurableSpace W]
    [MeasurableAdd V] [MeasurableAdd W]
    (ψ : AddChar R Circle) (μ : Measure V) (ν : Measure W)
    [μ.IsAddRightInvariant] [ν.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (hU : MeasurableSet (U : Set V))
    (hA : MeasurableSet (pairingAnnihilator ψ L U : Set W))
    (hdual : pairingAnnihilator ψ L.flip (pairingAnnihilator ψ L U) = U)
    (hvol : μ.real U * ν.real (pairingAnnihilator ψ L U) = 1) :
    VectorFourier.fourierIntegral ψ ν L.flip
      (VectorFourier.fourierIntegral ψ μ L ((U : Set V).indicator (fun _ => (1 : ℂ)))) =
      fun v => (U : Set V).indicator (fun _ => (1 : ℂ)) (-v) := by sorry

end Fourier

-- TauCeti.LocalFourier.indicator_zmod_two_count
example : VectorFourier.fourierIntegral (ZMod.toCircle (N := 2)) Measure.count
    (LinearMap.mul (ZMod 2) (ZMod 2)) (fun _ => (1 : ℂ)) =
    ({0} : Set (ZMod 2)).indicator (fun _ => (2 : ℂ)) := by sorry

-- TauCeti.LocalFourier.coset_zmod_four_sign
example : VectorFourier.fourierIntegral (ZMod.toCircle (N := 4)) Measure.count
    (LinearMap.mul (ZMod 4) (ZMod 4))
    (({1} : Set (ZMod 4)).indicator (fun _ => (1 : ℂ))) (1 : ZMod 4) = -Complex.I := by sorry

-- TauCeti.LocalFourier.counting_measure_double_transform
example (f : ZMod 2 → ℂ) :
    VectorFourier.fourierIntegral (ZMod.toCircle (N := 2)) Measure.count
      (LinearMap.mul (ZMod 2) (ZMod 2))
      (VectorFourier.fourierIntegral (ZMod.toCircle (N := 2)) Measure.count
        (LinearMap.mul (ZMod 2) (ZMod 2)) f) = fun x => (2 : ℂ) * f (-x) := by sorry

-- TauCeti.LocalFourier.modulation_zmod_three
example : VectorFourier.fourierIntegral (ZMod.toCircle (N := 3)) Measure.count
    (LinearMap.mul (ZMod 3) (ZMod 3))
    (fun x => ZMod.toCircle x • (1 : ℂ)) =
    ({1} : Set (ZMod 3)).indicator (fun _ => (3 : ℂ)) := by sorry

end TauCeti.LocalFourier

namespace TauCeti.SchwartzBruhat

-- TauCeti.SchwartzBruhat.LocalSpace.gaussian_mem
example : (∃ f : SchwartzMap ℝ ℂ, ∀ x, f x = Complex.exp (-Real.pi*(x : ℂ)^2)) ∧
    (∃ f : SchwartzMap ℂ ℂ, ∀ z, f z = Complex.exp (-2*Real.pi*(‖z‖ : ℂ)^2)) := by sorry
-- TauCeti.SchwartzBruhat.LocalSpace.const_not_mem
example : ¬∃ f : SchwartzMap ℝ ℂ, ∀ x, f x = 1 := by sorry

end TauCeti.SchwartzBruhat

namespace TauCeti.AutomorphicLFunctions.AL0

/-- Positive Fourier kernel, compared to the native negative kernel by reflection. -/
def PartialFourierTransform {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (Φ : X × V → ℂ) (x : X) (w : W) : ℂ :=
  VectorFourier.fourierIntegral ψ μ B (fun v => Φ (x,v)) (-w)

theorem PartialFourierTransform.product {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (f : X → ℂ) (g : V → ℂ) (x : X) (w : W) :
    PartialFourierTransform ψ μ B (fun p => f p.1 * g p.2) x w =
      f x * VectorFourier.fourierIntegral ψ μ B g (-w) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.zero_v_space
example (f : ℝ → ℂ) (x : ℝ) :
    PartialFourierTransform Real.fourierChar (Measure.dirac (0 : Fin 0 → ℝ))
      (0 : (Fin 0 → ℝ) →ₗ[ℝ] (Fin 0 → ℝ) →ₗ[ℝ] ℝ)
      (fun p => f p.1) x 0 = f x := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.real_one
example : Real.fourierChar (1 : ℝ) = 1 ∧
    Real.fourierChar (1/2 : ℝ) = -1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.complex_imaginary
example : Real.fourierChar (2 * Complex.I.re) = 1 := by sorry

/-- Normalization from an additive Haar μ₀ with μ₀(O)=1, at a finite place. -/
def SelfDualHaar {F : Type*} [MeasurableSpace F] (μ₀ : Measure F)
    (q : ℝ) (d : ℕ) : Measure F := ENNReal.ofReal (q ^ (-(d : ℝ)/2)) • μ₀

theorem SelfDualHaar.unit_volume {F : Type*} [MeasurableSpace F]
    (μ₀ : Measure F) (O : Set F) (q : ℝ) (d : ℕ) (h : μ₀ O = 1) :
    SelfDualHaar μ₀ q d O = ENNReal.ofReal (q ^ (-(d : ℝ)/2)) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.unramified
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F) (q : ℝ) (hq : 0 < q) :
    SelfDualHaar μ₀ q 0 = μ₀ := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.different_two
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F) (q : ℝ) (hq : 0 < q) :
    SelfDualHaar μ₀ q 2 = ENNReal.ofReal q⁻¹ • μ₀ := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.scaled_character
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F)
    (q : ℝ) (hq : 0 < q) (d : ℕ) :
    SelfDualHaar μ₀ q (d+1) =
      ENNReal.ofReal (q ^ (-1/2 : ℝ)) • SelfDualHaar μ₀ q d := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.complex_trace
example : (∫ z : ℂ, Complex.exp (-2*Real.pi*(‖z‖ : ℂ)^2)) = (1/2 : ℂ) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.real_half
example : AddChar.mulShift Real.fourierChar (1/2 : ℝ) 1 = -1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.zmod_two
example : Function.Bijective (fun y : ZMod 2 =>
    AddChar.mulShift (ZMod.toCircle (N := 2)) y) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.trivial_character
example : AddChar.mulShift (1 : AddChar ℝ Circle) (1 : ℝ) =
    AddChar.mulShift (1 : AddChar ℝ Circle) 0 := by sorry

/-- Half-integral adapter to AutomorphicFormsOnReductiveGroups §4.5's cosh Bessel kernel,
    with complex order and positive real argument in the public API. -/
def BesselK (ν : ℂ) (c : ℝ) : ℂ :=
  (1/2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹)/2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)

/-- For positive argument the half-integral converges absolutely and equals the supplied
    cosh kernel, by substituting u = exp(t) and pairing t with -t. -/
theorem BesselK.integral (ν : ℂ) {c : ℝ} (hc : 0 < c) :
    IntegrableOn (fun u : ℝ =>
      Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹)/2) *
        Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)) (Set.Ioi 0) ∧
    BesselK ν c = ∫ t : ℝ in Set.Ioi 0,
      Complex.exp (-(c : ℂ) * (Real.cosh t : ℂ)) * Complex.cosh (ν * (t : ℂ)) := by
  sorry

/-- The supplied cosh-kernel symmetry transports to the half-integral adapter. -/
theorem BesselK.even (ν : ℂ) {c : ℝ} (hc : 0 < c) :
    BesselK (-ν) c = BesselK ν c := by sorry

/-- At positive argument the half-integral adapter is entire in its complex order. -/
theorem BesselK.entire_order {c : ℝ} (hc : 0 < c) :
    Differentiable ℂ (fun ν => BesselK ν c) := by sorry

/-- The supplied half-order value transports to the half-integral adapter. -/
theorem BesselK.half {c : ℝ} (hc : 0 < c) :
    BesselK (1/2) c = (Real.sqrt (Real.pi/(2*c))*Real.exp (-c) : ℝ) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.BesselK.half_at_one
example : BesselK (1/2) 1 = (Real.sqrt (Real.pi/2)/Real.exp 1 : ℝ) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.BesselK.negative_half_at_two
example : BesselK (-1/2) 2 = (Real.sqrt (Real.pi/4)*Real.exp (-2) : ℝ) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.BesselK.zero_order_positive
example {c : ℝ} (hc : 0 < c) : 0 < (BesselK 0 c).re := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.BesselK.not_even_in_argument
example : ¬ IntegrableOn (fun u : ℝ => (u : ℂ)⁻¹) (Set.Ioi 0) := by sorry

/-- Real exponential integral Ei(-r), only r>0 is used. -/
def negativeEi (r : ℝ) : ℝ := -(∫ t : ℝ in Set.Ioi r, Real.exp (-t)/t)

example {r : ℝ} (hr : 0 < r) : negativeEi r < 0 := by sorry

example : deriv negativeEi 2 = Real.exp (-2) / 2 := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.negativeEi.tendsto_atTop
example : Filter.Tendsto negativeEi Filter.atTop (𝓝 0) := by sorry

theorem BesselHalfOrderDerivative {c : ℝ} (hc : 0 < c) :
    deriv (fun ν : ℂ => BesselK ν c) (1/2) =
      (-(Real.sqrt (Real.pi/2)*Real.exp c*c^(-1/2 : ℝ)*negativeEi (2*c)) : ℝ) := by sorry

/-- A nontrivial continuous character identifies the real additive group with its dual. -/
theorem LocalAdditiveSelfDuality (ψ : AddChar ℝ Circle)
    (hψ : Continuous ψ) (hne : ψ ≠ 1) :
    ∃ ι : Multiplicative ℝ →ₜ* PontryaginDual (Multiplicative ℝ),
      (∀ x y : ℝ, ι (Multiplicative.ofAdd y) (Multiplicative.ofAdd x) = ψ (x*y)) ∧
      Function.Bijective ι ∧ IsOpenMap ι := by sorry

/-- Real archimedean square, with sections in the native Schwartz space. -/
theorem PartialFourierTransform.square {X : Type*} (Φ : X → SchwartzMap ℝ ℂ)
    (x : X) (w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p => PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
        (fun p => Φ p.1 p.2) p.1 p.2) x w = Φ x (-w) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.pure_tensor
example (f : ℝ → ℂ) (x w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p => f p.1*Complex.exp (-Real.pi*(p.2 : ℂ)^2)) x w =
    f x*Complex.exp (-Real.pi*(w : ℂ)^2) := by sorry
/-- Fubini interface for commuting two selected factors. -/
theorem PartialFourierTransform.commute (Φ : ℝ × ℝ → ℂ)
    (h : Integrable Φ (volume.prod volume)) (a b : ℝ) :
    (∫ v : ℝ, ∫ w : ℝ, Φ (v,w)*Complex.exp (2*Real.pi*Complex.I*(v*a+w*b))) =
      ∫ w : ℝ, ∫ v : ℝ, Φ (v,w)*Complex.exp (2*Real.pi*Complex.I*(v*a+w*b)) := by sorry

/-- The explicit archimedean Gaussian test, in the source's positive kernel. -/
theorem ArchimedeanFourierComparison (w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p : Unit × ℝ => Complex.exp (-Real.pi*(p.2 : ℂ)^2)) () w =
    Complex.exp (-Real.pi*(w : ℂ)^2) := by sorry

/-- Gross–Zagier's Laplace–Mellin integral, with the same K convention. -/
theorem BesselLaplaceMellin (m t : ℝ) (s : ℂ) (hm : 0 < m) (ht : 0 < t)
    (hs : t < s.re) :
    (∫ y : ℝ in Set.Ioi 0, (y : ℂ)^(s-1/2)*BesselK (t+1/2) (2*Real.pi*m*y)*
      Complex.exp (-2*Real.pi*m*y)) =
    (Real.sqrt Real.pi : ℂ)*Complex.Gamma (s+t+1)*Complex.Gamma (s-t)/
      (Complex.Gamma (s+1)*(4*Real.pi*m : ℂ)^(s+1/2)) := by sorry

/-- Fractional-ideal volume specialization: the inverse different shifts the dual. -/
theorem SelfDualHaar.dual_volume (q : ℝ) (hq : 0 < q) (m d : ℤ) :
    q^(-(m : ℝ)-(d : ℝ)/2)*q^((m : ℝ)+(d : ℝ)-(d : ℝ)/2) = 1 := by sorry

/-- Gaussian periodisation converges uniformly on each compact set of real translations.
This estimate supplies the real slice of the vector-space Poisson comparison;
the scalar adelic Poisson identity is consumed from ArithmeticGaloisRepresentations §2.7. -/
theorem gaussian_periodization_compact (K : Set ℝ) (hK : IsCompact K) :
    TendstoUniformlyOn
      (fun E : Finset ℤ => fun x : ℝ =>
        ∑ n ∈ E, Real.exp (-Real.pi * (x + (n : ℝ)) ^ 2))
      (fun x : ℝ => ∑' n : ℤ, Real.exp (-Real.pi * (x + (n : ℝ)) ^ 2))
      Filter.atTop K := by sorry

/-- An omitted integer contributes one at its negative translate, preventing uniform
convergence of the fixed-subset Gaussian sums on all real translations. -/
theorem gaussian_periodization_not_uniform :
    ¬ TendstoUniformly
      (fun E : Finset ℤ => fun x : ℝ =>
        ∑ n ∈ E, Real.exp (-Real.pi * (x + (n : ℝ)) ^ 2))
      (fun x : ℝ => ∑' n : ℤ, Real.exp (-Real.pi * (x + (n : ℝ)) ^ 2))
      Filter.atTop := by sorry

/-- Gaussian periodisation is jointly uniform on compact translations and positive
scales bounded away from zero. -/
theorem gaussian_periodization_compact_scaled (K : Set ℝ) (hK : IsCompact K)
    (r R : ℝ) (hr : 0 < r) (hrR : r ≤ R) :
    TendstoUniformlyOn
      (fun E : Finset ℤ => fun p : ℝ × ℝ =>
        ∑ n ∈ E, Real.exp (-Real.pi * (p.1 * (p.2 + (n : ℝ))) ^ 2))
      (fun p : ℝ × ℝ =>
        ∑' n : ℤ, Real.exp (-Real.pi * (p.1 * (p.2 + (n : ℝ))) ^ 2))
      Filter.atTop (Set.Icc r R ×ˢ K) := by sorry

end TauCeti.AutomorphicLFunctions.AL0

/-! ## Layer AL.1: Tate distributions and archimedean factors -/

namespace TauCeti.TateZeta.SuggestedTest

open Complex Real

/-- `AL.1/unramified-local-theory`: the unramified factor. `z(s, ω; 1_O) = Σ_{n ≥ 0} (t q^{-s})^n`
sums to `L(s, ω) = (1 - t q^{-s})⁻¹` when `‖t q^{-s}‖ < 1`. -/
example (ξ : ℂ) (h : ‖ξ‖ < 1) : ∑' n : ℕ, ξ ^ n = (1 - ξ)⁻¹ :=
  tsum_geometric_of_norm_lt_one h

/-- `AL.1/invariant-distributions-exceptional-case` (3.14): `x ↦ [[1, -ord x], [0, 1]]` is a
representation of the value group, in the basis `(δ₀, λ₀)`. -/
example (a b : ℤ) :
    !![(1 : ℤ), -(a + b); 0, 1] = !![(1 : ℤ), -a; 0, 1] * !![(1 : ℤ), -b; 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `AL.1/archimedean-local-theory` (3.21): Kudla's complex factor `(2π)^{1-s}Γ(s)` is `π · Γ_ℂ(s)`
for Deligne's `Γ_ℂ(s) = 2(2π)^{-s}Γ(s)`. -/
example (s : ℂ) : (2 * π : ℂ) ^ (1 - s) * Gamma s = π * Gammaℂ s := by
  have h2 : (2 * π : ℂ) ≠ 0 := by
    have : (π : ℂ) ≠ 0 := ofReal_ne_zero.mpr Real.pi_ne_zero
    exact mul_ne_zero two_ne_zero this
  rw [Gammaℂ_def, cpow_sub _ _ h2, cpow_one, cpow_neg]
  field_simp

/-- `AL.1/local-epsilon-gamma-factors`: Tate's real `ρ(|·|^s) = Γ_ℝ(s)/Γ_ℝ(1-s) = Γ_ℂ(s) cos(πs/2)`,
the reciprocal of `γ(s, 1, e)`. -/
example (s : ℂ) (hs : ∀ n : ℕ, s ≠ -(2 * n + 1)) :
    Gammaℝ s / Gammaℝ (1 - s) = Gammaℂ s * cos (π * s / 2) :=
  Gammaℝ_div_Gammaℝ_one_sub hs

/-- Jacobi’s theta relation checks the scalar Poisson identity consumed from
ArithmeticGaloisRepresentations §2.7 at `k = ℚ`, `f = 1_Ẑ ⊗ e^{-πx²}`. -/
example (a : ℝ) (ha : 0 < a) :
    ∑' n : ℤ, Real.exp (-Real.pi * a * (n : ℝ) ^ 2) =
      1 / a ^ (1 / 2 : ℝ) * ∑' n : ℤ, Real.exp (-Real.pi / a * (n : ℝ) ^ 2) :=
  Real.tsum_exp_neg_mul_int_sq ha

/-- The scalar Tate equation consumed from ArithmeticGaloisRepresentations §2.7,
for `k = ℚ`, `κ = 1`, `f(0) = f̂(0) = 1`, provides the bracket
`κ f̂(0)/(s - 1) - κ f(0)/s` and the functional equation `ζ(f, c) = ζ(f̂, ĉ)`. -/
example (s : ℂ) :
    completedRiemannZeta s = completedRiemannZeta₀ s - 1 / s - 1 / (1 - s) ∧
      completedRiemannZeta (1 - s) = completedRiemannZeta s :=
  ⟨completedRiemannZeta_eq s, completedRiemannZeta_one_sub s⟩

/-- `AL.1/idele-class-volume` for `k = ℚ`: `r₁ = 1`, `r₂ = 0`, `h = R = 1`, `w = 2`, `|d| = 1`
give `κ = 2^{r₁}(2π)^{r₂}hR/(w√|d|) = 1`. -/
example : (2 : ℝ) ^ 1 * (2 * Real.pi) ^ 0 * 1 * 1 / (2 * Real.sqrt 1) = 1 := by
  norm_num

/-- `AL.1/local-gauss-sum`, `c = 1`, `ν = 0` over `ℚ_p`: `𝔤 = p^{-1/2} g` and `|g|² = p` give
`|𝔤|² = 1`. -/
example (p : ℝ) (hp : 0 < p) (g : ℝ) (hg : g ^ 2 = p) : (p ^ (-(1 / 2 : ℝ)) * g) ^ 2 = 1 := by
  rw [mul_pow, hg, ← Real.rpow_natCast, ← Real.rpow_mul hp.le]
  norm_num
  rw [Real.rpow_neg_one]
  field_simp

/-- `AL.1/hecke-l-functional-equation`, Kudla's exercise for `ℚ(√5)`: `ε ≡ 3 (mod √5)` in
`O/(√5) ≅ 𝔽₅`, `3` has order 4, and `-ε² ≡ 1`. -/
example : (3 : ZMod 5) ^ 4 = 1 ∧ (3 : ZMod 5) ^ 2 ≠ 1 ∧ -(3 : ZMod 5) ^ 2 = 1 := by decide

end TauCeti.TateZeta.SuggestedTest

namespace TauCeti.TateZeta

/-- Norm-positive formulas on the native measurable multiplicative carrier. -/
def zetaIntegral {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω : G → ℂ) (s : ℂ) (f : G → ℂ) : ℂ :=
  ∫ x, f x * ω x * (a x : ℂ)^s ∂μ

theorem zetaIntegral_measure_scale {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω f : G → ℂ) (s : ℂ) (c : ℝ≥0) :
    zetaIntegral ((c : ℝ≥0∞) • μ) a ω s f =
      (c : ℂ) * zetaIntegral μ a ω s f := by sorry

-- TauCeti.TateZeta.zetaIntegral_normalized_measure_scale
example {G : Type*} [MeasurableSpace G] (μ : Measure G)
    (a : G → ℝ) (ω f : G → ℂ) (s L : ℂ) :
    zetaIntegral ((2 : ℝ≥0∞) • μ) a ω s f / L =
      2 * (zetaIntegral μ a ω s f / L) := by sorry

theorem zetaIntegral_twist {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ha : ∀ x, 0 < a x)
    (ω f : G → ℂ) (s t : ℂ) :
    zetaIntegral μ a (fun x => ω x*(a x : ℂ)^t) s f =
      zetaIntegral μ a ω (s+t) f := by sorry

/-- Gamma equals epsilon times the quotient of dual and original local L-factors.
At finite places the full local API identifies epsilon with the canonical supplied
Tate local constant at the norm-twisted character and its self-dual measure. -/
def gammaFactor (ε L Ldual : ℂ → ℂ) (s : ℂ) : ℂ := ε s * Ldual (1-s)/L s

example (ε L Ldual : ℂ → ℂ) (s : ℂ) (hL : L s = 1) (hLdual : Ldual (1-s) = 1) :
    gammaFactor ε L Ldual s = ε s := by sorry

example : gammaFactor (fun _ => 2) (fun _ => 3) (fun _ => 5) 0 = 10/3 := by sorry

/- `TateZeta.epsilonFactor_eq_tateLocalConstant` identifies the scalar in the
normalized-distribution equation with tateLocalConstant(ω |·|^s, ψ, dx_ψ)
for every finite completion, continuous quasi-character, nontrivial continuous
additive character and s. It uses the positive Fourier kernel and retains ν and c.
The following scalar checks specialize its common formula to ν=1 and c=1. -/

/-- Both conductor contributions give exponent 1-2s when ν=c=1. -/
example (a g s : ℂ) :
    a ^ (1 + 1) * (3 : ℂ) ^ ((1/2 - s) * (1 + 1)) * g =
      a ^ 2 * (3 : ℂ) ^ (1 - 2*s) * g := by sorry

/-- The negative additive character on the quadratic residue character at 3 has
normalized Gauss sum -i; after ψ(x) is replaced by ψ(3x), ν=c=1 gives -3i at s=0. -/
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    gaussSum χ (ZMod.stdAddChar.mulShift (-1)) / (Real.sqrt 3 : ℂ) = -Complex.I ∧
      (3 : ℂ) ^ (((1/2 : ℂ) - 0) * (1 + 1)) * (-Complex.I) =
        -3 * Complex.I := by sorry

/-- Omitting the additive conductor changes the ramified value at s=0. -/
example : (-3 * Complex.I : ℂ) ≠ -(Real.sqrt 3 : ℂ) * Complex.I := by sorry

/-- The normalized Gauss integral used by ArithmeticGaloisRepresentations §2.7,
with its finite-place additive Haar normalization and conductor inputs explicit. -/
def localGaussSum {F : Type*} [Field F] [MeasurableSpace F]
    (μ : Measure F) (U : Set F) (q : ℝ) (ν : ℤ) (c : ℕ)
    (ϖ : Fˣ) (ω : F → ℂ) (ψ : AddChar F Circle) : ℂ :=
  (q : ℂ)^(((ν : ℂ)+(c : ℂ))/2) *
    ∫ y in U, (ω y)⁻¹ * (ψ (((ϖ : F)^(-ν-(c : ℤ)))*y) : ℂ) ∂μ

-- TauCeti.TateZeta.globalZetaIntegral_zero
example {G : Type*} [MeasurableSpace G] (μ : Measure G)
    (a : G → ℝ) (ω : G → ℂ) (s : ℂ) :
    zetaIntegral μ a ω s (fun _ => 0) = 0 := by sorry

example {F : Type*} [Field F] [MeasurableSpace F]
    (μ : Measure F) (q : ℝ) (ν : ℤ) (c : ℕ) (ϖ : Fˣ)
    (ω : F → ℂ) (ψ : AddChar F Circle) :
    localGaussSum μ ∅ q ν c ϖ ω ψ = 0 := by sorry

example : localGaussSum Measure.count ({1} : Set (ZMod 2)) 2 0 1
    (1 : (ZMod 2)ˣ) (fun _ => 1) (ZMod.toCircle (N := 2)) =
    -(Real.sqrt 2 : ℂ) := by sorry

/-- Product notation for the supplied unbalanced all-place factors on their convergence domain.
ArithmeticGaloisRepresentations §2.7 supplies scalar continuation for general quasi-characters;
the algebraic norm-twist normalization is compared with LFunctions layers 0, 5–6. -/
def completedHeckeL {ι : Type*} (L : ι → ℂ → ℂ) (s : ℂ) : ℂ := ∏' v, L v s

/-- The product after removing the specified places, on its convergence domain. -/
def partialHeckeL {ι : Type*} (S : Set ι) (L : ι → ℂ → ℂ) (s : ℂ) : ℂ :=
  ∏' v : {v // v ∉ S}, L v.1 s

/-- Conductor balancing identifies the unbalanced local-factor product with the
supplied primitive LFunctions completion; the conductor A is positive in applications. -/
def balancedHeckeL (A : ℝ) (L : ℂ → ℂ) (s : ℂ) : ℂ :=
  (A : ℂ) ^ (s / 2) * L s

/-- Balancing transports the conductor-power epsilon equation to its constant-root-number
form at a point where the unbalanced equation holds. -/
theorem balancedHeckeL_functionalEquation (A : ℝ) (hA : 0 < A)
    (L Ldual : ℂ → ℂ) (W s : ℂ)
    (h : L s = W * (A : ℂ) ^ (1/2 - s) * Ldual (1 - s)) :
    balancedHeckeL A L s = W * balancedHeckeL A Ldual (1 - s) := by sorry

/-- Conductor one introduces no balancing factor. -/
example (L : ℂ → ℂ) (s : ℂ) : balancedHeckeL 1 L s = L s := by sorry

/-- The odd conductor-four completion includes 4^(s/2) in balanced normalization. -/
example (L : ℂ → ℂ) (s : ℂ) :
    balancedHeckeL 4 (fun u => Complex.Gammaℝ (u + 1) * L u) s =
      (4 : ℂ) ^ (s/2) * Complex.Gammaℝ (s + 1) * L s := by sorry

/-- A norm twist translates both the conductor exponent and the unbalanced function. -/
example (A : ℝ) (L : ℂ → ℂ) (s t : ℂ) :
    balancedHeckeL A L (s + t) = (A : ℂ) ^ ((s+t)/2) * L (s+t) := by sorry

/-- Epsilon of the real character sgn^a times a norm twist, for the positive Tate character. -/
def realStandardEpsilon (a : Fin 2) : ℂ := Complex.I^a.val

example : realStandardEpsilon 0 = 1 ∧ realStandardEpsilon 1 = Complex.I := by sorry

/-- The reducible real Weil constituent I₀ has the product epsilon of 1 and sgn. -/
example : realStandardEpsilon 0 * realStandardEpsilon 1 = Complex.I := by sorry

/-- Finite-product notation for the scalar epsilon factors supplied by
ArithmeticGaloisRepresentations §2.7 for general quasi-characters, identified at each finite
place with the distribution scalar by epsilonFactor_eq_tateLocalConstant. On algebraic norm twists
the canonical rank-one comparison identifies the root number and primitive conductor power. -/
def globalEpsilon {ι : Type*} (S : Finset ι) (ε : ι → ℂ → ℂ) (s : ℂ) : ℂ :=
  ∏ v ∈ S, ε v s

example : globalEpsilon (∅ : Finset (Fin 2)) (fun _ _ => 2) 0 = 1 := by sorry

example : globalEpsilon (Finset.univ : Finset (Fin 2))
    (fun i _ => if i = 0 then Complex.I else -Complex.I) 0 = 1 := by sorry

-- TauCeti.TateZeta.globalEpsilon_conductor_four
/-- The conductor-four quadratic character has negative-character Gauss sum -2i at 2. -/
example (χ : DirichletCharacter ℂ 4) (h₃ : χ 3 = -1) :
    gaussSum χ (ZMod.stdAddChar.mulShift (-1)) = -2*Complex.I ∧
    gaussSum χ (ZMod.stdAddChar.mulShift (-1))/2 = -Complex.I ∧
    globalEpsilon (Finset.univ : Finset (Fin 2))
      (fun v _ => if v = 0 then realStandardEpsilon 1 else
        gaussSum χ (ZMod.stdAddChar.mulShift (-1))/2) (1/2) = 1 := by sorry

/-- Two trivial real factors and the trace-different factor over ℚ(√5) give its epsilon power. -/
example (s : ℂ) : globalEpsilon (Finset.univ : Finset (Fin 3))
    (fun v t => if v = 2 then (5 : ℂ)^(1/2-t) else 1) s =
      (5 : ℂ)^(1/2-s) := by sorry

theorem norm_globalEpsilon_half {ι : Type*} (S : Finset ι) (ε : ι → ℂ → ℂ)
    (h : ∀ v ∈ S, ‖ε v (1/2)‖ = 1) : ‖globalEpsilon S ε (1/2)‖ = 1 := by sorry

def QuasiChar.IsUnramified {F : Type*} [Field F] [TopologicalSpace F]
    (ω : Fˣ →ₜ* ℂˣ) (U : Subgroup Fˣ) : Prop := ∀ u : U, ω u = 1

example {F : Type*} [Field F] [TopologicalSpace F] (U : Subgroup Fˣ) :
    QuasiChar.IsUnramified (1 : Fˣ →ₜ* ℂˣ) U := by sorry

example {F : Type*} [Field F] [TopologicalSpace F]
    (ω : Fˣ →ₜ* ℂˣ) (U : Subgroup Fˣ) (u : U) (h : ω u ≠ 1) :
    ¬ QuasiChar.IsUnramified ω U := by sorry

-- TauCeti.TateZeta.zetaIntegral_gaussian_real
example (s : ℂ) (hs : 0 < s.re) :
    zetaIntegral (volume.withDensity (fun x : ℝ => ENNReal.ofReal |x|⁻¹))
      abs (fun _ => 1) s (fun x => Complex.exp (-Real.pi*(x : ℂ)^2)) =
    Complex.Gammaℝ s := by sorry
-- TauCeti.TateZeta.zetaIntegral_gaussian_complex
example (s : ℂ) (hs : 0 < s.re) :
    zetaIntegral ((2 : ℝ≥0∞) • volume.withDensity
      (fun z : ℂ => ENNReal.ofReal (‖z‖^2)⁻¹))
      (fun z => ‖z‖^2) (fun _ => 1) s
      (fun z => Complex.exp (-2*Real.pi*(‖z‖ : ℂ)^2)) =
    Real.pi*Complex.Gammaℂ s := by sorry
-- TauCeti.TateZeta.zetaIntegral_not_convergent
example : ¬ Summable (fun _ : ℕ => (1 : ℂ)) := by sorry
-- TauCeti.TateZeta.zetaIntegral_unramified_standard
example (t s : ℂ) (q : ℝ) (h : ‖t*(q : ℂ)^(-s)‖ < 1) :
    ∑' n : ℕ, (t*(q : ℂ)^(-s))^n = (1-t*(q : ℂ)^(-s))⁻¹ := by sorry

/-- Translation covariance after the supplied group integral is instantiated.
    The invariance condition is on the actual multiplicative Haar measure. -/
theorem zetaIntegral_act {G : Type*} [Group G] [MeasurableSpace G] [MeasurableMul₂ G]
    (μ : Measure G) [μ.IsMulRightInvariant] (a : G →* ℝˣ) (ha : ∀ x, 0 < (a x : ℝ))
    (ω : G →* ℂˣ) (s : ℂ) (f : G → ℂ) (b : G) :
    zetaIntegral μ (fun x => a x) (fun x => ω x) s (fun x => f (x*b)) =
    ((ω b : ℂ)*(a b : ℂ)^s)⁻¹*zetaIntegral μ (fun x => a x) (fun x => ω x) s f := by sorry

/-- Product decomposition only where multipliability is established. -/
example : completedHeckeL (fun i : Fin 2 => fun _ => if i = 0 then 2 else 3) 0 = 6 ∧
    partialHeckeL ({0} : Set (Fin 2))
      (fun i => fun _ => if i = 0 then 2 else 3) 0 = 3 := by sorry

example : partialHeckeL (∅ : Set (Fin 2)) (fun _ _ => (2 : ℂ)) 0 = 4 := by sorry

theorem completedHeckeL_eq_mul {ι : Type*} [DecidableEq ι] (S : Finset ι)
    (L : ι → ℂ → ℂ) (s : ℂ) (h : Multipliable (fun v => L v s)) :
    completedHeckeL L s = (∏ v ∈ S, L v s)*partialHeckeL (S : Set ι) L s := by sorry

/-- Removing the prime 2 from the convergent Riemann Euler product multiplies by its denominator. -/
example (s : ℂ) (hs : 1 < s.re) :
    partialHeckeL {p : Nat.Primes | (p : ℕ) = 2}
      (fun p t => (1-(p : ℂ)^(-t))⁻¹) s =
        (1-(2 : ℂ)^(-s))*riemannZeta s := by sorry

/-- Removing distinct primes uses each local denominator once. -/
example (s : ℂ) (hs : 1 < s.re) :
    partialHeckeL {p : Nat.Primes | (p : ℕ) = 2 ∨ (p : ℕ) = 3}
      (fun p t => (1-(p : ℂ)^(-t))⁻¹) s =
        (1-(2 : ℂ)^(-s))*(1-(3 : ℂ)^(-s))*riemannZeta s := by sorry

/-- Conductor balancing converts the unbalanced reflected power to the balanced one. -/
example (Q : ℝ) (hQ : 0 < Q) (s : ℂ) :
    (Q : ℂ)^(s/2)*(Q : ℂ)^(1/2-s) = (Q : ℂ)^((1-s)/2) := by sorry

-- TauCeti.TateZeta.completedHeckeL_not_product_over_ideals
example : Complex.Gammaℝ (2 : ℂ) ≠ 1 := by sorry
-- TauCeti.TateZeta.gammaFactor_real_trivial
example (s : ℂ) (hs : ∀ n : ℕ, s ≠ -(2*n+1)) :
    Complex.Gammaℝ s/Complex.Gammaℝ (1-s) =
      Complex.Gammaℂ s*Complex.cos (Real.pi*s/2) := by sorry

/-- Scalar-product character cancellation; the arithmetic global character
    supplies product one, not independent choices at the places. -/
theorem globalEpsilon_indep {ι : Type*} (S : Finset ι) (ε c : ι → ℂ)
    (hc : ∏ v ∈ S, c v = 1) : (∏ v ∈ S, c v*ε v) = ∏ v ∈ S, ε v := by sorry

end TauCeti.TateZeta

namespace TauCeti.AutomorphicLFunctions.AL1

/-- The three gamma branches use finite numeric data over existing sum and product carriers. -/
abbrev GammaBranch := (Fin 2 × ℂ) ⊕ ((ℤ × ℂ) ⊕ ({k : ℕ // 2 ≤ k} × ℂ))

def gammaBranch (b : GammaBranch) (s : ℂ) : ℂ := match b with
  | .inl (a, t) => Complex.Gammaℝ (s+t+(a.val : ℂ))
  | .inr (.inl (κ, t)) => Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2)
  | .inr (.inr (k, t)) => Complex.Gammaℂ (s+t+((k.val : ℂ)-1)/2)

def CanonicalArchimedeanFactor (bs : List GammaBranch) (s : ℂ) : ℂ :=
  (bs.map (fun b => gammaBranch b s)).prod

theorem CanonicalArchimedeanFactor.real (a : Fin 2) (t s : ℂ) :
    CanonicalArchimedeanFactor [.inl (a, t)] s = Complex.Gammaℝ (s+t+(a.val : ℂ)) := by sorry

theorem CanonicalArchimedeanFactor.complex (κ : ℤ) (t s : ℂ) :
    CanonicalArchimedeanFactor [.inr (.inl (κ, t))] s =
      Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2) := by sorry

theorem CanonicalArchimedeanFactor.discrete_series (k : {k : ℕ // 2 ≤ k}) (t s : ℂ) :
    CanonicalArchimedeanFactor [.inr (.inr (k, t))] s =
      Complex.Gammaℂ (s+t+((k.val : ℂ)-1)/2) := by sorry

theorem CanonicalArchimedeanFactor.direct_sum (bs cs : List GammaBranch) (s : ℂ) :
    CanonicalArchimedeanFactor (bs++cs) s =
      CanonicalArchimedeanFactor bs s * CanonicalArchimedeanFactor cs s := by sorry

-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.real_trivial
example (s : ℂ) : CanonicalArchimedeanFactor [.inl (0, 0)] s = Complex.Gammaℝ s := by sorry
-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.complex_negative_weight
example (s : ℂ) : CanonicalArchimedeanFactor [.inr (.inl (-3, 0))] s =
    Complex.Gammaℂ (s+3/2) ∧ CanonicalArchimedeanFactor [.inr (.inl (-3, 0))] s =
      CanonicalArchimedeanFactor [.inr (.inl (3, 0))] s := by sorry
-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.weight_two
example (s : ℂ) : CanonicalArchimedeanFactor [.inr (.inr (⟨2, by decide⟩, 0))] s =
    Complex.Gammaℂ (s+1/2) := by sorry
end TauCeti.AutomorphicLFunctions.AL1

/-! ## Layer AL.2: standard functions and paired products -/

namespace TauCeti.AutomorphicLFunctions.AL2

/-- Formula on GLₙ supplied as a measurable carrier G, with its matrix inclusion
    and normalized determinant absolute value. The integrand is supplied as a function. -/
def GodementJacquetIntegral {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ) (s : ℂ) : ℂ :=
  ∫ g, β g * Φ g * (absDet g : ℂ)^(s+((n : ℂ)-1)/2) ∂μ

theorem GodementJacquetIntegral.twist {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ)
    (h : ∀ g, 0 < absDet g) (s t : ℂ) :
    GodementJacquetIntegral n μ (fun g => β g*(absDet g : ℂ)^t) Φ absDet s =
      GodementJacquetIntegral n μ β Φ absDet (s+t) := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.rank_one
example {G : Type*} [MeasurableSpace G] (μ : Measure G) (β Φ : G → ℂ)
    (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral 1 μ β Φ absDet s =
      TauCeti.TateZeta.zetaIntegral μ absDet β s Φ := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.rank_two_shift
example {G : Type*} [MeasurableSpace G] (μ : Measure G) (β Φ : G → ℂ)
    (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral 2 μ β Φ absDet s =
      ∫ g, β g * Φ g * (absDet g : ℂ)^(s+1/2) ∂μ := by sorry
/-- Evaluation once the finite-place principal-ideal theorem supplies P, P(0)=1.
    The archimedean branch uses CanonicalArchimedeanFactor. -/
def StandardLocalLFactor (P : Polynomial ℂ) (q : ℝ) (s : ℂ) : ℂ :=
  (P.eval ((q : ℂ)^(-s)))⁻¹

theorem StandardLocalLFactor.unramified {ι : Type*} [Fintype ι]
    (α : ι → ℂ) (q : ℝ) (s : ℂ) :
    StandardLocalLFactor (∏ i, (1-Polynomial.C (α i)*Polynomial.X)) q s =
      ∏ i, (1-α i*(q : ℂ)^(-s))⁻¹ := by sorry

theorem StandardLocalLFactor.twist (P : Polynomial ℂ) (q : ℝ) (hq : 0 < q)
    (s t : ℂ) : StandardLocalLFactor
      (P.comp (Polynomial.C ((q : ℂ)^(-t))*Polynomial.X)) q s =
    StandardLocalLFactor P q (s+t) := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.trivial_gl1
example (q : ℝ) (s : ℂ) : StandardLocalLFactor (1-Polynomial.X) q s =
    (1-(q : ℂ)^(-s))⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.ramified_gl1
example (q : ℝ) (s : ℂ) : StandardLocalLFactor 1 q s = 1 := by sorry
/-- The native Dirichlet series with the two unitary Maass gamma factors.
On AutomorphicFormsOnReductiveGroups §4.5's `NormalizedMaassEigenform(|r|,δ)`,
`a` is its supplied `fourierCoefficient` and `ε = δ` gives reflection sign `(-1)^δ`.
This scalar formula applies to arbitrary coefficients and real parameters. -/
def maassCompletion (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) : ℂ :=
  Complex.Gammaℝ (s+(ε.val : ℂ)+Complex.I*r)*
    Complex.Gammaℝ (s+(ε.val : ℂ)-Complex.I*r)*LSeries a s

theorem MaassStandardLFunction.duke (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) :
    (Real.pi : ℂ)^(-s)*Complex.Gamma ((s+(ε.val : ℂ)+Complex.I*r)/2)*
      Complex.Gamma ((s+(ε.val : ℂ)-Complex.I*r)/2)*LSeries a s =
    (Real.pi : ℂ)^ε.val * maassCompletion a ε r s := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.odd_completion
example (a : ℕ → ℂ) (r : ℝ) (s : ℂ) :
    (Real.pi : ℂ)^(-s)*Complex.Gamma ((s+1+Complex.I*r)/2)*
      Complex.Gamma ((s+1-Complex.I*r)/2)*LSeries a s =
    Real.pi * maassCompletion a 1 r s := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.prime_square
example (A : ℂ) : PowerSeries.coeff 2
    ((1-PowerSeries.C A*PowerSeries.X+PowerSeries.X^2 : PowerSeries ℂ)⁻¹) = A^2-1 := by sorry

/-- The level-one Maass adjoint gamma completion of a supplied finite continuation. -/
def maassAdjointCompletion (finite : ℂ → ℂ) (r : ℝ) (s : ℂ) : ℂ :=
  Complex.Gammaℝ s * Complex.Gammaℝ (s+2*Complex.I*r) *
    Complex.Gammaℝ (s-2*Complex.I*r) * finite s

/-- The completed adjoint value at one includes the hyperbolic-cosine gamma factor. -/
theorem MaassAdjointLFunction.at_one (finite : ℂ → ℂ) (r : ℝ) :
    maassAdjointCompletion finite r 1 = finite 1 / (Real.cosh (Real.pi*r) : ℂ) := by sorry

/-- The self-pair of determinant-one Satake roots has one extra zeta denominator. -/
example (α : ℂ) (hα : α ≠ 0) (q : ℝ) (s : ℂ) :
    StandardLocalLFactor
      ((1-Polynomial.X)^2 * (1-Polynomial.C (α^2)*Polynomial.X) *
        (1-Polynomial.C (α⁻¹^2)*Polynomial.X)) q s =
      (1-(q : ℂ)^(-s))⁻¹ * StandardLocalLFactor
        ((1-Polynomial.X) * (1-Polynomial.C (α^2)*Polynomial.X) *
          (1-Polynomial.C (α⁻¹^2)*Polynomial.X)) q s := by sorry

/-- Entire centered growth in the equivalent epsilon-bound form of the OrderLE predicate
supplied by ZerosOfLFunctions layer 0. -/
def IsCenteredOrderOne (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧ ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧
    ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * (1 + ‖z‖ ^ (1 + ε)))

/-- The centered bound agrees with entirety and the asymptotic OrderLE condition of
ZerosOfLFunctions layer 0; its generic Hadamard theorem uses precisely this condition. -/
theorem IsCenteredOrderOne_iff_orderLE (f : ℂ → ℂ) :
    IsCenteredOrderOne f ↔ Differentiable ℂ f ∧
      ∀ A' : ℝ, 1 < A' → Asymptotics.IsBigO (Bornology.cobounded ℂ)
        f (fun z : ℂ => Real.exp (‖z‖ ^ A')) := by sorry

-- Tests distinguish order one from mere entire analyticity.
example : IsCenteredOrderOne (fun _ : ℂ => (1 : ℂ)) := by sorry
example : IsCenteredOrderOne (fun z : ℂ => 1 + z ^ 2) := by sorry
example : IsCenteredOrderOne Complex.exp ∧
    ¬ IsCenteredOrderOne (fun z : ℂ => Complex.exp (z ^ 2)) := by sorry

/-- Paired-zero specialization of ZerosOfLFunctions layer 5.6 after removing the central
zero. Parity removes the linear exponential and eventual positivity fixes the constant.
Zero entries in gamma encode unused indices when the zero multiset is finite. -/
theorem PairedHadamardFactorization (f : ℂ → ℂ) (δ : ℂ)
    (hf : IsCenteredOrderOne f) (hδ : δ = 1 ∨ δ = -1)
    (hparity : ∀ z, f (-z) = δ * f z)
    (hzeros : ∀ z, f z = 0 → z.re = 0)
    (hpositive : ∃ R : ℝ, ∀ x : ℝ, R ≤ x → (f (x : ℂ)).im = 0 ∧ 0 < (f (x : ℂ)).re) :
    ∃ (m : ℕ) (c : ℝ) (γ : ℕ → ℝ), 0 < c ∧
      (∀ n, 0 ≤ γ n) ∧ Summable (fun n => (γ n)⁻¹ ^ 2) ∧
      δ = (-1 : ℂ) ^ m ∧
      (∀ z : ℂ, Multipliable (fun n =>
        if γ n = 0 then (1 : ℂ) else 1 + z ^ 2 / (γ n : ℂ) ^ 2)) ∧
      (∀ z : ℂ, f z = (c : ℂ) * z ^ m * ∏' n,
        if γ n = 0 then (1 : ℂ) else 1 + z ^ 2 / (γ n : ℂ) ^ 2) ∧
      (∀ K : Set ℂ, IsCompact K → TendstoUniformlyOn
        (fun s : Finset ℕ => fun z : ℂ => (c : ℂ) * z ^ m *
          ∏ n ∈ s, if γ n = 0 then (1 : ℂ) else 1 + z ^ 2 / (γ n : ℂ) ^ 2)
        f Filter.atTop K) := by sorry

/-- The paired product gives real nonnegative derivatives on the nonnegative real axis. -/
theorem PairedHadamard_derivatives_nonnegative (f : ℂ → ℂ) (δ : ℂ)
    (hf : IsCenteredOrderOne f) (hδ : δ = 1 ∨ δ = -1)
    (hparity : ∀ z, f (-z) = δ * f z)
    (hzeros : ∀ z, f z = 0 → z.re = 0)
    (hpositive : ∃ R : ℝ, ∀ x : ℝ, R ≤ x → (f (x : ℂ)).im = 0 ∧ 0 < (f (x : ℂ)).re)
    (k : ℕ) (x : ℝ) (hx : 0 ≤ x) :
    (iteratedDeriv k f (x : ℂ)).im = 0 ∧ 0 ≤ (iteratedDeriv k f (x : ℂ)).re := by sorry

/-- A nonpolynomial paired product gives strictly positive derivatives at positive real points. -/
theorem PairedHadamard_derivatives_positive (f : ℂ → ℂ) (δ : ℂ)
    (hf : IsCenteredOrderOne f) (hδ : δ = 1 ∨ δ = -1)
    (hparity : ∀ z, f (-z) = δ * f z)
    (hzeros : ∀ z, f z = 0 → z.re = 0)
    (hpositive : ∃ R : ℝ, ∀ x : ℝ, R ≤ x → (f (x : ℂ)).im = 0 ∧ 0 < (f (x : ℂ)).re)
    (hnonpoly : ¬ ∃ P : Polynomial ℂ, ∀ z, f z = P.eval z)
    (k : ℕ) (x : ℝ) (hx : 0 < x) :
    0 < (iteratedDeriv k f (x : ℂ)).re := by sorry

example : iteratedDeriv 3 (fun z : ℂ => 1 + z ^ 2) 1 = 0 := by sorry
example (k : ℕ) (x : ℝ) (hx : 0 < x) :
    0 < (iteratedDeriv k Complex.sinh (x : ℂ)).re := by sorry
example : (1 - Complex.I ^ 2 : ℂ) ≠ 0 ∧ (1 - (1 : ℂ) ^ 2 : ℂ) = 0 := by sorry

theorem GodementJacquetIntegral.bilinear {G : Type*} [MeasurableSpace G]
    (n : ℕ) (μ : Measure G) (β₁ β₂ Φ : G → ℂ) (a : G → ℝ) (s : ℂ)
    (h₁ : Integrable (fun g => β₁ g*Φ g*(a g : ℂ)^(s+((n : ℂ)-1)/2)) μ)
    (h₂ : Integrable (fun g => β₂ g*Φ g*(a g : ℂ)^(s+((n : ℂ)-1)/2)) μ) :
    GodementJacquetIntegral n μ (β₁+β₂) Φ a s =
      GodementJacquetIntegral n μ β₁ Φ a s+GodementJacquetIntegral n μ β₂ Φ a s := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.first_coefficient
example (a : ℕ → ℂ) (ha : a 1 = 1) (s : ℂ) : LSeries.term a s 1 = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.eisenstein_excluded
example : meromorphicOrderAt completedRiemannZeta 1 = -1 := by sorry

/-- The reciprocal Hecke polynomial with the unitary determinant normalization. -/
theorem MaassStandardLFunction.euler (A : ℂ) (q : ℝ) (hq : 0 < q) (s : ℂ) :
    StandardLocalLFactor (1-Polynomial.C A*Polynomial.X+Polynomial.X^2) q s =
      (1-A*(q : ℂ)^(-s)+(q : ℂ)^(-2*s))⁻¹ := by sorry

end TauCeti.AutomorphicLFunctions.AL2

/-! ## Layer AL.3: Rankin–Selberg formulas and rational factors -/

namespace TauCeti.AutomorphicLFunctions.AL3

/-- A nontrivial cubic degree character distinguishes geometric from arithmetic
Frobenius through its local polynomial at a degree-one place. -/
theorem UnramifiedRankOneReciprocity.constant_field_inversion (ζ : ℂ)
    (hζ : ζ ^ 3 = 1) (hne : ζ ≠ 1) :
    (1 - Polynomial.C ζ * Polynomial.X : Polynomial ℂ) ≠
      1 - Polynomial.C (ζ⁻¹) * Polynomial.X := by sorry

/-- Evaluate a linear functional along a representation orbit. -/
def whittakerFunction {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ) (v : V) (g : G) : ℂ := ℓ (ρ g v)

theorem WhittakerModel.equivariance {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (N : Submonoid G) (ψ : N →* ℂ) (h : ∀ u : N, ∀ v, ℓ (ρ u v) = ψ u*ℓ v)
    (u : N) (v : V) (g : G) :
    whittakerFunction ρ ℓ v (u*g) = ψ u*whittakerFunction ρ ℓ v g := by sorry

theorem WhittakerModel.right_action {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (v : V) (g h : G) : whittakerFunction ρ ℓ (ρ h v) g =
      whittakerFunction ρ ℓ v (g*h) := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.generic_nonzero
example {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ) (h : ℓ ≠ 0) :
    ∃ v, whittakerFunction ρ ℓ v ≠ 0 := by sorry

/-- Unequal-rank formula on the supplied quotient and matrix-space carriers;
    Wblock is W evaluated on the displayed block embedding. -/
def RsLocalIntegrals {Q M : Type*} [MeasurableSpace Q] [MeasurableSpace M]
    (n m : ℕ) (μ : Measure Q) (ν : Measure M) (Wblock : Q → M → ℂ)
    (W' : Q → ℂ) (absDet : Q → ℝ) (s : ℂ) : ℂ :=
  ∫ g, (∫ x, Wblock g x ∂ν)*W' g*(absDet g : ℂ)^(s-((n : ℂ)-(m : ℂ))/2) ∂μ

/-- Equal ranks require a Schwartz factor and determinant exponent s. -/
def rsEqualRankIntegral {Q : Type*} [MeasurableSpace Q] (μ : Measure Q)
    (W W' Φ : Q → ℂ) (absDet : Q → ℝ) (s : ℂ) : ℂ :=
  ∫ g, W g*W' g*Φ g*(absDet g : ℂ)^s ∂μ

-- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.equal_rank_one
example {G : Type*} [MeasurableSpace G] (μ : Measure G) (χ χ' Φ : G → ℂ)
    (a : G → ℝ) (s : ℂ) : rsEqualRankIntegral μ χ χ' Φ a s =
      TauCeti.TateZeta.zetaIntegral μ a (fun g => χ g*χ' g) s Φ := by sorry

/-- A rank gap of three has three functional-equation partners. -/
example (m : ℕ) : {j : ℕ | j ≤ (m+3)-m-1} = {0, 1, 2} := by sorry

/-- The tensor local factor has pairwise products of the two Satake root families. -/
theorem RsLocalFactor.unramified {ι κ : Type*} [Fintype ι] [Fintype κ]
    (α : ι → ℂ) (β : κ → ℂ) (q : ℝ) (s : ℂ) :
    TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor (∏ i, ∏ j, (1-Polynomial.C (α i*β j)*Polynomial.X)) q s =
      ∏ i, ∏ j, (1-α i*β j*(q : ℂ)^(-s))⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.one_by_one
example (α β : ℂ) (q : ℝ) (s : ℂ) :
    TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor (1-Polynomial.C (α*β)*Polynomial.X) q s =
      (1-α*β*(q : ℂ)^(-s))⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.two_by_one
example (q : ℝ) (s : ℂ) :
    TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor ((1-Polynomial.C (2*5 : ℂ)*Polynomial.X)*
      (1-Polynomial.C (3*5 : ℂ)*Polynomial.X)) q s =
      (1-10*(q : ℂ)^(-s))⁻¹ * (1-15*(q : ℂ)^(-s))⁻¹ := by sorry

/-- Theta Mellin expression on the supplied idele-class measure. -/
def MirabolicEisensteinSeries {C : Type*} [MeasurableSpace C]
    (μ : Measure C) (n : ℕ) (absDet : ℝ) (a : C → ℝ)
    (θ₀ η : C → ℂ) (s : ℂ) : ℂ :=
  (absDet : ℂ)^s * ∫ x, θ₀ x*(a x : ℂ)^((n : ℂ)*s)*η x ∂μ

-- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.zero_schwartz
example {C : Type*} [MeasurableSpace C] (μ : Measure C) (n : ℕ)
    (absDet : ℝ) (a : C → ℝ) (η : C → ℂ) (s : ℂ) :
    MirabolicEisensteinSeries μ n absDet a (fun _ => 0) η s = 0 := by sorry

/-- Evaluate the proved entire continuation of the normalized quotient at zero.
    The quotient itself, not a totalized divergent integral, is supplied. -/
def NormalizedRsPeriod {V : Type*} [AddCommGroup V] [Module ℂ V]
    (quotient : ℂ → V →ₗ[ℂ] ℂ) : V →ₗ[ℂ] ℂ := quotient 0


/-- A positive-degree local Euler factor has constant coefficient one.
    Global coefficients depend only on places of degree ≤k. -/
def ffRsLocalFactor {ι κ : Type*} [Fintype ι] [Fintype κ]
    (α : ι → ℂ) (β : κ → ℂ) (d : ℕ) (_hd : 0 < d) : PowerSeries ℂ :=
  ∏ i, ∏ j, (1-PowerSeries.C (α i/(β j))*PowerSeries.X^d)⁻¹

/-- Positive degree makes every inverse local denominator have constant term one. -/
theorem ffRsLocalFactor.constantCoeff {ι κ : Type*} [Fintype ι] [Fintype κ]
    (α : ι → ℂ) (β : κ → ℂ) (d : ℕ) (hd : 0 < d) :
    PowerSeries.constantCoeff (ffRsLocalFactor α β d hd) = 1 := by sorry

-- Degree zero is excluded from ffRsLocalFactor.
example : PowerSeries.constantCoeff
    ((1-PowerSeries.C (2/3 : ℂ)*PowerSeries.X^0 : PowerSeries ℂ)⁻¹) = 3 := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.rank_one
example (d : ℕ) (hd : 0 < d) : ffRsLocalFactor (fun _ : Fin 1 => (2 : ℂ))
    (fun _ : Fin 1 => (3 : ℂ)) d hd =
      (1-PowerSeries.C (2/3 : ℂ)*PowerSeries.X^d)⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.degree_two
example : PowerSeries.coeff 1 (ffRsLocalFactor (fun _ : Fin 1 => (2 : ℂ))
    (fun _ : Fin 1 => (3 : ℂ)) 2 (by decide)) = 0 ∧
      PowerSeries.coeff 2 (ffRsLocalFactor (fun _ : Fin 1 => (2 : ℂ))
        (fun _ : Fin 1 => (3 : ℂ)) 2 (by decide)) = 2/3 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.self_pair
example (a : ℂ) (ha : a ≠ 0) (d : ℕ) (hd : 0 < d) : ffRsLocalFactor (fun _ : Fin 1 => a)
    (fun _ : Fin 1 => a) d hd = (1-PowerSeries.X^d : PowerSeries ℂ)⁻¹ := by sorry

/-- Polynomial root multiplicities in the open unit disc. -/
def OpenDiscZeroPoleIndex (P Q : Polynomial ℂ) : ℤ :=
  ((P.roots.filter (fun z => ‖z‖ < 1)).card : ℤ)-
    ((Q.roots.filter (fun z => ‖z‖ < 1)).card : ℤ)

/-- Native analytic divisor compared with finite polynomial multiplicities. -/
theorem OpenDiscZeroPoleIndex.divisor (P Q : Polynomial ℂ) (hP : P ≠ 0) (hQ : Q ≠ 0) :
    OpenDiscZeroPoleIndex P Q =
      ∑ z ∈ ((P.roots+Q.roots).toFinset.filter (fun z => ‖z‖ < 1)),
        MeromorphicOn.divisor (fun w => P.eval w / Q.eval w) Set.univ z := by sorry

theorem OpenDiscZeroPoleIndex.presentation (P Q P' Q' : Polynomial ℂ)
    (hP : P ≠ 0) (hQ : Q ≠ 0) (hP' : P' ≠ 0) (hQ' : Q' ≠ 0)
    (h : P*Q' = P'*Q) : OpenDiscZeroPoleIndex P Q = OpenDiscZeroPoleIndex P' Q' := by sorry

theorem OpenDiscZeroPoleIndex.mul (P Q P' Q' : Polynomial ℂ)
    (hP : P ≠ 0) (hQ : Q ≠ 0) (hP' : P' ≠ 0) (hQ' : Q' ≠ 0) :
    OpenDiscZeroPoleIndex (P*P') (Q*Q') =
      OpenDiscZeroPoleIndex P Q+OpenDiscZeroPoleIndex P' Q' := by sorry

theorem OpenDiscZeroPoleIndex.inv (P Q : Polynomial ℂ) :
    OpenDiscZeroPoleIndex Q P = -OpenDiscZeroPoleIndex P Q := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.coordinate
example : OpenDiscZeroPoleIndex Polynomial.X 1 = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.inverse_coordinate
example : OpenDiscZeroPoleIndex 1 Polynomial.X = -1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.boundary_excluded
example : OpenDiscZeroPoleIndex (Polynomial.X-1) 1 = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.cancelled_presentation
example : OpenDiscZeroPoleIndex Polynomial.X Polynomial.X = 0 := by sorry

/-- A nonzero functional on an irreducible representation gives an injective realization. -/
theorem WhittakerModel.realization {G V : Type*} [Group G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (hne : ℓ ≠ 0)
    (hirr : ∀ U : Submodule ℂ V, (∀ g v, v ∈ U → ρ g v ∈ U) → U = ⊥ ∨ U = ⊤) :
    Function.Injective (fun v => whittakerFunction ρ ℓ v) := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.rank_one
example (ρ : ℂˣ →* Module.End ℂ ℂ) (χ : ℂˣ →* ℂ)
    (hρ : ∀ g v, ρ g v = χ g*v) (g : ℂˣ) (c : ℂ) :
    whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c g =
      χ g * whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.opposite_character
example (ρ ρ' : Circle →* Module.End ℂ ℂ)
    (hρ : ∀ z v, ρ z v = (z : ℂ)*v)
    (hρ' : ∀ z v, ρ' z v = (z⁻¹ : Circle)*v) (z : Circle) (c d : ℂ) :
    whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c z *
      whittakerFunction ρ' (LinearMap.id : ℂ →ₗ[ℂ] ℂ) d z =
    whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c 1 *
      whittakerFunction ρ' (LinearMap.id : ℂ →ₗ[ℂ] ℂ) d 1 := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.two_by_one
example (μ : Measure ℝ) (W χ : ℝ → ℂ) (a : ℝ → ℝ) (s : ℂ) :
    RsLocalIntegrals 2 1 μ (Measure.dirac ()) (fun g _ => W g) χ a s =
      ∫ g, W g*χ g*(a g : ℂ)^(s-1/2) ∂μ := by sorry

theorem RsLocalIntegrals.twist {Q M : Type*} [MeasurableSpace Q] [MeasurableSpace M]
    (n m : ℕ) (μ : Measure Q) (ν : Measure M) (W : Q → M → ℂ)
    (W' : Q → ℂ) (a : Q → ℝ) (ha : ∀ g, 0 < a g) (s t : ℂ) :
    RsLocalIntegrals n m μ ν (fun g x => W g x*(a g : ℂ)^t) W' a s =
      RsLocalIntegrals n m μ ν W W' a (s+t) := by sorry

/-- Scalar-family specialization of quotient evaluation. The value is taken from an entire continued quotient. -/
example : NormalizedRsPeriod
    (fun s => (s+1) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) 2 = 2 := by sorry

/-- The quotient s/s continues to 1 at zero. -/
example : Differentiable ℂ (fun _ : ℂ => (1 : ℂ)) ∧
    (∀ s : ℂ, s ≠ 0 → (1 : ℂ) = s/s) ∧
    NormalizedRsPeriod (fun _ : ℂ => (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) 1 = 1 ∧
    (0 : ℂ)/(0 : ℂ) = 0 := by sorry

/-- Continuation evaluates the analytic quotient, including at a simultaneous zero. -/
theorem NormalizedRsPeriod.continued_value_scalar (N A L : ℂ → ℂ) (s₀ : ℂ)
    (hN : AnalyticAt ℂ N s₀) (hA : AnalyticAt ℂ A s₀) (hL : AnalyticAt ℂ L s₀)
    (h : A =ᶠ[𝓝[≠] s₀] fun s => L s * N s) :
    A s₀ = L s₀ * N s₀ := by sorry

/-- Positive local degree gives the determinant comparison after substituting X^d. -/
theorem FunctionFieldRsEulerProduct.local {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] (α : ι → ℂ) (β : κ → ℂ) (d : ℕ) (hd : 0 < d) :
    ffRsLocalFactor α β d hd =
      ((Matrix.diagonal (fun ij : ι × κ => α ij.1/β ij.2)).charpolyRev.eval₂
        PowerSeries.C (PowerSeries.X^d))⁻¹ := by sorry

/-- At positive local degree, inverse roots become conjugate roots after multiset transport. -/
theorem FunctionFieldRsEulerProduct.unitary_conjugate {ι κ : Type*}
    [Fintype ι] [Fintype κ] (α : ι → ℂ) (β : κ → ℂ) (d : ℕ) (hd : 0 < d)
    (σ : κ ≃ κ) (h : ∀ j, (β j)⁻¹ = star (β (σ j))) :
    ffRsLocalFactor α β d hd =
      ∏ i, ∏ j, (1-PowerSeries.C (α i*star (β j))*PowerSeries.X^d)⁻¹ := by sorry

-- A point-mass computation fixes the unequal-rank half shift.
example : RsLocalIntegrals 2 1 (Measure.dirac ()) (Measure.dirac ())
    (fun _ _ => 2) (fun _ => 3) (fun _ => 4) 1 = 12 := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.equal_rank_point_mass
example : rsEqualRankIntegral (Measure.dirac ()) (fun _ => 2) (fun _ => 3)
    (fun _ => 5) (fun _ => 2) 1 = 60 := by sorry

-- Equal rank vanishes with the Schwartz input.
example {Q : Type*} [MeasurableSpace Q] (μ : Measure Q)
    (W W' : Q → ℂ) (a : Q → ℝ) (s : ℂ) :
    rsEqualRankIntegral μ W W' (fun _ => 0) a s = 0 := by sorry

-- The theta-Mellin formula retains its rank in the norm exponent.
example : MirabolicEisensteinSeries (Measure.dirac ()) 2 3 (fun _ => 2)
    (fun _ => 5) (fun _ => 1) 1 = 60 := by sorry

/-- Specified nonzero infinity generators determine a unique comparison scalar
under the twisting isomorphism. The compatible choice has scalar one. -/
theorem RationalPeriodComparison.infinity_scalar
    {H Hξ : Type*} [AddCommGroup H] [Module ℂ H]
    [AddCommGroup Hξ] [Module ℂ Hξ] [FiniteDimensional ℂ Hξ]
    (hdim : Module.finrank ℂ Hξ = 1) (Tξ : H ≃ₗ[ℂ] Hξ)
    (w : H) (hw : w ≠ 0) (wξ : Hξ) (hwξ : wξ ≠ 0) :
    ∃! a : ℂˣ, wξ = (a : ℂ) • Tξ w := by sorry

/-- Rescaling only the twisted generator destroys transport compatibility. -/
example {H Hξ : Type*} [AddCommGroup H] [Module ℂ H]
    [AddCommGroup Hξ] [Module ℂ Hξ] (Tξ : H ≃ₗ[ℂ] Hξ)
    (w : H) (hw : w ≠ 0) (wξ : Hξ) (hcompat : wξ = Tξ w)
    (c : ℂˣ) (hc : c ≠ 1) : (c : ℂ) • wξ ≠ Tξ w := by sorry

/-- The rescaling by i cannot be absorbed into a rational period unit. -/
example : ¬ ∃ a : ℚ, (a : ℂ) = Complex.I := by sorry

/- The full RationalPeriodComparison.gauss_twist uses wξ = Tξ w and a compatible
family under twisting and coefficient conjugation, with the signature convention
of Raghuram §2.5.2.5. RationalPeriodComparison.gauss_twist_independent retains
the scalar a from infinity_scalar: [pξ] = [a] [G(ξ_f)]^(n(n-1)/2) [p].
ShtukaIntersectionComparison.middleExtension uses IC⁰=j_!*Q̄_ℓ[d][-d]. Its
localModel_pullback and pure contracts identify the specified fibre complexes;
essential_comp compares compact supports on the nested smooth opens with proper
intersection cohomology, with r-negligible kernels and cokernels under lower-rank
ramified induction. Its equivariant contract transports Hecke and partial Frobenius
through these comparisons. These geometric contracts are specified in README AL.3. -/

end TauCeti.AutomorphicLFunctions.AL3

/-! ## Layer AL.4: unramified determinant comparisons -/

namespace TauCeti.AutomorphicLFunctions.AL4

/-- Changing the matrix representative by an invertible conjugacy preserves its factor. -/
theorem LGroupLocalFactor.conjugacy {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A B : Matrix ι ι ℂ) (hB : IsUnit B) :
    Matrix.charpolyRev (B*A*B⁻¹) = A.charpolyRev := by sorry

/-- Direct sums multiply the native reverse characteristic polynomials. -/
theorem LGroupLocalFactor.direct_sum {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (A : Matrix ι ι ℂ) (B : Matrix κ κ ℂ) :
    Matrix.charpolyRev (Matrix.fromBlocks A 0 0 B) = A.charpolyRev*B.charpolyRev := by sorry

/-- A diagonal Satake operator gives the product of its rank-one factors. -/
theorem LGroupLocalFactor.standard_gln {ι : Type*} [Fintype ι] [DecidableEq ι]
    (α : ι → ℂ) : Matrix.charpolyRev (Matrix.diagonal α) =
      ∏ i, (1-Polynomial.C (α i)*Polynomial.X) := by sorry

-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.zero_dimensional
example : Matrix.charpolyRev (0 : Matrix (Fin 0) (Fin 0) ℂ) = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.one_dimensional
example (a : ℂ) : Matrix.charpolyRev (Matrix.diagonal (fun _ : Fin 1 => a)) =
    1-Polynomial.C a*Polynomial.X := by sorry
-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.tensor_not_product
example : Matrix.charpolyRev (Matrix.diagonal (fun _ : Fin 1 => (2*3 : ℂ))) ≠
    Matrix.charpolyRev (Matrix.diagonal (fun _ : Fin 1 => (2 : ℂ))) *
      Matrix.charpolyRev (Matrix.diagonal (fun _ : Fin 1 => (3 : ℂ))) := by sorry
end TauCeti.AutomorphicLFunctions.AL4

/-! ## Layer AL.5: Euler corrections and critical values -/

namespace TauCeti.AutomorphicLFunctions.AL5

/-- The product of local denominator polynomials at removed places. -/
def FiniteEulerCorrection {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (s : ℂ) : ℂ := ∏ v ∈ S, (P v).eval ((q v : ℂ)^(-s))

theorem FiniteEulerCorrection.empty {ι : Type*} (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (s : ℂ) : FiniteEulerCorrection ∅ P q s = 1 := by sorry

theorem FiniteEulerCorrection.union {ι : Type*} [DecidableEq ι]
    (S T : Finset ι) (h : Disjoint S T) (P : ι → Polynomial ℂ) (q : ι → ℝ) (s : ℂ) :
    FiniteEulerCorrection (S∪T) P q s =
      FiniteEulerCorrection S P q s*FiniteEulerCorrection T P q s := by sorry

-- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.empty_set
example {ι : Type*} (P : ι → Polynomial ℂ) (q : ι → ℝ) (s : ℂ) (L : ℂ → ℂ) :
    FiniteEulerCorrection ∅ P q s * L s = L s := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.simple_exceptional_zero
example (p : ℝ) (hp : 1 < p) :
    FiniteEulerCorrection (Finset.univ : Finset (Fin 1))
      (fun _ => 1-Polynomial.X) (fun _ => p) 0 = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.double_exceptional_zero
example (p : ℝ) (hp : 1 < p) :
    iteratedDeriv 2 (fun s : ℂ =>
      FiniteEulerCorrection (Finset.univ : Finset (Fin 2))
        (fun _ => 1-Polynomial.X) (fun _ => p) s) 0 =
      2*(Real.log p : ℂ)^2 := by sorry

/-- The two corrections for a good-prime primitive GL₂ newform and a chosen refinement. -/
def OrdinaryGl2EulerFactor (p : ℝ) (k j : ℕ) (α χp χinvp εp : ℂ) : ℂ :=
  (1-χp*(p : ℂ)^j/α)*(1-χinvp*εp*(p : ℂ)^(k-j)/α)

theorem OrdinaryGl2EulerFactor.ramified (p : ℝ) (k j : ℕ) (α εp : ℂ) :
    OrdinaryGl2EulerFactor p k j α 0 0 εp = 1 := by sorry

theorem OrdinaryGl2EulerFactor.unramified (p : ℝ) (k j : ℕ) (α εp : ℂ) :
    OrdinaryGl2EulerFactor p k j α 1 1 εp =
      (1-(p : ℂ)^j/α)*(1-εp*(p : ℂ)^(k-j)/α) := by sorry

-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.trivial_weight_two
example (p : ℝ) (α : ℂ) : OrdinaryGl2EulerFactor p 0 0 α 1 1 1 = (1-1/α)^2 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.exceptional
example (p : ℝ) : OrdinaryGl2EulerFactor p 0 0 1 1 1 1 = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.different_roots
example : OrdinaryGl2EulerFactor 3 0 0 (Complex.I*Real.sqrt 3) 1 1 1 ≠
    OrdinaryGl2EulerFactor 3 0 0 (-Complex.I*Real.sqrt 3) 1 1 1 := by sorry

/-- The central-sign argument uses an actual functional equation hypothesis. -/
theorem CentralSignVanishing (Λ : ℂ → ℂ) (h : ∀ s, Λ s = -Λ (1-s)) :
    Λ (1/2) = 0 := by sorry

theorem FirstNonzeroTermParity (Λ : ℂ → ℂ) (hΛ : Differentiable ℂ Λ)
    (ε : ℂ) (hε : ε = 1 ∨ ε = -1) (h : ∀ s, Λ s = ε*Λ (1-s)) (j : ℕ) :
    iteratedDeriv j Λ (1/2) = ε*(-1)^j*iteratedDeriv j Λ (1/2) := by sorry

/-- Coefficients of f(z) - beta * f(p*z), for arbitrary beta.
    Eigenform status uses the Hecke-root and recurrence hypotheses of up_eigen. -/
def pStabilizedCoeff (a : ℕ → ℂ) (p : ℕ) (β : ℂ) (n : ℕ) : ℂ :=
  a n - if p ∣ n then β * a (n / p) else 0

/-- Absolute summability justifies the change of index n = p*m. -/
theorem pStabilizedCoeff.LSeries (a χ : ℕ → ℂ) (p : ℕ) (β s : ℂ)
    (hp : 1 < p) (hχ : ∀ n, χ (p * n) = χ p * χ n)
    (hs : LSeriesSummable (fun n => χ n * a n) s) :
    LSeriesSummable (fun n => χ n * pStabilizedCoeff a p β n) s ∧
    LSeries (fun n => χ n * pStabilizedCoeff a p β n) s =
      (1 - β * χ p * (p : ℂ) ^ (-s)) * LSeries (fun n => χ n * a n) s := by sorry

/-- A Hecke-polynomial root gives U_p eigenvalue alpha under the good-prime recurrence. -/
theorem pStabilizedCoeff.up_eigen (a : ℕ → ℂ) (p k : ℕ) (hp : 1 < p)
    (α β εp : ℂ) (hα : α ≠ 0)
    (hroot : α^2-a p*α+εp*(p : ℂ)^(k+1) = 0)
    (hβ : β = εp*(p : ℂ)^(k+1)/α)
    (hrec : ∀ n, a (p*n) = a p*a n -
      if p ∣ n then εp*(p : ℂ)^(k+1)*a (n/p) else 0) (n : ℕ) :
    pStabilizedCoeff a p β (p*n) = α*pStabilizedCoeff a p β n := by sorry

-- The level-32 weight-two example has a(1)=1 and a(3)=0.
example (a : ℕ → ℂ) (h₁ : a 1 = 1) (h₃ : a 3 = 0) :
    (1 : ℂ)*3 = 3 ∧ pStabilizedCoeff a 3 3 3 = -3 ∧
    (1 : ℂ)^2-a 3*1+3 ≠ 0 := by sorry

example (a : ℕ → ℂ) (p : ℕ) (hp : 1 < p) (β : ℂ) :
    pStabilizedCoeff a p β 1 = a 1 := by sorry
example (a : ℕ → ℂ) (p : ℕ) (hp : 1 < p) (α β : ℂ)
    (h₁ : a 1 = 1) (hpcoeff : a p = α + β) :
    pStabilizedCoeff a p β p = α := by sorry
example (p : ℕ) (β s : ℂ) : (1 - β * (0 : ℂ) * (p : ℂ) ^ (-s) : ℂ) = 1 := by sorry

theorem FiniteEulerCorrection.orders {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (L : ℂ → ℂ) (s₀ : ℂ)
    (hE : MeromorphicAt (FiniteEulerCorrection S P q) s₀) (hL : MeromorphicAt L s₀) :
    meromorphicOrderAt (fun s => FiniteEulerCorrection S P q s*L s) s₀ =
      meromorphicOrderAt (FiniteEulerCorrection S P q) s₀+meromorphicOrderAt L s₀ := by sorry

theorem FiniteEulerCorrection.value {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (L Lpartial : ℂ → ℂ) (s₀ : ℂ)
    (hE : AnalyticAt ℂ (FiniteEulerCorrection S P q) s₀)
    (hL : AnalyticAt ℂ L s₀) (hL' : AnalyticAt ℂ Lpartial s₀)
    (h : Lpartial =ᶠ[𝓝[≠] s₀] fun s => FiniteEulerCorrection S P q s*L s) :
    Lpartial s₀ = FiniteEulerCorrection S P q s₀*L s₀ := by sorry

theorem EulerCorrectionLeadingTerm (E L : ℂ → ℂ) (s₀ : ℂ)
    (hE : DifferentiableAt ℂ E s₀) (hL : DifferentiableAt ℂ L s₀) (hz : E s₀ = 0) :
    deriv (fun s => E s*L s) s₀ = deriv E s₀*L s₀ := by sorry

theorem OrdinaryGl2EulerFactor.refinement (p : ℝ) (hp : 0 < p)
    (k j : ℕ) (hj : j ≤ k) (α χp χinvp εp : ℂ) (hα : α ≠ 0) :
    OrdinaryGl2EulerFactor p k j α χp χinvp εp =
      (1-χp*(p : ℂ)^j/α)*
      (1-χinvp*(εp*(p : ℂ)^(k+1)/α)/(p : ℂ)^(j+1)) := by sorry

/-- Scalar normalization and coefficient-field transport. The input `halg`
    is membership after the full period/Gauss/archimedean normalization,
    supplied by the critical-value algebraicity theorem;
    this comparison does not prove that theorem. -/
theorem CriticalValuePeriodInterface (E : Subfield ℂ)
    (completed finite gamma normalization : ℂ)
    (hgamma : gamma ≠ 0) (hnormalization : normalization ≠ 0)
    (h : completed = gamma*finite) (halg : finite/normalization ∈ E) :
    completed/(gamma*normalization) = finite/normalization ∧
      completed/(gamma*normalization) ∈ E := by sorry

end TauCeti.AutomorphicLFunctions.AL5

/-
README.md states the full local-field, representation and Weyl-group interfaces:

AL.0: `PartialFourierTransform.negative_kernel` compares the signs;
`SelfDualHaar.character_scale` fixes Haar rescaling for ψ_a.
AL.2: `StandardLocalLFactor.normalized_zeta` is the continued test-integral quotient.
`IsCenteredOrderOne.mul`, `IsCenteredOrderOne.translate` and
`IsCenteredOrderOne.polynomial` specify the basic growth API.
AL.3: `RsLocalIntegrals.equal_rank` and `RsLocalIntegrals.j_range` specify the actual
quotient and block embeddings. `MirabolicEisensteinSeries.parabolic_sum` and
`MirabolicEisensteinSeries.nontrivial_normone` specify unfolding and zero-mode poles.
`NormalizedRsPeriod.tempered_half_plane` and `NormalizedRsPeriod.continued_value`
fix the domain and continuation at zero.
AL.5: `pStabilizedCoeff.not_dvd` and `pStabilizedCoeff.mul` specify the prime-to-p
and multiple-of-p coefficient formulas.
-/

/-! ## AL.2: GL₂ newvectors on native representation carriers -/

namespace TauCeti.GL2Blueprint
open _root_.Matrix

section Congruence
variable {R : Type*} [CommRing R]

/-- The lower-left ideal congruence subgroup of GL₂(R). Submonoid.units includes the inverse condition; for a 2×2 unit it is equivalent to the single entry condition in the AL.2 GL₂ newvector convention. -/
def k0 (I : Ideal R) : Subgroup (GeneralLinearGroup (Fin 2) R) :=
  ({ carrier := {M : Matrix (Fin 2) (Fin 2) R | M 1 0 ∈ I}
     one_mem' := by simp
     mul_mem' := by
       intro M N hM hN
       change (M * N) 1 0 ∈ I
       simpa [Matrix.mul_apply, Fin.sum_univ_two] using
         I.add_mem (I.mul_mem_right (N 0 0) hM) (I.mul_mem_left (M 1 1) hN)
   } : Submonoid (Matrix (Fin 2) (Fin 2) R)).units

example (I : Ideal R) : (1 : GeneralLinearGroup (Fin 2) R) ∈ k0 I := by sorry

example : k0 (⊤ : Ideal R) = ⊤ := by sorry

example (u l : GeneralLinearGroup (Fin 2) (ZMod 5))
    (hu : u.val = !![1, 1; 0, 1]) (hl : l.val = !![1, 0; 1, 1]) :
    u ∈ k0 (⊥ : Ideal (ZMod 5)) ∧ l ∉ k0 (⊥ : Ideal (ZMod 5)) := by sorry

/-- The last-row ideal congruence subgroup of GL₂(R): lower-left entry in I and lower-right entry congruent to one. Inversion is included by Submonoid.units. -/
def k1 (I : Ideal R) : Subgroup (GeneralLinearGroup (Fin 2) R) :=
  ({ carrier := {M : Matrix (Fin 2) (Fin 2) R | M 1 0 ∈ I ∧ M 1 1 - 1 ∈ I}
     one_mem' := by simp
     mul_mem' := by
       intro M N hM hN
       constructor
       · change (M * N) 1 0 ∈ I
         simpa [Matrix.mul_apply, Fin.sum_univ_two] using
           I.add_mem (I.mul_mem_right (N 0 0) hM.1) (I.mul_mem_left (M 1 1) hN.1)
       · change (M * N) 1 1 - 1 ∈ I
         convert I.add_mem
           (I.add_mem (I.mul_mem_right (N 0 1) hM.1)
             (I.mul_mem_left (M 1 1) hN.2)) hM.2 using 1
         simp [Matrix.mul_apply, Fin.sum_univ_two]
         ring
   } : Submonoid (Matrix (Fin 2) (Fin 2) R)).units

example (I : Ideal R) : (1 : GeneralLinearGroup (Fin 2) R) ∈ k1 I := by sorry

example : k1 (⊤ : Ideal R) = ⊤ := by sorry

example (g : GeneralLinearGroup (Fin 2) (ZMod 5)) (hg : g.val = !![2, 0; 0, 1]) :
    g ∈ k1 (⊥ : Ideal (ZMod 5)) ∧ g.val ≠ !![1, 0; 0, 1] := by sorry

end Congruence

section LocalRepresentation
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]

/-- The least nonzero fixed level of a representation with an explicitly nonempty level set. -/
def conductorExponent (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) : ℕ := by
  classical
  exact Nat.find hex

/-- The least level has a nonzero fixed vector, and every smaller level has none. -/
theorem conductor_min (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) :
    (∃ v ∈ (Representation.invariants (ρ.comp (K (conductorExponent ρ K hex)).subtype)), v ≠ 0) ∧
    ∀ n < conductorExponent ρ K hex,
      ¬ ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0 := by sorry

example (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0)
    (hzero : ∃ v ∈ (Representation.invariants (ρ.comp (K 0).subtype)), v ≠ 0) :
    conductorExponent ρ K hex = 0 := by sorry

end LocalRepresentation

section LocalNewvectors
open scoped ValuativeRel
variable {F : Type*} [Field F] [CharZero F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
variable {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- The last-row k1 subgroup over the valuation ring, embedded in GL₂(F).
This abbreviation introduces neither a local-field carrier nor a second
congruence subgroup. Level zero is the integral maximal compact subgroup. -/
abbrev localK1 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin 2) F) :=
  (k1 (𝓂[F] ^ n)).map
    (GeneralLinearGroup.map (algebraMap 𝒪[F] F))

/-- The image of the lower-left subgroup; this is a specialization
of k0, rather than another Iwahori or local-field carrier. -/
abbrev localK0 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin 2) F) :=
  (k0 (𝓂[F] ^ n)).map
    (GeneralLinearGroup.map (algebraMap 𝒪[F] F))

example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 1; 0, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK0 F 1 := by sorry

example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 0; 1, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∉ localK0 F 1 := by sorry

example (u : 𝒪[F]ˣ) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F)
      (GeneralLinearGroup.scalar (Fin 2) u) ∈ localK0 F 1 := by sorry

example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 1; 0, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK1 F 1 := by sorry

example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![1, 0; 1, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∉ localK1 F 1 := by sorry

example (u : 𝒪[F]ˣ) (hu : (u : 𝒪[F]) - 1 ∉ 𝓂[F])
    (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![(u : 𝒪[F]), 0; 0, 1]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK1 F 1 ∧
      GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ≠ 1 := by sorry

/-- The embedded congruence subgroup is compact. -/
theorem localK0_isCompact (n : ℕ) :
    IsCompact (localK0 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry

/-- The embedded congruence subgroup is open. -/
theorem localK0_isOpen (n : ℕ) :
    IsOpen (localK0 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry

/-- The embedded congruence subgroup is compact. -/
theorem localK1_isCompact (n : ℕ) :
    IsCompact (localK1 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry

/-- The embedded congruence subgroup is open. -/
theorem localK1_isOpen (n : ℕ) :
    IsOpen (localK1 F n : Set (GeneralLinearGroup (Fin 2) F)) := by sorry

/-- Trivial action of integral scalar units identifies K₀ and K₁ fixed spaces at every level. -/
theorem localK0_invariants_eq_localK1
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (hcent : ∀ (u : 𝒪[F]ˣ) (v : V),
      π (GeneralLinearGroup.map (algebraMap 𝒪[F] F)
        (GeneralLinearGroup.scalar (Fin 2) u)) v = v) (n : ℕ) :
    Representation.invariants (π.comp (localK0 F n).subtype) =
      Representation.invariants (π.comp (localK1 F n).subtype) := by sorry

example (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g.val = !![0, 1; -1, 0]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∈ localK0 F 0 ∧
      GeneralLinearGroup.map (algebraMap 𝒪[F] F) g ∉ localK0 F 1 := by sorry

example (u : 𝒪[F]ˣ) (hu : (u : 𝒪[F]) - 1 ∉ 𝓂[F]) :
    GeneralLinearGroup.map (algebraMap 𝒪[F] F)
      (GeneralLinearGroup.scalar (Fin 2) u) ∈ localK0 F 1 ∧
    GeneralLinearGroup.map (algebraMap 𝒪[F] F)
      (GeneralLinearGroup.scalar (Fin 2) u) ∉ localK1 F 1 := by sorry

example (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (u : 𝒪[F]ˣ) (a : ℂ) (ha : a ≠ 1)
    (hscalar : ∀ v : V,
      π (GeneralLinearGroup.map (algebraMap 𝒪[F] F)
        (GeneralLinearGroup.scalar (Fin 2) u)) v = a • v)
    (n : ℕ)
    (hfixed : ∃ v ∈ Representation.invariants (π.comp (localK1 F n).subtype), v ≠ 0) :
    Representation.invariants (π.comp (localK0 F n).subtype) = ⊥ ∧
      Representation.invariants (π.comp (localK0 F n).subtype) ≠
        Representation.invariants (π.comp (localK1 F n).subtype) := by sorry

/-- Casselman, Theorem 1 and its proof, pp. 302–306, in the last-row
convention of the README. Infinite dimensionality excludes determinant
characters. No conductor or nonempty-level hypothesis is assumed. -/
theorem newvectorLevelExists
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V) :
    ∃ n, ∃ v ∈ Representation.invariants (π.comp (localK1 F n).subtype),
      v ≠ 0 := by sorry

/-- The complete dimension formula, not an assumption that a fixed line exists.
Natural subtraction expresses max(0, n-c+1). Casselman, Corollary to the
Proof, p. 306; apply his top-left convention to the contragredient and twist
back to obtain the lower-last-row subgroup used here. -/
theorem casselmanNewvector
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V) (n : ℕ) :
    Module.finrank ℂ (Representation.invariants (π.comp (localK1 F n).subtype)) =
      n + 1 - conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf) := by sorry

/-- The central-character assertion for the minimal K₀-line. For positive
conductor the lower-right entry of an integral K₀ matrix is a unit; u is that
unit, rather than an arbitrary value of the determinant. At conductor zero
the fixed line is spherical. -/
theorem casselmanNewvector_k0_character
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (ω : Fˣ →* ℂˣ)
    (hcent : ∀ z v, π (GeneralLinearGroup.scalar (Fin 2) z) v = (ω z : ℂ) • v)
    (hc : 0 < conductorExponent π (localK1 F)
      (newvectorLevelExists π hsm hadm hinf))
    (g : GeneralLinearGroup (Fin 2) 𝒪[F])
    (hg : g ∈ k0 (𝓂[F] ^ conductorExponent π (localK1 F)
      (newvectorLevelExists π hsm hadm hinf)))
    (u : 𝒪[F]ˣ) (hu : (u : 𝒪[F]) = g.val 1 1)
    (v : Representation.invariants (π.comp (localK1 F
      (conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf))).subtype)) :
    π (GeneralLinearGroup.map (algebraMap 𝒪[F] F) g) v.val =
      (ω (Units.map (algebraMap 𝒪[F] F).toMonoidHom u) : ℂ) • v.val := by sorry

/-- Nonvanishing of the chosen Whittaker functional on the newvector line.
The second character condition says it is nontrivial on the inverse maximal
ideal. Equivariance uses actual upper unipotent matrices. Existence of this
nonzero functional is SR.2.3's genericity theorem, not an assumption about its
restriction to the newvector line. Casselman, proof of Theorem 1, pp. 303–306. -/
theorem casselmanNewvector_whittaker_eval
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (ψ : AddChar F ℂ) (hψ : Continuous ψ)
    (hψO : ∀ a : 𝒪[F], ψ (a : F) = 1)
    (hψp : ∃ x : F, (∀ a : 𝒪[F], a ∈ 𝓂[F] →
      x * (a : F) ∈ (𝒪[F] : Set F)) ∧ ψ x ≠ 1)
    (ell : V →ₗ[ℂ] ℂ) (hell : ell ≠ 0)
    (hwhit : ∀ (x : F) (g : GeneralLinearGroup (Fin 2) F),
      g.val = !![1, x; 0, 1] → ∀ v, ell (π g v) = ψ x * ell v) :
    ∃ v : Representation.invariants (π.comp (localK1 F
      (conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf))).subtype), ell v.val ≠ 0 := by sorry

end LocalNewvectors


section NormalizedLine
variable {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- The vector of value one for a nonzero functional on a one-dimensional line. -/
def normalizedNewvector (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) : L := by sorry

/-- The normalized vector has value one under the specified functional. -/
theorem normalizedNewvector_eval (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) :
    ell (normalizedNewvector L ell hdim hell) = 1 := by sorry

/-- A value-one vector on the line is the normalized vector. -/
theorem normalizedNewvector_unique (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) (v : L) (hv : ell v = 1) :
    v = normalizedNewvector L ell hdim hell := by sorry

example (ell : (⊤ : Submodule ℂ ℂ) →ₗ[ℂ] ℂ)
    (hell : ∀ z, ell z = 2 * (z : ℂ)) (hne : ell ≠ 0)
    (hdim : Module.finrank ℂ (⊤ : Submodule ℂ ℂ) = 1) :
    (normalizedNewvector ⊤ ell hdim hne : ℂ) = 1 / 2 := by sorry

example (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0)
    (a : ℂ) (ha : a ≠ 0) (hscaled : a • ell ≠ 0) :
    normalizedNewvector L (a • ell) hdim hscaled =
      a⁻¹ • normalizedNewvector L ell hdim hell := by sorry

example (L : Submodule ℂ V) :
    ¬ ∃ v : L, (0 : L →ₗ[ℂ] ℂ) v = 1 := by sorry

end NormalizedLine


/- The full API also includes conductor_iso, conductor_unramified_twist,
normalizedNewvector_fixed and normalizedNewvector_twist, with the hypotheses
and last-row convention specified in README AL.2 / GL₂ newvectors. -/

end TauCeti.GL2Blueprint
