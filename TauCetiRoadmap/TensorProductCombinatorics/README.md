# Hives, honeycombs, puzzles and type-A tensor products

Build the integral and real combinatorial models of rational GLₙ tensor products,
their piecewise-linear associator and commutor, the saturation and Horn theorems,
and the ordinary Grassmannian puzzle rule. The result includes usable finite
polytope, honeycomb-diagram, puzzle and type-A path interfaces, with explicit
comparisons to existing tableaux, representations, cohomology and Hermitian
spectral data. Suggested homes are `TauCeti/Combinatorics/Hive/`,
`TauCeti/Combinatorics/Puzzle/` and `TauCeti/RepresentationTheory/TypeAPath/`.

The source is Knutson's seven-page **hives** handout and the hive, honeycomb,
puzzle and Grassmannian lectures and homework in the two Lie Groups notebooks.
The notebook assertions enlarge the handout's scope: they include saturation,
all puzzle inequalities, rigid puzzles, overlay/PRV and actual Grassmannian cup
products. Generic highest-weight classification and finite-alphabet Schur
polynomials have existing owners. H0 builds the skew-tableau, Littlewood–Richardson
and stable symmetric-function layer that the hive comparisons consume; the
rest of the roadmap builds the comparisons and the geometry of the new
combinatorial objects.

## Conventions and suppliers

1. Use `TauCeti.DominantWeight n`, the native antitone `Fin n → ℤ` subtype,
   including all determinant twists. Its `shift`, `detShiftShape`,
   `weightOfShape` and shape equivalence supply the partition dictionary.
   Define λ*ᵢ=−λₙ₋₁₋ᵢ. For integral hives, the cyclic boundary triple
   (λ,μ,ν) has sum of all coordinates zero and counts invariants in
   Vλ⊗Vμ⊗Vν. The product coefficient for Vγ is the triple (λ,μ,γ*).
   Rank0 has one normalized empty hive and the empty dominant weight; statements
   using a last coordinate, interior face or regular boundary require positive rank.
2. The triangular lattice is `Δₙ={(x,y,z)∈ℕ³:x+y+z=n}`. Use finite subtypes,
   with A=(n,0,0), B=(0,n,0), C=(0,0,n), normalize h(A)=0 and read cyclic
   edge differences A→B→C→A. Embed (x,y,z) at
   `(z+y/2, √3*y/2)`; A→B→C is **clockwise**. These are respectively
   KTW’s NW, NE and south sides read clockwise. The handout’s counterclockwise
   triple, starting at A, is `(ν*,μ*,λ*)` for this roadmap’s `(λ,μ,ν)`. A unit rhombus has two **obtuse** corners on
   its short diagonal; require their sum ≥ the sum at the acute corners.
   Thus the continuous interpolation affine on unit triangles is **concave**
   in the conventional mathematical sense; −h is convex. All three orientations
   are required. Unnormalized hives differ by an additive constant; adding an
   affine function preserves rhombus slacks and changes boundary weights.
   Keep this gauge action explicit. For forward differences
   `D_v h(p)=h(p+v)-h(p)` and **unit lattice edge directions** v,w, that is
   nonzero `v,w∈{0,±1}³` with coordinate sum 0, satisfying `v·w=1`, a hive
   satisfies `D_v D_w h(p)≤0` whenever p,p+v,p+w,p+v+w lie in Δₙ (these four
   points are a unit rhombus with p+v,p+w its obtuse corners). The restriction
   to unit edges is necessary: on Δ₇ the hive `h(x,y,z)=49−x²` (unit-rhombus
   mixed differences 0 or −2) has, at p=(3,4,0) with the non-unit directions
   v=(2,−3,1), w=(−3,−1,4) of dot product 1, `D_v D_w h(p)=45−24−49+40=12>0`.
   Edge dominance uses a_i−a_(i−1). Prove these corrected
   comparisons with the short-diagonal inequality. At n=2, the rhombus with
   short corners m_AB,m_CA has slack
   `h(m_AB)+h(m_CA)-h(A)-h(m_BC)=-(λ₂+μ₁+ν₂)`; its selected0 positions
   are λ₁,μ₂,ν₁. This pins the chirality and sign dictionary.
3. Scalars are ℤ for counting and ℝ for polyhedra, with ℚ for rational witnesses.
   The ℤ→ℝ map commutes with all inequalities and boundaries. A real hive with
   integral boundary need not itself be integral, and its polytope need not have
   only integral vertices. Saturation asserts existence of an integral witness.
   Real hives form a convex cone; integer hives form an additive monoid, not a
   vector space. Finite fixed-boundary fibres are counted with `Nat.card` only
   after proving `Finite`.
4. Consume SchurWeyl (RepresentationTheory/SchurWeyl) Layer 0 (partitions,
   dominance, standard tableaux) and Layer 7 (finite-alphabet Schur polynomials,
   Jacobi–Trudi, the finite Frobenius characteristic and RSK), together with the
   native Tau Ceti `YoungDiagram` tableau API: `TauCeti.BoundedSSYT`,
   `TauCeti.diagramSchurPoly` and the finite Schur basis, horizontal Pieri
   `TauCeti.hsymm_mul_diagramSchurPoly`, row insertion `TauCeti.rowInsert`,
   `TauCeti.reverseRowInsert`, `TauCeti.rowInsertEquiv`, Bender–Knuth
   involutions and `TauCeti.symmetricHomogeneousSubmodule`. SchurWeyl's
   Layer 7 stops at finitely many variables and its Layer 0 has no evacuation;
   the skew and Littlewood–Richardson tableaux, slides, rectification, dual
   equivalence, the tableau-product bijection, vertical Pieri and the stable
   graded ring Λ_R with its Schur basis and specialization maps are built in H0.
   Consume [ClassicalGroups Layers 3–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md):
   native dominant weights, signed `GTPattern`, `gtPatternEquivSSYT`, rational
   Weyl representations, characters and LR-to-tensor-multiplicity comparison,
   and its weight/branching basis. Consume [LieHighestWeight Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/797f5b74355c8cee4c8a2dfa1bb34bcb5c90ce69/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md)
   for the Weyl character/multiplicity formula and generic Lie-module
   representation ring. Consume the generic native `TauCeti.kostantPartition P b`
   from `TauCeti/LinearAlgebra/RootSystem/KostantPartition/Basic.lean` for a
   `RootPairing` P and its base b; HW3's Lie-theoretic specialization has a
   different carrier and is compared only through an explicit slₙ Cartan bridge.
   H2 builds the type-A Steinberg coefficient-extraction adapter and the rational
   representation Grothendieck ring R(GLₙ) with its character map, using
   CG’s rational category and the generic K₀ supplier in H2.5. There is one GT carrier and one LR carrier throughout.
5. Native `TauCeti.IsConvexPolyhedron` and `IsPiecewiseAffineOn` supply finite
   affine-inequality cells, closedness, convexity, pasting, restriction and
   composition. Use these predicates for the real cells and maps. Consume native
   Gordan/Stiemke/Tucker from `Geometry/Convex/Cone/Alternative.lean` and
   Mathlib `ProperCone.hyperplane_separation'` and finite-dimensional linear
   algebra. H1 builds the **finite rational elimination, exact dual certificate,
   face and lattice adapters** that these declarations alone do not provide.
