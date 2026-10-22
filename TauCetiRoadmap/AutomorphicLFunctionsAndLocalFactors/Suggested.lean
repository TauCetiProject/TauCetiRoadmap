import Mathlib
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.FiniteComponent
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.InfinityType

/-!
# Automorphic L-functions and local factors: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These statements give acceptance goals on the pinned Mathlib and Tau Ceti carriers.

AL.0 states the finite-jet theorem for point-supported tempered distributions, the half-order
K-Bessel derivative and the Bessel–Laplace Mellin identity. AL.1 states local eigenline
uniqueness, Tate continuation and its local functional equation at every place, and Hecke
continuation with the conductor-balanced functional equation for every unitary idele-class
character, its polar divisor and complex norm twists. AL.2 states the paired Hadamard theorem
and its positivity conclusions, the generic newform line in every positive rank, and Casselman's
full GL₂ fixed-space dimension and central-character theorems. The local-field statements allow
both characteristics. All definitions below have bodies on native carriers.

The vector-space adelic Poisson theorem needs the supplied adelic Schwartz space and its
completed tensor/Fourier realization, absent at these pins. The all-place Godement–Jacquet
and Rankin–Selberg theorems, multiplicity one, converse theorems and rational-period twisting
need smooth automorphic cuspidal representations, restricted tensor Whittaker models and
archimedean globalizations/cohomological rational structures. Those carriers are absent, as is
the normalized Maass eigenform carrier needed for the Maass functional equation and norm formula.
The arithmetic identification of the local gamma scalar and the global root number needs the
supplied `tateLocalConstant` and standard-vector comparisons, also absent at the pins.

AL.3's curve reciprocity and pure realization, intersection-complex purity, shtuka comparison,
cuspidal polynomial degree and Riemann-hypothesis statements need lisse adic sheaves,
intermediate extensions, their weight/cohomology theory and shtuka spaces with Hecke actions.
AL.4's actual Satake/L-group and Weil–Deligne comparisons need those parameter carriers.
AL.5's automorphic period, stabilization and conductor comparisons need the preceding
representations and rational period structures. These headline results are deferred as Lean
statements until their objects exist. Scalar determinant operations, finite correction identities
and scalar division/sign consequences do not replace them.
-/

noncomputable section
open MeasureTheory
open scoped Topology NNReal ENNReal NumberField

namespace TauCeti.AutomorphicLFunctions.AL0

/-- Half-integral adapter to AutomorphicFormsOnReductiveGroups §4.5's cosh Bessel kernel,
    with complex order and positive real argument in the public API. -/
def BesselK (ν : ℂ) (c : ℝ) : ℂ :=
  (1/2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹)/2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)

/-- Real exponential integral Ei(-r), only r>0 is used. -/
def negativeEi (r : ℝ) : ℝ := -(∫ t : ℝ in Set.Ioi r, Real.exp (-t)/t)

/-- The order derivative at one half is expressed by the negative exponential integral. -/
theorem BesselHalfOrderDerivative {c : ℝ} (hc : 0 < c) :
    deriv (fun ν : ℂ => BesselK ν c) (1/2) =
      (-(Real.sqrt (Real.pi/2)*Real.exp c*c^(-1/2 : ℝ)*negativeEi (2*c)) : ℝ) := by sorry

/-- Gross–Zagier's Laplace–Mellin integral, with the same K convention. -/
theorem BesselLaplaceMellin (m t : ℝ) (s : ℂ) (hm : 0 < m) (ht : 0 < t)
    (hs : t < s.re) :
    (∫ y : ℝ in Set.Ioi 0, (y : ℂ)^(s-1/2)*BesselK (t+1/2) (2*Real.pi*m*y)*
      Complex.exp (-2*Real.pi*m*y)) =
    (Real.sqrt Real.pi : ℂ)*Complex.Gamma (s+t+1)*Complex.Gamma (s-t)/
      (Complex.Gamma (s+1)*(4*Real.pi*m : ℂ)^(s+1/2)) := by sorry

