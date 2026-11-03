import Mathlib

/-!
# Smooth Banach representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, for real and complex coefficients.
The headlines are smoothing and density with the real/general-group extensions,
the scalar compact-support parametrix, support-controlled vector and function
Dixmier–Malliavin, smooth lifting, and inverse closure (including matrix Banach algebras).

The complete mixed-word topology and its finite-regularity criterion, continuous
Lie/enveloping action, smooth-topology approximation, topological exactness and
dense smooth tensor comparison need the constructed mixed-domain Fréchet carrier
and completed locally convex tensor from the README. Those carriers are not at
the pins; the algebraic submodule below does not substitute its ambient topology.
The scalar parametrix is stated in the native distribution topology. Its
fixed-support strong-dual comparison and Banach-vector passage still need the
distribution-to-smooth-dual interface; native distribution convergence alone
does not state those comparisons. Holomorphic closure
needs the general Banach-algebra holomorphic functional calculus of BanachAlgebras
A2; the pinned continuous functional calculus does not supply that carrier.
The one-parameter generator adapter and local integral estimates are supporting
APIs in the README, not additional acceptance theorems.
-/

open scoped Manifold ContDiff Topology
open MeasureTheory TopologicalSpace Filter

noncomputable section
namespace TauCetiRoadmap.SmoothBanachRepresentations

variable {𝕜 : Type*} [RCLike 𝕜]
variable {V H G E : Type*}
  [NormedAddCommGroup V] [NormedSpace ℝ V] [hFD : FiniteDimensional ℝ V]
  [TopologicalSpace H] {I : ModelWithCorners ℝ V H}
  [TopologicalSpace G] [ChartedSpace H G] [Group G]
  [hLie : LieGroup I ∞ G] [hManifold : IsManifold I 1 G] [hT2 : T2Space G]
  [hBoundary : BoundarylessManifold I G]
  [NormedAddCommGroup E] [NormedSpace 𝕜 E] [NormedSpace ℝ E]
  [IsScalarTower ℝ 𝕜 E] [hComplete : CompleteSpace E]

/-! ## Layer 0: Strong actions -/

/-- Strong orbit continuity is explicit: the native representation does not include it. -/
def HasContinuousOrbits (π : ContRepresentation 𝕜 G E) : Prop :=
  ∀ v : E, Continuous (fun g : G => π g v)

/-! ## Layer 1: Smooth tests and integration -/

/-- A manifold test uses the native smooth-map carrier and compact support. -/
abbrev LieTestFunction (𝕜 : Type*) [RCLike 𝕜] :=
  {f : ContMDiffMap I 𝓘(ℝ, 𝕜) G 𝕜 ∞ // HasCompactSupport (fun g => f g)}

variable [MeasurableSpace G] [hBorel : BorelSpace G]

/-- Pointwise Bochner integration; compact-support integrability is supplied in the README. -/
def smear (π : ContRepresentation 𝕜 G E) (μ : Measure G) (f : G → 𝕜) (v : E) : E :=
  ∫ g, f g • π g v ∂μ

/-! ## Layer 2: Orbit regularity -/

/-- Smoothness in the original Banach norm, using native manifold calculus. -/
def IsSmoothLieVector (π : ContRepresentation 𝕜 G E) (v : E) : Prop :=
  ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => π g v)

/-- The algebraic smooth carrier; its stronger Fréchet topology is a README target. -/
def smoothLieVectors (π : ContRepresentation 𝕜 G E) : Submodule 𝕜 E where
  carrier := {v | IsSmoothLieVector (I := I) π v}
  zero_mem' := by
    simpa [IsSmoothLieVector] using
      (contMDiff_const : ContMDiff I 𝓘(ℝ, E) ∞ (fun _ : G => (0 : E)))
  add_mem' := by
    intro v w hv hw
    change ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => π g (v + w))
    exact (hv.add hw).congr (fun g => by simp)
  smul_mem' := by
    intro z v hv
    change ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => π g (z • v))
    have h : ContMDiff I 𝓘(ℝ, E) ∞ (fun g : G => z • π g v) :=
      (((z • ContinuousLinearMap.id 𝕜 E).restrictScalars ℝ).contMDiff).comp hv
    exact h.congr (fun g => by simp)

include hFD hLie hManifold hT2 hBoundary hComplete hBorel

variable [hLC : LocallyCompactSpace G]
include hLC

/-! ## Layer 3: Smoothing -/

/-- Strongly continuous actions smooth under compactly supported smooth kernels. -/
theorem isSmoothLieVector_smear (π : ContRepresentation 𝕜 G E)
    (hπ : HasContinuousOrbits π) (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular]
    (f : LieTestFunction (I := I) 𝕜) (v : E) :
    IsSmoothLieVector (I := I) π (smear π μ (fun g => f.val g) v) := by
  sorry

/-! ## Layer 4: Density -/

/-- Density is weaker than, and separate from, the following exact finite-sum theorem. -/
theorem dense_smoothLieVectors (π : ContRepresentation 𝕜 G E)
    (hπ : HasContinuousOrbits π) :
    Dense (smoothLieVectors (I := I) π : Set E) := by
  sorry

/-! ## Layer 5: The scalar parametrix -/

