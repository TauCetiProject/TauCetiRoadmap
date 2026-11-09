module
public import Mathlib
public import TauCeti.Geometry.Diffeomorphism.Smale
public import TauCeti.Geometry.Diffeomorphism.Disc
public import TauCeti.Geometry.Diffeomorphism.Cerf
public import TauCeti.Geometry.Manifold.Basic
public import TauCeti.Geometry.Manifold.LocallyFlat.Annulus
public import TauCeti.Geometry.Manifold.Irreducible
public import TauCeti.Geometry.Manifold.Haken
public import TauCeti.Geometry.Manifold.Foliation.EulerClass
public import TauCeti.KnotTheory.Slice.Freedman
public import TauCeti.KnotTheory.HomologyConcordance
public import TauCeti.KnotTheory.SmoothLink.Isotopy
public import TauCeti.KnotTheory.Markov.Basic
public import TauCeti.KnotTheory.BraidWord.PDCode
public import TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Mostow
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.VirtualFibering
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.VirtualHaken
public import TauCeti.LowDimTopology.JSJDecomposition
public import TauCeti.LowDimTopology.Geometrization
public import TauCeti.Topology.TriangulationConjecture
public import TauCeti.Topology.Triangulable.Basic
public import TauCeti.LowDimTopology.SeifertFibration
public import TauCeti.LowDimTopology.SolidTorusNeighborhood.Exterior
public import TauCeti.LowDimTopology.DehnSurgery.Filling
public import TauCeti.LowDimTopology.DehnSurgery.Cosmetic
public import TauCeti.LowDimTopology.PrimeDecomposition
public import TauCeti.LowDimTopology.Heegaard.RankGenus
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Weeks

/-!
# Geometric topology: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`: the resolved problems of
Kirby's list and the classical theorems of surface and three-manifold topology that the
roadmap's layers make statable. Every carrier used here exists at the pins; no definition is made,
and nothing here is an API catalogue or a Check.

Of these, the proofs of Markov's theorem in its combinatorial form (Layer 4.2), Mathieu's
chirally cosmetic surgeries (Layer 5.3), Mostow rigidity (Layer 7.2), Alexander's theorem, the
sphere theorem and the knot-group theorem (Layer 8.1), the Kneser–Milnor theorem (Layer 8.2),
Waldhausen's theorem (Layer 8.3), Radó's triangulation theorem (Layer 11.2.1) and Moise's
triangulation theorem (Layer 11.2) are targets of this roadmap. Levine's homology-concordance
theorem (Layer 6.4) is reduced here to Levine's satellite theorem, whose proof is
GeometricTopology, Part II's. The proofs of the Smale conjecture and of Cerf's theorem
(Layer 3.4), the cyclic surgery theorem (Layer 5.4), the Gordon–Luecke theorem in its filling
form (Layer 5.3) and on complements (Layer 8.1), the JSJ theorem (Layer 8.5), and of Thurston's
Euler class inequality and Yazdi's theorem
(Layer 10.5) are GeometricTopology, Part II's, which starts from these statements. The annulus
theorem is proved here in dimension at most three; its higher-dimensional proof is
GeometricTopology, Part II's, and its four-dimensional proof is FourManifolds'. Geometrization,
the Poincaré conjecture in its topological and its smooth form, Freedman's theorem, Watanabe's
theorem, Agol's theorems and Manolescu's theorem in both its forms are stated here as the end
theorems the roadmap is built to state; their proofs are owned by the roadmaps named in the
README's *Scope and ownership*. Property P, Property R, the theorem of Gabai, Meyerhoff and Milley
on the Weeks manifold and Li's rank-versus-genus theorem are stated, not proved, by this roadmap
(Layers 5.3, 7.4 and 9.2).

Cerf's theorem is the pinned proposition `TauCeti.CerfTheorem`, every diffeomorphism of `S³`
joined to an orthogonal one; the pinned `TauCeti.SmaleConjecture.cerfTheorem` derives it from the
Smale conjecture, and `cerf_theorem` states it on its own, Cerf's proof being independent of
Hatcher's. Not stated here although statable: the tubular neighbourhood theorem of Layer 1.5 is
proved at the pin (`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`), and so is
Brown's bicollaring theorem for spheres (Layer 2.1, `TauCeti.brownBicollaring`).

