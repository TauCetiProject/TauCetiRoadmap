module

import Mathlib

/-!
# Global shtukas and Langlands over function fields, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti. None of them is statable at the pins, so this
module declares nothing. Tau Ceti has the local Weil group `TauCeti.ClassFieldTheory.WeilGroup`
of a nonarchimedean local field with its degree and Weil topology, but neither library has the
L-group of a reductive group, L-parameters into it with their Weil–Deligne completions,
smooth or automorphic representations of reductive groups over function fields with their
parameters, lisse ℓ-adic or Weil sheaves on curves over finite fields, stacks of shtukas, or
overconvergent F-isocrystals.

The headline theorems, each with the carriers it lacks:

* Pure completions of local parameters and geometricity of local representations (§§0.2–0.4,
  3.4–3.8): L-homomorphisms from the Weil group into the L-group of a reductive group, their
  Weil–Deligne completions, and the Genestier–Lafforgue semisimple local parametrization.
* The constant-twist decomposition, boundary propagation of weights and purity of irreducible
  dual-group-valued local systems (§§1.1–1.4): lisse ℓ-adic sheaves on curves over finite fields,
  with their Frobenius eigenvalues at closed points and local monodromy at missing points.
* Rationality of Lafforgue's Satake classes (§2.2): the cuspidal excursion decomposition and the
  algebraic Hecke eigenvalues of cusp forms on reductive groups over global function fields.
* Equal-characteristic Fargues–Scholze parameters, Li-Huerta uniformization and the agreement of
  the Genestier–Lafforgue and Fargues–Scholze parametrizations (§§3.0–3.3): the lisse category
  of Bun_G, local and global shtuka stacks and their cohomology.
* The all-prime étale Kloosterman anchor and its Bessel companion (§4.0): Kloosterman automorphic
  data, opers and critical-level localization, lisse sheaves and overconvergent F-isocrystals on
  the multiplicative group with their local monodromy.
* Globalization of supercuspidal representations, Beuzart-Plessis pseudo-globalization,
  Gan–Harris–Sawin purity of discrete series and embedding independence of temperedness
  (§§4.2–4.8): automorphic representations, discrete series and pseudo-coefficients of reductive
  groups over function fields.
* Integrality of weights, the generic Ramanujan theorem and propagation of genericity
  (§§5.3–5.5): cuspidal excursion blocks with their lisse realizations, and Satake classes of
  unramified reductive groups over local function fields.
* Temperedness at unramified places of elliptic parameters, the Lafforgue–Zhu decomposition and
  integral weights of stack-realizable sheaves (§§6.2–6.5): shtuka cohomology and
  constant-coefficient direct images of algebraic stacks.
* Rationality of the discrete spectrum and Xue's parametrization of finite-codimension Hecke
  quotients (§§7.5–7.6): discrete automorphic modules and the excursion action on compactly
  supported functions on Bun_G.
* Place independence of weight patterns, propagation of complementary series and elimination of
  extraneous points (§§8.1–8.2 and 8.6): compatible global parameters, Satake classes of reductive
  groups over function fields, and the spherical strata of nilpotent orbits.

Property A (§8.4) is statable on `Finsupp`, but it is an auxiliary statement about finitely
supported arrays that mentions none of the roadmap's objects, so it is not a headline. The
global Arthur homomorphism, its Satake matching and the Arthur decomposition of §7.2 are
conjectural interfaces, not theorems of this roadmap.
-/

namespace TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglandsPartII

end TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglandsPartII
