import Mathlib
import TauCeti.Geometry.Manifold.Basic
import TauCeti.Geometry.Manifold.Orientation
import TauCeti.Geometry.Diffeomorphism.Group
import TauCeti.Geometry.Diffeomorphism.Topology
import TauCeti.Geometry.Diffeomorphism.Diffeotopy.Path
import TauCeti.Geometry.Diffeomorphism.Disc

/-!
# Teichmüller geometry of closed surfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins.

Stated here:

* the smooth based realization half of the Dehn–Nielsen–Baer theorem (Layer 5): every
  automorphism of the fundamental group of a closed orientable surface is induced by a
  basepoint-fixing diffeomorphism;
* the smooth Baer–Epstein kernel theorem (Layer 5): a diffeomorphism of a closed orientable
  surface that is homotopic to the identity is the final slice of a smooth diffeotopy, Tau Ceti's
  `TauCeti.Diffeotopy`;
* Smale's theorem on the disc (Layer 5): the group `Diff(D², ∂)` of Tau Ceti, with the weak
  Whitney topology, is contractible;
* the projective model of the hyperbolic isometry group (Layer 4): Mathlib's action of
  `GL (Fin 2) ℝ` on `ℍ`, with negative-determinant matrices acting through complex conjugation,
  induces an isomorphism from `GL (Fin 2) ℝ` modulo its centre onto the isometry group of `ℍ`.

Not statable at the pins:

* the Teichmüller space `Teich(Σ)` and its complex structure of dimension `3g − 3` (Layers 1, 2),
  the Fenchel–Nielsen homeomorphism `Teich(Σ) ≃ (0,∞)^(3g−3) × ℝ^(3g−3)` and the completeness of
  the Teichmüller metric (Layer 7), the Nielsen realization theorem and the fixed-locus dimension
  formula (Layer 8), and the open dense loci of Layers 8–11: no carrier for the marked quotient of
  the integrable almost-complex structures by `Diff₀⁺(Σ)` exists at the pins;
* the full Dehn–Nielsen–Baer isomorphism `Mod±(Σ) ≃ Out(π₁ Σ)` (Layer 5): the pinned Tau Ceti
  has the topological group `TauCeti.Diff` with `Diffeomorph.weakWhitneyTopology`, so `π₀ Diff(Σ)`
  is `ZerothHomotopy` of it, but neither a group structure on that `ZerothHomotopy` nor an outer
  automorphism group `Out` of a group exists at the pins, and the comparison map needs the change of
  basepoint along a path; the two halves of the theorem are stated separately above;
* the marked holonomy comparison with discrete faithful representations of Euler number `2 − 2g`
  (Layers 4, 6): there is no Euler number of a surface-group representation at the pins;
* the finiteness of arithmetic lattices of fixed signature (Layer 9): there is no arithmetic
  Fuchsian group at the pins;
* the genus of a closed surface: Mathlib and Tau Ceti have no genus, so statements indexed by `g`
  are not statable; the two Layer 5 theorems below are stated for every closed orientable surface,
  which is their true generality.
-/

namespace TauCetiRoadmap.TeichmullerGeometry

open scoped Manifold ContDiff UpperHalfPlane TauCeti.DiffeomorphWeakWhitney

/-! ## Layer 5: mapping classes, automorphisms and stabilizers -/

/-- **Dehn–Nielsen realization, smooth and based.** Let `S` be a smooth closed connected orientable
surface. Every automorphism `α` of `π₁(S, x₀)` is induced by a diffeomorphism `f` of `S` fixing
`x₀`. This is the surjectivity of `Mod±(S, x₀) → Aut(π₁(S, x₀))`: for genus at least two it is
the Douady–Earle realization of the outer class composed with point pushing for the inner part
(Layer 5.2), for the torus every automorphism of `ℤ²` is a matrix of `GL₂(ℤ)` realized by the
induced linear diffeomorphism of `ℝ²/ℤ²` fixing the origin, and for the sphere `π₁` is trivial
(Farb–Margalit, *A Primer on Mapping Class Groups*, Chapter 8, for the outer version). -/
theorem exists_diffeomorph_mapOfEq_eq
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) ∞ S]
    (hS : TauCeti.IsClosedConnectedSurface S) (x₀ : S)
    (α : FundamentalGroup S x₀ ≃* FundamentalGroup S x₀) :
    ∃ (f : Diffeomorph (𝓡 2) (𝓡 2) S S ∞) (hf : f x₀ = x₀),
      FundamentalGroup.mapOfEq (f.toHomeomorph : C(S, S)) hf = α.toMonoidHom := by
  sorry

/-- **The smooth Baer–Epstein kernel theorem.** A diffeomorphism of a smooth closed connected
orientable surface that is homotopic to the identity through continuous maps is the final slice
of a smooth diffeotopy, that is, it is smoothly isotopic to the identity. This is the injectivity
of `Mod±(S) → Out(π₁ S)` (Layer 5.4): Epstein's theorem gives a topological isotopy, and the
smoothing comparison of `PlanarTopology` Layer 8 makes it smooth. -/
theorem baer_epstein_smooth
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) ∞ S]
    (hS : TauCeti.IsClosedConnectedSurface S)
    (f : TauCeti.Diff (𝓡 2) S ∞)
    (hf : ContinuousMap.Homotopic (f.toHomeomorph : C(S, S)) (ContinuousMap.id S)) :
    ∃ Φ : TauCeti.Diffeotopy (𝓡 2) ∞ S, Φ.final = f := by
  sorry

/-- **Smale's theorem on the disc.** The group `Diff(D², ∂)` of smooth self-diffeomorphisms of the
closed unit disc fixing the boundary circle pointwise, with the weak Whitney topology, is
contractible (Smale, *Diffeomorphisms of the 2-sphere*, Proc. AMS 10 (1959), Theorem B, for the
diffeomorphisms that are the identity near the boundary; Layer 5.3 passes from "near the boundary"
to "on the boundary"). Its path-connectedness, `π₀ Diff(D², ∂) = 0`, is the disc input of the
Alexander method used by the kernel theorem. -/
theorem contractibleSpace_discDiff_two : ContractibleSpace (TauCeti.DiscDiff 2) := by
  sorry

/-! ## Layer 4: the projective model of `Isom(ℍ)` -/

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
