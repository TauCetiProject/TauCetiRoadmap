import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.Genus
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic

/-!
# Genus-one fibrations and rational elliptic surfaces: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. Discharging these statements finishes neither a layer nor the roadmap.

The statements are Ferrand's scheme pushout existence with its affine-neighborhood hypothesis
(§1.5), the affine ADE matrix classification (§2.5), rational points on smooth genus-one curves
over every finite field (§2.15), the classification of smooth proper genus-one curves over
F₂ by five projective Weierstrass models (§2.22), and the characteristic-two-or-three restriction
for regular nonsmooth genus-one curves (§4.16). The genus is the native coherent-cohomology
genus; its finite-dimensionality instance is explicit because that definition requires it.

Algebraic-space pinching (§§1.9–1.11) requires an algebraic-space carrier absent from the pin.
The global conductor reconstruction needs the constructed conductor ideal sheaves and their
subscheme maps. The geometric Kodaira classification (§2.5) needs the actual fibre divisors,
intersection lengths and incidence schemes. The matrix theorem alone does not encode them.
Multiple-fibre isogenies and the LLR comparisons (Layer 3) need regular minimal genus-one
models, their Jacobians and the scheme-level Néron/Picard and isogeny comparisons.

The canonical bundle formula, geometric Shioda–Tate and the Picard-lattice realization
(Layer 4) require surface intersection and relative dualizing-sheaf constructions. Picard
constancy (Layer 5) needs the geometric Picard scheme and its Frobenius/cycle-class comparison.
The fourteen-model classification, its eleven nonzero-j and three zero-j classes, and the
nonrational-fibre theorems (Layers 6–7) require resolved relatively minimal Jacobian surfaces,
their geometric fibre types, Picard constancy and pointed fibration equivalence. These
interfaces are absent from the pins, so those headline signatures are deferred.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TauCeti.AlgebraicGeometry

universe u

/-- Ferrand's scheme existence theorem: finite pinching with the affine-neighborhood
hypothesis gives a categorical and cartesian square with finite and closed canonical maps. -/
theorem ferrand_scheme_pushout_exists {Z Y Z' : Scheme.{u}}
    (i : Z ⟶ Y) (g : Z ⟶ Z') [IsClosedImmersion i] [IsFinite g]
    (haffine : ∀ z' : Z', ∃ U : Y.Opens, IsAffineOpen U ∧
      ∀ z : Z, g z = z' → i z ∈ U) :
    ∃ (P : Scheme.{u}) (a : Y ⟶ P) (b : Z' ⟶ P),
      IsPushout i g a b ∧ IsPullback i g a b ∧ IsFinite a ∧ IsClosedImmersion b := by
  sorry

/-- A connected integral fiber matrix with a positive primitive null vector is negative affine ADE,
and its primitive coefficients are the diagram marks under the same reindexing. -/
theorem canonicalFiber_affineMatrixClassification {ι : Type*}
    [Fintype ι] [DecidableEq ι] [Nonempty ι] (M : Matrix ι ι ℤ) (m : ι → ℤ)
    (hsymm : ∀ i j, M i j = M j i) (hdiag : ∀ i, M i i = -2)
    (hoff : ∀ i j, i ≠ j → 0 ≤ M i j)
    (hconn : ∀ i j, Relation.ReflTransGen (fun a b => a ≠ b ∧ 0 < M a b) i j)
    (hpos : ∀ i, 0 < m i) (hprim : Finset.univ.gcd (fun i => (m i).natAbs) = 1)
    (hnull : Matrix.mulVec M m = 0) :
    ∃ t : TauCeti.AffineDynkinType, t.Valid ∧ ∃ e : ι ≃ Fin t.nodes,
      (∀ i j, M i j = -t.cartanMatrix (e i) (e j)) ∧
      (∀ i, m i = t.marks (e i)) := by
  sorry

/-- Every smooth proper geometrically connected genus-one curve over a finite field has
an actual rational point, expressed as a section of its structure morphism. -/
theorem genusOne_finiteField_hasPoint (k : Type u) [Field k] [Finite k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [GeometricallyConnected (X ↘ Spec (.of k))]
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    (hdim : topologicalKrullDim X = 1) (hg : X.genus k = 1) :
    ∃ p : Spec (.of k) ⟶ X, p ≫ (X ↘ Spec (.of k)) = 𝟙 _ := by
  sorry

/-- The five binary equations, in increasing order of rational point count.
Their native projective schemes represent the classes in `genusOne_F2_classification`. -/
def F2Model : Fin 5 → WeierstrassCurve (ZMod 2) :=
  ![⟨0, 1, 1, 0, 1⟩, ⟨1, 1, 0, 1, 0⟩, ⟨0, 0, 1, 0, 0⟩,
    ⟨1, 0, 0, 1, 0⟩, ⟨0, 1, 1, 0, 0⟩]

/-- Every smooth proper geometrically connected genus-one curve over F₂ is isomorphic
over F₂ to exactly one of the five projective models. No rational point is assumed. -/
theorem genusOne_F2_classification (X : Scheme.{0}) [X.Over (Spec (.of (ZMod 2)))]
    [Smooth (X ↘ Spec (.of (ZMod 2)))] [IsProper (X ↘ Spec (.of (ZMod 2)))]
    [GeometricallyConnected (X ↘ Spec (.of (ZMod 2)))]
    [FiniteDimensional (ZMod 2)
      (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    (hdim : topologicalKrullDim X = 1) (hg : X.genus (ZMod 2) = 1) :
    ∃! i : Fin 5, ∃ e : X ≅ (F2Model i).projModel,
      e.hom ≫ (F2Model i).projModelOver = (X ↘ Spec (.of (ZMod 2))) := by
  sorry

/-- A regular nonsmooth proper geometrically integral genus-one curve can occur only
in characteristic two or three. Regularity is imposed on its actual local rings. -/
theorem regularGenusOne_char_two_or_three (k : Type u) [Field k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))]
    [∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)]
    [FiniteDimensional k (Scheme.Modules.Cohomology (InvertibleSheaf.trivial X).obj 1)]
    (hdim : topologicalKrullDim X = 1) (hg : X.genus k = 1)
    (hnonsmooth : ¬ Smooth (X ↘ Spec (.of k))) :
    ringChar k = 2 ∨ ringChar k = 3 := by
  sorry

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII
