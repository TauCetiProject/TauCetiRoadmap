module

public import Mathlib

/-!
# Finite flat groups and integral p-adic Hodge theory, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It records which of the roadmap's
headline theorems can be stated against the pinned Mathlib and Tau Ceti APIs.

None of the following headline theorems is statable at the pins. Each requires a substantial
mathematical carrier, rather than a few simple definitions on existing carriers:

* Perfect-ring Dieudonné anti-equivalence: Tau Ceti's
  `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` supplies the finite levels, but the pins
  have no p-divisible-group category over a perfect ring, no category of finite projective
  Witt-vector modules with `F` and `V`, and no Dieudonné functor.
* Complete-local display anti-equivalence: missing Zink coefficient rings, frames and displays,
  as well as the p-divisible-group category and its crystalline functor.
* Universal marked displays: missing marked display deformation functors and their formal bases.
* Integral filtration and tilde tensor torsors: missing integral fixer group schemes, local-model
  filtrations, the invariant tilde functor and their tensor-isomorphism torsors.
* Formal-curve and arithmetic-curve very-good criteria: missing good integral Hodge embeddings,
  local models and canonical first-order display transport.
* Nonexceptional very-good lattice-chain existence: missing parahoric local models, integral
  Hodge embeddings and very-goodness on their geometric points.
* Type-D PEL and central-enlargement very-good existence: missing the classical integral fixer
  and lattice-chain representations together with their tensor displays.
* Wild standard type-A and symplectic-enlargement very-good existence: missing the integral
  division-algebra lattice-chain representations, local models and tensor displays.
* Integral crystalline tensor comparison and étale recognition: missing crystalline Galois
  lattices, p-divisible Tate modules, crystalline evaluation and integral tensor types.
* Versal adapted deformation theorem: missing marked p-divisible deformations,
  tensor-adaptedness, very-good embeddings and the local-model quotient.
* Universal marked parahoric displays: missing the parahoric display deformation category and
  its compatible local-model pair and tilde torsor.
* Hyperspecial Breuil–Kisin tensor frames: missing the crystalline-lattice functor and reductive
  integral tensor-isomorphism torsors.
* Explicit hyperspecial adapted lifts: missing height-one Breuil–Kisin modules, their integral
  crystalline comparison and the p-divisible-group realization functor.
* Frobenius-pullback integrality of the connection: missing smooth-base Dieudonné crystals,
  their integral connection lattices and p-divisible-group realization.
* Toral weak admissibility in the centralizer normalization: missing filtered tensor
  G-isocrystals, their cocharacters, Newton invariants and admissibility.
* Equality of the horizontal and adapted loci and the smooth hyperspecial quotient: missing
  the universal crystalline connection, its transported tensors and both formal loci.
* Tensor-compatible lattice specialization and Kottwitz equality: missing the integral
  Breuil–Kisin family, reductive affine Grassmannians and their component maps.
* Admissible-filtration realization by an adapted isogenous lift: missing filtered crystalline
  tensor data, the p-divisible realization functor and integral comparison lattices.
* Ordinary integral sigma-conjugacy normalization: missing parahoric group schemes, the affine
  Weyl action and ordinary G-isocrystal classes.
* Central ordinary adapted lift with the full rational sigma-centralizer action: missing
  the Newton-Levi tensor modification, height-one realization and the p-divisible isogeny category.
* Adapted lift with a specified nonordinary Levi filtration: missing compatible Levi local models,
  very-good tensor embeddings and marked p-divisible deformation functors.

Mathlib's Witt-vector isocrystal class supplies a rational Frobenius module over a perfect field,
and Mathlib's `Module.Grassmannian.functor` supplies the functor of filtration points of a module
without its representing scheme. Neither supplies the integral display carrier or any of these
tensor deformation problems, and stating a headline through a stand-in for a missing carrier would
replace it by a weaker theorem.
-/

@[expose] public section

namespace TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII

end TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII
