import Mathlib
import TauCeti.Geometry.Manifold.Basic
import TauCeti.Geometry.Manifold.Orientation

/-!
# Teichmüller geometry of closed surfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins.

Stated here:

* the smooth based realization half of the Dehn–Nielsen–Baer theorem (T6): every automorphism of
  the fundamental group of a closed orientable surface with nonabelian fundamental group is induced
  by a basepoint-fixing diffeomorphism;
* the projective model of the hyperbolic isometry group (T9): Mathlib's action of `GL (Fin 2) ℝ`
  on `ℍ`, with negative-determinant matrices acting through complex conjugation, induces an
  isomorphism from `GL (Fin 2) ℝ` modulo its centre onto the isometry group of `ℍ`.

Not statable at the pins:

* the Teichmüller space `Teich(Σ)` and its complex structure of dimension `3g − 3` (T1, T2), the
  Fenchel–Nielsen homeomorphism `Teich(Σ) ≃ (0,∞)^(3g−3) × ℝ^(3g−3)` and the completeness of the
  Teichmüller metric (T5), the Nielsen realization theorem and the fixed-locus dimension formula
  (T7), and the open dense loci of T7–T10: no carrier for the marked quotient of the integrable
  almost-complex structures by `Diff₀⁺(Σ)` exists at the pins;
* the full Dehn–Nielsen–Baer isomorphism `Mod±(Σ) ≃ Out(π₁ Σ)` and the Baer–Epstein kernel theorem
  (T6): Mathlib has no topology on `Diffeomorph` and no smooth isotopy relation, so the mapping
  class group `π₀ Diff(Σ)` has no carrier;
* the marked holonomy comparison with discrete faithful representations of Euler number `2 − 2g`
  (T4a, T4b): there is no Euler number of a surface-group representation at the pins;
* the genus of a closed surface: Mathlib and Tau Ceti have no genus, so statements indexed by `g`
  are not statable; the realization theorem below uses the equivalent hypothesis that the surface
  is orientable with nonabelian fundamental group.
-/

namespace TauCetiRoadmap.TeichmullerGeometry

open scoped Manifold ContDiff UpperHalfPlane

/-! ## Layer T6: mapping classes and automorphisms -/

/-- **Dehn–Nielsen realization, smooth and based.** Let `S` be a smooth closed connected orientable
surface whose fundamental group is nonabelian (equivalently, of genus at least two). Every
automorphism `α` of `π₁(S, x₀)` is induced by a diffeomorphism `f` of `S` fixing `x₀`. This is
the surjectivity of `Mod±(S, x₀) → Aut(π₁(S, x₀))` (Farb–Margalit, *A Primer on Mapping Class
Groups*, Chapter 8, for the outer version; inner automorphisms are realized by point pushing). -/
theorem exists_diffeomorph_mapOfEq_eq
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) ∞ S]
    (hS : TauCeti.IsClosedConnectedSurface S) (x₀ : S)
    (hna : ∃ a b : FundamentalGroup S x₀, a * b ≠ b * a)
    (α : FundamentalGroup S x₀ ≃* FundamentalGroup S x₀) :
    ∃ (f : Diffeomorph (𝓡 2) (𝓡 2) S S ∞) (hf : f x₀ = x₀),
      FundamentalGroup.mapOfEq (f.toHomeomorph : C(S, S)) hf = α.toMonoidHom := by
  sorry

/-! ## Layer T9: the projective model of `Isom(ℍ)` -/

/-- **The isometry group of the hyperbolic plane is `PGL₂(ℝ)`.** Mathlib's action of
`GL (Fin 2) ℝ` on the upper half-plane (Möbius transformations for positive determinant, their
composition with complex conjugation for negative determinant) is by isometries of the hyperbolic
distance; every isometry of `ℍ` arises; and its kernel is the centre, the nonzero scalar
matrices. Together: an isomorphism `GL(2, ℝ)/Z ≃* Isom(ℍ)` compatible with the action. -/
theorem exists_mulEquiv_isometryEquiv_glAction :
    ∃ e : (GL (Fin 2) ℝ ⧸ Subgroup.center (GL (Fin 2) ℝ)) ≃* (ℍ ≃ᵢ ℍ),
      ∀ (g : GL (Fin 2) ℝ) (z : ℍ), e (QuotientGroup.mk g) z = g • z := by
  sorry

end TauCetiRoadmap.TeichmullerGeometry
