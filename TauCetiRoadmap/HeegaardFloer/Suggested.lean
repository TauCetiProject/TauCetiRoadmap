import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.StandardCompatible
import TauCeti.Geometry.Symplectic.SymplecticTransport
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Topology.Compactification.OnePoint.ProjectiveLine
import TauCeti.Topology.Algebra.Matrix.ProjectiveSpecialLinearGroup
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace

/-!
# Heegaard Floer homology, analytically: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap is in `README.md`: the analytic tower — Morse homology
(Lane M), the Fredholm/Sard–Smale substrate (Lane F0), the Cauchy–Riemann elliptic
package (Lane F1), J-holomorphic curves (Lane F2), exact Lagrangian Floer homology
(Lane F3), and `HF̂` via holomorphic disks in `Sym^g(Σ)` (Lanes F4–F5). The
combinatorial bodies of theory live in the sibling `CombinatorialHeegaardFloer`
roadmap; the reconciliation theorems that join each combinatorial invariant to its
holomorphic counterpart are owned here, since they depend on this analytic tower.

The Darboux targets are stated on Tau Ceti's `SmoothTwoForm` and its `IsSymplectic`
predicate (closed and fiberwise nondegenerate). F2.1's Moser package (the contraction
inverse `ω♭`, families of forms on `↥J × M` with their vertical slices and time derivatives,
parametrized and compact-family primitives, and the compact Moser theorems) is not statable
at the pins: neither Mathlib nor Tau Ceti has smooth k-forms on manifolds for general k,
their pullback or the exterior derivative of one-forms, which DifferentialGeometry Layers 0–1
build. The remaining analytic and Floer constructions are specified in the README; their missing
types and connecting APIs are themselves roadmap targets.
The scalar spectral-flow sign checks below are actual differential identities;
they do not supply the L² domain, Fredholm theorem or cokernel classification.

The ordinary Lane M/F0 construction targets include
`fixedFiniteRegularity_morseSmale_residual`, `smoothRelative_morseSmale_residual`,
`largeConstantProductContinuation` and
`invariantRegularMoment_currentDifferential_eq_boundary`, together with the
explicit quartic face maps and compact-projective invariant-metric obstruction.
The declarations below do not assert these global theorems. The finite-Ck theorem
has arbitrary Ck metrics; fixed smooth normal models belong to the separate C∞
relative theorem. Its product-slab and fixed-base-lift family extensions
are also README construction targets, with fixed face data and explicit genericity.
-/

namespace TauCetiRoadmap.HeegaardFloer

open scoped Manifold ContDiff

section Darboux

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Darboux's theorem (McDuff–Salamon, *Introduction to Symplectic Topology*, §3.2):
a closed, fiberwise nondegenerate smooth two-form on a finite-dimensional boundaryless
manifold is, near any point, the pullback of a constant linear symplectic form by a smooth
chart centred at that point. -/
theorem exists_darbouxChart [FiniteDimensional ℝ E] [BoundarylessManifold I M]
    (form : TauCeti.SmoothTwoForm I M) (hform : form.IsSymplectic) (x₀ : M) :
    ∃ (chart : PartialDiffeomorph I 𝓘(ℝ, E) M E ∞)
      (form₀ : TauCeti.SymplecticForm E),
      x₀ ∈ chart.source ∧ chart x₀ = 0 ∧
      (∀ x ∈ chart.source, ∀ v w : TangentSpace I x,
        form x v w =
          form₀ (mfderiv I 𝓘(ℝ, E) chart x v) (mfderiv I 𝓘(ℝ, E) chart x w)) := by
  sorry

/-- Transport the existing symplectic basis to the pinned standard product model. -/
theorem exists_standardSymplectomorphism [FiniteDimensional ℝ E]
    (form : TauCeti.SymplecticForm E) :
    ∃ (m : ℕ) (e : E ≃L[ℝ] (EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin m))),
      TauCeti.SymplecticForm.IsSymplectomorphism form
        (TauCeti.stdSymplecticForm (V := EuclideanSpace ℝ (Fin m))) e.toLinearEquiv := by
  sorry

