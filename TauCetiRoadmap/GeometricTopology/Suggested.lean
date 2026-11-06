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
import TauCeti.Geometry.Diffeomorphism.Cerf
import TauCeti.LowDimTopology.DehnSurgery.Unknot
import TauCeti.LowDimTopology.DehnSurgery.Cosmetic
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Weeks
import TauCeti.LowDimTopology.PrimeDecomposition
import TauCeti.LowDimTopology.Heegaard.RankGenus
import TauCeti.Geometry.Manifold.Foliation.EulerClass

/-!
# Geometric topology and the solved Kirby-list problems: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`: the deep results the
finished roadmap proves, on the carriers that exist at the pins. Nothing here is an API
catalogue, a Check or a definition of the roadmap's own.

Statable at the pins, and stated below: the Smale conjecture, Cerf's theorem and Watanabe's
theorem (Layer 3) on the native `TauCeti.SmaleConjecture`, `TauCeti.CerfTheorem` and
`TauCeti.WatanabeTheorem`; the annulus theorem in every dimension (Layer 2) on
`TauCeti.AnnulusConjecture`; Markov's theorem in its combinatorial form (Layer 4) on the native
braid words, Markov equivalence, braid closures and Reidemeister equivalence of oriented PD-codes;
Freedman's theorem (Layer 4) on `TauCeti.FreedmanSliceTheorem`; Property P, Property R and the
Gordon–Luecke theorem (Layer 5) on the native Dehn fillings `TauCeti.DehnFilling` of the exterior
of a knot in `S³`, and Mathieu's theorem (Layer 5) on `TauCeti.MathieuChirallyCosmeticTheorem`;
Mostow rigidity (Layer 7) on `TauCeti.MostowRigidity`; the minimal volume theorem (Layer 7) on
`TauCeti.GabaiMeyerhoffMilleyTheorem`; Agol's virtual fibering and virtual Haken theorems
(Layer 7) on `TauCeti.IsVirtuallyFibered` and `TauCeti.VirtualHakenConjecture`; the Kneser and
Milnor prime decomposition theorems (Layer 8) on `TauCeti.KneserPrimeDecompositionTheorem` and
`TauCeti.MilnorPrimeDecompositionTheorem`; the JSJ theorem and the geometrization theorem
(Layer 8) on `TauCeti.JSJTheorem` and `TauCeti.GeometrizationConjecture`; the Poincaré conjecture
(Layer 8) on Mathlib's `Diffeomorph` and the round three-sphere; Li's theorem (Layer 9) on
`TauCeti.LiRankGenusTheorem`; Thurston's inequality and Yazdi's theorem in their closed hyperbolic
forms (Layer 10) on `TauCeti.ThurstonEulerClassInequality` and `TauCeti.YazdiEulerClassOneTheorem`;
and Manolescu's theorem (Layer 11) on `TauCeti.IsClosedConnectedManifold` and
`TauCeti.IsTriangulable`.

Not statable at the pins, and not stated: Reidemeister's theorem (Layer 4) lacks the diagram of a
generic projection of a smooth link; the agreement of the three Alexander routes (Layer 4) lacks
the Seifert matrix of a diagram; the general (irreducible) form of Thurston's inequality and the
infinite family of Yazdi's theorem (Layer 10) lack the Thurston norm, so only their closed
hyperbolic forms, which are the native statements, are stated. Brown's bicollaring theorem
(Layer 2) is proved at the pin as `TauCeti.brownBicollaring`, and the Smale conjecture implies
Cerf's theorem at the pin as `TauCeti.SmaleConjecture.cerfTheorem`, so these are consumed, not
stated. Zeeman's conjecture (Layer 11) is an open conjecture recorded at the pin as
`TauCeti.ZeemanConjecture`, the cosmetic surgery conjecture (Layer 5) as
`TauCeti.CosmeticSurgeryConjecture`, and the Akbulut–Kirby conjecture (Layer 5), which is false,
as `TauCeti.AkbulutKirbyConjecture`; the roadmap states them and claims nothing about them, so
none is a theorem here. Yasui's theorem, the Ni–Wu and Hanselman cosmetic surgery theorems and
Waldhausen's rank-versus-genus conjecture are recorded at the pin and are not targets of this
roadmap (README, Scope and ownership).

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

/-- **Cerf's theorem**, orientation-free form: every smooth diffeomorphism of the round
three-sphere is joined, in the weak Whitney topology, to the restriction of an orthogonal
transformation of `ℝ⁴`; equivalently `Diff(S³)` has two path components, and equivalently
`π₀(Diff⁺(S³)) = 0` (Cerf, Théorème 1). README, 3.3. -/
theorem cerf_theorem : TauCeti.CerfTheorem := by
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

/-! ## Layer 5: Dehn surgery -/

/-- **Property P** (Kronheimer–Mrowka, Theorem 2 with the cyclic surgery theorem; Kirby's Problem
1.15): for a knot `K` in `S³` that is not smoothly ambient isotopic to the unknot, every Dehn
filling of its exterior along a slope other than the meridian has nontrivial fundamental group at
every base point. README, 5.4. -/
theorem property_p
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ TauCeti.SmoothEmbedding.SmoothAmbientIsotopic K TauCeti.unknot)
    (Φ : TauCeti.SolidTorus → Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood K Φ) (s : TauCeti.Slope h.framedBoundaryTorus.H)
    (hs : s ≠ h.framedBoundaryTorus.meridian)
    (Y : Type) [TopologicalSpace Y] (F : TauCeti.DehnFilling h s Y) (y : Y) :
    Nontrivial (FundamentalGroup Y y) := by
  sorry

