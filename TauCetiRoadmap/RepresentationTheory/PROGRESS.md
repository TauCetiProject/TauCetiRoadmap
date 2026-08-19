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

<!--tauceti-progress:v1 {"from_sha":"eb0f4564349742315bf3e1cc2a7b9bf2ae7b96c0","prs":[2175,2265,2324,2336,2411,2452,2460,2461,2480,2504,2512,2518,2524,2532,2546,2550,2553,2559,2560,2562,2563,2566,2568,2569,2570,2579,2584,2587,2594,2595,2597,2599,2601,2602,2604,2606,2607,2608,2622,2625,2626,2628,2631,2635,2636,2637,2640,2646,2650,2654,2657,2666,2670,2673,2677,2685,2701,2711,2718,2722],"roadmap":"RepresentationTheory","to_sha":"671091ae4d4ff844de3ac9f31bb7d8a4610d75ba"}-->
## RepresentationTheory: 2026-08-09 to 2026-08-11 (`eb0f456` to `671091a`)

The Peter-Weyl theorem arrived (TauCeti#2677): for a compact Hausdorff group, the normalized matrix
coefficients of a chosen set of representatives of the finite-dimensional irreducible unitary
representations are a Hilbert basis of `L²(G)`
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis>.
The route is the non-circular one: an approximate identity of mollifying kernels, the eigenspaces of
the resulting self-adjoint convolution operators as finite-dimensional unitary representations, and
from those the uniform density of the representative ring in `C(G, 𝕜)`
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/RepresentativeDensity.html#TauCeti.dense_representativeSubmodule>,
with point separation and having enough finite-dimensional representations as corollaries rather
than inputs.

Two classifications followed. The Specht modules exhaust the simple `ℚ[Sₙ]`-modules and are pairwise
non-isomorphic, so partitions of `n` index the irreducible rational representations of the symmetric
group
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/Completeness.html#TauCeti.partitionEquivSimpleModuleClasses>;
this is stated over `ℚ`, not over an arbitrary field of characteristic zero. On the root-system
side the rigidity half of Cartan-Killing was proved, two root systems with bases of the same Cartan
type being isomorphic
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/Isomorphism.html#TauCeti.nonempty_equiv_of_hasCartanType>,
and the existence half was built type by type as pinned simply connected root data realizing the
Bourbaki Cartan matrices of types A, C, D, E₆ and G₂ (TauCeti#2637)
<https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.html#TauCeti.DynkinType.hasCartanType_typeASimplyConnectedRootDatum>.
Types B, F₄ and E₇ have no datum yet, and E₈ only its root and coroot tables.

Supporting work: uniqueness of the Wedderburn data of a simple Artinian ring, the BGP reflection
functor on quiver representations with its fully faithfulness away from the vertex simple, the
decomposition of a finite-dimensional `sl₂`-module as `⨁ V(nᵢ)`, highest weight vectors for
Killing-semisimple Lie algebras, the certified cyclotomic lift at a Dixon prime, and Bott
periodicity for the real Clifford algebras.

<!--tauceti-progress:v1 {"from_sha":"671091ae4d4ff844de3ac9f31bb7d8a4610d75ba","prs":[1995,2419,2455,2492,2523,2616,2617,2634,2655,2664,2667,2708,2712,2728,2730,2735,2737,2741,2743,2745,2750,2754,2760,2762,2764,2804,2812,2816,2817,2820,2825,2827,2840,2841,2842,2847,2848,2849,2851,2852,2869,2870,2875,2880,2888,2890,2898,2904,2906,2907,2908,2913,2914,2917,2922,2925,2935,2945,2951,2956,2961,2962,2965,2966,2971,2980,2981,2982,2991,2992,2993,2995,2996,3000,3013,3019,3025,3026,3034,3049,3051,3053,3055,3056,3067,3080,3081,3089,3098,3150,3151,3157,3169,3176,3200,3224,3225,3242,3261,3266,3281,3285,3289,3305,3314,3317,3321,3332,3346,3370,3378,3397,3398,3431,3437,3440,3461,3468,3484,3485,3491,3497,3498,3525,3549,3578,3585,3588,3590,3599,3602,3603,3606,3614,3623,3628,3634,3644,3650,3659,3666,3674,3676,3728,3750,3762,3763],"roadmap":"RepresentationTheory","to_sha":"dfa452e279e454d02f2d4f4002047ea1078b8969"}-->
## RepresentationTheory: 2026-08-11 to 2026-08-19 (`671091a` to `dfa452e`)

The [Cartan–Killing classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.html#TauCeti.existsUnique_dynkinType) is now complete: every irreducible reduced crystallographic finite root system has a unique valid Dynkin type. The existence side is concrete as well, with a [pinned simply connected root datum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.html#TauCeti.DynkinType.simplyConnectedRootDatum) for every valid type, including the previously missing types B, F₄, E₇ and E₈.

The [Pin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Pin/DoubleCover.html#CliffordAlgebra.pinDoubleCover) and [Spin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/DoubleCover.html#CliffordAlgebra.spinDoubleCover) actions were assembled as double covers with kernel `ℤ/2`. These statements require a positive-dimensional finite nondegenerate quadratic space over a separably closed field with `2` invertible; over a general field, the image of Spin is instead identified with the [kernel of the spinor norm](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm.html#CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm).

Highest-weight theory now shows that every finite-dimensional irreducible module has a [unique dominant integral highest weight](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/HighestWeight/Existence.html#TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible), and the [Casimir element is central](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.html#TauCeti.casimirElement_mem_center). This is not yet the highest-weight classification: Verma modules and the irreducible quotients `L(λ)` have not landed. Supporting lanes added the [Bruhat decomposition of `GL₂`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Bruhat.html#TauCeti.GL2Borel.card_doubleCosetQuotient_eq_two) and the [Bender–Knuth involutions](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/Young/BenderKnuth.html#SemistandardYoungTableau.benderKnuth).
