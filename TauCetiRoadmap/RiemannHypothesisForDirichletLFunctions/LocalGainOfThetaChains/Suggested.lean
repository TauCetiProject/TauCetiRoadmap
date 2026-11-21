import Mathlib

/-!
# Local gain of theta chains: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about the chain of theta lifts of ThetaChainsOnDefiniteUnitaryGroups
(Layers 2 and 3): the lattices `ℳ^{int}_j` of integral algebraic modular forms on the definite
unitary groups `U(X_j)` of Hermitian spaces over an abelian CM field `E` (in Gross's models,
functions on a finite class set with values in tensor products of Weyl lattices of `GL_{N_j}`),
the step operators `K_j(ξ)` given by CM theta kernels, the chain lift `col_ξ` and the top period
`P̃_ξ`, read locally at the places of a number field `𝕃`. Mathlib has the matrix unitary group
`Matrix.unitaryGroup` of a star ring and one-dimensional formal group laws `FormalGroup`; Tau Ceti
has the formal group of a Weierstrass curve, the Kostant form of an enveloping algebra and the
Weyl construction `TauCeti.weylModuleOfShape` of representations of `GL n k` over a field. Neither
has algebraic modular forms on the unitary group of a Hermitian space over a CM field with their
class sets and integral structures, the integral Weyl and dual Weyl lattices `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` of a
dominant weight, CM theta functions in several variables, theta lifts written as class-set
operators, or the Lubin–Tate formal groups of height two with their logarithms over an unramified
base.

* The gain of a step and of the chain lift (4.10, 4.11): under the size conditions of 4.10, at a
  place `𝔭` of `𝕃` above a prime `p ≥ 5` inert in `K`, unramified in `E`, with `p ≤ X″` and of
  split type, and for a tuple `ξ` unramified above `p`, every step maps `ℳ^{int}_{j−1}` into
  `p^{g⁰_j(𝔭) + F_j(𝔭) − E_{u,j}(𝔭) + [j=1]·v_p(D_Γ)}·ℳ^{int}_j` locally at `𝔭`, the chain lift
  gains the sum of these exponents plus `v_p(D_Γ)`, and, for the base tuple and the tuples used at
  some place, the periods of row forms have valuation at least
  `⌊e_𝔭·Σ_j(g⁰_j + F_j − E_{u,j})(𝔭)⌋`. It lacks the lattices of integral forms, the step
  operators and the chain lift (ThetaChainsOnDefiniteUnitaryGroups §§3.1–3.5), the top period
  (ThetaChainsOnDefiniteUnitaryGroups §3.9), and the ledger of gains, bulks and costs (4.9e,
  4.9f), which is defined through the weights and the Taylor bounds of the chain.
* The refined gain on the Hecke image and its colength (4.14, 4.15c): on the image of the ideal
  `𝒴 = ∏_{v∈𝒱}(y_v^m, p^{𝔵_v})` of Hida-normalised Hecke operators at places above `p`, the
  chain gains `Σ_j(g_j + F_j − E_{u,j})(𝔭) + v_p(D_Γ)`, and under the depth property at every
  `v ∈ 𝒱` with `m·Σ_v sh_v ≤ 1/2` and a sandwich exponent `e`, the colength of
  `𝒴·ℳ^{int}_0 ∩ p^τ·ℳ^{int}_0` in `ℳ^{int}_0` is at most `e_R·rank·(τ + 2S·m·Σ_v sh_v)`. It
  lacks, besides these, the local model of the forms at the places above `p` and the Hecke
  operators `y_v` (4.12), and the depth property (4.15), a statement about the integral dual Weyl
  lattices of tuples of lattices over an unramified extension of `ℚ_p`.
* The gain sublattice (4.16): given served data with the depth property and `InertFreeUpTo 4`,
  the sublattice `N_u ⊂ M_u` cut out by local conditions has colength at most
  `e_𝔭·d^{all}_u·(τ_N(𝔭) + 𝔦(𝔭))` at every place `𝔭` not above the level prime, and the periods of
  its forms against row forms have valuation at least `⌊e_𝔭·𝔊_u(𝔭)⌋`. It lacks, besides these, the
  source lattices `M_u` (ThetaChainsOnDefiniteUnitaryGroups §3.8) and the operators at the level
  prime (ThetaChainsOnDefiniteUnitaryGroups §3.7).
* The gain inequality (4.17a): with the data of 4.17, at every place above a prime `p ≤ X″` inert
  in `K` and outside `Drop`, `0 ≤ g_j(𝔭) ≤ 4|Φ_top|a/p` and the ramp sums of the tops of
  `Φ_top(𝔭)` (all tops, except below `X′` at the primes inert in `K` and in `ℚ(√−q)`, where only
  the tops on served orbits count), less the losses, are at most `Σ_j g_j(𝔭) − τ_N(𝔭)`; the ask of
  the excluded tops is bounded in 4.17c under two properties of the host. It lacks the gains
  `g_j` of 4.9e and the data of 4.17 (the candidates, the good places and their shares, which are
  defined through the depth property), besides the hosts with their tops
  (FrobeniusRestrictedRieszSums §§0.4–0.7).

Some statements on the routes are statable in Mathlib and are not stated here, because they are
steps of the routes and not headlines: the elementary divisors of a matrix of polynomials along an
arithmetic progression (4.14a), the walk lemma for commuting endomorphisms of a module over a
discrete valuation ring (4.15b), the colengths of lattices exchanged by two operators (4.15a), and
the probability that an orbit with independently selected tops is good (4.15d).
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LocalGainOfThetaChains

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LocalGainOfThetaChains
