# Roadmap: hives, honeycombs, puzzles and type-A tensor products

**Summary.** This roadmap builds the integral and real combinatorial models of
rational GLₙ tensor products: hives on the triangular lattice, their
piecewise-linear associator and commutor, honeycombs and the saturation
theorem, puzzles and the Horn inequalities, and the ordinary Grassmannian
puzzle rule. It starts from the native dominant weights, Gelfand–Tsetlin
patterns, bounded tableaux and Schur polynomials of Tau Ceti, consumes the
skew-tableau and Littlewood–Richardson layer of SchurWeyl, and proves explicit
comparisons with Gelfand–Tsetlin patterns, Littlewood–Richardson
tableaux, rational representations, Grassmannian cohomology, Hermitian spectra
and type-A path crystals. Two generic lanes are built on the way: pointed
unimodular vector-partition counting with its chamber polynomials, and the
rational cone series with their Fourier boundary values and lattice endpoints.
The end theorems are the hive model of the Littlewood–Richardson rule
(`schur_mul_eq_finsum_hiveCount`), its representation-theoretic form on the
pinned rational Weyl modules (`finrank_hom_eq_hiveCount`,
`finrank_invariants_eq_hiveCount`), the associativity and commutativity of the
hive ring (`card_leftPair_eq_card_rightPair`, `hiveCount_comm`), saturation
(`integral_witness_iff_real_witness`), the type-A PRV theorem
(`hiveCount_pos_prv`), multiplicity-one stretching (`hiveCount_smul_eq_one`),
the Hermitian characterization of hive feasibility (`hermitian_iff_hive`) and
the chamber polynomiality of the type-A Kostant partition function
(`typeA_exists_chamberPolynomial`). Suggested homes are
`TauCeti/Combinatorics/Hive/`, `TauCeti/Combinatorics/Puzzle/` and
`TauCeti/RepresentationTheory/TypeAPath/`.

## Scope and ownership

This roadmap owns: the triangular lattice,
rhombus inequalities, integral and real hives, their fixed-boundary polytopes
and the finite rational polyhedron, Farkas and largest-lift adapters (Layer 1,
§§1.1–1.4); pointed unimodular vector-partition counting with its chamber
polynomials and cone valuations (§1.5); rational cone series, their Fourier and
Abel boundary values, box and cone distributions, wall crossing and the
directional Todd and toric reconstruction of lattice counts (§1.6); the
comparisons of hives with native Gelfand–Tsetlin patterns and with
Littlewood–Richardson tableaux, the tensor-multiplicity and invariant formulas,
the type-A Steinberg extraction adapter, direct hive Pieri, the rational
representation ring R(GLₙ) with its hive multiplication, the type-A Kostant
partition function as an interval-matrix count and the comparison of hive
counts with the restrictions of external tensor products to the diagonal
overgroups (Layer 2); the bounded octahedron recurrence and the excavation
associator (Layer 3); honeycombs, overlay, the type-A PRV theorem and
saturation (Layer 4); puzzles, their boundary functionals, facets and
gentle-loop rigidity (Layer 5); the finite complex Grassmannian's integral
Schubert cohomology, Pieri, Giambelli, the quotient of the stable ring, the
puzzle–honeycomb equivalence, the puzzle ring and multiplicity-one stretching
(Layer 6); Hermitian spectra, the projective invariant-to-moment-zero bridge,
the Schubert compression inequality and the Horn recursion (Layer 7); the
type-A path, tableau and Gelfand–Tsetlin crystals as specializations of the
generic path engine, with the comparison maps between the type-A coordinate
paths and the generic path carrier (Layer 8); and the quarter-octahedron
commutor with its slide, Schützenberger and cactus comparisons (Layer 9).

It does not own, and does not restate:

- partitions, dominance, standard tableaux, finite-alphabet Schur polynomials,
  Jacobi–Trudi, the finite Frobenius characteristic and RSK, which
  SchurWeyl Layers 0 and 7 own; skew semistandard tableaux, jeu de taquin,
  Knuth equivalence, Littlewood–Richardson tableaux, the tableau-product
  bijection, vertical Pieri, standard-tableau evacuation and the stable graded
  ring of symmetric functions with its Schur basis, which SchurWeyl must
  provide (three declared gaps under supplier contracts); nothing of that
  tableau layer is built here;
- native dominant weights, signed Gelfand–Tsetlin patterns,
  `TauCeti.gtPatternEquivSSYT`, the rational Weyl modules
  `TauCeti.rationalWeylFDRep` and their characters, which are Tau Ceti
  declarations; the identification of those modules with the irreducible
  rational representations of highest weight, of Littlewood–Richardson
  structure constants with tensor multiplicities, and the weight/branching
  basis, which ClassicalGroups Layers 3–6 own;
- the Weyl character formula, the Weyl denominator and the Kostant
  multiplicity formula for Lie algebras and root pairings, which are native
  Tau Ceti declarations (exact names under supplier contracts); nothing of
  LieHighestWeight is consumed, and its Layer 6F is a consumer of §1.6 and
  §2.6 (see Downstream consumers);
- the generic finite-root-data path-crystal engine of SchubertGeometry
  S4.1–5; Layer 8 specializes it to type A and owns the comparison maps with
  its own coordinate and tableau carriers, which SchubertGeometry S9.5
  restates (see Downstream consumers); no return edge into S4.1–5 is added;
- the classification of the closed connected complex Lie subgroups of
  GLₙ(ℂ)×GLₙ(ℂ) containing the diagonal and the restriction of external
  tensor products to them, which ClassicalGroups must provide (two declared
  gaps under supplier contracts); §2.7 keeps only the comparison of those
  restrictions with hive counts;
- full flags, full-flag Bruhat cells and Borel–Weil (LieGroups Layer 8), the
  finite rank-k subspace Grassmannian with its topology, charts, tautological
  bundle, CW characteristic maps and partial-flag incidence
  (TopologicalKTheory T1 and T1.5) and the algebraic quotient-rank
  Grassmannian (Mathlib `Module.Grassmannian`); §6.1 owns the comparison of
  the latter's complex points with the topological carrier, and the scheme
  structure of the Grassmannian functor (charts, gluing, structure morphism)
  is not consumed anywhere: Layer 6 works with the complex points of the
  quotient-rank functor and the topological carrier only;
- singular and cellular cohomology, cup products, Künneth, orientations and
  duality (AlgebraicTopology Stages 2–6), Thom, Gysin, Leray–Hirsch and
  integral Chern classes (CharacteristicClasses C2–C3), Kähler structures of
  projective embeddings (ComplexKahlerGeometry K7), manifold Sard
  (DifferentialGeometry 10.2), finite min–max and Weyl perturbation
  (PolarDecomposition PD-A50–A53), moment maps, coadjoint orbits and KKS
  (HamiltonianReduction R1–R2), the compact chamber/quotient dictionary
  (ConvexityToric T3), normalized torus Haar measure (CompactGroups Layer 0),
  smooth periodic Fourier expansions with rapid seminorm decay
  (PseudodifferentialOperators Layer 3), the generic test-function and
  distribution carriers (ComplexKahlerGeometry K5a), semigroup/lattice
  comparisons (GroebnerGeometry G2) and the generic Grothendieck groups
  (GrothendieckEulerForms Layers 1–2, Tau Ceti `TauCeti.SplitK0`);
- the Coxeter combinatorics of the symmetric group and the type-A root
  realization (RootSystems Layers 3 and 5).

Out of scope altogether: the general semisimple PRV theorem, equivariant,
quantum and K-theoretic puzzle rules, quantum-group crystal bases and
Kac–Moody path models, Bott–Samelson resolutions and generic Demazure
restriction, Hilbert–Mumford criteria and symplectic-volume formulas, and
every executable certificate search. The mathematical background of the
algorithms (finite enumeration of hives, chamber certificates, puzzle
enumeration) appears as targets and Checks; no implementation is specified.

`Suggested.lean` states the headline theorems of this roadmap against the
pinned Mathlib and Tau Ceti, with the few definitions those statements need;
the README carries every target, API and Check.

## Conventions

1. Weights are `TauCeti.DominantWeight n`, the native antitone `Fin n → ℤ`
   subtype, including all determinant twists; its `shift`, `detShiftShape`,
   `weightOfShape` and `shapeEquivPolynomialWeight` supply the partition
   dictionary. Define `λ*ᵢ = −λₙ₋₁₋ᵢ` (`dualWeight`). For integral hives, the
   cyclic boundary triple (λ,μ,ν) has sum of all coordinates zero and counts
   invariants in `Vλ⊗Vμ⊗Vν`. The product coefficient for `Vγ` is the triple
   (λ,μ,γ*) (`productBoundary`). Rank 0 has one normalized empty hive and the
   empty dominant weight; statements using a last coordinate, interior face or
   regular boundary require positive rank.
2. The triangular lattice is `Δₙ = {(x,y,z) ∈ ℕ³ : x+y+z = n}` (`Vertex n`),
   with A=(n,0,0), B=(0,n,0), C=(0,0,n), normalization h(A)=0 and cyclic edge
   differences read A→B→C→A (`boundary`). Embed (x,y,z) at
   `(z+y/2, √3·y/2)`; A→B→C is **clockwise**. These are respectively Knutson–Tao's
   NW, NE and south sides read clockwise. The handout's counterclockwise triple,
   starting at A, is (ν*,μ*,λ*) for this roadmap's (λ,μ,ν). A unit rhombus has
   two **obtuse** corners on its short diagonal; require their sum ≥ the sum at
   the acute corners (`IsRhombus`, `Hive`). Thus the continuous interpolation
   affine on unit triangles is **concave** in the conventional mathematical
   sense; −h is convex. All three orientations are required. Unnormalized hives
   differ by an additive constant; adding an affine function preserves rhombus
   slacks and changes boundary weights. Keep this gauge action explicit. For
   forward differences `D_v h(p) = h(p+v) − h(p)` and **unit lattice edge
   directions** v, w, that is nonzero `v,w ∈ {0,±1}³` with coordinate sum 0
   satisfying `v·w = 1`, a hive satisfies `D_v D_w h(p) ≤ 0` whenever p, p+v,
   p+w, p+v+w lie in Δₙ (these four points are a unit rhombus with p+v, p+w its
   obtuse corners). The restriction to unit edges is necessary: on Δ₇ the hive
   `h(x,y,z) = 49 − x²` (unit-rhombus mixed differences 0 or −2) has, at
   p=(3,4,0) with the non-unit directions v=(2,−3,1), w=(−3,−1,4) of dot
   product 1, `D_v D_w h(p) = 45 − 24 − 49 + 40 = 12 > 0`. Edge dominance uses
   `a_i − a_(i−1)`. Prove these comparisons with the short-diagonal inequality.
   At n=2, the rhombus with short corners m_AB, m_CA has slack
   `h(m_AB) + h(m_CA) − h(A) − h(m_BC) = −(λ₂+μ₁+ν₂)`; its selected 0-positions
   are λ₁, μ₂, ν₁. This pins the chirality and sign dictionary.
3. Scalars are ℤ for counting and ℝ for polyhedra, with ℚ for rational
   witnesses. The ℤ→ℝ map commutes with all inequalities and boundaries. A real
   hive with integral boundary need not itself be integral, and its polytope
   need not have only integral vertices. Saturation asserts existence of an
   integral witness. Real hives form a convex cone; integer hives form an
   additive monoid, not a vector space. Finite fixed-boundary fibres are
   counted with `Nat.card` only after proving `Finite` (`hiveCount`,
   `finite_fixedIntegerHive`).
4. Native `TauCeti.IsConvexPolyhedron` and `IsPiecewiseAffineOn` supply finite
   affine-inequality cells, closedness, convexity, pasting, restriction and
   composition; the real cells and maps use these predicates. The finite
   rational elimination, exact dual certificate, face and lattice adapters that
   these declarations do not provide are built in §1.3.
5. Grassmannians are the rank-k subspace Grassmannian Grₖ(ℂᴺ), N = k+q, on the
   carrier `Submodule ℂ (Fin N → ℂ)` of TopologicalKTheory T1, with quotient
   rank q pinned; the native `Module.Grassmannian ℂ (Fin N → ℂ) (N−k)` is the
   set of submodules whose quotient is free of rank N−k, and §6.1 compares
   its points with the topological carrier. Chern-class signs use
   CharacteristicClasses' `c₁(O(1)) = +h`.
6. Hermitian spectra are sorted antitone (`nativeMatrixSpectrum`,
   `HasSpectrum`); a zero-sum triple A+B+C=0 has trace-zero spectral triple,
   and the sum-of-two convention uses (α,β,−reverse(γ)).
7. Type-A path crystals use X = ℤⁿ with αᵢ = eᵢ − eᵢ₊₁, coroot heights
   `H_i = π_i − π_(i+1)` and the central determinant direction; type A_(n−1)
   is used only for n ≥ 2, since n = 0 and the rank-1 torus have no simple-root
   operators. The tensor convention is Henriques–Kamnitzer's (§8.1).
8. Section references `§k.n` name the targets of Layer k below; "Layer k"
   names a whole layer.

## Exact supplier contracts

### From Mathlib

- `Matrix.IsTotallyUnimodular` and its submatrix API
  (`Mathlib/LinearAlgebra/Matrix/Determinant/TotallyUnimodular.lean`): every
  square submatrix has determinant 0 or ±1.
- `Matrix.IsHermitian.eigenvalues₀` (sorted), `eigenvalues₀_antitone`,
  `charpoly_eq` (`Mathlib/Analysis/Matrix/Spectrum.lean`) and
  `isSymmetric_toEuclideanLin_iff` (`Mathlib/Analysis/Matrix/Hermitian.lean`):
  the finite-dimensional spectral theorem for Hermitian matrices on the
  Euclidean coordinate space.
- `UnitAddTorus`, `UnitAddTorus.mFourier`, `mFourierCoeff`, `mFourierBasis`
  (`Mathlib/Analysis/Fourier/AddCircleMulti.lean`): the torus `(ℝ/ℤ)^r`, its
  characters `θ ↦ exp(2πi⟨a,θ⟩)` and Fourier coefficients.
- `TemperedDistribution` and its Fourier equivalence
  (`Mathlib/Analysis/Distribution/TemperedDistribution.lean`), `SchwartzMap`;
  the topology of `TemperedDistribution` is pointwise on Schwartz tests.
- `MeasureTheory.Measure.map`, `Measure.restrict` and `Measure.sum`
  (`Mathlib/MeasureTheory/Measure/Sum.lean`): pushforward, restriction and
  countable sums of measures.
- `ProperCone.hyperplane_separation'`
  (`Mathlib/Analysis/Convex/Cone/InnerDual.lean`) and finite-dimensional
  linear algebra: separation of a closed convex cone from a point.
- `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean`): the
  quotient-rank Grassmannian functor `G(k, M; R)`.
- `CoxeterSystem` (`Mathlib/GroupTheory/Coxeter/Basic.lean`) and `Equiv.Perm`:
  the symmetric group as a Coxeter group.
- `Finset`, `Fintype`, `Nat.card`, `MvPolynomial` and `finsum` (`∑ᶠ`) for the
  finite counts, chamber polynomials and finitely supported sums.

### From Tau Ceti

- `TauCeti.DominantWeight` with `shift`, `detShift`, `detShiftShape`, `shape`,
  `IsPolynomial`, `weightOfShape`, `shapeEquivPolynomialWeight` and
  `dominantWeightOf`
  (`TauCeti/RepresentationTheory/ClassicalGroups/DominantWeight.lean`):
  antitone integer weights, determinant shifts, the Young diagram of a
  polynomial weight (negative entries truncated to 0) and the dominant
  rearrangement of a weight.
- `TauCeti.rationalWeylRep`, `TauCeti.rationalWeylFDRep`,
  `TauCeti.isIrreducible_rationalWeylRep`, `TauCeti.simple_rationalWeylFDRep`
  and `TauCeti.char_rationalWeylRep`
  (`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Rational.lean`):
  for a dominant weight λ of GLₙ over a field of characteristic zero, the
  determinant twist `det^λₙ ⊗ 𝕊^μ(kⁿ)` of the Weyl module of the polynomial
  part μ = λ.detShiftShape, irreducible for every λ, bundled in
  `FDRep k (GL (Fin n) k)`, with its character. The pin does not identify
  `rationalWeylRep k n λ` with the irreducible representation of highest
  weight λ, nor prove that distinct weights give non-isomorphic
  representations; both belong to ClassicalGroups Layer 3, and §2.3's
  Hom-space headlines are stated on the native objects as they are.
- `TauCeti.GTPattern` with `entry`, `topRow`, `topWeight`
  (`TauCeti/RepresentationTheory/ClassicalGroups/GelfandTsetlin/Basic.lean`)
  and `TauCeti.gtPatternEquivSSYT` (`GelfandTsetlin/Tableau.lean`): signed
  Gelfand–Tsetlin patterns with zero-indexed columns and row length `j`, and
  their equivalence with bounded semistandard tableaux.
- `TauCeti.BoundedSSYT` (`TauCeti/Combinatorics/Young/Kostka.lean`),
  `TauCeti.rowInsert`, `TauCeti.reverseRowInsert`, `TauCeti.rowInsertEquiv`
  (`Young/Schensted.lean`), `SemistandardYoungTableau.benderKnuth`,
  `benderKnuth_involutive`, `content_benderKnuth` (`Young/BenderKnuth.lean`):
  bounded tableaux, row insertion and the Bender–Knuth involutions.
- `TauCeti.diagramSchurPoly` (the tableau sum, `RingTheory/MvPolynomial/Symmetric/Schur/Basic.lean`),
  `TauCeti.hsymm_mul_diagramSchurPoly` (horizontal Pieri, `Schur/Pieri.lean`),
  `TauCeti.schurPolyBasis` (`Schur/Basis.lean`) and
  `TauCeti.symmetricHomogeneousSubmodule` (`Symmetric/Homogeneous.lean`):
  finite-alphabet Schur polynomials and homogeneous symmetric polynomials.
- `TauCeti.IsConvexPolyhedron` (`TauCeti/Analysis/Convex/Polyhedron.lean`:
  finitely many continuous affine inequalities, no boundedness) and
  `IsPiecewiseAffineOn` (`TauCeti/Topology/PL/Map.lean`).
- `TauCeti.kostantPartition`, `TauCeti.IsKostantPartition`
  (`TauCeti/LinearAlgebra/RootSystem/KostantPartition/Basic.lean`),
  `TauCeti.kostantMultiplicity` (`KostantPartition/Multiplicity.lean`) and
  `TauCeti.posRoots` (`RootSystem/Positive.lean`): the generic Kostant
  partition function of a `RootPairing` with a base.
- `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`
  (`TauCeti/Algebra/Lie/HighestWeight/Weyl/Character.lean`),
  `TauCeti.weylNumerator` (`LinearAlgebra/RootSystem/Weyl/Numerator.lean`) and
  `TauCeti.formalCharacter_coeff_eq_kostantMultiplicity`
  (`Algebra/Lie/HighestWeight/KostantMultiplicity.lean`): the Weyl character
  formula and Kostant's multiplicity formula for Killing-semisimple Lie
  algebras; §2.3 specializes them to slₙ through the Cartan bridge of
  ClassicalGroups Layer 3.
- The Gordan, Stiemke and Tucker alternatives
  (`TauCeti/Geometry/Convex/Cone/Alternative.lean`).
- `TauCeti.SplitK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`).

### From TauCetiRoadmap.SchurWeyl

Layer 0 (partitions, dominance, standard tableaux) and Layer 7
(finite-alphabet Schur polynomials, Jacobi–Trudi, the finite Frobenius
characteristic and RSK). Its Layer 7 stops at finitely many variables and its
Layer 0 has no evacuation; the skew, Littlewood–Richardson, evacuation and
stable-ring layer that §§2.2–2.4, §6.5, §8.2 and §9.2 consume is asked of it
as the three gaps below, and no part of it is built here.

What SchurWeyl must provide (gap:skew-lr-tableaux): for diagrams
inner ≤ outer, semistandard skew tableaux of shape outer/inner with weakly
increasing rows and strictly increasing columns, their bounded versions with
entries below d, standard skew tableaux, and content counted as native
`SemistandardYoungTableau.content` counts it, with inverse conversions between
straight skew tableaux and `TauCeti.BoundedSSYT`; inward and reverse
jeu-de-taquin slides (into a hole, the smaller of the entries to the right and
below moves, the one below when equal) preserving semistandardness and
content, rectification and its independence of the order of slides, and Knuth
equivalence characterized by equality of insertion tableaux under
`TauCeti.rowInsert`; the skew Schur polynomial as the tableau sum, equal to
`TauCeti.diagramSchurPoly` on straight shapes; Littlewood–Richardson tableaux
of shape outer/inner and content ν, defined by the zero-indexed ballot
condition on the reading word (rows top to bottom, each right to left: every
prefix has at least as many letters k as letters k+1), their finiteness and
count `c^κ_(μ,ν)`, the tableau-product bijection between pairs of straight
bounded tableaux of shapes μ, ν and pairs (straight bounded tableau of shape
κ, Littlewood–Richardson tableau of shape κ/μ and content ν) with weights
adding, and the rule `s_μ s_ν = Σ_κ c^κ_(μ,ν) s_κ` in every finite alphabet
over every commutative semiring, with `c^κ_(μ,ν) = 0` unless μ ≤ κ and
|κ| = |μ|+|ν|, the symmetry `c^κ_(μ,ν) = c^κ_(ν,μ)` and the horizontal and
vertical Pieri specializations for ν = (r) and ν = (1^r), r = 0 included.

