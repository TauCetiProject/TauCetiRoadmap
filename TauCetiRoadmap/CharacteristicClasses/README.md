# Roadmap: characteristic classes and Chern–Weil theory

**Summary.** Build integral Chern, Pontryagin and Euler classes, mod2 Stiefel–Whitney classes,
cohomological Thom and Gysin maps, universal cohomology calculations, and the
comparison with curvature. Construct the compact connected Lie-group CE/de Rham,
primitive/exterior and universal-transgression comparisons on these same
cohomology and universal-bundle carriers. Construct the rational Chern character and the
Todd, L and Â multiplicative classes, including their relative and supported
interfaces. Classes carry their coefficient ring, degree, orientation and
bundle; formal roots are a proved splitting device.

## Scope and ownership

This roadmap owns the topological characteristic classes of real and complex vector bundles and
of principal bundles, and their comparison with curvature:

- C1: universal principal bundles of Hausdorff topological groups over CW bases and of compact
  Lie groups over paracompact bases, finite faithful representations and finite smooth universal
  approximations, trivializations and clutching, the support excision and collared-pair triangle
  of C1.2a S5, the singular counit and the Čech/singular comparison on spaces of CW type
  (C1.2b), the line classes, the Eilenberg–MacLane identifications of RP∞ and CP∞, and the
  classification of line bundles;
- C2: Thom and Euler classes, the Gysin sequence, the Euler class as primary obstruction, the
  Euler number `⟨e(TM),[M]⟩=χ(M)`, embedding Gysin maps and fibre integration;
- C3: Leray–Hirsch, Stiefel–Whitney, Chern and Pontryagin classes defined by projective
  relations, the integral Bockstein classes W_k, the universal rings of BU(r), BO(n) and BSO(n)
  mod 2 and away from 2, partial-frame obstructions, and w₂ as the spin obstruction;
- C4 and C5: Chern–Weil forms, the universal Chern–Weil map, compact-Lie Chevalley restriction,
  and the rational universal rings with Borel's theorem;
- C5a: the real and rational cohomology of compact connected Lie groups through invariant forms,
  the Weil algebra and universal transgression;
- C6 and C7: multiplicative sequences on bundles, the Chern character and its Thom correction,
  the characteristic-number formulas and the acceptance calculations.

The labels C1–C7 and C5a, and the item labels C1.0, …, C7.AdjointHopfObstruction, are the ones
other roadmaps cite; every heading below carries its label.

Left to other roadmaps:

- The compactly supported local-coefficient cochain foundation (support colimits and H_c,
  support enlargement, cofinality, proper pullback, open extension, supported and mixed-support
  cups, jointly proper homotopy invariance), labelled S0–S4 in C1.2a, is AlgebraicTopology's
  supported-cellular supplement after Stage 6.2; the absolute-relative, same-pair and
  union-relative products on excisive couples are AlgebraicTopology Stage 6.2's.
- Singular (co)homology with local coefficients, cup, cap and cross products, CW structures,
  Künneth, the fibration homotopy sequence, the Serre spectral sequences and the
  Eilenberg–MacLane models are AlgebraicTopology's; continuous vector bundles, Grassmannians,
  Stiefel spaces, numerable BO/BU classification, continuous principal bundles and K-theory are
  TopologicalKTheory's; smooth principal bundles, connections, curvature and the normalized
  integral circle class are SmoothBundlesConnections'; forms, integration and the de Rham
  comparison are DifferentialGeometry's.
- The Lefschetz fixed-point formula, its graph/diagonal trace expression and the fixed-point
  index sum belong to MorseNovikov N6 and are not restated here; C2.3 states only the
  Euler-class pullback identity for a self-map.
- The algebraic-vector-bundle roadmap concerns schemes and Chow/étale realization. Tau Ceti's
  quadratic-form `sw1`/`sw2` concern Galois cohomology of fields; they are distinct from the
  topological classes constructed here.
- ClassifyingSpaces treats discrete groups with the weak-topology countable join; C1 compares
  that specialization and constructs the classifiers of compact Lie and general Hausdorff groups.
- Spin lifts, geometric chirality, Dirac operators and index theorems are geometric consumers of
  C3.5, C6 and C7; the KKS root-plane Hessian/Morse comparison is a symplectic application at the
  HamiltonianReduction/SchubertGeometry boundary.

## Conventions

Abbreviations below use the linked suppliers: TopK=TopologicalKTheory,
AT=AlgebraicTopology, SBC=SmoothBundlesConnections, CKG=ComplexKahlerGeometry,
GT=GeometricTopology, DG=DifferentialGeometry and LGP=LieGroupoidsPoisson.

Use Mathlib `FiberBundle`, `VectorBundle`, `VectorBundleCore`, `Bundle.TotalSpace`,
pullbacks, Hom/dual constructions and `ContMDiffVectorBundle`. The continuous
finite-rank category, locally constant ranks, finite embeddings, metrics,
Grassmannians, Stiefel spaces and numerable BO/BU classification are
[TopologicalKTheory T1](../TopologicalKTheory/README.md)
dependencies. Its T6.4 supplies continuous principal/associated bundles and
descent. Use TopK T1.5's actual finite real Grassmannians and tautological bundles,
and TopK T1.6a's positive-rank finite oriented carriers (orthonormal-frame
quotients by SO(n)), their lifted finite cells and coordinate maps, and the
fixed-rank and stable colimits, universal-bundle diagrams and classifier
comparison on those carriers. C1.0 and C1.1a identify the determinant-sign
orientation double cover with these oriented carriers. AlgebraicTopology
Stage 4.5 supplies the compact-generation coreflection and the compactly
generated substrate on which the stable colimits are formed; the stable O/SO
and ΩBSO comparisons are downstream consumers of these classifiers, not inputs
to the finite oriented-cover comparison. Write BO(n) and BU(n)
for T1.6's fixed-rank universal Grassmannians, and BSO(n) for the
ambient-dimension colimit in `CompactlyGenerated` of TopK T1.6a's actual finite
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

The general principal-bundle join lane of C1.1b treats Hausdorff topological
G over Hausdorff CW bases. The compact Lie branch, including finite discrete
groups, retains its metrization, paracompactness, explicit contraction and
classification of numerable bundles over paracompact Hausdorff bases.
Finite faithful unitary approximations and classical characteristic-ring
calculations retain their compactness and classical-group hypotheses.
Characteristic classes in singular cohomology are natural for their continuous
pullbacks. Classification of lines by singular H² assumes CW type; on a general
paracompact base distinguish Čech H² from singular H². Variable ranks are handled
on clopen strata, with the singular cohomology product comparison for disjoint
unions. Smooth statements use finite-dimensional Hausdorff second-countable
Mathlib manifolds; the de Rham comparison uses its precise σ-compact hypotheses.

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

## Exact supplier contracts

| Supplier | Exact interface consumed |
| --- | --- |
| Mathlib, at the pin | `FiberBundle`, `VectorBundle`, `VectorBundleCore`, `Bundle.TotalSpace` and `ContMDiffVectorBundle` with their pullback and Hom/dual constructions; `CompactlyGenerated` and `CompactlyGenerated.compactlyGeneratedToTop`; `sSetTopAdj`, `SSet.KanComplex` and `SSet.π₀`; `cechComplexFunctor` and `CategoryTheory.Sheaf.H`; `MvPolynomial.symmetricSubalgebra`, `esymm`, `psum` and `esymmAlgEquiv`; `LieAlgebra.HasCentralRadical`, `LieAlgebra.IsKilling` and `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial`; `exists_embedding_euclidean_of_compact`; `bernoulli'PowerSeries` and `bernoulliPowerSeries`; `Projectivization`; `Manifold.IsImmersion`, `Manifold.IsImmersion.id`, `MulAction.instChartedSpaceQuotient`, `contMDiff_neg_sphere` and `contMDiff_id`. |
| Tau Ceti, at the pin | Singular cohomology `TopCat.singularCohomology`, `TopPair.singularCohomology`, `singularCohomologyMap`, `singularCup` and `singularCohomologyδ`, and the Bocksteins `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein` (C1.2); the Serre-fibration class `TauCeti.TopCat.serreFibrations` with its membership theorems (C1.1b); `TauCeti.OrthonormalFrameBundle`, the orientation cover `TauCeti.VectorBundleOrientationCover` with its sign local system, and `TauCeti.VectorBundleOrientation` (C1.0, C1.1a); the finite Grassmannians `TauCeti.finiteGrassmannian` and `TauCeti.finiteOrientedGrassmannian` (C1.1a); `TauCeti.thomPair`, `TauCeti.IsThomClass`, `TauCeti.eulerClass` and the Thom-class gluing and existence theorems (C2.1–C2.2); `TauCeti.FiberBundle.t2Space_totalSpace` and `TauCeti.hasHomotopyExtensionProperty_base` (C2.0); `TauCeti.HomologicalOrientation.evalFundamentalClass`, `TauCeti.localOrientationOfManifoldOrientation`, `Orientation.localOrientation`, `TauCeti.eulerChar`, `TauCeti.FiniteCWType` and `TauCeti.Manifold.Orientation.toVectorBundleOrientation` (C2.3); the Milnor sequence of a tower of complexes and the Mittag–Leffler vanishing (C3.1); the real Clifford spin-cover declarations (C3.5); `TauCeti.lieCartanRestriction`, `LieSubalgebra.lieChevalleyRestrictionIso` and the Killing symmetric-algebra maps (C5.1); `PowerSeries.multiplicativeSequence`, `TauCeti.aHatSeries`, `TauCeti.hirzebruchLSeries` and the genus polynomials (C6.1, C7.1); `Quaternion.toComplexMatrix` and `Quaternion.unitaryEquivSpecialUnitaryGroup` (C7.AdjointHopfObstruction); `TauCeti.FiniteRankBundleCore.ofBundle`, `TauCeti.RealProjectiveSpace` and `TauCeti.instIsManifoldQuotient` (C7.3a). Each item names the files and the exact declarations it consumes. |
| AlgebraicTopology | Stages 2–6 and 8.1–8.7: singular chains and cochains, local systems, cup, cap and cross products, pair sequences, excision, cellular comparison and Künneth; Stage 2.5 (the sup-ball disk homeomorphism), 4.5 (compact generation and the relative CW pushouts), 4.6 (the finite real projective spaces), 4.8 (CW approximation and the connected-map comparison), 5.5 (the fibration homotopy sequence and the Serre spectral sequences), 6.0–6.2 (the tower Milnor sequence, local-coefficient cochains, the Bockstein, products on excisive couples) and its supported-cellular supplement, 7 (the Euler characteristic of a triangulation); Stages 8.2, 8.3, 8.5, 8.7, 8.8b, 8.9, 8.10 and 8.12 (the Kan/cubical comparison, Hurewicz, Whitehead, manifold triangulations, the normalized ℤ/2 model, primary obstructions, the ordinary Eilenberg–MacLane models and representability, the native circle comparison). |
| TopologicalKTheory | T1 (continuous finite-rank bundles, metrics, embeddings), T1.3–T1.4 (fibre metrics and the disk-bundle homotopy invariance), T1.5 and T1.5a (finite Grassmannians, Stiefel quotients, the sphere-bundle sequences of SO(k) and π₁(SO(k))), T1.6 and T1.6a (BO(n), BU(n), the finite oriented carriers and their colimits, the countable-colour producer), T2–T5 (K-rings, relative K-theory, compact supports, λ-operations, Bott periodicity, the dual-Koszul Thom class), T3.4 and T4.8 (right suspension and cone boundary), T6.4 (continuous principal and associated bundles), T7.4 (the doubled-space kernel comparison). |
| DifferentialGeometry | Layers 1–2 and 5–10: forms, wedge, d, orientations, integration and Stokes, compact supports, the multiplicative singular/de Rham comparison (Layer 8) and the manifold Sard theorem (10.2). |
| SmoothBundlesConnections | B1.4 (free proper quotients and homogeneous spaces), B2 (associated bundles, frames, metrics, Hom/dual/sum), B3–B4 (connections, curvature, Bianchi), B6.0 (smooth good covers), B6 (the normalized circle class, rank-one Chern–Weil, the lens-space flat bundles). |
| ComplexKahlerGeometry | K4 (Hermitian holomorphic bundles and Chern connections), K7.1–K7.2 (the projective carrier and atlas, tautological and dual lines, the Fubini–Study form and the O(1) curvature). |
| GeometricTopology | Layer 1 (embeddings, tubular neighbourhoods and the weak C∞ topology), Layer 3 (the compact-source mapping topology), Layer 10 (the oriented-plane Euler target), Layer 11 (smoothing and triangulation). |
| LieGroups | Layer 1 (Ad), Layer 2 (`SU(2)≃S³` by the first column), Layer 5 (`Ad : SU(2) → SO(3)`), Layer 5A (B_G, the splitting 𝔤=𝔷(𝔤)⊕[𝔤,𝔤], the radical/centre and bracket-orthogonality arguments, the negative-definite Killing form of [𝔤,𝔤]), Layer 6 (maximal tori, Weyl groups, the root-pairing isomorphism), the continuous-homomorphism theorem and the universal-cover and central-quotient classification. |
| CompactGroups | Layers 0–1 (Haar probability, averaging, Peter–Weyl). |
| LieHighestWeight | L1 (Cartan and root decompositions and the root system). |
| LieGroupoidsPoisson | G1.3a (the all-degree real Lie-algebra Chevalley–Eilenberg complex). |
| ReflectionInvariantTheory | §§1–3 (fixed-polynomial algebra, basic invariants, regular sequences, coinvariants), §4 (degrees and exponents). |
| SchubertGeometry | S9.6 (rational acyclicity of K/N(T) and the integral SU(2) normalizer comparison). |
| TopologicalSheafCohomology | TS1.1–TS1.2 (fixed-cover Čech complexes, refinement maps and their homotopies). |
| ClassifyingSpaces | the weak-topology join model of a discrete group. |
| SpinRepresentations | exterior and half-spin modules and their weight characters. |

Every declaration named in this table is consumed, never restated. The contract with each
supplier roadmap in detail:

- [AlgebraicTopology Stages2–6,8.1–8.7](../AlgebraicTopology/README.md) owns singular
  chains/cochains, local systems, cup/cap/cross products and pair
  sequences, excision, cellular comparison, Künneth and homotopy
  comparison. Consume actual Tau Ceti `TopCat.singularCohomology`,
  `singularCohomologyMap`, `singularCup`, `TopPair.singularCohomology`,
  `singularCohomologyδ` and the relative exactness/naturality lemmas. The
  cup module already proves associativity and units; its full graded
  and relative packaging is that supplier's target.
  C2's primary Euler obstruction additionally consumes AT8.9. C1.5a's
  Eilenberg–MacLane identification of the rank-one projective carriers
  consumes AT8.5, AT8.8b's normalized ℤ/2 model, AT8.10's ordinary models and
  representability and AT8.12's native circle comparison, after C1.5's
  independent carrier/cellular calculations; ordinary line classification in
  C1.6 consumes AT8.10 and C1.5a. C1.5's comparison portion and C2 consume
  no AT8.8b, AT8.10 or AT8.12.
  For the support lane, C1.2a consumes the compactly supported
  local-coefficient cochain foundation of AT's supported-cellular supplement
  after Stage 6.2 (the support colimit and H_c, support enlargement,
  cofinality, proper pullback, open extension, supported and mixed-support
  cups, and jointly proper homotopy invariance), together with ordinary AT2–4
  and AT6.1–6.2. AlgebraicTopology consumes nothing of C1.2a. C1.2a S5
  compares its collared-pair triangle with that supplement's supported
  CW-pair triangle.