Not statable at the pins:
* Reidemeister's theorem in its geometric form (Layer 4.2): the pins have no realization of a
  diagram as a link in `ℝ³`, hence no diagram of a generic projection of a smooth link; Markov's
  theorem is stated in its combinatorial form, on braid words, Markov equivalence, braid closures
  and Reidemeister equivalence of oriented PD-codes;
* the agreement of the Alexander polynomial of a Seifert matrix with that of the Burau and Fox
  routes for a general diagram (Layer 4.4): the pins have no Seifert matrix of a diagram;
* Levine's satellite theorem (Layer 6.4; Kirby's Problem 1.45), that some winding-number-one
  pattern in the solid torus has no satellite bounding a smooth disc in a rational homology
  `4`-ball: the pins have no satellite of a knot along a pattern in the solid torus;
* the statement that Conway mutation does not preserve smooth concordance (Layer 6.3; Kirby's
  Problem 1.53): the pins have no Conway mutation of a knot, and neither the Conway knot nor the
  Kinoshita–Terasaka knot as a smooth circle embedding;
* Kondo's theorem (Layer 4.13): the pinned unknotting number is that of grid links
  (`TauCeti.GridLink.unknottingNumber`), and there is no Alexander polynomial of a grid link or
  of a geometric knot to compare it with;
* the Novikov–Rosenberg theorem (Layer 10.2): the pinned foliations are smooth of a fixed
  leaf dimension but carry no transverse orientation, and incompressibility of a leaf is not
  expressed;
* the general form of Thurston's Euler class inequality on closed irreducible `3`-manifolds and
  the infinite family of Yazdi's theorem (Layer 10.5): the pins have no Thurston norm, so only
  their closed hyperbolic forms, the pinned `TauCeti.ThurstonEulerClassInequality` and
  `TauCeti.YazdiEulerClassOneTheorem`, are stated;
* Zeeman's conjecture (Layer 11.5) is statable, `TauCeti.ZeemanConjecture`, but open, so it is
  not asserted here; likewise the cosmetic surgery conjecture (Layer 5.3,
  `TauCeti.CosmeticSurgeryConjecture`), and the Akbulut–Kirby conjecture (Layer 5.3,
  `TauCeti.AkbulutKirbyConjecture`), which is false. Yasui's theorem, the Ni–Wu and Hanselman
  cosmetic surgery theorems and Waldhausen's rank-versus-genus conjecture are recorded at the pin
  and are not targets of this roadmap (README, *Scope and ownership*).

The universe-polymorphic native statements are stated at an arbitrary universe `u`. The
connected form of Manolescu's theorem, `manolescu_theorem`, is stated with the manifold in `Type`
and the triangulating complexes with vertex type in `Type`; for a compact space this loses
nothing, since a triangulating complex of a compact space has finitely many faces and relabels
onto a finite vertex type (README, Layer 11.4).
-/

public section

namespace TauCetiRoadmap.GeometricTopology

open Metric Set
open scoped Manifold ContDiff

universe u

/-! ## Layer 2: locally flat embeddings -/

/-- The annulus theorem in every dimension (Kirby for `n + 1 ≥ 5`, Quinn for `n + 1 = 4`,
classical below, by Moise and Radó): two locally flat `n`-spheres in `ℝⁿ⁺¹`, one inside the open
region bounded by the other, cobound an annulus, a closed region homeomorphic to `Sⁿ × [0, 1]`
(Layer 2.3). -/
theorem annulus_conjecture (n : ℕ) : TauCeti.AnnulusConjecture n := by
  sorry

/-! ## Layer 3: diffeomorphism groups -/