/-- The composed Darboux chart takes values in the standard symplectic model. -/
theorem exists_standardDarbouxChart [FiniteDimensional ℝ E] [BoundarylessManifold I M]
    (form : TauCeti.SmoothTwoForm I M) (hform : form.IsSymplectic) (x₀ : M) :
    ∃ (m : ℕ) (chart : PartialDiffeomorph I
      𝓘(ℝ, EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin m)) M
      (EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin m)) ∞),
      x₀ ∈ chart.source ∧ chart x₀ = 0 ∧
      (∀ x ∈ chart.source, ∀ v w : TangentSpace I x,
        form x v w =
          TauCeti.stdSymplecticForm (V := EuclideanSpace ℝ (Fin m))
            (mfderiv I 𝓘(ℝ, EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin m))
              chart x v)
            (mfderiv I 𝓘(ℝ, EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin m))
              chart x w)) := by
  sorry

end Darboux

section MorseCarriers

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]

/-- M.3's generators on native critical-point and Morse-index carriers. -/
abbrev MorseCriticalAtIndex (I : ModelWithCorners ℝ E H) (f : M → ℝ) (i : ℕ) :=
  {p : M // mvfderiv I f p = 0 ∧ TauCeti.manifoldMorseIndex I f p = i}

/-- The ordinary integer chain module; geometry must still construct its differential. -/
abbrev MorseChainModule (I : ModelWithCorners ℝ E H) (f : M → ℝ) (i : ℕ) :=
  MorseCriticalAtIndex I f i →₀ ℤ

end MorseCarriers

section ScalarSpectralFlowSign

/-- F1 uses ∂s−A(s), with the scalar positive crossing A(s)=tanh(s). -/
noncomputable def scalarCrossingOperator (u : ℝ → ℝ) (s : ℝ) : ℝ :=
  deriv u s - Real.tanh s * u s

/-- The formal adjoint, before imposing its L² operator domain. -/
noncomputable def scalarCrossingFormalAdjoint (u : ℝ → ℝ) (s : ℝ) : ℝ :=
  -deriv u s - Real.tanh s * u s

theorem scalarCrossing_cosh (s : ℝ) :
    scalarCrossingOperator Real.cosh s = 0 := by
  simp [scalarCrossingOperator, Real.deriv_cosh, Real.tanh_eq_sinh_div_cosh,
    (Real.cosh_pos s).ne']

theorem scalarCrossingFormalAdjoint_sech (s : ℝ) :
    scalarCrossingFormalAdjoint (fun t => (Real.cosh t)⁻¹) s = 0 := by
  have h : deriv (fun t : ℝ => (Real.cosh t)⁻¹) s =
      -Real.sinh s / Real.cosh s ^ 2 :=
    ((Real.hasDerivAt_cosh s).inv (Real.cosh_pos s).ne').deriv
  rw [scalarCrossingFormalAdjoint, h, Real.tanh_eq_sinh_div_cosh]
  field_simp [(Real.cosh_pos s).ne']
  ring

end ScalarSpectralFlowSign

section ClosedSphereAutomorphisms

open scoped MatrixGroups

/-- The finite native center gives the complex PSL quotient a Hausdorff topology. -/
instance pslComplex_t2 : T2Space PSL(2, ℂ) := by
  let _ : Finite (Subgroup.center SL(2, ℂ)) :=
    Matrix.SpecialLinearGroup.finite_center (R := ℂ)
  let _ : IsClosed ((Subgroup.center SL(2, ℂ) : Subgroup SL(2, ℂ)) : Set SL(2, ℂ)) :=
    Set.toFinite _ |>.isClosed
  infer_instance

variable [dec : DecidableEq ℂ]

/-- F2.6a uses the native PSL action and fixed ordered triple (0,1,infinity). -/
theorem sphereAut_existsUnique_map_triple (x y z : OnePoint ℂ)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    ∃! g : PSL(2, ℂ),
      g • ((0 : ℂ) : OnePoint ℂ) = x ∧
      g • ((1 : ℂ) : OnePoint ℂ) = y ∧
      g • (OnePoint.infty : OnePoint ℂ) = z := by
  sorry

end ClosedSphereAutomorphisms

section ForcedLagrangianDisc

open scoped InnerProductSpace

/-- Compact embedded Lagrangian disc theorem in standard complex Euclidean space.
The model dimension and pointwise isotropy encode the half-dimensional Lagrangian condition.
The smooth embedding is the native carrier, with no private embedding predicate. -/
theorem exists_nonconstant_holomorphic_disc_in_component
    {n : ℕ} (hn : 1 ≤ n)
    {L : Type*} [TopologicalSpace L]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) L]
    [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ L]
    [T2Space L] [CompactSpace L]
    (x₀ : L)
    (i : TauCeti.SmoothEmbedding
      𝓘(ℝ, EuclideanSpace ℝ (Fin n))
      𝓘(ℝ, EuclideanSpace ℂ (Fin n)) ∞ L (EuclideanSpace ℂ (Fin n)))
    (hisotropic : ∀ (x : L)
      (v w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x),
      (inner ℂ
        ((NormedSpace.fromTangentSpace (𝕜 := ℝ) (i x))
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n))
            𝓘(ℝ, EuclideanSpace ℂ (Fin n)) i x v))
        ((NormedSpace.fromTangentSpace (𝕜 := ℝ) (i x))
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n))
            𝓘(ℝ, EuclideanSpace ℂ (Fin n)) i x w))).im = 0) :
    ∃ u : ℂ → EuclideanSpace ℂ (Fin n),
      ContDiffOn ℝ ∞ u (Metric.closedBall 0 1) ∧
      DifferentiableOn ℂ u (Metric.ball 0 1) ∧
      (∀ z ∈ Metric.sphere (0 : ℂ) 1,
        u z ∈ i '' connectedComponent x₀) ∧
      ∃ z ∈ Metric.ball (0 : ℂ) 1, ∃ w ∈ Metric.ball (0 : ℂ) 1, u z ≠ u w := by
  sorry


