module
import Mathlib
import TauCeti.Geometry.Diffeomorphism.Smale
import TauCeti.Geometry.Diffeomorphism.Disc
import TauCeti.Geometry.Manifold.LocallyFlat.Annulus
import TauCeti.KnotTheory.Slice.Freedman
import TauCeti.KnotTheory.Markov.Basic
import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Mostow
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.VirtualHaken
import TauCeti.LowDimTopology.JSJDecomposition
import TauCeti.LowDimTopology.Geometrization
import TauCeti.Topology.VirtuallyFibered
import TauCeti.Topology.Triangulable.Basic
import TauCeti.Geometry.Manifold.Basic

/-!
# Geometric topology and the solved Kirby-list problems: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`: the deep results the
finished roadmap proves, on the carriers that exist at the pins. Nothing here is an API
catalogue, a Check or a definition of the roadmap's own.

Statable at the pins, and stated below: the Smale conjecture (Layer 3) and Watanabe's theorem
(Layer 3) on the native `TauCeti.SmaleConjecture` and `TauCeti.WatanabeTheorem`; the annulus
theorem in every dimension (Layer 2) on `TauCeti.AnnulusConjecture`; Markov's theorem in its
combinatorial form (Layer 4) on the native braid words, Markov equivalence, braid closures and
Reidemeister equivalence of oriented PD-codes; Freedman's theorem (Layer 4) on
`TauCeti.FreedmanSliceTheorem`; Mostow rigidity (Layer 7) on `TauCeti.MostowRigidity`; Agol's
virtual fibering and virtual Haken theorems (Layer 7) on `TauCeti.IsVirtuallyFibered` and
`TauCeti.VirtualHakenConjecture`; the JSJ theorem and the geometrization theorem (Layer 8) on
`TauCeti.JSJTheorem` and `TauCeti.GeometrizationConjecture`; the Poincaré conjecture (Layer 8) on
Mathlib's `Diffeomorph` and the round three-sphere; and Manolescu's theorem (Layer 11) on
`TauCeti.IsClosedConnectedManifold` and `TauCeti.IsTriangulable`.

Not statable at the pins, and not stated: Property P and Property R (Layer 5) lack Dehn filling
and surgery; the minimal volume theorem (Layer 7) lacks the Weeks manifold, which lacks the Dehn
filling that defines it; Cerf's theorem (Layer 3) lacks the orientation-preserving subgroup of
`TauCeti.Diff`; Reidemeister's theorem (Layer 4) lacks the diagram of a generic projection of a
smooth link; the agreement of the three Alexander routes (Layer 4) lacks the Seifert matrix of a
diagram; Li's theorem (Layer 9) lacks handlebodies and the Heegaard genus; Thurston's inequality
and Yazdi's theorem (Layer 10) lack the Euler class of a plane bundle and the Thurston norm; the
Kneser–Milnor prime decomposition (Layer 8) lacks the connected sum. Brown's bicollaring theorem
(Layer 2) is proved at the pin as `TauCeti.brownBicollaring`, so it is consumed, not stated.
Zeeman's conjecture (Layer 11) is an open conjecture recorded at the pin as
`TauCeti.ZeemanConjecture`; the roadmap states it and claims nothing about it, so it is not a
theorem here.

The universe-polymorphic native statements are stated at an arbitrary universe `u`. Manolescu's
theorem is stated with the manifold in `Type` and the triangulating complexes with vertex type in
`Type`; for a compact space this loses nothing, since a triangulating complex of a compact space
has finitely many faces and relabels onto a finite vertex type (README, 11.2).
-/

open scoped Manifold ContDiff

universe u

namespace TauCetiRoadmap.GeometricTopology

/-! ## Layer 2: locally flat embeddings in general dimension -/

/-- **The annulus theorem** (Kirby for `n + 1 ≥ 5`, Quinn for `n + 1 = 4`, Moise and Radó below):
two locally flat `n`-spheres in `ℝⁿ⁺¹`, one inside the open region bounded by the other, cobound
a closed region homeomorphic to `Sⁿ × [0, 1]`, in every dimension `n`. README, 2.4. -/
theorem annulus_theorem (n : ℕ) : TauCeti.AnnulusConjecture n := by
  sorry

/-! ## Layer 3: diffeomorphism groups with the C^∞ topology -/

/-- **The Smale conjecture** (Hatcher): the continuous inclusion `O(4) → Diff(S³)` of the
orthogonal group into the weak-Whitney space of smooth self-diffeomorphisms of the round
three-sphere is a homotopy equivalence. README, 3.3. -/
theorem smale_conjecture : TauCeti.SmaleConjecture := by
  sorry

