# Roadmap: geometric Satake and fusion over the Fargues–Fontaine curve

**Summary.** Construct the integral geometric Satake equivalence for connected reductive groups `G/E` from bounded bundle
modifications, with its tensor structure, coefficient changes and Weil action. The geometric input is the
Beilinson–Drinfeld Grassmannian over the divisor space of the relative
Fargues–Fontaine curve. Its special fibre supplies projective lattice models
and dimension calculations, using Witt coefficients in mixed characteristic and
power-series coefficients in equal characteristic. Universally locally acyclic, flat perverse sheaves
form the Satake category; convolution gives rigidity, fusion gives its symmetric
tensor structure, and relative Tannaka reconstruction recovers the pinned dual
group. A final comparison identifies normalized Frobenius traces with the
classical spherical Satake transform.

The development has five layers. GS0 constructs loop spaces, Schubert geometry,
Witt bounds and determinant lines. GS1 develops semi-infinite constant terms,
ULA recognition and relative perversity. GS2 constructs the Satake fibre functor,
convolution and duals. GS3 extends exterior products across collision diagonals
and fixes the symmetry sign. GS4 reconstructs and identifies the dual group,
normalizes the Weil action and extends the representation functor to perfect
complexes. Its classical comparison comes after both Satake theorems. The
rational Witt equivalence has its own route through generic reductivity; it does
not depend on the characteristic-two integral rank-one argument.

## Scope and ownership

This roadmap supplies the common construction of local modification spaces,
their flat-perverse ULA Satake categories, weight and fibre functors,
convolution, coherent fusion, relative reconstruction and the pinned dual
equivalence. GS0–GS4 own these foundations together with their coefficient,
finite-set, Weil and Cartan-duality comparisons. Applications use these same
carriers and tensor comparisons. Geometric Hecke actions on bundle-stack
cohomology and Igusa-variety torsion-concentration results belong to their
respective application roadmaps.

The following layers specify the general theories used in these constructions;
the table also identifies the additional general targets owned here. A reference to one of these
layers includes the precise contract stated here and in the relevant result
below; merely having its abstract carrier is insufficient.

