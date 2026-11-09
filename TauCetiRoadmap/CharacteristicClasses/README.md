# Roadmap: characteristic classes and Chern–Weil theory

**Summary.** Build integral Chern, Pontryagin and Euler classes, mod 2
Stiefel–Whitney classes, cohomological Thom and Gysin maps, universal
cohomology calculations, and the comparison with curvature, on the continuous
vector bundles and Grassmannian classifiers of TopologicalKTheory, the
singular cohomology of AlgebraicTopology and the smooth connections of
SmoothBundlesConnections. Construct the compact connected Lie-group CE/de Rham,
primitive/exterior and universal-transgression comparisons on these same
cohomology and universal-bundle carriers. Construct the rational Chern
character and the Todd, L and Â multiplicative classes, including their
relative and supported interfaces. Classes carry their coefficient ring,
degree, orientation and bundle; formal roots are a proved splitting device.
The end theorems are the Thom class of an oriented bundle over an arbitrary
base and the Thom isomorphism (C2), the Euler class as the primary
obstruction to a nowhere-zero section (C2), the universal rings
`H*(BU(r);ℤ)=ℤ[c₁,…,c_r]`, `H*(BO(n);𝔽₂)=𝔽₂[w₁,…,w_n]` and the BSO rings
(C3), universal Chern–Weil and Borel's theorem `H*(BG;ℚ)≃H*(BT;ℚ)^W`
(C4–C5), the exterior Hopf theorem `H*(K;ℚ)=Λ_ℚ(z₁,…,z_r)` with its
universal transgression (C5a), the rational Chern character with its
Thom correction (C6), and Whitney's theorem that `ℝP^(2^k)` admits no
immersion into `ℝ^(2^(k+1)−2)` (C7).

## Scope and ownership

This roadmap owns, in its layers C1–C7 (with C5a between C5 and C6): the
metric frame and orientation-cover comparisons and the principal universal
join classifiers of C1, with their comparison against TopologicalKTheory's
Grassmannian classifiers; the support foundation's collared-pair excision
(C1.2a S5) and the bundle/coefficient comparisons of C1.2b; the rank-one
Eilenberg–MacLane identifications and line classification of C1.5–C1.6;
Thom, Euler and Gysin theory (C2); projective splitting and the integral and
mod 2 universal rings (C3); curvature classes and the universal Chern–Weil
map (C4); compact-Lie restriction and the universal rational rings (C5);
the compact Lie cohomology, Weil-algebra and transgression comparisons
(C5a); the multiplicative series, Chern character and Thom correction (C6);
and the characteristic-number and obstruction calculations of C7.

It consumes, and does not restate, what the suppliers under "Exact supplier
contracts" own: the vector-bundle category, finite and infinite
Grassmannians, oriented carriers and K-theory of TopologicalKTheory; the
singular, cellular and compactly supported cohomology of AlgebraicTopology;
forms and de Rham cohomology of DifferentialGeometry; smooth connections of
SmoothBundlesConnections; the compact Lie structure theory of LieGroups and
CompactGroups; the CE complex of LieGroupoidsPoisson; and the reflection
invariant theory of ReflectionInvariantTheory.

The Lefschetz fixed-point formula, its graph/diagonal trace expression and
the fixed-point index sum belong to MorseNovikov N6 and are not restated
here; C2.3 states only the Euler-class pullback identity for a self-map.
The algebraic-vector-bundle roadmap concerns schemes and Chow/étale realization.
Tau Ceti's quadratic-form `sw1`/`sw2` concern Galois cohomology of fields; they
are distinct from the topological classes constructed here. The classifying-space
roadmap [ClassifyingSpaces](../ClassifyingSpaces/README.md) treats
discrete groups with the weak-topology countable join; C1 compares that
specialization and supplies compact Lie and general Hausdorff groups.

## Conventions

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

Abbreviations below use the linked suppliers: TopK=TopologicalKTheory,
AT=AlgebraicTopology, SBC=SmoothBundlesConnections, CKG=ComplexKahlerGeometry,
GT=GeometricTopology and DG=DifferentialGeometry.

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

### From Mathlib

Consumed as stated at the pinned Mathlib, with the hypotheses of each
declaration:

- Bundles: `FiberBundle`, `VectorBundle`, `VectorBundleCore`,
  `Bundle.TotalSpace`, their pullback, Hom and dual constructions, and
  `ContMDiffVectorBundle` for the smooth statements.
- Compactly generated spaces: `CompactlyGenerated` and its forgetful functor
  `CompactlyGenerated.compactlyGeneratedToTop` (C1.1b, the stable carriers).
