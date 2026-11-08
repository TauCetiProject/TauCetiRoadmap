module

public import Mathlib

/-!
# Hilbert modular varieties and quaternionic Shimura curves: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti.

The roadmap's headline theorems are the Čerednik–Drinfeld uniformisation (§R18.5.15), the Ihara
lemma for Shimura curves with its integral saturation (§§R18.4.32–R18.4.33), the definite Ihara
lemma (§R18.3.8) and the paired torsion twists with local points (§§H6.2–H6.8), with their deep
inputs §§R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30 and H6.5. None of them is statable at
the pins, so this file declares nothing: the required arithmetic-geometric carriers are absent.
Each group of headlines and what it lacks:

* The Hilbert moduli comparison and Deligne–Pappas representability, flatness and determinant
  theorems (H1–H2) require relative abelian schemes with ordered real-multiplication
  polarizations and their PEL and DP moduli functors. Abelian varieties over fields alone do
  not provide these objects.
* The arithmetic polarization quotient, Hecke isogenies and full-level torsors (H3–H4)
  require those moduli functors, quotient stacks and their actual level actions. The modular
  comparison, cusp and Hodge-bundle theorems (H5) also require canonical Hilbert models.
* The paired torsion twists, geometrically irreducible components and real and finite local
  points (H6.2–H6.8) require the paired Hilbert torsion moduli and its universal family;
  even the elliptic variant requires paired torsion moduli and finite étale descent.
* The Hilbert centre and type comparisons (H0) and the canonical quaternionic
  curve and PEL bridge (R18.1) require Shimura data and canonical-model carriers.
* Drinfeld representability, formal arithmetic quotients, Čerednik–Drinfeld uniformisation
  and its level tower (R18.5.5, R18.5.7, R18.5.11, R18.5.12a–R18.5.12c, R18.5.13, R18.5.15, R18.5.21) require
  special formal quaternionic modules, the formal Drinfeld curve and its rigid generic fibre.
  Basic PEL uniformisation also requires the auxiliary integral PEL moduli, its framed
  polarized isogeny quotient and its Weil descent datum. The set of nonrational projective
  points does not supply these spaces. The graph and
  monodromy comparisons (R18.5.17–R18.5.18) require their semistable models and Jacobians.
* The integral quaternionic model tower, Hodge line, p-divisible group and Kodaira–Spencer
  comparisons (R18.2) require the canonical curves, their integral models and structured
  relative p-divisible groups.
* The definite Ihara lemma over arbitrary totally real fields (R18.3.8–R18.3.9), finite-level
  Jacquet–Langlands realization and auxiliary-level theorems (R18.3) require adelic
  quaternionic form modules with their coefficient, level and Hecke actions. Generic
  double-coset quotients and Hecke operators do not supply these arithmetic modules.
* The residual and integral Ihara lemmas (R18.4.32–R18.4.33), automorphic and Galois–Hecke
  comparisons (R18.4.25, R18.3.29, R18.4.27) and coefficient purity (R18.4.34–R18.4.36)
  require the canonical curves' étale coefficient cohomology, geometric degeneracy maps,
  automorphic eigenspaces and PEL projectors. Twisted singular cohomology alone does not
  provide these objects. The intervening patching theorems require these cohomology modules
  and their local-type deformation data.

Fractional-ideal trace duality, unit-square quotients, matrix identities, abstract DVR
splittings, Eichler orders with their local form, completed levels, right ideal classes and
Brandt matrices, the bottom-row reduction and indices of the congruence levels `K₀(I)` and `K₁(I)`
over a local ring, and the fibres of class-set refinement maps are supporting infrastructure
specified in the README. They do not state the moduli, uniformisation or Ihara theorems, and no
auxiliary definitions are needed without those statements.
-/

@[expose] public section

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

end TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves
