import Mathlib
import TauCeti.Geometry.Toric.Algebraic.DualSemigroup.Face
import TauCeti.Geometry.Toric.Algebraic.FaceLocalization
import TauCeti.Geometry.Toric.Algebraic.Fan.Scheme
import TauCeti.Geometry.Toric.Algebraic.Fan.SubfanScheme
import TauCeti.Geometry.Toric.Algebraic.Regular
import TauCeti.Geometry.Toric.Analytic.AffinePoint
import TauCeti.Geometry.Toric.Analytic.Character.Action
import TauCeti.Geometry.Toric.Analytic.Character.Basic
import TauCeti.Geometry.Toric.Analytic.Cone.Manifold
import TauCeti.Geometry.Toric.Analytic.Cone.Orbit
import TauCeti.Geometry.Toric.Analytic.Fan.Cocycle
import TauCeti.Geometry.Toric.Analytic.Fan.Transition

/-!
# Analytic toric geometry: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations pin representative interfaces for the remaining algebraic
targets, finite-fan analytic realization, boundary normal forms, properness, and the comparison
with algebraic complex points.

Every toric object here is Tau Ceti's, from the namespace `TauCeti.Toric`.
`TauCeti/Geometry/Toric/Algebraic/` supplies integral lattices, toric cones, rays and primitive
generators, regular cones, fans with subfans and fan morphisms, dual semigroups, affine toric
schemes, face localizations, and the toric scheme of a regular fan with its toric maps.
`TauCeti/Geometry/Toric/Analytic/` supplies affine complex points with their monomial-embedding
topology, mixed monomial maps, the charts of regular cones, face localizations of complex points,
the coordinate-free complex torus, affine orbits, and, for a regular fan, the diagram of affine
analytic charts with its overlap loci, transitions and cocycle. The targets below are stated on
those objects. Nothing below restates a declaration of the pinned Tau Ceti revision. The gluing
data, the realization and its chart inclusions landed in Tau Ceti after that revision, and the
stand-ins `analyticGlueData`, `analyticRealization` and `analyticAffineChartι` assemble them from
the pinned pieces. The complex atlas of the realization and its manifold theorem also landed after
that revision, and `analyticChartedSpace` and `isManifold_analyticRealization` state them.

Nothing below states a gluing construction for manifolds. The ComplexManifolds roadmap, Milestone 5
(TauCetiProject/TauCetiRoadmap#279), owns it, and Tau Ceti's `TauCeti.chartedSpaceOfIsOpenEmbedding`
(`TauCeti/Geometry/Manifold/Gluing.lean`, after the pinned revision) implements the part that the
complex atlas of the realization uses.
-/

namespace TauCetiRoadmap.AnalyticToricGeometry

open AlgebraicGeometry CategoryTheory Topology TauCeti.Toric
open scoped ContDiff Manifold

universe u

/-! ## Layer 0: the algebraic targets that remain

Tau Ceti proves the statements below for regular cones and regular fans. Layer 0 asks for them
for every toric cone and every finite fan. -/

section AlgebraicSupplier

variable {N : Type u} {V : Type*} [AddCommGroup N] [AddCommGroup V] [Module ℝ V] {i : N →+ V}
  {σ τ : PointedCone ℝ V}

/-- **Layer 0, item 2.** For an integral lattice, the intersection of two toric cones is a toric
cone. The hypothesis is necessary: for the injective but non-discrete map
`TauCeti.Toric.sqrtTwoMap`, `TauCeti.Toric.not_isToricCone_sqrtTwoCone_inf` gives two toric cones
whose intersection is not lattice rational. -/
theorem IsToricCone.inf (hi : IsIntegralLattice i) (hσ : IsToricCone i σ)
    (hτ : IsToricCone i τ) : IsToricCone i (σ ⊓ τ) := by
  sorry

/-- **Layer 0, item 6 (Gordan's lemma).** The dual semigroup of a toric cone is finitely
generated. Tau Ceti proves the regular case as `TauCeti.Toric.IsRegularCone.fg_dualSemigroup`. -/
theorem IsToricCone.fg_dualSemigroup (hi : IsIntegralLattice i) (hσ : IsToricCone i σ) :
    AddMonoid.FG (dualSemigroup hi σ) := by
  sorry

/-- **Layer 0, item 8 (the separation lemma).** Every face of a toric cone is cut out by a
character of its dual semigroup. Tau Ceti proves the regular case as
`TauCeti.Toric.IsRegularCone.exists_mem_dualSemigroup_inf_ker_eq`. -/
theorem IsToricCone.exists_mem_dualSemigroup_inf_ker_eq (hi : IsIntegralLattice i)
    (hσ : IsToricCone i σ) (hτ : τ.IsFaceOf σ) :
    ∃ m ∈ dualSemigroup hi σ,
      σ ⊓ PointedCone.ofSubmodule (LinearMap.ker (hi.realCharacter m)) = τ := by
  sorry

/-- **Layer 0, item 8.** The face morphism `TauCeti.Toric.faceAffineToricSchemeMap` of every face
of a toric cone is an open immersion: the separation lemma applied to Tau Ceti's open immersion
for a face cut out by a character, `TauCeti.Toric.isOpenImmersion_affineToricSchemeMap_inf_ker`.
Tau Ceti proves the regular case as
`TauCeti.Toric.IsRegularCone.isOpenImmersion_faceAffineToricSchemeMap`. -/
theorem IsToricCone.isOpenImmersion_faceAffineToricSchemeMap (hi : IsIntegralLattice i)
    (hσ : IsToricCone i σ) (hτ : τ.IsFaceOf σ) :
    IsOpenImmersion (faceAffineToricSchemeMap hi hτ) := by
  obtain ⟨m, hm, rfl⟩ := IsToricCone.exists_mem_dualSemigroup_inf_ker_eq hi hσ hτ
  have hh : hτ = PointedCone.isFaceOf_inf_ker ((mem_dualSemigroup hi m).1 hm) :=
    Subsingleton.elim _ _
  subst hh
  rw [faceAffineToricSchemeMap_def, faceAffineCoordinateRingMap]
  convert isOpenImmersion_affineToricSchemeMap_inf_ker hi hσ.fg ⟨m, hm⟩ using 1
  exact (affineToricSchemeMap_def ..).symm

/-- **Layer 0, item 9.** The diagram `TauCeti.Toric.Fan.affineToricDiagram` of affine toric charts
of every finite fan is locally directed. With
`IsToricCone.isOpenImmersion_faceAffineToricSchemeMap`, its colimit glues the charts of every
finite fan, as `TauCeti.Toric.Fan.algebraicRealization` does for a regular fan from the regular
case `TauCeti.Toric.Fan.isLocallyDirected_affineToricDiagram`. -/
theorem isLocallyDirected_affineToricDiagram (Φ : Fan i) :
    (Φ.affineToricDiagram ⋙ Scheme.forget).IsLocallyDirected := by
  sorry

end AlgebraicSupplier

/-! ## Layer 0, item 9: the fan scheme over `Spec ℂ`

Stated for lattices in `Type`, where `Spec ℂ` and the fan scheme
`TauCeti.Toric.Fan.algebraicRealization` are schemes of the same universe. -/

section OverSpecComplex

variable {N V : Type} [AddCommGroup N] [AddCommGroup V] [Module ℝ V] {i : N →+ V}

/-- The structure morphisms of the affine toric charts of a fan form a cocone under the chart
diagram. On the chart of a cone it is Mathlib's structure morphism `Spec A ↘ Spec ℂ` of the
`ℂ`-algebra `A = affineCoordinateRing _ σ`, that is, `Spec` of its unit `ℂ → A`. The face
morphisms are `Spec` of `ℂ`-algebra homomorphisms, which is why these commute. -/
noncomputable def algebraicRealizationOverCocone (Φ : Fan i) :
    Limits.Cocone Φ.affineToricDiagram where
  pt := Spec (.of ℂ)
  ι :=
    { app := fun σ ↦ Spec (.of (affineCoordinateRing Φ.lattice σ.1)) ↘ Spec (.of ℂ)
      naturality := by
        intro τ σ h
        change faceAffineToricSchemeMap Φ.lattice (Φ.isFaceOf_of_le σ.2 τ.2 (leOfHom h)) ≫
          Spec.map _ = Spec.map _ ≫ 𝟙 _
        rw [Category.comp_id, faceAffineToricSchemeMap_def, ← Spec.map_comp,
          ← CommRingCat.ofHom_comp]
        congr 2
        exact AlgHom.comp_algebraMap
          (faceAffineCoordinateRingMap Φ.lattice (Φ.isFaceOf_of_le σ.2 τ.2 (leOfHom h))) }

/-- **Layer 0, item 9.** The fan scheme of a regular fan is a scheme over `Spec ℂ`: its structure
morphism descends the structure morphisms of the affine charts through the colimit
`TauCeti.Toric.Fan.isColimitAffineToricCocone`. -/
@[instance_reducible]
noncomputable def algebraicRealizationOver (Φ : Fan i) (hΦ : Φ.IsRegular) :
    (Φ.algebraicRealization hΦ).Over (Spec (.of ℂ)) :=
  OverClass.ofHom ((Φ.isColimitAffineToricCocone hΦ).desc (algebraicRealizationOverCocone Φ))

/-- Every affine chart inclusion `TauCeti.Toric.Fan.affineToricChartι` is a morphism over
`Spec ℂ`. -/
theorem isOver_affineToricChartι (Φ : Fan i) (hΦ : Φ.IsRegular) (σ : Φ.cones) :
    letI := algebraicRealizationOver Φ hΦ
    (Φ.affineToricChartι hΦ σ).IsOver (Spec (.of ℂ)) := by
  let _ := algebraicRealizationOver Φ hΦ
  refine ⟨?_⟩
  have h := (Φ.isColimitAffineToricCocone hΦ).fac (algebraicRealizationOverCocone Φ) σ
  rw [Fan.affineToricCocone_ι_app] at h
  exact h

variable {N' V' : Type} [AddCommGroup N'] [AddCommGroup V'] [Module ℝ V'] {i' : N' →+ V'}
  {Φ : Fan i} {Ψ : Fan i'}

/-- Every toric map `TauCeti.Toric.FanHom.algebraicMap` is a morphism over `Spec ℂ`. -/
theorem isOver_algebraicMap (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular) (hΨ : Ψ.IsRegular) :
    letI := algebraicRealizationOver Φ hΦ
    letI := algebraicRealizationOver Ψ hΨ
    (f.algebraicMap hΦ hΨ).IsOver (Spec (.of ℂ)) := by
  let _ := algebraicRealizationOver Φ hΦ
  let _ := algebraicRealizationOver Ψ hΨ
  refine ⟨Fan.algebraicRealization_hom_ext Φ hΦ fun σ ↦ ?_⟩
  have hΦσ := (isOver_affineToricChartι Φ hΦ σ).comp_over
  have hΨτ := (isOver_affineToricChartι Ψ hΨ ⟨f.leastCone σ.2, f.leastCone_mem σ.2⟩).comp_over
  rw [FanHom.affineToricChartι_comp_algebraicMap_assoc, hΨτ, hΦσ, specOverSpec_over,
    specOverSpec_over, FanHom.affineToricChartMap_def, affineToricSchemeMap_def,
    ← Spec.map_comp, ← CommRingCat.ofHom_comp]
  congr 2
  exact (affineCoordinateRingMap _ _ _ _ _ _).comp_algebraMap

end OverSpecComplex

/-! ## Layers 3 to 5: the glued analytic realization, its torus action, strata, and toric maps -/

section AnalyticRealization

variable {N V : Type u} [AddCommGroup N] [AddCommGroup V] [Module ℝ V] {i : N →+ V}

/-- **Layer 3, item 1.** The gluing data of the affine analytic charts of a regular fan along
their overlap transitions, assembled by `TopCat.GlueData.mk'` from Tau Ceti's chart diagram
`TauCeti.Toric.Fan.analyticAffineChartDiagram`, overlap loci
`TauCeti.Toric.Fan.analyticOverlapOpens`, transitions
`TauCeti.Toric.Fan.analyticOverlapTransition` and cocycle
`TauCeti.Toric.Fan.analyticOverlapHomeomorph_cocycle`.

Tau Ceti's `TauCeti.Toric.Fan.analyticGlueData`
(`TauCeti/Geometry/Toric/Analytic/Fan/GlueData.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. -/
noncomputable def analyticGlueData (Φ : Fan i) (hΦ : Φ.IsRegular) : TopCat.GlueData :=
  TopCat.GlueData.mk'
    { J := Φ.cones
      U σ := (Φ.analyticAffineChartDiagram hΦ).obj σ
      V σ τ := Φ.analyticOverlapOpens hΦ σ τ
      t σ τ := Φ.analyticOverlapTransition hΦ σ τ
      V_id := Φ.analyticOverlapOpens_self hΦ
      t_id σ := by rw [Fan.analyticOverlapTransition_self, TopCat.coe_id]
      t_inter {σ τ} υ x h := by
        -- The transition acts on the `TopCat` object of the overlap open set, whose points are
        -- those of the open set only after unfolding `Opens.toTopCat`.
        erw [Fan.analyticOverlapTransition_apply]
        exact Φ.analyticOverlapHomeomorph_mem hΦ σ τ υ x h
      cocycle σ τ υ x h := by
        have e : ∀ (σ τ : Φ.cones) (y : Φ.analyticOverlapOpens hΦ σ τ),
            Subtype.val (Φ.analyticOverlapTransition hΦ σ τ y) =
              Subtype.val (Φ.analyticOverlapHomeomorph hΦ σ τ y) := fun σ τ y ↦ by
          erw [Fan.analyticOverlapTransition_apply]
        simp only [e]
        exact Φ.analyticOverlapHomeomorph_cocycle hΦ σ τ υ x h }

/-- **Layer 3, item 1.** The analytic realization of a regular fan is the glued space
`TopCat.GlueData.glued`, not a new quotient carrier.

Tau Ceti's `TauCeti.Toric.Fan.analyticRealization`
(`TauCeti/Geometry/Toric/Analytic/Fan/GlueData.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. -/
noncomputable abbrev analyticRealization (Φ : Fan i) (hΦ : Φ.IsRegular) : TopCat :=
  (analyticGlueData Φ hΦ).glued

/-- **Layer 3, item 1.** The inclusion of the affine analytic chart of a cone into the analytic
realization. Its points are the complex points `AffineSemigroupComplexPoint (dualSemigroup _ σ)`
of the affine toric scheme of the cone.

Tau Ceti's `TauCeti.Toric.Fan.analyticAffineChartι`
(`TauCeti/Geometry/Toric/Analytic/Fan/GlueData.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. -/
noncomputable def analyticAffineChartι (Φ : Fan i) (hΦ : Φ.IsRegular) (σ : Φ.cones) :
    (Φ.analyticAffineChartDiagram hΦ).obj σ ⟶ analyticRealization Φ hΦ :=
  (analyticGlueData Φ hΦ).ι σ

/-- **Layer 3, item 5.** A cone of a subfan, as a cone of the ambient fan. -/
def subfanCone (Φ : Fan i) (S : Set (PointedCone ℝ V)) (hS : S ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (σ : (Φ.subfan S hS hface).cones) :
    Φ.cones :=
  ⟨σ.1, hS σ.2⟩

/-- **Layer 3, item 5, the chart comparison.** The identity on complex points, from the chart of a
cone of the subfan to the chart of the same cone in the ambient fan. The two charts have the same
underlying carrier, the complex points `AffineSemigroupComplexPoint (dualSemigroup _ σ)` of the
affine toric scheme of the cone. Their bundled topologies are the monomial-embedding topologies of
the finite generating families that each fan chooses, `TauCeti.Toric.Fan.analyticChartGenerators`,
and the identity on points is continuous by independence of the generating family,
`TauCeti.Toric.affinePointTopology_eq`. -/
noncomputable def subfanAnalyticChartMap (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    (σ : (Φ.subfan S hS hface).cones) :
    ((Φ.subfan S hS hface).analyticAffineChartDiagram (hΦ.subfan S hS hface)).obj σ ⟶
      (Φ.analyticAffineChartDiagram hΦ).obj (subfanCone Φ S hS hface σ) :=
  let g := ((Φ.subfan S hS hface).analyticChartGenerators σ
    ((Fan.isRegular_iff.mp (hΦ.subfan S hS hface)) σ.1 σ.2)).2
  let g' := (Φ.analyticChartGenerators (subfanCone Φ S hS hface σ)
    ((Fan.isRegular_iff.mp hΦ) _ (subfanCone Φ S hS hface σ).2)).2
  @TopCat.ofHom _ _ (affinePointTopology g) (affinePointTopology g')
    (@ContinuousMap.mk _ _ (affinePointTopology g) (affinePointTopology g') id
      (by rw [affinePointTopology_eq g g']; exact @continuous_id _ (affinePointTopology g')))

/-- **Layer 3, item 5.** The chart comparison is an isomorphism, with the identity on points as
its inverse. -/
noncomputable def subfanAnalyticChartIso (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    (σ : (Φ.subfan S hS hface).cones) :
    ((Φ.subfan S hS hface).analyticAffineChartDiagram (hΦ.subfan S hS hface)).obj σ ≅
      (Φ.analyticAffineChartDiagram hΦ).obj (subfanCone Φ S hS hface σ) where
  hom := subfanAnalyticChartMap Φ S hS hface hΦ σ
  inv :=
    let g := ((Φ.subfan S hS hface).analyticChartGenerators σ
      ((Fan.isRegular_iff.mp (hΦ.subfan S hS hface)) σ.1 σ.2)).2
    let g' := (Φ.analyticChartGenerators (subfanCone Φ S hS hface σ)
      ((Fan.isRegular_iff.mp hΦ) _ (subfanCone Φ S hS hface σ).2)).2
    @TopCat.ofHom _ _ (affinePointTopology g') (affinePointTopology g)
      (@ContinuousMap.mk _ _ (affinePointTopology g') (affinePointTopology g) id
        (by rw [affinePointTopology_eq g' g]; exact @continuous_id _ (affinePointTopology g)))
  hom_inv_id := TopCat.ext fun _ ↦ rfl
  inv_hom_id := TopCat.ext fun _ ↦ rfl

@[simp]
theorem subfanAnalyticChartIso_hom (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    (σ : (Φ.subfan S hS hface).cones) :
    (subfanAnalyticChartIso Φ S hS hface hΦ σ).hom = subfanAnalyticChartMap Φ S hS hface hΦ σ :=
  rfl

/-- **Layer 3, item 5.** The chart comparison is an open embedding: it is a homeomorphism. -/
theorem isOpenEmbedding_subfanAnalyticChartMap (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    (σ : (Φ.subfan S hS hface).cones) :
    IsOpenEmbedding (subfanAnalyticChartMap Φ S hS hface hΦ σ) :=
  (TopCat.homeoOfIso (subfanAnalyticChartIso Φ S hS hface hΦ σ)).isOpenEmbedding

/-- **Layer 3, item 5.** The chart comparisons commute with the analytic face maps
`TauCeti.Toric.Fan.analyticFaceMap` of the two fans: both restrict characters along the same
face. -/
theorem analyticFaceMap_comp_subfanAnalyticChartMap (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    {τ σ : (Φ.subfan S hS hface).cones} (f : τ ⟶ σ) :
    (Φ.subfan S hS hface).analyticFaceMap
        ((Fan.isRegular_iff.mp (hΦ.subfan S hS hface)) τ.1 τ.2)
        ((Fan.isRegular_iff.mp (hΦ.subfan S hS hface)) σ.1 σ.2) f ≫
      subfanAnalyticChartMap Φ S hS hface hΦ σ =
    subfanAnalyticChartMap Φ S hS hface hΦ τ ≫
      Φ.analyticFaceMap ((Fan.isRegular_iff.mp hΦ) _ (subfanCone Φ S hS hface τ).2)
        ((Fan.isRegular_iff.mp hΦ) _ (subfanCone Φ S hS hface σ).2)
        (homOfLE (show subfanCone Φ S hS hface τ ≤ subfanCone Φ S hS hface σ from leOfHom f)) :=
  TopCat.ext fun _ ↦ rfl

/-- **Layer 3, item 5.** The chart comparisons form a natural transformation from the chart
diagram of the subfan to the chart diagram of the ambient fan. This is what glues them to the
open-subfan map. -/
theorem analyticAffineChartDiagram_map_comp_subfanAnalyticChartMap (Φ : Fan i)
    (S : Set (PointedCone ℝ V)) (hS : S ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    {τ σ : (Φ.subfan S hS hface).cones} (f : τ ⟶ σ) :
    ((Φ.subfan S hS hface).analyticAffineChartDiagram (hΦ.subfan S hS hface)).map f ≫
      subfanAnalyticChartMap Φ S hS hface hΦ σ =
    subfanAnalyticChartMap Φ S hS hface hΦ τ ≫
      (Φ.analyticAffineChartDiagram hΦ).map
        (homOfLE (show subfanCone Φ S hS hface τ ≤ subfanCone Φ S hS hface σ from leOfHom f)) :=
  analyticFaceMap_comp_subfanAnalyticChartMap Φ S hS hface hΦ f

/-- **Layer 3, item 5.** For a face-closed set `S` of cones of a regular fan `Φ`, the map from the
realization of the subfan `Φ.subfan S hS hface` to the realization of `Φ`, glued from the chart
comparisons `subfanAnalyticChartMap` followed by the ambient chart inclusions.
`analyticAffineChartι_comp_subfanAnalyticMap` computes it on every chart, which identifies it. It
is a morphism of topological spaces; its holomorphy, `isLocalDiffeomorph_subfanAnalyticMap`, is a
property of this same map. -/
noncomputable def subfanAnalyticMap (Φ : Fan i) (S : Set (PointedCone ℝ V)) (hS : S ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular) :
    analyticRealization (Φ.subfan S hS hface) (hΦ.subfan S hS hface) ⟶
      analyticRealization Φ hΦ := by
  sorry

/-- **Layer 3, item 5, the chart computation.** The open-subfan map composed with the inclusion of
the chart of a cone `σ` of the subfan is the chart comparison followed by the inclusion of the
chart of the same cone in the ambient realization. -/
theorem analyticAffineChartι_comp_subfanAnalyticMap (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    (σ : (Φ.subfan S hS hface).cones) :
    analyticAffineChartι (Φ.subfan S hS hface) (hΦ.subfan S hS hface) σ ≫
        subfanAnalyticMap Φ S hS hface hΦ =
      subfanAnalyticChartMap Φ S hS hface hΦ σ ≫
        analyticAffineChartι Φ hΦ (subfanCone Φ S hS hface σ) := by
  sorry

/-- **Layer 3, item 5.** The open-subfan maps are functorial for nested open subfans. The subfan
of `Φ.subfan S hS hface` on `T` is the fan `Φ.subfan T _ hfaceT`, since a fan is determined by its
cones (`TauCeti.Toric.Fan.ext`). -/
theorem subfanAnalyticMap_comp (Φ : Fan i) (S : Set (PointedCone ℝ V)) (hS : S ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular)
    (T : Set (PointedCone ℝ V)) (hT : T ⊆ S)
    (hfaceT : ∀ ⦃σ τ⦄, σ ∈ T → τ.IsFaceOf σ → τ ∈ T) :
    subfanAnalyticMap (Φ.subfan S hS hface) T hT hfaceT (hΦ.subfan S hS hface) ≫
        subfanAnalyticMap Φ S hS hface hΦ =
      subfanAnalyticMap Φ T (hT.trans hS) hfaceT hΦ := by
  sorry

/-- **Layer 3, item 5.** The image of the open-subfan map is the union of the ambient charts of the
subfan's cones. -/
theorem range_subfanAnalyticMap (Φ : Fan i) (S : Set (PointedCone ℝ V)) (hS : S ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular) :
    Set.range (subfanAnalyticMap Φ S hS hface hΦ) =
      ⋃ σ : (Φ.subfan S hS hface).cones,
        Set.range (analyticAffineChartι Φ hΦ (subfanCone Φ S hS hface σ)) := by
  sorry

/-- **Layer 3, item 5.** The open-subfan map is an open embedding of glued spaces. -/
theorem isOpenEmbedding_subfanAnalyticMap (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular) :
    IsOpenEmbedding (subfanAnalyticMap Φ S hS hface hΦ) := by
  sorry

/-- Model vector space determined by the lattice rank. -/
abbrev ToricModel := Fin (Module.finrank ℤ N) → ℂ

/-- **Layer 3, item 2.** The complex atlas of the analytic realization of a regular fan, modelled on
`ℂ ^ n` for `n` the rank of the lattice: the charts of the affine analytic charts, each with the
complex structure of an extending basis (Layer 2, item 3), transported along the chart inclusions
by `TauCeti.chartedSpaceOfIsOpenEmbedding`.

Tau Ceti's `TauCeti.Toric.Fan.analyticChartedSpace`
(`TauCeti/Geometry/Toric/Analytic/Fan/Manifold.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. -/
@[instance_reducible]
noncomputable def analyticChartedSpace (Φ : Fan i) (hΦ : Φ.IsRegular) :
    ChartedSpace (ToricModel (N := N)) (analyticRealization Φ hΦ) := by
  sorry

/-- **Layer 3, item 2.** The analytic realization of a regular fan is a complex manifold: two affine
charts are glued along the chart of their intersection cone by face localizations, which are
biholomorphisms onto their open images (Layer 2, item 5).

Tau Ceti's `TauCeti.Toric.Fan.isManifold_analyticRealization`
(`TauCeti/Geometry/Toric/Analytic/Fan/Manifold.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. -/
theorem isManifold_analyticRealization (Φ : Fan i) (hΦ : Φ.IsRegular) (n : ℕ∞ω) :
    letI := analyticChartedSpace Φ hΦ
    IsManifold 𝓘(ℂ, ToricModel (N := N)) n (analyticRealization Φ hΦ) := by
  sorry

/-- **Layer 3, item 6.** The open-subfan map of item 5 is a holomorphic local diffeomorphism, so,
being an open embedding, a biholomorphism onto an open subset. On the chart of a cone of the subfan
it is the chart comparison, the identity on points, followed by the ambient chart inclusion
(`analyticAffineChartι_comp_subfanAnalyticMap`). For one extending basis and one generating family,
Tau Ceti's `TauCeti.Toric.Fan.analyticAffineChartPartialDiffeomorph` makes both chart inclusions
biholomorphisms onto their open images, so near every point the map is the one composed with the
inverse of the other. -/
theorem isLocalDiffeomorph_subfanAnalyticMap (Φ : Fan i) (S : Set (PointedCone ℝ V))
    (hS : S ⊆ Φ.cones) (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular) :
    letI := analyticChartedSpace (Φ.subfan S hS hface) (hΦ.subfan S hS hface)
    letI := analyticChartedSpace Φ hΦ
    IsLocalDiffeomorph 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N)) ∞
      (subfanAnalyticMap Φ S hS hface hΦ) := by
  sorry

/-- **Layer 4, item 1.** The affine torus actions glue to an action of Tau Ceti's coordinate-free
complex torus `TauCeti.Toric.ComplexTorus N` on the analytic realization. -/
noncomputable def torusAction (Φ : Fan i) (hΦ : Φ.IsRegular) :
    ComplexTorus N →* Equiv.Perm (analyticRealization Φ hΦ) := by
  sorry

/-- **Layer 4, item 1.** On every affine chart the glued action is Tau Ceti's action of the torus
on the complex points of that chart. -/
theorem torusAction_analyticAffineChartι (Φ : Fan i) (hΦ : Φ.IsRegular) (σ : Φ.cones)
    (t : ComplexTorus N) (x : AffineSemigroupComplexPoint (dualSemigroup Φ.lattice σ.1)) :
    torusAction Φ hΦ t (analyticAffineChartι Φ hΦ σ x) = analyticAffineChartι Φ hΦ σ (t • x) := by
  sorry

/-- **Layer 4, item 2.** The torus orbit of a cone: the image, under the inclusion of the chart of
the cone, of Tau Ceti's stratum `TauCeti.Toric.affineConeOrbit` of the cone as a face of itself,
the points at which a monomial is nonzero exactly when its character vanishes on the cone. -/
noncomputable def orbit (Φ : Fan i) (hΦ : Φ.IsRegular) (σ : Φ.cones) :
    Set (analyticRealization Φ hΦ) :=
  analyticAffineChartι Φ hΦ σ '' affineConeOrbit Φ.lattice (⊤ : σ.1.Face)

/-- **Layer 4, item 2.** Face inclusion is the reverse closure order on torus orbits. -/
theorem orbit_subset_closure_iff (Φ : Fan i) (hΦ : Φ.IsRegular) {σ τ : Φ.cones} :
    orbit Φ hΦ τ ⊆ closure (orbit Φ hΦ σ) ↔ σ ≤ τ := by
  sorry

/-- Rays of a finite fan. -/
def FanRay (Φ : Fan i) :=
  {σ : PointedCone ℝ V // σ ∈ Φ.cones ∧ Module.finrank ℝ (Submodule.span ℝ (σ : Set V)) = 1}

/-- **Layer 4, item 3.** The invariant boundary component indexed by a ray. -/
noncomputable def boundaryComponent (Φ : Fan i) (hΦ : Φ.IsRegular) (ρ : FanRay Φ) :
    Set (analyticRealization Φ hΦ) := by
  sorry

/-- **Layer 4, item 3.** Every boundary component is closed. Its hypersurface property follows
from the local normal form below. -/
theorem boundaryComponent_isClosed (Φ : Fan i) (hΦ : Φ.IsRegular) (ρ : FanRay Φ) :
    IsClosed (boundaryComponent Φ hΦ ρ) := by
  sorry

/-- **Layer 4, item 4.** The toric boundary has the holomorphic simple-normal-crossings
coordinate-hyperplane normal form. A complex `PartialDiffeomorph`, rather than a bare
`PartialHomeomorph`, makes each component a complex hypersurface and makes the displayed
coordinates holomorphic. -/
theorem boundary_local_normalForm (Φ : Fan i) (hΦ : Φ.IsRegular) (x : analyticRealization Φ hΦ) :
    letI := analyticChartedSpace Φ hΦ
    ∃ (s : Set (FanRay Φ)) (_hs : s.Finite)
      (j : s ↪ Fin (Module.finrank ℤ N))
      (e : PartialDiffeomorph 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N))
        (analyticRealization Φ hΦ) (ToricModel (N := N)) ∞),
      x ∈ e.source ∧
        ∀ y ∈ e.source, ∀ ρ,
          y ∈ boundaryComponent Φ hΦ ρ ↔
            ∃ hρ : ρ ∈ s, e y (j ⟨ρ, hρ⟩) = 0 := by
  sorry

variable {N' V' : Type u} [AddCommGroup N'] [AddCommGroup V'] [Module ℝ V'] {i' : N' →+ V'}
  {Φ : Fan i} {Ψ : Fan i'}

/-- **Layer 5, item 1.** A fan morphism glues to a continuous analytic map. -/
noncomputable def analyticMap (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular) (hΨ : Ψ.IsRegular) :
    analyticRealization Φ hΦ → analyticRealization Ψ hΨ := by
  sorry

/-- **Layer 5, item 1, the chart computation.** On the chart of a cone `σ`, the glued map is the
map of complex points induced by the map of dual semigroups, into the chart of the least target
cone `TauCeti.Toric.FanHom.leastCone`. This is the analytic counterpart of Tau Ceti's
`TauCeti.Toric.FanHom.affineToricChartι_comp_algebraicMap`. -/
theorem analyticMap_analyticAffineChartι (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular) (hΨ : Ψ.IsRegular)
    (σ : Φ.cones) (x : AffineSemigroupComplexPoint (dualSemigroup Φ.lattice σ.1)) :
    analyticMap f hΦ hΨ (analyticAffineChartι Φ hΦ σ x) =
      analyticAffineChartι Ψ hΨ ⟨f.leastCone σ.2, f.leastCone_mem σ.2⟩
        (AffineSemigroupComplexPoint.comap
          (dualSemigroupMap Φ.lattice Ψ.lattice f.latticeMap f.realMap f.map_lattice
            fun v hv ↦ f.map_le_leastCone σ.2 ⟨v, hv, rfl⟩) x) := by
  sorry

theorem analyticMap_continuous (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular) (hΨ : Ψ.IsRegular) :
    Continuous (analyticMap f hΦ hΨ) := by
  sorry

/-- **Layer 5, item 2.** For the inclusion `TauCeti.Toric.Fan.subfanInclusion` of an open subfan,
the glued map is the open-subfan map of Layer 3, item 5. -/
theorem analyticMap_subfanInclusion (Φ : Fan i) (S : Set (PointedCone ℝ V)) (hS : S ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ⦄, σ ∈ S → τ.IsFaceOf σ → τ ∈ S) (hΦ : Φ.IsRegular) :
    analyticMap (Φ.subfanInclusion S hS hface) (hΦ.subfan S hS hface) hΦ =
      subfanAnalyticMap Φ S hS hface hΦ := by
  sorry

/-- The glued map is holomorphic for regular source and target fans. -/
theorem analyticMap_mdifferentiable (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular) (hΨ : Ψ.IsRegular) :
    letI := analyticChartedSpace Φ hΦ
    letI := analyticChartedSpace Ψ hΨ
    ContMDiff 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N')) ∞
      (analyticMap f hΦ hΨ) := by
  sorry

/-- The finite-fan support condition for properness. -/
def FanHom.SupportCondition (f : FanHom Φ Ψ) : Prop :=
  ∀ τ, τ ∈ Ψ.cones →
    f.realMap ⁻¹' (τ : Set V') =
      ⋃ σ ∈ Φ.cones, ⋃ (_h : σ.map f.realMap ≤ τ), (σ : Set V)

/-- **Layer 5, item 3.** For finite fans with a nonempty source, properness is characterized by the
cone-by-cone support condition. The hypothesis `hΦ₀` is the one `TauCeti.Toric.Fan.denseTorusι`
takes. It is necessary: the inclusion of the empty subfan is proper
(`isProperMap_analyticMap_subfanInclusion_empty`), but fails the support condition
(`not_supportCondition_subfanInclusion_empty`). -/
theorem analyticMap_isProper_iff (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular) (hΨ : Ψ.IsRegular)
    (hΦ₀ : Nonempty Φ.cones) :
    IsProperMap (analyticMap f hΦ hΨ) ↔ FanHom.SupportCondition f := by
  sorry

/-- **Layer 5, item 4.** A nonempty finite regular fan has compact realization exactly when it is
complete. The empty fan is excluded: its realization is empty, hence compact, and it is not
complete. -/
theorem isCompact_univ_iff_isComplete (hΦ : Φ.IsRegular) (hΦ₀ : Nonempty Φ.cones) :
    IsCompact (Set.univ : Set (analyticRealization Φ hΦ)) ↔ Φ.IsComplete := by
  sorry

/-! ### Acceptance check: the empty subfan

The empty set of cones of a fan is face-closed, so it is an open subfan, and it is regular
vacuously. Its realization is empty. The open-subfan constructions of Layer 3, item 5 accept it,
and the properness and compactness criteria exclude it by their nonemptiness hypothesis. -/

/-- The realization of the empty subfan is empty: the chart inclusions of `TopCat.GlueData` are
jointly surjective, and there are no charts. -/
theorem isEmpty_analyticRealization_subfan_empty (Φ : Fan i) (hΦ : Φ.IsRegular)
    (hS : ∅ ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ : PointedCone ℝ V⦄, σ ∈ (∅ : Set _) → τ.IsFaceOf σ → τ ∈ (∅ : Set _)) :
    IsEmpty (analyticRealization (Φ.subfan ∅ hS hface) (hΦ.subfan ∅ hS hface)) :=
  ⟨fun x ↦ by
    obtain ⟨σ, _, _⟩ := (analyticGlueData _ _).ι_jointly_surjective x
    exact Set.notMem_empty _ σ.2⟩

/-- The inclusion of the empty subfan is proper, as is every map out of an empty space. -/
theorem isProperMap_analyticMap_subfanInclusion_empty (Φ : Fan i) (hΦ : Φ.IsRegular)
    (hS : ∅ ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ : PointedCone ℝ V⦄, σ ∈ (∅ : Set _) → τ.IsFaceOf σ → τ ∈ (∅ : Set _)) :
    IsProperMap (analyticMap (Φ.subfanInclusion ∅ hS hface) (hΦ.subfan ∅ hS hface) hΦ) := by
  have := isEmpty_analyticRealization_subfan_empty Φ hΦ hS hface
  refine isProperMap_iff_isClosedMap_and_compact_fibers.2
    ⟨continuous_of_discreteTopology, fun s _ ↦ ?_, fun y ↦ ?_⟩
  · rw [Subsingleton.elim s ∅, Set.image_empty]
    exact isClosed_empty
  · rw [Subsingleton.elim (_ ⁻¹' {y}) ∅]
    exact isCompact_empty

/-- The inclusion of the empty subfan of a nonempty fan fails the support condition: `0` lies in
every ambient cone, and in no cone of the empty subfan. -/
theorem not_supportCondition_subfanInclusion_empty (Φ : Fan i) (hΦ₀ : Nonempty Φ.cones)
    (hS : ∅ ⊆ Φ.cones)
    (hface : ∀ ⦃σ τ : PointedCone ℝ V⦄, σ ∈ (∅ : Set _) → τ.IsFaceOf σ → τ ∈ (∅ : Set _)) :
    ¬ FanHom.SupportCondition (Φ.subfanInclusion ∅ hS hface) := by
  intro h
  obtain ⟨τ, hτ⟩ := hΦ₀.some
  have h0 : (0 : V) ∈ (Φ.subfanInclusion ∅ hS hface).realMap ⁻¹' (τ : Set V) := by
    simp
  rw [h τ hτ] at h0
  simp at h0

end AnalyticRealization

/-! ## Layer 6: the comparison with algebraic complex points

The comparison is stated for lattices in `Type`, where `Spec ℂ` and the fan scheme
`TauCeti.Toric.Fan.algebraicRealization` are schemes of the same universe.

A complex point of a scheme `X` over `Spec ℂ` is a morphism `Spec ℂ ⟶ X` over `Spec ℂ`, in
Mathlib's vocabulary `Scheme.Hom.IsOver`. A bare scheme morphism `Spec ℂ ⟶ X` need not be one: on
an affine chart it is a ring homomorphism from the coordinate ring to `ℂ`, which need not be
`ℂ`-linear. Precomposing a complex point with `Spec` of complex conjugation gives a scheme
morphism that is not a complex point. -/

section Comparison

variable {N V : Type} [AddCommGroup N] [AddCommGroup V] [Module ℝ V] {i : N →+ V}

/-- **Layer 6.** Global algebraic complex points are morphisms `Spec ℂ ⟶ X_Φ` over `Spec ℂ`:
neither prime ideals of `X_Φ` nor bare scheme morphisms from `Spec ℂ`. -/
abbrev AlgebraicComplexPoint (Φ : Fan i) (hΦ : Φ.IsRegular) :=
  letI := algebraicRealizationOver Φ hΦ
  {x : Spec (.of ℂ) ⟶ Φ.algebraicRealization hΦ // x.IsOver (Spec (.of ℂ))}

/-- The complex point of the chart of a cone given by a `ℂ`-algebra homomorphism from its
coordinate ring to `ℂ`, that is, by a point of the analytic chart of the cone. -/
noncomputable def AlgebraicComplexPoint.ofAffinePoint (Φ : Fan i) (hΦ : Φ.IsRegular)
    (σ : Φ.cones) (x : AffineSemigroupComplexPoint (dualSemigroup Φ.lattice σ.1)) :
    AlgebraicComplexPoint Φ hΦ :=
  letI := algebraicRealizationOver Φ hΦ
  haveI := isOver_affineToricChartι Φ hΦ σ
  ⟨Spec.map (CommRingCat.ofHom x.toRingHom) ≫ Φ.affineToricChartι hΦ σ, ⟨by
    rw [Category.assoc, comp_over, specOverSpec_over, ← Spec.map_comp, ← CommRingCat.ofHom_comp,
      show x.toRingHom.comp (algebraMap ℂ _) = algebraMap ℂ ℂ from
        RingHom.ext fun z ↦ x.commutes z]
    rfl⟩⟩

/-- The topology on global algebraic complex points is glued from the independently topologized
affine functor-of-points charts. -/
@[instance_reducible]
noncomputable def algebraicComplexPointTopology (Φ : Fan i) (hΦ : Φ.IsRegular) :
    TopologicalSpace (AlgebraicComplexPoint Φ hΦ) := by
  sorry

/-- The affine algebraic complex-point charts glue to their own named complex atlas. -/
@[instance_reducible]
noncomputable def algebraicComplexPointChartedSpace (Φ : Fan i) (hΦ : Φ.IsRegular) :
    letI := algebraicComplexPointTopology Φ hΦ
    ChartedSpace (ToricModel (N := N)) (AlgebraicComplexPoint Φ hΦ) := by
  sorry

/-- The affine comparisons glue to the global algebraic--analytic comparison. -/
noncomputable def algebraicAnalyticHomeomorph (Φ : Fan i) (hΦ : Φ.IsRegular) :
    @Homeomorph (AlgebraicComplexPoint Φ hΦ) (analyticRealization Φ hΦ)
      (algebraicComplexPointTopology Φ hΦ) inferInstance := by
  sorry

/-- **Layer 6, item 3.** On every affine chart the comparison is the identity of complex points:
the algebraic point of the chart of `σ` given by a `ℂ`-algebra homomorphism `x` goes to the point
`x` of the analytic chart of `σ`. This chart computation identifies the comparison. -/
theorem algebraicAnalyticHomeomorph_ofAffinePoint (Φ : Fan i) (hΦ : Φ.IsRegular) (σ : Φ.cones)
    (x : AffineSemigroupComplexPoint (dualSemigroup Φ.lattice σ.1)) :
    algebraicAnalyticHomeomorph Φ hΦ (AlgebraicComplexPoint.ofAffinePoint Φ hΦ σ x) =
      analyticAffineChartι Φ hΦ σ x := by
  sorry

/-- The global comparison and its inverse are holomorphic. -/
theorem algebraicAnalyticHomeomorph_mdifferentiable (Φ : Fan i) (hΦ : Φ.IsRegular) :
    letI := algebraicComplexPointTopology Φ hΦ
    letI := algebraicComplexPointChartedSpace Φ hΦ
    letI := analyticChartedSpace Φ hΦ
    ContMDiff 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N)) ∞
        (algebraicAnalyticHomeomorph Φ hΦ) ∧
      ContMDiff 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N)) ∞
        (algebraicAnalyticHomeomorph Φ hΦ).symm := by
  sorry

variable {N' V' : Type} [AddCommGroup N'] [AddCommGroup V'] [Module ℝ V'] {i' : N' →+ V'}
  {Φ : Fan i} {Ψ : Fan i'}

/-- A toric map sends complex points to complex points, by composition. -/
noncomputable def AlgebraicComplexPoint.map (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular)
    (hΨ : Ψ.IsRegular) (x : AlgebraicComplexPoint Φ hΦ) : AlgebraicComplexPoint Ψ hΨ :=
  letI := algebraicRealizationOver Φ hΦ
  letI := algebraicRealizationOver Ψ hΨ
  haveI := x.2
  haveI := isOver_algebraicMap f hΦ hΨ
  ⟨x.1 ≫ f.algebraicMap hΦ hΨ, inferInstance⟩

/-- The comparison is natural for fan morphisms: `TauCeti.Toric.FanHom.algebraicMap` on the
algebraic side, `analyticMap` on the analytic side. -/
theorem algebraicAnalyticHomeomorph_naturality (f : FanHom Φ Ψ) (hΦ : Φ.IsRegular)
    (hΨ : Ψ.IsRegular) (x : AlgebraicComplexPoint Φ hΦ) :
    algebraicAnalyticHomeomorph Ψ hΨ (AlgebraicComplexPoint.map f hΦ hΨ x) =
      analyticMap f hΦ hΨ (algebraicAnalyticHomeomorph Φ hΦ x) := by
  sorry

end Comparison

end TauCetiRoadmap.AnalyticToricGeometry
