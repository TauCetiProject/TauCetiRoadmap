# Progress log: RepresentationTheory

An append-only record of what landed on the RepresentationTheory roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"7435a81bf5df73a46486b3d57f4d1addf432582c","prs":[1227,1228,1229,1232,1233,1234,1235,1236,1237,1239,1240,1245,1246,1247,1248,1249,1250,1252,1254,1255,1263,1264,1265,1266,1269,1270,1273,1274,1276,1293,1327,1336,1352,1353,1354,1360,1380,1386,1391,1393,1394,1397,1401,1403,1407,1409,1412,1415,1416,1418,1419,1421,1424,1426,1428,1431,1435,1437,1440,1455,1458,1460,1472,1473,1476,1480,1481,1483,1494,1496,1499,1510,1513,1525,1528,1532,1547,1548,1557,1564,1568,1588,1596,1598,1614,1625,1637,1638,1641],"roadmap":"RepresentationTheory","to_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0"}-->
## RepresentationTheory: 2026-07-27 to 2026-08-01 (`7435a81` to `6919462`)

The finite-group spine reached its structure theorem: over an algebraically closed field whose
characteristic does not divide the order, `k[G]` is a product of matrix algebras, the blocks are
indexed by the conjugacy classes, and the squares of the matrix sizes sum to `|G|` (TauCeti#1360)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Wedderburn.html#TauCeti.exists_algEquiv_pi_matrix>.
Under it sit the general algebra results it needs: the double centralizer theorem with
Jacobson-Chevalley density (TauCeti#1435), and Wedderburn-Artin for central simple algebras together
with the centrality and simplicity of tensor products (TauCeti#1472, TauCeti#1548, TauCeti#1625).
On the analytic side, Weyl's unitarian trick
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/Unitarizable.html#TauCeti.ContRepresentation.isUnitarizable>
and complete reducibility for unitary representations arrived (TauCeti#1532, TauCeti#1440), and
induction acquired Frobenius reciprocity as a character identity (TauCeti#1476)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Induction/FrobeniusReciprocity.html#TauCeti.frobenius_reciprocity>.

Several other lanes advanced by building vocabulary rather than theorems. Quiver representations
gained the path algebra, vertex simples, the indecomposable projectives and injectives with their
dimension vectors, and the Euler and Tits forms with the vertex reflections preserving them
(TauCeti#1437, TauCeti#1494, TauCeti#1528). The symmetric-group lane built row and column groups,
Young symmetrizers, the key vanishing lemma, and the left ideals they generate, whose character
depends only on the shape of the tableau (TauCeti#1403, TauCeti#1480, TauCeti#1458). Root systems
got inversions and the exchange count, the Coxeter matrix of a base, and the Dynkin types with their
standard Cartan matrices (TauCeti#1263, TauCeti#1483, TauCeti#1431). Projective representation
theory started at the bottom, with factor sets, the extensions they build and are recovered from,
and the twisted group algebra (TauCeti#1588, TauCeti#1637, TauCeti#1596).

Much of the rest is scaffolding, and two named targets landed only in part: hook lengths are defined
and related to transposition, but the hook-length formula is proved only for a single row or column
(TauCeti#1496), and compact-group Schur orthogonality appears only in its cross-representation half
(TauCeti#1568).

<!--tauceti-progress:v1 {"from_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0","prs":[1328,1623,1645,1647,1654,1656,1658,1659,1662,1663,1665,1698,1708,1718,1720,1730,1733,1736,1737,1742,1743,1744,1748,1751,1755,1756,1758,1761,1762,1763,1767,1769,1770,1777,1783,1791,1794,1795,1801,1802,1803,1804,1807,1814,1822,1829,1834,1838,1839,1840,1847,1866,1877],"roadmap":"RepresentationTheory","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd"}-->
## RepresentationTheory: 2026-08-01 to 2026-08-03 (`6919462` to `11ef09d`)

Schur orthogonality is now complete for compact groups. Matrix coefficients of inequivalent
finite-dimensional irreducibles are orthogonal in `L²(G)`
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/SchurOrthogonality.html#TauCeti.ContRepresentation.schur_orthogonality>,
and with the fixed-representation relation in hand both the normalized matrix coefficients and the
irreducible characters form orthonormal systems (TauCeti#1744, TauCeti#1807)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/Orthonormal.html#TauCeti.ContRepresentation.orthonormal_characterLp>.
That is the system Peter-Weyl has to prove complete, and completeness was not attempted. The class
functions of `L^p` arrived as a closed subspace containing every character, and the `SU(2)` engine
acquired its maximal torus and the fact that every element is conjugate into it
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/SU2/TorusConjugacy.html#TauCeti.SU2.exists_conj_mem_torus>;
the symmetric-power irreducibles are still absent.

Skolem-Noether landed (TauCeti#1718)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CentralSimple/SkolemNoether.html#TauCeti.skolemNoether>,
alongside the isomorphism `A ⊗ Aᵐᵒᵖ ≅ Matₙ(K)` that makes the Brauer class of the opposite algebra
inverse to that of `A`; the Brauer group itself is not defined. The Weyl group gained the deletion
condition, a longest element, and the closed dominant chamber as a strict fundamental domain, the
stabilizer of a dominant weight being generated by the reflections in the walls through it
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.html#TauCeti.existsUnique_mem_orbit_inter_dominantChamber>.

The Weyl construction opened: the image of a Young symmetrizer on a tensor power of the standard
representation of `GL n` is a subrepresentation depending only on the shape, nonzero exactly when the
shape has at most `n` rows
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.html#TauCeti.YoungTableau.weylModule>.
Neither its irreducibility nor its highest weight is proved. Elsewhere the associated graded of the
Clifford filtration was identified with the exterior algebra, `Pin(Q) → O(Q)` was built without the
double-cover statement, the Lie-group exponential map was constructed from integral curves of
left-invariant vector fields, and `gl n` got its root-space decomposition and a self-normalizing
Borel subalgebra.