- [AlgebraicTopology Stage 4.8 and Stage 5.5](../AlgebraicTopology/README.md)
  supply the generic homotopy-theoretic inputs. Serre fibrations themselves
  are the pinned Tau Ceti class `TauCeti.TopCat.serreFibrations`
  (`Topology/Homotopy/SerreFibration/Basic.lean`, the right lifting property
  against the disk-cylinder inclusions, with `mem_serreFibrations_iff_cube`,
  closure under composition, retracts and base change, and
  `IsCoveringMap.mem_serreFibrations`). Membership of locally trivial maps is
  pinned too, with no hypothesis on the base:
  `TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization` and
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` for a map
  every point of whose base lies in the base set of a `Bundle.Trivialization F`,
  and `TauCeti.TopCat.mem_serreFibrations_proj` for the projection of a native
  `FiberBundle F E` (`SerreFibration/FiberBundle.lean`). Those pinned theorems
  use one common typical fibre F for every chart of the map. Consume them by
  name. On that pinned class Stage 5.5 supplies, as its own targets, the
  fibration homotopy exact sequence including components and the homological
  and multiplicative cohomological Serre spectral sequences. Stage 4.8
  supplies CW approximation, weak-equivalence invariance of singular homology
  with local coefficients, and the connected-map homology comparison with its
  coefficient-chain/Hom form. Those are supplier targets, not library
  theorems. Variable-rank bundles are treated on their rank strata. C1.1b specializes
  the homotopy exact sequence to its numerable bundles; C1.2b consumes the
  connected-map comparison for its singular counit; C5a.5 applies the
  multiplicative cohomological Serre comparison and C5a.6 reuses it. The
  actual Milnor counit theorem remains C1.2b, distinct from the abstract
  CW-approximation existence theorem.
- [DifferentialGeometry Layers1–2,5–10](../DifferentialGeometry/README.md) owns
  forms, wedge, d, orientations, integration/Stokes, compact supports and the
  multiplicative singular/de Rham comparison. C2 builds cohomological Thom,
  fibre integration and their comparison on those objects, including the
  compact-support singular/de Rham comparison.
- [SmoothBundlesConnections B1–B4,B6](../SmoothBundlesConnections/README.md)
  owns principal/associated smooth bundles, connections, curvature, Bianchi,
  local transition conventions and the normalized integral circle class.
  [ComplexKahlerGeometry K4](../ComplexKahlerGeometry/README.md)
  supplies Hermitian holomorphic bundles and Chern connections;
  [K7.1/K7.2](../ComplexKahlerGeometry/README.md)
  supplies the single projective carrier/atlas, tautological and dual lines,
  normalized Fubini–Study form and O(1) curvature −2πiω_FS. C1.5 consumes
  K7.1 and only K7.2's CW/cellular/cup subitems, with positive hyperplane
  generator and inclusion compatibility, before the universal-class
  comparison. The line-curvature/smooth comparison uses K4 and K7.2's
  independent form and SBC B6 circle-class comparisons.
- [GeometricTopology Layers1,3,10](../GeometricTopology/README.md) owns
  embeddings/tubular maps, the smooth mapping topology and the oriented-plane
  Euler target. These are roadmap targets of that supplier,
  not claims that a built supplier API already exists.
  C2 constructs general Euler/Thom and compares its rank2 restriction with
  that standalone plane construction.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) owns Lie groups,
  closed subgroups, adjoint action, tori, Weyl groups and root planes;
  [CompactGroups](../RepresentationTheory/CompactGroups/README.md) owns Haar
  averaging and Peter–Weyl. C1 builds finite faithful representations as the
  universal-approximation connector. C5 builds invariant-polynomial restriction;
  it uses LieGroups Layer5A for the Ad-invariant metric, the splitting
  𝔤=𝔷(𝔤)⊕[𝔤,𝔤] and the semisimplicity and negative-definite Killing form of
  [𝔤,𝔤], LieGroups Layer6 for the Cartan subalgebra t_ss,C and the
  root-pairing isomorphism,
  [LieHighestWeight L1](../RepresentationTheory/LieHighestWeight/README.md)
  for the Cartan/root decomposition, Mathlib's `LieAlgebra.HasCentralRadical`
  for reductivity, and the pinned Tau Ceti Chevalley restriction isomorphism
  with its homogeneous compatibility (C5.1) for the generic Lie-algebra
  restriction.
- LieGroupoidsPoisson G1.3a
  owns the all-degree real Lie-algebra CE complex, its coefficient modules
  and low-degree native comparison. C5a constructs the compact-group
  invariant-form and Haar homotopies on that complex.
  [ReflectionInvariantTheory §§1–3](../ReflectionInvariantTheory/README.md)
  owns the early fixed-polynomial algebra, homogeneous basic-invariant
  evaluation, regular sequence, coinvariant and character-lattice scalar-change
  interfaces independently of topology. C5a consumes those maps and owns
  their compact cohomology/transgression application. Its exterior theorem is
  not a premise for the reflection invariant-algebra theorem.
- [TopologicalKTheory T2–T5](../TopologicalKTheory/README.md) owns actual SplitK0
  K-rings, relative triples/complexes, compact supports, λ-operations, Bott and
  the dual-Koszul Thom class. C6 constructs ch on these functors and its Thom
  correction, rather than replacing relative classes by their absolute image.
- [SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md)
  supplies exterior/half-spin modules and weight characters. C7 translates
  specified root characters into characteristic series; spin lifts, geometric
  chirality, Dirac operators and index theorems are geometric consumers.

## How to read the build

C1 builds universal principal bundles and their finite smooth approximations, the cohomological
infrastructure (the Bockstein, compactly supported relative cochains, the singular counit and
the Čech comparison) and the line classes with their Eilenberg–MacLane identifications. C2 builds
Thom and Euler classes, the Gysin sequence, the primary obstruction, the Euler number and fibre
integration. C3 defines Stiefel–Whitney, Chern and Pontryagin classes by projective splitting
and computes the universal rings mod 2 and away from 2, with w₂ as the spin obstruction. C4
builds Chern–Weil forms and the universal Chern–Weil map, and C5 proves Chevalley restriction
and Borel's theorem for the rational universal rings. C5a computes the cohomology of compact
connected Lie groups by invariant forms, the Weil algebra and universal transgression. C6
builds multiplicative sequences on bundles and the Chern character with its Thom correction, and
C7 fixes the characteristic-number formulas and the acceptance calculations. C1–C3 precede the
curvature layers; the projective cohomology theorem is independent of K-theoretic Bott and Thom
theory, C7.3a uses only C1–C3, and nothing here has an analytic-index or pseudodifferential
prerequisite.

## C1: Universal principal bundles and cohomology infrastructure

The items of C1 that other roadmaps cite as groups are:

- **C1.1** (universal principal bundles): 1.1a, 1.1b and 1.1d below;
- **C1.2** (cohomology infrastructure): 1.2, 1.2a and 1.2b below.

### 1.0 Metric frames before classification (C1.0)

The orthonormal frame
bundle of a continuous Riemannian (𝕜=ℝ, structure group O(n)) or Hermitian
(𝕜=ℂ, structure group U(n)) finite-rank vector bundle is the pinned
`TauCeti.OrthonormalFrameBundle 𝕜 F E V`
(`Topology/VectorBundle/OrthonormalFrame/Basic.lean`): the frames `V ≃ₗᵢ[𝕜] E b`
with the right action of `unitary (V →L[𝕜] V)` in the operator-norm topology,
free and transitive on each fibre (`smul_eq_self_iff`, `exists_smul_eq_iff`),
its pointwise topology and continuity criterion (`continuous_iff`), the
Gram–Schmidt local frame `Bundle.Trivialization.orthonormalFrame` of a
linear trivialization from the pinned continuous Gram–Schmidt
`Continuous.gramSchmidtNormed_bundle` (`GramSchmidt.lean`), the equivariant
local trivializations `Bundle.Trivialization.orthonormalFrameBundle` and
`exists_trivialization`, the reconstruction of E as the associated bundle
`associatedHomeomorph`, and the pullback square `pullbackHomeomorph`
(`OrthonormalFrame/Pullback.lean`). Consume these by name; TopK T1 supplies
the continuous positive metrics they are applied to. Own here, on that
carrier: naturality under metric isometries; for a supplied orientation and
n≥1, the positively oriented SO(n) principal subbundle, the fibre of the
pinned `TauCeti.OrthonormalFrameBundle.toOrientationCover` over the
orientation's section, with its charts from the oriented Gram–Schmidt frames;
the smooth versions, which consume SBC B2's native frame and metric
interfaces; and the proved identity homeomorphism between the pinned
operator-norm topology on `unitary (V →L[𝕜] V)` and the default
finite-dimensional matrix topology.
These constructions precede universal joins, BSO classification, characteristic
rings and the w₂ obstruction. In the smooth setting the source is Dupont,
*Fibre Bundles and Chern–Weil Theory*, Proposition2.20 (local orthonormal
trivializations by Gram–Schmidt), Proposition2.21 (the orthogonal frame
bundle with its free right O(n)-action and equivariant charts) and
Example4.3 (a metric is a reduction of the frame bundle to O(n), an
orientation a reduction to the positive-determinant subgroup).

For metrics h₀,h₁, construct the positive h₀-self-adjoint H defined by
h₁(u,v)=h₀(Hu,v). Its inverse square root carries an h₀-orthonormal frame
to an h₁-orthonormal frame. Prove chart independence, continuous and smooth
parameter dependence, the inverse transport, and homotopy compatibility.
Any two metrics are homotopic through metrics: the positive-definite
symmetric forms on a fibre form a convex cone, so (1−t)h₀+th₁ is a metric
for every t∈[0,1], continuous in t and in the base point. On frames, the
Gram–Schmidt deformation retraction of GL_n(ℝ) onto O(n) (Hatcher, *Vector
Bundles and K-Theory*, §1.2, p. 26) carries the frame bundle of the
underlying vector bundle onto the orthonormal frames of a chosen metric.
Use the native finite-dimensional spectral/CFC square root pointwise; for
smooth dependence invert the Sylvester derivative
K↦H^(1/2)K+KH^(1/2), whose eigenvalue sums are positive.
Prove the actual composition comparison for metric changes; the square-root
maps for noncommuting metric changes need not compose literally.
For rank0 use the singleton zero-frame carrier and retain the orientation sign
as separate data. For variable rank work on the clopen rank strata.
The determinant-sign orientation double cover is the pinned
`TauCeti.VectorBundleOrientationCover F E ι` (`Orientation/Cover.lean`), with
its local two-sheet description `trivializationHomeomorph`, `isCoveringMap_proj`,
`ncard_fiber` and the deck involution `deck`, metric-independent and independent
of a universal classifier; for n≥1 the pinned
`TauCeti.OrthonormalFrameBundle.orientationCoverHomeomorph`
(`Orientation/OrthonormalFrame.lean`) identifies it with the frame quotient by
SO(n), two frames having the same image exactly when they differ by a
positive-determinant orthogonal map
(`toOrientationCover_eq_toOrientationCover_iff`), and a bundle orientation, the
pinned `TauCeti.VectorBundleOrientation` that TopK T1.6a's oriented carriers
use, is exactly a continuous section of the cover
(`VectorBundleOrientation.nonempty_iff_exists_section`). Consume these by name
and own the comparison of their chart signs with DG's tangent orientation cover.
C1.1a consumes this metric-independent
cover; C1.1b owns its later universal-bundle comparison and classification,
and C3.5 owns the separate universal Spin obstruction.

**Checks.**
- On a line with h₁=4h₀ the operator is H=4, and H^(−1/2)=1/2 sends an h₀-unit vector u to u/2,
  with h₁(u/2,u/2)=1; the wrong root H^(1/2) gives 2u, with h₁(2u,2u)=16, so it does not carry
  orthonormal frames to orthonormal frames.
- On the trivial oriented plane over a point the positively oriented orthonormal frames form one
  circle SO(2); the frame (e₂,e₁) has determinant −1 and lies outside it, whereas keeping all
  orthonormal frames gives O(2), two circles.
- The orthonormal frame bundle of the Möbius line over S¹ is its connected orientation double
  cover, which has no section: the bundle has no orientation and so no SO(1) subbundle, while the
  trivial line has two, one for each orientation.

### 1.1a Finite oriented-cover precursor (C1.1a)

Consume C1.0's single
determinant-sign orientation double cover and its metric independence,
together with its pinned comparisons: the direct-sum orientation
`TauCeti.VectorBundleOrientation.prod`, which orders the first factor first
and retains both signs in rank0, and the open quotient map
`TauCeti.VectorBundleOrientationCover.prodMap` from the fibre product of the
two covers to the cover of the sum, whose fibres identify exactly the
simultaneous reversal of both orientations (`Orientation/Prod.lean`); the
cover-section comparison
`TauCeti.VectorBundleOrientation.nonempty_iff_exists_section`
(`Orientation/Cover.lean`); and the path-transport sign local system
`TauCeti.VectorBundleOrientationCover.signLocalSystem`
(`Orientation/LocalSystem.lean`). Consume these by name; what this item
constructs, on TopK T1's vector-bundle atlases and T1.5's finite Stiefel
quotients, is the comparison below. TopK T1.6a's finite oriented carrier
of rank n≥1 is the pinned `TauCeti.finiteOrientedGrassmannian n N`
(`Topology/Grassmannian/Oriented.lean`), by definition the orientation
double cover of the pinned tautological bundle
`TauCeti.finiteGrassmannian.Tautological` over `finiteGrassmannian ℝ n N`,
compact, with the orientation-forgetting projection `forget` and its
tautological bundle `Tautological` oriented by
`TauCeti.VectorBundleOrientationCover.tautologicalOrientation`
(`Orientation/Tautological.lean`); so C1.0's single cover specialized to
that tautological bundle is this carrier, and what remains is to identify
it, through T1.6a's comparison, with
the quotient of the orthonormal n-frame Stiefel carrier by the right SO(n)
action, compatibly with the tautological bundles and the
orientation-forgetting projections. Retain the two orientations when n
equals the ambient rank; the rank0 carrier is the canonical positive point
with its sign datum separate. Prove that this identification carries TopK
T1.6a's lifted Schubert cells, append-last Fin.castSucc inclusions and
new-line-first rank maps V↦ℝe₀⊕shift(V) to the induced maps of
determinant-sign covers, and that TopK's last-column SO comparison, with
the sign (−1)^(n−1) on the added line, is the transport of the
determinant sign. This comparison uses no Milnor join or TopK T6.4; TopK
T1.6a owns the finite oriented carriers, the fixed-rank/stable oriented
colimits and their classifier comparison.

**Checks.**
- The oriented n-planes in ℝⁿ are the two orientations of ℝⁿ: at full rank the oriented carrier
  is two points over the one-point Grassmannian, and a model forgetting the orientation there
  would have one point.
- The oriented lines in ℝ² are the unit vectors, a circle mapping two-to-one onto RP¹; the
  oriented planes in ℝ³ correspond to their positive unit normals, a sphere double covering RP².
- Moving the added vector from the last to the first place of an ordered basis of ℝⁿ is an
  n-cycle, of sign (−1)^(n−1): −1 for n=2 and +1 for n=3, so the new-line-first and last-column
  stabilizations agree on orientations exactly in odd rank.

### 1.1b Numerable joins and frame specialization (C1.1b)

Use TopK T6.4
for the independent continuous principal/associated-bundle category.
**General Hausdorff groups and CW bases.** For every Hausdorff topological group
G, use a type copy of the same native finite-support indexed-join carrier with the
strong coordinate topology: the topology generated by the weights t_i and the
label maps g_i on {t_i>0}. Prove the continuity criterion in those coordinates,
including maps from products. Prove the algebraic right-action dictionary on
finitely supported simplices with group labels: relabelling by g and then
by h is relabelling by gh, relabelling preserves the weight at each index,
and label inversion carries the left action of g⁻¹ to the right action of
g. Prove joint continuity from g_i(pg)=g_i(p)g and
continuity of multiplication, without a group metric. The native weak simplicial
topology on discrete labels is a separate topology.

For U_i={t_i>0}, normalize p by p·g_i(p)⁻¹. Descend this invariant map to a
section s_i over V_i=U_i/G, and construct the principal charts (b,g)↦s_i(b)g with
inverse p↦([p],g_i(p)). Prove continuity, the inverse and overlap formulas in
their noncommutative order, openness of the quotient map and Hausdorffness by
normalized-label separation. On BG the weights form a point-finite sum1. Prove
m=max_i t_i>0 is continuous by finite-support tail control; ψ_i=max(t_i−m/2,0) is
locally finite with positive sum. Normalize ψ_i to a native partition of unity
subordinate to V_i, proving the support inclusions. Do not assert that the
original weights are locally finite or that BG is paracompact for arbitrary G.

For compact Hausdorff K and f:K→EG, put S_N=Σ_(i<N)t_i∘f. Prove that one N has
S_N>1/2 everywhere by compactness. Multiply tail weights by1−s and renormalize all
weights by S_N+(1−s)(1−S_N). Prove continuity of this homotopy using the generated
topology, retaining labels only on positive-weight domains. At s=1 it factors
through the first N coordinates; cone it to the identity-labelled vertex at unused
index N. Deduce path connectedness and vanishing of every homotopy group, with
based null-extension comparisons. The original compact image need not lie in a
finite join. Whitehead gives actual contractibility only after a CW-type
comparison has been proved; the Lie contraction below has its own construction.

Use [TopK T6.4][continuous-principal-foundation]'s general numerable
principal/associated-bundle category and its classifier-independent cylinder
homotopy invariance. For a principal right
G-bundle P over a Hausdorff CW pair (X,A) and prescribed equivariant F_A:P|A→EG,
construct an extension cell by cell. Pullback to each characteristic disk is
trivial by disk contraction and numerable homotopy invariance. Reduce its boundary
extension to a map S^(n−1)→EG; use nonemptiness, path connectedness and the
vanishing homotopy groups in the respective dimensions. Prove global continuity by
assembling a section of P×_G EG over X, with left action g·v=v·g⁻¹; the CW weak
topology applies to the section on the base. Recover F from principal charts,
rather than assuming products with arbitrary G preserve a CW final topology.

Construct the induced classifying map f:X→BG and the actual principal-bundle
isomorphism P≃f*EG in charts. Repeat the relative extension over the cylinder for
uniqueness, and prove the natural bijection [X,BG] with principal G-bundle
isomorphism classes, including empty/disconnected CW bases. For a nonempty
principal G-bundle E→B prove that this relative-CW equivariant extension property
holds iff E is path connected with all homotopy groups trivial: necessity tests
trivial G-bundles over (D^(n+1),S^n), and sufficiency repeats the
associated-section construction. This recognition theorem is at CW/numerable
scope. Compare the discrete-group model through actual universal-bundle maps,
retaining the topology and left/right-action dictionaries. Milnor, *Construction
of Universal Bundles, II*, §§2–3, and tom Dieck, *Algebraic Topology*,
14.4.3, supply the coordinate construction; its CW
qualification remains distinct from weak contractibility.

[continuous-principal-foundation]: ../TopologicalKTheory/README.md

**Compact Lie specialization.**
After TopK
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
[early countable-colour producer](../TopologicalKTheory/README.md):
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
ClassifyingSpaces and TopK T1's O/U Grassmannian models, together with TopK T1.6a's
oriented carriers, by the actual universal-bundle maps, including
finite-rank and stable inclusions and orientation forgetting.
Consume C1.0's continuous orthonormal/unitary frame principal bundles
and Gram–Schmidt charts. Construct their comparison with pulled-back
universal Stiefel bundles. Consume C1.1a's orientation-cover
comparison and TopK T1.6's fixed-rank BSO(n), stable BSO carrier and
oriented classifier comparison. Prove the numerable SO join/Grassmannian
universal-bundle comparison, finite-rank and stable inclusions,
orientation forgetting and the general paracompact oriented
classification on those same carriers. Compare with the smooth
frame/orientation constructions. Consume
AlgebraicTopology Stage 4.5's compact-generation coreflection k, right
adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, with its
counit and the compact-generation facts stated there; prove that continuous singular simplices, chains and cochains are unchanged
by k-ification because every standard simplex is compact Hausdorff. Export
the resulting natural cohomology comparison for the stable carriers.
Consume the pinned Serre-fibration membership
`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` for the
join, quotient and pullback TopCat morphisms, exhibiting one common typical
fibre F for all charts of each, and `TauCeti.TopCat.mem_serreFibrations_proj`
for native `FiberBundle` projections, together with AT5.5's fibration
homotopy exact sequence on that pinned class. Construct that
sequence's specialization of the actual boundary π_n(B)→π_(n−1)(F) to these numerable
bundles, with basepoints, basepoint change, group laws and pointed-set
exactness at π1/π0. Do not identify the fibre inclusion with an NDR pair. Prove
Dold's theorem that a numerable bundle with contractible fibre is a homotopy
equivalence, including the local contraction/partition construction.

**Checks.**
- For G=ℤ/2 the join of N copies of the two-point group is S^(N−1) with the antipodal action, so
  EG=S^∞ and B_join(ℤ/2)=RP^∞; a finite join of N≥2 copies has π_(N−1)≠0 and fails the
  vanishing of all homotopy groups that EG satisfies.
- For G=S¹ the join of N copies is S^(2N−1)⊂ℂ^N with the diagonal circle action and quotient
  CP^(N−1), so B_join(S¹) is the colimit CP^∞; for the trivial group the join is the contractible
  space of finitely supported probability vectors, and every CW base carries one bundle.
- At the weights (3/5,3/10,1/10,0,…) the maximum is m=3/5 and ψ=(3/10,0,0,…): only coordinates
  above m/2 survive, so each ψ_i is supported in {t_i>0}, and the sum of the ψ_i is positive
  because a largest weight always survives.

### 1.1d Trivializations and disconnected clutching (C1.1d)

For a continuous
right principal G-bundle P→X, define a global trivialization as an
equivariant bundle isomorphism P≃X×G covering id_X, with continuous
inverse. Construct its equivalence with global sections, using the
bundle division map, and prove the inverse formulas and pullback laws.
If a reference trivialization τ₀ is supplied, all trivializations are
uniquely of the form τ_a(p)=(x,a(x)g) when τ₀(p)=(x,g), for a continuous
map a:X→G. Prove this is a torsor for the pointwise group C(X,G), with
composition, inverse and change-of-reference formulas. A homotopy of
trivializations must remain an equivariant bundle isomorphism at every
parameter, with the inverses jointly continuous. Prove its correspondence
with a homotopy X×I→G. Thus homotopy classes of trivializations form a
torsor for [X,G]; actual trivializations are not themselves [X,G].
Neither bijection has a chosen origin without τ₀. For X=pt and G=Circle,
the actual trivializations are parametrized by Circle, whereas their
homotopy classes form a singleton. For prescribed trivializations on a
closed CW subcomplex A⊆X, first identify extension with the actual map
extension problem: relative to any global reference, the prescribed
transition a_A:A→G must extend to a:X→G. This set can be empty; the
identity boundary gauge S¹→Circle does not extend over D². If a reference
τ₀ extending the prescribed trivialization is given, the extending
trivializations form the torsor for maps a|A=1, and their relative
homotopies correspond to homotopies fixed on A. Prove these statements
with their restriction, bundle-isomorphism and structure-group maps.

For G in C1.1b's Lie-group scope, construct principal bundles on S^(n+1)
directly by clutching two trivial bundles on the closed hemispheres.
Pin s_S=s_N c on the equator S^n, so the gluing is
`(z,g)_S∼(z,c(z)g)_N`. Changing the hemisphere sections to s_N a and
s_S b changes c to a⁻¹cb, where a,b extend over their respective disks.
Prove gluing gives a numerable bundle, every such bundle is obtained this
way, and two clutching functions give isomorphic bundles exactly through
these changes and homotopy. Retain actual isomorphisms, pullbacks by
sphere maps, structure-group homomorphisms and the universal-classifier
comparison; use the relative homotopy lifting from C1.1b to normalize
hemisphere sections at a chosen equatorial point.

A marked bundle here includes a chosen point in its fibre over that base
point, and its isomorphisms preserve that point. For n≥1, prove the
natural bijections
`marked principal G-bundles on S^(n+1) ≃ [S^(n+1),B_join(G)]_* ≃ π_n(G,1)`.
Use the actual boundary map of EG→BG, including the identification
π₁(BG)≃π₀(G), to compare forgetting the marking with the orbit quotient
`principal G-bundles on S^(n+1) ≃ π_n(G,1)/π₀(G)`.
The right action is represented by `[α]·[g]=[z↦g⁻¹α(z)g]`; prove it
depends only on the component of g and agrees with basepoint transport
on BG. In particular it is trivial for connected G. The ordinary free
class set [S^n,G] is not substituted for this orbit quotient when G is
disconnected. At n=0, treat S¹ separately: marked classes are π₀(G),
and unmarked classes are conjugacy classes in π₀(G). Do not assign an
abelian group structure to this general conjugacy-class set.

Also compute the free homotopy classes [S^n,G] for every n≥0.
For n≥1, evaluation at q∈S^n and constant maps give the split exact
sequence of pointwise-multiplication groups
`1→π_n(G,1)→[S^n,G]→π₀(G)→1`.
Prove the canonical semidirect-product description using
`α(z)=f(z)f(q)⁻¹`, with left action `[g]·[α]=[gαg⁻¹]`.
This is inverse to the right conjugation action used for the orbit set
above. For n=0, prove `[S⁰,G]≃π₀(G)×π₀(G)`. Thus neither free map
classes nor the bundle orbit set is silently identified with the based
homotopy group. Orbit sets here are not asserted to be quotient groups.

Apply these comparisons to GL_k(ℝ), using C1.0's metric frames and the
Gram–Schmidt deformation retraction to O(k), on the same T1 bundles.
Use TopK T1.5a's last-vector sphere-bundle sequences SO(k)→SO(k+1)→S^k,
its π₁(SO(k)) computation (0 for k≤1, ℤ for k=2, ℤ/2 for k≥3) and its
relative triples (SO(n),SO(k+1),SO(k)), together with LieGroups Layer 5's
double cover `Ad : SU(2) → SO(3)`, surjective with kernel {±1}, and
LieGroups Layer2's identification `SU(2)≃S³` by the first column (a,b),
with inverse `(a,b)↦[[a,−conj b],[b,conj a]]`, as the only inputs beyond
T1.5a. Prove π₂(SO(k))=0 for every k: π₂(SO(2))=π₂(S¹)=0,
π₂(SO(3))=π₂(S³)=0 by that double cover, and for k≥4 the sequence gives
surjectivity of π₂(SO(k−1))→π₂(SO(k)) because π₂(S^(k−1))=0. Compute
the following free homotopy-class groups for every k≥1; rank0 is trivial:

| Domain | k=1 | k=2 | k≥3 |
| --- | --- | --- | --- |
| S⁰ | (ℤ/2)×(ℤ/2) | (ℤ/2)×(ℤ/2) | (ℤ/2)×(ℤ/2) |
| S¹ | ℤ/2 | ℤ⋊_(−1)(ℤ/2) | (ℤ/2)×(ℤ/2) |
| S² | ℤ/2 | ℤ/2 | ℤ/2 |

For bundles over S², oriented rank2 classes are indexed by the integer
winding of `R(θ)=[[cos θ,−sin θ],[sin θ,cos θ]]`. Prove
`J R(θ) J⁻¹=R(−θ)` for `J=diag(−1,1)`, so forgetting orientation
identifies winding m and −m. Thus unoriented rank2 classes are
ℤ/(m∼−m), equivalently ℕ by absolute winding. For k≥3 there are two
rank-k classes over S²; k=0,1 each has one. Over S¹, every positive rank
has exactly the trivial bundle and Möbius⊕ℝ^(k−1); rank0 has one.
Give the actual representatives, classifying maps and stabilization,
including winding mod2 at rank2→3. This classification prefix uses
no Euler/Stiefel–Whitney theory, stable BSO comparison or Bott periodicity.

After C2/C3's class constructions, prove the normalized characteristic
comparisons for these same bundles. Fix S²=CP¹ with its complex
orientation, northern disk `[1:z]`, |z|≤1, southern disk `[w:1]`,
|w|≤1, and equator z=e^(iθ) oriented as the boundary of the northern
disk. For the oriented plane bundle E_m with transition R(mθ), prove
`⟨e(E_m),[CP¹]⟩=m`. Calibrate O(−1) by northern section (1,z) and
southern section (w,1): s_S=z⁻¹s_N gives winding−1 and Euler number−1;
prove TS² has winding2 and Euler number2. Forgetting fibre orientation
retains only absolute winding. Prove that w₂ detects the two rank-k
classes over S² for k≥3 and that w₁ detects the two positive-rank classes
over S¹, compatibly with stabilization and C1.0's orientation cover.
The real vector-bundle clutching and orientation-forgetting comparison
follows [Hatcher, §1.2, pp22–26](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf),
with the hemisphere and Euler signs calibrated above; construct the
principal-bundle and marked/unmarked diagrams here.

**Checks.**
- The gauge map (x,g)↦(x,a(x)g) of X×G has inverse (x,g)↦(x,a(x)⁻¹g);
  a fibre-preserving right-equivariant homeomorphism of X×G is determined
  by its value at (x,1), and (x,g)↦(x,g a(x)) is not right-equivariant
  for nonabelian G.
- Entrywise, J R(θ) J⁻¹ has entries cos θ, sin θ, −sin θ, cos θ, which is
  R(−θ); conjugating by diag(1,1) instead leaves the winding unchanged.
- For X=pt and G=Circle the trivializations form a circle, their homotopy
  classes a point; the identity map S¹→Circle has no extension over D²
  because its degree is 1.

### 1.2 Bockstein input (C1.2)

The Bockstein is the pinned Tau Ceti absolute and
relative connecting morphism `TopCat.singularCohomologyBockstein` and
`TopPair.singularCohomologyBockstein` (`Cohomology/Bockstein.lean`) of the
short exact sequence of singular cochain complexes attached to a short
exact sequence of coefficient modules, here 0→Z→[×2]Z→F2→0; AT6.1 owns its
local-coefficient form. Build its coefficient-change compatibility with
the graded and supported interfaces here; do not define a second Bockstein.

### 1.2a Compact-relative support foundations (C1.2a)

These constructions precede bundle classification, Thom theory and manifold duality.

**S0–S4 (the supported cochain foundation).** The labels S0–S4 name the
compactly supported local-coefficient cochain foundation of
AlgebraicTopology's supported-cellular supplement after Stage 6.2, which
this item consumes and does not construct. For locally compact Hausdorff
X, closed A⊆X, a commutative ring R and an arbitrary module-valued local
system L on X, with no finite-rank, projectivity, freeness or field
assumption on the fibres, that supplement supplies on AT6.1's first-vertex
cochains: the compact-relative complexes
`C_K^*(X,A;L)=C^*(X,A∪(X∖K);L)` for compact K, their degreewise filtered
colimit `C_c^*(X,A;L)` and `H_c^n(X,A;L)=colim_K H^n(X,A∪(X∖K);L)`, with
the constant system recovering the constant-coefficient object (S0); the
support-enlargement maps with their identity and composition laws (S1);
the cofinal-family and cofinal countable-exhaustion comparisons (S2); the
pullback along a proper map of closed pairs with a coefficient morphism
`f^*L_Y→L_X`, the extension `H_c^*(V;L|V)→H_c^*(X;L)` for open V⊆X, and
the supported and mixed-support cups for a pairing `L⊗L′→L″` (S3); and
invariance under a jointly proper homotopy H with H(I×A)⊆B, after the
identification of the endpoint pullback systems by transport along
t↦H(t,x) (S4). S5 below is this item's own.

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
`0 → C^*(X,A+(X∖K);L) → C^*(X,X∖K;L) → C^*(A,A∖(K∩A);L|A) → 0`,
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
by being closed. On a finite-dimensional locally finite Hausdorff CW pair,
compare this triangle with the supported CW-pair short exact cochain
sequence and triangle of AT's supported-cellular supplement, through that
supplement's finite-support cellular/singular comparison; the cellular
triangle is not an input to the collared-pair proof. S5 consumes S0–S4,
ordinary AT2–4 and AT6.1–6.2, independently of AT8.5 and of every
classifier and Thom construction of this roadmap.

**Checks.**
- For compact X take K=X: then X∖K=∅ and the comparison is the identity,
  so every closed pair in a compact space is support-excisive and the
  triangle is the ordinary pair sequence.
- For X=[0,1) and A={0} with collar c(0,u)=u: H_c^0(X)=0, H_c^0(A)=ℤ,
  H_c^1(X,A)=ℤ (each H^1(X,A∪(1−ε,1)) is that of an interval relative to
  its two ends) and H_c^1(X)=0, so the connecting map ℤ→ℤ of the triangle
  is an isomorphism.
- For the mapping-cylinder pusher with r0=1/4, r1=1/2 and χ=0 on
  [3/8,1/2], a point at height u=1/8 has χ(u)=1 and reaches the bottom at
  t=1, while a point at height 7/16 does not move.

**C1.2a mixed-support cup/module products.** The absolute-relative module
maps, the same-pair relative cup, and the cups and cross products into a
union of relative subsets on excisive couples, NDR/cofibration triads or
open complements of compact supports, with the small-chain comparison from
C(A)+C(B) to C(A∪B) under that hypothesis, are AT Stage 6.2's; their
support-colimit packaging is S3's supported and mixed-support cups. This
roadmap consumes both, constructs no second product, and uses a cup into
a union of relative subsets only under one of those hypotheses, never for
an arbitrary closed couple.

### 1.2b Bundle and coefficient comparisons, and Čech cohomology (C1.2b)

For arbitrary paracompact bases,
prove the bundle-specific Leray–Hirsch and
Thom comparisons through the singular CW-resolution pullback: construct
the evaluation |Sing X|→X as the counit of Mathlib's `sSetTopAdj : SSet.toTop ⊣ TopCat.toSSet`,
consume AT4's generic `simplicialRealizationCW` and paracompactness
instead of constructing a second realization CW structure. Own Milnor's
weak-equivalence theorem for this actual counit using the adjunction
triangle Sing(ε_X)∘η_(Sing X)=id. AT8.2 says Sing X is Kan and its
actual unit is a weak equivalence; two-out-of-three and the native
Kan/cubical comparison give the counit weak equivalence.
Consume AT8.2's cubical/Kan comparison on Mathlib's `SSet.KanComplex`
predicate, its `SSet.π₀` and its pointed-simplex homotopy structures;
construct any missing homotopy-group and fundamental-groupoid interfaces
in Tau Ceti. Consume AT4.8's connected-map homology comparison, with its
face-compatible Eilenberg compression, local-coefficient prism maps and
weak-equivalence coefficient-chain/Hom comparison; AT4.8 supplies that
comparison together with its weak-equivalence/local-coefficient form,
and this item constructs no part of it. Apply the supplied comparison to
this actual counit after proving the counit weak equivalence; do not build another
arbitrary-space weak-equivalence or CW-approximation theorem here.
Pull back the bundle and deleted/projective/flag bundles; item1's homotopy
sequence proves the corresponding total-space maps weak equivalences.
Export absolute and relative cohomology comparisons, including maps of pairs
and their long exact sequences. Do not infer
singular/Čech equality without its hypotheses. Consume Mathlib's
sites-based `cechComplexFunctor` with its AddCommGrpCat coordinate
comparisons, and its sheaf cohomology `CategoryTheory.Sheaf.H` where
that comparison is used. Consume
[TopologicalSheafCohomology TS1.1–TS1.2](../TopologicalSheafCohomology/README.md)'s
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
Own the Čech/singular comparison on CW type, which other roadmaps cite
under the name cechSingularCWTypeComparison: for every paracompact Hausdorff X of
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
C1.5's carrier/cellular comparison. Package the cohomology theory by its
Eilenberg–Steenrod interfaces (homotopy, excision, exactness) in
Mathlib's shapes where they exist, without replacing the actual complexes.
Construct missing comparison interfaces in Tau Ceti in these shapes and
adopt Mathlib's APIs when available.

**Checks.**
- For connected X the one-set cover {X} has tuple complex ℤ in every degree, with
  differentials 0, id, 0, id, …, so its cohomology is ℤ in degree 0 and 0 above; on S¹ this cover
  gives H¹=0, while the colimit over refinements and the singular comparison give ℤ, so reading
  Čech cohomology off one cover is wrong.
- The Warsaw circle is compact metric with Čech H¹=ℤ and is weakly contractible, so its singular
  H¹ is 0: the comparison needs its CW-type hypothesis.
- The closed topologist's sine curve is connected with two path components: its Čech H⁰ is ℤ and
  its singular H⁰ is ℤ², the same failure in degree 0.

### 1.3 Finite faithful representations and finite smooth approximations (C1.3)

For compact Lie G prove the no-small-subgroups property from the local
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
fibre E_m. Apply AT4.8's connected-map comparison after AT5.5's
homotopy exact sequence of this fibration. State the bound,
for example choose `2(m−N)≥d+1`. The cohomology comparison uses integral
homology and universal coefficients, not an assumed cohomology Serre theory. These comparisons include local coefficients and coefficient
naturality. Use SBC B6.0's finite smooth good cover and Mayer–Vietoris to prove
finite generation for compact B_m in each degree and the rational-to-real
base-change theorem there; this does not require smooth triangulation.

**Checks.**
- For G=U(1)⊂U(1) the approximation is E_m=S^(2m−1)→B_m=CP^(m−1); with m=3 the displayed bound
  allows d≤3, while restriction H^d(CP^∞;ℤ)→H^d(CP²;ℤ) is an isomorphism for every d≤5, so the
  bound is sufficient, not sharp.
- For G=ℤ/2⊂U(1), B_m=S^(2m−1)/{±1}=RP^(2m−1), and H^d(RP^∞;𝔽₂)→H^d(RP^(2m−1);𝔽₂) is an
  isomorphism for d≤2m−1.
- The compact group (S¹)^ℕ contains the subgroups of points with the first k coordinates equal
  to 1, which lie in every identity neighbourhood for large k, so it has no finite faithful
  representation: the Lie hypothesis behind no-small-subgroups cannot be dropped.

### 1.4 Smooth representatives of reductions and isomorphisms (C1.4)

Prove the smooth-principal-bundle comparison needed by these approximations:
continuous reductions to compact G and continuous principal isomorphisms
over smooth bases admit smooth representatives, including relative homotopy
versions (Müller–Wockel, *Equivalences of smooth and continuous principal
bundles with infinite-dimensional structure group*, Proposition I.13 for a
finite-dimensional structure group, and Theorems II.11 and II.12 for bundles
and for equivalences relative to a closed subset of the base). Use U(N)/G associated sections and relative Whitney approximation,
proving that section smoothing retains the reduction and prescribed data.
A smooth bundle classified by a smooth finite-approximation map has its
connection classes equal to pullbacks of universal classes by naturality.

### 1.5 Rank-one projective carriers, torus models and line classes (C1.5)

Use T1.6's named rank-one infinite Grassmannian models CP∞ and RP∞,
with their final/weak CW topology and tautological bundles. Own the
comparisons with the finite AT4.6 RPⁿ and CKG K7 CPⁿ carriers and their
finite-stage inclusions, and the degreewise cellular/cup comparisons.
This construction uses AT4/6 and T1.6's carrier portion, preceding the
Eilenberg–MacLane identification of C1.5a and ordinary line
classification. Prove
`H*(CP∞;Z)=Z[h]`, `H*(RP∞;F2)=F2[a]` and
`H*(RP∞;Z)=Z[y]/(2y)`, |h|=2, |a|=1, |y|=2, with `y=β(a)` and
its actual cup powers. Compare BU(1) and BO(1) with these CP∞ and RP∞
carriers, and RP∞ with the quotient S∞/{±1} of T1.6's universal double
cover, by the universal-bundle maps.
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

**Checks.**
- c₁(O(−1))=−h pairs to −1 with the complex-oriented CP¹, and c₁(O(1)⊗O(1))=2h by the tensor
  law; a convention with x=+h for the tautological line would pair O(−1) to +1.
- w₁ of the Möbius line over S¹=RP¹ is the nonzero a∈H¹(S¹;𝔽₂), and w₁ of the trivial line is 0,
  matching their connected and split orientation double covers.
- For m=1, ET_N=S^(2N+1) is 2N-connected and BT_N=CP^N, so H²(BT_N;ℤ)=ℤh for every N≥1, while
  N=0 gives a point and loses h; on T² the character z₁z₂ has class u₁+u₂=−h₁−h₂.

### 1.5a Classical Eilenberg–MacLane comparisons (C1.5a)

After the
carrier/cellular comparisons above, own the identification of T1.6's
rank-one RP∞ and CP∞ carriers, with their final/weak CW topology, as
K(ℤ/2,1) and K(ℤ,2), respectively (Hatcher, *Algebraic Topology*, Example 1B.3,
p. 88, and Example 4.50, p. 380), and the coefficient-natural
Eilenberg–MacLane comparison maps to AT8.10's ordinary models. Apply
C1.1b's specialized homotopy exact sequence to T1.6's universal double
cover and principal circle bundle, whose sphere total spaces T1.6 proves
contractible, to compute the homotopy groups of both carriers: RP∞ has
π₁=ℤ/2 and no other homotopy, and CP∞ has π₂=ℤ and no other homotopy,
the latter from the circle fibre's degree-one generator, pinned by
AT8.12's native circle comparison. Compare the real carrier with AT8.8's
classifying space of ℤ/2 through AT8.8b's normalized model comparison.
Compare the complex carrier with AT8.10's K(ℤ,2) by the map f_h that
AT8.10's representability assigns to the universal generator h, whose
restriction to complex-oriented CP¹ pairs to +1 under CKG K7's
orientation. Prove that f_h induces an isomorphism on π₂: CP∞ is simply
connected, so AT8.3's absolute Hurewicz theorem identifies π₂(CP∞) with
H₂(CP∞;ℤ)=ℤ, generated by the class of CP¹; AT8.10's evaluation of
ι_(ℤ,2) under Hurewicz and universal coefficients is the identity of ℤ;
hence f_h carries that generator to the generator of π₂(K(ℤ,2)) that
pairs to +1 with ι. Upgrade these weak equivalences to homotopy
equivalences by AT8.5's Whitehead theorem on these CW carriers. The real
degree-one class is the unique nonzero class, the class of the
double-cover generator. Prove restriction compatibility with the
finite-stage AT4.6 RPⁿ and CKG K7 CPⁿ comparisons above, and coefficient
change along every additive homomorphism ℤ→A for the complex comparison
and ℤ/2→A for the real one, including the reductions ℤ→ℤ/m for each
m≥1. No new infinite-projective carrier, characteristic-class definition
or finite-projective comparison is constructed here; C1.6 consumes these
comparisons. *Needs:* T1.6's carriers with their universal double cover
and principal circle bundle and the contractibility of their sphere total
spaces; C1.1b's homotopy exact sequence; AT8.3, AT8.5, AT8.8b, AT8.10
and AT8.12; CKG K7.2's u normalized on CP¹.

**Checks.**
- The composite CP¹→CP∞→K(ℤ,2) represents the generator of
  π₂(K(ℤ,2))≅ℤ that is +1 under AT8.10's normalized identification; the
  map classifying −h represents −1 and is excluded by the +1
  normalization on CP¹.
- The real comparison pulls ι_(ℤ/2,1) back to the class a∈H¹(RP∞;𝔽₂)
  with a²≠0; the constant map RP∞→K(ℤ/2,1) pulls it back to 0 and is
  excluded.
- H¹(RP∞;ℤ)=Hom(ℤ/2,ℤ)=0, so no homomorphism ℤ→A acts on a nonzero
  class of the real comparison: its coefficient naturality is along
  ℤ/2→A, and the first nonzero integral class is y=β(a) in degree 2.
  For the complex comparison, m=1 gives the contractible K(0,2) and
  H²(CP∞;ℤ/1)=0.
- π₁(RP∞)=ℤ/2 and π_n(RP∞)=0 for n≥2 from the double cover S∞→RP∞;
  π₂(CP∞)=π₁(S¹)=ℤ and π_n(CP∞)=0 for n≠2 from the circle bundle
  S∞→CP∞; a model with π₁(CP∞)≠0 is excluded by the connectedness of S¹
  and the contractibility of S∞.

### 1.6 Ordinary classification of line bundles (C1.6)

For CW complexes and for
paracompact Hausdorff bases of CW type, combine T1.6's numerable rank-one
bundle classification with AT8.10 ordinary representability and C1.5a's
class-normalized CP∞≃K(ℤ,2) and RP∞≃K(ℤ/2,1) comparisons. Prove
complex-line isomorphism classes ≃H²(X;ℤ), with tautological class x=−h,
and real-line classes ≃H¹(X;ℤ/2), with their natural tensor/dual maps (Hatcher,
*Vector Bundles and K-Theory*, Proposition 3.10, p. 86, for spaces of the homotopy type of a CW
complex).
Prove the relative versions for bundles with a prescribed trivialization
on a CW subcomplex, using AT8.10's relative map classes; preserve that
trivialization under isomorphisms and homotopies. This theorem follows
C1.5's carrier/cellular comparisons and C1.5a's Eilenberg–MacLane
identification; the C1.5 comparisons use no line-classification theorem
or Eilenberg–MacLane identification. On general paracompact bases retain
the stated Čech/singular distinction rather than assert singular classification.

### Examples

Over S¹ every positive-rank real bundle is trivial or the Möbius line plus a trivial bundle;
over S² the oriented plane bundles are indexed by the winding of their clutching function, TS²
having winding 2 and O(−1) winding −1 (C1.1d). H*(CP∞;ℤ)=ℤ[h], H*(RP∞;𝔽₂)=𝔽₂[a] and
H*(RP∞;ℤ)=ℤ[y]/(2y) with y=β(a) (C1.5), and RP∞ and CP∞ are K(ℤ/2,1) and K(ℤ,2) (C1.5a). For
X=[0,1) and A={0} the supported pair triangle has H_c^1(X,A)=ℤ and an isomorphism ℤ→ℤ as
connecting map (C1.2a).

### Dependencies

C1.0 uses the pinned Tau Ceti orthonormal-frame and orientation-cover declarations,
TopologicalKTheory T1's metrics and, for the smooth versions, SmoothBundlesConnections B2. C1.1a
uses C1.0 and TopologicalKTheory T1, T1.5 and T1.6a. C1.1b uses C1.0, C1.1a, TopologicalKTheory
T1.6, T1.6a and T6.4, AlgebraicTopology Stages 4.5 and 5.5, the pinned Serre-fibration
declarations and ClassifyingSpaces' discrete-group join. C1.1d uses C1.0, C1.1b,
TopologicalKTheory T1.5a and LieGroups Layers 2 and 5; its characteristic comparisons follow
C2–C3. C1.2 uses the pinned Bockstein and AlgebraicTopology Stage 6.1. C1.2a uses
AlgebraicTopology Stages 2–4 and 6.1–6.2 and the supported-cellular supplement, independently of
AlgebraicTopology Stage 8.5. C1.2b uses AlgebraicTopology Stages 4, 4.8 and 8.2, Mathlib's
`sSetTopAdj` and `cechComplexFunctor` and TopologicalSheafCohomology TS1.1–TS1.2, and for its
classifying-map square AlgebraicTopology Stages 8.9–8.10. C1.3 uses C1.1b, CompactGroups'
Peter–Weyl theorem, LieGroups, SmoothBundlesConnections B1.4 and B6.0, TopologicalKTheory T1 and
AlgebraicTopology Stages 4.8 and 5.5. C1.4 uses C1.3. C1.5 uses TopologicalKTheory T1.6,
AlgebraicTopology Stages 4 and 6, ComplexKahlerGeometry K7.1–K7.2 and SmoothBundlesConnections
B6. C1.5a uses C1.1b, C1.5, TopologicalKTheory T1.6, AlgebraicTopology Stages 8.3, 8.5, 8.8b, 8.10
and 8.12 and ComplexKahlerGeometry K7.2. C1.6 uses C1.5a, TopologicalKTheory T1.6 and
AlgebraicTopology Stage 8.10.

## C2: Thom, Euler and Gysin theory

### 2.0 Bundle disk/sphere cells (C2.0)

Before the cohomological Thom theorem,
construct the bundle disk/sphere relative cell structure for a continuous
real rank-r vector bundle
E over a Hausdorff native CW pair (X,A), with A a closed CW subcomplex.
Use TopK T1.3's continuous fiber metric and T1.4's compact-disk bundle
homotopy invariance. The carriers are the actual unit disk/sphere subsets
D(E)={v:‖v‖≤1} and S(E)={v:‖v‖=1} of the native bundle total space
(Hatcher, *Vector Bundles and K-Theory*, §1.1, p. 16, for the disk and
sphere bundles of a metric, and §3.2, p. 88, for the pair (D(E),S(E))
carrying the Thom class; Milnor–Stasheff §18, Lemma 18.1, for the cell
structure of the Thom space with one (q+r)-cell per base q-cell).
Use the subtype D(E) as ambient type, with its inherited topology; construct
native RelCWComplex on Set.univ in that subtype relative to the subset
S(E)∪D(E)|A, with one
(q+r)-cell for each relative base q-cell. Pull back E along its characteristic
map D^q→X, trivialize that compact-disk bundle and make the frame orthonormal.
The native bundle total space is Hausdorff by the pinned instance
`TauCeti.FiberBundle.t2Space_totalSpace` (`Topology/FiberBundle/Separation.lean`;
it needs a Hausdorff base and a Hausdorff model fibre, here a finite-dimensional
normed space), and D(E) inherits that Hausdorff topology. Use the native sup-norm cell cubes. Identify their product with the
(q+r)-cube by Fin.append, base coordinates first and fiber coordinates last.
On the fiber cube use AT2.5's single `supBallEuclideanDiskHomeomorph`,
whose fixed formula is v↦(‖v‖∞/‖v‖₂)·v for v≠0 and 0↦0, with inverse
w↦(‖w‖₂/‖w‖∞)·w; then apply the orthonormal frame. Include its rank0
point case.
Its boundary is (∂D^q×D^r)∪(D^q×∂D^r), the disk/sphere decomposition of a
product disk bundle (Cohen, *The Topology of Fiber Bundles*, Chapter3 §2,
the Thom space (2.4), p. 86, and Proposition3.7 with its proof, pp. 87–88). Compare the radial map's relative
homology generator through AT2.5's existing coefficient +1 normalization before using
it to normalize Thom cells. Prove the
attaching-map, closure-finiteness, weak-topology and compact-generation
comparisons using the locally compact disk fiber, and agreement with the
original bundle topology. Export the Thom cell dimension q+r with these exact indices,
metric-change radial bundle homeomorphisms, coordinate-transition CW comparisons,
homotopies for homotopic trivialization choices, and relative subcomplex
comparisons. Complex rank-r bundles use their underlying real rank2r bundle.
Construct the pointed Thom CW model as the based cofiber of S(E)→D(E);
in rank0 it is X with a disjoint basepoint, and the empty-base case is the
one-point based space. Treat locally constant variable ranks by their clopen
rank pieces. The cell construction requires no bundle orientation.

Export the bundle disk attachment CW model: for a continuous attaching map
S(E)→Z with Z Hausdorff, apply the A=∅ instance of the subtype
relative cell structure to AT4.5's `relativeCWPushout`, passing the
literal base B=S(E)∪D(E)|∅ within the disk subtype. Construct the relative-base/sphere homeomorphism from this relative base
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

**Checks.**
- For TS² over S² with one 0-cell and one 2-cell, the Thom CW model has the
  basepoint and cells of dimensions 2 and 4, matching H̃^*(Th(TS²);ℤ)=ℤ in
  degrees 2 and 4; a model without the shift by the rank would put them in
  degrees 0 and 2.
- For the trivial rank-r bundle over a point the model is the basepoint and
  one r-cell, that is S^r; in rank0 it is X with a disjoint basepoint, and
  over the empty base it is the one-point space.
- The Möbius line over S¹ with one 0-cell and one 1-cell gives cells of
  dimensions 1 and 2, the cell structure of RP²; no orientation is used, and
  H̃¹(RP²;ℤ)=0≠H⁰(S¹;ℤ) shows that the integral Thom isomorphism fails for
  this bundle.

### 2.1 Thom classes (C2.1)

The Thom pair `(E,E∖0)` is the pinned `TauCeti.thomPair F E`, a Thom class
is the pinned predicate `TauCeti.IsThomClass F E u` on a class of
`H^n(E,E∖0;R,M)` (a relative class restricting to a generator on every
fibre pair; `EulerClass.lean`), and the orientation local system o(E) is
the pinned `TauCeti.VectorBundleOrientationCover.signLocalSystem` with the
trivialization `TauCeti.VectorBundleOrientation.signLocalSystemIso` given by
an orientation (`Orientation/LocalSystem.lean`). Consume, by name, the pinned
below-rank vanishing over an arbitrary base
`TauCeti.isZero_singularCohomology_thomPair`, the finite-union Mayer–Vietoris
gluing `TauCeti.exists_singularCohomology_thomPairOver_biUnion` and its
uniqueness `singularCohomology_thomPairOver_biUnion_ext`, the directed-union
gluing `TauCeti.existsUnique_singularCohomology_thomPairOver_iUnion` over an
arbitrary trivializing cover (`MayerVietoris/Basic.lean`,
`MayerVietoris/DirectedUnion.lean`), pullback of Thom classes along fibrewise
isomorphisms `TauCeti.IsThomClass.pullback`, the compact-base existence
`TauCeti.VectorBundleOrientation.exists_isThomClass` for an oriented bundle
with any commutative coefficient ring, and the compact-base mod2 existence
`TauCeti.exists_isThomClass_of_compactSpace` without an orientation for a
coefficient ring with a single unit (`Orientation/ThomClass.lean`,
`MayerVietoris/Basic.lean`). Prove, over an arbitrary base and
with coefficients `Hom(C(−;R),M)` for R a projective K-module, that an
orientation o of E and an orientation ω of the model fibre F determine, for
every class g of `H^n(F,F∖0;R,M)`, exactly one class of `H^n(E,E∖0;R,M)`
whose restriction to each fibre pair is the pull-back of g along every
linear trivialization carrying o to ω, and the negative of that pull-back
along every linear trivialization carrying o to −ω
(`existsUnique_singularCohomology_thomPair_fiber`, read through the pinned
`Bundle.Trivialization.mapOrientation`); a generator g gives the Thom class
of the orientation. Prove that every
oriented bundle has a Thom class with any commutative coefficient ring
(`exists_isThomClass_of_orientation`), by the directed-union gluing of the
local classes of the compact-base proof (Milnor–Stasheff Thm 10.4,
existence and uniqueness); extend the mod2 existence to an arbitrary base
the same way. Prove coefficient naturality and the Thom module
isomorphism with any local coefficient system L, twisting by o(E).
Construct the orientation-valued
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
Use the directed-union theorem for homology and
compact simplex images, never Mayer–Vietoris of arbitrary compact subsets; extend by the free-chain cap mapping-cone argument
of Milnor–Stasheff §10, with field detection and integral torsion control. C1's CW replacement
transports the local-system proof; it is not a competing second definition.
Prove the neighbourhood/support and CW-resolution comparisons in C1 rather
than passing cohomology through arbitrary unions. Compare disc/sphere,
deleted-total-space and Thom-space pairs with actual bundle maps.

**Checks.**
- Over a point, the Thom pair is `(F,F∖0)`, the oriented class is `g`
  itself for the orientation ω and `−g` for `−ω`; a definition reading
  the sign from the trivialization alone, not from the orientation,
  would give `g` for both.
- In rank0 the Thom pair is `(X,∅)`, the fibre generator is the sign
  `±1 ∈ H⁰(pt)`, and the unique class is the locally constant sign
  function of the orientation; on two components with opposite signs it
  is `(1,−1)`, which no constant class gives.
- On the Möbius line bundle over the circle with coefficients `ℤ/2` the
  pinned compact-base existence gives a Thom class without orientation;
  with `ℤ` the bundle is not orientable
  (`VectorBundleOrientation.nonempty_iff_not_connectedSpace`: the cover is
  connected), so no integral Thom class exists, which a definition
  dropping the fibre-generator condition would miss.

### 2.2 Euler classes and the primary obstruction (C2.2)

The Euler class of a relative class is the pinned
`TauCeti.eulerClass R k M F E n` (restriction to E followed by zero-section
pullback; `EulerClass.lean`), with Euler naturality
`TauCeti.eulerClass_naturality` and `TauCeti.eulerClass_pullback`, vanishing
when a nowhere-zero continuous section exists
`TauCeti.eulerClass_eq_zero_of_forall_ne_zero`, and
`TauCeti.eulerClass_trivial_eq_zero`; `TauCeti.IsThomClass.neg` keeps the
predicate under negation. Consume these by name. Prove Thom naturality,
zero/rank-zero cases, direct sums and products with
orientation order, that the Thom class of the reversed orientation is the
negative (orientation reversal), Whitney products
with the corresponding local systems, and that the Euler class of the
oriented Thom class of C2.1 is natural for the orientation pullback.
Odd-rank oriented Euler satisfies 2e=0 and vanishes rationally;
it need not vanish integrally. Construct the sphere-bundle Gysin sequence. An oriented rank1 bundle
has its positive metric unit section, hence Euler0; retain signed rank0
separately from the positive-rank sphere obstruction statements.
Identify Euler with the primary section obstruction: orient the boundary
of each positive base n-cell outward, normalize the radial fibre sphere
to degree+1, and use the attaching section's degree in the sign local
system. Compare that obstruction cocycle with the zero-section Thom class. For an
integral Thom class u of a real bundle of rank n≥2 over a Hausdorff CW
complex with no cells of dimension above n, prove that e(u)=0 exactly when
the bundle has a nowhere-zero continuous section
(`eulerClass_eq_zero_iff_exists_ne_zero`, with integral coefficients lifted
to the universe of the base; the direction from a section to e(u)=0 is the
pinned `TauCeti.eulerClass_eq_zero_of_forall_ne_zero`), and prove the same
criterion for the twisted Euler class in `H^n(X;o(E))` of a bundle without
orientation. Retain higher obstructions outside that dimension range
(Milnor–Stasheff §12, the Euler class as the primary obstruction).

**Checks.**
- On S² with one 0-cell and one 2-cell, TS² has rank 2 and Euler number 2,
  so e≠0 and there is no nowhere-zero section; the trivial bundle S²×ℝ²
  has e=0 and a constant section.
- The realification of O(1) over CP¹=S² has Euler number 1 and no
  nowhere-zero section, since such a section would trivialize the complex
  line; over S¹, a complex of dimension 1<2, every oriented rank-2 bundle
  is trivial and H²(S¹)=0, so both sides hold.
- The bundle su(F) on S⁴ of C7.AdjointHopfObstruction has rank 3 over a
  4-dimensional complex, e=0 and no nowhere-zero section: dropping the
  dimension bound makes the criterion false.

### 2.3 Transverse sections, local indices and the Euler number (C2.3)

For a transverse smooth section prove its zero locus has the specified
orientation and represents Euler via Thom/Gysin. On a closed oriented
manifold prove the sum-of-local-indices formula and e(TM)[M]=χ(M), with
the cap/degree normalization of the suppliers. Here χ(M) is the pinned
`TauCeti.eulerChar` of a space of finite CW type, the pairing is the pinned
`TauCeti.HomologicalOrientation.evalFundamentalClass`, and e(TM) is the
Euler class of a Thom class u of TM normalized by the tangent-bundle
orientation `TauCeti.Manifold.Orientation.toVectorBundleOrientation` of the
oriented manifold (`Geometry/Manifold/Orientation/Basic.lean`): on every
fibre u pairs to 1 with the pinned generator `Orientation.localOrientation`
of `H_(n+1)(E,E∖0;ℤ)` that the tangent orientation selects
(`Singular/LocalHomology/Orientation/Linear.lean`). The local homology
orientation at each point is the pinned
`TauCeti.localOrientationOfManifoldOrientation`
(`Singular/LocalHomology/Orientation/Chart.lean`), the oriented-chart
generator for the chart orientation at that point, which is the tangent
orientation there. Package these local orientations as a
`TauCeti.HomologicalOrientation` by proving their compatibility with
transport along paths. For a compact Hausdorff boundaryless smooth manifold
of dimension n+1≥1 modelled on a finite-dimensional real inner product
space, of finite CW type, with such a Thom class u and a homological
orientation agreeing at every point with these local orientations, prove
`⟨e(u),[M]⟩=χ(M)` (`eval_eulerClass_tangent_eq_eulerChar`; Milnor–Stasheff,
Corollary 11.12). Using one orientation for both normalizations is what
fixes the sign. `TauCeti.FiniteCWType` is a hypothesis because the pins
have no instance for compact manifolds; every closed smooth manifold
satisfies it. Dimension zero, where an orientation is a sign at each point,
is separate. Prove the χ identity by
identifying Euler with diagonal self-intersection, then evaluating the
Poincaré-duality/Künneth trace; finite good covers give the finite-generation
and cohomological-dimension bounds. This does not assume a Morse triangulation. Compare the rank2 class with
GT Layer10 and C1's normalized degree2 class of the corresponding complex
line, including the SBC dual-character convention. C3 identifies it with c₁. Construct characteristic-number evaluation and
its naturality, degree and boundary-vanishing formulas. For a closed
connected oriented M with m≥1 and a continuous self-map f prove
`⟨f*e(TM),[M]⟩=deg(f)χ(M)` from Euler naturality, the χ identity and
f_*[M]=deg(f)[M]; no graph, diagonal class or fixed-point count enters.

**Checks.**
- Reversing the orientation replaces u by −u and [M] by −[M], so
  `⟨e(u),[M]⟩` is unchanged; normalizing u by o but [M] by −o would give
  −χ(M), which is −2 on S².
- On S³ and on T³, χ=0; e(TM) is 2-torsion in a torsion-free H³(M;ℤ), so
  it is 0 and both sides vanish.
- The identity map of S² gives 2 on both sides; the antipodal map, of
  degree −1, gives −2.
- A constant map on S² gives 0, while its Lefschetz number is 1: the
  pullback identity is not a fixed-point count. The Lefschetz
  fixed-point formula is not stated in this roadmap.
- The boundary of a tetrahedron has 4 vertices, 6 edges and 4 faces:
  the index sum of the barycentric field below is 4−6+4=2=χ(S²); a
  triangle as a circle gives 3−3=0.

### 2.3a Worked example: the barycentric Hopf field and its simplex indices (C2.3a)

This example evaluates C2.3's sum-of-local-indices formula on
one explicit field; it is not a second proof of C2.3's theorem, which has
no triangulation input. For a compact
boundaryless smooth Hausdorff second-countable m-manifold M, take a
specified finite compatible smooth triangulation h:|K|≃M from GT
Layer11's smoothing-and-triangulation comparison. Use its Munkres closed-simplex
extensions and injective differential on each closed star. On a flag
σ_0<⋯<σ_r in the barycentric subdivision, put d_i=dim σ_i, let t_i
be the barycentric weights, and set μ=Σ_i t_i d_i and
v_i=t_i(d_i−μ). Define the realization velocity as Σ_i v_i b_(σ_i).
Prove Σ_i v_i=0, compatibility on common faces, and that zero weights
have zero velocity. Strict increase of the d_i gives zero velocity
exactly at flag vertices. Prove the height derivative identity
Σ_i d_i v_i=Σ_i t_i(d_i−μ)^2, strictly positive off those vertices.
Push the face-tangent velocity through h's simplex differentials,
proving agreement on faces and continuity as an actual section of TM.
The resulting continuous field has precisely the points h(b_σ) as zeros.

Prove its local index at h(b_σ) is (−1)^d, where d=dim σ. Construct
the tangent-star homeomorphism from the closed-star differential and
the compatible smooth triangulation. The link of b_σ in the subdivision
is the join of the subdivisions of ∂σ and link_K(σ): a simplex of the
subdivision containing b_σ is a flag through σ, and a flag omitting σ
splits uniquely into its part below σ, a simplex of sd(∂σ), and its
part above σ, a simplex of sd(link_K(σ)); its closed star
is the cone on this link. Track lower faces and strict cofaces in this
model. On a flag containing σ_j=σ, rewrite the local velocity as
Σ_(i≠j)t_i(d_i−μ)(b_(σ_i)−b_σ). Restrict to a neighborhood with
|μ−d|<1/2, and freeze only these noncentral rates to d_i−d, keeping
the coefficient at b_σ equal to minus their sum so tangency is retained.
Then deform these rates to−1 on lower faces and+1 on cofaces, without
creating another zero. This gives a homotopy of the normalized field to
(u,v)↦(−u,v) on R^d×R^(m−d). Prove the local tangent trivialization
and degree comparison, not just positivity of the height derivative.
Treat d=0 and d=m directly when one of the link factors is empty;
an ordinary topological join with an empty space is not the needed
unit convention for the simplicial link formula.

Construct a smooth field V with exactly those same zero points and
with invertible zero linearizations of determinant sign (−1)^d.
Choose disjoint coordinate balls about the finitely many h(b_σ).
On smaller balls prescribe the linear model (−u,v). In dimensions
m>=2, the preceding local index and AT's sphere-degree classification
give the zero-free normalized homotopy on each intervening annulus;
make it stationary on endpoint collars and construct its radial pasting
to the original nonzero field. In m=1
use the two endpoint signs directly. Smooth the section relative to
these smaller balls using bundle-chart approximation and DG's smooth
partitions of unity, keeping its base projection fixed. A positive
lower bound for the field norm on the compact complement of the fixed
smaller balls, including the pasted annuli,
gives an approximation bound preserving nonvanishing there. Supply
the actual tangent-bundle section, its smoothness and zero-set equality,
and compare its zero linearizations with the prescribed local models.
In m=0 the field vanishes at every point of the finite discrete
manifold, and the empty-dimensional determinant and local index are+1.
Include empty and disconnected manifolds and triangulations.

Evaluate C2.3's sum-of-local-indices formula on this field: its index
sum is Σ_σ(−1)^(dim σ), which AT7 identifies with χ(M), in agreement
with C2.3's theorem e(TM)[M]=χ(M) (Milnor, *Topology from the
Differentiable Viewpoint*, §6, for the index and its sum). In the
unorientable case explicitly use e(TM)∈H^m(M;o(TM)), the twisted
fundamental class [M]∈H_m(M;o(M)), the canonical identification
o(TM)≃o(M), and the sign-system pairing o(M)⊗o(M)→Z; the local indices
are unchanged by simultaneous reversal of source and tangent-fibre
orientations. The example consumes C2.3's local-index formula, GT
Layer11's compatible smooth triangulation, DG's relative section
smoothing and AT's degree/Euler interfaces; C2.3 itself consumes none of
the triangulation. An arbitrary realization homeomorphism alone does not
supply the simplex differentials used in this construction.

**Checks.**
- On one flag simplex with weights t and dimensions d, Σ_i v_i=0 and
  Σ_i d_i v_i=Σ_i t_i(d_i−μ)² are polynomial identities in t: the first
  fails for the unnormalised candidate v_i=t_i d_i, the second for
  v_i=t_i(μ−d_i).
- A zero weight t_i=0 gives v_i=0, so the formula glues along faces; a
  flag with strictly increasing dimensions has zero velocity only at its
  vertices, while a repeated dimension would give a zero on the open edge
  joining two vertices.
- The index at the barycentre of a d-simplex is (−1)^d: +1 at a vertex
  (a source), −1 at an edge midpoint of a surface (a saddle), +1 at a
  face barycentre (a sink); on the boundary of a tetrahedron the sum is
  4−6+4=2.
- In m=0 every point is a zero of index +1, and the index sum is the
  point count; the empty manifold has index sum 0.

### 2.4 Embedding Gysin maps (C2.4)

Construct oriented and orientation-twisted embedding Gysin by Thom followed by tubular open
extension; prove independence, isotopy, composition, transverse base change,
self-intersection and the projection formula (Bott–Tu, *Differential Forms
in Algebraic Topology*, §6, for the Thom isomorphism, the Thom class of a
normal bundle as the dual class of the submanifold, and the projection
formula). Consume GT's normal/tubular
maps and supply orientation/support comparisons. Noncompact embeddings use
proper maps and compact-support groups; a bare Thom class on a noncompact
base is a fibre-support multiplier, not a compact-support class.

**Checks.**
- For the diagonal S²→S²×S² the normal bundle is TS², so the self-intersection formula gives
  Δ*Δ_!(1)=e(TS²), which pairs to 2.
- For a line CP¹⊂CP² the normal bundle is O(1), so i*i_!(1)=e(O(1)_ℝ)=h pairs to 1, the
  self-intersection of a line; the opposite normal orientation would give −1.
- For a point in Sⁿ with n≥1, i_!(1) generates Hⁿ(Sⁿ;ℤ), while i*i_!(1) lies in Hⁿ(pt)=0, the
  Euler class of the trivial normal bundle of positive rank.

### 2.5 Fibre integration (C2.5)

Construct fibre integration for proper smooth submersions with compact fibres, using the vertical
orientation system and its chosen-orientation specialization: export
`p!:H^k(E;o(Tp)⊗p*L)→H^(k−d)(B;L)` for every displayed local system L
(Bott–Tu §6, for integration along the fibre of an oriented bundle on forms
and its projection formula).
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

**Checks.**
- For the projection p:B×S²→B and the second projection q, with σ∈H²(S²)
  pairing to 1 with [S²], p! sends p*a∪q*σ to a and sends p*a to 0,
  since it lowers degree by 2.
- For the same p, e(Tp)=q*e(TS²) pairs to 2 on each fibre, so
  p!(e(Tp)∪p*a)=2a=χ(S²)a; for a circle fibre both sides are 0.
- Over B=pt, p! on H²(S²) is evaluation on [S²], which changes sign when
  the vertical orientation is reversed.

### 2.6 Flag-bundle transfer over paracompact bases (C2.6)

For an associated G/T bundle over a numerable principal bundle for compact connected G over a paracompact base, construct cohomological fibre integration without assuming
the base is a manifold. The Euler-integral input, a closed top-degree form
on the fibre with nonzero integral and the transfer `T(φ)=π_*(Ψ∧φ)` built
from it, is Dupont, *Curvature and Characteristic Classes*, Lemma 8.30 and
its proof, pp. 125–129, which work with forms on a simplicial manifold; the
construction below over a paracompact base without a manifold structure is
this item's own. Embed G/T equivariantly as the adjoint orbit of a
regular torus element in g, prove its normal bundle and uniform equivariant
tubular neighbourhood using the invariant inner product and nearest-point
uniqueness, and associate those maps over the base. Define
fibre-compact support cohomology of the ambient vector bundle by disc pairs.
Thom/extension followed by inverse ambient Thom gives the transfer; prove
its coefficient, module, base-change and Euler-weighted identities. This
supplies the actual rational flag-pullback injection for characteristic
identities on arbitrary bases in C5.5 and virtual classes in C6, beyond
universal smooth approximations. Prove agreement with C2.5 on smooth bases.

**Checks.**
- For G=SU(2) the fibre G/T is S² and the Euler integral is 2=|W|, so the transfer satisfies
  p!(e(T_p)∪p*a)=2a.
- For G=T the fibre is a point, |W|=1 and the transfer is the identity; for G=U(3) the fibre is
  the full flag manifold of ℂ³, with Euler characteristic 6=|S₃|.
- For G=SO(3) the class W₃=β(w₂) of order 2 in H³(BSO(3);ℤ) restricts to 0 in the torsion-free
  H*(BT;ℤ), so restriction becomes injective only after inverting |W|=2: the flag-pullback
  injection is rational.

### Examples

TS² has Euler number 2 and no nowhere-zero section, the realification of O(1) on CP¹ has
Euler number 1, and the Thom CW model of TS² over its two-cell structure has a basepoint and
cells of dimensions 2 and 4 (C2.0–C2.2). On S² the antipodal map gives
`⟨f*e(TS²),[S²]⟩=−2` (C2.3). The barycentric field on the boundary of a tetrahedron has index
sum 4−6+4=2=χ(S²) (C2.3a). For the product bundle B×S²→B, fibre integration sends e(Tp)∪p*a to
2a (C2.5).

### Dependencies

C2.0 uses TopologicalKTheory T1.3–T1.4, AlgebraicTopology Stages 2.5 and 4.5 and the pinned
`TauCeti.FiberBundle.t2Space_totalSpace` and `TauCeti.hasHomotopyExtensionProperty_base`; it
uses no orientation. C2.1 uses C1.0, C1.2b and the pinned Thom-pair, gluing and orientation
declarations. C2.2 uses C2.1 and AlgebraicTopology Stage 8.9. C2.3 uses C2.1–C2.2, the pinned
fundamental class, local orientations and Euler characteristic, and for the rank-two
comparison GeometricTopology Layer 10 and SmoothBundlesConnections B6; C2.3a also uses
GeometricTopology Layer 11, DifferentialGeometry's smooth partitions of unity and
AlgebraicTopology Stage 7. C2.4 uses C2.1 and GeometricTopology's normal and tubular maps. C2.5
uses C2.1, C1.2a, DifferentialGeometry Layers 8 and 10.2, GeometricTopology Layers 1 and 3 and
Mathlib's `exists_embedding_euclidean_of_compact`. C2.6 uses C1.1b, C2.1 and the invariant inner
product of LieGroups Layer 5A.

## C3: Projective splitting and integral/mod2 classes

### 3.1 Leray–Hirsch (C3.1)

Prove and export general cohomological Leray–Hirsch for a numerable locally
trivial fibre bundle with a finite homogeneous family of global classes whose
restrictions give a free basis of the entire fibre cohomology over R (Hatcher,
*Algebraic Topology*, Theorem 4D.1, p. 432, for fibre cohomology finitely generated and free in
each degree). Retain
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
consume the pinned Milnor sequence of a tower of complexes whose shift is
surjective in every degree, `TauCeti.ComplexTower.limOneToHomology_injective`,
`TauCeti.ComplexTower.exact_limOneToHomology_homologyToLim` and
`TauCeti.ComplexTower.homologyToLim_surjective`
(`Algebra/Category/ModuleCat/Tower/Milnor/Basic.lean`), and the
Mittag–Leffler vanishing `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`
(`Tower/MittagLeffler.lean`), as AT Stage 6.0 does, then prove the needed
skeletal stabilization.
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
its weak-equivalence construction and AT4.8's ordinary coefficient-chain/Hom
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
p* is the proper pullback of C1.2a S3 and the cup is S3's
compact-support/ordinary mixed product, in the displayed order.

For each compact K⊆B apply the preceding ordinary relative theorem to
(B,B\K) and (E,E\p⁻¹K), retaining these exact pair carriers and cup
representatives. Properness makes p⁻¹K compact. Prove compatibility
with K⊆K', coefficient maps, restrictions and the mixed products.
Prove inverse-image supports cofinal among compact subsets of E:
for compact L⊆E, p(L) is compact and L⊆p⁻¹(p(L)). Pass through the
exact filtered ModuleCat colimits of C1.2a S0 to obtain the displayed supported
isomorphism and its actual cochain-level comparison. This step uses
ordinary relative comparisons before supports, not compact-support
invariance under an unproved proper CW resolution.

For a closed base subset A⊆B give the corresponding isomorphism
`⊕_j H_c^(n-d_j)(B,A;R) → H_c^n(E,p⁻¹(A);R)` using, at each compact K,
the relative subset A∪(B\K) and its full inverse image. The ordinary
pair theorem above applies even if this union is not paracompact.
Use the union-relative supported carrier of C1.2a S0; do not assume the
S5 pair triangle for arbitrary closed A. Prove the
coefficient, proper-pullback, mixed-module, enlargement and connecting
comparisons on the actual pairs; when invoking a supported pair LES,
retain the support-excisive hypotheses of C1.2a S5.

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

### 3.2 Stiefel–Whitney and Chern classes (C3.2)

In positive rank define w_i and c_i by the unique monic projective
relations above (Hatcher, *Vector Bundles and K-Theory*, §3.1, pp. 79–81, with the same real
relation and the same alternating complex relation in the class of the tautological sub-line). In rank0 define the total class as1, with all positive
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

**Checks.**
- For a line E, P(E)=X and the relation reads a−c₁(E)=0, so c₁ is C1's
  line class: on CP¹, c(O(−1))=1−h and c(O(1))=1+h; a relation with
  +c₁(E)a^(r−1) would give c(O(−1))=1+h.
- On RP², T⊕ε¹≅γ^⊕3 gives w=(1+a)³=1+3a+3a²=1+a+a² (a³=0): w₁=a≠0
  detects nonorientability and w₂=a²≠0, while an additive sum law would
  give 1+3a=1+a with w₂=0.
- On CP¹, c(TCP¹)=(1+h)²=1+2h and c₁ pairs to 2, the Euler number of
  TS², as c_r=e(E_R) requires; w₂(TS²)=2h mod 2=0, whereas
  w₂(O(1)_R)=h mod 2≠0.
- In rank0 c=w=1; the empty projectivization imposes no relation, and no
  coefficient is read from it.

### 3.3 Pontryagin classes and integral Bockstein classes (C3.3)

Define integral Pontryagin classes from complexification, `p_i(E)=(−1)^i c_(2i)(E_C)`
(Hatcher, *Vector Bundles and K-Theory*, §3.2, p. 94); prove conjugation,
2-torsion of odd complexification Chern classes, stabilization, naturality,
rank vanishing and `p_i mod2=w_(2i)^2`. For k≥1 export the exact Whitney correction
`p_k(E⊕F)=Σ_(a+b=k)p_a(E)p_b(F)+(-1)^k Σ_(a+b=k−1)c_(2a+1)(E_C)c_(2b+1)(F_C)`
(Milnor–Stasheff Theorem 15.3 states the product formula modulo elements of order 2).
Prove its difference annihilated by2 and multiplicativity over Z[1/2]/Q;
the formal-series form, over any commutative ring, is that twice the
difference between an even coefficient of a product of two power series
and the convolution of their even coefficients vanishes once the odd
coefficients of the first factor are 2-torsion.
Prove `p_r(E)=e(E)^2` integrally for an oriented rank2r real bundle by
comparing the real orientation of E_C with E⊕E; the permutation sign is
(-1)^r. For a complex bundle prove p(E_R)=∏(1+x_j²). Define the integral
Bockstein classes `W_k(E)=β(w_(k−1)(E))` for k≥1; prove naturality,
2-torsion, W₁=0, W_k=0 for k>rank(E)+1, and `c₁(E_C)=β(w₁(E))`. Prove the reduction
formula `ρβ(w_j)=w₁w_j+(j−1)w_(j+1)` for j≥1 over F2 by the universal flag roots
and the cochain Bockstein product rule. This does not presume Steenrod theory.

**Checks.**
- On CP², (TCP²⊕ε)_C≅O(1)³⊕O(−1)³ has c=(1−h²)³=1−3h², so
  p₁(TCP²)=(−1)¹c₂=3h² and p₁/3 pairs to the signature 1; without the
  sign (−1)^i one would get p₁=−3h² and signature −1.
- For the oriented plane bundle E=O(1)_R on CP², E_C≅O(1)⊕O(−1) gives
  p₁(E)=−c₂(E_C)=h²=e(E)², the case r=1 of p_r=e².
- On RP⁴ the tautological line L has c₁(L_C)=β(a)=W₂(L)≠0 in
  H²(RP⁴;ℤ)=ℤ/2 and p₁(L)=0, while p₁(L⊕L)=−c₂((L⊕L)_C)=−β(a)²≠0, which
  is the correction term (−1)¹c₁(L_C)c₁(L_C); the clean product formula
  would give 0. Also W₁(L)=β(1)=0, and ρβ(w₁)=w₁² gives ρW₂(L)=a².

### 3.4 Universal unitary, orthogonal and oriented rings (C3.4)

Compute `H*(BU(r);Z)=Z[c₁,…,c_r]` by integral flag injection into
`H*((BU(1))^r;Z)`, the permutation action and the fundamental symmetric
polynomial theorem, consuming Mathlib `MvPolynomial.symmetricSubalgebra`,
`esymm`, `psum` and `esymmAlgEquiv`. Prove the universal flag total-space comparison, not
just an equality of root formulas. The analogous real ordered-line flag
proves `H*(BO(n);F2)=F2[w₁,…,w_n]`. Use the determinant-line Gysin sequence
and injectivity of multiplication by w₁ to prove
`H*(BSO(n);F2)=F2[w₂,…,w_n]` for n≥1, with the canonical rank0 case separate. Compare stabilization and rank restrictions.
Integral BO/BSO is not inferred from these mod2 or rational rings (Hatcher, *Vector Bundles
and K-Theory*, Theorem 3.9, p. 84, for BO(n) mod 2 and BU(n), and Proposition 3.12, p. 90, for
BSO(n) mod 2).

### 3.4a Partial-frame primary obstruction comparison (C3.4a)

After C3.4, compare
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
class vanishing permits the changes stated in AT8.9 (Milnor–Stasheff §12, for the Euler and
Stiefel–Whitney classes as primary obstructions).

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

### 3.5 w₂ and the spin central-lift obstruction (C3.5)

Identify w₂ with the universal transition-lift cocycle for the real spin
central double cover. In positive rank consume native
`CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`
from `Topology/Algebra/CliffordAlgebra/Spin/Covering`, with its compactness
instance from `Compact`; retain the actual rightHom and central μ2 kernel.
Use evenly covered SO neighborhoods for continuous local sections.
Consume `CliffordAlgebra.pathConnectedSpace_realCliffordSpinGroupZero_add_two`
from `Connected` for ranks≥2, including the rank2 squaring-cover
nontriviality detected by restriction to SO(2) and e mod2.
`realCliffordSpinLastLocalSection` is a section over the unit sphere and
is not an SO-cover section. On the closed range carriers consume the
pinned covering `TauCeti.CliffordAlgebra.isCoveringMap_realCliffordSpinToSpecialOrthogonalRange`
for n≥1, its kernel `realCliffordSpinToSpecialOrthogonalRange_eq_one_iff`
(exactly the units ±1), its surjectivity, and the topological isomorphism
`realCliffordSpinContinuousMulEquivUnitsRange` of the Spin group with its
Clifford-units range (`Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean`),
together with `TauCeti.QuadraticMap.mem_range_specialOrthogonalToGeneralLinear_realCliffordForm_iff`
(`Topology/Algebra/QuadraticForm/RealSpecialOrthogonal.lean`), which
identifies the matrix-units range with `Matrix.specialOrthogonalGroup (Fin n) ℝ`.
Own here the transport of that covering to the structure group of C1.0's
oriented orthonormal frames through an ordered positive orthonormal basis,
and its independence of that basis up to conjugation; the topological
cocycle uses no smooth-cover refinement.
For a numerable oriented bundle construct the Čech central-lift cocycle
from actual transition functions and continuous local lifts after refinement.
Own the paracompact refinement/local-lift lemma using the covering
neighborhoods, and prove independence of cover/refinement/lifts, the
cocycle equation and pullback naturality. On a paracompact Hausdorff
base of CW type compare its
Čech class with singular cohomology through C1.2's all-CW-type comparison
and normalized classifying-map square; on finite smooth approximations
specialize to their genuine good covers. Then
identify its mod2 class with the projective w₂ (Cohen, *The Topology of Fiber Bundles*,
Chapter 4 §5.5, Theorem 4.38 and Corollary 4.40, p. 167: an oriented bundle over a CW complex
has a Spin structure exactly when w₂=0, and w₂ generates H²(BSO(n);𝔽₂) for n≥3). Work
universally on BSO(n)
and compare on finite smooth approximations/good covers. H²(BSO(n);F2)
is generated by w₂ for n≥2; restriction to SO(2) identifies the central
squaring-cover obstruction with e mod2. Prove stabilization and the rank0/1
cases. In rank0 the lift group is μ₂={±1}⊂ℝ with the trivial map to
SO(0)={1}, not the trivial native Mathlib Spin(0), which is generated by
invertible vectors and is {1}; in rank1, Spin(1)={±1} over SO(1)={1}, by
the pinned kernel statement and −1=e₁·(−e₁)∈Spin(1). In both ranks the canonical frame bundle
lifts as the trivial principal μ₂ bundle, w₂=0 and the trivial lift
exists. Retain the signed rank0 orientation and the rank1 orientation
separately. On paracompact
Hausdorff bases of CW type export the singular/Čech obstruction
comparison; for finite-dimensional Hausdorff second-countable smooth manifolds consume AT8.7's
countable locally finite triangulation/CW comparison. Retain the Čech
obstruction on a general paracompact base.
SpinGeometry G4.3 consumes this equality and this item's general
paracompact atlas-refinement/local-lifting lemma; its H¹ torsor of lifts
uses a given lift, independently of the universal obstruction equality.

**Checks.**
- On CP¹ the oriented plane O(1)_ℝ has an equatorial transition of winding 1 in SO(2)=U(1); a
  lift through the squaring cover Spin(2)→SO(2) would be a continuous square root of z on the
  circle, which does not exist, and indeed w₂ is e mod 2, the nonzero class of H²(CP¹;𝔽₂).
  TS², of Euler number 2, has w₂=0 and a spin lift.
- For CP², w₂(TCP²)=c₁ mod 2=3h mod 2≠0, so CP² has no spin structure.
- In rank0 and rank1 the frame bundle lifts as the trivial μ₂ bundle and w₂=0; taking Mathlib's
  trivial Spin(0) as the rank0 lift group would lose the central μ₂.

### 3.6 Orthogonal universal rings away from 2 (C3.6)

Build
the BSO ring isomorphism away from 2 for every commutative coefficient ring R with
`IsUnit (2 : R)`, on TopK T1.6's fixed-rank and stable BSO carriers, as actual
graded-ring isomorphisms sending the polynomial generators to C3's
universal Pontryagin and C2's Euler classes. Export its R=F_p instance
and integral-reduction comparison, the mod-odd-prime BSO ring isomorphism.
For every such R, including ℤ[1/2], for r≥1 prove
`H*(BSO(2r);R)=R[p₁,…,p_(r−1),e]`, |pᵢ|=4i, |e|=2r and p_r=e²;
for r≥0 prove `H*(BSO(2r+1);R)=R[p₁,…,p_r]` (Hatcher, *Vector Bundles and K-Theory*,
Theorem 3.16, p. 95, whose proof computes these rings for R=ℤ[1/2]; Milnor–Stasheff §15).
The stable ring is R[p₁,p₂,…], with every class a finite polynomial.
BSO(0) is the chosen point carrier and BSO(1) is contractible through
C1.1's comparison with B_join of the trivial group. Their rings are R;
the canonically
oriented zero-bundle Euler class is1 and the rank1 Euler class is0.
BSO(2) has the one degree2 Euler generator, with p₁=e². There is no
independent degree0 Euler polynomial variable in rank0.

This item consumes C1–2, C3.1–4, AT4's CW compactness, AT6.0–6.1's
cochains and the pinned tower Milnor sequence named in C3.1, independently of C3.5's Spin
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
its oriented lift, new positive line first, of T1.5's rank map.
Use the standard zero-based flag, with e_i=Pi.single i 1 and rank map
V↦ℝe₀⊕shift(V); its underlying image is the closed Schubert subcomplex
with first pivot in Fin position0. These lifted cells and the fixed-rank
and stable colimits belong to TopK T1.6a. The
stable union uses only TopK T1.6's fixed cellular tower. Compact singular-simplex images lie in finite CW
subcomplexes by AT4, hence in a bounded-rank stage. Therefore the stable
singular chain complex is their direct union and its cochains are the
inverse limit of the fixed-rank cochains, with surjective restrictions
proved by extension by zero on the singular-simplex basis. Apply
the pinned tower Milnor sequence of C3.1 and the Gysin stable range to show eventual
degreewise stabilization and lim¹=0, retaining multiplicativity and
independence of the chosen compatible CW structures.

Pin T^r→SO(2r) as U(1)^r⊂U(r) realified in the ordered coordinates
(ε_j,iε_j)↦(e_(2j),e_(2j+1)) for j:Fin r, with zero-based
coordinate vectors and blocks
[[cosθ,−sinθ],[sinθ,cosθ]]. In odd rank prepend the positively oriented
trivial coordinate. Define x_j as c₁ of its coordinate character's
associated complex line, oriented by its complex structure; C1.5 fixes
x_j=−h_j. Prove the torus restriction of the Pontryagin and Euler classes:
restriction sends pᵢ to the i-th elementary symmetric polynomial in
x₀²,…,x_(r−1)² and e to ∏_(j:Fin r)x_j in even rank, with the ordered-plane
orientation retained. The odd-rank trivial summand carries its canonical
orientation. These formulas and polynomial independence prove
injectivity of the torus restriction mod every odd p, including
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

### Examples

w(RP²)=1+a+a², so RP² is not orientable and w₂(RP²)=a²≠0 (C3.2). p₁(TCP²)=3h², and on RP⁴
the tautological line has p₁(L)=0 while p₁(L⊕L)=−β(a)²≠0, the integral Whitney correction
(C3.3). w₂(O(1)_ℝ)≠0 on CP¹, so this plane bundle has no spin lift, while w₂(TS²)=0 (C3.5).

### Dependencies

C3.1 uses C1.2a, C1.2b, AlgebraicTopology Stages 4.8 and 6.0 and the pinned Milnor tower
sequence. C3.2 uses C3.1, C1.5's line classes and C2.2's Euler products. C3.3 uses C3.2 and the
pinned Bockstein of C1.2. C3.4 uses C3.1–C3.3, C2.2's Gysin sequence and Mathlib's symmetric
polynomials. C3.4a uses C3.4, C2.2, TopologicalKTheory T1.5a and AlgebraicTopology Stage 8.9.
C3.5 uses C1.0, C1.2b, C3.4, the pinned Clifford spin-cover declarations and AlgebraicTopology
Stage 8.7. C3.6 uses C1–C2, C3.1–C3.4, AlgebraicTopology Stages 4 and 6.0–6.1 and
TopologicalKTheory T1.5–T1.6a, independently of C3.5, C4–C5 and all bordism operations.

## C4: Curvature classes and their integral comparison

### 4.1 Invariant polynomials and Chern–Weil forms (C4.1)

Define Ad-invariant homogeneous symmetric polynomial forms on the actual
Lie algebra, with product, polarization, pullback by Lie homomorphisms and
finite matrix evaluation. Apply them to curvature using DG's value-bundle
wedge/composition and SBC's principal curvature. Prove horizontal/invariant
descent, closedness from Bianchi, and connection independence by the affine connection path and explicit
transgression form (Dupont, *Fibre Bundles and Chern–Weil Theory*, §9,
Proposition 9.1 for polarization, Proposition 9.3 for closedness,
Theorem 9.5 and Lemma 9.6 for connection independence). Prove gauge invariance,
functoriality, product/Whitney and real/complex comparison identities.

### 4.2 Classical curvature forms and their integral comparison (C4.2)

Construct Chern, trace-character, Pontryagin and Pfaffian forms with the
normalizations above. Prove the rank-one singular/de Rham comparison using
SBC B6; on a smooth projective flag compare with split line connections,
use connection independence and cohomological flag injection, and obtain
exactly the real images of C3's Chern and Pontryagin classes. C5.5 proves
the Euler/Pfaffian comparison after oriented real splitting. Curvature
comparison retains the distinction between an integral class and its real image.

**Checks.**
- For P(X)=tr(X²) the polarization is B_P(X,Y)=tr(XY), with
  P(X)=B_P(X,X); a polarization carrying an extra 1/2! would evaluate to
  P(X)/2.
- The entry X↦X₁₁ on gl₂ is not Ad-invariant: conjugating diag(1,0) by
  the coordinate swap gives diag(0,1) and changes the value from 1 to 0,
  so it has no gauge-invariant curvature form.
- For O(1) on CP^N with curvature −2πiω_FS the Chern form (i/(2π))F is
  +ω_FS, pairing to 1 with a line CP¹; the convention det(1−(i/(2π))F)
  gives −ω_FS. For an oriented plane bundle with curvature [[0,a],[−a,0]],
  det(1+tF/(2π))=1+t²a²/(4π²), so the Pontryagin form (a/(2π))² is the
  square of the Euler form Pf(F/(2π))=a/(2π).

### 4.3 The universal Chern–Weil map (C4.3)

Construct the universal Chern–Weil map degreewise on C1's finite smooth
Stiefel approximations; prove stable-degree compatibility, independence of
universal connection and agreement with smooth-bundle pullback classes
(Dupont, *Curvature and Characteristic Classes*, Theorem 6.13 a)–d),
pp. 94–95, proved there on the simplicial model of BG: the canonical map
I*(G)→H*(BG), its agreement with the Chern–Weil map of a smooth bundle,
multiplicativity, and naturality in G).
Do not apply ordinary manifold de Rham cohomology directly to BG.
Prove all comparison squares for cohomology coefficients, connections,
orientation, realification and complexification.

**Checks.**
- For G=U(1) and the approximations E_m=S^(2m−1)→CP^(m−1), m≥2, the standard-character
  polynomial −a/(2π) goes to −h, pairing to −1 on CP¹; the unnormalized polynomial a would pair
  to 2π, which is not the image of an integral class.
- Restriction from CP^m to CP^(m−1) fixes h, so the degree-2 values agree for all m≥2, whereas
  m=1 gives a point with H²=0: the stable range must be respected.
- The square (−a/(2π))² goes to h², which pairs to 1 on CP² once m≥3, as multiplicativity of the
  universal map requires.

### Examples

For O(1) on CPᴺ with curvature −2πiω_FS the Chern form is ω_FS, pairing to 1 on a line; for
an oriented plane bundle with curvature [[0,a],[−a,0]] the Pontryagin form (a/(2π))² is the
square of the Euler form a/(2π) (C4.2). For U(1) the standard-character polynomial −a/(2π) goes
to −h on the finite approximations CP^(m−1) (C4.3).

### Dependencies

C4.1 uses DifferentialGeometry's value-bundle wedge and SmoothBundlesConnections' principal
curvature and Bianchi identity. C4.2 uses C4.1, C3's classes, C3.1's flag injection and
SmoothBundlesConnections B6; its Euler/Pfaffian comparison is C5.5. C4.3 uses C1.3–C1.4's finite
smooth approximations and C4.1.

## C5: Compact-Lie restriction and universal rational rings

### 5.1 Chevalley restriction for compact connected groups (C5.1)

Prove Chevalley restriction `I(G)≃Sym(t*)^W` for compact connected G
(Dupont, *Curvature and Characteristic Classes*, Proposition8.3). The
injective direction uses conjugacy into a maximal torus. Identify group
invariance with infinitesimal invariance using connected generation by
exponential neighbourhoods before applying the Lie-algebra theorem. Consume
[LieGroups Layer1 and Layer6](../RepresentationTheory/LieGroups/README.md)
for the adjoint representation Ad, maximal tori, their conjugacy, the
Weyl group N(T)/T and its identification with the root-system Weyl group,
and [CompactGroups Layer0–1](../RepresentationTheory/CompactGroups/README.md)
for the Haar average of a Hermitian form under a continuous representation.
Consume [LieGroups Layer5A](../RepresentationTheory/LieGroups/README.md)
for compact connected G: the Haar-averaged Ad-invariant positive-definite
inner product B_G on 𝔤, the skew-adjointness of every ad(X) for B_G, the
orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]`, semisimplicity of the
centerless ideal `[𝔤,𝔤]` with negative-definite Killing form, and its
radical/centre and bracket-orthogonality arguments. The radical/centre
argument gives rad(𝔤)=𝔷(𝔤), which is Mathlib's
`LieAlgebra.HasCentralRadical` (`Mathlib/Algebra/Lie/Semisimple/Defs.lean`,
whose field `radical_eq_center` is that equality); its orthogonal splitting
makes the centre B_G-orthogonal to `[𝔤,𝔤]`, and its bracket-orthogonality
argument, from the skew-adjointness of ad for B_G, makes distinct simple
ideals of `[𝔤,𝔤]` B_G-orthogonal. Consume
[LieGroups Layer6](../RepresentationTheory/LieGroups/README.md) for the
identification of t_ss,C as a Cartan subalgebra of the complexified
semisimple summand and for its actual root-pairing isomorphism with
LieHighestWeight's rootSystem, preserving roots, coroots, reflections and
the center-fixed Weyl action. State as this item's own, with G compact and
connected: the complexified semisimple summand satisfies Mathlib's
`LieAlgebra.IsKilling`, the hypothesis of the pinned Chevalley theorem
below, because its Killing form is the complex-bilinear extension of the
nondegenerate Killing form of `[𝔤,𝔤]`; and on each simple ideal 𝔰_i of
`[𝔤,𝔤]` one has `B_G = −λ_i κ_(𝔰_i)` with λ_i>0, because 𝔰_i⊗ℂ is simple,
so the Ad-invariant symmetric forms on 𝔰_i form a line, while B_G is
positive and the Killing form κ_(𝔰_i) negative definite.
This item owns transport of those maps through invariant polynomial
functions and their restriction square, and a second construction of
the Cartan/root dictionary is not made here. For surjectivity consume
the pinned Chevalley restriction theorem of Tau Ceti, stated for a
finite-dimensional Lie algebra L over an algebraically closed field of
characteristic zero with nondegenerate Killing form (`LieAlgebra.IsKilling`)
and a Cartan subalgebra H, conditions the complexified semisimple summand
meets: the restriction `TauCeti.lieCartanRestriction H : S(L) →ₐ S(H)`, the
symmetric-algebra map of the Killing-orthogonal projection L→H
(`Algebra/Lie/Killing/CartanRestriction.lean`), and the isomorphism
`LieSubalgebra.lieChevalleyRestrictionIso H` from the invariants
`TauCeti.SymmetricAlgebra.lieInvariants` onto the Weyl invariants
`TauCeti.linearInvariants H`, with `LieSubalgebra.coe_lieChevalleyRestrictionIso_apply`
(it is restriction) and
`LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`
(degrees are preserved in both directions)
(`Algebra/Lie/HighestWeight/ChevalleyRestriction.lean`). Transport that
restricted map through the invariant-form and geometric/root-data
identifications above. Pass from the Sym(g) model to invariant polynomial
functions Sym(g*) by `TauCeti.killingSymmetricEquiv`, its restriction square
`TauCeti.map_dualMap_killingSymmetricEquiv`, and, for the infinitesimal
invariants, `TauCeti.killingSymmetricEquiv_lieModuleDerivation` and
`TauCeti.map_killingSymmetricEquiv_lieInvariants`
(`Algebra/Lie/Killing/SymmetricAlgebra.lean`,
`Algebra/Lie/Killing/CartanRestriction.lean`). Compare the
Haar-invariant positive form with the semisimple Killing identification
by the actual equivariant scalar on each simple factor, retaining that
commuting Cartan-restriction square; treat the reductive central tensor
factor separately. This item owns the compact-group versus infinitesimal invariants
comparison, transport of the supplied geometric Cartan/root-data maps, tensor factor for
the reductive centre, and finite-degree real descent.