- Simplicial sets: the adjunction `sSetTopAdj : SSet.toTop ⊣ TopCat.toSSet`,
  `SSet.KanComplex` and `SSet.π₀` (C1.2b's singular counit).
- Sheaf and Čech cohomology: `cechComplexFunctor` and
  `CategoryTheory.Sheaf.H` (C1.2b's Čech/singular comparison).
- Manifolds: `exists_embedding_euclidean_of_compact` and `ContMDiffMap`
  (C2.5's fibre integration), `Manifold.IsImmersion` and `Manifold.IsImmersion.id`,
  `MulAction.instChartedSpaceQuotient`, `contMDiff_neg_sphere` and
  `contMDiff_id` (C7.3a).
- Algebra: `MvPolynomial.symmetricSubalgebra` (C3.4), `Projectivization`
  (C7.3a), `LieAlgebra.HasCentralRadical` and `LieAlgebra.IsKilling` (C5.1),
  and the low-degree Lie cochains with
  `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial` (C5a.1).

### From Tau Ceti

Consumed by name at the pinned Tau Ceti, each with the hypotheses of its
declaration; the layer that consumes a name says what it uses.

- Singular cohomology (`AlgebraicTopology/Cohomology/`):
  `TopCat.singularCohomology`, `TopPair.singularCohomology`,
  `singularCohomologyMap`, `singularCup`, `singularCohomologyδ` and the
  relative exactness and naturality lemmas (C1–C3).
- Serre fibrations (`Topology/Homotopy/SerreFibration/Basic.lean`,
  `FiberBundle.lean`): `TauCeti.TopCat.serreFibrations`,
  `mem_serreFibrations_iff_cube`, `IsCoveringMap.mem_serreFibrations`,
  `TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization`,
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and
  `TauCeti.TopCat.mem_serreFibrations_proj` (C1.1b).
- Orthonormal frames (`Topology/VectorBundle/OrthonormalFrame/`,
  `GramSchmidt.lean`): `TauCeti.OrthonormalFrameBundle` with
  `smul_eq_self_iff`, `exists_smul_eq_iff`, `continuous_iff`,
  `exists_trivialization`, `associatedHomeomorph` and `pullbackHomeomorph`;
  `Bundle.Trivialization.orthonormalFrame`,
  `Bundle.Trivialization.orthonormalFrameBundle` and
  `Continuous.gramSchmidtNormed_bundle` (C1.0).
- Orientations (`Topology/VectorBundle/Orientation/`):
  `TauCeti.VectorBundleOrientation`, `Bundle.Trivialization.mapOrientation`,
  `TauCeti.VectorBundleOrientationCover` with `trivializationHomeomorph`,
  `isCoveringMap_proj`, `ncard_fiber` and `deck`,
  `TauCeti.VectorBundleOrientation.nonempty_iff_exists_section`,
  `VectorBundleOrientation.nonempty_iff_not_connectedSpace`,
  `TauCeti.OrthonormalFrameBundle.toOrientationCover`,
  `TauCeti.OrthonormalFrameBundle.orientationCoverHomeomorph`,
  `toOrientationCover_eq_toOrientationCover_iff`,
  `TauCeti.VectorBundleOrientation.prod`,
  `TauCeti.VectorBundleOrientationCover.prodMap`,
  `TauCeti.VectorBundleOrientationCover.signLocalSystem`,
  `TauCeti.VectorBundleOrientation.signLocalSystemIso` and
  `TauCeti.VectorBundleOrientationCover.tautologicalOrientation` (C1.0–C1.1a,
  C2.1).
- Grassmannians (`Topology/Grassmannian/`): `TauCeti.finiteGrassmannian`
  with `TauCeti.finiteGrassmannian.Tautological` and its rank and ambient
  stabilization maps, and `TauCeti.finiteOrientedGrassmannian` with `forget`
  and `Tautological` (C1.1a, C3).
- Thom and Euler classes (`Topology/VectorBundle/EulerClass.lean`,
  `ThomClass.lean`, `MayerVietoris/`, `Orientation/ThomClass.lean`):
  `TauCeti.thomPair`, `TauCeti.IsThomClass`,
  `TauCeti.IsThomClass.singularCohomologyMap`, `TauCeti.IsThomClass.pullback`,
  `TauCeti.IsThomClass.neg`, `TauCeti.eulerClass`,
  `TauCeti.eulerClass_naturality`, `TauCeti.eulerClass_pullback`,
  `TauCeti.eulerClass_eq_zero_of_forall_ne_zero`,
  `TauCeti.eulerClass_trivial_eq_zero`,
  `TauCeti.isZero_singularCohomology_thomPair`,
  `TauCeti.exists_singularCohomology_thomPairOver_biUnion`,
  `singularCohomology_thomPairOver_biUnion_ext`,
  `TauCeti.existsUnique_singularCohomology_thomPairOver_iUnion`,
  `TauCeti.VectorBundleOrientation.exists_isThomClass` and
  `TauCeti.exists_isThomClass_of_compactSpace` (C2.1–C2.2).
- Separation, extension and finite rank: `TauCeti.FiberBundle.t2Space_totalSpace`
  (`Topology/FiberBundle/Separation.lean`),
  `TauCeti.hasHomotopyExtensionProperty_base` and
  `TauCeti.HasHomotopyExtensionProperty.image`
  (`Topology/Homotopy/Extension/`) for C2.0, and
  `TauCeti.FiniteRankBundleCore.ofBundle`
  (`Topology/VectorBundle/FiniteRank/Basic.lean`) for C7.3a.
- Manifold orientation and Euler characteristic:
  `TauCeti.Manifold.Orientation.toVectorBundleOrientation`
  (`Geometry/Manifold/Orientation/Basic.lean`), `Orientation.localOrientation`
  (`AlgebraicTopology/Singular/LocalHomology/Orientation/Linear.lean`),
  `TauCeti.HomologicalOrientation.evalFundamentalClass` and the Euler
  characteristic `TauCeti.eulerChar` of a space of finite CW type (C2.3).
- Spin covers (`Topology/Algebra/CliffordAlgebra/Spin/`):
  `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`,
  `TauCeti.realSpinThreeHomeomorphQuaternionSphere` and
  `CliffordAlgebra.pathConnectedSpace_realCliffordSpinGroupZero_add_two`
  (C1.1d, C3.5).
- Compact groups and Lie algebras: `ContRepresentation.isUnitarizable`
  (`RepresentationTheory/Compact/Unitarizable.lean`); the Chevalley
  restriction `TauCeti.lieCartanRestriction`,
  `LieSubalgebra.lieChevalleyRestrictionIso`,
  `LieSubalgebra.coe_lieChevalleyRestrictionIso_apply`,
  `LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff` and
  `TauCeti.SymmetricAlgebra.lieInvariants`; `TauCeti.killingSymmetricEquiv`,
  `TauCeti.map_dualMap_killingSymmetricEquiv`,
  `TauCeti.killingSymmetricEquiv_lieModuleDerivation` and
  `TauCeti.map_killingSymmetricEquiv_lieInvariants` (C5.1).
- Power series (`RingTheory/PowerSeries/MultiplicativeSequence.lean`,
  `CharacteristicSeries.lean`, `GenusPolynomials.lean`):
  `PowerSeries.multiplicativeSequence` and its root, Whitney and stability
  lemmas, `TauCeti.hirzebruchLSeries`, `TauCeti.aHatSeries` and the
  low-degree genus identities (C6.1, C7.1).
- Real projective space: `TauCeti.RealProjectiveSpace` and
  `TauCeti.instIsManifoldQuotient` (C7.3a).

### From TauCetiRoadmap.TopologicalKTheory

The continuous finite-rank category, locally constant ranks, finite
embeddings, metrics, Grassmannians, Stiefel spaces and numerable BO/BU classification are
[TopologicalKTheory T1](../TopologicalKTheory/README.md)
dependencies. Its T6.4 supplies continuous principal/associated bundles and
descent. Use TopK T1.5's actual finite real Grassmannians and tautological bundles,
and TopK T1.6a's positive-rank finite oriented carriers (the pinned
`TauCeti.finiteOrientedGrassmannian`, the orientation double cover of T1.5's
tautological bundle), their lifted finite cells and coordinate maps, and the
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

[TopologicalKTheory T2–T5](../TopologicalKTheory/README.md) owns actual SplitK0
K-rings, relative triples/complexes, compact supports, λ-operations, Bott and
the dual-Koszul Thom class. C6 constructs ch on these functors and its Thom
correction, rather than replacing relative classes by their absolute image.

### From TauCetiRoadmap.AlgebraicTopology

[AlgebraicTopology Stages2–6,8.1–8.7](../AlgebraicTopology/README.md) owns singular
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
For the support lane, C1.2a consumes AT's supported-cellular foundation
after ordinary 6.2: the support colimit C_c^* and H_c^*, enlargement,
cofinality, proper pullback, open extension, supported and mixed-support
cups, and jointly proper homotopy invariance. C1.2a owns S5's collared-pair
support excision and supported pair triangle, and the comparison of that
triangle with AT's supported CW-pair triangle. No AT stage consumes C1.2a.

[AlgebraicTopology Stage 4.8 and Stage 5.5](../AlgebraicTopology/README.md)
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

### From TauCetiRoadmap.DifferentialGeometry

[DifferentialGeometry Layers1–2,5–10](../DifferentialGeometry/README.md) owns
forms, wedge, d, orientations, integration/Stokes, compact supports and the
multiplicative singular/de Rham comparison. C2 builds cohomological Thom,
fibre integration and their comparison on those objects, including the
compact-support singular/de Rham comparison.

### From TauCetiRoadmap.SmoothBundlesConnections

[SmoothBundlesConnections B1–B4,B6](../SmoothBundlesConnections/README.md)
owns principal/associated smooth bundles, connections, curvature, Bianchi,
local transition conventions and the normalized integral circle class.

### From TauCetiRoadmap.ComplexKahlerGeometry

[ComplexKahlerGeometry K4](../ComplexKahlerGeometry/README.md)
supplies Hermitian holomorphic bundles and Chern connections;
[K7.1/K7.2](../ComplexKahlerGeometry/README.md)
supplies the single projective carrier/atlas, tautological and dual lines,
normalized Fubini–Study form and O(1) curvature −2πiω_FS. C1.5 uses
K7.1 and only K7.2's CW/cellular/cup subitems, with positive hyperplane
generator and inclusion compatibility, before the universal-class
comparison. The line-curvature/smooth comparison uses K4 and K7.2's
independent form and SBC B6 circle-class comparisons.

### From TauCetiRoadmap.GeometricTopology

[GeometricTopology Layers1,3,10](../GeometricTopology/README.md) owns
embeddings/tubular maps, the smooth mapping topology and the oriented-plane
Euler target. These are roadmap targets of that supplier,
not claims that a built supplier API already exists.
C2 constructs general Euler/Thom and compares its rank2 restriction with
that standalone plane construction.

### From TauCetiRoadmap.LieGroups

[LieGroups](../RepresentationTheory/LieGroups/README.md) owns Lie groups,
closed subgroups, adjoint action, tori, Weyl groups and root planes, the
compact metric and center/derived splitting of its Layer 5A, and the Cartan
and root-pairing comparison of its Layer 6. C1 builds finite faithful
representations as the universal-approximation connector. C5 builds
invariant-polynomial restriction on Layer 5A's metric, splitting and
negative-definite Killing form and Layer 6's Cartan and root-pairing
comparison, with the pinned Tau Ceti Chevalley restriction isomorphism and
its homogeneous compatibility (C5.1) for the generic Lie-algebra restriction.

### From TauCetiRoadmap.CompactGroups

[CompactGroups](../RepresentationTheory/CompactGroups/README.md) owns Haar
averaging and Peter–Weyl; C5.1 and C5a.1 use its Layer 0–1 normalized Haar
probability and averaging.

### From TauCetiRoadmap.LieHighestWeight

[LieHighestWeight L1](../RepresentationTheory/LieHighestWeight/README.md)
owns the Cartan/root decomposition and the rootSystem with which LieGroups
Layer 6's compact root pairing is compared (C5.1).

### From TauCetiRoadmap.LieGroupoidsPoisson

LieGroupoidsPoisson G1.3a
owns the all-degree real Lie-algebra CE complex, its coefficient modules
and low-degree native comparison. C5a constructs the compact-group
invariant-form and Haar homotopies on that complex.

### From TauCetiRoadmap.ReflectionInvariantTheory

[ReflectionInvariantTheory §§1–3](../ReflectionInvariantTheory/README.md)
owns the early fixed-polynomial algebra, homogeneous basic-invariant
evaluation, regular sequence, coinvariant and character-lattice scalar-change
interfaces independently of topology; its §4 owns the root-theoretic
degree/exponent convention used in C5a.7. C5a uses those maps and owns
their compact cohomology/transgression application. Its exterior theorem is
not a premise for the reflection invariant-algebra theorem.

### From TauCetiRoadmap.SpinRepresentations

[SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md)
supplies exterior/half-spin modules and weight characters. C7 translates
specified root characters into characteristic series; spin lifts, geometric
chirality, Dirac operators and index theorems belong to geometric roadmaps.

### From TauCetiRoadmap.TopologicalSheafCohomology

[TopologicalSheafCohomology TS1.1–TS1.2](../TopologicalSheafCohomology/README.md)
supplies the early cover-theoretic Čech interface on arbitrary topological
spaces: fixed-cover tuple complexes, raw refinement cochain maps and their
homotopies (C1.2b).

### From TauCetiRoadmap.GeneralizedCohomology

[GeneralizedCohomology G4.0a](../GeneralizedCohomology/README.md) supplies
the quaternionic projective line HP¹ with its Sp(1)/Spin(3) calibration, and
its G4 the ordinary quaternionic-line normalization `u=c₂(F)`, used by
C7.AdjointHopfObstruction.

### From TauCetiRoadmap.SpinGeometry

[SpinGeometry G4.1a](../SpinGeometry/README.md) owns rank0/rank1 and frame
transport through the native abstract/units-range/matrix comparisons, with
the geometric μ2→SO(0)={1}; C3.5 uses those topological carrier adapters and
no smooth-cover refinement.

### From TauCetiRoadmap.SchubertGeometry

[SchubertGeometry S9.6](../SchubertGeometry/README.md) supplies the rational
acyclicity of K/N(T), the finite-cover transfer and the integral comparison
`SU(2)/N(T)=RP²` used by C5a.6–C5a.7.

### From TauCetiRoadmap.ClassifyingSpaces

[ClassifyingSpaces](../ClassifyingSpaces/README.md) supplies the
weak-topology countable join model for discrete groups, with which C1.1b
compares its strong-topology join for finite discrete G.

## How to read the build

The layers are built in the order C1, C2, C3, C4, C5, C5a, C6, C7. C1 builds the
metric frames, orientation covers and principal universal bundles, compares
them with TopologicalKTheory's Grassmannian classifiers, and assembles the
support, coefficient and Čech comparisons and the rank-one Eilenberg–MacLane
identifications that the later layers use. C2 builds the bundle
disk/sphere cells, the Thom and Euler classes, the Euler class as primary
obstruction, Poincaré–Hopf, Gysin maps and fibre integration. C3 proves
Leray–Hirsch and projective splitting, defines Stiefel–Whitney, Chern and
Pontryagin classes, and computes the integral and mod 2 universal rings and
the w₂ spin obstruction. C4 builds curvature forms and the universal
Chern–Weil map. C5 proves Chevalley restriction, Borel's theorem and the
rational universal rings. C5a builds the compact Lie cohomology,
Weil-algebra and universal-transgression comparisons. C6 builds the
multiplicative series, the Chern character and its Thom correction. C7
states the characteristic formulas and the acceptance calculations.

C1 and C2 precede C3. C3.6's away2/odd-prime rings consume C3.1–4 and
C1–2 and AT4/6's compact-image/cochain/Milnor foundation, before C4–5
and independently of Spin or bordism. C3.5 consumes the native topological spin cover
and [SpinGeometry G4.1a](../SpinGeometry/README.md)'s topological carrier adapters; it uses no smooth
refinement. The spin-lift obstruction/torsor consumes C3.5 afterwards.
C4's invariant-form construction and line comparison use
C1–C3 and the smooth suppliers; C5.5 proves the Pfaffian comparison after
rational 2-plane splitting. C5 uses the universal Chern–Weil map of C4, not an assumed
isomorphism, and proves the isomorphism by restriction and fibre integration.
C6 constructs the multiplicative series before its Chern-character and Thom
comparisons; C7's rational coefficient and genus comparisons then use C5–C6.
C7.3a's real-projective and normal-bundle calculation instead uses C1–C3,
AT4.6, TopK T1's bundle category, metrics and embeddings and T1.5–T1.6 with
T1.5's real carrier/chart comparison and SBC B2, independently of C4–C6. The projective cohomology theorem is
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
already independent C5 Borel theorem with SchubertGeometry S9.6's result; it is not
an input to either construction. The integral unitary examples in C5a.7 use
their separate sphere-fibration induction; its exponent lists consume only
ReflectionInvariantTheory §4's pure root-theoretic data. That supplier's late
topological adapters consume these results and are not premises for them.
No KKS moment-Morse application,
analytic index or Floer count enters these compact constructions.

## C1: Universal principal bundles and cohomology infrastructure

**C1.0. Metric frames before classification.** The orthonormal frame
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
parameter dependence, the inverse transport, and homotopy compatibility
(Hatcher, *Vector Bundles and K-Theory*, §1.2, p. 26: Gram–Schmidt
deformation-retracts GL_n(ℝ) onto O(n), so any two metrics are homotopic
through metrics).
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
- For h₀ the standard form and H=diag(1,4), the transport H^(−1/2)=diag(1,1/2)
  sends e₂ to e₂/2, and h₁(e₂/2,e₂/2)=h₀(2e₂,e₂/2)=1; transporting by H^(1/2)
  or by H⁻¹ instead gives h₁-norms 4 and 1/2, so neither carries orthonormal
  frames to orthonormal frames.
- For the same H the Sylvester operator K↦H^(1/2)K+KH^(1/2) has the
  eigenvalue sums 1+1=2, 1+2=3 and 2+2=4, all positive, so it is invertible;
  the commutator K↦H^(1/2)K−KH^(1/2) has the eigenvalue 1−1=0 and is not.
- In rank 0 the frame carrier is the singleton zero frame, while the
  orientation cover still has two points, the signs ±1; for n=1 the frames
  of a fibre are the two unit vectors and SO(1) is trivial, so the frame
  quotient by SO(1) has two points, matching the two orientations, whereas
  the quotient by O(1) would have one.

*Needs:* Tau Ceti's pinned orthonormal frame bundle, Gram–Schmidt frames and
orientation cover (`Topology/VectorBundle/OrthonormalFrame/`,
`Topology/VectorBundle/Orientation/`); TopologicalKTheory T1's continuous
metrics; SmoothBundlesConnections B2 for the smooth versions;
DifferentialGeometry's tangent orientation cover for the chart-sign
comparison.

1. **C1.1a. Finite oriented-cover precursor.** Consume C1.0's single
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

   **C1.1b. Numerable joins and frame specialization.** Use TopK T6.4
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
   **C1.1d. Trivializations and disconnected clutching.** For a continuous
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
   relative triples (SO(n),SO(k+1),SO(k)), together with the pinned double
   cover of SO(3) by the 3-sphere as the only inputs beyond T1.5a: the
   covering map `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`
   at n=3 (`Topology/Algebra/CliffordAlgebra/Spin/Covering.lean`, onto the
   special orthogonal group of `realCliffordForm 3 0`, with central kernel
   μ2) and the homeomorphism `TauCeti.realSpinThreeHomeomorphQuaternionSphere`
   from compact Spin(3) onto the unit quaternions S³
   (`Topology/Algebra/CliffordAlgebra/Spin/SimplyConnected.lean`). Transport
   it to T1.5a's SO(3) by sending a positively oriented orthonormal 3-frame
   to the isometry of `realCliffordForm 3 0` that carries the standard basis
   to it. Prove π₂(SO(k))=0 for every k: π₂(SO(2))=π₂(S¹)=0,
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

2. **Bockstein input.** Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and
   Bockstein construction on the existing singular/relative cochain complexes,
   including 0→Z→[×2]Z→F2→0. Build its coefficient-change compatibility with
   the graded and supported interfaces here; do not define a second Bockstein.

   **C1.2a. Compact-relative support foundations.** S0–S4 consume
   AlgebraicTopology's supported-cellular supplement after ordinary Stage
   6.2, which owns the compactly supported local-coefficient cochains; S5
   and the comparison of its triangle with that supplement's supported
   CW-pair triangle are this item's own. These precede bundle
   classification, Thom theory and manifold duality.

   **S0 (diagram and colimit).** Consume the supplement's compactly
   supported cochains: for locally compact Hausdorff X, closed A⊆X,
   commutative R and an arbitrary module-valued local system L on X, with no
   finite-rank, projectivity, freeness or field hypothesis on the fibres,
   `C_K^*(X,A;L)=C^*(X,A∪(X∖K);L)` on AT6.1's first-vertex cochains for
   compact K, its degreewise filtered colimit `C_c^*(X,A;L)` and
   `H_c^n(X,A;L)=colim_K H^n(X,A∪(X∖K);L)`, with the constant system L=R
   recovering the constant-coefficient object. Every construction below
   uses this one object.

   **S1 (enlargement).** Consume the supplement's support-enlargement maps
   `C_K^*→C_(K′)^*` for K⊆K′, with their identity and composition laws and
   their commutation with morphisms of local systems.

   **S2 (cofinality).** Consume the supplement's cofinal-family comparison,
   a countable exhaustion being used only when it is proved cofinal, with
   its compatibility with local-system morphisms and the constant-system
   specialization. Prove here that for proper f the inverse images of a
   cofinal family of compact subsets of the target are cofinal among compact
   subsets of the source (a compact K′ lies in f⁻¹(f(K′))), so the
   comparison commutes with S3's proper pullback.

   **S3 (proper pullback, open extension and supported cups).** Consume the
   supplement's proper pullback `f^*:H_c^*(Y,B;L_Y)→H_c^*(X,A;L_X)` for a
   proper map of closed pairs f:(X,A)→(Y,B) and a coefficient morphism
   α:f^*L_Y→L_X, with its identity, composition and coefficient-change laws;
   its open extension `H_c^*(V;L|_V)→H_c^*(X;L)` for open V⊆X, bound to the
   chosen excision comparison; and its supported and mixed-support cup
   products for a pairing L⊗L′→L″. Closed-pair excision is not assumed
   without S5's condition.

   **S4 (jointly proper homotopy invariance).** Consume the supplement's
   jointly proper homotopy invariance: for H:I×X→Y with H(I×A)⊆B and H
   itself proper, the two endpoint pullbacks agree after the canonical
   transport identification of the endpoint local systems along t↦H(t,x);
   properness of the separate slices is not enough, and a homotopy fixed on
   A gives the relative statement with identity transport.

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
   by being closed. For a locally finite finite-dimensional Hausdorff CW
   pair carrying the collar data above, prove that this triangle agrees,
   through the supplement's supported cellular/singular comparison, with
   the supplement's supported CW-pair short exact sequence and triangle;
   this comparison is an output of S5 and an input to neither triangle.
   These foundations consume AT2–4, ordinary AT6.1–6.2 and AT's
   supported-cellular foundation, independently of AT8.5 and of every
   classifier and Thom construction of this roadmap.

   **C1.2a mixed-support cup/module products.** Consume AlgebraicTopology
   Stage 6.2's relative cup/module maps on the actual TopPair carrier: the
   absolute-relative module action and the same-pair relative cup, which
   exist for every pair, and the cup and cross products into a union of
   relative subsets, which 6.2 states for excisive couples, NDR triads or
   open complements of compact supports together with its small-chain
   comparison from C(A)+C(B) to C(A∪B). Consume the supported and
   mixed-support cups of AT's supported-cellular supplement through S3.
   Arbitrary closed couples receive no relative product.

   **C1.2b. Bundle/coefficient comparisons.** For arbitrary paracompact bases,
   prove the bundle-specific Leray–Hirsch and
   Thom comparisons through the singular CW-resolution pullback: construct
   the evaluation |Sing X|→X as the counit of Mathlib's `sSetTopAdj : SSet.toTop ⊣ TopCat.toSSet`,
   consume AT4.7's realization CW structure of a native simplicial set (one
   cell per nondegenerate simplex, the realized simplex as characteristic
   map) and paracompactness instead of constructing a second realization CW
   structure. Own Milnor's
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
   Own the Čech/singular comparison on CW type: for every paracompact Hausdorff X of
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
   fibre E_m. Apply AT4.8's connected-map comparison after AT5.5's
   homotopy exact sequence of this fibration. State the bound,
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
   This construction uses AT4/6 and T1.6's carrier portion, preceding the
   Eilenberg–MacLane identification of C1.5a and ordinary line
   classification. Prove
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

   **C1.5a. Classical Eilenberg–MacLane comparisons.** After the
   carrier/cellular comparisons above, own the identification of T1.6's
   rank-one RP∞ and CP∞ carriers, with their final/weak CW topology, as
   K(ℤ/2,1) and K(ℤ,2), respectively, and the coefficient-natural
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

6. **Ordinary classification of line bundles.** For CW complexes and for
   paracompact Hausdorff bases of CW type, combine T1.6's numerable rank-one
   bundle classification with AT8.10 ordinary representability and C1.5a's
   class-normalized CP∞≃K(ℤ,2) and RP∞≃K(ℤ/2,1) comparisons. Prove
   complex-line isomorphism classes ≃H²(X;ℤ), with tautological class x=−h,
   and real-line classes ≃H¹(X;ℤ/2), with their natural tensor/dual maps.
   Prove the relative versions for bundles with a prescribed trivialization
   on a CW subcomplex, using AT8.10's relative map classes; preserve that
   trivialization under isomorphisms and homotopies. This theorem follows
   C1.5's carrier/cellular comparisons and C1.5a's Eilenberg–MacLane
   identification; the C1.5 comparisons use no line-classification theorem
   or Eilenberg–MacLane identification. On general paracompact bases retain
   the stated Čech/singular distinction rather than assert singular classification.

### Examples

Over S² the oriented rank 2 bundles are indexed by the winding m of the
clutching function R(mθ); conjugation by J=diag(−1,1) identifies m with −m
once the orientation is forgotten, TS² has winding 2 and O(−1) winding −1
(C1.1d). The free homotopy classes are `[S¹,O(2)]=ℤ⋊_(−1)(ℤ/2)` and
`[S¹,O(k)]=(ℤ/2)×(ℤ/2)` for k≥3, the based classes of SO(k) together with
the two components of O(k) (C1.1d). The support foundation consumed in
C1.2a has `H_c^1(ℝ;ℤ)=ℤ` while `H^1(ℝ;ℤ)=0`, and the proper map x↦x² of ℝ
acts on it by 0. RP∞ and CP∞ are K(ℤ/2,1) and K(ℤ,2), and the composite
CP¹→CP∞→K(ℤ,2) represents the generator of π₂(K(ℤ,2)) that is +1 under
AT8.10's identification (C1.5a).

### Dependencies

TopologicalKTheory T1, T1.5, T1.5a, T1.6, T1.6a and T6.4.
AlgebraicTopology Stages 2–6 with the supported-cellular supplement after
Stage 6.2, Stages 4.5–4.8 and 5.5, and Stage 8 items 8.2, 8.3, 8.5, 8.8b,
8.9, 8.10 and 8.12. SmoothBundlesConnections B1–B2 and B6.
ComplexKahlerGeometry K7.1–K7.2. LieGroups and CompactGroups.
TopologicalSheafCohomology TS1.1–TS1.2. ClassifyingSpaces.

## C2: Thom, Euler and Gysin theory

**C2.0. Bundle disk/sphere cells.** Before the cohomological Thom theorem,
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
On the fiber cube use AT2.5's single sup-ball-to-Euclidean-disk homeomorphism,
whose fixed formula is v↦(‖v‖∞/‖v‖₂)·v for v≠0 and 0↦0, with inverse
w↦(‖w‖₂/‖w‖∞)·w; then apply the orthonormal frame. Include its rank0
point case.
Its boundary is (∂D^q×D^r)∪(D^q×∂D^r), the disk/sphere decomposition of a
product disk bundle (Cohen, *The Topology of Fiber Bundles*, Chapter3 §2,
the Thom space (2.4) and Proposition3.7, p.87). Compare the radial map's relative
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
relative cell structure to AT4.5's relative CW pushout
`relativeCWPushoutCarrier`, passing the
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
Use AT4.5's homotopy-pushout gluing comparison and its relative CW
pushout CW model `relativeCWPushoutCWModel`, using native
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
- In rank 0 the sphere bundle S(E) is empty and D(E)=X, so the cells are the
  base cells unshifted and the pointed Thom model is X with a disjoint
  basepoint; taking X itself as the Thom space would lose the reduced H⁰.
- For TS² over S² with one 0-cell and one 2-cell, the Thom cells have
  dimensions 0+2=2 and 2+2=4; an indexing that forgot the fibre shift r
  would put them in degrees 0 and 2.
- The sup-ball map sends v=(1,1), with ‖v‖∞=1 and ‖v‖₂=√2, to (1,1)/√2, of
  Euclidean norm 1; the inverted ratio ‖v‖₂/‖v‖∞ would send it to (√2,√2),
  of Euclidean norm 2, off the unit sphere.

*Needs:* TopologicalKTheory T1.3's continuous fibre metric and T1.4's
compact-disk bundle homotopy invariance; AlgebraicTopology Stage 2.5's
sup-ball-to-disk homeomorphism and Stage 4.5's relative CW pushout and
homotopy-pushout gluing; the pinned `TauCeti.FiberBundle.t2Space_totalSpace`,
`TauCeti.hasHomotopyExtensionProperty_base` and
`TauCeti.HasHomotopyExtensionProperty.image`.

1. The Thom pair `(E,E∖0)` is the pinned `TauCeti.thomPair F E`, a Thom class
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
   `MayerVietoris/DirectedUnion.lean`), the transport of Thom classes along a
   map of Thom pairs restricting to isomorphisms of fibre pairs
   `TauCeti.IsThomClass.singularCohomologyMap` and its special case for the
   pullback bundle f*E along a continuous f, `TauCeti.IsThomClass.pullback`
   (`EulerClass.lean`), the compact-base existence
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
2. The Euler class of a relative class is the pinned
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
   - The bundle su(F) on HP¹ of C7.AdjointHopfObstruction has rank 3 over a
     4-dimensional complex, e=0 and no nowhere-zero section: dropping the
     dimension bound makes the criterion false.