What SchurWeyl must provide (gap:standard-evacuation): Schützenberger
evacuation on standard tableaux of a straight shape (remove the entry 0,
rectify, record the vacated cell with the largest remaining label), an
involution preserving shape, corresponding under RSK to reversing and
complementing the word.

What SchurWeyl must provide (gap:stable-symmetric-ring): for a commutative
ring R, the graded ring Λ_R whose degree-n part is the R-module of compatible
families `(f_d)_(d∈ℕ)`, `f_d ∈ TauCeti.symmetricHomogeneousSubmodule (Fin d) R n`
with `f_d = aeval (Fin.snoc X 0) f_(d+1)`, with its R-algebra specialization
maps to every finite alphabet, the isomorphism of its degree-n part with the
degree-n symmetric polynomials in d ≥ n variables, the Schur basis `s_λ`
(λ ⊢ n) of each degree-n part built from `TauCeti.schurPolyBasis`, the stable
elementary and complete families, and the Littlewood–Richardson rule in Λ_R
with the coefficients `c^κ_(μ,ν)` above.

### From TauCetiRoadmap.ClassicalGroups

Layers 3–6: the highest-weight classification of rational GLₙ
representations on the native FDRep carrier, the Weyl character formula
specialized to GLₙ (characters are Schur polynomials, Layer 4), the
identification of Littlewood–Richardson structure constants with tensor
multiplicities (Layer 4), the slₙ Cartan bridge of Layer 3, and the
Gelfand–Tsetlin branching basis (Layer 6).

What ClassicalGroups must provide (gap:diagonal-overgroups): for n ≥ 2 the
closed connected complex Lie subgroups of GLₙ(ℂ)×GLₙ(ℂ) containing the
diagonal Δ are exactly Δ, the scalar-diagonal subgroup H_sc, the
determinant-equality subgroup H_det and the whole group, with H ↦ goursatFst H
an order isomorphism onto the normal subgroups of GLₙ(ℂ).

What ClassicalGroups must provide (gap:diagonal-overgroup-restrictions): the
external tensor product `V_λ⊠V_μ` restricted to Δ is `V_λ⊗V_μ`, restricted to
H_sc ≅ GLₙ(ℂ)×ℂˣ is `V_λ⊗V_μ` twisted by the character c ↦ c^|λ| of the second
factor, and restricted to H_det is irreducible, with the Hom-space
multiplicities transported along these isomorphisms.

### From TauCetiRoadmap.RootSystems

Layer 3 (Coxeter order and exchange for the symmetric group) and Layer 5 (the
`A r` realization in the sum-zero hyperplane of ℚ^(r+1)).

### From TauCetiRoadmap.SchubertGeometry

S4.1–5: the generic finite-root-data path-crystal category, rational PL
paths with their reparametrization equivalence, running-extremum root
operators, the LS-chain encoding of the straight-path component, central
transport, the dominant-path deformation theorem and the path tensor rule.
No tableau, hive, recurrence or Schubert-section statement is assumed of it.

### From TauCetiRoadmap.TopologicalKTheory

T1 (the finite rank-k complex subspace Grassmannian, its topology, charts and
tautological bundle) and T1.5 (its finite CW characteristic maps and the
rank-one partial-flag incidence construction).

### From TauCetiRoadmap.LieGroups

Layer 8: full flags, full-flag Bruhat cells and Borel–Weil with
`L_λ = G×_B ℂ_(−λ)`.

### From TauCetiRoadmap.ReductiveGroups

Layer 1 (rational representations as comodules and their subobjects and
quotients) and Layer 6 (characteristic-zero linear reductivity: complete
reducibility of finite-dimensional rational representations).

### From TauCetiRoadmap.AlgebraicTopology

Stages 2–6: relative singular and cellular homology, cup and Künneth
products, orientations and manifold duality.

### From TauCetiRoadmap.CharacteristicClasses

C2 (Thom, Euler and Gysin theory, Leray–Hirsch) and C3 (projective splitting
and integral Chern classes).

### From TauCetiRoadmap.ComplexKahlerGeometry

K5a (the generic smooth test-function and distribution carriers, density
duality and localization) and K7 (projective embeddings and their Kähler
structures, the Fubini–Study normalization).

### From TauCetiRoadmap.DifferentialGeometry

10.2: Sard's theorem through charts.

### From TauCetiRoadmap.PolarDecomposition

PD-A50–A53: eigenbasis quadratic form, Courant–Fischer, eigenvalue
monotonicity and the Weyl perturbation bound for finite symmetric
endomorphisms.

### From TauCetiRoadmap.HamiltonianReduction

R1 (smooth actions, moment maps, equivariance and products) and R2
(coadjoint orbits and KKS).

### From TauCetiRoadmap.ConvexityToric

T3: the compact chamber/quotient dictionary.

### From TauCetiRoadmap.GroebnerGeometry

G2: the exponent monoid, generated lattice and cone/saturation/Gordan
comparisons; its normalization, Proj and leading-volume theory stay there.

### From TauCetiRoadmap.CompactGroups

Layer 0: normalized torus Haar measure and averaging.

### From TauCetiRoadmap.PseudodifferentialOperators

Layer 3, §3.1: smooth periodic Fourier expansions and their rapid
derivative-seminorm decay on coordinate boxes.

### From TauCetiRoadmap.GrothendieckEulerForms

Layers 1–2: the generic split and exact Grothendieck groups and their
comparison.

## How to read the build

Layer 1
builds the lattice, hives, their polytopes and the finite rational polyhedron
adapters (§§1.1–1.4), then two independent generic lanes: pointed unimodular
counting (§1.5) and the rational cone series with Fourier boundary values and
lattice endpoints (§1.6); neither has a hive, character or Schubert premise.
Layer 2 compares hives with Gelfand–Tsetlin patterns and Littlewood–Richardson
tableaux, proves the tensor-multiplicity formulas, hive Pieri, the
representation ring and its hive multiplication, specializes §1.5 to the
type-A Kostant partition function (§2.6) and compares hive counts with the
diagonal overgroup restrictions (§2.7). Layer 3 builds the bounded octahedron
recurrence and the excavation associator, which gives hive-ring associativity
independently of Littlewood–Richardson counting; §2.5 uses it. Layer 4 builds
honeycombs, overlay, PRV and saturation. Layer 5 builds puzzles and the facet
theory of the boundary cone. Layer 6 builds the Grassmannian's Schubert
cohomology, the puzzle rule and multiplicity-one stretching, after §§6.1–6.7.
Layer 7 builds Hermitian spectra, the invariant-to-moment-zero bridge, the
real converse and the Horn recursion. Layer 8 specializes the generic path
engine to type-A coordinate paths and tableau crystals; its component and
tensor comparison precedes Layer 9's coherence comparison, while the
excavation and ring associativity of Layer 3 are independent of both. The
order of construction is Layer 1, §§2.1–2.4, Layer 3, §2.5, §§2.6–2.7,
Layers 4, 5, §§6.1–6.7, §6.8, Layer 7, Layer 8, Layer 9.

## Layer 1: lattices, rhombi, boundaries and finite polytope operations

### 1.1 The lattice, rhombi and hives

Give finite lattice and unit-triangle/edge/rhombus index types (`Vertex n`,
`IsRhombus`), coordinate extensionality, all three rotations and reflection.
State short/long diagonals arithmetically in barycentric coordinates (`sqDist`
2 on a unit edge and on the short diagonal, 6 on the long diagonal); prove the
Euclidean model agrees. Build real and integral normalized hives (`Hive n R`,
`IntegerHive n`, `RealHive n`), unnormalized/gauge comparisons, pointwise
addition and nonnegative scaling, zero/affine hives, restriction to lattice
subtriangles and the extension/interpolation map. Prove interpolation is
concave iff all rhombus inequalities hold, by the adjacent-triangle bending
test and line-segment subdivision. Boundary differences (`boundary`) are
antitone (`boundary_antitone`: the two unit rhombi sharing the triangle at an
edge point sum to the concavity of the three edge values), cyclic trace is
zero, and the boundary restriction is an actual linear map before restricting
to the hive cone. Export rotation/dualization effects with the dual-weight
involution `dualWeight` on the native carrier, and entry/boundary equality
lemmas (Knutson–Tao I, §2, and Appendix 2, Proposition 4, for the hive
dictionary). *Needs:* Tau
Ceti `TauCeti.DominantWeight`; Mathlib finite types and `Fin` arithmetic.

- `boundary_antitone`: for every hive with values in an ordered abelian group
  and every side, the edge differences are antitone, so each side of an
  integer hive is a `TauCeti.DominantWeight`.
- The cyclic trace `Σ_s Σ_i boundary h s i` is zero, since the three edge sums
  telescope around the triangle back to h(A) = 0.
- Pointwise sum and nonnegative scaling of hives are hives; the zero function
  is a hive with zero boundary.

**Checks.**

- For n = 2 the six points A, m_AB, B, m_BC, C, m_CA carry three unit rhombi,
  one per orientation. The values 0, 1, 1, 2, 2, 2 (clockwise from A) have
  boundary λ = (1,0), μ = (1,0), ν = (0,−2) and rhombus slacks 1, 0, 1, so they
  form the unique hive of the triple `((1,0),(1,0),(2,0)*)`, in agreement with
  Conventions item 2's slack `−(λ₂+μ₁+ν₂) = 1`.
- The values 0 everywhere except 1 at m_BC give slack −1 on the rhombus with
  short corners m_AB, m_CA: not a hive. Reversing the inequality (acute sum
  at least obtuse sum) would accept it and reject the hive above.
- n = 0 has one point, value 0, no rhombus and the empty boundary; n = 1 has
  three points, no rhombus, and every normalized labelling (0, b, c) is a hive
  with boundary (b, c−b, −c).

### 1.2 Fixed-boundary polytopes and finite fibres

Build equality/inequality matrix presentations over ℤ, ℚ and ℝ on the finite
coordinate spaces. Prove normalized real fixed-boundary fibres are closed
bounded convex polyhedra in the native sense, hence compact; prove explicit
entry bounds by summing rhombi along
lattice parallelograms. The same estimates uniformly bound fibres over a
bounded boundary set, giving properness of the boundary projection onto its
image. Prove normalized zero-boundary fibre = {0}. For integral fibres export
a finite instance (`finite_fixedIntegerHive`, hence `hiveCount`), a
bounding-box enumeration and decidable membership. Prove central-degree
conservation, the dominance bound γ ≤ λ+μ in product convention and the
lower-coordinate bound γₙ ≥ λₙ+μₙ. These bounds prove **finite output
support** for fixed λ, μ, independently of the representation theorem
(Knutson–Tao–Woodward, *A positive proof*, §2, for the hive polytope and its
boundedness; Knutson–Tao I, Appendix 2). *Needs:* §1.1; Tau Ceti `TauCeti.IsConvexPolyhedron`; Mathlib `Matrix`,
`IsCompact`.

- `finite_fixedIntegerHive`: every integral fixed-boundary fibre is finite.
- Every real fixed-boundary fibre is a compact convex polyhedron in the
  native sense.
- For fixed λ, μ only finitely many γ have a nonempty fibre.

**Checks.**

- Rank 2, λ = μ = (1,0), γ = (1,1): the boundary values are 0, 1, 1, 2, 2, 1,
  the three slacks are 0, 1, 0, and the fibre is the single hive, matching
  `c^(1,1)_((1),(1)) = 1`.
- Rank 2, λ = μ = (1,0), γ = (3,−1): γ₂ < λ₂+μ₂ = 0, so the lower-coordinate
  bound gives an empty fibre without enumeration; a bound using only the
  dominance γ ≤ λ+μ would not exclude it.
- The zero boundary has the single hive 0; the rank-0 fibre has one element
  for the empty boundary.

### 1.3 Finite rational polyhedron adapters

Build reusable finite rational polyhedron adapters: Fourier–Motzkin
projection with equality elimination, rational feasible witnesses for nonempty
rational fibres, clearing denominators, finite generation of rational cones
including lineality, faces/facets relative to their affine span, relative
interiors and finite supporting-halfspace descriptions. Consume the native
alternative and separation results; prove the finite matrix Farkas certificate
with both nonnegative inequality multipliers and unrestricted equality
multipliers. A valid boundary functional is a nonnegative sum of rhombus
slacks **modulo normalization and trace equalities**. Prove exactness of
projected cones; a closed-cone map defined using closure is insufficient by
itself. *Needs:* §1.2; Tau Ceti Gordan, Stiemke and Tucker alternatives;
Mathlib `ProperCone.hyperplane_separation'`.

**Checks.**

- The system x ≥ 0, x₁ + x₂ = −1 is infeasible, and the certificate with
  equality multiplier −1 and zero inequality multipliers exhibits 0 ≤ −1; a
  certificate form allowing only nonnegative equality multipliers cannot
  produce it.
- The polytope x, y ≥ 0, x + y = 1, 2x − y = 0 has the rational witness
  (1/3, 2/3), with denominator 3 cleared to the lattice point (1, 2) of the
  dilated polytope.
- Projecting the cone x ≥ 0, z ≥ 0, y ≤ x + z to the (x, y)-plane gives the
  closed half-plane x ≥ 0, and the boundary point (0, 5) lifts to (0, 5, 5):
  the projection is exact, not merely dense in its closure.
- The segment x₁ = 0, 0 ≤ x₂ ≤ 1 in ℝ² has dimension 1 and two facets, its
  endpoints; a facet notion taken relative to the ambient space would count
  four inequalities.

### 1.4 Largest-lift selections

For a rational polyhedron P and a linear projection with compact fibres,
build the largest-lift selection for a linear objective generic on the finite
fibre-edge directions. Prove existence/uniqueness, finite polyhedral chamber
decomposition, continuous piecewise-affine selection, coefficient extraction
from active systems, homogeneity for cones and compatibility on chamber walls.
Build the integer-coefficient piece comparison used by Layer 4; a rational
linear selection alone does not prove saturation. Prove a generic objective
exists in any nonempty open cone of admissible objectives by avoiding finitely
many hyperplanes. Export rational perturbations and dense relative interiors
(Knutson–Tao I, §5 for the largest-lift construction). *Needs:* §1.3; Tau Ceti
`IsPiecewiseAffineOn`.

**Checks.**

- P = {(b, x) : 0 ≤ x ≤ b, x ≤ 1} projected to b ≥ 0 with the objective x has
  the selection x = min(b, 1): two chambers [0,1] and [1,∞) with pieces b and
  1, agreeing at the wall b = 1.
- The same P with the objective −x has the selection x = 0 on one chamber.
- The zero objective is not generic: on b > 0 the fibre is a segment with no
  unique maximizer, so the selection is not defined.

### 1.5 Pointed unimodular vector-partition counting

Build **pointed unimodular vector-partition counting** on the same finite
integer matrix/lattice carriers. Let A : ℤ^m → ℤ^r have full row rank, with
ker(A_ℝ) ∩ ℝ^m_≥0 = {0}, and require every nonzero r×r column minor to be ±1
in the specified target lattice ℤ^r. Construct an integer functional h with
h(A_j) > 0 for every column, using the native strict
alternative and rational denominator clearing. For b ∈ ℤ^r define the actual
fibre `F_A(b) = {c ∈ ℕ^m : A c = b}` (`Fibre`), prove it finite before counting
(`count`), and identify it with the lattice points of
`P_A(b) = {x ∈ ℝ^m : x ≥ 0, A x = b}` (`realFibre`). Give explicit coordinate
bounds from h(b), a finite enumeration and decidable membership. P_A(b) is a
compact native `TauCeti.IsConvexPolyhedron`; its support is the rational column cone C_A
(`supportCone`). Prove count 0 = 1, count = 0 off C_A, and positivity on
C_A ∩ ℤ^r using integral basic feasible solutions. The full-minor hypothesis
is relative to the chosen lattice, not merely real linear independence.
Consume Mathlib `Matrix.IsTotallyUnimodular` and its submatrix API for the
stronger all-minor condition, and prove it implies this hypothesis. Reuse
GroebnerGeometry G2's exponent monoid, generated lattice and
cone/saturation/Gordan comparisons for the semigroup/lattice adapters. Count
PREIMAGES of the exponent map here, not distinct semigroup elements: G2's
graded semigroup Hilbert/Ehrhart count does not replace this fibre count.

Construct all invertible column bases B (`ColumnBasis`) and their cones
cone(A_B). Use §1.3 to build their common polyhedral refinement on C_A. An
explicit finite model is the arrangement of all coordinates of A_B⁻¹b
(`basisCoordinates`): intersect C_A with all closed sign halfspaces
(`chamberCell`), retain the full-dimensional cells (`Chamber`) and their faces,
and prove this refines every basis cone and, for full row rank, covers C_A,
each chamber a native convex polyhedron. Empty cells are discarded; duplicate presentations are
compared extensionally. For each closed full-dimensional chamber D construct
an actual p_D ∈ ℚ[b₁,…,b_r] of total degree at most m−r, and prove
|F_A(b)| = p_D(b) for EVERY b ∈ D ∩ ℤ^r, including support faces and internal
walls (`exists_chamberPolynomial`; De Loera–Sturmfels, Theorem 1.1;
Billey–Guillemin–Rassart, §1.3). Export coefficient/evaluation, change of row
lattice basis and column permutation APIs, uniqueness of the full-dimensional
constituent, and independence of the positive height witness or a refining
chamber presentation. On an intersection of two such chambers prove equality
of the restricted polynomials as real polynomial functions
(`chamberPolynomial_wall`; De Loera–Sturmfels, end of §3). Outside C_A the
count is separately zero; no gluing with that exterior value at a support
facet or the origin is asserted. Relative open face strata inherit the common
restriction; intersections and lower-dimensional parameter slices retain their
actual affine lattice rather than counting all ambient points.

Own the enumeration proof, not only an interpolation oracle: construct
multivariate lattice generating functions for pointed rational cones, finite
fundamental-parallelepiped enumeration and unimodular cone series; prove the
polytope tangent-cone valuation and its rational-function specialization
(Beck–Haase–Sottile for the cone-valuation conventions). For a generic chamber
the vertices are the feasible basic solutions, integral by A_B⁻¹, and their
tangent lattices have the explicit basis `e_j − Σ_i (A_B⁻¹A_j)_i e_(B_i)`.
Prove the resulting finite rational expression counts the fibre. Choose an
auxiliary covector nonzero on its finitely many edge directions, substitute
monomial exponentials and take the constant Laurent coefficient; construct
the truncated rational Todd factors and prove pole cancellation and the degree
bound m−r. Include the non-simple/degenerate tangent-cone valuation and
specialization to CLOSED chamber walls, with no double counting of coincident
vertices. Establish the boundary specialization identities before using them
to extend an interior formula; evaluation at a perturbed right-hand side is
not itself a lattice-point bijection. These cone/valuation/specialization
lemmas are construction targets here, using §1.3's finite polyhedral and
lattice API, without a toric Riemann–Roch, Schubert or hive-saturation
premise. The empty r = m = 0 system has one point and constant polynomial 1.
Positive height excludes nonempty zero-column systems at r = 0. Repeated
nonzero columns are allowed. Without unimodularity, [2] has the parity count
on the positive ray; do not replace the theorem by an unconditional ordinary
polynomial statement for every integer matrix. *Needs:* §1.3; Mathlib
`Matrix.IsTotallyUnimodular`; Tau Ceti `TauCeti.IsConvexPolyhedron`;
GroebnerGeometry G2.

- A pointed column cone has an integral covector positive on every column.
- Under a positive height every fibre is finite and every real fibre compact.
- `exists_chamberPolynomial`: for full row rank, unit maximal minors and a
  positive height, each closed chamber carries a rational polynomial of total
  degree at most m−r evaluating to the count at every lattice point of the
  chamber.
- `chamberPolynomial_wall`: two such polynomials agree as real functions on
  the intersection of their chambers.

**Checks.**

- The 1×1 matrix [1]: count(b) = 1 for b ≥ 0 and 0 otherwise, a polynomial of
  degree 0 = m−r on the single chamber.
- The A2 list with columns e₁, e₂, e₁+e₂: for c = (a, b) the solutions are
  (a−z, b−z, z) with 0 ≤ z ≤ min(a,b), so the count is min(a,b)+1 on the
  quadrant and 0 outside; the two closed chambers a ≤ b and b ≤ a carry the
  polynomials a+1 and b+1, which agree on the wall a = b; at the origin the
  value is 1 and the exterior value 0 does not glue.
- The 1×1 matrix [2] is not unimodular: count(b) is 1 for even b ≥ 0 and 0
  for odd b, which no polynomial represents, so the unit-minor hypothesis
  cannot be dropped.
- The empty system r = m = 0 has count 1; a system with r = 0 and one zero
  column has no positive height and infinitely many solutions.

### 1.6 Rational cone series, Fourier boundary values and lattice endpoints

Use §1.3 and §1.5's actual finite lattice, integer matrix, solution fibre,
cone valuation and rational generating-function constructions. This target
builds their Fourier and boundary-value comparisons. §2.6 supplies the type-A
root-coordinate specialization afterwards. It has no hive, Schubert,
symplectic reduction, character-theoretic or index-theorem premise. Consume
CompactGroups' normalized torus Haar/character conventions, Mathlib's
`UnitAddTorus`, `UnitAddTorus.mFourier`, `mFourierCoeff`, `mFourierBasis`,
`TemperedDistribution` and its Fourier equivalence. The generic smooth-test
and distribution carriers, density duality and localization belong to
ComplexKahlerGeometry K5a. Consume the smooth periodic Fourier expansion and
rapid derivative-seminorm decay of PseudodifferentialOperators Layer 3 §3.1.
Here build the finite-lattice/cone comparisons on those carriers, not a second
distribution, Haar or smooth-section foundation. Conventions for the
polarization, directional boundary and cone valuation follow De
Concini–Procesi–Vergne §§1–3, Lenz §2.2 and Beck–Haase–Sottile.

