# Roadmap: tangential bordism, geometric cycles and characteristic numbers

**Summary.** Construct geometric bordism as a homology theory on spaces and pairs, compare
it with the corresponding Thom spectra, and compute its classical invariants.
The library includes actual collared witnesses, stable tangent and normal
structures, finite-codimension Pontryagin–Thom, unoriented and oriented
coefficients, low-dimensional Spin examples, characteristic-number detection
and projective-bundle transfers. A group at a point does not supply the theory
over a space, and a spectral isomorphism does not supply an explicit filling.

`README.md` is definitive. `Suggested.lean` states the finite Arf classification and smooth oriented
three-manifold parallelization headlines against the pinned
APIs; its docstring identifies the missing carriers for the geometric and spectral headlines. Implementation homes
include `TauCeti/Geometry/Manifold/Bordism/` and
`TauCeti/AlgebraicTopology/Bordism/`.

## Scope and ownership

BordismFormalGroups owns real/complex orientation formal laws, completed
projective coordinates and coefficient-law universality. StringOrientation is
a supplier of this roadmap: S1.1–S1.4 own the normalized String obstruction λ,
its classifiers and lifts, and S1.3 the existence and H³-torsor of lifts; S1.5
owns the Cayley plane OP² as the trace-one idempotents of the exceptional Jordan
algebra, F₄ with its transitive action and Spin(9) isotropy, the cells S⁸∪e¹⁶,
the ring H*(OP²;ℤ)=ℤ[u]/(u³), the classes p₂=6u, p₄=39u², Euler class 3u²,
signature 1, the unique Spin structure and the unique String lift class, and the
value p(HP²)=1+2u+7u²; S2.2 owns the structured Pontryagin–Thom isomorphism
Ω^θ_n≅π_nMθ for every bundle diagram θ, S2.3 the framed isomorphism
Ω^fr_n≅π_nS and the stem π₃S≅ℤ/24 with generator ν, and S5.3 the equivalence
MSpin[1/2]≃MSO[1/2]. StringOrientation S4–S5 and EllipticCohomology own the
Witten genus and the Cayley-plane kernel theorem; neither consumes anything
from here. Layer 9 below adds to S1.5 only the identification of its Jordan
algebra with LieHighestWeight's compact Albert carrier, the explicit idempotent
charts, the Peirce Clifford module with its pinned volume sign, the F₄ type
comparison, the smooth quotient through SmoothBundlesConnections B1.4, the Bott
clutching sign witness for u, and the Pontryagin classes of every HP^k.
PositiveScalarCurvature owns connection-metric
estimates, surgery and PSC classification; it consumes the bordism transfer
and KO kernel interfaces below.

Not owned here: the integral Hopf invariant one theorem and the
classification of parallelizable spheres (`sphere_parallelizable_iff`) are
HomotopySpheres §3C item5, built on CharacteristicClasses C7.3; the stable
trivialization `TSⁿ⊕ε¹≅ε^(n+1)`, the tangent classes of RP^m and the
non-immersion of RP^(2^k) in R^(2^(k+1)−2) are CharacteristicClasses C7.3
and C7.3a. No item below uses these theorems except the cited tangent
classes. Owned here and consumed by BordismFormalGroups and
HomotopySpheres: the mod p Steenrod algebras and Adams towers (B4.1–2,
B4.7), the subalgebra A(1)=⟨Sq1,Sq2⟩, its Q0 Margolis split-injection
criterion and the A(1) resolutions of B6.6; the finite Steenrod
sub-Hopf algebras beyond A(1) and general Margolis theory remain
BordismFormalGroups'. The finite-rank framed Pontryagin–Thom bijection
(B5.2), the geometric bordism theories over spaces and pairs with their
Pontryagin–Thom morphism of homology theories (B5.4) and the ΩSpin_2 filling
theorem (B3.2(c)) are owned here; the stable coefficient isomorphisms
Ω^θ_n≅π_nMθ and Ω^fr_n≅π_nS are StringOrientation S2.2 and S2.3, which B5.4c
and B5.5 consume and compare with the finite constructions.

SmoothBundlesConnections B1.4 owns free proper smooth quotients and their
principal/submersion comparison; B1.5 imports them and adds only cycle-structure
adapters. B1.7 owns the concrete quartic and elliptic-fibre-complement data
needed for the bordism comparisons; FourManifolds consumes these constructions
and this roadmap's quadratic, Wu and filling theorems. No FourManifolds
construction is a supplier to this roadmap; StringOrientation supplies the
sections named above and consumes nothing from here.

Finite quadratic Arf classification is owned here, on native quadratic forms;
SpinGeometry G4 supplies geometric Spin lifts. Generic bundle classifiers and
Thom spectra remain CharacteristicClasses C1–C2 and GeneralizedCohomology G5.

## Conventions

O/SO/Spin mean stable unoriented, oriented and Spin structures, with explicit
finite-rank representatives and stabilization. A normal diagram ξ consists of
actual maps B_k→BO(k), pullbacks of the designated universal bundles,
stabilization isomorphisms over B_k→B_(k+1), and their unit/composition laws.
For sums/products specify the compatible block-sum and permutation maps of
G5's bundle-diagram interface. Do not replace these data by an uninterpreted
predicate saying that a manifold has a structure.

For a stable rank-zero tangent classifier θ, the normal class is its inverse
and the corresponding normalized Thom spectrum is M(−θ). Construct that
inverse and its tangent–normal bundle isomorphisms. A fixed-rank MTθ(d)=
Th(−γ_d) has a different degree shift and may have negative homotopy groups;
it is not silently substituted for connective classical bordism.

Use outward-normal-first boundary orientation. A positively oriented interval
has boundary [1]−[0]; use the interval-first positively oriented cylinder I×M and reverse it when fitting
the M⊔(−N) witness convention. An oriented bordism from M to N
has boundary M ⊔ (−N), with its actual identifying diffeomorphism and induced
Spin/normal data. All parameter maps to X are continuous. X is not presumed a
smooth manifold. Relative cycles have maps (M,∂M)→(X,A); relative bordisms
have an additional face mapping into A, collars along every face and compatible
corner intersections. Stabilizations, signs and face identifications are data
with proved comparison laws.

Geometric groups have degrees n≥0, extended by zero in negative degrees for
the connective classical diagrams. They are graded modules over coefficients.
External products land in Ω_(p+q)(X×Y), and a dimension-shifted transverse
intersection product requires a smooth manifold target without boundary
and its separate construction: any such target for O, an oriented one for
SO and a Spin one for Spin, since the intersection inherits its structure
from the pulled-back normal bundle of the target's diagonal. There is no ordinary covariant bordism ring on every space X.

## Exact supplier contracts

### From Mathlib

