# Roadmap: toroidal compactifications and boundary geometry

**Summary.** This roadmap compactifies Shimura varieties and their integral models toroidally, and
describes the geometry at the boundary that automorphic forms, their `q`-expansions and Hecke
operators depend on. It is Part II of AnalyticToricGeometry: it takes that roadmap's lattices, cones,
dual monoids and finite fans over `ℂ` and makes them work over every commutative ring, over a base
carrying a torus torsor, and for the infinite cone systems that an arithmetic group permutes with
finitely many orbits (Layer C0). On that toric foundation it builds the mixed boundary data of a pure
Shimura datum and its cusp labels (C1), Pink's toroidal compactification in characteristic zero with
its algebraization, its map to the Baily–Borel compactification and its canonical model over the
reflex field (C2, with general data in C2.general), refinements, level and Hecke maps and the
independence of coherent cohomology from the choice of cone system (C3, C3.general), and the relative
theory of degenerating abelian schemes of Mumford, Faltings–Chai and Lan (C4). It then constructs, at
primes where a PEL datum has good reduction, the smooth proper integral toroidal compactification,
the integral minimal compactification as the Proj of the Hodge section algebra, the Fourier–Jacobi
expansion of Hodge-line sections, normalizations and normalized blow-ups at higher `p`-level, and the
Koecher principle with arbitrary coefficients (C5). Finally it carries out Dimitrov's construction of
integral toroidal and minimal compactifications of Hilbert modular varieties at every prime not
dividing the tame level, ramified primes and `p = 2` included, with the arithmetic Koecher principle,
the `q`-expansion principle, cusp ideals, ordinary Hasse neighbourhoods of the boundary and the
comparison with compactified modular curves (C6).

We want this roadmap because every arithmetic use of automorphic forms on a noncompact Shimura variety
passes through a compactification: the definition of holomorphic and cuspidal forms with integral or
torsion coefficients, Koecher's principle, the `q`-expansion principle used to prove congruences, the
Hasse invariant and canonical subgroups near the cusps, the Hodge line and its heights, and the
higher Hida and Coleman theories of Boxer–Pilloni and Boxer–Calegari–Gee–Pilloni all take place on
toroidal and minimal compactifications and need exact control of their boundary charts. Every object
keeps its full structure: coefficient rings may be nonreduced, scheme-theoretic strata keep their
nilpotents, the union of boundary divisors and the intersection of boundary branches have different
ideals, the arithmetic action keeps its ineffective kernel, and finite normalizations, refinements and
normalized blow-ups are distinct constructions.

The principal references are Pink's dissertation for mixed Shimura data and the characteristic-zero
construction, Lan's book and his 2017 paper for integral PEL compactifications, Faltings–Chai for
degenerations and the minimal compactification, Dimitrov and Dimitrov–Tilouine for Hilbert modular
varieties, and the papers of Pilloni, Boxer–Pilloni, Bijakowski–Pilloni–Stroh, Calegari–Geraghty,
Boxer–Calegari–Gee–Pilloni and Birkbeck–Heuer–Williams for the inputs of their applications. Source
labels refer to the editions listed in the references, and page numbers follow those editions.
`Suggested.lean` states two headline theorems against the pinned Mathlib and Tau Ceti:
`HilbertCusp.bounded_cusp_support_is_positive` (C6.5) and
`proper_flat_globalFunctions_baseChange` (the general scheme theorem of C6.53).
The compactification and degeneration theorems need the geometric objects specified in the layers
below; their missing carriers are identified in the Lean module docstring. This README is the
specification.

| Layer | Title | Headline targets |
| --- | --- | --- |
| C0 | Admissible fans and relative torus embeddings | `FaceProjection.faceProjection`, `faceQuotientEquiv`, `torusEmbedding`, `stratumQuotientIso`, `ArithmeticFan`, `exists_smoothProjective_refinement`, `finiteFanScheme`, `boundaryUnion_ideal`, `characterDecomposition` |
| C1 | Rational boundary and mixed data | `MixedBoundaryDatum`, `BoundaryMHS`, `BoundaryTorsor`, `CuspLabel`, `finite_overlap` |
| C2 | Toroidal gluing in characteristic zero | `PartialBoundaryChart`, `ToroidalSpace`, `compact_of_complete`, `algebraization`, `toMinimal`, `ToroidalCanonicalModel`, `MixedShimura.canonicalModel_exists` |
| C2.general | General-data completion | `ToroidalCanonicalModel.general` |
| C3 | Refinements and Hecke maps | `ToroidalRefinement`, `ToroidalHeckeSpan`, `subdivision_structureSheaf`, `pushforward_boundaryIdeal`, `cohomology_iso` |
| C3.general | General-data maps | `ToroidalCanonicalModel.general_functorial` |
| C4 | Degenerations of polarized abelian schemes | `SemiAbelianScheme`, `TorusExtension.classification`, `PolarizedDegenerationData`, `MumfordDegeneration`, `UniversalDegeneration`, `hom_extend`, `SemiAbelianTateModule`, `hasse_det`, `KlingenToroidalCorrespondence`, `GroupScheme.verschiebung` |
| C5 | Integral PEL compactifications | `GoodCuspModel`, `IntegralToroidalModel`, `strata_detect_geometricComponents`, `hodgeLine_semiample`, `HodgeLineFJ`, `IntegralMinimalModel`, `NormalizedToroidalModel`, `ProjectiveToroidalModel`, `koecher`, `hodgeLine_generated` |
| C6 | Hilbert and modular specializations | `HilbertCusp.bounded_cusp_support_is_positive`, `CyclotomicPhase.tracePhase`, `HilbertModular.koecher`, `toroidal_exists`, `minimal_contraction`, `qExpansion_injective`, `boundaryIdeal_pushforward`, `boundary_ordinary`, `FormalGluing.effective` |

## Scope and ownership

**Owned here.** The face projection of a monoid algebra onto a face submonoid with its kernel,
quotient and coefficient-change laws; the character decomposition of a split-torus torsor; relative
torus embeddings of torsors, their face charts, regular coordinates and scheme-theoretic strata;
toric schemes of finite fans over arbitrary commutative rings with base change, the support
criterion for properness of relative toric maps, the integral boundary union and its completion, and
finite toric maps for a change of lattice; arithmetic cone systems with their common and smooth
projective refinements; toric acyclicity of subdivisions for the structure sheaf and the boundary
ideal over any coefficient ring. Mixed boundary data of pure Shimura data, boundary mixed Hodge
structures, boundary torus-and-abelian torsors, cusp labels, effective stabilizers with finite
overlap and the incidence of positivity cones; canonical models of the mixed boundary Shimura
varieties. Partial compactifications of boundary torsors, Pink's analytic toroidal compactification
with its normality, compactness, smoothness and normal crossings, algebraization, map to the minimal
compactification and canonical model, for abelian-type and general data. Refinement, level, datum
and Hecke maps of toroidal models, the independence of coherent and cuspidal cohomology from the
cone system, and its completed local form. Character sheaves, Hodge bundles, Tate modules and the
boundary Hasse determinant on the supplied semi-abelian family carrier; the nonaffine extension of
the supplied flat affine Frobenius–Verschiebung API; torus extensions, polarized degeneration data,
Mumford's construction and the degeneration equivalence over complete normal bases; universal
degenerations on cusp charts, extension of homomorphisms, endomorphisms, level structures and
isogenies across the boundary, the Tate curve comparison with logarithmic Kodaira–Spencer, and the
compactified Klingen correspondence of the Siegel threefold. Integral toroidal and minimal
compactifications of PEL Shimura varieties at good primes, their strata, logarithmic
Kodaira–Spencer, Hodge-line semiampleness (including the general generation theorem for semi-abelian
families and the isotriviality criterion on curves), Fourier–Jacobi expansions of Hodge-line
sections, quasi-projectivity of the moduli space, higher-level normalizations and normalized
blow-ups, formally canonical sheaves, Koecher principles, cyclic level covers, the canonical bundle
of a Siegel threefold and good-reduction boundary geometry. The arithmetic of Hilbert cusps (units,
total positivity and cyclotomic trace phases), cusp data, lattices and stabilizers, admissible
Hilbert fans, the formal gluing theorem of Rapoport and Dimitrov, integral toroidal and minimal
Hilbert compactifications with their semi-abelian family, Hodge line, cusps, boundary fibres,
weights, `q`-expansions, coefficient descent and cusp ideals, the comparison with Deligne–Pappas
models, the boundary Hasse ideal and ordinary neighbourhoods, finite-level maps, and the degree-one
comparison with compactified modular curves.

**Built in Tau Ceti and cited.**

- *The Tau Ceti library at the pin.* The toric carriers of `TauCeti/Geometry/Toric/Algebraic`
  (`IsIntegralLattice`, `IsToricCone`, `IsRegularCone`, `TauCeti.Toric.Fan` with `TauCeti.Toric.Fan.ext`);
  split tori `TauCeti.SplitTorus.groupScheme`; total positivity `NumberField.IsTotallyPositive` and
  `NumberField.isTotallyPositive_iff` (`TauCeti/NumberTheory/NumberField/TotallyPositive`); mixed Hodge
  structures `TauCeti.Hodge.MixedHodgeStructure` with `gradedHodgeStructure`, morphisms and strictness
  (`TauCeti/Geometry/Hodge/Mixed`).
- *The Tau Ceti library at the pin, geometric constructions.* Affine toric schemes `affineToricScheme` over `ℂ` with their face
  localizations, the fan scheme `Fan.algebraicRealization` over `ℂ`, the torus coaction, and the
  relative spectrum `TauCeti.AlgebraicGeometry.relativeSpec` of quasi-coherent algebras (`TauCeti/AlgebraicGeometry/RelativeSpec/Functor`).
  The toric schemes there have complex coefficients; C0.16 adds arbitrary coefficient rings by base
  change from `ℤ` and agrees with them over `ℂ`.
  `TauCeti.SplitTorus.mapValue_frobenius_eq_comp_powEnd` already computes Frobenius on split-torus
  points; C4.18 extends the flat affine Frobenius–Verschiebung API to nonaffine flat finitely presented groups. The field theorem
  `TauCeti.AlgebraicGeometry.appTop_bijective_of_section` in
  `TauCeti/AlgebraicGeometry/RationalPoint/Basic` assumes an integral scheme and a rational point;
  C6.53 instead treats relative boundary fibres and arbitrary base change, without a section.
- *TauCetiRoadmap.AlgebraicVectorBundles.* Layers L0B–L2B supply finite locally free sheaves, their
  determinants, symmetric algebras, relative spectra and geometric bundles. C0.21 adds the character-graded algebra
  of a torus torsor, whose multiplication relates different invertible weight sheaves.
- *TauCetiRoadmap.EllipticCurves* and *ModularCurves* Layer 7 already treat elliptic Frobenius and
  Verschiebung; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.1 supplies the flat affine API,
  and C4.18 extends it to nonaffine flat finitely presented commutative groups.
- *TauCetiRoadmap.AnalyticToricGeometry.* Layer 0 (the algebraic toric supplier: lattices, cones,
  rays, regular cones, fans, dual semigroups, face localizations and the fan scheme), Layer 2 (affine
  analytic charts of regular cones), Layer 3 (finite-fan analytic gluing), Layer 4 (torus actions,
  strata and the boundary) and Layer 5 (toric maps and the support criterion for properness). This
  roadmap never restates them; its charts specialize to them over `ℂ`.
- *TauCetiRoadmap.ReductiveGroups.* Layer 7 (parabolic subgroups, unipotent radicals and Levi
  quotients over `ℚ`).
- *TauCetiRoadmap.ModularCurves.* Layer 10 (compactified curves `X_H` over `ℤ[1/N]` for prime `N ≥ 5`
  and diamond subgroups `H`, with cusps and widths), used only in C6.52.

*Suppliers in other roadmaps.* The exact contracts are in the next section but one. Scheme and
algebraic-space foundations (relative Proj, descent, algebraic spaces and quotients,
coherent cohomology, formal schemes and Stein factorization) are SchemeAndStackFoundations;
relative spectra and their base change are AlgebraicVectorBundles L1A–L1B; complex
analytic spaces with nilpotents are ComplexComparisonPartII §C−1.1; Artin
approximation is AlgebraicModuliForArithmeticGeometry Layer 6; coherent analytification, GAGA, Chow's theorem and Remmert's theorems are
ComplexComparisonPartII; noetherian formal geometry and proper GAGA are AdicSpacesPartIII; rigid and adic
analytification are AdicSpacesPartII Layer R1; reduction theory and cusps of arithmetic groups are AdelicAlgebraicGroups;
pure Shimura data are ShimuraVarieties §P.1, with the variations and additional axioms of
ShimuraData Layers 3–4; the analytic and algebraic towers, rational boundary components,
Baily–Borel compactifications, reciprocity and canonical models are ShimuraVarieties; abelian schemes,
duals, polarizations, theta groups, Tate modules and complex uniformization are
AbelianSchemesAndArithmeticModuli; Néron models, semistable reduction, the Raynaud extension and rigid
uniformization are NeronModelsAndSemistableAbelianVarieties; PEL moduli problems and their
normalizations at higher level are PELModuli; the Hasse invariant of a truncated Barsotti–Tate group is
FiniteFlatGroupsAndIntegralPadicHodgeTheory; inverse limits of compact coefficients are
ArithmeticGaloisDuality; Hilbert–Blumenthal moduli, Deligne–Pappas models, the tame polarization group
and level structures are HilbertModularVarietiesAndShimuraCurves; the Tate curve, cusp parameters and
compactified coarse modular curves are ModularCurvesPartII.

*Downstream ownership.* Automorphic vector bundles, their canonical and subcanonical extensions, automorphic
forms with general coefficients, their Fourier–Jacobi expansions and geometric Hecke operators are
AutomorphicBundles, which builds on this roadmap (it uses the Hodge bundle of C4.1, the refinement
comparison C3.9, the formally canonical sheaves of C5.21, the scalar expansions of C5.15 and the
component detection of C5.10). Canonical subgroups, their radii, the modified integral lattices of
differentials and overconvergent forms are HodgeTateAndCanonicalSubgroups, which uses C4.15 and
C6.43–C6.49. Igusa towers and their partial compactifications, perfectoid Shimura varieties, étale
cohomology of Shimura varieties, heights on moduli spaces and higher Hida theory use C3.10, C5.17–C5.18
and C5.30 and are built in their own roadmaps. Formal, adic and perfectoid completions of the toric
schemes of C0.16 over nonarchimedean fields belong to the nonarchimedean development of
AnalyticToricGeometry, which builds on C0.16. Moduli interpretations of the normalized models at
parahoric level are not used and are not constructed here.

## Conventions

- `R` is a commutative ring, possibly zero or nonreduced, unless a statement assumes more. `R[P]` is
  Mathlib's `AddMonoidAlgebra R P` with finitely supported coefficients and monomials `e_p`.
- A face submonoid `F ⊆ P` satisfies: `a + b ∈ F` if and only if `a ∈ F` and `b ∈ F`. Face projection
  never reduces `R`.
- In a regular chart `R[x_1, …, x_r, y^{±1}]`, the union of the boundary divisors is cut out by
  `x_1⋯x_r` and the intersection of the components in `J` by `(x_j : j ∈ J)`; these ideals are never
  identified. The ideal of a closed stratum is the off-face monomial ideal, not its radical.
- Cones are rational polyhedral, salient and closed, on the common lattice carrier of
  AnalyticToricGeometry. Lan's relatively open cones give the same dual monoids. Completeness of an
  arithmetic system means that its support is the rational closure of the positivity cone; local
  finiteness is required on the open positivity cone, never at the origin. Arithmetic systems have
  finitely many orbits but possibly infinitely many cones. For Shimura boundary data each positivity
  cone and fan is indexed by a connected component `X⁰` of the ambient domain and its corresponding
  component `X_1⁰` of the boundary cover. Write `C = C(X⁰,P_1)` and `C* = C*(X⁰,P_1)`;
  rational conjugation transports the components, central lattices, cones and fans together.
- Arithmetic groups act through their effective quotient on cones; the ineffective kernel is kept in
  the torsor and stack models. Normal crossings is a local statement; global simple normal crossings
  needs Pink's extra condition 7.12(∗). Non-neat levels are treated as quotient stacks, with coarse
  spaces stated separately.
- Formal completion, étale gluing and analytic or adic realization use their own carriers and
  comparison maps; completion is not commuted with arbitrary tensor products or inverse limits, and
  normality of a generic fibre is never transferred to a special fibre.
- The Hodge bundle of a semi-abelian scheme `G/S` is `E = e^*Ω¹_{G/S}` and `ω = det E`. The Tate curve
  has invariant differential `du/u` and base parameter `q`; Kodaira–Spencer sends `(du/u)^{⊗2}` to `dq/q`.
- For a Hilbert cusp, `f^* = f⁻¹d⁻¹`, `X = cbb′` is the character lattice, characters pair with
  cocharacters by the trace, and the linear part of cusp-unit pullback is `ξ ↦ u²εξ`.
  The uniformization phase is `q^ξ ↦ ζ_e^{e·Tr(ξx)} q^ξ`.
- Good-prime PEL models (C5.3), finite normalizations at higher level (C5.19) and normalized blow-ups of
  minimal models (C5.31) are three different constructions. Hilbert models at primes dividing the
  discriminant come from C6, never from C5.
- Cross-roadmap references use the named roadmap's sections: SchemeAndStackFoundations Layers 0–4;
  AdicSpacesPartII Layer R1; AdicSpacesPartIII Layers F0, R2 and R3;
  AbelianSchemesAndArithmeticModuli A0–A6; PELModuli M0–M6;
  HilbertModularVarietiesAndShimuraCurves H0–H5; ShimuraVarieties §§P.1–P.3 and Layers 0–8;
  ShimuraData §1.1 and Layers 3–4; NeronModelsAndSemistableAbelianVarieties Layers 1–3;
  ModularCurvesPartII Layers 3–9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2;
  ArithmeticGaloisDuality R02.1; ComplexComparisonPartII C−1–C4. Internal references use `Ck.n`.

## Exact supplier contracts

### From Mathlib

`AddMonoidAlgebra`, `AddMonoidAlgebra.comapDomain`, `Finsupp.comapDomain_apply`, `AddMonoidAlgebra.lift`,
`AddMonoidAlgebra.mapDomainAlgHom`, `AddMonoidAlgebra.mapRingHom`, `AddMonoidAlgebra.domCongr` and
`Ideal.quotientKerAlgEquivOfRightInverse` (C0.1–C0.10); `AlgebraicGeometry.Spec` (C0.16); the units of a
number field with `NumberField.Units.dirichletUnitTheorem.exists_unit`, `NumberField.Units.sum_mult_mul_log`,
`NumberField.Units.pos_at_place`, `NumberField.IsTotallyReal.mult_eq` and `Subgroup.exists_pow_mem_of_index_ne_zero`
(C6.1); `Submodule.traceDual` with `Submodule.mem_traceDual` (C6.15–C6.19); `Units.mul_right_eq_zero`
(C6.4); limits of powers (C6.3).

### From Tau Ceti

The library baseline is Mathlib `6b7abb3` and Tau Ceti `a91d3aa`.

- `TauCeti.Toric.IsIntegralLattice`, `TauCeti.Toric.IsToricCone`, `TauCeti.Toric.IsRegularCone`
  and `TauCeti.Toric.Fan` with `TauCeti.Toric.Fan.ext`: respectively
  `TauCeti/Geometry/Toric/Algebraic/Lattice`, `Cone/Basic`, `Regular` and `Fan/Basic`.
  These are the common lattice, cone and finite-fan carriers used throughout C0.
- `TauCeti.Toric.affineToricScheme` with its face localizations and
  `TauCeti.Toric.Fan.algebraicRealization`: `TauCeti/Geometry/Toric/Algebraic/AffineScheme`,
  `FaceLocalization` and `Fan/Scheme`. They supply the complex specializations compared in C0.16.
- `TauCeti.SplitTorus.groupScheme` and `TauCeti.SplitTorus.mapValue_frobenius_eq_comp_powEnd`:
  `TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme` and `Frobenius`. The former is the split-torus
  carrier; the latter computes Frobenius on its points, with which C4.18 agrees.
- `TauCeti.AlgebraicGeometry.relativeSpec`:
  `TauCeti/AlgebraicGeometry/RelativeSpec/Functor`; AlgebraicVectorBundles L1A–L1B supplies its
  algebra–scheme and base-change API. C0.8 and C0.21 use this relative spectrum.
- `TauCeti.Hodge.MixedHodgeStructure`,
  `TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure` and the morphism strictness theorems
  `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` and
  `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`:
  `TauCeti/Geometry/Hodge/Mixed/Basic` and `Strictness`. C1.1–C1.2 retain the rational weight
  filtration and the induced quotient Hodge filtration.
- `NumberField.IsTotallyPositive`, with `NumberField.isTotallyPositive_iff`:
  `TauCeti/NumberTheory/NumberField/TotallyPositive`. C6.2, C6.5 and C6.6 use this predicate.
- `TauCeti.AlgebraicGeometry.appTop_bijective_of_section`:
  `TauCeti/AlgebraicGeometry/RationalPoint/Basic`. Its integral, universally closed scheme over a
  field with a rational point is the field comparison; C6.53 adds relative boundary fibres and
  arbitrary base change without a section.

### From TauCetiRoadmap roadmaps

AnalyticToricGeometry Layers 0, 2, 3, 4 and 5 as above: the supporting-character face formula
`P_τ = P_σ + ℕ(−m)` and the regular dual-monoid equivalence `P_σ ≅ ℕ^r × ℤ^{n−r}` of Layer 0 are used in
C0.9–C0.10, the analytic charts of Layer 2 in C2.1, the gluing of Layer 3 in C2.1–C2.3, the boundary
normal form of Layer 4 in C2.6, and the support criterion of Layer 5 in C0.17 and C3.1. ReductiveGroups
Layer 7 supplies parabolics and unipotent radicals (C1). ModularCurves Layer 10 is compared in C6.52.

### From other roadmaps

- **AlgebraicVectorBundles.** L0B–L0C supply finite locally free sheaves, determinants and
  symmetric powers; L1A–L1B supply relative Spec, its algebra–scheme anti-equivalence and arbitrary
  base change; L2A–L2B supply graded quasi-coherent algebras and geometric bundles. In particular
  relative Spec is the pinned `TauCeti.AlgebraicGeometry.relativeSpec` and its base-change API,
  used directly in C0.8 and C0.21.
- **SchemeAndStackFoundations.** §0.3 supplies general relative Proj; §0.6 supplies coherent Hartogs;
  §0.8 supplies étale coordinates; §0.28 supplies closed-subscheme ideal quotients; §0.29 supplies
  relative Frobenius. §§1.1–1.2 supply descent of quasi-coherent modules and algebraic spaces,
  §§1.3–1.9 algebraic spaces, étale presentations and étale-local properties,
  §§1.15–1.17 torsors, contracted products and quotients, and §§1.19–1.23 algebraic stacks,
  quotient stacks, coarse spaces and tameness. §§2.1–2.2 supply higher direct images, projection
  formula and Čech cohomology, §§2.5–2.6 filtered colimits and quasi-coherent cohomology with
  `ample_serre_vanishing`, and §§2.19–2.20 relative duality. §§4.7–4.8 supply adic thickening
  systems and completion, §4.9 formal functions and Stein factorization, and §4.10 coherent
  existence and algebraization. Effective descent of affine schemes is ModularCurves §0E;
  coherent proper direct images and finiteness are JacobianChallenge Layer C, as in
  SchemeAndStackFoundations §§2.6 and 4.9. The character decomposition of torus torsors (C0.21),
  Rapoport's formal gluing (C6.55) and the universal global-function theorem (C6.53) are proved here.
- **AlgebraicModuliForArithmeticGeometry.** Layer 6 supplies Artin approximation:
  `Approximation.HasArtinApproximation` and the approximation theorem for henselian noetherian
  local G-rings.
- **ComplexComparisonPartII.** §C−1.1 supplies `ComplexAnalyticSpace`, including nilpotents, open
  and closed subspaces, arbitrary open gluing and fibre products, and
  `complexSchemeAnalytification`. §C0.4 supplies coherent analytification; Layer C2 projective
  and proper consequences of GAGA; §C3.3 derived GAGA for proper algebraic spaces; §C4.1
  Remmert's theorems; §C4.2 Chow's theorem with nilpotents; §C4.3 compactification and
  algebraization with proper support; §C4.4 algebraicity of holomorphic maps out of proper schemes.
- **AdicSpacesPartII.** §R1.3 (analytification-functor) supplies adic analytification of schemes
  locally of finite type over a complete nonarchimedean field and its functoriality; §§R1.4 and
  R1.7 supply its morphism comparisons and the rigid–adic comparison.
- **AdicSpacesPartIII.** §§F0.2–F0.5 supply formal schemes and completion on topologically locally
  ringed spaces, with the comparison to SchemeAndStackFoundations' thickening systems. §F0.6
  supplies cohomology-of-mittag-leffler-limit, formal-functions-affine (good filtrations and
  Mittag-Leffler for cohomology of coherent thickenings), theorem-on-formal-functions (the
  adapter of SchemeAndStackFoundations §4.9), and formal-direct-image-comparison. §F0.7 supplies
  grothendieck-existence; §F0.8 completion on relative morphisms and grothendieck-algebraization.
  §R2.8 supplies formal-completion-and-algebraic-comparison; §R2.10 fractional-valuation-bound
  and hasse-domain; §R3.7 gaga-comparison-map and proper-gaga. Every use retains the noetherian,
  proper, coherent and complete-base hypotheses of its specified contract.
- **AdelicAlgebraicGroups.** 3.2–3.4 (Siegel coordinates, reduction theory, adelic class sets) and
  3.6 (cusps).
- **ShimuraData.** §1.1 supplies the rational-weight criterion; §4.3 supplies the `SV4` predicate
  and rational Hodge structures on all rational representations under `SV4`. Layer 3 supplies Hodge
  variations, compact duals and reflex-field flags; Layer 4 supplies the type predicates and
  additional axioms on the pure data and morphisms of ShimuraVarieties §P.1, with its Hodge–reflex
  dictionary in §P.3.
- **ShimuraVarieties.** §§P.1–P.3 supply pure data, their domains and the Hodge–reflex dictionary; 0.5 (component decomposition), 1.5 (level maps and Hecke correspondences), 2.1
  (rational boundary components and incidence), 2.2 (Satake topology and compactness), 2.5 and 2.7
  (Baily–Borel compactification and its algebraization), Layer 4 (reciprocity at special points), Layer 7
  (general data), Layer 8 (canonical models, uniqueness, Hecke spans 8.4, general towers and minimal
  compactifications 8.22–8.23). §P.6 (`TauCeti.Shimura.finite_analytic_quotient`) supplies finite
  analytic quotients, invariant sheaves and gluing; §5.2 (`TauCeti.Shimura.weight_one_algebraization`)
  algebraizes polarized integral weight-one variations with their lattices and polarizations.
- **AbelianSchemesAndArithmeticModuli.** A0.1 (abelian schemes), A1.3 (invariant differentials), A2.2–A2.3
  (dual abelian scheme, Poincaré bundle and biextensions), A2.5 (polarizations), A2.8 (projective
  presentations over normal bases), A3.2 (multiplication and torsion), A3.6 (theta groups), A3.9 (Rosati
  involution), A4.1 (Tate modules), A5.3 (algebraization of polarized complex tori).
- **NeronModelsAndSemistableAbelianVarieties.** Layer 1 (Néron models and extension of morphisms), 3.10
  (semistable reduction after a finite separable extension), 3.13 (the Raynaud extension over a complete
  discrete valuation ring) and 3.14 (polarized rigid uniformization). These are local statements over
  complete discrete valuation rings; Layer C4 extends them to complete normal bases.
- **PELModuli.** M0–M1 (PEL data, PEL-type abelian schemes and moduli problems), M2.8–M2.10
  (representability and smoothness at good primes, universal family, Kodaira–Spencer isomorphism),
  M3.6/M4.3 (generic-fibre decomposition into `ker¹(ℚ,G)`-indexed canonical Shimura pieces for
  connected data satisfying SV3 in type A/C), and M4.5–M4.6 (normal integral models at higher
  `p`-level for the fixed lattice).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory.** R07.1.1 supplies `frobeniusHom`, `verschiebungHom`,
  their naturality, base change and `VF = FV = [p]` on flat affine commutative groups; C4.18 extends
  this interface to nonaffine groups. R07.2.21 (`Ha(G) = det V^*` for a truncated
  Barsotti–Tate group over an `𝔽_p`-scheme, the isomorphism `LF` and the Hodge–Tate sequence).
- **ArithmeticGaloisDuality.** R02.1.1 (towers, `lim` and `lim¹`, Mittag-Leffler and Tate's inverse-limit
  theorem).
- **HilbertModularVarietiesAndShimuraCurves.** H0.3–H0.5 supply polarization and trace-dual
  lattices with their stabilizers; H1.1, H1.6, H1.7, H1.9 (polarization modules, the fine
  moduli at scalar tame level `n = No`, its universal family and pairing/ideal-change laws); H2.2–H2.3 (Deligne–Pappas models),
  H2.5–H2.6 (Rapoport and ordinary loci), H2.7 (the Hilbert Hasse ideal), H2.8 (formal Hasse
  neighbourhoods and lift independence); H3 (the tame polarization group `Δ(N)` and weights); H4.4
  (adjugate action on dual levels), H4.11 (residue polarization components), H4.13 (effective finite
  level groups); H4.8–H4.9 supply `HilbertIntegralGamma0` and `gamma0Cartesian`, the subgroup-level
  moduli and its 2-Cartesian polarization square over the quotient stack. H3.6/H4.9 supply the
  coarse Cartesian finite étale `Δ(N)`-torsor square over `X^free/Δ(N)`, including restriction to
  invariant Hasse domains inside that free locus; H5.1 (the elliptic case `F = ℚ`).
- **ArakelovGeometryAndAbelianHeights.** §2.0 supplies `GroupScheme.IsSemiAbelianFamily` for smooth
  separated commutative groups of finite presentation, its base-change API, and
  `GroupScheme.semiAbelianHom_extend` over Noetherian normal schemes. C4.1 uses this carrier and
  adds character and Hodge theory; C4.8 supplies locally Noetherian and algebraic-space descent.
  §§5.0a–5.0b supply `SiegelModuli.ToroidalCompactification`, `SiegelModuli.toroidalDegenerationChart`,
  `SiegelModuli.MinimalCompactification`, `SiegelModuli.hodgePower_generated` and
  `SiegelModuli.hodgeDegree_zero_criterion`, with the principal Siegel families, refinements and
  Hodge powers over all of `ℤ`. C4–C5 extend these interfaces to general degeneration and PEL data
  and prove agreement on the principal Siegel specialization, including level pullback.
- **PadicDifferentialEquationsAndRigidCohomology.** §RD.5.116 supplies relative Zarhin's trick and
  `AbelianVariety.zarhin_dim`. C5.32–C5.33 apply it on the polarized abelian locus, retaining its
  étale-local polarization hypotheses, and extend the comparisons by C4.8.
- **ModularCurvesPartII.** 3.6 (generalized Tate `n`-gons and `du/u`), 3.7 (power isogenies at the
  boundary), 3.11 (the compactified coarse `j`-line), 4.8 (Tate and analytic cusp parameters), 5.2
  (integral coarse modular curves), 5.13 (the fixed-pairing compactified curve), 9.1 (compactified Hecke
  degeneracy maps), and its import of ModularCurves Layer 10.

## How to read the build

Layer C0 is pure commutative algebra and toric geometry and can start at once; its common and smooth
projective refinements take the finite-overlap property of the arithmetic action as a hypothesis,
proved for Shimura data in C1.5. C1 builds the boundary data; C2 needs C0 and C1 and produces the
characteristic-zero compactification and its canonical model; C3 compares choices. C4 needs only C0,
C1 and the abelian-scheme suppliers, and can proceed in parallel with C2–C3 (its last part, the Klingen
correspondence, uses C3). C5 assembles C0–C4 into integral PEL compactifications. C6 uses C0, C1, C3,
C4 and the generic results C5.32–C5.33, but not the good-prime models of C5: its Hilbert models at
primes dividing the discriminant are built directly, by C0 charts, C4 families and the gluing theorem
C6.55. The elementary arithmetic of C6.1–C6.8 and C6.15–C6.19 is independent of everything else.
Its Koecher support theorem C6.5 is stated in `Suggested.lean`.

Numerical labels are reference labels. Build C0.21 before C0.8; C2.8 before C2.5 and C2.10 before
C2.9; C4.8 before C4.6; C5.32–C5.33 before C5.13–C5.16, and C5.31 before C5.20–C5.22. In C6,
start with the elementary C6.1–C6.8 and C6.15–C6.19. Construct C6.12a's ideal-level moduli, cusp
lattices and stabilizers (C6.13, C6.54), fans, all-prime chart families (C6.20), Artinian
uniformization (C6.20a) and formal gluing (C6.55), then C6.21–C6.27. The geometric Koecher statements C6.9–C6.12 follow these inputs.
Build C6.31 before C6.30, and C6.53 before C6.42.

## Layer C0: admissible fans and relative torus embeddings

AnalyticToricGeometry builds finite complex toric varieties; this layer makes the same charts work
over every commutative coefficient ring, over a base scheme carrying a torus torsor, and for the
infinite arithmetic cone systems of a Shimura boundary. It keeps the upstream lattice, cone, dual
monoid and finite-fan vocabulary and adds three things: a coefficient algebra of face restrictions
that never reduces the coefficient ring, the relative torus embedding of a split-torus torsor with
its strata and regular coordinates, and arithmetic cone systems with their common and smooth
projective refinements. It ends with the integral toric boundary, its completion, and the finite
maps attached to a change of lattice. A finite fan is the upstream `Fan`; an arithmetic system may
have infinitely many cones and is finite only modulo its arithmetic action.

Standing hypotheses of the layer:

- (C0-a) `R` is a commutative ring, possibly zero or nonreduced; `P` is an additive commutative
  monoid and `R[P]` is Mathlib's `AddMonoidAlgebra R P`, with monomials `e_p`.
- (C0-b) `F ≤ P` is an additive submonoid satisfying the face condition: for all `a, b ∈ P`,
  `a + b ∈ F` if and only if `a ∈ F` and `b ∈ F`.
- (C0-c) `Z` is a scheme (an algebraic space is handled through an étale atlas), `H = D(M)` is a
  split torus with finite free character lattice `M`, and `T → Z` is an fppf right `H`-torsor.
- (C0-d) Cones are rational polyhedral salient closed cones in the real cocharacter space, in the
  vocabulary of AnalyticToricGeometry Layer 0; `P_σ ⊆ M` is the monoid of characters nonnegative
  on `σ`.
- (C0-e) `L_m ⊆ π_*O_T` is the weight-`m` subsheaf: right translation by `h` multiplies a local
  section by `m(h)`. Units and multiplications `L_m ⊗ L_n → L_{m+n}` are those of `O_T` (C0.21).
- (C0-f) Lan writes cones as relatively open; the monoid of characters nonnegative on a relatively
  open cone equals that of its closure, so the two conventions give the same charts. Strict
  positivity in Lan's `σ^∨_0` notation is tested on the relative interior. For the full boundary
  ideal take this condition on every nonzero face, as in C3.5 and C5.21.

### C0.1 The integral face projection

Define `FaceProjection.faceProjection R F hF : R[P] →ₐ[R] R[F]` (suggested home
`TauCeti/Algebra/MonoidAlgebra/FaceProjection`; `hF : FaceProjection.IsFace F` is (C0-b)), the restriction of a finitely supported coefficient
family to `F`: on monomials, `r e_p ↦ r e_p` if `p ∈ F` and `↦ 0` otherwise. Its underlying additive
map is Mathlib's `Finsupp.comapDomain` along the injective inclusion `F → P`. Assume (C0-a) and
(C0-b). Multiplicativity is where the face condition enters: by bilinearity it suffices to treat
`e_a e_b = e_{a+b}`, and the face condition says that the product survives exactly when both factors
do. No cancellation, reducedness or domain hypothesis is used, and the map is neither an
augmentation nor a reduction of `R`. Equivalently, `faceProjection` is `AddMonoidAlgebra.lift` of
the multiplicative map sending `p` to `e_p` or `0`. This is the coefficient form of Lan's toric
stratum quotient, generalised from the faces of a dual cone to an arbitrary face submonoid
([Lan], 6.1.2.1–6.1.2.6, especially Lemma 6.1.2.6, pp. 443–445).

The API: `faceProjection_eq_comapDomain`; `faceProjection_single_mem` (`r e_p ↦ r e_p` for
`p ∈ F`) and `faceProjection_single_not_mem` (`r e_p ↦ 0` for `p ∉ F`); `faceProjection_coeff`
(C0.2); `faceProjection_comp_inclusion` (C0.3); `faceProjection_coefficient_change` (C0.6).
*Needs:* Mathlib `AddMonoidAlgebra.comapDomain`, `AddMonoidAlgebra.lift`, `AddMonoidAlgebra.lift_single`.

**Checks.**

- `0 ↦ 0`.
- For `R = ℤ/4`, `P = ℕ`, `F = {0}`, `π(e_1) = 0`.
- In the same case, the degree-zero coefficient of `π(2e_0)` is
  `2 ≠ 0`; a map that reduced the coefficients would fail.
- For `R = ℤ`, `P = ℤ`, `F = P`, the degree `−1` coefficient of
  `π(e_{−1})` is `1`; invertible character directions are kept.
- The face condition cannot be dropped: restricting to the even submonoid of `ℕ` kills `e_1` but
  keeps `e_2 = e_1²`, so it is not multiplicative.

### C0.2 Coefficients of the face projection

Prove `FaceProjection.faceProjection_coeff`: for `f ∈ R[P]` and `m ∈ F`, the `m`-coefficient of
`π_{R,F}(f)` equals the coefficient of `f` at `m ∈ P`. Assume (C0-a), (C0-b). It is
`Finsupp.comapDomain_apply` for the injective inclusion; no distinct degrees are summed. This is the
degreewise content of Lan's homogeneous quotient ([Lan], 6.1.2.6, pp. 443–445). *Needs:* C0.1;
Mathlib `Finsupp.comapDomain_apply`.

**Checks.**

- For `R = 0` every coefficient on both sides is the unique zero element.
- Over `ℤ/4`, the constant monomial with coefficient `2` retains that coefficient.
- For two distinct degrees in `F`, a sum of their monomials retains each coefficient separately.

### C0.3 A section of the face projection

Prove `FaceProjection.faceProjection_comp_inclusion`: if `i_F : R[F] → R[P]` is Mathlib's
`AddMonoidAlgebra.mapDomainAlgHom` for the inclusion, then `π_{R,F} ∘ i_F = id`; in particular `π_{R,F}`
is surjective with an explicit right inverse. Assume (C0-a), (C0-b). Coefficient extensionality and
C0.2 prove it on arbitrary finite sums ([Lan], 6.1.2.6, pp. 443–445). *Needs:* C0.2; Mathlib
`AddMonoidAlgebra.mapDomainAlgHom`.