**Checks.**
- For G=SU(2) with e₁=iσ_z, e₂=iσ_x, e₃=iσ_y, the Killing form is
  `κ(e_j,e_k)=4 tr(e_j e_k)=−8δ_jk` (ad(e₁) sends e₂↦−2e₃, e₃↦2e₂, so
  tr ad(e₁)²=−8), and LieGroups Layer5A's average from the start
  λ=(1,2,3) is B_G=2δ_jk; hence λ₁=1/4 and B_G=−κ/4. The sign
  convention B_G=+λκ admits no λ>0, since B_G is positive and κ negative
  definite.
- For G=U(2), 𝔷(𝔤)=iℝ·1 and [𝔤,𝔤]=su(2); the radical is iℝ·1, the
  centre, so `LieAlgebra.HasCentralRadical` holds although the radical is
  nonzero.
- For G=T², [𝔤,𝔤]=0: there is no simple factor and no scalar, and the
  whole of t=𝔤 is central.

### 5.2 The torus Chern–Weil isomorphism and Borel's theorem (C5.2)

Prove the torus Chern–Weil map is an isomorphism with H*(BT;R), with each
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

### 5.3 Disconnected compact groups (C5.3)

For disconnected compact G prove π₀(G) finite and
`H*(BG;K)=H*(BG⁰;K)^π₀(G)` for K=Q or R by the finite-cover/transfer model of
C1's universal bundle (Dupont, *Curvature and Characteristic Classes*,
Theorem 8.1, the last step of its proof, p. 129). Compare with invariants of I(G⁰). For a torus of
G⁰ construct the extended normalizer group and its finite-component
action, rather than treating a disconnected group as connected. Descend
the rational statement by the integral character lattice, finite-degree
base change and exact finite-group averaging. No integral or mod2 Borel
invariant theorem follows by this argument.

