import Mathlib

/-!
# Bessel–Poincaré series and Gram bounds: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about unitary representations of locally compact groups and their
matrix coefficients: square-integrable irreducible unitary representations with their formal
degree (VonNeumannAlgebras Layer 9), discrete series of real unitary groups `U(p, q)` with their
Harish-Chandra parameters (AutomorphicFormsOnReductiveGroups §2.4), and, for (2) and (3),
automorphic forms on unitary groups of Hermitian spaces over a CM extension of a totally real
field. Mathlib has Haar measures, `MeasureTheory.Measure.IsMulLeftInvariant`, Følner sequences
(`IsFoelner`), quotient measures on `G ⧸ Γ` for a discrete or normal subgroup `Γ`,
finite-dimensional `Representation`s, and `ContRepresentation`, a group acting by continuous
linear maps; Tau Ceti adds `ContRepresentation.IsUnitary` (every operator preserves the inner
product) and the joint continuity of a unitary representation with continuous orbits, so unitary
representations on a Hilbert space are available. Neither library has a square-integrable
representation or a formal degree, a quotient measure on `S\G` or on a double coset space
`S\G/S′` for a closed subgroup `S` that is neither discrete nor normal, or the unitary group of a
Hermitian space over a number field with its adelic points.

* Relative Schur orthogonality (5.15a): for an irreducible square-integrable unitary
  representation `σ` of formal degree `d` of a unimodular second-countable locally compact group
  `G`, closed unimodular amenable subgroups `S, S′`, and continuous functions `W, W′` on `G` that
  transform under `S`, `S′` by finite-dimensional unitary representations, are fixed by the
  projector of `σ`, and are integrable and of norm one on `S\G` and `S′\G`, the orbital integrals
  `O(γ) = ∫ W(x) ⊗ conj W′(γ⁻¹x) dx` satisfy `∫_{S\G/S′} ‖O(γ)‖²_HS dγ ≤ 1/d`, when they converge
  absolutely and the three integrability conditions of 5.15a hold, for a measurable
  parametrisation of the double cosets that disintegrates Haar measure. It lacks square
  integrability and the formal degree of a unitary representation, the integrated action `R(f)`
  of `L¹(G)` for a non-commutative `G` (Tau Ceti integrates strongly continuous representations of
  additive monoids only), and the quotient measures on `S\G` and on `S\G/S′`.
* Limit multiplicity with a uniform error (5.16): for a Hermitian space `V` of dimension `n ≥ n₀`
  over a CM extension `E/F` with a self-dual lattice and one signature `(p_V, q_V)` at every real
  place, `q_V² ≤ n`, `log rd_E ≤ e^n`, `log f ≤ √n`, a discrete series `π_∞` of `U(V)(F_∞)` with
  parameters of size at most `b²` and gap at least `C·n^19·f^5·log(b·rd_E)`, and an admissible
  idempotent `ϕ` of level at most `b^(C_ϕ)` supported on elements unipotent modulo a prime
  `g′ > 4n` that splits completely in `E`, the multiplicity of `π_∞` at level `ϕ` differs from
  `∏_τ d(π_τ)·vol([U(V)])·ϕ(1)` by at most `exp(−c·nf log n)` times that number. It lacks, besides
  these, the unitary group of a Hermitian space over `E` as a group over `F` with its adelic
  points and the volume of `U(V)(F)\U(V)(𝔸)`, the discrete series of `U(p, q)`, the space of
  cusp forms on `U(V)(F)\U(V)(𝔸)` with the right regular representation, and the rank of
  `R(e_{π_∞} ⊗ ϕ)` on it.
* The Gram bounds (5.20, 5.21): for the data of the chain at a large scale `x`, with `E/F`
  unramified at every finite place, under the standing conditions (St) of 5.20a with `m ≥ C_m`,
  the hypotheses of 5.20b (among them `r_S ≥ 1`, `g₀ ≠ g₁`, and level primes `T(u), T(u′) ≥ 3`
  that split completely in `E`, are prime to `g₀g₁` and are congruent modulo `(g₀g₁)²`), the
  remaining hypotheses of 5.20 and the rank window for both words, the Gram operators of the
  Bessel–Poincaré series of two words whose types differ by
  exactly `Δ_w` at one letter at every real place have squared Hilbert–Schmidt norm at most
  `(1 + η_off)·d_u^all·d_u′^all/D*` with `η_off ≤ b^(−6)`; and for one word, under the hypotheses of
  5.21, `‖K(u, u) − 1‖²_HS ≤ e_diag·d_u^all`, so that the series is nonzero on the forms new at the
  level prime. It lacks, besides the carriers of (2), the data of the chain of theta lifts
  (ThetaChainsOnDefiniteUnitaryGroups Layers 2 and 3), algebraic modular forms on the definite
  unitary group `U(X_0)`, the Bessel function of a word (5.13) and the Bessel–Poincaré series
  (5.14).

The tower inequality 5.19 is a statement about a field with `f` real-valued functions, finite
lists of blocks, positive semidefinite kernels on finite sets and vectors of a Hilbert space, all
of which exist in Mathlib; it is the abstract large sieve of the route of 5.20, not a headline,
and it is not stated here. The local statements 5.17b and 5.17c on local data, and the
Gelfand–Graev bound 5.17a for `GL_k` over finite fields, are steps of the same route; they are not
stated either.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.BesselPoincareSeriesAndGramBounds

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.BesselPoincareSeriesAndGramBounds
