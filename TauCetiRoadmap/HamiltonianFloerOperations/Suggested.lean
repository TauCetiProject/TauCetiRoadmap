import Mathlib

/-!
# Hamiltonian Floer operations: target signatures

This file is not the roadmap. The roadmap is `README.md` beside it, which is definitive; this file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, and only those
that are statable there. It is a suggested form, not an exhaustive list of targets.

The headline theorems of the roadmap are:

* **The pair-of-pants product** (README Layer 6): for a closed symplectic manifold `(X, ω)` and a
  Hamiltonian whose contractible one-periodic orbits are nondegenerate, the counted pair-of-pants
  product makes the Floer cohomology an associative, graded commutative, unital algebra over the
  Floer Novikov ring, and continuation maps are algebra isomorphisms; over `ℤ` on positively
  spherically monotone and spherically `c₁`-zero targets, over `ℚ` on every closed target.
* **Multiplicative PSS** (README Layer 7): over `ℚ`, after the coefficient comparison
  `q^A ↦ e^(−A)`, Poincaré duality followed by the Piunikhin–Salamon–Schwarz map is an isomorphism
  of unital rings from small quantum cohomology to Floer cohomology.
* **Computations** (README Layer 8): over `ℚ`, on a symplectically aspherical target the product is
  the cup product, and on `ℂPⁿ` with its Fubini–Study form the `(n+1)`-st power of the hyperplane
  class is `e^(−L)` times the unit.

None of them is statable at the pins. Neither Mathlib nor Tau Ceti has the Hamiltonian Floer
complex of a closed symplectic manifold (its capped generators, its differential or its
cohomology), and neither has small quantum cohomology or the Gromov–Witten three-point classes, so
the algebra in the first headline, both sides of the second and the rings compared in the third
are all missing. The spherical classes of a closed symplectic manifold with their area and first
Chern number, on which the Floer Novikov ring is built, are also absent: Tau Ceti has the period
group `TauCeti.Floer.PeriodGroup`, the Floer Novikov ring `TauCeti.Floer.NovikovRing` and the
algebraic product of supported kernels `TauCeti.NovikovModule.kernelProduct` only over an abstract
group with given area and Chern homomorphisms. Nothing is stated in their place.
-/

namespace TauCetiRoadmap.HamiltonianFloerOperations

end TauCetiRoadmap.HamiltonianFloerOperations