**Checks.**

- An arbitrary finitely supported element of `R[F]`, not only `1`, is recovered.
- Over `ℤ/4`, the constant monomial `2e_0` is recovered without reducing its coefficient.
- For `F = P = ℤ`, the Laurent monomial `e_{−1}` is recovered, so the section keeps negative degrees.

### C0.4 The monomial ideal of the face complement

Prove `FaceProjection.ker_faceProjection`: the kernel of `π_{R,F}` is the ideal
`J_F = FaceProjection.offFaceIdeal R F = Ideal.span {e_p | p ∉ F}`, and `f ∈ J_F` exactly when every coefficient of `f` in an
`F`-degree vanishes. Assume (C0-a), (C0-b). The statement is about this ideal span, not its
radical. Each generator is killed; conversely an element of the kernel is a finite sum of monomials
of degree outside `F`, each a multiple of a generator ([Lan], 6.1.2.6, pp. 443–445). *Needs:* C0.2.

**Checks.**

- Over `ℤ/4`, `J_{0} ⊆ (ℤ/4)[ℕ]` is the ideal of positive-degree polynomials and does not contain
  `2e_0`.
- For `F = P` the generating set is empty and `J_F = 0`.
- For `R = ℤ`, `P = ℕ`, `F = {0}`, the ideal is `(e_1)`; its quotient is `ℤ`, not the
  zero ring or the polynomial ring.

### C0.5 The integral stratum quotient algebra

Construct `FaceProjection.faceQuotientEquiv : R[P] ⧸ J_F ≃ₐ[R] R[F]`, sending the class of `f` to
`π_{R,F}(f)`. Assume (C0-a), (C0-b). Apply Mathlib's `Ideal.quotientKerAlgEquivOfRightInverse` with
the section of C0.3 and rewrite the kernel by C0.4; the equivalence is the one with this formula,
not an unspecified ring isomorphism ([Lan], 6.1.2.6, the quotient defining a closed stratum,
pp. 443–445). The API: `faceQuotientEquiv_mk` (the class of `f` goes to `π(f)`);
`faceQuotientEquiv_symm_single` (`r e_m` with `m ∈ F` goes back to the class of `r e_m`);
`faceQuotientEquiv_coeff`; `faceQuotient_mk_eq_iff` (two classes agree exactly when the
coefficients agree in every `F`-degree). *Needs:* C0.3, C0.4; Mathlib
`Ideal.quotientKerAlgEquivOfRightInverse`.

**Checks.**

- The class of `0` maps to `0`.
- For `R = ℤ/4`, `P = ℕ`, `F = {0}`, the class of `e_1` maps to `0`.
- In the same case, the image of the class of `2e_0` has degree-zero
  coefficient `2`, not `0`.
- For `R = ℤ`, `P = ℤ`, `F = P`, the image of the class of `e_{−1}`
  has degree `−1` coefficient `1`.

### C0.6 Coefficient change commutes with face restriction

Prove `FaceProjection.faceProjection_coefficient_change`: for every ring homomorphism
`φ : R → S` of commutative rings, the two homomorphisms `R[P] → S[F]` (project, then change
coefficients; or change coefficients, then project) agree. Assume (C0-a), (C0-b). There is no
flatness, injectivity or surjectivity hypothesis on `φ`; both composites send `r e_p` to `φ(r) e_p`
or `0` according as `p ∈ F` ([Lan], 6.1.2.1–6.1.2.6, pp. 443–445). *Needs:* C0.2; Mathlib
`AddMonoidAlgebra.mapRingHom`.

**Checks.**

- For the nonflat map `ℤ/4 → ℤ/2`, the constant coefficient `2` becomes zero on both paths.
- For the identity coefficient map, an arbitrary finite coefficient family is unchanged.
- For a composite `R → S → T`, the coefficient at a surviving degree is `ψ(φ(r))` on both paths.

### C0.7 The face ideal commutes with coefficient change

Prove `FaceProjection.offFaceIdeal_map`: for `φ : R → S`, the extension of `J_F ⊆ R[P]`
along `R[P] → S[P]` is `J_F ⊆ S[P]`, and `faceQuotientEquiv` is natural in `φ`. Assume (C0-a),
(C0-b). The extension of an ideal generated by a set is generated by the image of the set, and the
generators `e_p` map to themselves; this is a statement about this monomial ideal, not about kernels
commuting with tensor products in general ([Lan], 6.1.2.6, pp. 443–445). *Needs:* C0.4, C0.5, C0.6;
Mathlib `AddMonoidAlgebra.mapRingHom`.

**Checks.**

- The non-flat map `ℤ/4 → ℤ/2` satisfies the equality.
- The argument uses the fixed monomial generating set; it is not a claim that kernel formation
  commutes with base change.
- For `F = P` both extended ideals are zero, even when the coefficient map kills a nonzero scalar.

### C0.8 Relative torus embeddings

Construct `TauCeti.Toric.Relative.torusEmbedding` (suggested home
`TauCeti/Geometry/Toric/Algebraic/Relative`): for a cone `σ`, the relative affine scheme
`T(σ) = Spec_Z A_σ`, where `A_σ = ⊕_{m ∈ P_σ} L_m` is the homogeneous subalgebra of `π_*O_T`
supplied by C0.21, with the multiplication and unit of `O_T`. Assume (C0-c)–(C0-f). Since `P_σ` is a
submonoid, `A_σ` is a quasi-coherent subalgebra, and `T(σ)` is its relative spectrum
(AlgebraicVectorBundles L1A–L1B, relative spectrum and its base change). The construction is
`H`-equivariant and compatible with base change on `Z`. On a cover trivializing the torsor by a
section, `A_σ` becomes `O_Z[P_σ]`; two trivializations differ by a character unit, which gives the
descent cocycle. For the zero cone `T(σ) = T`. This extends the finite complex chart of
AnalyticToricGeometry, without introducing a second lattice or cone carrier ([Lan], 6.1.2.1,
Remark 6.1.2.2 and Definition 6.1.2.3, pp. 443–444; [FKW], 3.2.1 and the proof of Proposition 3.2.7,
pp. 24–25).

The API: `embedding_trivialization` (a section of the torsor over `U ⊆ Z` identifies `T(σ)|_U` with
`Spec O_U[P_σ]`); `embedding_baseChange` (for `Z′ → Z`, the pullback of `T(σ)` is the embedding of
the pulled-back torsor, coherently for identity and composition); `embedding_torusAction` (the
`H`-action extends and the structure map is invariant); `embedding_zeroCone` (`T(0) ≅ T`);
`embedding_changeTrivialization` (if `t_β = t_α g_{αβ}` then the weight-`m` coordinates satisfy
`q_{β,m} = m(g_{αβ})⁻¹ q_{α,m}`, and these transitions preserve multiplication, boundary ideals and
face maps); `embedding_homEquiv` (maps `Y → T(σ)` over `Z` correspond to `O_Z`-algebra maps
`A_σ → f_*O_Y`). *Needs:* C0.21; AlgebraicVectorBundles L1A–L1B (relative spectrum); SchemeAndStackFoundations Layer 1 (fpqc
descent of quasi-coherent algebras); Tau Ceti `TauCeti.SplitTorus.groupScheme`; Mathlib
`AddMonoidAlgebra.domCongr`; AnalyticToricGeometry Layer 0.

**Checks.**

- `embedding_rankOne_test`: for the trivial `G_m`-torsor and the positive ray, `T(σ) = A¹_Z` with
  its standard open `G_m`.
- `embedding_zeroCone_test`: the zero-cone embedding is the given torsor, also when it is
  nontrivial.
- `embedding_lineDual_test`: in rank one with weight-one line `L`, the positive-ray embedding is
  `Spec_Z Sym(L)`, the total space of `L^∨` under `V(E) = Spec Sym(E^∨)`; the total space of `L`
  itself is wrong.
- `embedding_nilpotentBase_test`: for the trivial rank-one torsor over `ℤ/4`, the ray chart is
  `(ℤ/4)[q]` and its restriction to `q = 0` keeps the scalar `2`.
- A nontrivial torsor need not have a global nonvanishing monomial of each degree.

### C0.9 Face charts are open subschemes

Prove `TauCeti.Toric.Relative.faceOpenImmersion`: for a face `τ` of `σ` there is a canonical
`H`-equivariant open immersion `T(τ) → T(σ)`, given on a trivialization by the localization
`R[P_σ] → R[P_τ]`; these immersions satisfy identity and composition and intersect along common
faces. Assume (C0-c)–(C0-f). Choose `m ∈ P_σ` exposing `τ`, so `P_τ = P_σ + ℕ(−m)` (the
supporting-character face formula of AnalyticToricGeometry Layer 0); the open is the locus where the
monomial of weight `m` is invertible, which is well defined because a change of trivialization
multiplies it by a unit. This is a statement about ordinary charts; it gives no map between
completions along two different strata ([Lan], Lemma 6.1.2.4 and Theorem 6.1.2.8(2), pp. 443–445).
*Needs:* C0.8; SchemeAndStackFoundations Layer 0, Layer 1; AnalyticToricGeometry Layer 0.

**Checks.**

- For the quadrant and its first-coordinate ray, the face chart inverts the second coordinate.
- For `σ = 0` the identity face gives the identity map of the torsor.
- For nontrivial character lines the open is cut out locally by a monomial; no global coordinate
  `q` is chosen.

### C0.10 Integral regular coordinates

Prove `TauCeti.Toric.Relative.regularCoordinateIso`: if `σ` is regular of dimension `r` in a lattice
of rank `n`, an integral basis extending its primitive ray generators and a local trivialization of
the torsor give an algebra isomorphism
`A_σ ≅ R[x_1, …, x_r, y_1^{±1}, …, y_{n−r}^{±1}]`, given on monomials by the exponent map of the
regular dual-monoid identification `P_σ ≅ ℕ^r × ℤ^{n−r}` of AnalyticToricGeometry Layer 0. Assume
(C0-c)–(C0-f); `R` may be nonreduced; regularity includes rationality and salience and means that
the ray generators extend to an integral basis (simpliciality is weaker). The basis is a hypothesis
of this comparison, not part of the definition of `T(σ)`: a change of basis or of trivialization
acts by the induced monomial map and character units. The algebra map is Mathlib's
`AddMonoidAlgebra.domCongr` along the monoid equivalence ([Lan], 6.1.1.11 and Theorem 6.1.2.8(5),
pp. 442–445). *Needs:* C0.8; Mathlib `AddMonoidAlgebra.domCongr`; SchemeAndStackFoundations Layer 0;
AnalyticToricGeometry Layer 0.

**Checks.**

- A full regular cone in rank two gives `R[x_1, x_2]`; a ray in rank two gives `R[x_1, y^{±1}]`.
- The zero cone gives the split torus, not affine space.
- The cone spanned by `(1,0)` and `(1,2)` is simplicial but its ray generators are not an integral
  basis, so the theorem does not apply to it.

### C0.11 The scheme-theoretic relative toric stratum

Prove `TauCeti.Toric.Relative.stratumQuotientIso`: for `F_σ = M ∩ σ^⊥`, the quotient of `T(σ)` by
the homogeneous ideal `⊕_{m ∈ P_σ ∖ F_σ} L_m` is canonically `Spec_Z ⊕_{m ∈ F_σ} L_m`, the torsor
under the quotient torus with character lattice `F_σ` obtained by pushout (C0.21). The ideal and
the quotient commute with arbitrary base change. Assume (C0-c)–(C0-f). Since characters are
nonnegative on `σ`, `a + b` vanishes on `σ` exactly when `a` and `b` do, so `F_σ` is a face
submonoid (and a saturated subgroup); on a trivialization apply C0.1, C0.4, C0.5 and C0.7, and
descend along the character-unit cocycle. This is the closed stratum as a scheme: the ideal is the
off-face ideal, not its radical, and it agrees with the reduced closed orbit only under a separate
reducedness hypothesis ([Lan], Lemma 6.1.2.6 and Definition 6.1.2.7, pp. 443–445). *Needs:* C0.4,
C0.5, C0.7, C0.8, C0.21; SchemeAndStackFoundations Layer 0, Layer 1; AnalyticToricGeometry Layer 0.

**Checks.**

- The positive ray has closed stratum `Z`; the zero cone has stratum the whole torsor.
- Over `ℤ/4` the stratum of the full ray has coordinate ring `ℤ/4`, not `ℤ/2`.
- For a ray in a rank-two lattice the stratum keeps a rank-one torus direction.

### C0.12 Coordinate ideals of boundary intersections

Prove `TauCeti.Toric.Relative.boundaryCoordinateIso`: in the coordinates of C0.10, the
scheme-theoretic intersection of the boundary components indexed by `J ⊆ {1, …, r}` has ideal
`(x_j : j ∈ J)` and coordinate algebra `R[x_i (i ∉ J), y^{±1}]`; its exact stratum (the intersection
minus the other components) is the principal open where `∏_{i ∉ J} x_i` is invertible. These
descriptions commute with base change and with the transition maps. Assume (C0-c)–(C0-f), a regular
cone with its basis, and a trivialization. The degrees with vanishing `J`-coordinates form a face,
whose off-face ideal is generated by the `x_j`, `j ∈ J` (C0.5). Multiplication by a monomial is
injective over every coefficient ring, so the exact open is universally schematically dense, and
the intersection is smooth over the local base because polynomial and Laurent algebras are.
Smoothness over an arithmetic base also needs smoothness of the base, and the statement concerns
the components of one chart: identifying global boundary branches requires the neat-level branch
separation of C5.6–C5.8 ([Lan], 6.1.2.6–6.1.2.8 and the charts of 6.3.2.5, pp. 443–445 and 503).
*Needs:* C0.5, C0.7, C0.10; SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- For the quadrant, `J = ∅`, one index and both indices give the plane, a line and the base.
- When no other boundary coordinate exists, the product is `1` and the exact open is the whole
  intersection.
- Over `ℤ/4` the coordinate quotient keeps `2`; replacing the ideal by its radical would lose it.
- For `G_m` over `𝔽_2`, density is scheme-theoretic, not a statement about rational points.

### C0.13 Arithmetic cone systems

Define `ArithmeticFan` (suggested home `TauCeti/Geometry/Toric/Arithmetic/Fan`): for each cusp and
chosen domain component as in the conventions, a possibly infinite set of rational polyhedral salient
cones in the rational closure `C*` of its positivity cone, on the common lattice carrier (`PointedCone` with `IsToricCone` and `IsFaceOf`), together with
an integral linear action of the arithmetic group preserving the lattice and `C*`, such that the set
is closed under faces, two cones meet in a common face, the action permutes the cones with finitely
many orbits, the system is locally finite on compact subsets of the open positivity cone, and it is
compatible with restriction to boundary components and with the action of the level (Pink's
`K`-admissible partial cone decompositions). It is complete when the union of its cones is `C*`.
The data at different cusps are indexed by the finite cusp double cosets and compatible under
rational conjugation. A finite system with trivial action is an upstream `Fan`; finitely many orbits
never replaces finitely many cones, and local finiteness is required on the open cone only, since
every cone contains `0` ([Pink], 6.4–6.6, pp. 96–99). Restriction to a boundary component preserves
incidence and equivariance, but not completeness or orbit finiteness in general ([Pink], 6.5(c)).

The API: `ArithmeticFan.ext`; `ArithmeticFan.toFiniteFan` (a finite cone set with its incidence is
an upstream `Fan` with exactly those cones); `ArithmeticFan.restrict` (to a boundary component or a
smaller level, with completeness and orbit finiteness transported only under their hypotheses);
`ArithmeticFan.support` and `ArithmeticFan.IsComplete` (support equal to `C*`, not to the ambient
space). *Needs:* AnalyticToricGeometry Layer 0; Tau Ceti `TauCeti.Toric.Fan.ext`; ShimuraVarieties
2.1 (rational boundary components); ReductiveGroups Layer 7.

**Checks.**

- `ArithmeticFan.zero_test`: for a rank-zero lattice, `C* = {0}` and the complete system is the zero
  cone.
- `ArithmeticFan.finite_test`: a finite quadrant fan with trivial action returns exactly its cones
  under `toFiniteFan`.
- `ArithmeticFan.origin_test`: an infinite system is never locally finite at `0` but is admitted when
  locally finite on the open cone.
- `ArithmeticFan.support_test`: the positive ray in `ℝ` has support `ℝ_{≥0}`; it is complete for
  `C* = ℝ_{≥0}` and not for `ℝ`.
- An infinite system with finitely many orbits is not coerced to a finite `Fan`.

### C0.14 Common refinements

Construct `ArithmeticFan.commonRefinement`: for two complete systems and a finite family of
boundary-compatible integral lattice maps `φ`, the system of cones `σ_1 ∩ φ⁻¹(σ_2)` closed under
faces. Assume the systems satisfy C0.13, each `φ` maps the source positivity domain into the target
one. Specify a common arithmetic source group (or a finite-index subgroup), homomorphisms to
all target arithmetic groups, and equivariance of every lattice map and cusp action for these
homomorphisms. Both input systems must have finitely many orbits under the common source action.
Take intersections under that action, and require finite relative overlap: for each source cone
representative, only finitely many translates of each target cone representative have inverse image
meeting it in the relevant open positivity domain, modulo stabilizers and identical intersections.
Also assume the source finite-overlap property: for cones `σ, τ`, only finitely many
effective group elements `γ` make `γσ` meet `τ` in the open positivity cone. For Shimura boundary
data C1.5 ([Pink], 6.19), together with the finite-index level comparisons, supplies these overlap
conditions for the refinement and Hecke maps used in C2, C3 and C6.
The finite representative sets and relative overlap give finitely many intersection orbits.
The output is complete with the common (or inverse-image) support, has finitely many orbits, is
compatible with cusps and levels, and is the coarsest common refinement for containment. No common
refinement is asserted for infinitely many unrelated Hecke maps; without equivariance an invariant
refinement requires adding and controlling the relevant translates ([Pink], 9.22–9.23, pp. 157–158).
The API: `commonRefinement_le` (each cone lies in a cone of each input);
`commonRefinement_universal` (a compatible system refining both refines this one);
`commonRefinement_support`. *Needs:* C0.13; AnalyticToricGeometry Layer 0.

**Checks.**

- `commonRefinement_self_test`: the common refinement of a system with itself is the same system.
- `quadrant_refinement_test`: intersecting the quadrant fan with its subdivision by `(1,1)` gives the
  two cones of the subdivision and their faces.
- `commonRefinement_level_test`: restriction to a smaller level induces the same containment maps.
- Two refinements are compared through a third; they need not be equal.
- The coordinate-swap action on the quadrant does not preserve the subdivision at `(1,2)` alone:
  the identity map to that fan with trivial action is not equivariant. Adding `(2,1)` gives an
  invariant refinement for this finite group.

### C0.15 Smooth projective refinements

Prove `ArithmeticFan.exists_smoothProjective_refinement`: at neat level every complete system has a
complete, smooth and projective refinement, compatible with any given finite family of maps as in
C0.14. Projective means that there is an invariant, continuous, homogeneous piecewise-linear
function `pol`, integral on the lattice, positive away from `0`, whose domains of linearity are
exactly the cones, compatible with restriction to cusps; Lan's sign convention is
`pol(x + y) ≥ pol(x) + pol(y)` ([Lan17], Definitions 2.5, 2.7 and Proposition 2.8, pp. 5–6). Assume
the hypotheses of C0.14, including finite overlap (so cones meeting the open positivity cone have
finite effective stabilizers). Construct invariant rational piecewise-linear functions by averaging
over those finite stabilizers on finitely many orbit representatives, resolve singular cones by
primitive subdivisions keeping orbit and boundary compatibility, and, when the global condition that
no stratum meets its own translates is wanted, refine barycentrically ([Pink], 9.18–9.23,
pp. 154–158). Neatness and smoothness alone give local normal crossings only. *Needs:* C0.14;
AnalyticToricGeometry Layer 0.

**Checks.**

- The cone spanned by `(1,0)` and `(1,2)` needs a genuine regular subdivision.
- A prescribed finite Hecke family admits compatible refinements; no universal fixed refinement is
  asserted.
- On the quadrant subdivided by `(1,1)`, `pol(x,y) = x + y + min(x,y)` has values `1`, `1` and
  `3` at `(1,0)`, `(0,1)` and their sum. Thus the required inequality is superadditivity,
  with `3 > 1 + 1`, and the function is positive on every nonzero point of the quadrant.

### C0.16 Toric schemes over arbitrary commutative rings

Construct `TauCeti.Toric.finiteFanScheme` (suggested home `TauCeti/Geometry/Toric/Algebraic/BaseChange`):
for a finite rational fan `Σ` (singular cones allowed) and any commutative ring `R`, the affine charts
`U_{σ,R} = Spec R[P_σ]`, obtained by base change from `Spec ℤ[P_σ]`, glued along face localizations to
`X_{Σ,R}`, with its split torus action and stratum ideals. All chart, overlap and action maps commute
with arbitrary coefficient change, including non-noetherian valuation rings. The identification
`R[P] = ℤ[P] ⊗_ℤ R` uses the monomial basis; nilpotent coefficients are kept. Over `ℂ` this is the
upstream fan scheme `Fan.algebraicRealization`, not a second complex toric space ([Lan],
6.1.1.7–6.1.2.8, pp. 442–445). Infinite arithmetic systems need the quotient constructions of C2
and C5.

The API: `affineChart_baseChange`; `finiteFanScheme_baseChange` (coherent for identity and
composition); `finiteFanScheme_complex` (agreement with AnalyticToricGeometry's realization over
`ℂ`); `finiteFanScheme_torusAction`; `finiteFanScheme_glue_hom` (maps out of `X_{Σ,R}` correspond to
compatible maps out of the charts). *Needs:* C0.6, C0.7; AnalyticToricGeometry Layer 0;
SchemeAndStackFoundations Layer 0; Tau Ceti `TauCeti.SplitTorus.groupScheme`; Mathlib
`AlgebraicGeometry.Spec`, `AlgebraicGeometry.Spec.map`.

**Checks.**

- `affineChart_ray_Z4_test`: the positive ray over `ℤ/4` has coordinate ring `(ℤ/4)[q]`, and its
  closed stratum has coordinate ring `ℤ/4`.
- `affineChart_zero_test`: the zero cone gives `Spec R[M]`, the split torus.
- `affineChart_valuation_test`: for a valuation ring `V`, `U_{σ,V}` is the base change of `U_{σ,ℤ}`
  with the same face maps.
- `affineChart_nilpotent_test`: replacing `R` by its reduction kills `2 ∈ ℤ/4` and is rejected.

### C0.17 Relative toric maps and the support criterion

Prove `TauCeti.Toric.Relative.isProper_iff_support`: a lattice map and a compatible equivariant map
of split-torus torsors over the same base, with finite fans, induce a relative toric morphism. If
for every target cone `τ` the inverse image of `τ` equals the union of the source cones mapping into
`τ`, the morphism is proper over every base. Conversely, for a nonempty source fan over a nonempty
base, properness implies this criterion (test on a geometric fibre). Over the empty base every map
is proper, and the empty source fan gives a proper map without the criterion, since `0` lies in the
inverse image of every target cone. The proof works locally on trivializations, by the valuative
argument on character monomials over arbitrary coefficients, and descends properness fpqc locally;
over `ℂ` it is AnalyticToricGeometry Layer 5, item 3. For arithmetic quotients one needs in addition
the separated finite-type quotient models of C2 and C5 and complete compatible systems: orbit
finiteness does not make an unquotiented infinite toric scheme proper ([Pink], 6.25 and 6.27,
pp. 112–115). *Needs:* C0.8, C0.16; AnalyticToricGeometry Layer 5; SchemeAndStackFoundations Layer 0,
Layer 1.

**Checks.**

- The complete fan of `ℙ¹` gives a proper relative `ℙ¹`; a single ray gives `A¹`, which is not proper.
- A subdivision with the same support gives a proper map.
- Over a nonempty base the empty-source map is proper but fails the criterion, which is why the
  converse needs a nonempty source.

### C0.18 The integral toric boundary

Prove `TauCeti.Toric.boundaryUnion_ideal` (suggested home
`TauCeti/Geometry/Toric/Algebraic/Boundary`): in a regular chart
`A_R = R[x_1, …, x_r, y_1^{±1}, …, y_s^{±1}]` the scheme-theoretic union of the `r` boundary divisors
has ideal `(t)`, `t = x_1⋯x_r`; the quotient has `R`-basis the monomials `x^a y^b` with some
`a_i = 0`. Hence the boundary is flat over `R`, its geometric fibres are reduced, and its formation
commutes with every coefficient homomorphism. Assume `R` arbitrary, `r, s ≥ 0`, coordinates as in
C0.10. For `r = 0`, `t = 1` and the boundary is empty. Geometric reducedness concerns fibres over
fields; over a nonreduced `R` the boundary itself is not reduced. The intersection of the
components in `J` has the different ideal `(x_j : j ∈ J)` (C0.12). Multiplication by `t` is
injective; the monomials divisible by every `x_i` are exactly the multiples of `t`; over a field a
squarefree monomial ideal is radical ([Dimitrov], §2, pp. 529–530; [Lan], Theorem 6.1.2.8(5),
p. 445). *Needs:* C0.10, C0.12; SchemeAndStackFoundations Layer 0.

**Checks.**

- For `r = 2` the union quotient is `R[x_1, x_2]/(x_1x_2)` while the intersection quotient is `R`.
- Over `ℤ/4` the boundary quotient keeps `2`.
- For `r = 0` the quotient is `0`; for `r = 1` it is `R[y^{±1}]`.

### C0.19 Completed regular charts

Prove `TauCeti.Toric.completedChart_coeff`: for `r > 0` the `t`-adic completion
`lim_h A_R/(t^h)` is identified with families `c_{a,b}`, `(a, b) ∈ ℕ^r × ℤ^s`, such that for each
`h > 0` only finitely many nonzero `c_{a,b}` have `a ∉ (h, …, h) + ℕ^r`, with multiplication the
convolution, finite in each quotient. Sections with finite poles belong to the localization
`Â_R[1/t] = colim_m t^{-m} Â_R` of the completed ring: each section has a single finite denominator
bound, which shifts its exponents and support by a fixed monomial. Complete first, then invert `t`.
The identification is natural for `R → S` at each finite level, and agrees with
the formal completion of AdicSpacesPartIII F0 (completion of a noetherian adic ring and of a
morphism) under that layer's hypotheses. The condition is finiteness outside every diagonal tail; it
is not the full power-series ring, and arbitrary localizations or tensor products are not claimed to
commute with completion. The quotient `A_R/(t^h)` has the monomial basis with some `a_i < h`
([Dimitrov], §2, pp. 529–530). *Needs:* C0.16, C0.18; AdicSpacesPartIII F0.

**Checks.**

- For `r = 1`, `s = 0` the completion is `R[[x]]`.
- For `R ≠ 0` and `r = 2`, `∑ x_1^n x_2^n` is admitted and `∑ x_1^n` is not (it is infinite
  modulo `x_1x_2`). Over the zero ring both coefficient families are zero and are admitted.
- For `r = s = 1`, a family with infinitely many nonzero Laurent coefficients in degree `0` in
  `x` is excluded, while `∑ x^n y^n` is admitted.
- A nilpotent constant stays nonzero; inverting `t` allows a finite negative diagonal shift.
- For `R ≠ 0`, completing `R[x, x⁻¹]` at `(x)` gives the zero ring, since `(x) = (1)`;
  completing `R[x]` first and then inverting `x` gives the nonzero ring `R((x))`.

### C0.20 Finite toric maps for a change of lattice

Prove `TauCeti.Toric.changeLattice_finite`: for an injective finite-index lattice map `i : N′ → N`
and a finite fan `Σ` in `N_ℝ`, the pullback fan in `N′_ℝ` gives a finite toric morphism
`X(i^*Σ)_R → X(Σ)_R` over every `R`, given on charts by `R[σ^∨ ∩ M] → R[σ^∨ ∩ M′]`. Over a normal
domain `R` the source is the normalization of the target in the function field of the source torus,
compatibly with gluing; no normality claim is made over nonreduced `R`. A positive integer kills
`M′/M`, so every new monomial is integral over the old chart, and finite generation of saturated
monoids gives finiteness. A further subdivision gives a proper map that need not be finite (blowing
up the origin of a regular two-dimensional cone has an exceptional curve). For arithmetic cusp
systems the statement is used chartwise and descent through the quotient is checked separately
([Dimitrov], Remark 7.3, p. 543; [Lan17], Theorem 6.1(3)–(4), pp. 22–23, and Construction 4.5,
p. 11). *Needs:* C0.9, C0.16; AnalyticToricGeometry Layer 5; SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- In rank one with `i = e·`, the chart map is `q ↦ (q′)^e`, finite of rank `e` over every `R`.
- Blowing up the vertex of a regular two-dimensional cone is proper and not finite.
- Regularity of the pullback cone is checked in `N′`.

### C0.21 Character decomposition of a split-torus torsor

Prove `TauCeti.TorusTorsor.characterDecomposition` (suggested home
`TauCeti/AlgebraicGeometry/GroupScheme/TorusTorsor`): under (C0-c), the structure map `π : T → Z` is
affine and `π_*O_T = ⊕_{m ∈ M} L_m`, where `L_m` is the weight-`m` subsheaf, each `L_m` is an
invertible `O_Z`-module, `L_0 = O_Z`, and multiplication `L_m ⊗ L_n → L_{m+n}` is an isomorphism.
Conversely an `M`-graded quasi-coherent algebra with invertible graded pieces and bijective
multiplication is `π_*O_T` for a unique torsor, giving an equivalence between `H`-torsors and such
graded algebras. Pushout along the quotient torus with character lattice a saturated subgroup
`M′ ⊆ M` corresponds to `⊕_{m ∈ M′} L_m`. All of this commutes with base change on `Z`. The proof:
fppf locally `T` is trivial and `π_*O_T = O_Z[M]`; quasi-coherent comodules over the Hopf algebra of
`D(M)` are exactly `M`-graded modules; descend the grading and the multiplication (SGA 3, Exposé I,
Proposition 4.7.3 and Corollary 4.7.3.1, re-edition pp. 30–31; [Lan], 6.1.2.1–6.1.2.2, pp. 443–444; [FKW], 3.2.1, p. 24). *Needs:* Tau Ceti
`TauCeti.SplitTorus.groupScheme`; AlgebraicVectorBundles L1A–L1B (relative spectrum); SchemeAndStackFoundations Layer 1 (torsors,
fpqc descent of quasi-coherent modules and affine morphisms).

**Checks.**

- For the trivial torsor, `L_m = O_Z · e_m` and the algebra is `O_Z[M]`.
- For `M = 0`, `T = Z`.
- The `G_m`-torsor with weight-one line `L` is `Spec ⊕_{n ∈ ℤ} L^{⊗n}`; it has a global nonvanishing
  weight-one function only when `L ≅ O_Z`.

### Examples

- Over `ℤ/4`, the ray chart `(ℤ/4)[q]` has closed stratum `ℤ/4` and boundary quotient keeping `2`.
- The quadrant gives `A²_R`, its two coordinate lines, and their intersection `Spec R`; the union
  of the lines is cut out by `x_1x_2`, the intersection by `(x_1, x_2)`.
- In rank one, the lattice map of index `e` gives the finite map `q ↦ (q′)^e`, while the blow-up of
  a regular rank-two cone is a proper, non-finite refinement.

### Dependencies

Mathlib (`AddMonoidAlgebra`, `Finsupp.comapDomain`, ideal quotients, `AlgebraicGeometry.Spec`);
Tau Ceti (`TauCeti.SplitTorus.groupScheme`, `TauCeti.Toric.Fan`); AnalyticToricGeometry Layers 0
and 5; SchemeAndStackFoundations Layer 0 and Layer 1; AdicSpacesPartIII F0; ShimuraVarieties 2.1;
ReductiveGroups Layer 7. The finite-overlap hypothesis of C0.14–C0.15 is proved for Shimura data in
C1.5.

## Layer C1: rational boundary and mixed data

The boundary of a toroidal compactification is described by mixed Shimura data. This layer enriches
each rational boundary component of ShimuraVarieties 2.1 by Pink's boundary datum: the parabolic,
its unipotent radical with the central weight `−2` part, the pure quotient, and the boundary
homomorphism with its finite homogeneous cover. It then constructs the induced mixed Hodge
structures, the torus torsor over an abelian torsor over a pure boundary Shimura variety, the cusp
labels with their equivalence, the effective arithmetic stabilizers with the finite-overlap property
used by the cone constructions of C0, and the incidence of positivity cones. It assumes no universal
abelian scheme. The canonical models of the special mixed torsors used for descent are constructed in
C2.10.

Standing hypothesis of the layer:

- (C1-a) `(G, X)` is a pure Shimura datum (ShimuraVarieties §P.1, with ShimuraData Layer 4
  type predicates), `K ⊆ G(𝔸_f)` is compact open, and the
  arithmetic quotients are those of the component decomposition of ShimuraVarieties 0.5.
  Rational weight is the separate `SV4` condition of ShimuraData §4.3; it is assumed only where
  stated. Positivity cones retain the component choices of the conventions.

### C1.1 Mixed boundary datum

Define `MixedBoundaryDatum` (suggested home `TauCeti/Geometry/Shimura/Boundary/MixedDatum`): for a
rational boundary component of ShimuraVarieties 2.1 with its admissible parabolic `Q`, the connected
group `P_1 ⊆ Q`, its unipotent radical `W_1`, the central subgroup `U_1 ⊆ W_1` of weight `−2`,
`V_1 = W_1/U_1`, the pure quotient `G_1 = P_1/W_1`, and the boundary domain `X_1`, a homogeneous
space under `P_1(ℝ)·U_1(ℂ)` with an equivariant finite-fibre parameter map
`h_1 : X_1 → Hom(S_ℂ,P_{1,ℂ})`. Evaluation gives `h_{1,x} = h_1(x)`; its projection to `P_1/U_1`
is defined over `ℝ`, and `π_1 ∘ h_{1,x} ∘ w` is central in `G_1`, where `π_1 : P_1 → G_1`
and `w` uses the inverse-diagonal convention. Retain Pink's conditions on the Cartan involution,
on compact factors and on the centre. The adjoint action
on `Lie P_1` has weights `0, −1, −2` only, with `W_{−2} = Lie U_1`, `W_{−1} = Lie W_1` and
`W_0 = Lie P_1`. Assume (C1-a). The parabolic and Lie structure come from ReductiveGroups Layer 7,
and mixed Hodge structures, filtrations and strictness are Tau Ceti's `TauCeti.Hodge.MixedHodgeStructure`.
`X_1` is kept as the homogeneous cover; it is not replaced by the image of `h_1`. The construction
applies Pink's boundary homomorphism to the rational boundary datum and obtains `P_1, W_1, U_1`
from the weight filtration; the axioms of Pink 2.1 follow from the boundary representation and the
filtration comparison of Pink 4.12 on the ambient adjoint representation. The exhaustive filtration
of `Lie P_1` above is the correct form of Pink 2.1(v), whose printed version lists the weight-graded quotient in the place of a filtration
step ([Pink], 2.1 and 4.7–4.12, pp. 29–30 and 59–63).

The API: `MixedBoundaryDatum.pureQuotient` (`P_1/W_1` with its induced domain is a pure boundary
datum); `MixedBoundaryDatum.weightFiltration` (the three steps are `Lie U_1 ⊆ Lie W_1 ⊆ Lie P_1`,
and `V_1 ≅ gr_{−1}`); `MixedBoundaryDatum.conjugation` (rational conjugation transports groups,
cover, parameter map and filtrations with the boundary label); `MixedBoundaryDatum.h_finiteFibers`
(the fibres of the parameter map from `X_1` are finite);
`MixedBoundaryDatum.ext` (with ambient datum and cover fixed, the subgroups and `h_1` determine the
datum). *Needs:* ShimuraVarieties 2.1; ShimuraData Layers 3–4; ReductiveGroups Layer 7; Tau Ceti
`TauCeti.Hodge.MixedHodgeStructure`.

**Checks.**

- `MixedBoundaryDatum.siegel2_rank1_test`: at a genus-two rank-one cusp, `dim U_1 = 1`,
  `dim V_1 = 2` and `dim W_1 = 3`.
- `MixedBoundaryDatum.pure_test`: when `W_1 = 1`, also `U_1 = 1` and `Lie P_1` is pure of weight `0`.
- `MixedBoundaryDatum.hodge_test`: the induced graded pieces are Tau Ceti Hodge structures on the
  weight-graded quotients.
- `MixedBoundaryDatum.radical_center_test`: taking all of `W_1` as torus character group gives rank
  `3` instead of `1` at the genus-two rank-one cusp, and is rejected.
- In the split modular boundary `P_1 = {[[a,b],[0,1]]}`, `U_1 = W_1 = G_a`, the value
  `h_{1,0}(z_1,z_2) = diag(z_1z_2,1)` has the infinite kernel `{(z,z⁻¹)}`. Its weight
  `diag(t⁻²,1)` scales `b` by `t⁻²`; it is central in `G_1 = G_m`, not in `P_1`.

### C1.2 Boundary weight and Hodge filtrations

Construct `BoundaryMHS` (suggested home `TauCeti/Geometry/Shimura/Boundary/MixedHodge`): for a
finite-dimensional rational representation of `P_1`, an arithmetic-invariant lattice, and a rational
weight filtration whose complexification is the filtration induced by `h_{1,x}`, construct the
Tau Ceti mixed Hodge structure with these rational and complex base changes. Rationality of the
weight filtration is an input; an invariant lattice alone does not imply it. Under the ambient
`SV4` predicate of ShimuraData §4.3, prove boundary inheritance: the weight in the pure quotient
`G_1` is rational and the boundary filtration on every rational `P_1`-representation is rational.
Use the ambient rational weight together with the rational parabolic weight filtration of Pink 4.6;
lifting the quotient weight through the rational unipotent radical gives the same filtration
independently of the lift. The rational-weight predicate and pure criterion remain ShimuraData
§§1.1 and 4.3's. The adjoint, `Lie U_1` and `V_1` structures are unconditional under (C1-a).

For a rational representation `ρ : G → GL(V)`, compare its restrictions to `P_1` at corresponding
points `x` and `x_1`. The complex Hodge filtrations agree; the weight filtrations can differ.
The Hodge-filtration equality requires no rational-weight assumption; interpreting both sides as
rational (mixed) Hodge structures requires their rational weight filtrations, supplied for every `ρ`
under `SV4`. A representation only of the parabolic `Q` need not carry the original `h_x`-action.
No canonical lattice is postulated. For the adjoint representation on `Lie P_1` the weight steps are
`Lie U_1 ⊆ Lie W_1 ⊆ Lie P_1`, with graded Hodge types `(−1,−1)`,
`{(−1,0),(0,−1)}` and `{(−1,1),(0,0),(1,−1)}`. Factor the boundary homomorphism through Pink's
standard construction, transport the filtrations, and identify the pure graded pieces in Tau Ceti's
graded carrier ([Pink], 1.4, 2.1(iv)–(v), 4.6 and 4.7–4.12, pp. 19–20, 29–30 and 58–63).

