<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16","ts":"2026-11-05T21:11:17Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"the dyadic relations of Nikulin's Proposition 1.8.2 beyond the 2-elementary case (1G)","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"mixed-type dyadic classification (3D), 2-adic symbols (3E), genus symbols (3G), invariant form of the rational comparison (3H)","state":"partial"},{"id":"Layer B","remaining":"genus as a coset of squares (B3), norm-one tori and measures (B6, B7), the determinant-23 check of B8","state":"partial"},{"id":"Layer 4","remaining":"the double-coset dictionary (4B) and spinor genera (4C)","state":"partial"},{"id":"Layer 5","remaining":"converse of 5A, existence, uniqueness, stabilization, O(L) to O(q), embedding uniqueness, sufficiency in 5J","state":"partial"},{"id":"Layer 6","remaining":"indefinite classification (6A) and the Niemeier lattices (6E)","state":"partial"},{"id":"Layer 7","remaining":"rank-two good-prime product and the Conway-Sloane local mass dictionary (7C)","state":"partial"},{"id":"Layer 8","remaining":"the rank-24 row 6E","state":"partial"},{"id":"Layer 9","state":"done"}],"readme_sha":"f156ae9d885e7b803886dbe5349ba8977ef769c6b2861e58d35bc42c7c651fe0","roadmap":"IntegralLattices","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `6b391d7` (2026-11-05T21:11:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The basic dictionary (Layer 0), positive definite reduction (Layer 2) and the LMFDB certificates (Layer 9) are done. The binary dictionary, the class and mass bookkeeping, the low-rank definite classification and the odd-prime local densities are now largely in place. The general dyadic theory, Nikulin's existence and uniqueness theorems, spinor genera and the indefinite unimodular classification have not landed.

### Named results

- **Unimodular lattices of rank at most nine**: a positive definite unimodular lattice of rank at most nine is [`Iₙ`, `E₈` or `I₁ ⊕ E₈`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine). In particular `E₈` is the only even one in rank eight.
- **The order of `O(E₈)`**: the 240 root reflections [generate the whole isometry group](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.weylGroup_typeE₈RootLattice_eq_top), and it has [order 696729600](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.card_isometry_typeE₈RootLattice). This makes the genus of `E₈` the first one whose mass is computed.
- **Forms, ideal classes and the ring class field**: for `Δ < 0`, proper classes of primitive forms are [the Picard group of the order](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/PicEquivalence.html#TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic) and hence [the Galois group of its ring class field](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/RingClassField.html#TauCeti.BinaryQuadraticForm.posDefProperClassEquivGal). For nonsquare `Δ > 0` the same bijection goes to [the narrow Picard group](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/Narrow/Equivalence.html#TauCeti.BinaryQuadraticForm.properClassEquivNarrowPic), through the sign-corrected map.
- **Milgram's theorem**: for an even nondegenerate lattice, the Gauss-sum invariant of `q_L` is `t₊ − t₋ mod 8` (`TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`).
- **Failure of cancellation**: `E₈ ⊕ E₈` and `D₁₆⁺` are not isometric, but [they become isometric after adding `U`](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Cancellation.html#TauCeti.IntegralLattice.nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice).

### Notable definitions and infrastructure

- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carries the discriminant forms. It has Nikulin's generators and the Gauss-sum invariant, and it classifies the odd-primary and `2`-elementary cases. Layer 5 is stated on it.
- The [mass](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Mass.html#TauCeti.IntegralLattice.mass) and the [local density](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.html#Matrix.localDensity) are both genus-level quantities with proved structure: `m⁺ = 2m`, explicit stabilization of the density, and its unramified values. These are the inputs the successor's mass formula consumes.
- The [class-number certificate](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LMFDB/StoredClassNumberCertificate.html#TauCeti.IntegralLattice.StoredClassNumberCertificate) takes the mass as a named hypothesis and turns it into completeness of a stored list of classes. It is instantiated for `E₈`.

### Roadmap coverage

- **Layers 0, 2 and 9** are done.
- **Layer 1** is done except 1G. There, the odd-primary forms and the `2`-elementary forms are classified, but Nikulin's dyadic relations (1.8.2) in general are not.
- **Layer 3** has 3A–3C and 3F, and 3D for unimodular forms and for forms whose constituents are all of type II. The mixed-type dyadic classification, the 2-adic and genus symbols (3E, 3G) and the invariant form of 3H are missing.
- **Layer B** has B1, B2 and B4, and B3 apart from sending the genus to a coset of the squares. B5 has Lagrange reduction, and the source also contains Gauss reduction with its cycles. B6 and B7 are absent. The source has B8's formula `m = h⁺/(2w)`, but not its `Δ = −23` check.
- **Layer 4** has 4A, 4E in rank two, 4F and 4G. 4B has compact open local stabilizers but not the double-coset dictionary, and 4C is absent.
- **Layer 5** has 5F and 5G, the easy half of 5A (the genus determines `q_L` and `b_L`) and the necessity half of 5J. Nothing else in it has landed.
- **Layer 6** has 6B, 6C, 6D, 6F and 6G. It lacks 6A and 6E.
- **Layer 7** has 7A, 7E and the ranks 0 and 1 of 7G. 7C lacks the rank-two good-prime product and the Conway–Sloane `m_p` dictionary.
- **Layer 8** lacks only 6E.

## The frontier

- **Dyadic classification and genus symbols**: extend the type-II and unimodular classifications to mixed types, then build the Conway–Sloane symbols and the genus symbol (3D, 3E, 3G). Several sign-walking moves are already proved.
- **The genus from the discriminant form**: prove that signature and `q_L` determine the genus (5A), and then existence and uniqueness (5B, 5C). This needs the dyadic work above and the dyadic half of 1G.
- **The adelic dictionary and spinor genera**: identify classes in the genus with double cosets over the local stabilizers (4B), then define spinor genera through local spinor norms (4C).
- **Binary tori and genera**: show that a genus of binary forms is a coset of the squares (B3), then build the norm-one tori and their measures (B6, B7) and the `Δ = −23` check of B8.
- **The remaining unimodular classification**: the indefinite case (6A) is absent. The source contains glued constructions of the rootful rank-24 lattices and a Leech lattice, but whether they meet every clause of 6E, including pairwise non-isometry, was not established here.
