# Tangential bordism, geometric cycles and characteristic numbers

Construct geometric bordism as a homology theory on spaces and pairs, compare
it with the corresponding Thom spectra, and compute its classical invariants.
The library includes actual collared witnesses, stable tangent and normal
structures, finite-codimension Pontryagin–Thom, unoriented and oriented
coefficients, low-dimensional Spin examples, characteristic-number detection
and projective-bundle transfers. A group at a point does not supply the theory
over a space, and a spectral isomorphism does not supply an explicit filling.

`README.md` is definitive. `Suggested.lean` records selected native carriers
and interface shapes; it is not an exhaustive checklist. Implementation homes
include `TauCeti/Geometry/Manifold/Bordism/` and
`TauCeti/AlgebraicTopology/Bordism/`.

## Suppliers and conventions

Use native `SingularManifold` in Mathlib Geometry/Manifold/Bordism.lean, its
map, sum and product, and the witness/quotient shape of the unoriented-bordism
proposal for Mathlib. Its proposed proofs are not implemented prerequisites.
Add Hausdorffness. Second countability follows from compactness and the
Euclidean chart model by native `ChartedSpace.secondCountable_of_sigmaCompact`.
Use finite-dimensional real models, native model-with-corners manifolds,
`Diffeomorph` and native continuous/smooth vector-bundle objects, with
`ContMDiffVectorBundle` on smooth bases. A classifier into an arbitrary CW
B_k and its pulled-back bundle are continuous, as B5 requires.

| Supplier | Consumed interface | Boundary |
| --- | --- | --- |
| [GeometricTopology](../GeometricTopology/README.md), Layer1, Layer11 and item1 of the smoothing-and-triangulation comparison | collars, gluing along a piece of the boundary and handle attachment, tubular neighbourhoods with their normal bundles; the CW structure on the realization of a simplicial complex; Whitehead's smooth triangulation | B1.6 owns neat embeddings, relative/parametric transversality, corner rounding, compact neighbourhoods and doubles; B1.5 owns the relative boundary triangulation |
| [DifferentialGeometry](../DifferentialGeometry/README.md), 2.1, 5.5, 8.3, 10.2 | the manifold-orientation carrier with chart signs, face-indexed corners, the smoothing of simplices, manifold Sard `dense_isRegularValue` | B1.6 derives transversality from 10.2 |
| [AlgebraicTopology](../AlgebraicTopology/README.md), Stages2–4,6,8 | arbitrary CW skeleta/cofibrations, ordinary chains/cochains/products, relative fundamental classes and duality, EM carriers and representability | B4 owns the integral higher diagonals and generic ordinary mod2 cup-i/Sq/Adem/Wu package; ordinary cohomology carriers remain AT |
| [DGFloer](../DGFloer/README.md), Layer1 items2–3 | the ordinary homology and multiplicative cohomology Serre spectral sequence of a Serre fibration over a CW base, with local coefficients | B4.2 owns transgression, Kudo's theorem and Borel's transgression theorem, and B4.7 their odd-prime forms |
| [GeneralizedCohomology](../GeneralizedCohomology/README.md), G1–G5 | actual spectral homology on pairs, G1.1 morphisms of theories, G3.3's arbitrary-CW comparison theorem, G3.8 connective covers, finite duality and G5.2's unframed Thom collapse with its stabilized embedding comparison, compatible universal bundle diagrams with cofinal reindexing, MO/MSO/MSpin/MU^(2) and quaternionic smooth carriers, G5.5's ABS orientation | geometric cycles, ξ-lifts and PT, coefficient rings and transfer/kernel calculations are here |
| [TopologicalKTheory](../TopologicalKTheory/README.md), T1/T3–5/T7; [CharacteristicClasses](../CharacteristicClasses/README.md), C1–C4/C6, C2.3, C7.3, C7.3a | fixed-rank classifiers, chosen ordinary Thom quotient, w/c/p/Euler classes, character/Thom corrections and algebraic ABS conventions; finite faithful unitary representations of compact Lie groups and their smooth Stiefel approximations of BG; `TSⁿ⊕ε¹≅ε^(n+1)`, `w(T RP^m)=(1+a)^(m+1)` and the immersion normal bundle | B3.0 owns the Spin ABS genus comparison; B4 compares Sq with these same w classes; B6 supplies bordism calculations |
| [SpinGeometry](../SpinGeometry/README.md), G4, G5.0, G6.0, G6.7 | Spin lifts and H1 torsors, circle/surface refinements; G5.0's `realCliffordSpinorBundle` P×_Spin(n)Cl(0,n) with its negative tangent and positive external Clifford actions and signed grading; G6.0's `realSpinDiracClosedRealization` on the H1 domain, `realSpinLichnerowiczFormula` and `realSpinDiracIndexClass` in KO_n through GeneralizedCohomology G5.5's `realMixedCliffordIndexClassification`; G6.7's equation `realSpinDiracIndexClass = α·a` in KO₄ for the quaternionic index α | B3.0 compares that analytic class with the geometric ABS/PT genus; B3 proves Spin bordism classifications |
| [RiemannianGeometry](../RiemannianGeometry/README.md), R1 | the quotient metric on HP^d from the round S^(4d+3), its Riemannian submersion from Sp(d+1)/(Sp(d)×Sp(1)) and its sectional-curvature bounds 1 and 4 | B6.6 proves PSp3-invariance and positive scalar curvature on HP2 |
| [ClassifyingSpaces](../ClassifyingSpaces/README.md), Stage4 | `H_*(BG;ℤ)` identified with Mathlib's `groupHomology` of the trivial module | B6.3 applies it to finite cyclic groups |
| FourManifolds, early example constructions | F7.0 quarticKThree carrier/characteristic calculation and ellipticEOneFiberComplement, E(1) minus a regular elliptic fibre with its actual Lie-spin T3 boundary | these examples precede bordism consequences; later Four Wu/Rokhlin applications consume B3/B4 |
| [IntegralLattices](../IntegralLattices/README.md) | integral lattice and real intersection-form algebra | B3.2(a) constructs the finite-F2 Arf invariant used by surface and Seifert refinements |
| StringOrientation, S1 | normalized λ on the stable Spin classifier, BString mapping-path fibre, relative lifts and H3 torsor | only this early obstruction/lift lane precedes B3.8; String bordism and TMF/genus calculations follow this roadmap |
| [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md), Layer 8 compact real algebra suppliers; [LieGroups](../RepresentationTheory/LieGroups/README.md), Layers2,4; [SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md), Layer7; SmoothBundlesConnections, B1.4 | `TauCeti.DivisionOctonionReal` with positive conjugation, norm and two-generator associativity; `compactAlbertAlgebra` with positive trace form, Peirce decomposition and primitive = trace-one idempotents; `compactAlbertDerivation_complexification` and `compactAlbertDerivation_killing_negDef`; generic closed subgroup smooth charts; the real Clifford classification and `Spin(3)≃S³`; free proper smooth quotients as principal bundles | B3 owns their idempotent/F4–Spin9 geometry, distinct from native split Zorn/Albert forms |
| IndexTheory, I1/I2/I3/I5, I7.2, I7.5; PseudodifferentialOperators; G5 graded operator comparison | compact elliptic/Dirac symbol-index and local regularity, Hilbert/Clifford configuration index; I7.2's `sign(M)=⟨L(TM),[M]⟩`; I7.5's `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` and `rokhlin_signature_dvd_sixteen` | B3.0 owns the closed Spin ABS/real-Dirac comparison; B6 constructs the homogeneous HP2 associated-family comparison and global transfer nullhomotopy |

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
intersection product requires an oriented manifold target and its separate
construction. There is no ordinary covariant bordism ring on every space X.

