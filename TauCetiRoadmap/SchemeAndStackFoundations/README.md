# Roadmap: scheme, stack, cohomology and intersection foundations

This roadmap builds the general algebraic geometry that the arithmetic roadmaps of Tau Ceti stand
on and that neither Mathlib nor another Tau Ceti roadmap owns. From Mathlib's `AlgebraicGeometry.Scheme`,
its morphism classes and its big and small sites, and from the Tau Ceti library's quasi-coherent
algebras, line-bundle classes, divisors and models of curves, it builds six layers: the
scheme-theoretic base (relative Proj, extension of coherent sheaves, the local structure of morphisms
locally of finite type, henselization of pairs, excellent rings, perfect schemes, ideal sheaves);
descent, algebraic spaces, torsors, quotients and algebraic stacks; sheaf cohomology on sites with
the comparison of the Zariski, Nisnevich, étale, fppf and pro-étale topologies, coherent Grothendieck
duality, Brauer groups and equivariant cohomology; the curve, divisor and Picard theory that glues the
existing curve roadmaps together; infinitesimal deformations, formal schemes and algebraization,
modifications, the moduli stack of stable pointed curves and de Jong's alterations; and Chow groups
with Chern classes, intersection products, Riemann–Roch and the Hodge index theorem. Its end theorems
are the henselization of a pair with its universal property (Layer 0), Artin's bootstrap theorem and
the Keel–Mori theorem (Layer 1), coherent Grothendieck duality and the Brauer class of an Azumaya
algebra (Layer 2), the Picard torsors of a curve without a rational point (Layer 3), Schlessinger's
theorem, Grothendieck's existence and algebraization theorems and de Jong's alteration theorems
(Layer 4), and Grothendieck–Riemann–Roch, the Hodge index theorem and the Weil bound for curves over
finite fields (Layer 5). Every object is defined on Mathlib's `Scheme`; every theorem names its
hypotheses.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-schemes-and-morphisms) | Schemes and morphisms | direct-image algebras and relative Proj, coherent extension and Hartogs, dimension theory and limits, henselization of pairs, catenary, Cohen–Macaulay, Nagata and excellent rings, perfect schemes and universal homeomorphisms, ideal-sheaf comparisons |
| [1](#layer-1-descent-algebraic-spaces-and-stacks) | Descent, algebraic spaces and stacks | fpqc/fppf descent, algebraic spaces, group spaces, groupoids, torsors and quotients, algebraic and Deligne–Mumford stacks, moduli spaces, Galois gerbs |
| [2](#layer-2-sites-and-scheme-cohomology) | Sites and scheme cohomology | site cohomology and torsors, quasi-coherent cohomology and supports, topology comparisons, the Nisnevich site, pro-étale site foundations, coherent duality, Brauer groups, equivariant cohomology |
| [3](#layer-3-curves-divisors-and-picard-objects) | Curves, divisors and Picard objects | genus checks, degrees and duality for vector bundles on curves, Picard groups, groupoids, norms and torsors, Picard stacks and Abel maps |
| [4](#layer-4-deformations-formal-schemes-models-and-alterations) | Deformations, formal schemes, models and alterations | thickenings and lifting, deformation functors, hulls and obstruction theories, adic thickening systems and algebraization, modifications and strict transforms, stable pointed curves, alterations |
| 5 | Intersection theory and Riemann–Roch | Chow groups, pushforward and pullback, Chern classes, Gysin maps and intersection products, K-theoretic pushforward and Riemann–Roch, surfaces and the Weil bound |

```text
Mathlib schemes, Tau Ceti curves and models  →  Layer 0  →  Layer 1  →  Layer 2  →  Layer 3  →  Layer 4
                                                   Layer 2 (coherent duality), Layer 3, Layer 4 (blow-ups)  →  Layer 5
```

## Scope and ownership

**This roadmap owns** the shared scheme-, space-, site- and coherent-sheaf foundations: the general
relative Proj and its comparison with the finitely generated case, extension of coherent modules,
henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages, perfect schemes
and perfection, the ideal-sheaf comparison API, algebraic spaces with their small étale sites,
group algebraic spaces, groupoids, torsors and their classes, categorical and geometric quotients,
algebraic stacks, moduli spaces, Galois gerbs, the functoriality of sheaf cohomology on sites, the
comparison of the topologies of a scheme with the coefficient sheaves `𝔾_a`, `𝔾_m`, `μ_n`, the
Nisnevich site, the pro-étale site foundations (replete topoi, w-contractible covers,
left-completeness), coherent Grothendieck duality in the generality of the Stacks Project, the Brauer
group of a scheme, equivariant sheaf cohomology, the curve and Picard theory that no curve roadmap
states, formal deformation theory, adic thickening systems and algebraization, modifications,
strict transforms and alterations, the moduli stack of stable pointed curves, Chow groups,
Chern classes, refined Gysin maps, intersection products, a K-theoretic pushforward for
Riemann–Roch, and surfaces.

**Owned elsewhere and consumed here.** The following objects have one owner; this roadmap states
comparisons to them and never a second carrier.

- *Sheaves of modules, locally free sheaves, tensor, dual, determinant, symmetric and exterior
  powers, quasi-coherent algebras, relative Spec and its anti-equivalence, graded algebras and the
  symmetric algebra*: Tau Ceti `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`,
  `CategoryTheory.CommMon.relativeSpec`, `TauCeti.AlgebraicGeometry.relativeSpec`,
  `SheafOfModules.dual`, `SheafOfModules.monoidalClosed`, and
  [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) Layers L0A–L2B. A finite locally
  free sheaf of rank `r` is Mathlib's `SheafOfModules.IsLocallyFree` together with
  AlgebraicVectorBundles L0B's rank predicate `isFiniteLocallyFreeOfRank`; the degree theory of
  Layer 3 and the Chern classes of Layer 5 are stated on that predicate. AlgebraicVectorBundles
  leaves projective bundles and Chern classes to successors; they are Layer 5 here.
- *Relative Proj of a finitely generated graded quasi-coherent algebra, projective morphisms,
  relative ampleness, the relative dualising sheaf of a proper flat finitely presented Gorenstein
  curve (contract J-B / SR-2), coherent higher direct images and base change on curves, finite
  extensions of discrete valuation rings (`TauCeti.FiniteDVRExtension`), models over a discrete
  valuation ring, nodal local models over a discrete valuation ring, prestable, semistable and
  stable families, blow-ups, admissible blow-ups, strict transforms of closed subschemes along
  blow-ups and intersection numbers on regular arithmetic surfaces, effective étale descent of
  polarised schemes*: [StableReduction](../StableReduction/README.md) Layers 0–4. Layer 0 here
  states relative Proj for an arbitrary graded quasi-coherent algebra with the comparison to
  StableReduction's; Layer 4 states strict transforms along arbitrary modifications with the
  comparison to StableReduction's along blow-ups, and the Noetherian-base nodal local structure with
  the comparison to StableReduction's over a discrete valuation ring.
- *Group objects* (the convention `GrpObj (Over.mk f)` in `Over S`), *finite locally free group
  schemes, finite affine invariant quotients (`TauCeti.AffineInvariantQuotient`), finite étale
  schemes and Galois sets, effective descent of affine schemes and of finite locally free schemes
  along a faithfully flat morphism, polarised descent of projective curves, Weil restriction, the
  relative Grassmannian, strict henselization and the openness of the regular locus of a finite-type
  scheme over an excellent base, the Artinian test algebras `ArtinianTestAlgebra` over `W(k)`,
  coarse schemes of finite quotient problems*: [ModularCurves](../ModularCurves/README.md) Layers
  0B–0G, 4D, 7D and 9D. Group algebraic spaces here are `GrpObj` in `Over h_S`; the comparison
  functor from ModularCurves' group schemes is a target of Layer 1.
- *Invertible sheaves and the Picard group (`TauCeti.AlgebraicGeometry.LineBundleClass`, a
  commutative group), coherent cohomology of a proper curve over a field with the genus,
  Riemann–Roch and Serre duality for line bundles, relative cohomology and base change, the Picard
  functor of a curve with a rational point, the Jacobian, Abel–Jacobi, the Picard–Brauer
  obstruction*: [JacobianChallenge](../JacobianChallenge/README.md) Layers A–F. The theorem on
  formal functions that its Layer C may use is Layer 4 here (one owner).
- *Function fields, places, divisors, `L(D)`, the genus, Riemann–Roch, the different and Hurwitz's
  formula, constant-field extensions, the regular projective model of a function field and the
  anti-equivalence with regular projective curves*: [AlgebraicCurves](../AlgebraicCurves/README.md)
  Layers 0–12. Layer 3 here restates nothing of this; its Riemann–Hurwitz is the scheme form.
- *Brauer groups of fields, crossed products and `Br(K) ≅ H²(G_K, K^{s×})`
  (`TauCeti.brauerCohomologyEquiv`), continuous Galois cohomology, Hilbert 90 for fields and Kummer
  theory*: Tau Ceti, [ClassFieldTheory](../ClassFieldTheory/README.md),
  [ProfiniteCohomology](../ProfiniteCohomology/README.md) and
  [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) Layer 7B.
- *Finite-coefficient étale cohomology, constructible sheaves, roots-of-unity sheaves with `n`
  invertible and Tate twists, proper and smooth base change, Nagata compactification, `Rf_!` and
  compact support, the étale-to-pro-étale morphism of topoi with the finite-torsion comparison,
  lisse and constructible adic systems and the ℓ-adic realization, absolute, relative and `q`-power
  Frobenius with Frobenius twists, topological invariance of the small étale site, the Artin
  comparison, the Lefschetz trace formula, Tate modules of abelian varieties, cycle classes and
  point counts*: the CohomologicalPointCounting family (ConstructibleEtale, EtaleBaseChange,
  CompactSupport, EllAdicRealization, FrobeniusGeometry, ComplexComparison, TraceFormula). The
  boundary is by coefficient: this roadmap owns the sites, the coefficient sheaves `𝔾_a`, `𝔾_m`,
  `μ_n` as sheaves of the scheme, every `𝔾_m`-coefficient theorem (Hilbert 90, the Kummer and
  Artin–Schreier sequences, `𝔾_m` on curves, Tsen, Brauer groups), the Galois, limit,
  Hochschild–Serre, Gabber and hypercovering theorems for arbitrary abelian sheaves, and the
  pro-étale site foundations; that family owns everything with finite or adic coefficients. The
  target-level edges are: EllAdicRealization Layer 3 consumes §2.17's replete-topos and
  w-contractible-cover theorems; its Layers 4–5 consume §2.17's left-completeness; CompactSupport
  Layer 1's Nagata compactification is consumed by §2.19's compactification independence of `f^!`;
  FrobeniusGeometry Layer 1's absolute Frobenius is the Frobenius on which §0.24's perfect schemes
  are defined; FrobeniusGeometry Layer 6 consumes §0.23's universal homeomorphisms; TraceFormula
  Layer 8 consumes §2.16's `𝔾_m`-cohomology of curves and §2.11's Kummer sequence to compute
  `H^i(X_ét, μ_n)` on curves and compares Tate modules with `H¹`; ConstructibleEtale Layer 6's
  roots-of-unity sheaf is compared with §2.9's `μ_n` by §2.9's `mu_eq_cpc`.
- *Néron models, abelian semistable reduction*: NeronModelsAndSemistableAbelianVarieties; *étale
  supports, the étale `f^!`, absolute purity, perverse sheaves*: EtaleDualityAndPerverseSheaves;
  *banded gerbes and their `H²` classification, Picard schemes over general bases,
  characteristic-zero resolution*: AlgebraicModuliForArithmeticGeometry; *the full cotangent
  complex*: DerivedDeRhamCohomology; *Néron–Severi groups*: AbelianSchemesAndArithmeticModuli;
  *perfect-site quotient stacks*: GeometricSatakeAndFusion. These roadmaps import from this one and
  are never cited as inputs.

**Already stated or built elsewhere.** The following are stated by another roadmap or built in the
pinned libraries; each is cited where it lives and is not a target here.

- Quasi-coherent algebras, relative Spec with its universal property, anti-equivalence, pullback and
  base change, symmetric and graded algebras: Tau Ceti `TauCeti.AlgebraicGeometry.RelativeSpec.*`
  (`CategoryTheory.CommMon.relativeSpec`, `relativeSpecToBase`, `isAffineHom_relativeSpecToBase`,
  `isPullback_relativeSpecCover`, `TauCeti.AlgebraicGeometry.relativeSpecAffineIso`) and
  AlgebraicVectorBundles L1A (`pullbackQuasicoherentAlgebra`), L1B (`relativeSpecHomEquiv`,
  `relativeSpecEquiv`, `relativeSpecBaseChangeIso`) and L2A (`GradedQuasicoherentAlgebra`,
  `symmetricAlgebra`, `gradedSymmetricAlgebra`; graded pieces `SheafOfModules.symmetricPower`).
- A connected locally Noetherian scheme with domain stalks is irreducible:
  `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, which with Mathlib's
  `isReduced_of_isReduced_stalk` and `isIntegral_of_irreducibleSpace_of_isReduced` gives the
  integral case.
- The sheaf of homomorphisms and the dual of an `O_X`-module: `SheafOfModules.monoidalClosed`,
  `SheafOfModules.dual`, `SheafOfModules.ihomObjEquiv`, `ihomStalkEquiv`
  (`TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed`, `.InternalHom.Basic`,
  `.FinitePresentation`); quasi-coherence of the internal Hom from a finitely presented source is
  AlgebraicVectorBundles L0B.
- The Jacobson property of finite-type algebras and finiteness of residue fields of closed points:
  Mathlib `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing`,
  `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`, Tau Ceti
  `Scheme.finite_Γevaluation_of_isClosed`.
- Absolute, relative and `q`-power Frobenius, Frobenius twists, the relative Frobenius of étale and
  smooth morphisms, and the topological invariance of the small étale site under universal
  homeomorphisms: FrobeniusGeometry Layers 1–3 and 6.
- The colimit of an `𝔽_p`-algebra along Frobenius: Mathlib `PerfectClosure K p` with
  `PerfectClosure.of`, `PerfectClosure.lift`, its `PerfectRing` instance and `IsPerfectClosure`.
- Effective fpqc descent of affine schemes along one faithfully flat morphism and of finite locally
  free schemes: ModularCurves 0E. Descent of quasi-projective schemes along finite locally free
  coverings with a compatible ample sheaf: StableReduction Layer 2 and ModularCurves 0E.
- Quotients of affine schemes by finite groups with the universal property, integrality and
  surjectivity of the projection and the orbit description of fibres:
  `TauCeti.AffineInvariantQuotient` (`TauCeti.AlgebraicGeometry.Quotient.Affine`,
  `.FiniteGroup.Affine`) and ModularCurves 0C.
- The étale-to-pro-étale morphism of topoi, the Bhatt–Scholze comparison of classical and pro-étale
  cohomology for torsion coefficients, and lisse adic sheaves: EllAdicRealization Layers 1, 3 and 4.
- The cohomological Brauer group of a field as the Brauer group: `TauCeti.brauerCohomologyEquiv`
  (`TauCeti.Algebra.CrossedProduct.Comparison`) and QuadraticFormInvariants Layer 7B; the
  finite-field case `Subsingleton (BrauerGroup k)` is `TauCeti.subsingleton_brauerGroup_of_finite`.
- The nonsingular projective model of a normal curve: AlgebraicCurves 12B–12C. Genus-one curves with
  a degree-one bundle have a rational point:
  `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one`.
  The Picard–Brauer obstruction and its vanishing given a rational point: JacobianChallenge Layer D.
  `Cl⁰(X) ≃ Pic⁰(X)`, `Pic⁰` as degree-zero divisors modulo principal divisors and `Pic(X)/Pic⁰(X) ≅
  ℤ`: `SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`,
  `weightedDegreeZeroQuotientAddEquivPicZero`, `picQuotientPicZeroAddEquivInt`
  (`TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero`); the rational points of the Jacobian as
  degree-zero line bundles given a rational point: StableReduction contract J-D. The Tate module of
  the Jacobian compared with degree-one étale cohomology: TraceFormula Layer 8.
- The relative Grassmannian: ModularCurves 0G. Regularity of stalks of smooth schemes and of
  blow-ups of nodes: `TauCeti.AlgebraicGeometry.isRegularRing_iff_isRegularLocalRing_stalk_Spec`,
  `isRegularLocalRing_stalk_of_smooth`, `TauCeti.NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`.
  Density of the free locus: `Module.dense_interior_freeLocus_of_finiteType`.
- The rank-one and curve cases of degrees and duality: `InvertibleSheaf.eulerDegree`,
  `InvertibleSheaf.eulerCharBelow_eq_relativeDegree_add_one_sub_genus`,
  `InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`,
  `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`,
  `SchemeWeilDivisor.relativeDegree_principalDivisor`, `TauCeti.length_quotient_span_pair_comm`, and
  the Hasse bound for elliptic curves `WeierstrassCurve.hasse_bound`; Layer 3 and Layer 5 state only
  what these do not.
- Pieces that exist and are cited inside a kept target: ModularCurves 7D's `ArtinianTestAlgebra` is
  the case `Λ = W(k)` of §4.2; Mathlib's `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv` is
  the affine case of §0.27; Mathlib's `Functor.relativelyRepresentable.of_diag`, `diag_iff`,
  `respectsIso`, `MorphismProperty.relative.rep`, `relative_map_iff` and
  `GroupExtension.rightHom_inl` are helper lemmas of §1.3 and §1.25;
  `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` and
  `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` are helper lemmas of §2.5.

**Interfaces consumed by the arithmetic roadmaps.** The crystalline, prismatic, analytic and ℓ-adic
roadmaps consume this roadmap through comparison maps whose theorems they own; this roadmap fixes only
its side of each interface. (i) Cohomology is Mathlib's `Sheaf.H` on the named site; the pro-étale
ℓ-adic coefficient is `Scheme.ellAdicSheaf`, not a discrete constant sheaf; `Br′(X)` is the torsion of
`H²_ét(X, 𝔾_m)`, distinct from the Azumaya Brauer group until §2.22's comparison applies
(Bhatt–Scholze 2014, Def. 6.8.1, Lemma 6.8.2). (ii) Over `ℂ`, algebraic de Rham to Betti cohomology
(Grothendieck 1966, Thm. 1′) and finite-coefficient étale to Betti cohomology with its relative form
(SGA 4 XVI, Thm. 4.1) are taken on Layer 2's sites; over `ℝ` the Galois-equivariant Betti groups carry
the sign twist (Benoist–Wittenberg 2020, §1.1; Benoist 2019, (1.1) and (2.16)). (iii) Let `A` be an adic space, `S` a scheme and
`A → S` a morphism of locally ringed spaces. For schemes `X, Y` locally of finite type over `S`,
a proper `S`-morphism `f : X → Y`, a torsion ring `Λ` and `K ∈ D⁺(X_ét, Λ)`, form
`X^ad = X ×_S A`, `Y^ad = Y ×_S A` with site maps `φ_X, φ_Y`. The canonical map
`φ_Y^* Rf_* K → Rf^ad_* φ_X^* K` is an isomorphism (R. Huber, *Étale Cohomology of Rigid Analytic
Varieties and Adic Spaces*, setup 3.7.1, p. 225, Theorem 3.7.2, p. 226). This proper comparison
allows arbitrary torsion coefficients, including residue-characteristic torsion; the bounded-below
condition on `K` is part of the statement. The scheme–adic fibre products and site maps belong to
the analytic roadmap, so this is a README-only interface here. Comparisons with diamonds in
characteristic `p` are separate (Scholze 2017, §§26–27). (iv) `R lim_n RΓ_ét(X, ℤ/ℓⁿ)` with its Galois action is compared
with pro-étale `ℤ_ℓ`-cohomology by derived completeness, and `lim H^q` replaces `H^q R lim` only under a
stated `lim¹` vanishing (Bhatt–Scholze 2014, Def. 3.4.1, Prop. 3.4.2, Cor. 5.1.6). (v) Prismatic,
crystalline and `A_inf` specializations (Bhatt–Scholze 2022, Thm. 1.8; Bhatt–Morrow–Scholze 2018,
Thms. 14.3–14.5) and the `B_dR` comparison with its trace-normalized period line (Betts–Stix,
Props. 3.19–3.21) are consumed with derived tensor products and Frobenius twists written out.
(vi) Cycle classes `cl^r : CH^r(X) → H^{2r}_ét(X, Λ(r))`, `X` smooth over a perfect field and `n`
invertible, are defined by the ℓ-adic roadmaps on §5.1 and §5.6 (Milne LEC, §23, Thm. 23.4), compatible
with products, proper pushforward and Gysin maps.

**Owned here for others.** Henselization of pairs (§0.12), the catenary and Cohen–Macaulay package
(§§0.16–0.19), site-cohomology functoriality and étale cohomology of limits (§§2.1, 2.15), the
pro-étale site foundations (§2.17), Picard torsors (§3.6), adic thickening systems and algebraization
(§§4.7–4.10), deformation functors and Schlessinger's theorem (§§4.3–4.5), Hilbert and Quot schemes
and Chow's lemma (§§4.12, 4.14), the moduli stack of stable pointed curves with its finite projective
cover (§4.15), de Jong's alterations (§§4.16–4.20), the theorem on formal functions (§4.9, consumed by
JacobianChallenge Layer C), and projective bundles with the splitting principle (§5.4) are planned
here for the roadmaps that import them.

## Conventions

1. Rings are commutative with identity; the zero ring is allowed unless a target excludes it.
   Schemes, morphisms and opens are Mathlib's `Scheme`, `Scheme.Hom`, `Scheme.Opens` in a fixed
   universe `u`; "Noetherian", "separated", "proper" and "smooth" are hypotheses written on the
   target that needs them, never folded into a definition.
2. Big sites are Mathlib's `zariskiTopology ≤ etaleTopology ≤ fppfTopology ≤ fpqcTopology` on the
   category of schemes (slices `Over S` for a base); small sites are `X.Etale` with
   `Scheme.smallEtaleTopology`, and `X.ProEt` with `Scheme.ProEt.topology`. Cohomology is Mathlib's
   `Sheaf.H`; for `O_X`-modules it is Tau Ceti's `Scheme.Modules.Cohomology`. Every cohomological
   statement says which coefficient regime it is in (`𝔾_m` and smooth groups, `p`-torsion in
   characteristic `p`, quasi-coherent, arbitrary abelian sheaves) and never transports a result across
   regimes without a named comparison; finite and adic coefficients belong to the
   CohomologicalPointCounting family.
3. Stacks are pseudofunctors with Mathlib's `IsStack`; representability of a morphism of presheaves
   means by schemes, of stacks by algebraic spaces; torsors are fppf torsors; group actions are on the
   left; group objects are `GrpObj` in the cartesian monoidal categories `Over S` (schemes, the
   ModularCurves convention) and `Over h_S` (algebraic spaces).
4. The genus of a proper curve is `dim H¹(X, O_X)`; the degree of a locally free sheaf of rank `r` is
   `χ(E) − r·χ(O_X)`. Thickenings are closed immersions surjective on points; modifications are
   proper birational, alterations proper dominant and generically finite. Chow groups are graded by
   dimension; intersection products on smooth varieties are graded by codimension.
5. Names live under `TauCetiRoadmap.SchemeAndStackFoundations`, in namespaces named after the
   strand (`Henselization`, `Excellence`, `IdealPullback`, `Spaces`, `Torsor`, `Coherent`, `Brauer`,
   `Picard`, `Formal`, `Deformation`, `IsAlteration`, `Chow`, among others); the names proposed for
   the library are the ones in the subsections below, under `AlgebraicGeometry` for direct
   extensions of Mathlib objects (relative Proj, thickenings, adic thickening systems, alterations)
   and under `TauCeti` for the ring-theoretic and curve strands. `Suggested.lean`
   states the signatures and the `example` tests that can be typed at the pins; this document names
   every API item and every test, and a test named here and absent from `Suggested.lean` is still
   required.
6. Every definition subsection lists its unit tests under **Checks**: a genuine construction that
   satisfies the definition, a degenerate or edge case, a false positive obtained by dropping one
   essential clause of the definition, and, where a carrier is shared with a library or another
   roadmap, a compatibility test against that carrier. A wrong definition fails at least one of them.

## Exact supplier contracts

- `AlgebraicGeometry.Scheme.Modules.pullbackComp`, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`:
  composition of module-sheaf pullback functors; use it for the quasi-coherent restriction.

- `AdicCompletion.flat_of_isNoetherian`, `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean`:
  flatness of the completion of a Noetherian ring, including the local-ring instances.
- `TauCeti.AlgebraicGeometry.PureRelativeDimension`,
  `TauCeti/AlgebraicGeometry/Morphisms/PureRelativeDimension.lean`: the dimension hypothesis for
  flat pullback and its stability under base change.
- `AlgebraicGeometry.AlgebraicCycle`,
  `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: cycles with locally finite support.
  The new `cyclesOfDimension` only restricts this carrier to support of one dimension.

`Submodule.baseChange_map` in `TauCeti/LinearAlgebra/TensorProduct/Submodule.lean`
supplies compatibility of extension of submodules with linear-map images; §0.27 uses
this theorem directly. `AdicCompletion.of_bijective` in
`Mathlib/RingTheory/AdicCompletion/Basic.lean` supplies the canonical bijection for
complete rings, including the rings in `CompleteLocalAlg` and `AdicRing`.
Recovering actual global sections of `Spf` additionally requires the formal-scheme
comparison of §4.7.

**From Mathlib** (`6b7abb3c76`). `AlgebraicGeometry.Scheme`, `Spec`, `Scheme.Opens`, `affineOpens`,
`AffineZariskiSite`, gluing, `Limits.pullback` of schemes; the morphism classes `Flat`, `Smooth`,
`SmoothOfRelativeDimension`, `Etale`, `IsProper`, `IsSeparated`, `IsFinite`, `IsDominant`,
`IsClosedImmersion`, `IsOpenImmersion`, `IsAffineHom`, `LocallyOfFiniteType`,
`LocallyOfFinitePresentation`, `LocallyQuasiFinite`, `QuasiCompact`, `QuasiSeparated`,
`UniversallyClosed`, `Surjective`, `FormallyUnramified`, each with `IsStableUnderBaseChange` and
`IsStableUnderComposition` instances; `Scheme.IdealSheafData` with `subscheme`, `subschemeι`,
`comap`, `map`, `support`, `ker` and the product and power operations; `Scheme.Modules` with
`SheafOfModules.IsQuasicoherent`, `IsFinitePresentation`, `IsLocallyFree`,
`LocalGeneratorsData`, `Scheme.Modules.pullback`, `tilde`; `Scheme.functionField`, `Scheme.ord`,
`AlgebraicCycle`, `AlgebraicCycle.map`; `Scheme.Hom.normalization`, `fromNormalization`,
`residueField`, `residueFieldMap`, `finrank`, `residueDegree`; `Scheme.Birational`, `AffineSpace`;
`Scheme.zariskiPrecoverage`, `etalePrecoverage`, `zariskiTopology`, `etaleTopology`,
`fppfTopology`, `fpqcTopology`, `smallEtaleTopology`, `ProEt.topology`, `ellAdicSheaf`,
`EllAdicCohomology`; `CategoryTheory.Sheaf.H`, `Sheaf.H.map`, `Sheaf.H.equiv₀`,
`PresheafOfGroups.H1`, `MayerVietorisSquare`, `Functor.sheafPullback`,
`sheafPushforwardContinuous`, `Presheaf.IsSheaf`, `IsLocallySurjective`; `Pseudofunctor`,
`Pseudofunctor.IsStack`, `DescentData`, `CoGrothendieck`, `Functor.relativelyRepresentable` with
`diag_iff`, `MorphismProperty.presheaf`, `relative`, `universally`, `IsLocalAtSource`,
`IsLocalAtTarget`; `GrpObj`, `ModObj`, `MonObj`, `IsMonHom`, `CommMon`, `GradedObject`;
`DerivedCategory`, `HasExt`, `Functor.rightDerived`, `CochainComplex`; `CommAlgCat`,
`CommHopfAlgCat`, `Algebra.Etale`, `Algebra.FormallySmooth`, `Algebra.FiniteType`,
`Module.FinitePresentation`, `Module.Flat`, `Module.Projective`, `IsAzumaya`, `BrauerGroup`,
`HenselianRing`, `IsRegularRing`, `IsRegularLocalRing`, `RingTheory.Sequence.IsRegular`,
`IsWeaklyRegular`, `Ideal.height`, `ringKrullDim`, `topologicalKrullDim`, `Module.supportDim`,
`AdicCompletion`, `IsAdicComplete`, `IsDiscreteValuationRing`, `Localization.AtPrime`,
`integralClosure`, `IsIntegralClosure`, `PerfectClosure`, `PerfectRing`, `MvPowerSeries`,
`PowerSeries`, `DualNumber`, `TrivSqZeroExt`, `GroupExtension`, `krullTopology`,
`Field.absoluteGaloisGroup`, `localCohomology`, `CommRing.Pic`, `Proj`, `Proj.toSpecZero`,
`GradedAlgebra`, `Submodule.baseChange`. Everything named is used with its Mathlib meaning and never
rebuilt.

**From Tau Ceti** (`a91d3aaf`). `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`,
`CategoryTheory.CommMon.relativeSpec`, `CommMon.sectionsPresheaf`,
`CommMon.isLocalization_basicOpen`; `Scheme.Modules.Cohomology`, `eulerCharBelow`,
`finrank_cohomology_zero_sub_one_eq_add`; `TauCeti.AlgebraicGeometry.InvertibleSheaf`,
`LineBundleClass` (with its `CommGroup` instance), `SchemeWeilDivisor`, `CartierDivisor`,
`CodimensionOnePoint`, `SchemeWeilDivisor.toInvertibleSheaf`, `classGroupToLineBundleClass`;
`TauCeti.Model`, `genericFiber`, `specialFiberι`, `FiniteDVRExtension`;
`TauCeti.CommHopfAlgCat.fppfQuotientSheaf`, `isPullback_fppfQuotientTorsor`,
`TauCeti.ConstantGroup.groupScheme`, `linearlyReductiveAffineGroupSchemeProperty`;
`TauCeti.AlgebraicGeometry.AbelianVariety` with `dim`; `TauCeti.derivationToDualNumberEquivLift`;
`TauCeti.AffineInvariantQuotient`; `SheafOfModules.dual`, `monoidalClosed`;
`TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`;
`TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `finite_of_injective`;
`TauCeti.ScalarAut.instMulSemiringAction`; `TauCeti.brauerCohomologyEquiv`,
`subsingleton_brauerGroup_of_finite`; `TauCeti.NodeAlgebra`; `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`.

**From TauCetiRoadmap.AlgebraicVectorBundles**: L0A (monoidal closed `X.Modules`), L0B
(`FiniteLocallyFreeSheaf`, `isFiniteLocallyFreeOfRank`, `rank`), L0C (`dual`, `determinant`,
`symmetricPower`, `exteriorPower`), L1A–L1B (`pullbackQuasicoherentAlgebra`, `relativeSpecHomEquiv`,
`relativeSpecEquiv`, `relativeSpecBaseChangeIso`), L2A (`GradedQuasicoherentAlgebra`,
`gradedSymmetricAlgebra`). **From StableReduction**: Layer 0 (`FamilyOfCurves`, relative dimension,
models), Layer 1 (nodal families and the local normal form over a DVR, normalization, dual graphs),
Layer 2 (coherent curve theory, the Gorenstein `ω_{X/S}`, projective morphisms and relative Proj of
finitely generated algebras, relative ampleness, polarised descent), Layer 3 (prestable, semistable,
stable and `n`-pointed families), Layer 4 (blow-ups, strict transforms along blow-ups, intersection
numbers on arithmetic surfaces). **From ModularCurves**: 0B (group objects and finite locally free
group schemes), 0C (affine invariant quotients), 0D (finite étale schemes and Galois sets), 0E
(effective descent), 0F (Weil restriction), 0G (the Grassmannian), 4D (strict henselization and the
regular locus), 7D (`ArtinianTestAlgebra`), 9D (coarse schemes). **From JacobianChallenge**: A
(`Pic`, degree), B (coherent cohomology over `k`, genus, Riemann–Roch and Serre duality for line
bundles), C (relative cohomology and base change, symmetric powers), D (Picard functor, `Pic⁰`,
Picard–Brauer obstruction), E (abelian varieties), F (Abel–Jacobi). **From AlgebraicCurves**: 3
(divisors and the genus), 4 (Riemann–Roch), 7 (Hurwitz), 8 (constant-field extensions), 10 (model
classes), 12 (the dictionary). **From ClassFieldTheory** Layers 5 and 10 and **ProfiniteCohomology**
Layers 9–10 (continuous cohomology, Hilbert 90 and Kummer theory for fields). **From
CohomologicalPointCounting**: the edges listed under scope.

## How to read the build

Layer 0 is pure scheme theory and commutative algebra on Mathlib's carriers and is consumed by every
later layer. Layer 1 builds algebraic spaces on the big fppf site, then group spaces, torsors,
quotients and stacks; it needs Layer 0 only for the henselian and excellent packages used in its
examples. Layer 2 is the cohomology layer: its first half (§§2.1–2.17) is site-theoretic and needs
Layer 1 only through the torsor carrier, its second half (§§2.18–2.23) is coherent and needs Layer 0's
Cohen–Macaulay package. Layer 3 assembles the curve roadmaps and adds what they lack; it needs
Layer 2's Hilbert 90 and duality. Layer 4 needs Layer 0 (excellence, henselian pairs), Layer 1
(stacks, for the moduli of stable curves), Layer 2 (Ext groups and torsors of lifts) and Layer 3
(Picard schemes of curves). Layer 5 needs Layer 0's relative Proj, Layer 2's coherent duality,
Layer 3's degrees and Layer 4's blow-ups and deformation to the normal cone. The `*Needs:*` clauses specify construction prerequisites; later comparisons can depend
on later subsections. In particular, construct groupoids before quotients, the Nisnevich site
before topology comparisons, and homotopy invariance before refined Gysin maps.

## Layer 0: schemes and morphisms

The scheme-theoretic base of the roadmap, following the Stacks Project's chapters on constructions,
morphisms and commutative algebra. Mathlib provides schemes, affine schemes, quasi-coherent modules,
gluing, fibre products and the named morphism classes with their base-change stability; Tau Ceti and
AlgebraicVectorBundles provide quasi-coherent algebras, the relative spectrum and graded algebras.
Layer 0 adds the sheaf comparison and direct-image algebras, the general relative Proj compared with
StableReduction's finitely generated case, extension of coherent sheaves and Hartogs statements, the
dimension theory and limit theory of morphisms locally of finite type, henselization of pairs as a
small colimit of étale neighbourhoods, the catenary, Cohen–Macaulay, Nagata and excellent packages,
perfect schemes and perfection, flat base change of annihilators and cokernels, and the ideal-sheaf
comparison API that closed immersions need.

**Conventions of this layer.** `S_aff` is Mathlib's small affine Zariski site `S.AffineZariskiSite`.
A quasi-coherent algebra is Tau Ceti's `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra` (a commutative
monoid in `S.Modules` with quasi-coherent underlying module), a graded one is AlgebraicVectorBundles
L2A's `GradedQuasicoherentAlgebra`; gradings are indexed by `ℕ` with `O_S` in degree zero. Henselian
pairs are Mathlib's `HenselianRing R I`; regular rings are `IsRegularRing`; regular sequences are
`RingTheory.Sequence.IsRegular`. Perfection of an `𝔽_p`-algebra is Mathlib's colimit-along-Frobenius
`PerfectClosure`, never the inverse-limit `Perfection`. Weil restriction is ModularCurves 0F; strict
henselization, miracle flatness and the openness of the regular locus are ModularCurves 4D; coherent
sheaves are JacobianChallenge Layer B's `FinitelyPresentedSheaf`.

### 0.1 Quasi-coherent algebras as sheaves of algebras, and direct-image algebras

Construct, for a quasi-coherent `O_S`-algebra `A`, the coequifibered presheaf of rings on `S_aff`
that Mathlib's relative gluing consumes, `U ↦ A(U)` with the localisation maps
`CommMon.isLocalization_basicOpen`, and prove the comparison `sectionsPresheaf_iso`: the sheaf of
algebras it generates is `A` itself as a sheaf of `O_S`-algebras, naturally in `A` (Stacks, Situation
27.3.1 (01LM), Lemma 27.3.2 (01LN)). Define `pushforwardAlgebra f`, the direct image `f_* O_X` for
`f : X → S` quasi-compact and quasi-separated, as a quasi-coherent `O_S`-algebra, and prove
`pushforwardAlgebra_affine`: for `f` affine it is AlgebraicVectorBundles L1A's `affineFunctions`,
and `pushforwardAlgebra_baseChange` for flat base change (Stacks, Lemma 26.24.1 (01LC)).
*Needs:* Tau Ceti `QuasicoherentAlgebra`, `CommMon.sectionsPresheaf`; AlgebraicVectorBundles L1A;
Mathlib `QuasiCompact`, `QuasiSeparated`.

**Checks.**
- `sectionsPresheaf_structureSheaf`: for `A = O_S` the presheaf is `U ↦ Γ(U, O_S)` and the
  comparison is the identity.
- `pushforwardAlgebra_id`: `(𝟙 S)_* O_S = O_S` as algebras.
- `pushforwardAlgebra_not_quasiCoherent_without_qcqs`: for the open immersion
  `𝔸² ∖ {0} → 𝔸²` over a field the direct image is `O_{𝔸²}` (Hartogs), so the quasi-coherence
  statement holds, but for the infinite disjoint union `⨆_n Spec k → Spec k[t]` with `t ↦ n` the direct
  image of the structure sheaf is not quasi-coherent; the qcqs hypothesis is essential.

### 0.2 Morphism properties of relative spectra and modules on them

Prove, for `p : Spec_S(A) → S` the relative spectrum of a quasi-coherent algebra: `p` is affine;
`p` is of finite type, of finite presentation, finite, integral, a closed immersion, respectively,
iff `A` is locally of finite type, of finite presentation, finite, integral, a quotient of `O_S`, as
an `O_S`-algebra (`relativeSpec_finiteType_iff` and the four companions; Stacks, Lemma 29.45.3
(01WI)). Prove `relativeSpec_modulesEquiv`: quasi-coherent `O_{Spec_S(A)}`-modules are equivalent to
quasi-coherent `O_S`-modules with an `A`-module structure, by `p_*`, with `p^*` the quasi-inverse on
the image (Stacks, Lemma 29.11.7 (01SB)). *Needs:* §0.1; Tau Ceti `CommMon.relativeSpec`;
AlgebraicVectorBundles L1B.

### 0.3 Proj, base change and the relative Proj

Prove `Proj.isPullback_baseChange`: for a graded `R`-algebra `A` and `R → R'`, Mathlib's
`Proj (A ⊗_R R')` is the base change of `Proj A` along `Spec R' → Spec R` (Stacks, Lemma 27.11.6
(01N2)). Construct `relativeProj A` for an arbitrary `ℕ`-graded quasi-coherent `O_S`-algebra `A` with
`A_0 = O_S` (AlgebraicVectorBundles L2A's `GradedQuasicoherentAlgebra`): the scheme over `S` glued
from `Proj A(U)` over the affine opens `U` of `S`, with its structure morphism `relativeProj.toBase`,
separated, with the invertible sheaves `O(n)` when `A` is generated in degree one, and the affine
comparison `relativeProj_affine_iso : relativeProj A ≅ Proj A(S)` over `Spec A(S)` for affine `S`
(Stacks, Lemmas 27.15.2–27.15.4 (01NO, 01NP, 01NQ)). Prove `relativeProj_baseChange`: formation of
`relativeProj` commutes with arbitrary base change `S' → S` (Stacks, Lemma 27.16.10 (01O3)). Prove
the compatibility `relativeProj_eq_stableReduction`: on a graded algebra that is finitely generated
in the sense of StableReduction Layer 2, `relativeProj A` is StableReduction's relative Proj, by an
isomorphism over `S` compatible with `O(1)` and with base change; the finitely generated construction
is the special case, not a second carrier. *Needs:* AlgebraicVectorBundles L2A; StableReduction
Layer 2; Mathlib `Proj`, `Proj.toSpecZero`, `GradedAlgebra`, gluing.

**Checks.**
- `relativeProj_polynomial`: for `A = O_S[T_0, …, T_n]` (the symmetric algebra of `O_S^{n+1}`),
  `relativeProj A` is `ℙ^n_S`, that is `Proj ℤ[T_0..T_n] ×_ℤ S`.
- `relativeProj_degreeZero`: for `A = O_S` concentrated in degree zero, `relativeProj A` is empty.
- `relativeProj_not_generated_degree_one`: for `A = O_S[T]` with `T` in degree two, `relativeProj A`
  is `S` but `O(1)` is not invertible; invertibility of `O(1)` needs generation in degree one.
- `relativeProj_eq_stableReduction_polynomial`: the comparison iso is the identity on `ℙ^n_S`.

### 0.4 Direct images and extension of quasi-coherent and coherent modules

Prove `qcoh_pushforward`: kernels, cokernels, images, direct sums and colimits of quasi-coherent
modules are quasi-coherent, and for `f : X → Y` quasi-compact and quasi-separated `f_*` sends
quasi-coherent modules to quasi-coherent modules, the enumerated list of Stacks, Section 26.24 (01LA)
and Lemma 26.24.1 (01LC). Prove `qcoh_extension`: for `j : U → X` a quasi-compact open immersion into
a quasi-compact quasi-separated scheme, every quasi-coherent `O_U`-module `F` is `j^*G` for a
quasi-coherent `G` on `X`; every quasi-coherent submodule of `j^*G` is `j^*G'` for a submodule
`G' ⊆ G`; a finite-type `F` extends to a finite-type `G`, and a finitely presented `F` to a finitely
presented `G` when `X` is Noetherian or `F` is a direct summand of a finite free module (Stacks,
Lemmas 28.23.1 (01PE), 28.23.2 (01PF), 28.23.4 (01PI), 28.23.5 (0G41)). Prove `coherent_extension`:
on a Noetherian scheme every coherent `O_U`-module on an open `U` is the restriction of a coherent
`O_X`-module, and a coherent subsheaf of `j^*G` is the restriction of a coherent subsheaf of `G`
(EGA I 9.4.7; Stacks, Lemma 28.23.2 (01PF), Lemma 28.23.5 (0G41)). Prove
`locallyFree_coherent_extension`: a finite locally free sheaf on an open `U` of a Noetherian scheme
extends to a coherent sheaf on `X` (Stacks, Lemma 28.23.5 (0G41)); it need not extend to a locally
free one, which is the content of §0.6's reflexive hull. *Needs:* Mathlib `QuasiCompact`,
`QuasiSeparated`, `SheafOfModules.IsQuasicoherent`, `IsFinitePresentation`; JacobianChallenge Layer B.

### 0.5 Pseudo-coherent modules

Define `Module.IsPseudoCoherent A M` for a ring `A` and module `M`: `M` has a resolution
`⋯ → A^{a_2} → A^{a_1} → A^{a_0} → M → 0` by finite free modules, that is a chain complex of finite
free modules in degrees `≥ 0`, exact in positive degrees, with zeroth homology `M` (Stacks,
Definition 15.66.1 (064Q)). Define `Scheme.Modules.IsPseudoCoherent F` for an `O_X`-module `F` on a
scheme: on every affine open `U`, `F(U)` is pseudo-coherent over `O(U)`. API: `isPseudoCoherent_iff_finite`
(over a Noetherian ring, pseudo-coherent is finite; Lemma 15.66.17 (066E)),
`IsPseudoCoherent.finitePresentation` (pseudo-coherent modules are finitely presented; Lemma 15.66.4
(064T)), `IsPseudoCoherent.baseChange_of_flat` (stability under flat base change),
`IsPseudoCoherent.of_shortExact` (two-out-of-three in a short exact sequence; Lemma 15.66.14 (066D)),
`Scheme.Modules.isPseudoCoherent_iff_affineOpens` (affine-local characterisation) and
`Scheme.Modules.IsPseudoCoherent.pullback` along flat morphisms. Hypotheses: `A` any commutative ring;
`X` any scheme. *Needs:* Mathlib `Module.FinitePresentation`, `Module.Finite`, `ChainComplex`; Tau
Ceti `FinitelyPresentedSheaf`; JacobianChallenge Layer B.

**Checks.**
- `test_free`: for every scheme `X` and `n`, `O_X^n` is pseudo-coherent (the constant resolution).
- `test_dual_numbers`: for `A = k[ε]/(ε²)` and `M = A/(ε) = k`, the periodic resolution
  `⋯ → A → A → A → k → 0` by multiplication by `ε` witnesses pseudo-coherence; the resolution never
  terminates, so `k` is pseudo-coherent of infinite projective dimension.
- `test_not_finitely_presented`: for `A = k[x_1, x_2, …]` in countably many variables and
  `M = A/(x_1, x_2, …)`, `M` is finite but not finitely presented, hence not pseudo-coherent.
- `test_noetherian_agrees`: over `ℤ`, a module is pseudo-coherent iff it is finitely generated.

### 0.6 Reflexive sheaves, reflexive hulls and Hartogs

Define `Scheme.Modules.IsReflexive F` for a coherent `F` on a locally Noetherian `X`: the evaluation
map `ev_F : F → F^{∨∨}` of Tau Ceti's `SheafOfModules.dual` is an isomorphism (Stacks, Definition
31.13.1 (0AVU)). API: `isReflexive_iff_forall_affine` (affine-locally, `Module.IsReflexive` of the
sections), `IsReflexive.locallyFree` (finite locally free sheaves are reflexive), `IsReflexive.dual`
(the dual of a coherent sheaf on a normal integral locally Noetherian scheme is reflexive; Lemma 31.13.5
(0AY3)), `reflexiveHull F := F^{∨∨}` for `X` normal integral with `reflexiveHull_isReflexive`,
`reflexiveHull.unit : F → reflexiveHull F` (an isomorphism on the open where `F` is locally free;
Lemma 31.13.8 (0AY4)) and `reflexiveHull.lift` (its universal property among maps to reflexive
sheaves; Lemmas 31.13.2 (0AY0), 31.13.4 (0AY2), Remark 31.13.9 (0EBH)). Hypotheses: `X` locally
Noetherian; `F` coherent; the hull statements assume `X` normal integral. Prove `reflexive_extension_normal`:
on a normal scheme `X`, a reflexive sheaf on an open `U` whose complement has codimension `≥ 2`
extends uniquely to a reflexive sheaf `j_* F` on `X`, and for coherent `F` on a normal `X` the hull
`F^{∨∨}` is `j_* (F|_U)` for `U` the locus where `F` is locally free, with the `S_2` description of
reflexive sheaves (Stacks, Lemmas 31.13.11 (0EBI), 31.13.12 (0EBJ), 31.13.13 (0AY6), 31.13.14
(0AY7)). Prove `coherent_hartogs`: for a coherent `F` on a locally Noetherian `X` and a closed `Z`
such that `depth F_x ≥ 2` at every point of `Z`, restriction `F(X) → F(X ∖ Z)` is an isomorphism
(Stacks, Lemma 31.5.11 (0E9I)). *Needs:* §0.4, §0.17 (depth); Tau Ceti `SheafOfModules.dual`;
Mathlib `Module.IsReflexive`, `Module.Dual.eval`.

**Checks.**
- `test_unit`: for every locally Noetherian `X`, `O_X` is reflexive.
- `test_torsion`: on `X = Spec ℤ`, the tilde of `ℤ/2` has zero double dual, so it is not reflexive
  and its hull is `0`.
- `test_maximal_ideal`: on `X = Spec k[x, y]`, the ideal sheaf `I` of the origin is torsion-free with
  `I^{∨∨} = O_X ≠ I`; a torsion-free sheaf need not be reflexive.
- `test_hartogs_plane`: `Γ(𝔸² ∖ {0}, O) = k[x, y]` by `coherent_hartogs`; on `𝔸¹`, removing the
  origin gives `k[x, x^{-1}]`, so the depth hypothesis is essential.

### 0.7 Local dimension and dimension theory of schemes of finite type over a field

Define `topologicalKrullDimAt X x := inf { dim U : U open, x ∈ U }` for a topological space `X`,
with `dim U` Mathlib's `topologicalKrullDim` of the subspace, valued in `WithBot ℕ∞` (Stacks,
Definition 5.10.1 (0055)). API: `topologicalKrullDimAt_le` (`dim_x X ≤ dim X`),
`iSup_topologicalKrullDimAt` (`dim X = sup_x dim_x X`), `topologicalKrullDimAt_of_isOpenEmbedding`,
`topologicalKrullDimAt_of_isHomeomorph`, `topologicalKrullDimAt_eq_stalk` (for a scheme locally of
finite type over a field, `dim_x X = dim O_{X,x} + trdeg κ(x)`), `fiberDimAt` for a morphism.
Prove `dimension_theory_finiteType`: for `X` locally of finite type over a field `k` and `x ∈ X`,
`dim_x X` is the maximum of `trdeg_k κ(ξ)` over generic points of components through `x`,
`dim O_{X,x} + trdeg_k κ(x) = dim_x X`, and `dim X = dim X_{k'}` for every field extension (Stacks,
Lemmas 10.116.1 (00P0), 10.116.2 (06RP), 10.116.3 (00P1), 10.116.5 (00P3), 10.116.6 (00P4)). Prove
`geometric_irreducible_components`: for a scheme `X` of finite type over `k` and `k'/k`, the
irreducible components of `X_{k'}` map onto those of `X`; if `k'/k` is separable the number of
components is unchanged for every separable field extension exactly when the components
are geometrically irreducible; and `X` is
geometrically irreducible iff `X_{k^s}` is irreducible (Stacks, Lemmas 33.8.3 (020J), 33.8.6 (054Q),
33.8.8 (038H), 33.8.11 (04KX), 33.8.14 (04KY), 33.8.16 (054R)). Prove
`fibre_dimension_semicontinuity`: for `f : X → Y` locally of finite type, `x ↦ dim_x X_{f(x)}` is
upper semicontinuous, and for `f` flat and locally of finite presentation the loci
`{ x : dim_x X_{f(x)} ≤ n }` are open (Stacks, Lemmas 29.29.3 (02FY), 29.29.4 (02FZ), 29.29.5 (0A3V),
29.29.6 (02G0)). Prove `fibre_dimension_formula`: for a dominant morphism `f : X → Y` of integral
schemes of finite type over `k`, `dim_x X_{f(x)} ≥ dim X − dim Y` for every `x`, with equality on a
dense open (Stacks, Lemma 33.20.4 (0B2L)). *Needs:* Mathlib `topologicalKrullDim`,
`topologicalKrullDim_subspace_le`, `ringKrullDim`, `Algebra.trdeg`, `LocallyOfFiniteType`.

**Checks.**
- `topologicalKrullDimAt_sum_affineSpace`: for `X = Spec(k[s, t] × k[u])` over a field, the local
  dimension is `2` at points of the plane and `1` at points of the line, while `dim X = 2`.
- `topologicalKrullDimAt_of_isOpen_singleton`: if `{x}` is open then `dim_x X = 0`.
- `fiberDimAt_affineLine_projection`: for `𝔸²_k → 𝔸¹_k`, every fibre has dimension `1` at every
  point.
- `topologicalKrullDimAt_empty`: the empty space has local dimension `⊥` nowhere, and `dim ∅ = ⊥`.

### 0.8 Flatness over Dedekind bases, spreading out, étale coordinates and quasi-sections

Prove `flat_over_dedekind`: a morphism `X → S` to a Dedekind scheme with `X` reduced and every
irreducible component of `X` dominating `S` is flat, and its fibres are pure of the expected
dimension when `X` is of finite type (Stacks, Lemma 15.22.11 (0AUW)). Prove
`generic_fibre_spreading`: for `f : X → S` of finite presentation with `S` integral and the generic
fibre `X_η` geometrically reduced (irreducible, integral, connected, normal, smooth), the same holds
for the fibres over a dense open of `S`; and `fibre_locus_constructible`: the locus of `s` where `X_s`
has a given one of these properties is constructible (Stacks, Lemmas 37.26.2 (0576), 37.26.4 (0578),
37.26.5 (0579)). Prove `flat_proper_fibre_loci`: for `f` proper and flat of finite presentation, the
loci where the fibre is geometrically reduced, respectively geometrically integral, are open (EGA
IV₃, Theorem 12.2.4 (v) and (viii), p. 183). Prove `fibre_power_irreducible`: for `f : X → S` flat of
finite presentation with geometrically irreducible fibres, every fibre power `X ×_S ⋯ ×_S X` has
geometrically irreducible fibres over `S` and is irreducible when `S` is (Stacks, Lemma 29.26.10
(01UA)). Prove `etale_coordinates`: a morphism `f : X → S` smooth at `x` of relative dimension `d`
admits, on an open neighbourhood `U` of `x`, an étale morphism `U → 𝔸^d_S` over `S` (Stacks, Lemma
29.37.21 (054L)). Prove `rational_point_component`: a connected scheme smooth over a field with a
rational point is geometrically integral (Stacks, Lemma 33.7.14 (04KV)). Prove `quasi_sections`: for
`f : X → S` smooth and surjective there is an étale surjective `S' → S` with a section of `X_{S'}`,
and for `f` smooth at `x` there is an étale neighbourhood `(S', s') → (S, f(x))` and a section
through `x` (Stacks, Lemmas 37.38.5 (057G), 37.38.6 (055U)). *Needs:* §0.7; Mathlib `Flat`,
`Smooth`, `SmoothOfRelativeDimension`, `Etale`, `AffineSpace`, `IsProper`, `Geometrically.Integral`.

### 0.9 Limits of schemes, Noetherian approximation and spreading out

Prove `affine_transition_limits`: a cofiltered diagram of schemes with affine transition maps has a
limit, computed affine-locally on any member, with `|lim X_i| = lim |X_i|` and the limit of
quasi-compact separated schemes quasi-compact and separated (Stacks, Lemmas 32.2.1 (01YW), 32.2.2
(01YX), 32.2.3 (01YZ)). Prove `noetherian_approximation`: every quasi-compact quasi-separated scheme
is a cofiltered limit, with affine transition maps, of schemes of finite presentation over `ℤ`
(Stacks, Lemmas 32.5.1 (01Z7), 32.5.2 (01Z9), 32.5.3 (07RN), Proposition 32.5.4 (01ZA)). Prove
`finite_presentation_limits`: for `S = lim S_i` as above, every scheme of finite presentation over
`S` descends to some `S_i`, morphisms between descended schemes descend after enlarging `i`, and the
properties flat, smooth, étale, proper, finite, closed immersion, open immersion, isomorphism are
inherited from a finite stage (Stacks, Proposition 32.6.1 (01ZC)). Prove `spreading_out_models`:
for `S` integral with generic point `η` and `X_η` of finite presentation over `κ(η)` with one of
those properties, there is a dense open `U ⊆ S` and a model `X_U → U` of finite presentation with
the same property (Stacks, Lemma 32.10.1 (01ZM)). Prove `integral_point_descent`: for `X → S`
separated of finite type with `S` Noetherian normal, an `S'`-point of `X` for `S'` the integral
closure of `S` in a finite extension of its function field that is defined over the function field
of `S` is an `S`-point (Klevdal–Patrikis 2024, Lemma 3.9 and footnote 8, p. 21). Prove
`projectiveLine_to_affine_constant`: every `S`-morphism from `ℙ^1_S` to an affine `S`-scheme factors
through `S` (Stacks, Lemma 30.8.1 (01XT), case `q = 0, d = 0`: `Γ(ℙ^1_S, O) = Γ(S, O)`). *Needs:*
§0.4; Mathlib `Limits`, `LocallyOfFinitePresentation`, `Scheme.Hom.normalization`.

### 0.10 Geometrically unibranch local rings and schemes

Define `IsLocalRing.IsUnibranch A`: the reduction `A_red` is a domain and the integral closure `A'`
of `A_red` in its fraction field is local; `IsLocalRing.IsGeometricallyUnibranch A`: unibranch and
the residue field of `A'` is purely inseparable over that of `A` (Stacks, Definition 15.108.1
(0BPZ)). Define `Scheme.IsGeometricallyUnibranchAt X x` on stalks and `IsGeometricallyUnibranch X`
at every point. API: `IsGeometricallyUnibranch.of_isIntegrallyClosed` (normal local domains are
geometrically unibranch), `isUnibranch_iff_irreducible_henselization` and
`isGeometricallyUnibranch_iff_irreducible_strictHenselization` (ModularCurves 4D's strict
henselization; Stacks, Lemma 15.108.5), `IsGeometricallyUnibranch.of_etale`,
`IsGeometricallyUnibranch.baseChange_sepClosed` (invariance under separable field extension).
Prove `unibranch_finite_components`: for `X` geometrically unibranch and `Y → X` étale-locally
constant with finite fibres, the connected components of `Y` are finite étale over `X`
(Česnavičius 2020, proof of Lemma 5.1, p. 16, via SGA 3 X 5.14 and EGA I 6.1.9). Prove
`jacobian_etale_algebra`: for polynomials `f_1, …, f_r ∈ R[x_1, …, x_r]`, the localisation of
`R[x]/(f)` at the Jacobian determinant is an étale finitely presented `R`-algebra; it is finite
étale, with degree bounded by the product of the degrees, only under the finiteness hypotheses
of Couveignes's construction (Couveignes 2019, Theorem 1 (p. 1) and Proposition 2 (p. 7)), not
from the Jacobian condition alone. *Needs:* Mathlib `Scheme.Hom.normalization`,
`Scheme.Hom.normalizationObjIso`, `IsIntegrallyClosed`, `IsPurelyInseparable`; ModularCurves 4D.

**Checks.**
- `jacobian_test_not_finite`: for `R = A[t]` and `f = t x − 1`, the Jacobian is `t`, already a
  unit in `R[x]/(t x − 1) = A[t, t⁻¹]`, which is étale over `A[t]` and not finite.
- `IsLocalRing.not_isUnibranch_node`: for a field `k` of characteristic not `2`, the local ring of
  `k[x, y]/(y² − x²(x + 1))` at the origin is not unibranch (two branches).
- `IsLocalRing.isGeometricallyUnibranch_cusp`: the local ring of `k[x, y]/(y² − x³)` at the origin
  is geometrically unibranch (normalisation `k[t]`, one point above the origin, residue field `k`).
- `IsLocalRing.isUnibranch_not_isGeometricallyUnibranch_real`: the local ring of
  `ℝ[x, y]/(x² + y²)` at the origin is unibranch (its normalisation `ℂ[t]` is local above it) but
  not geometrically unibranch (residue extension `ℂ/ℝ` is separable of degree `2`).
- `IsLocalRing.isGeometricallyUnibranch_of_field`: every field is geometrically unibranch.

### 0.11 Descent along field extensions, absolute integral closure, unramified morphisms

Prove `field_extension_descent`: for `X` a `k`-scheme and `k'/k` a field extension,
`Γ(X_{k'}, O) = Γ(X, O) ⊗_k k'` when `X` is quasi-compact and quasi-separated;
closed subschemes and morphisms equipped with descent data, and the properties affine, quasi-affine,
separated, finite type, proper, smooth, étale descend from `X_{k'}` to `X`, and a morphism
`X_{k'} → Y_{k'}` defined by Galois-invariant data descends when `k'/k` is finite Galois (Stacks, Lemmas 35.23.1 (02KQ),
35.23.2 (02KR), 35.23.3 (02KS), 35.23.6 (02KU), 35.23.12 (02KX), 35.23.14 (02KZ), 35.23.16 (02L1)).
Define `absoluteIntegralClosure X` for an integral scheme `X`: the relative normalisation of `X` in
an algebraic closure of its function field, with `absoluteIntegralClosure_integral` (integral over
`X`), `absoluteIntegralClosure_unique` (independent of the closure up to isomorphism over `X`) and
`absoluteIntegralClosure_affine` (`Spec A^+` for affine `X = Spec A`) (Bhatt–Ma–Patakfalvi et al.
2020, Convention 4.1, p. 35). Prove `unramified_criteria`: a morphism locally of finite type is
unramified iff every fibre is a disjoint union of spectra of finite separable field extensions; an
unramified morphism is locally quasi-finite; `f` is unramified at `x` iff `Ω_{X/Y, x} = 0` iff the
diagonal is an open immersion near `x` (Stacks, Lemmas 29.36.10 (02V5), 29.36.11 (02G7), 29.36.12
(02G8), 29.36.13 (02GE), 29.36.14 (02GF)). *Needs:* §0.9; Mathlib `FormallyUnramified`,
`LocallyQuasiFinite`, `Scheme.Hom.normalization`.

### 0.12 Étale neighbourhoods and the henselization of a pair

This subsection is the strand `Henselization` of `Suggested.lean`; every lemma named here is a
declaration there. For a ring `R` and ideal `I`, define `IsNeighbourhood I : ObjectProperty
(CommAlgCat R)`: `B` is an étale `R`-algebra (Mathlib `Algebra.Etale`) such that the canonical map
`reducedMap I B : R/I → B/IB` is bijective; `Neighbourhood I` is the full subcategory (Stacks, Lemma
15.12.1, the construction paragraph). Prove `isNeighbourhood_self` (the identity algebra `R`),
`isNeighbourhood_localization` (`R[1/x]` for `x ≡ 1 mod I`), `isNeighbourhood_tensor` (the tensor
product of two neighbourhoods is a neighbourhood, so parallel pairs have a common target),
`parallel_equalization` (two parallel maps of neighbourhoods are equalised by a neighbourhood),
`neighbourhood_isFiltered` (`Neighbourhood I` is filtered) and `neighbourhood_essentiallySmall`
(a small model `SmallModel (Neighbourhood I)` in universe `u` exists). Define the **henselization**
`Henselization.algebra I := colimit (diagram I)` of the small model, with the stage maps
`stage I B : B → algebra I` and `stage_naturality`, and the extended ideal
`extended I := I · algebra I`. Prove the stage lemmas: `mem_extended_iff_exists_stage` (an element of
the extended ideal comes from `I B` at some stage), `exists_stage_monic_polynomial` (a monic
polynomial over the colimit comes from a stage), `exists_stage_quotient_unit` (a unit modulo the
extended ideal comes from a unit modulo `IB` at a stage), `exists_stage_simple_root` (a simple root
modulo the extended ideal is realised at a stage), `quotient_bijective` (`R/I → algebra I / extended
I` is bijective), `extended_le_jacobson` (`extended I` lies in the Jacobson radical) and
`simple_root_lift` (a simple root modulo `extended I` lifts). Prove the **main theorem** `henselian`:
`HenselianRing (algebra I) (extended I)` (Stacks, Lemma 15.12.1). Prove the **universal property**:
`existsUnique_lift`: for every henselian pair `(S, J)` and ring map `f : R → S` with `f(I) ⊆ J` there
is a unique `R`-algebra map `algebra I → S` carrying `extended I` into `J`; `fixed_of_henselian`: if
`(R, I)` is henselian then `R → algebra I` is an isomorphism; `local_henselization`: for a local ring
`R` with maximal ideal `m`, `algebra m` is the henselization of the local ring (Stacks, Lemma 15.12.3
(0A03)). The étale-section lemmas that the universal property rests on: `etale_section_selector`
(an `R`-algebra section `σ : B → R` of an étale algebra is given by an idempotent `e` with
`B[1/e] ≅ R`), `etale_selector_kernel` (its kernel is generated by `1 − e`),
`etale_section_product`, `etale_section_localization`, `etale_lift_unique` (two sections agreeing
modulo an ideal inside the Jacobson radical agree) and `exists_etale_lift` (over a henselian pair a
section modulo `I` lifts uniquely; Stacks, Lemma 15.11.6 (5)⇒(2) with Lemma 15.11.5). Define
`Henselization.map I J f : algebra I → algebra J` for a morphism of pairs `f : (R, I) → (S, J)` by
the universal property, with `map_comp_unit`, `map_extended_le`, `map_id`, `map_comp` and
`quotient_naturality` (the residue identification is natural). *Needs:* Mathlib `CommAlgCat`,
`CommAlgCat.Hom`, `IsFiltered`, `SmallModel`, `Limits.colimit`, `Algebra.Etale`, `HenselianRing`,
`Ideal.jacobson`, `Polynomial`.

**Checks.**
- `neighbourhood_identity`: `R` belongs to `Neighbourhood I` for every `(R, I)`.
- `neighbourhood_invert_two`: for `(ℤ, (5))`, `ℤ[1/2]` is a neighbourhood (`2` is a unit mod `5`).
- `neighbourhood_reject_invert_five`: `ℤ[1/5]` is not: `ℤ/5 → ℤ[1/5]/5 = 0` is not bijective.
- `neighbourhood_reject_two_sheets`: `ℤ × ℤ` is not: `ℤ/5 → ℤ/5 × ℤ/5` is not surjective.
- `henselization_zero_ideal`: `algebra (⊥ : Ideal R) ≅ R`.
- `henselization_unit_ideal`: `algebra (⊤ : Ideal R)` is the zero ring.
- `henselization_fixed_pair`: for `(R, I)` henselian, `algebra I ≅ R`.
- `henselization_ordinary_finite_field`: `algebra (⊥ : Ideal (ZMod 5)) ≅ ZMod 5`.
- `map_field_identity`, `map_scalar_seven`, `map_quotient_nine`: the induced maps for
  `id : (𝔽_5, 0) → (𝔽_5, 0)`, for `ℤ → 𝔽_5`, and for `(ℤ/9, (3)) → (ℤ/9, (3))`, computed on `1`.
- `map_can_collapse`: the induced map of `(ℤ, 0) → (ℤ/5, 0)` is not injective.
- `etale_section_idempotent`: for `𝔽_5 × 𝔽_5 → 𝔽_5` the selector is `(1, 0)` and the kernel is
  `(0, 1)`; `derivative_not_unit`: `x² − 1` over `𝔽_2` has a non-simple root at `1`.

### 0.13 Ind-étale algebras and the properties of the henselization

Define `IndEtale R S` for a commutative `R`-algebra `S`: there are a small filtered category `J`, a
functor `D : J ⥤ CommAlgCat R` all of whose values are étale `R`-algebras, and a colimit cocone of
`D` with apex `S` (Stacks, Lemma 10.39.3 (05UT) for the flatness consequence). API: `IndEtale.of_etale`,
`IndEtale.of_algEquiv`, `IndEtale.flat` (ind-étale algebras are flat), `IndEtale.weaklyEtale`
(flat with flat multiplication map), `IndEtale.comp`, `IndEtale.baseChange`, `IndEtale.localization`
(every localisation is ind-étale), `IndEtale.henselization` (the henselization of §0.12 is
ind-étale). Hypotheses: `R`, `S` commutative, the zero ring allowed. Prove, for the henselization
`(R^h, I^h) := (algebra I, extended I)` of §0.12: `henselization_flat` (`R → R^h` is flat and
ind-étale; Stacks, Lemma 15.12.2 (0AGU)); `henselization_quotient_pow` (`R/I^n ≅ R^h/(I^h)^n` for
every `n`, hence equal `I`-adic completions; Lemma 15.12.2); `henselization_noetherian` (for `R`
Noetherian, `R^h` is Noetherian and `R^h → R^∧` is faithfully flat; Lemma 15.12.4 (0AGV));
`henselization_recognition` (a flat ind-étale `R`-algebra `S` with `R/I ≅ S/IS` such that `(S, IS)`
is henselian and `S` is initial among such is `R^h`; Clausen–Mathew–Morrow 2021, Remark 3.19, p.
22); `henselization_filtered_colimit` (henselization commutes with filtered colimits of pairs;
Lemma 15.12.5 (0A04)); `henselization_integral_base_change` (for `R → R'` integral,
`R'^h = R' ⊗_R R^h`; quotients, radicals and products of coprime ideals; Lemma 15.12.6 (0F0L));
`henselization_at_prime` (the henselization of `R_p` at `p R_p`, and of `O_{X,x}` at a point of a
scheme, as the colimit of étale neighbourhoods of `x` with trivial residue extension; Stacks,
Lemma 10.155.7 (04GV), Lemma 10.155.1 (04GN), Definition 10.155.3). Prove the example
`henselization_padic`: `ℤ_{(p)}^h` is the ring of algebraic elements of `ℤ_p`, and `ℤ_{(p)}^h ≠ ℤ_p`
(Stacks, Lemma 10.155.7 (04GV)). *Needs:* §0.12; Mathlib `CommAlgCat`, `IsFiltered`, `Module.Flat`,
`AdicCompletion`, `IsNoetherianRing`, `Localization.AtPrime`.

**Checks.**
- `test_localization_atPrime`: `ℤ_{(5)}` is ind-étale over `ℤ` (a filtered colimit of
  localisations `ℤ[1/f]`).
- `test_zmod_two`: `ℤ/2` is not ind-étale over `ℤ`: it is not flat.
- `test_polynomial_not_indEtale`: `ℚ[T]` is not ind-étale over `ℚ`: its module of differentials is
  nonzero, while ind-étale algebras have `Ω = 0`.
- `test_henselization_quotient`: `ℤ^h_{(5)}/5 ≅ 𝔽_5` by `henselization_quotient_pow`.

### 0.14 Henselian pairs: characterisations, permanence, finite étale algebras, Elkik

Prove `henselian_pair_characterisations`: for `I ⊆ R` the following are equivalent: `(R, I)` is
henselian (Mathlib's `HenselianRing R I`); `I` lies in the Jacobson radical and every monic
polynomial with a simple root modulo `I` has a root lifting it; every finite `R`-algebra `S` has
`Idem(S) → Idem(S/IS)` bijective; every étale `R`-algebra with a section modulo `I` has a section;
for every integral `R`-algebra `S`, `(S, IS)` is henselian (Stacks, Lemma 15.11.6 (09XI)). Prove
`henselian_pair_permanence`: henselian pairs are stable under quotients, integral extensions, finite
products, filtered colimits, taking radicals, and passage to `(R, J)` for `J ⊆ I` radical-equivalent;
the pair `(R, I)` is henselian when `R` is `I`-adically complete, and the Example 15.11.14 that a
henselian pair need not be local (Stacks, Lemmas 15.11.2–15.11.4, 15.11.7–15.11.16). Prove
`henselian_finiteEtale_equivalence`: for a henselian pair `(R, I)`, base change is an equivalence
from finite étale `R`-algebras to finite étale `R/I`-algebras (Stacks, Lemmas 15.13.1 (0D4A), 15.13.2
(09ZL)). Prove `henselian_local_finite_algebras`: for a henselian local ring `R`, every finite
`R`-algebra is a product of local rings, every quasi-finite `R`-algebra is a product of a finite
algebra and an algebra with empty closed fibre, and the three implications (8)⇒(10), (8)⇒(11),
(10)⇒(1) of Stacks, Lemma 10.153.3 (04GG), items (1), (8), (10), (11), (13). Prove
`henselian_smooth_lifting` (Elkik): for a henselian pair `(R, I)` and a smooth `R`-algebra `A`, every
`R`-algebra map `A → R/I` lifts to `A → R` (Stacks, Lemma 15.13.3 (0H74)). *Needs:* §0.12, §0.13;
Mathlib `HenselianRing`, `Algebra.Etale`, `Algebra.Smooth`, `Module.Finite`, `IsLocalRing`.

### 0.15 Néron–Popescu desingularization

Prove `popescu_desingularization`: a regular ring map `R → S` (§0.21) between Noetherian rings
exhibits `S` as a filtered colimit of smooth `R`-algebras (Stacks, Theorem 16.12.1 (07GC)); and the
corollary `popescu_colimit_of_geometricallyRegular` for `S` a filtered colimit of smooth algebras
whenever all fibres are geometrically regular and `S` is flat. *Needs:* §0.21; Mathlib
`Algebra.Smooth`, `IsFiltered`.

### 0.16 Catenary and universally catenary rings

Define `Ring.IsCatenary R`: for every pair of primes `p ⊆ q`, some natural number bounds the length
`e` of every strict chain `p = p_0 ⊊ ⋯ ⊊ p_e = q`, and any two saturated chains from `p` to `q` have
the same length, a chain being saturated when no prime lies strictly between consecutive members
(Stacks, Definition 10.105.1 (00NI)). No Noetherian, local or dimension hypothesis. API:
`exists_length_le`, `length_eq_of_covBy`, `isCatenary_iff_of_isNoetherianRing` (for Noetherian `R`,
catenary iff every local ring `R_q` is catenary iff `height(q/p)` is additive along saturated
chains; Lemmas 10.105.2 (02IH), 10.105.4 (00NJ)), `of_ringEquiv`, `localization`, `quotient`,
`of_isNoetherian_of_dim_le_one`, `isCatenary_iff_forall_isMaximal` (Lemmas 10.105.6 (0AUN), 10.105.7
(00NK), 10.105.8 (0AUP)). Define `Ring.IsUniversallyCatenary R`: `R` is Noetherian and every
finite-type `R`-algebra is catenary (Stacks, Definition 10.105.3 (00NL)); the Noetherian clause is
part of the predicate. API: `isNoetherianRing`, `isCatenary_of_finiteType`,
`isUniversallyCatenary_iff_mvPolynomial` (it suffices that every `R[x_1..x_n]` is catenary),
`of_essFiniteType`, `quotient`, `localization`, `of_finiteType_algebra`,
`isUniversallyCatenary_iff_forall_isMaximal_localization`. Prove
`cohenMacaulay_universallyCatenary`: a Cohen–Macaulay ring (§0.17) is universally catenary (Stacks,
Lemma 10.105.9 (00NM)). *Needs:* §0.17 (for the last theorem only); Mathlib `LTSeries`, `CovBy`,
`Ideal.height`, `Algebra.FiniteType`, `Algebra.FiniteType.iff_quotient_mvPolynomial`.

**Checks.**
- `IsCatenary.test_field`: every field is catenary (one prime).
- `IsCatenary.test_int`: `ℤ` is catenary: every saturated chain between `0` and `(p)` has length one.
- `IsCatenary.test_zero`: the zero ring is catenary (no primes).
- `IsUniversallyCatenary.test_field`, `test_int`: fields and `ℤ` are universally catenary.
- `IsUniversallyCatenary.test_dim_one_domain`: every Noetherian domain of dimension at most one is
  universally catenary (Lemma 10.105.8).
- `IsCatenary.test_nagata`: Nagata's local domain of §0.22 is Noetherian and not catenary, so the
  predicate is not implied by Noetherianity.

### 0.17 Depth, Cohen–Macaulay modules and Serre's conditions

Define `Module.depth I M` for an ideal `I` and module `M` over a ring `R`: the supremum in `ℕ∞` of
the lengths `r` of sequences `f_1, …, f_r ∈ I` that are weakly `M`-regular (each `f_i` a
non-zero-divisor on `M/(f_1, …, f_{i−1})M`), and `IsLocalRing.depth M := depth m M` for a local ring
(Stacks, Definition 10.68.1 (00LF)); `depth 0 = ⊤`. API: `IsLocalRing.depth_eq_top_iff` (`M = 0`
exactly, for `M` finite over Noetherian `R`), `depth_le_supportDim` (`depth M ≤ dim Supp M`),
`depth_eq_zero_iff` (`m ∈ Ass M`), `depth_eq_iff_ext` (`depth M = inf { i : Ext^i(κ, M) ≠ 0 }`),
`depth_quotSMulTop` (a regular element drops depth by one), `depth_localization_le`,
`depth_of_flat_baseChange`, `depth_eq_iff_koszul`. Define `Module.IsCohenMacaulay M` for a finite
module over a Noetherian local ring: `M = 0` or `depth M = dim Supp M`, and `Ring.IsCohenMacaulay R`
for Noetherian `R`: every `R_m` is Cohen–Macaulay over itself (Stacks, Definitions 10.103.1 (00N3),
10.103.8 (00NF), 10.103.12 (0AAH)). API: `isCohenMacaulay_iff_of_isLocalRing`, `localization`
(Lemma 10.103.5 (0C6G)), `isCohenMacaulay_iff_forall_isMaximal`, `isCohenMacaulay_quotSMulTop_iff`
(Lemma 10.103.10 (0AAF)), `Ring.IsCohenMacaulay.of_isRegularRing`, `IsCohenMacaulay.polynomial`
(Lemma 10.103.13 (0AAI)), `IsCohenMacaulay.unmixed` (all associated primes have the same dimension;
Lemma 10.103.7 (0BUS)), `IsCohenMacaulay.height_add_dim` (`height p + dim R/p = dim R`; Lemma 10.103.9
(0AAE)), `IsCohenMacaulay.of_regularSequence` (Lemma 10.103.11 (0AAG)). Define
`Module.SatisfiesSerreS n M` for a finite module over a Noetherian ring: for every prime `p`,
`depth_{R_p} M_p ≥ min(n, dim Supp M_p)`, with `depth 0 = ⊤` and `dim ∅ = ⊥`, so primes outside the
support impose nothing (Stacks, Definition 10.157.1 (031P)); and `Ring.SatisfiesSerreR n R`: `R_p` is
regular for every prime of height `≤ n`. API: `satisfiesSerreS_zero`, `mono` (in `n`),
`isCohenMacaulay_iff_forall_satisfiesSerreS` (Lemma 10.157.3 (031R)), `satisfiesSerreS_one_iff` (no
embedded primes; Lemma 10.157.2 (031Q)), `satisfiesSerreS_two_iff_hartogs` (Lemma 10.157.4 (031S),
used by §0.6), `SatisfiesSerreR.mono`, `isReduced_iff_R0_S1` (Lemma 10.157.3), `SatisfiesSerreS.localization`
(Lemma 10.157.5 (0567)). *Needs:* Mathlib `RingTheory.Sequence.IsWeaklyRegular`, `IsRegular`,
`Module.support`, `Module.supportDim`, `Ideal.height`, `IsRegularLocalRing`, `Ext`.

**Checks.**
- `IsLocalRing.depth.test_residueField`: for a Noetherian local ring `R` of positive dimension,
  `depth κ = 0`.
- `IsLocalRing.depth.test_zero`: the zero module has depth `⊤`; a definition built on "regular
  sequences of maximal length" rather than the supremum would give `0`.
- `IsLocalRing.depth.test_dvr`: a discrete valuation ring has depth `1` over itself.
- `Ring.IsCohenMacaulay.test_field`: every field is Cohen–Macaulay.
- `Module.IsCohenMacaulay.test_zero`: the zero module is Cohen–Macaulay over every Noetherian local
  ring.
- `Ring.IsCohenMacaulay.test_proper_support`: `k[x]/(x)` is Cohen–Macaulay over itself (a field) and
  over `k[x]_{(x)}` as a module (depth `0 = dim Supp`).
- `Module.SatisfiesSerreS.test_zero`: the zero module satisfies `(S_n)` for every `n`.
- `Ring.SatisfiesSerreS.test_plane_and_line`: `k[[x, y, z]]/(xz, yz)` satisfies `(S_1)` (no embedded
  primes) and not `(S_2)` (at the maximal ideal the depth is `1` and the dimension `2`).
- `Ring.SatisfiesSerreS.test_embedded_point`: `k[x, y]/(x², xy)` does not satisfy `(S_1)`: the
  origin is an embedded prime.
- `Ring.IsCohenMacaulay.test_not_cm`: `k[x, y]/(x², xy)` is not Cohen–Macaulay, by the previous
  check and `isCohenMacaulay_iff_forall_satisfiesSerreS`.

### 0.18 Scheme-theoretic support and Cohen–Macaulay schemes

Prove `coherent_scheme_support`: for a finite-type quasi-coherent `F` on `X`, the support is closed,
the annihilator ideal sheaf `Ann(F)` is quasi-coherent, and the scheme-theoretic support
`V(Ann F)` is the smallest closed subscheme `Z` such that `F` is the pushforward of a module on `Z`
(Stacks, Lemmas 29.5.1 (056I), 29.5.3 (056J), 29.5.4 (05JU), Definition 29.5.5 (05JV)). Define
`Scheme.Modules.IsCohenMacaulay F` for a coherent `F` on a locally Noetherian `X`: for every `x` in
the support, `depth_{O_{X,x}} F_x = dim Supp F_x`; and `Scheme.IsCohenMacaulay X := IsCohenMacaulay
O_X` (Stacks, Definition 28.8.1 (02IO)). API: `isCohenMacaulay_iff_forall_satisfiesSerreS`,
`isCohenMacaulay_iff_stalks`, `isCohenMacaulay_iff_affineOpens`, `isCohenMacaulay_Spec_iff`
(agreement with §0.17 on affine schemes), `IsCohenMacaulay.of_isOpenImmersion`,
`IsCohenMacaulay.of_smooth` (smooth over a Cohen–Macaulay base), `IsCohenMacaulay.regular`. *Needs:*
§0.17; Mathlib `IsLocallyNoetherian`, `IsAffineOpen.isLocalization_stalk`.

**Checks.**
- `test_field`: `Spec k` is Cohen–Macaulay.
- `test_affinePlane`: `Spec k[x, y]` is Cohen–Macaulay.
- `Scheme.Modules.IsCohenMacaulay.test_point_on_plane`: on `Spec k[x, y]` the coherent module
  associated to `k[x, y]/(x, y)` is Cohen–Macaulay (depth `0`, support a point), while
  `k[x, y]/(x², xy)` is not.
- `test_cone`: `Spec k[x, y, z]/(xz, yz)` is not Cohen–Macaulay (by §0.17's `(S_2)` failure).

### 0.19 CM- and `(S_n)`-quasi-excellence

For a Noetherian local ring `(A, m)` with completion `Â = AdicCompletion m A`, the formal fibres of
`A` are the rings `Â ⊗_A κ(p) = Ideal.Fiber p Â` over the primes `p` of `A` (taken at every prime,
not only at `m`). Define `Scheme.IsCMQuasiExcellent X` for a locally Noetherian `X`: every formal
fibre of every local ring `O_{X,x}` is Cohen–Macaulay, and every integral closed subscheme of `X`
has a nonempty Cohen–Macaulay open subscheme; `Scheme.IsCMExcellent X`: moreover `X` is universally
catenary; `Scheme.IsSnQuasiExcellent n X`: the same with `(S_n)` in place of Cohen–Macaulay
(Česnavičius 2021, Definition 1.2 and the sentence after it, p. 2; §2.8, pp. 6–7). API:
`isLocallyNoetherian`, `isCohenMacaulay_formalFibre`, `exists_isCohenMacaulay_open`,
`isSnQuasiExcellent_of_isCMQuasiExcellent`, `isCMQuasiExcellent_iff_of_openCover`,
`IsCMQuasiExcellent.of_finiteType`. Prove `quasiExcellent_cm_sn`: quasi-excellent schemes (§0.21)
are CM- and `(S_n)`-quasi-excellent for every `n` (Česnavičius 2021, Example 1.3 (p. 2), §2.10 (p.
7)). *Needs:* §0.16, §0.17, §0.18, §0.21; Mathlib `AdicCompletion`, `IsLocalRing.maximalIdeal`,
`Ideal.Fiber`.

**Checks.**
- `IsCMExcellent.test_field`: `Spec k` is CM-excellent.
- `IsCMExcellent.test_empty`: the empty scheme is CM-excellent and `(S_n)`-quasi-excellent for every
  `n`.
- `IsSnQuasiExcellent.test_zero`: `(S_0)`-quasi-excellence is equivalent to local Noetherianity.
- Nonreducedness does not exclude Cohen–Macaulay formal fibres: `k[ε]/(ε²)` is zero-dimensional
  and Cohen–Macaulay. A negative test must exhibit failure of depth, not merely a nilpotent.

### 0.20 Japanese and Nagata rings

Define `Ring.IsN1 R` for a domain `R`: the integral closure of `R` in `FractionRing R` is a finite
`R`-module; `Ring.IsJapanese R` (N-2): for every finite extension `L` of the fraction field, the
integral closure of `R` in `L` is finite over `R`, including inseparable `L` (Stacks, Definition
10.161.1 (032F)). API: `IsJapanese.isN1`, `isJapanese_iff_isN1_of_charZero` (for Noetherian domains; Lemma 10.161.3 (032G)),
`isJapanese_iff_purelyInseparable` (it suffices to test purely inseparable `L`; Lemma 10.161.8
(032L)), `of_isIntegrallyClosed_charZero`, `IsJapanese.localization` (Lemma 10.161.5 (032I)),
`IsJapanese.of_finite_extension` (Lemma 10.161.11 (032M)), `IsJapanese.polynomial` (Lemma 10.161.13
(032O)), `isJapanese_of_dedekind_charZero` (Lemma 10.161.12 (032N)), `IsJapanese.of_complete_local`
(Lemma 10.161.15 (0333)), `IsN1.test_isIntegrallyClosed`. Define `Ring.IsUniversallyJapanese R`:
every finite-type `R`-algebra that is a domain is N-2; `Ring.IsNagata R`: `R` is Noetherian and
`R/p` is N-2 for every prime `p` (Stacks, Definition 10.162.1 (032R)); the Nagata predicate includes
Noetherianity and universally Japanese does not. API: `IsNagata.isNoetherianRing`,
`isNagata_iff_isUniversallyJapanese` (for Noetherian rings; Proposition 10.162.15 (0334)),
`IsNagata.of_finiteType` (Proposition 10.162.16 (0335)), `IsNagata.localization` (Lemma 10.162.5
(032T)), `IsNagata.quotient` (Lemma 10.162.3 (0351)), `IsNagata.of_complete_local` (Lemma 10.162.8
(032W)), `isNagata_of_field`, `IsNagata.polynomial`, `isNagata_iff_forall_isMaximal` (Lemma 10.162.2
(03GH)), and Example 10.162.17 (09E1) as `IsNagata.not_of_infinite_product`. Prove
`quasiExcellent_nagata`: quasi-excellent rings are Nagata (Stacks, Lemma 15.53.5 (07QV)). Prove
`nagata_normalization_finite`: for `X` integral and Nagata (every affine open ring Nagata), the
normalisation of `X` in a finite extension of its function field is finite over `X` (Stacks, Lemma
29.54.14 (0AVK)). *Needs:* Mathlib `integralClosure`, `IsIntegralClosure`, `FractionRing`,
`IsPurelyInseparable`, `Module.Finite`, `Algebra.FiniteType`, `IsNoetherianRing`; Tau Ceti
`TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `finite_of_injective`.

**Checks.**
- `IsJapanese.test_field`, `test_int`: fields and `ℤ` are N-2.
- `IsN1.test_isIntegrallyClosed`: every integrally closed domain is N-1 (closure equals `R`).
- `IsJapanese.test_not_japanese_dvr`: the DVR of §0.22 is N-1 (integrally closed) and not N-2.
- `IsNagata.test_field`, `test_int`: fields and `ℤ` are Nagata (`ℤ/p` is a field for `p ≠ 0`).
- `IsNagata.test_zero`: the zero ring is Nagata: Noetherian with no primes.
- `IsUniversallyJapanese.test_not_noetherian`: an infinite polynomial ring over a field is
  universally Japanese and not Noetherian, so not Nagata.

### 0.21 Regular maps, G-rings, J-2 rings, excellent rings and schemes

This subsection is the strand `Excellence` of `Suggested.lean`. Define
`GeometricallyRegular k B` for a field `k` and `k`-algebra `B`: `B` is Noetherian and `L ⊗_k B` is
regular (`IsRegularRing`) for every finite purely inseparable extension `L/k` (Stacks, Definition
10.166.2, Lemma 10.166.1), with `GeometricallyRegular.regular`, `.finite_extension` (then `L ⊗_k B`
is regular for every finite `L/k`), `.algEquiv`. Define `RegularAlgebraMap R B`: `B` is flat over `R`
and for every prime `p` the fibre `κ(p) ⊗_R B` is geometrically regular over `κ(p)` (Stacks,
Definition 15.42.1), with `.flat`, `.fibre`, `.field_iff` (for `R` a field, a regular algebra is a
geometrically regular one; Lemma 15.42.6). Prove `regular_map_completion`: regular ring maps
preserve reducedness and normality, and for a local G-ring `A` the map `A → Â` is regular
(Stacks, Lemmas 15.43.1 (07QK), 15.43.2 (0BFK), 15.43.3 (0H7S), 15.43.4 (0H7T)). Define
`regularLocus R := { p : regular R_p }` (Stacks, §15.48 opening) with `mem_regularLocus`,
`regularLocus_eq_univ` (for regular `R`), `regularLocus_ringEquiv`; it need not be open. Define
`IsGRing R`: `R` is Noetherian and for every prime `p` the canonical `R_p`-algebra
`AdicCompletion (m_p) R_p` is a regular algebra map (Stacks, Definition 15.51.1), with `.noetherian`,
`.completion_regular`, `.ringEquiv`, `IsGRing.localization`, `IsGRing.of_finiteType` (Propositions
15.51.6, 15.51.12). Define `IsJ2 R`: `R` is Noetherian and the regular locus of every finite-type
`R`-algebra is open, quantified over all finite-type algebras and not only `R` or its localisations
(Stacks, Definition 15.48.1 (3)), with `.noetherian`, `.regularLocus_open`, `.ringEquiv`,
`IsJ2.of_finiteType`, `IsJ2.localization`. Define `IsQuasiExcellentRing R := IsGRing R ∧ IsJ2 R`
(Stacks, Definition 15.53.1 (1)), with `.gRing`, `.j2`, `.noetherian`; universal catenarity is not
required. Define `IsExcellentRing R`: quasi-excellent and universally catenary in the sense of
§0.16 (Stacks, Definition 15.53.1 (2)), with `.quasiExcellent`, `.finiteType`, `.localization`
(Lemma 15.53.2). Prove `excellent_examples`: fields, `ℤ`, Dedekind domains of characteristic zero,
complete Noetherian local rings, and finite-type and localised algebras over these are excellent
(Stacks, Proposition 15.53.3 (07QW)). Define `IsQuasiExcellentScheme X`: every point has an affine
open neighbourhood whose section ring is quasi-excellent, with `.affine_iff` (every affine open),
`.locallyNoetherian`, `.iso` (Stacks, Definition 29.20.1 (1), Lemma 29.20.5); and
`IsExcellentScheme X` likewise with excellent rings, with `.affine_iff`, `.quasiExcellent`,
`.locallyNoetherian`, `IsExcellentScheme.of_finiteType`, `IsExcellentScheme.isUniversallyCatenary`
(Stacks, Definition 29.20.1 (2), Lemmas 29.20.4–29.20.5). *Needs:* §0.16, §0.20; Mathlib
`IsRegularRing`, `IsPurelyInseparable`, `Module.Flat`, `Ideal.ResidueField`, `AdicCompletion`,
`IsLocalRing.maximalIdeal`, `Algebra.FiniteType`, `IsAffineOpen`.

**Checks.**
- `GeometricallyRegular.test_field`: `k` over itself; `test_zero`: the zero `k`-algebra is
  geometrically regular; `test_dual_numbers`: `k ⋉ k` is not (not reduced); `test_inseparable`: for
  `L = k(a^{1/p})` over imperfect `k`, `L` is regular but `L ⊗_k L` is not, so `L` is not
  geometrically regular over `k`.
- `RegularAlgebraMap.test_identity`: `R` over itself; `test_zero`: `R → R/(1)`;
  `test_flat_not_regular`: `k ⋉ k` is flat over `k` but its fibre is not regular.
- `regularLocus.test_field`, `test_zero` (`Spec` of the zero ring is empty), `test_dual_numbers`
  (empty locus).
- `IsGRing.test_field`, `test_zero`, `test_complete_local` (a complete Noetherian local ring is a
  G-ring); `IsJ2.test_field`, `test_zero`, `test_singular_allowed` (`k ⋉ k` is J-2 with empty regular
  locus); `IsQuasiExcellentRing.test_field`, `test_zero`, `test_nilpotents_allowed`;
  `IsExcellentRing.test_field`, `test_zero`, `test_integers`, `test_nilpotents_allowed`,
  `test_complete_local`.
- `IsQuasiExcellentScheme.test_spec` (`Spec R` is quasi-excellent iff `R` is), `test_field`,
  `test_zero`; `IsExcellentScheme.test_spec`, `test_field`, `test_empty`, `test_nonreduced`
  (`Spec (k ⋉ k)` is excellent).

### 0.22 Two counterexamples

Prove `nonJapaneseDVR`: there is a discrete valuation ring of characteristic `p` that is regular,
universally catenary and not Japanese (Stacks, Example 10.119.5 (00PB): `k[[t]]`-like rings whose
fraction field has an inseparable extension with non-finite integral closure); and
`nagata_nonCatenary`: Nagata's Noetherian local domain that is not catenary (Stacks, Examples,
Section 110.19 (02JE)). Both are recorded as `example`s that the predicates of §§0.16 and 0.20
reject. *Needs:* §0.16, §0.20.

### 0.23 Universal homeomorphisms

Define `IsUniversalHomeomorphism f` for `f : X → Y`: for every `Y' → Y` the base change
`X ×_Y Y' → Y'` is a homeomorphism of underlying spaces, as Mathlib's
`(topologically IsHomeomorph).universally` (Stacks, Definition 29.46.1 (04DD)); no finiteness
hypothesis. API: `isUniversalHomeomorphism_eq` (the `MorphismProperty` form),
`Scheme.Hom.homeomorphOfIsUniversalHomeomorphism`, `isStableUnderBaseChange`,
`isStableUnderComposition`, `of_isIso`, `of_isThickening` (thickenings of §4.1 are universal
homeomorphisms), `IsUniversalHomeomorphism.surjective`, `.universallyClosed`,
`.universallyInjective`. Prove `universalHomeomorphism_criteria`: `f` is a universal
homeomorphism iff it is integral, universally injective and surjective (Stacks, Lemma 29.46.5
(04DF)). The topological invariance of the small étale site under a universal homeomorphism is
FrobeniusGeometry Layer 6, which consumes this subsection. *Needs:* Mathlib
`MorphismProperty.universally`, `AlgebraicGeometry.topologically`, `UniversallyClosed`,
`IsIntegralHom`.

**Checks.**
- `not_isUniversalHomeomorphism_Spec_F_p2`: `Spec 𝔽_{p²} → Spec 𝔽_p` is a homeomorphism but not a
  universal one (its self-product has two points).
- `isUniversalHomeomorphism_cusp_normalization`: `Spec k[t] → Spec k[t², t³]` is a universal
  homeomorphism (integral, universally injective, surjective).
- `not_isUniversalHomeomorphism_node_normalization`: for `char k ≠ 2`, `Spec k[t] → Spec k[t² − 1,
  t³ − t]` is not universally injective (two points over the node).
- `isUniversalHomeomorphism_id`: identities and thickenings are universal homeomorphisms.

### 0.24 Perfect schemes and perfection

Let `p` be a prime. The absolute Frobenius `F_X : X → X` of a scheme over `𝔽_p` is FrobeniusGeometry
Layer 1's. Define `Scheme.IsPerfect X` for `X` over `𝔽_p`: `F_X` is an
isomorphism (Bhatt–Scholze 2017, Definitions 3.1, 3.2, p. 10). API: `isPerfect_iff_perfectRing`
(affine-locally, `PerfectRing` of the section rings), `IsPerfect.isReduced`, `IsPerfect.pullback`
(fibre products of perfect schemes over a perfect scheme), `IsPerfect.of_etale` (étale over a
perfect scheme), `IsPerfect.of_isOpenImmersion`. Define `Scheme.perfection X` for an `𝔽_p`-scheme:
the limit of `⋯ → X → X → X` along `F_X`, affine-locally `Spec (PerfectClosure A p)`, with
`perfection.toScheme : X^perf → X` and `perfection_isPerfect` (Bhatt–Scholze 2017, Definition 3.1,
proofs of Lemma 3.4 and Proposition 3.13, pp. 11, 13). Prove `perfection_universalHomeomorphism`:
`X^perf → X` is a universal homeomorphism, and perfection is right adjoint to the inclusion of
perfect schemes, so `Hom(Y, X^perf) = Hom(Y, X)` for perfect `Y` and `X ↦ X^perf` is an equivalence
of small étale sites (Bhatt–Scholze 2017, proof of Lemma 3.4, first sentence, p. 11). Prove
`perfection_reflects`: a morphism of `𝔽_p`-schemes is quasi-compact, quasi-separated, separated,
affine, an immersion, a closed immersion, integral, universally closed, surjective, respectively,
iff its perfection is (Bhatt–Scholze 2017, Lemma 3.4 (i)–(vii), pp. 10–11), and
`perfection_preserves`: perfection preserves étale, finite étale and flat morphisms and commutes
with étale base change (Lemma 3.4 (viii)–(xii)). *Needs:* §0.23; FrobeniusGeometry Layer 1; Mathlib
`PerfectRing`, `PerfectClosure`, `IsReduced`, `Limits`.

**Checks.**
- `isPerfect_Spec_perfection_polynomial`: `Spec (PerfectClosure (𝔽_p[t]) p)` is perfect.
- `isPerfect_empty`: the empty scheme is perfect.
- `not_isPerfect_affineLine`: `𝔸¹_{𝔽_p}` is not perfect (`t` has no `p`-th root).
- `perfection_affineLine`: `(𝔸¹)^perf = Spec 𝔽_p[t^{1/p^∞}]`, with `perfection.toScheme` a
  universal homeomorphism that is not an isomorphism.

### 0.25 Perfectly finitely presented and perfectly proper morphisms

Define `RingHom.PerfectlyFinitePresentation g` for `g : B → A` between perfect `𝔽_p`-algebras: there
is a finitely presented `B`-algebra `A_0` with `(A_0)^perf ≅ A` over `B`; and
`PerfectlyFinitelyPresented f` for `f : X → Y` between quasi-compact quasi-separated perfect schemes:
affine-locally on `Y` and then on `X`, the ring maps are pfp (Bhatt–Scholze 2017, Definition 3.10
and Proposition 3.11 (last sentence), p. 12). API: `PerfectlyFinitelyPresented.perfection` (the
perfection of a finitely presented morphism is pfp), `.comp`, `.of_etale`, `.baseChange`,
`.of_isOpenImmersion`. Prove `pfp_characterisations`: pfp is local on source and target, stable
under composition and base change, and every pfp morphism of affine perfect schemes is a cofiltered
limit of finitely presented ones (Bhatt–Scholze 2017, Proposition 3.11, p. 12); and `pfp_models`:
every pfp morphism `X → Y` is the perfection of a finitely presented morphism `X_0 → Y_0` of
`𝔽_p`-schemes with `Y = Y_0^perf` (Proposition 3.13, p. 13). Define `PerfectlyProper f`: pfp,
separated and universally closed (Bhatt–Scholze 2017, Definition 3.14, p. 13), with `.perfection`,
`.iff_model` (`f` is perfectly proper iff some, equivalently every, finitely presented model is
proper), `.comp`, `.baseChange`. Prove `perfect_valuative_criterion`: a pfp separated morphism of
perfect schemes is perfectly proper iff it satisfies the valuative criterion with perfect valuation
rings (Zhu 2017, Proposition A.20 and proof, p. 51). *Needs:* §0.24; Mathlib
`LocallyOfFinitePresentation`, `QuasiCompact`, `IsSeparated`, `UniversallyClosed`, `ValuationRing`.

**Checks.**
- `perfection_polynomial`: `ZMod p → (Polynomial (ZMod p))^perf` is pfp with model `𝔽_p[t]`.
- `PerfectlyFinitelyPresented.id`: the identity of `Spec k`, `k` perfect, is pfp.
- `not_perfectlyFinitelyPresented_infinite`: `ZMod p → (MvPolynomial ℕ (ZMod p))^perf` is not pfp
  (no finitely presented model: the perfection of a finitely presented algebra has finite
  transcendence degree).
- `PerfectlyProper.projectiveSpace`: `(ℙ¹_{𝔽_p})^perf → Spec 𝔽_p` is perfectly proper.
- `PerfectlyProper.id`: isomorphisms in `Perf` and pfp closed immersions are perfectly proper.
- `not_perfectlyProper_affineLine`: `(𝔸¹_k)^perf → Spec k` is pfp and separated but not universally
  closed.

### 0.26 Perfectly smooth morphisms, Witt schemes and weakly normal schemes

Define `PerfectlySmoothAt f x` for `f : X → Y` of perfect `𝔽_p`-schemes, `x ∈ X`, `d ≥ 0`: there are
étale `u : U → X` with `x ∈ u(U)`, étale `v : V → Y`, `h : U → V` with `v ∘ h = f ∘ u`, and an étale
`h' : U → V ×_{𝔽_p} (𝔸^d_{𝔽_p})^perf` whose composite with the projection is `h`;
`PerfectlySmoothOfRelativeDimension d f` at every point; and `WeaklyPerfectlySmoothOfRelativeDimension d
f`: `f` is the perfection of a morphism smooth of relative dimension `d` after an étale base change
(van Hoften 2024, §2.1.2, (2.1.2), p. 8; Definition 2.1.9 and the definition after Lemma 2.1.11,
pp. 10–11). API: `PerfectlySmoothOfRelativeDimension.perfection` (the perfection of a smooth
morphism of relative dimension `d` is perfectly smooth of relative dimension `d`), `etale_iff` (`d =
0` is étale), `comp`, `baseChange`, `weaklyPerfectlySmooth_of_perfectlySmooth`. Prove
`perfectlySmooth_properties`: perfectly smooth morphisms are pfp, flat and open, their fibres have
dimension `d`, and a weakly perfectly smooth morphism need not be perfectly smooth (van Hoften 2024,
Example 2.1.3, p. 8). Define `wittScheme n X` for a perfect `𝔽_p`-scheme `X` and `n ≥ 1`: the scheme
with underlying space `|X|` and structure sheaf `W_n(O_X)`, with `wittScheme_affine` (`Spec W_n(A)`)
and `wittScheme_one` (`W_1 X = X`) (Bhatt–Scholze 2017, Section 4 opening, p. 15). Define
`Scheme.IsWeaklyNormal X` for a reduced scheme of finite type over a perfect field `k` of
characteristic `p`: every finite birational universal homeomorphism `Y → X` with `Y` reduced is an
isomorphism (Zhu 2017, §A.2.1, p. 49). API: `isWeaklyNormal_iff_pClosed` (`O_X` is closed under
`p`-th roots of elements of its total fraction ring that lie in the normalisation), `of_normal`,
`restrict` (to opens). Prove `weaklyNormal_model` (Yanagihara's criterion): a pfp perfect scheme over
`k` has a unique weakly normal finitely presented model, functorial in pfp morphisms (Zhu 2017,
Proposition A.15 with (A.2.1), (A.2.2), Corollary A.16, p. 50). Prove
`frobenius_factors_through_universalHomeomorphism`: for `g : Y → X` a finite universal
homeomorphism of `𝔽_p`-schemes of finite type, some power of `F_X` factors through `g`
(Bhatt–Scholze 2017, proof of Proposition 11.41, p. 53). *Needs:* §0.23, §0.24, §0.25;
FrobeniusGeometry Layer 1; Mathlib `Etale`, `AffineSpace`, `WittVector`, `IsReduced`, `IsFinite`.

**Checks.**
- `perfectlySmooth_affineSpace`: `(𝔸²)^perf → (𝔸¹)^perf`, the perfection of a coordinate
  projection, is perfectly smooth of relative dimension `1`.
- `perfectlySmooth_id`: identities and étale morphisms of perfect schemes are perfectly smooth of
  relative dimension `0`.
- `not_perfectlySmooth_origin`: the closed immersion `Spec 𝔽_p → (𝔸¹)^perf` is not perfectly
  smooth of any dimension (not flat).
- `wittScheme_point`: `W_n(Spec 𝔽_p) = Spec ℤ/p^n`.
- `not_isWeaklyNormal_cusp`: `Spec k[t², t³]` is not weakly normal (`t` is a `p`-th root of `t^p`
  in the normalisation when `p = 2, 3`; in general the normalisation is a finite birational
  universal homeomorphism).
- `isWeaklyNormal_node`: for `p` odd, `Spec k[t² − 1, t³ − t]` is weakly normal.
- `isWeaklyNormal_affineSpace`: `𝔸^n_k` and `Spec k` are weakly normal (normal).

### 0.27 Flat base change of annihilators and cokernels

These are the strands `FlatAnnihilator` and `QuotientBaseChange` of
`Suggested.lean`. For `R → S` flat and `M` a finite `R`-module, prove
`annihilator_flat_baseChange`: `Ann_S(S ⊗_R M) = Ann_R(M) · S` (Stacks, Lemma 10.40.4, complete
statement), through `ideal_map_eq_tensor_range` (the extended ideal is the image of `S ⊗ I`),
`mem_map_kernel_iff` (membership in an extended kernel under flatness),
`annihilator_eq_generator_kernel` (the annihilator of a finitely generated module is the
intersection of the kernels of `r ↦ r m_i`), `annihilator_flat_baseChange_generators`,
`element_annihilator_flat_baseChange` (the elementwise case `Ann(s ⊗ m)`),
`annihilator_map_le_baseChange` (the inclusion that holds without flatness) and
`ideal_map_iInf_finite` (flat base change commutes with finite intersections of ideals). For a
submodule `Q ⊆ M`, prove `quotient_baseChange_square` (the canonical square
`S ⊗ (M/Q) ≅ (S ⊗ M)/(S ⊗ Q)`, Mathlib's `tensorQuotientEquiv`), `quotient_baseChange_annihilator`
and `quotient_annihilator_flat_baseChange`, `baseChange_range`, `baseChange_le_comap`,
`quotient_baseChange_naturality`; and for a map `f : M → N` of finite modules,
`cokernel_annihilator_flat_baseChange` (`Ann(coker (S ⊗ f)) = Ann(coker f) · S`; Stacks, Lemma
10.40.4), `cokernelBaseChangeEquiv : S ⊗ coker f ≃ coker (S ⊗ f)` with `_tmul`, `_symm_mk_tmul` and
`cokernel_baseChange_square` (Stacks, Lemma 10.12.10). *Needs:* Mathlib `Module.Flat`,
`Module.annihilator`, `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`, `Submodule.baseChange`.

**Checks.**
- `empty_family`: the annihilator of the module generated by the empty family is `⊤`.
- `identity_extension`: for `S = R` the formula is the identity.
- `zero_module`, `zero_element`: `Ann 0 = ⊤` on both sides.
- `nonreduced_element`, `nonreduced_diagonal`: in `ℤ/4`, `Ann(2) = (2)` and the formula holds
  for `ℤ/4 → ℤ/4 × ℤ/4`.
- `nonflat_element_failure`: for `ℤ/4 → ℤ/2`, the element `2 ∈ ℤ/4` has annihilator
  `(2)`, which extends to zero. Its image in `ℤ/2 ⊗_{ℤ/4} ℤ/4` is zero, whose
  annihilator is the unit ideal. This is the elementwise failure without flatness.
- `identity_cokernel`, `zero_map_scalar`, `inverse_representative`, `top_quotient_annihilator`,
  `zero_ring_cokernel`: the cokernel comparison on `f = id`, `f = 0`, its inverse on a
  representative, `Q = ⊤`, and over the zero ring.
- `nonflat_injective_map_collapses`: for `ℤ → ℤ/2` and `f = 2 : ℤ → ℤ`, `ℤ/2 ⊗ f = 0`, so the
  cokernel comparison is an isomorphism `ℤ/2 ≃ ℤ/2`; injectivity of the original map
  does not survive base change. The annihilator formula happens to hold in this example.

### 0.28 Ideal sheaves: the quotient-comparison API

This subsection is the strand `IdealPullback` of `Suggested.lean`,
organised around one canonical comparison API; every other statement of the strand is a
characterising `_mk` lemma or a coherence lemma of the declarations named here. Fix a scheme `Y`,
`I : Y.IdealSheafData` and `f : X → Y`. Define `preimageFunctor g` for `g` affine (the functor
`affineOpens Z ⥤ affineOpens Y`, `U ↦ g⁻¹ U`), `comapObjIso I f U` (for `U` an affine open of `Y`,
`(I.comap f).ideal (f⁻¹U) ≅ I(U) · Γ(X, f⁻¹U)` when `f` is affine; Stacks, Lemma 26.17.6 (1)) with
`comapObjIso_inclusion`, `_mk`, `_inv_mk`, `_naturality`; `ideal_comap_top`, `comap_restrict`,
`ideal_restrict_top`, `ideal_comap_affineOpen`, `ideal_comap_of_isAffineHom`. Define the
**image-ideal quotient presheaf** `quotientPresheaf I f : Y.affineOpensᵒᵖ ⥤ CommRingCat`,
`U ↦ Γ(X, f⁻¹U) / I(U)·Γ(X, f⁻¹U)`, with restriction `quotientRestriction` (`_mk`, `_id`, `_comp`),
`quotientPresheaf_obj`, `quotientPresheaf_map`, and `comapObjNatIso I f` (for affine `f`, the
natural isomorphism with the presheaf of sections of `(I.comap f).subscheme`). Define the
**section-kernel quotient presheaf** `allOpenQuotient I : X.Opensᵒᵖ ⥤ CommRingCat`,
`U ↦ Γ(X, U) / ker(Γ(X, U) → Γ(V(I), U ∩ V(I)))`, with `allOpenRestriction` (`_mk`, `_id`, `_comp`),
`allOpenQuotient_obj`, `_map` (Stacks, Example 26.4.3). Define the three canonical comparisons:
`quotientToClosedNatTrans I f : quotientPresheaf I f ⟶ (sections of (I.comap f).subscheme)` with
`_app`, `quotientToClosed_mk`, `_unique`, `_naturality`, `_injective`, `_surjective`, and
`quotientToClosedNatTrans_isIso` for affine `f`; `quotientToKernelNatTrans I f : quotientPresheaf
I f ⟶ allOpenQuotient (I.comap f) ∘ preimage` with `_app`, `quotientToKernel_mk`, `_surjective`
(always), `_injective_iff`, `_bijective` and `_factor`; `allOpenSheafComparison I : sheafify
(allOpenQuotient I) ⟶ i_* O_{V(I)}` with `_factor`, `_mk`, `_unique`, `_isIso`, through
`allOpenToClosed` with `_mk`, `_injective`, `_affine_bijective`, `_affine_agreement`,
`_locally_surjective`, `_locally_injective`; and `quotientToSheafNatTrans I f` (image-ideal
quotient to the sheafified quotient) with `_mk`, `_factor`, `_unique`, `_app_isIso`,
`_injective_iff`, `_surjective_iff` and `_isIso` for affine `f`. Define the **composite comparison**
`quotientCompNatIso I f g : quotientPresheaf I (f ≫ g) ≅ (preimageFunctor g).op ⋙ quotientPresheaf
(I.comap g) f` for `g` affine, from `extendedIdeal_comp` and `quotientCompIso` (`_mk`, `_inv_mk`,
`_naturality`), with its coherence `quotientCompNatIso_id_left` (Stacks, Lemma 26.17.6, the left
unit), `_id_right`, `_assoc`, `_eqToIso_mk` (transport along equal ideals) and the three transport
lemmas `quotientCompNatIso_kernel`, `_closed`, `_sheaf`: the composite comparison is carried by the
three canonical natural transformations to the corresponding composite isomorphisms of kernel
quotients, closed-subscheme sections and sheafified quotients (there are no separate composite
isomorphisms for those three: each is the transport, and its `_mk`, `_naturality`, unit and
associativity laws are consequences of the ones above). Uniqueness lemmas `quotientPresheaf_hom_ext`
and `allOpenSheafComparison_unique` give extensionality on representatives. *Needs:* Mathlib
`Scheme.IdealSheafData`, `IdealSheafData.comap`, `subscheme`, `subschemeι`, `IsAffineHom`,
`Ideal.quotientMap`, `Ideal.quotEquivOfEq`, `sheafify`.

**Checks.**
- `comapObjIso_affine`: for `X, Y, Z` affine the comparison is Mathlib's `Ideal.map` identification.
- `quotientPresheaf_identity`: for `f = 𝟙 Y` and `I`, `quotientPresheaf I (𝟙 Y)` is `U ↦ Γ(U)/I(U)`
  and `quotientToClosedNatTrans` is an isomorphism.
- `quotientPresheaf_not_sheaf`: for `Y = ℙ¹_k`, `I` the ideal of two distinct rational points and
  `f = 𝟙`, the global value of the section-kernel presheaf is `Γ(ℙ¹, O)/ker = k` while the sheaf
  `i_* O_{V(I)}` has global sections `k × k`; `allOpenToClosed` is injective but not surjective on
  `ℙ¹`, and `allOpenSheafComparison` is an isomorphism only after sheafification.
- `quotientToKernel_not_injective`: `quotientToKernelNatTrans` is injective exactly when the
  extended ideal equals the kernel of restriction to the pulled-back closed subscheme, which holds
  for affine `f` (`quotientToKernel_bijective`) and fails for the open immersion
  `f : 𝔸² ∖ {0} → 𝔸²` with `I = (x, y)`: by Hartogs `Γ(X, O) = k[x, y]`, the extended ideal is
  `(x, y)` with quotient `k`, while `V(x, y) ×_Y X` is empty, so the section kernel is everything
  and the quotient is `0`.
- `quotientCompNatIso_id_left_check`: for `f = 𝟙` the composite comparison is the transport along
  `𝟙 ≫ g = g` followed by the componentwise identification of equal extended ideals.
- `allOpenSheafComparison_isIso_check`: for `I = ⊤` the sheafified quotient is the zero sheaf and
  `V(I) = ∅`; for `I = ⊥` it is `O_X` and `V(I) = X`.

### Examples

The acceptance instances of Layer 0: the henselization of `ℤ_{(p)}` is the algebraic `p`-adic
integers (§0.13); `ℤ` and every field are excellent, Nagata, universally catenary and Cohen–Macaulay
(§§0.16–0.21); the cusp normalisation is a universal homeomorphism and the node normalisation is not
(§0.23); `(ℙ¹_{𝔽_p})^perf` is perfectly proper and `(𝔸¹)^perf` is not (§0.25); Hartogs holds on
`𝔸² ∖ {0}` and fails on `𝔸¹ ∖ {0}` (§0.6).

### Dependencies

Mathlib and Tau Ceti as listed under supplier contracts; AlgebraicVectorBundles L0A–L2A (§§0.1–0.3);
StableReduction Layer 2 (§0.3); JacobianChallenge Layer B (§§0.4–0.6); ModularCurves 4D (§0.10);
FrobeniusGeometry Layer 1 (§§0.24–0.26). No later layer of this roadmap.

## Layer 1: descent, algebraic spaces and stacks

Descent and the two-categorical geometry built on it. Mathlib supplies the fpqc, fppf and étale
topologies with subcanonicity, pseudofunctor descent (`DescentData`, `IsPrestack`, `IsStack`),
relative representability with the diagonal criterion and comonadicity of extension of scalars
along faithfully flat maps; Tau Ceti supplies fppf quotients of affine groups, faithfully flat
descent of Hopf-algebra points, line bundles and Galois descent of vector spaces; ModularCurves 0E
supplies effective descent of affine and finite locally free schemes and StableReduction Layer 2
polarised descent. Layer 1 proves fpqc descent of quasi-coherent modules as a stack and gluing of
sheaves; builds the category of algebraic spaces with étale-equivalence-relation quotients,
presentations, points, étale-local and separation properties and the small étale site; group spaces,
actions, groupoids, stabilizers, torsors and their classes, contracted products, twisting,
categorical and geometric quotients and Artin's bootstrap; stacks in groupoids, stackification,
2-fibre products, representable morphisms, algebraic and Deligne–Mumford stacks, inertia, quotient and
root stacks and quasi-coherent modules on stacks; moduli functors with fine and coarse moduli
spaces, Keel–Mori and tame stacks; and the Galois gerbs of Langlands–Rapoport.

**Conventions of this layer.** Presheaves are functors `Scheme.{u}ᵒᵖ ⥤ Type u` (`SchemePresheaf`);
where the Stacks Project bounds a site by a cardinal, the universe takes its place. Algebraic spaces
over `S` are algebraic spaces with a map to `h_S`. Fibres of stacks need not be groupoids; stacks in
groupoids are required where the source requires them. A morphism of spaces or stacks is proper when
it is separated, of finite type and universally closed on the topological spaces of §1.7.
`Cat`-valued pseudofunctors on `LocallyDiscrete Scheme.{u}ᵒᵖ` are `SchPseudofunctor`. Cohomology and
site comparisons are Layer 2; Picard schemes are Layer 3; formal geometry is Layer 4; banded gerbes
and their `H²` classification are AlgebraicModuliForArithmeticGeometry; perfect-site variants are
GeometricSatakeAndFusion.

### 1.1 Descent of quasi-coherent modules and of sheaves

Define `Descent.qcohPseudofunctor : SchPseudofunctor`, `T ↦ QCoh(T)` with pullback, with its
coherence isomorphisms (Stacks, Lemma 17.10.4 (01BG)). Prove `qcoh_fpqc_descent`: it is a stack for
Mathlib's `fpqcTopology` (descent data for quasi-coherent modules along an fpqc covering are
effective and morphisms descend), by Mathlib's comonadicity of extension of scalars along a
faithfully flat ring map in the affine case and gluing in general (Stacks, Proposition 35.5.2
(023T)). Prove `sheaf_stack`: for a site `C`, the pseudofunctor `U ↦ Sh(C/U)` is a stack, and so is
`U ↦ Sh(C/U, Ab)` (Stacks, Lemmas 7.26.1 (04TQ), 7.26.4 (04TR)). *Needs:* Mathlib `Pseudofunctor`,
`IsStack`, `DescentData`, `fpqcTopology`, `ModuleCat.Descent`.

**Checks.**
- `qcohPseudofunctor_test_affine`: over `Spec R → Spec S` faithfully flat, descent data on an
  `R`-module are the comodule structures of Mathlib's `ModuleCat.Descent`.
- `qcohPseudofunctor_test_not_groupoid`: `QCoh(T)` is not a groupoid (the zero map `O → O` is not
  an isomorphism), so this stack is not a stack in groupoids (§1.18).
- `sheaf_stack_test_zariski`: for the Zariski site of a scheme, sheaves glue along open covers.

### 1.2 Fppf descent of quasi-finite morphisms and of algebraic spaces

Prove `quasiFiniteDescent`: for an fppf sheaf `F` with a map `p : F → h_S` and an fppf covering
`{S_i → S}` such that every base change `F ×_S S_i → S_i` is representable by a separated locally
quasi-finite morphism of schemes, `p` is representable by a separated locally quasi-finite morphism
(Stacks, Lemma 37.57.1 (02W8)). Prove `spaceFppfDescent`: an fppf sheaf over `S` that is an
algebraic space fppf-locally on `S` is an algebraic space (Stacks, Lemmas 80.11.1 (04SK), 80.11.3
(0ADV)). *Needs:* §1.3; Mathlib `Presheaf.IsSheaf`, `MorphismProperty.presheaf`, `LocallyQuasiFinite`,
`IsSeparated`.

### 1.3 Representable diagonals, étale atlases and the algebraic-space predicate

This subsection is the strand `Spaces` of `Suggested.lean`. For
`F : SchemePresheaf`, define `RepresentableDiagonal F`: the diagonal `F → F × F` is relatively
representable with respect to `yoneda` (Mathlib `Functor.relativelyRepresentable`); `EtaleAtlas F U
a` for a scheme `U` and `a : h_U → F`: `a` is relatively representable and every base change along
`h_T → F` is an étale surjective morphism of schemes (`MorphismProperty.presheaf` for `Etale` and
`Surjective`); `IsAlgebraicSpace F`: `F` is a sheaf for `fppfTopology`, has representable diagonal
and admits an étale atlas (Stacks, Definition 65.6.1 (025Y), Lemma 65.6.2). API:
`RepresentableDiagonal.of_scheme` (every `h_X`, without quasi-separatedness),
`RepresentableDiagonal.iso`, `RepresentableDiagonal.from_scheme` (every `h_X → F` is relatively
representable when `F` has representable diagonal), `EtaleAtlas.representable`, `.etale`,
`.surjective`, `.yoneda_iff` (for `F = h_X`, `EtaleAtlas h_X U (h f)` iff `f` is étale and
surjective), `IsAlgebraicSpace.sheaf`, `.diagonal`, `.atlas`, `.of_scheme`, `.iso`; and the
remaining lemmas of the strand: `IsAlgebraicSpace.diagonal_locallyQuasiFinite` (the diagonal of an
algebraic space is representable by locally quasi-finite separated monomorphisms of schemes;
Mathlib's `relativelyRepresentable.of_diag`, `diag_iff`, `respectsIso`,
`MorphismProperty.relative.rep`, `relative_map_iff` are the helper lemmas),
`IsAlgebraicSpace.of_isIso_atlas`,
`EtaleAtlas.comp` (an étale surjective scheme map onto an atlas is an atlas), `EtaleAtlas.pullback`
and `isAlgebraicSpace_of_etale_cover` (fppf-local nature, used by §1.2). *Needs:* Mathlib
`Functor.relativelyRepresentable`, `yoneda`, `MorphismProperty.presheaf`, `Etale`, `Surjective`,
`Presheaf.IsSheaf`, `fppfTopology`.

**Checks.**
- `RepresentableDiagonal.test_field`, `test_empty`, `test_nonreduced`: `h_{Spec k}`, `h_∅` and
  `h_{Spec (k ⋉ k)}` have representable diagonal.
- `EtaleAtlas.test_identity`, `test_empty_identity`: the identity of `h_X` is an atlas for every
  `X`, including the empty scheme.
- `EtaleAtlas.test_empty_not_cover`: no transformation `h_∅ → h_{Spec k}` is an atlas (not
  surjective).
- `IsAlgebraicSpace.test_field`, `test_empty`, `test_nonreduced`, `test_arbitrary_scheme`: `h_X` is
  an algebraic space for every scheme `X`.
- `IsAlgebraicSpace.test_not_sheaf`: the presheaf quotient of `h_{Spec L}` by `Gal(L/K)` for a
  quadratic Galois extension is not an fppf sheaf, hence not an algebraic space, although it has
  representable diagonal and an étale atlas.

### 1.4 The category of algebraic spaces

Define `AlgSpace` as the full subcategory of `SchemePresheaf` on `IsAlgebraicSpace`, with
`AlgSpace.toPresheaf`, the fully faithful `AlgSpace.ofScheme : Scheme ⥤ AlgSpace`, the terminal
object `h_{Spec ℤ}` and initial object `h_∅`, and `AlgSpace.overEquiv S`: algebraic spaces over `h_S`
are the fppf sheaves on `Over S` satisfying `IsAlgebraicSpaceOver S` (Stacks, Definition 65.6.1).
*Needs:* §1.3; Mathlib `ObjectProperty.FullSubcategory`, `Over`.

**Checks.**
- `AlgSpace.test_galois_endomorphisms`: for a quadratic Galois extension `K/ℚ`, the
  `ℚ`-endomorphisms of `h_{Spec K}` are the two Galois automorphisms (full faithfulness).
- `AlgSpace.test_terminal`: `Hom(F, h_{Spec ℤ})` is a point for every `F`.
- `AlgSpace.test_initial`: `Hom(h_∅, F)` is a point and `Hom(h_{Spec k}, h_∅)` is empty.

### 1.5 Étale equivalence relations and the quotient sheaf

For schemes (or algebraic spaces) `R, U` over `S`, a pre-relation is a morphism `j = (t, s) : R → U
×_S U`. Define `IsEquivRel s t`: `j` is a monomorphism and for every scheme `T` the image of `R(T)` in
`U(T) × U(T)` is an equivalence relation; `EtaleEquivRel s t`: an equivalence relation with `s` and
`t` étale (Stacks, Definition 39.3.1 (022P)). API: `EtaleEquivRel.refl`, `.symm`, `.trans` (the
diagonal, inverse and composition morphisms as data, `e : U → R`, `i : R → R`, `c : R ×_U R → R`),
`EtaleEquivRel.restrict` along an étale `U' → U` (the pullback relation `R ×_{U×U} (U'×U')`),
`EtaleEquivRel.ofAtlas` (the kernel pair of an étale atlas of an algebraic space, §1.6). Define
`quotientSheaf s t : Sheaf fppfTopology (Type u)`, the fppf sheafification of the presheaf
coequaliser `T ↦ U(T)/R(T)` of any pre-relation (Stacks, Definition 39.20.1 (02VG)), with
`quotientSheaf.π : h_U → U/R`, `quotientSheaf.desc` (the universal property: invariant maps to fppf
sheaves factor uniquely), `quotientSheaf.kernelPair` (for an equivalence relation, `R = h_U ×_{U/R}
h_U`; Lemma 39.20.3 (03C5)), `quotientSheaf.represented_of` (if `q : U → M` is invariant,
`h_U → h_M` is fppf locally surjective and `R → U ×_M U` is fppf locally surjective, then `U/R ≅ h_M`;
Lemma 39.20.6 (02VH)) and `quotientSheaf.restrict`: for an **equivalence relation** `(s, t)` and an
fppf covering `g : U' → U`, the pulled-back equivalence relation `R' = R ×_{U×U} (U'×U')` on `U'`
has `U'/R' ≅ U/R`. The equivalence-relation hypothesis is essential: the restriction statement is
false for a pre-relation (`test_restrict_prerelation_fails` below), because the pre-relation on `U'`
must also identify the two preimages of a point of `U`. *Needs:* §1.3; Mathlib `Etale`,
`Presheaf.IsLocallySurjective`, `sheafify`, `pullback`.

**Checks.**
- `EtaleEquivRel.test_diagonal`: the diagonal `U → U ×_S U` is an étale equivalence relation.
- `EtaleEquivRel.test_fold`: the kernel pair of the fold map `U ⊔ U → U` is an étale equivalence
  relation on `U ⊔ U`.
- `EtaleEquivRel.test_folded_line`: for `char k ≠ 2`, `R = Δ ⊔ Γ ⊆ 𝔸¹ × 𝔸¹` with
  `Γ = {(x, −x) : x ≠ 0}` is an étale equivalence relation on `𝔸¹_k` whose projections are not
  isomorphisms.
- `EtaleEquivRel.test_full_relation_not_etale`: for `U = 𝔸¹_k`, `R = U × U` is an equivalence
  relation whose projections are not étale.
- `EtaleEquivRel.test_double_diagonal`: `(𝟙 ⊔ 𝟙, 𝟙 ⊔ 𝟙) : U ⊔ U → U × U` is not a monomorphism, so
  not an equivalence relation.
- `quotientSheaf.test_diagonal`: `U/Δ ≅ h_U`.
- `quotientSheaf.test_swap`: for `U = Spec k ⊔ Spec k` and the swap relation, `U/R ≅ h_{Spec k}`.
- `quotientSheaf.test_sheafification_needed`: for `L/K` quadratic Galois with `σ` **the nontrivial
  automorphism** of `Spec L` over `Spec K` (`σ ≠ 𝟙`, so `σ² = 𝟙` and `σ` generates the Galois
  group), `Spec L` has no `K`-point over `K` but the quotient sheaf of the relation generated by `σ`
  has one: the presheaf quotient is not a sheaf.
- `quotientSheaf.test_restrict_prerelation_fails`: for `U = Spec k`, the empty pre-relation
  `R = ∅` and the covering `U' = U ⊔ U → U`, the pulled-back pre-relation on `U'` is empty and
  `U'/∅ = h_{U'}` is two points while `U/∅ = h_U` is one; `quotientSheaf.restrict` must require an
  equivalence relation.
- `quotientSheaf.test_hopf_compat`: restricted to affine `R`-schemes, the quotient sheaf of an
  affine group by a normal closed subgroup `V(I)` is Tau Ceti's `CommHopfAlgCat.fppfQuotientSheaf`.

### 1.6 Quotients by étale equivalence relations and presentations

Prove `etaleQuotientTheorem`: for an étale equivalence relation `(s, t)` on a scheme `U`, the
quotient sheaf `U/R` is an algebraic space and `π : h_U → U/R` is an étale atlas, with `R` its
kernel pair (Stacks, Theorem 65.10.5 (02WW), Lemma 65.10.4 (0265)). Prove `spacePresentation`: every
algebraic space `F` with an étale atlas `U → F` is `U/R` for the étale equivalence relation
`R = U ×_F U` (Stacks, Lemma 65.9.1 (0262), Definition 65.9.3 (0263)). *Needs:* §1.3, §1.5.

**Checks.**
- `etaleQuotient_test_fold`: `(U ⊔ U)/(fold kernel pair) ≅ h_U`.
- `etaleQuotient_test_folded_line`: the folded line of §1.12 is `𝔸¹/(Δ ⊔ Γ)`.
- `spacePresentation_test_scheme`: for `X` a scheme with the identity atlas, the presentation is
  `(X, Δ)`.

### 1.7 Points of an algebraic space

Define `points F : TopCat` for an algebraic space `F`: equivalence classes of morphisms `Spec K → F`
from spectra of fields, two being equivalent when they factor through a common `Spec K''`, with the
topology for which the image of an étale atlas is a quotient map (Stacks, Definitions 66.4.1
(03BU), 66.4.7 (03BY), Lemma 66.4.8 (03BZ)); `points_map` for morphisms; `points_ofScheme`
(`|h_X| = |X|`); `points_atlas_surjective` (an étale atlas is surjective and open on points);
`opensEquiv` (open subspaces of `F`, the representable open immersions into `F`, correspond to the
opens of `|F|`); `points_pullback` (the map `|F ×_H G| → |F| ×_{|H|} |G|` is surjective). *Needs:*
§1.3, §1.6; Mathlib `TopCat`, `Scheme.residueField`.

**Checks.**
- `points.test_field`: `|h_{Spec k}|` is one point.
- `points.test_galois`: for `L/K` quadratic, `|h_{Spec L}|` is one point although `Spec L` has two
  `K`-automorphisms.
- `points.test_folded_line`: the closed points of the folded line over an algebraically closed
  field are the origin and the pairs `{x, −x}`, `x ≠ 0`.
- `points.test_no_residue_field`: the generic point of `𝔸¹_ℚ/ℤ` (§1.12) is represented by no
  monomorphism from the spectrum of a field.

### 1.8 Fibre products and étale-local properties of morphisms

Prove `isAlgebraicSpace_pullback`: fibre products of algebraic spaces are algebraic spaces, with
`AlgSpace.pullbackObj`, `pullbackFst`, `pullbackSnd`, `ofScheme_preservesPullback`, and
`ofScheme_relativelyRepresentable` (every `h_U → F` is relatively representable); chart products:
for atlases `U → F`, `V → G`, `W → H`, the scheme `U ×_W V` is an atlas of `F ×_H G` (Stacks, Lemmas
65.7.1 (02X0), 65.7.3 (02X2)).

Define `EtaleLocal P f` for a property `P` of morphisms of schemes that is étale local on the
source-and-target (`IsLocalAtSource` and `IsLocalAtTarget` for `Scheme.etalePrecoverage`) and a
morphism `f : F → G` of algebraic spaces: there is a commutative square with étale atlases
`U → F`, `V → G` and `h : U → V` with `P h` (Stacks, Lemma 67.22.1 (03MJ), Definition 67.22.2
(04RD)). API: `EtaleLocal.iff_forall_square` (independence of the square), `.ofScheme_iff`
(agreement with `P` on schemes), `.iff_presheaf` (agreement with `MorphismProperty.presheaf P` when
`f` is representable and `P` is stable under base change), `.comp`, `.baseChange`. *Needs:* §1.3,
§1.6; Mathlib `IsLocalAtSource`, `IsLocalAtTarget`, `IsStableUnderBaseChange`,
`IsStableUnderComposition`.

**Checks.**
- `EtaleLocal.test_identity`: the identity of any algebraic space is étale.
- `EtaleLocal.test_scheme`: a morphism of schemes is smooth as a morphism of spaces iff it is
  smooth.
- `EtaleLocal.test_atlas`: for an étale equivalence relation, `π : h_U → U/R` is étale.
- `EtaleLocal.test_closed_immersion_not_local`: for the identity of `𝔸¹`, the square with top arrow
  the identity has a closed immersion and the square with top arrow the fold map does not; closed
  immersion is not étale local on the source, and `EtaleLocal @IsClosedImmersion` is not
  square-independent.

### 1.9 Separation and properness

Define `IsSeparatedSpace f` (the diagonal, representable by
`diagonal_representable`, is a closed immersion), `QuasiSeparatedSpace f` (quasi-compact
diagonal), `LocallySeparatedSpace f` (immersion), `QuasiCompactSpace f` (compact on points after
base change to affines), `UniversallyClosedSpace f` (closed on points after every base change) and
`IsProperSpace f := separated ∧ locally of finite type ∧ quasi-compact ∧ universally closed` (Stacks,
Definitions 67.4.2 (03HL), 67.9.2 (03HI), 67.40.1 (03ZM), 65.13.2 (02X5)). API:
`IsSeparated.ofScheme_iff`, `QuasiSeparated.iff_affine_charts`, `IsSeparated.iff_affine_charts`
(`U ×_F V` affine with `O(U) ⊗ O(V) → O(U ×_F V)` surjective; Stacks, Lemmas 66.3.3 (0AHR), 66.3.4
(0AHS)), `IsProper.baseChange`, `IsProper.comp`. *Needs:* §1.3, §1.7, §1.8; Mathlib
`MorphismProperty.relative`, `IsClosedImmersion`, `QuasiCompact`, `pullback.diagonal`.

**Checks.**
- `Separated.test_doubled_origin`: the affine line with doubled origin is a scheme, hence an
  algebraic space, quasi-separated and not separated.
- `Separated.test_folded_line`: the folded line is quasi-separated and not separated.
- `Separated.test_translation_quotient`: in characteristic zero `𝔸¹/ℤ` is not quasi-separated.
- `IsProper.test_scheme`: for a morphism of schemes, `IsProperSpace` agrees with Mathlib's
  `IsProper`.

### 1.10 The small étale site of an algebraic space

Define `smallEtale F`: the category whose objects are **algebraic spaces** `V` with an étale morphism
`V → F` (étale in the sense of §1.8) and whose morphisms are morphisms over `F`; it is closed under
fibre products by §1.9 and §1.8, and the Nisnevich-free étale coverings make `smallEtaleTopology F`
(Stacks, Definitions 66.18.1 (03ED), 66.18.2 (03G0)). Define `smallEtaleSchemeSite F`: the full
subcategory of schemes étale over `F`, with `smallEtaleSchemeSite_equiv` (the restriction of sheaves
along the inclusion is an equivalence of topoi, because every algebraic space étale over `F` has an
étale cover by schemes). Define `structureSheaf F` on `smallEtale F`, `V ↦ Γ(V, O_V)`, a sheaf of
rings, giving the ringed site `(F_ét, O_F)` (Definition 66.21.2 (03G7)). API: `smallEtale_ofScheme`
(for `F = h_X`, `smallEtale F ≌ X.Etale` after passing to the scheme site), `smallEtale_localize`
(for `V → F` étale, `smallEtale F / V ≌ smallEtale V`), and `smallEtale_map f` for a morphism
`f : F → G` of algebraic spaces: the functor `smallEtale G ⥤ smallEtale F`, `V ↦ V ×_G F`, well
defined because the fibre product is an algebraic space étale over `F`; it is continuous and
cocontinuous and induces a morphism of ringed topoi `(F_ét, O_F) → (G_ét, O_G)`, with
`smallEtale_map_id`, `smallEtale_map_comp` (Stacks, Lemma 66.18.7). The objects of `smallEtale`
must be algebraic spaces: if `G` is a scheme and `F → G` a nonschematic space, the pullback of
`𝟙_G` is `F`, which is not a scheme (`test_pullback_not_scheme` below). *Needs:* §1.4, §1.8, §1.9;
Mathlib `GrothendieckTopology`, `Sheaf`, `X.Etale`.

**Checks.**
- `smallEtale.test_spec_global_sections`: `Γ(h_{Spec R}, O) = R`.
- `smallEtale.test_folded_line_functions`: for the folded line (`char k ≠ 2`) the global sections
  of `O` are `k[x²]`.
- `smallEtale.test_separably_closed`: every étale surjection `U → Spec k`, `k` separably closed,
  has a section.
- `smallEtale.test_not_big_site`: `𝔸¹_k → Spec k` is not étale, so `𝔸¹_k` is not an object of
  `smallEtale h_{Spec k}`.
- `smallEtale.test_pullback_not_scheme`: for `F` the folded line over `G = Spec k`, the object
  `𝟙_G` of `smallEtale G` pulls back along `F → G` to `F`, which is not a scheme; a site whose objects
  are schemes étale over `F` would not be closed under `smallEtale_map`.

### 1.11 Quasi-coherent modules on an algebraic space

Define `Spaces.QCoh F`: the full subcategory of `O_F`-modules on `(F_ét, O_F)` satisfying Mathlib's
`SheafOfModules.IsQuasicoherent` (Stacks, Definition 66.29.1 (03G9)). API: `QCoh.pullback`
(pullback along a morphism of spaces preserves quasi-coherence), `QCoh.ofSchemeEquiv`
(`QCoh(h_Y) ≌ QCoh(Y)` for a scheme `Y`), `QCoh.presentationEquiv` (for `F = U/R`, quasi-coherent
modules on `F` are quasi-coherent modules on `U` with descent data along `s, t`; Proposition
66.32.1 (03M3)), `QCoh.invertible_aut` (automorphisms of an invertible module are `Γ(F, O)^×`),
`QCoh.abelian`. *Needs:* §1.1, §1.6, §1.10; Mathlib `SheafOfModules.IsQuasicoherent`.

**Checks.**
- `QCoh.test_scheme`: `QCoh(h_Y) ≌ QCoh(Y)`.
- `QCoh.test_folded_line_structure_sheaf`: for the folded line `X` (`char k ≠ 2`), `O_X` is the
  descent of `O_{𝔸¹}` along the relation, with `Γ(X, O_X) = k[x²]`.
- `QCoh.test_empty`: `QCoh` of the empty space is the zero category.
- `QCoh.test_not_quasicoherent`: on `h_{Spec ℤ}` the extension by zero `j_! O_U` of the structure
  sheaf of `U = Spec ℤ[1/2]` is an `O`-module on the étale site that is not quasi-coherent (its
  value on `Spec ℤ` is `0` while its value on `Spec ℤ[1/2]` is `ℤ[1/2]`).

### 1.12 Two algebraic spaces that are not schemes

Prove `foldedLine_space`: for a field `k` of characteristic `≠ 2`, `𝔸¹_k/(Δ ⊔ Γ)` (§1.5) is an
algebraic space that is not a scheme: it is not locally separated at the origin (Stacks, Example 65.14.1 (02Z1)). Prove
`translationQuotient_space`: the quotient `𝔸¹_ℚ/ℤ` of the affine line by the free action of `ℤ` by
translation is an algebraic space whose generic point has no residue field and which is not
quasi-separated (Stacks, Lemma 66.34.1 (071S), Example 65.14.8 (02Z7), Lemma 66.3.3 (0AHR)).
*Needs:* §1.5–§1.9.

### 1.13 Group algebraic spaces and actions

Define `GroupSpace S` for a scheme `S`: an object `G` of `Over h_S` whose underlying presheaf is an
algebraic space, with a `GrpObj` structure for the cartesian monoidal structure of `Over h_S`
(Stacks, Definition 78.5.1 (043H)); `Action G X := ModObj G X` for `X` over `h_S` (Definition 78.8.1
(043Q)); `act G X : G ⊗ X → X`; `Action.IsFree G X`: on `T`-points, `g·x = x` implies `g = 1`
(Definition 78.8.2). API: `Action.free_iff_mono` (`(a, pr₂) : G × X → X × X` is a monomorphism;
Lemma 78.8.3 (06P9)), `Action.baseChange` along `S' → S`, `Action.constantEquiv` (actions of Tau
Ceti's constant group scheme `Γ_S` on `X` are homomorphisms `Γ → Aut X`). Define the comparison
`GroupSpace.ofGroupScheme : GrpObj (Over.mk f) → GroupSpace S` for a group scheme `f : G → S` in
ModularCurves 0B's convention (`yoneda : Over S ⥤ Over h_S` preserves finite products, so carries
`GrpObj` to `GrpObj`), with `ofGroupScheme_faithful` and `ofGroupScheme_action` (actions of `G` on
`S`-schemes are carried to `ModObj` structures). *Needs:* §1.4, §1.8; Mathlib `GrpObj`, `ModObj`,
`MonObj`, `CartesianMonoidalCategory`, `Over.cartesianMonoidalCategory`; Tau Ceti
`ConstantGroup.groupScheme`; ModularCurves 0B.

**Checks.**
- `Action.test_translation_free`: `G` acting on itself by left translation is free.
- `Action.test_scaling_not_free`: `𝔾_m` acting on `𝔸¹` by scaling is not free (every `c ≠ 1` fixes
  `0`).
- `Action.test_constant_group`: the action of the constant group `(ℤ/2)_k` on `X` is a
  homomorphism `ℤ/2 → Aut X`, by `Action.constantEquiv`.
- `Action.test_trivial_group`: the trivial group has a unique action on every `X`.
- `GroupSpace.test_ofGroupScheme_Gm`: `ofGroupScheme` of `𝔾_{m,S}` is the group space `𝔾_m` of
  §1.15 and its points over a specified map `T → S` are `Γ(T, O)^×`.

### 1.14 Groupoids in algebraic spaces and stabilizers

Define `Groupoid` (a groupoid in algebraic spaces over `B`): algebraic spaces `U`, `R` with
morphisms `s, t : R → U`, `c : R ×_{s,U,t} R → R`, `e : U → R` and `i : R → R` satisfying, as
equalities of morphisms: `c ≫ s = pr₂ ≫ s`, `c ≫ t = pr₁ ≫ t` (endpoints), associativity of `c`,
`e ≫ s = 𝟙`, `e ≫ t = 𝟙`, the unit laws `(e ∘ t, 𝟙) ≫ c = 𝟙` and `(𝟙, e ∘ s) ≫ c = 𝟙`, the
inverse laws `i ≫ s = t`, `i ≫ t = s`, `(𝟙, i) ≫ c = t ≫ e` and `(i, 𝟙) ≫ c = s ≫ e`; equivalently,
for every scheme `T` the data `(U(T), R(T), s, t, c, e, i)` is a groupoid (Stacks, Definition
78.11.1 (043W)). The identity and inverse are data satisfying laws, not existence clauses: with
existence clauses alone, the one-object "category" with endomorphism monoid `{1, z}`, `z² = z ≠ 1`,
realised on a constant two-point scheme, has endpoint-compatible identity and inverse candidates
(`1` and the identity map) and is associative, yet `z` has no inverse (`test_monoid_not_groupoid`
below). API: `Groupoid.e_unique`, `Groupoid.i_involutive`, `Groupoid.ofAction` (the action groupoid
`(X, G × X, pr₂, a, c)` of §1.13 with `e = (1, 𝟙)`, `i = (g⁻¹, a)`), `Groupoid.ofEquivRel` (an
equivalence relation of §1.5, with `e` the diagonal, `i` the swap, `c` transitivity),
`Groupoid.restrict` along `g : U' → U` (`R' = R ×_{U×U} (U'×U')` with the induced structure),
`Groupoid.toPresheafOfGroupoids` (the prestack `T ↦ (U(T), R(T))` fed to §1.18's stackification),
`Groupoid.baseChange`. Define `stabilizer G : Over U`, the fibre product `R ×_{(t,s), U×U, Δ} U`
(Stacks, Definition 78.16.2 (0448)), with `stabilizer_points` (a `T`-point of `R` lies in the
stabilizer iff `s = t` on it), `stabilizer_group` (it is a group space over `U` under `c`),
`stabilizer_baseChange`, `free_iff_stabilizer_trivial` (an action is free iff the stabilizer of its
action groupoid is `U`), `stabilizerAt` for a field-valued point. *Needs:* §1.5, §1.8, §1.13;
Mathlib `IsGroupoid`, `pullback`.

**Checks.**
- `groupoid_inverse_endpoints`: write an arrow as `(target, source)`. For `r = (1,0)`
  and `i(r) = (0,1)`, `c(r,i(r)) = (1,1)` is the target identity, whereas
  `c(i(r),r) = (0,0)` is the source identity.
- `Groupoid.test_trivial`: `(U, U, 𝟙, 𝟙, 𝟙, 𝟙, 𝟙)` is a groupoid (the discrete groupoid).
- `Groupoid.test_action_trivial_group`: the action groupoid of the trivial group has `s = t` an
  isomorphism.
- `Groupoid.test_indiscrete`: `(U, U ×_B U, pr₂, pr₁, (u, v, w) ↦ (u, w), Δ, swap)` is a groupoid.
- `Groupoid.test_monoid_not_groupoid`: for `U = Spec k`, `R = Spec k ⊔ Spec k` (points `1, z`),
  `s = t` the structure map, and the composition `c` with `z ∘ z = z`, `z ∘ 1 = 1 ∘ z = z`, there is
  no `i : R → R` making the inverse laws hold: `(𝟙, i) ≫ c = t ≫ e` evaluated at `z` would give
  `z ∘ i(z) = 1`, impossible since `z ∘ 1 = z` and `z ∘ z = z`. The example satisfies the endpoint,
  associativity, `e ≫ s = 𝟙` and `i ≫ s = t` clauses with `i = 𝟙_R`.
- `stabilizer.test_trivial_action`: for the trivial action the stabilizer is `G × X`.
- `stabilizer.test_translation`: for left translation the stabilizer is `U`.
- `stabilizer.test_scaling`: for `𝔾_m` on `𝔸¹`, the stabilizer is `Spec k[x, λ^{±1}]/((λ − 1)x)`,
  with fibre `𝔾_m` over `x = 0` and trivial fibre elsewhere.
- `stabilizer.test_mu_p_nonreduced`: for `μ_p` acting on `𝔸¹` by scaling in characteristic `p`, the
  stabilizer at the origin is `Spec k[λ]/(λ^p − 1) = Spec k[λ]/((λ − 1)^p)`, one nonreduced point.

### 1.15 Torsors, torsor classes and the multiplicative group

Define `IsTorsor G P` for a group space `G` over `S` and `P` over `h_S` with an action: `P` is an
algebraic space, `(a, pr₂) : G × P → P × P` is an isomorphism (pseudo-torsor), and `P` has a
section fppf-locally on `S` (Stacks, Definitions 78.9.1, 78.9.3 (04TY)). For fppf torsors `G` is
flat and locally of finite presentation over `S`; for fpqc torsors `G` is flat and affine. API:
`Torsor.trivial` (`G` acting on itself), `Torsor.trivial_iff_section` (a torsor is isomorphic to `G`
iff it has a section), `Torsor.hom_isIso` (equivariant maps of torsors are isomorphisms),
`Torsor.baseChange`, `Torsor.flat_of_flat` (a torsor under a flat group is flat),
`Torsor.toSheafTorsor`: the fppf sheaf `P` with its `h_G`-action is a torsor under the sheaf of
groups `h_G` on the big fppf site `(Sch/S)_fppf` in the sense of §2.3. Define the **set of torsor
classes** as Layer 2's `NonabelianH1 (fppfTopology.over S) h_G` (§2.3): `torsorClasses G :=
NonabelianH1 _ h_G`, pointed by the trivial torsor; `torsorClasses.mk P h : torsorClasses G` for
`IsTorsor G P`, `torsorClasses.mk_eq_base_iff` (iff `P` has a section),
`torsorClasses.surjective_mk` (every torsor sheaf under `h_G` is an algebraic space by
`torsorRepresentability`, so `mk` is a bijection from isomorphism classes of geometric torsors),
`torsorClasses.pushforward` along a homomorphism `G → G'`,
`torsorClasses.cechColimit` (classes of torsors trivialised on a covering `U` are Mathlib's
`PresheafOfGroups.H1 h_G U`, and `torsorClasses G` is the colimit over refinements) (Poonen 2017,
§5.12.4, Proposition 5.12.14; Proposition 6.5.9, Example 6.5.5). Define the multiplicative group
space `Gm S : GroupSpace S`, the group space of the group scheme `𝔾_{m,S} = Spec_S O_S[t, t⁻¹]`
(`Spec (ℤ[t, t⁻¹]) ×_ℤ S` with its `GrpObj` structure, through `GroupSpace.ofGroupScheme`), with
`Gm_obj` (its points over a specified map `T → S` are in bijection with `Γ(T, O)^×`).
Define `picEquiv : torsorClasses (Gm S) ≃ LineBundleClass S`: the class of the frame
torsor `Isom(O_S, L)` of an invertible sheaf, a bijection sending the base point to
`O_S`, obtained from Hilbert 90 (§2.11, `H¹_fppf(S, 𝔾_m) = H¹_ét(S, 𝔾_m) = Pic(S)`)
and `NonabelianH1.equivSheafH`; its inverse sends a torsor `P` to the contracted product
`P ×^{𝔾_m} 𝔸¹` of §1.16 (Stacks, Theorem 59.24.1 (03P8)). The trivial group cannot replace `Gm S`: for the trivial group over `ℙ¹_k` the torsor classes are a point while
`Pic(ℙ¹) = ℤ` (`test_picEquiv_not_trivial_group` below). Prove `torsorRepresentability`: an fppf
sheaf `P` over `S` with an `h_G`-action that is a pseudo-torsor and trivial over an fppf covering
of `S`, with no algebraicity assumed on `P`, is an algebraic space and a torsor in the sense of
`IsTorsor`: it is fppf-locally the algebraic space `G ×_S S_i`, and the algebraic-space predicate is
fppf local (§1.2; Stacks, Lemma 80.11.1 (04SK); Poonen 2017, Theorem 6.5.10 (i), Remark 6.5.11).
*Needs:* §1.2, §1.13, §2.3, §2.11; Mathlib `PresheafOfGroups.H1`, `fppfTopology`; Tau Ceti
`LineBundleClass`, `CommHopfAlgCat.isPullback_fppfQuotientTorsor`.

**Checks.**
- `Torsor.test_trivial`: `G` is a `G`-torsor with the base-point class.
- `Torsor.test_frobenius_mu_p`: in characteristic `p`, the `p`-th power map `𝔾_m → 𝔾_m` over
  `S = 𝔾_m` (coordinate `t`) is a `μ_p`-torsor over `S`; its fibre over the generic point is
  `Spec k(t)[s]/(s^p − t)`, a purely inseparable extension, so the torsor is not étale-locally
  trivial over `S`: no separable extension of `k(t)` contains a `p`-th root of `t`, since such a
  root is purely inseparable over `k(t)` and `t` is not a `p`-th power. The test asserts the
  statement about the torsor over `S = 𝔾_m` through the local-section predicate, not about a
  single fibre.
- `Torsor.test_frobenius_mu_p_fibre_trivial`: the fibre over `t = 1` is `μ_p = Spec k[s]/(sᵖ − 1)`,
  nonreduced and nevertheless the trivial `μ_p`-torsor, because it has the section `s = 1`;
  nonreducedness is not an obstruction to étale-local triviality and must not be used as one.
- `Torsor.test_frobenius_twisted_action`: for a smooth connected group `G` of positive dimension
  over `𝔽_p`, the action `x · g := x F(g)` of `G` on itself makes `G(𝔽̄_p)` a `G(𝔽̄_p)`-torsor, but
  `G` with this action is not a `G`-torsor: `(a, pr₂)` is inseparable of degree `p^{dim G}`, so the
  pseudo-torsor clause fails (Poonen, Warning 5.12.6).
- `Torsor.test_empty`: the empty space over a nonempty `S` is not a torsor (no local sections).
- `Torsor.test_galois`: for `L/K` quadratic Galois, `Spec L` is a `(ℤ/2)_K`-torsor over `Spec K`
  with no `K`-point.
- `torsorClasses.test_trivial_group`: for the trivial group the classes form a point.
- `torsorClasses.test_separably_closed`: for `k` separably closed and `G` smooth, the classes form a
  point.
- `torsorClasses.test_kummer`: `torsorClasses (μ_2 / Spec ℚ) ≅ ℚ^×/(ℚ^×)²`.
- `test_picEquiv_projectiveLine`: `torsorClasses (Gm ℙ¹_k) ≅ ℤ` by `picEquiv`.
- `test_picEquiv_not_trivial_group`: for `G` the trivial group over `ℙ¹_k`, `torsorClasses G` is a
  point while `LineBundleClass ℙ¹_k ≅ ℤ`; no equivalence exists, so `picEquiv` genuinely depends on
  `Gm`.
- `test_not_cech_one_cover`: the Čech set `PresheafOfGroups.H1 h_{𝔾_m} {ℙ¹ → ℙ¹}` of the trivial
  covering is a point while `torsorClasses (Gm ℙ¹)` is `ℤ`; the colimit over refinements is
  essential.

- `gm_needs_base_map`: a nonempty `T` has no map to the empty base, whereas
  `Γ(T,O)^×` contains `1`. The units comparison is for points over a specified `T → S`.

### 1.16 Contracted products and twisting

Define `contractedProduct G P X := (P × X)/G` for a `G`-torsor `P` and a `G`-space `X`, the quotient
of §1.5 by the diagonal action, with `contractedProduct_trivial` (`G ×^G X ≅ X`),
`contractedProduct_baseChange`, `contractedProduct_isAlgebraicSpace`; `innerForm G P := P ×^G G` for
the conjugation action, a group space; `pushforwardTorsor φ P := P ×^G H` along a homomorphism
`φ : G → H` (Poonen 2017, §5.12.5.2, §6.5.6). Prove `twistingBijection`: for a `G`-torsor `E`,
`P ↦ P ×^G E` is a bijection `torsorClasses (innerForm G E) ≃ torsorClasses G` sending the base
point to the class of `E`, and twisting forms: `G`-forms of `X` trivialised by `E` correspond to
`H¹`-classes (Poonen 2017, Theorem 4.5.2, §5.12.5.1, §6.5.6.4). *Needs:* §1.5, §1.15.

**Checks.**
- `contractedProduct.test_trivial`: `G ×^G X ≅ X`.
- `contractedProduct.test_point`: `P ×^G (point) ≅ point` for every torsor `P`.
- `contractedProduct.test_line_bundle`: the frame torsor of a line bundle twisted by the scaling
  action on `𝔸¹` is the total space of the line bundle (this is `picEquiv.symm` of §1.15).
- `contractedProduct.test_needs_sheafification`: for `Spec L` over `Spec K` (`L/K` quadratic Galois)
  twisted by itself, the contracted product is `Spec K ⊔ Spec K`, with `K`-points, while the presheaf
  quotient has none.

### 1.17 Categorical and geometric quotients, and Artin's bootstrap

For a pre-relation `s, t : R → U` of algebraic spaces over `B` (for instance the action groupoid),
define `IsInvariant s t φ` (`s ≫ φ = t ≫ φ`) and `IsCategoricalQuotient s t φ`: `φ : U → X` is
invariant and every invariant morphism to an algebraic space factors uniquely through `φ`, with
`IsCategoricalQuotient.unique` (Stacks, Definitions 83.3.1 (048E), 83.4.1 (048J)). Define the
**invariant sections**: for `φ` invariant, `(φ_* O_U)^R ⊆ φ_* O_U` is the equaliser of
`s^♯, t^♯ : φ_* O_U ⇉ (φ ∘ s)_* O_R` on the small étale site of `X` (§1.10), with the canonical
comparison `O_X → (φ_* O_U)^R` induced by `φ^♯`. Define `IsGeometricQuotient s t φ`: `φ` is
invariant; `|φ|` is surjective; its fibres on points are the equivalence classes of the relation
induced by `R` on `|U|`; `φ` is universally submersive (`|φ ×_X Z|` is a quotient map for every
`Z → X`); and the comparison `O_X → (φ_* O_U)^R` is an isomorphism (Stacks, Definition 83.10.1
(04AE)). The last clause is essential: without it `Spec k[ε]/ε² → Spec k` with the identity
relation satisfies every topological clause and is not a categorical quotient
(`test_dual_numbers_not_quotient` below). Prove `IsGeometricQuotient.of_torsor` (for a free
action with `U → U/G` a torsor, the quotient is geometric), `IsGeometricQuotient.pullback_flat`
(stability under flat base change). Geometric quotients alone do not imply a categorical
universal property or uniqueness among algebraic spaces (D. Rydh, *Existence and properties of
geometric quotients*, Remark 2.8, p. 8 of the 2012-05-04 author manuscript). The applicable
criterion is Theorem 3.16, p. 18: a strongly geometric quotient of a groupoid is categorical if
it is universally open, proper or integral. Here strong geometricity includes universal
submersiveness of `R → U ×_X U` as well as the quotient conditions in the Zariski and constructible
topologies (Definition 2.2, pp. 6–7). Without strong geometricity the same theorem only gives
categoricity among locally separated targets under these hypotheses. This is a stated gap in the
current Lean interface: neither a sheaf-coequalizer assumption that already asserts factorization
nor the present `IsGeometricQuotient` predicate supplies these extra topological contracts.
Prove `artinBootstrap`: an fppf sheaf `F` with a map `U → F`
from an algebraic space that is representable by algebraic spaces, flat, locally of finite
presentation and fppf locally surjective, is an algebraic space (Stacks, Theorem 80.10.1 (04S6),
Lemmas 80.11.1 (04SK), 80.11.6 (06PG), 80.11.7 (06PH)). *Needs:* §1.7, §1.9, §1.10, §1.14, §1.15.

**Checks.**
- `Quotient.test_finite_affine`: for a finite group `Γ` acting on `Spec A`, `Spec A → Spec A^Γ` is a
  geometric quotient: two primes with the same contraction to `A^Γ` are conjugate, and
  `O_{Spec A^Γ} = (π_* O)^Γ`; this is Tau Ceti's `AffineInvariantQuotient` (ModularCurves 0C).
- `Quotient.test_scaling_plane`: `𝔸²_k → Spec k` is a categorical but not a geometric quotient for
  the scaling action of `𝔾_m` (the fibre over the point is not one orbit).
- `Quotient.test_punctured_plane`: `𝔸² ∖ {0} → ℙ¹` is a geometric quotient for scaling.
- `Quotient.test_line_no_geometric`: scaling on `𝔸¹` has no geometric quotient.
- `Quotient.test_dual_numbers_not_quotient`: for `U = Spec k[ε]/(ε²)`, `R = U` with `s = t = 𝟙` and
  `φ : U → Spec k`, every topological clause of `IsGeometricQuotient` holds, the comparison
  `k → k[ε]/(ε²)` is not an isomorphism, and `φ` is not a categorical quotient (`𝟙_U` is invariant
  and does not factor through `Spec k`); the identity-relation quotient is `U` itself, with its
  nilpotents, not its reduction.

### 1.18 Stacks in groupoids, stackification and 2-fibre products

Define `StackInGroupoids`: a `SchPseudofunctor` whose fibre categories are groupoids (Mathlib
`IsGroupoid`) and which is a stack for `fppfTopology` (Stacks, Definitions 8.4.1 (026F), 8.5.1
(02ZI)); `StackInGroupoids.Hom` (strong transformations), `IsFibrewiseEquiv`. API:
`StackInGroupoids.ofSheaf` (the stack in setoids of an fppf sheaf), `yonedaEquiv` (`Hom(h_T, X) ≃
X(T)`; Lemma 8.6.3 (0432)), `isFiberedInGroupoids` (the Grothendieck construction is fibred in
groupoids), `limit` (stacks in groupoids are closed under limits), `test_trivial_torsor_prestack`.
Define `stackification` of a prestack in groupoids with `stackification.η`, `.lift` (the universal
property), `.isom_sheafify` (`Isom` presheaves become their sheafifications), `.locally_essSurj`
(Stacks, Lemma 8.9.1 (02ZP), Section 8.9 (02ZO)). Define `twoFiberProduct X Y Z` with `.fst`, `.snd`,
`.iso` (the 2-cell), `.lift`, `.ofSheaf` (for sheaves it is the fibre product of sheaves) (Stacks,
Lemma 8.5.6 (02ZL); Section 4.31 (003O)). *Needs:* §1.1; Mathlib `Pseudofunctor`, `IsStack`,
`IsGroupoid`, `StrongTrans`, `CoGrothendieck`.

**Checks.**
- `StackInGroupoids.test_scheme`: `T ↦ Hom(T, X)` (discrete) is a stack in groupoids.
- `StackInGroupoids.test_torsors`: for `G` flat and locally of finite presentation, `T ↦` (groupoid
  of `G_T`-torsors) is a stack in groupoids `BG`.
- `StackInGroupoids.test_qcoh_not_groupoid`: the quasi-coherent pseudofunctor is a stack but not in
  groupoids.
- `stackification.test_stack`, `test_sheafification` (for a presheaf it is sheafification),
  `test_real_torsors` (the prestack of trivial `ℤ/2`-torsors over `Spec ℝ` stackifies to `B(ℤ/2)`,
  with the class of `Spec ℂ`).
- `twoFiberProduct.test_identity`, `test_schemes` (agrees with fibre products of schemes),
  `test_classifying` (`pt ×_{BG} pt = G`).

### 1.19 Representable morphisms, algebraic stacks and Deligne–Mumford stacks

Define `IsRepresentableBySpaces f` for a 1-morphism of stacks in groupoids: for every scheme `T` and
object of `Y(T)` the 2-fibre product `T ×_Y X` is equivalent to the stack of an algebraic space over
`T` (Stacks, Definition 94.9.1 (02ZW)); `RepresentableProperty P f` for a property `P` of morphisms
of spaces stable under base change (Section 94.10 (03YJ)). API: `IsRepresentableBySpaces.baseChange`,
`.comp`, `diag_representable_iff` (the diagonal is representable iff every `T → X` is). Define
`IsAlgebraicStack X`: the diagonal is representable by algebraic spaces and there is a scheme `U`
with a smooth surjective `U → X` (Stacks, Definition 94.12.1 (026O)), with `.diagonal`, `.atlas`,
`.ofSpace`, `.twoFiberProduct`, `.of_equiv`, and the characterisation Lemma 94.14.3 (04T2). Define
`IsDeligneMumford X`: an algebraic stack with an étale surjective `W → X` from a scheme (Definition
94.12.2 (03YO)), with `.iff_unramified_diagonal` (Theorem 101.21.6), `.isAlgebraic`, `.ofSpace`,
`.twoFiberProduct`. *Needs:* §1.4, §1.9, §1.18; Mathlib `Smooth`, `Surjective`, `Etale`,
`FormallyUnramified`.

**Checks.**
- `Representable.test_identity`, `test_spaces` (every morphism between stacks of spaces),
  `test_point_to_BG` (`S → BG` is representable with fibre `G`), `test_BG_to_point` (`BG → S` is not
  representable when `G ≠ 1`).
- `AlgebraicStack.test_scheme`, `test_BGm` (`B𝔾_m` over `Spec ℤ` is algebraic with atlas
  `Spec ℤ`), `test_qcoh` (the quasi-coherent pseudofunctor is not an algebraic stack: not in
  groupoids), `test_formal_disc` (`Spf k[[t]]`'s functor is not algebraic: no smooth atlas).
- `DM.test_space`, `test_finite_etale` (`BG` for finite constant `G` is DM), `test_mu_p` (over
  `𝔽_p`, `Bμ_p` is algebraic and not DM), `test_BGm` (`B𝔾_m` is not DM).

### 1.20 Inertia, the setoid criterion, properties of morphisms and presentations

Define `inertia X := X ×_{X × X} X` with `inertia.equivDiagonal`, `inertia.representable`,
`relativeInertia f`, `automorphismGroup x` for `x ∈ X(T)` (Stacks, Section 8.7 (036X), Lemmas 8.7.1
(036Y), 8.7.2 (04ZM)). Prove `setoid_criterion`: an algebraic stack whose inertia is trivial is an
algebraic space (Stacks, Proposition 94.13.3 (04SZ)). Define `SmoothLocal P f` for a property `P`
of morphisms of spaces that is smooth local on the source-and-target (smooth, flat, locally of
finite presentation or type, surjective): `f : X → Y` has `P` if for smooth atlases `V → Y` and
`U → X ×_Y V` the composite `U → V` has `P`, with `SmoothLocal.atlas_independent`; define
`IsSeparatedStack` (the diagonal is proper), `IsProperStack` (separated, of finite type,
universally closed on §1.7's spaces), with `IsProperStack.of_representable`, `.baseChange`
(Stacks, Definitions 101.4.1 (04YW), 101.13.2 (0513), 101.16.2 (06FN), 101.37.1 (0CL5)). Prove
`stack_presentation`: every algebraic stack is `[U/R]` for a smooth groupoid `(U, R)` of §1.14, and
the quotient stack of a smooth groupoid is algebraic; atlas independence (Stacks, Theorem 94.17.3
(04TK), Lemma 94.16.2 (04T5), Theorems 97.16.1 (06DC), 97.17.2 (06FI)). *Needs:* §1.7–§1.9, §1.14,
§1.19.

**Checks.**
- `inertia.test_space` (trivial), `test_BG` (`I_{BG} = [G/G]` by conjugation), `test_S3` (the
  automorphism group of the trivial `S_3`-torsor is `S_3`).
- `Properties.test_BG_finite` (`BG → S` is proper for finite constant `G`), `test_BGm`
  (`B𝔾_m → Spec ℤ` is smooth and of finite type but not separated), `test_doubled_origin` (the
  affine line with doubled origin is of finite type and not separated), `test_projective_line`
  (`ℙ¹ → Spec k` is proper as a stack).

### 1.21 Quotient stacks, line bundles with a section, root stacks

Define `quotientStack (U, R)` for a groupoid and `actionQuotient G X = [X/G]` with
`actionQuotient.torsorEquiv` (objects over `T` are `G_T`-torsors with equivariant maps to `X`),
`quotientStack.π : U → [U/R]`, `.isCartesian`, `.desc`, `.torsor` (`π` is a `G`-torsor for
`[X/G]`) (Stacks, Definition 78.20.1 (044Q), Lemmas 78.22.2 (04M9), 78.23.2 (044U), 78.26.1
(06PB)). Prove `quotientStack_algebraic`: `[U/R]` is algebraic for a flat locally finitely
presented groupoid, and `[X/G]` is DM iff the stabilizers are unramified (Stacks, Theorems 94.17.3
(04TK), 97.17.2 (06FI)). Prove `lineBundleSectionStack`: `[𝔸¹/𝔾_m]` classifies pairs `(L, s)` of a
line bundle with a section (Cadman 2005, §2.2, p. 6). Define `rootStack n (L, s)` for a line bundle
with a section and `n ≥ 1`, the fibre product `X ×_{[𝔸¹/𝔾_m]} [𝔸¹/𝔾_m]` along the `n`-th power
map, with `.baseChange`, `.one` (`n = 1` is `X`), `.isIso_away` (an isomorphism over `s ≠ 0`),
`.affineChart` (`Spec A[t]/(t^n − s)` modulo `μ_n` over `Spec A` with `L` trivial), `.isDeligneMumford_of_invertible`
(`n` invertible on the base), `.transition` (Cadman 2005, Definitions 2.1, 2.3, 2.5, Theorem 2.2, Proposition
2.4, §§2.1–2.2, pp. 3–6). *Needs:* §1.13–§1.15, §1.19, §1.20.

**Checks.**
- `QuotientStack.test_trivial_group` (`[X/1] = X`), `test_BG_points` (`BG(T)` is the groupoid of
  `G_T`-torsors), `test_real_points` (`B(ℤ/2)(ℝ)` has two isomorphism classes), `test_torsor`
  (`X → [X/G]` is a `G`-torsor).
- `rootStack.test_n_one`, `test_dvr_chart` (over a DVR with `s = π`, the chart is
  `[Spec R[t]/(t^n − π) / μ_n]`), `test_fibre_nonreduced` (over a field, the fibre over `s = 0` is `[Spec k[t]/(t^n) / μ_n]`
  with the scaling action, not a product with `Bμ_n`), `test_char_p` (for `p = n` in characteristic `p`, a point where `s` vanishes
  has non-étale stabilizer `μ_p`, so the root stack is not DM there; for nowhere-vanishing `s`
  it is the scheme `X`).

### 1.22 Quasi-coherent modules on stacks

Define `Stacks.QCoh X` for a stack in groupoids: quasi-coherent modules on the ringed site
`(X_fppf, O_X)`, equivalently compatible families `(F_x ∈ QCoh(T))_{x ∈ X(T)}` with pullback
isomorphisms satisfying the cocycle condition (Stacks, Definition 96.11.1 (06WG)). API:
`QCoh.pullback`, `QCoh.presentationEquiv` (for `X = [U/R]`, quasi-coherent modules on `U` with
descent data; Proposition 96.14.3 (06WT)), `QCoh.pushforward` along quasi-compact quasi-separated
morphisms, `QCoh.ofSpaceEquiv` (agreement with §1.11 for spaces). *Needs:* §1.1, §1.11, §1.18,
§1.21; Mathlib `CoGrothendieck`.

**Checks.**
- `QCoh.test_scheme`, `test_BG_representations` (for an affine group scheme `G` over a field,
  `QCoh(BG)` is the category of comodules of `O(G)`), `test_pushforward_invariants` (for a finite
  group `G` acting on `Spec A` and `π : [Spec A/G] → Spec A^G`, `π_* O = Ã^G`),
  `test_BG_not_exact` (for `G = ℤ/p` over `𝔽_p`, `π_* : QCoh(BG) → Vect` is not exact).

### 1.23 Moduli functors, fine and coarse moduli spaces, Keel–Mori, tame stacks

Define `moduliFunctor X : SchemePresheaf`, `T ↦ π₀ X(T)`, with `.map`, `toModuliSheaf` (its fppf
sheafification), `isSetoid_iff_moduliFunctor`, `moduliFunctor_classifying` (Stacks, Lemma 8.6.3
(0432); Section 4.39 (04S9)). Define `FineModuliSpace X`: an algebraic space `M` with an equivalence
`h_M ≃ X`, with `.universal` (the object over `M` corresponding to `𝟙_M`), `.unique`,
`.inertia_trivial`, `.toCoarse` (Stacks, Proposition 94.13.3 (04SZ)). Define
`IsCategoricalModuliSpace π` for `π : X → M` to an algebraic space: every `X → W` to an algebraic
space factors uniquely through `π`; `IsCoarseModuliSpace π`: categorical and a bijection on
`k`-points for every algebraically closed field `k`, with `.unique`, `.ofFine`,
`IsCategoricalModuliSpace.quotient_iff` (for `[U/R]`, categorical quotients of §1.17),
`IsUniform` (formation commutes with flat base change) (Stacks, Definition 106.12.1, Lemmas
106.12.2–106.12.4 (0DUF)). Prove `keel_mori`: an algebraic stack locally of finite presentation over
`S` with finite inertia has a coarse moduli space `π : X → M`, `π` is proper and quasi-finite, `M`
is locally of finite presentation over `S`, and formation of `M` commutes with flat base change
(Conrad 2005, Theorem 1.1 and the paragraph after it, pp. 1–2; Lemmas 2.1–2.2, Remark 2.3, pp.
2–3). Prove `finite_quotient_coarse`: for a finite group `G` acting on an affine scheme `Spec A`,
`Spec A^G` is the coarse space of `[Spec A/G]` (Stacks, Lemmas 106.12.2, 106.12.3). Define
`IsTame M` for `M` locally of finite presentation with finite inertia and coarse space `ρ : M → M`:
`ρ_* : QCoh(M) → QCoh(M)` is exact (Abramovich–Olsson–Vistoli 2008, Definition 3.1 and the remark
after it), with `.classifying_iff` (`BG` is tame iff `G` is linearly reductive, Tau Ceti's
`linearlyReductiveAffineGroupSchemeProperty`), `.baseChange`, `.geometric_fibres` (tame iff every
geometric stabilizer is linearly reductive). Prove `tame_local_structure`: a tame stack is
étale-locally on its coarse space a quotient `[Spec A/G]` with `G` linearly reductive, and tameness
is stable under base change (Abramovich–Olsson–Vistoli 2008, Theorem 3.2, Corollaries 3.3–3.5,
Proposition 3.6). *Needs:* §1.17, §1.19, §1.20, §1.22; Tau Ceti
`linearlyReductiveAffineGroupSchemeProperty`; ModularCurves 0C, 9D.

**Checks.**
- `moduliFunctor.test_space`, `test_classifying` (`π₀ BG(T)` is `H¹(T, G)`), `test_not_sheaf` (the
  moduli functor of `B(ℤ/2)` over `Spec ℝ` is not a sheaf), `test_empty`.
- `FineModuliSpace.test_space`, `test_BG` (for nontrivial finite `G` over an algebraically closed
  field, `BG` has no fine moduli space), `test_torsor_quotient` (for a free action of a finite
  group on a quasi-projective scheme, `X/G` is a fine moduli space of `[X/G]`).
- `Coarse.test_space`, `test_BG` (for finite constant `G` over an algebraically closed field,
  `BG → Spec k` is coarse), `test_finite_quotient`, `test_base_change_fails` (coarse spaces do not
  commute with arbitrary base change: `[Spec ℤ[i]/(ℤ/2)]` over `ℤ` and the fibre over `2`),
  `test_A1_Gm` (`[𝔸¹/𝔾_m]` has infinite inertia and the categorical space `Spec k` is not coarse).
- `Tame.test_space`, `test_invertible_order` (`BG` for `|G|` invertible), `test_Z_mod_p` (`B(ℤ/p)`
  over `𝔽_p` is not tame), `test_mu_p` (`Bμ_p` over `𝔽_p` is tame).

### 1.24 Semilinear automorphisms, Galois descent, conjugators and crossed modules

Let `k'/k` be Galois with `Γ = Gal(k'/k)` (Krull topology) and `H` a linear algebraic group over `k'`
(an affine `k'`-group scheme of finite type, a finitely generated commutative Hopf `k'`-algebra
`O(H)`). Define `SemilinearAut H σ` for `σ ∈ Γ`: a ring automorphism of `O(H)` that is
`σ`-semilinear over `k'` and respects the Hopf structure (Kisin 2017, §3.1.1, condition (1),
pp. 34–35), with `.toPointsAut` (the induced `σ`-semilinear bijection of `H(k')`), `.comp`,
`.standard` (for `H = H_0 ⊗_k k'` the standard `σ`-action), `.linear_iff` (`σ = 1`). Prove
`galois_descent_affine`: affine schemes and affine group schemes over `k'` with descent data along
`Γ` descend to `k`, and descent data are semilinear actions (Stacks, Section 35.6 (0CDQ)). Define `CrossedModule Ht H`: a
homomorphism `∂ : H̃ → H` and an action of `H` on `H̃` by automorphisms with `∂(h·x) = h ∂(x) h⁻¹`
and `∂(x)·y = x y x⁻¹` (Kisin 2017, §3.2.1, pp. 39–40), with `.quotientCategory` (objects `H`,
morphisms `H̃`), `.isGroupoid`, `.isoClasses` (`coker ∂`), `.aut` (`ker ∂`, central), `.kernel_central`.
*Needs:* Mathlib `CommHopfAlgCat`, `krullTopology`, `MonoidHom.ker`, `IsGroupoid`; Tau Ceti
`ScalarAut.instMulSemiringAction`.

**Checks.**
- `SemilinearAut.test_gm_conjugation` (for `ℂ/ℝ`, `H = 𝔾_m`, complex conjugation on `ℂ[t^{±1}]`),
  `test_identity_not_semilinear` (the identity is not `σ`-semilinear for `σ` conjugation),
  `test_trivial_extension` (for `k' = k`, `SemilinearAut H 1 = Aut H`), `test_standard_points`.
- `CrossedModule.test_identity` (`∂ = id` with conjugation: the quotient category is the
  indiscrete groupoid on `H`), `test_trivial` (`H̃ = 1`: discrete), `test_center` (`SL_2(ℂ) →
  PGL_2(ℂ)`: isomorphism classes `PGL_2/im = 1`, automorphisms `μ_2`),
  `test_peiffer_needed` (`∂ = id : S_3 → S_3` with the trivial action violates the Peiffer identity).

### 1.25 Galois gerbs

This subsection is the strand `GaloisGerbs` of `Suggested.lean`. For a
discrete group `N` and topological groups `E`, `Γ`, define `TopologicalExtension N E Γ`: a Mathlib
`GroupExtension N E Γ` whose kernel inclusion is a topological embedding and whose quotient map is a
continuous quotient map, with `kernel_iff`, `inl_project`, `continuous_projection`. Define
`LocalSplitChart T`: an open subgroup `U ⊆ Γ`, a continuous homomorphism `s : U → E` with `q ∘ s`
the inclusion, and a homeomorphism `N × U ≅ q⁻¹(U)`, `(n, u) ↦ i(n) s(u)`, with `section_one`,
`section_mul`, `chart_value`. Define `GaloisGerb`: for `k` of characteristic zero, `k'/k` Galois
inside an algebraic closure and `Γ = Gal(k'/k)`, a linear algebraic group `H/k'` and a topological
extension `1 → H(k') → E → Γ → 1` with discrete kernel, together with the algebraicity condition:
conjugation by an element of `E` over `σ ∈ Γ` is induced by a `σ`-semilinear algebraic automorphism
of `H` (§1.24), witnessed on a splitting chart; a bare topological extension is not a gerb (Kisin
2017, §3.1.1–3.1.2, pp. 34–36), with `.kernel`, `.local_chart` (every gerb has a local splitting
chart), `.conjugation` (the semilinear automorphism of `H` induced by an element of `E` over `σ`,
through §1.24), `neutral H` (the neutral gerb `H(k') ⋊ Γ`), `.base_extension`. Define
`GaloisGerbMorphism E E'`: a continuous homomorphism over `𝟙_Γ` together with an algebraic
`k'`-group homomorphism `H → H'` whose map on points agrees with the extension map on the kernel,
with `identity`, `comp`, `kernel_points`; `GerbConjugacy f_1 f_2`: there is `h ∈ H'(k')` with
`Int(i'(h)) ∘ f_1 = f_2`, with `refl`, `symm`, `trans` (conjugators are retained as data, never
quotiented before an application asks). Define `conjugatorScheme f_1 f_2` (the scheme `Isom(f_1,
f_2)` of §1.24) and `ProGerb`: a compatible projective system of gerbs with continuous extension
transitions and algebraic kernel transitions, with `.stage`, `.transition`, `.stagewise_conjugate`,
and pro-morphisms. Prove `conjugator_representability`: for morphisms `f_1, f_2 : E → E'` of Galois
gerbs, `Isom(f_1, f_2)` and `I_f` are represented by closed subschemes of `H'` and are forms of
centralisers (Kisin 2017, §3.1.1 and Lemma 3.1.2, pp. 35–36). Prove `splitting_field_extension`: for
`k'' ⊇ k'` Galois over `k`, a `k'/k`-gerb induces a `k''/k`-gerb by pulling back along `Gal(k''/k) →
Gal(k'/k)` and extending the kernel, compatibly with morphisms and conjugacy (Kisin 2017, §3.1.2).
*Needs:* §1.24; Mathlib `GroupExtension`, `Topology.IsEmbedding`, `IsQuotientMap`, `Homeomorph`,
`krullTopology`.

**Checks.**
- `TopologicalExtension.test_kernel` (in `N ⋊ Γ`, an element lies in the kernel iff its `Γ`-part is
  `1`), `test_unit` (the extension `Γ → Γ` with trivial kernel), `test_wrong_topology` (a strictly
  coarser topology on the embedded kernel violates the embedding clause).
- `LocalSplitChart.test_neutral` (`U = Γ`, `s(γ) = (1, γ)`), `test_c4` (for `C_4 → C_2` the trivial
  open subgroup has a chart but `C_2` itself has no continuous section), `test_unit_coordinate`.
- `GaloisGerb.test_neutral` (for `H/k`, the neutral gerb is `H(k') ⋊ Gal(k'/k)` with the standard
  semilinear action), `test_c4` (the `C_4` extension of `Gal(ℂ/ℝ) = C_2` by `μ_2(ℂ)` is a gerb for
  `H = μ_2` that is not neutral), `test_alg_closed` (for `k' = k` algebraically closed the quotient
  is trivial and a gerb is `H(k)`).
- `GaloisGerbMorphism.test_power` (over algebraically closed `k`, the `n`-th power map of `𝔾_m`
  kernels), `test_identity`, `test_conjugation` (for the neutral `𝔾_m`-gerb over `ℂ/ℝ`, complex
  conjugation on the kernel is not a morphism over `𝟙_Γ`).
- `GerbConjugacy.test_identity`, `test_trivial_kernel` (conjugacy is equality), `test_not_any_lift`
  (an element projecting nontrivially to `Γ` is not a conjugator).
- `ProGerb.test_constant` (a constant system recovers the gerb), `test_kottwitz` (the Kottwitz
  protorus has character group `ℚ`, the direct limit of integral character lattices
  of its finite-dimensional torus stages), `test_wrong_global_conjugacy`
  (stagewise nonempty conjugator sets do not give a global conjugacy: the compactness argument is a
  theorem of §1.24's representability, not a definition).

### Examples

The folded line and `𝔸¹/ℤ` (§1.12) separate "algebraic space" from "scheme"; `B𝔾_m`, `Bμ_p` and
`B(ℤ/p)` over `𝔽_p` separate algebraic, Deligne–Mumford and tame (§§1.19, 1.23);
`Spec L → Spec K` for a quadratic Galois extension is the standing nontrivial torsor (§1.15); the
dual numbers over a point separate geometric from topological quotients (§1.17).

### Dependencies

Layer 0: §0.12–§0.14 (henselian pairs, in §1.24's conjugator representability), §0.21 (excellence,
in §1.23's Keel–Mori). Layer 2: §2.3 (the torsor-class carrier) and §2.11 (Hilbert 90) are used by
§1.15 and §1.16 only; §2.3 depends on nothing in Layer 1, so the graph is acyclic. Mathlib and Tau
Ceti as listed; ModularCurves 0B–0E and 9D; StableReduction Layer 2.

## Layer 2: sites and scheme cohomology

The cohomology layer. On top of Mathlib's `Sheaf.H` it provides the generic functoriality of sheaf
cohomology on sites (pullback, higher direct images, Leray and Čech spectral sequences, torsors and
nonabelian `H¹`, the `H²` class of a central extension and of a gerbe, Godement resolutions,
Grothendieck vanishing); quasi-coherent cohomology beyond the curve and proper-flat cases of the curve
roadmaps, with cohomology with supports, local cohomology, depth and Cousin complexes; the comparison
of cohomology across the Zariski, Nisnevich, étale, fppf and pro-étale topologies with the coefficient
sheaves `𝔾_a`, `𝔾_m`, `μ_n`, Hilbert 90 and the Kummer and Artin–Schreier sequences; the Nisnevich
site with elementary distinguished squares; étale cohomology of fields, limits, Galois coverings,
henselian pairs, curves and proper hypercoverings for arbitrary abelian sheaves; the pro-étale site
foundations; coherent Grothendieck duality in the generality of the Stacks Project's chapter on
duality for schemes; the Brauer group of a scheme by Azumaya algebras with its class in
`H²(X_ét, 𝔾_m)`; and equivariant sheaf cohomology for a discrete group acting semilinearly.

**Conventions of this layer.** Abelian sheaves on the small étale site take values in
`AddCommGrpCat.{u}`, pro-étale sheaves in `AddCommGrpCat.{u+1}`, as in Mathlib's `EllAdicCohomology`.
Complexes are cohomologically indexed. `D(O_X)` is Mathlib's `DerivedCategory X.Modules`;
`D_QCoh(O_X)` its full subcategory of complexes with quasi-coherent cohomology sheaves; `f^!` is
defined on `D⁺_QCoh` for separated morphisms of finite type between Noetherian schemes. `G_K` is
Mathlib's `Field.absoluteGaloisGroup`. Finite-coefficient étale cohomology, base change, compact
support, the ℓ-adic realization, Frobenius, the Artin comparison and the trace formula are the
CohomologicalPointCounting family; affine acyclicity, the Čech computation, flat
base change and Jacobians are JacobianChallenge Layers A–D; proper coherence and the relative
dualising sheaf of curves are StableReduction Layer 2; Hilbert 90 for fields, Kummer theory and
continuous cohomology are ProfiniteCohomology Layers 9–10; the field Brauer group as `H²` is
QuadraticFormInvariants Layer 7. Étale supports, the étale `f^!`, absolute purity and purity for
the Brauer group are EtaleDualityAndPerverseSheaves; algebraic stacks are Layer 1; Chow groups are
Layer 5.

### 2.1 Pullback and higher direct images on sites

For cohomology transport through an exact additive coefficient functor `pb`,
`Sheaf.H.pullback` also requires a specified map `ℤ_J → pb(ℤ_K)` between constant sheaves.
For a morphism of sites this is the canonical comparison of its inverse-image functor;
an arbitrary exact functor without this comparison does not specify cohomology pullback.

For a morphism of sites given by a continuous functor `u : D ⥤ C` with exact inverse image `pb =
u.sheafPullback` (Mathlib `Functor.sheafPullback`), define `Sheaf.H.pullback pb G n : G.H n →+
(pb.obj G).H n` for every abelian sheaf `G` on `D` and `n ≥ 0` (Stacks, Lemma 21.14.1 (072X),
Lemmas 21.7.1–21.7.4 (01FU)), with `pullback_zero` (in degree `0`, composed with `Sheaf.H.equiv₀`, it
is restriction of sections), `pullback_naturality` (in `G`), `pullback_id`, `pullback_comp` (along a
composite, through `u⁻¹ v⁻¹ ≅ (v u)⁻¹`), `pullback_δ` (commutes with the connecting homomorphisms of
a short exact sequence and its exact pullback). Define `Sheaf.higherDirectImage pf i := pf.rightDerived
i` for the sheaf pushforward `pf` of a morphism of sites (Grothendieck abelian source), with
`higherDirectImage_zero` (`R⁰f_* ≅ f_*`), `higherDirectImage_iso_sheafify` (`R^i f_* F` is the
sheafification of `V ↦ H^i(u(V), F)`), `higherDirectImage_δ` (long exact sequence),
`Sheaf.derivedPushforward` (`Rf_* : D⁺(Ab(C)) → D⁺(Ab(D))`) and `derivedPushforward_comp` (`R(g∘f)_* ≅
Rg_* Rf_*`, pushforward preserves injectives) (Stacks, Lemma 21.7.4 (072W)). *Needs:* Mathlib
`Sheaf.H`, `Sheaf.H.map`, `Sheaf.H.equiv₀`, `Functor.sheafPullback`, `sheafPushforwardContinuous`,
`Functor.rightDerived`, `IsGrothendieckAbelian`, `HasExt`.

**Checks.**
- `Sheaf.H.test_pullback_id_etale`: for the identity of `X_ét` and `n = 2` the pullback is the
  identity.
- `Sheaf.H.test_pullback_zero_restriction`: for an open immersion `j : U → X` and the small Zariski
  sites, pullback in degree `0` on `O_X` is restriction `O(X) → O(U)`.
- `Sheaf.H.test_pullback_not_iso`: for `Spec ℂ → Spec ℝ` and `G = ℤ/2`, `H¹(Spec ℝ, ℤ/2) ≅ ℤ/2 →
  H¹(Spec ℂ, ℤ/2) = 0` is not injective.
- `Sheaf.test_higherDirectImage_id`: `R¹ id_* F = 0`.
- `Sheaf.test_higherDirectImage_zero_eq`: `R⁰f_* F` is Mathlib's `sheafPushforwardContinuous`.
- `Sheaf.test_higherDirectImage_sepClosed_base`: for `f : X → Spec k`, `k` separably closed, the
  global sections of `R^i f_* F` are `H^i(X_ét, F)`.

### 2.2 Leray and Čech spectral sequences

Prove `leray_spectral_sequence`: for a morphism of sites `f` and an abelian sheaf `F`, a convergent
spectral sequence `E_2^{p,q} = H^p(D, R^q f_* F) ⇒ H^{p+q}(C, F)`, natural in `F`, with its relative
form for a composite `g ∘ f` (`R^p g_* R^q f_* F ⇒ R^{p+q}(g∘f)_* F`) and the edge maps
(Stacks, Lemmas 21.14.5, 21.14.7 (072X)). Prove `cech_to_cohomology`: for a covering `U` of `V`, the
Čech-to-cohomology spectral sequence `Ȟ^p(U, H^q(F)) ⇒ H^{p+q}(V, F)`, and Leray's acyclicity
theorem: if `H^q(U_{i_0…i_p}, F) = 0` for all `q > 0` and all finite intersections, then Čech
cohomology computes `H^*(V, F)` (Stacks, Lemmas 21.10.1–21.10.7 (03AV); Theorem 59.19.2 (03OW)).
Spectral sequences are stated with Mathlib's `CategoryTheory.Abelian.SpectralObject` and
`HasSpectralSequence`, attached to the filtered complexes of injective resolutions. *Needs:* §2.1;
Mathlib `SpectralObject`, `HasSpectralSequence`, `CechNerve`.

**Checks.**
- `leray_test_identity`: for `f = 𝟙` the spectral sequence degenerates to the identity.
- `leray_test_finite_cover`: for a finite Zariski cover of a separated scheme by affines and a
  quasi-coherent `F`, Leray's acyclicity theorem gives JacobianChallenge Layer B's Čech computation.
- `leray_test_not_degenerate`: for `𝔸² ∖ {0} → Spec k` and `F = O`, `R¹f_* O ≠ 0` and the
  spectral sequence has a nonzero term `E_2^{0,1}`. Since the base is a point,
  the other columns vanish and this term survives; it is not evidence of a nonzero differential.

### 2.3 Torsors and the first cohomology: the carrier of torsor classes

For a sheaf of groups `G` on a site `(C, J)`, define a `G`-torsor: a sheaf of sets `P` with a left
`G`-action that is locally nonempty and on which `G` acts simply transitively (`G × P → P × P` is an
isomorphism) (Stacks, Definition 21.4.1 (03AG)). Define `NonabelianH1 J G : Type (u+1)`, the pointed
set of isomorphism classes of `G`-torsors, with the base point the trivial torsor `G`
(Stacks, Lemma 21.4.2). This is the **one carrier of torsor classes** of the roadmap: Layer 1's
geometric torsor classes are `NonabelianH1` of the big fppf site over `S` with coefficients `h_G`
(§1.15), and Layer 3's Picard torsors are its `𝔾_m`-instances. API: `NonabelianH1.mk P h` (the class
of a torsor), `mk_eq_one_iff` (the base point iff `P` has a global section), `map φ` for a
homomorphism `G → G'` (by contracted product, with `map_id`, `map_comp`, `map_one`),
`pullback` along a morphism of sites (compatible with composition), `connecting` (for an exact
sequence `1 → A → B → Q → 1` of sheaves of groups, `Q(C) → NonabelianH1 J A` sends a section to its
torsor of lifts), `exact_sequence` (`1 → A(C) → B(C) → Q(C) → H¹(A) → H¹(B) → H¹(Q)` is exact as
pointed sets), and the comparison `equivSheafH`: for an abelian sheaf `G`, `NonabelianH1 J G ≃
Sheaf.H G 1` sending `mk P` to the class of the extension `0 → G → P̃ → ℤ → 0` built from `P`,
compatible with `map`, `pullback` and `connecting` (Stacks, Lemmas 21.4.2–21.4.3 (03AG)). *Needs:*
Mathlib `Sheaf`, `GrpCat`, `Sheaf.H`, `PresheafOfGroups.H1` (the Čech version for one covering, to
which `NonabelianH1` restricts on classes trivialised by that covering: `NonabelianH1.cechEquiv`).

**Checks.**
- `NonabelianH1.test_trivial_group`: for the trivial sheaf of groups the set is a point.
- `NonabelianH1.test_abelian_agrees`: for `G = ℤ/2` on `(Spec ℝ)_ét`, `NonabelianH1` has two
  elements, matching `Sheaf.H (ℤ/2) 1 ≅ ℤ/2` through `equivSheafH`.
- `NonabelianH1.test_gl_n_local`: for a local ring `A` and `G = GL_n` on the small Zariski site of
  `Spec A`, the set is a point (every locally free module of rank `n` on a local scheme is free).
- `NonabelianH1.test_not_group`: for constant nonabelian `G`, cocycles over a field
  are continuous homomorphisms from its absolute Galois group to `G`, modulo conjugacy.
  Pointwise multiplication need not preserve homomorphisms: for `G = S₃`, two maps
  from a quadratic quotient sending its generator to distinct transpositions have product
  a 3-cycle, which cannot be the image of an element of order two.

- `CentralExtension.test_split`: for `A → A × Q → Q`, `δ = 0`.
- `CentralExtension.test_matrix_algebra`: for `1 → 𝔾_m → GL_d → PGL_d → 1` on `X_ét` and the trivial
  `PGL_d`-torsor (the class of `Mat_d(O_X)`), `δ = 0`.
- `CentralExtension.test_abelian_connecting`: for an abelian short exact sequence, `δ` composed with
  `equivSheafH` is Mathlib's connecting homomorphism `H¹(Q) → H²(A)`.
- `CentralExtension.test_quaternion_real`: for `X = Spec ℝ` and the Hamilton quaternions, `δ` of the
  `PGL_2`-torsor of `ℍ` is the nonzero element of `H²((Spec ℝ)_ét, 𝔾_m) ≅ ℤ/2`, so `ℍ` is not a
  matrix algebra.
- `CentralExtension.test_depends_on_extension`: on `(Spec ℝ)_ét` with `A = μ_2`, `Q = ℤ/2`, the
  split extension and the extension `ℤ/4` (`1 → μ_2 → ℤ/4 → ℤ/2 → 1`) have different boundaries on
  the torsor `Spec ℂ`: `0` and the class of the cup square `(−1) ∪ (−1) ≠ 0` in `H²(ℝ, μ_2)`.

### 2.5 Slice sites, Godement resolutions, flasque sheaves, Grothendieck vanishing, filtered colimits

Prove `slice_site_cohomology`: for an object `U` of a site, `H^n(C/U, F|_U) = H^n(U, F)`, Mathlib's
`cohomologyPresheafObjIsoOverH` (Stacks, Lemma 21.7.1 (03F3)). Define `godementResolution F` for an
abelian sheaf (or `O_X`-module) on a topological space `X` with enough points: the cosimplicial
resolution `F → f_* f^* F → f_* f^* f_* f^* F → ⋯` for `f : ⨆_x {x} → X`, as a cochain complex, with
`godementResolution_quasiIso` (the augmentation is a quasi-isomorphism), `_isFlasque` (every term is
flasque), `_exact` (as a functor to complexes), `_restrict` (compatible with restriction to opens),
`sheafH_iso_godement` (`H^n(U, F)` is the cohomology of the sections of the resolution; Mathlib's
`Sheaf.H`) (Stacks, Lemmas 20.30.1–20.30.2 (0FKR)). Prove `flasque_cech_vanishing`: a flasque
sheaf on a space has vanishing higher Čech cohomology for every open covering and is acyclic for
`H^n` (Tau Ceti's `Topology.subsingleton_H_succ_of_isFlasque` is the sheaf-cohomology half; Stacks,
Lemmas 20.12.3–20.12.6 (09SV)). Prove `noetherianSpace_vanishing`: on a Noetherian space of Krull
dimension `≤ d`, `H^p(X, F) = 0` for every abelian sheaf `F` and `p > d` (Stacks, Proposition 20.20.7
(02UZ)). Prove `cohomology_filtered_colimits`: on a site with a basis of quasi-compact objects
(coherent site) cohomology commutes with filtered colimits of abelian sheaves (Stacks, Lemma 21.16.1
(0737)). *Needs:* §2.1; Mathlib `TopCat.Sheaf`, `IsFlasque`, `NoetherianSpace`,
`topologicalKrullDim`, `cohomologyPresheafObjIsoOverH`; Tau Ceti
`Topology.subsingleton_H_succ_of_isFlasque`.

**Checks.**
- `test_godement_point`: on a one-point space the Godement resolution of `M` has cohomology `M` in
  degree `0` and `0` elsewhere.
- `test_godement_skyscraper`: for the Sierpiński space and the skyscraper `ℤ` at the closed point,
  the degree-`0` term `f_* f^* F` has global sections `ℤ`.
- `test_godement_not_injective`: the terms of the Godement resolution of the constant sheaf `ℤ` on
  the Sierpiński space are flasque but not injective.
- `noetherianSpace_vanishing_test_curve`: on a curve `H^2 = 0`; `test_sharp`: on `ℙ^d` the bound is
  sharp (`H^d(ℙ^d, O(−d−1)) ≠ 0`).

### 2.6 Quasi-coherent cohomology

Prove `qcoh_higherDirectImages`: for `f : X → S` quasi-compact and quasi-separated and `F`
quasi-coherent, `R^p f_* F` is quasi-coherent, computed on affines by `H^p(f⁻¹ U, F)`, commutes with
flat base change, vanishes for `p` larger than a bound depending only on `f`, and commutes with
filtered colimits (Stacks, Lemmas 30.4.1–30.4.6 (01XH)). Prove `projectiveSpace_cohomology`:
`H^q(ℙ^n_A, O(d))` for every `q`, `d` and ring `A`: `Sym^d` in degree `0`, the dual module in degree
`n`, zero otherwise (Stacks, Lemmas 30.8.1–30.8.3 (01XS)). Prove `ample_serre_vanishing`: for `X`
proper over a Noetherian ring and `L` ample, every coherent `F` has `H^q(X, F ⊗ L^n) = 0` for `q > 0`
and `n ≫ 0`, and `H^q(X, F)` is finite (Stacks, Lemma 30.17.1 (01XO)). Prove
`proper_fibreDimension_vanishing`: for `f` proper with fibres of dimension `≤ d`, `R^q f_* F = 0` for
`q > d` and `F` quasi-coherent (Stacks, Lemma 30.20.9 (02V7)). Prove `serre_affineness_criterion`:
a quasi-compact scheme `X` is affine iff `H¹(X, I) = 0` for every quasi-coherent ideal `I`, iff
`H^q(X, F) = 0` for all `q > 0` and quasi-coherent `F` (Stacks, Lemmas 30.3.1, 30.3.2, 30.3.4
(01XE)). *Needs:* §0.3, §0.4; Tau Ceti `Scheme.Modules.Cohomology`; StableReduction Layer 2 (relative
ampleness); JacobianChallenge Layer B.

**Checks.**
- `test_projectiveLine_cohomology`: `H¹(ℙ¹_k, O(−2)) ≅ k` and `H⁰(ℙ¹_k, O(1))` has dimension `2`.
- `test_affine_vanishing`: on `Spec A` every quasi-coherent module is acyclic.
- `test_not_affine_punctured_plane`: `H¹(𝔸² ∖ {0}, O) ≠ 0`, so `𝔸² ∖ {0}` is not affine.

### 2.7 Cohomology with supports and local cohomology

Define `sectionsWithSupport Z F := ker(F(X) → F(X ∖ Z))` for a closed `Z ⊆ X`, `supportedSubsheaf Z
F` (the sheaf `H_Z(F)` on `Z`), `cohomologyWithSupport Z F q := R^q Γ_Z(X, −)` applied to `F` with
its `O(X)`-module structure, and `localCohomologySheaf Z F q := R^q H_Z(F)` (Stacks, Section 20.21
(0A39)). API: `cohomologyWithSupport_zero`, `cohomologyWithSupport_univ` (`Z = X` gives `H^q`,
`Z = ∅` gives `0`), `rHZ_adjunction` (`RH_Z` is right adjoint to `i_*` on derived categories),
`localToGlobal` (the spectral sequence `H^p(Z, H^q_Z(K)) ⇒ H^{p+q}_Z(X, K)`),
`cohomologyWithSupport_pullback`. Prove `supports_localization_triangle`: for `Z ⊆ X` closed with
complement `U`, the distinguished triangle `RΓ_Z(X, K) → RΓ(X, K) → RΓ(U, K) →` and its long exact
sequence, and the excision isomorphism for `Z ⊆ V` open (Stacks, Lemmas 20.34.5–20.34.7 (0G6Y)).
Prove `localCohomology_module_comparison`: for `X = Spec A`, `Z = V(I)` and `F = M~`,
`H^q_Z(X, F) = H^q_I(M)` is Mathlib's `localCohomology` (Stacks, Lemma 47.9.1 (0A6R)). Prove
`localCohomology_flat_baseChange`: for `A → B` flat, `H^q_I(M) ⊗_A B = H^q_{IB}(M ⊗_A B)`, and flat
excision (Stacks, Lemma 47.9.3 (0ALZ)). Prove `depth_localCohomology_vanishing`: for `A` Noetherian,
`M` finite and `I` an ideal, `H^q_I(M) = 0` for `q < depth_I M` and `H^{depth}_I(M) ≠ 0` (Stacks,
Lemmas 47.11.1, 47.11.3 (0AVY)). *Needs:* §0.17, §2.1, §2.6; Mathlib `localCohomology`.

**Checks.**
- `test_support_all`: `H¹_X(X, F) = H¹(X, F)`; `test_support_empty`: `H^q_∅ = 0`.
- `test_support_affine_line_origin`: for `X = 𝔸¹_k`, `Z = {0}`, `H¹_Z(X, O) ≅ k[t, t⁻¹]/k[t]` and
  `H⁰_Z(X, O) = 0`.
- `test_support_not_restriction`: `H⁰_Z(X, F)` is not `F(Z)`: for `𝔸¹`, `Z = {0}`, `F = O`, the
  restriction has sections `k` while `H⁰_Z = 0`.
- `test_depth_dvr`: for a DVR `R` and `I = m`, `H⁰_m(R) = 0` and `H¹_m(R) = K/R`.

### 2.8 Cousin complexes

For a filtration `X = Z_0 ⊇ Z_1 ⊇ ⋯` by closed subsets and an `O_X`-module `F`, define
`relativeSupportCohomology Z i F k := H^k_{Z_i/Z_{i+1}}(F)` (sections supported on `Z_i` modulo
`Z_{i+1}`, derived) and `cousinComplex Z F`, the complex `⋯ → ⊕ H^i_{Z_i/Z_{i+1}}(F) → ⊕
H^{i+1}_{Z_{i+1}/Z_{i+2}}(F) → ⋯` with augmentation `F → Cous^0`, with `cousinComplex_d_comp_d`,
`cousinComplex_isQuasicoherent` (for `X` Noetherian and `F` quasi-coherent), `relativeSupportCohomology_concentration`
(for the codimension filtration and a maximal Cohen–Macaulay coherent sheaf on a
Cohen–Macaulay scheme, local cohomology is concentrated in the codimension degree;
affineness of a stratum alone does not imply this), `cousinComplex_trivial`
(Boxer–Calegari–Gee–Pilloni 2021, §3.9.5, (3.9.8), pp. 63–64). Prove `kempf_cousin_resolution`: for
`X` Cohen–Macaulay (§0.18) with the codimension filtration and `F` a maximal Cohen–Macaulay coherent
sheaf, `F → Cous_Z(F)` is a resolution (Boxer–Calegari–Gee–Pilloni 2021, Theorem 3.9.6, Remark 3.9.7,
Example 3.9.9, pp. 64–65). *Needs:* §0.18, §2.7.

**Checks.**
- `test_cousin_trivial_filtration`: for `Z_0 = X`, `Z_1 = ∅` the augmentation is an isomorphism.
- `test_cousin_dvr`: for `X = Spec R` of a DVR and `Z_1` the closed point, `Cous(O_X)` is `K → K/R`
  and the augmentation is a resolution of `R`.
- `test_cousin_not_resolution`: for `X = Spec k[x, y]/(xy, y²)` (embedded point) with `Z_1` the
  origin, the augmentation is not a quasi-isomorphism.

### 2.9 Big-site sheaves of quasi-coherent modules and the sheaves `𝔾_a`, `𝔾_m`, `μ_n`

Define `bigSheaf F` for a quasi-coherent `O_S`-module `F`: the sheaf `F^a : (T, h) ↦ Γ(T, h^* F)` on
the big fpqc site over `S`, hence on every coarser topology, with `bigSheaf_obj`, `bigSheaf_isSheaf`
(for Zariski, étale, fppf, fpqc), `bigSheaf_exact` (short exact sequences of quasi-coherent modules
go to short exact sequences of sheaves), `bigSheaf_pullback` (restriction along `S' → S` is
`(g^* F)^a`), `bigSheaf_structureSheaf` (`(O_S)^a` is the structure sheaf `𝔾_a` as a sheaf of
rings), `bigSheaf_fullyFaithful` (Stacks, Lemma 35.8.1 (03DT)). Define `Ga S` (`T ↦ Γ(T, O_T)`,
additive), `Gm S` (`T ↦ Γ(T, O_T)^×`) and `mu S n` for every integer `n ≥ 1` (`T ↦ {t ∈ Γ(T, O)^× :
t^n = 1}`), sheaves of abelian groups on the big fpqc site over `S`, and their restrictions `GmEtale
X`, `muEtale X n` to the small étale site (Stacks, Section 59.28 (03PK)). API: `Gm_obj`, `powHom S
n`, `mu_eq_ker_pow` (`μ_n = ker(n : 𝔾_m → 𝔾_m)`), `Gm_restrict_small`, `mu_eq_cpc` (for `n`
invertible on `S`, `muEtale S n` is ConstructibleEtale Layer 6's roots-of-unity sheaf). `μ_n` here
is defined for every `n`, as a subsheaf of `𝔾_m` on the fppf site; it is representable by
`Spec_S O_S[t]/(t^n − 1)` and is not étale when `n` is not invertible. *Needs:* §0.4; Mathlib
`fpqcTopology`, `Over`, `rootsOfUnity`; ConstructibleEtale Layer 6 (comparison only).

**Checks.**
- `test_bigSheaf_zero`: `0^a = 0`; `test_bigSheaf_spec_field`: for `S = Spec k`, `F = O_S`,
  `F^a(Spec L) = L`; `test_bigSheaf_zariski_restriction`: restriction to the small Zariski site gives
  back `F`; `test_bigSheaf_not_topological_pullback`: `O^a(Spec ℚ(i)) = ℚ(i)`, not the topological
  inverse image's `ℚ`.
- `test_mu_one`: `μ_1 = 0`; `test_Gm_field`: `𝔾_m(Spec ℚ) = ℚ^×` and `μ_2(Spec ℚ) = {±1}`.
- `test_mu_p_not_etale_trivial`: over `S = Spec 𝔽_p`, `μ_p` has trivial sections on every reduced
  `S`-scheme and nonzero sections on `Spec 𝔽_p[ε]/(ε^p)`, so it is not the constant sheaf `0` and
  not étale.

### 2.10 Comparison morphisms between the topologies of a scheme

Define the morphisms of topoi `epsilonFppfEtale X` (big fppf to big étale over `X`), `aX` (big fppf
sheaves to `Sh(X_ét)`, with `a_X^{-1} F (T) = Γ(T_ét, F|_T)`), `etaleToNisnevich X`
(`Sh(X_ét) → Sh(X_Nis)`), `nisnevichToZariski X` (`Sh(X_Nis) → Sh(X_Zar)`), through their exact
inverse-image functors, with `comparison_comp` (coherent composition), `comparison_baseChange`
(compatibility with the morphisms induced by `Y → X`), `aX_inverseImage_obj` (Stacks, Lemmas
59.100.1–59.100.2 (0DDK)). Prove `quasiCoherent_topology_comparison`: for `F` quasi-coherent,
`H^q(X_Zar, F) = H^q(X_ét, F^a) = H^q(X_fppf, F^a) = H^q(X_fpqc, F^a)` (Tau Ceti's
`Scheme.Modules.Cohomology` is the Zariski term) (Stacks, Proposition 35.9.3 (03DW)). Prove
`etale_pullback_fppf_comparison`: for an abelian sheaf `F` on `X_ét`, `H^q(X_ét, F) = H^q_fppf(X,
a_X^{-1} F)` (Stacks, Lemmas 59.100.5–59.100.8 (0DDK)). Prove `smoothGroup_fppf_etale_comparison`:
for a smooth commutative group scheme `G` over `X`, `H^q(X_ét, G) = H^q(X_fppf, G)` (Česnavičius
2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A). *Needs:* §2.1, §2.6, §2.9, §2.12;
Mathlib `etaleTopology`, `fppfTopology`, `Opens.grothendieckTopology`.

**Checks.**
- `test_comparison_id`: the étale-to-étale comparison is the identity.
- `test_aX_constant`: `a_X^{-1}` of the constant sheaf `ℤ/2` is the constant fppf sheaf `ℤ/2`.
- `test_zariski_not_etale`: for `X = Spec ℝ`, `H¹_Zar(X, μ_2) = 0` while `H¹_ét(X, μ_2) ≅ ℝ^×/ℝ^{×2}
  ≅ ℤ/2`.
- `test_fppf_not_etale_mu_p`: over `Spec 𝔽_p[t, t⁻¹]`, `H¹_fppf(X, μ_p) ≅ ℤ/p` while `H¹_ét(X, μ_p) = 0`: the fppf
  group is `Γ(X, O)^×/p` by the Kummer sequence (§2.11) while the étale sheaf `μ_p` has trivial
  sections on reduced schemes.

### 2.11 Hilbert 90, the Kummer and Artin–Schreier sequences, finite pushforward

Prove `hilbert90`: for every scheme `X`, `H¹(X_ét, 𝔾_m) ≅ Pic(X)`, Tau Ceti's `LineBundleClass X`
as a group, and `H¹(X_Zar, 𝔾_m) = H¹(X_ét, 𝔾_m) = H¹(X_fppf, 𝔾_m)` (Stacks, Theorem 59.24.1 (03P8)).
This is the single statement of "the Picard group as `H¹` of the units"; Layer 3's Picard theory
and §1.15's `picEquiv` cite it. Prove `fppf_kummer_sequence`: for every integer `n ≥ 1`, the sequence
`1 → μ_n → 𝔾_m → 𝔾_m → 1` (`n`-th power) is exact on the big fppf site of every scheme, giving
`0 → Γ(X, O)^×/n → H¹_fppf(X, μ_n) → Pic(X)[n] → 0` and `0 → Pic(X)/n → H²_fppf(X, μ_n) → Br′(X)[n]
→ 0` through `hilbert90` and §2.22's `Br′` (Stacks, Lemmas 59.28.1, 59.28.3, Remark 59.28.4, Lemma
59.28.5 (03PK)); for `n` invertible on `X` the sequence is already exact on the étale site, which is
ConstructibleEtale Layer 6's theorem, and the two agree through §2.10's comparison. Prove
`artinSchreier_sequence`: in characteristic `p` the sequence `0 → ℤ/p → 𝔾_a → 𝔾_a → 0`
(`x ↦ x^p − x`) is exact on `X_ét`, giving `H^q(X_ét, ℤ/p) = 0` for `q ≥ 2` and `X` affine, and the
`p`-cohomological dimension of a scheme of dimension `d` in characteristic `p` is at most `d + 1`
(Stacks, Lemmas 59.63.1–59.63.6 (0A3J)). Prove `finite_pushforward_exact`: for `f : X → Y` finite,
`f_*` is exact on abelian sheaves on the small étale sites and `R^q f_* = 0` for `q > 0`; for `f`
integral, `f_*` commutes with arbitrary base change (Stacks, Lemma 59.55.1, Proposition 59.55.2,
Lemmas 59.55.3–59.55.4 (03QN)); the pushforward along a morphism of small étale sites is the site
functor of §2.1 (EtaleBaseChange Layer 0 builds the same functor and consumes this theorem for
finite coefficients). *Needs:* §2.1, §2.9, §2.10; Tau Ceti `LineBundleClass`.

**Checks.**
- `hilbert90_test_affine`: for `X = Spec A`, `H¹(X_ét, 𝔾_m) ≅ CommRing.Pic A`.
- `hilbert90_test_projectiveLine`: `H¹(ℙ¹_k, 𝔾_m) ≅ ℤ`.
- `kummer_test_field`: `H¹_fppf(Spec K, μ_n) = K^×/K^{×n}` for every field and every `n`, including
  `n = p` in characteristic `p` (where the étale group is `0`).
- `kummer_test_n_one`: for `n = 1` the sequence reads `1 → 0 → 𝔾_m = 𝔾_m → 1`.
- `artinSchreier_test_field`: `H¹(Spec k, ℤ/p) = k/(x^p − x)k`.
- `finite_pushforward_test_closed_point`: for `i : Spec k → 𝔸¹_k`, `i_*` is exact and
  `H^q(𝔸¹, i_* F) = H^q(Spec k, F)`.

### 2.12 Nisnevich coverings and the Nisnevich topology

Define `IsNisnevichCovering f` for a family of étale morphisms `{p_i : U_i → X}`: for every `x ∈ X`
there are `i` and `u ∈ U_i` with `p_i(u) = x` and `κ(x) → κ(u)` an isomorphism (Mathlib's
`Scheme.Hom.residueFieldMap`) (Morel–Voevodsky 1999, §3.1, Proposition 1.1, Definition 1.2, pp.
95–96); `nisnevichPrecoverage` and `nisnevichTopology := nisnevichPrecoverage.toGrothendieck` on
`Scheme`; `smallNisnevichTopology X` on `X.Etale`. API: `isNisnevichCovering_of_zariski`,
`nisnevichPrecoverage_le_etale`, `IsNisnevichCovering.pullback`, `.comp`,
`isNisnevichCovering_iff_henselization` (for a finite family over a Noetherian base: Nisnevich iff
the base change to every `Spec O^h_{X,x}` of §0.13 has a section), `zariskiTopology_le_nisnevichTopology`,
`nisnevichTopology_le_etaleTopology`, `nisnevichTopology_subcanonical`, `mem_nisnevichTopology_iff`,
`smallNisnevichTopology_le_smallEtale`, `smallNisnevich_comparison` (§2.10's morphisms). *Needs:*
§0.13; Mathlib `Etale`, `residueField`, `residueFieldMap`, `Precoverage`, `GrothendieckTopology`.

**Checks.**
- `test_covering_identity`: `{𝟙 X}` is a Nisnevich covering.
- `test_not_covering_real_complex`: for every **separable** quadratic extension `K/k` (so that
  `Spec K → Spec k` is an étale covering), `{Spec K → Spec k}` is not a Nisnevich covering: the
  residue field extension is not an isomorphism. For an inseparable extension the map is not étale
  and is not a member of either precoverage.
- `test_covering_quadratic_split`: `{Spec ℤ[1/10] → Spec ℤ[1/2], Spec ℤ[1/2][x]/(x² + 1) → Spec
  ℤ[1/2]}` is a Nisnevich covering: the second map is étale and over `(5)` the fibre has a point
  with residue field `𝔽_5`.
- `test_zariski_is_nisnevich`: `{D(2), D(3)}` of `Spec ℤ` is a Nisnevich covering.
- `test_nisnevich_between`, `test_nisnevich_not_etale` (the sieve generated by `Spec K → Spec k`,
  `K/k` separable quadratic, is étale-covering and not Nisnevich-covering),
  `test_nisnevich_field_global_sections` (every Nisnevich sheaf on `(Spec k)_Nis` is determined by
  its values on finite separable extensions and has vanishing higher cohomology),
  `test_nisnevich_representable_sheaf`.

### 2.13 Elementary distinguished squares, Mayer–Vietoris and the sheaf criterion

Define `ElementaryDistinguishedSquare X`: a cartesian square `U ×_X V → V`, `U ×_X V → U`,
`j : U → X`, `p : V → X` with `j` an open immersion, `p` étale, and the base change of `p` to the
reduced closed complement `Z := (X ∖ U)_red` an isomorphism `p⁻¹(Z)_red → Z` of schemes, recorded as
the data of the cartesian square `p⁻¹(Z)_red → V`, `p⁻¹(Z)_red → Z` together with an isomorphism
`p⁻¹(Z)_red ≅ Z` over `X` (Morel–Voevodsky 1999, §3.1, Definition 1.3 and the remark after it, p.
96). The pointwise form "one preimage with trivial residue extension" is weaker and admits extra
preimages with larger residue fields: `X = Spec ℝ`, `U = ∅`, `V = Spec ℝ ⊔ Spec ℂ` has exactly one
preimage with residue field `ℝ` and is not an isomorphism over the complement
(`test_eds_not_distinguished_extra_point` below). API: `isNisnevichCovering` (`{j, p}` is a
Nisnevich covering), `ofZariski` (an open cover `X = U ∪ V`), `pullback` along `Y → X`,
`isPullback`, `iso_over_complement`, `of_pointwise` (for finite `p⁻¹(Z) → Z`,
every fibre must consist of exactly one point and its residue-field map must be an isomorphism).
Finiteness alone does not repair uniqueness only among points with trivial residue extension:
the same `Spec ℝ ⊔ Spec ℂ` counterexample is finite. Prove `distinguishedSquare_mayerVietoris`: an elementary distinguished
square is a Mayer–Vietoris square for the Nisnevich topology (Mathlib's `MayerVietorisSquare`), so
every Nisnevich sheaf sends it to a pullback and every abelian Nisnevich sheaf has a long exact
Mayer–Vietoris sequence (Morel–Voevodsky 1999, §3.1, Lemma 1.6, Remark 1.7, pp. 97–98). Prove
`nisnevich_sheaf_criterion`: on the site of **Noetherian schemes of finite Krull dimension** with
the Nisnevich topology (the full subcategory `Scheme.NoetherianFiniteDim`, closed under étale maps
and fibre products), a presheaf of sets is a Nisnevich sheaf iff it sends the empty scheme to a
point and every elementary distinguished square to a pullback (Morel–Voevodsky 1999, §3.1,
Proposition 1.4, Lemma 1.5, pp. 96–98). The restriction to that site is essential: the criterion is
stated on the category of all schemes only with a hypothesis no scheme category satisfies. *Needs:*
§2.12; Mathlib `Square`, `IsPullback`, `MayerVietorisSquare`, `IsOpenImmersion`, `Etale`,
`IsNoetherian`, `topologicalKrullDim`.

**Checks.**
- `test_eds_zariski`: for an open cover `X = U ∪ V`, `ofZariski` gives a square whose `p` is the open
  immersion of `V`.
- `test_eds_affine_line`: `X = 𝔸¹_ℚ`, `U = 𝔸¹ ∖ {0}`, `V = 𝔸¹ ∖ {−1, −2}` with `p(s) = s² + 2s`: `p`
  is étale on `V`, `p⁻¹(0) ∩ V = {0}` with residue field `ℚ`, so `(U ⊂ X, p)` is an elementary
  distinguished square.
- `test_eds_not_distinguished`: `X = Spec ℝ`, `U = ∅`, `V = Spec ℂ`: `p` is étale and surjective but
  `p⁻¹(Z) → Z` is `Spec ℂ → Spec ℝ`, not an isomorphism.
- `test_eds_not_distinguished_extra_point`: `X = Spec ℝ`, `U = ∅`, `V = Spec ℝ ⊔ Spec ℂ`: the
  pointwise clause holds (one preimage with residue field `ℝ`) and the isomorphism clause fails
  (`p⁻¹(Z) = Spec ℝ ⊔ Spec ℂ ≠ Spec ℝ`); the structure rejects it.
- `test_sheaf_criterion_representable`: on `Scheme.NoetherianFiniteDim`, every representable
  presheaf satisfies the criterion.

### 2.14 Nisnevich points, cohomological dimension, Čech comparison and Brown–Gersten

Prove `nisnevich_points_henselization`: for `X` Noetherian the stalk functors at the henselizations
`Spec O^h_{X,x}` (§0.13) form a conservative family of points of `Sh(X_Nis)`, and every point is of
this form up to isomorphism (Morel–Voevodsky 1999, §3.1, paragraph before Lemma 1.11, p. 99). Prove
`nisnevich_cohomological_dimension`: for `X` Noetherian of Krull dimension `d`, `H^q(X_Nis, F) = 0`
for `q > d` and every abelian Nisnevich sheaf (Morel–Voevodsky 1999, §3.1, Proposition 1.8, pp.
98–99). Prove `nisnevich_cech_comparison`: on a Noetherian scheme of finite dimension, Čech
cohomology for Nisnevich coverings computes `H^q(X_Nis, F)` (Morel–Voevodsky 1999, §3.1,
Proposition 1.9, Example 1.10, p. 99). Prove `brownGersten_vanishing`: a presheaf of spectra (or
of complexes) on `Sm/S` satisfying the Brown–Gersten property (sending elementary distinguished
squares to homotopy pullbacks) that is Nisnevich-locally contractible is contractible on every
Noetherian finite-dimensional `X` (Morel–Voevodsky 1999, §3.1, Definitions 1.12–1.13, Proposition
1.16, Lemmas 1.17–1.18, pp. 100–102). *Needs:* §0.13, §2.5, §2.12, §2.13.

**Checks.**
- `test_nisnevich_field_vanishing`: for a field `k`, `H^q((Spec k)_Nis, F) = 0` for `q > 0`.
- `test_nisnevich_curve_dimension`: on a curve the Nisnevich cohomological dimension is `1`
  while the étale one of `𝔾_m` is `2` or more (Tsen, §2.16).
- `test_points_dvr`: on `Spec R` of a DVR, the two points are `Spec R^h` and `Spec K`.

### 2.15 Étale cohomology: Gabber, fields, limits, Hochschild–Serre

Prove `gabber_affine_proper_base_change`: for a henselian pair `(A, I)` (§0.14), `X = Spec A`,
`Z = V(I)` and a torsion abelian sheaf `F` on `X_ét`, `H^q(X, F) → H^q(Z, F|_Z)` is an isomorphism
for all `q`, with the lemmas on the structure of henselian pairs it rests on (Stacks, Theorem
59.82.7 (09ZI); Lemmas 59.82.1–59.82.6 (09Z8)). Prove `etale_galois_comparison`: for a field `K`
with separable closure `K^s`, the stalk functor identifies abelian sheaves on `(Spec K)_ét` with
discrete `G_K`-modules (`galoisModule K F` with its topological representation structure), and
`H^q((Spec K)_ét, F) ≅ H^q_cont(G_K, galoisModule K F)` (ProfiniteCohomology's continuous
cohomology) (Stacks, Lemmas 59.59.1–59.59.2, Example 59.59.3 (03QQ)). Prove
`etale_cohomology_limits`: for a cofiltered limit `X = lim X_i` of quasi-compact quasi-separated
schemes with affine transition maps (§0.9) and `F_i` a compatible system of abelian sheaves,
`H^q(X, F) = colim H^q(X_i, F_i)` (Stacks, Theorem 59.51.3 (09YQ)). Prove
`hochschildSerre_galois_covering`: for a Galois covering `Y → X` with group `G` (a finite étale
`G`-torsor) and an abelian sheaf `F` on `X_ét`, the spectral sequence `H^p(G, H^q(Y, F)) ⇒
H^{p+q}(X, F)`, and for a profinite Galois covering the continuous version (Milne LEC, §6,
Definition 6.1, Proposition 6.4, pp. 42–43; §14, Theorem 14.9, p. 96, and the application on p. 99).
*Needs:* §0.9, §0.14, §2.1, §2.2, §2.11; Mathlib `Field.absoluteGaloisGroup`, `TopRep`;
ProfiniteCohomology Layers 9–10.

**Checks.**
- `gabber_test_strictly_henselian`: for `A` strictly henselian local, `H^q(Spec A, F) = 0` for
  `q > 0` and torsion `F`.
- `galois_test_finite_field`: `H¹((Spec 𝔽_q)_ét, ℤ/n) ≅ ℤ/n` (`G = Ẑ`).
- `limits_test_separable_closure`: `H^q((Spec K^s)_ét, F) = 0` for `q > 0`, as the colimit over
  finite separable extensions.
- `hochschildSerre_test_quadratic`: for `Spec ℂ → Spec ℝ`, `H¹(Spec ℝ, 𝔾_m) = 0` and
  `H²(Spec ℝ, 𝔾_m) ≅ H²(ℤ/2, ℂ^×) ≅ ℤ/2`.

### 2.16 Tsen's theorem, `𝔾_m` on curves and proper hypercoverings

Prove `tsen_theorem`: for `k` algebraically closed and `K` a function field of transcendence degree
one over `k`, `K` is `C_1`, every central simple `K`-algebra is split, `Br(K) = 0` (Tau Ceti's
`BrauerGroup K` is trivial) and `H^q(G_K, K^{s×}) = 0` for `q ≥ 2` (Stacks, Proposition 59.67.4,
Definition 59.67.5, Theorems 59.67.8, 59.67.10, Lemmas 59.67.11–59.67.12 (0A2M)). Prove
`curve_Gm_cohomology`: for a smooth curve `X` over an algebraically closed field, `H^q(X_ét, 𝔾_m) =
0` for `q ≥ 2`, `H¹ = Pic(X)`, `H⁰ = Γ(X, O)^×`; for a proper smooth curve the degree sequence `0 →
Pic⁰(X) → Pic(X) → ℤ → 0`; and for `X` a smooth curve over a field `k` the cohomology of `𝔾_m` on
`X_{k^s}` with its Galois action (Stacks, Theorem 59.68.1, Lemmas 59.68.2–59.68.4, Theorem 59.68.5
(03RH)). The cohomology of `μ_n` on curves over an algebraically closed field follows from this
theorem and the Kummer sequence (§2.11) and is TraceFormula Layer 8's, which consumes both. Prove
`proper_hypercover_descent`: cohomological descent for proper hypercoverings: for a proper
surjective `X_0 → X` and the associated hypercovering, `RΓ(X, F) = RΓ(X_•, F)` for every abelian
sheaf `F` on `X_ét`, with the descent spectral sequence (Stacks, Lemmas 85.36.1–85.36.5 (0DHI)).
*Needs:* §2.11, §2.15; Tau Ceti `BrauerGroup`; Layer 3's genus is not needed here.

**Checks.**
- `tsen_test_rational`: `Br(k(t)) = 0` for `k` algebraically closed.
- `curve_Gm_test_affine_line`: `H^q(𝔸¹_{k̄}, 𝔾_m) = 0` for `q ≥ 1` (`Pic(𝔸¹) = 0`).
- `curve_Gm_test_projective_line`: `H¹(ℙ¹_{k̄}, 𝔾_m) = ℤ`, `H² = 0`.
- `hypercover_test_normalization`: for the nodal cubic and its normalisation `ℙ¹ → C`, the descent
  spectral sequence computes `H¹(C, ℤ/n) = ℤ/n` from `ℙ¹` and the two preimages of the node.

### 2.17 Pro-étale site foundations: replete topoi, w-contractible covers, left-completeness

Define `IsReplete T` for a category `T`: for every tower `⋯ → F_{n+1} → F_n → ⋯ → F_0` of
epimorphisms, every limit cone has epimorphic legs `lim F_n → F_m` (Bhatt–Scholze 2014, Definition
3.1.1, p. 16). API: `IsReplete.lim_epi`, `isReplete_of_locallyWeaklyContractible` (a locally weakly
contractible topos is replete; Proposition 3.2.3, pp. 17–18), `isReplete_proetale` (`Sh(X_proét)` is
replete for every scheme `X`, Mathlib's `Scheme.ProEt.topology`; Proposition 4.2.8, p. 29),
`IsReplete.derivedCategory_leftComplete` (if `T` is replete then `D(T)` is left-complete: `K ≅ R lim
τ_{≥ −n} K`; Proposition 3.3.3, p. 19), `IsReplete.derived_limits` (in a replete topos, `R lim` of a
tower of abelian sheaves with epimorphic transitions is computed by `lim`, and `lim¹ = 0`;
Proposition 3.1.10). Prove `w_contractible_cover`: every affine scheme admits a pro-étale cover by a
w-contractible affine scheme (`Spec A` with `A` w-contractible: every faithfully flat ind-étale `A →
B` has a section), and the w-contractible affines form a basis of the pro-étale site (Bhatt–Scholze
2014, Definition 2.4.1, p. 13; Lemma 2.4.9, p. 14; Theorem 1.5, p. 3; Proposition 4.2.8, p. 29).
Prove `proetale_left_completeness`: `D(X_proét, Λ)` is left-complete for every ring `Λ`, and the
unbounded derived category of pro-étale sheaves is compactly generated by the w-contractible objects
(Bhatt–Scholze 2014, Proposition 3.3.3, p. 19; Proposition 5.3.2, p. 38). These three theorems are
the foundations consumed by EllAdicRealization Layers 3–5, which own the étale-to-pro-étale morphism
`ν`, the comparison `H^q(X_ét, F) = H^q(X_proét, ν^* F)` for torsion `F` and its unbounded
extension, and lisse adic sheaves; none of those is restated here. *Needs:* §0.13 (ind-étale
algebras, for w-contractibility); Mathlib `ProEt.topology`, `Limits`, `Epi`, `DerivedCategory`.

**Checks.**
- `test_isReplete_types`: the category of types is replete.
- `test_isReplete_proetale_point`: for `X = Spec` of an algebraically closed field, `Sh(X_proét)` is
  replete (sheaves on profinite sets).
- `test_etale_not_replete`: for `X = Spec ℚ` the tower of surjections `μ_{ℓ^{n+1}} → μ_{ℓ^n}` of
  étale sheaves has limit `0` in `Sh(X_ét)`, so the legs are not epimorphisms: `Sh(X_ét)` is not
  replete.
- `test_w_contractible_field`: for an algebraically closed field `k`, `Spec k` is w-contractible;
  `Spec ℚ` is not (`Spec ℚ̄ → Spec ℚ` has no section).

### 2.18 Derived categories of quasi-coherent complexes

Define `DQCoh X`: the full triangulated subcategory of Mathlib's `DerivedCategory X.Modules` of
complexes all of whose cohomology sheaves are quasi-coherent (Stacks, Lemma 36.3.1 (06YZ)); `DCoh X`
for `X` locally Noetherian (coherent cohomology), with the bounded variants `D⁺_QCoh`, `D^b_Coh`.
API: `DQCoh.mem_iff`, `DQCoh.isTriangulated` (closed under shifts and cones), `DQCoh.hasCoproducts`
(direct sums computed in `D(O_X)`; Lemma 36.3.5), `DQCoh.affineEquiv` (for `X = Spec A`, `M ↦ M~`
is an equivalence `D(ModuleCat A) ≌ DQCoh (Spec A)` compatible with the standard t-structures;
Lemmas 36.3.8–36.3.9), `DQCoh.restrict` (restriction to opens), `DQCoh.tStructure`. Define
`derivedTensor` (`K ⊗^L_{O_X} L`) and `derivedHom` (`RHom_{O_X}(K, L)`) on `D(O_X)`, with
`derivedTensor_derivedHom_adj`, `derivedTensor_unit`, `derivedTensor_mem_DQCoh`,
`derivedHom_mem_DQCoh` (for `K` pseudo-coherent, §0.5, and `L ∈ D⁺_QCoh`), `perfect_dual` (for `K`
perfect, `RHom(K, L) ≅ RHom(K, O_X) ⊗^L L`) (Stacks, Sections 21.35 (08J7), 21.36 (0B6E)). Define
`derivedPullback f` (`Lf^*`, restricting to `DQCoh`) and `totalDirectImage f` (`Rf_*`, restricting
to `DQCoh` for `f` quasi-compact quasi-separated) with `derivedPullback_totalDirectImage_adj`,
`totalDirectImage_mem_DQCoh`, `totalDirectImage_coproduct`, `projectionFormula`,
`totalDirectImage_comp`, `cohomology_totalDirectImage` (`H^i(Rf_* F) = R^i f_* F` of §2.6)
(Stacks, Lemma 36.3.8). Prove `perfect_generator`: for `X` quasi-compact quasi-separated, `DQCoh X`
is generated by a single perfect complex and is compactly generated by perfect complexes (Stacks,
Lemmas 36.15.1–36.15.2, Theorem 36.15.3 (09IP)). Prove `torIndependent_baseChange`: for a cartesian
square with `g : S' → S` and `f : X → S` Tor-independent (`Tor_i^{O_S}(O_X, O_{S'}) = 0` for `i > 0`),
`Lg^* Rf_* K ≅ Rf'_* Lg'^* K` for `K ∈ DQCoh X` and `f` qcqs (Stacks, Definition 36.22.2, Lemmas
36.22.3, 36.22.5 (08ET)). *Needs:* §0.5, §2.6; Mathlib `DerivedCategory`, `Scheme.Modules`,
`tilde`, `HasExt`; Tau Ceti `Scheme.Modules.Cohomology`; JacobianChallenge Layer B.

**Checks.**
- `test_DQCoh_structure_sheaf`: `O_X[0] ∈ DQCoh X`.
- `test_DQCoh_affine_free`: under `affineEquiv` for `Spec ℤ`, `ℤ[0] ↦ O[0]` and `(ℤ/2)[0] ↦ (ℤ/2)~`,
  supported at `(2)`.
- `test_DQCoh_extension_by_zero_not_qc`: for `X = Spec` of a DVR and `j : U → X` the generic point,
  `j_! O_U[0]` is not in `DQCoh X`.
- `test_derivedTensor_unit`, `test_derivedTensor_affine_tor` (`(ℤ/2)~ ⊗^L (ℤ/2)~` has cohomology
  `(ℤ/2)~` in degrees `0` and `−1`), `test_derivedHom_affine_ext` (`H^i RHom(M~, N~) = Ext^i_A(M,
  N)~`), `test_underived_tensor_differs`.
- `test_pullback_identity`, `test_pushforward_projective_line` (`Rf_* O(−2) = k[−1]` for `ℙ¹_k →
  Spec k`), `test_pullback_affine_tensor` (`Lf^* M~` has cohomology `Tor_i^A(M, B)~` in degree `−i`),
  `test_underived_pullback_not_exact`.

### 2.19 The right adjoint of pushforward and the upper shriek functor

Define `pushforwardRightAdjoint f` (`a_f : DQCoh Y ⥤ DQCoh X`) for `f` quasi-compact
quasi-separated, with `pushforwardRightAdjoint_adj` (`Rf_* ⊣ a_f`), `trace` (the counit `Tr_f :
Rf_* a_f K → K`), `pushforwardRightAdjoint_comp` (`a_{g∘f} ≅ a_f a_g` compatibly with traces),
`pushforwardRightAdjoint_boundedBelow` (`a_f` preserves `D⁺_QCoh` when `f` is of finite Tor
dimension or `Y` is Noetherian), `globalDuality` (`RHom_X(L, a_f K) ≅ RHom_Y(Rf_* L, K)`),
`pushforwardRightAdjoint_affine_finite` (for `Spec B → Spec A` finite, `a_f(K~) = RHom_A(B, K)~`)
(Stacks, Lemma 48.3.1, Example 48.3.2, Lemmas 48.3.5–48.3.6, 48.3.10 (0A9D)). Define
`upperShriek f : D⁺_QCoh Y ⥤ D⁺_QCoh X` for `f` separated of finite type between Noetherian
schemes: choose a compactification `f = f̄ ∘ j` with `j` an open immersion and `f̄` proper
(CompactSupport Layer 1's Nagata compactification) and set `f^! := j^* ∘ a_{f̄}`;
prove `upperShriek_compactification_independence`: `f^!` is independent of the compactification up
to canonical isomorphism, with the pseudofunctor structure `(g ∘ f)^! ≅ f^! g^!` and its coherence,
using CompactSupport Layer 2's common refinements (Stacks, Situation 48.16.1, Lemmas 48.16.2–48.16.5
(0A9Y)). API: `upperShriek_proper` (`f^! ≅ a_f` for proper `f`), `upperShriek_openImmersion` and
`upperShriek_etale` (`f^! ≅ f^*` for étale `f`; Stacks, Lemmas 48.17.1–48.17.2 (0ATZ)),
`upperShriek_flat_baseChange` (for `g` flat, `g'^* f^! ≅ f'^! g^*`; Lemmas 48.18.1, 48.18.4 (0BZX)),
`upperShriek_smooth` (for `f` smooth of relative dimension `d`, `f^! K ≅ f^* K ⊗ Ω^d_{X/Y}[d]`;
Lemmas 48.17.3, 48.17.11), `upperShriek_lci` (for `f` a local complete intersection, `f^! K ≅ f^* K
⊗^L f^! O_Y` with `f^! O_Y` invertible, and for Gorenstein `f` of relative dimension `d`, `f^! O_Y
≅ ω_{X/Y}[d]`; Lemma 48.17.11), `upperShriek_unit`, `upperShriek_counit` (the adjunction maps on
the proper part). The regime is bounded-below complexes with quasi-coherent cohomology on
Noetherian schemes, separated finite-type morphisms; nothing is asserted for unbounded complexes or
non-Noetherian bases. *Needs:* §2.18; CompactSupport Layers 1–2; StableReduction
Layer 1 (the sheaf of differentials, for `upperShriek_smooth`).

**Checks.**
- `test_rightAdjoint_id`: `a_{𝟙} ≅ 𝟙` with identity trace.
- `test_rightAdjoint_closed_point`: for `f : Spec k → Spec k[x]`, `a_f(O) = RHom(k, k[x]) = k[−1]`.
- `test_rightAdjoint_not_upperShriek`: for `f : 𝔸¹_k → Spec k` (not proper), `a_f(k)` is the full
  linear dual `Hom_k(k[x], k)` as a `k[x]`-module, while `f^! k = O[1]` (Stacks, Example 48.3.2).
- `test_upperShriek_projective_line`: `f^! k = O(−2)[1]` for `ℙ¹_k → Spec k`, independent of the
  (unique up to refinement) compactification.
- `test_upperShriek_composition`: for `𝔸¹ → ℙ¹ → Spec k`, `(g ∘ j)^! ≅ j^! g^!` is `O_{𝔸¹}[1]`.

### 2.20 Relative dualising complexes and modules, Serre duality, curve comparison

Let `f : X → S` be flat and locally of finite presentation and `W ⊆ X ×_S X` an open through which
the diagonal factors as a closed immersion `Δ : X → W`. Define `IsRelativelyPerfect f K` for
`K ∈ D(O_X)` (`S`-perfect): `K` is pseudo-coherent (§0.5) and of locally finite Tor dimension
over `O_S` (Stacks, Chapter 36, the section on relatively perfect objects); this comes before the
dualising complex, which is defined in terms of it. Define `RelativeDualizingComplex f`: a pair
`(K, ξ)` with `K ∈ D(O_X)` `S`-perfect and `ξ : Δ_* O_X → L pr_1^* K|_W` in `D(O_W)` inducing an
isomorphism `Δ_* O_X ≅ RHom_{O_W}(Δ_* O_X, L pr_1^* K|_W)` (Stacks, Definition 48.28.1 (0E2S)). API:
`RelativeDualizingComplex.unique`, `.exists`, `.baseChange` (derived pullback along `S' → S`),
`.homothety_iso` (`O_X ≅ RHom(K, K)`), `.upperShriek` (for `f` flat in `FTS_S`, `f^! O_S` with its
canonical `ξ` is one) (Lemmas 48.28.2–48.28.7, 48.28.9). Define `relativeDualizingModule f :=
H^{−d}(f^! O_Y)` for `f` flat Cohen–Macaulay of relative dimension `d` in `FTS_S` (fibres
Cohen–Macaulay of pure dimension `d`, §0.18), with `upperShriek_structureSheaf_iso_shift`
(`f^! O_Y ≅ ω_{X/Y}[d]`), `relativeDualizingModule_coherent` (coherent, flat over `Y`),
`relativeDualizingModule_baseChange`, `relativeDualizingModule_invertible_iff` (invertible at `x`
iff `f` is Gorenstein at `x`), `relativeDualizingModule_smooth` (`ω ≅ ∧^d Ω_{X/Y}` for smooth `f`)
(Stacks, Lemmas 48.23.1, 48.23.3, Remark 48.23.4 (0AWQ)). Prove `cm_serre_duality`: for `X` proper
over a field `k`, Cohen–Macaulay of pure dimension `d`, with `ω_X := H^{−d}(f^! k)`: `ω_X` is
coherent, `H^i(X, F)` and `Ext^{d−i}(F, ω_X)` are dual `k`-vector spaces for coherent `F`, and for
`F` locally free `H^i(X, F) ≅ H^{d−i}(X, F^∨ ⊗ ω_X)^∨`, with the trace `H^d(X, ω_X) → k` (Stacks,
Lemma 48.27.1, Remarks 48.27.2–48.27.3, Lemma 48.27.5, Remark 48.27.6 (0FVU)); this is the one
statement of Serre duality for proper Cohen–Macaulay schemes in the roadmap. Prove
`curve_dualizing_comparison`: for a proper curve over `k` that is Cohen–Macaulay,
`relativeDualizingModule` is StableReduction Layer 2's `ω_{X/k}` when the curve is Gorenstein, and
`cm_serre_duality` restricts to JacobianChallenge Layer B's Serre duality for line bundles on smooth
curves and to Tau Ceti's `nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual` (Stacks,
Lemmas 53.4.1–53.4.2 (0E31)). Prove `sheafified_grothendieck_duality`: for `f` proper between
Noetherian schemes and `K ∈ D^−_Coh(X)`, `L ∈ D⁺_QCoh(Y)`, `Rf_* RHom_X(K, f^! L) ≅ RHom_Y(Rf_* K,
L)` (Stacks, Lemma 48.3.6, Example 48.3.9 (0A9D)). *Needs:* §0.18, §2.18, §2.19, §2.21;
StableReduction Layers 1–2; JacobianChallenge Layer B.

**Checks.**
- `test_rdc_identity`: for `f = 𝟙_S` the relative dualising complex is `O_S[0]`.
- `test_rdc_projective_line`: for `ℙ¹_S → S` it is `O(−2)[1] = Ω¹[1]`.
- `test_rdc_base_change`: base change of the relative dualising complex of `f` is that of `f'`.
- `test_rdc_not_invertible`: for `Spec k[x, y]/(x, y)² → Spec k` the relative dualising complex is
  `Hom_k(A, k)[0]`, which needs two generators; it is not invertible (the morphism is not
  Gorenstein).
- `test_omega_smooth_curve_degree`: `deg ω_{C/k} = 2g − 2`, `ω_{ℙ¹} = O(−2)`.
- `test_omega_identity`: `ω_{Y/Y} = O_Y`.
- `test_omega_nodal_invertible`: for the nodal cubic `y² = x³ + x²`, `ω` is invertible of degree
  `0`, matching StableReduction Layer 2.
- `test_omega_not_canonical_for_non_cm`: for two planes in `𝔸⁴` meeting at a point (not
  Cohen–Macaulay), `f^! k` has two nonzero cohomology sheaves and no dualising module is defined.
- `test_serre_duality_surface`: on `ℙ²_k`, `H²(O(−3)) ≅ k` dual to `H⁰(O)`.

### 2.21 Dualising complexes

This subsection is the strand `Coherent` of `Suggested.lean`. Define
`DualizingComplex A ω` for a Noetherian ring `A` and `ω ∈ D(A)`: `ω` has finite injective dimension,
finite cohomology modules, and `A → RHom_A(ω, ω)` is a quasi-isomorphism (Stacks, Definition
47.15.1), with `homothety`, `cohomology_finite`, `biduality` (`M ≅ RHom(RHom(M, ω), ω)` for `M ∈
D^b_Coh(A)`), `DualizingComplex.localization`, `.quotient`, `.unique_up_to_shift_twist`. Define
`SchemeDualizing X K` for `X` locally Noetherian: for every affine open `U = Spec A`, `K|_U ≅ ω_A~`
with `ω_A` dualising (Stacks, Definition 48.2.2), with `affine`, `cover_iff` (it suffices to check an
affine open cover; Lemma 48.2.1), `restrict`, `SchemeDualizing.biduality` (on `D^b_Coh(X)`),
`SchemeDualizing.exists_of_finiteType_over_field`. Define `NormalizedDualizing A ω` for a Noetherian
local ring: `RHom_A(κ, ω) ≅ κ[0]`, equivalently `Ext^i_A(κ, ω) = 0` for `i ≠ 0` and `Ext^0`
one-dimensional (Stacks, Lemma 47.16.1), with `residue`, `finite_local`, `shift_unique` (a
dualising complex over a local ring is normalised after a unique shift),
`NormalizedDualizing.localization_shift` (`ω_p[−dim A/p]` is normalised over `A_p`). Prove
`coherent_duality`: the properties (1)–(9) of Stacks, Section 48.19 for the pseudofunctor `f^!` of
§2.19 on `D⁺_Coh` for separated finite-type morphisms of Noetherian schemes: compatibility with
dualising complexes (`f^! ω_Y` is dualising on `X`), composition, flat base change, the formulas
for open immersions, finite morphisms (`f^! K = RHom_{O_Y}(f_* O_X, K)~`) and smooth morphisms, and
duality `Rf_* RHom(K, f^! L) ≅ RHom(Rf_* K, L)` for proper `f`. Define `trace f : Rf_* f^! K → K` for
proper `f` (the counit of §2.19) with `trace_comp`, `trace_baseChange`, `trace_finite` (for finite
`f` it is evaluation at `1`). *Needs:* §2.18, §2.19; Mathlib `DerivedCategory`, `Ext`,
`IsLocalRing.ResidueField`.

**Checks.**
- `DualizingComplex.test_field`: `k[0]` is dualising over `k`.
- `DualizingComplex.test_regular_shift`: over a regular local ring of dimension `d`, `A[d]` is
  dualising and normalised.
- `DualizingComplex.test_non_cm`: for `A = k[x, y]/(x², xy)` localised at the origin, a dualising
  complex has cohomology in two degrees.
- `SchemeDualizing.test_field`, `test_disjoint` (dualising complexes on a disjoint union are pairs),
  `test_projective_line` (`O(−2)[1]` is dualising on `ℙ¹_k`).
- `NormalizedDualizing.test_field`, `test_dvr` (`A[1]` is normalised for a DVR), `test_wrong_shift`
  (`A[0]` is dualising but not normalised for a DVR).
- `trace_test_finite_field_extension`: for `Spec L → Spec K` finite separable, the trace is the
  field trace `L → K`.

### 2.22 Sheaves of algebras, Azumaya algebras and the Brauer group of a scheme

This subsection is the strand `Brauer` of `Suggested.lean`. Define
`SheafAlgebra X`: a sheaf of associative unital rings `A` on `X` with a central structure map `O_X →
A` whose underlying `O_X`-module is quasi-coherent, with `SheafAlgebra.sections`, `hom_ext`,
`pullback` (Stacks, Section 59.62 (0A2J)). Define `Azumaya X A` for a quasi-coherent `O_X`-algebra:
there is an étale covering `{U_i → X}` and `O_{U_i}`-algebra isomorphisms `A|_{U_i} ≅
Mat_{d_i}(O_{U_i})` with `d_i ≥ 1`, with `Azumaya.local_matrix`, `Azumaya.degree` (the locally
constant function `d`), `Azumaya.pullback`, `Azumaya.tensor`, `Azumaya.opposite`,
`Azumaya.endomorphism` (`End(E)` for `E` finite locally free of positive rank), `azumaya_affine_iff`
(over `Spec R` the condition is Mathlib's `IsAzumaya R A`). Prove `qcohAlgebra_descent`:
quasi-coherent algebras descend along fpqc coverings (§1.1) and the Azumaya property is fpqc local
(Stacks, Section 35.3 (023F), Section 59.62). Prove `azumaya_equivalent_conditions`: for a
quasi-coherent `O_X`-algebra `A` finite locally free as a module, the following are equivalent: `A`
is Azumaya; `A ⊗ A^op → End(A)` is an isomorphism; every geometric fibre `A ⊗ κ(x̄)` is a matrix
algebra; `A` is fppf-locally a matrix algebra (Grothendieck, Brauer I, Théorème 5.1, Propositions
5.4–5.5, pp. 210–212). Define `StabilizedEquivalence A B`: there are finite locally free `E`, `F` of
positive rank at every point with `A ⊗ End(E) ≅ B ⊗ End(F)`, with `refl`, `symm`, `trans`; and
`SchemeBrauerGroup X := Azumaya algebras / ≈`, an abelian group under `⊗` with inverse `A^op`, with
`SchemeBrauerGroup.mk`, `mk_eq_zero_iff` (`A ≅ End(E)`), `mk_tensor`, `mk_opposite`, `pullback f :
Br(Y) → Br(X)` (a group homomorphism, functorial), `brauer_affine_iff` (for `X = Spec R` it is
Mathlib's `BrauerGroup R`), `brauer_field` (for `Spec K`, Tau Ceti's `BrauerGroup K`). Define
`CohomologicalBrauer X := (GmEtale X).H 2`'s torsion subgroup `Br′(X)` with `inclusion`, `mem_iff`,
`pullback`. Define `trivializationGerbe A`: the stack over `X_ét` of pairs `(E, φ : End(E) ≅ A|_U)`,
a gerbe banded by `𝔾_m` (§2.4), and `azumayaClass A := Gerbe.class (trivializationGerbe A) ∈
H²(X_ét, 𝔾_m)`, with `azumayaClass_eq_zero_iff` (iff `A ≅ End(E)`), `azumayaClass_tensor` (`[A ⊗ B]
= [A] + [B]`, `[A^op] = −[A]`), `azumayaClass_torsion` (`d · [A] = 0` for `A` of constant degree
`d`; for `X` quasi-compact the degree is bounded and every class lies in `Br′`, while on a
non-quasi-compact `X` the class of an algebra of unbounded degree need not be torsion),
`azumayaClass_eq_delta` (it is the boundary of §2.4 for `1 → 𝔾_m → GL_d → PGL_d → 1` applied to the
`PGL_d`-torsor `Isom(Mat_d(O), A)`, the `splittingTorsor A`), `azumayaClass_pullback`, and the
comparison `delta : SchemeBrauerGroup X →+ CohomologicalBrauer X` (injective; Grothendieck, Brauer
I, §2, pp. 204–205; Brauer II, Proposition 1.4). `Suggested.lean` types `azumayaClass` on the
global-section data, an Azumaya `Γ(X, O)`-algebra which is finite projective as a module (exact for
affine `X`), with `azumayaClass_torsion` for a global rank `d²` and `azumayaClass_tensor`; the
sheaf-algebra form is the target above. Prove `brauer_regular_injectivity`: for `X` regular
integral, `Br(X) → Br(K(X))` is injective, `Br(X)` is torsion, and `Br(X) = Br′(X)` when `X` is
regular of dimension `≤ 2` (Grothendieck, Brauer II, Proposition 1.4, Lemme 1.9, Corollaires 1.8,
1.10, pp. 291–293). Prove `brauer_kummer_sequence`: for `n` invertible on `X`, `0 → Pic(X)/n →
H²(X_ét, μ_n) → Br′(X)[n] → 0` (Stacks, Remark 59.28.4 (03PK)). Prove `brauer_henselian_local`: for
a henselian local ring `R` with residue field `k`, `Br(R) → Br(k)` is an isomorphism (Grothendieck,
Brauer I, Théorème 6.1, p. 214); the finite-field case `Br(k) = 0` is Tau Ceti's
`subsingleton_brauerGroup_of_finite`. Prove `brauer_hochschildSerre_sequence`: for a smooth
geometrically integral variety `X` over `k` with `X̄ = X_{k^s}`, the exact sequence `0 → Pic(X) →
Pic(X̄)^{G_k} → Br(k) → ker(Br(X) → Br(X̄)) → H¹(G_k, Pic(X̄)) → H³(G_k, k^{s×})` from §2.15's
Hochschild–Serre (Harpaz–Wittenberg 2023, §3, display (3.1), Remark 3.1, pp. 8–9). *Needs:* §1.1,
§2.4, §2.9, §2.11, §2.15; Mathlib `IsAzumaya`, `BrauerGroup`, `Matrix`; Tau Ceti
`brauerCohomologyEquiv`, `subsingleton_brauerGroup_of_finite`; AlgebraicVectorBundles L0B.

**Checks.**
- `SheafAlgebra.test_matrix2` (`Mat_2(O_X)`, with sections `Mat_2(k)` over `Spec k`), `test_scalar`
  (`O_X`), `test_noncommutative` (`Mat_2(ℚ)` is admitted although noncommutative).
- `Azumaya.test_matrix`, `test_scalar` (degree one), `test_dual_numbers` (`k[ε]/(ε²)` over `k` is
  finite free and not Azumaya: its fibre is not a matrix algebra), `test_quaternion` (the Hamilton
  quaternions over `ℝ` are Azumaya of degree `2`).
- `StabilizedEquivalence.test_matrix` (`Mat_n(O_X) ≈ O_X`), `test_field` (over `Spec k` it is the
  Brauer equivalence of central simple algebras), `test_zero_rank` (zero-rank `E` or `F` is
  excluded: allowing them would make every algebra equivalent to the zero algebra).
- `CohomologicalBrauer.test_complex` (`Br′(Spec ℂ) = 0`), `test_real` (`Br′(Spec ℝ) ≅ ℤ/2` with the
  quaternion class the generator), `test_nontorsion` (a non-torsion class of `H²` is not in `Br′`).
- `test_class_matrix` (`azumayaClass (Mat_d(O_X)) = 0`), `test_class_quaternion_real` (nonzero,
  `2`-torsion), `test_class_field_agrees` (for `Spec K`, `azumayaClass` followed by
  `brauerCohomologyEquiv` is the class in `BrauerGroup K`), `test_class_not_module_class` (`ℍ` and
  `Mat_2(ℝ)` have isomorphic underlying modules and different classes).
- `brauer_test_integers` (`Br(Spec ℤ) = 0`), `brauer_test_henselian_dvr` (`Br(ℤ_p) = Br(𝔽_p) = 0`).

### 2.23 Equivariant sheaf cohomology

This subsection is the strand `Equivariant` of `Suggested.lean`. For a
ringed space `X` (a scheme) with a left action of a discrete group `Γ` by ringed-space
automorphisms `act : Γ →* Aut X`, define `EquivariantModules X Γ act`, the category of
`Γ`-equivariant `O_X`-modules: an `O_X`-module `F` with isomorphisms `φ_γ : γ^* F ≅ F` satisfying
the cocycle condition (Kings–Sprang 2019, Appendix A.1, Definitions A.1–A.3, (A.1.1), pp. 79–80;
Grothendieck 1957, Chapitre V, §5.1, Proposition 5.1.1, p. 196). API: `abelian` (kernels and
cokernels computed underlying), `forget` (exact, faithful; `forget_exact`), `hom_eq_invariants`
(`Hom_Γ(F, G) = Hom(F, G)^Γ`), `isGrothendieckAbelian` (with the generators `L(U)`, hence enough
injectives), `trivialGroupEquiv`, `transport` along isomorphisms. Define `ind` (`⊕_γ γ^* F`) and
`coind` (`∏_γ γ_* F`) with `indForgetAdj`, `forgetCoindAdj`, `coind_injective` (coinduction
preserves injectives), `forget_injective` (equivariant injectives are injective), `unit_mono`
(Grothendieck 1957, §5.1, the reduction to modules, p. 196). Prove `coinducedSections_acyclic`: for
an injective equivariant module `I`, `Γ(X, I)` is an acyclic `Γ`-module (`H^p(Γ, Γ(X, I)) = 0` for
`p > 0`), and `Γ(X, −)^Γ = Γ(Γ, −) ∘ Γ(X, −)` on injectives (Kings–Sprang 2019, Appendix A.1,
display (A.1.1), p. 80). Define `invariantSections F := Γ(X, F)^Γ` and the equivariant cohomology
`equivariantCohomology F n := R^n (invariantSections) F`, with `equivariantCohomology_zero`,
`equivariantCohomology_trivial_group` (for `Γ = 1` it is `H^n(X, F)`), `equivariantCohomology_δ`;
`equivariantExt F G n := Ext^n` in `EquivariantModules` with `equivariantExt_zero`;
`equivariantCohomologyWithSupport Z F n` for a `Γ`-stable closed `Z`, with the localisation
sequence; and the two spectral sequences `H^p(Γ, H^q(X, F)) ⇒ H^{p+q}_Γ(X, F)` and `H^p(Γ, Ext^q(F,
G)) ⇒ Ext^{p+q}_Γ(F, G)` (Kings–Sprang 2019, Appendix A.1, Definition A.2, (A.1.1), p. 80). *Needs:*
§2.1, §2.2, §2.7; Mathlib `Action`, `Abelian`, `IsGrothendieckAbelian`, `groupCohomology`.

**Checks.**
- `test_trivial_group`: for `Γ = 1`, `forget` is an equivalence.
- `test_point_group_ring`: for `X` a point with `O = ℤ` and `Γ = ℤ/2`, the category is
  `ℤ[ℤ/2]`-modules, and `ℤ` with the sign action is not isomorphic to `ℤ` with the trivial action.
- `test_hom_invariants`: for `F = G = O_X` with the trivial linearisation, `Hom_Γ = Γ(X, O)^Γ`.
- `test_not_action_category`: for `Γ = ℤ` acting on `X = ℝ` by translation, `O_X` with its
  translation linearisation is an equivariant module but not an object of Mathlib's `Action` (the
  action moves the base).
- `test_coind_trivial_group`, `test_coind_point` (`Coind(ℤ) = ℤ[ℤ/2]`), `test_coind_global_sections`
  (`Γ(X, Coind F) = Map(Γ, Γ(X, F))`), `test_ind_ne_coind_infinite` (for `Γ = ℤ`, `Ind(ℤ) = ℤ[ℤ]`
  differs from `Coind(ℤ) = Map(ℤ, ℤ)`).
- `test_equivariant_cohomology_point`: for `X` a point, `H^n_Γ(X, F) = H^n(Γ, F)` (group
  cohomology).
- `test_equivariant_cohomology_free_quotient`: for `Γ` finite acting freely on `X` with quotient
  `Y = X/Γ` and `F = π^* G`, `H^n_Γ(X, F) = H^n(Y, G)`.

### Examples

The standing computations: `H¹(ℙ¹, 𝔾_m) = ℤ`, `H¹(Spec ℝ, μ_2) = ℤ/2`, `Br(ℝ) = ℤ/2` with the
quaternion class as the nonzero boundary of §2.4, `H¹_Z(𝔸¹, O) = k[t, t⁻¹]/k[t]`, `ω_{ℙ¹} = O(−2)`,
the Cousin resolution of a DVR, `Spec ℂ → Spec ℝ` as the étale-but-not-Nisnevich covering, and the
tower `μ_{ℓ^{n+1}} → μ_{ℓ^n}` separating replete from non-replete topoi.

### Dependencies

Layer 0: §0.4–§0.5 (quasi-coherent modules, pseudo-coherence), §0.9 (limits), §0.13–§0.14
(henselization and henselian pairs), §0.17–§0.18 (depth and Cohen–Macaulay). Layer 1: §1.1 (descent,
in §2.22) and §1.18 (stacks in groupoids, in §2.4's gerbes). Mathlib and Tau Ceti as listed;
StableReduction Layers 1–2; JacobianChallenge Layer B; ProfiniteCohomology Layers 9–10;
AlgebraicVectorBundles L0B; CompactSupport Layers 1–2 and ConstructibleEtale Layer 6 as comparison
inputs.
## Layer 3: curves, divisors and Picard objects

The curve-and-Picard layer. Three Tau Ceti roadmaps already plan most of the theory of curves
(AlgebraicCurves, JacobianChallenge, StableReduction); Layer 3 states how they fit together and adds
what none of them states but the arithmetic roadmaps need: the affine-or-projective dichotomy,
invariance of the genus under field extension with the inseparable contrast, the scheme form of
Riemann–Hurwitz, the characterisations of the projective line and of genus-one curves and the
degree bounds; degrees, Riemann–Roch and Serre duality for vector bundles and coherent sheaves on
curves; the divisorial and groupoid descriptions of Picard groups of schemes and the excision
sequence; norms of invertible sheaves; Picard torsors of curves without rational points and the
Brauer obstruction separating rational divisor classes from rational divisors; Picard stacks, Abel
maps from symmetric powers in high degree and the norm sequence; and invariant differentials with
the pullback of forms along Abel–Jacobi. The acceptance checks are genus zero, genus one, extension
of scalars and degree zero.

**Conventions of this layer.** `k` is a field, `k^s` a separable closure, `G_k = Gal(k^s/k)`. A
curve over `k` is an integral separated `k`-scheme of finite type of dimension one; smoothness,
properness, projectivity and geometric connectedness are hypotheses written where used, and regular
is not smooth over an imperfect field. `Pic(X)` is Tau Ceti's `LineBundleClass X`, `Pic_{X/k}` the
fppf Picard sheaf of JacobianChallenge Layer D, `Pic^d_{X/k}` its degree-`d` component. The genus is
`dim_k H¹(X, O_X)` (`Curve.genus`, JacobianChallenge Layer B's) and `χ(X, F) = dim H⁰ − dim H¹`
(`Curve.eulerChar`, Tau Ceti's `eulerCharBelow`). Finite locally free sheaves of rank `r` are
AlgebraicVectorBundles L0B's `isFiniteLocallyFreeOfRank`. Abel–Jacobi with a base point is
JacobianChallenge Layer F; the Abel maps here need no base point. Néron–Severi groups and Picard
numbers are AbelianSchemesAndArithmeticModuli; coherent duality beyond curves is Layer 2; positivity
beyond degree bounds is Layer 5; Picard schemes over general bases are
AlgebraicModuliForArithmeticGeometry; models of curves are Layer 4; Tate modules and their
comparison with `H¹` are TraceFormula Layer 8.

### 3.1 Curves are affine or projective; the genus under field extension

Prove `isAffine_or_isProper`: a curve `X` over `k` is either affine and not proper, or proper and
not affine, and a proper curve is projective (Stacks, Lemmas 0A24, 0A26, 0A27, 0A28). Prove
`genus_baseChange`: for a proper curve `X` with `H⁰(X, O_X) = k`, the base change `X_K` to any field
extension has `H⁰(X_K, O) = K` and the same genus; the hypothesis `H⁰ = k` is essential (for `X =
Spec L` with `L/k` finite the genus is `0` but `H⁰ = L`), and `X_K` need not be reduced or
irreducible when `K/k` is inseparable (Stacks, Definition 0BY7, Lemma 0BY9; Lemma 0CE4; Lemma
0BY4). *Needs:* §0.7, §2.6; Tau Ceti `Scheme.Modules.Cohomology`; JacobianChallenge Layer B.

**Checks.**
- `isAffine_or_isProper_test_affineLine`, `test_projectiveLine`: `𝔸¹` is affine, `ℙ¹` is proper.
- `genus_baseChange_test_projectiveLine`: `ℙ¹_k` has genus `0` over every `K`.
- `genus_baseChange_test_inseparable`: for `k = 𝔽_p(t)` and `X` the regular projective model of
  `y² = x^p − t` (`p` odd), `X_{k(t^{1/p})}` is reduced but not normal; the genus is still `(p − 1)/2`, and the
  genus of its normalization drops to `0`.
- `genus_baseChange_test_constant_field`: for `X = Spec L`, `L/k` finite of degree `> 1`, the genus is
  `0` but `H⁰ ≠ k`: the hypothesis of the theorem fails and the conclusion `H⁰(X_K) = K` is false.

### 3.2 Riemann–Hurwitz for schemes, the projective line, genus one, degree bounds

Prove `scheme_riemann_hurwitz`: for a finite morphism `f : X → Y` of smooth proper geometrically
connected curves over `k` of degree `n` that is generically étale, `2g_X − 2 = n(2g_Y − 2) + deg R`
with `R = Σ_x (length Ω_{X/Y, x}) [x]` the ramification divisor, and `deg R ≥ Σ_x (e_x −
1)[κ(x) : k]` with equality iff `f` is tamely ramified; for `f` finite étale, `g_X − 1 = n(g_Y − 1)`
(Stacks, Lemmas 0C1C, 0C1D, 0C1F; Lemma 0AYZ). This is the scheme form; AlgebraicCurves Layer 7
states the function-field form, and the two agree under AlgebraicCurves Layer 12's dictionary (that
comparison is AlgebraicCurves 12E's). Prove `projectiveLine_characterisation`: a smooth proper geometrically integral curve `X`
of genus `0` with `H⁰ = k` is isomorphic to a conic in `ℙ²_k`, is `ℙ¹_k` iff it has a rational point
iff it has an invertible sheaf of odd degree, and a degree-zero invertible sheaf on it is trivial
(Stacks, Lemmas 0C6M, 0C6T, 0C6N, Proposition 0C6U). Prove `genus_one_curves`: a smooth proper
geometrically connected curve of genus `1` with an invertible sheaf of degree `1` has a rational
point, and conversely; its degree-`d` Picard torsors are torsors under the Jacobian (Stacks, Lemma
0AYY; Lemma 0CDU (1)); the rational-point consequence for divisors is Tau Ceti's
`exists_linearlyEquivalent_ofPoint_of_genus_eq_one`. Prove `lineBundle_degree_bounds`: for a smooth
proper geometrically connected curve of genus `g` and `L` invertible: `deg L > 2g − 2` implies
`H¹(L) = 0` and `h⁰(L) = deg L + 1 − g`; `deg L ≥ g` implies `h⁰(L) > 0`; `deg L ≥ 2g` implies `L`
globally generated; `deg L ≥ 2g + 1` implies `L` very ample; `deg L < 0` implies `h⁰(L) = 0`
(Stacks, Lemmas 0E3A, 0E3B, 0E3C, 0E3D, 0H2V; Lemma 0B5E). *Needs:* §3.1, §3.3; StableReduction
Layer 1 (`Ω_{X/Y}`), Layer 2 (ampleness); JacobianChallenge Layers B, D; AlgebraicCurves Layer 7
(comparison only).

**Checks.**
- `riemann_hurwitz_test_squaring`: `z ↦ z²` on `ℙ¹_k`, `char k ≠ 2`: `−2 = 2(−2) + 2`.
- `riemann_hurwitz_test_frobenius_excluded`: the relative Frobenius of a curve in characteristic
  `p` is not generically étale and the formula does not apply.
- `riemann_hurwitz_test_etale_cover`: for a finite étale double cover of a genus-`2` curve, the
  cover has genus `3`.
- `projectiveLine_test_conic_without_point`: `x² + y² + z² = 0` over `ℝ` has genus `0`, no rational
  point, and no invertible sheaf of odd degree.
- `genus_one_test_elliptic`: an elliptic curve has a degree-one sheaf `O(O)`.
- `degree_bounds_test_canonical`: `K` has degree `2g − 2` and `h⁰(K) = g`, so the bound
  `deg > 2g − 2` is sharp.

### 3.3 Degrees of vector bundles, Riemann–Roch and Serre duality on curves

Define `vectorBundleDegree E r := χ(X, E) − r · χ(X, O_X)` for `X` proper over `k` of dimension
`≤ 1` and `E` finite locally free of rank `r` (AlgebraicVectorBundles L0B's predicate; Stacks,
Definition 0AYR). API: `vectorBundleDegree_rankOne` (for `r = 1` it is Tau Ceti's
`InvertibleSheaf.eulerDegree`), `_of_iso`, `_add_of_shortExact` (additive in short exact sequences
of locally free sheaves; Lemma 0AYS), `_tensor` (`deg(E ⊗ V) = r deg V + s deg E`; Lemma 0AYW),
`_det` (`deg E = deg det E` with AlgebraicVectorBundles L0C's `determinant`; Lemma 0AYX), `_dual`
(`deg E^∨ = −deg E`), `_twist` (by an effective Cartier divisor `D`: `deg E(D) = deg E + r deg D`),
`_elementaryModification`, `_baseChange` (invariant under field extension), `_pullback` (`deg f^* E
= n deg E` for `f` finite of degree `n`; Lemma 0DJ5), `_divisor` (for `E = O(D)` on a regular curve,
`deg = Σ n_x [κ(x) : k]`; Lemma 0B59). Prove `vectorBundle_riemann_roch`: for a proper Gorenstein
curve `X` over `k` with `H⁰ = k` and `E` locally free of rank `r`, `χ(X, E) = deg E + r(1 − g)`
(Stacks, Lemmas 0BS5, 0BS6); the rank-one case is Tau Ceti's
`eulerCharBelow_eq_relativeDegree_add_one_sub_genus` and JacobianChallenge Layer B, and this target
differs by allowing higher rank and Gorenstein singular curves. Prove `curve_serre_duality`: for a
proper Cohen–Macaulay curve `X` over `k` with dualising module `ω_X` (§2.20), `Ext^{1+i}(F, ω_X) ≅
H^{−i}(X, F)^∨` for coherent `F` and all `i`, `H^i(X, E^∨ ⊗ ω_X) ≅ H^{1−i}(X, E)^∨` for `E` locally
free, `Ext¹(U, V) ≅ Hom(V, U ⊗ ω_X)^∨`, and `ω_X ≅ Ω¹_{X/k}` for `X` smooth (Stacks, Lemmas 0BS2,
0BS3, Remark 0BS4; Lemma 0C1A); the line-bundle smooth case is JacobianChallenge Layer B's and Tau
Ceti's `nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`, and this target differs by
allowing coherent sheaves, the `Ext` form and Cohen–Macaulay singular curves. *Needs:* §2.6, §2.20;
AlgebraicVectorBundles L0B–L0C; Tau Ceti `eulerCharBelow`,
`finrank_cohomology_zero_sub_one_eq_add`, `InvertibleSheaf.eulerDegree`; JacobianChallenge Layers
A–B; StableReduction Layer 2.

**Checks.**
- `vectorBundleDegree_trivial`: `deg O_X^r = 0`.
- `vectorBundleDegree_projectiveLine`: on `ℙ¹_k`, `deg(O(a) ⊕ O(b)) = a + b`.
- `vectorBundleDegree_filtration`: `O(1) ⊕ O(−1)` on `ℙ¹` has degree `0` and is not trivial.
- `vectorBundleDegree_divisor`: on a regular proper curve, `deg O(D) = Σ n_x [κ(x) : k]`.
- `vectorBundleDegree_ne_eulerChar`: on a curve of genus `2`, `deg O = 0 ≠ χ(O) = −1`.
- `riemann_roch_test_nodal`: on the nodal cubic (Gorenstein, `g = 1`) `χ(E) = deg E`.
- `serre_duality_test_torsion`: for `F = κ(x)` a skyscraper on a smooth curve, `Ext¹(κ(x), ω) ≅
  H⁰(κ(x))^∨ ≅ κ(x)^∨` and `Hom(κ(x), ω) = 0`.

### 3.4 Picard groups: divisor classes, excision, Picard groupoids

The cohomological description `Pic(X) = H¹(X_ét, 𝔾_m)` is §2.11's `hilbert90`, cited and not
restated; its affine case is `lineBundleClass_spec_equiv_pic : LineBundleClass (Spec R) ≃
CommRing.Pic R`. Prove `classGroup_picard_locallyFactorial`: for `X` locally Noetherian, integral
and normal, the map `Pic(X) → Cl(X)` from invertible sheaves to Weil divisor classes (Tau Ceti's
`classGroupToLineBundleClass` in the opposite direction) is injective, and bijective when `X` is
locally factorial (Stacks, Definitions 0BE4, 0BE6, Lemmas 02SL, 0BE8, 0BE9); Tau Ceti's
`SchemeWeilDivisor.classGroupAddEquivLineBundleClass` is the case of regular curves. Prove
`picard_excision_sequence`: for `X` integral locally Noetherian, `D ⊆ X` an integral closed
subscheme of codimension one with complement `U`, the sequence `ℤ → Cl(X) → Cl(U) → 0` is exact,
with `1 ↦ [D]`, and `Pic(X) → Pic(U)` is surjective for `X` locally factorial (Stacks, Lemma 02RX);
and `picard_units_sequence`: for `X` regular with `X ∖ U = D_1 ∪ ⋯ ∪ D_r` the union of
integral closed subschemes of codimension one, the sequence `Γ(X, O)^× → Γ(U, O)^× → ⊕_i ℤ·[D_i] →
Pic(X) → Pic(U) → 0` is exact, the second map being `u ↦ (ord_{D_i}(u))_i` (Hartshorne 1977, II,
Proposition 6.5; Fulton 1998, Proposition 1.8 for the cycle-level statement).
Define `PicardGroupoid C` for a symmetric monoidal category: every morphism is an isomorphism and
every object has a tensor inverse up to isomorphism, with `pi0 C := Skeleton C` (a commutative
group) and `pi1 C := Aut(𝟙_C)` (a commutative group) (Bhatt–Scholze 2017, Definition 12.14,
Proposition 12.15, pp. 58–59). Define `picardGroupoid X := Core (InvertibleSheaf X)` with its
symmetric monoidal structure and `PicardGroupoid` instance, `picardGroupoid.pi0_equiv` (`π_0 ≅
LineBundleClass X`), `pi1_equiv` (`π_1 ≅ Γ(X, O)^×`), `pullback` (a functor of Picard groupoids),
`isStack` (fppf descent, §1.1), and `gradedPicardGroupoid X` (pairs `(L, f : X → ℤ)` with the Koszul
sign rule; Bhatt–Scholze 2017, §4, p. 15, Construction 5.1, p. 18). *Needs:* §1.1, §2.11; Tau Ceti
`LineBundleClass`, `InvertibleSheaf`, `SchemeWeilDivisor`, `classGroupToLineBundleClass`; Mathlib
`CommRing.Pic`, `Core`, `Skeleton`.

**Checks.**
- `picardGroupoid_pi0` (`π_0 = Pic`), `picardGroupoid_field` (`π_1 = K^×` for `Spec K`),
  `picardGroupoid_projectiveLine` (`π_0 = ℤ`, `π_1 = k^×`), `picardGroupoid_not_discrete` (for
  `Γ(X, O)^× ≠ 1` the groupoid is not the discrete groupoid on `Pic X`).
- `classGroup_test_cone`: for the quadric cone `k[x, y, z]/(xy − z²)`, `Pic = 0` and `Cl = ℤ/2`: the
  map is injective and not surjective (not locally factorial).
- `excision_test_affineLine_minus_point`: `Cl(𝔸¹) = 0 → Cl(𝔸¹ ∖ {0}) = 0` and the kernel of
  `ℤ → Cl(𝔸¹)` is `ℤ`; the units sequence reads `k^× → k^× × t^ℤ → ℤ → 0 → 0`, the middle map
  `(c, t^n) ↦ n`.

### 3.5 Norms of invertible sheaves

Define `lineBundleNorm π : LineBundleClass X → LineBundleClass Y` for `π : X → Y` finite locally
free (finite, flat and locally of finite presentation, ModularCurves 0B's convention), as the norm
of a line bundle along a finite locally free morphism; the degree enters only the statements that
need it, through `Scheme.Hom.finrank`: `Norm_π(L)` is the invertible sheaf whose local
trivialisations are the determinants of `π_* L` relative to `π_* O_X` (Stacks, Lemmas 0BCY, 0BCZ,
0BD2). API: `lineBundleNorm_tensor`, `_one` (a group homomorphism), `_pullback` (`Norm(π^* N) = N^{⊗
d}` when `π.finrank` is constantly `d`), `_comp` (`Norm_{π∘ρ} = Norm_π ∘ Norm_ρ`), `_baseChange`,
`_det` (`Norm_π(L) ⊗ det(π_* O_X) ≅ det(π_* L)`, with AlgebraicVectorBundles L0C's `determinant`),
`sectionNorm` (the norm of a section `s` of `L` is a section of `Norm_π L` with divisor `π_*(div
s)`), `lineBundleNorm_divisor` (`Norm_π O(D) = O(π_* D)` on regular curves). Hypotheses: `π` finite
locally free; where a degree appears it is `π`'s `finrank`, never a free parameter. *Needs:* §3.4;
Mathlib `IsFinite`, `Flat`, `LocallyOfFinitePresentation`, `Scheme.Hom.finrank`;
AlgebraicVectorBundles L0C; ModularCurves 0B.

**Checks.**
- `lineBundleNorm_id`: `Norm_{𝟙} = 𝟙`.
- `lineBundleNorm_field`: for `Spec L → Spec K` finite, the norm on units is Mathlib's
  `Algebra.norm`.
- `lineBundleNorm_square`: for `z ↦ z²` on `ℙ¹`, `Norm O(1) = O(1)` and `Norm(π^* O(1)) = O(2)`.
- `lineBundleNorm_ne_det`: for a hyperelliptic double cover `π : C → ℙ¹` of genus `g`, `det π_* O_C
  = O(−g − 1)`, so `Norm_π L ≠ det π_* L` in general.
- `lineBundleNorm_not_finite_flat`: for the non-flat finite map `Spec k[t] → Spec k[t², t³]` (cusp
  normalisation) no norm is defined; the finite-locally-free hypothesis is essential.

### 3.6 Picard torsors of a curve without a rational point and rational divisor classes

Let `X` be a smooth projective geometrically connected curve over `k`. Define `picardComponent X d
: Over (Spec k)` for `d ∈ ℤ`, the degree-`d` component `Pic^d_{X/k}` of JacobianChallenge Layer D's
Picard scheme (representable without a rational point), and `jacobian X := Pic⁰_{X/k}` as an
abelian variety (Tau Ceti's `AbelianVariety k`); `picardSheafPoints X := Pic_{X/k}(k) =
Pic(X_{k^s})^{G_k}` with `ofLineBundleClass : Pic(X) → picardSheafPoints X`, injective, and the
cokernel mapping injectively to `Br(k)` (JacobianChallenge Layer D's Picard–Brauer obstruction,
cited). Prove `picardComponent_zero` (`Pic⁰ = jacobian`), `jacobian_dim` (`= g`),
`picardComponent_isProper`, `picardComponent_torsor` (`Pic^d` is a `Pic⁰`-torsor, with the class
of `Pic^1` of order dividing the index of `X`), `picardComponent_canonical_point` (the canonical
class gives a `k`-point of `Pic^{2g−2}`), `picardComponent_point_iff` (`Pic^d` has a `k`-point iff
it is the trivial torsor) (Milne 2008, Part III, Theorem 1.6, Remarks 1.4 (a)–(b), 1.10–1.12,
Propositions 1.13–1.14, pp. 88–91). Prove `rational_divisor_classes` in characteristic different from two for the smooth
hyperelliptic curve defined by a separable binary form of degree `2g+2` with nonzero leading
coefficient: if the curve has a rational divisor of odd degree, every rational divisor class
is represented by a rational divisor. Retain the Picard–Brauer obstruction without such a
hypothesis; the generalized Jacobian uses the modulus of the two points at infinity
(Bhargava–Gross–Wang 2017, §3, Proposition 21 and its preceding setup, pp. 10–11).
*Needs:* §3.1, §3.4;
JacobianChallenge Layers D–E; ClassFieldTheory Layer 5 (`Br(k)`); Tau Ceti `AbelianVariety`.

**Checks.**
- `picardComponent_test_elliptic`: for an elliptic curve `Pic^d ≅ E` for every `d`.
- `picardComponent_test_conic`: for the pointless conic `X` of §3.2, every `Pic^d` is
  `Spec ℝ`, including degree one. The degree-one real Picard-scheme point is not represented
  by a line bundle on `X`; actual line bundles have even degree.
- `picardComponent_test_genus_one_period`: for a genus-one curve, the order of `Pic^1`
  in `H¹(k, Pic⁰)` is its period, which divides its index and can be smaller.
- `picardSheafPoints_test_brauer`: for the conic over `ℝ`, `Pic(X) = 2ℤ` and
  `picardSheafPoints = ℤ`, with cokernel `ℤ/2 = Br(ℝ)`.

### 3.7 Picard stacks, universal sections, Abel maps and the norm sequence

Define `picardStack X : StackInGroupoids` for a proper curve: objects over `T` are invertible
sheaves on `X ×_k T`, morphisms isomorphisms (the fibre over `T` is `picardGroupoid (X_T)` of
§3.4), with `degreeComponent d`, `aut_eq_units` (`Aut(L) = Γ(T, O)^×`), `toPicardSheaf` (to
JacobianChallenge's `Pic_{X/k}`), `isGerbe` (a `𝔾_m`-gerbe over `Pic_{X/k}`, not in general the
product `Pic_{X/k} × B𝔾_m`), `universalBundle` (a line bundle on `X × picardStack X`; a universal
bundle on `X × Pic^d_{X/k}` exists only when the gerbe is split), `split_of_point` (split by a
rational point), `tensor`, `baseChange` (Yun–Zhang 2017, §3.2.1, p. 16). Define `sectionStack
X` over `picardStack X`: pairs `(L, s)` with `s ∈ Γ(X_T, L)`, with `forget`, `zeroSection`,
`eq_of_neg` (the fibre over degree `d < 0` is the zero section), `symmetricPowerEquiv` (in degree
`d ≥ 0` the open substack `s ≠ 0` is `X^{(d)}`, JacobianChallenge Layer C's symmetric power),
`isTotalSpace` (over the degree-`d` Picard stack with `d > 2g − 2` the section stack is the total
space of the vector bundle `p_* L^{univ}` of rank `d + 1 − g`, and its open substack `s ≠ 0` is
that bundle minus its zero section, not a projective bundle over the stack; `X^{(d)}` is
recovered by forgetting the scalar identifications), `add`, `add_symmetricPower` (Yun–Zhang
2017, §3.2.1, p. 16; proof of Proposition 3.1 (2), p. 18). Prove `abelMaps_highDegree`: the Abel
map `a_d : X^{(d)} → Pic^d_{X/k}`, sending an effective divisor to its line-bundle class, is
surjective as a morphism of schemes for `d ≥ g` (nothing is asserted about `k`-points), and for
`d ≥ 0` and `d > 2g − 2` it is a Brauer–Severi family of relative dimension `d − g`: over `T → Pic^d` carrying
a line bundle `L` on `X × T` representing the point, `E := p_* L` is locally free of rank
`d + 1 − g` by cohomology and base change and the base-changed Abel map is `Proj_T Sym(E^∨)`;
replacing `L` by `L ⊗ p^* M` does not change this projectivisation, so the family descends. It is
the projective bundle `ℙ(E_d)` of a locally free sheaf on `Pic^d` only when the gerbe
`picardStack → Pic^d` is split, for instance when `X` has a rational point (Stacks, Lemma 0BA0, in
its pointed regime). Prove `picard_norm_sequence`: for a geometrically connected étale double
cover `ν : X' → X` of smooth proper curves with involution `σ`, in odd characteristic, the
sequence of sheaves `1 → 𝔾_m → ν_* 𝔾_m → ν_* 𝔾_m → 𝔾_m → 1` on `X_ét` is exact, the middle map
being `a ↦ a / σ(a)` and the last the norm (§3.5); hence the norm `Nm` on Picard stacks has as
homotopy fibre the stack of line bundles with a trivialised norm, and on Picard schemes the kernel
of `Nm : Pic_{X'} → Pic_X` has two connected components (Yun–Zhang 2017, §6.1, proof of
Proposition 6.1 (1), p. 40); no exact sequence of groups of rational points is asserted beyond
what the stack sequence gives. *Needs:* §1.18, §1.19, §3.4,
§3.5, §3.6; JacobianChallenge Layers C–D.

**Checks.**
- `picardStack_projectiveLine` (`Pic(ℙ¹)` stack: `ℤ × B𝔾_m`), `picardStack_field`, `picardStack_aut`,
  `picardStack_not_scheme` (not representable: nontrivial inertia).
- `sectionStack_negative` (degree `−1`: the zero section only), `sectionStack_projectiveLine`,
  `sectionStack_rank`, `sectionStack_not_bundle` (on an elliptic curve, in degree zero, `h⁰(O)=1`
  and `h⁰(L)=0` for every nontrivial degree-zero `L`; hence it is not a vector bundle).
- `abelMap_test_genus_zero`: for `ℙ¹` and `d = 1`, `X → Pic^1 = pt` with fibre `ℙ¹`.
- `abelMap_test_conic`: for the real conic `x² + y² + z² = 0`, `Pic¹_{X/ℝ} = Spec ℝ` while
  `X^{(1)} = X` has no real point, so `a_1` is a nonsplit conic over a point and not `ℙ(E)` for a
  rank-two real vector space, although `d = 1 > 2g − 2 = −2`.
- `abelMap_test_pointed`: for a pointed curve with the Poincaré bundle normalised at the point,
  `a_d = ℙ(p_* L)` globally; `abelMap_test_twist`: twisting the Poincaré bundle by a line bundle
  from `Pic^d` does not change the projectivisation.
- `norm_sequence_test_unramified`: for an unramified double cover the kernel of `Nm` has two
  components.

### 3.8 Invariant differentials and the pullback of forms along Abel–Jacobi

Prove `invariant_differentials`: for a group scheme `f : G → S` with unit `e`, `Ω¹_{G/S} ≅ f^* e^*
Ω¹_{G/S}` (the sheaf of differentials is the pullback of the cotangent space at the identity), and
for an abelian variety `A` over `k`, `Γ(A, Ω¹_{A/k}) ≅ T_0(A)^∨` of dimension `dim A` (Stacks,
Lemma 047I; Tau Ceti's `AbelianVariety.TangentSpace`). Prove `abelJacobi_differentials`: for a
smooth projective geometrically connected curve `X` with a rational point `x_0` and the
Abel–Jacobi map `ι : X → J` of JacobianChallenge Layer F, `ι^* : Γ(J, Ω¹_J) → Γ(X, Ω¹_X)` is an
isomorphism. Under this isomorphism and Serre duality, the dual of the tangent map
`T_{x_0} X → T_0 J = H¹(X, O_X)` is the evaluation map
`H⁰(X, Ω¹_X) → Ω¹_X|_{x_0}` (Milne 2008,
Part III, Propositions 2.1, 2.2, p. 91). *Needs:* §3.3, §3.6; StableReduction Layer 1
(`Ω¹`); JacobianChallenge Layers E–F; Tau Ceti `AbelianVariety.TangentSpace`.

**Checks.**
- `invariant_differentials_test_Gm`: `Ω¹_{𝔾_m}` is free on `dt/t`.
- `invariant_differentials_test_elliptic`: for an elliptic curve `Γ(E, Ω¹)` is one-dimensional,
  spanned by `dx/(2y + a_1 x + a_3)`.
- `abelJacobi_differentials_test_genus_one`: for `E = J`, `ι = 𝟙` and `ι^* = 𝟙`.

### Examples

Genus zero (`ℙ¹` and the pointless conic), genus one (elliptic curves and index-`n` torsors), the
nodal cubic (Gorenstein, genus one, `ω` of degree `0`), the hyperelliptic double cover (norms versus
determinants) and the inseparable base change of `y² = x^p − t`.

### Dependencies

Layer 0: §0.7 (dimension). Layer 1: §1.1, §1.18–§1.19 (stacks, for §3.7). Layer 2: §2.6
(quasi-coherent cohomology), §2.11 (Hilbert 90), §2.20 (duality). Mathlib and Tau Ceti as listed;
JacobianChallenge Layers A–F; AlgebraicCurves Layers 3, 4, 7, 8, 10, 12; StableReduction Layers
0–2; AlgebraicVectorBundles L0B–L0C; ModularCurves 0B; ClassFieldTheory Layer 5.

## Layer 4: deformations, formal schemes, models and alterations

The deformation-theoretic, formal and birational layer. Mathlib provides formally smooth,
unramified and étale algebras with square-zero lifting, the naive cotangent complex, formally
unramified morphisms of schemes, adic completion with Artin–Rees, Proj, the Rees algebra, rational
and birational maps, relative normalisation and the Grassmannian functor; Tau Ceti provides models
over a discrete valuation ring with their fibres and finite extensions. Layer 4 adds thickenings and
the lifting definitions of formally smooth, unramified and étale morphisms with the infinitesimal
lifting criterion and the torsor of lifts; the Artinian coefficient category `C_Λ`, deformation
functors with Schlessinger's conditions, hulls, Schlessinger's theorem, obstruction theories,
square-zero deformations classified by the naive cotangent complex, deformations of smooth schemes
and line bundles; adic thickening systems with the formal spectrum, formal completion, coherent
formal modules, the theorem on formal functions, Grothendieck's existence theorem and
algebraization; modifications, strict transforms, flattening, domination and the resolution of
curves; Chow's lemma, Hilbert and Quot schemes; the moduli stack of stable pointed curves with its
algebraicity, properness, smoothness and finite projective cover; and de Jong's alteration theorems
over a field and over a trait.

**Conventions of this layer.** `Λ` is a Noetherian ring with a finite map to a field `k`; objects
of `C_Λ` carry a fixed augmentation to `k`. Deformation functors are set-valued; a hull is never
identified with a prorepresenting ring. An adic thickening system is a tower of closed immersions
`X_0 → X_1 → ⋯` in which `X_n` is cut out in `X_{n+1}` by the `(n+1)`-st power of the ideal of
`X_0`; it is the carrier of this layer for what the sources call a formal scheme, and its morphisms
are the level-preserving ones, which form a strictly smaller class than the continuous morphisms of
formal schemes (§4.7). A modification is proper birational; an alteration is proper, dominant and
generically finite; de Jong's "semi-stable curve" is StableReduction Layer 3's prestable family. A
trait is the spectrum of a complete discrete valuation ring. StableReduction Layers 0–4 and 7–9
(models, nodal families, coherent curve theory, blow-ups and admissible blow-ups, stable and pointed
stable reduction), JacobianChallenge Layers C and E, Layer 0's excellence package, Layer 1's spaces
and stacks, Layer 2's torsor and Ext classification and Layer 3's Picard schemes are imported.
Néron models and abelian semistable reduction, characteristic-zero resolution, the full cotangent
complex and `Ext²` obstruction classes, prismatic and crystalline deformation theory are not here.

### 4.1 Thickenings, formally smooth and étale morphisms, the lifting criterion, torsors of lifts

Define `IsThickening i` for `i : Z → X`: a closed immersion surjective on points (equivalently, the
ideal sheaf `i.ker` is locally nilpotent); `IsFirstOrderThickening i`: a closed immersion with
`i.ker * i.ker = ⊥` (Stacks, Definition 37.2.1 (04EX)). API: `IsFirstOrderThickening.isThickening`,
`isFirstOrderThickening_specMap_iff` (`Spec (B/J) → Spec B` iff `J² = 0`),
`IsFirstOrderThickening.pullback`, `IsThickening.homeomorph`, `IsThickening.factor_firstOrder` (a
thickening of order `n + 2` factors through a first-order thickening of one of order `n + 1`),
`IsThickening.isUniversalHomeomorphism` (§0.23). Define `FormallySmooth f` (respectively
`FormallyUnramified`, Mathlib's, and `FormallyEtale f`) for `f : X → S`: for every first-order
thickening `T → T'` of **affine** schemes over `S`, every `S`-morphism `T → X` extends to at least
one (at most one, exactly one) `S`-morphism `T' → X` (Stacks, Definitions 37.11.1 (02H0), 37.6.1
(02H8), 37.8.1 (02HG)). API: `formallySmooth_specMap_iff` (Mathlib's `RingHom.FormallySmooth`),
`FormallySmooth.iff_affineLocally`, `.comp`, `.pullback`, `FormallyEtale.of_isOpenImmersion`,
`formallyEtale_iff` (`FormallySmooth ∧ FormallyUnramified`), `FormallySmooth.of_smooth` (Lemmas
37.11.4 (02HH), 37.11.6 (02H4), 37.11.10 (0D0F)). Prove `smooth_iff_formallySmooth` and
`etale_iff_formallyEtale`: for `f` locally of finite presentation, smooth iff formally smooth, étale
iff formally étale (Stacks, Lemma 37.11.7 (02H6), Lemma 37.8.10 (02HM), Lemma 37.6.9 (02HE),
Proposition 10.138.13 (00TN)). Prove `smooth_lifting_torsor`: for `f : X → S` smooth, `i : T → T'`
a first-order thickening over `S` with ideal `I` and `a : T → X` over `S`, the sheaf of lifts of `a`
to `T'` is a torsor under `Hom_{O_T}(a^* Ω_{X/S}, I)`, with an obstruction class in `H¹(T,
Hom(a^* Ω_{X/S}, I))` whose vanishing is equivalent to the existence of a lift, trivial when `T'` is
affine; for `f` étale the lift is unique (Stacks, Lemmas 37.9.1 (04FG), 37.9.2 (02H5), 37.9.4
(04FH), 37.9.5 (04FJ), Remark 37.9.6 (04FK); Lemma 20.4.3 (02FQ); Lemmas 37.11.9 (0D0E), 37.11.8
(06B5)). *Needs:* §0.23, §2.3; Mathlib `IsClosedImmersion`, `Scheme.Hom.ker`, `FormallyUnramified`,
`Algebra.FormallySmooth`, `Algebra.FormallySmooth.exists_lift`, `AffineSpace`; StableReduction
Layer 1 (`Ω_{X/S}`).

**Checks.**
- `isFirstOrderThickening_dualNumber`: `Spec k → Spec k[ε]` is first-order.
- `isFirstOrderThickening_id`: the identity is a first-order thickening.
- `not_isFirstOrderThickening_cube`: `Spec k → Spec k[x]/(x³)` is a thickening and not first-order.
- `not_isThickening_origin`: `Spec k → 𝔸¹_k` is a closed immersion that is not a thickening.
- `formallySmooth_affineSpace`: `𝔸(n; S) → S` is formally smooth; `formallyEtale_id`;
  `not_formallySmooth_closedPoint` (`Spec k → 𝔸¹_k` is not formally smooth);
  `formallyUnramified_iff_mathlib`.
- `lifting_torsor_test_affine_space`: lifts of `T → 𝔸¹_S` along `T → T'` form a torsor under
  `Γ(T, I)`.

### 4.2 The Artinian coefficient category

Fix a Noetherian ring `Λ` and a finite ring map `Λ → k` to a field. Define `IsArtinLocalAug` on
`Over (CommAlgCat.of Λ k)`: `A` is Artinian local with surjective augmentation `A → k` (so `A/m_A ≅ k`
as `Λ`-algebras), and `ArtinLocalAlg Λ k` the full subcategory `C_Λ`, whose morphisms are
`Λ`-algebra maps over `k`, automatically local (Stacks, Definition 90.3.1 (06GC), convention of
Section 90.2 (06G9)). API: `ArtinLocalAlg.residue` (`k`, terminal), `toResidue`, `dualNumbers`
(`k[ε]`), `IsSmallExtension f` (surjective with nonzero principal kernel killed by the maximal
ideal; Definition 90.3.2 (06GD)), `ArtinLocalAlg.pullback` (fibre products along a
surjection stay in `C_Λ`; Lemma 90.3.8 (06GH)) with `pullbackFst`, `pullbackSnd`, `isPullback`,
`dualAdd` (the addition map `k[ε] ×_k k[ε] → k[ε]`), `CompleteLocalAlg Λ k` (the category `Ĉ_Λ` of
complete Noetherian local `Λ`-algebras with residue field `k`; Definition 90.4.1 (06GW)) with
`R = lim R/m^n` supplied by Mathlib `AdicCompletion.of_bijective`. ModularCurves 7D's `ArtinianTestAlgebra` is the case
`Λ = W(k)`, `k` algebraically closed, and is identified with `ArtinLocalAlg (W k) k` by
`artinianTestAlgebraEquiv`. *Needs:* Mathlib `IsArtinianRing`, `IsLocalRing`, `CommAlgCat`,
`Over`, `IsAdicComplete`, `DualNumber`; ModularCurves 7D (comparison only).

**Checks.**
- `zmod_prime_pow_mem`: `ℤ/p^{n+1}` with `ℤ/p^{n+1}/(p) ≅ 𝔽_p` is an object of `C_{ℤ_p}`.
- `residue_terminal`: `k` is terminal.
- `not_mem_padicInt`: `ℤ_p` is in `Ĉ_{ℤ_p}` and not in `C_{ℤ_p}` (not Artinian).
- `dualNumber_pullback`: `k[ε] ×_k k[ε]` has a two-dimensional cotangent space.
- `smallExtension_test_dual`: `k[ε] → k` is a small extension; `k[x]/(x³) → k` is not (kernel not
  killed by the maximal ideal) but factors as two small extensions.

### 4.3 Deformation functors and Schlessinger's conditions

The hull and prorepresentability theorems here use the classical coefficient setting: `Λ` is
complete Noetherian local and `Λ → k` is surjective, identifying `k` with its residue field.
They do not assert the general finite-residue-extension version of the Stacks setup.

Define `PredeformationFunctor Λ k`: a functor `F : C_Λ ⥤ Type` with `F(k)` a point (Stacks,
Definition 90.6.2 (06GS)). For `A' → A`, `A'' → A` with the second surjective, define `θ :
F(A' ×_A A'') → F(A') ×_{F(A)} F(A'')` and the conditions `H1` (`θ` surjective whenever `A'' → A` is
a small extension), `H2` (`θ` bijective for `A = k`, `A'' = k[ε]`), `tangentSpace := F(k[ε])` with
the `k`-vector space structure under `H2` (`tangentSpace.addCommGroup`, `.module`, `add_def`: the
sum is computed by `dualAdd`; Lemma 90.12.2 (06IH)), `H3` (finite-dimensional tangent space), `H4`
(`θ` bijective for `A' = A''` a small extension of `A`) (Stacks, Definitions 90.10.1 (06HW),
90.12.1 (06IG), 90.16.1 (06J2), 90.16.8 (06J9); Remarks 90.10.3 (06HY), 90.13.5 (0D3G), 90.16.5
(06J6), 90.16.9 (06JA)); `IsDeformationFunctor`: `H1 ∧ H2` (the Rim–Schlessinger condition `RS` in
the form of Lemma 90.16.6 (06J7)). API: `lifts_torsor` (under `H2` and `H4`, the lifts of
`ξ ∈ F(A)` along a small extension, when nonempty, form a torsor under `T_F ⊗ I`; Lemma 90.17.5
(06JI)), `PredeformationFunctor.map` (functoriality on tangent spaces), `tangent_eq_derivations`
(for `h_R`, `T = Der_Λ(R, k)` through Tau Ceti's `derivationToDualNumberEquivLift`). Define `prorep
R : PredeformationFunctor Λ k` for `R ∈ Ĉ_Λ`, `h_R = Hom_Λ(R, −)|_{C_Λ}`. *Needs:* §4.2; Mathlib
`DualNumber`; Tau Ceti `derivationToDualNumberEquivLift`.

**Checks.**
- `prorep_tangent_powerSeries`: for `R = Λ[[t_1..t_n]]`, `T_{h_R} = k^n`.
- `point_functor`: the one-point functor satisfies `H1`–`H4` with zero tangent space.
- `not_H2_quotient`: for `char k ≠ 2`, the quotient of `h_{k[[t]]}` by `t ↦ −t` satisfies `H1` and
  not `H2`.
- `tangent_eq_derivations`: `T_{h_R} ≅ Der_Λ(R, k)`.

The Schlessinger existence and classification theorems below assume `Λ` Noetherian
and the specified map `Λ → k` finite (Stacks 06G9). These assumptions supplement the
Artinian local test-algebra conditions; they are not inferred from them.

### 4.4 Versality, hulls and Schlessinger's theorem

Define `IsSmoothMorphism η` for `η : F → G` of predeformation functors: for every surjection `A' →
A` in `C_Λ`, `F(A') → F(A) ×_{G(A)} G(A')` is surjective (Stacks, Definition 90.8.1 (06HG));
`FormalElement F R := h_R → F` for `R ∈ Ĉ_Λ` (Definition 90.7.1 (06H3)); `IsVersal ξ` for a formal
element: `ξ : h_R → F` is smooth (Definition 90.8.9 (06HR)); `IsHull ξ`: versal and bijective on
tangent spaces (Definition 90.14.4 (06T4)); `IsProrepresentable F`: some `ξ` is an isomorphism
(Definition 90.6.1 (06GX)). Prove `IsHull.unique` (two hulls have isomorphic rings; Lemma 90.14.5
(06T5)), `IsProrepresentable.isHull`, `smooth_iff_powerSeries` (`h_R → h_Λ` is smooth iff `R ≅
Λ[[t_1..t_n]]`), `IsVersal.exists_hull_of_RS`: **under the Rim–Schlessinger condition** `H1 ∧ H2`
and `H3`, every versal formal element `ξ : h_R → F` factors as `h_R → h_{R_0} → F` with `(R_0, ξ_0)` a
hull and `R ≅ R_0[[t_1..t_r]]` for `r = dim T_{h_R} − dim T_F`, with `ξ` the composite (Stacks,
Lemma 90.14.9 and Remark 90.14.10); the hypotheses are necessary: a predeformation functor can have
a versal element and no hull (`versal_quotient_no_hull` below, which fails `H2`). Prove
`schlessinger_hull`: a predeformation functor has a hull iff it satisfies `H1`, `H2` and `H3`
(Stacks, Lemma 90.13.4 (06IW), Theorem 90.15.5 (06IX), Remark 90.15.6 (06IY)); and
`schlessinger_prorepresentable`: it is prorepresentable iff moreover `H4` (Theorem 90.18.2 (06JM)).
*Needs:* §4.2, §4.3; Mathlib `AdicCompletion`, `MvPowerSeries`.

**Checks.**
- `hull_prorep`: for `F = h_R`, `(R, 𝟙)` is a hull and `F` is prorepresentable.
- `smooth_iff_powerSeries`: `h_R → h_Λ` is smooth iff `R` is a power series ring over `Λ`.
- `versal_not_hull`: for `F = h_{k[[t]]}`, `(k[[t, s]], t ↦ t)` is versal and not a hull (tangent
  map not injective); `IsVersal.exists_hull_of_RS` recovers the hull `k[[t]]` with `r = 1`.
- `versal_quotient_no_hull`: for `char k ≠ 2`, the quotient functor `D` of `not_H2_quotient` (a
  predeformation functor failing `H2`) has the versal formal element `h_{k[[t]]} → D` and no hull,
  because a hull would force `H2`; this is the counterexample outside the hypotheses of
  `IsVersal.exists_hull_of_RS`, and `schlessinger_hull` confirms it.
- `versal_identity_factorization_unique`: for `ξ : h_R → h_{R₁}`, factorisation through
  the identity of `h_{R₁}` is unique: `ξ = π ∘ id` forces `π = ξ`. In the two-variable
  example, `s ↦ 0` and `s ↦ t` are retractions of the ring inclusion, hence have the
  opposite functorial direction; they do not give two such factorisations.

### 4.5 Obstruction theories

Define `ObstructionTheory F` for a predeformation functor `F`: a
finite-dimensional `k`-vector space `O` and, for every small extension `e : 0 → I → A' → A → 0` in
`C_Λ` and every `ξ ∈ F(A)`, an element `ob_e(ξ) ∈ O ⊗_k I` (not `O`: the kernel `I` is a
one-dimensional `k`-vector space whose identification with `k` is a choice, and the class must be
independent of it), satisfying `lift_iff` (`ob_e(ξ) = 0` iff `ξ` lifts to `F(A')`),
`ob_naturality` (for a morphism of small extensions `e → e'` over `A → A_1`, `I → I_1`, `ob_{e'}(ξ')
= (1 ⊗ (I → I_1))(ob_e(ξ))` when `ξ'` is the image of `ξ`), `ob_linear` (linearity in `I` under base
change of the extension along `k`-linear maps of kernels, in particular `ob` is compatible with
the `k`-action on `I`) (Stacks, Definition 98.22.1 (07YG), Examples 98.22.3 (07YH), 98.22.4 (07YI);
Definition 90.9.1 (06HP)). Without naturality in the extension, every functor admits a
one-dimensional "obstruction theory" by choosing `ob_e(ξ) ≠ 0` exactly when `ξ` does not lift,
which carries no information (`test_fake_theory_rejected` below). API: `lift_iff'`,
`ObstructionTheory.zero` (an unobstructed functor has the zero theory), `ObstructionTheory.map`
(pullback along a smooth morphism of functors), and the relation-bound target `ObstructionTheory.minimal_presentation`: for a hull
`(R, ξ)` with a minimal presentation `R ≅ Λ[[t_1..t_d]]/J`, compare the minimal number of
relations `dim_k J/m_S J` (`S = Λ[[t_1..t_d]]`) with `dim_k O`. **Stated gap:** the elementary-kernel
`ObstructionTheory` signature does not supply an obstruction theory on every finite-dimensional
kernel with compatibility under linear pushout and direct sums, or a comparison of
`Ideal.spanFinrank J` with this relation space. The bound is not a theorem of that signature.
An exact reference proving the relative relation bound for a hull with those compatibility
hypotheses, and a Nakayama comparison for `J/m_S J`, is required. Stacks Definition 98.22.1 (07YG)
specifies obstruction functors on all modules; its section has no Lemma 98.22.6. Schlessinger 1968,
equation (2.17), p. 213, describes the tangent-space action on lifts, not a relation bound.
The minimality hypothesis is essential: for `Λ = k`, `F` the one-point functor with hull `R = k`, the zero obstruction theory and the non-minimal
presentation `R = k[[t]]/(t)`, the relation module `(t)/(t²)` is one-dimensional while `dim O = 0`
(`test_nonminimal_presentation_rejected` below). *Needs:* §4.3, §4.4; Mathlib `Ideal.spanFinrank`,
`TensorProduct`.

**Checks.**
- `obstruction_powerSeries`: `h_{Λ[[t_1..t_n]]}` has the zero obstruction theory.
- `obstruction_hypersurface`: for `R = Λ[[t]]/(t²)`, every obstruction theory for `h_R` has
  `dim O ≥ 1` (the minimal presentation has one relation).
- `not_unobstructed_hypersurface`: `h_{k[[x, y]]/(xy)}` is not unobstructed (the lift of `(x, y) ↦
  (ε, ε)` to `k[ε]/(ε³)` fails).
- `test_fake_theory_rejected`: the assignment `ob_e(ξ) := [ξ lifts] ? 0 : v` for a fixed `v ≠ 0 ∈
  O ⊗ I` cannot in general be natural in kernel isomorphisms: over `ℚ`, scaling `ε ↦ 2ε`
  in `ℚ[ε]/(ε³) → ℚ[ε]/(ε²)` scales its kernel by `4`; a fixed nonzero obstruction value
  would have to satisfy `v = 4v`.
- `test_nonminimal_presentation_rejected`: with `Λ = k`, the one-point functor, `R = k` and the zero
  theory, `R = k[[t]]/(t)` is not a minimal presentation (`d = 1 ≠ dim T_F = 0`), so
  a relation bound without minimality would assert the false inequality `1 ≤ 0`.
- `obstruction_H1_example`: for the functor of lifts of a fixed morphism `a : T → X` to a smooth
  `X` along thickenings of `T`, `H¹(T, Hom(a^* Ω, O))` is an obstruction space (§4.1).

- `kernel_not_residue_vector_space`: in `ker(ℤ/8 → ℤ/2)`, `2 · 2 = 4 ≠ 0`.
  Thus an arbitrary surjection's kernel is not an `𝔽₂`-vector space; the kernel
  construction and its linear maps require the small-extension hypothesis.

### 4.6 Deformations of algebras, smooth schemes, line bundles and nodes

Prove `algebra_deformation_classes`: for a square-zero extension `0 → I → A' → A → 0` and a flat
`A`-algebra `B`, the obstruction to a flat deformation `B'` lies in `Ext²_B(L_{B/A}, B ⊗ I)`, the
deformations form a torsor under `Ext¹_B(L_{B/A}, B ⊗ I)` when nonempty, and their automorphisms
are `Hom_B(Ω_{B/A}, B ⊗ I)`, with the full cotangent complex `L`; its degree-one truncation suffices for the
classification and automorphism terms but not for the general obstruction term (Stacks, Section 91.2
setup (08S3), Lemmas 91.2.3 (0GPT), 91.2.2 (08S7), 91.2.1 (08S5), 91.2.9 (08S6), Remark 91.2.8
(0GPY), Lemma 91.8.1 (0D14), Lemma 37.10.1 (063Y), Lemma 92.16.1 (08SP)). Prove
`deformations_of_smooth_schemes`: for `X` smooth proper over `k` and a small extension `A' → A`,
the obstruction to deforming a deformation over `A` to `A'` lies in `H²(X, T_X) ⊗ I`, the
deformations form a torsor under `H¹(X, T_X) ⊗ I`, and automorphisms are `H⁰(X, T_X) ⊗ I`; for an
invertible sheaf `L` on `X_A`, the obstruction to deforming `L` lies in `H²(X, O_X) ⊗ I` with
deformations a torsor under `H¹(X, O_X) ⊗ I` (Stacks, Example 93.9.1 (0DY7), Lemmas 93.9.2–93.9.5
(0DY8, 0DY9, 0DYA, 0ET5), 93.16.4 (0DZQ), 91.8.1 (0D14), 37.13.7 (0D0N), 37.4.1 (0C6R)). Prove
`node_versal_deformation`: the deformation functor of the node `k[[u, v]]/(uv)` over `Λ` has hull
`Λ[[t]]` with universal family `uv = t`, and the deformation functor of a stable nodal curve of genus `g ≥ 2` has hull
`Λ[[t_1..t_{3g−3}]]` with the nodes' smoothing parameters as `t_1..t_δ` (Deligne–Mumford 1969, §1,
Proposition (1.5), Theorem (1.6), pp. 81–83). *Needs:* §2.6, §4.1, §4.3–§4.5; Mathlib
`Algebra.Extension.CotangentComplex` (`NL`), `Ext`; StableReduction Layers 1, 3.

**Checks.**
- `algebra_deformation_test_smooth`: a smooth algebra deforms uniquely up to isomorphism (`NL`
  is `Ω` in degree `0`, `Ext¹ = Ext² = 0` for affine smooth).
- `smooth_scheme_test_projective_line`: `ℙ¹` is rigid (`H¹(T) = 0`) and unobstructed.
- `smooth_scheme_test_elliptic`: an elliptic curve has one-dimensional `H¹(T)` and `H²(T) = 0`.
- `node_test_smoothing`: the fibre of `uv = t` over `t ≠ 0` is smooth.

### 4.7 The formal spectrum and adic thickening systems

Define `AdicRing`: a ring `A` with a finitely generated ideal `I` such that `A` is `I`-adically
complete and separated (Mathlib `IsAdicComplete I A`) (Stacks, Definition 15.37.1 (07E8)). Define
`AdicThickeningSystem`: a sequence of schemes `X_n` with closed immersions `ι_n : X_n → X_{n+1}`
that are thickenings and satisfy `ker ι_n = (ker (X_0 → X_{n+1}))^{n+1}` (so `X_n` is the `n`-th
infinitesimal neighbourhood of `X_0` in `X_{n+1}`), with `reduction n`, `levelMap`, `Hom` (families
of morphisms `X_n → Y_n` commuting with the `ι`), `IsAdicHom` (each square is cartesian),
`ofScheme X` (the constant system), `IsLocallyNoetherian`, `pullback` of adic morphisms computed
levelwise with `pullback_X` (Stacks, Definition 87.9.9 (0AIF)). This is not the category of formal
schemes: its morphisms carry the chosen ideal of definition into the target's at the same level,
and a continuous morphism of formal schemes need not do so (`not_levelPreserving_powerSeries`
below). This section uses the category of adic thickening systems with the stated level-preserving morphisms.
Define `Spf A` for an adic ring as
the system `Spec (A/I^{n+1})`; `A = lim A/I^{n+1}` is Mathlib `AdicCompletion.of_bijective`. Define `Spf.homEquiv` (adic
thickening system morphisms `Spf B → Spf A` are ring maps `A → B` with `φ(I) ⊆ J`, the
level-preserving ones), `Spf.ofScheme` (for `I = 0`, `Spf A = Spec A`),
`Spf.map` (Stacks, Section 87.2, Definitions 87.9.7, 87.9.9). *Needs:* §4.1; Mathlib
`IsAdicComplete`, `AdicCompletion`, `Ideal.Quotient.factor`, `IsPullback`.

**Checks.**
- `Spf.padicInt_points`: `Spf ℤ_p` has one point.
- `Spf.discrete_eq_spec`: for `I = 0`, `Spf A = Spec A`.
- `Spf.not_spec_powerSeries`: `Spf k[[t]]` has one point and `Spec k[[t]]` two.
- `Spf.homEquiv_padic`: the only endomorphism of `ℤ_p` is the identity, so `Spf ℤ_p` has only the
  identity endomorphism.
- `ofScheme_spf`: a scheme as a constant system is `Spf` with the zero ideal.
- `padic_line`: the reductions of the completion of `𝔸¹_{ℤ_p}` along `p = 0` are `𝔸¹` over
  `ℤ/p^{n+1}`.
- `not_adic_projection`: `Spf k[[s, t]] → Spf k[[s]]` (`s ↦ s`) is not adic: `(s)` does not generate
  an ideal of definition of `k[[s, t]]`.
- `not_levelPreserving_powerSeries`: the identity of `k[[t]]` is continuous from the `(t)`-adic to
  the `(t²)`-adic topology but `(t) ⊄ (t²)`, so it is not a level-preserving morphism `Spf (k[[t]],
  (t²)) → Spf (k[[t]], (t))`; continuity follows from `(t)² ⊆ (t²)`.
- `locallyNoetherian_padic`: `Spf A` is locally Noetherian for `A` Noetherian.

### 4.8 Formal completion and coherent formal modules

Define `Scheme.formalCompletion X I` for a scheme `X` and `I : X.IdealSheafData`: the adic
thickening system of the infinitesimal neighbourhoods `V(I^{n+1})`, with `toScheme n : V(I^{n+1}) →
X`, `map` (functoriality for morphisms carrying the first centre into the second), `reduction`
(Stacks, Lemma 87.14.2 (0AIZ), Definition 87.14.3 (0AMC), Lemma 87.14.6 (0GBA)). Prove
`formalCompletion.isLocallyNoetherian` (for `X` locally Noetherian the system is locally
Noetherian). Flatness of the adic completion of a Noetherian local ring is supplied by
Mathlib `AdicCompletion.flat_of_isNoetherian`; this is not a flatness assertion about the individual
closed-immersion reductions. Prove `formalCompletion_spec` (for `X = Spec A` and `I`
finitely generated, `X/V(I) ≅ Spf Â`; Lemma 87.14.6 (0GBA)). Define `CoherentFormalModule 𝔛` for an
adic thickening system: inverse systems `(F_n)` with `F_n` a finitely presented `O_{X_n}`-module and
isomorphisms `ι_n^* F_{n+1} ≅ F_n`, with `completionFunctor X I M` (`M ↦ (M/I^{n+1} M)_n`),
`completionFunctor_exact` (exact in the category of coherent formal modules,
by Artin–Rees; this is not termwise exactness of the reductions: multiplication by `t`
on `k[[t]]` becomes zero modulo `t`; Lemma 30.23.4 (0881)), `coherentFormalModuleEquivSpec` (coherent formal modules on `Spf Â` are finite `Â`-modules;
Lemma 30.23.1 (087W)), `coherentFormalModuleEquivFormal` (coherent formal modules on `X/Z` are
coherent modules on the EGA formal scheme; Section 52.15 (0EKN)), `completionFunctor_obj_sections`
(sections of the completion are the completion of sections) (Stacks, Section 30.23 (0EHN), (0880)).
*Needs:* §4.7; Mathlib `IdealSheafData.subscheme`, `inclusion`, `AdicCompletion`,
`AdicCompletion.map_exact`, `AdicCompletion.flat_of_isNoetherian`, `SheafOfModules.IsFinitePresentation`,
`Scheme.Modules.pullback`.

**Checks.**
- `formalCompletion_affineLine_origin`: the reductions of the completion of `𝔸¹_k` at the origin
  are `Spec k[t]/(t^{n+1})`, those of `Spf k[[t]]`.
- `formalCompletion_self` (`I = ⊥` gives the constant system `X`), `formalCompletion_empty` (`I = ⊤`
  gives the empty system), `formalCompletion_ne_neighbourhood` (`k[[t]]` is not Artinian, so the
  completion is not an infinitesimal neighbourhood).
- `completion_structureSheaf_spec`: for a complete Noetherian `A`, `A → Â` is bijective.
- `completion_zero_ideal`: for `I = 0` the completion functor is the identity.
- `completion_not_full_affineLine`: `k[x] → k[[x]]` is not surjective, so multiplication by
  `1/(1 − x)` is not the completion of an endomorphism of `O_{𝔸¹}`: the completion functor is not
  full.
- `completion_torsion`: `ℤ/p^m` is `p`-adically complete.
- `formalCompletion_flat_test_dvr`: for `X = Spec R` of a DVR and `Z` the closed point, `R → R̂` is
  flat and not surjective.

### 4.9 The theorem on formal functions and Stein factorisation

Prove `theorem_on_formal_functions`: for `f : X → Spec A` proper with `A` Noetherian, `I ⊆ A` an
ideal and `F` coherent on `X`, `H^p(X, F)^∧ ≅ lim_n H^p(X, F/I^n F)` for every `p`, where the left
side is the `I`-adic completion of the finite `A`-module `H^p(X, F)`; the inverse system `H^p(X,
F/I^n F)` is Mittag-Leffler, and for `f` proper to a Noetherian scheme `Y`, `(R^p f_* F)^∧_y ≅ lim_n
H^p(X_n, F_n)` on the completion of the local ring at `y` (Stacks, Proposition 30.19.1 (02O5),
Lemma 30.19.3 (0897), Lemma 30.20.4 (02OB), Theorem 30.20.5 (02OC), Lemmas 30.20.6 (087U), 30.20.7
(02OD)). This is the single owner of formal functions; JacobianChallenge Layer C consumes it. Prove
`stein_factorization`: a proper morphism `f : X → Y` of Noetherian schemes factors as `X → Spec_Y
(f_* O_X) → Y` with the first map proper with geometrically connected fibres and `f_* O = O`, the
second finite; Zariski's connectedness theorem: if `f_* O_X = O_Y` then the fibres of `f` are
geometrically connected (Stacks, Theorem 37.53.4 (03H0), Lemma 37.53.6 (0AY8)). *Needs:* §0.1,
§2.6, §4.8; StableReduction Layer 2 (coherence of `R^i f_*`).

**Checks.**
- `formal_functions_test_affine`: for `X = Spec A` the theorem reads `M^∧ = lim M/I^n M`.
- `formal_functions_test_projective_line`: for `ℙ¹_A` and `F = O`, `H⁰ = A` and `A^∧ = lim A/I^n`.
- `stein_test_blowup`: for the blow-up of a surface at a point, `f_* O = O` and the fibres are
  connected (`ℙ¹` over the point).
- `stein_test_finite`: for a finite morphism the Stein factorisation is `X = Spec_Y f_* O_X → Y`.

### 4.10 Grothendieck's existence theorem and algebraization

Let `A` be a Noetherian adic ring with ideal `I` and `quotMap A n : Spec (A/I^{n+1}) → Spec A`.
Prove `grothendieck_existence`: for `f : X → Spec A` proper and `I` the ideal sheaf of
`f⁻¹(V(I))`, the completion functor is an **equivalence of categories** from coherent `O_X`-modules
to coherent formal modules on `X/V(I)` (§4.8): fully faithful (compatible morphisms of completions
come from a unique morphism of coherent modules) and essentially surjective (Stacks, Section 30.24
(087V), Lemmas 30.24.1 (0883), 30.24.3 (0885), Section 30.25 (0886), Lemmas 30.25.2–30.25.3 (088A,
088B), Proposition 30.25.4 (088C), Theorem 30.27.1 (088E), Remark 30.27.2 (088F)). Prove
`algebraize_subschemes`: closed formal subschemes of `X/V(I)` (compatible systems of closed
subschemes `Z_n ⊆ X_n` with `Z_n = Z_{n+1} ×_{X_{n+1}} X_n`) are completions of unique closed
subschemes of `X`, and `algebraize_hom`: for `X` proper and `Y` separated of finite type over
`Spec A`, a **morphism of adic thickening systems** `g : (X_n) → (Y_n)` over `(Spec A/I^{n+1})_n`,
that is a family `g_n : X_n → Y_n` over `A/I^{n+1}` with `g_n = g_{n+1} ×_{Y_{n+1}} Y_n` on
`X_n = X_{n+1} ×_{Spec A/I^{n+2}} Spec A/I^{n+1}` (the transition squares commute), comes from a
unique morphism `G : X → Y` over `A` with `G_n = g_n` for all `n` (Stacks, Lemmas 30.28.1 (0899),
30.28.2 (09ZT), 30.28.3 (0A42)). The compatibility with transitions is essential: for `A = k[[t]]`,
`X = Spec A` and `Y = 𝔸¹_A`, the maps `g_0 : Spec k → 𝔸¹_k` at `0` and `g_1 : Spec k[t]/(t²) →
𝔸¹_{k[t]/(t²)}` at `1` do not form a system and come from no morphism (`algebraize_hom_test_incompatible`
below). Prove `grothendieck_algebraization`: for an adic thickening system `(X_n)` with an adic
morphism to `Spf A` such that `X_0 → Spec A/I` is proper, together with a **compatible system of
invertible sheaves** `L_n` on `X_n` (`L_n = L_{n+1}|_{X_n}`) with `L_0` ample on `X_0`, there is a
proper `A`-scheme `X` with an ample invertible sheaf `L` whose completion is `(X_n, L_n)`, unique up
to unique isomorphism, and the functor from proper `A`-schemes with an ample sheaf to such systems
is an equivalence (Stacks, Theorem 30.28.4 (089A), Lemma 30.19.3 (0897)); ampleness is
StableReduction Layer 2's notion, and properness of `X_0` alone is not sufficient (the system of
reductions of a proper non-projective formal scheme over `k[[t]]` with no ample system, Stacks,
Example 30.27.3's type, is not algebraizable; `algebraization_test_needs_ample`). Prove
`effective_formal_deformations_of_curves`: a formal deformation of a proper curve over a complete
Noetherian local ring is effective (algebraizable), using the ample system `ω^{⊗ 3}` or `O(nP)`
(Stacks, Theorem 30.28.4 (089A), Lemma 93.16.4 (0DZQ)). *Needs:* §4.7–§4.9; StableReduction Layer
2 (ampleness); Mathlib `IsProper`, `IsSeparated`, `LocallyOfFiniteType`.

**Checks.**
- `grothendieck_existence_test_affine`: for `X = Spec A`, coherent formal modules are finite
  `A`-modules (completeness of `A`).
- `grothendieck_existence_test_projective_line`: a coherent formal module on `ℙ¹_{A/I^{n+1}}`
  compatible in `n` is the completion of a coherent sheaf on `ℙ¹_A`.
- `algebraize_hom_test_compatible`: a compatible system `Spec A/I^{n+1} → 𝔸¹_{A/I^{n+1}}` is a
  point `a ∈ A` by completeness.
- `algebraize_hom_test_incompatible`: the family `g_n` with `g_0 = 0` and `g_1 = 1` (mod `t²`) is not
  a morphism of adic thickening systems (`g_1` restricts to `1 ≠ 0` on `X_0`), and no `G : Spec
  k[[t]] → 𝔸¹` has both reductions.
- `algebraization_test_needs_ample`: the hypothesis "proper initial fibre" alone does not give
  algebraization; the theorem is applied only with the compatible ample system.
- `algebraization_test_projective_line`: the constant system `ℙ¹_{A/I^{n+1}}` with `O(1)`
  algebraizes to `ℙ¹_A`.

### 4.11 Modifications and strict transforms

Define `IsModification f` for `f : S' → S`: `f` is proper and there is a dense open `U ⊆ S` with
`f⁻¹(U)` dense in `S'` and `f` an isomorphism over `U` (Stacks, Definition 29.52.11 (0AAZ)); source
and target are assumed integral where used, and `IsModification.toBirational` gives Mathlib's
`Scheme.Birational`. API: `IsModification.comp`, `IsModification.centre` (the closed set over which
`f` is not an isomorphism), `IsModification.isIso_of_isFinite` (a finite modification of a normal
integral scheme is an isomorphism), `IsModification.isAlteration` (§4.16),
`IsModification.functionField_equiv` (Stacks, Lemma 29.55.8 (0AB1)). Define the strict transform
with its centre explicit: for `f : X → S`, a modification `φ : S' → S` and a **chosen dense open**
`U ⊆ S` over which `φ` is an isomorphism (`IsModification.Witness φ U`), `strictTransform f φ U :
(X ×_S S').IdealSheafData` is the ideal sheaf of the scheme-theoretic closure of `X ×_S φ⁻¹(U) =
f⁻¹(U)` in `X ×_S S'` (Stacks, Definition 31.34.1 (080D)); `strictTransformModule f φ U M` is the
quotient of `pr^* M` by the sections supported over `S' ∖ φ⁻¹(U)` (the quasi-coherent subsheaf of
sections killed by a power of the ideal of the exceptional locus). API: `strictTransform_eq_closure`
(the support is the closure of the preimage of `U`), `strictTransform_independent_of_witness` (for
`U ⊆ U'` both witnesses with `f⁻¹(U)` scheme-theoretically dense in `f⁻¹(U')`, the strict transforms
agree; in particular for `X` reduced and `U`, `U'` both dense in `X` the choice is immaterial, while
for `X` with embedded components it is not: the identity modification of `𝔸¹` with `X = {0}` gives
`X` for `U = 𝔸¹` and `∅` for `U = 𝔾_m`), `strictTransform_unique_of_flat` (for integral `S` and `S'`, a closed subscheme `Z ⊆ X
×_S S'` that is flat over `S'` and agrees with `X ×_S S'` **as closed subschemes** over `φ⁻¹(U)`
(`Z ×_{S'} φ⁻¹(U) = X ×_S φ⁻¹(U)` scheme-theoretically, not merely on supports) is the strict
transform; support agreement alone fails for `X = Spec k[ε]/(ε²)` against its reduced point),
`strictTransform_comp` (transitivity along composites of modifications), `strictTransform_self`
(for integral `S` and `S'`, `strictTransform (𝟙 S) φ U = ⊥`), `strictTransform_eq_blowup` (for `φ` the blow-up of `S` along a
closed subscheme `C` with `U = S ∖ C` and exceptional ideal `E = C·O_{S'}`, the strict transform of
`f` is StableReduction Layer 4's strict transform along the blow-up, and `strictTransformModule` is
the quotient of `pr^* M` by its `E`-power torsion; Stacks, Lemma 31.34.2 (080E)),
`strictTransform_closedImmersion` (for `X → S` a closed immersion, the strict transform is the
closure of `X ∩ U` in `S'`, the blow-up of `X` along `X ∩ C` in the blow-up case). *Needs:* §0.9;
Mathlib `IsProper`, `IsIntegral`, `Scheme.Birational`, `IdealSheafData`, scheme-theoretic closure;
StableReduction Layer 4 (blow-ups and their strict transforms).

**Checks.**
- `isModification_blowup_origin`: the blow-up of `𝔸²_k` at the origin (StableReduction Layer 4) is
  a modification with centre the origin.
- `isModification_id`, `isModification_cusp_normalization` (`𝔸¹ → V(y² − x³)` is a finite
  modification), `not_isModification_frobenius` (Frobenius of `𝔸¹_{𝔽_p}` is proper and not
  birational), `not_isModification_openImmersion` (`𝔾_m → 𝔸¹` is birational and not proper),
  `isModification_isAlteration`.
- `strictTransform_line`: for the blow-up of `𝔸²` at the origin and `X` a line through the origin,
  the strict transform is the line's proper transform meeting the exceptional divisor in one
  point.
- `strictTransform_centre_empty`: for the blow-up along `C` and `X` disjoint from `C`, the strict
  transform is `X ×_S S' = X`.
- `strictTransform_witness_matters`: the identity of `𝔸¹` with `X = Spec k → 𝔸¹` the origin: the
  strict transform is `X` for the witness `U = 𝔸¹` and `∅` for `U = 𝔾_m`.
- `strictTransform_unique_needs_scheme_structure`: `X = Spec k[ε]/(ε²) → 𝔸¹` at the origin, `φ = 𝟙`,
  `U = 𝔸¹`: both `X` and `X_red` are flat over `S'` with the same support over `U`, and only `X`
  agrees scheme-theoretically; the strict transform is `X`.
- `strictTransformModule_torsion`: for `M = k[t]/(t)` on `𝔸¹` and the identity modification with
  witness `𝔾_m`, the strict transform of `M` is `0` (it is `t`-power torsion).

### 4.12 Generic flatness, flattening, domination and Chow's lemma

Prove `generic_flatness`: for `f : X → S` of finite type with `S` integral, there is a dense open
`U ⊆ S` over which `f` is flat, and for `F` finite type quasi-coherent, over which `F` is flat
(Stacks, Proposition 29.28.1 (052A), Lemmas 051R, 051S). Prove `flattening_by_blowup`
(Raynaud–Gruson): for `f : X → S` proper with `S` Noetherian integral and `U ⊆ S` dense open over
which `f` is flat, there is a `U`-admissible blow-up `S' → S` (StableReduction Layer 4) such that the
strict transform of `X` (§4.11, with witness `U`) is flat over `S'`; and the module version for
finite-type quasi-coherent `F` (Stacks, Theorem 38.30.7 (0815), Lemma 38.31.1 (081R), Definition
31.35.1 (080K), Lemma 31.35.2 (080L)). Prove `modification_domination`: every modification of a
Noetherian integral scheme is dominated by a `U`-admissible blow-up, and two modifications are
dominated by a common one (Stacks, Lemmas 38.31.3 (081S), 38.31.4 (081T), 38.11.5 (081M), 31.33.14
(080B)). Prove `chow_lemma`: for `X → S` separated of finite type with `S` Noetherian, there is a
projective modification `X' → X` such that `X' → S` is quasi-projective (an immersion into `ℙ^n_S`),
and for `X` proper over `S`, `X'` projective over `S` (Stacks, Lemma 30.18.1 (0200), Remark 30.18.2
(0201), Lemma 32.12.1 (0202)). *Needs:* §0.9, §4.11; StableReduction Layers 2, 4.

**Checks.**
- `generic_flatness_test_blowup`: the blow-up of `𝔸²` at the origin is flat over `𝔸² ∖ {0}`.
- `flattening_test_blowup_plane`: for `X = Bl_0 𝔸² → 𝔸²`, the flattening blow-up is the blow-up at
  the origin and the strict transform is an isomorphism.
- `chow_test_proper_nonprojective`: Hironaka's proper non-projective threefold admits a projective
  modification that is projective over `k`.

### 4.13 Regular schemes, resolution of curves, Serre's criterion, Bertini

Define `IsRegular X`: `X` is locally Noetherian and every stalk is a regular local ring (Mathlib's
`IsRegularLocalRing`) (de Jong 1996, 2.4, 2.10, pp. 55–56). API: `isRegular_spec_iff` (Mathlib's
`IsRegularRing`), `IsRegular.of_isOpenImmersion`, `IsRegular.of_smooth` (smooth over a regular base),
`IsRegular.isNormal`, `regularLocus X`, `regularLocus_eq_smoothLocus` (over a perfect field),
`IsRegular.of_etale`, `IsRegular.isCohenMacaulay` (§0.18); the stalk statements for smooth schemes
and for blow-ups of nodes are Tau Ceti's `isRegularRing_iff_isRegularLocalRing_stalk_Spec`,
`isRegularLocalRing_stalk_of_smooth` and `NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`, cited.
Prove `resolution_of_curves`: for `Y` integral Noetherian of dimension `≤ 1` whose normalisation is
finite (Nagata, §0.20), the normalisation `Y^ν → Y` is a regular scheme and a finite modification
(Stacks, Lemmas 33.41.1 (0C45), 33.27.1 (0BXR), 29.55.11 (035S), 54.15.1 (0BI4), 33.43.8 (0B8Y),
Definition 54.14.1 (0BGK)). Prove `serre_normality_criterion`: a Noetherian ring is normal iff it
satisfies `(R_1)` and `(S_2)` (§0.17; the `(R_1)` half `serre_normality_R1` and the `(S_2)` half
`serre_normality_S2`) (Stacks, Lemma 10.157.4 (031S)). Prove `bertini_smoothness`: for `X ⊆ ℙ^n_k`
smooth over an infinite field `k`, a general hyperplane section `X ∩ H` is smooth, and the same for
a general member of a base-point-free linear system (Stacks, Section 33.47 (0FD4), Lemmas 33.47.1
(0FD5), 33.47.3 (0FD6)). *Needs:* §0.17, §0.20, §0.21, §4.11; Mathlib `IsRegularLocalRing`,
`IsRegularRing`, `Scheme.Hom.normalization`, `smoothLocus`; Tau Ceti `NodeAlgebra`.

**Checks.**
- `isRegular_affineSpace`, `isRegular_specInt`, `isRegular_empty`.
- `not_isRegular_node` (`k[x, y]/(xy)` at the origin), `not_isRegular_dualNumbers`.
- `resolution_test_cusp`: the normalisation of the cusp is `𝔸¹`, regular.
- `serre_test_cone`: `k[x, y, z]/(xy − z²)` is normal: `(R_1)` and `(S_2)` hold; `k[x, y]/(x², xy)`
  fails `(S_1)`.
- `bertini_test_quadric`: a general hyperplane section of a smooth quadric surface is a smooth
  conic.

### 4.14 Hilbert and Quot schemes

Prove `hilbert_quot_schemes`: for `X → S` projective with a relatively very ample `L`
(StableReduction Layer 2) and `E` coherent on `X`, the Quot functor `Quot^{Φ, L}_{E/X/S}` of
quotients with Hilbert polynomial `Φ` is representable by a projective `S`-scheme, hence
`Hilb^{Φ, L}_{X/S}`, and `Hom_S(X, Y)` and `Isom_S(X, Y)` for projective `X`, `Y` flat over `S` are
open subschemes of a Hilbert scheme of `X ×_S Y`, with the universal families and base-change
compatibility (Nitsure 2005, §2 Theorem 2.3 (p. 11), §3 Theorems 3.3–3.7 (pp. 15–17), §4 Theorem 4.3
(p. 19), §5 Theorems 5.1–5.3 (p. 24)). The relative Grassmannian used in the construction is
ModularCurves 0G's. *Needs:* §2.6, §4.12; StableReduction Layer 2; ModularCurves 0G; JacobianChallenge
Layer C.

**Checks.**
- `quot_test_grassmannian`: for `X = S` and `E = O^n`, `Quot` with constant polynomial `r` is the
  Grassmannian `Gr(r, n)`.
- `hilb_test_points`: `Hilb^1_{X/k}` is `X`.
- `hilb_test_projective_line_degree_two`: `Hilb^2_{ℙ¹/k} = ℙ²` (`Sym²`).

### 4.15 The moduli stack of stable pointed curves

Let `g, n ≥ 0` with `2g − 2 + n > 0`. Define `StableCurves.Mbar g n : StackInGroupoids` (§1.18): the
objects over `S` are StableReduction Layer 3's stable `n`-pointed families of genus `g`
(prestable families `C → S` with `n` disjoint sections in the smooth locus, `ω_{C/S}(Σ σ_i)`
relatively ample, `R¹ f_* O_C` locally free of rank `g`), morphisms the isomorphisms of pointed
families (de Jong 1996, 2.24, p. 62). API: `Mbar.isStack` (fppf descent of stable families, from
StableReduction Layer 2's polarised descent), `Mbar.smooth` (the open substack `M_{g,n}` of smooth
families), `Mbar.pullback`, `Mbar.aut_finite` (automorphism groups of stable curves over fields are
finite), `Mbar.forget` (for `2g − 2 + n − 1 > 0`, the morphism `M̄_{g,n+1} → M̄_{g,n}` forgetting the
last point and stabilising, StableReduction Layer 9's). Prove `isom_stable_curves`: for stable
pointed families `C, C'` over `S`, `Isom_S(C, C')` is a finite unramified `S`-scheme (Deligne–Mumford
1969, §1, Theorem (1.11), pp. 84–85). Prove `Mbar_algebraic_proper_DM`: `M̄_{g,n}` is a proper
Deligne–Mumford stack over `Spec ℤ` (§1.19–§1.20), with `M_{g,n}` open dense (Deligne–Mumford 1969,
§5, Proposition (5.1), Theorem (5.2), pp. 104–105; §1, pp. 76–78). Prove `Mbar_smooth`: `M̄_{g,n} →
Spec ℤ` is smooth of relative dimension `3g − 3 + n`, the boundary is a normal crossings divisor,
and the versal deformation of a stable curve is the node-smoothing family of §4.6 (Deligne–Mumford
1969, Proposition (1.5), p. 81, Theorem (1.6), Corollaries (1.7)–(1.9), p. 83, Theorem (5.2), p.
104). Prove `level_structure_cover`: for `m ≥ 3` the stack of stable curves with a level-`m`
structure (a symplectic basis of the `m`-torsion of the Jacobian of the generic fibre, extended
over the boundary as in Deligne's construction) is a scheme, projective over `ℤ[1/m]`, finite over
`M̄_{g,n}[1/m]`; hence `M̄_{g,n}` admits a finite surjective morphism from a projective scheme
(Deligne 1985, §3, 3.1–3.7, pp. 137–141: Proposition 3.5, Lemma 3.5.7, Corollary 3.6, 3.7). Prove
`stable_extension_after_alteration`: for `Y` integral Noetherian, `U ⊆ Y` dense open and a stable
pointed family over `U`, there is an alteration `ψ : Y' → Y` (§4.16) and a stable pointed family
over `Y'` restricting to the pullback of the given one over `ψ⁻¹(U)` (de Jong 1996, 4.17, pp.
71–72; 5.13, pp. 80–81; Deligne 1985, Lemme 1.6). *Needs:* §1.18–§1.20, §4.6, §4.16; StableReduction
Layers 2–3, 9; Mathlib `IsStack`, `Functor.IsFibered`.

**Checks.**
- `Mbar_zero_three`: every stable `3`-pointed genus-`0` curve over `S` is `ℙ¹_S` with `0, 1, ∞`;
  `M̄_{0,3} = Spec ℤ`.
- `Mbar_one_one_aut`: for an elliptic curve `(E, O)` over an algebraically closed field of
  characteristic not `2, 3`, `Aut` has order `2`, `4` or `6`.
- `not_stable_zero_two`: `(g, n) = (0, 2)` is excluded: `(ℙ¹, 0, ∞)` has infinite automorphism group
  `𝔾_m`.
- `not_stable_rational_tail`: a nodal curve with a rational component meeting the rest in one point
  and carrying no marking is prestable and not stable.
- `Mbar_smooth_open`: `M_{g,n} ⊆ M̄_{g,n}` is open and dense.

### 4.16 Alterations

Define `IsAlteration f` for `f : S' → S`: `f` is proper, dominant, and finite over some nonempty
open `U ⊆ S` (Stacks, Definition 29.52.12 (0AB0)); the theorems below assume `S` Noetherian
**integral** and `S'` integral, and the composition and domination statements are stated in that
integral setting. API: `functionFieldMap` (`K(S) → K(S')`), `genericDegree` (`[K(S') : K(S)]`),
`IsGenericallyEtale` (the function-field extension is separable), `IsAlteration.comp` (for `S'' → S'
→ S` alterations of **integral** schemes, the composite is an alteration; the finite-open witnesses must meet the generic point),
`genericDegree_comp` (multiplicative),
`isModification_iff` (an alteration is a modification iff its generic degree is `1`),
`IsAlteration.exists_of_surjective` (a proper surjection onto an integral Noetherian scheme
contains an alteration from an integral closed subscheme of the source; Stacks, Lemma 72.8.5
(0DMN)), `IsAlteration.exists_dominating` (de Jong 5.4: for finitely many alterations `g_i : T_i →
S` of an **integral** Noetherian `S` with `T_i` integral, there is an integral `T'` with an
alteration `h : T' → S` and morphisms `a_i : T' → T_i` in `Over S`, that is `a_i ≫ g_i = h`; for
`S = Spec k ⊔ Spec k` and `g_1, g_2` the two points, no integral `T'` dominates both),
`IsAlteration.baseChange_component` (the base change along a dominant map of integral schemes
contains a dominating component that is an alteration). *Needs:* §0.9, §0.21, §4.11, §4.12;
Mathlib `IsProper`, `IsDominant`, `IsFinite`, `Scheme.functionField`, `Module.finrank`,
`Algebra.IsSeparable`, `IsIntegral`.

**Checks.**
- `isAlteration_frobenius`: Frobenius of `𝔸¹_{𝔽_p}` is an alteration of generic degree `p` and not
  a modification.
- `isAlteration_gaussianIntegers`: `Spec ℤ[i] → Spec ℤ` is a finite alteration of degree `2`,
  generically étale.
- `isAlteration_id`; `not_isAlteration_projectiveLine` (`ℙ¹_k → Spec k` is not generically
  finite); `isModification_isAlteration`.
- `test_comp_needs_integral`: for `S = Spec k ⊔ Spec k` and `S' = Spec k` mapping to the first
  point, `S' → S` is proper and finite but not dominant, so the predicate rejects it.
- `test_exists_dominating_needs_integral`: for `S = Spec k ⊔ Spec k` and the two inclusions, no
  integral scheme dominates both.

### 4.17 Strict normal crossings divisors

Define `SNCData X`: a finite family of ideal sheaves `D_i` (the components, reduced), with
`stratum J := ⨆_{j ∈ J} D_j` (the partial intersection `D_J`) and `divisor := ∏ D_i`; `IsTransverse`:
every nonempty `D_J` is regular (§4.13) of codimension `|J|` in `X` at every point. Define
`IsStrictNormalCrossings D` for `D : X.IdealSheafData` on a Noetherian `X`: `D` is the divisor of some
transverse `SNCData` and `X` is regular at every point of `D` (de Jong 1996, 2.3–2.4, p. 55; 3.1, p.
62); `IsNormalCrossings D`: strict normal crossings after a surjective étale base change. API:
`IsStrictNormalCrossings.isNormalCrossings`, `.pullback_smooth`, `.component` (each component is a
regular effective Cartier divisor), `.local_equation` (at a point of `D` the ideal is generated by a
product of part of a regular system of parameters), `.of_subset` (a sub-family of components is
SNC), `.isEffectiveCartier` (Tau Ceti's `CartierDivisor`). Prove `nc_to_snc`: a normal crossings
divisor on a regular scheme becomes strict normal crossings after a finite sequence of blow-ups in
strata (de Jong 1996, 2.4, p. 55; 7.2, p. 87; 4.28, p. 76). *Needs:* §4.13; Mathlib `IdealSheafData`,
`Etale`, `ringKrullDim`; Tau Ceti `CartierDivisor`; StableReduction Layer 2, 4.

**Checks.**
- `snc_axes`: `V(xy) ⊆ 𝔸²_k` is SNC with two components.
- `snc_empty`: the empty divisor is SNC.
- `nodalCubic_nc_not_snc`: for `char k ≠ 2`, `V(y² − x²(x + 1)) ⊆ 𝔸²_k` is normal crossings (étale
  locally `xy = 0` at the node) and not strict normal crossings (one irreducible component through
  the node, not regular there).
- `not_nc_threeLines`: `V(xy(x − y)) ⊆ 𝔸²` is not normal crossings (three components through a
  point of a surface).

### 4.18 Split prestable curves, nodal families, fibrations and the curve-family alteration

In de Jong's terminology a semistable curve over `S` is StableReduction Layer 3's prestable family
`f : X → S` (flat, proper, finitely presented, geometric fibres connected curves with at most
ordinary double points). Define `DeJong.IsSplitPrestable f`: a prestable family such that every
irreducible component of every fibre is smooth and geometrically irreducible over the
residue field, every node in each fibre is rational over that residue field, and both
branches at every node are defined over it (de Jong 1996, 2.21–2.22, p. 61). API: `pullback`,
`singularPoints_rational`, `of_smooth`, `of_sections`, `split_after_finite_extension` (for prestable curves whose geometric irreducible components
are smooth, a finite separable extension splits the components and nodes). Prove `node_local_structure`:
for a nodal family `f : X → S` over a Noetherian base and a rational split node `x` of the fibre over `s`, the
complete local ring `O^∧_{X,x}` is `O^∧_{S,s}[[u, v]]/(uv − a)` for some `a ∈ m_s`, and étale-locally
`X` is `Spec O_S[u, v]/(uv − a)` (de Jong 1996, 2.23, pp. 61–62; 3.3, p. 63); over a discrete
valuation ring this is StableReduction Layer 1's local normal form with `a = π^n`, and the two
agree (`node_local_structure_dvr`). Prove `nodal_family_resolution`: for a nodal family over a regular
base with normal crossings discriminant and `X` normal, the singularities of `X` are resolved by
blow-ups in nodes (Tau Ceti's `NodeAlgebra.isRegularLocalRing_stalk_blowup_iff` is the local
computation), giving a regular `X'` with `X' → S` nodal (de Jong 1996, §3: 3.1, p. 62, Lemma 3.2, p.
62, 3.3–3.5, pp. 63–64, Proposition 3.6 and proof, pp. 64–65). Prove `generic_projection`: for `X ⊆
ℙ^N_k` projective of dimension `d` over an infinite field, a general linear projection `X → ℙ^{d}`
is finite, and a general projection to `ℙ^{d−1}` from a general point has one-dimensional fibres
(de Jong 1996, 2.11, pp. 56–57). Prove `curve_fibration`: for `X` projective integral of dimension
`d ≥ 1` over `k` and `Z ⊆ X` a proper closed subset, after a modification there is a morphism
`X' → Y` to a projective integral `Y` of dimension `d − 1` whose generic fibre is a geometrically
integral curve, with `Z'` finite over `Y` and `X'` smooth over an open of `Y` (de Jong 1996, Lemma
4.11, pp. 67–68; 4.12, pp. 68–69). Prove `three_point_divisor`: after a further modification and
alteration of `Y`, there is a divisor `H ⊆ X'`, finite étale over an open of `Y`, meeting every
irreducible component of every fibre in at least three smooth points (de Jong 1996, Lemma 4.13,
pp. 69–70). Prove `stable_model_domination`: given the stable pointed model of the generic fibre
extended over an alteration of `Y` (§4.15), the stable family dominates the strict transform of
the original family after a modification, with the dominating map an isomorphism over an open (de
Jong 1996, 4.18–4.21, pp. 72–74). Prove `curve_family_alteration` (de Jong 5.8): for a projective
family of curves `X → Y` over an integral Noetherian base with smooth geometrically integral
generic fibre and a closed `Z ⊆ X`, there is an alteration `Y' → Y` and a split prestable family
`X' → Y'` with an alteration `X' → X` over `Y' → Y`, such that `X'` is regular over the generic
point and the preimage of `Z` plus the sections is a union of sections (de Jong 1996, §5: 5.1–5.7,
pp. 76–79; Theorem 5.8, p. 79; proof 5.9–5.17, pp. 79–82). *Needs:* §4.11, §4.13, §4.15, §4.16,
§4.17; StableReduction Layers 1, 3, 4; Tau Ceti `NodeAlgebra`; Mathlib `Flat`, `IsProper`.

**Checks.**
- `split_twoLines`: `V(xy) ⊆ ℙ²_k` (two lines meeting at a rational point) is split prestable over
  `k`.
- `not_split_nodalCubic`: the nodal cubic over `k` with its node's branches defined over a
  quadratic extension is prestable and not split.
- `split_after_extension`: `V(x² − a y²) ⊆ ℙ²_k`, `a` not a square, is not split over `k` and is
  split over `k(√a)`.
- `split_smooth`: a smooth family with geometrically irreducible fibres is split.
- `node_local_structure_test_dvr`: `Spec ℤ_p[x, y]/(xy − p^n)` has complete local ring
  `ℤ_p[[u, v]]/(uv − p^n)` at the node, StableReduction Layer 1's form.

### 4.19 de Jong's alteration theorem over a field

Prove `alteration_theorem`: for `X` integral separated of finite type over a field `k` and `Z ⊊ X`
a proper closed subset, there is an alteration `φ : X_1 → X` from an integral `X_1`, an open
immersion `j : X_1 → X̄_1` into a regular scheme `X̄_1` **projective** over `k` (StableReduction Layer
2's projective morphisms; properness is the consequence recorded in `Suggested.lean`), such that
the complement of `j` together with `j(φ⁻¹(Z))` is the support of a strict normal crossings divisor
(§4.17); when `k` is perfect the alteration can be chosen generically étale (de Jong 1996, Theorem
4.1 and Remark 4.2, p. 66; proof 4.3–4.28, pp. 66–76). *Needs:* §4.12–§4.18; StableReduction Layer 2.

**Checks.**
- `alteration_test_curve`: for a curve the theorem is resolution by normalisation (§4.13) with
  `φ` a modification.
- `alteration_test_cone`: the quadric cone in `𝔸³` with `Z` the vertex: the blow-up at the vertex is
  a resolution with SNC exceptional divisor.
- `alteration_test_inseparable`: over an imperfect field the alteration need not be generically
  étale (`y² = x^p − t` admits no generically étale alteration to a smooth curve with the same
  function field).

### 4.20 Traits, `S`-varieties, strict semistability and the semistable alteration theorem

Define `IsTrait R`: `R` is a complete discrete valuation ring (de Jong 1996, 2.12, p. 57); a
morphism of traits is a local homomorphism `R → R'` of complete discrete valuation rings sending a
uniformiser to a nonzero element, with `TraitHom.ramificationIndex` (the valuation of `π`). A
finite extension of traits means a finite injective local homomorphism `R → R'` of complete DVRs
(de Jong 1996, 2.12, p. 57). No separability of `Frac(R')/Frac(R)` is required. In the separable
case use Tau Ceti's `FiniteDVRExtension R K` (StableReduction Layer 0), and prove that its local
ring is already complete and finite over the complete base; completion is unnecessary here.
The general alteration theorem quantifies directly over `R'`, its algebra structure, finiteness,
locality and injectivity, so it also includes inseparable extensions. Define `IsSVariety f`
for `f : X → Spec R`: `X` integral, `f` separated, flat and of finite type (de Jong 1996, 2.15, p.
59), with `isSVariety_iff_genericFiber_nonempty` and `IsSVariety.toModel` (a proper `S`-variety
with an identification of its generic fibre is Tau Ceti's `Model`). Prove
`IsSVariety.baseChange_component`: for `R → R'` any finite extension of traits
(`R'` dominates `R` and the base change is **horizontal**: `Spec R' → Spec R` is dominant), every reduced
irreducible component of `X ×_R R'` dominates `X` and is an `S'`-variety mapping to `X` by an
alteration, with the structure morphism over `Spec R' → Spec R` (de Jong 1996, 6.8, p. 83).
The Lean `IsSVariety.baseChange_component` takes any reduced irreducible component, including
after inseparable extensions; a separate example retains the `FiniteDVRExtension` case. The
vertical specialisation `ℤ_p → 𝔽_p` is not a morphism of traits and is excluded. Define
`SemistableConditions K f` (de Jong 2.16 (a)–(d) without integrality): the generic fibre is smooth
over `K`, the special fibre is the divisor of a transverse `SNCData` all of whose strata are
smooth over the residue field of the expected codimension; `IsStrictlySemistable K f := IsSVariety f
∧ SemistableConditions K f` (de Jong 1996, 2.16, pp. 59–60; 2.8, p. 55). API:
`IsStrictlySemistable.isRegular`, `.snc_specialFiber` (with perfect residue field, strict
semistability of an `S`-variety with smooth generic fibre is: the special fibre is SNC),
`.smooth_over_model` (Zariski-locally `X` is smooth over `R[t_1..t_r]/(t_1 ⋯ t_r − π)`),
`.local_form` (complete local rings `B[[t_1..t_r]]/(t_1 ⋯ t_r − π)` with `B` formally smooth over
`R`), `.baseChange_etale` (stability under finite unramified extensions of traits). Define
`IsStrictSemistablePair K f H` for an `SNCData` `H` (the horizontal part): `X` strictly semistable,
`X_s ∪ H` strict normal crossings, and every horizontal stratum satisfies the semistable
conditions over `S` (de Jong 1996, 6.2–6.4, pp. 82–83), with `.of_strictlySemistable` (`H = ∅`),
`.horizontal` (horizontal components are flat over `S`), `.restrict` (to opens), `.local_form`
(complete local rings `C[[t, s]]/(π − t_1 ⋯ t_n)`). Prove `faltings_formal_smoothness` in its local form: let `R` be an excellent DVR,
`X` normal and integral, flat of finite type over `Spec R`, and `ξ` a generic point of the special
fibre. A finite extension of fraction fields, with an extending DVR `R'`, makes the normalization
of the reduction of `O_{X,ξ} ⊗_R R'` formally smooth over `R'`: each localization at a maximal
ideal has ramification index one and separable residue extension. This persists under further
extensions with finite fraction-field degree (A. J. de Jong, *Smoothness, semi-stability and
alterations*, Lemma 2.13, p. 57, proof pp. 57–59, credited to Faltings). Smoothness of the generic
fibre and completeness of `R` are not hypotheses of this lemma. Over a trait, apply it at the
finitely many generic points of the special fibre after normalization and take a common extension;
this gives the reduced-special-fibre consequence used in 6.11, p. 84. Reduction before normalization
is essential when base change is inseparable. This is de Jong's lemma, rather than a theorem of
Faltings–Chai about degenerating abelian varieties.

Prove `semistable_alteration_theorem`: let `S = Spec R` be a trait, `f : X → S` an `S`-variety,
and `Z ⊊ X` a closed subset containing `X_s`. There are a finite extension of traits `S_1 → S`,
an `S_1`-variety `X_1`, an alteration `φ : X_1 → X` over `S`, and an open immersion of
`S_1`-varieties `j : X_1 → X̄_1`, where `X̄_1` is projective over `S_1` with geometrically
irreducible generic fibre. The reduced boundary with support
`B = (X̄_1 ∖ j(X_1)) ∪ j(φ⁻¹(Z))` makes `(X̄_1, B)` a strict semistable pair. In the horizontal
`SNCData H` convention, require the exact equality
`support(X̄_{1,s_1}) ∪ support(H) = (X̄_1 ∖ j(X_1)) ∪ j(φ⁻¹(Z))`.
With `g : X̄_1 → S_1` and `f_1 : X_1 → S_1`, both `j ≫ g = f_1` and
`f_1 ≫ (S_1 → S) = φ ≫ f` must hold (A. J. de Jong 1996, Theorem 6.5 and Diagram 6.6,
p. 83; strict pairs: 6.2–6.4, pp. 82–83). The Lean signature records these boundary and base
conditions, including geometric irreducibility, with the weaker properness conclusion;
projectivity remains a README target using StableReduction Layer 2's projective morphisms,
whose predicate is not present at the pins. *Needs:* §0.21,
§4.11, §4.13, §4.15–§4.19; Tau Ceti `FiniteDVRExtension`, `genericFiber`, `specialFiberι`, `Model`;
StableReduction Layers 0, 2–3; Mathlib `IsDiscreteValuationRing`, `IsAdicComplete`, `Smooth`.

**Checks.**
- `finite_trait_inseparable`: over a perfect field `k` of characteristic `p > 0`,
  `k[[t]] → k[[u]]`, `t ↦ u^p`, is finite free of rank `p` and local, with a purely inseparable
  fraction-field extension. It is allowed by Theorem 6.5 and cannot be a `FiniteDVRExtension`.
- `faltings_inseparable`: with the same rings, `X = Spec k[[u]]` is normal and finite flat
  over `Spec k[[t]]`, although its generic fibre is not smooth. After `t ↦ v^p`, the base-change
  ring is `k[[v]][u]/((u − v)^p)`; its reduction and normalization are `k[[v]]`, formally smooth
  over the new base. This tests both the absence of a generic-smoothness hypothesis in Lemma 2.13
  and the need to reduce before normalizing.
- `semistable_boundary_special_fibre`: for `X = Spec R`, take `Z = X_s`; the identity alteration
  and compactification have `H = ∅` and boundary exactly `X_s`. If `X_s` is nonempty, `Z = ∅`
  fails the input condition; adding a horizontal divisor requires its inverse image in the boundary.
- `isTrait_padicInt`: `ℤ_p` is a trait with uniformiser `p`.
- `not_isTrait_localization`: `ℤ_{(p)}` is a DVR and not a trait (not complete).
- `ramification_sqrt`: `ℤ_p → ℤ_p[x]/(x² − p)` is a `FiniteDVRExtension` of ramification index `2`.
- `isSVariety_genericOnly`: `Spec ℚ_p` is a `ℤ_p`-variety with empty special fibre.
- `not_isSVariety_specialPoint`: `Spec 𝔽_p → Spec ℤ_p` is not flat, hence not an `S`-variety.
- `baseChange_component_test_vertical_excluded`: `ℤ_p → 𝔽_p` is not a `FiniteDVRExtension`, so
  `baseChange_component` does not apply to it; for `ℤ_p → ℤ_p[√p]` the base change of a smooth
  `S`-variety is a component dominating it.
- `strictlySemistable_xy` (`Spec ℤ_p[x, y]/(xy − p)`), `strictlySemistable_smooth` (`𝔸¹_{ℤ_p}`),
  `not_strictlySemistable_xy_sq` (`xy − p²` is not regular at the node),
  `not_strictlySemistable_ramified` (`x² − p`: the special fibre is nonreduced),
  `strictlySemistable_ramified_basechange` (`xy − p` becomes `xy − ϖ²` over `ℤ_p[ϖ]`, `ϖ² = p`,
  and is no longer strictly semistable until blown up).
- `pair_specialFiber` (`(X, X_s)` with `H = ∅`), `pair_with_horizontal` (`X = Spec ℤ_p[x, y,
  z]/(xy − p)` with `H = V(z)`), `not_pair_diagonal` (`H = V(x − y)` on `xy − p` is not transverse to
  the special fibre).

### Examples

`uv = t` (the node and its smoothing), `Spf ℤ_p` and `Spf k[[t]]` against their spectra, the
completion of `𝔸¹` at the origin, the blow-up of `𝔸²` at the origin as the standing modification,
`xy − p`, `xy − p²` and `x² − p` over `ℤ_p` as the three semistability tests, `M̄_{0,3} = Spec ℤ`.

### Dependencies

Layer 0: §0.9 (limits), §0.17–§0.21 (Serre conditions, Nagata, excellence), §0.23 (universal
homeomorphisms). Layer 1: §1.18–§1.20 (stacks). Layer 2: §2.3 (torsors), §2.6 (quasi-coherent
cohomology). Layer 3: §3.6 (Picard schemes of curves, for level structures). Mathlib and Tau Ceti
as listed; StableReduction Layers 0–4, 9; JacobianChallenge Layers C, E; ModularCurves 0G, 7D.

## Layer 5: intersection theory and Riemann–Roch

Intersection theory in the generality of Fulton's *Intersection Theory*, restricted to the
operations the arithmetic consumers use: Chow groups by rational equivalence, proper pushforward,
flat pullback, the first Chern class, projective bundles, Chern classes with the splitting principle,
the normal cone and refined Gysin maps for regular immersions, the intersection product on smooth
varieties with the projection and excess formulas, a geometric `K_0`/`G_0` package with the
K-theoretic pushforward, Grothendieck–Riemann–Roch, and the surface theory (relative intersection
pairing, adjunction, Riemann–Roch, numerical equivalence, Nakai–Moishezon, Hodge index) with the
product-of-curves route to the Weil bound. Inputs: Mathlib's algebraic cycles with weighted
pushforward, Tau Ceti's Weil and Cartier divisors and line-bundle classes, Layer 3's degrees and
Riemann–Roch on curves, Layer 2's coherent duality on surfaces, Layer 0's relative Proj, Layer 4's
blow-ups and deformation theory, and StableReduction Layer 4's intersection numbers on arithmetic
surfaces, which the relative pairing specialises to.

**Conventions of this layer.** Schemes are algebraic over a field `k` (separated, of finite type);
`Z_k(X)` is Mathlib's `AlgebraicCycle X ℤ` graded by dimension; `CH_k(X)` is its quotient by rational
equivalence; on a smooth variety of pure dimension `n`, `CH^p(X) := CH_{n−p}(X)` and `A(X) = ⊕
CH^p(X)`, and the two gradings are never mixed on a singular scheme. Rational coefficients are the
separate carrier `CH_k(X)_ℚ := CH_k(X) ⊗ ℚ`, named on every target that uses them; nothing proved
with `ℚ`-coefficients is exported integrally. Degrees of zero-cycles are taken on proper schemes
only. `ℙ(E) := relativeProj (Sym E^∨)` (§0.3 on AlgebraicVectorBundles L2A's graded symmetric
algebra) with `O(1)` the tautological quotient of `p^* E^∨`: `ℙ(E)` parametrises lines in `E`, the
convention of Fulton 1998, Appendix B.5; the Grothendieck convention `ℙ(E) = Proj Sym E`
parametrising rank-one quotients of `E` is ModularCurves 0G's for its Grassmannians, and the two are
related by `E ↔ E^∨`, recorded in `projectiveBundle_dual_convention`.

### 5.1 Rational equivalence, Chow groups and the divisor class comparison

The carrier `cyclesOfDimension X k` is the subgroup of `AlgebraicCycle X ℤ` supported in
dimension `k`. `RatEquiv X k` is a subgroup of this carrier, and `ChowGroup X k` is its quotient.
**Checks:** `cycles_zero` includes zero; `cycles_negative` computes degree `−1` as the zero
subgroup; `cycles_support_agreement` identifies membership with the support condition in Mathlib's
cycle carrier. The rational graded group uses a direct sum over degrees. Flat pullback requires
that every irreducible component of every fibre has dimension `d`; external products in this
section are over a field. This is the fibre condition of Tau Ceti's `PureRelativeDimension`.

Define `Chow.RatEquiv X k ≤ Z_k(X)`: the subgroup generated by the divisors `div r := Σ_V ord_V(r)
[V]` of nonzero rational functions `r` on `(k+1)`-dimensional integral closed subschemes `W ⊆ X`,
with `ord_V` Mathlib's `Scheme.ord` along the codimension-one points of `W`; `CH_k(X) := Z_k(X) /
RatEquiv X k` (Fulton 1998, §1.3; Stacks, Section 42.19 (02RV)). API: `Chow.div`, `div_mul` (`div
(rs) = div r + div s`), `Chow.cycleClass` (the class of a cycle), `equiv_iff_pone` (`α ∼ 0` iff `α =
Σ p_*([V_i(0)] − [V_i(∞)])` for subvarieties `V_i ⊆ X × ℙ¹` dominating `ℙ¹`; Fulton, Proposition
1.6), `CH_top_free` (`CH_n(X)` is free on the `n`-dimensional irreducible components, `n = dim X`),
`CH_of_isIso`, `CH_coprod` (additivity in disjoint unions), `CH_rat` (the `ℚ`-carrier with `CH_k(X)
→ CH_k(X)_ℚ`). Hypotheses: `X` separated of finite type over `k`; no smoothness. Prove
`chow_divisorClass_comparison`: for `X` integral of dimension `n`, Tau Ceti's divisor class group
(`SchemeWeilDivisor` modulo principal divisors) is `CH_{n−1}(X)` through
`SchemeWeilDivisor.toAlgebraicCycle`, and composed with `classGroupToLineBundleClass` it is the
first Chern class `Pic(X) → CH^1(X)` of §5.3, an isomorphism for `X` locally factorial (Fulton 1998,
§2.1; Stacks, Section 42.24 (02SI)). *Needs:* §3.4; Mathlib `AlgebraicCycle`, `Scheme.ord`; Tau Ceti
`SchemeWeilDivisor`, `classGroupToLineBundleClass`.

**Checks.**
- `test_pone_points`: two `k`-points of `ℙ¹` are rationally equivalent and `CH_0(ℙ¹) ≅ ℤ` by degree.
- `test_elliptic_points`: on an elliptic curve over `k̄`, `[P] − [Q] ∼ 0` iff `P = Q`.
- `test_affine_line`: `CH_0(𝔸¹) = 0`.
- `test_divisorClass_curve`: on a regular curve `CH_0 = Cl`, Tau Ceti's `classGroupAddEquivLineBundleClass`
  composed with the comparison.
- `test_top_free`: `CH_2(𝔸²) = ℤ`, `CH_1(𝔸²) = 0`.

### 5.2 Proper pushforward, flat pullback and the localisation sequence

Construct `Chow.properPushforward`: for `f : X → Y` proper, Mathlib's `AlgebraicCycle.map` with
residue-degree weights (`f_*[V] = [K(V) : K(f(V))][f(V)]` when `dim f(V) = dim V`, `0` otherwise)
preserves rational equivalence and gives `f_* : CH_k(X) → CH_k(Y)` with `(g f)_* = g_* f_*`; for
`X` proper over `k`, `deg : CH_0(X) → ℤ` is well defined and `deg f_* = deg` (Fulton 1998, Theorem
1.4; Stacks, Sections 42.12, 42.20, 42.41 (02R3, 02S0, 0AZ0)); without properness pushforward fails
(`𝔸¹ → Spec k`: the point class is `∼ 0` on `𝔸¹` and has degree `1`). Construct
`Chow.flatPullback`: for
`f : X → Y` flat with all fibres of pure dimension `n` (relative dimension `n`), `f^*[V] :=
[f⁻¹(V)]` (with the multiplicities of the components, the lengths at generic points) gives `f^* :
CH_k(Y) → CH_{k+n}(X)` with `(g f)^* = f^* g^*`; and the **base-change square**: for a cartesian
square

```text
X' --g'--> X
|f'        |f
Y' --g---> Y
```

with `f : X → Y` flat of relative dimension `n` and `g : Y' → Y` proper, the induced `f' : X' → Y'`
is flat of relative dimension `n`, `g' : X' → X` is proper, and `f^* g_* = g'_* f'^* : CH_k(Y') →
CH_{k+n}(X)` (Fulton 1998, Theorem 1.7 and Proposition 1.7; Stacks, Sections 42.14, 42.15, 42.20
(02RA, 02RF, 02S0)); the two pullbacks are the flat ones `f^*` on `Y` and `f'^*` on `Y'`, and the
two pushforwards are `g_*` and `g'_*`, each shifting dimension as stated
(`flatPullback_properPushforward`). Prove `localization_exact`: for `Y ⊆ X` closed with complement
`U`, `CH_k(Y) → CH_k(X) → CH_k(U) → 0` is exact (Fulton 1998, Proposition 1.8; Stacks, Section 42.19
(02RV)). Prove `chow_affine_bundle`: for a vector bundle `E → X` of rank `r` (AlgebraicVectorBundles
L2B), `p^* : CH_k(X) → CH_{k+r}(E)` is surjective, and bijective (Fulton 1998, Proposition 1.9,
Theorem 3.3 (a)). *Needs:* §5.1; Mathlib `AlgebraicCycle.map`, `IsProper`, `Flat`,
`Scheme.Hom.residueDegree`; AlgebraicVectorBundles L2B.

**Checks.**
- `test_pushforward_degree`: for `ℙ¹ → Spec k`, `f_*[P] = [κ(P) : k][pt]`.
- `test_pushforward_not_proper`: on `𝔸¹`, `[0] ∼ 0` but `deg [0] = 1`; the pushforward along
  `𝔸¹ → Spec k` is not defined on `CH_0`.
- `test_flat_pullback_product`: for `pr : X × 𝔸¹ → X`, `pr^*` is the isomorphism `CH_k(X) ≅
  CH_{k+1}(X × 𝔸¹)`.
- `test_base_change_square`: for `g : Spec k' → Spec k` finite of degree `d` and `f : 𝔸¹_k → Spec
  k`, both sides of `f^* g_* = g'_* f'^*` on `[pt]` are `d [𝔸¹_k]`.
- `test_localization_point`: `CH_0(𝔸¹) → CH_0(𝔾_m) → 0` with kernel generated by `[0] = 0`.

### 5.3 The first Chern class

Define `Chow.c1 L : CH_k(X) → CH_{k−1}(X)` for an invertible sheaf `L` on `X`: for `V ⊆ X` integral of
dimension `k`, `c_1(L) ∩ [V] := [C]` for `C` the Weil divisor of any Cartier divisor on `V`
representing `L|_V` (Tau Ceti's `CartierDivisor` and `SchemeWeilDivisor`), extended linearly; it
descends to rational equivalence (Fulton 1998, §§2.3–2.5; Stacks, Sections 42.25, 42.28 (02SN,
02TG)). Hypotheses: `X` algebraic over `k`; no smoothness. API: `inter_additive` (`c_1(L ⊗ M) =
c_1(L) + c_1(M)`), `inter_comm` (`c_1(L) ∩ c_1(M) ∩ α = c_1(M) ∩ c_1(L) ∩ α`; Fulton, Theorem 2.4),
`proper_pushforward` (the projection formula `f_*(c_1(f^* L) ∩ α) = c_1(L) ∩ f_* α`; Proposition
2.5 (c)), `flat_pullback` (`c_1(f^* L) ∩ f^* α = f^*(c_1(L) ∩ α)`; Proposition 2.5 (d)),
`eq_cartier_divisor` (`c_1(O(D)) ∩ [V] = [D ∩ V]` when `V ⊄ D`), `c1_degree_curve` (on a proper
curve, `deg(c_1(L) ∩ [C])` is §3.3's degree). *Needs:* §3.3, §5.1, §5.2; Tau Ceti
`CartierDivisor`, `LineBundleClass`, `SchemeWeilDivisor`.

**Checks.**
- `test_pone_degree`: `deg(c_1(O(m)) ∩ [ℙ¹]) = m`.
- `test_trivial_bundle`: `c_1(O_X) ∩ α = 0`.
- `test_elliptic`: `c_1(O(P − Q)) ∩ [E] ≠ 0` for `P ≠ Q` on an elliptic curve over `k̄`.
- `test_curve_degree`: on a proper curve the degree is `χ(L) − χ(O_C)`.

### 5.4 Projective bundles and Chern classes

Construct `projectiveBundle E := relativeProj (gradedSymmetricAlgebra E^∨)` for `E` locally free of
rank `e + 1` on `X` (§0.3; AlgebraicVectorBundles L2A), with `p : ℙ(E) → X`, `O(1)` and the
tautological quotient `p^* E^∨ → O(1)`. API: `structure_flat_proper` (`p` is flat and proper of
relative dimension `e` with fibres `ℙ^e_{κ(x)}`), `fibre`, `pullback` (`ℙ(f^* E) = X' ×_X ℙ(E)`),
`projectiveBundle_dual_convention` (the comparison with the quotient convention), `chow_basis`
(`CH_k(ℙ(E)) = ⊕_{i ≤ e} c_1(O(1))^i ∩ p^* CH_{k−e+i}(X)`; Fulton 1998, Theorem 3.3 (b); Stacks,
Section 42.36 (02TV)). The projective bundle is planned here because the splitting principle and
Chern classes need it; AlgebraicModuliForArithmeticGeometry imports it. Define Segre classes `s_i(E)
∩ α := p_*(c_1(O(1))^{e+i} ∩ p^* α)` and `Chow.chernClass E i`, the components of the inverse `c(E)
= 1 + c_1(E) + ⋯` of the Segre series `s(E) = 1 + s_1 + ⋯`, acting on `CH_*(X)` (Fulton 1998,
Proposition 3.1, Theorem 3.2; Stacks, Sections 42.37, 42.43 (02TZ, 02UK)). Hypotheses: `E` locally
free of constant finite rank; Chern classes of coherent sheaves are defined only on smooth
quasi-projective schemes through §5.7's `K_0`. API: `vanishing` (`c_i(E) = 0` for `i > rank`),
`commutativity`, `projection_formula`, `pullback`, `whitney_sum` (`c(E) = c(E') c(E'')` for a short
exact sequence), `splitting_principle` (there is a flat `f : X' → X` with `f^*` injective on `CH_*`
and `f^* E` carrying a filtration with invertible quotients; Fulton, §3.2), `chernCharacterOp` and
`toddClassOp` (`ch(E) = Σ e^{x_i}`, `td(E) = ∏ x_i/(1 − e^{−x_i})` as operators on `CH_*(X)_ℚ` by
the splitting principle, graded by degree, with `td_1 = c_1/2` and `td_2 = (c_1² + c_2)/12`),
`c1_eq` (agreement with §5.3 in rank one). *Needs:* §0.3, §5.2, §5.3; AlgebraicVectorBundles
L0B–L0C, L2A–L2B; StableReduction Layer 2.

**Checks.**
- `test_trivial`: `ℙ(O^{e+1}) = ℙ^e × X`; `test_point`: `CH_*(ℙ^e_k) = ℤ[h]/(h^{e+1})`;
  `test_rank_one`: `ℙ(L) ≅ X`; `test_hirzebruch`: `ℙ(O ⊕ O(1))` over `ℙ¹` has an intersection form
  different from `ℙ¹ × ℙ¹`.
- `test_line_bundle`: `c_1(E)` of §5.4 agrees with §5.3 in rank one; `test_trivial_chern`: `c(O^n)
  = 1`; `test_tangent_pn`: `c(T_{ℙ^n}) = (1 + h)^{n+1}` by the Euler sequence; `test_dual`:
  `c_i(E^∨) = (−1)^i c_i(E)`.
- `test_dual_convention`: `ℙ(E)` in Fulton's convention is `ℙ(E^∨)` in the quotient convention, and
  `O(1)` corresponds to `O(1)`.
- `test_todd_degree_one`, `test_todd_degree_two`: `td_1 = c_1/2` and `td_2 = (c_1² + c_2)/12` as
  operators.

### 5.5 Normal cones, deformation to the normal cone and refined Gysin maps

Define the normal cone `normalCone i := Spec_X (⊕ I^n/I^{n+1})` of a closed immersion `i : X → Y`
with ideal `I` (relative Spec of the Rees quotient algebra, §0.2 and Mathlib's `reesAlgebra`), the
normal bundle `normalBundle i := V(I/I²)` for `i` a regular immersion (`I` locally generated by a
regular sequence, Mathlib's `RingTheory.Sequence.IsRegular`), with `normalCone_eq_normalBundle` for
regular immersions and `normalCone_pullback` for the base change `X' = X ×_Y Y'` (`C_{X'} Y' ⊆ f^*
N_X Y`). Construct `deformationToNormalCone i`: the blow-up `M := Bl_{X × {∞}} (Y × ℙ¹)` minus the
strict transform of `Y × {∞}`, flat over `ℙ¹`, with fibre `Y` over `0` and `C_X Y` over `∞`
(StableReduction Layer 4's blow-up), and the specialisation `σ : CH_k(Y) → CH_k(C_X Y)`, `α ↦ i_∞^!
(pr^* α)`, with `specialization_pullback` (compatibility with flat pullback) (Fulton 1998, §5.1,
§5.2). Prove `homotopy_invariance`: for the total space `p : E → X` (`Chow.totalSpace`) of a finite
locally free sheaf of rank `r` (`Chow.HasRank`), `p^* : CH_k(X) → CH_{k+r}(E)` is bijective;
surjectivity by the localisation sequence and the affine case, injectivity through the projective
completion `ℙ(E ⊕ 1)` and the projective bundle theorem of §5.4, so the inverse is constructed
before any Gysin map exists; only afterwards is it identified with the Gysin map of the zero section
(Fulton 1998, Proposition 1.9, Theorem 3.3 (a), and Chapter 6 for the identification). Define the
external product `Chow.externalProduct : CH_k(X) ⊗ CH_l(Y) → CH_{k+l}(X ×_S Y)` with
`external_product_pushforward` and `_pullback` (Fulton 1998, §1.10). Define `Chow.IsRegularImmersion
i d`: around every point the ideal of `i` is generated by a regular sequence of length `d`, and the
refined Gysin map `Chow.gysin i f : CH_k(Y') → CH_{k−d}(X')` for such an `i : X → Y` with normal
bundle `N` and any `f : Y' → Y`, `X' := X ×_Y Y'`: specialise to the normal cone `C_{X'} Y' ⊆ f^* N`
and apply the inverse of `homotopy_invariance` for `f^* N` (Fulton 1998, §6.1; Stacks, Section 42.54
(0FBI)); `i^* := i^!` for `f = 𝟙`. Hypotheses: `i` regular of constant codimension `d`; no
hypothesis on `f`. API: `pushforward_compat` (`i^! g_* = g'_* i^!` for `g` proper),
`pullback_compat` (for `g` flat), `commutes_with_c1`, `excess_intersection` (`i^! α = c_{d−d'}(f^* N
/ N') ∩ i'^* α` when `i' : X' → Y'` is regular of codimension `d'`; Fulton, Theorem 6.3),
`functoriality` (`(j i)^! = i^! j^!`; Theorem 6.5), `divisor_case` (agreement with §5.3 for `d =
1`), `gysin_self_intersection` (`i^! i_* α = c_d(N) ∩ α` for `α ∈ CH_*(X)` and
`N = N_{X/Y}` on `X`) (Fulton 1998, Theorems 6.2, 6.3, 6.5). *Needs:*
§0.2, §0.3, §5.2–§5.4; Mathlib `reesAlgebra`, `RingTheory.Sequence.IsRegular`; StableReduction Layer
4; AlgebraicVectorBundles L2B.

**Checks.**
- `test_normal_bundle_hypersurface`: for a hypersurface `D ⊆ Y`, `N = O(D)|_D`.
- `test_specialization_point`: for `X` a point of a curve `Y`, `σ[Y] = [N]`.
- `test_homotopy_affine_line`: `CH_*(X × 𝔸¹) = CH_{*−1}(X)`.
- `test_transverse`: for transversal smooth `X, Y'` in `Y`, `i^! [Y'] = [X ∩ Y']`.
- `test_self_intersection_curve`: `deg i^* [C] = C · C` for a smooth curve on a smooth surface.
- `test_excess`: `i^! [X] = c_d(N) ∩ [X]`, not `[X]`.
- `test_zero_section`: for the zero section of a bundle, `s^!` is the inverse of flat pullback.

### 5.6 Intersection products on smooth varieties

Define `Chow.intersect`: for `Y` smooth of pure dimension `n` over `k` and `X, X' → Y`, `α · β :=
δ^!(α × β) ∈ CH_{a+b−n}(X ×_Y X')` for `α ∈ CH_a(X)`, `β ∈ CH_b(X')`, with `δ : Y → Y × Y` the
diagonal (a regular immersion of codimension `n` because `Y` is smooth) and `×` the external
product of §5.5; for `X = X' = Y`, `A(Y) = ⊕ CH^p(Y)` is a commutative graded ring with unit `[Y]`
(Fulton 1998, §8.1, Proposition 8.1.1; Stacks, Section 42.62 (0FC0)). Hypotheses: `Y` smooth over
`k`; without smoothness the diagonal is not regular and the product is undefined. API: `assoc`,
`comm`, `one`, `pullback_ring_hom` (`f^* : A(Y) → A(X)` is a ring map for `f` between smooth
varieties; Proposition 8.3 (a)), `projection_formula` (`f_*(f^* x · y) = x · f_* y` for `f` proper;
Proposition 8.3 (c)), `c1_eq_mul` (`c_1(L) ∩ α = c_1(L) · α`), `proper_intersection` (for `V`, `W`
meeting properly, `[V] · [W] = Σ_Z i(Z; V · W)[Z]` with positive multiplicities; Proposition 8.2),
`intersect_gysin` (for `i : X → Y` a regular immersion of smooth varieties, `i^! = i^*`). *Needs:*
§5.1–§5.5; Mathlib `Smooth`.

**Checks.**
- `test_pn_ring`: `A(ℙ^n) = ℤ[h]/(h^{n+1})` with `deg h^n = 1`.
- `test_bezout`: plane curves of degrees `d`, `e` without common components meet in `de` points
  counted with multiplicity.
- `test_graph_diagonal`: on `C × C` for a smooth proper curve of genus `g`, `Δ² = 2 − 2g`, and for a
  morphism `f : C → C` with transversal fixed points, `Γ_f · Δ = #Fix(f)` (Fulton, §8.1).
- `test_cone`: on the cone over a smooth quadric surface, no ring structure on `CH_*` extends the
  intersections of the two rulings integrally (`CH_*` of a non-smooth variety has no product).

### 5.7 Coherent and perfect classes: `K_0`, `G_0` and the K-theoretic pushforward

Define `Chow.K0 X`: the Grothendieck group of finite locally free sheaves on `X` (the free abelian
group on them modulo short exact sequences), a commutative ring under `⊗` with `[O_X] = 1`, and
`Chow.G0 X`: the Grothendieck group of finitely presented (on a Noetherian `X`, coherent)
sheaves, a `K0 X`-module. API: `K0.pullback` (`f^* : K_0(Y) → K_0(X)`, a ring map), `K0.rank`,
`K0.det`, `K0.toG0` (the natural map `[E] ↦ [E]` on a Noetherian `X`), `G0.additivity` (short
exact sequences), `Chow.kPushforward` (`f_! [F] := Σ (−1)^i [R^i f_* F]` for `f` proper with
Noetherian target, well defined by additivity and the finiteness of `R^i f_*` (§2.6), with
`(g f)_! = g_! f_!` by the Leray spectral sequence (§2.2); the higher direct images are coherent,
not assumed locally free, and a torsion coherent sheaf is a valid input), `G0.projection_formula`
(`f_!(f^* a · b) = a · f_! b` for `a ∈ K_0(Y)`), `G0.localization_sequence` (`G_0(Z) → G_0(X) →
G_0(U) → 0`), `G0.flat_pullback`. Define `Chow.HasResolutionProperty X`: every finitely presented
module is a quotient of a finite locally free one, and prove `resolutionProperty_of_quasiProjective`
(for `X` quasi-projective over `k`, from §2.6's `ample_serre_vanishing`). Prove
`K0.toG0_bijective`: for `X` Noetherian, regular (§4.13) and with the resolution property, every
coherent sheaf has a finite resolution by finite locally free sheaves (Stacks, Lemma 36.37.4), and
`K_0(X) → G_0(X)` is an isomorphism; hence for `f : X → Y` proper
between smooth quasi-projective varieties, `f_! : K_0(X) → K_0(Y)` is defined by transport, and for
`E` locally free `f_! [E] = Σ (−1)^i [R^i f_* E]` lands in `K_0(Y)` through that isomorphism, not in
the locally free sheaves themselves (SGA 6, Exposé 0, Appendice; Fulton 1998, §15.1, Example
15.1.8). Define `chernCharacter : K_0(X) → A(X)_ℚ` for `X` smooth (a ring map, by the splitting
principle, §5.4) and `chernClass_coherent` for coherent sheaves on smooth quasi-projective `X` as
`c(F) := c(Σ (−1)^i [E_i])` for a locally free resolution, independent of the resolution by
`K0.toG0_bijective` (Fulton 1998, §15.1, Example 15.1.5). *Needs:* §2.2, §2.6, §4.13, §5.4;
AlgebraicVectorBundles L0B; JacobianChallenge Layer B; StableReduction Layer 2.

**Checks.**
- `test_K0_point`: `K_0(Spec k) = ℤ` by rank; `test_K0_pone`: `K_0(ℙ¹) = ℤ²` with basis `[O]`,
  `[O(−1)]`.
- `test_G0_nodal`: for the nodal cubic `C` (not regular), `K_0(C) → G_0(C)` is not an isomorphism
  (the skyscraper at the node has no finite locally free resolution).
- `test_K0_G0_skyscraper`: on a smooth curve the skyscraper at a point is `[O] − [O(−P)]` in
  `K_0`, and its Chern character does not depend on the resolution.
- `test_pushforward_pone`: for `f : ℙ¹ → Spec k`, `f_! [O(n)] = n + 1` in `K_0(Spec k) = ℤ`.
- `test_chernCharacter_line`: `ch(L) = e^{c_1(L)}`.

### 5.8 Grothendieck–Riemann–Roch and Hirzebruch–Riemann–Roch

Prove `grothendieck_riemann_roch`: for `f : X → Y` projective between smooth quasi-projective
varieties over `k` and `α ∈ K_0(X)`, `ch(f_! α) · td(T_Y) = f_*(ch(α) · td(T_X))` in `A(Y)_ℚ`, with
`f_!` the K-theoretic pushforward of §5.7, `ch` and `td` the Chern character and Todd class of
§5.4 (through the splitting principle and `K_0(X) = G_0(X)`), and `f_*` the proper pushforward of
§5.2 on `A(Y)_ℚ`; proof halves: projective bundles `ℙ^n_Y → Y` and closed immersions through
deformation to the normal cone (§5.5) and the blow-up formula (Fulton 1998, Theorem 15.2, §15.2;
Stacks, Section 42.66 (02UO)). Prove `hirzebruch_riemann_roch`: for `X` smooth projective of dimension
`n` and `E` locally free, `χ(X, E) = deg (ch(E) · td(T_X))_n` (Fulton 1998, Corollary 15.2.1), and
its instances: Riemann–Roch for curves (§3.3) and for surfaces (§5.10). Hypotheses: `X`, `Y` smooth
quasi-projective; `f` projective; `ℚ`-coefficients. *Needs:* §2.2, §2.6, §4.11, §5.2, §5.4, §5.5,
§5.7; StableReduction Layers 2, 4.

**Checks.**
- `test_grr_point`: for `X → Spec k` and `E` locally free, GRR is HRR.
- `test_hrr_curve`: `χ(E) = deg E + r(1 − g)` on a curve (§3.3).
- `test_hrr_pn`: `χ(ℙ^n, O(d)) = binom(n + d, n)`.
- `test_grr_closed_immersion_divisor`: for a smooth divisor `i : D → X`, `ch(i_* O_D) = 1 −
  e^{−[D]}`.

### 5.9 Surfaces: the relative intersection pairing and the comparison with arithmetic surfaces

Define `Chow.intersectionNumber C D := deg(c_1(O(C)) ∩ c_1(O(D)) ∩ [S]) ∈ ℤ` for `S` smooth
projective over a field `k` and `C`, `D` divisors (through `Pic(S)`, §5.3), and prove
`surface_pairing`: it is the unique symmetric bilinear form on `Pic(S)` with `C · D = Σ_{P ∈ C ∩ D}
[κ(P) : k]` for transversal smooth curves; `C · D = deg_C(O(D)|_C)` (§3.3's degree on the curve `C`,
which carries the residue-degree weights) for `C` integral; and `C · D = Σ_P [κ(P) : k] · length
O_{S,P}/(f, g)` for curves without common components (Hartshorne 1977, V.1, Theorem 1.1, Proposition
1.4). Define the **relative intersection pairing** on a regular scheme `S` of dimension two proper
and flat over a base `B` that is a field or a Dedekind scheme: for divisors `C`, `D` with `C ∩ D`
finite, `relativeIntersection C D := Σ_{P ∈ C ∩ D} [κ(P) : κ(b_P)] · length O_{S,P}/(f_P, g_P)` as a
function on the closed points `b` of `B`, and prove `relativeIntersection_local_formula`: the local
term at `P` is the same `length O_{S,P}/(f, g)` in both cases, weighted by the residue degree over
the base; `relativeIntersection_bilinear` (bilinear and symmetric on divisors with finite
intersection, and on vertical divisors over a fixed closed point of `B` without the finiteness
condition, by moving lemmas in the fibre), `relativeIntersection_eq_intersectionNumber` (for `B =
Spec k` it is `intersectionNumber`), and `relativeIntersection_eq_stableReduction` (for `B` the
spectrum of a discrete valuation ring and `C`, `D` vertical, it is StableReduction Layer 4's
intersection number of components of the special fibre, including the negative-semidefinite
intersection matrix) (Liu 2002, §9.1, Definition 9.1.14, Proposition 9.1.21). *Needs:* §3.3, §5.3,
§5.6; StableReduction Layer 4; Tau Ceti `length_quotient_span_pair_comm`,
`SchemeWeilDivisor.relativeDegree_principalDivisor`.

**Checks.**
- `test_pairing_lines`: two distinct lines in `ℙ²` have `L · L' = 1` and `L² = 1`.
- `test_pairing_conic_line`: a conic and a tangent line have intersection `2` (length, not count).
- `test_pairing_residue_degree`: over `ℝ`, the conic `x² + y² = z²` and the line `z = 0` meet in one
  closed point with residue field `ℂ`, contributing `2`.
- `test_relative_vertical`: on a regular model over a DVR with special fibre `C_1 + C_2`, `C_1 · C_2 =
  1` at a node with residue field `κ` and `C_i · (C_1 + C_2) = 0`, StableReduction Layer 4's matrix.

### 5.10 Adjunction, Riemann–Roch on surfaces, Noether's formula, numerical equivalence, Hodge index

For `S` smooth projective over an algebraically closed field `k` with canonical class `K` (the
class of `Ω²_S`, `ω_S` of §2.20): prove `adjunction`: `2p_a(C) − 2 = C · (C + K)` for an integral
curve `C ⊆ S` with `p_a` its arithmetic genus (Hartshorne 1977, V.1, Proposition 1.5 for smooth `C`,
Exercise 1.3 for the `p_a` form); `surface_riemann_roch`: `χ(O(D)) = ½ D · (D − K) + χ(O_S)` with
Serre duality `h²(D) = h⁰(K − D)` from §2.20 (Hartshorne 1977, V.1, Theorem 1.6, Remark 1.6.1); and
**Noether's formula** in the form `12 χ(O_S) = K² + deg c_2(T_S)` with `c_2(T_S)` the second Chern
class of §5.4, an instance of Hirzebruch–Riemann–Roch (§5.8) for `E = O_S` (Fulton 1998, §15.2,
Example 15.2.2); the identification of `deg c_2(T_S)` with the ℓ-adic Euler characteristic `Σ (−1)^i
dim H^i(S, ℚ_ℓ)` is a separate comparison owned by the CohomologicalPointCounting family
(TraceFormula) and is not part of this target. Define `Chow.NumericallyEquivalent D
D'`: `D · C = D' · C` for every class `C` (equivalently every integral curve), and `Num S :=
Pic(S)/≡` with the induced pairing; `Num.free_finiteRank` (a free abelian group of finite rank, the
Picard number; Hartshorne 1977, V.1, Exercise 1.8) is a separate statement which the next two
theorems do not use. Prove `hodge_index`: for `H` ample and `D` with `D · H = 0`, `D² ≤ 0`, with
equality iff `D ≡ 0`; hence on the real span of any finite set of classes orthogonal to `H` the
form is negative definite, and on `Num S ⊗ ℝ` it has signature `(1, ρ − 1)`. Proof inputs:
`surface_riemann_roch` with Serre duality, giving `h⁰(nD) + h⁰(K − nD) ≥ ½ n² D² + O(n)`, and the
ample-section estimate of Lemma 1.7 controlling the duality term `H⁰(K − nD)`.
For `D · H = 0`, `(K − nD) · H = K · H` is constant, so growing `n` does not
justify a vanishing claim (Hartshorne 1977, V.1, Lemma 1.7, Corollary 1.8, Theorem 1.9); the Hodge
inequality `(D · H)² ≥ D² H²` for `H` ample follows (Exercise 1.9). Prove `nakai_moishezon`
afterwards and independently: a divisor `D` on `S` is ample iff `D² > 0` and `D · C > 0` for every
integral curve `C ⊆ S` (Hartshorne 1977, V.1, Theorem 1.10; Kleiman 1966), with ampleness
StableReduction Layer 2's notion ("some power is very ample"); it is not an input to
`hodge_index`. *Needs:* §2.20, §3.3,
§5.4, §5.8, §5.9; StableReduction Layer 2.

**Checks.**
- `test_adjunction_plane_curve`: a smooth plane curve of degree `d` has genus `(d − 1)(d − 2)/2`.
- `test_rr_pone_times_pone`: on `ℙ¹ × ℙ¹`, `χ(O(a, b)) = (a + 1)(b + 1)`.
- `test_noether_pone_times_pone`: `12 · 1 = 8 + 4`; `test_noether_p2`: `12 · 1 = 9 + 3`.
- `test_num_p2`: `Num(ℙ²) = ℤ`; `test_num_elliptic_product`: in characteristic zero, `E × E` over `k̄` has Picard number `3`
  or `4`; in positive characteristic a supersingular product has Picard number `6`, and `Num ≠ Pic`.
- `test_nakai_pone_times_pone`: `O(a, b)` is ample iff `a, b > 0`.
- `test_hodge_pone_times_pone`: `D = (1, −1)` has `D · H = 0` for `H = (1, 1)` and `D² = −2 < 0`.
- `test_hodge_numerically_trivial`: a numerically trivial class gives equality `D² = 0` although it
  need not be trivial in `Pic`.
- `test_nakai_negative_ample`: `−H` for `H` ample has `(−H)² > 0` and fails the curve condition.

### 5.11 The Weil bound via surfaces

Prove `weil_bound_via_surfaces`: for `C` a smooth projective geometrically irreducible curve of
genus `g` over `𝔽_q`, with `C̄ = C ×_{𝔽_q} 𝔽̄_q`, `S = C̄ × C̄`, `Γ ⊆ S` the graph of the `q`-power
Frobenius `F : C̄ → C̄` (FrobeniusGeometry Layer 3's), `Δ` the diagonal, and for a point `P ∈
C̄(𝔽̄_q)` the fibres `F_1 := {P} × C̄` and `F_2 := C̄ × {P}`: (i) `Γ · F_1 = 1` (one point `(P,
F(P))`), `Γ · F_2 = q` (the fibre of `F` over `P` has degree `q`, inseparable), `Δ · F_1 = Δ · F_2 =
1`, `F_1² = F_2² = 0`, `F_1 · F_2 = 1`; (ii) `Δ² = 2 − 2g` and `Γ² = q(2 − 2g)`, both by adjunction
(§5.10) on `S` with `K_S = pr_1^* K_C + pr_2^* K_C`: `Δ ≅ C̄` and `Γ ≅ C̄` (the image of `(1, F)`),
so `2g − 2 = Δ² + K_S · Δ = Δ² + 2(2g − 2)` and `2g − 2 = Γ² + K_S · Γ = Γ² + (1 + q)(2g − 2)`,
since `pr_1|_Γ` has degree `1` and `pr_2|_Γ = F` has degree `q`; (iii) `Γ · Δ = #C(𝔽_q)`: `Γ` and
`Δ` meet exactly at the points `(P, P)` with `F(P) = P`, the `𝔽_q`-rational points, and the
intersection is transversal at each because `dF = 0` so the tangent spaces of `Γ` and `Δ` are the
horizontal and the diagonal directions (Milne 2024, Definition 11.12, p. 9, and the
Frobenius fixed-point calculation following Example 11.55, p. 38); (iv) put `Γ_0 := Γ − q F_1 − F_2` and `Δ_0 := Δ −
F_1 − F_2`; then `Γ_0 · F_1 = Γ_0 · F_2 = 0`, `Δ_0 · F_1 = Δ_0 · F_2 = 0`, `Γ_0² = Γ² − 2q(Γ · F_1)
− 2(Γ · F_2) + q² F_1² + 2q(F_1 · F_2) + F_2² = q(2 − 2g) − 2q − 2q + 0 + 2q + 0 = −2gq`, `Δ_0² = Δ²
− 2(Δ · F_1) − 2(Δ · F_2) + F_1² + 2(F_1 · F_2) + F_2² = (2 − 2g) − 2 − 2 + 0 + 2 + 0 = −2g`, and
`Γ_0 · Δ_0 = Γ · Δ − Γ · F_1 − Γ · F_2 − q(F_1 · Δ) + q F_1² + q(F_1 · F_2) − F_2 · Δ + F_2 · F_1 +
F_2² = #C(𝔽_q) − 1 − q − q + 0 + q − 1 + 1 + 0 = #C(𝔽_q) − (q + 1)`, the nine terms being expanded with the displayed intersection products; (v) the Hodge index theorem (§5.10)
for the ample class `H := F_1 + F_2`: `Γ_0` and `Δ_0` lie in `H^⊥`, on which the form is negative
semidefinite, so the Cauchy–Schwarz inequality `(Γ_0 · Δ_0)² ≤ Γ_0² Δ_0²` holds, giving `|#C(𝔽_q) −
(q + 1)|² ≤ 4 g² q`, that is `|#C(𝔽_q) − (q + 1)| ≤ 2g √q` (Castelnuovo–Severi); (vi) the degenerate
cases: for `g = 0`, `Γ_0² = Δ_0² = 0` and the inequality reads `#C(𝔽_q) = q + 1`, which is the count
for a conic with a rational point (a genus-zero curve over a finite field has a point by
Wedderburn); for `q = 1` there is no finite field and the statement is empty; the elliptic case `g =
1` is Tau Ceti's `WeierstrassCurve.hasse_bound`, with which the theorem agrees
(`weilBound_eq_hasse`). Hypotheses: `C` smooth projective geometrically irreducible of genus `g`
over `𝔽_q`. The intersection formulas and inequality are those of J. S. Milne, *Algebraic
Geometry*, Chapter 11, *Surfaces* (2024-11-04), Theorem 11.53, Corollary 11.54 and Example 11.55,
p. 37, applied to Frobenius on p. 38. Milne's horizontal `C_1 × {P}` is our `F_2`, and his
vertical `{P} × C_2` is our `F_1`; thus the degrees `q` and `1` must be swapped when translating
his subscripts. The negative signs in `Γ_0² = −2gq` and `Δ_0² = −2g` agree with his nonnegative
equivalence defect. The Weil-conjectures roadmap imports this as
one of its two routes; the other is TraceFormula Layer 8's. *Needs:* §5.6, §5.9, §5.10, §3.3;
FrobeniusGeometry Layer 3; Tau Ceti `WeierstrassCurve.hasse_bound`; AlgebraicCurves Layer 8.

**Checks.**
- `weilBound_intersection_table`: all products in (i)–(iv) as separate equalities. This geometric
  table is README-only: `intersectionNumber` accepts line-bundle classes, but there is no typed
  construction here of `O(Γ)`, `O(Δ)` and the two fibre classes from a curve and its relative
  Frobenius, with Cartier-divisor and degree comparisons. Those constructions are targets of
  §5.6 and FrobeniusGeometry Layer 3. The Lean `weilBound_normalized_intersections` example checks
  the signed normalization on the surface pairing conditional on the geometric table; it does
  not assert that arbitrary four line-bundle classes come from this geometry.
- `weilBound_test_projective_line`: `g = 0`, `#ℙ¹(𝔽_q) = q + 1`.
- `weilBound_test_elliptic_hasse`: for `g = 1` the bound is `WeierstrassCurve.hasse_bound`.
- `weilBound_test_transversality`: at a rational point `(P, P)`, `T Γ = graph(dF) = graph(0)` and
  `T Δ` are complementary in `T_P C̄ ⊕ T_P C̄`.
- `weilBound_test_sharp`: the Hermitian curve `y^q + y = x^{q+1}` over `𝔽_{q²}` attains the bound.

### 5.12 Bézout's inequality

Prove `bezout_inequality`: for equidimensional closed subschemes `V`, `W ⊆ ℙ^n_k` of degrees `deg
V`, `deg W` (degrees of the top-dimensional cycles), `Σ_Z deg Z ≤ deg V · deg W` over the
irreducible components `Z` of `V ∩ W`, with equality `Σ_Z i(Z; V · W) deg Z = deg V · deg W` when
`dim V + dim W ≥ n` and the intersection is proper (every component has the expected dimension `dim
V + dim W − n`; for `dim V + dim W < n` the intersection may be empty and only the inequality
remains); no smoothness of `V`, `W` and no properness of the intersection is needed for the
inequality, which is the form the height applications use (Fulton 1998, Example 8.4.6, §12.3,
Theorem 12.3, Example 12.3.1). *Needs:* §5.2, §5.3, §5.6.

**Checks.**
- `test_bezout_plane_curves`: two plane curves of degrees `d`, `e` meet in at most `de` points.
- `test_bezout_improper`: a line and itself: one component of degree `1 ≤ 1`.
- `test_bezout_skew_lines`: two skew lines in `ℙ³` do not meet: `0 ≤ 1`, and no equality is
  asserted since `1 + 1 < 3`.
- `test_bezout_twisted_cubic`: the twisted cubic and a plane have scheme-theoretic intersection of length three,
  which need not consist of three distinct points.

### Examples

`A(ℙ^n) = ℤ[h]/(h^{n+1})`, Bézout in the plane, `C × C` with `Δ² = 2 − 2g`, Noether's formula on
`ℙ²` and `ℙ¹ × ℙ¹`, the Hermitian curve attaining the Weil bound, and `K_0(C) ≠ G_0(C)` for the
nodal cubic.

### Dependencies

Layer 0: §0.2–§0.3 (relative Spec and Proj). Layer 2: §2.2, §2.6 (spectral sequences,
quasi-coherent cohomology), §2.20 (duality on surfaces). Layer 3: §3.3–§3.4. Layer 4: §4.11
(modifications), §4.13 (regular schemes). Mathlib and Tau Ceti as listed; AlgebraicVectorBundles
L0B–L2B; StableReduction Layers 2, 4; JacobianChallenge Layer B; AlgebraicCurves Layer 8;
FrobeniusGeometry Layer 3.

## Downstream consumers

The perfectoid and adic roadmaps import henselization of pairs (§0.12), the excellence package
(§0.21) and the pro-étale site foundations (§2.17). The ℓ-adic family (CohomologicalPointCounting)
consumes the sites and coefficient sheaves of §§2.9–2.11, the `𝔾_m`-cohomology of curves (§2.16),
universal homeomorphisms (§0.23) and the Hilbert 90 of §2.11, through the edges listed under scope.
AlgebraicModuliForArithmeticGeometry imports torsors and their classes (§1.15), algebraic stacks
(§§1.18–1.23), the Picard torsors of curves (§3.6) and projective bundles (§5.4).
NeronModelsAndSemistableAbelianVarieties imports formal functions and algebraization (§§4.9–4.10)
and the semistable alteration theorem (§4.20). EtaleDualityAndPerverseSheaves imports coherent
duality (§§2.18–2.21) and the pro-étale foundations. AbelianSchemesAndArithmeticModuli imports Chow
groups and numerical equivalence (§§5.1–5.10). The Weil-conjectures roadmap imports the Weil bound
(§5.11). JacobianChallenge Layer C consumes the theorem on formal functions (§4.9). StableReduction
consumes nothing from this roadmap.

## References

- Stacks: *The Stacks Project*, https://stacks.math.columbia.edu (tags in parentheses).
- Fulton 1998: W. Fulton, *Intersection Theory*, 2nd ed., Ergebnisse 3/2, Springer 1998.
- Hartshorne 1977: R. Hartshorne, *Algebraic Geometry*, GTM 52, Springer 1977.
- Liu 2002: Q. Liu, *Algebraic Geometry and Arithmetic Curves*, Oxford GTM 6, 2002.
- Kleiman 1966: S. Kleiman, *Toward a numerical theory of ampleness*, Ann. of Math. 84 (1966).
- EGA I: Grothendieck–Dieudonné, *EGA I*, Publ. IHÉS 4 (1960).
- EGA IV₃: Grothendieck–Dieudonné, *EGA IV, troisième partie*, Publ. IHÉS 28 (1966).
- SGA 4 XVI: M. Artin, *Théorème de changement de base par un morphisme lisse, et applications*, SGA
  4, Exposé XVI, LNM 305.
- SGA 6: Berthelot–Grothendieck–Illusie, *Théorie des intersections et théorème de Riemann–Roch*,
  LNM 225.
- Schlessinger 1968: M. Schlessinger, *Functors of Artin rings*, Trans. AMS 130 (1968).
- Grothendieck 1957: *Sur quelques points d'algèbre homologique*, Tôhoku Math. J. 9 (1957).
- Grothendieck 1966: *On the de Rham cohomology of algebraic varieties*, Publ. IHÉS 29 (1966).
- Grothendieck Brauer I, II, III: *Le groupe de Brauer I–III*, Dix exposés sur la cohomologie des
  schémas (1968).
- Deligne–Mumford 1969: *The irreducibility of the space of curves of given genus*, Publ. IHÉS 36.
- Deligne 1985: *Le lemme de Gabber*, Astérisque 127.
- de Jong 1996: A. J. de Jong, [*Smoothness, semi-stability and alterations*](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf),
  Publ. IHÉS 83 (1996), pp. 51–93.
- Morel–Voevodsky 1999: *A¹-homotopy theory of schemes*, Publ. IHÉS 90.
- Milne 2024: J. S. Milne, [*Algebraic Geometry*, Chapter 11, *Surfaces*](https://www.jmilne.org/math/CourseNotes/AG11.pdf),
  version 2024-11-04, chapter-local pagination; available at [the author’s site](https://www.jmilne.org/math/).
- Huber 1996: *Étale cohomology of rigid analytic varieties and adic spaces*, Aspects of Mathematics
  E30, Vieweg.
- Scholze 2017: *Étale cohomology of diamonds*, https://arxiv.org/abs/1709.07343.
- Bhatt–Scholze 2014: *The pro-étale topology for schemes*, https://arxiv.org/abs/1309.1198v2.
- Bhatt–Scholze 2017: *Projectivity of the Witt vector affine Grassmannian*,
  https://arxiv.org/abs/1507.06490v3.
- Bhatt–Scholze 2022: *Prisms and prismatic cohomology*, Ann. of Math. 196,
  https://arxiv.org/abs/1905.08229.
- Bhatt–Morrow–Scholze 2018: *Integral p-adic Hodge theory*, Publ. IHÉS 128,
  https://arxiv.org/abs/1602.03148.
- Bhatt–Ma–Patakfalvi et al. 2020: *Globally +-regular varieties and the minimal model program for
  threefolds in mixed characteristic*, https://arxiv.org/abs/2012.15801v3.
- Zhu 2017: *Affine Grassmannians and the geometric Satake in mixed characteristic*,
  https://arxiv.org/abs/1407.8519v3.
- Clausen–Mathew–Morrow 2021: *K-theory and topological cyclic homology of henselian pairs*,
  https://arxiv.org/abs/1803.10897v2.
- Česnavičius 2018: *Purity for the Brauer group*, https://arxiv.org/abs/1711.06456v4.
- Rydh 2013: *Existence and properties of geometric quotients*, J. Algebraic Geom. 22 (2013),
  629–669. Quotient locators here use the [2012-05-04 author manuscript](https://davidrydh.se/papers/quotients20120504.pdf),
  whose pagination is 1–36.
- Česnavičius 2020: *Grothendieck–Serre in the quasi-split unramified case*,
  https://arxiv.org/abs/2009.05299v7.
- Česnavičius 2021: *Macaulayfication of Noetherian schemes*, https://arxiv.org/abs/1810.04493v2.
- Boxer–Calegari–Gee–Pilloni 2021: *Abelian surfaces over totally real fields are potentially
  modular*, https://arxiv.org/abs/1812.09269v3.
- Klevdal–Patrikis 2024: *Compatibility of canonical ℓ-adic local systems on adjoint Shimura
  varieties*, https://arxiv.org/abs/2303.03863v2.
- Couveignes 2019: *Enumerating number fields*, https://arxiv.org/abs/1907.13617v2.
- Kisin 2017: *Mod p points on Shimura varieties of abelian type*, J. AMS 30.
- van Hoften 2024: *Mod p points on Shimura varieties of parahoric level*,
  https://arxiv.org/abs/2010.10496v4.
- Poonen 2017: *Rational points on varieties*, GSM 186, AMS.
- Cadman 2005: *Using stacks to impose tangency conditions on curves*,
  https://arxiv.org/abs/math/0312349v3.
- Conrad 2005: *The Keel–Mori theorem via stacks*,
  https://math.stanford.edu/~conrad/papers/coarsespace.pdf.
- Abramovich–Olsson–Vistoli 2008: *Tame stacks in positive characteristic*,
  https://arxiv.org/abs/math/0703310v1.
- Nitsure 2005: *Construction of Hilbert and Quot schemes*, https://arxiv.org/abs/math/0504590v1.
- Harpaz–Wittenberg 2023: *The Massey vanishing conjecture for number fields*,
  https://arxiv.org/abs/1904.06512v2.
- Kings–Sprang 2019: *Eisenstein–Kronecker classes, integrality of critical values of Hecke
  L-functions and p-adic interpolation*, https://arxiv.org/abs/1912.03657v4.
- Yun–Zhang 2017: *Shtukas and the Taylor expansion of L-functions*,
  https://arxiv.org/abs/1512.02683.
- Bhargava–Gross–Wang 2017: *A positive proportion of locally soluble hyperelliptic curves over ℚ
  have no point over any odd degree extension*, https://arxiv.org/abs/1310.7692.
- Betts–Stix: *Galois sections and p-adic period mappings*,
  https://www.math.uni-frankfurt.de/~stix/research/preprints/.
- Benoist–Wittenberg 2020: *On the integral Hodge conjecture for real varieties, I*, Invent. Math.
  222.
- Benoist 2019: *The period-index problem for real surfaces*, Publ. IHÉS 130.
- Milne LEC: *Lectures on Étale Cohomology* (v2.21),
  https://www.jmilne.org/math/CourseNotes/LEC.pdf.
- Milne 2008: *Abelian Varieties* (course notes v2.00),
  https://www.jmilne.org/math/CourseNotes/AV.pdf.
- The Tau Ceti roadmaps cited by name are those of https://github.com/TauCetiProject/TauCetiRoadmap.
