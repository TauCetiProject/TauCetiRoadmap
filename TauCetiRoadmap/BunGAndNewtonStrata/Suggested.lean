import Mathlib

/-!
# Reductive bundles, B(G) and Newton strata: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; this file gives suggested Lean statements for its headline theorems.

No headline theorem can be stated against the pinned Mathlib and Tau Ceti libraries:

* Layer 0's rational filtered splitting, pure inner twisting and locally profinite
  classifying-stack theorem (§§0.2, 0.7, 0.9) need relative filtered fibre functors,
  torsor groupoids on the relevant sites and classifying v-stacks.
* Layer 1's classification by Newton and Kottwitz invariants, straight-class comparison,
  decent representatives and maximal acceptable classes (§§1.10–1.12, 1.25–1.26)
  need the general-local-field coefficient theory, reductive Newton and integral Kottwitz
  maps, and the local Iwahori–Weyl datum. The algebraic centralizers, torus and abelianized
  comparisons likewise need those arithmetic constructions.
* Layer 2's Beauville–Laszlo uniformization, isocrystal-family descent and Newton topology
  theorem (§§2.12, 2.17, 2.20) need the relative curve with its bundle categories,
  the affine Grassmannian, families of G-isocrystals and the v-stack Bun_G.
* Layer 3's filtered relative automorphism theorem, stratum dimensions and connected
  components (§§3.3, 3.11, 3.18) need filtered fibre functors, the full automorphism
  v-groups and Newton strata, together with cohomological smoothness and dimension.
* Layer 4's chart-image comparison and rank-two extension theorem (§§4.7–4.8) need
  the filtered charts and Banach–Colmez extension spaces.

Tau Ceti's reductive group schemes, finite rational comodules and finite locally free
sheaves do not supply these missing arithmetic and relative geometric objects. Its
Fargues–Fontaine Frobenius orbit space is a topological space, without the relative curve
and bundle theory needed here. Mathlib's `WittVector.Isocrystal` and its one-dimensional
classification supply the Witt rank-one Check, rather than the general reductive
classification. Abstract twisted-conjugacy quotients, numerical slope tuples and integral
coinvariants alone do not state any of the headline theorems above.
-/

namespace TauCetiRoadmap.BunGAndNewtonStrata

end TauCetiRoadmap.BunGAndNewtonStrata