3. For a transverse smooth section prove its zero locus has the specified
   orientation and represents Euler via Thom/Gysin. On a closed oriented
   manifold prove the sum-of-local-indices formula and e(TM)[M]=χ(M), with
   the cap/degree normalization of the suppliers. Here χ(M) is the pinned
   `TauCeti.eulerChar` of a space of finite CW type, the pairing is the pinned
   `TauCeti.HomologicalOrientation.evalFundamentalClass`, and e(TM) is the
   Euler class of the Thom class that C2.1 attaches to the tangent-bundle
   orientation `TauCeti.Manifold.Orientation.toVectorBundleOrientation` of the
   oriented manifold (`Geometry/Manifold/Orientation/Basic.lean`); construct
   first the identification of that tangent-bundle orientation with the
   homological orientation fixing [M], pointwise through the pinned generator
   `Orientation.localOrientation` of `H_(n+1)(F,F∖0;ℤ)` selected by an
   orientation of a real space F of dimension n+1
   (`Singular/LocalHomology/Orientation/Linear.lean`; positive dimension only,
   the dimension-zero sign being separate), which is what fixes the sign of the
   identity. Prove the χ identity by
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
   - The identity map of S² gives 2 on both sides; the antipodal map, of
     degree −1, gives −2.
   - A constant map on S² gives 0, while its Lefschetz number is 1: the
     pullback identity is not a fixed-point count. The Lefschetz
     fixed-point formula is not stated in this roadmap.
   - The boundary of a tetrahedron has 4 vertices, 6 edges and 4 faces:
     the index sum of the barycentric field below is 4−6+4=2=χ(S²); a
     triangle as a circle gives 3−3=0.
   **C2.3a. Worked example: the barycentric Hopf field and its simplex
   indices.** This example evaluates C2.3's sum-of-local-indices formula on
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