/-- The Smale conjecture, Hatcher's theorem: the continuous inclusion `O(4) → Diff(S³)` of the
orthogonal group into the weak-Whitney space of smooth self-diffeomorphisms of the round
three-sphere is a homotopy equivalence (Hatcher, *A proof of the Smale conjecture*, Ann. of Math.
117 (1983); Layer 3.4). Kirby's Problem 4.34 asks the same question for `S⁴`. -/
theorem smale_conjecture : TauCeti.SmaleConjecture := by
  sorry

/-- Cerf's theorem, orientation-free form: every smooth diffeomorphism of the round three-sphere
is joined, in the weak Whitney topology, to the restriction of an orthogonal transformation of
`ℝ⁴`; equivalently `Diff(S³)` has two path components, and equivalently `π₀(Diff⁺(S³)) = 0`
(Cerf, Théorème 1; Layer 3.4). -/
theorem cerf_theorem : TauCeti.CerfTheorem := by
  sorry

/-- Watanabe's theorem: `π₁(Diff(D⁴, ∂))`, based at the identity, has an element of infinite
order, so `Diff(D⁴, ∂)` is not contractible and the four-dimensional Smale conjecture fails
(Watanabe, Theorem 1.1 and Remark 1.2; Kirby's Problem 4.126; Layer 3.4). -/
theorem watanabe_theorem : TauCeti.WatanabeTheorem := by
  sorry

/-! ## Layer 4: knots and links -/

/-- Markov's theorem, combinatorial form (Birman, Theorem 2.3; Lickorish, Theorem 16.10): the
braids represented by two words, on `n + 1` and `m + 1` strands, are Markov equivalent exactly
when the oriented PD-codes of their closures are Reidemeister equivalent (Layer 4.2). -/
theorem markov_theorem {n m : ℕ} (w : TauCeti.BraidWord (n + 1)) (v : TauCeti.BraidWord (m + 1)) :
    TauCeti.MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔
      TauCeti.OrientedPDCode.ReidemeisterEquiv w.closure v.closure := by
  sorry

/-! ## Layer 5: Dehn surgery -/

/-- Property P (Kronheimer–Mrowka, *Witten's conjecture and Property P*, Geom. Topol. 8 (2004),
Theorem 2, with the cyclic surgery theorem; Kirby's Problem 1.15): a Dehn filling of the exterior
of a nontrivial knot in `S³` along a slope other than the meridian is not simply connected. The
meridian is the slope of value `∞` in the framing of any solid torus neighbourhood, so the
hypothesis does not depend on the framing. The boundary torus of the neighbourhood is locally
flat, as for every smooth tubular neighbourhood: a topological solid-torus neighbourhood may have
a wild boundary torus, whose exterior is not a manifold. -/
theorem property_P
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic
      (TauCeti.SmoothLinkEmbedding.singleton K)
      (TauCeti.SmoothLinkEmbedding.singleton TauCeti.unknot))
    (Φ : TauCeti.SolidTorus → sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood (⇑K) Φ)
    (hΦ : TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 2)) ℝ
      (Φ ∘ TauCeti.SolidTorus.boundaryInclusion))
    (s : TauCeti.Slope h.framedBoundaryTorus.H)
    (hs : h.framedBoundaryTorus.slopeEquiv s ≠ OnePoint.infty)
    (Y : Type u) [TopologicalSpace Y] (F : TauCeti.DehnFilling h s Y) :
    ¬ SimplyConnectedSpace Y := by
  sorry

/-- Property R (Gabai, *Foliations and the topology of 3-manifolds III*, J. Differential Geom.
26 (1987), §8; Kirby's Problem 1.16): no Dehn filling of the exterior of a nontrivial knot in
`S³` is homeomorphic to `S¹ × S²`. Gabai's statement is about the `0`-slope, the longitude of the
preferred framing; it is equivalent, since the filling along a slope of value `p / q` in the
Seifert framing has first homology `ℤ / p`, so only the `0`-slope can give `S¹ × S²`, and this
form needs no framing. The boundary torus of the neighbourhood is locally flat, as in
`property_P`. -/
theorem property_R
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic
      (TauCeti.SmoothLinkEmbedding.singleton K)
      (TauCeti.SmoothLinkEmbedding.singleton TauCeti.unknot))
    (Φ : TauCeti.SolidTorus → sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood (⇑K) Φ)
    (hΦ : TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 2)) ℝ
      (Φ ∘ TauCeti.SolidTorus.boundaryInclusion))
    (s : TauCeti.Slope h.framedBoundaryTorus.H)
    (Y : Type u) [TopologicalSpace Y] (F : TauCeti.DehnFilling h s Y) :
    IsEmpty (Y ≃ₜ Circle × sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) := by
  sorry

