import Mathlib
import TauCeti.Analysis.BoundedVariation.Perimeter

/-!
# Integral currents, geometric homology and minimizing hypersurfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti.

One headline is statable there and is stated below: the Bombieri–De Giorgi–Giusti theorem (G7),
that the region `{|x|² > |y|²}` of `ℝ⁴ × ℝ⁴` is locally perimeter minimizing, for Tau Ceti's
perimeter `TauCeti.perimeter`.

The other headlines are not statable there, because each needs integral currents
(integer-rectifiable currents whose boundary is integer rectifiable), which neither library has:

* interior regularity (G6): a locally mass-minimizing locally integral `(n-1)`-current without
  boundary in an open set of a smooth Riemannian `n`-manifold, `2 ≤ n ≤ 7`, is, near each
  point of its support in that set, a nonzero integer multiple of the integration current of
  a smooth embedded minimal hypersurface; it lacks locally integral currents on a manifold;
* Federer–Fleming compactness and closure (G4b): integral currents with supports in a fixed
  compact set and bounded masses of the currents and their boundaries have a subsequence
  converging weakly to an integral current; it lacks integral currents;
* the isomorphism of integral-current homology with integral singular homology on the ambient
  manifold and on its closed Lipschitz neighborhood-retract pairs (G3); it lacks the chain
  complex of compactly supported integral currents on a manifold;
* existence of mass-minimizing integral fillings in Euclidean space and of mass-minimizing
  integral representatives of integral homology classes on a compact Riemannian manifold
  (G5); it lacks integral currents;
* smooth local convergence of minimizing hypersurfaces with locally uniform mass bounds,
  `2 ≤ n ≤ 7` (G7); it lacks locally integral currents on a manifold;
* sharpness in ambient dimension 8 (G7): the boundary current of `{|x|² > |y|²}` in `ℝ⁴ × ℝ⁴`
  minimizes mass against every compactly supported integral-current perturbation, not only
  against boundaries of sets as in the Bombieri–De Giorgi–Giusti theorem; it lacks integral
  currents.

Tau Ceti has the Euclidean chart model of real currents (the exterior derivative of test forms,
mass, local mass, locally finite mass and the mass measure), which the README cites and this
file does not restate, and countably rectifiable sets, but no integer-rectifiable currents.
-/

namespace TauCetiRoadmap.GeometricCurrents

open MeasureTheory TopologicalSpace

/-- The region `E = {|x|² > |y|²}` of `ℝ⁸ = ℝ⁴ × ℝ⁴`, where `x` consists of the coordinates
`0, …, 3` and `y` of the coordinates `4, …, 7`. Its topological boundary is the Simons cone
`{|x| = |y|}`, which is singular at the origin. -/
def simonsRegion : Set (EuclideanSpace ℝ (Fin 8)) :=
  {z | ∑ i : Fin 4, z (Fin.natAdd 4 i) ^ 2 < ∑ i : Fin 4, z (Fin.castAdd 4 i) ^ 2}

/-- **The Bombieri–De Giorgi–Giusti theorem.** The region `E = {|x|² > |y|²}` of `ℝ⁴ × ℝ⁴` is
locally perimeter minimizing: for every open `Ω` and every null-measurable `F` that differs from
`E` only inside a compact subset `K` of `Ω`, the perimeter of `E` in `Ω` is at most that of `F`.
The perimeter is De Giorgi's, for Lebesgue measure. -/
theorem perimeter_simonsRegion_le (Ω : Opens (EuclideanSpace ℝ (Fin 8)))
    {F K : Set (EuclideanSpace ℝ (Fin 8))} (hF : NullMeasurableSet F volume) (hK : IsCompact K)
    (hKΩ : K ⊆ (Ω : Set (EuclideanSpace ℝ (Fin 8)))) (hFK : symmDiff F simonsRegion ⊆ K) :
    TauCeti.perimeter volume Ω simonsRegion ≤ TauCeti.perimeter volume Ω F := by
  sorry

end TauCetiRoadmap.GeometricCurrents