### Examples

Over a point the Thom class of the orientation ω with fibre class g is g,
and that of −ω is −g; in rank 0 the Thom class is the locally constant sign,
`(1,−1)` on two components with opposite signs; the Möbius line has a ℤ/2
Thom class and no integral one (C2.1). TS² has Euler number 2 and no
nowhere-zero section, the realification of O(1) on CP¹ has Euler number 1,
and su(F) on HP¹, of rank 3 over a 4-dimensional complex, has e=0 and no
nowhere-zero section, so the dimension bound of the obstruction theorem
cannot be dropped (C2.2). The barycentric Hopf field of C2.3a has index
(−1)^d at the barycentre of a d-simplex, so on the boundary of a tetrahedron
its index sum is 4−6+4=2=χ(S²).

### Dependencies

C1. TopologicalKTheory T1.3–T1.4. AlgebraicTopology Stages 2.5, 4.5,
6, 7, 8.1 and 8.9. DifferentialGeometry Layers 1–2 and 5–10.
GeometricTopology Layers 1, 3 and 10. SmoothBundlesConnections B2 and B6.

## C3: Projective splitting and integral/mod2 classes

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
   is not an SO-cover section. [SpinGeometry G4.1a](../SpinGeometry/README.md) owns rank0/rank1 and
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
   cases. In rank0 consume [SpinGeometry G4.1a](../SpinGeometry/README.md)'s geometric μ2→SO(0)={1},
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
   the BSO ring isomorphism away from 2 for every commutative coefficient ring R with
   `IsUnit (2 : R)`, on TopK T1.6's fixed-rank and stable BSO carriers, as actual
   graded-ring isomorphisms sending the polynomial generators to C3's
   universal Pontryagin and C2's Euler classes. Export its R=F_p instance
   and integral-reduction comparison, the mod-odd-prime BSO ring isomorphism.
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
   AT6.0's Milnor sequence and the Gysin stable range to show eventual
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