/-- The Gordon–Luecke theorem, filling form (Gordon–Luecke, *Knots are determined by their
complements*, J. Amer. Math. Soc. 2 (1989)): no Dehn filling of the exterior of a nontrivial knot
in `S³` along a slope other than the meridian is homeomorphic to `S³`. The boundary torus of the
neighbourhood is locally flat, as in `property_P`. Its corollary on knot complements is
`gordon_luecke`. -/
theorem gordon_luecke_theorem
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic
      (TauCeti.SmoothLinkEmbedding.singleton K)
      (TauCeti.SmoothLinkEmbedding.singleton TauCeti.unknot))
    (Φ : TauCeti.SolidTorus → sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood (⇑K) Φ)
    (hΦ : TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 2)) ℝ
      (Φ ∘ TauCeti.SolidTorus.boundaryInclusion))
    (s : TauCeti.Slope h.framedBoundaryTorus.H)
    (hs : h.framedBoundaryTorus.slopeEquiv s ≠ OnePoint.infty)
    (Y : Type u) [TopologicalSpace Y] (F : TauCeti.DehnFilling h s Y) :
    IsEmpty (Y ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- Mathieu's chirally cosmetic surgeries (Mathieu; Kirby's remarks to Problem 1.81): on the
exterior of the right-handed trefoil, the slopes of surgery coefficients `9` and `9 / 2`, or those
of coefficients `−9` and `−9 / 2` according to the orientation behaviour of the neighbourhood, are
chirally cosmetic (Layer 5.3). -/
theorem mathieu_chirally_cosmetic_theorem : TauCeti.MathieuChirallyCosmeticTheorem := by
  sorry

/-- The cyclic surgery theorem for knots in `S³` (Culler–Gordon–Luecke–Shalen, *Dehn surgery on
knots*, Ann. of Math. 125 (1987)): if the exterior of a knot in `S³` is not Seifert fibred, every
Dehn filling with cyclic fundamental group is along the meridian or along a slope of integral
value. This is the case of the theorem in which one of the two cyclic slopes is the meridian,
whose filling is `S³`: a slope of value `p / q` has distance `|q|` from the meridian, in every
framing. The boundary torus of the neighbourhood is locally flat, as in `property_P`, so the
exterior is a compact `3`-manifold with torus boundary; for a wild neighbourhood of the unknot the
exterior is not Seifert fibred while the `5 / 2`-filling is the lens space `L(5, 2)`. -/
theorem cyclic_surgery_theorem
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (Φ : TauCeti.SolidTorus → sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood (⇑K) Φ)
    (hΦ : TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 2)) ℝ
      (Φ ∘ TauCeti.SolidTorus.boundaryInclusion))
    (hSF : ¬ TauCeti.IsSeifertFibered (TauCeti.knotExterior (Φ := Φ)))
    (s : TauCeti.Slope h.framedBoundaryTorus.H)
    (Y : Type u) [TopologicalSpace Y] (F : TauCeti.DehnFilling h s Y) (y : Y)
    (hY : IsCyclic (FundamentalGroup Y y)) :
    h.framedBoundaryTorus.slopeEquiv s = OnePoint.infty ∨
      ∃ n : ℤ, h.framedBoundaryTorus.slopeEquiv s = ((n : ℚ) : OnePoint ℚ) := by
  sorry

/-! ## Layer 6: knot concordance -/