/-- **Watanabe's theorem**: `π₁(Diff(D⁴, ∂))`, based at the identity, has an element of infinite
order; hence `Diff(D⁴, ∂)` is not contractible and the four-dimensional disc Smale conjecture
fails (Watanabe, Theorem 1.1 and Remark 1.2). README, 3.3. -/
theorem watanabe_theorem : TauCeti.WatanabeTheorem := by
  sorry

/-! ## Layer 4: knot theory, done properly (owned here) -/

/-- **Markov's theorem**, combinatorial form (Birman, Theorem 2.3; Lickorish, Theorem 16.10): the
braids represented by two words, on `n + 1` and `m + 1` strands, are Markov equivalent exactly when
the oriented PD-codes of their closures are Reidemeister equivalent. README, 4.3. -/
theorem markov_theorem {n m : ℕ} (w : TauCeti.BraidWord (n + 1)) (v : TauCeti.BraidWord (m + 1)) :
    TauCeti.MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔
      TauCeti.OrientedPDCode.ReidemeisterEquiv w.closure v.closure := by
  sorry

/-- **Freedman's theorem**: a knot in `S³` whose knot group has perfect commutator subgroup, that
is, whose Alexander polynomial is `1`, is topologically slice (Freedman; Freedman–Quinn, Theorem
11.7B; Kirby's Problem 1.36). README, 4.6. -/
theorem freedman_slice_theorem : TauCeti.FreedmanSliceTheorem := by
  sorry

/-! ## Layer 7: Riemannian geometric structures and volume -/

/-- **Mostow rigidity**, metric form (Mostow; Ratcliffe, Theorem 11.8.5): any two hyperbolic
metrics on a closed connected manifold of dimension at least three are isometric. README, 7.2. -/
theorem mostow_rigidity : TauCeti.MostowRigidity := by
  sorry

/-- **Agol's virtual fibering theorem** (Agol, Theorem 9.2; Kirby's Problem 3.51): every closed
hyperbolic `3`-manifold has a connected finite cover that fibers over the circle. README, 7.4. -/
theorem agol_virtually_fibered (M : Type u) [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [CompactSpace M]
    [ConnectedSpace M] (h : TauCeti.IsHyperbolic (I := 𝓡 3) (M := M)) :
    TauCeti.IsVirtuallyFibered M := by
  sorry

/-- **Agol's virtual Haken theorem** for closed hyperbolic `3`-manifolds (Agol, Theorem 9.1 in its
hyperbolic case): every closed hyperbolic `3`-manifold has a finite cover that is a closed Haken
`3`-manifold. README, 7.4. -/
theorem agol_virtually_haken : TauCeti.VirtualHakenConjecture.{u} := by
  sorry

/-! ## Layer 8: Thurston geometries and the JSJ / geometric decomposition -/

/-- **The JSJ decomposition theorem** (Jaco–Shalen, Johannson; Hatcher, Theorem 1.9): every closed
orientable irreducible `3`-manifold has a minimal family of disjoint locally flat incompressible
tori cutting it into Seifert fibred and atoroidal pieces, and any two such families are carried
onto each other by an ambient isotopy. README, 8.3. -/
theorem jsj_theorem : TauCeti.JSJTheorem.{u} := by
  sorry

/-- **The geometrization theorem** (Thurston's conjecture, Kirby's Problem 3.45; Perelman): every
closed orientable irreducible `3`-manifold has a geometric torus decomposition, a finite family of
disjoint locally flat incompressible tori whose complementary components are Seifert fibred or
hyperbolic of finite volume. README, 8.4. -/
theorem geometrization_theorem : TauCeti.GeometrizationConjecture.{u} := by
  sorry

/-- **The Poincaré conjecture** (Perelman): a closed simply connected smooth `3`-manifold is
diffeomorphic to the round three-sphere. README, 8.4. -/
theorem poincare_conjecture (M : Type) [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [CompactSpace M]
    [SimplyConnectedSpace M] :
    Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-! ## Layer 11: triangulations, PL structures, and collapse -/

/-- **Manolescu's theorem** (Manolescu, Theorem 1.1 of the lectures): in every dimension `n ≥ 5`
there is a closed connected topological `n`-manifold that is not homeomorphic to the realization
of any abstract simplicial complex. README, 11.2. -/
theorem manolescu_theorem (n : ℕ) (hn : 5 ≤ n) :
    ∃ (M : Type) (_ : TopologicalSpace M) (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M),
      TauCeti.IsClosedConnectedManifold n M ∧ ¬ TauCeti.IsTriangulable.{0} M := by
  sorry

end TauCetiRoadmap.GeometricTopology