/-- A point-supported tempered distribution depends on only finitely many derivatives.
The vanishing-jet form applies in every finite real dimension. -/
theorem pointSupported_finiteJet {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (T : TemperedDistribution E ℂ)
    (hT : Distribution.dsupport (fun f : SchwartzMap E ℂ => T f) ⊆ {0}) :
    ∃ N : ℕ, ∀ f : SchwartzMap E ℂ,
      (∀ k ≤ N, iteratedFDeriv ℝ k f 0 = 0) → T f = 0 := by sorry

end TauCeti.AutomorphicLFunctions.AL0

namespace TauCeti.TateZeta

/-- Inverse scalar multiplication on an archimedean field, as a real linear homeomorphism. -/
def inverseScalar {F : Type*} [RCLike F] (a : Fˣ) : F ≃L[ℝ] F :=
  ((LinearEquiv.smulOfUnit (M := F) a⁻¹).restrictScalars ℝ).toContinuousLinearEquiv

/-- The continuous eigendistributions for inverse scalar pullback on an archimedean field.
The pullback is the actual real linear homeomorphism x ↦ a⁻¹x. -/
def archimedeanEigenSpace {F : Type*} [RCLike F]
    (χ : Fˣ →ₜ* ℂˣ) : Submodule ℂ (TemperedDistribution F ℂ) where
  carrier := {T | ∀ a f, T (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (inverseScalar a) f) =
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

/-- AL.1/local-uniqueness-theorem: every archimedean quasi-character has a
one-dimensional continuous eigendistribution space. -/
theorem archimedeanEigenSpace.finrank {F : Type*} [RCLike F]
    (χ : Fˣ →ₜ* ℂˣ) : Module.finrank ℂ (archimedeanEigenSpace χ) = 1 := by
  sorry

/-- The local Tate integral on the multiplicative group of a local field. -/
def localZetaIntegral {F : Type*} [Field F] [TopologicalSpace F] [MeasurableSpace F]
    (ν : Measure Fˣ) (a : F → ℝ) (χ : Fˣ →ₜ* ℂˣ) (f : F → ℂ) (s : ℂ) : ℂ :=
  ∫ x : Fˣ, f x * (χ x : ℂ) * (a x : ℂ)^s ∂ν

/-- Meromorphic continuation and the positive-kernel local functional equation,
with a common gamma factor for every Schwartz–Bruhat test function. -/
theorem localZetaIntegral_functionalEquation {F : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [MeasurableSpace F] [BorelSpace F]
    (μ : Measure F) [μ.IsAddHaarMeasure] (ν : Measure Fˣ) [ν.IsHaarMeasure]
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μ ((x * ·) '' U) = ENNReal.ofReal (a x) * μ U)
    (χ : Fˣ →ₜ* ℂˣ) (r : ℝ) (hχ : ∀ x : Fˣ, ‖(χ x : ℂ)‖ = (a x)^r) :
    ∃ γ : ℂ → ℂ, MeromorphicOn γ Set.univ ∧
      (∃ s : ℂ, AnalyticAt ℂ γ s ∧ γ s ≠ 0) ∧
      ∀ f : F → ℂ, IsLocallyConstant f → HasCompactSupport f →
        ∃ Z Zhat : ℂ → ℂ, MeromorphicOn Z Set.univ ∧ MeromorphicOn Zhat Set.univ ∧
          (∀ s : ℂ, 0 < s.re + r →
            Integrable (fun x : Fˣ => f x * (χ x : ℂ) * (a x : ℂ)^s) ν ∧
            Z s = localZetaIntegral ν a χ f s) ∧
          (∀ s : ℂ, r < s.re →
            Integrable (fun x : Fˣ =>
              VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x) *
                ((χ x)⁻¹ : ℂ) * (a x : ℂ)^s) ν ∧
            Zhat s = localZetaIntegral ν a χ⁻¹
              (fun x => VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x)) s) ∧
          ∀ s₀ : ℂ, (fun s => Zhat (1 - s)) =ᶠ[𝓝[≠] s₀] fun s => γ s * Z s := by
  sorry