On RP^n the real projectivization relation reads `a^(n+1)=0` for the
trivial bundle ℝ^(n+1), and `H*(BO(1);𝔽₂)=𝔽₂[w₁]`. The reduction formula
`ρβ(w_j)=w₁w_j+(j−1)w_(j+1)` gives `ρβ(w₁)=w₁²` at j=1 and
`ρβ(w₂)=w₁w₂+w₃` at j=2. `H*(BSO(n);𝔽₂)=𝔽₂[w₂,…,w_n]` for n≥1, and
`c₁(E_ℂ)=β(w₁(E))` is 2-torsion.

### Dependencies

C1–C2. TopologicalKTheory T1.5–T1.6a. AlgebraicTopology Stages 4, 4.8,
6.0, 8.7 and 8.9. SpinGeometry G4.1a.

## C4: Curvature classes and their integral comparison

1. Define Ad-invariant homogeneous symmetric polynomial forms on the actual
   Lie algebra, with product, polarization, pullback by Lie homomorphisms and
   finite matrix evaluation. Apply them to curvature using DG's value-bundle
   wedge/composition and SBC's principal curvature. Prove horizontal/invariant
   descent, closedness from Bianchi, and connection independence by the affine connection path and explicit
   transgression form (Dupont, *Fibre Bundles and Chern–Weil Theory*, §9,
   Proposition 9.1 for polarization, Proposition 9.3 for closedness,
   Theorem 9.5 and Lemma 9.6 for connection independence). Prove gauge invariance,
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