omit hFD hLie hManifold hT2 hBoundary hComplete hBorel hLC in
/-- The compact-support scalar parametrix: positive coefficients with arbitrary
nonconstant upper bounds give alternating even derivatives converging to a Dirac
mass plus a smooth remainder in the native distribution topology. Both test
functions have arbitrarily small prescribed support (Casselman, Lemma 5.1, p.12). -/
theorem scalarParametrix (ε : ℝ) (hε : 0 < ε)
    (β : ℕ → ℝ) (hβ : ∀ n, 0 < n → 0 < β n) :
    ∃ α : ℕ → ℝ, ∃ g h : TestFunction (⊤ : Opens ℝ) ℝ ⊤,
      (∀ n, 0 < α n) ∧ (∀ n, 0 < n → α n ≤ β n) ∧
      tsupport (g : ℝ → ℝ) ⊆ Set.Icc (-ε) ε ∧
      tsupport (h : ℝ → ℝ) ⊆ Set.Icc (-ε) ε ∧
      Tendsto (fun N : ℕ => ∑ n ∈ Finset.range (N + 1),
        ((-1 : ℝ)^n * α n) •
          ((Distribution.lineDerivCLM (1 : ℝ) :
            Distribution (⊤ : Opens ℝ) ℝ ⊤ →L[ℝ]
              Distribution (⊤ : Opens ℝ) ℝ ⊤)^[2*n])
            (Distribution.ofFun ⊤ (g : ℝ → ℝ) volume ⊤))
        atTop (𝓝 (Distribution.delta 0 +
          Distribution.ofFun ⊤ (h : ℝ → ℝ) volume ⊤)) := by
  sorry

/-! ## Layer 6: Support-controlled factorization -/

/-- Full support-controlled Dixmier–Malliavin, with smooth inner vectors. -/
theorem dixmierMalliavin (π : ContRepresentation 𝕜 G E)
    (hπ : HasContinuousOrbits π) (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular]
    {U : Set G} (hU : IsOpen U) (h1 : (1 : G) ∈ U)
    (v : E) (hv : IsSmoothLieVector (I := I) π v) :
    ∃ n : ℕ, ∃ f : Fin n → LieTestFunction (I := I) 𝕜, ∃ w : Fin n → E,
      (∀ j, tsupport (fun g => (f j).val g) ⊆ U) ∧
      (∀ j, IsSmoothLieVector (I := I) π (w j)) ∧
      v = ∑ j, smear π μ (fun g => (f j).val g) (w j) := by
  sorry

omit hComplete in
/-- Every test function factors with the first kernels in any identity neighborhood
and the second kernels supported in the original topological support. -/
theorem dixmierMalliavin_function (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular]
    {U : Set G} (hU : IsOpen U) (h1 : (1 : G) ∈ U)
    (φ : LieTestFunction (I := I) 𝕜) :
    ∃ n : ℕ, ∃ f h : Fin n → LieTestFunction (I := I) 𝕜,
      (∀ j, tsupport (fun g => (f j).val g) ⊆ U) ∧
      (∀ j, tsupport (fun g => (h j).val g) ⊆ tsupport (fun g => φ.val g)) ∧
      ∀ x : G, φ.val x = ∑ j, ∫ y, (f j).val y * (h j).val (y⁻¹ * x) ∂μ := by
  sorry

/-! ## Layer 7: Exactness -/

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]
  [NormedSpace ℝ F] [IsScalarTower ℝ 𝕜 F] [hCompleteF : CompleteSpace F]

include hCompleteF in
/-- Every smooth vector lifts through a surjective continuous intertwiner of
strongly continuous Banach representations. No complemented kernel is required. -/
theorem smooth_lift (π : ContRepresentation 𝕜 G E) (ρ : ContRepresentation 𝕜 G F)
    (hπ : HasContinuousOrbits π) (hρ : HasContinuousOrbits ρ)
    (T : ContIntertwiningMap π ρ) (hT : Function.Surjective T)
    (w : F) (hw : IsSmoothLieVector (I := I) ρ w) :
    ∃ v : E, IsSmoothLieVector (I := I) π v ∧ T v = w := by
  sorry

omit hComplete hBorel hLC [MeasurableSpace G]

/-! ## Layer 8: Spectral invariance -/

variable {A : Type*} [NormedRing A] [NormedAlgebra 𝕜 A] [NormedAlgebra ℝ A]
  [IsScalarTower ℝ 𝕜 A] [hCompleteA : CompleteSpace A]

include hCompleteA in
/-- Inverses of smooth units are smooth for an action by algebra automorphisms;
no orbit continuity is needed, since inversion is smooth on the units of a complete
normed algebra. Taking A to be a matrix Banach algebra gives every matrix level. -/
theorem smooth_inverse (π : ContRepresentation 𝕜 G A)
    (h1 : ∀ g : G, π g 1 = 1)
    (hmul : ∀ (g : G) (a b : A), π g (a * b) = π g a * π g b)
    (a : Aˣ) (ha : IsSmoothLieVector (I := I) π (a : A)) :
    IsSmoothLieVector (I := I) π (↑(a⁻¹) : A) := by
  sorry

end TauCetiRoadmap.SmoothBanachRepresentations
