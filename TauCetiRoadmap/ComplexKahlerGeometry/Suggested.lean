import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.AlmostComplex
import TauCeti.Geometry.Symplectic.Manifold.TwoForm

/-!
# Complex manifolds, Dolbeault theory, and Kähler geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib and Tau Ceti, the headline theorems that are statable with the
native carriers: the tensoriality of the Nijenhuis expression on vector fields
(K1), the joint smooth/holomorphic parameter-dependent `∂̄` solver (K2), the
real-analytic transitions of a complex manifold (K3.0), Hartogs extension across
a point (K3), the complex-order Bessel symbol and its multipliers (K5a) and the
real-carrier Kähler condition (K6.0).

Not statable at the pins, so nothing is stated in their place:
* the Newlander–Nirenberg theorem (K1): the pinned Tau Ceti
  `SmoothAlmostComplexStructure` has no comparison with the almost-complex
  structure induced by a complex `IsManifold` atlas, so "J is induced by a
  compatible complex atlas" has no carrier;
* the Dolbeault–Grothendieck lemma and the sheaf/Dolbeault comparison (K2), the
  Dolbeault Hodge theorem and Serre duality (K5), the Kähler identities, Hodge
  decomposition, Hard Lefschetz and the analytic-cycle classes (K6), and the
  Frölicher spectral sequence (K8): the pinned libraries have no `(p,q)`-form
  carrier or Dolbeault complex;
* Weierstrass preparation and division, Rückert's Nullstellensatz, coherence of
  the holomorphic sheaf and Hartogs extension across a positive-dimensional
  analytic subset (K3): no convergent-power-series local ring and no
  analytic-subset carrier;
* Chern uniqueness, Koszul–Malgrange and the flat-connection/local-system
  equivalences (K4): no holomorphic-transition mixin on the native
  `VectorBundle`;
* the exponential sequence, `Pic_hol(M) ≃ H¹(M,𝒪×)` and the Chern-class
  identification (K4.P): no holomorphic structure sheaf of units on a complex
  manifold and no `H¹(M,𝒪×)`;
* the LF space of compactly supported smooth bundle sections, its dual space of
  bundle distributions, the localized Sobolev scale on a compact manifold and the
  complexification and conjugation of real bundle distributions (K5a): the pinned
  libraries have no inductive-limit topology on spaces of smooth sections;
* the density line of K5a: the pinned libraries have no density carrier
  (DifferentialGeometry DG0's `Density` is a roadmap target);
* the imaginary-order unitary `H^s → L²` comparison (K5a): it is a construction
  whose existence is itself a target, so it stays a README target;
* the projective, torus and Hopf computations (K7): `Projectivization` carries no
  complex-manifold structure at the pins, and the complex tori, the Hopf surface
  and the elliptic flat lines are roadmap constructions.
-/

noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff

/-! ## Layer K1: Complex structures and type calculus -/

section LocalGeometry

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [CompleteSpace E] [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [I.Boundaryless]

/-- The unscaled Nijenhuis expression `[JX,JY] − [X,Y] − J[JX,Y] − J[X,JY]` on
vector fields, with Mathlib's manifold Lie bracket. -/
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

/-! ## Layer K6.0: Local Kähler and curvature identities -/

/-- An unbundled Kähler condition on the real carrier: a closed two-form compatible
with an almost-complex structure whose Nijenhuis expression vanishes on all smooth
vector fields. K6.0 compares it, through Newlander–Nirenberg, with the Hermitian
metric with closed fundamental form on the complex manifold. -/
def IsKahler (form : TauCeti.SmoothTwoForm I M)
    (J : TauCeti.SmoothAlmostComplexStructure I M) : Prop :=
  form.IsClosed ∧ form.Compatible J ∧
    ∀ X Y : (x : M) → TangentSpace I x,
      ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)) →
      ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, Y x⟩ : TangentBundle I M)) →
      ∀ x, nijenhuisOnFields J X Y x = 0

end LocalGeometry

/-! ## Layer K2: Dolbeault calculus and the local lemmas -/

