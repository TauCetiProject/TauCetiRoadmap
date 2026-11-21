import Mathlib

/-!
# Local factors of twists and types: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about smooth complex representations of `GL_n(F)`, or of an
unramified unitary group, over a nonarchimedean local field `F`: irreducible, generic,
supercuspidal, square-integrable and unitary representations, their Whittaker models, their
Rankin–Selberg factors and their Satake parameters (SmoothRepresentationsOfLocalGroups Layers
SR.0–SR.5, AutomorphicLFunctionsAndLocalFactors Layer AL.3). Neither Mathlib nor Tau Ceti has
these carriers at the pins. Mathlib has `Representation`, the groups `Matrix.GeneralLinearGroup`
over a field, the class `IsNonarchimedeanLocalField`, and `MulChar`, `AddChar` and `gaussSum`; it
has no smooth or admissible representations of a locally profinite group, no parabolic induction
or Jacquet module, and no Hecke algebra of a compact open subgroup. Tau Ceti has the local
reciprocity map `TauCeti.ClassFieldTheory.artinMap`, the Satake parameters
`HeckeRing.GL2.Newform.satakeParameters` of classical newforms, and the finite-order characters
`TauCeti.LFunctions.PrimitiveRayClassCharacter`, and none of the representation theory of `p`-adic
groups.

* The local converse theorem (6.4): for `n ≥ 2`, two irreducible generic representations of
  `GL_n(F)` with the same central character whose `γ`-factors of pairs agree with those of every
  irreducible supercuspidal representation of `GL_r(F)`, `1 ≤ r ≤ n − 1`, are isomorphic, and in
  characteristic zero the ranks `r ≤ ⌊n/2⌋` suffice. It lacks smooth irreducible, generic and
  supercuspidal representations of `GL_n(F)`, their central characters, Whittaker models, and the
  Rankin–Selberg factor `γ(s, π × τ, ψ)`.
* The uniqueness of local Langlands correspondences (6.5): for `F/ℚ_p` finite there is at most one
  family of bijections from irreducible smooth representations of `GL_n(F)` to Frobenius-semisimple
  Weil–Deligne representations that is reciprocity in rank one and respects supercuspidality,
  central characters, the segment rule and the `ε`-factors of pairs. It lacks, besides the
  carriers of 6.4, Weil–Deligne representations of the Weil group of `F` with their Frobenius
  semisimplicity, segments and the representations `L(Δ)`, and the Langlands–Deligne local
  constants of Weil representations; the reciprocity map of Tau Ceti is there, but a statement in
  rank one alone is property 1 of the definition, not the theorem.
* The exponent bound (6.3): the real exponents `α_i` of an irreducible unitary generic
  representation `δ₁ν^{α₁} × ⋯ × δ_rν^{α_r}` of `GL_n(F)`, `F/ℚ_p` finite, with `δ_i` unitary
  square-integrable, satisfy `|α_i| < 1/2`. It lacks, besides the carriers of 6.4, unitary and
  square-integrable representations, normalised parabolic induction and the Rankin–Selberg factor
  `L(s, δ × δ^∨)`. For `n = 1` it says only that a unitary character has exponent `0`.
* The Satake bounds (3.4, 7.2): a character of the spherical Hecke algebra of `GL_n(K)`, or of an
  unramified unitary group, with a bounded spherical function has Satake parameters of absolute
  value between `Q^{−(n−1)/2}` and `Q^{(n−1)/2}`, and the partial standard `L`-function of an
  automorphic representation of a unitary group occurring in `L²`, twisted by a unitary Hecke
  character, converges absolutely and is nonzero for `Re z > (n + 1)/2`. It lacks the spherical
  Hecke algebra `ℋ(G, K₀)` of a reductive group over `K`, the Satake transform and spherical
  parameters, unramified unitary groups with their hyperspecial subgroups, and, for 7.2 (iii),
  automorphic representations of unitary groups, unitary Hecke characters of infinite order and
  the doubling standard `L`-function.

Epsilon factors of characters of local fields and Gauss sums of finite fields are not headlines
of this roadmap: Tate's local constants and the Gauss sums are AutomorphicLFunctionsAndLocalFactors
Layer AL.1, and the rank-one cases of the headlines above are either part of a definition (6.5,
property 1) or trivial (6.3). The Hecke eigenvalue bound 3.1 is a statement about a locally
profinite group, a compact open subgroup and a vector with a bounded coefficient; its part (a) is
an estimate that follows in one line from its hypotheses, a step of the route to 3.4 and not a
headline, and it is not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LocalFactorsOfTwistsAndTypes

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LocalFactorsOfTwistsAndTypes