**Categories and chosen expansions.** Put L = ℤ^r, V = L⊗ℝ with specified
lattice basis and covolume-one Lebesgue measure, and T = Hom(L, ℝ/ℤ),
represented by native `UnitAddTorus (Fin r)`. Write `z^a(θ) = exp(2πi⟨a,θ⟩)`.
Build the evaluation of ℂ[L] in continuous torus functions and identify its
coefficient map with native `mFourierCoeff`. Keep this finite group algebra,
its fraction field/localization, functions L → ℂ with coefficientwise
addition, and distributions on T as different objects. All lattice-basis
changes have explicit dual torus maps, Haar preservation and Fourier
coefficient equations. For a finite list X = (a_j) of nonzero lattice vectors,
choose a real linear functional h nonzero on every a_j. Let
B = {j : h(a_j) < 0}, replace a_j by `a_j^h = sign(h(a_j)) a_j`, and set
`s_h = −Σ_(j∈B) a_j`. Prove the polarized coefficient function is

`P_X^h(b) = (−1)^|B| · #{c ∈ ℕ^m : Σ c_j a_j^h = b − s_h}`

(`polarizedCoefficient`, with `negativeColumns`, `polarizedMatrix`,
`polarizationShift`). A regular height gives finiteness of the polarized
fibres and a polynomial growth bound of degree at most m on the coefficients;
construct an integral positive height on the same rational open chamber when
needed for §1.5's enumeration. Prove invariance under h within a chamber, list
permutation, lattice change, monomial translation, direct sum and repeated
vectors. Its expansion represents `∏(1 − z^(a_j))⁻¹` in the localization.
Each flipped factor is `−Σ_(n≥1) z^(−n a_j)`, not a closed negative ray
starting at n = 0. Construct the ring of series supported in a translate of a
finitely generated h-positive lattice cone, prove coefficientwise convolution
finite and its unit/geometric inverse laws, and construct the localization map
into this ring. Use a single h and a common finite denominator list for
rational identities. General bilateral coefficient functions form only the
natural Laurent-polynomial module here; their unrestricted convolution is not
a ring operation. §1.5's rational cone valuation is not re-proved or
identified with an injective map on all bilateral series. *Needs:* §1.5;
Mathlib `UnitAddTorus`, `UnitAddTorus.mFourier`, `mFourierCoeff`,
`FractionRing`; CompactGroups Layer 0.

**Fourier and Abel boundary comparison.** For any polynomial-growth
coefficient function c on L construct the torus distribution with pairing
`⟨Θ(c), φ⟩ = Σ_b c(b) φ̂(−b)` using the rapid decay of PseudodifferentialOperators
§3.1, with all continuity seminorm estimates and uniqueness. Compare it to
the periodic distribution on V obtained as the inverse native Fourier
transform of the tempered weighted lattice distribution `Σ_b c(b) δ_b`, whose
construction as a `TemperedDistribution` is a target here, with the absolute
pairing bound of polynomial-growth coefficients against Schwartz functions as
its first step. Prove this last sum in
Schwartz duality, periodization of tests, torus descent/pullback and equality
of the two constructions, including the sign and 2π conversion. No new
topology is silently placed on native `TemperedDistribution`, whose topology
is pointwise on Schwartz tests; state separately convergence in the
compact-manifold test dual supplied by K5a. For c = P_X^h, prove absolute
locally uniform convergence after multiplying coefficient b by exp(−εh(b)),
ε > 0 (`abelSeries`, `polarized_abel_summable`), and identify the sum with the
actual rational function at `z^a = exp(2πi⟨a,θ⟩ − εh(a))`
(`polarized_abel_rational`). Its ε ↓ 0 limit is Θ(c) in test duality. Prove the
result for finite monomial translates and finite linear combinations, with
uniform polynomial bounds permitting the limit. Away from the subtori
`z^(a_j) = 1` the limit is the ordinary smooth rational function. This
supplies boundary values, not a globally integrable rational function or a
definition by pointwise restriction at its poles. Prove Laurent-polynomial
multiplication corresponds to coefficient shifts and finite differences.
Denominator-clearing alone does not determine a distributional solution:
multiplication by `1 − z^a` has a kernel. For two h chambers prove their
boundary values agree off the polar subtori, give the exact single-factor
wall-crossing delta-comb formula and its finite-list coefficient/convolution
version on the common pointed supports, then obtain general wall crossing by
a generic path crossing one hyperplane at a time. When factors are dependent,
prove all support/properness conditions before using convolution or
multiplication; do not multiply arbitrary distributions or treat a product of
singular boundary values as automatically defined. If a rational expression
is a Laurent polynomial, its common-h expansion is that finite coefficient
function and its boundary distribution is the ordinary torus polynomial for
every regular h. Prove this by the chosen series localization map before
applying Fourier uniqueness, not by cancelling a denominator in the
distribution space. *Needs:* the expansions above; Mathlib
`TemperedDistribution`, `SchwartzMap`, `UnitAddTorus.mFourierBasis`;
ComplexKahlerGeometry K5a; PseudodifferentialOperators Layer 3 §3.1.

**Continuous versus discrete cones.** For a positive-height spanning list X,
define the actual pushforwards of Lebesgue measure on [0,1]^m and ℝ_≥0^m
under `(t_j) ↦ Σ t_j a_j` (`boxMap`): the compact box measure B_X
(`boxMeasure`) and the locally finite cone measure T_X (`coneMeasure`). Prove
tempered growth, support, pushforward/test-pairing formulas, convolution,
deletion/directional derivative and difference laws, and their transforms.
Use the native negative-2π Fourier phase:

`F(B_X)(ξ) = ∏_j (1 − exp(−2πi⟨a_j,ξ⟩)) / (2πi⟨a_j,ξ⟩)`,

with the removable value 1 for each zero pairing. Prove the Laplace/Abel
regularization for T_X with factors `(εh(a_j) + 2πi⟨a_j,ξ⟩)⁻¹`. Tiling the
orthant by half-open cubes gives the actual measure identity
`T_X = Σ_b P_X(b) · translate_b B_X` (`coneMeasure_eq_sum`); prove local
finiteness on compact supports and the Schwartz estimates, not an unjustified
exchange of infinite sums. For an arbitrary nonzero list with regular h,
define its polarized continuous cone distribution as `T_X^h = (−1)^|B| T_(X^h)`
with NO lattice offset, and prove `B_X *_d P_X^h = T_X^h`. Indeed the negative
interval factors translate B_(X^h) by Σ_B a_j while the discrete polarization
translates its count by the opposite vector; construct these translation maps
and cancellation explicitly. Thus the discrete endpoint shift and continuous
orientation sign have distinct roles even for mixed root directions in a
fixed-point Weyl term. Construct densities on the span, piecewise polynomial
formulae on the admissible hyperplane arrangement and the lattice-normalized
fibre-volume comparison. Rank-deficient lists are treated in their actual
saturated span and pushed forward, rather than assigned an ambient density;
the empty list has δ₀ and count δ₀. Zero columns are excluded from
infinite-ray counting. *Needs:* the expansions and boundary comparison above;
Mathlib `MeasureTheory.Measure.map`, `Measure.sum`, `TemperedDistribution`.

**Endpoint reconstruction.** Build the finite admissible central hyperplane
arrangement and its locally finite affine lattice-translate arrangement.
Prove local finiteness from the rational hyperplane directions and the
specified lattice, and give finite enumeration and restriction on each bounded
region. Construct the global alcoves, polynomial pieces and directional
lattice restriction, with compatible bounded-stage presentations preserving
the global translation and refinement laws for every lattice translate: choose
an alcove c with 0 in its closure inside the zonotope, and evaluate the
polynomial on b+c at b. Keep piecewise differentiation separate from
distributional differentiation; for B_[1], the latter is δ₀ − δ₁ while the
former is zero. Supply well-definedness, translation and refinement laws and
independence whenever the differentiated function is continuous. The infinite
formal Todd symbol acts on each finite-degree polynomial through its finite
jet, not as an unproved convergent differential operator on all
distributions. For spanning unimodular X in its specified lattice prove

`c-limit (Todd(X)_pw (B_X *_d K)) = K`

for every coefficient function K : L → ℂ; here
`Todd(X) = ∏ ∂_a / (1 − exp(−∂_a))`, the convolution is locally finite because
B_X is compact, and c has the stated zonotope condition. Build the requisite
finite polynomial/difference solution spaces, cocircuit equations,
interpolation on translated zonotope lattice sets and their
deletion/contraction or equivalent constructive proof before this inversion
(De Concini–Procesi–Vergne §§1–3; Lenz §2.2). Combine with the cone identity
for the exact directional evaluation of P_X, including support facets and the
origin. For shifted Todd `exp(−∂_z) Todd` retain the compatible translated
alcove/lattice window; prove its domain rather than allowing arbitrary
boundary z and any closed support chamber. A polynomial piece evaluated at b
is not evaluation at a perturbed lattice point. For general spanning
positive-height integer lists build the finite toric vertex set
`{g ∈ T : X^g = {a ∈ X : g^a = 1} spans V}` and prove its finiteness using
full-rank column determinants. Construct the finite-dimensional
difference/differential spaces and the character-twisted finite-jet inverses
of `1 − g^(−a) exp(−∂_a)` when `g^a ≠ 1`. Prove the reconstruction

`P_X(b) = Σ_g g^b · c-limit [Todd(X^g)_pw · ∏_(a∉X^g) (1 − g^(−a) exp(−∂_a))⁻¹_pw T_(X^g)](b)`

with c a small alcove inside Cone(X) adjoining 0, all operators defined on the
actual polynomial pieces. Give the finite coefficient formula and
quasipolynomial constituent/period comparison. The unimodular case has only
g = 1. This does not replace §1.5's already-owned chamber-counting theorem;
prove agreement with its actual coefficient polynomials and face restrictions.
In particular [2] has a parity count and a nontrivial toric contribution;
dropping it does not give an ordinary polynomial formula. *Needs:* the three
parts above, §1.5; Mathlib `MvPolynomial`.

**Terminal boundary examples.** The four parts above have no
character-theoretic premise; §2.6 transports the construction through its
type-A positive-root matrix and native Kostant partition equivalence, and the
composition with the Weyl character formula, with its GL₂, SU₂ and A₂ character
examples, is made by that composition's owner and not here. Half-sum roots,
polarization shifts, infinitesimal alcove displacements and half-open endpoint
offsets are different data with their own maps; none is identified by notation
alone. *Needs:* the four parts above.

- Under a regular height the polarized fibres are finite and the
  coefficients grow at most polynomially of degree the number of columns.
- A polynomial-growth coefficient function pairs absolutely with every
  Schwartz function on the lattice points.
- `polarized_abel_summable`, `polarized_abel_rational`: for a regular height
  and ε > 0 the polarized Abel series converges absolutely to
  `∏_j (1 − exp(−εh(a_j)) z^(a_j)(θ))⁻¹`.
- `coneMeasure_eq_sum`: for a positive-height list the cone measure is the sum
  over lattice points of the count times the translated box measure.

**Checks.**

- Rank one, X = (1): with h > 0 the coefficient function is the closed positive
  ray `[b ≥ 0]`; with h < 0 it is `−[b < 0]`, the open negative ray with sign,
  since B = {1}, s_h = −1 and `P^h(b) = −#{c ≥ 0 : −c = b+1}`. The two differ
  by the constant function 1, whose boundary distribution is the delta comb at
  z = 1: this is the single-factor wall-crossing formula. A convention using a
  closed negative ray would give `−[b ≤ 0]` and a wrong comb.
- A2 with columns e₁, e₂, e₁+e₂: P(a,b) = min(a,b)+1 on the nonnegative
  quadrant, and the cone density T(a,b) = min(a,b) there in lattice-normalized
  measure (the length of {t₃ : 0 ≤ t₃ ≤ min(a,b)}); both agree on the internal
  wall a = b and jump to the exterior value 0 across the support boundary.
- X = (2): P(b) is 1 for even b ≥ 0 and 0 otherwise; the toric vertex set is
  {0, 1/2} ⊂ ℝ/ℤ, and the reconstruction has two summands, one per vertex.
  Dropping the vertex 1/2 gives the non-integer value 1/2 at every b ≥ 0.
- The empty list has T = δ₀ and P = δ₀; B_[1] is Lebesgue measure on [0,1]
  with distributional derivative δ₀ − δ₁ and piecewise derivative 0; the
  rank-one closed interval [0,N] has four endpoint variants (both ends open or
  closed) whose coefficient functions differ at b = 0 and b = N only.

### Examples

The rank-2 hive of §1.1's first Check and the A2 counts of §1.5 and §1.6 are
the running examples: the same A2 list reappears in §2.6 as the type A₂
positive-root matrix, where min(a,b)+1 is the Kostant partition function.

### Dependencies

Tau Ceti `TauCeti.DominantWeight`, `TauCeti.IsConvexPolyhedron`,
`IsPiecewiseAffineOn` and the cone alternatives; Mathlib
`Matrix.IsTotallyUnimodular`, `ProperCone.hyperplane_separation'`,
`UnitAddTorus`, `TemperedDistribution`, `SchwartzMap`, `Measure.sum`;
GroebnerGeometry G2; CompactGroups Layer 0; ComplexKahlerGeometry K5a;
PseudodifferentialOperators Layer 3. No earlier layer.

## Layer 2: native Gelfand–Tsetlin and Littlewood–Richardson comparisons and the hive ring

### 2.1 The hive-to-Gelfand–Tsetlin difference map and its reconstruction

Define the directional finite-difference map from a hive to native signed
`TauCeti.GTPattern n`. A convenient equivalent chart is h(i,j), 0 ≤ i ≤ j ≤ n:
`h(0,j) = Σ_(r≤j) λ_r`, `h(j,j) = Σ_(r≤j) γ_r`, `h(i,n) = |λ| + Σ_(r≤i) μ_r`,
with `h(0,0) = 0`, in product convention. Specify and prove its rotation/gauge
conversion with §1.1's cyclic triple. The chart map is `(i,j) ↦ (n−j, j−i, i)`
in §1.1's coordinates. Pin the actual difference map in this chart. Write
native entries with zero-indexed columns and row length j:
`P.entry(i,j) = h(i+1,j) − h(i,j)` for `0 ≤ i < j ≤ n`, and zero elsewhere. Its
native `topRow` is μ. Put `S_j = Σ_(i<j) P.entry(i,j)`, with `S_0 = 0`; the
weight is `wt(P)_r = S_r − S_(r−1) = γ_r − λ_r` for `1 ≤ r ≤ n` (`gtRowWeight`).
Prove the inverse formula

`h(i,j) = Σ_(r=1..j) λ_r + Σ_(k<i) P.entry(k,j)`

(`gtBoundaryPrefix`, `gtCompletion`). These formulas pin the boundary and
native off-triangle conventions. For `0 ≤ i < j < n`, the two
Gelfand–Tsetlin rhombus families are respectively
`h(i,j) + h(i+1,j+1) ≥ h(i+1,j) + h(i,j+1)` and
`h(i+1,j) + h(i+1,j+1) ≥ h(i,j) + h(i+2,j+1)`. They give exactly
`P.entry(i,j+1) ≥ P.entry(i,j) ≥ P.entry(i+1,j+1)`. The remaining family, for
`0 ≤ i ≤ j` and `j+2 ≤ n`, is `h(i,j+1) + h(i+1,j+1) ≥ h(i,j) + h(i+1,j+2)`.
After reconstruction it is precisely

`λ_(j+1) − λ_(j+2) + Σ_(k<i) (P.entry(k,j+1) − P.entry(k,j)) ≥ Σ_(k≤i) (P.entry(k,j+2) − P.entry(k,j+1))`.

Construct the equivalence between fixed-boundary hives and the native
Gelfand–Tsetlin fibre with top row μ, weight γ−λ and these remaining
inequalities (`gt_reconstruction_iff`); prove both inverse laws from the
displayed formulas. Do not replace this image condition by equality of
counts. Reproduce the handout's top-row λ and weight μ*−ν statement in its
own cyclic orientation, with the explicit orientation/dual conversion to this
product chart (Henriques–Kamnitzer, Theorem 7.4, in the quasi-hive form). In
this chart a sufficient uniform gap is on the input λ:
`λ_r − λ_(r+1) ≥ μ_1 − μ_n` for every `1 ≤ r < n`. Prove that it makes the
remaining family automatic (`gt_completion_of_uniform_input_gap`): its added
left sum is nonnegative, and its right sum is at most
`Σ_(k≤i) (P.entry(k,j+2) − P.entry(k+1,j+2)) = P.entry(0,j+2) − P.entry(i+1,j+2) ≤ μ_1 − μ_n`.
Thus the same difference/reconstruction maps give an equivalence with the
whole weight-(γ−λ) Gelfand–Tsetlin fibre over μ (`exists_stable_gt_equiv`).
This input-gap construction and §2.3's output-gap multiplicity statement
retain their different hypotheses. For n = 1 the rhombus and gap families are
empty; for n = 0 use the unique empty pattern and normalized hive, without
first/last entries. *Needs:* §1.1, §1.2; Tau Ceti `TauCeti.GTPattern`,
`TauCeti.GTPattern.topRow`; ClassicalGroups Layer 6.

- `gt_reconstruction_iff`: for a pattern with top row μ and weight γ−λ, a hive
  with boundary (λ,μ,γ*) whose values are the chart completion of the pattern
  exists exactly when the remaining rhombus family holds on the completion.
- `gt_completion_of_uniform_input_gap`: under the uniform input gap the
  remaining family holds for every pattern with top row μ.
- `exists_stable_gt_equiv`: under the uniform input gap the fibre of hives is
  equivalent to the weight-(γ−λ) pattern fibre over μ, with the chart
  completion as inverse-entry law.

**Checks.**

- n = 2: the remaining family is the single inequality `γ₁ ≥ λ₂ + μ₁`. For
  λ = (0,0), μ = (2,0) the patterns with top row (2,0) and dominant weight are
  two (weights (2,0) and (1,1)) while the hives are one (`V_0 ⊗ V_(2,0) =
  V_(2,0)`); the inequality rejects γ = (1,1), and the gap hypothesis
  `λ₁ − λ₂ = 0 ≥ μ₁ − μ₂ = 2` fails. An equivalence onto the whole weight fibre
  would count two.
- n = 2, λ = μ = (2,0): the gap holds, the three patterns with top row (2,0)
  have weights (2,0), (1,1), (0,2) and give γ = (4,0), (3,1), (2,2), and each
  has exactly one hive, matching the Clebsch–Gordan range.
- n = 3, λ = 0, μ = (1,0,−1), γ = 0: the weight-0 fibre over μ has two patterns
  (the zero weight of the adjoint has multiplicity 2) and there is no hive,
  since `c^0_(0,μ) = 0`; the gap `0 ≥ 2` fails.
- n = 1 and n = 0: the families are empty and the single hive corresponds to
  the single pattern with top row μ.

### 2.2 The hive-to-Littlewood–Richardson equivalence

Build the explicit hive-to-LR equivalence onto the Littlewood–Richardson
tableaux of shape γ/λ and content μ that SchurWeyl provides
(gap:skew-lr-tableaux). In the product chart write `a_(i,j)` for the number of zero-indexed letter i−1 in
skew row j−1. Its forward map is
`h(i,j) = Σ_(r≤j) λ_r + Σ_(k≤i) Σ_(k≤r≤j) a_(k,r)`. For i < j the inverse takes
the mixed difference `a_(i,j) = h(i,j) − h(i−1,j) − h(i,j−1) + h(i−1,j−1)`; on
the diagonal use `a_(i,i) = h(i,i) − h(i−1,i)`. Prove LR entries in row j are
≤ j, nonnegativity including the diagonal, semistandard inequalities, ballot
prefix inequalities and their equivalence to the three rhombus families.
Recover each row by weakly sorting its entries, prove both inverses, content,
boundary and integrality, including empty diagrams/zero strips. For arbitrary
signed weights use explicit affine determinant shifts making all three
product weights polynomial; prove the answer is independent of shifts and
compatible with the native shape carrier. This is a bijection of **objects**,
not just equality of cardinalities (Knutson–Tao I, Appendix 2; Buch, Theorem
3.18 for the tableau side). *Needs:* §1.1; SchurWeyl gap:skew-lr-tableaux;
Tau Ceti `TauCeti.DominantWeight.shift`,
`TauCeti.DominantWeight.detShiftShape`.

**Checks.**

- Rank 2, λ = μ = (1,0), γ = (1,1): the one LR tableau of shape (1,1)/(1) and
  content (1) has `a_(1,2) = 1`, and the forward map gives `h(1,1) = λ₁ = 1 = γ₁`
  and `h(1,2) = |λ| + a_(1,2) = 2 = |λ| + μ₁`, the hive of §1.2's first Check.
- Rank 3, the triples `((1),(1),(2)*)` and `((2,1),(2,1),(3,2,1)*)` have hive
  counts 1 and 2, the values `c^(2)_((1),(1)) = 1` and
  `c^(3,2,1)_((2,1),(2,1)) = 2` of the Littlewood–Richardson rule: the three
  boxes of (3,2,1)/(2,1) are pairwise unrelated, the three fillings with
  content (2,1) have reading words 001, 010 and 100, and the ballot condition
  rejects 100. A count without the ballot condition would give 3 and one
  requiring an increasing reading word would give 1, so the equivalence must
  carry exactly the ballot inequalities to the third rhombus family.
