import Mathlib

/-!
# Uniform wild kernel bounds: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a bound for the groups `Ш¹(F, ℓ, e)` of a number field `F`: the classes in
`H¹(G_{F,S}, ℚ_ℓ/ℤ_ℓ(−e))`, `G_{F,S}` the Galois group of the maximal extension of `F` unramified
outside the places above `ℓ` and the infinite places, whose restrictions to the decomposition
groups at the places above `ℓ` vanish (BernoulliBoundsForClassGroupEigenspaces §6.17), and for
their logarithmic total `V(F, t) = log ∏_ℓ ∏_{1 ≤ e < t} #Ш¹(F, ℓ, e)`. Mathlib has continuous
group cohomology `continuousCohomology n A` of a topological representation `A : TopRep k G`, and
for the absolute Galois group `Field.absoluteGaloisGroup K` the subgroup
`ContinuousCohomology.tateShafarevich` of the classes that vanish on restriction to a family of
field extensions of `K`. Tau Ceti has the `p`-adic cyclotomic character
`TauCeti.continuousLocalCyclotomicCharacter` of the absolute Galois group and the finite twisted
modules `TauCeti.ZModTwist` (`ℤ/pⁱ` twisted by a continuous character). Neither has the discrete
divisible module `ℚ_ℓ/ℤ_ℓ(−e)`, the direct limit of the twists `ℤ/ℓⁱ(−e)`, as a topological
representation of the absolute Galois group, nor the local condition at the finite places not
above `ℓ`: the classes of `Ш¹(F, ℓ, e)` are unramified there, a condition on the inertia subgroups
of the decomposition groups (equivalently, cohomology of the quotient `G_{F,S}`), which the pins do
not provide; `ContinuousCohomology.tateShafarevich` asks for vanishing on the whole decomposition
group and defines a smaller group at those places. The fields on which the headlines are stated,
the dyadic host fields `E_n(χ, Q) = ℚ(μ_{2^{n+2}})⁺ · ℚ(χ) · ∏_{q ∈ Q} ℚ(√−q)` of a primitive
Dirichlet character `χ` (FrobeniusRestrictedRieszSums §0.4), are not defined at the pins either;
Mathlib has `CyclotomicField`, the Galois group of a cyclotomic extension
(`IsCyclotomicExtension.autEquivPow`), `IntermediateField.fixedField` and `NumberField.IsCMField`,
from which they could be defined once the groups `Ш¹(F, ℓ, e)` are.

* The polynomial bound away from the bad primes (7.2, 7.3): for every primitive `χ` there is `C`
  such that for every layer `n ≥ 2`, every pair `Q` of primes, one `≡ 3 mod 8` and one `≡ 7 mod 16`,
  prime to `f_χ`, and every `t ≥ 2` with `min Q > max(2t + 1, P(χ))`, the sum over the odd primes
  `ℓ ∉ B(χ)` of
  `log ℓ · Σ_{1 ≤ e < t} length Ш¹(E_n(χ, Q), ℓ, e)` is at most `(N t)^C`, `N = N_n(χ, Q)`; at the
  primes of `B(χ)` the plus part is at most `(N t)^C + C·B` for a bound `B` of the twist sums over
  finitely many fixed cyclotomic fields. It lacks the groups `Ш¹(F, ℓ, e)` (the coefficient
  module `ℚ_ℓ/ℤ_ℓ(−e)` and the local condition away from `ℓ`), their plus and minus parts for a CM
  field, and the host fields.
* The window theorem (7.4) and its budget form (7.6): for primitive `χ`, `α, κ ≥ 1` and
  `0 < δ ≤ 1` there are `J ≥ 1`, `C` and `X₀` such that for every `X ≥ X₀` and every pair `Q` of
  primes, one `≡ 3 mod 8` and one `≡ 7 mod 16`, with `q ∤ f_χ`, `q > 2X^κ + 1 + P(χ)` and
  `Σ_{q ∈ Q} log q ≤ X^{δ/J}`, some `Y ∈ [X^{1/J}, X^{1/2}]` has the property that for every
  `x ∈ [Y, Y²]`, every `n ≥ 2` with `2^n ≤ x^α` and every `2 ≤ t ≤ x^κ` the groups
  `Ш¹(E_n(χ, Q), ℓ, e)`, `1 ≤ e < t`, are finite and `V(E_n(χ, Q), t) ≤ (N t)^C + exp(x^δ)`. It
  lacks the same carriers, and the total `V(F, t)` built from them.
* The tower form (7.5), the roadmap's own corollary of the window theorem: for primitive `χ` and
  `κ, δ > 0` there are `J` and `k₁` such that every
  `k₀ ≥ k₁` has some `k ∈ [k₀, J k₀]` with `V(E_n(χ, ∅), ⌊2^{κn}⌋) ≤ exp(2^{δn})` for every
  `n ∈ [k, 2k − 2]`. It lacks the same carriers.

The constants `B(χ)` and `P(χ)` of 0.3 are definable at the pins (Mathlib has
`DirichletCharacter`, its conductor and order, and `NumberField.classNumber`), but they enter only
these headlines. The pigeonhole on scales 2.1 is a statement about finite sets of reals and the
class-number bound 5.1 for quadratic fields is a statement about `NumberField.classNumber`; both
are statable in Mathlib, and both are steps of the routes, not headlines, so they are not stated
here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.UniformWildKernelBounds

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.UniformWildKernelBounds