The API: `BoundaryMHS.weight_adjoint`; `BoundaryMHS.rationalWeight_inheritance` (ambient `SV4`
supplies the boundary rational filtrations); `BoundaryMHS.hodge_boundary_eq` (agreement of the
complex Hodge filtrations on a `G`-representation restricted to `P_1`); `BoundaryMHS.map`
(representation maps between the stated rational mixed Hodge structures are morphisms, hence
strict by Tau Ceti's strictness theorem); `BoundaryMHS.native_filtrations` (the weight and Hodge
filtrations are those induced by `h_{1,x}`, and the graded filtration is the induced quotient
filtration). *Needs:* C1.1; ShimuraData §§1.1, 4.3; Tau Ceti
`TauCeti.Hodge.MixedHodgeStructure`, `TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`
and the strictness results of `TauCeti/Geometry/Hodge/Mixed/Strictness`.

**Checks.**

- `BoundaryMHS.pure_test`: for `W_1 = 1`, `W_{−1} = 0` and `W_0 = Lie P_1` in the adjoint structure.
- `BoundaryMHS.siegel2_test`: at a genus-two rank-one cusp, `gr_{−2}` has dimension `1` and
  `gr_{−1}` dimension `2`.
- `BoundaryMHS.graded_test`: the graded Hodge filtration is the induced quotient filtration.
- For `F = ℚ(√2)`, `T = Res_{F/ℚ} G_m` and `h(z) = (zz̄,1)`, the representation `V = F`
  has stable lattice `O_F` but weights `−2,0`. In the basis `1,√2`, `W_{−1}` is the irrational
  line `a = √2b`, so no rational `WQ` exists. This occurs at the improper boundary and, after
  taking the product with modular data, at a proper boundary.
- The first-diagonal character of the upper-triangular Borel in `GL₂` does not extend to `GL₂`,
  so it does not define the ambient Hodge filtration used in the comparison.
- For the trivial representation the weight filtrations on both sides coincide in weight zero.
- The commutator of `W_1` lands in weight `−2`; it is not identified with `gr_{−1}`.

### C1.3 Pure quotients and boundary torsors

Construct `BoundaryTorsor` (suggested home `TauCeti/Geometry/Shimura/Boundary/Torsor`): at a neat
boundary level, the mixed boundary quotient as a torus torsor over an abelian-scheme torsor over a
finite cover of the pure boundary Shimura variety. The torus has character lattice dual to the
arithmetic lattice in `U_1` (with its Tate twist, `Γ_U(−1)`); the abelian directions come from the
lattice in `V_1 = W_1/U_1` with the polarization from the commutator pairing, which also determines
the class of the torus torsor through the Poincaré biextension. Assume (C1-a), neat level for the
torsor form (at non-neat level the finite stabilizer quotients are kept), and the lattices coming
from `K`; the central lattice and the weight `−1` lattice are not interchangeable. The proof follows
Pink 3.12–3.19: the `U_1`-quotient is an algebraic torus. Construct the polarized integral variation
of homological types `(−1,0),(0,−1)` from the `V_1` lattice over the neat pure boundary Shimura
variety, and apply ShimuraVarieties §5.2 (`TauCeti.Shimura.weight_one_algebraization`) to obtain
its algebraic abelian family with lattice and polarization. Construct the abelian and torus torsors
using the Poincaré biextension and descent, and compare transition maps ([Pink],
3.12–3.22, 6.1–6.7 and 7.2–7.5, pp. 47–53, 94–99 and 118–121).

The API: `BoundaryTorsor.torusCharacters` (the character lattice is dual to the integral `U_1`
lattice); `BoundaryTorsor.abelianQuotient` (the quotient by the torus is the abelian torsor over the
pure base); `BoundaryTorsor.levelChange` (level changes induce the lattice and torsor maps,
compatibly with conjugation). *Needs:* C1.1, C1.2; AbelianSchemesAndArithmeticModuli A2 (dual
abelian scheme and Poincaré biextension); ShimuraVarieties §5.2;
SchemeAndStackFoundations Layer 1 (torsors); ShimuraVarieties 0.5; Tau Ceti
`TauCeti.SplitTorus.groupScheme`.

**Checks.**

- `BoundaryTorsor.siegel2_klingen_test`: at the genus-two rank-one cusp the torus has rank `1` and
  the abelian part is an elliptic curve.
- `BoundaryTorsor.siegel2_siegel_test`: at the maximal genus-two cusp the torus has rank
  `dim Sym²(ℤ²) = 3` and there is no abelian part.
- `BoundaryTorsor.nontrivial_test`: a nontrivial character line gives a nontrivial torsor, not a
  product with `G_m`.

### C1.4 Cusp labels

Define `CuspLabel` (suggested home `TauCeti/Geometry/Shimura/Boundary/CuspLabel`): a rational
boundary component with its mixed datum and a finite-adelic representative, modulo rational
conjugation, the boundary arithmetic action and right translation by `K`; a cone label also records
`X⁰`, the corresponding `X_1⁰`, and a cone in `C*(X⁰,P_1)` on that cusp's lattice, with the induced
equivalence. Component choices are transported with the cone. Neither a representative nor a connected
component of the boundary base is identified with the whole class. Assume (C1-a), the fans of C0.13
on the common toric carriers, and Pink's finite cover `X_1`. The equivalence is generated by Pink's
elementary moves, whose commutation relations make the quotient consistent; cones are transported
through the induced integral maps. Finiteness of adelic double cosets and of cone orbits gives a
finite set of stratum labels for a complete compactification ([Pink], 6.10–6.12 and 7.2–7.5,
pp. 100–102 and 118–121).

The API: `CuspLabel.mk`; `CuspLabel.eq_iff` (two representatives give the same label exactly when
related by the elementary moves); `CuspLabel.representative_invariant`; `CuspLabel.cone_transport`;
`CuspLabel.finite` (finitely many cusp classes at finite level, and finitely many cone-label orbits
for a complete system). *Needs:* C0.13, C1.1; AdelicAlgebraicGroups 3.4 (adelic reduction and
finiteness of class sets), 3.6 (cusps); ShimuraVarieties 2.1.

**Checks.**

- `CuspLabel.modular_test`: for modular-curve data the labels are the usual double cosets of
  rational cusps with their widths.
- `CuspLabel.representative_test`: right multiplication by an element of `K` gives the same label.
- `CuspLabel.component_test`: a cusp whose base has two connected components gives one cusp label
  and two boundary strata; they are not merged.

### C1.5 Effective arithmetic stabilizers and finite overlap

Construct `CuspLabel.arithmeticStabilizer` and prove `CuspLabel.finite_overlap` (suggested home
`TauCeti/Geometry/Shimura/Boundary/Stabilizer`): the effective quotient `Δ_1` of the cusp normalizer
acting on `U_1` and its lattice, and the theorem that for rational polyhedral cones `σ, τ` in the
rational closure of the positivity cone only finitely many effective `γ ∈ Δ_1` make `γσ` meet `τ`
in the open positivity cone. Consequently a cone meeting the open positivity cone has finite
effective stabilizer, trivial at neat level. The finite effective point stabilizers on Pink's
controlled quotient neighbourhoods are likewise trivial at neat level. Cones contained entirely
in the boundary of the positivity cone require their own boundary datum; in particular the zero
cone can have an infinite stabilizer. The ineffective kernel (which can be infinite) is
identified up to the central arithmetic subgroups of Pink 6.20 and is kept in the torsor and stack
models; the full normalizer is not finite, and neatness does not remove the central kernel. Pass to
the image of the normalizer on `U_1`, and apply reduction theory for the self-adjoint homogeneous
cone: a rational polyhedral fundamental domain for the arithmetic group on the cone, with finite
overlaps (Pink 6.19(a), (b), relying on Ash–Mumford–Rapoport–Tai, Chapter II). Reduction theory for
the arithmetic group is AdelicAlgebraicGroups 3.2–3.4 ([Pink], 6.18–6.21, pp. 105–109).
*Needs:* C1.1; ShimuraVarieties 2.1; AdelicAlgebraicGroups 3.2, 3.3, 3.4; ReductiveGroups
Layer 7.

The API: `CuspLabel.arithmeticStabilizer_toLinearGroup` records the effective representation;
`CuspLabel.finite_overlap` includes the intersection with the open positivity cone;
`CuspLabel.finite_coneStabilizer` requires that the cone meet it;
`CuspLabel.ineffectiveKernel` records the kernel before taking the quotient.

**Checks.**

- An infinite central kernel is compatible with finite effective overlap.
- The effective action preserves the central lattice.
- The zero cone is fixed by the whole effective group, so finite overlap does not make its
  stabilizer finite when that group is infinite.
- For the modular curve, the cusp stabilizer in `Γ(N)` acts trivially on the rank-one cone.
  The central `−I` belongs to `Γ(N)` only for `N = 1, 2`; when present it acts ineffectively on
  the cone. In particular it is absent at full level `3`.

### C1.6 Positivity cones and boundary incidence

Prove `CuspLabel.boundary_incidence`: construct the positivity cone
`C(X⁰,P_1) ⊆ U_1(ℝ)(−1)` for a chosen connected component `X⁰` and its corresponding `X_1⁰`.
Its rational closure `C*(X⁰,P_1)` is the union of the embedded cones of compatible component-labelled
rational boundary components between the ambient datum and `(P_1,X_1)`, including both endpoints;
`C` is its open positive stratum. For
a pure ambient datum the cone is open, convex, nondegenerate, homogeneous and self-adjoint; for mixed
data there can be a lineality space, removed by Pink's quotient in 4.15. Nested boundary components
and rational conjugation act compatibly on groups, central lattices, torsors and cones, compatibly
with the incidence relation of ShimuraVarieties 2.1. Assume (C1-a) and the embedded central spaces
and quotient maps of Pink 4.22–4.25; `C*` need be neither open nor closed ([Pink], 4.15 and
4.22–4.25, pp. 64 and 68–69). *Needs:* C1.1, C1.2; ShimuraVarieties 2.1; ReductiveGroups Layer 7;
AnalyticToricGeometry Layer 0.

**Checks.**

- For the maximal Siegel cusp, `C` is the cone of positive definite symmetric forms and `C*` adds
  the positive semidefinite forms with rational radical.
- Semidefinite forms with irrational radical lie in the topological closure but not in `C*`.
- At a modular cusp for the upper-half-plane component, `C = ℝ_{>0}` and `C* = ℝ_{≥0}` includes
  the ambient pure component contributing `{0}`. The lower-half-plane component gives the opposite
  ray in the same central space; their union is not a convex positivity cone. Rational conjugation
  interchanging these components transports the ray and its fan.

### Examples

- Siegel genus two: the Klingen cusp has `dim U_1 = 1` and an elliptic abelian part; the Siegel
  cusp has torus rank `3`, no abelian part, and `C` the cone of positive definite binary forms.
- Modular curves: cusp labels are the rational cusps modulo `Γ`, each with a rank-one cone.

### Dependencies

ShimuraData §1.1 and Layers 3–4; ShimuraVarieties 0.5 and 2.1; ReductiveGroups Layer 7; AdelicAlgebraicGroups
Layer 3; AbelianSchemesAndArithmeticModuli A2 and A5; SchemeAndStackFoundations Layer 1; Tau Ceti mixed
Hodge structures; AnalyticToricGeometry Layer 0; Layer C0 (C0.13).

## Layer C2: toroidal gluing in characteristic zero

This layer builds Pink's toroidal compactification of a pure Shimura variety as a complex analytic
space, algebraizes it, and descends it to the reflex field. Analytic spaces are those of
ComplexComparisonPartII §C−1.1 (`ComplexAnalyticSpace`, with nilpotents, open gluing,
fibre products and scheme analytification), with coherent analytification from ComplexComparisonPartII
C0. The partial compactifications of the boundary torsors of C1 come from the relative torus
embeddings of C0; a controlled open neighbourhood of the image of the symmetric domain is cut out
inside them, quotients by the effective cusp stabilizers are glued, and the result is normal,
compact for a complete cone system, smooth with normal-crossings boundary at neat level for a smooth
system, and projective for a projective system. It maps to the Baily–Borel compactification of
ShimuraVarieties Layer 2 and descends to the reflex field using the canonical models of the mixed
boundary varieties (C2.10).

Standing hypothesis of the layer:

- (C2-a) `(G, X)` and `K` are as in (C1-a); cones and lattices are the common toric carriers, and the
  cone systems are compatible arithmetic systems in the sense of C0.13. No universal abelian scheme
  is assumed.

### C2.1 Partial compactifications of boundary torsors

Construct `PartialBoundaryChart` (suggested home `TauCeti/Geometry/Shimura/Toroidal/PartialChart`):
for a boundary datum of C1 and a cone system of C0, first the ambient analytic torus embedding `Y` of
the boundary torsor of C1.3, whose regular trivialized charts are the analytifications of the
relative embeddings of C0.8 (with characters, face opens and orbit strata), and then the controlled
open `Ū = Int_Y(closure_Y(U_0))`, where `U_0` is the image of the positive domain `X^+` in the
boundary quotient at the chosen level; `U_0` is open and dense in `Ū`. Assume (C2-a) and the
positivity conditions of C1.6 with their chosen `X⁰` and `X_1⁰`; the fan and controlled open use
these same components. Charts of nonregular cones are analytifications of the corresponding
monoid-algebra charts, with nilpotents in the ambient analytic category; a regular ambient chart does
not make `Ū` the whole affine chart. Restrict Pink's elementary identifications to these controlled
opens ([Pink], 6.6–6.17, especially 6.13 for the controlled open and 6.14–6.17 for the
identifications, pp. 98–105).

The API: `PartialBoundaryChart.openTorsor` (the boundary torsor is an equivariant open of `Y`, and
`U_0` is a dense open of `Ū`; controlled opens retain the arithmetic and elementary transitions that
preserve them, rather than the full complex torus action); `PartialBoundaryChart.faceOpen` (faces
give the analytified open immersions of C0.9, and the elementary identifications restrict to the
controlled opens); `PartialBoundaryChart.anchor` (a finite regular trivialized chart is the chart of
AnalyticToricGeometry Layer 2, with characters and strata); `PartialBoundaryChart.glue_hom`
(compatible analytic maps on the controlled opens glue uniquely). *Needs:* C0.8, C0.9, C1.3, C1.4,
C1.6; ComplexComparisonPartII §C−1.1 (`ComplexAnalyticSpace`, `complexSchemeAnalytification`);
ComplexComparisonPartII C0.4; AnalyticToricGeometry Layers 0, 2, 3 and 4.

**Checks.**

- `PartialBoundaryChart.zero_test`: the zero cone adds no boundary; its controlled chart is `U_0`.
- `PartialBoundaryChart.rankOne_test`: at the standard rank-one cusp the ambient ray chart is `A¹_ℂ`
  with open `G_m`, and `q = exp(2πiz)`, `Im z > 0` gives `Ū = {|q| < 1}` with `U_0 = {0 < |q| < 1}`;
  taking all of `A¹_ℂ` as the controlled chart is wrong. Multiplication by `2` sends `q = 3/4`
  outside both controlled opens, so the full torus action does not restrict.
- `PartialBoundaryChart.nilpotent_test`: analytifying a nonreduced finite-type base keeps the class
  of `ε` with `ε² = 0`; passing to the reduced manifold loses it.

### C2.2 Arithmetic quotient neighbourhoods and separation

Prove `PartialBoundaryChart.quotient_separation`: the elementary relation on the controlled charts
of C2.1 admits local quotient neighbourhoods by the cusp normalizer, has closed graph, and gives a
Hausdorff complex analytic quotient whose local stabilizers act through finite effective groups.
Apply ShimuraVarieties §P.6 (`TauCeti.Shimura.finite_analytic_quotient`) to the finite effective
stabilizers on Pink's controlled neighbourhoods, and glue using its invariant sheaves and open
restriction. This target proves the neighbourhood reduction, closedness, proper discontinuity and
gluing compatibility of Pink 6.20–6.24. At neat level their effective point stabilizers are trivial;
at arbitrary level the finite quotient is kept and smoothness is not asserted. Assume (C2-a); use
Pink's controlled neighbourhoods `V_1 ⊆ V_2 ⊆ V_3` in the rational Satake space of ShimuraVarieties
2.2. The ineffective centre acts trivially and is removed; the full cusp group is not finite. The
finite-overlap theorem C1.5 gives discontinuity on cone charts; on the controlled neighbourhoods the
chart relation is the action of the cusp normalizer, whose graph is closed ([Pink], 6.20–6.24, pp.
107–112). *Needs:* C1.5, C2.1; ShimuraVarieties §P.6, 2.2; ComplexComparisonPartII §C−1.1;
AnalyticToricGeometry Layer 3; SchemeAndStackFoundations Layer 1 (finite group quotients).

**Checks.**

- A nontrivial finite stabilizer can give a normal singular quotient (the quotient of `ℂ²` by `−1`).
- Closedness of the graph is proved; it does not follow from finiteness of cone orbits.
- For `z ↦ −z` on a one-dimensional chart the quotient coordinate is `z²`, ramified at zero;
  trivial effective stabilizer gives an unramified local quotient.

### C2.3 Arithmetic toroidal gluing

Construct `ToroidalSpace` (suggested home `TauCeti/Geometry/Shimura/Toroidal/Analytic`): the complex
analytic space `Sh_K^tor(Σ)` obtained by gluing the local quotient charts of C2.2 along Pink's
rational conjugation, level and nested-boundary transitions. It contains `Sh_K(ℂ)` as an open
subspace, is stratified by cone labels, and each controlled quotient neighbourhood is an open chart.
Assume (C2-a); completeness of `Σ` is not needed for the construction (it is needed for compactness,
C2.5). The gluing domains are the controlled opens of C2.1, not the ambient monoid charts. Form the
disjoint union of the partial charts and the interior, take the elementary equivalence relation of
Pink 6.10–6.12, descend structure sheaves through C2.2 and glue ([Pink], 6.10–6.12 and 6.24,
pp. 100–102 and 112).

