import Mathlib
import TauCeti.Geometry.Diffeomorphism.Smale
import TauCeti.Geometry.Diffeomorphism.Disc
import TauCeti.Geometry.Manifold.LocallyFlat.Annulus
import TauCeti.Geometry.Manifold.Irreducible
import TauCeti.KnotTheory.Slice.Freedman
import TauCeti.KnotTheory.SmoothLink.Isotopy
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Mostow
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.VirtualFibering
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.VirtualHaken
import TauCeti.LowDimTopology.JSJDecomposition
import TauCeti.LowDimTopology.Geometrization
import TauCeti.Topology.TriangulationConjecture

/-!
# Geometric topology: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`: the resolved problems of
Kirby's list and the classical theorems of three-manifold topology that the roadmap's layers
make statable. Every carrier used here exists at the pins; no definition is made.

Of these, the proofs of Alexander's theorem and the knot-group theorem (Layer 8) are targets
of this roadmap. The proofs of the Smale conjecture (Layer 3), Mostow rigidity (Layer 7), the
Gordon–Luecke theorem and the JSJ theorem (Layer 8) are GeometricTopology, Part II's, which
starts from these statements. The annulus theorem is proved here in dimension at most three;
its higher-dimensional proof is GeometricTopology, Part II's, and its four-dimensional proof
is FourManifolds'. Geometrization, the Poincaré conjecture, Freedman's theorem, Watanabe's
theorem, Agol's theorems and Manolescu's theorem are stated here as the end theorems the
roadmap is built to state; their proofs are owned by the roadmaps named in the README's
*Scope and ownership*.

Not statable at the pins:
* Li's rank-versus-genus theorem (Layer 9.2): there is no Heegaard genus;
* the minimality of the Weeks manifold (Layer 7.4): there is no Weeks manifold;
* Property P, Property R and the cyclic surgery theorem (Layers 5.3, 5.4): there is no Dehn
  filling;
* Kondo's theorem (Layer 4.13): there is no Alexander polynomial of a geometric knot and no
  unknotting number;
* Cerf's theorem (Layer 3.4): there is no orientation-preserving predicate on
  diffeomorphisms of the sphere;
* the Kneser–Milnor theorem (Layer 8.2): there is no connected sum of manifolds;
* the Novikov–Rosenberg theorem (Layer 10.2): the pinned foliations are smooth of a fixed
  leaf dimension but carry no transverse orientation, and incompressibility of a leaf is not
  expressed;
* Zeeman's conjecture (Layer 11.5) is statable, `TauCeti.ZeemanConjecture`, but open, so it is
  not asserted here.
-/

namespace TauCetiRoadmap.GeometricTopology

open Metric Set
open scoped Manifold ContDiff

universe u

/-! ## Layer 2: locally flat embeddings -/

/-- The annulus theorem in every dimension (Kirby for `n + 1 ≥ 5`, Quinn for `n + 1 = 4`,
classical below): two locally flat `n`-spheres in `ℝⁿ⁺¹`, one inside the region bounded by
the other, cobound an annulus. -/
theorem annulus_conjecture (n : ℕ) : TauCeti.AnnulusConjecture n := by
  sorry

/-! ## Layer 3: diffeomorphism groups -/

/-- The Smale conjecture, Hatcher's theorem: the inclusion `O(4) → Diff(S³)` is a homotopy
equivalence (Kirby's Problem 4.34). -/
theorem smale_conjecture : TauCeti.SmaleConjecture := by
  sorry

/-- Watanabe's theorem: `π₁(Diff(D⁴, ∂))` has an element of infinite order, so the
four-dimensional Smale conjecture fails (Kirby's Problem 4.126). -/
theorem watanabe_theorem : TauCeti.WatanabeTheorem := by
  sorry

/-! ## Layer 6: knot concordance -/

/-- Freedman's theorem: a knot in `S³` whose knot group has perfect commutator subgroup, that
is, whose Alexander polynomial is one, is topologically slice (Kirby's Problem 1.36). -/
theorem freedman_slice_theorem : TauCeti.FreedmanSliceTheorem := by
  sorry

/-! ## Layer 7: hyperbolic structures -/

/-- Mostow rigidity: two hyperbolic metrics on a closed connected manifold of dimension at
least three are isometric. -/
theorem mostow_rigidity : TauCeti.MostowRigidity := by
  sorry

/-- Agol's virtual fibering theorem: every closed hyperbolic `3`-manifold has a finite cover
fibering over the circle (Kirby's Problem 3.51). -/
theorem virtual_fibering_conjecture : TauCeti.VirtualFiberingConjecture := by
  sorry

/-- Agol's virtual Haken theorem: every closed hyperbolic `3`-manifold has a finite cover that
is Haken. -/
theorem virtual_haken_conjecture : TauCeti.VirtualHakenConjecture := by
  sorry

/-! ## Layer 8: decompositions of 3-manifolds -/

/-- Alexander's theorem: every locally flat `2`-sphere in `S³` bounds a `3`-ball. -/
theorem alexander_sphere_bounds_ball :
    TauCeti.IsSphereBoundsBall (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- The knot-group theorem (Dehn's lemma, Papakyriakopoulos): a knot in `S³` whose knot group
is infinite cyclic at some basepoint of its complement is ambient isotopic to the unknot. -/
theorem smoothAmbientIsotopic_unknot_of_knotGroup
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (x : ((range K)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)))
    (h : Nonempty (K.KnotGroup x ≃* Multiplicative ℤ)) :
    TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic
      (TauCeti.SmoothLinkEmbedding.singleton K)
      (TauCeti.SmoothLinkEmbedding.singleton TauCeti.unknot) := by
  sorry

/-- The Gordon–Luecke theorem: two knots in `S³` with homeomorphic complements are carried
onto each other by a homeomorphism of `S³`. -/
theorem gordon_luecke
    (K J : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (h : Nonempty (((range K)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)) ≃ₜ
      ((range J)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)))) :
    ∃ e : sphere (0 : EuclideanSpace ℝ (Fin 4)) 1 ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1,
      e '' range K = range J := by
  sorry

/-- The JSJ theorem (Jaco–Shalen, Johannson): every closed orientable irreducible `3`-manifold
has a minimal torus decomposition into Seifert fibred and atoroidal pieces, unique up to
ambient isotopy. -/
theorem jsj_theorem : TauCeti.JSJTheorem := by
  sorry

/-- The geometrization theorem (Thurston's conjecture, Perelman's theorem; Kirby's Problem
3.45): every closed orientable irreducible `3`-manifold has a geometric torus decomposition
into Seifert fibred and finite-volume hyperbolic pieces. -/
theorem geometrization_conjecture : TauCeti.GeometrizationConjecture := by
  sorry

/-- The Poincaré conjecture: a closed simply connected `3`-manifold is homeomorphic to `S³`. -/
theorem poincare_conjecture (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M]
    [T2Space M] [SecondCountableTopology M] [SimplyConnectedSpace M] :
    Nonempty (M ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-! ## Layer 11: triangulations -/

/-- Manolescu's theorem: the triangulation conjecture fails in every dimension `n ≥ 5`, that
is, there is a closed topological `n`-manifold that is not homeomorphic to the realization
of any simplicial complex. -/
theorem manolescu_triangulation_conjecture_false (n : ℕ) (hn : 5 ≤ n) :
    ¬ TauCeti.TriangulationConjecture.{u} n := by
  sorry

end TauCetiRoadmap.GeometricTopology