BordismFormalGroups owns real/complex orientation formal laws, completed
projective coordinates and coefficient-law universality. StringOrientation and
EllipticCohomology own BString/string lifts, String/TMF genera and the
qualified transfer statements on B3's fixed Cayley-plane carrier.
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
BordismFormalGroups'. The finite framed Pontryagin–Thom bijection and the
stable framed PT map (B5.2, B5.5) and the ΩSpin_2 filling theorem (B3.2(c))
are owned here.

## B1. Cycles, structures and collared witnesses

1. Construct the model-transport adapter along the ordered continuous linear
   equivalence E_p×E_q≃L[ℝ]E_(p+q), for E_n=EuclideanSpace ℝ (Fin n).
   Transport charts and IsManifold/BoundarylessManifold, prove identity,
   composition, associativity and block-permutation laws, and compare tangent,
   orientation and Spin bundles under the same adapter. Closed sources use
   the boundaryless E_n model; n-dimensional relative sources use the native
   Euclidean half-space model of dimension n (n>0), and bordism witnesses
   use `modelWithCornersEuclideanHalfSpace (n+1)`. Face-indexed corner
   models come from DifferentialGeometry 5.5 and B1.6's corner rounding.
   Dimension0 has empty boundary and no half-space-of-dimension0 model.
   Construct O/SO/Spin cycles over X and compatible ξ-normal cycles. Reuse
   native SingularManifold for closed sources, with T2 and second-countable
   hypotheses. Give actual oriented frame reductions, Spin double-cover
   lifts and normal classifier maps with bundle isomorphisms. Compare
   finite representatives of stable structures, all higher stabilizations,
   pullbacks, diffeomorphisms and changes of classifier lift by homotopy.
   Consume DG2.1's single manifold-orientation carrier, with native
   `Orientation ℝ (TangentSpace I x) (Fin n)` for the actual dimension-n
   model I of the cycle or witness. This is the positive-scalar ray of a
   nonzero alternating top form, used as the pointwise datum. Reuse
   its locally compatible tangent-chart sections and comparison with AT's
   local integral homology orientations; construct the adapters to these
   cycle and witness records. For n>0 prove equivalence with the chosen
   oriented orthonormal frame/SO reductions; the comparisons retain the
   actual orientation, rather than only existence of a reduction. Prove
   equivalence with refinements of native
   `TauCeti.orientationPreservingGroupoid` only for the boundaryless model
   in every dimension n≥1 and for half-space and corner models of
   dimension at least2, where composing a boundary chart with a reflection
   of a tangential coordinate (in a corner chart, a swap of two coordinates)
   makes it positive. In model dimension1 with boundary no such atlas
   exists: a half-line chart at 0 of [0,1] is increasing and one at 1 is
   decreasing, so some transition has negative derivative, although [0,1]
   is oriented (native `TauCeti.orientable_closedBall` assumes 2≤n for
   this reason). There, and so for every bordism witness of a
   zero-dimensional cycle and every one-dimensional relative source,
   compare only through DG2.1's chart-sign carrier and the frame and
   determinant descriptions. Construct reversal by the negative ray,
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
   retain these data and laws; no new generic orientation carrier or
   duplicate one-line native theorem is introduced.
2. Construct compact smooth collared bordism witnesses with continuous
   parameter maps and actual structured boundary diffeomorphisms. Construct
   cylinders, reversed witnesses, disjoint union and gluing. Use collars to
   arrange constant parameter maps on the gluing collar, prove collar-choice
   independence, and round product/gluing corners relative to fixed faces.
   Prove that stabilized bundle structures glue and the induced boundary
   structures have the stated signs. Prove reflexivity, symmetry and
   transitivity by these witnesses, including their relative versions.
3. Construct relative cycles and bordisms on pairs and triples; a free boundary
   face maps into A. Keep face intersections and map restrictions in the
   witness. Prove invariance under changing a relative representative by an
   allowed collar homotopy, and compatibility of structure forgetting with
   every witness operation. Give O/SO/Spin/complex/quaternionic normal
   forgetting maps through the fixed G5 coordinate and orientation adapters.
4. Prove a small-representative theorem before defining a small quotient:
   compact smooth cycles admit embeddings in some finite Euclidean space,
   with codes for closed embedded representatives, finite atlases and
   parameter maps in explicitly bounded universes. Construct equivalences
   with the native bundled carrier and prove universe-lift comparisons.
   Quotienting all Type-u manifolds does not itself produce a Type-u group.