The API: `ToroidalSpace.chart`; `ToroidalSpace.interior` (`Sh_K(ℂ)` is the given open);
`ToroidalSpace.strata` (strata are cone-label quotients with Pink's incidence rule);
`ToroidalSpace.chart_overlap` (cocycle on triple overlaps); `ToroidalSpace.descend_hom` (compatible
invariant maps on charts descend uniquely). *Needs:* C1.4, C1.6, C2.1, C2.2;
ComplexComparisonPartII §C−1.1; AnalyticToricGeometry Layer 3.

**Checks.**

- `ToroidalSpace.compact_interior_test`: if `G^ad` has no rational boundary components, the toroidal
  space is `Sh_K(ℂ)`.
- `ToroidalSpace.modular_q_test`: a modular cusp of width `w` gives the punctured disc in
  `q = exp(2πiz/w)` together with the point `q = 0`.
- `ToroidalSpace.anchor_test`: a trivialized finite regular chart has the face-open overlaps of
  AnalyticToricGeometry Layer 3.
- An interior point is never identified with a boundary point of another cusp.

### C2.4 Normality and the dense interior

Prove `ToroidalSpace.normal` and `ToroidalSpace.interior_dense`: the toroidal space is normal and
`Sh_K(ℂ)` is open and dense. Nonregular saturated monoid charts are allowed: normality comes from
normality of saturated monoid algebras over the normal boundary base and from finite invariant
quotients, not from the existence of a smooth refinement. The torus is schematically dense in each
monoid chart, and the identification transports through the chart relation ([Pink], 6.6 and 6.24,
pp. 98 and 112). *Needs:* C0.16, C2.2, C2.3; SchemeAndStackFoundations Layer 0;
ComplexComparisonPartII §C−1.1.

**Checks.**

- A singular saturated cone (spanned by `(1,0)` and `(1,2)`) gives a normal, nonsmooth chart.
- Normality is not asserted over the nonnormal coefficient rings allowed in C0.

### C2.5 Complete cone systems give compact toroidal spaces

Prove `ToroidalSpace.compact_of_complete`: if `Σ` is complete, the toroidal space is compact, and
once algebraized (C2.7) the algebraic model is proper over `ℂ`. Assume (C2-a) and completeness, with
finitely many cone and cusp orbits. Map the toroidal space to the compact rational Satake quotient
(C2.8 and ShimuraVarieties 2.2); controlled quotient charts and the support criterion of C0.17 give
compactness over a finite cover of the Satake base ([Pink], 6.27, pp. 114–115). Prove also, as part
of this target, the general comparison it uses: a separated algebraic space of finite type over `ℂ`
is proper if and only if its analytification is compact (SGA 1, Exposé XII, Proposition 3.2(v),
re-edition pp. 245–246, for
schemes; for algebraic spaces reduce by Chow's lemma). Properness of the integral models of C5 is a
separate valuative argument. *Needs:* C0.17, C2.3, C2.8; ShimuraVarieties 2.2; ComplexComparisonPartII
C2, C4.1 (Remmert's proper mapping theorem), C4.3 (compactification and algebraization with proper support).

**Checks.**

- Removing a cone needed for completeness destroys compactness (the single ray cone at a modular cusp
  with the cusp point removed).
- `ℂ^×` is separated of finite type, not proper, and its analytification is not compact.

### C2.6 Smooth cone systems at neat level

Prove `ToroidalSpace.smooth_normalCrossings`: at neat level and for a smooth cone system the toroidal
space is smooth and its boundary is a divisor with normal crossings in the local sense; in regular
quotient coordinates the boundary is a union of coordinate hyperplanes, as in AnalyticToricGeometry
Layer 4. Global simple normal crossings (no branch identified with another branch of the same
component) requires in addition Pink's condition 7.12(∗), achieved by the refinement of 9.20.
Assume (C2-a), `K` neat, and every cone regular for the central lattice. Neatness makes the effective
point stabilizers on the controlled neighbourhoods trivial (C1.5, C2.2), so the regular coordinates
of C0.10 and C0.12 descend ([Pink], 6.26 and
9.20–9.21, pp. 113–114 and 156–157). *Needs:* C0.10, C0.12, C1.5, C2.3; AnalyticToricGeometry
Layer 4; ComplexComparisonPartII §C−1.1.

**Checks.**

- A simplicial, nonregular cone gives a singular chart.
- Without condition 7.12(∗) two local branches can lie on one global component.

### C2.7 Algebraization

Prove `ToroidalSpace.algebraization`: for every complete `K`-admissible cone system the toroidal
space is the analytification of a proper normal algebraic space over `ℂ`, extending the
quasi-projective algebraic structure of `Sh_K(ℂ)`, and it is a projective variety whenever `Σ` is
projective in the sense of C0.15 (at non-neat level, after the finite quotient of C2.2 by a neat
normal subgroup). An algebraic space that is not projective is not called a projective scheme.
Assume (C2-a). The route is Pink's: line bundles built from logarithmic differential forms and the
polarization functions of a projective cone system are ample (Pink, Chapter 8, in particular 8.13);
Pink 9.21 constructs, for any data, projective smooth refinements to which this applies, so the
refined toroidal space is projective; Chow's theorem (ComplexComparisonPartII C4.2, with nilpotents) makes it
a projective algebraic variety in which `Sh_K(ℂ)` is Zariski open (Pink 9.24); for a general complete
`Σ` the algebraic structure is first obtained when `Σ` is fine or `K` small enough (Pink 9.28–9.33)
and in general as an algebraic space (Pink 9.34–9.35) ([Pink], Chapters 8–9, pp. 131–169, especially
9.21–9.24 and 9.28–9.35; [Pink], 12.4–12.5, pp. 197–198). *Needs:* C0.15, C1.5, C2.3, C2.4, C2.5;
ComplexComparisonPartII C2, C3.3 (derived GAGA for proper algebraic spaces), C4.2, C4.4;
SchemeAndStackFoundations Layer 1 (algebraic spaces), Layer 4 (formal completion and algebraization).

**Checks.**

- A projective cone system yields an ample line bundle, not merely a compact space.
- A complete nonprojective cone system yields an algebraic space; projectivity is not asserted.
- For the modular curve the algebraization is the smooth projective compactified modular curve.

### C2.8 The map to the minimal compactification

Construct `ToroidalSpace.toMinimal`: the continuous analytic map from the toroidal space to the
Baily–Borel compactification of ShimuraVarieties 2.5–2.7, which on each cone stratum is the
torus-and-abelian-torsor quotient map to the corresponding pure boundary stratum (C1.3). It respects
cusp labels and incidence; no boundary fibre is assumed irreducible. The maps from partial charts to
their pure boundary quotients agree under the elementary identifications and are continuous for the
Satake topology, so they glue; the cone-stratum description is Pink 7.2–7.5. The map is constructed
before compactness; for complete `Σ` it is then proper (C2.5) and algebraic (C2.7 with
ComplexComparisonPartII C4.4) ([Pink], 6.21–6.24, pp. 109–112, and 7.2–7.5, pp. 118–121). *Needs:*
C1.3, C1.6, C2.3; ShimuraVarieties 2.5, 2.7; ComplexComparisonPartII C4.4.

The API is `ToroidalSpace.toMinimal_stratum` (the pure-boundary quotient on a cone stratum),
`.toMinimal_interior` (the given open immersion into the minimal compactification) and
`.toMinimal_refinement` (compatibility with C3.1).

**Checks.**

- A cone-label stratum maps onto its pure boundary stratum.
- The map does not depend on the chosen cusp representative.
- For the modular curve, the map is the identity of the compactified curve.

### C2.9 Canonical models of toroidal compactifications

Construct `ToroidalCanonicalModel` (suggested home `TauCeti/Geometry/Shimura/Toroidal/CanonicalModel`):
for a rational cone system compatible with the descent actions, the descent of the algebraization of
C2.7 to the reflex field `E = E(G, X)`. It restricts to the canonical model of `Sh_K` over `E`
(ShimuraVarieties Layer 8, `CanonicalModel`), its boundary formal neighbourhoods are the completions
along cone strata of the relative torus embeddings (C0.8–C0.11) of the mixed canonical models
of C2.10, with the prescribed cusp stabilizer quotient and reflex-field descent, and it is a
scheme under Pink's ample-cover hypothesis of 12.4 and an algebraic space in general (12.5). Uniqueness
of canonical models on the dense interior determines morphisms once the model exists; it does not
construct the boundary descent. The reflex fields of boundary components are compared by Pink 12.1;
the Galois transports of the mixed canonical models and their formal neighbourhoods give descent data
on the interior that extend by density of special points and normality (Pink 12.6–12.8). Construct
the descended objects by Pink's ample-cover descent in 12.4 and algebraic-space descent in 12.5;
descend morphisms and check their cocycles by SGA 1, Exposé VIII, Theorem 5.2 (re-edition p. 165,
original p. 213). This last theorem alone does not give effective descent of arbitrary schemes
([Pink], 12.1–12.8, pp. 196–200). The API: `ToroidalCanonicalModel.interior`;
`ToroidalCanonicalModel.boundaryCompletion`; `ToroidalCanonicalModel.descent_cocycle`;
`ToroidalCanonicalModel.unique` (two models with the given complex comparison and boundary
identifications are uniquely isomorphic). *Needs:* C2.7, C2.8, C2.10; ShimuraVarieties Layer 8 (8.1
canonical towers, uniqueness of canonical models); SchemeAndStackFoundations Layer 1 (descent);
ComplexComparisonPartII C4.4.

**Checks.**

- `ToroidalCanonicalModel.empty_boundary_test`: for a compact Shimura variety the model is the
  canonical model itself.
- `ToroidalCanonicalModel.baseChange_C_test`: base change to `ℂ` and analytification recover C2.3.
- `ToroidalCanonicalModel.modular_cusp_test`: at a modular cusp the completed ring descends to the
  cyclotomic cusp ring with its width-normalized parameter `q`.
- A formal chart isomorphism is not used as an ordinary open overlap.
- At a modular cusp the mixed model is the punctured `q`-line; completion at `q = 0` takes
  place in its ray embedding `A¹`, giving the completed power-series chart, not in `G_m`.

### C2.10 Canonical models of mixed Shimura varieties

Prove `MixedShimura.canonicalModel_exists` (suggested home
`TauCeti/Geometry/Shimura/Mixed/CanonicalModel`): every mixed Shimura datum `(P, X)` arising as a
boundary datum in C1.1, at every open compact level, has a canonical model over its reflex field: a
model of the torus torsor over the abelian torsor over the pure boundary Shimura variety (C1.3) on
which special points have Galois action given by Pink's reciprocity law (Pink 11.5), compatible with
level and Hecke maps and with the canonical model of the pure quotient. Canonical models are unique
and functorial for morphisms and embeddings of mixed data (Pink 11.9–11.11). Existence: reduce by
Pink 11.12 to irreducible data; for data without abelian part embed into a product of a torus datum,
a pure datum and copies of Pink's datum `(P_0, h(X_0))`, each of which has a canonical model
(Pink 11.4, 11.15, and 11.17, which uses the canonical models of pure data), and apply 11.9; in
general pass through the torsor construction of 2.26(b) and the Siegel-type universal families of
11.16 ([Pink], 11.1–11.18, pp. 186–195; density of special points in 12.13–12.17). *Needs:* C1.1,
C1.3; ShimuraVarieties Layer 4 (reciprocity at special points), Layer 8 (canonical models,
uniqueness, functoriality) and the general-data route of Layer 7 for the pure factor;
AbelianSchemesAndArithmeticModuli A1–A2; PELModuli M2 (Siegel moduli with universal family).

**Checks.**

- For pure data the canonical model is that of ShimuraVarieties Layer 8.
- For a datum whose group is the torus `G_m`, the canonical model at level `K` is a finite étale
  `ℚ`-scheme on whose geometric points `Gal(ℚ̄/ℚ)` acts through the cyclotomic character.
- For the boundary datum of a modular cusp the canonical model is the punctured `q`-line over the
  cyclotomic field of the level.

### Examples

- The modular curve `Y(N)`: every cusp has a rank-one cone, the toroidal and minimal compactifications
  agree, and the canonical model is the compactified modular curve over `ℚ(ζ_N)`.
- The Siegel threefold: the Siegel cusp has torus rank `3`; a smooth projective cone system gives a
  smooth projective compactification with normal-crossings boundary.

### Dependencies

Layers C0 and C1; ComplexComparisonPartII §C−1.1; ComplexComparisonPartII C0, C2, C3
and C4; ShimuraVarieties Layers 2, 4, 7 and 8; SchemeAndStackFoundations Layer 0, Layer 1 and Layer 4;
AbelianSchemesAndArithmeticModuli A1–A2; PELModuli M2; AnalyticToricGeometry Layers 0–4.

## Layer C2.general: general-data completion

The toroidal canonical models of C2.9 for pure Shimura data that need not be of abelian type, using
the general route of ShimuraVarieties to canonical models.

### C2.general.1 Toroidal canonical models for general pure data

Prove `ToroidalCanonicalModel.general`: the construction of C2.9 for every pure Shimura datum,
using the canonical models of ShimuraVarieties 8.22–8.23 (general towers and minimal
compactifications) and the mixed canonical models of C2.10, with the same rational boundary
components, stabilizers and cone labels and the same scheme versus algebraic space distinction. No
universal abelian scheme and no integral model is introduced. Assume (C2-a). The pure inputs of C2.9
are specialized to the general route, each boundary pure datum keeps its C1 label, and the descent
and ample-cover criterion are applied as in C2.9 ([Pink], 12.4–12.5, pp. 197–198). *Needs:* C2.9,
C2.10; ShimuraVarieties 8.22, 8.23; AnalyticToricGeometry Layers 0, 2, 3 and 4.

**Checks.**

- Changing the auxiliary data of the general route does not change the boundary pure datum.
- No PEL moduli family is introduced for a general datum.

### Dependencies

C2.9, C2.10; ShimuraVarieties 8.22–8.23; AnalyticToricGeometry Layers 0, 2, 3 and 4.

## Layer C3: refinements and Hecke maps

Toroidal compactifications depend on a cone system. This layer makes the dependence harmless: a
refinement induces a proper map, level, datum and Hecke maps extend once source and target cone
systems are compatible, and two choices are compared through a common refinement. The cohomological
half proves that refinement maps preserve the structure sheaf and the boundary ideal in all degrees,
universally in the coefficients, so coherent cohomology of locally free sheaves and its cuspidal
version do not depend on the choice. The statements are made for the characteristic-zero models of
C2 and, with the same proofs on their charts, for the integral models of C5 and C6. The layer ends
with the local completed form of these comparisons; the compactified Klingen correspondence, which
also needs the characteristic-zero boundary level comparison of C4.10, is C4.16–C4.17.

Standing hypothesis of the layer:

- (C3-a) `(G, X)`, `K` and the cone systems are as in (C2-a); the models are those of C2 (or, where
  stated, the integral models of C5 and C6) with compatible boundary torsor data.

### C3.1 Refinement maps

Construct `ToroidalRefinement` (suggested home `TauCeti/Geometry/Shimura/Toroidal/Refinement`): for
a compatible refinement `Σ′` of `Σ` at fixed datum and level, with the same support, the canonical
proper map `Sh_K^tor(Σ′) → Sh_K^tor(Σ)` that is the identity on `Sh_K` and, on each regular
trivialized chart, the toric refinement map of AnalyticToricGeometry Layer 5. Identity and
composition hold as equalities of maps. The chart maps come from inclusions of character monoids;
they commute with Pink's elementary identifications, so they descend and glue; equality of supports
gives properness on charts (C0.17), and the map descends to the reflex field. The integral version
on the models of C5 is the same construction on their degeneration charts ([Pink], 6.25 and
9.22–9.23, pp. 112–113 and 157–158; [Lan], 6.4.2.2–6.4.2.3 and 7.1.1.4, pp. 524–525 and 532). The
API: `ToroidalRefinement.id`; `ToroidalRefinement.comp`; `ToroidalRefinement.interior`;
`ToroidalRefinement.proper`. On principal Siegel models, identify these maps and pulled-back
families with ArakelovGeometryAndAbelianHeights §5.0a's `SiegelModuli.toroidalRefinement` and its
family comparison. *Needs:* ArakelovGeometryAndAbelianHeights §5.0a; C0.17, C1.4, C2.9;
AnalyticToricGeometry Layers 0, 3, 4 and 5.

**Checks.**

- `ToroidalRefinement.identity_test`: refining by the same system gives the identity.
- `ToroidalRefinement.star_test`: the star subdivision of the quadrant at `(1,1)` gives the blow-up of
  `A²` at the origin, proper and birational but not an isomorphism.
- `ToroidalRefinement.anchor_test`: on a finite regular complex chart the map is the toric map of
  AnalyticToricGeometry Layer 5.

### C3.2 Level and datum maps

Prove `ToroidalRefinement.levelDatum_extend`: a level map, a morphism of Shimura data or a Hecke
translation extends to the toroidal models whenever the induced maps of central lattices send every
source cone into a target cone. The extension is defined over the compositum of the reflex fields,
preserves labelled boundary strata and satisfies the composition laws of the open maps; for a normal
subgroup of finite index with invariant cone systems, the toroidal model at the larger level is the
finite quotient of the one at the smaller level. Interior étaleness does not make a level map étale
at the boundary: the induced lattice map records the boundary ramification. Assume (C3-a) with
compatible source and target systems for the given map and the level, datum and translation maps of
ShimuraVarieties Layer 8 (and 1.5). Use the induced monomial and torsor chart maps and Pink 6.25,
descend and glue, and prove composition and the quotient statement on charts and by uniqueness on
the dense interior ([Pink], 6.25, pp. 112–113). *Needs:* C0.14, C1.5, C1.6, C3.1; ShimuraVarieties
1.5, Layer 8; AnalyticToricGeometry Layer 5.

**Checks.**

- At a modular cusp the level map `q ↦ q^p` is ramified along the boundary although the open map is
  étale in characteristic zero.
- A map of data is defined over the stated compositum of reflex fields.

### C3.3 Toroidal Hecke correspondences

Construct `ToroidalHeckeSpan`: for a Hecke double coset `KgK`, compatible cone systems at the levels
`K`, `K ∩ gKg⁻¹` and `K` and the ordered span of toroidal models extending the open Hecke span of
ShimuraVarieties 8.4, constructed from the two arrows of C3.2. Two choices of intermediate system
are compared through a common refinement. No single cone system is claimed to carry every Hecke
operator. The finite family of lattice maps admits a compatible refinement by C0.14–C0.15 ([Pink],
6.25 and 9.23, pp. 112–113 and 157–158). The API: `ToroidalHeckeSpan.openRestriction` (the open span
is that of ShimuraVarieties 8.4, with its order of arrows); `ToroidalHeckeSpan.commonRefinement`;
`ToroidalHeckeSpan.boundaryMap` (each arrow maps cone strata through the stated lattice map).
*Needs:* C0.15, C1.5, C3.2; ShimuraVarieties 8.4.

**Checks.**

- `ToroidalHeckeSpan.q_power_test`: take `g = diag(p,1)`, `p ∤ N`, `N ≥ 3`, and
  `Γ′ = Γ(N) ∩ gΓ(N)g⁻¹`. At infinity its width is `pN`; for the ordered arrows `z ↦ z` and
  `z ↦ z/p`, put `t = exp(2πiz/(pN))`. The two target cusp parameters pull back to `t^p` and
  `t`. The ordered cocharacter maps are multiplication by `p` and `1`, with ramification indices
  `p` and `1`.
- On a diagonal quadrant face at a genus-two maximal cusp, intermediate fans with rays `(1,1)`
  and `(1,2)` have common refinement with both rays and maximal cones spanned by the consecutive
  pairs `(1,0),(1,1)`, `(1,1),(1,2)` and `(1,2),(0,1)`, together with their faces.
- `ToroidalHeckeSpan.refinement_test`: subdividing that middle cone inserts new strata, while both
  ordered maps retain their character pullbacks on the torus and hence the same open Hecke span.

### C3.4 Independence through common refinements

Prove `ToroidalRefinement.choice_comparison`: any two admissible choices at fixed datum and level
receive proper maps from a common compatible refinement, and two common refinements give the same
comparisons after passing to a third. Independence of the choice means these maps and the induced
identifications of sheaves and cohomology, never equality of the compactifications ([Pink],
9.22–9.23, pp. 157–158). *Needs:* C0.14, C1.5, C3.1.

**Checks.**

- The blow-up of a regular chart and the chart itself are different spaces, compared by C3.1.

### C3.5 Toric acyclicity of refinements

Prove `TauCeti.Toric.subdivision_structureSheaf` (suggested home
`TauCeti/Geometry/Toric/Algebraic/Subdivision`): for a subdivision `Σ′ → Σ` of finite rational fans
with the same support and any commutative ring `R`, the proper toric map `π` satisfies
`O → π_*O` an isomorphism and `R^iπ_*O = 0` for `i > 0`; and for the ideal `I` of the union of the
boundary divisors (the ideal of characters strictly positive on every nonzero point of each cone,
equivalently on every primitive boundary ray) the same two statements hold with the natural map
`I → π_*I′` an isomorphism and `R^iπ_*I′ = 0`. The two degree statements are
separate assertions. Over an affine target cone, cover the inverse image by the affine charts of the
cones of `Σ′` and grade the augmented Čech complex by characters. For each weight, use the
contractibility or emptiness of the excluded half-space subcomplex to obtain integral augmented
acyclicity, including the degree-zero identification; use its contraction before extending scalars
to `R`. The boundary version uses weak rather than strict inequalities for the excluded weights.
This is the weight argument of [LanHK], Lemma 7.5 and Proposition 7.8, pp. 18–19, applied to a
finite subdivision; compare [Lan], Lemma 7.1.1.4 and its proof, pp. 532–533, and [Lan17],
Proposition 7.5 and its proof, pp. 28–29. A cone relative to its entire boundary is not itself
contractible; that pair is not the claimed graded complex. Normality of the source alone gives neither
statement. *Needs:* C0.16, C0.17; SchemeAndStackFoundations Layer 2 (Čech cohomology of quasi-coherent
sheaves); AnalyticToricGeometry Layer 5.

**Checks.**

- For the blow-up of the quadrant, `π_*O = O` and the positive higher direct images vanish.
- For the same blow-up, `π_*I′ = (xy)`, while the pullback of `(xy)` vanishes to order `2` along the
  exceptional curve, so `π^*I ≠ I′`.
- Over `ℤ/4` both statements hold with the nilpotent kept.
- In the quadrant `⟨(1, 0), (a, b)⟩ = a` is positive in the interior but is zero on the second
  ray: `x` is not in `(xy)`. The character `(1, 1)` is positive on both rays and gives `xy`.

### C3.6 Structure-sheaf pushforward along refinements

Prove `ToroidalRefinement.pushforward_structureSheaf`: for a refinement map `f` of the normal
arithmetic toroidal models (of C2, and of the integral and normalized models of C5 in Lan's 2017
setting), `O_X → f_*O_{X′}` is an isomorphism. For a change of level from `H` to `H′` with `H` normal
in `H′`, the target functions are the `H′/H`-invariants in the pushforward from the finer level `H`.
(In Lan's Proposition 7.5 the two groups are written in the opposite order; the invariants are taken
under `H′/H`, as the level direction of his Proposition 7.3 requires.) On equal-level toric charts
this is the degree-zero part of C3.5; descend through the torsor and quotient charts, using
normality and Zariski's main theorem for normalized charts ([Lan17], Proposition 7.5, (7.6) and the
proof (7.10)–(7.14), pp. 28–29, and Proposition 7.3, p. 27). *Needs:* C3.1, C3.5;
SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- For `H` normal in `H′`, the target functions are the `H′/H`-invariants; using `H/H′` or reversing
  the inclusion is wrong; equal levels give the plain isomorphism.

### C3.6a Formal functions for algebraic spaces

Prove `ToroidalRefinement.algebraicSpace_formalFunctions`: for a proper morphism `f : X → Y` of
locally Noetherian algebraic spaces, a coherent module `E` on `X` and a coherent ideal `I` on `Y`,
construct, in every degree `i ≥ 0`, the canonical isomorphisms
`(R^i f_*E)^∧ ≅ R^i f̂_*(Ê) ≅ lim_n R^i f_*(E/I^{n+1}E)` along `V(I)`.
On an affine étale target `Spec A → Y`, identify them with the completion of the finite module
`H^i(X_A,E)` and its cohomology on the thickenings. Prove compatibility with étale localization
and the transition maps of thickenings. Use formal functions for proper algebraic spaces
([Stacks], Theorem 69.22.5, Tag 08AZ, in Situation 69.22.1, Tag 08AV), glue its affine-target
comparisons, and identify formal cohomology using the coherent-thickening Mittag-Leffler argument
of AdicSpacesPartIII §F0.6. The restriction to schemes agrees with that supplier's formal-functions
and formal-direct-image maps. For non-neat finite quotient-stack refinement maps of C5,
pull back along a compatible neat cover of the target, apply the comparison to the proper
base-changed algebraic-space morphism, and descend the equivariant sheaf comparison to the
quotient stack.
*Needs:* SchemeAndStackFoundations Layer 1 (algebraic spaces and descent), Layer 2 (coherent higher
direct images); AdicSpacesPartIII §F0.6 (formal-functions-affine, theorem-on-formal-functions,
formal-direct-image-comparison).

**Checks.**

- For `P¹_{k[t]} → Spec k[t]`, `E = O(−2)`, `I = (t)` and `i = 1`, both completed modules
  are `k[[t]]`; the comparison preserves their quotient maps to `k[t]/(t^{n+1})`.
- For `Spec A′ → Spec A` finite, degree zero is `A′ ⊗_A Â ≅ lim_n A′/I^{n+1}A′`.
- For `I = 0` the comparison is the identity; for `I = O_Y` all three completed modules vanish.
- An étale scheme atlas of a proper algebraic space need not be proper over `Y`; the proper
  source in the affine-target theorem is the whole base change `X_A`.

### C3.7 Higher direct images along refinements

Prove `ToroidalRefinement.higherDirectImage_structureSheaf`: for a same-level refinement of the models
of C2 or C5, `R^i f_*O_{X′} = 0` for all `i > 0`, locally on the target; for Lan's 2017 normalized
integral models this holds in his projective-cone and lattice-collection setting. On each inverse
image of an affine target chart apply the positive-degree part of C3.5 and descend through the torsor
and finite-quotient charts; formal completions are compared by the theorem on formal functions
(C3.6a, including algebraic spaces), not by recognising completed coordinate rings ([Lan17], Proposition 7.5,
(7.8) and its proof, pp. 28–29). *Needs:* C3.1, C3.5, C3.6a;
SchemeAndStackFoundations Layer 1, Layer 2.

**Checks.**

- Every `R^i` with `i > 0` is computed; the vanishing is not deduced from `f_*O = O`.
- For the blow-up of the quadrant, the exceptional `P¹` contributes no positive-degree
  structure-sheaf cohomology, consistently with C3.5.
- On a nonschematic algebraic-space model, C3.6a applies to the proper refinement itself;
  a nonproper scheme atlas does not replace it.

### C3.8 The boundary ideal along refinements

Prove `ToroidalRefinement.pushforward_boundaryIdeal`: for a same-level refinement of the models,
`f_*I_{D′} = I_D` and `R^i f_*I_{D′} = 0` for `i > 0`, where on a relative toric chart `I_D` is the
ideal of the union of the boundary divisors (distinct from the face ideal of a closed stratum,
C0.18) and, over a nonreduced base, the base change of that ideal rather than its radical. On the
regular integral models it is the reduced Cartier boundary ideal. In general the image ideal
`I_D·O_{X′}` is contained in `I_{D′}`; the map `f^*I_D → I_{D′}` can have a torsion kernel. For
Cartier `D`, `f^*I_D` identifies with its image ideal. For a change of level as in C3.6, the
degree-zero statement takes `H′/H`-invariants. Use the boundary-ideal part of C3.5 and descend as in
C3.7 ([Lan17], Proposition 7.5, (7.7) and (7.9), pp. 28–29; [Pilloni20], 5.3 and Theorem 6.1.5.1(2),
pp. 24 and 29, where the comparison is used in this derived form rather than as an equality of
pullbacks). *Needs:* C0.12, C3.1, C3.5; SchemeAndStackFoundations Layer 1, Layer 2.

**Checks.**

- Blowing up the origin: the pullback of `(xy)` has exceptional order `2`, the new boundary ideal
  order `1`.
- For the quadrant, the union ideal is `(xy)` and the closed-stratum ideal is `(x, y)`.
- At a change of level the degree-zero identification takes `H′/H`-invariants.
- On the cubic Veronese cone `A = k[s³,s²t,st²,t³]`, the boundary ideal
  `I = (s²t,st²)` pulls back on the resolution chart `B = k[u,v]` via
  `(s³,s²t,st²,t³) ↦ (u,uv,uv²,uv³)`. At `(u,v)`, `I ⊗_A B` needs two generators but
  its image `IB = (uv)` needs one; the natural map has a nonzero kernel.

### C3.9 Coherent cohomology does not depend on the cone system

Prove `ToroidalRefinement.cohomology_iso`: for a same-level refinement `f : X′ → X` of the toroidal
models and every locally free sheaf `E` of finite rank on `X`, with `E′ = f^*E`, the maps
`H^i(X, E) → H^i(X′, E′)` and `H^i(X, E ⊗ I_D) → H^i(X′, E′ ⊗ I_{D′})` are isomorphisms for all `i`.
Over the good integral base `B` of C5 the same holds for `E ⊗_B M` for every `B`-module `M`, flat or
not, under Lan's hypotheses in 7.1.1.4 (a Dedekind or field base). No automorphic structure on `E` is
used. Combine C3.6–C3.8 with the projection formula
for locally free sheaves; for arbitrary `M`, reduce by filtered colimits to finitely generated
modules, split them over the Dedekind base into torsion and projective parts, and use the universal
form of C3.5 for the torsion quotients. Fan independence follows through common refinements (C3.4)
([Lan], 7.1.1.4–7.1.1.5, pp. 532–533; [CG], 5.2, pp. 821–822, and A.3.2, pp. 886–888;
[Pilloni20], 5.3, p. 24). *Needs:* C3.4, C3.6, C3.7, C3.8; SchemeAndStackFoundations Layer 2 (projection
formula, cohomology and filtered colimits).

**Checks.**

- The statement holds for `M = B/ϖ^n`, which is not flat.
- It holds in every degree, not only for `H^0`.

### C3.10 Completed local comparisons

Prove `ToroidalRefinement.completed_local`: for a refinement map `f` of the integral models over a
noetherian `p`-adic base, the comparisons of C3.6–C3.8 hold for the `p`-adic formal completions
`f̂ : X̂′ → X̂`, locally on each formal affine open of the target and on every open subset of it (for
instance an ordinary locus), with all finite quotient actions kept. For a projective system of such
refinement maps in a countable cofinal tower of finite levels, with compatible comparison maps,
the degreewise isomorphisms induce isomorphisms of the ordinary inverse limits of completed
cohomology groups. To identify these limits with cohomology of the derived inverse limit, require
Mittag-Leffler in every cohomological degree on both sides and apply the Milnor exact sequence;
Mittag-Leffler for sections alone does not control higher cohomology. No interchange of completed
tensor products with cohomology is asserted. Use C3.6a for algebraic-space formal functions and
formal higher direct images, together with the Mittag-Leffler property of the cohomology of
thickenings (AdicSpacesPartIII §F0.6 (formal-functions-affine)). On non-neat quotient stacks use
the neat-cover descent of C3.6a. Boxer–Pilloni apply this on partial compactifications of Igusa
towers and Pilloni with completed coefficients; those towers are built in the roadmaps that build on
this one ([BP], 3.4.15–3.4.16, p. 39; [Pilloni20], 3.4, pp. 15–16). *Needs:* C3.6a, C3.7, C3.8,
C3.9; AdicSpacesPartIII §F0.6 (cohomology-of-mittag-leffler-limit), §F0.6 (theorem-on-formal-functions), §F0.6 (formal-functions-affine), §F0.6 (formal-direct-image-comparison); SchemeAndStackFoundations Layer 2;
ArithmeticGaloisDuality R02.1.1 (Milnor exact sequence).

**Checks.**

- The statement is local on the target before any limit is taken.
- A completed tensor product with a non-noetherian valuation ring is not exchanged with cohomology.
- A tower concentrated in degree one has zero sections regardless of its degree-one transition
  maps; sections alone cannot impose the required Mittag-Leffler condition in degree one.

### Examples

- The star subdivision of the quadrant is the blow-up of `A²` at `0`: `π_*O = O`, higher direct
  images vanish, and the boundary ideal `(xy)` pulls back to an ideal strictly smaller than the new
  boundary ideal.
- At a modular cusp, the `p`-isogeny arrows of the Hecke correspondence `T_p` are `q ↦ q^p` and
  `q ↦ q` on the boundary.

### Dependencies

Layers C0–C2; ShimuraVarieties 1.5 and Layer 8; AdicSpacesPartIII F0;
SchemeAndStackFoundations Layers 0–2; AnalyticToricGeometry Layers 0–5.

## Layer C3.general: general-data maps and correspondences

### C3.general.1 Maps of general toroidal canonical models

Prove `ToroidalCanonicalModel.general_functorial`: the refinement, level, datum and ordered Hecke
maps of C3.1–C3.4 descend to the general toroidal canonical models of C2.general.1, over the
compositum of reflex fields prescribed by the functoriality of ShimuraVarieties 8.22–8.23, preserving
boundary labels and common-refinement comparisons, with identity and composition after descent. The
coefficient theorems C3.5–C3.10 keep their hypotheses. Identify the open restrictions with the maps
of the general route, descend using the canonical boundary models (C2.10) and uniqueness on the dense
interior, and check identities after base change to `ℂ` ([Pink], 6.25 and 12.4–12.8, pp. 112–113 and
197–200). *Needs:* C2.general.1, C3.2, C3.3, C3.4; ShimuraVarieties 8.22–8.23; AnalyticToricGeometry
Layers 0–5.

**Checks.**

- A map of general data is defined over the specified compositum of reflex fields.
- No integral extension at any prime is added.

### Dependencies

C2.general.1, C3.2–C3.4; ShimuraVarieties 8.22–8.23.

## Layer C4: degenerations of polarized abelian schemes

The boundary charts of an integral compactification carry degenerating abelian schemes. This layer
develops the relative theory of Mumford, Faltings–Chai and Lan: semi-abelian schemes with their
character sheaves and Hodge bundles, torus extensions of abelian schemes, polarized degeneration
data over a complete normal base, Mumford's quotient construction and the equivalence between
degenerations and their data, and the universal degeneration over the formal completion of a cusp
chart. It then extends homomorphisms, endomorphisms and level structures across the boundary,
compares elliptic degeneration data with the Tate curve, and computes the boundary behaviour of Tate modules,
of Kodaira–Spencer and of the Hasse invariant. The local theory over a complete discrete valuation
ring (Raynaud extension and rigid uniformization) is NeronModelsAndSemistableAbelianVarieties 3.13–3.14;
this layer works over complete normal bases. The compactified Klingen correspondence of the Siegel
threefold, which uses the characteristic-zero level comparison of C4.10, closes the layer.

Standing hypotheses of the layer:

- (C4-a) `R` is a noetherian normal domain, complete for a radical ideal `I`, `S = Spec R` and `η` the
  generic point; tori are isotrivial, and the cubical rigidifications are those of Lan 4.1 and
  4.2.1.1. Over a complete discrete valuation ring this specializes to the local setting of
  NeronModelsAndSemistableAbelianVarieties 3.13.
- (C4-b) A PEL datum with order, lattice, pairing and reflex field `F_0` as in PELModuli M0–M1;
  `B = Spec O_{F_0,(□)}` for a set `□` of good primes in Lan's sense 1.4.1.1 (no prime of `□` divides
  the level integer, `I_bad` or `Disc[L^# : L]`), with the unramifiedness, polarization and `p = 2`
  restrictions of PELModuli M2 and a level `H` prime to `□`.

### C4.1 Semi-abelian schemes

Use `GroupScheme.IsSemiAbelianFamily` from ArakelovGeometryAndAbelianHeights §2.0.
`SemiAbelianScheme` denotes a smooth separated commutative group scheme of finite presentation with
that supplied fibrewise predicate, rather than a second predicate or a chosen torus extension. Its
geometric fibres are extensions of abelian varieties by tori. The relative dimension and the
character sheaf of the maximal fibrewise torus (C4.2) are part of its API. A global extension by a
relative torus exists only on loci where the toric rank is locally constant; it is not part of the
definition, since the toric rank jumps in a degenerating family. Finite presentation is retained
under base change ([Lan], Definition 3.3.1.1 and Remarks 3.3.1.2–3.3.1.3, pp. 191–192, and Theorem
3.3.1.9, Corollary 3.3.1.10, p. 193). Algebraic-space bases are treated through étale atlases
(SchemeAndStackFoundations Layer 1).

The API: `SemiAbelianScheme.baseChange`; `SemiAbelianScheme.characterSheaf`;
`SemiAbelianScheme.ofAbelian` (an abelian scheme, with zero character sheaf);
`SemiAbelianScheme.constantRankExtension` (on a locus of constant toric rank, an extension of an
abelian scheme by a torus); `SemiAbelianScheme.ofGroup` and `SemiAbelianScheme.ext` (the conditions
are properties of a group scheme, so no torus splitting is chosen); and `SemiAbelianScheme.hodgeBundle`:
the Hodge bundle `E = e^*Ω¹_{G/S}`, locally free of rank the relative dimension, with determinant
`ω = det E`, compatible with base change, and on a constant-rank stratum with extension
`0 → T → G → A → 0` an exact sequence `0 → e^*Ω¹_A → E → X(T) ⊗ O_S → 0`, dual to
`0 → Lie T → Lie G → Lie A → 0` (for a torus the invariant differentials are `X(T) ⊗ O_S`, by
`χ ↦ dχ/χ`). This Hodge bundle is the one used in
C4–C6, and AutomorphicBundles builds its coefficient bundles on it. *Needs:*
ArakelovGeometryAndAbelianHeights §2.0;
AbelianSchemesAndArithmeticModuli A0.1 (abelian schemes), A1.3 (invariant differentials);
SchemeAndStackFoundations Layer 0, Layer 1; Tau Ceti `TauCeti.SplitTorus.groupScheme`.

**Checks.**

- `SemiAbelianScheme.abelian_test`: an abelian scheme has toric rank `0`.
- `SemiAbelianScheme.splitTorus_test`: the split torus of rank `r` is semi-abelian with character
  sheaf `ℤ^r` and zero abelian quotient.
- `SemiAbelianScheme.tate_rank_test`: the Tate family has toric rank `0` generically and `1` at the
  boundary.
- `SemiAbelianScheme.additive_test`: `G_a` is excluded; its fibres are not extensions of abelian
  varieties by tori.
- For `G_m` the Hodge bundle is free on `du/u`.

### C4.2 Character sheaves and homomorphisms from tori

Prove `SemiAbelianScheme.characterSheaf_spec`: for a semi-abelian scheme `G` over any scheme `S`,
the étale constructible sheaf `X(G)` restricts on every geometric fibre to the character lattice of
the maximal torus, and homomorphisms from a torus `T` to `G` correspond to maps `X(G) → X(T)` with the
specialization maps kept; on a constant-rank locus this is the usual anti-equivalence for tori. No
normality or noetherian hypothesis on `S` is needed for the statement; normality enters only through
the extension of a generic subtorus over a normal base used in the proof. Sections of `X(G)` are
fibrewise Galois-invariant characters satisfying the specialization condition along discrete
valuation rings; reduce to a reduced finite-type base and argue by noetherian induction. A
constructible sheaf with jumping rank is not replaced by a local system ([Lan], 3.3.1.8–3.3.1.10,
pp. 192–193; [FC], Chapter I, Proposition 2.9, Theorem 2.10 and Corollary 2.11, pp. 11–13). *Needs:*
C4.1; SchemeAndStackFoundations Layer 1 (étale sheaves and descent).

**Checks.**

- For `G = T` the correspondence is the contravariant character-lattice description of `Hom`.
- For an abelian scheme every homomorphism from a torus is zero.

### C4.3 Torus extensions of abelian schemes

Prove `TorusExtension.classification`: for an abelian scheme `A` and an isotrivial torus `T` with
character sheaf `X`, commutative extensions `0 → T → G → A → 0` correspond to homomorphisms
`c : X → A^∨` (an anti-equivalence of categories, and for fixed `A`, `T` a classification of extension
classes). With Lan's convention, the rigidified line bundle attached to `χ` corresponds to the
pushout of the torsor `G → A` along `−χ`; this sign, equivalently the use of the inverse Poincaré
biextension, is kept in reconstruction, multiplication, base change and duality. Use the locally
noetherian base and isotrivial character data of Lan 4.2.1; a split torus is not assumed without an
étale trivialization. The extension law puts each class in `Pic⁰ = A^∨`, and the graded algebra
`⊕_χ L_χ` of C0.21 reconstructs `G`, with multiplication from the Poincaré biextension ([Lan],
Proposition 3.1.5.1, p. 183, and 4.2.1.7, 4.2.1.13, pp. 210 and 213). *Needs:* C0.21, C4.1, C4.2;
AbelianSchemesAndArithmeticModuli A2.2 (dual abelian scheme and Poincaré bundle), A2.3 (biextension
identities); SchemeAndStackFoundations Layer 1.

**Checks.**

- `c = 0` gives the split extension `A × T`.
- A nonzero `c` gives a nontrivial character line, which the torsor charts of C0.8 keep.
- For `X = ℤ` and `c(1) = P`, write `L_P` for the rigidified Poincaré line representing `P`.
  Pushout along `−1` has line `L_P`, while pushout along `+1` has line `L_P⁻¹ = L_{−P}`;
  replacing the sign exchanges these two lines.

### C4.4 Polarized degeneration data

Define `PolarizedDegenerationData` (suggested home `TauCeti/AlgebraicGeometry/Degeneration/Data`), Lan's
`DD_pol(R, I)` of Definition 4.4.6: an abelian scheme `A` over `S` with polarization `λ_A`, isotrivial
finite free sheaves `X`, `Y`, an injective `φ : Y → X` with finite cokernel, maps `c : X → A^∨` and
`c^∨ : Y → A` with `λ_A c^∨ = c φ`, and a bilinear rigidified trivialization `τ` of the pullback of the
inverse Poincaré biextension to `Y × X` over the generic fibre, satisfying the cubical and symmetry
relations and positivity: for `y ≠ 0`, the section `τ(y, φ(y))` and its translates vanish along `I`.
The periods live on the generic fibre; there is no map `Y → G` over `S`. The associated generic
polarized 1-motive is `[Y → G_η]`, with `G` the extension defined by `c` and the period map defined
by `τ`. The ample data `L^♮`, `ψ` of Lan's larger `DD_ample` are derived from `DD_pol` as in his
Remark 4.4.7, which produces `2λ_A` ([Lan], Definition 4.4.6 and Remark 4.4.7, p. 251; 4.2.1.7 and
4.2.1.13–4.2.1.14, pp. 210 and 213–214). Assume (C4-a).

The API: `PolarizedDegenerationData.extension`; `.baseChange` (along admissible complete base changes
preserving `I` and positivity); `.localRaynaud` (over a complete discrete valuation ring, the datum of
the Raynaud extension and period lattice of NeronModelsAndSemistableAbelianVarieties 3.13–3.14);
`.period_pairing` (bilinear and symmetric with the stated `φ` and sign); `.genericOneMotive`;
`.iso_iff` (isomorphisms are isomorphisms of `A`, `X`, `Y` commuting with all data); `.toAmple`
(`M = (Id, λ_A)^*P_A`, `L^♮ = π^*M`, `ψ = (Id_Y, φ)^*τ`, with `2λ_A`). *Needs:* C4.3;
NeronModelsAndSemistableAbelianVarieties 3.13, 3.14; AbelianSchemesAndArithmeticModuli A2.2, A2.5
(polarizations).

**Checks.**

- `PolarizedDegenerationData.rankZero_test`: `X = Y = 0` gives `A` with its polarization.
- `PolarizedDegenerationData.tate_test`: for `A = 0`, `X = Y = ℤ`, the standard principal polarization and period `q`, positivity is `v(q) > 0`
  and the datum is that of the Tate curve.
- `PolarizedDegenerationData.local_test`: over a complete discrete valuation ring the character and
  period lattices are those of NeronModelsAndSemistableAbelianVarieties 3.13.
- `PolarizedDegenerationData.negative_test`: the period `q⁻¹` with `v(q) > 0` fails positivity.

### C4.5 Mumford's construction

Construct `MumfordDegeneration` (suggested home `TauCeti/AlgebraicGeometry/Degeneration/Mumford`):
from positive polarized degeneration data and a compatible rational polyhedral decomposition, the
relatively complete model of the torus extension, its formal quotient by the period lattice with the
descended ample line, and the algebraization of that projective formal quotient over the complete
base, giving a semi-abelian degeneration whose generic fibre is a polarized abelian scheme. Assume
(C4-a), a compatible polarization and decomposition, the cubical identities and positivity. The
relatively complete model is built from the relative torus charts of C0.8 with the multiplication of
line bundles induced by `τ`; positivity makes the period action discrete on the formal model; the
ample line descends after passing to a finite-index sublattice `Y_0`, and the full lattice action
descends afterwards; the formal quotient is algebraized by Grothendieck's existence theorem
(AdicSpacesPartIII §F0.8 (grothendieck-algebraization)). The relatively complete models and theta
functions are Lan 4.5.1–4.5.2 and Faltings–Chai III.3 ([Lan], 4.5.1–4.5.2, in particular Proposition
4.5.2.15, (4.5.2.16), Construction 4.5.2.17 and Definition 4.5.2.18, pp. 260–275; [FC], Chapter III,
§3). The API: `MumfordDegeneration.genericFibre`; `.formalCompletion`; `.fanComparison` (compatible
subdivisions give comparison maps agreeing on the generic fibre). On principal Siegel data use
ArakelovGeometryAndAbelianHeights §5.0a and identify this interface with its supplied
specialization. *Needs:* ArakelovGeometryAndAbelianHeights §5.0a; C0.8, C0.15, C4.4;
AdicSpacesPartIII §F0.7 (grothendieck-existence), §F0.8 (grothendieck-algebraization);
SchemeAndStackFoundations Layer 1, Layer 4; NeronModelsAndSemistableAbelianVarieties 3.14.

**Checks.**

- `MumfordDegeneration.rankZero_test`: the datum with no periods returns `A`.
- `MumfordDegeneration.tate_test`: with `A = 0`, `X = Y = ℤ` and the standard principal polarization, period `q` gives `G_m/q^ℤ` on the generic analytic
  fibre.
- `MumfordDegeneration.refinement_test`: a compatible subdivision changes the model by a toroidal
  comparison and keeps the generic uniformization.

### C4.6 The degeneration equivalence

Prove `MumfordDegeneration.equivalence`: under (C4-a), the functor sending a semi-abelian degeneration
with polarized abelian generic fibre to its polarized degeneration data is an equivalence between
Lan's groupoids `DEG_pol(R, I)` and `DD_pol(R, I)`, whose morphisms are structure-preserving
isomorphisms; it is not an equivalence for arbitrary generic homomorphisms. Full faithfulness: extend a
generic isomorphism and its inverse by C4.8, so composites are identities by uniqueness, and match the
polarization, character, period and biextension data. Essential surjectivity: Mumford's construction
C4.5. Singular complete rings outside the normal-domain setting are not covered ([Lan], 4.4.1–4.4.16,
pp. 250–255; [FC], Chapter III). *Needs:* C4.4, C4.5, C4.8; NeronModelsAndSemistableAbelianVarieties
3.13; SchemeAndStackFoundations Layer 4.

**Checks.**

- The functor is fully faithful on isomorphisms, not merely bijective on isomorphism classes.
- Over a complete discrete valuation ring the equivalence agrees with the Raynaud extension and
  uniformization of NeronModelsAndSemistableAbelianVarieties 3.13–3.14.

### C4.7 The universal degeneration on a cusp chart

Construct `UniversalDegeneration` (suggested home `TauCeti/Geometry/Shimura/Boundary/Degeneration`):
for a PEL cusp label, the universal positive degeneration datum over the formal completion of its
relative torus embedding along the stratum of a cone in the interior of the positivity cone, and its
image under C4.6: a formal semi-abelian family with polarization, torus characters, abelian quotient
and generic PEL structure, compatible with faces and with changes of cusp representative. Assume
(C4-b). The data `c, c^∨, φ, τ` are the tautological ones of the boundary torsor (C1.3) and its graded
monomials; positivity holds because the cone is in the interior; faces and representatives are
compared by full faithfulness ([Lan], 6.2.5.25–6.2.5.28 and 6.3.2.5, pp. 484–487 and 503). The API:
`UniversalDegeneration.character`; `.genericPEL`; `.faceRestriction`. *Needs:* C0.8, C1.3, C4.6;
PELModuli M1.2 (PEL-type abelian schemes), M1.7; SchemeAndStackFoundations Layer 1, Layer 4.

**Checks.**

- `UniversalDegeneration.rankZero_test`: at toric rank zero the family is the universal abelian family
  of the lower-dimensional boundary moduli space.
- `UniversalDegeneration.tate_test`: at a modular cusp the period is `q` and the invariant
  differential of the fibre is `du/u`.
- `UniversalDegeneration.representative_test`: equivalent cusp representatives give isomorphic
  families through the descent map.

### C4.8 Extension of homomorphisms

Prove `SemiAbelianScheme.hom_extend`: for semi-abelian schemes `G`, `H` over a locally noetherian
normal scheme `S` and a dense open `U ⊆ S`, restriction `Hom_S(G, H) → Hom_U(G_U, H_U)` is
bijective; the same holds over normal algebraic spaces by étale descent. Apply the supplied
`GroupScheme.semiAbelianHom_extend` of ArakelovGeometryAndAbelianHeights §2.0 on Noetherian normal
affine opens. Uniqueness makes the extensions agree on overlaps; descent along normal étale atlases
then supplies the algebraic-space statement. All families use C4.1's finite-presentation carrier
([FC], Chapter I, Proposition 2.7 and its proof, pp. 9–11; [Lan], 3.3.1.5, p. 192; [BP], Lemma
4.2.2, p. 43). *Needs:* C4.1; ArakelovGeometryAndAbelianHeights §2.0;
NeronModelsAndSemistableAbelianVarieties Layer 1, 3.10; SchemeAndStackFoundations Layer 1, Layer 4
(Stein factorization).

**Checks.**

- The restriction map is a bijection of homomorphisms.
- Existence of an extension does not make its kernel finite flat (see C4.11).
- On `G_m` over a normal base, `u ↦ u²` extends across residue characteristic two; extension
  does not require the homomorphism to be étale.

### C4.9 PEL endomorphisms across the boundary

Prove `UniversalDegeneration.endomorphism_extend`: the generic action of the order `O` on the
universal family extends uniquely to the semi-abelian family over the normal boundary base, as a ring
action compatible with the polarization and the Rosati involution, because these identities hold on a
dense open. Polarizations and their duality are kept in the degeneration category; no dual of a
semi-abelian scheme is assumed. Extend each endomorphism by C4.8 and check sums, products, identity
and the Rosati relation by uniqueness, together with compatibility with characters, periods and chart
descent ([Lan], 6.3.2.5–6.3.2.6, pp. 503–504). *Needs:* C4.7, C4.8; PELModuli M1.2;
AbelianSchemesAndArithmeticModuli A3.9 (the Rosati involution).

**Checks.**

- The extended action is a ring homomorphism.
- The Rosati identity holds with the given polarization datum.

### C4.10 Level structures at the boundary

Prove `UniversalDegeneration.level_compare`: on a cusp chart, the level structures prime to `□` of the
generic PEL family correspond to level data on the degeneration (on the character and period lattices
and on the abelian part), and the finite étale tame part extends across the boundary. At `p`-power
level compare only on the characteristic-zero generic fibre with the actual generic level maps of
PELModuli M4.5–M4.6. The integral higher-`p`-level boundary normalization and completed changed-lattice
charts are constructed in C5.19–C5.20 from this tame/generic comparison. An étale level torsor on the
open part need not extend étale over the boundary: the cusp map `q ↦ q^p` is ramified. Identify tame
torsion through the degeneration data and check the generic level maps and descent along
representatives ([Lan], 6.2.5 and 6.4.1.1(5), pp. 484–487 and
519–523; [Pilloni20], 13.2.1, p. 85). *Needs:* C4.4, C4.8; PELModuli M4.5, M4.6;
ModularCurvesPartII 3.6 (Tate `n`-gons), 3.7 (power isogenies), 4.8 (cusp parameters).

**Checks.**

- The `p`-isogeny of the Tate curve has ramified base map `q ↦ q^p`.
- Tame level data are preserved; `p`-level structures are not asserted étale at the boundary.
- At trivial generic higher level, the comparison is the identity; no integral boundary
  normalization is needed as input to this target.

### C4.11 Isogenies at the boundary

Prove `SemiAbelianScheme.isogeny_extend_quasiFiniteFlat`: in the setting of Boxer–Pilloni (a normal
boundary base, a semi-abelian family and a generic isogeny of `p`-power degree), the isogeny and an
inverse up to `[m]` extend (C4.8), and the extended isogeny is quasi-finite and flat. Its kernel need
not be finite, and its order can drop at the boundary, so it is not finite locally free of constant
rank. Zero-dimensional fibres and flatness follow from the induced maps on toric parts, abelian parts
and lattices, by fibrewise flatness over the normal base. For the Tate curve, the map `G_{q^p} → G_q`
that is the identity on the multiplicative coordinate has generic kernel of order `p` and trivial
special kernel ([BP], 4.1.1 and Lemma 4.2.2, pp. 41 and 43). *Needs:* C4.4, C4.8;
SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- The extended kernel is quasi-finite flat.
- The Tate example has kernel order `p` generically and `1` at the boundary, so no finite flat kernel
  of constant rank exists.

### C4.12 The Tate curve

Prove `MumfordDegeneration.tate_compare`: for `A = 0`, `X = Y = ℤ`, the standard principal
polarization and positive period `q`, C4.5–C4.6 recover the semi-abelian identity family of the Tate
elliptic curve. Compare its generalized Tate `n`-gon compactification separately with
ModularCurvesPartII 3.6, retaining the period, polarization,
invariant differential `du/u`, torsion, and base-parameter maps under the two standard `p`-isogenies
(ModularCurvesPartII 3.7); the generic torsion sequence and the loss of rank on the special fibre are
kept. For a period `q` of positive valuation, the quotient maps `u ↦ u^p` (period `q` to `q^p`) and the
identity on `u` (period `q^p` to `q`) are distinguished ([Lan], 4.4–4.5 in rank one, pp. 250–281).
*Needs:* C4.4, C4.6; ModularCurvesPartII 3.6, 3.7, 4.8.

**Checks.**

- Under `u ↦ u^p`, `du/u` pulls back to `p·du/u`.
- The identity on `u` from period `q^p` to period `q` has generic kernel of order `p` and trivial
  special kernel.
- The product of a Tate degeneration with a constant elliptic curve has toric rank one but
  generic dimension two and a one-dimensional abelian quotient; it is not a Tate elliptic curve.

### C4.13 Logarithmic Kodaira–Spencer for the Tate curve

Prove `MumfordDegeneration.tate_logKodairaSpencer`: for the Tate family with its polarization and
Hodge line `E`, the Kodaira–Spencer map extends to an isomorphism `E^{⊗2} ≅ Ω¹_base(log ∞)` sending
`(du/u)^{⊗2}` to `dq/q`, with the sign fixed by the chosen polarization and period; under `q ↦ q^p`,
`dq/q` pulls back to `p·dq/q`. This is an isomorphism between these line bundles, not an equality of
fibre and base differentials. Start from the interior Kodaira–Spencer isomorphism of PELModuli M2.10
for the elliptic family, compute the derivative of the period on the Tate curve, and compare the
higher-dimensional logarithmic formula on charts ([Lan], 6.4.1.1(4), pp. 519–520). *Needs:* C4.12;
PELModuli M2.10; SchemeAndStackFoundations Layer 0.

**Checks.**

- `du/u` is a relative invariant differential; `dq/q` is a logarithmic differential on the base.
- The ramification factor `p` appears in the pullback of `dq/q`.

### C4.14 Tate modules of semi-abelian varieties

Construct `SemiAbelianTateModule` (suggested home `TauCeti/AlgebraicGeometry/GroupScheme/SemiAbelianTate`):
for a semi-abelian variety `J` over a field `k` of characteristic zero, with `0 → T → J → A → 0`, the
full Tate module `TJ = lim_n J[n](k̄)`, indexed by divisibility with transition maps multiplication by
`n/m` from `J[n]` to `J[m]`, with its continuous `Gal(k̄/k)`-action, and the exact sequence
`0 → TT → TJ → TA → 0` of continuous Galois modules. The `ℓ`-primary factor is `lim_r J[ℓ^r]`, `TJ` is
the product of its `ℓ`-primary factors (by the Chinese remainder decomposition of `J[n]`; prime powers
are not cofinal among all `n`), and `T(G_m^r) = Ẑ(1)^r`. Divisibility of `T(k̄)` gives exact sequences
`0 → T[n] → J[n] → A[n] → 0` of finite groups, and inverse limits of finite groups are exact
(ArithmeticGaloisDuality R02.1.1) ([Bresciani], proof of Lemma 8, p. 138). No statement for families
with jumping toric rank is made. The API: `SemiAbelianTateModule.exact`; `.primewise`; `.map`
(functoriality for maps of torus extensions); `.splitTorus`; `.torsionProjection`. *Needs:* C4.1, C4.3;
AbelianSchemesAndArithmeticModuli A3.2 (multiplication maps and torsion), A4.1 (Tate modules);
ArithmeticGaloisDuality R02.1.1.

**Checks.**

- `SemiAbelianTateModule.Gm_test`: for `J = G_m`, `TJ = Ẑ(1)`, not `Ẑ` with trivial action.
- `SemiAbelianTateModule.abelian_test`: for `T = 0` the construction is `TA`.
- `SemiAbelianTateModule.product_test`: for `J = T × A` the sequence splits.
- `SemiAbelianTateModule.transitions_test`: the inclusions `J[m] → J[n]` go the wrong way and do not
  define this inverse system.

### C4.15 Verschiebung on the Hodge line at the boundary

Prove `SemiAbelianScheme.hasse_det`: for a semi-abelian scheme `G` of constant relative dimension `g`
over an `𝔽_p`-scheme `S`, the Verschiebung `V : G^{(p)} → G` of C4.18 pulls back invariant
differentials, `V^* : E → Frob_S^*E`, and its determinant is a section `Ha(G)` of `ω^{⊗(p−1)}`,
`ω = det E`, compatible with base change, isomorphisms and gluing of degeneration charts. On an abelian
chart it is the Hasse invariant of the `p`-torsion (FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.2.21, `Ha(G) = det V^*`); on a split torus it is a unit (`F = [p]` on `G_m`, so `V` is the
identity); on a constant-rank stratum `0 → T → G → A → 0` it is the toric unit times the Hasse
invariant of `A`, through the exact sequence of C4.1. Frobenius pullback of an invertible sheaf is its
`p`-th power, which gives `ω^{⊗(p−1)}`. The generic Hasse invariant, the isomorphism `LF` and the
Hodge–Tate sequence of a truncated Barsotti–Tate group stay in FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.2.21; this target is their extension to the boundary, used in C6. The construction uses the
Frobenius of the semi-abelian group, not a truncated Barsotti–Tate group of height `2g`, which does
not exist at a toric boundary ([BHW], proof of Lemma 5.12, pp. 1747–1748, and §7.1, pp. 1759–1760,
which use ordinarity of the boundary; the general determinant comparison is proved here). *Needs:*
C4.1, C4.18; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.21; SchemeAndStackFoundations Layer 0.

**Checks.**

- For `G = G_m^g` the determinant is `1` in the `dlog` basis, also for `p = 2`.
- For `G = T × A` it is the toric unit times `Ha(A)`, so a supersingular abelian factor forces
  vanishing.
- At a totally toric cusp the `p`-kernel of `G` has height `g`; treating it as a truncated
  Barsotti–Tate group of height `2g` fails.

### C4.16 The compactified Klingen correspondence

Construct `KlingenToroidalCorrespondence`: for the Siegel threefold over `ℚ_p`, the toroidal
compactification of Pilloni's correspondence on triples `(A, H_n, L)`, where `H_n` is a Klingen
level structure of level `p^n` and `L ⊆ A[p²]` is a totally isotropic subgroup, étale locally
`(ℤ/p)² ⊕ ℤ/p²`, disjoint from `H_n`, with arrows `t_1(A, H_n, L) = (A, H_n)` and
`t_2(A, H_n, L) = (A/L, ([p]⁻¹(H_n) + L)/L)` of level `p^{n+1}`. The correspondence is a finite
étale algebraic correspondence of characteristic-zero Shimura varieties, so C3.2–C3.3 extend both
arrows to compatible toroidal models; its analytic form is the adic analytification
(AdicSpacesPartII §R1.3). The level subgroup in the second arrow is as stated; the printed formula
in Pilloni's 13.2.1 has misplaced parentheses ([Pilloni20], 13.2.1, p. 85). The API:
`KlingenToroidalCorrespondence.t1_open`, `t2_open` and `fanComparison`. *Needs:* C3.3, C4.10 (characteristic-zero part);
AdicSpacesPartII §R1.3.

**Checks.**

Use the symplectic frame `(ℤ/p²)^4` with basis `e_1,e_2,f_1,f_2` and
`⟨e_i,f_j⟩ = δ_ij`.

- `L = ⟨e_1,pe_2,pf_2⟩` is isotropic of type `ℤ/p² ⊕ (ℤ/p)²`: the only potentially nonzero
  pairing among its displayed generators is `⟨pe_2,pf_2⟩ = p² = 0`.
- For `H_1 = ⟨pf_1⟩`, `L ∩ H_1 = 0`. The quotient `([p]⁻¹H_1 + L)/L` is cyclic of order
  `p²`, generated by the class of `f_1`; the other preimage directions `pe_1,pe_2,pf_2` lie in `L`.
- The isotropic `L_0 = ⟨e_1,e_2⟩` has the wrong type `(ℤ/p²)²`. Here the same quotient is
  `ℤ/p² ⊕ ℤ/p`, generated by the classes of `f_1` and `pf_2`, and is not cyclic.

### C4.17 Acyclicity of the Klingen first projection

Prove `KlingenToroidalCorrespondence.t1_acyclic`: for the compactified correspondence `C` of C4.16,
`R^i(t_1)_*O_C = 0` for `i > 0` and `(t_1)_*O_C` is the pushforward in degree `0`, algebraically and
after analytification. Properness of `t_1` does not imply this. Determine `t_1` on every boundary
degeneration chart as the composite of a finite map of toric charts given by a change of lattice
(C0.20) and a subdivision; apply C3.5 to the subdivision and finiteness to the rest, glue, and pass to
the rigid analytic spaces by proper GAGA (AdicSpacesPartIII §R3.7 (gaga-comparison-map and proper-gaga)). Pilloni records the
statement in 13.2.1 without proof; the boundary factorization is part of this target
([Pilloni20], 13.2.1, p. 85). *Needs:* C0.20, C3.5, C4.16; AdicSpacesPartIII §R3.7 (gaga-comparison-map), §R3.7 (proper-gaga);
SchemeAndStackFoundations Layer 2.

**Checks.**

- The statement concerns the first arrow and every positive degree.
- No vanishing is asserted for arbitrary proper Hecke correspondences.

### C4.18 Frobenius and Verschiebung of commutative group schemes

Extend the flat affine API of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.1 to
`GroupScheme.verschiebung` (suggested home `TauCeti/AlgebraicGeometry/GroupScheme/Verschiebung`):
for a commutative group scheme `G` that is flat and of finite presentation over an `𝔽_p`-scheme `S`,
the relative Frobenius `F : G → G^{(p)}` and the Verschiebung `V : G^{(p)} → G` are homomorphisms
with `V ∘ F = [p]_G` and `F ∘ V = [p]_{G^{(p)}}`, natural in `G` and compatible with base change. On
affine groups these maps agree with `frobeniusHom` and `verschiebungHom`, including naturality, base
change and both identities. The new construction covers nonaffine groups. If `G` is smooth of
relative dimension `g`, `F` is finite locally free of degree `p^g`, `ker F` is finite locally free
of height one, and `V` is the unique homomorphism with `V ∘ F = [p]` (fppf descent of `[p]` along
the epimorphism `F`). On invariant differentials `F^* = 0` and
`V^* : e^*Ω¹_G → e^*Ω¹_{G^{(p)}} = Frob_S^* e^*Ω¹_G`. For `G_m`, `F` is `z ↦ z^p` onto
`G_m^{(p)} = G_m` and `V = id`; for `G_a`, `V = 0`.
(SGA 3, Exposé VII_A, §§4.1–4.3, especially 4.2.1, 4.3.1 and 4.3.2, re-edition pp. 464–472; for
the smooth Frobenius, Stacks, Lemma 50.19.5, Tag 0FW2: étale locally its basis is the monomials with
each exponent less than `p`.) *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.1;
AbelianSchemesAndArithmeticModuli A1.3 (invariant differentials); SchemeAndStackFoundations Layer 0,
Layer 1 (fppf descent).

**Checks.**

- For `G_m` over `𝔽_p`, `V` is the identity and `V^*` is `1` on `du/u`.
- For `G_a`, `V = 0`, so the determinant of `V^*` vanishes.
- For an ordinary elliptic curve `V^*` is nonzero on `ω`; for a supersingular one it is zero.

### Examples

- The Tate curve: `X = Y = ℤ`, period `q`, positivity `v(q) > 0`; the Mumford quotient is `G_m/q^ℤ`,
  the Hodge line is generated by `du/u`, Kodaira–Spencer sends `(du/u)^{⊗2}` to `dq/q`, and the Hasse
  invariant at the cusp is a unit.
- Siegel genus two at the Siegel cusp: `X = Y = ℤ²`, `A = 0`, and the period pairing is a symmetric
  `2 × 2` matrix with positive definite valuation.
- The identity on `u` from period `q^p` to period `q` is an isogeny whose kernel has order `p`
  generically and `1` at the boundary.

### Dependencies

Layers C0 and C1 (C0.8, C0.15, C0.21, C1.3), C3 (C3.3, C3.5 for C4.16–C4.17);
NeronModelsAndSemistableAbelianVarieties Layer 1, 3.10, 3.13, 3.14; AbelianSchemesAndArithmeticModuli
A0–A4; PELModuli M1, M2.10, M4.5–M4.6; ModularCurvesPartII 3.6, 3.7, 4.8;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.21; ArithmeticGaloisDuality R02.1.1;
AdicSpacesPartIII Layers F0, R2–R3; AdicSpacesPartII Layer R1; SchemeAndStackFoundations Layer 0, Layer 1 and Layer 4.

## Layer C5: integral PEL compactifications

Over a base where the PEL datum has good reduction, the toroidal compactification has an integral
model. This layer constructs it following Lan's book: good algebraic models of the formal boundary
charts of C4, glued by an étale relation into a smooth proper algebraic space (a stack at non-neat
level) with its universal semi-abelian family, formal completions and logarithmic Kodaira–Spencer
isomorphism. The boundary strata are analysed down to the statements used by coefficient
expansions downstream. The Hodge line is semiample (C5.32), its section algebra is finitely
generated, and its Proj is the integral minimal compactification, on which a power of the Hodge line
is ample; the open moduli space is therefore quasi-projective. Fourier–Jacobi expansions of
Hodge-line sections give the constant terms that describe the minimal boundary. The layer then
treats higher `p`-level: the finite normalization of a good-level model in a higher-level function
field, and Lan's normalized blow-ups of minimal models for projective cone systems, with their formal
charts, the formally canonical coefficient sheaves of Lan 2017 and the Koecher principle. It ends
with the inputs of the genus-two applications: Koecher statements for Siegel and Hilbert–Siegel
threefolds, the cyclic level covers of Calegari–Geraghty, the canonical bundle of a Siegel
threefold, and the good-reduction geometry used for étale cohomology.

Standing hypotheses of the layer:

- (C5-a) The PEL datum, `B = Spec O_{F_0,(□)}` and the level `H` are as in (C4-b); no smoothness at
  bad primes is asserted.
- (C5-b) `X = M^tor_{H,Σ}` is the integral toroidal model of C5.3 over `B`, with `H` neat and `Σ` a
  smooth compatible system satisfying Lan's conditions 6.3.3.4 and 6.2.5.25, and Lan's standing
  conditions 1.4.1.2 and 1.4.3.10.
- (C5-c) `D_1, …, D_n` are the irreducible components of the reduced boundary of `X`; for
  `J ⊆ {1, …, n}`, `D_J` is their scheme-theoretic intersection (`D_∅ = X`) and
  `D_J° = D_J ∖ ⋃_{i ∉ J} D_i`.

### C5.1 Good algebraic models of formal boundary charts

Construct `GoodCuspModel` (suggested home `TauCeti/Geometry/Shimura/PEL/GoodCuspModel`): for each
cusp label and smooth cone, an étale neighbourhood of finite type of the toroidal chart, preserving
strata and with the given dense interior, carrying an extension of the PEL semi-abelian family, whose
completion along the stratum is identified with the universal formal chart of C4.7. Two ring maps
`i_nat, i_alg : R_alg → R̂` (to the completion of the strict local ring of the chart at the chosen
geometric point along the stratum) are kept; they need not agree. Lan's conditions (3a) and (3b)
compare the PEL and degeneration structures under the two maps, and (3c) the logarithmic
Kodaira–Spencer map. Assume (C5-a) and a smooth nondegenerate cone. The model is obtained from the
universal formal family and its PEL structures by Artin approximation
(AlgebraicModuliForArithmeticGeometry Layer 6), as in Lan 6.3.1–6.3.2, with the approximation and
étaleness hypotheses as corrected in Lan's errata ([Lan], 6.3.2.5–6.3.2.9, pp. 503–505; [Lan, errata],
items 60–77). The API: `GoodCuspModel.formalComparison`; `.openPEL` (the dense open maps étale to the
moduli space of PELModuli M2.8 with its universal family); `.embeddings` (the two maps and the
conditions (3a)–(3c)). *Needs:* C4.7, C4.9, C4.10 (tame part); PELModuli M2.8, M2.9;
AlgebraicModuliForArithmeticGeometry Layer 6; SchemeAndStackFoundations Layer 1, Layer 4.

**Checks.**

- `GoodCuspModel.rankZero_test`: at toric rank zero the model is an étale chart of the open moduli
  space.
- `GoodCuspModel.tate_test`: for elliptic data `A = 0`, `X = Y = ℤ` and the standard principal
  polarization, the completion carries the Tate degeneration with the level's width-normalized
  period. A genus-two Klingen chart retains its elliptic abelian quotient and rank-one toric part.
- `GoodCuspModel.twoEmbeddings_test`: requiring `i_nat = i_alg` in the definition excludes models
  that Lan's construction produces.

### C5.2 The étale relation on boundary charts

Prove `GoodCuspModel.etaleRelation`: let `U_H` be the disjoint union of finitely many good models
covering the boundary labels and an étale atlas of the open moduli space, `U_H[0]` its interior,
`R_H[0] = U_H[0] ×_{M_H} U_H[0]` the relation of interior isomorphisms of PEL families, and `R_H`
the relative normalization of `U_H ×_B U_H` in `R_H[0]`. The tautological isomorphism of families
over `R_H[0]` extends to `R_H` (C4.8 and uniqueness), both projections `R_H → U_H` are étale (Lan
6.3.3.13, by comparing completed local charts), and the relation has the diagonal, inverse and
composition of an étale groupoid (Lan 6.3.3.14). Charts with unrelated embeddings of function fields
are not identified pointwise ([Lan], (6.3.3.10), p. 512; normalization after Remark 6.3.3.12, p. 514;
Proposition 6.3.3.13 and Corollary 6.3.3.14, pp. 514–517). *Needs:* C1.4, C4.8, C5.1;
SchemeAndStackFoundations Layer 1 (étale groupoids and quotients), Layer 4.

**Checks.**

- Both projections are étale.
- The relation is an étale groupoid of algebraic spaces, not a formal quotient.

### C5.3 Integral toroidal compactifications

Construct `IntegralToroidalModel` (suggested home `TauCeti/Geometry/Shimura/PEL/Toroidal`): for a
smooth compatible collection `Σ` (Lan, Definition 6.3.3.4, with conditions 6.2.5.25 and 6.3.3.2),
the quotient `M^tor_{H,Σ} = [U_H/R_H]` over `B` with its descended semi-abelian family,
polarization, `O`-action and level structure and its stratification by cusp and cone labels. It is a
smooth separated algebraic stack of finite type over `B`, an algebraic space at neat level;
properness for complete `Σ` is C5.5. At non-neat level the finite stabilizers are kept before any
coarse space is formed. Nonsmooth cone systems are handled by C5.31. Assume (C5-a) and Lan's
condition 1.4.3.10 and convention 6.2.1.1 ([Lan], Definition 6.3.3.4, p. 509; Definition 6.3.3.15
and Corollary 6.3.3.16, p. 518; Theorem 6.4.1.1, pp. 519–523). The API:
`IntegralToroidalModel.openImmersion` (the moduli space of PELModuli M2.8 is an open subspace);
`.universalSemiAbelian`; `.chart`; `.genericComparison` (for connected data satisfying SV3 in
PEL type A/C, the generic fibre is the disjoint union of the C2.9 toroidal compactifications of
`Sh_H(G^{(i)},X)`, indexed by `i ∈ ker¹(ℚ,G)`, with the cone system restricted to each piece);
`.descend_hom`. The interior decomposition is PELModuli M3.6/M4.3's. Identify the closure of each
open-and-closed generic piece through its cusp charts; the full generic fibre is one fixed
`Sh_H(G,X)` compactification when `ker¹(ℚ,G) = 1`. These Shimura comparisons retain the supplier's
connected-data, SV3 and type A/C hypotheses. The moduli compactification itself has the scope of
(C5-a). On principal Siegel data use ArakelovGeometryAndAbelianHeights §5.0a and identify this
interface with its supplied specialization. *Needs:* ArakelovGeometryAndAbelianHeights §5.0a;
C0.10, C4.9, C5.2; PELModuli M2.8, M3.6, M4.3; SchemeAndStackFoundations Layer 1.

**Checks.**

- At a genus-two Klingen cusp the completed chart has one toric embedding coordinate over the
  elliptic boundary torsor; the family has an elliptic abelian quotient and a rank-one torus.
- At a maximal genus-two Siegel cusp the torus embedding has three character directions
  (`Sym² ℤ²`), while the family has toric rank two and zero abelian quotient. On a maximal regular
  cone its three boundary coordinates have union ideal `(x_1x_2x_3)`.
- At non-neat genus-one level one, `−1` fixes the cusp parameter and acts by `−1` on `du/u`.
  This inertia is retained on the stack even though the coarse cusp parameter is fixed.
- When `ker¹(ℚ,G)` has more than one element, every generic Shimura piece and its boundary is
  retained; selecting the neutral piece does not identify it with the full moduli generic fibre.

### C5.4 Formal completion along boundary strata

Prove `IntegralToroidalModel.formalCompletion`: for each cusp and cone label, the completion of the
open neighbourhood obtained by removing all strata in its closure other than the stratum itself is the
universal formal chart of C4.7 modulo its stabilizer, compatibly with the family, Hodge bundles,
`O`-action and level structures. Completions along different centres are not compared through
unrelated chart inclusions. Assume (C5-a) and the same `Σ` as C5.3 ([Lan], 6.4.1.1(5) and its proof,
pp. 519–523). *Needs:* C4.7, C5.1, C5.3; SchemeAndStackFoundations Layer 1, Layer 4.

**Checks.**

- For a boundary divisor with deeper intersections, remove those deeper strata before completing
  along its exact stratum; do not remove the dense interior or the closure of every other stratum.
- The identification keeps nilpotent thickenings.

### C5.5 Properness

Prove `IntegralToroidalModel.proper`: for complete `Σ`, `M^tor_{H,Σ}` is proper over `B` (as a stack;
at neat level as an algebraic space). It is separated by C5.2–C5.3; for existence in the valuative
criterion, after a finite extension of a discrete valuation ring a generic PEL family acquires
semistable reduction (NeronModelsAndSemistableAbelianVarieties 3.10) with its polarization and
`O`-action, its degeneration pairing lies in a cone of `Σ` by completeness, and the formal and good
algebraic charts extend the moduli point; descend along the finite extension using separatedness and
the étale relation ([Lan], Proposition 6.3.3.17, p. 518, and the opening assertion of Theorem 6.4.1.1,
p. 519). Lan's Theorem 6.4.1.1(6) is the finer criterion for extending families over normal bases.
*Needs:* C0.13, C4.6, C5.3, C5.4; NeronModelsAndSemistableAbelianVarieties 3.10;
SchemeAndStackFoundations Layer 1.

**Checks.**

- Every admissible discrete valuation ring test has existence and uniqueness.
- An incomplete cone system gives a nonproper model.

### C5.6 Smooth boundary intersections

Prove `IntegralToroidalModel.boundaryIntersection_smooth`: under (C5-b) and (C5-c), every `D_J` is
smooth over `B`; it may be empty or disconnected. On an ordinary étale chart (C5.1–C5.3), at neat
level the cone stabilizers act trivially, and the no-self-intersection condition on `Σ` identifies the
distinct global branches through a point with distinct coordinate hyperplanes; then C0.10 and C0.12
show that `D_J` is locally a polynomial and Laurent algebra over the smooth boundary base, and
smoothness descends along the étale cover. Neither the minimal compactification nor projectivity is
used ([Lan], 6.3.2.5(2), 6.3.3.14–6.3.3.16 and 6.4.1.1(3), pp. 503 and 517–520; [Stacks, Tag 0CBN],
Lemma 41.21.2). *Needs:* C0.10, C0.12, C5.3, C5.4, C5.5; PELModuli M2.8; SchemeAndStackFoundations
Layer 0, Layer 1.

**Checks.**

- For a chart with two rays, `J = ∅`, one ray and both rays give the plane, a line and the base.
- Disconnected intersections are smooth and are not merged into one stratum.
- An irreducible divisor with a node is not a smooth global branch; the no-self-intersection
  condition is needed.

### C5.7 Exact strata are dense in every geometric fibre

Prove `IntegralToroidalModel.exactStratum_fiberwiseDense`: under (C5-b), (C5-c), for every geometric
point `b` of `B` and every `J`, `(D_J°)_b` is dense in `(D_J)_b`, hence meets every nonempty component
of every open and closed part of `(D_J)_b`. On a chart, `D_J°` is the locus where the remaining
boundary monomial is invertible (C0.12), and multiplication by a monomial is injective over every
base, so the open is schematically dense after any base change; étale maps are open, and the inverse
image of a dense open under an open map is dense, so density descends along the étale cover. The
argument uses no count of rational points ([Lan], Definition 6.3.2.5, p. 503, and Theorem
6.4.1.1(2)–(3), pp. 519–520). *Needs:* C0.12, C5.3–C5.6; SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- In `A¹` over a finite field, `G_m` is dense although it has few rational points.
- If `J` contains every boundary coordinate, the exact stratum is the whole intersection.
- Over a discrete valuation ring, removing the closed fibre from a boundary section gives a dense open
  of the total space that is not dense in the special fibre; density in the total space is not enough.

### C5.8 Components of labelled strata

Prove `IntegralToroidalModel.stratumComponent_eq`: under (C5-b), (C5-c), for each nonempty irreducible
component `Z` of a labelled stratum, with `J` the set of boundary components containing `Z`, there is
a unique connected component `W` of `D_J` with `Z = W ∩ D_J°`; hence the reduced closure of `Z` is
`W`. Each boundary component is a union of strata, so `Z ⊆ D_J°`; on charts the exact coordinate
patterns are face-orbit strata (C0.9, C0.11, C0.12), the good models and the relation preserve labels
(Lan 6.3.2.16, 6.3.3.16), so each labelled stratum is open in `D_J°`; strata are smooth, so their
components are open and closed; `D_J` is regular (C5.6) and its connected components are
irreducible, and `W ∩ D_J°` is a dense irreducible open (C5.7), hence a single stratum component
([Lan], 6.3.2.16, 6.3.3.16 and 6.4.1.1(2)–(3), pp. 507–508 and 518–520). *Needs:* C0.9, C0.11, C0.12,
C5.3–C5.7; SchemeAndStackFoundations Layer 1.

**Checks.**

- The quadrant has one exact pattern for each subset of its two rays.
- Where `2` is invertible, on `ℙ¹_z × ℙ¹_w` the divisors `w = 1` and `w = z²` meet in the two disjoint
  sections `z = ±1`; one must take a connected component of the intersection.
- For `J = ∅` the statement concerns a component of the open stratum and its closure; it creates no
  cusp when the boundary is empty.

### C5.9 Closures of strata are proper

Prove `IntegralToroidalModel.stratumClosure_proper`: under (C5-b), (C5-c) and completeness of `Σ`, the
closure `W` of a stratum component is smooth and proper over `B` and `Z_b` is dense in `W_b` for every
geometric point `b`. `W` is open and closed in the regular noetherian `D_J`, which is closed in `X`,
so `W → X` is a closed immersion and `W → B` is proper by C5.5; smoothness and density come from C5.6
and C5.7. Neither the minimal compactification nor any ample line is used ([Lan], 6.3.3.17 and
6.4.1.1, pp. 518–523). *Needs:* C5.5–C5.8; SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- A boundary section of `ℙ¹_B` is proper over `B`; removing a special fibre is not.
- A disconnected intersection gives separate proper closures.
- The proof works for algebraic spaces, without first proving that `X` is a scheme.

### C5.10 Strata detect components of geometric fibres

