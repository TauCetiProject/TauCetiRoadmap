import Mathlib

/-!
# Euler systems, Kolyvagin systems and higher-rank descent: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. Suggested signatures express selected headline theorems; discharging them
finishes neither a layer nor the roadmap.

The arithmetic headline theorems require arithmetic Selmer structures with coefficient-linear
cohomology, propagated and dual local conditions, and the Euler, Kolyvagin and Stark system carriers.
Tau Ceti's continuous `H1` supplies an additive cohomology group, but not these arithmetic
module and local-condition interfaces. Defining them requires the developments specified
in the README, rather than a few definitions on existing carriers.

The headline results requiring these objects are:

* Layers 0–1: the canonical and unramified core-rank formulas (§0.10), the finite–singular
  comparison (§1.8), and the auxiliary-prime selection theorems (§§1.15–1.16, 1.21–1.23).
* Layers 2–3: unramifiedness of Euler classes (§2.3), Kolyvagin's congruence (§3.14), and
  the Euler-to-Kolyvagin derivative maps (§§3.16–3.17, 3.19).
* Layers 4–5: rational and integral Selmer bounds (§§4.7, 4.13, 4.17–4.21), rank-one
  freeness and dual Selmer structure (§§5.3, 5.6), and the self-dual bound and exact
  primitivity formula (§§5.10, 5.13). The Howard–Zanarella paired hypotheses use the
  lattice Tate dual `T† = Hom_R(T,R)(1)` and its dual local conditions (§0.2);
  compact/discrete duality retains the Cartier dual. The Howard auxiliary-prime filtration
  uses maximal-ideal depth, with finite cyclotomic congruences in prime selection
  and ambient prime sets in DVR reductions (§§5.2, 5.8, 5.10–5.12).
* Layers 6–7: Stark-system freeness and Fitting formulas (§6.6), the signed regulator
  isomorphism (§§6.7–6.8), higher derivative and determinant comparisons (§§7.2, 7.5a), and
  higher-rank Fitting and class-group bounds (§§7.4, 7.6). Mathlib's exterior powers and
  linear duals alone do not supply the arithmetic systems or their transition maps.
  The regulator uses functional-first contractions, the conductor sign and the
  ordered permutation signs of §6.7; the determinant comparison uses the same normalization.
  Its ordinary compact-support complex retains the archimedean term and the
  resulting surjection in degree one (§7.5a).
  IntegralIwasawaTheory §12.6 supplies the shared exterior-bidual and finite-CM Rubin-lattice core.
* Layer 8: the Euler-to-Kolyvagin map over the finite coefficient rings `O/J_n`
  (§8.17), weak Leopoldt (§§8.25, 8.27), Iwasawa bounds and primitivity equalities
  (§§8.28–8.33), and integral divisibilities (§§8.34–8.39). These also require the
  compact-coefficient Iwasawa Selmer modules, specialization maps and characteristic
  ideals specified in that layer and its suppliers. The local-condition input at `p`
  includes Galois equivariance and compatible tower actions (§8.8). Specialized
  exact-length hypotheses use lattice Tate duals (§8.32); the local discrete dual
  at the coefficient prime is `U† ⊗_O F/O`, with its coefficient trace comparison (§8.35).
  The finite-quotient derivative construction uses a local stabilization index and a separate deeper
  auxiliary-prime index (§8.17). Generalized reduction, specialization and blind spots
  retain the ambient auxiliary-prime filtration (§§3.3, 8.12, 8.24). Intrinsic targets
  use the inverse of the restriction comparison under its prime-set and residual
  hypotheses (§8.18); generalized extensionality is levelwise equality in the direct limits.

These arithmetic statements are README targets on the specified Selmer and system carriers.
-/

namespace TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

end TauCetiRoadmap.EulerSystemsAndKolyvaginSystems