5. Supply the example/witness geometry before its bordism applications:
   smooth free finite-action quotients from SBC B1.4's proper/free principal
   quotient (finite discrete groups are zero-dimensional Lie groups), including
   their chart/covering/compactness and tangent-bundle comparisons; smooth
   mapping tori from GT Layer1 collared boundary gluing, with explicit monodromy and
   boundary identifications; unit disk/sphere bundles as smooth manifolds with
   boundary using their fibre half-space charts, radial collars and native
   vector-bundle transition maps. Compare all these chosen carriers with the
   literal quotient/total-space sets and their topology. Consume item1 of GT's
   [smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison-far-horizon)
   (Whitehead's smooth triangulation of every smooth manifold) and GT
   Layer11's CW structure on the realization of a simplicial complex. Own
   here the relative refinement in which a collared boundary, or a chosen
   union of faces, is a subcomplex: triangulate the double of B1.6 compatibly
   with its reflection, or triangulate the boundary first and extend over
   the collar by the product subdivision. This gives native finite CW pairs
   for compact sources/witnesses; it precedes B2 weak-pair invariance and B5
   lifting, independently of the bordism coefficients.
6. Own the differential-topology inputs of the geometric theory that the
   cited GeometricTopology layers do not state. Each is a smooth statement
   on finite-dimensional real manifolds with corners in Mathlib's sense.
   - **Neat Euclidean embeddings.** Mathlib's
     `exists_embedding_euclidean_of_compact` gives, for a compact Hausdorff
     smooth manifold over any model with corners, a smooth closed embedding
     with injective derivative into some EuclideanSpace. For a compact
     manifold with collared boundary construct from it an embedding into a
     half-space R^(N−1)×[0,∞) that meets the boundary hyperplane exactly in
     ∂M, orthogonally along the collar, and that extends a prescribed neat
     embedding of ∂M; give the relative version for bordisms with two end
     faces and a free face. Prove that any two such embeddings become
     isotopic rel boundary after a common stabilization, by B5.4's block
     rotation.
   - **Transversality.** From DifferentialGeometry 10.2's
     `dense_isRegularValue` (manifold Sard) prove the parametric
     transversality theorem: if F:M×S→N is smooth, transverse to a closed
     submanifold Z⊂N, then for a dense set of s∈S the map F(−,s) is
     transverse to Z, and for M with boundary the same holds for F(−,s) and
     its boundary restriction together. Deduce relative transversality
     approximation: a continuous map from a compact manifold with corners to
     a manifold N, already smooth and transverse to Z near a closed subset C,
     is homotopic rel C, by an arbitrarily small homotopy, to a smooth map
     transverse to Z on each face. Prove the relative Whitney approximation
     of continuous maps into N for the smoothing step (the general form of
     the simplex case used in DifferentialGeometry 8.3), and use the
     finite-dimensional linear parameter family of a Euclidean embedding of N
     composed with a tubular retraction (Lee, *Introduction to Smooth
     Manifolds*, 2nd ed., Chapter 6, Whitney approximation and parametric
     transversality). Apply it to the zero section of the
     finite smooth Grassmannian Thom spaces of B5.3. Transverse preimages are
     neat submanifolds with normal bundle the pulled-back normal bundle of Z.
   - **Corner rounding.** For manifolds with boundary M and N construct a
     smooth structure with boundary on M×N, and on a gluing along part of a
     boundary, by rounding the codimension-two corner in polar coordinates
     of a product collar; prove independence of the rounding up to
     diffeomorphism fixed away from a collar of the corner, and compatibility
     with orientations, Spin and normal structures and maps to X.
   - **Neighbourhoods and doubles.** For a compact subset K of a
     Hausdorff second-countable smooth manifold M without boundary,
     construct a compact smooth codimension-zero submanifold with boundary
     containing K in its interior: take a regular value, by DifferentialGeometry
     10.2, of a smooth proper exhaustion function above its maximum on K.
     For a compact M with collared boundary construct its double as GT
     Layer1's full-boundary gluing of M and its reversal along the collar,
     with the reflection, the inclusion of M and the restriction of tangent,
     orientation and Spin data.
   These are owned here because the GeometricTopology roadmap states
   collars, boundary gluing and tubular neighbourhoods (its Layer1) but not
   these statements.

## B2. Groups, products and the geometric homology theory

1. Define the actual witness Setoid and its quotient using B1's small
   representatives. Construct zero, addition and inverses by geometric
   witnesses: unoriented inverse is the same cycle; oriented/Spin inverse
   reverses the chosen orientation/structure. Prove all abelian group laws,
   pushforward identity/composition and homotopy invariance. Prove 2ΩO=0
   by a cylinder with its structured boundary identification.
2. Construct external products, coefficient action, the point unit and all
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
3. Construct boundary Ω_n(X,A)→Ω_(n−1)(A), pair/triple long exact
   sequences, excision and Mayer–Vietoris with their actual witness maps.
   Use smooth separating hypersurfaces and collars for geometric excision
   and prove naturality and connecting-map signs. Prove arbitrary disjoint
   unions and filtered CW continuity from compact source support. For
   arbitrary spaces/pairs compare with singular CW approximations and the
   homotopy-cofiber pair convention; identify when literal subset relative
   groups agree, rather than assuming every A→X is a cofibration.
4. Construct the fundamental-class orientation maps ΩSO_n(X,A)→H_n(X,A;Z)
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
   mod2 class. On oriented
   smooth targets construct transverse intersection with dimension shift
   p+q−dim X and prove its comparison with ordinary cup/intersection under
   Poincaré–Lefschetz duality, with all compact-support/relative hypotheses.

## B3. Low groups and specified geometric examples

0. **Geometric ABS genus and Dirac comparison.** Before any coefficient
   classification construct α_n(X,A):ΩSpin_n(X,A)→KO_n(X,A) from B5's
   structured Pontryagin–Thom comparison and G5.5's actual multiplicative
   ABS orientation MSpin→KO. Prove naturality, witness invariance,
   relative exact-sequence and product compatibility; write α(M)∈KO_n
   for its point specialization. Construct here, once, the connective ABS
   map D:MSpin→ko, ko=`spectrumConnectiveCover KO 0`: MSpin is connective
   (B5.4c), so G3.8's coreflection lifts G5.5's ABS orientation through
   ko→KO, uniquely up to homotopy, and the lift is a map of homotopy ring
   spectra. B3.4 and B6.6 consume this D.
   Construct `spinABSDiracIndexComparison` for every closed smooth Spin
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

   Construct `spinABSComplexificationGenus` for closed Spin4k-manifolds:
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

1. Prove the coefficient tables in degrees0–4, including the map and inverse
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
   **Oriented three-manifold parallelization.** Complete the tangent-bundle
   exercise on physical87 of Kirby's notes: every oriented smooth Hausdorff
   second-countable three-manifold, with boundary allowed and without a
   compactness or connectedness assumption, has a smooth orientation-preserving
   vector-bundle isomorphism `TM≃M×ℝ³`. Construct its actual three vector
   fields, their pointwise basis and smooth inverse; for a chosen Riemannian
   metric obtain an oriented orthonormal frame by smooth Gram–Schmidt.
   This is an honest rank-three trivialization.

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
   of a smooth triangulation of M (GT's smoothing item1 with Layer11),
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

2. Item2 has three parts with separate prerequisites. Part (a) is pure
   finite-F2 algebra. Part (b) uses only SpinGeometry G4's circle and surface
   Spin refinements and AlgebraicTopology's H1(Σ;F2) with mod2 Poincaré
   duality; it uses no B1/B2 quotient, B4, B5 or B6 input. Part (c) uses (a),
   (b), B1–B2 witnesses and GT Layer1 handle attachment. Each part is the
   single owner of its statements, and consumers of the geometric
   refinement or of the filling theorem cite (b) or (c).

   **(a) Finite Arf algebra.** First construct `finiteQuadraticArf` for a finite-dimensional F2 vector
   space with a quadratic refinement of a nonsingular alternating form.
   Consume Tau Ceti's implemented
   `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `even_finrank`
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
   the q-zero count `2^(2*m-1)+(-1)^Arf * 2^(m-1)` for m>=1, with count1
   when m=0. Prove that Arf zero is equivalent
   to a q-zero Lagrangian (including dimension zero). Export these constructors
   and comparison maps for geometric surface and Seifert-form consumers;
   this is the single generic F2 Arf owner.

   **(b) Geometric refinement.** Consume SpinGeometry's actual two circle
   lifts and all Spin structures on a closed surface Σ. Construct the
   induced quadratic form q on H1(Σ;F2) by restricting the Spin structure
   to embedded curves with their framing from Σ, with q=0 on a curve
   bounding an embedded disc and q=1 on the Lie-framed circle of the
   product torus. Prove the circle-framing rule, the polarization
   q(x+y)=q(x)+q(y)+x·y with the mod2 intersection pairing, nonsingularity
   of that pairing by mod2 Poincaré duality, naturality under Spin
   diffeomorphisms and boundary compatibility for collared surfaces.

   **(c) Filling theorem.** Use (a), (b) and surgery on q-zero curves to
   prove ΩSpin_2≃F2 by Arf(q): realize a q-zero Lagrangian by disjoint
   embedded curves, attach the corresponding two-handles to Σ×I and cap
   the resulting spheres; conversely, the kernel of H1(∂W;F2)→H1(W;F2) for a
   compact Spin three-manifold W is a q-zero Lagrangian, by relative
   duality and extension of the framing, so the boundary has Arf zero. The
   product Lie-spin torus has q(a)=q(b)=1, hence Arf1, and generates. This
   is the degree2 coefficient; a nonsingular algebraic quadratic form alone
   is not the geometric bordism theorem.
3. Prove ΩSpin_3=0 from item4's below8 ABS comparison, TopK's ko3=0
   and B5's geometric PT inverse, and cite the specified Lie-spin T3 filling from
   the independent Four construction E(1) minus a regular elliptic fibre.
   Consume Four's `ellipticEOneFiberComplement_boundarySpin_eq_lie`
   identification of the actual boundary Spin structure and F7.0b's
   complex-oriented signature −8; the filling and boundary identification
   belong to that construction. Distinguish its induced framing
   from the Lie framing: under framed PT the latter is η³=12ν≠0 in
   π3S=Z/24, although its Spin image is zero. A signature-zero Borromean
   trace does not identify the specified Lie Spin structure.
4. Prove that B3.0's D:MSpin→ko is an isomorphism on π_n for n<8 and
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
   comparison. Own the odd-primary KO comparison here: consume B4.8's
   MSpin_(p)≃MSO_(p) and the independent oriented coefficient ring
   from B6.1–2. First consume Four's early quartic K3 carrier,
   c1=0,c2=24,p1=−48,signature−16 and analytical complex index2.
   Use B3.0's `spinABSComplexificationGenus`: p1=−48 gives Â(K3)=2,
   hence c(α(K3))=2u². TopK's c(a)=2u² and injectivity of
   c:KO4→KU4 give α(K3)=a, before any low bordism classification.
   B3.0's `spinABSDiracIndexComparison` identifies this geometric genus
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
   For a closed Spin four-manifold M, B3.0's `spinABSDiracIndexComparison`
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
5. Construct explicit projective bounding manifolds for every positive n:
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

6. Construct the exceptional projective plane on the **same** compact real
   Albert algebra supplied by LieHighestWeight Layer8, with its Cayley–Dickson pair
   division carrier `TauCeti.DivisionOctonionReal`. Define `octonionicProjectivePlane` as the literal
   trace-one idempotent subtype `{A : compactAlbertAlgebra // A∘A=A ∧ tr A=1}`
   in its 27-coordinate Euclidean topology. Use the positive trace form to
   prove it is closed and bounded (tr A²=1), hence compact, Hausdorff and
   second countable. There is no module/associative projectivization over O.
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
   Construct the CW decomposition with one cell in dimensions0,8,16 on the
   same carrier. Its projective line is the trace-one idempotents in the lower
   Hermitian2×2 corner, with its two octonionic inverse charts and explicit
   homeomorphism to S8. Attach the top D16 by v=(sqrt(1−N(z)),z_1,z_2),
   z∈O², N(z)≤1, taking vv*; its S15 boundary is the specified octonionic
   Hopf map to that S8. Prove quotient/homeomorphism and cellular/cup
   comparisons, including Hopf invariant1. Obtain H*=Z[u]/(u³), |u|=8.
   Obtain connectedness and simple connectivity from these actual cells,
   before invoking transitivity or isotropy.
7. Construct `compactAlbertAutomorphismGroup` as the closed subgroup of the
   native real linear-equivalence/GL27 group preserving the Jordan product,
   unit and positive trace form. Give its matrix realization, smooth action
   and compactness inside O27. Consume native
   `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`
   (Geometry/Lie/Subgroup/Embedded.lean), choose and retain its actual data
   to define the subgroup atlas, and export the ambient-GL smooth-into
   equivalence for that chosen atlas; no second Cartan proof or opaque
   unrelated smooth structure is introduced. Compare its tangent data and
   native LieGroups Layer2 Lie-algebra identification with the Lie algebra of
   compact Albert derivations. Call this concrete group compactF4; its type-F4
   comparison is owned here: compose the Lie(Aut)≃Der(J) identification
   with LHW Layer8's `compactAlbertDerivation_complexification` and
   `compactAlbertDerivation_killing_negDef`. Prove the group connected
   and simply connected using the actual Spin9 principal fibration and
   item6's cell model. Export its real derivation Lie-algebra isomorphism,
   complexification to split typeF4 and negative-definite Killing form.
   Use LieGroups Layer4's full-faithful simply connected integration
   equivalence to prove uniqueness among connected simply connected
   real Lie groups with this actual real derivation Lie algebra. No
   undefined designated complex F4 group or its real-form classification
   is a prerequisite.
   This type comparison follows the intrinsic geometry; all quotient/idempotent constructions use the actual
   group and derivation algebra independently of that classification.
   Prove automorphism transitivity here, using the supplier's actual inner
   derivations and the Peirce tangent space: for x∈J_(1/2)(E),
   `4[L_x,L_E](E)=x`. Exponentiating these skew-adjoint derivations gives
   product-preserving trace isometries and a locally surjective orbit map.
   Prove every orbit open; item6's connected cell model then gives
   a single orbit. This uses intrinsic Jordan frames and
   no supplier assumption of automorphism transitivity.
   Construct the explicit native Spin9 inclusion through the Peirce
   decomposition at E_0:
   J≃R E_0 ⊕ (R⊕R9) ⊕ S9, S9≃O². The vector Clifford action on O²
   for (t,a)∈R⊕O is `(x,y)↦(tx+ay,star(a)x−ty)`; prove the positive
   Euclidean Clifford relation and adjointness. This roadmap owns this
   concrete real16-dimensional Cliff(9,0) module; no designated real Spin9
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
   SBC B1.4 principal quotient, not an abstract existence equivalence. Give
   smooth local sections, the tangent isotropy comparison, connectedness and
   simple connectivity, and all chart/homogeneous-carrier compatibility laws.
8. Prove w2=0 and the unique Spin lift on the preceding cell model; compute tangent characteristic
   classes without assuming the subsequent abstract F4 type calculation.
   The tangent isotropy bundle restricted to OP1=S8 is TS8 plus its
   normal real8-dimensional half-spin/Hopf bundle. Construct this normal
   bundle comparison from the Peirce charts and Spin9/Spin8 isotropy;
   compare its actual clutching with TopK T7's Cl(0,8) real Bott unit.
   Use the complexification `c(b)=u_KU^4` and CC's top Chern/Newton
   formula to obtain p2=±6 times the degree8 generator (and e_normal=±1),
   computing the signs through that explicit clutching comparison. Choose
   u by p2=6u. Since H4=H12=0, p1=p3=0. The cup/intersection
   computation gives signature1 in the u² orientation; consume Index I7's
   actual L-genus theorem, whose geometric proof does not use bordism
   coefficients, to solve p4=39u² from
   `(381p4−19p2²)/14175=signature`. This fixes the integral classes on
   the torsion-free chosen carrier without an unowned equal-rank Weyl
   invariant quotient theorem. Pin u by p2=6u and the orientation by
   ⟨u²,[OP2]⟩=1; compute Euler class3u², χ=3, signature1 and Â=0.
   The H4=0 calculation makes λ=p1/2 zero; with StringOrientation S1's early
   BString homotopy-fibre/lift contract construct its specified String lift,
   unique up to its H3 torsor, before any String/TMF coefficient calculation.
   Riem/Spin/String consumers use this fixed carrier; their metric/genus/transfer
   calculations do not define another OP2.
9. Prove the projective-plane structure table on these designated carriers:

   | Carrier | Orientation | Spin | String obstruction λ |
   | --- | --- | --- | --- |
   | RP2 | w1≠0 | absent | no oriented Spin lift |
   | CP2, complex orientation | oriented | w2 is nonzero mod2 hyperplane | no Spin lift |
   | HP2, standard quaternionic orientation | oriented | unique Spin lift | λ=u≠0, u=−c2(Cγ_H) |
   | OP2, orientation u² above | oriented | unique Spin lift | λ=0, unique String lift class |

   For every k≥1 prove `p(T HP^k)=(1+u)^(2k+2)(1+4u)^(−1)` in
   H*(HP^k;Z)=Z[u]/(u^(k+1)), using G's right-H tautological carrier, the
   quaternionic Euler sequence and exact complex/real sign adapters, so u is
   the negative of G's ordinary c2 coordinate. At k=1 this is p=1 for S4;
   at k=2 it is p1=2u,p2=7u², and signature1 by I7.2's L-genus
   (7p2−p1²)/45=(49−4)/45=1. PositiveScalarCurvature consumes this formula
   for its HP^k examples. Prove CP2 w2 and RP2 w1 by the single AT/CC
   projective carriers. This table separates the actual structure obstructions;
   a String/TMF kernel claim for Cayley-plane bundles remains the precisely
   qualified statement in the String/elliptic owner.

## B4. Ordinary operations, Thom–Wu and full unoriented coefficients

1. Construct the integral higher diagonals on AT's designated normalized
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
2. Construct the stable operations on HF2 through actual EM universal
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
3. Prove Sq(U_ξ)=w(ξ)U_ξ for the same CC ordinary real Thom class,
   including relative Thom quotients, stabilization, pullback and sums.
   Construct Wu classes on closed manifolds by the actual duality pairing
   and prove w(TM)=Sq(v). Give boundary/relative variants with their
   correct pairings. FourManifolds consumes this generic package for
   dimension4/SpinC/torsion consequences. Homeomorphic, indeed homotopy
   equivalent smooth closed manifolds have matching SW numbers through
   Wu/duality; item5 turns this into equality of unoriented bordism classes.
   This does not identify their stable tangent bundles.
4. Compute H*(MO;F2) and its A action from the Thom formula; prove the
   actual A-free basis and degree counts. Construct the underlying/additive
   equivalence MO≃∨_d Σ^d HF2 with the specified multiplicities. Justify
   HF2 detection: first compute π0MO=F2 and nullhomotope2 id_MO using
   its ring unit. The comparison cofiber has bounded-exponent homotopy,
   so a least nonzero group would be detected by stable integral Hurewicz
   and mod2 reduction. Prove wedge/product comparison using connectivity
   and finitely many basis degrees below any bound. Alternatively prove
   the full convergent Adams/2-completion route. No E∞ HF2-algebra
   splitting is inferred from this additive equivalence.
5. Define all SW numbers and the joint invariants
   ⟨w_I(TM) cup f* a,[M,∂M]⟩, with
   a∈H^(n−|I|)(X,A;F2). Prove their witness invariance and the converse
   detection theorem for ΩO_n(X,A), using B5 and the actual additive MO
   calculation. Arbitrary CW and arbitrary coefficient cardinality are
   included; characteristic numbers at a point do not detect all cycles
   over X. Give the ordinary closed-manifold Thom converse and its
   constructive nullbordism consequence.
6. Prove ΩO_*≃F2[x_d : d>0, d≠2^j−1] as a graded ring by its actual
   geometric multiplication. For even d take RP^d. For odd d with d+1=
   2^r(2s+1), r,s≥1, take the real(1,1) incidence hypersurface
   H(2^r,2^(r+1)s) in RP^m×RP^n, of dimension m+n−1=d.
   Treat the incidence equation as a section of the tensor of the two
   dual real tautological lines; in affine trivializations prove its derivative
   is surjective on its zero set and construct the regular-value submanifold
   of the exact Suggested projective subtype. Compare overlapping level
   charts, the normal line and the inclusion, using B1.6's transversality and AT's
   real projective atlas. Prove representative independence, smooth regularity and
   w(TH)=(1+x)^(m+1)(1+y)^(n+1)/(1+x+y).
   Compute its top Newton number as binom(m+n,m) mod2 and prove it
   equals1 by Lucas; m,n≥2 eliminates the exceptional pure-power terms.
   Both are even, so this odd generator is orientable; choose its orientation.
   The factors (1+x)^(m+1), (1+y)^(n+1) are CharacteristicClasses C7.3a's
   `w(T RP^m)`. Prove the even RP
   Newton value d+1=1 mod2, the indecomposable criterion, independence
   and spanning. Use monomial symmetric characteristic numbers for
   products: Newton-power products lose repeated factors in characteristic2.

7. Construct the ordinary odd-prime Steenrod package on the same AT carriers:
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
   the odd-prime EM/path-loop comparison, with item2's transgression,
   Kudo and Borel theorems proved at p for P^i and β. Use DGAInfinity Layer0's
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
8. Using item7's HF_p Adams tower, consume CharacteristicClasses C3.6's finite
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
   Compare BSpin→BSO at odd p through its actual B(C2) fibre/Serre
   sequence and Thom map, giving MSpin_(p)≃MSO_(p). These targets
   depend only on AT ordinary cochains/EM, G spectral/Thom foundations
   (MSO and MSpin are GeneralizedCohomology G5.4's Thom spectra), CC's early
   rings and item7; they use no Pontryagin–Thom construction, and no MU or
   formal-group universality is presumed.

## B5. Structured Pontryagin–Thom, finite and stable

1. Construct finite ξ_k-normal embedded cycles M^n⊂R^(n+k), with actual
   Gauss/classifier lift M→B_k and pullback isomorphism ν_M≃γ_k.
   The generic `BundleClassifierIsoData` record is supplemented here by
   GT Layer1's actual quotient normal bundle of the specified embedding, the map
   B_k→BO(k), its designated universal γ_k, and a specified homotopy
   between the projected lift and the embedding's Gauss map, transporting
   the bundle isomorphism along that homotopy.
   Construct neat collared embedded bordisms in R^(n+k)×I and their
   relative versions. Retain the actual embedding, Gauss lift, normal-bundle
   isomorphism and map to the parameter space as part of each finite cycle.
   Give compatible isotopy/structure-homotopy witnesses. Define the
   coefficient collapse as GeneralizedCohomology G5.2's unframed collapse
   S^(n+k)→Th ν_M of the embedding, followed by the Thom map of the
   bundle map ν_M→γ_k covering the lift M→B_k into the designated G/CC
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
2. For parameter space a point, construct the finite-codimension collapse
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

3. Construct item2's coefficient inverse for arbitrary CW B_k without
   assuming that it is smooth. Replace B_k→BO(k) by G2.10's `MappingPathSpace` endpoint
   Serre fibration,
   pull back over finite smooth Grassmannian carriers, approximate a map
   into the projected universal Thom space away from the basepoint, and
   apply B1.6's relative/parametric transversality there. Lift the homotopy to
   the ξ data and retain the resulting normal-bundle isomorphism. Prove
   the two inverse bordisms and independence of finite-stage approximation,
   lifts and perturbations. A fibrewise or set-level inverse is insufficient.
4. Stabilize the ξ_k carriers along the actual G5 diagram, transporting
   normal structures by its specified bundle maps. Only here compare with
   abstract stable ξ-cycles: retain the chosen stable tangent/normal datum,
   its bundle isomorphisms and homotopies, and require both embedded
   representatives to realize that same datum through the stated comparisons.
   For closed M consume G5.2's comparison of two embeddings after a common
   stabilization, an isotopy with its normal-bundle comparison, and
   construct here the transport of the ξ-lift along it. For the relative
   version, which G5.2 does not state, construct the comparison as follows.
   For embeddings e0,e1 of the same compact smooth M into a common R^N,
   use F_θ=(cosθ e0,sinθ e1) in R^(2N), 0≤θ≤π/2: at least one nonzero
   coordinate factor makes each F_θ an embedding. Apply the inverse block
   rotation R_(−θ) to obtain endpoints (e0,0) and (e1,0). If the original
   embeddings agree on the prescribed boundary collar, this rotated path
   fixes (e0,0) there. Reparametrize to be constant near the interval
   endpoints and construct its actual collared embedded trace. First put
   unequal ambient dimensions in a common block model; relative statements
   retain the specified common boundary embeddings and collar identifications.
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
   of items2–3 is its coefficient construction. For a closed embedded cycle
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
   Prove the coefficient transformation is an isomorphism: stabilize the
   actual finite inverse identities from items2–3, compare their colimit
   with π_nMξ in G's model, and compare the unit and suspension maps.
   The Thom cells have dimensions at least their bundle rank, so prove
   Mξ connective and the negative coefficient groups zero, matching the
   geometric zero extension. These statements require no coefficient
   ring calculation from B3, B4 or B6.

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
5. Define the stable framed PT map as the special case of item4 with B a
   point and ξ trivial, whose Thom spectrum is the sphere spectrum S; this
   item owns the resulting stable framed isomorphism Ω^fr_n≃π_n S, whose
   degree-zero value is the signed count. Compare
   the finite unstable framed embedded specialization of item2 with its
   stabilization. Compare the
   fundamental-class maps of B2 with the actual Thom-to-HA spectral maps.
   Pin the positive interval boundary [1]−[0] and G's increasing left
   suspension/collapse coordinates. Prove the comparison of the geometric
   boundary operator with the spectral connecting morphism on an interval
   and in all dimensions; no simultaneous sign renormalization is left free.
6. For a compact smooth target give the geometric umkehr/intersection and
   Atiyah-duality comparison using G5's finite duality. State the actual
   orientation/structure needed for each wrong-way map, its dimension
   shift, boundary/support conditions, projection formula and base-change
   hypotheses. Generic finite-spectrum duality remains G; ξ-transverse
   geometric representatives and their bordism witnesses are here.
7. Construct the connective bordism skeletal/Atiyah–Hirzebruch spectral
   sequence (AHSS) with actual geometric filtration, and compare it with
   the spectral one through item4's isomorphism. Give E2=H_p(X,A;Ω_q),
   naturality, coefficient monodromy where present, differentials and
   convergence; finite total degree gives finite filtration for connective
   coefficients. Do not infer collapse from an additive coefficient list.

## B6. Integral and rational orientation, coefficient and transfer calculations

1. Prove rational ΩSO_*≃Q[CP2,CP4,…], with generator degrees4j and
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
   CP^(2k) has s_k=2k+1. Prove the arithmetic gcd of binom(N,j),
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
2. Construct Wall cycles with an actual integral lift of w1, classified by
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
3. Prove orientation-map surjectivity ΩSO_n(X,A)→H_n(X,A;Z)
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
4. Construct the general associated-F-bundle bordism transfer for a compact
   smooth fibre, numerable G action and a chosen compatible vertical
   tangential structure. For each parameter pair it sends the class of
   a base cycle with map into BG×X to the actual total-space cycle over
   X; relative boundaries map into A. The total space needs a smooth
   principal bundle over the smooth source, so own the smoothing theorem
   for compact Lie G: for a compact smooth manifold M with corners and a
   continuous principal G-bundle P→M that is already smooth over a
   neighbourhood of a closed union of faces C, there is a smooth principal
   G-bundle structure on P agreeing with the given one near C, unique up to
   a smooth isomorphism that is the identity near C and isotopic to the
   identity through continuous bundle isomorphisms. Prove it from
   CharacteristicClasses C2.3's finite faithful unitary representation
   G⊂U(N) and smooth finite approximations E_m→B_m=V_N(C^m)/G: by
   compactness and Stiefel connectivity the classifying map factors up to
   homotopy rel C through B_m for large m; B1.6's relative Whitney
   approximation smooths it rel C; pull back E_m. Uniqueness applies the
   same construction to M×I rel M×{0,1}∪C×I, and homotopic smooth
   classifying maps give smoothly isomorphic pullbacks. Apply it to the
   structure groups SO3, PU3⋊C2 and PSp3 below, and to witnesses with
   their faces. Build its spectrum-level map from
   compatible fat-embedding spaces, normal bundles and Thom collapses.
   Prove connectivity bounds for those spaces, skeletal section extension,
   compatibility at all stabilizations and global parameter homotopy
   independence. Stagewise homotopies do not alone remove phantom or
   lim1 obstructions. Prove module/pullback/base-change/composition laws
   and the geometric-to-spectral transfer comparison.
5. Compute the positive-degree point orientation kernels as the actual
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
   central circle of scalars; composition gives (A,ε)(B,δ)=(A·ε(B),εδ)
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
   C2.3's smooth finite approximations, and build the associated CP2
   bundle by item4.
   Prove the requisite A-comodule split-surjections, convergent mod2
   Adams calculation with extensions, the free-part Newton gcd criterion,
   localized-to-integral comparison and transfer-domain structures. The
   kernels are additive images of bordism classes, not just ideals
   generated by the single point-fibre classes [RP2] or [CP2].
6. Construct PSp3=Sp3/{±1} and the universal HP2 homogeneous bundle
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
   comparison maps. Let F=hofib(D:MSpin→ko) and construct the lift
   `spinHpTwoTransferLift : Σ8 MSpin∧BG₊→F` from this nullhomotopy.

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
   Name these exports `projectiveSymplecticThreeCohomologyModTwo`,
   `projectiveSymplecticThreeSqOneTwo`,
   `spinHpTwoVerticalThomGysin` and `spinHpTwoTransferCohomology`.

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
   Export `spinKOPontryaginClass`, `spinKOPontryaginCoverLift` and
   `spinABPCharacteristicMap`, including their chosen homotopies.
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
   Prove `spinHpTwoTransferLift_cohomology_splitInjective` as an actual
   A-module split injection H*F→H*(Σ8 MSpin∧BG₊), and prove the
   source's mod2 Adams sequence collapses by these resolutions and the
   ABP comparisons. Construct a natural convergent map of Adams sequences,
   prove surjectivity on E∞ and filtration completeness/lifting, then
   pass from2-completion to2-local point homotopy using the degreewise
   finite-generation theorem. These are construction/proof prerequisites
   for `spinHpTwoTransfer_pointKernelAtTwo`, not consequences of the
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

## Implementation order and acceptance

B3.2(a), the finiteQuadraticArf primitive, is pure finite-F2 quadratic
algebra, with no B1/B5, surface, Four or GT prerequisites. B3.2(b), the
geometric quadratic refinement on Spin surfaces, needs only (a), SpinGeometry
G4 and AlgebraicTopology's H1 and mod2 duality. Both precede every geometric
Arf consumer, including Four's characteristic surfaces, GT's Seifert forms
and HomotopySpheres' framed surfaces; B3.2(c), the ΩSpin_2 filling theorem
and its converse, follows B1–B2 and is the one owner of that theorem.
B1's structures and witnesses precede B2.1–4's quotient and geometric
operations.
B4's cochain operations at2 and odd primes depend on AT and G's HA,
not bordism coefficients, and the Adams towers of B4.2 and B4.7 use no
Pontryagin–Thom construction. B4.8's odd MSO/Spin Adams computation, B6.1's
odd-primary Hurewicz/Newton lattice and B6.2's 2-primary Wall calculation
supply the integral oriented ring together, without a BFG/Quillen cycle;
B5 consumes G's already constructed bundle/Thom diagrams, GT Layer1 geometry
and B1.6.
Its finite inverse is the coefficient construction. B5.4a–b supply the
collapse-with-parameter and actual pair boundary map; B5.4c first proves the
homology-theory transformation and its continuity/product/forgetting laws,
then the coefficient comparison, and applies GeneralizedCohomology G3.3. This precedes every B3/B4/B6
use of the all-CW geometric-to-spectral isomorphism and B5.7's AHSS;
no coefficient-ring or transfer-kernel result proves this comparison.
B4's MO calculation and B5 PT prove the O column and the B6
orientation/Wall inputs; the B3 SO column then consumes the independent
B6.1–2 integral rank/torsion computation. B3's Wu/Spin surgery route gives
the actual low SO fillings. B3.6–8 first consume the early compact algebra suppliers and construct OP2
geometry/characteristic classes independently of bordism coefficients. The
early String homotopy-fibre contract follows Spin/CC, before String coefficient
calculations; its OP2 lift consumer does not return a coefficient dependency.
B3.4's H*ko/H*MSpin calculation, B4.2's mod2 Adams
convergence/completion comparison and B4.8's odd Spin-to-SO comparison
precede B3.4's own odd KO comparison (early K3 index and K3²) and low
ABS theorem; that theorem precedes B3.3's Spin3
vanishing. None of these earlier inputs uses B3's coefficient table.
B3.0's geometric α map, normalized real Dirac comparison and
complexification/Â pushforward theorem follow B5/G5's Thom/PT construction,
CC C6 and the local Index/Spin/PDO foundations. They precede B3.4's K3
coefficient argument and B6's transfer-kernel conclusions; their proof uses
neither of those coefficient results.
The low MSpin/ko comparison and specified K3
and elliptic-fibre examples supply B3's integral Spin conclusions. B6's
family transfer precedes its point kernel calculations. Four's early K3 and
E(1)-complement constructions do not use the later bordism classifications;
its Wu/Rokhlin consequences may consume this roadmap afterward.

Acceptance includes actual witness construction and quotient comparison.
Check both native empty-index orientation rays, signed +pt and −pt, the
outward-first boundary [1]−[0], SO/Spin degree-zero signed count with positive
unit, and its unoriented mod2 forgetting square using the same SG rank0 sign.
Check the labelled four-point finite collapse words, fixed-embedding tubular
choice invariance, and the stabilized block-isotopy/ξ-structure/suspension
comparison for compatible abstract stable data; arbitrary finite embedding
independence is not an acceptance target. Retain correct
empty/degree0/negative-degree behavior, all pair/triple boundary
maps, the finite-versus-stable PT distinction, naturality and products, every
specified circle/torus/projective filling, Arf and Spin signature/index signs,
full MO multiplication and characteristic-number converse, integral Wall
extensions and orientation image through degree6, and the exact transfer
structure groups with their global coherence and kernel proof prerequisites.
No coefficient list, successful signature elaboration or additive spectral
splitting alone completes these targets.

## References

- R. Thom, *Quelques propriétés globales des variétés différentiables*,
  Commentarii Math. Helv.28(1954),17–86,
  [primary paper](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Thom1954.pdf),
  especially geometric realization and its degree6/degree7 distinction.
- C. T. C. Wall, *Determination of the Cobordism Ring*, Annals of Math.
  72(1960),292–311, [primary paper](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/cobord.pdf).
- R. E. Stong, *Notes on Cobordism Theory*, Princeton University Press,1968;
  J. Milnor and J. Stasheff, *Characteristic Classes*, Princeton,1974,
  especially the Newton-number and Thom/Wall computations.
- H. Miller, *Notes on Cobordism*, MIT lecture notes, for the spectral MO
  computation and the distinction between additive splitting and ring proof.
- S. Führing, *Bordism and projective space bundles*, Münster J. Math.
  15(2022),355–388,
  [primary paper](https://www.uni-muenster.de/FB10/mjm/vol_15/mjm_vol_15_11.pdf).
- J. Rosenberg and S. Stolz, *A stable version of the Gromov–Lawson
  conjecture*, [author manuscript](https://math.umd.edu/~jmr/StableGLConj4.pdf),
  for the HP2 transfer, its2-local proof and separate odd-prime refinement.
- John Baez, [The Octonions](https://arxiv.org/abs/math/0105155),
  §§2.2,3.4,4.2, for the division algebra, Albert idempotent charts and F4/Spin9.
- Borel–Hirzebruch, [Characteristic Classes and Homogeneous Spaces I](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/162/1/19_Characteristic%20classes%20and%20homogeneous%20spaces%20I.pdf),
  §19, especially Theorem19.4, for the Cayley-plane isotropy/class calculation.

- M. Kreck and S. Stolz, *HP2-bundles and elliptic homology*,
  Acta Math.171(1993),231–261,
  [primary paper](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6490-11511_2006_Article_BF02392533.pdf),
  §4 for the concrete quaternionic bundles and Newton gcd, §6 for the
  homology-ko comparison and transfer splitting distinctions.
- J. F. Adams and M. F. Atiyah, *K-theory and the Hopf invariant*,
  Quart. J. Math.17(1966),31–38,
  [primary paper](https://www.maths.ed.ac.uk/~v1ranick/papers/adamatiy.pdf),
  §1 for the integral K0/Adams-operation dimension restriction.
- S. Stolz, *Simply connected manifolds of positive scalar curvature*,
  Annals of Math.136(1992),511–540,
  [publisher record](https://doi.org/10.2307/2946598), for the2-local
  HP2 transfer theorem and A(1) calculations.