Prove `IntegralToroidalModel.strata_detect_geometricComponents`: under (C5-b), (C5-c) and completeness
of `Σ`, if a finite family of nonempty labelled strata meets every irreducible component of `X`, then
for every geometric point `b` of `B` the base changes meet every irreducible component of `X_b`.
First prove `IntegralToroidalModel.stein_factor_finiteEtale` for these smooth proper algebraic
spaces: extend the scheme Stein factorization of Layer 4 using coherent direct images and relative
spectrum on algebraic spaces, then use flatness, finite presentation and geometrically reduced
fibres to show the finite factor is étale (Stacks 76.36.1, 76.36.4 and 76.36.9, Tags 0A19, 0A1B
and 0E0D). The component argument itself is part of this target. Split
the strata into components, and let `W_a ⊇ Z_a` be their closures (C5.9). Let `X → E → B` be the Stein
factorization (SchemeAndStackFoundations Layer 4, Stein factorization and Zariski's connectedness), with
`E → B` finite étale since `X → B` is smooth and proper; each `W_a → E` is proper and smooth, so its
image is open and closed, and the hypothesis makes the images cover `E`. Over `b`, the fibres of `X`
over the points of `E_b` are the connected, regular, hence irreducible components of `X_b`; the
nonempty fibres of `W_a` over them meet the dense `Z_{a,b}`. This is the geometric input of Lan's
expansion principle at neat level, used by AutomorphicBundles B5 ([Lan], 7.1.2.14(1), p. 539, with
6.4.1.1; [Stacks, Tag 0A18], 76.36.1, 76.36.4 and 76.36.9). *Needs:* C5.7–C5.9;
SchemeAndStackFoundations Layer 2, Layer 4.

**Checks.**

- For two disjoint proper smooth curves, strata on only one of them fail the hypothesis.
- For `ℙ¹_B` with a whole boundary section, hypothesis and conclusion hold on every geometric fibre.
- A connected finite étale `E` can have several points over a geometric point; each must be reached.
- No conclusion is drawn at non-neat level here (C5.11).

### C5.11 Non-neat levels

Prove `IntegralToroidalModel.nonneat_descent`: at a non-neat good level `H`, choose a neat normal
subgroup `H′ ⊆ H` of finite index and an `H`-invariant smooth complete cone system; the toroidal model
at level `H` is the quotient stack `[M^tor_{H′,Σ}/(H/H′)]`, with coarse space the quotient by the
finite group, and its boundary ideals and strata are the images of those at level `H′`, with branch
identifications kept. Component detection descends: if strata at level `H` meet every component of
the model, their preimages are `H/H′`-stable and meet one, hence every, component over each component
at level `H`, because `H/H′` acts transitively on the components of the level-`H′` model over a
component at level `H`; apply C5.10 at level `H′` and push down along the finite surjective quotient
map. Smoothness of the coarse space and global simple normal crossings are not asserted ([Lan],
6.4.1.1 and the finite-level quotients of 6.4.3, pp. 519–531; [Stacks, Tag 0CBN], Lemma 41.21.6).
*Needs:* C5.3, C5.10; SchemeAndStackFoundations Layer 1 (finite quotient stacks and coarse spaces),
Layer 2.

**Checks.**

- No smoothness of the coarse quotient is assumed.
- Normality of `H′` is needed to form the quotient group `H/H′` and use its action on the finer
  model; a nonnormal inclusion does not supply this quotient-group argument.

### C5.12 Logarithmic Kodaira–Spencer

Prove `IntegralToroidalModel.logKodairaSpencer`: on a neat smooth integral toroidal model, the
Kodaira–Spencer map of the universal semi-abelian family identifies the quotient of
`E ⊗ E′`, with `E′` the Hodge bundle of the dual family, by the relations coming from the `O`-action
and the polarization (Lan 6.4.1.1(4)) with `Ω¹_{X/B}(log D)`; in the principally polarized Siegel case,
`Sym² E ≅ Ω¹_{X/B}(log D)`, with `E = e^*Ω¹_{G/X}` the Hodge bundle of C4.1 and `D` the reduced
boundary. A general PEL quotient is not replaced by `Sym² E`. On the interior this is PELModuli M2.10;
on each formal degeneration chart compute the derivative of the periods, with logarithmic
differentials `dq_i/q_i`; glue by the PEL relations and étale descent, and check the rank-one case
against C4.13 ([Lan], 6.4.1.1(4), pp. 519–520). *Needs:* C4.1, C4.13, C5.3, C5.4; PELModuli M2.10;
SchemeAndStackFoundations Layer 0.

**Checks.**

- In the Siegel case `E` has rank `g` and `Ω¹(log D)` rank `g(g+1)/2`.
- In rank one the base differential is `dq/q`, distinct from the fibre differential `du/u`.

### C5.13 Semiampleness of the Hodge line

Prove `IntegralToroidalModel.hodgeLine_semiample`: on the integral toroidal model (C5.3, complete
`Σ`), a positive power of `ω = det E` is generated by global sections relative to `B`. This is
semiampleness: `ω` has degree zero on curves in geometric fibres of the contraction to the minimal
compactification. If a geometric fibre is positive-dimensional, it contains a proper curve of Hodge
degree zero, and `ω` is not ample on the toroidal model. Apply C5.32 to the universal semi-abelian
scheme over the normal excellent noetherian algebraic space `X` (at neat level; descend a positive
power through the finite quotient otherwise) ([FC], Chapter V, Proposition 2.1, p. 149, and its
direct proof in V.3; [Lan], Propositions 7.2.1.1–7.2.1.2, pp. 540–541). On principal Siegel data use
ArakelovGeometryAndAbelianHeights §5.0b and identify this interface with its supplied
specialization. *Needs:* ArakelovGeometryAndAbelianHeights §5.0b; C4.1, C5.3, C5.5, C5.32;
SchemeAndStackFoundations Layer 2.

**Checks.**

- A uniform positive power is generated by sections.
- On a boundary contraction fibre the degree of `ω` is zero.
- On the fine modular curve `X(N)`, `N ≥ 3`, toroidal and minimal models coincide and `ω` has
  positive degree, hence is ample on each geometric fibre over the level base.

### C5.14 Finite generation of the Hodge section algebra

Prove `IntegralToroidalModel.hodgeSectionAlgebra_fg`: `S = ⊕_{k ≥ 0} H^0(M^tor_{H,Σ}, ω^{⊗k})` is a
finitely generated `B`-algebra. Choose `m` with `ω^{⊗m}` generated by sections (C5.13); the morphism
to projective space it defines has a Stein factorization `X → M → ℙ^N` with `M → ℙ^N` finite and
`O_M = π_*O_X` (SchemeAndStackFoundations Layer 4); `M` is flat over the Dedekind base because `π_*O_X`
is torsion-free; after replacing `m` by a multiple, `ω^{⊗m}` is the pullback of a very ample sheaf on
`M`, so `⊕_k H^0(X, ω^{⊗mk})` is finitely generated (Serre: SchemeAndStackFoundations §2.6,
`ample_serre_vanishing`), and each of the finitely many residue classes `⊕_k H^0(X, ω^{⊗(mk+r)})` is a
finite module over it, by coherence of the direct image of `ω^{⊗r}` on `M`. Finite generation over the
fraction field of `B` alone is not enough ([FC], Chapter V, proof of Theorem 2.3, pp. 151–152;
[Lan], Corollary 7.2.2.6 and 7.2.3.1–7.2.3.3, pp. 544–546). *Needs:* C5.5, C5.13;
SchemeAndStackFoundations §0.3, Layer 2, Layer 4.

**Checks.**

- All degrees `k ≥ 0` are covered, through finitely many residue classes modulo `m`.
- The result holds over `B`, not only over its fraction field.
- Flatness of the Stein factor over `B` is proved before it is used.

### C5.15 Fourier–Jacobi expansions of Hodge-line sections

Construct `HodgeLineFJ` (suggested home `TauCeti/Geometry/Shimura/PEL/FourierJacobi`): for a cusp label
`[(Φ_H, δ_H)]` with structure map `p : C_{Φ_H,δ_H} → M^{Z_H}` (an abelian-scheme torsor over a finite
étale cover of the boundary moduli space), character lines `Ψ(ℓ)`, an integer `k ≥ 0` and any
`O_{F_0,(□)}`-module `M`, the Fourier–Jacobi morphism
`FJ : Γ(M^tor_H, ω^{⊗k} ⊗ M) → [∏_{ℓ ∈ P_Φ^∨} Γ(M^{Z_H}, p_*Ψ(ℓ) ⊗ ((∧^top X) ⊗ ω_A)^{⊗k} ⊗ M)]^{Γ_Φ}`,
defined by restriction to the formal completion along a stratum `Z_{[(Φ_H,δ_H,σ)]}` (C5.4) and the
identification of the pulled-back Hodge line with `(∧^top X) ⊗ ω_A`, which holds because the Mumford
family and its Raynaud extension have the same invariant differentials (Lan, Lemma 7.1.2.1). The
target is a full product, not a completed tensor product; `M` need not be flat. Here `P_Φ^∨` is the
monoid of characters nonnegative on the positivity cone, and its nonzero elements are exactly those
strictly positive on its interior (Lan, Corollary 7.1.2.12). The expansion is supported in `P_Φ^∨`,
independent of `σ` and of the cone system, and `Γ_Φ`-invariant; since every nonzero `ℓ ∈ P_Φ^∨` lies
in the stratum ideal, the restriction of a section to the stratum is the pullback of its constant term
`FJ^{(0)}` from `M^{Z_H}`. This is the scalar case; expansions of general automorphic bundles are
AutomorphicBundles B5, which specializes to it ([Lan], Definition 7.1.1.1, Lemma 7.1.1.5 and
7.1.2.1–7.1.2.13, pp. 532–538). Assume (C5-a) and a smooth compatible `Σ`.

The API: `HodgeLineFJ.coeff`; `.indep_cone`; `.indep_fan` (through C3.9); `.invariant`; `.map_module`
(functorial in `M`); `.restrict_stratum`. *Needs:* C0.8, C0.11, C1.4, C1.6, C3.9, C4.1, C4.7, C5.3,
C5.4; SchemeAndStackFoundations Layer 1, Layer 2.

**Checks.**

- `HodgeLineFJ.unit_test`: for `k = 0`, `M = O_{F_0,(□)}` and `f = 1`, `FJ^{(0)}(1) = 1` and all other
  coefficients vanish.
- `HodgeLineFJ.modular_test`: at a cusp of width `w` of a modular curve the expansion of a weight-`k`
  form is its `q`-expansion `∑_{m ≥ 0} a_m t^m` in the cusp parameter `t` with `t^w` the Tate
  parameter, and its value at the cusp is `a_0`.
- `HodgeLineFJ.refinement_test`: for a refinement `Σ′`, the expansion of the pulled-back section agrees.
- `HodgeLineFJ.negative_test`: `q⁻¹ + O(1)` is not the expansion of a section; degrees negative on the
  positivity cone never occur.

### C5.16 The integral minimal compactification

Construct `IntegralMinimalModel` (suggested home `TauCeti/Geometry/Shimura/PEL/Minimal`):
`M^min_H = Proj_B S` with the proper map `π : M^tor_{H,Σ} → M^min_H` and the open immersion of the PEL
moduli space. It is projective, normal and flat over `B`, independent of `Σ`, with
`O_{M^min} = π_*O_{M^tor}`, its boundary strata are identified with the coarse boundary moduli spaces through the
constant terms of C5.15. For connected data satisfying SV3 in PEL type A/C, its generic fibre is
`⊔_{i ∈ ker¹(ℚ,G)} Sh_H(G^{(i)},X)^min`, using PELModuli M3.6/M4.3 and the piecewise comparison
of C5.3. Each summand is the minimal compactification of ShimuraVarieties 2.5–2.7; the entire
fibre is that of the fixed neutral datum when `ker¹(ℚ,G) = 1`. The map contracts the toroidal
boundary directions. Completions and special fibres are compared separately. Construct `M^min` as the Stein factor of C5.14 and identify
it with `Proj S`; on every proper curve contained in a geometric fibre of `π`, `ω` has degree zero,
so C5.33 controls the abelian part along these curves. The fibres can have higher dimension;
identification of their boundary moduli and connectedness uses the stratum and constant-term
analysis, not a claim that all fibres are curves. Images and fibres of strata follow from C5.15 and
Lan 7.2.3.5–7.2.3.9; different `Σ` are compared through C3 ([FC], Chapter V, Theorem 2.3 and its
proof, pp. 150–152; [Lan], 7.2.3 and 7.2.3.1–7.2.3.9, pp. 544–548). The API:
`IntegralMinimalModel.fromToroidal`; `.fanIndependent`; `.genericComparison`; `.levelMap`;
`.structureSheaf`. The `.genericComparison` retains the index and hypotheses just stated.
On principal Siegel data use ArakelovGeometryAndAbelianHeights §5.0b and identify
this interface with its supplied specialization. *Needs:* ArakelovGeometryAndAbelianHeights §5.0b;
C3.9, C5.3, C5.14, C5.15, C5.33; PELModuli M3.6, M4.3;
ShimuraVarieties 2.5, 2.7; SchemeAndStackFoundations Layer 0, Layer 2,
Layer 4.

**Checks.**

- `IntegralMinimalModel.modular_test`: for fine genus-one level, `π` is the identity on `X(N)`;
  each cusp remains a point and the positive-degree Hodge line is ample.
- In genus two the Klingen boundary maps to the elliptic modular curve, and the maximal Siegel
  boundary maps to the zero-dimensional genus-zero stratum; the minimal boundary has dimension one.
- Over an elliptic Klingen boundary point, the proper toroidal fibre has positive dimension
  (the elliptic extension direction, up to its finite quotient). Every proper curve in this fibre
  has Hodge degree zero, so the toroidal Hodge line fails ampleness there.
- With nontrivial `ker¹(ℚ,G)`, the generic minimal model retains all the supplier's open-and-closed
  pieces; boundary contraction does not merge their constant-term algebras.

### C5.17 The Hodge line on the minimal compactification

Prove `IntegralMinimalModel.hodgeLine_ample`: a positive power `ω^{⊗m}` descends to an ample
invertible sheaf on the neat integral minimal compactification, pulling back to `ω^{⊗m}`; on coarse
quotients at non-neat level, a positive power descends as an ample `ℚ`-line, after an auxiliary neat
level and with the stabilizer conditions of the quotient. In the Siegel case this is the ample Hodge
`ℚ`-line used by Yuan. Ampleness of `ω` on the toroidal model is not asserted. The Stein factor maps
finitely to projective space and `O(1)` pulls back to `ω^{⊗m}` ([Lan], 7.2.3, p. 544; [Yuan], §3.4,
Theorem 3.8, pp. 54–56). On principal Siegel data use ArakelovGeometryAndAbelianHeights §5.0b and
identify this interface with its supplied specialization. *Needs:* ArakelovGeometryAndAbelianHeights
§5.0b; C4.1, C5.13, C5.16; SchemeAndStackFoundations Layer 1.

**Checks.**

- The descended sheaf is ample on the minimal model.
- Its pullback has degree zero on curves in positive-dimensional contraction fibres and is
  therefore not ample when such fibres occur.
- In genus one the contraction is the identity and the Hodge line on the fine compactified
  modular curve is ample; a positive power also descends through coarse inertia.

### C5.18 Quasi-projectivity of PEL moduli at good primes

Prove `IntegralMinimalModel.moduli_quasiProjective`: the neat moduli algebraic space of PELModuli
M2.8 is a quasi-projective scheme over `B`, since it is an open subspace of the projective minimal
compactification. Scheme representability is not assumed in proving C5. This is the arithmetic moduli
space with Hodge line used for heights and finiteness; bad primes are not treated ([Lan], Corollary
7.2.3.10, p. 548). *Needs:* C5.16, C5.17; PELModuli M2.8; SchemeAndStackFoundations Layer 1.

**Checks.**

- The moduli space is a scheme, quasi-projective over `B`.
- Nothing is asserted at bad primes or for general Hodge-type data.

### C5.19 Finite normalizations at higher p-level

Construct `NormalizedToroidalModel` (suggested home `TauCeti/Geometry/Shimura/PEL/Normalization`): for
a good prime `p`, a place `v | p`, a neat level `K^p` away from `p`, the base level `K_p^0 = G(ℤ_p)`
and an open `K_p ⊆ K_p^0`, fix the original singleton lattice collection
`J₀ = {(1,L,⟨·,·⟩)}`, with self-duality over `ℤ_p`. Construct the relative normalization of the good-level toroidal model
`M^tor_{K^pK_p^0, Σ}` over `O_{F_0,v}` in the function field of the level `K^pK_p` (the finite
generic cover of PELModuli M4.5), componentwise if the generic fibre has several pieces.
The collection remains `J₀` at both levels. The map to the good-level model is finite over the excellent base,
its interior is the normalization of PELModuli M4.5–M4.6, and it carries the pullback of the
good-level semi-abelian family; the higher `p`-level structure is defined on the generic fibre only.
A refinement of `Σ` gives a proper modification, not a finite map to the old model. This is the
normalization model of Bijakowski–Pilloni–Stroh in the Siegel case; it is not identified with a
moduli problem at parahoric level ([BPS], 5.1–5.2, pp. 1009–1010; compare [Lan17], Theorem 6.1,
pp. 22–24, and C5.20). The API: `NormalizedToroidalModel.finiteMap`; `.openNormalization`;
`.chartIntegralClosure` (C5.20); `.refinement`; `.desc` (normal flat spaces over the good-level model
with a generic lift factor uniquely). *Needs:* C5.3, C5.4; PELModuli M4.5, M4.6;
SchemeAndStackFoundations Layer 1, Layer 4.

**Checks.**

- `NormalizedToroidalModel.identity_test`: the trivial generic cover returns the base model.
- `NormalizedToroidalModel.tate_ramification_test`: the cusp cover `q = t^p` is finite and ramified
  at `t = 0`.
- `NormalizedToroidalModel.open_test`: the interior is the normalization of PELModuli M4.5.
- `NormalizedToroidalModel.smoothness_test`: the normalized chart is not smooth merely because the
  good-level model is.

### C5.20 Charts of normalized models

Prove `NormalizedToroidalModel.chart_compare`: (a) the completion of the finite normalization of
C5.19 along a boundary stratum is computed as follows. On a normal excellent integral affine chart
`A`, let `L` be the finite generic level algebra over `Frac(A)` and `A′` the finite normalization of
`A` in `L`, componentwise. For its boundary completion `Â`, the completed normalization is
`A′ ⊗_A Â`. Identify it with the normalization of `Â` in `L ⊗_{Frac(A)} Q(Â)`, using the total quotient ring
componentwise; on torus-torsor charts this is the changed-lattice chart of C0.20 over the normalized
boundary base; (b) for the normalized blow-up model of C5.31 the completed charts are those of Lan's
Theorem 6.1(3)–(4), with their torus-torsor bases, changed lattices and fixed collection `J`;
(c) fix `J = J₀` of C5.19 at both levels, take the higher-level minimal model to be the finite
relative normalization of C5.16, and use the same projective `Σ` on the identified rational central
spaces, with no further subdivision. Then the C5.31 toroidal model is the finite normalization of
the good-level C5.31 model in the higher-level function field. For smooth `Σ` the latter good-level
model is C5.3, yielding the comparison with C5.19.

Prove (c) by comparing the saturated boundary ideals and their normalized Rees algebras on the
formal torus-torsor charts: after a common Veronese, the integral closure of the higher-level
Rees algebra is the integral closure of the pulled-back good-level Rees algebra in the higher-level
generic algebra. Match the monomial valuations defined by `d·pol`, the changed lattices and the
normalized boundary bases, and glue the resulting chart isomorphisms. On the smooth good-level
model the ideal becomes `O(−∑_ρ d·pol(ρ)D_ρ)`, relatively ample over the minimal model. This chart
and graded-algebra comparison, together with agreement on the normalized interior, supplies the
isomorphism; invertibility of the ideal on two normal modifications alone does not.
For general compatible collections `J,J′`, retain the projective maps of Lan17 Proposition 7.1;
these can be nonfinite already on the interior. A subdivision also gives a generally nonfinite
proper map ([Lan17], Construction 4.5, p. 11, Theorem 6.1(3)–(4), pp. 22–23, Proposition 7.1,
p. 27; [Lan16], Remark 13.10 and Example 13.12, pp. 63–65).
*Needs:* C0.16, C0.20, C4.10 (tame/generic part), C5.19, C5.31;
SchemeAndStackFoundations Layer 1, Layer 4; excellent-ring normalization and completion
([Stacks], Tag 0C23 for normality of completed excellent local normal rings).

**Checks.**

- The completed character lattice is the changed lattice at the higher level.
- No interchange of completion with inverse limits is asserted.
- For the blow-up of a regular two-dimensional chart at its vertex, the normalized blow-up has an
  exceptional line, so it is not finite over the chart.
- Even for the identity cover `A = k[q]`, `L = k(q)`, the answer is `k[[q]]`, which is not
  an `A`-subalgebra of `k(q)`: the series `∑_{n≥1} q^{n!}` is not rational. The containing
  generic algebra is the one after completion.
- Lan16 Example 13.12's lattice-chain model can map projectively and nonfinitely to a singleton
  model even at equal generic level. The boundary ideal is the unit ideal on the interior, so its
  blow-up cannot change this interior map into a finite normalization.
- A further blow-up of a point on the exceptional divisor of `Bl_(x,y) A²` remains normal and
  generically birational with `(x,y)` invertible, but is not the original blow-up.

### C5.21 Formally canonical coefficient sheaves

Prove `IntegralToroidalModel.formallyCanonical`: on the good-prime models of C5.3 and on the
normalized models of C5.31, a quasi-coherent sheaf over an `O_{F_0,(p)}`-algebra `R` is formally
canonical (Lan 2017, Definition 8.5) if at each geometric point over a minimal boundary stratum its
completion along every cone chart `σ` is the completed sum over `ℓ ∈ σ^∨` of `Ψ(ℓ) ⊗ E_0`, with `E_0`
on the completed torsor base carrying a finite exhaustive filtration whose graded pieces are pulled
back from finite `R`-modules; formally subcanonical if the sum is over `σ^∨_+ = ⋂_τ τ^∨_0`, where
`τ` runs over the nonzero faces of the closed cone `σ` and `τ^∨_0` means positivity on its relative
interior, as in Lan's open-cone convention. Thus on a regular chart the exponents are positive on
every boundary ray; for the zero cone the intersection is empty-indexed and imposes no restriction.
The structure sheaf, the Hodge bundle `E` of C4.1, its dual and all tensor, symmetric,
exterior and determinant constructions of them (in particular `ω^{⊗k}` and
`Sym^{a−b}E ⊗ (det E)^{⊗b}`), tensored with finite `R`-modules, are formally canonical, and their
products with the reduced boundary ideal are formally subcanonical. On a normalized model the family
is each tautological family of the lattice collection. The completed Hodge bundle is the completed
character-line sum tensor the bundle of the Raynaud extension pulled back from the torsor base (Lan,
Lemma 7.1.2.1, applied to `E`), which is free after completion at a point; tensor constructions keep
the form; on regular charts the boundary ideal is the sum over strictly positive characters, and
C3.8 handles refinements ([Lan17], Definition 8.5, p. 34;
Proposition 5.1, p. 15; Theorem 6.1(3)–(4), pp. 22–23; [Lan], Lemma 7.1.2.1, p. 534; [BPS], 5.1–5.2,
pp. 1009–1010). *Needs:* C3.8, C4.1, C4.7, C5.3, C5.4, C5.19, C5.31.

**Checks.**

- `O`, `ω^{⊗k}` and `Sym^{a−b}E ⊗ (det E)^{⊗b}` satisfy the condition.
- On the blow-up of the quadrant, the new subcanonical boundary ideal has exceptional order one,
  whereas ordinary pullback of `(xy)` has order two. C3.8 compares these sheaves by derived
  pushforward, rather than equality of pullbacks.
- A skyscraper sheaf at a boundary point is not formally canonical.
- On the two-ray regular chart, subcanonical weights have both exponents positive: `xy` occurs,
  `x` does not. Including the zero face in the positivity intersection would incorrectly kill all weights.

### C5.22 The Koecher principle on normalized models

Prove `IntegralToroidalModel.koecher`: if `O ⊗ ℚ` is simple, `R` is an `O_{F_0,(p)}`-algebra and `E`
is formally canonical on the normalized model of C5.31, then for every open `U ⊆ M^min` with toroidal
preimage `U^tor`, restriction `Γ(U^tor, E) → Γ(U ∩ M_H, E)` is bijective, except when `dim M_H = 1` and
`U` meets the boundary. This includes torsion coefficients `R = O/ϖ^n` and the normalization model of
Bijakowski–Pilloni–Stroh; it does not identify that model with a parahoric model. Apply Lan 2017
Lemma 8.1 and Propositions 8.3–8.4 (vanishing of the relevant cohomology of `Ψ(ℓ)` for `ℓ` positive,
and of global sections for `ℓ` not in `σ^∨` on positive-dimensional torsor fibres) to the graded
pieces of the filtration, extend formally, and glue over `U` ([Lan17], Theorem 8.7 and Remarks
8.9–8.10, pp. 34–35, with the dimension-one exception of the errata, item (3); [BPS], Proposition
5.2.1, p. 1010; [LanHK], Theorem 2.3, p. 3). Normal generic-fibre Hartogs does not give the
statement for torsion coefficients. *Needs:* C5.16, C5.19, C5.21, C5.31; SchemeAndStackFoundations
Layer 2.

**Checks.**

- The statement holds for every `R` in the hypothesis, including torsion rings.
- For modular curves (`dim = 1`) sections with poles at the cusps exist, so the exception is needed.

### C5.23 The Siegel Koecher principle with arbitrary coefficients

Prove `IntegralToroidalModel.siegel_koecher`: for the neat good-prime genus-two Siegel model, `E` of
rank two, `a ≥ b`, `ω(a, b) = Sym^{a−b}E ⊗ (det E)^{⊗b}`, and every `O`-module `M`, restriction
`H^0(X, ω(a, b) ⊗_O M) → H^0(Y, ω(a, b) ⊗_O M)` from the toroidal model to the open moduli space is
bijective, independently of the toroidal model. Apply C5.22 to finite modules, which are formally
canonical by C5.21, and pass to arbitrary modules by filtered colimits (cohomology of quasi-compact
separated spaces commutes with them) ([CG], 5.2, pp. 821–822; [Lan], 7.1.1.4–7.1.1.5, pp. 532–533).
*Needs:* C3.9, C4.1, C5.21, C5.22; SchemeAndStackFoundations Layer 2.

**Checks.**

- `M = O/ϖ^n` is included.
- Nothing is asserted for higher cohomology.

### C5.24 The Koecher principle on the ordinary locus

Prove `IntegralToroidalModel.ordinary_koecher`: for the ordinary open of the minimal compactification
of the Siegel threefold over `ℤ_p` and its toroidal preimage, as in Pilloni 11.1.1, restriction of
sections of the formally canonical sheaves of C5.21 from the toroidal preimage to the open ordinary
moduli space is bijective, over `ℤ_p`, modulo `p^n` and on `p`-adic completions. The ordinary locus is
an open subset of the minimal compactification, so this is C5.22 (valid for every open of the minimal
compactification and every coefficient ring, including `ℤ/p^n`) applied to it, followed by passage to
completions with formal functions for proper algebraic spaces (C3.6a) and the Mittag-Leffler
property (AdicSpacesPartIII §F0.6 (formal-functions-affine)). The characteristic-zero Koecher principle alone does not give the statement modulo `p`
([Pilloni20], 11.1.1, p. 66, where it is stated without proof). *Needs:* C3.6a, C5.21, C5.22;
AdicSpacesPartIII §F0.6 (theorem-on-formal-functions), §F0.6 (formal-functions-affine), §R2.10 (hasse-domain); SchemeAndStackFoundations Layer 2.

**Checks.**

- The statement modulo `p^n` is proved directly, not deduced from characteristic zero.
- No statement about higher cohomology or parahoric models is made.
- On a toric boundary chart modulo `p²`, the coefficient `p` survives in the formal comparison;
  passing to the reduced special fibre would lose it.

### C5.25 Codimension of the Hilbert–Siegel minimal boundary

Prove `HilbertSiegel.minimalBoundary_codim`: for the genus-two Hilbert–Siegel minimal compactification
over a totally real field of degree `d`, as in BCGP 8.2, the open part has dimension `3d` and each
boundary stratum has dimension at most `d`, so the boundary has codimension at least `2d ≥ 2`; the
bound persists for finite normalizations and on the normal formal model used there. The toroidal
boundary is a divisor; the bound concerns the minimal compactification. The rational boundary
components have Hilbert modular varieties of dimension `d` (Klingen type) and points (Siegel type) as
pure parts; finite maps preserve dimensions ([BCGP21], §8.2, p. 240). *Needs:* C1.6, C2.8, C5.16,
C5.19; ShimuraVarieties 2.1.

**Checks.**

- For `d = 1` the rank-one boundary is a curve in a threefold.
- The toroidal boundary has codimension one and is not confused with the minimal boundary.

### C5.26 The formal Hilbert–Siegel Koecher principle

Prove `HilbertSiegel.formal_koecher`: on the normal formal minimal scheme of BCGP 8.2, sections of the
given invertible sheaf on the complement of the minimal boundary (codimension at least two, C5.25)
extend uniquely, and agree with sections of its toroidal pullback. Assume, as part of the
hypotheses, that the special fibre of the formal model has depth at least two at the points of the
minimal boundary (for instance, it is `S2` there, the boundary having codimension at least two in it).
Since the formal model is flat over `ℤ_p`, each thickening `X_n` is filtered by copies of the special
fibre and so has depth at least two along the boundary; sections of the line bundle
extend on each `X_n` (EGA IV₂, Théorème 5.10.5, p. 115). Uniqueness makes these extensions
compatible; taking their ordinary inverse limit gives the formal section, since sections of a
formal sheaf are the inverse limit of its thickenings. No surjectivity of the transition maps on
global sections, or Mittag-Leffler assertion about them, is needed. The structure-sheaf identity
`O_{formal min} = π̂_*O_{formal tor}` for BCGP's
formal contraction is the completion of `O_{M^min} = π_*O_{M^tor}` (C5.16) by the comparison of
algebraic and formal direct images for the proper toroidal contraction (C3.6a, allowing an
algebraic-space source over an étale scheme chart of the target), and the projection formula for the invertible sheaf follows. Neither
generic-fibre normality nor the refinement theorems of C3 give this. Higher cohomology is not treated
([BCGP21], §8.2, p. 240). *Needs:* C3.6a, C5.16, C5.25; AdicSpacesPartIII §F0.6 (formal-direct-image-comparison);
SchemeAndStackFoundations Layer 0, Layer 2.

**Checks.**

- The statement concerns `H^0` of an invertible sheaf on the normal formal model.
- No statement about higher cohomology is made.
- For the trivial line on `Spf ℤ_p[[x,y]]`, removing `V(x,y)` at each `p^n`-thickening
  preserves the ring of sections `(ℤ/p^n)[[x,y]]`; the special-fibre depth is two.

### C5.27 The cyclic level group at the boundary

Prove `IntegralToroidalModel.cyclicLevel_extend`: on the Calegari–Geraghty toroidal model at level
`K_0(Q)`, with `Q` a prime invertible on the base, the open cyclic subgroup `H ⊆ A[Q]` extends to a
finite flat, in fact finite étale, group scheme of rank `Q` over the compactification. No closed
immersion of the extension into the semi-abelian family is asserted: boundary torsion can lose rank.
On each cusp chart the level data of the degeneration (C4.10) give a finite étale cyclic group
extending `H`; it descends along the étale relation, and étaleness holds because `Q` is invertible
([Pilloni12], 4.1.2, pp. 350–351; [CG], 5.2, p. 822). *Needs:* C4.7, C4.10, C5.3;
SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- `H` has rank `Q` in every fibre and is finite étale.
- The statement is not applied to a `p`-kernel that loses rank at the boundary.

### C5.28 The generator cover of a cyclic level group

Construct `PrimeQGeneratorCover`: on the compactified `K_0(Q)` model, `X_{K_1(Q)} = Isom_X(ℤ/Q, H)` for
the extended group of C5.27; it is a finite étale torsor under `(ℤ/Q)^×`, restricts to the `K_1(Q)`
cover on the open part, and carries the pulled-back family and coefficient sheaves. The
representability of `Isom` for finite étale groups is SchemeAndStackFoundations Layer 1
(§1.15); generators are permuted simply transitively by `(ℤ/Q)^×` ([CG], 5.2,
p. 822). The API: `PrimeQGeneratorCover.torsor`; `.openLevel`; `.baseChange`; `.isomSections` (sections
are isomorphisms `(ℤ/Q)_T → H_T`; the zero section is not a generator). *Needs:* C5.27;
SchemeAndStackFoundations Layer 1.

**Checks.**

- `PrimeQGeneratorCover.Q3_test`: for `Q = 3` and `H = ℤ/3` there are two generators, swapped by
  `(ℤ/3)^×`.
- `PrimeQGeneratorCover.Q2_test`: for `Q = 2` the cover has degree one.
- `PrimeQGeneratorCover.open_test`: on the open part it is the given level cover.
- `PrimeQGeneratorCover.noninvertible_test`: a `p`-kernel that loses rank at a boundary of
  characteristic `p` does not give a finite étale cover.

### C5.29 The canonical bundle of a Siegel threefold

Prove `IntegralToroidalModel.siegel_canonicalBundle`: for a neat smooth genus-two Siegel toroidal
threefold `X/B` with boundary `D` and Hodge bundle `E` of rank two, `det Ω¹_{X/B}(log D) ≅ (det E)^{⊗3}`
and the relative dualizing sheaf is `(det E)^{⊗3} ⊗ O_X(−D)`. Take determinants in C5.12, compute
`det Sym² E = (det E)^{⊗3}` for a rank-two bundle, and use `det Ω¹(log D) = det Ω¹ ⊗ O(D)` in local
logarithmic coordinates; on the smooth model `det Ω¹` is the dualizing sheaf. These identities are not
asserted for singular normalized models ([CG], 5.3, pp. 830–831). *Needs:* C4.1, C5.12;
SchemeAndStackFoundations Layer 0, Layer 2.

**Checks.**

- For a diagonal change of basis `diag(t_1, t_2)`, `Sym²` has determinant `(t_1t_2)^3`.
- Removing the logarithmic poles contributes `O(−D)`.

### C5.30 Good-reduction geometry for étale cohomology

Prove `IntegralToroidalModel.goodReduction_geometry`: for the Siegel threefold at a prime `ℓ` where
the level is hyperspecial, with auxiliary level prime to `ℓ`, choose a smooth projective cone system
using C0.15. The resulting toroidal model over `ℤ_(ℓ)` of C5.3 and C5.5 is smooth and projective,
with its universal semi-abelian scheme, open moduli space and normal-crossings boundary, and the
smooth proper strata closures of C5.9. These are the geometric inputs of BCGP 2025 Theorem 1.8.29;
nearby cycles, duality and the Eichler–Shimura relation used there belong to the étale-cohomology
roadmaps that build on this one ([BCGP25], Theorem 1.8.29 and the beginning of its proof, p. 17). On
principal Siegel data use ArakelovGeometryAndAbelianHeights §5.0a and identify this interface with
its supplied specialization. *Needs:* ArakelovGeometryAndAbelianHeights §5.0a; C0.15, C5.3, C5.5,
C5.9, C5.12.

**Checks.**

- The model has good reduction at `ℓ`, with the stated level conditions.
- No cohomological statement is deduced from smoothness of the open part.
- At a maximal genus-two cusp the family has toric rank two and zero abelian quotient, while
  a maximal regular toric chart has three boundary coordinates and relative normal crossings.

### C5.31 Normalized blow-ups of minimal compactifications

Construct `ProjectiveToroidalModel` (suggested home `TauCeti/Geometry/Shimura/PEL/NormalizedBlowup`): in
Lan's 2017 setting at a prime `p` (the integral PEL datum with condition 1.4.3.10, `H ⊆ G(Ẑ)` open with
neat image away from `p`, a fixed lattice collection `(g_j, L_j, ⟨·,·⟩_j)_{j ∈ J}`, over
`S̃_0 = Spec O_{F_0,(p)}`), for a complete compatible projective cone system `Σ` (individual cones need
not be smooth) with polarization function `pol`: choose a smooth refinement over the reflex field,
push the `d·pol`-weighted boundary ideal to the characteristic-zero minimal model, take its schematic
closure `J̃_{H,d·pol,J}` in a given normal projective flat model `M̃^min_{H,J}` of the minimal compactification
over `S̃_0`, and normalize its blow-up. For `d` sufficiently divisible the result stabilizes to a normal
projective flat scheme `M̃^tor_{H,Σ,J}` over `S̃_0` with formal torus-torsor charts and the tautological
degenerating families indexed by `J` (Lan 2017, Theorem 6.1). The minimal model `M̃^min_{H,J}`,
with its open normalized interior carrying the `J`-indexed tautological families, is part of the hypotheses:
a normal projective flat model over `S̃_0` of the minimal compactification of the generic fibre, with
the properties of [Lan16], Propositions 6.1 and 6.4, pp. 32–35. Carry `J` in the minimal, interior,
ideal and toroidal interfaces. In the good-prime fixed singleton setting `J = J₀` of C5.19, take
the minimal input to be the finite normalization of C5.16 in the higher-level function field;
C5.20(c) compares the resulting toroidal models. For general collections retain Lan's `J`-dependent
minimal input, also at good primes; its projective comparison with a singleton model need not be
finite. The moduli interpretation at parahoric level is separate from these constructions.
The boundary ideal is Lan's Construction 3.1 and Definition 3.5, the closure and normalized blow-up Construction 3.12; Lan's Sections 4–5 compute the completed
ideals and charts and prove stabilization, and Theorem 6.1(1)–(6) gives the families, strata and
uniqueness ([Lan17], Construction 3.1, Definition 3.5, Construction 3.12, pp. 7–9; Lemma 2.12 with
Remark 2.15; Sections 4–5; Theorem 6.1, pp. 22–24). The API: `ProjectiveToroidalModel.toMinimal`;
`.completion`; `.auxiliaryIndependent` (models for different `d` and `pol` inducing the same `Σ` are
canonically identified); `.refinement` (Theorem 6.1(2), keeping `J`); `.collectionComparison`
(the projective map of Proposition 7.1 for compatible collections and fans, with identity, composition and pullback of
each matching tautological family); `.valuativeExtension`
(Theorem 6.1(6)). *Needs:* C0.15, C2.7, C2.8, C4.4, C5.16; PELModuli M4.5, M4.6;
SchemeAndStackFoundations §0.3, Layer 2, Layer 4.

**Checks.**

- `ProjectiveToroidalModel.rankZero_test`: without boundary the ideal is the unit ideal and the model
  is the given normal model.
- `ProjectiveToroidalModel.blowup_test`: the normalized blow-up of `(x, y)` in a regular
  two-dimensional chart has an exceptional `ℙ¹`; it is not a finite normalization.
- `ProjectiveToroidalModel.stabilization_test`: two sufficiently divisible `d` give canonically
  identified models, with the same charts and families.
- Each index `j` has its own tautological semi-abelian family.
- The lattice-chain-to-singleton maps of Lan16 Example 13.12 are projective and can be nonfinite
  on the interior; the unit boundary ideal there leaves the chosen interior unchanged.

### C5.32 Generation of the Hodge line of a semi-abelian family

Prove `SemiAbelianScheme.hodgeLine_generated`: let `S` be a normal excellent noetherian scheme (or
algebraic space) and `G → S` a separated smooth commutative group scheme of finite presentation
whose fibres have semi-abelian identity components, with abelian fibres over a dense open and a
polarization there. Then there is `m > 0` such that `ω_{G/S}^{⊗m}` is generated by its global
sections over `S`, when `S` is proper over an affine base; locally on such a base in general. The
proof of Faltings–Chai V.3 builds the sections from algebraic theta constants: after an auxiliary
level and Zarhin's trick (PadicDifferentialEquationsAndRigidCohomology §RD.5.116) reducing to
principal polarizations, the theta constants are sections of a power of `ω` with no common zero,
because theta functions give projective embeddings of the abelian part of each fibre; descend from
the auxiliary level. For algebraic-space bases retain this theta-section descent argument, as in
Lan's application to the toroidal moduli space; étale-local generation alone is not a proof of
generation by global sections ([Lan], Proposition 7.2.1.1, p. 540; [FC], Chapter V, Proposition 2.1,
p. 149, and §3, pp. 157–164; Moret-Bailly, *Pinceaux de variétés abéliennes*, Astérisque 129,
Chapter IX, Theorem 2.1, p. 208). On principal Siegel data use ArakelovGeometryAndAbelianHeights
§§5.0a–5.0b and identify this interface with its supplied specialization. Apply the trick on the
polarized abelian locus, with its étale-local polarization hypotheses; use C4.8 to extend the
resulting homomorphisms and identities across the boundary. *Needs:* C4.8;
PadicDifferentialEquationsAndRigidCohomology §RD.5.116; ArakelovGeometryAndAbelianHeights
§§5.0a–5.0b; C4.1, C4.6; AbelianSchemesAndArithmeticModuli A2.5 (polarizations), A3.6 (theta groups
and polarized descent), A2.8 (projective presentations over normal bases).

**Checks.**

- For the universal generalized elliptic curve over the compactified modular curve `X(N)`, `N ≥ 3`,
  `ω` has positive degree, so a power is generated by sections.
- For a constant abelian scheme `A × S`, `ω` is trivial and generated by one section.
- For `G_a` the hypothesis fails; `ω` of an additive group is not covered.

### C5.33 Isotriviality on curves of degree zero

Prove `SemiAbelianScheme.isotrivial_of_degree_le_zero`: let `C` be a proper smooth irreducible curve
over an algebraically closed field and `G → C` a semi-abelian scheme with `deg ω_{G/C} ≤ 0`. Then
some positive power of `ω_{G/C}` is trivial, so the degree is `0`, and `G` is an extension of an
isotrivial abelian scheme by a torus. Reduce by the torus part (C4.2) to generically abelian `G`,
then by Zarhin's trick (PadicDifferentialEquationsAndRigidCohomology §RD.5.116) to principal
polarizations; all sections of `ω^{⊗n}` are then zero or nowhere zero, so the theta constants are
constant and `G` has potentially good reduction everywhere and constant moduli ([FC], Chapter V,
Proposition 2.2, pp. 149–150; Moret-Bailly, *Pinceaux*, Chapter XI, Theorem 4.5, pp. 235–236,
especially (v bis) implies (iv), with Proposition 4.4). Here isotrivial means constant after a
finite étale cover. The determinant of the torus character local system has finite sign monodromy,
so its square is trivial; the torus Hodge line itself need not be trivial. On principal Siegel data
use ArakelovGeometryAndAbelianHeights §5.0b and identify this interface with its supplied
specialization. Apply the trick on the polarized abelian locus, with its étale-local polarization
hypotheses; use C4.8 to extend the resulting homomorphisms and identities across the boundary.
*Needs:* C4.8; PadicDifferentialEquationsAndRigidCohomology §RD.5.116;
ArakelovGeometryAndAbelianHeights §5.0b; C4.2, C5.32; AbelianSchemesAndArithmeticModuli A2.5, A3.6;
NeronModelsAndSemistableAbelianVarieties Layer 1.

**Checks.**

- A constant elliptic curve over `C` has `deg ω = 0`.
- The universal generalized elliptic curve over `X(N)`, `N ≥ 3`, has `deg ω > 0` and is not
  isotrivial.
- A split torus over `C` has trivial `ω`. A rank-one torus obtained by descent along a connected
  étale double cover can instead have a nontrivial line of order two (in characteristic different
  from two); its degree is still zero and its square is trivial.

### Examples

- Modular curves over `ℤ[1/N]`: `M^tor = M^min` is the compactified modular curve, the Hodge line is
  `ω`, `ω^{⊗2} ≅ Ω¹(log cusps)`, and `ω^{⊗12}` is generated by `Δ` and `E_4^3`.
- The Siegel threefold at a good prime: `Sym² E ≅ Ω¹(log D)`, `ω_X = (det E)^{⊗3}(−D)`, and the
  minimal boundary has dimension one.

### Dependencies

Layers C0–C4; PELModuli M2.8–M2.10 and M4.5–M4.6; AlgebraicModuliForArithmeticGeometry Layer 6;
NeronModelsAndSemistableAbelianVarieties Layer 1 and 3.10; AbelianSchemesAndArithmeticModuli A2.5,
A2.8, A3.6; ShimuraVarieties 2.1, 2.5, 2.7; AdicSpacesPartIII F0 and R2; SchemeAndStackFoundations Layer 0,
Layer 1, Layer 2 and Layer 4.

## Layer C6: Hilbert and modular specializations

For Hilbert modular varieties the general machinery becomes explicit, and it can be pushed to every
prime not dividing the tame level, including primes ramified in the totally real field and `p = 2`,
where the PEL models of C5 are not smooth. Following Dimitrov, this layer first proves only the
elementary unit-orbit estimates C6.1–C6.8 and trace-phase arithmetic C6.15–C6.19. It constructs the
ideal-level moduli, Hilbert cusp data, lattices, stabilizers, fans and all-prime families, then
glues the toroidal compactification over `ℤ[1/N(n)]` from formal charts by Rapoport's gluing theorem
(C6.55). After constructing its semi-abelian family and Hodge bundle, it proves the geometric
arithmetic Koecher principle C6.9–C6.12 and develops the minimal contraction, cusps and boundary
ideals, `q`-expansion principle and coefficient descent. It ends with the Hasse invariant on the
boundary and the ordinary neighbourhoods used for overconvergent Hilbert forms, the finite-level
maps, and, for `F = ℚ`, the comparison with the compactified modular curves.

Standing hypotheses of the layer:

- (C6-a) `F` is totally real of degree `g`, with integers `o` and different `d`, and
  `f^* = f⁻¹d⁻¹` for a fractional ideal `f`. The tame level `n` is prime to the discriminant `Δ_F`
  and divides neither `2` nor `3`; `c` is a fractional ideal prime to `n`; `B = ℤ[1/N(n)]`. The open
  model is the fine moduli scheme of `c`-polarized Hilbert–Blumenthal abelian varieties with
  `μ_n`-level structure constructed in C6.12a. For scalar `n = No`, H1.6 gives the level functor,
  H1.7 its good-prime representability and H2.2–H2.2b the all-prime Deligne–Pappas scheme comparison.
  Scheme-valued fine family statements in C6.20–C6.27 require a neat tame level, obtained by
  an auxiliary full tame level with the same inverted primes. Boundary-action freeness requires
  neatness of the acting arithmetic level as well. For general levels allowed here, descend the
  neat construction to the finite quotient stack, retain its inertia, and form the coarse
  compactification separately. Throughout C6, universal families and Hodge bundles at such levels
  live on this compactified stack; statements about coarse schemes carry the descent conditions
  on their weight lines. The open fine scheme alone does not imply a fine boundary.
- (C6-b) For an infinite place `w` of `F`, `τ_w : F → ℝ` is the corresponding real embedding;
  Mathlib's `InfinitePlace` value `w(x)` is `|τ_w(x)|`. `U` is a subgroup of the unit group `o^×`.
- (C6-c) Under (C6-a) with `g > 1`: a regular admissible cusp fan system (finite modulo units), a
  noetherian algebra `R` over `o′[1/Δ]`, `Δ = N(dn)`, where `o′` contains the values of the weight
  and the square roots needed for polarization descent (cyclotomic cusp coefficients are adjoined by an
  étale cover when needed), and `ω^κ` the descended line of invariant differentials of weight `κ`.
- (C6-d) Detection statements concern a fixed geometrically connected `c`-component; a form on an
  untested component is not detected.

### C6.1 A contracting unit

Prove `HilbertCusp.exists_unit_contracting_away` (suggested home `TauCeti/NumberTheory/Hilbert/Koecher`):
if `U` has finite index in `o^×` and `F` has more than one infinite place, then for every infinite
place `w_0` there is `u ∈ U` with `|τ_{w_0}(u)| > 1` and `|τ_w(u)| < 1` for all `w ≠ w_0`. Assume
(C6-b). Dirichlet's theorem (Mathlib `NumberField.Units.dirichletUnitTheorem.exists_unit`) gives a
unit small at every `w ≠ w_0`; the product formula for logarithms (`NumberField.Units.sum_mult_mul_log`,
with all multiplicities `1` by `NumberField.IsTotallyReal.mult_eq`) makes it large at `w_0`; a
positive power lies in `U` (`Subgroup.exists_pow_mem_of_index_ne_zero`) ([Dimitrov], proof of Théorème
8.3, p. 547). *Needs:* Mathlib `NumberField.Units.dirichletUnitTheorem.exists_unit`,
`NumberField.Units.sum_mult_mul_log`, `NumberField.Units.pos_at_place`,
`NumberField.IsTotallyReal.mult_eq`, `Subgroup.exists_pow_mem_of_index_ne_zero`.

**Checks.**

- Over `ℚ` every unit has absolute value `1`, so the hypothesis on the number of places is needed.
- For a cusp-unit group the finite index comes from C6.54; no density argument replaces it.

### C6.2 A negative embedding

Prove `HilbertCusp.exists_negative_embedding`: if `ξ ∈ F` is nonzero and not totally positive, then
`τ_w(ξ) < 0` for some `w`. Negate Tau Ceti's characterization of total positivity
(`NumberField.isTotallyPositive_iff`) and use injectivity of `τ_w`. Dimitrov's argument needs `ξ ≠ 0`
explicitly: the exponent `0` is not excluded in the printed contradiction ([Dimitrov], proof of
Théorème 8.3, p. 547). *Needs:* Tau Ceti `NumberField.isTotallyPositive_iff`.

**Checks.**

- `ξ = 0` has no negative embedding and is excluded.
- A nonzero element has no zero real conjugate.

### C6.3 Unbounded negative traces along unit orbits

