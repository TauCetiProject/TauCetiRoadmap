import Mathlib

/-!
# Hecke ideals and Taylor–Wiles relations: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about the Galois group `G_{L,S}` of the maximal extension of a number
field unramified outside a finite set of places, with its decomposition and inertia groups at
chosen places, and about continuous representations, determinants or cochains of it with values in
complete local noetherian rings or `ℤ_p`-lattices. Mathlib has the absolute Galois group
`Field.absoluteGaloisGroup` with the maps `Field.absoluteGaloisGroup.map` along field embeddings,
the continuous cohomology `continuousCohomology` of a topological group with coefficients in a
topological representation, and the kernel `ContinuousCohomology.tateShafarevich` of restriction
from an absolute Galois group to the absolute Galois groups of a family of field extensions. Tau
Ceti has the classes of `H¹(G_K, μ_n)` unramified outside a set of primes
(`TauCeti.unramifiedOutsideKummerCohomology`). Neither has `G_{L,S}` as a topological quotient of
the absolute Galois group together with its maps from the local Galois groups. Mathlib's
`continuousCohomology` is defined in every degree; what is missing is the group `G_{L,S}` itself.

* The Hecke ideal (3.13a): for a CM field `L` with `L/L⁺` unramified at every finite place, an odd
  prime `l` and pairwise distinct characters `χ̄_1, …, χ̄_n` of `G_{L,S}` with `⊕χ̄_i` conjugate
  self-dual up to `ε̄^{1−n}`, the functor of ordinary determinants lifting `det ⊕χ̄_i` is
  represented by a complete local noetherian ring `B` over `Λ`, the localized big ordinary Hecke
  algebra `𝕋` carries a unique ordinary determinant, `B → 𝕋` is surjective with kernel `J`,
  `B/J` is finite over `Λ`, `Λ`-torsion-free and reduced, and admissible twists preserve `J`. It
  lacks, besides `G_{L,S}`, the definite unitary group of `L/L⁺` with its spaces of `Λ`-valued
  ordinary algebraic automorphic forms and their Hecke and `U`-operators (Mathlib has the unitary
  group `Matrix.unitaryGroup` of a star ring, not a reductive group over `L⁺` with its adelic
  points), and continuous determinants of a profinite group over a ring with their universal
  deformation ring (Mathlib has polynomial laws, `PolynomialLaw`, and Tau Ceti has multiplicative
  and homogeneous ones, `PolynomialLaw.IsMultiplicative` and `PolynomialLaw.IsHomogeneousOfDegree`,
  of which an `n`-dimensional determinant of a group algebra is a case; neither has continuity of
  such a law on a profinite group or the universal ring of these determinants).
* The patching data (4.2a): if moreover `μ_l ⊄ L`, the ideal `J` has automorphic patching data at
  every Taylor–Wiles level, with the exponent `n!`. It lacks, besides these, Taylor–Wiles data
  (places of norm `≡ 1 mod l^N` whose Frobenius elements converge to given elements of
  `G_{L(μ_{l^∞})}`) and the modules of automorphic forms at Iwahori-type level at those places.
* Adjoint vanishing (9.9): for `n ∈ {2, 3}` and `ρ = r|_{G_F}` attached to a regular algebraic
  cuspidal polarized pair `(Π, χ)` of `GL_n(𝔸_F)` (conjugate self-dual up to twist), `F` imaginary
  CM, with `ρ` absolutely irreducible on every open subgroup, `H¹_f(F⁺, ad r) = 0`; the `GSp₄` and `GL₂` forms over `ℚ`;
  and, for `2 ≤ n ≤ 4`, the vanishing at ordinary points with residual representation a sum of
  pairwise distinct characters under the hypotheses of 9.9 (d). It lacks cuspidal automorphic
  representations of `GL_n` over a number field and their Galois representations, the group
  `𝒢_n` with the adjoint representation of a `𝒢_n`-valued representation, and the Bloch–Kato
  Selmer group `H¹_f`, which needs crystalline or de Rham local conditions on continuous
  cohomology with `p`-adic coefficients (Mathlib has the de Rham period ring of a perfectoid
  ring, but no such local conditions).
* Kernels with lattice coefficients (10.1 (b)): for a number field `F`, a prime `p`, a finite set
  `S` of places containing those above `p` and the infinite ones, and a `ℤ_p`-lattice `T` with
  continuous `G_{F,S}`-action, `Ш²_S(F, T)` is the Pontryagin dual of `Ш¹_S(F, T^D)`, real places
  included. It lacks, besides `G_{F,S}`, the localization maps `H²(G_{F,S}, T) → Ĥ²(F_v, T)` with
  the modified groups at the real places, and the Poitou–Tate pairing. The kernel
  `ContinuousCohomology.tateShafarevich` is taken over the absolute Galois group and imposes no
  ramification set; with lattice coefficients in degree two it is a different group from
  `Ш²_S(F, T)`.

The limit, structure and change-of-sets statements of 10.1 (a), (c)–(f) need the same carriers.
Two steps of the routes are statable in Mathlib: the commutative algebra in the route of 9.9 (d′)
(embedding dimension and going-down for a finite torsion-free extension of a normal domain) and,
in the route of 4.2a, the fact that a polynomial in commuting operators on a space of dimension
`d` which vanishes at every joint eigencharacter has `d`-th power zero. They are steps of routes, not
headlines, and they are not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HeckeIdealsAndTaylorWilesRelations

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HeckeIdealsAndTaylorWilesRelations