/-- K2's joint parameter-dependent one-variable solver. For a finite-dimensional
smooth parameter manifold `P`, an open complex parameter domain `Q` in a
finite-dimensional complex space and an open plane domain `Ω`, every jointly smooth
`f` on `P × Q × Ω` that is holomorphic in the complex parameters has a jointly smooth
`u`, holomorphic in the complex parameters, with `∂̄_z u = f`, where
`∂̄_z = (∂_x + i ∂_y)/2` is written with the real Fréchet derivative in `z`. `Q` is
not assumed to be a polydisc, connected or bounded. -/
theorem exists_mixed_parameter_dbar_solution
    {EP HP P E : Type*}
    [NormedAddCommGroup EP] [NormedSpace ℝ EP] [FiniteDimensional ℝ EP]
    [TopologicalSpace HP] (I : ModelWithCorners ℝ EP HP) [I.Boundaryless]
    [TopologicalSpace P] [ChartedSpace HP P] [IsManifold I ∞ P]
    [T2Space P] [SecondCountableTopology P]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (Q : Set E) (Ω : Set ℂ) (hQ : IsOpen Q) (hΩ : IsOpen Ω)
    (f : (P × E) × ℂ → ℂ)
    (hf : ContMDiffOn ((I.prod 𝓘(ℝ, E)).prod 𝓘(ℝ, ℂ)) 𝓘(ℝ, ℂ) ∞ f
      ((Set.univ ×ˢ Q) ×ˢ Ω))
    (hfhol : ∀ p z, z ∈ Ω → DifferentiableOn ℂ (fun q => f ((p, q), z)) Q) :
    ∃ u : (P × E) × ℂ → ℂ,
      ContMDiffOn ((I.prod 𝓘(ℝ, E)).prod 𝓘(ℝ, ℂ)) 𝓘(ℝ, ℂ) ∞ u
        ((Set.univ ×ˢ Q) ×ˢ Ω) ∧
      (∀ p z, z ∈ Ω → DifferentiableOn ℂ (fun q => u ((p, q), z)) Q) ∧
      (∀ p q, q ∈ Q → ∀ z, z ∈ Ω →
        (fderiv ℝ (fun w => u ((p, q), w)) z 1 +
          Complex.I * fderiv ℝ (fun w => u ((p, q), w)) z Complex.I) / 2 =
          f ((p, q), z)) := by
  sorry

/-! ## Layer K3: Analytic germs and subvarieties -/

section Realification

/-- K3.0 target: finite-dimensional complex smooth charts have real-analytic
transitions, using the native finite-dimensional Cauchy/analyticity API before
restricting scalars. The real scalar action is the one induced from ℂ. -/
theorem realified_isManifold_analytic
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := by
  sorry

/-- K3's Hartogs extension across a point: on a complex manifold of complex
dimension at least two, a function holomorphic off a point extends to a
holomorphic function on the whole manifold. This is the analytic input of
K7.2.TautologicalIncidence; in dimension one `1/z` has no extension, which the
dimension hypothesis excludes. -/
theorem hartogs_extension_across_point
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (hE : 2 ≤ Module.finrank ℂ E)
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]
    (p : M) (f : M → ℂ) (hf : MDifferentiableOn 𝓘(ℂ, E) 𝓘(ℂ, ℂ) f {p}ᶜ) :
    ∃ g : M → ℂ, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ, ℂ) g ∧ Set.EqOn g f {p}ᶜ := by
  sorry

end Realification

/-! ## Layer K5a: Real and complex-coefficient analysis on real manifolds -/

section ComplexOrderMultipliers

open scoped SchwartzMap
variable (n : ℕ)

/-- The complex-order Bessel symbol `(1 + ‖ζ‖²)^(z/2)` in Mathlib's Fourier variable
`ζ` (2π phase), written through the real logarithm so that `z` is a complex order. -/
def complexBesselSymbol (z : ℂ) (ζ : EuclideanSpace ℝ (Fin n)) : ℂ :=
  Complex.exp ((z / 2) * (Real.log (1 + ‖ζ‖ ^ (2 : ℕ)) : ℂ))

/-- The complex-order Bessel symbol has temperate growth for every complex order,
so it defines Fourier multipliers on Schwartz functions and tempered distributions. -/
theorem complexBesselSymbol_temperate (z : ℂ) :
    (complexBesselSymbol n z).HasTemperateGrowth := by sorry

variable (G : Type*) [NormedAddCommGroup G] [InnerProductSpace ℂ G] [CompleteSpace G]

/-- The complex-order Bessel multiplier `Λ^z` on Schwartz functions, the Fourier
multiplier with symbol `complexBesselSymbol n z`. -/
def complexBesselMultiplier (z : ℂ) :
    SchwartzMap (EuclideanSpace ℝ (Fin n)) G →L[ℂ]
      SchwartzMap (EuclideanSpace ℝ (Fin n)) G :=
  SchwartzMap.fourierMultiplierCLM G (complexBesselSymbol n z)

/-- The complex-order Bessel multiplier `Λ^z` on tempered distributions, the Fourier
multiplier with symbol `complexBesselSymbol n z`; at real `z = s` it is the native
`besselPotential` of order `s`. -/
def complexBesselDistributionMultiplier (z : ℂ) :
    TemperedDistribution (EuclideanSpace ℝ (Fin n)) G →L[ℂ]
      TemperedDistribution (EuclideanSpace ℝ (Fin n)) G :=
  TemperedDistribution.fourierMultiplierCLM G (complexBesselSymbol n z)

end ComplexOrderMultipliers

end TauCetiRoadmap.ComplexKahlerGeometry
