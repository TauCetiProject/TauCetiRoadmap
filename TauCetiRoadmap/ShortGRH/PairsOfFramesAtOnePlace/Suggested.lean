import Mathlib

/-!
# Pairs of frames at one place: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
stated here, for the reasons below.

The headlines are statements about the unitary group of the Hermitian form with `ϱ` hyperbolic
planes of SecondMomentsOfPoincareSeries over a locally compact ring with involution (the complex
numbers, or the product of the completions of a CM field at a finite set of finite places), with
its frame and Bessel subgroups, the Haar measures built floor by floor, and the Bessel functions
of that roadmap. Mathlib has, at the pin, `Matrix.unitaryGroup` and Haar measures on locally
compact groups; neither Mathlib nor Tau Ceti has the Bessel subgroups and Bessel functions of
these groups, the discrete series of the real unitary groups `U(p, q)` or their matrix
coefficients.

* The local bounds at the complex place for the cut of a normalised Bessel function (4.3 (d)):
  they need the cut Bessel functions of SecondMomentsOfPoincareSeries §3.3.
* Decay and the bound for the mass integral at the finite places (5.4 (b), (d)), the density at
  the last entry (6.3), and the gain from fixed vectors (7.2 (b)): they need the Bessel vector of
  an open compact subgroup between the principal congruence subgroup and the integral points.
* The pairing of two steep coefficients (8.6 (c)): it needs the coefficient `c_l` of a discrete
  series of `U(p, q)` at its lowest `K`-type.

Place data and gauges (Layer 2) and the abstract estimates of Layer 3 are stated for structures
that could be written on Mathlib's carriers (measures, a filtration of a ring by sizes); they are
long structures whose fields are fixed by the README and are steps towards the headlines, and no
signature is given for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.PairsOfFramesAtOnePlace

end TauCetiRoadmap.ShortGRH.PairsOfFramesAtOnePlace
