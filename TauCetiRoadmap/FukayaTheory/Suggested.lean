module

public import Mathlib

/-!
# Fukaya categories of compact Lagrangian branes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, and nothing else. At the
pins none of the headline theorems is statable, so this file states nothing. The pinned Tau Ceti
has Hamiltonian vector fields on a manifold (`TauCeti.SmoothTwoForm.hamiltonianVectorField`, in
the convention `ι_X σ = df`) with their Poisson bracket, time-dependent flows and the diffeotopy
of a time-dependent field with complete suspension (`TauCeti.timeDependentFlowOf`,
`TauCeti.timeDependentFlowDiffeotopy`), Novikov series with their period filtration,
nonnegative subring and positive ideal (`TauCeti.NovikovSeries`), Lagrangian and exact
Lagrangian maps (`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianMap`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap`) and the manifold Floer energy
identity (`TauCeti.SmoothTwoForm.floerEnergyDensity`), and the pinned Mathlib has singular
homology (`singularHomologyFunctor`). Neither has a Lagrangian Floer complex, a moduli space of
discs with Lagrangian boundary, a relative spin structure, a Liouville domain or its completion,
or a carrier for the relative periods of a pair `(X, L)` (the pairing of `ω` with `π₂(X, L)`).
The headline theorems and what each lacks:

* the filtered curved Fukaya category of compact Lagrangian branes with its curved `A∞` relations
  and strict weakly unobstructed objects (README FK7): lacks the bordered disc moduli with their
  rational virtual chains and the relative spin data;
* the `Λ_loc`-linear quasi-equivalence of the localized fixed-potential categories under
  Hamiltonian isotopy, with the finite-loss comparisons of the positive lattices (README FK9.2):
  lacks the Floer complexes and the bordered moduli of the comparison functors;
* the bound `#(L ∩ φ_H(L)) ≥ Σ_j dim_k H^j(L; k)` for a compact exact or weakly exact brane `L`
  (oriented and relatively spin; over `k` of characteristic 2 the spin lift is not used) and a
  Hamiltonian diffeomorphism `φ_H` with `L ⋔ φ_H(L)` (README FK9.0): its symplectic manifold,
  Lagrangian map, Hamiltonian flow and singular cohomology are at the pins, and transversality
  and the count of intersection points are simple definitions on them, but the exact branch
  lacks the Liouville completion of its target, and the closed weakly exact branch lacks a
  carrier for weak exactness of `L`, which could only be encoded ad hoc as the vanishing of
  `TauCeti.SmoothSimplex.integral` of the pullback of `ω` on every smooth 2-simplex with
  boundary in `L`; the Floer complex of the proof is also absent, but the statement does not
  mention it;
* the zero-section computation `HF(L, L) ≅ H^*(L; End E)` with its cup product (README FK8.0):
  lacks the Floer complex and the bordered moduli of its Hamiltonian perturbations;
* the torus computation `H^0 ≅ Λ₀² ⊕ Λ₀/(T^A)` with `A = 1/(4π) − 1/16` (README FK8.1): lacks
  the lune/strip complex; its coefficient ring `Λ₀` is at the pin, as the nonnegative subring
  `TauCeti.NovikovSeries.nonnegSubring` of the real-exponent Novikov series over the field.

The finite matrix of the torus computation is a README Check, not a declaration here, because it
does not identify the geometric differential.
-/

namespace TauCetiRoadmap.FukayaTheory

end TauCetiRoadmap.FukayaTheory