Use native `SingularManifold` in Mathlib Geometry/Manifold/Bordism.lean, its
map, sum and product, and the witness/quotient shape of the unoriented-bordism
proposal for Mathlib,
[mathlib4#31350](https://github.com/leanprover-community/mathlib4/pull/31350). The proposed witness shape does not replace the constructions below.
Add Hausdorffness. Second countability follows from compactness and the
Euclidean chart model by native `ChartedSpace.secondCountable_of_sigmaCompact`.
Use finite-dimensional real models, native model-with-corners manifolds,
`Diffeomorph` and native continuous/smooth vector-bundle objects, with
`ContMDiffVectorBundle` on smooth bases. A classifier into an arbitrary CW
B_k and its pulled-back bundle are continuous, as B5 requires.

### From Tau Ceti

Use `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and
`LinearMap.BilinForm.IsAlt.even_finrank` from
`TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean` for the finite quadratic
basis. Use `TauCeti.IsOrientedAtlas` and
`TauCeti.IsOrientedAtlas.det_fderivWithin_pos` from
`TauCeti/Geometry/Manifold/Orientation.lean` for the chosen orientation in
`orientedThreeManifold_parallelization`: the atlas covers the manifold,
lies in its maximal smooth atlas, and has positive transition determinants.
The orientation and closed-subgroup declarations in the contracts below
retain their native hypotheses and chosen smooth structures.

### From TauCetiRoadmap suppliers

| Supplier | Consumed interface | Boundary |
| --- | --- | --- |
| [AlgebraicTopology](../AlgebraicTopology/README.md), Stages2–4,6,8 | arbitrary CW skeleta/cofibrations, ordinary chains/cochains/products, relative fundamental classes and duality, EM carriers and representability | B4 owns the integral higher diagonals and generic ordinary mod2 cup-i/Sq/Adem/Wu package; ordinary cohomology carriers remain AT |
| [DifferentialGeometry](../DifferentialGeometry/README.md), 2.1, 2.2, 5.5, 10.2 | 2.1's manifold orientation `Manifold.Orientation` (the quotient of `OrientationLift`, a model orientation with locally constant chart signs obeying the transition-Jacobian rule); 2.2's orientation-preserving maps, product orientations and the oriented-atlas criterion for boundaryless manifolds; 5.5's face-indexed abstract boundary of a manifold with corners; 10.2's manifold Sard theorem `dense_isRegularValue` | B1.1 owns the comparisons of this one orientation with cycle and witness records, frames, local homology, half-space and corner atlases in dimension at least2, and the point sign σ; B1.6 derives transversality from 10.2 |
| [GeometricTopology](../GeometricTopology/README.md), Layer1, Layer11 and item1 of the smoothing-and-triangulation comparison | collar neighbourhoods, gluing along a codimension-zero piece of the boundary, handle attachment and tubular neighbourhoods with their normal bundles (Layer1); the CW structure on the realization `|K|` of a simplicial complex, one cell per simplex (Layer11); Whitehead's smooth triangulation of a smooth manifold (item1) | B1.6 owns neat embeddings, relative/parametric transversality with relative Whitney approximation, corner rounding, compact neighbourhoods, doubles; B1.5 owns the relative boundary triangulation |
| [SmoothBundlesConnections](../SmoothBundlesConnections/README.md), B1.4 | free proper smooth quotients, their principal projections and submersion uniqueness, homogeneous spaces and native discrete quotient comparison | B1.5 only adapts their tangent and structure data to cycles |
| StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3 | S1.3's existence criterion and H³-torsor of String lifts; S1.5's Cayley plane OP² (trace-one idempotents of the exceptional Jordan algebra), F₄ with its transitive action and Spin(9) isotropy, the cells, H*(OP²;ℤ)=ℤ[u]/(u³), p₂=6u, p₄=39u², the Euler class 3u², signature 1, the unique Spin structure and String lift class, and p(HP²)=1+2u+7u²; S2.2's isomorphism Ω^θ_n≅π_nMθ for every G5 bundle diagram θ, natural and multiplicative; S2.3's Ω^fr_n≅π_nS and π₃S≅ℤ/24 with generator ν; S5.3's equivalence MSpin[1/2]≃MSO[1/2] | B5 owns the finite-rank bijections, the theories over spaces and pairs and the comparison of their point specializations with S2.2–S2.3; B4.8 owns the odd-primary Adams and comodule-algebra refinement; Layer 9 owns the carrier identification, charts, Clifford module, sign witness and the HP^k Pontryagin formula |
| [DGFloer](../DGFloer/README.md), Layer1 items2–3 | the ordinary homology and multiplicative cohomology Serre spectral sequence of a Serre fibration over a CW base, with local coefficients | B4.2 owns transgression, Kudo's theorem and Borel's transgression theorem, and B4.7 their odd-prime forms |
| [GeneralizedCohomology](../GeneralizedCohomology/README.md), G1–G5 | actual spectral homology on pairs, G1.1 morphisms of theories, G3.3's arbitrary-CW comparison theorem, G3.8 connective covers, finite duality and G5.2's unframed Thom collapse with its stabilized embedding comparison, compatible universal bundle diagrams with cofinal reindexing, MO/MSO/MSpin/MU^(2) and quaternionic smooth carriers, G5.5's ABS orientation | geometric cycles, ξ-lifts and PT, coefficient rings and transfer/kernel calculations are here |
| [TopologicalKTheory](../TopologicalKTheory/README.md), T1/T3–5/T7; [CharacteristicClasses](../CharacteristicClasses/README.md), C1–C4/C6, C1.3, C1.4, C7.3, C7.3a | fixed-rank classifiers, chosen ordinary Thom quotient, w/c/p/Euler classes, character/Thom corrections and algebraic ABS conventions; C1.3's finite faithful unitary representations of compact Lie groups and their smooth Stiefel approximations of BG; C1.4's smooth representatives of continuous principal bundles with compact structure group over smooth bases, with their relative homotopy versions; `TSⁿ⊕ε¹≅ε^(n+1)`, `w(T RP^m)=(1+a)^(m+1)` and the immersion normal bundle | B3.0 owns the Spin ABS genus comparison; B4 compares Sq with these same w classes; B6 supplies bordism calculations |
| [SpinGeometry](../SpinGeometry/README.md), G4, G5.0, G6.0, G6.7 | Spin lifts and H1 torsors, circle/surface refinements; G5.0's `realCliffordSpinorBundle` P×_Spin(n)Cl(0,n) with its negative tangent and positive external Clifford actions and signed grading; G6.0's `realSpinDiracClosedRealization` on the H1 domain, `realSpinLichnerowiczFormula` and `realSpinDiracIndexClass` in KO_n through GeneralizedCohomology G5.5's `realMixedCliffordIndexClassification`; G6.7's equation `realSpinDiracIndexClass = α·a` in KO₄ for the quaternionic index α | B3.0 compares that analytic class with the geometric ABS/PT genus; B3 proves Spin bordism classifications |
| [RiemannianGeometry](../RiemannianGeometry/README.md), R1 | the quotient metric on HP^d from the round S^(4d+3), its Riemannian submersion from Sp(d+1)/(Sp(d)×Sp(1)) and its sectional-curvature bounds 1 and 4 | B6.6 proves PSp3-invariance and positive scalar curvature on HP2 |
| [ClassifyingSpaces](../ClassifyingSpaces/README.md), Stage4 | `H_*(BG;ℤ)` identified with Mathlib's `groupHomology` of the trivial module | B6.3 applies it to finite cyclic groups |
| [IntegralLattices](../IntegralLattices/README.md) | integral lattice and real intersection-form algebra | B3.2(a) constructs the finite-F2 Arf invariant used by surface and Seifert refinements |
| [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md), Layer 8 compact real algebra suppliers; [LieGroups](../RepresentationTheory/LieGroups/README.md), Layers2,4; [SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md), Layer7 | `TauCeti.DivisionOctonionReal` with positive conjugation, norm and two-generator associativity; `compactAlbertAlgebra` with positive trace form, Peirce decomposition and primitive = trace-one idempotents; `compactAlbertDerivation_complexification` and `compactAlbertDerivation_killing_negDef`; generic closed subgroup smooth charts; the real Clifford classification and `Spin(3)≃S³` | B3 owns their idempotent/F4–Spin9 geometry, distinct from native split Zorn/Albert forms; SmoothBundlesConnections B1.4 owns free proper smooth quotients as principal bundles |
| IndexTheory, I1/I2/I3/I5, I7.2, I7.5; PseudodifferentialOperators; G5 graded operator comparison | compact elliptic/Dirac symbol-index and local regularity, Hilbert/Clifford configuration index; I7.2's `sign(M)=⟨L(TM),[M]⟩`; I7.5's `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` and `rokhlin_signature_dvd_sixteen` | B3.0 owns the closed Spin ABS/real-Dirac comparison; B6 constructs the homogeneous HP2 associated-family comparison and global transfer nullhomotopy |
| AffineMorseLefschetz A0, A5, A6; ComplexKahlerGeometry K7.1 | polynomial projective zero-locus carrier, smooth projective atlas, weak Lefschetz and Veronese comparison | B1.7 specializes them to the Fermat quartic and constructs its characteristic numbers |

## How to read the build

Layer 1 is independent finite quadratic algebra. Layers 2–3 construct geometry,
witnesses and the homology theory; Layer 4 constructs ordinary operations and
Adams towers independently of bordism coefficients. Layer 5 proves the finite
and stable structured comparison, and Layer 6 computes O and SO coefficients.
Layers 7–8 give ABS and low geometric classifications. Layer 9 identifies
StringOrientation S1.5's Cayley plane with the compact Albert carrier and adds
its explicit charts, Clifford module, sign witnesses and the HP^k Pontryagin
classes, and Layer 10 proves realization and projective-transfer theorems. The parenthesized B labels are stable target
locators: each subsection's Needs line specifies the actual inputs, including
independent subtargets within its layer.

Within each B-labelled subsection, “item n” means Bk.n for that same k;
it does not mean the nth subsection of the enclosing layer.

## Layer 1: finite quadratic classification

### 1.1 Finite Arf algebra (B3.2(a))

Construct `finiteQuadraticArf` for a finite-dimensional F2 vector
space with a quadratic refinement of a nonsingular alternating form.
Consume Tau Ceti's implemented
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank`
from `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis`. Construct only
the characteristic-two adapter: `q.polarBilin` is alternating by
`QuadraticMap.polar_self`, and Matrix.J's off-diagonal −1 equals +1.
Convert its native `Module.Basis (Fin m ⊕ Fin m)` to paired entries δ_ij,
same-half pairings zero and dim V=2m, including m=0. Define Arf as
Σ q(a_i)q(b_i), prove its equality to the basis formula for every such
basis, independence of basis, isometry invariance and orthogonal-sum
additivity. Prove the
hyperbolic/anisotropic-plane decomposition, with an explicit paired-plane
change of basis identifying two anisotropic planes with two hyperbolic planes.
Prove the intrinsic Gauss sum `sum_v (-1)^(q v)=(-1)^Arf * 2^m`; derive
the q-zero count `2^(2*m-1)+(-1)^Arf * 2^(m-1)` for m≥1, with count1
when m=0. Prove that Arf zero is equivalent
to a q-zero Lagrangian (including dimension zero). Export these constructors
and comparison maps for geometric surface and Seifert-form consumers;
this is the single generic F2 Arf owner.

For any such q of dimension 2m, state the basis-independence headline as
`finiteQuadraticArf_eq_of_symplecticBasis`, the integer-sum identity as
`finiteQuadraticArf_gaussSum`, and the equivalence between Arf zero and an
m-dimensional subspace on which q vanishes as
`finiteQuadraticArf_eq_zero_iff_lagrangian`. The sum uses any `Fintype V`;
finite dimension over F₂ ensures such a choice exists. There is no restriction m>0.
These are consequences of the paired-plane classification (Pyronneau, §2.1,
Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp.4–5): on one plane
sum the four signs, then multiply under orthogonal sums; a q-zero half-dimensional
subspace extends to a hyperbolic basis by modifying its complementary vectors.

The supporting definitions are `finiteQuadraticArfOfBasis`, the paired-basis sum,
and `IsQuadraticSymplecticBasis`, the three pairing equations. The proved
`quadraticPolar_isAlt` and `finiteQuadraticSymplecticBasis_exists` construct the
chosen basis used in `finiteQuadraticArf`; they are prerequisites for the invariant.

Its API includes:

- The basis formula agrees with the intrinsic invariant on every symplectic basis,
  and linear isometries preserve it.
- Orthogonal sums add the F₂ invariant and multiply the integer Gauss sum.
- A half-dimensional q-zero subspace exists exactly for the hyperbolic class;
  nondegeneracy makes it a Lagrangian for the polarization.

**Checks.**

- On the zero space the empty basis satisfies all pairing equations, its sum is 0,
  the Gauss sum is 1 and the zero subspace has dimension 0.
- On q(x,y)=xy the standard basis has pairing matrix [[0,1],[1,0]], Arf 0,
  values (0,0,0,1), Gauss sum 2 and the zero line spanned by (1,0).
- On q(x,y)=x²+xy+y² the same matrix has Arf 1, values (0,1,1,1),
  Gauss sum −2 and no nonzero q-zero vector. The zero bilinear form fails
  the mixed pairing equation, excluding an arbitrary basis of a degenerate form.
- Two anisotropic planes have Arf 1+1=0 and Gauss sum (−2)²=4;
  the diagonal subspace in their sum is q-zero and has dimension 2.

*Needs:* Mathlib `QuadraticForm`, `Submodule`, finite sums and finrank; Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`.

### Examples

The zero, hyperbolic and anisotropic forms distinguish both Arf classes; two anisotropic planes give the hyperbolic class in dimension four.

### Dependencies

Mathlib quadratic forms; Tau Ceti symplectic bases.

## Layer 2: cycles, structures and collared geometry

### 2.1 Relative differential topology (B1.6)

Own the differential-topology inputs of the geometric theory that the
suppliers do not state. Each is a smooth statement on finite-dimensional
real, Hausdorff, second-countable manifolds with corners in Mathlib's
sense. The orientation carrier and its chart signs, the oriented-atlas
criterion and face-indexed corners are DifferentialGeometry 2.1, 2.2 and
5.5; manifold Sard is DifferentialGeometry 10.2's `dense_isRegularValue`;
collars, gluing along a piece of the boundary, handle attachment and
tubular neighbourhoods are GeometricTopology Layer1; the CW structure on
`|K|` is GeometricTopology Layer11 and Whitehead's smooth triangulation
is item1 of GeometricTopology's smoothing-and-triangulation comparison.
This item owns the following.
- **Neat Euclidean embeddings.** Mathlib's
  `exists_embedding_euclidean_of_compact` gives, for a compact Hausdorff
  smooth manifold over any model with corners, a smooth closed embedding
  with injective derivative into some EuclideanSpace. For a compact
  manifold with collared boundary (GeometricTopology Layer1's collar)
  construct from it an embedding into a half-space R^(N−1)×[0,∞) that
  meets the boundary hyperplane exactly in ∂M, orthogonally along the
  collar, and that extends a prescribed neat embedding of ∂M after increasing the
  ambient dimension if necessary; give the
  relative version for bordisms with two end faces and a free face. Prove
  that any two such embeddings become isotopic rel boundary after a
  common stabilization. In a common Euclidean model use
  F_θ=(cosθ e₀,sinθ e₁), then apply inverse block rotation. At least one
  nonzero scalar coordinate factor preserves injectivity and the injective
  derivative; compactness gives an embedding. The endpoints are (e₀,0)
  and (e₁,0). Where e₀=e₁ on a prescribed collar the rotated map equals
  (e₀,0). Reparametrization gives a collared isotopy trace, and its
  derivative identifies the endpoint stabilized normal bundles. For neat
  embeddings keep the common nonnegative collar coordinate fixed and
  rotate only the remaining Euclidean coordinates.
- **Transversality.** From DifferentialGeometry 10.2's manifold Sard
  theorem prove the parametric transversality theorem: if F:M×S→N is
  smooth, with S and N without boundary, and F and its restriction to
  ∂M×S are transverse to a closed embedded submanifold Z⊂N, then for a
  dense set of s∈S both F(−,s) and its boundary restriction are
  transverse to Z (Lee, Theorem 6.35, pp.145–146, for the boundaryless
  parametric theorem); for corners apply it to the interior of each face, which
  are countably many. Prove relative Whitney approximation: a continuous
  map from a manifold with corners into N that is smooth on a
  neighbourhood of a closed subset C is homotopic rel C, by an
  arbitrarily small homotopy, to a smooth map (Lee, Theorem 6.26, p.141,
  for manifolds with boundary; the corner extension is constructed here;
  DifferentialGeometry 8.3 uses only the simplex case).
  Deduce relative transversality approximation: a continuous map from a
  compact manifold with corners to N, already smooth near C and with
  every face restriction transverse to Z near C (including the interior
  stratum), is homotopic rel C, by an arbitrarily small homotopy, to a
  smooth map transverse to Z on every face, using the finite-dimensional
  linear parameter family of a Euclidean embedding of N composed with
  GeometricTopology Layer1's tubular retraction. Apply it to the zero
  section of the finite smooth Grassmannian Thom spaces of B5.3. The
  homotopy fixes the prescribed face data on C at every time; any face
  required to stay fixed in its entirety is included in C and must
  already satisfy this facewise transversality condition.
  This relative facewise theorem extends Lee’s Theorem 6.36,
  pp.146–147: multiply its ambient perturbation parameters by a smooth
  cutoff vanishing near C, retain transversality on the fixed neighbourhood,
  and apply the parametric theorem on each remaining face stratum.
  Transverse preimages are neat submanifolds with normal bundle the
  pulled-back normal bundle of Z.
- **Corner rounding.** For manifolds with boundary M and N construct a
  smooth structure with boundary on M×N, and on a gluing along part of a
  boundary, by rounding the codimension-two corner in polar coordinates
  of a product collar; prove independence of the rounding up to
  diffeomorphism fixed away from a collar of the corner, its comparison
  with DifferentialGeometry 5.5's faces, and compatibility with
  orientations, Spin and normal structures and maps to X.
- **Neighbourhoods and doubles.** For a compact subset K of a
  Hausdorff second-countable smooth manifold M without boundary,
  construct a compact smooth codimension-zero submanifold with boundary
  containing K in its interior: take a regular value c, by
  DifferentialGeometry 10.2, of a smooth proper exhaustion function f
  with c above the maximum of f on K, and use f⁻¹((−∞,c]). For a
  compact M with collared boundary construct its double as
  GeometricTopology Layer1's full-boundary gluing of M and its reversal
  along the collar, with the reflection, the inclusion of M and the
  restriction of tangent, orientation and Spin data.

Its API includes:

- Neat embeddings, transverse inverse images and relative approximations retain the prescribed faces and their normal bundles.
- Rounding is fixed off the corner collar; compact neighbourhoods and doubles restrict to the original tangent/Spin data.

**Checks.**

- The function t↦t has a regular zero with derivative 1; t↦t² at 0 has derivative 0 and is not a transverse model.
- On M=[0,1], C={0}, Z={0}⊂ℝ, f(t)=t has ambient derivative 1 but derivative of rank 0 on the fixed endpoint face: no homotopy rel C can make that face transverse. The map f(t)=1+t misses Z on that face and satisfies the fixed-face condition.
- The rounded quadrant has one smooth boundary arc; the corner point cannot be kept as a smooth boundary chart unchanged.
- The double of [0,1] is S¹; the double of the empty manifold is empty.
- For a compact interval K in ℝ an exhaustion sublevel with larger radius contains K in its interior; equality at the endpoint radius fails this interior condition.

*Needs:* Mathlib `exists_embedding_euclidean_of_compact`; DifferentialGeometry §§5.5 and 10.2; GeometricTopology Layer 1 collars, gluing and tubes.

### 2.2 Model transport and structures (B1.1)

Construct the model-transport adapter along the ordered continuous linear
equivalence E_p×E_q≃L[ℝ]E_(p+q), for E_n=EuclideanSpace ℝ (Fin n).
Transport charts and IsManifold/BoundarylessManifold, prove identity,
composition, associativity and block-permutation laws, and compare tangent,
orientation and Spin bundles under the same adapter. Closed sources use
the boundaryless E_n model; n-dimensional relative sources use the native
Euclidean half-space model of dimension n (n>0), and bordism witnesses
use `modelWithCornersEuclideanHalfSpace (n+1)`. Face-indexed corner
models come from DifferentialGeometry 5.5's abstract boundary and B1.6's
corner rounding.
Dimension0 has empty boundary and no half-space-of-dimension0 model.
Construct O/SO/Spin cycles over X and compatible ξ-normal cycles. Reuse
native SingularManifold for closed sources, with T2 and second-countable
hypotheses. Give actual oriented frame reductions, Spin double-cover
lifts and normal classifier maps with bundle isomorphisms. Compare
finite representatives of stable structures, all higher stabilizations,
pullbacks, diffeomorphisms and changes of classifier lift by homotopy.
Use DifferentialGeometry 2.1's `Manifold.Orientation` as the single
manifold-orientation carrier, read pointwise through native
`Orientation ℝ (TangentSpace I x) (Fin n)` for the actual dimension-n
model I of the cycle or witness. This is the positive-scalar ray of a
nonzero alternating top form, used as the pointwise datum. Reuse
its locally compatible tangent-chart sections and comparison with AT's
local integral homology orientations; construct the adapters to these
cycle and witness records. For n>0 prove equivalence with the chosen
oriented orthonormal frame/SO reductions; the comparisons retain the
actual orientation, rather than only existence of a reduction.
Compare with refinements of native
`TauCeti.orientationPreservingGroupoid` only for the boundaryless model
in every dimension n≥1, where DifferentialGeometry 2.2's oriented-atlas
criterion is consumed, and for half-space and corner models of
dimension at least2, where this roadmap proves it: composing a boundary chart with a reflection
of a tangential coordinate (in a corner chart, a swap of two coordinates)
makes it positive. In model dimension1 with boundary no such atlas
exists: a half-line chart at 0 of [0,1] is increasing and one at 1 is
decreasing, so some transition has negative derivative, although [0,1]
is oriented (native `TauCeti.orientable_closedBall` assumes 2≤n for
this reason). There, and so for every bordism witness of a
zero-dimensional cycle and every one-dimensional relative source,
compare only through DifferentialGeometry 2.1's chart signs and the
frame and determinant descriptions. Construct reversal by the negative ray,
derivative pullback, the ordered product and outward-first boundary rule
on this datum, and prove that the frame, local-homology and determinant
descriptions agree in every dimension, and agree with the atlas
description in the dimensions just stated.
In dimension0 explicitly retain a sign σ(x)∈{+1,−1} at each point:
it selects the positive or negative ray of the scalar-valued empty
alternating form. Reuse native `Orientation.eq_or_eq_neg_of_isEmpty`;
every empty basis gives the positive ray, while the negative ray is a
separate orientation. Native `Orientation.map_of_isEmpty` fixes both
rays under every zero-dimensional linear automorphism. Thus a bare
rank0 atlas or SO(0) frame reduction does not replace this sign datum.
Identify this same σ with SpinGeometry G5.0's rank0 orientation sign
and signed real grading τ_σ=σ Id: the positive real point-line is even,
the negative point-line odd. Prove the comparison through positive-rank
stabilized oriented/Spin tangent data, with the specified trivial-line
orientation and coherent stabilization maps. Keep σ separate from the
geometric μ2 Spin-lift datum; native algebraic Spin(0) is the trivial
unit branch, and the μ2 branch has its own cofinal comparison.
Reversal changes σ, ordered products multiply point signs, and the
fundamental 0-class is the sum of σ(x)[x]. For the positively oriented
interval the outward-first rule gives ∂[0,1]=[1]−[0], with the same
signs after Spin forgetting. The degree-zero coefficient groups are
computed in B2.4, after the quotient exists.
Empty manifolds, disconnected zero-manifolds and products with points
retain these data and laws. DifferentialGeometry 2.1's carrier is the
only manifold-orientation carrier used, and no one-line native theorem
is restated.

Its API includes:

- Identity transport preserves the source and parameter map; composition and block sums preserve the same bundle identifications.
- Orientation reversal, ordered products and stabilization preserve their specified Spin/frame comparisons.

**Checks.**

- At dimension 0 the two point rays give signed counts +1 and −1 although their empty bases coincide.
- The positive interval has endpoint signs (−1,+1), with total 0; two positive signs would violate the boundary rule.
- Swapping two oriented one-dimensional factors has determinant −1; swapping a zero-dimensional factor has determinant +1.

*Needs:* B1.6 corner models; DifferentialGeometry §§2.1–2.2 and 5.5; SpinGeometry G4–G5.0; GeneralizedCohomology G5 bundle diagrams.

### 2.3 Quotient and bundle adapters (B1.5)

Supply the example/witness geometry before its bordism applications:
smooth free finite-action quotients from SmoothBundlesConnections B1.4's free proper principal
quotient (finite discrete groups are zero-dimensional Lie groups), including
their chart/covering/compactness and tangent-bundle comparisons; smooth
mapping tori from GeometricTopology Layer1's collared full-boundary gluing,
with explicit monodromy and
boundary identifications; unit disk/sphere bundles as smooth manifolds with
boundary using their fibre half-space charts, radial collars and native
vector-bundle transition maps. Compare all these chosen carriers with the
literal quotient/total-space sets and their topology. Consume Whitehead's
smooth triangulation of every smooth manifold without boundary
(GeometricTopology, item1 of the smoothing-and-triangulation comparison)
and the CW structure on the realization of a finite simplicial complex
(GeometricTopology Layer11). Own here the relative
refinement in which a collared boundary, or a chosen
union of faces, is a subcomplex: triangulate the double of B1.6 compatibly
with its reflection, or triangulate the boundary first and extend over
the collar by the product subdivision. This gives native finite CW pairs
for compact sources/witnesses; it precedes B2 weak-pair invariance and B5
lifting, independently of the bordism coefficients.

Its API includes:

- Imported quotient projections identify descended tangent data and preserve the cycle parameter map.
- Mapping tori retain monodromy; disc and sphere bundles retain their radial collar and boundary structure.
- Relative triangulation identifies the designated faces with a subcomplex and preserves the resulting pair maps.

**Checks.**

- Translation of ℤ on ℝ gives ℝ/ℤ=S¹ and a principal ℤ projection; the irrational ℝ-flow on T² is not proper and does not give a Hausdorff quotient.
- The free circle action on S³ gives CP¹ and the Hopf principal projection, whose fibre is S¹ rather than a discrete covering fibre.
- The identity mapping torus of S¹ is T²; a reflection gives the nonorientable Klein bottle.
- The trivial real line disc bundle over a point is [−1,1] with two boundary points; its rank-zero disc is a point with empty sphere boundary.
- The interval has two vertex cells and one edge, with its boundary the two-vertex subcomplex.

*Needs:* B1.6; SmoothBundlesConnections B1.4; GeometricTopology Layers 1 and 11 and smoothing item 1; CharacteristicClasses C1 bundle carriers.

### 2.4 Collared witnesses (B1.2)

Construct compact smooth collared bordism witnesses with continuous
parameter maps and actual structured boundary diffeomorphisms. Construct
cylinders, reversed witnesses, disjoint union and gluing. Use collars to
arrange constant parameter maps on the gluing collar, prove collar-choice
independence, and round product/gluing corners relative to fixed faces.
Prove that stabilized bundle structures glue and the induced boundary
structures have the stated signs. Prove reflexivity, symmetry and
transitivity by these witnesses, including their relative versions.

The ordinary oriented witnesses and collar gluing are Milnor–Stasheff,
§§17.1–17.2, Lemmas 17.1–17.2, pp.206–207; parameter maps occur in
Miller, Chapter 1, §1, Definitions 1.1–1.2, pp.1–2, and stable structure
lifts in Chapter 2, §1, Definitions 1.1 and 1.3, pp.39–41. The simultaneous
relative-face, structure-gluing and rounding comparisons here extend those
constructions using B1.1, B1.5 and B1.6, with the boundary data retained.

Its API includes:

- The cylinder is a reflexivity witness, reversal swaps its ends, and collar gluing composes witnesses.
- Disjoint union and rounding respect maps to X and boundary structure identifications.

**Checks.**

- The empty witness has empty boundary and zero signed count.
- Gluing two positive intervals at their matched endpoints leaves one negative and one positive endpoint, total 0.
- An interval with constant parameter x witnesses cancellation at x; it cannot cancel points in two different components of X.

*Needs:* B1.1, B1.5–B1.6; GeometricTopology Layer 1 collared gluing.

### 2.5 Relative cycles (B1.3)

Construct relative cycles and bordisms on pairs and triples; a free boundary
face maps into A. Keep face intersections and map restrictions in the
witness. Prove invariance under changing a relative representative by an
allowed collar homotopy, and compatibility of structure forgetting with
every witness operation. Give O/SO/Spin/complex/quaternionic normal
forgetting maps through the fixed G5 coordinate and orientation adapters.

Its API includes:

- Face restrictions commute at corners, and forgetting structure commutes with every face map.
- Collar homotopies fix boundary values and give equivalent relative representatives.

**Checks.**

- For A empty there is no free face, recovering the absolute cycles.
- For ([0,1],{0,1}), the relative interval has boundary [1]−[0], not zero in H₀({0,1}).
- For X=A every relative class becomes zero; forgetting the free face would leave an incorrect absolute class.

*Needs:* B1.1–B1.2; DifferentialGeometry §5.5; GeneralizedCohomology G5 structure maps.

### 2.6 Small representatives (B1.4)

Prove a small-representative theorem before defining a small quotient:
compact smooth cycles admit embeddings in some finite Euclidean space,
with codes for closed embedded representatives, finite atlases and
parameter maps in explicitly bounded universes. Construct equivalences
with the native bundled carrier and prove universe-lift comparisons.
Quotienting all Type-u manifolds does not itself produce a Type-u group.

Its API includes:

- Embedded codes represent every compact cycle and witness, and equivalence of codes preserves the parameter map.
- Changing universe transports quotient classes through mutually inverse maps.

**Checks.**

- A point embeds in ℝ⁰ and has one image point; the empty manifold gives the empty code.
- Two distinct points require an injective embedding in a larger ambient space; ℝ⁰ cannot encode them as two distinct image points.
- Two points mapped to different components retain two parameter values even if their tangent data agree.

*Needs:* B1.1–B1.3; Mathlib `exists_embedding_euclidean_of_compact`; B1.5 finite triangulations.

### 2.7 Quartic and elliptic filling examples (B1.7)

Construct the Fermat quartic as the projective zero locus Σ z_i⁴=0
in CP³, using AffineMorseLefschetz A0's projective zero-locus carrier and
ComplexKahlerGeometry K7.1's atlas. The derivatives 4z_i³ cannot all vanish
at a projective point, so its tangent-normal sequence has normal line 𝒪(4).
Use AffineMorseLefschetz A5 and A6's Veronese comparison to prove simple
connectivity. The adjunction trivialization of the canonical line gives the
Spin lift. Prove c₁=0, c₂=6h², ⟨h²,[K3]⟩=4, p₁=−12h²,
χ=24 and signature −16, independently of any bordism table
(Milnor–Stasheff, Problem 16-D, p.203; IndexTheory I7.2).

Construct the rational elliptic surface E(1) by blowing up the nine transverse
base points of a generic pencil of plane cubics. Use the local incidence
blowup charts (the tautological line over CP¹ glued to the punctured plane),
with exceptional normal line 𝒪(−1), and prove the oriented comparison
E(1)≃CP²#9(−CP²). Prove existence of the required pencil by transverse
intersection in the finite-dimensional cubic parameter space; the base
points come from the intersection of two cubics, rather than from nine
arbitrary points. Construct the smooth fibration away from its nodal values,
the regular torus fibre F, its trivial oriented normal bundle, and sections.
Use the local complex node uv=t, with its annular fibre and positive Dehn
twist, to compare the marked vanishing cycles with the two generators of H₁(F).
Prove the fibre class is 3H−ΣE_i and is characteristic, F²=0, χ(E(1))=12
and signature −8 (Gompf–Stipsicz, §§3.1 and 8.3).

Remove an open normal disc bundle of a regular fibre. On this compact
complement construct the Spin structure from the canonical bundle
trivialization away from the fibre, retaining the meromorphic two-form
and the actual boundary map ∂(E(1) minus F)→T²×S¹. Prove that its
restriction is the Lie Spin structure on all three circle factors by
comparing these frames and the outward normal; vanishing of w₂ alone
does not specify this boundary lift. Prove simple connectivity using the
marked vanishing cycles and the section, and signature −8 by the
relative intersection form. The induced stable framing is not asserted
to be the product Lie framing. These constructions supply the K3 and
Lie-spin T³ filling used by B3, including the actual boundary data.

Their API includes:

- Projective coordinate changes and the tangent-normal sequence preserve
  the chosen quartic carrier, complex orientation and canonical-line Spin lift.
- Blowup charts, exceptional classes and the regular-fibre tube identify
  the complement's boundary and restriction of its Spin structure.
- Reversing orientation negates signature; changing a tube through an isotopy
  transports its boundary identification and Spin lift.

**Checks.**

- On the Fermat quartic, vanishing of all four derivatives forces z₀=z₁=z₂=z₃=0, which is not a projective point; the affine cone does have this singular vertex.
- A degree-one plane in CP³ has c₁=3h, whereas the quartic has c₁=(4−4)h=0; the Spin argument uses the latter equality.
- For the quartic, c₂[M]=6·4=24 and p₁[M]=−12·4=−48, hence
  signature −48/3=−16 and Â=48/24=2. Its orientation reversal gives +16 and −2.
- Each blowup has exceptional square −1, so nine blowups give the intersection matrix diag(1,−1,…,−1); replacing these by trivial disc bundles would give nine zero squares and the wrong signature.
- For E(1), (3H−ΣE_i)²=9−9=0, χ=3+9=12 and signature=1−9=−8;
  deleting F×D² changes neither Euler characteristic nor signature.
- On the specified boundary, the three circle restrictions are nonbounding,
  giving (1,1,1) in the bounding/nonbounding convention. A meridian bounding
  a Spin disc would give (1,1,0) and would not identify the Lie Spin filling.

*Needs:* B1.5–B1.6; AffineMorseLefschetz A0, A5–A6; ComplexKahlerGeometry K7.1; CharacteristicClasses C3; SpinGeometry G4; IndexTheory I7.2.

### Examples

Signed points, collared intervals, the Hopf quotient, the Fermat quartic and the marked E(1) complement fix the geometric conventions.

### Dependencies

DifferentialGeometry §§2.1–2.2, 5.5, 10.2; GeometricTopology Layer 1, Layer 11 and smoothing item 1; SmoothBundlesConnections B1.4; SpinGeometry G4; AffineMorseLefschetz A0, A5–A6; ComplexKahlerGeometry K7.1.

## Layer 3: geometric bordism as a homology theory

### 3.1 Bordism quotient (B2.1)

Define the actual witness Setoid and its quotient using B1's small
representatives. Construct zero, addition and inverses by geometric
witnesses: unoriented inverse is the same cycle; oriented/Spin inverse
reverses the chosen orientation/structure. Prove all abelian group laws,
pushforward identity/composition and homotopy invariance. Prove 2ΩO=0
by a cylinder with its structured boundary identification.

Its API includes:

- The geometric operations descend to an abelian group and continuous maps induce functorial homomorphisms.
- Homotopic maps induce the same homomorphism, and twice any unoriented class is zero.

**Checks.**

- The empty cycle gives 0 and disjoint union with it preserves a point class.
- In SO, (+pt)+(−pt)=0; (+pt)+(+pt) has signed count 2 and is nonzero.
- In O, two points bound an interval and 1+1=0 in F₂.

The classical coefficient relation is the cobordism relation of Milnor–Stasheff, Chapter 17, §17.2; the parameter and pair versions are constructed here from B1.

*Needs:* B1.1–B1.4 witnesses and small representatives.

### 3.2 Products and coefficient action (B2.2)

Construct external products, coefficient action, the point unit and all
graded associativity/symmetry laws (native SingularManifold.prod supplies
the point case; construct parameter maps to X×Y on that product source),
with product tangent/normal models
and corner-rounding witnesses. In SO/Spin the interchange sign is
(−1)^(pq); retain the actual orientation and Spin permutation lifts.
For n≥1 and chosen image-point paths in X construct the connected-sum
trace over X: make each selected source-ball map constant by a supported
homotopy and map the connecting handle along that path. Prove connected
sum is bordant to disjoint union, with chosen structure gluings. Without
such a path, apply the statement only within a path component of X. For disconnected
cycles sum over components; do not introduce an unsupported dimension0
connected-sum operation.

For external products over spaces use Miller, Chapter 1, §1, p.2;
for the oriented coefficient product and its interchange sign use
Milnor–Stasheff, §17.2, pp.207–208. The relative structured products and
connected-sum comparison here are additional geometric constructions:
the latter attaches a single one-handle between the chosen balls on the
outgoing boundary of the disjoint cylinders, using the selected path in X.

Its API includes:

- External products are associative and unital over a point, with the stated interchange sign.
- Connected-sum traces preserve parameter maps when their chosen image points are joined by a path.

**Checks.**

- Positive point times negative point has sign −1; positive point is the multiplicative unit.
- Two one-dimensional SO factors interchange with sign −1=(-1)¹; two even-dimensional factors have sign +1.
- For two isolated target points x,y, the classes (1,0),(0,1) cannot be joined by a connected-sum trace over that target.

*Needs:* B2.1; B1.1 model/structure transport and B1.6 rounding; GeometricTopology Layer 1 handles.

### 3.3 Boundary and homology theory (B2.3)

Construct boundary Ω_n(X,A)→Ω_(n−1)(A), pair/triple long exact
sequences, excision and Mayer–Vietoris with their actual witness maps.
Use smooth separating hypersurfaces and collars for geometric excision
and prove naturality and connecting-map signs. Prove arbitrary disjoint
unions and filtered CW continuity from compact source support. For
arbitrary spaces/pairs compare with singular CW approximations and the
homotopy-cofiber pair convention; identify when literal subset relative
groups agree, rather than assuming every A→X is a cofibration.

Its API includes:

- Boundary is natural for pair maps and is the connecting homomorphism in the pair and triple sequences.
- Excision, disjoint unions and filtered CW continuity preserve the actual representative comparisons.

**Checks.**

- An interval over its endpoint pair maps to (−1,1), whose image under the sum map to ℤ is 0.
- For (X,X), every relative group is 0; for (X,empty), it is the absolute group.
- A finite collection of points in an infinite discrete space has finitely supported coordinates, not an arbitrary infinite product element.

The pair and arbitrary-CW extension is constructed here from the collar and finite-support arguments; it is not asserted to be the coefficient theorem of Thom IV.8.

*Needs:* B2.1; B1.3 relative faces, B1.5 finite support and B1.6 separating hypersurfaces; AlgebraicTopology Stages 2–4.

### 3.4 Orientation maps (B2.4)

Construct the fundamental-class orientation maps ΩSO_n(X,A)→H_n(X,A;Z)
and ΩO_n(X,A)→H_n(X,A;F2) by f_*[M,∂M]. Prove witness invariance from
AlgebraicTopology's relative fundamental class: for a compact oriented
witness W the boundary map sends [W,∂W] to [∂W], whose image in H_(n−1)
of W vanishes by exactness. Prove naturality, products and exact
sequences; the comparison with G5's spectral Thom-orientation maps is
B5.5. Spin maps factor through SO. In degree0 at a point these maps are
the signed count ΩSO_0→Z and the mod2 count ΩO_0→F2: witness invariance
at n=1 says the signed boundary count of every compact oriented
1-manifold is zero (and its unoriented boundary count even), which is
the relative fundamental class statement above, so no classification of
compact 1-manifolds is used. Prove them isomorphisms: k·(+pt) is a
right inverse, and a zero-manifold of signed count zero bounds disjoint
arcs pairing its positive and negative points (in O, pairing any two
points). Then +pt is the unit, ΩSpin_0→ΩSO_0 is an isomorphism through
B1.1's point signs, and forgetting to O sends the signed count to its
mod2 class. On a smooth target N without boundary construct transverse
intersection with dimension shift p+q−dim N, for O on every such N with
mod2 duality, for SO on oriented N and for Spin on Spin N, and prove its
comparison with ordinary cup/intersection under Poincaré–Lefschetz
duality, with all compact-support/relative hypotheses. The O case on
RP2 is a Check: two lines meet transversely in one point, so
[RP1]·[RP1]=[pt]≠0 in ΩO_0=F2, although RP2 is not orientable.

Its API includes:

- Fundamental classes descend through witnesses and commute with products and boundary.
- The degree-zero point orientation is signed count for SO/Spin and its reduction modulo two for O.

**Checks.**

- Positive and negative points map to +1 and −1; both forget to 1 in F₂.
- Points over x and y map to (1,0) and (0,1) in H₀({x,y};ℤ), and the constant target map sends both to 1.
- Two projective lines in RP² intersect in one point, giving 1 in F₂ despite nonorientability of RP².

*Needs:* B2.1–B2.3; AlgebraicTopology Stage 6 relative fundamental classes and duality; B1.6 transverse representatives.

### Examples

Points in distinct target components and the relative interval test parameter dependence and the connecting map.

### Dependencies

Layer 2; AlgebraicTopology Stages 2–6; GeneralizedCohomology G1.1.

## Layer 4: ordinary operations and Adams towers

### 4.1 Higher diagonals and squares (B4.1)

Construct the integral higher diagonals on AT's designated normalized
singular/simplicial Z chains using the actual free periodic Z[C2]
resolution, with natural degree-i maps D_i, graded tensor flip T and
D0 equal to AT's Alexander–Whitney diagonal. Pin the signed equation
`dD_i−(−1)^i D_i d=(1+(−1)^i T)D_(i−1)` for i≥1;
in particular `dD1+D1d=AW−T AW`. Prove unit/normalization,
relative-chain compatibility, acyclic-model construction and coherent
natural comparison of choices. Define the signed integral cup_i by
unsigned evaluation `(a⊗b)(x⊗y)=a(x)b(y)` on these same
diagonals, with AT's cochain differential δφ=φ∘∂ and cup0 equal
to AT's cup. Prove coefficient reduction to the F2 cup_i below. For degree2 integral c pin the identity
`δ(c cup1 δc)=c cup δc−δc cup c−δc cup1 δc`.
FourManifolds owns the resulting Z4 Pontryagin square, using
`c cup c+c cup1 δc`; its higher diagonals are supplied here.
Over F2 the equation is `dD_i+D_i d=D_(i−1)+T D_(i−1)`.
Prove unit/normalization and relative compatibility on the designated
normalized singular/simplicial cochains. Supply coherent higher symmetric-group diagonals needed
for Cartan and Adem; binary diagonal homotopies alone are insufficient.
Define Sq^k[c]=[c cup_(n−k)c], and prove well-definedness, naturality,
Sq0=id, instability, top square, addition, Cartan, Adem, suspension
stability and Sq1=Bockstein. Include all CW sets and relative groups.
Items1–2 precede Wu/MO/bordism consequences and depend only on AT/G
and graded algebra. Item3's Thom formula Sq(U_ξ)=w(ξ)U_ξ for real vector
bundles is owned here and uses no topological-manifold input; a
comparison of Stiefel–Whitney classes defined by the Thom identity on
TOP bundles with CC's linear classes along BO→BTOP restricts to this
formula on vector bundles and consumes item3 as well as items1–2. Smooth
Wu/Thom-number consequences here do not consume any TOP
tangent-microbundle comparison.

The higher-diagonal and square API includes:

- Integral diagonals satisfy the signed chain homotopy equation, and reduction modulo two removes its signs.
- Cup₀ is the ordinary cup product, and the induced squares are stable natural operations on absolute and relative cohomology.

**Checks.**

- On the positive edge [0,1], AW has terms [0]⊗[0,1]+[0,1]⊗[1]; AW−T AW is the boundary of −[0,1]⊗[0,1].
- For a degree-one generator a of H*(RP∞;F₂), Sq¹a=a² and Sq²a=0; replacing the instability bound by strict inequality would erase the top square.
- On a², Cartan gives Sq¹(a²)=2a³=0 and Sq²(a²)=a⁴. On the unit, Sq⁰1=1 and Sqⁱ1=0 for i>0.

For the ordinary squares and Thom identity use Milnor–Stasheff, Chapter 8 and
Chapter 11; the signed integral higher-diagonal construction is the extension
specified by the displayed chain equation.

*Needs:* AlgebraicTopology Stages 2–3 and 6 normalized cochains and cup product; DGAInfinity Layer 0 signed tensors.

### 4.2 Steenrod algebra, transgression and Adams convergence (B4.2)

Construct the stable operations on HF2 through actual EM universal
classes, loop comparison and G's HA model. Prove the Steenrod algebra
has its admissible basis and the dual Hopf polynomial generators ξ_i
of degree2^i−1, with coproduct and conjugation. On DGFloer Layer1's
multiplicative cohomology Serre spectral sequence of a Serre fibration
F→E→B over a simply connected CW base, construct the transgression as
the additive relation H^(q−1)(F)⊃dom→H^q(B)/indeterminacy given by
δ on H^(q−1)(F)→H^q(E,F)←H^q(B,*) and identify it with d_q from
E_q^(0,q−1) to E_q^(q,0). Prove Kudo's theorem: Sq^i of a transgressive
class is transgressive and the transgressions commute with Sq^i; prove
Borel's transgression theorem: if H*(F;F2) has a simple system of
transgressive generators and E is acyclic, then H*(B;F2) is the
polynomial algebra on their transgressions. Prove Serre's actual
H*(K(F2,n)) computation from the path-loop fibration K(F2,n−1)→P→K(F2,n)
by these theorems and induction on n, then
stabilize with the justified G3 Milnor/eventual-degree comparison to
H*(HF2)=A. Formal Adem relations do not alone compute this operation
algebra. Supply the module/comodule and graded tensor conventions.
Construct the mod2 Adams tower from the actual HF2 unit/smash fibres,
its exact couple and Ext_A bar-resolution E2 page. Reuse native
CategoryTheory.SpectralSequence and SpectralObject page/homology
objects; Adams dr has bidegree (r,r−1) on (s,t), lowering t−s
by1. Construct the ModuleCat F2 page adapter from the integral
homotopy exact couple; do not create a second page carrier. For every
bounded-below spectrum X prove strong convergence to π_* of the HF2
nilpotent completion of X, and identify that completion with
GeneralizedCohomology's derived2-completion. When each π_n X is finitely
generated this is π_*(X)⊗Z_2; this covers S, S/2, MO, MSO, MSpin, MU, ko
and their smash products with finite complexes. Finite mod2 homology
in each degree does not suffice for the tensor form: the Moore spectrum
of Z/2^∞ has π_0=Z/2^∞, whose classical completion is zero, while its
derived completion has π_1=Z_2. Control the tower lim1 and
multiplicative/naturality comparisons.
Prove their degreewise finite generation before converting a completed
surjection to a2-local coefficient surjection; completion is not silently
identified with localization.

The transgression, operation-algebra and Adams APIs include:

- Transgression is the specified relation modulo indeterminacy and agrees with the Serre differential; the prime-two simple system means a vector-space basis of ordered squarefree monomials, without prescribing each generator's square.
- The tower induces the native spectral sequence with natural multiplicative Ext comparison, and the completed abutment is compared to tensor completion only under the stated finite-generation hypothesis.

**Checks.**

- In F₂[a], the elements a,a²,a⁴,… form a simple system: a³=a·a² and a⁴ is the next element, not zero.
- The path-loop fibration of K(F₂,2) has the degree-one class transgressing to its degree-two fundamental class; squares of simple-system elements cannot be killed by declaring independent exterior factors.
- d₂ sends (s,t)=(1,2) to (3,3), so the stem drops from 1 to 0, not from 1 to 2.
- For the Prüfer group the classical completion is 0 whereas the first derived-completion group is ℤ₂, excluding the tensor formula without finite generation.

The algebraic Borel input is Guillou–Weibel v1, Theorem 6.2, p.18, at ℓ=2;
the Steenrod algebra computation is Miller, Chapter 1, Theorem 11.2.

*Needs:* B4.1; DGFloer Layer 1 items 2–4; AlgebraicTopology Stage 8 EM comparison; GeneralizedCohomology G2–G3 HA, towers and completion.

### 4.3 Thom and Wu classes (B4.3)

Prove Sq(U_ξ)=w(ξ)U_ξ for the same CC ordinary real Thom class,
including relative Thom quotients, stabilization, pullback and sums.
Construct Wu classes on closed manifolds by the actual duality pairing
and prove w(TM)=Sq(v). Give boundary/relative variants with their
correct pairings. FourManifolds consumes this generic package for
dimension4/SpinC/torsion consequences. Homeomorphic, indeed homotopy
equivalent smooth closed manifolds have matching SW numbers through
Wu/duality; item5 turns this into equality of unoriented bordism classes.
This does not identify their stable tangent bundles.

The Wu-class API includes:

- Duality determines each Wu class from the operation pairing, and the total class satisfies the stated Thom–Wu comparison.
- Diffeomorphisms and the stated relative duality comparisons preserve those classes and their characteristic numbers.

**Checks.**

- For RP², w₁=a, w₂=a², v₁=a and v₂=0; Sq(v)=1+a+a² has the required top term.
- On S², w₂ evaluates χ(S²)=2=0 modulo two and all positive Wu numbers vanish.
- For a trivial line, Sq(U)=U and w=1; for the tautological real line over RP∞, Sq¹U=aU, excluding the trivial-bundle formula.

The duality construction and its relation with w are Milnor–Stasheff,
Chapter 11, Theorem 11.14.

*Needs:* B4.1–B4.2; CharacteristicClasses C2–C3 ordinary Thom classes; AlgebraicTopology Stage 6 duality.

### 4.4 Odd-prime operations and simple systems (B4.7)

Construct the ordinary odd-prime Steenrod package on the same AT carriers:
for every odd prime p, a free C_p resolution and actual p-fold coherent
diagonal define P^i and the mod-p Bockstein β. Prove naturality, addition,
degree 2i(p−1), instability/top power, Cartan, Adem with β, suspension,
relative compatibility and the integral coefficient/Bockstein comparison.
Build the actual p²-fold/wreath-product C_p≀C_p⊂Σ_(p²) diagonal
comparisons and homotopies needed for odd Adem, not only a binary
p-fold resolution. These coherent resolutions and comparisons extend
the same higher-symmetric construction used in item1.
Fix the Milnor conventions by ξ_i of degree 2(p^i−1), τ_i of degree
2p^i−1, τ_0 dual to β, and their explicit Hopf coproduct/conjugation;
define Q_0=β and Q_(i+1)=P^(p^i)Q_i−Q_iP^(p^i), with the
corresponding dual pairing. Prove the admissible and dual-Hopf bases and
the odd-prime EM/path-loop comparison. At an odd prime p the
transgression of item2 is unchanged, and Kudo's theorem has two parts:
P^i and β of a transgressive class are transgressive, and the
transgression commutes with P^i and satisfies τβ=−βτ; and Kudo's transgression theorem, for transgressive
y∈H^(2k)(F;F_p) with τy=z, says that y^(p−1)⊗z survives to E_r,
r=2k(p−1)+1, with d_r(y^(p−1)⊗z)=−βP^k z, a class of degree
2kp+2, the transpotence of y (Guillou–Weibel, arXiv:1301.0872v1,
Theorem 6.5(1)–(3), p.19; the construction here proves the topological
cochain instance with the same differential sign). Borel's
transgression theorem uses a p-simple system: a totally ordered collection
of positive-degree homogeneous elements whose ordered monomials form an
F_p-vector-space basis, with exponents 0,…,p−1 on even elements and 0,1
on odd elements. No relation setting the pth powers to zero is imposed.
For a first-quadrant multiplicative spectral sequence with
E2=V⊗W as bigraded algebras, V=E2^(*,0), W=E2^(0,*), E∞=F_p in
bidegree (0,0), and such a system of transgressive generators in W,
prove that V is freely graded-commutative on their transgressions and
on the transpotences of the even elements. For an even y of degree 2k,
these have degrees 2k+1 and 2kp+2 respectively (Guillou–Weibel,
arXiv:1301.0872v1, Definition 6.1 and Theorem 6.2, p.18, specializing
the coefficient algebra to F_p; this restates Borel's theorem as cited
there from McCleary, Theorem 6.21). For a Serre fibration over a simply
connected CW base require the multiplicative E2 tensor comparison and
F_p-acyclic total space; degreewise finite-dimensional fibre cohomology
suffices for that tensor comparison, while the algebra theorem itself
uses the displayed E2 hypothesis. With the fixed transgression sign,
Kudo's secondary class is −βP^k τy; its sign does not change the
polynomial generator. Prove Cartan's computation of H*(K(Z/p,n);F_p) from these forms by induction
on n. **Checks.**

- For K(Z/p,1)→P→K(Z/p,2), H*(K(Z/p,1);F_p)=Λ(x)⊗F_p[y], y=βx, with
  p-simple generators x, y, y^p, y^(p²), …; the powers carry between
  successive elements, so y^p is nonzero. The theorem gives
  H*(K(Z/p,2);F_p)=F_p[ι₂,βP^1βι₂,…]⊗Λ(βι₂,P^1βι₂,…): degree3 is
  spanned by βι₂, whose square is zero, and degree 2p+2 contains the
  transpotence βP^1βι₂. Reading item2's statement at p would make βι₂
  polynomial, with (βι₂)²≠0 in degree6, and would miss βP^1βι₂.
- At p=3, y³ is the next simple-system element in degree6, whereas
  an independent truncated factor would give y³=0.
- At p=3 the first transpotence for K(Z/3,2) lies in degree8, while the
  first exterior class P^1βι₂ lies in degree7.
Use DGAInfinity Layer0's
signed graded tensor/dual infrastructure for the odd Hopf object and
its exterior Q_i: the braiding is (−1)^(|a||b|), so ordinary ungraded
HopfAlgCat is not substituted for it. Keep internal Steenrod t degree
distinct from the projective-resolution/Ext s degree. Consume native
categorical Ext and DGA bar/cobar/projective-module APIs, constructing
the homogeneous graded-module/Ext comparison and Yoneda-product signs.
Do this rather than using an abstract
relation algebra as an unexplained operation algebra. The same coherent
diagonal construction supplies each prime; Four's Z4 Pontryagin square
is a separate cup_i consumer.
For every odd prime p construct the HF_p Adams tower on the same native
spectral-sequence page carrier, its exact couple, bar-resolution Ext_(A_p)
E2 page and multiplicative/naturality comparisons, and prove item2's
convergence statement at p: strong convergence to π_* of the HF_p
nilpotent completion, which is the derived p-completion and equals
π_*(X)⊗Z_p when X is bounded below with finitely generated homotopy
groups. This tower uses no Pontryagin–Thom construction and no bordism
coefficient; it is the odd-prime tower consumed by item8,
HomotopySpheres and BordismFormalGroups.

The odd-prime and p-simple-system API includes:

- The bounded-exponent ordered monomials give unique vector-space coordinates; multiplication uses the original algebra and may carry to the next simple-system element.
- The transgressions and secondary transgressions freely generate the base algebra under precisely the displayed spectral-sequence hypotheses.
- Ordinary operations preserve coefficient, suspension, relative and product comparisons; the tower retains its completed abutment.

**Checks.**

- At p=3, y⁴=y·y³ has base-three digits (1,1), while y⁹ is the next basis-system element; neither value is zero in F₃[y].
- With τx=ι₂ and y=βx, τy=−βι₂=2βι₂ at p=3; applying β again gives zero on both sides since β²=0.
- The degree-three generator z has z²=−z², hence z²=0 at p=3; at p=2 this argument yields no vanishing. The transpotence has degree 2·3+2=8.

*Needs:* B4.1–B4.2 coherent diagonals and towers; DGFloer Layer 1 multiplicative Serre sequence; AlgebraicTopology Stage 8; GeneralizedCohomology G2–G3; DGAInfinity Layer 0 graded tensors.

### Examples

The path-loop fibration of K(ℤ/3,2) has an odd square-zero degree-three transgression and a degree-eight transpotence.

### Dependencies

AlgebraicTopology Stages 2–6, 8; DGFloer Layer 1 items 2–4; GeneralizedCohomology G2–G3; CharacteristicClasses C2–C3; DGAInfinity Layer 0.

## Layer 5: finite and stable structured Pontryagin–Thom

### 5.1 Normal classifier and collapse (B5.1)

Construct finite ξ_k-normal embedded cycles M^n⊂R^(n+k), with actual
Gauss/classifier lift ℓ:M→B_k and pullback isomorphism ν_M≃ℓ*ξ_k, where
ξ_k is the pullback of the designated universal γ_k along B_k→BO(k).
A classifier record consists of a continuous map ℓ, continuous linear fibre
isomorphisms and the induced homeomorphism of total spaces over M; require
the total-space map to send (x,v) to (x,ℓ_x(v)). Supplement it by
GeometricTopology Layer1's quotient normal bundle and tubular
neighbourhood of the specified embedding, the map
B_k→BO(k), its designated universal γ_k, and a specified homotopy
between the projected lift and the embedding's Gauss map, transporting
the bundle isomorphism along that homotopy.
Construct neat collared embedded bordisms in R^(n+k)×I and their
relative versions. Retain the actual embedding, Gauss lift, normal-bundle
isomorphism and map to the parameter space as part of each finite cycle.
Give compatible isotopy/structure-homotopy witnesses. Define the
coefficient collapse as GeneralizedCohomology G5.2's unframed collapse
S^(n+k)→Th ν_M of the embedding, followed by the Thom map of the
bundle map ν_M→ξ_k covering the lift ℓ:M→B_k into the designated G/CC
Thom quotient; own here only that ξ-factor, the half-space version for
collared relative cycles and bordisms, and their invariance. Item4 constructs the
collapse-with-parameter from these same tube data and the retained map
to X; keep that coordinate in its bordism invariance. For a fixed embedded smooth
normal-structured cycle prove independence of tubular/radius choices
and of auxiliary approximation or corner-rounding choices through the
specified compatible relative isotopies or embedded ξ-bordisms. Prove
invariance under those witnesses, preserving the actual boundary/collar
and normal-structure data. This does not identify arbitrary embeddings
of an abstract cycle, nor distinct smooth structures, at fixed codimension.
The generic tube is an open-subset diffeomorphism, including empty
embeddings; whole-total-space PartialDiffeomorph corollaries retain
their nonempty-source hypothesis.

The underlying classifier-factor collapse and its parameter coordinate are
Miller, Chapter 1, §§2–3, pp.3–7; Chapter 2, §1, pp.39–41 introduces the
stable lift data. Thom, §IV.4, Theorem IV.6, p.74 gives the classical
embedded comparison. The arbitrary ξ_k lift and relative-face adapters
here are additional constructions from the specified bundle maps and
collars; Thom IV.8, p.75 is only the stable coefficient comparison.

Its API includes:

- The classifier isomorphism covers the identity of M on total spaces and is fibrewise linear.
- Compatible structure homotopies and tubular isotopies give embedded structured bordisms and the same collapse class.

**Checks.**

- A trivial normal line with constant classifier collapses a positive point to a degree-one S¹ map.
- Changing the normal framing sign gives degree −1; an unmarked bundle isomorphism cannot identify those framed cycles.
- The empty embedded cycle collapses to the basepoint and requires no nonempty tubular-domain hypothesis.

*Needs:* B1.1–B1.6; CharacteristicClasses C1–C2; GeneralizedCohomology G5.2 unframed collapse and G5.3 normal diagrams.

### 5.2 Finite embedded comparison (B5.2)

For parameter space a point, construct the finite-codimension collapse
map from the quotient below to based homotopy classes [S^(n+k),Th(ξ_k)],
under the actual compact/CW/cofibration hypotheses, and prove it well
defined on embedded ξ-bordism classes. Item3 constructs its inverse by
transversality and proves both composites are identities; the
bijection is that theorem. Compare Euclidean and sphere embeddings with the marked-point
and ambient identifications specified. The source remains the quotient
of actual finite embedded ξ-normal cycles by the compatible embedded
bordisms of item1, not a quotient of abstract ξ-manifolds alone.
As a regression, let n=0, k=1, B_1={a,b} and ξ_1 be the trivial line.
Its Thom space is S1∨S1. The same four labelled signed normal points
a+,b+,a−,b− placed in R in that order have based collapse word
aba^(-1)b^(-1), whereas order a+,a−,b+,b− gives 1. Prove the former
is nontrivial in the free fundamental group, while both cycles have the
same abstract labels and signs. Keep this general ξ/finite-base case;
the framed-point specialization does not remove its embedding dependence.
The finite carrier is a based set until its group law is constructed;
k=0 does not inherit
stable disjoint-union addition. In particular a finite embedded
0-manifold in R0 has at most one point. Type π_(n+k) only with its
actual low-dimensional/component convention. Give every finite-stage
inclusion, suspension map, stable-range comparison and diagram.
Construct here the finite-rank framed interface used by this
specialization: for r≥1 and d≥0, compact closed smooth
d-submanifolds of a marked S^(d+r), missing infinity and equipped with
ordered normal rank-r frames, modulo actual collared rank-r embedded
bordisms missing the marked axis, correspond to based sphere-map classes.
The interface includes tube/regular-value choices, both inverse witnesses,
naturality, pinch addition and the domain-reflection inverse, with frames
transported by its derivative. It has no stable Bott, stable J or
Freudenthal premise; r=0 remains a separate finite based-set carrier.
It is proved from the general ξ construction of items2–3 with B_r a
point, not derived from the stable PT theorem.

In the specialization ξ_r equal to the trivial rank-r bundle over a
point, use that honest-rank unstable framed Pontryagin–Thom
theorem. Construct the actual carrier dictionary:
a classifier lift to a point and the chosen pullback isomorphism
ν_M≃R^r are exactly an ordered normal frame; compare this dictionary
on neat embedded bordisms, isotopies and structure homotopies, with
the punctured marked sphere/Euclidean ambient conventions fixed.
For r≥1 and d≥0 transport that bijection to
π_(d+r)(S^r), including the empty cycle, both inverse witnesses,
pinch/compression addition and its actual low-degree group laws.
Compare the unmarked and marked presentations by the actual
free/based homotopy action: the target is simply connected for r≥2,
while π1(S^1) acts trivially when r=1. Transport the regular-value
differential framing, radial degree-one collapse, relative smoothing
and collared homotopies through these carrier isomorphisms; no claim
that an arbitrary trace already misses the chosen axis is used.
Keep r=0's finite carrier and component conventions separate.
This B5 owns the finite-rank framed-sphere construction, the
ξ-structured carrier comparison and its general finite/stable
extension. Compare finite suspension with the stable PT map only
after the finite comparison, using the fixed sphere/disk, normal/
tangent, ordered target-frame and boundary conventions.

Its API includes:

- Collapse and regular inverse image are inverse on the finite embedded classes with the same normal lifts.
- Framed specialization, marked sphere comparison and suspension preserve the normal-frame data.

**Checks.**

- Ordered labelled points a+,b+,a−,b− give the reduced nontrivial word aba⁻¹b⁻¹; ordering a+,a−,b+,b− gives 1.
- For a single framed point, degree-one and constant sphere maps give respectively one positive point and the empty inverse image.
- At n=k=0, ℝ⁰ contains at most one embedded point, so arbitrary disjoint-union addition is not a finite-stage operation.

The classical stable coefficient theorem is Thom IV.8, p.75, and its form for every bundle diagram is StringOrientation S2.2; neither states a bijection at a fixed finite rank k. The finite embedded ξ statement here is a target extending that setting, with the embedding dependence of the labelled four-point example; its proof requires the actual two inverse constructions in B5.1–3, with compact sources and CW classifiers.

*Needs:* B5.1 and B5.3 inverse; B1.6 transversality; GeneralizedCohomology G5.2 Thom quotients. Construction of the forward map uses B5.1 alone.

### 5.3 Inverse for CW classifiers (B5.3)

Construct item2's coefficient inverse for arbitrary CW B_k without
assuming that it is smooth. Replace B_k→BO(k) by G2.10's `MappingPathSpace` endpoint
Serre fibration,
pull back over finite smooth Grassmannian carriers, approximate a map
into the projected universal Thom space away from the basepoint, and
apply B1.6's relative/parametric transversality there. Lift the homotopy to
the ξ data and retain the resulting normal-bundle isomorphism. Prove
the two inverse bordisms and independence of finite-stage approximation,
lifts and perturbations. A fibrewise or set-level inverse is insufficient.

Its API includes:

- The mapping-path replacement transports the normal lift along the smoothing homotopy.
- The inverse is unchanged under finite-stage refinement, relative perturbation and compatible lift homotopy.

**Checks.**

- For B_k a point, the normal lift is the ordered frame and the inverse of degree one is a positive framed point.
- A constant map at the Thom basepoint has empty regular inverse image.
- For the two-point base and rank one, the commutator word has four labelled points as inverse image; forgetting their order would collapse its nontrivial class.

Thom IV.8, p.75 supplies the classical coefficient comparison, not a theorem for arbitrary ξ and arbitrary pairs, and StringOrientation S2.2 supplies the stable isomorphism without a fixed-rank inverse. The mapping-path, Grassmannian approximation and lift-transport steps at fixed rank k are the extension proved here; each retains the stated finite-dimensional compact source and CW base hypotheses.

*Needs:* B5.1; B1.6 relative transversality; GeneralizedCohomology G2.10 mapping paths; CharacteristicClasses C1 finite Grassmannians. The two identities complete B5.2 without assuming its bijectivity.

### 5.4 Stable transformation on pairs (B5.4)

Stabilize the ξ_k carriers along the actual G5 diagram, transporting
normal structures by its specified bundle maps. Only here compare with
abstract stable ξ-cycles: retain the chosen stable tangent/normal datum,
its bundle isomorphisms and homotopies, and require both embedded
representatives to realize that same datum through the stated comparisons.
For closed M consume G5.2's comparison of two embeddings after a common
stabilization, an isotopy with its normal-bundle comparison, and
construct here the transport of the ξ-lift along it. For the relative
version use B1.6's stabilized block-rotation isotopy, with the common neat
collar coordinate fixed, and its collared trace; apply it only to embeddings
with the same prescribed boundary embedding and collar identification.
Construct the endpoint normal-bundle identifications
ν_(ei,0)≃ν_ei⊕R^N, derivative/Gauss homotopies, lifted ξ structures and
the comparison with the fixed abstract stable datum. These are required
proofs with coherence under further stabilization, not an unconditional
identification of arbitrary normal structures. Prove the resulting
structure-preserving isotopy/bordism comparison and its collapse/suspension
square before concluding independence of embedding choices for that
abstract stable ξ-cycle. Prove separation of disjoint sums and all
classifier/block-permutation laws in the same stabilized diagram.

**B5.4a. Collapse with a continuous parameter.** Use the single geometric
ξ-bordism homology theory of B1/B2, with the actual normal diagram and
its structure maps; prove B2's witness/excision/continuity constructions
for these ξ-structures before comparing theories. The finite bijection
of items2–3 is its coefficient construction. Items 4a–4b construct the
theory over spaces and pairs, which StringOrientation S2.2 does not state;
S2.2's coefficient isomorphism enters only in item 4c. For a closed embedded cycle
(M,e,lift,ν-isomorphism,f), f:M→X continuous, construct
`PT_(k,X):S^(n+k)→Th(ξ_k)∧X₊`. On a smaller normal disc tube use
its inverse to write a point as (m,v); send it to the smash class of
`(lift(m),v)` in the designated Thom quotient and f(m) in X. Map the
tube boundary and the complement to the basepoint. Use the actual
rescaling to the disc/sphere quotient and bundle isomorphism, not an
arbitrary global trivialization of ν. Prove continuity by quotient
gluing on the closed disc/complement; the value at infinity is the
basepoint and the empty cycle gives the constant map. Use G's
convenient pointed product/smash models and their quotient comparisons.
Arbitrary X is only a continuous coordinate: no smoothness or
transversality in X is required.

For a compatible embedded ξ-bordism W with its continuous F:W→X,
construct the full collapse homotopy using F on the tube footpoint
throughout the trace. Retain its endpoint/collar restrictions and
normal-structure homotopies. Prove independence of tube/radius and
auxiliary smoothing choices through those same parameter-preserving
traces, naturality for every continuous X→Y and invariance under a
homotopy of f. Compare with the coefficient collapse after X→pt.
Prove the finite suspension square for the actual ξ stabilization
bundle map and G's increasing-left suspension coordinates. Pass to the
stable class using these squares and prove compatibility with the
stabilized embedding/structure comparison already constructed above.
No finite-stage bijection over a parameter space is needed here.

**B5.4b. Relative faces and boundary comparison.** For a CW pair (X,A)
represent a relative cycle by a compact collared M with f(∂M)⊂A.
Make f constant in the collar direction by the explicit collar
retraction homotopy, keeping its boundary values; retain this homotopy
in the representative comparison. Use a neat embedding into a finite
half-space, with the given boundary embedding and normal ξ data on
its boundary face, and a product-compatible normal tube. Compactifying
the half-space gives a disc D^(n+k) with its boundary sphere. Construct
the actual map of pairs
`(D^(n+k),S^(n+k−1))→(Th(ξ_k)∧X₊,Th(ξ_k)∧A₊)`.
Its boundary uses the restricted map to A, and its infinity and
tube-complement parts use the basepoint. Pass through the quotient
comparison to obtain a based map to `Th(ξ_k)∧(X/A)`. On a relative
bordism keep the two end faces and the entire free face mapping into A;
the collared corner/tube construction supplies the required homotopy
of maps of pairs. Prove choice-independence and pair/triple naturality.
At n=0 the boundary is empty; interpret its boundary map as zero rather
than a negative-dimensional sphere. Stabilize first when a positive
ambient dimension is needed; retain the finite rank0 carrier of item2.

Construct the comparison with the homotopy-cofiber group for an
arbitrary map A→X through its mapping-cylinder CW replacement, retaining
both comparison maps and homotopies. For a CW subcomplex the actual
cofibration quotient identifies this with X/A; at A=∅ use X₊.
Do not assert that a literal quotient computes every arbitrary pair.
Compare the geometric free-face boundary with the spectral connecting
morphism by restricting the disc collapse to its boundary sphere.
Use outward-normal-first tangent orientations, the induced boundary
normal-bundle identification and G's fixed increasing-left suspension
order. Construct the sphere/Thom block-permutation adapters and prove
their sign equations, so that `δ_spectral PT=PT ∂_geometric` under
those fixed adapters. Check the positively oriented interval has
boundary [1]−[0] with the positive point unit; prove the same boundary
square in every degree, with no freely chosen simultaneous sign change.

**B5.4c. Natural transformation and CW comparison.** On the stable
geometric quotients construct the actual homomorphisms
`PT_(X,A):Ω^ξ_n(X,A)→π_n(Mξ∧Σ∞(X/A))`.
Prove them well-defined and natural, preserving the preceding boundary
and suspension comparisons. Compare disjoint union with sphere pinch
after stabilization, inverses and the point unit when the ξ diagram
has a unit. With the supplied block-sum maps prove external products
and coefficient actions through the actual Thom/smash permutation
diagrams, retaining the SO/Spin Koszul signs. Prove structure forgetting
using the specified maps of normal diagrams, not an untyped change of
structure predicate. Prove the excision and ordered Mayer–Vietoris
squares using B2's separating-hypersurface/collar witnesses and G1's
actual pair/cofiber connecting maps. Thus this is a morphism of the
specified homology theories, not merely a natural family at a point.

Prove the wedge/direct-sum and filtered-CW continuity squares. Compact
cycles, bordisms and their homotopies have image in a finite subcomplex
after the chosen CW comparisons; use the finite-support theorem for
small arbitrary cell sets. On the spectral side use G's sphere
compactness, smash/homotopy-colimit and cofiber comparisons. Retain
injectivity as well as surjectivity in these colimit comparisons; a
class becoming zero has a compact witness at a later finite stage.
The coefficient transformation is an isomorphism by StringOrientation
S2.2. Identify the point specialization Ω^ξ_n(pt) of the geometric theory
with S2.2's θ-bordism group of the same G5 bundle diagram: a cycle of B1–B2
is a compact manifold with a stable normal ξ-lift taken as data, and the
collar, embedding and witness records of B1–B2 are proved to exist for
every S2.2 cycle and bordism, so the two quotients coincide. Identify
PT_pt with S2.2's Pontryagin–Thom map, both the collapse onto a normal
tube of an embedding in a sphere with the stabilized embedding comparison
above. S2.2's isomorphism Ω^θ_n≅π_nMθ, natural in maps of diagrams and
multiplicative for product diagrams, then transports along these
identifications, together with its unit and suspension compatibilities.
Compare the stabilized finite inverse identities of items2–3 with S2.2's
inverse under the same identification; they give the inverse at each
finite rank, which S2.2 does not state. The Thom cells have dimensions
at least their bundle rank, so prove Mξ connective and the negative
coefficient groups zero, matching the geometric zero extension. These
statements require no coefficient ring calculation from B3, B4 or B6.

Prove that the geometric ξ-bordism groups with B2's boundary maps form
an unreduced homology theory on CW pairs in GeneralizedCohomology
G1.1's sense (homotopy invariance, the pair sequence with its connecting
map, excision and the direct-sum wedge axiom, from B2.3 and the squares
above), and that PT_(X,A) is a G1.1 morphism of theories, preserving the
boundary and suspension identifications with the fixed signs. Together
with the coefficient isomorphism above, G3.3's arbitrary-CW comparison
theorem gives the natural group isomorphisms
`Ω^ξ_n(X,A)≃π_n(Mξ∧Σ∞(X/A))` on all CW pairs, with the
preceding products, units, suspension, boundary/MV and forgetting
squares; no separate cell induction is carried out here.
Transport through the specified singular CW/homotopy-cofiber replacement
for arbitrary spaces/pairs. Construct the tangent–normal comparison
M(−θ) with the O/SO/Spin spectra on these actual transformations.
Construct the complex instance: take B_(2r)=B_(2r+1)=BU(r), with
BU(r)→BO(2r) the realification of the designated universal bundle,
BU(r)→BO(2r+1) its sum with the trivial line, the rank-2r→2r+1
stabilization the trivial-line inclusion and the rank-(2r+1)→(2r+2)
stabilization BU(r)→BU(r+1) with the bundle isomorphism
ε_ℂ=ε_ℝ⊕ε_ℝ. Prove that its Thom spectrum is GeneralizedCohomology
G5.4's MU^(2) by G5.3's cofinal reindexing to even ranks, and that
Ω^U_n(X,A)≃MU_n(X,A) through this transformation, together with the
comparison between stably complex tangent and complex normal structures.
MU's coefficient calculation, characteristic-number detection and
generators remain BordismFormalGroups'.
As an over-space test, positive points over the two components of
X={x,y} give the two distinct basis vectors of ΩSO_0(X)=Z² and of
MSO_0(X), while X→pt sums the coordinates. Include the relative
endpoint boundary test and the labelled four-point finite coefficient
test; neither its labels nor the map to X may be discarded.

Its API includes:

- Stabilization transports the fixed abstract normal datum and the continuous parameter map.
- The stable PT transformation commutes with boundary, external product, forgetting and CW colimits.

**Checks.**

- For e₀=e₁=e, inverse block rotation sends (cosθ e,sinθ e) to (e,0), fixing every prescribed collar point.
- Positive points over two target components give (1,0) and (0,1) on both geometric and spectral sides; forgetting the target sums them.
- The relative positive interval maps to the difference of its endpoint collapses, +1 at 1 and −1 at 0.
- The finite commutator word ab a⁻¹b⁻¹ has zero stabilized abelianized label counts (0,0), while its finite word is nontrivial.

The passage from this coefficient comparison to pairs is via the separately constructed homology-theory transformation and GeneralizedCohomology G3.3, not an extra assertion attributed to Thom IV.8.

*Needs:* B5.1–B5.3; B1.6 stabilized isotopy; B2.1–B2.3; StringOrientation S2.2 coefficient isomorphism; GeneralizedCohomology G1.1, G3.3 and G5.2–G5.4.

### 5.5 Framed and ordinary comparisons (B5.5)

Define the stable framed PT map as the special case of item4 with B a
point and ξ trivial, whose Thom spectrum is the sphere spectrum S. The
stable framed isomorphism Ω^fr_n≅π_nS is StringOrientation S2.3's, the
case of S2.2 for the contractible diagram; identify this specialization
with it through item4c's point comparison, and prove that its degree-zero
value is the signed count. Compare
the finite unstable framed embedded specialization of item2, which S2.3
does not state, with its stabilization. Compare the
fundamental-class maps of B2 with the actual Thom-to-HA spectral maps.
Pin the positive interval boundary [1]−[0] and G's increasing left
suspension/collapse coordinates. Prove the comparison of the geometric
boundary operator with the spectral connecting morphism on an interval
and in all dimensions; no simultaneous sign renormalization is left free.

The framed isomorphism is Miller, Chapter 2, §1, Theorem 1.4,
p.41 specialized to the trivial sequence of structure groups, whose Thom
spectrum is the sphere spectrum; it is consumed from StringOrientation S2.3,
not reproved. The ordinary fundamental-class map is Chapter 1,
§1, pp.1–2, and the ordinary Thom orientation is Chapter 1, §5, pp.12–14.
The relative boundary comparison with the fixed left-suspension sign is
proved here from B5.4 and the supplier’s connecting morphisms.

Its API includes:

- The framed transformation is natural under stabilization and preserves the point unit.
- Ordinary orientation maps agree through the same spectral Thom orientation and boundary adapters.

**Checks.**

- A positive framed point has stable degree +1 and a reversed framing has degree −1.
- The empty manifold gives stable degree 0.
- The interval boundary gives 1−1=0 after passage to coefficients, with the endpoint signs retained before augmentation.

*Needs:* B5.4; B2.4; StringOrientation S2.3 framed isomorphism; GeneralizedCohomology G5 Thom-to-ordinary orientation and sphere spectrum.

### 5.6 Umkehr comparison (B5.6)

For a smooth map g:N^d→P^e between closed smooth manifolds, construct
an umkehr g!:Ω^ξ_n(P)→Ω^ξ_(n+d−e)(N) when the stable virtual normal bundle
g*TP−TN carries specified stable ξ-normal data and the normal diagram has
the coherent sum maps needed to combine those data with a cycle. Use the
resulting Mξ Thom orientation in the spectral construction. For O every real virtual bundle is oriented; for SO and Spin
require respectively the compatible oriented and Spin virtual normal data.
Use an embedding of g into P×ℝ^r and its normal Thom collapse, independent
of the stabilized embedding. On a transverse smooth representative
f:M→P it is the fibre product M×_P N with its induced stable structure;
for continuous f use B1.6 approximation and its comparison witnesses.
Prove the geometric-to-spectral comparison with GeneralizedCohomology G5's
finite Atiyah duality. Prove the projection formula for the coefficient action,
functoriality for composable maps with the sum of their virtual normal data,
and transverse base change for a Cartesian square of closed smooth manifolds,
with the pulled-back normal orientation. For the relative version let A⊂P be a closed embedded submanifold, assume
g transverse to A, and put B=g⁻¹(A). Use cycles f:(M,∂M)→(P,A) whose
interior and boundary restrictions are transverse to g; relative approximation
is fixed near prescribed faces only when all incident face restrictions
are already transverse there, as in B1.6. Construct
g!:Ω^ξ_n(P,A)→Ω^ξ_(n+d−e)(N,B) by the fibre product and its collared
boundary, and prove its comparison with B5.4b. For open interiors use
the compact support retained by these relative cycles and collapse maps;
finite duality is applied to the compact manifolds, not their interiors.

Its API includes:

- Identity umkehr is the identity, and composite umkehr maps have degree shifts that add.
- Transverse fibre products realize the same class as the spectral Thom collapse.
- Pair boundaries and transverse pullbacks commute with the specified orientation adapters.

**Checks.**

- For the identity N→N the shift is d−d=0 and the fibre product is M.
- For a point inclusion in an oriented circle, the shift is −1; a degree-one circle cycle has one positive preimage point.
- Two transverse projective lines in RP² have one mod2 intersection point, although there is no SO fundamental orientation on RP².

*Needs:* B5.4–B5.5; B1.6; GeneralizedCohomology G5 finite duality and oriented Thom collapse.

### 5.7 Bordism AHSS (B5.7)

Construct the connective bordism skeletal/Atiyah–Hirzebruch spectral
sequence (AHSS) with actual geometric filtration, and compare it with
the spectral one through item4's isomorphism. Give E2=H_p(X,A;Ω_q),
naturality, coefficient monodromy where present, differentials and
convergence; finite total degree gives finite filtration for connective
coefficients. Do not infer collapse from an additive coefficient list.

Its API includes:

- The geometric skeletal filtration and its spectral counterpart agree under PT.
- Pair maps preserve the filtration, differentials and finite-total-degree convergence.

**Checks.**

- For X a point only filtration p=0 survives and the abutment is Ω_q.
- For connective coefficients and total degree 0 only (p,q)=(0,0) contributes.
- For two target components degree-zero coefficients are two copies of Ω₀, not their sum collapsed to a single copy.

*Needs:* B5.4; AlgebraicTopology Stage 4 CW skeleta; GeneralizedCohomology G3 homotopy-colimit and spectral filtration comparisons.

### Examples

The labelled four-point commutator distinguishes finite embeddings; its stable label counts vanish.

### Dependencies

Layers 2–3; StringOrientation S2.2–S2.3; GeneralizedCohomology G1.1, G2.10, G3.3 and G5.2–G5.4; CharacteristicClasses C1–C2.

## Layer 6: unoriented and oriented coefficient rings

### 6.1 Additive MO splitting (B4.4)

Compute H*(MO;F2) and its A action from the Thom formula; prove the
actual A-free basis and degree counts. Construct the underlying/additive
equivalence MO≃∨_d Σ^d HF2 with the specified multiplicities. Justify
HF2 detection: first compute π0MO=F2 and nullhomotope2 id_MO using
its ring unit. The comparison cofiber has bounded-exponent homotopy,
so a least nonzero group would be detected by stable integral Hurewicz
and mod2 reduction. Prove wedge/product comparison using connectivity
and finitely many basis degrees below any bound. Alternatively prove
the full convergent Adams/2-completion route. No E∞ HF2-algebra
splitting is inferred from this additive equivalence.

The additive splitting API includes:

- The basis degrees give the multiplicities and both maps of the underlying spectral equivalence.
- Connectivity gives the degreewise wedge/product comparison; it supplies no multiplicative HF₂-algebra equivalence.

**Checks.**

- In degree zero the multiplicity is one and π₀MO=F₂.
- Degrees 1,2,3 have multiplicities 0,1,0, matching the absence of generators in degrees 1 and 3.
- Degree 4 has two monomials, x₄ and x₂²; counting only indecomposables would give the wrong multiplicity one.

*Needs:* B4.2–B4.3; CharacteristicClasses C3 cohomology of BO; GeneralizedCohomology G5.4 MO and stable Hurewicz. The alternative Adams route uses B4.2.

### 6.2 Characteristic-number detection (B4.5)

Define all SW numbers and the joint invariants
⟨w_I(TM) cup f* a,[M,∂M]⟩, with
a∈H^(n−|I|)(X,A;F2). Prove their witness invariance and the converse
detection theorem for ΩO_n(X,A), using B5 and the actual additive MO
calculation. Arbitrary CW and arbitrary coefficient cardinality are
included; characteristic numbers at a point do not detect all cycles
over X. Give the ordinary closed-manifold Thom converse and its
constructive nullbordism consequence.

Its API includes:

- Every partition and complementary-degree relative class gives a witness-invariant number.
- All such numbers together detect the class, including its parameter map.

**Checks.**

- At a point in degree 0 the empty partition evaluates 1 on one point and 0 on the empty cycle.
- Over {x,y}, the degree-zero class supported at x evaluates 1 on the x-point and 0 on the y-point.
- On RP², w₁² and w₂ both evaluate 1; on S² both evaluate 0 modulo two.

*Needs:* B4.4 and B5.4; B2.4; AlgebraicTopology Stage 6 field-coefficient duality.

### 6.3 MO multiplication and real hypersurfaces (B4.6)

Prove ΩO_*≃F2[x_d : d>0, d≠2^j−1] as a graded ring by its actual
geometric multiplication. For even d take RP^d. For odd d with d+1=
2^r(2s+1), r,s≥1, take the real(1,1) incidence hypersurface
H(2^r,2^(r+1)s) in RP^m×RP^n, of dimension m+n−1=d.
Treat the incidence equation as a section of the tensor of the two
dual real tautological lines; in affine trivializations prove its derivative
is surjective on its zero set and construct the regular-value submanifold
of the projective incidence subtype defined by that equation. Compare overlapping level
charts, the normal line and the inclusion, using B1.6's transversality and AT's
real projective atlas. Prove representative independence, smooth regularity and
w(TH)=(1+x)^(m+1)(1+y)^(n+1)/(1+x+y).
Compute its top Newton number as binom(m+n,m) mod2 and prove it
equals1 by Lucas; m,n≥2 eliminates the exceptional pure-power terms
(Milnor–Stasheff, Problems 16-D–F, TeXromancers edition, pp.203–204).
Both are even, so this odd generator is orientable; choose its orientation.
The factors (1+x)^(m+1), (1+y)^(n+1) are CharacteristicClasses C7.3a's
`w(T RP^m)`. Prove the even RP
Newton value d+1=1 mod2, the indecomposable criterion, independence
and spanning. Use monomial symmetric characteristic numbers for
products: Newton-power products lose repeated factors in characteristic2.

Its API includes:

- Rescaling either projective representative multiplies the incidence equation by a nonzero scalar, preserving its zero locus.
- The normal line is the tensor of the dual tautological lines; its tangent SW formula gives the top Newton value.

**Checks.**

- For m,n≥1, (e₀,e₁) has incidence 0 and (e₀,e₀) has incidence 1, separating membership from the entire product.
- For H_R(2,4), dimension is 5 and the top Newton number is binom(6,2)=15=1 modulo two.
- For H_R(1,2), the dimension is 2 and its Newton number is 0, whereas binom(3,1)=1 modulo two; the m,n≥2 hypothesis is necessary.
- RP² has top Newton number 3=1 modulo two; RP¹ has 2=0.

*Needs:* B4.4–B4.5 and B5.4; B1.6; CharacteristicClasses C7.3a; AlgebraicTopology real projective carriers.

### 6.4 Odd-primary SO and Spin comparison (B4.8)

Using item7's HF_p Adams tower, consume CharacteristicClasses C3.6's finite
and stable BSO cohomology over Z[1/2]/F_p and its actual plane-torus
restriction. Prove the odd Thom formula on the same real oriented Thom
class `P(U)=∏_j(1+x_j^(p−1))U`; derive it from the oriented2-plane
class/top-power calculation, the supplied injective splitting and Cartan,
then stabilize and prove pullback/relative compatibility. Include Euler
classes at finite even rank, rather than treating finite BSO as stable.
Compute H_*(MSO;F_p) with its actual Thom-ring multiplication and
A_p* coaction, consuming CC C3.3's away2 Whitney multiplicativity
and the proved Künneth comparison for the BSO coproduct. Prove the orientation-to-HF_p homology map has image
P_*=F_p[ξ_1,ξ_2,…], hitting each ξ_i up to decomposables by the
Thom reduced-power/Newton calculation. Construct compatible triangular
lifts and the Milnor–Moore **comodule-algebra** splitting
`H_*(MSO;F_p)≃P_*⊗C`, where C is polynomial on degree4k
generators with 2k+1≠p^j. Prove its coaction/multiplication and
Poincaré series `∏_(2k+1≠p^j)(1−t^(4k))⁻¹`; C's monomials give
the degreewise basis. A vector-space/module decomposition alone cannot
compute a coefficient ring. Dualize degreewise to the corresponding
A_p//E(Q_0,Q_1,…) summands, and prove A_p free as a right E-module
by the actual Milnor basis. Construct multiplicative change-of-rings for
the infinite exterior Hopf subalgebra by finite/bar comparisons. Obtain
the **algebra** `E2=F_p[v_0,v_1,…]⊗C`, |v_i|=(1,2p^i−1),
with v_0 detecting p and stems2(p^i−1). Prove the even-stem collapse,
all p-adic/additive/product extensions and absence of p-torsion. Construct
p-local comparison via degreewise finite generation and separated complete
filtrations, and lift the algebra generators to obtain the p-local polynomial
coefficient ring. B4.8 owns this spectral multiplicative proof; B6.1 owns
explicit geometric generator representatives and the integral Newton lattice.
Consume StringOrientation S5.3's equivalence MSpin[1/2]≃MSO[1/2], proved
there through the K(ℤ/2,1) fibre of BSpin→BSO and the Thom isomorphism;
its localization MSpin_(p)≃MSO_(p) at each odd p transports the
comodule-algebra splitting, the Adams E₂ algebra and the p-local
polynomial ring above to MSpin, which is the refinement owned here.
These targets depend only on AT ordinary cochains/EM, G spectral/Thom
foundations (MSO and MSpin are GeneralizedCohomology G5.4's Thom spectra),
CC's early rings, S5.3 and item7; they use no Pontryagin–Thom
construction, and no MU or formal-group universality is presumed.

The classical odd-primary calculation is Milnor, §4, Theorems 4–5, p.519; the multiplicative Adams and parameter compatibility assertions here are additional proof targets.

The odd-primary comodule and Adams API includes:

- The triangular lifts give an algebra and comodule comparison, retaining the Thom product.
- The Ext algebra generators and complete filtration determine all additive and product extensions at each odd prime.

**Checks.**

- At p=3, v₀ has bidegree (1,1) and stem 0, while v₁ has (1,5) and stem 4; the degree-four C generator is absent because 2·1+1=3.
- At p=5, v₁ has stem 8 and C retains its degree-four generator; 2·1+1=3 is not a power of 5.
- For every odd p, positive cohomology of B(C₂) over F_p vanishes, whereas at p=2 its degree-one class is nonzero. Thus the odd comparison does not identify Spin and SO at 2.

*Needs:* B4.7; StringOrientation S5.3; CharacteristicClasses C3.3 and C3.6; GeneralizedCohomology G3.9 and G5.4. No geometric PT input is used.

### 6.5 Rational and odd-local oriented generators (B6.1)

Prove rational ΩSO_*≃Q[CP2,CP4,…], with generator degrees4j and
partition-indexed products, through stable BSO rational homology and
B5 PT. Use G5's finite Thom Hurewicz range and degreewise stable
comparison; then prove multiplication and spanning. Establish degreewise
finite generation by finite-type Thom homology and the stable Serre-class
comparison before using arithmetic/completion arguments. Using B4.7–8,
compute every odd-primary Hurewicz indecomposable lattice and its top
Pontryagin Newton functional. Prove the Milnor–Novikov local generator
criterion: in degree4k its gcd is p when 2k+1 is a power of p, and
a unit otherwise. Give geometric polynomial generators with that gcd
as actual bordism representatives. Construct the complex (1,1) Milnor
hypersurface H_C(m,n) as the zero locus of `Σ z_i w_i` in the same
CKG/G projective carriers CP^m×CP^n, a section of O(1,1), for m,n≥2.
Give representative descent, holomorphic regularity, actual smooth compact
subtype/normal-line charts and the tangent Chern formula; this concrete
carrier is owned here, independently of B4.6's real one. For m+n=2k+1
prove its Pontryagin Newton number `s_k=−binom(m+n,m)`, while
CP^(2k) has s_k=2k+1 (Milnor–Stasheff, Problems 16-C–E,
TeXromancers edition, pp.203–204). Prove the arithmetic gcd of binom(N,j),
0<j<N, is p if N=p^r and1 otherwise; indices j=1,N−1 contribute
N, supplied by CP^(N−1), so no false hypersurface formula at m=1
is used. Form the explicit integral Bézout combinations and choose their
orientations to give the Milnor generator number. Prove multiplicative
independence/spanning locally; item2 combines these odd-local
calculations with its 2-primary Wall lattice. Establish absence
of odd torsion directly from B4.8, before the Wall/transfer conclusions;
neither MU torsion-freeness nor Quillen universality is imported. At a fixed finite
oriented Grassmannian retain possible Euler classes: varying only the
complement rank of oriented2-planes does not give the stable BSO
partition count. Prove the signature genus additive, multiplicative and
bordism invariant by Thom's argument (the boundary of a compact oriented
manifold has signature zero, from the Lagrangian image of H^(2k)(W;ℝ)), and
consume IndexTheory I7.2's `sign(M)=⟨L(TM),[M]⟩` rather than proving
the signature theorem again; compute CP2 signature1 and the rational degree8
basis CP4,CP2×CP2. Finite kernel/cokernel requires the stated finite-type
hypotheses, not only an isomorphism after tensoring with Q.

Its API includes:

- The complex-bilinear incidence equation descends to a section of 𝒪(1,1), and its zero locus has the specified complex orientation.
- The tangent-normal sequence and complex-to-real Newton comparison give integral characteristic numbers and their localization gcd.

**Checks.**

- Incidence on (e₀,e₁) is 0 and on (e₀,e₀) is 1; for v=w=(1,i,0), the bilinear value is 0 while the Hermitian value is 2.
- H_C(2,3) has complex dimension 4 and Pontryagin Newton number −binom(5,2)=−10.
- CP⁴ has Newton number 5; gcd(5,10)=5, whereas CP² has 3 and generates the degree-four lattice.
- H_C(1,1) is CP¹: its Chern Newton number is +2, not −2, explaining the m,n≥2 hypothesis.

*Needs:* B4.7–B4.8; B5.4; B1.6; CharacteristicClasses C3; GeneralizedCohomology G3.9 and G5 stable Hurewicz; ComplexKahlerGeometry K7.1; IndexTheory I7.2.

### 6.6 Wall calculation and integral SO ring (B6.2)

Construct Wall cycles with an actual integral lift of w1, classified by
the homotopy pullback BO→RP∞←S1 and the designated determinant
line isomorphism. Construct the cut-at-a-regular-point operation to SO
bordism, the exact sequence ΩSO --2→ΩSO→W→ΩSO[−1], its
relative/space version. Realize the determinant pullback over S1 as
the mapping torus of the designated orientation-reflection automorphism ρ
of the universal oriented bundle, and construct its Thom spectrum MW as
`cofib(1−ρ:MSO→MSO)`, with the actual cut/boundary sign. Through
B5 and explicit geometric orientation-reversal witnesses, prove ρ acts
as−1 on every ΩSO_*(X,A), giving the displayed multiplication2 exact
sequence from the actual mapping-torus cofiber and geometric2-action. Compute the S1 Wang/Serre sequence
with its actual monodromy and lifted universal w_i classes, then use
the Thom comparison to construct
`H*(MW;F2)≃H*(MO;F2)/(w1²)` as A-modules. Prove all Steenrod
compatibility through the actual Thom map, not solely a graded dimension
count. Combine this with Wall's free direct summand to prove the point
coefficient forgetful map W→ΩO injective; it is not the definition of every
space-level Wall group as a subset of ΩO(X). Prove Wall's actual
cohomological calculation before the polynomial presentation. Separate
the geometric square-zero cut derivation ∂_1 on W from the degree−2
graded-dual derivation ∂_2 on C dual to δ_2=multiplication by w1²
on the transported H*BO Thom module R. On the polynomial dual basis
prove ∂_2σ(1)=0, ∂_2σ(2)=1, ∂_2σ(i)=σ(i−2) for i>2 and
the Leibniz rule; ∂_2 is not a chain differential (∂_2²σ(4)=1).
Prove δ_2 injective, construct τ_i in ker∂_2 for i not a power of2
with leading σ(i), and include σ(1) and σ(2^j)² in the kernel.
Prove the triangular greatest-term description of **imδ_2 in R**
(Lemmas8–12), not an impossible restriction on the surjective ∂_2.
Pin Wall's old braces `{a,b}=binom(a+b,a) mod2`, in particular the
τ_(2i) coefficient `{i−k,2k−i−1}=binom(k−1,i−k)` for
nonnegative indices, with his explicit admissible i,k choices. Show (w1)^2 H*BO·U
is a free direct summand in B4's A-free H*MO (Theorem1), and identify
the ker∂_1/im∂_1 dual with the mod2 Pontryagin-number subspace
(Lemma13). Prove CP^n∼_O(RP^n)^2 by its full SW-number calculation
(Lemma7). Use these explicit summand/detection statements and the
cofiber comparison to prove W→MO injectivity and the algebra below;
listing Wall's coefficient conclusion does not discharge these targets.
Choose the Wall-adapted unoriented polynomial generators Y: for
k≥1 not a power of2, write k=2^(r−1)(2s+1), r≥1,s≥1, and use
Dold P(2^r−1,2^r s) in degree2k−1 and its reflection mapping
torus Q in degree2k. For powers2 use RP^(2^j). Construct their free
C2 quotient/mapping-torus smooth carriers and actual characteristic
classes; compare this generator system with B4's Milnor/RP system.
Prove W=F2[Y_(2k),Y_(2k−1) : k not a power of2;
Y_(2^j)^2 : j≥1], with δY_(2k)=Y_(2k−1), δodd=0 and
δY_(2^j)^2=0. Prove H(W,δ)=F2[Y_(2k)^2:k≥1].
Combine item1's odd-local generator calculations with this 2-primary
lattice to obtain the integral free quotient Z[h_(4k)].
Construct torsion-free oriented generators h_(4k) with
forget(h_(4k))=Y_(2k)^2 and top Pontryagin Newton number ±p
when2k+1 is a power of a prime p, and ±1 otherwise. Prove there
is no odd torsion or order4 and the integral SO characteristic-number
converse using both Pontryagin and SW numbers. Give the complete
graded ring as the pullback of Z[h_(4k)] and kerδ⊂W over
H(W,δ), using h_(4k)↦[Y_(2k)^2] after mod2 reduction. Prove
this presentation and its actual multiplication, including nonzero
torsion products; do not replace it by a direct product of free and
torsion rings or infer it from rational coefficients.

The coefficient calculation follows Wall, Lemmas 7–13 and Theorem 1, pp.292–311; the space-level cofiber and structure transport are constructions here, not consequences of a point-only injectivity theorem.

The Wall-cycle, cut and generator API includes:

- A Wall cycle retains its integral determinant lift; pullback, disjoint union and products preserve that chosen lift.
- Cutting realizes the connecting map of the mapping-torus cofiber, and the point injection into MO is proved separately.
- The two derivations have the stated distinct degrees; the polynomial and pullback presentations preserve multiplication.

**Checks.**

- On RP², the nonzero w₁ cannot lift to H¹(RP²;ℤ)=0, so an arbitrary unoriented cycle is not a Wall cycle with that lift.
- On the oriented point the reflection acts by −1, so 1−ρ=2 on ℤ; replacing it by 1+ρ would give zero.
- The dual derivation satisfies ∂₂σ₄=σ₂ and ∂₂²σ₄=1, whereas the cut differential satisfies ∂₁²=0.
- In the first torsion degree, δY₆=Y₅ and δY₅=0; Y₅²=δ(Y₆Y₅) is still nonzero in the polynomial Wall algebra. This distinguishes nonzero torsion products from a square-zero torsion ideal.

*Needs:* B4.3–B4.6, B4.8 and B6.1; B5.4; B1.5 mapping tori and quotient adapters; CharacteristicClasses C1–C3.

### Examples

H_R(2,4) has Newton number 1 modulo two; H_C(2,3) has Pontryagin Newton number −10.

### Dependencies

Layers 2–5; StringOrientation S5.3; CharacteristicClasses C3.6 and C7.3a; GeneralizedCohomology G3.9 and G5.4; IndexTheory I7.2.

## Layer 7: ABS and the low Spin comparison

### 7.1 Geometric ABS and real Dirac comparison (B3.0)

**Geometric ABS genus and Dirac comparison.** Before any coefficient
classification construct α_n(X,A):ΩSpin_n(X,A)→KO_n(X,A) from B5's
structured Pontryagin–Thom comparison and G5.5's actual multiplicative
ABS orientation MSpin→KO. Prove naturality, witness invariance,
relative exact-sequence and product compatibility; write α(M)∈KO_n
for its point specialization. Construct here, once, the connective ABS
map D:MSpin→ko, ko=`spectrumConnectiveCover KO 0`: MSpin is connective
(B5.4c), so G3.8's coreflection lifts G5.5's ABS orientation through
ko→KO, uniquely up to homotopy, and the lift is a map of homotopy ring
spectra. B3.4 and B6.6 consume this D.
Construct spinABSDiracIndexComparison for every closed smooth Spin
n-manifold: α(M) is the real Clifford-graded analytic index of its
untwisted Spin Dirac operator. Consume SpinGeometry's
`realCliffordSpinorBundle`, `realSpinDiracClosedRealization` and
`realSpinDiracIndexClass`: these use the actual real H1/L2 module and
positive external Cl_n action, not the complex Hermitian bundle or
ordinary integer index. Identify the normalized principal symbol
with G5.5's ABS Thom family, including tangent/normal duality,
chirality, stabilization and the actual Bott/Morita sign adapters.
Prove the embedding/excision comparison in this real Clifford-graded
Spin-symbol case by extending Index I2.5's analytic excision and I5.4's complex embedding argument
using the real Clifford-equivariant normal Bott operator constructed below,
SpinGeometry's real Dirac/symbol and local regularity APIs, and G5.5's
realMixedCliffordIndexClassification and realNegativeCliffordFamilyIndex. This is a comparison theorem owned here, not an
asserted real-index consequence of an integer complex-index formula.
Construct the fibrewise normal Bott insertion on an actual tube,
with G5's ordered Cl(c,0)⊗Cl(0,c) exterior-module Morita cancellation
retaining the external KO_n degree. Prove its Gaussian zero-mode
reduction, complement invertibility and bounded-transform homotopies,
the supported extension/excision square, and independence of the
embedding, tube and ambient stabilization. Compare that actual
Fredholm class with the PT collapse and normal ABS Thom class.
Include Spin-isometry naturality, metric/connection independence,
bordism invariance, products and orientation reversal. Retain every
dimension, including the mod2 KO indices invisible to complexification.
B6 owns the further equivariant associated-family comparison used by
its projective transfers; equality on point indices does not supply it.

Construct spinABSComplexificationGenus for closed Spin4k-manifolds:
`c(α(M))=⟨Â(TM),[M]⟩·u^(2k) ∈ KU_(4k)`, with TopK's chosen u.
Build the spin-specific Thom-character square from G5.5's complexified
ABS class and CC C6's character/pushforward machinery: the normalized
correction is `ch(c(U_ABS(ν)))=U_HZ(ν)·Â(ν)^−1`, with the period
powers retained. Prove it from the Spin-character/Koszul representative
and the fixed ordinary Thom unit, not division by a possibly vanishing
Euler class on M. Prove the universal correction using finite-rank
Spin classifiers, their rational torus restriction, normalized Spin
characters and compact finite approximations as in CC C6, then pull
back to the actual normal bundle. Apply the KU pushforward to an embedding with
8j-dimensional ambient space, use Â(ν)Â(TM)=1, and compare the
rational coefficient character. CC's `ch(u)=−v` gives
`ch(u^(2k))=v^(2k)`, so no sign is discarded. Since KU_(4k)=Z and
its rational character is injective, obtain the displayed integral
equality and integrality of this genus. These constructions use no
low bordism table, K3 bordism classification or transfer-kernel theorem.

The geometric genus and connective lift API includes:

- The transformation respects the fixed Spin normal data, pair boundaries, products and orientation reversal.
- The real Clifford comparison preserves KO degree, while complexification gives the stated integral Â genus in dimensions divisible by four.

**Checks.**

- The positive point has genus +1 and the negative point −1; the empty cycle has genus 0.
- The nonbounding Spin circle maps to η in KO₁=ℤ/2; its complexification vanishes in KU₁, so a complex-only comparison cannot detect it.
- On the complex-oriented K3, −p₁/24=48/24=2 and c(a)=2u², giving α=a; on K3×K3, α=a²=4b.

The ABS Thom class is Atiyah–Bott–Shapiro, §§10–11; the real geometric-to-analytic
comparison here is constructed using the named Spin, Index and spectral suppliers.

*Needs:* B5.4; GeneralizedCohomology G3.8 and G5.5; SpinGeometry G5.0 and G6.0; CharacteristicClasses C6; TopologicalKTheory T5–T7; IndexTheory I2.5 and I5.4; PseudodifferentialOperators P5–P6.

### 7.2 Comparison with connective KO below degree eight (B3.4)

Prove that B3.0's D:MSpin→ko is an isomorphism on π_n for n<8 and
onto for n=8, from its actual Thom/cohomology and Steenrod calculation.
Compute H*(BSpin;F2) and H*(MSpin;F2) on the stable classifiers from
B4's operations and CC's universal Spin classes, through the actual
Bμ2→BSpin→BSO Serre sequence, B4.2's Steenrod-compatible
transgressions, the Thom comparison and degreewise Milnor maps; resolve
products and extensions. This full A-module calculation is owned here,
not presumed from an unwritten CC Spin-ring theorem. Prove H*ko=A//A(1),
A(1)=⟨Sq1,Sq2⟩, using G's actual connective model, its
ordinary-cohomology/covers comparison and the operation action. Compute
D*:H*ko→H*MSpin on the Thom class and its degree counts below9.
B6.6 consumes these calculations. Consume
B4.2's mod2 Adams convergence and G3.9's finite-generation completion
comparison. Own the odd-primary KO comparison here: consume StringOrientation
S5.3's MSpin[1/2]≃MSO[1/2] localized at p, B4.8's odd-primary Spin
coefficient ring and the independent oriented coefficient ring
from B6.1–2. First use B1.7's quartic K3 carrier,
c1=0,c2=24,p1=−48 and signature−16; B3.0 computes its complex index2.
Use B3.0's spinABSComplexificationGenus: p1=−48 gives Â(K3)=2,
hence c(α(K3))=2u². TopK's c(a)=2u² and injectivity of
c:KO4→KU4 give α(K3)=a, before any low bordism classification.
B3.0's spinABSDiracIndexComparison identifies this geometric genus
with the supplied analytic index. At odd p, signature−16
makes K3 a unit generator in degree4; α(K3)=a gives the isomorphism.
Degree0 follows the actual ring unit and the other degrees below8
vanish on both sides by these independent tables. In degree8,
α(K3×K3)=a²=4b is onto since4 is a unit at odd p. Combine these
prime comparisons to prove the low geometric KO-index theorem;
none of its inputs uses the B3 coefficient table. ABS is not asserted
a stable equivalence in every degree. Hence
signature/16 sends complex K3 to −1; orientation reversal gives the
displayed positive ΩSpin_4 generator for σ/16; its ABS value is −a.
For a closed Spin four-manifold M, B3.0's spinABSDiracIndexComparison
identifies α(M) with SpinGeometry's `realSpinDiracIndexClass`,
SpinGeometry G6.7 gives `realSpinDiracIndexClass = α_ℍ·a` for the
quaternionic index α_ℍ, and IndexTheory I7.5's
`spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` gives
σ(M)=−16α_ℍ. Hence α(M)=−(σ(M)/16)a. Rokhlin's divisibility of σ(M) by
16 is I7.5's `rokhlin_signature_dvd_sixteen`, consumed rather than
proved again. As a consistency check of the sign conventions, B3.0's
complexification genus with c(a)=2u², Â₄=−p1/24 and IndexTheory
I7.2's σ=⟨p1,[M]⟩/3 give `2k=⟨Â(TM),[M]⟩=−σ(M)/8` for α(M)=k·a, the
same value; on complex K3, σ=−16 gives k=1, matching α(K3)=a above.
Use the below8 ABS isomorphism and the chosen K3 orientation to prove
both directions of the degree-four classification.

**Checks.**

- At degree 0 the comparison sends the positive point to 1 in ko₀=ℤ.
- At degree 4 the complex-oriented K3 gives α=a and signature/16=−1; reversing its orientation gives −a and +1.
- In degree 8, K3×K3 maps to 4b, which generates after localization at every odd prime but not at 2. The separate 2-primary argument is necessary.

*Needs:* B3.0 and B1.7; B4.2, B4.7–B4.8; B6.1–B6.2; CharacteristicClasses C3; GeneralizedCohomology G3.9 and G5.4; TopologicalKTheory T5–T7; SpinGeometry G6.7; IndexTheory I7.2 and I7.5.

### Examples

The complex-oriented K3 has Â=2 and α=a; reversing orientation gives α=−a.

### Dependencies

Layers 4–6 and B1.7; GeneralizedCohomology G3.8–G3.9 and G5.5; SpinGeometry G5.0, G6.0, G6.7; TopologicalKTheory T5–T7; CharacteristicClasses C6; IndexTheory I2.5, I5.4, I7.2, I7.5; PseudodifferentialOperators.

## Layer 8: low geometric classifications and fillings

### 8.1 Spin-surface quadratic refinement (B3.2(b))

Consume SpinGeometry's actual two circle
lifts and all Spin structures on a closed surface Σ. Construct the
induced quadratic form q on H1(Σ;F2) by restricting the Spin structure
to embedded curves with their framing from Σ, with q=0 on a curve
bounding an embedded disc and q=1 on the Lie-framed circle of the
product torus. Prove the circle-framing rule, the polarization
q(x+y)=q(x)+q(y)+x·y with the mod2 intersection pairing, nonsingularity
of that pairing by mod2 Poincaré duality, naturality under Spin
diffeomorphisms and boundary compatibility for collared surfaces.

Its API includes:

- The refinement is natural under Spin diffeomorphisms and has the intersection pairing as polarization.
- Restriction to a bounding curve gives value 0, while the Lie-framed torus generators give value 1.

**Checks.**

- A disc boundary has q=0, excluding a convention that calls the bounding circle nonbounding.
- The Lie-spin torus has q(a)=q(b)=q(a+b)=1 and Arf 1.
- S² has H₁=0 and Arf 0; disconnected surfaces use the orthogonal direct sum.

*Needs:* B3.2(a); SpinGeometry G4 circle and surface lifts; AlgebraicTopology Stage 6 H₁ and mod2 duality. No bordism coefficient calculation is used.

### 8.2 Spin-surface filling classification (B3.2(c))

Use B3.2(a), B3.2(b) and surgery on q-zero curves to
prove ΩSpin_2≃F2 by Arf(q): realize a q-zero Lagrangian by disjoint
embedded curves, attach the corresponding two-handles to Σ×I and cap
the resulting spheres; conversely, the kernel of H1(∂W;F2)→H1(W;F2) for a
compact Spin three-manifold W is a q-zero Lagrangian, by relative
duality and extension of the framing, so the boundary has Arf zero. The
product Lie-spin torus has q(a)=q(b)=1, hence Arf1, and generates. This
is the degree2 coefficient; a nonsingular algebraic quadratic form alone
is not the geometric bordism theorem.

Compare Atiyah, §4, Proposition 4.1 and Theorem 3′, p.58: his
Spin-boundary criterion uses the mod2 Spin index and yields the count
of bounding Spin structures. Here B3.2(b)’s geometric quadratic refinement,
the realization of its q-zero Lagrangian and the actual surgery filling
are constructed from the stated geometric suppliers; the algebraic
classification alone is not cited as a proof of this filling theorem.

**Checks.**

- The sphere has zero H₁ and bounds a Spin ball, giving Arf 0 on both sides.
- A torus refinement with q(a)=q(b)=0 has a q-zero line and the corresponding handlebody filling.
- The product Lie-spin torus has Arf 1, so it cannot be the entire Spin boundary; two copies have Arf 0 and admit the surgery construction.

*Needs:* B3.2(a)–(b); B1–B2; GeometricTopology Layer 1 handles; AlgebraicTopology Stage 6 relative duality.

### 8.3 Spin three-manifolds (B3.3)

Prove ΩSpin_3=0 from item4's below8 ABS comparison, TopK's ko3=0
and B5's geometric PT inverse. Construct the specified Lie-spin T3 filling
as the E(1) fibre complement in B1.7; use its boundary Spin identification
and complex-oriented signature −8. Distinguish its induced framing
from the Lie framing: under the framed isomorphism of StringOrientation
S2.3, which supplies π₃S≅ℤ/24 with generator ν, the product Lie framing
is η³ by B5.4c's external products, and η³=12ν≠0, although its Spin
image is zero. A signature-zero Borromean
trace does not identify the specified Lie Spin structure.

**Checks.**

- S³ with its unique Spin lift bounds the Spin D⁴ and has class 0.
- The specified Lie-spin T³ bounds the signature −8 complement, so its Spin bordism class is 0 despite its nonzero product stable framing.
- In framed coefficients the product represents η³=12ν, of order 2 in ℤ/24, while its KO image lies in KO₃=0. Forgetting a frame is not an injective invariant.

*Needs:* B3.4, B5.4 and B1.7; StringOrientation S2.3 for π₃S≅ℤ/24 and ν; TopologicalKTheory T5 connective KO coefficients.

### 8.4 Low coefficient tables and three-dimensional parallelization (B3.1)

Prove the coefficient tables in degrees0–4, including the map and inverse
on the displayed generators:

| n | ΩO_n | ΩSO_n | ΩSpin_n |
| --- | --- | --- | --- |
| 0 | F2, one point | Z, positive point | Z, positive Spin point |
| 1 | 0 | 0 | F2, nonbounding Spin circle |
| 2 | F2, RP2 | 0 | F2, odd-Arf Spin torus |
| 3 | 0 | 0 | 0 |
| 4 | F2², RP4 and RP2×RP2 | Z, CP2 | Z, a Spin K3 with reversed complex orientation |

Give nullbordism witnesses for the zero entries and bordism-invariant
detection plus spanning for the nonzero entries. In ΩO_4 prove
[CP2]=[RP2×RP2] using the full Stiefel–Whitney number comparison.
The O column consumes B4/B5's MO calculation and geometric PT. For
the SO column, degrees0,1 use points and oriented circle disks. In
degrees2,3 use B4's Wu calculation to prove every oriented source
is Spin; every surface admits an Arf-zero refinement and B3.2(c)'s
surgery gives its filling, while B3.3's Spin3 theorem gives the
dimension3 filling. For ΩSO4 use B6.1's rank/generator computation
and B6.2's integral Wall presentation, whose degree4 torsion branch
is zero and whose h4 has Pontryagin Newton number±3. Compare CP2
by its signature1 to obtain the integral generator and inverse.
Neither B6 input uses this low-group table. Rational Hurewicz alone
cannot establish the absence of2-torsion or an integral index.
**Oriented three-manifold parallelization.** Prove that every oriented smooth Hausdorff
second-countable three-manifold, with boundary allowed and without a
compactness or connectedness assumption, has a smooth orientation-preserving
vector-bundle isomorphism `TM≃M×ℝ³`. Construct its actual three vector
fields, their pointwise basis and smooth inverse; for a chosen Riemannian
metric obtain an oriented orthonormal frame by smooth Gram–Schmidt.
This is an honest rank-three trivialization. The closed case is
Benedetti–Lisca, *Framing 3-manifolds with bare hands*, arXiv:1806.04991v2,
Theorem 1, p.1; their §2.1, pp.2–3 describes the Wu/Spin proof.
The boundary, noncompact and componentwise extensions are proved here
by the compact-neighbourhood and obstruction arguments below.

The headline `orientedThreeManifold_parallelization` uses a chosen
`TauCeti.IsOrientedAtlas` on the native half-space model of dimension three.
It produces a pointwise `Module.Basis` of the native `TangentSpace`, with
positive determinant after differentiation of every chart in that atlas.
The map from M×ℝ³ to `TangentBundle` sends (x,c) to the linear combination
of the frame with coefficients c; its inverse sends a tangent vector to
its basepoint and basis coordinates. Both maps are smooth and are inverse
by `Module.Basis.equivFun`; no frame or trivialization is assumed.

For a closed source use the preceding Wu/Spin conclusion. Extend w₂=0
to noncompact sources by testing against every mod2 singular two-cycle,
whose support is compact. Consume B1.6's compact smooth codimension-zero
neighborhoods and collared doubles: place that support in the interior
of such a neighborhood and restrict the closed double's vanishing w₂
back to it. Field-coefficient UCT and naturality then give w₂(TM)=0.
Handle boundary by a collared oriented double of M and restriction;
prove the tangent-bundle comparisons through these collars. This uses
closed-manifold Wu duality only on the compact doubles.

Choose the actual Spin lift through SpinGeometry G4. Consume
SpinRepresentations L7's native Hamilton-quaternion comparison and its
topological refinement `Spin(3)≃S³`; derive π₀,π₁,π₂=0 using the sphere
homotopy/Hurewicz interfaces. On the at-most-three-dimensional CW model
of a smooth triangulation of M (GeometricTopology's Whitehead triangulation
and its Layer11 simplicial CW structure; for boundary, B1.5's relative
refinement),
use CC's numerable-principal-bundle classification and AT8's relative
obstruction construction to build a section of this Spin principal bundle
over successive cells. Transport the trivialization back along the actual
CW homotopy equivalence, using bundle homotopy invariance. Its associated
SO(3) frame trivializes TM continuously. Smooth its three sections by
locally finite bundle-chart approximation, with a pointwise error bound
keeping the determinant positive; prove the resulting frame and inverse
smooth. Include componentwise assembly. This is a
consequence of the existing Spin and bundle constructions; SpinGeometry's
early lift criterion does not depend on this bordism application.

**Checks.**

- In dimension 0 the O count is 1 modulo two and the SO/Spin signed point count is 1; opposite signs cancel in the latter groups.
- RP⁴ has (w₄,w₂²) evaluations (1,0), while RP²×RP² has (1,1), so the two degree-four O generators are independent.
- CP² has signature 1 and SW-number vector (1,1), matching RP²×RP² after forgetting orientation; complex K3 has signature/16=−1 in Spin degree four.
- The coordinate frame on ℝ³ and on the closed half-space has determinant 1, with coordinate maps inverse to each other; negating its first vector gives determinant −1 and fails positivity for the same orientation.
- A countable disjoint union of oriented half-spaces admits the componentwise coordinate frames, each of determinant 1; compactness and connectedness are unnecessary. On the empty manifold the frame and both total-space maps are empty functions.

*Needs:* B2.4; B3.2(c), B3.3–B3.4; B4.3–B4.6; B6.1–B6.2; B1.5–B1.6; SpinGeometry G4; SpinRepresentations Layer 7; AlgebraicTopology Stage 8; CharacteristicClasses C1.

### 8.5 Projective boundary constructions (B3.5)

Construct explicit projective bounding manifolds for every positive n:
the disk bundle of γ_C^⊗2 on CP^(n−1) has boundary RP^(2n−1),
through the actual lens-space quotient ±1. The oriented rank3 disk
bundle of Im End_H(γ_H) over HP^(n−1) has sphere boundary
CP^(2n−1), through the twistor S2 bundle and actual homogeneous
comparison. Prove the boundary orientations, dimensions 2n and4n−1,
smooth diffeomorphisms and all induced structures. With the base
HP chart `(1,w)H`, w∈H^(n−1), oriented by (1,i,j,k) in each
coordinate, and imaginary-fibre basis (i,j,k),
orient the latter disk total space by (−1)^n to match the complex
CP boundary orientation; prove this sign from the right-complex basis
(1,j), complex structure given by right multiplication by i, and the
H-linear extension J_ℓ of right-i from the complex line ℓ. The fibre map
qC↦q i q⁻¹ has degree −1: at q=1 the chart q=1+j(x+iy)
has derivative (x,y)↦−2xk−2yj. The horizontal real-complex
comparison contributes (−1)^(n−1), so the total sign is (−1)^n. For n=1 give D2 and D3 separately. Positive-dimensional projective generators elsewhere
must not be used to replace these filling constructions.

For the complex projective bounding construction see Milnor–Stasheff,
§16.3, p.194. Its fibre over HP^(n−1) is S², as the real dimension
difference (4n−2)−(4n−4)=2 requires. The actual homogeneous comparison
and outward-first sign above are proved here. For the real projective
construction, the fibrewise map from the unit sphere of γ_C to that of
γ_C^⊗2, v↦v⊗v, identifies precisely v and −v; it therefore identifies
the boundary with S^(2n−1)/{±1}. Its smooth quotient comparison uses
SmoothBundlesConnections B1.4 (Lee, Theorems 21.10 and 21.13,
pp.544–545 and 549); the chosen disk filling and its orientation are constructed here.

The disk-filling API includes:

- Boundary identifications preserve the selected projective carriers and the computed outward-first orientation.
- Tautological coordinate changes and the homogeneous comparisons transport the same disk bundle and its boundary structure.

**Checks.**

- At n=1 the real-projective boundary is S¹=∂D² and the complex-projective boundary is S²=∂D³.
- At the chart q=1, the Hopf derivative sends (1,0) to −2k and (0,1) to −2j; its oriented determinant is negative, giving fibre degree −1.
- At n=2 the horizontal factor contributes −1 and the fibre factor −1, giving total +1=(-1)²; at n=1 the total sign is −1.

*Needs:* B1.5 disc and sphere bundles; GeneralizedCohomology G4 quaternionic projective carriers; CharacteristicClasses C1–C3; DifferentialGeometry §§2.1–2.2 boundary orientations.

### Examples

The odd Spin torus has Arf 1; the Lie Spin T³ bounds the specified signature −8 complement.

### Dependencies

Layers 1–7; StringOrientation S2.3; SpinGeometry G4; AlgebraicTopology Stages 6 and 8; GeometricTopology Layer 1; SpinRepresentations Layer 7; GeneralizedCohomology G4.

## Layer 9: exceptional projective geometry

### 9.1 Idempotent Cayley plane (B3.6)

StringOrientation S1.5 owns the Cayley plane OP², defined as the trace-one
idempotents of the exceptional Jordan algebra J₃(𝕆) of 3×3 Hermitian
octonionic matrices, with its cells, cohomology ring and characteristic
classes. Identify S1.5's J₃(𝕆) with the compact real Albert algebra supplied
by LieHighestWeight Layer8, built on the Cayley–Dickson pair division carrier
`TauCeti.DivisionOctonionReal`: a Jordan-algebra isomorphism matching the
Hermitian positions, the unit and the trace form. Through it define
octonionicProjectivePlane as the literal trace-one idempotent subtype
`{A : compactAlbertAlgebra // A∘A=A ∧ tr A=1}` in its 27-coordinate
Euclidean topology, which is S1.5's OP² on this carrier. Use the positive
trace form to prove it is closed and bounded (tr A²=1), hence compact,
Hausdorff and second countable; S1.5 obtains compactness from the
homogeneous presentation, so this is the subtype-level comparison. There
is no module/associative projectivization over O.
The positive form is essential: on the split carrier a nonzero null a,
N(a)=a star(a)=0, gives trace-one idempotents with A_00=1, A_10=t a,
A_01=t star(a) and other entries zero for every real t, an unbounded
family; on the compact carrier tr(A∘A)=1+2t²N(a)=1 forces t a=0,
and in general tr(A∘A)=1 bounds every entry.
Construct the three charts on A_ii>0: for the first use
`P(x,y)=vv*/(1+N(x)+N(y))`, v=(1,x,y), with entries v_i star(v_j),
inverse `(A_10/A_00,A_20/A_00)` and the fixed Hermitian coordinate
comparison. Order the two nonpivot indices increasingly in each chart:
chart1 has `(A_01/A_11,A_21/A_11)` and chart2 has
`(A_02/A_22,A_12/A_22)`. Give these charts and **actual** transition
maps; e.g.
first-to-second is `(x,y)↦(x⁻¹,y x⁻¹)` on x≠0. Use the supplied
two-generator associative subalgebra and its conjugation closure for these
identities, rather than regrouping arbitrary triple products. Prove coverage,
chart inverses, smooth transitions, the embedded 16-dimensional manifold
structure and inclusion/tangent/smooth-map criteria on this precise subtype.
The CW decomposition S⁸∪e¹⁶ with octonionic Hopf attaching map, the ring
H*(OP²;ℤ)=ℤ[u]/(u³) with |u|=8, connectedness and simple connectivity are
S1.5's. Exhibit S1.5's cells in these charts: the projective line is the
trace-one idempotents in the lower Hermitian2×2 corner, with its two
octonionic inverse charts and explicit homeomorphism to S8, and the top
cell is the image of D16 under v=(sqrt(1−N(z)),z_1,z_2), z∈O², N(z)≤1,
taking vv*, whose S15 boundary is the octonionic Hopf map to that S8.
Prove that this characteristic map is S1.5's attaching map on the subtype
carrier, so that S1.5's cellular and cup conclusions, including Hopf
invariant1, hold in these coordinates.

Its API includes:

- The idempotent charts cover the compact trace-one carrier and their inverse transition maps preserve the Jordan equations.
- The cell characteristic maps identify the same manifold with one cell in dimensions 0,8,16.

**Checks.**

- At (x,y)=(0,0), P is diag(1,0,0); its trace and squared trace are 1.
- At (x,y)=(1,0), the first two diagonal entries and their off-diagonal entries are 1/2, and P²=P.
- The zero matrix has trace 0 and is excluded; on a split null direction the putative trace-one family is unbounded, excluding the split Albert model.

The idempotent and projective geometry is Baez, §§3.4 and 4.2; the designated-chart and native-carrier comparisons are constructed here.

*Needs:* StringOrientation S1.5; LieHighestWeight Layer 8 compact Albert algebra and division octonions; AlgebraicTopology Stages 4 and 6 cells and cup products; Mathlib finite-dimensional real topology.

### 9.2 Compact automorphisms and Spin isotropy (B3.7)

Construct compactAlbertAutomorphismGroup as the closed subgroup of the
native real linear-equivalence/GL27 group preserving the Jordan product,
unit and positive trace form; under item6's identification this is
StringOrientation S1.5's F₄, a compact connected Lie group of dimension 52
acting transitively on OP² with isotropy Spin(9) at diag(1,0,0), all of
which S1.5 owns. Give its matrix realization, smooth action
and compactness inside O27 on the Albert carrier. Consume native
`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`
(Geometry/Lie/Subgroup/Embedded.lean), choose and retain its actual data
to define the subgroup atlas, and export the ambient-GL smooth-into
equivalence for that chosen atlas; no second Cartan proof or opaque
unrelated smooth structure is introduced. Compare its tangent data and
native LieGroups Layer2 Lie-algebra identification with the Lie algebra of
compact Albert derivations. Call this concrete group compactF4; its type-F4
comparison is owned here: compose the Lie(Aut)≃Der(J) identification
with LHW Layer8's `compactAlbertDerivation_complexification` and
`compactAlbertDerivation_killing_negDef`. Connectedness is S1.5's; prove simple connectivity here from the actual
Spin9 principal fibration and S1.5's cell model. Export its real derivation Lie-algebra isomorphism,
complexification to split typeF4 and negative-definite Killing form.
Use LieGroups Layer4's full-faithful simply connected integration
equivalence to prove uniqueness among connected simply connected
real Lie groups with this actual real derivation Lie algebra. No
undefined designated complex F4 group or its real-form classification
is a prerequisite.
This type comparison follows the intrinsic geometry; all quotient/idempotent constructions use the actual
group and derivation algebra independently of that classification.
Transitivity is S1.5's theorem; transport it along item6's identification.
Its tangent witness on the Albert carrier is the supplier's inner
derivations on the Peirce tangent space: for x∈J_(1/2)(E),
`4[L_x,L_E](E)=x`, so exponentiating these skew-adjoint derivations gives
product-preserving trace isometries and an orbit map that is a submersion
at E, which the quotient comparison below needs.
Construct the explicit native Spin9 inclusion through the Peirce
decomposition at E_0:
J≃R E_0 ⊕ (R⊕R9) ⊕ S9, S9≃O². The vector Clifford action on O²
for (t,a)∈R⊕O is `(x,y)↦(tx+ay,star(a)x−ty)`; prove the positive
Euclidean Clifford relation and adjointness. S1.5 states that the isotropy
acts on the 16-dimensional complement by the real spin representation;
this roadmap owns this concrete real16-dimensional Cliff(9,0) module with
its pinned volume sign; no designated real Spin9
module is presumed in SpinRepresentations. Pin O's basis to
`(1,0),(i,0),(j,0),(k,0),(0,1),(0,i),(0,j),(0,k)` in the Cayley–Dickson
pair model, R9 to t followed by that basis, and S9 to column0 entries
`(A_10,A_20)=(star(offDiag 2),offDiag 1)`. The lower traceless block
`[[t,a],[star(a),−t]]` acts by twice its Jordan product on this Peirce
space. Prove the ordered positive Clifford volume acts as −id, and
compare its native Clifford lift and Spin action with
`spinGroup (TauCeti.realCliffordForm 9 0)`;
compare the quotient at volume−1 with the corresponding real matrix
factor of SpinRepresentations L7's Cliff(p,q) algebra table.
Verify every Peirce product and faithfulness. Prove the full E_0
stabilizer preserves R9 and intertwines its Clifford action on S9. The
pinned volume forces its R9 action to have determinant+1; lift it
through native Spin9→SO9, and use the real Clifford commutant/scalar
isometry calculation to identify the remaining S9 action as±1, absorbed
by the Spin centre. Thus its image is exactly the stabilizer. Supply
inverse continuous/smooth comparisons on these actual group maps.
Construct the quotient homeomorphism and diffeomorphism
compactF4/Spin9≃octonionicProjectivePlane from the actual orbit map and
SmoothBundlesConnections B1.4's free proper principal quotient, not an abstract existence equivalence; this compares S1.5's homogeneous smooth structure with item6's chart atlas. Give
smooth local sections, the tangent isotropy comparison, connectedness and
simple connectivity, and all chart/homogeneous-carrier compatibility laws.

Its API includes:

- The action preserves the literal idempotent carrier, and its orbit map induces the quotient diffeomorphism.
- The Peirce Clifford representation identifies the full stabilizer and the actual tangent representation.

**Checks.**

- The identity automorphism fixes diag(1,0,0) and every Peirce component.
- The Clifford vector (t,a)=(1,0) acts as (x,y)↦(x,−y), whose square is +id.
- The vector (0,1) swaps (x,y), again with square +id; it anticommutes with the previous vector, fixing the positive Clifford convention.
- Write C₀ for the t-generator and C₁,…,C₈ for the eight ordered octonion generators above, composing rightmost first. Then C₀C₁⋯C₈ sends (1,0)∈𝕆² to (−1,0). Replacing only C₈ by −C₈ sends it to (1,0), although all generator squares and pairwise anticommutation relations persist; this excludes the opposite-volume representation.

*Needs:* B3.6; StringOrientation S1.5; SmoothBundlesConnections B1.4; LieGroups Layers 2 and 4; LieHighestWeight Layer 8 derivations; SpinRepresentations Layer 7.

### 9.3 Normal Bott comparison and sign witness (B3.8)

StringOrientation S1.5 owns w₂(OP²)=0 and the unique Spin structure,
p₁=p₃=0, p₂=6u, p₄=39u², the Euler class 3u², χ=3, signature 1 and the
orientation ⟨u²,[OP²]⟩=1, and the unique String lift class obtained from
S1.3 with H⁴(OP²;ℤ)=0 for existence and H³(OP²;ℤ)=0 for uniqueness;
consume them on item6's carrier. Own here the sign witness that pins
S1.5's generator u in the chart coordinates of item6, independently of
the homogeneous computation S1.5 cites. The tangent isotropy bundle
restricted to OP1=S8 is TS8 plus its normal real8-dimensional
half-spin/Hopf bundle. Construct this normal bundle comparison from the
Peirce charts and item7's Spin9/Spin8 isotropy; compare its actual
clutching with TopK T7's Cl(0,8) real Bott unit. Use the complexification
`c(b)=u_KU^4` and CC's top Chern/Newton formula to obtain p2=±6 times
the degree8 generator and e_normal=±1, computing the signs through that
explicit clutching comparison, and prove that the generator so singled
out is S1.5's u, normalized by p₂=6u. Prove that the cup/intersection
computation in item6's cells gives signature1 in the u² orientation;
with IndexTheory I7.2's L-genus theorem, whose geometric proof uses no
bordism coefficient, this recovers p4=39u² from
`(381p4−19p2²)/14175=signature` on the torsion-free carrier, a
consistency witness for S1.5's value, not a second owner of it. Consumers
of the Spin and String data of OP² use S1.5's statements on this fixed
carrier; no second OP2 is defined here.

For the homogeneous characteristic calculation compare Borel–Hirzebruch, §19, Theorem 19.4; the specified Bott clutching and sign comparison are proof obligations here.

The normal comparison API includes:

- The normal Bott comparison fixes the generator u in the chart coordinates and the induced fundamental class used by every characteristic number.
- The signs of the normal Euler class and of p₂ are computed from the same clutching map, so one convention fixes both.

**Checks.**

- With p₂=6u and p₄=39u², (381·39−19·36)/14175=1, fixing the signature sign; replacing u by −u changes p₂ to −6u but leaves p₂², p₄ and the signature unchanged, so the clutching witness, not the signature, pins u.
- The normal bundle of OP¹=S⁸ in OP² has Euler number ⟨u²,[OP²]⟩=±1, so it is nontrivial; a trivial normal bundle would force u²=0.
- The CW cells in dimensions 0,8,16 give H³=H⁴=0 and χ=3, so S1.5's lift class is unique; on S³ the constant map to K(ℤ,4) has zero obstruction but nullhomotopy classes forming H³(S³;ℤ)=ℤ, the control that S1.3's H³ hypothesis excludes.

*Needs:* B3.6–B3.7; StringOrientation S1.3 and S1.5; TopologicalKTheory T7; CharacteristicClasses C3; IndexTheory I7.2.

### 9.4 Projective structure comparisons (B3.9)

Prove the RP² and CP² rows of the projective-plane structure table on
these designated carriers, and import the HP² and OP² rows from
StringOrientation S1.5:

| Carrier | Orientation | Spin | Degree-four obstruction test |
| --- | --- | --- | --- |
| RP2 | w1≠0 | absent | no oriented Spin lift |
| CP2, complex orientation | oriented | w2 is nonzero mod2 hyperplane | no Spin lift |
| HP2, standard quaternionic orientation | oriented | unique Spin lift | p1=2u; any integral λ with 2λ=p1 equals u≠0 |
| OP2, orientation u² above | oriented | unique Spin lift | H4=H3=0: one String lift class (StringOrientation S1.5) |

For every k≥1 prove `p(T HP^k)=(1+u)^(2k+2)(1+4u)^(−1)` in
H*(HP^k;Z)=Z[u]/(u^(k+1)), using G's right-H tautological carrier, the
quaternionic Euler sequence and exact complex/real sign adapters, so u is
the negative of G's ordinary c2 coordinate. At k=1 this is p=1 for S4;
at k=2 it is p1=2u,p2=7u², agreeing with StringOrientation S1.5's
p(HP²)=1+2u+7u², and signature1 by I7.2's L-genus
(7p2−p1²)/45=(49−4)/45=1. S1.5 states only k=2; the formula for every k
is proved here, and PositiveScalarCurvature consumes it
for its HP^k examples. Prove CP2 w2 and RP2 w1 by the single AT/CC
projective carriers. This table separates the actual structure obstructions;
the kernel theorem for Cayley-plane bundles is StringOrientation S5's.

**Checks.**

- For HP¹, (1+u)⁴/(1+4u)=1 modulo u², agreeing with p₁(TS⁴)=0.
- For HP² the expansion gives p₁=2u, p₂=7u², and (7·7−4)/45=1; an integral half-class is u≠0.
- CP² has w₂ equal to the nonzero hyperplane class, while RP² has nonzero w₁. Neither reaches the Spin obstruction test on the OP² carrier.

*Needs:* B3.8; StringOrientation S1.5; GeneralizedCohomology G4; CharacteristicClasses C3 and C7.3a; IndexTheory I7.2.

### Examples

HP² has p₁=2u and p₂=7u²; OP² has p₂=6u and p₄=39u².

### Dependencies

Layers 2 and 4; StringOrientation S1.3 and S1.5; SmoothBundlesConnections B1.4; LieHighestWeight Layer 8; LieGroups Layers 2 and 4; SpinRepresentations Layer 7; TopologicalKTheory T7; CharacteristicClasses C3, C7; GeneralizedCohomology G4; AlgebraicTopology Stages 4 and 6; IndexTheory I7.2.

## Layer 10: realization and projective transfers

### 10.1 Homology realization and its sharp range (B6.3)

Prove orientation-map surjectivity ΩSO_n(X,A)→H_n(X,A;Z)
for0≤n≤6, ΩO_n(X,A)→H_n(X,A;F2) in every degree, and the
rational SO surjection in every degree. Construct geometric preimages,
using B4/B5 for mod2 and B5.7's connective bordism AHSS for Z.
For the integral range use the actual connective AHSS and rational
surjectivity: the first possible differential from H_n(−;Z) is d5 to
H_(n−5)(−;ΩSO_4=Z), hence has torsion image. In degree5 its H0
target is torsion free. In degree6 reduce to finite support on X/A,
detect any possible finite torsion H1 class by a componentwise map to
B(Z/m), m≥2, and obtain H6(B(Z/m);Z)=0 for every m from ClassifyingSpaces
Stage4's identification with `groupHomology` and Mathlib's
`Rep.FiniteCyclicGroup.groupHomologyIsoEven`: for trivial coefficients Z
the even-degree complex is Z→Z→Z with maps 0 and the norm m, whose
middle homology is ker(m)=0. Naturality kills d5, with no mod3 operation
prerequisite for the positive n≤6 range.
Handle also d6 into H0(−;ΩSO_5=F2): maps of each nonbasepoint
component to S0 detect this target while H6(S0;Z)=0, so d6 is zero.
Prove the quotient-component and finite-support comparisons for pairs,
then arbitrary CW and singular CW approximations. For the degree7
obstruction consume B4.7's mod3 P1/β and compute the first MSO
Postnikov operation/d5 with its conjugation sign. Construct the specified
counterexample explicitly: L=S7/C3 for scalar multiplication on C4,
V=L×L, v_i∈H1(L;F3),u_i=β_3v_i and
`z=PD_Z(β_Z(v1 v2 u2²))∈H7(V;Z)`.
Prove the lens-cell/ring and integral-Bockstein comparisons, with
`ρβ_Z(v1v2u2²)=u1v2u2²−v1u2³` and
`P1β_3(v1v2)=u1³v2−v1u2³`. Their cup product is
`−v1v2u1³u2³`, which pairs nontrivially with [V]. Identify the
dual first MSO obstruction in the same ordinary/spectral sign convention
and prove nonrepresentability, so the range has its correct limit. The positive
range and counterexample use distinct parts of this same operation API.

**Checks.**

- A positive point realizes 1 in H₀(pt;ℤ), and the empty cycle realizes 0.
- For m=3 the positive even cyclic-group homology is ker(3:ℤ→ℤ)=0, whereas odd homology is ℤ/3; reversing these parities would not kill the asserted d₅ target test.
- In the degree-seven example the product coefficient is −1=2 modulo three, not zero, so the obstruction genuinely evaluates nontrivially.

For the rational coefficient result compare Thom IV.17, p.84; the stated
integral range and lens-space example are proved by the explicit AHSS and
operation calculations above, including their pair extension.

*Needs:* B4.4, B4.7, B5.7 and B6.1–B6.2; ClassifyingSpaces Stage 4; Mathlib `Rep.FiniteCyclicGroup.groupHomologyIsoEven`; AlgebraicTopology Stages 4 and 6.

### 10.2 Associated-family transfers (B6.4)

Construct the general associated-F-bundle bordism transfer for a compact
smooth fibre, numerable G action and a chosen compatible vertical
tangential structure. For each parameter pair it sends the class of
a base cycle with map into BG×X to the actual total-space cycle over
X; relative boundaries map into A. The total space needs a smooth
principal bundle over the smooth source. Consume CharacteristicClasses
C1.4: for compact Lie G a continuous principal G-bundle over a smooth
base has a smooth representative, and its relative homotopy version
keeps the bundle fixed where it is already smooth. Apply it on a compact
source or witness M with corners, relative to a neighbourhood of a
closed union of faces C on which P is already smooth; apply the same
relative version on M×I rel M×{0,1}∪C×I for uniqueness up to a smooth
isomorphism that is the identity near C. Apply it to the
structure groups SO3, PU3⋊C2 and PSp3 below, and to witnesses with
their faces. Build its spectrum-level map from
compatible fat-embedding spaces, normal bundles and Thom collapses.
Prove connectivity bounds for those spaces, skeletal section extension,
compatibility at all stabilizations and global parameter homotopy
independence. Stagewise homotopies do not alone remove phantom or
lim1 obstructions. Prove module/pullback/base-change/composition laws
and the geometric-to-spectral transfer comparison.

Its API includes:

- Transfer sends a base class to its actual total space and shifts degree by the fibre dimension.
- Pullback, products, module actions and composition preserve the coherent geometric-to-spectral comparison.

**Checks.**

- For trivial group and base point, transfer sends 1 to [F]; the empty base sends 0 to 0.
- For a trivial F-bundle over M the result is [M]·[F], in dimension dim M+dim F.
- The boundary of a positive interval times F is F minus F, so the transferred boundary has total coefficient 0.

*Needs:* B1–B2 and B5.4; CharacteristicClasses C1.3–C1.4; GeneralizedCohomology G5 bundle-diagram collapses and coherent comparison.

### 10.3 Orientation kernels (B6.5)

Compute the positive-degree point orientation kernels as the actual
transfer images
ΩO_(n−2)(BSO3)→ΩO_n→H_n(pt;F2)=0 and
ΩSO_(n−4)(B(PU3 semidirect C2))→ΩSO_n→H_n(pt;Z)=0
for n>0, using zero groups in negative domain degrees.
The orientation target in positive degree is zero, but the specified
transfer-image theorem still needs its full proof. For RP2 construct
the SO3 projective-plane bundle and its actual normal data; unoriented
bases are essential. For CP2 retain complex conjugation in the
structure group: it preserves fibre orientation, and its mapping torus
P(1,2) detects the degree5 torsion branch. PU3-only bundles miss it.
Construct that structure group here. Let G be the group of real-linear
automorphisms of C³ of the form v↦Av or v↦A v̄ with A∈U(3), modulo the
circle of scalars, which is normal but not central (conjugating the
scalar λ by v↦v̄ gives λ̄); composition gives (A,ε)(B,δ)=(A·ε(B),εδ)
with ε(B)=B̄ when ε is conjugation, so G=PU3⋊C2. Realize it through
X↦AXA⁻¹ and X↦A X̄ A⁻¹ as a closed subgroup of the general linear group
of the real Lie algebra su3. This representation is faithful: Ad has
kernel the centre on SU3, and conjugation is not inner, since it acts by
−1 on the diagonal Cartan subalgebra and −1 is not in the Weyl group S3
of SU3, while an inner automorphism preserving that subalgebra acts by a
Weyl element. Give G the closed-subgroup smooth structure by native
`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`,
prove it compact with two components, and construct its smooth action
[v]↦[Av], [v]↦[A v̄] on the CP2 carrier; conjugation on CP2 has degree
(−1)²=+1, so the action preserves orientation. Take its classifying
space from the numerable universal bundle and CharacteristicClasses
C1.3's smooth finite approximations, and build the associated CP2
bundle by item4.
Prove the requisite A-comodule split-surjections, convergent mod2
Adams calculation with extensions, the free-part Newton gcd criterion,
localized-to-integral comparison and transfer-domain structures. The
kernels are additive images of bordism classes, not just ideals
generated by the single point-fibre classes [RP2] or [CP2].

For the oriented transfer use Führing, Theorems 1.1 and 1.3, pp.355–357, and for the unoriented analogue §9; the displayed groups and structure actions are part of the theorem.

The projective structure-group and orientation-kernel API includes:

- The semidirect action retains conjugation and its scalar-circle quotient, and its associated CP² bundle has oriented vertical tangent data.
- The point transfer images equal the full positive-degree orientation kernels, as additive subgroup images with the specified domain structures.

**Checks.**

- Complex conjugation has degree (−1)²=+1 on CP², while conjugation on the scalar circle sends i to −i; the scalar circle is normal but not central in the semilinear group.
- The RP² fibre over a point gives the nonzero degree-two O generator; the CP² fibre gives the signature-one degree-four SO generator.
- The CP² conjugation mapping torus P(1,2) has w₁=0 and w₂w₃ number 1, detecting the degree-five branch that connected PU₃ monodromy would miss.

*Needs:* B6.4; B4.2, B4.6, B4.8 and B6.1–B6.2; SmoothBundlesConnections B1.4; LieGroups Layer 2 closed-subgroup charts; CharacteristicClasses C1.3.

### 10.4 Spin-to-KO kernel (B6.6)

Construct PSp3=Sp3/{±1} and the universal HP2 homogeneous bundle
using G's same smooth quaternionic carriers. Prove its vertical tangent
Spin lift: the isotropy representation of Sp2×Sp1 on H² descends
through the diagonal central element. Pin the isotropy path
(diag(q,q),q) for q:1→−1 in Sp1: its tangent action on H² is
conjugation in each block, giving two2π rotations in SO8 and the
trivial π1(SO8) class. Prove the lifted central−1 acts as+1 on
the actual Spin bundle, so the canonical Sp3 action descends to
PSp3, rather than supplying only a projective spinor action. Construct
T:Σ8 MSpin smash BPSp3₊→MSpin and its geometric transfer.
Use B3.0's connective ABS map D:MSpin→ko.
Construct a spectrum-level nullhomotopy of D∘T in the same coherent
operator/Thom model. Take the metric on HP2 from RiemannianGeometry R1:
the quotient of the round S11 by the right unit-quaternion action, with
its Riemannian submersion from Sp3/(Sp2×Sp1). Prove it PSp3-invariant:
Sp3 acts on S11⊂H³ by left multiplication through isometries commuting
with the right Sp1 action, and −1 acts trivially on the quotient. R1's
sectional-curvature bounds 1≤K≤4 give Scal≥8·7=56>0 by tracing over
an orthonormal frame of the eight-dimensional tangent space, which is
all the Lichnerowicz step uses (the exact value is 16·2·4=128 in
PositiveScalarCurvature's normalization). First construct the single
PSp3-equivariant real Cl(0,8)-linear Dirac operator on HP2 with this
invariant metric and the Spin lift above. Its Lichnerowicz gap gives an
equivariant invertible bounded
transform and an explicit index-zero contraction in G5's graded real
Clifford configuration. Consume Index's equivariant embedding proof for
the complex symbol comparison; own here its real Clifford refinement,
the PSp3-equivariant spinor/L2/Sobolev domains and continuous transforms,
and the actual homogeneous Thom/Koszul comparison for the associated
PSp3-representation embedding. Descend this fixed equivariant construction
along EG×_G(−) to the whole numerable universal bundle, proving local
transition compatibility, pullback and stabilization. This supplies one
coherent Borel index comparison and contraction globally. Extend it
MSpin-linearly using multiplicativity of D. Finally use G's
connective-cover mapping vanishing: Σ8 MSpin∧BG₊ is8-connective, so
its maps and homotopies into KO uniquely lift through ko. A zero point
α-value or unrelated zero classes on finite skeleta do not supply these
comparison maps. Let F=hofib(D:MSpin→ko) and construct from this nullhomotopy the lift
of the transfer through the fibre, a map Σ8 MSpin∧BG₊→F.

For the2-primary calculation construct the following usable ordinary
cohomology and Adams APIs, rather than treating a kernel statement as
a supplier. On G= PSp3 and H=P(Sp2×Sp1), prove
`H*(BG;F2)=F2[t2,t3,t8,t12]` and
`H*(BH;F2)=F2[u2,u3,u4,u8]`, with degrees given by subscripts.
Fix t2 as the central Spin/Sp lifting obstruction, t3=Sq1 t2,
and fix t8,t12 through the actual adjoint representations below. Prove
these complete rings, finite-dimensionality in every degree and all
extensions using the central-extension Serre sequences, quaternionic
sphere/flag bundles and comparison with the elementary subgroup;
a restriction formula alone is insufficient to prove the ring.
For the ordered C2^4 subgroup generated by
`[i,i,i],[j,j,j],[−1,1,1],[1,−1,1]`, write degree1 classes
x1,x2,y1,y2 in that order. Prove
t2=x1²+x1x2+x2², t3=x1x2(x1+x2),
s1=t3 y2+t2 y2²+y2⁴, s2=t3 y1+t2 y1²+y1⁴,
t8=s1²+s1s2+s2² and t12=s1s2(s1+s2).
Pin the real4-dimensional Rij action as q↦h_i q h_j^(-1).
Its restricted total SW class is1+t2+t3+s_ij; the three
imaginary-quaternion summands have class1+t2+t3. Thus the
real21-dimensional adjoint representation has
w8=t8+t2⁴ and w12=t12+t2⁶+t3⁴. These equations specify global
t8,t12 without defining them only after restriction. Prove restriction
injectivity and the full Sq1,Sq2 table:
Sq1(t2)=t3, Sq1(t3)=Sq1(t8)=Sq1(t12)=0,
Sq2(t2)=t2², Sq2(t3)=t2t3, Sq2(t8)=0,
Sq2(t12)=t2t12. Derive all monomial actions by Cartan.
The homogeneous bundle π:BH→BG has
π*t2=u2, π*t3=u3, π*t8=u4²+u8 and π*t12=u4u8.
Prove H*(BH) is free over H*(BG) on1,u4,u4², with
u4³+t8u4+t12=0. Its vertical tangent has
`w(τ)=1+(u4+u2²)+(u3²+u2u4)+u3u4+u8`.
Prove the Gysin formula π!1=π!u4=0, π!u4²=1 and its
H*(BG)-linearity through the actual mod2 Thom orientation.
Compute T* from this Gysin map, the characteristic classes of −τ
(the inverse of w(τ)), and the Whitney coproduct on H*(MSpin),
proving compatibility with Steenrod operations and with the lift to F.
Name these exports projectiveSymplecticThreeCohomologyModTwo,
projectiveSymplecticThreeSqOneTwo,
spinHpTwoVerticalThomGysin and spinHpTwoTransferCohomology.

Construct the Anderson–Brown–Peterson input from B3.4's H*(BSpin;F2),
H*(MSpin;F2) and H*ko=A//A(1). Index the KO-Pontryagin characteristic maps by
finite partitions I with every part>1, allowing the empty partition,
and let n(I) be the sum of its parts. Define the actual KO-Pontryagin
classes by the formal-power-series identity
`π_(t/(1+t)^2)(ξ)=λ_t(ξ−rank ξ)`, with π0=1; substitution by
t/(1+t)^2 has leading coefficient1, so construct its integral
compositional inverse and the unique coefficients πi. Consume
TopK's real exterior powers and λ sum/product laws; prove stable
naturality, Whitney multiplication and the oriented-real-plane test
π1(ℓ_ℝ)=[ℓ_ℝ]−2 with higher πi=0. Set π^I=∏_j π^(i_j).
Build the space-level universal operations on the same stable BO/BSO classifier
using coherent exterior-power and virtual-difference maps, transport
them through G's Ω∞KO comparison, and pull back to G5.0's stable
BSpin. Prove their skeletal mapping-space/Milnor comparison, retaining
or proving vanishing of the actual lim1 obstruction as required; a
compatible sequence of finite classes alone does not choose a
represented universal KO class. Construct the actual connected-cover
spectra C_k=G3.8 spectrumConnectiveCover KO k, with π_i=0 for i<k,
and the canonical map to KO;
C_0=ko. Pin Stong's BO(k,…,∞) notation by its8j-th space
BO(8j+k,…,∞), with the required loop intermediates and rank-component
convention at0. These are connected-cover coordinates, not a formula
Σ^k ko for every k. Construct the Spin characteristic maps into C_(k(I)),
where k(I)=4n(I) for even n(I) and4n(I)−2 for odd n(I), with the
empty-partition map the actual ABS map D. Prove the ABP skeletal
filtration theorem for the represented universal π^I: construct a
specified coherent nullhomotopy on the (k(I)−1)-skeleton and the
resulting map on its quotient. That quotient's suspension spectrum
is k(I)-connective, so G3.8's coreflection gives a chosen lift
`Σ∞BSpin₊→C_(k(I))`, with its map to KO and retained homotopy.
Prove the obstruction/cohomology calculation selecting these lifts;
do not infer a unique lift directly from MSpin's connectivity.
The empty partition uses the augmentation and ko unit. Construct
the characteristic spectrum map by the actual Thom diagonal
`MSpin→MSpin∧BSpin₊`, then ABS smashed with this lift, then the
coherent ko-module action `ko∧C_k→C_k` supplied by G3.8.
Export spinKOPontryaginClass, spinKOPontryaginCoverLift and
spinABPCharacteristicMap, including their chosen homotopies.
Calculate their cohomology
on explicit admissible/partition bases and prove the combined map is
injective with free A-module cokernel. Choose its graded free basis z_i,
construct the corresponding maps into Σ^|z_i|HF2, compute the
degreewise basis multiplicities and prove the resulting ABP map a
2-local equivalence. Prove degreewise finite connectivity and the
wedge/product comparison, obtaining the actual ABP wedge equivalence
of MSpin_(2) in G's spectral model. This includes the cover maps and
bottom ABS comparison, not only an additive coefficient table.
Construct its spectrum right inverse s:ko_(2)→MSpin_(2), with
D∘s=id and homology multiplication compatibility. The right inverse
is not asserted to be a ring-spectrum map. For MSpin-module spectra
prove the natural extended A(1)_*-comodule description of homology,
using the H*ko-module indecomposables and this homology comparison;
no associative ko-action on MSpin is inferred from s.
Resolve the A(1) modules appearing in the transfer calculation by
explicit graded free resolutions. Include the trivial module, the
augmentation ideal I, the Joker J and K, with their defining Sq
action matrices and exact shifts pinned from those matrices. For
H*(BG), decompose the actual polynomial module as
F2[t8,t12²]⊗(F2[t2,t3]⊕t12 F2[t2,t3]); the second summand has
Sq2(f t12)=(Sq2 f+t2 f)t12 and Sq1(f t12)=Sq1(f)t12.
Construct its decomposition into these finite A(1) modules and free
summands with degreewise multiplicities. Prove the needed split-injection
criterion by these modules and Q0=Sq1 Margolis homology, then apply
it to the computed transfer, not to an arbitrary A-module injection.
Compute Ext and the natural transfer maps by the actual resolutions,
including multiplicative change of rings. Pin the check
Ext_(A(1))(F2,F2)=F2[h0,h1,a,b]/(h0h1,h1³,h1a,a²+h0²b),
with bidegrees (s,t) of h0,h1,a,b equal(1,1),(1,2),(3,7),(4,12),
and the ko extensions η³=0,2η=0,a_KO²=4b_KO in the same
Bott normalization. Compute the Ext tables for every I,J,K/free
summand used here, not only the displayed trivial-module ring.
Prove spinHpTwoTransferLift_cohomology_splitInjective as an actual
A-module split injection H*F→H*(Σ8 MSpin∧BG₊), and prove the
source's mod2 Adams sequence collapses by these resolutions and the
ABP comparisons. Construct a natural convergent map of Adams sequences,
prove surjectivity on E∞ and filtration completeness/lifting, then
pass from2-completion to2-local point homotopy using the degreewise
finite-generation theorem. These are construction/proof prerequisites
for spinHpTwoTransfer_pointKernelAtTwo, not consequences of the
desired kernel equality.

At odd primes use B4.8's actual ΩSpin_(p)=ΩSO_(p) ring, together
with concrete Kreck–Stolz bundles. For n≥2 and0≤r≤n−2 construct
E_r=γ1⊕γ2⊕H over HP^r×HP^(n−r−2) and its right-quaternionic
projectivization P(E_r) with fibre HP2, Spin lift and classifying map
into BPSp3. Orient HP^j so that u^j evaluates1, where
u=−c2(Cγ_H); explicitly transport this orientation from G4.0a's
standard right-H charts (the sign is(−1)^j). Use the corresponding
fibre orientation and prove
`s_n(P(E_r))=−2 (binom(2n,2(r+1))−1)` for its Pontryagin Newton
number in real dimension4n. Derive it from G4.5's integral BSp3
and Sp2×Sp1 torus/tautological APIs: the actual vertical weights are
x1±x3,x2±x3, and the Gysin map extracts the x3⁴ coefficient in
the rank3 projective-bundle relation. Prove the gcd of these numbers
is2^a p when2n+1 is a p-power and2^a otherwise, where a=2 for
n=2^j−1 and a=1 otherwise. Prove the integral binomial gcd lemma
and its2-adic valuation, with n=2,3 and r=0/basepoint cases checked.
Since powers of2 are units at odd primes, actual Bézout combinations
of these total spaces give all positive-degree Spin ring generators
in degrees≥8; the degree4 generator maps injectively to KO.
Prove the point KO-kernel is the transfer image at every odd prime,
including products/module linearity and integral localization descent.
Together with the2-local result obtain
`ker(ΩSpin_n→KO_n)=im(ΩSpin_(n−8)(BPSp3)→ΩSpin_n)`
integrally, with negative domain groups zero. Arbitrary-X transfers
exist by item4; an arbitrary-X kernel equality is a separate theorem
with its actual hypotheses. PSC consumes this point algebraic/geometric
kernel for its metric and surgery converse.

The transfer, cohomology and ABP construction APIs include:

- The equivariant Spin lift descends to PSp₃ and the Dirac contraction descends over the whole classifying space, retaining its chosen nullhomotopy and fibre lift.
- The BG/BH generators, restriction, Steenrod and Gysin formulas determine the transfer as a comodule map; resolutions compute the induced Ext maps and filtration extensions.
- KO-Pontryagin classes retain their represented universal maps and chosen connected-cover lifts; the characteristic maps assemble into an additive 2-local equivalence with the specified bottom ABS map.

**Checks.**

- The isotropy path makes two full plane rotations, so its π₁(SO₈) class is 1+1=0; one rotation would give 1 and would not descend to the claimed Spin lift.
- On an HP² fibre, u₄ restricts to its degree-four generator and π!u₄²=1 while π!1=π!u₄=0 by degree. At the trivial subgroup t₂=t₃=t₈=t₁₂=0.
- The adjoint correction terms have degrees 8 and 12: at x₁=1,x₂=y₁=y₂=0 in the polynomial test, t₂=1,t₃=t₈=t₁₂=0, so w₈=w₁₂=1. Omitting the correction terms would give zero.
- For a real oriented plane, λ_t(ℓ_ℝ−2)=1+([ℓ_ℝ]−2)t/(1+t)², so π₁=[ℓ_ℝ]−2 and higher π_i=0; the zero virtual bundle has π₀=1 and π_i=0 for i>0.
- For partition I empty, n(I)=k(I)=0 and the characteristic map is D; I=(2) has k=8 and I=(3) has k=10, excluding the uniform formula 4n(I).
- In the trivial-module Ext ring, a has (s,t)=(3,7), hence stem 4; a² and h₀²b both have (6,14). The KO extension is a_KO²=4b_KO, not b_KO.
- For n=2,r=0 the projective-bundle Newton number is −2(6−1)=−10; for n=3,r=0,1 it is −2(15−1)=−28 in each case, with gcd 28=4·7.

The Newton family and gcd are Kreck–Stolz §4, Proposition 4.2 and Lemma 4.3,
pp.244–245; its homology comparison is §6. The integral point-kernel theorem is
Rosenberg–Stolz Theorem 3.3, p.8, with the distinct prime-local arguments
explained immediately after it. Its route uses that paper’s §§3–4, the ABP
splitting and Stolz's 2-primary transfer theorem; none of these statements
asserts an arbitrary-parameter-space kernel equality.

*Needs:* B6.4; B3.0, B3.4; B4.2, B4.7–B4.8 and B6.1–B6.2; GeneralizedCohomology G3.8–G3.9 and G4–G5; TopologicalKTheory T5–T7; RiemannianGeometry R1; IndexTheory I2–I5.

### Examples

The CP² conjugation mapping torus detects the degree-five torsion branch; the HP² fibre has positive scalar curvature and zero KO index.

### Dependencies

Layers 2–8; CharacteristicClasses C1.3–C1.4; ClassifyingSpaces Stage 4; GeneralizedCohomology G3.8 and G4–G5; RiemannianGeometry R1; IndexTheory I2–I5; TopologicalKTheory T5–T7.

## Downstream consumers

BordismFormalGroups and HomotopySpheres consume the ordinary operation, Adams,
finite quadratic and framed PT interfaces. FourManifolds consumes B1.7's concrete
examples, B3.2's quadratic/filling results and B4's ordinary Wu package.
StringOrientation and EllipticCohomology precede this roadmap and consume
nothing from it. PositiveScalarCurvature consumes the associated-family transfer,
point KO-kernel, homogeneous tangent and HP^k Pontryagin calculations for its
metric and surgery results. These consumers provide no prerequisite of the
targets above.

## References

- R. Thom, *Quelques propriétés globales des variétés différentiables*,
  Commentarii Math. Helv.28(1954),17–86,
  [primary paper](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Thom1954.pdf),
  especially geometric realization and its degree6/degree7 distinction.
- C. T. C. Wall, *Determination of the Cobordism Ring*, Annals of Math.
  72(1960),292–311, [primary paper](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/cobord.pdf).
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Springer GTM218,
  2013, Chapter 6 for Whitney approximation and parametric transversality,
  and Theorems 21.10 and 21.13 for the quotient manifold theorem.
- J. Milnor, *On the cobordism ring Ω\* and a complex analogue, Part I*,
  Amer. J. Math.82(1960),505–521, §4, Theorems 4–5, p.519,
  for the odd-primary Thom-module calculation and absence of odd torsion.
- M. F. Atiyah, R. Bott and A. Shapiro, *Clifford modules*, Topology3,
  Suppl.1(1964),3–38, for the ABS Thom class and orientation of B3.0.
- D. W. Anderson, E. H. Brown and F. P. Peterson, *The structure of the
  Spin cobordism ring*, Annals of Math.86(1967),271–298, for the 2-local
  splitting of MSpin used in B6.6.
- J. McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Cambridge
  Studies in Advanced Mathematics58, 2001, Chapter 6, for transgression,
  Kudo's transgression theorem with its transpotence differential, Borel's
  transgression theorem at 2 and at odd primes, and the Serre and Cartan
  computations of the mod p cohomology of Eilenberg–MacLane spaces.
- R. E. Stong, *Notes on Cobordism Theory*, Princeton University Press,1968;
  J. Milnor and J. Stasheff, *Characteristic Classes*, Princeton,1974,
  [institutional TeXromancers edition](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/milnor-stasheff2.pdf),
  Problems 16-C–F, pp.203–204 of that edition, for the complex-to-real
  Newton comparison and the real/complex incidence hypersurfaces;
  Chapter 17 for bordism and Chapter 18 for the classical Thom comparison.
- H. Miller, *Notes on Cobordism*, MIT lecture notes, version December 5, 2001,
  [institutional copy](https://rezk.web.illinois.edu/miller-lecture-notes.pdf), for the spectral MO
  computation and the distinction between additive splitting and ring proof.
- S. Führing, *Bordism and projective space bundles*, Münster J. Math.
  15(2022),355–388,
  [primary paper](https://www.uni-muenster.de/FB10/mjm/vol_15/mjm_vol_15_11.pdf).
- J. Rosenberg and S. Stolz, *A stable version of the Gromov–Lawson
  conjecture*, [author manuscript](https://math.umd.edu/~jmr/StableGLConj4.pdf),
  Theorem 3.3, p.8, for the HP2 transfer, its 2-local proof and separate odd-prime refinement.
- John Baez, [The Octonions](https://arxiv.org/abs/math/0105155),
  §§2.2,3.4,4.2, for the division algebra, Albert idempotent charts and F4/Spin9.
- Borel–Hirzebruch, [Characteristic Classes and Homogeneous Spaces I](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/162/1/19_Characteristic%20classes%20and%20homogeneous%20spaces%20I.pdf),
  §19, especially Theorem19.4, for the Cayley-plane isotropy/class calculation.

- M. Kreck and S. Stolz, *HP2-bundles and elliptic homology*,
  Acta Math.171(1993),231–261,
  [primary paper](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6490-11511_2006_Article_BF02392533.pdf),
  §4, Proposition 4.2 and Lemma 4.3, pp.244–245, for the concrete
  quaternionic bundles and Newton gcd; §6 for the
  homology-ko comparison and transfer splitting distinctions.
- J. F. Adams and M. F. Atiyah, *K-theory and the Hopf invariant*,
  Quart. J. Math.17(1966),31–38,
  [primary paper](https://www.maths.ed.ac.uk/~v1ranick/papers/adamatiy.pdf),
  §1 for the integral K0/Adams-operation dimension restriction.
- S. Stolz, *Simply connected manifolds of positive scalar curvature*,
  Annals of Math.136(1992),511–540,
  [publisher record](https://doi.org/10.2307/2946598), for the2-local
  HP2 transfer theorem and A(1) calculations.

- A. Pyronneau, *The Arf and Rohklin’s invariant*, January 2024,
  [institutional notes](https://web.ma.utexas.edu/SMC/2024/Rokhlin_s_Invariant.pdf),
  §2.1, Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp.4–5.
  The Gauss-sum and Lagrangian formulations here are consequences of the
  paired-plane classification, with the zero-dimensional case included.
- B. Guillou and C. Weibel, *Unstable operations in étale and motivic cohomology*,
  [arXiv:1301.0872v1](https://arxiv.org/abs/1301.0872v1), 2013,
  Definition 6.1, Theorem 6.2 and Theorem 6.5, pp.18–19. The algebra theorem
  is used with coefficient algebra F_p; the cochain construction supplies
  its ordinary topological application. These are the v1 locators.

- R. Gompf and A. Stipsicz, *4-Manifolds and Kirby Calculus*, AMS GSM 20,
  1999, §§3.1 and 8.3, for quartic and rational elliptic examples and their
  handle descriptions; the marked boundary Spin comparison is an additional
  target here, not inferred from characteristic-number equality.

- M. F. Atiyah, *Riemann surfaces and spin structures*, Ann. Sci. École Norm.
  Sup. (4) 4 (1971), 47–62,
  [open archive](https://www.numdam.org/item/ASENS_1971_4_4_1_47_0/),
  §4, Proposition 4.1 and Theorem 3′, p.58, for the mod2 Spin-index
  boundary criterion and the count of bounding surface Spin structures.
- R. Benedetti and P. Lisca, *Framing 3-manifolds with bare hands*, 2018,
  [arXiv:1806.04991v2](https://arxiv.org/abs/1806.04991v2), Theorem 1, p.1,
  and §2.1, pp.2–3, for closed three-manifold parallelization and its Wu/Spin route.
