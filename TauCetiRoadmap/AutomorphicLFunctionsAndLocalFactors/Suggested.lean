import Mathlib

/-!
# AutomorphicLFunctionsAndLocalFactors: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These suggested forms record light definitions and theorem signatures statable
against the pinned Mathlib and Tau Ceti APIs; proving every declaration does not complete a layer.

The formulas fix the positive Tate Fourier kernel, the unitary centre, canonical real and complex
gamma factors, geometric-Frobenius determinant conventions and continuation before evaluation.
The standard trace character, local additive self-duality, restricted-product adelic duality,
diagonal self-annihilator and common adelic Schwartz/Fourier/Poisson space are consumed from
ArithmeticGaloisRepresentations §2.7 Global inputs. Its `standard-test-function-evaluations`
supplies `finiteStandardEvaluation`, `archimedeanStandardEvaluation_real` and
`archimedeanStandardEvaluation_complex`, including the Fourier values on those vectors.
Its `hecke-zeta-integral-comparison` and `finite-order-hecke-functional-equation` supply
the finite-order/algebraic standard-integral normalization and Hecke equation. Its
`local-constant-gauss-sum` defines `tateLocalConstant` arithmetically;
`root-number-product-formula` is a finite-sum identity for the product of those constants.
AL.2 proves global matrix-integral continuation and functional equations by Poisson
summation for every n ≥ 1, including all unitary idele-class characters at n = 1.
AL.1 gives its scalar Hecke corollary and normalization comparisons, and specializes
the local matrix equation through `rank-one-local-functional-equation`.
The local equation for arbitrary Schwartz functions and eigendistribution uniqueness
are targets here. The standard-function evaluations and `tateLocalConstant` belong to that
supplier. The Hecke corollary uses the conductor-balanced standard factors.
`LocalAdditiveSelfDuality` compares the supplied isomorphism with the bilinear annihilator;
`SelfDualHaar` records the local measure adapter. The README specifies the additional
local-factor, vector-space and distribution refinements, representation spaces, shtukas and
rational period comparisons.
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

-- TauCeti.LocalFourier.pairingAnnihilator_trivial_character
example : pairingAnnihilator (1 : AddChar R Circle)
    (LinearMap.mul R R) (⊤ : AddSubgroup R) = ⊤ := by
  ext w
  simp [pairingAnnihilator]