- λ = (1,0), μ = (0,−1), γ = (0,0) in rank 2: shifting μ and γ by the
  determinant gives `((1,0),(1,0),(1,1))` with one hive, so the signed count is
  1 (`V ⊗ V*` contains the trivial representation once); a definition that
  truncated negative entries to 0 instead of shifting would compare with
  `((1,0),(0,0),(0,0))`, which has no hive.

### 2.3 Tensor multiplicities, invariants and the type-A Steinberg adapter

Consume the Littlewood–Richardson rule SchurWeyl provides
(gap:skew-lr-tableaux) and ClassicalGroups Layer 4's identification of Schur
structure constants with tensor multiplicities to prove the invariant
dimension and tensor-multiplicity hive formulas: for polynomial λ, μ the
product of Schur polynomials in n variables expands with hive counts as
coefficients (`schur_mul_eq_finsum_hiveCount`); on the native rational Weyl
modules `TauCeti.rationalWeylFDRep ℂ n ·`, the dimension of the intertwiner
space from `Vγ` to `Vλ ⊗ Vμ` is the hive count of (λ,μ,γ*)
(`finrank_hom_eq_hiveCount`), and the count of the cyclic triple (λ,μ,ν) is
the dimension of the invariants `dim (Vλ⊗Vμ⊗Vν)^GLₙ`, the intertwiner space
from the unit object (`finrank_invariants_eq_hiveCount`); the Hom-space
dimensions are multiplicities by ReductiveGroups Layer 6's complete
reducibility and Schur's lemma on the simple objects
`TauCeti.simple_rationalWeylFDRep` (Knutson–Tao–Woodward, *A positive proof*,
Theorem 1; Knutson–Tao I, Theorem 4 with Appendix 2). Prove affine determinant-shift
covariance, cyclic/dual symmetry, symmetry in the two inputs (`hiveCount_comm`),
and coefficient change/stable finite-alphabet compatibility. In the handout's
own cyclic convention (λ,μ,ν), the hive count is the product coefficient
`c^π_(λ,ν)` with output weight `π = μ*`, and the Gelfand–Tsetlin fibre has top
row λ and weight `μ* − ν`. If every adjacent gap of μ satisfies
`μ_j − μ_(j+1) ≥ λ₁ − λₙ` (equivalently `π_i − π_(i+1) ≥ λ₁ − λₙ` for π = μ*,
since dualization reverses the adjacent gaps), prove the directional
Gelfand–Tsetlin injection is onto that weight fibre; the third rhombus family
follows from that uniform gap. The gap hypothesis is on the output weight
π = μ*, not on λ. Without it surjectivity fails, as §2.1's third Check shows.
Build the type-A Steinberg alternating formula by dominant-coefficient
extraction in the Weyl-denominator tensor character, using ClassicalGroups
Layer 4's Weyl character formula for GLₙ and the native
`TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` through the
slₙ Cartan bridge of ClassicalGroups Layer 3, and identify the same weight
multiplicity through this adapter. State the input/output permutation and
dual signs, and treat n = 1 separately. Prove the quasi-Gelfand–Tsetlin/
positive-root partition limit after setting `x_(k,i) = entry_(k,i) − λ_i` on the
long-row λ pattern (so `x_(n,i) = 0`): retain `x_(k+1,i) ≥ x_(k,i)` and drop
`x_(k,i) + λ_i ≥ x_(k+1,i+1) + λ_(i+1)`. The row differences are the
nonnegative coefficients of `e_i − e_j` and telescope to `λ − wt`. For a fixed
positive-root sum ζ this dropping is exact whenever every adjacent λ gap is at
least the sum of its nonnegative simple-root coordinates: each positive-root
coefficient is bounded by this height, so the unused inequalities hold
automatically. State the finite ζ-weight-fibre equivalence with that
threshold, not a limit of all fibres simultaneously. Consume RootSystems'
type-A realization and ClassicalGroups Layer 3's weight dictionary. Map
ζ ∈ ℤⁿ with sum 0 into that root model by
`ζ = Σ_(k<n) (Σ_(i≤k) ζ_i)(e_k − e_(k+1))`; prove injectivity, positive-root
indexing `(i,j) ↦ e_i − e_j` and base/pairing compatibility. For GLₙ with
n ≥ 2 use RootSystems' `A (n−1)` in the sum-zero hyperplane of ℚⁿ: its `A r`
convention uses ℚ^(r+1). Compare this map with native
`TauCeti.kostantPartition P b` and `TauCeti.kostantMultiplicity` using this
specified RootPairing/Base, through the native
`TauCeti.formalCharacter_coeff_eq_kostantMultiplicity`; the n = 1 empty-root
partition is handled separately. The source's negative weight is the
re-centered weight. *Needs:* §2.2, §1.2; SchurWeyl gap:skew-lr-tableaux;
ClassicalGroups Layers 3–4; ReductiveGroups Layer 6;
RootSystems Layer 5; Tau Ceti `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`,
`TauCeti.formalCharacter_coeff_eq_kostantMultiplicity`,
`TauCeti.kostantPartition`, `TauCeti.kostantMultiplicity`,
`TauCeti.rationalWeylFDRep`, `TauCeti.simple_rationalWeylFDRep`.

- `schur_mul_eq_finsum_hiveCount`: for polynomial dominant weights λ, μ of
  GLₙ, `s_λ s_μ = Σᶠ_γ hiveCount(λ,μ,γ*) s_γ` in n variables, the sum over all
  dominant weights γ of GLₙ having finite support.
- `finrank_hom_eq_hiveCount`: for all dominant weights λ, μ, γ of GLₙ, the
  complex dimension of the space of morphisms
  `rationalWeylFDRep ℂ n γ ⟶ rationalWeylFDRep ℂ n λ ⊗ rationalWeylFDRep ℂ n μ`
  in `FDRep ℂ (GL (Fin n) ℂ)` is `hiveCount(λ,μ,γ*)`.
- `finrank_invariants_eq_hiveCount`: for all dominant weights λ, μ, ν of GLₙ,
  the complex dimension of the morphisms from the unit object to
  `rationalWeylFDRep ℂ n λ ⊗ rationalWeylFDRep ℂ n μ ⊗ rationalWeylFDRep ℂ n ν`
  is the hive count of the cyclic triple (λ,μ,ν).
- `hiveCount_comm`: hive counts are symmetric in the two inputs.
- A determinant shift of one input shifts the output by the same amount.

**Checks.**

- Rank 2: `V_(1,0) ⊗ V_(1,0) = V_(2,0) ⊕ V_(1,1)`, with both hive counts 1 and
  every other output 0; the invariant form reads the cyclic triple
  `((1,0),(1,0),(−1,−1))`, whose sum of coordinates is 0 and whose single hive
  is the hive of §1.2's first Check, so `dim (V ⊗ V ⊗ det⁻¹)^GL₂ = 1`, while
  `((1,0),(1,0),(0,0))` has coordinate sum 2 and no hive, matching the absence
  of invariants in `V ⊗ V`.
- Rank 1: `V_a ⊗ V_b` is `V_(a+b)`, and the rank-1 hive of boundary
  `(a, b, −g)` exists exactly when g = a + b; rank 0 has one empty hive and
  the one-dimensional space of endomorphisms of the unit object.
- Rank 1 in two variables: `s_(1)² = s_(2) + s_(1,1)` with `s_(1,1) = x₀x₁ ≠ 0`,
  while the rank-one hive sum has the single term γ = (2); so the Schur
  identity holds in n variables and fails in more, and the headline is stated
  in exactly n variables.
- Rank 2, `V_(1,0) ⊗ V_(0,−1)`: the hive counts of γ = (1,−1) and γ = (0,0) are
  1 and every other is 0; the same after shifting by the determinant,
  `V_(2,1) ⊗ V_(1,0) = V_(3,1) ⊕ V_(2,2)`.
- The Steinberg extraction for GL₂ and λ = μ = (1,0), with ρ = (1,0): for
  γ = (2,0) the identity term reads the weight (1,0) of `V_(1,0)` (multiplicity
  1) and the reflected term the weight (−2,3) (multiplicity 0), so the
  coefficient is 1; likewise 1 for γ = (1,1) through the weight (0,1); for
  γ = (3,−1) both terms read weights (2,−1) and (−3,4) of multiplicity 0.

### 2.4 Direct hive Pieri

Prove hive vertical Pieri directly: the exterior boundary `(1^k, 0^(n−k))`
forces γ−λ to be a 0/1 vector of sum k; the line of kinks determines the
unique completion. Give its entry formula, eight local rhombus cases,
dominance criterion, k = 0, n and repeated-coordinate degeneracies, and its
collapsed honeycomb picture under Layer 4. Prove the horizontal Pieri version
by the LR/transpose comparison, using the Schur involution of SchurWeyl
Layer 7. Summed parallelogram inequalities give the unique top hive at
γ = λ+μ (Knutson–Tao–Woodward, *A positive proof*, §4, Proposition 4).
*Needs:* §2.2; Tau Ceti `TauCeti.hsymm_mul_diagramSchurPoly`;
SchurWeyl Layer 7 and gap:skew-lr-tableaux.

**Checks.**

- n = 2, k = 1, λ = (2,0): γ ∈ {(3,0), (2,1)}, one hive each; λ = (1,1): only
  γ = (2,1), since (1,2) is not dominant, so the dominance criterion removes
  one of the two 0/1 candidates.
- k = 0 gives the single hive at γ = λ; k = n gives the single hive at
  γ = λ + (1,…,1), the determinant twist.
- The top hive at γ = λ+μ is unique for every λ, μ: for λ = μ = (1,0) it is the
  hive of §1.1's first Check.

### 2.5 The rational representation ring and the hive ring

Construct the category of finite-dimensional **rational GLₙ** representations
on the native ClassicalGroups/FDRep carrier, its rational
subobjects/quotients, additive and tensor closure, and an essentially small
model via standard coordinate spaces `Fin d → ℂ` with intertwiner matrices.
Consume the generic GrothendieckEulerForms Layers 1–2, native
`TauCeti.SplitK0` and its exact-K₀ comparison; build this category's
Grothendieck **representation ring** R(GLₙ) from that same carrier. Prove
tensor multiplication well-defined, unit, functoriality, and split = exact
using ReductiveGroups Layer 6's characteristic-zero complete reducibility.
Its basis [Vλ] is a target here: finite irreducible isotypic multiplicities
give an additive equivalence `R(GLₙ) ≃ DominantWeight n →₀ ℤ`, and character
comparison gives an injective map to the symmetric Laurent character ring.
This ring is distinct from the ambient torus group algebra. Build the free
ℤ-module hive multiplication on `DominantWeight n →₀ ℤ`, with finite support
from §1.2. Layer 3 supplies direct combinatorial associativity; §§2.2–2.3
independently supply the LR comparison. Prove unit, bilinearity,
commutativity, central ℤ-grading, dominance filtration and determinant
inverse, and identify its basis/generators with the newly constructed R(GLₙ)
basis and exterior/determinant representations. Prove the Laurent
presentation for n ≥ 1 (n = 0 gives ℤ) using triangular highest weights and a
linear extension of dominance within each central degree; generator-exponent
lexicographic order does not supply that triangularity (Knutson–Tao–Woodward,
*A positive proof*, §3). Export coordinates, generator normal forms and finite
multiplication formulas. *Needs:* §2.3, §1.2, §3.2; ClassicalGroups Layer 3;
ReductiveGroups Layers 1 and 6; GrothendieckEulerForms Layers 1–2; Tau Ceti
`TauCeti.SplitK0`.

**Checks.**

- n = 0: R(GL₀) = ℤ; n = 1: R(GL₁) = ℤ[t, t⁻¹] on the characters t^k.
- n = 2: `[V_(1,0)]² = [V_(2,0)] + [V_(1,1)]`, and R(GL₂) = ℤ[e₁, e₂, e₂⁻¹]
  with e₁ = [V_(1,0)], e₂ = [det]; the monomial e₁e₂⁻¹ is [V_(0,−1)].
- A non-example: the torus group algebra ℤ[t₁^±, t₂^±] is strictly larger than
  the image of R(GL₂), which is its symmetric part.

### 2.6 The type-A Kostant partition function

Apply §1.5 to the **actual type-A Kostant partition function**, through §2.3's
RootPairing/Base and Gelfand–Tsetlin comparisons. For N ≥ 2 use rank
r = N−1, positive roots indexed by pairs 0 ≤ i < j < N (`PositiveInterval N`)
and m = N(N−1)/2 columns. In simple coordinates the (i,j) column is 1 in
positions i, …, j−1 and 0 elsewhere (`intervalMatrix N`). Construct the
integral equivalence between ℤ^(N−1) and `Q_N = {z ∈ ℤ^N : Σ z_i = 0}`:
`z ↦ (Σ_(i≤k) z_i)_k`, inverse the successive difference vector. Identify it
with the specified type A_(N−1) root model in the sum-zero hyperplane of ℚ^N,
its positive-root indices and base (`RootCoordinates`). Extension by zero on
negative roots gives the actual equivalence
`F_A(c) ≃ {d : ι → ℕ // TauCeti.IsKostantPartition P b (embed c) d}`; prove both
inverses, support and sum identities, and hence equality with the SAME native
`TauCeti.kostantPartition P b` (`typeACount_eq_native`), not a second
Lie-theoretic count; the native `TauCeti.kostantMultiplicity` is then the
alternating sum of these counts. Prove this consecutive-ones matrix totally
unimodular using the native predicate (`intervalMatrix_totallyUnimodular`;
Billey–Guillemin–Rassart, Lemma 1.6). For each square minor first order its
selected rows: each column still has a consecutive interval of 1s. Apply the
determinant-one row-difference operator to THAT minor. Its columns have at
most one +1 and one −1; expansion handles a column with at most one nonzero,
while if every column has both signs their row sum is zero and the
determinant vanishes. This proves every minor 0, ±1; it does not presume
arbitrary unimodular row operations preserve total unimodularity of a whole
matrix. The simple-root columns give full row rank and the full integer
lattice. The all-ones height is strictly positive on every column. Thus the
support in simple coordinates is exactly ℝ^(N−1)_≥0, and in Q_N it is the cone
of nonnegative partial sums, NOT the whole sum-zero space or a central GL
translate. Transport §1.5's closed chambers, actual rational polynomial
constituents, integer evaluations, internal-wall agreement and relative face
restrictions (`typeACount`, `typeA_exists_chamberPolynomial`;
Billey–Guillemin–Rassart §§1.3–1.4 and §7.1). Their total degree is at most
m−r = (N−1)(N−2)/2. Determinant shifts of λ and wt cancel in λ−wt; they do
not add a root-lattice or partition variable. No least/minimal chamber
decomposition is required by this API: compare refinements explicitly.
Preserve §2.3's fixed-height Gelfand–Tsetlin threshold and its object
equivalence: compose it with this count and chamber evaluation on each
specified parameter region. No chamber-polynomiality for arbitrary root
systems, arbitrary Gelfand–Tsetlin/hive polytopes or every vector list follows
from this specialization. *Needs:* §1.5, §2.3; Tau Ceti
`TauCeti.kostantPartition`, `TauCeti.IsKostantPartition`, `TauCeti.posRoots`;
Mathlib `Matrix.IsTotallyUnimodular`; RootSystems Layer 5.

- `intervalMatrix_totallyUnimodular`: every square minor of the interval
  matrix is 0 or ±1.
- `typeA_exists_chamberPolynomial`: for N ≥ 2 each chamber of the interval
  matrix carries a rational polynomial of total degree at most (N−1)(N−2)/2
  evaluating to the type-A count at its lattice points.
- `typeACount_eq_native`: through simple-root coordinates the interval-matrix
  count is the native Kostant partition function of the type-A root pairing.

**Checks.**

- N = 3, c = (a,b): the solutions are (a−z, b−z, z) with 0 ≤ z ≤ min(a,b), so
  the count is min(a,b)+1 for a, b ≥ 0 and 0 otherwise; the two closed
  support chambers a ≤ b and b ≤ a carry a+1 and b+1 and agree at a = b, of
  degree 1 = (N−1)(N−2)/2; at the origin the value is 1 and the exterior zero
  does not glue.
- N = 3: the three columns (1,0), (0,1), (1,1) have the 2×2 minors 1, 1, −1,
  all units, as total unimodularity requires.
- N = 2: the single-root count is 1 at a ≥ 0 and 0 otherwise, of degree 0.
- N = 1 and N = 0: the root lattice is the zero group, the empty partition is
  unique and there are no root operators; these cases do not invoke a
  negative-rank type-A model.

### 2.7 Hive counts and the diagonal overgroup restrictions

Let G = GLₙ(ℂ), P = G×G, Δ = {(g,g)}, `H_sc = {(cg,g) : g ∈ G, c ∈ ℂˣ}` and
`H_det = {(g,h) : det g = det h}`, as in the two ClassicalGroups gaps
(gap:diagonal-overgroups, gap:diagonal-overgroup-restrictions). Compare the
restrictions of the external irreducible `V_λ⊠V_μ` supplied by the second gap
with the tensor product counted in §§2.2–2.3, including all determinant
shifts: its restriction to Δ ≅ G is `V_λ⊗V_μ` with multiplicities
`c^γ_(λ,μ)` = `hiveCount (productBoundary λ μ γ)`; for n ≥ 1 the restriction to
H_sc ≅ G×ℂˣ is `⊕_γ c^γ_(λ,μ) V_γ⊠χ` with `χ(c) = c^(|λ|)`, the central
character of the first factor, the hive counts again the multiplicities; and
the restriction to H_det is irreducible, so no hive count enters. Neither
intermediate group supplies a partial tensor-factorization: this target
transports the hive counts along the supplied isomorphisms and nothing more.
*Needs:* §2.3; ClassicalGroups gap:diagonal-overgroups and
gap:diagonal-overgroup-restrictions.

**Checks.**

- n = 2, λ = μ = (1,0): the restriction to Δ is `V_(2,0) ⊕ V_(1,1)` and to
  H_sc each summand carries χ(c) = c, since |λ| = 1.
- n = 1: every restriction is a character, H_sc = P and H_det = Δ, so the
  comparison reduces to P and Δ.
- The positive reals `{(rI,I) : r > 0}·Δ` form a closed connected real
  subgroup between Δ and P that is not complex: the gap's classification needs
  the complex hypothesis, and no restriction statement is made here for real
  subgroups.

### Examples

Rank 2, λ = μ = (1,0): the hive counts of §2.3, the Gelfand–Tsetlin fibres of
§2.1, the Littlewood–Richardson tableaux of §2.2, the ring identity of §2.5
and the restrictions of §2.7 all compute `V_(2,0) ⊕ V_(1,1)`. The A2 Kostant
count min(a,b)+1 of §2.6 is §1.5's and §1.6's A2 example.

### Dependencies

Layer 1 (§§1.1–1.2, §1.5), §3.2 for the associativity used by §2.5;
Tau Ceti `TauCeti.GTPattern`, `TauCeti.DominantWeight`,
`TauCeti.kostantPartition`, `TauCeti.kostantMultiplicity`,
`TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`,
`TauCeti.formalCharacter_coeff_eq_kostantMultiplicity`, `TauCeti.SplitK0`;
Mathlib `Matrix.IsTotallyUnimodular`; ClassicalGroups Layers 3–6 and its two
declared gaps; RootSystems Layer 5; ReductiveGroups Layers 1 and 6;
GrothendieckEulerForms Layers 1–2; SchurWeyl Layer 7 and gap:skew-lr-tableaux.

## Layer 3: octahedron recurrence and the excavation bijection

### 3.1 The bounded octahedron recurrence

Define the size-n tetrahedral lattice and its unit tetrahedral/octahedral
subdivision, and compare it with Henriques–Kamnitzer's space-time lattice
`L = {(x,y,t) ∈ ℤ³ : 0 ≤ x,y ≤ n, x+y+t even}`. Sections are graphs in the
2-skeleton meeting each vertical line once. The associator region is
`A = {|x−y| ≤ t ≤ n − |n−x−y|}`. Its lower section S is t = |x−y| and its upper
section S′ is t = n − |n−x−y|. In §1.1's barycentric coordinates, embed the
first input face by `(x,y,z) ↦ (n−x, z, y)` and the second by
`(x,y,z) ↦ (y, n−x, z)`. Read the μ,ν,τ* output face by
`(x,y,z) ↦ (n−z, n−x, n−y)`, subtracting |λ| to normalize its A-corner; read
the λ,τ,π* face by `(x,y,z) ↦ (y, z, n−x)` without a constant shift. Prove
these maps land on S/S′ and give exactly the displayed boundaries. In the
inverse, add |λ| back to the first output face before gluing. Match the first
hive's A, C with the second's A, B; their common dominant-weight partial sums
agree with both A-values 0. There are no extra rhombus inequalities across
this shared edge. For n ≥ 1 define the full bounded modified recurrence of
Henriques–Kamnitzer's equation (5) on `Y = [0,n]² × ℝ`, before restricting it
to A. To compute f(x,y,t+1), subtract f(x,y,t−1) from the maximum of the two
opposite-neighbour sums in the interior; on y = 0, n use only
f(x+1,y,t) + f(x−1,y,t), and on x = 0, n use only f(x,y+1,t) + f(x,y−1,t).
At each of the four corners use the sum of its two inward neighbours. Define
its time inverse by t ↦ −t, prove finite dependency recursion from a section,
and build the integral, real and PL state-transition APIs on finite
future/past regions. Treat n = 0's one-point hive maps separately. The
interior rule is `e′ = max(a+c, b+d) − e`. For the associator restriction
prove every dependency stays in A and wall points already lie on S. Give the
equivalent legal unit-cell excavation schedule, termination and agreement
with time recursion, rather than relying on an undefined shelling. Reverse
time gives the inverse recurrence; ties are included. Prove unchanged four
exterior boundaries, integral coefficients, homogeneity, continuity and
native finite piecewise-affineness from max branches (Henriques–Kamnitzer
§3; Knutson–Tao–Woodward, *A positive proof*, §5). *Needs:* §1.1, §1.2; Tau
Ceti `IsPiecewiseAffineOn`.

