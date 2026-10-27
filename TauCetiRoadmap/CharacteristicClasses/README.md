# Characteristic classes and Chern–Weil theory

Build integral Chern, Pontryagin and Euler classes, mod2 Stiefel–Whitney classes,
cohomological Thom and Gysin maps, universal cohomology calculations, and the
comparison with curvature. Construct the compact connected Lie-group CE/de Rham,
primitive/exterior and universal-transgression comparisons on these same
cohomology and universal-bundle carriers. Construct the rational Chern character and the
Todd, L and Â multiplicative classes, including their relative and supported
interfaces. Classes carry their coefficient ring, degree, orientation and
bundle; formal roots are a proved splitting device.

## Carriers, scope and suppliers

Use Mathlib `FiberBundle`, `VectorBundle`, `VectorBundleCore`, `Bundle.TotalSpace`,
pullbacks, Hom/dual constructions and `ContMDiffVectorBundle`. The continuous
finite-rank category, locally constant ranks, finite embeddings, metrics,
Grassmannians, Stiefel spaces and numerable BO/BU classification are
[TopologicalKTheory T1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7575afad9ceed0ff19ecf5629ba196e54fdf7637/TauCetiRoadmap/TopologicalKTheory/README.md)
dependencies. Its T6.4 supplies continuous principal/associated bundles and
descent. Use TopK T1.5's actual finite real Grassmannians and tautological bundles.
C1.0 and C1.1a construct their positive-rank oriented double covers, lifted
finite cells and coordinate maps. TopK T1.6a owns the fixed-rank and stable
colimits, universal-bundle diagrams and classifier comparison on those
carriers. [HomotopySpheres §3A and §4A](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1287)
supplies the earlier compactly generated substrate and consumes these
classifiers for its later stable O/SO and ΩBSO comparison; §4A is not an
input to the finite oriented-cover construction. Write BO(n) and BU(n)
for T1.6's fixed-rank universal Grassmannians, and BSO(n) for the
ambient-dimension colimit in `CompactlyGenerated` of C1.1a's actual finite
oriented carriers. C1.1b compares these carriers and their universal bundles
with the SO join classifier. Stable classification is consumed only for
finite CW bases.
The oriented frame/classifier statements use n≥1. In rank0 retain the
orientation sign separately as a section of the trivial two-point cover;
BSO(0)=pt represents the canonically oriented zero bundle. Write
B_join(G) for the principal universal join model; BG means B_join(G) except
for the named classical Grassmannian carriers. The O/U/SO comparisons identify
its associated universal bundles with these named carriers; ring calculations
are transported through those maps, and no second Grassmannian carrier is defined.

The principal-group scope is compact Lie G, including finite discrete groups.
Numerable principal bundles are classified over paracompact Hausdorff bases.
Characteristic classes in singular cohomology are natural for their continuous
pullbacks. Classification of lines by singular H² assumes CW type; on a general
paracompact base distinguish Čech H² from singular H². Variable ranks are handled
on clopen strata, with the singular cohomology product comparison for disjoint
unions. Smooth statements use finite-dimensional Hausdorff second-countable
Mathlib manifolds; the de Rham comparison uses its precise σ-compact hypotheses.

- [AlgebraicTopology Stages2–6,8.1–8.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0e8b058a97cc4f9401d2679313e0e937761c1024/TauCetiRoadmap/AlgebraicTopology/README.md) owns singular
  chains/cochains, local systems, cup/cap/cross products and pair
  sequences, excision, cellular comparison, Künneth and homotopy
  comparison. Consume actual Tau Ceti `TopCat.singularCohomology`,
  `singularCohomologyMap`, `singularCup`, `TopPair.singularCohomology`,
  `singularCohomologyδ` and the relative exactness/naturality lemmas. The
  cup module already proves associativity and units; its full graded
  and relative packaging is that supplier's target.
  C2's primary Euler obstruction additionally consumes AT8.9; ordinary line
  classification in C1.6 consumes AT8.10 and AT8.12 after C1.5's independent
  carrier/cellular calculations. C1.5's comparison portion and C2 consume
  no AT8.12; the later C1.6 classification has no arrow back to AT8.12.
  For the support lane, C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2
  only. The separate AT supported-cellular supplement consumes C1.2a S0–S4;
  its pair LES has a separate compatibility check against S5, while proper AT8.5
  consumes the needed support interfaces. This is not a whole-Stage6 dependency
  or a feedback edge into C1.2a.