/-- **Property R** (Gabai; Kirby's Problem 1.16): for a knot `K` in `S³` that is not smoothly
ambient isotopic to the unknot, no Dehn filling of its exterior along the longitude of the
preferred framing (the `0`-surgery) is homeomorphic to `S¹ × S²`. README, 5.4. -/
theorem property_r
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ TauCeti.SmoothEmbedding.SmoothAmbientIsotopic K TauCeti.unknot)
    (Φ : TauCeti.SolidTorus → Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood K Φ) (Y : Type) [TopologicalSpace Y]
    (F : TauCeti.DehnFilling h
      (h.preferredFramedBoundaryTorus
        (TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four _)
        (TauCeti.isZero_reducedSingularHomologyFunctor_two_sphere_euclideanSpace_fin_four _)).longitude
      Y) :
    IsEmpty (Y ≃ₜ Circle × Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) := by
  sorry

/-- **The Gordon–Luecke theorem** (Gordon–Luecke, *Knots are determined by their complements*):
for a knot `K` in `S³` that is not smoothly ambient isotopic to the unknot, no Dehn filling of
its exterior along a slope other than the meridian is homeomorphic to `S³`. README, 5.4. -/
theorem gordon_luecke_theorem
    (K : TauCeti.SmoothCircleEmbedding (𝓡 3) (Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ TauCeti.SmoothEmbedding.SmoothAmbientIsotopic K TauCeti.unknot)
    (Φ : TauCeti.SolidTorus → Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : TauCeti.IsSolidTorusNeighborhood K Φ) (s : TauCeti.Slope h.framedBoundaryTorus.H)
    (hs : s ≠ h.framedBoundaryTorus.meridian)
    (Y : Type) [TopologicalSpace Y] (F : TauCeti.DehnFilling h s Y) :
    IsEmpty (Y ≃ₜ Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- **Mathieu's chirally cosmetic surgeries** (Mathieu; Kirby's remarks to Problem 1.81): on the
exterior of the right-handed trefoil, the slopes of surgery coefficients `9` and `9/2`, or
those of coefficients `−9` and `−9/2` according to the orientation behaviour of the neighbourhood,
are chirally cosmetic. README, 5.4. -/
theorem mathieu_chirally_cosmetic_theorem : TauCeti.MathieuChirallyCosmeticTheorem := by
  sorry

/-! ## Layer 7: Riemannian geometric structures and volume -/

/-- **Mostow rigidity**, metric form (Mostow; Ratcliffe, Theorem 11.8.5): any two hyperbolic
metrics on a closed connected manifold of dimension at least three are isometric. README, 7.2. -/
theorem mostow_rigidity : TauCeti.MostowRigidity := by
  sorry

/-- **The minimal volume theorem** (Gabai–Meyerhoff–Milley, Theorem 1.1; Kirby's Problem 3.60):
some closed connected smooth Weeks manifold, the `5, 5/2` surgery on the Whitehead link, carries
a hyperbolic metric, and the volume of any hyperbolic metric on a Weeks manifold is at most the
volume of any hyperbolic metric on a closed connected orientable `3`-manifold `M`, with equality
only if `M` is homeomorphic to the Weeks manifold. README, 7.3. -/
theorem gabai_meyerhoff_milley_theorem : TauCeti.GabaiMeyerhoffMilleyTheorem.{u} := by
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

/-- **Kneser's prime decomposition theorem** (Kneser; Hatcher, Theorem 1.5): every closed
connected orientable smooth `3`-manifold is a connected sum of finitely many closed prime
`3`-manifolds, the empty connected sum being `S³`. README, 8.2. -/
theorem kneser_prime_decomposition : TauCeti.KneserPrimeDecompositionTheorem.{u} := by
  sorry

/-- **Milnor's uniqueness of prime decompositions** (Milnor; Hatcher, Theorem 1.5): two
presentations of a closed connected orientable smooth `3`-manifold as connected sums of closed
prime `3`-manifolds have the same number of factors and, after a bijection of the index sets,
diffeomorphic factors. README, 8.2. -/
theorem milnor_prime_decomposition : TauCeti.MilnorPrimeDecompositionTheorem.{u} := by
  sorry

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

/-! ## Layer 9: Heegaard splittings and Heegaard genus -/

/-- **Li's rank-versus-genus theorem** (Li, Theorem 1.1): for every `n` there is a closed
connected orientable hyperbolic `3`-manifold whose fundamental group is finitely generated and
whose Heegaard genus exceeds the rank of its fundamental group by more than `n`; the case `n = 0`
refutes Waldhausen's conjecture. README, 9.2. -/
theorem li_rank_genus_theorem : TauCeti.LiRankGenusTheorem.{u} := by
  sorry

/-! ## Layer 10: foliations and their Euler class -/

/-- **Thurston's Euler class inequality**, closed hyperbolic form (Thurston, Section 3; Yazdi,
inequality (1)): on a closed connected orientable hyperbolic `3`-manifold, every Euler class of a
smooth taut codimension-one foliation satisfies `|⟨e, f_*[S]⟩| ≤ −χ(S)` for every embedded closed
connected oriented surface `S` with `χ(S) ≤ 0`. README, 10.4. -/
theorem thurston_euler_class_inequality : TauCeti.ThurstonEulerClassInequality := by
  sorry

/-- **Yazdi's theorem**, weakest form (Yazdi, Main Theorem): some closed connected orientable
hyperbolic `3`-manifold carries an even integral class of degree two for which the Euler class
inequality is sharp and which is the Euler class of no smooth taut codimension-one foliation, so
Thurston's Euler class one conjecture fails. README, 10.4. -/
theorem yazdi_theorem : TauCeti.YazdiEulerClassOneTheorem := by
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
