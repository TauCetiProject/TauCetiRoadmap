import Mathlib

/-!
# Instanton Floer theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It records the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, and states each one that is statable there.
None is statable at the pins, so nothing is stated below.

The headline theorems and the carrier each one lacks:

* Admissible instanton Floer homology (IF5): the integral, relatively `ℤ/8`-graded homology of
  a nontrivial admissible SO(3) bundle over a closed oriented three-manifold, independent of
  metric and perturbation, natural under bundle isomorphisms. Missing: the Chern–Simons
  functional on SO(3) connections, holonomy perturbations, moduli of anti-self-dual connections
  on cylinders and their orientation lines. Mathlib at the pin has smooth vector bundles,
  their sections and covariant derivatives (`Mathlib/Geometry/Manifold/VectorBundle`), but no
  principal bundles, gauge groups, curvature of a connection or Sobolev completions of them.
* Cobordism maps and the point operation (IF6): functoriality for homology-oriented cobordisms
  and `u² − 64 = 0` over `ℂ` for a genus-one detecting surface. Missing: the Floer groups above
  and the universal SO(3) bundle over the configuration space.
* Frøyshov's reduced groups and Scaduto's framed decomposition (IF7a, IF7b):
  `I#(Y) ≅ ker(u² − 64) ⊗ H_*(S³) ⊕ H_*(pt)` over a field of characteristic other than two for an
  integral homology sphere. Missing: the homology-sphere Floer complex with its reducible counts
  `δ`, `δ'`, the framed group `I#` and the connected-sum comparison.
* Floer's surgery exact triangle, Kronheimer–Mrowka excision and the Chen–Scaduto nilpotence
  exponent `2⌈g/2⌉ − 1` on `I(Σ_g × S¹)` (IF8). Missing: the Floer groups and cobordism maps above.
* The admissible Atiyah–Floer isomorphism of Daemi–Fukaya–Lipyanskiy and its filtered framed
  refinement (IF9, IF10). Missing: the odd-bundle surface moduli space as a symplectic manifold,
  its Lagrangian Floer complex with coherent orientations, and the mixed equation.

A statement of linear algebra on an arbitrary complex module with an arbitrary endomorphism is
not one of these headlines, since it names none of the roadmap's objects.
-/

namespace TauCetiRoadmap.InstantonFloerTheory

end TauCetiRoadmap.InstantonFloerTheory
