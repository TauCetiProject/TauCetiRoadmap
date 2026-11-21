import Mathlib

/-!
# Theta chains on definite unitary groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Three of the four headlines are statements about algebraic modular forms on definite unitary
groups: functions on the finite adelic points `U(X)(𝔸_f)` of the unitary group of a Hermitian space
`X` over a CM field `E`, invariant on the left under the rational points and transforming on the
right under a compact open level by a character, with values in an algebraic representation of
`∏_{τ∈Φ} GL_N(ℂ)`, together with their class-set description and their integral structures
(AutomorphicFormsOnReductiveGroups §§7.4–7.5, HermitianFormsAndLattices §§5.1–5.2). Mathlib has the
unitary group `Matrix.unitaryGroup` of a matrix star ring and the finite adele ring of a Dedekind
domain, and Tau Ceti has idele class groups and Hecke characters of a number field; neither library
has the unitary group of a Hermitian space over a CM extension as an algebraic group over `F` with
its adelic points, its class sets for a compact open level, or the spaces of algebraic modular forms
on it.

* Hecke characters with prescribed data (2.4 (a)): for a CM extension `E/F` unramified at every
  finite place, a unitary Hecke character of `E` restricting to `η_{E/F}^{n_η}` on `𝔸_F^×`, with
  prescribed restrictions to the units at the places above a finite set of split places of `F`,
  unramified elsewhere and of type `(z/|z|)^{m_τ}` at the places of a CM type `Φ`, exists exactly
  when a product of these data is `1` on the elements of `E^×` whose ideal comes from `F`. The
  criterion in this generality, with its "only if" direction, is the roadmap's own formulation; the
  formal proof that the roadmap follows establishes the existence of the characters of 2.4 (b) for
  the hosts of the chain, which is the case of the "if" direction used later. Tau Ceti
  has Hecke characters as continuous characters of the idele class group, their finite and complex
  components, the map of idele class groups induced by `𝔸_F^× ⊂ 𝔸_E^×`, the global Artin map and the
  quadratic character of a separable quadratic extension, from which `η_{E/F}` can be composed. It
  lacks CM types of a CM field, and the identification of the units of the completions of `E` at the
  two places above a place of `F` split in `E` with the units of the completion of `F`, through which
  the prescribed restrictions `θ_v`, `θ_v^{−1}` and the factor `θ_v(x_{w_v}/x_{w̄_v})` of the criterion
  are read; stating the criterion would need an ad hoc encoding of both.
* The step is a theta lift (3.3, 3.4): the step operator, a class sum of jets of theta functions of
  CM abelian varieties, maps forms of weight `Λ_{j−1}` on `U(X_{j−1})` to forms of weight `Λ_j` on
  `U(X_j)`, is up to a nonzero constant the class-set theta lift of the homomorphism pair
  `(X_{j−1}^∨, δ_T X_j)`, and intertwines the Hecke operators at the split places with the Satake
  relation without inversion. It lacks, besides the carriers above, the global Weil representation
  of a unitary dual pair and its theta kernel, theta functions of CM abelian varieties with their
  Fock translations, and Satake parameters of unitary groups at split places.
* Integrality of the chain lift and of the top period (3.6, 3.10): the least common multiple `D_Γ`
  of the orders of the stabilisers of the classes divides `minkowskiBound(2fN_m)` of
  FiniteGroupInvariants §10.2, `D_Γ^m` times the chain lift preserves the forms with values in the
  Weyl lattices at every finite place of the field of places at which the kernels are integral, and
  the top period has valuation at least `−e_𝔭·v_{p(𝔭)}(D_Γ)` at every finite place `𝔭` for the base
  tuple, and for a twisted tuple at every `𝔭` whose residue characteristic lies below no twist place.
  It lacks, besides the carriers above, the Weyl and dual Weyl lattices `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` of `GL_N`
  with their contravariant form, the branching map to `GL_{N−1}`, and the function `minkowskiBound`
  on ranks.
* Source lattices (3.8): if `2fk + 1 < g₀`, the classes of the column level of a word have trivial
  stabilisers, the lattice of integral new forms has rank `d*_u·(T(u)^k − 1)^f·((T(u) − 2)/(T(u) − 1))^f`
  and its slope is that of the lattice of all integral forms minus `f·log(T(u) − 1)/(T(u) − 2)`. It
  lacks, besides the carriers above, Hermitian lattices over the ring of integers of a number field
  with their slopes (SlopesOfHermitianVectorBundles Layer 1) and the Petersson metric on lattices of
  algebraic modular forms.

The elementary statements of the roadmap that are statable at the pins are steps of the
construction, not headlines, and are not stated here: the counting lemmas on ranks and size
predicates (2.1), the separation of weight data and the existence of adapted data (2.3–2.3a), and the
bound for the exceptional sets of type primes in 2.7, which concerns primes and the valuations of
`g^e − 1` only.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ThetaChainsOnDefiniteUnitaryGroups

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ThetaChainsOnDefiniteUnitaryGroups