### 5.4 Rational classical universal rings (C5.4)

Consume C3.4's integral BU ring and C3.6's BSO rings after rational
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

### 5.5 The Euler class and the Pfaffian (C5.5)

Pull an oriented real bundle to its associated oriented-plane flag and
use item2/C2.6 to prove rational injectivity on any displayed base. Prove
the Pfaffian product on ordered 2-plane curvature blocks, compare each
plane with its complex line and B6 normalization, and descend to identify
C4's Pfaffian class with the real image of the integral Euler class
(Dupont, *Curvature and Characteristic Classes*, Corollary 8.37(i), p. 131,
which gives formula (7.39), p. 111).

### Examples

For SU(2), B_G=−κ/4, and for U(2) the radical is the centre iℝ·1 (C5.1). The Euler integral
of G/T is |W|, which is 2 for SU(2), where G/T=S² (C5.2). H*(BSO(2r);ℚ)=ℚ[p₁,…,p_(r−1),e] for
r≥1 and H*(BO(n);ℚ)=ℚ[p₁,…,p_floor(n/2)] (C5.4).

### Dependencies

C5.1 uses LieGroups Layers 1, 5A and 6, CompactGroups Layers 0–1, LieHighestWeight L1,
Mathlib's `LieAlgebra.HasCentralRadical` and `LieAlgebra.IsKilling`, and the pinned Chevalley
restriction and Killing symmetric-algebra maps. C5.2 uses C4.3's universal Chern–Weil
map, not an assumed isomorphism, with C5.1 and C2.5–C2.6, and proves the isomorphism by
restriction and fibre integration. C5.3 uses
C5.2 and C1's universal bundles. C5.4 uses C3.4, C3.6 and C5.1–C5.3. C5.5 uses C5.2, C2.6, C4.2
and SmoothBundlesConnections B6.