-- TauCeti.LocalFourier.pairingAnnihilator_not_real_submodule
example :
    (1 : ℝ) ∈ pairingAnnihilator Real.fourierChar (LinearMap.mul ℝ ℝ)
      (AddSubgroup.zmultiples (1 : ℝ)) ∧
    (1 / 2 : ℝ) ∉ pairingAnnihilator Real.fourierChar (LinearMap.mul ℝ ℝ)
      (AddSubgroup.zmultiples (1 : ℝ)) := by
  simp only [pairingAnnihilator, AddSubgroup.mem_iInf, AddMonoidHom.mem_ker]
  constructor
  · intro v
    obtain ⟨n, hn⟩ := AddSubgroup.mem_zmultiples_iff.mp v.property
    change Real.fourierChar ((v : ℝ) * 1) = 1
    rw [← hn]
    simpa [Real.fourierChar_apply', zsmul_eq_mul] using Circle.exp_two_pi_mul_int n
  · intro h
    have hhalf := h ⟨1, AddSubgroup.mem_zmultiples 1⟩
    change Real.fourierChar ((1 : ℝ) * (1 / 2)) = 1 at hhalf
    rw [Real.fourierChar_apply'] at hhalf
    have harg : 2 * Real.pi * ((1 : ℝ) * (1 / 2)) = Real.pi := by ring
    exact Circle.exp_pi_ne_one (harg ▸ hhalf)

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

/-- Membership in the annihilator is character triviality on the subgroup. -/
theorem mem_pairingAnnihilator (ψ : AddChar R Circle)
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V) (w : W) :
    w ∈ pairingAnnihilator ψ L U ↔ ∀ v ∈ U, ψ (L v w) = 1 := by sorry

/-- The zero subgroup imposes no character condition. -/
theorem pairingAnnihilator_bot (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) :
    pairingAnnihilator ψ L ⊥ = ⊤ := by sorry

/-- A zero pairing makes every character value trivial. -/
theorem pairingAnnihilator_zero (ψ : AddChar R Circle) (U : AddSubgroup V) :
    pairingAnnihilator ψ (0 : V →ₗ[R] W →ₗ[R] R) U = ⊤ := by sorry

/-- Increasing the subgroup decreases its character annihilator. -/
theorem pairingAnnihilator_antitone (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) :
    Antitone (pairingAnnihilator ψ L) := by sorry

/-- Pulling back the second variable pulls back the annihilator. -/
theorem pairingAnnihilator_comap {W' : Type*} [AddCommGroup W'] [Module R W']
    (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R)
    (U : AddSubgroup V) (T : W' →ₗ[R] W) :
    pairingAnnihilator ψ (L.compl₂ T) U =
      (pairingAnnihilator ψ L U).comap T.toAddMonoidHom := by sorry

end TauCeti.LocalFourier

namespace TauCeti.AutomorphicLFunctions.AL0

/-- Positive Fourier kernel, compared to the native negative kernel by reflection. -/
def PartialFourierTransform {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (Φ : X × V → ℂ) (x : X) (w : W) : ℂ :=
  VectorFourier.fourierIntegral ψ μ B (fun v => Φ (x,v)) (-w)

/-- A product test function retains its untransformed factor. -/
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
      (fun p => f p.1) x 0 = f x := by
  simp [PartialFourierTransform, VectorFourier.fourierIntegral]

/-- Finite-place rescaling adapter from μ₀(O)=1 to the scalar self-dual measure
supplied by ArithmeticGaloisRepresentations §2.7, with residue size q and different exponent d. -/
def SelfDualHaar {F : Type*} [MeasurableSpace F] (μ₀ : Measure F)
    (q : ℝ) (d : ℕ) : Measure F := ENNReal.ofReal (q ^ (-(d : ℝ)/2)) • μ₀

/-- The finite adapter gives the prescribed volume of the valuation ring. -/
theorem SelfDualHaar.unit_volume {F : Type*} [MeasurableSpace F]
    (μ₀ : Measure F) (O : Set F) (q : ℝ) (d : ℕ) (h : μ₀ O = 1) :
    SelfDualHaar μ₀ q d O = ENNReal.ofReal (q ^ (-(d : ℝ)/2)) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.unramified
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F) (q : ℝ) (_hq : 0 < q) :
    SelfDualHaar μ₀ q 0 = μ₀ := by
  simp [SelfDualHaar]

-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.different_two
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F) (q : ℝ) (_hq : 0 < q) :
    SelfDualHaar μ₀ q 2 = ENNReal.ofReal q⁻¹ • μ₀ := by
  have hexp : -(2 : ℝ) / 2 = -1 := by norm_num
  simp [SelfDualHaar, hexp, Real.rpow_neg_one]

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

/-- Real exponential integral Ei(-r), only r>0 is used. -/
def negativeEi (r : ℝ) : ℝ := -(∫ t : ℝ in Set.Ioi r, Real.exp (-t)/t)

/-- The order derivative at one half is expressed by the negative exponential integral. -/
theorem BesselHalfOrderDerivative {c : ℝ} (hc : 0 < c) :
    deriv (fun ν : ℂ => BesselK ν c) (1/2) =
      (-(Real.sqrt (Real.pi/2)*Real.exp c*c^(-1/2 : ℝ)*negativeEi (2*c)) : ℝ) := by sorry

/-- The scalar duality isomorphism supplied by ArithmeticGaloisRepresentations §2.7
identifies character triviality on U with membership in the bilinear annihilator. -/
theorem LocalAdditiveSelfDuality {F : Type*} [CommRing F] [TopologicalSpace F]
    (ψ : AddChar F Circle)
    (ι : Multiplicative F ≃ₜ* PontryaginDual (Multiplicative F))
    (hι : ∀ x y : F, ι (Multiplicative.ofAdd y) (Multiplicative.ofAdd x) = ψ (x*y))
    (U : AddSubgroup F) (y : F) :
    y ∈ LocalFourier.pairingAnnihilator ψ (LinearMap.mul F F) U ↔
      ∀ x ∈ U, ι (Multiplicative.ofAdd y) (Multiplicative.ofAdd x) = 1 := by sorry

/-- Real archimedean square, with sections in the native Schwartz space. -/
theorem PartialFourierTransform.square {X : Type*} (Φ : X → SchwartzMap ℝ ℂ)
    (x : X) (w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p => PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
        (fun p => Φ p.1 p.2) p.1 p.2) x w = Φ x (-w) := by sorry

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

/-- Positive and native negative partial Fourier kernels differ by frequency reflection. -/
theorem PartialFourierTransform.negative_kernel {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (Φ : X × V → ℂ) (x : X) (w : W) :
    PartialFourierTransform ψ μ B Φ x w =
      VectorFourier.fourierIntegral ψ μ B (fun v => Φ (x, v)) (-w) := by sorry

/-- Every order derivative inserts the corresponding logarithmic power in the kernel. -/
theorem BesselK.order_deriv (j : ℕ) (ν : ℂ) {c : ℝ} (hc : 0 < c) :
    iteratedDeriv j (fun z => BesselK z c) ν =
      (1/2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
        Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹)/2) *
          Complex.exp (ν * (Real.log u : ℂ)) * (Real.log u : ℂ)^j / (u : ℂ) := by sorry

/-- The negative exponential integral has strictly negative values on positive inputs. -/
theorem negativeEi.neg {r : ℝ} (hr : 0 < r) : negativeEi r < 0 := by sorry

/-- Differentiating the lower endpoint gives the positive exponential tail density.
The parameter estimates use Mathlib hasDerivAt_integral_of_dominated_loc_of_deriv_le. -/
theorem negativeEi.hasDerivAt {r : ℝ} (hr : 0 < r) :
    HasDerivAt negativeEi (Real.exp (-r)/r) r := by sorry

/-- The exponential tail fixes the integration constant by vanishing at infinity. -/
theorem negativeEi.tendsto : Filter.Tendsto negativeEi Filter.atTop (𝓝 0) := by sorry

/-- A point-supported tempered distribution depends on only finitely many derivatives.
The vanishing-jet form applies in every finite real dimension. -/
theorem pointSupported_finiteJet {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (T : TemperedDistribution E ℂ)
    (hT : Distribution.dsupport (fun f : SchwartzMap E ℂ => T f) ⊆ {0}) :
    ∃ N : ℕ, ∀ f : SchwartzMap E ℂ,
      (∀ k ≤ N, iteratedFDeriv ℝ k f 0 = 0) → T f = 0 := by sorry

end TauCeti.AutomorphicLFunctions.AL0

/-! ## Layer AL.1: Local eigendistributions and Hecke factors -/

namespace TauCeti.TateZeta

/-- Norm-positive formulas on the native measurable multiplicative carrier. -/
def zetaIntegral {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω : G → ℂ) (s : ℂ) (f : G → ℂ) : ℂ :=
  ∫ x, f x * ω x * (a x : ℂ)^s ∂μ

/-- Rescaling multiplicative Haar measure rescales the local integral by the same scalar. -/
theorem zetaIntegral_measure_scale {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω f : G → ℂ) (s : ℂ) (c : ℝ≥0) :
    zetaIntegral ((c : ℝ≥0∞) • μ) a ω s f =
      (c : ℂ) * zetaIntegral μ a ω s f := by sorry

/-- A norm twist of the local character translates the complex variable. -/
theorem zetaIntegral_twist {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ha : ∀ x, 0 < a x)
    (ω f : G → ℂ) (s t : ℂ) :
    zetaIntegral μ a (fun x => ω x*(a x : ℂ)^t) s f =
      zetaIntegral μ a ω (s+t) f := by sorry

/-- The rank-one matrix integral on the native measurable multiplicative carrier.
For local Schwartz functions and quasi-characters it is used on its convergence
half-plane; continuation is the n = 1 Godement–Jacquet continuation. -/
abbrev localZetaIntegral {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (χ : G → ℂ) (s : ℂ) (f : G → ℂ) : ℂ :=
  zetaIntegral μ a χ s f

/-- The normalized rank-one matrix equation gives the gamma equation on
punctured germs. In the local application Zdual is Z(fhat, chi inverse, 1-s),
and Ldual is L(1-s, chi inverse); local L-factors are nonzero off their poles. -/
theorem localZetaIntegral_functionalEquation
    (Z Zdual L Ldual ε : ℂ → ℂ) (s₀ : ℂ)
    (hL : ∀ᶠ s in 𝓝[≠] s₀, L s ≠ 0)
    (hLdual : ∀ᶠ s in 𝓝[≠] s₀, Ldual s ≠ 0)
    (hmat : (fun s => Zdual s / Ldual s) =ᶠ[𝓝[≠] s₀]
      (fun s => ε s * (Z s / L s))) :
    Zdual =ᶠ[𝓝[≠] s₀] (fun s => (ε s * Ldual s / L s) * Z s) := by sorry

/-- A nonzero normalized standard-vector evaluation identifies the matrix epsilon
with the arithmetic Gauss-sum constant, and hence identifies the gamma ratio.
The hypotheses come from the matrix equation and the supplied standard evaluation;
the arithmetic constant is evaluated at chi times the s-th norm power. -/
theorem localGamma_eq_tateLocalConstant
    (Z₀ Zdual₀ ε tateLocalConstant L Ldual : ℂ) (hZ : Z₀ ≠ 0)
    (hmat : Zdual₀ = ε * Z₀) (hstd : Zdual₀ = tateLocalConstant * Z₀) :
    ε = tateLocalConstant ∧
      ε * Ldual / L = tateLocalConstant * Ldual / L := by sorry

/-- Gamma equals epsilon times the quotient of dual and original local L-factors.
At finite places the full local API identifies epsilon with the canonical supplied
Tate local constant at the norm-twisted character and its self-dual measure. -/
def gammaFactor (ε L Ldual : ℂ → ℂ) (s : ℂ) : ℂ := ε s * Ldual (1-s)/L s

/- `TateZeta.epsilonFactor_eq_tateLocalConstant` identifies the scalar in the
normalized-distribution equation with tateLocalConstant(ω |·|^s, ψ, dx_ψ)
for every finite completion, continuous quasi-character, nontrivial continuous
additive character and s. It uses that supplier's `finiteStandardEvaluation` on the
nonzero normalized eigenline, with the positive Fourier kernel and both ν and c retained.
-/

/-- The normalized Gauss integral used by ArithmeticGaloisRepresentations §2.7,
with its finite-place additive Haar normalization and conductor inputs explicit. -/
def localGaussSum {F : Type*} [Field F] [MeasurableSpace F]
    (μ : Measure F) (U : Set F) (q : ℝ) (ν : ℤ) (c : ℕ)
    (ϖ : Fˣ) (ω : F → ℂ) (ψ : AddChar F Circle) : ℂ :=
  (q : ℂ)^(((ν : ℂ)+(c : ℂ))/2) *
    ∫ y in U, (ω y)⁻¹ * (ψ (((ϖ : F)^(-ν-(c : ℤ)))*y) : ℂ) ∂μ

/-- Product notation for the unbalanced all-place factors on their convergence domain.
The n = 1 Godement–Jacquet continuation is compared with Hecke's germ using
ArithmeticGaloisRepresentations §2.7's `standard-test-function-evaluations`,
`finite-order-hecke-functional-equation` and `hecke-zeta-integral-comparison` for
finite-order/algebraic characters. General unitary-character continuation and functional
equations are AL.2's `global-godement-jacquet` at n = 1.
The algebraic norm-twist normalization agrees with LFunctions layers 0, 5–6. -/
def completedHeckeL {ι : Type*} (L : ι → ℂ → ℂ) (s : ℂ) : ℂ := ∏' v, L v s

/-- The product after removing the specified places, on its convergence domain. -/
def partialHeckeL {ι : Type*} (S : Set ι) (L : ι → ℂ → ℂ) (s : ℂ) : ℂ :=
  ∏' v : {v // v ∉ S}, L v.1 s

/-- Conductor balancing identifies the unbalanced local-factor product with the
supplied primitive LFunctions completion; the conductor A is positive in applications. -/
def balancedHeckeL (A : ℝ) (L : ℂ → ℂ) (s : ℂ) : ℂ :=
  (A : ℂ) ^ (s / 2) * L s

/-- Conductor balancing transports the unbalanced meromorphic germ equation to
Hecke's constant Gauss-sum-root-number equation. In the rank-one application the
input germ equation is the n = 1 Godement–Jacquet equation with its epsilon
product identified by ArithmeticGaloisRepresentations §2.7. -/
theorem balancedHeckeL_functionalEquation (A : ℝ) (hA : 0 < A)
    (L Ldual : ℂ → ℂ) (W s₀ : ℂ)
    (h : L =ᶠ[𝓝[≠] s₀] fun s => W * (A : ℂ) ^ (1/2 - s) * Ldual (1 - s)) :
    (fun s => balancedHeckeL A L s) =ᶠ[𝓝[≠] s₀]
      (fun s => W * balancedHeckeL A Ldual (1 - s)) := by sorry

/-- The real scalar value supplied by ArithmeticGaloisRepresentations §2.7's
`archimedeanStandardEvaluation_real`, compared with the distribution epsilon for
sgn^a times a norm twist and the positive Tate character. -/
def realStandardEpsilon (a : Fin 2) : ℂ := Complex.I^a.val

/-- Finite-product notation for the scalar epsilon factors in ArithmeticGaloisRepresentations
§2.7's finite-sum identity `root-number-product-formula` and its
`standard-test-function-evaluations`.
The finite factors agree with the distribution scalar by epsilonFactor_eq_tateLocalConstant;
the archimedean factors use the supplied real and complex evaluations. The rank-one
Godement–Jacquet specialisation supplies the analytic equation for general unitary
characters; the finite-sum identity identifies its Gauss-sum root number and primitive
conductor power. Finite-order/algebraic characters agree with LFunctions via the Hecke
comparison, and complex norm twists translate the variable. -/
def globalEpsilon {ι : Type*} (S : Finset ι) (ε : ι → ℂ → ℂ) (s : ℂ) : ℂ :=
  ∏ v ∈ S, ε v s

/-- Unit central local epsilon factors have a unit central finite product. -/
theorem norm_globalEpsilon_half {ι : Type*} (S : Finset ι) (ε : ι → ℂ → ℂ)
    (h : ∀ v ∈ S, ‖ε v (1/2)‖ = 1) : ‖globalEpsilon S ε (1/2)‖ = 1 := by sorry

def QuasiChar.IsUnramified {F : Type*} [Field F] [TopologicalSpace F]
    (ω : Fˣ →ₜ* ℂˣ) (U : Subgroup Fˣ) : Prop := ∀ u : U, ω u = 1

/-- Translation covariance after the supplied group integral is instantiated.
    The invariance condition is on the actual multiplicative Haar measure. -/
theorem zetaIntegral_act {G : Type*} [Group G] [MeasurableSpace G] [MeasurableMul₂ G]
    (μ : Measure G) [μ.IsMulRightInvariant] (a : G →* ℝˣ) (ha : ∀ x, 0 < (a x : ℝ))
    (ω : G →* ℂˣ) (s : ℂ) (f : G → ℂ) (b : G) :
    zetaIntegral μ (fun x => a x) (fun x => ω x) s (fun x => f (x*b)) =
    ((ω b : ℂ)*(a b : ℂ)^s)⁻¹*zetaIntegral μ (fun x => a x) (fun x => ω x) s f := by sorry

/-- A convergent all-place product splits into its removed and retained factors. -/
theorem completedHeckeL_eq_mul {ι : Type*} [DecidableEq ι] (S : Finset ι)
    (L : ι → ℂ → ℂ) (s : ℂ) (h : Multipliable (fun v => L v s)) :
    completedHeckeL L s = (∏ v ∈ S, L v s)*partialHeckeL (S : Set ι) L s := by sorry

/-- Scalar-product character cancellation; the arithmetic global character
    supplies product one, not independent choices at the places. -/
theorem globalEpsilon_indep {ι : Type*} (S : Finset ι) (ε c : ι → ℂ)
    (hc : ∏ v ∈ S, c v = 1) : (∏ v ∈ S, c v*ε v) = ∏ v ∈ S, ε v := by sorry

/-- The continuous eigendistributions for inverse scalar pullback on an archimedean field.
The maps e are the real linear equivalences x ↦ a⁻¹x in the uniqueness theorem. -/
def archimedeanEigenSpace {F : Type*} [RCLike F]
    (e : Fˣ → F ≃L[ℝ] F) (χ : Fˣ →ₜ* ℂˣ) : Submodule ℂ (TemperedDistribution F ℂ) where
  carrier := {T | ∀ a f, T (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (e a) f) =
    (χ a : ℂ) * T f}
  zero_mem' := by simp
  add_mem' := by
    intro T S hT hS a f
    simp only [Set.mem_ofPred_eq] at hT hS ⊢
    simp [hT a f, hS a f, mul_add]
  smul_mem' := by
    intro c T hT a f
    simp only [Set.mem_ofPred_eq] at hT ⊢
    simp [hT a f, mul_left_comm]

/-- The archimedean eigencondition is equality under every inverse scalar pullback. -/
theorem archimedeanEigenSpace.mem {F : Type*} [RCLike F]
    (e : Fˣ → F ≃L[ℝ] F) (χ : Fˣ →ₜ* ℂˣ) (T : TemperedDistribution F ℂ) :
    T ∈ archimedeanEigenSpace e χ ↔ ∀ a f,
      T (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (e a) f) = (χ a : ℂ) * T f := by sorry

/-- Every archimedean quasi-character has a one-dimensional continuous eigenline. -/
theorem archimedeanEigenSpace.finrank {F : Type*} [RCLike F]
    (e : Fˣ → F ≃L[ℝ] F) (he : ∀ a x, e a x = (↑a⁻¹ : F) * x)
    (χ : Fˣ →ₜ* ℂˣ) : Module.finrank ℂ (archimedeanEigenSpace e χ) = 1 := by sorry

/-- Evaluation at zero is invariant under inverse scalar pullback. -/
theorem archimedeanEigenSpace.delta_mem {F : Type*} [RCLike F]
    (e : Fˣ → F ≃L[ℝ] F) :
    TemperedDistribution.delta (0 : F) ∈ archimedeanEigenSpace e 1 := by sorry

end TauCeti.TateZeta

namespace TauCeti.AutomorphicLFunctions.AL1

/-- The three gamma branches use finite numeric data over existing sum and product carriers. -/
abbrev GammaBranch := (Fin 2 × ℂ) ⊕ ((ℤ × ℂ) ⊕ ({k : ℕ // 2 ≤ k} × ℂ))

/-- The canonical gamma value of a real character, complex character or real discrete block. -/
def gammaBranch (b : GammaBranch) (s : ℂ) : ℂ := match b with
  | .inl (a, t) => Complex.Gammaℝ (s+t+(a.val : ℂ))
  | .inr (.inl (κ, t)) => Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2)
  | .inr (.inr (k, t)) => Complex.Gammaℂ (s+t+((k.val : ℂ)-1)/2)

/-- The product of canonical gamma factors for the specified archimedean constituents. -/
def CanonicalArchimedeanFactor (bs : List GammaBranch) (s : ℂ) : ℂ :=
  (bs.map (fun b => gammaBranch b s)).prod

/-- A real character branch gives its canonical real gamma factor. -/
theorem CanonicalArchimedeanFactor.real (a : Fin 2) (t s : ℂ) :
    CanonicalArchimedeanFactor [.inl (a, t)] s = Complex.Gammaℝ (s+t+(a.val : ℂ)) := by sorry

/-- A complex character branch retains its absolute angular weight and norm shift. -/
theorem CanonicalArchimedeanFactor.complex (κ : ℤ) (t s : ℂ) :
    CanonicalArchimedeanFactor [.inr (.inl (κ, t))] s =
      Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2) := by sorry

/-- A real discrete-series branch gives the gamma shift prescribed by its weight. -/
theorem CanonicalArchimedeanFactor.discrete_series (k : {k : ℕ // 2 ≤ k}) (t s : ℂ) :
    CanonicalArchimedeanFactor [.inr (.inr (k, t))] s =
      Complex.Gammaℂ (s+t+((k.val : ℂ)-1)/2) := by sorry

/-- Direct sums of archimedean constituents multiply their canonical gamma factors. -/
theorem CanonicalArchimedeanFactor.direct_sum (bs cs : List GammaBranch) (s : ℂ) :
    CanonicalArchimedeanFactor (bs++cs) s =
      CanonicalArchimedeanFactor bs s * CanonicalArchimedeanFactor cs s := by sorry

end TauCeti.AutomorphicLFunctions.AL1

/-! ## Layer AL.2: standard functions and paired products -/

namespace TauCeti.AutomorphicLFunctions.AL2

/-- The generic spherical condition in arithmetic Hecke coordinates 1 - aT + qsT². -/
def IsGenericUnramified (q : ℕ) (a s : ℂ) : Prop :=
  a ^ 2 ≠ s * ((q : ℂ) + 1) ^ 2

/-- Nonzero Satake parameters satisfy the arithmetic criterion precisely away from
the two reducibility ratios of normalized unramified induction. -/
theorem isGenericUnramified_iff_satake (q : ℕ) (hq : 2 ≤ q)
    (α β : ℂ) (hα : α ≠ 0) (hβ : β ≠ 0) :
    IsGenericUnramified q (α + β) (α * β / (q : ℂ)) ↔
      α / β ≠ (q : ℂ) ∧ α / β ≠ (q : ℂ)⁻¹ := by sorry

/-- The arithmetic Hecke coefficients of a determinant character lie on the nongeneric boundary. -/
theorem not_isGenericUnramified_det_twist (q : ℕ) (c : ℂ) :
    ¬ IsGenericUnramified q (((q : ℂ) + 1) * c) (c ^ 2) := by
  intro h
  apply h
  ring

/-- The Godement–Jacquet integral formula on GLₙ supplied as a measurable carrier G,
with its matrix inclusion and normalized determinant absolute value. The integrand is
supplied as a function. The global continuation uses matrix Poisson summation for every
n ≥ 1; its n = 1 case supplies AL.1's rank-one global distribution theory. -/
def GodementJacquetIntegral {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ) (s : ℂ) : ℂ :=
  ∫ g, β g * Φ g * (absDet g : ℂ)^(s+((n : ℂ)-1)/2) ∂μ

/-- Twisting the matrix coefficient by a determinant norm translates the integral variable. -/
theorem GodementJacquetIntegral.twist {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ)
    (h : ∀ g, 0 < absDet g) (s t : ℂ) :
    GodementJacquetIntegral n μ (fun g => β g*(absDet g : ℂ)^t) Φ absDet s =
      GodementJacquetIntegral n μ β Φ absDet (s+t) := by sorry

/-- At n = 1 the matrix exponent is s and the integral is the rank-one integral.
Its global continuation and reflected equation specialize the same matrix theory. -/
theorem GodementJacquetIntegral.rank_one {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral 1 μ β Φ absDet s =
      TauCeti.TateZeta.zetaIntegral μ absDet β s Φ := by
  simp only [GodementJacquetIntegral, TauCeti.TateZeta.zetaIntegral,
    Nat.cast_one, sub_self, zero_div, add_zero]
  congr 1
  ext g
  ring

/-- Evaluation once the finite-place principal-ideal theorem supplies P, P(0)=1.
    The archimedean branch uses CanonicalArchimedeanFactor. -/
def StandardLocalLFactor (P : Polynomial ℂ) (q : ℝ) (s : ℂ) : ℂ :=
  (P.eval ((q : ℂ)^(-s)))⁻¹

/-- A split local denominator evaluates as the product of its Satake factors. -/
theorem StandardLocalLFactor.unramified {ι : Type*} [Fintype ι]
    (α : ι → ℂ) (q : ℝ) (s : ℂ) :
    StandardLocalLFactor (∏ i, (1-Polynomial.C (α i)*Polynomial.X)) q s =
      ∏ i, (1-α i*(q : ℂ)^(-s))⁻¹ := by sorry

/-- A scalar change of Satake roots translates the local L-factor variable. -/
theorem StandardLocalLFactor.twist (P : Polynomial ℂ) (q : ℝ) (hq : 0 < q)
    (s t : ℂ) : StandardLocalLFactor
      (P.comp (Polynomial.C ((q : ℂ)^(-t))*Polynomial.X)) q s =
    StandardLocalLFactor P q (s+t) := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.trivial_gl1
example (q : ℝ) (s : ℂ) : StandardLocalLFactor (1-Polynomial.X) q s =
    (1-(q : ℂ)^(-s))⁻¹ := by
  simp [StandardLocalLFactor]

-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.ramified_gl1
example (q : ℝ) (s : ℂ) : StandardLocalLFactor 1 q s = 1 := by
  simp [StandardLocalLFactor]

/-- The native Dirichlet series with the two unitary Maass gamma factors.
On AutomorphicFormsOnReductiveGroups §4.5's `NormalizedMaassEigenform(|r|,δ)`,
`a` is its supplied `fourierCoefficient` and `ε = δ` gives reflection sign `(-1)^δ`.
This scalar formula applies to arbitrary coefficients and real parameters. -/
def maassCompletion (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) : ℂ :=
  Complex.Gammaℝ (s+(ε.val : ℂ)+Complex.I*r)*
    Complex.Gammaℝ (s+(ε.val : ℂ)-Complex.I*r)*LSeries a s

/-- The classical Maass gamma normalization differs from the canonical one by a parity scalar. -/
theorem MaassStandardLFunction.duke (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) :
    (Real.pi : ℂ)^(-s)*Complex.Gamma ((s+(ε.val : ℂ)+Complex.I*r)/2)*
      Complex.Gamma ((s+(ε.val : ℂ)-Complex.I*r)/2)*LSeries a s =
    (Real.pi : ℂ)^ε.val * maassCompletion a ε r s := by sorry

/-- The level-one Maass adjoint gamma completion of a supplied finite continuation. -/
def maassAdjointCompletion (finite : ℂ → ℂ) (r : ℝ) (s : ℂ) : ℂ :=
  Complex.Gammaℝ s * Complex.Gammaℝ (s+2*Complex.I*r) *
    Complex.Gammaℝ (s-2*Complex.I*r) * finite s

/-- The completed adjoint value at one includes the hyperbolic-cosine gamma factor. -/
theorem MaassAdjointLFunction.at_one (finite : ℂ → ℂ) (r : ℝ) :
    maassAdjointCompletion finite r 1 = finite 1 / (Real.cosh (Real.pi*r) : ℂ) := by sorry

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

/-- The matrix integral is additive in its integrable coefficient input. -/
theorem GodementJacquetIntegral.bilinear {G : Type*} [MeasurableSpace G]
    (n : ℕ) (μ : Measure G) (β₁ β₂ Φ : G → ℂ) (a : G → ℝ) (s : ℂ)
    (h₁ : Integrable (fun g => β₁ g*Φ g*(a g : ℂ)^(s+((n : ℂ)-1)/2)) μ)
    (h₂ : Integrable (fun g => β₂ g*Φ g*(a g : ℂ)^(s+((n : ℂ)-1)/2)) μ) :
    GodementJacquetIntegral n μ (β₁+β₂) Φ a s =
      GodementJacquetIntegral n μ β₁ Φ a s+GodementJacquetIntegral n μ β₂ Φ a s := by sorry

/-- The reciprocal Hecke polynomial with the unitary determinant normalization. -/
theorem MaassStandardLFunction.euler (A : ℂ) (q : ℝ) (hq : 0 < q) (s : ℂ) :
    StandardLocalLFactor (1-Polynomial.C A*Polynomial.X+Polynomial.X^2) q s =
      (1-A*(q : ℂ)^(-s)+(q : ℂ)^(-2*s))⁻¹ := by sorry

/-- Products of entire functions with centered order at most one retain that bound. -/
theorem IsCenteredOrderOne.mul {f g : ℂ → ℂ}
    (hf : IsCenteredOrderOne f) (hg : IsCenteredOrderOne g) :
    IsCenteredOrderOne (fun z => f z * g z) := by sorry

/-- Translating the centre preserves the entire order-one bound. -/
theorem IsCenteredOrderOne.translate {f : ℂ → ℂ} (hf : IsCenteredOrderOne f) (a : ℂ) :
    IsCenteredOrderOne (fun z => f (z + a)) := by sorry

/-- Polynomial functions satisfy the centered order-one bound. -/
theorem IsCenteredOrderOne.polynomial (P : Polynomial ℂ) :
    IsCenteredOrderOne (fun z => P.eval z) := by sorry

end TauCeti.AutomorphicLFunctions.AL2

/-! ## Layer AL.3: Rankin–Selberg formulas and rational factors -/

namespace TauCeti.AutomorphicLFunctions.AL3

/-- A complex-valued function has a finite bound on every closed vertical strip. -/
def BoundedOnStrips (f : ℂ → ℂ) : Prop :=
  ∀ a b : ℝ, ∃ C : ℝ, 0 ≤ C ∧ ∀ s : ℂ, a ≤ s.re → s.re ≤ b → ‖f s‖ ≤ C

/-- Products preserve boundedness on each finite vertical strip. -/
theorem BoundedOnStrips.mul {f g : ℂ → ℂ}
    (hf : BoundedOnStrips f) (hg : BoundedOnStrips g) :
    BoundedOnStrips (fun s => f s * g s) := by sorry

/-- A complex translation carries a finite vertical strip to another finite vertical strip. -/
theorem BoundedOnStrips.translate {f : ℂ → ℂ} (hf : BoundedOnStrips f) (t : ℂ) :
    BoundedOnStrips (fun s => f (s + t)) := by sorry

/-- Reflection in a real centre preserves boundedness on finite vertical strips. -/
theorem BoundedOnStrips.reflect {f : ℂ → ℂ} (hf : BoundedOnStrips f) (c : ℝ) :
    BoundedOnStrips (fun s => f (2 * (c : ℂ) - s)) := by sorry

/-- A nontrivial cubic degree character distinguishes geometric from arithmetic
Frobenius through its local polynomial at a degree-one place. -/
theorem UnramifiedRankOneReciprocity.constant_field_inversion (ζ : ℂ)
    (hζ : ζ ^ 3 = 1) (hne : ζ ≠ 1) :
    (1 - Polynomial.C ζ * Polynomial.X : Polynomial ℂ) ≠
      1 - Polynomial.C (ζ⁻¹) * Polynomial.X := by sorry

/-- Evaluate a linear functional along a representation orbit. -/
def whittakerFunction {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ) (v : V) (g : G) : ℂ := ℓ (ρ g v)

/-- A Whittaker functional gives the prescribed left unipotent equivariance of orbit functions. -/
theorem WhittakerModel.equivariance {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (N : Submonoid G) (ψ : N →* ℂ) (h : ∀ u : N, ∀ v, ℓ (ρ u v) = ψ u*ℓ v)
    (u : N) (v : V) (g : G) :
    whittakerFunction ρ ℓ v (u*g) = ψ u*whittakerFunction ρ ℓ v g := by sorry

/-- The representation action becomes right translation of its Whittaker functions. -/
theorem WhittakerModel.right_action {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (v : V) (g h : G) : whittakerFunction ρ ℓ (ρ h v) g =
      whittakerFunction ρ ℓ v (g*h) := by sorry

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

/-- The tensor local factor has pairwise products of the two Satake root families. -/
theorem RsLocalFactor.unramified {ι κ : Type*} [Fintype ι] [Fintype κ]
    (α : ι → ℂ) (β : κ → ℂ) (q : ℝ) (s : ℂ) :
    TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor (∏ i, ∏ j, (1-Polynomial.C (α i*β j)*Polynomial.X)) q s =
      ∏ i, ∏ j, (1-α i*β j*(q : ℂ)^(-s))⁻¹ := by sorry
/-- Theta Mellin expression on the supplied idele-class measure. -/
def MirabolicEisensteinSeries {C : Type*} [MeasurableSpace C]
    (μ : Measure C) (n : ℕ) (absDet : ℝ) (a : C → ℝ)
    (θ₀ η : C → ℂ) (s : ℂ) : ℂ :=
  (absDet : ℂ)^s * ∫ x, θ₀ x*(a x : ℂ)^((n : ℂ)*s)*η x ∂μ

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

/-- Polynomial root multiplicities in the open unit disc. -/
def OpenDiscZeroPoleIndex (P Q : Polynomial ℂ) : ℤ :=
  ((P.roots.filter (fun z => ‖z‖ < 1)).card : ℤ)-
    ((Q.roots.filter (fun z => ‖z‖ < 1)).card : ℤ)

/-- Native analytic divisor compared with finite polynomial multiplicities. -/
theorem OpenDiscZeroPoleIndex.divisor (P Q : Polynomial ℂ) (hP : P ≠ 0) (hQ : Q ≠ 0) :
    OpenDiscZeroPoleIndex P Q =
      ∑ z ∈ ((P.roots+Q.roots).toFinset.filter (fun z => ‖z‖ < 1)),
        MeromorphicOn.divisor (fun w => P.eval w / Q.eval w) Set.univ z := by sorry

/-- Equal nonzero rational presentations have the same open-disc divisor index. -/
theorem OpenDiscZeroPoleIndex.presentation (P Q P' Q' : Polynomial ℂ)
    (hP : P ≠ 0) (hQ : Q ≠ 0) (hP' : P' ≠ 0) (hQ' : Q' ≠ 0)
    (h : P*Q' = P'*Q) : OpenDiscZeroPoleIndex P Q = OpenDiscZeroPoleIndex P' Q' := by sorry

/-- Multiplication adds open-disc zero-pole indices, including common-root cancellation. -/
theorem OpenDiscZeroPoleIndex.mul (P Q P' Q' : Polynomial ℂ)
    (hP : P ≠ 0) (hQ : Q ≠ 0) (hP' : P' ≠ 0) (hQ' : Q' ≠ 0) :
    OpenDiscZeroPoleIndex (P*P') (Q*Q') =
      OpenDiscZeroPoleIndex P Q+OpenDiscZeroPoleIndex P' Q' := by sorry

/-- Inverting a rational presentation negates its open-disc index. -/
theorem OpenDiscZeroPoleIndex.inv (P Q : Polynomial ℂ) :
    OpenDiscZeroPoleIndex Q P = -OpenDiscZeroPoleIndex P Q := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.boundary_excluded
example : OpenDiscZeroPoleIndex (Polynomial.X-1) 1 = 0 := by
  change OpenDiscZeroPoleIndex (Polynomial.X - Polynomial.C (1 : ℂ)) 1 = 0
  unfold OpenDiscZeroPoleIndex
  rw [Polynomial.roots_X_sub_C, Polynomial.roots_one]
  norm_num

-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.cancelled_presentation
example : OpenDiscZeroPoleIndex Polynomial.X Polynomial.X = 0 := by
  simp [OpenDiscZeroPoleIndex]

/-- A nonzero functional on an irreducible representation gives an injective realization. -/
theorem WhittakerModel.realization {G V : Type*} [Group G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (hne : ℓ ≠ 0)
    (hirr : ∀ U : Submodule ℂ V, (∀ g v, v ∈ U → ρ g v ∈ U) → U = ⊥ ∨ U = ⊤) :
    Function.Injective (fun v => whittakerFunction ρ ℓ v) := by sorry

/-- A determinant norm twist translates the unequal-rank integral variable. -/
theorem RsLocalIntegrals.twist {Q M : Type*} [MeasurableSpace Q] [MeasurableSpace M]
    (n m : ℕ) (μ : Measure Q) (ν : Measure M) (W : Q → M → ℂ)
    (W' : Q → ℂ) (a : Q → ℝ) (ha : ∀ g, 0 < a g) (s t : ℂ) :
    RsLocalIntegrals n m μ ν (fun g x => W g x*(a g : ℂ)^t) W' a s =
      RsLocalIntegrals n m μ ν W W' a (s+t) := by sorry

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

/-- Specified nonzero infinity generators determine a unique comparison scalar
under the twisting isomorphism. The compatible choice has scalar one. -/
theorem RationalPeriodComparison.infinity_scalar
    {H Hξ : Type*} [AddCommGroup H] [Module ℂ H]
    [AddCommGroup Hξ] [Module ℂ Hξ] [FiniteDimensional ℂ Hξ]
    (hdim : Module.finrank ℂ Hξ = 1) (Tξ : H ≃ₗ[ℂ] Hξ)
    (w : H) (hw : w ≠ 0) (wξ : Hξ) (hwξ : wξ ≠ 0) :
    ∃! a : ℂˣ, wξ = (a : ℂ) • Tξ w := by sorry

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

/-- The normalized period evaluates the continued quotient on every vector,
including when the unnormalized period and local factor vanish together. -/
theorem NormalizedRsPeriod.continued_value {V : Type*} [AddCommGroup V] [Module ℂ V]
    (N : ℂ → V →ₗ[ℂ] ℂ) (A : ℂ → V →ₗ[ℂ] ℂ) (L : ℂ → ℂ)
    (hN : ∀ v, AnalyticAt ℂ (fun s => N s v) 0)
    (hA : ∀ v, AnalyticAt ℂ (fun s => A s v) 0) (hL : AnalyticAt ℂ L 0)
    (h : ∀ v, (fun s => A s v) =ᶠ[𝓝[≠] 0] fun s => L s * N s v) (v : V) :
    A 0 v = L 0 * NormalizedRsPeriod N v := by sorry

/-- A nondegenerate alternating pairing of similitude q gives the self-pair
reciprocity polynomial in every even dimension. -/
theorem FunctionFieldSelfPairReflection (g : ℕ) (q : ℝ) (hq : 1 < q)
    (A J : Matrix (Fin (2 * g)) (Fin (2 * g)) ℂ)
    (hJ : IsUnit J) (halt : J.transpose = -J)
    (hsim : A.transpose * J * A = (q : ℂ) • J) (z : ℂ) (hz : z ≠ 0) :
    A.charpolyRev.eval z = (q : ℂ)^g * z^(2 * g) *
      A.charpolyRev.eval (1 / ((q : ℂ) * z)) := by sorry

/-- Weight-one eigenvalues give reciprocal-polynomial roots of modulus q to minus one half. -/
theorem FunctionFieldSelfPairReflection.root_norm {ι : Type*} [Fintype ι] [DecidableEq ι]
    (q : ℝ) (hq : 1 < q) (A : Matrix ι ι ℂ)
    (hweight : ∀ a ∈ A.charpoly.roots, ‖a‖ = Real.sqrt q)
    (z : ℂ) (hz : A.charpolyRev.IsRoot z) : ‖z‖ = (Real.sqrt q)⁻¹ := by sorry

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

/-- Scalar twisting substitutes cT in the reversed characteristic polynomial. -/
theorem LGroupLocalFactor.scalar_twist {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℂ) (c : ℂ) :
    Matrix.charpolyRev (c • A) = A.charpolyRev.comp (Polynomial.C c * Polynomial.X) := by sorry

/-- Tensoring Satake operators multiplies their eigenvalues with multiplicity.
The formula holds for arbitrary complex matrices, including nontrivial Jordan blocks. -/
theorem LGroupLocalFactor.tensor {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (A : Matrix ι ι ℂ) (B : Matrix κ κ ℂ) :
    (Matrix.kronecker A B).charpolyRev =
      (A.charpoly.roots.map (fun a =>
        (B.charpoly.roots.map (fun b =>
          (1 - Polynomial.C (a * b) * Polynomial.X : Polynomial ℂ))).prod)).prod := by sorry

/-- The dual of an invertible Satake operator has reciprocal roots with multiplicity. -/
theorem LGroupLocalFactor.dual {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℂ) (hA : IsUnit A) :
    A⁻¹.charpolyRev = (A.charpoly.roots.map (fun a =>
      (1 - Polynomial.C (a⁻¹) * Polynomial.X : Polynomial ℂ))).prod := by sorry

/-- Applying a coefficient embedding commutes with the determinant polynomial. -/
theorem LGroupLocalFactor.coefficient_embedding {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℂ) (σ : ℂ →+* ℂ) :
    (A.map σ).charpolyRev = A.charpolyRev.map σ := by sorry

end TauCeti.AutomorphicLFunctions.AL4

/-! ## Layer AL.5: Euler corrections and critical values -/

namespace TauCeti.AutomorphicLFunctions.AL5

/-- The product of local denominator polynomials at removed places. -/
def FiniteEulerCorrection {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (s : ℂ) : ℂ := ∏ v ∈ S, (P v).eval ((q v : ℂ)^(-s))

/-- Removing no places gives the identity correction. -/
theorem FiniteEulerCorrection.empty {ι : Type*} (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (s : ℂ) : FiniteEulerCorrection ∅ P q s = 1 := by sorry

/-- Disjoint sets of removed places multiply their finite corrections. -/
theorem FiniteEulerCorrection.union {ι : Type*} [DecidableEq ι]
    (S T : Finset ι) (h : Disjoint S T) (P : ι → Polynomial ℂ) (q : ι → ℝ) (s : ℂ) :
    FiniteEulerCorrection (S∪T) P q s =
      FiniteEulerCorrection S P q s*FiniteEulerCorrection T P q s := by sorry

/-- The two corrections for a good-prime primitive GL₂ newform and a chosen refinement. -/
def OrdinaryGl2EulerFactor (p : ℝ) (k j : ℕ) (α χp χinvp εp : ℂ) : ℂ :=
  (1-χp*(p : ℂ)^j/α)*(1-χinvp*εp*(p : ℂ)^(k-j)/α)

/-- Zero-extended ramified character values remove both good-prime correction factors. -/
theorem OrdinaryGl2EulerFactor.ramified (p : ℝ) (k j : ℕ) (α εp : ℂ) :
    OrdinaryGl2EulerFactor p k j α 0 0 εp = 1 := by sorry

/-- The trivial character gives the two factors of the primitive newform correction. -/
theorem OrdinaryGl2EulerFactor.unramified (p : ℝ) (k j : ℕ) (α εp : ℂ) :
    OrdinaryGl2EulerFactor p k j α 1 1 εp =
      (1-(p : ℂ)^j/α)*(1-εp*(p : ℂ)^(k-j)/α) := by sorry

/-- The central-sign argument uses an actual functional equation hypothesis. -/
theorem CentralSignVanishing (Λ : ℂ → ℂ) (h : ∀ s, Λ s = -Λ (1-s)) :
    Λ (1/2) = 0 := by sorry

/-- Reflection in the centre forces the root-number parity on each Taylor derivative. -/
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
    (1 : ℂ)^2-a 3*1+3 ≠ 0 := by
  norm_num [pStabilizedCoeff, h₁, h₃]

example (a : ℕ → ℂ) (p : ℕ) (hp : 1 < p) (α β : ℂ)
    (h₁ : a 1 = 1) (hpcoeff : a p = α + β) :
    pStabilizedCoeff a p β p = α := by
  have hp0 : 0 < p := by omega
  simp [pStabilizedCoeff, Nat.div_self hp0, h₁, hpcoeff]

/-- Multiplication by a finite correction adds its meromorphic order to the L-function order. -/
theorem FiniteEulerCorrection.orders {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (L : ℂ → ℂ) (s₀ : ℂ)
    (hE : MeromorphicAt (FiniteEulerCorrection S P q) s₀) (hL : MeromorphicAt L s₀) :
    meromorphicOrderAt (fun s => FiniteEulerCorrection S P q s*L s) s₀ =
      meromorphicOrderAt (FiniteEulerCorrection S P q) s₀+meromorphicOrderAt L s₀ := by sorry

/-- A continued imprimitive identity evaluates at a point where all representatives are analytic. -/
theorem FiniteEulerCorrection.value {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (L Lpartial : ℂ → ℂ) (s₀ : ℂ)
    (hE : AnalyticAt ℂ (FiniteEulerCorrection S P q) s₀)
    (hL : AnalyticAt ℂ L s₀) (hL' : AnalyticAt ℂ Lpartial s₀)
    (h : Lpartial =ᶠ[𝓝[≠] s₀] fun s => FiniteEulerCorrection S P q s*L s) :
    Lpartial s₀ = FiniteEulerCorrection S P q s₀*L s₀ := by sorry

/-- A vanishing Euler correction leaves only its derivative times the original value. -/
theorem EulerCorrectionLeadingTerm (E L : ℂ → ℂ) (s₀ : ℂ)
    (hE : DifferentiableAt ℂ E s₀) (hL : DifferentiableAt ℂ L s₀) (hz : E s₀ = 0) :
    deriv (fun s => E s*L s) s₀ = deriv E s₀*L s₀ := by sorry

/-- The second primitive-newform correction is the stabilization factor for the other Hecke root. -/
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

/-- The first nonzero Taylor coefficient of a product is the product of those
of its two factors, with the sum of their finite vanishing orders. -/
theorem EulerCorrectionLeadingTerm.taylor (E L : ℂ → ℂ) (s₀ : ℂ) (m r : ℕ)
    (hE : AnalyticAt ℂ E s₀) (hL : AnalyticAt ℂ L s₀)
    (hEm : iteratedDeriv m E s₀ ≠ 0) (hLr : iteratedDeriv r L s₀ ≠ 0)
    (hE0 : ∀ j < m, iteratedDeriv j E s₀ = 0)
    (hL0 : ∀ j < r, iteratedDeriv j L s₀ = 0) :
    (∀ j < m + r, iteratedDeriv j (fun s => E s * L s) s₀ = 0) ∧
    iteratedDeriv (m + r) (fun s => E s * L s) s₀ / ((m + r).factorial : ℂ) =
      (iteratedDeriv m E s₀ / (m.factorial : ℂ)) *
        (iteratedDeriv r L s₀ / (r.factorial : ℂ)) ∧
    iteratedDeriv (m + r) (fun s => E s * L s) s₀ ≠ 0 := by sorry

/-- The derivative of a simple removed Euler zero is the logarithm of its residue size. -/
theorem EulerCorrectionLeadingTerm.euler_zero (q : ℝ) (hq : 1 < q) (a s₀ : ℂ)
    (hz : a * (q : ℂ)^(-s₀) = 1) :
    HasDerivAt (fun s : ℂ => 1 - a * (q : ℂ)^(-s)) (Real.log q : ℂ) s₀ := by sorry

/-- Coefficients at indices prime to p survive stabilization unchanged. -/
theorem pStabilizedCoeff.not_dvd (a : ℕ → ℂ) (p : ℕ) (β : ℂ) (n : ℕ)
    (hn : ¬ p ∣ n) : pStabilizedCoeff a p β n = a n := by sorry

/-- At multiples of p stabilization subtracts the rescaled old coefficient. -/
theorem pStabilizedCoeff.mul (a : ℕ → ℂ) (p : ℕ) (hp : 0 < p) (β : ℂ) (n : ℕ) :
    pStabilizedCoeff a p β (p * n) = a (p * n) - β * a n := by sorry

end TauCeti.AutomorphicLFunctions.AL5

/-
README.md states the full local-field, representation and Weyl-group interfaces:

AL.0: `SelfDualHaar.character_scale` fixes Haar rescaling for ψ_a.
AL.2: `StandardLocalLFactor.normalized_zeta` is the continued test-integral quotient.
AL.3: `RsLocalIntegrals.equal_rank` and `RsLocalIntegrals.j_range` specify the actual
quotient and block embeddings. `MirabolicEisensteinSeries.parabolic_sum` and
`MirabolicEisensteinSeries.nontrivial_normone` specify unfolding and zero-mode poles.
`NormalizedRsPeriod.tempered_half_plane` fixes the convergence domain.
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

/-- The unit-ideal lower-left congruence condition gives the whole integral group. -/
theorem k0_top : k0 (⊤ : Ideal R) = ⊤ := by sorry

/-- The unit-ideal last-row congruence condition gives the whole integral group. -/
theorem k1_top : k1 (⊤ : Ideal R) = ⊤ := by sorry

/-- The last-row subgroup is contained in the lower-left subgroup at the same ideal. -/
theorem k1_le_k0 (I : Ideal R) : k1 I ≤ k0 I := by sorry

/-- Every integral upper unipotent satisfies the last-row conditions at every ideal. -/
theorem upperRightHom_mem_k1 (I : Ideal R) (x : R) :
    GeneralLinearGroup.upperRightHom x ∈ k1 I := by sorry

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

/-- An intertwining linear equivalence preserves the least nonzero fixed level. -/
theorem conductor_iso {W : Type*} [AddCommGroup W] [Module ℂ W]
    (π : Representation ℂ G V) (τ : Representation ℂ G W) (K : ℕ → Subgroup G)
    (e : V ≃ₗ[ℂ] W) (he : ∀ g v, e (π g v) = τ g (e v))
    (hπ : ∃ n, ∃ v ∈ Representation.invariants (π.comp (K n).subtype), v ≠ 0)
    (hτ : ∃ n, ∃ v ∈ Representation.invariants (τ.comp (K n).subtype), v ≠ 0) :
    conductorExponent π K hπ = conductorExponent τ K hτ := by sorry

/-- A twist trivial on every level subgroup preserves the conductor exponent.
Unramified determinant characters are trivial on the integral congruence subgroups. -/
theorem conductor_unramified_twist (π τ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (χ : G →* ℂˣ) (htwist : ∀ g v, τ g v = (χ g : ℂ) • π g v)
    (hχ : ∀ n g, g ∈ K n → χ g = 1)
    (hπ : ∃ n, ∃ v ∈ Representation.invariants (π.comp (K n).subtype), v ≠ 0)
    (hτ : ∃ n, ∃ v ∈ Representation.invariants (τ.comp (K n).subtype), v ≠ 0) :
    conductorExponent π K hπ = conductorExponent τ K hτ := by sorry

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

/-- Depth-zero K₀ is the image of the full integral general linear group. -/
theorem localK0_zero : localK0 F 0 =
    (GeneralLinearGroup.map (algebraMap 𝒪[F] F)).range := by sorry

/-- Depth-zero K₁ is the image of the full integral general linear group. -/
theorem localK1_zero : localK1 F 0 =
    (GeneralLinearGroup.map (algebraMap 𝒪[F] F)).range := by sorry

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
ideal. Equivariance uses Mathlib's upper-unipotent homomorphism. Existence of this
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
    (hwhit : ∀ (x : F) (v : V),
      ell (π (GeneralLinearGroup.upperRightHom x) v) = ψ x * ell v) :
    ∃ v : Representation.invariants (π.comp (localK1 F
      (conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf))).subtype), ell v.val ≠ 0 := by sorry

end LocalNewvectors


section NormalizedLine
variable {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- The vector of value one for a nonzero functional on a one-dimensional line. -/
def normalizedNewvector (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) : L := by
  classical
  have hex : ∃ v : L, ell v ≠ 0 := by
    by_contra h
    apply hell
    ext v
    simpa using (not_exists.mp h v)
  let v := Classical.choose hex
  let _ := hdim
  exact (ell v)⁻¹ • v

/-- The normalized vector has value one under the specified functional. -/
theorem normalizedNewvector_eval (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) :
    ell (normalizedNewvector L ell hdim hell) = 1 := by sorry

/-- A value-one vector on the line is the normalized vector. -/
theorem normalizedNewvector_unique (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) (v : L) (hv : ell v = 1) :
    v = normalizedNewvector L ell hdim hell := by sorry

/-- Scaling the Whittaker functional inversely rescales its value-one vector. -/
theorem normalizedNewvector_scale (L : Submodule ℂ V) (ell : L →ₗ[ℂ] ℂ)
    (hdim : Module.finrank ℂ L = 1) (hell : ell ≠ 0) (a : ℂ) (ha : a ≠ 0)
    (hscaled : a • ell ≠ 0) :
    normalizedNewvector L (a • ell) hdim hscaled =
      a⁻¹ • normalizedNewvector L ell hdim hell := by sorry

end NormalizedLine


/- The full API also includes normalizedNewvector_fixed and normalizedNewvector_twist, with the hypotheses
and last-row convention specified in README AL.2 / GL₂ newvectors. -/

end TauCeti.GL2Blueprint