/-- Compact embedded Lagrangian disc theorem in standard complex Euclidean space.
The model dimension and pointwise isotropy encode the half-dimensional Lagrangian condition.
The smooth embedding is the native carrier, with no private embedding predicate. -/
theorem exists_nonconstant_holomorphic_disc
    {n : ℕ} (hn : 1 ≤ n)
    {L : Type*} [TopologicalSpace L]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) L]
    [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ L]
    [T2Space L] [CompactSpace L] [Nonempty L]
    (i : TauCeti.SmoothEmbedding
      𝓘(ℝ, EuclideanSpace ℝ (Fin n))
      𝓘(ℝ, EuclideanSpace ℂ (Fin n)) ∞ L (EuclideanSpace ℂ (Fin n)))
    (hisotropic : ∀ (x : L)
      (v w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x),
      (inner ℂ
        ((NormedSpace.fromTangentSpace (𝕜 := ℝ) (i x))
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n))
            𝓘(ℝ, EuclideanSpace ℂ (Fin n)) i x v))
        ((NormedSpace.fromTangentSpace (𝕜 := ℝ) (i x))
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n))
            𝓘(ℝ, EuclideanSpace ℂ (Fin n)) i x w))).im = 0) :
    ∃ u : ℂ → EuclideanSpace ℂ (Fin n),
      ContDiffOn ℝ ∞ u (Metric.closedBall 0 1) ∧
      DifferentiableOn ℂ u (Metric.ball 0 1) ∧
      (∀ z ∈ Metric.sphere (0 : ℂ) 1, u z ∈ Set.range i) ∧
      ∃ z ∈ Metric.ball (0 : ℂ) 1, ∃ w ∈ Metric.ball (0 : ℂ) 1, u z ≠ u w := by
  classical
  let x₀ : L := Classical.choice ‹Nonempty L›
  obtain ⟨u, huC, huD, huB, huN⟩ :=
    exists_nonconstant_holomorphic_disc_in_component hn x₀ i hisotropic
  refine ⟨u, huC, huD, ?_, huN⟩
  intro z hz
  rcases huB z hz with ⟨x, hx, hix⟩
  exact ⟨x, hix⟩

end ForcedLagrangianDisc

end TauCetiRoadmap.HeegaardFloer