### Examples

In the rank-one convention the standard character θ↦exp(iθ) has
degree-one invariant polynomial −a/(2π), so cw sends it to −[F_real/(2π)];
the real block `[[0,−α],[α,0]]` has complex line curvature i dα and Euler
form −dα/(2π); CKG's O(1) curvature −2πiω_FS gives Chern form +ω_FS
(Conventions).

### Dependencies

C1–C3. DifferentialGeometry Layers 1–2 and 5–10.
SmoothBundlesConnections B1–B4 and B6. ComplexKahlerGeometry K4 and
K7.1–K7.2.

## C5: Compact-Lie restriction and universal rational rings

1. Prove Chevalley restriction `I(G)≃Sym(t*)^W` for compact connected G
   (Dupont, *Curvature and Characteristic Classes*, Proposition8.3). The
   injective direction uses conjugacy into a maximal torus. Identify group
   invariance with infinitesimal invariance using connected generation by
   exponential neighbourhoods before applying the Lie-algebra theorem. Consume
   [LieGroups Layer1 and Layer6](../RepresentationTheory/LieGroups/README.md)
   for the adjoint representation Ad, maximal tori, their conjugacy, the
   Weyl group N(T)/T and its identification with the root-system Weyl group,
   and [CompactGroups Layer0–1](../RepresentationTheory/CompactGroups/README.md)
   for the Haar average of a Hermitian form under a continuous representation.
   Consume [LieGroups Layer 5A](../RepresentationTheory/LieGroups/README.md)'s
   Ad-invariant positive-definite metric B_G, the orthogonal splitting
   `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` and the negative-definite Killing form of the
   centerless semisimple ideal `[𝔤,𝔤]`, for G compact and connected; the
   pinned Weyl unitarian trick `ContRepresentation.isUnitarizable`
   (`RepresentationTheory/Compact/Unitarizable.lean`) is the library's
   statement that LieGroups Layer 1's Ad on a compact G carries such an
   invariant form over 𝕜=ℝ. Consume LieGroups Layer 6's identification of t_ss,C as a Cartan
   subalgebra of the complexified semisimple summand, with its root
   characters and its root-pairing isomorphism with LieHighestWeight's
   rootSystem, preserving the geometric Weyl action and the center. In
   Mathlib's vocabulary 𝔤 then has central radical (Mathlib's
   `LieAlgebra.HasCentralRadical`), and the Killing form of `[𝔤,𝔤]_ℂ`, the
   complex-bilinear extension of the negative-definite real one, is
   nondegenerate (`LieAlgebra.IsKilling`). This item owns the comparison of
   B_G with the Killing form by an equivariant positive scalar on each simple
   factor, and the transport of the supplied maps through invariant
   polynomial functions and their restriction square; a second construction
   of the splitting or of the Cartan/root dictionary is not made here. For
   surjectivity consume
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

### Examples

For SO(2r+1) the Weyl group acts by all sign changes and permutations and
`H*(BSO(2r+1);ℚ)=ℚ[p₁,…,p_r]`; for SO(2r) it acts by even sign changes,
giving `ℚ[p₁,…,p_(r−1),e]` with `p_r=e²`; the determinant component sends e
to −e and `H*(BO(n);ℚ)=ℚ[p₁,…,p_floor(n/2)]`. For SU(2) the Euler integral
of G/T=S² is 2=|W|.

### Dependencies

C1–C4. LieGroups Layers 1, 5A and 6. CompactGroups Layers 0–1.
LieHighestWeight L1. TopologicalKTheory T1.6.

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

**C5a.1. The compact invariant-form comparison.** Consume
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
- In degree one the convention gives `da(X,Y)=−a([X,Y])`, the value of
  Mathlib's `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial`; the opposite
  sign convention would give `+a([X,Y])` and disagree with it.
- `H¹(SU(2);ℝ)=ann([su(2),su(2)])=0` because su(2) is perfect, while a torus
  T^n has `[𝔱,𝔱]=0` and `H¹(T^n;ℝ)=𝔱*` of dimension n; a comparison that
  ignored the bracket would give dimension 3 for SU(2).
- In degree 0, `A_forms` sends a function f to the constant `∫_K f dg`, so
  `A_forms∘j=j` on constants and H=0 there; for the circle the invariant
  1-form dθ spans `H¹(S¹;ℝ)`.

*Needs:* LieGroupoidsPoisson G1.3a's all-degree CE complex;
DifferentialGeometry's forms, wedge, d, pullback, Cartan homotopy formula and
multiplicative de Rham comparison; CompactGroups Layer 0's normalized Haar
probability; LieGroups' universal-cover and central-quotient classification
for the count of global forms.

