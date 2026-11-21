import Mathlib

/-!
# Base change and Galois representations for unitary groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about smooth representations of `GL_n(F)` over a finite extension
`F` of `ℚ_p` and their Langlands parameters, or about automorphic representations and the
`ℓ`-adic Galois representations attached to them. Neither Mathlib nor Tau Ceti has these carriers
at the pins: there are no smooth or admissible representations of `p`-adic groups, no
supercuspidal representations or compact induction, no Weil–Deligne representations, no local
Langlands correspondence and no local factors of pairs, no automorphic representations, and no
`ℓ`-adic Galois representations with their Hodge–Tate weights and `D_pst`. Tau Ceti has the local
Weil group `TauCeti.ClassFieldTheory.WeilGroup K` of a nonarchimedean local field, its inertia
subgroup `TauCeti.inertiaSubgroup K` and the local Artin map
`TauCeti.ClassFieldTheory.weilArtinMap K`, which give the rank-one part of a parameter only;
Mathlib has `Representation` for abstract groups, `Field.absoluteGaloisGroup` and the Gauss sums
`gaussSum` of finite rings, none of which carries the representation theory of `GL_n(F)`.

* The trace-defined correspondence is the local Langlands correspondence (10.29a): for every
  `n ≥ 1` the trace-defined map from irreducible smooth representations of `GL_n(F)` to
  Frobenius-semisimple `n`-dimensional Weil–Deligne representations is a bijection with the five
  properties of a local Langlands correspondence (rank one through `Art_geo⁻¹`, supercuspidals to
  irreducible Weil representations with `N = 0`, determinants, the segment rule, `ε`-factors of
  supercuspidal pairs of different ranks), and the only such family; it also matches duals, twists
  and all `L`- and `ε`-factors of pairs. It lacks the smooth representations of `GL_n(F)`, their
  supercuspidal support and Langlands classification, Weil–Deligne representations, the
  trace-defined correspondence itself, and the Rankin–Selberg and Langlands–Deligne factors of
  pairs.
* Explicit parameters of depth-zero supercuspidal representations (10.34): for a regular
  character `θ̃` of level zero of `F_n^×` with reduction `θ`, the parameter of `π_θ̃` is the
  induction of `(Δ_n θ̃)∘Art_{geo,F_n}⁻¹` from `W_{F_n}` to `W_F`, its restriction to inertia is
  `⊕_{j<n} θ^{q^j}∘t_n`, and for `n ≥ 2` its `ε`-factor is `(−1)^{n−1}θ̃(ϖ)G_n(θ⁻¹)q^{−ns}`. It
  lacks, besides the carriers of the previous item, the cuspidal representations of `GL_n(𝔽_q)`
  attached to regular characters, compact induction from `F^×GL_n(𝒪)`, the depth-zero
  supercuspidal representations `π_θ̃`, induction of representations of the Weil group from an
  open subgroup, and the Gauss sums `G_n` of FiniteReductiveGroups §5.10.
* Local–global compatibility for polarized representations (14.1, 14.2, 15.1): for a regular
  algebraic polarized cuspidal representation `(π, χ)` of `GL_n(𝔸_E)` over a CM field `E`, the
  representation `r_{ℓ,ι}(π)` satisfies `WD(r|_{G_{E_w}})^{F-ss} ≅ ι⁻¹rec^T(π_w)` at every
  `w ∤ ℓ`, has the stated inertial type and `N = 0` at places of depth zero up to twist with
  unlinked support, and at `w ∣ ℓ` with a parameter induced from unramified extensions is
  potentially crystalline with the matching Weil–Deligne representation. It lacks automorphic
  representations of `GL_n(𝔸_E)` with their regularity, algebraicity and polarization, the
  attached `ℓ`-adic Galois representations, the local Langlands correspondence, Weil–Deligne
  representations of `ℓ`-adic representations of local Galois groups, and `D_pst`.
* Galois representations of definite unitary groups (16.1): for an automorphic representation
  `Π` of `U(V)(𝔸_{E⁺})`, `V` definite at every infinite place and `[E⁺:ℚ] ≥ 2`, the sum of the
  Galois representations of the twisted blocks of the Speh decomposition of its weak base change
  is continuous, semisimple, unramified with the Satake polynomial at its unramified places away
  from `ℓ`, and de Rham with the labelled weights of `λ` above `ℓ`. It lacks, besides the carriers
  of the previous item, the unitary group `U(V)` of a Hermitian space over a CM field as a group
  over `E⁺` with its adelic points (Mathlib's `Matrix.unitaryGroup` is the group of unitary
  matrices over a star ring), its automorphic representations, weak base change to `GL_n(𝔸_E)`
  and Speh representations.

The splitting characters of 6.3a are Hecke characters of a quadratic extension `E/F` with
prescribed restriction to the idele classes of `F` and prescribed archimedean components; Tau
Ceti has the carriers of that statement (`TauCeti.GlobalNumberFields.HeckeCharacter`, its
`complexComponent`, the extension of idele classes and the global Artin map), but 6.3a is a
supporting construction of the theta-lift setting, not a headline, and it is not stated here. The
rank-one cases of the headlines (`n = 1`: local class field theory and algebraic Hecke characters)
are weaker statements and are not stated either.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.BaseChangeAndGaloisRepresentationsForUnitaryGroups

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.BaseChangeAndGaloisRepresentationsForUnitaryGroups