**Checks.**

- The interior rule is an involution in e: applying `e ↦ max(a+c, b+d) − e`
  twice returns e, so reversing time inverts the recurrence; a rule with
  `min` in place of `max` would also be an involution but would not preserve
  the rhombus inequalities on S′.
- On the wall y = 0 the rule `f(x,0,t+1) = f(x+1,0,t) + f(x−1,0,t) − f(x,0,t−1)`
  propagates the boundary values unchanged: the exterior boundaries of the
  output faces are those of the inputs.
- n = 0: the region A is a single vertical line, S = S′, and the recurrence is
  the identity on the one-point hive.

### 3.2 The transverse hive condition and the excavation bijection

Build oriented wavefronts and the **transverse hive condition** of
Henriques–Kamnitzer, Lemma 3.1: require the inequality only for rhombi R_α
whose short diagonal α lies in W ∩ S, for W transverse to S. Prove it is
equivalent on S and S′ by the four elementary cutcurve moves: split one edge
into two, merge two into one, slide an edge along a wall, and cross a
cutpoint. Build the local max inequalities in both directions and all
orientation/boundary cases, including the half-/quarter-octahedron rules used
by the cutcurve comparison. For A use the wavefront family excluding those
containing a face of the big tetrahedron; prove this family exactly captures
the individual hive-face rhombi on both S and S′. Do not impose a condition
on every arbitrary rhombus across an intermediate frontier's glued edges.
Obtain the explicit integral and real equivalences

`Σσ Hive(λ,μ,σ*) × Hive(σ,ν,π*) ≃ Στ Hive(μ,ν,τ*) × Hive(λ,τ,π*)`

(`LeftPair`, `RightPair`, `card_leftPair_eq_card_rightPair`). Both directions
preserve hive conditions and the four external product boundaries.
Intermediate dominant weights vary; §1.2 proves finite support. Extract the
associativity sums and §2.5's hive-ring associativity. This proof is
independent of LR counting and of Layer 9's later coherence comparison
(Knutson–Tao–Woodward, *A positive proof*, Theorem 2). *Needs:* §3.1, §1.2.

- `card_leftPair_eq_card_rightPair`: for all λ, μ, ν, π the two bracketed
  sums of products of hive counts agree.

**Checks.**

- Rank 2, λ = μ = ν = (1,0), π = (2,1): the left sum runs over σ ∈ {(2,0),(1,1)}
  with `c^(2,1)_((2,0),(1,0)) = c^(2,1)_((1,1),(1,0)) = 1`, total 2, and the
  right sum over τ gives 2 as well: `V^(⊗3) = V_(3,0) ⊕ 2V_(2,1)`. The
  bijection pairs hives through different intermediate weights, so a termwise
  identity in σ = τ would be false.
- π = (3,0): both sums are 1, through σ = τ = (2,0) only.
- Rank 1: every hive is determined by its boundary, both sides are 1, and the
  bijection is the identity on the single pair.

### Examples

The rank-2 computation `V_(1,0)^(⊗3) = V_(3,0) ⊕ 2V_(2,1)` is the reference
value for §2.5's associativity and for Layer 9's pentagon comparison.

### Dependencies

§1.1 and §1.2; Tau Ceti `IsPiecewiseAffineOn`; Henriques–Kamnitzer §3 and
Knutson–Tao–Woodward, *A positive proof*, §5. No Littlewood–Richardson input.

## Layer 4: honeycombs, overlay and saturation

### 4.1 Honeycombs and the hive dictionary

Construct the canonical rank-n triangular honeycomb graph dual to the
unit-triangle lattice: finite vertices, finite edges and 3n labelled rays. A
configuration locates vertices in `{(u,v,w) ∈ ℝ³ : u+v+w = 0}`, with each
oriented edge in its assigned coordinate direction and nonnegative length.
Prove the edge-constant-coordinate description is equivalent, finite linear
constraints, boundary order/trace, and linear coordinate isomorphism with
normalized hives. Hives' affine gradients give vertex locations; their jumps
give lengths. Conversely integrate crossed edge constants along the dual
graph; zero tension gives path independence, normalization and boundary
partial sums. Prove slack = length with the chosen lattice normalization.
Export ℤ/ℚ/ℝ compatibility and the native piecewise-affine comparison
(Knutson–Tao I, §2 and Appendix 2). *Needs:* §1.1, §1.2; Tau Ceti
`IsPiecewiseAffineOn`.

**Checks.**

- Rank 1: one vertex with three rays of constant coordinates λ₁, μ₁, ν₁,
  which sum to 0; every real triple with zero sum is a configuration.
- The rank-2 hive of §1.1's first Check (slacks 1, 0, 1) is the honeycomb
  whose three interior edges have lengths 1, 0, 1: one zero-length edge, so
  the configuration is degenerate although the hive is unique.
- A configuration with a negative edge length is not a honeycomb, and its
  dual labelling violates a rhombus inequality by exactly that length.

### 4.2 Reduced weighted diagrams

Build reduced weighted diagrams, allowing zero-length contractions,
coincident edges with positive integer multiplicities and transverse
crossings. Equality is equality of the embedded weighted diagram after
subdividing at vertices/crossings; it is not equality of arbitrary graph
presentations. Prove finite support, six-direction zero tension, convex
complementary regions and reconstruction of the unique canonical rank-n
configuration. Classify degeneracy regions and local vertex types,
reconstruct the dual graph from directions/multiplicities and prove
subdivision/contraction invariance. Show the three n-ray families determine
rank; a finite balanced component without rays is impossible. Treat repeated
boundary values and multiple coincident rays without a strict-dominance
assumption (Knutson–Tao I, §3). *Needs:* §4.1.

**Checks.**

- Two rank-1 honeycombs with the same vertex overlap to a diagram with one
  vertex and multiplicity 2 on every ray; reconstruction returns the rank-2
  configuration whose three interior edges all have length zero.
- A closed hexagon with six unit edges and no rays is balanced but has no
  rays, so it is not the diagram of any honeycomb.
- Subdividing an edge at an interior point and contracting it back gives the
  same reduced diagram.

### 4.3 Overlay and tropical convolution

Define diagram overlay by adding multiplicities and compare it with the
rank-(n+m) configuration reconstructed in §4.2. Boundaries are **sorted
multiset unions**, not coordinatewise sums. On hives prove its tropical
convolution formula

`(h ⊞ k)(a) = max_(b∈Δₙ, c∈Δₘ, b+c=a) (h(b) + k(c))`.

Prove decomposition sets are nonempty and finite, rhombus preservation,
gauge/normalization, ℤ-compatibility, associativity and commutativity and
rank-0 identity. Prove the formula by the integrated diagram/affine-envelope
comparison, not by assuming an arbitrary pointwise maximum preserves
concavity. Distinguish this operation from pointwise addition of same-rank
hives. Prove the max-plus convolution distributivity on ambient finite
functions and identify the domain on which hive closure holds (Knutson–Tao I,
§4). *Needs:* §4.2.

**Checks.**

- Rank 1 ⊞ rank 1: for hives with values (0, b, c) and (0, b′, c′) on Δ₁, the
  overlay on Δ₂ has value max(b, b′) at (1,1,0) and b+b′ at (0,2,0), so its
  A→B boundary is (max(b,b′), min(b,b′)), the sorted union of (b) and (b′); the
  coordinatewise sum (b+b′) has the wrong rank.
- Overlay with the rank-0 hive is the identity.
- Pointwise addition of two rank-2 hives stays in rank 2, whereas their
  overlay has rank 4: the two operations differ already in their target.

### 4.4 The type-A PRV theorem

Derive the **type-A PRV theorem**: for dominant integral λ, μ and
permutations w, v, the dominant rearrangement of `wλ + vμ` is the highest
weight of a constituent of `Vλ ⊗ Vμ` (`hiveCount_pos_prv`); in particular Vγ
occurs whenever `γ = wλ + vμ` is already dominant. Overlay rank-1 honeycombs
with triples `(λ_i, μ_j, −λ_i − μ_j)` according to the chosen permutations;
the three sorted boundary multisets are λ, μ and the dual of the dominant
rearrangement. Prove integrality and invoke §2.3's tensor comparison
(Knutson–Tao I, §4). The source states the weak form, in which `wλ + vμ` is
already dominant; its overlay of rank-1 honeycombs has sorted boundary
multisets whatever the permutations, which is the dominant-rearrangement form
stated here. Include the extremal Cartan summand and determinant
cases. No general semisimple PRV theorem is inferred from this type-A
construction. *Needs:* §4.3, §2.3; Tau Ceti `TauCeti.dominantWeightOf`.

- `hiveCount_pos_prv`: for all permutations σ, τ the hive count of
  `(λ, μ, (dominantWeightOf (λ∘σ + μ∘τ))*)` is positive.

**Checks.**

- Rank 2, λ = μ = (1,0): the identity permutations give (2,0) and the swap
  gives (1,1); both occur in `V ⊗ V`.
- Rank 2, λ = (1,0), μ = (0,−1): the sums (1,−1) and (0,0) both occur in
  `V ⊗ V*`; the latter is the trivial summand.
- Rank 3, λ = μ = (1,0,0): the dominant rearrangements of `e_i + e_j` are
  (2,0,0) and (1,1,0), the only constituents of `V ⊗ V`. PRV is not a
  characterization: `V_(2,0,0) ⊗ V_(0,0,−2)` contains `V_(1,0,−1)`, while the
  dominant rearrangements of the sums `wλ + vμ` are only (2,0,−2) and (0,0,0).

### 4.5 Honeycomb deformation and the largest lift

Build fixed-boundary honeycomb deformation theory: hexagon breathing,
virtual configurations, elision of simple crossings, loop deformations and
local molting at six-valent vertices, rakes and five-valent vertices. Choose
a generic superharmonic weighted-perimeter objective: exterior-region
weights 0, each interior hexagon weight greater than the mean of its six
neighbours. Construct such weights by the finite Dirichlet/discrete-Laplacian
solution (positive inverse/maximum principle), then avoid §1.4's finitely
many forbidden hyperplanes. Prove every allowed inflation increases the
objective. For regular boundary prove its largest lift has only simple
degeneracies and, after elision, an acyclic graph. Exclude high multiplicity
via the windward maximal-multiplicity path and compatible local molting,
prove monotone progress/termination, and exclude cycles by the nonzero fibre
deformation (Knutson–Tao I, §5). *Needs:* §4.2, §1.4.

**Checks.**

- On a single hexagon the weighted perimeter with interior weight 1 and
  exterior weights 0 increases strictly under breathing outward, so the
  largest lift breathes every interior hexagon to a degenerate position.
- Solving `w(x) − mean of w over the six neighbours = 1` with w = 0 on the
  exterior regions gives positive weights by the maximum principle; on the
  single interior hexagon of a rank-3 honeycomb the solution is w = 1, which
  exceeds the mean 0 of its six exterior neighbours.
- A boundary with a repeated coordinate is not regular; for it the largest
  lift may have a non-simple degeneracy, which is why regularity is assumed.

### 4.6 Forest lifts, integrality and saturation

On each regular largest-lift chamber, remove forest leaves recursively: two
known ray coordinates determine the third by `c = −a − b`. Prove termination,
integral coefficient formulas for every vertex/edge and reconstruction. Each
full-dimensional chamber of §1.4's largest-lift linearity subdivision has
dense regular feasible points. Finitely many forest integral matrices
describe their lifts; a finite union of proper linear subspaces cannot cover
a relatively open chamber, so that chamber's linear map equals one of these
matrices. Every boundary point belongs to a full-dimensional chamber closure.
Continuity extends its integral formula to all walls, including repeated
coordinates. Prove regular feasible boundaries are dense by an explicit
strict honeycomb perturbation; use a chamber incident to a wall, not rounding
an arbitrary hive's labels. Thus every nonempty real fibre with integral
boundary has an integral point (`integral_witness_iff_real_witness`).
Rational witnesses/clearing denominators plus §2.3 give
`c^(Nγ)_(Nλ,Nμ) > 0 ↔ c^γ_(λ,μ) > 0` for N ≥ 1 (Knutson–Tao I, §6, Corollary
to Theorem 3). Export the invariant-triple form, decidable
positivity and an integral-witness algorithm. Include Knutson–Tao I's figure
18 nonintegral extreme point to distinguish saturation from total
unimodularity of all active hive systems. *Needs:* §4.5, §1.4, §1.3, §2.3.

- `integral_witness_iff_real_witness`: an integral boundary has an integer
  hive exactly when it has a real hive.

**Checks.**

- Rank 2, λ = μ = (1,0), γ = (1,1): the dilated triple (2,0), (2,0), (2,2) has
  the hive count `c^(2,2)_((2,0),(2,0)) = 1`, and the undilated count is 1, as
  saturation requires.
- Knutson–Tao I's figure 18 honeycomb polytope has a nonintegral vertex: the
  saturation theorem asserts an integral point of the polytope, not
  integrality of its vertices, and a proof through total unimodularity of the
  active system would fail there.
- Rank 1: every real triple with zero sum and integral entries is an integer
  hive, so saturation is trivial.

### Examples

The rank-2 triple `((1,0),(1,0),(1,1)*)` runs through §§4.1–4.6: its unique
hive, degenerate honeycomb, PRV witness and saturation.

### Dependencies

§§1.1–1.4 and §2.3; Tau Ceti `IsPiecewiseAffineOn`, `TauCeti.dominantWeightOf`;
Knutson–Tao I, §§2–6.

## Layer 5: puzzles, boundary certificates and facets

### 5.1 Puzzles

Define finite puzzles of side N as exact tilings by unit 000-triangles, unit
111-triangles and rhombi whose outer edge clockwise after an obtuse corner is
1 and clockwise after an acute corner is 0. Allow rotations, prohibit
independent reflections; reflecting and swapping 0/1 is a duality. Build
edge/triangle occupancy, matching labels, boundary words, extensionality,
finite enumeration, rotation/duality, gluing and connected monochromatic
regions. Force balance proves each boundary has the same number k of 1s.
Deflate/expand regions with nonnegative real lengths, retaining
edge-direction data; prove collapse/subdivision independence and zero
tension. Prove counts k² one-triangles, (N−k)² zero-triangles and k(N−k)
rhombi, with both orientations' binomial counts (Knutson–Tao–Woodward II,
§1.2). *Needs:* §1.1.

**Checks.**

- N = 1: exactly two puzzles, the single 000-triangle and the single
  111-triangle, with k = 0 and k = 1.
- N = 2, k = 1: one 000-triangle, one 111-triangle and one rhombus, as
  k² = 1, (N−k)² = 1, k(N−k) = 1 require, and `1 + 1 + 2·1 = 4 = N²` unit
  triangles in all.
- A tiling using a reflected rhombus (labels 0 and 1 interchanged around the
  obtuse corner) is not a puzzle; it becomes one under the duality that
  reflects and swaps 0/1.

### 5.2 Rhombus functionals and boundary certificates

A puzzle places disjoint rhombi in the hive lattice. Prove the sum of their
slacks telescopes to the sum of selected cyclic **0-edge** boundary entries, a
nonnegative boundary functional. Using trace 0 equivalently the sum of
selected **1-edge** entries is ≤ 0. Give both formulas and their coordinate
signs, normalization independence and rotation. Conversely for a nonempty
collection of interior-disjoint rhombi with coefficient 1 whose total
functional is supported on the outer boundary, prove the source homework:
connectedness, constant 0/1 labels on complementary regions and convexity of
same-type regions, by the five forbidden local configurations. Handle empty
collections separately and prove the boundary equal-k condition by force
balance (Knutson–Tao–Woodward II, §2, Theorem 2). *Needs:* §5.1, §1.2.

**Checks.**

- N = 2: the single rhombus with short corners m_AB, m_CA has slack
  `−(λ₂+μ₁+ν₂) = λ₁+μ₂+ν₁` by trace 0, the sum of its three selected 0-edge
  entries, as Conventions item 2 pins.
- The rank-6 puzzle with cyclic words 000110, 000101, 010100 gives the
  invariant inequality `λ₄+λ₅+μ₄+μ₆+ν₂+ν₄ ≤ 0`; the rank-5 words 00010, 00010,
  00100 give `λ₄+μ₄+ν₃ ≤ 0` and their cyclic counterpart 00010, 00100, 00010
  gives `λ₄+μ₃+ν₄ ≤ 0`.
- The printed rank-5 variant `λ₄+μ₃+ν₃ ≤ 0` is not an inequality of the
  cone: λ = (1,1,1,1,0), μ = (1,1,1,0,0), γ = (2,2,1,1,1), ν = γ* give a hive
  by exterior Pieri while `λ₄+μ₃+ν₃ = 1`.

### 5.3 Facets of the boundary cone

Show the boundary cone has dimension 3N−1 for N ≥ 1 inside trace 0 and give
explicit nondegenerate configurations/trading perturbations. For each regular
facet, take Layer 4's generic forest lift; it splits into two connected
components after elision. Here a clockwise overlay consists of two honeycombs
of ranks r and N−r, with 0 < r < N, whose intersections are isolated points in
the interior of an edge of each factor, with the first factor turning
clockwise to the second at every crossing. Trading through crossings forces
this consistent clockwise overlay. Reconstruct its puzzle and prove the
supporting hyperplane really is a facet by a 3N−2-dimensional perturbation
family. Conversely every clockwise overlay supplies that facet. With chamber
inequalities this proves real hive feasibility iff **all** puzzle boundary
functionals are nonnegative. Export the exact finite certificate list and a
witness/certificate alternative. One inequality alone is only necessary.
Include rank 1 and rank 2 explicitly; chamber inequalities are essential for
N > 2 but redundant for N = 2 (Knutson–Tao–Woodward II, §3, Theorems 3 and
4). *Needs:* §5.2, §4.6, §1.3.

**Checks.**

- N = 1: the boundary cone is the plane λ₁+μ₁+ν₁ = 0 of dimension 2 = 3N−1,
  with no inequality.
- N = 2: dimension 5; the regular inequalities are the three rotations of
  `λ₂+μ₁+ν₂ ≤ 0` and the chamber inequalities λ₁ ≥ λ₂, μ₁ ≥ μ₂, ν₁ ≥ ν₂ follow
  from them and the trace equation, which fails for N = 3.
- No single inequality is an iff criterion: the rank-2 triple (1,0), (1,0),
  (1,−3) satisfies `λ₂+μ₁+ν₂ = −2 ≤ 0` but violates the rotation
  `μ₂+ν₁+λ₂ = 1 ≤ 0`, and it has no hive, since γ = ν* = (3,−1) is not a
  constituent of `V ⊗ V`.

### 5.4 Gentle loops and rigid puzzles

Build gentle paths/loops in puzzles, arrows and turn restrictions. Prove
loop-free puzzles admit clockwise-overlay witnesses by rake propagation;
these puzzles are uniquely determined by boundary words. If a gentle loop
exists, choose a minimal one, prove the radius-1 neighbourhood's allowed
intersections, and perform the reversible breathing move giving a distinct
puzzle with the same boundary. Hence rigid iff loop-free. Prove regular
facets correspond bijectively to rigid nonconstant puzzles, while a nonrigid
puzzle's face meets only chamber walls. Export irredundancy **relative to the
dominant trace-zero chamber** and account for trivial all-0/all-1 words.
Export rigidity under one-region inflation and its dual operation; §6.8 uses
the exact honeycomb-scaling comparison for multiplicity-one stretching
(Knutson–Tao–Woodward II, §4, Theorems 5–7, and §5, Lemma 8). *Needs:* §5.3.

**Checks.**

- The puzzles of `(σ0101)² = σ0110 + σ1001` in Gr₂(ℂ⁴) are each the unique
  puzzle with their boundary, hence rigid and loop-free.
- The all-0 and all-1 words have one puzzle each (a monochromatic triangle),
  rigid but giving the trivial inequality 0 ≤ 0.
- Inflating a one-region by a factor N preserves rigidity in both directions
  (Lemma 8), so rigidity is a property of the boundary pattern, not of the
  scale.

### Examples

The rank-5 and rank-6 inequalities of §5.2 and the Gr₂(ℂ⁴) puzzles of §5.4
are the reference certificates; Layer 7 reads the same puzzles as Horn
inequalities.

### Dependencies

§§1.1–1.3, §4.6; Knutson–Tao–Woodward II, §§1–5.

## Layer 6: Grassmannian cohomology and the puzzle rule

### 6.1 The finite Grassmannian carrier

On the supplied rank-k subspace Grassmannian Grₖ(ℂᴺ), N = k+q, on the
carrier `Submodule ℂ (Fin N → ℂ)` of TopologicalKTheory T1, construct the
supplied graph charts and own the comparison with Mathlib's quotient-rank
Grassmannian: a point of `Module.Grassmannian ℂ (Fin N → ℂ) (N−k)` is a
submodule V whose quotient ℂᴺ/V is finite, projective and of rank N−k at the
unique prime of ℂ, so the forgetful map to `Submodule ℂ (Fin N → ℂ)` is a
bijection from those points onto the subspaces of dimension k (a subspace of
a finite-dimensional space has a free quotient, of dimension N − dim V, and
conversely), carrying the universal quotient ℂᴺ → ℂᴺ/V to the quotient-bundle
fibre and its kernel to the tautological fibre V. Prove homogeneous models U(N)/(U(k)×U(q)) and GL(N)/Pₖ, connectedness,
compactness, complex dimension kq, Plücker smooth/holomorphic embedding and
its induced Kähler form. Identify the supplied tautological bundle S and
quotient Q, exact sequence 0 → S → ℂᴺ → Q → 0, bundle ranks, flag forgetful
maps and associated-bundle actions. Only the complex points of the
quotient-rank functor are compared; no scheme structure on it is used, and
scheme gluing is not a prerequisite for singular cohomology. Include k = 0,
q = 0 and orthogonal-complement/dual homeomorphisms (Buch, §1). *Needs:*
TopologicalKTheory T1; Mathlib `Module.Grassmannian`; ComplexKahlerGeometry
K7; LieGroups Layer 8.