/-- AL.1/rank-one-local-functional-equation at the real and complex places:
meromorphic continuation and one gamma factor for every native Schwartz function. -/
theorem archimedeanLocalFunctionalEquation {F : Type*} [RCLike F]
    [MeasurableSpace F] [BorelSpace F]
    (μ : Measure F) [μ.IsAddHaarMeasure] (ν : Measure Fˣ) [ν.IsHaarMeasure]
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μ ((x * ·) '' U) = ENNReal.ofReal (a x) * μ U)
    (χ : Fˣ →ₜ* ℂˣ) (r : ℝ) (hχ : ∀ x : Fˣ, ‖(χ x : ℂ)‖ = (a x)^r) :
    ∃ γ : ℂ → ℂ, MeromorphicOn γ Set.univ ∧
      (∃ s : ℂ, AnalyticAt ℂ γ s ∧ γ s ≠ 0) ∧
      ∀ f : SchwartzMap F ℂ,
        ∃ Z Zhat : ℂ → ℂ, MeromorphicOn Z Set.univ ∧ MeromorphicOn Zhat Set.univ ∧
          (∀ s : ℂ, 0 < s.re + r →
            Integrable (fun x : Fˣ => f x * (χ x : ℂ) * (a x : ℂ)^s) ν ∧
            Z s = localZetaIntegral ν a χ f s) ∧
          (∀ s : ℂ, r < s.re →
            Integrable (fun x : Fˣ =>
              VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x) *
                ((χ x)⁻¹ : ℂ) * (a x : ℂ)^s) ν ∧
            Zhat s = localZetaIntegral ν a χ⁻¹
              (fun x => VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x)) s) ∧
          ∀ s₀ : ℂ, (fun s => Zhat (1 - s)) =ᶠ[𝓝[≠] s₀] fun s => γ s * Z s := by
  sorry

/-- Nonarchimedean Schwartz functions on native locally constant functions. -/
def finiteSchwartzSpace (F : Type*) [TopologicalSpace F] : Submodule ℂ (LocallyConstant F ℂ) where
  carrier := {f | HasCompactSupport f}
  zero_mem' := HasCompactSupport.zero
  add_mem' := by intro f g hf hg; exact hf.add hg
  smul_mem' := by
    intro c f hf
    change HasCompactSupport (fun x => c * f x)
    exact HasCompactSupport.mul_left hf

/-- Inverse scalar pullback preserves compactly supported locally constant functions. -/
def finitePullback {F : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F]
    (a : Fˣ) (f : finiteSchwartzSpace F) : finiteSchwartzSpace F :=
  ⟨LocallyConstant.comap
      ⟨Homeomorph.mulLeft₀ (a⁻¹ : Fˣ).val (Units.ne_zero _),
        (Homeomorph.mulLeft₀ (a⁻¹ : Fˣ).val (Units.ne_zero _)).continuous⟩ f.val,
    f.property.comp_homeomorph (Homeomorph.mulLeft₀ (a⁻¹ : Fˣ).val (Units.ne_zero _))⟩

/-- The scalar eigenspace in the algebraic dual of the finite-place Schwartz space. -/
def finiteEigenSpace {F : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F]
    (χ : Fˣ →ₜ* ℂˣ) : Submodule ℂ (Module.Dual ℂ (finiteSchwartzSpace F)) where
  carrier := {T | ∀ a f, T (finitePullback a f) = (χ a : ℂ) * T f}
  zero_mem' := by simp
  add_mem' := by
    intro T S hT hS a f
    change T (finitePullback a f) + S (finitePullback a f) = (χ a : ℂ) * (T f + S f)
    rw [hT a f, hS a f, mul_add]
  smul_mem' := by
    intro c T hT a f
    change c * T (finitePullback a f) = _
    rw [hT a f]
    simp [mul_left_comm]

