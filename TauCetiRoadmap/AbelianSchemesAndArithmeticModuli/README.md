# Roadmap: abelian schemes and arithmetic moduli (the Jacobian challenge, part II)

**Summary.** This roadmap develops abelian schemes over arbitrary bases and the arithmetic of
abelian varieties over arbitrary fields, starting where the Jacobian challenge stops. That roadmap
builds abelian varieties over a field, the Jacobian of a pointed curve and its universal property.
This one defines abelian schemes over any base scheme, nonreduced bases included. It proves
rigidity, the cube theorem and the seesaw principle in families. It constructs the dual abelian
scheme, polarizations and the canonical doubled graph bundle, and quotients by finite locally free
subgroups, with Cartier-dual kernels and Weil pairings. It builds the degree-one realizations: the
prime-to-characteristic Tate module, the universal vector extension and first de Rham cohomology,
Barsotti–Tate groups, their contravariant crystalline Dieudonné crystals and Tate twists,
and the degree-one divided-power realization. It proves the deformation theorems of Serre–Tate and
Grothendieck–Messing, with ordinary Serre–Tate coordinates and the
finite-level lifting statements used for abelian surfaces. Over `ℂ` it supplies the lattice
uniformization, the Hermitian and homological structure of Riemann forms, the Appell–Humbert theorem, the polarized Hodge equivalence and the
Siegel universal family. Over a field it proves the arithmetic of Hom: degrees,
characteristic polynomials, ℓ-independence, finiteness of Hom, Poincaré complete reducibility,
semisimplicity of the endomorphism algebra, positivity of the Rosati involution, finiteness and
level rigidity of polarized automorphisms, and Néron–Severi finiteness. Its exports are coefficient
Hom spaces, localized isogeny categories, torsor twists, Weil restriction, quadratic twists and the
Hodge line bundle; the polarized moduli stacks that consume them are built elsewhere.

Every object keeps its scheme structure. Degrees of isogenies and torsion subgroups are
finite-flat ranks, never counts of geometric points. Every comparison carries its sign and
normalization: the Mumford map, the Poincaré bundle rigidified on both zero sections, the factor 2
in the graph bundle, the cyclotomic twist in Weil pairings, and the weight and sign of the complex
Hodge structure.

| Layer | Title | Headline targets |
| --- | --- | --- |
| A0 | The carrier and its boundaries | `AbelianScheme`, `fieldAndEllipticBoundary`, `abelianPicardInputs` |
| A1 | Rigidity, Serre tensor, normalized line bundles and relative extension | `relativeProductsAndDimension`, `relativeRigidity`, `relativeInvariantForms`, `relativeSerreTensor`, `relativeSeesaw`, `relativeCube`, `relativeEllipticEquivalence`, `torsionRestriction`, `weilExtension` |
| A2 | Duality, polarizations and ample classes | `raynaudRepresentability`, `AbelianScheme.dual`, `mumfordMap`, `Polarization`, `Polarization.graphBundle`, `ampleCohomologyAndDegree`, `projectivePresentation`, `nefNormalizedLines`, `AbelianNS` |
| A3 | Isogenies, finite-flat quotients, torsion and pairings | `IsAbelianIsogeny`, `multiplicationAndDensity`, `AbelianQuotient`, `torsionDivisibility`, `dualIsogenyCartierKernel`, `ThetaGroup`, `polarizedWeilPairing`, `FullLevel`, `Polarization.rosati`, `principalQuotient`, `symmetricHomRealization` |
| A4 | Realizations and deformations | `AbelianTate`, `AbelianVectorExtension`, `AbelianH1dR`, `exteriorCohomology`, `BarsottiTate`, `AbelianPD`, `LogCrystalline.dieudonneEvaluation.evaluate`, `grothendieckMessing`, `serreTate`, `SerreTate.q`, `oddPrimeLifting`, `dyadicOrdinaryLifting` |
| A5 | Complex uniformization and families | `AbelianLattice`, `RiemannForm.homological`, `polarizationType`, `appellHumbert`, `polarizedHodgeEquivalence`, `analyticFamilies`, `SiegelFamily` |
| A6 | Arithmetic Hom and exports | `Hom.deg`, `exists_charpoly`, `homFreeFinite`, `poincareReducibility`, `endQ_isSemisimple`, `charpolyTate`, `rosatiPositivity`, `polarizedAutomorphisms`, `CoefficientHom`, `LocalizedHom`, `AbelianTwist`, `weilRestriction`, `QuadraticAbelianTwist`, `Morikawa`, `AbelianHodgeLine` |

## Scope and ownership

**Owned here.** The relative carrier `AbelianScheme S` and its comparison with Tau Ceti's field
carrier and with the elliptic curves of ModularCurves. Products, base change and relative
dimension; rigidity over nonreduced bases and automatic commutativity; invariant differentials;
Serre tensor for arbitrary ring actions and finite projective right modules, with functoriality,
independence of projective splittings, arbitrary base change and realization comparisons;
the relative seesaw, cube and multiplication-pullback formulas for rigidified line bundles; the
relative elliptic equivalence; torsion restrictions of rigidified line bundles; extension from
the generic fibre of every smooth test scheme over a connected Dedekind base. Raynaud's theorem
that abelian algebraic spaces are schemes; the dual abelian scheme with its Poincaré bundle;
the Mumford map and its biextension identities; polarizations, their local ample
representatives and the canonical graph bundle with its cubic embedding; ample cohomology,
Riemann–Roch and the degree of `φ_L`; projective presentations over normal bases; nefness of
normalized lines over curves; the Néron–Severi group of an abelian variety. Isogenies over a base;
multiplication maps and prime-to-characteristic torsion density; quotients by finite locally free
subgroups; dual isogenies with Cartier-dual kernels and Weil pairings; theta groups and polarized
descent; polarized Weil pairings; full level structures; the Rosati involution; the effective
divisor criterion; principal quotients; the genus-two 2-torsion model. The integral
prime-to-characteristic Tate module; the universal vector extension; relative `H¹_dR` with its Hodge
sequence and Gauss–Manin connection; the exterior structure of all cohomology; full and truncated
Barsotti–Tate groups of arbitrary height over arbitrary bases, with truncation, restriction and
Cartier duality; their contravariant crystalline Dieudonné crystals for full groups,
Frobenius and Verschiebung, Cartier duality with Tate twist −1, and Grothendieck–Messing deformation
theory over locally PD-nilpotent thickenings; the degree-one divided-power realization;
Grothendieck–Messing and Serre–Tate for abelian schemes with structures; ordinary Serre–Tate
coordinates and the
weighted polarization equations; polarized effectivity; the odd-prime and dyadic finite-level lifting
theorems and the genus-two Jacobian comparison. Over `ℂ`: lattice uniformization, the Hermitian, principal and homological structure of Riemann forms,
polarization types, Appell–Humbert and algebraicity, the polarized Hodge equivalence, analytic
families and the Siegel universal family. Over a field: degree, characteristic polynomial and
trace of endomorphisms with their ℓ-adic comparison, finiteness and saturation of Hom, complete
reducibility, semisimplicity, Rosati positivity, rational Néron–Severi and the ample cone,
polarized automorphisms, polarization orbits, full-level descent of homomorphisms, Frobenius
semisimplicity, coefficient Hom spaces and isogeny torsors, real isometries, localized isogeny
categories, weak polarizations, torsor twists and their realizations, Weil restriction of abelian
schemes and its Tate module, quadratic twists, curve-generated subvarieties, the
Matsusaka–Morikawa endomorphism, the CM isotypic decomposition and the Hodge line bundle.

The abelian-specific prime-to-characteristic torsion (A3.2), integral Tate module (A4.1),
algebraic characteristic polynomial and trace, and their Tate-module and finite-level comparisons
(A6.10–A6.11) are constructed here on the shared carriers. Their proof order is multiplication and
finite-flat torsion, then the Tate module, then degree polynomials, finite-rank Hom and linear
algebra. These targets use no cohomological trace formula. The abelian cohomology computation
(A4.4) is a separate specialization of the generic cohomological supplier contracts below.

**Built in Tau Ceti and cited.**

- *The Tau Ceti library.* `TauCeti.AlgebraicGeometry.AbelianVariety K` (a proper geometrically
  integral group scheme over `Spec K`, with smoothness, geometric connectedness, integrality and
  commutativity derived), its category with commutative Hom groups, `End A` as a ring,
  `mulBy A n`, products `prod`, `fst`, `snd`, `lift`, base change along field extensions,
  `IsIsogeny` (finite and surjective), `TangentSpace` with
  `finrank_tangentSpace_eq_finrank_cotangentSpace`; isogenies of group schemes over an affine base,
  `TauCeti.GroupScheme.IsIsogeny` (finite, flat and surjective); closed subgroup
  schemes `ClosedSubgroupScheme`; the Hodge structures `TauCeti.Hodge.HodgeStructureOn`,
  `HodgeStructure`, `HodgeStructureOn.dual`, `IsPolarization`, `Polarization`, the weight-one
  criterion `isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`, and
  `TauCeti.AlmostComplexStructure`; the Lie exponential `lieExp` with
  `isLocalDiffeomorphAt_lieExp_zero`; the Cartier duality base-change equivalence
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`. The library also
  supplies: `finrank_tangentSpace_eq_dim`; the rigidified Picard functor
  `rigidifiedPicardFunctor` and `RigidifiedLineBundle`; the Tate module of an abelian group
  `TauCeti.TateModule p A`
  with its `ℤ_p`-module structure and `TateModule.free_of_natCard`; kernels of homomorphisms of
  group schemes over a base with their base change (`TauCeti/AlgebraicGeometry/GroupScheme/Kernel`);
  over a field, `isMonHom_of_one_hom` (a pointed morphism of abelian varieties is a homomorphism)
  and `AbelianVariety.Hom.equivPointed`; the Albanese predicate `AbelianVariety.IsAlbanese`; Riemann
  forms `TauCeti.AlmostComplexStructure.IsRiemannForm`, with the weight-one Hodge structure
  `latticeHodgeStructure` of a complex structure on a lattice, `latticeHodgeStructureEquiv`,
  `IsRiemannForm.polarization` and `isRiemannForm_iff_isPolarization`; and symplectic bases of
  nondegenerate alternating forms over a field, `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`.
- *JacobianChallenge, Layers D, E and F.* Over a field: the relative Picard functor of a pointed
  curve, its rigidification by the Poincaré bundle and the Jacobian `Pic⁰` (Layer D); the dual
  abelian variety, the theorem of the cube and the square, polarizations (with the principal
  polarization of a Jacobian) and `[n]` as an isogeny (Layer E); the Abel–Jacobi morphism and its
  Albanese universal property (Layer F). Everything here over a general base, or beyond those
  field statements, extends them; over a field the targets below are stated against their carriers.
- *ModularCurves.* Finite locally free commutative group schemes and Cartier duality (0B);
  effective descent of finite locally free schemes and groups (0E);
  relative Weierstrass models and pole sheaves (1C); the scheme-theoretic group law (1D);
  multiplication, isogenies, quotients, the Picard dual, Cartier–Nishi duality and the Weil pairing
  of elliptic curves (2A–2F); the elliptic `p`-divisible tower and the connected–étale sequence of a
  finite locally free commutative group scheme over a henselian local ring (7E, PD-1 and PD-2); the
  elliptic Serre–Tate equivalence (7F, ST-1). The abelian-scheme statements below specialize to
  these in relative dimension one, and the comparison is a target (A0, A1).
- *EllipticCurves, Layer 2.* The equation-level Weil pairing and Tate module of an elliptic curve.
- *AlgebraicVectorBundles, L0B, L0C, L2A, L2B.* Finite locally free sheaves, duals, exterior powers,
  determinants, arbitrary pullback and the vector group `V(F) = Spec Sym(F^∨)` of a finite locally
  free sheaf.
- *StableReduction, Layer 2.* Relative Gorenstein-curve duality and dualizing bundles
  of smooth proper curves and effective étale descent of schemes with a compatible relatively ample
  invertible sheaf, including morphisms, sections and group operations (Layer 2).

**Built in other roadmaps and cited.**

- *[ComplexTori](https://github.com/Paul-Lez/TauCetiRoadmap/blob/583f86009a6841d01e758fdefec6ff41014b2f6a/TauCetiRoadmap/ComplexTori/README.md).* Milestone 1 owns the compact complex Lie-group structure on the standard
  additive orbit quotient, descended lattice-preserving maps, and natural covering and homology
  identifications. Milestones 2–3 own holomorphic period families over complex manifolds and
  equivariant maps and descent. Milestone 4, Integral connecting class, step 6 supplies the
  lattice-torsion equivalence for the trivial action. A5.1 transports these to algebraic abelian
  varieties; A5.6 supplies the polarized Hodge interpretation and extensions to singular or
  nonreduced analytic bases; A5.8 supplies the Siegel period and symplectic formulas.
- *RepresentationTheory/SemisimpleAlgebras.* Layers 4–5 supply Skolem–Noether.
  The real division-algebra classification is `realCentralDivisionAlgebra` in A6.15 here;
  together with Mathlib's algebraically closed Wedderburn theorem over `ℂ`, it supplies the
  division-algebra factors. The positive-involution normal form and its Rosati adapter
  are also A6.15 here.
- *OperatorTheory/PolarDecomposition, Part A.* PD-A11–PD-A19: finite self-adjoint spectral
  calculus on finite-dimensional real Hilbert spaces, including commutant preservation;
  PD-A20–PD-A28: positive square roots, their invertibility and uniqueness. A6.15 constructs the
  Rosati inner product and regular representation, and proves that the operator square root is
  left multiplication by an element of the real coefficient algebra.
- *AlgebraicModuliForArithmeticGeometry.* Layer 1: relative Serre generation and vanishing
  (`relativeSerre`, `serreGeneration`) and relative very ampleness (`amplePowersAndFixedTwists`).
  Layer 2, §2.1: Hom and Isom schemes of projective flat families (`homAndIsomSchemes`) through the
  Hilbert functor. Layer 3: fppf descent, relative Hom and Weil restriction along finite locally free
  maps (`ModuliDescent.weilRestriction`, `ModuliDescent.weilRestriction_baseChange`, `ModuliDescent.weilRestriction_algebraicity`,
  `ModuliDescent.relativeHom_algebraicity`).
  Layer 5, §5.2: level functors and their rigidity (`rigidLevelStructure`). Layer 7: the relative
  fppf Picard sheaf and section rigidification (§7.6.1, `relativePicardSheaf`,
  `sectionRigidifiedPicard`), its section splitting (§7.6.1a, `sectionPicardSplit`),
  universal functions (§7.2, `universal_functions`) and proper-space formal existence
  (§7.8, `properSpaceCompletionEquivalence`).
- *SchemeAndStackFoundations.* Layer 1: descent of modules (§1.1), algebraic spaces
  (§§1.3–1.4), quotient sheaves (§§1.5–1.6), fibre products (§1.8,
  `isAlgebraicSpace_pullback`), torsors (§1.15) and Artin's bootstrap (§1.17,
  `artinBootstrap`). Layer 2: higher direct images on sites (§2.1) and quasi-coherent
  cohomology (§2.6, `qcoh_higherDirectImages`). Layer 3, §3.8: invariant differentials
  (`invariant_differentials`). Layer 4: thickenings and formal smoothness (§4.1), formal
  completion (§4.8), coherent Grothendieck existence and algebraization of compatible
  morphisms on given proper schemes (§4.10, `grothendieck_existence`, `algebraize_hom`).
  Layer 5: proper pushforward, flat pullback and degrees of zero-cycles (§5.2), the first
  Chern class (§5.3, `Chow.c1`), Chern classes (§5.4, `Chow.chernClass`), intersection
  products on smooth varieties (§5.6), and Grothendieck–Riemann–Roch including
  Hirzebruch–Riemann–Roch (§5.8, `grothendieck_riemann_roch`). The effectivity of polarized
  formal abelian schemes and genus-two curves is A4.8 and A4.14 here; quadratic projective
  descent uses StableReduction Layer 2's étale polarized-scheme descent contract.
- *CrystallineCohomology.* Layer CR.1 supplies the base-compatible big fppf crystalline site,
  its module-sheaf category and quasi-coherent and finite locally free crystals. CR.7.1 supplies coefficient
  evaluation, pullback, tensor and dual, and the twist convention `φ_{D(r)} = p^{−r}φ_D`,
  `Fil^i(D(r)) = Fil^{i+r}D`. The Barsotti–Tate Dieudonné crystal and its deformation theory
  are A4.CR.7.2 here.
- *EnhancedDerivedSheaves.* E1.9 supplies perfect proper pushforward and base change
  (`perfect_proper_pushforward`) for the relative coherent-cohomology arguments.
- *ComplexComparisonPartII.* C−1.1 the category `ComplexAnalyticSpace` and
  `complexSchemeAnalytification` for locally finite-type complex schemes, retaining nilpotents
  and arbitrary open gluing; C−1.2–C−1.3 `complexSpaceAnalytification`,
  `completedAnalyticStalkComparison` and `analyticRelationLocalChart` for locally separated
  spaces, with étale relation charts and Hausdorffness when separated;
  C1.9 proper coherent GAGA (`properSchemeGagaPushforward`, `properSchemeGagaEquivalence`);
  C3.2d.2 algebraicity of the relative fppf Picard sheaf (`relative_picard_algebraicSpace`)
  for proper flat finitely presented families with universal functions;
  C3.2f.1–C3.2f.2 the full identity component, including nilpotents (`picardZeroSheaf`),
  and its representability criterion (`picardZeroCriterion`), with the hypotheses below;
  C3.3 derived GAGA for proper algebraic spaces
  (`derivedGagaProperSpace`); C4.2 Chow's theorem with nilpotents (`projectiveChowNonreduced`);
  C4.4 algebraicity of holomorphic maps from proper schemes (`properSourceMorphismAlgebraicity`)
  and the family and abelian-variety morphism interface (`familyMorphismInterface`); C5.1 the
  sheaf–singular comparison and the proper de Rham–Betti comparison (`sheafSingularComparison`,
  `properDeRhamBetti`); C5.2 Betti local systems and the Gauss–Manin comparison
  (`relativeBettiLocalSystem`, `GaussManin`, `relativeDeRhamBetti`); C5.4 the Chern normalization
  `c₁ = [(i/2π)Θ]` with the complex orientation (`chernFubiniStudyIntersection`).
- *EtaleCohomologyFoundations.* Supplied by EtaleCohomologyFoundations §F.3 /
  `VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`.
  A4.4 uses the geometric bound `q > 2g` and proper finiteness for an abelian variety of
  dimension `g` over algebraically closed `k`, with finite coefficients `ℤ/ℓ^r` and `ℓ`
  invertible in `k`. Supplied by EtaleCohomologyFoundations §F.2 /
  `VanishingCycles.etaleKunneth`.
  The ordinary derived Künneth map for finite-type schemes over separably closed `k` and
  bounded constructible finite-Tor coefficient complexes retains cup products, pullbacks,
  base change and reductions. Supplied by EtaleCohomologyFoundations §F.4 /
  `VanishingCycles.classicalAdicRealization`, `VanishingCycles.adicFiniteness`.
  The constant coefficient tower has coherent derived reductions and uniform cohomological
  and Tor bounds, giving the derived finite-level limit, finite generation and integral reductions.

**Not built here.** Moduli stacks of polarized abelian varieties `A_{g,d}`, PEL, Siegel and Hilbert
modular moduli, their level covers and compactifications (PELModuli, ShimuraVarieties,
ShimuraCompactifications): the Hodge line bundle and the twisting operation are exported to them
by descent, and no moduli stack is constructed here. The characteristic-zero Siegel moduli problem
is specified in [ShimuraVarieties §5.0](../ShimuraVarieties/README.md#50-rational-polarized-siegel-moduli),
and its arithmetic minimal compactification in
[§§8.17–8.19](../ShimuraVarieties/README.md#817-arithmetic-codimension-one-partial-compactification);
arithmetic toroidal compactifications belong to ShimuraCompactifications. The general
classification of finite flat group schemes and `p`-divisible groups belongs to
FiniteFlatGroupsAndIntegralPadicHodgeTheory;
the crystalline site and general crystalline coefficient calculus belong to CrystallineCohomology.
The full and truncated Barsotti–Tate interfaces, contravariant Dieudonné crystal, its variance and twists, and
Grothendieck–Messing deformation theory are A4.5–A4.7 and A4.CR.7.2 here.
General Galois representations and their local properties (ArithmeticGaloisRepresentations):
only the Tate local system of an abelian scheme and the finite-index induction comparison for Weil
restriction live here. Néron models and semistable reduction (NeronModelsAndSemistableAbelianVarieties).
ComplexTori owns generic lattice quotients, manifold period families and equivariant lattice maps.
A5 specializes these to abelian varieties, with Riemann forms, Appell–Humbert, polarizations and
the Siegel family. This supplier is used only in A5 and its consumers; A0–A4 are independent of it.
Generic finite-coefficient étale cohomology of schemes and integral adic realization:
Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`; §F.2 /
`VanishingCycles.etaleKunneth`; §F.4 / `VanishingCycles.classicalAdicRealization`,
`VanishingCycles.adicFiniteness`.
A4.4 specializes these geometric statements to proper abelian varieties over algebraically
closed `k`, with `ℓ` invertible and the whole normalized tower `ℤ/ℓ^r`.
Weil's trace theorem for curves, with the curve–Jacobian comparison and the graph–diagonal identity,
and the Grothendieck–Lefschetz formula use the abelian inputs consumed downstream by
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T3 /
`VanishingCycles.curveEndomorphismTrace`, `VanishingCycles.etaleTraceFormulaFinite`,
`VanishingCycles.etaleTraceFormula`.
The curve theorem uses smooth proper geometrically connected curves and invertible `ℓ`;
the finite-field formulas apply to separated finite-type schemes with descended bounded constructible finite-Tor finite
coefficients of order prime to the characteristic or rational `ℓ`-adic coefficients with invertible `ℓ`; they use compact
support and geometric Frobenius at every positive power, with perfect finite-level traces and rational cohomology traces.
Their abelian torsion, Tate-module and algebraic-trace inputs are owned here in A3.2, A4.1
and A6.10–A6.11. Completed
Poincaré bundles, Betti maps and integral realizations over finite fields form the scope outline
for a separate roadmap, AbelianSchemesAndArithmeticModuliPartII; that outline supplies no inputs
to this roadmap. Faltings's finiteness and isogeny theorems
(FaltingsFinitenessAndIsogenyTheorems). The Weil estimate for Frobenius (DeligneWeightsAndPurity).
The Tate conjecture for homomorphisms over finite or number fields is not claimed anywhere below:
the Hom statements here are faithfulness and saturation.

## Conventions

- **Abelian schemes.** An abelian scheme over a scheme `S` is a group object `A` in `Over S` whose
  structure morphism is proper and smooth with geometrically connected fibres. A polarization is
  extra data, never a chosen ample line bundle. Commutativity is a theorem. The relative dimension
  is the locally constant function `s ↦ dim A_s`; a statement "of relative dimension `g`" means this
  function is constantly `g`, and on a disconnected base one works componentwise. The
  dimension-zero abelian scheme is the identity group `S → S`; its multiplication maps are
  isomorphisms of rank one, also in characteristic `p`.
- **Fields.** Over a field `K` the carrier is Tau Ceti's `AbelianVariety K`. Its Hom groups `A ⟶ B`
  are written multiplicatively (the group law of the target); `End A = Additive (A ⟶ A)` is a ring;
  rationalization uses the additive groups, `Hom⁰(A, B) = ℚ ⊗_ℤ Hom(A, B)` and
  `End⁰(A) = ℚ ⊗_ℤ End A`. The dimension `A.dim` has type `WithBot ℕ∞`; a statement for dimension
  `g` carries the hypothesis `A.dim = g`.
- **Picard objects.** The relative Picard functor is the fppf sheafification of line-bundle classes
  (AlgebraicModuli §7.6.1); a section `e` rigidifies it, and the base-line ambiguity is removed only
  through the rigidification. The Poincaré bundle `P` on `A ×_S A^∨` carries trivializations along
  both zero sections which agree at `(0, 0)`.
- **The Mumford map.** `φ_L(a) = t_a^*L ⊗ L^{-1}`, corrected by the base lines of A2.3 over a general
  base. On an elliptic curve with `L = O(0)` this sends `a` to `O([−a] − [0])`; under the
  identification of the dual by `a ↦ O([−a] − [0])` (positive self-duality) `φ_{O(d·0)} = [d]`.
  The graph bundle `(id, λ)^*P` has Mumford map `2λ`, not `λ`.
  ModularCurves 2D instead uses `λ_E(a) = O([a] − [0])`. Our identification is
  `ι_E = λ_E ∘ [−1]`. Thus the Poincaré bundle on `E × E` pulled back through `ι_E`
  is the pullback through `λ_E` followed by `id × [−1]`. For a fixed intrinsic torsion
  pairing, inversion in its dual argument inverts its value; A3.5–A3.7 retain this sign
  when comparing with ModularCurves 2E's equation-normalized Weil pairing.
- **Degrees and torsion.** The degree of an isogeny is the rank of the finite locally free
  morphism (Mathlib `Scheme.Hom.finrank`), which counts inseparable degree; a non-isogeny between
  varieties of equal dimension has degree `0`. `A[n]` is the scheme-theoretic kernel of `[n]`; a
  finite flat group of order `p²` is never replaced by its geometric points. A polarization of
  degree `d` is one whose kernel has rank `d²`, so that `deg λ = d²` as an isogeny: on an elliptic
  curve `φ_{O(2·0)}` is a polarization of degree `2` with `deg φ_{O(2·0)} = 4`.
- **Realizations.** For `ℓ` invertible on the base, `T_ℓ A` is free of rank `2g` and its pairing with
  `T_ℓ A^∨` lands in `ℤ_ℓ(1) = lim μ_{ℓ^r}`. Cohomological `H¹` is the dual of `T_ℓ` and carries the
  inverse cyclotomic multiplier. In ordinary characteristic-`p` deformation theory the étale part of
  `A[p^∞]` has height `g`; it is not the rank-`2g` prime-to-characteristic Tate module. `H¹_dR` is
  contravariant; `Lie E(A)` is its dual (A4.2).
- **Complex conventions.** For a complex structure `J` on a real vector space the Hermitian form is
  linear in its first argument, `H(v, w) = E(Jv, w) + i E(v, w)`, and positivity is `E(Jv, v) > 0`.
  Integral Riemann forms may have any elementary divisors; principal means unimodular. Homology
  `H₁` has weight `−1` and types `(−1, 0)`, `(0, −1)`; with `H^{−1,0}` the `+i`-eigenspace of `J`,
  the Weil operator is `C = −J` and Tau Ceti's polarizing form is `Q = −E`. `H¹` is the weight-one
  dual. The Siegel space `H_g` consists of symmetric `Ω` with positive definite imaginary part; the
  lattice is `ℤ^g + Ωℤ^g` in the column convention, and `Sp_{2g}(ℤ)` acts by
  `Ω ↦ (AΩ + B)(CΩ + D)^{-1}`.
- **Lean.** Declarations live in `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli`; names below are
  relative to it, except the crystalline-site and `LogCrystalline.dieudonneEvaluation` APIs
  of A4.CR.7.2, which use `TauCetiRoadmap.CrystallineCohomology`. `Suggested.lean` contains the
  light definitions with real bodies and the theorems
  whose carriers exist at the pinned Mathlib and Tau Ceti; the remaining targets are specified in this
  README and listed at the end of that file.

## Exact supplier contracts

### From Mathlib (pinned)

The pins are Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. Library declarations below are
consumed at those revisions. A supplier named as a roadmap specifies mathematical targets;
its additional carriers are used in the README statements.

- Schemes and morphism properties: `AlgebraicGeometry.Scheme`, `Over`, `IsProper`, `Smooth`,
  `SmoothOfRelativeDimension`, `GeometricallyConnected`, `GeometricallyIntegral`, `IsFinite`, `Flat`,
  `LocallyOfFinitePresentation`, `Surjective`, `IsClosedImmersion`, `Scheme.Hom.finrank` (the rank of
  a finite morphism at a point, locally constant for finite flat morphisms of finite presentation,
  `Scheme.Hom.isLocallyConstant_finrank`, and equal to `1` exactly for isomorphisms,
  `Scheme.Hom.isIso_iff_finrank_eq`, under the finite, flat and locally finitely presented hypotheses), `Scheme.functionField`, `Over.pullback`.
- Group objects: `CategoryTheory.GrpObj`, `IsCommMonObj`, `IsMonHom`, `Functor.grpObjObj`, the group
  structure on morphisms into a group object (`CategoryTheory.Hom.group`),
  `yonedaGrpObj`, `GrpObj.ofRepresentableBy`, `yonedaGrpObjIsoOfRepresentableBy`,
  `yonedaGrpFullyFaithful`, `isCommMonObj_iff_isMulCommutative`, `Over.mapPullbackAdj`,
  `isCommMonObj_of_isProper_of_geometricallyIntegral`,
  `smooth_of_grpObj`.
- Algebra: `TensorProduct`, `Algebra.TensorProduct`, `IsSemisimpleRing`,
  `isSemisimpleRing_iff_pi_matrix_divisionRing`, `Module.Free`, `Module.Finite`,
  `instModuleFinite_of_discrete_submodule`, `Polynomial.funext`, `Matrix.charpoly`, `Matrix.det`,
  `Matrix.symplecticGroup`, `Matrix.PosDef`, `MvPolynomial.IsHomogeneous`, `Padic`, `PadicAlgCl`,
  `DividedPowers`, `IsZLattice`. Principality of an integral Riemann form uses
  `LinearMap.IsPerfPair E` from `Mathlib.LinearAlgebra.PerfectPairing.Basic`: both maps to
  the integral dual are bijective. This retains unimodularity rather than only
  nondegeneracy after extending scalars to a field.
- Analysis: complex numbers, finite-dimensional real vector spaces with `IsZLattice` lattices.

### From Tau Ceti (pinned)

The field carrier, additive endomorphism ring, multiplication and products are in
`TauCeti.AlgebraicGeometry.AbelianVariety.Basic`, `.End.Basic`, `.Isogeny`,
`.MorphismGroup` and `.Product`; the pointed-morphism comparison is in `.Hom.Rigidity`
and the tangent-dimension comparison in `.TangentSpace`. Relative kernels use
`TauCeti.GroupScheme.kernelBaseChangeSchemeIso` and
`TauCeti.GroupScheme.isPullback_kernel_scheme` from
`TauCeti.AlgebraicGeometry.GroupScheme.Kernel`, on `Grp (Over S)` over any scheme `S`. The affine-base
isogeny predicate is in `TauCeti.AlgebraicGeometry.GroupScheme.CentralIsogeny.Basic`.
Rigidified line bundles and their classes are in
`TauCeti.AlgebraicGeometry.LineBundle.Rigidified.Basic`, and their presheaf is
`TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` from
`TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified`.
The algebraic-space sheaf and the represented dual add geometry to that presheaf in A0.3
and A2.1–A2.2.

`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` in
`TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange` compares Cartier
dualization and base change for a finite locally free commutative affine group scheme
along any homomorphism of commutative rings. Cartier duality over an arbitrary scheme
and its gluing are consumed from ModularCurves 0B.

`TauCeti.Geometry.Hodge.WeightOne.RiemannForm` supplies `IsRiemannForm` and its
polarization comparison with a flat integral module, an actual complexification map
`ιℂ : Λ →ₗ[ℤ] Vℂ`, and `IsBaseChange ℂ ιℂ`; freeness of the lattice ensures flatness.
`TauCeti.Geometry.Hodge.WeightOne.Lattice` supplies `latticeHodgeStructure` and
`latticeHodgeStructureEquiv`. The comparison fixes weight one and Weil operator `J`;
A5.2 adds the geometric homological convention of weight `−1`. The field symplectic
basis theorem is in `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis` and assumes
finite dimension and a nondegenerate alternating form. Integral elementary divisors
are A5.4 here.

The declarations listed under *Built in Tau Ceti and cited* above, with these contracts:
`AbelianVariety K` is consumed with its derived instances (`smooth`, `geometricallyConnected`,
`isCommMonObj`, `isIntegral`), `zeroSection`, `zeroPoint` and `baseChange`; `IsIsogeny f` means
`IsFinite` and `Surjective` of the scheme morphism; `mulBy A n = 𝟙 A ^ n`; `prod` is the monoidal
product of the underlying group objects. `TateModule p A` is the inverse limit of
the `p^n`-torsion subgroups of an abelian group with its `ℤ_p`-module structure and inverse-limit
topology. For a prime `p`, an additive commutative group and every `n ≥ 0`, the hypothesis
`Nat.card (TateModuleLevel p A n) = (p^n)^r` gives freeness through
`TateModule.free_of_natCard`, finite generation through `TateModule.finite_of_natCard`,
and rank `r` through `TateModule.finrank_eq_of_natCard`, in
`TauCeti.Algebra.Module.Torsion.TateModule`. Geometric torsion counts and the Galois or
étale-local-system action are the new assertions of A3.2 and A4.1. The
kernel of a group-scheme homomorphism over `S` is a closed subgroup scheme whose formation
commutes with base change. The Hodge library is consumed as stated: weight `n`
Hodge structures on a lattice with complexification, their duals, and polarizations as integral
forms satisfying the Hodge–Riemann relations.

### From TauCetiRoadmap roadmaps

Here `AlgebraicModuli` abbreviates the roadmap AlgebraicModuliForArithmeticGeometry.

- *JacobianChallenge, Layer E*: `[n]` as an isogeny, the cube and square, the dual abelian variety
  and polarizations over a field; the field carrier with its Hom, End and products is the Tau Ceti
  library's. This contract supplies no
  relative geometry, and no theorem that the image of a homomorphism of abelian varieties over an
  imperfect field is an abelian subvariety; that theorem is A6.3 here.
- *JacobianChallenge, Layers D and F*: the rigidified relative Picard functor of a pointed smooth
  proper curve and its Jacobian (Layer D), and the Abel–Jacobi morphism with the Albanese universal
  property (Layer F). For a singular curve one first normalizes
  and chooses a point of the normalization.
- *ModularCurves 0B, 0E, 1C, 1D, 2A–2F, 7E, 7F*: as listed above; the elliptic Picard dual is compared
  through the inversion adapter `ι_E = λ_E ∘ [−1]` of the Conventions.
- *AlgebraicVectorBundles L0B, L0C, L2A, L2B*: finite locally free sheaves with their operations and
  the vector group `V(F)`.
- *StableReduction, Layer 2*: relative Gorenstein-curve duality supplies the relatively ample
  dualizing bundle of a smooth genus-two curve used by A4.14. A6.34 uses effective descent along the finite étale
  cover `Spec L → Spec K`, with an ample invertible sheaf and its specified cocycle.
  Layer 2 supplies descent of the scheme, morphisms, sections and group operations
  by relative Proj; the exchange linearization on `N ⊗ [−1]^*N` supplies the line-bundle
  cocycle. No descent of an unpolarized scheme is inferred from this contract.

### From EtaleCohomologyFoundations

Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`.
For finite-type `X` over separably closed `k`, torsion invertible in `k` gives
`H^q_et(X, F) = 0` for `q > 2 dim X`, and proper `X` with finite constructible coefficients
has finite cohomology; A4.4 uses `X = A` over algebraically closed `k`, `dim A = g` and
`Λ = ℤ/ℓ^r` with `ℓ` invertible in `k`.

Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleKunneth`.
The finite-type, separably closed-field theorem applies to bounded constructible finite-Tor
`Λ`-complexes with invertible annihilator, including the constant `ℤ/ℓ^r`-sheaves on `A`;
A4.4 applies its ordinary external product to `A × A` and pulls back along addition.

Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.normalizedAdicSystems`,
`VanishingCycles.classicalAdicRealization`, `VanishingCycles.adicFiniteness`.
On the normalized constant tower over proper `A/k`, uniform cohomological and Tor bounds
and finite-level finiteness give `RΓ(A, ℤ_ℓ) ≅ Rlim_r RΓ(A, ℤ/ℓ^r)`, finite generation and
`RΓ(A, ℤ_ℓ) ⊗^L ℤ/ℓ^r ≅ RΓ(A, ℤ/ℓ^r)` for every `r ≥ 1`, with the Milnor sequence
retained until the Mittag–Leffler condition is verified.
Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.adicFunctoriality`.
The cup, pullback and Künneth comparisons pass through the normalized systems with
their uniform bounds, and a Galois action requires coefficient descent data.
Supplied by EtaleCohomologyFoundations §F.4 /
`VanishingCycles.etaleProetaleAdicComparison`.
For locally Noetherian `A` the constant classical realization compares by derived pushforward
with Mathlib's pro-étale coefficient sheaf and cohomology, compatibly with every reduction.
Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.rationalAdicRealization`.
On separated finite-type schemes over separably closed `k` with invertible `ℓ`, the same normalized
realization rationalizes by derived tensor with `ℚ_ℓ`, with finite-dimensional cohomology.
The exterior structure and freeness of abelian cohomology are A4.4 here.

| Supplier | Provides / consumer | Convention or hypothesis gap |
|---|---|---|
| Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleKunneth` | Ordinary finite-coefficient étale Künneth with cup-product, pullback and base-change compatibility, used by A4.4 `exteriorCohomology` | A4.4 uses constant bounded constructible finite-Tor `ℤ/ℓ^r`-coefficients on proper `A` over algebraically closed `k`, with `ℓ` invertible, and passes to `ℤ_ℓ` by EtaleCohomologyFoundations §F.4 / `VanishingCycles.classicalAdicRealization`, `VanishingCycles.adicFiniteness` through all compatible finite levels; a compact-support formula alone does not supply this input. |

### From CrystallineCohomology and EnhancedDerivedSheaves

| Supplier | Provides / consumer | Convention or hypothesis |
|---|---|---|
| CrystallineCohomology Layer CR.1 | Base-compatible big fppf crystalline site and quasi-coherent and finite locally free crystals, used by A4.CR.7.2 | `p` is prime and locally nilpotent on the source; evaluations are module sheaves on the PD ambient scheme. |
| CrystallineCohomology §CR.7.1 | Finite projective coefficient evaluation, pullback, tensor and dual; filtered Frobenius coefficient and twist calculus, used by A4.CR.7.2 | Twist `r` scales Frobenius by `p^(−r)` and shifts `Fil^i` to `Fil^(i+r)`; completed Witt evaluation retains every finite-level reduction. |
| EnhancedDerivedSheaves E1.9 / `perfect_proper_pushforward` | Perfect proper pushforward and base change, used by A1.4, A2.4, A4.2 and A4.4 | For finitely presented `f`, `E` is perfect and `G•` is bounded, termwise finitely presented and target-flat, with each support proper over the target; `Rf_*E` is perfect when `f` is proper, flat and finitely presented. No Noetherian base hypothesis is added. |

### From AlgebraicModuliForArithmeticGeometry, SchemeAndStackFoundations and ComplexComparisonPartII

Each statement listed above is consumed with its own hypotheses. In particular:
ComplexComparisonPartII C3.2d.2 `relative_picard_algebraicSpace` represents the relative fppf
Picard sheaf of AlgebraicModuli §7.6.1 and needs a proper flat finitely presented morphism with
universal functions, which AlgebraicModuli §7.2 `universal_functions` supplies for proper flat
finitely presented morphisms with geometrically reduced and geometrically connected fibres.
ComplexComparisonPartII C3.2f.1 `picardZeroSheaf` retains the full geometric identity components,
including nilpotents. Its C3.2f.2 `picardZeroCriterion` needs a locally
Noetherian base and identity components of the geometric fibres that are smooth of locally constant
dimension (for an algebraic-space Picard sheaf through the neutral-component construction
`spaceSectionComponentCriterion` of AlgebraicModuli §7.9), and over a nonreduced base formal smoothness along the neutral component.
Its properness conclusion additionally requires separatedness of the Picard space and proper
geometric identity components. The relative Picard sheaf remains an fppf sheafification;
AlgebraicModuli §7.6.1a `sectionPicardSplit` supplies rigidified representatives when a section
and universal functions are given.
`grothendieck_existence` supplies coherent sheaves on a given proper scheme, and
`algebraize_hom` supplies compatible morphisms between given schemes, rather than existence
of the polarized scheme itself; A4.8 constructs that scheme with its compatible ample system;
`homAndIsomSchemes` needs a projective flat source and a quasi-projective target over a locally
Noetherian base; `ModuliDescent.weilRestriction_algebraicity` needs a finite locally free map;
`grothendieck_existence` needs a complete Noetherian adic base, and
`properSpaceCompletionEquivalence` additionally concerns a separated finite-type space
and coherent sheaves with proper support; the
Layer 5 intersection theory is over a field, with intersection products on smooth schemes and
Grothendieck–Riemann–Roch for projective morphisms of smooth quasi-projective schemes with rational
coefficients. Where a target below needs more than a supplier states, the additional statement is
itself a target here.

SchemeAndStackFoundations §1.5 supplies the fppf quotient sheaf of any pre-relation
and its universal property. Its §1.6 algebraic-space quotient theorem requires an
étale equivalence relation. For non-étale finite flat kernels, A3.3 instead uses
§1.17 `artinBootstrap`: an fppf sheaf with a cover by an algebraic space is algebraic
when that cover is representable by algebraic spaces, flat, locally of finite
presentation and fppf locally surjective. The kernel pair `A ×_S H` proves these
cover properties for `A → A/H`, using ModularCurves 0E's effective descent of finite
locally free schemes. AlgebraicModuli §3.5 `ModuliDescent.finiteQuotientComparison`
identifies this quotient with ModularCurves 0C's quotient on its affine or
invariant-affine-cover domain; that comparison is not a construction of the general
non-affine quotient.

For the complex comparisons, ComplexComparisonPartII C−1.1 supplies `ComplexAnalyticSpace` and
`complexSchemeAnalytification` for schemes locally of finite type over `ℂ`, retaining nilpotents
and arbitrary open gluing. Its C−1.2–C−1.3 supplies `complexSpaceAnalytification`,
`completedAnalyticStalkComparison` and `analyticRelationLocalChart` for locally separated
complex algebraic spaces, with the locally finite-type extension in C−1.3; the relation charts
are étale and Hausdorffness additionally requires separatedness. Its C1.9
`properSchemeGagaEquivalence` applies to proper finite-type complex schemes and coherent sheaves,
and `properSchemeGagaPushforward` to proper morphisms of finite-type complex schemes and coherent
sheaves; the base need not be proper. ComplexComparisonPartII
C3.3 `derivedGagaProperSpace` applies to proper finite-type complex algebraic spaces
and bounded coherent complexes. Its C4.2 `projectiveChowNonreduced` algebraizes closed
analytic subspaces of projective space defined by coherent ideals. Its C4.4
`properSourceMorphismAlgebraicity` needs a proper complex source and a separated
finite-type complex target; `familyMorphismInterface` part (3) includes abelian varieties
and their analytic isogenies. Its C5.1 `properDeRhamBetti` is for smooth proper complex
schemes; C5.2 `relativeBettiLocalSystem`, `GaussManin` and `relativeDeRhamBetti` are
used for smooth proper families over smooth finite-type complex bases, including the
horizontal comparison. Its C5.4 `chernFubiniStudyIntersection` is for Hermitian holomorphic line
bundles on complex manifolds and projective cycles. The extensions over other analytic bases stated in A5.6 are
part of that target.

### From ComplexTori

Milestone 1 uses a finite-dimensional complex normed vector space `V` and
`Λ : Submodule ℤ V` with its subtype topology, `DiscreteTopology Λ` and `IsZLattice ℝ Λ`.
The canonical carrier is `AddAction.orbitRel.Quotient Λ V` for translation. ComplexTori owns
its complex-manifold and Lie-group structures, quotient map, descended complex-linear maps
preserving the lattices, and natural lattice/covering/homology identifications. Milestone 4's
trivial-action formula identifies its killed-by-`n` subgroup with `Λ/nΛ` for `n > 0`.
A5.1 proves that the exponential lattice of an algebraic abelian variety satisfies these
hypotheses and transports the supplied maps and identifications through its analytification.

Milestone 2 uses Hausdorff second-countable complex manifold bases, holomorphic periods on a
fixed finite free integral lattice, and injective full discrete period ranges on every fibre.
A5.6 applies it on simultaneous lattice and Lie-bundle trivializations and derives relative
properness locally from bounded fundamental representatives. Milestone 3 consumes holomorphic
linear equivalences with the cocycle and period-equivariance laws. A5.8 supplies these laws for
the symplectic formulas. The linear action exists also at stabilizers; a manifold quotient by
that action requires a free base action and the supplier's proper-discontinuity hypotheses.
Polarized Hodge structures, Appell–Humbert and algebraicity remain A5 targets; the generic
cyclic-affine and logarithmic-transform constructions remain in ComplexTori.

## How to read the build

A0 fixes the relative carrier and its two boundaries: Tau Ceti's field abelian varieties and the
elliptic curves of ModularCurves, and records exactly how the algebraic-space Picard machinery
applies to abelian schemes. A1 proves the structural theorems that hold over every base:
products and dimension, rigidity, invariant differentials, seesaw, cube, the elliptic equivalence
and torsion restrictions. A2 constructs the dual abelian scheme through Raynaud's theorem, the
Mumford map, polarizations and the canonical graph bundle, and proves the cohomological and
positivity statements about ample line bundles. A3 builds isogenies and finite-flat quotients and,
with them, the torsion structure: multiplication maps, divisibility, Cartier-dual kernels, Weil
pairings, theta groups, level structures and the Rosati involution. A4 constructs the degree-one
realizations (étale, de Rham, Barsotti–Tate and divided-power) and proves the deformation theorems.
A5 treats complex abelian varieties and their analytic families. A6 develops the arithmetic of Hom
over a field and exports the coefficient, twisting, restriction and Hodge-line constructions. Each
layer ends with its examples and its dependencies. Within A6 the subsections are in dependency
order: faithfulness and complete reducibility come before finiteness of Hom, which comes before the
characteristic polynomial, which comes before positivity.
Within A4, the full tower (A4.5) precedes the truncated-group interface (A4.5a).
Crystalline Dieudonné and Grothendieck–Messing theory (A4.CR.7.2), Serre–Tate (A4.9) and
polarized effectivity (A4.8) precede the compatible polarized tower lifting and abelian-surface
application (A4.12). Generic truncated-group stack and truncation smoothness are downstream
targets of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.23.

<a id="a0"></a>

## Layer A0: The carrier and its boundaries

This layer fixes the relative carrier and connects it with the two carriers that already exist:
abelian varieties over a field in Tau Ceti, and elliptic curves over a base in ModularCurves. It
also records how the Picard sheaves of AlgebraicModuli Layer 7 and their algebraicity and component
theorems in ComplexComparisonPartII C3.2d.2, C3.2f.1–C3.2f.2 apply to an abelian scheme,
so that later layers use one Picard object with known hypotheses.

### A0.1 Abelian schemes

Define `AbelianScheme S` for a scheme `S` as a structure bundling an object `toOver : Over S`, a
group-object structure `GrpObj toOver`, and the three properties `IsProper toOver.hom`,
`Smooth toOver.hom` and `GeometricallyConnected toOver.hom`. The underlying scheme is
`toScheme = toOver.left` and the zero section is `zeroSection = η[toOver].left : S ⟶ toScheme`. No
commutativity axiom, no dimension and no ample line bundle is part of the structure
(Kass, *Notes on abelian schemes*, §1, the definition on p. 1 and Theorem 1, p. 2; Olsson, *Compactifications of
moduli of abelian varieties: an introduction*, §2.1.4, p. 298; Faltings–Chai I.1.1–1.2, pp. 1–2).

The API is: `AbelianScheme.zeroSection_comp` (the zero section is a section of the structure
morphism); `AbelianScheme.baseChange` (for `f : T ⟶ S`, the pullback `Over.pullback f` of `toOver`
with the transported group structure `Functor.grpObjObj`; properness, smoothness and geometric
connectedness are stable under base change) and `AbelianScheme.baseChange_toOver` (its `Over`
object is exactly `(Over.pullback f).obj A.toOver`); `AbelianScheme.ofAbelianVariety` (a Tau Ceti
`AbelianVariety K` is an abelian scheme over `Spec K`, using its derived `smooth` and
`geometricallyConnected` instances); `AbelianScheme.toAbelianVariety` (over `Spec K`, an abelian
scheme is geometrically integral, `AbelianScheme.geometricallyIntegral`, since a smooth group scheme
with geometrically connected fibres over a field is geometrically irreducible and geometrically
reduced, hence an `AbelianVariety K`) with `AbelianScheme.toAbelianVariety_ofAbelianVariety` (the
two adapters are inverse on underlying group objects); `AbelianScheme.identity` (the identity
`S ⟶ S` with its trivial group law is an abelian scheme; its fibres are geometrically connected,
`geometricallyConnected_id`);
`AbelianScheme.relativeDimension` (the function `s ↦ dim A_s`, locally constant by A1.1, and
pulled back by composition under base change); `AbelianScheme.fieldEquivalence` (over `Spec K`
the adapters give an equivalence between abelian schemes with zero-preserving morphisms and Tau
Ceti abelian varieties with their homomorphisms, compatible with extension of fields). Morphisms of
abelian schemes are morphisms of `Over S` satisfying `IsMonHom`; by A1.2 a zero-preserving morphism
is automatically one. *Needs:* Mathlib `GrpObj`, `IsProper`, `Smooth`, `GeometricallyConnected`,
`GeometricallyIntegral`, `Over.pullback`, `Functor.grpObjObj`; Tau Ceti `AbelianVariety`.

Use the following points API for every `G : Over S` with `GrpObj G`, over an arbitrary scheme
`S`. Its `T`-points are exactly `T ⟶ G` in `Over S`, with Mathlib's `Hom.group`: the unit is
`toUnit T ≫ η[G]`, multiplication is `lift x y ≫ μ[G]`, and inversion is `x ≫ ι[G]`.
The group-valued presheaf is `yonedaGrpObj G`; restriction along `h : T′ ⟶ T` is
`x ↦ h ≫ x`, preserving the unit, multiplication and inversion. Given
`F : (Over S)ᵒᵖ ⥤ GrpCat` and a representation of its underlying set-valued presheaf by
`G`, use `GrpObj.ofRepresentableBy` and `yonedaGrpObjIsoOfRepresentableBy` to recover the
unique group-object structure inducing those operations under that representation.
The round trip recovers the original structure, and `yonedaGrpFullyFaithful` identifies
natural transformations of group-valued presheaves with group-scheme homomorphisms.
These are Mathlib's constructions, with no additional points-law carrier.

Prove `groupPointsHom_iff`: for `G, H : Over S` with group structures and `f : G ⟶ H`,
`IsMonHom f` holds exactly when postcomposition by `f` preserves the unit and multiplication
on `T`-points for every `T : Over S`. Inversion then follows from the group laws.
Use `isCommMonObj_iff_isMulCommutative` to test commutativity on all `T`-point groups.
Prove `groupPointsBaseChange`: for `b : S′ ⟶ S` and `T : Over S′`, the pullback group
structure gives a group isomorphism
`(T ⟶ (Over.pullback b).obj G) ≃* ((Over.map b).obj T ⟶ G)`.
Its forward map composes the underlying scheme morphism with the projection to `G.left`;
its inverse is the pullback lift with second component `T.hom`. Retain naturality in `T`
and in group-scheme homomorphisms, and compatibility with identity and iterated base change.
Apply this API to `A.toOver` for abelian schemes. The points interface follows the needs of
the Imperial College London FLT project, using the existing categorical carriers
(Mathlib `CategoryTheory/Monoidal/Cartesian/Grp.lean`, `Hom.group`,
`GrpObj.ofRepresentableBy`, `yonedaGrpFullyFaithful`;
`CategoryTheory/Monoidal/Cartesian/Mon.lean`, `isCommMonObj_iff_isMulCommutative`;
`CategoryTheory/Comma/Over/Pullback.lean`, `Over.mapPullbackAdj`).
*Needs:* Mathlib's cartesian monoidal structure on `Over S`, group-valued Yoneda constructions
and pullback adjunction.

**Checks.**

- `AbelianScheme.identity`: the identity `Spec K → Spec K` is the dimension-zero abelian scheme;
  its multiplication by any integer, `p` included, is an isomorphism. A definition requiring
  positive dimension fails.
- `AbelianScheme.field_agreement`: for an elliptic curve `E/K`, `ofAbelianVariety` followed by
  `toAbelianVariety` returns `E` with its group law.
- `AbelianScheme.nonproper`: `𝔾_m` over a field is a smooth geometrically connected group scheme
  but is not an abelian scheme; a definition without properness accepts it.
- `AbelianScheme.disconnected`: the constant group `(ℤ/2)_S` is proper and smooth but not an abelian
  scheme, because its fibres are not connected.
- `AbelianScheme.nonsmooth`: `μ_p` over `𝔽_p` is proper and geometrically connected but not smooth,
  so it is excluded; a definition asking only for flatness accepts it.
- For `S = ℙ¹_k` and a constant elliptic scheme `E × S`, restriction to the two standard
  affine opens and their intersection preserves the point groups. The base-change comparison
  uses the same `Over S` carrier although `S` is nonaffine.
- For `G = μ_p` over `𝔽_p`, every geometric point is the unit, but
  `1 + ε` is a nonidentity point over `T = Spec 𝔽_p[ε]/(ε²)`. The points API includes this
  nonsmooth group scheme; testing only geometric points would identify its identity and zero
  endomorphisms incorrectly.
- For the constant group scheme attached to the permutation group on three letters,
  the point group over the base is noncommutative, and the commutativity criterion rejects it.
  The points API does not assume the automatic commutativity special to abelian schemes.
- Over the identity group scheme `S ⟶ S`, every point group is trivial, and
  `groupPointsBaseChange` is the unique isomorphism of trivial groups for every base change.

### A0.2 Field and elliptic boundaries

Prove `fieldAndEllipticBoundary`. Over `Spec K`, `toAbelianVariety` and `ofAbelianVariety` are
inverse equivalences of the field carriers, preserving zero, addition, products and base change
along field extensions. The proof recovers geometric integrality from smooth geometrically
connected fibres and uses Tau Ceti's smoothness theorem in the converse direction; group laws
and their homomorphisms are transported through the adapters (Faltings–Chai I.1.1–1.2, pp. 1–2).
The relative dimension-one equivalence is A1.6; duals and normalized Poincaré bundles are compared
in A2.2, and the Cartier–Nishi and Weil pairings in A3.5–A3.7. *Needs:* A0.1; Tau Ceti
`AbelianVariety`, `AbelianVariety.Hom.equivPointed`.

**Checks.**

- Over a field, the dimension-zero object is `Spec K` and the adapters preserve its zero section.
- An elliptic abelian variety passes through the two field adapters with the same pointed group scheme.
- The disconnected proper smooth group `(ℤ/2)_K` is excluded from both carriers.

### A0.3 Picard inputs for abelian schemes

Prove `abelianPicardInputs`. Let `π : A → S` be an abelian scheme. (1) `π` is proper, flat and
finitely presented with geometrically reduced and geometrically connected fibres, so
`O_T → (π_T)_*O_{A_T}` is an isomorphism for every `T → S` (AlgebraicModuli §7.2 `universal_functions`).
(2) Consequently the relative Picard sheaf `Pic_{A/S}` (AlgebraicModuli §7.6.1 `relativePicardSheaf`) is
an algebraic space, quasi-separated and locally of finite presentation over `S`
(ComplexComparisonPartII C3.2d.2 `relative_picard_algebraicSpace`), and the zero section identifies
it with the sheaf of line
bundles rigidified along `e`: `Pic_{A/S}(T) ≅ ker(e_T^* : Pic(A_T) → Pic(T))` naturally in `T`
(AlgebraicModuli §7.6.1a `sectionPicardSplit`). In particular every point of `Pic_{A/S}` over `T`
is represented by a line bundle on `A_T`, unique up to unique rigidified isomorphism.
(3) The identity-component subsheaf
`Pic⁰_{A/S}` of ComplexComparisonPartII C3.2f.1 `picardZeroSheaf`, including its nilpotents,
is defined, and C3.2f.2 `picardZeroCriterion` applies
over a locally Noetherian base once its fibrewise hypotheses are checked (A2.1 checks them). (4) For
abelian schemes `A, B` over a locally Noetherian `S` with `A` projective and `B` quasi-projective
over `S`, the Hom functor of
`S`-morphisms is represented by an open subscheme of the Hilbert scheme of `A ×_S B`
(`homAndIsomSchemes`); the closed subfunctor of homomorphisms is cut out by the group-law equations.
Each conclusion is used only under the hypotheses of the supplier that proves it; a Picard sheaf is
never replaced by the unsheafified quotient of line-bundle groups, and no algebraic space is
asserted to be a scheme before A2.1 (Faltings–Chai I.1.5–1.9, pp. 3–7; Stacks, §99.11, Lemmas
99.11.3–99.11.5, tag 0D24). *Needs:* A0.1; AlgebraicModuli §§2.1, 7.2, 7.6.1–7.6.1a;
ComplexComparisonPartII C3.2d.2, C3.2f.1–C3.2f.2.

### Examples

For an elliptic curve `E/K` the field adapters of A0.2 and the equivalence of A1.6 identify `AbelianScheme.ofAbelianVariety E`
with ModularCurves' elliptic curve `E/Spec K`, and the dual of A2.2 with `E` through
`a ↦ O([−a] − [0])`. For `S = Spec K[ε]/(ε²)` and the constant family `E_S`, A0.3 (2) identifies
`Pic⁰_{E_S/S}(S)` with the rigidified degree-zero line bundles on `E_S`; its nonzero infinitesimal
points are not visible on the reduced fibre (see A1.4).

### Dependencies

Mathlib; Tau Ceti `AbelianVariety`; JacobianChallenge Layer E; ModularCurves 0B, 1D, 2D;
AlgebraicModuliForArithmeticGeometry §§2.1, 7.2, 7.6.1–7.6.1a;
ComplexComparisonPartII C3.2d.2, C3.2f.1–C3.2f.2.

<a id="a1"></a>

## Layer A1: Rigidity and normalized line bundles

Every statement is over an arbitrary base, nonreduced bases included. Translations are distinct
from zero-preserving homomorphisms. The reduced-base fibre test of the seesaw principle is never
applied to an infinitesimal Picard class; rigidification at the zero section is what makes the
cube and multiplication formulas canonical, and it separates symmetric from antisymmetric
exponents.

### A1.1 Products, base change and relative dimension

Prove `relativeProductsAndDimension`. For abelian schemes `A, B` over any `S`, `A ×_S B` is an
abelian scheme and arbitrary base change gives `A_T`; the canonical product and pullback
comparisons respect the group laws. The relative dimension `g_A : S → ℕ` is locally constant, with
`g_{A×B} = g_A + g_B` and `g_{A_T} = g_A ∘ (T → S)`. An abelian scheme of relative dimension zero is
canonically the identity group scheme `S`: its zero section is an isomorphism. The proof uses
stability of properness, smoothness and geometric connectedness under products and base change;
smooth proper fibres give local constancy of the dimension; a smooth proper geometrically connected
zero-dimensional fibre is a single rational point, so the zero section is a surjective open and
closed immersion (Faltings–Chai I.1.1–1.2, pp. 1–2; Milne, *Abelian varieties* (2022 revision),
§20, pp. 42–43). On a base with two components carrying dimensions one and two the dimension
function takes both values; the product with the identity scheme `S` is canonically `A`.
`Suggested.lean` states the dimension-zero case as `isIso_zeroSection_of_relDim_zero`. *Needs:*
A0.1; Mathlib `SmoothOfRelativeDimension`, `IsProper`, `GeometricallyConnected`.

### A1.2 Rigidity over arbitrary bases

Prove `relativeRigidity`. Let `A, B` be abelian schemes over `S`. (1) Every `S`-morphism
`f : A → B` is the composite of a unique homomorphism `h` with translation by the section `f ∘ e_A`;
more generally a morphism of `S`-schemes from `A` to a separated `S`-group scheme that preserves the
zero sections is a homomorphism. (2) The group law of `A` is commutative, and two group structures
on `A` with the same zero section coincide. (3) A homomorphism `A → B` which is zero on one geometric
fibre over each connected component of `S` is zero. (4) For a closed immersion `S₀ → S` defined by a
nilpotent ideal, restriction `Hom_S(A, B) → Hom_{S₀}(A₀, B₀)` is injective; the Hom functor is formally
unramified. The proof applies relative rigidity to `f − f(e_A)` and to the difference of two lifts;
the rigidity argument uses `O_S ≅ π_*O_A` universally (A0.3) and never equality on reduced geometric
points, so nilpotent sections are not discarded (Kass, Theorem 1 and its proof, pp. 2–3; Milne 2022,
Proposition 20.1 and Corollary 20.2, pp. 42–43; Katz, *Serre–Tate local moduli*, §1.1 and Lemma
1.1.3, pp. 141–143). Over a field, (1) for zero-preserving maps is Tau Ceti's `isMonHom_of_one_hom`;
the content here is the arbitrary base. Translation by a nonzero section is not zero-preserving, and
on `S = Spec K[ε]` an infinitesimal translation of `E_S` is a morphism different from the zero map.
`Suggested.lean` states (1) for zero-preserving morphisms as `isMonHom_of_zero_preserving`, (2) as
`isCommMonObj` and (4) as `eq_of_restrict_nilpotent`. *Needs:* A0.1, A0.3; SchemeAndStackFoundations Layer 4 §4.1 (formal smoothness).

### A1.3 Invariant differentials

Prove `relativeInvariantForms`. For an abelian scheme `π : A → S`, `O_S → π_*O_A` is an isomorphism
universally, and evaluation at the zero section identifies `π_*Ω¹_{A/S}` with
`ω_A = e^*Ω¹_{A/S}`. Translation gives `Ω¹_{A/S} ≅ π^*ω_A`, with `ω_A` locally free of rank `g_A`,
and `Lie(A/S) = ω_A^∨`. These maps commute with arbitrary base change. The trivializations are of the
relative bundles; nothing is asserted about absolute tangent bundles over a varying base. The proof
reuses the invariant-differential isomorphism for group schemes, universal functions from A0.3 and
the projection formula (Faltings–Chai I.1.1–1.2, pp. 1–2; Conrad, *Abelian varieties* (notes by
T. Feng), Lemma 2.2.1, p. 17, and §1.5, pp. 8–10; Caro–Pasten §8.1, p. 26, and Lemma 9.7 with its
proof, p. 31, for the lattice of differentials over a discrete valuation ring). Over a discrete valuation ring
`ω_A` is free of rank `g` and restricts to the invariant differentials of both fibres; for `g = 0` it
is zero. *Needs:* A0.1, A0.3; SchemeAndStackFoundations Layer 3 §3.8 (`invariant_differentials`);
AlgebraicModuli Layer 1; AlgebraicVectorBundles L0B.

### A1.3a Serre tensor over an arbitrary base

<a id="relativeSerreTensor"></a>

**The relative Serre tensor** (`relativeSerreTensor`). Let `S` be any scheme, `A/S` an abelian
scheme, `R` an associative ring with identity, `R → End_S(A)` a unital ring homomorphism, and `M`
a finitely generated projective right `R`-module. Write the commutative point groups of `A`
additively, with the induced left `R`-action. The presheaf `T ↦ M ⊗_R A(T)` on `S`-schemes is an
fppf sheaf and is represented by an abelian scheme `M ⊗_R A`, with its universal balanced map on
points. Its representing pair is unique up to unique isomorphism. No commutativity, constant-rank
or finiteness assumption on `R`, and no reducedness or Noetherian assumption on `S`, is required.

Develop the balanced tensor product of right and left modules with its universal property,
maps and finite direct sums. For finite projective `M`, prove
`M ⊗_R A(T) ≅ Hom_R(M*, A(T))`, where `M* = Hom_{Rᵒᵖ}(M, R)` is a left `R`-module. A splitting
`M ⊕ N ≅ Rⁿ` gives a projector `e` on `Aⁿ`; its scheme-theoretic kernel `ker(1 − e)` represents
the tensor. This is a closed retract of `Aⁿ`, hence proper and smooth, with geometrically
connected fibres. On points it is a direct summand of the fppf sheaf `Aⁿ`, proving the sheaf
assertion without changing its values by sheafification. (Conrad, *Gross–Zagier revisited*, §7,
Theorem 7.2 and its proof, pp. 101–102, and Theorem 7.5, p. 103; Chai–Conrad–Oort, §1.7.4.)
*Needs:* A0.1, A1.1–A1.2; finite projective modules and their splittings; Tau Ceti
`GroupScheme/Kernel`; Mathlib's subcanonical fppf topology.

**Checks.**

- For `M = R_R`, the map `r ⊗ a ↦ r(a)` gives the original `A`.
- For `M = 0`, the representing scheme is `AbelianScheme.identity S`.
- For `M = Rⁿ`, the tensor is `Aⁿ`, including `n = 0`.
- Let `R = ℤ[√−5]` and `I = (2, 1 + √−5)`, an invertible nonprincipal ideal. For the complex
  elliptic curve with lattice `R` and its multiplication action, `I ⊗_R A` has lattice `I`.
  It exists without a basis of `I`; it is not isomorphic to `A`, since such an isomorphism would
  make `I` principal.
- For `R = M₂(ℤ)`, acting on `B²` by matrices, and `M = e₁₁R`, the tensor is `B`.
  This finite projective right module is covered without treating `R` as commutative.

<a id="relativeSerreTensor-functoriality"></a>

**Functoriality and projective splittings** (`relativeSerreTensor-functoriality`). For the same
`S` and `R`, a right-module map `f : M → N` between finite projective modules and an `R`-linear
homomorphism `u : A → B` of abelian schemes with `R`-action induce `f ⊗ u`, characterized on points by
`m ⊗ a ↦ f(m) ⊗ u(a)`. Prove the identity and composition laws, additivity in maps, and the
canonical comparison `(M ⊕ N) ⊗_R A ≅ (M ⊗_R A) ×_S (N ⊗_R A)`, including the empty sum.
Likewise tensoring `A ×_S B` gives the product of the tensors of `A` and `B`.
Any two projective splittings, with any complements, give canonically isomorphic representing
abelian schemes. The isomorphism preserves the universal balanced maps, is natural in `M` and
`A`, and satisfies the cocycle identity for three choices. These assertions follow from the
tensor universal property and Yoneda applied to the construction of Conrad, §7, Theorem 7.2,
pp. 101–102; see also Chai–Conrad–Oort, §1.7.4. *Needs:* A1.3a `relativeSerreTensor`.

**Checks.**

- For `M = R`, multiplication by an integer `n` induces `[n]` on `A`; the zero module map
  induces the zero homomorphism.
- The two inclusions and projections of `R²` induce the product inclusions and projections of
  `A²`; their composites satisfy the biproduct identities.
- If `M ⊕ N ≅ Rⁿ`, using `N` or `N ⊕ R` as the complement, in `Rⁿ` or `Rⁿ⁺¹` respectively,
  gives the same tensor and universal map. This also applies to the nonfree ideal `I` above.
- Changing a splitting twice gives the same isomorphism as changing it directly; a choice of
  complement cannot introduce an automorphism of the represented tensor functor.

<a id="relativeSerreTensor-base-change"></a>

**Arbitrary base change** (`relativeSerreTensor-base-change`). For the data of
`relativeSerreTensor` and every morphism `b : S′ → S`, prove the canonical group-scheme
isomorphism `(M ⊗_R A)_{S′} ≅ M ⊗_R A_{S′}`, using the pulled-back `R`-action on `A_{S′}`.
It respects universal balanced maps, module maps, `R`-linear homomorphisms and finite sums,
and satisfies identity and iterated-pullback coherence. Both point functors agree on every
`S′`-scheme, or equivalently the split projector and its kernel pull back. (Conrad, §7,
Theorem 7.2 and its proof, pp. 101–102; Chai–Conrad–Oort, §1.7.4.)
*Needs:* A0.1 `groupPointsBaseChange`; A1.3a `relativeSerreTensor-functoriality`;
Tau Ceti's kernel base-change comparison.

**Checks.**

- Pullback along `Spec k[ε]/(ε²) → Spec k` preserves the entire tensor scheme and its
  infinitesimal points, including the tangent vectors at zero.
- For a constant elliptic scheme over `ℙ¹_k`, the two affine charts and their overlap give
  the same tensor and gluing maps; the base need not be affine.
- For composable `S″ → S′ → S`, the direct comparison equals the two successive comparisons;
  for the identity base map it is the identity comparison.

### A1.4 The seesaw principle with rigidification

Prove `relativeSeesaw`. Let `X → S` be proper, flat and of finite presentation with geometrically
integral fibres over a reduced locally Noetherian `S`, with a section `e`. If a line bundle `L` on
`X` is trivial on every geometric fibre, then `π_*L` is invertible, commutes with arbitrary base
change, and `π^*π_*L → L` is an isomorphism; hence `L ≅ π^*e^*L`, and a rigidification along `e`
makes the trivialization unique. For an abelian scheme over an arbitrary base the same conclusion
holds for rigidified classes as equality of sections of the rigidified Picard sheaf of A0.3; the
reduced-base fibre test is not used there. The proof uses fibrewise constancy of `h⁰` and coherent
base change on reduced bases, and the full rigidified Picard class in general
(Xie–Yuan, proof of Lemma 4.1, p. 20; Conrad–Feng, Theorem 3.1.1 and Exercise 3.1.4, pp. 25–26). A
nonzero infinitesimal point of `A^∨` over `K[ε]` is trivial on the geometric fibre but is not the
trivial Picard section; on a product `X × S`, `π^*M` is recovered from `M` by `e^*`. *Needs:* A0.3;
AlgebraicModuli Layer 1; EnhancedDerivedSheaves E1.9 (`perfect_proper_pushforward`).

### A1.5 The theorem of the cube and multiplication pullbacks

Prove `relativeCube`. For an abelian scheme `A/S` and a line bundle `L` rigidified along zero, the
alternating tensor product of the pullbacks of `L` along the seven nonempty partial sums
`A³ → A` is canonically trivial, compatibly with the face rigidifications. For every integer `n`,
`[n]^*L ≅ L^{n(n+1)/2} ⊗ ([−1]^*L)^{n(n−1)/2}`
compatibly with rigidification and base change. Hence a symmetric rigidified `L` has
`[n]^*L ≅ L^{n²}`, an antisymmetric one has `[n]^*L ≅ L^n`, and in general `[2]^*L ≅ L³ ⊗ [−1]^*L`.
For unrigidified `L` the formula carries the zero-fibre line pulled back from `S`. For symmetric
rigidified `L` the sum–difference map `(x, y) ↦ (x + y, x − y)` pulls `L ⊠ L` back to `L² ⊠ L²`. The
proof extends the field cube trivialization of JacobianChallenge Layer E to rigidified Picard
sections using A1.2 and A1.4, applies the cube recurrence to integer multiplication (negative `n`
included), and normalizes at zero for uniqueness (Faltings–Chai, Theorem I.1.3, p. 1; Xie–Yuan,
Lemma 4.1(1), pp. 19–20; Conrad–Feng, Theorem 3.1.6 and its proof, pp. 26–28). For `n = 0` the pullback is `O_A`
after rigidification, and for `n = −1` the formula returns `[−1]^*L`; the exponent of `L` in `[2]^*L`
is three, not the symmetric four, unless `L` is symmetric. On `E × E` the mixed biextension term
cancels in the sum–difference pullback. *Needs:* A0.3, A1.2, A1.4; JacobianChallenge Layer E.

### A1.6 Relative elliptic equivalence

Prove `relativeEllipticEquivalence`. Abelian schemes of relative dimension one over `S` are
equivalent to ModularCurves' elliptic curves over `S` (smooth proper pointed curves of genus one
with their group law). The equivalence preserves the zero section, the group law, the invariant
differential bundle and multiplication maps. The dual/Poincaré comparison is A2.2 and the
pairing comparisons are A3.5–A3.7; over a field the carrier agrees with the adapters of A0.1. The genus-zero identity scheme
is a separate object, not an elliptic curve. The proof shows that the rank-one invariant
differential and the fibrewise trivial canonical bundle give genus one; it uses ModularCurves'
Weierstrass and pole-sheaf construction and its unique pointed group law, and in the converse
direction the elliptic proper smooth group scheme; invariant forms compare the differential bundles (Faltings–Chai I.1.1–1.2, pp. 1–2). Over `K[ε]` the comparison preserves
the whole pointed scheme and its differential, not only the reduced fibre. *Needs:* A0.1 (including its field adapters),
A1.3; ModularCurves 1C, 1D.

### A1.7 Torsion restrictions of rigidified line bundles

Prove `torsionRestriction`. For a rigidified line bundle `L` on `A/S` and `n ≥ 1`, the restriction
of `L` to `A[n]` is torsion in `Pic(A[n])`: its `n²`-th power is trivial if `L` is symmetric, its
`n`-th power if `L` is antisymmetric, and for arbitrary `L` the decomposition
`L² = (L ⊗ [−1]^*L) ⊗ (L ⊗ ([−1]^*L)^{-1})` gives the exponent `2n²`. The same holds on every
torsion multisection contained in `A[n]`, connected non-étale torsion included. The proof restricts
`[n]^*L` (A1.5) to the kernel, where it is trivialized by the retained rigidification; the general
bound avoids dividing by two in `Pic` (Xie–Yuan, Lemma 4.1(2) and its proof, p. 20). No
reduced-points argument is used on `μ_p` or `α_p`. Here `A[n]` is the scheme-theoretic kernel of
`[n]` (Tau Ceti's kernel of a group-scheme homomorphism); the statement does not need its finite
flatness, which is A3.2. *Needs:* A1.5; Tau Ceti `GroupScheme/Kernel`.

### A1.8 Weil extension over a connected Dedekind base

**Relative Weil extension** (`weilExtension`). Let `S` be a connected Dedekind scheme: integral,
locally Noetherian, normal and of dimension at most one, equivalently with every nonempty affine
open the spectrum of a Dedekind domain. Write `j : η = Spec K → S` for its generic point. For an
abelian scheme `A/S` and any smooth `S`-scheme `X`, restriction
`Hom_S(X, A) → Hom_η(X_η, A_η)` is bijective. Thus every `u_η : X_η → A_η` has a unique extension
`u : X → A`, with `u|_η = u_η`; extending the restriction of an existing morphism returns that
morphism. The source need not be proper, separated or quasi-compact. Extension commutes with
precomposition by morphisms of smooth test schemes, restriction to base opens and localization
at points of `S`. When `X` is an abelian scheme and `u_η` a homomorphism, its extension preserves
zero and addition by uniqueness on `S` and `X ×_S X`.

*Proof sketch.* Work locally on `S` and `X`. Smoothness over the regular Dedekind base makes `X`
and its fibre square regular. Properness of `A` extends the generic map over the DVR at each
codimension-one point of `X` outside `X_η`; finite presentation spreads each such extension to a
neighbourhood. These neighbourhoods give a rational map on an `S`-dense open (dense in every
fibre), containing all points of codimension at most one. Establish the relative Weil argument
for this map: on `X ×_S X` take the rational difference `u(x) − u(y)`. Hartogs extension into an
affine neighbourhood of zero, together with the local equations of the smooth diagonal, shows
that its domain contains the diagonal. Its intersection with `X ×_S dom(u)` then projects smoothly
and surjectively onto `X`; the difference map and the second projection recover `u` on that cover.
Fpqc descent of morphisms gives the extension on `X`. This is the relative diagonal argument of
Bosch–Lütkebohmert–Raynaud, §4.4, Theorem 1 and Lemma 2, pp. 109–110, specialized in §1.2,
Proposition 8 and its proof, p. 15. Separatedness of `A` and schematic density of the generic fibre
of the flat source give uniqueness (affine-locally, Tau Ceti's `ext_of_genericFiberι_eq`), so these
local extensions glue over arbitrary connected Dedekind schemes. This construction uses only the
early carrier, smooth local geometry, properness, Hartogs and descent; relative Hom
representability is A6.25. *Needs:* A0.1, A1.1; SchemeAndStackFoundations §§0.6, 0.8–0.9;
Mathlib `Over.pullback`, the valuative criterion and subcanonicity of the fpqc topology;
Tau Ceti `isRegularLocalRing_stalk_of_smooth` and `AlgebraicGeometry/Fibers/SchematicDensity`.

**Checks.**

- For the smooth nonproper source `X = A ×_S 𝔸¹_S`, the generic projection to `A_η` extends
  uniquely to the projection to `A`.
- Restricting the extension of any `u_η` gives exactly `u_η`; extending the restriction of
  `u : X → A` gives `u`, and two extensions with the same generic restriction coincide.
- Over a DVR of residue characteristic `p`, take the source to be `A` and the generic map to be
  `[p]`. Its unique extension is `[p]` on the whole abelian scheme, including a nonreduced
  special-fibre kernel; no étaleness of `[p]` is required.
- If `S` is the spectrum of a field, `η = S` and restriction is the identity for every smooth
  test source, including the empty scheme.

### Examples

For `E/K` and `L = O(0)`: `[2]^*L ≅ L⁴` because `O(0)` is symmetric, while for the antisymmetric
rigidified class `O([a] − [−a])` one has `[2]^*` acting by `2`. On `E × E` with `L = O(0)`, the
sum–difference map pulls `L ⊠ L` back to `L² ⊠ L²`, not to a diagonal pullback.

### Dependencies

A0; JacobianChallenge Layer E; ModularCurves 1C, 1D, 2D; AlgebraicModuli Layers 1 and 7;
SchemeAndStackFoundations Layer 3, Layer 4; AlgebraicVectorBundles L0B.

<a id="a2"></a>

## Layer A2: Duality, polarizations and ample classes

The dual is the identity component of the rigidified Picard sheaf, made a scheme by Raynaud's
theorem over any base. Polarizations are homomorphisms to the dual that are fibrewise of the form
`φ_L` for ample `L`; no global ample line bundle is chosen. The canonical graph bundle replaces
such a choice where a line bundle is needed, at the cost of the factor `2`. Normal-base
projectivity and the extension of a prescribed generic line bundle are separate, stronger
statements.

### A2.1 Raynaud's representability theorem

Prove `raynaudRepresentability`. Over any scheme `S`: (1) every abelian algebraic space over `S`
(a smooth proper group algebraic space with geometrically connected fibres) is a scheme, hence an
abelian scheme; (2) for an abelian scheme `A/S` the relative Picard sheaf `Pic_{A/S}` is represented
by a scheme locally of finite presentation over `S`, and `Pic⁰_{A/S}` by its smooth proper identity
component, of the same relative dimension as `A`; (3) every finite set of points of an abelian
scheme lying over an affine open of its base is contained in an affine open of the abelian scheme. No normality, reducedness, Noetherian
hypothesis or global polarization is assumed in these conclusions. The proof establishes
algebraic-space representability of `Pic` from A0.3 and noetherian approximation, then follows
Raynaud's reduction to finite-type bases: a polarization on a normal base generically, passage to
the normalization, and gluing along the conductor; scheme representability and the affine
neighbourhood property descend. The normal-base projectivity used here is only an intermediate step
(Faltings–Chai, Theorem I.1.9 and its proof, pp. 5–7). Faltings–Chai state (2) over an arbitrary
base and give the reduction; checking the identity-component hypotheses of
ComplexComparisonPartII C3.2f.2 `picardZeroCriterion`
over a non-Noetherian base through noetherian approximation is part of this target. A nonreduced
affine base and a disconnected base are both covered; nothing here says that an abelian scheme over
an arbitrary base is projective. *Needs:* A0.3, A1.1; SchemeAndStackFoundations Layer 1
§1.17 (`artinBootstrap`), §1.8 (`isAlgebraicSpace_pullback`); AlgebraicModuli §7.6.1 (`relativePicardSheaf`);
ComplexComparisonPartII C3.2f.2 (`picardZeroCriterion`).

**Checks.**

- Over an affine nonreduced base the dual Picard component is a scheme, not merely an algebraic space.
- For `S′ = Spec k ⊔ Spec k`, finitely many points spanning both components of `E ⊔ E` lie in
  one affine open, formed as a disjoint union of affine neighbourhoods.
- For `S = Spec ℂ[u,v]/(uv)` and `A = E × S`, the points `(P,(1,0))` and `(Q,(0,1))`
  lie in the affine open `U × S`, where `U ⊆ E` is an affine open containing `P,Q`.
  The base is nonnormal and the two points lie over different components.

### A2.2 The dual abelian scheme and the Poincaré bundle

Define `AbelianScheme.dual A`, written `A^∨`, as the abelian scheme representing `Pic⁰_{A/S}`
(A2.1), the subsheaf of the rigidified Picard sheaf of A0.3 of classes lying fibrewise in the
identity component, together with `AbelianScheme.poincare`, the universal line bundle `P` on
`A ×_S A^∨` rigidified along `e_A × id` and along `id × e_{A^∨}`, the two rigidifications agreeing
at `(0, 0)`. A point of `A^∨` over `T` is a line bundle on `A_T`, algebraically trivial on fibres and
rigidified along zero, up to unique isomorphism (Olsson, §2.1.4, p. 298; Faltings–Chai I.1,
pp. 3–5; Kass §3, Theorems 5–7, pp. 5–6, for the field case). The API is:
`AbelianScheme.dual_baseChange` (`(A_T)^∨ ≅ (A^∨)_T` with the Poincaré data); `AbelianScheme.dualMap`
(a homomorphism `f : A → B` induces `f^∨ : B^∨ → A^∨` by pullback of rigidified line bundles, with
`dualMap_id` and `dualMap_comp` contravariant); `AbelianScheme.bidual` (evaluation on the Poincaré
bundle gives a group isomorphism `κ_A : A ≅ A^∨∨`, natural in `A`, with `f^∨∨ ∘ κ_A = κ_B ∘ f`);
`AbelianScheme.dual_prod` (`(A ×_S B)^∨ ≅ A^∨ ×_S B^∨`, with Poincaré bundle the tensor product of the
two pullbacks); `AbelianScheme.dual_field` (over `Spec K` this is the dual abelian variety of
JacobianChallenge Layer E, with its Poincaré bundle rigidified along both zero sections); `AbelianScheme.dual_elliptic` (for an elliptic curve it
is ModularCurves 2D's Picard dual, with self-duality compared by `ι_E = λ_E ∘ [−1]`
and Poincaré pullback transported by `id × [−1]`).

Prove the comparison `normalizedPoincare`: two pairs `(B, Q)` of an abelian scheme and a doubly
rigidified line bundle on `A ×_S B` inducing an isomorphism `B ≅ A^∨` are canonically isomorphic;
evaluation biduality is compatible with arbitrary base change and products; biduality of abelian
schemes and Cartier biduality of finite flat groups are tracked separately, and after interchanging
the two factors the intrinsic Weil pairings of A3.5 are inverse to each other, not equal. The proof
uses the twofold rigidified universal property, fibrewise biduality from Layer E extended by A1.2,
and records the evaluation/Cartier sign for A3 (Faltings–Chai I.1, pp. 3–5; Conrad, *Polarizations*,
§1, pp. 1–5, and §3, p. 8). A line bundle pulled back from the base is excluded by the two
rigidifications. *Needs:* A0.2, A0.3, A1.2, A2.1; JacobianChallenge Layer E; ModularCurves 2D.

**Checks.**

- `AbelianScheme.dual_zero`: the dual of the dimension-zero abelian scheme `S` is `S`, and its
  Poincaré bundle is `O_S` with the identity rigidifications.
- `AbelianScheme.dual_field`: over `Spec K` the dual is the dual abelian variety of JacobianChallenge
  Layer E, with its doubly rigidified Poincaré bundle; a definition by all of `Pic_{A/S}` instead of `Pic⁰` would contain the
  Néron–Severi components and fail this.
- `AbelianScheme.dual_product`: `(E × E′)^∨ ≅ E^∨ × E′^∨`, and the Poincaré bundle is the exterior
  tensor product of the two; a definition without rigidification would differ by a base line bundle.
- `AbelianScheme.dual_elliptic`: for `E` elliptic, `a ↦ O([−a] − [0])` identifies `E` with `E^∨`, and
  the pullback of `P` along `id × (that map)` restricted to `E × {a}` is `t_a^*O(0) ⊗ O(0)^{-1}`.
- Over `ℂ`, for a nonzero point `a` of order three, `O([−a] − [0])` and
  `O([a] − [0])` are different classes, testing the inversion in the elliptic comparison.

### A2.3 The Mumford map and biextension identities

Prove `mumfordMap`. For `π : A → S` and any line bundle `L` on `A`, define `φ_L : A → A^∨` by the
rigidified class of
`t_a^*L_T ⊗ L_T^{-1} ⊗ π_T^*(a^*L_T)^{-1} ⊗ π_T^*(e_T^*L_T)`
for a point `a : T → A`. The bundle `m^*L ⊗ p₁^*L^{-1} ⊗ p₂^*L^{-1} ⊗ π²^*e^*L` on `A ×_S A` is doubly
rigidified and is `(id × φ_L)^*P`. By the cube theorem `φ_L` is a symmetric homomorphism
(`φ_L^∨ ∘ κ_A = φ_L`), and `φ_{L⊗M} = φ_L + φ_M`, `φ_{t_a^*L} = φ_L`, `φ_{π^*N} = 0`,
`φ_{f^*L} = f^∨ ∘ φ_L ∘ f` for a homomorphism `f`. These are identities of morphisms of sheaves,
compatible with base change, and the associated correspondence is additive in each variable
(Faltings–Chai I.1, pp. 3–4; Conrad, *Polarizations*, Example 2.2, pp. 6–7). On `E`,
`φ_{O(d·0)}(a) = O([−da] − [0])`, which is `[d]` under the positive self-duality of A0.2, and a line
bundle pulled back from a nontrivial element of `Pic(S)` has `φ = 0`. *Needs:* A1.5, A2.2.

**Checks.**

- On an elliptic curve, `φ_{O(0)}` sends `a` to `O([−a] − [0])`; using `[a]` instead
  changes the sign of the principal self-duality.
- A bundle `π^*N` pulled back from the base gives `φ = 0`, even when `N` is nontrivial;
  the two base-line correction factors cancel in the normalized class.
- For a product of elliptic curves with degrees `1` and `2` on the two factors, the
  Mumford map is the diagonal map `[1] × [2]` under the positive self-dualities, so it
  has kernel rank `4` and is different from either scalar `[1]` or scalar `[2]`.

### A2.4 Ample cohomology, Riemann–Roch and the degree of `φ_L`

Prove `ampleCohomologyAndDegree`. For an ample line bundle `L` on an abelian variety of dimension
`g`: `H^i(A, L) = 0` for `i > 0`, `h⁰(A, L) = χ(L) > 0`, `χ(L) = c₁(L)^g / g!` and
`deg φ_L = χ(L)²`. The last two formulas hold for every `L`, with `deg φ_L = 0` when `φ_L` is not an
isogeny. For a relatively ample `L` on `A/S`, `π_*L` is locally free, commutes with arbitrary base
change and has fibre rank `h⁰(L_s)`, and the higher direct images vanish. For an isogeny `f : B → A`,
`h⁰(B, f^*L) = deg(f) · h⁰(A, L)`. For `g = 0` every rank and degree here is one. The proof
trivializes the tangent bundle by translation (A1.3), so the Todd class is one and
Hirzebruch–Riemann–Roch gives `χ(L) = c₁(L)^g/g!`; ample vanishing uses multiplication pullback
with a multiplier prime to the characteristic, its trace, and Serre vanishing; the degree formula
`deg φ_L = χ(L)²` uses the Mumford bundle `Q = (id × φ_L)^*P` on `A × A`.
Rigidify `L` at zero and put `M = L ⊗ [−1]^*L` and `t(x, y) = (x + y, x − y)`.
The cube and symmetric biextension identities (A1.5, A2.3) give
`t^*Q ≅ M ⊠ M^{-1}`; the numerical identity `[−1]^*L ≡ L` and HRR give
`χ(M) = 2^g χ(L)` and `χ(M^{-1}) = (−1)^g χ(M)`.
The field multiplication theorem of JacobianChallenge Layer E gives
`deg t = deg [2]_A = 2^{2g}`, including characteristic `2` (Milne 2022, Theorem 8.2, pp. 13–14).
HRR and the intersection projection formula give `χ(t^*Q) = 2^{2g} χ(Q)`, while Künneth gives
`χ(t^*Q) = (−1)^g 2^{2g} χ(L)²`; hence `χ(Q) = (−1)^g χ(L)²`.
For the other computation use proper Chow pushforward for `f = id × φ_L` and HRR:
`f_*[A × A] = deg(φ_L) [A × A^∨]` if `φ_L` is an isogeny, counting inseparable length,
and it is zero otherwise because the image has dimension less than `2g`.
The intersection projection formula and `χ(P) = (−1)^g` thus give
`χ(Q) = (−1)^g deg φ_L` with the extended degree convention in both cases.
The family statements use coherent base change and the projection formula
(Milne 2022, Theorem 13.3 and Exercise 13.4, p. 25; Faltings–Chai I.1.6, p. 4; Conrad–Feng, Theorem 7.2.1, p. 63, for
`χ(P) = (−1)^g`, and Lemma 7.5.2, pp. 71–72, for the numerical identity;
§7.6, pp. 76–77, refers to Mumford §16 for the degree formula). For every integer `d`, `O(d·0)` on an elliptic curve has
`χ = d` and `deg φ = d²`; for `d > 0`, it has `h⁰ = d`.
On `E²` with the product of degrees `1` and `2`, `h⁰ = 2`, the top self-intersection is `4`, and
`deg φ_L = 4`: `φ_L` is a polarization of degree `d = 2` in the sense of A2.5. *Needs:* A1.3, A1.5,
A2.3; JacobianChallenge Layer E; SchemeAndStackFoundations Layer 5 §5.8 (`grothendieck_riemann_roch`),
§5.2 (proper Chow pushforward and projection formula), §5.3 (`Chow.c1`);
AlgebraicModuli Layer 1; EnhancedDerivedSheaves E1.9 (`perfect_proper_pushforward`).

**Checks.**

- On an elliptic curve, `O(0)` has `h⁰ = χ = 1` and its Mumford map has degree one.
- At `d = 0`, `O(d·0) = O_E` has `H⁰(E, O_E) = k`, hence `h⁰ = 1`, while `χ = 0` and
  the zero Mumford map has extended degree zero.
- For `d < 0`, `O(d·0)` has no nonzero section, so `h⁰ = 0`, while `χ = d` and `deg φ = d²`.
- For `L = O_E(0)`, the shear `s(x, y) = (x, x + y)` gives
  `s^*Q ≅ p₁^*O_E(2·0) ⊗ Q`, with nontrivial mixed factor `Q`; the sum–difference map instead gives
  `t^*Q ≅ O_E(2·0) ⊠ O_E(−2·0)`, so `χ(t^*Q) = −4` and `χ(Q) = −1`.
- For `L = O_A` with `g > 0`, `φ_L = 0` and `id × φ_L` has positive-dimensional fibres;
  its top-cycle pushforward and `χ(Q) = χ(O_{A × A})` are both zero.
- In characteristic `2`, `t` still has degree `2^{2g}` as a finite flat map, even when its
  geometric kernel has fewer points; the calculation uses length and rational Chow classes.

### A2.5 Polarizations

Define `Polarization A` for an abelian scheme `A/S` as a homomorphism `λ : A → A^∨` such that for
every geometric point `s̄` of `S` the fibre `λ_{s̄}` equals `φ_L` for an ample line bundle `L` on
`A_{s̄}`. Its degree is the locally constant function `s ↦ d(s) ≥ 1`, where the kernel of `λ_s` has rank
`d(s)²` and A2.4 gives `h⁰(L_s) = d(s)`. The numerical degree-`d` predicate means that this
function is constant with value `d`, equivalently `λ` is finite locally free of constant rank
`d²`. This is Olsson's convention, while Milne uses the isogeny degree `d(s)²`. A polarization
is principal when its degree function is identically one. An isomorphism `(A, λ) → (B, μ)` is an
isomorphism `f : A → B` with `f^∨ ∘ μ ∘ f = λ`. The polarization is the datum `λ`; a representing line
bundle exists only locally (A2.6) (Olsson, §§2.1.1–2.1.7, pp. 297–299; Milne, *Abelian varieties*
(course notes, version 2.00, 2008), §11, p. 53; Faltings–Chai I.1.6, p. 4). The API is
`Polarization.toHom`; `Polarization.symmetric` (`λ^∨ ∘ κ_A = λ`); `Polarization.isogeny` (`λ` is finite locally free
and surjective, fibrewise by A2.4); `Polarization.degree` (the kernel is finite locally
free with fibre rank `d(s)²`, defining the locally constant degree function); `Polarization.ofAmple` (a relatively ample `L` gives the polarization `φ_L`);
`Polarization.baseChange` (pullback preserves polarizations and degrees);
`Polarization.isoCriterion` (the dual-conjugation equation characterizes isomorphisms);
`Polarization.principal_iff` (principal iff `λ` is an isomorphism); `Polarization.field` (over a
field this is JacobianChallenge Layer E's polarization). *Needs:* A2.2, A2.3, A2.4;
JacobianChallenge Layer E.

**Checks.**

- `Polarization.dimension_zero`: on the identity abelian scheme over a nonempty base, the unique
  polarization has `d = 1`, and no degree `d > 1` occurs. On the empty base the constant-rank
  predicate holds vacuously for every `d ≥ 1`; it determines no unique numerical degree.
- `Polarization.elliptic_degree`: on an elliptic curve, `O(m·0)` with `m ≥ 1` induces `[m]` under the
  positive self-duality; its kernel has rank `m²` and its degree is `d = m`.
- `Polarization.negative_excluded`: on an elliptic curve the map induced by `O(−0)` is the
  symmetric homomorphism `[−1]` but not a polarization; symmetry alone does not define one.
- `Polarization.zero_excluded`: the zero homomorphism `A → A^∨` of a positive-dimensional `A` is
  symmetric and equals `φ_{O_A}`, but `O_A` is not ample, so it is not a polarization.

### A2.6 Representatives and the graph bundle

Prove `polarizationRepresentatives`. (1) For a polarization `λ` of `A/S`, the rigidified line
bundles `L` with `φ_L = λ` form a torsor under the smooth group scheme `A^∨`, so representatives
exist étale locally on every `S` (Faltings–Chai I.1.6). The symmetric representatives form a torsor
under `A^∨[2]`, trivial fppf locally and étale locally when `2` is invertible on `S`.
Two representatives differ by a section of `A^∨`, which is a translate globally only
when that section lies in `λ(A(S))`, and fppf locally always. (2) Over an Artin local base, a
representative on the closed fibre lifts together with a lift of the polarization. The proof uses
the kernel of `L ↦ φ_L` (A2.3) and descent of the torsor; symmetry is the fixed locus of inversion,
whose ambiguity is `2`-torsion (Olsson, Lemmas 2.1.8 and 2.1.9 with their proofs, pp. 299–301, and
Remark 2.1.6, p. 299, where the global-translation claim must be read locally; Oort, *Finite group
schemes, local moduli for abelian varieties, and lifting problems*, Lemma 2.3.2 and its proof,
pp. 282–284; Faltings–Chai I.1.6 and the following discussion, p. 4). In characteristic `2` the
torsor of symmetric representatives may be non-étale. *Needs:* A2.3, A2.5.

Define `Polarization.graphBundle λ`, written `M`, as `(id, λ)^*P`, rigidified along zero by the
Poincaré rigidifications. Prove `graphBundle_spec`: `M` is symmetric and relatively ample with
`φ_M = 2λ`; if `λ = φ_L` then `M ≅ [2]^*L ⊗ L^{-2}` up to the base normalization of A1.5, so its
Néron–Severi class is `2[L]`, and `M ≅ L²` when `L` is symmetric; `M³` is relatively very ample; for
`r ≥ 1`, `π_*(M^{3r})` is locally free with fibre rank `d(s)(6r)^{g(s)}`, commutes with arbitrary
base change and has no higher direct images. The single rank `d(6r)^g` and Hilbert polynomial
`P(t) = d(6t)^g` assume constant relative dimension `g` and constant polarization degree `d`. The
graph bundle needs no inversion of `2` and no chosen representative. The proof computes the Mumford
map of the graph by A1.5, uses A2.4 for the fibrewise section rank (`χ(M_s^{3r}) = (3r)^{g(s)} · 2^{g(s)} · d(s)`), and the
classical theorem that the cube of an ample line bundle on an abelian variety is very ample.
Over arbitrary `S`, apply EnhancedDerivedSheaves E1.9 `perfect_proper_pushforward` to the proper,
smooth, finitely presented `π`, with perfect coefficient `M^{3r}` and target-flat coefficient
`O_A`. Its perfect pushforward commutes with arbitrary base change; fibrewise vanishing makes it
locally free in degree zero. For `r = 1`, fibrewise generation makes evaluation surjective,
and the induced proper map to `P_S(π_*M³)` is a closed immersion since every fibre map is one.
Thus no Noetherian hypothesis is needed (Stacks, Lemma 36.30.1, tag 0A1H;
Olsson, §2.1.4, pp. 298–299, and proof of
Theorem 2.1.11, p. 302; Conrad, *Polarizations*, Example 2.2, p. 6, and the discussion of the `Pic⁰`
kernel, p. 8; Milne 2008, §6, pp. 30–31, states the very ampleness of the cube and refers to Mumford
for its proof, which is part of this target). The API is `graphBundle_baseChange`,
`mumfordMap_graphBundle`, `graphBundle_eq_of_mumford`, `cubicVeryAmple`, `sectionRank` and
`hilbertPolynomial`. *Needs:* A2.3, A2.4, A2.5; AlgebraicModuli Layer 1
(`relativeVeryAmple`); EnhancedDerivedSheaves E1.9 (`perfect_proper_pushforward`).

**Checks.**

- `Polarization.graph_elliptic`: for the principal polarization of an elliptic curve, `M` has degree
  `2`, `M³` has degree `6` and `h⁰(M³) = 6`; a definition with `φ_M = λ` would give degree `1`.
- `Polarization.graph_zero`: for `g = 0` and `d = 1`, `M³` is trivial and its pushforward has rank one.
- `Polarization.graph_degree_two`: for `g = 1` and `d = 2` the rank of `π_*(M³)` is `12`, not `6` and
  not `24`, while the kernel of `λ` has rank `4`.
- For `S = Spec ℂ ⊔ Spec ℂ`, `A = E ⊔ E` with polarizations `λ₀` and `2λ₀`, the degree
  function takes values `1, 2` and `π_*M³` has ranks `6, 12` on the two components.
- `Polarization.graph_char_two`: over a field of characteristic `2` the graph bundle of a principal
  polarization is defined, and representatives exist étale locally, although the torsor of
  symmetric representatives can be non-étale.
- For `S = Spec ℂ[t₁,t₂,…]` and the constant principally polarized elliptic curve `E × S`,
  the cubic graph bundle gives a closed immersion into `P⁵_S`; its pushforward is free of rank
  `6`, with higher direct images zero after every base change, although `S` is not Noetherian.

### A2.7 Positivity of ample intersection numbers

Prove `ampleIntersectionPositive`: for `X` proper over a field `k`, a closed subscheme `Z ⊆ X` of
dimension `d`, and ample line bundles `L₁, …, L_d` on `X`, the intersection number
`(L₁ ⋯ L_d · Z)` is positive. In particular, on a projective variety of dimension `g` with `D` ample,
`(D^{g−1} · E) > 0` for every nonzero effective Cartier divisor `E`, and a line bundle whose degree on
every curve is the limit of positive degrees of ample `ℚ`-classes is nef. The proof is by induction on
`d`, cutting by an effective divisor of a power of `L_d` (Stacks, Lemma 33.45.9, tag 0BEV). This is
the positivity input for A2.9 and for Rosati positivity in A6. *Needs:* SchemeAndStackFoundations
Layer 5 §5.3 (`Chow.c1`), §5.6 (intersection products), §5.2 (proper pushforward).

### A2.8 Projective presentations over normal bases

Prove `projectivePresentation`. (1) An abelian scheme over a Noetherian normal base is projective.
(2) Over a regular integral base, a symmetric ample line bundle on the generic fibre has a positive
tensor power that extends to a symmetric rigidified relatively ample line bundle. (3) Over a smooth
projective curve the total space is then absolutely projective; after tensoring with a sufficiently
ample line bundle from the base and passing to a power, one obtains a projective presentation over
`S`. (4) On each fibre over a field, `L^n` is very ample for `n ≥ 3` and its complete linear system is
projectively normal for `n ≥ 3`; the uniform choice `n ≥ 4` is the interface used by height
applications. The proof uses the normal-base polarization extension in Raynaud's argument (A2.1),
symmetrizes and rigidifies; very ampleness and multiplication of sections for powers of ample line
bundles give the fibre embeddings, promoted by coherent base change; adding an ample base line gives
absolute ampleness (Faltings–Chai I.1.10(a), p. 7, for (1); Gao–Habegger, §2.2, pp. 10–11, and
Appendix C, pp. 58–59 (arXiv v3), for the use of projective normality, which they assume). The
section-multiplication proof of projective normality and the extension of a prescribed generic line
bundle are not proved in these sources and are part of this target. The graph bundle of a global
polarization (A2.6) gives an alternative canonical projective presentation; without a global
polarization the normality hypothesis is kept, and no projectivity is asserted over arbitrary
non-normal bases. *Needs:* A1.5, A2.1, A2.4, A2.6; AlgebraicModuli Layer 1.

### A2.9 Normalized symmetric line bundles over curves are nef

Prove `nefNormalizedLines`. Let `S` be a smooth projective integral curve over a field and `A/S` an
abelian scheme. A symmetric rigidified relatively ample line bundle `L` is nef on the total space
`A`. For another symmetric rigidified line bundle `L′`, some integer `a > 0` makes `aL − L′` nef.
Moreover `L` restricts to a torsion class on every torsion multisection. The conclusions concern the
normalized `L`: tensoring with a line bundle of negative degree from `S` destroys nefness. The proof
chooses an ample line `N` on `S` with `L + π^*N` ample (A2.8), pulls back by `[n]` and divides by `n²`
(A1.5): the ample classes `L + n^{-2}π^*N` converge to `L`, which is therefore nef by A2.7; the same
argument applies to `aL − L′` once it is relatively ample, symmetric and rigidified; torsion
restrictions are A1.7 (Xie–Yuan, Lemma 4.1(2)–(4) and its proof, p. 20). The normalized `L` has degree
`0` on the zero section, and a negative base twist fails the conclusion already for a constant
elliptic family. *Needs:* A1.5, A1.7, A2.7, A2.8; SchemeAndStackFoundations Layer 5.

### A2.10 The Néron–Severi group

Define `AbelianNS A` for an abelian variety `A` over a field `K` as `Pic(A)/Pic⁰(A)`, where `Pic⁰(A)`
is the group of `K`-line-bundle classes algebraically equivalent to zero, equivalently the kernel of
`L ↦ φ_L` (A2.3). Define `AbelianNS.tensorQ A = AbelianNS A ⊗ ℚ`, its real analogue, the ample cone
(the positive real cone spanned by ample classes), and the geometric Picard number
`AbelianNS.picardNumber A = dim_ℚ NS(A_{K̄})_ℚ`, independent of the algebraic closure. The group
`NS(A_{K̄})` is distinct from `NS(A)` and from `NS(A_{K̄})^{Gal}`; the rank of `NS(A)` is a different
arithmetic invariant from `ρ(A)`. Finite generation is a theorem (A6.16), not part of the definition
(Milne 2022, Corollary 12.8 and its Mumford-map argument, p. 22; Conrad, *Polarizations*, the `Pic⁰`
kernel and descent obstruction, p. 8; Lipnowski–Tsimerman §4.2, pp. 17–18). The API is
`AbelianNS.mk` (the class of a line bundle), `AbelianNS.eq_iff` (two classes agree iff the quotient
line bundle is in `Pic⁰`), `AbelianNS.toSymmetricHom` (the injective Mumford map into the symmetric
homomorphisms `A → A^∨`), `AbelianNS.pullback` (contravariant, with identity, composition and
`[n]^* = n²` on classes), `AbelianNS.tensorQ`, `AbelianNS.picardNumber` (invariant under extension of
algebraically closed fields) and `AbelianNS.ext` (equality is algebraic equivalence of
representatives). *Needs:* A2.3; AlgebraicModuli Layer 7 (`relativePicardSheaf`); JacobianChallenge
Layer E.

**Checks.**

- `AbelianNS.elliptic_degree`: over an algebraically closed field `NS(E) ≅ ℤ` by degree, with
  `O(0) ↦ 1`.
- `AbelianNS.pic0_zero`: for `L ∈ Pic⁰(A)`, both its class and `φ_L` vanish; a base-normalized
  Poincaré line from `A^∨(K)` has class zero.
- `AbelianNS.multiplication_square`: on `E` with `O(0)`, `[2]^*` acts on `NS` by `4`, not `2`.
- `AbelianNS.geometric_descent`: a Galois-fixed class of `NS(A_{K̄})` need not come from a line bundle
  over `K`; identifying `NS(A)` with `NS(A_{K̄})^{Gal}` is not a theorem without a descent statement.
- `AbelianNS.picardNumber_zero`: the zero-dimensional abelian variety has `NS = 0` and `ρ = 0`.
- `AbelianNS.picardNumber_elliptic`: every elliptic curve over an algebraically closed field has
  `ρ = 1`.
- `AbelianNS.picardNumber_square`: in characteristic zero, if `End(E_{K̄}) = ℤ`, then `ρ(E × E) = 3`
  (the two factor classes and the diagonal), not `2`.

### Examples

For `E` elliptic with the principal polarization `λ` and every integer `d`:
`φ_{O(d·0)} = [d] ∘ λ`, `χ(O(d·0)) = d` and `deg φ = d²`.
For `d > 0`, `h⁰(O(d·0)) = d`; at `d = 0` it is `1`, and for `d < 0` it is `0`.
The graph bundle of `λ` is `O(2·0)` up to translation by a `2`-torsion point. For
`A = E × E′` with the product polarization, `(A)^∨ = E^∨ × E′^∨` and the product polarization is
principal. For a type-`(1, 2)` polarization of an abelian surface, `deg λ = 4` and `h⁰(L) = 2`.

### Dependencies

A0, A1; JacobianChallenge Layer E; ModularCurves 2D; AlgebraicModuli Layers 1 and 7;
SchemeAndStackFoundations Layer 1, Layer 5; ComplexComparisonPartII C3.2f.2.

<a id="a3"></a>

## Layer A3: Isogenies, finite-flat quotients, torsion and pairings

Degrees and kernels are scheme-theoretic throughout. The quotient of an abelian scheme by a
finite locally free subgroup is first an fppf algebraic-space quotient and then a scheme by A2.1;
it is not the quotient of an affine group. Dual kernels use Cartier duality; self-pairings induced
by a polarization are perfect only under the stated condition on its degree; descent along a theta
group needs a chosen splitting, not only an isotropic subgroup.

### A3.1 Isogenies over a base

Define `IsAbelianIsogeny f` for a homomorphism `f : A → B` of abelian schemes over `S`: the scheme
morphism of `f` is finite, flat and surjective. On an `Over S` morphism the light
predicate records `IsMonHom f` as well as those three properties; it is then of finite presentation, both schemes
being of finite presentation over `S`. Over an affine base `S = Spec R` this is the condition of
Tau Ceti's `TauCeti.GroupScheme.IsIsogeny`, which is stated for group schemes over `Spec R`; the
target here is the same condition over an arbitrary base. Its kernel `ker f`
(the scheme-theoretic kernel, Tau Ceti's group-scheme kernel) is then finite locally free, `f` is an
fppf torsor under `ker f`, and the rank of `f` (Mathlib `Scheme.Hom.finrank`) equals the rank of
`ker f` and is locally constant (Faltings–Chai I.1, p. 5). The API is `IsAbelianIsogeny.kernel` (the
finite locally free kernel with its closed immersion); `IsAbelianIsogeny.quotient` (for a
homomorphism `g : A → C`, `g` factors uniquely through `f` iff it kills `ker f`; this is A3.3);
`IsAbelianIsogeny.baseChange`; `IsAbelianIsogeny.comp_rank` (ranks multiply under composition); and
`IsAbelianIsogeny.field_iff` (over `Spec K` it is equivalent to Tau Ceti's `IsIsogeny`, finite and
surjective: `surjectiveHom_flat` below supplies flatness; stated
in `Suggested.lean` as `OverField.isAbelianIsogeny_iff`). The
proof uses that a finite locally free surjection is an fppf cover; translation identifies
`A ×_B A` with `A × ker f`. *Needs:* A0.1, A1.2; Tau Ceti `IsIsogeny`, `GroupScheme.IsIsogeny`, `GroupScheme/Kernel`
; SchemeAndStackFoundations Layer 1.

**Checks.**

- `IsAbelianIsogeny.identity`: the identity has kernel zero and rank one.
- Translation by a nonzero section is an isomorphism of schemes but does not preserve
  zero and fails `IsMonHom`, so it is excluded from `IsAbelianIsogeny`.
- `IsAbelianIsogeny.elliptic_two`: `[2]` on an elliptic curve over any base has rank `4`.
- `IsAbelianIsogeny.inclusion`: the closed immersion `E → E × E`, `x ↦ (x, 0)`, is a homomorphism but
  not an isogeny (not surjective).
- `IsAbelianIsogeny.supersingular`: `[p]` on a supersingular elliptic curve in characteristic `p` has
  rank `p²` although its kernel has a single geometric point; a definition by point counts fails.

Prove **`surjectiveHom_flat`**: every surjective homomorphism `f : A → B` of abelian varieties
over a field `K` is faithfully flat, with no equal-dimension hypothesis. After extension to `K̄`,
apply SchemeAndStackFoundations §4.12 `generic_flatness` to the finite-type morphism `f_{K̄}`
with integral target `B_{K̄}` and sheaf `O_{A_{K̄}}` (Stacks, Proposition 29.28.1, tag 052A).
This gives a nonempty open `U ⊆ B_{K̄}` over which the morphism is flat. Fix `u ∈ U(K̄)`;
for every `b ∈ B(K̄)` choose `a ∈ A(K̄)` with `f(a) = b − u`. The identity
`f ∘ t_a = t_{f(a)} ∘ f` transports flatness to `t_{b−u}(U)`. These opens contain every
closed point, hence cover the finite-type `K̄`-scheme `B_{K̄}`. Descend flatness along the
faithfully flat field extension (Stacks, Lemma 35.23.17, tag 02L2), using Mathlib's
`Module.Flat.of_flat_tensorProduct` on affine charts: if `T` is a faithfully flat `R`-algebra
and `T ⊗_R M` is flat over `T`, then `M` is flat over `R`. Surjectivity then gives
faithful flatness. `Suggested.lean` states the flatness conclusion with surjectivity as a
hypothesis as `OverField.surjectiveHom_flat`. *Needs:* A0.1; SchemeAndStackFoundations §4.12
(`generic_flatness`); Mathlib flatness and `Module.Flat.of_flat_tensorProduct`.

**Checks.**

- For an elliptic curve `E/K`, the projection `E × E → E` is faithfully flat with kernel
  `0 × E`, of dimension one; it is not finite and is not an isogeny.
- In characteristic `p`, `[p]` on a supersingular elliptic curve is faithfully flat although
  its kernel is nonreduced; faithful flatness does not imply a smooth kernel.
- The identity is faithfully flat, including on the dimension-zero abelian variety `Spec K`.

### A3.2 Multiplication maps and prime-to-characteristic torsion density

Prove `multiplicationAndDensity`. Let `A/S` have relative dimension `g`. (1) For `n ≠ 0`, `[n]` is
finite locally free of rank `|n|^{2g}`, hence an isogeny; it is étale exactly over the locus where `n`
is invertible, on positive-dimensional components; on a dimension-zero component it is the identity.
`A[n] = ker [n]` is finite locally free of rank `|n|^{2g}`, finite étale where `n` is invertible, and its
formation commutes with arbitrary base change. (2) Over an algebraically closed field, the union of
the `n`-torsion points for `n` invertible in the field is Zariski dense in `A`. The proof of (1)
reduces to the fibres. There `[n]` is finite because `[n]^*L ≅ L^{n²}` is ample for a symmetric ample
`L` (A1.5), and `deg [n] · h⁰(L) = h⁰([n]^*L) = h⁰(L^{n²}) = n^{2g} h⁰(L)` by A2.4; fibrewise flatness
then gives finite local freeness; étaleness is the differential `n` on `Lie(A)`. For (2), the
closure of the torsion is a subgroup whose identity component `B` would have dimension `b < g`;
boundedly many components would then contain the `ℓ^{2gr}` points of `A[ℓ^r]`, while each meets
`A[ℓ^r]` in at most `ℓ^{2br}` points (Milne 2022, Proposition 20.7, p. 44, and §8, Theorem 8.2 and
its proof, pp. 13–14; Kass, Corollary 1, p. 3; Xie–Yuan §1.1, p. 3, and §5.3, p. 27). `[p]` is not
étale on a positive-dimensional fibre in characteristic `p`; on the zero-dimensional object `[p]` is
étale even in characteristic `p`. `Suggested.lean` states (1) as `mulBy_isAbelianIsogeny` and
`etale_mulBy`, for the multiplication map `mulBy`, and (2) as `OverField.dense_primeToChar_torsion`.
*Needs:* A1.1, A1.5, A2.4, A3.1; JacobianChallenge Layer E.

**Checks.**

- `mulBy_one`: `[1] = id_A`, including on positive-dimensional abelian schemes.
- `mulBy_zero`: `[0]` is the zero homomorphism, the multiplicative unit `1` in the Hom group.
- `mulBy_neg_one`: `[−1]` is the group inversion morphism.
- `mulBy_add`: `[m + n]` is the pointwise sum of `[m]` and `[n]`, written as their product
  in the multiplicative Hom group.

### A3.3 Quotients by finite locally free subgroups

Define `AbelianQuotient A H` for an abelian scheme `A/S` and a finite locally free closed subgroup
scheme `H ⊆ A`: the fppf sheaf quotient `A/H`, represented by an abelian scheme `B/S`, with the
quotient map `q : A → B`, an `H`-torsor and an isogeny of rank `rk H`, whose formation commutes with
arbitrary base change and which is initial among homomorphisms killing `H`. No affineness of `A` is
used. The construction forms the quotient of `A` by the free finite flat equivalence relation as an
algebraic space with its induced group law, proves properness, smoothness and geometric
connectedness by fppf descent, and applies A2.1 to obtain a scheme; the universal property is that
of the sheaf coequalizer (Faltings–Chai I.1.7–1.9, pp. 4–7). The API is `AbelianQuotient.mk`
(the quotient and its isogeny), `AbelianQuotient.desc` (unique descent of a homomorphism killing
`H`), `AbelianQuotient.baseChange` (`(A/H)_T ≅ A_T/H_T`, respecting quotient maps) and
`AbelianQuotient.kernel_rank` (`ker q = H` and `rk q = rk H`). *Needs:* A2.1, A3.1;
ModularCurves 0E; SchemeAndStackFoundations Layer 1 §§1.5–1.6 (quotient sheaves), §1.17 (`artinBootstrap`); AlgebraicModuli Layer 3
(`ModuliDescent.finiteQuotientComparison`).

**Checks.**

- `AbelianQuotient.zero`: `A/0 ≅ A` with the identity as quotient map.
- `AbelianQuotient.full_torsion`: `E/E[2] ≅ E` with quotient map `[2]`, of rank `4`.
- `AbelianQuotient.local_kernel`: for supersingular `E` in characteristic `p`, the quotient by the
  connected Frobenius kernel has rank `p`; the quotient by its (trivial) group of geometric points
  would be `E` itself.

### A3.4 Torsion detects divisibility and integrality

Prove `torsionDivisibility`. For `n ≠ 0`, a homomorphism `f : A → B` factors as `f = [n]_B ∘ h` for a
unique `h` iff `f` kills the group scheme `A[n]`. Hence `Hom(A, B)` is torsion-free, and for
`q = f/n ∈ Hom(A, B) ⊗ ℚ`, `q` is integral iff `f` kills `A[n]`. The criterion uses the actual
finite flat kernel: no criterion using only prime-to-characteristic realizations detects
`p`-denominators in characteristic `p` (the realization form of the criterion for `ℓ` invertible is
A4.1). The proof
uses `A/A[n] ≅ A` (A3.3) and the quotient property; uniqueness holds because `n · h = 0` makes `h`
land in the finite group `B[n]`, and a smooth connected source maps trivially to it (Milne 2022, §8,
p. 12, and Lemmas 12.2 and 12.6, pp. 20–21; Lipnowski–Tsimerman §4.5, pp. 21–22). On a supersingular
`E`, vanishing on `E[p](K̄)` does not imply divisibility by `p`. `Suggested.lean` states
torsion-freeness over a field as `OverField.hom_torsionFree`. *Needs:* A3.2, A3.3.

### A3.5 Dual isogenies, Cartier-dual kernels and Weil pairings

Prove `dualIsogenyCartierKernel`. For an isogeny `f : A → B` with kernel `H`, the dual `f^∨ : B^∨ → A^∨`
is an isogeny with kernel canonically the Cartier dual `H^D`, of the same rank, compatibly with base
change. For `n ≠ 0` the Poincaré biextension gives a pairing `e_n : A[n] × A^∨[n] → μ_n`, perfect in the
sense of Cartier duality of finite locally free groups, natural for homomorphisms and compatible with
the transition maps for `n | m`. Under the fixed evaluation convention the pairing obtained after
interchanging `A` and `A^∨` (through `κ_A`) is the inverse pairing. The proof: trivializations of the
Poincaré bundle pulled back along `H` represent characters `H → 𝔾_m`, and their obstruction
identifies `ker f^∨` with `H^D`; applied to `[n]`, the two Poincaré trivializations descend to `μ_n`;
the inverse under exchange of factors is checked on the normalized biextension (Faltings–Chai I.1,
p. 5; Conrad, *Polarizations*, §1, pp. 2–5, and Remark 2.4, p. 7). For `n` invertible these are perfect
pairings of finite étale group schemes with target `μ_n`; for `n = p` in characteristic `p` the
finite-flat pairing is kept although geometric points do not detect it. *Needs:* A2.2, A3.3;
ModularCurves 0B; Tau Ceti `cartierDualBaseChangeIso` over affine bases.

For elliptic curves compare the Cartier–Nishi construction and its evaluation convention with
ModularCurves 2D–2E through `dual_elliptic`. For the same intrinsic pairing `e_n`, the two
self-duality pullbacks satisfy `e_n(x, ι_E y) = e_n(x, λ_E y)^{-1}`. Carry this identity through
the theta commutator comparison in A3.6 and the polarized pairing in A3.7, and through
ModularCurves 2E's `weilPairing_eq_equationLevel` over fields with `n` invertible. The comparison
retains the order of the Poincaré trivializations as well as the inversion of the dual argument.
*Needs:* ModularCurves 2D–2E in addition to the inputs above.

### A3.6 Theta groups and polarized descent

For a commutative group object `G` over `S` and a bimultiplicative morphism
`e : G ×_S G → 𝔾_m`, distinguish three predicates:

- `isSkewSymmetricPairing`: `e(y, x) = e(x, y)^{-1}` as morphisms.
- `isDiagonallyAlternatingPairing`: `e ∘ Δ_G = 1` as morphisms, equivalently `e(x, x) = 1`
  over every `S`-scheme.
- `isStronglyAlternatingPairing`: fpqc locally on `S` there exists a central extension of
  sheaves of groups `1 → 𝔾_m → G̃ → G → 1` whose commutator is `e`. Exactness is sheaf
  exactness, so lifts of sections of `G` exist locally on each test scheme.

These predicates use the shared `Grp (Over S)` and sheaf carriers; for finite locally free
groups they apply to ModularCurves 2E's `GroupSchemePairing`, without another finite-flat-group
carrier. Prove `stronglyAlternatingPairing_diagonal` and `diagonallyAlternatingPairing_skew`:
strong alternation implies diagonal alternation, which implies skew symmetry by expanding
`e(x + y, x + y)`. Neither converse holds in general. Prove
`stronglyAlternatingPairing_restrict` for pullback along any homomorphism of commutative groups
and `stronglyAlternatingPairing_baseChange` for arbitrary base change, carrying the central
extension witness through each operation (Boxer–Calegari–Gee–Pilloni, Remark 10.3.2 and
(10.3.3), p. 215, arXiv v1; the implications and compatibility are the commutator identities
and pullbacks of central extensions).

Define `ThetaGroup L` for an abelian scheme `π : A → S` and a line bundle `L` on `A` rigidified along
zero: with `K(L) = ker φ_L`, the kernel of the Mumford map of A2.3 (a closed subgroup scheme),
`G(L)` is the group functor on `S`-schemes `T` of pairs `(x, ψ)` with `x ∈ K(L)(T)` and
`ψ : t_x^*L_T ≅ L_T`. Multiplication is
`(x, ψ)(y, χ) = (x + y, ψ ∘ t_x^*χ)`, with `t_x^*t_y^*L_T = t_{x+y}^*L_T`; the scalar
inclusion is `c ↦ (0, c·id)` and `c` acts by `ψ ↦ cψ`. Evaluation at zero and the rigidification
identify the fibre over `x` with `Isom(x^*L_T, O_T)`. Thus its torsor is the inverse-frame
torsor of `L|_{K(L)}`, or the usual frame torsor of `L^{-1}|_{K(L)}`; usual frames
`Isom(O_T, x^*L_T)` obtained by inversion carry the scalar action `c^{-1}`.
(1) The sequence
`1 → 𝔾_m → G(L) → K(L) → 1` is a central extension of fppf sheaves of groups over `S`, and `G(L)` is
represented by that inverse-frame torsor: for `x ∈ K(L)(T)` the rigidification gives
`t_x^*L_T ≅ L_T ⊗ π_T^*(x^*L_T)`, so lifts of `x` exist Zariski locally on `T`, and the
automorphisms of `L_T` are `O(A_T)^× = O(T)^×` by the universal functions of A0.3(1). (2) The
commutator `e_L : K(L) ×_S K(L) → 𝔾_m`, computed as `ũṽũ^{-1}ṽ^{-1}` on local lifts, is a
bimultiplicative morphism of `S`-group functors. The extension `G(L)` itself witnesses
`isStronglyAlternatingPairing e_L`; its diagonal identity follows because a lift commutes with
itself, over every test scheme, nonreduced characteristic-two bases included.
For `n ≥ 1`, `A[n] ⊆ K(L^n)` and the commutator of `G(L^n)`
restricted to `A[n]` is `(x, y) ↦ e_n(x, φ_L(y))` with `e_n` of A3.5. (3) If `L` is relatively
ample, `K(L)` is finite locally free of rank `χ(L_s)²` over `s ∈ S` and `e_L` identifies `K(L)` with
its Cartier dual. (4) The formation of `G(L)`, of `e_L` and of the descent in
(5) commutes with arbitrary base change `T → S`. (5) For a finite locally free subgroup `H ⊆ K(L)`,
splittings `H → G(L)` of the extension over `H` (level subgroups) are exactly the `H`-linearizations
of `L`, and through fppf descent along the `H`-torsor `q : A → A/H` of A3.3 they correspond to pairs
of a line bundle `M` on `A/H` rigidified along zero and a rigidified isomorphism `q^*M ≅ L`; isotropy
of `H` alone does not choose the descent. Over a field this is the classical theta group, and no
separate field carrier is introduced (Faltings–Chai, the introduction to I.5, p. 25, for the relative
theta group, its commutator and nondegeneracy, and I.1.6, p. 4, for relatively ample `L`; Milne 2022,
Theorem 13.3(a), p. 25, for the order `χ(L)²` of `K(L)`). The construction composes translated
isomorphisms, identifies the scalar kernel through A0.3(1), identifies the commutator with the
biextension of A2.3 restricted to `K(L) × K(L)` and, on `A[n]`, with the Poincaré pairing of A3.5
through `φ_{L^n} = φ_L ∘ [n]`, reads perfection off the Cartier-dual kernel of the isogeny `φ_L`
(A2.5, A3.5), and descends invertible sheaves along the `H`-torsor. The API is `ThetaGroup.mk`,
`ThetaGroup.commutator` (the bimultiplicative pairing on `K(L)` as a morphism over `S`),
`ThetaGroup.stronglyAlternating` (the extension `G(L)` witnesses strong alternation),
`ThetaGroup.restrict` (pullback of the extension along a subgroup inclusion, with the restricted
commutator),
`ThetaGroup.descend` (a splitting over a finite locally free `H` gives the descended rigidified line
bundle on `A/H` with its pullback identification) and `ThetaGroup.baseChange` (an isomorphism of
central extensions preserving the scalar inclusion, commutator and witness). *Needs:* A0.3, A2.3,
A2.4, A2.5, A3.3, A3.5; ModularCurves 2E (the shared finite-flat pairing carrier);
SchemeAndStackFoundations Layer 1 (sheaves and torsors).

**Checks.**

- `ThetaGroup.trivial`: for `L = O_A`, `K(L) = A` and the extension splits; `K(L)` is not finite when
  `g > 0`, so `O_A` is not ample.
- `ThetaGroup.elliptic_degree_two`: for a line bundle of degree two on `E`, `K(L) = E[2]` of rank `4`.
- `ThetaGroup.strongly_alternating`: on `(ℤ/2)²` over `ℚ` the `μ₂`-valued pairing
  `((a₁, a₂), (b₁, b₂)) ↦ (−1)^{a₁b₁ + a₂b₂}` is skew-symmetric and perfect, but `e(x, x) = −1` for
  `x = (1, 0)`; the commutator pairing of a theta group always has `e(x, x) = 1`, so a definition
  asking only for skew symmetry fails.
- `ThetaGroup.alpha_two`: on `α₂/𝔽₂`, `e(x, y) = 1 + xy` is Cartier-perfect and diagonally
  alternating on every test algebra, since `x² = 0`, but is not strongly alternating. On an
  affine characteristic-two base a `𝔾_m`-torsor over `α₂` trivialized at zero is trivial, since
  invertible modules are unchanged by an affine nilpotent thickening. A normalized extension
  cocycle is therefore `1 + axy`, which is symmetric and has trivial commutator. The same
  calculation after any fpqc base extension rules out a witness for the nontrivial `1 + xy`.
- `ThetaGroup.elliptic_level_three`: for `E` over an algebraically closed field of characteristic
  prime to `3`, let `L = O(0)`, `λ = φ_L`, and choose `P, Q ∈ E[3]` with
  `e_3(P, λQ) = ζ₃` a primitive cube root. With the stated multiplication and scalar inclusion,
  the commutator of lifts in `G(L³)` is `ζ₃`, whereas reversing the commutator gives `ζ₃^{-1} ≠ ζ₃`.
  Evaluation at zero gives inverse frames, with scalar action `c`, compatibly with base change.
- `ThetaGroup.dual_numbers_char_two`: over `S = Spec k[ε]/(ε²)` with `k` of characteristic `2`, the
  constant elliptic scheme `E_S` and `L = O(2·0)` rigidified along zero have `K(L) = E_S[2]`, finite
  locally free of rank `4` and not étale. `μ₂` has no nontrivial points over a reduced
  characteristic-`2` scheme but contains `1 + ε` over `S`, so checking `e(x, x) = 1` on geometric points,
  or deriving it from skew symmetry, says nothing here. The base-changed theta extension supplies
  the strong-alternation witness and its diagonal identity over every `S`-scheme.

### A3.7 Polarized Weil pairings

Prove `polarizedWeilPairing`. For a polarization `λ` and `n ≥ 1` put `e_{λ,n}(x, y) = e_n(x, λ y)` on
`A[n]`. It is strongly alternating, hence diagonally alternating, including for even `n`;
it is perfect iff `λ` restricts to an isomorphism on
`A[n]`, equivalently iff `ker λ` has no `n`-primary part on any fibre, in particular when
`gcd(n, deg λ) = 1`. For an isogeny `f`, `e_{f^∨μf, n}(x, y) = e_{μ,n}(fx, fy)`. The proof works fppf
locally on `S` with a representative `L` of `λ` (A2.6), for which the extension `G(L^n)` restricted
to `A[n]` has commutator `e_{λ,n}`. This local extension is retained as the fpqc-local witness
of strong alternation; its diagonal identity and the pairing descend to `S`, without requiring a
global representative or a global extension. Export `polarizedWeilPairing.stronglyAlternating`
with restriction and arbitrary-base-change compatibility. The proof reads perfection off
Cartier duality composed with `λ[n]` prime by prime; pullback is naturality
of the Poincaré bundle (Faltings–Chai I.1.6–1.8, pp. 4–5; Boxer–Calegari–Gee–Pilloni,
Remark 10.3.2, p. 215). *Needs:* A2.5, A2.6, A3.5, A3.6.
For elliptic curves the comparison with ModularCurves' equation-normalized pairing uses
A3.5's inversion adapter, including its evaluation convention; the two self-duality
pullbacks of a fixed intrinsic pairing are inverses.

**Checks.**

- A polarization of degree prime to `3` gives a perfect pairing `A[3] × A[3] → μ₃`.
- A polarization of type `(1, 2)` is not perfect on `A[2]`, although its restricted theta
  extension still witnesses strong alternation locally.
- For a principal polarization of a supersingular elliptic curve in characteristic `2`,
  `E[2]` is connected of rank `4`; a local representative supplies the central extension witness,
  and a check on geometric points alone cannot supply it.
- On `E/ℂ`, choose `x,y ∈ E[3]` with `e_3(x, λ_E y) = ζ₃`. Then
  `e_3(x, ι_E y) = ζ₃^{-1} ≠ ζ₃`, detecting omission of the inversion adapter.

### A3.8 Full level structures

Define `FullLevel A N` for an abelian scheme `A/S` of relative dimension `g` and `N ≥ 1` invertible
on `S`: an isomorphism of finite étale group schemes `α : (ℤ/Nℤ)^{2g}_S ≅ A[N]`, that is, an ordered
basis of `A[N]` with no symplectic condition. Isomorphisms of level structures are isomorphisms of
abelian schemes carrying one basis to the other (Olsson, proof of Theorem 2.1.11, p. 302; Kass,
Theorem 8, p. 7). The API is `FullLevel.torsionBasis`, `FullLevel.baseChange`,
`FullLevel.changeBasis` (precomposition makes the étale sheaf of full level structures a
`GL_{2g}(ℤ/Nℤ)`-torsor over `S`), `FullLevel.weilPairing` (for a polarization `λ` of degree prime
to `N`, the matrix of `e_{λ,N}` in the basis, a function to `μ_N`-valued alternating matrices) and
`FullLevel.levelFunctor` (the torsor is a level functor in the sense of AlgebraicModuli
`rigidLevelStructure`; its rigidity for `N ≥ 3` on polarized abelian schemes is the polarized
automorphism theorem of A6). *Needs:* A3.2, A3.7; SchemeAndStackFoundations Layer 1 (torsors);
AlgebraicModuli Layer 5 §5.2.

**Checks.**

- `FullLevel.count_elliptic`: for an elliptic curve over an algebraically closed field of
  characteristic prime to `3`, the number of full level-`3` structures is `|GL₂(𝔽₃)| = 48`, not
  `|SL₂(𝔽₃)| = 24`; a definition imposing a symplectic basis fails.
- `FullLevel.two_inversion`: on a positive-dimensional abelian variety in characteristic `≠ 2`,
  `[−1]` is a nontrivial automorphism fixing every full level-`2` structure.
- `FullLevel.bad_characteristic`: for an elliptic curve in characteristic `p`, `E[p]` has rank `p²` but
  is not the constant étale group `(ℤ/p)²`, so no full level-`p` structure exists in this sense.

### A3.9 The Rosati involution

Define `Polarization.rosati` for a polarization `λ` of an abelian variety `A` over a field:
the map `α ↦ α^† = λ^{-1} ∘ α^∨ ∘ λ` on `End⁰(A) = ℚ ⊗ End A`, where `λ^{-1} ∈ Hom⁰(A^∨, A)` is the
rational inverse: `ker λ` is killed by an integer `n`, so `[n] = μ ∘ λ` for a unique `μ` (A3.3, A3.4)
and `λ^{-1} = μ ⊗ 1/n`. It is a `ℚ`-linear
anti-involution, `(αβ)^† = β^† α^†` and `α^{††} = α`, fixes rational scalars, and is the adjoint for the
polarized Weil pairing of A3.7 tensored with `ℚ_ℓ`. For a principal `λ` it preserves `End A`; for
general `λ`, only `End⁰(A)`. No restriction on the characteristic is part of the definition (Milne
2008, §14, p. 61, for the definition and its additivity, anti-multiplicativity and `ℚ`-linearity;
Milne 2008, §11, p. 53, for polarizations). The proof: the rational inverse
exists by A3.4; contravariance of duality gives anti-multiplicativity; symmetry of `λ` (A2.5) gives
involutivity; naturality of the Poincaré bundle gives adjointness. The API is `rosati` (as a
`ℚ`-linear equivalence `End⁰ A ≃ (End⁰ A)^{mop}`), `rosati_mul`, `rosati_rosati`, `rosati_algebraMap`,
`weilPairing_rosati` (`e_{ℓ}^λ(αx, y) = e_ℓ^λ(x, α^† y)`) and `rosati_principal_mem_End`. *Needs:*
A2.2, A2.5, A3.4, A3.7; JacobianChallenge Layer E.

**Checks.**

- `Polarization.rosati_elliptic`: on an elliptic curve with its principal polarization, `α^†` is the
  dual isogeny and `α α^† = [deg α]`.
- `Polarization.rosati_mulBy`: `[n]^† = [n]` for every polarization.
- `Polarization.rosati_not_multiplicative`: for a supersingular `E` over `𝔽̄_p` and noncommuting
  `α, β ∈ End(E)`, `(αβ)^† = β^†α^† ≠ α^†β^†`; a multiplicative definition fails.
- `Polarization.rosati_product`: on `E × E` with the product principal polarization, `†` is the
  conjugate transpose on `M₂(End⁰ E)`.

### A3.10 The effective divisor criterion for ampleness

Prove `divisorAmpleCriterion`. On an abelian variety over an algebraically closed field, a nonzero
effective divisor whose support contains no translate of a positive-dimensional abelian subvariety
is ample. Its translation stabilizer is a finite group scheme, so its Mumford map is an isogeny and
the effective nondegenerate line bundle is ample. The proof: a positive-dimensional reduced connected
stabilizer would translate a point of the support into the support, contradicting the hypothesis;
the length of the stabilizer is kept as a scheme (Caro–Pasten, Lemma 5.1 and its proof, p. 16). A
fibre divisor on `E × E` contains an elliptic translate and is not ample; a divisor of positive degree
on `E` is ample. *Needs:* A2.3, A2.4, A3.3; JacobianChallenge Layer E.

### A3.11 Principally polarized quotients and spreading

Prove `principalQuotient`. Over an algebraically closed field, for an ample `L` there are an isogeny
`u : A → A₀` and a principal ample `L₀` on `A₀` with `L ≅ u^*L₀` and `deg u = h⁰(L)`. The construction
chooses a maximal isotropic finite subgroup scheme of `K(L)` for the theta commutator together with a
splitting of the theta extension over it (A3.6) and descends `L`. Over an integral Noetherian normal
base, geometric generic data of this kind spread out after a finite extension of the function field,
passage to a finite dominant model, shrinking, and a further open restriction; the extension may be
inseparable, and an étale dominant model exists only when the data descend to a separable extension.
This is a generic local statement, not principalization over every base. The proof uses the finite
theta group over an algebraically closed field to choose the subgroup and splitting, then descends the
kernel, splitting, quotient and line bundle to a finite field of definition and spreads out (Conrad,
*Polarizations*, §3, p. 9, discussion after Definition 3.2, which states the existence of the isogeny
and refers to Mumford for the proof; Faltings–Chai I.1.7–1.9, pp. 4–7, for spreading). The existence
of a maximal isotropic subgroup scheme with a splitting of the restricted theta extension, inseparable
kernels included, and the descent of the prescribed `L` are not proved in these sources and are part
of this target. For an elliptic degree-`d` line bundle the quotient has degree `d` whereas
`deg φ_L = d²`; a maximal isotropic kernel is a group scheme, not a set of geometric torsion points.
*Needs:* A2.4, A2.6, A3.3, A3.6; AlgebraicModuli Layer 1.

### A3.12 Differences of Weierstrass points in genus two

Prove `genusTwoTwoTorsion`. For a smooth genus-two curve `C` over a field of characteristic `≠ 2`, the
fifteen classes `[w_i − w_j]` of differences of distinct geometric Weierstrass points are exactly the
nonzero `2`-torsion points of `Jac(C)`. With the six Weierstrass points numbered, the Weil pairing of
`[w_i − w_j]` and `[w_k − w_l]` is `(−1)^{|{i,j} ∩ {k,l}|}`; this identifies `Jac(C)[2]` with the
even-cardinality subsets of `{1, …, 6}` modulo the full set, `𝔽₂`-symplectically and equivariantly for
`S₆ ≅ Sp₄(𝔽₂)`. The proof represents each difference by its divisor class, uses the hyperelliptic
functions `x − x(w_i)` to show `2[w_i − w_j] = 0`, shows distinct pairs give distinct classes, counts
`16`, and computes the pairing with disjoint representatives (Boxer–Calegari–Gee–Pilloni,
*Modularity theorems for abelian surfaces*, §8.1 and equation (8.1.1), p. 180, arXiv v1). Two disjoint pairs pair to
`+1`; pairs with one common point pair to `−1`. *Needs:* A3.7; JacobianChallenge Layers D and E.

### A3.13 Symmetric homomorphisms are Mumford maps

Prove `symmetricHomRealization`. Let `A` be an abelian variety over an algebraically closed field `k`
of any characteristic. Every symmetric homomorphism `f : A → A^∨` (`f^∨ ∘ κ_A = f`, A2.3) is `φ_L` for
a line bundle `L` on `A`, unique up to tensoring with `Pic⁰(A)`. With the kernel statement of A2.10
this makes `AbelianNS.toSymmetricHom` an isomorphism of groups `NS(A) ≅ Hom(A, A^∨)^{sym}`, before any
tensoring with `ℚ`. Ampleness of `L` is not asserted, and over a field that is not algebraically
closed the statement is generally false and not claimed. The proof: the bundle `M = (id, f)^*P`,
rigidified along zero by the Poincaré rigidifications, has Mumford map `f + f^∨ ∘ κ_A = 2f` by the
computation of A2.6, which uses only the symmetry of `f`. By A3.6 (2) with `n = 2`, `A[2] ⊆ K(M²)` and
the commutator of `G(M²)` on `A[2]` is `(x, y) ↦ e_2(x, φ_M(y)) = e_2(x, f(2y)) = 1`, an identity of
morphisms that does not use étaleness of `A[2]`. So the part of `G(M²)` over `A[2]` is a commutative
extension of the finite commutative group scheme `A[2]` by `𝔾_m`. Over an algebraically closed field
every such extension splits: a finite commutative group scheme over `k` has a composition series with
factors `ℤ/ℓ` (`ℓ` prime), `μ_p` and `α_p` (`p` the characteristic; Dieudonné theory for the `p`-part),
which reduces the splitting to these factors, whose extensions by `𝔾_m` are classified by
`k^×/k^{×ℓ}`, `H¹(k, ℤ/p)` and `k/k^p`, all zero. The splitting is a level subgroup over `A[2]`, so
A3.6 (5), with `A/A[2] ≅ A` through `[2]` (A3.3), descends `M²` to a rigidified `L` with
`[2]^*L ≅ M²`. Then `4φ_L = [2]^∨ ∘ φ_L ∘ [2] = φ_{M²} = 4f` by A2.3, and `φ_L = f` because
`Hom(A, A^∨)` is torsion-free (A3.4). Uniqueness is the kernel `Pic⁰(A)` of `L ↦ φ_L` (A2.10). Conrad, *Polarizations*, Lemma 2.3 and its proof, pp. 6–7, states the result,
refers to Mumford, *Abelian varieties*, §20, Theorem 2, and §23, Theorem 3, and isolates the
composition series as the step that needs `k` algebraically closed; the splitting of commutative
extensions by `𝔾_m`, inseparable factors included, is not proved there and is part of this target.
*Needs:* A2.3, A2.6, A2.10, A3.3, A3.4, A3.5, A3.6.

**Checks.**

- On an elliptic curve `E` over an algebraically closed field, with `λ = φ_{O(0)}`, the symmetric
  homomorphisms `E → E^∨` are the `[d] ∘ λ`, `d ∈ ℤ`, realized by `O(d·0)`. For every point `P`, `O(P)`
  also realizes `λ` and differs from `O(0)` by the class `O(P − 0)` of `Pic⁰`, so `L` is unique only
  modulo `Pic⁰`; `d = −1` is realized by `O(−0)`, which is not ample.
- On `E × E` with `λ₀ = λ × λ`, the symmetric isomorphism `f(x, y) = (λy, λx)` is `φ_L` for
  `L = m^*O(0) ⊗ p₁^*O(0)^{-1} ⊗ p₂^*O(0)^{-1}`. The bundle `(id, f)^*P` has Mumford map `2f`, of degree
  `2⁴ = 16`, not `1`: it does not realize `f`, and `[L]` is half its class in `NS(E × E)`. `L` has
  degree `2` on the diagonal and `−2` on the antidiagonal, so it is not ample; realization gives no
  positivity.
- For a supersingular `E` over an algebraically closed field of characteristic `2` and `f = λ`, the
  descent runs along `[2]`, whose kernel `E[2]` is connected of rank `4` with no nonzero geometric
  point, and yields `L` of degree `1` with `[2]^*L ≅ M²`, where `M = (id, λ)^*P` has degree `2`. A
  splitting of the theta extension only over the geometric points of `E[2]` is a splitting over the
  trivial group and descends nothing.

### Examples

On `E` over `ℂ`: `E[3] ≅ (ℤ/3)²`, `e_3` is the standard alternating pairing to `μ₃`, and the full level
structures are the `48` ordered bases. On a supersingular `E` over `𝔽̄_p`: `E[p]` is connected of rank
`p²`, `E/ker(F) ≅ E^{(p)}`, and `[p] = V ∘ F` with both factors of rank `p`. For `A = E × E′` and the
product principal polarization, the Rosati involution is `(α, β) ↦ (α̂, β̂)` on
`End⁰ E × End⁰ E′` when `E` and `E′` are not isogenous.

### Dependencies

A0–A2; Tau Ceti `IsIsogeny`, group-scheme kernels and Cartier duality; JacobianChallenge Layers D
and E; ModularCurves 0B, 0E; AlgebraicModuli Layers 1, 3 and 5; SchemeAndStackFoundations Layer 1.

<a id="a4"></a>

## Layer A4: Realizations and deformations

Nilpotent-base Serre–Tate and divided-power Grothendieck–Messing are kept apart; both are
equivalences of categories including morphisms and extra structure. Formal deformations over a
complete local ring become algebraic only through the separate effectivity theorem. Ordinary
Serre–Tate parameters describe every dimension, with integral symmetry at `p = 2` and weighted
equations for nonprincipal polarizations. CrystallineCohomology CR.1 and CR.7.1 supply the
crystalline site and coefficient calculus. A4.CR.7.2 constructs the contravariant Dieudonné crystal
of an arbitrary Barsotti–Tate group, its twists and its Grothendieck–Messing lifting equivalence; the general
classification of `p`-divisible groups belongs to FiniteFlatGroupsAndIntegralPadicHodgeTheory.

### A4.1 The integral Tate module

Define `AbelianTate A ℓ` for an abelian scheme `A/S` of relative dimension `g` and a prime `ℓ`
invertible on `S`: the inverse system of finite étale group schemes `A[ℓ^r]` (A3.2) with the maps
`[ℓ] : A[ℓ^{r+1}] → A[ℓ^r]`, a lisse `ℤ_ℓ`-sheaf of rank `2g`. At a geometric point `s̄` its fibre is
Tau Ceti's `TateModule ℓ (A(s̄))`, the inverse limit of the `ℓ^r`-torsion of the group of geometric
points, with the continuous action of the étale fundamental group; over a field `K` it is
`T_ℓ A = TateModule ℓ (A(K^{sep}))` with its continuous `Gal(K^{sep}/K)`-action, and
`V_ℓ A = T_ℓ A ⊗ ℚ_ℓ` (Milne 2022, Remark 8.4, p. 14; Stanford VIGRE notes *Complex theory of abelian
varieties*, §1.2, pp. 3–4, for the complex case). The API is `AbelianTate.mk`; `AbelianTate.rank`
(free of rank `2g`, from `TateModule.free_of_natCard` and `#A[ℓ^r](K^{sep}) = ℓ^{2gr}`);
`AbelianTate.modPow` (`T_ℓ A / ℓ^r ≅ A[ℓ^r]`, compatibly with transitions); `AbelianTate.map`
(homomorphisms induce continuous `ℤ_ℓ`-linear maps, additively and compatibly with composition);
`AbelianTate.baseChange`; `AbelianTate.dualPairing` (`T_ℓ(A^∨) ≅ Hom_{ℤ_ℓ}(T_ℓ A, ℤ_ℓ(1))` through the
pairings `e_{ℓ^r}` of A3.5, with `ℤ_ℓ(1) = lim μ_{ℓ^r}`); `AbelianTate.divisible_iff` (a homomorphism
`f` is divisible by `ℓ^r` in `Hom(A, B)` iff `T_ℓ f` is divisible by `ℓ^r`, the realization form of A3.4).
*Needs:* A3.2, A3.4, A3.5; Tau Ceti `TateModule`; SchemeAndStackFoundations Layer 1.

**Checks.**

- `AbelianTate.zero`: the zero-dimensional abelian scheme has zero Tate module.
- `AbelianTate.elliptic_rank`: for an elliptic curve over `ℂ`, `T₃ E ≅ ℤ₃²` and `E[3] ≅ (ℤ/3)²`; a
  rank-one definition fails.
- `AbelianTate.characteristic_prime`: for a supersingular elliptic curve in characteristic `p`,
  `lim E[p^r](K̄) = 0`; the construction is not applied at `ℓ = p`.
- `AbelianTate.determinant`: for an elliptic curve the determinant of the Galois action on `T_ℓ E` is
  the `ℓ`-adic cyclotomic character, through the Weil pairing with target `μ_{ℓ^r}`.

### A4.2 The universal vector extension

Define `AbelianVectorExtension A` for an abelian scheme `π : A → S`: with `V(F) = Spec_S Sym(F^∨)`
the vector group of a finite locally free `O_S`-module `F` (AlgebraicVectorBundles L2B), the canonical
extension
`0 → V(ω_{A^∨}) → E(A) → A → 0`
such that pushout along its vector kernel gives an isomorphism
`Hom_{O_S}(ω_{A^∨}, F) ≅ Ext¹_{fppf}(A, V(F))`, natural in `F` and compatible with base change. For each
extension `0 → V(F) → G → A → 0` there are a unique `O_S`-linear `u : ω_{A^∨} → F` and a unique
homomorphism of extensions `E(A) → G` inducing `V(u)` on the vector kernels and the identity on `A`. The
universal property is in this category of vector extensions, whose kernel maps are induced by
`O_S`-linear maps; a homomorphism of the underlying group schemes of the kernels, such as an additive
polynomial in characteristic `p`, is not admitted. Its invariant
differentials identify with `H¹_dR(A/S)` (A4.3), with exact sequence
`0 → ω_A → H¹_dR → Lie(A^∨) → 0`; equivalently `Lie E(A)` is the dual of `H¹_dR(A/S)`. These two
variance conventions are different statements (Maculan, *The universal vector extension of an
abeloid variety*, §2.7, Definition 2.19, Theorem 2.20 and Corollary 2.21, pp. 12–13, arXiv v2; Illusie,
*Grothendieck at Pisa: crystals and Barsotti–Tate groups*, §4.2(iv), pp. 16–17). The construction uses
`Lie(A^∨) ≅ R¹π_*O_A` and the extension class corresponding to the identity of `R¹π_*O_A`, descends the
rigidified vector torsor and its group law, and identifies `E(A)` with the moduli of rigidified line
bundles with connection on `A^∨` whose underlying bundle lies in `Pic⁰_{A^∨/S} ≅ A` (A2.2); the same
moduli problem on `A` gives `E(A^∨)`. The sources cite Mazur–Messing for the classification
`Hom(ω_{A^∨}, F) ≅ Ext¹(A, V(F))` over an arbitrary base and for the identification of invariant forms
with `H¹_dR`; those proofs, with base change and the Hodge filtration, are part of this target. The API
is `AbelianVectorExtension.mk`, `AbelianVectorExtension.pushout` (the universal property among
vector extensions, with kernel maps `V(u)` for `O_S`-linear `u`),
`AbelianVectorExtension.baseChange`, `AbelianVectorExtension.invariantForms`
(`ω_{E(A)} ≅ H¹_dR(A/S)` with the Hodge sequence) and `AbelianVectorExtension.ext` (maps of extensions
are determined by their maps on vector kernels and on `A`). *Needs:* A1.3, A2.2;
AlgebraicVectorBundles L0B, L2B; EnhancedDerivedSheaves E1.9 (`perfect_proper_pushforward`);
SchemeAndStackFoundations Layer 1, Layer 2 §2.6 (`qcoh_higherDirectImages`).

**Checks.**

- `AbelianVectorExtension.zero`: for the dimension-zero `A` both the vector kernel and `E(A)` are zero.
- `AbelianVectorExtension.elliptic`: for an elliptic curve the vector kernel has rank one and
  `ω_{E(A)}` has rank two.
- `AbelianVectorExtension.zero_pushout`: pushing out along the zero map `ω_{A^∨} → F` gives the split
  extension `A × V(F)`.
- `AbelianVectorExtension.variance`: the canonical comparisons are `ω_{E(A)} ≅ H¹_dR(A/S)` and
  `Lie E(A) ≅ H¹_dR(A/S)^∨`; an unqualified identification `Lie E(A) = H¹_dR` has the wrong variance.
- `AbelianVectorExtension.additive_polynomial`: for an elliptic curve `C` over `𝔽_p`, the Frobenius `Fr`
  acts on the line `H¹(C, O_C)` by some `a ∈ 𝔽_p`, and the additive polynomial `ψ(t) = t^p − at` on `𝔾_a`
  is not `V(u)` for a linear `u`. Pushout along `ψ` sends the class `c ∈ Ext¹(C, 𝔾_a) ≅ H¹(C, O_C)` of
  `E(C)` to `Fr(c) − ac = 0`, so it splits, and a splitting gives `h : E(C) → 𝔾_a` restricting to `ψ` on
  the kernel; then `(π, 0)` and `(π, h)` are distinct homomorphisms from `E(C)` to the split extension
  `C × 𝔾_a` over `C`. Uniqueness holds only among maps inducing some `V(u)`.

### A4.3 First de Rham cohomology

Define `AbelianH1dR A` for `π : A → S` as `R¹π_*(Ω^•_{A/S})`. It is locally free of rank `2g`,
commutes with arbitrary base change, and carries the natural exact sequence
`0 → ω_A → H¹_dR(A/S) → Lie(A^∨) → 0` with `ω_A = π_*Ω¹_{A/S}`. For `S` smooth over a field `k` it carries
the integrable Gauss–Manin `k`-connection, for which the Hodge filtration satisfies Griffiths
transversality. Poincaré duality gives a perfect pairing `⟨ , ⟩` between `H¹_dR(A/S)` and
`H¹_dR(A^∨/S)`. A polarization `λ : A → A^∨`, with contravariant pullback
`λ^* : H¹_dR(A^∨/S) → H¹_dR(A/S)`, induces the self-pairing `(x, y) ↦ ⟨λ^*x, y⟩` on `H¹_dR(A^∨/S)`,
perfect when `deg λ` is invertible on `S` (in particular for a principal polarization) and possibly
degenerate otherwise. Where `λ^*` is invertible this transports to `(u, v) ↦ ⟨u, (λ^*)^{-1}v⟩` on
`H¹_dR(A/S)`; no inverse or complementary isogeny of `λ` enters the pairing otherwise. Cohomological realizations carry the
inverse Tate twist (Faltings–Chai I.3, pp. 14–15; Anschütz–Le Bras, *Prismatic Dieudonné theory*,
Proposition 4.5.1, p. 53, arXiv v4, for the degree-one comparison over bounded prisms). The
relative de Rham complex is bounded on each open subset where the locally constant relative
dimension is bounded. Construct the realization and its comparisons locally on `S` and glue,
without assuming a global dimension bound. The comparison `ω_{E(A)} ≅ H¹_dR(A/S)` (A4.2) and the
dual Lie sequence give the Hodge sequence; local freeness and base change come through the extension. The
connection is built from the two-step filtration of absolute forms for `A → S → Spec k` and its
connecting map; the triple filtration gives integrability and transversality. No `p`-adic comparison
is used. The API is `AbelianH1dR.mk`, `AbelianH1dR.hodgeSequence`, `AbelianH1dR.baseChange`,
`AbelianH1dR.pullback` (contravariant in homomorphisms), `AbelianH1dR.connection` (on smooth `S/k`,
with horizontal pullbacks) and `AbelianH1dR.dualPairing` (perfect between `A` and `A^∨`; the
self-pairing `⟨λ^*x, y⟩` of `λ` on `H¹_dR(A^∨/S)` is perfect only when `deg λ` is invertible). *Needs:* A1.3, A2.2, A4.2;
SchemeAndStackFoundations Layer 3; AlgebraicModuli Layer 7.

**Checks.**

- `AbelianH1dR.elliptic`: for an elliptic curve `H¹_dR` has rank two and `Fil¹` rank one.
- `AbelianH1dR.zero`: dimension zero gives the zero bundle and zero connection.
- `AbelianH1dR.inseparable`: in characteristic `p`, `[p]^*` acts by zero on `H¹_dR` although `[p]` is an
  isogeny of nonzero degree.
- For `S = ⨿_{n≥1} Spec ℂ` and `A|_{S_n} = E^n`, the de Rham complex has nonzero degree-`n`
  forms on component `n`, so it is locally bounded but has no global upper bound.
- `AbelianH1dR.product`: `H¹_dR(A × B) ≅ H¹_dR(A) ⊕ H¹_dR(B)` with both filtrations and connections.
- `AbelianH1dR.polarization_degree`: in characteristic `p`, on a positive-dimensional principally
  polarized `A`, the polarization `λ = [p] ∘ λ₀` has `λ^* = λ₀^* ∘ [p]^* = 0`, so its self-pairing
  `⟨λ^*x, y⟩` on `H¹_dR(A^∨/S)` is zero and not perfect. The complementary isogeny `λ₀^{-1}`, with
  `λ₀^{-1} ∘ λ = [p]`, would instead give the perfect pairing of `λ₀`; that normalization is not the
  one used.

### A4.4 The exterior structure of cohomology

Prove `exteriorCohomology`. (1) For every abelian scheme `π : A → S`, the sheaves `R^iπ_*Ω^j_{A/S}` and
`H^n_dR(A/S)` are finite locally free and commute with arbitrary base change; cup product gives
`R^iπ_*Ω^j ≅ ∧^i R¹π_*O_A ⊗ ∧^j π_*Ω¹` and `H^n_dR ≅ ∧^n H¹_dR`, compatibly with products and pullbacks;
the Hodge-to-de Rham spectral sequence degenerates. Exterior means that squares of degree-one classes
vanish, also in characteristic `2`. (2) For `A` of dimension `g` over an algebraically closed field
`k`, `ℓ` invertible in `k` and every `r ≥ 1`, pushing out the connected `A[ℓ^r](k)`-torsor
`[ℓ^r] : A → A` gives `Hom(A[ℓ^r](k), ℤ/ℓ^r) ≅ H¹_et(A, ℤ/ℓ^r)`, and cup product gives
`∧^n H¹_et(A, ℤ/ℓ^r) ≅ H^n_et(A, ℤ/ℓ^r)`, free over `ℤ/ℓ^r` of rank `C(2g, n)`, compatibly with
reduction from `r + 1` to `r`. In the limit `H*_et(A, ℤ_ℓ) ≅ ∧* H¹_et(A, ℤ_ℓ)` with
`H¹_et ≅ Hom_{ℤ_ℓ}(T_ℓ A, ℤ_ℓ)`, torsion-free of ranks `C(2g, n)`. The case `r = 1` is the `𝔽_ℓ`
statement, and in characteristic zero every prime `ℓ` is allowed.

Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleKunneth`.
Apply ordinary derived étale Künneth over algebraically closed `k` to the constant finite-Tor
coefficients `ℤ/ℓ^r`, with `ℓ` invertible, retaining cup-product, pullback, base-change and
coefficient-reduction compatibility. Supplied by EtaleCohomologyFoundations §F.4 /
`VanishingCycles.classicalAdicRealization`, `VanishingCycles.adicFiniteness`.
The normalized constant tower on proper `A` satisfies uniform bounds and finite-level
finiteness, giving the derived integral limit and reductions at every level; a compact-support
formula alone does not supply the ordinary Künneth input.

The coherent part uses the Hopf structure from the group law and the universal vector extension:
universal ranks and filtered
exterior compatibility are established before base change. The étale part is an abelian-specific
computation on geometric inputs in every characteristic: Supplied by
EtaleCohomologyFoundations §F.3 / `VanishingCycles.etaleCohomologicalDimension`,
`VanishingCycles.etaleFiniteness`.
These give vanishing above degree `2g` and finite cohomology on proper `A/k` for invertible
`ℓ`, while the ordinary Künneth and integral-realization contracts just cited supply the
addition-map coproduct and the derived finite-level limit with reductions.
Over `𝔽_ℓ` the torsor `[ℓ]` gives
`dim H¹ ≥ 2g`; a bounded connected graded-commutative Hopf algebra vanishing above degree `2g` has
`dim H¹ ≤ 2g`, with equality only for the exterior algebra on `H¹`, degree-one squares zero also for
`ℓ = 2`; the coefficient sequences `0 → ℤ/ℓ → ℤ/ℓ^{r+1} → ℤ/ℓ^r → 0`, whose reductions on `H¹` are
surjective, then give freeness at every level by induction on `r`, and the limit has surjective
transitions (Milne 2022, Theorem 15.1, Lemma 15.2 and Remark 15.4, pp. 27–28;
Farb–Kisin–Wolfson, *Essential dimension via prismatic cohomology*, Corollary 2.3.5, pp. 17–18,
and Lemma 3.2.2, p. 24, arXiv v2, for the
characteristic-zero mod-`p` input; Anschütz–Le Bras, Proposition 4.5.1 and its proof, p. 53, for the
de Rham statement over a bounded prism, where the proof refers to Berthelot–Breen–Messing). The
coherent statement over an arbitrary base (local freeness, universal base change, degeneration and
square-zero multiplication in characteristic `2`) and the finite-level form of (2) for `r ≥ 2` are
not proved in the cited sources and are part of this target. For `g = 2` the de Rham ranks are
`1, 4, 6, 4, 1`; graded skew-symmetry alone does not give vanishing of degree-one squares in
characteristic `2`. *Needs:* A3.2, A4.1, A4.2, A4.3; EnhancedDerivedSheaves E1.9
(`perfect_proper_pushforward`); ComplexComparisonPartII C5.1;
Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`; §F.2 /
`VanishingCycles.etaleKunneth`; §F.4 / `VanishingCycles.classicalAdicRealization`,
`VanishingCycles.adicFiniteness`.
The étale inputs use proper `A` over algebraically closed `k`, invertible `ℓ` and the whole
constant tower with coherent derived reductions and uniform bounds.

### A4.5 Barsotti–Tate groups

Define `BarsottiTate S p h`: a `p`-divisible group of height `h` over a scheme `S` is an inductive
system `G = (G_r)_{r ≥ 0}` of finite locally free commutative group schemes with `rk G_r = p^{rh}`
and exact sequences `0 → G_r → G_{r+s} → G_s → 0` in which the first map is the inclusion and the
second is `[p^r]`. Its Tate sheaf is not its group of geometric `p`-power points in characteristic
`p`. The API is `BarsottiTate.ofAbelian` (`A[p^∞] = (A[p^r])_r`, of height `2g`; ModularCurves 7E PD-1
is the elliptic case), `BarsottiTate.truncation` (`G[p^r] = G_r`, of rank `p^{rh}`),
`BarsottiTate.dual` (Cartier duals of the levels with transposed maps, and biduality),
`BarsottiTate.baseChange`, and `BarsottiTate.connectedEtale` (over a perfect field, or a complete
henselian local base whose connected parts are finite flat at every level, the connected–étale
sequence of ModularCurves 7E PD-2 applied levelwise; not asserted over arbitrary bases) (Katz,
*Serre–Tate local moduli*, §§1.1–1.2, pp. 139–146; Faltings–Chai I.3, pp. 14–15). The general theory
of `p`-divisible groups beyond the interfaces of A4.5–A4.5a belongs to FiniteFlatGroupsAndIntegralPadicHodgeTheory,
which imports it. *Needs:* A3.2, A3.5; ModularCurves 0B, 7E.

**Checks.**

- `BarsottiTate.ordinary_elliptic`: for an ordinary elliptic curve over `K̄`,
  `E[p^∞] ≅ μ_{p^∞} × ℚ_p/ℤ_p`, of height two with étale height one.
- `BarsottiTate.supersingular`: a supersingular elliptic curve gives a connected group of height two
  with no nonzero étale part.
- `BarsottiTate.zero`: dimension zero gives height zero and trivial levels.
- `BarsottiTate.finite_dual`: the dual of `μ_{p^r}` is `ℤ/p^r`, agreeing with Cartier duality of
  ModularCurves 0B.

### A4.5a Truncated Barsotti–Tate groups

Define `TruncatedBT S p n` for a scheme `S`, a prime `p` and `n ≥ 1`. Its objects are finite
locally free commutative group schemes `G/S` killed by `p^n`, flat as fppf sheaves of
`ℤ/p^n`-modules: `im[p^{n−i}] = ker[p^i]` for `0 ≤ i ≤ n`. At `n = 1` also require exactness of
`G₀ →F G₀^{(p)} →V G₀` over `S₀ = V(p)`. Use relative scheme Frobenius, upgraded by naturality
to a group homomorphism, and define Verschiebung by Cartier dualizing Frobenius of the dual;
prove their base-change laws and `VF = [p] = FV`. Morphisms are group homomorphisms.
The locally constant height `h = TruncatedBT.height G` is determined by `rk G[p] = p^h`, and
`rk G = p^{nh}`. Provide `TruncatedBT.baseChange`, effective fppf descent,
`TruncatedBT.cartierDual` with biduality, and `TruncatedBT.restrict` to `G[p^m]` for
`1 ≤ m ≤ n`, preserving height. Upgrade `BarsottiTate.truncation` of A4.5 to this carrier,
compatibly with base change, restriction and Cartier duality (Anschütz–Le Bras, §4.6,
paragraph after Proposition 4.6.2 and facts (1)–(3), pp. 58–59, recalling Illusie 1985,
Définition 1.1 and §§1.3(e)–(f), 1.6; Stix, §8.5.2, pp. 45–47, especially Proposition 51,
for the finite-group Frobenius and Verschiebung and their agreement with the flat-affine construction).

This is the shared input carrier for A4.12 and for
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.10. A4.5a owns the carrier, height, base change,
descent, Cartier duality, restriction and full-tower truncation, together with the canonical
Frobenius and Verschiebung of finite locally free commutative groups in characteristic `p`.
That roadmap extends this API by exact-sequence recognition in R07.1.10, coLie recognition in
R07.1.11, classification in R07.2, and generic stack and truncation smoothness in R07.2.23.
Its broader flat-affine Frobenius and Verschiebung of R07.1.1 agree with these canonical maps
on finite locally free groups, including naturality, base change and `VF = [p] = FV`.
A4.12 owns compatible mixed-characteristic polarized tower lifting with a prescribed
level-one group; its construction uses A4.CR.7.2's deformation theory.
*Needs:* A4.5; ModularCurves 0B, 0E; SchemeAndStackFoundations §0.29
(`SchemeFrobenius.relativeFrobenius`, `SchemeFrobenius.schemeFrobeniusTwist`).

**Checks.**

- `μ_{p^n}` and `(ℤ/p^n)_S` have height one and are Cartier dual; restriction to level `m`
  gives `μ_{p^m}` and `(ℤ/p^m)_S`.
- Over `𝔽_p`, `α_p` has `F = V = 0`, so `im F = 0` and `ker V = α_p`; it is excluded at level one.
- On `μ_p` over `𝔽_p`, `F = 0` and `V` is an isomorphism; on `ℤ/p`, `F` is an isomorphism and
  `V = 0`. Cartier duality exchanges these finite-group maps.
- `(ℤ/p ⊕ ℤ/p²)_S` over a field is killed by `p²` but fails the level-two flatness condition:
  `ker[p]` has order `p²` and `im[p]` has order `p`.
- For an elliptic curve `E/S`, `E[p^n]` has height two and rank `p^{2n}` and is the truncation
  of A4.5's tower, with the Cartier duality of ModularCurves 2E.

### A4.6 The degree-one divided-power realization

Define `AbelianPD`: for a divided-power thickening `S₀ → S` in which `p` is locally nilpotent, with
quasi-coherent ideal `J` and divided powers that are locally nilpotent, and an abelian scheme `A₀/S₀`
of relative dimension `g`, a functorial locally free `O_S`-module `D(A₀)_S` of rank `2g`. For every
abelian scheme `A/S` lifting `A₀` it is identified with `H¹_dR(A/S)`, the Hodge subbundle being a
rank-`g` direct summand; the evaluation is independent of the lift and compatible with morphisms,
pullback of divided-power thickenings and duality. Over a perfect field `k` of odd characteristic `p`
the canonical divided powers of `pW_n(k)` are nilpotent, so the evaluations at `W_n(k) → k` form a
compatible system whose limit `D(A₀)_{W(k)}` is a free `W(k)`-module of rank `2g`, contravariant in
`A₀` (`AbelianPD.witt`). At `p = 2` the canonical divided powers of `2W_n(k)`, `n ≥ 2`, are not locally
nilpotent, so these thickenings lie outside the domain and this interface supplies no
`W(k)`-realization. The crystalline Dieudonné crystal `D(A₀[p^∞])` of A4.CR.7.2,
defined on all divided-power thickenings and compared there with this evaluation on the locally
nilpotent ones, supplies the `W(k)`-module for every `p`. No general crystalline site or Dieudonné equivalence is asserted
(Faltings–Chai I.3, pp. 14–15, the Grothendieck–Messing discussion, which requires local nilpotence of
the divided powers and not only nilpotence of `J`). The construction uses universal vector extensions
and the divided-power invariance of their first cohomology, compares two lifts on a common
divided-power enlargement, proves the cocycle condition and descends; the source refers to Messing for
this construction, and its proof is part of this target. The API is `AbelianPD.evaluate`,
`AbelianPD.liftComparison` (identification with `H¹_dR` of a lift), `AbelianPD.pullback`,
`AbelianPD.dual` and `AbelianPD.witt`. *Needs:* A4.2, A4.3, A4.5; Mathlib `DividedPowers`.

**Checks.**

- `AbelianPD.identity`: for `J = 0` the evaluation is `H¹_dR(A₀/S₀)` with its Hodge summand.
- `AbelianPD.elliptic_ranks`: for an elliptic special fibre `D` has rank `2` and a lift has a rank-one
  Hodge summand.
- `AbelianPD.pd_boundary`: a nilpotent ideal whose divided powers are not locally nilpotent is outside
  the theorem; nilpotence of `J` alone does not give the lifting equivalence of A4.7.
- `AbelianPD.dyadic_witt`: for the canonical divided powers on `(2) ⊂ ℤ/4ℤ`, induced from `ℤ₂`,
  `γ_{2^r}(2) = 2^{2^r}/(2^r)!` has `2`-adic valuation `1` for every `r`, so it is `2 mod 4`: the
  ideal is square-zero but its divided powers are not locally nilpotent, and the thickening is
  outside the domain. For odd `p`, on `(p) ⊂ ℤ/p²ℤ` every `γ_m` with `m ≥ 2` vanishes, and the
  thickening is inside it.

### A4.7 Grothendieck–Messing for abelian schemes

Prove `grothendieckMessing`. Under the hypotheses of A4.6, lifts of `A₀/S₀` to `S` are equivalent to
lifts of the Hodge filtration to rank-`g` locally direct summands of `D(A₀)_S`. A morphism lifts exactly
when its contravariant evaluation preserves the lifted summands. For a principal polarization the
perfect alternating pairing identifies polarized lifts with Lagrangian lifts of the Hodge filtration.
For a general polarization the condition is the morphism condition `D(λ₀)(Fil¹(A^∨)) ⊆ Fil¹(A)` with the
dual filtration identified; no perfect self-pairing is assumed when the degree is not invertible, and
the lifted symmetric homomorphism is a polarization by the fibrewise ampleness condition. Extra
endomorphisms impose simultaneous stability. The proof establishes the lifting equivalence of
universal vector extensions with filtrations and identifies Hom through it; the polarization
biextension translates duality into isotropy (Faltings–Chai I.3, pp. 14–15, which states the
unpolarized criterion and the principally polarized isotropy criterion; the general morphism form is
the same criterion applied to `λ₀`, and the categorical proof is part of this target, as in A4.6).
Unpolarized lifts have tangent rank `g²` and principally polarized ones `g(g + 1)/2`; for `g = 1` the
filtration lifts inside a rank-two module and extra endomorphisms impose equations. *Needs:* A2.5,
A4.2, A4.6.

### A4.CR.7.2 Crystalline Dieudonné theory

FiniteFlatGroupsAndIntegralPadicHodgeTheory consumes the three targets in this section: the
crystalline Dieudonné crystal, its variance and Tate twists, and Grothendieck–Messing deformation
theory. Their public namespace is `TauCetiRoadmap.CrystallineCohomology`; their mathematical owner
is this section. The consumer's Dieudonné–Manin decomposition and relative crystalline direct
images remain separate constructions of CrystallineCohomology §§CR.4.7 and CR.7.3, respectively.

**The crystalline Dieudonné crystal of a Barsotti–Tate group.** Let `p` be a prime, `S` a scheme
on which `p` is locally nilpotent, and `G` a Barsotti–Tate (`p`-divisible) group over `S` (A4.5). Its
contravariant crystalline Dieudonné crystal is `D(G) = 𝓔xt¹(G, O_{S/ℤ_p})` on the big crystalline site
of `S` over `(ℤ_p, (p), γ)`, using the base-compatible fppf site
`Crystalline.CrisCompatibleFppfSite` of *Small and big crystalline sites*
(CrystallineCohomology Layer CR.1), and with `G_crys(U,T) = G(U)`. In characteristic `p` this is
`CRIS_fppf(S/ℤ_p)`. Construct `D`, contravariant in `G` and
compatible with base change `S′ → S`; prove that `D(G)` is a crystal of finite locally free modules of
rank the height of `G`. When `S` has characteristic `p`, its relative Frobenius and
Verschiebung induce `F : σ*D(G) → D(G)` and `V : D(G) → σ*D(G)` with `FV = VF = p`;
here `σ` is the absolute Frobenius of `S`. On a general `p`-nilpotent base use
`D(G)` and its Hodge filtration without presupposing an absolute Frobenius of `S`. Its evaluation
`D(G)_T` on a PD thickening `T` of an open of `S` is a finite locally free `O_T`-module, with horizontal
`F` and `V` in the characteristic-`p` case and base-change isomorphisms for morphisms of thickenings.
A homomorphism `G → H` induces `D(H) → D(G)`. For
an abelian scheme `A/S`, `D(A[p^∞])` is identified with the realization of
A4.6 on its stated locally PD-nilpotent thickenings, with the first de Rham cohomology of any
abelian-scheme lift on those thickenings.

The API:

- `LogCrystalline.dieudonneEvaluation.evaluate`: `D(G)_T` is a finite locally free `O_T`-module.
- `LogCrystalline.dieudonneEvaluation.contravariant`: A map `G → H` gives a map `D(H)_T → D(G)_T`.
- `LogCrystalline.dieudonneEvaluation.fv`: The linearizations satisfy `FV = p` and `VF = p` on their
  respective domains.

*Proof sketch.* Construct `D(G)` as internal `𝓔xt¹` in the big fppf crystalline topos
(CrystallineCohomology Layer CR.1), and restrict the resulting crystal to the small Zariski
or étale site; local freeness of rank `h` is Berthelot–Breen–Messing 3.3.10, proved by reducing to truncated Barsotti–Tate
groups and the exact sequences `0 → G[pⁿ] → G → G → 0`. Apply the general coefficient evaluation maps
of CrystallineCohomology §CR.7.1 (*Finite projective crystalline coefficients*) and transport `F`
and `V` through the PD pullback isomorphisms. Check `FV` and `VF` on the appropriately Frobenius-twisted modules, and compare with A4.6
for abelian schemes through the universal vector extension. ([de Jong, *Crystalline Dieudonné module
theory via formal and rigid geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf),
Definition 2.3.2 and construction 2.3.3, pp.21–22; Berthelot–Breen–Messing, *Théorie de Dieudonné
cristalline II*, Lecture Notes in Math. 930 (1982), 3.3.6 and 3.3.10 as cited in de Jong §2.3.3;
[Panny–Robert–Sferlazza, *Hensel-lifting black-box algorithms and fast trace computation
for elliptic-curve endomorphisms*](https://www.math.u-bordeaux.fr/~damienrobert/pro/publications/articles/lifting_traces.pdf),
Appendix B, printed pp.35–36 in the 28 September 2026 author version: the Ext
construction over a `p`-nilpotent base, citing BBM Theorem 3.3.3; the Hodge
sequence, citing BBM Corollary 3.3.5; and the abelian realization, citing BBM
Theorem 2.5.6 and Proposition 3.3.7. The fppf topology is explicit in
[Madapusi–Mondal, *Perfect F-gauges and finite flat group schemes*](https://www.keerthimadapusi.com/assets/preprints/fflat.pdf), Remark 4.3.3, pp.13–14.)
*Needs:* CrystallineCohomology §CR.7.1 (*Finite projective crystalline coefficients*;
*Filtered Frobenius coefficients on semistable models*); A4.5 (*Barsotti–Tate groups*);
A4.6 (*The degree-one divided-power realization*); CrystallineCohomology Layer CR.1
(*Quasi-coherent and finite locally free crystals*).

**Checks.**

- `constant`: `D(ℚ_p/ℤ_p)` over `W(k)` has rank one and `F = σ`.
- `multiplicative`: `D(μ_{p∞})` over `W(k)` has rank one and `F = pσ`.
- `variance`: For `G → H` the induced crystal map runs from `D(H)` to `D(G)`, not from `D(G)` to `D(H)`.
- Evaluation over `W(k)` for perfect `k` gives the classical contravariant Dieudonné module: `W(k)`-free
  of rank `h` with `σ`-linear `F` and `σ⁻¹`-linear `V`, `FV = VF = p`.

**Dieudonné variance and Tate twists.** Over a perfect field `k` of characteristic `p`, the
evaluated contravariant crystal takes the following values: `D(ℚ_p/ℤ_p) = W(k)e` with `Fe = e`, `Ve = pe` (semilinearity understood), and
`D(μ_{p∞}) = W(k)e` with `Fe = pe`, `Ve = e`. Rationally the latter is `K₀(−1)` under `φ_{D(r)} = p^{−r}φ_D`, while
the constant group gives `K₀(0)`. Cartier duality agrees with `D(G∨) ≅ D(G)∨(−1)`. Verify the horizontal
evaluation maps and variance, not only the slopes.

*Proof sketch.* Evaluate *The crystalline Dieudonné crystal of a Barsotti–Tate group* at the Witt PD
thickening `W(k) → k` and compute it for `ℚ_p/ℤ_p` (`F` bijective) and `μ_{p^∞}` (`V` bijective). Check
Frobenius/Verschiebung and the contravariant group-map direction. Apply Cartier duality and the
declared twist convention to identify the rank-one rational modules. ([de Jong, *Crystalline
Dieudonné module theory via formal and rigid
geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf), §2.3.2–2.3.3, pp.21–22,
contravariant crystal convention;
[Scholze–Weinstein, *Berkeley lectures on p-adic geometry*](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf),
Lecture 12, printed p.99, footnote 1 in the March 2020 version: their covariant
normalization is the naive dual of the contravariant one. Dualizing its
Frobenius `σ` for `ℚ_p/ℤ_p` and `p⁻¹σ` for `μ_{p∞}` gives exactly `σ` and `pσ` here.
[Illusie, *Grothendieck and the theory of crystals*](https://www.imo.universite-paris-saclay.fr/~luc.illusie/Illusie-Pisa5.pdf),
§2.2, pp.3–5, fixes contravariance, `FV = VF = p` and Cartier duality.)
*Needs:* A4.CR.7.2 (*The crystalline Dieudonné crystal of a Barsotti–Tate group*);
CrystallineCohomology §CR.7.1 (*Filtered Frobenius coefficients on semistable models*).

**Checks.**

- For the constant group `ℚ_p/ℤ_p`, the Witt evaluation has `F = σ` and `V = pσ⁻¹`, and its
  rationalization has slope 0 and twist 0.
- For `μ_{p^∞}`, the Witt evaluation has `F = pσ` and `V = σ⁻¹`, hence slope 1. The twist
  convention makes its rational Dieudonné module `K₀(−1)`, with its filtration jump in degree 1.
- Cartier duality exchanges these two groups and identifies `D(G∨)` with `D(G)∨(−1)`;
  double duality returns the original evaluation and cancels the two dual twist factors.
- A group homomorphism `G → H` induces the horizontal evaluation map `D(H) → D(G)`,
  compatibly with `F`, `V` and every Witt-level reduction.

**Grothendieck–Messing deformation theory.** Let `S₀ → S` be a PD thickening on which `p` is locally
nilpotent and whose divided powers are locally nilpotent, and `G₀` a Barsotti–Tate group over `S₀`. A
lift `G/S` of `G₀` determines a locally direct summand Hodge filtration `ω_G ⊂ D(G₀)_S` lifting the
contravariant exact sequence `0 → ω_{G₀} → D(G₀)_{S₀} → Lie(G₀^∨) → 0`. Grothendieck–Messing:
`G ↦ (ω_G ⊂ D(G₀)_S)` is an equivalence between lifts of `G₀` to `S` and lifts of the Hodge filtration to locally
direct summands of `D(G₀)_S`; a homomorphism of Barsotti–Tate groups over `S₀` lifts exactly when its
evaluation preserves the lifted filtrations. For abelian schemes this specialises to
A4.7 under the identification of *The crystalline Dieudonné
crystal of a Barsotti–Tate group*.

*Proof sketch.* Construct the Hodge filtration from the universal vector extension of `G` and identify
the dual of its Lie algebra with the contravariant `D(G₀)_S`;
`Lie E(G)` itself is the covariant realization. Dualize the universal-extension
exact sequence to obtain `0 → ω_G → D(G₀)_S → Lie(G∨) → 0`. For an abelian scheme
this agrees with `Lie E(A) = H¹_dR(A/S)∨` (Illusie §4.2(iv), pp.16–17). Prove the deformation theorem by the exponential on the
nilpotent divided power ideal: lifts of `G₀` correspond to lifts of the universal extension, and these
to filtrations (Messing, Chapter V). Transport the evaluation and Hodge inclusion through the
crystalline coefficients, and verify base change and duality compatibility of the inclusion and
quotient maps. ([de Jong, *Crystalline Dieudonné module theory via formal and rigid
geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf), §3.1, pp.28–32; Proposition
3.2.1 and proof, pp.32–34, using the Messing deformation theorem; Messing, *The crystals associated
to Barsotti–Tate groups*, Lecture Notes in Math. 264 (1972), Chapter V, Theorem 1.6,
as stated with the admissibility condition of Definition V.1.4 in
Panny–Robert–Sferlazza, Appendix B, p.35, and used in de Jong's proof;
Illusie, *Grothendieck and the theory of crystals*, §4.2(v), pp.17–18,
for the `p`-nilpotent base and locally nilpotent divided-power hypotheses.)
*Needs:* A4.CR.7.2 (*The crystalline Dieudonné crystal of a Barsotti–Tate group*);
A4.7 (*Grothendieck–Messing for abelian schemes*).

**Checks.**

- For the constant group `ℚ_p/ℤ_p` the Hodge submodule is zero, so there is a unique
  filtration lift and a unique lift up to unique isomorphism.
- For `μ_{p^∞}` the Hodge submodule is the full rank-one evaluation; the lifted group
  has the full evaluation as its Hodge submodule, compatibly with Cartier duality.
- For an ordinary elliptic special fibre the rank-two evaluation has a rank-one Hodge
  summand. Over a square-zero PD extension, its summand lifts have one tangent parameter,
  agreeing with A4.7, and a homomorphism lifts exactly when its contravariant map preserves it.
- Pullback along a compatible locally PD-nilpotent thickening transports the lift,
  Hodge inclusion and quotient together; the filtration equivalence commutes with this pullback.
- The canonical divided powers on `(2) ⊂ ℤ/4ℤ` are not locally nilpotent (A4.6's dyadic
  Check), so a square-zero ideal alone does not meet the deformation theorem's hypotheses.

### A4.7a Realizations of the Serre tensor

<a id="relativeSerreTensor-lie-tate"></a>

**Lie, Tate, de Rham and crystalline comparisons** (`relativeSerreTensor-lie-tate`). For an
abelian scheme `A/S`, a unital action of an associative ring `R`, and a finite projective right
`R`-module `M`, put `B = M ⊗_R A` as in A1.3a. Prove the natural isomorphism of `O_S`-modules
`Lie(B/S) ≅ M ⊗_R Lie(A/S)`, where the left `R`-action on `Lie(A/S)` is differentiated from
the action on `A` and commutes with `O_S`. For a prime `ℓ` invertible on `S`, prove
`T_ℓ B ≅ M ⊗_R T_ℓ A` as lisse `ℤ_ℓ`-sheaves, with the `R`-action induced at every torsion
level. Retain the comparisons `B[ℓʳ] ≅ M ⊗_R A[ℓʳ]` and all transition maps. The tensor on
the right is already a direct summand of a finite power of `T_ℓ A`; it requires no additional
completion. Over a field these isomorphisms are Galois equivariant.

For the contravariant degree-one realizations, give the corresponding right `R`-action by
`x · r = r* x`, with `r*` denoting pullback. Prove the isomorphism
`H¹_dR(B/S) ≅ Hom_{Rᵒᵖ}(M, H¹_dR(A/S))` of `O_S`-module sheaves, respecting the Hodge
filtration and, when `S` is smooth over a field, the Gauss–Manin connection. Here Hom means the
sheaf of homomorphisms of right `R`-modules from the constant module `M`. Equivalently the
dual, covariant realization satisfies `H₁,dR(B/S) ≅ M ⊗_R H₁,dR(A/S)`. For a prime `p`
locally nilpotent on `S`, prove `B[p^∞] ≅ M ⊗_R A[p^∞]` level by level and
`D(B[p^∞]) ≅ Hom_{Rᵒᵖ}(M, D(A[p^∞]))` as finite locally free crystals on the site of
A4.CR.7.2. Retain evaluation and PD pullback, the Hodge filtration on the locally PD-nilpotent
thickenings of A4.6, and `F, V` when `S` has characteristic `p`. All comparisons are natural
in module maps and `R`-linear homomorphisms and commute with arbitrary base change within their
stated domains. Contravariant comparisons reverse these maps; no polarization or Tate twist is
inserted to change their variance.

Apply each additive realization to the split projector defining `B`. Covariant realizations
give its tensor summand; contravariant ones give the Hom summand. This deduces the comparisons
from Conrad, §7, the splitting proof of Theorem 7.2, pp. 101–102, and the realization theories of
A1.3, A4.1–A4.3 and A4.CR.7.2 with their source locators. *Needs:* A1.3, A1.3a;
A4.1–A4.3 for the Tate and de Rham comparisons; A4.5–A4.6 and A4.CR.7.2 for the crystalline
comparison, with CrystallineCohomology CR.1 and CR.7.1 supplying its site and coefficient calculus.

**Checks.**

- For `M = R`, every comparison is the identity realization comparison of `A`; for `M = 0`,
  every realization is zero.
- For `M = Rⁿ`, Lie and Tate modules are the direct sums of `n` copies, as are degree-one
  de Rham cohomology and the Dieudonné crystal, with their filtrations and operators.
- For `R = ℤ` and the module map `ℤ → ℤ²`, `1 ↦ (1, 2)`, the induced morphism is
  `A → A²`, `a ↦ (a, [2]a)`. Its de Rham pullback sends `(x, y)` to `x + 2y`, testing the
  transpose and the contravariant Hom formula.
- For a supersingular elliptic curve over an algebraically closed field of characteristic
  `p`, the geometric-point `p`-adic Tate module is zero. The lisse rank-two comparison is
  restricted to `ℓ ≠ p`; the characteristic-`p` realization uses the height-two crystal.
- Finite projectivity is essential: for `R = ℤ`, `M = ℤ/p` and a positive-dimensional
  abelian variety in characteristic `p`, the fppf tensor sheaf `M ⊗_ℤ A` is zero since `[p]`
  is fppf surjective, whereas `M ⊗_ℤ Lie(A) = Lie(A)` is nonzero.

### A4.8 Effectivity of polarized formal lifts

Prove `polarizedEffectivity`. Over a complete Noetherian local ring `R` with maximal ideal `m`, a
compatible system of polarized abelian schemes over the `R/m^n`, together with a compatible relatively
ample line bundle after a finite faithfully flat extension when needed, is the formal completion of a
unique polarized abelian scheme over `R`. Morphisms and finite flat subgroups algebraize uniquely; the
descended polarization needs no global line bundle on `Spec R`. The proof constructs a projective scheme from the compatible ample system in arbitrary
dimension (`polarizedFormalAlgebraization`): over an ideal-adically complete Noetherian
ring, a cartesian system of proper schemes with compatible invertible sheaves ample on
the initial fibre is algebraized by a proper scheme and an ample invertible sheaf.
This construction is part of this target ([Stacks, Theorem 30.28.4, tag 089A](https://stacks.math.columbia.edu/tag/089A)).
It uses the coherent existence and morphism theorems of SchemeAndStackFoundations §4.10,
algebraizes morphisms by formal full faithfulness, descends along the faithfully flat cover, and algebraizes
finite kernels as finite modules; the polarization is checked on the special fibre (Faltings–Chai I.3,
pp. 14–15; Boxer–Calegari–Gee–Pilloni, proof of Lemma 9.3.4, p. 202, where effectivity is a separate
step after Serre–Tate). Formal lifts of the Barsotti–Tate group alone do not give an abelian scheme
without this step. *Needs:* A2.1, A2.6; SchemeAndStackFoundations Layer 4 §4.10 (`grothendieck_existence`, `algebraize_hom`);
AlgebraicModuli Layer 7 (`properSpaceCompletionEquivalence`).

### A4.9 The Serre–Tate equivalence with structures

Prove `serreTate`. Let `R` be a ring in which `p` is nilpotent, `I ⊆ R` a nilpotent ideal and
`R₀ = R/I`. The functor `A ↦ (A_{R₀}, A[p^∞], can)` is an equivalence between abelian schemes over `R`
and triples `(A₀, G, ε)` of an abelian scheme over `R₀`, a Barsotti–Tate group over `R` and an
isomorphism `ε : G_{R₀} ≅ A₀[p^∞]`; morphisms are compatible pairs of homomorphisms. The equivalence
respects duality, polarizations (which must reduce to the given polarization of `A₀`) and prescribed
endomorphisms. It extends to Artin local `W(k)`-algebras, and to complete local Noetherian bases as an
equivalence of formal systems; algebraization is A4.8. The proof of full faithfulness uses Drinfeld's
argument: a large power `p^N` kills the nilpotent obstruction, and compatibility with the
Barsotti–Tate map recovers the unique lift. Essential surjectivity lifts `A₀` along successive small
extensions by A4.7, corrects the Barsotti–Tate group by a finite `p`-power kernel and recovers the
required lift as a quotient (A3.3); structures are transported by duality and the Hom criterion, and
positivity is checked on the special fibre (Katz, *Serre–Tate local moduli*, Theorem 1.2.1 and its
proof, pp. 143–146). ModularCurves 7F ST-1 is the elliptic case. An automorphism of the
Barsotti–Tate lift that is the identity on the special fibre comes from a unique automorphism of the
abelian scheme. *Needs:* A3.3, A3.4, A4.5, A4.7; ModularCurves 7F.

### A4.10 Ordinary Serre–Tate coordinates

Define `SerreTate.q`: for an ordinary abelian variety `A₀` over a perfect field `k` of characteristic
`p` (working over `k̄` with descent, or after trivializing the étale part of `A₀[p^∞]` and of its dual),
and a deformation `A` over a local Artin `W(k)`-algebra `R` with residue field `k`, the bilinear map
`q_A : T_p(A₀^{et}) × T_p((A₀^∨)^{et}) → 1 + m_R`
classifying `A[p^∞]` as an extension of the étale part by the multiplicative part. Deformations
correspond to such bilinear maps, with Baer sum corresponding to multiplication; `q = 1` is the
canonical lift. A homomorphism `f : A₀ → B₀` lifts iff `q_A(x, f^∨ y) = q_B(f x, y)`; a principal
polarization `λ₀` lifts iff `q(x, λ₀ y) = q(y, λ₀ x)`, which gives a formal torus of rank `g(g + 1)/2`
(the unpolarized rank is `g²`). Its character lattice is the symmetric quotient of the two rank-`g`
étale lattices, not the rank-`2g` prime-to-`p` Tate module (Katz, *Serre–Tate local moduli*,
Theorem 2.1, pp. 148–150). The construction classifies extensions of the unique lift of the étale
part by the unique lift of the multiplicative part with Kummer classes; the Hom criterion and Cartier
duality give the symmetry relation integrally, `p = 2` included; the coordinate-free form descends
over perfect `k` before a basis is chosen. The API is `SerreTate.q`, `SerreTate.fromPairing`,
`SerreTate.homCriterion`, `SerreTate.polarized` and `SerreTate.descent`. *Needs:* A4.9;
SchemeAndStackFoundations Layer 4 §4.8 (formal completion).

**Checks.**

- `SerreTate.elliptic_one`: an ordinary elliptic deformation has one parameter `q ∈ 1 + m_R`.
- `SerreTate.surface_three`: a principally polarized ordinary abelian surface has `q₁₂ = q₂₁` and
  three parameters, not four.
- `SerreTate.canonical`: `q = 1` is the split extension and the canonical lift.
- `SerreTate.supersingular`: a supersingular elliptic deformation is not classified by a rank-one
  étale `q`; the construction requires ordinarity.

### A4.11 Canonical Frobenius and weighted polarization equations

Prove `ordinaryFrobeniusWeighted`. The quotient of an ordinary deformation by its canonical
multiplicative `p`-torsion subgroup has parameter `q^p` after the Frobenius identifications of the
special fibre; the canonical lift has `q = 1`. For a symmetric homomorphism `λ₀ : A₀ → A₀^∨` on an ordinary special
fibre the lifting condition is `q(x, λ₀ y) = q(y, λ₀ x)`; in bases it is the integral weighted symmetry
equation for the matrix of `λ₀`, with no division by `p`. In genus two with paramodular polarization of
degree `p` this gives, in additive coordinates, the pattern `(X, pZ; Z, Y)` rather than an unrestricted
symmetric matrix. The proof applies the Hom criterion of A4.10 to Frobenius and Verschiebung (giving
`q ↦ q^p`) and to `λ₀`, which need not be invertible over `ℤ_p`, and distinguishes the multiplicative
`q`-equations from the additive tangent matrix (Katz, *Serre–Tate local moduli*, Lemma 4.1.2,
pp. 169–170; Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weight*, §7.1,
Lemmas 7.1.1–7.1.2, author PDF pp. 38–40). At `p = 2` principal symmetry still leaves three independent
parameters for a surface. *Needs:* A3.3, A4.10.

### A4.12 Polarized finite-level lifting at odd primes

Prove `oddPrimeLifting`. Let `p > 2`, `O` the ring of integers of a finite extension of `ℚ_p` with residue
field `k`, and `A₀` a principally polarized abelian surface over `k`. Let `G₁` over `O` be a
principally quasi-polarized object of `TruncatedBT (Spec O) p 1` (A4.5a), of height four and
order `p⁴`, together with a compatible identification `G_{1,k} ≅ A₀[p]`. Here a principal
quasi-polarization is a Cartier self-duality `λ₁` satisfying `λ₁^∨ = −λ₁`; the pairing is
strongly alternating since `p > 2`. Then there is a principally
polarized abelian scheme `A/O` lifting `A₀` with `A[p] ≅ G₁` compatibly with the given identifications.
The finite group has order `p⁴`, not rank four. The level-one truncated Barsotti–Tate structure and its
polarization compatibility are hypotheses; an arbitrary self-dual finite flat group killed by `p` is
not asserted to lift.

Prove `polarizedTruncationLifting` under these same hypotheses: there is a principally
quasi-polarized Barsotti–Tate group `H/O` with identifications `H_k ≅ A₀[p^∞]` and
`H[p] ≅ G₁`, preserving quasi-polarizations and agreeing over `k` at level one.
Thus the theorem extends the prescribed finite group over `O` and the prescribed full tower
over `k` simultaneously. Its compatible higher levels use A4.5a and the polarized
Grothendieck–Messing deformation theory of A4.CR.7.2. The proof of `oddPrimeLifting` applies
A4.9 to this tower at every nilpotent level and then A4.8
(Boxer–Calegari–Gee–Pilloni, Lemma 9.3.4 and its proof, pp. 200–202, which use Wedhorn's lifting
theorem (2.17) for the truncated group). The compatible polarized lifting assertion over `O` is
the target `polarizedTruncationLifting` here. The generic unpolarized stack smoothness and
truncation smoothness of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.23, and its
quasi-polarized level-one smoothness over `𝔽_p`, have that roadmap as their owner.
*Needs:* A4.5, A4.5a, A4.CR.7.2, A4.8, A4.9.

**Checks.**

- If `G₁ = A[p]` for an existing principally polarized abelian surface `A/O`, then
  `H = A[p^∞]` supplies both compatible identifications, including the prescribed polarization.
- For a product of ordinary elliptic curves over `O`, its product principal polarization gives
  height four and order `p⁴` at level one; the ordinary surface has three polarized
  Serre–Tate parameters, as in A4.10.
- At `p = 2`, `α₂` with pairing `1 + xy` is skew self-dual but not strongly alternating (A3.6).
  It lies outside this theorem; level-one smoothness over `𝔽_p` alone does not supply a
  compatible polarized tower over `O`.

### A4.13 Ordinary dyadic finite-level lifting

Prove `dyadicOrdinaryLifting`. Let `O` be the ring of integers of a finite extension of `ℚ₂`, with
residue field `k`, and `A₀/k` a principally polarized ordinary abelian surface. Let `G₁/O` be a finite
flat group scheme killed by `2`, of order `16`, with a Cartier self-duality `λ` satisfying `λ^∨ = −λ`, and
an identification `G_{1,k} ≅ A₀[2]`. Then there is a principally polarized lift `A/O` of `A₀` with
`A[2] ≅ G₁`. The conclusion identifies the underlying torsion; it does not assert that every
prescribed `λ` lifts as the chosen principal polarization, and strong alternation (A3.6) and skew
self-duality remain distinct. The proof works with extensions of the ordinary étale part by its
multiplicative dual, identifies polarized extension classes with the integral symmetric lattice of
A4.10 at `p = 2`, and lifts successively over `O/π^n` using the formal-torus presentation of
finite-level extension classes modulo squares with its Frobenius descent; A4.9 and A4.8 then give
`A` (Boxer–Calegari–Gee–Pilloni, Lemma 10.3.1, Remark 10.3.2 and the alternative proof,
pp. 215–218). The comparison of skew self-dual ordinary finite flat extensions with the symmetric
formal-torus quotient by squares, with Frobenius descent and formal smoothness over every `O/π^n`, is
not carried out in the source and is part of this target; no averaging by `2` is used. The example
`α₂` with the pairing `1 + xy` shows that a general characteristic-two alternating lifting statement
fails; the lifted object is identified with `A[2]`. *Needs:* A3.6, A4.8, A4.9, A4.10.

### A4.14 Lifting genus-two Jacobians

Prove `genusTwoJacobianLifting`. In the situation of A4.12, suppose `A₀ = Jac(C₀)` with its principal
polarization, for a smooth genus-two curve `C₀`. The map from marked deformations of `C₀` to marked
principally polarized deformations of `A₀` is an equivalence of formal deformation functors. Hence a
principally polarized lift of `A₀` with a given identification of the special fibre comes from a formal
lift of `C₀`, unique up to isomorphism compatible with the markings, and effective over `O`. Since `2` is
invertible, the dual tangent map `Sym²H⁰(C₀, ω) → H⁰(C₀, ω²)` is an isomorphism of three-dimensional
spaces. The proof compares the two smooth three-dimensional deformation functors and computes the
Torelli tangent map by multiplication of canonical differentials: for a hyperelliptic genus-two curve in
odd characteristic the three products of a basis of `H⁰(ω)` form a basis of `H⁰(ω²)`; the formal
inverse-function theorem identifies the functors. The compatible relative dualizing
bundles of the smooth genus-two curve system are relatively ample, so
`genusTwoFormalEffectivity` applies `polarizedFormalAlgebraization` of A4.8 to the
curve system and algebraizes its marking and Jacobian comparison through
SchemeAndStackFoundations §4.10 `algebraize_hom`
(Boxer–Calegari–Gee–Pilloni, Remark 9.3.5, p. 202). The curve must be smooth; a decomposable
polarized surface is not a genus-two Jacobian. *Needs:* A4.7, A4.8, A4.12; SchemeAndStackFoundations Layer 4 §4.10; StableReduction Layer 2
(relative Gorenstein-curve duality and dualizing bundles); JacobianChallenge Layer D.

### Examples

For `E` ordinary over `𝔽̄_p` and `R = W(𝔽̄_p)/p^n`, the deformations of `E` are `q ∈ 1 + pR`, the canonical
lift is `q = 1`, and the quotient by `μ_p` has parameter `q^p`. For `E` over `ℂ`, `H¹_dR(E)` has the
Hodge filtration `H⁰(Ω¹) ⊂ H¹_dR` of ranks `1 ⊂ 2`, and `T_ℓ E = H₁(E, ℤ) ⊗ ℤ_ℓ`. For an abelian surface the
ranks of `H^n_dR` are `1, 4, 6, 4, 1`.

### Dependencies

A0–A3; Tau Ceti `TateModule`; StableReduction Layer 2 (relative Gorenstein-curve duality and dualizing bundles); ModularCurves 0B, 7E, 7F; JacobianChallenge Layer D; AlgebraicVectorBundles
L0B, L2B; AlgebraicModuli Layer 7; EnhancedDerivedSheaves E1.9;
CrystallineCohomology CR.1, CR.7.1; SchemeAndStackFoundations Layers 1–4; ComplexComparisonPartII C5.1;
Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`; §F.2 /
`VanishingCycles.etaleKunneth`; §F.4 / `VanishingCycles.classicalAdicRealization`,
`VanishingCycles.adicFiniteness`; Mathlib `DividedPowers`.
A4.4 uses these geometric contracts on proper `A` over algebraically closed `k`, with
invertible `ℓ` and normalized constant coefficients at all finite levels.

<a id="a5"></a>

## Layer A5: Complex uniformization and families

This layer specializes ComplexTori's quotient and period-family constructions to polarized analytic
families and their algebraic comparisons. Algebraicity of a single polarized torus goes through the theta embedding, Chow's
theorem and proper GAGA, in that order. Analytic families correspond to variations of Hodge
structure; algebraization of an analytic family over an algebraic base is not asserted. The
homology and cohomology conventions, the sign of the polarizing form and the lattice duality are fixed
before the Siegel family is introduced.

### A5.1 Lattice uniformization

Define `AbelianLattice A` for an abelian variety `A` over `ℂ`: the tangent space `V = T₀(A^an)` at zero,
the lattice `Λ = ker(exp : V → A^an)` of rank `2g`, and the analytic isomorphism `V/Λ ≅ A^an`, where
`A^an` is the analytification of ComplexComparisonPartII C−1.1 `complexSchemeAnalytification`
and `V/Λ` is the compact complex Lie group on `AddAction.orbitRel.Quotient Λ V` supplied by
ComplexTori Milestone 1.
Here `Λ` has its subtype topology, `DiscreteTopology Λ` and `IsZLattice ℝ Λ`. `Λ` is identified
naturally with `H₁(A^an, ℤ)`, and `T_ℓ A` (A4.1) with `Λ ⊗ ℤ_ℓ`. A holomorphic
homomorphism `A^an → B^an` is exactly a complex-linear map `V → W` carrying `Λ` into the lattice of `B`,
and every holomorphic homomorphism is the analytification of a unique homomorphism of abelian varieties
(ComplexComparisonPartII `familyMorphismInterface`, part (3)). The construction shows that `A^an` is a
compact connected complex Lie group (the analytification of a smooth scheme is a complex manifold, and
the group law is holomorphic), uses Tau Ceti's Lie exponential `lieExp` with
`isLocalDiffeomorphAt_lieExp_zero` and shows that the exponential is a holomorphic surjective
homomorphism (connectedness) with discrete cocompact kernel (compactness). It proves the resulting
analytic isomorphism from the supplied orbit quotient to `A^an` and transports ComplexTori
Milestone 1's descended maps and natural `π₁` and `H₁` identifications through it (Stanford VIGRE
notes *Complex theory of abelian varieties*, Theorem 1.8 and §1.2, pp. 2–4). The lattice uses
Mathlib's `IsZLattice`; the quotient, manifold structure and generic map theory have one owner,
ComplexTori.

Transport ComplexTori Milestone 4, Integral connecting class, step 6's trivial-action torsion
equivalence along `V/Λ ≅ A^an` (Stanford VIGRE notes, §1.2, p. 3). For `n > 0`, its formula is
`Λ/nΛ ≃ (1/n)Λ/Λ`, `[λ] ↦ [λ/n]`; torsion means killed by `n`, not exact order `n`.
For `n = ℓ^r`, `AbelianLattice.tate` identifies analytic torsion with algebraic complex points
and proves compatibility with the transition maps `[ℓ]` on torsion and reduction on `Λ/ℓ^rΛ`,
then passes to the inverse limit to identify `T_ℓ A` with `Λ ⊗ ℤ_ℓ`.

The API is `AbelianLattice.ofAbelian`, `AbelianLattice.homology`,
`AbelianLattice.map` (differentiate a homomorphism; functorial) and `AbelianLattice.tate`. *Needs:*
A4.1; ComplexTori Milestone 1 and Milestone 4's trivial-action lattice-torsion formula;
Mathlib `IsZLattice`; Tau Ceti `lieExp`, `isLocalDiffeomorphAt_lieExp_zero`;
ComplexComparisonPartII C−1.1, C4.4.

**Checks.**

- `AbelianLattice.elliptic`: for `E = ℂ/(ℤ + τℤ)`, `Im τ > 0`, the lattice is `ℤ + τℤ ≅ ℤ²`, not a rank-one
  complex lattice.
- `AbelianLattice.zero`: dimension zero gives `V = 0` and `Λ = 0`.
- On the supplied orbit quotient, the isomorphism to `A^an` sends `[v]` to `exp(v)`;
  multiplication by two descends from `v ↦ 2v` and acts as `λ ↦ 2λ` on the transported homology.
- For `n = 1` the killed-by-`n` subgroup is zero; for `n = ℓ^r`, multiplication by `ℓ`
  on torus torsion corresponds to reduction of lattice classes modulo `ℓ^{r-1}`.
- `AbelianLattice.irrational_map`: multiplication by `√2` on `ℂ` does not preserve `ℤ + iℤ`, so it is not a
  homomorphism of `ℂ/(ℤ + iℤ)`.

### A5.2 Riemann forms

A Riemann form is Tau Ceti's `TauCeti.AlmostComplexStructure.IsRiemannForm J E`: for
an integral module `Λ` with an almost complex structure `J` on its realification `V = ℝ ⊗ Λ`, an
integral bilinear form `E` on `Λ` that is alternating, whose real extension is `J`-invariant
(`E(Jv, Jw) = E(v, w)`), and which is positive in the sense `E(Jv, v) > 0` for `v ≠ 0`. On a free `Λ`
these are exactly the forms polarizing Tau Ceti's effective weight-one structure
`latticeHodgeStructure` of `J`, whose Weil operator is `J` (`isRiemannForm_iff_isPolarization`,
`IsRiemannForm.polarization`). For a complex torus `V/Λ` it is applied with `Λ` the period lattice
(Mathlib `IsZLattice`) and `J` multiplication by `i`. This roadmap adds the following API on Tau
Ceti's predicate. The Hermitian form `RiemannForm.hermitian`, linear in the first variable, is
`H(v, w) = E(Jv, w) + i E(v, w)`, with `RiemannForm.im_hermitian` (`E = Im H`) and
`RiemannForm.hermitian_self_pos` (`H(v, v) = E(Jv, v) > 0` for `v ≠ 0`). The type of `E` is given by
its elementary divisors on `Λ` (A5.4). Principality is Mathlib's `LinearMap.IsPerfPair E`,
so the induced map `Λ → Hom(Λ, ℤ)` is an isomorphism; for an alternating form this also
makes the transpose map an isomorphism. `RiemannForm.scale`: a positive integer multiple of a Riemann
form is a Riemann form, and this does not preserve principality. `RiemannForm.pullback`: along an
injective complex-linear map carrying lattice into lattice. `RiemannForm.homological`: the
homological Hodge structure on `Λ = H₁` has weight `−1` and types `(−1, 0)`, `(0, −1)`, with
`H^{−1,0}` the `+i`-eigenspace of `J`; its Weil operator is `C = −J`, and the polarizing form in Tau
Ceti's sign convention `0 < Q(Cx, x)` is `Q = −E`, which satisfies `Q(Cv, v) = E(Jv, v) > 0`. This
differs from `latticeHodgeStructure`, which puts on the same lattice the weight-one structure with
Weil operator `J` and polarizing form `E`. `RiemannForm.hodgeDual` keeps four constructions on
`H¹ = Hom(Λ, ℤ)` apart. (i) The integral cohomological Hodge structure is the weight-one dual
`HodgeStructureOn.dual` of the homological one; it carries no form. (ii) The rational dual form is
`Q^∨(ξ, η) = Q(Q♭^{-1}ξ, Q♭^{-1}η)`, transported from `Q = −E` along `Q♭ : Λ_ℚ ≅ Hom(Λ, ℚ)`,
`x ↦ Q(x, ·)`; it polarizes the rational dual structure. (iii) When `E` is principal, `Q^∨` is integral
and unimodular on `H¹`, and the weight-one Riemann criterion
`isPolarization_of_weilOperator_invariant_on_realPoints_of_pos` applies to it. (iv) In general `Q^∨`
takes values in `(1/e)ℤ` for the exponent `e` of `Hom(Λ, ℤ)/Q♭(Λ)`, and the integral polarizing form
on `H¹` is `e · Q^∨`, to which the same criterion applies (Stanford VIGRE notes,
Definitions 1.13–1.14 and Lemma 1.16, pp. 5–6; Faltings–Chai I.6, pp. 29–30, for the Siegel cone).
*Needs:* A5.1; Mathlib `IsZLattice`, `LinearMap.IsPerfPair`; Tau Ceti `IsRiemannForm`,
`latticeHodgeStructure`, `isRiemannForm_iff_isPolarization`,
`AlmostComplexStructure`, `TauCeti.Hodge.HodgeStructureOn`, `HodgeStructureOn.dual`, `IsPolarization`,
`Polarization`, `isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`.

**Checks.**

- `RiemannForm.gaussian`: on `ℤ + iℤ ⊂ ℂ` with `H(v, w) = v w̄`, `E(i, 1) = 1` and `E(1, i) = −1`; with the
  opposite convention the signs swap.
- `RiemannForm.double`: `2E` is a positive integral Riemann form with lattice cokernel `(ℤ/2)²` on
  `ℤ + iℤ`, hence not principal.
- `RiemannForm.zero_dimension`: on `V = 0` positivity is vacuous and the zero form is principal.
- `RiemannForm.negative`: `−E` on a positive-dimensional torus fails `E(Jv, v) > 0`.
- `RiemannForm.scale_nonprincipal`: the double of a principal form on a nonzero lattice is positive
  and integral but not principal; surjectivity onto the integral dual fails.
- `RiemannForm.homological_sign`: on the Gaussian lattice, with `C = −J` and `Q = −E`,
  `Q(Cv, v) = E(Jv, v) > 0`; taking `Q = E` gives a negative value.
- `RiemannForm.dual_double`: for `E = 2E₀` on `ℤ + iℤ` with `E₀` principal, the rational dual form is
  `Q₀^∨/2`, with half-integral values, so it is not an integral form on `H¹`; here `e = 2`, and
  `2 · Q^∨ = Q₀^∨` is the principal integral polarizing form of the dual.

### A5.3 The Appell–Humbert theorem and algebraicity

Prove `appellHumbert`. Holomorphic line bundles on `V/Λ` correspond bijectively to pairs `(H, α)` of a
Hermitian form `H` with `E = Im H` integral on `Λ` and a semicharacter `α : Λ → U(1)` with
`α(λ + μ) = (−1)^{E(λ, μ)} α(λ) α(μ)`, through the factor of automorphy
`j_λ(z) = α(λ) exp(π H(z, λ) + π H(λ, λ)/2)`. Identify `H²(V/Λ, ℤ)` with the alternating forms on `Λ`
by evaluation on ordered cycles: `[λ, μ]` is the image of the oriented torus `ℝ²/ℤ² → V/Λ`,
`(s, t) ↦ sλ + tμ`. With `c₁` the class of `(i/2π)Θ` for the Chern curvature `Θ`
(ComplexComparisonPartII C5.4, `chernFubiniStudyIntersection`), `c₁(L(H, α))([λ, μ]) = −E(λ, μ)`: the
first Chern class is the homological polarizing form `Q = −E` of A5.2, not `E`. The Mumford map uses
`E` itself: `t_v^*L(H, α) ≅ L(H, α · exp(2πi E(v, ·)))`, so `φ_L(v)` is the topologically trivial
bundle with semicharacter `exp(2πi E(v, ·))`. A positive
`H` gives an ample line bundle whose third and higher powers embed the torus in projective space; a
complex torus is algebraizable iff it admits a positive Riemann form, and then the group law is
algebraic. The proof verifies the cocycle condition, computes `c₁` from the curvature of the invariant
metric `exp(−π H(z, z))` and evaluates it on ordered cycles, and
identifies the topologically trivial ambiguity with the semicharacter; for positive `H` theta functions
and their translated cubic products separate points and tangent directions; the embedding is
algebraized by Chow's theorem and the group law by proper GAGA; conversely a projective ample line
bundle pulls back to a positive `H`. GAGA is never applied to a non-algebraic compact manifold
(Stanford VIGRE notes, Theorems 1.17–1.18 and Corollary 1.20, pp. 6–8). The notes cite the full
Appell–Humbert classification and sketch the separation of points and tangents by cubic theta
products; supplying those proofs from the factors-of-automorphy computation is part of this target.
The trivial line bundle has `E = 0` and is not ample for `g > 0`; changing `α` with `H` fixed changes the
class by an element of `Pic⁰` and leaves `φ_L` unchanged. On `ℤ + iℤ` with `H(z, w) = z w̄` the invariant
metric is `exp(−π|z|²)`, the normalized curvature is `(i/2)dz ∧ dz̄ = dx ∧ dy`, and `deg L = +1` in the
complex orientation, while `E(1, i) = −1`: `c₁` takes the value `+1 = −E(1, i)` on `[1, i]`, and the
identification `c₁ = E` would give degree `−1` to an ample bundle. *Needs:* A2.3, A5.2;
ComplexComparisonPartII C4.2 (`projectiveChowNonreduced`), C4.4 (`properSourceMorphismAlgebraicity`),
C5.4 (`chernFubiniStudyIntersection`); A5.1 (lattice quotients).

### A5.4 Polarization types and the Pfaffian

Prove `polarizationType`. (1) An alternating form `E` on a free `ℤ`-module of rank `2g` with nonzero
determinant has a symplectic basis in which its matrix is `[[0, D], [−D, 0]]` with
`D = diag(d₁, …, d_g)`, `d_i > 0` and `d₁ | d₂ | ⋯ | d_g`; the `d_i` are unique, and
`det E = (d₁ ⋯ d_g)²`. (2) For a polarized complex abelian variety `(A, L)` the Riemann form of `L`
(A5.3) has type `(d₁, …, d_g)`, and with `d = ∏ d_i` (the empty product being `1`): `h⁰(L) = d`,
`(L^g) = g! d` and `deg λ = d²`. (3) In an algebraic family over a connected base with polarization
degree invertible, the prime-to-characteristic kernel of the polarization and its symplectic type are
locally constant; at primes dividing the degree the kernel is the finite flat group `ker λ`, not a
constant étale group of elementary divisors. The proof of (1) is the alternating elementary-divisor
theorem over a principal ideal domain; (2) combines the Pfaffian identity with A2.4 and the lattice
cokernel `Λ^*/E(Λ) ≅ ker λ`; (3) passes to the finite étale kernel locally and uses A3.7 (Stanford VIGRE
notes, §1, Definitions 1.13–1.14 and Theorems 1.17–1.18, pp. 5–8; Faltings–Chai I.1.6–1.8, pp. 4–5).
Type `(1, 2)` for `g = 2` has `d = 2`, `deg λ = 4` and `(L²) = 4`; for `g = 0`, `d = 1`. Over a field
the analogue of (1), with every `d_i = 1`, is Tau Ceti's symplectic basis theorem
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`; the integral statement with
elementary divisors is the target here, stated in `Suggested.lean` as
`alternating_elementaryDivisors`. *Needs:* A2.4, A3.7, A5.2, A5.3 for (2); Mathlib Smith normal form
for (1).

### A5.5 The polarized Hodge equivalence

Prove `polarizedHodgeEquivalence`. Analytification and `H₁` give an equivalence between complex abelian
varieties with polarizations and free finite `ℤ`-modules with a Hodge structure of weight `−1` and types
`(−1, 0)`, `(0, −1)` together with an integral alternating polarizing form; morphisms are homomorphisms
and integral Hodge morphisms (with the pullback condition when polarizations are to be preserved).
Principal polarizations correspond to unimodular forms. On cohomology the equivalence is contravariant
of weight one: `Hom(A, B) ≅ Hom_{HS}(H¹(B, ℤ), H¹(A, ℤ))`. The Hodge structures and polarizations are Tau
Ceti's `HodgeStructure` and `Polarization`; the content here is the geometric realization and the
weight and sign adapter of A5.2, in which `E` corresponds to `Q = −E` with `C = −J`. The proof uses
Tau Ceti's equivalence between complex structures on `ℝ ⊗ Λ` and effective weight-one Hodge
structures on `Λ` (`latticeHodgeStructureEquiv`) and `isRiemannForm_iff_isPolarization`, transported to the homological weight `−1` by the adapter of A5.2, takes the torus to be the lattice quotient of A5.1, algebraizes it by A5.3, identifies morphisms by linear covering lifts and A5.1,
and dualizes `H₁` to `H¹` with its sign (Stanford VIGRE notes, §§1.2–1.3, pp. 3–8; Charles, *Birational
boundedness for holomorphic symplectic varieties, Zarhin's trick for K3 surfaces, and the Tate
conjecture*, proof of Lemma 3.15, p. 516, for the Hodge-class description of Hom, which the integral
contravariant statement refines). For `A = B = E` without complex multiplication the integral Hodge
endomorphism ring is `ℤ`; a rational Hodge morphism is a quasi-homomorphism and need not be integral.
*Needs:* A5.1, A5.2, A5.3; Tau Ceti `HodgeStructure`, `HodgeStructureOn.dual`, `IsPolarization`,
`Polarization`, `AlmostComplexStructure`, `latticeHodgeStructureEquiv` and `IsRiemannForm`.

### A5.6 Analytic families and the algebraic comparison

Prove `analyticFamilies`. Over a complex analytic base `T`, proper smooth analytic group families with
connected fibres, equipped with a polarization of locally constant integral type, correspond to
polarized variations of integral Hodge structure of weight `−1` and types `(−1, 0)`, `(0, −1)`. The family is the quotient of its holomorphic Lie
bundle by the locally constant lattice, with zero section and group law. Over a complex manifold base,
on each Hausdorff second-countable open set where the lattice local system and Lie bundle are
trivialized, consume ComplexTori Milestone 2's quotient, projection, zero section, markings and
base change for holomorphic periods `Π_t : ℤ^{2g} → ℂ^g` whose real-linear extension is an
isomorphism on every fibre. Its compact-uniform period estimates give locally bounded fundamental
representatives, from which this target proves relative properness. Changes of lattice basis
glue the supplied quotients along monodromy using Milestone 3's linear maps.
For singular or nonreduced analytic bases the same quotient is constructed in analytic spaces, and
`analyticFamilies.manifoldComparison` compares its pullback to a manifold with that chart construction. For an abelian scheme over a
complex scheme of finite type, analytification gives this variation, with `H¹_dR ⊗ O^an ≅ H¹_B ⊗ O^an`,
the Hodge filtration and, over a smooth base, the Gauss–Manin connection. No converse algebraization
over an algebraic base is asserted. The proof performs the exponential and lattice construction locally
on the base and glues by the lattice monodromy; the polarization gives relative properness and the
holomorphic Hodge subbundle; for an algebraic family it uses proper coherent GAGA on the relative de Rham
complex, the fibrewise Betti comparison and the Gauss–Manin construction (Faltings–Chai I.6,
pp. 29–30, for the period-domain universal family; Stanford VIGRE notes, Theorem 1.8 and Corollary 1.20,
pp. 2–3 and 8, for the fibrewise construction). The relative statement for every analytic base (local
exponential and lattice descent, and the horizontal relative Betti–de Rham comparison) is not proved in
these sources and is part of this target. An analytic variation is not automatically an algebraic
abelian scheme over an algebraic base; the differential and the evaluation pairing are preserved, not
only ranks. *Needs:* A4.3, A5.5; ComplexTori Milestones 2–3 on the manifold-base domain;
ComplexComparisonPartII C−1.1–C−1.3, C1.9 (`properSchemeGagaPushforward`),
C3.3, C5.1 (`properDeRhamBetti`), C5.2 (`relativeBettiLocalSystem`, `GaussManin`,
`relativeDeRhamBetti`).

**Checks.**

- `E × (ℤ/2)` over a point is proper and smooth, and admits an ample pullback line bundle,
  but its disconnected fibre excludes it: the exponential misses the second component.
- Constant periods on a manifold give the product family `T × (V/Λ)` with its zero section.
- Integral changes of lattice basis give the same quotient family and satisfy the gluing cocycle;
  a period matrix with deficient real rank gives no compact fibre.

### A5.7 Degree-one realization conventions

Prove `realizationConventions`. For a polarized abelian variety over a field and `ℓ` prime to the
characteristic and to the polarization degree: `H¹_et(A_{K̄}, ℚ_ℓ) = V_ℓ(A)^*`; the polarization
identifies `V_ℓ(A) ≅ H¹_et(A_{K̄}, ℚ_ℓ)(1)`, and the cohomological similitude multiplier is `χ_ℓ^{-1}`.
Over `ℂ`, `H₁ = Λ`, `H¹ = Λ^*`, and the de Rham comparison carries invariant differentials to `Fil¹` in
cohomological weight one; the homological convention of A5.2 has Weil operator `−J` and polarizing
form `−E` (Tau Ceti's `latticeHodgeStructure` puts weight one, Weil operator `J` and form `E` on the
lattice instead), and cohomological duality transports this sign together with the weight. The Hodge–Tate and Sen
weight conventions are stated for their consumers and are not derived from the complex comparison. The
proof dualizes the Weil pairing (A3.7, A4.1) and tracks the cyclotomic twist; over `ℂ` it identifies
singular homology with the exponential lattice and uses the proper de Rham comparison on the Hodge
subspace (Boxer–Calegari–Gee–Pilloni, §1.8.23, p. 15). For an abelian surface `H¹` has dimension four,
while the ordinary étale `p`-part used in A4.10 has rank two. *Needs:* A3.7, A4.1, A5.1, A5.6;
ComplexComparisonPartII C5.1.

### A5.8 The Siegel universal family

Define `SiegelFamily g`: on the Siegel space `H_g = {Ω ∈ M_g(ℂ) : Ωᵀ = Ω, Im Ω positive definite}`, the
family `(H_g × ℂ^g)/ℤ^{2g}` with fibre `X_Ω = ℂ^g/(ℤ^g + Ωℤ^g)` over `Ω`, on ComplexTori's
standard additive orbit quotient. The standard unimodular
alternating form, `E(Ωe_i, e_j) = δ_{ij}` and `E` zero on `ℤ^g` and on `Ωℤ^g`, with
`H(z, w) = zᵀ (Im Ω)^{-1} w̄`, is a principal polarization of every fibre. `Sp_{2g}(ℤ)` acts by
`Ω ↦ (AΩ + B)(CΩ + D)^{-1}` and on fibres by `z ↦ (CΩ + D)^{-T} z`, in the column convention for the
lattice `ℤ^g + Ωℤ^g`; integral monodromy is this lattice action. A symplectic level-`N` structure, a
full level-`N` structure (A3.8) in which the matrix of the Weil pairing is the standard symplectic
matrix times a primitive `N`-th root of unity, is on this family a symplectic trivialization of the
lattice modulo `N`; for `N ≥ 3` it removes stabilizers. Nonprincipal types use their own lattice automorphism groups (Faltings–Chai I.6,
pp. 29–30). Apply ComplexTori Milestone 2 to the total space, projection and zero section, with
A5.6's polarized interpretation, for `Π_Ω(a, b) = Ωa + b` on `ℤ^g × ℤ^g`. Apply Milestone 3's
linear constructor to the `Sp_{2g}(ℤ)` action with linear maps `R_M(Ω) = (CΩ + D)^{-T}` and lattice representation
`ρ(M) = M^{-T}`. The construction here verifies the cocycle law of `R` and the period-equivariance law
`R_M(Ω) Π_Ω(v) = Π_{M·Ω}(M^{-T} v)` (checking the transpose), and identifies torsion with the lattice
modulo `N`. The API is `SiegelFamily.fibre`, `SiegelFamily.polarization`, `SiegelFamily.symplecticAction`
(the compatible period, lattice and fibre actions) and `SiegelFamily.level`. `Suggested.lean` states
the period space as `SiegelUpperHalfSpace`, with `siegelAction`, `siegelAction_mem`,
`siegelAction_one`, `siegelAction_translation` and `siegelAction_mul`. *Needs:* A3.7, A3.8, A5.2,
A5.6; ComplexTori Milestones 2–3; Mathlib `Matrix.symplecticGroup`, `Matrix.PosDef`.

The light predicate has intended signature
`SiegelUpperHalfSpace (g : ℕ) : Set (Matrix (Fin g) (Fin g) ℂ)`, with symmetry and
positive definiteness as its real body. Its API includes the genus-one comparison,
the dimension-zero singleton and exclusion of singular imaginary part. The period
formula `siegelAction M Ω` is defined on all integral block matrices and all complex
period matrices using Mathlib's matrix inverse. Prove `siegelAction_one` and
`siegelAction_translation`: the identity fixes every period, and
`[[I, B], [0, I]]` sends `Ω` to `Ω + B` for symmetric integral `B`.
For symplectic `M`, `siegelAction_mem` asserts both invertibility of `CΩ + D` and
preservation of the Siegel space. Prove `siegelAction_mul`, the composition identity on that space;
the invertibility assertion is what justifies the fractional formula there
(Faltings–Chai I.6, pp. 29–30).

**Checks.**

- For the identity block matrix, `siegelAction` returns `Ω`; swapping the block order fails.
- The matrix `[[i, 1], [0, i]]` has positive definite imaginary part but is excluded from
  `SiegelUpperHalfSpace 2` because it is not symmetric.
- For `Ω = [[i, 1], [1, i]]` and the symplectic lower-unipotent matrix
  `M = [[I, 0], [diag(1, 0), I]]`, `siegelAction M Ω` has entry `(2,1)` equal to
  `1/(1+i)`. The left quotient has entry `1` there, distinguishing the side of multiplication.
- In genus one, `[[1, 1], [0, 1]]` sends `τ` to `τ + 1`, while
  `[[0, −1], [1, 0]]` sends it to `−1/τ`; for `τ = i` the latter fixes `i`.
- For `g = 0`, the unique empty matrix is fixed by the action and the determinant of
  its denominator is the empty product `1`.
- `SiegelFamily.genus_one`: for `g = 1`, `H₁` is the upper half-plane and the fibre is `ℂ/(ℤ + τℤ)` with
  invariant differential `dz` and the standard elliptic Weil pairing.
- `SiegelFamily.genus_zero`: `H₀` and the fibre are points with trivial lattices.
- `SiegelFamily.bad_period`: a symmetric `Ω` with singular imaginary part does not give a lattice of rank
  `2g`, hence no compact torus.
- `SiegelFamily.level_two`: at level two `−1 ∈ Sp_{2g}(ℤ)` acts trivially on torsion and remains a
  stabilizer.

### Examples

For `Λ = ℤ + iℤ` and `H(v, w) = v w̄`, the Riemann form is principal of type `(1)`, `E(i, 1) = 1`, and the
corresponding elliptic curve has `j = 1728`. For `g = 2` and `Ω = diag(τ₁, τ₂)` the fibre is
`E_{τ₁} × E_{τ₂}` with the product polarization. For type `(1, 2)` on `ℂ²` with lattice `D ℤ² + Ω ℤ²`,
`D = diag(1, 2)`, the polarization has degree `d = 2` and `deg λ = 4`.

### Dependencies

A2–A4; Mathlib `IsZLattice`, `Matrix.symplecticGroup`; Tau Ceti Hodge library, `AlmostComplexStructure`,
`IsRiemannForm` and `latticeHodgeStructure`, `lieExp`; ComplexTori Milestones 1–3 and Milestone 4's
trivial-action lattice-torsion formula; ComplexComparisonPartII C−1.1–C−1.3, C1.9, C3.3, C4.2, C4.4, C5.1, C5.2, C5.4.

<a id="a6"></a>

## Layer A6: Arithmetic Hom and exports

Arithmetic Hom extends Tau Ceti's field category. Faithfulness and saturation on Tate modules are
proved; Tate's surjectivity theorem is not claimed. Coefficient `ℚ`-algebras change coefficients,
never the field of definition of an abelian variety, and their quasi-isogenies have two-sided inverses.
Positivity is needed for real polarized torsors. Normal-base extension of homomorphisms and localized
torsor twists over general bases have explicit proof steps. The Hodge line is the determinant of the
invariant differentials of a given family; no moduli space is built. Throughout, `A` and `B` are
abelian varieties over a field `K` (Tau Ceti `AbelianVariety K`) unless a base `S` is named, and `g` is
the dimension of `A`.

### A6.1 The degree of a homomorphism

Define `Hom.deg f` for `f : A ⟶ B`: the rank `Scheme.Hom.finrank` of the scheme morphism of `f` at the zero
point of `B` when `f` is an isogeny (Tau Ceti `IsIsogeny`), and `0` otherwise. For an isogeny it is the
degree `[K(A) : K(B)]` of the function-field extension, inseparable degree included (Milne 2008, §10,
p. 46, and Theorem 10.9, p. 46; Remark 10.11, p. 47). The API is `deg_comp` (for `A`, `B`, `C` of equal
dimension, `deg(f ≫ h) = deg f · deg h`: a composite of equal-dimensional maps is an isogeny exactly when
both factors are); `deg_mulBy` (`deg [n] = |n|^{2g}`, with `0⁰ = 1` in dimension zero, from A3.2);
`isIsogeny_iff_deg_ne_zero` (for equal dimensions); `deg_dual` (`deg f^∨ = deg f`, from A3.5);
`deg_functionField` (the comparison with the function-field degree, through SchemeAndStackFoundations
§5.2 (proper pushforward)); `deg_dimension_zero` (every endomorphism of a zero-dimensional abelian variety
has degree one); and `End.degRat`, the extension to `End⁰(A)` by `deg(q) = deg(nq)/n^{2g}` for any `n > 0`
with `nq ∈ End A`, independent of `n` because `End A` is torsion-free (A3.4), and nonzero exactly on
units of `End⁰(A)`. An endomorphism with finite kernel has a quasi-inverse through the quotient
property (A3.3, A3.4). *Needs:* A3.1–A3.5; Mathlib `Scheme.Hom.finrank`; Tau Ceti `IsIsogeny`, `End`,
`mulBy`; SchemeAndStackFoundations Layer 5 §5.2 (proper pushforward).

**Checks.**

- `deg_mulBy_two_elliptic`: on an elliptic curve `deg [2] = 4` in every characteristic.
- `deg_zero`: for `g > 0`, `deg 0 = 0` and `deg 1 = 1`; for `g = 0`, the zero endomorphism is the
  identity and has degree one.
- `deg_frobenius_ne_card_ker`: for the Frobenius `π` of an elliptic curve over `𝔽_p`, `deg π = p` although
  `π` is injective on geometric points; a definition by counting kernel points fails.
- `deg_neg_one`: `deg [−1] = 1`, consistent with `deg [n] = n^{2g}`.

### A6.2 Faithfulness on Tate modules

Prove `homTateInjective`. For `ℓ` different from the characteristic, `Hom(A, B) → Hom_{ℤ_ℓ}(T_ℓ A, T_ℓ B)`
is injective, so `Hom(A, B)` is torsion-free; if `T_ℓ f` is divisible by `ℓ^n` then `f` is divisible by `ℓ^n`
in `Hom(A, B)`. A map with zero Tate realization kills all `ℓ`-power torsion, which is Zariski dense
(A3.2), so it is zero; this argument uses neither polarizations nor degree polynomials. Divisibility
of `T_ℓ f` by `ℓ^n` means that `f` vanishes on `A[ℓ^n]`, which is finite étale, so A3.4 applies (Milne 2008,
Lemma 10.6, p. 45). For an ordinary elliptic curve over `𝔽̄_p`, `End E` embeds in `End(T_ℓ E) ≅ M₂(ℤ_ℓ)` for
`ℓ ≠ p`; for `ℓ = p` and `E` supersingular `T_p E = 0` and injectivity fails. *Needs:* A3.2, A3.4, A4.1.

### A6.3 Images of homomorphisms over the original field

Prove `abelianImage`. For a homomorphism `f : A → B` of abelian varieties over a field `K`, the
scheme-theoretic image `f(A) ⊆ B` is an abelian subvariety (a closed subgroup scheme which is an abelian
variety over `K`); `f` factors as a faithfully flat homomorphism `A → f(A)` followed by the closed
immersion; the formation of `f(A)` commutes with every field extension; and `f(A)` is the smallest closed
subscheme through which `f` factors, so any abelian subvariety through which `f` factors contains it.
In particular a nonzero homomorphism into an abelian variety whose only abelian subvarieties are `0`
and itself is surjective. The proof
does not take reduced identity components of kernels, which fail to be smooth over imperfect fields:
the scheme-theoretic image commutes with flat base change (Stacks, Lemma 29.26.16, tag 081I), so
`f(A)_{K̄} = f_{K̄}(A_{K̄})`; this is reduced, being the image of a reduced scheme, connected, proper, and
a group scheme, hence smooth over the perfect field `K̄` (Stacks, Lemma 39.8.4, tag 047P, and in
characteristic zero Lemma 39.8.2, tag 047N); so `f(A)` is geometrically integral and proper, an abelian
variety; `A → f(A)` is faithfully flat by A3.1 `surjectiveHom_flat`. No cited abelian-variety
source states this over imperfect fields; the argument above is the proof to be formalized. Over an
arbitrary base a connected kernel need not be smooth, and nothing is asserted there.
`Suggested.lean` states the factorization as `OverField.exists_abelianImage`. *Needs:* A3.1;
JacobianChallenge Layer E; Tau Ceti `ClosedSubgroupScheme`.

### A6.4 Simple abelian varieties

Define `IsSimple A`: `A` is not zero-dimensional, and every abelian subvariety of `A` (a homomorphism
`i : B ⟶ A` whose scheme morphism is a closed immersion) is zero-dimensional or an isomorphism. Prove
`simpleEndDivision`: if `A` is simple, every nonzero `α ∈ End A` is an isogeny and `End⁰(A)` is a division
algebra; for simple `A` and `B`, `Hom⁰(A, B) = 0` unless `A` and `B` are isogenous, in which case it is free
of rank one over `End⁰(A)` on the right and over `End⁰(B)` on the left; and `End⁰(Aⁿ) ≅ M_n(End⁰ A)`. The
proof: by A6.3 a nonzero homomorphism into a simple variety is surjective, so a nonzero endomorphism of
a simple `A` is surjective and has finite kernel. For simple `A`, `B` and nonzero `f : A → B`, `f` is
surjective, so `dim A ≥ dim B`. For the reverse inequality choose polarizations `λ_A`, `λ_B` from
ample line bundles over `K` (A2.8(1), A2.5) and `μ : A^∨ → A` with `μ ∘ λ_A = [n]` for some `n ≥ 1`
(A3.3, A3.4); then `h = μ ∘ f^∨ ∘ λ_B : B → A` satisfies `λ_A ∘ h = [n] ∘ f^∨ ∘ λ_B`, which is nonzero
because `f^∨ ≠ 0` by biduality (A2.2), `λ_B` is surjective and `Hom(B, A^∨)` is torsion-free (A3.4). So
`h ≠ 0`, its image is `A` by A6.3, and `dim B ≥ dim A`. A surjective homomorphism of abelian varieties
of equal dimension is finite and flat (A3.1), so `f` is an isogeny; complete reducibility (A6.5) is
not used. The proof then kills the finite kernel by an integer and factors through the quotient for a
quasi-inverse (A3.3, A3.4), and uses
product inclusions and projections for the matrix description (Milne 2008, §10, p. 42 for the
definition and p. 43 for the division algebra; the argument there through the connected component of
the kernel needs geometric reducedness over an imperfect field, which A6.3 and the reverse map `h`
avoid). A supersingular
elliptic curve over `𝔽̄_p` has `End⁰` the quaternion algebra over `ℚ` ramified at `p` and `∞`, a division
algebra; `E × E` is not simple (the diagonal is an abelian subvariety) and `End⁰(E × E) = M₂(End⁰ E)` is
not a division algebra. `Suggested.lean` states `IsSimple` with `isIsogeny_of_isSimple` and
`isUnit_of_isSimple`. *Needs:* A2.2, A2.5, A2.8, A3.1, A3.3, A3.4, A6.3; Tau Ceti `prod`, `fst`, `snd`.

**Checks.**

- `IsSimple.elliptic`: every elliptic curve is simple: its abelian subvarieties are `0` and itself.
- `IsSimple.product`: `E × E′` is not simple, since `E × 0` is an abelian subvariety; a definition testing
  only isogeny factors of the same dimension would miss it.
- `IsSimple.zero`: the zero-dimensional abelian variety is not simple; otherwise the division-algebra
  statement would fail, because its `End⁰` is the zero ring.

### A6.5 Poincaré complete reducibility

Prove `poincareReducibility`. For every abelian subvariety `B ⊆ A` there is an abelian subvariety
`B′ ⊆ A` such that addition `B × B′ → A` is an isogeny. Consequently `A` is isogenous to a product
`A₁^{n₁} × ⋯ × A_r^{n_r}` of pairwise non-isogenous simple abelian varieties, and the isogeny classes of
the `A_i` with their multiplicities are unique. The statement is over the original field, imperfect
fields included. The proof chooses an ample `L` over `K` (A2.8(1) over a field); for the inclusion
`i : B → A`, `λ_B = i^∨ φ_L i` is a polarization of `B`, so `r = λ_B^{-1} i^∨ φ_L ∈ Hom⁰(A, B)` satisfies
`r i = 1`; an integer multiple of the projector `1 − i r` has an abelian image `B′` by A6.3; then `B ∩ B′`
is finite and the sum is an isogeny; induct on dimension; uniqueness follows from A6.4
(Conrad–Feng, Theorem 7.6.1, pp. 73–74; Milne 2022, Proposition 12.1, p. 19). For non-isogenous elliptic
curves `E`, `E′`, the abelian subvarieties of `E × E′` are `0`, `E × 0`, `0 × E′` and `E × E′`; for the
diagonal of `E × E` the antidiagonal is a complement and the addition map has kernel of order `4`.
*Needs:* A2.3, A2.5, A2.8, A3.4, A6.3, A6.4.

### A6.6 The degree is a homogeneous polynomial function

Prove `degreePolynomial`. The function `deg : End⁰(A) → ℚ` is a homogeneous polynomial function of degree
`2g`: for every finite family `e₁, …, e_n` in `End⁰(A)`, `deg(x₁e₁ + ⋯ + x_n e_n)` is given by a homogeneous
polynomial of degree `2g` with rational coefficients. The underlying lemma on polynomial functions must
be used with a bound on degrees: if `x ↦ f(xv + w)` is a polynomial of degree at most a fixed `d` for all
`v, w`, then `f` is polynomial. The proof takes a symmetric ample divisor `D`; by the cube theorem
(A1.5) `(Σ x_i e_i)^*D` is a quadratic expression in the `x_i` in divisor classes with biadditive cross
terms; by the projection formula `deg(Σ x_i e_i) = ((Σ x_i e_i)^*D)^g / (D^g)`, also for non-finite maps,
whose top intersection vanishes; so the coefficients are rational and the degree is at most `2g`;
scaling all variables by an integer gives homogeneity; in dimension zero the function is the constant
`1` (Milne 2008, Proposition 10.13 and Lemma 10.12, p. 47). Integrality of coefficients is not inferred
from integer values. For `End E = ℤ[i]`, `deg(a + bi) = a² + b²`; on `E × E`, `deg diag(a, b) = a²b²`.
`Suggested.lean` states the integral form `degree_polynomial`. *Needs:* A1.5, A2.4, A6.1;
SchemeAndStackFoundations Layer 5 §5.3 (`Chow.c1`), §5.6 (intersection products), §5.2 (proper pushforward).

### A6.7 Hom is free of finite rank

Prove `homFreeFinite`. `Hom(A, B)` is a free `ℤ`-module of rank at most `4 dim A · dim B`, and for every
`ℓ` different from the characteristic, `Hom(A, B) ⊗ ℤ_ℓ → Hom_{ℤ_ℓ}(T_ℓ A, T_ℓ B)` is injective with
torsion-free cokernel; hence `End⁰(A)` is finite-dimensional over `ℚ`. This is faithfulness and
saturation, not Tate's surjectivity theorem. The proof first treats simple `A`: for a finite-dimensional
rational subspace `W ⊆ End⁰ A`, the nonzero points of `N = W ∩ End A` have degree at least one, and the
degree polynomial (A6.6) extended to `W_ℝ` is continuous at zero, so `N` is a discrete lattice
(Mathlib `instModuleFinite_of_discrete_submodule`); `N` is saturated in `End A`, and approximating a
`ℤ_ℓ`-linear relation by integers and applying A6.2 shows that `N ⊗ ℤ_ℓ` injects into `End(T_ℓ A)`, so
`dim W ≤ 4g²`; with this bound on every finite subspace, `End⁰ A` is finite-dimensional and the lattice
step applies to a basis. General `A, B` reduce to simple factors through the quasi-inverses of the
isogenies of A6.5; finite generation then gives the `ℤ_ℓ` statement and saturation from A6.2
(Conrad–Feng, Theorem 7.6.7, pp. 75–76; Milne 2008, Theorem 10.15, pp. 49–51, whose proof must use the
saturated `N = W ∩ End A` rather than an arbitrary submodule, and must prove finite-dimensionality
before choosing a rational basis). Dimension zero gives `Hom = 0`. A non-CM elliptic curve in
characteristic zero has `End E = ℤ`; a supersingular `E` over `𝔽̄_p` has `End E` a maximal order of rank
`4 = 4 · 1 · 1` in a quaternion algebra, attaining the bound. *Needs:* A6.2, A6.4, A6.5, A6.6.

### A6.8 Semisimplicity of the endomorphism algebra

Prove `endQ_isSemisimple`. If `A` is isogenous to `A₁^{n₁} × ⋯ × A_r^{n_r}` with the `A_i` simple and
pairwise non-isogenous, then `End⁰(A) ≅ ∏ M_{n_i}(D_i)` with `D_i = End⁰(A_i)` a division algebra of finite
dimension over `ℚ`, so `End⁰(A)` is a finite-dimensional semisimple `ℚ`-algebra; `End(Aⁿ) = M_n(End A)`, and
`End(A × B)` is the matrix ring `[[End A, Hom(B, A)], [Hom(A, B), End B]]`, compatibly with `T_ℓ`.
Semisimplicity is of `End⁰(A)`, not of the order `End A`. The proof transports along the isogeny, uses
`Hom⁰(A_i, A_j) = 0` for `i ≠ j` and `End⁰(A_iⁿ) = M_n(D_i)` (A6.4), finite dimension from A6.7, and Mathlib
`isSemisimpleRing_iff_pi_matrix_divisionRing` (Milne 2008, §10, p. 43). `End⁰(E × E′) = ℚ × ℚ` for
non-isogenous non-CM elliptic curves; `End⁰(E × E) = M₂(ℚ)`; for `E` with CM by an imaginary quadratic
`F`, `End⁰(E²) = M₂(F)`. *Needs:* A6.4, A6.5, A6.7; Tau Ceti `prod`; Mathlib
`isSemisimpleRing_iff_pi_matrix_divisionRing`.

### A6.9 Two polynomial lemmas

Prove `polynomialsFromAdicValues`. Let `P = ∏(X − a_i)` and `Q = ∏(X − b_i)` be monic of the same degree
over `ℚ_ℓ`, with roots in an algebraic closure. If `|∏_i F(a_i)|_ℓ = |∏_i F(b_i)|_ℓ` for every `F ∈ ℤ[T]`,
then `P = Q`. The hypothesis extends to `F ∈ ℚ_ℓ[T]` by continuity and clearing denominators; for each
irreducible factor `f`, perturbing `f` by small constants makes the valuation of the product over its
roots grow with the multiplicity of the root orbit of `f`, while the other factors stay bounded; so every
irreducible factor has the same multiplicity in `P` and `Q`. The argument uses Galois orbits of roots,
not rationality of individual roots (Milne 2008, Lemma 10.21, p. 51). For `P = (X − 1)²` and
`Q = (X − 1)(X − 1 − ℓ)`, `F = T − 1` gives `0` for both, while `F = T − 1 − ℓ` gives `|ℓ²|_ℓ` for `P` and `0` for `Q`.

Prove `multiplicativePolynomialLaw`. Let `E` be a unital algebra over an infinite field `F`, and
`δ : E → F` a multiplicative homogeneous polynomial law of degree `d` with `δ(1) = 1`, compatible with
scalar extension. Let `P_α(X) = δ(X · 1 − α)`, monic of degree `d` with roots `a_i` in a splitting field.
Then `δ(G(α)) = ∏_i G(a_i)` for every `G ∈ F[T]`; for the abelian degree, `d = 2g` is even and the
conventions `δ(α − X)` and `δ(X − α)` agree. The proof splits `G = c ∏(T − b_j)` after scalar extension,
uses `δ(c · 1) = c^d` and multiplicativity, and replaces `δ(α − b_j)` by `(−1)^d P_α(b_j)`; homogeneity,
normalization and scalar extension are hypotheses, which a merely multiplicative function lacks
(Milne 2008, Lemma 10.22, p. 51). For `E = M₂(F)` and `δ = det`, `det G(M) = ∏ G(a_i)` over the
eigenvalues. The intended field-level interfaces are `eq_of_padicNorm_roots_products`
for monic polynomials in `(Padic ℓ)[X]` with `ℓ` prime, equal natural degree, and the
stated norm equality for every integral test polynomial, and
`det_aeval_eq_prod_roots` for `M : Matrix (Fin n) (Fin n) F` and `G : F[X]` over an
algebraically closed field: `det(G(M)) = ∏_{a ∈ roots(charpoly M)} G(a)`, with roots
counted with multiplicity. *Needs:* Mathlib `Padic`, `PadicAlgCl`,
`Polynomial.roots`, `Matrix.charpoly`.

### A6.10 The characteristic polynomial and the trace

Define the characteristic polynomial and trace of `α ∈ End A`: by `exists_charpoly` there is a unique
monic `P_α ∈ ℤ[X]` of degree `2g` with `P_α(r) = deg(α − [r])` for every `r ∈ ℤ`; for `g > 0`, `Tr α` is minus
the coefficient of `X^{2g−1}`, and for `g = 0` put `P_α = 1` and `Tr α = 0`. On `End⁰ A` put
`P_{α/n}(X) = n^{−2g} P_α(nX) ∈ ℚ[X]`, monic and independent of the denominator; `Tr` is `ℚ`-linear and the
constant coefficient of `P_α` is `deg α`. `P_α` is not the minimal polynomial: `P_{[n]} = (X − n)^{2g}`
(Milne 2008, Theorem 10.9, p. 46, and p. 48). The proof: A6.6 gives a rational monic polynomial of
degree `2g`, unique because a polynomial is determined by its values on `ℤ`. For an isogeny `β` the
`ℓ`-adic absolute value of `deg β` equals that of `det T_ℓ β` (both measure the `ℓ`-primary part of the
finite kernel), and both vanish for a non-isogeny; applying this to `G(α)` for every `G ∈ ℤ[T]` and the two
lemmas of A6.9 identifies `P_α` with `det(X − V_ℓ α)`. Finite generation of `End A` (A6.7) makes `α`
integral over `ℤ` by the determinant trick, so its Tate eigenvalues are algebraic integers and the
rational coefficients of `P_α` are integers. Integer values alone do not give integral coefficients.
Additivity of the trace is that of the matrix trace on `V_ℓ A`. The API is `End.charpoly`,
`End.charpoly_eval`, `End.charpoly_monic`, `End.trace`, `End.charpoly_coeff_zero` and `End.trace_add`.
*Needs:* A3.5, A4.1, A6.1, A6.6, A6.7, A6.9; Mathlib `Polynomial.funext`.

**Checks.**

- `charpoly_mulBy`: `P_{[n]} = (X − n)^{2g}` and `Tr [n] = 2gn`.
- `charpoly_zero`: `P_0 = X^{2g}`, since `deg(−[r]) = r^{2g}`.
- `charpoly_frobenius_elliptic`: for the `q`-Frobenius `π` of an elliptic curve over `𝔽_q`,
  `P_π = X² − aX + q` with `a = q + 1 − #E(𝔽_q)`.
- `charpoly_ne_minpoly`: for `g > 0` the minimal polynomial of `[n]` is `X − n` while `P_{[n]} = (X − n)^{2g}`;
  for `g = 0`, `P = 1` and `Tr = 0`.

### A6.11 The characteristic polynomial on the Tate module

Prove `charpolyTate`. For `α ∈ End A` and `ℓ` different from the characteristic,
`P_α(X) = det(X − V_ℓ α | V_ℓ A)`. Hence `Tr α` and `deg α` are the trace and determinant of `α` on `V_ℓ A`,
and the characteristic polynomial of `V_ℓ α` has integer coefficients independent of `ℓ`; the same holds
for `α ∈ End⁰ A` with rational coefficients. At finite level, for every `r ≥ 1` the characteristic
polynomial of `α` on the free `ℤ/ℓ^r`-module `A[ℓ^r](K^{sep})` of rank `2g` is `P_α` modulo `ℓ^r`, so
its trace there is `Tr α` modulo `ℓ^r`, compatibly in `r`. The identification is the one established
in the construction of A6.10, exported (Milne 2008, Proposition 10.20, p. 50); the finite-level form
is its reduction through `T_ℓ A / ℓ^r ≅ A[ℓ^r]` (A4.1, `AbelianTate.modPow`). For `ℓ = p` the
`p`-adic Tate module can have rank less than `2g` and the statement fails. For the Frobenius of
`E/𝔽_q` and every `ℓ ≠ p` the characteristic polynomial on `V_ℓ E` is `X² − aX + q`, and on `E[ℓ^r]`
its reduction modulo `ℓ^r`. A single level does not determine the trace: `[1 + ℓ^r]` and `[1]` act
identically on `E[ℓ^r]`, while their traces are `2 + 2ℓ^r` and `2`. *Needs:* A4.1, A6.10.

### A6.12 Trace and degree through a subfield

Prove `traceDegreeSubfield`. For a subfield `F ⊆ End⁰ A` of degree `f` over `ℚ` with the same identity, `f`
divides `2g`, `V_ℓ A` is free of rank `2g/f` over `F ⊗ ℚ_ℓ`, and `Tr α = (2g/f) Tr_{F/ℚ}(α)`,
`deg α = Nm_{F/ℚ}(α)^{2g/f}` for `α ∈ F`. More generally, when `ℚ[α]` is a product of fields, `P_α` has the
same roots as the characteristic polynomial of multiplication by `α` on `ℚ[α]`, with possibly different
multiplicities. The proof decomposes `F ⊗ ℚ_ℓ = ∏ F_λ` and `V_ℓ A = ⊕ V_λ`; for a generator `α` of `F`, every
irreducible rational factor of `P_α` shares a root with the minimal polynomial of `α`, so `P_α` is a power
of it and all `V_λ` have equal rank (Milne 2008, Proposition 10.23, p. 52). A field embedded in a corner
`eAe` has a different identity and is excluded. For a CM elliptic curve with `F = End⁰ E` imaginary
quadratic, `f = 2 = 2g` and `deg α = Nm(α)`. *Needs:* A6.8, A6.11.

### A6.13 Degrees of polarized isogenies

Prove `polarizedIsogenyDegree`. For an isogeny `α : A → B` and a polarization `λ′` of `B`,
`α^*λ′ = α^∨ ∘ λ′ ∘ α` is a polarization of `A` and `deg(α^*λ′) = deg(λ′) · deg(α)²`; the isogeny
degree of a polarization is a square, `deg φ_L = χ(L)²`, and principal polarizations have degree one. The proof
writes `λ′ = φ_{L′}` over `K̄`, uses `α^∨ φ_{L′} α = φ_{α^*L′}` (A2.3) with `α^*L′` ample since `α` is finite,
and `deg α^∨ = deg α` (A6.1) (Milne 2008, Remark 13.9, p. 60, and Theorem 11.1, p. 54). For the principal
polarization of `E` and `α = [n]`, `deg([n]^*λ) = n⁴ = deg(n²λ)`. *Needs:* A2.3, A2.4, A2.5, A6.1.

### A6.14 Positivity of the Rosati involution

Prove `rosatiPositivity`. For a polarization `λ` of `A`, the form `(α, β) ↦ Tr(α β^†)` on `End⁰ A` is
symmetric and positive definite. If `g > 0` and `λ = φ_L` over `K̄` with `D` an ample divisor of `L`, then for
`α ∈ End A`
`Tr(α^† α) = 2g · (D^{g−1} · α^*D) / (D^g),`
and for rational `α` one applies this to an integral multiple. For `g = 0`, `End⁰ = 0`. The formula is
proved by Riemann–Roch: by A2.3, `φ_{L^n ⊗ α^*L} = nλ + α^∨λα = λ ∘ (n + α^†α)`; by A2.4 and A6.13 its degree
is `χ(L^n ⊗ α^*L)² = ((nD + α^*D)^g/g!)²` and also `deg λ · P_{α^†α}(−n)` with `deg λ = ((D^g)/g!)²`;
comparing the coefficients of `n^{2g−1}` gives the formula. Since `φ_{t_x^*L} = φ_L` (A2.3), the formula
holds for every translate `t_x^*D`, `x ∈ A(K̄)`. For `α ≠ 0` the image `α(A)` is a positive-dimensional
abelian subvariety (A6.3); the `x` with `α(A) + x ⊆ D` form a proper closed subset, so for some `x` the
image is not contained in the support of `t_x^*D`. Then the pullback of a local equation of `t_x^*D` is a
nonzerodivisor and `α^*(t_x^*D)` is an effective Cartier divisor, nonzero because the ample `t_x^*D`
meets `α(A)`; so the right side is positive by A2.7. The image can lie inside `D` itself, where the
pulled-back section vanishes identically and `α^*D` is not an effective Cartier divisor. Clearing denominators and polarizing gives the form statement, and positivity over `ℚ`
implies it over `ℝ` because the radical of a positive semidefinite rational form is rational (Milne 2008,
Theorem 14.3, p. 62, for the statement and formula; Milne 2022, Theorem 17.3 and Lemma 17.4,
pp. 35–36, for an alternative proof through exterior étale cohomology; Conrad, *Polarizations*,
Theorem 3.4, pp. 9–10). For an elliptic curve with principal `λ`, `α^† = α̂` and `Tr(αα^†) = 2 deg α > 0`; for
`End E = ℤ[i]`, `Tr((a + bi)(a − bi)) = 2(a² + b²)`. On `E × E` with the product polarization,
`D = E × {0} + {0} × E` and the non-isogeny `α(x, y) = (x, 0)`, the image `E × {0}` lies in `D`; for the
translate by `(a, b)` with `b ≠ 0`, `α^*(t_{(a,b)}^*D) = {−a} × E`, and the formula gives
`Tr(α^†α) = 4 · 1/2 = 2`, the trace of the idempotent `diag(1, 0)` on `V_ℓ E ⊕ V_ℓ E`. For every nonzero rational
`n × n` matrix `x`, `trace(x xᵀ) = ∑_{i,j} x_{ij}² > 0`; the case `n = 0` has no
nonzero matrix. This is the matrix positivity check for the transpose involution.
*Needs:* A2.3, A2.4, A2.7, A3.9, A6.3, A6.10, A6.13.

### A6.15 Rational Néron–Severi and the ample cone

**The Rosati operator adapter and internal square roots.** Prove `rosatiRegularRepresentation`:
for a polarized abelian variety over any field, extend `†` and the geometric trace to
`E = ℝ ⊗_ℚ End⁰(A)`. The trace `t : E → ℝ` is linear, satisfies `t(xy) = t(yx)` and
`t(x^†) = t(x)`, and gives the positive definite inner product `⟨x,y⟩ = t(x y^†)` by A6.14.
Left multiplication `s ↦ L_s` is a faithful real-algebra representation on this finite-dimensional
real Hilbert space, with `L_{s^†} = L_s^*`. Use the norm induced by this inner product for the operator
adapter. Define `IsRosatiPositive t s` intrinsically by `s^† = s` and
`t(s x x^†) > 0` for every `x ≠ 0`; thus `L_s` is positive definite.
For a positive self-adjoint unit `s`, prove `rosatiPositiveSquareRoot`: there is a unique
positive self-adjoint `r ∈ E` with `r² = s`; it is a unit, belongs to `ℝ[s]`, and commutes with every
element of `E` commuting with `s`, as does `r^{-1}`. These statements also apply to any finite-dimensional
real algebra with a real-linear involution and a cyclic, involution-invariant linear trace satisfying
`t(x x^†) > 0` for `x ≠ 0`.

The square root is supplied by OperatorTheory/PolarDecomposition PD-A20–PD-A28 on `L_s`.
Interpolate `√z` on the finite real spectrum of `L_s` by `p ∈ ℝ[X]`, using PD-A11–PD-A19; the
operator root is `p(L_s) = L_{p(s)}`, so `r = p(s)` lies in `E`. Faithfulness transfers its square,
positivity and uniqueness; invertibility follows from the positive spectrum, and polynomial
evaluation gives commutant compatibility. The same argument with `1/√z` gives the inverse in
`ℝ[s]`. This construction precedes the matrix normal form (Voight, *Quaternion algebras*, v0.9.15,
§8.4.8, p. 117, for the regular-representation positivity convention).
*Needs:* A3.9, A6.7, A6.11, A6.14; OperatorTheory/PolarDecomposition PD-A11–PD-A28.

**Checks.**

- In `M_n(ℝ)` with transpose and matrix trace, the inner product is the sum of entrywise products,
  and the internal square root agrees with the positive symmetric matrix square root.
- For `s = diag(2, 3)`, the root is `diag(√2, √3)` in `M₂(ℝ)`; an internal real square root need
  not lie in `M₂(ℚ)`.
- Every matrix commuting with `s = diag(4, 4, 9)` commutes with its root `diag(2, 2, 3)` and its
  inverse, including all matrices on the repeated-eigenvalue block.
- `diag(1, 0)` is self-adjoint and nonnegative but fails strict positivity and the unit hypothesis.
  For the dimension-zero abelian variety, `E = 0`, positivity is vacuous and its unique element
  is its own square root and a unit.

**Real division algebras.** Prove `realCentralDivisionAlgebra`: every associative
finite-dimensional real division algebra is isomorphic as a real algebra to `ℝ`, `ℂ` or
`ℍ[ℝ]`. If its centre is `ℝ`, only `ℝ` and `ℍ[ℝ]` occur; a finite-dimensional central
division algebra over `ℂ` is `ℂ`. For the proof, the minimal polynomial of each element is
irreducible over `ℝ`, so has degree at most two. A nonreal element gives a copy of `ℂ`;
decomposition under conjugation by its imaginary unit separates commuting and anticommuting
parts. The commuting part is `ℂ`, and the anticommuting part, when nonzero, is one-dimensional
over `ℂ`. A generator has negative real square, so rescaling gives the Hamilton relations
(Voight, v0.9.15, Theorem 3.5.1 and Corollary 3.5.9, pp. 36–37).
*Needs:* Mathlib real-closedness of `ℝ`, finite-dimensional algebra and quaternion APIs;
`IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed` for the complex-central case.

**Checks.**

- `ℍ[ℝ]` is a central real division algebra of dimension `4`.
- `M₂(ℝ)` is central simple but has nonzero zero divisors, so it is excluded by the division
  hypothesis.
- `ℂ` has centre `ℂ` and real dimension `2`; it occurs in the general classification but
  is not central over `ℝ`.

**The real Rosati normal form and positivity comparison.** Prove `realRosatiDecomposition`:
for `E` and `t` as above, construct a real-algebra isomorphism
`E ≅ ∏ M_{r_i}(ℝ) × ∏ M_{c_j}(ℂ) × ∏ M_{h_k}(ℍ[ℝ])` that sends `†` to transpose on the real
factors and conjugate transpose on the complex and quaternionic factors. The index sets are finite
and block sizes positive; the zero algebra has no blocks. More generally, finite dimension,
real-linearity of the involution, the cyclic and involution-invariant trace identities, and
`t(x x^†) > 0` for nonzero `x` are the hypotheses of this normal-form theorem.
Under this isomorphism, `IsRosatiPositive t s` is equivalent to positive definiteness of every
self-adjoint matrix factor. On quaternionic columns, positive definiteness means
`Re(∑_{i,j} v_i^* s_{ij} v_j) > 0` for `v ≠ 0`, together with conjugate-transpose symmetry.
In noncommutative applications, “totally positive” means this condition in every factor.

The positive-involution normal form is proved here, using RepresentationTheory/SemisimpleAlgebras
Layers 4–5 for Skolem–Noether, `realCentralDivisionAlgebra` for the real classification, and Mathlib
`IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed` for complex central factors. The faithful regular
representation carries `†` to the operator adjoint, so its regular trace is positive on `x x^†`;
positivity forces semisimplicity and prevents the involution from exchanging simple factors.
Their centres are `ℝ` or `ℂ`. On each matrix factor the positive involution is adjoint to a definite
Hermitian form; rescale its defining form to be positive and conjugate by its internal positive
square root to obtain the standard adjoint. In that normal form, the original `t` is a positive
multiple of the real matrix trace on each factor. This gives the intrinsic positivity comparison
without identifying geometric trace with reduced trace (Voight, §8.4.5–§8.4.9, pp. 116–118;
Lipnowski–Tsimerman, §4.3.2 and Proposition 4.10, pp. 19–20, for the resulting cones).
*Needs:* the operator adapter and square-root target above; `realCentralDivisionAlgebra`;
RepresentationTheory/SemisimpleAlgebras Layers 4–5;
Mathlib `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`.

**Checks.**

- Transpose on `M_n(ℝ)` already has the specified normal form; the positive elements are the
  positive definite symmetric matrices.
- Conjugate transpose on complex and quaternionic factors gives the positive definite Hermitian
  cones. On `ℍ[ℝ]` itself, the self-adjoint elements are real scalars and positivity means `s > 0`.
- For `J = diag(1, −1)` on `M₂(ℝ)`, the involution `x^† = J^{-1} xᵀ J` has
  `trace(e₁₂^† e₁₂) = −1`; it fails the positivity hypothesis despite semisimplicity.
- Swapping the factors of `ℝ × ℝ` sends `e = (1, 0)` to `(0, 1)`, so `t(e e^†) = 0` for every
  linear trace and violates strict positivity.

**The geometric ample cone.**

Prove `rationalNSAmpleCone`. Over an algebraically closed field, `φ` induces
`NS(A) ⊗ ℚ ≅ Hom⁰(A, A^∨)^{sym}`, the rationalization of the integral isomorphism
`NS(A) ≅ Hom(A, A^∨)^{sym}` of A3.13, in every characteristic, and `θ_λ([L]) = λ^{-1} φ_L` identifies
`NS(A)_ℚ` with the Rosati-fixed part of `End⁰ A`. For symmetric `f` the bundle `(id, f)^*P` has `φ = 2f`;
dividing its class by `2` after rationalization gives only the rational statement, and the integral
class with `φ = f` is the one supplied by A3.13. Lipnowski–Tsimerman's half-normalization `θ′ = θ/2` is a
separately named scalar adapter. An integral class is ample iff `IsRosatiPositive t (θ_λ([L]))`;
over `ℝ` the ample cone is the product of the positive definite Hermitian matrix cones under
`realRosatiDecomposition`. The proof: the integral isomorphism is A3.13, and
tensoring with `ℚ` gives the first statement; the intrinsic positivity comparison and internal
square roots above identify the positive symmetric cone;
the component containing `λ` is the ample cone by the degree and intersection computation (Conrad,
*Polarizations*, Example 2.2 and Lemma 2.3, pp. 6–7; Lipnowski–Tsimerman, Lemma 4.6 and
Propositions 4.9–4.10, pp. 17–20). *Needs:* A2.10, A3.9, A3.13, A6.14;
`realRosatiDecomposition`, `rosatiPositiveSquareRoot`.

**Checks.**

- For `L` defining `λ`, `θ([L]) = 1` and the half-normalization gives `θ′([L]) = 1/2`.
- For `E²` with `End E = ℤ` and product polarization, the real ample cone is the positive definite
  symmetric `2 × 2` matrices.
- In positive dimension `−[L]` maps to `−1`, which fails intrinsic positivity; the inverse of an
  ample line bundle is not ample.

### A6.16 Finiteness of the Néron–Severi group

Prove `neronSeveriRank`. `NS(A)` is torsion-free of finite rank at most `4g²`, through its injection into
`Hom(A, A^∨)` (A2.10, A6.7). The geometric group is computed after base change to `K̄`; its Galois
invariants are not identified with `NS(A)` without a descent statement. Hence `ρ(A) ≤ 4g²`, `ρ(E) = 1`, and
for `E` over an algebraically closed field of characteristic zero with `End E = ℤ`, `ρ(E²) = 3` from the
symmetric `2 × 2` rational matrices (A6.15) (Conrad, *Polarizations*, Lemma 2.3, pp. 6–7; Milne 2022,
Corollary 12.8, p. 22). *Needs:* A2.10, A6.7, A6.15.

### A6.17 Geometric and reduced traces

Prove `reducedTraceComparison`. For simple `A` with `D = End⁰ A`, centre `Z` of degree `e` over `ℚ` and
`dim_Z D = m²`, the geometric trace on `D` is `(2g/(em)) Trd_{D/ℚ}`; for a product of matrix factors it is
the sum of the factor traces with the actual multiplicities. A positive involution on a CM-field factor
restricts to complex conjugation; this presupposes that the factor is a CM field. The proof extends
scalars to a splitting field, writes `V_ℓ A` as a sum of standard `m`-dimensional matrix modules, uses
rationality of `P_α` (A6.11) to make the embedding multiplicities equal, and fixes `2g/(em)` by the total
dimension; on a CM field, positivity (A6.14) excludes every involution but conjugation
(Lipnowski–Tsimerman, Remark 4.8, p. 18, and §4.5 before Proposition 4.16, pp. 21–22). For a non-CM
elliptic curve the geometric trace of `1` is `2` while the reduced trace is `1`. *Needs:* A6.8, A6.12,
A6.14.

### A6.18 Automorphisms of polarized abelian varieties

Prove `polarizedAutomorphisms`. (1) For a polarized abelian variety `(A, λ)` over a field, `Aut(A, λ)` is
finite, and over an algebraically closed field the polarization-preserving automorphism group scheme is
finite étale. (2) If `n ≥ 3` and an automorphism of `(A, λ)` is the identity on the finite group scheme
`A[n]`, it is the identity; when `n` is not divisible by the characteristic, `A[n]` is étale and it
suffices that the automorphism fix the points `A[n](K̄)`. (3) For a polarized abelian scheme over any base the
polarization-preserving Isom functor is unramified, and an automorphism that is the identity on a full
level-`N` structure (A3.8), `N ≥ 3` invertible, is the identity; so full level `N ≥ 3` is a rigid level
structure in the sense of AlgebraicModuli `rigidLevelStructure`. The test on points in (2) needs `n`
prime to the characteristic: for the supersingular curve `y² + y = x³` over `𝔽̄₂`, `E[4](𝔽̄₂) = 0`, so
every automorphism fixes the points of `E[4]`, while `α : (x, y) ↦ (ζx, y)` with `ζ³ = 1, ζ ≠ 1` is a
nontrivial automorphism preserving the principal polarization; it is not the identity on the group
scheme `E[4]`, since `deg(α − 1) = 3`, while an endomorphism killing `E[4]` is divisible by `4` (A3.4)
and has degree divisible by `16`. The proof of (1): `α ∈ Aut(A, λ)` iff `α^†α = 1`, so `Tr(α^†α) = 2g` and `α` lies in the
intersection of the lattice `End A` (A6.7) with the compact ellipsoid `{x ∈ End⁰(A)_ℝ : Tr(x^†x) = 2g}`
(A6.14), which is finite. For (2): `α − 1` kills `A[n]`, so `α − 1 = nβ` with `β ∈ End A` (A3.4);
the eigenvalues of `α` (A6.11) are roots of unity of the form `1 + nπ` with `π` an algebraic integer, hence
equal to `1` by `eq_one_of_root_of_unity`; so `β` is nilpotent; `β^† = (α^{-1} − 1)/n` commutes with `β`, so
`β^†β` is nilpotent and `Tr(β^†β) = 0`, and positivity gives `β = 0`. (3) follows from (2) on geometric
fibres and A1.2 (Milne 2008, Proposition 14.4, p. 62, and Lemma 14.5, p. 63; Olsson, Theorem 2.1.11 and
its proof, pp. 301–302; Kass, Theorem 8, p. 7). In Milne's proof of (1) the compact set must be the
ellipsoid, not `End(A) ⊗ ℝ`, and in (2) the nilpotence of `β^†β` uses that `β` and `β^†` commute;
Milne states (2) on the points `A[n](k̄)` for every `n ≥ 3`, a form that needs `n` prime to the
characteristic. Represent the zero-preserving Isom functor using A0.3(4)
`homAndIsomSchemes` and A1.2. For polarizations `λ` on `A` and `μ` on `B`, the equation
`f^∨ ∘ μ ∘ f = λ` cuts out a closed subfunctor by equality of morphisms to the separated dual,
using the Hom scheme's composition and A2.2's dual-map operation. This condition preserves
the polarization, rather than a chosen line-bundle class. Over a field the graph bundles
of A2.6 give projective presentations; A1.2 gives unramifiedness, and (1) gives finitely many
geometric points. The resulting scheme, locally of finite type over the field, is therefore
finite étale. Over arbitrary bases, descend the construction and unramifiedness from
locally Noetherian approximations, with the polarizations and their equations retained.
For `E` with
`j = 1728` over `ℂ`, `Aut(E, λ) = μ₄` and `[i]` acts nontrivially on `E[3]`. *Needs:* A1.2, A3.4, A3.8, A6.7,
A6.11, A6.14; A0.3(4) (`homAndIsomSchemes`), A2.2, A2.6;
AlgebraicModuli Layer 5 §5.2; ModularCurves 0E (approximation and descent).

Prove the algebraic tool `eq_one_of_root_of_unity`: over a field `F` of characteristic
zero, if `π` is integral over `ℤ`, `n : ℤ` satisfies `3 ≤ n`, `ζ = 1 + nπ`, and
`ζ^m = 1` for some `m : ℕ` with `0 < m`, then `ζ = 1` (Milne 2008, Lemma 14.5,
p. 63). At `n = 2`, `ζ = −1`, `π = −1`, `m = 2` satisfy the remaining hypotheses
and the conclusion fails. As an interface on the field carrier, prove
`eq_one_of_finiteOrder_congruence`: if `α : End A` has `α^m = 1` for `m > 0` and
`α = 1 + n • β` for some `β : End A` and integer `n ≥ 3`, then `α = 1`.
This is the finite-order congruence milestone stated in `Suggested.lean`; (1) above
supplies finite order for polarized automorphisms.

**Checks.**

- On `E/ℂ`, let `L = O(P)` with `2P ≠ 0`. Inversion preserves `φ_L` but pulls `L` back to
  `O(−P)`, a different line-bundle class; it belongs to the polarization-preserving group.
- On the elliptic curve with `j = 1728` over `ℂ`, the polarization-preserving automorphism
  scheme has four reduced points, and `[i]` acts nontrivially on `E[3]`.
- At level two, inversion fixes `E[2]` but is not the identity over `ℂ`; the bound `N ≥ 3`
  cannot be dropped.

### A6.19 Orbits of principal polarizations

Prove `polarizationOrbits`. Over `K̄`, fix a principal polarization `λ₀`. Principal polarizations
correspond to the Rosati-symmetric, totally positive units `s = λ₀^{-1}λ` of `End A`, and isomorphism
classes of principally polarized structures on `A` are the orbits of `s ↦ u^†su` for `u ∈ (End A)^×`. For `Eⁿ`
with `End E = ℤ` this is the `GL_n(ℤ)`-congruence action on positive definite unimodular integral symmetric
matrices; for a simple `A` whose endomorphism ring is a maximal order in a CM field the classes are the
totally positive units of the real suborder modulo norms `u ū`. These examples need the stated
endomorphism order and an existing `λ₀`. The proof identifies `Hom(A, A^∨)` with `End A` through `λ₀^{-1}`.
A principal `λ` gives a unit `s`, Rosati-symmetric because `λ` is symmetric, and totally positive by the
ample-cone criterion of A6.15 applied to an ample line bundle defining `λ`. Conversely, for such an `s`
the isomorphism `f = λ₀ ∘ s` is symmetric, since `f^∨ ∘ κ_A = λ₀ ∘ s^† = f`; A3.13 gives a line bundle
`L` with `φ_L = f`, the criterion of A6.15 applied to `θ_{λ₀}([L]) = s` makes `L` ample, so `f` is a
polarization (A2.5), principal because it is an isomorphism. An isomorphism `u` carries `λ` to
`u^∨ ∘ λ ∘ u` (A2.3, A6.13), which is `s ↦ u^†su` (Lipnowski–Tsimerman, Proposition 4.11 and
Examples 4.12–4.13, pp. 19–20). The bundle `(id, f)^*P` has Mumford map `2f`, of degree `2^{2g}`, so for
`g > 0` it does not realize the principal `f`. On `E²` the identity matrix gives the product
polarization; `2I` gives the polarization `2λ₀`, of degree `d = 4` with `deg 2λ₀ = 16`, which is
not principal. *Needs:* A2.3, A2.5, A3.13, A6.13, A6.15, A6.17.

### A6.20 Full-level descent of homomorphisms

Prove `homDescentFullLevel`. For abelian varieties `A, B` over `K` and `n ≥ 3` not divisible by the
characteristic, every homomorphism `A_{K̄} → B_{K̄}` is defined over the field `K(A[n], B[n])`; in particular
all geometric endomorphisms are defined over the `n`-torsion field. To descend polarizations one also
uses the dual `n`-torsion pairing and `μ_n`; a polarization is not assumed to come from a rational ample line
bundle. The proof: the Galois action on the finite free lattice `Hom(A_{K̄}, B_{K̄})` (A6.7) factors through
a finite quotient; an element `σ` fixing both `n`-torsion groups satisfies `σf − f = 0` on `A[n]`, so it acts
on Hom as the identity modulo `n` (A3.4); the kernel of `GL_r(ℤ) → GL_r(ℤ/n)` has no nontrivial element of
finite order for `n ≥ 3` (by `eq_one_of_root_of_unity`) (Tsimerman, *The André–Oort conjecture for `A_g`*,
proof of Lemma 4.1, pp. 384–385, citing Silverberg; Milne 2008, Lemma 14.5, p. 63). For `n = 2` the
statement fails: inversion acts trivially on `2`-torsion and nontrivially on a twisted Hom lattice.
*Needs:* A3.4, A3.7, A6.7.

### A6.21 Frobenius semisimplicity

Prove `frobeniusSemisimple`. For `A` over `𝔽_q`, the `q`-Frobenius `π` is central in `End⁰(A)` (endomorphisms
over `𝔽_q`), satisfies `π^†π = q` for every polarization, and `ℚ[π]` is a product of number fields; `π` and its
powers act semisimply on `V_ℓ A` for `ℓ ≠ p`, and on any faithful characteristic-zero realization carrying
the same `End⁰` action. The proof: every endomorphism over `𝔽_q` commutes with Frobenius; the adjoint of
`π` is Verschiebung and their composite is `[q]`; `ℚ[π]` is a commutative subalgebra stable under the
positive involution, hence reduced, and its representations are semisimple (Milne 2022, §19, pp. 40–42;
Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*, §§2.1.5–2.1.7, pp. 22–23). Centrality
is for endomorphisms over `𝔽_q`; geometric endomorphisms defined only after extension need not commute with
`π`. *Needs:* A6.8, A6.11, A6.14.

### A6.22 Coefficient Hom spaces and quasi-isogenies

Define `CoefficientHom A B R` for a commutative `ℚ`-algebra `R`: `R ⊗_ℤ Hom(A, B)`, equivalently
`R ⊗_ℚ Hom⁰(A, B)`, with bilinear composition; an `R`-quasi-isogeny is a two-sided invertible element. The
functor `R ↦ CoefficientHom A B R` is represented by the affine `ℚ`-space `Spec Sym(Hom⁰(A, B)^∨)`
(finite-dimensional by A6.7), and the units of `R ⊗ End⁰ A` form the open subscheme `Aut_ℚ(A)` where
the determinant of left multiplication is invertible. `R` changes coefficients, never the field of
definition of `A` (Kisin–Madapusi Pera–Shin, §2.1.3, pp. 20–21, and §2.3.1, pp. 30–31). The construction
rationalizes the additive Hom groups and composition (Tau Ceti `leftComp`, `rightComp` are homomorphisms
in each variable); in a finite-dimensional algebra, invertibility of left multiplication is equivalent to
being a two-sided unit. The API is `CoefficientHom.points`, `CoefficientHom.id`, `CoefficientHom.comp`,
`CoefficientHom.units` and `CoefficientHom.baseChange` (a `ℚ`-algebra map `R → R′` extends coefficients and
preserves identities and inverses). *Needs:* A6.7; AlgebraicModuli Layer 1; Tau Ceti `End`,
`AbelianVariety.Hom.leftComp`, `AbelianVariety.Hom.rightComp`.

**Checks.**

- `CoefficientHom.scalar_isogeny`: `2` is a unit of `ℚ ⊗ End A` with inverse `1/2`.
- `CoefficientHom.dual_numbers`: over `ℚ[ε]/(ε²)`, `1 + εα` has inverse `1 − εα`.
- `CoefficientHom.zero`: for a nonzero commutative `ℚ`-algebra `R` and positive-dimensional `A`,
  zero is not a unit in `R ⊗_ℤ End A`. If `R = 0` or `g = 0`, this is the zero ring and its unit
  group is a singleton, even for an elliptic `A` when `R = 0`.

### A6.23 Coefficient isogeny torsors

Define `CoefficientIsog A B`: the open locus of two-sided invertible elements of `CoefficientHom A B`. It
is empty if `A` and `B` are not isogenous, and otherwise a right `Aut_ℚ(A)`-torsor under precomposition;
in equal dimension a left inverse is two-sided. Imposing compatibility with given endomorphisms cuts
out a rational linear subspace before taking the open locus, and if that open is nonempty geometrically
it has a rational point, since rational points are dense in a rational affine space; polarization
equations are quadratic and are not covered by this argument (Kisin–Madapusi Pera–Shin, §2.3.1,
pp. 30–31, and Remark 2.3.16(3), p. 36). The construction transports the determinant open of `End⁰ A`
along a quasi-isogeny; complete reducibility and faithfulness (A6.5, A6.2) exclude inverses when the
simple multiplicities differ. The API is `CoefficientIsog.open`, `CoefficientIsog.action`,
`CoefficientIsog.torsor` and `CoefficientIsog.baseChange`. *Needs:* A6.2, A6.5, A6.22.

**Checks.**

- `CoefficientIsog.self`: `CoefficientIsog A A = Aut_ℚ(A)`.
- `CoefficientIsog.empty`: for non-isogenous elliptic curves the locus is empty.
- `CoefficientIsog.dual_numbers`: `(1 + ε) id` is invertible over `ℚ[ε]/(ε²)`.
- `CoefficientIsog.dimensions`: the split inclusion `A → A × E` has a left inverse but is not an invertible
  coefficient arrow.

### A6.24 Real isometries and polarized torsors

Prove `realIsometries`. For a polarization, `{u ∈ (End⁰(A)_ℝ)^× : u^†u = 1}` is compact, and so is the group
of positive similitudes modulo `ℝ^×`. Define `CoefficientHom.polarizedAdjoint` for polarized
`(A, λ_A)` and `(B, λ_B)` by `f^† = λ_A^{-1} f^∨ λ_B`, extended real-linearly to the coefficient
Hom spaces of A6.22. It reverses composition and is involutive. For every two-sided invertible
`f ∈ CoefficientHom A B ℝ`, the element `s = f^†f` is a positive self-adjoint unit in
`E_A = ℝ ⊗_ℚ End⁰(A)`. For a rational isogeny this is the ample-cone criterion of A6.15 applied
to its pulled-back polarization; write a real coefficient isomorphism as that rational isogeny
composed with a unit of `E_A`, and use invariance of intrinsic positivity under `s ↦ a^†sa`.
Let `r ∈ E_A` be the root supplied by `rosatiPositiveSquareRoot`. Then `u = f r^{-1}` lies in
`CoefficientHom A B ℝ`, is invertible, and satisfies `u^†u = 1`, equivalently
`u^∨ λ_B u = λ_A`. Thus the coefficient isometry torsor has a real point whenever the underlying
coefficient isogeny locus is nonempty; the same holds for positive similitudes.

For additional endomorphisms, let `C` be a `ℚ`-algebra with involution and let the `ℚ`-algebra maps
`ι_A : C → End⁰(A)` and `ι_B : C → End⁰(B)` respect the polarized adjoints:
`ι_A(c^*) = ι_A(c)^†` and likewise for `B`.
Start with an invertible coefficient arrow satisfying `f ι_A(c) = ι_B(c) f` for every `c`.
Taking adjoints with `c^*` gives `ι_A(c) f^† = f^† ι_B(c)`, so `s` commutes with `ι_A(c)`;
the internal root and its inverse commute with the action, and `u` still intertwines it.
Consequently the isometry torsor with these actions is trivial over `ℝ` whenever the underlying
intertwining isogeny locus is nonempty. Compactness uses the closed faithful orthogonal action
of `rosatiRegularRepresentation`; positive similitudes are rescaled by the square root of their
positive multiplier (Kisin–Madapusi Pera–Shin, §2.1.3, pp. 20–21, and proof of Lemma 2.3.13,
p. 35). *Needs:* A3.9, A6.15 (`rosatiRegularRepresentation`, `rosatiPositiveSquareRoot`), A6.22, A6.23.

**Checks.**

- For `Eⁿ` with `End E = ℤ` and product polarization, the isometry group is `O(n)` and the correction
  is the usual positive symmetric inverse square root of `fᵀf`.
- For `A = B = E`, `λ_B = 2λ_A` and `f = 1`, the real correction is `u = 1/√2`; it satisfies the
  isometry equation and has no rational counterpart when `End⁰ E = ℚ`.
- For `s = diag(4, 4, 9)`, every additional endomorphism supported on the first two coordinates
  commutes with `r^{-1} = diag(1/2, 1/2, 1/3)`, so the correction retains that action.
- With transpose adjoints and actions of `M₂(ℚ)`, `f = diag(2, 1)` intertwines `ι_A(e₁₂) = e₁₂` with
  `ι_B(e₁₂) = 2e₁₂`, but `fᵀf = diag(4, 1)` does not commute with `e₁₂`. Such actions fail
  adjoint compatibility, and the square-root correction need not intertwine them.

### A6.25 Relative Hom and normal-base extension

Prove `relativeHom`. Let `A, B` be abelian schemes over `S`. (1) Over an arbitrary `S` the Hom functor
is an fppf sheaf of groups, rigid under nilpotent thickenings (formally unramified), and for connected
locally Noetherian `S` it embeds into the Hom of a geometric fibre (A1.2(3)–(4)). (2) If `S` is locally
Noetherian and normal and `U ⊆ S` is dense open, restriction `Hom_S(A, B) → Hom_U(A_U, B_U)` is
bijective. (3) If `S` is locally Noetherian and `A ×_S B` carries a relatively ample line bundle `M`
(for instance when `A` and `B` are polarized, through their graph bundles (A2.6), or when `S` is
Noetherian and normal (A2.8(1))), the Hom functor is represented by a separated unramified `S`-scheme
locally of finite type, the closed subscheme of homomorphisms in the Hom scheme of A0.3(4); it is the
disjoint union, over the Hilbert polynomials `Φ` of graphs with respect to `M`, of open and closed
pieces `Hom^Φ`, each finite and unramified over `S`. It is not necessarily of finite type globally.
(4) Over a smooth connected complex algebraic base of finite type, a homomorphism of one fibre that is
a Hodge morphism invariant under monodromy extends uniquely to the family. For the DVR case of (2),
apply A1.8 (`weilExtension`) to the smooth source and the abelian-scheme target; uniqueness on the
base and the source's fibre square makes the extension a homomorphism. The passage to a normal
locally Noetherian base uses the graph argument of Faltings–Chai I.2.7, proof (a), pp. 10–11,
locally on affine opens.
For (3), A0.3(4) applies on affine opens of `S`, homomorphisms are cut out by the group-law equations,
and rigidity (A1.2) gives unramifiedness; each `Hom^Φ` is quasi-projective, and over a discrete
valuation ring mapping to `S` a homomorphism of generic fibres extends with a flat graph of the same
Hilbert polynomial by (2), so `Hom^Φ` is proper by the valuative criterion, hence finite. The
monodromy statement uses the
fixed-part argument with A5.6 (Faltings–Chai I.1.7, pp. 4–5, and I.2.7, pp. 9–11; Kisin–Pappas, *Integral
models of Shimura varieties with parahoric level structure*, proof of Lemma 4.5.2, p. 194; Gao–Habegger,
proof of Lemma 5.6, p. 25, arXiv v3). The algebraic monodromy-invariant extension used by Gao–Habegger is part of this target;
relative GAGA over a nonproper base is not used. `Hom(E, E)`
contains infinitely many `[n]`, with graphs of distinct Hilbert polynomials, so global finiteness can
fail; for elliptic curves `E`, `E′` over a field with no homomorphism between them over an algebraic
closure, the Hom functor is the zero group, represented by the base, and is finite. A jump of the
endomorphism ring of a special fibre does not lift every special homomorphism. *Needs:* A0.3, A1.2,
A1.8, A2.6, A2.8, A5.6, A6.7; AlgebraicModuli Layer 2 §2.1, Layer 3 §3.4.

**Checks.**

- A homomorphism between generic fibres of two abelian schemes over a DVR extends uniquely,
  including multiplication by the residue characteristic.
- The normal-base extension includes points of codimension at least two, via the graph reduction.
- `Hom(E, E)` over a field contains all `[n]`, so its representing scheme need not be of finite type.

### A6.26 Localized isogeny categories

Define `LocalizedHom D` for a localization `ℤ ⊆ D ⊆ ℚ`: the category with the abelian schemes over `S` as
objects and `Hom_D(A, B) = D ⊗_ℤ Hom_S(A, B)`, with composition extended bilinearly; its invertible arrows are
the `D`-isogenies. Each arrow has one global denominator: it is `f/n` for an integral homomorphism
`f` and an integer `n` invertible in `D`. The coefficient unit functor is
`Aut_D(A)(R) = (End_D(A) ⊗_D R)^×` for commutative `D`-algebras `R`; when `End_D(A)` is finite
projective over `D`, it is represented by the determinant open. Integral, prime-to-`p` and rational
categories are different coefficient choices, and no field extension is performed (Kisin–Pappas,
§4.4.5, p. 192). The construction tensors the additive Hom category with the flat `D`; over a field the
Hom lattice is finite free (A6.7) and the determinant open of A6.22 gives the unit functor; in families
the locally constant finite-projective hypothesis is kept rather than treating jumps of Hom as a vector
bundle (A6.25). The API is `LocalizedHom.mk`, `LocalizedHom.comp`, `LocalizedHom.unitFunctor` and
`LocalizedHom.extend` (a further localization extends arrows and inverses).

Define `localizedYoneda D A` on the category of all `S`-schemes, valued in `D`-modules, by
`A_D(T) = D ⊗_ℤ Hom_S(T, A)` and restriction by precomposition. This is a presheaf; no topology or
sheafification enters its definition. The suggested signature `localizedYoneda_obj` identifies its
value with this tensor product, and `localizedYoneda_map_tmul` specifies restriction on pure tensors.
For `D = ℤ` it is the additive Yoneda sheaf, but localization need not preserve separation for
infinite covers, as the disjoint-union example in A6.28 shows.
Prove `LocalizedHom.yonedaComparison`: the action on these localized Yoneda presheaves
identifies `Hom_D(A, B)` with their natural `D`-linear transformations. Evaluation at the identity
of `A` gives a section with one denominator; additivity lets an invertible integer multiple of its
numerator be a homomorphism. This proves full faithfulness on all `S`-schemes, without sheafification.
Locally defined fractions give a global arrow only after establishing a common denominator and
gluing the integral numerators; local invertibility alone gives no such bound.
Every unit of `D` acts invertibly on a localized Hom module, with its inverse giving
inverse scalar multiplication. *Needs:* A6.22, A6.25.

**Checks.**

- `LocalizedHom.integral`: `D = ℤ` recovers `Hom_S`.
- `LocalizedHom.prime_to_p`: for `D = ℤ_(p)` and `g > 0`, `[p]` is not invertible while `[n]` with `p ∤ n` is.
- `LocalizedHom.rational`: for `D = ℚ`, `[p]` is invertible with inverse `id/p`.
- For `D = ℤ`, `localizedYoneda` recovers the ordinary section presheaf of `A`.
- For a finite disjoint union `T = T₁ ⊔ T₂`, the localized section group is
  `A_D(T₁) × A_D(T₂)`; this finite-product identity does not extend to infinite disjoint unions.
- For `S = ⨿_{n≥1} Spec ℂ`, `A = E × S` with `End E = ℤ`, and `D = ℤ[1/2]`, the endomorphism
  restricting to `[2^n]` on component `n` has an inverse on each component but none globally:
  `End_D(A) = (∏_n ℤ)[1/2]` does not contain `(2^{-n})_n`. Sheafifying the localized relative Hom
  presheaf admits these local inverses and therefore changes this global category.

### A6.27 Weak localized polarizations

Define `WeakPolarization D A`: a `D`-polarization of `A` is a symmetric `D`-isogeny `A → A^∨` some positive
integer multiple of which is a polarization; a weak `D`-polarization is its class under multiplication by
positive units of `D`. It records a positive ray, not a class up to all signed units. Pullback along
`D`-isogenies preserves positivity; coefficient-torsor twists preserve it under A6.29's real-triviality
and oriented coefficient-line hypotheses (Kisin–Pappas, §4.4.7, p. 193;
Kisin–Shin–Zhu, §5.12.4, p. 174). Clearing denominators and the positive cone of
A6.15 make the definition independent of the chosen multiple. The API is `WeakPolarization.mk`,
`WeakPolarization.eq_iff` (equal iff the ratio is a positive unit of `D`), `WeakPolarization.pullback`
(along `D`-isogenies) and `WeakPolarization.integral`. *Needs:* A2.5, A6.15, A6.26.

**Checks.**

- `WeakPolarization.positive_scalar`: for `D = ℚ`, `λ` and `2λ` have the same weak class.
- `WeakPolarization.negative_scalar`: for positive-dimensional `A`, `−λ` is not a weak representative of `λ`.
- `WeakPolarization.integral_units`: for `D = ℤ` the only positive unit is `1`, so weak equality is equality.

### A6.28 Twists by torsors up to localized isogeny

Define `AbelianTwist`: let `Z` be a flat affine group scheme of finite type over `Spec D` with a
homomorphism of `D`-group functors `Z → Aut_D(A)` (A6.26), and `P` a `Z`-torsor over the coefficient
base `Spec D`, with affine ring `O_P`, trivialized over `Spec D′` for a finite integral torsion-free
`D`-algebra `D′`. Form the `D`-module presheaf `A_D^P(T) = (A_D(T) ⊗_D O_P)^Z`, taking tensor products
and the invariant equalizer pointwise for the diagonal coefficient action. Representation up to
`D`-isogeny means an abelian scheme `B/S` together with a natural `D`-linear isomorphism
`localizedYoneda D B ≅ A_D^P`. The comparison of A6.26 makes `B` unique up to a global `D`-isogeny;
write it as `A^P`. These are coefficient-module presheaves on all `S`-schemes. Torsors over the
geometric base `S`, such as
`Spec L → Spec K` for a quadratic extension, are not inputs; the quadratic twist is the geometric
descent of A6.34 (Kisin–Pappas,
§4.4.5 and Lemmas 4.4.3, 4.4.6, pp. 191–193). Coefficient descent expresses the presheaf as an
idempotent image in a finite power of `A_D`. Use A6.26 to obtain a global idempotent, clear its
denominators by integers invertible in `D`, and split it in the global category using images and
finite quotients. Establish the displayed presheaf isomorphism, with its coefficient descent datum.
Changing the coefficient trivialization gives a natural presheaf isomorphism; full faithfulness
gives its global arrow and inverse, with their denominator bounds obtained by evaluation at the
identity. This gives independence of the trivialization. Restriction along `S′ → S` gives
`(A^P)_{S′} ≅ (A_{S′})^P` with the same natural presheaf isomorphisms. Over a general base an arbitrary
connected kernel is not smooth; the representability argument
(Moret-Bailly's finite trivialization of the torsor and the smoothness of the cut-out factor) is cited but
not carried out in the source and is part of this target. The API is `AbelianTwist.mk`,
`AbelianTwist.trivial` (a section of `P` gives a presheaf isomorphism and hence a global `D`-isogeny
with `A`), `AbelianTwist.baseChange` and `AbelianTwist.dual` (apply the same presheaf construction to
`A^∨` with its contragredient action and compare the representing schemes by a global `D`-isogeny).
*Needs:* A1.2, A3.3, A6.26;
SchemeAndStackFoundations Layer 1.

**Checks.**

- `AbelianTwist.trivial_torsor`: for `P = Z`, `A^P ≅ A` in the `D`-isogeny category.
- `AbelianTwist.scalar_torsor`: for `D = ℤ[1/2]`, `Z = μ₂` acting by `[±1]` and the nontrivial torsor
  `P = Spec D[i]`, trivialized over `D′ = ℤ[1/2, i]`, the invariants are `A_D(T) ⊗ i`, so `A^P ≅ A` in
  the `D`-isogeny category: `−1` acts by a scalar, and the resulting invertible `D`-module is trivial
  since `Pic(D) = 0`. A coefficient twist through scalars never produces a quadratic twist.
- `AbelianTwist.not_geometric`: the `{±1}`-torsor `Spec L → Spec K` of a separable quadratic extension
  is a torsor over `Spec K`, not over `Spec D`, and is not an input; the quadratic twist it defines is
  `QuadraticAbelianTwist` (A6.34).
- For `S = Spec ℂ`, an elliptic curve `E`, `D = ℤ[1/2]`, the trivial group `Z` and `P = Spec D`, take
  `T = ⨿_{n≥1} Spec ℂ` and points `x_n ∈ E(ℂ)` of exact order `2^n` (A3.2). The section
  `(x_n)_n/1` is nonzero in `(∏_n E(ℂ))[1/2]`, since no one power of `2` kills every coordinate,
  but restricts to zero on each component. Thus even the trivial twist presheaf is not Zariski
  separated on all test schemes. Its associated sheaf has different sections on this `T`.

### A6.29 Realizations, polarizations and level of twists

Prove `twistRealizations` for the representing abelian schemes and global arrows of A6.28, in the
category of A6.26. An additive `D`-linear realization `F` commuting with finite sums and with the
defining idempotent images satisfies `F(A^P) ≅ F(A)^P = (F(A) ⊗_D O_P)^Z`, through the contragredient
action when `F` is contravariant. In a sheaf-valued target, this tensor product is the tensor product
of sheaves and the invariants are its equalizer subobject; the formula is an isomorphism in that
target category, without asserting equality with sectionwise tensor products on every test scheme.
Use Mathlib's `CategoryTheory.Sheaf.monoidalCategory` for the module-valued sites, establishing its
sheafification and monoidal-localization hypotheses for each such target.
Compatibility with trivialization changes, base change and duality uses the global comparisons of
A6.28. Each listed realization has its source, coefficients and target.
(a) For a prime `ℓ` invertible on `S` and not inverted in `D`, so that `D ⊆ ℤ_(ℓ)`, the Tate realization
`T_ℓ` (A4.1) goes covariantly from the `D`-isogeny category of abelian schemes over `S` to lisse
`ℤ_ℓ`-sheaves on `S`. (b) When every prime inverted in `D` is invertible on `S`, equivalently `S → Spec ℤ`
factors through `Spec D`, `H¹_dR` (A4.3) goes contravariantly from the `D`-isogeny category to locally
free `O_S`-modules with Hodge filtration and, over smooth `S/k`, Gauss–Manin connection. Without the
hypothesis of (b) the unmodified de Rham bundle is not a realization of the `D`-isogeny category.

For polarization descent require additionally `P(ℝ) ≠ ∅`, equivalently that `P_ℝ` is a trivial
`Z_ℝ`-torsor. Let `λ` represent a weak `D`-polarization (A6.27), with
`z^∨ λ z = c(z) λ` for a character `c : Z → 𝔾_m` positive on `Z(ℝ)`.
Write `D(c)` for the rank-one coefficient representation with action by `c` and
`L_c = (D(c) ⊗_D O_P)^Z` for its descended invertible `D`-module.
The equivariant map `λ : A → A^∨(c)` descends, using contragredient duality, to an
`L_c`-valued symmetric `D`-isogeny on `A^P`. Choose a trivialization `L_c ≅ D` whose scalar
extension to `ℝ` sends the positive ray defined by evaluation at a point `x ∈ P(ℝ)` to `ℝ_{>0}`.
Such a trivialization exists since `D` is a localization of `ℤ`, so `L_c` is free of rank one.
The resulting symmetric `D`-isogeny represents a weak `D`-polarization of `A^P`.
Evaluation at `x` identifies it, over real coefficient Hom spaces on each geometric fibre, with
a positive scalar times the pullback of `λ`; the real ample cone of A6.15 detects positivity after
clearing denominators. Replacing `x` multiplies its orientation by a value of `c` on `Z(ℝ)`, hence
does not change it. Two positive trivializations differ by a positive unit of `D`, so the weak
class is independent of both choices and of the representative `λ`, compatibly with base change.
The unpolarized construction and the realization comparisons retain the scope of A6.28.

A twisted adelic level is the transported orbit: under a trivialization `g` both the level
subgroup and the `Z`-action change by conjugation. The proof applies `F` to the idempotent presentation
and the torsor cocycle, checking exactness for each listed realization
(Kisin–Pappas, §4.4.7 and Lemma 4.4.8, p. 193; Kisin, *Mod p points on Shimura varieties
of abelian type*, §§4.1.6–4.1.8 and Lemma 4.1.7, author PDF pp. 69–70;
Kisin–Shin–Zhu, §5.12.4, p. 174, supplies the real-triviality correction and real-cone argument;
the oriented coefficient line gives the positive-ray convention of A6.27). The de Rham comparison
transports the filtration and connection, not only the rank. *Needs:* A4.1, A4.3, A6.15, A6.27, A6.28.

**Checks.**

- `twistRealizations.deRham_rational`: for `D = ℚ`, `S = Spec 𝔽_p` and positive-dimensional `A`, `[p]`
  is invertible in the `D`-isogeny category while `[p]^* = 0` on the nonzero `H¹_dR(A/S)`
  (`AbelianH1dR.inseparable`), so `H¹_dR` does not extend; rationalizing it gives zero, not a
  rank-`2g` realization.
- `twistRealizations.deRham_prime_to_p`: over `𝔽_p` with `D = ℤ_(p)` the inverted primes are invertible
  on `S`, and `H¹_dR` is a realization of the prime-to-`p` isogeny category.
- `twistRealizations.tate_denominator`: for `D = ℤ[1/ℓ]`, `T_ℓ([ℓ]) = ℓ` is not invertible on `T_ℓ A`
  for positive-dimensional `A`, so `T_ℓ` is listed only for `ℓ` not inverted in `D`.
- For `D = ℚ`, `S = Spec ℂ`, `A = E²` with `End E = ℤ` and product principal polarization,
  let `μ₂` act by `diag(1, −1)` and `P = Spec ℚ(i)`, with conjugation on coefficients.
  The multiplier is `1` and `P` is trivialized by `ℚ(i)`, but `P(ℝ) = ∅`.
  The invariant multiplicity module has basis `e₁ ⊗ 1, e₂ ⊗ i`; its descended pairing is
  `diag(1, i)^t I₂ diag(1, i) = diag(1, −1)`. The unpolarized twist is rationally isogenous to
  `E²`, but no nonzero scalar makes this indefinite form a polarization.
- For the trivial torsor and `c = 1`, evaluation gives `L_c = D` and recovers the weak class of
  `λ`; a negative trivialization gives `−λ`, outside the positive cone when `dim A > 0`.
- Replacing a positive trivialization of `L_c` by twice itself preserves the weak class for
  `D = ℚ`; for `D = ℤ` two positive trivializations coincide, since its only positive unit is `1`.

### A6.30 Weil restriction

Prove `weilRestriction`. For a finite locally free morphism `S′ → S` and an `S′`-scheme `X`, the restriction
of scalars `Res_{S′/S}(X)(T) = Hom_{S′}(T ×_S S′, X)` is an fppf sheaf represented by an algebraic space
(AlgebraicModuli `ModuliDescent.weilRestriction`, `ModuliDescent.weilRestriction_algebraicity`), compatible with base change
(`ModuliDescent.weilRestriction_baseChange`). It is a scheme when every finite subset of each fibre of the composite `X → S′ → S` lies in an
affine open of `X`. This holds for quasi-projective varieties over fields and for abelian schemes:
after restricting to affine `S`, the finite scheme `S′` is affine, and A2.1(3) contains finite
sets spanning all `S′`-fibres over a point of `S` in one affine open. Covering `X` by affines whose restrictions do not cover is not
enough. Over a field, for `L/K` finite, `Res_{L/K}(X)` exists for quasi-projective `X` (Poonen, *Rational
points on varieties*, §4.6, Definition 4.6.1, p. 110, Proposition 4.6.3, Remarks 4.6.5–4.6.6,
pp. 111–112, and Exercise 4.8, p. 113; Stacks, Proposition 97.11.5, tag 05YF, and Lemma 97.11.2, tag
05YC). The general scheme criterion is Bosch–Lütkebohmert–Raynaud §7.6 Theorem 4, cited by Poonen and
not freely available; its proof in the affine-neighbourhood form is part of this target.
`Res_{S/S}(X) = X`; for `S′ = S ⊔ S`, `Res(X) = X₁ ×_S X₂`; `Res_{L/K} 𝔸¹ = 𝔸^{[L:K]}`. For every finite
`L/K`, `Res_{L/K} 𝔾_m` is the open subscheme of `𝔸^{[L:K]}` where the norm form of `L/K` is invertible,
with `K`-points `L^×`. For inseparable `L/K` it is not a torus: `L ⊗_K K̄` has a nonzero nilradical `N`,
and `1 + N` gives a nontrivial unipotent subgroup over `K̄`. For `K = 𝔽₂(s)` and `L = K(√s)`,
`L ⊗_K K̄ ≅ K̄[ε]/(ε²)`, and by base change `Res_{L/K} 𝔾_m` becomes `𝔾_m × 𝔾_a` over `K̄` through
`a + bε ↦ (a, b/a)`. The separable case, where it is a torus, is A6.31. *Needs:* A2.1; AlgebraicModuli Layer 3 §3.4.

### A6.31 Weil restriction along a separable extension splits geometrically

Prove `weilRestrictionSplits`. For `L/K` finite separable and an `L`-variety `X` with `Res_{L/K}(X)`
representable, `Res_{L/K}(X) ×_K K̄ ≅ ∏_{σ : L → K̄} X ×_{L,σ} K̄`; for `L/K` Galois with group `G`,
`Res_{L/K}(X)_L ≅ ∏_{σ ∈ G} σX`. `Gal(K̄/K)` acts by permuting the factors through its action on the
embeddings, compatibly with its action on each factor. Separability gives `L ⊗_K K̄ ≅ ∏_σ K̄`; base change
of restriction (A6.30) and the product decomposition give the formula (Poonen, Exercise 4.7, p. 113). For
inseparable `L/K`, `L ⊗_K K̄` is not a product of fields. For separable `L/K`, `Res_{L/K} 𝔾_m` is
therefore a torus of dimension `[L : K]`, split over `K̄` by the embeddings. For `L = ℚ(√2)` and `X = 𝔾_m`,
`Res(𝔾_m)_{ℚ̄} ≅ 𝔾_m × 𝔾_m` with conjugation swapping the factors. *Needs:* A6.30.

### A6.32 Weil restriction of abelian schemes

Prove `weilRestrictionAbelian`. (1) For `S′ → S` finite étale of constant degree `d` and an abelian scheme
`A/S′` of relative dimension `g`, `Res_{S′/S}(A)` is an abelian scheme over `S` of relative dimension `dg`.
(2) This fails for finite locally free maps: for `D = K[ε]/(ε²)` and an elliptic curve `E/K`,
`Res_{D/K}(E_D)` is the tangent bundle of `E`, isomorphic by translation to `E × Lie(E) ≅ E × 𝔾_a`, which is
not proper. The proof of (1): étale locally `S′ ≅ ⊔_{i=1}^d S`, so `Res(A) = ∏ A_i`; properness, smoothness,
geometric connectedness and the group structure descend along the étale cover; `Res(A)` is an algebraic
space (A6.30) and étale locally an abelian scheme, hence an abelian scheme by A2.1. For (2), `Res_{D/K}(X_D)`
is the first jet space (Poonen, Example 4.6.8, p. 112). For `L/K` finite
separable, `Res_{L/K}(A)` is an abelian variety of dimension `[L : K] dim A`. *Needs:* A1.1, A2.1, A6.30.

### A6.33 The Tate module of a Weil restriction

Prove `weilRestrictionTate`. For `L/K` finite separable, `A` over `L` and `ℓ` invertible, a choice of
`L ⊆ K^{sep}` gives a `G_K`-equivariant isomorphism
`T_ℓ(Res_{L/K} A) ≅ Ind_{G_L}^{G_K} T_ℓ(A) = ℤ_ℓ[G_K] ⊗_{ℤ_ℓ[G_L]} T_ℓ(A)`; another embedding changes it by the canonical isomorphism of induced
modules; for number fields `V_ℓ(Res_{L/K} A)` is the induced representation. Induction and coinduction agree
for the finite-index `G_L`. This field-level statement implies nothing about good reduction at ramified
places. The proof splits `L ⊗ K^{sep}` into the embedding-indexed product (A6.31), so the torsion is the
corresponding finite sum with `G_K` permuting embeddings with stabilizer `G_L`, and identifies it with the
finite-index induced module; the finite sum commutes with the inverse limit (Poonen, §4.6, p. 110). This is
the finite-index comparison only; general induction of Galois representations is not built here. For
`L = K`, induction along `G_K ⊆ G_K` gives the identity comparison on `T_ℓ A`; for `L/K` quadratic, `V_ℓ(Res A)` has
dimension `4 dim A`. *Needs:* A4.1, A6.31.

### A6.34 Quadratic twists

Define `QuadraticAbelianTwist A χ` for a possibly trivial continuous quadratic character `χ : G_K → {±1}` and
its associated quadratic étale `K`-algebra `L`, either a separable quadratic field extension or
`K × K`: descend `A_L` using inversion for the nonidentity deck transformation of the
quadratic étale cover, obtaining `A^χ`. On `G_K` this is the cocycle `σ ↦ [χ(σ)]`. Inversion
preserves every polarization, so `A^χ` keeps the polarization. `Res_{L/K}(A_L)` is isogenous over `K` to `A × A^χ`: over `L` the sum–difference map has matrix
`[[1, 1], [1, −1]]` and degree `2^{2g}`, including in characteristic `2` as a finite flat isogeny.
`A(L) ⊗ ℚ` decomposes into the `±` eigenspaces `A(K) ⊗ ℚ` and `A^χ(K) ⊗ ℚ`; whenever these are
finite-dimensional, `rank A(L) = rank A(K) + rank A^χ(K)` (Alpöge–Bhargava–Ho–Shnidman, *Rank stability in
quadratic extensions and Hilbert's tenth problem for the ring of integers of a number field*, §1, p. 1131,
and §4, pp. 1137–1138). The construction chooses an ample `N` on `A/K`, tensors it with `[−1]^*N`, and
uses the canonical exchange linearization of this symmetric ample bundle to descend
the projective group scheme with its inversion cocycle through
StableReduction Layer 2's effective étale descent of polarized schemes, computes the composite of the
sum–difference maps as `[2]`, and averages with `(1 ± σ)/2` on rational points; the eigenspace identity
needs no Mordell–Weil theorem. The API is `QuadraticAbelianTwist.mk`, `QuadraticAbelianTwist.overExtension`,
`QuadraticAbelianTwist.polarization` and `QuadraticAbelianTwist.restrictionIsogeny`. *Needs:* A3.1, A4.1,
A6.32; A2.8; StableReduction Layer 2 (effective étale descent of polarized schemes).

**Checks.**

- `QuadraticAbelianTwist.trivial`: for the trivial character, `L = K × K` and the twist is `A`.
- `QuadraticAbelianTwist.elliptic`: in characteristic different from two, for a Weierstrass elliptic curve `y² = f(x)` and `L = K(√d)`, the twist
  is `dy² = f(x)`.
- `QuadraticAbelianTwist.degree`: for `g = 1` the isogeny `Res_{L/K}(E_L) → E × E^χ` has degree `4`, not `2`.
- `QuadraticAbelianTwist.sign`: the anti-invariant eigenspace is `A^χ(K) ⊗ ℚ`, not a second copy of
  `A(K) ⊗ ℚ`.
- `QuadraticAbelianTwist.tate`: for `ℓ` invertible in `K`, `T_ℓ(A^χ) ≅ T_ℓ(A) ⊗ χ` as
  `Gal(K^{sep}/K)`-modules, since `A^χ(K^{sep})` is `A(K^{sep})` with `σ` acting by `χ(σ)σ`; this is the
  quadratic-character twist of the Tate representation, which the coefficient twists of A6.28 do not
  produce.

### A6.35 The abelian subvariety generated by a curve

Define `CurveGenerated C c̃₀` for a geometrically integral projective curve `C ⊆ A` over an algebraically
closed field, with normalization `C̃` and a point `c̃₀ ∈ C̃` over `c₀ ∈ C`: the image (A6.3) of the homomorphism
`Jac(C̃) → A` induced by `C̃ → A` and the base point `c̃₀` (JacobianChallenge Layer F's Albanese property,
Tau Ceti `IsAlbanese`). It is the smallest abelian subvariety containing `C − c₀`, independent of `c₀`, and
`C` generates `A` iff the map is surjective; the translate by `c₀` matters, since `C` need not contain zero
(Caro–Pasten, *A Chabauty–Coleman bound for surfaces*, §5.1, p. 16). The API is `CurveGenerated.mk`,
`CurveGenerated.minimal` (factorization through any abelian subvariety containing `C − c₀`),
`CurveGenerated.basepoint` and `CurveGenerated.generates_iff`. *Needs:* A3.1, A6.3; JacobianChallenge
Layers D, E and F; Tau Ceti `IsAlbanese`.

**Checks.**

- `CurveGenerated.translate`: for `C = a + (E × 0)` in `E × E`, the generated subvariety is `E × 0`, although `C`
  need not contain zero.
- `CurveGenerated.elliptic`: an elliptic curve embedded as a subgroup generates itself.
- `CurveGenerated.diagonal`: the diagonal elliptic curve in `E × E`, based at `(0, 0)`, generates
  the diagonal abelian subvariety, not the whole product.

### A6.36 The Matsusaka–Morikawa endomorphism

Define `Morikawa H C` for an ample `H` on `A` and a curve `C` generating `A` (A6.35), with `ν : Jac(C̃) → A` and
the principal polarization `λ_J` of the Jacobian: `α = ν ∘ λ_J^{-1} ∘ ν^∨ ∘ φ_H ∈ End A`. This agrees with
Morikawa's positive intersection-sum construction; a convention using `t_x^*` instead of translation by `x`
changes the sign. Prove that `α` is symmetric for the Rosati involution of `φ_H`, positive, with
`Tr α = 2(C · H)`, and that `P_α = Q²` with `Q ∈ ℤ[X]` monic of degree `g` and all roots positive real. The
proof compares the intersection-sum construction with the pull–push through the Jacobian using the
universal divisor and the Poincaré bundle, fixing the sign by the elliptic example; adjointness writes `α`
as `f f^†`, positive definite because `ν` is surjective; the trace formula restricts `c₁` to the curve; a
Rosati-symmetric operator on the symplectic Tate space has even characteristic multiplicities, so its
rational characteristic polynomial is a square, with integral monic square root (Caro–Pasten, equation
(5.1), Lemma 5.2 and its proof, pp. 16–17). The API is `Morikawa.mk`, `Morikawa.selfAdjoint`,
`Morikawa.trace` and `Morikawa.squarePolynomial`. *Needs:* A3.9, A6.11, A6.14, A6.35;
SchemeAndStackFoundations Layer 5 §5.3 (`Chow.c1`).

**Checks.**

- `Morikawa.elliptic`: for `C = A = E` and `deg H = d > 0`, `α = [d]`, `Q = X − d`, `Tr α = 2d` and `P = (X − d)²`.
- `Morikawa.nongenerating`: for `C = E × 0 ⊆ E²` the adjoint product has a zero eigenvalue; strict positivity
  needs generation.
- `Morikawa.sign`: the negative adjoint product has negative eigenvalues on an elliptic curve and fails the
  positive-root assertion.

### A6.37 The CM isotypic decomposition

Prove `cmIsotypic`. For a complex abelian variety with complex multiplication, complete reducibility gives a
product of powers of pairwise non-isogenous simple CM factors whose rational endomorphism algebras are CM
fields, and `End⁰` is the product of the corresponding matrix algebras. Multiplicities and CM types stay
visible: equality of CM fields does not identify simple factors. This is a characteristic-zero
statement, not one about reductions with larger endomorphism rings. The proof decomposes the rational
homology under a commutative semisimple CM algebra of dimension `2g` into rank-one character spaces with
their Hodge types (A5.5); an irreducible polarized CM Hodge summand has a CM field of endomorphisms, and
conjugate Hodge types determine isogeny only together with the type data (Tsimerman, §2.2, p. 382,
for CM types, primitive types and the isogeny class with fixed type). This target proves the
decomposition into simple CM factors and classifies their underlying irreducible rational Hodge
structures by CM fields with primitive types; polarizing forms remain additional data.
Lemma 4.1 supplies the separate full-level descent statement
A6.20. `Eⁿ` has `M_n(End⁰ E)`, not
a product of `n` copies of its CM field; a supersingular reduction can have a quaternion endomorphism
algebra and is outside the statement. *Needs:* A5.5, A6.5, A6.8.

### A6.38 The Hodge line bundle

Define `AbelianHodgeLine A` for an abelian scheme `π : A → S`: `ω_A = e^*Ω¹_{A/S}` (A1.3) and
`λ_H = det ω_A`, using the determinant of AlgebraicVectorBundles. Both commute with base change and
`λ_{A×B} = λ_A ⊗ λ_B`. For the Siegel family (A5.8) the transition factor of `λ_H` is `det(CΩ + D)` in the
cohomological Hodge frame. These line bundles descend to any polarized, PEL or Hilbert moduli functor once
that object and its universal family are given; no moduli stack and no algebraization theorem is built
here (Faltings–Chai I.6, pp. 29–30). The construction takes the determinant through the vector-bundle API,
differentiates the universal symplectic coordinate change (distinguishing the inverse transpose on fibre
coordinates from the covariant Hodge-frame transition) and takes determinants; base-change isomorphisms
and their cocycle give descent. The API is `AbelianHodgeLine.mk`, `AbelianHodgeLine.baseChange`,
`AbelianHodgeLine.product` and `AbelianHodgeLine.analyticFactor`. *Needs:* A1.3, A5.8; AlgebraicVectorBundles
L0C.

**Checks.**

- `AbelianHodgeLine.elliptic`: for an elliptic family `λ_H` is its rank-one invariant-differential line.
- `AbelianHodgeLine.zero`: dimension zero gives `O_S`.
- `AbelianHodgeLine.product`: for `E × E′`, `λ_H = ω_E ⊗ ω_{E′}`.
- `AbelianHodgeLine.not_theta`: `λ_H` is not a chosen theta line bundle on `A` and descends without a theta
  characteristic.

### Examples

For an elliptic curve `E/𝔽_q` with `#E(𝔽_q) = q + 1 − a`: `deg π = q`, `deg(1 − π) = #E(𝔽_q)`, `P_π = X² − aX + q`,
`π^†π = q`, and `End⁰` is an imaginary quadratic field or a quaternion algebra. For `A = E × E` over `ℂ` with
`End E = ℤ`: `End⁰ A = M₂(ℚ)`, the Rosati involution of the product polarization is transposition,
`Tr(αα^†)` is twice the sum of squares of the entries, `NS(A)` has rank `3`, and the principal polarizations
correspond to positive definite unimodular `2 × 2` integral matrices up to `GL₂(ℤ)`-congruence, of which there
is a single class, that of the identity, so the product polarization is the only principal polarization up
to isomorphism. For `L/K` quadratic and `E/K`, `Res_{L/K}(E_L) ∼ E × E^χ` by an isogeny of degree `4`.

### Dependencies

A0–A5; Tau Ceti `AbelianVariety`, `End`, `IsIsogeny`, `prod`, `ClosedSubgroupScheme`, `IsAlbanese`,
`leftComp`, `rightComp`; JacobianChallenge Layers D, E and F; AlgebraicModuli Layers 1–3, 5 and 7;
SchemeAndStackFoundations Layer 1, Layer 5; StableReduction Layer 2; AlgebraicVectorBundles L0C; Mathlib polynomial, matrix,
semisimplicity and `p`-adic libraries.

## Worked examples

- **An elliptic curve over a finite field.** For `E/𝔽_q` with trace `a`: A6.1 gives `deg π = q` and
  `deg(1 − π) = #E(𝔽_q) = q + 1 − a`; A6.10–A6.11 give `P_π = X² − aX + q` on every `V_ℓ E`, `ℓ ∤ q`; A3.9 gives
  `π^† = V` (Verschiebung) and A6.21 `π^†π = q`; A6.14 gives `Tr(ππ^†) = 2q > 0`. If `E` is ordinary, A4.5 gives
  `E[p^∞]_{𝔽̄_q} ≅ μ_{p^∞} × ℚ_p/ℤ_p` and A4.10 its deformations `q ∈ 1 + m_R`; if supersingular, `End⁰ E_{𝔽̄_q}` is
  the quaternion algebra ramified at `p` and `∞` (A6.4) and `End E_{𝔽̄_q}` has rank `4` (A6.7).
- **A product of two elliptic curves over `ℂ`.** For `A = E × E` with `End E = ℤ`: `A^∨ ≅ A` by the product
  polarization (A2.2, A2.5), `End⁰ A = M₂(ℚ)` (A6.8) with Rosati involution the transpose (A3.9), `ρ(A) = 3`
  (A6.16), the ample cone is the positive definite symmetric real `2 × 2` matrices (A6.15), and the lattice is
  `Λ_E ⊕ Λ_E` with the orthogonal sum of the two Riemann forms (A5.1–A5.2). The diagonal and antidiagonal
  are complementary abelian subvarieties meeting in `E[2]^{diag}` (A6.5).
- **A Jacobian of genus two.** For a smooth genus-two curve `C` in characteristic `≠ 2` with Jacobian `J`:
  `J[2]` is the even-subset model of the six Weierstrass points with pairing `(−1)^{|{i,j} ∩ {k,l}|}` (A3.12);
  the principal polarization has graph bundle of degree `2²·2! = 8` on the surface, so `h⁰(M³) = 36`
  (A2.6: `d(6r)^g` with `d = 1`, `r = 1`, `g = 2`); and over a `p`-adic ring with `p > 2` a principally
  polarized lift of `J` with prescribed `p`-torsion comes from a lift of `C` (A4.12, A4.14).

## Downstream consumers

- The A0.1 points API supplies **NeronModelsAndSemistableAbelianVarieties** §§1.5, 1.8, 1.10
  with point groups and pullback comparisons of the underlying group schemes, and **ModularCurvesPartII** with
  homomorphisms on relative elliptic-curve points. **RelativeJacobiansAndIntegralCurveModels**
  uses the same interface for relative Jacobians and reduction on points.
- **PELModuli**, **ShimuraVarieties**, **ShimuraCompactifications**, **HilbertModularVarietiesAndShimuraCurves**,
  **AutomorphicBundles** and **AlgebraicModularFormsAndSerreWeights** use polarizations and their graph
  bundles (A2.5–A2.6), full level structures and level rigidity (A3.8, A6.18), the Siegel family (A5.8),
  coefficient Hom, localized isogeny categories, weak polarizations and torsor twists (A6.22–A6.29) and the
  Hodge line bundle (A6.38).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory** imports the Barsotti–Tate
  interface (A4.5), the shared `TruncatedBT` carrier with its basic operations (A4.5a),
  the degree-one divided-power realization (A4.6), and the contravariant
  Dieudonné crystal, variance, twists and Grothendieck–Messing equivalence (A4.CR.7.2); **IgusaVarietiesAndTorsionConcentration**
  and **HodgeTateAndCanonicalSubgroups** use the ordinary Serre–Tate coordinates and the canonical
  Frobenius (A4.10–A4.11).
- **ArithmeticGaloisRepresentations** uses the Tate local system (A4.1), the realization conventions (A5.7)
  and the Tate module of a Weil restriction (A6.33); **PotentialModularityAndCompatibleSystems** and
  **EllipticCurveModularityPartIIGL2TypeAbelianVarieties** use the finite-level lifting theorems (A4.12–A4.14)
  and the trace and degree through subfields (A6.12).
- The abelian torsion, Tate-module and algebraic-trace inputs owned here are consumed downstream by
  **InverseGaloisAndArithmeticFundamentalGroups** §IG.0.T1 / `VanishingCycles.curveEndomorphismTrace`.
  Supplied by AbelianSchemesAndArithmeticModuli §A3.2 / `multiplicationAndDensity`.
  Supplied by AbelianSchemesAndArithmeticModuli §A4.1 / `AbelianTate`.
  Supplied by AbelianSchemesAndArithmeticModuli §§A6.10–A6.11 / `End.trace`, `charpolyTate`.
  These inputs apply to Jacobians with invertible `ℓ` at every finite coefficient level;
  the curve `H¹`–Jacobian comparison and graph–diagonal formula belong to
  `VanishingCycles.curveEndomorphismTrace`. A6.10–A6.11 use degree polynomials, finite-rank
  Hom and linear algebra on `V_ℓ A`, independently of cohomological trace formulas.
  A4.4's geometric foundations: Supplied by EtaleCohomologyFoundations §F.3 /
  `VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`; §F.2 /
  `VanishingCycles.etaleKunneth`; §F.4 / `VanishingCycles.classicalAdicRealization`,
  `VanishingCycles.adicFiniteness`.
  They apply to proper abelian varieties over algebraically closed `k` with invertible `ℓ`
  and the normalized constant tower; the finite curve trace theorem does not require A4.4.
- **DeligneWeightsAndPurity**, **SmallRamificationAndAbelianVarietyBaseCases** and
  **FaltingsFinitenessAndIsogenyTheorems** use degrees and characteristic polynomials (A6.1, A6.10–A6.11),
  Rosati positivity (A6.14), Frobenius (A6.21) and the finiteness of polarized automorphisms (A6.18).
- **ArithmeticStatistics** uses quadratic twists and Weil restriction (A6.30–A6.34);
  **AnabelianGeometryAndNonabelianChabauty** and the Chabauty–Coleman consumers use curve-generated
  subvarieties and the Matsusaka–Morikawa endomorphism (A6.35–A6.36); **MordellLawrenceVenkatesh**,
  **GrossZagierAndArithmeticHeights** and the height consumers use projective presentations and nef
  normalized line bundles (A2.8–A2.9); **ComplexMultiplicationAndExplicitReciprocity** uses the CM isotypic
  decomposition (A6.37); **NeronModelsAndSemistableAbelianVarieties** §1.8 uses the relative Weil
  extension theorem (A1.8) to identify an abelian scheme over a connected Dedekind base with its
  marked Néron model. Its further relative Hom applications use A6.25.

## References

- [Bosch–Lütkebohmert–Raynaud] S. Bosch, W. Lütkebohmert and M. Raynaud, *Néron Models*,
  Ergebnisse der Mathematik (3) 21, Springer, 1990. Printed pages.
- [Faltings–Chai] G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Ergebnisse der
  Mathematik (3) 22, Springer, 1990. Printed pages.
- [Milne 2008] J. S. Milne, *Abelian Varieties*, course notes, version 2.00, 2008,
  <https://www.jmilne.org/math/CourseNotes/AV.pdf>. Printed pages (PDF page minus 6).
- [Milne 2022] J. S. Milne, *Abelian Varieties*, revised 2022 version of the 1986 article in *Arithmetic
  Geometry* (Cornell–Silverman), <https://www.jmilne.org/math/xnotes/AVs.pdf>. Pages of the standalone PDF.
- [Conrad, *Polarizations*] B. Conrad, *Polarizations*, Stanford VIGRE seminar notes, 2004,
  <https://math.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf>.
- [Conrad–Feng] B. Conrad, *Abelian Varieties*, course notes by T. Feng, 2015,
  <https://math.berkeley.edu/~fengt/249C.pdf>.
- [Conrad, *Gross–Zagier revisited*] B. Conrad, *Gross–Zagier revisited*, in *Heegner Points and
  Rankin L-Series*, MSRI Publications 49 (2004), 67–163, §7, Theorems 7.2 and 7.5, pp. 101–103,
  <https://library.slmath.org/books/Book49/files/05conrad.pdf>. Printed pages.
- [Chai–Conrad–Oort] C.-L. Chai, B. Conrad and F. Oort, *Complex Multiplication and Lifting
  Problems*, Mathematical Surveys and Monographs 195, AMS, 2014, §1.7.4, Serre's tensor construction.
- [Stanford VIGRE notes] *Complex theory of abelian varieties*, Stanford VIGRE seminar notes, 2004,
  <https://math.stanford.edu/~conrad/vigregroup/vigre04/abvaran.pdf>.
- [Kass] J. L. Kass, *Notes on abelian schemes*, <https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf>.
- [Olsson] M. Olsson, *Compactifications of moduli of abelian varieties: an introduction*, in *Current
  Developments in Algebraic Geometry*, MSRI Publications 59, 2012, pp. 295–348,
  <https://library.slmath.org/books/Book59/files/65olsson.pdf>.
- [Oort] F. Oort, *Finite group schemes, local moduli for abelian varieties, and lifting problems*,
  Compositio Math. 23 (1971), 265–296, <https://www.numdam.org/article/CM_1971__23_3_265_0.pdf>.
- [Katz] N. M. Katz, *Serre–Tate local moduli*, in *Surfaces algébriques*, Lecture Notes in Math. 868
  (1981), 138–202, <https://web.math.princeton.edu/~nmk/old/serretatelocmod.pdf>.
- [Maculan] M. Maculan, *The universal vector extension of an abeloid variety*, arXiv:2212.05848v2.
- [Illusie] L. Illusie, *Grothendieck at Pisa: crystals and Barsotti–Tate groups*,
  <https://www.imo.universite-paris-saclay.fr/~luc.illusie/Illusie-Pisa5.pdf>.
- [Illusie 1985] L. Illusie, *Déformations de groupes de Barsotti–Tate (d'après A. Grothendieck)*,
  Astérisque 127 (1985), 151–198, <https://www.numdam.org/item/AST_1985__127__151_0/>.
- [Stix] J. Stix, *A course on finite flat group schemes and p-divisible groups*, revised
  18 September 2012, §8.5.2, pp. 45–47,
  <https://www.math.uni-frankfurt.de/~stix/skripte/STIXfinflatGrpschemes20120918.pdf>.
- [Anschütz–Le Bras] J. Anschütz and A.-C. Le Bras, *Prismatic Dieudonné theory*, arXiv:1907.10525v4.
- [Farb–Kisin–Wolfson] B. Farb, M. Kisin and J. Wolfson, *Essential dimension via prismatic cohomology*,
  Duke Math. J. 173 (2024), arXiv:2110.05534v2.
- [Xie–Yuan] J. Xie and X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*,
  arXiv:2108.09722v1.
- [Gao–Habegger] Z. Gao and P. Habegger, *Heights in families of abelian varieties and the geometric
  Bogomolov conjecture*, arXiv:1801.05762v3.
- [Caro–Pasten] J. Caro and H. Pasten, *A Chabauty–Coleman bound for surfaces*, arXiv:2102.01055v2.
- [Lipnowski–Tsimerman] M. Lipnowski and J. Tsimerman, *How large is `A_g(𝔽_q)`?*, arXiv:1511.02212v1.
- [Voight] J. Voight, *Quaternion algebras*, v0.9.15, §3.5, pp. 36–37, and §8.4, pp. 116–118,
  <https://jvoight.github.io/quat/quat-book-v0.9.15.pdf>.
- [Kisin–Pappas] M. Kisin and G. Pappas, *Integral models of Shimura varieties with parahoric level
  structure*, Publ. Math. IHÉS 128 (2018), 121–218.
- [Kisin] M. Kisin, *Mod p points on Shimura varieties of abelian type*, J. Amer. Math. Soc. 30 (2017),
  819–914; author preprint, <https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf>.
- [Kisin–Shin–Zhu] M. Kisin, S. W. Shin and Y. Zhu, *The stable trace formula for Shimura varieties
  of abelian type*, §5.12.4, printed p. 174, <https://math.berkeley.edu/~swshin/KSZ.pdf>.
- [Kisin–Madapusi Pera–Shin] M. Kisin, K. Madapusi Pera and S. W. Shin, *Honda–Tate theory for Shimura
  varieties*, Duke Math. J. 171 (2022), 1559–1614, <https://math.berkeley.edu/~swshin/HT.pdf>.
- [Tsimerman] J. Tsimerman, *The André–Oort conjecture for `A_g`*, Ann. of Math. 187 (2018), 379–390.
- [Pilloni] V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weight*, Duke
  Math. J. 169 (2020), 1647–1807; author PDF.
- [Boxer–Calegari–Gee–Pilloni] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity theorems for
  abelian surfaces*, arXiv:2502.20645v1.
- [Charles] F. Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin's trick for
  K3 surfaces, and the Tate conjecture*, Ann. of Math. 184 (2016), 487–526.
- [Alpöge–Bhargava–Ho–Shnidman] L. Alpöge, M. Bhargava, W. Ho and A. Shnidman, *Rank stability in
  quadratic extensions and Hilbert's tenth problem for the ring of integers of a number field*, Invent.
  Math. 243 (2026), 1129–1139.
- [Poonen] B. Poonen, *Rational Points on Varieties*, Graduate Studies in Mathematics 186, AMS, 2017;
  author's version, <https://math.mit.edu/~poonen/papers/Qpoints.pdf>.
- [Stacks] The Stacks Project, <https://stacks.math.columbia.edu>: tags 0BEV (Lemma 33.45.9), 081I
  (Lemma 29.26.16), 052A (Proposition 29.28.1), 02L2 (Lemma 35.23.17),
  047P (Lemma 39.8.4), 047N (Lemma 39.8.2), 05YF (Proposition 97.11.5), 05YC
  (Lemma 97.11.2), 0D24 (§99.11), 0F14 (Lemma 59.97.2), 0A1H (Lemma 36.30.1).