**C5a.2. Actual invariant generators and the rational structure.** Consume
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
- U(2) has basic invariants tr and det, of polynomial degrees 1 and 2, so
  cohomological weights 2 and 4 and rank 2 generators; SU(2) has the single
  degree 2 invariant and `H*(BSU(2);ℚ)` one generator in degree 4.
- The E8 degrees 2,8,12,14,18,20,24,30 are rank 8 in number, with
  `Σ(d_i−1)=120` positive roots and `∏d_i=696729600=|W(E8)|`; a list
  omitting one degree fails all three counts.
- For θ↦exp(iθ) the character generator gives the linear polynomial
  −a/(2π); the dual character gives +a/(2π), the opposite sign.

*Needs:* ReflectionInvariantTheory §§1–3's evaluation, regular-sequence and
coinvariant interfaces; C5.1's restriction isomorphism; C1.5, C4 and
C5.2–C5.3 for the rational structure.

**C5a.3. The Weil differential and normalized transgression forms.** Construct
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
- `F_t=tΩ+((t²−t)/2)[θ,θ]` is the curvature `d_W(tθ)+½[tθ,tθ]` of the path
  tθ, by `d_Wθ=Ω−½[θ,θ]`, so `F₀=0` and `F₁=Ω`; the coefficient `(t−t²)/2`
  has the same endpoint values but is not that curvature (at t=1/2 it gives
  `+1/8` instead of `−1/8` for `[θ,θ]`), and the transgression identity
  rests on F_t being the curvature of tθ.
- For the abelian 𝔤=ℝ, `[θ,θ]=0`, so `d_Wθ=Ω` and `d_WΩ=0`; for P(x)=x,
  `CS_P=θ` and `d_W CS_P=Ω=P(Ω)`, and P=−a/(2π) gives `τ(P)=−θ/(2π)`.
- For 𝔤=ℝ the Weil algebra `ℝ[Ω]⊗Λ(θ)` has cohomology ℝ in degree 0 only:
  `Ω^k=d_W(θΩ^(k−1))` and `d_W(θΩ^k)=Ω^(k+1)≠0`.

*Needs:* Mathlib's symmetric, exterior and graded tensor algebras;
CompactGroups Layer 0 for the averaged contraction; SmoothBundlesConnections'
connections and C4's finite universal map.

**C5a.4. The filtered Cartan–Koszul comparison.** Prove the compact reductive
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
- For SU(2), `K_I=ℝ[P]⊗Λ(e₃)` with `De₃=P` is acyclic in positive degrees,
  and its quotient by `I_+` is `Λ(e₃)` with zero differential, so
  `H*(SU(2);ℝ)` has dimensions 1,0,0,1; giving e₃ degree 2d=4 instead of
  2d−1=3 would contradict `H³(SU(2);ℝ)=ℝ`.
- For the trivial group the generator system is empty and `K_I=ℝ`.
- For a torus T^n every basic invariant is linear, every e_i has degree 1,
  and `H*(T^n;ℝ)=Λ(e₁,…,e_n)` has total dimension 2^n.

*Needs:* C5a.1–C5a.3; C5.1's invariant positive form;
ReflectionInvariantTheory §§1–3's regular sequence.

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

**Checks.**
- For the circle, multiplication pulls dθ back to `pr₁*dθ+pr₂*dθ` exactly,
  so the correction form is zero and dθ is primitive.
- For S¹→ES¹→BS¹=CP∞ with rational coefficients the transgression
  `d₂:E₂^(0,1)→E₂^(2,0)` is an isomorphism, the total space being
  contractible; for SU(2)→ESU(2)→BSU(2)=HP∞ it is `d₄(z₃)=±u` with
  `H*(HP∞;ℚ)=ℚ[u]`, `|u|=4`.
- `H*(U(2);ℚ)=Λ(z₁,z₃)` has Poincaré series `(1+t)(1+t³)` and top degree
  1+3=4=dim U(2).

*Needs:* C5a.1–C5a.4; AlgebraicTopology Stage 5.5's multiplicative
cohomological Serre spectral sequence; C1's numerable universal bundle;
C5.3's rational character-lattice comparison.

**C5a.6. Same-model topology and scope comparisons.** Using C1's subgroup
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

**Checks.**
- SU(2) has Poincaré series `1+t³`, total Betti number 2=2^1 and top degree
  3=dim SU(2).
- For U(n) the exterior degrees 2i−1, i=1,…,n, sum to n²=dim U(n), giving
  1+3+5=9 for U(3).
- `P_K(−1)=∏(1+(−1)^(2d_i−1))=0` for positive-dimensional connected K, the
  Euler characteristic 0; the trivial group gives the empty product 1.

*Needs:* C1's subgroup-associated fibrations; SchubertGeometry S9.6's
rational acyclicity of K/N(T) and transfer; C5a.5's Serre comparison;
C5.2–C5.3; LieGroups' finite central cover by a torus times simply connected
simple factors.

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

**Checks.**
- The E8 exponents `1,7,11,13,17,19,23,29` give odd degrees
  `3,15,23,27,35,39,47,59`, which sum to 248=dim E8; a seven-entry list
  cannot reach it.
- SU(3) has exterior degrees 3 and 5, summing to 8=dim SU(3), and BSU(3) has
  polynomial generators in degrees 4 and 6.
- `SU(2)/N(T)=RP²` has `H²(RP²;ℤ)=ℤ/2` and is rationally acyclic, so
  rational acyclicity does not give integral acyclicity; the strictly upper
  triangular 2×2 algebra is abelian of dimension one, with centre not
  contained in its zero derived algebra, while for n=3 the centre and the
  derived algebra are both spanned by E₁₃.

*Needs:* C5a.2–C5a.6; C1.5's CP∞ products; ReflectionInvariantTheory §4's
exponents; SchubertGeometry S9.6's integral `SU(2)/N(T)` comparison.

### Examples

In degree one the CE differential is `da(X,Y)=−a([X,Y])`, and
`H¹(SU(2);ℝ)=0` because `[su(2),su(2)]=su(2)`. For SU(2) the Koszul model is
`I⊗Λ(e₃)` with `De₃=P` for the degree-two basic invariant P, the Poincaré
series is `1+t³` and the total Betti number is 2. U(2) has basic invariants
of polynomial degrees 1 and 2, cohomological weights 2 and 4 and exterior
degrees 1 and 3. The transgression path satisfies `F₀=0` and `F₁=Ω`. The E8
odd degrees `3,15,23,27,35,39,47,59` sum to 248=dim E8.

### Dependencies

C1–C5. LieGroupoidsPoisson G1.3a. CompactGroups Layer 0. LieGroups.
ReflectionInvariantTheory §§1–4. SchubertGeometry S9.6. AlgebraicTopology
Stage 5.5. DifferentialGeometry Layers 1–2 and 5–10.

## C6: Multiplicative series, Chern character and the Thom correction

1. The universal multiplicative sequence of a power series Q with
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

### Examples

`Td(x)=x/(1−e^(−x))=1+x/2+x²/12+…` and `Â(x)=(x/2)/sinh(x/2)=1−x²/24+…`,
with `Td(x)=e^(x/2)Â(x)`; for a line bundle `ch(L)=exp(c₁(L))`, and
ch₀ is the rank.

### Dependencies

C1–C5a. TopologicalKTheory T2–T5, T3.4, T4.8 and T7.4.

## C7: Characteristic formulas and acceptance calculations