/-- Finite-place local uniqueness for every continuous quasi-character. -/
theorem finiteEigenSpace_finrank {F : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (χ : Fˣ →ₜ* ℂˣ) :
    Module.finrank ℂ (finiteEigenSpace χ) = 1 := by
  sorry

open IsDedekindDomain TauCeti.GlobalNumberFields
variable {K : Type*} [Field K] [NumberField K]

/-- The finite local factor, using a uniformizer at each finite completion. -/
def heckeFiniteFactor (χ : HeckeCharacter K)
    (ϖ : (v : HeightOneSpectrum (𝓞 K)) → (v.adicCompletion K)ˣ)
    (v : HeightOneSpectrum (𝓞 K)) (s : ℂ) : ℂ :=
  if χ.conductorExponent v = 0 then
    (1 - (χ.finiteComponent v (ϖ v) : ℂ) * (Ideal.absNorm v.asIdeal : ℂ)^(-s))⁻¹
  else 1

/-- Deligne's archimedean factors in the supplied continuous infinity coordinates.
The complex exponent in those coordinates uses the Euclidean absolute value. -/
def heckeArchFactor (χ : HeckeCharacter K) (s : ℂ) : ℂ := by
  classical
  letI := Fintype.ofFinite (NumberField.InfinitePlace K)
  exact (∏ w : {w : NumberField.InfinitePlace K // w.IsReal},
    Complex.Gammaℝ (s + χ.infinityType.realExponent w +
      ((χ.infinityType.realParity w).val : ℂ))) *
  ∏ w : {w : NumberField.InfinitePlace K // w.IsComplex},
    Complex.Gammaℂ (s + χ.infinityType.complexExponent w / 2 +
      ((χ.infinityType.complexAngularFrequency w).natAbs : ℂ) / 2)

/-- The conductor scale of the primitive balanced completion. -/
def heckeConductorScale (χ : HeckeCharacter K) : ℝ :=
  (NumberField.discr K).natAbs * Ideal.absNorm χ.finiteConductor

/-- Hecke continuation and functional equation for every unitary idele-class character,
including the translated poles of norm characters and all complex norm twists. -/
theorem heckeContinuation
    (ϖ : (v : HeightOneSpectrum (𝓞 K)) → (v.adicCompletion K)ˣ)
    (hϖ : ∀ v, Valued.v (ϖ v : v.adicCompletion K) = WithZero.exp (-1 : ℤ)) :
    ∃ Λ : HeckeCharacter K → ℂ → ℂ,
      ∀ χ : HeckeCharacter K, (∀ x, ‖(χ x : ℂ)‖ = 1) →
        MeromorphicOn (Λ χ) Set.univ ∧
        (∀ s : ℂ, 1 < s.re →
          Summable (fun v => ‖heckeFiniteFactor χ ϖ v s - 1‖) ∧
          HasProd (fun v => heckeFiniteFactor χ ϖ v s)
            (∏' v, heckeFiniteFactor χ ϖ v s) ∧
          Λ χ s = (heckeConductorScale χ : ℂ)^(s/2) * heckeArchFactor χ s *
            ∏' v, heckeFiniteFactor χ ϖ v s) ∧
        (∃ W : ℂ, ‖W‖ = 1 ∧ ∀ s₀ : ℂ,
          Λ χ =ᶠ[𝓝[≠] s₀] fun s => W * Λ χ⁻¹ (1-s)) ∧
        ((¬ ∃ t : ℝ, χ = HeckeCharacter.normPow K (Complex.I * (t : ℂ))) →
          Differentiable ℂ (Λ χ)) ∧
        (∀ t : ℝ, χ = HeckeCharacter.normPow K (Complex.I * (t : ℂ)) →
          meromorphicOrderAt (Λ χ) (-Complex.I * (t : ℂ)) = -1 ∧
          meromorphicOrderAt (Λ χ) (1-Complex.I * (t : ℂ)) = -1 ∧
          ∀ s : ℂ, s ≠ -Complex.I * (t : ℂ) → s ≠ 1-Complex.I * (t : ℂ) → AnalyticAt ℂ (Λ χ) s) ∧
        (∀ t s₀ : ℂ, (Λ (χ * HeckeCharacter.normPow K t)) =ᶠ[𝓝[≠] s₀]
          fun s => (heckeConductorScale χ : ℂ)^(-t/2) * Λ χ (s+t)) := by
  sorry

end TauCeti.TateZeta

namespace TauCeti.AutomorphicLFunctions.AL2

/-- Entire centered growth in the equivalent epsilon-bound form of the OrderLE predicate
supplied by ZerosOfLFunctions layer 0. -/
def IsCenteredOrderOne (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧ ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧
    ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * (1 + ‖z‖ ^ (1 + ε)))

/-- Paired-zero specialization of ZerosOfLFunctions layer 5.6 after removing the central
zero. Parity removes the linear exponential and eventual positivity fixes the constant.
Zero entries in γ encode unused indices when the zero multiset is finite. -/
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

open Matrix
open scoped ValuativeRel

/-- Matrices whose last row is the last standard basis row. -/
def lastRowStabilizer {R : Type*} [CommRing R] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin (n+1)) R) where
  carrier := {g | ∀ j, g (Fin.last n) j = if Fin.last n = j then 1 else 0}
  one_mem' := by intro j; simp [Matrix.one_apply]
  mul_mem' := by
    intro g h hg hh j
    change ∀ j, g (Fin.last n) j = if Fin.last n = j then 1 else 0 at hg
    change ∀ j, h (Fin.last n) j = if Fin.last n = j then 1 else 0 at hh
    change (g.val * h.val) (Fin.last n) j = _
    simp [Matrix.mul_apply, hg, hh]
  inv_mem' := by
    intro g hg j
    change ∀ j, g (Fin.last n) j = if Fin.last n = j then 1 else 0 at hg
    have h := congrArg (fun M : Matrix (Fin (n+1)) (Fin (n+1)) R => M (Fin.last n) j) g.val_inv
    simpa [Matrix.mul_apply, hg, Matrix.one_apply] using h

/-- The last-row congruence subgroup, defined by reduction modulo the ideal. -/
def newformK1 {R : Type*} [CommRing R] (n : ℕ) (I : Ideal R) :
    Subgroup (GeneralLinearGroup (Fin (n+1)) R) :=
  (lastRowStabilizer n).comap (GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Integral last-row level embedded in the local general linear group. -/
def newformLocalK1 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (n c : ℕ) :
    Subgroup (GeneralLinearGroup (Fin (n+1)) F) :=
  (newformK1 n (𝓂[F] ^ c)).map (GeneralLinearGroup.map (algebraMap 𝒪[F] F))

/-- The generic newform line in every positive rank, on native representations. -/
theorem genericNewform {F V : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [AddCommGroup V] [Module ℂ V] (n : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (n+1)) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin (n+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (ψ : AddChar F Circle) (hψ : Continuous ψ)
    (hψO : ∀ a : 𝒪[F], ψ (a : F) = 1)
    (hψp : ∃ x : F, (∀ a : 𝒪[F], a ∈ 𝓂[F] →
      x * (a : F) ∈ (𝒪[F] : Set F)) ∧ ψ x ≠ 1)
    (ell : V →ₗ[ℂ] ℂ) (hell : ell ≠ 0)
    (hwhit : ∀ (u : GeneralLinearGroup (Fin (n+1)) F),
      (∀ i j, j < i → u i j = 0) → (∀ i, u i i = 1) →
      ∀ v : V, ell (π u v) = (ψ (∑ i : Fin n, u i.castSucc i.succ) : ℂ) * ell v) :
    ∃ c : ℕ,
      (∀ m < c, Representation.invariants (π.comp (newformLocalK1 F n m).subtype) = ⊥) ∧
      Module.finrank ℂ (Representation.invariants (π.comp (newformLocalK1 F n c).subtype)) = 1 ∧
      ∃ v : Representation.invariants (π.comp (newformLocalK1 F n c).subtype), ell v.val ≠ 0 := by
  sorry

end TauCeti.AutomorphicLFunctions.AL2

namespace TauCeti.GL2Blueprint
open _root_.Matrix
open scoped ValuativeRel
variable {R : Type*} [CommRing R]
variable {F : Type*} [Field F] [ValuativeRel F]
  [TopologicalSpace F] [IsNonarchimedeanLocalField F]
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]

/-- The lower-left congruence subgroup of GL₂(R). Submonoid.units includes inversion;
for a 2×2 unit it is equivalent to the single entry condition in the last-row convention. -/
def k0 (I : Ideal R) : Subgroup (GeneralLinearGroup (Fin 2) R) :=
  ({ carrier := {M : Matrix (Fin 2) (Fin 2) R | M 1 0 ∈ I}
     one_mem' := by simp
     mul_mem' := by
       intro M N hM hN
       change (M * N) 1 0 ∈ I
       simpa [Matrix.mul_apply, Fin.sum_univ_two] using
         I.add_mem (I.mul_mem_right (N 0 0) hM) (I.mul_mem_left (M 1 1) hN)
   } : Submonoid (Matrix (Fin 2) (Fin 2) R)).units

/-- Rank two of the last-row level used by the all-rank generic newform theorem. -/
abbrev localK1 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (c : ℕ) :
    Subgroup (GeneralLinearGroup (Fin 2) F) :=
  TauCeti.AutomorphicLFunctions.AL2.newformLocalK1 F 1 c

/-- The least nonzero fixed level of a representation with an explicitly nonempty level set. -/
def conductorExponent (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) : ℕ := by
  classical
  exact Nat.find hex

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

end TauCeti.GL2Blueprint