## C5a: Compact Lie cohomology, invariant forms and universal transgression

Work with a compact connected finite-dimensional smooth real Lie group K, on
its actual Hausdorff second-countable boundaryless manifold, and write g for
its Lie algebra. Include the trivial group and rank0. Use C1's same right
principal universal bundle EK→BK and its actual finite smooth principal
approximations; the infinite join and BK are not smooth manifolds. All general
exterior and primitive statements below have coefficients Q or R. Their
integral and positive-characteristic analogues are not inferred by scalar
change. An integral class, its rational image and its de Rham representative
remain distinct objects.

### 5a.1 The compact invariant-form comparison (C5a.1)

Consume
[LieGroupoidsPoisson G1.3a](../LieGroupoidsPoisson/README.md)'s
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
`da(X,Y)=−a([X,Y])`. This is the differential of Dupont, *Fibre Bundles and
Chern–Weil Theory*, Proposition A2, which identifies the G-invariant forms on
G/H with `Alt(g/h)^H`; here H is trivial. Compare with native
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
cohomology **ring** isomorphism (Dupont, *Fibre Bundles and Chern–Weil
Theory*, Proposition A7 for the invariant inner product by Haar averaging and
Theorem A8 for the de Rham isomorphism of a compact connected group with its
invariant cochains) and, through DG's de Rham map with its proved
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

