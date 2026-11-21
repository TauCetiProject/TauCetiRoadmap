<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"Nikulin's dyadic relations (1.8.2) and the classification of dyadic pairings in 1G","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"mixed-type dyadic classification (3D), 2-adic symbols (3E), genus symbols (3G), invariant form of 3H; 3I not checked","state":"partial"},{"id":"Layer B","remaining":"genus as a coset of squares (B3), distinct cycles giving distinct classes (B5), norm-one tori and measures (B6, B7), the determinant-23 check of B8","state":"partial"},{"id":"Layer 4","remaining":"the double-coset dictionary (4B) and spinor genera (4C)","state":"partial"},{"id":"Layer 5","remaining":"converse of 5A, existence 5B, the criteria of 5G, 5I, and sufficiency and genus statement of 5J","state":"partial"},{"id":"Layer 6","remaining":"the indefinite classification (6A)","state":"partial"},{"id":"Layer 7","remaining":"the mass of a twist L(a) (7A) and the rank-two good-prime product (7C)","state":"partial"},{"id":"Layer 8","remaining":"1G's generator relations and decompositions","state":"partial"},{"id":"Layer 9","state":"done"}],"readme_sha":"aa12468ce757c80a643e99302b08c3036791442f8301789977888034ec4dd8fa","roadmap":"IntegralLattices","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The native foundation (Layer 0), positive definite reduction (Layer 2) and exhaustion from the mass (Layer 9) are done. Layer 6 lacks only the indefinite case, and the binary dictionary, mass bookkeeping and odd-prime densities are largely in place. The general dyadic theory, the converse direction and existence half of Nikulin's theory, and spinor genera have not landed.

### Named results

- **Unimodular lattices of rank at most nine**: a positive definite unimodular lattice of rank at most nine is [`Iₙ`, `E₈` or `I₁ ⊕ E₈`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine). In particular `E₈` is the only even one in rank eight.
- **The order of `O(E₈)`**: the 240 root reflections [generate the whole isometry group](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.weylGroup_typeE₈RootLattice_eq_top), which has [order 696729600](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.card_isometry_typeE₈RootLattice).
- **The 24 rank-24 lattices are distinct**: the 23 rootful Niemeier lattices and the Leech lattice are [pairwise non-isometric](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Rank24/ReferenceLattices.html#TauCeti.NiemeierType.nonempty_isometry_lattice_iff). The root count and the index of the root sublattice separate them.
- **Forms, ideal classes and the ring class field**: for `Δ < 0`, proper classes of primitive positive definite forms are [the Picard group of the order](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/PicEquivalence.html#TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic), and hence [the Galois group of its ring class field](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/RingClassField.html#TauCeti.BinaryQuadraticForm.posDefProperClassEquivGal). For nonsquare `Δ > 0` they are [the narrow Picard group](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/Narrow/Equivalence.html#TauCeti.BinaryQuadraticForm.properClassEquivNarrowPic).
- **Failure of cancellation**: `E₈ ⊕ E₈` and `D₁₆⁺` are not isometric, but [they become isometric after adding `U`](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Cancellation.html#TauCeti.IntegralLattice.nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice).

### Notable definitions and infrastructure

- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carries the discriminant forms. It has Nikulin's generators and the Gauss-sum invariant, which gives Milgram's theorem.
- The [mass](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Mass.html#TauCeti.IntegralLattice.mass) and the [local density](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.html#Matrix.localDensity) are both genus-level quantities with proved structure. The binary masses `m⁺ = h⁺/w` and `m = h⁺/(2w)` are proved, as is the odd-prime Conway–Sloane dictionary [`m_p·α_p = p^{(n+1)v_p(det)/2}`](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/ConwaySloane.html#TauCeti.conwaySloanePMass_mul_localDensity_toMatrix).
- The [class-number certificate](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LMFDB/StoredClassNumberCertificate.html#TauCeti.IntegralLattice.StoredClassNumberCertificate) turns a known mass into completeness of a stored list of classes. [For `E₈`](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LMFDB/E8.html#TauCeti.IntegralLattice.typeE₈StoredClassNumberCertificate) it assumes nothing.

### Roadmap coverage

- **Layers 0, 2 and 9** are done.
- **Layer 1** is done except 1G. The odd-primary and `2`-elementary forms are classified, and forms with isometric bilinear forms are compared through the Gauss-sum invariant. Nikulin's dyadic relations (1.8.2) in general and the classification of dyadic pairings are not established.
- **Layer 3** has 3A–3C and 3F. It has 3D for unimodular forms and for forms whose constituents are all of type II. The mixed-type dyadic classification, the 2-adic and genus symbols (3E, 3G) and the invariant form of 3H are missing. Code for 3I exists but was not checked clause by clause.
- **Layer B** has B1, B2 and B4, and B3 apart from the genus as a coset of the squares. B5 lacks Gauss's theorem that distinct cycles give distinct classes. B6 and B7 are absent. B8 lacks the `Δ = −23` check and the Conway–Sloane comparison.
- **Layer 4** has 4A, 4E in rank two, 4F and 4G. 4B lacks the double-coset dictionary, and 4C is absent.
- **Layer 5** has 5F, the easy half of 5A, the necessity half of 5J and the gluing description underlying 5G. Uniqueness and surjectivity now belong to `IntegralLatticesPartII`; what remains is the converse of 5A, existence (5B), the criteria of 5G, 5I, and the sufficiency and genus statement of 5J.
- **Layer 6** is done except the indefinite classification (6A).
- **Layer 7** has 7E, 7G, and 7A apart from the mass of a twist `L(a)`. 7C lacks the rank-two good-prime product.
- **Layer 8** under the revised contract lacks only 1G's relations and generator decompositions.

## The frontier

- **Indefinite unimodular classification (6A)**: the odd case needs Hasse–Minkowski together with the native unit-norm splitting. The even case needs the explicit neighbours of the README's supplement.
- **Dyadic classification and Nikulin's relations**: extend the type-II and unimodular classifications to mixed types and build the 2-adic and genus symbols (3D, 3E, 3G). Prove the dyadic relations of 1G. The new `ℤ₂` Gauss sum and cyclic-generator normal form are inputs.
- **Nikulin's existence theory**: prove that signature and `q_L` determine the genus (5A), and then Theorem 1.10.1 (5B) with its four typed conditions. 5G and the sufficiency of 5J follow from it. This needs the dyadic work above.
- **The adelic dictionary and spinor genera**: identify classes in the genus with double cosets over the local stabilizers (4B), then define spinor genera through local spinor norms (4C).
- **Binary tori and genera**: show that a genus is a coset of the squares (B3) and that distinct cycles give distinct classes (B5), then build the norm-one tori and their measures (B6, B7) and the `Δ = −23` check.
