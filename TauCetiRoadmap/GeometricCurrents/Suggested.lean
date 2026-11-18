import Mathlib

/-!
# Integral currents, geometric homology and minimizing hypersurfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti. None of them is statable there, because each
needs integral currents (integer-rectifiable currents whose boundary is integer rectifiable),
which neither library has:

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
* sharpness in ambient dimension 8 (G7): the boundary of `{|x|² > |y|²}` in `ℝ⁴ × ℝ⁴`
  minimizes mass against every compactly supported integral-current perturbation; it lacks
  integral currents.

Tau Ceti has the Euclidean chart model of real currents (the exterior derivative of test forms,
mass, local mass, locally finite mass and the mass measure), which the README cites and this
file does not restate, and countably rectifiable sets, but no integer-rectifiable currents.
-/

namespace TauCetiRoadmap.GeometricCurrents

end TauCetiRoadmap.GeometricCurrents