**Checks.**

- k = 0 and k = N give one-point Grassmannians of dimension 0; Gr₁(ℂ²) is
  ℂP¹ of complex dimension 1 = kq.
- The quotient-rank convention: a k-dimensional subspace V ≤ ℂᴺ has quotient
  ℂᴺ/V of rank N−k, so the functor index is N−k, not k; a comparison using
  index k would identify Grₖ with Gr_q, which is wrong unless k = q. For
  N = 2, k = 1 the line spanned by (1,0) has quotient of rank 1 and is a point
  of `Module.Grassmannian ℂ (Fin 2 → ℂ) 1`, while the zero subspace, of
  quotient rank 2, is not.
- The orthogonal complement V ↦ V^⊥ is a homeomorphism Grₖ(ℂᴺ) → Gr_q(ℂᴺ)
  exchanging S and Q* up to the Hermitian identification.

### 6.2 Words, partitions and Schubert cells

A binary word w of length N with k ones gives their positions p₁ < ⋯ < pₖ.
Set `λ_i = q + i − p_i` with one-indexed i, the number of zeroes after its ith
1. This is the partition inside k×q; prove inverse, inversion count |λ| and
that reversal w ↦ reverse(w) gives the rectangle dual `λ∨_i = q − λ_(k+1−i)`.
Use the standard increasing coordinate flag F. Define cells by exact
`dim(V ∩ F_j) = #ones(w[1..j])`, and Schubert varieties by ≥. Prove
row-echelon chart cells `ℂ^(kq−|λ|)`, closure and word partial order, with
`C_µ ⊆ X_λ ↔ λ ⊆ µ` (equivalently `p_µ,i ≤ p_λ,i`), boundary union, and the
partial-flag projection comparison with LieGroups Layer 8's Bruhat cells.
Consume the single finite CW characteristic-map and rank-one partial-flag
incidence construction on this same complex subspace carrier from
TopologicalKTheory T1.5; do not reconstruct it or assume a generic
Bott–Samelson resolution. Compare the transferred characteristic maps'
open-cell orientation with the complex orientation of the row-echelon charts.
Use the resulting CW structure and these cell/partition comparisons to
construct the integral cellular basis and compare it with the Schubert
cohomology basis in §6.3; export free integral even homology and cohomology
through AlgebraicTopology, without passing through real coefficients (Buch,
§2). *Needs:* §6.1; TopologicalKTheory T1.5; LieGroups Layer 8;
AlgebraicTopology Stage 4.

**Checks.**

- N = 4, k = 2: the word 0101 has ones at positions 2, 4 and partition
  λ = (2+1−2, 2+2−4) = (1,0); 0011 gives (0,0), the unit; 1100 gives (2,2),
  the point class; |λ| equals the number of inversions of the word.
- Reversal: 0101 ↦ 1010 with positions 1, 3 and partition (2,1), which is the
  rectangle dual `(2−0, 2−1)` of (1,0).
- An indexing by the positions of the zeroes instead of the ones would give
  the transposed partition and exchange Grₖ with Gr_q.

### 6.3 Schubert classes and generic incidence

Define σλ as the integral cohomology class dual to the Schubert cycle of
complex codimension |λ|, degree 2|λ|. Construct the cycle via the complex
orientation on its top cell and prove the boundary cancellation/extension in
its closure; identify its pushforward in ambient homology and Poincaré dual.
Singular Schubert varieties are not falsely declared smooth. Opposite-flag
intersection gives `∫ σλ σμ = δ_(μ,λ∨)` and the top point class pairs +1.
Prove σ∅ = 1, positivity of transverse complex local multiplicities and
actual generic-flag incidence counting. Own the homogeneous parameter
theorem: for a transitive smooth action, G×Y → X is a submersion; inverse
image of Z is a manifold and Sard applied to its projection to G gives
dense/full-measure regular parameters, with a residual form using countable
compact exhaustions and Baire. Export transversality and product-action
variants. Openness needs a proper/compact incidence hypothesis; it is not
asserted for arbitrary noncompact strata. Apply this to each finite
Schubert-cell stratum. When total codimension is kq, lower-stratum
intersections have negative expected dimension and are empty generically.
Compactness of the closed Schubert incidence space and openness of
transversality near the finitely many remaining top-stratum points then give
a **dense open** good-flag locus, stable under small parameter changes. When
total codimension is kq and flags are in that locus, the intersection is
finite in the smooth top strata and its cardinality is the cup evaluation.
Degenerate flags may give nontransverse/infinite intersections; no
unqualified four-lines claim (Buch, §§2–3). *Needs:* §6.2; AlgebraicTopology
Stages 5–6; DifferentialGeometry 10.2.

**Checks.**

- Gr₂(ℂ⁴): `∫ σ_(1,0) σ_(2,1) = 1`, `∫ σ_(2,0) σ_(2,0) = ∫ σ_(1,1) σ_(1,1) = 1`
  and `∫ σ_(2,0) σ_(1,1) = 0`, since (2,0) and (1,1) are self-dual in the 2×2
  rectangle and (1,0)∨ = (2,1); `∫ σ_(2,2) = 1`.
- `σ_(1,0)⁴ [Gr₂(ℂ⁴)] = 2`: two lines in ℂP³ meet four lines in general
  position; for four lines through a common point the incidence is infinite,
  which the dense-open locus excludes.
- Gr₁(ℂ²): the only nontrivial cell is a point and `σ_(1)² = 0`.

### 6.4 Pieri and Giambelli

Prove the geometric Pieri and Giambelli identities. Special row classes are
c_r(Q), column classes c_r(S*) under CharacteristicClasses' `c₁(O(1)) = +h`
convention. Use the flag incidence resolution and iterated projective-bundle
Gysin, prove its top-stratum degree 1, pushforward and tautological exact
sequences, and compute the determinantal formula in special classes. This is
the **Grassmannian-specific incidence resolution**, not generic Bott–Samelson
or Schubert rational-singularity theory. Build the needed flag/Grassmann
fibre integrations using CharacteristicClasses C2 and Leray–Hirsch/Chern
relations, including integral pushforward normalization. Prove the ring
presentation `H*(Grₖ(ℂᴺ);ℤ) ≅ ℤ[e₁,…,eₖ]/(h_(q+1),…,h_(q+k))`, where
e_i = c_i(S*) and h_r are complete functions in its Chern roots (h₀ = 1,
h_r = 0 for r < 0). Prove generation, straightening/reduction and
independence by the geometric Schubert basis, not by presuming the LR ring
statement being established (Buch, Theorem 3.9 and §3). *Needs:* §6.3;
CharacteristicClasses C2–C3.

**Checks.**

- Gr₂(ℂ⁴): Pieri gives `σ_(1,0)² = σ_(2,0) + σ_(1,1)`, which in words reads
  `(σ0101)² = σ1001 + σ0110`.
- Giambelli: `σ_(1,1) = c₁(Q)² − c₂(Q)` and `σ_(2,0) = c₂(Q)`, so
  `c₁(Q)² = σ_(2,0) + σ_(1,1)`, consistent with Pieri.
- Gr₁(ℂ²) = ℂP¹: the presentation is `ℤ[e₁]/(h₂) = ℤ[e₁]/(e₁²)`; a convention
  with `c₁(O(1)) = −h` would change the sign of every odd class.

### 6.5 The quotient of the stable ring

Build the surjective graded map from the stable ring Λ_ℤ that SchurWeyl
provides (gap:stable-symmetric-ring) to this ring, sending sλ
to σλ inside the rectangle and to 0 otherwise. Prove the kernel is the
span/ideal of outside-rectangle Schur functions, specialization
compatibility, multiplication and LR coefficients. Degrees double under this
map. Identify σλ with the determinant of `c_(λ_i−i+j)(Q)`, retaining
vanishing terms and the k = 0 case. Thus the Grassmannian multiplication
constants are the supplied LR constants restricted to rectangle outputs
(Buch, §3; Fulton, *Young Tableaux*, §§9–10). *Needs:* §6.4; SchurWeyl
gap:stable-symmetric-ring.

**Checks.**

- Gr₂(ℂ⁴): s_(3) ↦ 0 since (3) does not fit in 2×2, while
  s_(1)² = s_(2) + s_(1,1) maps to Pieri's `σ_(1,0)² = σ_(2,0) + σ_(1,1)`.
- The map is not injective in degree q+1: s_(q+1) lies outside the k×q
  rectangle and maps to 0, so s_(1)^(q+1) and s_(1)^(q+1) + s_(q+1) have the
  same image.
- k = 0: the target is ℤ and every positive-degree Schur function maps to 0.

### 6.6 The puzzle–honeycomb equivalence

Define the puzzle-to-integral-honeycomb equivalence **with fixed boundary
words**, following Knutson–Tao–Woodward II, §5. Set partitions λ, μ, γ from
their 1-positions. Rotate the puzzle 30°, attach infinite rhombus strips at
boundary 1-edges, deflate one-regions, and recover zero-tension vertices with
multiplicities equal to strip thickness. Boundary coordinates are λ, μ, γ* at
rank k. Prove all vertices lie in the coordinate triangle of side q, then
inflate each edge into its prescribed rhombus thickness and each vertex into
a polygon of one-triangles. Prove tiling, absence of gaps/overlap, matching
labels, coordinate bounds, both inverses and dependence on origin/rotation.
The inequalities 0 ≤ λ_i, μ_i ≤ q do not alone prescribe the three boundary
words; the full boundary partition data is required. Include k = 0 and
repeated coordinates. Combined with Layer 2 this gives the puzzle-count
cup-product theorem. With all three sides read cyclically, it counts the
triple integral; for a product coefficient read the south word in reverse
cyclic direction. *Needs:* §5.1, §4.2, §2.3.

**Checks.**

- The two puzzles of `(σ0101)²` in Gr₂(ℂ⁴) correspond to the two rank-2
  honeycombs with boundary ((1,0),(1,0),γ*) for γ = (2,0) and γ = (1,1), each
  unique.
- k = 0: the only puzzle is the all-0 triangle and the only honeycomb is the
  empty rank-0 one.
- Reading the south word in the same cyclic direction as the other two
  computes the triple integral `∫ σλ σμ σν`, not the structure constant
  `c^γ_(λ,μ)`; the two differ by the rectangle dual γ ↦ γ∨.

### 6.7 The puzzle ring

Build the free integral binary-word module and puzzle multiplication, its
unit word 0^q1^k, grading, commutative associative ring and isomorphism to
the actual cohomology ring. Associativity follows through the ring
isomorphism in §§6.5–6.6. Export rotation/triple duality and
complement/transpose symmetry between Grₖ and Gr_q in the dual space.
Compare finite puzzle enumeration cardinalities with the LR/hive counts of
Layer 2. This is ordinary cohomology: no equivariant puzzle weights, quantum
corrections or K-theoretic pieces are inferred. *Needs:* §6.5, §6.6.

**Checks.**

- Gr₂(ℂ⁴): `(σ0101)² = σ0110 + σ1001`, unit σ0011, and
  `σ0101⁴ [Gr₂(ℂ⁴)] = 2`; the exponent 4 and the four-letter word 0101 are
  the data, and σ0101 = c₁(Q).
- The complement/transpose symmetry sends the word 0101 of Gr₂(ℂ⁴) to 1010 of
  Gr₂(ℂ⁴)* and the partition (1,0) to its transpose (1,0) read in the 2×2
  rectangle of the dual.
- Gr₁(ℂ²): `σ10·σ10 = 0`, so no puzzle of size 2 has both its NW and NE
  words equal to 10.

### 6.8 Multiplicity-one stretching

Prove the multiplicity-one stretching theorem after §6.6: reduce arbitrary
signed weights by determinant shifts, choose a rectangle containing the
resulting partitions, and use the puzzle-count theorem. Define dual
inflation by complement/reflection, one-region inflation,
complement/reflection back; at dilation d it changes side N = k+q to k+dq,
stretches the partition coordinates by d and leaves k fixed. Prove it
corresponds exactly to scaling the rank-k honeycomb by d. Gentle-loop
rigidity is preserved in both directions, so a unique original puzzle gives
a unique dilated puzzle and `c^γ_(λ,μ) = 1 ⇒ c^(dγ)_(dλ,dμ) = 1` for d ≥ 1
(`hiveCount_smul_eq_one`; Knutson–Tao–Woodward II, §6.1, Fulton's
conjecture). *Needs:* §6.6, §5.4, §2.3.

- `hiveCount_smul_eq_one`: a boundary with exactly one hive has exactly one
  hive after dilation by every d ≥ 1.

**Checks.**

- `c^(1,1)_((1),(1)) = 1` dilates to `c^(2,2)_((2),(2)) = 1`, the unique
  horizontal-strip tableau of shape (2,2)/(2).
- Stretching is not multiplicative: `c^(3,2,1)_((2,1),(2,1)) = 2`, while the
  dilation by 2 has at least 3 hives, since the rank-3 hive polytope has one
  interior coordinate and two lattice points, hence length at least 1.
- A boundary with no hive stays without hive under dilation by saturation,
  and d = 1 is the identity; the theorem says nothing about counts ≥ 2.

### Examples

Gr₂(ℂ⁴) throughout: six Schubert cells, `(σ0101)² = σ0110 + σ1001`,
`σ0101⁴ = 2`, `c₁(Q) = σ0101`, and its two puzzles, which are the two rank-2
honeycombs of §4.1 for γ = (2,0) and (1,1).

### Dependencies

Layers 2 (§2.3), 4 (§4.2) and 5 (§§5.1, 5.4); SchurWeyl
gap:stable-symmetric-ring; TopologicalKTheory T1 and T1.5; Mathlib
`Module.Grassmannian`; LieGroups Layer 8;
AlgebraicTopology Stages 4–6; CharacteristicClasses C2–C3;
ComplexKahlerGeometry K7; DifferentialGeometry 10.2; Buch §§1–3; Fulton,
*Young Tableaux*, §§9–10.

## Layer 7: Hermitian spectra, the weighted-flag bridge and Horn recursion

### 7.1 Sorted spectra

Define the spectrum of a Hermitian N×N complex matrix using the native
symmetric linear operator on the **Euclidean inner-product** coordinate space
(`nativeMatrixSpectrum`, `HasSpectrum`). Consume native
`Matrix.IsHermitian.eigenvalues₀` (sorted), `isSymmetric_toEuclideanLin_iff`,
`eigenvalues₀_antitone`, `charpoly_eq`, trace/eigenvalue and roots APIs;
reindex Fin(card(Fin N)) to Fin N. Prove the sorted-spectrum equality iff the
characteristic polynomial is the product of the corresponding linear factors,
retaining multiplicities. Consume the
PiLp/matrix conversion and trace = sum and determinant = product, unitary
conjugacy classification, diagonal realization, direct sums as sorted
multiset union, negation as reverse-negation and scalar shifts. Consume
PolarDecomposition PD-A50–A53 for finite min–max and Weyl; build the
matrix/Euclidean operator adapter and deduce ordered eigenvalue continuity
and perturbation/Lipschitz bounds, closedness and bounded representatives for
feasible triples. A zero-sum triple A+B+C = 0 has trace-zero spectral triple.
The sum-of-two convention uses (α,β,−reverse(γ)). Export n = 0 and n = 1
normalizations separately. *Needs:* Mathlib `Matrix.IsHermitian.eigenvalues₀`,
`eigenvalues₀_antitone`, `charpoly_eq`, `isSymmetric_toEuclideanLin_iff`;
PolarDecomposition PD-A50–A53.

- α is the sorted spectrum of A exactly when A is Hermitian, α is antitone
  and the characteristic polynomial of A is `∏ (X − α_i)`.

**Checks.**

- diag(1,0) has spectrum (1,0); its negative has spectrum (0,−1), the
  reversed negation; diag(1,0) ⊕ diag(2) has spectrum (2,1,0), the sorted
  union, not the concatenation (1,0,2).
- A non-Hermitian matrix with real eigenvalues, such as the Jordan block
  [[1,1],[0,1]], has no spectrum in this sense: `HasSpectrum` requires the
  Hermitian hypothesis, which the characteristic polynomial alone does not.
- n = 0: the empty matrix has the empty spectrum and satisfies every zero-sum
  condition; n = 1: the spectrum of (a) is (a).

### 7.2 Flag orbits, moment maps and the Segre comparison

For an integral dominant λ form the compact flag orbit of the highest-weight
line in the native Vλ, inside P(Vλ), with its Hermitian invariant norm.
Construct the repeated-eigenvalue partial-flag carrier as the closed
incidence subset of the supplied finite Grassmannians for its block-end
dimensions. Build its charts, block-parabolic stabilizer, compact unitary
homogeneous model and full-flag projection, and identify it with this
highest-line orbit. Prove the smooth/complex projection and orbit
embeddings; these partial-flag comparisons are targets here, beyond LieGroups
Layer 8's full flags. Compute the projective norm-square moment map
`⟨μ([z]),H⟩ = Re⟨z, dρ(H) z⟩ / ⟨z,z⟩` for Hermitian H; its orbit has spectrum
λ. With ComplexKahlerGeometry's Fubini–Study class normalized to integral 1
and HamiltonianReduction R1's `ι_ξ ω = dμ_ξ`, identify H with the Lie
generator **−2πiH** (its action is exp(−2πitH)). The corresponding
u(N)-dual functional pairs ξ by the Hermitian matrix `(i/(2π)) ξ`. Prove this
scaling/sign dictionary and KKS equality; no unnormalized expectation is
called the moment map for generator iH. Prove the central character supplies
the scalar part even though it acts trivially on projective points. Compare
its KKS/Fubini–Study normalization with HamiltonianReduction R2 and
ComplexKahlerGeometry K7, and the chamber/quotient dictionary with
ConvexityToric T3. Construct the finite Segre map on the native
projectivizations of the three representation spaces, prove
well-definedness, equivariance, injective closed holomorphic embedding and
its local inverse in nonzero-coordinate charts. Identify its O(−1) pullback
with the tensor of the three tautological lines and its normalized
Fubini–Study pullback with the sum of factor forms by the log-product norm
formula. Prove its tensor moment map is the sum of the three factor maps.
The line is in Vλ and sections of O(1) are dual; invariant nonvanishing is
unchanged by dualizing all factors. Export the highest-line/Cartan-product
coordinate comparison for every positive power, including determinant shifts
and linearisations. The projective highest line has fibre character +λ for
the upper-triangular stabilizer; its O(1) dual has fibre character −λ and
coordinate module Vλ*. Build the Borel–Weil comparison directly from
LieGroups Layer 8 with the same positive-root Borel, associated character −λ
and H⁰ module L(λ)*, retaining this explicitly computed character. The
polynomial-coordinate bridge of §7.3 is proved from ClassicalGroups Layer 3's
highest-weight cyclic span and does not assume all holomorphic sections are
ambient polynomial restrictions. *Needs:* §6.1, §7.1; LieGroups Layer 8;
HamiltonianReduction R1, R2; ComplexKahlerGeometry K7; ConvexityToric T3;
ClassicalGroups Layer 3.

**Checks.**

- GL₂, λ = (1,0): the orbit is ℂP¹, its moment map image under the diagonal
  torus is the segment from (1,0) to (0,1), whose first coordinate ranges
  over the unit interval, matching the Fubini–Study area 1, and every point
  of the orbit has spectrum (1,0); the generator convention iH in place of
  −2πiH would scale the image by 2π and flip it.
- λ = (0,0): the orbit is a point with moment value 0; λ = (c,c): the orbit is
  a point with moment value the scalar matrix cI, supplied by the central
  character although the projective action is trivial.
- The Segre image of three points is a point of P(Vλ⊗Vμ⊗Vν) whose moment map
  is the sum of the three spectra realized as Hermitian matrices: for
  diagonal highest lines it is diag(λ) + diag(μ) + diag(ν).

### 7.3 The invariant-to-moment-zero bridge

Build the invariant-to-moment-zero direction of projective Kempf–Ness for
these flag products. Define its polynomial coordinate space in degree d as
the dual of the cyclic span of `(vλ⊗vμ⊗vν)^d` in Sym^d(Vλ⊗Vμ⊗Vν) under
GL(N)³. Construct that span and identify it with `V_(dλ)⊗V_(dμ)⊗V_(dν)` by
the Cartan highest-line maps and ClassicalGroups Layer 3's classification,
including their product-group/external-tensor comparison. This is **dilation
of weights**, not the ordinary tensor power. Prove the equivariant restriction
from ambient homogeneous polynomials is surjective onto its dual, with kernel
exactly the homogeneous polynomials vanishing on the orbit. Build degree 0,
graded multiplication and the Cartan-product compatibility on these actual
coordinate spaces. Construct the finite-dimensional invariant lift through
this surjection using ReductiveGroups Layer 6's semisimplicity and its
comodule-to-rational-representation comparison; the Reynolds splitting and
its homogeneous-degree preservation are explicit adapters here. For d ≥ 1, a
nonzero invariant section has nonzero value at some point; its
positive-degree invariant homogeneous polynomial lift P gives a positive
lower norm bound on that point's GL(N) orbit, using |P(v)| ≤ C‖v‖^d for some
C > 0. The degree-0 coordinate space is retained in the graded algebra; its
constants supply no such norm bound. The Euclidean orbit closure has a
nonzero norm minimum by bounded minimizing sequences and finite-dimensional
compactness. Prove closure is GL(N)-stable, the Segre/flag cone is closed,
and the minimum represents a point of the same compact flag product. Polar
decomposition and differentiation along all Hermitian directions show its
moment map is 0. Build log-norm convexity, criticality/minimal-norm
equivalence, unitary covariance and central-character normalizations on
these orbits. The minimum can be in the closure rather than the original
orbit. These arguments prove nonzero invariant on a weight dilation ⇒
zero-sum Hermitian realization (Knutson–Tao–Woodward II, §8, the
Kempf–Ness direction). *Needs:* §7.2, §2.3; ReductiveGroups Layers 1 and 6;
ClassicalGroups Layer 3.