Prove `HilbertCusp.trace_pairing_unbounded_below`: if `U` has finite index, `[F : ℚ] > 1`, `ξ ≠ 0` is
not totally positive and `y_w > 0` for all `w`, then for every real `B` some `u ∈ U` has
`∑_w τ_w(u²ξ) y_w < B`. Take `w_0` with `τ_{w_0}(ξ) < 0` (C6.2) and `v` contracting away from `w_0`
(C6.1); for `u = v^n` the `w_0` term tends to `−∞` and the others to `0` ([Dimitrov], proof of
Théorème 8.3, p. 547). The vector `y` lies in the open positive cone; it need not come from `F`.
*Needs:* C6.1, C6.2; Mathlib `tendsto_pow_atTop_atTop_of_one_lt`, `tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Checks.**

- Over `ℚ` the orbit of `−1` under squares of units is `{−1}`.
- For `ξ = 0` the pairing is identically `0`.
- For `ℚ(√2)`, `ξ = −√2`, `v = 1 + √2` and `y = (1, 1)`, the pairings tend to `−∞`.

### C6.4 Unit covariance preserves nonvanishing

Prove `HilbertCusp.coeff_ne_zero_iff_of_unit_covariance`: for a commutative ring `R`, `a : F → R`
and multipliers `c : U × F → R^×` with `a(u²ξ) = c(u, ξ) a(ξ)`, one has `a(u²ξ) ≠ 0` iff `a(ξ) ≠ 0`.
No hypothesis on `R`. Use Mathlib `Units.mul_right_eq_zero` ([Dimitrov], equation (5) and the
definition of `R_C^{(κ)}(R)` after it, p. 546). *Needs:* Mathlib `Units.mul_right_eq_zero`.

**Checks.**

- In `ℤ/4` the nonunit `2` kills `2`; the multipliers must be units.
- Units stay units after any coefficient change, even when they become `1`.
- Multiplication by `1` preserves every nonzero coefficient, also over nonreduced rings.

### C6.5 Koecher support for coefficient families

Prove `HilbertCusp.bounded_cusp_support_is_positive`: with `[F : ℚ] > 1`, `U` of finite index, `a`
unit-covariant as in C6.4, and `y` with all `y_w > 0` and `B` such that `B ≤ ∑_w τ_w(ξ) y_w` whenever
`a(ξ) ≠ 0`, every `ξ` with `a(ξ) ≠ 0` is `0` or totally positive. A nonzero coefficient at a nonzero,
not totally positive `ξ` would propagate along the unit orbit (C6.4) to pairings below `B` (C6.3)
([Dimitrov], proof of Théorème 8.3, p. 547). This is a statement about coefficient families; the
geometric bound comes from C6.9. This arithmetic theorem is stated in `Suggested.lean`.
*Needs:* C6.3, C6.4.

**Checks.**

- The family supported at `0` is allowed: Koecher does not give cuspidality.
- The coefficient ring may have torsion and nilpotents.
- The support bound is a hypothesis, supplied geometrically by C6.9.

### C6.6 Totally positive characters are positive on boundary rays

Prove `HilbertCusp.trace_pos_of_totallyPositive`: if `ξ` is totally positive and `v ≠ 0` has all
`v_w ≥ 0`, then `∑_w τ_w(ξ) v_w > 0`; for `ξ` in the character lattice and `v` a primitive ray of an
integral cusp chart, the pairing is a positive integer, so each monomial with exponent `ξ` is
divisible by every boundary coordinate ([Dimitrov], §2, pp. 529–530, and Théorème 8.3, p. 547).
*Needs:* C0.10, C6.13; Tau Ceti `NumberField.isTotallyPositive_iff`; Mathlib
the finite-sum positivity criterion.

**Checks.**

- `v = 0` gives `0` and is excluded.
- For `ξ = 1` the pairing with any positive `y` is positive.
- On a regular chart, positivity on all `r` rays makes the monomial divisible by `x_1⋯x_r`.

### C6.7 The constant coefficient

Prove `HilbertCusp.constant_coeff_annihilated`: under the covariance of C6.4, `(c(u, 0) − 1) a(0) = 0`
for every `u`, since `u² · 0 = 0`. For Dimitrov's weight law the cyclotomic phase at `0` is `1`
([Dimitrov], Proposition 8.5(iii), p. 548). *Needs:* C6.4.

**Checks.**

- This does not give `a(0) = 0` over a ring with zero divisors.
- For the trivial character every `a(0)` satisfies it.

### C6.8 Vanishing of the constant term

Prove `HilbertCusp.constant_coefficient_eq_zero`: if for some `u` multiplication by `c(u, 0) − 1` on
`R` is injective, then `a(0) = 0`. Injectivity cannot be replaced by `c(u, 0) ≠ 1` over a general ring
([Dimitrov], Proposition 8.5(iii), p. 548). *Needs:* C6.7.

**Checks.**

- In `ℤ/4` the unit `3 ≠ 1` fixes the nonzero coefficient `2`.
- Over a field any multiplier `≠ 1` is injective.

### C6.9 A pole bound on a cusp chart

Prove `HilbertModular.meromorphic_support_bound` (suggested home `TauCeti/Geometry/Shimura/Hilbert/Koecher`):
under (C6-c), a section of `ω^κ` over the open part of a completed regular cusp chart with finite pole
order along the boundary is, after a character-compatible trivialization, `t^{−m} g` with
`t = x_1⋯x_r`, `m ≥ 0` and `g` in the completed chart ring (C0.19); hence `a(ξ) ≠ 0` implies
`⟨ξ, y⟩ ≥ −m ∑_i ⟨m_i, y⟩` for every `y` in the cone, `m_i` the coordinate characters. Exponents of
`g` pair nonnegatively with the cone, Laurent coordinates pair to `0`, and `t^{−m}` shifts the support
(C0.19) ([Dimitrov], §2, pp. 529–530, and the proof of Théorème 8.3, p. 547). *Needs:* C0.10, C0.12,
C0.19, C6.20, C6.23, C6.27, C6.54; AdicSpacesPartIII F0; HilbertModularVarietiesAndShimuraCurves H1.

**Checks.**

- For `r = 1` this is the lower bound on the exponents of a Laurent series.
- The union of the boundary components is cut out by `x_1⋯x_r`; the sum of their ideals defines their
  intersection.
- The chart with `r = 0` is excluded.

### C6.10 Positive support of meromorphic expansions

Prove `HilbertModular.cusp_support_positive`: under (C6-c), every unit-covariant meromorphic cusp
expansion of a Hilbert modular form on the open part has support in `X_+ ∪ {0}`, where `X = cbb′` is
the character lattice at the cusp (C6.13). The finite-index group of units `(u, 1)` in the cusp
stabilizer (C6.54) preserves `X` and acts by unit multipliers; choose `y` in the open positive cone,
in some cone by completeness of the fan, apply C6.9 and then C6.5 in a local trivialization; unit
transition scalars make the result independent of it ([Dimitrov], proof of Théorème 8.3, p. 547).
*Needs:* C0.10, C0.12, C0.19, C6.5, C6.9, C6.13, C6.20, C6.23, C6.54;
HilbertModularVarietiesAndShimuraCurves H1.

**Checks.**

- Cusps with `b′ = b` and with `b′ ≠ b` each use their own lattice.
- A cusp that is ramified for the level need not lie over a prime ramified in `F`.
- Over the ramified prime `5` for `F = ℚ(√5)`, the chart comes from C6.20; the coefficient
  support argument over the weight base uses no smooth good-prime PEL family.

### C6.11 The arithmetic Koecher principle

Prove `HilbertModular.koecher`: for `g > 1`, every `o′[1/Δ]`-algebra `R` and the Hilbert toroidal
model, restriction `Γ(M̄_R, ω^κ) → Γ(M_R, ω^κ)` is an isomorphism; constant terms need not vanish.
Injectivity: the open part is schematically dense and the line is invertible. Surjectivity for
noetherian `R`: a section on the open part has finite poles along the boundary, its expansions are
positive (C6.10), so they lie in the completed regular rings; glue these formal sections by the
chart relation and extend by the comparison of completions with the formal model (AdicSpacesPartIII
§F0.6 (theorem-on-formal-functions), §F0.6 (formal-direct-image-comparison)). For general `R`,
descend the section to a finitely generated subalgebra and use that cohomology of quasi-compact
separated schemes commutes with filtered colimits (SchemeAndStackFoundations §§2.5–2.6); completion
is never commuted with arbitrary tensor products ([Dimitrov], Théorème 8.3, p. 547). *Needs:* C0.12,
C6.20, C6.10, C6.21, C6.27, C6.54; AdicSpacesPartIII §F0.6 (theorem-on-formal-functions), §F0.6
(formal-direct-image-comparison); SchemeAndStackFoundations Layer 0, Layer 1, Layer 2.

**Checks.**

- For `F = ℚ` the statement fails: `q⁻¹` is not excluded by units.
- The constant coefficient need not vanish.
- No statement about Hasse ideals at ramified primes follows from this theorem over `o′[1/Δ]`.
- A change of fan is handled by the comparison maps of C3, not by equality of models.

### C6.12 Cusp forms and the boundary ideal

Prove `HilbertModular.cuspidal_iff_constantTerm_eq_zero`: under (C6-c), for
`s ∈ Γ(M̄_{Σ,R}, ω^κ)`, `s` lies in the image of `Γ(M̄_{Σ,R}, ω^κ ⊗ I_D)` (with `I_D` the ideal of the
scheme-theoretic boundary, locally `(x_1⋯x_r)`) if and only if its constant coefficient vanishes at
every cusp component, after the étale coefficient covers. By C6.11 and C6.10 the expansions have
exponents in `X_+ ∪ {0}`; by C6.6 every nonconstant monomial is divisible by `t = x_1⋯x_r`, so an
expansion lies in `(t)` exactly when its constant term is `0`, with nilpotent coefficients allowed;
globalize through the exact sequence of the boundary and formal detection at all cusps
([Dimitrov], §2, pp. 529–530, equation (5) and Théorème 8.3, pp. 546–547). This is the scalar statement
on zero-dimensional cusp bases; the general statement with higher-dimensional boundary coefficients is
AutomorphicBundles B5. *Needs:* C0.12, C6.6, C6.11, C6.24, C6.27; AdicSpacesPartIII F0;
SchemeAndStackFoundations Layer 0, Layer 1.

**Checks.**

- A section with nonzero constant term extends (C6.11) but is not cuspidal.
- On a rank-one chart the condition is divisibility by `q`.
- Every cusp component must be tested.

### C6.12a Ideal-level Hilbert moduli

Construct `HilbertModular.idealLevelModel`: under (C6-a), the functor of `o`-abelian schemes with
ordered `c`-polarization satisfying the Deligne–Pappas condition and an `o`-linear closed immersion
`(o/n)(1) → A[n]`, where `(o/n)(1)` is the Cartier dual of the constant module `o/n`.
Prove representability by a normal quasi-projective fine scheme over `B = ℤ[1/N(n)]`, with universal
family, arbitrary base change of the functor and its level maps, and its identification with the
ideal-level Deligne–Pappas moduli problem. Retain the prime-to-discriminant and torsion-free level
hypotheses in (C6-a). Prove the pairing, change-of-polarization-ideal and forgetful level laws with
the trace-dual lattice visible, and the tame polarization quotient laws with the ideal congruence
unit group retained; compare the scalar case with H3. For `n = No`, identify the functor and laws with
HilbertModularVarietiesAndShimuraCurves H1.6–H1.9 and the all-prime scheme of H2.2–H2.2b.
For general `n`, choose scalar `No ⊆ n`, pull the stipulated ideal marking back to the full scalar
frame cover, cut out its injective `o`-linear markings and descend by their finite frame stabilizer.
Prove that this quotient represents the ideal-level functor, preserving its DP condition and
normality; the level hypotheses remove automorphisms. Quasi-projectivity uses the descended ample
polarized moduli presentation, not merely trivial inertia ([Dimitrov], §4, pp. 535–536; [DT],
Définitions 2.2–2.5 and Théorème 4.1). *Needs:* HilbertModularVarietiesAndShimuraCurves H1.1,
H1.6–H1.9, H2.2–H2.2b, H3; AbelianSchemesAndArithmeticModuli A3 (torsion, finite level and pairings);
SchemeAndStackFoundations Layer 1 (finite quotients and descent).

**Checks.**

- For `n = No`, recover the supplied scalar `μ_N` functor, including its trace-dual convention;
  for `F = ℚ` this is the multiplicative marking form of `Y_1(N)`.
- For `F = ℚ(√5)`, `n = (11)` and scalar `N = 11`, the ideal and scalar constructions agree;
  at the ramified prime `5` the open model is DP and no smoothness is inferred.
- For the nonscalar prime ideal `n = ((11+5√5)/2 − 1)` of norm `11`, the marking has rank `11`,
  whereas a scalar `(11)` marking has rank `121`. The finite-frame descent must retain this distinction.

### C6.13 Cusp data, lattices and the trace pairing

Define `HilbertCusp.Data` and prove `HilbertCusp.lattice_eq` (suggested home
`TauCeti/Geometry/Shimura/Hilbert/Cusp`): an `(R, n)`-cusp is given by an exact sequence
`0 → a^* → L → b → 0` of `o`-lattices, `c = ab⁻¹`, and a level structure `β` (Dimitrov, Définition
3.2); the level determines `b′ ⊇ b` (with `b′ ⊆ n⁻¹b`), the character lattice at the cusp is
`X = cbb′ = ab′`, its cocharacter lattice `X^*` pairs with `X` by `Tr_{F/ℚ}`, the unipotent part of the
stabilizer is `X^*` and the diagonal units act through `u²ε` (C6.54). The cusp is unramified for the
level exactly when `b′ = b` ([Dimitrov], §3, Définition 3.2 and Proposition 3.3(i)–(iv), pp. 531–535).
The finite cyclotomic action `H_C` is kept separate from translations and diagonal units. *Needs:*
HilbertModularVarietiesAndShimuraCurves H0.3–H0.5, H1.1, H1.9 (polarization and trace-dual
lattices, polarization modules and scalar-level laws); C6.12a for general ideal-level data; Mathlib
`Submodule.traceDual`.

The API: `HilbertCusp.Data.ext` (isomorphism of the exact sequence respecting polarization and
level), `HilbertCusp.lattice_eq` (`X = ab′`), `HilbertCusp.cocharacter_eq_traceDual`,
`HilbertCusp.unramified_iff` (`b′ = b`) and `HilbertCusp.tracePairing_natural` (transport under an
isomorphism of cusp data, contravariantly in the cocharacter lattice).

**Checks.**

- For `b′ = b`, `X = cb²`; for `b′ ≠ b` the lattice changes.
- The phase quotient is `(ab)^*/(ab′)^*`, not the inverse quotient.
- For `F = ℚ`, `a = b = b′ = ℤ` and `c = ℤ`, the character and cocharacter lattices are both
  `ℤ`; the trace pairing of `m` with `n` is the integer `mn`. Replacing `b′` by `(1/3)ℤ` changes
  these lattices to `(1/3)ℤ` and `3ℤ`, with pairing `⟨1/3, 3⟩ = 1`.

### C6.14 Admissible Hilbert cusp fans

Prove `HilbertCusp.admissibleFan_iff`: a complete arithmetic cone system of C0.13 at a Hilbert cusp is the
same as a complete rational polyhedral decomposition of the totally positive cone in `X^* ⊗ ℝ`, with
`0`, locally finite away from `0`, stable under the effective cusp units, with finitely many orbits and
compatible with cusp isomorphisms (Dimitrov, Définition 7.1). The finite-overlap hypothesis of
C0.14–C0.15 holds for the effective units acting on the totally positive cone (C1.5 in this case)
([Dimitrov], Définition 7.1 and the proof of Théorème 7.2, pp. 541–542). *Needs:* C0.13, C0.14, C0.15,
C1.5, C6.13, C6.54.

**Checks.**

- For `g > 1`, finitely many unit orbits does not mean finitely many cones.
- A fan regular for `(cb²)^*` need not be regular for `(cbb′)^*` at a ramified cusp (Dimitrov,
  Remarque 7.3).
- The system consisting only of the zero cone satisfies C0.13 but is not complete at a
  positive-degree Hilbert cusp, so it is excluded from this equivalence.

### C6.15 Integral trace exponents

Prove `CyclotomicPhase.trace_exponent_integral` (suggested home `TauCeti/NumberTheory/Hilbert/Phase`):
for `ℤ`-submodules `A, B` of a number field `K` with `nB ⊆ A`, `ξ ∈ B` and `x ∈ traceDual(A)`, there is
`m ∈ ℤ` with `m = n·Tr_{K/ℚ}(ξx)`. Pair `x` with `nξ ∈ A` using Mathlib's `Submodule.mem_traceDual`
([Dimitrov], Proposition 4.1(ii), p. 537). *Needs:* Mathlib `Submodule.traceDual`,
`Submodule.mem_traceDual`.

**Checks.**

- `A = ℤ`, `B = ⅓ℤ`, `n = 3`, `ξ = ⅓`, `x = 1` gives `m = 1`.
- With `n = 2` the denominator is not cleared.

### C6.16 Congruence of exponents

Prove `CyclotomicPhase.trace_exponents_congruent`: if `ξ ∈ B` and `x′ − x ∈ traceDual(B)`, integer
witnesses `m = n·Tr(ξx)` and `m′ = n·Tr(ξx′)` differ by `n` times an integer ([Dimitrov], Proposition
4.1(ii), p. 537). *Needs:* Mathlib `Submodule.mem_traceDual`.

**Checks.**

- The dual must be that of `B`, not of the smaller `A`.

### C6.17 Phases do not depend on the lift

Prove `CyclotomicPhase.phase_independent_of_lift`: with the witnesses of C6.16 and `ζ ∈ R^×` with
`ζ^n = 1`, `ζ^{m′} = ζ^m`, for any commutative ring `R`; `ζ` need not be primitive ([Dimitrov],
Proposition 4.1(ii), p. 537). *Needs:* C6.16.

**Checks.**

- Roots of unity may specialize to smaller order; the equality holds over nonreduced `R`.

### C6.18 Phases are additive

Prove `CyclotomicPhase.phase_additive`: for witnesses `m_ξ`, `m_η`, `m_{ξ+η}` of `n·Tr(·x)`,
`ζ^{m_{ξ+η}} = ζ^{m_ξ} ζ^{m_η}` ([Dimitrov], Proposition 4.1(ii), p. 537). *Needs:* Mathlib
`Submodule.traceDual`.

**Checks.**

- Negative exponents are taken in `R^×`.

### C6.19 The phase character

Construct `CyclotomicPhase.tracePhase`: for `nB ⊆ A`, `x ∈ traceDual(A)` and `ζ ∈ R^×` with `ζ^n = 1`,
the additive character `B → Additive R^×`, `ξ ↦ ζ^m` with `m = n·Tr(ξx)` (an integer by C6.15). It is
a homomorphism (C6.18) and depends only on `x` modulo `traceDual(B)` (C6.17); no generator of `B` is
chosen. In the geometric case `A = ab`, `B = ab′` and `n` is the exponent of `b′/b` ([Dimitrov],
Proposition 4.1(ii) and equation (5), pp. 537 and 546). The API: `tracePhase_apply`, `tracePhase_zero`,
`tracePhase_add`, `tracePhase_lift`, `tracePhase_trivial_root` (`ζ = 1` gives the trivial character),
`tracePhase_map` (transport along `R → R′`). *Needs:* C6.15, C6.17, C6.18.

**Checks.**

- For `K = ℚ`, `A = ℤ`, `B = ⅓ℤ`, `n = 3`, `x = 1`, the value at `⅓` is `ζ`.
- The value at `0` is `1`, also over the zero ring.
- For `x = 1` and `x′ = 4` (with `B = ⅓ℤ`) the characters agree when `ζ³ = 1`,
  since `3 ∈ traceDual(B)`.
- For `A = ℤ`, `B = ¼ℤ`, `n = 4`, `ζ = 2 ∈ (ℤ/5)^×`, `x = 0`, `x′ = 1`, the values at
  `¼` are `1` and `2`; working modulo `traceDual(A)` would be wrong.
- Over `ℤ/8` with `n = 4` and `ζ = 3` (of order `2`) the value is `3^m`.

### C6.20 The universal family on a cusp chart

Prove `HilbertModular.cuspChart_family`: over `B[ζ_e]`, `e` the exponent of `b′/b`, form the
boundary-adic completed cone algebra `R̂_σ` of C0.8 (C0.19 on regular charts). Construct the Mumford
semi-abelian family of C4.5 on `Spec R̂_σ`, with its `o`-action and the polarization and level
degeneration data on the torus and period lattices. Its abelian locus is the complement of the
closed boundary, `Spec R̂_σ[1/t]` on a regular chart. On this open construct the actual
`c`-polarization and the `o`-linear closed immersion `(o/n)(1) → A[n]` of C6.12a, and the
classifying map to that moduli scheme; the family there is the pullback of the universal HBAV.
The actual marking is asserted on this abelian open. The formal completion on `Spf R̂_σ`
retains the semi-abelian family, `o`-action and degeneration data used in C6.21 and C6.55.
Changing the uniformization `x ∈ (ab)^*/(ab′)^*` acts on the completed cone algebra by
`q^ξ ↦ ζ_e^{e·Tr(ξx)} q^ξ`, the phase of C6.19; on the abelian open it gives the comparison of
marked polarized HBAVs and their classifying maps. Construct the family directly from C4.4–C4.6
and the cusp lattices and phases of C6.13, C6.19 and the full affine action of C6.54, without
(C4-b). Use C4.8 for uniqueness of the extended `o`-action and compatible homomorphisms, and
C4.10's distinction between actual abelian levels and degeneration-level data.
Faces and changes by cusp units and `H_C` are compatible. After restriction to the good-prime PEL base, compare with C4.7, C4.9 and
C4.10 ([Dimitrov], Proposition 4.1(i)–(iii),
pp. 536–537). *Needs:* C0.8, C0.19, C4.4–C4.6, C4.8, C6.12a, C6.13, C6.19, C6.54.

**Checks.**

- For `b′ = b`, `e = 1` and the phase is trivial.
- Ramification of the cusp for the level is a property of `b′/b`.
- For `F = ℚ(√5)`, `n = (4)` and `p = 5`, the chart and its `o`-action are defined over
  `ℤ[1/4,ζ_e]`; the ramified prime is retained. C4.7 cannot supply this all-prime chart.
- In the elliptic case the Tate family is over `B[[q]]` and is abelian over `B[[q]][1/q]`.
  Its nonrational `j(q)` prevents descent to the ordinary chart `B[q]` with that parameter.
- Over `ℂ[[t]]`, the fine `μ₅` marking of `Tate(t⁵)` sending a chosen `ζ₅` to `[t]` is defined
  on the abelian generic fibre. Its component class in the Néron 5-gon is `1`; every representative
  `t(t⁵)^m` has valuation `1+5m ≠ 0`. Thus it does not extend into the connected semi-abelian
  family, whose special fibre is `G_m`.

### C6.20a Raynaud uniformization over Artinian thickenings

Construct `HilbertModular.artinianRaynaudUniformization`: for a permitted Artinian thickening
`(R,R⁽⁰⁾)` of a complete discretely valued pair `(K,V)` as in C6.55, and an HBAV over `R` with
split bad semistable reduction after the stipulated admissible thickening and splitting extension,
construct its rigid-analytic uniformization by `G_m ⊗ a^*` and the period lattice `b`, retaining
its `o`-action, ordered polarization and ideal-level data. Prove the torsion exact sequence,
the `o`-balanced valuation pairing, reduction compatibility, uniqueness up to isomorphism of the
lattice data, and compatibility on increasing the admissible thickening and on splitting base
change. Compare this uniformization with the completed Mumford families of C6.20. The complete-DVR
uniformization supplies the reduced case; extend Raynaud's construction to these Artinian pairs
as in [Dimitrov], §6, Définition 6.1 and Théorème 6.2, p. 541. Normal-domain degeneration theory
alone does not cover the nilpotents of `R`. *Needs:* C6.13, C6.19, C6.20, C6.55 (definition of
permitted thickening); NeronModelsAndSemistableAbelianVarieties 3.13–3.14;
AdicSpacesPartIII F0, R2; SchemeAndStackFoundations Layer 1.

**Checks.**

- A constant deformation over `K[ε]/(ε²)` of a split semistable HBAV retains its reduced torus,
  period lattice, polarization and marking.
- In the elliptic case, replacing a Tate period by `q(1+ε)` reduces to `q` but retains the
  first-order period deformation; reduction does not identify the two deformations.
- Passing from `R⁽ⁱ⁾` to `R⁽ⁱ⁺¹⁾` gives the same uniformization after restriction to their common
  rigid generic fibre, including the torsion sequence and ideal-level marking.

### C6.21 The fine Hilbert toroidal compactification

Prove `HilbertModular.toroidal_exists`: at neat tame level, for an admissible fan system `Σ`,
there are a scheme `M̄¹_Σ` over `B`, an open immersion `M¹ → M̄¹_Σ` and identifications of the completions along the boundary
with the cusp charts of C6.20, compatible with the universal family; the triple is unique up to
unique isomorphism. Choose finitely many orbit representatives of cusps and cones with their unit,
cyclotomic and face relations; the cusp charts form a découpage in the sense of C6.55; its
hypotheses hold: the interior is schematically dense, the open moduli space is compactifiable, the
gluing map is permitted, and the conditions on points over complete discrete valuation rings and
their Artinian thickenings are verified on the permitted boundary-specializing locus of C6.55, using
NeronModelsAndSemistableAbelianVarieties 3.13–3.14 for the reduced-point condition and C6.20a for
the Artinian lifting condition (ii). For general (C6-a) levels, descend the neat construction with
its family to the compactified quotient stack and separately form its coarse scheme. At primes
dividing `Δ_F` the open model is the ideal-level Deligne–Pappas model of C6.12a (H2.2–H2.2b at scalar level); no smoothness
is used there. Uniqueness is part of C6.55 ([Dimitrov], Théorème 7.2(i) and §§5–6, pp. 538–543).
*Needs:* C4.6, C6.12a, C6.14, C6.20, C6.20a, C6.55; NeronModelsAndSemistableAbelianVarieties 3.13, 3.14;
HilbertModularVarietiesAndShimuraCurves H2.2, H2.3; AdicSpacesPartIII F0; SchemeAndStackFoundations
Layer 1.

**Checks.**

- No smoothness at primes dividing `Δ_F` is asserted.
- Replacing the lattice `cbb′` at a ramified cusp by `cb²` contradicts Remarque 7.3.
- A constant good-reduction HBAV over a complete DVR gives an interior point outside the
  permitted boundary-specializing locus. Boundary charts are not required to cover that point.

### C6.22 Polarization quotients of toroidal models

Prove `HilbertModular.toroidal_polarizationQuotient`: for a fan system invariant under the finite
tame polarization group (C6.12a; HilbertModularVarietiesAndShimuraCurves H3 at scalar level,
`Δ(N) = o^{×,+}/((1+No)^×)²` in the scalar case), its action extends to `M̄¹_Σ` and the quotient `M̄_Σ`
compactifies the coarse model `M`. At neat tame level for the acting arithmetic group, the
boundary action is free and `M̄¹_Σ → M̄_Σ` is finite étale. At general (C6-a) levels use the
quotient stack before taking its coarse scheme; no freeness or étaleness follows from torsion
freeness alone. The chart maps are equivariant ([Dimitrov], Proposition 4.1(iii), p. 537, and
Théorème 7.2(ii), pp. 542–543; [BHW], Proposition 8.4, p. 1766,
for the open part). *Needs:* C6.12a, C6.21; HilbertModularVarietiesAndShimuraCurves H3;
SchemeAndStackFoundations Layer 1.

**Checks.**

- The corresponding map of minimal compactifications need not be étale (C6.33).
- Positive units need not preserve full `p`-level structures.
- At scalar level `No` the ideal-level group and its quotient agree with the supplied H3
  group `Δ(N)` and its action on ordered polarizations.

### C6.23 Formal neighbourhoods of the boundary

Prove `HilbertModular.boundary_formal`: the completion of `M̄_Σ` along its boundary is the disjoint
union over cusps of the completed toric union (C0.19) modulo the effective cusp units, with
coefficients `B[ζ_e]^{H_C}` on coarse charts; on the neat fine model use `U_{C,1}` and `H_{C,1}`
(C6.54). At general level keep the full residual cusp action on the compactified stack before
passing to these invariant rings; the actions on roots of unity and on the weight line are
transported together ([Dimitrov], Théorème 7.2(i)–(ii),
pp. 541–543). The arithmetic unit quotient is infinite and is not a finite quotient of one chart.
*Needs:* C0.8, C0.12, C0.19, C6.13, C6.21, C6.22, C6.54; AdicSpacesPartIII F0.

**Checks.**

- Formal completion and tensor products of coefficients are kept apart.
- At a split neat elliptic cusp of width `h`, the strict chart is the power-series chart in
  `q_h` with `q_Tate = q_h^h`.
- At the irregular `Γ₁(4)` cusp `1/2`, the quadratic strict cover has a residual involution.
  Its quotient stack retains inversion inertia, and the coarse invariant parameter does not
  trivialize that action on the Hodge line.

### C6.24 Étale toric charts at the boundary

Prove `HilbertModular.boundary_etaleToric`: at neat tame level, near the boundary, `M → M̄` is
étale locally the relative
torus embedding of C0.8 for the lattice `X`; the strata have their toric description after base change
to an algebraically closed field of characteristic prime to `N(n)`. At neat tame level the
effective cusp units act freely on the boundary strata. At general levels the toric charts are
charts of the quotient stack; coarse charts can retain finite quotient singularities.
Boundary-local étale charts of the neat model are obtained from the formal ones by Artin
approximation (AlgebraicModuliForArithmeticGeometry Layer 6) ([Dimitrov], Corollaire 7.4, p. 544).
*Needs:* C0.8, C0.9, C0.18, C6.23; AdicSpacesPartIII F0; AlgebraicModuliForArithmeticGeometry Layer 6.

**Checks.**

- Freeness on neat toroidal strata does not imply freeness at a minimal cusp.
- A neat split elliptic boundary has the étale toric pair `G_m ⊂ A¹`.
- At `Γ₁(4)` the cusp `1/2` retains order-two inertia on the stack, although its coarse
  boundary point is a smooth point of a curve.

### C6.25 Smooth refinements over the good base

Prove `HilbertModular.regularRefinement_smooth`: an admissible refinement regular for each `X^*`
at neat tame level makes `M̄_Σ` smooth over `ℤ[1/Δ]`, and refinement maps agree with C3.1 on
the open part and on completed charts. Combine C0.15, the smooth open model over `ℤ[1/Δ]` and the étale charts of C6.24
([Dimitrov], Corollaire 7.5 and Remarque 7.3, pp. 543–544). *Needs:* C0.15, C3.1, C6.24;
HilbertModularVarietiesAndShimuraCurves H1.6.

**Checks.**

- Smoothness over `ℤ[1/N(n)]` is not asserted at primes dividing `Δ_F`.
- In rank one a regular neat cusp chart is smooth over its étale cusp base.
- A smooth chart with a residual finite action gives a smooth quotient stack, but its coarse
  quotient need not be smooth; regularity of the fan alone does not remove this obstruction.

### C6.26 The universal semi-abelian scheme

Prove `HilbertModular.semiAbelian_extend`: the universal Hilbert–Blumenthal abelian variety on `M¹`
at neat tame level extends uniquely to a semi-abelian scheme `G` over `M̄¹_Σ` with `o`-action;
it is a torus over the boundary. Its pullbacks to `Spec R̂_σ` and their formal completions are the
Mumford families of C6.20. At general (C6-a) levels the extension is on the compactified quotient
stack; its descent to a coarse scheme requires trivial stabilizer action on the family. Descend
the chart families by their equivariance, glue with the universal family, and use uniqueness of extensions over the normal model
(C4.8) ([Dimitrov], Proposition 7.6, p. 544). *Needs:* C4.6, C4.8, C6.20, C6.21;
NeronModelsAndSemistableAbelianVarieties 3.14; SchemeAndStackFoundations Layer 1.

**Checks.**

- A nontrivial polarization quotient need not carry the universal ordered `c`-polarization.
  For `F = ℚ`, `c = ℤ` and scalar level `5`, `Δ(5) = 1`: the quotient equals the fine model
  and retains its universal principally polarized elliptic curve and semi-abelian extension.
- At the boundary the torus has rank `g`, and its `p^n`-torsion is multiplicative of rank `p^{ng}`,
  not of height `2g`.
- For `F = ℚ(√5)`, scalar level `4` and residue characteristic `5`, descend the C6.20
  families on the compactified stack with their lattice-defined `o`-action, without the
  good-prime PEL endomorphism theorem; a neat auxiliary cover gives the scheme-valued family.
- For `F = ℚ`, `n = (4)`, `σ = [[1,0],[2,1]]` and `T = [[1,1],[0,1]]`, the cusp `1/2` has
  `γ = [[1,−1],[4,−3]] = −σTσ⁻¹ ∈ Γ₁(4)`. Both eigenvalues are `−1`; strict width is `2`,
  effective width `1`. Its sign monodromy becomes unipotent after the quadratic cusp cover,
  but forbids a semi-abelian extension over the coarse cusp (ModularCurvesPartII §§3.5, 4.8).

### C6.27 Invariant differentials

Prove `HilbertModular.conormal_compare`: on the neat model, or on the compactified quotient stack
at general level as in C6.26, `e^*Ω¹_{G/M̄}` is the differential module of the chart
families, restricts to the Hodge bundle on `M¹`, is locally free of `O_{M̄}`-rank `g`, and is
locally free of rank one over `o ⊗ O_{M̄}` on the Rapoport locus and on split toric boundary charts,
and after inverting `Δ` its weight lines are those of HilbertModularVarietiesAndShimuraCurves H3.
For a torus the differentials come from the character lattice (C4.1), and the pieces glue by
uniqueness. The modified integral lattice used for canonical subgroups is a different sheaf
([Dimitrov], Proposition 7.6 and the opening of §8, pp. 544–546; [BHW], §7.1, pp. 1759–1760).
AutomorphicBundles B3 and HilbertModularVarietiesAndShimuraCurves H5 apply this comparison. *Needs:*
C4.1, C6.20, C6.26; HilbertModularVarietiesAndShimuraCurves H1, H2, H3.

**Checks.**

- Away from the Rapoport locus at a ramified prime, local freeness of rank one over `o ⊗ O` fails in
  general.
- At the split toric boundary for `F = ℚ(√5)` and residue characteristic `5`, the module is
  `X ⊗ O`, free of rank one over `o ⊗ O` even though `5` ramifies in `F`.
- As an `O`-module this same boundary module has rank two, so it is not an invertible
  `O`-module; weight lines arise only after the stipulated splitting and weight-base changes.

### C6.28 Properness

Prove `HilbertModular.toroidal_proper`: for a complete admissible fan system, `M̄¹_Σ` and `M̄_Σ` are
proper over `B`. After a finite extension of a discrete valuation field a Hilbert–Blumenthal abelian
variety has semistable reduction (NeronModelsAndSemistableAbelianVarieties 3.10); Raynaud's period
lattice gives a totally positive valuation vector, which lies in a cone modulo units by completeness;
the chart extends the point; descend along the extension ([Dimitrov], Théorème 7.7, pp. 544–545).
Projectivity is not asserted. *Needs:* C4.6, C6.14, C6.21, C6.22; NeronModelsAndSemistableAbelianVarieties
3.10, 3.14.

**Checks.**

- Properness does not give projectivity for every fan.

### C6.29 Semiampleness of the determinant Hodge line

Prove `HilbertModular.hodgeLine_semiample`: a positive power of `λ = det_ℤ(e^*Ω¹_G)` on `M̄¹_Σ` is
generated by global sections over `B`. Apply C5.32 to `G` over the normal excellent model `M̄¹_Σ`,
which is proper over `B`; the discriminant is not inverted and the good-prime models of C5 are not
used. On the locus where the differentials are locally free over `o ⊗ O`, `λ` is the parallel weight
line ([Dimitrov], Théorème 8.6(i) and its proof, pp. 548–549, and Remarque 8.2(1), p. 546). *Needs:*
C5.32, C6.26, C6.28; SchemeAndStackFoundations Layer 4.

**Checks.**

- No boundary twist enters `λ`.

### C6.30 The minimal contraction

Prove `HilbertModular.minimal_contraction`: the section ring `R_λ = ⊕_{k ≥ 0} Γ(M̄¹_Σ, λ^{⊗k})` defines a
surjective contraction `π : M̄¹_Σ → M^{1,min} = Proj_B R_λ`, independent of `Σ`. Use the Stein
factorization of the morphism defined by a generated power (as in C5.14); for two fan systems choose a
common regular refinement, whose maps to the models satisfy `π_*O = O` (C3.6) and identify the
families and determinant lines (C4.8), hence all graded pieces of `R_λ` ([Dimitrov], Théorème 8.6(ii)
and its proof, pp. 548–549). An isomorphism over `ℚ` alone does not identify integral models.
*Needs:* C3.6, C4.8, C6.25, C6.29, C6.31; SchemeAndStackFoundations Layer 0, Layer 4.

**Checks.**

- Agreement over `ℚ` does not identify the integral minimal models.

### C6.31 Finite generation of the section ring

Prove `HilbertModular.sectionRing_fg`: `R_λ` is a finitely generated `B`-algebra, by the argument of
C5.14: a generated power `λ^{⊗m}` is pulled back from `O(1)` on the Stein factor `Y`, the Veronese
subring is finitely generated, and each residue class `⊕_k Γ(λ^{⊗(mk+j)})` is a finite module over it
because the direct image of `λ^{⊗j}` on `Y` is coherent. Integrality over a finitely generated subring
alone is not used to conclude finiteness ([Dimitrov], Théorème 8.6(iii) and its proof, pp. 548–549).
*Needs:* C6.28, C6.29; SchemeAndStackFoundations §0.3, Layer 2, Layer 4.

**Checks.**

- Finiteness over the Veronese subring is proved, not assumed.

### C6.32 Normal projective minimal models

Prove `HilbertModular.minimal_normal_projective`: `M^{1,min}` is a normal projective `B`-scheme of
finite type, and `π` is proper and birational with connected fibres and `π_*O = O`, by the Stein
factorization over the excellent base and normality of `M̄¹_Σ`; normality of fibres is not inferred
from normality of the total space ([Dimitrov], Théorème 8.6(iii), pp. 548–549). *Needs:* C6.28, C6.30,
C6.31; SchemeAndStackFoundations Layer 0, Layer 4.

**Checks.**

- Connectedness of fibres is a theorem, not the definition.

### C6.33 Polarization quotients of minimal models

Prove `HilbertModular.minimal_polarizationQuotient`: the finite tame polarization group acts on `R_λ`
and on `M^{1,min}`; the quotient `M^min` is normal projective of finite type over `B` and the
contraction descends. Minimal cusps can have stabilizers, so the map of minimal models is not étale in
general (SchemeAndStackFoundations Layer 1, finite quotients) ([Dimitrov], Théorème 8.6(iii),
pp. 548–549). *Needs:* C6.22, C6.32; HilbertModularVarietiesAndShimuraCurves H3;
SchemeAndStackFoundations Layer 1.

**Checks.**

- A cusp can acquire a nontrivial stabilizer after contraction although the toroidal action is free.

### C6.34 Cusps of the minimal model

Prove `HilbertModular.minimal_cusps`: `π` identifies `M` with a dense open of `M^min`, whose reduced
boundary is the finite étale `B`-scheme `⊔_C Spec(B[ζ_e]^{H_C})`, of relative codimension `g`. On the
completed cusp charts, positive exponents vanish on the boundary and the unit-invariant constants of
weight zero are constants; proper formal functions identify the contracted cusps, and the cyclotomic
quotient by `H_C` gives the coefficient rings, étale over `B` because `e` divides a power of `N(n)`
([Dimitrov], Théorème 8.6(iv), p. 548). *Needs:* C0.18, C0.19, C6.23, C6.32, C6.33, C6.54;
AdicSpacesPartIII §F0.6 (theorem-on-formal-functions); SchemeAndStackFoundations Layer 0, Layer 4.

**Checks.**

- For `e = 1` the component is `Spec B`.
- A cusp component need not be a `B`-rational point.

### C6.35 Boundary fibres of the contraction

Prove `HilbertModular.minimal_boundaryFibres`: each minimal cusp has as inverse image one connected
toroidal boundary component, and every other geometric fibre of `π` is a point of `M`. The determinant
line has degree `0` on curves in a fibre, so by C5.33 the abelian part is constant along them; at a
Hilbert cusp the abelian part is `0`; the connected admissible fan modulo units forms the fibre over
the cusp. Connectedness comes from the Stein factorization, checked after geometric base change
([Dimitrov], Théorème 8.6(v) and its proof, pp. 548–549). *Needs:* C5.33, C6.26, C6.32, C6.34;
SchemeAndStackFoundations Layer 0, Layer 4.

**Checks.**

- The connected boundary component is not split into the separate cones of the fan.

### C6.36 Toroidal completion over a minimal cusp

Prove `HilbertModular.minimal_formal`: the completion of `M̄` along `π⁻¹(C)` is the completed toric union
modulo the cusp units with coefficients `B[ζ_e]^{H_C}`, agreeing with the toroidal completion; for
`e = 1` the coefficients are `B`. Combine C6.35, C6.23 and the theorem on formal functions for `π`;
the minimal local ring is not a single toric chart ([Dimitrov], Théorème 8.6(v), p. 548). *Needs:*
C6.23, C6.35, C6.54; AdicSpacesPartIII §F0.6 (theorem-on-formal-functions), §F0.6 (formal-direct-image-comparison).

**Checks.**

- The completion concerns the toroidal inverse image; the minimal model is not a torus embedding.

### C6.37 Weights that extend to the minimal model

Prove `HilbertModular.minimal_weightExtends_iff`: for `g > 1` and an integral weight `κ` over
`o′[1/Δ]`, the weight line extends invertibly to the minimal model if and only if `κ` is parallel
and every residual cusp character is trivial. On the fine model this requires `u^κ = 1` for all
`u ∈ o_{C,1}^×` at every cusp; on the coarse model also require trivial residual inertia on the fibre.
Here extension is over the characteristic-zero weight base, and `π_*ω^κ` is coherent for every `κ`.
For nonparallel `κ`, the logarithmic unit lattice makes the weight character nontrivial. For
parallel `κ`, the norm character has finite image: specify a common positive exponent annihilating
these characters at all cusps and the residual inertia, so this power extends invertibly. A formal
unit trivialization has a nonzero constant term, forcing precisely the stated character condition
([Dimitrov], Théorème 8.6(vi) and its proof, pp. 548–549). *Needs:* C6.1, C6.27, C6.34, C6.36,
C6.54; HilbertModularVarietiesAndShimuraCurves H3; SchemeAndStackFoundations Layer 0, Layer 2.

**Checks.**

- A nonparallel character can become trivial in a special coefficient ring; that does not give an
  invertible extension over `o′[1/Δ]`.
- For `F = ℚ(√5)`, put `u = ((1+√5)/2)^5 = (11+5√5)/2`, `n = (u−1)` and
  `b = b′ = o`. Then `N(n) = 11`, `u ∈ o_{C,1}^×` and `N(u) = −1`. The parallel weight
  `(1,1)` has character `−1` and does not extend invertibly in characteristic zero.
- In that fine-model example the square kills the norm sign; weight `(2,2)` has trivial cusp-unit
  character. On a coarse model a power must also kill any remaining inertia.

### C6.38 The geometric q-expansion map

Prove `HilbertModular.qExpansion_compare`: Dimitrov's `q`-expansion (Définition 8.4) at a uniformized
cusp is the restriction to the completed toric chart, with coefficients in
`a(κ) = (a ⊗ o′[1/Δ])^{−κ}` and the full affine, weight and cyclotomic covariance of C6.54.
In its coefficient convention `a_{u²εξ} = ε^{κ/2}u^κ φ_g(ξ)a_ξ`, retaining the translation phase
`φ_g` of the chosen stabilizer lift; scalars appear only after trivializing this line.
Use C6.20, equation (5) and C6.10 ([Dimitrov], Définition 8.4 and equation (5), pp. 546–547). AutomorphicBundles B4 and HilbertModularVarietiesAndShimuraCurves H5 apply it. *Needs:*
C0.10, C6.10, C6.20, C6.27, C6.54; AdicSpacesPartIII F0.

**Checks.**

- A change of uniformization multiplies coefficients by the phase of C6.19, independently of its
  representative modulo `X^*`.
- At the irregular `Γ₁(4)` cusp `1/2`, the linear multiplier is `1` but the strict parameter
  `t = q^{1/2}` changes sign under the lift `−T`; coefficient covariance retains this sign.
- Composition of two cusp transitions agrees with the phase cocycle of C6.54, including for
  nonreduced coefficient rings.

### C6.39 q-expansion detection with coefficient modules

Prove `HilbertModular.qExpansion_injective_module`: on a fixed smooth geometrically connected component
over the weight base `A_0` (a localization of a number ring containing the character and cyclotomic
values, with `Δ` inverted), restriction to the completion at the chosen cusp is injective on
`Γ(ω^κ ⊗_{A_0} N)` for every `A_0`-module `N`. For finitely generated `N` over the Dedekind base reduce
to finite projective modules and quotients by prime powers, and use geometric irreducibility of fibres
and schematic density on each thickening (SchemeAndStackFoundations Layer 0) with the comparison of
completions (AdicSpacesPartIII §F0.6 (theorem-on-formal-functions)); for general `N`, a section lives over a finitely generated
submodule `N_0` (Layer 2, filtered colimits), and `a(κ)` is flat, so `N_0 ⊆ N` induces injective
coefficient maps; no interchange of an infinite product with colimits is used. At a ramified cusp keep
the cyclotomic cover and phase and descend ([DT], §7, Définition 7.2, Proposition 7.3 and its proof,
Remarque 7.4(1), pp. 585–586; [Dimitrov], Proposition 8.5(i), p. 547). *Needs:* C6.38;
HilbertModularVarietiesAndShimuraCurves H1.6; AdicSpacesPartIII §F0.6 (theorem-on-formal-functions); SchemeAndStackFoundations Layer 0,
Layer 2.

**Checks.**

- Detection is for a fixed weight: modulo `p`, a Hasse invariant and `1` can have the same expansion.
- Torsion coefficients and thickenings are kept.
- No infinite product is commuted with filtered colimits.

### C6.40 The q-expansion principle

Prove `HilbertModular.qExpansion_injective`: at a uniformized cusp of the fixed component, the
`q`-expansion map on `Γ(ω^κ)` is injective for every algebra `R` over `o′[1/Δ, ζ_e]` (C6.39 with
`N = R`) ([Dimitrov], Proposition 8.5(i), p. 547; [DT], §7, pp. 585–586). *Needs:* C6.39.

**Checks.**

- One component cannot detect a form supported on another.

### C6.41 Descent of coefficients

Prove `HilbertModular.qExpansion_descent`: for an inclusion `R ⊆ R′` of coefficient algebras and a
section `f′` of weight `κ` over `R′` whose expansion at the chosen cusp has coefficients in the image of
the `R`-valued line, `f′` comes from a unique section over `R`; `R′` need not be flat over `R`. Apply
left exactness of global sections to `0 → R → R′ → R′/R → 0` tensored with the line, and C6.39 for
`N = R′/R`. Dimitrov's Proposition 8.5(ii) states this for an arbitrary `R`-algebra but its proof, and
Dimitrov–Tilouine's Proposition 7.3(2), use an inclusion; the theorem is stated for inclusions, and for
a noninjective map such as `R → 0` uniqueness fails ([Dimitrov], Proposition 8.5(ii), p. 547; [DT],
§7, pp. 585–586). *Needs:* C6.39; SchemeAndStackFoundations Layer 0.

**Checks.**

- The injective non-flat map `ℤ/4 → (ℤ/4)[t]/(2t)` is allowed. Evaluation at zero splits the
  coefficient inclusion; the class of `t` is killed by `2` but is not in `2A`, where
  `A = (ℤ/4)[t]/(2t)`. Flatness would force `ker(2 : A → A) = 2A`.
- For `R → 0`, uniqueness fails when `R ≠ 0`.
- For the identity inclusion the descended section is the original section.

### C6.42 Cusp ideals on the minimal and toroidal models

Prove `HilbertModular.boundaryIdeal_pushforward`: for `g > 1`, `π_*I_D = I_cusp`, with `D` the toroidal
boundary and `I_cusp` the ideal of the finite étale cusp scheme `C`; for a parallel weight line
`L_min`, `π_*(π^*L_min ⊗ I_D) = L_min ⊗ I_cusp`. From `π_*O_{M̄} = O_{M^min}` (C6.32), the boundary
`f : D → C` is proper, flat and of finite presentation with geometrically reduced connected fibres
(C0.18, C6.24, C6.35), so `f_*O_D = O_C` universally (C6.53); push forward `0 → I_D → O → O_D → 0` and use
the projection formula. `π^*I_cusp = I_D` is not claimed ([Dimitrov], Théorème 8.6(iv)–(v), pp. 548–549,
and Corollaire 7.4, p. 544). *Needs:* C0.12, C0.18, C6.24, C6.32, C6.34, C6.35, C6.36, C6.53;
AdicSpacesPartIII §F0.6 (formal-direct-image-comparison); SchemeAndStackFoundations Layer 0.

**Checks.**

- `π^*I_cusp ≠ I_D` in general; orders of vanishing change under refinement.
- Nilpotent coefficients are kept.
- The base `B` does not invert `Δ`.

### C6.43 Models at all primes prime to the level

Prove `HilbertModular.integralModel_compare`: for every prime `p` not dividing the tame level, including
`p = 2` and `p` ramified in `F`, the completions of the Deligne–Pappas model of
C6.12a (HilbertModularVarietiesAndShimuraCurves H2.2–H2.2b at scalar level) and of its toroidal
and minimal compactifications
agree with the models of C6.21 and C6.32 on the common open and the cusp charts; the ordinary locus and
the Hasse neighbourhoods are those of the local model of H2.5–H2.8. Match the moduli data on the
interior and the families and lattices on the boundary, and identify completions by uniqueness in
C6.55; Birkbeck–Heuer–Williams assume `N ≥ 4` and `(N, p) = 1` ([BHW], §§5.1.2–5.2, pp. 1744–1748;
[Dimitrov], Théorèmes 7.2 and 8.6, pp. 541–543 and 548–549). *Needs:* C6.12a, C6.21, C6.23, C6.32, C6.55;
HilbertModularVarietiesAndShimuraCurves H1, H2.2, H2.3, H2.5–H2.8; AdicSpacesPartIII F0.

**Checks.**

- Ramification of `p` in `F` and ramification of a cusp for the level are independent.
- For `F = ℚ(√5)` and scalar level `4`, the prime `5` is retained in the DP model and the
  cusp completion is the C6.20 all-prime chart.
- With the same field and level, `p = 2` is excluded because it divides the level; with scalar
  level `11`, `p = 2` is retained. Inverting the discriminant would lose the first comparison.

### C6.44 The Hasse ideal on the boundary

Prove `HilbertModular.hasseIdeal_compare`: on the ordinary model, the total Hasse ideal of
HilbertModularVarietiesAndShimuraCurves H2.7 is the ideal of the determinant of Verschiebung on invariant
differentials (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.21) on the abelian locus and of C4.15
on the boundary charts; they agree on overlaps and are compatible with the `o`-action and with changes
of polarization. At the toric boundary the semi-abelian Verschiebung is used, not a truncated
Barsotti–Tate group of height `2g` ([BHW], §5.2 and the proof of Lemma 5.12, pp. 1746–1748, and §7.1,
pp. 1759–1760). *Needs:* C4.15, C6.27, C6.43; HilbertModularVarietiesAndShimuraCurves H2.7, H3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.21.

**Checks.**

- The differential bundle has `O`-rank `g` and its determinant line has `O`-rank one; the
  Verschiebung determinant is a section of `ω^{⊗(p−1)}`, including at `p = 2`.

### C6.45 The boundary is ordinary

Prove `HilbertModular.boundary_ordinary`: the Hasse ideal is the unit ideal on the formal boundary, so
every cusp lies in the ordinary neighbourhood `ε = 0`, for every prime allowed in C6.43. On a split torus
the Verschiebung is the identity (C4.15, C4.18); descend from the splitting cyclotomic cover ([BHW],
proof of Lemma 5.12, p. 1748). *Needs:* C4.15, C6.26, C6.44; HilbertModularVarietiesAndShimuraCurves H2;
SchemeAndStackFoundations Layer 1.

**Checks.**

- The boundary lies in the Rapoport locus although the special fibre need not be smooth.

### C6.46 Hasse neighbourhoods

Prove `HilbertModular.nearOrdinary_compare`: for `0 ≤ ε < 1` with `|p|^ε` in the value group of the
coefficient field, the normalized admissible blow-up of HilbertModularVarietiesAndShimuraCurves H2.8 for
`|Ha| ≥ |p|^ε` on the compactified model has generic fibre the space `X^*(ε)` of Birkbeck–Heuer–Williams;
locally, before normalization, it is the `p`-torsion-free quotient of `R⟨T⟩/(T·Ha_lift − p^ε)`, and it
contains the whole boundary. If two lifts differ by an element of `pR` and `ε < 1`, they define the same
condition by the ultrametric inequality ([BHW], §5.2, pp. 1746–1748, and §2.1, pp. 1720–1721). Radii of
canonical subgroups belong to the roadmaps that build on this one. *Needs:* C6.43, C6.44, C6.45;
HilbertModularVarietiesAndShimuraCurves H2; AdicSpacesPartIII F0, §R2.10 (fractional-valuation-bound), §R2.10 (hasse-domain).

**Checks.**

- At `ε = 1`, `Ha = 0` and `Ha′ = p` can define different conditions.

### C6.47 Polarization quotients of ordinary neighbourhoods

Prove `HilbertModular.nearOrdinary_quotient`: the tame group `Δ(N)` preserves the Hasse condition.
Globally retain the quotient stack of the level-`G^*` ordinary neighbourhood; the level-`G`
coarse neighbourhood is its coarse quotient. At `Γ_0(p^n)` subgroup level the square over the
quotient stack without `p`-level is 2-Cartesian. On coarse spaces restrict over the supplier's
`X^free/Δ(N)`: there the square is Cartesian and the horizontal maps are finite étale
`Δ(N)`-torsors, also after restriction to each invariant Hasse domain. The underlying `o`-abelian
scheme and Hasse ideal are preserved by polarization scaling; being ordinary imposes no freeness
condition on this scaling action. Consume HilbertModularVarietiesAndShimuraCurves H3.6/H4.8–H4.9
(`HilbertIntegralGamma0`, `gamma0Cartesian`) with precisely these stack and free-locus scopes.
Prove compatibility with the compactified Hasse domains and the toroidal/minimal quotient maps of
C6.22/C6.33, retaining stabilizers on the stacks. A compactified coarse torsor assertion also
requires the action to be free there ([BHW], Proposition 8.4 and Lemma 8.5, pp. 1766–1767,
with the quotient-stack and free-locus contracts of H3.6/H4.9).
*Needs:* C6.22, C6.33, C6.46; HilbertModularVarietiesAndShimuraCurves H3, H4.8–H4.9;
SchemeAndStackFoundations Layer 1.

**Checks.**

- For full `p`-level `G^*`, positive units need not preserve the Weil-pairing condition.
- For `F = ℚ` the polarization group is trivial; the stack square and its restriction to a Hasse
  domain recover the fine elliptic square, with ordinary subgroup `μ_{p^n}`.
- For the H3.3 example `F = ℚ(√3)`, `N = 7`, `A = E²`, `E : y² = x³ − x`, use
  `S = [[1,1+i],[1−i,−1]]`, `ι(√3) = S`, `u = 7+4√3`, `η = u² = 97+56√3`, and
  `f = i(7I+4S)`. Then `f†f = ι(η)` and an `O_F/7`-line marking in the `+1` eigenspace of
  `f mod 7` is fixed, although `η ≡ −1 mod 7` gives a nontrivial class in `Δ(7)`.
  At `p = 5`, `#E(𝔽₅) = 8` and `a₅ = −2`, so this fixed point is ordinary. After a finite
  extension of `ℚ₅` all the tame data exist and `f` preserves the canonical `Γ₀(5^n)` subgroup.
  Thus even the `ε = 0` interior domain need not be free; `7 ∤ disc(F) = 12`.