**Checks.**
- For K=S¹ the Lie algebra is abelian, the CE differential is 0 and H*(CE)=Λ(θ)=H*(S¹;ℝ);
  A_forms sends cos φ dφ to its average 0, and cos φ dφ=d(sin φ) is exact, as
  `dH+Hd=A_forms−id` requires.
- For SU(2), H¹=ann([g,g])=0 because su(2) is perfect, and H³=ℝ is spanned by
  (X,Y,Z)↦B(X,[Y,Z]), matching H*(S³;ℝ).
- With e₁=iσ_z, e₂=iσ_x, e₃=iσ_y one has [e₂,e₃]=−2e₁, so the dual coordinate a=e₁* has
  da(e₂,e₃)=−a([e₂,e₃])=2; the opposite sign convention gives −2 and disagrees with the native
  degree-one formula cited above.

### 5a.2 Actual invariant generators and the rational structure (C5a.2)

Consume
[ReflectionInvariantTheory §§1–3](../ReflectionInvariantTheory/README.md)'s early graded polynomial evaluation
isomorphism, regular-sequence and coinvariant interfaces for the actual Weyl
action on the maximal-torus character representation. These early interfaces
use no BG, compact cohomology, Schubert geometry or transgression theorem.
Transport their homogeneous basic generators through C5.1's actual
restriction isomorphism. Construct their products, homogeneous components,
augmentation ideal I_+ and indecomposables `QI=I_+/(I_+)²`, and prove the
basis/change-of-generators and coefficient-change maps. If the basic
generators have polynomial degrees d_i≥1, give them cohomological weights
2d_i. The number of generators is rankK. The restriction isomorphism
`I(G)≅I(T)^W` for compact connected G is Dupont, *Curvature and
Characteristic Classes*, Proposition8.3; the degrees d_i of the simple types
are tabulated in Hatcher, *Algebraic Topology*, §3.G (2,…,n for SU(n) and
2,8,12,14,18,20,24,30 for E8). Carry the fixed central directions
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

**Checks.**
- SU(2) has one basic generator, the determinant on su(2), of polynomial degree 2 and
  cohomological weight 4, so QI is one-dimensional, in degree 4, and the number of generators is
  the rank 1.
- For U(2) the invariants of polynomial degree 2 are spanned by tr² and det, but QI is
  one-dimensional there because tr² is decomposable; taking I_+ instead of I_+/(I_+)² would count
  two generators in that degree.
- U(1) has d=1, and its generator for θ↦exp(iθ) is the class −h of the standard character.

### 5a.3 The Weil differential and normalized transgression forms (C5a.3)

Construct
the graded-commutative Weil algebra
`W(g)=Sym(g*[2])⊗Λ(g*[1])`, with polynomial generators Ω in degree2 and
exterior generators θ in degree1, on the native symmetric/exterior and
graded tensor carriers. Define the bracket of g-valued forms with its wedge
and graded signs. Specify the differential by
`d_Wθ=Ω−(1/2)[θ,θ]`, `d_WΩ=−[θ,Ω]` and graded Leibniz (Cartan's Weil
algebra, in the form of Alekseev–Meinrenken, *Lie theory and the Chern–Weil
homomorphism*, §3.1, equation (10): `Sg*⊗Λg*` with its curvature generators,
its Koszul acyclicity and the identification of its basic subcomplex with
the invariant polynomials, on which the differential vanishes). Define contraction
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
product/decomposable correction (Dupont, *Curvature and Characteristic
Classes*, Chapter 4, Exercise 3, (4.15)–(4.17), where the same form is
written TP(θ) with U_s=sΩ+(1/2)(s²−s)[θ,θ], the Chern–Simons transgression
form). Setting Ω=0 gives a CE cocycle τ(P).
Construct the corresponding map on QI; prove that changing P by a
positive-degree product changes this cocycle by an explicit coboundary.
Do not insert an additional d!,2π or i factor: those normalizations are
already in B_P and in P. Prove the rank-one formula
`τ(−a/(2π))=−θ/(2π)` for the positive real Maurer–Cartan coordinate of the
circle. CS_P is the affine-path homotopy form from the zero connection to θ,
as in the connection-independence proof of Dupont, *Fibre Bundles and
Chern–Weil Theory*, Theorem9.5 and Lemma9.6.

For an actual connection a on a finite principal approximation E_m→B_m,
construct the evaluation `θ↦a, Ω↦F_a` as a map of differential graded
algebras, with its horizontal/basic and pullback comparisons. Prove the
connection-path homotopies and compatibility with increasing finite
approximations in each stable degree. Restriction to a positively identified
right fibre gives the same Maurer–Cartan and CE sign. This uses SBC's
connections and C4's finite universal map; there is no de Rham complex on
the infinite join being silently substituted.

**Checks.**
- For g=u(1)=ℝ the bracket vanishes: W=ℝ[Ω]⊗Λ[θ] with d_Wθ=Ω and
  d_W(Ω^kθ)=Ω^(k+1), so the cohomology is ℝ in degree 0; the
  Chevalley–Eilenberg differential alone, dθ=0, would leave all of
  ℝ[Ω]⊗Λ[θ].
- On u(1), P(a)=a gives CS_P=θ, and P(a)=a² gives
  `CS_P=2∫_0^1 θ·tΩ dt=θΩ` with `d_W(θΩ)=Ω²=P(Ω)`; without the factor
  (degree P) one would get θΩ/2, whose differential is Ω²/2. The
  decomposable a² has τ=0.
- For quadratic P on a nonabelian g, `∫_0^1 (t²−t)/2 dt=−1/12` gives
  `τ(P)=−(1/6)B_P(θ,[θ,θ])`; for matrix forms with B_P=tr, [θ,θ]=2θ∧θ
  and this is −(1/3)tr(θ∧θ∧θ), the value of tr(A∧dA+(2/3)A∧A∧A) at the
  Maurer–Cartan form, where dθ=−θ∧θ.

### 5a.4 The filtered Cartan–Koszul comparison (C5a.4)

