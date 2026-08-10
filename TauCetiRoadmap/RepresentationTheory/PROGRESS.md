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

<!--tauceti-progress:v1 {"from_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0","prs":[1328,1475,1623,1645,1647,1654,1656,1658,1659,1662,1663,1665,1680,1698,1708,1718,1720,1730,1733,1736,1737,1742,1743,1744,1748,1751,1755,1756,1758,1761,1762,1763,1767,1769,1770,1777,1783,1791,1794,1795,1801,1802,1803,1804,1807,1814,1822,1824,1829,1834,1838,1839,1840,1844,1847,1849,1866,1867,1870,1875,1876,1877,1880,1881,1883,1890,1891,1892,1893,1898,1899,1902,1903,1915,1916,1936,1942,1952,1960,1962,1964,1971,1984,1989,1996,2000,2005,2011,2015,2016,2022,2031,2042,2043,2051,2056,2070,2072,2075,2078,2079,2082,2087,2088,2091,2094,2097,2099,2102,2104,2106,2119,2123,2124,2129,2131,2132,2135,2139,2140,2145,2146,2151,2152,2154,2155,2156,2158,2162,2165,2166,2168,2170,2171,2173,2179,2181,2186,2187,2189,2192,2194,2196,2197,2199,2203,2206,2210,2212,2216,2217,2220,2224,2225,2226,2235,2236,2237,2238,2239,2241,2243,2244,2245,2249,2250,2252,2253,2255,2258,2261,2270,2277,2280,2283,2288,2295,2302,2309,2311,2312,2317,2318,2321,2322,2327,2329,2334,2335,2339,2340,2343,2347,2351,2373,2380,2390,2397,2404,2410,2414,2423,2428,2431,2438,2442,2446,2448,2467,2472,2502,2503,2505,2506,2510,2511,2513,2525,2547],"roadmap":"RepresentationTheory","to_sha":"eb0f4564349742315bf3e1cc2a7b9bf2ae7b96c0"}-->
## RepresentationTheory: 2026-08-01 to 2026-08-09 (`6919462` to `eb0f456`)

The character table of a finite group arrived, together with the theorems that make it a table: the
irreducible characters are a basis of the class functions, there are as many of them as conjugacy
classes, both orthogonality relations hold in row and in column form, and the degrees divide the
group order and square-sum to it (TauCeti#2031, TauCeti#2072)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable>.
The arithmetic around it filled in as well. Character values are cyclotomic integers, the Galois
action on them is by power maps, and the Frobenius-Schur indicator was shown to be `1`, `0` or `-1`
according as an irreducible representation is orthogonal, complex or symplectic
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/FrobeniusSchur/Trichotomy.html#TauCeti.Representation.frobeniusSchurIndicator_eq_one_or_eq_zero_or_eq_neg_one>.

The Lie lanes, which had almost nothing in them before, opened at `sl₂`: over an algebraically
closed field of characteristic zero a finite-dimensional irreducible module is `V(n)` for exactly
one natural number `n` (TauCeti#2070)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/Sl2/Classification.html#TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv>,
proved through the Casimir operator, the ladder basis of a weight string and the integrality of the
spectrum of `h`, with complete reducibility for `sl₂` following
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/Sl2/CompleteReducibility.html#TauCeti.exists_isCompl_sl_fin_two>.
Above it, the weights of a Killing-semisimple Lie algebra are integral on the coroots and cut out by
honest eigenspaces. Lie groups acquired an exponential map, the classification of continuous
one-parameter subgroups by their generators, and a local inverse at the identity.

Skolem-Noether
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CentralSimple/SkolemNoether.html#TauCeti.skolemNoether>
and the centralizer theorem finished the central-simple layer, and the Brauer group of a field was
built as a commutative group
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/BrauerGroup/Group.html#TauCeti.BrauerGroup.instCommGroup>.
Root systems gained length-equals-inversions, the longest element
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/LongestElement.html#TauCeti.longestElement>,
a simply transitive Weyl action on the open chambers, and the Cartan-Killing classification in rank
two only. The Clifford degree filtration has the exterior algebra as its associated graded, and
`Pin(Q) → O(Q)` is built, but neither its surjectivity nor its kernel.