/-- Freedman's theorem: a knot in `S³` whose knot group has perfect commutator subgroup, that
is, whose Alexander polynomial is one, is topologically slice (Freedman; Freedman–Quinn,
Theorem 11.7B; Kirby's Problem 1.36; Layer 6.4). -/
theorem freedman_slice_theorem : TauCeti.FreedmanSliceTheorem := by
  sorry

/-- Levine's homology-concordance theorem (Levine, *Non-surjective satellite operators and
piecewise-linear concordance*, Forum Math. Sigma 4 (2016), Theorem 1.1, first part, in the
homology-concordance form of Remark 1.5; Kirby's Problem 1.31), the pinned proposition: some
knot in the boundary of a smooth compact contractible `4`-manifold is not integrally homology
concordant to any knot in `S³`. -/
theorem levine_homology_concordance_theorem : TauCeti.LevineHomologyConcordanceTheorem := by
  sorry

/-! ## Layer 7: hyperbolic structures -/

/-- Mostow rigidity, metric form (Mostow; Ratcliffe, Theorem 11.8.5): two hyperbolic metrics on
a closed connected manifold of dimension at least three are isometric. -/
theorem mostow_rigidity : TauCeti.MostowRigidity := by
  sorry

/-- The theorem of Gabai, Meyerhoff and Milley (*Mom technology and hyperbolic 3-manifolds*,
arXiv 0910.5043, Theorem 1.1; Kirby's Problem 3.60), the pinned proposition: some Weeks manifold,
the `5` and `5 / 2` surgery on the Whitehead link, is a closed hyperbolic `3`-manifold, and every
closed orientable hyperbolic `3`-manifold has volume at least that of a Weeks manifold, with
equality only if it is homeomorphic to it. -/
theorem gabai_meyerhoff_milley : TauCeti.GabaiMeyerhoffMilleyTheorem.{u} := by
  sorry

/-- Agol's virtual fibering theorem (Agol, Theorem 9.2; Kirby's Problem 3.51): every closed
hyperbolic `3`-manifold has a connected finite cover fibering over the circle. -/
theorem virtual_fibering_conjecture : TauCeti.VirtualFiberingConjecture := by
  sorry

/-- Agol's virtual Haken theorem (Agol, Theorem 9.1, in its hyperbolic case): every closed
hyperbolic `3`-manifold has a finite cover that is a closed Haken `3`-manifold. -/
theorem virtual_haken_conjecture : TauCeti.VirtualHakenConjecture := by
  sorry

/-! ## Layer 8: decompositions of 3-manifolds -/

/-- Alexander's theorem: every locally flat `2`-sphere in `S³` bounds a `3`-ball. -/
theorem alexander_sphere_bounds_ball :
    TauCeti.IsSphereBoundsBall (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- The sphere theorem (Papakyriakopoulos; Hatcher, *Notes on Basic 3-Manifold Topology*,
Theorem 3.8, orientable case): if a smooth orientable `3`-manifold without boundary has
nontrivial `π₂` at some base point, it contains a locally flat embedded `2`-sphere that is
homotopic to no constant map. Orientability is the existence of an oriented smooth atlas
(`TauCeti.IsOrientedAtlas`): charts of the maximal smooth atlas covering `M` whose coordinate
changes have derivatives of positive determinant. Such an atlas makes `M` orientable, and since
the model `ℝ³` has no boundary every orientable `M` has one; without orientability the statement
fails for `S¹ × ℝP²`. -/
theorem sphere_theorem (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [T2Space M]
    [SecondCountableTopology M]
    (hor : ∃ A : Set (OpenPartialHomeomorph M (EuclideanSpace ℝ (Fin 3))),
      TauCeti.IsOrientedAtlas (𝓡 3) ∞ A)
    (x : M) (h : Nontrivial (HomotopyGroup.Pi 2 M x)) :
    ∃ f : C((TopCat.sphere 2 : TopCat.{u}), M), Topology.IsClosedEmbedding f ∧
      TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 2)) ℝ f ∧
      ∀ y : M, ¬ f.Homotopic (ContinuousMap.const _ y) := by
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

/-- The Gordon–Luecke theorem on complements: two knots in `S³` with homeomorphic complements
are carried onto each other by a homeomorphism of `S³`. It is the corollary of the filling form
`gordon_luecke_theorem`. -/
theorem gordon_luecke
    (K J : TauCeti.SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (h : Nonempty (((range K)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)) ≃ₜ
      ((range J)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)))) :
    ∃ e : sphere (0 : EuclideanSpace ℝ (Fin 4)) 1 ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1,
      e '' range K = range J := by
  sorry