Prove the compact reductive
Cartan transgression theorem as an actual construction on the preceding
Weil and CE complexes: for compact connected K the invariant Weil algebra
computes H*(BK;ℝ)≅I(g) (Dupont, *Curvature and Characteristic Classes*,
Theorem8.1; the basic cohomology of the Weil algebra is the invariant
polynomials by Alekseev–Meinrenken §3.1) and the transgressions of basic
invariants generate H*(CE(g;ℝ)) as an exterior algebra, the exterior form
being Hopf's theorem below and the generation by transgressions this item's
construction. For chosen basic P_i form
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
maps. That `H^*(CE(g;R))`, which is `H^*(K;R)` by C5a.1, is an exterior
algebra on odd-degree generators is Hopf's theorem in the form of Hatcher,
*Algebraic Topology*, Theorem3C.4 (a graded-commutative connected Hopf
algebra of finite type over a field of characteristic zero is an exterior
algebra on odd generators tensor a polynomial algebra on even ones; finite
dimensionality excludes the polynomial factor); what this item adds is the
identification of the generators with the transgressions τ(P_i). Prove the transgression map `QI→H^*(CE)` is injective and identifies its
image as the primitive subspace under the cohomology Hopf structure in the
next item, and that exterior products of these images give all cohomology.
The primitive assertion is established by that item's actual multiplication
comparison, not by an asserted CE coproduct. The comparison theorem,
elimination lemma and contraction just specified are construction targets
of this item; a conditional theorem assuming those conclusions does not
discharge them.

**Checks.**
- For SU(2), K_I=ℝ[P]⊗Λ(e) with |P|=4, |e|=3 and De=P: D(P^k e)=P^(k+1), so K_I has cohomology
  ℝ in degree 0, like W(g)^K, and K_I/I_+K_I=Λ(e) is H*(S³;ℝ); setting De=0 would leave all of
  ℝ[P]⊗Λ(e).
- For U(1), |P|=2 and |e|=1, and the quotient Λ(e) is H*(S¹;ℝ).
- For the trivial group the generator system is empty, K_I=ℝ and the quotient is
  ℝ=H*(pt;ℝ).

### 5a.5 Actual cohomology Hopf maps and universal Serre transgression (C5a.5)

On
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

Consume AT5.5's multiplicative cohomological Serre spectral sequence and apply it to
`K→EK→BK` on C1's same numerable model, with local coefficients and their
trivialization proved from connectedness (`π1(BK)=π0(K)=0`). Use
`d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` and compare with the filtered finite
connection/Weil models in every bounded total degree. Construct the actual
relative cochain representatives and boundary comparison that identify the
CE cocycle τ(P_i) with a universally transgressive class and its
differential with cw(P_i) (Alekseev–Meinrenken §3.1 for the Weil-algebra
side; Dupont, *Curvature and Characteristic Classes*, Chapter 8, Theorem 8.1,
for H*(BK;ℝ)≅I(g) on the compact group). Prove the sign by that cochain comparison and the circle test;
do not change AT5.5's differential convention to fit an unspecified sign.

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
`H^*(K;Q)=Λ_Q(z_1,…,z_r)`, `|z_i|=2d_i−1`, and its real scalar extension
(Hatcher, *Algebraic Topology*, Theorem3C.4, applied to the Hopf algebra
`H^*(K;Q)`; the polynomial target `H^*(BK;R)≅I(K)` of the transgression is
Dupont, *Curvature and Characteristic Classes*, Theorem8.1).
It does not imply that integral cohomology is torsion free.

### 5a.6 Same-model topology and scope comparisons (C5a.6)

Using C1's subgroup
associated fibrations on the same EK, construct
`K/T→EK/T→BK`, `K/N(T)→EK/N(T)→BK`, and the free finite covering
`EK/T→EK/N(T)` with deck W. Prove the universal-bundle comparison maps with
BT and BN, not a new classifier. Consume SchubertGeometry S9.6's rational
acyclicity of K/N(T) and finite-cover transfer, and use the AT5.5 cohomological
Serre comparison applied in C5a.5 to recover the BN proof of
`H^*(BK;Q)≃H^*(BT;Q)^W` (Borel's theorem; with real coefficients it is
Dupont, *Curvature and Characteristic Classes*, Corollary8.35). Compare its **maps** with the already independent
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

### 5a.7 Degree and normalization calculations (C5a.7)

Derive, through the actual
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
and matching the integral Chern transgressions (Hatcher, *Algebraic
Topology*, Corollary4D.3: `H^*(U(n);Z)=Λ_Z(x_1,x_3,…,x_(2n−1))` and
`H^*(SU(n);Z)=Λ_Z(x_3,…,x_(2n−1))`, by the fibrations U(n−1)→U(n)→S^(2n−1)). Do not infer this integral
result from the general rational theorem or identify a homotopy-sphere
generator with a homology generator without its Hurewicz degree.

For tori use C1.5's actual CP∞ products, standard character −h and the dual
character +h; match the degree1 Maurer–Cartan integral and degree2
transgression with those signs. For compact simple factors consume the purely root-theoretic
[ReflectionInvariantTheory §4](../ReflectionInvariantTheory/README.md) degree/exponent convention `e_i=d_i−1`, and hence
odd degrees2e_i+1; central directions have d=1 and e=0. Keep the single
Coxeter number only for an irreducible semisimple factor, and use
componentwise formulas on reducible groups. Verify the E8 eight-entry
exponent list `1,7,11,13,17,19,23,29` gives odd degrees
`3,15,23,27,35,39,47,59`; no seven-entry list is used (the E8 degrees
2,8,12,14,18,20,24,30 are those of Hatcher, *Algebraic Topology*, §3.G).

Retain the separate integral SU(2) normalizer comparison
`SU(2)/N(T)=RP²`, with H^0=Z and H^2=Z/2, from SchubertGeometry S9.6;
it tests why rational acyclicity is not integral acyclicity. Include the
strict-upper-triangular exercise only with n≥3 (n=1 trivial); n=2 is an
abelian one-dimensional counterexample to an unqualified centre-in-derived
claim. These exercises consume the actual bracket and low-degree CE maps.
The KKS root-plane Hessian/Morse comparison is a symplectic application at
the HamiltonianReduction/SchubertGeometry boundary, not a prerequisite for
the constructions here or an additional generic characteristic-class owner.

### Examples

For u(1) the Weil algebra ℝ[Ω]⊗Λ[θ] has cohomology ℝ in degree 0, and P(a)=a² gives
CS_P=θΩ (C5a.3). For SU(2) the CE cohomology is an exterior algebra on one generator of
degree 3, which is H*(S³;ℝ), and there is one basic invariant, of polynomial degree 2 (C5a.1,
C5a.4). For E8 the exponents 1,7,11,13,17,19,23,29 give odd
generators in degrees 3,15,23,27,35,39,47,59, whose sum 248 is dim E8, and SU(2)/N(T)=RP² has
integral H²=ℤ/2 (C5a.7).

### Dependencies

C5a.1 uses LieGroupoidsPoisson G1.3a's Chevalley–Eilenberg complex, CompactGroups Layer 0's
Haar probability and DifferentialGeometry's forms and de Rham comparison. C5a.2 uses
ReflectionInvariantTheory §§1–3, C5.1 and C1.5; those early interfaces use no compact
cohomology. C5a.3 uses C4's finite universal connections and SmoothBundlesConnections'
connections. C5a.4 uses C5a.1–C5a.3. C5a.5 uses C5a.4, C1's universal bundle and
AlgebraicTopology Stage 5.5's multiplicative cohomological Serre spectral sequence. C5a.6 uses
C5a.5, C1's subgroup-associated fibrations and SchubertGeometry S9.6; it compares with
C5.2–C5.3 and is not an input to them. C5a.7 uses C5a.2–C5a.5, C1.5, ReflectionInvariantTheory
§4's root-theoretic degrees and exponents only, and SchubertGeometry S9.6; its integral unitary
examples use their own sphere-fibration induction. No KKS moment-Morse application, analytic index or Floer count
enters these compact constructions.

## C6: Multiplicative series, Chern character and the Thom correction

### 6.1 Multiplicative sequences and bundle-level genera (C6.1)