6. For finite Grassmannians consume the complex rank-k Grassmannian, topology,
   charts and tautological bundle of [TopologicalKTheory T1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f2c908debdefa440e7dfda339a54cb3b74cdc51c/TauCetiRoadmap/TopologicalKTheory/README.md),
   reusing `Submodule ℂ (Fin N → ℂ)` underneath. Pin quotient rank N−k
   and consume T1.5's sole finite-subspace/native-Grassmannian comparison.
   Construct the quotient bundle Q in H6 on that same carrier. Native
   `Module.Grassmannian ℂ (Fin N → ℂ) (N-k)` parametrizes quotient rank N−k;
   consume [ModularCurves 0G](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ba158a94935fcdc3e26804b3ee77ece7fb48d6c1/TauCetiRoadmap/ModularCurves/README.md)
   for the algebraic subspace/quotient and universal-bundle comparisons over Spec ℂ;
   H6 owns their comparison with the topological complex-point bundles.
   The open [Mathlib Grassmannian scheme design #14686](https://github.com/leanprover-community/mathlib4/pull/14686)
   uses quotient rank r and complementary rank c with r+c=N and affine chart
   gluing. Also consume the actual Tau Ceti `Module.Grassmannian.chart`,
   `chartEquiv`, `chartHomEquiv`, chart-locus openness/cover, `glueData`,
   `scheme` and `toSpec` (Tau Ceti `4f1bd4f`, beyond the `a91d3aaf` Lake pin)
   from `RingTheory/Grassmannian/Chart/*` and
   `AlgebraicGeometry/Grassmannian/Basic`: these use the native quotient-rank
   carrier and represent chart families by symmetric-algebra quotients. Compare
   their finite-free charts with the design above; the complex
   manifold/ring targets here do not require a second scheme representability
   development. Adopt the resulting Mathlib design and implement missing adapters
   here without waiting for publication.
7. Consume [LieGroups Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/85f49c01009d5df11d3a6e8935fe7b14ed21c1cd/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md)
   for flags, full-flag Bruhat cells and Borel–Weil, and [ReductiveGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/90b03f934ee3db6fc1a079daa0fd7b2f40fa40d8/TauCetiRoadmap/ReductiveGroups/README.md)
   for rational actions, parabolics and characteristic-zero linear reductivity.
   H6 owns the **finite Grassmannian** cell/closure, geometric class and integral
   ring comparisons beyond those full-flag statements. Consume
   [AlgebraicTopology Stages 2–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/50af6084a401dffe3db1e50dac46fe4bca36f4fd/TauCetiRoadmap/AlgebraicTopology/README.md) for cellular/
   singular/relative cohomology, cup, Künneth, orientations and duality,
   [CharacteristicClasses C2–C3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/01224fe30cf811f9e6d239b75f4003bb8c0b685a/TauCetiRoadmap/CharacteristicClasses/README.md) for Thom,
   Gysin, Leray–Hirsch and integral Chern classes, and
   [ComplexKahlerGeometry K7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) for projective
   embeddings and their Kähler structures. H6 supplies each map connecting these
   theories on the common Grassmannian carrier. Consume
   [DifferentialGeometry 10.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/DifferentialGeometry/README.md) for manifold
   Sard. H6.3 constructs the homogeneous parameter-transversality theorem
   needed by the incidence argument; it is not presumed to be a DG10.2 result.
8. Consume Mathlib finite-dimensional `LinearMap.IsSymmetric.eigenvalues`, its
   antitone order, multiplicity and eigenvector-basis APIs, matrix conjugate
   transpose and the unitary group. No infinite-dimensional spectral theorem is
   needed for Horn. Consume [PolarDecomposition PD-A50–A53](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md)
   for finite matrix min–max/monotonicity/Weyl perturbation. [HamiltonianReduction R2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93ad76c0f2a89760726126e98fcdb41cee38fe93/TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md)
   supplies compact coadjoint orbits/KKS; its R1 supplies moment-map products.
   [ConvexityToric T3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93ad76c0f2a89760726126e98fcdb41cee38fe93/TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md) supplies the
   compact chamber/quotient dictionary. H7 owns the projective **invariant-to-
   moment-zero bridge**, plus the Schubert-incidence compression inequality
   proving the real converse and rational-hive approximation. Neither a bare
   moment map nor the word 'GIT' supplies this bridge.
9. Consume [SchubertGeometry S4.1–5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e89539810e9a2821960d01212df5ebf319e0d209/TauCetiRoadmap/SchubertGeometry/README.md)'s single
   generic finite-root-data path/crystal construction. H8 owns its actual
   **type-A** coordinate, tableau/GT, row/column and tensor/hive applications,
   including all the concrete algorithms and examples below. Specialize to
   X=ℤⁿ with α_i=e_i−e_(i+1), its coroot heights and its central determinant
   direction; compare the actual SLₙ restriction lattice as well. Use type
   A_(n−1) only for n≥2; n=0 and the rank1 torus have no simple-root operators.
   SchubertGeometry S9.5 owns the generic-to-concrete comparison maps;
   H8 consumes those SAME maps and owns the concrete tableau/GT, reading-word
   and hive comparisons on its existing carriers, not a second generic engine.
   Its comparisons include the straight dominant path, the row-coordinate
   dominant path of S2p91, Japanese column words and fundamental-column paths.
   Generic S4.1–5 has no tableau, hive, recurrence or Schubert-section premise;
   this application adds no return dependency into that generic construction.
   SchubertGeometry S4.6–7/S5–8's geometric sections, splitting and SMT, and
   S9.1–4's analytic comparisons, are not prerequisites for these path-only maps.
   Quantum-group/crystal-basis and Kac–Moody extensions are not inferred from
   this finite-type specialization.

`Suggested.lean` pins representative carriers and target forms. It is not an
exhaustive checklist; this markdown is definitive.

The construction order is H0, H1, H2.1–4, H3.1–2, H2.5, H4, H5, H6.1–7,
H6.8’s stretching theorem, H7 and H8. The component/
path comparison of H8 precedes H9’s coherence comparison; the elementary
excavation and ring associativity are independent of it. For H8's path lane,
construct generic SchubertGeometry S4.1–5 first and H8's concrete coordinate
and tableau objects, then S9.5's generic-to-concrete maps on those objects,
then the tensor/hive and H9 comparisons. The independent
H1–H7 constructions do not gain a Schubert splitting or SMT premise.

H1.3's finite rational polyhedral/lattice adapters precede the independent
H1.5 counting lane. H1.5 consumes only the early semigroup/lattice comparisons
of [GroebnerGeometry G2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d21bc1c2f895047275495326f5f693e89f0e244c/TauCetiRoadmap/GroebnerGeometry/README.md#g2-semigroup-presentations-normalization-and-degree)
and the stated native floors, not H2.3 or later hive
representation comparisons. H2.6 then composes H1.5 with H2.3's already-defined
native count/RootPairing and GT object maps. H2.3 itself does not require the
chamber-polynomial theorem, and the HW3 specialization is a comparison rather
than a proof premise for the generic matrix theorem.

## H0. Skew tableaux, Littlewood–Richardson tableaux and the stable ring

Throughout, a diagram is a native `YoungDiagram`, entries are zero-indexed
letters, and a tableau has weakly increasing rows and strictly increasing
columns. This section supplies the one LR carrier used by H2, H6, H8 and H9.

1. **Skew tableaux.** For diagrams `inner≤outer` let the skew cells be
   `outer.cells \ inner.cells`. Define semistandard skew tableaux of shape
   outer/inner (entries off the skew cells normalized to 0), their bounded
   versions with entries `<d`, content in `ℕ →₀ ℕ` counted as native
   `SemistandardYoungTableau.content` counts it, and standard skew tableaux.
   Prove finiteness of the bounded type, entry extensionality, and the inverse
   conversions between straight skew tableaux (inner = ⊥) and native
   `TauCeti.BoundedSSYT d outer`, preserving entries and content. Define the
   skew Schur polynomial in d variables over a commutative semiring as the
   tableau sum, and prove it equals `TauCeti.diagramSchurPoly` for straight
   shapes. Checks: for inner=outer the only tableau is empty and the skew
   Schur polynomial is 1; the shape (2,1)/(1) with d=2 has two unrelated boxes
   (neither in the row nor the column of the other) and four tableaux, so
   `s_(2,1)/(1)=(x₀+x₁)²=s_(2)+s_(1,1)`, whereas a definition that compares the
   two boxes as if the inner cell were present gives three; for d=0 every
   nonempty skew shape has no tableau.
2. **Slides and rectification.** An inward slide into an inner corner moves
   the smaller of the entries to the right and below into the hole, the one
   below when they are equal; the reverse slide moves the larger of the
   entries to the left and above, the one above when they are equal. Prove that
   slides preserve semistandardness and content, that inward and reverse
   slides are mutually inverse, and that repeated inward slides terminate in a
   straight tableau (the rectification). Define the Knuth row word (rows from
   bottom to top, each left to right) and the two elementary Knuth relations
   `xzy≡zxy` for `x≤y<z` and `yxz≡yzx` for `x<y≤z`. Prove that slides
   preserve the Knuth class, that two words are Knuth equivalent iff their
   insertion tableaux under `TauCeti.rowInsert` agree, and hence that the
   rectification is independent of the order of slides (Fulton, *Young
   Tableaux*, §§1–3). Prove that for skew tableaux of a fixed shape
   outer/inner, the number rectifying to a given straight tableau of shape κ
   depends only on κ, not on the tableau (Fulton, *Young Tableaux*, §5.1);
   Haiman's dual equivalence of skew tableaux is one route. Checks: on the
   shape (2,1)/(1), entry 1 in the top box and 0 in the bottom box rectifies to
   the row `0 1` of shape (2), while 0 on top and 1 below rectifies to the
   column of shape (1,1), matching the insertion tableaux of the Knuth words
   `01` and `10`; the words `021` and `201` are Knuth equivalent
   and both insert to rows `01 / 2`, while `012` and `210` are not; on a
   straight tableau every slide sequence is empty and rectification is the
   identity.
3. **LR tableaux and the LR rule.** The LR word of a skew tableau reads the
   rows from top to bottom, each right to left. Define `LRTableau inner outer
   ν` as the skew tableaux of shape outer/inner with content `ν.rowLen`
   whose LR word satisfies the zero-indexed ballot condition: every prefix
   has at least as many letters k as letters k+1. Prove finiteness and set
   `c^κ_(μ,ν)=Nat.card (LRTableau μ κ ν)`. Construct the tableau-product
   bijection: pairs of straight bounded tableaux of shapes μ and ν correspond
   to pairs consisting of a straight bounded tableau of shape κ and an
   element of `LRTableau μ κ ν`, summed over κ with |κ|=|μ|+|ν|, with weights
   adding; build it from insertion, rectification and dual equivalence, and
   identify the Yamanouchi rectification fibres with ballot tableaux (Fulton,
   *Young Tableaux*, §5.1–5.3). Sum weights to prove
   `s_μ s_ν=Σ_κ c^κ_(μ,ν) s_κ` in every finite alphabet over every commutative
   semiring, including shapes with more than d rows, whose Schur polynomials
   vanish. Prove `c^κ_(μ,ν)=0` unless `μ≤κ` and |κ|=|μ|+|ν|, and the symmetry
   `c^κ_(μ,ν)=c^κ_(ν,μ)`. Specialize to strips: for ν=(r) the LR tableaux are
   horizontal strips (agreeing with `TauCeti.hsymm_mul_diagramSchurPoly`); for
   ν=(1^r) the ballot condition forces the LR word to read 0,1,…,r−1, so
   the weak row condition allows at most one new box per row and LR tableaux are
   vertical strips, proving vertical Pieri `e_r s_μ=Σ s_κ` over vertical strips
   κ/μ of size r, including r=0. Checks: `c^(2)_((1),(1))=c^(1,1)_((1),(1))=1`,
   so `s_(1)²=s_(2)+s_(1,1)` with the (1,1) term
   vanishing for d=1; `c^(3,2,1)_((2,1),(2,1))=2`, which a count without the
   ballot condition (giving three) or one requiring the reading word to be
   increasing (giving one) gets wrong: the three boxes of (3,2,1)/(2,1) are
   pairwise unrelated, the three fillings with content (2,1) have LR words
   001, 010, 100, and the ballot condition rejects 100; for ν=∅ the only LR tableau is the
   empty one on κ=μ.
4. **Evacuation.** Define Schützenberger evacuation on standard tableaux of a
   straight shape (remove the entry 0, rectify, record the vacated cell with
   the largest remaining label) and prove it is an involution preserving
   shape and that it corresponds under RSK to reversing and complementing the
   word (Fulton, *Young Tableaux*, Appendix A). H8.2 extends it to the
   semistandard Schützenberger involution. Checks: on the shape (2,1)
   evacuation exchanges the two standard tableaux `01/2` and `02/1`; on (2,2)
   it fixes both standard tableaux `01/23` and `02/13`; on the row (n) it is
   the identity, whereas the complement map i↦n−1−i sends `01/2` to `21/0`,
   which is not a tableau.
5. **The stable ring.** For a commutative ring R and n∈ℕ let Λ_R^n be the
   R-module of compatible families `(f_d)_(d∈ℕ)` with
   `f_d∈TauCeti.symmetricHomogeneousSubmodule (Fin d) R n` and
   `f_d=aeval (Fin.snoc X 0) f_(d+1)` (setting the last variable to 0).
   Let `Λ_R=⊕_n Λ_R^n`. Build its graded commutative R-algebra structure from
   degreewise finite-alphabet multiplication and the R-algebra specialization
   maps `Λ_R→MvPolynomial (Fin d) R`. Prove that projection Λ_R^n→
   degree-n symmetric polynomials in d variables is an isomorphism for d≥n,
   construct the Schur basis `s_λ` (λ ⊢ n) of each Λ_R^n from the finite
   Schur bases, and prove the LR rule of item 3 in Λ_R with coefficients
   `c^κ_(μ,ν)` and the stable elementary and complete families. Checks:
   Λ_R^0≅R and Λ_R^1 is free of rank 1 on s_(1); Λ_ℤ^4 has rank 5 = p(4),
   whereas degree-4 symmetric polynomials in 2 variables have rank 3, so a
   definition using a fixed small alphabet is wrong; specialization to d=1
   sends s_(1,1) to 0 and s_(2) to x₀².

### Examples

Item 3's `s_(1)²=s_(2)+s_(1,1)` and `c^(3,2,1)_((2,1),(2,1))=2` are the
reference values for H2.2's hive count of the triples `((1),(1),(2)*)` and
`((2,1),(2,1),(3,2,1)*)` in rank 3.

### Dependencies

SchurWeyl Layers 0 and 7; Tau Ceti `YoungDiagram`, `SemistandardYoungTableau`,
`TauCeti.BoundedSSYT`, `TauCeti.diagramSchurPoly`, `TauCeti.rowInsert`,
`TauCeti.rowInsertEquiv`, `TauCeti.hsymm_mul_diagramSchurPoly` and
`TauCeti.symmetricHomogeneousSubmodule`. No hive, honeycomb or puzzle object
is used.

## H1. Lattices, rhombi, boundaries and finite polytope operations

1. Give finite lattice and unit-triangle/edge/rhombus index types, coordinate
   extensionality, all three rotations and reflection. State short/long diagonals
   arithmetically in barycentric coordinates; prove the Euclidean model agrees.
   Build real and integral normalized hives, unnormalized/gauge comparisons,
   pointwise addition and nonnegative scaling, zero/affine hives, restriction to
   lattice subtriangles and the extension/interpolation map. Prove interpolation
   is concave iff all rhombus inequalities hold, by the adjacent-triangle bending
   test and line-segment subdivision. Boundary differences are antitone, cyclic
   trace is zero, and the boundary restriction is an actual linear map before
   restricting to the hive cone. Export rotation/dualization effects with the
   new dual-weight involution on the native carrier, and entry/boundary equality lemmas.
2. Build equality/inequality matrix presentations over ℤ, ℚ and ℝ on the finite
   coordinate spaces. Prove normalized fixed-boundary fibres are closed bounded
   convex polyhedra, hence compact; prove explicit entry bounds by summing
   rhombi along lattice parallelograms. The same estimates uniformly bound fibres
   over a bounded boundary set, giving properness of the boundary projection
   onto its image. Prove normalized zero-boundary fibre={0}. For integral fibres
   export a finite instance, a bounding-box enumeration and decidable membership.
   Prove central-degree conservation, the dominance bound γ≤λ+μ in product
   convention and lower-coordinate bound γₙ≥λₙ+μₙ. These bounds prove **finite
   output support** for fixed λ,μ, independently of the representation theorem.
3. Build reusable finite rational polyhedron adapters: Fourier–Motzkin projection
   with equality elimination, rational feasible witnesses for nonempty rational
   fibres, clearing denominators, finite generation of rational cones including
   lineality, faces/facets relative to their affine span, relative interiors and
   finite supporting-halfspace descriptions. Consume the native alternative and
   separation results; prove the finite matrix Farkas certificate with both
   nonnegative inequality multipliers and unrestricted equality multipliers.
   A valid boundary functional is a nonnegative sum of rhombus slacks **modulo
   normalization and trace equalities**. Prove exactness of projected cones;
   a closed-cone map defined using closure is insufficient by itself.
4. For a rational polyhedron P and a linear projection with compact fibres,
   build the largest-lift selection for a linear objective generic on the finite
   fibre-edge directions. Prove existence/uniqueness, finite polyhedral chamber
   decomposition, continuous piecewise-affine selection, coefficient extraction
   from active systems, homogeneity for cones and compatibility on chamber
   walls. Build the integer-coefficient piece comparison used by H4; a rational
   linear selection alone does not prove saturation. Prove a generic objective
   exists in any nonempty open cone of admissible objectives by avoiding finitely
   many hyperplanes. Export rational perturbations and dense relative interiors.

5. Build **pointed unimodular vector-partition counting** on the same finite
   integer matrix/lattice carriers. Let A:ℤ^m→ℤ^r have full row rank, with
   ker(A_ℝ)∩ℝ^m_≥0={0}, and require every nonzero r×r column minor to be ±1
   in the specified target lattice ℤ^r. Construct an integer functional h with
   h(A_j)>0 for every column, using the native strict alternative and rational
   denominator clearing. For b∈ℤ^r define the actual fibre
   F_A(b)={c∈ℕ^m:A c=b}, prove it finite before counting, and identify it with
   the lattice points of P_A(b)={x∈ℝ^m:x≥0,A x=b}. Give explicit coordinate
   bounds from h(b), a finite enumeration and decidable membership. P_A(b) is
   a compact native `TauCeti.IsConvexPolyhedron`; its support is the rational
   column cone C_A. Prove count0=1, count=0 off C_A, and positivity on
   C_A∩ℤ^r using integral basic feasible solutions. The full-minor hypothesis
   is relative to the chosen lattice, not merely real linear independence.
   Consume Mathlib `Matrix.IsTotallyUnimodular` and its submatrix API for the
   stronger all-minor condition, and prove it implies this hypothesis.
   Reuse [GroebnerGeometry G2](../GroebnerGeometry/README.md#g2-semigroup-presentations-normalization-and-degree)'s exponent monoid, generated lattice
   and cone/saturation/Gordan comparisons for the semigroup/lattice adapters.
   Count PREIMAGES of the exponent map here, not distinct semigroup elements:
   G2's graded semigroup Hilbert/Ehrhart count does not replace this fibre count.
   Its normalization, Proj and leading-volume theory remain with that owner.

   Construct all invertible column bases B and their cones cone(A_B). Use
   H1.3 to build their common polyhedral refinement on C_A. An explicit finite
   model is the arrangement of all coordinates of A_B⁻¹b: intersect C_A with
   all closed sign halfspaces, retain the full-dimensional cells and their
   faces, and prove this refines every basis cone and covers C_A. Empty cells
   are discarded; duplicate presentations are compared extensionally. For
   each closed full-dimensional chamber D construct an actual
   p_D∈ℚ[b₁,…,b_r] of total degree at most m−r, and prove
   |F_A(b)|=p_D(b) for EVERY b∈D∩ℤ^r, including support faces and internal
   walls. Export coefficient/evaluation, change of row lattice basis and
   column permutation APIs, uniqueness of the full-dimensional constituent,
   and independence of the positive height witness or a refining chamber
   presentation. On an intersection of two such chambers prove equality of
   the restricted polynomials as real polynomial functions. Outside C_A the
   count is separately zero; no gluing with that exterior value at a support
   facet or the origin is asserted. Relative open face strata inherit the
   common restriction; intersections and lower-dimensional parameter slices
   retain their actual affine lattice rather than counting all ambient points.

   Own the enumeration proof, not only an interpolation oracle: construct
   multivariate lattice generating functions for pointed rational cones,
   finite fundamental-parallelepiped enumeration and unimodular cone series;
   prove the polytope tangent-cone valuation and its rational-function
   specialization. For a generic chamber the vertices are the feasible basic
   solutions, integral by A_B⁻¹, and their tangent lattices have the explicit
   basis e_j−Σ_i(A_B⁻¹A_j)_i e_(B_i). Prove the resulting finite rational
   expression counts the fibre. Choose an auxiliary covector nonzero on its
   finitely many edge directions, substitute monomial exponentials and take
   the constant Laurent coefficient; construct the truncated rational Todd
   factors and prove pole cancellation and the degree bound m−r. Include the
   non-simple/degenerate tangent-cone valuation and specialization to CLOSED
   chamber walls, with no double counting of coincident vertices. Establish
   the boundary specialization identities before using them to extend an
   interior formula; evaluation at a perturbed right-hand side is not itself
   a lattice-point bijection. These cone/valuation/specialization lemmas are
   construction targets here, using H1.3's finite polyhedral and lattice API,
   without a toric Riemann–Roch, Schubert or hive-saturation premise. Export
   exact finite algorithms for chamber certificates and rational coefficients.
   The empty r=m=0 system has one point and constant polynomial1. Positive
   height excludes nonempty zero-column systems at r=0. Repeated nonzero
   columns are allowed. Without unimodularity, [2] has the parity count on
   the positive ray; do not replace the theorem by an unconditional ordinary
   polynomial statement for every integer matrix.

## H1.6. Rational cone series, Fourier boundary values and lattice endpoints

Use H1.3 and H1.5's actual finite lattice, integer matrix, solution fibre,
cone valuation and rational generating-function constructions. This phase
builds their Fourier and boundary-value comparisons. H2.6 supplies the
type-A root-coordinate specialization afterwards. It has no hive, Schubert,
symplectic reduction or index-theorem premise. Consume CompactGroups'
normalized torus Haar/character conventions, Mathlib's `UnitAddTorus`,
`UnitAddTorus.mFourier`, `mFourierCoeff`, `mFourierBasis`,
`TemperedDistribution` and its Fourier equivalence. The generic smooth-test
and distribution carriers, density duality and localization belong to
[ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality).
Consume the smooth periodic Fourier expansion and rapid derivative-seminorm
decay explicitly commissioned by
[PseudodifferentialOperators P3](../PseudodifferentialOperators/README.md#p3-oscillatory-kernels-and-local-quantization).
Here build the finite-lattice/cone comparisons on those carriers, not a
second distribution, Haar or smooth-section foundation. The relevant early
K5a/P3 Fourier subphases precede this phase independently of PDO spectral,
microlocal and index-theorem applications.

**1. Categories and chosen expansions.** Put L=ℤ^r, V=L⊗ℝ with specified
lattice basis and covolume-one Lebesgue measure, and T=Hom(L,ℝ/ℤ), represented
by native `UnitAddTorus (Fin r)`. Write z^a(θ)=exp(2πi⟨a,θ⟩).
Build the evaluation of ℂ[L] in continuous torus functions and identify
its coefficient map with native `mFourierCoeff`. Keep this finite group
algebra, its fraction field/localization, functions L→ℂ with coefficientwise
addition, and distributions on T as different objects. All lattice-basis
changes have explicit dual torus maps, Haar preservation and Fourier
coefficient equations.

For a finite list X=(a_j) of nonzero lattice vectors, choose a real linear
functional h nonzero on every a_j. Let B={j:h(a_j)<0}, replace a_j by
a_j^h=sign(h(a_j))a_j, and set s_h=−Σ_(j∈B)a_j. Prove the polarized
coefficient function is

`P_X^h(b)=(-1)^|B| · # {c∈ℕ^m : Σ c_j a_j^h=b−s_h}`.

The positive height gives finiteness and a polynomial growth bound; construct
an integral positive height on the same rational open chamber when needed
for H1.5's enumeration. Prove invariance under h within a chamber, list
permutation, lattice change, monomial translation, direct sum and repeated
vectors. Its expansion represents ∏(1−z^a_j)⁻¹ in the localization. Each
flipped factor is `−Σ_(n≥1) z^(−n a_j)`, not a closed negative ray starting
at n=0. Construct the ring of series supported in a translate of a finitely
generated h-positive lattice cone, prove coefficientwise convolution finite
and its unit/geometric inverse laws, and construct the localization map into
this ring. Use a single h and a common finite denominator list for rational
identities. General bilateral coefficient functions form only the natural
Laurent-polynomial module here; their unrestricted convolution is not a
ring operation. H1.5's rational cone valuation is not re-proved or identified
with an injective map on all bilateral series.

**2. Fourier and Abel boundary comparison.** For any polynomial-growth
coefficient function c on L construct the torus distribution with pairing
`⟨Θ(c),φ⟩=Σ_b c(b) φ̂(−b)` using P3's rapid decay, with all continuity
seminorm estimates and uniqueness. Compare it to the periodic distribution
on V obtained as the inverse native Fourier transform of the tempered
weighted lattice distribution Σ_b c(b)δ_b. Prove this last sum in Schwartz
duality, periodization of tests, torus descent/pullback and equality of the
two constructions, including the sign and 2π conversion. No new topology is
silently placed on native `TemperedDistribution`, whose topology is pointwise
on Schwartz tests; state separately convergence in the compact-manifold test
dual supplied by K5a.

For c=P_X^h, prove absolute locally uniform convergence after multiplying
coefficient b by exp(−εh(b)), ε>0, and identify the sum with the actual
rational function at `z^a=exp(2πi⟨a,θ⟩−εh(a))`. Its ε↓0 limit is Θ(c)
in test duality. Prove the result for finite monomial translates and finite
linear combinations, with uniform polynomial bounds permitting the limit.
Away from the subtori z^a_j=1 the limit is the ordinary smooth rational
function. This supplies boundary values, not a globally integrable rational
function or a definition by pointwise restriction at its poles.

Prove Laurent-polynomial multiplication corresponds to coefficient shifts
and finite differences. Denominator-clearing alone does not determine a
distributional solution: multiplication by 1−z^a has a kernel. For two h
chambers prove their boundary values agree off the polar subtori, give the
exact single-factor wall-crossing delta-comb formula and its finite-list
coefficient/convolution version on the common pointed supports, then obtain
general wall crossing by a generic path crossing one hyperplane at a time.
When factors are dependent, prove all support/properness conditions before
using convolution or multiplication; do not multiply arbitrary distributions
or treat a product of singular boundary values as automatically defined.
If a rational expression is a Laurent polynomial, its common-h expansion
is that finite coefficient function and its boundary distribution is the
ordinary torus polynomial for every regular h. Prove this by the chosen
series localization map before applying Fourier uniqueness, not by canceling
a denominator in the distribution space.

**3. Continuous versus discrete cones.** For a positive-height spanning list
X, define the actual pushforwards of Lebesgue measure on [0,1]^m and ℝ_≥0^m
under (t_j)↦Σ t_j a_j: the compact box measure B_X and the locally finite
cone measure T_X. Prove tempered growth, support, pushforward/test-pairing
formulas, convolution, deletion/directional derivative and difference laws,
and their transforms. Use the native negative-2π Fourier phase:

`F(B_X)(ξ)=∏_j (1−exp(−2πi⟨a_j,ξ⟩))/(2πi⟨a_j,ξ⟩)`,

with the removable value 1 for each zero pairing. Prove the Laplace/Abel
regularization for T_X with factors `(εh(a_j)+2πi⟨a_j,ξ⟩)⁻¹`.
Tiling the orthant by half-open cubes gives the actual distribution identity
`T_X=Σ_b P_X(b)·translate_b B_X`; prove local finiteness on compact supports
and the Schwartz estimates, not an unjustified exchange of infinite sums.
For an arbitrary nonzero list with regular h, define its polarized continuous
cone distribution as `T_X^h=(−1)^|B| T_(X^h)` with NO lattice offset, and prove
`B_X *_d P_X^h=T_X^h`. Indeed the negative interval factors translate B_(X^h)
by Σ_B a_j while the discrete polarization translates its count by the
opposite vector; construct these translation maps and cancellation explicitly.
Thus the discrete endpoint shift and continuous orientation sign have distinct
roles even for mixed root directions in a fixed-point Weyl term.
Construct densities on the span, piecewise polynomial formulae on the
admissible hyperplane arrangement and the lattice-normalized fibre-volume
comparison. Rank-deficient lists are treated in their actual saturated span
and pushed forward, rather than assigned an ambient density; the empty list
has δ_0 and count δ_0. Zero columns are excluded from infinite-ray counting.

**4. Endpoint reconstruction.** Build the finite admissible central hyperplane
arrangement and its locally finite affine lattice-translate arrangement. Prove
local finiteness from the rational hyperplane directions and the specified
lattice, and give finite enumeration and restriction on each bounded region.
Construct the global alcoves, polynomial pieces and directional lattice
restriction, with compatible bounded-stage presentations preserving the global
translation and refinement laws for every lattice translate: choose an alcove c
with 0 in its closure inside the zonotope,
and evaluate the polynomial on b+c at b. Keep piecewise differentiation
separate from distributional differentiation; for B_[1], the latter is
δ_0−δ_1 while the former is zero. Supply well-definedness, translation and
refinement laws and independence whenever the differentiated function is
continuous. The infinite formal Todd symbol acts on each finite-degree
polynomial through its finite jet, not as an unproved convergent differential
operator on all distributions.

For spanning unimodular X in its specified lattice prove

`c-limit (Todd(X)_pw (B_X *_d K))=K`

for every coefficient function K:L→ℂ; here
`Todd(X)=∏ ∂_a/(1−exp(−∂_a))`, the convolution is locally finite because
B_X is compact, and c has the stated zonotope condition. Build the requisite
finite polynomial/difference solution spaces, cocircuit equations,
interpolation on translated zonotope lattice sets and their deletion/
contraction or equivalent constructive proof before this inversion. Combine
with the cone identity for the exact directional evaluation of P_X, including
support facets and the origin. For shifted Todd exp(−∂_z)Todd retain the
compatible translated alcove/lattice window; prove its domain rather than
allowing arbitrary boundary z and any closed support chamber. A polynomial
piece evaluated at b is not evaluation at a perturbed lattice point.

For general spanning positive-height integer lists build the finite toric
vertex set `{g∈T : X^g={a∈X:g^a=1} spans V}` and prove its finiteness
using full-rank column determinants. Construct the finite-dimensional
difference/differential spaces and the character-twisted finite-jet inverses
of `1−g^(−a)exp(−∂_a)` when g^a≠1. Prove the reconstruction

`P_X(b)=Σ_g g^b · c-limit [Todd(X^g)_pw · ∏_(a∉X^g)
 (1−g^(−a)exp(−∂_a))⁻¹_pw T_(X^g)](b)`

with c a small alcove inside Cone(X) adjoining 0, all operators defined on
the actual polynomial pieces. Give the finite coefficient algorithm and
quasipolynomial constituent/period comparison. The unimodular case has only
g=1. This does not replace H1.5's already-owned chamber-counting theorem;
prove agreement with its actual coefficient polynomials and face restrictions.
In particular [2] has a parity count and a nontrivial toric contribution;
dropping it does not give an ordinary polynomial formula.

**5. Terminal Weyl and boundary examples.** Parts1–4 above precede this
application part and have no character-theoretic premise. H2.6 transports the above construction
through its actual type-A positive-root matrix and native Kostant partition
equivalence. LieHighestWeight Layer6's Fourier comparison supplies the
finite Weyl alternating numerator/denominator and coefficient cancellation;
it consumes the generic construction here. The representation-theoretic
WCF and H2.3/H2.6 counts are earlier independent inputs, not consequences
assumed in the generic cone proof. Compute the rank-one two boundary values,
their delta-comb difference, all four open/closed endpoints of an integral
interval and its rational cone formula. Compute A2 with columns e1,e2,e1+e2:
P(a,b)=min(a,b)+1 on the nonnegative quadrant, T(a,b)=min(a,b) there in
lattice-normalized density, and the specified Todd correction; record both
internal-wall agreement and the discontinuity to exterior zero. Compute [2]
including both toric vertices. Check GL2 and SU2 Weyl characters, central
determinant translations and n=0,1. Half-sum roots, polarization shifts,
infinitesimal alcove displacements and half-open endpoint offsets are
different data with their own maps. None is identified by notation alone.

Representative finite-matrix, polarization, Abel and native tempered-dual
interfaces are in [FourierConeTargets.lean](FourierConeTargets.lean); this
prose commissions the complete theory beyond those examples. Use
[De Concini–Procesi–Vergne, §§1–3](https://arxiv.org/html/1012.1049v3),
[Lenz, §2.2](https://arxiv.org/html/1305.2784) and
[Beck–Haase–Sottile](https://arxiv.org/html/math/0506466) for the specified
distribution/polarization, directional-boundary and cone-valuation conventions.
All comparisons, inversion and boundary-domain statements above are proof
targets on the actual carriers, not conclusions obtained solely by citation.

## H2. Native GT and LR comparisons and the hive ring

1. Define the directional finite-difference map from a hive to native signed
   `GTPattern n`. A convenient equivalent chart is h(i,j), 0≤i≤j≤n:
   h(0,j)=Σ_{r≤j}λ_r, h(j,j)=Σ_{r≤j}γ_r,
   h(i,n)=|λ|+Σ_{r≤i}μ_r, with h(0,0)=0, in product convention.
   Specify and prove its rotation/gauge conversion with H1's cyclic triple.
   The chart map is `(i,j)↦(n−j,j−i,i)` in H1’s coordinates.
   The two appropriate rhombus families are precisely GT interlacing; export
   the **remaining** rhombus-family image condition, top-row and successive
   row-sum weight identities. Partial sums reconstruct the hive from the pattern
   and one boundary, proving injectivity and the exact image equivalence.
   The handout's orientation gives native `topRow` λ (its long row drawn below) and pattern weight μ*−ν; the
   product chart rotates this to an equivalent formula. Prove these agree.
2. Build the explicit hive-to-LR equivalence on H0's `LRTableau λ γ μ`.
   In the product chart write a_{ij} for the number of zero-indexed letter i−1
   in skew row j−1. Its forward map is
   `h(i,j)=Σ_(r≤j)λ_r + Σ_(k≤i)Σ_(k≤r≤j)a_(k,r)`.
   For i<j the inverse takes the mixed difference
   `a_(i,j)=h(i,j)-h(i-1,j)-h(i,j-1)+h(i-1,j-1)`;
   on the diagonal use `a_(i,i)=h(i,i)-h(i-1,i)`.
   Prove LR entries in row j are ≤j, nonnegativity including the diagonal,
   semistandard inequalities, ballot prefix inequalities and their equivalence
   to the three rhombus families. Recover each row by weakly sorting its entries,
   prove both inverses, content, boundary and integrality, including empty
   diagrams/zero strips. For arbitrary signed weights use explicit affine
   determinant shifts making all three product weights polynomial; prove the
   answer is independent of shifts and compatible with the native shape carrier.
   This is a bijection of **objects**, not just equality of cardinalities.
3. Consume H0's LR rule and ClassicalGroups Layer 4's identification of
   Schur structure constants with tensor multiplicities to
   prove the invariant dimension and tensor-multiplicity hive formulas. Prove
   affine determinant-shift covariance, cyclic/dual symmetry, symmetry in the
   two inputs, and coefficient change/stable finite-alphabet compatibility.
   Stable range: for the cyclic triple (λ,μ,ν) of item 1 the hive count is
   the product coefficient `c^π_(λ,ν)` with output weight `π=μ*`, and the GT
   fibre has top row λ and weight `μ*−ν`. If every adjacent gap of μ satisfies
   `μ_j−μ_(j+1)≥λ₁−λₙ` (equivalently `π_i−π_(i+1)≥λ₁−λₙ` for π=μ*, since
   dualization reverses the adjacent gaps), prove the directional GT injection
   is onto that weight fibre; the third rhombus family follows from that
   uniform gap. The gap hypothesis is on the output weight π=μ*, not on λ.
   Without it surjectivity fails: for n=3, λ=(1,0,−1), μ=ν=0 the fibre has two
   GT patterns (weight 0 has multiplicity 2 in the adjoint) but there is no
   hive, since `c^0_(λ,0)=0`. Build the source’s type-A
   Steinberg alternating formula by dominant-coefficient extraction in the
   Weyl-denominator tensor character using CG/HW, and identify the same
   weight multiplicity through this adapter. State the input/output permutation
   and dual signs, and treat n=1 separately. Prove the quasi-GT/positive-root
   partition limit after setting `x_(k,i)=entry_(k,i)-λ_i` on the long-row
   λ pattern (so x_(n,i)=0): retain
   `x_(k+1,i)≥x_(k,i)` and drop
   `x_(k,i)+λ_i≥x_(k+1,i+1)+λ_(i+1)`.
   The row differences are the nonnegative coefficients of e_i−e_j and
   telescope to `λ−wt`. For a fixed positive-root sum ζ this dropping is
   exact whenever every adjacent λ gap is at least the sum of its nonnegative
   simple-root coordinates: each positive-root coefficient is bounded by this
   height, so the unused inequalities hold automatically. State the finite
   ζ-weight-fibre equivalence with that threshold, not a limit of all fibres
   simultaneously. Consume [RootSystems’ type-A realization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md)
   and CG3’s weight dictionary. Map ζ∈ℤⁿ with sum0 into that root model by
   `ζ=Σ_(k<n) (Σ_(i≤k)ζ_i)(e_k−e_(k+1))`; prove injectivity, positive-root
   indexing `(i,j)↦e_i−e_j` and base/pairing compatibility. For GLₙ with n≥2
   use RootSystems' `A (n−1)` in the sum-zero hyperplane of ℚⁿ: its `A r`
   convention uses ℚ^(r+1). Compare this map with native
   `TauCeti.kostantPartition P b` using this specified RootPairing/Base;
   the n=1 empty-root partition is handled separately.
   The source’s negative weight is the re-centered weight.
4. Prove hive vertical Pieri directly: the exterior boundary (1^k,0^(n−k))
   forces γ−λ to be a 0/1 vector of sum k; the line of kinks determines the
   unique completion. Give its entry formula, eight local rhombus cases,
   dominance criterion, k=0,n and repeated-coordinate degeneracies, and its
   collapsed honeycomb picture under H4. Prove the horizontal Pieri version by
   the LR/transpose comparison, using the existing Schur involution.
   Summed parallelogram inequalities give the unique top hive at γ=λ+μ.
5. Construct the category of finite-dimensional **rational GLₙ** representations
   on the native CG/FDRep carrier, its rational subobjects/quotients, additive
   and tensor closure, and an essentially small model via standard coordinate
   spaces Fin d→ℂ with intertwiner matrices. Consume the generic
   [GrothendieckEulerForms Layers1–2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/GrothendieckEulerForms/README.md),
   native `TauCeti.SplitK0` and its exact-K₀ comparison; build this category's
   Grothendieck **representation ring** R(GLₙ) from that same carrier. Prove
   tensor multiplication well-defined, unit, functoriality, and split=exact
   using CG/RG characteristic-zero complete reducibility. Its basis [Vλ] is a
   target here: finite irreducible isotypic multiplicities give an additive
   equivalence `R(GLₙ)≃ DominantWeight n →₀ ℤ`, and character comparison gives
   an injective map to the symmetric Laurent character ring. This ring is
   distinct from the ambient torus group algebra. Compare its character map
   with HW9 differentiation without treating all glₙ modules as semisimple.
   Build the free ℤ-module hive multiplication on `DominantWeight n →₀ ℤ`,
   with finite support from H1. H3 supplies direct combinatorial associativity;
   H2.2–3 independently supply the LR comparison. Prove unit, bilinearity,
   commutativity, central ℤ-grading, dominance filtration and determinant inverse,
   and identify its basis/generators with the newly constructed R(GLₙ) basis
   and exterior/determinant representations. Prove the Laurent presentation for
   n≥1 (n=0 gives ℤ) using triangular highest weights and a linear extension
   of dominance within each central degree; generator-exponent lexicographic
   order does not supply that triangularity. Export coordinates, generator
   normal forms and finite multiplication algorithms.

6. Apply H1.5 to the **actual type-A Kostant partition function**, through
   H2.3's RootPairing/Base and GT comparisons. For N≥2 use rank r=N−1,
   positive roots indexed by pairs0≤i<j<N and m=N(N−1)/2 columns. In simple
   coordinates the (i,j) column is1 in positions i,…,j−1 and0 elsewhere.
   Construct the integral equivalence between ℤ^(N−1) and
   Q_N={z∈ℤ^N:Σz_i=0}: z↦(Σ_(i≤k)z_i)_k, inverse the successive
   difference vector. Identify it with the specified type A_(N−1) root
   model in the sum-zero hyperplane of ℚ^N, its positive-root indices and
   base. Extension by zero on negative roots gives the actual equivalence
   F_A(c)≃{d:ι→ℕ // TauCeti.IsKostantPartition P b (embed c) d}; prove both
   inverses, support and sum identities, and hence equality with the SAME
   native `TauCeti.kostantPartition P b`, not a second Lie-theoretic count.
   Compare with HW3's Cartan specialization through H2.3's existing bridge.

   Prove this consecutive-ones matrix totally unimodular using the native
   predicate. For each square minor first order its selected rows: each
   column still has a consecutive interval of1s. Apply the determinant-one
   row-difference operator to THAT minor. Its columns have at most one+1
   and one−1; expansion handles a column with at most one nonzero, while if
   every column has both signs their row sum is zero and the determinant
   vanishes. This proves every minor0,±1; it does not presume arbitrary
   unimodular row operations preserve total unimodularity of a whole matrix.
   The simple-root columns give full row rank and the full integer lattice.
   The all-ones height is strictly positive on every column. Thus the support
   in simple coordinates is exactly ℝ^(N−1)_≥0, and in Q_N it is the cone of
   nonnegative partial sums, NOT the whole sum-zero space or a central GL
   translate. Transport H1.5's closed chambers, actual rational polynomial
   constituents, integer evaluations, internal-wall agreement and relative
   face restrictions. Their total degree is at most
   m−r=(N−1)(N−2)/2. Determinant shifts of λ and wt cancel in λ−wt; they do
   not add a root-lattice or partition variable. No least/minimal chamber
   decomposition is required by this API: compare refinements explicitly.

   Give the A2 example in full: for c=(a,b), solutions are uniquely
   (a−z,b−z,z),0≤z≤min(a,b), so the count is min(a,b)+1 if a,b≥0 and0
   otherwise. The two closed support chambers a≤b and b≤a have polynomials
   a+1 and b+1 and agree at a=b. At the origin the value is1 and the
   exterior-zero value does not glue. For N=2 the single-root count is1 at
   a≥0 and0 otherwise, of degree0. For N=1 and N=0 the root lattice is the
   zero group, the empty partition is unique and there are no root operators;
   these cases do not invoke a negative-rank type-A model. Preserve the
   existing fixed-height GT threshold and its object equivalence: compose
   it with this count and chamber evaluation on each specified parameter
   region. No chamber-polynomiality for arbitrary root systems, arbitrary
   GT/hive polytopes or every vector list follows from this specialization.

7. **Diagonal overgroups and restriction.** Let G=GLₙ(ℂ), P=G×G and
   Δ={(g,g)} the diagonal. Define the scalar-diagonal subgroup
   `H_sc={(cg,g) : g∈G, c∈ℂˣ}` and the determinant-equality subgroup
   `H_det={(g,h) : det g=det h}`, with inclusions Δ≤H_sc≤P and Δ≤H_det≤P.
   For a subgroup Δ≤H≤P put N=`Subgroup.goursatFst H`={a : (a,1)∈H}; prove N is
   normal in G and (g,h)∈H iff gh⁻¹∈N, so H↦N is an order isomorphism from
   overgroups of Δ to normal subgroups of G (Mathlib `Subgroup.goursatFst`,
   `Subgroup.normal_goursatFst`), with H closed iff N closed and H connected
   iff N connected. Prove, for n≥2, that the closed connected complex Lie
   subgroups between Δ and P are exactly Δ, H_sc, H_det and P, corresponding
   to N={1}, the scalars (Mathlib `Matrix.GeneralLinearGroup.center_eq_range_scalar`),
   SLₙ(ℂ) and G; the route is the Lie correspondence for closed connected
   subgroups (LieGroups Layers 2–4) and the list 0, scalars, slₙ, glₙ of
   ideals of glₙ(ℂ). For n=1, H_sc=P and H_det=Δ, so there is no strict
   intermediate group; for n=0 all four groups are trivial. Then compare
   restrictions of the external irreducible `V_λ⊠V_μ` with the tensor product
   counted in items 2–3, including all determinant shifts: its restriction to
   Δ≅G is `V_λ⊗V_μ` with multiplicities `c^γ_(λ,μ)`; for n≥1 the map
   `G×ℂˣ→H_sc`, (g,c)↦(cg,g), is an isomorphism and the restriction to H_sc is
   `⊕_γ c^γ_(λ,μ) V_γ⊠χ` with χ(c)=c^(|λ|), the central character of the first
   factor; the restriction to H_det is irreducible, since H_det contains
   SLₙ(ℂ)×SLₙ(ℂ). Checks: for n=2, λ=μ=(1,0) the restriction to Δ is
   `V_(2,0)⊕V_(1,1)` and to H_sc each summand carries χ(c)=c; for n=1 every
   restriction is a character and the H_sc and H_det cases reduce to P and Δ;
   the positive reals `{(rI,I) : r>0}·Δ` form a closed connected real
   subgroup between Δ and P that is not complex, so the classification needs
   the complex hypothesis. *Needs:* LieGroups Layers 2–4, ClassicalGroups
   Layer 3, items 2–3, Mathlib `Subgroup.goursatFst`.

## H3. Octahedron recurrence and the excavation bijection

1. Define the size-n tetrahedral lattice and its unit tetrahedral/octahedral
   subdivision, and compare it with HK's space-time lattice
   `L={(x,y,t)∈ℤ³:0≤x,y≤n, x+y+t even}`. Sections are graphs in the
   2-skeleton meeting each vertical line once. The associator region is
   `A={|x−y|≤t≤n−|n−x−y|}`. Its lower section S is t=|x−y| and its
   upper section S′ is t=n−|n−x−y|. In H1 barycentric coordinates,
   embed the first input face by `(x,y,z)↦(n−x,z,y)` and the second by
   `(x,y,z)↦(y,n−x,z)`. Read the µ,ν,τ* output face by
   `(x,y,z)↦(n−z,n−x,n−y)`, subtracting |λ| to normalize its A-corner;
   read the λ,τ,π* face by `(x,y,z)↦(y,z,n−x)` without a constant shift.
   Prove these maps land on S/S′ and give exactly the displayed boundaries.
   In the inverse, add |λ| back to the first output face before gluing. Match the first hive's A,C with the second's A,B; their common
   dominant-weight partial sums agree with both A-values0.
   There are no extra rhombus inequalities across this shared edge.
   For n≥1 define the full bounded modified recurrence of HK(5) on
   `Y=[0,n]²×ℝ`, before restricting it to A. To compute f(x,y,t+1), subtract
   f(x,y,t−1) from the maximum of the two opposite-neighbour sums in the
   interior; on y=0,n use only f(x+1,y,t)+f(x−1,y,t), and on x=0,n use
   only f(x,y+1,t)+f(x,y−1,t). At each of the four corners use the sum of
   its two inward neighbours. Define its time inverse by t↦−t, prove finite
   dependency recursion from a section, and build the integral, real and PL
   state-transition APIs on finite future/past regions. Treat n=0's one-point
   hive maps separately. The interior rule is `e'=max(a+c,b+d)-e`.
   For the associator restriction prove every dependency stays in A and wall points
   already lie on S. Give the equivalent legal unit-cell excavation schedule,
   termination and agreement with time recursion, rather than relying on an
   undefined shelling. Reverse time gives the inverse recurrence; ties are
   included. Prove unchanged four exterior boundaries, integral coefficients,
   homogeneity, continuity and native finite piecewise-affineness from max branches.
2. Build oriented wavefronts and the **transverse hive condition** of HK3.1:
   require the inequality only for rhombi R_α whose short diagonal α lies
   in W∩S, for W transverse to S. Prove it is equivalent on S and S′ by
   the four elementary cutcurve moves: split one edge into two, merge two into
   one, slide an edge along a wall, and cross a cutpoint. Build the local max
   inequalities in both directions and all orientation/boundary cases, including
   the half-/quarter-octahedron rules used by the cutcurve comparison.
   For A use the wavefront family excluding those containing a face of the big
   tetrahedron; prove this family exactly captures the individual hive-face
   rhombi on both S and S′. Do not impose a condition on every arbitrary
   rhombus across an intermediate frontier's glued edges.
   Obtain the explicit integral and real equivalences
   `Σσ Hive(λ,μ,σ*)×Hive(σ,ν,π*) ≃
    Στ Hive(μ,ν,τ*)×Hive(λ,τ,π*)`.
   Both directions preserve hive conditions and the four external product
   boundaries. Intermediate dominant weights vary; H1 proves finite support.
   Extract the associativity sums and H2's hive-ring associativity. This proof
   is independent of LR counting and of H9's later coherence comparison.

## H4. Honeycombs, overlay and saturation

1. Construct the canonical rank-n triangular honeycomb graph dual to the
   unit-triangle lattice: finite vertices, finite edges and 3n labelled rays.
   A configuration locates vertices in `{(u,v,w)∈ℝ³:u+v+w=0}`, with each
   oriented edge in its assigned coordinate direction and nonnegative length.
   Prove the edge-constant-coordinate description is equivalent, finite linear
   constraints, boundary order/trace, and linear coordinate isomorphism with
   normalized hives. Hives' affine gradients give vertex locations; their
   jumps give lengths. Conversely integrate crossed edge constants along the
   dual graph; zero tension gives path independence, normalization and boundary
   partial sums. Prove slack=length with the chosen lattice normalization.
   Export ℤ/ℚ/ℝ compatibility and the native piecewise-affine comparison.
2. Build reduced weighted diagrams, allowing zero-length contractions,
   coincident edges with positive integer multiplicities and transverse crossings.
   Equality is equality of the embedded weighted diagram after subdividing at
   vertices/crossings; it is not equality of arbitrary graph presentations.
   Prove finite support, six-direction zero tension, convex complementary
   regions and reconstruction of the unique canonical rank-n configuration.
   Classify degeneracy regions and local vertex types, reconstruct the dual
   graph from directions/multiplicities and prove subdivision/contraction
   invariance. Show the three n-ray families determine rank; a finite balanced
   component without rays is impossible. Treat repeated boundary values and
   multiple coincident rays without a strict-dominance assumption.
3. Define diagram overlay by adding multiplicities and compare it with the
   rank-(n+m) configuration reconstructed in item2. Boundaries are **sorted
   multiset unions**, not coordinatewise sums. On hives prove its tropical
   convolution formula
   `(h⊞k)(a)=max_{b∈Δₙ,c∈Δₘ,b+c=a}(h(b)+k(c))`.
   Prove decomposition sets are nonempty and finite, rhombus preservation,
   gauge/normalization, ℤ-compatibility, associativity and commutativity and
   rank0 identity. Prove the formula by the integrated diagram/affine-envelope
   comparison, not by assuming an arbitrary pointwise maximum preserves
   concavity. Distinguish this operation from pointwise addition of same-rank
   hives. Prove the max-plus convolution distributivity on ambient finite
   functions and identify the domain on which hive closure holds.
4. Derive the **type-A PRV theorem**: for dominant integral λ,μ and permutations
   w,v, if γ=wλ+vμ is dominant, then Vγ occurs in Vλ⊗Vμ. Overlay rank1
   honeycombs with triples `(λ_i,μ_j,-λ_i-μ_j)` according to the chosen
   permutations; the three sorted boundary multisets are λ,μ,γ*. Prove
   integrality and invoke H2's actual tensor comparison. Include the extremal
   Cartan summand and determinant cases. No general semisimple PRV theorem is
   inferred from this type-A construction.
5. Build fixed-boundary honeycomb deformation theory: hexagon breathing,
   virtual configurations, elision of simple crossings, loop deformations and
   local molting at six-valent vertices, rakes and five-valent vertices.
   Choose a generic superharmonic weighted-perimeter objective: exterior-region
   weights0, each interior hexagon weight greater than the mean of its six
   neighbours. Construct such weights by the finite Dirichlet/discrete-Laplacian
   solution (positive inverse/maximum principle), then avoid H1's finitely many
   forbidden hyperplanes. Prove every allowed inflation increases the objective.
   For regular boundary prove its largest lift has only simple degeneracies and,
   after elision, an acyclic graph. Exclude high multiplicity via the windward
   maximal-multiplicity path and compatible local molting, prove monotone
   progress/termination, and exclude cycles by the nonzero fibre deformation.
6. On each regular largest-lift chamber, remove forest leaves recursively:
   two known ray coordinates determine the third by `c=-a-b`. Prove termination,
   integral coefficient formulas for every vertex/edge and reconstruction.
   Each full-dimensional chamber of H1’s largest-lift linearity subdivision
   has dense regular feasible points. Finitely many forest integral matrices
   describe their lifts; a finite union of proper linear subspaces cannot cover
   a relatively open chamber, so that chamber’s linear map equals one of these
   matrices. Every boundary point belongs to a full-dimensional chamber closure.
   Continuity extends its integral formula to all walls, including repeated coordinates. Prove regular feasible
   boundaries are dense by an explicit strict honeycomb perturbation; use a
   chamber incident to a wall, not rounding an arbitrary hive's labels.
   Thus every nonempty real fibre with integral boundary has an integral point.
   Rational witnesses/clearing denominators plus H2 give
   `c^(Nγ)_(Nλ,Nμ)>0 ↔ c^γ_(λ,μ)>0` for N≥1.
   Export the invariant-triple form, decidable positivity and an integral-witness
   algorithm. Include KT1 figure18's nonintegral extreme point to distinguish
   saturation from total unimodularity of all active hive systems.

## H5. Puzzles, boundary certificates and facets

1. Define finite puzzles of side N as exact tilings by unit 000-triangles,
   unit 111-triangles and rhombi whose outer edge clockwise after an obtuse
   corner is1 and clockwise after an acute corner is0. Allow rotations, prohibit
   independent reflections; reflecting and swapping0/1 is a duality.
   Build edge/triangle occupancy, matching labels, boundary words, extensionality,
   finite enumeration, rotation/duality, gluing and connected monochromatic
   regions. Force balance proves each boundary has the same number k of1s.
   Deflate/expand regions with nonnegative real lengths, retaining edge-direction
   data; prove collapse/subdivision independence and zero tension.
   Prove counts k² one-triangles, (N−k)² zero-triangles and k(N−k) rhombi,
   with both orientations' binomial counts.
2. A puzzle places disjoint rhombi in the hive lattice. Prove the sum of their
   slacks telescopes to the sum of selected cyclic **0-edge** boundary entries,
   a nonnegative boundary functional. Using trace0 equivalently the sum of
   selected **1-edge** entries is ≤0. Give both formulas and their coordinate
   signs, normalization independence and rotation. Conversely for a nonempty
   collection of interior-disjoint rhombi with coefficient1 whose total functional
   is supported on the outer boundary, prove the source homework: connectedness,
   constant0/1 labels on complementary regions and convexity of same-type
   regions, by the five forbidden local configurations. Handle empty collections
   separately and prove the boundary equal-k condition by force balance.
3. Show the boundary cone has dimension3N−1 for N≥1 inside trace0 and give
   explicit nondegenerate configurations/trading perturbations. For each regular
   facet, take H4's generic forest lift; it splits into two connected components
   after elision. Here a clockwise overlay consists of two honeycombs of
   ranks r and N−r, with 0<r<N, whose intersections are isolated points in
   the interior of an edge of each factor, with the first factor turning
   clockwise to the second at every crossing. Trading through crossings
   forces this consistent clockwise overlay. Reconstruct its puzzle and prove the supporting hyperplane really
   is a facet by a3N−2-dimensional perturbation family. Conversely every
   clockwise overlay supplies that facet. With chamber inequalities this proves
   real hive feasibility iff **all** puzzle boundary functionals are nonnegative.
   Export the exact finite certificate list and a witness/certificate alternative.
   One inequality alone is only necessary. Include rank1 and rank2 explicitly;
   chamber inequalities are essential for N>2 but redundant for N=2.
4. Build gentle paths/loops in puzzles, arrows and turn restrictions. Prove
   loop-free puzzles admit clockwise-overlay witnesses by rake propagation;
   these puzzles are uniquely determined by boundary words. If a gentle loop
   exists, choose a minimal one, prove the radius1 neighbourhood's allowed
   intersections, and perform the reversible breathing move giving a distinct
   puzzle with the same boundary. Hence rigid iff loop-free. Prove regular
   facets correspond bijectively to rigid nonconstant puzzles, while a nonrigid
   puzzle's face meets only chamber walls. Export irredundancy **relative to
   the dominant trace-zero chamber** and account for trivial all0/all1 words.
   Export rigidity under one-region inflation and its dual operation; H6.8
   uses the exact honeycomb-scaling comparison for multiplicity-one stretching.

## H6. Grassmannian cohomology and the puzzle rule

1. On the supplied rank-k subspace Grassmannian Grₖ(ℂᴺ), N=k+q, construct
   the supplied graph charts and complex-point identifications, transporting
   along 0G's algebraic subspace/quotient comparison over Spec ℂ to the
   quotient-rank-q Mathlib carrier. Consume Tau Ceti `chartEquiv`/`chartHomEquiv`
   at `4f1bd4f`, beyond the `a91d3aaf` Lake pin; prove homogeneous models U(N)/(U(k)×U(q)) and GL(N)/Pₖ,
   connectedness, compactness, complex dimension kq, Plücker smooth/holomorphic
   embedding and its induced Kähler form. Identify the supplied tautological
   bundle S and quotient Q, exact sequence0→S→ℂᴺ→Q→0, bundle ranks,
   flag forgetful maps and associated-bundle actions. Compare the algebraic
   chart shape with the native `Module.Grassmannian.scheme` gluing and #14686; scheme gluing is not a prerequisite for singular
   cohomology. Include k=0,q=0 and orthogonal-complement/dual homeomorphisms.
2. A binary word w of length N with k ones gives their positions p₁<⋯<pₖ.
   Set `λ_i=q+i-p_i` with one-indexed i, the number of zeroes after its ith1.
   This is the partition inside k×q; prove inverse, inversion count |λ| and
   reversal w↦reverse(w) gives rectangle dual `λ∨_i=q-λ_(k+1-i)`.
   Use the standard increasing coordinate flag F. Define cells by exact
   `dim(V∩F_j)=#ones(w[1..j])`, and Schubert varieties by ≥.
   Prove row-echelon chart cells `ℂ^(kq−|λ|)`, closure and word partial order,
   with `C_µ⊆X_λ ↔ λ⊆µ` (equivalently `p_µ,i≤p_λ,i`), boundary union, and
   the partial-flag projection comparison with LG8's Bruhat cells. Consume the
   single finite CW characteristic-map and rank-one partial-flag incidence
   construction on this same complex subspace carrier from TopK T1.5; do not
   reconstruct it or assume a generic Bott–Samelson resolution. With `a=k` and
   `N=k+q`, identify the row-word pivots with the partition by
   `λ_i=q+i-p_i`, prove the inverse and inversion-count formula `|λ|`, and
   prove reversal `w↦reverse(w)` gives `λ∨_i=q−λ_(k+1−i)`. Compare the
   transferred characteristic maps' open-cell orientation with the complex
   orientation of the row-echelon charts. Use the resulting CW structure and
   these cell/partition comparisons to construct the integral cellular basis
   and compare it with the Schubert cohomology basis in item 3; export free
   integral even homology and cohomology through AT, without passing through
   real coefficients.
3. Define σλ as the integral cohomology class dual to the Schubert cycle of
   complex codimension|λ|, degree2|λ|. Construct the cycle via the complex
   orientation on its top cell and prove the boundary cancellation/extension
   in its closure; identify its pushforward in ambient homology and Poincaré
   dual. Singular Schubert varieties are not falsely declared smooth.
   Opposite-flag intersection gives `∫σλσμ=δ_(μ,λ∨)` and the top point class
   pairs+1. Prove σ∅=1, positivity of transverse complex local multiplicities
   and actual generic-flag incidence counting. Own the homogeneous parameter
   theorem: for a transitive smooth action, G×Y→X is a submersion; inverse
   image of Z is a manifold and Sard applied to its projection to G gives
   dense/full-measure regular parameters, with a residual form using countable
   compact exhaustions and Baire. Export transversality and product-action
   variants. Openness needs a proper/compact incidence hypothesis; it is not
   asserted for arbitrary noncompact strata. Apply this to each finite
   Schubert-cell stratum. When total codimension is kq, lower-stratum
   intersections have negative expected dimension and are empty generically.
   Compactness of the closed Schubert incidence space and openness of
   transversality near the finitely many remaining top-stratum points then
   give a **dense open** good-flag locus, stable under small parameter changes. When total codimension
   is kq and flags are in that locus, the intersection is finite in the smooth
   top strata and its cardinality is the cup evaluation. Degenerate flags may
   give nontransverse/infinite intersections; no unqualified four-lines claim.
4. Prove the geometric Pieri and Giambelli identities. Special row classes are
   c_r(Q), column classes c_r(S*) under CC's c₁(O(1))=+h convention.
   Use the flag incidence resolution and iterated projective-bundle Gysin,
   prove its top-stratum degree1, pushforward and tautological exact sequences,
   and compute the determinantal formula in special classes. This is the
   **Grassmannian-specific incidence resolution**, not generic Bott–Samelson
   or Schubert rational-singularity theory. Build the needed flag/Grassmann
   fibre integrations using CC C2 and LH/Chern relations, including integral
   pushforward normalization. Prove the ring presentation
   `H*(Grₖ(ℂᴺ);ℤ)≅ℤ[e₁,…,eₖ]/(h_(q+1),…,h_(q+k))`, where e_i=c_i(S*)
   and h_r are complete functions in its Chern roots (h₀=1, h_r=0 for r<0).
   Prove generation, straightening/reduction and independence by the geometric
   Schubert basis, not by presuming the LR ring statement being established.
5. Build the surjective graded map from H0's Λ_ℤ to this ring, sending
   sλ to σλ inside the rectangle and to0 otherwise. Prove the kernel is the
   span/ideal of outside-rectangle Schur functions, specialization compatibility,
   multiplication and LR coefficients. Degrees double under this map.
   Identify σλ with the determinant of c_(λ_i−i+j)(Q), retaining vanishing
   terms and the k=0 case. Thus the Grassmannian multiplication constants are
   the supplied LR constants restricted to rectangle outputs.
6. Define the puzzle-to-integral-honeycomb equivalence **with fixed boundary
   words**, following KTW§5. Set partitions λ,μ,γ from their1-positions.
   Rotate the puzzle30°, attach infinite rhombus strips at boundary1-edges,
   deflate one-regions, and recover zero-tension vertices with multiplicities
   equal to strip thickness. Boundary coordinates are λ,μ,γ* at rank k.
   Prove all vertices lie in the coordinate triangle of side q, then inflate
   each edge into its prescribed rhombus thickness and each vertex into a
   polygon of one-triangles. Prove tiling, absence of gaps/overlap, matching
   labels, coordinate bounds, both inverses and dependence on origin/rotation.
   The inequalities0≤λ_i,μ_i≤q do not alone prescribe the three boundary words;
   the full boundary partition data is required. Include k=0 and repeated
   coordinates. Combined with H2 gives the puzzle-count cup-product theorem.
   With all three sides read cyclically, it counts the triple integral; for a
   product coefficient read the south word in reverse cyclic direction.
7. Build the free integral binary-word module and puzzle multiplication, its
   unit word0^q1^k, grading, commutative associative ring and isomorphism to
   the actual cohomology ring. Associativity follows through the ring
   isomorphism in item5–6. Export rotation/triple duality and
   complement/transpose symmetry between Grₖ and Gr_q in the dual space.
   Implement finite puzzle enumeration and compare cardinalities with the
   existing LR/hive algorithms. This is ordinary cohomology: no equivariant
   puzzle weights, quantum corrections or K-theoretic pieces are inferred.

8. Prove the multiplicity-one stretching theorem after item6: reduce arbitrary
   signed weights by determinant shifts, choose a rectangle containing the
   resulting partitions, and use the puzzle-count theorem. Define dual inflation
   by complement/reflection, one-region inflation, complement/reflection back;
   at dilation d it changes side N=k+q to k+dq, stretches the partition
   coordinates by d and leaves k fixed. Prove it corresponds exactly to scaling
   the rank-k honeycomb by d. Gentle-loop rigidity is preserved in both directions,
   so a unique original puzzle gives a unique dilated puzzle and
   `c^γ_(λ,μ)=1 ⇒ c^(dγ)_(dλ,dμ)=1` for d≥1.

## H7. Hermitian spectra, the weighted-flag bridge and Horn recursion

1. Define the spectrum of a Hermitian N×N complex matrix using the native
   symmetric linear operator on the **Euclidean inner-product** coordinate space.
   Consume native `Matrix.IsHermitian.eigenvalues₀` (sorted),
   `isSymmetric_toEuclideanLin_iff`, `eigenvalues₀_antitone`, `charpoly_eq`,
   trace/eigenvalue and roots APIs; reindex Fin(card(Fin N)) to Fin N.
   Prove the sorted-spectrum equality iff the characteristic polynomial is the
   product of the corresponding linear factors, retaining multiplicities.
   Consume the PiLp/matrix conversion and trace=sum and determinant=product, unitary conjugacy classification,
   diagonal realization, direct sums as sorted multiset union, negation as
   reverse-negation and scalar shifts. Consume PolarDecomposition PD-A50–A53
   for finite min–max and Weyl; build the matrix/Euclidean operator adapter and
   deduce ordered eigenvalue continuity and perturbation/Lipschitz bounds,
   closedness and bounded representatives for feasible triples. A zero-sum
   triple A+B+C=0 has trace-zero spectral triple. The sum-of-two convention
   uses (α,β,−reverse(γ)). Export n=0 and n=1 normalizations separately.
2. For an integral dominant λ form the compact flag orbit of the highest-weight
   line in the native Vλ, inside P(Vλ), with its Hermitian invariant norm.
   Construct the repeated-eigenvalue partial-flag carrier as the closed
   incidence subset of the supplied finite Grassmannians for its block-end
   dimensions. Build its charts, block-parabolic stabilizer, compact unitary
   homogeneous model and full-flag projection, and identify it with this
   highest-line orbit. Prove the smooth/complex projection and orbit embeddings;
   these partial-flag comparisons are H7 targets, beyond LG8’s full flags. Compute the projective norm-square moment map
   `⟨μ([z]),H⟩=Re⟨z,dρ(H)z⟩/⟨z,z⟩` for Hermitian H; its orbit has spectrum λ.
   With CKG’s FS class normalized to integral1 and R1’s `ι_ξω=dμ_ξ`,
   identify H with the Lie generator **−2πiH** (its action is exp(−2πitH)).
   The corresponding u(N)-dual functional pairs ξ by the Hermitian matrix
   `(i/(2π))ξ`. Prove this scaling/sign dictionary and KKS equality; no
   unnormalized expectation is called the moment map for generator iH.
   Prove the central character supplies the scalar part even though it acts
   trivially on projective points. Compare its KKS/Fubini–Study normalization
   with HamiltonianReduction R2 and CKG K7. Construct the finite Segre map
   on the native projectivizations of the three representation spaces, prove
   well-definedness, equivariance, injective closed holomorphic embedding and
   its local inverse in nonzero-coordinate charts. Identify its O(−1) pullback
   with the tensor of the three tautological lines and its normalized FS
   pullback with the sum of factor forms by the log-product norm formula.
   Prove its tensor moment map is the sum of the three factor maps. The line is in Vλ and sections of O(1) are dual;
   invariant nonvanishing is unchanged by dualizing all factors. Export the
   actual highest-line/Cartan-product coordinate comparison for every positive
   power, including determinant shifts and linearisations. The projective
   highest line has fibre character+λ for the upper-triangular stabilizer;
   its O(1) dual has fibre character−λ and coordinate module Vλ*. Build the
   Borel–Weil comparison directly from LG8 with the same positive-root Borel,
   associated character −λ and H⁰ module L(λ)*, retaining this explicitly
   computed character. The polynomial-coordinate bridge below is
   proved from CG’s highest-weight cyclic span and does not assume all
   holomorphic sections are ambient polynomial restrictions.
3. Build the invariant-to-moment-zero direction of projective Kempf–Ness
   for these flag products. Define its polynomial coordinate space in degree d
   as the dual of the cyclic span of `(vλ⊗vμ⊗vν)^d` in Sym^d(Vλ⊗Vμ⊗Vν)
   under GL(N)³. Construct that span and identify it with
   `V_(dλ)⊗V_(dμ)⊗V_(dν)` by the Cartan highest-line maps and CG’s
   classification, including their product-group/external-tensor comparison.
   This is **dilation of weights**, not the ordinary tensor power. Prove the
   equivariant restriction from ambient homogeneous polynomials is surjective
   onto its dual, with kernel exactly the homogeneous polynomials vanishing
   on the orbit. Build degree0, graded multiplication and the Cartan-product
   compatibility on these actual coordinate spaces. Construct the finite-
   dimensional invariant lift through this surjection using CG/RG's semisimplicity
   and its comodule-to-rational-representation comparison; the Reynolds splitting
   and its homogeneous-degree preservation are explicit adapters here.
   For d≥1, a nonzero invariant section has nonzero value at some point;
   its positive-degree invariant homogeneous polynomial lift P gives a
   positive lower norm bound on that point's GL(N) orbit, using
   |P(v)|≤C‖v‖^d for some C>0. The degree0 coordinate space is retained in
   the graded algebra; its constants supply no such norm bound. The Euclidean orbit closure has a nonzero norm minimum
   by bounded minimizing sequences and finite-dimensional compactness.
   Prove closure is GL(N)-stable, the Segre/flag cone is closed, and the minimum
   represents a point of the same compact flag product. Polar decomposition
   and differentiation along all Hermitian directions show its moment map is0.
   Build log-norm convexity, criticality/minimal-norm equivalence, unitary
   covariance and central-character normalizations on these orbits. The minimum
   can be in the closure rather than the original orbit. These arguments prove
   nonzero invariant on a weight dilation ⇒ zero-sum Hermitian realization.
4. Prove the converse for arbitrary **real** spectra using H6's actual
   Grassmannian intersections. For a puzzle with k selected1-positions I,J,K,
   H6's triple product is nonzero. For any three eigenflags, approximate them
   by H6's dense generic transverse flag triples; their intersections are
   nonempty. Compactness of Grₖ and closed incidence conditions give a common
   subspace V for the original eigenflags, also with repeated eigenvalues.
   Own the required compression inequality: if A has antitone spectrum α and
   `dim(V∩F_j)≥#(I∩{1,…,j})` for its top-eigenvector flag, then
   `tr(P_V A|_V)≥Σ_(i∈I)α_i`. Prove the finite projection-trace identities,
   positivity and `tr(P_V P_(F_j)|_V)≥dim(V∩F_j)` by an orthonormal basis
   starting in the intersection. Expand A as α_N identity plus its nonnegative
   spectral gaps times the top-eigenflag projections. Summing the three
   compression inequalities for A+B+C=0 gives the selected1 sum≤0, hence
   every H5 puzzle inequality and a real hive.
   Conversely approximate a real hive by rational points of the **entire
   normalized rational hive cone**, including points on faces, using H1's
   rational generators/lineality. Their boundary spectra stay feasible because
   they are actual hives. Clear denominators, apply H2's integral invariant
   formula and item3, then rescale the Hermitian matrices. Native unitary
   diagonalization chooses uniformly bounded representatives; compactness and
   eigenvalue continuity pass to the limiting real spectra. Conclude real hive
   feasibility iff a zero-sum Hermitian triple exists. At integral boundary,
   H4 supplies the undilated invariant and saturation. Export this specialized
   flag/invariant/spectral equivalence, rather than assume Hilbert–Mumford,
   real-weight destabilizing filtrations or singular symplectic-volume formulas.
   Prove coordinatewise-addition closure through hives; matrix direct sum only
   gives sorted union in larger rank.
5. State and prove the Horn system in two-input convention. For N≥1 and
   1≤r<N let U_r^N consist of r-subsets I,J,K of {1,…,N} satisfying
   `ΣI+ΣJ=ΣK+r(r+1)/2`. Define T_1^N=U_1^N; for r>1 retain exactly those
   triples in U_r^N such that for every p<r and (F,G,H)∈T_p^r,
   `Σ_(f∈F)i_f+Σ_(g∈G)j_g ≤ Σ_(h∈H)k_h+p(p+1)/2`,
   where I,J,K are listed increasingly. Prove termination and the dictionary
   with H6 rectangle partitions (positions/reflections in the output are
   explicit). The recursive condition is equivalent to the smaller-rank
   LR-positive/puzzle-feasible triple by H4–H6: for I={i₁<⋯<i_r}, use
   `λ(I)_a=i_(r+1-a)-(r+1-a)`, equivalently H6’s word with ones at
   `N+1-i_j`. Use the same formula for J,K, with the third invariant weight
   dualized. Prove the position/reversal dictionary rather than dropping it; establish it inductively in r.
   Then A+B has spectrum γ with input spectra α,β iff total traces add and
   `Σ_(k∈K)γ_k ≤ Σ_(i∈I)α_i+Σ_(j∈J)β_j` for every T_r^N.
   Derive it from H5 and item4, with the selected0/1/complement sign conversion.
   Include the Weyl rank1 inequalities, lower inequalities by complement,
   all repeated eigenvalues and n=2. Export the irredundant rigid-puzzle form,
   decidable rational/integral feasibility and witness conversion to hives;
   the matrix witness is an existence theorem unless a numerical construction
   with proved error control is additionally supplied.

## H8. Type-A paths, crystals and object comparisons

1. Specialize SchubertGeometry S4.1's path-crystal category and basic API
   to finite normal type-A objects with weights in ℤⁿ,
   partial raising/lowering `Fin(n−1) → B → Option B`, string lengths ε,φ,
   inverse/weight/string identities, strict morphisms and connected components.
   Construct the actual coordinate/reindexing and strict-isomorphism maps on
   these objects; do not define a second generic category or infer a
   classification of arbitrary edge-labelled graphs from rank-one identities.
   Build tensor product on the ordinary product of sets with a **fixed**
   convention: use HK§5’s tensor convention, where e_i acts
   on a in a⊗b iff ε_i(a)>φ_i(b), while f_i acts on a iff ε_i(a)≥φ_i(b);
   otherwise it acts on b. An undefined chosen action returns none. Provide
   the reversal equivalence with the
   left-highest/λ-translated-path convention. Prove rebracketing, unit and
   connected-component transport. These are actual finite maps, not Prop fields
   naming an unconstructed classification.
2. Equip native `BoundedSSYT n λ` and H0's skew tableau carrier with
   signature operators. Own coplacticity (slides commute with these operators),
   the semistandard Schützenberger involution ξ_λ:B_λ→B_λ with weight
   **reversal** w₀wt, e_i↔f_(n−i) in one-indexed notation, and involutivity.
   Pin the Bender–Knuth composition `s₁(s₂s₁)⋯(s_(n−1)⋯s₁)` and prove
   its equality with evacuation/rectification. This is distinct from the dual
   representation weight −w₀wt; signed determinant shifts add the same constant
   on both sides. Build its straight/skew comparisons; H0.4's standard-tableau evacuation is a comparison,
   not the definition of the semistandard operation. Prove preservation, string-length formulas, endpoint
   content/weight identities, highest tableau, connectivity and that raising
   terminates. Transport to native GT patterns through `gtPatternEquivSSYT`.
   Consume native `SemistandardYoungTableau.benderKnuth`,
   `benderKnuth_involutive` and `content_benderKnuth`. Transport to GT patterns
   through `gtPatternEquivSSYT` and prove the adjacent-row min/max formula and weight swap
   from S1pp177–178, with endpoint bounds taken from the neighbouring row
   instead of ±∞ in ℤ. Compare with the existing Schur-symmetry involution;
   it is not falsely identified with a Weyl-group action satisfying braid.
   Include determinant-shift crystals by the native normalized polynomial part,
   adding the constant weight without introducing infinite tableaux.
   Use the Japanese-signature tableau operators transported through H8.1's
   factor-reversal equivalence. As an explicit GL₃ shape-(2,1) computation,
   display entries with labels
   1,2,3 (native tableau entries are 0,1,2). Write abc for the tableau whose
   top row is a,b and whose second row consists of c. Its eight vertices are
   112,122,132,113,123,133,223,233. Prove that the complete lowering edges are
   f₁:112→122, 113→123→223, 133→233 and
   f₂:112→113, 122→132→133, 223→233; every unlisted lowering action is undefined
   and raising reverses these edges. Compute each content weight and identify
   the SL₃ adjoint crystal after subtracting (1,1,1): six root weights and the
   two distinct zero-weight vertices 123 and 132. Verify the two zero vertices'
   different string data; a weight-set diagram alone does not specify this crystal.
3. Specialize SchubertGeometry S4.1–5 to the type-A coordinate paths below.
   The existing `RationalPath n` is a finite-presentation carrier. Construct
   its coordinate evaluation and normalization. Consume S9.5's mutually
   inverse maps between its reparametrization quotient and the generic
   specialized path carrier, with these actual coordinate formulas; do
   not assert a bijection between unquotiented presentations and paths.
   Compare rational reparametrization equivalence with the generic convention
   by a common rational normalization. In coordinates these are rational
   piecewise-linear paths [0,1]→ℝⁿ starting0, with finite
   rational breakpoints and rational vertex positions, with integral endpoints, modulo nondecreasing continuous
   surjective rational PL reparametrizations (take their equivalence closure).
   Remove stationary segments and normalize by cumulative rational L¹ lengths
   of nonzero linear segments; constant0 has its separate representative.
   H_i=π_i−π_(i+1) is the coroot height. Transport the generic
   running-extremum operators and prove equality with the actual type-A
   coordinate formulas, including the multiple reflection/excursion
   decomposition of Littelmann's §1: e_i is undefined if min H_i>−1 and f_i is undefined
   if H_i(1)−min H_i<1. Reflect only the record-decreasing pieces for e_i and
   record-increasing pieces for f_i, leave intervening equal-height excursions
   unchanged, and translate the final tail by +α_i/−α_i. Specify the first/last
   record-height cut times and prove subdivision independence, endpoint change,
   inverse, rationality and reparametrization invariance. For the operator-stable
   components constructed in item4 prove all coroot global minima are integers.
   For LS and column-word components additionally prove **local** minimum
   integrality; on those components the operators simplify to reflection of the entire first-minimum
   interval from m+1 to m for e_i, respectively the last-minimum interval from m
   to m+1 for f_i. Prove the simplification and ε_i=−m, φ_i=H_i(1)−m there.
   Ambient integer endpoints or integer minima of one path alone are not an
   assumption that every subsequent root-operator image stays integral. Build
   concatenation and reversal with their operator/string/tie-case identities.
   These proofs compare the actual operators and normalized representatives,
   not merely character counts. On column-word components give the concrete
   local-minimum integrality proof by their integral word/prefix heights;
   global-minimum integrality on an arbitrary dominant-path component is not
   silently strengthened to that local statement.
4. For each dominant λ build the finite path crystal generated from its straight
   path by these operators and the equivalent crystal generated from the
   dominant concatenation of its fundamental-column paths plus determinant
   path. A fundamental-column path is the straight tω_k; read columns right
   to left. The letter-path comparison uses Japanese reading, each column top
   to bottom with letters0,…,n−1 sent to coordinate paths e₁,…,eₙ. Prove
   the comparison between each straight column component and its letter-path
   component, then concatenate; this is distinct from the Knuth row word.
   Prove a finite sequence/chain encoding: decreasing permutations modulo
   the weight stabilizer, rational breakpoints satisfying the integral-chain
   conditions: each break a admits a saturated decreasing chain of orbit
   weights ξ₀>⋯>ξ_s in **Bruhat order on W/W_λ**, with endpoints
   ξ₀=τ_iλ, ξ_s=τ_(i+1)λ (the corresponding dominance direction is reversed),
   and ξ_j=s_β ξ_(j−1), β=e_p−e_q (p<q),
   pairing⟨ξ_(j−1),β∨⟩<0 and `a⟨ξ_(j−1),β∨⟩∈ℤ` at every step.
   Prove root reflection/chain closure under operators, including repeated weights.
   Specialize the type-A adjacent-transposition/Bruhat conditions, consuming
   native Coxeter and [RootSystems Layer3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md) order/exchange, and prove equivalence with the
   generated paths. This supplies the straight-path finiteness and the precise
   LS-type encoding used here, rather than assuming all rational PL paths form
   a finite highest-weight component. Prove the column-reading map from native
   tableaux to the column-path component, its inverse by successive strip shapes,
   and the highest-weight component equivalence with the straight-path model.
   Prove operator, weight and cardinality compatibility. For an integral
   central character χ=(c,…,c), pointwise π(t)+tχ is a formula on
   parametrized representatives, not an operation on the ambient quotient
   by arbitrary PL reparametrizations. On B(λ) use its unique λ-LS
   parametrization with slopes in Wλ and send those slopes to W(λ+χ);
   handle constant/central shapes separately. Prove the resulting
   B(λ)→B(λ+χ) preserves the operators and shifts weight by χ: it is a
   strict crystal isomorphism AFTER twisting the source weight by χ,
   equivalently from B(λ) tensor the one-point central crystal T_χ.
   Its coroot heights, cut times and string lengths are unchanged. For the
   chosen column/row models transport this map through their straight-path
   comparisons and compare it with the explicit determinant-prefix models;
   do not infer representative independence from centrality alone.
   Also construct the row-reading
   comparison with rows taken from top to bottom and entries within each row
   from right to left. Prove this reading gives the same tableau crystal under
   H8.1's tensor convention as the Japanese column reading. Explicitly realize a
   read word w₁…w_N as w_N⊗…⊗w₁ under that HK convention, via H8.1's
   factor-reversal equivalence, and prove the corresponding reversed-word
   insertion/coplacticity comparison. The two readings can give
   distinct literal paths: compare their crystal operators, endpoints and component
   isomorphisms rather than equating paths. The source's unspecified order of rows
   is retained as a fidelity uncertainty, not used to infer a different convention.
   For the notebook’s row-coordinate
   highest path, turn on polynomial-part coordinates successively, row1 through
   rown; precede this by the central determinant path for signed weights.
   Prove the path remains dominant and compare its component with the straight
   and column models by the same endpoint theorem. Specialize SchubertGeometry S4.4's generic dominant-path
   deformation theorem to type A: any rational PL path staying in the closed
   chamber with integral endpoint λ generates a component strictly isomorphic
   to these models, carrying its distinguished highest path to the highest
   tableau. Prove uniform positive-integer stretching, subdivision and operator
   compatibility. Prove a uniform root-operator distance estimate for a word
   of length L (the finite type-A version of Littelmann3.1), and construct
   linked paths at level L using subdivisions finer than its exponential bound.
   Build gluing pairs of truncated LS paths, their a-chains and operator-stable
   integrality as in Littelmann5.5–5.7. For two segments with dominant first
   endpoint and dominant total endpoint, interpolate the split, prove linkedness
   at every L and uniqueness of the highest endpoint, then obtain equality of
   operator-word fibres (6.1–6.3). Induct on segments and use positive-integer
   stretching (2.4–2.5) to clear rational vertices, giving7.1. These distance,
   level-L linking, truncation/gluing, interpolation and stretching statements
   are the full type-A specializations of the generic supplier, with actual
   coordinate/subdivision/operator compatibility checked here. They do not
   reconstruct a second generic proof engine from the tableau application.
   Prove
   operator-stable integrality and finiteness, rather than assuming them from
   integer endpoints. Rank1/n=0 require no operators.
5. Specialize SchubertGeometry S4.4's generic path tensor rule: concatenation
   decomposes into highest-weight components with unique dominant path and
   endpoints the corresponding dominant weights. The multiplicity of Vγ in
   Vλ⊗Vμ is the number of paths in the μ-component with endpoint γ−λ for
   which λ+π(t) is dominant for all t. Prove equality through the maps of
   items3–4 with the independent tableau tensor/rectification component
   theorem, preserving ε/φ convention and endpoint weights, and consume
   H2's LR-to-representation comparison. This specialization and concrete
   comparison do not become premises of the generic tensor theorem.
 In type A the translated chamber condition
   maps explicitly to HK’s η⊗b_λ under factor reversal; the concatenation
   π_λ*η convention is Kashiwara’s, opposite HK’s. Its dominant-path condition
   is precisely the missing third hive rhombus family after the directional
   GT map. Export the actual finite equivalences from these path witnesses to
   native GT image fibres, LR tableaux and hives, including all inverse maps.
   After this component/tensor proof, H9 builds the HK recurrence/slide
   correspondence. Export its corollary identifying **which** multiplicity object
   corresponds under rebracketing and the commutor. The component/tensor proof
   itself does not assume that recurrence comparison or coherence theorem.

## H9. Bounded recurrence, commutor and coherence

After H8’s tableau/component theorem, consume H3’s full bounded recurrence
on `Y=[0,n]²×ℝ`, its parity lattice and all interior/wall/corner variants,
with its inverse-time, wavefront and integral/PL APIs.
The commutor region is the quarter-octahedron
`{x+y≤t≤2n−x−y}`. Translate HK’s triangle coordinates by
`(X,Y,Z)=(y,z,x)` before using its formulas. Thus in H1 coordinates embed
input Δₙ by `(x,y,z)↦(x,y,n−z)` and read output by
`(x,y,z)↦(y,z,n+x)`, subtracting f(0,0,2n) to normalize its A-corner.
Prove the raw map changes (λ,µ,π*) to (µ,λ,π*) with these exact directions.
At n=1 its new top label is −µ and the normalized boundary is (µ,λ,−λ−µ). Prove its boundary
interchange and preservation of all hive-face rhombi by the transverse family.

Prove recurrence slices equal the successive H0.2 jeu-de-taquin slides and
recording/rectification data (HK7.10–7.14), with H8's coplacticity, and prove the
quarter-octahedron map equals the semistandard Schützenberger crystal commutor
(HK7.15). These are comparisons of the actual finite maps. H8's ordinary
product rebracketing then proves the H3 associator's pentagon and unit triangles;
the crystal reversal proves the hive commutor's involutivity and coboundary/
cactus identities. No earlier commutor-involution theorem is assumed. Give the
HK§6 rank3 Yang–Baxter counterexample: this commutor does not satisfy the
symmetric-monoidal hexagon or braid law. The basic H3 excavation/ring theorem
remains independent of this coherent comparison.

## Source acceptance and references

- Handout hives1–2 and S1pp78–82: rank2 inequalities, gauge action, boundary
  duals, GT difference/reconstruction and the stated uniform-gap stable range.
  Preserve the source’s precise gap statements; the ambiguous S1p81 sketch
  is not used in place of the verified width threshold. WCFandGC4–6's signed Steinberg/Kostant/branching
  identities are consumed and their sign/row-sum comparisons tested by H2.
- Handout hives3–6 and S1pp84–89: exterior/determinant generators, unique top
  hive, direct Pieri, both sums in the associativity identity and every local
  excavation inequality; verify n=2 and a nontrivial n=3 intermediate-boundary
  example. S1pp182–187 require the unique kink completion, all eight rhombi,
  repeated λ entries and the collapsed edge multiplicities.
- Handout hives7 and S1p83: V_(2,1,0)² decomposes as
  V_(4,2,0)⊕V_(4,1,1)⊕V_(3,3,0)⊕2V_(3,2,1)⊕V_(2,2,2), dimensions
  27+10+10+16+1=64. Undo determinant shifts to the source's signed adjoint
  square. Identify the two SL₃ adjoint copies in alternating/symmetric squares
  by bracket and traceless symmetrized product, and the trivial pairing by trace,
  consuming existing classical-group/Lie-module constructions.
- S1pp90–97,188–190: breathing, nongeneric diagrams, overlay and tropical
  convolution; construct the stated PRV witnesses. Reproduce the nonoverlapping
  rhombus homework including convex same-type regions and boundary force balance.
  In rank6 prove the displayed necessary invariant inequality
  λ₄+λ₅+μ₄+μ₆+ν₂+ν₄≤0 by the puzzle with cyclic words
  000110,000101,010100. For rank5 prove the corrected certificate
  λ₄+μ₄+ν₃≤0 (words00010,00010,00100), and its cyclic counterpart
  λ₄+μ₃+ν₄≤0 (words00010,00100,00010). Treat the printed ν₃ version as
  an acceptance **counterexample**: λ=(1,1,1,1,0), μ=(1,1,1,0,0),
  γ=(2,2,1,1,1), ν=γ* give a hive/invariant by exterior Pieri, while
  λ₄+μ₃+ν₃=1. No single inequality is an iff criterion.
- S1pp93–100: real-to-integer feasibility at integral boundary, all-puzzle and
  rigid-puzzle inequalities, deflation/inflation and the binary-word ring. Verify
  `(σ0101)²=σ0110+σ1001` in Gr₂(ℂ⁴), its unit σ0011, and the two puzzle
  fillings. S1pp108–111: all six Gr₂(ℂ⁴) cells, σ0101⁴[Gr₂]=2 and two lines
  in ℂP³ meeting four flags in general position. Verify c₁(Q)=σ0101 with the
  bundle sign conventions. The exponent4 and four-letter0101 are essential.
- S1pp106,109–110 and S2pp69–73: actual rectangle quotient of Λ, partial-flag
  incidence maps and Grassmannian homogeneous/Kähler structure. Full-flag
  Bott–Samelson resolutions and generic Demazure restriction remain separate
  constructions; H6 uses the specified finite Grassmannian incidence resolution.
- S1pp177–180 and S2pp91–92: native signed GT involutions/weight swaps,
  quasi-GT/Kostant inverse and type-A path↔GT and tensor-path↔hive equivalences.
  S2p5's general-K path motivation and S2p90's generic Demazure path theorem
  are not misreported as proved by the type-A tensor connector.

Proof references, each with the constructions it supplies:

- Knutson–Tao, [*The honeycomb model of GLₙ tensor products I*](https://arxiv.org/abs/math/9807160),
  §§2–4 configurations/weighted diagrams/reconstruction, §5 largest lifts,
  §6 forest integrality, appendices BZ/LR and hive dictionary. H1/H4 build its
  finite-polyhedron and deformation prerequisites. The nonintegral vertex in
  figure18 is an acceptance counterexample, not a contradictory saturation case.
- Knutson–Tao–Woodward, [*The honeycomb model II: puzzles determine facets*](https://arxiv.org/abs/math/0107011),
  §§2–4 boundary certificates/trading/clockwise overlays/gentle loops, §5 the
  puzzle–honeycomb bijection, §6 Horn and multiplicity1. Its appendix's
  invariant-to-zero-level passage is built explicitly by H7; the real converse
  uses Schubert compression without inferring existence from symplectic volume.
- Knutson–Tao–Woodward, [*A positive proof of the Littlewood–Richardson rule
  using the octahedron recurrence*](https://arxiv.org/abs/math/0306274), §§3–5:
  direct hive Pieri, the ring presentation and the actual excavation bijection.
- Henriques–Kamnitzer, [*The octahedron recurrence and gl(n) crystals*](https://arxiv.org/abs/math/0408114),
  §§3–4 bounded recurrence, §§5–7 tableau crystals and precise recurrence/slide
  equivalence. Its coboundary commutor is not a symmetric braiding.
- Buch, [*Notes on Grassmannians*](https://sites.math.rutgers.edu/~asbuch/notes/grass.pdf),
  §§1–3: charts, cells, intersections, geometric Pieri and LR comparison.
  Its general cycle/transversality facts are built on the specific H6 carrier
  using the cited AT/CC/DG suppliers.
- Fulton, *Young Tableaux*, §§9–10: finite Grassmannian cell/cycle, incidence
  and integral Schubert ring proofs; H0 builds its earlier tableau/LR theory
  (§§1–3, §5, Appendix A). Littelmann, [*Paths and root operators in representation theory*](https://doi.org/10.2307/2118553),
  §§1–7 for running-extremum root operators, a-chain encoding, gluing/linking
  and the dominant-path isomorphism; H8 constructs the type-A specialization
  and both coordinate-path and straight-path comparisons in full.

For H1.5/H2.6 use [Billey–Guillemin–Rassart, §§1.3–1.4, Lemma1.6,
§4 after Lemma4.3 and §7.1](https://arxiv.org/html/math/0307227v1) and
[De Loera–Sturmfels, introduction/Theorem1.1](https://arxiv.org/html/math/0104286v1)
for the pointed unimodular chamber theorem and type-A normalization. The
closed-support/internal-wall comparison is distinct from the exterior-zero
case; the construction targets and native lattice adapters above specify
the required library interface.