- [DGFloer Layer1 item2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/89625499d1d7cf3880f125d675164e30990f72ba/TauCetiRoadmap/DGFloer/README.md) consumes native
  `TauCeti.TopCat.serreFibrations`,
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` for locally
  trivial TopCat morphisms, and `TauCeti.TopCat.mem_serreFibrations_proj`
  for native `FiberBundle` projections. Consume these native declarations from
  [Tau Ceti's Serre-fibration API](https://github.com/TauCetiProject/TauCeti/blob/720bf8c135bd2c354a15d55a73f2fc2c3d7aa358/TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean).
  These are source interfaces at720bf8c, absent from this repository's a91
  pin; their generic LES and spectral-sequence developments remain targets.
  The local-trivialization theorem uses one
  common typical fibre F for every chart of that morphism; variable-rank
  bundles are treated on their rank strata. The public DGF Layer1.2 text at
  PR963 states CW approximation and weak-equivalence invariance for singular
  homology with local coefficients. The named `connectedMapHomologyComparison`
  used below is a separate DGF roadmap target to construct with those exact
  inputs; it is not claimed to be an API in that public text or in the
  installed a91 pin. DGFloer owns the actual homotopy exact sequence and
  ordinary Serre spectral sequence as roadmap targets. C1.1 specializes the
  required sequence to its numerable bundles; C1.2 consumes the separately
  named coefficient-chain/Hom comparison target. Construct these generic
  targets before their C1 applications. Construct the multiplicative cohomological
  Serre comparison before its application in C5a.5 and its later use in C5a.6.
  The actual Milnor counit theorem
  remains C1.2, distinct from the abstract CW-approximation existence theorem.
- [DifferentialGeometry Layers1–2,5–10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/43f7d956d73eee21a2d99457f62e29981359b82e/TauCetiRoadmap/DifferentialGeometry/README.md) owns
  forms, wedge, d, orientations, integration/Stokes, compact supports and the
  multiplicative singular/de Rham comparison. C2 builds cohomological Thom,
  fibre integration and their comparison on those objects, including the
  compact-support singular/de Rham comparison.
- [SmoothBundlesConnections B1–B4,B6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e3abb0d30aff607a392b1d2d8a3f7c9daccbbb33/TauCetiRoadmap/SmoothBundlesConnections/README.md)
  owns principal/associated smooth bundles, connections, curvature, Bianchi,
  local transition conventions and the normalized integral circle class.
  [ComplexKahlerGeometry K4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k4-holomorphic-and-hermitian-bundles)
  supplies Hermitian holomorphic bundles and Chern connections;
  [K7.1/K7.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples)
  supplies the single projective carrier/atlas, tautological and dual lines,
  normalized Fubini–Study form and O(1) curvature −2πiω_FS. C1.5 consumes
  K7.1 and only K7.2's CW/cellular/cup subitems, with positive hyperplane
  generator and inclusion compatibility, before the universal-class
  comparison. The line-curvature/smooth comparison uses K4 and K7.2's
  independent form and SBC B6 circle-class comparisons.
- [GeometricTopology Layers1,3,10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0e8b058a97cc4f9401d2679313e0e937761c1024/TauCetiRoadmap/GeometricTopology/README.md) owns
  embeddings/tubular maps, the smooth mapping topology and the oriented-plane
  Euler target. These are roadmap contracts in the linked current-main text,
  not claims that a built supplier API already exists.
  C2 constructs general Euler/Thom and compares its rank2 restriction with
  that standalone plane construction.
- [LieGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0942b6c99c9c9baff3c962bc672bcaab81baff48/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md) owns Lie groups,
  closed subgroups, adjoint action, tori, Weyl groups and root planes;
  [CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/25f5db0a4ece65ab7f56a303e887ac90676c511f/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md) owns Haar
  averaging and Peter–Weyl. C1 builds finite faithful representations as the
  universal-approximation connector. C5 builds invariant-polynomial restriction;
  it uses [LieHighestWeight L1,L7 and L9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e2bb7060603f59e7b353b224589766a18e9e396e/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations)
  for Cartan/root decomposition, generic Lie-algebra Chevalley restriction
  with its homogeneous compatibility, and the reductive decomposition.
- [LieGroupoidsPoisson G1.3a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4391caecad1cd4979caa27e490e2bbfd69598d81/TauCetiRoadmap/LieGroupoidsPoisson/README.md)
  owns the all-degree real Lie-algebra CE complex, its coefficient modules
  and low-degree native comparison. C5a constructs the compact-group
  invariant-form and Haar homotopies on that complex.
  [ReflectionInvariantTheory §§1–3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ba65e6647efb7064b63960dac02437b095fb9989/TauCetiRoadmap/ReflectionInvariantTheory/README.md)
  owns the early fixed-polynomial algebra, homogeneous basic-invariant
  evaluation, regular sequence, coinvariant and character-lattice scalar-change
  interfaces independently of topology. C5a consumes those maps and owns
  their compact cohomology/transgression application. Its exterior theorem is
  not a premise for the reflection invariant-algebra theorem.
- [TopologicalKTheory T2–T5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7575afad9ceed0ff19ecf5629ba196e54fdf7637/TauCetiRoadmap/TopologicalKTheory/README.md) owns actual SplitK0
  K-rings, relative triples/complexes, compact supports, λ-operations, Bott and
  the dual-Koszul Thom class. C6 constructs ch on these functors and its Thom
  correction, rather than replacing relative classes by their absolute image.
- [SpinRepresentations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0e8b058a97cc4f9401d2679313e0e937761c1024/TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md)
  supplies exterior/half-spin modules and weight characters. C7 translates
  specified root characters into characteristic series; spin lifts, geometric
  chirality, Dirac operators and index theorems are geometric consumers.

The algebraic-vector-bundle roadmap concerns schemes and Chow/étale realization.
Tau Ceti's quadratic-form `sw1`/`sw2` concern Galois cohomology of fields; they
are distinct from the topological classes constructed here. The classifying-space
contract [#437](https://github.com/TauCetiProject/TauCetiRoadmap/pull/437) treats
discrete groups; C1 compares that specialization and supplies compact Lie groups.

Abbreviations below use the linked suppliers: TopK=TopologicalKTheory,
AT=AlgebraicTopology, SBC=SmoothBundlesConnections, CKG=ComplexKahlerGeometry,
GT=GeometricTopology and DG=DifferentialGeometry.

[ConvexityToric T2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0e8b058a97cc4f9401d2679313e0e937761c1024/TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md#L73-L103) owns Borel
equivariant cohomology, moment-map Morse theory and localization, consuming C1's
torus model/cohomology and C2/C3's ordinary Thom, Euler and Leray–Hirsch theory.
Compare its finite products of spheres/projective spaces with C1's torus model
and retain the standard-character versus positive-h generator sign.

## Conventions

Write H^k(X;R) for the existing singular cohomology object, with cochain degree k and zero groups in negative degrees.
Package H* as the graded direct sum and completed even classes as
`Hhat_even(X;R)=Π_(j≥0) H^(2j)(X;R)`, with finite convolution in each degree.
All universal identities are degreewise; truncation requires a displayed
cohomological dimension bound. Coefficient maps Z→Q→R commute with products,
relative maps and connecting morphisms. No de Rham class specifies torsion.

A real rank-n bundle E has orientation system o(E), the integral sign local
system of its orientation double cover. Its Thom class is
`U_E ∈ H^n(E,E\0;π*o(E))`. A chosen orientation trivializes that system and
fixes each positive-rank fibre generator by its ordered positive basis.
In rank0 the chosen orientation is a sign ±1, and that sign is its degree0
Thom/Euler generator; the canonical empty-basis orientation gives+1. The Thom map is
`a↦π*a ∪ U_E`, in that order. Direct-sum fibre orientation orders E before F.
The Euler class is zero-section pullback of the absolute image of U_E; it lives
in H^n(X;o(E)) without a chosen orientation. Complex fibres have their canonical
real orientation `(v₁,iv₁,…,v_r,iv_r)`.

For an invariant polynomial P on the real Lie algebra define the abstract
Chern–Weil map as `cw(P)=[P(F)]`, with no automatic 2π or i rescaling.
Polarization satisfies P(z)=B_P(z,…,z), and evaluation uses that B_P on F
with no additional factorial. For a unitary representation ρ use the actual
polynomials `coeff_(t^j) det(1+t(i/(2π))dρ(z))`; for ch use
`tr((i dρ(z)/(2π))^j)/j!`. Pontryagin/Pfaffian polynomials likewise include
the displayed 2π factor themselves; prove the prescribed Chern/character
polynomials real-valued on the compact unitary Lie algebra before taking real forms. In SBC's Lie(Circle)=R convention
θ↦exp(iθ), the standard character has dρ(a)=ia and its degree1 invariant
polynomial is −a/(2π). Thus cw sends it to −[F_real/(2π)], exactly the
standard-character line class, while the dual character gives the opposite.

Chern classes have degree2i and `c_r(E)=e(E_R)`. On CP^N let
`h=c₁(O(1))`, with ∫_(CP¹)h=1, so `c₁(O(−1))=−h`. For projectivization
P(E) of lines use its tautological sub-line H and `a=c₁(H)`; its monic relation
is `a^r−c₁(E)a^(r−1)+…+(-1)^r c_r(E)=0`. Real projectivization uses
`a=w₁(H)` and relation `a^n+w₁(E)a^(n−1)+…+w_n(E)=0` over F2.

Define `p_i(E)=(-1)^i c_(2i)(E⊗_R C)` integrally. Odd Chern classes of a
complexified real bundle are annihilated by2. Accordingly the exact integral
Whitney formula retains the odd-times-odd Chern terms; clean Pontryagin
multiplication is asserted after inverting2, not over arbitrary integral bases.

For a connection d+A on column coefficients use `F=dA+A∧A` and
`c(F)=det(1+(i/(2π))F)`, `ch(F)=tr exp((i/(2π))F)`. The exponential is
interpreted degreewise and terminates on a fixed-dimensional manifold. A metric
connection of rank2r>0 in an oriented orthonormal real frame has Euler form `Pf(F/(2π))`,
with `Pf([[0,a],[−a,0]])=a`, and Pontryagin
forms from `det(1+tF/(2π))`. The Euler form is0 in odd rank and the
chosen locally constant orientation sign in rank0. Check the block `[[0,−α],[α,0]]`: its complex
line curvature is i dα and its Euler form is −dα/(2π). This matches the
standard-character associated line, whose c₁ is the negative of SBC B6's
principal circle class defined using the dual-character line. CKG's O(1)
curvature is −2πiω_FS, so the Chern form is +ω_FS.

## C1. Universal principal bundles and cohomology infrastructure

**C1.0. Metric frames before classification.** From TopK T1's finite-rank
continuous vector bundles, local frames and continuous positive metrics,
construct the orthonormal frame principal O(n) bundle by Gram–Schmidt.
For a supplied orientation and n≥1, construct its positively oriented SO(n)
principal subbundle; for complex Hermitian bundles construct the unitary U(n)
frame bundle. Prove continuity, local chart/trivialization and division equations,
freeness and transitivity on each fibre, reconstruction of the vector bundle as
the associated standard module, and naturality under metric isometries and
pullback. The smooth versions consume SBC B2's native frame and metric
interfaces. Use the designated operator-norm matrix Lie topology and its proved
identity homeomorphism to the default finite-dimensional matrix topology.
These constructions precede universal joins, BSO classification, characteristic
rings and the w₂ obstruction.

For metrics h₀,h₁, construct the positive h₀-self-adjoint H defined by
h₁(u,v)=h₀(Hu,v). Its inverse square root carries an h₀-orthonormal frame
to an h₁-orthonormal frame. Prove chart independence, continuous and smooth
parameter dependence, the inverse transport, and homotopy compatibility.
Use the native finite-dimensional spectral/CFC square root pointwise; for
smooth dependence invert the Sylvester derivative
K↦H^(1/2)K+KH^(1/2), whose eigenvalue sums are positive.
Prove the actual composition comparison for metric changes; the square-root
maps for noncommuting metric changes need not compose literally.
For rank0 use the singleton zero-frame carrier and retain the orientation sign
as separate data. For variable rank work on the clopen rank strata.
For n≥1 identify the determinant-sign orientation double cover with the frame
quotient by SO(n), prove its local two-sheet description independently of a
universal classifier, and compare its chart signs with DG's tangent orientation
cover and with a supplied orientation. C1.1a consumes this metric-independent
cover; C1.1b owns its later universal-bundle comparison and classification,
and C3.5 owns the separate universal Spin obstruction.

1. **C1.1a. Finite oriented-cover precursor.** Before TopK T1.6,
   consume C1.0's single determinant-sign orientation double cover and its
   metric independence. Construct its direct-sum and cover-section comparisons
   and path-transport sign local system using TopK T1's vector-bundle atlases
   and T1.5's finite Stiefel quotients. Specialize C1.0's single cover to
   TopK's tautological finite rank-n real bundle for n≥1, and use this
   cover as the finite oriented Grassmannian. Construct its comparison with
   the quotient of the actual orthonormal n-frame Stiefel carrier by the
   right SO(n) action, with its tautological bundle and orientation-forgetting
   projection. Retain the two orientations when n equals the ambient rank;
   an ambient-SO quotient is not substituted for this full carrier. The
   rank0 carrier below is the canonical positive point with its sign datum
   separate. Consume T1.5's finite Schubert cells, append-last
   ambient Fin.castSucc inclusions and V↦ℝe₀⊕shift(V) rank maps, with the new
   positive line first, and lift these maps to the cover.
   For positive rank construct the lifted Schubert CW cells,
   characteristic maps and weak topology; rank0 is the canonical point.
   Prove the closed-subcomplex and commuting rank/ambient squares.
   For target rank n compare the rank n−1→n map with the last-column
   SO inclusion by the cyclic block permutation corrected on the added
   line by sign(−1)^(n−1), and its path in SO(n). Prove the bundle and
   orientation-forgetting homotopy comparisons. This precursor uses no
   Milnor join or TopK T6.4; TopK T1.6a owns the fixed-rank/stable oriented
   colimits and their HomotopySpheres classifier comparison.

   **C1.1b. Numerable joins and frame specialization.** After TopK
   T1.6a and T6.4, for compact Lie G construct the Milnor countable join EG with free right
   G-action and quotient B_join(G),
   using the strong coordinate topology generated by the weights t_i and
   g_i on {t_i>0}, with finite-support points and Σt_i=1. Prove the compact
   Lie case metrizable/paracompact, its numerable principal charts,
   contractibility by an explicit shift/rotation
   homotopy, and classification of numerable principal G-bundles by [X,B_join(G)].
   Build the bundle-map/isomorphism and homotopy comparisons, independence of
   partitions and refinement. For an uncountable locally finite trivializing
   family, consume TopK T1.6a's
   [public early countable-colour producer](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7575afad9ceed0ff19ecf5629ba196e54fdf7637/TauCetiRoadmap/TopologicalKTheory/README.md#L340-L399):
   its generic gap formula, zero-complement convention, tie and zero-weight
   cases, disjoint same-cardinality strata, telescoping normalization, and
   native countable partition. Consume its locally finite finite-stage
   weighted-frame construction with chart, partition and refinement
   homotopies. A locally finite uncountable chart family alone gives no
   countable coordinate stage. Apply the supplied countable partition to the
   chosen principal-bundle trivializations to construct this stage's
   equivariant join map and prove its pullback isomorphism and classifier
   naturality; retain those G-specific constructions here. For the comparison
   with the O/U Grassmannian carriers below, consume the same early finite-stage
   frame and homotopy interfaces rather than re-proving their generic
   construction. This handles uncountable trivializing covers. For the join
   weights themselves, prove that summable point-finite weights admit a locally
   finite subordinate refinement by truncating at 1/n and normalizing a
   countable union of locally finite families; the original weights are not
   asserted locally finite in Mathlib's partition-of-unity sense. Prove functoriality under continuous homomorphisms,
   products and subgroup-associated fibrations. For finite discrete G compare the weak-topology model of
   #437 and TopK T1's O/U Grassmannian models, together with C1.1a/TopK T1.6's
   oriented carriers, by the actual universal-bundle maps, including
   finite-rank and stable inclusions and orientation forgetting.
   Consume C1.0's continuous orthonormal/unitary frame principal bundles
   and Gram–Schmidt charts. Construct their comparison with pulled-back
   universal Stiefel bundles. Consume C1.1a's orientation
   cover and TopK T1.6's fixed-rank BSO(n), stable BSO carrier and
   oriented classifier comparison. Prove the numerable SO join/Grassmannian
   universal-bundle comparison, finite-rank and stable inclusions,
   orientation forgetting and the general paracompact oriented
   classification on those same carriers. Compare with the smooth
   frame/orientation constructions. Consume the
   CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres;
   prove that continuous singular simplices, chains and cochains are unchanged
   by k-ification because every standard simplex is compact Hausdorff. Export
   the resulting natural cohomology comparison for the stable carriers.
   Consume native `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`
   from that API, with one common typical fibre F
   for all charts of each join, quotient or pullback TopCat morphism, and
  `TauCeti.TopCat.mem_serreFibrations_proj` for native `FiberBundle` carriers.
  The associated DGFloer 1.2 homotopy exact sequence is a target to construct,
  not a theorem supplied by these membership declarations. Construct its
  specialization of the actual boundary π_n(B)→π_(n−1)(F) to these numerable
  bundles, with basepoints, basepoint change, group laws and pointed-set
  exactness at π1/π0. Do not identify the fibre inclusion with an NDR pair. Prove
   Dold's theorem that a numerable bundle with contractible fibre is a homotopy
   equivalence, including the local contraction/partition construction.
2. **Bockstein input.** Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and
   Bockstein construction on the existing singular/relative cochain complexes,
   including 0→Z→[×2]Z→F2→0. Build its coefficient-change compatibility with
   the graded and supported interfaces here; do not define a second Bockstein.

   **C1.2a. Compact-relative support foundations.** These constructions precede bundle classification, Thom theory and manifold duality.

   **S0 (diagram and colimit).** For locally compact Hausdorff X, closed A subset X, commutative R and an arbitrary module-valued local system L on X, consume AT6.1's single local-coefficient singular cochain complex, its actual path transport and restriction maps. There is no finite-rank, projectivity, freeness or field assumption on the fibres. A degree-n cochain assigns each singular n-simplex an element of the designated first-vertex fibre, with the differential and edge transport fixed by AT6.1. Use that same convention in every construction below. Define C_K^*(X,A;L)=C_sing^*(X,A union (X\K);L), the subcomplex of cochains vanishing on simplices in that relative subspace, on actual compact K ordered by inclusion. Construct its degreewise filtered colimit C_c^*(X,A;L) and prove H^n of this complex is colim_K H^n(X,A union (X\K);L), using exact filtered ModuleCat R colimits. Define H_c^n from this one object. Constant L=R recovers the earlier constant-coefficient object naturally; do not create a second cohomology theory. Export naturality under morphisms of local systems and ordinary relative cochain restriction along maps of pairs. Pullback on compactly supported cohomology uses S3's properness hypotheses; open inclusions use its extension map.

   **S1 (enlargement).** For K subset L_compact, construct C_K^*(X,A;L) -> C_L_compact^*(X,A;L) as the contravariant identity pair map with the unchanged local system. Export the actual structure maps, identity/composition laws, and commutation with local-system morphisms. Distinguish the compact set L_compact from the coefficient system L. No coefficient fibre is dualized or assumed finite.

   **S2 (cofinality).** Prove cofinal-family comparison and common-refinement independence for the actual compact-relative diagram with any module-valued local system L; the maps are those of S1. Use a countable exhaustion only with proved cofinality. Prove compatibility of this comparison with local-system morphisms, proper pullback and the constant-system specialization.

   **S3 (proper pullback and open extension).** For a proper map of closed pairs f:(X,A)->(Y,B), local system L_Y and coefficient morphism alpha:f^*L_Y -> L_X, pull compact K subset Y to f^(-1)K and construct the AT6.1 cochain pullback followed by alpha. It induces the compact-relative and filtered-colimit pullbacks. Prove identities, composition with the composed coefficient morphism, and coefficient-change compatibility. For an open inclusion j:V->X use the same restricted local system and relative local-coefficient excision on compact supports inside V to construct extension H_c^*(V;L|V)->H_c^*(X;L). Bind its chain-level representatives/derived inverse to the chosen excision comparison and prove independence and composition, rather than assert a strict inverse to an arbitrary cochain quasi-isomorphism. Construct supported cup and mixed-support maps with coefficient pairing L tensor L' -> L'', using AT6.2's actual transport and support hypotheses, before the later cap-duality comparisons. Do not assume closed-pair excision without the S5 condition.

   **S4 (jointly proper homotopy invariance).** For H:I times X -> Y between closed pairs (X,A),(Y,B), require H(I times A) subset B and JOINT properness. For a target local system L_Y construct the actual local system H^*L_Y on I times X; identify the endpoint pullback systems by its canonical transport along t -> H(t,x). Prove its naturality in x using AT6.1's homotopy transport. The cochain prism with those coefficient transports gives the homotopy between the two pullbacks AFTER this identification. For compact K subset Y use the single compact projection P_K=pr_X(H^(-1)K) to enlarge source support; the entire prism lies outside K when its source lies outside P_K. Pass to the filtered colimit and prove the induced cohomology equality. For a further coefficient morphism require compatibility over the whole pulled-back homotopy system; unrelated endpoint morphisms do not yield equality. Properness of separate slices alone is insufficient. For a homotopy fixed on A the restricted transport is the identity and the same prism proves the relative assertion.

   **S5 (support excision and the pair triangle).** For closed pairs and an arbitrary module-valued local system L on X define the filtered union-relative to sum-subcomplex-relative
   comparison
   colim_K C^*(X,A∪(X\K);L) → colim_K C^*(X,A+(X\K);L),
   induced contravariantly by C_*(A)+C_*(X\K)→C_*(A∪(X\K)). Here `+` is
   the sum of singular subcomplexes. Define a pair as support-excisive when
   this filtered comparison is a quasi-isomorphism. Prove that every closed
   pair with the following controlled collar data is support-excisive.
   The collar c:A×[0,1)→X is an open embedding with c(a,0)=a. Specify
   0<r0<r1<1 with c(A×[0,r1])
   closed, and a homotopy h_t:X→X with h_0=id_X, fixed on A and outside
   c(A×[0,r1]),
   preserving this closed strip, moving only its collar coordinate, and sending
   c(A×[0,r0]) into A at t=1. Prove joint properness from this strip control:
   for compact K, project c⁻¹(K∩c(A×[0,r1])) to compact A_K⊂A; then the
   inverse image of K is closed in I×(K∪c(A_K×[0,r1])), hence compact.
   Prove support excision by compact buffers and small chains. Given K, choose
   compact L containing K and the projection of h⁻¹(K), so h_t(X\L)⊆X\K.
   For Q_K=C_*(A∪(X\K))/(C_*(A)+C_*(X\K)), use the open cover
   {c(A×[0,r0))∩(A∪(X\L)), X\L} to obtain the small-chain comparison.
   The prism homotopy identifies Q_L→Q_K with h_1 on these small chains;
   h_1 sends their collar part into A and kills the quotient. Thus Q_L→Q_K
   is null-homotopic in the constant-chain model. For the arbitrary local
   system L, carry the SAME subdivision, small-chain and prism operators
   through AT6.1's coefficient transports on each simplex. Prove their
   identities with the first-vertex convention; use the canonical transport
   along h to compare endpoint pullback systems as in S4. The resulting
   local-coefficient cochain homotopies, after compact support enlargement,
   prove the filtered comparison is a quasi-isomorphism. Cochain restriction
   to the sum model is degreewise a coordinate projection on simplex fibres;
   extension by zero on complementary simplex coordinates gives the required
   degreewise splitting. This argument uses neither exactness of dualizing
   arbitrary modules nor an identification of L with its dual. The constant
   R case agrees with the free-chain dual argument. Take exact filtered
   colimits of ModuleCat R complexes. This generic theorem does not depend on AT8.5.
   For proper f:X→Y between locally compact Hausdorff spaces, construct the
   AT4.5 mapping cylinder M_f as locally compact Hausdorff, with bottom
   collar c(x,u)=[x,u] an open embedding and the indicated closed strip.
   Construct its collar pusher separately from the full slide:
   in a bottom collar coordinate u∈[0,r1], choose continuous
   χ:[0,r1]→[0,1] with χ=1 on [0,r0] and χ=0 near r1, and set G_t(x,u)=(x,(1−tχ(u))u), extending by the
   identity outside the strip. This fixes the bottom and sends the r0-strip into
   it. The projection p:M_f→Y is proper for proper f and is unchanged by G.
   For compact K⊂M_f, G⁻¹(K) is closed in I×p⁻¹(p(K)); the latter is compact,
   so G is jointly proper. The full cylinder slide used for the proper
   homotopy is a different map and is not being used as the collar pusher.
   Use (C_*(A)+C_*(X\K))/C_*(X\K)≅C_*(A)/C_*(A\K) for the
   degreewise-split sum-model sequence in the constant case. For L use
   the degreewise split local-cochain sequence
   0 -> C^*(X,A+(X\K);L) -> C^*(X,X\K;L)
     -> C^*(A,A\(K intersect A);L|A) -> 0,
   with restriction as its last map; prove exactness directly on simplex
   fibre coordinates and prove that it commutes with the local differential.
   The degreewise splitting is not asserted to be a cochain splitting.
   Compact K∩A are cofinal among compact supports in A. After exact filtered
   colimits and support excision, obtain the supported relative cochain
   triangle C_c^*(X,A;L) -> C_c^*(X;L) -> C_c^*(A;L|A), identifying its
   first term with Cone(restriction)[−1], its natural pair exact sequence
   and AT6.1's connecting signs. Prove naturality under proper closed-pair
   maps with coefficient morphisms, including the homotopy transports of S4.
   Specialize to the orientation local system and all tensor-twisted module
   systems used by AffineMorseLefschetz A4.0's four cap dualities, without
   changing that stage's single supported carrier or its integer grading. An arbitrary closed pair is not declared excisive merely
   by being closed. AT's supported cellular comparison specializes this support
   object to locally finite CW pairs; it is not an input to this generic
   definition or collared-pair proof. These foundations consume AT2–4 and
   ordinary AT6.1–6.2 only, independently of AT8.5 and all CC classifiers/Thom
   developments.

   **C1.2a mixed-support cup/module products.** Consume AlgebraicTopology Stage6's
   relative cup/module maps against the
   actual TopPair carrier and construct their support-colimit packaging.
   Absolute-relative module maps and the cup product on one fixed pair exist
   for every pair. Cup/cross products into a union of relative subsets use
   excisive couples: NDR/cofibration triads, finite CW triads or open complements
   of compact supports. Construct the small-chain comparison from C(A)+C(B)
   to C(A∪B) under that hypothesis; do not assert it for arbitrary closed couples.
   **C1.2b. Bundle/coefficient comparisons.** For arbitrary paracompact bases,
   prove the bundle-specific Leray–Hirsch and
   Thom comparisons through the singular CW-resolution pullback: construct
   the evaluation |Sing X|→X as the counit of Mathlib's `sSetTopAdj : SSet.toTop ⊣ TopCat.toSSet`,
   consume AT4's generic `simplicialRealizationCW` and paracompactness
   instead of constructing a second realization CW structure. Own Milnor's
   weak-equivalence theorem for this actual counit using the adjunction
   triangle Sing(ε_X)∘η_(Sing X)=id. AT8.2 says Sing X is Kan and its
   actual unit is a weak equivalence; two-out-of-three and the native
   Kan/cubical comparison give the counit weak equivalence.
   Consume AT8.2's cubical/Kan comparison in the shapes of Mathlib
   [#42435](https://github.com/leanprover-community/mathlib4/pull/42435)
   (`SSet.KanComplex.π`) and [#42488](https://github.com/leanprover-community/mathlib4/pull/42488)
   (`SSet.FundamentalGroupoid`); construct any missing interfaces in Tau Ceti.
   Construct the DGFloer 1.2 target `connectedMapHomologyComparison`, including
   its face-compatible Eilenberg compression, local-coefficient prism maps and
   weak-equivalence coefficient-chain/Hom comparison; the public PR963 text
   supplies the weak-equivalence/local-coefficient input, not this named map.
   Apply the constructed comparison to this actual
   counit after proving the counit weak equivalence; do not build another
   arbitrary-space weak-equivalence or CW-approximation theorem here.
   Pull back the bundle and deleted/projective/flag bundles; item1's homotopy
   sequence proves the corresponding total-space maps weak equivalences.
   Export absolute and relative cohomology comparisons, including maps of pairs
   and their long exact sequences. Do not infer
   singular/Čech equality without its hypotheses. Consume the sites-based
   `cechComplexFunctor` and AddCommGrpCat coordinate comparisons of Mathlib
   [#35073](https://github.com/leanprover-community/mathlib4/pull/35073), and
   sheaf/derived cohomology of [#35790](https://github.com/leanprover-community/mathlib4/pull/35790)
   where that comparison is used. Consume
   [TopologicalSheafCohomology TS1.1–TS1.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f06755a218b4dc5eeccc6b0f4a7782e14ccb9b55/TauCetiRoadmap/TopologicalSheafCohomology/README.md)'s
   early, purely cover-theoretic interface for arbitrary topological spaces:
   fixed-cover native tuple complexes, actual raw refinement cochain maps,
   their identity/composition laws and explicit cochain homotopies between
   any two functions realizing the same refinement. Retain compatibility
   with coefficients, restriction, further refinement and the ordered/tuple
   comparison. These early interfaces impose no local-compactness hypothesis.
   Choose a small cofinal system of point-neighborhood covers and prove its
   common-refinement/cofinality laws. After the refinement homotopies prove
   cohomological independence, use the directed preorder ordered by existence
   of refinement to define Čech H^q(X;A)=colim_U H^q(Čech•(U;A)), with A
   viewed as a ℤ-module. Keep raw refinement functions at the cochain level;
   their category is not assumed filtered and their maps need not be equal.
   Own `cechSingularCWTypeComparison`: for every paracompact Hausdorff X of
   CW type and constant abelian coefficient group A, construct the natural
   all-degree Čech/singular comparison from these actual fixed-cover complexes.
   Prove constant-coefficient Čech homotopy invariance here using numerable
   partitions/refinements and finite interval subdivision. On a Hausdorff CW
   representative construct the locally acyclic singular-cochain sheaf
   resolution using AT4's cell-neighborhood contraction and small-chain maps;
   prove its paracompact acyclicity. Construct the fixed-cover augmented
   resolution comparison and its refinement-homotopy compatibility, then
   descend the resulting cohomology maps to the displayed cohomological
   colimit. Transport through a CW homotopy equivalence and prove independence,
   coefficient/cup naturality and the closed-CW-pair exact-sequence version,
   using fixed-cover relative complexes and their compatible homotopies.
   This route requires no good cover on an arbitrary CW-type X. Retain the
   good-cover specialization on finite smooth approximations. After AT8.10,
   prove that this comparison carries the Čech class pulled back by a
   classifying map to the actual ordinary EM universal-class pullback;
   use that normalized square in C1.6 and C3.5. This later square consumes
   AT8.9–8.10, independently of C1.2's earlier actual-counit theorem and
   C1.5's carrier/cellular comparison. Follow the homotopy/excision/exactness
   interfaces of [#38369](https://github.com/leanprover-community/mathlib4/pull/38369)
   when packaging the cohomology theory, without replacing the actual complexes.
   Construct missing comparison interfaces in Tau Ceti in these shapes and
   adopt Mathlib's APIs when available.
3. For compact Lie G prove the no-small-subgroups property from the local
   exponential chart and powers. Combine it with Peter–Weyl point separation
   and compactness of the complement of an identity neighbourhood to obtain
   one finite faithful unitary representation. Prove its smoothness using the
   continuous-homomorphism theorem of LieGroups. For G⊂U(N), construct
   `E_m=V_N(C^m)` and `B_m=E_m/G` as actual smooth principal bundles using SBC
   B1.4. Compare their classifying maps with BG and use T1's Stiefel connectivity
   to prove the classifying pullback `H^d(BG;R)→H^d(B_m;R)` is an
   isomorphism in the stable range; its inverse defines universal classes.
   Use the common associated space `EG×_G E_m`: its map to B_m has contractible
   fibre EG and is a homotopy equivalence by item1; its map to B_join(G) has
   fibre E_m. Apply the constructed DGFloer 1.2 connected-map comparison after
   its separately stated Serre homotopy-fibre-sequence target. State the bound,
   for example choose `2(m−N)≥d+1`. The cohomology comparison uses integral
   homology and universal coefficients, not an assumed cohomology Serre theory. These comparisons include local coefficients and coefficient
   naturality. Use SBC B6.0's finite smooth good cover and Mayer–Vietoris to prove
   finite generation for compact B_m in each degree and the rational-to-real
   base-change theorem there; this does not require smooth triangulation.
4. Prove the smooth-principal-bundle comparison needed by these approximations:
   continuous reductions to compact G and continuous principal isomorphisms
   over smooth bases admit smooth representatives, including relative homotopy
   versions. Use U(N)/G associated sections and relative Whitney approximation,
   proving that section smoothing retains the reduction and prescribed data.
   A smooth bundle classified by a smooth finite-approximation map has its
   connection classes equal to pullbacks of universal classes by naturality.
5. Use T1.6's named rank-one infinite Grassmannian models CP∞ and RP∞,
   with their final/weak CW topology and tautological bundles. Own the
   comparisons with the finite AT4.6 RPⁿ and CKG K7 CPⁿ carriers and their
   finite-stage inclusions, and the degreewise cellular/cup comparisons.
   This construction uses AT4/6 and T1.6's carrier portion, preceding ordinary
   line classification; AT8.12 consumes these comparisons to identify the
   carriers as EM spaces. Prove
   `H*(CP∞;Z)=Z[h]`, `H*(RP∞;F2)=F2[a]` and
   `H*(RP∞;Z)=Z[y]/(2y)`, |h|=2, |a|=1, |y|=2, with `y=β(a)` and
   its actual cup powers. Compare BU(1), BO(1) and the double-cover model,
   For T=(S¹)^m construct the compatible finite models
   `ET_N=(S^(2N+1))^m`, `BT_N=(CP^N)^m`, their free action, quotient
   and colimit universal bundles. Prove ET contractible by finite-stage
   connectivity and the CW/compactly generated colimit comparison, its
   numerable charts and the universal comparison with B_join(T). Prove the
   torus integral ring from product/Künneth with finite skeleta. The standard
   coordinate character gives the associated tautological O(−1), hence class
   −h_i; the positive h_i is the dual-character class.
   Define the degree2 complex-line class using the class x on CP∞ whose
   restriction to complex-oriented CP¹ pairs to −1: for its tautological
   line O(−1), `c₁(L)=f_L*x`, and h=−x for O(1). Define the real-line
   w₁ as pullback of the unique nonzero a∈H¹(RP∞;F2), identified with its
   orientation double cover. This precedes higher projective characteristic classes. Its
   tensor/dual maps are addition/negation by the universal degree2 calculation;
   compare with SBC B6 on smooth bases. C3 identifies this class with c₁.

6. **Ordinary classification of line bundles.** For CW complexes and for
   paracompact Hausdorff bases of CW type, combine T1.6's numerable rank-one
   bundle classification with AT8.10 ordinary representability and AT8.12's
   class-normalized CP∞≃K(ℤ,2) and RP∞≃K(ℤ/2,1) comparisons. Prove
   complex-line isomorphism classes ≃H²(X;ℤ), with tautological class x=−h,
   and real-line classes ≃H¹(X;ℤ/2), with their natural tensor/dual maps.
   Prove the relative versions for bundles with a prescribed trivialization
   on a CW subcomplex, using AT8.10's relative map classes; preserve that
   trivialization under isomorphisms and homotopies. This theorem follows
   C1.5's carrier/cellular comparisons; those earlier comparisons use no
   line-classification theorem or AT8.12. On general paracompact bases retain
   the stated Čech/singular distinction rather than assert singular classification.

## C2. Thom, Euler and Gysin theory

**C2.0. Bundle disk/sphere cells.** Before the cohomological Thom theorem,
construct `bundleDiskSphereRelCW` for a continuous real rank-r vector bundle
E over a Hausdorff native CW pair (X,A), with A a closed CW subcomplex.
Use TopK T1.3's continuous fiber metric and T1.4's compact-disk bundle
homotopy invariance. The carriers are the actual unit disk/sphere subsets
D(E)={v:‖v‖≤1} and S(E)={v:‖v‖=1} of the native bundle total space.
Use the subtype D(E) as ambient type, with its inherited topology; construct
native RelCWComplex on Set.univ in that subtype relative to the subset
S(E)∪D(E)|A, with one
(q+r)-cell for each relative base q-cell. Pull back E along its characteristic
map D^q→X, trivialize that compact-disk bundle and make the frame orthonormal.
Prove the native bundle total space is Hausdorff from the Hausdorff base,
finite-dimensional Hausdorff fibers and local trivialization charts: projection
separates different base points, and one bundle chart separates points in the
same fiber. D(E) inherits that Hausdorff topology. Use the native sup-norm cell cubes. Identify their product with the
(q+r)-cube by Fin.append, base coordinates first and fiber coordinates last.
On the fiber cube use AT2.5's single `supBallEuclideanDiskHomeomorph`,
whose fixed formula is v↦(‖v‖∞/‖v‖₂)·v for v≠0 and 0↦0, with inverse
w↦(‖w‖₂/‖w‖∞)·w; then apply the orthonormal frame. Include its rank0
point case.
Its boundary is (∂D^q×D^r)∪(D^q×∂D^r). Compare the radial map's relative
homology generator through AT2.5's existing coefficient +1 normalization before using
it to normalize Thom cells. Prove the
attaching-map, closure-finiteness, weak-topology and compact-generation
comparisons using the locally compact disk fiber, and agreement with the
original bundle topology. Export `thomCellDimension` with these exact indices,
metric-change radial bundle homeomorphisms, coordinate-transition CW comparisons,
homotopies for homotopic trivialization choices, and relative subcomplex
comparisons. Complex rank-r bundles use their underlying real rank2r bundle.
Construct the pointed Thom CW model as the based cofiber of S(E)→D(E);
in rank0 it is X with a disjoint basepoint, and the empty-base case is the
one-point based space. Treat locally constant variable ranks by their clopen
rank pieces. The cell construction requires no bundle orientation.

Export `bundleDiskAttachmentCWModel`: for a continuous attaching map
S(E)→Z with Z Hausdorff, apply the A=∅ instance of the subtype
`bundleDiskSphereRelCW` to AT4.5's `relativeCWPushout`, passing the
literal base B=S(E)∪D(E)|∅ within the disk subtype. Construct `bundleSphereRelCWBaseHomeomorph` from this relative base
subtype to the actual S(E): its map forgets the disk-subtype bound and its
inverse uses ‖v‖=1⇒‖v‖≤1 and supplies the sphere disjunct in B. Transport the attaching map through that
homeomorphism to the exact C(B,Z) input of AT's pushout. When the disk
carrier and Z lie in different universes, first lift both to their common
maximum universe by ULift and transport the pair and attaching map through
the canonical homeomorphisms. Own this bundle-pair ULift transport of the
native relative CW structure with unchanged cell labels and characteristic
maps composed with those homeomorphisms. This puts native
relative CW data on the actual
disk-bundle attachment relative to Z. For the relative A form require an
attaching map defined on the entire base S(E)∪D(E)|A and use that pushout. Its new cells are exactly
the base cells shifted by r; no CW structure on Z is needed for this relative
theorem. For an absolute CW model require a specified Hausdorff CW complex
Z_c and a homotopy equivalence Z_c→Z with its actual inverse and homotopies.
Use AT4.5's `homotopyPushoutGluingComparison` and
`relativeCWPushoutCWModel`, using native
`TauCeti.hasHomotopyExtensionProperty_base`, transported from the
Set.univ subtype to D(E) by `HasHomotopyExtensionProperty.image`, to construct
the model and pair equivalence restricting to the specified map Z_c→Z.
Construct the inverse and its homotopies, retaining stationary relative data;
arbitrary prescribed two-sided base homotopies are not part of the input. When Z itself
is CW this comparison and its inverse homotopies fix Z; the absolute model
uses cellwise cellular approximation of the attachment rather than assuming
the original map is cellular. Retain AT's raw/Kelley carrier comparison.
MorseTheory M5 consumes these cells and owns its actual negative-disk
attachment comparison;
RiemannianGeometry R3 consumes this generic bundle-cell model before applying
AT8.1's relative-cell connectivity and transport theorem.

1. Construct U_E from local oriented fibre generators, prove uniqueness,
   coefficient naturality and the Thom module isomorphism with any local
   coefficient system L, twisting by o(E). Construct the orientation-valued
   class before choosing a deck-equivariant representative: prove relative
   homology with the sign system vanishes below n and its degree-n fibre
   generators identify with H₀(X;Z), by finite unions of open trivializing sets and directed chain
   colimits. Use the sign system's self-duality and integral universal
   coefficients to obtain U_E. It is a downstairs twisted cocycle whose
   lift is genuinely deck equivariant; invariance of an upstairs class alone
   is insufficient to choose such a cocycle. For the local-system extension,
   pass to C1's CW resolution componentwise, lift the bundle to the universal
   cover, and construct the orientation-equivariant cap chain map between
   bounded-below free Z[π₁]-complexes. Prove its cone acyclic by the oriented
   integral theorem, then its projective contraction; tensor/Hom with the
   displayed coefficient module and descend. Export the functorial local
   coefficient identifications, not just a constant-coefficient formula.
   Prove the mod2 form without an
   orientation and the oriented integral form. Begin with finite unions of open trivializing
   sets and Mayer–Vietoris; use the directed-union theorem for homology and
   compact simplex images, never Mayer–Vietoris of arbitrary compact subsets; extend by the free-chain cap mapping-cone argument
   of Milnor–Stasheff §10, with field detection and integral torsion control. C1's CW replacement
   transports the local-system proof; it is not a competing second definition.
   Prove the neighbourhood/support and CW-resolution comparisons in C1 rather
   than passing cohomology through arbitrary unions. Compare disc/sphere,
   deleted-total-space and Thom-space pairs with actual bundle maps.
2. Prove Thom naturality, zero/rank-zero cases, direct sums and products with
   orientation order, Euler naturality, orientation reversal, Whitney products
   with the corresponding local systems, and vanishing when a nowhere-zero
   section exists. Odd-rank oriented Euler satisfies 2e=0 and vanishes rationally;
   it need not vanish integrally. Construct the sphere-bundle Gysin sequence. An oriented rank1 bundle
   has its positive metric unit section, hence Euler0; retain signed rank0
   separately from the positive-rank sphere obstruction statements.
   Identify Euler with the primary section obstruction: orient the boundary
   of each positive base n-cell outward, normalize the radial fibre sphere
   to degree+1, and use the attaching section's degree in the sign local
   system. Compare that obstruction cocycle with the zero-section Thom class; for rank n≥2 over a
   CW base of dimension≤n prove e=0 iff a nowhere-zero section exists, and
   retain higher obstructions outside that dimension range.
3. For a transverse smooth section prove its zero locus has the specified
   orientation and represents Euler via Thom/Gysin. On a closed oriented
   manifold prove the sum-of-local-indices formula and e(TM)[M]=χ(M), with
   the cap/degree normalization of the suppliers. Prove the χ identity by
   identifying Euler with diagonal self-intersection, then evaluating the
   Poincaré-duality/Künneth trace; finite good covers give the finite-generation
   and cohomological-dimension bounds. This does not assume a Morse triangulation. Compare the rank2 class with
   GT Layer10 and C1's normalized degree2 class of the corresponding complex
   line, including the SBC dual-character convention. C3 identifies it with c₁. Construct characteristic-number evaluation and
   its naturality, degree and boundary-vanishing formulas.
4. Construct oriented and orientation-twisted embedding Gysin by Thom followed by tubular open
   extension; prove independence, isotopy, composition, transverse base change,
   self-intersection and the projection formula. Consume GT's normal/tubular
   maps and supply orientation/support comparisons. Noncompact embeddings use
   proper maps and compact-support groups; a bare Thom class on a noncompact
   base is a fibre-support multiplier, not a compact-support class.
5. Construct fibre integration for proper smooth submersions with compact fibres, using the vertical
   orientation system and its chosen-orientation specialization: export
   `p!:H^k(E;o(Tp)⊗p*L)→H^(k−d)(B;L)` for every displayed local system L.
   Build both ordinary and compact-support cohomology, composition,
   base change, projection formula and orientation signs. Build fibrewise
   embeddings and tubular comparison with a normal bundle, using a proper
   Whitney embedding of the total manifold and its graph over the base.
   Consume Mathlib's compact theorem `exists_embedding_euclidean_of_compact`;
   construct the noncompact finite-dimensional embedding connector by a
   compact exhaustion, locally finite bump/chart maps, and successive
   general-position perturbations. Use DG10.2's manifold Sard theorem to
   prove the finite-parameter transversality statements for these perturbations
   on the tangent sphere and off-diagonal pair space. Supply countable
   avoidance/approximation on the compact exhaustion. Use GT Layer1's weak
   (compact-open C∞) topology on native `ContMDiffMap` carriers E→ℝ^N,
   with its uniform compact derivative controls of every finite order.
   Prove convergence to a smooth limit and persistence of immersion and
   pairwise separation on each compact stage. Use Layer3's compact-source
   comparison only for compact sources. Construct a smooth proper exhaustion
   and append it as one coordinate to make the embedding proper. Prove the
   graph remains proper over the base and admits a fibrewise tube.
   Define the intermediate cohomology with supports proper over the base.
   Prove the graph tubular map preserves the base and that the Thom/extension
   construction agrees with integration of forms in local fibre charts.
   Build the compact-support de Rham/singular comparison on DG's complexes:
   construct the relative form mapping cone of Ω*(M)→Ω*(M\K) on the
   smooth open complement. Use bump cutoffs to identify its support-colimit
   cohomology with Ω_c*(M), proving the cutoff cochain homotopies and support
   enlargement independence. Compare the cones with TopPair by DG8's ordinary
   comparison, then exhaust compact supports and prove compatibility with
   excision and extension maps. Prove smoothness, derivative/integral interchange
   and support control, not
   merely a fibrewise numerical integral. Export the de Rham/singular square
   and the Euler-weighted identity `p!(e(Tp)∪p*a)=χ(F) a` componentwise.

6. For an associated G/T bundle over a numerable principal bundle for compact connected G over a paracompact base, construct cohomological fibre integration without assuming
   the base is a manifold. Embed G/T equivariantly as the adjoint orbit of a
   regular torus element in g, prove its normal bundle and uniform equivariant
   tubular neighbourhood using the invariant inner product and nearest-point
   uniqueness, and associate those maps over the base. Define
   fibre-compact support cohomology of the ambient vector bundle by disc pairs.
   Thom/extension followed by inverse ambient Thom gives the transfer; prove
   its coefficient, module, base-change and Euler-weighted identities. This
   supplies the actual rational flag-pullback injection for characteristic
   identities on arbitrary bases in C5.5 and virtual classes in C6, beyond
   universal smooth approximations. Prove agreement with C2.5 on smooth bases.

## C3. Projective splitting and integral/mod2 classes

1. Prove and export general cohomological Leray–Hirsch for a numerable locally
   trivial fibre bundle with a finite homogeneous family of global classes whose
   restrictions give a free basis of the entire fibre cohomology over R. Retain
   the degrees, coefficient/pullback/module maps and relative/excisive variants.
   Prove the cohomological projective-bundle specialization over every
   displayed base and pair, using C1's line class for a before higher Chern
   classes are defined: real rank-n bundles have basis 1,a,…,a^(n−1) over
   F2, complex rank-r bundles have basis 1,a,…,a^(r−1) over every commutative
   coefficient ring, with the integral/coefficient comparisons retained. Rank0
   projectivizations and universal point cases are separate. Prove the
   parameterized trivial-fibre case by product/Künneth. Construct the
   cup-with-global-fibre-classes cochain map from a finite sum of shifted
   base cochains. Prove it a quasi-isomorphism over cells and finite skeleta
   by relative five-lemma induction. For arbitrary CW bases prove the inverse
   cochain-limit comparison and degreewise stabilization from the bounded-below
   fibre cohomology, including the possible lim¹ term and its vanishing;
   consume AlgebraicTopology Stage 6.0's countable-tower cochain Milnor sequence
   and Mittag–Leffler vanishing, then prove the needed skeletal stabilization.
   Apply C1's ordinary CW-resolution bundle/pair comparison for general
   bases. Do not presume cohomological Leray–Hirsch from the homology Serre
   sequence alone. Iterated projectivization gives flag pullback injection
   and actual line summands, independently of a characteristic-class sum law.

   **Relative and compact-support Leray–Hirsch.** Prove the ordinary
   comparison for every restricted numerable bundle p_C:p⁻¹(C)→C, for an
   arbitrary subspace C⊆B, using the restrictions of the same finite family
   of ordinary global classes e_j∈H^(d_j)(E;R). Numerable charts and their
   partition restrict to C; do not assume that C is paracompact because B
   is. For this comparison use C1.2b's actual singular counit |Sing C|→C,
   its weak-equivalence construction and DGF's ordinary coefficient-chain/Hom
   comparison. Pull back the restricted bundle to that actual CW carrier;
   use the locally trivial Serre sequence to prove that the total-space map
   is a weak equivalence, componentwise with the same typical fibre.
   Prove the cochain LH map upstairs by the cell/Milnor argument above and
   transport the ordinary cochain comparison downstairs. Construct the
   natural restriction square with the comparison over B. Its mapping-cone
   comparison gives ordinary relative LH for (B,C) and (E,p⁻¹(C)); identify
   these cones with the actual ordinary relative singular cochain objects
   and retain their connecting signs. This does not require C to be closed,
   a CW subcomplex or a paracompact space. In particular it applies to the
   relative subsets used for compact supports below. Neither the counit nor
   its total-space comparison is asserted proper.

   For compact supports require a proper numerable locally trivial projection
   p:E→B of locally compact Hausdorff spaces with that finite ordinary global
   fibre-cohomology basis. Prove that a bundle with compact typical fibre F
   over such a base is proper: on each compact K⊆B take a finite closed
   refinement of its trivializing cover inside K, and identify each inverse
   image with the product of that compact piece and F. Include the empty
   base case. For every degree n construct the actual mixed-support map
   `⊕_j H_c^(n-d_j)(B;R) → H_c^n(E;R)`,
   `(a_j) ↦ Σ_j p*(a_j) ∪ e_j`, and prove it an isomorphism. The e_j are
   ordinary global classes, not compactly supported fibre or total classes;
   p* is C1.2a's proper pullback and the cup is its compact-support/ordinary
   mixed product in the displayed order.

   For each compact K⊆B apply the preceding ordinary relative theorem to
   (B,B\K) and (E,E\p⁻¹K), retaining these exact pair carriers and cup
   representatives. Properness makes p⁻¹K compact. Prove compatibility
   with K⊆K', coefficient maps, restrictions and the mixed products.
   Prove inverse-image supports cofinal among compact subsets of E:
   for compact L⊆E, p(L) is compact and L⊆p⁻¹(p(L)). Pass through C1.2a's
   exact filtered ModuleCat colimits to obtain the displayed supported
   isomorphism and its actual cochain-level comparison. This step uses
   ordinary relative comparisons before supports, not compact-support
   invariance under an unproved proper CW resolution.

   For a closed base subset A⊆B give the corresponding isomorphism
   `⊕_j H_c^(n-d_j)(B,A;R) → H_c^n(E,p⁻¹(A);R)` using, at each compact K,
   the relative subset A∪(B\K) and its full inverse image. The ordinary
   pair theorem above applies even if this union is not paracompact.
   Use C1.2a's union-relative supported carrier; do not assume its
   separate pair-excision triangle for arbitrary closed A. Prove the
   coefficient, proper-pullback, mixed-module, enlargement and connecting
   comparisons on the actual pairs; when invoking a supported pair LES,
   retain C1.2a's support-excisive hypotheses.

   For the base-local-system extension with an arbitrary module-valued L
   on B and p*L on E, require a displayed bounded finite free R-chain model
   P_* of the typical fibre and an actual chain homotopy equivalence
   P_*≃C_*(F;R). Construct the coefficient comparison before applying LH:
   finite freeness gives the degreewise natural isomorphism
   Hom_R(P_*,R)⊗_R M≃Hom_R(P_*,M) for every R-module M. Choose cocycle
   representatives for the supplied finite ordinary fibre basis e_j and
   transport them to this dual model. Prove that the resulting map from
   the finite sum of shifted copies of R to Hom_R(P_*,R) is a cochain
   homotopy equivalence: its cone is a bounded acyclic projective complex,
   whose contraction is constructed degreewise. Tensor the contraction
   with M and compare with singular cochains using the displayed chain
   homotopy equivalence. Prove naturality in M, independence of the chosen
   representatives/model, and compatibility with coefficient transport.
   Thus no flatness of M or exchange of an infinite cochain product with
   tensor is presumed. Apply this actual comparison to the first-vertex
   fibres of L and carry it through the same ordinary restriction, pair
   and proper support-colimit proof. Construct the finite free model for
   finite-CW projective and flag fibres from AT's actual cellular/singular
   chain comparison. This extra coefficient-model hypothesis belongs to
   the arbitrary-L extension, not to the preceding full R-valued theorem.
   Compact-fibre projective and flag bundles are instances. A noncompact
   fibre does not inherit this same-basis compact-total-support statement:
   its vertical/proper-over-base support or compactly supported fibre-class
   comparison must have its own stated support hypotheses and maps, as in
   C2's distinct Thom/fibre-integration interfaces. Retain ordinary LH at
   its original numerable scope.
2. In positive rank define w_i and c_i by the unique monic projective
   relations above. In rank0 define the total class as1, with all positive
   components zero; the empty projectivization is not used for coefficient uniqueness. Build
   pullback/isomorphism invariance, ranks, vanishing above rank, normalization
   and trivial-bundle classes. On split bundles derive the root polynomials
   by the nowhere-zero tautological section of Hom(H,π*E): its Euler class
   is zero, and C2's Euler product is the product of line Euler classes.
   Descend by flag injection to prove exact Whitney laws for w and c, dual,
   conjugate, determinant and line-twist formulas. Prove c_r=e(E_R),
   w_n=e(E) mod2, w₁ is the orientation-cover class and
   `w_(2i)(E_R)=c_i(E) mod2`, `w_(2i+1)(E_R)=0` for a complex E.
   Prove uniqueness from normalization, pullback and Whitney axioms on the
   universal carriers; export tensor-product, exterior-power and symmetric-power
   formulas through their actual root weights and coefficient changes.
   Compare c with the deleted-vector/Gysin inductive construction of
   Milnor–Stasheff §14, including the rank-reduction quotient bundle.
3. Define integral Pontryagin classes from complexification; prove conjugation,
   2-torsion of odd complexification Chern classes, stabilization, naturality,
   rank vanishing and `p_i mod2=w_(2i)^2`. For k≥1 export the exact Whitney correction
   `p_k(E⊕F)=Σ_(a+b=k)p_a(E)p_b(F)+(-1)^k Σ_(a+b=k−1)c_(2a+1)(E_C)c_(2b+1)(F_C)`.
   Prove its difference annihilated by2 and multiplicativity over Z[1/2]/Q.
   Prove `p_r(E)=e(E)^2` integrally for an oriented rank2r real bundle by
   comparing the real orientation of E_C with E⊕E; the permutation sign is
   (-1)^r. For a complex bundle prove p(E_R)=∏(1+x_j²). Define the integral
   Bockstein classes `W_k(E)=β(w_(k−1)(E))` for k≥1; prove naturality,
   2-torsion, W₁=0, W_k=0 for k>rank(E)+1, and `c₁(E_C)=β(w₁(E))`. Prove the reduction
   formula `ρβ(w_j)=w₁w_j+(j−1)w_(j+1)` for j≥1 over F2 by the universal flag roots
   and the cochain Bockstein product rule. This does not presume Steenrod theory.
4. Compute `H*(BU(r);Z)=Z[c₁,…,c_r]` by integral flag injection into
   `H*((BU(1))^r;Z)`, the permutation action and the fundamental symmetric
   polynomial theorem, consuming Mathlib `MvPolynomial.symmetricSubalgebra`,
   `esymm`, `psum` and `esymmAlgEquiv`. Prove the universal flag total-space comparison, not
   just an equality of root formulas. The analogous real ordered-line flag
   proves `H*(BO(n);F2)=F2[w₁,…,w_n]`. Use the determinant-line Gysin sequence
   and injectivity of multiplication by w₁ to prove
   `H*(BSO(n);F2)=F2[w₂,…,w_n]` for n≥1, with the canonical rank0 case separate. Compare stabilization and rank restrictions.
   Integral BO/BSO is not inferred from these mod2 or rational rings.


4a. **Partial-frame primary obstruction comparison.** After C3.4, compare
   its actual universal w/c classes with the first obstruction for r independent
   sections, using TopK T1.5a and AT8.9's actual relative cochains/path transport.
   For real rank n and 1≤r≤n, put k=n−r+1. In the branch k≥2, the
   first obstruction is in degree k with
   fibre group π_(k−1)(V_r(R^n)). For r=1 retain the integral Euler coefficient
   system. For r≥2 the group is Z/2 for even k and Z for odd k, with the
   actual orientation action in the latter case. Its mod2 reduction is the
   shared w_k. Prove this on the universal associated Stiefel fibration:
   its total space compares with BO(k−1), and C3.4 makes the degree-k
   restriction kernel exactly the span of w_k. Construct the low-degree
   transgression/primary-obstruction square on AT's cochains; prove the
   bottom-fibre generator maps to this nonzero kernel, and transport through
   bundle pullback and the CW-resolution comparison. Do not substitute an
   unspecified whole spectral sequence for this square. For k=1 compare
   the component obstruction with C1.0's determinant cover and w1 separately.
   In the integral branch, w_k=0 alone does not imply the integral obstruction
   vanishes; retain higher obstructions beyond the first obstruction range.
   Fixed skeletal data extend iff the actual obstruction cochain vanishes;
   class vanishing permits the changes stated in AT8.9.

   For complex rank n and 1≤r≤n, put k=n−r+1, so 1≤k≤n. The first
   group is Z in degree2k−1.
   The primary obstruction is c_k in degree2k. Compare the universal total
   space with BU(k−1), whose integral restriction kernel in that degree is
   generated by c_k; normalize the bottom generator by C2.2's positive
   complex-oriented one-frame Euler obstruction to obtain +c_k. Prove
   coefficient, relative, pullback, stabilization and rank0/one-frame
   comparisons. This comparison follows C3.2/C3.4's projective definitions
   and ring calculations, and is not an input to either of them.

   For r=0 the actual frame fibre is a point: the empty frame has no
   first obstruction. This is the only frame branch at n=0; do not apply
   either positive-frame first-group formula there. For r>n use the empty
   frame fibre and retain the empty-base case separately.

5. Identify w₂ with the universal transition-lift cocycle for the real spin
   central double cover. In positive rank consume native
   `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`
   from `Topology/Algebra/CliffordAlgebra/Spin/Covering`, with its compactness
   instance from `Compact`; retain the actual rightHom and central μ2 kernel.
   Use evenly covered SO neighborhoods for continuous local sections.
   Consume `CliffordAlgebra.pathConnectedSpace_realCliffordSpinGroupZero_add_two`
   from `Connected` for ranks≥2, including the rank2 squaring-cover
   nontriviality detected by restriction to SO(2) and e mod2.
   `realCliffordSpinLastLocalSection` is a section over the unit sphere and
   is not an SO-cover section. [SpinGeometry G4.1a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/eb728c1c5a918754ff785dcfd561aad6185d14a4/TauCetiRoadmap/SpinGeometry/README.md) owns rank0/rank1 and
   frame transport through the native abstract/units-range/matrix comparisons;
   G4.1b owns the
   independent smooth refinement on the native units-range carriers;
   the topological cocycle uses no smooth-cover refinement. Consume those
   topological carrier adapters when comparing with TopK's frame bundles.
   For a numerable oriented bundle construct the Čech central-lift cocycle
   from actual transition functions and continuous local lifts after refinement.
   Own the paracompact refinement/local-lift lemma using the covering
   neighborhoods, and prove independence of cover/refinement/lifts, the
   cocycle equation and pullback naturality. On a paracompact Hausdorff
   base of CW type compare its
   Čech class with singular cohomology through C1.2's all-CW-type comparison
   and normalized classifying-map square; on finite smooth approximations
   specialize to their genuine good covers. Then
   identify its mod2 class with the projective w₂. Work universally on BSO(n)
   and compare on finite smooth approximations/good covers. H²(BSO(n);F2)
   is generated by w₂ for n≥2; restriction to SO(2) identifies the central
   squaring-cover obstruction with e mod2. Prove stabilization and the rank0/1
   cases. In rank0 consume [SpinGeometry G4.1a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/eb728c1c5a918754ff785dcfd561aad6185d14a4/TauCetiRoadmap/SpinGeometry/README.md)'s geometric μ2→SO(0)={1},
   rather than the trivial native Mathlib Spin(0). Its canonical SO(0) frame
   bundle lifts as a principal Z2 bundle; w₂=0 and the trivial lift exists.
   Retain the signed rank0 orientation separately. The same trivial-base-cover
   test applies in rank1, with the chosen orientation retained. On paracompact
   Hausdorff bases of CW type export the singular/Čech obstruction
   comparison; for finite-dimensional Hausdorff second-countable smooth manifolds consume AT8.7's
   countable locally finite triangulation/CW comparison. Retain the Čech
   obstruction on a general paracompact base.
   The item order is G4.1a → C3.5 → G4.3: the topological adapters
   precede this comparison independently of w₂; G4.3 consumes this equality
   and this item's general paracompact atlas-refinement/local-lifting lemma.
   G4.1b's smooth refinement is independent of C3.5. G4.4 constructs the H¹ torsor
   once a lift is given, independently of the universal obstruction equality.

6. **Orthogonal universal rings away from 2.** Build
   `bsoCohomologyAwayTwo` for every commutative coefficient ring R with
   `IsUnit (2 : R)`, on TopK T1.6's fixed-rank and stable BSO carriers, as actual
   graded-ring isomorphisms sending the polynomial generators to C3's
   universal Pontryagin and C2's Euler classes. Export its R=F_p instance
   and integral-reduction comparison as `bsoCohomologyModOddPrime`.
   For every such R, including ℤ[1/2], for r≥1 prove
   `H*(BSO(2r);R)=R[p₁,…,p_(r−1),e]`, |pᵢ|=4i, |e|=2r and p_r=e²;
   for r≥0 prove `H*(BSO(2r+1);R)=R[p₁,…,p_r]`.
   The stable ring is R[p₁,p₂,…], with every class a finite polynomial.
   BSO(0) is the chosen point carrier and BSO(1) is contractible through
   C1.1's comparison with B_join of the trivial group. Their rings are R;
   the canonically
   oriented zero-bundle Euler class is1 and the rank1 Euler class is0.
   BSO(2) has the one degree2 Euler generator, with p₁=e². There is no
   independent degree0 Euler polynomial variable in rank0.

   This item consumes C1–2, C3.1–4 and AT4/AT6.0–6.1's CW compactness,
   cochains and Milnor sequence, independently of C3.5's Spin
   obstruction, C4–5's curvature/Borel theorem and all bordism operations
   or coefficient calculations. Prove it directly from the universal sphere
   bundle `S^(n−1)→BSO(n−1)→BSO(n)` for n≥2 and C2's Gysin sequence.
   Use its actual associated-sphere total space on C1's universal principal
   SO(n) bundle. Prove SO(n)/SO(n−1)≃S^(n−1) for the last-column
   action and consume C1.1's subgroup-associated fibration comparison with
   BSO(n−1), rather than declaring every chosen classifier map a bundle.
   In even rank, the degree induction gives vanishing odd cohomology,
   regularity of multiplication by e and the quotient by e equal to the
   previously computed odd-rank ring; lift its pᵢ and prove generation and
   independence degree by degree. For the odd-rank base2r+1 with r≥1, its even-sphere
   bundle pulls the universal even-rank Euler class back to the Euler
   class of TS^(2r), with fiber evaluation2. After inverting2, this class/2
   and1 are the Leray–Hirsch basis, so base pullback is injective. The
   fiberwise antipodal map of this actual associated even-sphere bundle
   covers the identity of BSO(2r+1). Its vertical-tangent comparison
   reverses the oriented2r-plane, so it acts on the even-rank total ring by
   e↦−e and fixes every pᵢ. Its fixed subring is the polynomial subring in
   p₁,…,p_(r−1),e²; those are pullbacks of the actual odd-rank pᵢ, proving
   the image equality. Only this order2 involution is used, not averaging
   over a Weyl group whose order may be divisible by an odd prime.
   The n=2 Gysin sequence with contractible BSO(1) starts this induction.
   Compare BU(1)=BT¹→BSO(2) through the standard complex-line realification:
   C3.2's c₁=e identifies its degree2 generator and C1.5 pins x=−h.
   Pin the sphere/Thom/generator maps by C2's ordinary orientation convention.

   Prove each integral cohomology degree is finitely generated using C1's
   finite Grassmannian/Stiefel approximations. The localized ring has no
   torsion, so all integral BSO torsion is2-primary. Prove the actual
   coefficient-change/UCT comparison and vanishing of its Tor term at
   every odd prime p. Compare the R=F_p induction with integral coefficient
   reduction, not a second ring construction. Export the finite-rank and stable polynomial rings
   over F_p, with the same actual class generators and degree conventions.
   Stabilization restricts pᵢ to pᵢ and discards classes above rank; include
   both parity steps and the Euler-square relation. The stable comparison
   consumes TopK T1.6a's weak-CW union on the stable BSO carrier and
   C1.1a's oriented lift, new positive line first, of T1.5's rank map.
   Use the standard zero-based flag, with e_i=Pi.single i 1 and rank map
   V↦ℝe₀⊕shift(V); its underlying image is the closed Schubert subcomplex
   with first pivot in Fin position0. These lifted cells belong to C1.1a,
   and the fixed-rank and stable colimits belong to TopK T1.6a. The
   stable union uses only TopK T1.6's fixed cellular tower. Compact singular-simplex images lie in finite CW
   subcomplexes by AT4, hence in a bounded-rank stage. Therefore the stable
   singular chain complex is their direct union and its cochains are the
   inverse limit of the fixed-rank cochains, with surjective restrictions
   proved by extension by zero on the singular-simplex basis. Apply
   AT6.0's Milnor sequence and the Gysin stable range to show eventual
   degreewise stabilization and lim¹=0, retaining multiplicativity and
   independence of the chosen compatible CW structures.

   Pin T^r→SO(2r) as U(1)^r⊂U(r) realified in the ordered coordinates
   (ε_j,iε_j)↦(e_(2j),e_(2j+1)) for j:Fin r, with zero-based
   coordinate vectors and blocks
   [[cosθ,−sinθ],[sinθ,cosθ]]. In odd rank prepend the positively oriented
   trivial coordinate. Define x_j as c₁ of its coordinate character's
   associated complex line, oriented by its complex structure; C1.5 fixes
   x_j=−h_j. Prove `bsoTorusRestrictionPontryaginEuler`:
   restriction sends pᵢ to the i-th elementary symmetric polynomial in
   x₀²,…,x_(r−1)² and e to ∏_(j:Fin r)x_j in even rank, with the ordered-plane
   orientation retained. The odd-rank trivial summand carries its canonical
   orientation. These formulas and polynomial independence prove
   `bsoTorusRestrictionModOddPrime_injective` for every odd p, including
   finite rank and the compatible stable torus system. The even-rank
   stabilization prepends the new oriented2-plane, so T^r→T^(r+1)
   sets the first coordinate to1 and shifts the old coordinates. Pullback
   kills x₀ and sends x_(j+1) to x_j; the even→odd step is the
   identity on T^r with its first trivial coordinate. The stable target is the degreewise
   inverse limit of H*(BT^r;R); for example its p₁ restriction
   is the compatible sequence Σ_(j:Fin r)x_j². It is not the finite-support
   polynomial ring in infinitely many degree2 root variables. Prove coefficient,
   orientation-reversal and subgroup/stabilization naturality. This is a
   theorem for these orthogonal groups, not a general mod-p Borel theorem.

## C4. Curvature classes and their integral comparison

1. Define Ad-invariant homogeneous symmetric polynomial forms on the actual
   Lie algebra, with product, polarization, pullback by Lie homomorphisms and
   finite matrix evaluation. Apply them to curvature using DG's value-bundle
   wedge/composition and SBC's principal curvature. Prove horizontal/invariant
   descent, closedness from Bianchi, and connection independence by the affine
   connection path and explicit transgression form. Prove gauge invariance,
   functoriality, product/Whitney and real/complex comparison identities.
2. Construct Chern, trace-character, Pontryagin and Pfaffian forms with the
   normalizations above. Prove the rank-one singular/de Rham comparison using
   SBC B6; on a smooth projective flag compare with split line connections,
   use connection independence and cohomological flag injection, and obtain
   exactly the real images of C3's Chern and Pontryagin classes. C5.5 proves
   the Euler/Pfaffian comparison after oriented real splitting. Curvature
   comparison retains the distinction between an integral class and its real image.
3. Construct the universal Chern–Weil map degreewise on C1's finite smooth
   Stiefel approximations; prove stable-degree compatibility, independence of
   universal connection and agreement with smooth-bundle pullback classes.
   Do not apply ordinary manifold de Rham cohomology directly to BG.
   Prove all comparison squares for cohomology coefficients, connections,
   orientation, realification and complexification.

## C5. Compact-Lie restriction and universal rational rings

1. Prove Chevalley restriction `I(G)≃Sym(t*)^W` for compact connected G. The
   injective direction uses conjugacy into a maximal torus. Identify group
   invariance with infinitesimal invariance using connected generation by
   exponential neighbourhoods before applying the Lie-algebra theorem. Consume
   [LieGroups Layer5A and Layer6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0942b6c99c9c9baff3c962bc672bcaab81baff48/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md)
   for compact reductivity, the invariant positive form, center/semisimple
   orthogonal splitting and negative Killing comparison, the identification of
   t_ss,C as a Cartan subalgebra, and the actual root-pairing isomorphism with
   LieHighestWeight's rootSystem, preserving geometric Weyl action and center.
   This item owns transport of those supplied maps through invariant polynomial
   functions and their restriction square, rather than a second construction of
   compact reductivity or the Cartan/root dictionary. For surjectivity
   consume [LieHighestWeight L7](https://github.com/TauCetiProject/TauCetiRoadmap/pull/949)'s generic Lie-algebra Chevalley supplier.
   Its `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`,
   `lieChevalleyRestrictionIso` and `lieChevalleyRestrictionIso_coe`
   give the actual restriction isomorphism for the semisimple complex
   summand. Consume `lieChevalleyRestrictionIso_mem_homogeneous_iff`
   for its degreewise compatibility; transport that supplied restricted
   map through the invariant-form and geometric/root-data identifications
   above. Consume `killingSymmetricEquiv_cartan_restriction` to pass from
   L7's Sym(g) model to invariant polynomial functions Sym(g*), consuming
   `killingSymmetricEquiv_lie` for the corresponding infinitesimal invariants. Compare the
   Haar-invariant positive form with the semisimple Killing identification
   by the actual equivariant scalar on each simple factor, retaining that
   commuting Cartan-restriction square; treat the reductive central tensor
   factor separately. L7 constructs these generic Lie-algebra targets independently
   of C5. This item owns the compact-group versus infinitesimal invariants
   comparison, transport of the supplied geometric Cartan/root-data maps, tensor factor for
   the reductive centre, and finite-degree real descent.
2. Prove the torus Chern–Weil map is an isomorphism with H*(BT;R), with each
   integral character giving its normalized degree2 class. For connected G,
   on finite approximations use `E_m/T→E_m/G`, its oriented fibre G/T, and
   C2's Euler-weighted fibre integration to prove injectivity of restriction.
   Prove the Euler integral of G/T equals |W| by the regular-torus vector
   field: zeros are Weyl cosets and every local index is +1 from its root-plane
   determinant. C2.3 also identifies it with χ(G/T); the injectivity argument
   needs only the nonzero Euler integral. Inner
   conjugation acts trivially on BG cohomology, so the image is W-invariant.
   The Chevalley/torus square then proves both universal Chern–Weil and
   Borel `H*(BG;R)≃H*(BT;R)^W`. This is the proof spine of Dupont1978 §8.
3. For disconnected compact G prove π₀(G) finite and
   `H*(BG;K)=H*(BG⁰;K)^π₀(G)` for K=Q or R by the finite-cover/transfer model of
   C1's universal bundle. Compare with invariants of I(G⁰). For a torus of
   G⁰ construct the extended normalizer group and its finite-component
   action, rather than treating a disconnected group as connected. Descend
   the rational statement by the integral character lattice, finite-degree
   base change and exact finite-group averaging. No integral or mod2 Borel
   invariant theorem follows by this argument.
4. Consume C3.4's integral BU ring and C3.6's BSO rings after rational
   coefficient change; compare their inclusions/root restriction with
   items1–3's Chern–Weil/Borel construction. Compute the rational BO ring
   by its determinant-component action and item3's finite-cover transfer.
   For r≥1 the consumed BSO formulas are
   `H*(BSO(2r);Q)=Q[p₁,…,p_(r−1),e]` with p_r=e²,
   `H*(BSO(2r+1);Q)=Q[p₁,…,p_r]`.
   The determinant-component calculation gives, for all n≥0,
   `H*(BO(n);Q)=Q[p₁,…,p_floor(n/2)]`.
   Prove the actual Weyl actions: all sign changes for O(n) and SO(2r+1),
   even sign changes for SO(2r), and the determinant component
   sends e to −e. Treat rank0 and rank1 separately, with Euler1 for the canonically oriented zero bundle.
   Real oriented 2-plane root splitting is an injective
   rational pullback with a proved map; it is not an integral splitting law.
   Apply C3.6's direct-union/cochain/Milnor argument to TopK T1.6's
   unoriented stable Grassmannian, with the same pinned prepend-line rank
   map on unoriented Schubert cells and the rational stable range from
   the transfer. The stable BSO ring and
   coefficient/stabilization comparison are consumed from C3.6.

5. Pull an oriented real bundle to its associated oriented-plane flag and
   use item2/C2.6 to prove rational injectivity on any displayed base. Prove
   the Pfaffian product on ordered 2-plane curvature blocks, compare each
   plane with its complex line and B6 normalization, and descend to identify
   C4's Pfaffian class with the real image of the integral Euler class.

## C5a. Compact Lie cohomology, invariant forms and universal transgression

Work with a compact connected finite-dimensional smooth real Lie group K, on
its actual Hausdorff second-countable boundaryless manifold, and write g for
its Lie algebra. Include the trivial group and rank0. Use C1's same right
principal universal bundle EK→BK and its actual finite smooth principal
approximations; the infinite join and BK are not smooth manifolds. All general
exterior and primitive statements below have coefficients Q or R. Their
integral and positive-characteristic analogues are not inferred by scalar
change. An integral class, its rational image and its de Rham representative
remain distinct objects.

**C5a.1. The compact invariant-form comparison.** Consume
[LieGroupoidsPoisson G1.3a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4391caecad1cd4979caa27e490e2bbfd69598d81/TauCetiRoadmap/LieGroupoidsPoisson/README.md)'s
all-degree real CE complex, including its scalar trivial-module comparison,
and DG's smooth alternating forms, wedge, d, pullback and Cartan homotopy
formula. Construct the left-trivialization map
`j:CE^q(g;R)→Ω^q(K)` by
`j(a)_k(v_1,…,v_q)=a(dL_(k⁻¹)v_1,…,dL_(k⁻¹)v_q)`.
Prove that its image is exactly the left-invariant forms, with inverse
evaluation at the identity; prove the linear, wedge, unit, differential and
Lie-homomorphism pullback identities. The trivial-coefficient CE convention is
`(da)(X_0,…,X_q)=Σ_(i<j)(−1)^(i+j)a([X_i,X_j],X_0,…,omit X_i,…,omit X_j,…,X_q)`,
where the remaining arguments retain their order. In degree1 this is
`da(X,Y)=−a([X,Y])`. Compare with native
`LieModule.Cohomology.d₁₂_apply_apply_ofTrivial` and LGP's all-degree maps;
do not construct a second generic CE complex here.

Consume CompactGroups Layer0's normalized bi-invariant Haar probability.
Define `A_forms:Ω^q(K)→Ω^q(K)` by
`A_forms(ω)=∫_K L_g*ω dg`, pointwise in the finite-dimensional alternating-form
fibre. Prove smoothness in the base variable and all parameter derivatives,
compatibility with chart changes, linearity, `A_forms∘d=d∘A_forms` and
left-translation invariance of its image. Let ev1 denote degreewise evaluation
at the identity and define `A_CE=ev1∘A_forms:Ω^q(K)→CE^q(g;R)`.
Evaluation alone is not asserted to be a cochain map on arbitrary forms.
Prove `A_forms∘j=j`, `A_CE∘j=id_CE`, `j∘A_CE=A_forms` and
`A_CE∘d=d_CE∘A_CE`. Prove compact-parameter differentiation under these
finite-dimensional integrals in local charts, with uniform bounds on each
compact parameter/base set. The full space Ω^q(K) is not asserted
finite-dimensional or a Bochner target. Prove the analogous smooth
finite-parameter identities needed by the following homotopy.

Construct `H:Ω^q(K)→Ω^(q−1)(K)` with
`dH+Hd=A_forms−id_Ω=j∘A_CE−id_Ω` (H=0 in degree0).
Cover the group parameter by finitely many exponential neighbourhoods U_i.
For their centres choose fixed smooth paths from1; concatenate with the
smooth local exponential paths to g∈U_i, using fixed endpoint-flat time
reparametrizations. Construct the Cartan homotopies H_(i,g) between id and
L_g*, with all g derivatives on U_i. Choose a smooth partition ρ_i in the
group parameter, supported inside U_i, and integrate the zero-extended
ρ_i(g)H_(i,g). Prove the extension, integral and cochain identities. No global
continuous path choice1→g is assumed. Thus j induces a natural de Rham
cohomology **ring** isomorphism and, through DG's de Rham map with its proved
cohomology product comparison, an actual singular-cohomology comparison over R.
A_CE is a linear cochain inverse to j up to homotopy. Neither A_forms nor A_CE
is asserted multiplicative on arbitrary forms. Retain compatibility with
Lie-group homomorphisms at the inclusion and cohomology levels; Haar averaging
for two different groups is not claimed to commute on arbitrary forms under
every homomorphism.

Also construct finite-dimensional Ad averaging on the CE pieces. Prove
that conjugation by k acts trivially on CE cohomology by the preceding
natural comparison and a path from1 to k; this uses no globally varying
choice of such a path. Commutation of finite-dimensional quotient maps
with averaging shows that inclusion `CE(g)^K→CE(g)` induces a cohomology
isomorphism. Prove algebraically that the differential on the invariant
trivial-coefficient tensors is zero: in a basis prove
`2d=Σ_a e^a∧L_(e_a)` and use connectedness to pass between group and
infinitesimal invariance. Retain the basis-independent equality and degree0.
This identifies the invariant CE target used in C5a.4 with the full CE
cohomology; it is not an unstated replacement of that complex.

Deduce `H¹(K;R)=ann([g,g])⊂g*`, with the actual evaluation and bracket maps.
Compare degree-one Hurewicz and the topological-group abelianness of π1 with
`H¹(K;R)=Hom(H_1(K;R),R)`; an identification of H_1 with its dual requires a
chosen pairing. For a compact Lie algebra with zero centre, prove that there
are finitely many **connected** compact global forms: use the adjoint group,
this vanishing, finite generation of its integral H_1, degree-one Hurewicz,
and LieGroups' universal-cover/central-quotient classification. Disconnected
products with arbitrary finite groups are not included in this finiteness
claim.

**C5a.2. Actual invariant generators and the rational structure.** Consume
[ReflectionInvariantTheory §§1–3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ba65e6647efb7064b63960dac02437b095fb9989/TauCetiRoadmap/ReflectionInvariantTheory/README.md)'s early graded polynomial evaluation
isomorphism, regular-sequence and coinvariant interfaces for the actual Weyl
action on the maximal-torus character representation. These early interfaces
use no BG, compact cohomology, Schubert geometry or transgression theorem.
Transport their homogeneous basic generators through C5.1's actual
restriction isomorphism. Construct their products, homogeneous components,
augmentation ideal I_+ and indecomposables `QI=I_+/(I_+)²`, and prove the
basis/change-of-generators and coefficient-change maps. If the basic
generators have polynomial degrees d_i≥1, give them cohomological weights
2d_i. The number of generators is rankK. Carry the fixed central directions
as degree1 generators, and assemble the semisimple factors componentwise.

For rational coefficients use the actual character lattice
`X*(T)⊗_Z Q` and its Weyl action, not an assumed rational form of g. Its
character generator maps to that character's actual integral degree2 class
on BT. After real scalar change the associated linear polynomial on t is
`(i/(2π))dχ` in the existing unitary convention; for
`θ↦exp(iθ)` it is `−a/(2π)`. Prove the diagram with C1.5, C4 and C5.2–3,
including independence of character bases and compatibility with the
geometric/abstract Weyl comparison from LieGroups. This defines the rational
structure on the invariant-polynomial algebra used here. The resulting
`u_i∈H^(2d_i)(BK;Q)` are the actual C5 universal classes; their real images
are `cw(P_i)`. Basic generators are choices; QI, the comparison maps and the
multiset of degrees are intrinsic. The regular-sequence and polynomial
presentation used below must be the supplied maps, not a count of degrees.

**C5a.3. The Weil differential and normalized transgression forms.** Construct
the graded-commutative Weil algebra
`W(g)=Sym(g*[2])⊗Λ(g*[1])`, with polynomial generators Ω in degree2 and
exterior generators θ in degree1, on the native symmetric/exterior and
graded tensor carriers. Define the bracket of g-valued forms with its wedge
and graded signs. Specify the differential by
`d_Wθ=Ω−(1/2)[θ,θ]`, `d_WΩ=−[θ,Ω]` and graded Leibniz. Define contraction
`ι_Xθ=X`, `ι_XΩ=0` and Lie derivative `L_X=d_Wι_X+ι_Xd_W`.
Prove basis independence, d²=0, the Cartan relations, functoriality under Lie
homomorphisms and the augmentation. Identify the horizontal invariant
subalgebra with I(g), in doubled degrees, using the actual inclusion P↦P(Ω).
Prove its differential is zero.

Prove W(g) augments quasi-isomorphically to R. Begin with the linear Koszul
differential `d_0θ=Ω,d_0Ω=0` and its Euler contraction, dividing by the positive
polynomial-plus-exterior count on every nonconstant monomial. Construct the
perturbation by the bracket term. Prove that the finite homotopy-perturbation
sums terminate in each degree by their increasing exterior filtration,
bounded by dim g; prove the contraction identities, with no completion or
unproved convergence. Prove equivariance or average the finite-degree
contraction with Haar before restricting to invariant tensors. Consequently
`W(g)^K` has only its degree0 cohomology. This total acyclicity is not a
quotient or base-change theorem.

For homogeneous invariant P of polynomial degree d≥1, use its existing
polarization B_P with `P(X)=B_P(X,…,X)` and define
`CS_P=(degree P)·∫_0^1 B_P(θ,F_t,…,F_t)dt`,
`F_t=tΩ+((t²−t)/2)[θ,θ]`.
The integral is a coefficientwise polynomial integral on [0,1]. Prove
`d_W CS_P=P(Ω)`, its degree2d−1, pullback naturality, and the precise
product/decomposable correction. Setting Ω=0 gives a CE cocycle τ(P).
Construct the corresponding map on QI; prove that changing P by a
positive-degree product changes this cocycle by an explicit coboundary.
Do not insert an additional d!,2π or i factor: those normalizations are
already in B_P and in P. Prove the rank-one formula
`τ(−a/(2π))=−θ/(2π)` for the positive real Maurer–Cartan coordinate of the
circle.

For an actual connection a on a finite principal approximation E_m→B_m,
construct the evaluation `θ↦a, Ω↦F_a` as a map of differential graded
algebras, with its horizontal/basic and pullback comparisons. Prove the
connection-path homotopies and compatibility with increasing finite
approximations in each stable degree. Restriction to a positively identified
right fibre gives the same Maurer–Cartan and CE sign. This uses SBC's
connections and C4's finite universal map; there is no de Rham complex on
the infinite join being silently substituted.

**C5a.4. The filtered Cartan–Koszul comparison.** Prove the compact reductive
Cartan transgression theorem as an actual construction on the preceding
Weil and CE complexes. For chosen basic P_i form
`K_I=I(g)⊗Λ(e_i)`, `|e_i|=2d_i−1`, `D(e_i)=P_i`, `D(P_i)=0`.
Construct the map to `W(g)^K` sending e_i to CS_(P_i) and the polynomial
factor to its basic inclusion. Prove the Koszul sign rule, filtration maps,
augmentation, change-of-basic-system and functoriality statements. Prove the
regular-sequence Koszul resolution and identify its successive quotients
with explicit bases, including the empty generator system.

Own the required **augmentation/base-change comparison**: after quotienting
the basic augmentation ideal, prove that setting Ω=0 from
`W(g)^K/I_+W(g)^K` to the invariant CE complex is a quasi-isomorphism;
prove that the induced map from `K_I/I_+K_I=Λ(e_i)` is a quasi-isomorphism.
These are not consequences of the two unfiltered total complexes being
acyclic. Construct their filtered comparisons by finite invariant-tensor
splittings from the invariant positive form, the linear Koszul contraction,
and successive homogeneous invariant-polynomial division. Prove the needed
closed-image/direct-sum and exactness statements in each finite-dimensional
bigraded piece and the termination of the elimination. The key elimination
lemma must identify the surviving classes with the restrictions τ(P_i),
show that products of basic invariants give boundaries, and construct a
contracting homotopy on the complementary summands. Include the reductive
central tensor factor and the complexified semisimple/real descent maps;
no separation-of-variables or harmonic-decomposition assertion is imported
without constructing the precise tensor splitting used by this lemma.

Deduce `Λ(τ(P_i))≃H^*(CE(g;R))` with actual product and graded-generator
maps. Prove the transgression map `QI→H^*(CE)` is injective and identifies its
image as the primitive subspace under the cohomology Hopf structure in the
next item, and that exterior products of these images give all cohomology.
The primitive assertion is established by that item's actual multiplication
comparison, not by an asserted CE coproduct. The comparison theorem,
elimination lemma and contraction just specified are construction targets
of this item; a conditional theorem assuming those conclusions does not
discharge them.

**C5a.5. Actual cohomology Hopf maps and universal Serre transgression.** On
singular cohomology use the continuous space maps multiplication, unit and
inversion of K, and the existing cross-product/Künneth isomorphism over Q or
R. Prove graded Hopf laws, Koszul tensor signs and naturality under Lie-group
homomorphisms. Use compact finite-dimensional cohomological finiteness for
the direct-sum Künneth identifications. Group multiplication is not a group
homomorphism when K is nonabelian; `(X,Y)↦X+Y` is not a Lie-algebra
homomorphism in that case. No strict CE Hopf coproduct is asserted.

Construct the pullback of the transgression forms by multiplication using
its actual Maurer–Cartan identity and the two-connection simplicial
Chern–Simons homotopy on K×K. Prove, with an explicit correction form, that
`m*τ(P)−pr_1*τ(P)−pr_2*τ(P)` is exact. Compare the resulting primitive
classes with the singular Hopf structure through the multiplicative de Rham
and cross-product comparison. Together with C5a.4 obtain the actual real
graded Hopf isomorphism from the exterior algebra on these primitive
classes, with each generator in degree2d_i−1. There is no claim that the
chosen averaging map respects multiplication or the coproduct on forms.

Construct DGFloer Layer1.2's multiplicative cohomological Serre target and apply it to
`K→EK→BK` on C1's same numerable model, with local coefficients and their
trivialization proved from connectedness (`π1(BK)=π0(K)=0`). Use
`d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` and compare with the filtered finite
connection/Weil models in every bounded total degree. Construct the actual
relative cochain representatives and boundary comparison that identify the
CE cocycle τ(P_i) with a universally transgressive class and its differential
with cw(P_i). Prove the sign by that cochain comparison and the circle test;
do not change DGF's differential convention to fit an unspecified sign.

At the successive pages the equation is
`d_(2d_i)(z_i)=u_i` modulo the ideals already killed by earlier generators,
with the corresponding surviving fibre representatives. Record choices and
triangular changes among generators of the same degree and additions of
decomposables. Prove the tensor-product/Koszul page calculation with the
actual regular sequence, strong degreewise convergence and augmentation to
H^0(EK)=Q or R. The primitive, polynomial and transgression maps form one
commuting comparison; matching dimensions or total acyclicity alone is not
its proof. Include naturality under homomorphisms, finite central covers,
products and coefficient change, at the indecomposable/primitive level
rather than claiming a natural basis of generators.

Descend to Q by C1's degreewise finite-generation and C5.3's actual rational
character-lattice comparison, the singular Q→R maps, and the rational Serre
page comparison. Prove that `QI_Q→Prim H^*(K;Q)` realifies to the map just
constructed; this supplies rational periods and the rational exterior Hopf
isomorphism. Do not posit a rational Lie-algebra form or take a
Q-valued differential-form integral. The general formula is
`H^*(K;Q)=Λ_Q(z_1,…,z_r)`, `|z_i|=2d_i−1`, and its real scalar extension.
It does not imply that integral cohomology is torsion free.

**C5a.6. Same-model topology and scope comparisons.** Using C1's subgroup
associated fibrations on the same EK, construct
`K/T→EK/T→BK`, `K/N(T)→EK/N(T)→BK`, and the free finite covering
`EK/T→EK/N(T)` with deck W. Prove the universal-bundle comparison maps with
BT and BN, not a new classifier. Consume SchubertGeometry S9.6's rational
acyclicity of K/N(T) and finite-cover transfer, and use the DGF cohomological
Serre comparison constructed by the earlier C5a.5 target to recover the BN proof of
`H^*(BK;Q)≃H^*(BT;Q)^W`. Compare its **maps** with the already independent
C5.2–3 Borel theorem. This application does not enter the proof of C5.2 or
SchubertGeometry's acyclicity. Distinguish the finite W cover BT→BN from
the homotopy fibration BT→BN→BW arising from T→N→W.

Prove that a finite central cover of connected compact groups induces a
rational/real Hopf isomorphism, using deck translations homotopic to the
identity, transfer and the actual covering maps. Combine with LieGroups'
finite central cover by a torus times compact simply connected simple
factors; preserve its lattices and finite kernel. Prove the Poincaré series
`P_K(t)=∏_i(1+t^(2d_i−1))`, total Betti number2^rankK and top degree
`Σ_i(2d_i−1)=dim K`, using the actual central and root-plane dimensions.
For positive-dimensional connected K the Euler characteristic is0; the
trivial group has Euler characteristic1. Compare the nonzero top exterior
product with a chosen Lie-group orientation and its fundamental class,
recording the resulting nonzero scalar rather than asserting an uncomputed
positive normalization. For a disconnected
compact group apply the preceding theorems to K^0, describe componentwise
ordinary cohomology and the multiplication/conjugation maps, and retain
C5.3's separate component-invariant BG theorem. Averaging over all
components is not a quasi-isomorphism onto left-invariant forms on a
disconnected group. Do not extend the connected exterior-Hopf or global-form
finiteness assertion to it.

**C5a.7. Degree and normalization calculations.** Derive, through the actual
invariant-generator and universal-class maps,
`H^*(BU(n);Q)=Q[c_1,…,c_n]`, degrees2,4,…,2n,
and `H^*(U(n);Q)=Λ(z_1,z_3,…,z_(2n−1))`;
for SU(n), n≥1, the ordinary invariant degrees are2,…,n, so the
polynomial generators of H^*(BSU(n);Q) have cohomological degrees4,6,…,2n
and the exterior generators of H^*(SU(n);Q) have degrees3,5,…,2n−1. Prove the determinant/central-circle maps and their effects on
the normalized degree1/degree2 generators. Include U(0)=SU(1)=pt,
U(1)=S1 and SU(2)=S3, the U(2) degrees1,3, the U(1), U(2), U(3)
calculations and the first three odd generators1,3,5 for U(n) when n≥3. For these unitary groups additionally construct the integral
exterior generators by the actual last-column sphere fibrations and the
integral multiplicative Serre/Gysin comparisons, proving torsion freeness
and matching the integral Chern transgressions. Do not infer this integral
result from the general rational theorem or identify a homotopy-sphere
generator with a homology generator without its Hurewicz degree.

For tori use C1.5's actual CP∞ products, standard character −h and the dual
character +h; match the degree1 Maurer–Cartan integral and degree2
transgression with those signs. For compact simple factors consume the purely root-theoretic
[ReflectionInvariantTheory §4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ba65e6647efb7064b63960dac02437b095fb9989/TauCetiRoadmap/ReflectionInvariantTheory/README.md) degree/exponent convention `e_i=d_i−1`, and hence
odd degrees2e_i+1; central directions have d=1 and e=0. Keep the single
Coxeter number only for an irreducible semisimple factor, and use
componentwise formulas on reducible groups. Verify the E8 eight-entry
exponent list `1,7,11,13,17,19,23,29` gives odd degrees
`3,15,23,27,35,39,47,59`; no seven-entry list is used.

Retain the separate integral SU(2) normalizer comparison
`SU(2)/N(T)=RP²`, with H^0=Z and H^2=Z/2, from SchubertGeometry S9.6;
it tests why rational acyclicity is not integral acyclicity. Include the
strict-upper-triangular exercise only with n≥3 (n=1 trivial); n=2 is an
abelian one-dimensional counterexample to an unqualified centre-in-derived
claim. These exercises consume the actual bracket and low-degree CE maps.
The KKS root-plane Hessian/Morse comparison is a symplectic application at
the HamiltonianReduction/SchubertGeometry boundary, not a prerequisite for
the constructions here or an additional generic characteristic-class owner.

## C6. Multiplicative series, Chern character and the Thom correction

1. Construct universal multiplicative sequences from rational constant1 power
   series through symmetric-polynomial/root descent, both actual bundles and
   virtual classes. Use Mathlib PowerSeries and its Bernoulli/exponential API. Td multiplies
   over the Chern roots of a complex bundle. L and Â multiply over one root
   per oriented real 2-plane, `p(E)=∏(1+x_j²)`, with a trivial line in odd
   rank; their even series descend to the elementary symmetric polynomials
   in x_j². They are not products over both ±x_j roots of E_C. Extend Td
   on complex K and L/Â on real KO by the rational Whitney laws.
   Define `Td(x)=x/(1−e^(−x))`, `Â(x)=(x/2)/sinh(x/2)` and `L(x)=x/tanh x`
   as regular formal series, with the displayed quotients proved by multiplying
   their denominators. Build coefficient extraction, degreewise products,
   inversion, substitution, normalization and truncation. Prove pullback and
   rational Whitney identities; virtual λ_(−1) is not an evaluation of an
   arbitrary infinite λ-series at −1.
2. Construct `ch_j(E)` as the rational Newton polynomial in integral c_i,
   normalized by j!, with ch₀=rank. Prove root exponentials, additivity,
   multiplicativity, dual/conjugate and line-twist identities using C3's
   integral flag theorem. Descend by TopK's actual SplitK0 universal/ring
   properties; ch(pt) is Z→Q. Construct relative ch using the doubled-space
   kernel comparison of TopK T7.4 and the corresponding singular-cohomology
   kernel isomorphism, so the gluing isomorphism remains part of the class.
   For an arbitrary compact closed pair first replace it by its compact
   mapping-cylinder pair, prove K and singular-cohomology comparison with the
   original pair, and use its collar/cofibration to justify doubled-space
   excision. Do not assert singular excision for an arbitrary closed inclusion.
   Prove absolute-relative module and same-pair product compatibility for every
   compact pair. Prove multiple-relative/internal or external union-pair product
   compatibility only for the excisive couples of C1.2, with their small-chain
   comparisons; naturality and connecting-map compatibility remain valid for
   every compact closed pair. Prove the compact-support colimit comparisons.
   For a locally compact Hausdorff X and a representative exact off a compact
   K, choose K inside the interior of a compact neighbourhood K', form the
   closed compact pair `(X⁺,X⁺\int K')`, and retain its relative representative.
   Excision of infinity is then justified because infinity lies in the interior
   of the relative subset; compare with H*(X,X\K') and pass to compact-support
   colimits. Do not identify H*(X⁺,∞) with H_c*(X) for arbitrary X.
   For the continuous representation ring K_G(pt), construct the universal
   associated-bundle character into Hhat_even(BG;Q), degree by degree on C1's
   finite approximations; prove restriction and products
   and character-root compatibility without introducing ordinary K(BG).
3. Construct suspension-degree characters. Orient R by increasing t and
   let U_R∈H¹(I,∂I;Q) satisfy ∫dt=1, with boundary signs (−0,+1).
   Define cohomological suspension by right external product `a↦a⊠U_R`;
   iterate the ordered coordinates x then y, matching `(x,y)↦x+iy`.
   Retain the graded periodic target
   `Hper^n(X)=Π_(j∈Z,n+2j≥0) H^(n+2j)(X;Q)·v^j`, |v|=−2.
   Define ch in negative degrees by this suspension and extend all degrees
   using ch(u)=−v; forgetting v in degree0 gives the completed-even character.
   Use TopK T3.4/T4.8's named right-suspension and coneBoundary maps. Compute
   the displayed endpoint normalization: if γ∈K^(−1)(I,∂I) suspends to the coefficient u under the
   ordered two-coordinate comparison, prove `δ_K(0,1)=u^(−1)γ` in K¹(I,∂I).
   Prove it from the actual cone representative and coordinate map; then
   `ch^(−1)(γ)=−U_R v` and `ch¹(δ_K(0,1))=U_R`.
   Export `ch∘δ_K=δ_H∘ch` with no unrecorded odd-degree sign. Prove that
   reversing the cone parameter or endpoint order negates both boundary maps;
   retain that sign comparison for transported conventions.
   For the even coefficient use the pinned `(x,y)↦x+iy` orientation of TopK. Its compact-C degree0 representative u=O(−1)−1 has ordinary
   ch(u)=−U_C with the period symbol suppressed; as a degree−2 point
   coefficient its character is −v;
   prove this before the relative Bott comparisons. On finite CW pairs prove
   rational ch is an isomorphism with even/odd rational cohomology by cell
   induction in the mapping-cylinder sequence. State the finite-CW hypothesis;
   ordinary K on an arbitrary compact Hausdorff space is not asserted to be
   rationally equivalent to all its singular cohomology.
4. For the dual-Koszul Thom class of a complex bundle prove
   `ch(Thom_K(a))=Thom_H(ch(a)·Td(E)^−1)`; the zero-section expression is
   ch(λ_(−1)(E*))=∏(1−exp(−x_j)). For the wedge convention prove the correction
   `(-1)^r exp(c₁(E)) Td(E)^−1`, and its point value (-1)^r.
   Construct the universal correction on compact products `(CP^N)^r` and
   pass their degreewise compatible coefficients to Q[[x₁,…,x_r]]. There
   multiplication by ∏x_j is injective, so the zero-section identity determines
   the correction. Pull back by flag classification and descend by injection.
   Do not divide by the Euler class on X, or postulate ordinary K(BT) outside
   TopK's compact-base scope. Prove the relative and supported Thom squares with excisive product hypotheses retained. The displayed formula is
   in completed ordinary cohomology with the period symbol suppressed; for
   the degree0 folded K-Thom map its graded version includes the factor v^r
   multiplying the cohomological Thom map of real rank2r.
5. For embeddings with a specified complex normal bundle prove the
   cohomological/K-theoretic pushforward comparison
   `ch(f!_K a)=f!_H(ch(a)·Td(ν)^−1)` for complex normal ν, with the normal Todd factor,
   support, orientation and composition conventions fixed. This is a Riemann–Roch identity for the constructed
   pushforwards; analytic index equality is a separate consumer.

## C7. Characteristic formulas and acceptance calculations

1. Prove the coefficient formulas
   Td=1+c₁/2+(c₁²+c₂)/12+c₁c₂/24+…,
   L=1+p₁/3+(7p₂−p₁²)/45+(62p₃−13p₁p₂+2p₁³)/945+… and
   Â=1−p₁/24+(7p₁²−4p₂)/5760+… . Export degree-n components and their
   pairing with chosen fundamental classes; signature, Dirac and holomorphic
   index theorems consume these formulas.
   In particular derive the displayed degree12 L₃ identity from C6's
   regular series x/tanh(x), by symmetric-root descent and coefficient
   extraction, with p_j in cohomological degree4j. Include ranks with fewer
   than three oriented-plane roots by setting the absent Pontryagin classes
   to zero. Compare its pairing on a closed oriented twelve-manifold with
   IndexTheory I7.2's signature index formula.
2. Translate the ordered half-spin weights and exterior λ-characters into
   exponential root products. For the ordered roots x₁,…,x_r name the
   summand with an even number of negative half-weight signs S_high⁺; then
   `ch(S_high⁺)−ch(S_high⁻)=∏(exp(x_j/2)−exp(−x_j/2))`. Compare this with
   SpinRepresentations' S⁺=Λ_even and S⁻=Λ_odd: when the exterior vacuum
   has weight −Σx_j/2, its even-minus-odd character is (-1)^r times that
   product. Prove the actual weight-basis identification before transporting
   the formula to a spin bundle; the sign cannot be absorbed silently. Prove the signature half-argument coth expression has the same
   degree4k component as L for a rank4k oriented bundle: for its 2k
   oriented-plane roots x_j∈H², [∏x_j coth(x_j/2)]_(4k)=[∏x_j/tanh(x_j)]_(4k),
   where (4k) means cohomological degree4k, or homogeneous degree2k in the x_j.
   Prove this degree-4k comparison by x_j↦x_j/2 and homogeneous scaling.
   For k>0 the constant terms differ; no general full-series equality is asserted. Real Clifford/chirality and spin-lift constructions retain
   their own geometric owners.
3. Acceptance: construct the projective Euler sequence from the tautological
   line and tangent chart derivatives, proving its bundle exactness; thus CP^n
   has c(TCP^n)=(1+h)^(n+1) and its Euler number is n+1;
   construct the smooth bundle isomorphism from the native tangent bundle
   of S^n to the bundle with fibre x^⊥ by differentiating the ambient
   inclusion, prove its smooth local inverse, and extend by the radial
   normal line to `TS^n⊕ε¹≅ε^(n+1)`. This adapter uses native sphere
   differential calculus, SBC B2 and TopK T1's bundle comparison, before C4–C6.
   Prove oriented TS^n has Euler number1+(-1)^n and p(TS^n)=1. On an oriented
   real plane prove e=c₁ and p₁=e²; odd-rank Euler has the displayed torsion
   qualification, with the universal oriented rank3 bundle
   as a nonzero example: e mod2=w₃≠0 on BSO(3), and pullback to a sufficiently
   large compact approximation preserves this nonzero 2-torsion Euler class.
   For the real tautological line L on RP^4 prove p(L)=1 but
   `p₁(L⊕L)=−β(a)^2≠0`, detecting the integral Whitney correction.
   Include the universal p_r=e² relation, w₂ reduction/central-cover test,
   the rank-one Hopf sign, and a flat torsion circle bundle with nonzero
   integral c₁ and zero de Rham Chern form using SBC B6's lens-space example.
3a. **Real-projective tangent classes and immersion obstruction.** For every
   m≥0 use AT4.6's smooth native real-projective carrier. Transport TopK
   T1.5's tautological line γ along [GeneralizedCohomology G4.0b](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a1d957790d6eeec3bd02001c7fb83bc6d824abd4/TauCetiRoadmap/GeneralizedCohomology/README.md)'s actual
   projectiveRealGrassHomeomorph and rank-one diffeomorphism, including
   their bundle-chart comparison. Consume that item's smooth graph-chart
   upgrade and SBC B2's smooth Hom/dual/sum interfaces. Differentiate
   these charts to construct
   `T(RP^m) ≅ Hom(γ,γ^⊥)`. Identify End(γ) with the trivial real line by
   scalar multiplication and γ* with γ by the Euclidean metric. Prove the
   resulting actual bundle isomorphism
   `T(RP^m) ⊕ ε¹ ≅ γ^(⊕(m+1))`, including its chart overlap comparison.
   From AT4.6's mod2 cellular complex and C1.5's finite-stage cup
   comparison prove restriction from RP∞ is an isomorphism through degree m
   and the finite-stage groups vanish above m. Match the pulled-back
   tautological lines using T1.5–T1.6 to prove w₁(γ)=a and the actual ring
   isomorphism `H*(RP^m;F₂)=F₂[a]/(a^(m+1))`. C3.2's Whitney and
   normalization laws then give
   `w(T(RP^m))=(1+a)^(m+1)`. Export its degree-j components
   `w_j(T(RP^m))=binom(m+1,j) a^j`, with coefficients reduced mod2.

   For a smooth immersion f:M^m→ℝ^(m+q), q≥0, of a closed smooth
   manifold, construct the normal rank-q bundle ν_f over M as the
   orthogonal complement of the image of the injective tangent map.
   Construct its local frames by the constant-rank image construction and
   smooth orthogonal projection in those frames. Use SBC B2 for the smooth
   bundle operations; forget smoothness and apply TopK T1.1's FiniteRankAtlas
   reconstruction and its actual bundle isomorphism to TM and ν_f, using
   paracompactness of the Hausdorff second-countable base. Thus these native
   tangent/normal bundles lie in C3's numerable continuous category. Prove
   the bundle isomorphism
   `TM ⊕ ν_f ≅ ε^(m+q)` induced by df and the complement, and consequently
   `w(ν_f)w(TM)=1`. Define the inverse total tangent class w̄(M) in
   the degree-≤m quotient of H*(M;F₂), prove existence and uniqueness
   using the nilpotent positive-degree ideal, and prove the reusable obstruction:
   for 1≤j≤m, w̄_j(M)≠0 excludes every such immersion with q<j.
   The normal bundle lives over the source M even when f has multiple points.

   For m=2^k, k≥1, compute in the displayed truncated ring
   `(1+a)^(m+1)(1+a)^(m−1)=(1+a)^(2m)=1` and
   `(1+a)^(m−1)=Σ_(j=0)^(m−1) a^j` by characteristic2 Frobenius.
   Thus w̄_(m−1)(RP^m)=a^(m−1)≠0, and RP^m admits no smooth immersion
   into ℝ^(2m−2), whose required normal rank would be m−2.
   Include the cases RP²→ℝ², RP⁴→ℝ⁶ and RP⁸→ℝ¹⁴. This calculation
   consumes C1–C3, AT4.6, TopK T1.1–T1.3/T1.5–T1.6,
   GeneralizedCohomology G4.0b's real carrier/chart comparison, SBC B2 and
   native differential calculus; it precedes the rational curvature and
   genus calculations.
4. Verify ch respects the relative symbol gluing and external tensor blocks
   on the excisive/supported pairs,
   the compact complex Thom point normalization, the inverse Todd correction,
   dimension4 L₁=p₁/3 and the curve Todd class 1+c₁/2. All source formulas
   involving an Euler denominator are justified universally before evaluation.

## Dependency order and references

C1 and C2 precede C3. C3.6's away2/odd-prime rings consume C3.1–4 and
C1–2 and AT4/6's compact-image/cochain/Milnor foundation, before C4–5
and independently of Spin or bordism. C3.5 consumes the native topological spin cover
and [SpinGeometry G4.1a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/eb728c1c5a918754ff785dcfd561aad6185d14a4/TauCetiRoadmap/SpinGeometry/README.md)'s topological carrier adapters; it uses no smooth
refinement. The spin-lift obstruction/torsor consumes C3.5 afterwards.
C4's invariant-form construction and line comparison use
C1–C3 and the smooth suppliers; C5.5 proves the Pfaffian comparison after
rational 2-plane splitting. C5 uses the universal Chern–Weil map of C4, not an assumed
isomorphism, and proves the isomorphism by restriction and fibre integration.
C6 constructs the multiplicative series before its Chern-character and Thom
comparisons; C7's rational coefficient and genus comparisons then use C5–C6.
C7.3a's real-projective and normal-bundle calculation instead uses C1–C3,
AT4.6, TopK T1.1–T1.3/T1.5–T1.6, GeneralizedCohomology G4.0b's real
carrier/chart comparison and SBC B2, independently of C4–C6. The projective cohomology theorem is
independent of K-theoretic Bott/Thom, and the characteristic development has no
analytic-index or generic pseudodifferential prerequisite.

C5a.1 consumes the earlier LGP CE, CompactGroups Haar and DG form/cohomology
interfaces and supplies the compact invariant-form comparison. The early
ReflectionInvariantTheory polynomial/regular-sequence interfaces precede
C5a.2; none consumes compact cohomology. C5a.3 builds the Weil algebra and
finite universal connection maps from C4. C5a.4 owns the invariant-tensor
Cartan quotient comparison and its regular-sequence Koszul model, rather than
assuming a quotient comparison from total acyclicity. C5a.5 then builds
actual cohomology Hopf maps and matches the universal Serre transgression,
with rational descent and all signs. C5a.6's normalizer route compares the
already independent C5 Borel theorem with the existing SG result; it is not
an input to either construction. The integral unitary examples in C5a.7 use
their separate sphere-fibration induction; its exponent lists consume only
ReflectionInvariantTheory §4's pure root-theoretic data. That supplier's late
topological adapters consume these results and are not premises for them.
No KKS moment-Morse application,
analytic index or Floer count enters these compact constructions.

- Milnor–Stasheff, [*Characteristic Classes*](https://aareyanmanzoor.github.io/assets/books/characteristic-classes.pdf), §§9–15,18 and AppendixC, for Thom, Euler, universal classes and curvature; Theorem15.3 records the integral Pontryagin correction.
- Cohen, [*The Topology of Fiber Bundles*](https://math.stanford.edu/~ralph/fiber.pdf), Chapter1 §2.2 and Chapter3 §4.2, for projective tangent bundles and the normal characteristic-class obstruction to immersions.
- Dupont, [*Fibre Bundles and Chern–Weil Theory*](https://data.math.au.dk/publications/ln/2003/imf-ln-2003-69.pdf), §§9–10, for invariant curvature forms, transgression and classical polynomials.
- Dupont, [*Curvature and Characteristic Classes*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/dupont2.pdf), §§4–8, especially §8's restriction/fibre-integration proof and Chevalley appendix, for universal Chern–Weil and disconnected groups.
- Bott–Tu, *Differential Forms in Algebraic Topology*, §§6,11–14,20–23, for fibre integration, Thom and projective splitting.

- tom Dieck, [*Algebraic Topology*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/diecktop.pdf), §9.5 for arbitrary-space connected-map chain compression, §§13.1–13.3 for countable partition reduction and numerable local-to-global homotopy equivalence, §14.4 for the strong Milnor join and universal bundle comparisons.

- May, [*A Concise Course in Algebraic Topology*](https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/Peter-May-A-Concise-Course-In-Algebraic-Topology.pdf), Chapter16 §§2–3, for the nondegenerate-simplex CW realization and counit weak equivalence via relative simplicial approximation.
