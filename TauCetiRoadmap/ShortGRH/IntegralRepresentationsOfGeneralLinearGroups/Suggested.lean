import Mathlib

/-!
# Integral representations of general linear groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins in a few lines, for the reasons below; so nothing is stated here.

The headlines are the results that the summary of `README.md` singles out and that the argument
uses:

* The basis of products of minors of the module of semi-invariants, the same over every
  commutative ring (1.2 (b), (d)), with the Schur matrices (1.3) and the integral, positive
  definite Gram matrix (2.1 (b)).
* The hook number as a denominator between the Weyl lattice and its dual (2.2 (a)–(c)), and the
  bound of the Schur matrices of rectangular matrices by singular values (2.3 (b)).
* The integral invariant pairing of dual weights (3.1 (c)), the Cartan product of mixed weights
  with multiplicative norm (3.2 (b)), and the integral branching matrix from `GL(n + 1)` to
  `GL(n) × GL(1)` with its norm bound and its uniqueness (3.4).
* The characters `Ξ_c` of labels of `GL_r(𝔽_q)`: orthonormal irreducible characters with a lower
  bound for their degree, and their central idempotents (5.3); their Shintani lifting in prime
  degree (5.4).
* For `GL_N` over a non-archimedean local field at pro-`p` Iwahori level: Satake's formula on
  exponents (6.5 (b)), the survival of sorted unramified exponents on spherical vectors (6.7 (a)),
  and the chains of roots of the Hecke polynomial of a spherical vector in a unitary
  representation (6.8).

Why they are not stated here. The objects of Layers 1–3 live in the model of `README.md` §1.1:
the module of polynomials in a matrix of variables that are semi-invariant under upper triangular
matrices, a chosen basis of products of minors, and the Schur and Gram matrices in that basis.
Mathlib has, at the pin, polynomial rings (`MvPolynomial`) and determinants (`Matrix.det`). Tau
Ceti has, at the pin, the Weyl modules of one `GL_n` over a `ℚ`-algebra cut out by Young
symmetrizers (`TauCeti.weylModuleOfShape`), with their characters and their irreducibility, but
no integral form of them over `ℤ` or over a ring, no basis of products of minors and no Gram
matrix; writing the module of semi-invariants, its basis and the Gram matrix out inside a
statement would not be a statement of a few lines. Layers 4 and 5 need the ring of class
functions on all square matrices over a finite field with the parabolic induction product, and
Green's functions in it; Tau Ceti has, at the pin, the characters and virtual characters of finite
groups (`TauCeti.virtualCharacters`) and the characters of `GL_2(𝔽_q)`, but no class functions of
`GL_n(𝔽_q)` with parabolic induction. Layer 6 needs representations of `GL_N` over a local field
with their Hecke operators on the vectors fixed by compact open subgroups, the pro-`p` Iwahori
subgroup and exponents. Mathlib has, at the pin, valued fields and the abstract Hecke coset modules
(`HeckeCosetModule`); Tau Ceti has, at the pin, their convolution product, the Hecke ring of
`SL_n(ℤ)` in the monoid of integral matrices of positive determinant, and the sum over a double
coset on a representation, composed with a map invariant under the left subgroup
(`HeckeCoset.heckeSum`).
Neither has Hecke operators on the fixed vectors of a representation of `GL_N` over a local field,
nor exponents.

Some steps can be written on the carriers that the pins have: the decomposition 6.2 (a) and the
twisted conjugacy 6.3 concern matrices over a field with a valuation, the pro-`p` Iwahori subgroup
being an explicit set of matrices, and the extension criterion 5.1 (c) concerns finite groups and
their characters. They are steps towards the headlines, not headlines, and no signature is given
for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.IntegralRepresentationsOfGeneralLinearGroups

end TauCetiRoadmap.ShortGRH.IntegralRepresentationsOfGeneralLinearGroups
