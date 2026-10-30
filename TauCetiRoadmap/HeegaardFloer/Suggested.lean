import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.StandardCompatible
import TauCeti.Topology.Compactification.OnePoint.ProjectiveLine
import TauCeti.Topology.Algebra.Matrix.ProjectiveSpecialLinearGroup
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace

/-!
# Heegaard Floer homology, analytically: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs. The native statements
below cover sharp finite-dimensional Sard, Banach-manifold Sard–Smale, Darboux normal forms, sphere triple
normalization, nonsqueezing and the compact Lagrangian holomorphic-disc theorem.

The following headlines require constructions specified in the README before their
full statements can be expressed at the pins:

* Integral Morse and Morse–Bott homology, continuation, and the singular-homology
  comparison (M.3–M.7): the signed trajectory/cascade differentials on the geometric
  Morse and orientation-local-system chain carriers are missing.
* Filtered and Serre comparison (M.8): the trajectory-filtered Bott complex and its
  geometric comparison maps to the bundle's filtered singular chains are missing.
* Products, Poincaré duality and cup-product comparison (M.9): the Morse/Bott complexes,
  their geometric product and their chain-level comparison maps are missing.
* Witten comparison (M.10): the manifold Witten Laplacian with its operator domain,
  spectral subcomplex and integration map to the Morse complex is missing.
* Fredholm determinant families and orientation transport (F0.0): the determinant
  line bundle on the native Fredholm-operator carrier and its orientation cover are
  missing. The sharp Fredholm-map regular-value theorem itself is stated below.
* Spectral-flow/index and Cauchy–Riemann Riemann–Roch (F1.3–F1.5): the asymptotic strip
  operators with Sobolev domains, CR bundle operators and boundary index adapters are missing.
* Moser's theorem (F2.1): the common manifold differential-form calculus with one-form
  exterior derivative, pullbacks and smooth families of primitives is missing.
* Sphere-moduli compactness/evaluation, rulings and the equal-area symplectomorphism-group
  theorem (F2.6b–h): the simple-sphere moduli/evaluation families and smooth symplectomorphism
  group topology needed for these statements are missing.
* The Liouville nonexactness and componentwise first-homology consequences (F2.7): the
  manifold Liouville pullback and its singular/de Rham integration comparison are missing.
* Exact Lagrangian Floer invariance and Morse comparison (F3): the geometric strip-count
  complex, its differential and continuation maps are missing.
* Heegaard Floer invariance, gradings and naturality (F4): smooth pointed Heegaard diagrams,
  holomorphic-disc complexes and their based move maps are missing; the native incidence
  and periodic-domain algebra does not supply them.
* Cylindrical equivalence, bordered pairing and knot Floer theory (F5): the cylindrical
  complexes, analytic bordered modules and pairing maps, and knot-filtered complexes
  with their analytic differentials are missing.
* Stable combinatorial/holomorphic hat reconciliation (R1): the balanced multipointed
  holomorphic complex and its basepoint comparison maps are missing.
* Lattice/minus reconciliation (R2): the holomorphic minus complex, completed surgery
  comparison and compatible lattice map are missing.
* Grid/knot reconciliation (R3): the holomorphic knot-filtered complex and the geometric
  rectangle-to-disc comparison maps are missing.

The scalar, matrix and finite-chain computations are README Checks, not replacements
for these geometric theorems.
-/

namespace TauCetiRoadmap.HeegaardFloer

open scoped Manifold ContDiff

/-! ## Layer 2: the nonlinear-analysis substrate -/

/-- On an open subset of a finite-dimensional real normed space, the critical values
of a C^k map have additive Haar measure zero when k > max(dim E - dim F, 0).
Sard, Theorems 4.1 and 7.2 (1942), with the lower-source-dimension case supplied by
local Lipschitz dimension estimates. -/
theorem sharp_sard
    {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    [MeasurableSpace F] [BorelSpace F]
    (ν : MeasureTheory.Measure F) [MeasureTheory.Measure.IsAddHaarMeasure ν]
    {U : Set E} (hU : IsOpen U) {k : ℕ} (hk : Module.finrank ℝ E - Module.finrank ℝ F < k)
    (f : E → F) (hf : ContDiffOn ℝ (k : ℕ∞ω) f U) :
    ν (f '' (U ∩ {x | ¬ Function.Surjective (fderiv ℝ f x)})) = 0 := by
  sorry

/-- Sharp Sard–Smale for a C^k Fredholm map of boundaryless Banach manifolds
with second-countable source: critical values are meagre when k is positive and
strictly exceeds the derivative's integer Fredholm index at every source point. -/
theorem sharp_sardSmale
    {E H F G M N : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]
    [TopologicalSpace H] [TopologicalSpace G]
    {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
    [TopologicalSpace M] [ChartedSpace H M] [T2Space M] [SecondCountableTopology M]
    [TopologicalSpace N] [ChartedSpace G N] [T2Space N]
    {k : ℕ} (hk : 0 < k)
    [IsManifold I (k : ℕ∞ω) M] [BoundarylessManifold I M]
    [IsManifold J (k : ℕ∞ω) N] [BoundarylessManifold J N]
    (f : M → N) (hf : ContMDiff I J (k : ℕ∞ω) f)
    (hFredholm : ∀ x, (mfderiv I J f x).IsFredholm)
    (hindex : ∀ x,
      (Module.finrank ℝ (mfderiv I J f x).ker : ℤ) -
        (Module.finrank ℝ (TangentSpace J (f x) ⧸ (mfderiv I J f x).range) : ℤ) <
          (k : ℤ)) :
    IsMeagre (f '' {x | ¬ Function.Surjective (mfderiv I J f x)}) := by
  sorry

/-! ## Layer 4: J-holomorphic curves -/

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

section ClosedSphereAutomorphisms

open scoped MatrixGroups

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

section Nonsqueezing

open InnerProductSpace

/-- Gromov nonsqueezing: a smooth symplectic embedding of the open radius-r ball
in complex Euclidean n-space into the radius-R cylinder in its first complex
coordinate requires r ≤ R. Gromov (1985), §0.3.A, Corollary, pp. 310–311. -/
theorem nonsqueezing {n : ℕ} (hn : 0 < n) {r R : ℝ}
    (hr : 0 < r) (hR : 0 < R)
    (f : EuclideanSpace ℂ (Fin n) → EuclideanSpace ℂ (Fin n))
    (hsmooth : ContDiffOn ℝ ∞ f (Metric.ball 0 r))
    (hembed : Topology.IsEmbedding
      (fun x : Metric.ball (0 : EuclideanSpace ℂ (Fin n)) r => f x))
    (hsympl : ∀ x ∈ Metric.ball (0 : EuclideanSpace ℂ (Fin n)) r,
      ∀ v w : EuclideanSpace ℂ (Fin n),
      (inner ℂ (fderiv ℝ f x v) (fderiv ℝ f x w)).im =
        (inner ℂ v w).im)
    (hcylinder : ∀ x ∈ Metric.ball (0 : EuclideanSpace ℂ (Fin n)) r,
      ‖f x ⟨0, hn⟩‖ < R) : r ≤ R := by
  sorry

end Nonsqueezing

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

end ForcedLagrangianDisc

end TauCetiRoadmap.HeegaardFloer
