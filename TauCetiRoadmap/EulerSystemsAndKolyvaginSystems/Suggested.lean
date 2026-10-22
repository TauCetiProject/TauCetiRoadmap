import Mathlib

/-!
# Euler systems, Kolyvagin systems and higher-rank descent: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. Suggested signatures express selected headline theorems; discharging them
finishes neither a layer nor the roadmap.

No headline theorem is statable against the pinned Mathlib and Tau Ceti interfaces.
The missing objects are arithmetic Selmer structures with coefficient-linear cohomology,
propagated and dual local conditions, and the Euler, Kolyvagin and Stark system carriers.
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
  primitivity formula (§§5.10, 5.13).
* Layers 6–7: Stark-system freeness and Fitting formulas (§6.6), the regulator
  isomorphism (§6.8), higher derivative and determinant comparisons (§§7.2, 7.5a), and
  higher-rank Fitting and class-group bounds (§§7.4, 7.6). Mathlib's exterior powers and
  linear duals alone do not supply the arithmetic systems or their transition maps.
* Layer 8: weak Leopoldt (§§8.25, 8.27), Iwasawa bounds and primitivity equalities
  (§§8.28–8.33), and integral divisibilities (§§8.34–8.39). These also require the
  compact-coefficient Iwasawa Selmer modules, specialization maps and characteristic
  ideals specified in that layer and its suppliers.

These are README targets. There are no compiled theorem declarations here until their
arithmetic carriers can be used in the statements.
-/

namespace TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

end TauCetiRoadmap.EulerSystemsAndKolyvaginSystems