/-- Kneser's prime decomposition theorem, the pinned proposition (Kneser; Hatcher, *Notes on
Basic 3-Manifold Topology*, Theorem 1.5): every closed connected orientable smooth `3`-manifold
is a connected sum of finitely many closed prime `3`-manifolds, `S³` being the empty sum. -/
theorem kneser_prime_decomposition : TauCeti.KneserPrimeDecompositionTheorem.{u} := by
  sorry

/-- Milnor's uniqueness of prime decompositions, the pinned proposition (Milnor, *A unique
decomposition theorem for 3-manifolds*, Amer. J. Math. 84 (1962), Theorem 1; Hatcher,
Theorem 1.5): two prime decompositions of a closed connected orientable smooth `3`-manifold have
the same number of factors and, after a bijection of the index sets, diffeomorphic factors. -/
theorem milnor_prime_decomposition : TauCeti.MilnorPrimeDecompositionTheorem.{u} := by
  sorry

/-- Waldhausen's theorem: a homotopy equivalence between closed orientable Haken
`3`-manifolds (irreducible, containing a closed bicollared incompressible surface of infinite
fundamental group) is homotopic to a homeomorphism. The pinned Haken predicate carries the
closed connected `3`-manifold package; orientability is the existence of an oriented smooth
atlas (`TauCeti.IsOrientedAtlas`), as in `sphere_theorem`. -/
theorem waldhausen_theorem (M N : Type u) [TopologicalSpace M] [TopologicalSpace N]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [ChartedSpace (EuclideanSpace ℝ (Fin 3)) N]
    [IsManifold (𝓡 3) ∞ M] [IsManifold (𝓡 3) ∞ N]
    (horM : ∃ A : Set (OpenPartialHomeomorph M (EuclideanSpace ℝ (Fin 3))),
      TauCeti.IsOrientedAtlas (𝓡 3) ∞ A)
    (horN : ∃ A : Set (OpenPartialHomeomorph N (EuclideanSpace ℝ (Fin 3))),
      TauCeti.IsOrientedAtlas (𝓡 3) ∞ A)
    (hM : TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold M)
    (hN : TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold N)
    (e : ContinuousMap.HomotopyEquiv M N) :
    ∃ h : M ≃ₜ N, e.toFun.Homotopic (h : C(M, N)) := by
  sorry

/-- The JSJ theorem (Jaco–Shalen, Johannson; Hatcher, Theorem 1.9): every closed orientable
irreducible `3`-manifold has a minimal family of disjoint locally flat incompressible tori cutting
it into Seifert fibred and atoroidal pieces, and any two such families are carried onto each
other by an ambient isotopy. -/
theorem jsj_theorem : TauCeti.JSJTheorem := by
  sorry

/-- The geometrization theorem (Thurston's conjecture, Perelman's theorem; Kirby's Problem
3.45): every closed orientable irreducible `3`-manifold has a geometric torus decomposition, a
finite family of disjoint locally flat incompressible tori whose complementary pieces are Seifert
fibred or hyperbolic of finite volume. -/
theorem geometrization_conjecture : TauCeti.GeometrizationConjecture := by
  sorry

/-- The Poincaré conjecture (Perelman; Morgan–Tian, Corollary 0.2(a)): a closed simply
connected `3`-manifold is homeomorphic to `S³`. No homeomorphism is canonical, so the theorem
asserts that one exists. -/
theorem nonempty_homeomorph_sphere_of_simplyConnected (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M]
    [T2Space M] [SecondCountableTopology M] [SimplyConnectedSpace M] :
    Nonempty (M ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- The Poincaré conjecture, smooth form (Perelman): a closed simply connected smooth
`3`-manifold is diffeomorphic to the round three-sphere. It follows from the topological form
`nonempty_homeomorph_sphere_of_simplyConnected` and the uniqueness of smooth structures on
`3`-manifolds (Layers 8.6 and 11.2). -/
theorem nonempty_diffeomorph_sphere_of_simplyConnectedSpace (M : Type u) [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [CompactSpace M]
    [SimplyConnectedSpace M] :
    Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-! ## Layer 9: Heegaard splittings -/

/-- Li's theorem, the pinned proposition (Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc.
26 (2013), Theorem 1.1): for every `n` some closed connected orientable hyperbolic `3`-manifold,
with finitely generated fundamental group, has Heegaard genus exceeding the rank of its
fundamental group by more than `n`; the case `n = 0` refutes Waldhausen's rank-versus-genus
conjecture. -/
theorem li_rank_genus_theorem : TauCeti.LiRankGenusTheorem.{u} := by
  sorry

/-! ## Layer 10: foliations of 3-manifolds -/

/-- Thurston's Euler class inequality, closed hyperbolic form (Thurston, *A norm for the homology
of 3-manifolds*, Section 3; Yazdi, inequality (1)): on a closed connected orientable hyperbolic
`3`-manifold, every Euler class of a smooth taut codimension-one foliation satisfies
`|⟨e, f_*[S]⟩| ≤ −χ(S)` for every embedded closed connected oriented surface `S` with
`χ(S) ≤ 0` (Layer 10.5). -/
theorem thurston_euler_class_inequality : TauCeti.ThurstonEulerClassInequality := by
  sorry

/-- Yazdi's theorem, weakest form (Yazdi, *On Thurston's Euler class one conjecture*, Main
Theorem): some closed connected orientable hyperbolic `3`-manifold carries an even integral class
of degree two for which the Euler class inequality is sharp and which is the Euler class of no
smooth taut codimension-one foliation, so Thurston's Euler class one conjecture fails
(Layer 10.5). -/
theorem yazdi_theorem : TauCeti.YazdiEulerClassOneTheorem := by
  sorry

/-! ## Layer 11: triangulations -/

/-- Radó's theorem, closed case: every closed topological surface is homeomorphic to the
realization of a simplicial complex, the pinned triangulation conjecture in dimension two. The
route is the existence of a smooth structure on every topological surface (Hatcher, *The Kirby
torus trick for surfaces*, arXiv 1312.3518, Theorem A) followed by a smooth triangulation. -/
theorem rado_triangulation : TauCeti.TriangulationConjecture.{u} 2 := by
  sorry

/-- Moise's theorem (Moise 1952; Bing 1959), closed case: every closed topological
`3`-manifold is homeomorphic to the realization of a simplicial complex, the pinned
triangulation conjecture in dimension three. -/
theorem moise_triangulation : TauCeti.TriangulationConjecture.{u} 3 := by
  sorry

/-- Manolescu's theorem: the triangulation conjecture fails in every dimension `n ≥ 5`, that
is, there is a closed topological `n`-manifold that is not homeomorphic to the realization
of any simplicial complex. -/
theorem manolescu_triangulation_conjecture_false (n : ℕ) (hn : 5 ≤ n) :
    ¬ TauCeti.TriangulationConjecture.{u} n := by
  sorry

/-- Manolescu's theorem, connected form (Manolescu, *Lectures on the triangulation conjecture*,
Theorem 1.1): in every dimension `n ≥ 5` there is a closed connected topological `n`-manifold
that is not homeomorphic to the realization of any abstract simplicial complex. It follows from
`manolescu_triangulation_conjecture_false`, since a closed manifold whose finitely many
components are triangulable is triangulable (Layer 11.4). -/
theorem manolescu_theorem (n : ℕ) (hn : 5 ≤ n) :
    ∃ (M : Type) (_ : TopologicalSpace M) (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M),
      TauCeti.IsClosedConnectedManifold n M ∧ ¬ TauCeti.IsTriangulable.{0} M := by
  sorry

end TauCetiRoadmap.GeometricTopology
