import Mathlib

/-!
# Fukaya categories of compact Lagrangian branes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, and nothing else. At the
pins none of the headline theorems is statable, so this file states nothing: the pinned Tau Ceti
has no Hamiltonian vector field or time-dependent Hamiltonian flow on a manifold (its manifold
flows are the time-independent integral-curve flows), no Lagrangian Floer complex or moduli space
of discs with Lagrangian boundary, no relative spin structure and no Novikov ring. The headline
theorems and what each lacks:

* the filtered curved Fukaya category of compact Lagrangian branes with its curved `A∞` relations
  and strict weakly unobstructed objects (README FK7): lacks the bordered disc moduli with their
  rational virtual chains, the Novikov coefficient rings and relative spin data;
* the `Λ_loc`-linear quasi-equivalence of the localized fixed-potential categories under
  Hamiltonian isotopy, with the finite-loss comparisons of the positive lattices (README FK9.2):
  lacks Hamiltonian flows on manifolds and the Floer complexes;
* the exact and weakly exact bound `#(L ∩ φ_H(L)) ≥ Σ_j dim_k H^j(L; k)` for a compact exact or
  weakly exact Lagrangian `L` and a Hamiltonian diffeomorphism `φ_H` with `L ⋔ φ_H(L)`
  (README FK9.0): lacks Hamiltonian flows and the Floer complex;
* the zero-section computation `HF(L, L) ≅ H^*(L; End E)` with its cup product (README FK8.0):
  lacks the Floer complex and the Hamiltonian perturbations;
* the torus computation `H^0 ≅ Λ₀² ⊕ Λ₀/(T^A)` with `A = 1/(4π) − 1/16` (README FK8.1): lacks the
  Novikov ring and the lune/strip complex.

The finite matrix of the torus computation is a README Check, not a declaration here, because it
does not identify the geometric differential.
-/

namespace TauCetiRoadmap.FukayaTheory

end TauCetiRoadmap.FukayaTheory
