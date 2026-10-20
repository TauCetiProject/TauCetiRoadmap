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
proposal Mathlib PR31350. Its proposed proofs are not implemented prerequisites.
Add Hausdorffness. Second countability follows from compactness and the
Euclidean chart model by native `ChartedSpace.secondCountable_of_sigmaCompact`.
Use finite-dimensional real models, native model-with-corners manifolds,
`Diffeomorph` and native continuous/smooth vector-bundle objects, with
`ContMDiffVectorBundle` on smooth bases. A classifier into an arbitrary CW
B_k and its pulled-back bundle are continuous, as B5 requires.

| Supplier | Consumed interface | Boundary |
| --- | --- | --- |
| [GeometricTopology](../GeometricTopology/README.md) | collars, corner rounding, smooth embeddings, actual normal bundles, open-subset tubes and relative/parametric transversality | B1 assembles structured bordism witnesses and B5 their PT comparisons |
| [AlgebraicTopology](../AlgebraicTopology/README.md), Stages2–4,6,8 | arbitrary CW skeleta/cofibrations, ordinary chains/cochains/products, relative fundamental classes and duality, EM carriers and representability | B4 owns the integral higher diagonals and generic ordinary mod2 cup-i/Sq/Adem/Wu package; ordinary cohomology carriers remain AT |
| [GeneralizedCohomology](../GeneralizedCohomology/README.md), G1–G5 | actual spectral homology on pairs, stable category/HA, arbitrary-CW comparison, finite duality, compatible universal bundle diagrams, MO/MSO/MSpin and quaternionic smooth carriers | geometric cycles/PT, coefficient rings and transfer/kernel calculations are here |
| [TopologicalKTheory](../TopologicalKTheory/README.md), T1/T2.5/T3–5/T7; [CharacteristicClasses](../CharacteristicClasses/README.md), C1–C4/C6 | fixed-rank classifiers, chosen ordinary Thom quotient, w/c/p/Euler classes, character/Thom corrections and algebraic ABS conventions | B3.0 owns the Spin ABS genus comparison; B4 compares Sq with these same w classes; B6 supplies bordism calculations |
| [SpinGeometry](../SpinGeometry/README.md), G4/G5.0/G6.0/G6.7 ([specification](https://github.com/TauCetiProject/TauCetiRoadmap/pull/902)) | Spin lifts and H1 torsors, circle/surface refinements, real Clifford-graded spinor bundles, closed real Dirac realization and its KO-valued index, Lichnerowicz and untwisted four-dimensional quaternionic symmetry | B3.0 compares that analytic class with the geometric ABS/PT genus; B3 proves Spin bordism classifications |
| [HomotopySpheres, finite and stable Stage5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/6c0b09a600e12d442f71728d1c7292592d36cac2/TauCetiRoadmap/HomotopySpheres/README.md#stage-5-stable-framings-and-pontryagin--thom) and the finite-rank interface specified in B5.2 | convenient pointed spaces, stable framed PT and framing-change/product laws; the separate honest-rank construction below | B5 builds general normal structures and the structured finite/stable carrier comparisons; the single finite framed theorem remains with HomotopySpheres |
| [FourManifolds](../FourManifolds/README.md), early example constructions | F7.0 quarticKThree carrier/characteristic calculation and ellipticEOneFiberComplement, E(1) minus a regular elliptic fibre with its actual Lie-spin T3 boundary | these examples precede bordism consequences; later Four Wu/Rokhlin applications consume B3/B4 |
| [IntegralLattices](../IntegralLattices/README.md) | integral lattice and real intersection-form algebra | B3.2 constructs the finite-F2 Arf invariant used by surface and Seifert refinements |
| [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md), Layer8 compact algebra sublane ([specification](https://github.com/TauCetiProject/TauCetiRoadmap/pull/949)); [LieGroups](../RepresentationTheory/LieGroups/README.md), Layers2,4 | division octonions/formally real compact Albert algebra, generic closed subgroup smooth charts | B3 owns their idempotent/F4–Spin9 geometry, distinct from native split Zorn/Albert forms |
| [IndexTheory](../IndexTheory/README.md), I1/I2/I3/I5/I7; [PseudodifferentialOperators](../PseudodifferentialOperators/README.md); G5 graded operator comparison | compact elliptic/Dirac symbol-index and local regularity, Hilbert/Clifford configuration index | B3.0 owns the closed Spin ABS/real-Dirac comparison; B6 constructs the homogeneous HP2 associated-family comparison and global transfer nullhomotopy |

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

## B1. Cycles, structures and collared witnesses

1. Construct the model-transport adapter along the ordered continuous linear
   equivalence E_p×E_q≃L[ℝ]E_(p+q), for E_n=EuclideanSpace ℝ (Fin n).
   Transport charts and IsManifold/BoundarylessManifold, prove identity,
   composition, associativity and block-permutation laws, and compare tangent,
   orientation and Spin bundles under the same adapter. Closed sources use
   the boundaryless E_n model; n-dimensional relative sources use the native
   Euclidean half-space model of dimension n (n>0), and bordism witnesses
   use `modelWithCornersEuclideanHalfSpace (n+1)`. Face-indexed corner
   models come from DifferentialGeometry 5.5 and GT Layer1 rounding.
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
   cycle and witness records. For n>0 prove equivalence with refinements of
   native `TauCeti.orientationPreservingGroupoid` and with the chosen
   oriented orthonormal frame/SO reductions; the comparisons retain the
   actual orientation, rather than only existence of a reduction.
   Construct reversal by the negative ray, derivative pullback, the ordered
   product and outward-first boundary rule on this datum, and prove that
   the atlas, frame, local-homology and determinant descriptions agree.
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
   signs after Spin forgetting. Use signed-point cancellation by intervals
   to construct the degree-zero SO/Spin coefficient maps and inverses to Z;
   +pt is the unit and forgetting to O sends signed count to its mod2 class.
   Prove these comparisons before consuming the low coefficient table.
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
   mapping tori from GT Layer1 collared gluing, with explicit monodromy and
   boundary identifications; unit disk/sphere bundles as smooth manifolds with
   boundary using their fibre half-space charts, radial collars and native
   vector-bundle transition maps. Compare all these chosen carriers with the
   literal quotient/total-space sets and their topology. Consume item1 of GT's
   [smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison),
   with its relative boundary triangulations, and Layer11 CW transport to obtain native
   finite CW pairs for compact sources/witnesses; this precedes B2 weak-pair
   invariance and B5 lifting, independently of the bordism coefficients.

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
   and ΩO_n(X,A)→H_n(X,A;F2) by f_*[M,∂M]. Prove witness invariance,
   naturality, products, exact sequences and equality with G5's spectral
   Thom-orientation maps after B5. Spin maps factor through SO. On oriented
   smooth targets construct transverse intersection with dimension shift
   p+q−dim X and prove its comparison with ordinary cup/intersection under
   Poincaré–Lefschetz duality, with all compact-support/relative hypotheses.
5. Construct the connective bordism skeletal/AHSS with actual geometric
   filtration and B5's spectral comparison. Give E2=H_p(X,A;Ω_q),
   naturality, coefficient monodromy where present, differentials and
   convergence; finite total degree gives finite filtration for connective
   coefficients. Do not infer collapse from an additive coefficient list.

## B3. Low groups and specified geometric examples

0. **Geometric ABS genus and Dirac comparison.** Before any coefficient
   classification construct α_n(X,A):ΩSpin_n(X,A)→KO_n(X,A) from B5's
   structured Pontryagin–Thom comparison and G5.5's actual multiplicative
   ABS orientation MSpin→KO. Prove naturality, witness invariance,
   relative exact-sequence and product compatibility; write α(M)∈KO_n
   for its point specialization.
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
   is Spin; every surface admits an Arf-zero refinement and B3.2's
   surgery gives its filling, while B3.3's Spin3 theorem gives the
   dimension3 filling. For ΩSO4 use B6.1's rank/generator computation
   and B6.2's integral Wall presentation, whose degree4 torsion branch
   is zero and whose h4 has Pontryagin Newton number±3. Compare CP2
   by its signature1 to obtain the integral generator and inverse.
   Neither B6 input uses this low-group table. Rational Hurewicz alone
   cannot establish the absence of2-torsion or an integral index.
2. First construct `finiteQuadraticArf` for a finite-dimensional F2 vector
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
   Consume SpinGeometry's actual two circle lifts and all Spin structures
   on a surface. Construct the induced quadratic form q on H1(Σ;F2),
   its circle-framing rule, polarization and boundary compatibility. Use `finiteQuadraticArf` and surgery on q-zero curves to
   prove ΩSpin_2≃F2, including its converse and the selected product
   Lie-spin torus generator. This is the degree2 coefficient; a nonsingular
   algebraic quadratic form alone is not the geometric bordism theorem.
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
4. Construct the low-connectivity ABS comparison MSpin→ko from its actual
   Thom/cohomology and Steenrod calculation, with isomorphisms below8
   and surjection at8. Consume B6.6's earlier H*ko=A//A(1) and the
   bottom-ABS/cohomology/degree-count part of its ABP construction,
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
   For a closed Spin four-manifold M write α(M)=k·a using KO4=Z·a.
   Use B6.1–2's independent oriented degree-four coefficient calculation:
   CP2 generates ΩSO_4, its Pontryagin number is3 and its signature is1.
   Bordism invariance therefore gives ⟨p1(TM),[M]⟩=3σ(M).
   Since Â₄=−p1/24, B3.0's complexification genus and c(a)=2u² give
   `2k=⟨Â(TM),[M]⟩=−σ(M)/8` in Q. Hence σ(M)=−16k in Z,
   proving divisibility by16 and pinning α(M)=−(σ(M)/16)a.
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
   Albert algebra supplied by LieHighestWeight Layer8, with its PR41919-shaped
   division carrier `TauCeti.DivisionOctonionReal`. Define `octonionicProjectivePlane` as the literal
   trace-one idempotent subtype `{A : compactAlbertAlgebra // A∘A=A ∧ tr A=1}`
   in its 27-coordinate Euclidean topology. Use the positive trace form to
   prove it is closed and bounded (tr A²=1), hence compact, Hausdorff and
   second countable. There is no module/associative projectivization over O.
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
   `(1,0),(i,0),(j,0),(k,0),(0,1),(0,i),(0,j),(0,k)` in the PR41919
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
   The H4=0 calculation makes λ=p1/2 zero; with StringOrientation's early
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

   Prove HP2's p1=2u,p2=7u² and signature1, using G's right-H tautological
   carrier and exact complex/real sign adapters, so u is the negative of G's
   ordinary c2 coordinate. Prove CP2 w2 and RP2 w1 by the single AT/CC
   projective carriers. This table separates the actual structure obstructions;
   a String/TMF kernel claim for Cayley-plane bundles remains the precisely
   qualified statement in the String/elliptic owner.

10. On the designated native smooth unit sphere S^m construct
   `sphereTangentStableTrivialization`: `(v,a)↦v+a x` identifies
   T_xS^m⊕R with R^(m+1), with inverse orthogonal projection to x⊥
   and radial coefficient. Retain the native tangent/ambient-subspace
   comparison. CC's Euler class gives e(TS2)=2 times its oriented
   generator, so TS2 is nontrivial despite this stable trivialization.
   For m=1,3,7 construct `divisionSphereTangentFraming` from the
   ordered imaginary bases of C,H and LHW's
   `TauCeti.DivisionOctonionReal`: at unit x the vectors e_i x are
   a smooth orthonormal tangent frame by norm polarization. Give the
   inverse coordinate maps and actual tangent-bundle isomorphism.
   S0 has its separate rank0 trivialization. For any positive m,
   orthonormalize a supplied tangent frame and normalize at e0 to
   construct A:S^m→SO(m+1), with first column x and A(e0)=id.
   The multiplication μ(x,y)=A(x)y has both strict unit laws. Construct
   its actual join Hopf map S^m*S^m→ΣS^m and sphere adapters, and
   prove odd Hopf invariant by its integral mapping-cone cup pairing.
   No associativity or Lie group on S7 is asserted. B4's Sq/Adem test
   first forces m+1 a power of2. The final theorem of this item follows
   B4.9's full dimension restriction: prove `sphere_parallelizable_iff`: for m>0 exactly m=1,3,7. The explicit
   division-algebra frames supply the converse independently of that
   restriction.
11. On the same G4.0b/AT real projective carrier construct
   `T RP^m≃Hom(γ,γ⊥)` and `T RP^m⊕1≃(m+1)γ*≃(m+1)γ`.
   Prove w(T RP^m)=(1+x)^(m+1), x=w1γ the AT ring generator.
   For any native smooth immersion M→R^N construct its derivative-image
   subbundle and metric orthogonal complement ν over M, with
   TM⊕ν≃ε^N and rankν=N−dim M. This does not require an embedding
   or a tube around the immersed image. For m=2^k,k≥1 and N=2m−2,
   prove in F2[x]/(x^(m+1)) that
   `w(ν)=(1+x)^(-(m+1))=1+x+…+x^(m−1)`.
   Thus nonzero w_(m−1)(ν) contradicts rankν=m−2. Include m=2's
   codimension0 case; for k=0 the derivative-rank obstruction excludes
   RP1→R0. Export `realProjectivePowerTwo_notImmersed` with the
   actual smooth-map/immersion predicate and all dimension hypotheses.

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
   and graded algebra. GT's TOP-bundle Thom/w comparison consumes only
   these foundational operation items; smooth Wu/Thom-number consequences
   here do not consume GT's later TOP tangent-microbundle comparison.
2. Construct the stable operations on HF2 through actual EM universal
   classes, loop comparison and G's HA model. Prove the Steenrod algebra
   has its admissible basis and the dual Hopf polynomial generators ξ_i
   of degree2^i−1, with coproduct and conjugation. Prove Serre's actual
   H*(K(F2,n)) computation from the path-loop SS and operations, then
   stabilize with the justified G3 Milnor/eventual-degree comparison to
   H*(HF2)=A. Formal Adem relations do not alone compute this operation
   algebra. Supply the module/comodule and graded tensor conventions.
   Construct the mod2 Adams tower from the actual HF2 unit/smash fibres,
   its exact couple and Ext_A bar-resolution E2 page. Reuse native
   CategoryTheory.SpectralSequence and SpectralObject page/homology
   objects; Adams dr has bidegree (r,r−1) on (s,t), lowering t−s
   by1. Construct the ModuleCat F2 page adapter from the integral
   homotopy exact couple; do not create a second page carrier. Prove convergence
   to2-completion for the bounded-below finite-type spectra used below,
   control the tower lim1 and multiplicative/naturality comparisons.
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
   Wu/duality, hence unoriented bordism; this does not identify their
   stable tangent bundles.
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
   charts, the normal line and the inclusion, using GT transversality and AT's
   real projective atlas. Prove representative independence, smooth regularity and
   w(TH)=(1+x)^(m+1)(1+y)^(n+1)/(1+x+y).
   Compute its top Newton number as binom(m+n,m) mod2 and prove it
   equals1 by Lucas; m,n≥2 eliminates the exceptional pure-power terms.
   Both are even, so this odd generator is orientable; choose its orientation. Prove the even RP
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
   the odd-prime EM/path-loop comparison. Use DGAInfinity Layer0's
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
8. Extend the actual HF_p Adams tower, native spectral-sequence page carrier,
   exact couple/bar Ext, multiplicative comparisons and convergence from
   item2 to every odd prime. Consume CharacteristicClasses C3.6's finite
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
   depend only on AT ordinary cochains/EM, G spectral/Thom foundations,
   CC's early rings and B5; no MU or formal-group universality is presumed.

9. Prove `hopfInvariant_odd_dimension` for a based map
   f:S^(2d−1)→S^d,d≥2, with its actual finite CW mapping cone and
   integral cup-defined Hopf invariant: odd invariant forces d=2,4,8.
   Integral graded commutativity excludes odd d. For d=2n construct
   reduced K0 cone generators x,y using TopK's exact sequence and
   positive ordered Bott classes β_n,β_(2n); prove this group free of
   rank2 and y the top-cell class. CC's finite-CW rational character,
   its Bott normalization and torsion-freeness give x²=H(f)y.
   Consume TopK T2.5's actual integral K0 `adamsOperation`,
   `adamsOperation_frobeniusModPrime` and `adamsOperation_bottSphere`.
   Write ψ2(x)=2^n x+μ2 y, ψ3(x)=3^n x+μ3 y, and
   ψk(y)=k^(2n)y. Frobenius makes μ2 odd when H is odd; commutation
   gives `3^n(3^n−1)μ2=2^n(2^n−1)μ3`. Prove the integer
   valuation lemma v2(3^n−1)=1 for odd n, and =2+v2(n) for even n.
   Hence n≤v2(3^n−1) forces n=1,2,4. Consume B3.10's single
   sphere-frame/H-space join-Hopf construction and odd-invariant
   comparison; its division-algebra examples supply existence. This uses these operations on the
   finite mapping-cone K ring; it does not presume an integral periodic
   KU spectrum operation or a MU/Quillen coefficient theorem.

## B5. Structured Pontryagin–Thom, finite and stable

1. Construct finite ξ_k-normal embedded cycles M^n⊂R^(n+k), with actual
   Gauss/classifier lift M→B_k and pullback isomorphism ν_M≃γ_k.
   The generic `BundleClassifierIsoData` record is supplemented here by
   GT's actual quotient normal bundle of the specified embedding, the map
   B_k→BO(k), its designated universal γ_k, and a specified homotopy
   between the projected lift and the embedding's Gauss map, transporting
   the bundle isomorphism along that homotopy.
   Construct neat collared embedded bordisms in R^(n+k)×I and their
   relative versions. Retain the actual embedding, Gauss lift, normal-bundle
   isomorphism and map to the parameter space as part of each finite cycle.
   Give compatible isotopy/structure-homotopy witnesses and the collapse
   map to the designated G/CC Thom quotient. For a fixed embedded smooth
   normal-structured cycle prove independence of tubular/radius choices
   and of auxiliary approximation or corner-rounding choices through the
   specified compatible relative isotopies or embedded ξ-bordisms. Prove
   invariance under those witnesses, preserving the actual boundary/collar
   and normal-structure data. This does not identify arbitrary embeddings
   of an abstract cycle, nor distinct smooth structures, at fixed codimension.
   The generic tube is an open-subset diffeomorphism, including empty
   embeddings; whole-total-space PartialDiffeomorph corollaries retain
   their nonempty-source hypothesis.
2. Prove the finite-codimension bijection with based homotopy classes
   [S^(n+k),Th(ξ_k)] under the actual compact/CW/cofibration hypotheses,
   and compare Euclidean and sphere embeddings with the marked-point
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
   Require HomotopySpheres to construct its separate finite-rank interface
   before this specialization: for r≥1 and d≥0, compact closed smooth
   d-submanifolds of a marked S^(d+r), missing infinity and equipped with
   ordered normal rank-r frames, modulo actual collared rank-r embedded
   bordisms missing the marked axis, correspond to based sphere-map classes.
   The interface includes tube/regular-value choices, both inverse witnesses,
   naturality, pinch addition and the domain-reflection inverse, with frames
   transported by its derivative. It has no stable Bott, stable J or
   Freudenthal premise; r=0 remains a separate finite based-set carrier.
   This is the single HS finite framed construction consumed here, not a
   conclusion supplied by its stable PT theorem or a second TB engine.

   In the specialization ξ_r equal to the trivial rank-r bundle over a
   point, consume HS Stage5.0's single honest-rank unstable framed
   Pontryagin–Thom theorem. Construct the actual carrier dictionary:
   a classifier lift to a point and the chosen pullback isomorphism
   ν_M≃R^r are exactly an ordered normal frame; compare this dictionary
   on neat embedded bordisms, isotopies and structure homotopies, with
   the punctured marked sphere/Euclidean ambient conventions fixed.
   For r≥1 and d≥0 transport HS Stage5.0's bijection to
   π_(d+r)(S^r), including the empty cycle, both inverse witnesses,
   pinch/compression addition and its actual low-degree group laws.
   Compare the unmarked and marked presentations by the actual
   free/based homotopy action: the target is simply connected for r≥2,
   while π1(S^1) acts trivially when r=1. Transport the regular-value
   differential framing, radial degree-one collapse, relative smoothing
   and collared homotopies through these carrier isomorphisms; no claim
   that an arbitrary trace already misses the chosen axis is used.
   Keep r=0's finite carrier and component conventions separate.
   This specialization does not re-own the generic framed-sphere
   theorem: HS Stage5.0 owns its finite-rank construction, DGFloer1.5
   consumes it for general closed-ambient collapse, and this B5 owns
   the ξ-structured carrier comparison and its general finite/stable
   extension. Compare finite suspension with the stable PT map only
   after the finite comparison, using the fixed sphere/disk, normal/
   tangent, ordered target-frame and boundary conventions.

3. Construct the inverse for arbitrary CW B_k without assuming that it is
   smooth. Replace B_k→BO(k) by G2.10's `MappingPathSpace` endpoint
   Serre fibration,
   pull back over finite smooth Grassmannian carriers, approximate a map
   into the projected universal Thom space away from the basepoint, and
   apply relative/parametric transversality there. Lift the homotopy to
   the ξ data and retain the resulting normal-bundle isomorphism. Prove
   the two inverse bordisms and independence of finite-stage approximation,
   lifts and perturbations. A fibrewise or set-level inverse is insufficient.
4. Stabilize the ξ_k carriers along the actual G5 diagram, transporting
   normal structures by its specified bundle maps. Only here compare with
   abstract stable ξ-cycles: retain the chosen stable tangent/normal datum,
   its bundle isomorphisms and homotopies, and require both embedded
   representatives to realize that same datum through the stated comparisons.
   Construct the embedding comparison after a common finite stabilization.
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
   classifier/block-permutation laws in the same stabilized diagram. Obtain
   natural group isomorphisms
   Ω^ξ_n(X,A)≃π_n(Mξ smash Σ∞(X/A)) on CW pairs, with X/∅=X₊,
   and with the stated
   homotopy-cofiber replacement for arbitrary pairs. Include all small cell
   sets, integer degrees for the connective extension, products, units,
   boundary/MV maps and structure forgetting. Construct the tangent–normal
   comparison M(−θ) with O/SO/Spin spectra explicitly.
5. Compare the stable framed special case with HomotopySpheres' stable PT
   and augmentation, and compare the finite unstable framed embedded
   specialization of item2 with that stabilization. Compare the
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
   independence/spanning locally, and
   combine these odd-local calculations with item2's actual 2-primary Wall
   lattice to obtain the integral free quotient Z[h_(4k)]. Establish absence
   of odd torsion directly from B4.8, before the Wall/transfer conclusions;
   neither MU torsion-freeness nor Quillen universality is imported. At a fixed finite
   oriented Grassmannian retain possible Euler classes: varying only the
   complement rank of oriented2-planes does not give the stable BSO
   partition count. Prove the signature genus additive, multiplicative and
   bordism invariant, compare it with ⟨L(TM),[M]⟩ in IndexTheory's
   normalization, and compute CP2 signature1 and the rational degree8
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
   using B4/B5 for mod2 and the actual connective bordism AHSS for Z.
   For the integral range use the actual connective AHSS and rational
   surjectivity: the first possible differential from H_n(−;Z) is d5 to
   H_(n−5)(−;ΩSO_4=Z), hence has torsion image. In degree5 its H0
   target is torsion free. In degree6 reduce to finite support on X/A,
   detect any possible finite torsion H1 class by a componentwise map to
   B(Z/m), m≥2, and prove H6(B(Z/m);Z)=0 by the periodic cyclic
   resolution for every m. Naturality kills d5, with no mod3 operation
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
   X; relative boundaries map into A. Build its spectrum-level map from
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
   Factor the actual ABS orientation through connective ko using the
   connective Thom cells and G's mapping/vanishing comparisons.
   Construct a spectrum-level nullhomotopy of D∘T in the same coherent
   operator/Thom model. First construct the single PSp3-equivariant real
   Cl(0,8)-linear Dirac operator on HP2 with its invariant metric and the Spin
   lift above. Its Lichnerowicz gap gives an equivariant invertible bounded
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

   Construct the Anderson–Brown–Peterson input here from B4's operations,
   CC's universal Spin classes and G's ko. Compute H*(BSpin;F2)
   and H*(MSpin;F2) on these same stable classifiers through the actual
   Bμ2→BSpin→BSO Serre sequence, Steenrod-compatible transgressions,
   Thom comparison and degreewise Milnor maps; resolve products and
   extensions. This full A-module calculation is owned here, not
   presumed from an unwritten CC Spin-ring theorem. Prove
   H*ko=A//A(1), A(1)=⟨Sq1,Sq2⟩, using G's actual connective model,
   its ordinary-cohomology/covers comparison and the operation action. Index the KO-Pontryagin characteristic maps by
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

B3.2's finiteQuadraticArf primitive is pure finite-F2 quadratic algebra,
with no B1/B5, surface, Four or GT prerequisites. It precedes every geometric
Arf consumer, including Four's characteristic surfaces and GT's Seifert forms.
B1's structures and witnesses precede B2.1–4's quotient and geometric
operations; B2.5's spectral AHSS comparison follows B5.
B4's cochain operations at2 and odd primes depend on AT and G's HA,
not bordism coefficients. B4.8's odd MSO/Spin Adams computation, B6.1's
odd-primary Hurewicz/Newton lattice and B6.2's 2-primary Wall calculation
supply the integral oriented ring together, without a BFG/Quillen cycle;
B5 consumes G's already constructed bundle/Thom diagrams and GT geometry.
B4's MO calculation and B5 PT prove the O column and the B6
orientation/Wall inputs; the B3 SO column then consumes the independent
B6.1–2 integral rank/torsion computation. B3's Wu/Spin surgery route gives
the actual low SO fillings. B3.6–8 first consume the early compact algebra suppliers and construct OP2
geometry/characteristic classes independently of bordism coefficients. The
early String homotopy-fibre contract follows Spin/CC, before String coefficient
calculations; its OP2 lift consumer does not return a coefficient dependency.
B3.10's stable tangent and division frames and its single join-Hopf
comparison precede B4.9's K-theoretic dimension restriction; its final
sphere parallelizability theorem follows that restriction. B3.11's
projective immersion obstruction uses only the ordinary tangent/SW lane.
The H*ko/bottom-ABP/cohomology part of B6.6, B4.2's mod2 Adams
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
