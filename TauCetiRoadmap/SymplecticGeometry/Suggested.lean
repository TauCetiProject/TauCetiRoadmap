import Mathlib
import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
import TauCeti.Geometry.Symplectic.Manifold.Suspension.Leaf

/-!
# Symplectic geometry and Hamiltonian mechanics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorem of the
roadmap's own layers against the pinned Mathlib and Tau Ceti, with `sorry`; that headline is
statable at the pins. The five sub-roadmaps of the family state their own headlines in their own
files. The further targets of the root's layers (the orientation of the suspension, families of
seam-compatible structures, the classes of multiple covers, the vertical distribution and the
Künneth description of the cross summand) are README targets and are not restated here.

The roadmap's own layers build the symplectic suspension of a symplectomorphism `φ` of a
symplectic manifold `(M, σ)`: the mapping torus `Y_φ`, the product `X_φ = (ℝ / ℤ)_s × Y_φ` with the
form `Ω = ds ∧ dt + σ_v`, its seam-compatible block almost complex structures and the tori over
periodic orbits (README Layers 0 and 1). The pinned Tau Ceti library constructs these carriers and
proves their basic theorems (`TauCeti.SmoothMappingTorus`, `TauCeti.SmoothMappingTorus.suspensionForm`,
`TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure`,
`TauCeti.SmoothMappingTorus.orbitTorus`), including the classification of compact immersed
pseudoholomorphic curves of zero vertical area
(`TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero`). The headline
stated here is the compact horizontal-image theorem in its homological form (README §2.3): the
vertical-area hypothesis is replaced by the topological condition that the class of the curve lie in
the cross summand `[S¹_s] × H₁(Y_φ; ℤ)`. That summand is the kernel of the map
`H₂(X_φ; ℤ) → H₂(Y_φ; ℤ)` induced by the projection (README §2.2), and the statement uses this
form, the image of the fundamental class of the curve under the mapping-torus component of the map.
-/

namespace TauCetiRoadmap.SymplecticGeometry

open Function Set TauCeti TauCeti.SmoothMappingTorus
open scoped Manifold ContDiff

/-! ## Layer 2: the compact horizontal-image theorem -/

/-- **The compact horizontal-image theorem.** Let `φ` be a symplectomorphism of a
finite-dimensional symplectic manifold `(M, σ)` without boundary, `Y_φ` its mapping torus and
`X_φ = (ℝ / ℤ)_s × Y_φ`. Let `J` be an almost complex structure on `X_φ` of block form: it sends
`∂_s` to the suspension vector field `T`, preserves the vertical tangent spaces `V` (the pullback of
the kernel of the projection `Y_φ → ℝ / ℤ`), and its restriction to `V` is tamed by the fibre form
`ω_v`. Let `u` be a smooth embedding of a closed connected surface `C` with almost complex
structure `j` into `X_φ`, pseudoholomorphic for `j` and `J`. If the mapping-torus component of `u`
carries the fundamental class of `C` to zero in `H₂(Y_φ; ℤ)`, equivalently if the class of `u(C)`
lies in `[S¹_s] × H₁(Y_φ; ℤ)`, then the image of `u` is `(ℝ / ℤ)_s × γ` for the primitive closed
orbit `γ` of the suspension flow through a point `[0, x]` with `x` periodic for `φ`. -/
theorem exists_range_eq_range_orbitTorus_of_mapFundamentalClass_eq_zero
    {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
    [LocallyCompactSpace M] [SecondCountableTopology M]
    (φ : M ≃ₘ⟮I, I⟯ M) (σ : SmoothTwoForm I M) (hσs : σ.IsSymplectic)
    (hσ : SmoothForm.mpullback φ φ.contMDiff σ = σ)
    (J : SmoothAlmostComplexStructure (𝓘(ℝ).prod (𝓘(ℝ).prod I))
      (UnitAddCircle × SmoothMappingTorus φ))
    (hS : ∀ q, J q ((Manifold.tangentSpaceProdEquiv q).symm ((1 : ℝ), 0)) =
      (Manifold.tangentSpaceProdEquiv q).symm ((0 : ℝ), timeVectorField φ q.2))
    (hV : ∀ q, ∀ v ∈ suspensionVerticalSubspace φ q, J q v ∈ suspensionVerticalSubspace φ q)
    (htame : ∀ q, ∀ v ∈ suspensionVerticalSubspace φ q, v ≠ 0 →
      0 < SmoothBundleForm.eval₂
        (SmoothForm.mpullback Prod.snd contMDiff_snd (fiberForm φ σ hσ)) q v (J q v))
    {E' C : Type} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    (h2 : Module.finrank ℝ E' = 2)
    [TopologicalSpace C] [T2Space C] [ChartedSpace E' C] [IsManifold 𝓘(ℝ, E') ∞ C]
    [CompactSpace C] [ConnectedSpace C]
    (j : SmoothAlmostComplexStructure 𝓘(ℝ, E') C) (o : HomologicalOrientation C E' 2)
    (u : C → UnitAddCircle × SmoothMappingTorus φ)
    (hu : Manifold.IsSmoothEmbedding 𝓘(ℝ, E') (𝓘(ℝ).prod (𝓘(ℝ).prod I)) ∞ u)
    (hhol : ∀ c, IsPseudoholomorphicAt j J u c)
    (hclass : o.mapFundamentalClass h2 ⟨Prod.snd ∘ u, hu.isEmbedding.continuous.snd⟩ = 0) :
    ∃ x : M, 0 < minimalPeriod φ x ∧
      range u = range (orbitTorus φ (isPeriodicPt_minimalPeriod φ x)) := by
  sorry

end TauCetiRoadmap.SymplecticGeometry
