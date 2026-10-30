import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.AlmostComplex
import TauCeti.Geometry.Symplectic.Manifold.TwoForm

/-!
# Complex manifolds, Dolbeault theory, and Kähler geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib and Tau Ceti, the targets that are statable with the native
carriers: the real-analytic transitions of a complex manifold (K3.0), the
pointwise `∂̄` of a function and the Nijenhuis expression on vector fields with
its tensoriality (K1), the real-carrier Kähler condition, the bundled/unbundled
Euclidean Sobolev equivalence (K5a) and the complex-order Bessel multipliers.

Not statable at the pins, so nothing is stated in their place:
* the LF space of compactly supported smooth bundle sections, its dual space of
  bundle distributions, the localized Sobolev scale on a compact manifold and the
  complexification and conjugation of real bundle distributions (K5a): the pinned
  libraries have no inductive-limit topology on spaces of smooth sections;
* the density line of K5a: the pinned libraries have no density carrier
  (DifferentialGeometry DG0's `Density` is a roadmap target);
* the imaginary-order unitary `H^s → L²` comparison (K5a): it is a construction
  whose existence is itself a target, so it stays a README target;
* Dolbeault cohomology, Serre duality, the Kähler identities and the Hodge
  decomposition (K2, K5, K6), and the Frölicher spectral sequence (K8): the
  pinned libraries have no `(p,q)`-form carrier or Dolbeault complex.
-/

noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff

section Realification

/-- K3.0 target: finite-dimensional complex smooth charts have real-analytic
transitions, using the native finite-dimensional Cauchy/analyticity API before
restricting scalars. The real scalar action is the one induced from ℂ. -/
theorem realified_isManifold_analytic
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := by
  sorry

end Realification

section LocalGeometry

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [CompleteSpace E] [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [I.Boundaryless]

/-- The (0,1) part of the real differential of a complex-valued function. -/
def dbarFunction (J : TauCeti.SmoothAlmostComplexStructure I M)
    (f : M → ℂ) (x : M) (v : TangentSpace I x) : ℂ :=
  (mvfderiv I f x v +
    Complex.I * mvfderiv I f x (J x v)) / 2

theorem dbarFunction_apply_J (J : TauCeti.SmoothAlmostComplexStructure I M)
    (f : M → ℂ) (x : M) (v : TangentSpace I x) :
    dbarFunction J f x (J x v) = -Complex.I * dbarFunction J f x v := by
  sorry

/-- Pointwise algebraic vanishing is precisely the complex-linearity equation. -/
theorem dbarFunction_eq_zero_iff (J : TauCeti.SmoothAlmostComplexStructure I M)
    (f : M → ℂ) :
    (∀ x v, dbarFunction J f x v = 0) ↔
      ∀ x v, mvfderiv I f x (J x v) =
        Complex.I * mvfderiv I f x v := by
  sorry

/-- The unscaled Nijenhuis expression on vector fields. -/
def nijenhuisOnFields (J : TauCeti.SmoothAlmostComplexStructure I M)
    (X Y : (x : M) → TangentSpace I x) (x : M) : TangentSpace I x :=
  VectorField.mlieBracket I (fun y ↦ J y (X y)) (fun y ↦ J y (Y y)) x -
    VectorField.mlieBracket I X Y x -
    J x (VectorField.mlieBracket I (fun y ↦ J y (X y)) Y x) -
    J x (VectorField.mlieBracket I X (fun y ↦ J y (Y y)) x)

/-- The Nijenhuis expression is tensorial: on smooth vector fields its value at
`x` depends only on the values of the two fields at `x`. This is what makes the
Nijenhuis tensor a fiberwise bilinear map (K1). -/
theorem nijenhuisOnFields_eq_of_eq (J : TauCeti.SmoothAlmostComplexStructure I M)
    (X X' Y Y' : (x : M) → TangentSpace I x)
    (hX : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)))
    (hX' : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X' x⟩ : TangentBundle I M)))
    (hY : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, Y x⟩ : TangentBundle I M)))
    (hY' : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, Y' x⟩ : TangentBundle I M)))
    (x : M) (hXx : X x = X' x) (hYx : Y x = Y' x) :
    nijenhuisOnFields J X Y x = nijenhuisOnFields J X' Y' x := by
  sorry

/-- An unbundled Kähler condition: a closed two-form compatible with an almost-complex
structure whose Nijenhuis expression vanishes on all smooth vector fields. -/
def IsKahler (form : TauCeti.SmoothTwoForm I M)
    (J : TauCeti.SmoothAlmostComplexStructure I M) : Prop :=
  form.IsClosed ∧ form.Compatible J ∧
    ∀ X Y : (x : M) → TangentSpace I x,
      ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)) →
      ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, Y x⟩ : TangentBundle I M)) →
      ∀ x, nijenhuisOnFields J X Y x = 0


section SobolevLocalization

open scoped SchwartzMap Distributions CompactConvergenceCLM

variable {n : ℕ} {F : Type*} [NormedAddCommGroup F]
  [InnerProductSpace ℂ F] [CompleteSpace F]

/-- K5a consumes the existing bundled/unbundled Euclidean equivalence. -/
theorem memSobolev_iff_bundled (s : ℝ)
    (u : TemperedDistribution (EuclideanSpace ℝ (Fin n)) F) :
    TemperedDistribution.MemSobolev s 2 u ↔
      ∃ v : BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) F s 2,
        v.toDistr = u := by
  constructor
  · intro hu
    exact ⟨hu.toBesselPotentialSpace, rfl⟩
  · rintro ⟨v, rfl⟩
    exact v.memSobolev_toDistr

end SobolevLocalization
end LocalGeometry

section ComplexOrderMultipliers

open scoped SchwartzMap
variable (n : ℕ)

/-- Mathlib's Fourier variable ζ uses the 2π phase. -/
def complexBesselSymbol (z : ℂ) (ζ : EuclideanSpace ℝ (Fin n)) : ℂ :=
  Complex.exp ((z / 2) * (Real.log (1 + ‖ζ‖ ^ (2 : ℕ)) : ℂ))

theorem complexBesselSymbol_temperate (z : ℂ) :
    (complexBesselSymbol n z).HasTemperateGrowth := by sorry

variable (G : Type*) [NormedAddCommGroup G] [InnerProductSpace ℂ G] [CompleteSpace G]

def complexBesselMultiplier (z : ℂ) :
    SchwartzMap (EuclideanSpace ℝ (Fin n)) G →L[ℂ]
      SchwartzMap (EuclideanSpace ℝ (Fin n)) G :=
  SchwartzMap.fourierMultiplierCLM G (complexBesselSymbol n z)

def complexBesselDistributionMultiplier (z : ℂ) :
    TemperedDistribution (EuclideanSpace ℝ (Fin n)) G →L[ℂ]
      TemperedDistribution (EuclideanSpace ℝ (Fin n)) G :=
  TemperedDistribution.fourierMultiplierCLM G (complexBesselSymbol n z)

theorem complexBesselDistributionMultiplier_real (s : ℝ) :
    complexBesselDistributionMultiplier n G (s : ℂ) =
      TemperedDistribution.besselPotential (EuclideanSpace ℝ (Fin n)) G s := by sorry

end ComplexOrderMultipliers

end TauCetiRoadmap.ComplexKahlerGeometry