1. The low-degree genus polynomials are pinned
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
   to zero, through the pinned stability under a zero root.
   IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve.

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
**C7.AdjointHopfObstruction — zero primary classes without a section.**
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
the SU(2) frame reduction. Under [GeneralizedCohomology G4.0a](../GeneralizedCohomology/README.md)'s
Sp(1)/Spin(3) calibration, identify
the conjugation representation with the action on imaginary quaternions.

On GeneralizedCohomology G4.0a's actual HP¹, identified with its oriented S⁴,
let γ_ℍ be the tautological right-quaternionic line, F its right-complex
restriction, and E=su(F). Use G4's ordinary quaternionic-line normalization
`u=c₂(F)`, with `⟨u,[HP¹]⟩=1`, and the canonical trivial determinant of F.
Construct E on this carrier, including its transition maps from those of
γ_ℍ; do not replace it by an abstract bundle with prescribed classes.
Prove `c₁(F)=0` and `p₁(E)=−4u≠0`. The sphere cohomology calculation and
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
  opposite sign convention p₁=+c₂(E⊗ℂ) would give p₁(E)=+4u on HP¹, and
  the product of the three roots is 0, so e(E)=0 is forced by the roots too.
- On HP¹, c₁(F)=0 and u pairs to 1, so p₁(E) pairs to −4; the
  stably trivial TS² has p₁=0 but Euler number 2, the opposite failure.

3a. **Real-projective tangent classes and immersion obstruction.** For every
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
   bundle operations; forget smoothness and apply the pinned
   `TauCeti.FiniteRankBundleCore.ofBundle`
   (`Topology/VectorBundle/FiniteRank/Basic.lean`) and TopK T1's
   bundle-category comparison to TM and ν_f, using
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
   into ℝ^(2m−2), whose required normal rank would be m−2
   (`not_exists_isImmersion_realProjectiveSpace`, with Mathlib's
   `Manifold.IsImmersion`). That statement takes RP^m to be the orbit space of
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
4. Verify ch respects the relative symbol gluing and external tensor blocks
   on the excisive/supported pairs,
   the compact complex Thom point normalization, the inverse Todd correction,
   dimension4 L₁=p₁/3 and the curve Todd class 1+c₁/2. All source formulas
   involving an Euler denominator are justified universally before evaluation.

### Examples

`L₃[CP⁶]=1` and `L₃[HP³]=0`, `L₂[HP²]=1`; the bundle su(F) on HP¹ has
`p₁=−4u≠0`, `e=0` and all `w_i=0`, and no nowhere-zero section; RP⁴ admits
no immersion into ℝ⁶.

### Dependencies

C1–C6. AlgebraicTopology Stage 4.6. TopologicalKTheory T1, T1.5 and
T1.6. SmoothBundlesConnections B2 and B6. SpinRepresentations.
GeneralizedCohomology G4.0a.

## Downstream consumers

- AffineMorseLefschetz consumes C1.2a S0–S5's supported cohomology and
  supplied-collared-boundary pair sequence for its A4.0 cap dualities.
- BordismFormalGroups consumes C3's Whitney laws and `H*(BO(n);𝔽₂)` and the
  Conventions' standard-character line class.
- ConvexityToric T2 owns Borel equivariant cohomology, moment-map Morse
  theory and localization, consuming C1's torus models
  `ET_N=(S^(2N+1))^m`, `BT_N=(CP^N)^m` with their integral cohomology and
  C2/C3's ordinary Thom, Euler and Leray–Hirsch theory; it compares its
  Borel constructions with those models and retains the standard-character
  sign `u_i=−h_i` against the positive hyperplane class.
- MorseTheory M5 consumes C2.0's bundle disk/sphere cells for its
  negative-disk attachment comparison, and RiemannianGeometry R3 consumes
  the same generic bundle-cell model.
- IndexTheory consumes C1–C7, and its I7.2 consumes C7.1's L₃ for the
  signature theorem in dimension twelve.
- DGFloer, HeegaardFloer and PseudoholomorphicCurveAnalysis consume C2.3
  and C3.2; DerivedModuleAlgebra and TensorProductCombinatorics consume C2–C3;
  HilbertModules consumes C1.2 and C1.6 and Orbifolds C1.2; NilpotentOrbits
  consumes C5.1; PositiveScalarCurvature consumes C1 items 3–4's finite
  faithful unitary representations; SeibergWittenTheory consumes C1–C3,
  C5.2–C5.3 and C6; Yamabe consumes C1; TaubesGromov consumes this
  roadmap's characteristic classes.

## References

- Hatcher, [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), §1.1, p. 16 and §1.2, pp. 22–26, for disk and sphere bundles, clutching and the Gram–Schmidt retraction of GL_n(ℝ) onto O(n), and §3.2, p. 88, for the Thom pair.
- Milnor, *Construction of Universal Bundles, II*, Annals of Mathematics 63 (1956), §§2–3, for the strong-topology join. Cited by locator; no legal open copy.
- Zentner, [*Instanton exercise sheet 2*](https://www.maths.dur.ac.uk/users/raphael.zentner/exercice_sheet_instantons2.pdf), Exercise 2, for the adjoint-bundle formula `p₁(su(E))=c₁(E)²−4c₂(E)`.
- Milnor–Stasheff, *Characteristic Classes*, Annals of Mathematics Studies 76, Princeton 1974, §4, §§9–15, 18–19 and AppendixC, for Thom, Euler, universal classes, the L-genus coefficients and curvature; Theorem15.3 records the integral Pontryagin correction and Lemma18.1 the Thom-space cell structure. Cited by locator; no legal open copy.
- Milnor, *Topology from the Differentiable Viewpoint*, §6, for the index of a vector field and the Poincaré–Hopf sum used in C2.3's worked example.
- Cohen, [*The Topology of Fiber Bundles*](https://math.stanford.edu/~ralph/fiber.pdf), Chapter1 §2.2 and Chapter3 §4.2, for projective tangent bundles and the normal characteristic-class obstruction to immersions.
- Dupont, [*Fibre Bundles and Chern–Weil Theory*](https://data.math.au.dk/publications/ln/2003/imf-ln-2003-69.pdf), §2 and Example4.3 for orthonormal frame bundles, §§9–10 for invariant curvature forms, polarization, connection independence (Theorem 9.5, Lemma 9.6) and classical polynomials, and AppendixA for invariant forms on compact groups.
- Alekseev–Meinrenken, [*Lie theory and the Chern–Weil homomorphism*](https://arxiv.org/abs/math/0308135), §3.1, for the Weil algebra and its basic subcomplex.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Theorem3C.4 for Hopf's theorem, §3.G for the degrees of the simple types and Corollary4D.3 for the integral cohomology of U(n) and SU(n).
- Dupont, [*Curvature and Characteristic Classes*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/dupont2.pdf), §§4–8, especially §8's restriction/fibre-integration proof and Chevalley appendix, for universal Chern–Weil and disconnected groups; Chapter 4, Exercise 3, for the Chern–Simons transgression forms.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Graduate Texts in Mathematics 82, §§6,11–14,20–23, for fibre integration, Thom and projective splitting. Cited by locator; no legal open copy.

- tom Dieck, [*Algebraic Topology*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/diecktop.pdf), §9.5 for arbitrary-space connected-map chain compression, §§13.1–13.3 for countable partition reduction and numerable local-to-global homotopy equivalence, §14.4 for the strong Milnor join and universal bundle comparisons.

- May, [*A Concise Course in Algebraic Topology*](https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/Peter-May-A-Concise-Course-In-Algebraic-Topology.pdf), Chapter16 §§2–3, for the nondegenerate-simplex CW realization and counit weak equivalence via relative simplicial approximation.