| Dependency | Required mathematical interface |
| --- | --- |
| RelativeFarguesFontaine §§0.1–0.10, 3.1–3.9, 4.7–4.13 | Ramified Witt coefficients, integral untilt Cartier divisors, ordered divisor moduli and collision products, completed divisor rings, finite-thickening descent and completed-system algebraization, geometric DVR factors, closed support maps and completion base change. |
| RelativeFarguesFontaine §§6.5–6.10, 6.16, 7.0–7.6 | Beauville–Laszlo gluing, exact tensor comparison and change of legs/groups, punctured Witt-spectrum bundle algebraicity, and effective v-descent and étale-local triviality of reductive torsors on completed divisor rings. Use §3.8 for completed finite projectives. The rank-one constant-position fibre-detection argument is part of GS1 here. |
| ReductiveGroupsPartII §§RG2.0, RG2.0a, RG2.1, RG2.3–RG2.5 | Integral-point topology and lattice preservation over the completed maximal unramified coefficient DVR; Weil restriction; relative Lie weights; integral and parahoric models, Greenberg jets and smooth lifting; affine Weyl, Cartan, Iwasawa and rank-one convolution data; pinned integral dual groups, central maps and finite pinned Weil action. The closed-immersion theorem of Prasad–Yu belongs to RG2.3 with its exact characteristic-two exception. |
| ReductiveGroups, layers 3, 6, 7 and 9 | Components; finite-type characteristic-zero reductivity; integral pinned Chevalley–Demazure groups and classification by based root datum. High-Frobenius reduced images and the subgroup/normalizer calculations in `SL₂` are owned by [rank-one subgroup geometry](#rank-one-subgroup-geometry). Import the existing absolute theory before its relative extensions. |
| AlgebraicVectorBundles, L0A–L0C | Tensor and pullback for module sheaves, finite locally free sheaves and their rank-one identification with `InvertibleSheaf`, and exterior-power determinants. Import these operations; the Witt-resolution descent and positivity arguments are the applications constructed here. |
| SchemeAndStackFoundations §§0.9, 0.24–0.26; §§1.5–1.6, 1.13–1.17; §§4.9, 4.14 | Finite models and direct-colimit perfection; perfectly finitely presented/smooth schemes and Witt schemes; effective quotient presentations, torsors and contracted products; Stein factorization and Hilbert/Quot schemes. General Witt-bundle descent, connected-fibre descent, finite boundary pushouts and Keel positivity used below are targets here, rather than consequences of these scheme carriers. |
| VStackSheavesAndLisseCategories §§VS0–VS1, VS3; DiamondSixOperations §§S2–S6 | Enhanced Artin quotient descent and bounded proper correspondences; ULA and hyperbolic localization with monodromicity and coefficient hypotheses; complete congruence filtrations and ordinary-cohomology continuity; VS1.5 perfect locally constant Drinfeld realization over `Perf_k`, `k=overline(𝔽_q)`, with its Tate character; relative duality and enhanced coefficient comparison. Representable diamond operations alone do not cover quotient-stack maps. |
| EnhancedDerivedSheaves §§E3.1–E3.4, E5:presentability.1–E5:presentability.2 | Coherent composition of pull–push kernels and filtered support extension; the generated Ind t-structure with accessibility and small generators. Pairwise associators in a homotopy category do not give this coherence. |
| EtaleDualityAndPerverseSheaves §§2.1–2.4, 2.7, 2.10, 2.12; §§3.1–3.3; §§5.3, 5.5–5.6 | Perverse hearts, recollement, affine Artin vanishing, intersection complexes and semismall pushforward; ramified adic coefficient reduction; rational purity, geometric semisimplicity and proper decomposition on the stated finite models. The last three results enter only the rational and torsion-bound arguments. |
| This roadmap, GS4, [relative reconstruction](#relative-reconstruction) | Bounded representability, dual finite-piece coalgebras, tensor multiplication, rigidity antipodes, neutral reconstruction, and finite-type/connectedness recognition. These are general mathematical targets here; the pinned known-Hopf comparison is used only after reconstruction. |
| LanglandsParameterStacks §LP3.0 | Induced and Weyl modules, good filtrations and their tensor theorem over fields. The Steinberg-kernel and tilting calculations needed in characteristic two are targets of [integral rank-one identification](#rank-one-integral-identification). The all-prime relative classifying-stack base change and exact-representation completion used by perfect Satake are targets of [the representation-complex interface](#representation-complex-interface). |
| SmoothRepresentationsOfLocalGroups §SR.4 | The spherical Hecke algebra and normalized classical Satake transform, including the unramified nonsplit version. The geometric comparison does not construct this transform. |
| ClassFieldTheory, layer 9 | The local Weil group, its topology, inertia, geometric-Frobenius degree and continuous representation conventions. |
| AdicCoefficientsAndComparisons §§L0–L1, L3; DiamondsAndVStacks §§D3, D6 | Coefficient limits and constructible comparisons, characteristic-p scheme diamonds, étale v-descent and topological comparison. |
| CrystallineCohomology §§CR.1.2, CR.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2, R07.6; AlgebraicVectorBundles §L0C; PadicHodgeTheory §7.1 | Crystal evaluation, Dieudonné modules and deformation theory, finite-projective determinants, and filtered structural-period connections. The comparison of the canonical Demazure tower with chains of p-divisible groups and its Hodge determinant is proved in [canonical determinant models](#canonical-witt-models); it is not supplied by these abstract theories alone. The Witt projectivity proof uses geometric determinant descent. |

The early Grassmannian and finite-loop results are inputs to
`HeckeStacksAndLocalShtukas` and `BunGAndNewtonStrata`. The normalized multileg
and perfect-complex functors feed `ExcursionOperatorsAndSpectralAction` and its
Hecke action. Equal-characteristic global shtukas are a separate construction.
Metaplectic Satake, Zhu's own Gelfand commutativity constraint and the rational
equivalence over arbitrary larger algebraically closed residue fields belong to
`GeometricSatakeAndFusionPartII`. Here the rational Witt comparison uses an
algebraic closure of a finite field and the symmetry transported from fusion.

## Conventions

Let `E` be a nonarchimedean local field with residue field `F_q` of characteristic `p`,
and `G/E` a connected reductive group. Generic divisor spaces are those of the
relative spaces `Y` or `X`; the integral space is `𝒴`. Use a split reductive `O_E`-model
only in results whose hypotheses specify one. Ramified generic groups are
treated by finite splitting-field descent. Integral parahoric statements use
their specified smooth affine models, not an inferred reductive `O_E`-model.
GS3–GS4 use the geometric coefficient-base extension to `Perf_k`,
`k=overline(𝔽_q)`, of these divisor and modification spaces, as specified at the
start of GS3. Finite-field Frobenius traces require the additional descent
structure specified in the classical comparison.

In Witt geometry `p` is prime, `R` is a perfect commutative `𝔽_p`-algebra, and `k` denotes a perfect field of characteristic `p` when a finite-type model is required. The finite rank is `n`; bounds written `(N,0,…,0)` require `n≥1`, `N≥0`, and a jet depth `h>N`. The ramified coefficient versions retain their specified `O_E`-model. The rank-zero lattice test concerns the algebraic lattice carrier and does not extend the notation `(N,0,…,0)` to an empty tuple.

The standing coefficient classes are prime-to-p torsion rings and derived-complete
`ℓ`-adic coefficients, with `ℓ≠p`; an adic assertion includes compatible torsion-level
passage. A claim about rational coefficients explicitly requires a characteristic
zero coefficient field. ULA stalks are perfect complexes. Individual cohomology
modules become finite projective only after the flat-perverse criterion. The
integral Satake category is additive with its flat exact sequences and need not
be abelian.

Write `B_D⁺` for the completed divisor ring and `B_D` for its localization, with
Cartier ideal `I=(ξ)`. Ordered legs give `D=ΣD_i`, including repeated divisors.
Completions factor over distinct geometric supports; each completed DVR factor
is counted once. Collision weights are summed first. In particular, geometric
lengths and relative positions are not multiplied again by the number of
coincident legs. Distinct blocks of an ordered partition must have disjoint
supports, while supports within one block may coincide.

Fix a maximal torus `T` and Borel `B` after splitting. The dominance relation on
coweights is the nonnegative integral **coroot** order within a fixed `π₁(G)`
component. The Schubert dimension is `d_μ=⟨2ρ,μ⟩`. The stabilizer convention uses
the opposite parabolic `P_μ⁻`. The minuscule period-map formula uses the ascending
filtration specified below; reconcile the inverse-cocharacter convention of CS
with the `μ(ξ)` convention of FS. Witt filtrations decrease, and lattice chains
with increasing multiplication kernels are reverse-indexed before comparison.

Perversity is relative to the divisor base. On a geometric collision stratum,
its dimension shift is the sum of `d_μ` over the distinct local factors after
combining their weights. Unnormalized standard, costandard and IC objects use
`Λ[d_μ]`. A half Tate twist is inserted only in the normalized equivalence and
Frobenius comparison, where the open-cell normalization is
`Λ[d_μ](d_μ/2)`. Geometric Frobenius acts on `Λ(1)` by `q⁻¹`. Choose a unit `r` with
`r²=q` to define the half twist; its Frobenius eigenvalue is `r⁻¹`. The Drinfeld
stalk-action/parameter-action conversion must be proved with this orientation
before using the normalized Weil or Levi formulas.

Fusion commutativity includes the component sign `(−1)^{ε(A)ε(B)}`, where
`ε=⟨2ρ,μ⟩` mod 2. Apply it separately to the canonical even and odd summands.
Total cohomology then has the ordinary ungraded symmetric tensor structure.
The internal Satake dual is `sw*D`, with sw inversion of the modification and `D`
relative Verdier duality. Component grading uses the split diagonalizable group
with character group `π₁(G)`, which may have torsion and therefore need not be a
torus.

For perfect schemes, coordinate-ring perfection is the direct Frobenius colimit.
Mathlib's inverse-limit `Perfection` does not express this construction. Fix
finite-type models and the relevant Frobenius power when defining top-cycle
traces. A model-independent scalar trace cannot discard the p-power degree of
Frobenius. Finite-model Frobenius descent is additional data for the classical
trace bridge; a geometric ULA object alone does not define its arithmetic trace.

The short names below label mathematical targets in `TauCeti.GeometricSatake`.
The associated [Suggested.lean](Suggested.lean) states `neutralTannakaReconstruction`
from GS4 on the pinned module and comodule categories. The geometric targets,
including the Satake equivalences, require the Grassmannians, Hecke v-stacks and
sheaf categories specified here; their signatures require those constructions.
Other short names specify the mathematical interfaces to be constructed.

## Exact supplier contracts

Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations are prerequisites, with their actual scope. Their existence does not assert geometric representability, a Satake equivalence or enhanced coherence.

| Declaration | Supplied scope |
| --- | --- |
| `WittVector` | The type of p-typical Witt vectors, indexed by a natural p. Its ring laws and perfect-ring properties are reused; ramified Witt coefficient comparison is RelativeFarguesFontaine §§0.9–0.10, not a new definition here. |
| `PerfectRing` | PerfectRing `R p` asserts bijectivity of the p-th power map on a type with powers; it does not itself assert that `p` is prime or that `R` has characteristic p. The Witt geometric applications separately require a commutative ring, Fact p.Prime and CharP `R p`, giving a perfect `F_p`-algebra. This is the algebraic hypothesis carrier, not a representability result. |
| `AlgebraicGeometry.Scheme` | The ordinary scheme carrier and category. The projective perfection models are constructed in GS0; the scheme carrier alone supplies no representability theorem. |
| `AlgebraicGeometry.IsProper` | Properness of a morphism of schemes. The representing object is a proper perfectly finitely presented scheme, and the fibral descent criterion is for proper maps. |
| `ValuationRing` | Valuation rings. The proof of the fibral descent criterion reduces to a base whose connected components are spectra of valuation rings. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | Invertible sheaves on an ordinary scheme, including the Witt-bound and Demazure determinant lines after those schemes are constructed. This carrier supplies neither ampleness nor the adic Cartier-divisor line `I_S^m/I_S^{m+1}`; the latter belongs to RelativeFarguesFontaine §§4.11, 6.5–6.10. |
| `CoxeterSystem` | Abstract Coxeter-system combinatorics only. Affine root data, `Cartan/Iwasawa` decomposition and parahoric geometry require RG2.4. |
| `TauCeti.TitsSystem.bruhatCell` | Bruhat cells of a Tits system. Tau Ceti already has the Bruhat decomposition, which is the combinatorial shadow of the Schubert stratification this layer builds geometrically. |
| `RootPairing` | The abstract paired roots/coroots and their module dualities, not a built split reductive group, Lie-weight decomposition or affine Cartan theorem. |
| `TauCeti.ReductiveAffineGroupSchemeCat` | Reductive affine group schemes over a field `k`. This does not provide an integral `O_E`-model or parahoric group scheme; RG2.3 supplies those integral models. |
| `CategoryTheory.Triangulated.TStructure` | t-structures on a triangulated category, already in the pinned library with IsLE and IsGE. The relative perverse t-structure of GS1 is one of these, so the abstract notion is cited and only its normalisation is specified. |
| `CategoryTheory.Triangulated.TStructure.Heart` | The Heart typeclass identifies a heart with a full subcategory of a pretriangulated category; TStructure.heart is the underlying object property. No generic abelian-heart theorem is claimed. |
| `CategoryTheory.Pretriangulated` | Pretriangulated categories, the level at which the t-structure and the recollement of the Schubert stratification are stated. |
| `DerivedCategory` | The Verdier-localization carrier for the derived category of an abelian category, not the stable enhanced sheaf categories or six-operation coherence; EDS owns those extensions. |
| `CategoryTheory.Sheaf` | Sheaves valued in a category on a Grothendieck site; the diamond/v-site topology and geometric representability are not provided by this carrier. |
| `CategoryTheory.GrothendieckTopology` | Abstract Grothendieck topologies; actual v/h/étale topologies and their descent properties are supplier work. |
| `CategoryTheory.MonoidalCategory` | Monoidal categories, the structure convolution puts on the bounded sheaf category and on the Satake category. |
| `CategoryTheory.LeftRigidCategory` | Left duals only. The conclusion that all Satake objects have both duals uses the separate RigidCategory carrier. |
| `CategoryTheory.Equivalence` | Equivalences of categories, the form of the special-fibre comparison of the ULA categories over Spd `O_C`, Spd `C` and Spd `k`. |
| `CategoryTheory.Comma` | Comma categories, the pinned form of the slice and correspondence categories over which the convolution 2-category is indexed. |
| `Module.Flat` | Flatness. Flat perversity is half the definition of the Satake category, and it is what excludes the Tor obstruction to t-exactness of convolution. |
| `Module.Projective` | Projective modules: finite projective terms of a strict perfect complex, flat-perverse torus fibres in degree zero, total Satake cohomology and lattice graded pieces. ULA alone requires perfect stalk complexes and does not make each cohomology module projective. |
| `Module.Free` | Free modules. The lattice computation in the `GL_n` case of the open-cell stabilizer chooses a compatible basis, which is a freeness statement after localisation. |
| `CategoryTheory.RigidCategory` | Both left and right rigid structures. LeftRigidCategory alone cannot state VI.8.2. |
| `CategoryTheory.ActionCategory` | The category of elements of a monoid action, with Groupoid for group actions. This is the local quotient presentation, not stackification. |
| `Action` | Objects with a monoid homomorphism into their endomorphisms; morphisms intertwine the action. Only the discrete equivariant-object core. |
| `CategoryTheory.ObjectProperty.FullSubcategory` | Full subcategories with the existing fully faithful inclusion; their object property must be stated mathematically. |
| `Module.Finite` | Finitely generated modules; paired with Module.Projective for lattice and fibre-functor finiteness. |
| `Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` | Flatness characterized by injectivity preservation of linear maps after tensor; the smallness universe condition is part of the source statement. |
| `PadicInt` | The subtype of p-adic numbers with norm `≤1`, with the existing commutative ring structure for prime p. Its `ℤ_p`-algebra structure explicitly states the coefficient hypothesis of the uniform `ℓ`-power torsion bound. |
| `TauCeti.Tannaka.tensorAutFunctor` | For a given bialgebra `H` (a semiring) over a commutative ring `R`, tensor automorphisms of scalar extension on finitely generated `H-comodules`. Commutativity of `H` is not required here. Does not construct `H` from an arbitrary tensor category. |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | Over a field `k` and a given commutative Hopf algebra `H`, identifies its points functor with the tensor automorphisms of scalar extension. This is a comparison after reconstruction, not the relative integral existence theorem. |
| `TauCeti.Tannaka.reconstructedPoint` | Over a field `k`, for a given commutative Hopf algebra `H` and commutative k-algebra A, maps a tensor automorphism of scalar extension on finitely generated `H-comodules` to WithConv (H `→ₐ[k]` A). This assumes `H` rather than reconstructing it. |
| `HopfAlgebra` | An antipode on a bialgebra satisfying the two convolution inverse identities; commutativity is an additional algebra hypothesis. |
| `Bialgebra` | Compatible algebra and coalgebra structures on a semiring/module; the underlying coordinate algebra, not the representing object `F(L1)` before dualization. |
| `TauCeti.AffineGroupSchemeCat` | Affine group objects over Spec of a commutative ring; usable for the integral reconstructed group. |
| `CategoryTheory.BraidedCategory` | Natural braiding isomorphisms satisfying both hexagon identities. |
| `CategoryTheory.SymmetricCategory` | A braided category with double braiding equal to the identity. |
| `CategoryTheory.Functor.Braided` | A monoidal functor compatible with the specified braidings; applies to the modified fusion symmetry. |
| `CategoryTheory.Functor.Monoidal` | Compatible lax and oplax monoidal structures with inverse tensor and unit constraints. |
| `CategoryTheory.Adjunction` | Unit and counit with triangle identities; used for bounded left adjoints of the fibre functor. |
| `Representation` | A monoid homomorphism to linear endomorphisms. Continuity of the Weil action and finite projectivity are extra conditions, not supplied by this abbreviation. |
| `CategoryTheory.Monad.HasCoequalizerOfIsSplitPair` | For every `F`-split parallel pair, its coequalizer exists in the source category. |
| `CategoryTheory.Monad.PreservesColimitOfIsSplitPair` | `F` preserves coequalizers of every `F`-split parallel pair. |
| `CategoryTheory.Monad.ReflectsColimitOfIsSplitPair` | `F` reflects coequalizers of every `F`-split parallel pair. |
| `CategoryTheory.Limits.HasColimit` | Existence of a colimit cocone; colimit chooses its object. Gives the underlying module only, not a Hopf structure. |
| `TauCeti.reductiveAffineGroupSchemeProperty` | Object property on finite-type affine group schemes over a field, transported from the reductive coordinate Hopf-algebra property. |

The following elementary presentations are supplied by the libraries and are used without new aliases: affine evaluation and transport are `CategoryTheory.Functor.obj` and `CategoryTheory.Functor.map` and `CategoryTheory.Functor.map_comp`; right cosets and their equality criterion are `QuotientGroup.leftRel` and `QuotientGroup.eq`; finite unions use `Set.union` and the existing indexed-union notation; filtration pieces and lattice inclusions use `Submodule` and `Subtype.val`; discrete equivariant objects are `Action`, with `Action.forget` and `Action.trivial`. Their use on a divisor site, smooth quotient or geometric sheaf category requires the separately stated geometric targets below.

For coefficient flatness, use `Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` with its smallness hypotheses. For perverse hearts use `CategoryTheory.Triangulated.TStructure.heart`. Neither is restated as a new abstract theorem. The point-torus and geometric relative-perverse comparisons below identify their actual applications.

InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 supplies the finite/rational constructible Grothendieck–Lefschetz trace formula on separated finite-type finite-field schemes, with specified Frobenius descent, compact support and geometric Frobenius. Combine it with EtaleCohomologyFoundations §F.10.3 (`PerfectComplex.lefschetzNumber`, `PerfectComplex.filteredTraceAdditivity`) for perfect-complex traces, shift signs and additivity, and §F.10.2b (`VanishingCycles.frobeniusCohomology`) for scheme/descent Frobenius comparison through adic realization. SchemeAndStackFoundations §§0.24–0.26 supplies fixed finite models of perfections. Apply these results on bounded special-fibre models; no trace formula for an arbitrary diamond is assumed.

<a id="supplier-calculus"></a>

The following abbreviations denote the full lists of supplier results:

| Calculus | Prerequisites |
| --- | --- |
| smooth diamond calculus | DiamondSixOperations §S4.2; DiamondSixOperations §S4.4; DiamondSixOperations §S4.4; DiamondSixOperations §S4.4; DiamondSixOperations §S5.2 |
| dual six-operation calculus | DiamondSixOperations §S3.1; DiamondSixOperations §S3.4; DiamondSixOperations §S3.2 |
| proper pushforward calculus | DiamondSixOperations §§S2.2–S2.3; DiamondSixOperations §S2.4 |

## How to read the build

GS0 constructs loop/modification moduli and finite Schubert bounds, then Witt resolutions, determinant descent and projectivity. Complete the Witt flag construction before comparing affine flags over the integral untilt base. Build `wittFiltration` before `zhuBoundPresentation`. Build `rationalWeightsFinite` before `mvCycleDimension` and the equidimensionality assertions for semi-infinite intersections; the affine-intersection construction precedes concentration. Construct finite admissible unions in GS0, and complete their local-model special-fibre identification and functoriality after GS4 generic Satake, using the nearby-cycle construction specified with that target. GS1 uses these spaces for semicontinuity, hyperbolic localization, ULA recognition and relative perversity. GS2 proves convolution closure and rigidity before GS3 constructs corrected symmetric fusion. GS4 supplies relative reconstruction, identifies the generic and integral dual groups, normalizes the Weil action and extends to perfect representation complexes. Classical trace comparison follows both Satake equivalences and the independent spherical transform.

## Layer GS0: modification spaces and Schubert geometry

### Loop quotients and ordered divisors

Begin with completed rings and effective torsor descent. The Hecke quotient retains automorphism groups, whereas a punctured trivialization removes them in the Grassmannian. Ordered legs control both product factorization and collision bounds.

<a id="loop-groups-and-local-hecke"></a>

**Positive and full loop spaces** (`positiveLoopSpace`). For an affine `O_E`-scheme `Z` and a divisor `D` in `Div^d_𝒴`, `L⁺Z(S)=Z(B⁺_D(S))` and `LZ(S)=Z(B_D(S))` are v-sheaves over `Div^d_𝒴`. The generic `E`-scheme version is defined over `Div^d_Y` or `Div^d_X`. For `X` use the basis of affinoid `S` for which `D_S` is affinoid. For a group scheme these are group v-sheaves, with the natural inclusion `L⁺G→LG`.

`Z` affine; `d≥1`; integral `G` is a split reductive `O_E`-model; generic `G/E` can be ramified.

Use RelativeFarguesFontaine §§3.7–3.8 and 7.6 for completed rings, functoriality and effective v-descent.

Provide the following API.

- `positiveLoopSpace_eval`: Identify the geometric loop sheaf evaluated on a perfectoid test space with the affine functor at its completed divisor ring; full loops use its localization.
- `positiveLoopSpace_map`: A ring map induces the map `F(f)`; identity and composition agree with those in the affine functor.
- `positiveLoopSpace_baseChange`: The loop sheaves and their inclusion commute with divisor-base pullback; on completed rings the naturality identities use the supplied functor composition law.

**Checks.**

- For `G_m` the evaluation at A agrees with the unit group of A.
- The trivial affine group has one loop at every ring.
- For the affine line the positive loops are the completed divisor ring, while the full loops are its localization; a negative power of a Cartier equation belongs only to the latter at a nonempty geometric divisor.

([FS](#source-fs), VI.1.5, p. 192.)

*Needs:* RelativeFarguesFontaine §3.8; RelativeFarguesFontaine §§3.7–3.8, 7.6; RelativeFarguesFontaine §3.5; ReductiveGroupsPartII RG2.3; AdicCoefficientsAndComparisons L1, `char-p-scheme-diamond-and-comparison-functor`; DiamondsAndVStacks D6, `pre-adic-topological-comparison`.

<a id="local-hecke-stack"></a>

**Local Hecke stack** (`localHeckeAction`). `Hck_G(S)` is the groupoid of two `G-torsors` on Spec `B⁺_D(S)`, together with an isomorphism of their `B_D-restrictions`. It is a small v-stack; its étale-stack presentation is `[L⁺G\LG/L⁺G]`.

The same divisor basis and group-model conditions as loop spaces.

Use RelativeFarguesFontaine §3.7 finite-thickening descent together with RelativeFarguesFontaine §3.8 effective descent/algebraization of compatible completed finite-projective modules (uniform rank and continuity), then transfer through the faithful exact tensor description to `G-torsors`. The completed-ring conclusion is not supplied by RelativeFarguesFontaine §3.7 finite-thickening descent alone. Trivialize torsors étale-locally using the geometric DVR and smooth finite-level lifting/spreading. Changes of the two trivializations give the double quotient; keep automorphisms, rather than taking only isomorphism classes.

Provide the following API.

- `localHeckeAction_formula`: The double action is `(h₁,h₂)·g=h₁gh₂⁻¹`, and the quotient is an action groupoid.
- `localHeckeStack_presentation`: Stackify the double-action groupoid to obtain the étale-stack presentation of the torsor-modification stack. Its discrete groupoid carrier is supplied by Mathlib.
- `localHeckeAction_unit_stabilizer`: The automorphism labels of the identity are exactly pairs (h,h), retaining the diagonal positive-loop group.

**Checks.**

- For the trivial group there is one modification and one automorphism.
- In Multiplicative `ℤ`, the nonidentity diagonal label (1,1) fixes the identity modification; an orbit set loses it.
- For `G=H`, (h,1) sends the identity to `h`, whereas (1,h) sends it to `h` inverse.


([FS](#source-fs), VI.1.6–VI.1.7, p. 193.)

*Needs:* [Loop spaces](#loop-groups-and-local-hecke); RelativeFarguesFontaine §§3.7–3.8, 7.6; RelativeFarguesFontaine §4.12; RelativeFarguesFontaine §§7.0–7.6; ReductiveGroupsPartII RG2.3; `CategoryTheory.ActionCategory`; RelativeFarguesFontaine §§4.7–4.13.

<a id="grassmannian"></a>

**Beilinson–Drinfeld Grassmannian** (`bdGrassmannian`). `Gr_G(S)` classifies a `G-torsor` on Spec `B⁺_D(S)` with a `B_D-trivialization`. It is a small v-sheaf and the étale sheafification of `LG/L⁺G`. Its map to `Hck_G` fixes the second torsor as trivial.

Integral and generic group and divisor conventions as above.

Use the same effective torsor descent as `Hck_G`.

Provide the following API.

- `bdGrassmannian_trivialized`: The étale quotient presentation agrees with the torsor-and-punctured-trivialization moduli, using the supplied right-coset carrier without a normality assumption.
- `bdGrassmannian_loop`: Every full loop defines a trivialized modification, naturally in the perfectoid base.
- `bdGrassmannian_quotient`: Two local full-loop representatives agree exactly when their quotient lies in the positive loop group, with étale descent of this equality.
- `bdGrassmannian_unit`: The identity loop gives the zero-modification section, compatible with divisor base change.

**Checks.**

- On a one-leg geometric fibre, the split `G_m` Grassmannian is discrete with components indexed by `ℤ`.
- The generic `GL₂` bound `(1,0)` is the projective-line diamond; its Witt special fibre is the perfected projective line.
- A punctured trivialization forces every automorphism of the unit modification to be the identity; the corresponding object of Hck has diagonal positive-loop inertia.

([FS](#source-fs), VI.1.8–VI.1.9, pp. 193–194; VI.2.2–VI.2.3 and VI.2.6, pp. 196–200; [SW](#source-sw), 21.1.3, pp. 191–192.)

*Needs:* [Local Hecke stack](#local-hecke-stack); RelativeFarguesFontaine §§7.0–7.6; AdicCoefficientsAndComparisons L1, `char-p-scheme-diamond-and-comparison-functor`; DiamondsAndVStacks D6, `pre-adic-topological-comparison`.

<a id="generic-grassmannian-closed-immersion"></a>

**Generic change of group and closed immersions** (`grassmannianClosedImmersion`). For a homomorphism `G→H` of connected reductive `E`-groups, extension of structure group defines the map of generic `B⁺_dR` Grassmannians over the divisor base. Construct its identity, composition and divisor-base-pullback comparisons. If `G→H` is a closed immersion, this map is a closed immersion, including its restriction to each bounded support. No splitness hypothesis is imposed.

Use the affine quotient `H/G` and the closed condition that its punctured section extends over the completed divisor ring. Prove the statement after a geometric splitting extension and descend the closed immersion. This supplies the Grassmannian contract of RelativeFarguesFontaine §7.4; its gluing/change-of-group comparison is the input on torsors.

**Checks.**

- The identity homomorphism gives the identity closed immersion.
- The trivial subgroup gives the closed unit section in `Gr_H`.
- The norm-one torus of a separable quadratic extension embeds in `SL₂` through its regular representation; the resulting Grassmannian map is closed before splitting the torus.

([SW](#source-sw), Lemma 19.1.5, printed p. 171; its proof over a geometric base and descent give the stated `E`-group version.)

*Needs:* [Beilinson–Drinfeld Grassmannian](#grassmannian); RelativeFarguesFontaine §7.4; ReductiveGroups Layer 3; DiamondsAndVStacks D6.

<a id="ordered-leg-base-change"></a>

**Ordered legs and divisor base change** (`orderedLegCollision`). For finite `I`, pull back `Gr_G` and `Hck_G` along `(Div¹_𝒴)^I→Div^{|I|}_𝒴` given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.

Split integral model; restrict to generic `Y/X` for a general `G/E`.
Products are relative to the specified coefficient base. For `I=∅`, use the
unit modification over that base. In GS3–GS4 first pull these spaces to
`Perf_k`, `k=overline(𝔽_q)`; their empty product is then `Spd k`.

Import divisor addition, disjointness and completion base change from RelativeFarguesFontaine §§3.4–3.9.

Provide `orderedLegCollision_baseChange`, `orderedLegCollision_disjointProduct` and `orderedLegCollision_collisionBound`: respectively naturality of the pulled-back moduli, factorization over cross-block disjoint supports, and the sum of cocharacters on each collision block. The intended functor is the fibre product of the modification moduli with the ordered divisor addition map, including repeated divisors.

**Checks.**

- A single leg recovers the original degree-one Grassmannian and unit section.
- Two distinct degree-one divisors give the product of their completed-ring modification functors, with two independent lattice factors.
- Two equal `G_m` legs of weights `a,b` give a single local lattice of weight `a+b`, with Cartier multiplicity retained in the ring and no extra multiplication of that weight.
- With no legs, the unit modification is over `Spd 𝔽_q` before coefficient-base extension and over `Spd k` after it; the empty product retains its base.

([FS](#source-fs), VI.2.6 and preceding discussion, pp. 199–200.)

*Needs:* [Beilinson–Drinfeld Grassmannian](#grassmannian); RelativeFarguesFontaine §3.9; RelativeFarguesFontaine §4.13.

### Generic bounds and integral affine flags

Generic properness is established before special-fibre projectivity. Affine flags over Spd `O_C` also use the Witt parahoric construction in the next part of GS0; complete that construction before proving the flag comparison.

<a id="schubert-bounds-and-properness"></a>

**Generic Schubert bounds** (`dominanceBound`). After a splitting extension and choices `T⊂B⊂G`, define `Gr_{≤μ}` by geometric rank-one points whose Cartan coweight is `≤μ`; `Gr_μ` has exact relative position `μ`. Over generic `Div^d_Y` and `Div^d_X` the bounded inclusions are closed and the projections proper and representable in spatial diamonds. Their filtered union in each `π₁(G)-component` is Gr. Bounds for a tuple of legs sum at collisions.

`μ` dominant; `μ−λ` is a sum of positive coroots with the same `π₁-class`. General `G/E` descends its Galois-stable orbit of bounds.

Import Cartan decomposition and its functorial descent from RG2.4.

Provide the following API.

- `dominanceBound_iff`: For `GL_n`, dominance means equal total degree and every initial partial sum of `ν` at most the corresponding sum of `μ`.
- `dominanceBound_refl`: Every dominant cocharacter lies in its own bound.
- `dominanceBound_trans`: Bounds are nested by transitivity of the dominance relation.
- `dominanceBound_iff_simpleCoroots`: For arbitrary integer tuples of length `n+1`, the partial-sum relation holds exactly when `μ−ν=Σ_i c_i(e_i−e_{i+1})` with `c_i∈ℕ`. This also identifies the coroot order used in the general reductive-group bounds; it is not a replacement of those bounds by a `GL_n-only` target.

**Checks.**

- For a torus of rank one the bound is equality, not the usual integer order.
- `GL₂` coweight (1,1) is below (2,0).
- The cocharacter (1,0) is not below (2,0), despite its smaller partial sums.

([FS](#source-fs), VI.2.2–VI.2.3, pp. 196–197.)

*Needs:* [Beilinson–Drinfeld Grassmannian](#grassmannian); ReductiveGroupsPartII RG2.4; [proper pushforward calculus](#supplier-calculus); DiamondSixOperations §S2.4; DiamondsAndVStacks D6, `pre-adic-diamondification`; AdicCoefficientsAndComparisons L1, `char-p-scheme-diamond-and-comparison-functor`; DiamondsAndVStacks D6, `pre-adic-topological-comparison`.

<a id="generic-galois-descent"></a>

**Galois descent of bounded modifications** (`genericGaloisDescent`). For finite Galois E′/E splitting `G`, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell `Gr_{μ̄}` and bound `Gr_{≤μ̄}`; this asserts no reductive `O_E`-model for a ramified `G`.

Generic divisors on `Y` or `X`; `μ̄` a finite Galois orbit.

Import finite étale/v-descent of affine group data.

([FS](#source-fs), VI.2 opening and VI.8 final paragraphs, pp. 196, 226.)

*Needs:* [Generic Schubert bounds](#schubert-bounds-and-properness); ReductiveGroupsPartII RG2.3; [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5.

<a id="affine-flag-demazure"></a>

**Affine flags and Demazure spaces over Spd `O_C**` (`demazureChains`). For split `G` and an Iwahori model `𝓘⊂G`, `Fl_G=LG/L⁺𝓘` over Spd `O_C`. Its projection to Gr has v-locally fibre `(G/B)^⋄` and is proper and cohomologically smooth. For `w=s₁⋯s_rω` reduced in the extended affine Weyl group, the Demazure space is the contracted product of the minimal parahorics divided by `L⁺𝓘`, followed by `ω`. It is an iterated `(P¹)^⋄`-bundle, proper over the bound, and isomorphic over the open w-cell.

Parahoric models and affine Weyl group from RG2.3–RG2.4.

Construct torsor quotients and their changes of trivialization.

Provide the following API.

- `demazureChains_points`: The point core consists of chains `x₀,…,x_r` anchored at the standard flag `x₀`, with each consecutive pair in the specified simple-step relation. Retain the final length-zero factor `ω` and its chosen loop representative.
- `demazureChains_endpoint`: The endpoint is `p₁⋯p_rω`, obtained by multiplying the simple-step representatives and then the length-zero factor; in flag coordinates it is `x_rω`.
- `demazureChains_base_change`: Base change carries the standard flag, simple-step relations and final factor `ω` to their pullbacks, and commutes with this endpoint map.

**Checks.**

- With no simple-reflection steps the Demazure space is the base and its endpoint is `ω`; the initial and final flags coincide when `ω=1`.
- For `w=sω` the space is `L⁺P_s/L⁺𝓘≅(ℙ¹)^⋄`, with endpoint `pω`, rather than the unanchored incidence space of two variable flags.
- For `G_m` and `ω=t¹` there are no simple-reflection steps, but the endpoint has weight one rather than zero.

([FS](#source-fs), VI.5.1–VI.5.7, pp. 209–211.)

*Needs:* [Beilinson–Drinfeld Grassmannian](#grassmannian); ReductiveGroupsPartII RG2.3; ReductiveGroupsPartII RG2.4; [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5; [Witt affine flags and components](#parahoric-ind-projectivity).

### Divisor mapping spaces and finite loop charts

The separated étale lift lemma transfers étale coordinates on a smooth scheme to its divisor mapping space. Congruence quotients then give finite-dimensional charts; a finite quotient is distinct from its congruence kernel.

<a id="etale-over-divisor"></a>

**Separated étale lifts over an effective divisor** (`etaleOverDivisor`). Let `S` be a perfectoid space over `F_q` with a map `S→Div^d_𝒴` and associated Cartier divisor `D_S⊂𝒴_S`. For any separated étale map of adic spaces `D′→D_S`, the functor on perfectoid `T→S` sending `T` to `Hom_{D_S}(D_T,D′)` is represented by a perfectoid space S′ with a separated étale map `S′→S`. The representing bijections `Hom_S(T,S′)≃Hom_{D_S}(D_T,D′)` are natural in `T`.

`E` is a nonarchimedean local field with residue `F_q`; the integral divisor base is `Div^d_𝒴`, so untilts over `O_E` including special-characteristic legs are allowed. `D_T` is the pullback effective Cartier divisor on `𝒴_T`. The degree `d` is finite; repeated legs retain their Cartier multiplicities. The map `D′→D_S` is separated étale. No reductive group, coefficient ring or `ℓ≠p` hypothesis is needed.

Use v-descent for separated étale perfectoid spaces to reduce `S` to a strictly totally disconnected cover (DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks; FS cites Sch17a Proposition 9.7). Exhaust D′ by increasing quasicompact opens and work with one such open. On each geometric fibre, `D_S` up to nilpotents is the finite disjoint union of its distinct geometric `O_E-untilt` supports. A separated étale D′ over this fibre is a disjoint union of open subspaces. Spread these fibrewise descriptions to a neighbourhood, using the étale local structure theorem and the étale-site comparison (FS cites Sch17a Proposition 11.23 and Lemma 15.6), and glue the resulting local representing spaces. For the reduced case `D′⊂D_S` open, the representing locus is the complement of the image of `|D_S|\|D′|` under `|D_S|→|S|`. This is open because that support map is closed. Its inclusion into `S` represents exactly the lift functor. Descent and gluing give the separated étale `S′→S` and the natural universal property. Uniqueness follows from Yoneda.

**Checks.** For `D′=D_S`, the represented functor is final over `S` and `S′≃S`. For d>0 and D′ empty, every geometric fibre has a nonempty divisor, so the represented functor is empty and S′ is empty; for `d=0`, `D_T` is empty and `S′≃S`. Over a geometric base with `r` distinct support points, D′ a disjoint union of `n` labelled copies of `D_S` has `n^r` lifts; coincident legs do not create additional choices.

([FS](#source-fs), Lemma VI.1.13 and proof, printed/PDF p. 196.)

*Needs:* RelativeFarguesFontaine §§0.18–0.20, 3.1–3.2; RelativeFarguesFontaine §3.4; RelativeFarguesFontaine §3.5; RelativeFarguesFontaine §§4.7–4.13; DiamondsAndVStacks D1, `strictly-totally-disconnected`; DiamondsAndVStacks D3, `etale-and-finite-etale-are-v-stacks`; DiamondsAndVStacks D5, `local-structure-of-etale-maps`; DiamondsAndVStacks D6, `etale-site-comparison`; RelativeFarguesFontaine §§3.1–3.9.

<a id="smooth-scheme-loops"></a>

**Smooth scheme loops over a divisor** (`smoothSchemeLoopDimension`). For a smooth quasiprojective `Z→O_E` of relative dimension `n`, the functor of maps `D_S→Z` is representable in locally spatial diamonds, partially proper and `ℓ`-cohomologically smooth of dimension dn over `Div^d_𝒴`. Separated étale maps `Z′→Z` give representable separated étale maps `T_{Z′}→T_Z`; open immersions give open immersions.

`D_S` affinoid on the chosen basis; `ℓ≠p`.

For affine space, pull back to the ordered-leg cover and filter the map by `d` successive affine-space diamonds of the corresponding untilts; each layer has dimension `n`.

([FS](#source-fs), VI.1.12–VI.1.13, pp. 195–196.)

*Needs:* RelativeFarguesFontaine §3.8; RelativeFarguesFontaine §4.12; [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5; ReductiveGroupsPartII RG2.3; [Separated étale lifts over an effective divisor](#etale-over-divisor); RelativeFarguesFontaine §§4.7–4.13.

<a id="congruence-filtration-and-graded-pieces"></a>

**Congruence filtration of positive loops** (`congruenceFiltration`). `L⁺_mG=ker(L⁺G→G(B⁺/I^m))`, `m≥1`, has successive quotients `Lie(G)⊗_{O_E}I^m/I^{m+1}`. For degree `d` these are vector-group diamonds of `ℓ`-dimension d·dim `G`. The reduction `L⁺G/L⁺_1G` is the functor of maps `D_S→G`; in degree one it is `G^⋄`. The geometry assertion is for the finite quotients and graded pieces, not for the entire inverse-limit group with a finite dimension.

`G` split reductive `O_E`-model; `ℓ≠p`; `I` is the ideal of the degree-d divisor.

Linearize the group law modulo successive powers of `I` using smoothness of `G`.

Provide `congruenceFiltration_reduction`, `congruenceFiltration_successiveQuotient` and `congruenceFiltration_complete`: the finite quotient map and kernel, the Lie-weight linearization with its additive law, and recovery of positive loops as the compatible inverse system. The intended filtration is by closed normal group v-sheaves over the actual divisor base.

**Checks.**

- For `G_m`, `1+ξ^m a` has graded coordinate `a mod ξ`, and multiplication of two such representatives adds the coordinates.
- For a divisor of degree `d` and the additive group, the graded quotient has cohomological dimension `d`; a single untilt affine line has dimension one.
- The level-one kernel maps to the identity under reduction, whereas the quotient is the whole group of points on the divisor; interchanging the two gives the wrong identity fibre.

([FS](#source-fs), VI.1.10–VI.1.11, pp. 194–195.)

*Needs:* [Loop spaces](#loop-groups-and-local-hecke); RelativeFarguesFontaine §3.8; RelativeFarguesFontaine §4.11; ReductiveGroupsPartII RG2.1; [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5.

<a id="truncated-positive-loops"></a>

**Truncated positive loop groups** (`truncatedPositiveLoop`). For `m≥1`, `L^{+,<m}G(S)=G(B⁺_D(S)/I^m)` is the finite congruence quotient of `L⁺G` as a v-sheaf. Reduction has smooth vector-group kernels `Lie(G)⊗I^j/I^{j+1}`, `1≤j<m`. These quotients provide finite-dimensional group actions on bounded Hecke loci.

Split smooth integral model; degree-d divisor; `ℓ≠p`.

Use smooth lifting across nilpotent thickenings to identify the quotient, not only its naive pointwise image.

Provide the following API.

- `truncatedPositiveLoop_eval`: The finite loop quotient evaluates `F` on the ring `A/I^m`, rather than the subgroup `ker(F(A)→F(A/I^m))`.
- `truncatedPositiveLoop_reduction`: Reduction of a positive loop gives a point in the m-th quotient; smoothness makes this locally surjective.
- `truncatedPositiveLoop_transition`: For `a≤b`, reduction modulo `I^b` maps to reduction modulo `I^a`.

**Checks.**

- At `m=1` the quotient is G(A/I), not the congruence kernel.
- Every finite quotient of the trivial group is trivial.
- For the additive group over a one-leg DVR, level `m=2` is the additive group of `B⁺/(ξ²)` and the class of `ξ` is nonzero; replacing it by level one or by the congruence kernel loses this class.

([FS](#source-fs), VI.1.10–VI.1.11, pp. 194–195; VI.2.8, p. 201, for the later bounded-action application.)

*Needs:* [Congruence filtration of positive loops](#congruence-filtration-and-graded-pieces); ReductiveGroupsPartII RG2.3; [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5.

### Open cells, action truncation and minuscule flags

Compute stabilizers with the opposite-parabolic convention and derive dimensions from positive Lie weights. This geometry precedes all perverse or decomposition arguments.

<a id="open-cell-stabilizer-and-smoothness"></a>

**Open Schubert cell smoothness** (`schubertCellDimension`). `Gr_{G,μ}` is `ℓ`-cohomologically smooth of dimension `⟨2ρ,μ⟩` over the degree-one divisor base. Its stabilizer in `L⁺G` reduces to `P⁻_μ` (weights `≤0)`; the m-th graded piece consists of Lie weights `≤m`. The quotient maps to `(G/P⁻_μ)^⋄` with successive positive-loop unipotent fibres. Galois-orbit cells descend over the generic base.

`G` split for the computation; `μ` dominant; `ℓ≠p`. Integral statement requires the reductive model.

Compute `L⁺G∩μ(ξ)L⁺Gμ(ξ)⁻¹` in a faithful representation; in `GL_n`, the upper entry `A_ij` is divisible by `ξ^{k_i−k_j}`.

([FS](#source-fs), VI.2.4–VI.2.5, pp. 198–200; IV.1.18, p. 112.)

*Needs:* [Congruence filtration of positive loops](#congruence-filtration-and-graded-pieces); [Truncated positive loop groups](#truncated-positive-loops); [Galois descent of bounded modifications](#generic-galois-descent); ReductiveGroupsPartII RG2.1; [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5; RelativeFarguesFontaine §§3.8, 6.5–6.10.

<a id="truncation-of-the-loop-action"></a>

**Finite truncation of bounded actions** (`boundedLoopActionTrivial`). If m>0 is at least every weight of `μ` on Lie `G`, then `L⁺_mG` acts trivially on `Gr_{≤μ}`. For ordered legs use the corresponding bound for the sum at each collision. Thus the action factors through `L^{+,<m}G`. The comparison of equivariant derived categories is the later GS1/prounipotent-equivariance theorem, with its filtered continuity and prime-to-p coefficient hypotheses.

Split `G`; dominant `μ`; finite Schubert bound.

Use normality of the congruence kernel and the stabilizer weight calculation on the open orbit.

([FS](#source-fs), VI.2.8, p. 201.)

*Needs:* [Open Schubert cell smoothness](#open-cell-stabilizer-and-smoothness); [Truncated positive loop groups](#truncated-positive-loops); ReductiveGroupsPartII RG2.1.

<a id="minuscule-bialynicki-birula"></a>

**Minuscule Bialynicki–Birula isomorphism** (`minusculeBialynickiBirula`). If `μ` has Lie weights in {−1,0,1}, the Bialynicki–Birula map `Gr_μ→(G/P⁻_μ)^⋄` is an isomorphism. In `GL_n` it sends a `B⁺_dR-lattice Λ` to the ascending filtration `Fil^m=((B⁺)^n∩ξ^{-m}Λ)/(ξ(B⁺)^n∩ξ^{-m}Λ)`. CS uses `μ(ξ^{-1})`; matching FS uses inversion of the coweight or of the chosen parabolic convention.

Generic characteristic-zero untilt; minuscule `μ`; `ℓ≠p` for the smoothness consequence.

The stabilizer filtration has no additional fibre when `μ` is minuscule.

([CS](#source-cs), 3.4.4–3.4.6, pp. 685–686.)

*Needs:* [Open Schubert cell smoothness](#open-cell-stabilizer-and-smoothness); ReductiveGroupsPartII RG2.1; RelativeFarguesFontaine §§3.8, 6.5–6.10; PadicHodgeTheory §7.1.


### Examples

For `G=GL₂` and `μ=(1,0)`, the stabilizer reduces to the opposite parabolic and the minuscule cell is the flag line. Its dimension is `⟨2ρ,μ⟩=1`. The lattice `diag(ξ,1)(B⁺)²` has the ascending filtration specified above; replacing `μ(ξ)` by `μ(ξ⁻¹)` reverses the flag convention. For `G_m`, the two changes of trivialization act by `h₁gh₂⁻¹`, so the identity modification has diagonal stabilizer even though its orbit is a single point.

### Dependencies

RelativeFarguesFontaine §§3.1–3.9, 4.7–4.13, 6.5–6.10, 7.0–7.6; ReductiveGroupsPartII §§RG2.1, RG2.3–RG2.4; DiamondsAndVStacks D3–D6; DiamondSixOperations §§S2, S4–S5; the Witt flag targets in GS0.

## Layer GS0: Witt bounds, determinant lines and projective models

### Lattices, types and finite-jet quotients

Construct the lattice functor and its proper perfect algebraic-space bounds before using determinant ampleness. Greenberg realization and smooth effective quotients give the original finite-jet route.

<a id="witt-lattice-functor-and-representability"></a>

**Witt lattice functor** (`WittLattice`). For a perfect `F_p`-algebra `R` let `Λ` be a finite projective `W(R)`-submodule of `W(R)[1/p]^n` with `Λ[1/p]=W(R)[1/p]^n`. `Gr^W_GL_n` is the v-sheaf of such lattices; a positive bounded piece `Gr_{≤λ}` has `Λ⊂W(R)^n` and quotient of type `≤λ`. Negative bounds are obtained by translating by `p^a`. For `O_E` coefficients use RelativeFarguesFontaine §§0.1–0.10’s ramified Witt ring; for a general smooth model `𝓖` use `𝓖-torsors` with a punctured trivialization.

The two pole bounds on a lattice are locally uniform; coefficients perfect; quotient type has fixed total length.

Use finite projectivity and bounded denominators to define the functor.

More generally, for commutative rings `B,K` with a specified `B`-algebra structure on `K`, lattices are finite-projective `B`-submodules of `K^n` whose `K`-span is the whole space. The geometric specialization supplies localization, coefficient perfection and locally uniform pole bounds.

The embedded-module projection is the supplied `Subtype.val`. Provide the following geometric lattice API.

- `WittLattice_standard`: The image of `B^n` in `K^n` gives the standard lattice when `B→K` is injective.
- `WittLattice_ext`: Lattices are equal when their embedded submodules are equal; finite-projectivity proofs carry no extra moduli.
- `WittLattice_rank_zero`: For any coefficient algebra the rank-zero lattice type is a singleton, with its unique zero embedded module.

**Checks.**

- The unique rank-zero lattice exists over every coefficient algebra.
- Over `B=K` the standard lattice agrees with the top Submodule of `K^n`.
- Exclude the zero rank-one submodule over a nonzero field.


([BS](#source-bs), 8.1 and 9.4–9.5, pp. 32, 36–37.)

*Needs:* `WittVector`; `PerfectRing`; `Module.Projective`; RelativeFarguesFontaine §§0.9–0.10; SchemeAndStackFoundations §§4.7–4.8, 4.14; ReductiveGroupsPartII RG2.3; `Module.Finite`.

<a id="witt-types-and-bounds"></a>

**Witt torsion module types** (`wittTypeBound`). A finite p-power-torsion isogeny cokernel `Q` over `W(R)` has geometric type `λ=(λ₁≥⋯≥λ_n≥0)`, meaning `Q_x≅⊕W(k_x)/p^{λ_j}`. Its row lengths are `n_λ(i)=#{j:λ_j>i}`. Dominance means equal total length and all partial sums bounded. Type `≤λ` is a closed locus; on a constant-type locus the modules `p^iQ/p^{i+1}Q` are finite projective of ranks `n_λ(i)`. An isogeny is a map of finite projective `W`-modules invertible after p-inversion.

`R` perfect; a uniform p-power kills `Q`; the isogeny-cokernel criterion is projective dimension at most one, including `Q=0`.

Import projective module algebra, Fitting-ideal tests and reducedness of perfect rings from SchemeAndStackFoundations §§0.9, 0.17 and 0.24–0.26.

Provide the following API.

- `wittTypeBound_dominance`: The quotient-type relation is `GL_n` dominance after embedding nonnegative parts in the integer coweight lattice.
- `wittTypeBound_columns`: The i-th graded quotient has rank equal to the number of parts `λ_j` exceeding i.
- `wittTypeBound_closed_under_dominance`: A lower quotient type remains in any larger bound.
- `wittTypeBound_zero`: For every finite rank a nonnegative type is bounded by zero exactly when it is zero.

**Checks.**

- The zero bound admits only zero nonnegative quotient parts.
- For `λ=(2,1,0)`, the successive column ranks are two and one.
- The zero tuple has no nonzero columns at any index.
- For a tuple of `n` ones the zeroth column has rank `n` and every subsequent column has rank zero; transposing the row and column convention fails this test.
- (1,0,0) is not below (2,1,0): the total lengths differ.


([BS](#source-bs), 7.1–7.9, pp. 27–32.)

*Needs:* [Witt lattice functor](#witt-lattice-functor-and-representability); SchemeAndStackFoundations §§0.9, 0.24–0.26; `Module.Projective`.

<a id="zhu-finite-jet-presentation"></a>

**Zhu finite-jet presentation** (`jetDeterminantLocus`). For `λ=(N,0,…,0)`, `V_N` parametrizes `W-matrices` with determinant `p^N` times a unit. For h>N, `V_{N,h}` is the perfection of the truncated determinant locus `det₀=⋯=det_{N−1}=0`, `det_N` invertible. `Gr̄_{N,h}` adds a `W_h-trivialization` of the lattice and is an `L^hGL_n-torsor` over `Gr̄_N`. The stabilizer `J={(A,γ):Aγ=A}` gives `Gr̄_{N,h}≅J` after a chosen normalized lift.

The isomorphism uses a choice of lifting; h>N, not `h=N`. Nonperfect Greenberg test rings use the ring scheme of `O_E/ϖ^h`, not a naive tensor formula.

Use ReductiveGroupsPartII §RG2.3.7, `finite-level-jet-realizations`, for the Greenberg ring scheme and SchemeAndStackFoundations §§0.24–0.26 for perfect finite models.

The determinant condition over a commutative ring `B` is `det(A)=uπ^N` for some unit `u`. The finite-jet geometric application uses the actual Greenberg ring and the displayed depth bound; the determinant condition alone asserts no representability.

Provide the following API.

- `jetDeterminantLocus_mem`: The matrix jet lies on the determinant locus when `det(A)=uπ^N` for a unit `u`; the finite truncation and bound h>N are retained in the application.
- `jetDeterminantLocus_right_invariance`: Right multiplication by an invertible matrix preserves the determinant locus.
- `jetDeterminantLocus_ring_map`: A ring map takes the determinant locus to the corresponding locus with the image uniformizer.

**Checks.**

- For `N=0` the determinant is a unit.
- The identity matrix is in the `N=0` locus.
- A zero rank-one matrix is excluded at `N=0` over a nonzero field.

([Zhu](#source-zhu), 1.9–1.11, pp. 418–421.)

*Needs:* [Witt lattice functor](#witt-lattice-functor-and-representability); SchemeAndStackFoundations §§0.9, 0.24–0.26; ReductiveGroupsPartII RG2.3.

<a id="zhu-original-algebraic-space"></a>

**Original perfect algebraic-space construction** (`zhuBoundPresentation`). Each `Gr̄_N` and hence each bounded `GL_n` Witt Grassmannian is a perfectly finitely presented separated proper algebraic space; Gr is an increasing union of such pieces. For general reductive `G` a faithful representation with quasi-affine quotient gives a locally closed embedding into the `GL_n` Grassmannian; an affine quotient gives a closed embedding.

Zhu published edition; perfect fields/rings; integral model assumptions pinned.

Use the affine jet presentation and effective quotient theorem A.29.

([Zhu](#source-zhu), 1.12, 1.19–1.20; A.29–A.31, pp. 421, 425–426, 476–477.)

*Needs:* [Zhu finite-jet presentation](#zhu-finite-jet-presentation); [Witt Demazure filtration space](#witt-demazure-resolution); SchemeAndStackFoundations §§1.5–1.6, 1.13–1.17; ReductiveGroupsPartII RG2.3.

### Demazure filtrations and geometric determinant descent

Filtration resolutions supply the connected-fibre descent criterion. Choose the first quotient of `Q/pQ` with the prescribed rank; lower-type fibres need not make `Q/pQ` itself that quotient. The determinant line is descended from graded quotient determinants.

<a id="witt-demazure-resolution"></a>

**Witt Demazure filtration space** (`wittFiltration`). For `Q` of type `≤λ`, `Dem_λ(Q)` classifies `Q=Q₀⊃Q₁⊃⋯⊃0` with `Q_i/Q_{i+1}` locally free over `R` of rank `n_λ(i)`. The global resolution `Gr̃_λ` classifies a lattice together with such a filtration of `W(R)^n/Λ`. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is `Gr_{≤λ}`; over exact type the filtration is the p-adic filtration and the map is an isomorphism.

`λ` sorted nonnegative; total length fixed; all quotient maps respect the Witt action; zero `λ` gives the vanishing locus.

Perfect the `Quot/Grassmann` bundles of SchemeAndStackFoundations §4.14 to choose a locally free quotient `Q/pQ→G` of rank `n_λ(0)`, and recurse on `ker(Q→G)` with `λ` shifted by one column. `Q/pQ` itself can have larger rank on lower-type fibres; it is not the chosen quotient `G`. BS 7.13 gives image, uniqueness and properness. Zhu 1.13–1.18 gives the lattice-chain presentation, including reversed dual bounds for reversed chains. BS 8.6 produces a smooth projective finite-type model for the global tower.

Provide the following API.

- `wittFiltration_eval`: The underlying filtration consists of a decreasing chain of submodules starting at `M` and ending at zero.
- `wittFiltration_piece`: Evaluation gives the i-th submodule in the chain.
- `wittFiltration_ext`: Two filtration points are equal if all their submodules agree.

**Checks.**

- A length-zero filtration forces the module to be zero.
- A one-column filtration has first piece `Q` and all subsequent pieces zero, and exists exactly when `pQ=0` and `Q` is locally free of that column rank over the base.
- The filtration decreases; increasing kernels of `p` must first be reverse-indexed.


([BS](#source-bs), 7.10–7.13 and 8.4–8.6, pp. 29–34.)

*Needs:* [Witt torsion module types](#witt-types-and-bounds); SchemeAndStackFoundations §§0.9, 0.24–0.26; SchemeAndStackFoundations §§1.5–1.6, 1.13–1.17; CrystallineCohomology CR.1.

<a id="connected-cohomological-fibres"></a>

**Fibres of the Witt resolution** (`wittResolutionConnectedFibres`). The fibres of `Gr̃_λ→Gr_{≤λ}` are geometrically connected and have `RΓ(O)=k` at geometric perfect fields. The resolution is an isomorphism over exact type. In Zhu’s full `ω₁-chain` resolution of `Gr̄_N` every lower-type fibre has positive dimension.

Nonempty geometric fibres; `Q` an isogeny cokernel.

Apply BS 7.14 to filtered Grassmann incidence parameters; reverse the increasing kernels of multiplication by `p` to match its decreasing-filtration convention.

([BS](#source-bs), 7.13–7.14, pp. 30–32; [Zhu](#source-zhu), Lemma 1.18, pp. 424–425.)

*Needs:* [Witt Demazure filtration space](#witt-demazure-resolution); SchemeAndStackFoundations §§0.9, 0.24–0.26; SchemeAndStackFoundations §3.4.

<a id="witt-bundle-descent"></a>

**Finite and formal Witt-bundle descent** (`wittBundleVDescent`). For a perfect `𝔽_p`-algebra `R` and every `m≥1`, the category of finite projective `W_m(R)`-modules satisfies effective v-descent, including descent of maps, tensor products and rank. The inverse limit over reduction in `m`, with locally uniform finite rank, is the category of finite projective `W(R)`-modules. Prove compatibility of descent with this completed-system equivalence. Here `W_m(Spec R)` is the Witt scheme of SchemeAndStackFoundations §0.26; the v-site is that of perfect schemes. This result concerns ordinary Witt bundles and does not assert that finite-thickening descent alone algebraizes an arbitrary completed family. Provide `wittBundleVDescent`, `wittBundleReduction`, `wittBundleCompletion` and their identity, composition, tensor and base-change comparisons. Its intended signature is an equivalence between finite projectives on `W_m(R)` and the descent category on the Čech nerve of a v-cover; the formal version uses the compatible tower with the stated rank bound. ([BS](#source-bs), Theorem 4.1 and its proof, pp. 15–20.)

**Checks.**

- The identity cover descends the free rank-`n` module with the identity cocycle to `W_m(R)^n`.
- At `m=1` the result is ordinary finite-projective descent over the perfect base, rather than descent of modules over an unrelated product of copies of `R`.
- The compatible trivial rank-one tower recovers `W(R)`; towers with ranks tending to infinity are excluded by the uniform finite-rank condition.

*Needs:* SchemeAndStackFoundations §§0.24–0.26, 1.1; EnhancedDerivedSheaves §E2.8; `WittVector`; `Module.Finite`; `Module.Projective`.

<a id="h-descent-and-fibral-criterion"></a>

**Descent on Witt resolution fibres** (`wittFibralDescent`). Prove v-descent for finite/formal Witt bundles and the proper pfp connected-fibre criterion, then apply them to `Gr̃_λ→Gr_{≤λ}`. Pullback on line bundles is fully faithful; a line bundle trivial on every geometric fibre descends. The stronger `Rψ_*O=O` criterion applies to the same resolution and commutes with base change.

Proper surjective pfp perfect morphism; geometric connectedness alone is the weaker sufficient criterion, not an equivalence with `Rψ_*O=O`.

Establish the general finite/formal Witt-bundle descent and fibral criteria stated below, using BS 4.1 and 6.1, 6.8, 6.13. Apply them to the constructed Witt resolution.

([BS](#source-bs), 6.1, 6.8, 6.13 and 8.5, pp. 20–26, 33.)

*Needs:* [Finite and formal Witt-bundle descent](#witt-bundle-descent); [Fibres of the Witt resolution](#connected-cohomological-fibres); SchemeAndStackFoundations §§4.7–4.8, 4.14; SchemeAndStackFoundations §3.4.

The general fibral criterion used by `wittFibralDescent` is part of this target. For a proper surjective perfectly finitely presented map `f:X→Y` of perfect schemes with geometrically connected fibres, prove that pullback on finite locally free bundles is fully faithful and that its essential image consists exactly of bundles trivial on every geometric fibre. Give the descent object, descent of morphisms, uniqueness and compatibility with perfect-base change. Separately, if every geometric fibre has `RΓ(O)=k`, prove `Rf_*O_X=O_Y` and the corresponding base-change assertion. Do not identify this stronger cohomological condition with connectedness. The intended signature is a fully faithful `f*:Vect(Y)→Vect(X)` with this essential-image characterization, specialized to rank one for determinant descent. ([BS](#source-bs), Proposition 6.1, Theorems 6.8 and 6.13, Lemma 6.9, pp. 20–26.)

**Checks.**

- For `ℙ¹_k→Spec k`, a fibre-trivial bundle is pulled back from a vector space; `O(1)` is excluded.
- The trivial line on every fibre descends to the unit line, with endomorphisms descending as well as objects.
- The map `Spec k ⊔ Spec k→Spec k` has disconnected fibres and pullback is not full: independent scalars on the two components need not be equal.

*Needs:* [Finite and formal Witt-bundle descent](#witt-bundle-descent); SchemeAndStackFoundations §§0.24–0.26, 2.6, 4.9; AlgebraicVectorBundles §§L0A–L0C; EnhancedDerivedSheaves §§E1.8, E2.8.

<a id="geometric-determinant-line"></a>

**Geometric determinant line** (`geometricDeterminantLine`). There is a unique line bundle `L` on `Gr_{≤λ}` whose pullback to `Gr̃_λ` is `⊗_i det_R(Q_i/Q_{i+1})`; these lines agree under lower bounds and hence form the determinant line on `Gr_GL_n`. Construct it geometrically using complete-flag refinements and fibre triviality, without the `K-theoretic` determinant.

Positive quotient convention `W(R)^n/Λ`; determinant of a sublattice would reverse the line.

Refine filtrations to full flag towers as in BS 6.11 and 8.8.

Provide the following API.

- `geometricDeterminantLine_pullback`: On the Demazure resolution, the pulled-back line is the tensor product of the determinants of the graded quotients, with the positive quotient convention.
- `geometricDeterminantLine_unique`: Fibre-trivial descent is unique through the fully faithful pullback of invertible sheaves.
- `geometricDeterminantLine_lower_bound`: Restriction to a lower bound agrees with that bound’s determinant line.

**Checks.**

- The zero bound has the trivial invertible sheaf.
- On the rank-one quotient Grassmannian `ℙ^{n−1}`, the descended `InvertibleSheaf` is the quotient line `O(1)`, whose inverse has degree `−1` on a Schubert line and is excluded.
- On a one-step quotient Grassmannian the line is the quotient determinant, with positive sign.


([BS](#source-bs), 6.11 and 8.8, pp. 25, 33–34.)

*Needs:* [Descent on Witt resolution fibres](#h-descent-and-fibral-criterion); [Witt Demazure filtration space](#witt-demazure-resolution); AlgebraicVectorBundles, L0A–L0C; SchemeAndStackFoundations §3.4; AlgebraicVectorBundles §L0C.

### Positivity, projectivity and integral families

Strict positivity on curves and the boundary calculation feed Keel’s theorem on finite models. Construct the boundary as a representable finite union before applying positivity. The resulting compact special bounds enter the integral divisor family.

<a id="determinant-positivity"></a>

**Positivity of the determinant line** (`determinantCurveDegree`). On `Gr̃_λ`, `⊗det(Q_i/Q_{i+1})^{a_i}` is ample for `a₀≫a₁≫⋯>0`. Each determinant factor has sections nonvanishing on the exact-type open locus. The unweighted descended line has positive degree on every nonconstant proper curve in `Gr_{≤λ}`; its resolution pullback is nef and big, with exceptional locus contained in the lower-type boundary.

Finite-type models fixed up to Frobenius; `a_i` integers with successive domination; effective divisors interpreted on these models.

Use BS 8.9 and Grassmann-bundle induction for weighted ampleness and explicit nonvanishing sections.

**Checks.** For a one-step projective Grassmannian the line has degree one on a Schubert line.

([BS](#source-bs), 8.9–8.11, pp. 34–35.)

*Needs:* [Determinant line](#geometric-determinant-line); SchemeAndStackFoundations §§3.3, 5.3–5.4.

<a id="perfect-positivity"></a>

**Frobenius models and the positivity criterion** (`perfectLinePositivity`). For a projective finite-type scheme `X₀` over a perfect field of characteristic `p>0`, put `X=X₀^perf`. Prove that an invertible sheaf on `X` descends after a finite Frobenius stage, with compatible tensor powers and pullbacks, and that its sections are the filtered colimit of sections on those stages. When taking `p`-th roots of a line class on `X`, record the corresponding Frobenius stage rather than choosing an unspecified ordinary model. Provide `perfectLineModel`, `perfectLineSections`, `perfectLinePullback` and their comparisons. ([BS](#source-bs), §3, especially Lemmas 3.5–3.6, pp. 9–11; §10.5, p. 39.)

For a nef line `L₀` on a projective scheme in characteristic `p`, define its closed exceptional locus as the union of positive-dimensional integral subvarieties `Z` with `c₁(L₀)^dim Z·Z=0`. Prove Keel's criterion: `L₀` is semiample if and only if its restriction to that locus is semiample. Include the finite-union gluing statement for restrictions to a closed boundary, and the descent of a semiample line through its Stein contraction. In the Witt application construct each finite boundary pushout along its actual closed intersections, prove the pushout universal property and identify its reduced perfect image before applying the gluing statement. These are geometric targets here; SchemeAndStackFoundations supplies the perfect schemes, finite models and Stein factorization. ([BS](#source-bs), proof of Theorem 8.3 in §8.4, pp. 35–36, using its quoted Keel criterion and union lemma.) Provide `perfectLineExceptionalLocus`, `keelSemiampleness`, `boundaryLineGluing` and `semiampleSteinDescent` with base-change and Frobenius-model compatibilities.

**Checks.**

- On a projective line the quotient determinant `O(1)` has degree `+1`, descends to an ample line and has the expected `p`-power section transitions; its inverse has degree `−1` and fails nefness.
- For a constant map from a projective curve, the trivial line has the entire curve as exceptional locus. Strict positivity excludes that contraction in the Witt-bound application.
- On the Demazure resolution a curve contracted to the lower-type boundary has degree zero for the pulled-back determinant, even though the descended line is positive on every nonconstant curve of the bound. Ampleness of this pullback is not asserted.

*Needs:* SchemeAndStackFoundations §§0.24–0.26, 3.3, 3.4, 4.9, 5.3–5.4; AlgebraicVectorBundles §L0C; [Determinant line](#geometric-determinant-line).

<a id="ampleness-via-keel"></a>

**Projectivity of the Witt Grassmannian** (`wittProjectiveBound`). For every dominant positive `λ`, `Gr_{≤λ}` is the perfection of a projective `F_p`-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded `GL_n` lattice pieces are perfections of projective varieties.

Use BS’s geometric determinant construction. Use the Keel criterion, exceptional locus and Frobenius extension/descent targets below; pfp/model theory comes from SchemeAndStackFoundations §§0.24–0.26.

Induct on dominance. Realize the lower boundary as an iterated finite pushout of lower bounds along closed intersections, constructing the finite perfect boundary pushouts and checking their universal property as part of this target. The determinant is ample on boundary pieces; Keel’s union lemma and strict curve positivity make it ample on the boundary. Keel’s restriction criterion then makes `ψ*L` semiample because its exceptional locus lies there. Take its Stein contraction on a finite model. Strict curve positivity and fibre triviality identify its equivalence relation with the Demazure quotient; hence the contraction is `Gr_{≤λ}`. Its descended line is ample.

**Checks.** No Zhu representability input in this independent route; `λ=(1)` recovers projective space.

([BS](#source-bs), §8.4, Theorem 8.3 (statement p. 32; proof pp. 35–36), Lemmas 8.9–8.11 (pp. 34–35).)

*Needs:* [Frobenius models and positivity](#perfect-positivity); [Positivity of the determinant line](#determinant-positivity); [Descent on Witt resolution fibres](#h-descent-and-fibral-criterion); SchemeAndStackFoundations §§1.5–1.6, 1.13–1.17; SchemeAndStackFoundations §§3.3, 5.3–5.4.

<a id="perfect-model-and-etale-comparison"></a>

**Perfect models and étale realization** (`wittEtaleComparison`). For the bounded Witt schemes/algebraic spaces, import compatible finite-type models up to Frobenius, dimension and fibre-product compatibility and étale-topos equivalence from SchemeAndStackFoundations §§0.24–0.26 and Layer 1. Apply those general results to identify their scheme diamondification with the characteristic-p fibre of the integral Grassmannian, by equality of the lattice/torsor functors. This result owns the Witt comparison application; SF owns the general model and perfection theory.

Coordinate perfection is a direct Frobenius colimit; Mathlib Perfection is an inverse-limit carrier and is not cited for this construction. `Trace/cycle` normalizations require a fixed model.

Use SchemeAndStackFoundations §§0.24–0.26 for Zhu A.3, A.15–A.17 and BS §3; prove the finite-model trace normalization here from the cited constructible trace formula.

([SW](#source-sw), 20.3.1–20.3.4, p. 185.)

*Needs:* [Witt lattice functor](#witt-lattice-functor-and-representability); SchemeAndStackFoundations §§0.9, 0.24–0.26; SchemeAndStackFoundations §§1.5–1.6, 1.13–1.17; AdicCoefficientsAndComparisons L1, `char-p-scheme-diamond-and-comparison-functor`; DiamondsAndVStacks D6, `pre-adic-diamondification`.

<a id="equal-characteristic-schubert-models"></a>

**Equal-characteristic Schubert models and coefficient comparison** (`equalCharacteristicSchubertModels`). For `E=𝔽_q((t))` and perfect `𝔽_q`-algebras `R`, construct the `R[[t]]`-lattice functor and, for each connected parahoric model, the torsor affine-flag functor. Construct their finite-dimensional Schubert models, projective bounds and Bruhat closure relations. Quotient types and decreasing filtrations use powers of `t`: at a geometric field a type `λ` means `Q≅⊕R[[t]]/(t^{λ_j})`, and the graded ranks count the parts exceeding each index. Include the determinant lines, reduced-word Demazure resolutions and affine Schubert strata used by GS1, with base change and finite-jet action comparisons. Identify the perfections of these functors with the closed fibre of the integral divisor Grassmannian by the coefficient-ring and torsor descriptions.

The p-typical Witt targets use `W(R)` and `p`. For ramified mixed-characteristic coefficients use the supplied strict `O_E`-lift and its uniformizer `π`; finite-free restriction of scalars transports the lattice bounds and determinant construction, retaining the `π`-adic types and filtrations. For equal-characteristic coefficients this strict lift is `R[[t]]`. Projectivity and the special-fibre comparison are geometric assertions here, in addition to the supplied coefficient rings. No normality or tame-splitting hypothesis is needed for these projective bounds.

Use the loop quotient construction and successive minimal-parahoric quotients to build the equal-characteristic models and their Demazure maps; take perfections only after constructing the finite-dimensional schemes.

**Checks.**

- For `G_m`, the perfect affine Grassmannian is the discrete weight lattice `ℤ`, with weight `a` represented by `t^aR[[t]]`.
- For `E=𝔽_p((t))`, `R=𝔽_p` and `Q=R[[t]]/(t²)`, the two graded pieces `Q/tQ` and `tQ/t²Q` are lines. Here `pQ=0` but `tQ≠0`, so the p-adic filtration cannot replace the t-adic one.
- For `GL₂` and bound `(1,0)`, the ordinary model is `ℙ¹` and the perfect model is its perfection, with quotient determinant `O(1)`.

([PR](#source-pr), Theorem 1.4, p. 9; §§8.b–8.c, especially Proposition 8.8, pp. 37–39; [SW](#source-sw), §§20.3–20.5, pp. 185–190; [Zhu](#source-zhu), §1.4.1, pp. 425–426, for ramified restriction of scalars.)

*Needs:* [Beilinson–Drinfeld Grassmannian](#grassmannian); [Witt lattice functor](#witt-lattice-functor-and-representability); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); RelativeFarguesFontaine §§0.1–0.10, 3.1–3.9; ReductiveGroupsPartII RG2.3; ReductiveGroupsPartII RG2.4; SchemeAndStackFoundations §§0.24–0.26, 1.5–1.6, 1.13–1.17; AlgebraicVectorBundles §L0C.

<a id="integral-family-bounded-properness"></a>

**Integral bounded Grassmannian families** (`integralWittGenericComparison`). The integral BD Grassmannian over Spd `O_E` (or `Div^d_𝒴)` interpolates between the generic `B⁺_dR` Grassmannian and the v-sheaf of the Grassmannian of coefficient lattices: Witt coefficients in mixed characteristic and `R[[t]]` for `E=𝔽_q((t))`. For a split reductive model, the geometric relative-position bounds are closed and proper and representable in spatial diamonds, also for ordered multiple legs with summed collision bounds; their componentwise filtered union is the full functor.

Fixed integral reductive model; unramified cocharacter reflex extensions in SW 20.3–20.5; no ramified reductive `O_E`-model asserted.

Use SW 20.3.2 for the torsor/étale quotient description and the explicit characteristic-p comparison.

**Checks.**

- For `G_m`, a fixed weight gives a section over the integral base, with the same integer position in its generic and closed fibres.
- For `GL₂` and `(1,0)`, the generic bound is the projective-line diamond and the closed fibre is the perfected projective-line model, in either characteristic of `E`.
- Two coincident `G_m` legs of weights one and one specialize to weight two, whereas disjoint legs retain their two separate weight-one factors.

([SW](#source-sw), 20.3.6 and 20.5.4, pp. 186, 190.)

*Needs:* [Projectivity of the Witt Grassmannian](#ampleness-via-keel); [Equal-characteristic Schubert models and coefficient comparison](#equal-characteristic-schubert-models); [Perfect models and étale realization](#perfect-model-and-etale-comparison); [Ordered legs and divisor base change](#ordered-leg-base-change); [Generic Schubert bounds](#schubert-bounds-and-properness); [proper pushforward calculus](#supplier-calculus); DiamondSixOperations §S2.4.

### Parahoric spaces and canonical models

Use inertia coinvariants for geometric component labels and retain residual Frobenius. Canonical finite models require their crystal/Hodge determinant comparison. The rank-two cone chart includes a stabilizer calculation that prevents a false uniqueness assertion for a right factor.

<a id="parahoric-ind-projectivity"></a>

**Witt affine flags and components** (`parahoricGeometricComponents`). For a smooth affine `O_E`-model `𝓖` of a reductive generic fibre, the uniformizer affine Grassmannian (Witt in mixed characteristic, perfected power-series geometry in equal characteristic) is an ind-pfp perfect space with locally closed embedding into a `GL_n` Grassmannian and ind-quasiprojective bounds. If `𝓖°` is parahoric its bounds are projective. For a connected parahoric model, geometric components are `π₁(G)_I` via Kottwitz, with residual Frobenius action retained. If only `𝓖°` is parahoric, they are `π₁(G)_I/π₀(𝓖_k̄)`; retain the Kottwitz embedding of the denominator and the residual Frobenius action. For an Iwahori, Schubert cells have dimension `ℓ(w)`, closures are the Bruhat unions and reduced-word Demazure spaces are iterated perfected `P¹`-bundles.

`Parahoric/Iwahori` notions supplied by RG2.3; inertia `I`, not the full absolute Galois group, labels geometric components.

Use the faithful representation with quasi-affine quotient and Zhu 1.20.

**Checks.**

- For the connected parahoric torus model, the geometric flag space is the discrete inertia-coinvariant coweight scheme, with Frobenius action.
- For the norm-one torus of `ℚ₃(√3)/ℚ₃`, the smooth model `x²−3y²=1` has two special-fibre components. Its Witt flag is a point, while the connected parahoric model gives `π₁(T)_I=ℤ/2`; the denominator removes precisely this difference.
- For the connected hyperspecial `GL₂` model, the component label is the determinant valuation in `ℤ`, with no component-group quotient.

([SW](#source-sw), 21.1.1–21.1.4, pp. 191–192.)

*Needs:* [Original perfect algebraic-space construction](#zhu-original-algebraic-space); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); [Equal-characteristic Schubert models and coefficient comparison](#equal-characteristic-schubert-models); ReductiveGroupsPartII RG2.3; ReductiveGroupsPartII RG2.4.

<a id="integral-parahoric-properness"></a>

**Integral parahoric ind-properness** (`integralParahoricProperBounds`). If `𝓖°` is parahoric, `Gr_{𝓖,Spd O_E}` is an increasing union of closed proper subfunctors. A closed representation `𝓖→GL_n` induces a closed immersion of integral Grassmannians. For minuscule bounds the closure is unchanged on replacing `𝓖` by `𝓖°`, and central quasiparahoric isogenies identify the corresponding closures after reflex-field base change.

Quasiparahoric models and component maps as in SW 21.2–21.5; minuscule hypothesis only for the closure comparisons.

Import Anschütz’s extension/triviality of torsors on punctured `A_inf` from RelativeFarguesFontaine §§7.0–7.6.

**Checks.** For a torus the integral flag is the diamondification of the integral coweight scheme; special labels are inertia coinvariants.

([SW](#source-sw), 21.2.1–21.2.3, 21.4.3, 21.5.1, pp. 192–197.)

*Needs:* [Witt affine flags and components](#parahoric-ind-projectivity); RelativeFarguesFontaine §§7.0–7.6; ReductiveGroupsPartII RG2.3; ReductiveGroupsPartII RG2.4; [proper pushforward calculus](#supplier-calculus); DiamondSixOperations §S2.4.

<a id="canonical-witt-models"></a>

**Canonical determinant models** (`canonicalWittModel`). For h>N, the finite-type truncated matrix locus `det₀=⋯=det_{N−1}=0` with `det_N` invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model `Gr′_μ`. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model `Gr̃′_N` is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.

Fix model and Frobenius levels; do not infer normal Cohen–Macaulayness of every canonical Schubert model (Conjecture III). Dieudonné/crystal and p-divisible-group theory is imported.

Use Zhu B.4’s codimension and Serre-criterion argument for the matrix complete intersection, with SchemeAndStackFoundations §§0.24–0.26. Descend the normalized jet quotient using SF effective quotients; use twisted transitions as in B.6. Import B.7–B.9’s Dieudonné realization from the p-divisible-group owner and check the pullback of the Hodge determinant; prove the crystal-to-Hodge comparison for the actual tower.

Provide the following API.

- `canonicalWittModel_transition`: A sufficiently deep finite-jet level has a transition to a shallower canonical model; compatibility can require a Frobenius twist.
- `canonicalWittModel_normalized_quotient`: The canonical model is identified with the normalized jet quotient, not an arbitrary scheme having the same perfection.
- `canonicalWittModel_perfection`: Its scheme perfection is the specified Witt Schubert bound.

**Checks.**

- The `N=0` canonical bound is Spec `k`, over the specified perfect coefficient field.
- For `GL₁` and N<h the canonical bound is Spec `k`, representing `p^N` `W(k)`.
- The dual-number `F₂` algebra has `ε≠0` with `ε²=0`, forgotten by perfection; a shared perfection does not determine a finite model.


([Zhu](#source-zhu), B.4–B.9, pp. 484–486.)

*Needs:* [Zhu finite-jet presentation](#zhu-finite-jet-presentation); [Witt Demazure filtration space](#witt-demazure-resolution); SchemeAndStackFoundations §§0.9, 0.24–0.26; SchemeAndStackFoundations §§1.5–1.6, 1.13–1.17; SchemeAndStackFoundations §§4.7–4.8, 4.14; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6; CrystallineCohomology CR.1; CrystallineCohomology CR.7.

<a id="rank-two-cone-chart"></a>

**Rank-two quadratic cone model** (`rankTwoConeClosedOrbit`). For p>2, `GL₂` and `N=2`, `Gr̄₂` has an open chart equal to the perfection of Spec `k[x,y,z]/(x²−yz)`, via `A=((p+[x],−[y]),([z],p−[x]))`. Together with the open exact-type orbit it covers `Gr̄₂`. Its Demazure resolution is the perfection of `P(O(1)⊕O(−1))`. The open decomposition locus of `W₃-matrices X` with `[λ]det X=p²` is characterized by `X=Ag` with `g∈GL₂(W₃)`; the representative A is unique.

p>2; finite Witt truncation `h=3`; correct order `g̃=Ã⁻¹X̃` and determinant det `X=p²[λ]⁻¹`.

Use the projective-bundle extension `E/p` and its splitting to identify the resolution model. Use the determinant equations B.3.1 to solve uniquely for x,y,z on the locus `det(X₁)` invertible, then saturate by the right `GL₂(W₃)`-action. Use the inverse order `g̃=Ã⁻¹X̃` in the B.11 factorization. The rank-two adjugate argument below proves integrality of the chosen right factor `Ã⁻¹X̃` and its unit determinant. Construct the truncated-Witt and jet-torsor interface; the jet torsor then identifies the open chart. Choose a Witt lift `X̃` as in Remark 1.11 and let `Ã` be the displayed Teichmüller matrix, so `det(Ã)=p²`. For the corrected factor `g̃=Ã⁻¹X̃`, use `X̃* Ã≡0` mod `p²` and `adj(X̃* Ã)=Ã* X̃` in rank two. Thus `p⁻² Ã* X̃` is integral. The determinant has the form `det(X̃)=p²u` with `u∈W(R)×` reducing to `λ⁻¹`; hence `det(g̃)=u` is a unit. Reducing this chosen factor modulo `p³` gives `X=Ag`. The factor `g` can depend on the chosen lift and the stabilizer of A; B.11 asserts uniqueness of the cone representative A, not uniqueness or lift-independence of `g`. Express existence and the induced jet-torsor/quotient compatibility in the supplier’s truncated-Witt interface.

**Checks.**

- Over `ℤ/27`, `A=3·Id` and `g=Id+9E₁₂` satisfy `Ag=A`, det `g=1`, `g≠Id`. Zhu B.11 specifies A uniquely, not `g`.


([Zhu](#source-zhu), B.10–B.11, pp. 486–488.)

*Needs:* [Canonical determinant models](#canonical-witt-models); [Zhu finite-jet presentation](#zhu-finite-jet-presentation); SchemeAndStackFoundations §§0.9, 0.24–0.26.

### Normalized lines, sections and bounded flag correspondences

Normalization removes the standard-lattice determinant factor. Section growth and admissible local-model loci are separate consequences. All affine flag fibre dimensions are computed on compatible bounded perfect models; ordinary multiplication and Demazure multiplication have different bounds.

<a id="sl-determinant-normalization"></a>

**Normalized determinant on `SL_n` lattices** (`normalizedDeterminant`). Assume `E` is a finite extension of `ℚ_p`. On `Gr_SL_n` over the ramified Witt coefficient ring, lattices have determinant trivialization. For a≪0 define `L_M` as `det̃(p^aW_{O_E}(R)^n/M)⊗det̃(p^aW_{O_E}(R)^n/W_{O_E}(R)^n)⁻¹`, independent of a. It is ample on every proper bound. Translations differ from `L` only by a line on the base, giving a `G_m-central` extension of the loop group acting on `L`.

The ordinary geometric determinant on filtered torsion modules agrees with the imported determinant calculus; the normalization factor is retained. This does not assert an honest LG-linearization.

For `n=0,1`, use the trivial-group identification and the unit line. For `n≥2`, apply BS §10: the ramified Witt ring is finite free over `W(R)` of rank `e=[E:W(𝔽_q)[1/p]]` through a fixed coefficient basis. Restrict scalars to `W(R)^{ne}`, then use the `GL_{ne}` bound and determinant line. All displayed p-power truncations and this normalization use these mixed-characteristic hypotheses.

Provide the following API.

- `normalizedDeterminant_trivial`: At the standard lattice, the normalized determinant line is the tensor unit.
- `normalizedDeterminant_comparison`: Normalization retains the inverse standard-lattice determinant factor.
- `normalizedDeterminant_translation`: Translation gives a line from the base tensored with the original line; the compatible lines form a central extension rather than an honest action on the line.

**Checks.**

- The standard lattice has normalized determinant `R`.
- For `E=𝔽_p((t))` and `R=𝔽_p`, the coefficient ring is `𝔽_p[[t]]`, killed by p; it is not finite free over `W(R)=ℤ_p`, and negative p-powers cannot define these truncations.
- Two zero truncation quotients have the unit determinant.
- Enlarge both truncation quotients by the same filtered quotient `T`. The tensor/dual formula cancels `det(T)` with its inverse and leaves the normalized line unchanged; retaining only the numerator fails this comparison.


([BS](#source-bs), 10.1 and discussion through 10.4, pp. 37–39.)

*Needs:* [Determinant line](#geometric-determinant-line); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); RelativeFarguesFontaine §§0.9–0.10; AlgebraicVectorBundles §L0C.

<a id="sections-on-witt-bounds"></a>

**Sections of the Witt determinant line** (`determinantSectionsRestriction`). Assume `E/ℚ_p` finite, with the coefficient basis and normalization of `normalizedDeterminant`. For the ample determinant line on `Gr_SL_n`, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.

Pass to fixed finite models and arbitrarily large Frobenius powers of their ample lines. This gives no answer to BS Question 10.6 about canonical modules or embeddings.

Prove and use the Frobenius-model section-colimit description of line bundles on perfections.

**Checks.**

- For `n=0,1` the Grassmannian is a point, its line is trivial and its section space is one-dimensional.
- For `n≥2`, a positive-dimensional perfected projective bound has infinitely many independent sections in the Frobenius colimit.
- Restriction to the standard-lattice point is onto its one-dimensional determinant fibre.

([BS](#source-bs), 10.5 and 10.6, pp. 39–40.)

*Needs:* [Frobenius models and positivity](#perfect-positivity); [Normalized determinant on SL_n lattices](#sl-determinant-normalization); SchemeAndStackFoundations §§3.3, 5.3–5.4; SchemeAndStackFoundations §§0.9, 0.24–0.26.

<a id="bounded-admissible-flags"></a>

**Bounded admissible affine flag loci** (`admissibleFlagLocus`). For a parahoric 𝓚 and a dominant cocharacter class `μ`, the admissible locus `A_{𝓚,μ}` is the finite closed union of affine Schubert strata labelled by the parahoric image of `Adm(μ)`. Its reduced perfect structure is determined by geometric points. For the local-model functoriality assume `E/ℚ_p` finite, connected parahoric `O_E`-models of connected reductive groups, and a model morphism `f:𝓚₁→𝓚₂` taking the geometric conjugacy class `μ₁` to `μ₂`. After a common reflex-field base change, the flag map factors through `A_{𝓚₂,μ₂}` on `A_{𝓚₁,μ₁}`; no minuscule or tame-ramification hypothesis is imposed.

Admissible sets and affine Bruhat order come from RG2.4. This target owns the integral v-sheaf local models: construct `𝓜_{𝓚,μ}` as the v-closure of the generic Schubert bound in the integral Grassmannian, its map under `f`, and the identification of its reduced special fibre with `A_{𝓚,μ}`. Construct the bounded nearby-cycle comparison on these models, its constant-term compatibility and its support calculation from generic Satake, as in AGLR §§6.1–6.5; these identify the special fibre and yield the factorization. The finite Bruhat-union construction itself applies under the standing flag hypotheses. The v-sheaf local-model construction here uses mixed characteristic.

Provide the following API.

- `admissibleFlagLocus_mem`: A flag lies in the admissible locus precisely when it is in one of the finitely many admissible Schubert strata.
- `admissibleFlagLocus_mono`: Inclusion of admissible bounds induces the closed inclusion of their reduced perfect flag loci, compatible with the Schubert stratification and base change.
- `admissibleFlagLocus_functoriality`: For the specified parahoric-model morphisms, construct `𝓜_{𝓚₁,μ₁}→𝓜_{𝓚₂,μ₂}`, identify both reduced special fibres with their admissible loci and deduce `A_{𝓚₁,μ₁}→A_{𝓚₂,μ₂}`. The factorization is a conclusion, with identity, composition and common-reflex-field base-change comparisons.

**Checks.**

- The empty label set gives the empty locus.
- A singleton label gives exactly its Schubert stratum.
- Exclude points in no admissible stratum, including wrong components.
- An Iwahori-to-parahoric model morphism takes the full Iwahori admissible union into its parahoric image, including non-minuscule bounds.
- For the identity model morphism, both the local-model map and its special-fibre factorization are identities.

([AGLR](#source-aglr), Definition 4.11, pp. 25–26, Proposition 4.16, pp. 27–28, and Theorem 6.16, p. 36; [GLX](#source-glx), §3.2 and §3.3, Lemmas 3.3–3.4, pp. 822–823; [vH](#source-vh), §2.2.14–§2.2.15, pp. 15–16.)

*Needs:* [Witt affine flags and components](#parahoric-ind-projectivity); [Integral parahoric ind-properness](#integral-parahoric-properness); [Normalized equivalence](#normalized-satake-equivalence); VStackSheavesAndLisseCategories VS1; DiamondSixOperations §§S2–S5; ReductiveGroupsPartII RG2.4; SchemeAndStackFoundations §§4.7–4.8, 4.14.

<a id="flag-incidence-correspondences"></a>

**Relative-position flag correspondences** (`flagIncidence`). For affine flags define `O_w⊂Fl×Fl` by relative position `w`. The two-step incidence `C_{u,v}={(x,z,y):(x,z)∈O_u,(z,y)∈O_v}` maps by forgetting `z` to Fl×Fl; pull back to `O_{uv}` or `O_{u*v}` to get the product and Demazure-product correspondences. Work on finite Schubert bounds over the first flag; these give pfp perfect models and compatible base changes.

Relative position and Demazure product from RG2.4. The bounded twisted product is not an untwisted Cartesian product.

Construct the fibre-product incidence and its projection from the affine flag moduli.

Provide the following API.

- `flagIncidence_points`: Two-step incidence consists of (x,z,y) with (x,z) in the first relative-position orbit and (z,y) in the second.
- `flagIncidence_projection`: The product projection forgets `z` and returns (x,y).
- `flagIncidence_fibre`: The fibre over (x,y) is the set of middle flags satisfying both relative-position conditions.

**Checks.**

- If the first relation is the diagonal, `z` is uniquely `x`.
- An empty first relation gives empty incidence.
- For both diagonal relations, a middle flag different from `x` cannot occur.

([He](#source-he), 5.3–5.4, pp. 9–12.)

*Needs:* [Witt affine flags and components](#parahoric-ind-projectivity); ReductiveGroupsPartII RG2.4; SchemeAndStackFoundations §§0.9, 0.24–0.26; SchemeAndStackFoundations §§1.5–1.6, 1.13–1.17.

<a id="flag-convolution-fibres"></a>

**Affine flag convolution fibre bounds** (`flagConvolutionFibreBound`). If `ℓ(uv)=ℓ(u)+ℓ(v)`, the product-incidence projection `C_{u,v}|_{O_{uv}}→O_{uv}` is an isomorphism. In general it is surjective with each geometric fibre of dimension `≥(ℓ(u)+ℓ(v)−ℓ(uv))/2`. The Demazure-product projection is surjective with fibres of dimension `≥ℓ(u)+ℓ(v)−ℓ(u*v)`. These statements transfer to compatible pfp perfect models and their bounded pullbacks.

Nonempty fibres and bounded pfp models; ordinary and Demazure products kept distinct. Adjoint transfer is componentwise and needs the corrected GHN hypothesis. He’s standing geometric setting is a simple quasi-split group over the local field (§2.2); any transfer to other groups must use the componentwise comparison with its stated hypotheses.

Use rank-one `A¹/G_m` convolution strata and induction on affine reduced words, as in GH10 2.4–2.5 cited by He 5.6.

**Checks.** For `u=v=s`, `ℓ(s)=1` and `s*s=s`: the Demazure fibre has dimension at least one, while the ordinary-product fibre lower bound is one.

([He](#source-he), 5.6 and proof 5.5, pp. 10–12.)

*Needs:* [Relative-position flag correspondences](#flag-incidence-correspondences); ReductiveGroupsPartII RG2.4; SchemeAndStackFoundations §§0.9, 0.24–0.26; SchemeAndStackFoundations §§4.7–4.8, 4.14.


### Examples

For type `λ=(2,1,0)` the Demazure tower chooses a rank-two quotient of `Q/pQ` and then a rank-one quotient of the next kernel. At a lower-type fibre `Q=k³`, the first choice is a projective plane, rather than the assertion that `Q/pQ` already has rank two. On a one-step quotient Grassmannian the determinant is `O(1)` and has degree `+1` on a Schubert line. In the rank-two truncated chart, `A=3·Id` and `g=Id+9E₁₂` over `ℤ/27` satisfy `Ag=A`, `det(g)=1` and `g≠Id`, distinguishing the right factor from the unique cone representative.

### Dependencies

The loop and divisor constructions of GS0; SchemeAndStackFoundations §§0.24–0.26 and Layers 1, 4; AlgebraicVectorBundles §§L0A–L0C; EnhancedDerivedSheaves §E2.8; ReductiveGroupsPartII §§RG2.3–RG2.4; CrystallineCohomology §§CR.1, CR.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, R07.6.

## Layer GS1: Semi-infinite geometry, ULA and relative perversity

### Length, relative position and hyperbolic localization

Semicontinuity produces the closed weight filtrations used for constant terms. Affineness and dimensions are geometric inputs to perversity. Rational MV cycles use top cohomology on fixed finite models rather than an integral canonical basis.

<a id="length-semicontinuity"></a>

**Semicontinuity of completed divisor length** (`divisorLengthUpperSemicontinuous`). In the ordered `O_E-untilt` setup of FS VI.3.2, let `f∈B⁺`. The function `ℓ_f:|S|→ℕ∪{∞}`, `s↦length_{B_s⁺}(B_s⁺/(f_s))`, has open sublevel loci {s | `ℓ_f(s)≤m}` for every `m∈ℕ`. Infinite length is retained when `f_s` vanishes on a DVR factor; it is never replaced by zero.

`S=Spa(R,R⁺)` is affinoid perfectoid over `F_q`; `E` is a nonarchimedean local field with residue field `F_q`. Fix `n≥1` ordered `O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+})`, with repetitions allowed, and primitive generators `ξ_i` of `ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+})`. Choose a pseudouniformizer `ϖ` of `R`. Put `ξ=∏_i ξ_i`, `B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k)`, and `B=B⁺[1/ξ]`. These are the actual Cartier-completed period rings; `ξ` need not be a uniformizer when legs coincide. For `s∈|S|` use the corresponding completed residue-field pair `(K(s),K(s)⁺)` and the induced ring map `B⁺→B_s⁺`. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity.

For each i, let `S_i` be the closed locus in `S` where the image of `f` in the i-th untilt `R_i^♯` vanishes. Away from their finite union, `f` is a unit in every geometric completed DVR factor, so `ℓ_f=0`. On `S_i`, pull back to that closed locus and divide `f` by its regular Cartier generator `ξ_i`. For `f_i=f/ξ_i` the geometric module length is `ℓ_f=ℓ_{f_i}+1`, with `∞+1=∞`. This counts that one degree-one divisor even if some other legs coincide. Induct on `m`. In each closed `S_i` the bad locus `ℓ_f>m` is the bad locus `ℓ_{f_i}>m−1`, closed by induction; their finite union is the complement of the required open sublevel locus. The case `m=0` is the unit locus described in the first step.

**Checks.** A unit `f` has length zero on every fibre; `f=0` has infinite length on every nonempty geometric divisor fibre. For one geometric leg and `f=ξ_1^a`, the length is a. For `ξ=ξ_1^n` at a coincident n-tuple, `length(B_s⁺/ξ)=n`, not one. For distinct supports, length is the sum of the DVR-factor lengths; no DVR assertion is made about the whole product.

([FS](#source-fs), Lemma VI.3.3 and full proof, printed p. 204; setup in Lemma VI.3.2, printed p. 203.)

*Needs:* RelativeFarguesFontaine §3.5; RelativeFarguesFontaine §3.8; RelativeFarguesFontaine §3.9; RelativeFarguesFontaine §4.13; RelativeFarguesFontaine §4.12; RelativeFarguesFontaine §§4.7–4.13.

<a id="lattice-relative-position-semicontinuity"></a>

**Semicontinuity of lattice position** (`latticeRelativePositionUpperSemicontinuous`). In the ordered `O_E-untilt` setup of FS VI.3.2, let `L⊂B` be a finitely generated `B⁺-submodule` for which `ξ^N B⁺⊂L⊂ξ^(−N)B⁺` for some `N≥0`. Let `S_m⊂|S|` be the locus where the image `L_s` of `L⊗_{B⁺}B_s⁺` in `B_s` has total relative position `m∈ℤ` against `B_s⁺`. Then `⋃_{m′≥m}S_{m′}` is closed for every `m∈ℤ`. If `S_m=|S|` for some `m`, `L` is a line bundle over `B⁺` (a finite projective module of rank one); global freeness is not asserted.

`S=Spa(R,R⁺)` is affinoid perfectoid over `F_q`; `E` is a nonarchimedean local field with residue field `F_q`. Fix `n≥1` ordered `O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+})`, with repetitions allowed, and primitive generators `ξ_i` of `ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+})`. Choose a pseudouniformizer `ϖ` of `R`. Put `ξ=∏_i ξ_i`, `B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k)`, and `B=B⁺[1/ξ]`. These are the actual Cartier-completed period rings; `ξ` need not be a uniformizer when legs coincide. For `s∈|S|` use the corresponding completed residue-field pair `(K(s),K(s)⁺)` and the induced ring map `B⁺→B_s⁺`. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity. Relative position uses the sum of the valuations on the distinct geometric DVR factors, with the convention that for `L_s⊂B_s⁺` it is `length(B_s⁺/L_s)`. The image of tensor base change is used, not an unproved injectivity of `L⊗B_s⁺→B_s`. `L` is finitely generated, open and bounded in the displayed `ξ`-adic sense. These hypotheses imply only finitely many relative-position values; local principality is the conclusion, not an input.

Multiply `L` by a power of `ξ` to reduce to `L⊂B⁺`. This changes every relative-position value by the same constant (the degree `n` times that power), so it preserves the claimed semicontinuity and constant-position criterion. At a point `s`, `B_s⁺` is a finite product of DVRs and `L_s` is a free rank-one ideal. After localizing `S`, choose `l∈L` whose image generates `L_s`. Apply length-semicontinuity to `l`: near `s` the length of `B_t⁺/(l_t)` is at most the length at `s`. Since `B⁺l⊂L`, the relative position of `L_t` is at most that of `B_t⁺l`. Thus the relative-position sublevel loci are open; taking complements gives closed loci of position at least `m`. If the position is constant, the containment `B⁺l⊂L` has equal geometric fibre positions nearby and is an equality there; the generator gives a local trivialization. The ring/lattice fibre-detection step is supplied by the rank-one completed-ring fibre-detection argument in this target, not inferred from an arbitrary ring map. These local identifications make `L` a line bundle.

**Checks.** `L=B⁺` has constant position zero and is a line bundle. `L=ξ^aB⁺` has constant total position na, including coincident legs. The closed-locus direction is `position≥m`; the open-locus direction is `position≤m`. They are not interchanged. Constancy gives local rank-one projectivity, not a chosen global generator; no assertion is made for a merely pointwise specified or non-finitely-generated submodule.

([FS](#source-fs), Lemma VI.3.2 and full proof, printed pp. 203–204; relative-position convention immediately before the lemma.)

*Needs:* [Semicontinuity of completed divisor length](#length-semicontinuity); RelativeFarguesFontaine §3.8; RelativeFarguesFontaine §4.13; RelativeFarguesFontaine §4.12; RelativeFarguesFontaine §§3.8, 6.5–6.10.

<a id="semi-infinite-orbits-and-hyperbolic-localization"></a>

**Semi-infinite strata and constant terms** (`constantTerm`). For a parabolic `P⁺⊂G` with Levi `M` and opposite `P⁻`, `Hck_{P±}→Hck_G` and `Hck_{P±}→Hck_M` give `CT_P=R(p⁺)_!(q⁺)*`. On bounded monodromic objects it identifies with `R(p⁻)_*R(q⁻)`!. For a Borel, on a one-leg geometric fibre with primitive equation `t`, the local strata are `S_λ=L U·λ(t)`. On a general geometric fibre the stratum of total cocenter weight `ν` is the union of products of these local strata over the distinct supports, with local labels summing to `ν`. The union of total-weight strata with `ν′≤ν` is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of `M`.

`G` split for labels; bounded quasicompact Schubert support; coefficients killed by an integer prime to `p` initially, with derived adic passage supplied by L0. The cocenter degree is the sum of the combined local cocharacters over distinct geometric supports, counted once each. At collisions the ordered-leg labels add first; the support multiplicity is not an additional weight.

Use RG’s parabolic/Levi and Iwasawa decompositions on geometric points. For the locally closed strata and their closed weight-bound unions, reduce via a faithful representation, maximal parabolics and exterior powers to an image submodule of a rank-one period module; apply lattice-relative-position-semicontinuity (FS VI.3.2), whose proof uses length-semicontinuity (VI.3.3). In that reduction use ordinary product-DVR length, as in VI.3.2, rather than the extra multiplicity weighting in the description before VI.3.1. Verify FS IV.6.1’s finite attracting/repelling decomposition on each bound. Import the diamond hyperbolic-localization theorem, base change, duality and ULA preservation from VS1; apply it to the maps of Hecke stacks.

Provide the following API.

- `constantTerm_formula`: The plus constant-term functor is q-plus pullback followed by p-plus shriek pushforward.
- `constantTerm_minus_comparison`: On bounded monodromic complexes the plus formula is naturally isomorphic to q-minus exceptional pullback followed by p-minus star pushforward.
- `constantTerm_baseChange`: The bounded hyperbolic correspondence and constant-term functor commute with the allowed leg-base and coefficient changes, compatibly with composition. Ordinary functoriality uses the supplied functor laws.

**Checks.**

- For `G=T` with identity correspondence, constant term is the identity functor.
- For split `PGL₂` on a one-leg geometric fibre and the minuscule object `Λ[1]`, shifted Borel constant terms have rank one in degree zero at the two extremal coweights and vanish at every other coweight. ([FS](#source-fs), VI.7.4, pp. 217–219; [Zhu](#source-zhu), Lemma 2.11, pp. 436–437.)
- In a two-distinct-support fibre, the torus label is the sum of the local labels; two coincident `G_m` legs labelled `(1,0)` have total label one although the product Cartier equation is `t²`. Multiplying by the support multiplicity a second time gives two and fails.


([FS](#source-fs), VI.3.1–VI.3.5, pp. 201–206.)

*Needs:* [Generic Schubert bounds](#schubert-bounds-and-properness); ReductiveGroupsPartII RG2.4; VStackSheavesAndLisseCategories VS0, `artin-v-stack-definition`; VStackSheavesAndLisseCategories VS1; [dual six-operation calculus](#supplier-calculus); AdicCoefficientsAndComparisons L0, `derived-I-complete-etale-category`; AdicCoefficientsAndComparisons L0, `adic-coefficient-limit`; AdicCoefficientsAndComparisons L0, `completed-tensor-and-colimits`; AdicCoefficientsAndComparisons L0, `six-operations-for-adic-coefficients`; VStackSheavesAndLisseCategories VS0; [Semicontinuity of lattice position](#lattice-relative-position-semicontinuity); VStackSheavesAndLisseCategories VS1, `hyperbolic-localization`; VStackSheavesAndLisseCategories VS1, `braden-theorem`; VStackSheavesAndLisseCategories VS1, `hyperbolic-base-change-duality-and-ula`.

<a id="semi-infinite-affineness"></a>

**Affine semi-infinite intersections** (`semiInfiniteBoundAffine`). On the Witt special fibre, `S_λ∩Gr_{≤μ}` is affine and perfectly finitely presented. It is the nonvanishing locus of a section of the ample determinant line on the closed weight-bound union. When nonempty, this bounded intersection is equidimensional of dimension `⟨ρ,μ+λ⟩`; the same holds for its nonempty open intersection with the exact `μ-cell`. Neither dimension formula is asserted for an empty intersection.

Split group; fixed perfect field; nonempty for the dimension assertion; integral coefficient freeness does not follow from cycle counting.

Use the faithful representation and a highest-weight determinant section to express the semi-infinite weight condition as a nonvanishing locus (VI.3.7).

([FS](#source-fs), VI.3.7–VI.3.8, pp. 205–207.)

*Needs:* [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); RelativeFarguesFontaine §§7.0–7.6; ReductiveGroupsPartII RG2.1; SchemeAndStackFoundations §§3.3, 5.3–5.4.

<a id="semi-infinite-intersections-and-mv-cycles"></a>

**Mirković–Vilonen intersections** (`mvCycleDimension`). For the rational special-fibre category over `k̄`, the top-dimensional irreducible components of the nonempty `S_λ∩Gr_μ` give the weight-cycle description of `H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ)`. The intersection dimension is `⟨ρ,μ+λ⟩`; unshifted constant coefficients on its open top-dimensional pieces occur in degree `⟨2ρ,μ+λ⟩`. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.

Rational `ℓ`-adic coefficients; IC perverse normalization `[⟨2ρ,μ⟩]`; choose model; no assertion of a canonical integral cycle basis.

Use semi-infinite dimensions and the rational concentration theorem.

**Checks.** The nonempty torus case has one component and weight dimension one.

([Zhu](#source-zhu), 2.8–2.9, pp. 434–436; A.3.3, pp. 479–480.)

*Needs:* [Affine semi-infinite intersections](#semi-infinite-affineness); [Rational special-fibre weights](#rational-weight-concentration); EtaleDualityAndPerverseSheaves §2.10; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

### Finite equivariance and recognition of ULA complexes

Deep prounipotent kernels are removed using ordinary-cohomology continuity. Constant terms detect ULA through their perfect locally constant torus pushforward. The special/generic equivalence here has one leg.

<a id="prounipotent-equivariance"></a>

**Prounipotent equivariance invariance** (`prounipotentEquivariance`). Let `H` be a group small v-sheaf over `S` with closed congruence subgroups `H^{≥m}`, complete separated filtered presentation, and, v-locally on `S`, finite filtrations of each successive quotient by affine-line diamonds of untilts. If the action on `X` factors through `H^{<m}=H/H^{≥m}`, m>0, pullback `D_ét(H^{<m}\X,Λ)→D_ét(H\X,Λ)` is an equivalence for coefficients killed by an integer prime to p. Consequently the deep congruence kernel adds no equivariance data. `H` itself need not have a finite filtration.

Closed congruence filtration as in FS VI.4.1, with the filtered spatial ball-subgroup/inverse-limit presentation used in its proof; action factors at a finite level. `Λ` is killed by `n` prime to p. The adic extension is levelwise with compatible derived coefficient limits, not an unrestricted p-torsion assertion.

Descend along `S→[H^{<m}\S]` to reduce to a trivially acting deep kernel. Use the section to reduce equivariant descent to full faithfulness of pullback on complexes. Compute ordinary cohomology `RΓ(S,A)→RΓ(S×H,A)`, using Postnikov towers, spatial ball subgroups `H_j` and their finite quotients `H_j^{<r}`. Apply Sch17a 14.9 continuity and ordinary cohomology of relative balls. Descend the equivalence through the action nerve and apply finite bounded-action factorization. Affine-space compact support is `Λ(−d)[−2d]`, so it is not unshifted acyclicity.

**Checks.** A vector group has only the trivial bounded prime-to-p equivariant local system; this fails as an unrestricted p-torsion assertion.

([FS](#source-fs), VI.4.1, pp. 207–208.)

*Needs:* [Finite truncation of bounded actions](#truncation-of-the-loop-action); [Congruence filtration of positive loops](#congruence-filtration-and-graded-pieces); [smooth diamond calculus](#supplier-calculus); DiamondSixOperations §S5.5; AdicCoefficientsAndComparisons L0, `derived-I-complete-etale-category`; AdicCoefficientsAndComparisons L0, `adic-coefficient-limit`; AdicCoefficientsAndComparisons L0, `completed-tensor-and-colimits`; AdicCoefficientsAndComparisons L0, `six-operations-for-adic-coefficients`; [dual six-operation calculus](#supplier-calculus); VStackSheavesAndLisseCategories VS1.

<a id="constant-term-conservativity"></a>

**Conservativity of constant terms** (`constantTermConservative`). For split `G` and a Borel `B`, `CT_B` is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general `G/E`.

Bounded support and monodromic/positive-loop equivariance; prime-to-p coefficients.

Use the closed semi-infinite filtration and choose an extremal nonzero stratum.

([FS](#source-fs), VI.4.2, pp. 208–209.)

*Needs:* [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Prounipotent equivariance invariance](#prounipotent-equivariance); [Galois descent of bounded modifications](#generic-galois-descent).

<a id="ula-sheaves-on-the-hecke-stack"></a>

**ULA Hecke complexes** (`ulaHeckeCategory`). `D^ULA(Hck_G/S,Λ)` is the full subcategory of complexes with bounded quasicompact Schubert support whose pullback to `Gr_G` is universally locally acyclic over `S`. Switching the two torsors preserves this condition. On one leg over Spd `O_C` this is equivalent to requiring that every open-cell restriction along a geometric section is locally constant with perfect fibre.

Support can be locally bounded on the base; a fixed bound is used in each argument. General ULA and stack formalism imported from VS1.

Use the smooth truncated positive-loop quotient charts and VS1’s ULA descent.

Provide the following API.

- `ulaHeckeCategory_finite_action`: Present bounded ULA Hecke objects by smooth finite-jet equivariant descent on the Grassmannian chart, compatibly with changing the sufficiently deep jet level. Discrete equivariant objects alone do not specify this descent category.
- `ulaHeckeCategory_forget`: Forget positive-loop equivariance to the underlying ULA object, keeping its intertwining morphisms.
- `ulaHeckeCategory_trivial_action`: When the geometric finite-jet action on the chart is trivial, pullback from the chart supplies trivial equivariant descent for a ULA object. For a nontrivial chart action require a descent isomorphism `a* A≅pr₂* A` with unit and cocycle laws.

**Checks.**

- On the minuscule `PGL₂` chart `ℙ¹` over a geometric point, a nonzero point skyscraper with perfect stalk is ULA but has no descent for the transitive finite-jet action: its support is not invariant.
- For the trivial geometric group the relative modification space is the base. Its bounded ULA complexes are perfect local systems, and the trivial action introduces no automorphism labels.
- On a geometric point with connected finite-jet group, a degree-zero perfect coefficient sheaf has only the trivial equivariant structure, and every underlying degree-zero map between two such objects descends. This does not imply ULA for sheaves whose rank jumps along the leg base. ([FS](#source-fs), Lemma VI.7.3, pp. 216–217.)
- The identity descent arrow acts identically. Even with this action, a torus coefficient sheaf supported on a proper closed subset of a connected leg base, with a rank jump at the boundary, is not ULA; equivariance alone cannot define this category.

([FS](#source-fs), VI.6.1–VI.6.5, pp. 211–214.)

*Needs:* [Prounipotent equivariance invariance](#prounipotent-equivariance); [Affine flags and Demazure spaces over Spd O_C](#affine-flag-demazure); VStackSheavesAndLisseCategories VS1, `ula-for-artin-v-stacks`; [Finite truncation of bounded actions](#truncation-of-the-loop-action); `Action`.

<a id="ula-constant-term-criterion"></a>

**ULA recognition by constant terms** (`ulaConstantTermPerfect`). For a bounded Hecke complex A, the following are equivalent: A is ULA; `CT_B` A is ULA; for every `D→Div^d` the torus constant-term pushforward over `D` is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.

Split `G` and Borel for labels; the disjoint-leg restriction is essential for the complete cell calculus.

For the forward direction, hyperbolic localization preserves ULA and proper torus pushforward on a bounded support remains ULA. For the converse, reduce to a strictly totally disconnected base and split `G`, and use the ULA diagonal-duality map of IV.2.23 on a bounded finite-dimensional quotient chart. By conservativity of CT for G×G it suffices to apply `CT_{B⁻×B}`; compatibility with exterior tensor products and hyperbolic duality IV.6.13 identifies the result with the same ULA criterion for `CT_B(A)`. The final perfect locally constant pushforward criterion uses IV.2.28. Apply the one-leg cellwise criterion VI.6.5 and its closure consequence VI.6.6 one leg at a time on the disjoint locus for VI.6.8. The arbitrary collision version of those cell-functor closure assertions is not claimed.

**Checks.**

- For `R=ℤ/4`, `H¹(R —2→ R)=R/(2)` is not projective, although the complex is perfect.


([FS](#source-fs), VI.6.4–VI.6.6, VI.6.8, pp. 212–215.)

*Needs:* [ULA Hecke complexes](#ula-sheaves-on-the-hecke-stack); [Conservativity of constant terms](#constant-term-conservativity); VStackSheavesAndLisseCategories VS1; VStackSheavesAndLisseCategories VS1, `ula-for-artin-v-stacks`; [dual six-operation calculus](#supplier-calculus); `DerivedCategory`; `Module.Finite`; `Module.Projective`; VStackSheavesAndLisseCategories VS1, `ula-dualizability-criterion`; VStackSheavesAndLisseCategories VS1, `hyperbolic-base-change-duality-and-ula`; VStackSheavesAndLisseCategories VS1, `perfect-local-systems`; VStackSheavesAndLisseCategories VS1, `ula-relative-adjoints-and-calculus`.

<a id="integral-family-comparison"></a>

**One-leg ULA special/generic comparison** (`oneLegULAComparison`). For a split integral model and one leg, restriction induces equivalences `D^ULA(Hck_{Spd O_C},Λ)≃D^ULA(Hck_{Spd C},Λ)≃D^ULA(Hck_{Spd k̄},Λ)`, compatible with finite Schubert bounds and coefficient change. The special side uses Witt models in mixed characteristic and `equalCharacteristicSchubertModels` in equal characteristic, identified with perfected scheme charts by the L1/L3 comparison; this is an actual restriction equivalence, not a formal analogy between lattice rings.

Algebraically closed complete untilt `C`; split integral model; bounded quasicompact support; prime-to-p/derived adic coefficients.

Use the cellwise locally constant perfect criterion, whose restriction over the strictly local trait is an equivalence.

**Checks.**

- For `G_m` and a fixed weight, the degree-zero unit coefficient local system restricts to the same weight-point sheaf on both fibres.
- For `GL₂` and `(1,0)`, the shifted constant sheaf `Λ[1]` on the projective-line bound restricts to `Λ[1]` on the perfected projective line, using the coefficient model for the characteristic of `E`.
- For the trivial group over Spd `O_C`, a nonzero coefficient sheaf supported only on the closed fibre has zero generic restriction and nonzero special restriction. It is not ULA and cannot be an object of this restriction equivalence.

([FS](#source-fs), VI.6.7, p. 214; VI.7.4, pp. 217–219.)

*Needs:* [ULA recognition by constant terms](#ula-constant-term-criterion); [Integral bounded Grassmannian families](#integral-family-bounded-properness); [Equal-characteristic Schubert models and coefficient comparison](#equal-characteristic-schubert-models); AdicCoefficientsAndComparisons L1, `char-p-scheme-diamond-and-comparison-functor`; AdicCoefficientsAndComparisons L3, `rf-shriek-comparison-27-4`; EtaleDualityAndPerverseSheaves §2.2; AdicCoefficientsAndComparisons L3, `full-faithfulness-27-2`; AdicCoefficientsAndComparisons L3, `commutation-and-adjoints-27-1-27-3`.

### Perverse descent and flatness

Construct the relative t-structure from the cell dimensions and geometric-fibre tests. Shifted constant terms detect its heart. Flatness requires the all-module derived tensor test and is stronger than integral perversity.

<a id="relative-perverse-t-structure"></a>

**Relative perverse t-structure** (`relativePerverse`). On the bounded-support derived category over a leg base `S`, define perverse `≤0` by the condition that at each geometric point with `r` distinct untilts and open-cell labels `μ₁,…,μ_r`, the restriction lies in ordinary degrees `≤−Σ⟨2ρ,μ_i⟩`. The opposite aisle is obtained by the glued costalk inequalities. These form a t-structure; pullback in `S` is t-exact. On ULA objects the relative condition is detected on geometric fibres.

Use distinct local factors at collisions; bounded support and locally finite Schubert stratification. Stable enhancement and presentability are imported from EDS.

Use the stable enhanced category and Lurie HA 1.4.4.11 to generate the aisle and right orthogonal.

Provide the following API.

- `relativePerverse_le`: On ULA complexes, the nonpositive aisle is detected by the normalized torus constant term in nonpositive ordinary degrees.
- `relativePerverse_ge`: On ULA complexes, the nonnegative aisle is detected by normalized torus constant term in nonnegative ordinary degrees.
- `relativePerverse_baseChange`: Identify the relative heart under every allowed base pullback, using the supplied t-structure heart rather than a second abstract heart construction.

**Checks.**

- For a torus, normalized CT is identity and relative perversity is ordinary perversity.
- For nonzero `Λ` on a nonempty smooth d-cell, `Λ[d−1]` is outside the perverse heart: its restriction is in ordinary degree `1−d`, violating the nonpositive bound. ([FS](#source-fs), VI.7.1 and VI.7.4, pp. 215, 217–219.)
- A smooth d-cell uses `Λ[d]`; normalized torus constant term is in degree zero.

([FS](#source-fs), VI.7.1–VI.7.4, pp. 215–219.)

*Needs:* [Affine semi-infinite intersections](#semi-infinite-affineness); [One-leg ULA special/generic comparison](#integral-family-comparison); EtaleDualityAndPerverseSheaves §§2.1–2.4; EtaleDualityAndPerverseSheaves §2.2; EnhancedDerivedSheaves §E0.4; EnhancedDerivedSheaves §E5:presentability.1; EnhancedDerivedSheaves §§E5:presentability.1–E5:presentability.2; `CategoryTheory.Triangulated.TStructure`; AdicCoefficientsAndComparisons L3, `full-faithfulness-27-2`; AdicCoefficientsAndComparisons L3, `commutation-and-adjoints-27-1-27-3`; EtaleDualityAndPerverseSheaves §§2.1–2.4.

<a id="perverse-descent-and-shifted-ct"></a>

**Equivariant perverse descent and constant terms** (`perverseConstantTermExact`). Pullback of perverse Hecke objects to Gr is fully faithful. For `A≤0` and `B≥0` the derived Hom is connective. Shifted `CT_B[deg⟨2ρ,−⟩]` is t-exact and conservative, and the relative t-structure commutes with base change.

Finite bounded charts and positive-loop equivariance; ordinary scheme perverse input is EtaleDualityAndPerverseSheaves §§2.1–2.4, 2.7, 2.10, 2.12, not EtaleDualityAndPerverseSheaves §§5.3, 5.5–5.6.

Use FS 7.3: for a connected cohomologically smooth map with section, `H⁰Rf_*f*A→H⁰A` is an isomorphism in the connective range.

([FS](#source-fs), VI.7.2–VI.7.4, pp. 216–219.)

*Needs:* [Relative perverse t-structure](#relative-perverse-t-structure); [Conservativity of constant terms](#constant-term-conservativity); [Finite truncation of bounded actions](#truncation-of-the-loop-action); EtaleDualityAndPerverseSheaves §2.7; AdicCoefficientsAndComparisons L3, `rf-shriek-comparison-27-4`; [Affine semi-infinite intersections](#semi-infinite-affineness); EtaleDualityAndPerverseSheaves §§2.1–2.4.

<a id="flat-perverse-objects"></a>

**Flat perverse objects** (`flatPerverse`). A perverse object A is coefficient-flat if `A⊗^L_Λ M` is perverse for every `Λ`-module `M`. Among ULA objects this is equivalent to shifted torus constant terms having finite projective fibres concentrated in degree zero. Flatness defines a full subcategory; it is not automatic for integral perverse objects.

Prime-to-p torsion rings and compatible adic systems; the ordinary tensor test uses every module, not just `Λ` itself.

Use t-exact conservative shifted CT and its compatibility with derived coefficient tensors.

Provide the following API.

- `flatPerverse_iff`: An object is flat perverse when it is in the heart and remains there after derived coefficient tensor with every `R`-module.
On the one-point torus, identify geometric coefficient flatness with the supplied `Module.Flat` predicate and its injectivity criterion.
- `flatPerverse_heart`: A flat-perverse object belongs to the Mathlib t-structure heart.

**Checks.**

- For `Λ=ℤ/4`, `p≠2`, the degree-zero point sheaf `Λ/(2)` is perverse but is not coefficient-flat: tensoring the injection `(2)↪Λ` with `Λ/(2)` kills a nonzero source. Algebraically, `¬Module.Flat Λ (Λ/(2))`. This module is also not perfect, so this test makes no ULA assertion. ([FS](#source-fs), VI.7.7, pp. 220–221.)
- On a geometric torus weight point over a coefficient field, a finite-dimensional degree-zero vector space is ULA and flat perverse.
- For `Λ=ℤ/4`, `p≠2`, on a geometric torus weight point the perfect complex `[Λ —2→ Λ]` in degrees `−1,0` is ULA but not perverse: both `H⁻¹=(2)` and `H⁰=Λ/(2)` are nonzero. It is therefore not flat perverse.


([FS](#source-fs), VI.7.7, pp. 220–221.)

*Needs:* [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); [ULA recognition by constant terms](#ula-constant-term-criterion); `Module.Flat`; `Module.Projective`; `Module.Flat.iff_lTensor_preserves_injective_linearMapₛ`; EtaleDualityAndPerverseSheaves §§2.1–2.4.

### Standard objects, torsion control and rational weights

Standard and costandard objects and their comparison map are integral constructions. Rational decomposition gives their late parity calculation and a uniform torsion exponent. Weight concentration retains the quasi-minuscule section-at-infinity contribution.

<a id="standard-costandard-objects"></a>

**Standard and costandard objects** (`standardCostandard`). For a one-leg `μ-cell` of dimension `d_μ`, `Δ_μ=pH⁰j_{μ!}Λ[d_μ]` and `∇_μ=pH⁰Rj_{μ*}Λ[d_μ]`. These objects are ULA and flat perverse, commute with base/coefficients, and Verdier duality interchanges them with Tate twist `d_μ`. The canonical map `Δ_μ→∇_μ` is retained integrally.

One-leg base, split model; IC has perverse normalization `[d_μ]`, not `[2d_μ]`.

Apply cell ULA calculus and perverse gluing.

Provide the following API.

- `standardCostandard_formula`: The standard and costandard objects are perverse `H⁰` of j-shriek and j-star of the shifted constant local system `Λ[d]`, respectively.
- `standardCostandard_map`: Adjunction gives the standard-to-costandard map; its perverse image is the IC object.
- `standardCostandard_restriction`: Both restrict to the same normalized local system on the open cell.

**Checks.**

- At the zero modification, `Δ₀=∇₀=Λ` in degree zero.
- For `GL₂` and bound `(1,0)`, both objects are `Λ[1]` on the projective line, while unshifted nonzero `Λ` is not perverse.
- For `PGL₂`, `p≠2`, `Λ=𝔽₂` and `μ` twice the minuscule coweight, the canonical map `Δ_μ→∇_μ` has a one-dimensional kernel and a one-dimensional cokernel, both supported at the zero modification. The quadratic-cone chart has exceptional curve of self-intersection `−2`, so its rank-one intersection form vanishes modulo two. ([Zhu](#source-zhu), Lemma B.10 and its preceding resolution, pp. 486–487; [FS](#source-fs), VI.7.5, pp. 219–220.)

([FS](#source-fs), VI.7.5 and VI.7.9, pp. 219–222.)

*Needs:* [Flat perversity](#flat-perverse-objects); [ULA recognition by constant terms](#ula-constant-term-criterion); [Relative perverse t-structure](#relative-perverse-t-structure); EtaleDualityAndPerverseSheaves §2.7; [dual six-operation calculus](#supplier-calculus); EtaleDualityAndPerverseSheaves §§2.1–2.4.

<a id="demazure-fibre-affine-stratification"></a>

**Affine stratifications of Demazure fibres** (`demazureFibreAffineStratification`). Over an algebraically closed perfect residue field, every geometric fibre of a reduced-word Iwahori Demazure resolution of a Witt affine Schubert variety has a finite stratification by perfections of affine spaces. Retain the length-zero factor `ω` in the endpoint map. Construct the strata by rank-one Bruhat induction through the minimal-parahoric quotients. The equal-characteristic resolutions of `equalCharacteristicSchubertModels` have the corresponding affine stratifications. This target owns the geometric stratifications; rational proper decomposition is supplied by EtaleDualityAndPerverseSheaves §5.6 on fixed finite models descended to a finite field.

The fibres are proper, so affine strata give compactly supported, and hence ordinary, rational cohomology concentrated in even degrees. Apply decomposition to the smooth Demazure source on a finite model to obtain the IC stalk parity used by `standardCostandardBoundedTorsion`; no integral decomposition theorem is asserted.

**Checks.**

- With no simple-reflection steps, the sole nonempty fibre is the point over `ω`, including nonzero torus translations.
- For one simple reflection the resolution is the perfected projective line mapping isomorphically to its Schubert variety; its nonempty fibres are points.
- In the finite Weyl subgroup of split `SL₃`, the reduced word `s₁s₂s₁` has fibre `ℙ¹` over the standard flag. Its perfected affine stratification has a line and a point, giving nonzero rational cohomology in degrees zero and two.

([Zhu](#source-zhu), §1.4.2 and proof of Lemma 2.1, pp. 426–427, 430; [FS](#source-fs), proof of VI.7.5, pp. 219–220; [PR](#source-pr), §8.c, Proposition 8.8, pp. 38–39.)

*Needs:* [Witt affine flags and components](#parahoric-ind-projectivity); [Equal-characteristic Schubert models and coefficient comparison](#equal-characteristic-schubert-models); ReductiveGroupsPartII RG2.4; SchemeAndStackFoundations §§0.24–0.26; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="standard-costandard-torsion-bound"></a>

**Rational parity and integral torsion bounds** (`standardCostandardBoundedTorsion`). For fixed `μ`, `Δ_μ→∇_μ` is an isomorphism after rationalization, and over `Z_ℓ` its kernel and cokernel are killed by some `ℓ^a` uniformly under base change. The rational special-fibre equivariant perverse category is semisimple with simple `IC_μ` indexed by dominant coweights and constant equivariant local systems.

Rational statement requires decomposition/parity and connected stabilizers; the integral category is not semisimple.

Use `demazureFibreAffineStratification` for the geometric parity input, with Witt models in mixed characteristic and `equalCharacteristicSchubertModels` in equal characteristic. Import EtaleDualityAndPerverseSheaves §§5.3, 5.5–5.6’s rational purity, geometric semisimplicity and proper direct-image decomposition on fixed finite models. Pass through the smooth affine-flag cover to obtain Grassmannian IC stalk parity `d_μ`; boundary Schubert dimensions have the same parity, so its boundary restriction lies in perverse degrees `≤−2`. This gives rational standard–costandard equality. Integral constructibility and coefficient comparison then give the uniform torsion exponent.

**Checks.**

- For a torus weight point, the comparison is the identity over `ℤ_ℓ`, so exponent `a=0` suffices.
- For `PGL₂` and twice the minuscule coweight, the quadratic cone has rational IC stalk parity even and the rational comparison is an isomorphism, despite its singular zero modification.
- For the same bound with `p≠2`, the canonical map in the characteristic-two rank-one Check in [standard and costandard objects](#standard-costandard-objects) has nonzero kernel and cokernel, preventing a uniform exponent zero at `ℓ=2`; rational equality does not imply integral semisimplicity.

([FS](#source-fs), VI.7.5 end and proof, pp. 219–220; [Zhu](#source-zhu), Lemma 2.1 and its proof, printed pp. 429–430.)

*Needs:* [Standard and costandard objects](#standard-costandard-objects); [Affine stratifications of Demazure fibres](#demazure-fibre-affine-stratification); [Equal-characteristic Schubert models and coefficient comparison](#equal-characteristic-schubert-models); EtaleDualityAndPerverseSheaves §5.6; ReductiveGroupsPartII RG2.3; [Perfect models and étale realization](#perfect-model-and-etale-comparison); `PadicInt`.

<a id="rational-weight-concentration"></a>

**Rational special-fibre weights** (`rationalWeightsFinite`). For rational equivariant perverse A on the Witt Grassmannian, `H_c^i(S_λ,A)=0` unless `i=⟨2ρ,λ⟩`. The resulting weight functors are exact. For `μ` minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule `μ` the zero-weight multiplicity is the number of simple coroots of `G` in the Weyl orbit of the quasi-minuscule coweight (the short simple coroots); equivalently count the corresponding simple roots of the dual root system. General concentration follows by generation from minimal convolutions.

`k` algebraically closed; rational coefficients only; CT normalization uses compact support.

Use Zhu 2.11’s minuscule flag and quasi-minuscule parahoric `P¹` resolution; retain the section-at-infinity term missing in 2.2.13.

**Checks.** For the `SL₃` highest root, the zero-weight dimension is two; the missing infinity contribution would give the wrong answer.

([Zhu](#source-zhu), 2.7 and 2.11–2.17, pp. 434, 436–440.)

*Needs:* [Affine semi-infinite intersections](#semi-infinite-affineness); [Affine flags and Demazure spaces over Spd O_C](#affine-flag-demazure); [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); EtaleDualityAndPerverseSheaves §2.12; ReductiveGroupsPartII RG2.4.


### Examples

For two coincident degree-one untilts, `ξ=t²`, and `f=ξ^a` has divisor length `2a`. The lattice belonging to two `G_m` labels `(1,0)` is instead `tB⁺` of total position one: a second weighting by the number of coincident legs is incorrect. On a point with coefficient ring `ℤ/4`, the perfect two-term complex `R —2→ R` has nonprojective cohomology `R/(2)`; ULA perfection is a derived condition. Flat perversity supplies the extra projectivity used by Satake.

### Dependencies

GS0, RelativeFarguesFontaine §§3.8, 4.12–4.13; VStackSheavesAndLisseCategories VS0–VS1; DiamondSixOperations S2–S5; EnhancedDerivedSheaves E0, E3, E5; AdicCoefficientsAndComparisons L0–L1, L3; EtaleDualityAndPerverseSheaves §§2.1–2.12, 3.1–3.3, 5.3, 5.5–5.6.

## Layer GS2: Satake categories, convolution and rigidity

### The flat exact category and total cohomology

Intersect bounded ULA complexes with flat perversity. Total cohomology is finite projective and faithful, using the split-kernel argument as well as conservation. Its semi-infinite filtration need not split canonically.

<a id="satake-category-and-fibre-functor"></a>

**Satake category** (`satakeCategory`). `Sat^I_G(S,Λ)` is the full subcategory of the bounded-support Hecke derived category consisting of ULA, relative perverse, coefficient-flat objects. Equivariance is encoded by the Hecke stack. Pullback to Gr is fully faithful and the switch involution preserves the category. The category is additive and exact under sequences whose terms remain flat; it is not asserted to be abelian.

Split integral or generic descended setting; all three conditions are required.

Intersect the ULA subcategory with the relative perverse heart and the all-module flatness condition.

Provide the following API.

- `satakeCategory_full_subcategory`: Satake is the full subcategory of the supplied bounded ULA category whose underlying object is flat perverse.
- `satakeCategory_inclusion`: The full-subcategory inclusion forgets only the Satake flat-perverse condition and is fully faithful.
- `satakeCategory_morphisms`: A Satake morphism is the same underlying ULA morphism; no separate morphism condition is imposed.

**Checks.**

- Over `Λ=ℤ/4` with `p≠2`, the degree-zero point object `Λ/(2)` is excluded from Satake by coefficient nonflatness; it also fails ULA perfection. Perversity alone does not imply Satake membership. ([FS](#source-fs), VI.7.7–VI.7.8, pp. 220–221.)
- For the trivial group and the unit over a geometric base, its endomorphism ring in Satake and in ULA is the coefficient ring. Passing to isomorphism classes would destroy these morphisms and fail full faithfulness.
- For the trivial group on a geometric point and nonzero `Λ`, the perfect complex `Λ[1]` is ULA and is excluded from Satake by its nonzero degree.


([FS](#source-fs), VI.7.8–VI.7.9, pp. 221–222.)

*Needs:* [ULA Hecke complexes](#ula-sheaves-on-the-hecke-stack); [Flat perversity](#flat-perverse-objects); [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); `CategoryTheory.Triangulated.TStructure.Heart`; `CategoryTheory.ObjectProperty.FullSubcategory`.

<a id="satake-fibre-functor"></a>

**Satake cohomology functor** (`satakeFibre`). `F^I(A)=⊕_i H^iRπ_*(A|Gr^I_G)` is a locally constant sheaf of finite projective `Λ`-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not give a canonical splitting or a switch-invariant tensor identification. If ker `F(f)→F(A)` is split, `f:A→B` has a kernel in Satake and `F` preserves it; if `F(B)→coker` `F(f)` is split, the analogous cokernel exists and is preserved. These split conditions are essential over integral coefficients and do not make Satake abelian.

Bounded support; A Satake; locally constant finite projectivity is part of the result.

Use proper support, CT filtration and flat-perverse recognition. On each connected component of `Gr_G`, the shifted constant-term graded pieces of a Satake object are concentrated in degrees of the same parity. Hence the finite filtration spectral sequence degenerates. The graded cohomology modules are finite projective, so successive module extensions split locally and give finite-projective cohomology and exactness; this argument does not claim a canonical splitting. For a morphism with a split total-cohomology kernel, the constant-term filtration identifies its perverse kernel as ULA and flat; apply the split-kernel clause of VI.7.10, and its analogous split-cokernel clause. For `F(f)=0` the kernel is all `F(A)`, hence split: conservation makes the kernel map an isomorphism, proving `f=0` and faithfulness. Keep the filtration until GS3 tensor comparison.

For the algebraic direct-sum interface, specify a finite set of cohomological degrees, zero modules outside it, and finite projectivity in each degree. Specify joint faithfulness of the degreewise functors to deduce faithfulness of their sum. The geometric argument above proves these inputs for Satake objects; neither conclusion holds for an arbitrary family of module-valued functors.

Provide the following API.

- `satakeFibre_cohomology`: The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero.
- `satakeFibre_finite_projective`: The total cohomology module is finite and projective over the coefficient ring.
- `satakeFibre_faithful`: FS VI.7.10’s split-kernel lifting together with conservativity proves faithfulness; do not infer faithfulness from conservativity alone in an exact category.
- `satakeFibre_kernel`: If ker `F(f)→F(A)` is a split inclusion, `f` has a Satake kernel and `F` carries its universal cone to the module kernel.
- `satakeFibre_cokernel`: If `F(B)→coker` `F(f)` is a split projection, `f` has a Satake cokernel and `F` carries its universal cocone to the module cokernel.

**Checks.**

- A torus skyscraper with one rank-one cohomology module has total cohomology `R`.
- If all cohomology modules vanish, total cohomology is the zero module.
- A finite filtration with finite-projective shifted weight pieces has finite-projective total cohomology over the same coefficient ring. Replacing a weight piece by `ℤ/2` over `ℤ` fails projectivity, so finite generation by itself is insufficient.
- One `ℚ` in every integer degree has infinite-dimensional direct sum despite degreewise finite projectivity.


([FS](#source-fs), VI.7.10–VI.7.11, pp. 222–223.)

*Needs:* [Satake category](#satake-category-and-fibre-functor); [Conservativity of constant terms](#constant-term-conservativity); [Flat perversity](#flat-perverse-objects); [proper pushforward calculus](#supplier-calculus); DiamondSixOperations §S2.4; `Module.Projective`; AdicCoefficientsAndComparisons L0, `rational-constructible-coefficients`; `Module.Finite`; EtaleDualityAndPerverseSheaves §§2.1–2.4.

<a id="satake-verdier-duality"></a>

**Verdier duality of Satake objects** (`satakeVerdierBiduality`). Relative Verdier duality preserves Satake, the biduality map `A→D(D(A))` is an isomorphism, and F(D(A)) identifies with the `Λ`-linear dual of `F(A)`. Normalized Levi constant terms `CT_P[deg⟨2ρ_G−2ρ_M,−⟩]` preserve Satake and are transitive for nested Levis.

ULA, flat perverse and bounded proper support; the normalization depends on the chosen parabolic.

Use ULA dualizability and biduality from VS1.

([FS](#source-fs), VI.7.12–VI.7.13, pp. 223–224.)

*Needs:* [Cohomology](#satake-fibre-functor); [Flat perversity](#flat-perverse-objects); VStackSheavesAndLisseCategories VS1; VStackSheavesAndLisseCategories VS1, `ula-for-artin-v-stacks`; [dual six-operation calculus](#supplier-calculus); ReductiveGroupsPartII RG2.1; VStackSheavesAndLisseCategories VS1, `ula-dualizability-criterion`; VStackSheavesAndLisseCategories VS1, `hyperbolic-base-change-duality-and-ula`; VStackSheavesAndLisseCategories VS1, `ula-relative-adjoints-and-calculus`.

### Proper correspondences and rational semismallness

Convolution descends the twisted external product through the intermediate torsor. Common higher-step modification stacks supply coherent associativity and units. Rational semismallness is stated on bounded Witt convolution spaces.

<a id="convolution-diagram"></a>

**Ambient Hecke convolution** (`heckeConvolution`). The two-step Hecke stack has maps `a:Hck×^{L⁺G}Hck→Hck×Hck` (an `L⁺G-torsor)` and `b` to Hck (composition of modifications). On bounded support `b` is ind-proper with proper finite bounds. Define `A⋆B=Rb_*a*(A⊠B)`, equivalently `Rb_`! for those bounds. Composition in the enhanced correspondence 2-category and Ind-extension give a coherent ambient monoidal structure with the unit supported on the trivial modification.

Use the stack quotient, not a naive product; derived external tensor over `Λ`; bounds required for pushforward. General correspondence coherence is supplied by EDS and VS0.

Build the stack of three torsors and two punctured isomorphisms; multiplication composes them.

Provide the following API.

- `heckeConvolution_obj`: `A⋆B` is b-star of a-pullback of the derived external product of A and `B`, with `b` proper on the chosen bounds.
- `heckeConvolution_associator`: The coherent correspondence calculus supplies the associator for convolution.
- `heckeConvolution_unit`: The unit is the identity-modification kernel and its left and right unit maps are isomorphisms.
- `torusConvolutionLabels`: On a torus, convolution support is the Minkowski sum of the two finite coweight supports.

**Checks.**

- Convolving with the identity kernel returns the other kernel.
- For a torus, two skyscraper labels convolve to the skyscraper at their sum.
- `A⋆B=b_*a*(A⊠B)`; omitting either a* or `b_*` fails this formula.

([FS](#source-fs), VI.8 opening, pp. 224–225.)

*Needs:* [Satake category](#satake-category-and-fibre-functor); [Local Hecke stack](#local-hecke-stack); [Integral bounded Grassmannian families](#integral-family-bounded-properness); [Relative-position flag correspondences](#flag-incidence-correspondences); [dual six-operation calculus](#supplier-calculus); [proper pushforward calculus](#supplier-calculus); DiamondSixOperations §S2.4; VStackSheavesAndLisseCategories VS0, `artin-v-stack-definition`; EnhancedDerivedSheaves §E5:presentability.1; EnhancedDerivedSheaves §§E3.1–E3.4; VStackSheavesAndLisseCategories VS0; DiamondSixOperations §S2.4.

<a id="convolution-associativity-and-unit"></a>

**Associativity and unit of convolution** (`convolutionPentagon`). Iterated composition supplies associator `(A⋆B)⋆C≅A⋆(B⋆C)`, left/right unit isomorphisms, and the pentagon and triangle identities in the ambient bounded-support category, compatible with coefficient and base change when the six operations are defined.

Enhanced coherence, rather than equality of iterated objects; proper finite bounds and derived tensors.

Use the common three-step Hecke stack and proper base-change/projection-formula isomorphisms.

([FS](#source-fs), VI.8 opening, pp. 224–225.)

*Needs:* [Ambient Hecke convolution](#convolution-diagram); EnhancedDerivedSheaves §§E3.1–E3.4; [dual six-operation calculus](#supplier-calculus); DiamondSixOperations §S2.4; VStackSheavesAndLisseCategories VS0.

<a id="rational-special-fibre-convolution"></a>

**Rational Witt convolution and semismallness** (`rationalConvolutionSemismall`). On the rational Witt special fibre, the n-fold unbounded convolution Grassmannian is identified with `Gr^n` by cumulative modifications, but a bounded convolution locus is a twisted product. The bounded multiplication map to `Gr_{≤Σμ_i}` is proper and stratified semismall: over the `λ-stratum` fibre dimension is `≤⟨ρ,Σμ_i−λ⟩`. Hence twisted convolution of rational equivariant perverse sheaves is perverse.

`k` algebraically closed; dominant bounds; rational coefficients; no integral coefficient-flatness inferred from this statement.

Use the lattice-chain Demazure and bounded proper map.

**Checks.** For minuscule one-step bounds, twisted convolution still need not be the product of the two flag varieties.

([Zhu](#source-zhu), 2.1.2 and 2.2–2.4, pp. 431–432.)

*Needs:* [Ambient Hecke convolution](#convolution-diagram); [Rational special-fibre weights](#rational-weight-concentration); [Witt Demazure filtration space](#witt-demazure-resolution); EtaleDualityAndPerverseSheaves §2.12; AdicCoefficientsAndComparisons L3, `rf-shriek-comparison-27-4`.

### Perverse closure, duals and one-leg comparison

ULA preservation and elementary two-leg collision estimates prove convolution closure before symmetric fusion. Relative kernel adjunction then gives both duals. The one-leg fibre equivalence respects these actual correspondences.

<a id="convolution-ula"></a>

**ULA preservation by convolution** (`convolutionULAKernelDual`). If A and `B` are ULA bounded Hecke complexes, `A⋆B` is ULA over the leg base.

Finite proper bounds; derived tensor; split and generic descended versions.

Use VStackSheavesAndLisseCategories §VS1.2’s ULA criterion as adjointability of kernels, including the proper-relative IV.2.24 variant.

([FS](#source-fs), VI.8.1(i), p. 225.)

*Needs:* [Ambient Hecke convolution](#convolution-diagram); VStackSheavesAndLisseCategories VS1, `ula-for-artin-v-stacks`; VStackSheavesAndLisseCategories VS1; [dual six-operation calculus](#supplier-calculus); [proper pushforward calculus](#supplier-calculus); DiamondSixOperations §S2.4; VStackSheavesAndLisseCategories VS1, `kernel-correspondence-category`; VStackSheavesAndLisseCategories VS1, `ula-relative-adjoints-and-calculus`.

<a id="convolution-perverse-nonpositive"></a>

**Nonpositive perverse convolution** (`convolutionPerverseNonpositive`). For any bounded Hecke complexes A,B in relative perverse degrees `≤0`, `A⋆B` is perverse `≤0`. First reduce by ordered collision-stratum excision and cell devissage to shifted cell constants with ULA factors. For those generators an elementary two-leg family is an external product away from the diagonal; locally constant perfect torus constant terms carry the nonpositive bound to the collision fibre. This is FS VI.8.1(ii), before VI.9 symmetric fusion.

Coefficient derived tensor and correct cell dimensions; this elementary family is distinct from the coherent symmetric fusion construction of VI.9.

Use ordered legs, partial-diagonal excision and the defining cell inequalities to reduce the arbitrary bounded inputs to shifted cell constants. Their one-leg ULA property is supplied by VI.6.5.

**Checks.** A collision is tested by summed cocharacters; the proof has a geometric family but not a symmetric monoidal Satake theorem.

([FS](#source-fs), VI.8.1(ii), pp. 225–226.)

*Needs:* [ULA preservation by convolution](#convolution-ula); [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); [Ordered legs and divisor base change](#ordered-leg-base-change); [Integral bounded Grassmannian families](#integral-family-bounded-properness); [ULA Hecke complexes](#ula-sheaves-on-the-hecke-stack); [ULA recognition by constant terms](#ula-constant-term-criterion).

<a id="convolution-preserves-satake-and-dualizability"></a>

**Closure of Satake under convolution** (`convolutionFlatPerverse`). Convolution of two Satake objects is Satake: it remains ULA, relative perverse and coefficient-flat. Derived tensors against arbitrary coefficient modules remain perverse, so the operation restricts to the flat subcategory.

All Satake conditions retained; coefficients need not be fields.

ULA follows from VI.8.1(i). Apply the nonpositive result to A,B and their relative Verdier duals.

([FS](#source-fs), VI.8.1(iii), pp. 225–226.)

*Needs:* [ULA preservation by convolution](#convolution-ula); [Nonpositive perverse convolution](#convolution-perverse-nonpositive); [Verdier duality of Satake objects](#satake-verdier-duality); [Flat perversity](#flat-perverse-objects).

<a id="satake-rigidity"></a>

**Duals of Satake objects** (`satakeRigid`). Every Satake object has both left and right duals for convolution. The right dual is `sw*D(A)`; evaluation and coevaluation come from the adjunction of proper relative ULA kernels and satisfy the two triangle identities. Switching gives the other dual.

Proper bounded support; ULA; use both left and right rigid structures in the library. No symmetry or fibre-functor monoidality is assumed.

Apply FS IV.2.24 to the bounded Hecke kernel, using the proper target.

([FS](#source-fs), VI.8.2, p. 226; IV.2.24, pp. 125–126.)

*Needs:* [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); [Verdier duality of Satake objects](#satake-verdier-duality); VStackSheavesAndLisseCategories VS1; `CategoryTheory.RigidCategory`; VStackSheavesAndLisseCategories VS1, `kernel-correspondence-category`; VStackSheavesAndLisseCategories VS1, `ula-relative-adjoints-and-calculus`.

<a id="modular-rank-one-convolution"></a>

**Coefficient-independent minuscule convolution cycles** (`modularRankOneConvolution`). For the split group `PGL₂`, every `ℓ≠p`, and every even `n≥0`, construct the `n`-step minuscule convolution resolution as a smooth iterated perfected `ℙ¹`-bundle of dimension `n`. Its multiplication to the bound of the sum of the minuscule coweights is proper and semismall. The fibre over the zero modification has dimension at most `n/2`. Prove that proper duality identifies `Hom(1,B₁^{⋆n})` with degree-`n` Borel–Moore homology of that fibre, with the dimension and Tate normalization fixed by the convolution correspondence. Its top-dimensional irreducible components give a basis over every allowed coefficient ring. In particular the `𝔽₂` dimension equals the characteristic-zero dimension when `p≠2`. The intended signature includes a canonical cycle-to-Hom isomorphism commuting with coefficient reduction, rather than only a numerical equality. This strengthens rational semismallness; it is used by integral rank-one identification and is independent of that identification. ([Zhu](#source-zhu), Proposition 2.3 and Remark 2.4, p. 432, for semismallness; [FS](#source-fs), VI.8.2 and the rank-one argument in VI.11.1, pp. 225–226, 236–237, for the duality and comparison.) Provide the cycle class, duality comparison, top-cycle basis and coefficient-change APIs.

**Checks.**

- At `n=0` the fibre is a point and `Hom(1,1)` is the coefficient ring.
- At `n=2` the zero fibre is `ℙ¹` and its top cycle gives one invariant, including modulo `2`.
- At `n=4` there are two top components and two invariants. The three invariants of the torus normalizer in characteristic two fail this comparison and therefore cannot be the reconstructed group.

*Needs:* [Rational Witt convolution](#rational-special-fibre-convolution) (the geometric proper and semismall calculation); [Ambient Hecke convolution](#convolution-diagram); [Duals of Satake objects](#satake-rigidity); EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §§1.1, 2.12; [Perfect models](#perfect-model-and-etale-comparison).

<a id="one-leg-satake-comparison"></a>

**One-leg Satake equivalence** (`oneLegSatakeComparison`). The one-leg ULA restriction equivalence over Spd `O_C` restricts to equivalences of flat-perverse Satake categories on the generic and special fibres, using Witt models in mixed characteristic and `equalCharacteristicSchubertModels` in equal characteristic. The functors commute with coefficient change, finite bounds and bounded convolution diagrams and carry the unit and the convolution duals to their corresponding objects.

Split integral model; chosen `C` and `k̄`; the comparison is not asserted for arbitrary multi-leg collision ULA categories.

Use t-exact base change and the all-module tensor criterion on the ULA equivalence.

**Checks.**

- For `G_m` and any weight, a degree-zero finite-projective coefficient module gives corresponding Satake objects on both fibres; convolution adds the weights.
- For `GL₂` and `(1,0)`, the comparison carries `Λ[1]` on the projective-line bound to `Λ[1]` on its perfected special fibre, preserving flat perversity.
- For `PGL₂`, `p≠2` and `Λ=𝔽₂`, the comparison carries the canonical [standard-to-costandard map](#standard-costandard-objects) to the corresponding special-fibre map, with its nonzero point-supported kernel and cokernel. It preserves this failure of standard–costandard equality.

([FS](#source-fs), VI.6.7, VI.7.4–VI.7.8 and VI.8, pp. 214, 217–226.)

*Needs:* [One-leg ULA special/generic comparison](#integral-family-comparison); [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); [Duals of Satake objects](#satake-rigidity); [Associativity and unit of convolution](#convolution-associativity-and-unit); AdicCoefficientsAndComparisons L3, `rf-shriek-comparison-27-4`; AdicCoefficientsAndComparisons L3, `full-faithfulness-27-2`; AdicCoefficientsAndComparisons L3, `commutation-and-adjoints-27-1-27-3`.


### Examples

For a split torus, skyscrapers at weights `λ` and `μ` convolve to weight `λ+μ`; convolution with the zero modification gives back the same sheaf. In the `PGL₂` two-step minuscule convolution the zero fibre is `ℙ¹`, giving one top cycle over every allowed coefficient ring. At four steps there are two top cycles, the coefficient-independent count used by integral rank-one identification. These examples use the actual twisted convolution correspondence.

### Dependencies

GS0–GS1; EnhancedDerivedSheaves E3, E5; VStackSheavesAndLisseCategories VS0–VS1; DiamondSixOperations S2–S3; EtaleDualityAndPerverseSheaves §§1.1, 2.12; AdicCoefficientsAndComparisons L3; EtaleCohomologyFoundations F.5–F.6.

## Layer GS3: Fusion and symmetric tensor structure

The following standing hypotheses apply throughout GS3 and GS4. `E` is a nonarchimedean local field with residue field `F_q` of characteristic `p`; `G/E` is connected reductive. For torsion coefficients `Λ` is killed by an integer prime to p. The `ℓ`-adic extension uses a fixed prime `ℓ ≠ p` and its compatible reductions. Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

Fix `k=overline(𝔽_q)` with its coefficient embedding and work on `Perf_k`.
Pull the generic divisor spaces, ordered divisor products, Grassmannians and
Hecke stacks of GS0–GS2 to this site, and form their Satake categories there.
Throughout GS3–GS4, `Div¹_X` and `Div¹` denote this pullback; every product,
diagonal and disjoint-leg locus is relative to `Spd k`, including
`(Div¹_X)^∅=Spd k`. For no legs the Grassmannian and Hecke stack are the unit
modification over `Spd k`, and `Sat^∅_G(Λ)` is finite projective `Λ`-modules.
Use the geometric branch of RelativeFarguesFontaine §4.7:
`Div¹≃Spd Ĕ/φ^ℤ`, `Ĕ=W_OE(k)[1/π]`, and the divisor-to-Weil map of
VStackSheavesAndLisseCategories VS1.5 on this same base. Its Frobenius-twisted
Weil action is over `k`; the resulting `W_E`-action is retained. Frobenius
descent to a finite-field model is additional data in the trace comparison.
([FS](#source-fs), opening of VI.9, p. 226; IV.7, pp. 164–166.)

### Disjoint blocks, extension and the parity sign

Restriction away from cross-block collisions is fully faithful on the stated categories. This determines fusion comparisons uniquely, while the component parity corrects the graded cohomological flip.

<a id="disjoint-leg-locus"></a>

**Disjoint-leg locus** (`disjointLegLocus`). For a finite set `I` partitioned by `b:I→K`, define `U_b ⊂ (Div¹_X)^I` over `Spd k` by `x_i ≠ x_j` whenever b(i) `≠` b(j). It allows coincidences inside one block. Pull the local Hecke stack and Satake category over `Perf_k` back to `U_b`; denote restriction by `j_b*`. On `U_b`, completion along the union of block divisors is the product of the block completions, giving the factorization of Grassmannians and local Hecke stacks.

Use the divisor product equation and invertibility of distinct divisor ideals to split the completed rings, then the loop quotient and torsor descriptions.

Provide the following API.

- `disjointLegLocus`: For `b:I→K` and `X=Div¹_X`, `U_b` is the subfunctor of `X^I` satisfying the cross-block inequality.
- `disjointLegLocus_mem`: A geometric tuple `x` lies in `U_b` iff `b(i)≠b(j)` implies `x_i≠x_j` for all i,j.
- `disjointLegLocus_reindex`: A bijection of leg sets carries `U_b` to `U_{b∘e}`, compatibly with identity and composition.
- `disjointLegLocus_baseChange`: Pullback of `U_b` under `S→(Div¹_X)^I` is precisely the same cross-block condition on `S`.

**Checks.**

- A constant block map gives `U_b=X^I`.
- For two singleton blocks, `U_b={(x,y):x≠y}`.
- For blocks {1,2},{3}, (x,x,y) with `x≠y` is allowed.
- For `I=∅`, the condition is vacuous and `U_b=Spd k`.


([FS](#source-fs), VI.9 pp226–227; VI.0 p189.)

*Needs:* RelativeFarguesFontaine §3.5; RelativeFarguesFontaine §4.7; [Loop spaces](#loop-groups-and-local-hecke); [Ordered legs and divisor base change](#ordered-leg-base-change); [Local Hecke stack](#local-hecke-stack).

<a id="disjoint-leg-factorization-and-full-faithfulness"></a>

**Restriction across collision diagonals** (`restriction_fullyFaithful`). For the blockwise disjoint inclusion `j_b`, restriction `j_b*:Sat^I_G(Λ)→Sat_G(U_b,Λ)` is fully faithful, and so is restriction of finite projective local systems on the leg base. Every Satake object satisfies A `≅ pH⁰(Rj_b*j_b*A)`. This is uniqueness and reconstruction for objects already extending; full faithfulness alone asserts no essential surjectivity.

Filter the complement by smooth partial diagonals of positive `ℓ-codimension`. Purity makes their i*i! on locally constant perfect complexes lie in degrees `≥2`.

**Checks.** For two legs the diagonal has codimension one and contributes starting in degree two. A codimension-zero closed component would invalidate the argument; arbitrary restrictions of arbitrary categories are not fully faithful.

([FS](#source-fs), Proposition VI.9.3 pp227–228.)

*Needs:* [Disjoint-leg locus](#disjoint-leg-locus); [Relative perverse t-structure](#relative-perverse-t-structure); [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Satake category](#satake-category-and-fibre-functor); VStackSheavesAndLisseCategories VS1; [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct).

<a id="support-parity"></a>

**Satake support parity** (`supportParity`). The parity of a Schubert tuple `μ•` is `ε(μ•)=Σ_i⟨2ρ,μ_i⟩` mod 2 in Z/2. Differences along dominance are sums of coroots, whose pairing with `2ρ` is even, so parity is constant on a connected-component stratum and defines an open-and-closed even/odd decomposition of the local Hecke stack. For mixed-parity objects use their canonical summands. The correction scalar for homogeneous A,B is `(-1)^{ε(A)ε(B)}`.

Use `⟨2ρ,α∨⟩=2` for each simple coroot and dominance differences to prove constancy on closure relations.

For any two finite integer dimension families whose pointwise differences are even, the sums have the same parity. The geometric theorem proves this evenness from the coroot pairing and identifies the resulting clopen decomposition. The correction scalar is `−1` exactly when both parities are odd, and `+1` otherwise.

Provide the following API.

- `supportParity`: The degree sum reduced modulo two, equivalently the dimension parity on each component.
- `supportParity_dominance`: Comparable dominant Schubert tuples have equal parity.
- `supportParity_union`: Parity on a disjoint union is the sum of the two parities in Z/2.
- `fusionSign`: For `e,f∈Z/2`, the integer correction is `(-1)^{ef}`; it is a bicharacter.
- `fusionSign_unit`: Both signs involving zero are one.
- `fusionSign_add_left`: `fusionSign(e+f,g)=fusionSign(e,g)·fusionSign(f,g)`.
- `fusionSign_add_right`: `fusionSign(e,f+g)=fusionSign(e,f)·fusionSign(e,g)`.

**Checks for support parity.**

- The zero-cocharacter unit has parity zero, for every finite leg set.
- A one-leg tuple retains its integer dimension modulo two.
- Two odd-dimensional legs have even total parity.

**Checks for the fusion sign.**

- The unit has trivial correction in both tensor slots.
- Addition in the first parity slot gives the tensor-coherence law in that slot.
- Addition in the second parity slot gives the other tensor-coherence law.
- In any coefficient field of characteristic two, the scalar image of every integer correction is one, including the odd/odd case.


([FS](#source-fs), VI.9 pp228–229.)

*Needs:* ReductiveGroupsPartII RG2.5; [Generic Schubert bounds](#schubert-bounds-and-properness); `RootPairing`.

<a id="fusion-product-and-sign-rule"></a>

**Fusion product and ordinary symmetry** (`fusionProduct`). For blocks `I=⊔_a I_a` and `A_a∈Sat^{I_a}_G(Λ)`, use the chain of modifications `E_0→⋯→E_k`, projections `p_a` to the a-th modification and composition `m`. Define the fusion object `*_{a}A_a=Rm_*(⊗_a p_a*A_a)`. The construction is ULA, bounded and flat perverse and restricts to `⊠_a A_a` on `U_b`. It is independent of the order by full faithfulness. Pull back along the duplicated-leg diagonal to obtain the tensor product on `Sat^I`. Modify its geometric commutativity by `(-1)^{ε(A)ε(B)}`. This gives a symmetric monoidal structure refining the existing convolution, with total cohomology `F^I` strong symmetric monoidal into ordinary, ungraded finite projective Weil representations.

Construct the proper chain-composition correspondence, whose restriction to disjoint blocks is an isomorphism. ULA stability comes from the IV.2 correspondence criterion. Apply constant terms: their total pushforward is locally constant perfect and agrees on the disjoint locus with the degree-zero finite-projective exterior product. Density and VI.7.7 imply flat perversity. Use VI.9.3 for uniqueness of associativity, commutativity and unit comparisons; all relations hold after disjoint restriction. Total cohomology carries the geometric flip to the graded Koszul flip. The component correction cancels that sign and preserves hexagon, involution and unit laws.

Provide the following API.

- `fusionProduct`: The proper chain-composition pushforward for a finite ordered partition.
- `fusionProduct_restrict`: Its restriction to `U_b` is canonically the exterior tensor product.
- `fusionTensor`: Duplicate legs and diagonal pullback give the internal tensor, canonically isomorphic to convolution.
- `fusionBraiding`: Geometric block permutation multiplied on homogeneous summands by `(-1)^{ε(A)ε(B)}`.
- `fibreFusionIso`: `F(A*B)` `≅ F(A)⊗F(B)`, respecting the ordinary symmetry, unit and associativity constraints.

**Checks.**

- Fusion with the unit is isomorphic to the original object.
- On distinct divisors fusion is the exterior product, with no diagonal extension summand.
- On odd/odd objects `F` sends corrected braiding to the ordinary flip; uncorrected braiding is its negative if 2 is invertible.


([FS](#source-fs), `Definition/Proposition` VI.9.4 pp228–230.)

*Needs:* [Restriction across collision diagonals](#disjoint-leg-factorization-and-full-faithfulness); [Satake support parity](#support-parity); [Ambient Hecke convolution](#convolution-diagram); [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); VStackSheavesAndLisseCategories VS1, `ula-dualizability-criterion`; [Satake category](#satake-category-and-fibre-functor); `CategoryTheory.SymmetricCategory`; `CategoryTheory.Functor.Braided`; [Cohomology](#satake-fibre-functor); [Associativity and unit of convolution](#convolution-associativity-and-unit).

### Finite sets, Weil realization and duality

Collision maps merge fibres of finite sets and insert units for empty fibres. The closed immersion used for pull–push is on Grassmannians, not quotient Hecke stacks. Drinfeld realization applies to locally constant perfect complexes and specializes to continuous finite-projective Weil representations.

<a id="finite-set-functoriality-and-constant-terms"></a>

**CoCartesian finite-set functoriality** (`collisionFunctor`). For a map `α:I→J`, let `Δ_α:(Div¹)^J→(Div¹)^I` repeat the j-th divisor on its inverse-image block. Pull back along `Gr^I_G ×_(Div¹)^I (Div¹)^J → Gr^I_G` and push forward along the natural closed immersion `Gr^I_G ×_(Div¹)^I (Div¹)^J` ↪ `Gr^J_G`. Descending the required loop equivariance defines `α_!:Sat^I→Sat^J`; the closed immersion is on Grassmannians, not on quotient Hecke stacks. This merges each fibre of `α` and inserts unit modifications at empty fibres. For permutations it relabels legs, and for disjoint unions it respects exterior fusion. Canonical identity and composition comparisons satisfy the finite-set coherence relations. Together with exterior fusion they give the coCartesian family of symmetric monoidal Satake categories over finite sets.

Use the diagonal base-change square and its closed Grassmannian immersion to define pull-push, check loop equivariance and descend to the Satake categories. Directly check compositional base change; do not replace this diagram by a closed immersion of quotient Hecke stacks. Compare composite collision orders on the locus of distinct relevant divisors and use VI.9.3 to extend the comparison uniquely. Every coherence diagram reduces to the same disjoint-locus permutation/composition identity; include empty fibres with the unit. Use the operadic language of EnhancedDerivedSheaves §E5:abstract.1 to package these comparisons.

Provide the following API.

- `collisionFunctor`: The functor `α_`! associated to any map `α:I→J`, including empty fibres.
- `collisionFunctor_id`: The identity-map functor is canonically isomorphic to identity.
- `collisionFunctor_comp`: `(β∘α)_`! `≅ α_`! followed by `β_`!, with coherent associativity.
- `collisionFunctor_comp_assoc`: For `I→J→K→L`, the two composition comparisons from the composite functor to the iterated functors agree after the functor associator; retain the full enhanced finite-set coherence.
- `collisionFunctor_union`: Disjoint union of maps commutes with exterior fusion, including its corrected permutations.
- `collisionFunctor_unitInsertion`: An unused target leg is assigned the zero-modification tensor unit.

**Checks.**

- The two successive three-leg merging orders have the canonical associativity comparison and commuting pentagon.
- A transposition composed with itself gives the identity comparison.
- `∅→{1}` sends the coefficient unit to the zero modification.


([FS](#source-fs), VI.9 pp226–227, including the footnote p227; Proposition VI.9.4 pp228–229.)

*Needs:* [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Restriction across collision diagonals](#disjoint-leg-factorization-and-full-faithfulness); RelativeFarguesFontaine §3.5; EnhancedDerivedSheaves §E5:abstract.1; [Loop spaces](#loop-groups-and-local-hecke); [Ordered legs and divisor base change](#ordered-leg-base-change); [Beilinson–Drinfeld Grassmannian](#grassmannian).

<a id="drinfeld-fibre-realization"></a>

**Weil realization of total cohomology** (`drinfeldFibreRealization`). Over `Perf_k`, `k=overline(𝔽_q)`, for every finite `I`, finite projective local systems on the relative product `(Div¹_X)^I` are equivalent to continuous finite projective `Λ`-representations of `W_E^I`. Under this equivalence `F^I` is total cohomology on the Grassmannian over its geometric leg base. It is faithful and conservative and has the inherited split-exact behaviour of VI.7.10, is symmetric monoidal for corrected fusion, and has the collision/permutation coherences. The Drinfeld statement is for locally constant perfect complexes, not all étale complexes or an assertion that fundamental groups commute with products.

Import VStackSheavesAndLisseCategories VS1.5, `PerfectLocalSystem.drinfeld`,
the IV.7.3 equivalence in its `D_lc` form, with `X=Spd k` and the geometric
divisor presentation of RelativeFarguesFontaine §4.7. Restrict to
finite-projective local systems in degree zero to obtain VI.9.2. Apply
compatible coefficient limits for the stated adic extension.

**Checks.**

- For `I=∅`, the source is finite projective local systems on `Spd k` and the target is finite projective `Λ`-modules, since `W_E^∅=1`.
- For `E=ℚ₅`, `Λ=𝔽₃`, `G=1` and no legs over `Perf_𝔽₅`, the constant rank-one local system and the rank-one system with arithmetic Frobenius `−1` are nonisomorphic. The latter descends along `𝔽₂₅/𝔽₅` using its sign character. Both are flat perverse ULA for the identity base map. Their pullbacks to `Perf_k` are isomorphic constant systems; this pullback forgets their distinct Frobenius descent structures.
- For singleton `I` the action is the local Weil action; for two legs it is `W_E²`, with two independent actions rather than one diagonal action.

([FS](#source-fs), Proposition VI.9.2 p226; Proposition IV.7.3 pp165–166 (full faithfulness begins p164).)

*Needs:* [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); VStackSheavesAndLisseCategories VS1.5, `PerfectLocalSystem.drinfeld`; ClassFieldTheory Layer 9, “the local Weil group”; RelativeFarguesFontaine §4.7 (geometric coefficient-base comparison); `Representation`; `Module.Projective`; [Cohomology](#satake-fibre-functor).

<a id="symmetric-constant-term"></a>

**Symmetric constant terms** (`constantTermFusionIso`). For a parabolic `P` with Levi `M`, `CT_P[deg_P]:Sat^I_G(Λ)→Sat^I_M(Λ)` is symmetric monoidal for corrected fusion, commutes with `F^I`, and is transitive for nested parabolics with the sum of the degree shifts. It respects arbitrary finite-set collision functors, disjoint unions and permutations, with identity, composition and transitivity coherences. The degree is componentwise `⟨2ρ_G−2ρ_M,μ⟩`; omission of it changes the weight degrees.

Use VI.7.13 for landing, degrees and transitivity. Off the collision diagonals the assertion is Künneth and blockwise hyperbolic localization.

([FS](#source-fs), Proposition VI.9.6 p230; VI.7.13 pp223–224; [Zhu](#source-zhu), Proposition 2.36 and the following paragraph, p454.)

*Needs:* [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Restriction across collision diagonals](#disjoint-leg-factorization-and-full-faithfulness); ReductiveGroupsPartII RG2.5; [Verdier duality of Satake objects](#satake-verdier-duality); [Cohomology](#satake-fibre-functor).

<a id="fusion-verdier-duality"></a>

**Fusion and Verdier duality** (`fusionVerdierComparison`). The inversion/reversal sw* is symmetric monoidal for fusion and `F^I` sw* `≅ F^I`. Verdier duality `D` is a contravariant symmetric monoidal involution, `D` sw* `≅` sw* `D` and `F^I D ≅ (F^I)^∨`. The internal tensor dual of A is `sw*D(A)`. These identifications retain their evaluation, coevaluation and finite-set coherence data; sw* itself need not be identity.

VI.8.2 supplies convolution duals before fusion; VI.7.12 supplies F(D `A)=F(A)^∨`.

**Checks.** A torus weight `μ` is inverted by sw* and internal dual, with the corresponding dual local system. The PGL2 minuscule case distinguishes a symmetric Verdier pairing from the alternating SL2 pairing used in VI.12.

([FS](#source-fs), Corollary VI.9.5 pp229–230; VI.8.2 pp225–226.)

*Needs:* [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); [Satake category](#satake-category-and-fibre-functor); `CategoryTheory.LeftRigidCategory`; [Verdier duality of Satake objects](#satake-verdier-duality); [Duals of Satake objects](#satake-rigidity).


### Examples

For blocks `{1,2}` and `{3}`, a tuple `(x,x,y)` with `x≠y` is disjoint across blocks. Fusion thus permits the internal collision. For `PGL₂`, a minuscule factor has odd dimension; exchanging two such factors gives the graded sign `−1` on cohomology, and multiplying the geometric commutativity by `(−1)^{1·1}=−1` yields the ordinary flip. Merging three legs in either order is the same composite finite-set map; its canonical comparisons extend from the disjoint locus and satisfy the pentagon.

### Dependencies

GS0–GS2; RelativeFarguesFontaine §§3.9, 4.7; ReductiveGroupsPartII RG2.5; ClassFieldTheory Layer 9; VStackSheavesAndLisseCategories VS1; EnhancedDerivedSheaves §E5:abstract.1.

## Layer GS4: Reconstruction and generic reductivity

### Bounded representability and the coordinate Hopf algebra

Verify bounded adjunctions and all three `F`-split coequalizer conditions, then apply the relative reconstruction theorem of this section. Dualize the fibre of each bounded generator before forming the filtered coordinate coalgebra. Coefficient limits and tensor products must preserve its Hopf operations.

<a id="tannakian-left-adjoint"></a>

**Bounded left adjoints** (`boundedLeftAdjoint`). Let `W_i⊂X_*(T)^+` be a finite downward-closed Galois-stable bound for each leg and `C_W⊂Sat^I` its full bounded-support category. The restriction `F_W:C_W→Rep_{W_E^I}^{fp}(Λ)` has a left adjoint `L_W`. Put `X_W=L_W(1)`. For each finite projective Weil representation `V`, `L_W(V)≅X_W⊗V` (the LocSys action), naturally in `V` and the bounds. For product bounds, `X_{W•}` is the fusion product of the singleton `X_{W_i}`. These are Satake generators, not their dual coordinate coalgebras.

Reduce to `Λ` killed by `ℓ^c` and single-leg bounds using fusion. On the perverse category apply the adjoint functor theorem to total cohomology.

Provide the following API.

- `boundedLeftAdjoint`: The functor `L_W` left adjoint to `F_W`.
- `boundedLeftAdjunction`: `Hom(L_W` V,A) `≅ Hom(V,F_W` A), naturally in `V` and A, with triangle identities.
- `boundedGenerator`: `X_W=L_W(1)` in the bounded Satake category.
- `boundedLeftAdjoint_tensor`: `L_W(V) ≅ X_W⊗V`, coherently for the LocSys action.
- `boundedGenerator_fusion`: For product bounds the generator is the fusion of singleton generators.
- `boundedGenerator_enlarge`: For `W⊂W′`, representability gives `X_W′→X_W` after the bounded objects are included in Satake. The dual fibre map is (F `X_W)^∨→(F X_W′)^∨`, the forward arrow in the coordinate-coalgebra diagram.

**Checks.**

- For a bound containing only weight zero, the generator is the unit with fibre `Λ`.
- Singleton generators fuse to the product-bound generator, preserving adjunction maps.
- `H_W=(F_W X_W)∨`. For `W⊂W′`, `H_W→H_W′` is dual to `X_W′→X_W`.

([FS](#source-fs), Proposition VI.10.1 pp230–232.)

*Needs:* [Weil realization of total cohomology](#drinfeld-fibre-realization); [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Generic Schubert bounds](#schubert-bounds-and-properness); EnhancedDerivedSheaves §E5:presentability.2; `CategoryTheory.Adjunction`; [Standard and costandard objects](#standard-costandard-objects); [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); [Cohomology](#satake-fibre-functor).

<a id="relative-reconstruction"></a>

**Relative finite-piece reconstruction** (`relativeReconstruction`). Let `A` be an essentially small rigid symmetric monoidal category, `C` a symmetric monoidal category with a coherent tensor action of `A`, and `F:C→A` a conservative strong symmetric `A`-linear functor. Assume `C` has coequalizers of `F`-split pairs and `F` preserves and reflects them. Let `C=⋃_i C_i` be a filtered cover by full subcategories stable under that action and those coequalizers, such that `F|C_i` is represented internally by `X_i`. Use an ambient universe for the filtered system and form `Ind(A)`. The intended result is a commutative bialgebra `H=colim_i F(X_i)^∨` in `Ind(A)` and a strong symmetric `A`-linear equivalence `C≃Comod_A(H)`, where the underlying comodule is an object of `A`. If `C` is rigid, the reconstructed bialgebra has an antipode. ([FS](#source-fs), Proposition VI.10.2 and proof, pp. 232–234.)

Prove the following four assertions, including their transition maps and universal properties. They are general results of this section, and their application to the actual Satake category is the next target.

- `relative-finite-piece-reconstruction`: The representing object gives `L_i(V)=V⊗X_i` left adjoint to `F|C_i`. Its monad is tensoring with the algebra `F(X_i)`, and the bounded comparison is the module category of that algebra, by the stated split-coequalizer hypotheses.
- `relative-coalgebra-assembly`: Dualizing gives the finite-piece coalgebra `F(X_i)^∨`; an inclusion `C_i⊂C_j` gives `X_j→X_i` and hence the forward coalgebra transition. The filtered colimit coactions identify `C` with comodules whose underlying object is in `A`, naturally under enlargement of the cover.
- `relative-bialgebra-reconstruction`: Tensor products land in a larger finite piece and induce multiplication on `H`, compatible with its coalgebra, unit and counit. The comparisons for tensor, unit, associativity and symmetry are coherent.
- `relative-rigid-antipode`: Duals in `C` give an antipode on `H` satisfying both convolution-inverse identities. The comparison preserves evaluation and coevaluation. This is an antipode on the coordinate algebra, not an inverse of the base category `A`.

**Checks.**

- For `C=A` and `F=id`, the coordinate object is the tensor unit and the comparison is the category of unit-coalgebra comodules.
- For finite-support modules graded by an abelian group `M`, reconstruction gives the group algebra, with `Δ(e^m)=e^m⊗e^m`, `ε(e^m)=1` and `S(e^m)=e^(−m)`. Using `F(X_i)` without dualization reverses the coalgebra arrows.
- A rigid category of finite projective modules over a general ring need not be abelian or semisimple. The split-coequalizer hypothesis remains explicit; conservation alone cannot replace preservation.

Also prove `neutral-tannaka-reconstruction`: for an essentially small rigid abelian tensor category over a field `k` with `End(1)=k` and a faithful exact `k`-linear tensor fibre functor to finite-dimensional vector spaces, its tensor-automorphism functor is represented by an affine group and the category is its finite-dimensional representation category. Prove `tannaka-finiteness-recognition` (the group is of finite type exactly when the category admits a tensor generator) and, over a characteristic-zero field, `tannaka-connectedness-recognition` (the group is connected exactly when no representation with nontrivial group action has its subquotient-and-finite-sum closure stable under tensor products). In the connectedness criterion use the precise form of [DM](#source-dm), Corollary 2.22: for every object `X`, if the category generated by `X` is closed under tensor products, then `X` is trivial; “generated” here means subquotients of finite direct sums, rather than tensor generation. ([DM](#source-dm), Theorem 2.11, Proposition 2.20 and Corollary 2.22, pp. 20–25.) The generic Satake application proves these recognition hypotheses from its highest-weight growth. Characteristic-zero finite-type reductivity then uses ReductiveGroups Layer 6.

The statement `neutralTannakaReconstruction` in [Suggested.lean](Suggested.lean)
expresses the neutral reconstruction theorem as existence of a commutative Hopf
algebra, a symmetric monoidal equivalence with its finite-dimensional comodules,
and a monoidal natural isomorphism with the given fibre functor. The pinned
`TauCeti.FGComoduleCat` supplies the algebraic representation category; the Hopf
algebra is a conclusion of the theorem.

**Checks.** A split torus has a faithful tensor generator and is connected while retaining nontrivial characters. A nontrivial finite constant group has a nontrivial representation with finite tensor hull and fails connectedness recognition. An infinite product of multiplicative groups is connected but has no finite tensor generator, so finite type must be checked separately.

*Needs:* EnhancedDerivedSheaves §§E3.1–E3.4, E5:abstract.1, E5:abstract.4, E5:presentability.1; `CategoryTheory.Adjunction`; `CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`; `CategoryTheory.Monad.PreservesColimitOfIsSplitPair`; `CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`; `HopfAlgebra`; ReductiveGroups Layer 1 (the comodule and representation dictionary).

<a id="relative-tannaka-hypotheses"></a>

**Relative Tannaka hypotheses for Satake** (`relativeTannakaHypotheses`). With `A=Rep_{W_E^I}^{fp}(Λ)`, `C=Sat^I_G(Λ)`, corrected tensor and `F^I`, verify the hypotheses of the relative reconstruction theorem of this section: A is rigid symmetric, `C` is symmetric `A`-linear, `F` is strong symmetric `A`-linear and conservative, `C` admits coequalizers of `F`-split pairs and `F` reflects and preserves these coequalizers, and bounded full subcategories form a filtered cover stable under the `A`-action and those coequalizers, with restricted `F` represented by `X_W`. `Sat^I` over a general ring is not asserted to be an abelian category.

`F`-split diagrams are split after total cohomology. VI.7.10 constructs the relevant kernel/cokernel Satake objects when fibres split or are direct summands, so their coequalizers remain flat perverse and their fibres give the split quotient. Bounds remain bounded under those coequalizers and the LocSys action; enlargement makes the cover filtered. Apply the bounded adjunction to produce the finite-piece monad. Check preservation as well as reflection for relative monadic reconstruction; preservation is asserted separately alongside reflection.

**Checks.** The relative base `A` retains all Weil local systems; it is not replaced by Vect or assumed semisimple. A nonsplit exact sequence of finite projective coefficient modules is not treated as an unrestricted cokernel construction in Satake.

([FS](#source-fs), VI.10.2–10.3 pp232–235; VI.7.10 pp222–223.)

*Needs:* [Bounded left adjoints](#tannakian-left-adjoint); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Fusion and Verdier duality](#fusion-verdier-duality); [Satake category](#satake-category-and-fibre-functor); [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); [relative-finite-piece-reconstruction](#relative-reconstruction); [relative-coalgebra-assembly](#relative-reconstruction); [relative-bialgebra-reconstruction](#relative-reconstruction); [relative-rigid-antipode](#relative-reconstruction); `CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`; `CategoryTheory.Monad.PreservesColimitOfIsSplitPair`; `CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`; [Cohomology](#satake-fibre-functor).

<a id="geometric-coordinate-hopf-algebra"></a>

**Geometric Satake coordinate Hopf algebra** (`satakeCoordinateHopf`). Apply the relative reconstruction theorem of this section to Satake. In `Ind(A)`, define `H^I_Λ=colim_W (F_W X_W)^∨`. It has a canonical commutative bialgebra structure from tensor products and an antipode from Satake rigidity. The comparison is a symmetric equivalence `Sat^I_G(Λ)≃Comod_{A,underlying A}(H^I_Λ)`. Forgetting `W_E^I` gives an ordinary flat coordinate Hopf algebra and hence an affine flat group scheme `G^∨,I_Λ`. This reconstructs `H` from the Satake category; the baseline known-Hopf tensorAutFunctor is only a compatibility comparison once `H` is constructed.

Use the four reconstruction targets below for finite-piece reconstruction, filtered coalgebra assembly, multiplication and antipode. Their abstract constructions and universal properties are targets of this section. Each dual fibre is finite projective; its filtered colimit is flat. Tensor compatibility yields commutativity and unit/counit; rigidity supplies the antipode equations. The comparison restricts to comodules whose underlying object lies in A, precisely retaining finite projectivity and continuous Weil action. Compare with the existing known-Hopf reconstruction only after extending to a field where its hypotheses hold. Apply the corrected VI.10.2 wording: obtain a bialgebra first, then an antipode on `H` under rigidity; do not apply an inverse to the base category A.

Provide the following API.

- `satakeCoordinateHopf`: `H^I_Λ` is the filtered colimit of dual bounded-generator fibres, with its commutative Hopf structure.
- `satakeCoaction`: Every A has its functorial `H-coaction` on `F^I(A)`.
- `satakeComoduleEquivalence`: The comparison is a symmetric equivalence with `H-comodules` whose underlying object is in A.
- `satakeCoordinateHopf_tensor`: Tensor of coactions uses the Hopf multiplication, and the unit coaction uses its unit.
- `satakeCoordinateHopf_antipode`: The coaction on the internal dual is obtained using the antipode; both antipode identities hold.

**Checks.**

- For the trivial `G`, `H=Λ` and the geometric affine group is the trivial group.
- For split `T`, `H=Λ[X_*(T)]`, with `Δ(e^μ)=e^μ⊗e^μ` and `counit(e^μ)=1`.
- `e^μ` maps to `e^(−μ)`; identity fails for nonzero `G_m` weights.


([FS](#source-fs), Propositions VI.10.2–VI.10.3 pp232–235.)

*Needs:* [Relative Tannaka hypotheses for Satake](#relative-tannaka-hypotheses); [relative-coalgebra-assembly](#relative-reconstruction); [relative-bialgebra-reconstruction](#relative-reconstruction); [relative-rigid-antipode](#relative-reconstruction); EnhancedDerivedSheaves §E5:presentability.1; `HopfAlgebra`; `Bialgebra`; `TauCeti.AffineGroupSchemeCat`; `TauCeti.Tannaka.tensorAutFunctor`; `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`; `CategoryTheory.Limits.HasColimit`.

<a id="multileg-and-coefficient-reconstruction"></a>

**Multileg and coefficient reconstruction** (`multilegCoefficientReconstruction`). There are canonical Hopf isomorphisms `H^I_Λ≅⊗_{i∈I}H^{i}_Λ` and `H^I_Λ⊗_ΛΛ′≅H^I_{Λ′}` for the source coefficient changes. They commute with leg permutations, fusion/collision maps, comultiplication, counit and antipode. First work modulo `ℓ^c`, assemble compatible levels to construct `H_{Z_ℓ}` and its affine flat group, and recover torsion coefficient rings by base change. Prime-to-p finite coefficient decompositions are assembled componentwise. This is an `ℓ`-adic reconstruction theorem, not an integral decomposition theorem.

The product formula for `X_W` in VI.10.1 gives the dual tensor formula on finite pieces; pass to filtered colimits.

([FS](#source-fs), VI.10.3 pp234–235; VI.11.1 proof p235.)

*Needs:* [Bounded left adjoints](#tannakian-left-adjoint); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Satake category](#satake-category-and-fibre-functor); `Module.Flat`; [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); [Cohomology](#satake-fibre-functor).

### Geometric rational semisimplicity and Witt Tannaka

Forget arithmetic Weil data before applying geometric rational semisimplicity. Establish finite type and connectedness before using the finite-type reductivity criterion. Transport fusion to the Witt category over an algebraic closure of a finite field.

<a id="rational-semisimplicity"></a>

**Geometric rational semisimplicity** (`rationalSemisimplicity`). After forgetting Weil descent and taking a geometric splitting fibre, the rational Satake category is the direct sum over dominant `μ` of copies of finite-dimensional `Q_ℓ`-vector spaces generated by the simple `IC_μ`. For each bounded object the sum is finite. Convolution of the IC objects is semisimple. EtaleDualityAndPerverseSheaves §§5.3, 5.5–5.6 is applied on finite-type proper models/resolutions of bounded Witt Schubert perfections over an algebraic closure of a finite field and transported through perfection and the integral-family comparison. No semisimplicity of Weil representations, integral Satake objects or `mod-ℓ` Satake objects follows.

Use VI.6.7 to transport geometric Satake to the Witt fibre. Equivariance and connected Schubert stabilizers make simple equivariant local systems constant, so simples are `IC_μ`.

([FS](#source-fs), VI.7.5 pp219–221; VI.11.1 proof pp235–236; [Zhu](#source-zhu), Lemma 2.1 p430 and Proposition 2.2 p432; context pp430–432.)

*Needs:* [One-leg ULA special/generic comparison](#integral-family-comparison); [Generic Schubert bounds](#schubert-bounds-and-properness); [Relative perverse t-structure](#relative-perverse-t-structure); [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); EtaleDualityAndPerverseSheaves §§5.3, 5.5–5.6; [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); [One-leg Satake equivalence](#one-leg-satake-comparison); [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="generic-fibre-reductivity"></a>

**Reductivity of the generic Satake group** (`genericFibreReductivity`). The geometric generic fibre `G^∨_{Q_ℓ}` is a connected reductive group of finite type. Finite dominant-monoid generators give a tensor generator (including its dual), so the reconstruction targets here and DM 2.20 gives finite type. For every nontrivial IC highest weight the highest weights `nμ` in tensor powers grow, ruling out a nontrivial finite tensor hull; the reconstruction targets here and DM 2.22 gives connectedness. Having established finite type and connectedness, use geometric semisimplicity and the characteristic-zero reductivity criterion from the existing ReductiveGroups owner. DM 2.23 also expresses the semisimplicity criterion as proreductivity; the finite-type criterion has no additional pro-group assertion.

Choose finite generators for dominant weights, and use the highest-weight constituent `IC_{μ+ν}` of convolution to generate all simples by tensor operations/subquotients.

**Checks.** For `G` a split torus the group is its dual torus, not a semisimple group. Semisimplicity alone would allow disconnected or infinite proreductive groups; the preceding two recognition steps are necessary.

([FS](#source-fs), VI.11.1 proof pp235–236; [DM](#source-dm), Proposition 2.20, Corollary 2.22 and Proposition 2.23 pp24–27; [Zhu](#source-zhu), §2.5 p454, first paragraph.)

*Needs:* [Geometric rational semisimplicity](#rational-semisimplicity); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [tannaka-finiteness-recognition](#relative-reconstruction); [tannaka-connectedness-recognition](#relative-reconstruction); ReductiveGroups Layer 6; ReductiveGroupsPartII RG2.5; `TauCeti.reductiveAffineGroupSchemeProperty`.

<a id="witt-rational-tannakian-category"></a>

**Rational Witt Satake category as a neutral Tannakian category** (`wittRationalTannakianCategory`). Let `Sat^Witt_G` be Zhu's category `P_{L⁺G}(Gr_G)` of `L⁺G`-equivariant perverse `Q̄_ℓ`-sheaves with bounded support on the Witt vector affine Grassmannian of `G` over `k`, with convolution `⋆`, unit `IC_0` and total cohomology H*. (i) The one-leg comparison over Spd `k` identifies `Sat^Witt_G`, compatibly with `⋆` and H*, with the `Q̄_ℓ`-linear idempotent completion of the rationalization `Sat_G(Hck_{Spd` k}, `Z_ℓ) ⊗ Q̄_ℓ` (Hom groups tensored with `Q̄_ℓ)`. (ii) Transporting the parity-corrected fusion symmetry and the Satake duals through (i) makes `Sat^Witt_G` a semisimple rigid symmetric monoidal abelian category with `End(IC_0) = Q̄_ℓ`, and H* an exact faithful symmetric monoidal functor to finite-dimensional `Q̄_ℓ`-vector spaces with the ordinary flip; thus `(Sat^Witt_G`, H*) is a neutral Tannakian category. (iii) Its Tannakian group `Aut^⊗(H*)` is canonically the base change to `Q̄_ℓ` of the generic fibre of the Satake group of Spd `k`, and so is a connected reductive group of finite type. The monoidal structure on H* is the one transported from fusion; it is not identified with the structure of Zhu's Proposition 2.20.

`E` is a finite extension of `Q_p` with residue field `F_q`; `k` is an algebraic closure of `F_q`; `O =` `W(k)` `⊗_{W(F_q)} O_E`, the integers of the completed maximal unramified extension of `E`, which is totally ramified over `W(k)`. `G` is a split connected reductive group over `O_E`, and also denotes its base change to `O`. `ℓ ≠ p`, and `Q̄_ℓ` is the union of the finite extensions of `Q_ℓ`. Zhu allows any algebraically closed `k` and any finite totally ramified `F` over `W(k)`[1/p]. For `k` an algebraic closure of `F_p` every such `F` is the completed maximal unramified extension of a finite extension `E` of `Q_p` (finite extensions of the completion of the henselian field `Q_p^ur` come from finite extensions of `Q_p^ur)`, and every reductive group over the strictly henselian ring `O` is split, so the comparison route covers Zhu's setting for this `k`. For larger algebraically closed `k`, use GeometricSatakeAndFusionPartII, rational Witt comparison; the equivalence here has the stated finite-residue-field base.

Zhu's ring `W_O(R) =` `W(R)` `⊗_{W(k)} O` equals `W(R)` `⊗_{W(F_q)} O_E`, so his `Gr_G` is the Witt vector affine Grassmannian of `G` over `k`. Over Spd `k` the Grassmannian chart is the diamond associated with the Witt Grassmannian. The local Hecke stack is its positive-loop quotient. Equivariant descent and the scheme-to-diamond sheaf comparison identify the corresponding perverse categories (FS p219). Compatibility with convolution, the unit and duals comes from the one-leg comparison result, and with total cohomology from the Satake cohomology functor.

**Checks.**

- For `G_m`, the identity in Hck has positive-loop automorphisms, while the Grassmannian chart has trivial inertia.
- The torus weight-point sheaves correspond to one-dimensional character representations, compatibly with their tensor sum.
- The unit sheaf corresponds to the trivial representation and its total cohomology is `Q̄_ℓ` in degree zero.

([Zhu](#source-zhu), §2 opening p429; §2.1.1 p430; §2.5 p454, first paragraph; [FS](#source-fs), VI.7 p219 after the proof of Proposition VI.7.4; Remark I.2.14 p17.)

*Needs:* [One-leg Satake equivalence](#one-leg-satake-comparison); [One-leg ULA special/generic comparison](#integral-family-comparison); AdicCoefficientsAndComparisons L0, `rational-constructible-coefficients`; [Cohomology](#satake-fibre-functor); [Duals of Satake objects](#satake-rigidity); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Geometric rational semisimplicity](#rational-semisimplicity); [Reductivity of the generic Satake group](#generic-fibre-reductivity); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [neutral-tannaka-reconstruction](#relative-reconstruction); [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound).


### Examples

For a split torus with cocharacter group `M`, dualizing the bounded representing fibres gives `Λ[M]`, with group-like generators and inversion antipode. Without dualization the transition maps point in the wrong direction. Over a characteristic-zero geometric fibre, nonzero highest weights `nμ` grow under tensor powers, supplying the connectedness test independently of finite-type tensor generation. The rational Witt comparison then transports the corrected fusion symmetry and total cohomology to Zhu's geometric category over an algebraic closure of the finite residue field.

### Dependencies

GS0–GS3; the general relative and neutral reconstruction targets here; EnhancedDerivedSheaves E3, E5; EtaleDualityAndPerverseSheaves §§5.3, 5.5–5.6; ReductiveGroups Layers 1, 6 and 9; AdicCoefficientsAndComparisons L0–L1, L3.

## Layer GS4: Integral identification, normalization and functoriality

### Torus, rank one and the integral recovery

The generic rank-one calculation identifies the root datum. Integral identification additionally needs the all-prime special-fibre image argument. At characteristic two, highest weights do not exclude N(T); the modular top-cycle comparison and tilting invariants below must establish that exclusion.

<a id="torus-and-rank-one-identification"></a>

**Torus and rank-one identification** (`torusRankOneIdentification`). For a split torus `T`, `Sat_T` is the category of finitely supported `X_*(T)-graded` finite projective Weil representations and `G^∨_T` is its dual torus. Constant terms give a closed immersion of this torus into `G^∨_G`. For `G=PGL₂` the minuscule Schubert variety is `P¹`, its fibre is `Z_ℓ⊕Z_ℓ(-1)` with torus weights ±1, and the generic fibre `G^∨_{Q_ℓ}` is `SL(Q_ℓ⊕Q_ℓ(-1))` with geometric root line `Q_ℓ(1)`. The integral and special-fibre statement is the separate result rank-one-integral-identification. For general semisimple rank one recover the central/component grading by the diagonalizable group with character group `π₁(G)`, which can have torsion.

The torus calculation is the character grading and group-algebra Hopf computation. For each top Schubert weight its rank-one weight quotient gives the closed torus immersion.

**Checks.** For `G=G_m` the weight `n` gives the character `z↦z^n`. For `G=PGL₂` the generic group is `SL₂`, not `PGL₂`: the minuscule representation is two-dimensional with weights ±1. For `G=PGL₂` the component group Z/2 corresponds to `μ₂`, which is diagonalizable and not a torus.

([FS](#source-fs), VI.11.1 proof pp235–237; [Zhu](#source-zhu), §2.5 p454, second paragraph.)

*Needs:* [Symmetric constant terms](#symmetric-constant-term); [Fusion and Verdier duality](#fusion-verdier-duality); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [Reductivity of the generic Satake group](#generic-fibre-reductivity); ReductiveGroupsPartII RG2.5; ReductiveGroups Layer 9; `RootPairing`.

<a id="rank-one-subgroup-geometry"></a>

**Frobenius images and rank-one subgroups** (`frobeniusImageEventuallyReduced`, `sl2SubgroupContainingTorus`). Over an algebraically closed field `k` of characteristic `ℓ>0`, the scheme-theoretic image of a finite-type group scheme under a sufficiently high relative Frobenius is reduced, hence smooth. Construct the image in the appropriate Frobenius twist and its quotient map. For a smooth connected closed subgroup of `SL₂/k` containing the diagonal torus `T`, prove that it is `T`, either of the two Borels containing `T`, or `SL₂`. For smooth subgroups not assumed connected, determine the possible extensions of these identity components using their normalizers.

Compute `N(T)/T` as the constant group of order two, its action by inversion on torus weights, and its irreducible representations. In odd characteristic its sign character is distinct from the trivial representation. In characteristic two the two characters coincide; irreducibles have a single highest weight in each nonnegative integer, so that test alone does not exclude `N(T)`. Supply Frobenius pullback and tensor-invariant comparisons used in integral rank-one identification.

**Checks.**

- The r-th Frobenius image of `μ_{ℓ^r}` is trivial and reduced; the original group scheme need not be reduced.
- `T`, the upper and lower Borels, and `SL₂` realize all four connected cases; `N(T)` demonstrates why connectedness is required.
- In characteristic two, the normalizer has three invariants in the fourth tensor power of the standard module, whereas `SL₂` has two; in odd characteristic the two highest-weight-zero characters already separate the normalizer case.

([FS](#source-fs), proof of Lemma VI.11.2, p. 237, for the Frobenius reduction and connected subgroup classification; the stated normalizer calculation retains the characteristic-two distinction.)

*Needs:* ReductiveGroups Layers 1–3, 7; LanglandsParameterStacks §LP3.0.

<a id="rank-one-integral-identification"></a>

**Integral rank-one identification** (`rankOneIntegralIdentification`). For `G = PGL₂` and every `ℓ ≠ p`, the representation on the fibre `Z_ℓ⊕Z_ℓ(-1)` of the minuscule object is an isomorphism `G^∨_{Z_ℓ} ≅ SL(Z_ℓ⊕Z_ℓ(-1))`. Its special fibre `G^∨_{F_ℓ} → SL₂` is surjective. The image `H` contains the diagonal torus `T` and its irreducibles are separated by highest weights in `Z≥0`; for `ℓ` odd this forces `H = SL₂` (VI.11.2). For `ℓ =` 2 these properties leave the case that the reduced subgroup of `H` is the normalizer N(T), with `H` inside a Frobenius preimage of N(T). That case is excluded because `Hom(1`, `B₁^{⋆n})` over `F₂` has the characteristic-zero dimension for every `n`, while a Frobenius preimage of N(T) has more invariants in a suitable `V^{⊗n}`. For a split `G` of semisimple rank one the integral identification follows through `G → G_ad ≅ PGL₂` and the component grading. The characteristic-two invariant-count route is a specified replacement: it uses the strengthened tilting and modular convolution targets here, and its geometric identification is proved by the modular convolution and tilting targets in this section.

Reduce `G^∨` modulo `ℓ` and work after faithfully flat extension to an algebraic closure `k` of `F_ℓ`; surjectivity of the special-fibre map descends. Let `H` be the image of `G^∨_k` in `SL₂`. Every irreducible representation of `G^∨_k` is a simple Satake object `B_μ` of highest weight `μ`, so the irreducibles of `H` are separated by highest weights in `Z≥0`. Replace `H` by its image H′ under a high power `r` of the Frobenius isogeny: H′ is reduced, contains `T` and is a quotient of `H`, so its irreducibles pull back to irreducibles of `H` with highest weights multiplied by `ℓ^r`; and H′ `= SL₂` forces `H = SL₂` by dimension. The identity component of the smooth group H′ is `T`, a Borel or `SL₂` by the structure theory of `SL₂`. `T` and the Borels have irreducibles of negative highest weight; if H′° `= T` then H′ `⊂` N(T). For `ℓ` odd the sign character of N(T) is a second irreducible of highest weight 0, so H′ `= SL₂`. For `ℓ =` 2, if H′ `=` N(T), then `H` lies in `H_a`, the preimage of N(T) under the a-th Frobenius power, for some a `≥` 0. Put `n = 6·2^a` − 2. The `SL₂` tilting factorization gives T(n) `≅` A `⊗ T(4)^{[a]}`, where A `= T(2^{a+1}` − 2). For a `≥` 1 the Steinberg-square description A `≅ St_a ⊗ St_a` and self-duality identify `A^{G_a}` with `End_{G_a}(St_a) = k`; the resulting line has trivial `SL₂` action. For a `=` 0 use A `=` T(0) directly. Hence `T(n)^{G_a} ≅ T(4)^{[a]}` and `T(n)^{H_a} ≅ T(4)^{N(T)}`. The character of T(4) is the sum of the characters of ∇(4) and ∇(2): its weight-zero space has dimension two, so the involution `w` has a nonzero fixed vector in characteristic two, but `T(4)^{SL₂} =` 0 because its good filtration has no ∇(0). Thus `T(n)^{SL₂} =` 0 as well. The highest-weight summand T(n) of the tilting module `V^{⊗n}` supplies extra `H-invariants`. For `V^{⊗n}` the ∇(0)-multiplicity is the characteristic-zero trivial multiplicity. The Steinberg-kernel and good-filtration facts are explicit tilting targets here, not consequences of a `prime-to-ℓ` generation theorem. Require the following coefficient-independent geometric calculation from GS2:correspondences, strengthening rational semismallness. For even `n`, the n-step minuscule `PGL₂` convolution space is a smooth iterated (perfected) `P¹` bundle of dimension `n`, its proper convolution map is semismall, and the base-point fibre has dimension at most n/2. Proper duality identifies `Hom(1`, `B₁^{⋆n})` with its degree-n Borel–Moore homology, up to the harmless Tate twist. Top-dimensional cycles give a free coefficient module with basis the n/2-dimensional irreducible components, so the `F₂` dimension equals the `Q_ℓ` dimension. Transport this identification through the one-leg comparison and use the rational rank-one calculation for the latter dimension. Since the reconstructed group acts through `H`, this contradicts the extra invariants of the preceding step and gives `H = SL₂`. Prove this modular `Hom/cycle` identification as part of the rank-one target; Zhu Proposition 2.3 provides the semismall dimension bound, not the asserted modular Hom identification. The map `G^∨_{Z_ℓ} → SL₂` is an isomorphism on generic fibres and surjective on special fibres, so on coordinate rings it is injective modulo `ℓ` and an isomorphism after inverting `ℓ`; the flat-module lemma VI.11.3 makes it an isomorphism. For semisimple rank one use `G → G_ad ≅ PGL₂` and refine the component grading.

**Checks.** The normalizer of the diagonal torus in `SL₂` over `F₂`, and its preimage under the Frobenius isogeny, both have irreducibles of highest weights 0, 1, 2, …, each once; torus containment and injectivity of highest weights cannot tell them from `SL₂` at `ℓ =` 2. For a `=` 0 the count is `n =` 4: `(V^{⊗4})^{N(T)}` is three-dimensional (w permutes the six weight-zero basis tensors freely), against two `SL₂-invariants` and two characteristic-zero invariants. A map of flat `Z_ℓ`-modules that is injective modulo `ℓ` and an isomorphism after inverting `ℓ` is an isomorphism; injectivity modulo `ℓ` alone is not enough.

([FS](#source-fs), VI.11.1 proof pp236–237; Lemmas VI.11.2–VI.11.3 p237; [DH](#source-dh), §1, Lemma 1.1 p3 and Lemma 1.4 p4; §5 p18, Steinberg-square discussion; [Zhu](#source-zhu), Proposition 2.3 and Remark 2.4 p432; §2.1 pp431–432.)

*Needs:* [Torus and rank one](#torus-and-rank-one-identification); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Ambient Hecke convolution](#convolution-diagram); [Frobenius images and rank-one subgroups](#rank-one-subgroup-geometry); LanglandsParameterStacks §LP3.0; `Module.Flat`; [modular rank-one convolution](#modular-rank-one-convolution); [One-leg Satake equivalence](#one-leg-satake-comparison).

<a id="generic-root-datum"></a>

**Weight torus and generic root datum** (`genericRootDatum`). Under the torus inclusion, weight-functor grading identifies `X^*(T^∨)=X_*(T)`. The stabilizer of the cohomological grading is the maximal torus and the weight filtration defines a Borel. The symmetric constant-term maps for minimal Levis identify each simple coroot of `G` with a simple root of `G^∨` and each simple root with its coroot; their Weyl reflections agree. Convex-hull bounds for weights of `IC_μ` exclude additional roots. Thus `G^∨_{Q_ℓ}` has the dual root datum and its generic pinning has root line `Q_ℓ(1)`.

Use the weight grading and highest-weight line to identify the torus and chosen positive filtration.

([FS](#source-fs), VI.11.1 proof pp237–238; [Zhu](#source-zhu), §2.5 pp454–455, after Proposition 2.36.)

*Needs:* [Torus and rank one](#torus-and-rank-one-identification); [Symmetric constant terms](#symmetric-constant-term); [Reductivity of the generic Satake group](#generic-fibre-reductivity); [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); ReductiveGroupsPartII RG2.5; ReductiveGroups Layer 9.

<a id="flat-module-integral-recovery"></a>

**Flat-module integral recovery** (`flatModuleIntegralRecovery`). Let `R` be a commutative domain, `π≠0`, and `f:M→N` a linear map of flat `R`-modules. If reduction `M/πM→N/πN` is injective and localization `M[1/π]→N[1/π]` is an isomorphism, prove that `f` is an isomorphism. No finite-generation or completeness hypothesis is needed. This is [FS](#source-fs), Lemma VI.11.3, p. 237, over `ℤ_ℓ`; its proof by the least power carrying an element into the image works over any domain with a nonzero `π`. In Lean the two maps are `f.lTensor (R ⧸ Ideal.span {π})` and `f.lTensor (Localization.Away π)`.

**Checks.** The identity map satisfies both tests over every such ring. Multiplication by `π` on `R` for a nonunit `π` is a generic isomorphism but fails injectivity modulo `π`. The inclusion `ℤ_ℓ→ℚ_ℓ` is a generic isomorphism with flat modules but again fails the reduction test; generic equality cannot recover an integral model by itself.

*Needs:* `Module.Flat`; `LinearMap.lTensor`; `Localization.Away`; `Ideal.Quotient`.

<a id="integral-recovery-and-adjoint-reduction"></a>

**Integral recovery and the adjoint reduction** (`integralRecovery`). The generic dual identification extends to an isomorphism `G^∨_{Z_ℓ}≅Ĝ_{Z_ℓ}` for every `ℓ≠p`. Over the completed maximal unramified extension, the dual torus and rank-one Levi integral images generate `Ĝ(Z̆_ℓ)`; this maximal bounded subgroup preserves a lattice in every finite-dimensional generic representation. The associated finite-type images recover the integral model via the RG2.3 Prasad–Yu closed-immersion criterion and VI.11.3 flat-module injection. At `ℓ=2` first perform this step for `G_ad`, whose dual is simply connected, and then recover the original `G` from its component/central grading. One cannot apply Prasad–Yu directly to an arbitrary dual group in characteristic two.

Use integral CT Levi maps and the dual torus to obtain the full hyperspecial/maximal bounded subgroup; include the torus separately for semisimple rank zero. Import the generation/Iwasawa result from RG2.4 and integral-points topology from RG2.0. Extend a generic faithful representation using a preserved lattice. The map from `Ĝ` to its finite-type schematic image is generically a closed immersion. PY applies if `ℓ≠2` or the generic fibre over an algebraic closure has no normal algebraic subgroup isomorphic to `SO_{2n+1}`; simple connectedness suffices. For `G_ad` this exception is absent. Surjectivity on integral points and the flat-module lemma force equality of coordinate rings. Reconstruct arbitrary `G` by refining the component grading, as in the rank-one/central argument.

**Checks.** The theorem includes `ℓ=2` when `p≠2` and includes groups whose dual has torsion fundamental group. The torus case does not rely on a nonexistent rank-one Levi. Generic equality by itself would also allow defective integral models; this proof uses integral points and the closed-immersion theorem.

([FS](#source-fs), VI.11.1 proof pp238–239; Lemma VI.11.4 p238; [PY](#source-py), Corollary 1.3 pp2–3; proof §5.4 p12.)

*Needs:* [Generic root datum](#generic-root-datum); [Torus and rank one](#torus-and-rank-one-identification); [Integral rank-one identification](#rank-one-integral-identification); [Flat-module integral recovery](#flat-module-integral-recovery); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); ReductiveGroupsPartII RG2.3; ReductiveGroupsPartII RG2.0; ReductiveGroupsPartII RG2.4; ReductiveGroups Layer 9; `Module.Flat`.

<a id="dual-group-identification"></a>

**Canonical pinned dual identification** (`dualGroupIdentification`). There is a canonical `W_E`-equivariant isomorphism `G^∨_Λ≅Ĝ_Λ^{geom}` for the prime-to-p torsion and compatible `ℓ`-adic coefficients above. The geometric pinning identifies each simple root line with `Λ(1)`; it carries the cyclotomic Weil action as well as the action on the pinned dual root datum. The isomorphism is independent of a chosen splitting pinning of `G` and descends from a finite Galois splitting extension to nonsplit `G`. It is an integral theorem and uses no exclusion on the order of `π₁(Ĝ)`.

Initially identify split pinned groups by the integral torus/rank-one calculation. Vary the pinning over its flag/pinning parameter family.

([FS](#source-fs), Theorem VI.11.1 p235 and canonical-pinning/descent proof pp238–239.)

*Needs:* [Integral recovery and the adjoint reduction](#integral-recovery-and-adjoint-reduction); [Symmetric constant terms](#symmetric-constant-term); [Weil realization of total cohomology](#drinfeld-fibre-realization); ReductiveGroupsPartII RG2.5; VStackSheavesAndLisseCategories VS1.

### Rational Witt and normalized integral equivalences

The rational Witt theorem uses the generic identification. The integral theorem incorporates the half Tate character into the Weil semidirect product. Levi naturality has a torus cocycle correction determined by the two normalizations.

<a id="witt-rational-satake-equivalence"></a>

**Rational Witt vector geometric Satake equivalence** (`wittRationalSatakeEquivalence`). In the setting of the rational Witt Tannakian category, let `Ĝ` be the split dual group over `Q̄_ℓ` with the dual Borel `B̂ ⊃ T̂` of its pinned dual root datum. There is an equivalence of `Q̄_ℓ`-linear symmetric monoidal categories `S`: `Sat^Witt_G → Rep_{Q̄_ℓ}(Ĝ)` onto finite-dimensional algebraic representations, with an isomorphism of tensor functors H* `≅` (forget ∘ S). Under `S`: (a) the weight functor CT `= ⊕_λ CT_λ`, viewed as a functor to `Sat^Witt_T`, has a unique monoidal structure for which the isomorphism `H*_T` ∘ CT `≅` H* is monoidal; it is then symmetric and corresponds to restriction to `T̂`, `CT_λ(A)` being the `λ`-weight space of S(A); (b) the filtration of H* by semi-infinite orbits corresponds to the `B̂`-stable filtration by weights; (c) `IC_μ` corresponds to the irreducible representation `V_μ` of highest weight `μ`, so dim `CT_λ(IC_μ) =` dim `V_μ(λ)`; (d) for a torus, `S` is the grading equivalence with `Rep(T̂)`. This is Zhu's Theorem 0.3, with Corollary 2.22 and §2.5, for the monoidal structure on H* transported from fusion; its agreement with the structure of Zhu's Proposition 2.20 is not asserted.

`E` is a finite extension of `Q_p` with residue field `F_q`; `k` is an algebraic closure of `F_q`; `O =` `W(k)` `⊗_{W(F_q)} O_E`, the integers of the completed maximal unramified extension of `E`, which is totally ramified over `W(k)`. `G` is a split connected reductive group over `O_E`, and also denotes its base change to `O`. `ℓ ≠ p`, and `Q̄_ℓ` is the union of the finite extensions of `Q_ℓ`. Zhu allows any algebraically closed `k` and any finite totally ramified `F` over `W(k)`[1/p]. For `k` an algebraic closure of `F_p` every such `F` is the completed maximal unramified extension of a finite extension `E` of `Q_p` (finite extensions of the completion of the henselian field `Q_p^ur` come from finite extensions of `Q_p^ur)`, and every reductive group over the strictly henselian ring `O` is split, so the comparison route covers Zhu's setting for this `k`. For larger algebraically closed `k`, use GeometricSatakeAndFusionPartII, rational Witt comparison; the equivalence here has the stated finite-residue-field base. Dominance on coweights uses nonnegative integer combinations of positive coroots; `Rep_{Q̄_ℓ}(Ĝ)` means algebraic representations on finite-dimensional `Q̄_ℓ`-vector spaces, with no Weil action.

The generic root datum result identifies the root datum of the Tannakian group of the rational Witt category with the dual root datum, with its torus, Borel and simple root lines; the isomorphism theorem for pinned split groups gives `Aut^⊗(H*) ≅ Ĝ` over `Q̄_ℓ`. Neutral Tannaka reconstruction turns this into `S` with forget ∘ `S ≅` H*. Only the generic fibre is used: the integral rank-one identification, integral recovery and the `ℓ =` 2 input are not prerequisites. For (a): transport the symmetric constant term for `B` through the one-leg comparison and to `Q̄_ℓ`; it commutes with the fibre functors. Uniqueness: `H*_T` is faithful, so the monoidal structure on CT is determined by the monoidal isomorphism `H*_T` ∘ CT `≅` H*. Symmetry: the commutativity constraints on both sides are detected by H*, as in the uniqueness part of Zhu's Proposition 2.21. The torus case identifies `Rep(T̂)` with graded spaces, so CT is restriction to `T̂`. For (b) and (c): the stabilizer of the cohomological filtration is `B̂` by the generic root datum result. The weights of `IC_μ` lie in the convex hull of `Wμ` and `μ` occurs once, since `S_μ ∩ Gr_{≤μ}` is irreducible of dimension `⟨2ρ`, `μ⟩` by the Mirković–Vilonen count; so `S(IC_μ)` is the irreducible module of highest weight `μ` by the characteristic-zero highest-weight classification. For (b): the semi-infinite filtration is split by the weight functors (Zhu Corollary 2.10, with the weight-filtration argument stated here, or the symmetric constant-term result, through `F ≅ F_T` ∘ `CT_B[deg])`, so by (a) it corresponds to the sums of the weight spaces `V(λ′)` over `λ′ ≥ λ`, which are `B̂`-stable because the root groups of `B̂` raise weights by positive coroots of `G`. Zhu's own route to the same identification (torus case, Proposition 2.36 by torus-equivariant cohomology, then the maximal torus and Borel argument of Mirković–Vilonen §7) uses his monoidal structure on H* and his Gelfand commutativity constraint (§§2.3–2.4). That independent construction belongs to GeometricSatakeAndFusionPartII; the equivalence here uses the fusion construction.

**Checks.** For a split torus `T`, `S` is the equivalence between `X_*(T)-graded` spaces and representations of `T̂`, with CT the identity. For `G = PGL₂` the minuscule object goes to the standard representation of `SL₂`, with `CT_{±μ}` one-dimensional. For `G = GL_n` and `μ =` (1,0,…,0) the closed Schubert variety is `P^{n−1}`; `S(IC_μ)` is the standard representation, with the `n` coordinate weights each of multiplicity one. With the Koszul-signed symmetry instead of the parity-corrected one, the reconstruction would give a supergroup, not `Ĝ`.

([Zhu](#source-zhu), Theorem 0.3 p408 ; Corollary 2.22 p444; §2.5 pp454–455; §0.5 p412; [FS](#source-fs), Remark I.2.14 p17; VI introduction pp188–189.)

*Needs:* [Rational Witt category](#witt-rational-tannakian-category); [Generic root datum](#generic-root-datum); [Torus and rank one](#torus-and-rank-one-identification); [Symmetric constant terms](#symmetric-constant-term); [One-leg Satake equivalence](#one-leg-satake-comparison); [MV intersections](#semi-infinite-intersections-and-mv-cycles); [Rational special-fibre weights](#rational-weight-concentration); [neutral-tannaka-reconstruction](#relative-reconstruction); ReductiveGroupsPartII RG2.5; LanglandsParameterStacks §LP3.0; ReductiveGroups Layer 9.

<a id="normalized-satake-equivalence"></a>

**Normalized integral Satake equivalence** (`normalizedSatakeEquivalence`). Work with the Satake categories over `Perf_k`, `k=overline(𝔽_q)`, and products relative to `Spd k`. Choose `r∈Λ×` with `r²=q` and the associated half Tate local system. Let `χ_Tate` be the Weil character of the geometric root line `Λ(1)` under IV.7.3 and `κ` its chosen square root. The half twist on a sheaf stalk has geometric Frobenius eigenvalue `r^{-1}`; identifying that stalk convention with `κ` under Drinfeld realization requires the explicit convention comparison. Put `t_G(w)=(2ρ̂_G)(κ(w))` in `Ĝ` (projected to `Ĝ_ad` for conjugation). The geometric action is `Ad(t_G(w))` composed with the usual pinned action. The semidirect comparison `(g,w)↦(g t_G(w),w)` identifies the geometrically twisted semidirect group with the pinned one. Combining it with reconstruction gives `Sat^I_G(Λ)≃Rep^{fp,cont}_Λ((Ĝ⋊W_E)^I)`. Equivalently an algebraic representation of `(Ĝ⋊Q)^I`, for a finite quotient `Q` through which the pinned action factors, gives its normalized Satake object; `Q` is not substituted for all continuous Weil representations.

Use the root-line action in VI.11.1 to express geometric versus pinned action through the adjoint cocharacter `2ρ̂`, without requiring `ρ̂` itself to be a cocharacter of `Ĝ`. The identity `t(wv)=t(w)·w(t(v))` verifies the semidirect multiplication comparison. Tensor and dual compatibility follow from the Hopf comparison and corrected fusion. Transport the chosen half twist and Frobenius convention through the Drinfeld equivalence. The Drinfeld realization comparison must identify this stalk-action and parameter-action orientation.

Provide the following API.

- `normalizedSatakeEquivalence`: The strong symmetric equivalence with continuous finite-projective representations of the usual pinned Weil semidirect group.
- `normalizedSatakeObject`: The inverse equivalence applied to a representation `V` of `(Ĝ⋊Q)^I`.
- `normalizedSatake_fibre`: The underlying fibre is `V` with the specified half-Tate normalization, compatibly with Weil action.
- `normalizedSatake_tensor`: `S_{V⊗W} ≅ S_V*S_W` and `S_1 ≅` unit.
- `normalizedSatake_dual`: `S_{V∨}` is the internal dual `sw*D(S_V)`.
- `normalizationCocycle`: `t_G(w)=(2ρ̂_G)(κ(w))`; the cocycle identity gives the semidirect comparison.

**Checks.**

- For `T=G_m`, weight `n` is the point object on component `n`, with no `ρ` twist.
- The `SL₂` standard representation gives `Λ[1](1/2)` on the `PGL₂` minuscule `P¹`, with eigenvalues `r⁻¹,r`.
- Replacing `r` by −r changes odd-component half twists by −1.
- For `G=1`, `E=ℚ₅`, `Λ=𝔽₉` and `I=∅`, both sides are finite projective `𝔽₉`-modules over the geometric base. Before base change, the Frobenius `+1` and `−1` rank-one systems remain distinct despite `q=5` having a square root in `𝔽₉`.


([FS](#source-fs), Theorem VI.0.2 p190; VI.11.1 p235; IX.2 p321.)

*Needs:* [Pinned dual group](#dual-group-identification); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [Weil realization of total cohomology](#drinfeld-fibre-realization); [Fusion and Verdier duality](#fusion-verdier-duality); ReductiveGroupsPartII RG2.5; `CategoryTheory.Functor.Monoidal`; `Representation`.

<a id="levi-naturality"></a>

**Levi naturality and normalization** (`leviNaturality`). For `P` with Levi `M`, `CT_P[deg_P]` intertwines geometric Satake with restriction along `M̂^{geom}→Ĝ^{geom}`. Under the chosen normalized semidirect comparisons, the map from the pinned `M-group` to the pinned `G-group` is `(m,w)↦(ι(m)t_M(w)^{-1}t_G(w),w)`. Here `t_G/t_M=(2ρ̂_G−2ρ̂_M)(κ(w))` centralizes `M̂`. Nested Levis multiply these correction cocycles and their degree shifts add. Thus this is a naturality theorem with a specified Weil correction, not unqualified restriction along the untwisted inclusion.

Transport the geometric CT map through the two explicit semidirect comparison isomorphisms; multiply the two cocycles in the common torus.

([FS](#source-fs), VI.9.6 p230; VI.11.1 pp238–240; IX.7.1 p334.)

*Needs:* [Normalized equivalence](#normalized-satake-equivalence); [Symmetric constant terms](#symmetric-constant-term); [Generic root datum](#generic-root-datum); ReductiveGroupsPartII RG2.5.

### Group maps, products, restriction of scalars and inversion

Track component gradings for adjoint-isomorphism maps and the permutation of conjugate factors for Weil restriction. Induction enters through the geometric correspondence, not as an arbitrary strong monoidal functor. Inversion retains its canonical inner sign.

<a id="adjoint-isomorphism-naturality"></a>

**Naturality for adjoint-isomorphism maps** (`adjointIsomorphismNaturality`). For `f:G′→G` inducing an isomorphism on adjoint groups, componentwise pushforward of the corresponding bounded Grassmannian sheaves intertwines normalized Satake with restriction along the dual map `Ĝ→Ĝ′`. Component refinements, central characters, Weyl actions, tensor constraints, half twists and finite-set collisions commute with this comparison. This includes central isogenies and the adjoint reduction used for integral recovery; no inverse equivalence for a general central isogeny is asserted.

The map of Grassmannians is a componentwise isomorphism; its essential change is the map of component gradings. Pushforward corresponds to forgetting/refining the appropriate dual central character.

([FS](#source-fs), VI.11.1 proof pp237–239; IX.6.1 pp330–331.)

*Needs:* [Normalized equivalence](#normalized-satake-equivalence); [Torus and rank one](#torus-and-rank-one-identification); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); ReductiveGroupsPartII RG2.5; [Loop spaces](#loop-groups-and-local-hecke); [Beilinson–Drinfeld Grassmannian](#grassmannian); [Generic Schubert bounds](#schubert-bounds-and-properness).

<a id="product-naturality"></a>

**Product naturality** (`productNaturality`). For `G=G₁×G₂` the external product of Grassmannian sheaves and normalized Satake identify `Ĝ` with `Ĝ₁×Ĝ₂` and carry `V₁⊠V₂` to `S_{V₁}⊠S_{V₂}`. Tensor, fibre, root pinning, Weil action and all finite-set operations agree. This is a statement for external products and their induced categorical comparison, not a claim every representation is itself an external tensor product.

The loop/torsor and bounded Schubert constructions split as products; Künneth splits total cohomology and constant terms.

([FS](#source-fs), IX.6.2 p331; VI.10.3 pp234–235.)

*Needs:* [Normalized equivalence](#normalized-satake-equivalence); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); ReductiveGroupsPartII RG2.5; [Loop spaces](#loop-groups-and-local-hecke); [Beilinson–Drinfeld Grassmannian](#grassmannian); [Generic Schubert bounds](#schubert-bounds-and-properness).

<a id="weil-restriction-naturality"></a>

**Weil restriction naturality** (`weilRestrictionNaturality`). For a finite separable E′/E and `G=Res_{E′/E}G′`, the dual pinned group is the product of conjugates of `Ĝ′` indexed by embeddings `E′→Ē`, with its permutation Weil action. After pullback to the E′ divisor base, the closed Grassmannian immersion for the chosen embedding and proper pushforward implement the representation procedure: project to `Ĝ′`, inflate from `Ĝ′⋊W_{E′}` to `Ĝ⋊W_{E′}`, then induce to `Ĝ⋊W_E`. This comparison is compatible with total cohomology, tensor/collision coherences and the two field-specific half twists; it is not an equivalence replacing `W_E` by `W_{E′}` without induction.

Import the group-scheme Weil restriction and its pinned dual permutation datum. Use the pullback of the divisor leg base and the chosen-embedding closed Grassmannian immersion. The proper pushforward is finite-index induction on Weil representations by the Drinfeld realization, matching IX.6.3. Track residue degree `f` via `q_{E′}=q_E^f` and compatible half-root choices. Construct the finite-set/tensor comparisons through the geometric correspondences, not by claiming induction is strong monoidal on arbitrary representations; its compatibility uses the particular `Hecke/factorization` diagram.

**Checks.** For `E′=E` the construction is identity. For a quadratic induced torus the two geometric character factors are permuted by `W_E`; forgetting that permutation fails. Half roots must satisfy `r_{E′}=r_E^f` when compatible normalization is claimed.

([FS](#source-fs), IX.6.3 pp331–332.)

*Needs:* [Normalized equivalence](#normalized-satake-equivalence); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Loop spaces](#loop-groups-and-local-hecke); ReductiveGroupsPartII RG2.5; ReductiveGroupsPartII RG2.0a; [Beilinson–Drinfeld Grassmannian](#grassmannian); [Generic Schubert bounds](#schubert-bounds-and-properness).

<a id="chevalley-involution"></a>

**Chevalley involution with its inner sign** (`chevalleyInvolution`). Under canonical dual identification, sw* acts by `Ad(ρ̂(-1))∘θ` on `Ĝ`, where `θ` is the pinned Chevalley involution with lattice action `μ↦−w₀μ` and `ρ̂(-1)` is evaluated in the adjoint dual torus. It commutes with the geometric Weil action. Internal dual is `sw*D`, not sw* alone. The inner correction affects the canonical tensor/fibre comparison although it disappears after quotienting dual parameters by conjugacy.

Reduce via adjoint-isomorphism maps to the simply connected dual and then by rank-one constant terms to `PGL₂`.

**Checks.** For `PGL₂` the root-line sign is -1, so omitting `ρ̂(-1)` gives the wrong fibre comparison when 2 is invertible. For a torus `w₀=1` and `θ` inverts characters; for coefficients of characteristic two the inner signs reduce to one.

([FS](#source-fs), Proposition VI.12.1 and proof pp239–241.)

*Needs:* [Pinned dual group](#dual-group-identification); [Normalized equivalence](#normalized-satake-equivalence); [Fusion and Verdier duality](#fusion-verdier-duality); [Symmetric constant terms](#symmetric-constant-term); [Torus and rank one](#torus-and-rank-one-identification); ReductiveGroups Layer 9.

### Extension to perfect representation complexes

Apply the all-prime relative classifying-stack base-change and stable completion interfaces. The resulting functor lands in the stable idempotent closure of representation kernels; that containment does not establish full faithfulness or equality with the entire closure.

<a id="representation-complex-interface"></a>

**All-prime representation-complex interface** (`representationComplexInterface`). Let `Ĝ` be a split reductive group over `ℤ_ℓ[r]`, `Q` a finite group acting through pinned automorphisms, `I` finite, and `Λ` a commutative `ℤ_ℓ[r]`-algebra. Prove the relative base-change equivalence

`Perf(B(Ĝ⋊Q)^I) ⊗_{Perf(BQ^I)} Perf(BQ^I_Λ) ≃ Perf(B(Ĝ⋊Q)^I_Λ)`.

Prove that the stable idempotent completion of the exact category of finite-projective algebraic representations, with exact sequences split on underlying coefficient modules and its `Rep(Q^I)`-module structure retained, has the universal property used to extend exact linear monoidal functors to this relative perfect category. State the universal property as an equivalence of spaces of such coherent functors and natural equivalences, including coefficient base change and finite-set reindexing. The intended signatures are a `Perf(BQ^I)`-linear equivalence and a functor-space equivalence, not an ordinary equivalence of arbitrary categories. Provide `representationPerfectBaseChange`, `representationStableCompletion`, `representationExtension_unique` and their tensor, coefficient and finite-set coherence APIs. ([FS](#source-fs), IX.2, p. 321, with its use of highest-weight base change and extension from finite-projective representations.) Use LanglandsParameterStacks §LP3.0 for highest-weight and good-filtration theory; prove the additional relative integral and stable-completion assertions here. The parameter-stack generation theorem in its §LP4.2 has a prime restriction and a different target.

**Checks.**

- For the trivial group the completion is the ordinary perfect category over `Λ`, and a finite projective module is sent to the same degree-zero complex.
- For a split torus the comparison preserves the character grading, shifts, cones and retracts, so weight `m` is not identified with weight `−m`.
- For `Ĝ=PGL₂` and `ℓ=2`, the base-change and extension statement still applies; no invertibility of `|π₁(Ĝ)_tors|` is assumed.

*Needs:* LanglandsParameterStacks §LP3.0; ReductiveGroups Layer 9; ReductiveGroupsPartII §RG2.5; AlgebraicVectorBundles §§L0A–L0C; EnhancedDerivedSheaves §§E1.8, E5:abstract.1–E5:abstract.4, E5:presentability.1; SchemeAndStackFoundations §2.18.

<a id="enhanced-perfect-satake-extension"></a>

**Perfect-complex Satake extension** (`perfectSatakeFunctor`). Fix `ℓ≠p`, a finite quotient `Q` of `W_E` through which the pinned action on `Ĝ` factors, and a `Z_ℓ[r]`-algebra `Λ` with `r²=q`. Compose normalized Satake on finite projective representations of `(Ĝ⋊Q)^I` with `A↦D(A)^∨`, using Verdier duality relative to `Hck^I_G→[(Div¹)^I/L⁺G]`. This is an exact `Rep_Λ(Q^I)`-linear monoidal functor into the enhanced local Hecke convolution category `D■(Hck^I_G,Λ)`. Using the all-prime base change and universal stable completion of the preceding representation-complex interface, extend it uniquely to a `Perf(BQ^I_Λ)`-linear exact monoidal functor `Perf(B(Ĝ⋊Q)^I_Λ)→D■(Hck^I_G,Λ)`, coherent in `I`. Its fusion comparisons give symmetry on the Satake image. Its values lie in the stable idempotent closure of these Satake kernels. Equality with that closure, full faithfulness, and an equivalence with the whole enhanced category are not supplied by this extension theorem.

First define the exact representation functor over `Z_ℓ[r]` and compose with relative Verdier dual followed by internal dual. The enhanced target convolution uses pullback, tensor and `π♮`, which have the required infinity-category coherence. Import the relative highest-weight base-change equivalence `Perf(B(Ĝ⋊Q)^I_{Z_ℓ[r]}) ⊗_{Perf(BQ^I_{Z_ℓ[r]})} Perf(BQ^I_Λ) ≅ Perf(B(Ĝ⋊Q)^I_Λ)`. Import the free stable/idempotent completion universal property for exact finite-projective representations, then extend the kernel functor and its finite-set comparisons uniquely. Use the relative integral base-change and stable-completion theorems of the preceding representation-complex interface; the parameter-stack generation theorem has different hypotheses. The free stable/idempotent completion gives containment of the image in the stable idempotent closure of the representation kernels. It does not lift arbitrary enhanced morphisms or idempotents, so it does not prove equality of that closure with the essential image.

Provide the following API.

- `perfectSatakeFunctor`: The exact `Perf(BQ^I)`-linear monoidal functor on `Perf(B(Ĝ⋊Q)^I)`.
- `perfectSatake_onRepresentation`: On a finite-projective representation `V` its value is `D(S_V)^∨` in local enhanced convolution.
- `perfectSatake_baseChange`: Scalar extension `Λ→Λ′` commutes with the functor through the specified relative Perf base-change equivalence.
- `perfectSatake_exact`: The extension preserves zero objects, cofibres, shifts and retracts.
- `perfectSatake_finiteSets`: The extension of all collision, permutation and unit comparisons has the same composition coherences.
- `perfectSatake_unique`: Restriction along the representation embedding identifies the space of exact linear monoidal extensions with that of exact linear monoidal representation functors. A specified coherent isomorphism of restriction functors extends uniquely in this sense; agreement of object values alone is insufficient.

**Checks.**

- The trivial representation gives the convolution unit.
- V[1] maps to `D(S_V)∨[1]`.
- For `G=SL₂` and `ℓ=2≠p`, dual `PGL₂` has `π₁` of order two; the extension still applies.


([FS](#source-fs), IX.2 p321.)

*Needs:* [Normalized equivalence](#normalized-satake-equivalence); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Fusion and Verdier duality](#fusion-verdier-duality); [Representation-complex interface](#representation-complex-interface); EnhancedDerivedSheaves §E0.4; EnhancedDerivedSheaves §§E0.4, E5:abstract.4; EnhancedDerivedSheaves §§E5:abstract.4, E5:presentability.1; EnhancedDerivedSheaves §E5:abstract.1; VStackSheavesAndLisseCategories VS3; DiamondSixOperations §§S6.1–S6.3.


### Examples

For `G=PGL₂`, the minuscule fibre is `Λ⊕Λ(−1)` and the reconstructed integral group is `SL₂`, including at `ℓ=2≠p`. At that prime the diagonal torus normalizer has three invariants in the fourth tensor power, while the convolution fibre and `SL₂` have two. This excludes that normalizer and its Frobenius-preimage alternatives by the stated higher-power tilting argument. For `G=SL₂` the dual is `PGL₂`; the perfect-complex extension still applies at `ℓ=2`. Normalization on the minuscule `PGL₂` cell gives `Λ[1](1/2)` with eigenvalues `r⁻¹,r`.

### Dependencies

GS0–GS3 and the GS4 reconstruction targets; ReductiveGroups Layers 3, 6, 7 and 9; ReductiveGroupsPartII RG2.0, RG2.0a, RG2.3–RG2.5; LanglandsParameterStacks §LP3.0; EnhancedDerivedSheaves E1.8, E5; VStackSheavesAndLisseCategories VS1, VS3; DiamondSixOperations S6.

## Layer GS4: Frobenius traces and classical spherical Satake

### Normalized traces, convolution and constant terms

Use Frobenius-equivariant finite-type models and the existing constructible trace formula. The component sign cancels the perverse-shift sign. Normalize both Haar measures, then compare weight coefficients with the already constructed spherical transform. Prove the additional Frobenius/relative-weight descent in the unramified nonsplit case.

<a id="normalized-frobenius-function"></a>

**Normalized Frobenius function** (`normalizedTraceFunction`). Assume `G` is unramified with a reductive `O_E`-model and hyperspecial `K=G(O_E)`, and work rationally over a field `L` containing `Q_ℓ` and a chosen `r` with `r²=q`. A bounded Satake object A with a specified Frobenius descent structure is represented on its finite-type special-fibre model. Correct the raw alternating trace of the specified sheaf by changing its sign exactly on the odd components. For homogeneous support parity `ε(A)`, define `τ_A(g)=(-1)^{ε(A)} Σ_i(-1)^i Tr(Frob_q;H^i(A_{ḡ}))`; add this over even/odd summands. Geometric Frobenius acts on `L(1)` by `q^{-1}`; for the explicit IC formulas use the canonical Frobenius descent of the constant sheaf on the open Schubert stratum, and the sheaf `IC_μ` is normalized as `j_{!*}L[d_μ](d_μ/2)`, `d_μ=⟨2ρ,μ⟩`, using `r^{-d_μ}` for the half twist. The function is `K-biinvariant` with bounded double-coset support. A geometric object without Frobenius descent has no specified trace function.

Use the finite-type special-fibre model and Frobenius-equivariant constructible realization, rather than counting points of an arbitrary diamond.

Provide the following API.

- `normalizedTraceFunction`: The parity-corrected alternating geometric Frobenius stalk trace of a Frobenius-descended Satake object.
- `normalizedTrace_add`: Direct sums add trace functions, with parity correction applied separately to the two component summands.
- `normalizedTrace_halfTwist`: For any integer `d`, twisting the specified descent by (d/2) multiplies the geometric Frobenius trace by `r^{-d}`.
- `normalizedTrace_biinvariant`: Values are constant on `K-double` cosets and vanish outside finitely many bounded relative positions.
- `normalizedTrace_minuscule`: For a minuscule `μ` with canonical constant-sheaf IC Frobenius descent, `τ_{IC_μ}=r^{-d_μ}1_{Kμ(π)K}`; scaling the descent scales this function.

**Checks.**

- With canonical descent, `τ_unit=1_K` with coefficient +1.
- For `G_m`, weight `n` and canonical descent, `τ=1_{πⁿO_E×}`.
- For `PGL₂`, `d=1` and canonical IC Frobenius descent, `τ=r⁻¹1_{Kμ(π)K}`; the raw trace has the opposite sign.


([Zhu](#source-zhu), §2.2 pp434–436, equations (2.2.7)–(2.2.10); [Gross](#source-gross), §3 pp6–8, (3.3), (3.4), (3.6), (3.13); §8 pp15–16 for choices of normalization.)

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3; EtaleCohomologyFoundations §§F.10.2b, F.10.3; [Satake support parity](#support-parity); [One-leg ULA special/generic comparison](#integral-family-comparison); [Normalized equivalence](#normalized-satake-equivalence); SchemeAndStackFoundations §§0.24–0.26; SmoothRepresentationsOfLocalGroups SR.4; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="trace-convolution"></a>

**Frobenius trace and convolution** (`traceConvolution`). Normalize Haar measure on G(E) by `vol(K)=1`. For Frobenius-descended rational Satake objects, `τ_{A*B}=τ_A*τ_B`, where the right side is spherical Hecke convolution with this measure; unit maps to `1_K`. The same assertion holds for the existing convolution via its fusion comparison. This is additive on the Grothendieck group of the exact Frobenius-descended category, not an equivalence between all Weil sheaves and arbitrary functions.

On the finite-type bounded convolution correspondence use Künneth for stalk tensor traces and the proper/compact-support Frobenius trace formula for pushforward. The rational point sum matches double-coset convolution with `vol(K)=1`.

([Zhu](#source-zhu), §2.1 pp430–433 and §2.2 pp434–436; [Gross](#source-gross), §2–§3 pp3–7, measure convention quoted in §3.)

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3; EtaleCohomologyFoundations §§F.10.2b, F.10.3; [Normalized Frobenius function](#normalized-frobenius-function); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Ambient Hecke convolution](#convolution-diagram); SchemeAndStackFoundations §§0.24–0.26; SmoothRepresentationsOfLocalGroups SR.4; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="trace-constant-term"></a>

**Frobenius trace and normalized constant terms** (`traceConstantTerm`). In the split case choose `B=TN` and dn on N(E) with `vol(N(O_E))=1`. The classical transform imported from SR.4 is `S(f)(t)=δ_B(t)^{1/2}∫_N` f(tn)dn, where `δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}`. For a Frobenius-descended normalized IC object, `S(τ_A)` is the weight-by-weight Frobenius character of its normalized cohomology fibre, with the shifted constant-term degree `⟨2ρ,λ⟩` and the matching half Tate normalization included. Here normalized fibre means the weight fibre of the transported normalized dual representation: the geometric cohomological Weil twist must be undone; it is not the unmodified ungraded total-cohomology trace. The corresponding statement for a Levi uses `deg_P` and the difference `ρ_G−ρ_M`. For unramified nonsplit `G` descend this formula using the relative `Weyl/Frobenius` datum supplied by SR.4; the split integral over `N` is not copied verbatim with absolute weights.

The compact-support trace formula on each semi-infinite weight intersection turns CT into the `N-integral`. Cohomological degree shift gives `(-1)^{deg}`, and the normalized half twist and Haar modulus give `q^{-⟨ρ,λ⟩}`. Apply Zhu (2.2.7)–(2.2.10) to the IC weight calculation. Track ordinary character rather than a supercharacter using the parity correction. For nonsplit unramified groups use the Frobenius-equivariant model and relative SR.4 transform; the exact descent/source adapter is part of this target.

**Checks.** For a split torus `N=1` and `δ=1`, so the transform is identity on weight indicators. For a split minuscule `μ`, the coefficient of each extremal weight matches the normalized representation character; omitting the half twist inserts `q^{⟨ρ,μ⟩}`.

([Gross](#source-gross), §3 pp6–8, equations (3.4), (3.5), (3.6); [Zhu](#source-zhu), §2.2 pp434–436, equations (2.2.7)–(2.2.10).)

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3; EtaleCohomologyFoundations §§F.10.2b, F.10.3; [Normalized Frobenius function](#normalized-frobenius-function); [Symmetric constant terms](#symmetric-constant-term); [Levi naturality and normalization](#levi-naturality); SchemeAndStackFoundations §§0.24–0.26; SmoothRepresentationsOfLocalGroups SR.4; ReductiveGroupsPartII RG2.5.

<a id="classical-satake-comparison"></a>

**Classical and geometric Satake comparison** (`classicalSatakeComparison`). For the unramified/hyperspecial finite-field setting, the diagram from Frobenius-descended rational Satake objects to spherical Hecke functions by `τ` and to normalized dual representations by Satake commutes with the SR.4 spherical transform and Frobenius character on the dual torus. In the split IC basis with its canonical constant-sheaf Frobenius descent, `S(τ_{IC_μ})=χ_μ` and `S(1_{Kμ(π)K})=q^{⟨ρ,μ⟩}χ_μ` plus lower dominant characters; for minuscule `μ` the lower terms vanish. The nonsplit statement uses the appropriate Frobenius-twisted/relative character datum of SR.4. Both constructions precede this comparison; none of integral reconstruction, rational reductivity, SR.4 or fusion depends on it.

Use the normalized trace/constant-term equality to identify all weight coefficients with the dual character, then apply the already constructed SR.4 isomorphism. The IC leading term is `r^{-d_μ}` times the top double-coset indicator, so the triangular comparison agrees with Gross (3.9)–(3.13) and Zhu (2.2.7)–(2.2.10). Descend the commuting diagram with Frobenius and the pinned action in the unramified nonsplit case. The nonsplit Frobenius/relative-weight comparison is part of this target; Gross supplies the split calculation.

**Checks.** For `G_m` and weight `n` both paths give `z^n`. For `PGL₂` minuscule `μ`, `S(r^{-1}1_{Kμ(π)K})` is the `SL₂` standard character `z+z^{-1}`. An unnormalized odd perverse trace would give its negative and fails the comparison.

([Gross](#source-gross), §3 pp7–8, Proposition 3.6 and (3.13); [Zhu](#source-zhu), §2.2 pp434–436, (2.2.7)–(2.2.10).)

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3; EtaleCohomologyFoundations §§F.10.2b, F.10.3; [Normalized equivalence](#normalized-satake-equivalence); [Frobenius trace and convolution](#trace-convolution); [Frobenius trace and normalized constant terms](#trace-constant-term); [Geometric rational semisimplicity](#rational-semisimplicity); SmoothRepresentationsOfLocalGroups SR.4.

### Examples

For `G_m` and the canonical descent of the weight-`n` point sheaf, the trace is the characteristic function of `πⁿO_Eˣ` and the spherical transform sends it to `z^n`. For the minuscule `PGL₂` object the raw alternating trace on the open double coset is `−r⁻¹`; the component correction yields `r⁻¹`. With both compact subgroups of volume one, the spherical transform is then `z+z⁻¹`, the `SL₂` standard character. Changing the descent scalar changes the trace by the same scalar.

### Dependencies

GS0–GS3 and the normalized GS4 equivalence; SmoothRepresentationsOfLocalGroups §SR.4; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3; EtaleCohomologyFoundations §§F.10.2b, F.10.3; SchemeAndStackFoundations §§0.24–0.26; ReductiveGroupsPartII RG2.5.

## Downstream consumers

The local Grassmannian and finite-loop geometry feeds HeckeStacksAndLocalShtukas, local modification spaces, and BunGAndNewtonStrata, local bundle modifications. The normalized multileg and perfect-complex functors feed ExcursionOperatorsAndSpectralAction, Hecke action. Those constructions use the full finite-set coherence and normalized Weil action specified here.

The Satake input to IgusaVarietiesAndTorsionConcentration's geometric Hecke
action is the common GS1–GS4 package: `satakeCategory`, `heckeConvolution`,
`fusionProduct`, `drinfeldFibreRealization` and `normalizedSatakeEquivalence`.
Its geometric single-divisor version is the restriction of this package to
that fibre. Application names for these categories and equivalences denote
the same constructions, with the coefficient, collision, Weil and inner
Cartan comparisons transported together. The Witt determinant and
projectivity arguments and integral rank-one calculations here supply the
geometric proofs used by this common package.

## Sources and editions

Page numbers in the result references are printed pages except where explicitly labelled PDF pages. The editions below determine the theorem numbering. The mathematical statements above incorporate the stated coefficient, descent, rank-one and model qualifications.

<a id="source-fs"></a>

FS. Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; PDF page `=` printed page.

<a id="source-bs"></a>

BS. Bhargav Bhatt, Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490). arXiv:1507.06490v3, 61-page PDF; PDF page `=` printed page.

<a id="source-sw"></a>

SW. Peter Scholze, Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Author-hosted Berkeley Lectures PDF dated March 27, 2020; PDF page `=` printed page + 10.

<a id="source-zhu"></a>

Zhu. Xinwen Zhu, [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Published Annals 185 (2017), pp. 403–492; PDF page `=` printed page − 402.

<a id="source-pr"></a>

PR. Georgios Pappas, Michael Rapoport, [Twisted loop groups and their affine flag varieties](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/twistedloop.pdf). Author preprint dated August 17, 2006, 72-page PDF; printed and PDF pages agree.

<a id="source-cs"></a>

CS. Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Published Annals 186 (2017); PDF page `=` printed page − 648.

<a id="source-glx"></a>

GLX. Ian Gleason, Dong Gyu Lim, Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Published Inventiones 243 (2026), pp. 805–861; PDF page `=` printed page − 804.

<a id="source-aglr"></a>

AGLR. Johannes Anschütz, Ian Gleason, João Lourenço, Timo Richarz, [On the p-adic theory of local models](https://arxiv.org/abs/2201.01234v1). arXiv:2201.01234v1, 53-page PDF; printed and PDF pages agree.

<a id="source-vh"></a>

vH. Pol van Hoften, [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Published Cambridge PDF, PDF pages used as locators.

<a id="source-he"></a>

He. Xuhua He, [Cordial elements and dimensions of affine Deligne–Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Published Forum of Mathematics Pi 9 (2021), e9; PDF page `=` printed page.

<a id="source-gross"></a>

Gross. Benedict `H`. Gross, [On the Satake isomorphism](https://people.math.harvard.edu/~gross/preprints/sat.pdf). Author preprint, 17 pages; printed and physical pages agree.

<a id="source-py"></a>

PY. Gopal Prasad and Jiu-Kang Yu, [On quasi-reductive group schemes](https://math.stanford.edu/~conrad/papers/qrg.pdf). Author-hosted preprint: Corollary 1.3, proof §5.4 p12. FS calls the published result Corollary 5.2; the editions have different numbering.

<a id="source-dm"></a>

DM. Pierre Deligne and James `S`. Milne, [Tannakian categories](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf). Author-hosted notes revised 15 August 2012; statements numbered 2.20, 2.22, 2.23; pp24–27.

<a id="source-dh"></a>

DH. Stephen Doty and Anne Henke, [Decomposition of tensor products of modular irreducibles for SL2](https://arxiv.org/pdf/math/0205186). arXiv:math/0205186v1, 24-page PDF; header dated 16 May 2002, title page dated 28 May 2022; physical and printed pages agree.