The universal multiplicative sequence of a power series Q with
constant term 1 is the pinned `PowerSeries.multiplicativeSequence Q n k`
(`RingTheory/PowerSeries/MultiplicativeSequence.lean`): the polynomial K_k
in the elementary symmetric polynomials e₁,…,e_n whose value at the
e_i(x) is the coefficient of t^k in ∏_i Q(x_i t)
(`mk_aeval_multiplicativeSequence`, `aeval_multiset_esymm_multiplicativeSequence`),
with the Whitney convolution on a union of root families
(`aeval_multiset_esymm_add_multiplicativeSequence`), the single-root
normalization `K_k(e₁)=q_k e₁^k` (`multiplicativeSequence_one_left`),
stability under adjoining a zero root
(`aeval_snoc_zero_multiplicativeSequence`), the root description of an even
series `Q(t²)` in the squares of the roots
(`aeval_multiset_esymm_sq_multiplicativeSequence`) and the explicit
K₁, K₂, K₃ (`multiplicativeSequence_three_right`). The three series are
pinned over any ℚ-algebra A: `Td(x)=x/(1−e^(−x))` is Mathlib's
`bernoulli'PowerSeries A` (B'₁=1/2), `Â(x)=(x/2)/sinh(x/2)` is
`TauCeti.aHatSeries A` and `L(x)=x/tanh x` is `TauCeti.hirzebruchLSeries A`,
the rescaling by 2 of Mathlib's `bernoulliPowerSeries` plus x
(`RingTheory/PowerSeries/CharacteristicSeries.lean`), with the displayed
quotients proved by multiplying their denominators
(`bernoulli'PowerSeries_mul_one_sub_exp_neg`, `aHatSeries_mul_sub`,
`hirzebruchLSeries_mul_sub`), the characterizations `eq_hirzebruchLSeries_iff`
and siblings, the Bernoulli-number coefficients `coeff_hirzebruchLSeries`
and `coeff_aHatSeries`, evenness `rescale_neg_one_hirzebruchLSeries` and
`rescale_neg_one_aHatSeries`, and `Td(x)=e^(x/2)Â(x)`
(`bernoulli'PowerSeries_eq_rescale_exp_mul_aHatSeries`). Consume these by
name. Own here the bundle-level classes: apply the Todd sequence to the
Chern roots of a complex bundle, and the L and Â sequences of the even
series, through `expand_cartier_hirzebruchLSeries` and
`expand_cartier_aHatSeries`, to one root per oriented real 2-plane,
`p(E)=∏(1+x_j²)`, with a trivial line in odd rank, so that their values
are polynomials in the Pontryagin classes; they are not products over
both ±x_j roots of E_C. Prove on actual bundles and virtual classes the
pullback and rational Whitney identities from the pinned convolution and
C3's splitting, and extend Td on complex K and L/Â on real KO by those
Whitney laws; virtual λ_(−1) is not an evaluation of an arbitrary infinite
λ-series at −1. Build the degreewise truncation of a multiplicative class
on a base of displayed cohomological dimension.

**Checks.**
- Td₁(TCP¹)=c₁/2=h pairs to 1, the Todd genus of CP¹, and L₁(TCP²)=p₁/3=h² pairs to the
  signature 1 of CP².
- Â₁(TCP²)=−p₁/24=−h²/8 pairs to −1/8∉ℤ, consistent with CP² having no spin structure (C3.5).
- With one root per oriented plane, TCP² has p₁=x₁²+x₂² and L₁=p₁/3; a product over both roots
  ±x_j of the complexification would square the even series and give L₁=2p₁/3, signature 2.

### 6.2 The Chern character (C6.2)

Construct `ch_j(E)` as the rational Newton polynomial in integral c_i,
normalized by j!, with ch₀=rank (Hatcher, *Vector Bundles and K-Theory*,
§4.1, p. 109). Prove root exponentials, additivity and multiplicativity
(Proposition 4.2, p. 110), dual/conjugate and line-twist identities using C3's
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

**Checks.**
- On CP², ch(O(1))=1+h+h²/2; the class h²/2 is not integral, so ch takes
  values in rational, not integral, cohomology.
- The j! normalization is forced by multiplicativity: ch(O(2))=1+2h+2h²
  equals ch(O(1))²=(1+h+h²/2)²; without 1/j!, ch(O(1))=1+h+h² would square
  to 1+2h+3h², not ch(O(2))=1+2h+4h².
- For TCP², c₁=3h and c₂=3h² give ch₂=(c₁²−2c₂)/2=3h²/2, which the roots
  confirm: TCP²⊕ε≅O(1)³ gives ch=3(1+h+h²/2)−1=2+3h+3h²/2, with ch₀=2
  the rank.

### 6.3 Suspension characters and the rational isomorphism (C6.3)

Construct suspension-degree characters. Orient R by increasing t and
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
induction in the mapping-cylinder sequence (Hatcher, *Vector Bundles and K-Theory*,
Proposition 4.5, p. 111, for finite cell complexes, by cell induction from the spheres of
Proposition 4.3). State the finite-CW hypothesis;
ordinary K on an arbitrary compact Hausdorff space is not asserted to be
rationally equivalent to all its singular cohomology.

**Checks.**
- On a point, Hper^n(pt) is ℚ·v^(−n/2) for even n and 0 for odd n, matching K^n(pt)⊗ℚ; the Bott
  class u in degree −2 has ch(u)=−v.
- The endpoint normalization is consistent: ch(u⁻¹)ch(γ)=(−v⁻¹)(−U_R v)=U_R=ch¹(δ_K(0,1));
  dropping the sign in ch(u)=−v would give −U_R.
- K⁰(S²)⊗ℚ=ℚ² and Hper⁰(S²)=H⁰⊕H²·v=ℚ², while K¹(S²)=0=Hper¹(S²); for S¹,
  K^(−1)(S¹)⊗ℚ=ℚ=H¹(S¹;ℚ)·v.

### 6.4 The Thom correction (C6.4)

For the dual-Koszul Thom class of a complex bundle prove
`ch(Thom_K(a))=Thom_H(ch(a)·Td(E)^−1)`; the zero-section expression is
ch(λ_(−1)(E*))=∏(1−exp(−x_j)). For the wedge convention prove the correction
`(-1)^r exp(c₁(E)) Td(E)^−1`, and its point value (-1)^r
(Landweber, *K-theory and elliptic operators*, §1.7, pp. 13–14, compares
the two Thom isomorphisms for the wedge convention and computes the
correction in roots as `∏(1−exp(x_j))/x_j`, which is the displayed class;
the dual-Koszul form is the same computation for E*).
Construct the universal correction on compact products `(CP^N)^r` and
pass their degreewise compatible coefficients to Q[[x₁,…,x_r]]. There
multiplication by ∏x_j is injective, so the zero-section identity determines
the correction. Pull back by flag classification and descend by injection.
Do not divide by the Euler class on X, or postulate ordinary K(BT) outside
TopK's compact-base scope. Prove the relative and supported Thom squares with excisive product hypotheses retained. The displayed formula is
in completed ordinary cohomology with the period symbol suppressed; for
the degree0 folded K-Thom map its graded version includes the factor v^r
multiplying the cohomological Thom map of real rank2r.

**Checks.**
- In rank 1 with root x the wedge-convention zero-section class is ch(1−L)=1−e^x, so the
  correction is (1−e^x)/x=−1−x/2−x²/6−…, equal to −e^x·(1−e^(−x))/x=(−1)¹exp(c₁)Td(L)^−1;
  dropping exp(c₁) would give −(1−e^(−x))/x=−1+x/2−…, with the wrong sign of the x-term.
- For the dual-Koszul convention in rank 1 the zero-section class is 1−e^(−x) and the correction
  is (1−e^(−x))/x=1−x/2+x²/6−…=Td(L)^−1, with point value 1.
- In rank 0 both Thom maps are the identity and the correction is 1=(−1)⁰exp(0)Td(0)^−1.

### 6.5 Riemann–Roch for embedding pushforwards (C6.5)

For embeddings with a specified complex normal bundle prove the
cohomological/K-theoretic pushforward comparison
`ch(f!_K a)=f!_H(ch(a)·Td(ν)^−1)` for complex normal ν, with the normal Todd factor,
support, orientation and composition conventions fixed. Both pushforwards
are the Thom map of ν followed by the open extension from a tubular
neighbourhood (Landweber, *K-theory and elliptic operators*, §2.2, p. 16,
for the K-theory pushforward of an embedding), so the identity is C6.4's
Thom comparison for ν (the same source, §1.7, pp. 13–14) together with
naturality of ch for the extension map. This is a Riemann–Roch identity for the constructed
pushforwards; analytic index equality is a separate consumer.

### Examples

On CP², ch(O(1))=1+h+h²/2 and ch(TCP²)=2+3h+3h²/2 (C6.2); Td₁(TCP¹)=h, L₁(TCP²)=h² and
Â₁(TCP²)=−h²/8 (C6.1); the Bott class u has ch(u)=−v (C6.3).

### Dependencies

C6.1 uses the pinned multiplicative sequences and characteristic series and C3's splitting
principle. C6.2 uses C3.2–C3.4, C1.2's excisive couples and TopologicalKTheory T2–T5 and T7.4.
C6.3 uses C6.2 and TopologicalKTheory T3.4 and T4.8. C6.4 uses C6.1–C6.3 and TopologicalKTheory
T5's dual-Koszul Thom class. C6.5 uses C6.4 and C2.4.

## C7: Characteristic formulas and acceptance calculations

### 7.1 Genus polynomials and the degree-twelve L-polynomial (C7.1)

The low-degree genus polynomials are pinned
(`RingTheory/PowerSeries/GenusPolynomials.lean`):
Td₁=c₁/2, Td₂=(c₁²+c₂)/12, Td₃=c₁c₂/24
(`TauCeti.multiplicativeSequence_bernoulli'PowerSeries_one`, `_two`, `_three`),
L₁=p₁/3, L₂=(7p₂−p₁²)/45
(`TauCeti.multiplicativeSequence_cartier_hirzebruchLSeries_one`, `_two`) and
Â₁=−p₁/24, Â₂=(7p₁²−4p₂)/5760
(`TauCeti.multiplicativeSequence_cartier_aHatSeries_one`, `_two`), each
as an identity of multiplicative-sequence polynomials in rank at least
the degree. Consume these by name and transport them to the bundle-level
classes of C6.1. Export degree-n components and their
pairing with chosen fundamental classes; signature, Dirac and holomorphic
index theorems consume these formulas.
Prove the degree12 identity L₃=(62p₃−13p₁p₂+2p₁³)/945 from the pinned
`multiplicativeSequence_three_right`, `coeff_hirzebruchLSeries` and
`expand_cartier_hirzebruchLSeries`, with p_j in cohomological degree4j
(Milnor–Stasheff §19), as the degree-three sibling of the pinned L₂:
the even coefficients of x/tanh x are q₁=1/3, q₂=−1/45 and
q₃=2⁶B₆/6!=2/945, and K₃=q₃e₁³+(q₁q₂−3q₃)e₁e₂+(q₁³−3q₁q₂+3q₃)e₃ gives
2/945, −13/945 and 62/945. Include ranks with fewer
than three oriented-plane roots by setting the absent Pontryagin classes
to zero, through the pinned stability under a zero root. Export its
degree-twelve component and its pairing with the fundamental class of a
closed oriented twelve-manifold; the signature theorem in dimension
twelve consumes it.

**Checks.**
- `q₁q₂−3q₃=−1/135−6/945=−7/945−6/945=−13/945`; a convention taking
  coefficients of x/tanh x in x rather than in x² would put q₂=1/3 and
  give a wrong middle term.
- On `CP⁶` with `p(CP⁶)=(1+h²)⁷`, `p₁=7h²`, `p₂=21h⁴`, `p₃=35h⁶`:
  `L₃=(62·35−13·7·21+2·343)/945·h⁶=(2170−1911+686)/945·h⁶=h⁶`, the
  signature 1 of `CP⁶`; the sign of the middle term matters, since
  `+1911` would give `4767/945`, not an integer.
- On `HP³` with `p(HP³)=(1+u)⁸/(1+4u)=1+4u+12u²+8u³`:
  `L₃=(496−624+128)/945·u³=0`, the signature of `HP³` (`H⁶(HP³)=0`); on
  `HP²`, `p=(1+u)⁶/(1+4u)=1+2u+7u²` and the pinned `L₂` gives
  `(49−4)/45·u²=u²`, signature 1.

### 7.2 Half-spin characters and the signature series (C7.2)

Translate the ordered half-spin weights and exterior λ-characters into
exponential root products. For the ordered roots x₁,…,x_r name the
summand with an even number of negative half-weight signs S_high⁺; then
`ch(S_high⁺)−ch(S_high⁻)=∏(exp(x_j/2)−exp(−x_j/2))` (Atiyah–Hirzebruch,
*Riemann–Roch theorems for differentiable manifolds*, §4, p. 281). Compare this with
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

**Checks.**
- For r=1 the half-spin weights are ±x/2 and ch(S_high⁺)−ch(S_high⁻)=e^(x/2)−e^(−x/2); the
  exterior model with vacuum weight −x/2 has Λ⁰ of weight −x/2 and Λ¹ of weight x/2, so its
  even-minus-odd character is the negative, the sign (−1)^r.
- For r=2 the summand with an even number of negative signs has weights ±(x₁+x₂)/2, and the
  difference of characters expands to (e^(x₁/2)−e^(−x₁/2))(e^(x₂/2)−e^(−x₂/2)); here
  (−1)²=1 and the exterior model gives the same product.
- For k=1, x coth(x/2)=2+x²/6+… and x/tanh x=1+x²/3+…: the degree-4 parts of the products over
  two roots are both (x₁²+x₂²)/3, while the constant terms 4 and 1 differ.

### 7.3 Acceptance calculations (C7.3)

Acceptance: construct the projective Euler sequence from the tautological
line and tangent chart derivatives, proving its bundle exactness; thus CP^n
has c(TCP^n)=(1+h)^(n+1) and its Euler number is n+1 (Cohen, *The Topology
of Fiber Bundles*, Theorem 1.16, p. 25, for `TCPⁿ⊕ε≅(γ*)^⊕(n+1)`, and
formula (4.1), p. 103, for the total Chern class);
construct the smooth bundle isomorphism from the native tangent bundle
of S^n to the bundle with fibre x^⊥ by differentiating the ambient
inclusion, prove its smooth local inverse, and extend by the radial
normal line to `TS^n⊕ε¹≅ε^(n+1)`. This adapter uses native sphere
differential calculus, SBC B2 and TopK T1's bundle comparison, before C4–C6.
Prove oriented TS^n has Euler number1+(-1)^n and p(TS^n)=1 (for even n, e(TSⁿ) is twice a
generator: Hatcher, *Vector Bundles and K-Theory*, Proposition 3.14, p. 92). On an oriented
real plane prove e=c₁ and p₁=e²; odd-rank Euler has the displayed torsion
qualification, with the universal oriented rank3 bundle
as a nonzero example: e mod2=w₃≠0 on BSO(3), and pullback to a sufficiently
large compact approximation preserves this nonzero 2-torsion Euler class.
For the real tautological line L on RP^4 prove p(L)=1 but
`p₁(L⊕L)=−β(a)^2≠0`, detecting the integral Whitney correction.
Include the universal p_r=e² relation, w₂ reduction/central-cover test,
the rank-one Hopf sign, and a flat torsion circle bundle with nonzero
integral c₁ and zero de Rham Chern form using SBC B6's lens-space example.

### 7.3a Real-projective tangent classes and immersion obstruction (C7.3a)

For every
m≥0 use AT4.6's smooth native real-projective carrier. Transport TopK
T1.5's tautological line γ along T1.5's rank-one projective comparison
homeomorphism from native `Projectivization` to the finite Grassmannian
and its rank-one diffeomorphism, including their bundle-chart comparison.
Consume T1.5's smooth graph-chart upgrade and SBC B2's smooth
Hom/dual/sum interfaces. Differentiate
these charts to construct
`T(RP^m) ≅ Hom(γ,γ^⊥)`. Identify End(γ) with the trivial real line by
scalar multiplication and γ* with γ by the Euclidean metric. Prove the
resulting actual bundle isomorphism
`T(RP^m) ⊕ ε¹ ≅ γ^(⊕(m+1))`, including its chart overlap comparison
(Cohen, *The Topology of Fiber Bundles*, Theorem 1.15, p. 24).
From AT4.6's mod2 cellular complex and C1.5's finite-stage cup
comparison prove restriction from RP∞ is an isomorphism through degree m
and the finite-stage groups vanish above m. Match the pulled-back
tautological lines using T1.5–T1.6 to prove w₁(γ)=a and the actual ring
isomorphism `H*(RP^m;F₂)=F₂[a]/(a^(m+1))`. C3.2's Whitney and
normalization laws then give
`w(T(RP^m))=(1+a)^(m+1)` (Cohen, Theorem 3.22, p. 103). Export its degree-j components
`w_j(T(RP^m))=binom(m+1,j) a^j`, with coefficients reduced mod2.

For a smooth immersion f:M^m→ℝ^(m+q), q≥0, of a closed smooth
manifold, construct the normal rank-q bundle ν_f over M as the
orthogonal complement of the image of the injective tangent map.
Construct its local frames by the constant-rank image construction and
smooth orthogonal projection in those frames. Use SBC B2 for the smooth
bundle operations; forget smoothness and apply the pinned
`TauCeti.FiniteRankBundleCore.ofBundle`
(`Topology/VectorBundle/FiniteRank/Basic.lean`) and TopK T1's
bundle-category comparison to TM and ν_f, using
paracompactness of the Hausdorff second-countable base. Thus these native
tangent/normal bundles lie in C3's numerable continuous category. Prove
the bundle isomorphism
`TM ⊕ ν_f ≅ ε^(m+q)` induced by df and the complement, and consequently
`w(ν_f)w(TM)=1` (Cohen, Proposition 3.27, p. 105). Define the inverse total tangent class w̄(M) in
the degree-≤m quotient of H*(M;F₂), prove existence and uniqueness
using the nilpotent positive-degree ideal, and prove the reusable obstruction:
for 1≤j≤m, w̄_j(M)≠0 excludes every such immersion with q<j.
The normal bundle lives over the source M even when f has multiple points.

For m=2^k, k≥1, compute in the displayed truncated ring
`(1+a)^(m+1)(1+a)^(m−1)=(1+a)^(2m)=1` and
`(1+a)^(m−1)=Σ_(j=0)^(m−1) a^j` by characteristic2 Frobenius.
Thus w̄_(m−1)(RP^m)=a^(m−1)≠0, and RP^m admits no smooth immersion
into ℝ^(2m−2), whose required normal rank would be m−2
(Cohen, Corollary 3.28, p. 106; `not_exists_isImmersion_realProjectiveSpace`,
with Mathlib's `Manifold.IsImmersion`). That statement takes RP^m to be the orbit space of
the antipodal action of ℤˣ on the unit sphere S^m⊂ℝ^(m+1), the model of the
pinned `TauCeti.RealProjectiveSpace`, with Mathlib's quotient charts
`MulAction.instChartedSpaceQuotient`. The smooth-action instance
`ContMDiffConstSMul (𝓡 m) ω ℤˣ Sᵐ` is a target of this item, proved from
Mathlib's `contMDiff_neg_sphere` for g=−1 and `contMDiff_id` for g=1; with
it the pinned `TauCeti.instIsManifoldQuotient` makes these charts an
analytic, hence smooth, atlas and the pinned `Manifold.IsImmersion.id`
applies. AT4.6 compares this carrier with the projective-coordinate carrier.
Include the cases RP²→ℝ², RP⁴→ℝ⁶ and RP⁸→ℝ¹⁴. This calculation
consumes C1–C3, AT4.6, TopK T1's bundle category, metrics and embeddings
and T1.5–T1.6 with T1.5's real carrier/chart comparison, SBC B2 and
native differential calculus; it precedes the rational curvature and
genus calculations.

**Checks.**
- w̄(RP⁴)=(1+a)^(−5)=(1+a)³=1+a+a²+a³, since (1+a)⁸=1 in the truncated
  ring; w̄₃≠0, so RP⁴ has no immersion in ℝ⁶.
- w̄(RP²)=(1+a)^(−3)=1+a, since (1+a)⁴=1+a⁴=1 there; w̄₁≠0 excludes ℝ²
  and says nothing about ℝ³, where RP² immerses.
- w̄(S^m)=1 because TS^m⊕ε¹ is trivial, and w̄(RP³)=(1+a)^(−4)=1: neither
  obstructs, consistently with S^m⊂ℝ^(m+1) and with RP³ parallelizable.

### 7.4 Chern-character acceptance checks (C7.4)

Verify ch respects the relative symbol gluing and external tensor blocks
on the excisive/supported pairs,
the compact complex Thom point normalization, the inverse Todd correction,
dimension4 L₁=p₁/3 and the curve Todd class 1+c₁/2. All source formulas
involving an Euler denominator are justified universally before evaluation.

### 7.5 Zero primary classes without a section (C7.AdjointHopfObstruction)

For every Hermitian complex rank-two bundle F over a paracompact Hausdorff
base, construct the oriented real rank-three bundle su(F) of trace-free
skew-adjoint endomorphisms. Use T1's existing endomorphism bundle and C1.0's
unitary frame bundle: unitary conjugation preserves this real subspace and
its metric, with orientation fixed by the ordered skew-adjoint matrices
`diag(i,−i)`, `[[0,1],[−1,0]]`, `[[0,i],[i,0]]` in a unitary frame.
Prove frame independence using the connected unitary group's conjugation
action. Construct local trivializations and the associated-bundle comparison,
with pullback and bundle-isomorphism naturality. These are continuous bundles;
no connection or gauge-theoretic moduli space is required.

Construct the actual complex-linear bundle isomorphism
`su(F)⊗_ℝℂ≃End₀(F)`, carrying X⊗z to zX, and
`End₀(F)⊕ε_ℂ≃End(F)` by separating half the trace. Check transition
compatibility and provide inverse formulas: every traceless Z decomposes
uniquely as X+iY with X,Y skew-adjoint and traceless. C3's integral splitting
principle gives roots x,y for F and roots0,x−y,y−x for End₀(F). Prove,
in integral cohomology and with naturality,

`p₁(su(F))=c₁(F)²−4c₂(F)`.

This is an integral root calculation; rational Chern-character comparison
alone is not substituted for integral equality on a base with torsion.
For a fixed determinant trivialization compare with the adjoint bundle of
the SU(2) frame reduction. The pinned star-algebra embedding
`Quaternion.toComplexMatrix` of ℍ[ℝ] into `Matrix (Fin 2) (Fin 2) ℂ`
(`Algebra/Quaternion/ComplexMatrix.lean`), whose restriction to the unit
quaternions is the group isomorphism `Quaternion.unitaryEquivSpecialUnitaryGroup`
onto SU(2), sends i, j, k to the three ordered matrices above. It is
ℝ-linear, injective and multiplicative, so it carries the imaginary
quaternions onto su(2) and conjugation by a unit quaternion to Ad of its
image. Prove this identification of the conjugation representation with the
action on imaginary quaternions; the orientation of su(F) is the image of
the ordered basis (i,j,k).

On S⁴=D_N∪D_S let F be the Hermitian rank-two bundle obtained by C1.1d's
clutching, in its convention s_S=s_N c on the equator S³, from the
transition `c(a,b)=[[a,−conj b],[b,conj a]]`, the inverse of LieGroups
Layer2's first-column identification `SU(2)≃S³`, followed by SU(2)⊂U(2);
let E=su(F), with transition Ad∘c. Construct E on this carrier with those
transition maps; do not replace it by an abstract bundle with prescribed
classes. Since c takes values in SU(2), the determinant line of F is
canonically trivial and `c₁(F)=0`. Prove that `u=c₂(F)` generates
`H⁴(S⁴;ℤ)`: `c₂(F)=e(F_ℝ)` by the convention `c_r(E)=e(E_R)`, and C2.2's
identification of the Euler class with the primary section obstruction,
applied to the constant section e₁ of the northern frame, which the
southern frame reads on the equator as `z↦c(z)⁻¹e₁=(conj a,−b)`, the
restriction of a linear isometry of ℂ², gives `⟨e(F_ℝ),[S⁴]⟩=±1`. Prove
`p₁(E)=−4u≠0`. The sphere cohomology calculation and
rank normalization give `e(E)=0` and `w_i(E)=0` for every i>0. Prove E is
not stably trivial: an isomorphism `E⊕ε^k≃ε^(k+3)` would force p₁(E)=0
by naturality and trivial-summand stability.

Prove E has no nowhere-zero continuous section. Such a section, normalized
with the metric, splits E as ε¹⊕P with P an oriented real plane bundle.
Since H²(S⁴;ℤ)=0, e(P)=0; the integral plane identity p₁(P)=e(P)² and
trivial-summand stability would again give p₁(E)=0. Thus the example has
zero Euler class and all positive-degree Stiefel–Whitney classes, while
admitting neither a section nor a stable trivialization. Identify the
failure of the primary Euler criterion with its out-of-range dimensions:
rank3 over a 4-dimensional CW base. C2's dimension≤rank converse remains
the primary-obstruction theorem. Compare TS² as the different phenomenon
of a stably trivial, nontrivial tangent bundle with nonzero Euler number2.
These examples separate the vanishing of the Euler and Stiefel–Whitney
classes from the existence of a section: the Euler-class converse holds only
with its dimension hypothesis.

For the adjoint-bundle formula see Zentner,
[*Instanton exercise sheet2*, Exercise2](https://www.maths.dur.ac.uk/users/raphael.zentner/exercice_sheet_instantons2.pdf).

**Checks.**
- A traceless Z decomposes as X=(Z−Z*)/2 and Y=(Z+Z*)/(2i), both
  skew-adjoint and traceless; for Z=diag(1,−1), X=0 and Y=diag(−i,i).
- With roots 0, x−y, y−x the second elementary symmetric polynomial is
  −(x−y)², so p₁=−c₂(End₀(F))=(x−y)²=(x+y)²−4xy=c₁(F)²−4c₂(F); the
  opposite sign convention p₁=+c₂(E⊗ℂ) would give p₁(E)=+4u on S⁴, and
  the product of the three roots is 0, so e(E)=0 is forced by the roots too.
- On S⁴, c₁(F)=0 and u pairs to ±1, so p₁(E) pairs to ∓4, never 0; the
  stably trivial TS² has p₁=0 but Euler number 2, the opposite failure.
- The equatorial comparison of the hemisphere sections of F is
  `(a,b)↦(conj a,−b)`, which as a real map of ℝ⁴ has determinant (−1)³=−1;
  replacing c by the constant transition 1 gives the trivial bundle, whose
  comparison map is constant of degree 0, so c₂=0 there.

### Examples

L₃(CP⁶)=h⁶ and L₃(HP³)=0 (C7.1). For m=2^k, RPᵐ has w̄_(m−1)=a^(m−1)≠0, so RP⁴ does not
immerse in ℝ⁶ nor RP⁸ in ℝ¹⁴ (C7.3a). The adjoint bundle su(F) of the rank-two bundle on S⁴
clutched by SU(2)≅S³ has e=0, all positive Stiefel–Whitney classes 0, p₁=−4u≠0 and no
nowhere-zero section (C7.AdjointHopfObstruction).

### Dependencies

C7.1 uses C6.1 and the pinned genus polynomials. C7.2 uses SpinRepresentations' half-spin
modules and weights and C6.1–C6.2. C7.3 uses C2–C3, SmoothBundlesConnections B2 and B6 and
TopologicalKTheory T1. C7.3a uses C1–C3, AlgebraicTopology Stage 4.6, TopologicalKTheory T1 and
T1.5–T1.6, SmoothBundlesConnections B2 and native differential calculus, independently of C4–C6.
C7.4 uses C6, and the rational coefficient comparisons of C7 use C5–C6.
C7.AdjointHopfObstruction uses C1.0, C1.1d, C2.2, C3.2–C3.3, TopologicalKTheory T1,
LieGroups Layer 2 and the pinned `Quaternion.toComplexMatrix`.

## Downstream consumers

- AffineMorseLefschetz A4.0 consumes C1.2a S5's support excision and collared-pair triangle,
  specialized to the local systems of its four cap dualities.
- GeneralizedCohomology consumes C1–C3: C1.1b's join classifiers, C1.2's counit theorem, C1.5's
  line classes, C2.1's Thom classes, C2.4–C2.5's Gysin maps and fibre integration, and C3.2's
  top-Chern/Euler comparison.
- MorseTheory M5 consumes C2.0's bundle disk/sphere cells for its negative-disk attachments;
  RiemannianGeometry R3 consumes the same generic bundle-cell model, and its R4.9 consumes C1.5,
  C2 and C3 on the tautological disk bundle.
- SpinGeometry G4.3 consumes C3.5's identification of w₂ with the central-lift obstruction and
  its paracompact local-lifting lemma, together with C1's oriented orthonormal frames.
- ConvexityToric T2 consumes C1.5's finite torus models `ET_N=(S^(2N+1))^m` and
  `BT_N=(CP^N)^m`, their colimits and integral cohomology, and C2–C3's ordinary Thom, Euler and
  Leray–Hirsch theory; it compares its Borel constructions with C1.5's torus model, keeping
  C1.5's sign `u_i=−h_i`. Nothing here consumes ConvexityToric.
- HilbertModules consumes C1.2's point-neighbourhood covers and Čech comparison, and Orbifolds
  consumes C1.2b's counit weak-equivalence theorem.
- NilpotentOrbits consumes C5.1's compact Chevalley restriction, and ReflectionInvariantTheory's
  late topological adapters consume C5.1–C5.3 and C5a; neither is an input here.
- Signature, Dirac and holomorphic index theorems consume the genus formulas of C6.1 and C7.1.

## References

- Milnor–Stasheff, *Characteristic Classes*, Annals of Mathematics Studies 76, Princeton 1974, §4, §§9–15, 18–19 and AppendixC, for Thom, Euler, universal classes, the L-genus coefficients and curvature; Theorem15.3 records the integral Pontryagin correction and Lemma18.1 the Thom-space cell structure. Cited by locator; no legal open copy.
- Milnor, *Topology from the Differentiable Viewpoint*, §6, for the index of a vector field and the Poincaré–Hopf sum used in C2.3's worked example.
- Cohen, [*The Topology of Fiber Bundles*](https://math.stanford.edu/~ralph/fiber.pdf), Chapter1 §2.2 (Theorems 1.15 and 1.16, pp. 24–25) and Chapter3 §4 (Theorem 3.22 and formula (4.1), p. 103; Proposition 3.27 and Corollary 3.28, pp. 105–106), for projective tangent bundles and the normal characteristic-class obstruction to immersions.
- Dupont, [*Fibre Bundles and Chern–Weil Theory*](https://data.math.au.dk/publications/ln/2003/imf-ln-2003-69.pdf), §2 and Example4.3 for orthonormal frame bundles, §§9–10 for invariant curvature forms, polarization, connection independence (Theorem 9.5, Lemma 9.6) and classical polynomials, and AppendixA for invariant forms on compact groups.
- Alekseev–Meinrenken, [*Lie theory and the Chern–Weil homomorphism*](https://arxiv.org/abs/math/0308135), §3.1, for the Weil algebra and its basic subcomplex.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Theorem3C.4 for Hopf's theorem, §3.G for the degrees of the simple types and Corollary4D.3 for the integral cohomology of U(n) and SU(n).
- Hatcher, [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), version 2.2: §1.1, p. 16, and §1.2, pp. 22–26, for disk and sphere bundles, clutching and the Gram–Schmidt retraction; §3.1, pp. 77–86, Theorems 3.1, 3.2 and 3.9 and Proposition 3.10, for the projective-bundle definitions of w and c, the universal mod 2 and unitary rings and the classification of line bundles; §3.2, pp. 88–95, Propositions 3.12 and 3.14 and Theorem 3.16, for the Thom pair, the mod 2 cohomology of the oriented Grassmannians, the Euler class of TSⁿ and the oriented rings after inverting 2; §3.2, p. 94, for the definition of the Pontryagin classes; §4.1, pp. 109–111, Propositions 4.2, 4.3 and 4.5, for the Chern character, its additivity and multiplicativity and the rational Chern-character isomorphism.
- Dupont, [*Curvature and Characteristic Classes*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/dupont2.pdf), §§4–8, especially §8's restriction/fibre-integration proof and Chevalley appendix, for universal Chern–Weil and disconnected groups (Theorem 6.13, pp. 94–95; Theorem 8.1 and Lemma 8.30, pp. 125–129; Corollary 8.37, p. 131); Chapter 4, Exercise 3, for the Chern–Simons transgression forms.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Graduate Texts in Mathematics 82, §§6,11–14,20–23, for fibre integration, Thom and projective splitting. Cited by locator; no legal open copy.
- tom Dieck, [*Algebraic Topology*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/diecktop.pdf), §9.5 for arbitrary-space connected-map chain compression, §§13.1–13.3 for countable partition reduction and numerable local-to-global homotopy equivalence, §14.4 for the strong Milnor join and universal bundle comparisons.
- May, [*A Concise Course in Algebraic Topology*](https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/Peter-May-A-Concise-Course-In-Algebraic-Topology.pdf), Chapter16 §§2–3, for the nondegenerate-simplex CW realization and counit weak equivalence via relative simplicial approximation.
- Milnor, *Construction of Universal Bundles, II*, Annals of Mathematics 63 (1956), §§2–3, for the join construction of C1.1b. Cited by locator; no legal open copy.
- Müller–Wockel, [*Equivalences of smooth and continuous principal bundles with infinite-dimensional structure group*](https://arxiv.org/abs/math/0604142), Advances in Geometry 9 (2009), arXiv version 3: Proposition I.13 and Theorems II.11 and II.12, for the smooth representatives of C1.4.
- Landweber, [*K-theory and elliptic operators*](https://arxiv.org/abs/math/0504555), §1.7, pp. 13–14, for the comparison of the K-theory and cohomology Thom isomorphisms under the Chern character, and §2.2, p. 16, for the K-theory pushforward of an embedding.
- Atiyah–Hirzebruch, [*Riemann–Roch theorems for differentiable manifolds*](https://www.ams.org/journals/bull/1959-65-04/S0002-9904-1959-10344-X/), Bulletin of the American Mathematical Society 65 (1959), §4, p. 281, for the difference of the half-spin characters.
- Zentner, [*Instanton exercise sheet 2*](https://www.maths.dur.ac.uk/users/raphael.zentner/exercice_sheet_instantons2.pdf), Exercise 2, for the adjoint-bundle Pontryagin formula of C7.AdjointHopfObstruction.