**Checks.**

- GL₁: an invariant in `V_a⊗V_b⊗V_c` exists iff a+b+c = 0, and then the
  1×1 Hermitian triple (a, b, c) sums to zero; for a+b+c ≠ 0 no zero-sum
  triple with these spectra exists.
- GL₂: `V_(1,0)⊗V_(1,0)⊗V_(1,0)` has no invariant (its central character is
  c³), while `V_(1,0)⊗V_(1,0)⊗V_(−1,−1)` has one, since `V_(−1,−1) = det⁻¹` and
  `V⊗V` contains `Λ²V = det`; the matrices diag(1,0), diag(0,1), diag(−1,−1)
  sum to zero with spectra (1,0), (1,0), (−1,−1).
- The degree-0 constants are invariant but give no norm bound: the trivial
  representation alone proves nothing about the orbit of a nonzero vector.

### 7.4 The real converse and the Schubert compression inequality

Prove the converse for arbitrary **real** spectra using Layer 6's
Grassmannian intersections. For a puzzle with k selected 1-positions I, J, K,
§6.7's triple product is nonzero. For any three eigenflags, approximate them
by §6.3's dense generic transverse flag triples; their intersections are
nonempty. Compactness of Grₖ and closed incidence conditions give a common
subspace V for the original eigenflags, also with repeated eigenvalues. Own
the required compression inequality: if A has antitone spectrum α and
`dim(V ∩ F_j) ≥ #(I ∩ {1,…,j})` for its top-eigenvector flag, then
`tr(P_V A|_V) ≥ Σ_(i∈I) α_i`. Prove the finite projection-trace identities,
positivity and `tr(P_V P_(F_j)|_V) ≥ dim(V ∩ F_j)` by an orthonormal basis
starting in the intersection. Expand A as α_N identity plus its nonnegative
spectral gaps times the top-eigenflag projections. Summing the three
compression inequalities for A+B+C = 0 gives the selected-1 sum ≤ 0, hence
every Layer 5 puzzle inequality and a real hive. Conversely approximate a
real hive by rational points of the **entire normalized rational hive cone**,
including points on faces, using §1.3's rational generators/lineality. Their
boundary spectra stay feasible because they are actual hives. Clear
denominators, apply §2.3's integral invariant formula and §7.3, then rescale
the Hermitian matrices. Native unitary diagonalization chooses uniformly
bounded representatives; compactness and eigenvalue continuity pass to the
limiting real spectra. Conclude real hive feasibility iff a zero-sum
Hermitian triple exists (`hermitian_iff_hive`). At integral boundary, Layer 4
supplies the undilated invariant and saturation. Export this specialized
flag/invariant/spectral equivalence, rather than assume Hilbert–Mumford,
real-weight destabilizing filtrations or singular symplectic-volume formulas.
Prove coordinatewise-addition closure through hives; matrix direct sum only
gives sorted union in larger rank (Knutson–Tao–Woodward II, §6 and the
Corollary of §6, items 1–2). *Needs:* §6.3, §6.7, §5.3, §7.1, §7.3, §1.3,
§2.3, §4.6.

- `hermitian_iff_hive`: a zero-sum Hermitian triple with sorted spectra B
  exists exactly when B is the boundary of a real hive.

**Checks.**

- The compression inequality with V the top eigenline and I = {1} is the
  equality `⟨v,Av⟩ = α₁`; with V an arbitrary line and I = {N} it is
  `⟨v,Av⟩ ≥ α_N`.