- Minimal cusps can also have stabilizers; both interior and boundary comparisons retain their
  quotient stacks outside the free locus.

### C6.48 Finite-level maps at the boundary

Prove `HilbertModular.levelMap_extend`: the forgetful maps and the finite effective level and
polarization maps of HilbertModularVarietiesAndShimuraCurves H4 extend to the minimal
compactifications of the generic fibres (or the stated finite normalizations), and to toroidal
compactifications after choosing fans compatible with the induced lattice maps (C0.14, C3.2). The
extension is finite when the source fan is the pullback fan (C0.20); further subdivisions give
proper, nonfinite maps. The maps agree on completed cusp data (lattice inclusions, action on roots
of unity, determinant pairing). The full-level comparison goes through the mixed level problem of
H4; it is not the quotient of `X_{Γ^*(p^n)}` by all positive units. Integral models at wild level
are only those given by H2–H4 together with finite relative normalization in the higher-level
function field, as in C5.19 ([BHW], §5.1.1–5.1.2 and §§8.2–8.4, pp. 1741–1745 and 1768–1779). The
C4.10 comparison is used only on the generic fibre, where its good-prime base conditions hold.
*Needs:* C0.8, C0.14, C0.20, C3.2, C3.4, C4.10, C6.23, C6.36;
HilbertModularVarietiesAndShimuraCurves H2, H3, H4.4, H4.11, H4.13; SchemeAndStackFoundations Layer
4.

**Checks.**

- The map from full level `G^*` to full level `G` is not surjective in general (BHW §8.2).
- Finite effective groups at fixed `n` are not the profinite group `Δ(p^∞N)`.
- A proper subdivision of a compatible fan gives a nonfinite toroidal map.

### C6.49 The natural integral lattice of differentials

Prove `HilbertModular.integralDifferentials_compare`: the natural integral conormal lattice of the
ordinary toroidal model pulls back at the finite levels of H4 to the sheaf `ω^+` of
Birkbeck–Heuer–Williams §7.1. Take the conormal of the formal semi-abelian family and compare formal and
generic fibres (AdicSpacesPartIII §R2.8 (formal-completion-and-algebraic-comparison), §R3.7 (gaga-comparison-map)); finite-level pullback is compatible with moduli
([BHW], §7.1, Definition 7.3 and Proposition 7.4, pp. 1759–1760). The modified lattice used for
canonical subgroups is a different sheaf, constructed where canonical subgroups are; rank one over
`o ⊗ O^+` holds on the Rapoport locus. *Needs:* C6.27, C6.46, C6.48; HilbertModularVarietiesAndShimuraCurves
H2, H4; AdicSpacesPartIII F0, §R2.8 (formal-completion-and-algebraic-comparison), §R3.7 (gaga-comparison-map).

**Checks.**

- At ramified primes the natural lattice can differ from the modified one.
- No canonical subgroup or Igusa torsor is constructed here.

### C6.50 Degree one: modular curves

Prove `HilbertModular.degreeOne_compare`: for `F = ℚ`, with the same principal polarization, tame and
`p`-level data and bases, the generic fibres of the toroidal and minimal compactifications are
canonically the compactified coarse modular curves of ModularCurvesPartII 5.2 and 5.13, compatibly with
the moduli identification on the open part and with cusps. Normal proper completions of the same dense
open curve are uniquely isomorphic, and a proper birational map of normal curves is an isomorphism. Full
level keeps its cyclotomic field of components. At `Γ₁(4)` this identifies the coarse `X₁(4)`;
the universal semi-abelian family and its Hodge bundle remain on the compactified stack at the
irregular cusp (ModularCurvesPartII §§3.5, 4.8). Koecher fails in degree one ([BHW], §2.1,
pp. 1720–1721). *Needs:* C4.12; HilbertModularVarietiesAndShimuraCurves H1, H4, H5.1;
ModularCurvesPartII 5.2, 5.13; SchemeAndStackFoundations Layer 0.

**Checks.**

- For `g = 1` a form can have a pole at a cusp.
- Composite and full levels use ModularCurvesPartII 5.2.
- At `Γ₁(4)`, the coarse curve comparison preserves the cusp `1/2` without asserting descent
  of its stack-valued universal family.

### C6.51 Cusp parameters of modular curves

Prove `HilbertModular.degreeOne_cuspParameter`: under C6.50, the Tate family (C4.12), cusp fields
and formal parameter agree with ModularCurvesPartII 3.6 and 4.8: at a cusp of width `w`,
`j = q_Tate⁻¹ + 744 + ⋯` and `q_Tate = t^w` in the cusp parameter `t`; analytification and the level and
degeneracy maps of ModularCurvesPartII 9.1 commute with this. The character inclusion at the cusp
has index `w`, computed from C6.20 and the finite lattice map C0.20. At the level of stacks inertia
is kept; on coarse spaces the width is kept. *Needs:* C0.20, C4.12, C6.20, C6.50;
ModularCurvesPartII 3.6, 4.8, 9.1; AdicSpacesPartIII F0, R2.

**Checks.**

- For `w > 1` the coarse parameter `t` is not the Tate parameter.
- A map of coarse spaces does not replace a correspondence of stacks.
- At infinity for full level `N ≥ 3`, `w = N` and `q_Tate = t^N` over the fixed-pairing
  cyclotomic cusp base, with no `−1` inertia.

### C6.52 Comparison with the prime-level diamond quotients of ModularCurves

Prove `HilbertModular.degreeOne_primeDiamond`: for a prime `N ≥ 5` and `H ≤ (ℤ/N)^×/{±1}`, the
compactification of C6.50 for the corresponding diamond quotient agrees with the curve `X_H` of
ModularCurves Layer 10, identifying the affine open, the cusp divisor and the normalization over the
`j`-line, through the agreement in ModularCurvesPartII (its import of ModularCurves Layer 10). Only this
class of levels is covered. *Needs:* C6.50; ModularCurvesPartII 3.11, 5.2; ModularCurves Layer 10.

**Checks.**

- General full or composite levels and arbitrary subgroups of `GL_2` are not covered.

### C6.53 Global functions on the boundary

Prove `HilbertModular.boundary_globalFunctions`: for the fine toroidal contraction over `B`, with `C` the
finite étale minimal cusp scheme and `D` the scheme-theoretic toroidal boundary, `f : D → C` is proper,
flat and of finite presentation with geometrically reduced and geometrically connected fibres, and
`O_C → f_*O_D` is an isomorphism compatible with every base change on `C`, including nonreduced
coefficients. Flatness and geometric reducedness come from the monomial basis of the boundary quotient
(C0.18) on the étale charts (C6.24), connectedness of fibres from C6.35, properness from the contraction;
the conclusion is the universal statement for proper flat morphisms of finite presentation with
geometrically reduced and connected fibres (Stacks, Lemma 36.32.6, Tag 0E0L), proved here as part of the
target from cohomology and base change ([Dimitrov], Corollaire 7.4, p. 544, and Théorème 8.6(iv)–(v),
pp. 548–549).

The general scheme theorem is stated in `Suggested.lean` as
`proper_flat_globalFunctions_baseChange`: the canonical map on functions is bijective on every
open after every base change, with no reducedness hypothesis on the base.
*Needs:* C0.18, C6.24, C6.34, C6.35; SchemeAndStackFoundations Layer 0, Layer 2;
AdicSpacesPartIII F0.

**Checks.**

- Over a field a geometrically connected, geometrically reduced proper fibre has only constant
  global functions; connected and reduced alone would allow `Spec ℂ → Spec ℝ`.
- Over `ℤ/4`, `f_*O_D` keeps the nilpotent `2`.
- Geometric connectedness without reducedness is not enough: an infinitesimal thickening of a point has
  extra global functions.

### C6.54 The stabilizer of a Hilbert cusp

Prove `HilbertCusp.stabilizer_exact` (suggested home `TauCeti/Geometry/Shimura/Hilbert/Cusp`): for
an `(R, n)`-cusp given by `γ` (C6.13), its automorphism group is `γ⁻¹Γγ ∩ B_ℚ`, and there is an
exact sequence `0 → X^* → γ⁻¹Γγ ∩ B_ℚ → o_C^× → 1`, `X = cbb′`, where `o_C^×` consists of the pairs
`(u, ε)`, `u ∈ o^×`, `ε` a totally positive unit, with `u − 1 ∈ n b′b⁻¹` and `uε − 1 ∈ b b′⁻¹`; the
subgroup with `ε = 1` is `o_{C,1}^× = {u ∈ o^× : u ∈ (1 + bb′⁻¹) ∩ (1 + n b′b⁻¹)}`, of finite index
in `o^×`. Put `a_g = u²ε`. Conjugation acts on the unipotent lattice `X^*` by `a_g`.
The linear toric map `T_σ → T_{a_gσ}` pulls `q^ξ` back to `q^{a_gξ}`; the contragredient left
action on characters is `ξ ↦ a_g⁻¹ξ`, paired with `v ↦ a_gv`.

For a lift `g = [[uε,b_g],[0,u⁻¹]]` in the full cusp stabilizer, record the translation class
`τ_g = u b_g mod X^*` in `(ab)^*/X^*`, where `a,b` in `ab` are the cusp ideals of C6.13.
Its affine action is `z ↦ a_gz + τ_g`. On the cyclotomic cone algebra its full pullback is
`g^*(q^ξ) = φ_g(ξ) q^{a_gξ}`, with `φ_g(ξ) = ζ_e^{e·Tr(ξτ_g)}` from C6.19. Changing the lift
by the translation kernel changes `τ_g` by `X^*`, so the phase is unchanged. For lifts over a fixed
cyclotomic base prove `τ_{gh} = τ_g + a_gτ_h mod X^*` and
`φ_{gh}(ξ) = φ_g(ξ) φ_h(a_gξ)` for the left affine composition `gh = g ∘ h`. Pullback composes
in the reverse order. For general cyclotomic transitions write
`g^*(r q^ξ) = σ_g(r)φ_g(ξ)q^{a_gξ}` and prove the twisted composition law
`σ_{gh} = σ_h ∘ σ_g`, `φ_{gh}(ξ) = σ_h(φ_g(ξ))φ_h(a_gξ)`.
For an integral weight `κ`, take a coefficient ring containing its character values, the square
roots required for polarization descent and `ζ_e`. With a fixed cyclotomic trivialization the
coefficient relation is `a_{u²εξ} = ε^{κ/2}u^κ φ_g(ξ) a_ξ`, using the weight-line convention of
equation (5).
The action on roots of unity factors through `H_C ⊇ H_{C,1}` and is recorded separately from this
translation phase and the weight character. The full stabilizer is not its finite cyclotomic image.
At neat tame level the effective boundary action is free, while minimal cusps may have stabilizers. At general (C6-a)
levels retain residual inertia on the compactified stack, including the irregular `Γ₁(4)` cusp
of C6.26 ([Dimitrov], Proposition
3.3(iv)–(v), pp. 533–534, Proposition 4.1(ii)–(iii), p. 537, and the coefficient relation
following equation (5), p. 546). The API includes the lift's translation class, its cocycle,
lift-independent full pullback, and coefficient covariance. In particular, the phase characters
satisfy `φ_{x+ay}(ξ) = φ_x(ξ)φ_y(aξ)` when `nB ⊆ A`, `x,y ∈ traceDual(A)` and `aB ⊆ B`.
*Needs:* C6.12a, C6.13, C6.19;
HilbertModularVarietiesAndShimuraCurves H1.9 (scalar-level laws), H3 (the group `Δ(N)`); Mathlib
`NumberField.Units.dirichletUnitTheorem.exists_unit`.

**Checks.**

- For `F = ℚ`, `o^× = {±1}` and the only totally positive unit is `1`, so `o_C^×` has at most two
  elements, and `u = −1` acts trivially on the cone since `u² = 1`.
- At the irregular `Γ₁(4)` cusp `1/2`, let `T = [[1,1],[0,1]]`, `s = [[1,0],[2,1]]` and
  `γ = −sTs⁻¹ = [[1,−1],[4,−3]]`. Then `s⁻¹γs = −T`, so `u = −1`, `ε = 1`, `a_g = 1`
  and `τ_g = 1 mod 2ℤ`. On `t = q^{1/2}` the phase is `−1`, although the cone action and
  the cyclotomic automorphism group at `e = 2` are trivial.
- Conjugating `[[1,1],[0,1]]` by `diag(2,1/2)` gives `[[1,4],[0,1]]`: the multiplier on the
  unipotent coordinate is `4`. The corresponding toric power map pulls `q` back to `q⁴`, whereas
  the dual left action on the rational character space multiplies by `1/4`.
- `o_{C,1}^×` has finite index in `o^×`, by the finiteness of `(o/m)^×` for the ideal `m` cut out by the
  congruences.
- Over `ℤ/9`, the phase at `ξ = 1/2`, `e = 2`, `τ_g = 1`, `ζ_e = −1` is still `−1 ≠ 1`.
  Composition uses the phase cocycle; changing lifts by `X^*` does not change it, also when a
  root of unity specializes to smaller order.

### C6.55 Formal gluing along a boundary (Rapoport–Dimitrov)

Prove `FormalGluing.effective` (suggested home `TauCeti/AlgebraicGeometry/FormalGluing`): let `S` be
an affine scheme of finite type over a field or an excellent Dedekind ring, `X` a separated formal
algebraic space of finite type over `S` with an affine atlas `Spf A_2 ⇒ Spf A_1 → X`, and `Y°` an
algebraic space of finite type over `S` with a map `f° : (Spec A_1)° → Y°` from the complement of
the closed fibre (`Spec A_1` with its ideal of definition), equalizing the two arrows obtained from
the atlas by algebraization of formal maps (Lemme 5.8, EGA III 5; AdicSpacesPartIII §F0.8
(completion on relative morphisms and grothendieck-algebraization)). Assume: `(Spec A_1)°` is
schematically dense in `Spec A_1`; `Y°` admits an open immersion into an algebraic space proper over
`S`, fixed as `Y*`. Define `Y°(K)_permis` by requiring that the unique extension of a `K`-point to
`Spec V → Y*` specializes to `Y* ∖ Y°`. For a thickening `(R,R^{(0)})`, `R` is local Artinian with
residue `K`, and `R^{(0)}` is a Noetherian subring surjecting onto `V` with generic localization `R`
(Dimitrov, Définition 5.3). Put `J = ker(R^{(0)} → V)`, choose a lift `π̃` of a uniformizer, and set
`R^{(i)} = R^{(0)}[J/π̃^i]`. A permitted `Spec R → Y°` extends to the boundary completion of `Y*`
over `Spf R^{(i)}` for some `i`, as in Remarque 5.7; permitted maps to the affine charts are defined
in the same way using `Spf A_j`. Require that `f°` is permitted (it sends the boundary to the
boundary: for every permitted point `Spec K → (Spec A_1)°` coming from a formal map
`Spf V → Spf A_1` of finite type, the extension to `Spec V` of the composite to a proper compactification sends
the closed point outside `Y°`); and for every complete discrete valuation ring `V` with fraction
field `K`: (i) the sequence of permitted `K`-points
`(Spec A_2)°(K)_permis ⇒ (Spec A_1)°(K)_permis → Y°(K)_permis` is exact, and (ii) for every thickening
`(R, R^{(0)})` of `(K, V)`, every permitted
`Spec K → (Spec A_1)°` with a permitted map `Spec R → Y°` extending its composite lifts uniquely to
a permitted `Spec R → (Spec A_1)°`. Then there are an algebraic space `Y` of finite type over `S`,
an open immersion `Y° ⊆ Y` and an isomorphism of `X` with the completion of `Y` along `Y ∖ Y°`
inducing `f°`; the triple is unique up to unique isomorphism. Rapoport's proof algebraizes the
formal modification of a compactification of `Y°` along its boundary ([Dimitrov], Lemme 5.8,
Définitions 5.9–5.10 and Théorème 5.11, pp. 539–540; M. Rapoport, *Compactifications de l'espace de
modules de Hilbert–Blumenthal*, Compositio Math. 36 (1978), Théorème 3.5). *Needs:*
AdicSpacesPartIII §F0.7 (grothendieck-existence), §F0.8 (completion on relative morphisms), §F0.8
(grothendieck-algebraization); SchemeAndStackFoundations Layer 1 (algebraic spaces), Layer 4 (formal
completion); AlgebraicModuliForArithmeticGeometry Layer 6.

**Checks.**

- For full level `N ≥ 3`, glue the cusp charts `Spf ℤ[1/N,ζ_N][[t]]` to the corresponding
  fixed-pairing `Y(N)`. At infinity `q_Tate = t^N`; use each cusp's residue field and width.
  Full-level charts have trivial inertia.
- A constant good-reduction elliptic curve over `k[[t]]`, with compatible tame level, defines a
  `k((t))`-point of `Y(N)` whose specialization stays in `Y(N)`. It is not in `Y°(K)_permis`.
- Without schematic density (an embedded component on the boundary chart) the gluing is not unique.
- If `f°` is not permitted (it sends a boundary point into `Y°`), no compactification with the given
  completion exists.

### Examples

- `F = ℚ(√5)`, level `n = 4`: the cusp units `o_{C,1}^×` have finite index in `o^× = ±ε^ℤ`, the cone at a
  cusp is the totally positive quadrant of `X^* ⊗ ℝ ≅ ℝ²`, an admissible fan has infinitely many cones
  and finitely many orbits, and Koecher holds.
- The phase character over `ℚ` with `A = ℤ`, `B = ⅓ℤ`, `n = 3`, `x = 1` sends `⅓` to `ζ_3`.
- Over `ℤ/4` the unit `3` fixes the coefficient `2`, so the constant-term vanishing argument needs an
  injective multiplier.

### Dependencies

Layers C0–C5 (C5.32–C5.33); HilbertModularVarietiesAndShimuraCurves H1–H5; NeronModelsAndSemistableAbelianVarieties
3.10, 3.13, 3.14; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.21; ModularCurvesPartII 3.6, 3.11,
4.8, 5.2, 5.13, 9.1; ModularCurves Layer 10; AdicSpacesPartIII F0, R2, R3;
AlgebraicModuliForArithmeticGeometry Layer 6; SchemeAndStackFoundations Layer 0, Layer 1, Layer 2 and Layer 4;
Mathlib's units of number fields and trace duals; Tau Ceti's total positivity.

## Worked examples

- **Modular curves.** For `Γ(N)`, `N ≥ 3`, each cusp has a rank-one lattice and the cone `ℝ_{≥0}`; the
  toroidal and minimal compactifications coincide with the compactified modular curve over `ℤ[1/N]`
  (C5.16, C6.50); the completion at a cusp of width `w` is `ℤ[1/N, ζ_N][[t]]` with `t^w = q`, the Tate
  curve has `du/u`, `ω^{⊗2} ≅ Ω¹(log cusps)` (C4.13), the Hasse invariant is a unit at the cusps (C4.15),
  and the `q`-expansion of a section is its Fourier–Jacobi expansion (C5.15). Koecher fails: `1/Δ`-type
  poles are not excluded in dimension one.
- **Siegel genus two.** The Klingen cusp has `dim U_1 = 1`, an elliptic abelian part and a rank-one cone;
  the Siegel cusp has a three-dimensional torus embedding from `dim U_1 = 3`, while the
  semi-abelian family has toric rank `2`. Its cone is that of positive definite binary quadratic forms, with
  infinitely many cones in any admissible decomposition and finitely many `GL_2(ℤ)`-orbits. The
  integral toroidal model at good primes is smooth with normal-crossings boundary,
  `Sym² E ≅ Ω¹(log D)` and `ω_X = (det E)^{⊗3}(−D)` (C5.12, C5.29), and the minimal boundary is a curve
  plus points (C5.25 with `d = 1`).
- **Hilbert modular surfaces.** For `F = ℚ(√5)` and tame level `n = 4`: the cusp lattice is `X = cbb′`,
  the cone is the totally positive quadrant, units of `o_{C,1}^×` act by `u²`, so a fan has infinitely
  many cones and finitely many orbits; Koecher holds (C6.11) because a nonzero, not totally positive
  `ξ` has `u²ξ` with arbitrarily negative trace (C6.3); the minimal cusps are finite étale over `B`
  (C6.34), and at `p = 5` (ramified) the model is the Deligne–Pappas model with ordinary boundary
  (C6.43–C6.45).
- **Coefficient tests.** Over `ℤ/4`: the face projection keeps `2` (C0.1); the boundary quotient keeps
  `2` (C0.18); the unit `3 ≠ 1` fixes `2`, so constant terms need an injective multiplier (C6.8); and the
  nonflat inclusion `ℤ/4 ⊆ (ℤ/4)[t]/(2t)` is allowed in coefficient descent (C6.41).

## Downstream consumers

- **AutomorphicBundles** builds on the compactifications constructed here. Its coefficient bundles use
  the Hodge bundle of C4.1. Its canonical extensions satisfy `f^*E^can = E′^can` under refinement
  (B3.5), so C3.9 supplies their cohomology comparison in every degree. Its B3.10 verifies the
  formally canonical condition of C5.21 for its good-prime PEL automorphic coefficients. Its
  Fourier–Jacobi expansions use the scalar expansions of C5.15 and component detection of C5.10;
  its Hilbert comparisons use C6.23, C6.36 and C6.40. Canonical and subcanonical extensions are
  constructed in that roadmap; they are not inputs to the constructions here.
- **HodgeTateAndCanonicalSubgroups**: boundary Hasse determinant (C4.15), ordinary Hilbert boundary and
  Hasse neighbourhoods (C6.43–C6.49).
- **PerfectoidShimuraVarieties**, **IgusaVarietiesAndTorsionConcentration** and the higher Hida theory
  roadmaps: integral toroidal models and their completed refinement comparisons (C3.10, C5.3–C5.5,
  C5.19–C5.22).
- **AutomorphicGaloisRepresentationsPartII** and the étale-cohomology roadmaps: good-reduction geometry
  of Siegel threefolds (C5.30).
- **FaltingsFinitenessAndIsogenyTheorems**: the general PEL ample Hodge line and quasi-projectivity
  of moduli (C5.17–C5.18). The principal Siegel compactifications and Hodge comparisons are supplied
  by ArakelovGeometryAndAbelianHeights §§5.0a–5.0b, with agreement in C4–C5 as specified above.
- Generalized Jacobians and anabelian applications: Tate modules of semi-abelian varieties (C4.14).
- The nonarchimedean development of AnalyticToricGeometry: toric schemes over arbitrary rings (C0.16).

## References

- [Pink] R. Pink, *Arithmetical compactification of mixed Shimura varieties*, Bonner Mathematische
  Schriften 209, 1990; author-hosted dissertation text, https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf.
- [Lan] K.-W. Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, London Mathematical
  Society Monographs 36, Princeton University Press, 2013; author-hosted revision of 14 March 2021,
  https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf.
- [Lan, errata] K.-W. Lan, errata to the above, https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf.
- [Lan17] K.-W. Lan, *Integral models of toroidal compactifications with projective cone decompositions*,
  Int. Math. Res. Not. IMRN 2017; author copy https://www.kwlan.org/articles/cpt-ram-nbl.pdf,
  errata https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf.
- [Lan16] K.-W. Lan, *Compactifications of PEL-type Shimura varieties in ramified characteristics*,
  Forum Math. Sigma 4 (2016), e1; author copy https://www.kwlan.org/articles/cpt-ram-flat.pdf,
  errata https://www.kwlan.org/articles/cpt-ram-flat-err.pdf.
- [LanHK] K.-W. Lan, *Higher Koecher's principle*, Math. Res. Lett. 23 (2016), 163–199;
  author copy https://www.kwlan.org/articles/Koecher.pdf (author-copy pagination used here).
- [FC] G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Ergebnisse der Mathematik und ihrer
  Grenzgebiete (3) 22, Springer, 1990.
- [Dimitrov] M. Dimitrov, *Compactifications arithmétiques des variétés de Hilbert et formes modulaires de
  Hilbert pour Γ₁(c, n)*, in *Geometric Aspects of Dwork Theory*, de Gruyter, 2004; author copy
  https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf (printed pp. 525–551, the pagination
  used here); arXiv:math/0212071.
- [DT] M. Dimitrov and J. Tilouine, *Variétés et formes modulaires de Hilbert arithmétiques pour Γ₁(c, n)*,
  in *Geometric Aspects of Dwork Theory*, de Gruyter, 2004; author copy
  https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf (printed pp. 553–610).
- [BHW] C. Birkbeck, B. Heuer and C. Williams, *Overconvergent Hilbert modular forms via perfectoid modular
  varieties*, Ann. Inst. Fourier 73 (2023), no. 4, 1709–1794.
- [BPS] S. Bijakowski, V. Pilloni and B. Stroh, *Classicité de formes modulaires surconvergentes*, Ann. of
  Math. 183 (2016), 975–1014.
- [BP] G. Boxer and V. Pilloni, *Higher Hida theory for Siegel modular forms*, author copy,
  https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf.
- [Pilloni20] V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke
  Math. J. 169 (2020); author copy https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf.
- [Pilloni12] V. Pilloni, *Sur la théorie de Hida pour le groupe `GSp_{2g}`*, Bull. Soc. Math. France 140
  (2012), 335–400.
- [CG] F. Calegari and D. Geraghty, *Minimal modularity lifting for non-regular symplectic
  representations*, Duke Math. J. 169 (2020), 801–896; author copy https://math.uchicago.edu/~fcale/papers/Siegel.pdf.
- [BCGP21] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are
  potentially modular*, Publ. Math. IHÉS 134 (2021); arXiv:1812.09269v3.
- [BCGP25] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity of abelian surfaces*,
  arXiv:2502.20645v1.
- [Yuan] X. Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, Ann. of Math. 203 (2026),
  15–119; author copy https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf.
- [Bresciani] G. Bresciani, *On the birational section conjecture with strong birationality assumptions*,
  Invent. Math. 235 (2024), 129–150.
- [FKW] B. Farb, M. Kisin and J. Wolfson, *Essential dimension via prismatic cohomology*, arXiv:2110.05534v2.
- M. Rapoport, *Compactifications de l'espace de modules de Hilbert–Blumenthal*, Compositio Math. 36
  (1978), 255–335.
- L. Moret-Bailly, *Pinceaux de variétés abéliennes*, Astérisque 129, 1985.
- A. Ash, D. Mumford, M. Rapoport and Y.-S. Tai, *Smooth Compactifications of Locally Symmetric
  Varieties*, Math. Sci. Press, 1975; second edition, Cambridge, 2010.
- SGA 1 (A. Grothendieck, *Revêtements étales et groupe fondamental*), Exposés VIII and XII; SGA 3
  (M. Demazure and A. Grothendieck, *Schémas en groupes*), Exposés I and VII_A, revised edition at
  https://webusers.imj-prg.fr/~patrick.polo/SGA3/ (re-edition pagination used here); EGA IV₂, §5.
- [Stacks] The Stacks Project, Tags 0CBN (normal crossings divisors), 0A18 (Stein factorization for
  algebraic spaces), 0E0L (Lemma 36.32.6: global functions of proper flat families).