- Rank 2: the triple (1,0), (1,0), (1,−3) has no hive (§5.3's Check) and no
  zero-sum Hermitian triple: for γ = −reverse(ν) = (3,−1) the Weyl inequality
  `γ₁ ≤ α₁+β₁` reads 3 ≤ 2 and fails.
- Rank 2: the real triple (1,0), (1,0), (−1/2,−3/2) has the real hive with
  values 0, 1, 1, 2, 2, 3/2 (all three slacks 1/2) and the zero-sum witness
  A = diag(1,0), B = R diag(1,0) R* with R the rotation by 60°, so that A+B has
  trace 2 and determinant 3/4, hence spectrum (3/2, 1/2), and C = −(A+B) with
  spectrum (−1/2, −3/2). The boundary is not integral, so no integer hive and
  no invariant exists: the Hermitian theorem is about real spectra.

### 7.5 The Horn recursion

State and prove the Horn system in two-input convention. For N ≥ 1 and
1 ≤ r < N let U_r^N consist of r-subsets I, J, K of {1,…,N} satisfying
`ΣI + ΣJ = ΣK + r(r+1)/2`. Define T_1^N = U_1^N; for r > 1 retain exactly those
triples in U_r^N such that for every p < r and (F,G,H) ∈ T_p^r,
`Σ_(f∈F) i_f + Σ_(g∈G) j_g ≤ Σ_(h∈H) k_h + p(p+1)/2`, where I, J, K are listed
increasingly. Prove termination and the dictionary with Layer 6 rectangle
partitions (positions/reflections in the output are explicit). The recursive
condition is equivalent to the smaller-rank LR-positive/puzzle-feasible
triple by Layers 4–6: for I = {i₁ < ⋯ < i_r}, use
`λ(I)_a = i_(r+1−a) − (r+1−a)`, equivalently §6.2's word with ones at
`N+1−i_j`. Use the same formula for J, K, with the third invariant weight
dualized. Prove the position/reversal dictionary rather than dropping it;
establish it inductively in r. Then A+B has spectrum γ with input spectra α,
β iff total traces add and `Σ_(k∈K) γ_k ≤ Σ_(i∈I) α_i + Σ_(j∈J) β_j` for every
T_r^N. Derive it from Layer 5 and §7.4, with the selected 0/1/complement sign
conversion. Include the Weyl rank-1 inequalities, lower inequalities by
complement, all repeated eigenvalues and n = 2. Export the irredundant
rigid-puzzle form, decidable rational/integral feasibility and witness
conversion to hives; the matrix witness is an existence theorem unless a
numerical construction with proved error control is additionally supplied
(Knutson–Tao–Woodward II, §3.1 and §6). *Needs:* §7.4, §5.4, §6.2.

**Checks.**

- N = 2: T_1^2 = {(1,1,1), (1,2,2), (2,1,2)}, giving with the trace equation
  exactly the Weyl inequalities `γ₁ ≤ α₁+β₁`, `γ₂ ≤ α₁+β₂`, `γ₂ ≤ α₂+β₁`; the
  triple (2,2,1) is excluded by `ΣI+ΣJ = ΣK + 1`.
- N = 3, r = 2: the triple I = J = {1,2}, K = {1,2} satisfies `3+3 = 3+3` and
  the p = 1 conditions inside {1,2}, so `γ₁+γ₂ ≤ α₁+α₂+β₁+β₂`, a Ky Fan
  inequality; I = J = {1,2}, K = {2,3} fails the sum condition `6 = 5+3`.
- The dictionary sends I = {1,2} ⊂ {1,…,4} (r = 2) to the word with ones at
  positions 4, 3, that is 0011, the unit of Gr₂(ℂ⁴), and I = {3,4} to 1100,
  the point class.

### Examples

Rank 2 throughout: Weyl's inequalities are the three Horn inequalities of
N = 2, the triple (1,0), (1,0), (1,−3) is infeasible, and (1,0), (1,0),
(−1/2,−3/2) is feasible with the 60° rotation witness.

### Dependencies

Layers 1 (§1.3), 2 (§2.3), 4 (§4.6), 5 (§§5.3–5.4) and 6 (§§6.1–6.3, 6.7);
Mathlib's Hermitian spectral theorem; PolarDecomposition PD-A50–A53;
LieGroups Layer 8; HamiltonianReduction R1–R2; ComplexKahlerGeometry K7;
ConvexityToric T3; ClassicalGroups Layer 3; ReductiveGroups Layers 1 and 6;
Knutson–Tao–Woodward II, §§3, 6 and 8.

## Layer 8: type-A paths, crystals and object comparisons

### 8.1 Type-A path-crystal objects and the tensor convention

Specialize SchubertGeometry S4.1's path-crystal category and basic API to
finite normal type-A objects with weights in ℤⁿ, partial raising/lowering
`Fin (n−1) → B → Option B`, string lengths ε, φ, inverse/weight/string
identities, strict morphisms and connected components. Construct the actual
coordinate/reindexing and strict-isomorphism maps on these objects; do not
define a second generic category or infer a classification of arbitrary
edge-labelled graphs from rank-one identities. Build tensor product on the
ordinary product of sets with a **fixed** convention: use
Henriques–Kamnitzer §5's tensor convention, where e_i acts on a in a⊗b iff
ε_i(a) > φ_i(b), while f_i acts on a iff ε_i(a) ≥ φ_i(b); otherwise it acts
on b. An undefined chosen action returns none. Provide the reversal
equivalence with the left-highest/λ-translated-path convention. Prove
rebracketing, unit and connected-component transport. These are actual finite
maps, not Prop fields naming an unconstructed classification. *Needs:*
SchubertGeometry S4.1.

**Checks.**

- n = 2, B(1) = {u, v} with f₁u = v: in B(1)⊗B(1) the elements u⊗u and v⊗u are
  the highest ones (for v⊗u, ε₁(v) = 1 is not greater than φ₁(u) = 1, so e₁
  acts on u and is undefined), while u⊗v is not (e₁ acts on v); so
  B(1)⊗B(1) = B(2) ⊕ B(0) with the trivial component generated by v⊗u. The
  opposite (Kashiwara) convention makes u⊗v the trivial highest element.
- The unit crystal {∅} of weight 0 satisfies B⊗{∅} ≅ B strictly.
- n = 1 and n = 0: there are no operators, every element is highest and
  every object is a disjoint union of singletons.

### 8.2 Tableau and Gelfand–Tsetlin crystals and the Schützenberger involution

Equip native `TauCeti.BoundedSSYT n λ` and the skew tableau carrier SchurWeyl
provides (gap:skew-lr-tableaux) with signature operators. Own coplacticity (slides commute with these
operators), the semistandard Schützenberger involution ξ_λ : B_λ → B_λ with
weight **reversal** w₀wt, e_i ↔ f_(n−i) in one-indexed notation, and
involutivity. Pin the Bender–Knuth composition `s₁(s₂s₁)⋯(s_(n−1)⋯s₁)` and
prove its equality with evacuation/rectification. This is distinct from the
dual representation weight −w₀wt; signed determinant shifts add the same
constant on both sides. Build its straight/skew comparisons; SchurWeyl's
standard-tableau evacuation (gap:standard-evacuation) is a comparison, not the
definition of the semistandard operation. Prove preservation, string-length formulas, endpoint
content/weight identities, highest tableau, connectivity and that raising
terminates. Consume native `SemistandardYoungTableau.benderKnuth`,
`benderKnuth_involutive` and `content_benderKnuth`. Transport to native
Gelfand–Tsetlin patterns through `TauCeti.gtPatternEquivSSYT` and prove the
adjacent-row min/max formula and weight swap, with endpoint bounds taken from
the neighbouring row instead of ±∞ in ℤ. Compare with SchurWeyl's Schur
symmetry involution; it is not falsely identified with a Weyl-group action
satisfying braid. Include determinant-shift crystals by the native normalized
polynomial part, adding the constant weight without introducing infinite
tableaux. Use the Japanese-signature tableau operators transported through
§8.1's factor-reversal equivalence (Henriques–Kamnitzer §5). *Needs:* §8.1;
SchurWeyl gap:skew-lr-tableaux, gap:standard-evacuation; Tau Ceti `TauCeti.BoundedSSYT`, `SemistandardYoungTableau.benderKnuth`,
`benderKnuth_involutive`, `content_benderKnuth`, `TauCeti.gtPatternEquivSSYT`;
ClassicalGroups Layer 6.

**Checks.**

- GL₃, shape (2,1), entries displayed as 1, 2, 3 (native entries 0, 1, 2),
  with abc the tableau whose top row is a, b and second row c: the eight
  vertices are 112, 122, 132, 113, 123, 133, 223, 233; the complete lowering
  edges are f₁: 112→122, 113→123→223, 133→233 and f₂: 112→113,
  122→132→133, 223→233; every unlisted lowering action is undefined and
  raising reverses these edges. Subtracting (1,1,1) from the content weights
  gives the SL₃ adjoint crystal: six root weights and the two zero-weight
  vertices 123 and 132, which have different string data (123 has
  ε₁ = 1, ε₂ = 0; 132 has ε₁ = 0, ε₂ = 1), so a weight-set diagram alone does
  not specify this crystal.
- The Schützenberger involution on the shape (1) with n = 2 exchanges the two
  tableaux 1 and 2 and reverses the weight (1,0) ↔ (0,1); the dual weight
  −w₀wt would be (0,−1).
- The Bender–Knuth composition for n = 2 is the single involution s₁, which on
  the shape (2) sends 11 ↦ 22, 12 ↦ 12, 22 ↦ 11.

### 8.3 Coordinate paths and the comparison with the generic carrier

Specialize SchubertGeometry S4.1–2 to the type-A coordinate paths below.
Define the rational path presentation: a number of segments, a
strictly increasing rational time sequence from 0 to 1 and rational vertex
positions in ℚⁿ starting at 0 and ending at an integral point. Construct its
coordinate evaluation and normalization. Own the comparison maps between the
reparametrization quotient of these presentations and the generic specialized
path carrier of S4.1 for the type-A root datum: construct the map in each
direction with these coordinate formulas, prove that they are mutually
inverse on the quotients, that they transport endpoints, concatenation,
reversal and each raising/lowering operator, and that the generic
reparametrization convention agrees with the rational one by a common
rational normalization. Do not assert a bijection between unquotiented
presentations and paths. In coordinates these are rational piecewise-linear
paths [0,1] → ℝⁿ starting at 0, with finite rational breakpoints and rational
vertex positions, with integral endpoints, modulo nondecreasing continuous
surjective rational PL reparametrizations (take their equivalence closure).
Remove stationary segments and normalize by cumulative rational L¹ lengths
of nonzero linear segments; the constant 0 has its separate representative.
`H_i = π_i − π_(i+1)` is the coroot height. Transport the generic
running-extremum operators and prove equality with the actual type-A
coordinate formulas, including the multiple reflection/excursion
decomposition of Littelmann's §1: e_i is undefined if min H_i > −1 and f_i is
undefined if H_i(1) − min H_i < 1. Reflect only the record-decreasing pieces
for e_i and record-increasing pieces for f_i, leave intervening equal-height
excursions unchanged, and translate the final tail by +α_i/−α_i. Specify the
first/last record-height cut times and prove subdivision independence,
endpoint change, inverse, rationality and reparametrization invariance. For
the operator-stable components constructed in §8.4 prove all coroot global
minima are integers. For LS and column-word components additionally prove
**local** minimum integrality; on those components the operators simplify to
reflection of the entire first-minimum interval from m+1 to m for e_i,
respectively the last-minimum interval from m to m+1 for f_i. Prove the
simplification and ε_i = −m, φ_i = H_i(1) − m there. Ambient integer endpoints
or integer minima of one path alone are not an assumption that every
subsequent root-operator image stays integral. Build concatenation and
reversal with their operator/string/tie-case identities. These proofs compare
the actual operators and normalized representatives, not merely character
counts. On column-word components give the concrete local-minimum
integrality proof by their integral word/prefix heights; global-minimum
integrality on an arbitrary dominant-path component is not silently
strengthened to that local statement. *Needs:* §8.1; SchubertGeometry S4.1,
S4.2.

**Checks.**

- n = 2, the straight path π(t) = t(1,0): H₁(t) = t has minimum 0 > −1, so e₁
  is undefined, and H₁(1) − min H₁ = 1, so f₁ is defined and reflects the whole
  path to t(0,1), with endpoint (1,0) − α₁; f₁ again is undefined since
  H₁(1) − min H₁ = −1 − (−1) = 0.
- The presentations with times (0, 1/2, 1) and vertices (0, (1/2,0), (1,0))
  and with times (0, 1) and vertices (0, (1,0)) are the same path after
  removing the collinear break; a map on unquotiented presentations would
  separate them.
- The path t(1,−1) for n = 2 has H₁(t) = 2t with minimum 0 and H₁(1) = 2, so
  f₁ reflects only from the last time H₁ = 0 (t = 0) to the first time H₁ = 1
  (t = 1/2): the image is (t(−1,1) for t ≤ 1/2, then (−1/2,1/2) + (t−1/2)(1,−1)),
  with endpoint (0,0); reflecting the whole path would give endpoint (−1,1),
  which is (1,−1) − 2α₁ and wrong.

### 8.4 Components, LS chains and the column and row models

For each dominant λ build the finite path crystal generated from its
straight path by these operators and the equivalent crystal generated from
the dominant concatenation of its fundamental-column paths plus determinant
path. A fundamental-column path is the straight tω_k; read columns right to
left. The letter-path comparison uses Japanese reading, each column top to
bottom with letters 0, …, n−1 sent to coordinate paths e₁, …, eₙ. Prove the
comparison between each straight column component and its letter-path
component, then concatenate; this is distinct from the Knuth row word.
Prove a finite sequence/chain encoding: decreasing permutations modulo the
weight stabilizer, rational breakpoints satisfying the integral-chain
conditions: each break a admits a saturated decreasing chain of orbit
weights ξ₀ > ⋯ > ξ_s in **Bruhat order on W/W_λ**, with endpoints ξ₀ = τ_iλ,
ξ_s = τ_(i+1)λ (the corresponding dominance direction is reversed), and
ξ_j = s_β ξ_(j−1), β = e_p − e_q (p < q), pairing ⟨ξ_(j−1), β∨⟩ < 0 and
`a⟨ξ_(j−1), β∨⟩ ∈ ℤ` at every step. Prove root reflection/chain closure under
operators, including repeated weights. Specialize the type-A
adjacent-transposition/Bruhat conditions, consuming Mathlib `CoxeterSystem`
and RootSystems Layer 3's order/exchange, and prove equivalence with the
generated paths. This supplies the straight-path finiteness and the precise
LS-type encoding used here, rather than assuming all rational PL paths form
a finite highest-weight component. Prove the column-reading map from native
tableaux to the column-path component, its inverse by successive strip
shapes, and the highest-weight component equivalence with the straight-path
model. Prove operator, weight and cardinality compatibility. For an integral
central character χ = (c,…,c), pointwise π(t) + tχ is a formula on
parametrized representatives, not an operation on the ambient quotient by
arbitrary PL reparametrizations. On B(λ) use its unique λ-LS parametrization
with slopes in Wλ and send those slopes to W(λ+χ); handle constant/central
shapes separately. Prove the resulting B(λ) → B(λ+χ) preserves the operators
and shifts weight by χ: it is a strict crystal isomorphism AFTER twisting the
source weight by χ, equivalently from B(λ) tensor the one-point central
crystal T_χ. Its coroot heights, cut times and string lengths are unchanged.
For the chosen column/row models transport this map through their
straight-path comparisons and compare it with the explicit
determinant-prefix models; do not infer representative independence from
centrality alone. Also construct the row-reading comparison with rows taken
from top to bottom and entries within each row from right to left. Prove
this reading gives the same tableau crystal under §8.1's tensor convention as
the Japanese column reading. Explicitly realize a read word w₁…w_N as
w_N⊗…⊗w₁ under that convention, via §8.1's factor-reversal equivalence, and
prove the corresponding reversed-word insertion/coplacticity comparison. The
two readings can give distinct literal paths: compare their crystal
operators, endpoints and component isomorphisms rather than equating paths.
The source's unspecified order of rows is retained as a fidelity
uncertainty, not used to infer a different convention. For the row-coordinate
highest path, turn on polynomial-part coordinates successively, row 1 through
row n; precede this by the central determinant path for signed weights.
Prove the path remains dominant and compare its component with the straight
and column models by the same endpoint theorem. Specialize SchubertGeometry
S4.4's generic dominant-path deformation theorem to type A: any rational PL
path staying in the closed chamber with integral endpoint λ generates a
component strictly isomorphic to these models, carrying its distinguished
highest path to the highest tableau. Prove uniform positive-integer
stretching, subdivision and operator compatibility. Prove a uniform
root-operator distance estimate for a word of length L (the finite type-A
version of Littelmann's Lemma 3.1), and construct linked paths at level L
using subdivisions finer than its exponential bound. Build gluing pairs of
truncated LS paths, their a-chains and operator-stable integrality as in
Littelmann §§5.5–5.7. For two segments with dominant first endpoint and
dominant total endpoint, interpolate the split, prove linkedness at every L
and uniqueness of the highest endpoint, then obtain equality of
operator-word fibres (Littelmann §§6.1–6.3). Induct on segments and use
positive-integer stretching (Littelmann §§2.4–2.5) to clear rational
vertices, giving Littelmann's Theorem 7.1. These distance, level-L linking,
truncation/gluing, interpolation and stretching statements are the full
type-A specializations of the generic supplier, with actual
coordinate/subdivision/operator compatibility checked here. They do not
reconstruct a second generic proof engine from the tableau application.
Prove operator-stable integrality and finiteness, rather than assuming them
from integer endpoints. Rank 1 and n = 0 require no operators. *Needs:* §8.3,
§8.2; SchubertGeometry S4.3, S4.4; RootSystems Layer 3; Mathlib
`CoxeterSystem`.

**Checks.**

- n = 2, λ = (1,0): B(λ) consists of the two straight paths t(1,0) and
  t(0,1); a break a ∈ (0,1) between (1,0) and (0,1) would need
  `a⟨(1,0), α₁∨⟩ = a ∈ ℤ`, impossible, so there is no broken path and
  |B(λ)| = 2 = dim V.
- n = 2, λ = (2,0): the break a = 1/2 is allowed since `(1/2)·2 ∈ ℤ`, giving the
  path with slope (0,2) for the first half and (2,0) afterwards (slopes in
  decreasing Bruhat order), with endpoint (1,1); this is f₁ of the straight
  path, which reflects from the last minimum at t = 0 to the first time H₁ = 1
  at t = 1/2. So |B(2,0)| = 3 = dim Sym²V, with endpoints (2,0), (1,1), (0,2).
  The path with slope (2,0) first and (0,2) afterwards is not in B(2,0).
- The Japanese column reading of the tableau 12 of shape (2) (entries 1, 2),
  columns right to left, gives the concatenation of e₂ then e₁, the broken
  path above; the row reading from right to left gives the word 21, realized
  as 1⊗2 under the factor reversal, and the two readings have the same
  tensor-crystal component.

### 8.5 The path tensor rule and the hive comparison

Specialize SchubertGeometry S4.4's generic path tensor rule: concatenation
decomposes into highest-weight components with unique dominant path and
endpoints the corresponding dominant weights. The multiplicity of Vγ in
Vλ⊗Vμ is the number of paths in the μ-component with endpoint γ−λ for which
λ+π(t) is dominant for all t. Prove equality through the maps of §§8.3–8.4
with the independent tableau tensor/rectification component theorem,
preserving ε/φ convention and endpoint weights, and consume §2.3's
LR-to-representation comparison. This specialization and concrete comparison
do not become premises of the generic tensor theorem. In type A the
translated chamber condition maps explicitly to Henriques–Kamnitzer's η⊗b_λ
under factor reversal; the concatenation π_λ*η convention is Kashiwara's,
opposite Henriques–Kamnitzer's. Its dominant-path condition is precisely the
missing third hive rhombus family after the directional Gelfand–Tsetlin map
of §2.1. Export the actual finite equivalences from these path witnesses to
native Gelfand–Tsetlin image fibres, LR tableaux and hives, including all
inverse maps. After this component/tensor proof, Layer 9 builds the
recurrence/slide correspondence. Export its corollary identifying **which**
multiplicity object corresponds under rebracketing and the commutor. The
component/tensor proof itself does not assume that recurrence comparison or
coherence theorem. *Needs:* §8.4, §2.3, §2.1, §2.2; SchubertGeometry S4.4.

**Checks.**

- n = 2, λ = μ = (1,0): the μ-component is {t(1,0), t(0,1)}; (1,0) + t(1,0) and
  (1,0) + t(0,1) stay dominant, so γ = (2,0) and γ = (1,1) each have
  multiplicity 1, matching §2.3.
- n = 2, λ = (0,0), μ = (1,0): (0,0) + t(0,1) leaves the chamber, so only
  γ = (1,0) occurs; a rule without the dominance condition would count two.
- n = 2, λ = (0,0), μ = (2,0): of the three paths of B(2,0) only the straight
  path t(2,0) stays in the closed chamber; the broken path has slope (0,2)
  first and leaves it at once, and so does t(0,2). So `V_0 ⊗ V_(2,0) = V_(2,0)`,
  and the rejected broken path, with endpoint (1,1), is exactly the
  Gelfand–Tsetlin pattern of weight (1,1) that §2.1's remaining inequality
  `γ₁ ≥ λ₂ + μ₁ = 2` rejects. For λ = (1,0) the broken path stays dominant,
  touching the wall at t = 1/2, and `V_(1,0)⊗V_(2,0) = V_(3,0) ⊕ V_(2,1)`.

### Examples

GL₃, shape (2,1): the eight-vertex adjoint crystal of §8.2 with its two
zero-weight vertices; GL₂: B(1,0) and B(2,0) as path crystals and their
tensor products of §8.5.

### Dependencies

Layer 2 (§§2.1–2.3); SchurWeyl gap:skew-lr-tableaux and
gap:standard-evacuation; SchubertGeometry S4.1–5; RootSystems Layer 3; Mathlib `CoxeterSystem`; Tau Ceti `TauCeti.BoundedSSYT`,
`SemistandardYoungTableau.benderKnuth`, `TauCeti.gtPatternEquivSSYT`;
ClassicalGroups Layer 6; Henriques–Kamnitzer §5; Littelmann §§1–7.

## Layer 9: bounded recurrence, commutor and coherence

### 9.1 The quarter-octahedron commutor

After Layer 8's tableau/component theorem, consume Layer 3's full bounded
recurrence on `Y = [0,n]² × ℝ`, its parity lattice and all
interior/wall/corner variants, with its inverse-time, wavefront and
integral/PL APIs. The commutor region is the quarter-octahedron
`{x+y ≤ t ≤ 2n−x−y}`. Translate Henriques–Kamnitzer's triangle coordinates by
`(X,Y,Z) = (y,z,x)` before using its formulas. Thus in §1.1's coordinates
embed input Δₙ by `(x,y,z) ↦ (x,y,n−z)` and read output by
`(x,y,z) ↦ (y,z,n+x)`, subtracting f(0,0,2n) to normalize its A-corner. Prove
the raw map changes (λ,µ,π*) to (µ,λ,π*) with these exact directions. At n = 1
its new top label is −µ and the normalized boundary is (µ,λ,−λ−µ). Prove its
boundary interchange and preservation of all hive-face rhombi by the
transverse family (Henriques–Kamnitzer §4). *Needs:* §3.1, §3.2, §1.1.

**Checks.**

- n = 1: the input hive with values (0, λ, λ+µ) on A, B, C has raw output top
  label −µ, and after normalization the boundary is (µ, λ, −λ−µ): the two
  inputs are interchanged and the third entry is unchanged.
- Rank 2, λ = µ = (1,0), π = (2,0) or (1,1): each fibre has one hive and the
  commutor is the identity on it; for λ ≠ µ, say λ = (2,0), µ = (1,0),
  π = (2,1), it maps the unique hive of (λ,µ,π*) to the unique hive of
  (µ,λ,π*), which has different boundary values along the first two sides.
- Composing the commutor with itself returns the input: this is the
  involutivity proved in §9.2, which a raw map without the A-corner
  normalization would fail, since the unnormalized output is shifted by
  f(0,0,2n).

### 9.2 Slides, the Schützenberger commutor and coherence

Prove recurrence slices equal the successive jeu-de-taquin slides of SchurWeyl
(gap:skew-lr-tableaux) and
recording/rectification data (Henriques–Kamnitzer §7, Lemmas 7.10–7.14), with
Layer 8's coplacticity, and prove the quarter-octahedron map equals the
semistandard Schützenberger crystal commutor (Henriques–Kamnitzer, Theorem
7.15). These are comparisons of the actual finite maps. Layer 8's ordinary
product rebracketing then proves the Layer 3 associator's pentagon and unit
triangles; the crystal reversal proves the hive commutor's involutivity and
coboundary/cactus identities. No earlier commutor-involution theorem is
assumed. Give Henriques–Kamnitzer §6's rank-3 Yang–Baxter counterexample:
this commutor does not satisfy the symmetric-monoidal hexagon or braid law.
The basic Layer 3 excavation/ring theorem remains independent of this
coherent comparison. *Needs:* §9.1, §8.5, §8.2, §3.2; SchurWeyl
gap:skew-lr-tableaux.

**Checks.**

- Rank 2, `V_(1,0)^(⊗3)`: the pentagon identity holds on the two-element
  fibre of π = (2,1) (Layer 3's Example), where the associator is a
  bijection of two-element sets and the commutor of the first two factors is
  the identity.
- The commutor is an involution: on the one-element fibres of rank 2 this is
  immediate. The coboundary axiom
  `σ_(A,B⊗C) ∘ (1_A ⊗ σ_(B,C)) = σ_(A⊗B,C) ∘ (σ_(A,B) ⊗ 1_C)`, with the
  associator inserted, is what the cactus comparison proves; the braid
  relation is not asserted.
- Rank 3, Henriques–Kamnitzer §6's counterexample: for the gl₃ weights
  λ = (1,0,−1), µ = (0,0,−2), ν = (2,0,−1), ρ = (0,0,−1) and the pair of hives
  (M,N) displayed there, representing an element of
  `(L(λ) ⊗ (L(µ) ⊗ L(ν)))_ρ`, the two composites of associators and commutors
  in the Yang–Baxter equation send (M,N) to different pairs of hives (their
  bottom rows differ), so the equation fails; a braided structure would make
  the two composites agree.
- Negative control, rank 3: on the triple tensor product of the standard
  representation `V = V_(1,0,0)` the Yang–Baxter equation holds, because
  `V ⊗ V = V_(2,0,0) ⊕ V_(1,1,0)` is multiplicity-free, so the commutor
  `σ_(V,V)`, a crystal automorphism of `B ⊗ B`, is the identity on all nine
  elements and both composites are the identity on the 27 elements of
  `B^(⊗3)`; every rank-3 hive fibre with two boundaries (1,0,0) has at most
  one element, so the hive commutor is the identity there too. The failure
  needs the non-symmetric-power factors of the example above
  (Henriques–Kamnitzer §6, after equation (17)).
- Jeu de taquin as the recurrence slices: on the skew shape (2,1)/(1),
  entry 1 in the top box and 0 in the bottom box rectifies to the row `0 1`,
  and 0 on top with 1 below rectifies to the column of shape (1,1); a slide
  rule moving the larger entry into the hole would exchange the two answers.

### Examples

Rank 2 `V_(1,0)^(⊗3)` for the pentagon; Henriques–Kamnitzer §6's rank-3
example for the failure of Yang–Baxter.

### Dependencies

Layers 1 (§1.1), 3 and 8 (§§8.2, 8.5); SchurWeyl gap:skew-lr-tableaux;
Henriques–Kamnitzer §§4–7.

## Downstream consumers

- LieHighestWeight Layer 6F consumes §1.6's localization, common-chamber
  series and Fourier/distribution comparisons and §2.6's type-A root-lattice
  count, composes them with the Weyl character formula and owns the resulting
  GL₂, SU₂ and A₂ character examples; nothing of LieHighestWeight is consumed
  here.
- SchubertGeometry S9.5 restates the comparison maps of §8.3 between the
  type-A coordinate paths, the rational path presentation, the
  straight-path component, the
  column paths and the row/semistandard-tableau paths on the one hand and its
  generic S4.1–5 carrier on the other; SchubertGeometry S7.3, S8.5 and S9.1
  cite Layer 6's transverse Grassmannian point counts, puzzle rule and
  subspace/quotient/Plücker comparisons.
- The ClassicalGroups layer that fills gap:diagonal-overgroups and
  gap:diagonal-overgroup-restrictions consumes §2.3's hive counts for its
  tensor multiplicities; §2.7 here transports those counts along its maps.
- KacMoody names Layer 8 as the owner of the concrete type-A tableau,
  reading-word, signature and adjoint examples; its symmetrizable extensions
  do not build a second finite tableau theory.

## Worked examples

Each example names the course text it comes from and the published locator
against which it is checked.

- Rank-2 inequalities, gauge action, boundary duals and the
  Gelfand–Tsetlin difference/reconstruction with its uniform-gap stable range
  (hives handout pp. 1–2; notebook S1 pp. 78–82; Knutson–Tao I, Appendix 2;
  Henriques–Kamnitzer, Theorem 7.4): §1.1's rank-2 slacks and §2.1's three
  Checks. The source's precise gap statements are kept; the ambiguous sketch
  on S1 p. 81 is not used in place of the verified width threshold, and the
  signed Steinberg/Kostant/branching identities of the notebook's character
  pages are tested by §2.3.
- Exterior/determinant generators, the unique top hive, direct Pieri, both
  sums in the associativity identity and every local excavation inequality
  (hives handout pp. 3–6; S1 pp. 84–89 and 182–187; Knutson–Tao–Woodward, *A
  positive proof*, §§3–5): verified at n = 2 and on the nontrivial n = 3
  intermediate-boundary example of §3.2; the unique kink completion, all
  eight rhombi, repeated λ entries and the collapsed edge multiplicities of
  §2.4.
- `V_(2,1,0)²` decomposes as
  `V_(4,2,0) ⊕ V_(4,1,1) ⊕ V_(3,3,0) ⊕ 2V_(3,2,1) ⊕ V_(2,2,2)`, dimensions
  27+10+10+16+1 = 64 (hives handout p. 7; S1 p. 83; Knutson–Tao–Woodward, *A
  positive proof*, figure 2). Undo determinant shifts to the source's signed
  adjoint square. Identify the two SL₃ adjoint copies in alternating and
  symmetric squares by bracket and traceless symmetrized product, and the
  trivial pairing by trace, using ClassicalGroups' classical-group
  constructions.
- Breathing, nongeneric diagrams, overlay and tropical convolution, with the
  PRV witnesses of §4.4 (S1 pp. 90–97 and 188–190; Knutson–Tao I, §§3–5). The
  nonoverlapping-rhombus homework, including convex same-type regions and
  boundary force balance, is §5.2; its rank-6 inequality
  `λ₄+λ₅+μ₄+μ₆+ν₂+ν₄ ≤ 0` (words 000110, 000101, 010100), the corrected rank-5
  certificate `λ₄+μ₄+ν₃ ≤ 0` (words 00010, 00010, 00100), its cyclic
  counterpart `λ₄+μ₃+ν₄ ≤ 0` (words 00010, 00100, 00010) and the printed
  `ν₃` version as an acceptance **counterexample** (λ = (1,1,1,1,0),
  μ = (1,1,1,0,0), γ = (2,2,1,1,1), ν = γ* have a hive by exterior Pieri while
  `λ₄+μ₃+ν₃ = 1`) are §5.2's Checks (Knutson–Tao–Woodward II, §2). No single
  inequality is an iff criterion.
- Real-to-integer feasibility at integral boundary, all-puzzle and
  rigid-puzzle inequalities, deflation/inflation and the binary-word ring
  (S1 pp. 93–100; Knutson–Tao–Woodward II, §§3–5): `(σ0101)² = σ0110 + σ1001`
  in Gr₂(ℂ⁴), its unit σ0011 and the two puzzle fillings; all six Gr₂(ℂ⁴)
  cells, `σ0101⁴[Gr₂] = 2` and two lines in ℂP³ meeting four flags in general
  position (S1 pp. 108–111; Buch, §§2–3); `c₁(Q) = σ0101` with the bundle sign
  conventions. The exponent 4 and the four-letter word 0101 are the data.
- The rectangle quotient of Λ, partial-flag incidence maps and the
  Grassmannian homogeneous/Kähler structure (S1 pp. 106, 109–110; S2
  pp. 69–73; Buch, §§1–3; Fulton, *Young Tableaux*, §§9–10). Full-flag
  Bott–Samelson resolutions and generic Demazure restriction remain separate
  constructions; Layer 6 uses the finite Grassmannian incidence resolution.
- Native signed Gelfand–Tsetlin involutions and weight swaps, the
  quasi-Gelfand–Tsetlin/Kostant inverse and the type-A path↔Gelfand–Tsetlin
  and tensor-path↔hive equivalences (S1 pp. 177–180; S2 pp. 91–92;
  Henriques–Kamnitzer §§5–7; Littelmann §§1–7): §8.2's GL₃ adjoint crystal and
  §8.5's Checks. The general-field path motivation of S2 p. 5 and the generic
  Demazure path theorem of S2 p. 90 are not reported as proved by the type-A
  tensor connector.

## References

The two Lie Groups course notebooks (S1, S2) and Knutson's seven-page hives
handout are unpublished course texts; every statement taken from them is
stated here with a locator into one of the published works below, which is
the source of record for it.

- Knutson, A., Tao, T., *The honeycomb model of GLₙ(ℂ) tensor products I:
  proof of the saturation conjecture*, J. Amer. Math. Soc. 12 (1999), 1055–1090
  (arXiv math/9807160): §2 configurations and honeycombs, §3 diagrams and
  reconstruction, §4 overlay and PRV (the weak form, with the sum already
  dominant), §5 largest lifts (Theorem 2), §6 the saturation proof (Theorem 3
  and its Corollary), Appendix 1 the honeycomb count of Littlewood–Richardson
  coefficients (Theorem 4), Appendix 2 the hive model (Proposition 4) and
  figure 18's nonintegral vertex. Layers 1 and 4 build its finite-polyhedron
  and deformation prerequisites.
- Knutson, A., Tao, T., Woodward, C., *The honeycomb model of GLₙ(ℂ) tensor
  products II: puzzles determine facets of the Littlewood–Richardson cone*,
  J. Amer. Math. Soc. 17 (2004), 19–48 (arXiv math/0107011): §1.2 puzzles,
  §2 boundary certificates (Theorem 2), §3 facets via clockwise overlays and
  the chamber inequalities (Theorems 3–4), §4 gentle loops and rigid puzzles
  (Theorems 5–7), §5 inflation (Lemma 8), §6 Horn and §6.1 Fulton's
  conjecture, §8 the equivalence of the definitions of the boundary cone.
  Its appendix's invariant-to-zero-level passage is built explicitly by
  Layer 7; the real converse uses Schubert compression.
- Knutson, A., Tao, T., Woodward, C., *A positive proof of the
  Littlewood–Richardson rule using the octahedron recurrence*, Electron. J.
  Combin. 11 (2004), R61 (arXiv math/0306274): §2 hives (Theorem 1), §3 the
  representation ring, §4 the determinant and Pieri rules (Proposition 4),
  §5 associativity by excavation (Theorem 2), §6 honeycomb scattering.
- Henriques, A., Kamnitzer, J., *The octahedron recurrence and gl(n)
  crystals*, Adv. Math. 206 (2006), 211–249 (arXiv math/0408114): §3 the
  bounded recurrence (equation (5), Lemma 3.1), §4 operations on hives,
  §5 tableau crystals and the tensor convention, §§6–7 the equivalence of
  categories and its proof (Lemmas 7.10–7.14, Theorem 7.4, Theorem 7.15),
  §6 the failure of Yang–Baxter. Its coboundary commutor is not a symmetric
  braiding.
- Buch, A. S., *Notes on Grassmannians*, lecture notes (author's page): §1
  charts, §2 cells and intersections, §3 geometric Pieri (Theorem 3.9) and
  the Littlewood–Richardson comparison (Theorem 3.18). Its general
  cycle/transversality facts are built on the Layer 6 carrier using the
  cited AlgebraicTopology, CharacteristicClasses and DifferentialGeometry
  suppliers.
- Fulton, W., *Young Tableaux*, London Math. Soc. Student Texts 35,
  Cambridge University Press, 1997: Chapters 1–3 and §5.1–5.3 for the
  tableau and Littlewood–Richardson theory asked of SchurWeyl, Appendix A for
  evacuation,
  §§9–10 for the finite Grassmannian cell/cycle, incidence and integral
  Schubert ring proofs. Cited by locator; the book is not available online.
- Littelmann, P., *Paths and root operators in representation theory*, Ann.
  of Math. 142 (1995), 499–525 (doi 10.2307/2118553): §1 running-extremum root
  operators, §§2.4–2.5 stretching, Lemma 3.1 the distance estimate,
  §§5.5–5.7 gluing and linking, §§6.1–6.3 operator-word fibres, Theorem 7.1
  the dominant-path isomorphism. Cited by locator; Layer 8 constructs the
  type-A specialization and both coordinate-path and straight-path
  comparisons in full.
- Billey, S., Guillemin, V., Rassart, E., *A vector partition function for the
  multiplicities of slₖℂ*, J. Algebra 278 (2004), 251–293 (arXiv
  math/0307227): §§1.3–1.4 partition functions and chamber complexes, Lemma
  1.6 unimodularity of the type-A matrix, §4 after Lemma 4.3 the
  multiplicity function on regions, §7.1 the A₂ chamber complex.
- De Loera, J., Sturmfels, B., *Algebraic unimodular counting*, Math.
  Program. 96 (2003), 183–203 (arXiv math/0104286): the introduction and
  Theorem 1.1 (chamberwise polynomiality of degree n − rank), end of §3 for
  the wall agreement. The closed-support/internal-wall comparison is distinct
  from the exterior-zero case.
- De Concini, C., Procesi, C., Vergne, M., *Box splines and the equivariant
  index theorem*, J. Inst. Math. Jussieu 12 (2013), 503–544 (arXiv
  1012.1049): §§1–3 for the distribution/polarization conventions.
- Lenz, M., *Lattice points in polytopes, box splines, and Todd operators*,
  Int. Math. Res. Not. IMRN 2015 (arXiv 1305.2784): §2.2 (differentiating
  piecewise polynomial functions and limits) for the directional-boundary
  conventions.
- Beck, M., Haase, C., Sottile, F., *Formulas of Brion, Lawrence, and
  Varchenko on rational generating functions for cones*, Math. Intelligencer
  31 (2009), 9–17 (arXiv math/0506466): the cone-valuation conventions of
  §1.5.
