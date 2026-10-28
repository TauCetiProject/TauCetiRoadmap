# Roadmap: scheme, stack, cohomology and intersection foundations

**Summary.** This roadmap is the general algebraic geometry that the arithmetic roadmaps stand on: relative Proj, henselian pairs and excellent rings; descent, algebraic spaces, torsors and algebraic stacks; cohomology on the Zariski, Nisnevich, étale, fppf and pro-étale sites with coherent duality and Brauer groups; curves, divisors and Picard functors; deformations, formal schemes, algebraization and de Jong's alterations; and Chow groups with Chern classes, Riemann–Roch and the Hodge index theorem. We want it because Mathlib provides schemes, their morphisms and much of the abstract categorical infrastructure, but the stacks, site cohomology, duality and alterations needed for Shimura varieties, moduli of curves and abelian varieties, Galois representations in étale cohomology and the comparison theorems of p-adic Hodge theory still require substantial shared development. Rather than let each arithmetic roadmap rebuild a private version, this roadmap fixes one set of carriers and statements that the others import and cite.

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
theorem, Grothendieck's existence theorem for coherent modules, algebraization of compatible
morphisms and de Jong's alteration theorems
(Layer 4), and Grothendieck–Riemann–Roch, the Hodge index theorem and the Weil bound for curves over
finite fields (Layer 5). Every object is defined on Mathlib's `Scheme`; every theorem names its
hypotheses.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-schemes-and-morphisms) | Schemes and morphisms | direct-image algebras and relative Proj, coherent extension and Hartogs, dimension theory and limits, henselization of pairs, catenary, Cohen–Macaulay, Nagata and excellent rings, perfect schemes and universal homeomorphisms, étale topological invariance (§0.23a), scheme Frobenius (§0.29), ideal-sheaf comparisons, normal schemes and ramification at a point (§0.30) |
| [1](#layer-1-descent-algebraic-spaces-and-stacks) | Descent, algebraic spaces and stacks | fpqc/fppf descent, algebraic spaces, group spaces, groupoids, torsors and quotients, algebraic and Deligne–Mumford stacks, moduli spaces, Galois gerbs |
| [2](#layer-2-sites-and-scheme-cohomology) | Sites and scheme cohomology | site cohomology and torsors, quasi-coherent cohomology and supports, topology comparisons, the Nisnevich site, pro-étale site foundations, coherent duality, Brauer groups, equivariant cohomology |
| [3](#layer-3-curves-divisors-and-picard-objects) | Curves, divisors and Picard objects | genus checks, degrees and duality for vector bundles on curves, Picard groups, groupoids, norms and torsors, Picard stacks and Abel maps |
| [4](#layer-4-deformations-formal-schemes-models-and-alterations) | Deformations, formal schemes, models and alterations | thickenings and lifting, deformation functors, hulls and obstruction theories, adic thickening systems and algebraization, modifications and strict transforms, stable pointed curves, alterations |
| 5 | Intersection theory and Riemann–Roch | Chow groups, pushforward and pullback, Chern classes, Gysin maps and intersection products, K-theoretic pushforward and Riemann–Roch, surfaces and the Weil bound |

Construction follows the `*Needs:*` clauses rather than subsection numbers. The prerequisite
stages include §0.17 before §0.6 and the Cohen–Macaulay theorem of §0.16;
§0.21 before §§0.15,0.19; §0.29 before §§0.24–0.26; and §1.3 before §1.2.
Build the site and cohomology inputs §§2.1–2.3,2.6,2.9,2.12,2.10–2.11 before
§1.15's torsor-class and Picard comparisons. In §4.11, construct modification predicates
and their elementary API before §4.12's Chow lemma; its strict-transform package uses
supported sections and the existing blow-up API. In Layer 5, build pushforward, flat
pullback and localization (§5.2), then projective bundles (§5.4), then the affine-bundle
isomorphism of §5.2, then Gysin maps and products (§§5.5–5.6). The blow-up decomposition
of §5.7 precedes GRR (§5.8).

## Scope and ownership

The geometric Chow groups and all operations graded by absolute closure dimension
are restricted to schemes locally of finite type over a fixed field, with maps over
that field (§5). General bases, including DVRs, need a different grading and are
outside this API. Section 4.6 uses Mathlib's two-term cotangent complex for algebra
lift classes with an existing flat lift. The non-affine Brauer comparison of §2.22 includes
the construction of the gerbe of local splittings.


**This roadmap owns** the shared scheme-, space-, site- and coherent-sheaf foundations: the general
relative Proj and its comparison with the finitely generated case, extension of coherent modules,
henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages, perfect schemes
and perfection, the universal-homeomorphism equivalence of small étale sites (§0.23a),
absolute, relative, iterated and finite-field scheme Frobenius with coherent twists (§0.29),
normal schemes, codimension-one points under finite dominant morphisms and ramification at a point (§0.30),
the ideal-sheaf comparison API, algebraic spaces with their small étale sites,
group algebraic spaces, groupoids, torsors and their classes, categorical and geometric quotient predicates,
projective quotients by finite groups, algebraic stacks, moduli spaces, Galois gerbs, the
functoriality of sheaf cohomology on sites, the comparison of the topologies of a scheme with the coefficient sheaves `𝔾_a`, `𝔾_m`, `μ_n`, the
Nisnevich site, the pro-étale site foundations (replete topoi, w-contractible covers,
left-completeness), coherent Grothendieck duality in the generality of the Stacks Project, the Brauer
group of a scheme, abelian-extension boundaries, equivariant sheaf cohomology, the curve and Picard theory that no curve roadmap
states, formal deformation theory with elementary obstruction theories, adic thickening systems, coherent existence and algebraization of compatible morphisms, modifications,
strict transforms and alterations, the moduli stack of stable pointed curves, Chow groups,
Chern classes, refined Gysin maps, intersection products, a K-theoretic pushforward for
Riemann–Roch, and surfaces. Formal geometry here uses chosen ideals and level-preserving adic thickening
systems. Comparison with the category of topologically locally ringed formal schemes and
independence from ideals of definition are outside this scope. Polarized algebraization of
formal schemes and a category equivalence for polarized systems are also outside this scope.

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
  curve (contract J-B / SR-2), the curve-family specialisations of coherent higher direct images and
  base change (the general proper-coherence API is JacobianChallenge Layer C), finite
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
  schemes, finite affine invariant quotients (`TauCeti.AffineInvariantQuotient.quotient` and
  `.projection`), finite étale schemes and Galois sets, effective descent of affine schemes and
  of finite locally free schemes along a faithfully flat morphism, polarised descent of projective
  curves, Weil restriction, the
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
  formal functions used by the Picard construction in its Layer C is owned here in §4.9,
  at `TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`, with shared API
  `Scheme.Modules.Cohomology.formalFunctionsIso`. Its coherent higher-direct-image
  and finiteness theorems are inputs to that API; its Picard construction is a consumer.
- *Function fields, places, divisors, `L(D)`, the genus, Riemann–Roch, the different and Hurwitz's
  formula, constant-field extensions, the regular projective model of a function field and the
  anti-equivalence with regular projective curves*: [AlgebraicCurves](../AlgebraicCurves/README.md)
  Layers 0–12. Layer 3 here restates nothing of this; its Riemann–Hurwitz is the scheme form.
- *Brauer groups of fields, crossed products and `Br(K) ≅ H²(G_K, K^{s×})`
  (`TauCeti.brauerCohomologyEquiv`), continuous Galois cohomology, Hilbert 90 for fields and Kummer
  theory*: Tau Ceti, [ClassFieldTheory](../ClassFieldTheory/README.md),
  [ProfiniteCohomology](../ProfiniteCohomology/README.md) and
  [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) Layer 7B.
- *Exact categorical Grothendieck groups and resolution comparison*:
  [GrothendieckEulerForms](../GrothendieckEulerForms/README.md) Layers 2–3,
  implemented by `TauCeti.ExactK0`, `TauCeti.ExactK0.lift` and the resolution API.
  Section 5.7 specializes these carriers to sheaves and constructs the geometric operations.

The sites, the coefficient sheaves `𝔾_a`, `𝔾_m`, `μ_n`, Hilbert 90, the Kummer and Artin–Schreier
sequences, `𝔾_m` on curves, Tsen and Brauer groups remain owned here, together with the Galois,
limit, Hochschild–Serre, Gabber and hypercovering theorems for arbitrary abelian sheaves and the
pro-étale site foundations. In particular, §§2.1–2.2 own `Sheaf.derivedPushforward`,
`Sheaf.higherDirectImage` and `leray_spectral_sequence` for generic sites and abelian D⁺ complexes.
Scheme compactifications, Nagata existence and common refinements are constructed downstream
in EtaleCohomologyFoundations. The full cotangent complex, polynomial resolutions, general
square-zero obstruction API and derived module algebra are constructed downstream in
DerivedModuleAlgebra. These are client developments of the foundations here, not inputs to
this roadmap. Section 2.19 constructs coherent upper shriek locally and compares it with
any given open-proper factorization.
Finite-module twists, finite and adic étale comparisons, trace formulas, complex comparison,
Tate modules and étale cycle classes are downstream applications of these foundations;
they are not prerequisites for any target here. Section 2.9 exports `muEtale`, and §2.11
exports its Kummer sequence. The downstream twist owner identifies its degree-one twist
with this sheaf for invertible order.

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
  `AlgebraicGeometry.Scheme.finite_Γevaluation_of_isClosed`.
- The colimit of an `𝔽_p`-algebra along Frobenius: Mathlib `PerfectClosure K p` with
  `PerfectClosure.of`, `PerfectClosure.lift`, its `PerfectRing` instance and `IsPerfectClosure`.
- Effective fpqc descent of affine schemes along one faithfully flat morphism and of finite locally
  free schemes: ModularCurves 0E. Descent of quasi-projective schemes along finite locally free
  coverings with a compatible ample sheaf: StableReduction Layer 2 and ModularCurves 0E.
- Quotients of affine schemes by finite groups with the universal property, integrality and
  surjectivity of the projection and the orbit description of fibres:
  `TauCeti.AffineInvariantQuotient.quotient` and `.projection`
  (`TauCeti.AlgebraicGeometry.Quotient.Affine`, `.FiniteGroup.Affine`) and ModularCurves 0C.
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
  degree-zero line bundles given a rational point: StableReduction contract J-D.
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

**Owned here for others.** Henselization of pairs (§0.12, `Henselization.algebra`), the catenary
and Cohen–Macaulay package
(§§0.16–0.19), site-cohomology functoriality and étale cohomology of limits (§§2.1, 2.15), the
pro-étale site foundations (§2.17), Picard torsors (§3.6), adic thickening systems and algebraization of compatible morphisms
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
   regimes without a named comparison. Finite and adic coefficient extensions are downstream
   consumers; their comparisons retain finite Tor amplitude and coherent derived reductions.
3. Stacks are pseudofunctors with Mathlib's `IsStack`; representability of a morphism of presheaves
   means by schemes, of stacks by algebraic spaces; torsors are fppf torsors; group actions are on the
   left; group objects are `GrpObj` in the cartesian monoidal categories `Over S` (schemes, the
   ModularCurves convention) and `Over h_S` (algebraic spaces).
4. The genus of a proper curve is `dim H¹(X, O_X)`; the degree of a locally free sheaf of rank `r` is
   `χ(E) − r·χ(O_X)`. Thickenings are closed immersions surjective on points; modifications are
   proper birational, alterations proper dominant and generically finite. Chow groups are graded by
   dimension, measured by `Order.height x` for the closure of a scheme point `x`;
   `Order.coheight x` measures codimension. Intersection products on smooth varieties are graded
   by codimension.
5. Names live under `TauCetiRoadmap.SchemeAndStackFoundations`, in namespaces named after the
   strand (`Henselization`, `Excellence`, `IdealPullback`, `Spaces`, `Groups`, `Torsor`,
   `Nisnevich`, `Coherent`, `Brauer`, `Curve`, `Picard`, `Formal`, `Deformation`, `IsAlteration`,
   `Chow`, among others); the names proposed for the library are the ones in the subsections
   below, under `AlgebraicGeometry` for direct extensions of Mathlib objects (relative Proj,
   thickenings, adic thickening systems, alterations) and under `TauCeti` for the ring-theoretic
   and curve strands. `Suggested.lean` contains the key definitions with real bodies and the
   headline theorems that are statable at the pins, with some Checks as `example`s; each
   subsection lists its declarations there on a *Lean:* line. This document names every API item
   and every test; every target or test named here and absent from `Suggested.lean` is specified
   in this README only and is equally required. Proposed names of such README-only items inside
   the strands of `Suggested.lean` are set in italics (for example *Torsor.hom_isIso*), so that
   they are not mistaken for declarations of that file.
6. Every definition subsection lists its unit tests under **Checks**: a genuine construction that
   satisfies the definition, a degenerate or edge case, a false positive obtained by dropping one
   essential clause of the definition, and, where a carrier is shared with a library or another
   roadmap, a compatibility test against that carrier. A wrong definition fails at least one of them.

## Exact supplier contracts

- `SheafOfModules`, `SheafOfModules.toSheaf`, and `SheafOfModules.unit`,
  `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean`: the module carrier, its underlying abelian sheaf,
  and the structure-sheaf module. §2.9 supplies the big-site section functor on these carriers.
- `SheafOfModules.free`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Free.lean`, and
  `Scheme.Modules.restrictFunctor`, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`: finite free
  terms and open restriction for §0.5's resolutions.
- `DerivedCategory.Q`, `DerivedCategory.singleFunctor`,
  `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`: localization and degree-zero complexes;
  §2.18's pseudo-coherence criterion is a property of this existing derived category.
- `AlgebraicGeometry.Scheme.ord`, `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: the
  principal-divisor coefficients in §5.1. Rational equivalence additionally allows locally
  finite families of integral closed subschemes.


- `AlgebraicGeometry.Scheme.Modules.pullbackComp`, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`:
  composition of module-sheaf pullback functors; use it for the quasi-coherent restriction.

- `AdicCompletion.flat_of_isNoetherian`, `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean`:
  flatness of the completion of a Noetherian ring, including the local-ring instances.
- `TauCeti.AlgebraicGeometry.PureRelativeDimension`,
  `TauCeti/AlgebraicGeometry/Morphisms/PureRelativeDimension.lean`: the dimension hypothesis for
  flat pullback and its stability under base change.
- `IsDiscreteValuationRing.eq_unit_mul_pow_irreducible`,
  `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`: the nonzero DVR parameter
  factorization. §4.18 additionally retains the zero branch, positivity in the maximal
  ideal and the coordinate equivalence with the supplier's local model.
- `TauCeti.NodeAlgebra`, `TauCeti/RingTheory/Node/Basic.lean`, and
  `TauCeti.NodeAlgebra.jacobianQuotientEquiv`,
  `TauCeti/RingTheory/Node/Jacobian/Locus.lean`: the model `uv=a` and its Jacobian
  quotient `R/(a)`. The Lean statements of §4.18 use the defining polynomial quotient
  `R[u, v]/(uv − a)` and its coordinate ideal directly.
  StableReduction Layer 1 supplies the étale local charts with either `uv=0` or
  `uv=π^n`, `n≥1`; §4.18 compares those charts and their completions with its
  general local parameter.
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

The local-cohomology supplier is `localCohomology` in
`Mathlib/Algebra/Homology/LocalCohomology.lean`, with its colimit-of-Ext meaning;
`localCohomology.isoSelfLERadical` and `localCohomology.isoOfSameRadical` already supply
the Noetherian radical comparisons. §2.7 supplies comparison with geometric support,
not another module local-cohomology functor. The affine Ext computations in §3.3 use
`Ext` from `Mathlib/CategoryTheory/Abelian/Ext.lean`; global sheaf Ext uses
`CategoryTheory.Abelian.Ext` from
`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`.

**From Tau Ceti** (`a91d3aaf`). `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`,
`CategoryTheory.CommMon.relativeSpec`, `CommMon.sectionsPresheaf`,
`CommMon.isLocalization_basicOpen`; `Scheme.Modules.Cohomology`, `Scheme.Modules.eulerCharBelow`
(`TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean`), `AlgebraicGeometry.Scheme.genus`
(`TauCeti/AlgebraicGeometry/Cohomology/Genus.lean`, guarded by finite-dimensionality of
`H¹(X, (InvertibleSheaf.trivial X).obj)`), `finrank_cohomology_zero_sub_one_eq_add`;
`TauCeti.AlgebraicGeometry.InvertibleSheaf`,
`LineBundleClass` (with its `CommGroup` instance), `SchemeWeilDivisor`, `CartierDivisor`,
`CodimensionOnePoint`, `SchemeWeilDivisor.toInvertibleSheaf`, `classGroupToLineBundleClass`;
`TauCeti.Model`, `genericFiber`, `specialFiberι`, `FiniteDVRExtension`;
`TauCeti.CommHopfAlgCat.fppfQuotientSheaf`, `isPullback_fppfQuotientTorsor`,
`TauCeti.ConstantGroup.groupScheme`, `linearlyReductiveAffineGroupSchemeProperty`;
`TauCeti.AlgebraicGeometry.AbelianVariety` with `dim`; `TauCeti.derivationToDualNumberEquivLift`;
`TauCeti.AffineInvariantQuotient.quotient` and `.projection`; `SheafOfModules.dual`, `monoidalClosed`;
`TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`;
`TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `finite_of_injective`;
`TauCeti.ScalarAut.instMulSemiringAction`; `TauCeti.brauerCohomologyEquiv`,
`subsingleton_brauerGroup_of_finite`; `TauCeti.NodeAlgebra`; `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`.

**From TauCetiRoadmap.AlgebraicVectorBundles**: L0A (monoidal closed `X.Modules`), L0B
(`FiniteLocallyFreeSheaf`, `isFiniteLocallyFreeOfRank`, `rank`), L0C (`dual`, `determinant`,
`symmetricPower`, `exteriorPower`), L1A–L1B (`pullbackQuasicoherentAlgebra`, `relativeSpecHomEquiv`,
`relativeSpecEquiv`, `relativeSpecBaseChangeIso`), L2A (`GradedQuasicoherentAlgebra`,
`gradedSymmetricAlgebra`), L2B (`totalSpaceScheme`, `totalSpace`,
`totalSpaceHomEquiv`, `totalSpaceForgetIso`, `totalSpaceBaseChangeIso`). `Suggested.lean` imports the owner
module, and its rank predicate `Curve.isFiniteLocallyFreeOfRank` is an abbreviation of
`isFiniteLocallyFreeOfRank`; the total space and projection of §5.4 are the owner's, used
definitionally, and the finite-presentation condition is exactly the owner’s. **From StableReduction**: Layer 0 (`FamilyOfCurves`, relative dimension,
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
Layers 9–10 (continuous cohomology, Hilbert 90 and Kummer theory for fields).

### Scheme and site contracts owned here

| Section | Interface and convention |
| --- | --- |
| §0.23a / `universalHomeomorphismEtaleEquivalence` | Scheme base change gives the equivalence of small étale sites, preserving and reflecting covers, with coherent composition and arbitrary base change. |
| §0.29 / `SchemeFrobenius.absoluteFrobenius`, `SchemeFrobenius.schemeFrobeniusTwist`, `SchemeFrobenius.relativeFrobenius`, `SchemeFrobenius.iteratedSchemeFrobenius` | Arbitrary characteristic-`p` schemes have absolute and relative maps with distinct codomains; smooth pure relative dimension `d` gives finite locally free relative Frobenius of rank `p^d`. |
| §0.29 / `SchemeFrobenius.qPowerFrobenius` | Over a field of order `q = p^a`, the specified absolute iterate is a map over that field. Its base change fixes extension-field scalars and is compared with relative Frobenius. |
| §0.30 / `NormalSchemes.IsNormalScheme`, `NormalSchemes.codimensionOneMap`, `NormalSchemes.ramificationIdxAt` | Normality is stalkwise (integrally closed domains). Points of coheight one map to points of coheight one under finite dominant morphisms of integral schemes whose target is Noetherian and locally of finite type over a field, or normal; the ramification index at a point is Mathlib's `Ideal.ramificationIdx` of the stalk maximal ideal. |

### Other supplier contracts

| Supplier | Interface consumed here | Convention and scope bridge |
| --- | --- | --- |
| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.9's characteristic-zero divisor/curve degree realization, line-bundle compatibility and vanishing on principal divisors | On smooth projective surfaces over algebraically closed characteristic-zero fields, compare normalized degree with §3.3's Euler degree once. Arbitrary-field local-length and arithmetic formulas remain §5.9 targets. |
| AbundanceStatement §4B / item 1 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.10's characteristic-zero numerical Cartier quotient and integral/rational-to-real comparisons | Identify Cartier divisors modulo principal divisors with `Pic(S)` and compare the numerical relations using §4A / items 2–4. §5.10 owns the single, characteristic-independent carrier `Chow.NumericallyEquivalent` / `Num S`; *numericalQuotient_abundanceComparison* identifies its characteristic-zero specialization and scalar extensions with the supplier's quotients. Both Hodge targets use this carrier in every characteristic. |
| AbundanceStatement §4B / item 2 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.10's characteristic-zero finite generation and real finite-dimensionality | Use the integral group of §4B / item 1. Torsion-freeness and integral freeness require the separate argument in §5.10; positive-characteristic surface finiteness remains a target here. |
| AbundanceStatement §4D / item 1 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.10's characteristic-zero Nakai–Moishezon criterion, including restriction to integral subvarieties | Compare intersection numbers through §4A / items 2–4 and ampleness with StableReduction Layer 2's positive-power very-ample convention. The positive-characteristic surface criterion is built here. |

## How to read the build

The layer numbers organize the subject; the prerequisite stages above and each `*Needs:*`
clause give the construction order. Layer 0 is scheme theory and commutative algebra on
Mathlib's carriers and supplies every later layer. Layer 1 builds algebraic spaces on the big
fppf site, then group spaces, torsors,
quotients and stacks; it needs Layer 0 only for the henselian and excellent packages used in its
examples. Layer 2 is the cohomology layer: its first half (§§2.1–2.17) is site-theoretic and needs
Layer 1 only through the torsor carrier, its second half (§§2.18–2.23) is coherent and needs Layer 0's
Cohen–Macaulay package. Layer 3 assembles the curve roadmaps and adds what they lack; it needs
Layer 2's Hilbert 90 and duality. Layer 4 needs Layer 0 (excellence, henselian pairs), Layer 1
(stacks, for the moduli of stable curves), Layer 2 (Ext groups and torsors of lifts) and Layer 3
(Picard schemes of curves). Layer 5 needs Layer 0's relative Proj, Layer 2's coherent duality,
Layer 3's degrees and Layer 4's blow-ups and deformation to the normal cone. Construction
prerequisites can have higher subsection numbers; comparison-only references are identified
as comparisons. In particular, construct groupoids before quotients, the Nisnevich site
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
L2A's `GradedQuasicoherentAlgebra`; gradings are indexed by `ℕ`, and the degree-zero part `A_0` is an
`O_S`-algebra through the unit `O_S → A_0`, which is an isomorphism only where a target says so. Henselian
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
`f : X → S` quasi-compact and quasi-separated, as a quasi-coherent `O_S`-algebra (the direct image of
a quasi-coherent module along such an `f` is quasi-coherent by Stacks, Lemma 26.24.1 (01LC)), and
prove `pushforwardAlgebra_affine`: for `f` affine it is AlgebraicVectorBundles L1A's
`affineFunctions`, and `pushforwardAlgebra_baseChange`: for a flat `g : S' → S` with base change
`f' : X' → S'`, the base change map `g^* f_* O_X → f'_* O_{X'}` is an isomorphism of
`O_{S'}`-algebras (Stacks, Lemma 30.5.2 (02KH), the case `i = 0`).
*Needs:* Tau Ceti `QuasicoherentAlgebra`, `CommMon.sectionsPresheaf`; AlgebraicVectorBundles L1A;
Mathlib `QuasiCompact`, `QuasiSeparated`.

**Checks.**
- `sectionsPresheaf_structureSheaf`: for `A = O_S` the presheaf is `U ↦ Γ(U, O_S)` and the
  comparison is the identity.
- `pushforwardAlgebra_id`: `(𝟙 S)_* O_S = O_S` as algebras.
- `pushforwardAlgebra_hartogs`: for the open immersion `𝔸² ∖ {0} → 𝔸²` over a field,
  the direct image is `O_{𝔸²}` by Hartogs and hence is quasi-coherent.
- `pushforwardAlgebra_reduced_points_isQuasicoherent`: over every field `k`, let
  `f : ⨿_{n≥0} Spec k → Spec k[t]` send `t` to `n`. Its direct image is quasi-coherent:
  the global module is `M = ∏_n k`, with `t` acting by `(n)_n`, and on each `D(g)` the
  canonical localization map `M_g → ∏_{g(n)≠0} k` is an isomorphism, compatible with
  restriction. Extend a tuple by zero to obtain surjectivity; a tuple supported on
  `g(n)=0` is killed by one multiplication by `g`, giving injectivity.
- `pushforwardAlgebra_unbounded_thickenings_not_quasicoherent`: over every field `k`,
  put `A = k[t]` and take `f : ⨿_{n≥1} Spec(A/(t^n)) → Spec A`. Its global module is
  `M = ∏_{n≥1} A/(t^n)`, whereas `f⁻¹D(t)` is empty and the sections there are zero.
  In `M_t` the unit tuple survives: for every `r`, the coordinate `n=r+1` of
  `t^r · (1)_n` is nonzero. Thus `M_t ≠ 0` and `f_*O` is not quasi-coherent.
- `pushforwardAlgebra_finite_thickenings_isQuasicoherent`: for the finite family
  `1 ≤ n ≤ N`, `f_*O` is quasi-coherent and `t^N` kills the whole global product,
  whose localization at `t` is zero, agreeing with the sections on `D(t)`.
  This includes the empty family `N=0`.

These localization comparisons use the affine quasi-coherence criterion
([Stacks, §26.7 (01I6)](https://stacks.math.columbia.edu/tag/01I6)); the qcqs
pushforward theorem is [Lemma 26.24.1 (01LC)](https://stacks.math.columbia.edu/tag/01LC).

### 0.2 Morphism properties of relative spectra and modules on them

Prove, for `p : Spec_S(A) → S` the relative spectrum of a quasi-coherent algebra: `p` is affine,
with `p_* O = A` (Stacks, Lemma 27.4.6 (01LX)); `p` is of finite type, of finite presentation,
finite, integral, a closed immersion, respectively, iff `A` is locally of finite type, of finite
presentation, finite, integral, a quotient of `O_S`, as an `O_S`-algebra
(`relativeSpec_finiteType_iff` and the four companions). Over an affine open `U ⊆ S` the preimage
is `Spec A(U)`, so each equivalence is the affine-local description of the morphism property:
Stacks, Lemma 29.15.2 (01T2) for finite type and Lemma 29.22.2 (01TQ) for finite presentation, each
with Lemma 29.11.2 (01S7) (an affine morphism is quasi-compact and separated); Lemma 29.45.2 (02K8)
for integral; Lemma 29.45.3 (01WI) for finite; Lemma 29.2.1 (01QO) for closed immersions. Prove `relativeSpec_modulesEquiv`: quasi-coherent `O_{Spec_S(A)}`-modules are equivalent to
quasi-coherent `O_S`-modules with an `A`-module structure, by `p_*`, with quasi-inverse
`G ↦ p^*G ⊗_{p^*A} O_{Spec_S A}` using the canonical algebra map `p^*A → O_{Spec_S A}` (Stacks, Lemma 29.11.7 (01SB)). *Needs:* §0.1; Tau Ceti `CommMon.relativeSpec`;
AlgebraicVectorBundles L1B.

**Checks.**
- `relativeSpec_tensor_counit`: for `S = Spec k`, `A = k[t]`, `F = O`, ordinary
  `p^*p_*F` has module `A ⊗_k A`; multiplication has nonzero kernel element
  `t ⊗ 1 − 1 ⊗ t`. Extension over `p^*A` recovers `A`.
- `relativeSpec_identity`: for `A = O_S`, the inverse is the identity.
- `relativeSpec_zero_module`: the inverse sends the zero module to zero.

### 0.3 Proj, base change and the relative Proj

Prove `Proj.isPullback_baseChange`: for a graded `R`-algebra `A` and `R → R'`, Mathlib's
`Proj (A ⊗_R R')` is the base change of `Proj A` along `Spec R' → Spec R` (Stacks, Lemma 27.11.6
(01N2)). Construct `relativeProj A` for an arbitrary `ℕ`-graded quasi-coherent `O_S`-algebra `A`
(AlgebraicVectorBundles L2A's `GradedQuasicoherentAlgebra`), whose degree-zero part `A_0` is an
`O_S`-algebra through the unit `O_S → A_0` and need not be `O_S` (Stacks, Situation 27.15.1 (01NN)):
the scheme over `S` glued from `Proj A(U)` over the affine opens `U` of `S` (Stacks, Lemmas
27.15.2–27.15.4 (01NO, 01NP, 01NQ)). Its structure morphism `relativeProj.toBase` is glued from
the composites `Proj A(U) → Spec A(U)_0 → U` of Mathlib's `Proj.toSpecZero` with the map induced
by `O_S(U) → A_0(U)`, and is separated (Stacks, Lemma 27.16.9 (01O2)). Construct the quasi-coherent
twisting sheaves `O(n)`, `n ∈ ℤ`, with the graded map `A → ⊕_{n ≥ 0} (relativeProj.toBase)_* O(n)`
(Stacks, Lemma 27.15.5 (01NR)). *Generated in degree one* means generated by `A_1` as a graded
`A_0`-algebra; then `O(1)` is invertible and multiplication gives `O(n) ≅ O(1)^{⊗n}` (Stacks, Lemma
27.16.11 (01O4)). Generation by `A_1` as an `O_S`-algebra is a stronger condition, forcing
`O_S → A_0` to be surjective. Prove the affine comparison
`relativeProj_affine_iso : relativeProj A ≅ Proj A(S)` over `S` for affine `S`. Prove
`relativeProj_baseChange`: formation of `relativeProj` commutes with arbitrary base change
`g : S' → S`, with degree-zero part `g^* A_0`, compatibly with `O(n)` (Stacks, Lemma 27.16.10
(01O3)). Prove `relativeProj_veronese`: for `d ≥ 1` the Veronese subalgebra `A^{(d)} = ⊕_k A_{dk}`,
which has the same degree-zero part `A_0`, satisfies `relativeProj A^{(d)} ≅ relativeProj A` over
`S`, with `O(n)` corresponding to `O(dn)` (Stacks, Lemma 27.11.8 (0B5J), on affine charts). Prove
`relativeProj_closedImmersion`: if `A_1` is of finite type and `A` is generated in degree one, the
graded map `Sym_{O_S} A_1 → A` is surjective in every positive degree and induces a closed
immersion `relativeProj A → relativeProj (Sym_{O_S} A_1)` over `S` pulling `O(1)` back to `O(1)`
(Stacks, Lemmas 27.11.3 and 27.11.5 (01N0, 01N1), on affine charts), so `relativeProj A → S` is
projective. When the unit `O_S → A_0` is an isomorphism, as for symmetric algebras and §5.4's
projective bundles, these are the same constructions, not a second carrier. Prove the compatibility
`relativeProj_eq_stableReduction`: on a graded algebra that is finitely generated in the sense of
StableReduction Layer 2, whatever its degree-zero part, `relativeProj A` is StableReduction's
relative Proj, by an isomorphism over `S` compatible with `O(1)` and with base change; the finitely
generated construction is the special case, not a second carrier. *Needs:* AlgebraicVectorBundles
L2A; StableReduction Layer 2; Mathlib `Proj`, `Proj.toSpecZero`, `GradedAlgebra`, gluing.

**Checks.**
- `relativeProj_polynomial`: for `A = O_S[T_0, …, T_n]` (the symmetric algebra of `O_S^{n+1}`),
  `relativeProj A` is `ℙ^n_S`, that is `Proj ℤ[T_0..T_n] ×_ℤ S`.
- `relativeProj_degreeZero`: for `A = O_S` concentrated in degree zero, `relativeProj A` is empty.
- `relativeProj_not_generated_degree_one`: for `A = O_S[T]` with `T` in degree two, `relativeProj A`
  is `S` but `O(1)` is not invertible; invertibility of `O(1)` needs generation in degree one.
- `relativeProj_product_degreeZero`: over `S = Spec k`, let `A = k[x, y] × k[x, y]`, so
  `A_0 = k × k ≠ k`. Then `relativeProj A = ℙ¹_k ⊔ ℙ¹_k`, its structure morphism factors through
  `Spec (k × k)`, and `O(1)` is invertible, restricting to `O(1)` on each component: `A` is generated
  in degree one over `A_0`, although the `k`-subalgebra generated by `A_1` has degree-zero part `k`.
  `relativeProj_closedImmersion` embeds it in `ℙ³_k` as two disjoint lines, and every Veronese
  subalgebra of `A` again has degree-zero part `k × k`.
- `relativeProj_eq_stableReduction_polynomial`: the comparison iso is the identity on `ℙ^n_S`.

*Lean:* `Proj.isPullback_baseChange` (with the two maps of the square existentially quantified).
The relative Proj and its comparisons are specified in this README only.

### 0.4 Direct images and extension of quasi-coherent and coherent modules

Prove `qcoh_pushforward`: kernels, cokernels, images, direct sums and colimits of quasi-coherent
modules are quasi-coherent, and for `f : X → Y` quasi-compact and quasi-separated `f_*` sends
quasi-coherent modules to quasi-coherent modules, the enumerated list of Stacks, Section 26.24 (01LA)
and Lemma 26.24.1 (01LC). Prove `qcoh_extension`: for `j : U → X` a quasi-compact open immersion into
a quasi-compact quasi-separated scheme, every quasi-coherent `O_U`-module `F` is `j^*G` for a
quasi-coherent `G` on `X` (Stacks, Lemma 28.23.1 (01PE), part (1)); for a quasi-coherent `G` on `X`,
every quasi-coherent submodule of `j^*G` is `j^*G'` for a quasi-coherent submodule `G' ⊆ G`
(Lemma 28.23.1 (01PE), part (2)), and a finite-type quasi-coherent submodule of `j^*G` is `j^*G'`
for a finite-type quasi-coherent submodule `G' ⊆ G` (Lemma 28.23.2 (01PF)); a finite-type
quasi-coherent `F` extends to a finite-type quasi-coherent `G`, and a finitely presented `F` to a
finitely presented `G` (Lemma 28.23.5 (0G41)), and a map from a finitely presented `F` to `j^*H`,
for `H` quasi-coherent on `X`, extends to a map from a finitely presented extension of `F` to `H`
(Lemma 28.23.4 (01PI)). Prove `coherent_extension`: on a Noetherian scheme, where coherent means
quasi-coherent of finite type (Stacks, Lemma 30.9.1 (01XZ)), every coherent `O_U`-module on an open
`U` is the restriction of a coherent `O_X`-module (EGA I 9.4.7; Stacks, Lemma 28.23.5 (0G41), part
(1)), and for a coherent `G` on `X` a coherent subsheaf of `j^*G` is the restriction of a coherent
subsheaf of `G` (Stacks, Lemma 28.23.2 (01PF)). Prove
`locallyFree_coherent_extension`: a finite locally free sheaf on an open `U` of a Noetherian scheme
extends to a coherent sheaf on `X` (Stacks, Lemma 28.23.5 (0G41)); it need not extend to a locally
free one, which is the content of §0.6's reflexive hull. *Needs:* Mathlib `QuasiCompact`,
`QuasiSeparated`, `SheafOfModules.IsQuasicoherent`, `IsFinitePresentation`; JacobianChallenge Layer B.

### 0.5 Pseudo-coherent modules

Define `Module.IsPseudoCoherent A M` for a ring `A` and module `M`: `M` has a resolution
`⋯ → A^{a_2} → A^{a_1} → A^{a_0} → M → 0` by finite free modules, that is a chain complex of finite
free modules in degrees `≥ 0`, exact in positive degrees, with zeroth homology `M` (Stacks,
Definition 15.66.1 (064Q)). Define `Scheme.Modules.IsPseudoCoherent F` for an `O_X`-module `F` on a
scheme: around every point there is an open `U` and an exact resolution
`⋯ → O_U^{a_2} → O_U^{a_1} → O_U^{a_0} → F|_U → 0`, with each `a_i` finite.
Use the predicates `PseudoCoherence.IsPseudoCoherentModule` and
`PseudoCoherence.IsPseudoCoherentSheaf`. Prove *isPseudoCoherentSheaf_quasicoherent* and
`isPseudoCoherentSheaf_iff_affineOpens`: the sheaf predicate is equivalent to quasi-coherence
**together with** pseudo-coherence of sections on every affine open. A condition on sections
alone is insufficient. These follow from the local resolutions and the affine comparison
([Stacks, Lemmas 36.10.1–36.10.2](https://stacks.math.columbia.edu/tag/08E4)). API: `isPseudoCoherent_iff_finite`
(over a Noetherian ring, pseudo-coherent is finite; Lemma 15.66.17 (066E)),
`IsPseudoCoherent.finitePresentation` (pseudo-coherent modules are finitely presented; Lemma 15.66.4
(064T)), `IsPseudoCoherent.baseChange_of_flat` (stability under flat base change),
`IsPseudoCoherent.of_shortExact` (two-out-of-three in a short exact sequence, from the two-out-of-three
property for distinguished triangles applied to the triangle of the sequence; Lemma 15.66.6 (064V)),
`Scheme.Modules.isPseudoCoherent_iff_affineOpens` (the characterization above) and
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

**Checks for the resolution predicates.**
- *IsPseudoCoherentModule_free*: finite free modules have a resolution concentrated in degree zero.
- *IsPseudoCoherentModule_zero*: the zero module has the zero resolution.
- *IsPseudoCoherentModule_not_finitely_presented*: a module that is not finitely presented cannot
  have such a resolution; apply this to the infinitely generated-ideal quotient above.
- *IsPseudoCoherentSheaf_free*: `O_X^n` has a finite free resolution concentrated in degree zero.
- *IsPseudoCoherentSheaf_zero*: the zero sheaf satisfies the local resolution condition.
- *IsPseudoCoherentSheaf_extension_by_zero*: for a nonfield DVR `R`, fraction field `K`, and the
  generic open immersion `j`, the sheaf `j_!O` has zero global sections and restriction `O_{Spec K}`,
  and fails the predicate. These two restrictions determine
  the sheaf on the two-point space `Spec R`. Its affine section modules `0` and `K` are
  pseudo-coherent, so they do not detect this failure.

*Lean:* `PseudoCoherence.IsPseudoCoherentModule`, `PseudoCoherence.IsPseudoCoherentSheaf`,
`PseudoCoherence.isPseudoCoherentSheaf_iff_affineOpens`, with the extension-by-zero Check as an
`example`, together with the free, zero, dual-number and finite-presentation controls.
The predicates `Module.IsPseudoCoherent`, `Scheme.Modules.IsPseudoCoherent` and the API
above are specified in this README only.

### 0.6 Reflexive sheaves, reflexive hulls and Hartogs

Define `Scheme.Modules.IsReflexive F` for a coherent `F` on a locally Noetherian `X`: the evaluation
map `ev_F : F → F^{∨∨}` of Tau Ceti's `SheafOfModules.dual` is an isomorphism (Stacks, Definition
31.13.1 (0AVU), stated there for integral `X`; here the same evaluation-map definition is made on
every locally Noetherian `X`). API: `isReflexive_iff_forall_affine` (affine-locally,
`Module.IsReflexive` of the sections; Lemma 31.13.2 (0AY0)), `isReflexive_iff_forall_stalk`
(reflexivity of every stalk, equivalently of the stalks at closed points; Lemma 31.13.5 (0AY3)),
`IsReflexive.locallyFree` (finite locally free sheaves are reflexive), `IsReflexive.dual` (the dual
of a coherent sheaf on a normal integral locally Noetherian scheme is reflexive; Lemma 31.13.8 (0AY4)
with target `O_X`), `reflexiveHull F := F^{∨∨}` for `X` normal integral with
`reflexiveHull_isReflexive` (Lemma 31.13.8 (0AY4) again), `reflexiveHull.unit : F → reflexiveHull F`
(injective exactly when `F` is torsion free, Lemma 31.13.4 (0AY2); an isomorphism on the open where
`F` is locally free, by `IsReflexive.locallyFree` on that open) and `reflexiveHull.lift` (its
universal property among maps to reflexive sheaves: the hull is left adjoint to the inclusion of
coherent reflexive sheaves into coherent sheaves; Remark 31.13.9 (0EBH)). Hypotheses: `X` locally
Noetherian; `F` coherent; the hull statements assume `X` normal integral. Prove `reflexive_extension_normal`:
on a normal locally Noetherian scheme `X`, a reflexive sheaf on an open `U` whose complement has
codimension `≥ 2` extends uniquely to a reflexive sheaf `j_* F` on `X` (Stacks, Lemma 31.13.12 (0EBJ):
for integral `X` with depth `≥ 2` at every point of the complement, `j^*` and `j_*` are inverse
equivalences between coherent reflexive sheaves on `X` and on `U`; on a normal `X` codimension `≥ 2`
gives that depth, and `X` is the disjoint union of its integral components), and for coherent
torsion-free `F` on a normal integral locally Noetherian `X`, `F^{∨∨} = j_* (F|_U)` when `F|_U` is
finite locally free and every point of `X ∖ U` has codimension at least two (Lemma 31.13.12 (0EBJ)
applied to `F^{∨∨}`, and Lemma 31.13.14 (0AY7), which decides whether a map on generic fibres extends
to a map into `F^{∨∨}` by a condition at the codimension-one points), with the `S_2` description of
reflexive sheaves: on a normal integral locally Noetherian `X`, `F` is reflexive iff it is torsion
free and `(S_2)`, iff `F = j_* j^* F` for some open `j : U → X` with complement of codimension `≥ 2`
on which `F` is finite locally free (Lemma 31.13.13 (0AY6)); and a reflexive sheaf has depth `≥ 2`
at every point where `O_X` does, so it is `(S_2)` when `X` is (Lemma 31.13.11 (0EBI)). Prove `coherent_hartogs`: for a coherent `F` on a locally Noetherian `X` and a closed `Z`
such that `depth F_x ≥ 2` at every point of `Z`, restriction `F(X) → F(X ∖ Z)` is an isomorphism
(Stacks, Lemma 31.5.11 (0E9I)).

Without integrality: prove `IsReflexive.two_le_depth_stalk`: for a coherent reflexive `F` on a
locally Noetherian `X` and a point `x` with `depth O_{X,x} ≥ 2`, `depth F_x ≥ 2` (Lemma 31.13.11
(0EBI), part (1), stated there for integral `X`; `F_x` is `Hom(Hom(F_x, O_{X,x}), O_{X,x})`, so
§0.17 `depth_hom_ge` applies, and the argument uses no integrality). Prove
`reflexive_extension_of_depth`: for a locally Noetherian `X` and an open `j : U → X` with
`depth O_{X,x} ≥ 2` at every `x ∉ U`, `j^*` and `j_*` are inverse equivalences between coherent
reflexive `O_X`-modules and coherent reflexive `O_U`-modules (Lemma 31.13.12 (0EBJ), stated there
for integral `X`; reflexive is `Scheme.Modules.IsReflexive` above). The proof is affine-local.
For a coherent reflexive `F` on `X`, `F → j_* j^* F` is an isomorphism by
`IsReflexive.two_le_depth_stalk` and `coherent_hartogs` applied on every open of `X` (the sheaf
form of 0E9I). For a coherent reflexive `G` on `U`,
extend it to a coherent `F` on `X` (§0.4 `coherent_extension`). Then `F^{∨∨}` restricts to
`G^{∨∨} = G` and has depth `≥ 2` at every point of `X ∖ U` (§0.17 `depth_hom_ge`), so
`F^{∨∨} = j_* G` by `coherent_hartogs` on every open of `X`, and `j_* G` is coherent. Its evaluation map
`F^{∨∨} → F^{∨∨∨∨}` is an isomorphism over `U`. At a point of `X ∖ U` both sides have depth
`≥ 2`, so the target has no associated prime there, and §0.17 `bijective_of_depth` makes the
map an isomorphism. On a normal `X` the codimension-two hypothesis of
`reflexive_extension_normal` gives this depth hypothesis. *Needs:* §0.4, §0.17 (depth,
`depth_hom_ge`, `bijective_of_depth`); Tau Ceti `SheafOfModules.dual`; Mathlib
`Module.IsReflexive`, `Module.Dual.eval`, `Scheme.Modules.restrictFunctor`,
`Scheme.Modules.pushforward`.

**Checks.**
- `reflexive_extension_torsion_rejected`: on `Spec k[t]`, `F = k[t] ⊕ k[t]/(t)`
  has double dual `k[t]`, whereas extension from its free locus `D(t)` gives
  `k[t,t⁻¹]`. This `F` has torsion and the omitted origin has codimension one.
- `test_unit`: for every locally Noetherian `X`, `O_X` is reflexive.
- `test_torsion`: on `X = Spec ℤ`, the tilde of `ℤ/2` has zero double dual, so it is not reflexive
  and its hull is `0`.
- `test_maximal_ideal`: on `X = Spec k[x, y]`, the ideal sheaf `I` of the origin is torsion-free with
  `I^{∨∨} = O_X ≠ I`; a torsion-free sheaf need not be reflexive.
- `test_hartogs_plane`: `Γ(𝔸² ∖ {0}, O) = k[x, y]` by `coherent_hartogs`; on `𝔸¹`, removing the
  origin gives `k[x, x^{-1}]`, so the depth hypothesis is essential.
- `reflexive_extension_reducible`: over a field `k`, `X = Spec k[x, y, z, w]/(xw)` is reducible
  and Cohen–Macaulay of dimension three, so `depth O_{X,0} = 3`; for `U = X ∖ {0}`,
  `reflexive_extension_of_depth` gives `j_* O_U = O_X`. Lemma 31.13.12 (0EBJ) does not apply, as `X`
  is not integral. This exercises only the direction `F → j_* j^* F` for `F = O_X`, which is
  `coherent_hartogs`; the `j_*` direction for a reflexive sheaf on `U` that does not extend as a
  locally free sheaf is not exercised by a check here.
- `reflexive_extension_two_planes`: for `X` the union of the planes `V(x, y)` and `V(z, w)` in
  `𝔸⁴_k`, meeting at the origin, `depth O_{X,0} = 1`, and for `U = X ∖ {0}` the sheaf `j_* O_U` is
  the direct image of the structure sheaf of the disjoint union of the two planes, not `O_X`; the
  depth hypothesis of `reflexive_extension_of_depth` is needed.

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
Lemmas 10.116.1 (00P0), 10.116.2 (06RP), 10.116.3 (00P1), 10.116.5 (00P3), 10.116.6 (00P4)).
AbundanceStatement Layer 0 / item 1 (by RoktimMascharak) states the integral finite-type special
case, including global finite dimension under finite type. This subsection owns the general
locally finite-type dimension theorem; *dimensionTheory_abundanceSpecialization* identifies its
integral finite-type specialization with that supplier's dimension and function-field conventions.
Prove
`geometric_irreducible_components`: for a scheme `X` of finite type over `k` and a field extension
`k'/k`, the irreducible components of `X_{k'}` map onto those of `X` (Stacks, Lemma 33.8.11 (04KX)),
bijectively when `k` is separably closed (Lemma 33.8.8 (038H)); the number of irreducible components
of `X_{k'}` equals that of `X` for every separable extension `k'/k` exactly when every irreducible
component of `X` is geometrically irreducible (over a separable closure the fibres of the component
map are the Galois orbits, Lemma 33.8.14 (04KY), and some finite separable extension makes every
component geometrically irreducible, Lemma 33.8.16 (054R)); and `X` is geometrically irreducible iff
`X_{k^s}` is irreducible for a separable closure `k^s` (Lemma 33.8.9 (038I); over a separably closed
field an irreducible scheme is geometrically irreducible, Lemma 33.8.3 (020J), and for irreducible
`X` the test can be made on the residue field of the generic point, Lemma 33.8.6 (054Q)). Prove
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

### 0.7a Linear Noether normalization for a prescribed affine presentation

For a field k and a nonzero commutative unital k-algebra A generated by a
finite tuple x₁,…,x_n, consume Mathlib's
`exists_integral_inj_algHom_of_fg` and `exists_finite_inj_algHom_of_fg`.
These give polynomial normalization over every field, with no domain or
reducedness assumption. Their parameters need not be linear in the x_j.
Use native `Algebra.adjoin`, `AlgebraicIndependent`, `MvPolynomial.aeval`
and `RingHom.Finite`; the tuple-generating hypothesis is
`Algebra.adjoin k (Set.range x)=⊤`.

When k is infinite, construct d≤n and a d×n matrix C over k such that
`y_i=Σ_j C_ij x_j` is algebraically independent and the actual evaluation
map `k[T₁,…,T_d]→A`, T_i↦y_i, is module-finite. Prove that the rows of
C are linearly independent, that the map is injective, and that A is
integral over its polynomial image. Identify d with `ringKrullDim A`
using the existing
`TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial`
from `TauCeti.RingTheory.KrullDimension.FiniteType`, rather than proving
another dimension theorem. Retain nonreduced and reducible algebras.
For n=0 the empty tuple gives d=0 and A≅k; for an arbitrary finite
k-algebra the normalization uses d=0, whether or not A is reduced.

Supply the linear elimination step behind this stronger conclusion.
Given a nonzero polynomial relation f among r+1 generators, its top
homogeneous part f_D is nonzero and D>0. Its dehomogenization
`P(a₁,…,a_r)=f_D(a₁,…,a_r,1)` is a nonzero polynomial. Use
`MvPolynomial.funext` over the infinite field to find P(a)≠0, and
construct the invertible triangular substitution
`X_i↦Z_i+a_i T`, `X_(r+1)↦T`.
The resulting polynomial has T-degree D and leading coefficient P(a).
Divide by this nonzero scalar to make it monic in T. Thus, for
`z_i=x_i−a_i x_(r+1)`, the algebra generated by the original tuple is
module-finite over k[z₁,…,z_r]. Prove this for every a with P(a)≠0,
including the nonempty principal-open set of valid choices. Iterate
inside the generated subalgebras and compose the coefficient matrices;
module-finiteness is transitive and all resulting parameters remain
linear combinations of the original prescribed generators. No reduced
quotient or change of the original affine presentation is inserted.
Keep degree in T distinct from total degree after substitution.

For the affine scheme presentation `Spec A↪𝔸ⁿ_k`, identify the resulting
map to 𝔸ᵈ_k with the restriction of the linear projection given by C.
Prove it is finite and surjective using the finite algebra map and
lying-over for its injective integral map; prove finite geometric fibres
and preservation of the construction under a field extension, retaining
the same coefficient matrix. These are consequences of module-finiteness,
not a definition of a finite morphism by finite set-theoretic fibres.
The ordinary all-field normalization remains available over finite fields.
Follow the normalization and dimension interfaces of Mathlib
[PR42835](https://github.com/leanprover-community/mathlib4/pull/42835);
the displayed native dimension theorem supplies the comparison at this pin.

**Checks.**
- For A=k[X₁,…,X_n] and its coordinate tuple, take d=n and C=I.
  For A=k[X,E]/(E²), with its displayed two generators, take y=X;
  A is free of rank2 over k[X]. This verifies that reducedness is unnecessary.
- Over k=𝔽₂ set `A=k[X,Y]/(XY(X+Y))`, with residue classes x,y.
  Every nonzero k-linear form in x,y is x, y or x+y. For each such ℓ,
  construct `A/(ℓ)≅k[T]`; hence A cannot be module-finite over k[ℓ],
  since its quotient would then be finite-dimensional over k. The zero
  linear form also fails, since A surjects onto k[T]. Prove dim A=1.
  This rules out dropping the infinite-field hypothesis while keeping
  parameters linear in the specified tuple.
- For that same finite-field algebra, the nonlinear parameter
  `z=x²+xy+y²` gives an injective module-finite map k[T]→A.
  Prove `x³=zx` and `y³=zy`, obtaining monic cubic relations and a
  finite spanning family x^i y^j, 0≤i,j<3. The quotient map y↦0
  sends z to X² in k[X] and proves injectivity of k[T]→A. Compare
  with all-field normalization without asserting a linear substitute.
- The zero algebra has no embedded polynomial k-subalgebra, even with
  zero variables; its structural map k→0 is not injective. Keep the
  nonzero-algebra hypothesis explicit.

*Lean:* `LinearNoetherNormalizationTargets.lean` states the prescribed-tuple
linear normalization and the two finite-field comparison targets on native
polynomial, quotient, algebraic-independence and finite-map carriers.

### 0.8 Flatness over Dedekind bases, spreading out, étale coordinates and quasi-sections

Prove `flat_over_dedekind`: a morphism `X → S` to a Dedekind scheme with `X` reduced and every
irreducible component of `X` dominating `S` is flat. Here a Dedekind scheme is integral, locally Noetherian, normal and of dimension at most
one; equivalently its nonempty affine opens are spectra of Dedekind domains. The stalk modules
are torsion-free over the base stalks, hence flat
([Stacks, Lemma 15.22.11](https://stacks.math.columbia.edu/tag/0AUW)). Pure relative dimension is a
separate hypothesis in §5.2, including for finite-type morphisms. Prove
`generic_fibre_spreading`: for `f : X → S` of finite presentation with `S` integral and the generic
fibre `X_η` geometrically reduced (irreducible, integral, connected, normal, smooth), the same holds
for the fibres over a dense open of `S`; and `fibre_locus_constructible`: the locus of `s` where `X_s`
has a given one of these properties is constructible (Stacks, Lemmas 37.26.2 (0576), 37.26.4 (0578),
37.26.5 (0579)). Prove `flat_proper_fibre_loci`: for `f` proper and flat of finite presentation, the
loci where the fibre is geometrically reduced, respectively geometrically integral, are open (EGA
IV₃, Theorem 12.2.4 (v) and (viii), p. 183). Prove `fibre_power_irreducible`: for `f : X → S` flat of
finite presentation with geometrically irreducible fibres, every fibre power `X ×_S ⋯ ×_S X` has
geometrically irreducible fibres over `S` (its fibre over `s` is a fibre power of `X_s` over `κ(s)`,
and the projection from a product with a geometrically irreducible factor is a bijection on
irreducible components, Stacks, Lemma 33.8.4 (038F)) and is irreducible when `S` is (the fibre power is flat of
finite presentation over `S`, hence open by Lemma 29.26.10 (01UA), and a space with an open map onto
an irreducible space with irreducible fibres is irreducible, Topology, Lemma 5.8.14 (004Z)). Prove `etale_coordinates`: a morphism `f : X → S` smooth at `x` of relative dimension `d`
admits, on an open neighbourhood `U` of `x`, an étale morphism `U → 𝔸^d_S` over `S` (Stacks, Lemma
29.37.21 (054L)). Prove `rational_point_component`: a connected scheme smooth over a field with a
rational point is geometrically integral: it is geometrically connected because it is connected
with a rational point (Stacks, Lemma 33.7.14 (04KV)), geometrically normal and geometrically reduced
because it is smooth (Lemma 33.25.4 (056T)), so every `X_{k'}` is connected, normal and locally
Noetherian, hence integral (Properties, Lemma 28.7.7 (033N)). Prove `quasi_sections`: for
`f : X → S` smooth and surjective there is an étale surjective `S' → S` with a section of `X_{S'}`,
and for `f` smooth at `x`, with `x` closed in its fibre and
`κ(x)/κ(f(x))` separable, there is an étale map `S' → S` and a point `s'`
over `f(x)`, with `κ(s') ≅ κ(x)` over `κ(f(x))`, and a section whose value
at `s'` maps to `x` (Stacks, Lemmas 37.38.5 (057G), 37.38.6 (055U)). *Needs:* §0.7; Mathlib `Flat`,
`Smooth`, `SmoothOfRelativeDimension`, `Etale`, `AffineSpace`, `IsProper`, `Geometrically.Integral`.

**Checks.**
- `flat_over_dedekind_mixed_dimensions`: over `S = Spec k[t]`, the morphism
  `S ⊔ A¹_S → S` is flat and finite type, its source is reduced, and both components dominate `S`.
  Every fibre is `Spec κ(s) ⊔ A¹_{κ(s)}`; no single `d` satisfies the native
  `PureRelativeDimension d f`. This is the negative control for a purity conclusion.
- `smooth_section_generic_rejected`: the generic point of `𝔸¹_k → Spec k` has residue
  field `k(t)` and is not closed in its fibre. An étale field neighbourhood of `k`
  cannot carry a section through it.
- `smooth_section_rational`: a rational point of `𝔸¹_k` lies on a constant section.
- `smooth_section_separable`: a closed point with finite separable residue field `L`
  lies on a section after the étale extension `Spec L → Spec k`.

*Lean:* `flat_over_dedekind` (the Dedekind hypothesis is that every nonempty affine open is the
spectrum of a Dedekind domain), with `flat_over_dedekind_mixed_dimensions` as an `example`. The
other theorems of this subsection are specified in this README only.

### 0.9 Limits of schemes, Noetherian approximation and spreading out

Prove `affine_transition_limits`: a cofiltered diagram of schemes with affine transition maps has a
limit, computed affine-locally on any member, with `|lim X_i| = lim |X_i|` and the limit of
quasi-compact separated schemes quasi-compact and separated (Stacks, Lemmas 32.2.1 (01YW), 32.2.2
(01YX), 32.2.3 (01YZ); the underlying space of the limit is the limit of the underlying spaces by
Lemma 32.4.2 (0CUF), and since each projection to a member is affine, Lemma 32.2.2 (01YX), the limit
of quasi-compact separated schemes is quasi-compact and separated by Morphisms, Lemma 29.11.2
(01S7)). Prove `noetherian_approximation`: every quasi-compact quasi-separated scheme
is a cofiltered limit, with affine transition maps, of schemes of finite presentation over `ℤ`
(Stacks, Lemmas 32.5.1 (01Z7), 32.5.2 (01Z9), 32.5.3 (07RN), Proposition 32.5.4 (01ZA)). Prove
`finite_presentation_limits`: for `S = lim S_i` as above with every `S_i` quasi-compact and
quasi-separated, every scheme of finite presentation over `S` descends to some `S_i`, and morphisms
between descended schemes descend after enlarging `i` (Stacks, Lemma 32.10.1 (01ZM)), and the
properties flat, smooth, étale, proper, finite, closed immersion, open immersion, isomorphism of a
morphism over `S` are inherited from a finite stage (Lemmas 32.8.7 (04AI), 32.8.9 (0C0C), 32.8.10
(07RP), 32.13.1 (081F), 32.8.3 (01ZO), 32.8.5 (01ZP), 32.8.12 (0EUU), 32.8.11 (081E), respectively).
Prove `spreading_out_models`: for `S` integral with generic point `η` and `X_η` of finite
presentation over `κ(η)` with one of those properties, there is a dense open `U ⊆ S` and a model
`X_U → U` of finite presentation with the same property: for an affine open `Spec A ⊆ S`, `Spec κ(η)`
is the limit of the principal opens `D(f)`, `0 ≠ f ∈ A`, with affine transition maps (Lemma 32.2.1
(01YW), since the colimit of the `A_f` is the fraction field of `A`), so `finite_presentation_limits`
applied to this system gives the model and its property over some `D(f)`. Prove `integral_point_descent`: for `X → S`
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
Prove `unibranch_finite_components`: let `X` be locally Noetherian and let `p : Y → X`
represent a finite locally constant étale sheaf. Every connected component `C` of `Y` is open
and closed, and the composite `C ↪ Y → X` is finite étale. Use the existing finite étale
morphism predicates for the representing map, by [Stacks, Lemma 59.64.4
(03RV)](https://stacks.math.columbia.edu/tag/03RV); local Noetherianness makes `Y` locally
connected ([Stacks, Lemma 5.9.6 (04MF)](https://stacks.math.columbia.edu/tag/04MF)). The Lean
conclusion specifies an open `U` with underlying set `connectedComponent y`, its closedness,
and finiteness and étaleness of `U.ι ≫ p`. Geometric unibranchness is not needed for this
finite-sheaf statement. The locally constant
Isom-schemes in Česnavičius 2020, Lemma 5.1 and its proof, can have infinite fibres and require
the stronger component result used there over a Noetherian semilocal base. Prove
`jacobian_etale_algebra`: for polynomials `f_1, …, f_r ∈ R[x_1, …, x_r]`, the localisation of
`R[x]/(f)` at the Jacobian determinant is an étale finitely presented `R`-algebra; it is finite
étale, with degree bounded by the product of the degrees, only under the finiteness hypotheses
of Couveignes's construction (Couveignes 2019, Theorem 1 (p. 1) and Proposition 2 (p. 7)), not
from the Jacobian condition alone. *Needs:* Mathlib `Scheme.Hom.normalization`,
`Scheme.Hom.normalizationObjIso`, `IsIntegrallyClosed`, `IsPurelyInseparable`; ModularCurves 4D.

**Checks.**
- `unibranch_finite_components_eventual_sequences`: let `A ⊆ (ℕ → 𝔽₂)` be the subring of
  eventually constant sequences and `q : A → 𝔽₂` their eventual value. Its kernel `m∞`
  consists of the finitely supported sequences; it is not finitely generated, since any
  finite set of generators misses some coordinate idempotent `e_j`. Thus `q` is surjective
  and not finitely presented. All stalks of `X = Spec A` are `𝔽₂`, so `X` is geometrically
  unibranch, and `id_X` is a finite étale one-sheet cover. The actual quotient inclusion
  `i : Spec 𝔽₂ → X` is finite and closed, with image the connected component `{m∞}`;
  this image is not open and `i` is not étale. Every neighbourhood of `m∞` contains all but
  finitely many coordinate points. Affineness and field stalks therefore do not replace the
  local-Noetherian hypothesis.
- `unibranch_finite_components_finite_product`: for a finite family of fields `k_i`,
  `X = Spec (∏ i, k_i)` is locally Noetherian. Each coordinate projection induces an
  inclusion `Spec k_i → X` whose image is a connected component, open and closed, and whose
  composite with `id_X` is finite étale. The family may be empty, in which case `X` is empty
  and there are no component inclusions.
- `jacobian_test_not_finite`: for a nonzero ring `A` and `R = A[t]` and `f = t x − 1`, the Jacobian is `t`, already a
  unit in `R[x]/(t x − 1) = A[t, t⁻¹]`, which is étale over `A[t]` and not finite.
- `IsLocalRing.not_isUnibranch_node`: for a field `k` of characteristic not `2`, the local ring of
  `k[x, y]/(y² − x²(x + 1))` at the origin is not unibranch (two branches).
- `IsLocalRing.isGeometricallyUnibranch_cusp`: the local ring of `k[x, y]/(y² − x³)` at the origin
  is geometrically unibranch (normalisation `k[t]`, one point above the origin, residue field `k`).
- `IsLocalRing.isUnibranch_not_isGeometricallyUnibranch_real`: the local ring of
  `ℝ[x, y]/(x² + y²)` at the origin is unibranch (its normalisation `ℂ[t]` is local above it) but
  not geometrically unibranch (residue extension `ℂ/ℝ` is separable of degree `2`).
- `IsLocalRing.isGeometricallyUnibranch_of_field`: every field is geometrically unibranch.

*Lean:* `unibranch_finite_components` (for `p` finite and étale), with
`unibranch_finite_components_eventual_sequences` as an `example`. The unibranch predicates, their
API and `jacobian_etale_algebra` are specified in this README only.

### 0.11 Descent along field extensions, absolute integral closure, unramified morphisms

Prove `field_extension_descent`: for `X` a `k`-scheme and `k'/k` a field extension,
`Γ(X_{k'}, O) = Γ(X, O) ⊗_k k'` when `X` is quasi-compact and quasi-separated (Stacks, Lemma 30.5.2
(02KH), the case `i = 0` over `Spec k`); closed subschemes and morphisms equipped with descent data,
and the properties affine, quasi-affine, separated, finite type, proper, smooth, étale descend from
`X_{k'}` to `X`, and a morphism `X_{k'} → Y_{k'}` defined by Galois-invariant data descends when
`k'/k` is finite Galois. `Spec k' → Spec k` is an fpqc covering, and each of the seven properties is
fpqc local on the base: Stacks, Lemmas 35.23.20 (02L5) (affine), 35.23.22 (02L7) (quasi-affine),
35.23.6 (02KU) (separated), 35.23.14 (02KZ) (finite type), 35.23.16 (02L1) (proper), 35.23.29 (02VL)
(smooth), 35.23.31 (02VN) (étale).
Define `absoluteIntegralClosure X` for an integral scheme `X`: the relative normalisation of `X` in
an algebraic closure of its function field, with `absoluteIntegralClosure_integral` (integral over
`X`), `absoluteIntegralClosure_unique` (independent of the closure up to isomorphism over `X`) and
`absoluteIntegralClosure_affine` (`Spec A^+` for affine `X = Spec A`) (Bhatt–Ma–Patakfalvi et al.
2020, Convention 4.1, p. 35).

**Checks for `absoluteIntegralClosure`.**
- For algebraically closed `k`, the absolute integral closure of `Spec k` is `Spec k`.
- For a non-algebraically-closed field `k`, it is `Spec k̄`, integral and not isomorphic
  to `Spec k` over `k`.
- For `Spec k[t]`, it is `Spec k[t]^+` in an algebraic closure of `k(t)`; the element
  `t^(1/n)` is integral for every `n≥2` and is not in `k[t]`. The map need not be finite.

Prove `unramified_criteria`: a morphism locally of finite type is
unramified iff every fibre is a disjoint union of spectra of finite separable field extensions; an
unramified morphism is locally quasi-finite; `f` is unramified at `x` iff `Ω_{X/Y, x} = 0` iff the
diagonal is an open immersion near `x` (Stacks, Lemmas 29.36.10 (02V5), 29.36.11 (02G7), 29.36.12
(02G8), 29.36.13 (02GE), 29.36.14 (02GF)). *Needs:* §0.9; Mathlib `FormallyUnramified`,
`LocallyQuasiFinite`, `Scheme.Hom.normalization`.

### 0.12 Étale neighbourhoods and the henselization of a pair

The strand `Henselization` of `Suggested.lean` carries the definitions, the main theorem and the
universal property listed on the *Lean:* line below; the other lemmas of this subsection are
specified in this README only.
For a ring `R` and ideal `I`, define `IsNeighbourhood I : ObjectProperty
(CommAlgCat R)`: `B` is an étale `R`-algebra (Mathlib `Algebra.Etale`) such that the canonical map
`reducedMap I B : R/I → B/IB` is bijective; `Neighbourhood I` is the full subcategory (Stacks, Lemma
15.12.1, the construction paragraph). Prove *isNeighbourhood_self* (the identity algebra `R`),
*isNeighbourhood_localization* (`R[1/x]` for `x` a unit modulo `I`, for instance
`x ≡ 1 mod I`), *isNeighbourhood_tensor* (the tensor
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
I` is bijective), *extended_le_jacobson* (`extended I` lies in the Jacobson radical) and
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
- *neighbourhood_identity*: `R` belongs to `Neighbourhood I` for every `(R, I)`.
- *neighbourhood_invert_two*: for `(ℤ, (5))`, `ℤ[1/2]` is a neighbourhood (`2` is a unit mod `5`).
- *neighbourhood_reject_invert_five*: `ℤ[1/5]` is not: `ℤ/5 → ℤ[1/5]/5 = 0` is not bijective.
- *neighbourhood_reject_two_sheets*: `ℤ × ℤ` is not: `ℤ/5 → ℤ/5 × ℤ/5` is not surjective.
- `henselization_zero_ideal`: `algebra (⊥ : Ideal R) ≅ R`.
- `henselization_unit_ideal`: `algebra (⊤ : Ideal R)` is the zero ring.
- `henselization_fixed_pair`: for `(R, I)` henselian, `algebra I ≅ R`.
- `henselization_ordinary_finite_field`: `algebra (⊥ : Ideal (ZMod 5)) ≅ ZMod 5`.
- `map_field_identity`, `map_scalar_seven`, `map_quotient_nine`: the induced maps for
  `id : (𝔽_5, 0) → (𝔽_5, 0)`, for `ℤ → 𝔽_5`, and for `(ℤ/9, (3)) → (ℤ/9, (3))`, computed on `1`.
- `map_can_collapse`: the induced map of `(ℤ, 0) → (ℤ/5, 0)` is not injective.
- `etale_section_idempotent`: for `𝔽_5 × 𝔽_5 → 𝔽_5` the selector is `(1, 0)` and the kernel is
  `(0, 1)`; `derivative_not_unit`: `x² − 1` over `𝔽_2` has a non-simple root at `1`.

*Lean:* `Henselization.reducedMap`, `Henselization.IsNeighbourhood`, `Henselization.Neighbourhood`,
`Henselization.neighbourhood_isFiltered`, `Henselization.neighbourhood_essentiallySmall`,
`Henselization.diagram`, `Henselization.algebra`, `Henselization.extended`,
`Henselization.henselian`, `Henselization.existsUnique_lift`, `Henselization.fixed_of_henselian`;
the identity and three `(ℤ, (5))` neighbourhood Checks, the zero- and unit-ideal
henselizations, the fixed-pair case and the finite-field case are `example`s.

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
`R'^h = R' ⊗_R R^h`, the henselization of `R'` taken along `IR'`, with quotients `R' = R/J` as a
special case; Lemma 15.12.7 (0DYE); replacing `I` by an ideal with the same radical does not change
the henselization, Lemma 15.12.6 (0F0L); and for pairwise coprime `I_1, …, I_n` the henselization
along `I_1 ∩ ⋯ ∩ I_n` is the product of the henselizations along the `I_i`, Lemma 15.12.8 (0H7Q));
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

Prove *henselian_pair_characterisations*: for `I ⊆ R` the following are equivalent: `(R, I)` is
henselian (Mathlib's `HenselianRing R I`); `I` lies in the Jacobson radical and every monic
polynomial with a simple root modulo `I` has a root lifting it; every finite `R`-algebra `S` has
`Idem(S) → Idem(S/IS)` bijective; every étale `R`-algebra with a section modulo `I` has a section;
for every integral `R`-algebra `S`, `(S, IS)` is henselian (Stacks, Lemma 15.11.6 (09XI)). Prove
*henselian_pair_permanence*: henselian pairs are stable under quotients, integral extensions, finite
products, filtered colimits, taking radicals, and passage to `(R, J)` for `J ⊆ I` radical-equivalent;
the pair `(R, I)` is henselian when `R` is `I`-adically complete, and permanence fails for
non-filtered colimits: the coproduct `(ℤ_p ⊗_ℤ ℤ_p, p)` of two copies of `(ℤ_p, (p))` is not henselian
(Stacks, Lemmas 15.11.2–15.11.4, 15.11.7–15.11.16, and Example 15.11.14 (0FWU)). Prove
*henselian_finiteEtale_equivalence*: for a henselian pair `(R, I)`, base change is an equivalence
from finite étale `R`-algebras to finite étale `R/I`-algebras (Stacks, Lemmas 15.13.1 (0D4A), 15.13.2
(09ZL)). Prove *henselian_local_finite_algebras*: for a henselian local ring `R`, every finite
`R`-algebra is a product of local rings, every quasi-finite `R`-algebra is a product of a finite
algebra and an algebra with empty closed fibre, and the three implications (8)⇒(10), (8)⇒(11),
(10)⇒(1) of Stacks, Lemma 10.153.3 (04GG), items (1), (8), (10), (11), (13). Prove
*henselian_smooth_lifting* (Elkik): for a henselian pair `(R, I)` and a smooth `R`-algebra `A`, every
`R`-algebra map `A → R/I` lifts to `A → R` (Stacks, Lemma 15.13.3 (0H74)). *Needs:* §0.12, §0.13;
Mathlib `HenselianRing`, `Algebra.Etale`, `Algebra.Smooth`, `Module.Finite`, `IsLocalRing`.

### 0.15 Néron–Popescu desingularization

Prove `popescu_desingularization`: a regular ring map `R → S` (§0.21) between Noetherian rings
exhibits `S` as a filtered colimit of smooth `R`-algebras (Stacks, Theorem 16.12.1 (07GC)); and the
corollary `popescu_colimit_of_geometricallyRegular`: for a ring map `R → S` between Noetherian rings,
`S` is a filtered colimit of smooth `R`-algebras whenever `S` is flat over `R` and all fibres are
geometrically regular. *Needs:* §0.21; Mathlib
`Algebra.Smooth`, `IsFiltered`.

### 0.16 Catenary and universally catenary rings

Define `Excellence.IsCatenary R`: for every pair of primes `p ⊆ q`, some natural number bounds the
length
`e` of every strict chain `p = p_0 ⊊ ⋯ ⊊ p_e = q`, and any two saturated chains from `p` to `q` have
the same length, a chain being saturated when no prime lies strictly between consecutive members
(Stacks, Definition 10.105.1 (00NI)). No Noetherian, local or dimension hypothesis. API:
`exists_length_le`, `length_eq_of_covBy`, *isCatenary_iff_of_isNoetherianRing* (for Noetherian `R`,
catenary iff every local ring `R_q` is catenary iff `height(q/p)` is additive along saturated
chains; the local criterion is Lemma 10.105.6 (0AUN), and height additivity is the codimension
additivity that characterises catenary spaces, Topology, Lemma 5.11.6 (02I6), transported to `R` by
Lemma 10.105.2 (02IH), which says `R` is catenary iff `Spec R` is), `of_ringEquiv`, `localization`
(Lemma 10.105.4 (00NJ)), `quotient` (Lemma 10.105.7 (00NK)), `of_isNoetherian_of_dim_le_one`,
*isCatenary_iff_forall_isMaximal* (catenary iff every `R_m` at a maximal ideal is; Lemma 10.105.6
(0AUN)), *isCatenary_iff_forall_minimalPrimes_quotient* (for Noetherian `R`, catenary iff `R/p` is
catenary for every minimal prime `p`; Lemma 10.105.8 (0AUP)). Define `Ring.IsUniversallyCatenary R`: `R` is Noetherian and every
finite-type `R`-algebra is catenary (Stacks, Definition 10.105.3 (00NL)); the Noetherian clause is
part of the predicate. API: `isNoetherianRing`, *isCatenary_of_finiteType*,
`isUniversallyCatenary_iff_mvPolynomial` (it suffices that every `R[x_1..x_n]` is catenary),
`of_essFiniteType`, `quotient`, `localization`, `of_finiteType_algebra`,
`isUniversallyCatenary_iff_forall_isMaximal_localization`. Prove
`cohenMacaulay_universallyCatenary`: a Cohen–Macaulay ring (§0.17) is universally catenary (Stacks,
Lemma 10.105.9 (00NM)). *Needs:* §0.17 (for the last theorem only); Mathlib `LTSeries`, `CovBy`,
`Ideal.height`, `Algebra.FiniteType`, `Algebra.FiniteType.iff_quotient_mvPolynomial`.

**Checks.**
- *IsCatenary.test_field*: every field is catenary (one prime).
- *IsCatenary.test_int*: `ℤ` is catenary: every saturated chain between `0` and `(p)` has length one.
- *IsCatenary.test_zero*: the zero ring is catenary (no primes).
- `IsUniversallyCatenary.test_field`, `test_int`: fields and `ℤ` are universally catenary.
- `IsUniversallyCatenary.test_dim_one_domain`: every Noetherian domain of dimension at most one is
  universally catenary: it is Cohen–Macaulay, and a Noetherian Cohen–Macaulay ring is universally
  catenary (Lemma 10.105.9 (00NM)).
- *IsCatenary.test_nagata*: the local domain `A[x]_{m'}` of §0.22, built from Nagata's local
  domain, is Noetherian and not catenary, so the predicate is not implied by Noetherianity.

*Lean:* `Excellence.IsCatenary`, used by `Excellence.IsExcellentRing` (§0.21). The universally
catenary predicate and the API above are specified in this README only.

### 0.17 Depth, Cohen–Macaulay modules and Serre's conditions

Define `Module.depth I M` for an ideal `I` and module `M` over a ring `R`: the supremum in `ℕ∞` of
the lengths `r` of sequences `f_1, …, f_r ∈ I` that are weakly `M`-regular (each `f_i` a
non-zero-divisor on `M/(f_1, …, f_{i−1})M`), and `IsLocalRing.depth M := depth m M` for a local ring
(Stacks, Definition 10.72.1 (00LI) for finite `M`, with the description by such sequences in Lemma
10.72.2 (0AUI); regular sequences are Definition 10.68.1 (00LF)); `depth 0 = ⊤`. API: `IsLocalRing.depth_eq_top_iff` (`M = 0`
exactly, for `M` finite over a Noetherian local `R`), `depth_le_supportDim` (for a **nonzero**
finite module `M` over a **Noetherian local** ring, `depth M ≤ dim Supp M`, with depth embedded
in `WithBot ℕ∞`; Stacks, Lemma 10.72.3 (00LK)),
`depth_eq_zero_iff` (`m ∈ Ass M`), `depth_eq_iff_ext` (`depth M = inf { i : Ext^i(κ, M) ≠ 0 }`),
`depth_quotSMulTop` (a regular element drops depth by one), `depth_localization_le`,
`depth_of_flat_baseChange`, `depth_eq_iff_koszul`. Define `Module.IsCohenMacaulay M` for a finite
module over a Noetherian local ring: `M = 0` or `depth M = dim Supp M`, and `Ring.IsCohenMacaulay R`
for Noetherian `R`: every `R_m` is Cohen–Macaulay over itself (Stacks, Definition 10.103.1 (00N3)
for the local case; Definition 10.103.12 (0AAH) asks this at every prime, and the two agree because
localising a Cohen–Macaulay module over a Noetherian local ring at a prime keeps it Cohen–Macaulay,
Lemma 10.103.11 (0AAG)). API: `isCohenMacaulay_iff_of_isLocalRing`, `localization` (Lemma 10.103.11
(0AAG)), `isCohenMacaulay_iff_forall_isMaximal` (Definition 10.103.12 (0AAH) with Lemma 10.103.11
(0AAG)), `isCohenMacaulay_quotSMulTop_iff` (for `x ∈ m` a non-zero-divisor on `M`, `M` is
Cohen–Macaulay iff `M/xM` is; Lemma 10.103.5 (0C6G)), `Ring.IsCohenMacaulay.of_isRegularRing`,
`IsCohenMacaulay.polynomial` (Lemma 10.103.13 (0AAI)), `IsCohenMacaulay.unmixed` (for a finite
Cohen–Macaulay module `M` over a **Noetherian local** ring `R` and `p ∈ Ass M`,
`dim(R/p) = dim Supp M`, and `p` is minimal in the support; Lemma 10.103.7 (0BUS)),
`IsCohenMacaulay.height_add_dim` (for a **Noetherian local Cohen–Macaulay** ring `R` and a prime
`p`, `height p + dim(R/p) = dim R`; Lemma 10.103.10 (0AAF)). For the same local-ring hypotheses,
every maximal prime chain has length `dim R` (Lemma 10.103.9 (0AAE)). For a general Noetherian
Cohen–Macaulay ring apply these results in its localizations; they impose no common global
dimension on its components. API also includes `IsCohenMacaulay.of_regularSequence` (for an `M`-regular sequence
`f_1, …, f_r` in `m`, `M` is Cohen–Macaulay when `M/(f_1, …, f_r)M` is; Lemma 10.103.5 (0C6G)
applied `r` times). Define
`Module.SatisfiesSerreS n M` for a finite module over a Noetherian ring: for every prime `p`,
`depth_{R_p} M_p ≥ min(n, dim Supp M_p)`, with `depth 0 = ⊤` and `dim ∅ = ⊥`, so primes outside the
support impose nothing (Stacks, Definition 10.157.1 (031P)); and `Ring.SatisfiesSerreR n R`: `R_p` is
regular for every prime of height `≤ n`. API: `satisfiesSerreS_zero`, `mono` (in `n`),
`isCohenMacaulay_iff_forall_satisfiesSerreS` (from Definitions 10.103.12 (0AAH) and 10.157.1
(031P), using the depth bound for nonzero localizations (Lemma 10.72.3 (00LK)) and treating
zero localizations by the separate zero-module convention),
`satisfiesSerreS_one_iff` (no embedded primes; Lemma 10.157.2 (031Q)),
`satisfiesSerreS_two_iff_hartogs` (used by §0.6: for a finite `M` over a Noetherian `R` with
`Supp M = Spec R` and satisfying `(S_1)`, `M` satisfies `(S_2)` iff for every closed `Z ⊆ Spec R`
all of whose points have height `≥ 2` the restriction `M → Γ(Spec R ∖ Z, M~)` is bijective; nonzero
torsion-free modules over a Noetherian domain, the case §0.6 uses, satisfy both hypotheses. The
support hypothesis excludes `M = R/(x)` over `R = k[x, y, z]`, which is `(S_2)` with depth `1` at
`(x, y)` because `(x, y)` has height two in `Spec R` but height one in `Supp M = V(x)`, and `(S_1)`
excludes `R = M = k[x, y]/(x², xy)`, whose embedded prime `(x, y)` has height one and so lies in no
closed set of codimension `≥ 2`. Forwards, `(S_2)` and `Supp M = Spec R` give depth `≥ 2` at the
points of `Z`, so sections extend across it by Divisors, Lemma 31.5.11 (0E9I); conversely, for `p`
of height `≥ 2` take `Z = V(p)`: the exact sequence
`0 → H^0_Z(M) → M → Γ(Spec R ∖ Z, M~) → H^1_Z(M) → 0` of Local Cohomology, Lemma 51.2.2 (0DWR),
gives `H^0_Z(M) = H^1_Z(M) = 0`, and localising at `p` and reading depth as the first non-vanishing
local cohomology, Dualizing Complexes, Lemma 47.11.1 (0AVZ), gives `depth M_p ≥ 2`, while primes of
height `≤ 1` are covered by `(S_1)`), `SatisfiesSerreR.mono`, `isReduced_iff_R0_S1` (Lemma 10.157.3
(031R)), `SatisfiesSerreS.localization` (immediate from Definition 10.157.1 (031P): the
localisations of `M_p` at primes are localisations of `M`). *Needs:* Mathlib
`RingTheory.Sequence.IsWeaklyRegular`, `IsRegular`, `Module.support`, `Module.supportDim`,
`Ideal.height`, `IsRegularLocalRing`, `Ext`.

Prove the depth lemmas used to extend modules across a closed subset of depth `≥ 2`. Here `R` is
Noetherian, each lemma states which modules are finite, as in Stacks, and the depth of a
localization `M_p` is `IsLocalRing.depth` of `LocalizedModule p.primeCompl M` over
`Localization.AtPrime p`.
`depth_shortExact` (Algebra, Lemma 10.72.6 (00LX)): for a short exact sequence
`0 → N' → N → N'' → 0` of nonzero finite modules over a Noetherian local ring,
`depth N ≥ min (depth N') (depth N'')`, `depth N'' ≥ min (depth N) (depth N' − 1)` and
`depth N' ≥ min (depth N) (depth N'' + 1)`. `depth_hom_ge` (More on Algebra, Lemma 15.24.10 (0AV5)):
over a Noetherian local ring and finite modules `M` and `N`, for `n ≤ 2`, `n ≤ depth N` implies
`n ≤ depth (M →ₗ[R] N)`. `injective_of_forall_localization` (Lemma 15.24.12 (0AV7)): an `R`-linear
map `φ : M → N`, with no finiteness hypothesis, is
injective if at every prime `p` either `φ_p` is injective or `p ∉ associatedPrimes R M`.
`bijective_of_depth` (Lemma 15.24.13 (0AV8)): an `R`-linear map `φ : M → N` with `M` finite is
bijective if at every prime `p` either `φ_p` is bijective, or `2 ≤ depth M_p` and
`p ∉ associatedPrimes R N`. `depth_eq_iInf_localization_maximal` (Algebra, Lemma 10.72.11
(0AUK)): for a finite ring map `R → S` with `R` Noetherian local and a finite `S`-module `N`,
`Module.depth (maximalIdeal R) N` is the minimum of `depth N_𝔫` over the finitely many maximal
ideals `𝔫` of `S`. `depth_eq_add_of_flat` (Lemma 10.163.2 (0337)): for a flat local homomorphism
`R → S` of Noetherian local rings, `depth S = depth R + depth (S ⧸ (maximalIdeal R).map (algebraMap R S))`,
where the last term is `IsLocalRing.depth` of the quotient as an `S`-module (it equals the depth of
the quotient local ring over itself).
*Needs:* the depth API above; Mathlib `associatedPrimes`, `LocalizedModule`, `Module.Flat`,
`IsLocalHom`, `Module.Finite`.

**Checks.**
- `IsLocalRing.depth.test_residueField`: for a Noetherian local ring `R` of positive dimension,
  `depth κ = 0`.
- `IsLocalRing.depth.test_zero`: the zero module has depth `⊤`; a definition built on "regular
  sequences of maximal length" rather than the supremum would give `0`. Its support dimension is
  `⊥`, so it is excluded from `depth_le_supportDim`.
- `cohenMacaulay_product_dimensions`: `R = k × k[t]` is regular and globally Cohen–Macaulay,
  but its associated minimal primes have quotient dimensions `0` and `1`. For
  `p = 0 × k[t]`, `height p + dim(R/p) = 0 < dim R = 1`; the two components have maximal chains
  of lengths `0` and `1`. Thus the local dimension conclusions do not hold globally.
- `cohenMacaulay_regular_local_dimensions`: in `R = k[x,y]_(x,y)`, depth is `2`, the only
  associated prime is `(0)`, `height(x) + dim(R/(x)) = 1 + 1 = 2`, and every maximal prime chain
  has length `2`.
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
- `bijective_of_depth.test_maximal_ideal`: for `R = k[x, y]` and the inclusion `𝔪 = (x, y) → R`,
  the map is bijective at every prime other than `𝔪`, and `depth 𝔪_𝔪 = 1`; it is not surjective,
  so the bound `2` in `bijective_of_depth` cannot be lowered to `1`.
- `depth_hom_ge.test_dual_maximal`: for `R = k[x, y]_{(x, y)}`, `Hom_R(𝔪, R) = R`, of depth `2`, as
  `depth_hom_ge` predicts from `depth R = 2`.
- `depth_eq_add_of_flat.test_polynomial`: for `R = k[x]_{(x)}` and `S = k[x, y]_{(x, y)}`,
  `depth S = 2 = depth R + depth (S ⧸ x S)`.

### 0.18 Scheme-theoretic support and Cohen–Macaulay schemes

Prove `coherent_scheme_support`: for a finite-type quasi-coherent `F` on `X`, the support is closed,
the annihilator ideal sheaf `Ann(F)` is quasi-coherent, and the scheme-theoretic support
`V(Ann F)` is the smallest closed subscheme `Z` such that `F` is the pushforward of a module on `Z`
(Stacks, Lemmas 29.5.1 (056I), 29.5.3 (056J), 29.5.4 (05JU), Definition 29.5.5 (05JV)). Define
`Scheme.Modules.IsCohenMacaulay F` for a coherent `F` on a locally Noetherian `X`: for every `x` in
the support, `depth_{O_{X,x}} F_x = dim Supp F_x`; and `Scheme.IsCohenMacaulay X := IsCohenMacaulay
O_X` (Stacks, Definition 28.8.1 (02IO)). Equivalently, `X` is locally Noetherian and each stalk
admits a regular sequence of length its Krull dimension (Stacks, §10.104).
API: `isCohenMacaulay_iff_forall_satisfiesSerreS`,
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
10.161.1 (032F)). API: *IsJapanese.isN1*, *isJapanese_iff_isN1_of_charZero* (for Noetherian domains
whose fraction field has characteristic zero; Lemma 10.161.11 (032M)),
*isJapanese_iff_purelyInseparable* (for a Noetherian domain whose fraction field has characteristic
`p > 0` it suffices to test purely inseparable `L`; Lemma 10.161.12 (032N)),
`of_isIntegrallyClosed_charZero`, *IsJapanese.localization* (Lemma 10.161.3 (032G)),
*IsJapanese.of_finite_extension* (a finite, more generally quasi-finite, extension domain of a
Noetherian N-2 domain is N-2; Lemma 10.161.5 (032I)), *IsJapanese.polynomial* (Lemma 10.161.13
(032O)), *isJapanese_of_dedekind_charZero* (in characteristic zero every finite extension of the
fraction field is separable, so Lemma 10.161.8 (032L) applies to the Noetherian normal domain;
equivalently Lemma 10.161.11 (032M), as a Dedekind domain is N-1),
`Ring.IsJapanese.of_complete_local` (a complete Noetherian local domain is Japanese; Lemma 10.162.8
(032W)), `IsN1.test_isIntegrallyClosed`. The N-1 local criterion is Lemma
10.161.15 (0333). Define `Ring.IsUniversallyJapanese R`:
every finite-type `R`-algebra that is a domain is N-2; `Ring.IsNagata R`: `R` is Noetherian and
`R/p` is N-2 for every prime `p` (Stacks, Definition 10.162.1 (032R)); the Nagata predicate includes
Noetherianity and universally Japanese does not. API: *IsNagata.isNoetherianRing*,
*isNagata_iff_isUniversallyJapanese* (for Noetherian rings; Proposition 10.162.15 (0334)),
*IsNagata.of_finiteType* (Proposition 10.162.16 (0335)), *IsNagata.localization* (Lemma 10.162.6
(032U)), *IsNagata.quotient* (a quotient map is finite, so Lemma 10.162.5 (032T) applies),
`Ring.IsNagata.of_complete_local` (a complete Noetherian local ring is Nagata; Lemma 10.162.8 (032W)),
*isNagata_of_field*, *IsNagata.polynomial*, *isNagata_iff_of_span_eq_top* (for `f_1, …, f_n`
generating the unit ideal, `R` is Nagata iff every `R_{f_i}` is; Lemmas 10.162.6 (032U) and 10.162.7
(032V)), *IsNagata.integralClosure_finite* (for `R` Nagata and `R → S` essentially of finite type
with `S` reduced, the integral closure of `R` in `S` is finite over `R`; Lemma 10.162.2 (03GH)), and
Example 10.162.17 (09E1) as *IsNagata.not_nonJapaneseDVR*: a discrete valuation ring is Nagata iff
it is N-2, so the non-Japanese discrete valuation ring of §0.22 is not Nagata. The two complete-local statements are the suppliers of finite
normalization in inseparable extensions used by IntegralHeckeAndGaloisDeterminants. Prove
`Excellence.IsQuasiExcellentRing.isNagata`: quasi-excellent rings are Nagata (Stacks, Lemma 15.53.5
(07QV)). Prove
`nagata_normalization_finite`: for `X` integral and Nagata (every affine open ring Nagata), the
normalisation of `X` in a finite extension of its function field is finite over `X` (Stacks, Lemma
29.54.14 (0AVK)). *Needs:* Mathlib `integralClosure`, `IsIntegralClosure`, `FractionRing`,
`IsPurelyInseparable`, `Module.Finite`, `Algebra.FiniteType`, `IsNoetherianRing`; Tau Ceti
`TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `finite_of_injective`.

**Checks.**
- *IsJapanese.test_field*, `test_int`: fields and `ℤ` are N-2.
- `IsN1.test_isIntegrallyClosed`: every integrally closed domain is N-1 (closure equals `R`).
- *IsJapanese.test_not_japanese_dvr*: the DVR of §0.22 is N-1 (integrally closed) and not N-2.
- *IsNagata.test_field*, `test_int`: fields and `ℤ` are Nagata (`ℤ/p` is a field for `p ≠ 0`).
- *IsNagata.test_zero*: the zero ring is Nagata: Noetherian with no primes.
- *IsNagata.test_not_noetherian*: the polynomial ring `MvPolynomial ℕ ℚ` in countably many
  variables is not Nagata, because it is not Noetherian.
- `IsUniversallyJapanese.test_not_noetherian`: write `E` for the subring of eventually
  constant `𝔽₂`-valued sequences from §0.10. It is universally Japanese but not Noetherian,
  hence not Nagata. Indeed, `e² = e` for every `e ∈ E`, so a unital map from `E` to a domain
  `D` has image exactly `𝔽₂`: the only idempotents in a domain are `0` and `1`. If `D` is
  finite type over `E`, the same generators make it finite type over `𝔽₂`. It is therefore
  Nagata and Japanese by [Stacks, Proposition 10.162.16
  (0335)](https://stacks.math.columbia.edu/tag/0335). The ideal of finitely supported
  sequences is not finitely generated, as in §0.10, which proves the non-Noetherian claim.
- `IsUniversallyJapanese.test_countable_cusp`: for any field `k`, put
  `P = k[x_i | i ∈ ℕ]`, `T = k[t_i | i ∈ ℕ]` and `R = k[t_i², t_i³ | i ∈ ℕ] ⊆ T`.
  The map `P → R` taking `x_{2i}` to `t_i²` and `x_{2i+1}` to `t_i³` is surjective, so
  `R` is a finite-type domain algebra over `P`. Its normalisation is `T`, which is not
  finite over `R`; thus `R` is not N-1 or Japanese, and `P` is not universally Japanese
  ([Stacks, Definitions 10.161.1 (032F)](https://stacks.math.columbia.edu/tag/032F)
  and [10.162.1 (032R)](https://stacks.math.columbia.edu/tag/032R)). To identify the
  normalisation, use `t_i = t_i³/t_i²` to identify the fraction fields and the monic
  equation `Z² − t_i²` to see that each `t_i` is integral over `R`. The ring `T` is
  integrally closed: a fraction and an integral equation over `T` involve finitely many
  variables, where the polynomial ring over `k` is integrally closed. Hence the elements
  of the common fraction field integral over `R` are exactly `T`. If finitely many
  polynomials generated `T` as an `R`-module, choose `j` outside all their variable
  supports and set every `t_i` with `i ≠ j` to zero. Their images would be scalars and
  the image of `R` would be `k[t_j², t_j³]`, forcing `t_j` into that subring. Its elements
  have zero coefficient of degree one, a contradiction. The quotient map is finite type
  regardless of whether its kernel is finitely generated. Writing `P` as a union of
  finite-variable polynomial rings therefore does not establish universal Japanese-ness:
  [Stacks, Lemma 10.162.4 (032S)](https://stacks.math.columbia.edu/tag/032S) gives stability
  under finite-type algebras, not arbitrary filtered unions.
- `IsN1.test_finite_cusps`: for a field `k` and `r ∈ ℕ`, let
  `R_r = k[t_1², t_1³, …, t_r², t_r³] ⊆ T_r = k[t_1, …, t_r]`. The same fraction-field
  and integrality calculation identifies `T_r` as the normalisation of `R_r`. It is
  generated over `R_r` by the `2^r` monomials `∏_{i=1}^r t_i^{ε_i}`, with each
  `ε_i ∈ {0, 1}`: remove even powers from each exponent into the coefficient ring.
  At `r = 0` both rings are `k` and the generating family is `{1}`; at `r = 1` it is
  `{1, t_1}`. Thus `R_r` is N-1, and it is also Japanese since it is finite type over
  `k` (Stacks, Proposition 10.162.16 (0335)). The countable case fails because no single
  finite family generates its normalisation.

*Lean:* `Ring.IsJapanese`, `Ring.IsNagata`, `Ring.IsJapanese.of_complete_local`,
`Ring.IsNagata.of_complete_local`, with the field case of *IsJapanese.test_field* and
*IsNagata.test_not_noetherian* as `example`s; `Excellence.IsQuasiExcellentRing.isNagata` is in the
strand of §0.21. The N-1 and universally Japanese predicates, the rest of the API and
`nagata_normalization_finite` are specified in this README only.

### 0.21 Regular maps, G-rings, J-2 rings, excellent rings and schemes

The definitions of this subsection form the strand `Excellence` of `Suggested.lean`; the API
lemmas and the scheme-level predicates are specified in this README only. Define
`GeometricallyRegular k B` for a field `k` and `k`-algebra `B`: `B` is Noetherian and `L ⊗_k B` is
regular (`IsRegularRing`) for every finite purely inseparable extension `L/k` (Stacks, Definition
10.166.2, Lemma 10.166.1), with *GeometricallyRegular.regular*, `.finite_extension` (then `L ⊗_k B`
is regular for every finite `L/k`), `.algEquiv`. Define `RegularAlgebraMap R B`: `B` is flat over `R`
and for every prime `p` the fibre `κ(p) ⊗_R B` is geometrically regular over `κ(p)` (Stacks,
Definition 15.42.1), with `.flat`, `.fibre`, `.field_iff` (for `R` a field, a regular algebra is a
geometrically regular one; Lemma 15.42.6). Prove `regular_map_completion`: regular ring maps
between Noetherian rings preserve reducedness and normality (a regular `R → S` with `R` and `S`
Noetherian and `R` reduced, respectively normal, has `S` reduced, respectively normal), and for a
local G-ring `A` the map `A → Â` is regular (Stacks, Lemmas 15.43.1 (07QK), 15.43.2 (0BFK), 15.43.3
(0H7S), 15.43.4 (0H7T)). Define
`regularLocus R := { p : regular R_p }` (Stacks, §15.48 opening) with `mem_regularLocus`,
*regularLocus_eq_univ* (for regular `R`), *regularLocus_ringEquiv*; it need not be open. Define
`IsGRing R`: `R` is Noetherian and for every prime `p` the canonical `R_p`-algebra
`AdicCompletion (m_p) R_p` is a regular algebra map (Stacks, Definition 15.51.1), with `.noetherian`,
`.completion_regular`, `.ringEquiv`, *IsGRing.localization*, *IsGRing.of_finiteType* (Propositions
15.51.6, 15.51.12). Define `IsJ2 R`: `R` is Noetherian and the regular locus of every finite-type
`R`-algebra is open, quantified over all finite-type algebras and not only `R` or its localisations
(Stacks, Definition 15.48.1 (3)), with `.noetherian`, `.regularLocus_open`, `.ringEquiv`,
*IsJ2.of_finiteType*, *IsJ2.localization*. Define `IsQuasiExcellentRing R := IsGRing R ∧ IsJ2 R`
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
- *GeometricallyRegular.test_field*: `k` over itself; `test_zero`: the zero `k`-algebra is
  geometrically regular; `test_dual_numbers`: `k ⋉ k` is not (not reduced); `test_inseparable`: for
  `L = k(a^{1/p})` over imperfect `k`, `L` is regular but `L ⊗_k L` is not, so `L` is not
  geometrically regular over `k`.
- *RegularAlgebraMap.test_identity*: `R` over itself; `test_zero`: `R → R/(1)`;
  `test_flat_not_regular`: `k ⋉ k` is flat over `k` but its fibre is not regular.
- *regularLocus.test_field*, `test_zero` (`Spec` of the zero ring is empty), `test_dual_numbers`
  (empty locus).
- *IsGRing.test_field*, `test_zero`, `test_complete_local` (a complete Noetherian local ring is a
  G-ring); *IsJ2.test_field*, `test_zero`, `test_singular_allowed` (`k ⋉ k` is J-2 with empty regular
  locus); *IsQuasiExcellentRing.test_field*, `test_zero`, `test_nilpotents_allowed`;
  *IsExcellentRing.test_field*, `test_zero`, `test_integers`, `test_nilpotents_allowed`,
  `test_complete_local`.
- `IsQuasiExcellentScheme.test_spec` (`Spec R` is quasi-excellent iff `R` is), `test_field`,
  `test_zero`; `IsExcellentScheme.test_spec`, `test_field`, `test_empty`, `test_nonreduced`
  (`Spec (k ⋉ k)` is excellent).

*Lean:* `Excellence.GeometricallyRegular`, `Excellence.RegularAlgebraMap`, `Excellence.regularLocus`,
`Excellence.IsGRing`, `Excellence.IsJ2`, `Excellence.IsQuasiExcellentRing`,
`Excellence.IsExcellentRing`, `Excellence.IsQuasiExcellentRing.isNagata`; the inseparable
geometric-regularity Check and the excellent-ring Checks `test_integers` and `test_complete_local`
are `example`s.

**Negative Checks for the excellence predicates.**
For a field `k`, `k[x₀,x₁,…]` is not Noetherian: the ascending chain of ideals
`(x₀,…,x_n)` does not stabilize. It therefore fails each of `IsGRing`, `IsJ2`,
`IsQuasiExcellentRing` and `IsExcellentRing`, as all four definitions include the
Noetherian condition. These also give negative controls for the affine scheme predicates.

### 0.22 Two counterexamples

Prove `nonJapaneseDVR`: there is a discrete valuation ring of characteristic `p` that is regular,
universally catenary and not Japanese (Stacks, Example 10.119.5 (00PB): `k[[t]]`-like rings whose
fraction field has an inseparable extension with non-finite integral closure); and
`nagata_nonCatenary`: a Noetherian local domain that is not catenary, built from Nagata's
two-dimensional Noetherian local domain `A`, which is catenary but not universally catenary: `A`
has a finite extension `B` generated by one element, so `B = A[x]/p` for a prime `p`; for the
maximal ideal `m'` of `A[x]` corresponding to the maximal ideal of `B` with one-dimensional local
ring, the localisation `A[x]_{m'}` has dimension `3` and the maximal chain of primes
`(0) ⊂ p ⊂ m'` of length `2` (Stacks, Examples, Section 110.19 (02JE)). Both are counterexamples that the predicates of §§0.16 and 0.20
reject; they are specified in this README only. *Needs:* §0.16, §0.20.

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
(04DF)). CommRingFactorizationSystems F2 / `CommRingCat.WeakNormalization.univHomeo`
(by JakobScholbach) supplies the affine criterion. This subsection owns the scheme criterion and
*universalHomeomorphism_affineComparison*: reverse arrows under `Spec` and identify field-valued
universal injectivity with the scheme property. The same comparison transports
CommRingFactorizationSystems F2 / `CommRingCat.WeakNormalization.univHomeo_of_surjective_of_isNilpotent_ker`
to the affine case of `of_isThickening` for a surjection with elementwise nil kernel; no uniform
nilpotence exponent is required. Nonaffine gluing and the scheme-level API are owned here.
The topological invariance of the small étale site is constructed in §0.23a from this
subsection's geometry, without finiteness or invertibility hypotheses.
*Needs:* Mathlib
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

### 0.23a Étale topological invariance

For every universal homeomorphism `f : X → Y`, construct
`universalHomeomorphismEtaleEquivalence f : Y.Etale ≌ X.Etale` on Mathlib's categories of
schemes étale over the base. Its forward functor is `smallEtaleBaseChange f`, the scheme
pullback functor: an object `V → Y` goes to `V ×_Y X → X`. Prove full faithfulness and
essential surjectivity for all étale objects, and identify both the forward and inverse
functors as cover-preserving for `Scheme.smallEtaleTopology`. In particular, jointly
surjective families correspond to jointly surjective families; this is an equivalence of
sites, with the specified base-change functor, unit and counit.

The only geometric hypothesis is that `f` is a universal homeomorphism, in the sense of
§0.23. There is no Noetherian, finite-type, reducedness or coefficient restriction. Give the
canonical identity comparison and, for universal homeomorphisms `X → Y → Z`, the comparison
between pullback along the composite and successive pullbacks. For every `Y' → Y`, write
`X' = X ×_Y Y'`, `f' : X' → Y'` and `g_X : X' → X`. Construct the natural isomorphism
between the functors `g_X* ∘ f*` and `f'* ∘ g*`; §0.23 gives the universal-homeomorphism
hypothesis for `f'`. Require the identity, associativity and composite-base-change coherence
laws for these comparisons, including compatibility with the unit and counit of the
equivalences. Sheaf transport of constants, module coefficients, stalks, sections and
cohomology belongs to EtaleCohomologyFoundations.

*Source:* Stacks, §59.45 [Topological invariance of the small étale site](https://stacks.math.columbia.edu/tag/04DY),
Theorems 59.45.1–59.45.2 ([04DZ](https://stacks.math.columbia.edu/tag/04DZ)); the covering
condition is joint surjectivity and is preserved and reflected by universal homeomorphisms.

*Needs:* §0.23; Mathlib `AlgebraicGeometry.Scheme.Etale`, `Scheme.smallEtaleTopology`,
`Scheme.smallEtalePretopology`, `MorphismProperty.Over.pullback`,
`CategoryTheory.Equivalence`, `CategoryTheory.CoverPreserving`, scheme pullbacks and their
canonical comparison isomorphisms.

**Checks.**

- A nilpotent thickening induces the equivalence on all étale objects and preserves and
  reflects jointly surjective covers; the argument must also allow an elementwise nil ideal
  without a uniform nilpotence exponent.
- The normalization `Spec k[t] → Spec k[t², t³]` of the cusp induces the equivalence, even
  though the normalization map is not an isomorphism.
- The normalization of a nodal curve in characteristic different from two has two points
  over the node and fails the universal-homeomorphism hypothesis.
- `Spec 𝔽_{p²} → Spec 𝔽_p` is a homeomorphism of underlying one-point spaces but does not
  induce this equivalence: its self-product has two points. Ordinary homeomorphism is
  insufficient.
- Base-change a thickening along an arbitrary morphism and then along a second one. The two
  routes give the same comparison on étale objects and covers; with identity base change the
  comparison is the unit comparison.

*Lean:* `smallEtaleBaseChange`, `smallEtaleBaseChange_isEquivalence`,
`universalHomeomorphismEtaleEquivalence`,
`universalHomeomorphismEtaleEquivalence_functor`,
`universalHomeomorphismEtaleEquivalence_coverPreserving`,
`universalHomeomorphismEtaleEquivalence_id`, `universalHomeomorphismEtaleEquivalence_comp`,
`universalHomeomorphismEtaleEquivalence_baseChange` (the three comparison-isomorphism
prototypes assert existence with their projection characterizations; the comparison data
and coherence are the targets above).
The nil-kernel, cusp, node, quadratic-field and successive-base-change controls are `example`s.

### 0.24 Perfect schemes and perfection

Let `p` be a prime. The absolute Frobenius `F_X : X → X` is constructed in
§0.29 / `absoluteFrobenius`; its arbitrary
characteristic-`p` scheme domain includes every scheme over `𝔽_p` used here.
Define `Scheme.IsPerfect X` for `X` over `𝔽_p`: `F_X` is an
isomorphism (Bhatt–Scholze 2017, Definitions 3.1, 3.2, p. 10). API: `isPerfect_iff_perfectRing`
(affine-locally, `PerfectRing` of the section rings), `IsPerfect.isReduced`, `IsPerfect.pullback`
(fibre products of perfect schemes over a perfect scheme), `IsPerfect.of_etale` (étale over a
perfect scheme), `IsPerfect.of_isOpenImmersion`. Define `Scheme.perfection X` for an `𝔽_p`-scheme:
the limit of `⋯ → X → X → X` along `F_X`, affine-locally `Spec (PerfectClosure A p)`, with
`perfection.toScheme : X^perf → X` and `perfection_isPerfect` (Bhatt–Scholze 2017, Definition 3.1,
proofs of Lemma 3.4 and Proposition 3.13, pp. 11, 13). Prove `perfection_universalHomeomorphism`:
`X^perf → X` is a universal homeomorphism, and perfection is right adjoint to the inclusion of
perfect schemes, so `Hom(Y, X^perf) = Hom(Y, X)` for perfect `Y` and `X ↦ X^perf` is an equivalence
of small étale sites (Bhatt–Scholze 2017, Theorem 3.7, universal-homeomorphism invariance). Prove
`perfection_reflects`: quasi-compactness, quasi-separatedness, affineness,
separatedness, integrality, universal closedness and being a universal homeomorphism
are equivalent for a morphism and its perfection (Bhatt–Scholze 2017, Lemma 3.4
(i)–(vii)). `perfection_preserves` additionally preserves closed immersions, open
immersions, immersions, étale maps and (faithful) flatness, without asserting the
converses (Lemma 3.4 (viii)–(xii)). For étale maps the perfection square is cartesian
(the proof of (xi)); finite étale preservation follows also from integrality.
The equivalence of small étale sites is Theorem 3.7, applying the unrestricted universal-homeomorphism
equivalence to `perfection.toScheme`. *Needs:* §0.23;
§0.29 / `absoluteFrobenius`;
§0.23a / `universalHomeomorphismEtaleEquivalence`; Mathlib
`PerfectRing`, `PerfectClosure`, `IsReduced`, `Limits`.

**Checks.**
- `perfection_dual_numbers_not_immersion`: `Spec 𝔽_p[ε]/(ε²) → Spec 𝔽_p`
  perfects to identity, but is not an immersion: its ring map is not surjective.
  Thus neither immersions nor closed immersions belong in the reflected list.
- `isPerfect_Spec_perfection_polynomial`: `Spec (PerfectClosure (𝔽_p[t]) p)` is perfect.
- `isPerfect_empty`: the empty scheme is perfect.
- `not_isPerfect_affineLine`: `𝔸¹_{𝔽_p}` is not perfect (`t` has no `p`-th root).
- `perfection_affineLine`: `(𝔸¹)^perf = Spec 𝔽_p[t^{1/p^∞}]`, with `perfection.toScheme` a
  universal homeomorphism that is not an isomorphism.

### 0.25 Perfectly finitely presented and perfectly proper morphisms

Define `RingHom.PerfectlyFinitePresentation g` for `g : B → A` between perfect `𝔽_p`-algebras: there
is a finitely presented `B`-algebra `A_0` with `(A_0)^perf ≅ A` over `B`.
Define `LocallyPerfectlyFinitelyPresented f` on arbitrary perfect schemes: affine-locally on
`Y` and then on `X`, the ring maps are pfp. Define `PerfectlyFinitelyPresented f` to require this
local property and quasi-compact quasi-separated `X,Y`. On this qcqs category it is exactly
Bhatt–Scholze 2017, Definition 3.10 and Proposition 3.11 (last sentence and footnote 6), p. 12.
The local property is stable under composition and base change and holds for étale maps and
open immersions; prove its equivalence with the global predicate when `X,Y` are qcqs.
Every global pfp API result below carries that qcqs scope, including the source and target of
base changes. API: `PerfectlyFinitelyPresented.perfection` (the
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
`PerfectlySmoothOfRelativeDimension d f` at every point (van Hoften 2024, §2.1.2, (2.1.2), p. 8).
Define `WeaklyPerfectlySmoothAt d f x`: there are an open `U ∋ x` of `X`, a perfect scheme `W`, an
integer `e ≥ 0` and a surjective `g : W → U` perfectly smooth of relative dimension `e` such that
`f|_U ∘ g : W → Y` is perfectly smooth of relative dimension `d + e`; and
`WeaklyPerfectlySmoothOfRelativeDimension d f` at every point (van Hoften 2024, Definition 2.1.9,
p. 10). API: `PerfectlySmoothOfRelativeDimension.perfection` (the perfection of a smooth
morphism of relative dimension `d` is perfectly smooth of relative dimension `d`; van Hoften 2024,
Example 2.1.3, p. 8), `etale_iff` (`d = 0` is étale), `comp`, `baseChange`,
`weaklyPerfectlySmooth_of_perfectlySmooth` (take `g = 𝟙`, `e = 0`). The converse implication is not
part of this target. Prove `perfectlySmooth_properties`: on arbitrary perfect schemes, perfectly
smooth morphisms are locally perfectly finitely presented, flat and open. For
`PerfectlySmoothOfRelativeDimension d f`, all fibres are pure of dimension `d` (the empty fibre
satisfies this vacuously, as in Tau Ceti's `IsPureDimensional`); every nonempty fibre has dimension
`d`. If **both `X,Y` are quasi-compact quasi-separated**, the local finiteness conclusion gives
`PerfectlyFinitelyPresented f` of §0.25. These conclusions use the étale local charts above,
§0.24's preservation results and §0.25's local/global comparison, without deducing
quasi-compactness from smoothness. Define `wittScheme n X` for a perfect `𝔽_p`-scheme
`X` and `n ≥ 1`: the scheme with underlying space `|X|` and structure sheaf `W_n(O_X)`, with `wittScheme_affine` (`Spec W_n(A)`)
and `wittScheme_one` (`W_1 X = X`) (Bhatt–Scholze 2017, Section 4 opening, p. 15). Define
`Scheme.IsWeaklyNormal X` for a reduced scheme of finite type over a perfect field `k` of
characteristic `p`: every finite birational universal homeomorphism `Y → X` with `Y` reduced is an
isomorphism (Zhu 2017, §A.2.1, p. 49). API: `isWeaklyNormal_iff_pClosed` (`O_X` is closed under
`p`-th roots of elements of its total fraction ring that lie in the normalisation), `of_normal`,
`restrict` (to opens). Prove `weaklyNormal_model`: for a pfp perfect scheme `X` over perfect `k`, fix,
for each generic point `η_i`, a finitely generated `k`-subfield `K_i ⊆ κ(η_i)`
whose perfection is `κ(η_i)`. There is a weakly normal finitely presented model
with these embedded generic fields. It is unique with its identification of
perfection and these embeddings; its structure sheaf consists of sections whose
generic values lie in the `K_i`. Morphisms descend when their generic maps descend
to the chosen fields, as expressed by Zhu 2017, Proposition A.15, (A.2.1)–(A.2.2).
Corollary A.16 concerns separated universal homeomorphisms of pfp perfect spaces,
not uniqueness after forgetting the generic-field data. Prove
`frobenius_factors_through_universalHomeomorphism`: for `g : Y → X` a finite universal
homeomorphism of `𝔽_p`-schemes of finite type, some power of `F_X` factors through `g`
(Bhatt–Scholze 2017, proof of Proposition 11.41, p. 53). *Needs:* §0.23, §0.24, §0.25;
§0.29 / `absoluteFrobenius`,
`iteratedSchemeFrobenius`, on the characteristic-`p` schemes used here;
Mathlib `Etale`, `AffineSpace`, `WittVector`, `IsReduced`, `IsFinite`.

**Checks.**
- `weaklyNormal_frobenius_twist`: over `k = F̄_p`, choose an elliptic curve with
  `j^p ≠ j`. It and its Frobenius twist are smooth weakly normal models with
  isomorphic perfections but different `j`-invariants. The generic-field embeddings
  in `weaklyNormal_model` distinguish these choices.
- `perfectlySmooth_affineSpace`: `(𝔸²)^perf → (𝔸¹)^perf`, the perfection of a coordinate
  projection, is perfectly smooth of relative dimension `1`.
- `perfectlySmooth_infinite_coproduct`: `⨿_(n ∈ ℕ) Spec 𝔽_p → Spec 𝔽_p` is étale and perfectly
  smooth of relative dimension zero, locally pfp, flat and open. Its source is not quasi-compact,
  so it is not globally pfp and has no finitely presented model; perfection preserves topology.
- `perfectlySmooth_finite_coproduct`: for a finite set `I`, the fold map
  `⨿_(i ∈ I) Spec 𝔽_p → Spec 𝔽_p` is perfectly smooth of dimension zero and globally pfp,
  with itself as model.
- `perfectlySmooth_empty_fibre`: the inclusion of one component in
  `Spec 𝔽_p ⊔ Spec 𝔽_p` is perfectly smooth of dimension zero and globally pfp. Its fibre over
  the other component is empty, of dimension `⊥`, and is pure of dimension zero vacuously.
- `perfectlySmooth_id`: identities and étale morphisms of perfect schemes are perfectly smooth of
  relative dimension `0`.
- `not_perfectlySmooth_origin`: the closed immersion `Spec 𝔽_p → (𝔸¹)^perf` is not perfectly
  smooth of any dimension (not flat).
- `weaklyPerfectlySmooth_affineSpace`: the perfected projection `(𝔸²)^perf → (𝔸¹)^perf` is weakly
  perfectly smooth of relative dimension `1`, witnessed both by `g = 𝟙` with `e = 0` and by the
  perfected projection `g : (𝔸³)^perf → (𝔸²)^perf` with `e = 1`, the composite being perfectly
  smooth of relative dimension `2`.
- `not_weaklyPerfectlySmooth_origin`: `Spec 𝔽_p → (𝔸¹)^perf` is not weakly perfectly smooth of
  any dimension: for a surjective `g : W → Spec 𝔽_p` the composite `W → (𝔸¹)^perf` would be
  perfectly smooth, hence open by `perfectlySmooth_properties`, with image the closed point.
- `wittScheme_point`: `W_n(Spec 𝔽_p) = Spec ℤ/p^n`.
- `not_isWeaklyNormal_cusp`: `Spec k[t², t³]` is not weakly normal (`t` is a `p`-th root of `t^p`
  in the normalisation when `p = 2, 3`; in general the normalisation is a finite birational
  universal homeomorphism).
- `isWeaklyNormal_node`: for `p` odd, `Spec k[t² − 1, t³ − t]` is weakly normal.
- `isWeaklyNormal_affineSpace`: `𝔸^n_k` and `Spec k` are weakly normal (normal).

### 0.27 Flat base change of annihilators and cokernels

The strand `FlatAnnihilator` of `Suggested.lean` carries the main formula,
`element_annihilator_flat_baseChange`, the flat pure-tensor controls and its non-flat Check
(see the *Lean:* line); the auxiliary lemmas and the quotient and cokernel statements
(the strand `QuotientBaseChange`) are specified in this README only. For `R → S` flat and `M` a
finite `R`-module, prove
`annihilator_flat_baseChange`: `Ann_S(S ⊗_R M) = Ann_R(M) · S` (Stacks, Lemma 10.40.4, complete
statement), through `ideal_map_eq_tensor_range` (the extended ideal is the image of `S ⊗ I`),
`mem_map_kernel_iff` (membership in an extended kernel under flatness),
`annihilator_eq_generator_kernel` (the annihilator of a finitely generated module is the
intersection of the kernels of `r ↦ r m_i`), `annihilator_flat_baseChange_generators`,
`element_annihilator_flat_baseChange` (for every `m ∈ M`,
`Ann_S(1 ⊗ m) = Ann_R(m)·S`, with no finite-generation assumption on `M`),
`annihilator_map_le_baseChange` (the inclusion that holds without flatness) and
`ideal_map_iInf_finite` (flat base change commutes with finite intersections of ideals). For a
submodule `Q ⊆ M`, prove `quotient_baseChange_square` (the canonical square
`S ⊗ (M/Q) ≅ (S ⊗ M)/(S ⊗ Q)`, Mathlib's `tensorQuotientEquiv`), `quotient_baseChange_annihilator`
and `quotient_annihilator_flat_baseChange`, *baseChange_range*, *baseChange_le_comap*,
`quotient_baseChange_naturality`; and for a map `f : M → N` of finite modules,
`cokernel_annihilator_flat_baseChange` (`Ann(coker (S ⊗ f)) = Ann(coker f) · S`; Stacks, Lemma
10.40.4), `cokernelBaseChangeEquiv : S ⊗ coker f ≃ coker (S ⊗ f)` with `_tmul`, `_symm_mk_tmul` and
`cokernel_baseChange_square` (Stacks, Lemma 10.12.10). *Needs:* Mathlib `Module.Flat`,
`Module.annihilator`, `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`, `Submodule.baseChange`.

**Checks.**
- `empty_family`: the annihilator of the module generated by the empty family is `⊤`.
- `identity_extension`: for `S = R` the formula is the identity for `1 ⊗ m`.
  It does not assert the same formula for arbitrary `s ⊗ m`: with `R=S=ℤ`, `m=1`, `s=0`,
  the annihilator is `ℤ` instead of zero; with `R=S=ℤ/4`, `m=1`, `s=2`, it is `(2)`
  instead of zero. These flat identity extensions isolate the unit tensor hypothesis.
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

*Lean:* `FlatAnnihilator.annihilator_flat_baseChange`, with `nonflat_element_failure` as an
`example`.

### 0.28 Ideal sheaves: the quotient-comparison API

This subsection specifies the strand `IdealPullback` in this README only (`Suggested.lean` has
no declaration for it), organised around one canonical comparison API; every other statement of
the strand is a characterising `_mk` lemma or a coherence lemma of the declarations named here.
Fix a scheme `Y`,
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

### 0.29 Scheme Frobenius

The labels in this section refer to scheme constructions; their representative Lean names lie in
`SchemeFrobenius`. There is no group, field, reducedness, Noetherian or finiteness assumption on
the basic constructions. Absolute scheme maps and relative scheme maps have distinct codomains.

*Absolute Frobenius of characteristic-p schemes.*
For a prime `p`, define `SchemeCharP X p` intrinsically by `CharP` on every local ring of `X`.
Prove equivalence with the existence of a unique structure map `X → Spec (ZMod p)` and with
`p = 0` in every open section ring, hence every affine coordinate ring. On a nonempty affine
open this gives `CharP` of its coordinate ring; the empty open has the zero ring and satisfies
`p = 0`, without having ring characteristic `p`. Include the empty scheme. Provide restriction
to opens, isomorphism invariance, products, fibre products and base change of this condition.

Construct `absoluteFrobenius X p`, written F_X : X → X, with identity map on the underlying
space and `a ↦ a^p` on the structure sheaf. On Spec A it is `Spec.map` of ring Frobenius.
Prove open restriction, naturality for every morphism of characteristic-`p` schemes, compatibility
with composition and isomorphisms, and projection identities on products and fibre products
(over Spec F_p, these are the usual product maps). Package this as a natural transformation
on the full category of characteristic-`p` schemes. Prove that F_X is integral, radicial
(universally injective) and a universal homeomorphism. If X is locally of finite type over a
perfect field of characteristic `p`, prove F_X finite; finiteness is not imposed on general X.

*Source:* Stacks, §33.36 [Frobenii](https://stacks.math.columbia.edu/tag/0CC6),
Definition 33.36.1, Lemmas 33.36.2–33.36.3 and 33.36.8; its affine finite-generation
argument gives the finite assertion because Frobenius is invertible on the perfect base field.

*Needs:* §§0.8, 0.23; Mathlib `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Spec.map`,
`CharP`, `frobenius`, `PerfectRing`, ringed-space gluing, scheme pullbacks and composition,
`AlgebraicGeometry.Etale`, `AlgebraicGeometry.Smooth`,
`AlgebraicGeometry.SmoothOfRelativeDimension`, `Module.Free`, `Module.Finite`,
`FiniteField.frobenius_pow`. Relative constructions and iterates use the
absolute construction in this section; the rank proof uses local étale coordinates.

**Checks.**

- On Spec A the algebra map is `a ↦ a^p`, including nilpotents; it commutes with localization.
- On Spec F_{p²} the underlying one-point space is fixed but the ring map is nontrivial.
- On Spec F_p[ε]/(ε²), F_X pulls ε back to zero, so the map need not be an isomorphism.
- The empty scheme satisfies the intrinsic condition and has identity Frobenius.

*Lean:* `SchemeCharP`, `schemeCharP_spec_iff`, `schemeCharP_iff_structureMap`,
`absoluteFrobenius`, `absoluteFrobenius_spec`, `absoluteFrobenius_base`,
`absoluteFrobenius_naturality`, `absoluteFrobenius_integral`,
`schemeCharP_of_hom`, `absoluteFrobenius_universalHomeomorphism`, `absoluteFrobenius_finite`.
The affine/localization, dual-number, quadratic-field and empty-scheme Checks are `example`s.

*Relative scheme Frobenius and arbitrary base change.*
For every f : X → S between characteristic-`p` schemes, define
`schemeFrobeniusTwist f p` = X^{(p/S)} = X ×_{S,F_S} S, with projections π₁ to X and π₂ to S.
The structure map is π₂. Construct `relativeFrobenius f p`, F_{X/S} : X → X^{(p/S)}, uniquely
characterized by π₁ ∘ F_{X/S} = F_X and π₂ ∘ F_{X/S} = f. Thus F_X factors through the
relative map. For A → B the coordinate algebra of the twist is B ⊗_{A,F_A} A and the relative
map on algebras sends b ⊗ a to b^p a.

Give the induced twist functor and naturality square for every map over S, compatibility with
products over S and transport along isomorphisms of schemes and bases. For every S′ → S,
construct the canonical isomorphism
(X ×_S S′)^{(p/S′)} ≅ X^{(p/S)} ×_S S′ and prove that it identifies relative Frobenius with
its base change. Keep this isomorphism and both projections explicit, with identity and composite
base-change coherence; no perfectness or flatness of S′ → S is required.

Prove F_{X/S} integral, radicial and a universal homeomorphism for arbitrary f; for étale f
it is an isomorphism. For smooth f of pure relative dimension d, it is finite locally free of
rank p^d. For general smooth f, the locally constant relative dimension on X gives rank
p^{d(x)} at the corresponding point of X^{(p/S)}, via the Frobenius homeomorphism; no constant
rank on all of S is assumed. Use étale coordinates to reduce the rank assertion to affine
space.

*Source:* Stacks, §33.36, Definition 33.36.4 and Lemmas 33.36.5–33.36.8;
Lemma 41.14.3 ([0EBS](https://stacks.math.columbia.edu/tag/0EBS)) for étale f;
smooth étale coordinates (Lemma 29.37.21, [054L](https://stacks.math.columbia.edu/tag/054L))
and the monomial basis with exponents < p give
finite local freeness and its rank.

**Checks.**

- For A¹_S the relative coordinate map is t ↦ t^p and the algebra is free with basis 1,…,t^{p−1}.
- Relative Frobenius of every étale S-scheme is an isomorphism, even when F_S is not one.
- Smooth relative dimension d gives rank p^d; A¹_S has rank p, rather than rank one.
- The disjoint union of A¹_S and A²_S has ranks p and p² on the respective twist components.

*Lean:* `schemeFrobeniusTwist`, `relativeFrobenius`, `relativeFrobenius_fst`,
`relativeFrobenius_snd`, `relativeFrobenius_unique`, `relativeFrobenius_integral`,
`relativeFrobenius_etale_isIso`, `relativeFrobenius_universalHomeomorphism`,
`relativeFrobenius_smooth_rank`, `schemeFrobeniusTwistBaseChangeIso`,
`relativeFrobenius_baseChange`. The affine-line, affine-plane, disjoint-union and
nonperfect-base étale Checks are `example`s.

*Iterated scheme Frobenius and finite-field q-power maps.*
For every characteristic-`p` scheme X and every r ≥ 0 construct `iteratedSchemeFrobenius X p r`
= F_X^r. For f : X → S define `iteratedSchemeFrobeniusTwist f p r` = X ×_{S,F_S^r} S and
`iteratedRelativeFrobenius f p r` with projection maps F_X^r and f. Prove canonical coherent
isomorphisms between successive twists and the twist for the sum of the exponents. Relative
addition composes the r-fold map with the s-fold map of the r-twist, using these isomorphisms.
Require unit and associativity coherence for twist addition, and compatibility with the
identity and composite-base-change comparisons; the projection identities characterize these
comparisons uniquely. The zeroth twist identifies with X and its relative map with identity;
give successor, addition,
naturality, isomorphism, product and arbitrary relative base-change laws for every exponent.
On sections the absolute r-fold map is `a ↦ a^{p^r}`; its point map is identity.

For an explicit finite field k of characteristic p and cardinality q = p^a, construct
`qPowerFrobenius` of every k-scheme as F_X^a and prove it is over k. Its r-fold iterate raises
sections to q^r powers. Identify the a-fold relative twist with X using F_{Spec k}^a = identity,
and identify the resulting relative map with the absolute a-fold map. Give identity, successor,
addition, naturality, products and base-change laws with finite fields and cardinality equalities
visible. Under an extension k′/k, base change of this k-map is the q-power relative map after
identifying its twist, not in general the q-power absolute map on X_{k′}; that absolute map also
acts on k′. A single absolute p-Frobenius need not be over k.

*Source:* Stacks, §33.36, Remark 33.36.11 ([0CCG](https://stacks.math.columbia.edu/tag/0CCG));
Mathlib `FiniteField.frobenius_pow` for the finite-field identity.

**Checks.**

- The zeroth absolute iterate is identity, and the zeroth relative twist is canonically X.
- Over F_{p²}, the single absolute p-map on Spec k is not a k-map; its square is identity.
- On Spec F_{q²}, base change of identity on Spec F_q is identity, whereas absolute q-Frobenius
  is nontrivial on the ring; this tests the relative base-change convention.

*Lean:* `iteratedSchemeFrobenius`, `iteratedSchemeFrobenius_zero`,
`iteratedSchemeFrobenius_succ`, `iteratedSchemeFrobenius_add`,
`iteratedSchemeFrobeniusTwist`, `iteratedRelativeFrobenius`,
`iteratedRelativeFrobenius_fst`, `iteratedRelativeFrobenius_snd`,
`iteratedSchemeFrobeniusTwistZeroIso`, `iteratedRelativeFrobenius_zero`,
`iteratedSchemeFrobeniusTwistAddIso`, `iteratedSchemeFrobeniusTwistAddIso_projections`,
`iteratedRelativeFrobenius_add`,
`qPowerFrobenius`, `qPowerFrobenius_eq_iterated`, `qPowerFrobenius_over`.
The zeroth-iterate, quadratic-field and scalar-base-change Checks are `example`s.

### 0.30 Normal schemes, codimension-one points under finite morphisms, ramification at a point

The suggested forms of this subsection are the strand `NormalSchemes` of `Suggested.lean`.

*Normal schemes.* Define the class `IsNormalScheme X`: every local ring `X.presheaf.stalk x` is a
domain and integrally closed (Stacks, Definition 28.7.1 (033I)). Prove
`isNormalScheme_iff_forall_affineOpens` and its open-cover form (Lemma 28.7.2 (033J)),
`IsNormalScheme.of_isOpenImmersion`, `IsNormalScheme.isReduced` (Lemma 28.7.3 (033K)),
`isNormalScheme_Spec_iff` (for a domain `R`, `Spec R` is normal iff `R` is integrally closed),
`IsNormalScheme.isIntegrallyClosed_of_isAffineOpen` (on an integral normal scheme the sections over
a nonempty affine open are integrally closed), and `IsNormalScheme.isDiscreteValuationRing_stalk`:
on a locally Noetherian normal scheme the stalk at a point of coheight one is a discrete valuation
ring, hence a regular local ring (Algebra, Lemma 10.119.7 (00PD)). §4.13 *IsRegular.isNormal* is
the instance `IsNormalScheme.of_isRegular` for this predicate.

*Codimension-one points under finite dominant morphisms.* Let `f : X ⟶ Y` be finite and dominant
with `X` and `Y` integral. Prove `coheight_eq_one_of_coheight_apply_eq_one`: a point over a point
of coheight one has coheight one (incomparability, with dominance). Prove `coheight_apply_eq_one`:
the image of a point of coheight one has coheight one when `Y` is locally Noetherian with
Noetherian underlying space and `Y ⟶ Spec k` is locally of finite type for a field `k`. The proof
applies the local formula `dim_x X = trdeg_k κ(x) + dim 𝒪_{X,x}` (Varieties, Lemma 33.20.3 (0A21))
on `X` and on `Y`, with `dim X = dim Y` (Morphisms, Lemma 29.45.9 (0ECG)) and
`[κ(x) : κ(f x)] < ∞`. Prove `coheight_apply_eq_one_of_isNormalScheme` when `Y` is normal and
locally Noetherian (going down, Algebra, Proposition 10.38.7 (00H8)). Without either hypothesis the
statement fails (Examples, Section 110.19 (02JE)). Define
`codimensionOneMap f hf : CodimensionOnePoint X → CodimensionOnePoint Y`, where `hf` is the
conclusion of either lemma, and prove `codimensionOneMap_surjective`,
`finite_codimensionOneMap_fiber`, `codimensionOneMap_comp` and `codimensionOneMap_id`.

*Ramification at a point.* For `f : X ⟶ Y` and `x : X` define `ramificationIdxAt f x`:
the ramification index (Mathlib `Ideal.ramificationIdx`) of the maximal ideal of
`X.presheaf.stalk x` over `Y.presheaf.stalk (f x)` along `f.stalkMap x`. Prove
`ramificationIdxAt_pos` for `f` finite and dominant between integral schemes and `x` of coheight
one, and `ramificationIdxAt_eq_dvr`: at a point of coheight one of a locally Noetherian normal
integral `X` with `f x` of coheight one on a locally Noetherian normal integral `Y`, it is the
ramification index of the extension of discrete valuation rings (More on Algebra, Definition
15.113.1 (09E4)). Prove `ramificationIdxAt_comp`: for finite dominant `f : X ⟶ Y`, `g : Y ⟶ Z`
between locally Noetherian normal integral schemes and `x` of coheight one,
`ramificationIdxAt (f ≫ g) x = ramificationIdxAt f x * ramificationIdxAt g (f x)`. The stalk map
of `f ≫ g` at `x` is the composite of the stalk maps (Mathlib `Scheme.Hom.stalkMap_comp`), and
Mathlib `Ideal.ramificationIdx_tower` needs `Module.Flat`, which holds because an extension of
discrete valuation rings is torsion free.

*Regular quotients of a regular local ring.* Prove
`exists_regularSystem_of_quotient` (Algebra, Lemma 10.106.4 (00NR)): if `R` is a
regular local ring and `I` an ideal with `R ⧸ I` a regular local ring, then `I` is generated by
the first `c` members of a minimal generating set `x_1, …, x_d` of the maximal ideal, for some
`c ≤ d`. Prove its codimension-one case `isPrincipal_of_height_eq_one`: a prime
of height one with regular quotient is generated by one element of `𝔪 ∖ 𝔪²`.

*Needs:* §§0.7, 0.20, 4.13; Mathlib `IsIntegrallyClosed`, `IsDiscreteValuationRing`, `IsReduced`,
`IsAffineOpen`, `Order.coheight`, `Algebra.HasGoingDown`, `IsFinite`, `IsDominant`,
`Ideal.ramificationIdx`, `Ideal.ramificationIdx_tower`, `Scheme.Hom.stalkMap_comp`,
`IsRegularLocalRing`, `Ideal.height`; Tau Ceti `TauCeti.AlgebraicGeometry.CodimensionOnePoint`,
`TauCeti.IsRegularLocalRing.quotient_span_singleton_iff`.

**Checks.**

- `IsNormalScheme.test_cusp`: `Spec k[t², t³]` is integral and not normal; `Spec k[t]` is normal.
- `codimensionOneMap.test_square`: for `x ↦ x²` on `𝔸¹_k`, `codimensionOneMap` sends the closed
  point `x = a` to `x = a²`, and the fibre over `x = 0` is one point.
- `ramificationIdxAt.test_square`: for `x ↦ x²` on `𝔸¹_k` with `2` invertible in `k`, the
  ramification index is `2` at `x = 0` and `1` at `x = 1`.
- `exists_regularSystem_of_quotient.test_parabola`: in `k[x, y]_{(x, y)}` the quotient by
  `y − x²` is regular and `y − x² ∉ 𝔪²`; the quotient by `y² − x³` is not regular.

*Lean:* `NormalSchemes.IsNormalScheme`, `NormalSchemes.coheight_apply_eq_one`,
`NormalSchemes.coheight_apply_eq_one_of_isNormalScheme`, `NormalSchemes.codimensionOneMap`,
`NormalSchemes.codimensionOneMap_surjective`, `NormalSchemes.ramificationIdxAt`,
`NormalSchemes.ramificationIdxAt_comp`, `NormalSchemes.exists_regularSystem_of_quotient`.

### Examples

The acceptance instances of Layer 0: the henselization of `ℤ_{(p)}` is the algebraic `p`-adic
integers (§0.13); `ℤ` and every field are excellent, Nagata, universally catenary and Cohen–Macaulay
(§§0.16–0.21); the cusp normalisation is a universal homeomorphism and the node normalisation is not
(§0.23); `(ℙ¹_{𝔽_p})^perf` is perfectly proper and `(𝔸¹)^perf` is not (§0.25); Hartogs holds on
`𝔸² ∖ {0}` and fails on `𝔸¹ ∖ {0}` (§0.6).

### Dependencies

Mathlib and Tau Ceti as listed under supplier contracts; AlgebraicVectorBundles L0A–L2A (§§0.1–0.3);
StableReduction Layer 2 (§0.3); JacobianChallenge Layer B (§§0.4–0.6); ModularCurves 4D (§0.10);
§0.29 / `absoluteFrobenius`,
`iteratedSchemeFrobenius` (§§0.24–0.26, characteristic-`p` schemes);
§0.23a / `universalHomeomorphismEtaleEquivalence`
(§0.24, with no coefficient restriction). No later layer of this roadmap.

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
`U ↦ Sh(C/U, Ab)` (Stacks, Lemmas 7.26.1 (04TQ), 7.26.4 (04TR) for sheaves of sets; Lemma 7.26.5
(04TS) makes `Sh(C/U)` equivalent to glueing data along a covering, compatibly with finite products,
so the same holds for abelian group objects, which are the abelian sheaves). *Needs:* Mathlib `Pseudofunctor`,
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
(Stacks, Lemma 37.57.1 (02W8)). Prove `spaceFppfDescent`: an fppf sheaf `F` over `S` that is an
algebraic space fppf-locally on `S` is an algebraic space: for an fppf covering `{S_i → S}` such that
every `F_i = h_{S_i} × F` is an algebraic space and the coproduct `∐ F_i` is an algebraic space (which
holds when étale covers `U_i → F_i` can be chosen with `∐ U_i` a scheme of the site, Stacks, Spaces,
Lemma 65.8.4 (02WQ)), `F` is an algebraic space (Lemma 80.11.1 (04SK)); and a descent datum for
algebraic spaces along an fppf covering `{X_i → X}` of algebraic spaces is effective when the index
set is countable, or when every `Y_i → X_i` of the datum is of finite type (Lemma 80.11.3 (0ADV)). *Needs:* §1.3; Mathlib `Presheaf.IsSheaf`, `MorphismProperty.presheaf`, `LocallyQuasiFinite`,
`IsSeparated`.

### 1.3 Representable diagonals, étale atlases and the algebraic-space predicate

The three predicates of this subsection open the strand `Spaces` of `Suggested.lean`; their API
lemmas are specified in this README only. For
`F : SchemePresheaf`, define `RepresentableDiagonal F`: the diagonal `F → F × F` is relatively
representable with respect to `yoneda` (Mathlib `Functor.relativelyRepresentable`); `EtaleAtlas F U
a` for a scheme `U` and `a : h_U → F`: `a` is relatively representable and every base change along
`h_T → F` is an étale surjective morphism of schemes (`MorphismProperty.presheaf` for `Etale` and
`Surjective`); `IsAlgebraicSpace F`: `F` is a sheaf for `fppfTopology`, has representable diagonal
and admits an étale atlas (Stacks, Definition 65.6.1 (025Y), Lemma 65.6.2). API:
*RepresentableDiagonal.of_scheme* (every `h_X`, without quasi-separatedness),
*RepresentableDiagonal.iso*, *RepresentableDiagonal.from_scheme* (every `h_X → F` is relatively
representable when `F` has representable diagonal), *EtaleAtlas.representable*, `.etale`,
`.surjective`, `.yoneda_iff` (for `F = h_X`, `EtaleAtlas h_X U (h f)` iff `f` is étale and
surjective), *IsAlgebraicSpace.sheaf*, `.diagonal`, `.atlas`, `.of_scheme`, `.iso`; and the
remaining lemmas of the strand: *IsAlgebraicSpace.diagonal_locallyQuasiFinite* (the diagonal of an
algebraic space is representable by locally quasi-finite separated monomorphisms of schemes;
Mathlib's `relativelyRepresentable.of_diag`, `diag_iff`, `respectsIso`,
`MorphismProperty.relative.rep`, `relative_map_iff` are the helper lemmas),
*IsAlgebraicSpace.of_isIso_atlas*,
*EtaleAtlas.comp* (an étale surjective scheme map onto an atlas is an atlas), *EtaleAtlas.pullback*
and *isAlgebraicSpace_of_etale_cover* (fppf-local nature, used by §1.2). *Needs:* Mathlib
`Functor.relativelyRepresentable`, `yoneda`, `MorphismProperty.presheaf`, `Etale`, `Surjective`,
`Presheaf.IsSheaf`, `fppfTopology`.

**Checks.**
- *RepresentableDiagonal.test_field*, `test_empty`, `test_nonreduced`: `h_{Spec k}`, `h_∅` and
  `h_{Spec (k ⋉ k)}` have representable diagonal.
- *EtaleAtlas.test_identity*, `test_empty_identity`: the identity of `h_X` is an atlas for every
  `X`, including the empty scheme.
- *EtaleAtlas.test_empty_not_cover*: no transformation `h_∅ → h_{Spec k}` is an atlas (not
  surjective).
- *IsAlgebraicSpace.test_field*, `test_empty`, `test_nonreduced`, `test_arbitrary_scheme`: `h_X` is
  an algebraic space for every scheme `X`.
- *IsAlgebraicSpace.test_not_sheaf*: the presheaf quotient of `h_{Spec L}` by `Gal(L/K)` for a
  quadratic Galois extension is not an fppf sheaf, hence not an algebraic space, and its diagonal is not representable. On `Spec L ⊔ Spec L`, the lifts
  `(id,id)` and `(id,σ)` have quotient classes agreeing on both components but differing globally,
  so their equality presheaf is not a sheaf.
- *IsAlgebraicSpace.test_constant_not_sheaf*: the constant presheaf `T ↦ {0, 1}` is not an fppf
  sheaf (a sheaf takes the empty scheme to a point), hence not an algebraic space.

*Lean:* `SchemePresheaf`, `SchPseudofunctor` (the carriers of this layer),
`Spaces.RepresentableDiagonal`, `Spaces.EtaleAtlas`, `Spaces.IsAlgebraicSpace`, with
*EtaleAtlas.test_empty_not_cover* and *IsAlgebraicSpace.test_constant_not_sheaf* as `example`s.

### 1.4 The category of algebraic spaces

Define `AlgSpace` as the full subcategory of `SchemePresheaf` on `IsAlgebraicSpace`, with
*AlgSpace.toPresheaf*, the fully faithful `AlgSpace.ofScheme : Scheme ⥤ AlgSpace`, the terminal
object `h_{Spec ℤ}` and initial object `h_∅`, and `AlgSpace.overEquiv S`: algebraic spaces over `h_S`
are the fppf sheaves on `Over S` satisfying `IsAlgebraicSpaceOver S` (Stacks, Definition 65.6.1).
*Needs:* §1.3; Mathlib `ObjectProperty.FullSubcategory`, `Over`.

**Checks.**
- *AlgSpace.test_galois_endomorphisms*: for a quadratic Galois extension `K/ℚ`, the
  `ℚ`-endomorphisms of `h_{Spec K}` are the two Galois automorphisms (full faithfulness).
- *AlgSpace.test_terminal*: `Hom(F, h_{Spec ℤ})` is a point for every `F`.
- *AlgSpace.test_initial*: `Hom(h_∅, F)` is a point and `Hom(h_{Spec k}, h_∅)` is empty.

*Lean:* `Spaces.isAlgebraicSpace`, `Spaces.AlgSpace`. The embedding of schemes, the terminal and
initial objects and *AlgSpace.overEquiv* are specified in this README only.

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
h_U`: the comparison map is surjective for a pre-equivalence relation, Lemma 39.20.4 (045Y), and
injective because `R → U × U` is a monomorphism), `quotientSheaf.represented_of` (if `q : U → M` is
invariant, `h_U → h_M` is fppf locally surjective and `R → U ×_M U` is fppf locally surjective, then
`U/R ≅ h_M`; Lemma 39.20.3 (03C5)) and `quotientSheaf.restrict`: for an **equivalence relation**
`(s, t)` and an fppf covering `g : U' → U`, the pulled-back equivalence relation
`R' = R ×_{U×U} (U'×U')` on `U'` has `U'/R' ≅ U/R` (Lemma 39.20.5 (045Z) for pre-equivalence
relations; Lemma 39.20.6 (02VH) is the groupoid form). The equivalence-relation hypothesis is essential: the restriction statement is
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
The stack extension of this construction is `Stacks.points` in §1.20.

**Checks.**
- `points.test_field`: `|h_{Spec k}|` is one point.
- `points.test_galois`: for `L/K` quadratic, `|h_{Spec L}|` is one point although `Spec L` has two
  `K`-automorphisms.
- `points.test_folded_line`: the closed points of the folded line over an algebraically closed
  field are the origin and the pairs `{x, −x}`, `x ≠ 0`.
- `points.test_no_residue_field`: the generic point of `𝔸¹_ℚ/ℤ` (§1.12) is represented by no
  monomorphism from the spectrum of a field.

### 1.8 Fibre products and étale-local properties of morphisms

Prove `isAlgebraicSpace_pullback`: fibre products of algebraic spaces are algebraic spaces.
`EtaleLocal.baseChange` gives `EtaleLocal P (AlgSpace.pullbackSnd f g)`
under the source/target étale-locality and base-change-stability assumptions on `P`.
`spacePresentation`
identifies the quotient projection with the chosen atlas, and
`ofScheme_preservesPullback` identifies both projections under its comparison
isomorphism (Stacks, §65.7 and §67.22 (03MJ, 04RD)). The named fibre-product API is
`AlgSpace.pullbackObj`, `pullbackFst`, `pullbackSnd`, `ofScheme_preservesPullback`, and
`ofScheme_relativelyRepresentable` (every `h_U → F` is relatively representable); chart products:
for atlases `U → F`, `V → G`, the scheme representing `U ×_H V`
exists by the representable diagonal of `H` (for a presheaf, a representable diagonal is
equivalent to representability of every `h_U ×_H h_V` with `U`, `V` schemes, Stacks, Lemma 65.5.10
(025W)) and is an atlas of `F ×_H G`, its map to `F ×_H G` being a composite of base changes of the
two étale surjective atlases (Stacks, Lemmas 65.7.1 (02X0), 65.7.3 (02X2)).

Define `EtaleLocal P f` for a property `P` of morphisms of schemes that is étale local on the
source-and-target (`IsLocalAtSource` and `IsLocalAtTarget` for `Scheme.etalePrecoverage`) and a
morphism `f : F → G` of algebraic spaces: there is a commutative square with étale atlases
`U → F`, `V → G` and `h : U → V` with `P h` (Stacks, Lemma 67.22.1 (03MJ), Definition 67.22.2
(04RD)). API: *EtaleLocal.iff_forall_square* (independence of the square), `.ofScheme_iff`
(agreement with `P` on schemes), `.iff_presheaf` (agreement with `MorphismProperty.presheaf P` when
`f` is representable and `P` is stable under base change and fppf local on the base, the hypotheses
of the last clause of Lemma 67.22.1 (03MJ)), `.comp`, `.baseChange`. *Needs:* §1.3,
§1.6; Mathlib `IsLocalAtSource`, `IsLocalAtTarget`, `IsStableUnderBaseChange`,
`IsStableUnderComposition`.

**Checks.**
- *EtaleLocal_baseChange_projection*: a consumer obtains `P` for the specified
  second pullback projection directly from the theorem.

- `atlas_two_lifts_rejected`: take `F = G = H = Spec k` and `W = Spec k ⊔ Spec k`.
  Lift `U = V = Spec k` to different components of `W`. Then `U ×_W V = ∅`,
  whereas `U ×_H V = Spec k`; only the latter covers the required product.
- *EtaleLocal.test_identity*: the identity of any algebraic space is étale.
- *EtaleLocal.test_scheme*: a morphism of schemes is smooth as a morphism of spaces iff it is
  smooth.
- *EtaleLocal.test_atlas*: for an étale equivalence relation, `π : h_U → U/R` is étale.
- *EtaleLocal.test_closed_immersion_not_local*: for the identity of `𝔸¹`, the square with top arrow
  the identity has a closed immersion and the square with top arrow the fold map does not; closed
  immersion is not étale local on the source, and `EtaleLocal @IsClosedImmersion` is not
  square-independent.

*Lean:* `Spaces.isAlgebraicSpace_pullback`, `Spaces.AlgSpace.pullbackObj`,
`Spaces.AlgSpace.pullbackSnd`, `Spaces.EtaleLocal`, `Spaces.EtaleLocal.baseChange` (its conclusion
is about the specified second projection `AlgSpace.pullbackSnd f g`). `pullbackFst`, the
comparisons with schemes and the rest of the `EtaleLocal` API are specified in this README only.

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
rings, giving the ringed site `(F_ét, O_F)` (Definition 66.21.2 (03G7)). API: *smallEtale_ofScheme*
(for `F = h_X`, `smallEtale F ≌ X.Etale` after passing to the scheme site), *smallEtale_localize*
(for `V → F` étale, `smallEtale F / V ≌ smallEtale V`), and `smallEtale_map f` for a morphism
`f : F → G` of algebraic spaces: the functor `smallEtale G ⥤ smallEtale F`, `V ↦ V ×_G F`, well
defined because the fibre product is an algebraic space étale over `F`.
*smallEtale_map_continuous* and *smallEtale_map_preservesFiniteLimits* give continuity and
preservation of finite limits, hence the morphism of ringed topoi `(F_ét, O_F) → (G_ét, O_G)`,
with identity and composition isomorphisms *smallEtale_map_id*, *smallEtale_map_comp*
(Stacks, Lemma [66.18.8 (03G2)](https://stacks.math.columbia.edu/tag/03G2)).
For étale `f`, define the separate composition functor `smallEtale_compose f`:
`smallEtale F → smallEtale G`, `(U → F) ↦ (U → F → G)`.
*smallEtale_compose_continuous* and *smallEtale_compose_cocontinuous* make it continuous
and cocontinuous; through *smallEtale_localize* it realises the same geometric morphism
as a localisation (Stacks, Lemma [66.18.11 (03LP)](https://stacks.math.columbia.edu/tag/03LP)).
Here cocontinuity means the covering-refinement condition of Stacks, Definition
[7.20.1 (00XJ)](https://stacks.math.columbia.edu/tag/00XJ); it does not hold for base change
in general, even along finite étale maps. Direct images, the ringed-topos morphism and
its downstream cohomology use the continuous, finite-limit-preserving base-change functor;
in particular `(f_* A)(V) = A(V ×_G F)`.
The objects of `smallEtale`
must be algebraic spaces: if `G` is a scheme and `F → G` a nonschematic space, the pullback of
`𝟙_G` is `F`, which is not a scheme (`test_pullback_not_scheme` below). *Needs:* §1.4, §1.8, §1.9;
Mathlib `GrothendieckTopology`, `Sheaf`, `X.Etale`.

**Checks.**
- *smallEtale_map_fold*: for a field `k`, put `S = Spec k`, `T = S ⊔ S`, and let
  `f : T → S` be the fold map. It is finite étale, and `smallEtale_map f` is continuous
  and preserves finite limits, but is not cocontinuous. The inclusions `j₀,j₁ : S → T`
  cover `T`. For each étale `v : V → S`, the image object is the specified projection
  `p : V ×_S T → T`, identified over `T` with `V ⊔ V → T`. Factoring `p` through
  either `j₀` or `j₁` is possible exactly when `V` is empty: otherwise its two copies
  meet different components. Thus a family whose base-change maps refine `{j₀,j₁}`
  consists entirely of empty schemes and cannot cover the nonempty `S`. Scheme charts
  of any putative covering by spaces give the same obstruction.
- *smallEtale_map_identity* and *smallEtale_compose_identity*: base change along `𝟙_F`
  is naturally isomorphic to the identity and is continuous and cocontinuous;
  composition along `𝟙_F` is likewise naturally isomorphic to the identity.
- *smallEtale_compose_etale* and *smallEtale_compose_two_sheets*: for étale `f : F → G`,
  composition is continuous and cocontinuous in the direction `smallEtale F → smallEtale G`,
  with underlying object `(U → F → G)`. For the fold above it sends the terminal object
  `T → T` to `T → S`, whereas base change sends `S → S` to `T → T`. More decisively,
  base change followed by composition sends `S → S` to `T → S`, which is not isomorphic
  to `S → S` over `S`. The two functors therefore have distinct directions and object
  actions despite inducing the same geometric morphism.
- *smallEtale.test_spec_global_sections*: `Γ(h_{Spec R}, O) = R`.
- *smallEtale.test_folded_line_functions*: for the folded line (`char k ≠ 2`) the global sections
  of `O` are `k[x²]`.
- *smallEtale.test_separably_closed*: every étale surjection `U → Spec k`, `k` separably closed,
  has a section.
- *smallEtale.test_not_big_site*: `𝔸¹_k → Spec k` is not étale, so `𝔸¹_k` is not an object of
  `smallEtale h_{Spec k}`.
- *smallEtale.test_pullback_not_scheme*: for `F` the folded line over `G = Spec k`, the object
  `𝟙_G` of `smallEtale G` pulls back along `F → G` to `F`, which is not a scheme; a site whose objects
  are schemes étale over `F` would not be closed under *smallEtale_map*.

*Lean:* `Spaces.smallEtale` (the category of algebraic spaces étale over `F`) and
`Spaces.smallEtale_compose` (the composition functor of an étale `f : F → G`, in the direction
`smallEtale F ⥤ smallEtale G`, opposite to base change). The topologies, the scheme site, the
structure sheaf, the base-change functor and the continuity statements are specified in this README
only.

### 1.11 Quasi-coherent modules on an algebraic space

Define `Spaces.QCoh F`: the full subcategory of `O_F`-modules on `(F_ét, O_F)` satisfying Mathlib's
`SheafOfModules.IsQuasicoherent` (Stacks, Definition 66.29.1 (03G9)). API: *QCoh.pullback*
(pullback along a morphism of spaces preserves quasi-coherence), *QCoh.ofSchemeEquiv*
(`QCoh(h_Y) ≌ QCoh(Y)` for a scheme `Y`), *QCoh.presentationEquiv* (for `F = U/R`, quasi-coherent
modules on `F` are quasi-coherent modules on `U` with descent data along `s, t`; Proposition
66.32.1 (03M3)), *QCoh.invertible_aut* (automorphisms of an invertible module are `Γ(F, O)^×`),
*QCoh.abelian*. *Needs:* §1.1, §1.6, §1.10; Mathlib `SheafOfModules.IsQuasicoherent`.

**Checks.**
- *QCoh.test_scheme*: `QCoh(h_Y) ≌ QCoh(Y)`.
- *QCoh.test_folded_line_structure_sheaf*: for the folded line `X` (`char k ≠ 2`), `O_X` is the
  descent of `O_{𝔸¹}` along the relation, with `Γ(X, O_X) = k[x²]`.
- *QCoh.test_empty*: `QCoh` of the empty space is the zero category.
- *QCoh.test_not_quasicoherent*: on `h_{Spec ℤ}` the extension by zero `j_! O_U` of the structure
  sheaf of `U = Spec ℤ[1/2]` is an `O`-module on the étale site that is not quasi-coherent (its
  value on `Spec ℤ` is `0` while its value on `Spec ℤ[1/2]` is `ℤ[1/2]`).

### 1.12 Two algebraic spaces that are not schemes

Prove `foldedLine_space`: for a field `k` of characteristic `≠ 2`, `𝔸¹_k/(Δ ⊔ Γ)` (§1.5) is an
algebraic space that is not a scheme: it is not locally separated at the origin (Stacks, Example 65.14.1 (02Z1)). Prove
`translationQuotient_space`: the quotient `𝔸¹_ℚ/ℤ` of the affine line by the free action of `ℤ` by
translation is an algebraic space whose generic point has no residue field and which is not
quasi-separated (Stacks, Lemma 66.34.1 (071S), Example 65.14.8 (02Z7), Lemma 66.3.3 (0AHR)).
*Needs:* §1.5, §1.6, §1.7, §1.8, §1.9.

### 1.13 Group algebraic spaces and actions

Define `GroupSpace S` for a scheme `S`: an object `G` of `Over h_S` whose underlying presheaf is an
algebraic space, with a `GrpObj` structure for the cartesian monoidal structure of `Over h_S`
(Stacks, Definition 78.5.1 (043H)); `Action G X := ModObj G X` for `X` over `h_S` (Definition 78.8.1
(043Q)); `act G X : G ⊗ X → X`; `Action.IsFree G X`: on `T`-points, `g·x = x` implies `g = 1`
(Definition 78.8.2). API: `Action.free_iff_mono` (`(a, pr₂) : G × X → X × X` is a monomorphism;
Lemma 78.8.3 (06P9)), *Action.baseChange* along `S' → S`, *Action.constantEquiv* (actions of Tau
Ceti's constant group scheme `Γ_S` on `X` are homomorphisms `Γ → Aut X`). Define the comparison
`GroupSpace.ofGroupScheme : GrpObj (Over.mk f) → GroupSpace S` for a group scheme `f : G → S` in
ModularCurves 0B's convention (`yoneda : Over S ⥤ Over h_S` preserves finite products, so carries
`GrpObj` to `GrpObj`). The named functor `GroupSpace.ofGroupSchemeFunctor S` runs from
`Grp (Over S)` to `Grp (Over h_S)`; `ofGroupScheme_obj` identifies its objects with
`ofGroupScheme`, and `ofGroupScheme_forget` identifies its underlying functor with
`Grp.forget (Over S) ⋙ Over.post yoneda`. The theorem `ofGroupScheme_faithful` asserts
`Functor.Faithful`: equality of images of two group homomorphisms implies their equality.
*Needs:* §1.4, §1.8; Mathlib `GrpObj`, `ModObj`,
`MonObj`, `CartesianMonoidalCategory`, `Over.cartesianMonoidalCategory`; Tau Ceti
`ConstantGroup.groupScheme`; ModularCurves 0B.

**Checks.**
- *Action.test_translation_free*: `G` acting on itself by left translation is free.
- *Action.test_scaling_not_free*: `𝔾_m` acting on `𝔸¹` by scaling is not free (every `c ≠ 1` fixes
  `0`). The typed criterion rejects `Action.IsFree` whenever an actual
  nonidentity group-valued point fixes a point of the given action.
- *Action.test_constant_group*: the action of the constant group `(ℤ/2)_k` on `X` is a
  homomorphism `ℤ/2 → Aut X`, by *Action.constantEquiv*.
- *Action.test_trivial_group*: the trivial group has a unique action on every `X`.
- *GroupSpace.test_ofGroupScheme_Gm*: `ofGroupScheme` of `𝔾_{m,S}` is the group space `𝔾_m` of
  §1.15 and its points over a specified map `T → S` are `Γ(T, O)^×`.

- `ofGroupScheme_identity`: the functor sends the identity of a group scheme to the identity.
- `ofGroupScheme_trivial`: its value on the trivial group has terminal underlying object over `h_S`.
- `ofGroupScheme_distinguishes_arrows`: distinct group homomorphisms have distinct images.
- `ofGroupScheme_library`: forgetting the group law gives Mathlib's `Over.post yoneda`.

*Lean:* `Groups.GroupSpace`, `Groups.Action`, `Groups.act`, `Groups.Action.IsFree`,
`Groups.Action.free_iff_mono`. The comparison functor from group schemes and the rest of the API
are specified in this README only.

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
section fppf-locally on `S` (Stacks, Definitions 78.9.1, 78.9.3 (04TY)). The fppf torsor theory
here is developed for `G` flat and locally of finite presentation over `S`, and the fpqc torsor
theory for `G` flat and affine over `S`; these are standing hypotheses on `G`. API:
*Torsor.trivial* (`G` acting on itself), `Torsor.trivial_iff_section` (a torsor is isomorphic to `G`
iff it has a section), *Torsor.hom_isIso* (equivariant maps of torsors are isomorphisms),
*Torsor.baseChange*, *Torsor.flat_of_flat* (flatness of the specified projection in
`EtaleLocal @Flat` for an algebraic-space torsor under an étale-locally flat group space;
this does not assert scheme-relative representability),
*Torsor.toSheafTorsor*: the fppf sheaf `P` with its `h_G`-action is a torsor under the sheaf of
groups `h_G` on the big fppf site `(Sch/S)_fppf` in the sense of §2.3. Define the **set of torsor
classes** as Layer 2's `NonabelianH1 (fppfTopology.over S) h_G` (§2.3): `torsorClasses G :=
NonabelianH1 _ h_G`, pointed by the trivial torsor; `torsorClasses.mk P h : torsorClasses G` for
`IsTorsor G P`, `torsorClasses.mk_eq_base_iff` (iff `P` has a section),
`torsorClasses.surjective_mk` (every torsor sheaf under `h_G` is an algebraic space by
`torsorRepresentability`, so `mk` is a bijection from isomorphism classes of geometric torsors),
`torsorClasses.pushforward` along a homomorphism `G → G'` (Poonen 2017,
§5.12.4, Proposition 5.12.14; Proposition 6.5.9, Example 6.5.5). Define the multiplicative group
space `Gm S : GroupSpace S`, the group space of the group scheme `𝔾_{m,S} = Spec_S O_S[t, t⁻¹]`
(`Spec (ℤ[t, t⁻¹]) ×_ℤ S` with its `GrpObj` structure, through *GroupSpace.ofGroupScheme*), with
`Gm_obj` (its points over a specified map `T → S` are in bijection with `Γ(T, O)^×`).
`Gm_points` strengthens this to a multiplicative equivalence on the native group of morphisms
over `h_S`; `Gm_points_naturality` identifies restriction with `Units.map` of
`Scheme.Hom.appTop` (Stacks, Section 39.5, Example 39.5.1).
Define `picEquiv : torsorClasses (Gm S) ≃ LineBundleClass S`. Its forward map sends
`P` to the class of `P ×^{𝔾_m} 𝔸¹`; `picEquiv.symm` sends `[L]` to the frame torsor
`Isom(O_S,L)` with the left action `g·φ := φ ∘ (g⁻¹)`. On `𝔸¹` use `g·v=gv`;
evaluation `(φ,v) ↦ φ(v)` is invariant under the diagonal action and identifies the
contracted product with the total space of `L`. This bijection sends the base point to
`O_S` and agrees with Hilbert 90 (§2.11, `H¹_fppf(S, 𝔾_m) = H¹_ét(S, 𝔾_m) = Pic(S)`)
and `NonabelianH1.equivSheafH` (Stacks, Theorem 59.24.1 (03P8)). The trivial group cannot replace `Gm S`: for the trivial group over `ℙ¹_k` the torsor classes are a point while
`Pic(ℙ¹) = ℤ` (`test_picEquiv_not_trivial_group` below). Prove `torsorRepresentability`: an fppf
sheaf `P` over `S` with an `h_G`-action that is a pseudo-torsor and trivial over an fppf covering
of `S`, with no algebraicity assumed on `P`, is an algebraic space and a torsor in the sense of
`IsTorsor`: it is fppf-locally the algebraic space `G ×_S S_i`, the coproduct of these pieces is the
algebraic space `G ×_S ∐ S_i`, and with that coproduct hypothesis the algebraic-space predicate is
fppf local (§1.2; Stacks, Lemma 80.11.1 (04SK); Poonen 2017, Theorem 6.5.10 (i), Remark 6.5.11).
*Needs:* §1.2, §1.13, §2.3, §2.11; Mathlib `PresheafOfGroups.H1`, `fppfTopology`; Tau Ceti
`LineBundleClass`, `CommHopfAlgCat.isPullback_fppfQuotientTorsor`.

**Checks.**
- `torsor_flat_space_projection`: the flatness conclusion is for the torsor's own
  algebraic-space projection, with no assumption that the torsor is a scheme.

- *Torsor.test_trivial*: `G` is a `G`-torsor with the base-point class.
- *Torsor.test_frobenius_mu_p*: in characteristic `p`, the `p`-th power map `𝔾_m → 𝔾_m` over
  `S = 𝔾_m` (coordinate `t`) is a `μ_p`-torsor over `S`; its fibre over the generic point is
  `Spec k(t)[s]/(s^p − t)`, a purely inseparable extension, so the torsor is not étale-locally
  trivial over `S`: no separable extension of `k(t)` contains a `p`-th root of `t`, since such a
  root is purely inseparable over `k(t)` and `t` is not a `p`-th power. The test asserts the
  statement about the torsor over `S = 𝔾_m` through the local-section predicate, not about a
  single fibre.
- *Torsor.test_frobenius_mu_p_fibre_trivial*: the fibre over `t = 1` is `μ_p = Spec k[s]/(sᵖ − 1)`,
  nonreduced and nevertheless the trivial `μ_p`-torsor, because it has the section `s = 1`;
  nonreducedness is not an obstruction to étale-local triviality and must not be used as one.
- *Torsor.test_frobenius_twisted_action*: for a smooth connected group `G` of positive dimension
  over `𝔽_p`, the left action `g · x := F(g)x` of `G` on itself makes `G(𝔽̄_p)` a `G(𝔽̄_p)`-torsor, but
  `G` with this action is not a `G`-torsor: `(a, pr₂)` is inseparable of degree `p^{dim G}`, so the
  pseudo-torsor clause fails (Poonen, Warning 5.12.6).
- *Torsor.test_empty*: the empty space over a nonempty `S` is not a torsor (no local sections).
- *Torsor.test_galois*: for `L/K` quadratic Galois, `Spec L` is a `(ℤ/2)_K`-torsor over `Spec K`
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
  covering is a point while `torsorClasses (Gm ℙ¹)` is `ℤ`; one covering cannot classify all torsors.

- `gm_needs_base_map`: a nonempty `T` has no map to the empty base, whereas
  `Γ(T,O)^×` contains `1`. The units comparison is for points over a specified `T → S`.

- `gm_points_product`, `gm_points_unit`, `gm_points_inverse`: relative points carry product,
  identity and inverse to multiplication, `1` and inverse in `Γ(T,O)ˣ`.
- `gm_points_empty`: the empty test scheme has a singleton group of relative points.

*Lean:* `Groups.IsTorsor`, `Groups.Torsor.trivial_iff_section`, `Groups.torsorRepresentability`.
The torsor-class carrier, `Gm S`, `picEquiv` and the rest of the API are specified in this README
only.

### 1.16 Contracted products and twisting

Define `contractedProduct G P X := (P × X)/G` for a `G`-torsor `P` and a `G`-space `X`, the quotient
of §1.5 by the diagonal action, with `contractedProduct_trivial` (`G ×^G X ≅ X`),
`contractedProduct_baseChange`, `contractedProduct_isAlgebraicSpace`; `innerForm G P := P ×^G G` for
the conjugation action, a group space; `pushforwardTorsor φ P := P ×^G H` along a homomorphism
`φ : G → H` (Poonen 2017, §5.12.5.2, §6.5.6). Prove `twistingBijection`: for a `G`-torsor `E`,
`P ↦ P ×^{innerForm G E} E`, the contraction over `innerForm G E = Aut_G(E)` acting on `E` on the
left, is a bijection `torsorClasses (innerForm G E) ≃ torsorClasses G` sending the base point to
the class of `E`, with inverse `Q ↦ Isom_G(E, Q)`. Define `FormOf X` as an fppf
sheaf over `S` locally isomorphic to `X`, with isomorphisms over `S` as morphisms.
Its isomorphism classes correspond to `H¹_fppf(S,Aut_S(X))`, where `Aut_S(X)` is the
automorphism sheaf; forms trivialized by a fixed fppf cover `E → S` correspond to the
preimage of the base point under restriction to `H¹_fppf(E,Aut_E(X_E))`.
For an action `G → Aut_S(X)`, contracting a `G`-torsor gives a map to these forms;
this map need not be injective. The classification is about sheaf forms; for algebraic-space
forms it uses the same isomorphism relation (Poonen 2017, Theorem 4.5.2, §5.12.5.1, §6.5.6.4). *Needs:* §1.5, §1.15.

**Checks.**
- `contractedProduct.test_trivial`: `G ×^G X ≅ X`.
- `contractedProduct.test_point`: `P ×^G (point) ≅ point` for every torsor `P`.
  Over `ℝ`, the two `ℤ/2`-torsors trivialized by `Spec ℂ` give the same form of
  `Spec ℝ`. An arbitrary acting group does not classify unadorned forms.
- `forms_test_automorphisms`: the automorphism sheaf of the point over `S` is trivial,
  so it has one form; forms of `𝔸¹` with specified linear structure use `𝔾_m`.
- `forms_test_cover`: restriction to the identity cover has trivial kernel, whereas
  `Spec ℂ → Spec ℝ` trivializes both classes of `ℤ/2`-torsors.
- `contractedProduct.test_line_bundle`: the frame torsor of a line bundle twisted by the scaling
  action on `𝔸¹` is the total space of the line bundle, using `g·φ=φ∘g⁻¹`
  (this is `picEquiv` applied to `picEquiv.symm [L]`). For `L=O(1)` on `ℙ¹`,
  the resulting bundle has degree `+1`, not `−1`.
- `contractedProduct.test_needs_sheafification`: for `Spec L` over `Spec K` (`L/K` quadratic Galois)
  twisted by itself, the contracted product is `Spec K ⊔ Spec K`, with `K`-points, while the presheaf
  quotient has none.

### 1.17 Categorical and geometric quotients, and Artin's bootstrap

For a pre-relation `s, t : R → U` of algebraic spaces over `B` (for instance the action groupoid),
define `IsInvariant s t φ` (`s ≫ φ = t ≫ φ`) and `IsCategoricalQuotient s t φ`: `φ : U → X` is
invariant and every invariant morphism to an algebraic space factors uniquely through `φ`, with
*IsCategoricalQuotient.unique* (Stacks, Definitions 83.3.1 (048E), 83.4.1 (048J)). Define the
**invariant sections**: for `φ` invariant, `(φ_* O_U)^R ⊆ φ_* O_U` is the equaliser of
`s^♯, t^♯ : φ_* O_U ⇉ (φ ∘ s)_* O_R` on the small étale site of `X` (§1.10), with the canonical
comparison `O_X → (φ_* O_U)^R` induced by `φ^♯`. Define `IsGeometricQuotient s t φ` for a **pre-equivalence relation**: on each
scheme-valued point set the image of `(s,t)` is an equivalence relation (in particular this
includes action groupoids). Require `φ` invariant, `|φ|` surjective, and the induced
map `R → U ×_X U` surjective on underlying points of the actual fibre product. This
is the geometric orbit condition with field extensions allowed, not a condition on
`|U| ×_|X| |U|` (Stacks, §83.5 (048M), Definition 83.5.4 and Lemma 83.5.17).
For an arbitrary pre-relation use its generated pre-equivalence relation as in Lemma 83.5.6.
Require also `φ` universally submersive (`|φ ×_X Z|` is a quotient map for every
`Z → X`); and the comparison `O_X → (φ_* O_U)^R` is an isomorphism (Stacks, Definition 83.10.1
(04AE)). The last clause is essential: without it `Spec k[ε]/ε² → Spec k` with the identity
relation satisfies every topological clause and is not a categorical quotient
(`test_dual_numbers_not_quotient` below). Apart from `finiteGroupQuotient_projective` below, the
geometric-quotient API here consists of this predicate and its tests; a general categorical
criterion, uniqueness theorem for geometric quotients, and flat-base-change or torsor construction
theorems are outside its scope. In particular,
a geometric quotient is not assumed to be a coequalizer in algebraic spaces. The direct-image sheaf is precomposition of the source structure sheaf by the étale-site
pullback functor. The invariant
sheaf is the native categorical equalizer of `pushforwardStructureSheafMap s` and
`pushforwardStructureSheafMap t`; `structureSheafToInvariants` is its lift of
`structureSheafMap φ` (Stacks, Definition 83.8.1 (04A9), Definition 83.10.1 (04AE)).
Prove `artinBootstrap`: an fppf sheaf `F` with a map `U → F`
from an algebraic space that is representable by algebraic spaces, flat, locally of finite
presentation and fppf locally surjective, is an algebraic space (Stacks, Theorem 80.10.1 (04S6),
Lemmas 80.11.1 (04SK), 80.11.6 (06PG), 80.11.7 (06PH)).

Prove `finiteGroupQuotient_projective`: let `S` be a Noetherian scheme, `f : Y → S` projective, and
`Γ` a finite group acting on `Y` by `S`-automorphisms; the action need not be free and `|Γ|` need
not be invertible on `S`. Every `Γ`-orbit of points of `Y` lies in a `Γ`-stable affine open, and the
affine invariant quotients of these opens (`TauCeti.AffineInvariantQuotient.quotient`) glue to a
scheme `Y/Γ` with `q : Y → Y/Γ` finite, surjective and `Γ`-invariant, `O_{Y/Γ} = (q_* O_Y)^Γ`, and
`q` satisfies `IsGeometricQuotient` and `IsCategoricalQuotient` for the action groupoid. For an
`f`-ample invertible `L` on `Y`, let `M := ⊗_{γ ∈ Γ} γ^* L` with its canonical `Γ`-linearization.
The invariant algebra `A := (⊕_{k ≥ 0} f_* M^{⊗k})^Γ` is a finitely generated graded quasi-coherent
`O_S`-algebra. Its degree-zero part `A_0 = (f_* O_Y)^Γ` is a finite `O_S`-algebra, in general not
`O_S`, and the theorem imposes no condition on it. For some `N > 0` the `N`-th Veronese subalgebra
`A^{(N)}`, whose degree-zero part is again `A_0`, is generated by `A_N` as a graded `A_0`-algebra.
`Y/Γ` is a closed subscheme of `relativeProj A^{(N)}` (§0.3, which takes this degree-zero part as
it is; `relativeProj_veronese` identifies it with `relativeProj A`), so `Y/Γ → S` is projective by
`relativeProj_closedImmersion`, and the restriction `L_Q` of `O(1)` is an invertible sheaf
relatively ample over `S`, with `q^* L_Q ≅ M^{⊗N}` compatibly with the
linearizations (Rydh 2013,
Proposition (3.8), p. 13, Definition (3.17), p. 18, Lemma (4.3) and Theorem (4.4), p. 20,
Proposition (4.7), case (B′), and its proof, pp. 20–22, Remark (4.9)(4), pp. 22–23; Stacks,
Section 39.23 (03BE)). Formation of `Y/Γ` is asserted to commute with flat base change on `S` only
(Stacks, Lemma 15.112.7 (0BRH)). *Needs:* §0.3, §1.7, §1.9, §1.10, §1.14, §1.15; Tau Ceti
`TauCeti.AffineInvariantQuotient`.

**Checks.**
- `Quotient.test_relative_ampleness`: for `Y=S=ℙ¹_k`, `f=id`, `Γ=1`, and `L=O(−1)`,
  the quotient is projective over `S` and `L_Q=O(−N)` is relatively ample but not absolutely ample.
  Over the affine base `Spec ℤ[1/m]`, relative ampleness does imply absolute ampleness.
- `Quotient.test_finite_affine`: for a finite group `Γ` acting on `Spec A`, `Spec A → Spec A^Γ` is a
  geometric quotient: two primes with the same contraction to `A^Γ` are conjugate, and
  `O_{Spec A^Γ} = (π_* O)^Γ`; this is Tau Ceti's `TauCeti.AffineInvariantQuotient.quotient` and
  `.projection` (ModularCurves 0C).
- `Quotient.test_scaling_plane`: `𝔸²_k → Spec k` is a categorical but not a geometric quotient for
  the scaling action of `𝔾_m` (the fibre over the point is not one orbit).
- `Quotient.test_punctured_plane`: `𝔸² ∖ {0} → ℙ¹` is a geometric quotient for scaling.
- `Quotient.test_line_no_geometric`: scaling on `𝔸¹` has no geometric quotient.
- `Quotient.test_dual_numbers_not_quotient`: for `U = Spec k[ε]/(ε²)`, `R = U` with `s = t = 𝟙` and
  `φ : U → Spec k`, every topological clause of `IsGeometricQuotient` holds, the comparison
  `k → k[ε]/(ε²)` is not an isomorphism, and `φ` is not a categorical quotient (`𝟙_U` is invariant
  and does not factor through `Spec k`); the identity-relation quotient is `U` itself, with its
  nilpotents, not its reduction.

- `IsGeometricQuotient_identity`: the identity relation and identity map satisfy the predicate.
- `IsGeometricQuotient_empty`: the identity quotient of the empty scheme satisfies it.
- `IsGeometricQuotient_translation_field`: on `U = Spec ℚ(t)`, let `R = ⨿_{n∈ℤ} U`
  with source identity on each component and target induced by `t ↦ t+n`.
  The structure map to `Spec ℚ` fails the predicate: in an algebraic closure of `ℚ(t)`,
  the points `t ↦ t` and `t ↦ 2t` are never related, even after field extension.
  The invariant functions are `ℚ` (and `L` after finite separable `L/ℚ`), so the
  invariant-sheaf clause does not conceal the failure of the geometric orbit clause.

- `invariants_swap_pair`: for `U = Spec(k × k) → X = Spec k`, with the exchange action
  encoded by `U ×_X U ⇉ U`, invariant sections are the diagonal copy of `k`; the comparison
  is an isomorphism.
- `pushforward_identity`: the identity direct image is the structure sheaf.
- `pushforward_empty`: the direct image from the empty scheme is the zero ring on each test
  object.
- `pushforward_affine`: for `Spec B → Spec A`, evaluation at the final object of the small
  étale site of `Spec A` gives `B`, agreeing with the native affine global-sections computation.
- `invariants_identity_relation`: for `s = t = id_U`, the invariant sheaf is `φ_* O_U`.
- `invariants_identity_quotient`: for `φ = id_X`, the comparison is an isomorphism, including
  the empty scheme.
- `invariants_dual_numbers`: for `Spec k[ε]/ε² → Spec k` and the identity relation, the comparison
  is not invertible; the nilpotent section survives in the invariant sheaf.
- `invariants_equalizer`: composing the comparison with the equalizer inclusion gives exactly
  `structureSheafMap φ`, the library equalizer-lift equation.

- `finiteGroupQuotient_sign_projectiveLine`: `Γ = ℤ/2` acting on `ℙ¹_ℤ` by `[x : y] ↦ [−x : y]`
  fixes `0` and `∞`, and `2` is not invertible on `Spec ℤ`. With `L = O(1)`, `M = O(2)` and its
  invariant sections in degree `k` are the forms in `x², y²` of degree `k`, so `N = 1`, `Y/Γ = ℙ¹_ℤ`,
  `q[x : y] = [x² : y²]` and `q^* O(1) ≅ M`.
- `finiteGroupQuotient_not_universal`: in the same example `Γ` acts trivially on the fibre over
  `𝔽_2`, whose quotient is `ℙ¹_{𝔽_2}` with the identity, while the fibre of `q` is the Frobenius
  `[x : y] ↦ [x² : y²]`, a universal homeomorphism that is not an isomorphism: formation of `Y/Γ`
  does not commute with the base change `ℤ → 𝔽_2`.
- `finiteGroupQuotient_swap_projectivePlane`: over a field `k`, `Γ = ℤ/2` exchanging the factors of
  `ℙ¹_k × ℙ¹_k` fixes the diagonal pointwise; the quotient is `ℙ²_k`, the space of binary
  quadratic forms up to scalars, via `q(a, b) = ab`, with `q^* O(1) ≅ O(1, 1)`. With the ample
  `L = O(1, 1)`, `M = L ⊗ σ^* L = O(2, 2)`, the invariant algebra is `⊕_k H⁰(ℙ²_k, O(2k))`, so
  `N = 1`, `L_Q = O_{ℙ²}(2)` and `q^* O(2) ≅ M`.
- `finiteGroupQuotient_two_components`: over `S = Spec k`, let `Y = ℙ¹_k ⊔ ℙ¹_k`, `Γ = 1` and `L`
  restrict to `O(1)` on each component. Then `M = L`, `N = 1` and
  `A_0 = Γ(Y, O_Y) = k × k ≠ k`, as in every Veronese subalgebra; `A` is generated in degree one
  over `A_0` and not over `k`, `relativeProj A = Y` and `q` is the identity. The algebra is the one
  of §0.3's `relativeProj_product_degreeZero`.

*Lean:* `Groups.IsInvariant`, `Groups.IsCategoricalQuotient`, `Groups.artinBootstrap`. The
invariant sections, `IsGeometricQuotient`, *IsCategoricalQuotient.unique* and
`finiteGroupQuotient_projective` are specified in this README only.

### 1.18 Stacks in groupoids, stackification and 2-fibre products

Define `StackInGroupoids`: a `SchPseudofunctor` whose fibre categories are groupoids (Mathlib
`IsGroupoid`) and which is a stack for `fppfTopology` (Stacks, Definitions 8.4.1 (026F), 8.5.1
(02ZI)); *StackInGroupoids.Hom* (strong transformations), `IsFibrewiseEquiv`. API:
*StackInGroupoids.ofSheaf* (the stack in setoids of an fppf sheaf), `yonedaEquiv` (`Hom(h_T, X) ≃
X(T)`; Lemma 8.6.3 (0432)), `isFiberedInGroupoids` (the Grothendieck construction is fibred in
groupoids), `limit` (stacks in groupoids are closed under limits), `test_trivial_torsor_prestack`.
Define the generic, site-level stackification first, and the scheme/fppf/groupoid version as
its specialisation: for any small site `(C, J)` (a category `C : Type u` with `Category.{u} C` and
`J : GrothendieckTopology C`) and any category-valued pseudofunctor
`F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}` — not required to be a prestack in Mathlib's sense (the
Hom presheaves need not be sheaves) and not required to be groupoid-valued — define
`Stack.stackification J F`, the associated stack for `J`, by Hom-sheafification followed by
adjoining descent objects (Stacks, Section 8.8 (02ZM), Lemmas 8.8.1 (02ZN), 8.8.2 (0435) and 8.8.3
(04W9), which construct the stackification of an arbitrary fibred category with its universal
property; Section 8.9 (02ZO), Lemma 8.9.1 (02ZP), is the case of categories fibred in groupoids used
by `stackification` below), with the unit
`Stack.toStackification` (a strong transformation `F → stackification J F`), and prove
`Stack.isStack_stackification` (Mathlib `IsStack` for `J`), `Stack.stackificationUniversal` (for
every `J`-stack `G`, precomposition with the unit is an equivalence between the categories of
strong transformations and modifications `stackification J F → G` and `F → G`: a 2-categorical
universal property), `Stack.stackification_of_isStack` (a stack is its own stackification),
`Stack.stackificationDiscreteEquiv` (for a discrete pseudofunctor from a presheaf of sets it is
Mathlib's `presheafToSheaf`), `Stack.stackification_isom_sheafify` (the `Isom` presheaves of the
stackification are the `J`-sheafifications of those of `F`) and
`Stack.stackification_locally_essSurj` (every object of the stackification is `J`-locally in the
image of the unit). Then `stackification` of a prestack in groupoids on `Scheme.{u}` for the fppf
topology, with `stackification.η`, `.lift`, `.isom_sheafify` and `.locally_essSurj`, is
`Stack.stackification fppfTopology` applied to a groupoid-valued `SchPseudofunctor`, and the
v-stacks of DiamondsAndVStacks D0.25 are `Stack.stackification` on `(Perfd, v)`; neither is a
second construction. Likewise define the generic 2-fibre product `Stack.twoFibreProduct` of two
maps of `J`-stacks over a common target on any site, objectwise Mathlib's
`CategoryTheory.Limits.CategoricalPullback` with its restriction functors and constraints, with
`.fst`, `.snd`, `.iso` (the 2-cell), `.lift` and its 2-universal property, and let
`twoFiberProduct X Y Z` with `.fst`, `.snd`, `.iso`, `.lift`, `.ofSheaf` (for sheaves it is the
fibre product of sheaves) be its fppf scheme instance (Stacks, Lemma 8.4.6 (026G) for 2-fibre
products of stacks, Lemma 8.5.6 (02ZL) for stacks in groupoids; Section 4.31 (003O)); DiamondsAndVStacks D0.26 is the `(Perf, v)` instance. The geometric separatedness
conventions stay separate from the carrier: proper-diagonal separatedness of algebraic stacks
(§1.19) is not identified with the closed-immersion-diagonal separatedness of DiamondsAndVStacks.
*Needs:* §1.1; Mathlib `Pseudofunctor`, `IsStack`, `IsPrestack`, `DescentData`, `toDescentData`,
`sheafHom`, `presheafToSheaf`, `IsGroupoid`, `StrongTrans`, `StrongTrans.Modification`,
`CategoricalPullback`, `CoGrothendieck`.

**Checks.**
- *StackInGroupoids.test_scheme*: `T ↦ Hom(T, X)` (discrete) is a stack in groupoids.
- *StackInGroupoids.test_torsors*: for `G` flat and locally of finite presentation, `T ↦` (groupoid
  of `G_T`-torsors) is a stack in groupoids `BG`.
- *StackInGroupoids.test_qcoh_not_groupoid*: the quasi-coherent pseudofunctor is a stack but not in
  groupoids.
- `stackification.test_stack`, `test_sheafification` (for a presheaf it is sheafification),
  `test_real_torsors` (the prestack of trivial `ℤ/2`-torsors over `Spec ℝ` stackifies to `B(ℤ/2)`,
  with the class of `Spec ℂ`).
- `twoFiberProduct.test_identity`, `test_schemes` (agrees with fibre products of schemes),
  `test_classifying` (`pt ×_{BG} pt = G`).
- `Stack.stackification.test_site_generic` (compatibility) — on the site of open subsets of a
  topological space with its canonical topology, the stackification of the constant prestack with
  fibre a fixed category `A` is the stack of locally constant `A`-valued data (descent objects
  glued from local sections, Stacks, Lemma 8.8.1 (02ZN)); on the one-point site it is `A` again, and
  the result is not groupoid-valued when `A` is not (take `A` with a non-invertible arrow).
- `Stack.stackification.test_circle_monodromy` (non-example) — connectedness of the base does not
  give `A` back: on the circle `S¹` with `A = B(C₂)`, the global fibre of the stackification is the
  groupoid of locally constant `C₂`-torsors, which has at least two non-isomorphic objects, the
  trivial double cover `S¹ ⨿ S¹ → S¹` and the connected cover `z ↦ z²` with deck action
  `z ↦ −z` (different numbers of components), while `B(C₂)` has one isomorphism class.
- `Stack.stackification.test_cat_valued` (non-groupoid) — the quasi-coherent pseudofunctor is a
  category-valued fppf stack and is its own stackification; the groupoid-only version does not
  apply to it.

*Lean:* `Stacks.StackInGroupoids`. Its morphisms and API, the generic site-level stackification
and 2-fibre products and their fppf/groupoid specialisations are specified in this README only.

### 1.19 Representable morphisms, algebraic stacks and Deligne–Mumford stacks

Define `IsRepresentableBySpaces f` for a 1-morphism of stacks in groupoids: for every scheme `T` and
object of `Y(T)` the 2-fibre product `T ×_Y X` is equivalent to the stack of an algebraic space over
`T` (Stacks, Definition 94.9.1 (02ZW)); `RepresentableProperty P f` for a property `P` of morphisms
of spaces stable under base change and fppf local on the base (Section 94.10 (03YJ)). API: `IsRepresentableBySpaces.baseChange`,
`.comp`, `diag_representable_iff` (the diagonal is representable iff every `T → X` is). Define
`IsAlgebraicStack X`: the diagonal is representable by algebraic spaces and there is a scheme `U`
with a smooth surjective `U → X` (Stacks, Definition 94.12.1 (026O)), with `.diagonal`, `.atlas`,
`.ofSpace`, `.twoFiberProduct` (a 2-fibre product of algebraic stacks is an algebraic stack and is
the 2-fibre product among algebraic stacks; Lemma 94.14.3 (04T2)), `.of_equiv`. Define
`IsDeligneMumford X`: an algebraic stack with an étale surjective `W → X` from a scheme (Definition
94.12.2 (03YO)), with `.iff_unramified_diagonal` (Theorem 101.21.6 (06N3)), `.isAlgebraic`, `.ofSpace`,
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
`IsSeparatedStack` (the diagonal is proper).

**Underlying topological spaces of algebraic stacks.** Define `Stacks.points X : TopCat`
for an algebraic stack `X` by field-valued objects modulo isomorphism after a common field
extension, with the quotient topology from a smooth surjective scheme atlas. Prove
`Stacks.points.ofSpace` and `.ofScheme` (agreement with §1.7 and the native scheme topology),
`.atlasIndependent` (comparison through `U ×_X U'`), `.map` (continuous, unchanged by
2-isomorphism, preserving identities and composition), and `.atlasOpenSurjective`.
Prove `.pullbackSurjective`: the map `|X ×_Y Z| → |X| ×_|Y| |Z|` is surjective, and
`.baseChangeImage`: the image of the base change of `h : W → X` along `Z → X` is the
inverse image of `|h|`'s image. These statements use the actual 2-fibre product.
Smooth atlases remain open surjective quotient maps after every base change to an algebraic
stack (`Stacks.points.atlasBaseChange`). Sources: Stacks, Definition 100.4.2 (04XG),
Lemmas 100.4.3 (04XH), 100.4.5 (04XJ), 100.4.7 (04XL), Definition 100.4.8 (04Y8).
*Needs:* §1.7, §1.18–§1.19; `SmoothLocal` and the smooth presentation below.

**Checks.**
- `stackPoints_scheme`: the identity atlas of a scheme recovers its topology; an étale
  presentation of an algebraic space recovers §1.7's topology.
- `stackPoints_classifying`: for the constant group `G = ℤ/2` over an algebraically closed
  field, `|BG|` is one point. The atlas `Spec k ⊔ Spec k → BG` gives the same topology
  as `Spec k → BG`.
- `stackPoints_pullback`: `Spec k ×_{BG} Spec k = G` has two points, while
  `|Spec k| ×_|BG| |Spec k|` has one. The comparison is surjective; it is not an identification
  of the underlying spaces.

Define `UniversallyClosedStack f` using `Stacks.points`: every base change
`X ×_Y Y' → Y'` to an algebraic stack induces a closed map. Define `QuasiCompactStack f`
by quasi-compactness of `|X ×_Y T|` for every affine scheme `T → Y`, and finite type by
`SmoothLocal` locally of finite type together with `QuasiCompactStack`. Define a locally
Noetherian algebraic stack by a locally Noetherian smooth scheme atlas, and prove independence
of that atlas (Stacks, Definition 100.7.2 (04YG), Remark 100.7.3 (04YH),
Definition 101.17.1). Define `IsProperStack` as separated, of finite type and universally
closed, with `IsProperStack.of_representable`, `.baseChange`
(Stacks, Definitions 101.4.1 (04YW), 101.13.2 (0513), 101.16.2 (06FN), 101.37.1 (0CL5)). Prove
`stack_presentation`: every algebraic stack is `[U/R]` for a smooth groupoid `(U, R)` of §1.14, and
the quotient stack of a smooth groupoid is algebraic; atlas independence (Stacks, Theorem 94.17.3
(04TK), Lemma 94.16.2 (04T5), Theorems 97.16.1 (06DC), 97.17.2 (06FI)). *Needs:* §1.7, §1.8, §1.9, §1.14,
§1.19.

**Checks.**
- `inertia.test_space` (trivial), `test_BG` (`I_{BG} = [G/G]` by conjugation), `test_S3` (the
  automorphism group of the trivial `S_3`-torsor is `S_3`).
- `Properties.test_BG_finite` (`BG → S` is proper for finite constant `G`), `test_BGm`
  (`B𝔾_m → Spec ℤ` is smooth and of finite type but not separated), `test_doubled_origin` (the
  affine line with doubled origin is of finite type and not separated), `test_projective_line`
  (`ℙ¹ → Spec k` is proper as a stack).

**Properness from DVR lifts after extension.** This subsection owns the stack criterion.
For `f : X → Y`, `j : Spec K → Spec R`, `x : Spec K → X`, `y : Spec R → Y` and a
specified 2-isomorphism `γ : y ∘ j ≅ f ∘ x`, define `Stacks.ValuativeLift` as data
`a : Spec R → X`, `α : a ∘ j ≅ x`, `β : y ≅ f ∘ a`, with
`γ = (id_f ⋆ α) ∘ (β ⋆ id_j)`, including the pseudofunctor coherence isomorphisms.
Its arrows are isomorphisms `θ : a ≅ a'` satisfying
`α = α' ∘ (θ ⋆ id_j)` and `β' = (id_f ⋆ θ) ∘ β`. Construct this groupoid and prove its
compatibility with 2-base change. `Stacks.ValuativeLift.reidentify` composes `α` with a
chosen `e : x ≅ x'` and replaces `γ` by `(id_f ⋆ e) ∘ γ`, preserving compatibility
(Stacks, Definition 101.39.1 (0CLA), Lemmas 101.39.2 (0CLC), 101.39.4 (0CLE)).

Define `StackDVRLiftingAfterExtension f`: for every DVR `R`, fraction field `K` and
such specified diagram, there are a field extension `K'/K` and a valuation ring `R' ⊆ K'`
with fraction field `K'` dominating `R`, and a `ValuativeLift` of the pulled-back diagram
with its induced `γ'`. Domination means an injective local ring map `R → R'`, compatible
with the inclusions into `K'`; the base and generic restriction maps commute.
The allowed `R'` need not be a DVR, and `K'/K` need not be finite. A chosen-place DVR
extension supplied by StableReduction is sufficient lifting data. Prove
`IsProperStack.ofDVRLifting`: if `X`, `Y` are algebraic stacks, `Y` is locally Noetherian,
`f` is separated and of finite type, and `StackDVRLiftingAfterExtension f`, then
`IsProperStack f`. This is Stacks, Lemma 106.11.3 (0CQM) with `h = id_X`: the identity
is of finite type and its image is dense. It tests every generic object of `X`.
The theorem includes the Noetherian reduction from valuation rings to these DVR tests
and derives universal closedness for the topology above.
Prove `IsProperStack.representableComparison`: for scheme morphisms the compatible lift
groupoid is canonically equivalent to the discrete groupoid of Mathlib's
`ValuativeCommSq.commSq.LiftStruct`,
and stack properness agrees with native `IsProper` (Stacks, Lemmas 101.39.9 (0CLJ),
101.39.13 (0CLN); Mathlib `IsProper.eq_valuativeCriterion`).
*Needs:* the topology, morphism properties and presentations above; §1.18–§1.19.

**Checks.**
- `stackDVR_ramified_classifying`: for `R = ℂ[[t]]`, `K = ℂ((t))` and constant
  `G = ℤ/2`, the proper DM stack `BG → Spec ℂ` has the generic torsor
  `Spec K(√t)`. It has no lift over `R`: finite étale torsors over this strictly henselian
  ring are trivial, and `t` has odd valuation so is not a square in `K`. After
  `R → ℂ[[u]]`, `t ↦ u²`, it is trivial and extends with its chosen generic identification
  (Stacks, §101.39 (0CL9), example after Definition 101.39.10).
- `stackDVR_representable`: `ℙ¹_ℤ → Spec ℤ` has unique lifts over the original valuation
  ring by Mathlib's `IsProper.eq_valuativeCriterion`; their discrete lift groupoids give
  the same properness through `IsProperStack.ofDVRLifting`.
- `stackDVR_separation_required`: `B𝔾_m → Spec ℤ` satisfies DVR existence even without
  extension, since a line over a field is trivial and extends as a free line. Its diagonal
  has fibre `𝔾_m`, which is not proper; the separatedness hypothesis excludes it.

*Lean:* `Stacks.ValuativeLift` retains `genericIso` (`α`), `baseIso` (`β`) and
`compatibility` for the restriction along any scheme morphism `j`;
`Stacks.ValuativeLift.reidentify` transports
the chosen generic identification. The stack topology and properness criterion are specified
in this README only.

### 1.21 Quotient stacks, line bundles with a section, root stacks

Define first the generic quotient stack on any site `(C, J)`: for a groupoid object `(X, R)` in
`J`-sheaves (source and target `s, t : R → X`, composition, identity, inverse), `Stack.quotient J
(X, R) = [X/R]` is the `Stack.stackification` (§1.18) of the objectwise groupoid prestack with
objects `X(T)` and arrows `R(T)`, with `Stack.quotient.π : X → [X/R]`, the equivalence
`R ≃ X ×_{[X/R]} X` (from the groupoid axioms), the description of its objects over `T` as
locally trivial `R`-torsors, `.desc` and the sheafification of `X/R` as its sheaf of isomorphism
classes (Stacks, Definition 78.20.1 (044Q) with the unit and 2-cell of Lemmas 78.20.2 (044R) and
78.20.3 (044S); the 2-cartesian square, Lemma 78.22.2 (04M9); the 2-coequaliser property, Lemma
78.23.2 (044U); objects as descent data `(u_i, r_ij)` along a covering, which are the locally trivial
`R`-torsors, and isomorphisms as compatible local sections of `R`, whence the isomorphism classes,
Lemma 78.24.1 (044X); the arguments are site-independent); DiamondsAndVStacks D0.26 is the `(Perf, v)` instance.
Then `quotientStack (U, R)` for a groupoid scheme and `actionQuotient G X = [X/G]` with
`actionQuotient.torsorEquiv` (objects over `T` are `G_T`-torsors with equivariant maps to `X`),
`quotientStack.π : U → [U/R]`, `.isCartesian`, `.desc`, `.torsor` (`π` is a `G`-torsor for
`[X/G]`) are the fppf scheme instances of `Stack.quotient`. Prove `quotientStack_algebraic`: `[U/R]` is algebraic for a flat locally finitely
presented groupoid (Stacks, Theorem 97.17.2 (06FI); Theorem 94.17.3 (04TK) is the smooth case), and
`[X/G]` is Deligne–Mumford iff its diagonal is unramified, that is iff the stabilizer group spaces
of the action are unramified (Morphisms of Stacks, Definition 101.4.1 (04YW) and Theorem 101.21.6
(06N3)). Prove `lineBundleSectionStack`: `[𝔸¹/𝔾_m]` classifies pairs `(L, s)` of a
line bundle with a section (Cadman 2005, §2.2, p. 6). Define `rootStack n (L, s)` for a line bundle
with a section and `n ≥ 1`, the fibre product `X ×_{[𝔸¹/𝔾_m]} [𝔸¹/𝔾_m]` along the `n`-th power
map, with `.baseChange`, `.one` (`n = 1` is `X`), `.isIso_away` (an isomorphism over `s ≠ 0`),
`.affineChart` (`Spec A[t]/(t^n − s)` modulo `μ_n` over `Spec A` with `L` trivial), `.isDeligneMumford_of_invertible`
(`n` invertible on the base), `.transition` (Cadman 2005, Definitions 2.1, 2.3, 2.5, Theorem 2.2, Proposition
2.4, §§2.1–2.2, pp. 3–6). *Needs:* §1.13, §1.14, §1.15, §1.19, §1.20.

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
*QCoh.pullback*, *QCoh.presentationEquiv* (for `X = [U/R]`, quasi-coherent modules on `U` with
descent data; Proposition 96.14.3 (06WT)), *QCoh.ofSpaceEquiv* (agreement with §1.11 for spaces).
For a quasi-compact quasi-separated morphism `f : X → Y` of algebraic stacks, construct
*QCoh.pushforward* as the quasi-coherent right adjoint to `QCoh.pullback f`, with
`QCoh.pullbackPushforwardAdjunction` and its natural Hom equivalence. Under `QCoh.ofSpaceEquiv`
it agrees with the quasi-coherent pushforward for algebraic spaces of §1.11.
Prove the flat-test comparison: for every flat test morphism `y : T → Y`, evaluation of
this right adjoint at `y` agrees naturally with the ordinary big-fppf-site direct image.
The right adjoint is obtained by applying the quasi-coherent replacement to that direct image;
ordinary big-site direct image need not preserve quasi-coherence (Stacks, Proposition 103.11.1
(077A), Lemma 103.11.2 (0GQQ), Section 103.11 (070A)). *Needs:* §1.1, §1.11, §1.18,
§1.21; Mathlib `CoGrothendieck`.

**Checks.**
- *QCoh.test_scheme*, `test_BG_representations` (for an affine group scheme `G` over a field,
  `QCoh(BG)` is the category of comodules of `O(G)`), `test_pushforward_invariants` (for a finite
  group `G` acting on `Spec A` and `π : [Spec A/G] → Spec A^G`, `π_* O = Ã^G`),
  `test_BG_not_exact` (for `G = ℤ/p` over `𝔽_p`, `π_* : QCoh(BG) → Vect` is not exact).

- `test_qcoh_pushforward_adjunction`: for an affine scheme map, the Hom equivalence becomes
  extension of scalars adjoint to restriction of scalars.
- `test_qcoh_pushforward_space`: for `j : 𝔸²_k ∖ {0} → 𝔸²_k`, the space equivalence carries
  `QCoh.pushforward j O` to `O_{𝔸²_k}`; flat test objects give the same sections as raw direct image.
- `test_big_pushforward_not_quasicoherent`: the raw big-fppf `j_* O` for this `j` has global
  sections `k[x,y]`, but evaluates to zero on `Spec k → 𝔸²_k` at the origin. A quasi-coherent
  sheaf with those global sections would evaluate to `k`, so raw direct image is not quasi-coherent.

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
is locally of finite type (hence locally of finite presentation) over `S` when `S` is locally
Noetherian, and formation of `M` commutes with flat base change
(Rydh, manuscript dated 2012-05-04, Theorem (6.12), pp. 27–28).
Use its representable étale fixed-point-reflecting cover with finite flat presentation,
construct the coarse quotient there by Theorem (4.4), and descend by Theorem (6.10).
The latter supplies compatibility with flat base change. The local-finite-type conclusion
uses the locally Noetherian hypothesis on `S`; no quasi-compact separated diagonal is
imposed on `X`. Conrad 2005, Theorem 1.1, pp. 1–2, is the specialization under his
standing quasi-compact separated diagonal convention. Prove `finite_quotient_coarse`: for a finite group `G` acting on an affine scheme `Spec A`,
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
`galois_descent_affine`: for an algebraic Galois extension `k'/k`, fpqc descent
data on affine `k'`-schemes are equivalent to **continuous semilinear actions** on
their coordinate algebras. Define `ContinuousSemilinearAction k k' A` by a group
homomorphism `ρ : Gal(k'/k) → RingAut A`, the scalar identity
`ρ(σ)(c·a) = σ(c)·ρ(σ)(a)`, and openness of `{σ | ρ(σ)(a) = a}` for each `a : A`.
Thus the coordinate algebra has the discrete topology. Prove
*ContinuousSemilinearAction.continuous_iff* (this condition is joint continuity for
that topology), `.standard` (scalar extension gives such an action), `.finite`
(every semilinear action for a finite Galois extension satisfies it), and
`galois_descent_affine`: the invariant `k`-algebra `A₀` has an equivariant
isomorphism `k' ⊗_k A₀ ≅ A`, functorial in equivariant algebra maps. Prove
`galois_descent_hopf` with the same continuity condition and Hopf-compatible actions;
Hopf operations descend with the algebra ([Milne, Algebraic Groups, A.64, pp. 580–581](https://www.jmilne.org/math/Books/iAG2017.pdf)).
Finite Galois descent agrees with Stacks §35.6 (0CDQ). The open subgroup may depend
on the algebra element: no single finite quotient is required to carry the whole
semilinear action, including its scalar action. Define `CrossedModule Ht H`: a
homomorphism `∂ : H̃ → H` and an action of `H` on `H̃` by automorphisms with `∂(h·x) = h ∂(x) h⁻¹`
and `∂(x)·y = x y x⁻¹` (Kisin 2017, §3.2.1, pp. 39–40), with `.quotientCategory` (objects `H`,
morphisms `H̃`), `.isGroupoid`, `.isoClasses` (`coker ∂`), `.aut` (`ker ∂`, central), `.kernel_central`.
*Needs:* Mathlib `CommHopfAlgCat`, `krullTopology`, `MonoidHom.ker`, `IsGroupoid`; Tau Ceti
`ScalarAut.instMulSemiringAction`.

**Checks.**
- `SemilinearAut.test_gm_conjugation` (for `ℂ/ℝ`, `H = 𝔾_m`, complex conjugation on `ℂ[t^{±1}]`),
  `test_identity_not_semilinear` (the identity is not `σ`-semilinear for `σ` conjugation),
  `test_trivial_extension` (for `k' = k`, `SemilinearAut H 1 = Aut H`), `test_standard_points`.
- *ContinuousSemilinearAction_scalar_extension*: the action
  `σ(c ⊗ b) = σ(c) ⊗ b` on `k' ⊗_k B` has open stabilizers, since each tensor is
  a finite sum and its algebraic coefficients lie in a finite extension.
- *ContinuousSemilinearAction_discontinuous_inversion*: a character
  `χ : Gal(ℚ̄/ℚ) → {±1}` with non-open kernel acts abstractly on `ℚ̄[t,t⁻¹]` by
  the field action and `t ↦ t^{χ(σ)}`. Its stabilizer of `t` is `ker χ`, so it
  cannot define `ContinuousSemilinearAction` or descend equivariantly. Such a
  character comes from a nonzero linear functional on `(∏ ℤ/2)/(⊕ ℤ/2)` and the
  infinite multiquadratic quotient; the kernel contains a dense proper subgroup.
- *ContinuousSemilinearAction_finite*: for a finite Galois extension the Krull
  topology is discrete, so every semilinear coordinate-algebra action qualifies.
- `CrossedModule.test_identity` (`∂ = id` with conjugation: the quotient category is the
  indiscrete groupoid on `H`), `test_trivial` (`H̃ = 1`: discrete), `test_center` (`SL_2(ℂ) →
  PGL_2(ℂ)`: isomorphism classes `PGL_2/im = 1`, automorphisms `μ_2`),
  `test_peiffer_needed` (`∂ = id : S_3 → S_3` with the trivial action violates the Peiffer identity).

*Lean:* `GaloisGerbs.ContinuousSemilinearAction`, `GaloisGerbs.galois_descent_affine` (stated as
the existence of a `k`-algebra `B` with an equivariant isomorphism `k' ⊗_k B ≅ A`), with
*ContinuousSemilinearAction_discontinuous_inversion* as an `example`. Semilinear automorphisms, the
identification of `B` with the invariants, functoriality, the Hopf version and crossed modules are
specified in this README only.

### 1.25 Galois gerbs

This subsection continues the strand `GaloisGerbs`, whose part in `Suggested.lean` is the descent
statement of §1.24; the definitions and theorems below are specified in this README only. For a
discrete group `N` and topological groups `E`, `Γ`, define `TopologicalExtension N E Γ`: a Mathlib
`GroupExtension N E Γ` whose kernel inclusion is a topological embedding and whose quotient map is a
continuous quotient map, with `kernel_iff`, `inl_project`, `continuous_projection`. Define
`LocalSplitChart T`: an open subgroup `U ⊆ Γ`, a continuous homomorphism `s : U → E` with `q ∘ s`
the inclusion, and a homeomorphism `N × U ≅ q⁻¹(U)`, `(n, u) ↦ i(n) s(u)`, with `section_one`,
`section_mul`, `chart_value`. Define `GaloisGerb`: for `k` of characteristic zero, `k'/k` Galois
inside an algebraic closure and `Γ = Gal(k'/k)`, a linear algebraic group `H/k'` and a topological
extension `1 → H(k') → E → Γ → 1` with discrete kernel, together with the algebraicity condition:
conjugation by an element of `E` over `σ ∈ Γ` is induced by a `σ`-semilinear algebraic automorphism
of `H` (§1.24). These chosen automorphisms form an action of `E`, restricting to algebraic inner
conjugation on kernel elements, witnessed on a splitting chart whose induced semilinear action on
`O(H)` has open stabilizers of individual algebra elements. Descent on every such
chart uses `ContinuousSemilinearAction`, with Hopf compatibility; a bare topological extension is not a gerb (Kisin
2017, §3.1.1–3.1.2, pp. 34–36), with `.kernel`, `.local_chart` (every gerb has a local splitting
chart), `.conjugation` (the semilinear automorphism of `H` induced by an element of `E` over `σ`,
through §1.24), `neutral H` for `H = H₀ ⊗_k k'` (the neutral gerb `H(k') ⋊ Γ`
with its continuous standard coordinate action), `.base_extension` (preserving open
coordinate stabilizers). Define
`GaloisGerbMorphism E E'`: a continuous homomorphism over `𝟙_Γ` together with an algebraic
`k'`-group homomorphism `H → H'` whose map on points agrees with the extension map on the kernel
and which intertwines the algebraic semilinear conjugation actions of `e` and `f(e)` for every
`e ∈ E`. This scheme-level compatibility defines the maps on extended kernels over arbitrary
algebras, with `identity`, `comp`, `kernel_points`; `GerbConjugacy f_1 f_2`: there is `h ∈ H'(k')` with
`Int(i'(h)) ∘ f_1 = f_2` as gerb morphisms, including equality of their algebraic kernel maps,
with `refl`, `symm`, `trans` (conjugators are retained as data, never
quotiented before an application asks).

For a commutative `k`-algebra `R`, set `A_R = k' ⊗_k R`. Construct the extension `E_R` by
pushing out its kernel along `H(k') → H(A_R)`: in `(H(A_R) ⋊ E)/N`, `E` acts by its algebraic
semilinear conjugation with `σ` acting on `k'` and trivially on `R`, and `N` is the normal
subgroup generated by `(i_R(a)⁻¹, i(a))` for `a ∈ H(k')`. Prove that this is an extension of `Γ`
by `H(A_R)`, functorial in `R`, with the induced maps `(f_i)_R : E_R → E'_R` and agreement at
`R = k`. This pushout and its morphisms are targets of this subsection (Kisin 2017, §3.1.1, p. 35).
Define `conjugatorScheme f_1 f_2` to be the affine **`k`-scheme** `Isom(f_1,f_2)` representing
`R ↦ {h ∈ H'(A_R) | Int(h) ∘ (f_1)_R = (f_2)_R}`. Each extended morphism includes its
scalar-extended algebraic kernel map; equality in this formula includes that component, not only
equality of the abstract point-group maps. Prove that its `k`-points are exactly the witnesses in `GerbConjugacy f_1 f_2`.

This subsection owns `conjugator_representability` and its descent/comparison bridges; §1.24
supplies generic continuous semilinear descent. First construct the closed affine `k'`-transporter
`T = {h ∈ H' | Int(h) ∘ f_1^alg = f_2^alg}`, with equality of algebraic group morphisms, on every
`k'`-algebra. For a lift `e ∈ E` of `σ`, define the descent action on `T` by
`h ↦ f_2(e) h f_1(e)⁻¹`, interpreting multiplication in the extended target gerb. Prove algebraic
`σ`-semilinearity, independence of the lift (using the transporter equation), the action laws,
and open stabilizers of coordinate-algebra elements (using a common open splitting chart and
continuity of the morphisms). Apply §1.24 to descend `T`; prove the functor-of-points formula above
and the base-change isomorphism `Isom(f_1,f_2) ×_k k' ≅ T`, natural in the maps and scalar
extensions (Kisin 2017, §3.1.1 and the descent construction in Lemma 3.1.2(1), pp. 35–36).
For `f_1 = f_2 = f`, descend multiplication and inversion: `I_f` is an affine `k`-group and
`I_f ×_k k' ≅ Cent_{H'}(f^alg(H))`. For distinct maps the transporter may be empty; when it is
fppf-locally nonempty, prove that it is an `(I_{f_2}, I_{f_1})`-bitorsor, with left and right
multiplication, rather than assigning it a group structure. Define `ProGerb`: a compatible
projective system of gerbs with continuous extension transitions and algebraic kernel transitions,
with `.stage`, `.transition`, `.stagewise_conjugate`, and pro-morphisms; all chartwise Hopf descent
retains the open-stabilizer condition. Prove `splitting_field_extension`: for
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
- `conjugator_neutral_real_points`: for `E = ℂˣ ⋊ Gal(ℂ/ℝ)` and `f = id`, commuting with the
  conjugation lift requires `h/overline(h) = 1`. Thus `I_f(ℝ) = ℝˣ` and `I_f = 𝔾_{m,ℝ}`;
  `ℝˣ` is Zariski dense in `𝔾_m(ℂ)` and is not its closed complex conjugator subscheme.
- `conjugator_neutral_baseChange`: the same example has
  `I_f ×_ℝ ℂ = 𝔾_{m,ℂ} = Cent_{𝔾_{m,ℂ}}(𝔾_{m,ℂ})`, with complex points `ℂˣ`.
- `conjugator_trivial_extension`: for `k' = k` algebraically closed, the pushout is ordinary
  kernel scalar extension and `Isom(f_1,f_2)` is the algebraic transporter.
- `conjugator_empty_transporter`: over algebraically closed characteristic-zero `k`, the identity
  and square maps of `𝔾_m` are not conjugate; their transporter is empty and is not a group.
- `ProGerb.test_constant` (a constant system recovers the gerb), `test_kottwitz` (the Kottwitz
  protorus has character group `ℚ`, the direct limit of integral character lattices
  of its finite-dimensional torus stages), `test_wrong_global_conjugacy`
  (stagewise nonempty conjugator sets alone do not give compatible witnesses: the inverse-limit
  argument must use the transition maps and additional compactness hypotheses).

### Examples

The folded line and `𝔸¹/ℤ` (§1.12) separate "algebraic space" from "scheme"; `B𝔾_m`, `Bμ_p` and
`B(ℤ/p)` over `𝔽_p` separate algebraic, Deligne–Mumford and tame (§§1.19, 1.23);
`Spec L → Spec K` for a quadratic Galois extension is the standing nontrivial torsor (§1.15); the
dual numbers over a point separate geometric from topological quotients (§1.17).

### Dependencies

Layer 0: §0.12–§0.14 (henselian pairs), §0.21 (excellence,
in §1.23's Keel–Mori). Layer 2: §2.3 (the torsor-class carrier) and §2.11 (Hilbert 90) are used by
§1.15 and §1.16 only; §2.3 depends on nothing in Layer 1, so the graph is acyclic. Mathlib and Tau
Ceti as listed; ModularCurves 0B–0E and 9D; StableReduction Layer 2.

## Layer 2: sites and scheme cohomology

The cohomology layer. On top of Mathlib's `Sheaf.H` it provides the generic functoriality of sheaf
cohomology on sites (pullback, higher direct images, Leray and Čech spectral sequences, torsors and
nonabelian `H¹`, the boundary for short exact sequences of abelian sheaves, Godement resolutions,
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
Mathlib's `Field.absoluteGaloisGroup`. Finite-coefficient and adic étale cohomology, Artin comparison
and trace formulas are downstream consumers. Scheme Frobenius is §0.29's scheme-level API,
with relative twists and finite-field cardinality explicit. Affine acyclicity, the Čech computation, flat
base change and Jacobians are JacobianChallenge Layers A–D, and so are general proper coherence and
coherent higher direct images (its Layer C, in the shared `Cohomology/{Proper,Pushforward}.lean`);
the relative dualising sheaf of a proper flat finitely presented Gorenstein curve is StableReduction
Layer 2, which derives the curve-family specialisations of Layer C but owns no second
proper-pushforward API; Hilbert 90 for fields, Kummer theory and
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
(pb.obj G).H n` for every abelian sheaf `G` on `D` and `n ≥ 0`, writing `f^{-1} = pb`: the composite
`H^n(D, G) → H^n(D, f_* f^{-1} G) → H^n(D, Rf_* f^{-1} G) = H^n(C, f^{-1} G)` of the unit with the
identification `RΓ(D, Rf_* F) = RΓ(C, F)` (Stacks, Remark 21.14.4 (08J6), which rests on the total
acyclicity of `f_*` of an injective, Lemma 21.14.1 (072Z)); on a slice `C/U` this is the
identification of Lemma 21.7.1 (03F3), and for functors as in Lemma 21.7.2 (03YU) it is an
isomorphism. It comes with `pullback_zero` (in degree `0`, composed with `Sheaf.H.equiv₀`, it
is restriction of sections), `pullback_naturality` (in `G`), `pullback_id`, `pullback_comp` (along a
composite, through `u⁻¹ v⁻¹ ≅ (v u)⁻¹`), `pullback_δ` (commutes with the connecting homomorphisms of
a short exact sequence and its exact pullback). Define `Sheaf.higherDirectImage pf i := pf.rightDerived
i` for the sheaf pushforward `pf` of a morphism of sites (Grothendieck abelian source), with
`higherDirectImage_zero` (`R⁰f_* ≅ f_*`), `higherDirectImage_iso_sheafify` (`R^i f_* F` is the
sheafification of `V ↦ H^i(u(V), F)`), `higherDirectImage_δ` (long exact sequence),
`Sheaf.derivedPushforward` (`Rf_* : D⁺(Ab(C)) → D⁺(Ab(D))`) and `derivedPushforward_comp` (`R(g∘f)_* ≅
Rg_* Rf_*`, pushforward preserves injectives) (Stacks, Lemma 21.7.4 (072W) for the sheafification
description; for abelian sheaves the morphism of ringed topoi is flat, so `f_*` preserves injectives
by Lemma 21.14.2 (0730)). This subsection and §2.2 own the generic site/D⁺ construction,
including its small-étale specialization. Downstream finite-module extensions compare their
coefficient-forgetting functors with this construction, naturally in maps of schemes and
coefficients, retaining their constructibility and Tor hypotheses.
*Needs:* Mathlib
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
(Stacks, Lemmas 21.14.5 (0732), 21.14.7 (0734), in Section 21.14 (072X)). Prove `cech_to_cohomology`: for a covering `U` of `V`, the
Čech-to-cohomology spectral sequence `Ȟ^p(U, H^q(F)) ⇒ H^{p+q}(V, F)`, and Leray's acyclicity
theorem: if `H^q(U_{i_0…i_p}, F) = 0` for all `q > 0` and all finite intersections, then Čech
cohomology computes `H^*(V, F)` (Stacks, Lemmas 21.10.1–21.10.7 (03AV); Theorem 59.19.2 (03OW)).
Spectral sequences are stated with Mathlib's `CategoryTheory.Abelian.SpectralObject` and
`HasSpectralSequence`, attached to the filtered complexes of injective resolutions. *Needs:* §2.1;
Mathlib `SpectralObject`, `HasSpectralSequence`, `Arrow.cechNerve`.

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
isomorphism) (Stacks, Definition 21.4.1 (03AH)). Define `NonabelianH1 J G : Type (u+1)`, the pointed
set of isomorphism classes of `G`-torsors, with the base point the trivial torsor `G`. This is the **one carrier of torsor classes** of the roadmap: Layer 1's
geometric torsor classes are `NonabelianH1` of the big fppf site over `S` with coefficients `h_G`
(§1.15), and Layer 3's Picard torsors are its `𝔾_m`-instances. API: `NonabelianH1.mk P h` (the class
of a torsor), `mk_eq_one_iff` (the base point iff `P` has a global section; Stacks, Lemma 21.4.2
(03AI)), `map φ` for a
homomorphism `G → G'` (by contracted product, with `map_id`, `map_comp`, `map_one`),
`pullback` along a morphism of sites (compatible with composition), `connecting` (for an exact
sequence `1 → A → B → Q → 1` of sheaves of groups, `Q(C) → NonabelianH1 J A` sends a section to its
torsor of lifts), `exact_sequence` (`1 → A(C) → B(C) → Q(C) → H¹(A) → H¹(B) → H¹(Q)` is exact as
pointed sets), and the comparison `equivSheafH`: for an abelian sheaf `G`, `NonabelianH1 J G ≃
Sheaf.H G 1` sending `mk P` to the class of the extension `0 → G → P̃ → ℤ → 0` built from `P`,
compatible with `map`, `pullback` and `connecting` (the bijection itself is Stacks, Lemma 21.4.3
(03AJ); `connecting`, `exact_sequence` and these compatibilities are targets of this roadmap, with no
Stacks counterpart for sheaves of non-abelian groups). *Needs:*
Mathlib `Sheaf`, `GrpCat`, `Sheaf.H`. Čech refinement diagrams and their colimits are outside
the torsor-class interface here; an arbitrary family of objects is not a covering.

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

### 2.4 Abelian-extension boundaries

For a short exact sequence `E : ShortComplex (Sheaf J AddCommGrpCat)` on a site, with
`HasSheafify J AddCommGrpCat` and `HasExt` for abelian sheaves, define `abelianBoundary J hE` on
`NonabelianH1 J (toGrpSheaf E.X₃)` by applying `NonabelianH1.equivSheafH` and then Mathlib's
`Sheaf.H.δ hE 1 2 rfl`. The named targets `abelianBoundary_eq_zero_iff` and
`abelianBoundary_naturality` identify vanishing with lifting through `H¹(E.X₂)` and give
compatibility with a commuting diagram of short exact sequences (Stacks, Sections 21.3
(071J), 21.4 (03AG); Mathlib, `CategoryTheory/Sites/SheafCohomology/ExactSequences.lean`,
`Sheaf.H.longSequence_exact₃`, `Sheaf.H.δ_naturality`). This subsection is restricted to abelian
middle sheaves. Boundaries for general central extensions, Čech representatives and banded-gerbe
classification are outside its scope. Stacks, Lemma 21.11.1 (0CJZ), assumes cofinal local `H¹`
vanishing and global `H²` vanishing to obtain an object of a gerbe whose automorphism sheaves are
abelian; it does not supply that classification. *Needs:* §2.3; Mathlib `Sheaf.H`, `HasExt`, `ShortComplex.ShortExact`.

**Checks.**
- `abelian_boundary_library`: on any torsor class the value is exactly the native connecting
  map after `equivSheafH`; the equality is definitional.
- `abelian_boundary_trivial`: the trivial torsor maps to zero.
- `abelian_boundary_split`: if the projection of the short exact sequence is split epi, every
  torsor class has zero boundary.
- `abelian_boundary_nonliftable`: if the corresponding `H¹(E.X₃)` class is outside the image
  of `H¹(E.X₂)`, its boundary is nonzero.

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
(02UZ)). Prove `cohomology_filtered_colimits`: for a site `C`, fix a class `B` of objects and a collection
`Cov` of coverings such that every
covering in `Cov` is finite, its target and covering objects lie in `B`, and every nonempty finite
Čech fibre product exists and lies in `B`. For each `U ∈ B`, coverings of `U` in `Cov` must be
cofinal among all coverings of `U`. Then for every `U ∈ B`, every `p ≥ 0` and every small filtered
diagram of abelian sheaves `F_i`, the natural map
`colim_i H^p(U,F_i) → H^p(U,colim_i F_i)` is an isomorphism, with the colimit on the right taken
in abelian sheaves (Stacks, Lemma 21.16.1 (0739), Section 21.16 (0737)). A global-cohomology
specialization requires a terminal object belonging to `B` with these same covering and
Čech-product conditions; a basis of quasi-compact opens alone does not give this specialization.
*Needs:* §2.1; Mathlib `TopCat.Sheaf`, `IsFlasque`, `NoetherianSpace`,
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
- `filtered_colimits_test_affine`: on the Zariski site of an affine scheme, quasi-compact opens
  with finite open coverings and quasi-compact finite intersections give the comparison in every degree.
- `filtered_colimits_test_finite_discrete`: global sections on a finite discrete space are a
  finite product and commute with filtered colimits.
- `filtered_colimits_test_infinite_discrete`: on `ℕ` with the discrete topology, let `F_E` be the
  sheaf equal to `ℤ` on a finite subset `E` and zero elsewhere. The filtered colimit over finite
  subsets is the sheaf equal to `ℤ` at every point. The global degree-zero comparison is
  `⊕_n ℤ → ∏_n ℤ`, which is not surjective, despite the basis of quasi-compact singleton opens.

*Lean:* `SiteCohomology.noetherianSpace_vanishing` (abelian sheaves on a Noetherian topological
space of Krull dimension `≤ d`).

### 2.6 Quasi-coherent cohomology

Prove `qcoh_higherDirectImages`: for `f : X → S` quasi-compact and quasi-separated and `F`
quasi-coherent, `R^p f_* F` is quasi-coherent, computed on affines by `H^p(f⁻¹ U, F)`, commutes with
flat base change and commutes with filtered colimits. For **affine `S`**,
`QCoh.higherDirectImage_vanishing` gives a bound depending only on the qcqs map `f`
for all quasi-coherent `F`; on a general base the bound is local on affine opens (Stacks, Lemmas 30.4.1–30.4.6 (01XH)). Prove `projectiveSpace_cohomology`:
`H^q(ℙ^n_A, O(d))` for every `q`, `d` and ring `A`: `Sym^d` in degree `0`, the dual module in degree
`n`, zero otherwise (Stacks, Lemmas 30.8.1–30.8.3 (01XS)). Prove `ample_serre_vanishing`: for `X`
proper over a Noetherian ring and `L` ample, every coherent `F` has `H^q(X, F ⊗ L^n) = 0` for `q > 0`
and `n ≫ 0` (Stacks, Lemma 30.17.1 (0B5U), in Section 30.17 (01XO)).
AbundanceStatement §4D / item 1 (by RoktimMascharak) states the projective characteristic-zero
special case of `ample_serre_vanishing`. This subsection owns the general proper-Noetherian-base
theorem; *serreVanishing_abundanceSpecialization* identifies its projective characteristic-zero
specialization with the supplier's line-bundle powers and cohomology conventions.
For the same proper Noetherian-base hypotheses, `H^q(X, F)` is a finite module over the base ring
for every `q`, supplied by JacobianChallenge `Cohomology/Proper.lean`, with coherent higher direct
images supplied by `Cohomology/Pushforward.lean`, as in §4.9's supplier contract.
Prove
`proper_fibreDimension_vanishing`: for `f : X → Y` proper with `Y` locally Noetherian and fibres of
dimension `≤ d`, `R^q f_* F = 0` for `q > d` and `F` quasi-coherent: for coherent `F` stalkwise by
Stacks, Lemma 30.20.9 (02V7); for quasi-coherent `F`, over each affine open of `Y` the scheme `X` is
Noetherian, so `F` is there the filtered colimit of its coherent submodules (Lemma 30.10.4 (0GN6)),
and `R^q f_*` commutes with filtered colimits (Lemma 30.6.1 (07TB)). Prove `serre_affineness_criterion`:
a quasi-compact scheme `X` is affine iff `H¹(X, I) = 0` for every quasi-coherent ideal `I`, iff
`H^q(X, F) = 0` for all `q > 0` and quasi-coherent `F` (Stacks, Lemmas 30.3.1, 30.3.2, 30.3.4
(01XE)). *Needs:* §0.3, §0.4; Tau Ceti `Scheme.Modules.Cohomology`; StableReduction Layer 2 (relative
ampleness); JacobianChallenge Layer B.

**Checks.**
- `higherDirectImage_unbounded_base`: for `S = ⨿_{n≥0} Spec k` and
  `X = ⨿_{n≥0} ℙⁿ_k → S`, the map is qcqs, but the sheaf restricting to
  `O(−n−1)` on component `n` has nonzero `Rⁿf_*` for every `n`.
  The base is not affine (nor quasi-compact), so the uniform assertion excludes it.
  The same family in §2.19's `rightAdjoint_unbounded_disjoint_projective_spaces` has
  a right adjoint with cohomology in arbitrarily negative degrees.
- `test_projectiveLine_cohomology`: `H¹(ℙ¹_k, O(−2)) ≅ k` and `H⁰(ℙ¹_k, O(1))` has dimension `2`.
- `test_affine_vanishing`: on `Spec A` every quasi-coherent module is acyclic.
- `test_not_affine_punctured_plane`: `H¹(𝔸² ∖ {0}, O) ≠ 0`, so `𝔸² ∖ {0}` is not affine.

*Lean:* `QCoh.higherDirectImage_vanishing` (over an affine base), `QCoh.isAffine_of_H1_vanishing`
(the direction of `serre_affineness_criterion` from the vanishing of `H¹` of every quasi-coherent
module to affineness), with `higherDirectImage_unbounded_base` (qcqs over the non-affine base
`⨿_n Spec k`, and no uniform bound on the source) as an `example`.

### 2.7 Cohomology with supports and local cohomology

Define `sectionsWithSupport Z hZ F := ker(F(X) → F(X ∖ Z))` for `Z ⊆ X` with `hZ : IsClosed Z`, `supportedSubsheaf Z
F` (the sheaf `H_Z(F)` on `Z`), `cohomologyWithSupport Z F q := R^q Γ_Z(X, −)` applied to `F` with
its `O(X)`-module structure, and `localCohomologySheaf Z F q := R^q H_Z(F)` (Stacks, Section 20.21
(0A39)). API: `cohomologyWithSupport_zero`, `cohomologyWithSupport_univ` (`Z = X` gives `H^q`,
`Z = ∅` gives `0`), `rHZ_adjunction` (`RH_Z` is right adjoint to `i_*` on derived categories),
`localToGlobal` (the spectral sequence `H^p(Z, H^q_Z(K)) ⇒ H^{p+q}_Z(X, K)`),
`cohomologyWithSupport_pullback`. Prove `supports_localization_triangle`: for `Z ⊆ X` closed with
complement `U`, the distinguished triangle `RΓ_Z(X, K) → RΓ(X, K) → RΓ(U, K) →` and its long exact
sequence, and the excision isomorphism for `Z ⊆ V` open (Stacks, Lemmas 20.34.5–20.34.7 (0G6Y)).
Prove `localCohomology_colimit_ext_comparison`: for a Noetherian commutative ring `A`,
ideal `I`, arbitrary `A`-module `M` and `q : ℕ`, the pinned functor
`(localCohomology I q).obj M = colim_n Ext_A^q(A/I^n,M)` computes the right-derived
`I`-power-torsion functor. Construct this natural comparison using an injective resolution and
exactness of filtered colimits ([Stacks, Lemma 47.8.2, 0954](https://stacks.math.columbia.edu/tag/0954)), then identify derived torsion with
`RΓ_{V(I)}` (Lemma 47.10.1, [0955](https://stacks.math.columbia.edu/tag/0955)).
Prove `localCohomology_module_comparison`: for the same Noetherian `A`, `X = Spec A`,
`Z = V(I)` and `F = M~`, this bridge induces the natural `A`-linear isomorphism
`H^q_Z(X,F) ≅ (localCohomology I q).obj M` ([Stacks, Lemma 51.2.1, 0A6T](https://stacks.math.columbia.edu/tag/0A6T)).
The native colimit-of-Ext definition is retained. No comparison for arbitrary non-Noetherian
rings is asserted; finite generation of `I` alone does not identify the two derived functors.
Prove `localCohomology_degreeZero`: for any commutative ring, the native degree-zero group
is the union of the annihilators of powers of `I` in `M`, directly from `Ext⁰ = Hom`
and the filtered colimit; compare Stacks, Lemma 47.8.2 in its finitely generated regime.
Prove `localCohomology_flat_baseChange`: for a flat homomorphism `A → B` of Noetherian
commutative rings, arbitrary `M` and `q`,
`B ⊗_A H^q_I(M) ≅ H^q_{IB}(B ⊗_A M)` for the native functors, compatibly with the
geometric comparison. Prove flat excision in the same regime when `A/I → B/IB` is an
isomorphism (Stacks, Lemmas 47.10.3, 47.9.7).
Prove `depth_localCohomology_vanishing`: for `A` Noetherian, `M` finite and `I` an ideal,
`H^q_I(M) = 0` when `(q : ℕ∞) < depth_I M`; `depth_localCohomology_nonvanishing` asserts
`H^d_I(M) ≠ 0` only for `d : ℕ` with `depth_I M = d`. The zero module has depth `⊤` and
all its native local-cohomology groups vanish (Stacks, Lemmas 47.11.1 (0AVZ), 47.11.3 (0BUW)).
*Needs:* §0.17, §2.1, §2.6; Mathlib `localCohomology` in
`Mathlib/Algebra/Homology/LocalCohomology.lean`; the comparison above connects the native functor to geometric support.

**Checks.**
- `test_support_all`: `H¹_X(X, F) = H¹(X, F)`; `test_support_empty`: `H^q_∅ = 0`.
- `test_support_affine_line_origin`: for `X = 𝔸¹_k`, `Z = {0}`, `H¹_Z(X, O) ≅ k[t, t⁻¹]/k[t]` and
  `H⁰_Z(X, O) = 0`.
- `test_support_not_restriction`: `H⁰_Z(X, F)` is not `F(Z)`: for `𝔸¹`, `Z = {0}`, `F = O`, the
  restriction has sections `k` while `H⁰_Z = 0`.
- `test_depth_dvr`: for a DVR `R` and `I = m`, `H⁰_m(R) = 0` and `H¹_m(R) = K/R`.
- `localCohomology_module_comparison_nil_ideal`: for
  `A = k[x_0,x_1,…]/(x_j^{j+2})` and `I = (x_0,x_1,…)`, `V(I) = Spec A`,
  geometric `H⁰ = A ≠ 0`, but native `H⁰_I(A) = 0` and `A` is not Noetherian.
  For any nonzero polynomial class and any `n`, a fresh variable of exponent bound greater
  than `n` gives a nonzero product with an element of `I^n`.
- `localCohomology_module_comparison_dvr`: the native Noetherian comparison gives
  `H⁰_m(R) = 0` and `H¹_m(R) ≅ K/R` for a DVR with fraction field `K`.
- `depth_localCohomology_zero_guard`: every degree of the zero module vanishes; there is no
  finite degree of nonvanishing, consistently with `depth_I 0 = ⊤`.

*Lean:* `Supports.localCohomology_degreeZero` (stated as a bijection of sets),
`Supports.localCohomology_flat_baseChange` (stated as a `B`-linear isomorphism).

### 2.8 Cousin complexes

Supply a finite descending filtration `X = Z_0 ⊇ ⋯ ⊇ Z_{r+1} = ∅` by closed
subschemes; extend it by empty terms. The constructor records closedness, inclusions,
`Z_0 = X` and eventual emptiness. Define `relativeSupportCohomology Z i F k` as the
`k`-th derived sheaf of `U ↦ Γ_{Z_i ∖ Z_{i+1}}(U ∖ Z_{i+1}, F)` and
`cousinComplex Z F` with degree `i` equal to `relativeSupportCohomology Z i F i`.
The boundary maps of the support exact sequences give `cousinComplex_d_comp_d` and
an augmentation `F → Cous_Z(F)`. Prove `cousinComplex_isQuasicoherent` for `X`
Noetherian and `F` quasi-coherent, and `cousinComplex_trivial` for `Z_1 = ∅`
(Boxer–Calegari–Gee–Pilloni, §3.9.5, printed pp. 63–64).
Prove `relativeSupportCohomology_concentration` and `kempf_cousin_resolution` for
`X` Noetherian, the supplied closed filtration satisfying `codim_X Z_i ≥ i` and
**affine morphisms** `Z_i ∖ Z_{i+1} → X`, and `F` a maximal Cohen–Macaulay coherent
sheaf: the relative support sheaves vanish in degrees different from `i`, and the
augmentation is a quasi-isomorphism ([BCGP, Theorem 3.9.6](https://www.math.uchicago.edu/~fcale/papers/surfaces.pdf),
printed p. 64). Here maximal means depth equal to the dimension of the ambient local
ring at each point where the stalk is nonzero. Affineness alone does not imply degree
concentration. The target `relativeSupportCohomology_eq_zero_of_affine` is the
vanishing consequence with all these hypotheses.
Prove `cousinComplex_acyclic` with the additional hypothesis that each stratum is
itself affine (BCGP, Remark 3.9.7, p. 64); global sections then compute `RΓ(X,F)`.
These inputs are chosen closed filtrations, not the sets of all points of codimension
at least `i`. On `𝔸¹` the latter set for `i = 1` is dense and proper and cannot be
passed to this constructor. *Needs:* §0.18, §2.7, including its Noetherian comparison.

**Checks.**
- `test_cousin_trivial_filtration`: for `Z_0 = X`, `Z_1 = ∅` the augmentation is an isomorphism.
- `test_cousin_dvr`: for `X = Spec R` of a DVR and `Z_1` the closed point, `Cous(O_X)` is `K → K/R`
  and the augmentation is a resolution of `R`.
- `test_cousin_not_resolution`: for `X = Spec k[x, y]/(xy, y²)` (embedded point) with `Z_1` the
  origin, the augmentation is not a quasi-isomorphism.
- `cousinComplex_affineLine_nonclosed`: over an infinite algebraically closed field,
  the codimension-one points of `𝔸¹` are exactly its closed points; their set is dense,
  proper, and not closed.
- `cousinComplex_affineLine_origin`: the chosen closed filtration
  `𝔸¹ ⊇ V(t) ⊇ ∅` meets the theorem's hypotheses. Its two terms are
  `k[t,t⁻¹]~ → (k[t,t⁻¹]/k[t])~`, the differential is the quotient map, and the
  augmentation is the inclusion of `k[t]~`.
- `cousinComplex_trivial`, `cousinComplex_dvr`, `cousinComplex_embedded_point`:
  the preceding trivial, DVR and embedded-point computations apply to the constructor
  with explicit closedness, descent, initial-term and finite-length witnesses.

### 2.9 Big-site sheaves of quasi-coherent modules and the sheaves `𝔾_a`, `𝔾_m`, `μ_n`

Define `bigSheaf F` for a quasi-coherent `O_S`-module `F`: the **module** `F^a : (T, h) ↦ Γ(T, h^* F)` over
`bigStructureSheaf S : (T, h) ↦ Γ(T, O_T)` on the big fpqc site over `S`, with the natural
`Γ(T,O_T)`-action. Its carrier is Mathlib's `SheafOfModules (bigStructureSheaf S)`.
`bigSheafFunctor` sends quasi-coherent modules and their O-linear maps to this module category;
`bigSheaf F` is its value on `F`. The underlying abelian sheaf is obtained with
`SheafOfModules.toSheaf` and supplies the cohomology coefficients. The same construction is a
sheaf on every coarser topology, with `bigSheaf_obj`, `bigSheaf_isSheaf`
(for Zariski, étale, fppf, fpqc), `bigSheaf_rightExact` (right exact sequences go to right exact sequences
of sheaves), `bigSheaf_exact_of_flat_quotient` (a short exact sequence stays exact
when its quotient is flat over `O_S`, so pullback to every test scheme stays exact), `bigSheaf_pullback` (restriction along `S' → S` is
`(g^* F)^a`), `bigSheaf_structureSheaf` (`(O_S)^a` is the unit module; its underlying abelian sheaf is `𝔾_a`, with the structure-sheaf ring operations), `bigSheaf_fullyFaithful` (bijections on **O-linear** Hom sets;
[Stacks, Lemma 35.8.8](https://stacks.math.columbia.edu/tag/03DR); fpqc descent of sections is
Lemma 35.8.1, and the same O-linear Hom comparison applies to the fpqc carrier). Define `Ga S` (`T ↦ Γ(T, O_T)`,
additive), `Gm S` (`T ↦ Γ(T, O_T)^×`) and `mu S n` for every integer `n ≥ 1` (`T ↦ {t ∈ Γ(T, O)^× :
t^n = 1}`), sheaves of abelian groups on the big fpqc site over `S`, and their restrictions `GmEtale
X`, `muEtale X n` to the small étale site (Stacks, Section 59.28 (03PK)). API: `Gm_obj`, `powHom S
n`, `mu_eq_ker_pow` (`μ_n = ker(n : 𝔾_m → 𝔾_m)`), `Gm_restrict_small`.
The downstream finite-module twist construction consumes `muEtale` for invertible order.
`μ_n` here
is defined for every `n`, as a subsheaf of `𝔾_m` on the fppf site; it is representable by
`Spec_S O_S[t]/(t^n − 1)` and is not étale when `n` is not invertible. *Needs:* §0.4; Mathlib
`fpqcTopology`, `Over`, `rootsOfUnity`.

**Checks.**
- `bigStructureSheaf_field`: evaluation at `Spec k` over itself is the ring `k`.
- `bigStructureSheaf_polynomial`: over `Spec k`, evaluation at `Spec k[t]` is `k[t]`.
- `bigStructureSheaf_empty`: evaluation at the empty test scheme is the zero ring.
- `bigSheafFunctor_zero`, `bigSheaf_zero`: the zero quasi-coherent module gives the zero big module.
- `bigSheafFunctor_structure`, `bigSheaf_structure`: `O_S` gives the unit big module.
- `bigSheafFunctor_hom`, `bigSheaf_hom`: the induced O-linear Hom map is bijective.
- `bigSheaf_frobenius_additive_not_linear`: over `F_p`, Frobenius is natural and additive on
  every test algebra, hence acts on the underlying `G_a`. On `F_p[t]` it is not linear over
  `F_p[t]`: it fixes `1` but sends `t` to `t^p ≠ t`. Thus this endomorphism does not lift to a
  morphism of big structure-sheaf modules.
- `bigSheaf_nonflat_pullback`: on `Spec k[t]`, multiplication by `t` is injective
  on `O_S`, but pullback to `t = 0` is the zero map `k → k`. Its quotient
  `k[t]/(t)` is not flat; the left-exact assertion is therefore unavailable.
  Right exactness still gives `k → k → k → 0`, with maps zero and identity.
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
`H^q(X_Zar, F) = H^q(X_ét, F^a) = H^q(X_fppf, F^a)`, the last on the big fppf site (Tau Ceti's
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
→ 0` through `hilbert90` and §2.22's `Br′` (fppf exactness for every `n`: Stacks, Lemma 59.28.3
(040N), which fails on the étale, smooth and Zariski sites in general, Remark 59.28.4 (040O);
`H¹_fppf(X, μ_n)` as pairs of a line bundle and a trivialisation of its `n`-th power: Lemma 59.28.5
(040Q); all in Section 59.28 (03PK)); for `n` invertible on `X` the sequence is already exact on the
étale site (Lemma 59.28.1 (03PL)), and the two agree through §2.10's comparison. Both Kummer
statements are owned here and exported with §2.9's `muEtale` to the downstream twist theory. Prove
`artinSchreier_sequence`: in characteristic `p` the sequence `0 → ℤ/p → 𝔾_a → 𝔾_a → 0`
(`x ↦ x^p − x`) is exact on `X_ét` (Stacks, Section 59.63 (0A3J)), giving `H^q(X_ét, ℤ/p) = 0` for
`q ≥ 2` and `X` affine, and the bound `H^q(X_ét, ℤ/p) = 0` for `q ≥ d + 2` for `X` quasi-compact and
quasi-separated of dimension `d` in characteristic `p`, that is `p`-cohomological dimension at most
`d + 1` for the constant sheaf (Lemma 59.63.1 (0A3K)). Prove `finite_pushforward_exact`: for
`f : X → Y` finite,
`f_*` is exact on abelian sheaves on the small étale sites and `R^q f_* = 0` for `q > 0`; for `f`
integral, `f_*` commutes with arbitrary base change (Stacks, Lemma 59.55.1, Proposition 59.55.2,
Lemmas 59.55.3–59.55.4 (03QN)); the pushforward along a morphism of small étale sites is the site
functor owned by §2.1. Its coefficient-specific extensions are downstream consumers of this
exactness theorem after forgetting module coefficients to abelian sheaves. *Needs:* §2.1, §2.9, §2.10; Tau Ceti `LineBundleClass`.

**Checks.**
- `hilbert90_test_affine`: for `X = Spec A`, `H¹(X_ét, 𝔾_m) ≅ CommRing.Pic A`.
- `hilbert90_test_projectiveLine`: `H¹(ℙ¹_k, 𝔾_m) ≅ ℤ`.
- `kummer_test_field`: `H¹_fppf(Spec K, μ_n) = K^×/K^{×n}` for every field and every `n`, including
  `n = p` in characteristic `p` (where the étale group is `0`).
- `kummer_test_n_one`: for `n = 1` the sequence reads `1 → 0 → 𝔾_m = 𝔾_m → 1`.
- `artinSchreier_test_field`: `H¹(Spec k, ℤ/p) = k/(x^p − x)k`.
- `finite_pushforward_test_closed_point`: for `i : Spec k → 𝔸¹_k`, `i_*` is exact and
  `H^q(𝔸¹, i_* F) = H^q(Spec k, F)`.

*Lean:* `Etale.constZMod` (the constant étale sheaf `ℤ/p`), `Etale.artinSchreier_vanishing` (the
vanishing of `H^q(X_ét, ℤ/p)` for `q ≥ 2` on affine `X` of characteristic `p`, from
`artinSchreier_sequence`).

### 2.12 Nisnevich coverings and the Nisnevich topology

Define `IsNisnevichCovering f` for a family of étale morphisms `{p_i : U_i → X}`: for every `x ∈ X`
there are `i` and `u ∈ U_i` with `p_i(u) = x` and `κ(x) → κ(u)` an isomorphism (Mathlib's
`Scheme.Hom.residueFieldMap`) (Morel–Voevodsky 1999, §3.1, Proposition 1.1, Definition 1.2, pp.
95–96); `nisnevichPrecoverage` and `nisnevichTopology := nisnevichPrecoverage.toGrothendieck` on
`Scheme`; `smallNisnevichTopology X` on `X.Etale`. API: *isNisnevichCovering_of_zariski*,
*nisnevichPrecoverage_le_etale*, *IsNisnevichCovering.pullback*, `.comp`,
*isNisnevichCovering_iff_henselization* (for a finite family over a Noetherian base: Nisnevich iff
the base change to every `Spec O^h_{X,x}` of §0.13 has a section), `zariskiTopology_le_nisnevichTopology`,
`nisnevichTopology_le_etaleTopology`, *nisnevichTopology_subcanonical*, `mem_nisnevichTopology_iff`,
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

*Lean:* `Nisnevich.IsNisnevichCovering`, `Nisnevich.nisnevichPrecoverage`,
`Nisnevich.nisnevichTopology`, `Nisnevich.zariskiTopology_le_nisnevichTopology`,
`Nisnevich.nisnevichTopology_le_etaleTopology`, with `test_not_covering_real_complex` (for a
quadratic extension) as an `example`.

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
the same `Spec ℝ ⊔ Spec ℂ` counterexample is finite. Prove `distinguishedSquare_mayerVietoris`:
every sheaf of sets `F` for `nisnevichTopology` sends an elementary distinguished square to a
pullback, `F(X) → F(U) ×_{F(U ×_X V)} F(V)` bijective; this is the sheaf condition for the
covering `{j, p}` and needs no sheafification. On `X.Etale` with `smallNisnevichTopology X`, construct the instance
`HasSheafify (smallNisnevichTopology X) (Type u)` as Mathlib constructs it for `smallEtaleTopology`,
through the essentially small dense subsite `X.AffineEtale`; there the square is moreover a
Mayer–Vietoris square (Mathlib's `MayerVietorisSquare`), so every abelian sheaf on `X_Nis` has a
long exact Mayer–Vietoris sequence (Morel–Voevodsky 1999, §3.1, Lemma 1.6, Remark 1.7, pp. 97–98). Prove
`nisnevich_sheaf_criterion` (*Nisnevich.isSheaf_iff_distinguishedSquares*): fix a
Noetherian finite-dimensional scheme `X`. Let `QcEtale X` be the full subcategory
of `X.Etale` on quasi-compact structure maps, with `qcNisnevichTopology X` induced
from `smallNisnevichTopology X`. A presheaf **on `QcEtale X`** is a sheaf iff it
sends the empty object to a point and its elementary distinguished squares to
pullbacks (Morel–Voevodsky 1999, §3.1, Proposition 1.4, Lemma 1.5, pp. 96–98).
Its objects are Noetherian of finite dimension. Fibre products over objects of
this fixed basis and quasi-compact open complements stay in the basis; the
étale maps involved are of finite type. Nisnevich covers of a basis object
admit finite refinements by basis objects. Prove `qcNisnevich_comparison`:
restriction induces an equivalence between sheaves on all of `X.Etale` and on
this basis, with the underlying restriction functor identified (Stacks,
Lemma 7.29.1 (03A0)). Arbitrary étale schemes, such as an infinite coproduct
of field points, remain objects of the larger site. No closure of arbitrary
Noetherian schemes under arbitrary fibre products is claimed. *Needs:*
§2.12; Mathlib `Square`, `IsPullback`, `MayerVietorisSquare`, `HasSheafify`, `Scheme.AffineEtale`,
`IsOpenImmersion`, `Etale`,
`IsNoetherian`, `topologicalKrullDim`.

**Checks.**
- `test_eds_zariski`: for an open cover `X = U ∪ V`, `ofZariski` gives a square whose `p` is the open
  immersion of `V`.
- `test_eds_affine_line`: `X = 𝔸¹_ℚ`, `U = 𝔸¹ ∖ {0}`, `V = 𝔸¹ ∖ {−1, −2}` with `p(s) = s² + 2s`: `p`
  is étale on `V`, `p⁻¹(0) ∩ V = {0}` with residue field `ℚ`, so `(U ⊂ X, p)` is an elementary
  distinguished square.
- `test_eds_not_distinguished`: for a specified separable degree-two algebra map
  `K → L` and `U = ∅`, there is no isomorphism in `Over (Spec K)` identifying
  `S.p` with `Spec L → Spec K`.
- `eds_rational_function_square`: `ℚ(t) → ℚ(u)`, `t ↦ u²`, has degree two.
  The spectra are isomorphic as abstract schemes, but this specified arrow is
  not an isomorphism over `Spec ℚ(t)` and cannot be distinguished with empty `U`.
- `test_eds_not_distinguished_extra_point`: `X = Spec ℝ`, `U = ∅`, `V = Spec ℝ ⊔ Spec ℂ`: the
  pointwise clause holds (one preimage with residue field `ℝ`) and the isomorphism clause fails
  (`p⁻¹(Z) = Spec ℝ ⊔ Spec ℂ ≠ Spec ℝ`); the structure rejects it.
- `QcEtale_identity`: the identity belongs to the basis.
- `QcEtale_empty`: the empty étale object belongs to the basis.
- `QcEtale_infinite_coproduct`: `⨿_{n∈ℕ} Spec k → Spec k` is étale but neither
  quasi-compact nor Noetherian; it belongs only to the larger site.
- `qcNisnevichTopology_representable`: every representable on the basis is a sheaf.
- `qcNisnevichTopology_empty`: the empty sieve covers the empty basis object.
- `qcNisnevichTopology_quadratic_not_cover`: `Spec ℂ → Spec ℝ` lies in the basis
  but its generated sieve does not cover the final object.

*Lean:* `Nisnevich.ElementaryDistinguishedSquare` (the isomorphism over the reduced closed
complement is recorded as invertibility of the base change of `p`),
`Nisnevich.ElementaryDistinguishedSquare.toSquare`,
`Nisnevich.ElementaryDistinguishedSquare.isPullback_of_isSheaf` (the sheaf-condition part of
`distinguishedSquare_mayerVietoris`, on the big site), with
`test_eds_not_distinguished_extra_point`, for any
separable quadratic `L/K`, as an `example`.

### 2.14 Nisnevich points, cohomological dimension, Čech comparison and Brown–Gersten

Construct `henselianStalk X U u` for every étale object `U → X` and `u ∈ U`:
take the filtered colimit over pointed étale neighbourhoods `(V,v) → (U,u)` inducing
`κ(u) ≅ κ(v)`, using an essentially small cofinal neighbourhood category. The
associated pro-object has limit `Spec O^h_{U,u}` over `X`; it need not itself be
an object of `X_ét`. Prove `henselianStalk_representable`: on `h_W` this is
`Hom_X(Spec O^h_{U,u}, W)`, including the structural map to `X`; prove preservation
of finite limits and colimits. Prove `nisnevich_points_henselization`: for
Noetherian `X`, a morphism of sheaves on `X_Nis` is invertible exactly when all
these fibre maps are bijective. There is no assertion classifying all points.
The neighbourhood argument is the small-site form of Morel–Voevodsky 1999, §3.1,
p. 99; compare Gabber–Kelly, Theorems 2.3 and 2.6 for the site/pro-object distinction,
without importing their finite-type big-site classification. Prove
`nisnevich_cohomological_dimension`: for `X` Noetherian of Krull dimension `d`, `H^q(X_Nis, F) = 0`
for `q > d` and every abelian Nisnevich sheaf (Morel–Voevodsky 1999, §3.1, Proposition 1.8, pp.
98–99). Prove `nisnevich_cech_comparison`: on a Noetherian scheme of finite dimension, Čech
cohomology for Nisnevich coverings computes `H^q(X_Nis, F)` (Morel–Voevodsky 1999, §3.1,
Proposition 1.9, Example 1.10, p. 99). Prove `brownGersten_vanishing` in the complex model:
let `S` be Noetherian of finite Krull dimension and let `F` be a presheaf of cochain complexes of
abelian groups on `Sm/S` (smooth schemes of finite type over `S`). Its Brown–Gersten property
means **both** `F(∅) ≃ 0` and that every elementary distinguished square of §2.13 is sent to a
homotopy pullback square in the derived category. Define Nisnevich-local acyclicity by
`a_Nis H^n(F) = 0` for every integer `n`, where cohomology is taken objectwise and then sheafified.
If `F` has this reduced/excisive property and is Nisnevich-locally acyclic, then `F(X) ≃ 0` for
every Noetherian finite-dimensional object `X`: all its cohomology groups vanish. Here `≃` means
a derived isomorphism, or quasi-isomorphism to zero, and does not supply a contracting homotopy
on an arbitrary representative (Morel–Voevodsky 1999, §3.1, Definitions 1.12–1.13, Proposition
1.16, Lemmas 1.17–1.18, pp. 100–102; Voevodsky, arXiv:0805.4578, Definition 3.3, Theorem 3.2
and Lemma 3.5, with the stable/complex version obtained by applying the bounded cd-structure
argument to cohomology and its connecting maps). *Needs:* §0.13, §2.5, §2.12, §2.13.

**Checks.**
- `brownGersten_empty`: the zero complex presheaf is reduced and excisive, locally acyclic,
  and acyclic on every object, including `∅`.
- `brownGersten_square_only_counterexample`: on `Sm/k`, choose a nonzero abelian group `A` and
  the constant presheaf `P(U) = A[0]`, including `P(∅) = A[0]`. With a functorial injective
  resolution set `C(U) = RΓ_Nis(U, a_Nis P)` and `F(U) = Cone(P(U) → C(U))`. Both `P` and `C`
  satisfy square-excision, hence so does `F` in the stable derived category. The cohomology
  sheaves of `F` vanish, but `F(∅) ≃ A[1]` and
  `F(Spec k ⊔ Spec k) ≃ Cone(A → A ⊕ A) ≃ A[0]` via the diagonal map. Square-excision alone
  does not imply the conclusion, even at nonempty objects.
- `brownGersten_reduced_sections`: derived Nisnevich sections of an abelian sheaf send `∅`
  to zero and distinguished squares to homotopy pullbacks; if the sheaf is zero, the theorem
  gives acyclicity on every object.
- `test_nisnevich_field_vanishing`: for a field `k`, `H^q((Spec k)_Nis, F) = 0` for `q > 0`.
- `test_nisnevich_real_field_contrast`: on `Spec ℝ`, positive-degree Nisnevich
  cohomology vanishes, whereas `H²_ét(𝔾_m) = Br(ℝ) ≅ ℤ/2`, detected by the
  quaternion class (§2.22).
- `henselianStalk_real_base`: the representable `h_{Spec ℂ}` has empty fibre at
  `Spec ℝ`; the initial sheaf has the same fibre.
- `henselianStalk_complex_object`: the fibre of that representable at the point
  of the étale object `Spec ℂ → Spec ℝ` consists of identity and conjugation.
- `henselianStalk_initial`: the sheaf represented by the empty object has empty
  fibre at every `(U,u)`.
- `henselianStalk_real_not_conservative`: the map from the initial sheaf to
  `h_{Spec ℂ}` is bijective on the base's sole henselian fibre but is not an
  isomorphism of sheaves.
- `henselianStalk_dvr_extensions`: for a DVR `R`, use `Spec O^h_{U,u}` for all
  étale `U → Spec R`, including nontrivial finite separable residue-field
  extensions and generic-field extensions. The two base points alone are insufficient.

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
theorem and the Kummer sequence (§2.11). Curve trace comparisons are downstream applications.
Prove
`proper_hypercover_descent`: cohomological descent for proper hypercoverings: for a proper
surjective `X_0 → X` and the associated hypercovering, `RΓ(X, F) = RΓ(X_•, F)` for every abelian
sheaf `F` on `X_ét`, with the descent spectral sequence (Stacks, Lemmas 85.36.4 (0DHM) and 85.36.6 (0DHP)).
*Needs:* §2.11, §2.15; Mathlib's `BrauerGroup`; Layer 3's genus is not needed here.

**Checks.**
- `tsen_test_rational`: `Br(k(t)) = 0` for `k` algebraically closed.
- `curve_Gm_test_affine_line`: `H^q(𝔸¹_{k̄}, 𝔾_m) = 0` for `q ≥ 1` (`Pic(𝔸¹) = 0`).
- `curve_Gm_test_projective_line`: `H¹(ℙ¹_{k̄}, 𝔾_m) = ℤ`, `H² = 0`.
- `hypercover_test_normalization`: for the nodal cubic and its normalisation `ℙ¹ → C`, the descent
  spectral sequence computes `H¹(C, ℤ/n) = ℤ/n` from `ℙ¹` and the two preimages of the node.

*Lean:* `Etale.brauer_functionField_curve_trivial` (the statement `Br(K) = 0` of `tsen_theorem`,
for `K` algebraic over `k(t)`).

### 2.17 Pro-étale site foundations: replete topoi, w-contractible covers, left-completeness

Define `IsReplete T` for a category `T`: for every tower `⋯ → F_{n+1} → F_n → ⋯ → F_0` of
epimorphisms, every limit cone has epimorphic legs `lim F_n → F_m` (Bhatt–Scholze 2014, Definition
3.1.1, p. 16). API: *IsReplete.lim_epi*, *isReplete_of_locallyWeaklyContractible* (a locally weakly
contractible topos is replete; Proposition 3.2.3, pp. 17–18), `isReplete_proetale` (`Sh(X_proét)` is
replete for every scheme `X`, Mathlib's `Scheme.ProEt.topology`; Proposition 4.2.8, p. 29),
*IsReplete.derivedCategory_leftComplete* (if `T` is replete then `D(T)` is left-complete: `K ≅ R lim
τ_{≥ −n} K`; Proposition 3.3.3, p. 19), *IsReplete.derived_limits* (in a replete topos, `R lim` of a
tower of abelian sheaves with epimorphic transitions is computed by `lim`, and `lim¹ = 0`;
Proposition 3.1.10). Prove `w_contractible_cover`: every affine scheme admits a pro-étale cover by a
w-contractible affine scheme (`Spec A` with `A` w-contractible: every faithfully flat ind-étale `A →
B` has a section), and the w-contractible affines form a basis of the pro-étale site (Bhatt–Scholze
2014, Definition 2.4.1, p. 13; Lemma 2.4.9, p. 14; Theorem 1.5, p. 3; Proposition 4.2.8, p. 29).
Prove `proetale_left_completeness`: `D(X_proét, Λ)` is left-complete for every ring `Λ`, and the
unbounded derived category of pro-étale sheaves is compactly generated by the w-contractible objects
(Bhatt–Scholze 2014, Proposition 3.3.3, p. 19, for left-completeness;
[Proposition 3.2.3(2)](https://arxiv.org/html/1309.1198#S3.SS2), for compact generation). These three theorems are
foundations consumed by downstream finite and adic comparisons. An unbounded coefficient
comparison is not a prerequisite for any assertion here. *Needs:* §0.13 (ind-étale
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

*Lean:* `Proetale.IsReplete`, `Proetale.isReplete_proetale`, with `test_etale_not_replete`
(stated for the topos of sheaves of sets on `(Spec ℚ)_ét`) as an `example`.

### 2.18 Derived categories of quasi-coherent complexes

Define `PseudoCoherence.IsPseudoCoherentComplex K` on the ambient `DerivedCategory X.Modules`:
locally `K` is represented by a bounded-above complex of finite free module sheaves, without a
lower bound on the resolution. This is a condition on the complex, not on its section modules.
Prove `isPseudoCoherentComplex_single_iff` (`F[0]` satisfies it iff §0.5's local-resolution
predicate holds for `F`) and `isPseudoCoherentComplex_quasicoherent` (all cohomology sheaves are
quasi-coherent). Prove `isPseudoCoherentComplex_affine_iff`: for `X = Spec A`, it is equivalent
to being represented by the sheafification of a bounded-above finite-projective `A`-complex
([Stacks, Lemmas 36.10.1–36.10.2](https://stacks.math.columbia.edu/tag/08E4)).

Define `DQCoh X`: the full triangulated subcategory of Mathlib's `DerivedCategory X.Modules` of
complexes all of whose cohomology sheaves are quasi-coherent (Stacks, Section 36.3 (06YZ), where
`D_QCoh` is defined in the opening paragraphs); `DCoh X`
for `X` locally Noetherian (coherent cohomology), with the bounded variants `D⁺_QCoh`, `D^b_Coh`.
API: *DQCoh.mem_iff*, *DQCoh.isTriangulated* (closed under shifts and cones), *DQCoh.hasCoproducts*
(direct sums computed in `D(O_X)`; Lemma 36.3.1 (08DT)), `DQCoh.affineEquiv` (for `X = Spec A`,
`M ↦ M~` is an equivalence `D(ModuleCat A) ≌ DQCoh (Spec A)` compatible with the standard
t-structures; Lemma 36.3.5 (06Z0)), *DQCoh.restrict* (restriction to opens), *DQCoh.tStructure*. Define
`derivedTensor` (`K ⊗^L_{O_X} L`) and `derivedHom` (`RHom_{O_X}(K, L)`) on `D(O_X)`, with
`derivedTensor_derivedHom_adj` (the internal Hom of Stacks, Section 21.35 (08J7), with the global
`RHom` of Section 21.36 (0B6E)), `derivedTensor_unit`, `derivedTensor_mem_DQCoh` (Lemma 36.3.9
(08DX)), `derivedHom_mem_DQCoh` (for `K` satisfying *PseudoCoherence.IsPseudoCoherentComplex* and
`L ∈ D⁺_QCoh`, or `K` perfect and `L ∈ DQCoh`; Lemma 36.10.8 (0A6H)), `perfect_dual` (for `K` perfect
and `L ∈ DQCoh`, `RHom(K, L) ≅ RHom(K, O_X) ⊗^L L`; Lemma 36.10.9 (0ATN)). Define
`derivedPullback f` (`Lf^*`, restricting to `DQCoh`; Lemma 36.3.8 (08DW)) and `totalDirectImage f`
(`Rf_*`, restricting to `DQCoh` for `f` quasi-compact quasi-separated) with
`derivedPullback_totalDirectImage_adj`, `totalDirectImage_mem_DQCoh` (Lemma 36.4.1 (08D5)),
`totalDirectImage_coproduct` (Lemma 36.4.5 (08DZ)), `projectionFormula`, `totalDirectImage_comp`,
`cohomology_totalDirectImage` (`H^i(Rf_* F) = R^i f_* F` of §2.6). Prove `perfect_generator`: for `X` quasi-compact quasi-separated, `DQCoh X`
is generated by a single perfect complex and is compactly generated by perfect complexes (Stacks,
Lemmas 36.15.1–36.15.2, Theorem 36.15.3 (09IP)). Prove `torIndependent_baseChange`: for a cartesian
square with `g : S' → S` and `f : X → S` Tor-independent (`Tor_i^{O_S}(O_X, O_{S'}) = 0` for `i > 0`),
`Lg^* Rf_* K ≅ Rf'_* Lg'^* K` for `K ∈ DQCoh X` and `f` qcqs (Stacks, Definition 36.22.2, Lemmas
36.22.3, 36.22.5 (08ET)). *Needs:* §0.5, §2.6; Mathlib `DerivedCategory`, `Scheme.Modules`,
`tilde`, `HasExt`; Tau Ceti `Scheme.Modules.Cohomology`; JacobianChallenge Layer B.

**Checks.**
- `IsPseudoCoherentComplex_free`: `O_X^n[0]` satisfies the local complex criterion.
- `IsPseudoCoherentComplex_zero`: the zero complex satisfies it.
- `IsPseudoCoherentComplex_extension_by_zero`: the same `j_!O[0]` from §0.5 fails it, as well as
  membership in `DQCoh`; its nonzero generic restriction and zero global sections rule out
  quasi-coherence.
- `test_DQCoh_structure_sheaf`: `O_X[0] ∈ DQCoh X`.
- `test_DQCoh_affine_free`: under `affineEquiv` for `Spec ℤ`, `ℤ[0] ↦ O[0]` and `(ℤ/2)[0] ↦ (ℤ/2)~`,
  supported at `(2)`.
- `test_DQCoh_extension_by_zero_not_qc`: for `X = Spec` of a DVR and `j : U → X` the generic point,
  `j_! O_U[0]` is not in `DQCoh X`.
- `test_derivedTensor_unit`, `test_derivedTensor_affine_tor` (`(ℤ/2)~ ⊗^L (ℤ/2)~` has cohomology
  `(ℤ/2)~` in degrees `0` and `−1`), `test_underived_tensor_differs`.
- `test_derivedHom_affine_ext`: for a commutative ring `A`, a pseudo-coherent
  `A`-module `M`, any `A`-module `N` and `i≥0`, the natural comparison gives
  `H^i R𝓗om(M~, N~) ≅ Ext^i_A(M,N)~`. For complexes the comparison requires
  pseudo-coherent/bounded-below or perfect/arbitrary arguments, respectively
  ([Stacks, Lemma 36.10.8(3)](https://stacks.math.columbia.edu/tag/0A6H)).
- `test_derivedHom_affine_ext_finite`: the same comparison applies to every finite
  `M` over a Noetherian `A`, with arbitrary `N`.
- `test_derivedHom_affine_ext_infinite_free`: over `A=k[t]` for a field `k`, take
  `M=⊕_{n≥0} A` and `N=A`. Although `M` is free and projective and `A` is
  Noetherian, `H⁰ R𝓗om(M~,O_X)=∏_{n≥0} O_X` is not quasi-coherent. On `D(t)`
  the natural map `(∏ A)_t → ∏ A_t` misses `(t⁻ⁿ)_{n≥0}`: a fraction in the
  source has one denominator `t^r`, whereas its coordinate `n=r+1` cannot
  equal `t⁻ⁿ`. For arbitrary complexes the general description uses the sheaf
  associated to `D(f) ↦ Ext^i_{A_f}(M_f,N_f)`
  ([Stacks, Lemma 36.10.8(4)](https://stacks.math.columbia.edu/tag/0A6H)).
  Global Ext under `DQCoh.affineEquiv` remains distinct from internal sheaf Ext.
- `test_pullback_identity`, `test_pushforward_projective_line` (`Rf_* O(−2) = k[−1]` for `ℙ¹_k →
  Spec k`), `test_pullback_affine_tensor` (`Lf^* M~` has cohomology `Tor_i^A(M, B)~` in degree `−i`),
  `test_underived_pullback_not_exact`.

*Lean:* `Coherent.instHasDerivedCategoryModules` (the standard derived category of `X.Modules`),
`Coherent.DQCoh`, `Coherent.DQCoh.affineEquiv` (stated as the existence of an equivalence
`D(A) ≌ D_QCoh(Spec A)`; its description by `M ↦ M~` and the t-structures are specified here).

**Derived morphism gluing.** This subsection owns `Coherent.derivedHom_isSheaf`: for a scheme
`X`, an open basis `B`, and `K,L ∈ D(O_X)`, assume
`Ext^i_{O_U}(K|_U,L|_U) = Hom(K|_U,L|_U[i]) = 0` for every `U ∈ B` and every `i < 0`.
Then the same vanishing holds on every open, and `U ↦ Hom(K|_U,L|_U)` is a sheaf of
abelian groups. Compatible morphisms on any open covering therefore glue uniquely; equality
is local under these hypotheses. Use `Coherent.derivedRestrict`, the functor induced by
Mathlib's exact `Scheme.Modules.restrictFunctor`, with the canonical nested-open comparisons
`Coherent.derivedRestrictComp` and `Coherent.derivedRestrictOpens` induced by
`Scheme.Modules.restrictFunctorComp`. Their identity and composition coherence define the
restriction maps of `Coherent.derivedHomPresheaf`; its sections on `U` are the displayed Hom
group. The Lean prototype uses `Subsingleton` of shifted Hom types for Ext vanishing and the
underlying sheaf of sets for the Hom sheaf. Construct these interfaces before §2.20's
comparisons of local dualising objects. Source:
[Stacks, Lemma 20.45.2(2) (0D66)](https://stacks.math.columbia.edu/tag/0D66), applied to the
identity of the underlying ringed space. *Needs:* the ambient derived category and restriction
to opens of this subsection; Mathlib's exact-functor localization API.

**Checks.**
- For `K=L=O_X[0]`, negative Ext vanishes on every open and the Hom sheaf is `O_X`.
- On `X=ℙ¹_k`, a nonzero `O_X[0] → O_X(−2)[1]` represents a generator of
  `H¹(X,O_X(−2)) ≅ k` and restricts to zero on both standard affine charts. The local
  negative-Ext hypothesis fails: `Ext^(−1)(O_U,O_U(−2)[1]) = Γ(U,O_U(−2)) ≠ 0`.
  This is a negative control for unqualified locality of derived morphisms
  ([Stacks, Lemmas 30.8.1 (01XT)](https://stacks.math.columbia.edu/tag/01XT) and
  [30.2.2 (01XB)](https://stacks.math.columbia.edu/tag/01XB)).
- For pairs satisfying the hypothesis, refining an affine basis by principal opens preserves
  the glued morphism. If the local maps are isomorphisms, glue their inverses as well: their
  compositions are identities by the qualified equality assertion.

**Derived object gluing.** This subsection owns `Coherent.derivedObject_gluing`. On an open
basis `B` of a scheme `X`, give `K_U ∈ D(O_U)` for each `U ∈ B` and restriction isomorphisms
`ρ^U_V : K_U|_V ≅ K_V` whenever `V ⊆ U` are in `B`, with
`ρ^U_W = ρ^V_W ∘ (ρ^U_V)|_W` for `W ⊆ V ⊆ U`, using the canonical restriction comparisons.
Assume `Ext^i_{O_U}(K_U,K_U)=0` for all `U ∈ B`, `i<0`. Construct `K ∈ D(O_X)` and
`ρ_U : K|_U ≅ K_U` satisfying `ρ_V = ρ^U_V ∘ ρ_U|_V`, unique up to unique isomorphism
compatible with every `ρ_U`. `Coherent.DerivedGluingData` packages the local `obj`,
`transition` and `cocycle`; `Coherent.DerivedGluingSolution` packages the global `obj`,
`iso` and `compatibility`. `Coherent.restrictedGluingData X B K` is the canonical
restriction cocycle of a global object, using the inverse of `derivedRestrictOpens` for each
transition; it supplies the cocycles in the shifted-line-bundle Checks. Their Laurent
coordinate computation explicitly tests `dy=−x⁻²dx` in the Kähler differential module
of `k[x,x⁻¹]`, together with the gluing conclusion.
The basis can be infinite: it covers `X`, and each intersection is covered by basis members
contained in it; no quasi-compactness or quasi-separatedness is assumed. Prove that restriction
and refinement of the basis give the same solution up to the unique compatible isomorphism,
with identity and composition compatibility. Source:
[Stacks, Situation 20.45.3 (0D67)](https://stacks.math.columbia.edu/tag/0D67) and
[Theorem 20.45.8 (0D6C), the BBD gluing lemma](https://stacks.math.columbia.edu/tag/0D6C).
*Needs:* `Coherent.derivedHom_isSheaf`, the ambient derived category and restriction comparisons
above. This is the object-gluing input to §2.20, distinct from §1.1's descent of module sheaves.

**Checks.**
- On `ℙ¹_k` the standard affine restrictions of `O(−2)[1]=Ω¹[1]`, with coordinates
  `y=x⁻¹` and differential transition `dy=−x⁻² dx`, glue to that shifted line bundle.
  Its internal self-Hom is `O[0]`, so negative self-Ext vanishes on every basis member.
- On `⨿_{n≥0} ℙ¹_k`, use all affine opens contained in individual components and the same
  shifted differential bundles. The solution restricts to `O(−2)[1]` on every component,
  although the scheme has no finite affine cover.
- Refining those affine bases by principal opens gives the unique compatible comparison with
  the original solution; two successive refinements give the same comparison as their composite.

### 2.19 The right adjoint of pushforward and the upper shriek functor

Define `pushforwardRightAdjoint f` (`a_f : DQCoh Y ⥤ DQCoh X`) for `f` quasi-compact
quasi-separated with `Y` quasi-compact and quasi-separated (hence also `X`), with
`pushforwardRightAdjoint_adj` (`Rf_* ⊣ a_f`), `trace` (the counit `Tr_f : Rf_* a_f K → K`), `pushforwardRightAdjoint_comp` (`a_{g∘f} ≅ a_f a_g` compatibly with traces),
`pushforwardRightAdjoint_boundedBelow` (`a_f` preserves `D⁺_QCoh`), and the uniform form
`pushforwardRightAdjoint_lowerBound`: there is one integer `N`, depending only on `f`,
such that `H^i(K)=0` for `i<c` implies `H^i(a_f K)=0` for `i<c−N`.
No finite Tor dimension assumption is needed. Existence uses
[Stacks, Lemma 48.3.1 (0A9E)](https://stacks.math.columbia.edu/tag/0A9E), and the uniform
bound uses [Lemma 48.3.5 (0A9I)](https://stacks.math.columbia.edu/tag/0A9I).
Prove `globalDuality` (`RHom_X(L, a_f K) ≅ RHom_Y(Rf_* L, K)`),
`pushforwardRightAdjoint_affine_finite` (for `Spec B → Spec A` finite, `a_f(K~) = RHom_A(B, K)~`)
(Stacks, Lemma 48.3.1, Example 48.3.2, Lemmas 48.3.5–48.3.6, 48.3.10 (0A9D)). Define `Coherent.IsLocalCompleteIntersection f` by local factorizations `U ↪ P → Y`, with
`P → Y` smooth and the closed immersion defined locally by a finite regular sequence.
Here the schemes are Noetherian, so this is the usual lci condition
(Stacks, §37.62, as used in Lemma 48.17.11). Define
`upperShriek f : D⁺_QCoh Y ⥤ D⁺_QCoh X` for `f` separated of finite type between Noetherian
schemes, by the Čech pasting construction below. On affine opens its formula is the
finite-map right adjoint for a closed immersion into affine space, composed with smooth
pullback tensored with the shifted top differential bundle. The construction includes
independence of these local factorizations and the pseudofunctor structure
`(g ∘ f)^! ≅ f^! g^!` with its unit and associativity coherence.
For every given factorization `f = f̄ ∘ j` with `j` an open immersion and `f̄` proper, prove
`upperShriek_compactification_independence`: the canonical comparison
`f^! ≅ j^* ∘ a_{f̄}` identifies each such expression with the locally constructed functor;
the induced comparisons between expressions satisfy identity and cocycle laws.
Stacks, Situation 48.16.1 and Lemmas 48.16.2–48.16.5
([0A9Y](https://stacks.math.columbia.edu/tag/0A9Y)), give the compactification-defined
comparison model. The local construction and its pasting are supplied here. API: `upperShriek_proper` (`f^! ≅ a_f` for proper `f`), `upperShriek_openImmersion` and
`upperShriek_etale` (`f^! ≅ f^*` for étale `f`; Stacks, Lemma 48.18.2 (0FWI), with the open
immersion case Lemma 48.17.1 (0AU0)),
`upperShriek_flat_baseChange` (for `g` flat, `g'^* f^! ≅ f'^! g^*` on `D⁺_QCoh(O_Y)`; Lemma 48.18.1
(0E9U)),
`upperShriek_smooth` (for `f` smooth of relative dimension `d`, `f^! K ≅ f^* K ⊗ Ω^d_{X/Y}[d]`;
Lemmas 48.17.3, 48.17.11), `upperShriek_lci` (for `f` a local complete intersection,
`f^! K ≅ Lf^* K ⊗^L f^! O_Y`, using §2.18's **`derivedPullback f`**.
The object `f^! O_Y` is tensor-invertible in the derived category, locally a shifted line bundle; for Gorenstein `f` of relative dimension `d`, `f^! O_Y
≅ ω_{X/Y}[d]`; [Stacks, Lemmas 48.17.9(5) and 48.17.11](https://stacks.math.columbia.edu/tag/0ATZ)), `upperShriek_unit`, `upperShriek_counit` (the adjunction maps on
the proper part). The regime is bounded-below complexes with quasi-coherent cohomology on
Noetherian schemes, separated finite-type morphisms; nothing is asserted for unbounded complexes or
non-Noetherian bases. *Needs:* §2.18; the finite-map right adjoint above; affine polynomial
presentations, closed immersions and smooth projections; StableReduction Layer 1
(the sheaf of differentials, for `upperShriek_smooth`).

**Čech pasting for coherent upper shriek — `upperShriek`.**
This subsection owns the following construction for separated finite-type morphisms of
Noetherian schemes, on all of `D⁺_QCoh`. Use the total ringed site of the Čech nerve of a
finite open cover. Its modules are systems of module sheaves with actual structure maps;
form their derived category before taking restrictions to the individual levels. An object
with cartesian cohomology has isomorphisms on cohomology along all simplicial structure
maps. The construction has three inputs, each a target here.

1. Supply bounded-below Čech descent on these total ringed sites: for the augmentation
   `a:U_•→X`, restriction `a^*` identifies `D⁺_QCoh X` with the full subcategory of
   `D⁺(O_{U_•})` whose cohomology is cartesian and levelwise quasi-coherent. Its inverse is
   `Ra_*`. Include the natural unit and counit, the identification with §2.18's ambient
   `DerivedCategory X.Modules`, and compatibility with refinement, restriction and their
   composites. This is the finite Zariski-cover specialization of
   [Stacks, Lemma 85.20.4 (0DA7)](https://stacks.math.columbia.edu/tag/0DA7), using the
   ringed total site of [Remark 85.16.6 (0D9X)](https://stacks.math.columbia.edu/tag/0D9X).
   Prove that this equivalence induces equivalences on functor categories from any fixed
   coefficient category, including their natural transformations. Thus equality is tested
   in the derived category of the total site, retaining all simplicial data.
2. For an affine finite-type map `Spec B→Spec A`, construct the local formula from a
   presentation `A[t₁,…,tₙ]→B`: apply `RHom_{A[t]}(B,−)` to
   `K⊗_A A[t]⊗Ωⁿ_{A[t]/A}[n]`. Supply natural comparisons for changing the presentation,
   localization, identities and composition. The algebraic pasting inputs are the
   closed-immersion right-adjoint pseudofunctor, the smooth differential-bundle
   pseudofunctor (using the locally constant relative dimension on each open-and-closed
   component), smooth base-change isomorphisms for closed immersions, and the
   fundamental isomorphism `i^!p^!≅id` for a section `i` of a smooth map `p`.
   Prove the latter by the regular-section Koszul identification, with its orientation
   and shift. Verify horizontal and vertical base-change transitivity, compatibility of
   the fundamental isomorphism with both base changes, and its compatibility with
   concatenation of factorizations of identities. These are precisely the inputs of
   Nayak, *Pasting pseudofunctors*, §2.1[A]–[D] and Theorem 2.2.4
   ([primary text](https://arxiv.org/abs/math/0406501)), here applied on affine Noetherian
   schemes with closed immersions and smooth maps. Verify also §2.1[A]: both classes
   contain isomorphisms and are stable under base change; if `gf` is a closed immersion
   and `g` is closed or smooth, then `f` is a closed immersion (use separatedness of
   affine morphisms). Every affine finite-type map factors in these classes. This
   supplies the ordinary affine comparisons.
3. Supply their complex-level realization on the total Čech ringed site. For a finite
   affine cover of `X` subordinate to an affine cover of `Y`, construct a functor from
   `D⁺_QCoh Y` into `D⁺(O_{U_•})` realizing those local formulas, with cartesian
   quasi-coherent cohomology. The data include maps on coefficient morphisms, comparisons
   on every multiple overlap (using affine refinements of non-affine intersections),
   and the higher homotopies making the simplicial identities hold in a complex model.
   Use bounded-below injective module-sheaf representatives, for which quasi-isomorphisms
   are homotopy equivalences; restriction to an open preserves injectives because its
   left adjoint, extension by zero, is exact. Construct the overlap data from the local
   adjunction and Koszul maps above, and rectify them to complexes of modules on the
   total site. Prove that this realization respects quasi-isomorphisms and agrees with
   the affine formulas. Ordinary derived comparison isomorphisms alone are not the input.
   Construct presentation-change and cover-refinement transformations in this total-site
   derived category, with invertible components and identity and
   transitivity laws. Do the same for the identity and for composable morphisms: the
   total-site unit and composition transformations must satisfy the triangle and pentagon
   identities before applying `Ra_*`. A common refinement compares any two covers.
   The complex-level comparison and realization are part of this target. A primary model
   for the multiple-overlap maps and higher homotopies is Block–Holstein–Wei,
   *Explicit homotopy limits of dg-categories and twisted complexes*, §§3.2,4.1,4.3,
   Definition 4.3 and Corollary 3
   ([primary text](https://arxiv.org/abs/1511.08659)); the comparison with global
   bounded-below module complexes is the descent equivalence in input 1.

Apply `Ra_*` to this functor and these transformations to obtain `upperShriek`,
its identity and composition comparisons, and associativity. Prove preservation of the
coefficient conditions: quasi-coherence follows from the affine formulas and is local. If the input has no cohomology below `c`, a chart
with `n` polynomial variables has no output cohomology below `c−n`; derived Hom from a
module cannot lower this bound. A finite affine cover gives one maximum `n`, and the
Čech descent equivalence preserves this common lower bound. Thus the output is globally
bounded below even when the input has no upper bound or finite-generation condition.
For proper `f`, lift the local adjunction comparisons to the total site and descend them
to identify this functor with `a_f`, compatibly with its counit. For any given open-proper
factorization the same comparisons give `upperShriek_compactification_independence`.
The construction uses finite Zariski covers and bounded-below module complexes on their
total ringed sites; general enhancements and unbounded descent retain their existing owners.
*Needs:* §2.18's derived operations and affine equivalence; this subsection's finite-map
right adjoints; §2.2's Čech cohomology; affine polynomial presentations and the
regular-section Koszul formula. The latter formula and the total-site realization,
including all the comparisons just specified, are locally owned prerequisites here.

The prototype `Coherent.DQCohPlus` is the full subcategory of §2.18's ambient derived
category with quasi-coherent cohomology and one global lower bound.
`Coherent.DQCohPlus.toDerived` is its inclusion. Suggested.lean states this carrier and
the boundary examples below; the total-site objects, their complex-level realization
and the resulting functor and comparisons have the mathematical specification above.

**Checks.**
- For the identity on a nonempty affine Noetherian `U`,
  `K=O_U[0]⊕O_U[1]` is an allowed bounded coherent coefficient and `id^!K≅K`.
  Nevertheless `Hom(K,K[−1])≠0`: project to its first summand and include into the
  second summand of `K[−1]`. Čech pasting has no negative-Ext hypothesis.
- On `ℙ¹_k`, let `α:O→O(−2)[1]` be nonzero, as in §2.18, and
  `M=O⊕O(−2)[1]`. Then `N=inclusion₂∘α∘projection₁` is nonzero and `N²=0`;
  `1+N` is a nonidentity automorphism with inverse `1−N`, restricting to the identity
  on every affine open. Its image under total-site restriction remains nonidentity,
  by full faithfulness of Čech descent. Degree-zero chart restrictions alone lose it.
- Adding one polynomial variable to a presentation gives the same local functor:
  the extra smooth shift `[1]` cancels the regular-section shift `[−1]`, with the
  canonical differential and conormal lines cancelling. Two added variables test
  transitivity and the Koszul sign in the comparison.
- The one-member cover gives the original functor and transformations; refining a
  two-open cover twice gives the same natural comparison as the composite refinement.
  On three composable affine maps, both parenthesizations give the same natural comparison;
  four maps give the pentagon.
- `IsLocalCompleteIntersection_identity`: the identity has an empty regular sequence.
- `IsLocalCompleteIntersection_closed_point`: `t = 0` in `A¹_k` is cut out by the regular sequence `[t]`.
- `IsLocalCompleteIntersection_dual_numbers_rejected`: `Spec k → Spec k[ε]/(ε²)` is not lci;
  its nonzero kernel is generated by a zero-divisor.
- `upperShriek_lci_self_coefficient`: for `A = k[t]`, `i : Spec k → Spec A` at `t = 0`, and
  `K = (A/(t))~[0]`, `i^!K = RHom_A(k,k)` has `H^0 = k`, `H^1 = k`, and all other
  cohomology zero. Applying `Hom_A(−,k)` to `[A --t→ A]` makes the differential zero.
- `upperShriek_lci_derived_pullback`: for the same coefficient, `Li^*K` has `k` in degrees
  `−1,0`; tensoring with `i^!O = k[−1]` gives the required degrees `0,1`.
- `upperShriek_lci_underived_rejected`: ordinary `i^*K = k[0]`, so its tensor product with
  `k[−1]` has zero `H^0` and cannot be isomorphic to `i^!K`. Ordinary pullback in the adjacent
  smooth and étale formulas is valid because those maps are flat.
- `rightAdjoint_unbounded_disjoint_projective_spaces`: for the family of §2.6's
  `higherDirectImage_unbounded_base`, `Y = ⨿_{n≥0} Spec k` and `X = ⨿_{n≥0} ℙⁿ_k`,
  the componentwise map is proper and flat (Tor amplitude zero), and is qcqs as a morphism,
  although neither scheme is quasi-compact. Its componentwise right adjoint exists.
  For `K=O_Y[0]`, its restriction to component `n` is `O(−n−1)[n]`; hence
  `H^(−n)(a_f K)|_{ℙⁿ_k} = O(−n−1) ≠ 0` for every `n`, and `a_f K` has no global
  lower bound. Here the adjunction is supplied for this particular map, outside the
  qcqs-scheme existence theorem.
- `rightAdjoint_fixed_projective_space`: for `f : ℙⁿ_k → Spec k`,
  `a_f(k[0]) = O(−n−1)[n]`, so its only nonzero cohomology is in degree `−n`.
  It is globally bounded below by `−n`; this includes `n=0` and gives degree `−1`
  for `ℙ¹`. Both projective-space calculations use
  [Stacks, Lemma 48.15.1 (0A9W)](https://stacks.math.columbia.edu/tag/0A9W).
- `test_rightAdjoint_id`: for qcqs `X`, `a_{𝟙 X} ≅ 𝟙` with identity trace.
- `test_rightAdjoint_closed_point`: for `f : Spec k → Spec k[x]`, `a_f(O) = RHom(k, k[x]) = k[−1]`.
- `test_rightAdjoint_not_upperShriek`: for `f : 𝔸¹_k → Spec k` (not proper), `a_f(k)` is the full
  linear dual `Hom_k(k[x], k)` as a `k[x]`-module, while `f^! k = O[1]` (Stacks, Example 48.3.2).
- `test_upperShriek_projective_line`: `f^! k = O(−2)[1]` for `ℙ¹_k → Spec k`, independent of the
  (unique up to refinement) compactification.
- `test_upperShriek_composition`: for `𝔸¹ → ℙ¹ → Spec k`, `(g ∘ j)^! ≅ j^! g^!` is `O_{𝔸¹}[1]`.

### 2.20 Relative dualising complexes and modules, Serre duality, curve comparison

Let `f : X → S` be flat and locally of finite presentation and `W ⊆ X ×_S X` an open through which
the diagonal factors as a closed immersion `Δ : X → W`. Define `IsRelativelyPerfect f K` for
`K ∈ D(O_X)` (`S`-perfect): `K` satisfies *PseudoCoherence.IsPseudoCoherentComplex* (§2.18) and has locally finite Tor dimension
over `O_S` (Stacks, Chapter 36, the section on relatively perfect objects); this comes before the
dualising complex, which is defined in terms of it. Define `RelativeDualizingComplex f`: a pair
`(K, ξ)` with `K ∈ D(O_X)` `S`-perfect and `ξ : Δ_* O_X → L pr_1^* K|_W` in `D(O_W)` inducing an
isomorphism `Δ_* O_X ≅ RHom_{O_W}(Δ_* O_X, L pr_1^* K|_W)` (Stacks, Definition 48.28.1 (0E2S)). API:
`RelativeDualizingComplex.unique`, `.exists`, `.baseChange` (derived pullback along `S' → S`),
`.homothety_iso` (`O_X ≅ RHom(K, K)`), `.upperShriek` (for `f` flat in `FTS_S`, `f^! O_S` with its
canonical `ξ` is one) (Lemmas 48.28.2–48.28.7, 48.28.9).

**Construction of relative dualising pairs.** This subsection owns the affine construction
and comparison used by `RelativeDualizingComplex.exists`, `.unique` and `.baseChange` for every
flat locally finitely presented `f : X → S`, including non-quasi-compact and non-quasi-separated
schemes. Build them in the following order, using
[Stacks, Lemmas 47.27.2–47.27.5](https://stacks.math.columbia.edu/tag/0E2D) and
[48.28.2–48.28.6](https://stacks.math.columbia.edu/tag/0E2U).

1. For a flat finitely presented ring map `R → A`, construct the relative dualising object in
   `D(A)` and a diagonal generator `ξ_A : A → K_A ⊗^L_A (A ⊗_R A)`, with its defining
   internal-Hom isomorphism, homothety, localization and arbitrary derived base-change
   comparisons ([Lemma 47.27.4 (0E2F)](https://stacks.math.columbia.edu/tag/0E2F) and
   [Lemma 47.27.5 (0E2G)](https://stacks.math.columbia.edu/tag/0E2G)). Under §2.18's
   `DQCoh.affineEquiv` this supplies an `S`-perfect pair `(K_U,ξ_U)` on every affine open
   `U ⊆ X` mapping into an affine open of `S`. Compare two such pairs by the unique
   isomorphism preserving their diagonal generators; the homothety identifies automorphisms
   with units, so rescaling an isomorphism by the requisite unit gives this uniqueness.
   For restrictions that are not affine, first use smaller affine opens and §2.18's qualified
   Hom gluing. This also makes the pair independent of the chosen base affine.
2. These opens form a possibly infinite basis. The generator-preserving restriction
   isomorphisms satisfy the cocycle condition by uniqueness. Locally
   `RHom(K_U,K_U) ≅ O_U[0]`, hence all negative self-Ext groups vanish. Apply
   `Coherent.derivedObject_gluing` to construct `K` with compatible affine identifications.
   Quasi-coherence of cohomology is local, so `K ∈ DQCoh X`; its relative perfectness follows
   from the affine-local criterion, included in
   `IsRelativelyPerfect` for flat locally finitely presented `f` and `K ∈ DQCoh X`
   ([Lemma 36.35.3 (0DI2)](https://stacks.math.columbia.edu/tag/0DI2)). For two global pairs the
   affine comparisons give vanishing of negative cross-Ext as well, so
   `Coherent.derivedHom_isSheaf` glues their unique generator-preserving isomorphism
   ([Lemma 48.28.4 (0E2W)](https://stacks.math.columbia.edu/tag/0E2W)).
3. Construct `ξ` separately. Choose `W = ⋃_{U∈B} U ×_S U`, on which the diagonal is closed,
   and put `E = RHom_W(Δ_*O_X,L pr_1^*K|_W)`. The affine rigidifications show that `E`
   has cohomology only in degree zero. Transport the `ξ_U` to compatible sections of
   `H⁰(E)`. Compare them on smaller affine opens around diagonal points to obtain agreement
   on overlaps; off the diagonal `E=0`. Glue them as sections of that module sheaf, and use
   `Hom_{D(O_W)}(Δ_*O_X,L pr_1^*K|_W) = Γ(W,H⁰(E))` to obtain `ξ`.
   Its defining internal-Hom map is an isomorphism on the cover, hence globally
   ([Lemma 48.28.5 (0E2X)](https://stacks.math.columbia.edu/tag/0E2X)). Include the canonical
   comparison for another diagonal neighbourhood `W`.
4. Prove restriction and affine-basis refinement compatibility for the objects and their
   rigidifications. For arbitrary `S' → S`, pull back `K` and the diagonal morphism by the
   derived functors; flatness supplies the diagonal Tor-independence identifying the pulled-back
   `Δ_*O_X` with `Δ'_*O_{X'}`. Check the defining property by the affine base-change result
   in step 1, then compare with the constructed pair by `.unique`
   ([Lemma 48.28.6 (0E2Y)](https://stacks.math.columbia.edu/tag/0E2Y)). These comparisons commute
   with refinement and composition of base changes because they preserve the rigidifications.

*Needs:* §2.18's affine equivalence, derived operations, `Coherent.derivedHom_isSheaf` and
`Coherent.derivedObject_gluing`; the local criterion for relative perfectness. The comparison
`.upperShriek` uses §2.19 in its Noetherian separated finite-type regime.

Define `relativeDualizingModule f d hd hCM :=
H^{−d}(f^! O_Y)` for `f : X → Y` flat, separated, quasi-compact and locally of finite type with
`Y` Noetherian, `d : ℕ`, `hd : PureRelativeDimension d f`, and
`hCM : ∀ y : Y, Scheme.IsCohenMacaulay (f.fiber y)` (fibres Cohen–Macaulay of pure dimension `d`,
§0.18), with `upperShriek_structureSheaf_iso_shift`
(`f^! O_Y ≅ ω_{X/Y}[d]`) and `relativeDualizingModule_coherent` (coherent, flat over `Y`) (Stacks,
Lemma 48.21.7 (0BV8): for a Cohen–Macaulay morphism `f^! O_Y` is a coherent module flat over `Y`
placed in degree `−d`; Lemma 48.23.3 (0C0Z) and Remark 48.23.4 (0C10), in Section 48.23 (0AWQ)),
`relativeDualizingModule_baseChange` (`f^! O_Y` is a relative dualizing complex, Lemma 48.28.9
(0E9W), relative dualizing complexes are stable under derived base change, Lemma 48.28.6 (0E2Y), and
`ω_{X/Y}` is flat over `Y`, so its derived pullback is the ordinary one),
`relativeDualizingModule_invertible_iff` (invertible at `x` iff `f` is Gorenstein at `x`; Lemma
48.25.10 (0C08)), `relativeDualizingModule_smooth` (`ω ≅ ∧^d Ω_{X/Y}` for smooth `f`: Lemma 48.29.2
(0E9Z) where `f` factors through an immersion into a proper smooth `Y`-scheme, which holds on affine
opens of `X`, and Lemma 48.15.7 (0BRT) for `f` proper). Prove `cm_serre_duality`: for `X` proper
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
- `test_rdc_projective_line`: for `ℙ¹_S → S` it is `O(−2)[1] = Ω¹[1]`. Over a field,
  the standard affine differential bundles glue with `dy=−x⁻² dx` as in §2.18; the
  diagonal Koszul constructions on the affine charts give compatible `ξ_U` and the global
  relative-duality rigidification `ξ`.
- `test_rdc_refinement`: refining that affine basis by principal opens preserves both `K`
  and `ξ` under the unique compatible comparison, and this comparison commutes with base change.
- `test_rdc_infinite_basis`: for `⨿_{n≥0} ℙ¹_k → Spec k`, the construction on the infinite
  componentwise affine basis gives a relative dualising pair restricting to the preceding
  rigidified pair on every component.
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

The strand `Coherent` of `Suggested.lean` contains the derived-category and gluing interfaces
of §2.18; this subsection is specified in this README only. Define
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

The ring-level splitting theorems and the affine Azumaya criterion of this subsection are in
`Suggested.lean` (see the *Lean:* line); the sheaf-level definitions and theorems are specified in
this README only. Define
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
quasi-coherent `O_X`-algebra `A` finite locally free as a module **of positive rank at
every point** (equivalently locally faithful), the following are equivalent: `A`
is Azumaya; `A ⊗ A^op → End(A)` is an isomorphism; every geometric fibre `A ⊗ κ(x̄)` is a matrix
algebra of positive degree; `A` is fppf-locally a matrix algebra (Grothendieck, Brauer I, Théorème 5.1, Propositions
5.4–5.5, pp. 210–212). In the affine comparison use precisely the same condition:
`isAzumaya_iff_positive_fibres_mulLeftRight` identifies native `IsAzumaya R A`
with positive rank over every residue field together with bijectivity of
`AlgHom.mulLeftRight R A`, for finite projective `A`. Native `IsAzumaya` includes
`FaithfulSMul R A` (Mathlib, `Algebra/Azumaya/Defs.lean`); global nontriviality of
`A` does not replace it. Positivity is vacuous over the empty scheme.

Export `IsAzumaya.exists_etale_matrix_splitting` in the neutral ring-level API: for a commutative ring `A`, an `A`-algebra `R` with native `IsAzumaya A R`, `0 < d`, and `Module.rankAtStalk (R := A) R = d * d`, there is a commutative `A`-algebra `B` with `Algebra.Etale A B`, `Module.FaithfullyFlat A B`, and `B ⊗[A] R ≃ₐ[B] Matrix (Fin d) (Fin d) B`. Include the finite-cover adapter: from finitely many affine étale splitting charts `Spec Bᵢ → Spec A` whose images jointly cover `Spec A`, form `B = ∏ᵢ Bᵢ`, prove it is étale and faithfully flat over `A`, and assemble the chartwise splittings into the matrix equivalence over this same `B`. This ring-level result supplies both the affine/sheaf equivalence here and the reduced-norm construction in IntegralHeckeAndGaloisDeterminants; the ring-level API is independent of those consumers. Source: Grothendieck, *Le groupe de Brauer I*, Theorem 5.1(ii)–(iii), p.210; the finite-product construction passes from the affine cover to a single algebra.

Define `StabilizedEquivalence A B`: there are finite locally free `E`, `F` of
positive rank at every point with `A ⊗ End(E) ≅ B ⊗ End(F)`, with `refl`, `symm`, `trans`; and
`SchemeBrauerGroup X := Azumaya algebras / ≈`, an abelian group under `⊗` with inverse `A^op`, with
`SchemeBrauerGroup.mk`, `mk_eq_zero_iff` (`A ≅ End(E)`), `mk_tensor`, `mk_opposite`, `pullback f :
Br(Y) → Br(X)` (a group homomorphism, functorial), `brauer_affine_iff` (for `X = Spec R` and any
commutative ring `R`, every class is `mk` of the sheaf of an `R`-algebra `A` with native
`IsAzumaya R A`, by `azumaya_affine_iff`, and two such classes are equal iff
`A ⊗_R End_R(P) ≃ₐ[R] B ⊗_R End_R(Q)` for finite projective `R`-modules `P`, `Q` of positive rank
at every prime), `brauer_field` (for `Spec K`, Mathlib's `BrauerGroup K`). Mathlib's `BrauerGroup`
is defined over fields only, so `brauer_field` is the only comparison with it; for a ring `R`,
`Br(R)` below abbreviates `SchemeBrauerGroup (Spec R)`. Define
`CohomologicalBrauer X := (GmEtale X).H 2`'s torsion subgroup `Br′(X)` with `inclusion`, `mem_iff`,
`pullback`. For affine `X` and an Azumaya algebra over `Γ(X,O_X)` finite projective as a module,
`azumayaClass` takes values in `H²(X_ét,𝔾_m)`, with `azumayaClass_tensor` and
`azumayaClass_torsion` for a constant positive rank `d²` (Grothendieck, Brauer I, §2,
pp. 204–205; Brauer II, Proposition 1.4). This input describes the affine case; it does not
supply a construction from an arbitrary sheaf algebra on a non-affine scheme. For every scheme
`X`, the class map `SchemeBrauerGroup.toH2 : Br(X) → H²(X_ét, 𝔾_m)` is built from
`Azumaya.trivializationGerbeClass`: the gerbe of local splittings, its band by `𝔾_m`,
descent of splitting isomorphisms, the associated `H²` class, tensor and pullback
laws, and agreement with `azumayaClass` on affines; this construction is part of this target.
The classification of such gerbes and the comparison with a nonabelian central-extension
boundary are outside it. The image of `toH2` need not be torsion. Prove
`SchemeBrauerGroup.toCohomologicalBrauer`: if `X` is quasi-compact or connected, `toH2` factors
through `Br′(X)` as a group homomorphism, compatible with `pullback` along every morphism between
such schemes. On connected `X` the degree is a constant `d` and the class is killed by `d`
(Stacks, Lemma 59.62.2 (0A2L)); on quasi-compact `X` the locally constant degree takes finitely
many values, `X` is the finite disjoint union of the open and closed loci where it is constant, and
the class is killed by the least common multiple of those degrees (Stacks, Section 59.62 (0A2J),
the discussion after Lemma 59.62.2). Every comparison of `Br(X)` with `Br′(X)` below is for such `X`.
Prove `brauer_regular_injectivity`: for **affine** `X` regular
integral, `Br(X) → Br(K(X))` is injective, `Br(X)` is torsion, and `Br(X) = Br′(X)` when `X` is
regular affine of dimension `≤ 2` (Grothendieck, Brauer II, Proposition 1.4, Lemme 1.9, Corollaires 1.8,
1.10, pp. 291–293). Prove `brauer_kummer_sequence`: for `n` invertible on `X`, `0 → Pic(X)/n →
H²(X_ét, μ_n) → Br′(X)[n] → 0` (Stacks, Lemma 59.28.1 (03PL) and the long exact sequence after
Remark 59.28.2 (03PM)). Prove `brauer_henselian_local`: for
a henselian local ring `R` with residue field `k`, `Br(R) → Br(k)` is an isomorphism (Grothendieck,
Brauer I, Théorème 6.1, p. 214); the finite-field case `Br(k) = 0` is Tau Ceti's
`subsingleton_brauerGroup_of_finite`. Prove `brauer_hochschildSerre_sequence`: for a smooth
geometrically integral variety `X` over `k`, `X̄ = X_{k^s}`, and
`Γ(X̄,O)^× = k^{s×}` (in particular for proper geometrically integral `X`),
the exact sequence `0 → Pic(X) →
Pic(X̄)^{G_k} → Br(k) → ker(Br′(X) → Br′(X̄)) → H¹(G_k, Pic(X̄)) → H³(G_k, k^{s×})` from §2.15's
Hochschild–Serre spectral sequence and Hilbert 90. Source: David Harari,
[Étale cohomology and Brauer groups](https://www.imo.universite-paris-saclay.fr/~david.harari/enseignement/m2brauer23/etalbrauer.pdf),
Theorem 7.1 and Remark 3.35: the constant-unit hypothesis identifies the bottom row, and the
low-degree edge sequence gives the displayed maps. Harpaz–Wittenberg 2023, §3, display (3.1),
Remark 3.1, pp. 8–9, is the characteristic-zero homogeneous-space specialization with finite
geometric stabilizer. *Needs:* §1.1,
§2.4, §2.9, §2.11, §2.15; Mathlib `IsAzumaya`, `BrauerGroup`, `Matrix`; Tau Ceti
`brauerCohomologyEquiv`, `subsingleton_brauerGroup_of_finite`; AlgebraicVectorBundles L0B.

**Checks.**
- `azumaya_zero_algebra`: over a field the rank-zero matrix algebra has bijective
  `mulLeftRight` but fails native `IsAzumaya`.
- `azumaya_missing_component`: over `k × k`, the algebra `k` via the first
  projection is nonzero but unfaithful and not Azumaya; its second fibre has rank zero.
- `azumaya_empty_base`: the zero ring over itself is Azumaya, preserving the empty-base case.

- `brauer_units_torus_rejected`: for `X = 𝔾_m/ℝ`, `Pic(X_ℂ) = 0` but
  `(−1,t)` is a nonconstant algebraic Brauer class: evaluation at `t=1` is split
  and at `t=−1` is the Hamilton class. The unit `t` violates
  `Γ(X_ℂ,O)^× = ℂ^×`, so the constant-unit Hochschild–Serre sequence excludes `X`.
- `brauer_nonaffine_supplier`: for a non-affine `X` an arbitrary Azumaya sheaf
  need not be the sheaf associated to a finite projective algebra over `Γ(X,O)`.
  The affine comparison requires `IsAffine X`; a global algebra input alone
  cannot establish the non-affine equality.
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
- `test_class_structure_algebra`: the rank-one scalar algebra on an affine scheme has zero class.
- `test_class_empty`: the empty affine scheme has zero second cohomology.
- `test_class_matrix` (`azumayaClass (Mat_d(O_X)) = 0`), `test_class_quaternion_real` (nonzero,
  `2`-torsion), `test_class_field_agrees` (for `Spec K`, `azumayaClass` followed by
  `brauerCohomologyEquiv` is the class in `BrauerGroup K`), `test_class_not_module_class` (`ℍ` and
  `Mat_2(ℝ)` have isomorphic underlying modules and different classes).
- `brauer_test_integers` (`Br(Spec ℤ) = 0`), `brauer_test_henselian_dvr` (`Br(ℤ_p) = Br(𝔽_p) = 0`).
- `brauer_affine_test_integers`: over `ℤ`, which is not a field, `brauer_affine_iff` is stated
  through native `IsAzumaya ℤ`: `Mat_2(ℤ)` is Azumaya with zero class (`P = ℤ²`, `Q = ℤ`), while
  the Lipschitz order `ℤ⟨i, j⟩` with `i² = j² = −1`, `ij = −ji` is free of rank four and not
  Azumaya, its fibre at `2` being commutative.
- `brauer_disjoint_union_nontorsion`: on `X = ⨿_{n ≥ 1} Spec ℚ_p`, the central division algebra of
  invariant `1/n` on the `n`th component is an Azumaya algebra of unbounded degree. Its class in
  `H²(X_ét, 𝔾_m) = ∏_n Br(ℚ_p)` has restriction of order `n` to the `n`th component, so no positive
  integer kills it; `X` is neither quasi-compact nor connected, and `toH2` does not land in
  `Br′(X)`.
- `toCohomologicalBrauer_two_components`: on `Spec ℝ ⊔ Spec ℚ_p` with `ℍ` on the first component
  and the division algebra of invariant `1/3` on the second, the degrees are `2` and `3` and the
  class is killed by `6` and by no smaller positive integer.

*Lean:* `IsAzumaya.exists_etale_matrix_splitting`,
`IsAzumaya.etale_matrix_splitting_of_finite_cover`,
`Brauer.isAzumaya_iff_positive_fibres_mulLeftRight`, with `azumaya_zero_algebra` and
`azumaya_missing_component` as `example`s.

### 2.23 Equivariant sheaf cohomology

This subsection specifies the strand `Equivariant` in this README only (`Suggested.lean` has no
declaration for it). For a
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
abelian torsor boundaries from native connecting maps, `H¹_Z(𝔸¹, O) = k[t, t⁻¹]/k[t]`, `ω_{ℙ¹} = O(−2)`,
the Cousin resolution of a DVR, `Spec ℂ → Spec ℝ` as the étale-but-not-Nisnevich covering, and the
tower `μ_{ℓ^{n+1}} → μ_{ℓ^n}` separating replete from non-replete topoi.

### Dependencies

Layer 0: §0.4–§0.5 (quasi-coherent modules, pseudo-coherence), §0.9 (limits), §0.13–§0.14
(henselization and henselian pairs), §0.17–§0.18 (depth and Cohen–Macaulay). Layer 1: §1.1 (descent,
in §2.22) and §1.18 (stacks in groupoids). Mathlib and Tau Ceti as listed;
StableReduction Layers 1–2; JacobianChallenge Layer B; ProfiniteCohomology Layers 9–10;
AlgebraicVectorBundles L0B.
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
`dim_k H¹(X, O_X)`, Tau Ceti's `X.genus k` (`AlgebraicGeometry.Scheme.genus`), read under the
instance `FiniteDimensional k H¹(X, O_X)` that §2.6's finiteness (Stacks, Lemma 30.19.2 (02O6))
gives for `X` proper; `χ(X, F) = dim H⁰ − dim H¹` is Tau Ceti's
`Scheme.Modules.eulerCharBelow k X F 2`; and `Curve.cohomologyDim k X F i` abbreviates
`Module.finrank k` of Tau Ceti's `Scheme.Modules.Cohomology F i`. Finite locally
free sheaves of rank `r` are
AlgebraicVectorBundles L0B's `isFiniteLocallyFreeOfRank`. Abel–Jacobi with a base point is
JacobianChallenge Layer F; the Abel maps here need no base point. Néron–Severi groups and Picard
numbers are AbelianSchemesAndArithmeticModuli; coherent duality beyond curves is Layer 2; positivity
beyond degree bounds is Layer 5; Picard schemes over general bases are
AlgebraicModuliForArithmeticGeometry; models of curves are Layer 4. Tate modules and their cohomological comparisons are downstream applications of the
curve, Kummer and Picard theory here.

### 3.1 Curves are affine or projective; the genus under field extension

Prove `isAffine_or_isProper`: a curve `X` over `k` is either affine and not proper, or proper and
not affine, and a proper curve is projective (Stacks, Lemmas 0A24, 0A26, 0A27, 0A28). Prove
`genus_baseChange`: for a proper curve `X` with `H⁰(X, O_X) = k`, the base change `X_K` to any field
extension has `H⁰(X_K, O) = K` and the same genus; the hypothesis `H⁰ = k` is essential (for `X = ℙ¹_L` as a
`k`-scheme with `L/k` finite of degree `> 1` the genus is `0` but `H⁰ = L`), and `X_K` need not be reduced or
irreducible when `K/k` is inseparable (Stacks, Definition 0BY7, Lemma 0BY9; Lemma 0CE4; Lemma
0BY4). *Needs:* §0.7, §2.6; Tau Ceti `Scheme.Modules.Cohomology`; JacobianChallenge Layer B.

**Checks.**
- `isAffine_or_isProper_test_affineLine`, `test_projectiveLine`: `𝔸¹` is affine, `ℙ¹` is proper.
- *genus_baseChange_test_projectiveLine*: `ℙ¹_k` has genus `0` over every `K`.
- *genus_baseChange_test_inseparable*: for `k = 𝔽_p(t)` and `X` the regular projective model of
  `y² = x^p − t` (`p` odd), `X_{k(t^{1/p})}` is reduced but not normal; the genus is still `(p − 1)/2`, and the
  genus of its normalization drops to `0`.
- *genus_baseChange_test_constant_field*: for `X = ℙ¹_L` as a `k`-scheme, `L/k` finite of degree `> 1`: `X` is proper of
  dimension `1` with `H⁰ = L` and genus `0`, and for `K = L` the ring `H⁰(X_L, O) = L ⊗_k L` has
  dimension `[L : k] > 1` over `L`, so the conclusion `H⁰(X_K) = K` fails without `H⁰ = k`.

*Lean:* `Curve.cohomologyDim`, `Curve.structureModule`, `Curve.isAffine_or_isProper` (the
dichotomy; projectivity of proper curves is specified here
only), `Curve.baseChange`, `Curve.genus_baseChange`.

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
(Stacks, Lemmas 0C6M, 0C6T, 0C6N, Proposition 0C6U). Prove *genus_one_curves*: a smooth proper
geometrically connected curve of genus `1` with an invertible sheaf of degree `1` has a rational
point, and conversely; its degree-`d` Picard torsors are torsors under the Jacobian (Stacks, Lemma
0E3B for `h⁰(L) = 1`, Lemma 0AYY for the degree of the resulting divisor; Lemma 0CDU (1)); the
rational-point consequence for divisors is Tau Ceti's
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
- *genus_one_test_elliptic*: an elliptic curve has a degree-one sheaf `O(O)`.
- `degree_bounds_test_canonical`: `K` has degree `2g − 2` and `h⁰(K) = g`, so the bound
  `deg > 2g − 2` is sharp.

*Lean:* `Curve.genus_of_finite_etale` (the finite étale case of `scheme_riemann_hurwitz`),
`Curve.cohomologyDim_one_eq_zero_of_degree_gt` (the case `deg L > 2g − 2` of
`lineBundle_degree_bounds`). *genus_one_curves* is specified in this README only; its
rational-point consequence for divisors is Tau Ceti's
`SchemeWeilDivisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one`.

### 3.3 Degrees of vector bundles, Riemann–Roch and Serre duality on curves

Define `vectorBundleDegree E r := χ(X, E) − r · χ(X, O_X)` for `X` proper over `k` of dimension
`≤ 1` and `E` finite locally free of rank `r` (AlgebraicVectorBundles L0B's predicate; Stacks,
Definition 0AYR). API: *vectorBundleDegree_rankOne* (for `r = 1` it is Tau Ceti's
`InvertibleSheaf.eulerDegree`), `_of_iso`, `_add_of_shortExact` (additive in short exact sequences
of locally free sheaves; Lemma 0AYS), `_tensor` (`deg(E ⊗ V) = r deg V + s deg E`; Lemma 0AYX),
`_det` (`deg E = deg det E` with AlgebraicVectorBundles L0C's `determinant`; Lemma 0DJ5), `_dual`
(`deg E^∨ = −deg E`), `_twist` (by an effective Cartier divisor `D`: `deg E(D) = deg E + r deg D`),
`_elementaryModification`, `_baseChange` (invariant under field extension; Lemma 0B59),
`vectorBundleDegree_pullback` (for a nonconstant `f : X → Y` of proper integral curves over `k`
and `E` finite locally free of constant rank, `deg f^* E = [K(X):K(Y)] deg E`;
Stacks, Lemma 33.44.11 (0AYZ)), `_divisor` (for `E = O(D)` on a regular curve,
`deg = Σ n_x [κ(x) : k]`; Lemma 0AYY).
AbundanceStatement §4A / item 1 (by RoktimMascharak) states the regular projective
characteristic-zero special case of the rank-one/divisor comparison, and its item 1 includes
rank-one tensor, dual and trivial-degree laws. This subsection owns the arbitrary-field
vector-bundle statements; *vectorBundleDegree_abundanceComparison* identifies the regular
projective characteristic-zero rank-one specialization with the supplier's degree and divisor
conventions. It also identifies the rank-one pullback law of §4A / item 2 and §4C / item 3,
matching the positive function-field degree to the constant morphism degree `n`. The general
pullback theorem here retains constant rank `r` for `E`.
Prove `vectorBundle_riemann_roch`: for a proper curve `X`
over `k` with `H⁰ = k` and `E` locally free of rank `r`, `χ(X, E) = deg E + r(1 − g)`; by the
definition of the degree this is `χ(X, O_X) = 1 − g` (Stacks, Definition 0AYR), and `H⁰ = k` holds
for every proper geometrically integral `X` (`cohomologyDim_zero_structureModule`; Stacks, Lemma
33.9.3 (0BUG) (7)). The rank-one case is Tau Ceti's
`eulerCharBelow_eq_relativeDegree_add_one_sub_genus` and JacobianChallenge Layer B, and this target
differs by allowing higher rank and singular curves. Prove `curve_serre_duality`: for a
proper equidimensional Cohen–Macaulay curve `X` of dimension one over `k` with dualising module `ω_X` (§2.20), `Ext^{1+i}(F, ω_X) ≅
H^{−i}(X, F)^∨` for coherent `F` and all `i`, `H^i(X, E^∨ ⊗ ω_X) ≅ H^{1−i}(X, E)^∨` for `E` locally
free of finite rank. Separately prove `curve_serre_duality_ext_hom`:
`Ext¹(U, V) ≅ Hom(V, U ⊗ ω_X)^∨` for **finite locally free `U` and coherent `V`**,
by tensor–Hom adjunction and the dualizing-module formula. Also `ω_X ≅ Ω¹_{X/k}` for `X` smooth (Stacks, Lemmas 0BS2,
[53.4.2(3)–(4), 0BS3](https://stacks.math.columbia.edu/tag/0BS3), Remark 0BS4; Lemma 0C1A); the line-bundle smooth case is JacobianChallenge Layer B's and Tau
Ceti's `nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`, and this target differs by
allowing coherent sheaves, the `Ext` form and Cohen–Macaulay singular curves. *Needs:* §2.6, §2.20;
AlgebraicVectorBundles L0B–L0C; Tau Ceti `eulerCharBelow`,
`finrank_cohomology_zero_sub_one_eq_add`, `InvertibleSheaf.eulerDegree`; JacobianChallenge Layers
A–B; StableReduction Layer 2.

**Checks.**
- `pullback_double_line`: the reduced-line inclusion `ℙ¹ → V(z²) ⊂ ℙ²`
  has fibres of length one, but pulls degree-two `O(1)` back to degree one. The target
  curve is not integral; fibre length cannot replace the function-field degree hypothesis.
- *vectorBundleDegree_trivial*: `deg O_X^r = 0`.
- *vectorBundleDegree_projectiveLine*: on `ℙ¹_k`, `deg(O(a) ⊕ O(b)) = a + b`.
- *vectorBundleDegree_filtration*: `O(1) ⊕ O(−1)` on `ℙ¹` has degree `0` and is not trivial.
- *vectorBundleDegree_divisor*: on a regular proper curve, `deg O(D) = Σ n_x [κ(x) : k]`.
- *vectorBundleDegree_ne_eulerChar*: on a curve of genus `2`, `deg O = 0 ≠ χ(O) = −1`.
- `riemann_roch_test_nodal`: on the nodal cubic (geometrically integral, `g = 1`) `χ(E) = deg E`.
- `serre_duality_test_torsion`: for `F = κ(x)` a skyscraper on a smooth curve, `Ext¹(κ(x), ω) ≅
  H⁰(κ(x))^∨ ≅ κ(x)^∨` and `Hom(κ(x), ω) = 0`.
- `curve_serre_duality_node`: on the projective nodal cubic
  `y²z = x²(x+z)` over an algebraically closed characteristic-zero field, for the node
  skyscraper `K`, `dim Ext¹_X(K,K) = 2`, whereas `dim Hom_X(K,K ⊗ ω_X)^∨ = 1`.
  Compute on the affine chart `A = k[x,y]/(y²-x²(x+1))`, `K = A/(x,y)`;
  the Ext sheaves have point support, so there is no higher-cohomology correction.
  The module `K` is not projective over `A` and its sheaf is not locally free.
- `curve_serre_duality_locally_free`: for finite locally free `U` and coherent `V` on
  the same proper Cohen–Macaulay curve, tensor–Hom adjunction followed by duality gives
  the specified Ext–Hom isomorphism. In particular `U = O_X` is admitted even at a node;
  its Ext¹ against `V` is `H¹(X,V)`.
- `curve_serre_duality_smooth_torsion`: at a smooth point the general dualizing-module formula applies.
  On its local affine coordinate `R = k[t]`, `K = R/(t)`, compute
  `Ext¹_R(K,R) ≅ k` and `Hom_R(K,R) = 0`; this uses the general dualizing-module
  formula and does not assert that `K` is locally free.

*Lean:* `Curve.isFiniteLocallyFreeOfRank` (AlgebraicVectorBundles' rank predicate),
`Curve.vectorBundleDegree`, `Curve.vectorBundleDegree_add_of_shortExact`,
`Curve.vectorBundleDegree_pullback` (dominance expresses nonconstancy between integral curves),
`Curve.cohomologyDim_zero_structureModule` (`H⁰(X, O_X) = k` for `X` proper and geometrically
integral, the input of `vectorBundle_riemann_roch`, which is otherwise the definition of the degree
and is specified in this README only), with *vectorBundleDegree_ne_eulerChar* and
`pullback_double_line` as `example`s.

### 3.4 Picard groups: divisor classes, excision, Picard groupoids

The cohomological description `Pic(X) = H¹(X_ét, 𝔾_m)` is §2.11's `hilbert90`, cited and not
restated; its affine case is `lineBundleClass_spec_equiv_pic : LineBundleClass (Spec R) ≃
CommRing.Pic R`.

**Cartier and Weil comparisons — `cartierClass_picard_equiv`, `picardToClassGroup`.**
For integral `X`, use the pinned `Scheme.CartierDivisor.toLineBundleClassHom`,
`toLineBundleClass_surjective` and `toLineBundleClass_principalCartierDivisor` to
identify Cartier divisors modulo principal divisors with `LineBundleClass X`.
Prove the kernel statement by comparing rational trivializations; no dimension bound is
imposed. For normal integral locally Noetherian `X`, construct `picardToClassGroup`
by taking the codimension-one orders of a rational section of an invertible sheaf.
Changing the section adds a principal Weil divisor. Prove
`classGroup_picard_locallyFactorial`: this homomorphism is injective and is bijective
when `X` is locally factorial. Compare its inverse with pinned
`SchemeWeilDivisor.classGroupToLineBundleClass` and
`classGroupAddEquivLineBundleClass` only for Noetherian regular integral curves,
where the pinned coheight-at-most-one hypothesis holds.
Source: Stacks, §§31.27–31.28 (0BE4, 0BE6), Lemmas 31.28.6–31.28.7 (0BE8, 0BE9).
*Needs:* the pinned Cartier-divisor representation and Picard maps, rational
trivializations and codimension-one valuations; Tau Ceti `SchemeWeilDivisor`.

**Checks.**
- On `ℙ²_k`, the hyperplane Cartier divisor maps to `O(1)` and to its Weil class;
  both class groups are `ℤ`, in dimension two.
- For the normal quadric cone `k[x,y,z]/(xy−z²)`, `Pic=0` and `Cl=ℤ/2`;
  `picardToClassGroup` is injective and not surjective.
- On a regular integral proper curve, this comparison is inverse to the pinned
  divisor-class-to-line-bundle equivalence and preserves the residue-weighted degree.

Prove `picard_excision_sequence`: for `X` integral locally Noetherian, `D ⊆ X` an integral closed
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
`isStack` (fppf descent, §1.1). Define `gradedPicardGroupoid X` with objects pairs `(L, f)`, where
`L` is an invertible sheaf and `f : LocallyConstant X ℤ` is a locally constant function on the
underlying space of `X`. A morphism `(L, f) → (M, g)` exists only when `f = g`, and is then an
isomorphism `L ≅ M`. The tensor product is `(L, f) ⊗ (M, g) = (L ⊗ M, f + g)`, with unit `(O_X, 0)`
and inverse `(L⁻¹, −f)`; pullback along `h : Y → X` sends `(L, f)` to `(h^* L, f ∘ h)`, the degree
pulled back by `LocallyConstant.comap` along the underlying continuous map of `h`. The symmetry of
`(L, f) ⊗ (M, g)` is the line-bundle symmetry `ℓ ⊗ m ↦ m ⊗ ℓ` multiplied by `(−1)^{f·g}`: since `f`
and `g` are locally constant, the sign is constant on each clopen locus where both are constant, and
these constant signs glue to a unit of `Γ(X, O)`. Prove `gradedPicardGroupoid.pi0_equiv`
(`π_0 ≅ LineBundleClass X × LocallyConstant X ℤ`, equivalently `Pic(X) × H⁰(X_ét, ℤ)`) and
`gradedPicardGroupoid.pi1_equiv` (`π_1 ≅ Γ(X, O)^×`) (Bhatt–Scholze 2017, §4, p. 15, Construction
5.1, p. 18). *Needs:* §1.1, §2.11; Tau Ceti `LineBundleClass`, `InvertibleSheaf`,
`SchemeWeilDivisor`, `classGroupToLineBundleClass`; Mathlib `CommRing.Pic`, `Core`, `Skeleton`,
`LocallyConstant`.

**Checks.**
- `picardGroupoid_pi0` (`π_0 = Pic`), `picardGroupoid_field` (`π_1 = K^×` for `Spec K`),
  `picardGroupoid_projectiveLine` (`π_0 = ℤ`, `π_1 = k^×`), `picardGroupoid_not_discrete` (for
  `Γ(X, O)^× ≠ 1` the groupoid is not the discrete groupoid on `Pic X`).
- `gradedPicardGroupoid_connected`: on connected `X` every degree is constant
  (`LocallyConstant.eq_const`), so `π_0 ≅ LineBundleClass X × ℤ`.
- `gradedPicardGroupoid_disjointUnion`: on `X = X₁ ⊔ X₂` the degree may take different values on the
  two components. For `X = Spec (k × k)` with `char k ≠ 2` and `f = (0, 1)`, the self-symmetry of
  `(O_X, f)` is multiplication by the unit `(1, −1)`.
- `gradedPicardGroupoid_pointDegree`: on `X = 𝔸¹_ℚ`, the function equal to `1` at the origin and
  `0` elsewhere is not locally constant, so it is no degree. Admitting it would make the self-symmetry
  of `(O_X, f)` a unit of `ℚ[t]` with value `−1` in `κ(0)` and `1` in `ℚ(t)`, but
  `ℚ[t]^× = ℚ^×` consists of constants.
- `gradedPicardGroupoid_pullback_component`: for `X = X₁ ⊔ X₂` with `X₁` connected, pullback along
  the inclusion of `X₁` sends `(L, f)` to `(L|_{X₁}, a)`, where `a` is the constant value of `f` on
  `X₁`.
- `gradedPicardGroupoid_degreeZero`: the objects of degree `0` and their morphisms form
  `picardGroupoid X`, with its ordinary symmetry.
- `classGroup_test_cone`: for the quadric cone `k[x, y, z]/(xy − z²)`, `Pic = 0` and `Cl = ℤ/2`: the
  map is injective and not surjective (not locally factorial).
- `excision_test_affineLine_minus_point`: `Cl(𝔸¹) = 0 → Cl(𝔸¹ ∖ {0}) = 0` and the kernel of
  `ℤ → Cl(𝔸¹)` is `ℤ`; the units sequence reads `k^× → k^× × t^ℤ → ℤ → 0 → 0`, the middle map
  `(c, t^n) ↦ n`.

*Lean:* `Picard.lineBundleClass_spec_equiv_pic` (stated as the existence of a bijection).
`picardGroupoid` and `gradedPicardGroupoid` are specified in this README only; the degree carrier is
Mathlib's `LocallyConstant`, not a second locally-constant-function API.

### 3.5 Norms of invertible sheaves

Define `lineBundleNorm π : LineBundleClass X → LineBundleClass Y` for `π : X → Y` finite locally
free (finite, flat and locally of finite presentation, ModularCurves 0B's convention), as the norm
of a line bundle along a finite locally free morphism; the degree enters only the statements that
need it, through `Scheme.Hom.finrank`: `Norm_π(L)` is the invertible sheaf whose local
trivialisations are the determinants of `π_* L` relative to `π_* O_X` (Stacks, Lemmas 0BCY, 0BCZ,
0BD2). API: `lineBundleNorm_tensor`, `_one` (a group homomorphism), `_pullback` (`Norm(π^* N) = N^{⊗
d}` when `π.finrank` is constantly `d`), `_comp` (`Norm_{π∘ρ} = Norm_π ∘ Norm_ρ`), `_baseChange`,
`_det` (`Norm_π(L) ⊗ det(π_* O_X) ≅ det(π_* L)`, with AlgebraicVectorBundles L0C's `determinant`),
`sectionNorm` (every section `s` of `L` has a norm section of `Norm_π L`; when `s` is regular,
its norm is regular and `div(Norm(s)) = π_*(div(s))`), `lineBundleNorm_divisor` (`Norm_π O(D) = O(π_* D)` on regular curves). Hypotheses: `π` finite
locally free; where a degree appears it is `π`'s `finrank`, never a free parameter. *Needs:* §3.4;
Mathlib `IsFinite`, `Flat`, `LocallyOfFinitePresentation`, `Scheme.Hom.finrank`;
AlgebraicVectorBundles L0C; ModularCurves 0B.

**Checks.**
- `lineBundleNorm_zero_section`: for the identity of `ℙ¹_k` and `L=O`, the zero section has
  norm zero, but its vanishing scheme is all of `ℙ¹_k`, not an effective Cartier divisor; the
  divisor identity does not apply.
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

Throughout, `X` is a smooth projective geometrically connected curve over `k`, as in §3.6; for a
`k`-scheme `T`, `X_T := X ×_k T`. Define `picardStack X : StackInGroupoids`: objects over `T` are invertible
sheaves on `X_T`, morphisms isomorphisms (the fibre over `T` is `picardGroupoid (X_T)` of
§3.4), with `degreeComponent d`, `aut_eq_units` (`Aut(L) = Γ(T, O_T)^×`, since
`Γ(X_T, O) = Γ(T, O_T)` by flat base change from `H⁰(X, O_X) = k`), `toPicardSheaf` (to
JacobianChallenge's `Pic_{X/k}`), `isGerbe` (a `𝔾_m`-gerbe over `Pic_{X/k}`, not in general the
product `Pic_{X/k} × B𝔾_m`), `universalBundle` (a line bundle on `X × picardStack X`; a universal
bundle on `X × Pic^d_{X/k}` exists only when the gerbe is split), `split_of_point` (split by a
rational point), `tensor`, `baseChange` (Yun–Zhang 2017, §3.2.1, p. 16). Define `sectionStack
X` over `picardStack X`: pairs `(L, s)` with `s ∈ Γ(X_T, L)`, with `forget`, `zeroSection`,
`eq_of_neg` (the fibre over degree `d < 0` is the zero section), `symmetricPowerEquiv` (in degree
`d ≥ 0`, the open substack of pairs with `s|_{X_t} ≠ 0` for every `t ∈ T` is `X^{(d)}`,
JacobianChallenge Layer C's symmetric power: the zero scheme of such an `s` is a relative effective
Cartier divisor of `X_T/T`, finite locally free of degree `d` over `T`, and conversely; Stacks,
Lemmas 31.19.9 (062Y) and 44.3.1 (0B9D)),
`isTotalSpace` (over the degree-`d` Picard stack with `d > 2g − 2` the section stack is the total
space of the vector bundle `p_* L^{univ}` of rank `d + 1 − g`, and its open substack of fibrewise
nonzero sections is that bundle minus its zero section, not a projective bundle over the stack; `X^{(d)}` is
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
- `picardStack_aut_not_geometrically_connected`: `ℙ¹_ℂ` as an `ℝ`-scheme is a smooth proper integral
  curve that is not geometrically connected; over `T = Spec ℝ` the automorphisms of its structure
  sheaf are `ℂ^×`, not `ℝ^×`, so it is outside `aut_eq_units`.
- `sectionStack_nodal_cubic`: on a proper nodal cubic over an algebraically closed field the node is
  a point of `X^{(1)} = X`, but the reduced node is not an effective Cartier divisor (the maximal
  ideal of its local ring needs two generators), so it is the zero scheme of no section of a line
  bundle; the nodal cubic is outside `symmetricPowerEquiv`.
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
`i.ker * i.ker = ⊥` (Stacks, Definition 37.2.1 (04EX)). API: *IsFirstOrderThickening.isThickening*,
*isFirstOrderThickening_specMap_iff* (`Spec (B/J) → Spec B` iff `J² = 0`),
*IsFirstOrderThickening.pullback*, *IsThickening.homeomorph*, *IsThickening.factor_firstOrder* (a
thickening of order `n + 2` factors through a first-order thickening of one of order `n + 1`),
*IsThickening.isUniversalHomeomorphism* (§0.23). Define `FormallySmooth f` (respectively
`FormallyUnramified`, Mathlib's, and `FormallyEtale f`) for `f : X → S`: for every first-order
thickening `T → T'` of **affine** schemes over `S`, every `S`-morphism `T → X` extends to at least
one (at most one, exactly one) `S`-morphism `T' → X` (Stacks, Definitions 37.11.1 (02H0), 37.6.1
(02H8), 37.8.1 (02HG)). API: *formallySmooth_specMap_iff* (Mathlib's `RingHom.FormallySmooth`),
*FormallySmooth.iff_affineLocally*, `.comp`, `.pullback`, *FormallyEtale.of_isOpenImmersion*,
*formallyEtale_iff* (`FormallySmooth ∧ FormallyUnramified`), *FormallySmooth.of_smooth* (Lemmas
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
- *isFirstOrderThickening_dualNumber*: `Spec k → Spec k[ε]` is first-order.
- *isFirstOrderThickening_id*: the identity is a first-order thickening.
- `not_isFirstOrderThickening_cube`: `Spec k → Spec k[x]/(x³)` is a thickening and not first-order.
- `not_isThickening_origin`: `Spec k → 𝔸¹_k` is a closed immersion that is not a thickening.
- *formallySmooth_affineSpace*: `𝔸(n; S) → S` is formally smooth; *formallyEtale_id*;
  `not_formallySmooth_closedPoint` (`Spec k → 𝔸¹_k` is not formally smooth);
  `formallyUnramified_iff_mathlib`.
- `lifting_torsor_test_affine_space`: lifts of `T → 𝔸¹_S` along `T → T'` form a torsor under
  `Γ(T, I)`.

*Lean:* `Formal.IsThickening`, `Formal.IsFirstOrderThickening`, `Formal.FormallySmooth`,
`Formal.FormallyEtale`, `Formal.smooth_iff_formallySmooth`, `Formal.etale_iff_formallyEtale`, with
`not_isFirstOrderThickening_cube` as an `example`. The API above and `smooth_lifting_torsor` are
specified in this README only.

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
Remark 90.6.3 (06GT), the set-valued case of Definition 90.6.2 (06GS)). For `A' → A`, `A'' → A` with
the second surjective, define `θ : F(A' ×_A A'') → F(A') ×_{F(A)} F(A'')` and the conditions `H1`
(`θ` surjective whenever `A'' → A` is a small extension), `H2` (`θ` bijective for `A = k`,
`A'' = k[ε]`), `tangentSpace := F(k[ε])` with the `k`-vector space structure under `H2`
(`tangentSpace.addCommGroup`, `.module`, `add_def`: the sum is computed by `dualAdd`; Lemma 90.12.2
(06IH)), `H3` (finite-dimensional tangent space), `H4` (`θ` bijective for `A' = A''` a small
extension of `A`), and `RS` (`θ` bijective whenever `A'' → A` is surjective) (Stacks, Definitions
90.10.1 (06HW), 90.12.1 (06IG), 90.16.1 (06J2), 90.16.8 (06J9); Remarks 90.10.3 (06HY), 90.13.5
(0D3G), 90.16.5 (06J6), 90.16.9 (06JA): for a set-valued functor the conditions `(S1)`, `(S2)` and
`(RS)` of Stacks are `H1`, `H2` and `RS`, where surjectivity of `θ` on small extensions gives it on
all surjections, Lemma 90.10.2 (06HX), and `RS` may likewise be checked on small extensions, Lemma
90.16.3 (06J4)). Define `SatisfiesH1H2 F := H1 ∧ H2`, Schlessinger's first two conditions, and
`IsDeformationFunctor F := RS`, the Rim–Schlessinger condition; together with the point `F(k)` of
the carrier this is a deformation functor in the sense of Remark 90.16.9 (06JA).
`IsDeformationFunctor.satisfiesH1H2`: `RS` implies `H1` and `H2` (Lemma 90.16.6 (06J7)). API:
`lifts_torsor` (for a deformation functor `F`, the lifts of `ξ ∈ F(A)` along a surjection `A' → A`
whose kernel `I` is killed by `m_{A'}`, in particular along a small extension, when nonempty, form
a torsor under `T_F ⊗ I`, with `act(0,x)=x`, `act(v+w,x)=act(v,act(w,x))` and a unique translator
between any two lifts; Lemma 90.17.5 (06JI)), `PredeformationFunctor.map` (functoriality on tangent spaces), `tangent_eq_derivations`
(for `h_R`, `T = Der_Λ(R, k)` through Tau Ceti's `derivationToDualNumberEquivLift`). Define `prorep
R : PredeformationFunctor Λ k` for `R ∈ Ĉ_Λ`, `h_R(A) = {f : R →ₐ[Λ] A | ρ_A ∘ f = ρ_R}`, with maps given by composition. The
augmentation condition is part of the carrier, rather than an unspecified choice of a functor. *Needs:* §4.2; Mathlib
`DualNumber`; Tau Ceti `derivationToDualNumberEquivLift`.

The functor `vanishingSubterminal a b ha` has a point at `A` precisely when
`a_A = 0` or `b_A = 0`; `ha` supplies vanishing of `a` in the residue field.

**Checks.**
- `subterminal_values`: `vanishingSubterminal a b ha` has subsingleton values.
- `subterminal_residue`: if `a` vanishes in the residue field, its value there is inhabited.
- `subterminal_nonzero`: if both images are nonzero in `A`, its value at `A` is empty.
- `subterminal_not_point`: for `Λ = k[[a,b]]`, let `F(A)` be a singleton when
  `a_A = 0` or `b_A = 0`, and empty otherwise. Take dual numbers with
  `(a,b)=(ε,0)` and `(0,ε)` over `k`. Both factors have a point, their fibre
  product has none, and `H1` fails. `point_functor` requires every value inhabited.
- `lifts_action_identity`: translation by zero fixes every lift.
- `lifts_action_composition`: translating by `v+w` equals translation by `w` then `v`,
  for `v,w ∈ T_F ⊗_k I`.
- `lifts_fake_action_rejected`: on `ℤ/3`, `act(v,x)=v+2x` has a unique translator
  between each pair, but `act(0,1)=2`; simple transitivity alone is not an action.
- `prorep_tangent_powerSeries`: for `R = Λ[[t_1..t_n]]`, `T_{h_R} = k^n`.
- `point_functor`: the one-point functor satisfies `H1`–`H4` with zero tangent space.
- `not_H2_quotient`: for `char k ≠ 2`, the quotient of `h_{k[[t]]}` by `t ↦ −t` satisfies `H1` and
  not `H2`.
- `tangent_eq_derivations`: `T_{h_R} ≅ Der_Λ(R, k)`.

- `prorep_augmentation`: every point preserves the fixed map to the residue field.
- `prorep_residue`: evaluation at `k` has the single point `ρ_R`.
- `prorep_map_computed`: the image along `A → B` is the composite `R → A → B`, using the
  native algebra-map composition.
- `prorep_wrong_augmentation`: a map with `ρ_A ∘ f ≠ ρ_R` is not an `h_R(A)` point.

### 4.4 Versality, hulls and Schlessinger's theorem

Define `IsSmoothMorphism η` for `η : F → G` of predeformation functors: for every surjection `A' →
A` in `C_Λ`, `F(A') → F(A) ×_{G(A)} G(A')` is surjective (Stacks, Definition 90.8.1 (06HG));
`FormalElement F R := h_R → F` for `R ∈ Ĉ_Λ` (such transformations correspond to the formal objects
of Definition 90.7.1 (06H3) over `R`, Remark 90.7.12 (06HC)); `IsVersal ξ` for a formal element:
`ξ : h_R → F` is smooth (Definition 90.8.9 (06HR)); `IsHull ξ`: versal and bijective on tangent
spaces, the hull of Remark 90.15.6 (06IY) (condition (90.15.0.1) of Section 90.15 (06IL)), as opposed
to the minimal versal formal objects of Definition 90.14.4 (06T4); `IsProrepresentable F`: some `ξ`
is an isomorphism (Definition 90.6.1 (06GX)). The statements below are made in the classical setting
set out at the start of §4.3, where `Λ → k` is surjective, so `k' = k`, `Der_Λ(k, k) = 0`, and the
two tangent conditions (90.15.0.1) and (90.15.0.2) of Section 90.15 coincide. Prove `IsHull.unique`
(two hulls have isomorphic rings: in the classical setting a hull is a minimal versal formal
element, Lemma 90.15.1 (06IR), and minimal versal formal elements are unique up to isomorphism,
Lemma 90.14.5 (06T5)), `IsProrepresentable.isHull`, `smooth_iff_powerSeries` (`h_R → h_Λ` is smooth
iff `R ≅ Λ[[t_1..t_n]]`), `IsVersal.exists_hull_of_H1H2`: **under `SatisfiesH1H2`** (which every
deformation functor satisfies) and `H3`, every versal formal element `ξ : h_R → F` factors as
`h_R → h_{R_0} → F` with `(R_0, ξ_0)` a hull and an isomorphism `e : R ≅ R_0[[t_1..t_r]]` for some
finite `r`, with `ξ` the composite. The map `h_R → h_{R_0}` sends `x : R → A` to `a ↦ x(e⁻¹(C(a)))`,
fixing the factorization as the coefficient inclusion under `e` (Stacks, Lemmas 90.14.2 (06T2) and
90.14.3 (06T3): under `(S1)` a versal formal object is a power series extension of a minimal versal
one; Lemma 90.15.4 (06T8): under `(S2)` the minimal versal formal object satisfies (90.15.0.2), which
in the classical setting makes it a hull); the hypotheses are necessary: a predeformation functor
can have a versal element and no hull (`versal_quotient_no_hull` below, which fails `H2`). Prove
`schlessinger_hull`: in the classical setting a predeformation functor has a hull iff it satisfies
`H1`, `H2` and `H3` (a hull forces `H1`, `H2` and `H3`, Lemma 90.15.2 (06IV); conversely `H1`, `H2`
and `H3` give a versal formal element, Lemma 90.13.4 (06IW), and then a hull, Theorem 90.15.5 (06IX),
whose three conditions are equivalent when `k' ⊂ k` is separable, as Remark 90.15.6 (06IY) records
for hulls); and
`schlessinger_prorepresentable`: in the classical setting `F` is prorepresentable iff it is a
deformation functor with finite-dimensional tangent space (Theorem 90.18.2 (06JM), whose third
condition, injectivity of `γ : Der_Λ(k, k) → T_F`, holds because `Der_Λ(k, k) = 0` when `Λ → k` is
surjective), equivalently iff it satisfies `H1`, `H2`, `H3` and `H4` (Schlessinger 1968, Theorem 2.11;
a prorepresentable functor satisfies `RS`, Example 90.16.10 (06JB)).
*Needs:* §4.2, §4.3; Mathlib `AdicCompletion`, `MvPowerSeries`.

**Checks.**
- `hull_prorep`: for `F = h_R`, `(R, 𝟙)` is a hull and `F` is prorepresentable.
- `smooth_iff_powerSeries`: `h_R → h_Λ` is smooth iff `R` is a power series ring over `Λ`.
- `versal_not_hull`: for `F = h_{k[[t]]}`, `(k[[t, s]], t ↦ t)` is versal and not a hull (tangent
  map not injective); `IsVersal.exists_hull_of_H1H2` recovers the hull `k[[t]]` with `r = 1`.
- `versal_quotient_no_hull`: for `char k ≠ 2`, the quotient functor `D` of `not_H2_quotient` (a
  predeformation functor failing `H2`) has the versal formal element `h_{k[[t]]} → D` and no hull,
  because a hull would force `H2`; this is the counterexample outside the hypotheses of
  `IsVersal.exists_hull_of_H1H2`, and `schlessinger_hull` confirms it.
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
= (1 ⊗ (I → I_1))(ob_e(ξ))` when `ξ'` is the image of `ξ`). This is an elementary
obstruction theory, restricted to nonzero one-dimensional kernels. It is not the all-module
obstruction functor of Stacks, Definition 98.22.1 (07YG); that definition supplies the broader
comparison of terminology. Small extensions are those of Definition 90.3.2 (06GD): surjections with
nonzero principal kernel killed by the maximal ideal.
API: `lift_iff'`, `ObstructionTheory.zero` for a functor lifting across all elementary small
extensions, and `ObstructionTheory.map` along a smooth morphism of functors. Obstruction
functors on arbitrary finite-dimensional kernels, direct-sum compatibility, and bounds on
relations in a hull are outside this subsection's scope. The presentation `k[[t]]/(t) = k`
illustrates why an elementary obstruction space alone is not a bound on the number of
relations in an arbitrary presentation. *Needs:* §4.3, §4.4; Mathlib `TensorProduct`.

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
- `obstruction_H1_example`: fix `Λ=k`, a `k`-scheme `T`, a smooth `k`-scheme `X`, and
  `a:T→X`. On `C_k` use the functor of maps `T_A=T×_k Spec A → X_A` reducing to `a`.
  The prescribed thickenings are `T_A ↪ T_{A'}` from small extensions `A'→A`.
  If `H¹(T,Hom(a^*Ω_{X/k},O_T))` is finite-dimensional, it is an obstruction space
  (§4.1); this holds, for example, when `T` is proper of finite type over `k`.
- `obstruction_H1_punctured_plane`: for `T=𝔸²_k∖{0}`, `X=𝔸¹_k`, `a=0`, this group
  is `H¹(T,O_T)`, with basis `x^(−i)y^(−j)` for `i,j≥1`. It is infinite-dimensional
  and fails `ObstructionTheory`'s finiteness condition (the two-affine Čech computation
  of §2.6).

- `kernel_not_residue_vector_space`: in `ker(ℤ/8 → ℤ/2)`, `2 · 2 = 4 ≠ 0`.
  Thus an arbitrary surjection's kernel is not an `𝔽₂`-vector space; the kernel
  construction and its linear maps require the small-extension hypothesis.

### 4.6 Deformations of algebras, smooth schemes, line bundles and nodes

Prove *algebra_deformation_classes*: for `0 → I → A' → A → 0` square-zero,
`B` flat over `A`, and an existing flat lift of `B` to `A'`, lift isomorphism
classes form a torsor under `Ext¹_B(NL_{B/A}, B ⊗_A I)`; infinitesimal
automorphisms are `Hom_B(Ω_{B/A}, B ⊗_A I)`. Here `NL` is the two-term
cotangent complex supplied by `Algebra.Extension.cotangentComplex`, using a free
presentation and presentation independence (Stacks 08S7, 08S5, 0GPT).
The exact two-term declarations are
`Algebra.Extension.cotangentComplex`, `exact_cotangentComplex_toKaehler` in
`Mathlib/RingTheory/Extension/Cotangent/Basic.lean`; §4.6 packages this map in
degrees `−1,0` before taking `Ext¹`. Prove
`deformations_of_smooth_schemes`: for `X` smooth proper over `k` and a small extension `A' → A`,
the obstruction to deforming a deformation over `A` to `A'` lies in `H²(X, T_X) ⊗ I`, the
deformations form a torsor under `H¹(X, T_X) ⊗ I`, and automorphisms are `H⁰(X, T_X) ⊗ I`; for an
invertible sheaf `L` on `X_A`, the obstruction to deforming `L` lies in `H²(X, O_X) ⊗ I` with
deformations a torsor under `H¹(X, O_X) ⊗ I` (Stacks, Example 93.9.1 (0DY7), Lemmas 93.9.2–93.9.5
(0DY8, 0DY9, 0DYA, 0ET5), 93.16.4 (0DZQ), 91.8.1 (0D14), 37.13.7 (0D0N), 37.4.1 (0C6R)). Prove
`node_versal_deformation` in §4.3's coefficient setting (`Λ` complete Noetherian local with
residue field `k`): the deformation functor of the split node `k[[u, v]]/(uv)` has hull
`Λ[[t]]` with versal family `uv = t`. Separately, for a stable nodal curve `C/k` of genus
`g ≥ 2`, its deformation functor has a formally smooth hull of relative dimension `3g−3`,
noncanonically `Λ[[t_1..t_{3g−3}]]`. For the additional labelled-coordinate assertion assume
`k` algebraically closed, let `δ` be the number of geometric nodes of `C`, and choose their
ordering and split local coordinates. The hull coordinates can then be chosen so that the
family at the `i`th node is `uv = t_i` and its persistence locus is `t_i = 0`, for `1 ≤ i ≤ δ`
(Deligne–Mumford 1969, §1, the split-node example and Proposition (1.5), pp. 81–82,
Theorem (1.6), p. 83). Over a general residue field the individual geometric smoothing
coordinates are asserted after geometric base change, with their descent action retained;
the smooth-hull dimension does not require such coordinates to descend. The local `uv = t`
convention is the rational split-node convention used in §4.18. *Needs:* §2.6, §4.1, §4.3, §4.4, §4.5; Mathlib
`Algebra.Extension.cotangentComplex` (`NL`), `Ext`; StableReduction Layers 1, 3.

**Checks.**
- *algebra_deformation_test_smooth*: a smooth algebra deforms uniquely up to isomorphism (`NL`
  is `Ω` in degree `0`, its `Ext¹` vanishes; formal smoothness supplies existence).
- `smooth_scheme_test_projective_line`: `ℙ¹` is rigid (`H¹(T) = 0`) and unobstructed.
- `smooth_scheme_test_elliptic`: an elliptic curve has one-dimensional `H¹(T)` and `H²(T) = 0`.
- `node_test_smoothing`: the fibre of `uv = t` over `t ≠ 0` is smooth.
- `node_test_labelled_coordinates`: over algebraically closed `k`, a stable curve with `δ`
  ordered nodes has `δ` individual persistence hyperplanes in its `3g−3`-dimensional hull.
- `node_test_conjugate_nodes`: a stable real genus-two curve obtained from `ℙ¹_ℂ` by identifying
  `i` with `2i` and `−i` with `−2i`, with conjugation descent, has one closed node with residue
  field `ℂ` and two geometric nodes. Its local smoothing tangent space is a `ℂ`-line, hence has
  real dimension two. After complexification the two parameters are `a+ib` and `a−ib`, exchanged
  by conjugation. Their combined persistence boundary descends as `a²+b² = 0`; the individual
  hyperplanes do not descend to real coordinate hyperplanes.

### 4.7 The formal spectrum and adic thickening systems

Define `AdicRing`: a ring `A` with a finitely generated ideal `I` such that `A` is `I`-adically
complete and separated (Mathlib `IsAdicComplete I A`) (Stacks, Definition 15.37.1 (07E8)). Define
`AdicThickeningSystem`: a sequence of schemes `X_n` with closed immersions `ι_n : X_n → X_{n+1}`
that are thickenings and satisfy `ker ι_n = (ker (X_0 → X_{n+1}))^{n+1}` (so `X_n` is the `n`-th
infinitesimal neighbourhood of `X_0` in `X_{n+1}`), with `reduction n`, `levelMap`, `Hom` (families
of morphisms `X_n → Y_n` commuting with the `ι`), `IsAdicHom` (each square is cartesian),
`ofScheme X` (the constant system), `IsLocallyNoetherian`, `pullback` of adic morphisms computed
levelwise with `pullback_X`. Stacks, Definition 87.9.9 (0AIF), defines `Spf A` as the colimit of the
sheaves `Spec(A/I)` over the ideals of definition; here the same data are kept as the level system
`(Spec(A/I^{n+1}))_n` with its transition maps. This is not the category of formal
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
- `adic_tower_cubic_rejected`: take `X₀=Spec k`, `X_n=Spec k[t]/(t³)` for `n≥1`, with the
  origin inclusion followed by identity transitions. Every transition is a thickening, but
  at `n=1` its kernel is zero while `(ker(X₀→X₂))²=(t²)≠0`; it is not an adic system.
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

*Lean:* `Formal.AdicRing`, `Formal.levelMap`, `Formal.AdicThickeningSystem`. Morphisms of
systems, `Spf` and the rest of the API are specified in this README only.

### 4.8 Formal completion and coherent formal modules

Define `Scheme.formalCompletion X I` for a scheme `X` and `I : X.IdealSheafData`: the adic
thickening system of the infinitesimal neighbourhoods `V(I^{n+1})`, with `toScheme n : V(I^{n+1}) →
X`, `map` (functoriality for morphisms carrying the first centre into the second), `reduction`
(Stacks, Lemma 87.14.2 (0AIZ), Definition 87.14.3 (0AMC), Lemma 87.14.6 (0GBA)). Prove
*formalCompletion.isLocallyNoetherian* (for `X` locally Noetherian the system is locally
Noetherian). Flatness of the adic completion of a Noetherian local ring is supplied by
Mathlib `AdicCompletion.flat_of_isNoetherian`; this is not a flatness assertion about the individual
closed-immersion reductions. Prove *formalCompletion_spec* (for `X = Spec A` and `I`
finitely generated, `X/V(I) ≅ Spf Â`; Lemma 87.14.6 (0GBA)). Define `CoherentFormalModule 𝔛` for an
adic thickening system: inverse systems `(F_n)` with `F_n` a finitely presented `O_{X_n}`-module and
isomorphisms `ι_n^* F_{n+1} ≅ F_n`. The general system and
`completionFunctor X I M` (`M ↦ (M/I^{n+1} M)_n`) require `M` finitely presented.
For **Noetherian `X`**, prove *coherentFormalModule_abelian*: the category on
`formalCompletion X I`, with compatible families of linear maps as morphisms, is
abelian (Stacks, Lemma 30.23.2). Prove *completionFunctor_exact* for coherent modules
on such `X`, exact in this abelian category by Artin–Rees
([Lemma 30.23.4, 0881](https://stacks.math.columbia.edu/tag/0881)). This does not assert
termwise exactness: multiplication by `t` on `k[[t]]` becomes zero modulo `t`.
Prove `coherentFormalModuleEquivSpec` for **Noetherian `A`** and an ideal `I`:
coherent formal modules on `Spf Â` are equivalent to finite `Â`-modules; the functors
are inverse limit of sections and reduction modulo `I^{n+1}`
([Lemma 30.23.1, 087W](https://stacks.math.columbia.edu/tag/087W)). For complete
Noetherian `A`, `coherentFormalModuleEquivSpec_effective` gives the compatible
reduction isomorphisms with a finite `A`-module. Finite modules in this regime are
finitely presented, as are all their reductions. General adic rings retain the
finitely presented carrier; they do not supply this finite-module equivalence.
Prove *completionFunctor_obj_sections* on Noetherian affine `X = Spec A` with
coherent `M`: inverse-limit sections are the `I`-adic completion of `Γ(X,M)`
(Stacks, §30.23, Lemma 30.23.1 (087W) and Equation (30.23.3.1) (0880)).

*Needs:* §4.7; Mathlib `IdealSheafData.subscheme`, `inclusion`, `AdicCompletion`,
`AdicCompletion.map_exact`, `AdicCompletion.flat_of_isNoetherian`, `SheafOfModules.IsFinitePresentation`,
`Scheme.Modules.pullback`.

**Checks.**
- *formalCompletion_affineLine_origin*: the reductions of the completion of `𝔸¹_k` at the origin
  are `Spec k[t]/(t^{n+1})`, those of `Spf k[[t]]`.
- *formalCompletion_self* (`I = ⊥` gives the constant system `X`), *formalCompletion_empty* (`I = ⊤`
  gives the empty system), *formalCompletion_ne_neighbourhood* (`k[[t]]` is not Artinian, so the
  completion is not an infinitesimal neighbourhood).
- `completion_structureSheaf_spec`: for a complete Noetherian `A`, `A → Â` is bijective.
- `completion_zero_ideal`: for `I = 0` the completion functor is the identity.
- `completion_not_full_affineLine`: `k[x] → k[[x]]` is not surjective, so multiplication by
  `1/(1 − x)` is not the completion of an endomorphism of `O_{𝔸¹}`: the completion functor is not
  full.
- `completion_torsion`: `ℤ/p^m` is `p`-adically complete.
- *formalCompletion_flat_test_dvr*: for `X = Spec R` of a DVR and `Z` the closed point, `R → R̂` is
  flat; if `R` is already complete it is an isomorphism.
- `coherentFormalModuleEquivSpec_zero_ideal_nonfp`: for `A = k[x_0,x_1,…]`,
  `I = 0` is finitely generated and `A` is `I`-adically complete. The cyclic module
  `M = A/(x_0,x_1,…)` is finite but not finitely presented; its associated sheaf
  cannot be level zero of a constant coherent formal module.
- `coherentFormalModuleEquivSpec_complete_noetherian`: for a complete Noetherian
  adic ring, every coherent formal module is the compatible reduction system of a
  finite module, as in `coherentFormalModuleEquivSpec_effective`.
- *completionFunctor_exact_t_reduction*: multiplication by `t` on `k[[t]]` is
  injective, but its reduction on `k[[t]]/(t)` is zero and not injective. Exactness
  in the coherent formal category therefore cannot mean exactness at every level.

*Lean:* `Formal.Scheme.formalCompletion` (the levels `V(I^{n+1})` and their inclusions as data,
the thickening conditions as proof obligations), `Formal.Scheme.formalCompletion.toScheme`,
`Formal.Scheme.CoherentFormalModule`, `Formal.Scheme.completionFunctor`.

### 4.9 The theorem on formal functions and Stein factorisation

Prove `theorem_on_formal_functions`: for `f : X → Spec A` proper with `A` Noetherian, `I ⊆ A` an
ideal and `F` coherent on `X`, `H^p(X, F)^∧ ≅ lim_n H^p(X, F/I^n F)` for every `p`, where the left
side is the `I`-adic completion of the finite `A`-module `H^p(X, F)`; the inverse system `H^p(X,
F/I^n F)` is Mittag-Leffler, and for `f` proper to a Noetherian scheme `Y`, `(R^p f_* F)^∧_y ≅ lim_n
H^p(X_n, F_n)` on the completion of the local ring at `y` (Stacks, Proposition 30.19.1 (02O5),
Lemma 30.19.3 (0897), Lemma 30.20.4 (02OB), Theorem 30.20.5 (02OC), Lemmas 30.20.6 (087U), 30.20.7
(02OD)). The shared destination is `TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`,
exporting `Scheme.Modules.Cohomology.formalFunctionsIso` for the displayed completion
isomorphism, `formalFunctions_mittagLeffler` for its inverse system, and
`formalFunctions_local` for the local-ring version. These are the general
formal-functions targets of this subsection, on the existing
`Scheme.Modules.Cohomology` and §4.8 completion carriers.

The theorem-level supplier direction is: JacobianChallenge's
`Cohomology/Proper.lean` supplies finiteness of coherent cohomology over a
Noetherian affine base; its `Cohomology/Pushforward.lean` supplies coherence of
higher direct images. Together with §4.8's module completion and Artin–Rees,
these feed `formalFunctionsIso` here. JacobianChallenge Layer C's subsequent
Grothendieck Picard construction consumes this specific API. StableReduction's
J-C contract consumes the same earlier pushforward, base-change, semicontinuity,
projection-formula and Leray inputs directly; it is not a prerequisite Picard
construction for formal functions. Prove
`stein_factorization`: a proper morphism `f : X → Y` of Noetherian schemes factors as `X → Spec_Y
(f_* O_X) → Y` with the first map proper with geometrically connected fibres and `f_* O = O`, the
second finite; Zariski's connectedness theorem: if `f_* O_X = O_Y` then the fibres of `f` are
geometrically connected, since then the Stein factorisation is `f` itself (Stacks, Theorem 37.53.4
(03H0)). *Needs:* §0.1,
§2.6, §4.8; JacobianChallenge Layers B–C (proper coherent-cohomology finiteness
and coherent higher direct images, before the Picard construction).

**Checks.**
- `formal_functions_test_affine`: for `X = Spec A` the theorem reads `M^∧ = lim M/I^n M`.
- `formal_functions_test_projective_line`: for `ℙ¹_A` and `F = O`, `H⁰ = A` and `A^∧ = lim A/I^n`.
- `stein_test_blowup`: for the blow-up of a regular surface at a closed point `x`, `f_* O = O` and
  the fibre over `x` is `ℙ¹_{κ(x)}`, connected.
- `stein_test_finite`: for a finite morphism the Stein factorisation is `X = Spec_Y f_* O_X → Y`.

### 4.10 Grothendieck's existence theorem and algebraization

Let `A` be a Noetherian adic ring with ideal `I` and `quotMap A n : Spec (A/I^{n+1}) → Spec A`.
Prove `grothendieck_existence`: for `f : X → Spec A` proper and `I` the ideal sheaf of
`f⁻¹(V(I))`, every coherent formal module on `X/V(I)` (§4.8) is the completion of a coherent `O_X`-module,
with isomorphisms commuting with all transitions. The named target
`grothendieck_existence_fullyFaithful` states that compatible morphisms of such completions
come from unique morphisms of coherent modules (Stacks, Section 30.24
(087V), Lemmas 30.24.1 (0883), 30.24.3 (0885), Section 30.25 (0886), Lemmas 30.25.2–30.25.3 (088A,
088B), Proposition 30.25.4 (088C), Theorem 30.27.1 (088E), Remark 30.27.2 (088F)). Prove
`algebraize_hom`: for `X` proper and `Y` separated of finite type over
`Spec A`, a **morphism of adic thickening systems** `g : (X_n) → (Y_n)` over `(Spec A/I^{n+1})_n`,
that is a family `g_n : X_n → Y_n` over `A/I^{n+1}` with `g_n = g_{n+1} ×_{Y_{n+1}} Y_n` on
`X_n = X_{n+1} ×_{Spec A/I^{n+2}} Spec A/I^{n+1}` (the transition squares commute), comes from a
unique morphism `G : X → Y` over `A` with `G_n = g_n` for all `n` (Stacks, Lemmas 30.28.1 (0899),
30.28.2 (09ZT), 30.28.3 (0A42)). The compatibility with transitions is essential: for `A = k[[t]]`,
`X = Spec A` and `Y = 𝔸¹_A`, the maps `g_0 : Spec k → 𝔸¹_k` at `0` and `g_1 : Spec k[t]/(t²) →
𝔸¹_{k[t]/(t²)}` at `1` do not form a system and come from no morphism (`algebraize_hom_test_incompatible`
below). The scope here is coherent modules and compatible morphisms on given proper
schemes. Algebraization of a polarized adic system, the corresponding category equivalence,
and effective formal deformations of curves are outside this subsection. Theorem 30.28.4
(089A) concerns a compatible ample system of invertible sheaves, a hypothesis not supplied
by properness of the initial fibre alone. *Needs:* §4.7, §4.8, §4.9; Mathlib `IsProper`,
`IsSeparated`, `LocallyOfFiniteType`.

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

*Lean:* `Formal.grothendieck_existence` (essential surjectivity, with the completion along the
closed fibre), `Formal.quotMap`, `Formal.quotIncl`, `Formal.levelIncl`, `Formal.algebraize_hom`,
with `algebraize_hom_test_incompatible` as an `example`. `grothendieck_existence_fullyFaithful` is
specified in this README only.

### 4.11 Modifications and strict transforms

Define `IsModification f` for `f : S' → S`: `f` is proper and there is a dense open `U ⊆ S` with
`f⁻¹(U)` dense in `S'` and `f` an isomorphism over `U` (Stacks, Definition 29.52.11 (0AAZ)); source
and target are assumed integral where used, and *IsModification.toBirational* gives Mathlib's
`Scheme.Birational`. API: *IsModification.comp*, *IsModification.centre* (the closed set over which
`f` is not an isomorphism), *IsModification.isIso_of_isFinite* (a finite modification of a normal
integral scheme is an isomorphism; Stacks, Lemma 29.55.8 (0AB1)), *IsModification.isAlteration*
(§4.16), *IsModification.functionField_equiv* (a modification of integral schemes induces an
isomorphism of function fields). Define the strict transform
with its centre explicit: for `f : X → S`, a modification `φ : S' → S` and a **chosen dense open**
`U ⊆ S` over which `φ` is an isomorphism (`IsModification.Witness φ U`), put `Y = X ×_S S'`
and `V = X ×_S φ⁻¹(U)`. The constructors and their API require that the open immersion
`j : V → Y` is quasi-compact. This holds if the complement of `U` is defined by a finite-type
quasi-coherent ideal on `S`, if `Y` is locally Noetherian, or in the blow-up case below.
Then `strictTransform f φ U : Y.IdealSheafData` is the ideal sheaf of the scheme-theoretic
closure of `V` in `Y`, and `strictTransformModule f φ U M`, for quasi-coherent `M` on `X`,
is the quotient of `N = pr_X^* M` by `ker(N → j_* j^* N)`, the sections vanishing on `V`.
Here `j_*` is scheme-site direct image. Prove **strictTransform_supportComparison**: for
quasi-compact `j`, this supported subsheaf and its quotient are quasi-coherent, and for `N = O_Y`
the kernel cuts out the scheme-theoretic closure, whose support is the topological closure of `V`
(Stacks, Lemmas 26.24.1 (01LC), 29.6.3 (01R8)). If a finite-type quasi-coherent ideal `J` on `Y`
defines `Y ∖ V`, identify the kernel on every affine open with the elements annihilated by some
power of `J`. For `J = (a_1,…,a_r)`, vanishing on each `D(a_i)` gives an annihilating power of
each generator, and finite generation gives one power of `J` annihilating the element
(Stacks, Lemma 47.9.1 (0A6R), degree zero). This is a degree-zero comparison; §2.7's derived
comparison retains its Noetherian hypotheses. API under the same quasi-compactness hypotheses: `strictTransform_eq_closure`
(the support is the closure of the preimage of `U`), `strictTransform_independent_of_witness` (for
`U ⊆ U'` both witnesses with `f⁻¹(U)` scheme-theoretically dense in `f⁻¹(U')`, the strict transforms
agree; in particular for `X` reduced and `U`, `U'` both dense in `X` the choice is immaterial, while
for `X` with embedded components it is not: the identity modification of `𝔸¹` with `X = {0}` gives
`X` for `U = 𝔸¹` and `∅` for `U = 𝔾_m`), `strictTransform_unique_of_flat` (for integral `S` and `S'`, a closed subscheme `Z ⊆ X
×_S S'` that is flat over `S'` and agrees with `X ×_S S'` **as closed subschemes** over `φ⁻¹(U)`
(`Z ×_{S'} φ⁻¹(U) = X ×_S φ⁻¹(U)` scheme-theoretically, not merely on supports) is the strict
transform; support agreement alone fails for `X = Spec k[ε]/(ε²)` against its reduced point),
`strictTransform_comp` (transitivity along composites of modifications, with quasi-compact
retained-open inclusions at each stage), `strictTransform_self`
(for integral `S` and `S'`, `strictTransform (𝟙 S) φ U = ⊥`), `strictTransform_eq_blowup` (for `φ` the blow-up of `S` along a
closed subscheme `C` with `U = S ∖ C` a modification witness and exceptional ideal
`E = C·O_{S'}`, the exceptional effective Cartier divisor makes `E` invertible and its pullback
to `Y` finite type, so `j` is quasi-compact and the comparison applies. The strict transform of
`f` is StableReduction Layer 4's strict transform along the blow-up, and `strictTransformModule`
is the quotient of `pr^* M` by its pulled-back `E`-power torsion (Stacks, Definition 31.34.1
(080D), Lemma 31.34.2 (080E))),
`strictTransform_closedImmersion` (for `X → S` a closed immersion, the strict transform is the
closure of `X ∩ U` in `S'`, the blow-up of `X` along `X ∩ C` in the blow-up case). *Needs:* §0.9,
§2.7 (degree-zero supported sections);
Mathlib `IsProper`, `IsIntegral`, `Scheme.Birational`, `IdealSheafData`, scheme-theoretic closure;
StableReduction Layer 4 (blow-ups and their strict transforms).

**Checks.**
- *isModification_blowup_origin*: the blow-up of `𝔸²_k` at the origin (StableReduction Layer 4) is
  a modification with centre the origin.
- *isModification_id*, *isModification_cusp_normalization* (`𝔸¹ → V(y² − x³)` is a finite
  modification), `not_isModification_frobenius` (Frobenius of `𝔸¹_{𝔽_p}` is proper and not
  birational), `not_isModification_openImmersion` (`𝔾_m → 𝔸¹` is birational and not proper),
  *isModification_isAlteration*.
- `strictTransform_line`: for the blow-up of `𝔸²` at the origin and `X` a line through the origin,
  the strict transform is the line's proper transform meeting the exceptional divisor in one
  point.
- `strictTransform_centre_empty`: for the blow-up along `C` and `X` disjoint from `C`, the strict
  transform is `X ×_S S' = X`.
- `strictTransform_witness_matters`: the identity of `𝔸¹` with `X = Spec k → 𝔸¹` the origin: the
  strict transform is `X` for the witness `U = 𝔸¹` and `∅` for `U = 𝔾_m`.
- `strictTransform_unique_needs_scheme_structure`: `X = Spec k[ε]/(ε²) → Spec k`, `φ = 𝟙`,
  `U = Spec k`: both `X` and `X_red` are flat over `S'` with the same support over `U`, and only `X`
  agrees scheme-theoretically; the strict transform is `X`.
- `strictTransformModule_torsion`: for `M = k[t]/(t)` on `𝔸¹` and the identity modification with
  witness `𝔾_m`, the strict transform of `M` is `0` (it is `t`-power torsion).
- `strictTransform_supportComparison_finite_generators`: on `Spec k[x,y]` with `J = (x,y)`
  and `N = k[x,y]/(x²,y³)`, restriction to `D(x) ∪ D(y)` is zero and `J⁴ N = 0`.
- `strictTransform_supportComparison_empty_complement`: `J = (1)` gives the full open,
  zero supported kernel and unchanged module; `J = (0)` gives the empty open and the entire kernel.
- `strictTransformModule_nonfinite_ideal`: let `A = k[x_0,x_1,…]`, `I = (x_0,x_1,…)`,
  `B = A/(x_j^{j+2} : j ≥ 0)`, `S = Spec A`, `φ = 𝟙_S`, `f = 𝟙_S` and `U = S ∖ V(I)`.
  The integral base and modification witness conditions hold, but `U → S` is not quasi-compact.
  The geometric supported subsheaf of `B~` is all of `B~`, so the support-defined sheaf quotient
  is zero. Its `I`-power torsion is zero: for any nonzero class `b` and any `n`, a fresh variable
  with `j+2 > n` gives `x_j^n b ≠ 0`. Thus the power-torsion quotient is `B~`, and this witness
  lies outside the constructors' quasi-compact regime.

*Lean:* `Formal.IsModification`, `Formal.strictTransform_supportComparison_affine` (for a finitely
generated ideal, elementwise vanishing on its principal opens is equivalent to ideal-power
annihilation). The sheaf constructors and their remaining API are specified in this README only.

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
(0201), Lemma 32.12.1 (0202)). *Needs:* `generic_flatness`, `flattening_by_blowup` and
`modification_domination`: §0.9, §4.11; StableReduction Layers 2, 4. `chow_lemma`: §0.9 and §4.11
only; it does not depend on StableReduction, so that JacobianChallenge Layer C's proper coherence
(which consumes `chow_lemma`) and StableReduction Layer 2 (which consumes Layer C) form no cycle.

**Checks.**
- `generic_flatness_test_blowup`: the blow-up of `𝔸²` at the origin is flat over `𝔸² ∖ {0}`.
- `flattening_test_blowup_plane`: for `X = Bl_0 𝔸² → 𝔸²`, the flattening blow-up is the blow-up at
  the origin and the strict transform is an isomorphism.
- `chow_test_proper_nonprojective`: Hironaka's proper non-projective threefold admits a projective
  modification that is projective over `k`.

*Lean:* `Formal.generic_flatness` (for the morphism, with `f` quasi-compact and locally of finite
type).

### 4.13 Regular schemes, resolution of curves, Serre's criterion, Bertini

Define `IsRegular X`: `X` is locally Noetherian and every stalk is a regular local ring (Mathlib's
`IsRegularLocalRing`) (de Jong 1996, 2.4, 2.10, pp. 55–56). API: *isRegular_spec_iff* (Mathlib's
`IsRegularRing`), *IsRegular.of_isOpenImmersion*, *IsRegular.of_smooth* (smooth over a regular base),
*IsRegular.isNormal*, `regularLocus X`, *regularLocus_eq_smoothLocus* (over a perfect field),
*IsRegular.of_etale*, *IsRegular.isCohenMacaulay* (§0.18); the stalk statements for smooth schemes
and for blow-ups of nodes are Tau Ceti's `isRegularRing_iff_isRegularLocalRing_stalk_Spec`,
`isRegularLocalRing_stalk_of_smooth` and `NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`, cited.
AbundanceStatement Layer 0 / item 2 (by RoktimMascharak) states the normal-variety special case
of *regularLocus_eq_smoothLocus*. This subsection owns the general finite-type perfect-field
statement; *regularLocus_abundanceSpecialization* identifies its restriction to the supplier's
normal varieties with the same open smooth locus.
Prove `resolution_of_curves`: for `Y` integral Noetherian of dimension `≤ 1`, let `Y^ν → Y` be the
normalisation of `Y` in its function field, that is Mathlib's `Scheme.Hom.normalization` of
`Y.fromSpecStalk (genericPoint Y) : Spec K(Y) → Y`, which over an affine open `Spec A` is `Spec` of
the integral closure of `A` in `K(Y)` (normalising along `𝟙 Y` returns `Y` itself). If `Y^ν → Y`
is finite, then `Y^ν` is a regular scheme and `Y^ν → Y` is a finite modification: `Y^ν` is
Noetherian and normal of dimension `≤ 1` and birational to `Y` (Stacks, Lemma 33.41.1 (0C45)), so
each of its local rings is a field or a Noetherian normal local domain of dimension one, that is a
discrete valuation ring and hence regular (Algebra, Lemma 10.119.7 (00PD)). The finiteness of
`Y^ν → Y` is a hypothesis of the theorem, carrying the Japanese/Nagata input: it holds when `Y` is
Nagata (§0.20; Lemma 29.55.11 (035S)), and for one-dimensional `Y` it is equivalent to the existence
of a resolution in the sense of Definition 54.14.1 (0BGK) (Lemma 54.15.1 (0BI4)). Over a field the
same conclusions are Lemma 33.27.1 (0BXR) for the normalisation and Lemma 33.43.8 (0B8Y) for
regular = normal at closed points
of a curve. AbundanceStatement §4A / item 2 (by RoktimMascharak) states the projective-curve
special case. Here *curveResolution_abundanceSpecialization* identifies that finite normalization
with `resolution_of_curves`; the supplier provides projectivity and characteristic-zero
smoothness, while the general finite-normalization regularity theorem is owned here.
Prove `serre_normality_criterion`: a Noetherian ring is normal iff it
satisfies `(R_1)` and `(S_2)` (§0.17; the `(R_1)` half `serre_normality_R₁` and the `(S_2)` half
`serre_normality_S₂`) (Stacks, Lemma 10.157.4 (031S)). AbundanceStatement Layer 0 / items 1–2
(by RoktimMascharak) state the normal-variety special cases of codimension-one regularity and
DVR stalks. This subsection owns the general Noetherian-ring criterion;
*serreNormality_abundanceSpecialization* recovers those codimension-one regularity and DVR
consequences for normal varieties, retaining the supplier's field and finite-type scope.
Prove `bertini_smoothness`: for `X ⊆ ℙ^n_k`
smooth over an infinite field `k`, a general hyperplane section `X ∩ H` is smooth, and the same for
a general member of a generating linear system whose associated morphism to
projective space is an immersion (in particular a very ample system) (Stacks, Section 33.47 (0FD4), Lemmas 33.47.1
(0FD5), 33.47.3 (0FD6)). *Needs:* §0.17, §0.20, §0.21, §4.11; Mathlib `IsRegularLocalRing`,
`IsRegularRing`, `Scheme.Hom.normalization`, `smoothLocus`; Tau Ceti `NodeAlgebra`.

**Checks.**
- `bertini_frobenius_pencil_rejected`: over an algebraically closed field of
  characteristic `p`, `⟨X₀^p,X₁^p⟩` generates `O(p)` on `ℙ¹`, but every member
  is a nonreduced divisor of length `p`. The associated Frobenius morphism is
  not an immersion, so it is excluded from `bertini_smoothness`.
- *isRegular_affineSpace*, *isRegular_specInt*, *isRegular_empty*.
- `not_isRegular_node` (`k[x, y]/(xy)` at the origin), `not_isRegular_dualNumbers`.
- `resolution_test_cusp`: the cusp `Y = Spec k[t², t³]` is integral, Noetherian, of dimension one
  and not regular; its normalisation in its function field is `Spec k[t] → Y`, which is finite,
  regular and a modification.
- `serre_test_cone`: `k[x, y, z]/(xy − z²)` is normal: `(R_1)` and `(S_2)` hold; `k[x, y]/(x², xy)`
  fails `(S_1)`.
- `bertini_test_quadric`: a general hyperplane section of a smooth quadric surface is a smooth
  conic.

*Lean:* `Formal.IsRegular`, `Formal.resolution_of_curves` (the normalisation of `Y` along
`Y.fromSpecStalk (genericPoint Y)`, with its finiteness over `Y` as an instance hypothesis), and
`resolution_test_cusp` as an `example`.

### 4.14 Hilbert and Quot schemes

Let `S` be Noetherian throughout this subsection, including the Hom/Isom assertions and Checks.
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
finite), `Mbar.forget` (for `2g − 2 + n > 0`, the morphism `M̄_{g,n+1} → M̄_{g,n}` forgetting the
last marking and stabilising, compatible with StableReduction Layer 9; its identification
with the universal curve supplies the added-marking induction, Knudsen II, Corollary 2.6
and Theorem 2.7, p. 179). Prove `isom_stable_curves`: for stable
pointed families `C, C'` over `S`, `Isom_S(C, C')` is a finite unramified `S`-scheme (Deligne–Mumford
1969, §1, Theorem (1.11), pp. 84–85).

**Stable reduction and stack properness.** For every `2g−2+n>0`, first prove
`Mbar.algebraicFiniteTypeDM`: the polarized Hilbert charts of §4.14, using a uniformly very
ample power of `ω_{C/S}(Σ σ_i)` and its fixed Hilbert polynomial, give a smooth atlas and
finite type over `Spec ℤ`. Effective descent and `isom_stable_curves` give the representable
unramified diagonal and the DM property. The same finite Isom schemes are proper, hence
give `IsSeparatedStack` for the structural map. Their DVR extension of a specified generic
isomorphism uses StableReduction Layers 8–9's uniqueness over a fixed DVR.
These constructions use families, Hilbert charts and Isom schemes, with no proper moduli
stack as an input (Deligne–Mumford 1969, §5, Proposition (5.1), Theorem (5.2),
pp. 104–105; Knudsen II, Theorem 2.7, p. 179).

Prove `Mbar.dvrLifting`: any stable pointed generic curve `C/K`, including a nodal one,
gives §1.20's `StackDVRLiftingAfterExtension` for `M̄_{g,n} → Spec ℤ`. Consume
StableReduction end goals 2–3 and 6, Layers 8–9: its chosen finite separable extension of
fraction fields and dominating DVR give a stable family `C'/R'` and the specified pointed
isomorphism `α : C'_{K'} ≅ C_{K'}`. Use the structural map to `Spec ℤ` for `β` and retain
the compatibility with the original `γ`. The supplier's unique extension of generic
isomorphisms identifies any two stable lifts over a fixed DVR while preserving `α`.
For smooth generic fibres the supplier is pointed stable reduction; for nodal generic
fibres it is the componentwise normalization and clutching theorem of Layer 9.

Prove `Mbar.properOfStableReduction`: the algebraicity, finite-type and separatedness
inputs above, together with `Mbar.dvrLifting`, imply
`IsProperStack (M̄_{g,n} → Spec ℤ)` by `IsProperStack.ofDVRLifting`, since `Spec ℤ` is
locally Noetherian. This uses all stable generic fibres; no dense-open test hypothesis is
needed (Stacks, Lemma 106.11.3 (0CQM), applied with the identity; Theorem 109.25.3 (0E9C)
for the unpointed comparison). The stable range includes `(0,3)` and `(1,1)` and all
added-marking steps whose target satisfies `2g−2+n>0`, as in `Mbar.forget`.
Prove `Mbar_algebraic_proper_DM`: assemble these inputs to obtain a proper DM stack with
`M_{g,n}` open dense. Openness and density come from smoothness of the family locus and
§4.6's node-smoothing deformations on the Hilbert charts (Deligne–Mumford 1969, §1,
pp. 76–78, Proposition (1.5), p. 81; §5, Theorem (5.2), pp. 104–105; Knudsen II,
Theorem 2.7, p. 179). Apply this properness before constructing the level covers below.
*Needs:* §1.20's stack topology and DVR criterion; §4.6, §4.14;
StableReduction Layers 2–3, 8–9 and its valuative interface.

**Checks.**
- `Mbar_dvr_generic_identification`: for a stable pointed family `C/R` over a DVR and
  a chosen pointed automorphism `e` of `C_K`, use `C` itself as the lift with `α=e`.
  Uniqueness compares another lift with this specified identification; it does not identify
  the result with the lift having `α=id` by the identity map when `e≠id`.
- `Mbar_dvr_nodal_generic`: for `g=1,n=1`, the rational nodal curve obtained by identifying
  `0` and `∞` on `ℙ¹_K`, marked at `1`, is stable and not smooth. Its constant nodal
  model over the DVR, with that generic identification, is a test of `Mbar.dvrLifting`.
- `Mbar_proper_stable_bases`: the criterion applies to `M̄_{0,3}=Spec ℤ` and to
  `M̄_{1,1}` using pointed stable reduction, even though the unpointed genus-one and
  two-pointed genus-zero cases have no stable target. For `(g,n)=(0,4)` and `(1,2)`,
  the added-marking maps have stable targets and preserve these properness inputs.

Prove `Mbar_smooth`: `M̄_{g,n} →
Spec ℤ` is smooth of relative dimension `3g − 3 + n`, the boundary is a normal crossings divisor,
and over an algebraically closed residue field the versal deformation has §4.6's labelled
node-smoothing coordinates; over general fields this description holds geometrically with
descent data (Deligne–Mumford 1969, Proposition (1.5), p. 81, Theorem (1.6), Corollaries (1.7)–(1.9), p. 83, Theorem (5.2), p.
104). Prove `level_structure_cover` by the following constructions on the existing stack.
For the level convention, use Deligne's full ordered bases
`J[m] ≅ (ℤ/mℤ)^{2g}` over the smooth locus with `m` invertible. The transported
Weil pairing is retained; a primitive `m`th root of unity is not fixed over `ℤ`.
The symplectic convention is recovered after adjoining such a root by selecting the
bases with the standard alternating pairing (`level_structure_cover_pairing`). Both
conventions give finite étale surjective covers of the smooth locus over the indicated
base, and the normalized symplectic compactification is projective over the cyclotomic
base after inverting `m` (Deligne §3.3, p. 137; the Weil pairing and basis convention of
ModularCurves §3D).

Prove `level_structure_cover_normalization`: normalize the **whole** `M̄_{g,n}/ℤ`
in that full-basis cover of `M_{g,n}[1/m]`; denote this particular normalization by
`N_{g,n}(m)` and its map by `q_m`. On a normal excellent étale atlas `S`, its algebra
is the integral closure of `O_S` in the finite extension algebras on the dense open.
Glue with Mathlib's relative normalization and its compatibility with étale base
change. Prove that `q_m` is representable, finite and surjective and restricts to the
original level cover on `M_{g,n}[1/m]`. Finiteness uses the Nagata/excellence results
of §0.20–§0.21; surjectivity uses lying over and density. The theorem records
this normalization map and the restriction isomorphism on scheme atlases (Deligne
§3.4, pp. 137–138). This construction includes the fibres at primes dividing `m`.

Prove `level_structure_cover_representable`: for `m≥3`, `N_{g,n}(m)[1/m]` is an
algebraic space. For an algebraic space over all of `Spec ℤ` choose `m` divisible by coprime
`a,b≥3`, for example `m=15`, `a=3`, `b=5`. Forgetting part of the basis extends to
maps `N_{g,n}(m)[1/a] → N_{g,n}(a)[1/a]` and similarly for `b`; the induced maps
on stabilizers are injective. The target stabilizers are trivial, so the source
stabilizers are trivial on both opens. Since `D(a) ∪ D(b)=Spec ℤ`, this proves
representability in every characteristic, including primes dividing `m` (Deligne
Proposition 3.5 and its automorphism lemma, pp. 138–140; Corollary 3.6, p. 140).

**Nef pluricanonical direct images — `stableCurveDirectImage_nef`.**
For a stable family `f:C→B` of genus `g≥2` over a smooth projective curve over an
algebraically closed field of any characteristic, prove `f_*ω_{C/B}^r` nef for `r≥2`.
Here a vector bundle is nef if the tautological line on its bundle of one-dimensional
quotients is nef (`ℙ(V^∨)` in §5's line convention), equivalently every quotient line
bundle after finite curve pullback has nonnegative degree.
Build that equivalence, stability under quotients, extensions, symmetric powers, finite
pullback and descent along finite surjective curve maps. Prove semipositivity first for
smooth total space, then resolve surface singularities and use dualizing-sheaf inclusions;
normalize the total space and split the double curves after finite curve base change to
handle arbitrary stable families, retaining the marked divisors on the normalization.
Source: Cheng–Lian–Murayama, *Projectivity of the Moduli of Curves*, §§1.3–1.4 and
§1.6, Propositions 1.36–1.42 and Theorem 1.43, pp. 29–38
([published text](https://par.nsf.gov/servlets/purl/10585475)).
*Needs:* StableReduction's dualizing sheaves, stable families and surface models;
§3.3's degree and §2.6's base change. The nefness and semipositivity inputs just specified
are part of this target, including inseparable finite base change.

**Checks.**
- A constant family gives a trivial, hence nef, direct image of rank `(2r−1)(g−1)`.
- The theorem includes characteristic two and nodal geometric fibres; smoothness of
  the total space is not a hypothesis of its final statement.
- An arbitrary vector bundle need not be nef: `O(−1)` on `ℙ¹` has a negative-degree
  quotient. Finite curve pullback preserves this negative degree.

**Ampleness for determinant quotients — `determinantQuotient_ample`.**
For a proper algebraic space `B` over an algebraically closed field `k`, a nef finite
locally free `V` of constant rank `n`, an integer `d>0`, and a surjection `Sym^d V→Q`
with `Q` finite locally free of constant rank `q`, construct the classifying map
`B→[Gr_q(Sym^d k^n)/PGL_n]` from the frame bundle. If this map has finite fibres
on geometric points, prove `det Q` ample.
Build the requisite positivity argument: on a normal projective modification of an
integral subspace, resolve the rational Grassmannian map on the projective completion
of the frame bundle by a blow-up; finite generic fibres give bigness of the determinant.
Together with nefness this gives positive top self-intersection on every integral
subspace. Prove `spaceNakaiMoishezon`: on a proper algebraic space over `k`, an
invertible `L` is ample iff its top self-intersection on every positive-dimensional
integral closed subspace is positive. Construct `spaceChowModification`:
a proper integral finite-type algebraic space over a field admits a proper birational
map from a projective integral scheme (Stacks, Lemma 088U); normalizing that scheme
preserves projectivity. Use these modifications and descent in the criterion. These
positivity and space-comparison prerequisites are targets here on the existing line bundles;
the surface criterion of §5.10 has a narrower domain.
Source: Cheng–Lian–Murayama, Proposition 1.10, Lemmas 1.29–1.32 and Proposition 1.33,
pp. 8–9, 23–29. *Needs:* §§1.17,1.19–1.22,4.11–4.12; projective bundles,
Grassmannians and finite-type images; StableReduction's blow-ups.

**Checks.**
- `spaceNakaiMoishezon` gives ampleness of `O(1)` on `ℙ^r`, with positive top
  self-intersection on every positive-dimensional integral subvariety, equal to its
  projective degree. This is one on linear subspaces. On a line and a smooth plane
  conic the degrees are respectively one and two: the conic parametrization pulls
  `O_{ℙ²}(1)` back to `O_{ℙ¹}(2)`
  ([Stacks, Lemma 33.45.9 and Definition 33.45.10](https://stacks.math.columbia.edu/tag/0BEL)).
- On `ℙ¹`, `O` has degree zero and `O(−1)` has degree −1; neither is ample.
- On a proper zero-dimensional space the numerical condition is empty and every
  invertible sheaf is ample, as the space is finite over `k`.
- `spaceChowModification` allows the identity on an integral projective scheme.
- A proper nonprojective integral variety needs a nonidentity modification;
  an isomorphism from a projective scheme would make the variety projective.
- For `Spec k`, the projective modification and its normalization can both be identity;
  normalization of a normal projective integral scheme is likewise identity.
- On a point the finite-fibre condition holds and every determinant is ample.
- Under finite surjective curve base change, nefness and the finite-fibre condition
  persist and the determinant remains ample; its degree is multiplied by the map's degree.
- For `V=O_B^n` and a constant quotient on a positive-dimensional proper `B`,
  the determinant is trivial and the classifying map has a positive-dimensional fibre;
  omitting the finite-fibre hypothesis would give a false conclusion.

**Ample line on the integral level space — `level_structure_cover_ample`.**
For `g≥2,n=0` and the composite levels above, construct on `N=N_{g,0}(m)` the line
`λ_r=det(f_*ω_{C/N}^r)`, `r≥2`, for its universal stable curve. Prove that some
`λ_{3d}` is ample over `Spec ℤ`. On each geometric fibre, choose `d` sufficiently
large that `Sym^d(f_*ω^3)→f_*ω^{3d}` is surjective and its kernel determines the
tricanonically embedded fibre. Construct this classifying map and prove finite fibres:
its projective-equivalence classes determine the curve, and the level map is finite.
The previous two targets then give ampleness on every geometric fibre for all large `d`.
Supply the integral uniformity step, using base change for these locally free direct
images, openness of relative ampleness for a proper finitely presented morphism, and
quasi-compactness of `Spec ℤ`, to obtain a single ample determinant line on `N`.
This applies the family argument of Cheng–Lian–Murayama, Lemma 1.44 and the integral
argument of Theorem 1.45, pp. 38–41, directly to the proper algebraic space `N`.
It does not require a GIT presentation or an ample line on `N` as an input.
*Needs:* `stableCurveDirectImage_nef`, `determinantQuotient_ample`; §§2.6,4.14;
`level_structure_cover_normalization`, `level_structure_cover_representable` and
properness of `Mbar`. The uniform tricanonical equations and integral ampleness argument
are part of this target.

**Checks.**
- For `m=15`, the ample line restricts to an ample line in characteristic three,
  including points outside the prime-to-level smooth locus.
- Its characteristic-five restriction is also ample, and both are restrictions of
  the same integral determinant line; choosing unrelated fibrewise lines is insufficient.
- For a constant stable curve over a positive-dimensional proper base the determinant
  is trivial and cannot be ample: the finite-fibre step fails for that family.

Prove `level_structure_cover_projective`: for these composite levels the normalized
level space itself is projective over `ℤ`, and is therefore a scheme. For `g≥2,n=0`
use `level_structure_cover_ample` and properness, which follows from the finite map
to the proper stack. An ample invertible sheaf on this proper algebraic space gives
a projective scheme. Deligne §3.7, p. 140, supplies the statement reference. The exported finite
projective cover is `q_m : N_{g,n}(m) → M̄_{g,n}`, with this projectivity theorem for
its source. For an arbitrary single `m≥3`, also prove that
`N_{g,n}(m)[1/m]` is a projective scheme over `ℤ[1/m]`, as follows. Put `m' = 15m`, a level
divisible by `m` and by the coprime integers `3` and `5`, and let
`Γ = ker(GL_{2g}(ℤ/m'ℤ) → GL_{2g}(ℤ/mℤ))`. Changing the basis by `Γ` acts on the level-`m'` cover
of `M_{g,n}[1/m']`, and by functoriality of relative normalization on `N_{g,n}(m')` over
`M̄_{g,n}`. Prove
`level_structure_cover_quotient`: the forgetful map `N_{g,n}(m')[1/m] → N_{g,n}(m)[1/m]`, given
by the universal property of relative normalization (Stacks, Lemma 29.54.4 (035I)), is
`Γ`-invariant and induces an isomorphism over `M̄_{g,n}[1/m]` from the quotient
`N_{g,n}(m')[1/m]/Γ` of §1.17's `finiteGroupQuotient_projective`. Over `M_{g,n}[1/m']` the
forgetful map of level covers is a `Γ`-torsor, since `Γ` acts simply transitively on the full
bases of `J[m']` lifting a given basis of `J[m]`, so the induced map from the quotient, finite
because the forgetful map is, is an isomorphism over that open. The quotient is reduced with that
open dense in it, and `N_{g,n}(m)[1/m]` is normal, so the map is an isomorphism. Then apply
`finiteGroupQuotient_projective` over the Noetherian base `Spec ℤ[1/m]` to the projective
`N_{g,n}(m')[1/m]`: for an ample `L` there, a power of `⊗_{γ ∈ Γ} γ^* L` descends to an ample
invertible sheaf on `N_{g,n}(m)[1/m]` compatibly with the linearization, and
`N_{g,n}(m)[1/m]` is projective over `ℤ[1/m]`. The action of `Γ` is not free in general and `|Γ|`
need not be invertible on `ℤ[1/m]`; neither is assumed. This retains the single-level
projectivity statement as well as the integral composite-level cover.

Prove `level_structure_cover_pointed` to extend these conclusions to every
`2g−2+n>0`. Start at `(g,0)` for `g≥2`, at `(1,1)`, and at `(0,3)`. The genus-one
case uses pointed stable genus-one curves, as in Deligne §2.2, p. 135; full level
kills the automorphisms on the prime-to-level opens by the same torsion argument.
Its normalized cover is finite over the compactified `j`-line and hence projective;
prove this finite-map comparison using ModularCurves §9D's coarse-moduli quotient.
At `(0,3)` the Jacobian is trivial and the normalization is `Spec ℤ`.
For each extra marking, apply `Mbar.forget` with target bound `2g−2+n>0`, including
`(g,n)=(0,3)` and `(1,1)`. Its projective universal stable curve
`M̄_{g,n+1} → M̄_{g,n}` comes from stabilization and the relatively ample log-dualizing
bundle (StableReduction Layers 2, 3, 9). Pull back the normalized finite cover and
prove that its normal total space is the normalization for the added marking: the
finite maps agree on the dense smooth distinct-marking locus, and normalization
identifies them. Prove normality using the nodal charts and the dense smooth generic
fibre. Projectivity then follows from that of the universal curve and the previous
level space. This also gives the genus-zero induction without adding level data
(Knudsen 1983, II, Corollary 2.6 and Theorem 2.7, p. 179). These are
comparisons on `Mbar` and its existing families, not another moduli carrier.

Prove `stable_extension_after_alteration`: for `Y` integral Noetherian, `U ⊆ Y` dense
open and a stable pointed family over `U`, there is an alteration `ψ : Y' → Y`
(§4.16) and a stable pointed family over `Y'` restricting to its pullback over
`ψ⁻¹(U)`. Use the **finite surjective normalized map** `q_15` above. Pull it back
along the classifying map on `U`; its finite surjective source includes the specified
isomorphism of pointed families. Its map to `U ×_ℤ N_{g,n}(15)` is finite. Take the
closure of its image in `Y ×_ℤ N_{g,n}(15)`, and prove
`stable_extension_finite_isom_closure`: extend that finite cover over the closure,
retaining its restriction over `U`. This is the finite Isom-cover extension in the
proof of Deligne Lemme 1.6, p. 133; it does not assume that a generic isomorphism
extends on an arbitrary nonnormal base. A reduced integral component dominating `Y`
is proper over `Y` by projectivity of `N_{g,n}(15)` and generically finite because
the original cover was finite over `U`. Pulling back the universal family gives the
required family and the retained Isom-cover gives its identification over all of
`ψ⁻¹(U)` (de Jong 1996, §4.17, pp. 71–72; §5.13, pp. 80–81;
Deligne 1985, Lemme 1.6, pp. 132–133).
The proper closure map is the alteration; no finiteness claim is made for it.
*Needs:* §0.20–§0.21, §1.17, §1.18–§1.20, §4.6, §4.16;
`level_structure_cover_ample` for projectivity; StableReduction Layers 2–3, 9;
ModularCurves §§3D, 9D; Mathlib `IsStack`, `Functor.IsFibered`,
`Scheme.Hom.normalization`, `Scheme.Hom.normalizationPullback`.

**Checks.**
- `Mbar.forget_zero_four`: `M̄_{0,4} → M̄_{0,3}` is in range since
  `2·0−2+3=1>0`.
- `Mbar.forget_one_two`: `M̄_{1,2} → M̄_{1,1}` is in range since
  `2·1−2+1=1>0`.
- `Mbar.forget_zero_three_excluded`: `M̄_{0,3} → M̄_{0,2}` has target expression
  `2·0−2+2=0`; it is excluded from the stable-target assertion despite its stable source.
- `level_structure_cover_normalization_characteristic_three`: with `m=15`, the
  integral normalization has points in characteristic three; `5` is invertible
  there, so the level-five map proves trivial stabilizers. On an excellent normal
  integral atlas, normalize its finite étale surjective level cover on the dense
  open. The normalized map is finite and its fibre at a characteristic-three point
  is nonempty. The Check records that assertion together with invertibility
  of `5` in its residue field.
- `level_structure_cover_normalization_characteristic_five`: the same normalization
  covers characteristic five; use the level-three map, since `3` is invertible there.
  The Check tests its nonempty fibre and finite map at that characteristic.
- `level_structure_cover_normalization_zero_three`: for `(g,n)=(0,3)` the basis
  data is unique and the normalized map is the identity on `Spec ℤ`, covering
  characteristics three and five. On its arithmetic chart this is the normalization
  of `Spec ℤ` in `Spec ℤ[1/15]`; the latter open alone has neither of those fibres.
- `level_structure_cover_prime_opens`: `D(3) ∪ D(5)=Spec ℤ`; the equality is false
  for the pair `3,9`, whose union misses characteristic three.
- `level_structure_cover_proper_not_finite`: `ℙ¹_k → Spec k` is projective and
  proper but not finite. Proper projective domination alone does not certify the
  finite map required by `level_structure_cover`; that map is `q_15`.
- `level_structure_cover_quotient_group`: for `m = 4`, `m' = 60` and `g ≥ 1`, the Chinese remainder
  theorem gives `Γ ≅ GL_{2g}(𝔽_3) × GL_{2g}(𝔽_5)`, of order divisible by `3` and `5`, neither of
  which is invertible on `ℤ[1/4]`; a descent theorem for groups of invertible order does not apply.
- `level_structure_cover_quotient_not_free`: in the same case the action is not free over
  characteristic `3`. Over `M_{g,n}[1/4]` the space `N_{g,n}(4)` is the étale level-`4` cover, so at
  a generic point of its characteristic-`3` fibre its local ring is a discrete valuation ring with
  uniformizer `3`. The transported Weil pairing on the level-`3` part of a basis gives a primitive
  cube root of unity `ζ` among the functions on `N_{g,n}(60)`, and `3 = −ζ²(1 − ζ)²` has even
  valuation at every point above; the extension is ramified there, and those points have
  nontrivial inertia in `Γ`.
- `level_structure_cover_quotient_zero_three`: for `(g, n) = (0, 3)`, `Γ` is trivial, both
  normalizations are `Spec ℤ[1/m]`, and the identification is the identity.
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
`IsGenericallyEtale` (the function-field extension is separable), *IsAlteration.comp* (for `S'' → S'
→ S` alterations of **integral** schemes, the composite is an alteration; the finite-open witnesses must meet the generic point),
`genericDegree_comp` (multiplicative),
*isModification_iff* (an alteration is a modification iff its generic degree is `1`),
*IsAlteration.exists_of_surjective* (a proper surjection onto an integral Noetherian scheme
contains an alteration from an integral closed subscheme of the source; Stacks, Lemma 72.8.5
(0DMN)), *IsAlteration.exists_dominating* (de Jong 5.4: for finitely many alterations `g_i : T_i →
S` of an **integral** Noetherian `S` with `T_i` integral, there is an integral `T'` with an
alteration `h : T' → S` and morphisms `a_i : T' → T_i` in `Over S`, that is `a_i ≫ g_i = h`; for
`S = Spec k ⊔ Spec k` and `g_1, g_2` the two points, no integral `T'` dominates both),
*IsAlteration.baseChange_component* (the base change along a dominant map of integral schemes
contains a dominating component that is an alteration). *Needs:* §0.9, §0.21, §4.11, §4.12;
Mathlib `IsProper`, `IsDominant`, `IsFinite`, `Scheme.functionField`, `Module.finrank`,
`Algebra.IsSeparable`, `IsIntegral`.

**Checks.**
- *isAlteration_frobenius*: Frobenius of `𝔸¹_{𝔽_p}` is an alteration of generic degree `p` and not
  a modification.
- *isAlteration_gaussianIntegers*: `Spec ℤ[i] → Spec ℤ` is a finite alteration of degree `2`,
  generically étale.
- *isAlteration_id*; `not_isAlteration_projectiveLine` (`ℙ¹_k → Spec k` is not generically
  finite); *isModification_isAlteration*.
- `test_comp_needs_integral`: for `S = Spec k ⊔ Spec k` and `S' = Spec k` mapping to the first
  point, `S' → S` is proper and finite but not dominant, so the predicate rejects it.
- `test_exists_dominating_needs_integral`: for `S = Spec k ⊔ Spec k` and the two inclusions, no
  integral scheme dominates both.

*Lean:* `Formal.IsAlteration`, `Formal.IsAlteration.functionFieldMap` (the stalk map at the
generic point of `S'` composed with the specialisation of its image to the generic point of `S`),
`Formal.IsAlteration.IsGenericallyEtale`. The rest of the API is specified in this README only.

### 4.17 Strict normal crossings divisors

Define `SNCData X`: a finite family of ideal sheaves `D_i` (the components, reduced), with
`stratum J := ⨆_{j ∈ J} D_j` (the partial intersection `D_J`) and `divisor := ∏ D_i`; `IsTransverse`:
every nonempty `D_J` is regular (§4.13) of codimension `|J|` in `X` at every point. Define
`IsStrictNormalCrossings D` for `D : X.IdealSheafData` on a Noetherian `X`: `D` is the divisor of some
transverse `SNCData` and `X` is regular at every point of `D` (de Jong 1996, 2.3–2.4, p. 55; 3.1, p.
62); `IsNormalCrossings D`: strict normal crossings after a surjective étale base change. API:
*IsStrictNormalCrossings.isNormalCrossings*, `.pullback_smooth`, `.component` (each component is a
regular effective Cartier divisor), `.local_equation` (at a point of `D` the ideal is generated by a
product of part of a regular system of parameters), `.of_subset` (a sub-family of components is
SNC), `.isEffectiveCartier` (Tau Ceti's `CartierDivisor`). Prove `nc_to_snc`: for a normal crossings
divisor `D` on a regular scheme there is a finite sequence of blow-ups in strata `φ : X' → X` whose
reduced inverse image `φ⁻¹(D)_red`, the radical of `D·O_{X'}`, is strict normal crossings; the total
transform `D·O_{X'}` carries exceptional divisors with multiplicity and is never SNC when a
component repeats (de Jong 1996, 2.4, p. 55; 7.2, p. 87; 4.28, p. 76). *Needs:* §4.13; Mathlib `IdealSheafData`,
`Etale`, `ringKrullDim`; Tau Ceti `CartierDivisor`; StableReduction Layer 2, 4.

**Checks.**
- `snc_axes`: `V(xy) ⊆ 𝔸²_k` is SNC with two components.
- `nodalCubic_blowUp_snc`: blowing up the node of `V(y² − x²(x + 1)) ⊆ 𝔸²_k` (`char k ≠ 2`) with
  exceptional divisor `E` and strict transform `C̃`, the total transform `C̃ + 2E` is not SNC, while
  the reduced inverse image `C̃ + E` is SNC: `C̃` meets `E` transversally in two points.
- `snc_empty`: the empty divisor is SNC.
- `nodalCubic_nc_not_snc`: for `char k ≠ 2`, `V(y² − x²(x + 1)) ⊆ 𝔸²_k` is normal crossings (étale
  locally `xy = 0` at the node) and not strict normal crossings (one irreducible component through
  the node, not regular there).
- `not_nc_threeLines`: `V(xy(x − y)) ⊆ 𝔸²` is not normal crossings (three components through a
  point of a surface).

*Lean:* `Formal.SNCData`, `Formal.SNCData.stratum`, `Formal.SNCData.divisor`,
`Formal.SNCData.IsTransverse`, `Formal.IsStrictNormalCrossings`. `IsNormalCrossings`, the API and
`nc_to_snc` are specified in this README only.

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
valuation ring retain both alternatives of StableReduction Layer 1:
`R'[u,v]/(uv)` or `R'[u,v]/(uv−π^n)` after the same étale localization used there.
Prove `node_local_structure_dvr`: for `a ∈ m_R`, either `a=0`, giving the persistent
node, or `a≠0` and `a=ε π^n` with `ε ∈ Rˣ` and `n≥1`; the coordinate change
`u=εu'`, `v=v'` gives `u'v'=π^n`. The algebra equivalence sends the old `u` to
`εu'` and the old `v` to `v'`, and induces the equivalence on completions. This is a
comparison on the supplier's nodal-family carrier. Prove
`node_local_structure_dvr_nonzero_of_generic_smooth`: smoothness of the generic fibre
at this local model implies `a≠0`, hence the finite-thickness alternative. The general
nodal-family theorem allows persistent nodes, including stable nodal generic fibres
(de Jong §2.23, pp. 61–62; StableReduction Layer 1).

The resolution of the total space is for **split** families and has two owned stages. Throughout,
`S` is a Noetherian excellent regular scheme, `D = D_1 ∪ ⋯ ∪ D_m ⊂ S` a strict normal crossings
divisor (§4.17), and `f : X → S` satisfies `DeJong.IsSplitPrestable f` and is smooth over `S ∖ D`.
Then `Sing(X)` lies in the part of `Sing(f)` over `D`, so it has codimension at least two, and `X`
is normal, being locally a hypersurface over a regular base (de Jong 1996, 3.1 and 3.4,
pp. 62–63). Let `x ∈ Sing(X)` lie over `s`, and let `t_1, …, t_r` be local equations at `s` of the
components of `D` through `s`. By splitness and 2.23, `O^∧_{X,x} ≅ O^∧_{S,s}[[u,v]]/(uv − ε t_1^{n_1} ⋯ t_r^{n_r})`
with `ε` a unit and `Σ n_i ≥ 2` (3.3, p. 63). Blow-ups commute with completion, so the chart
computations below are made on `O_{S,s}[u,v]/(uv − ε ∏ t_i^{n_i})`. Tau Ceti's
`NodeAlgebra.isRegularLocalRing_stalk_blowup_iff` is only the one-parameter instance of the first
stage: a node `xy = π^{n+2}` over a discrete valuation ring, blown up at the origin. The
multi-parameter charts, the second stage and the globalization of the centres are owned here.

Prove `nodal_codim_two_reduction` (de Jong 1996, Lemma 3.2, p. 62; proof 3.4, pp. 63–64). There is
a projective modification `X_1 → X`, a composite of blow-ups and an isomorphism over
`X ∖ Sing(X)`, such that `X_1 → S` is again split prestable and smooth over `S ∖ D`, and
`Sing(X_1)` has codimension at least three. A codimension-two irreducible component `T` of
`Sing(X)` maps finitely and unramifiedly onto some `D_i`, so `T` is regular. Its exponent
`n_T := n_i ≥ 2` is the same at every point of `T`. Blow up the ideal `(u, v, t_i)` of `T`; write
`g = ε ∏_{j ≠ i} t_j^{n_j}`. On the chart where `t_i` generates, `u = t_i u'`, `v = t_i v'` and
`u'v' = t_i^{n_T−2} g`. On the chart where `u` generates, `t_i = u t_i'` and `v = u v'` with
`v' = u^{n_T−2} t_i'^{n_T} g`, so this chart is `O_S[u, t_i']/(u t_i' − t_i)`, regular with
exponent one. The `v`-chart is symmetric. The blow-up is again split prestable and smooth over
`S ∖ D`. A codimension-two singular component dominating `T` remains exactly when `n_T ≥ 4`,
with exponent `n_T − 2`. Singularities of codimension at least three may remain over proper
closed subsets of `T`; `split_nodal_component_resolution` resolves them after this stage.
Every other codimension-two component of the singular locus has at most one codimension-two
component above it, with the same exponent. Induction on the sum of the exponents of the
finitely many codimension-two components terminates.

Prove `split_nodal_component_resolution` (de Jong 1996, 3.5, p. 64; Proposition 3.6 and proof,
pp. 64–65). Assume in addition that `Sing(X)` has codimension at least three. Then there is a
projective modification `X' → X`, a composite of blow-ups and an isomorphism over `X ∖ Sing(X)`,
with `X'` regular and `X' → S` split prestable and smooth over `S ∖ D`. With `Sing(X)` of
codimension at least three every exponent is `0` or `1` (an exponent `≥ 2` would put a
codimension-two component in `Sing(X)`). So at a singular point, after renumbering and absorbing
the unit, the local ring is `O_{S,s}[u,v]/(uv − t_1 ⋯ t_μ)` with `2 ≤ μ ≤ r` (3.5). The centres are the
irreducible components `E` of the inverse images `f⁻¹(D_i)`, and splitness globalizes them. At such
a point, with `D_1 = V(t_1)`, the locus `V(u, v, t_1)` lies in `Sing(f)` and dominates `D_1`.
Splitness of the fibre over the generic point of `D_1` therefore gives two distinct components of
`f⁻¹(D_1)` through `x`, with local ideals `(u, t_1)` and `(v, t_1)`. So at a singular point the
ideal of `E` is `(u, t_i)`, `(v, t_i)` or principal. Where it is principal, in particular at every
regular point of `X`, blowing up `E` is an isomorphism. The blow-up of `(u, t_1)` has two charts:
- where `u` generates, `t_1 = u t_1'` and `v = t_1' t_2 ⋯ t_μ`, giving the regular
  `O_S[u, t_1']/(u t_1' − t_1)`;
- where `t_1` generates, `u = t_1 u'` and `u'v = t_2 ⋯ t_μ`, so `μ` drops by one.

The blow-up is again split prestable and smooth over `S ∖ D`. Its exceptional locus has codimension
at least two, so the components of the inverse image of `D` correspond bijectively before and
after. The blown-up component becomes a Cartier divisor, and Cartier components stay Cartier.
After each of the finitely many components has been blown up once, all components of the inverse
image of `D` are Cartier. At a point with `μ ≥ 2`, however, the components with ideals `(u, t_1)`
and `(v, t_1)` are not Cartier. So `μ = 1` everywhere, and `X'` is regular.

Prove `nodal_family_resolution`: for `S`, `D` and a split prestable `f : X → S` smooth over
`S ∖ D` as above, there is a projective modification `φ : X' → X` that is an isomorphism over
`X ∖ Sing(X)`, with `X'` regular and `X' → S` split prestable and smooth over `S ∖ D`. It is the
composite of the two stages (de Jong 1996, Proposition 3.6, p. 64). Since `Sing(X) ⊆ Sing(f)`,
`φ` is an isomorphism over the relative smooth locus of `f`. Mutually disjoint sections into that
locus therefore lift to mutually disjoint sections into the smooth locus of `X' → S` (de Jong 1996,
6.16, p. 86). Without splitness the component stage has no centre at a singular point
(`nodal_resolution_nonsplit_stalls`).

Prove `generic_projection`: for a pure
`d`-dimensional projective `X ⊆ ℙ^N_k` over an infinite field, a general linear projection
with centre disjoint from `X` gives a finite morphism `π : X → ℙ^d_k`. Projection from a
point `p ∈ ℙ^d_k` to `ℙ^{d−1}_k`, for `d≥1`, is a rational map. Its composite with `π` is resolved
on `b : X' = Bl_{π⁻¹(p)} X → X`; the resulting proper morphism
`f : X' → ℙ^{d−1}_k` has nonempty pure one-dimensional fibres. The fibre assertions
refer to `X'` (de Jong 1996, proof of Lemma 4.11, pp. 67–68). The projection from a point is de
Jong 1996, §2.11, pp. 56–57, which assumes that `X` has a dense open subscheme geometrically reduced
over `k`; for such `X` it applies to the composite with `π`.

Prove `curve_fibration` in the following reduced situation: `k` is algebraically closed,
`X/k` is normal, integral and projective of dimension `d ≥ 1`, and `Z` is the support of
an effective Cartier divisor on `X` (the empty divisor is allowed). There are a finite
set `S ⊆ Reg(X) ∖ Z` of closed points, the modification `b : X' = Bl_S X → X`, a
projective integral `Y/k` of dimension `d−1`, and a projective morphism `f : X' → Y`.
Require `f ≫ (Y → Spec k) = b ≫ (X → Spec k)`, nonempty geometrically connected pure
one-dimensional fibres, and a relative smooth locus dense in every fibre. The reduced
inverse image `Z'` is finite over `Y` and étale over a nonempty open of `Y`. There is a
**nonempty** open `V ⊆ Y` over which `f` is smooth; its generic fibre is therefore smooth
and geometrically integral. Use Lemma 4.11 for the blow-up and fibre conditions and
§4.12 for the smooth open and Stein factorization (de Jong 1996, pp. 67–69).

Prove `curve_fibration_field_reduction`: for an integral finite-type `X/k`, there is a
finite field extension `k'/k`, a reduced irreducible component
`C ↪ X ×_k k'` geometrically integral over `k'`, and the alteration
`q : C ↪ X ×_k k' → X`, retaining `C → Spec k' → Spec k` and its equality with
`q ≫ (X → Spec k)`. No separability is required. Prove
`curve_fibration_spread`: after passage to an algebraic closure, the component,
projective modification, boundary blow-up, normalization, fibration, nonempty smooth
open and their structural maps descend together to some finite `k'/k`; their stated
properties descend by faithful flatness. Compose the descended modification with `q`
to obtain an alteration over `k`, keeping its `k'`-structure. These are the component
and finite-presentation descent steps of de Jong §4.5, p. 66, with the projective,
divisor and normal reductions of §§4.6–4.10, pp. 66–67. They precede applying the
reduced `curve_fibration` helper in the arbitrary-field theorem. A field-changing
alteration is not asserted to be a modification over `k`.

Prove `three_point_divisor`: for the projective family over the algebraically closed field
with the fibrewise dimension, connectedness and dense-smooth-locus hypotheses just stated,
there is a divisor `H ⊆ X'`, finite over `Y` and étale over a nonempty open of `Y`, meeting every
irreducible component of every fibre in at least three smooth points (de Jong 1996, Lemma 4.13,
pp. 69–70). Prove `stable_model_domination`: given the stable pointed model of the generic fibre
extended over an alteration of `Y` (§4.15), the stable family dominates the strict transform of
the original family after a modification, with the dominating map an isomorphism over a nonempty open of `Y` (de
Jong 1996, 4.18–4.21, pp. 72–74). Prove `curve_family_alteration`: let `f : X → Y` be projective with `X` and `Y` integral
excellent schemes, all fibres nonempty and equidimensional of dimension one, and the relative
smooth locus dense in every fibre. For every proper closed subset `Z ⊊ X`, there are alterations
`ψ : Y' → Y`, `φ : X' → X`, a projective split prestable family `f' : X' → Y'` with smooth generic
fibre, and `φ ≫ f = f' ≫ ψ`. There are a divisor `D₁ ⊆ Y'` and finitely many mutually disjoint
sections `σ_i : Y' → X'` lying in the relative smooth locus, with
`(φ⁻¹Z)_red ⊆ (f'⁻¹D₁)_red ∪ ⋃ᵢ σ_i(Y')`.
The containment allows both vertical and horizontal boundary components
([de Jong 1996, Theorem 5.8, printed p. 79](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf);
proof §§5.9–5.17). The generic smoothness conclusion in particular gives regular generic fibre. *Needs:* §4.11, §4.13, §4.15, §4.16,
§4.17; StableReduction Layers 1, 3, 4; Tau Ceti `NodeAlgebra`; Mathlib `Flat`, `IsProper`.

The inputs to `curve_family_alteration` come from `curve_fibration` after the component
and spreading reductions, or from the relative projection in de Jong §6.13 in the trait
case. Its output is used in the induction on the altered base with its vertical divisor;
it is not an input to the fibration helper or to StableReduction's reduction proof.

**Checks.**
- `curve_fibration_imperfect_conic_rejected`: let `k = 𝔽₂(s,t)` and
  `C = V(X²+sY²+tZ²) ⊆ ℙ²_k`. This regular integral projective curve has
  `Γ(C,O_C)=k`; over `k(√s,√t)` it is a double line. Thus `k` fails the
  algebraic-closedness input, and no modification `C' → C` can admit a geometrically
  integral generic fibre over an integral zero-dimensional proper `k`-scheme `Y`.
  Indeed the modification is an isomorphism and `Y=Spec k`. The Check uses
  the reduced closed subscheme of the displayed projective zero locus, which over
  `k` is the conic itself (Stacks §53.2, Lemma 53.2.4, 0BXX; Lemma 29.55.8, 0AB1).
- `curve_fibration_imperfect_conic_double_line`: over a field of characteristic two,
  adjoining square roots of `s,t` makes the displayed quadratic the square of
  `X+√sY+√tZ`; its affine chart is nonreduced.
- `generic_projection_plane_base_point`: `[X:Y:Z] ↦ [X:Y]` is undefined at
  `[0:0:1]`. On `Z=1`, both coordinates vanish at the origin.
- `generic_projection_plane_blowup`: the incidence surface
  `Bl_[0:0:1] ℙ² ⊆ ℙ² × ℙ¹`, with equation `XV=YU`, projects to `ℙ¹` with
  fibres `ℙ¹`. On `U≠0, Z≠0`, put `t=V/U`; its chart is `(x,t) ↦ (x,xt)`
  and the fibration is `(x,t) ↦ t`. The other chart interchanges `x,y`.
  The Check verifies these two polynomial-ring charts, the exceptional
  sections and their transition `t ↦ 1/t`.
- `curve_fibration_smooth_open_nonempty`: for this blow-up the smooth base open is
  all of `ℙ¹`, which is nonempty; an empty open cannot meet the fibration conclusion.
- `curve_family_alteration_vertical_fibre`: for `Y = A¹_k`, `X = P¹_Y` and `Z = X_0`, the
  identity diagram works with `D₁ = {0}` and no sections. No finite union of sections contains
  `Z`; each section contributes one point to that one-dimensional fibre. Use
  the native `Proj` model of `P¹_Y` and its structure map.
- `curve_family_alteration_vertical_after_base_change`: in the same situation every output of
  `curve_family_alteration` has `ψ⁻¹(0) ⊆ D₁`. For `y'` over `0` the fibre `f'⁻¹(y')` maps into `Z`,
  so lies in `(φ⁻¹Z)_red`; the sections meet this one-dimensional fibre in the finitely many points
  `σ_i(y')`, so the containment `(φ⁻¹Z)_red ⊆ (f'⁻¹D₁)_red ∪ ⋃ᵢ σ_i(Y')` puts the fibre in
  `f'⁻¹D₁`.
- `split_twoLines`: `V(xy) ⊆ ℙ²_k` (two lines meeting at a rational point) is split prestable over
  `k`.
- `not_split_nodalCubic`: the nodal cubic over `k` with its node's branches defined over a
  quadratic extension is prestable and not split.
- `split_after_extension`: for `char k ≠ 2` and a nonsquare `a ∈ kˣ`,
  `V(x² − a y²) ⊆ ℙ²_k` is prestable but not split, and becomes split over the finite separable
  extension `k(√a)`. In characteristic two with `k=𝔽₂(s)` and `a=s`, its base change is a double
  line, hence is not prestable.
- `split_smooth`: a smooth family with geometrically irreducible fibres is split.
- `node_local_structure_dvr_persistent`: for `R=k[[π]]`, the proper flat split
  prestable family `V(XY) ⊆ ℙ²_R` has node chart `NodeAlgebra R 0` and completed
  local ring `R[[u,v]]/(uv)`. Its Jacobian quotient is `R`, so its singular section
  persists on the generic fibre. Zero is not a unit times any finite positive power
  of `π`; this family takes precisely the zero-parameter branch.
- `node_local_structure_dvr_thickness_one`: `uv=π` takes the positive branch with
  `n=1, ε=1`. Its Jacobian quotient is `R/(π)`, a reduced field, and its generic
  fibre is smooth.
- `node_local_structure_dvr_thickness_two`: `uv=π²` takes the positive branch with
  `n=2, ε=1`. Its Jacobian quotient is the nonreduced `R/(π²)`, and its generic
  fibre is smooth. This distinguishes thickness from persistence and from thickness one.
- `node_local_structure_dvr_unit_coordinates`: for `uv=ε π²`, the equivalence sends
  `(u,v)` to `(εu',v')`; their product is `ε π²`, fixing the direction of the unit change.
- `node_local_structure_test_dvr`: for `n≥1`, `Spec ℤ_p[x, y]/(xy − p^n)` has complete local ring
  `ℤ_p[[u, v]]/(uv − p^n)` at the node, StableReduction Layer 1's form.
- `nodal_resolution_point_blowup_rejected`: `X = V(UV − stW²) ⊆ ℙ²_{k[s,t]}` over `S = 𝔸²_k`,
  with `D = V(st)`, is split prestable and smooth over `S ∖ D`. Its fibres over `D` are two
  rational lines meeting at `[0:0:1]`. On `W ≠ 0` it is `uv = st`, singular only at
  `u = v = s = t = 0`. So `Sing(X)` has codimension three and `nodal_codim_two_reduction` changes
  nothing. Blowing up this point is the wrong centre: its exceptional divisor, the quadric surface
  `V(uv − st) ⊆ ℙ³_k`, lies over the origin of `S`. The fibre there is two-dimensional, so the
  result is not prestable.
- `nodal_resolution_component_blowup`: in the same family `V(U, s)` is a component of `f⁻¹(V(s))`,
  with local ideal `(u, s)` at the singular point. Its blow-up has two charts, glued along
  `ab = 1`: `k[u, a, t]`, with `s = ua` and `v = at`, and `k[s, b, v]`, with `u = sb` and
  `t = bv`. Both are polynomial rings, hence regular. The fibre over the origin of `S` is a chain
  of three lines: the strict transforms of `U = 0` and `V = 0`, joined by the exceptional line.
  Its nodes `u = a = 0` and `b = v = 0` have local equations `ua = s` and `bv = t`, each of
  exponent one in a single parameter. One component blow-up already gives a regular split
  prestable family, as in `split_nodal_component_resolution`.
- `nodal_codim_two_two_parameters`: `V(UV − s²tW²) ⊆ ℙ²_{k[s,t]}`, with `D = V(st)`, is split
  prestable and smooth over `S ∖ D`. On `W ≠ 0`, `uv = s²t` is singular exactly along the line
  `T = V(u, v, s)`, of codimension two over `D_1 = V(s)`, with exponent `n_T = 2`. Blowing up
  `(u, v, s)` gives three regular charts: the `s`-chart `u = su'`, `v = sv'`, `u'v' = t`; the
  `u`-chart `k[u, s', t]`, with `s = us'` and `v = us'²t`; and the symmetric `v`-chart. The family
  stays split prestable. Over the origin of `S` the exceptional conic `uv = ts²` degenerates to two
  lines, joined by the node `u'v' = t`. At the generic point of `D_1`, where `t` is a unit,
  absorbing `t` into `u` gives the supplier's `isRegularLocalRing_stalk_blowup_iff` at `n = 0`.
  The supplier does not cover the two-parameter chart `u'v' = t`.
- `nodal_codim_two_thickness_three_residual`: over an algebraically closed field `k` of
  characteristic zero, `X = V(UV − s³tW²) ⊆ ℙ²_{k[s,t]}`, with `D = V(st)`, is a proper flat
  split prestable family smooth over `S ∖ D`. On `W ≠ 0`, `uv = s³t` has singular locus
  `T = V(u, v, s)`, of codimension two and exponent `n_T = 3`. Blowing up `(u, v, s)` gives
  the `s`-chart `u = sa`, `v = sb`, `ab = st`: substitution factors the original equation as
  `s²(ab − st)`. The `u`-chart is `k[u, c, t]`, with `s = uc`, `v = u²c³t`; the `v`-chart is
  symmetric. The only remaining singularity is the origin of `ab = st`, whose local ring has
  dimension three and embedding dimension four. It lies over the closed point `t = 0` of `T`.
  Thus no codimension-two singular component remains, but the total space is not regular.
  The component centre `(a, s)` resolves this point as in `nodal_resolution_component_blowup`,
  the second stage `split_nodal_component_resolution`.
- `nodal_codim_two_exponent_four`: `V(UV − s⁴W²) ⊆ ℙ²_{k[s,t]}`, with `D = V(s)`, has `n_T = 4`
  along `T = V(u, v, s)`. After one blow-up the `s`-chart is `u'v' = s²`, singular along
  `V(u', v', s)` with exponent `2`. The `u`-chart is `k[u, s', t]`, with `v = u³s'⁴`. A second
  blow-up gives a regular family. For `uv = s³` one blow-up suffices, its `s`-chart being
  `u'v' = s`. This tests the drop of the exponent by two and the termination.
- `nodal_resolution_nonsplit_stalls`: let `char k ≠ 2`, let `a ∈ k` be a nonsquare, and let
  `X = V(U² − aV² − stW²) ⊆ ℙ²_{k[s,t]}`, with `D = V(st)`. It is prestable and smooth over
  `S ∖ D`. Its only singular point is the rational point `U = V = s = t = 0`. It is not split:
  the branches `U ± √aV` of each singular fibre are conjugate. Over the generic point of `V(s)`
  the fibre `U² − aV² = 0` is irreducible. So `f⁻¹(V(s))` is irreducible, and at the singular
  point its ideal is `(s)`, because `U² − aV² ∈ (s)` there; likewise for `V(t)`. Every candidate
  centre is therefore Cartier at that point, the component stage is an isomorphism, and the point
  stays singular. Over `k(√a)`, with `u = U + √aV` and `v = U − √aV`, this becomes the split
  family of `nodal_resolution_component_blowup`.

*Lean:* `Formal.DeJong.node_local_structure_dvr` (on the polynomial model `R[u, v]/(uv − a)`, with
the coordinate change `u ↦ εu'`, `v ↦ v'`),
`Formal.DeJong.node_local_structure_dvr_nonzero_of_generic_smooth`,
`Formal.DeJong.curve_fibration_field_reduction`,
`Formal.DeJong.nodal_codim_two_thickness_three_residual` (the substitution identity and the
dimension-three, embedding-dimension-four local ring of the residual chart). The other
definitions, theorems and Checks of this subsection, including `curve_family_alteration`, are
specified in this README only.

### 4.19 de Jong's alteration theorem over a field

Prove `alteration_theorem`: for `X` integral separated of finite type over a field `k` and `Z ⊊ X`
a proper closed subset, there is an alteration `φ : X_1 → X` from an integral `X_1`, an open
immersion `j : X_1 → X̄_1` into a regular scheme `X̄_1` **projective** over `k` (StableReduction Layer
2's projective morphisms; properness is the consequence recorded in `Suggested.lean`), such that
the complement of `j` together with `j(φ⁻¹(Z))` is the support of a strict normal crossings divisor
(§4.17); when `k` is perfect the alteration can be chosen generically étale (de Jong 1996, Theorem
4.1 and Remark 4.2, p. 66; proof 4.3–4.28, pp. 66–76). *Needs:* §4.12, §4.13, §4.14, §4.15, §4.16, §4.17, §4.18; StableReduction Layer 2.

For arbitrary `k`, use `curve_fibration_field_reduction` and `curve_fibration_spread`
before the reduced fibration helper. The descended diagram retains the finite extension
`k'/k` and the map `X_1 → Spec k'`; composition with `Spec k' → Spec k` is its given
`k`-structure. The composed map to `X` is an alteration. When `k` is perfect the finite
extension is separable, and the separate generically étale conclusion is retained.

The boundary construction retains §4.18's vertical part. Enlarge `D₁` by the discriminant and
apply the induction to the altered base together with it. Then pull the split family back along
the resulting alteration of the base; splitness is stable under base change (de Jong 1996, 2.22,
p. 61). Resolve its total space by `nodal_family_resolution`, which retains the disjoint smooth
sections. Both its inverse-image boundary and these horizontal sections enter the
normal-crossings boundary (de Jong, §§4.22–4.28; the split resolution as in 6.16, pp. 86–87).

**Checks.**
- `alteration_imperfect_conic_valid`: the same `𝔽₂(s,t)` conic with `Z=∅` satisfies
  the arbitrary-field theorem. Its identity alteration and compactification already
  work because it is regular. To obtain a geometrically integral smooth model over
  a new field, `k'=k(√s,√t)` gives the reduced line `ℙ¹_{k'}` mapping finitely and
  surjectively to `C`; retain the structural map through `Spec k'`.
- `alteration_test_curve`: for a curve the theorem is resolution by normalisation (§4.13) with
  `φ` a modification.
- `alteration_test_cone`: the quadric cone in `𝔸³` with `Z` the vertex: the blow-up at the vertex is
  a resolution with SNC exceptional divisor.
- `alteration_test_inseparable`: over an imperfect field the alteration need not be generically
  étale (`y² = x^p − t` admits no generically étale alteration to a smooth curve with the same
  function field).

*Lean:* `Formal.DeJong.alteration_theorem` (with `X̄_1` proper over `k`).

### 4.20 Traits, `S`-varieties, strict semistability and the semistable alteration theorem

Define `IsTrait R`: `R` is a complete discrete valuation ring (de Jong 1996, 2.12, p. 57); a
morphism of traits is a local homomorphism `R → R'` of complete discrete valuation rings sending a
uniformiser to a nonzero element, equivalently an injective local homomorphism.
Define `TraitHom.ramificationIndex φ hφ` for an injective local homomorphism `φ` of DVRs,
with `hφ : Function.Injective φ`, as the valuation of `φ(π)`; completeness is not needed. A
finite extension of traits means a finite injective local homomorphism `R → R'` of complete DVRs
(de Jong 1996, 2.12, p. 57). No separability of `Frac(R')/Frac(R)` is required. In the separable
case use Tau Ceti's `FiniteDVRExtension R K` (StableReduction Layer 0), and prove that its local
ring is already complete and finite over the complete base; completion is unnecessary here.
The general alteration theorem quantifies directly over `R'`, its algebra structure, finiteness,
locality and injectivity, so it also includes inseparable extensions. Define `IsSVariety f`
for `f : X → Spec R`: `X` integral, `f` separated, flat and of finite type (de Jong 1996, 2.15, p.
59), with *isSVariety_iff_genericFiber_nonempty* and *IsSVariety.toModel* (a proper `S`-variety
with an identification of its generic fibre is Tau Ceti's `Model`). Prove
*IsSVariety.baseChange_component*: for `R → R'` any finite extension of traits
(`R'` dominates `R` and the base change is **horizontal**: `Spec R' → Spec R` is dominant), every reduced
irreducible component of `X ×_R R'` dominates `X` and is an `S'`-variety mapping to `X` by an
alteration, with the structure morphism over `Spec R' → Spec R` (de Jong 1996, 6.8, p. 83).
The statement *IsSVariety.baseChange_component* takes any reduced irreducible component, including
after inseparable extensions; a separate Check retains the `FiniteDVRExtension` case. The
vertical specialisation `ℤ_p → 𝔽_p` is not a morphism of traits and is excluded. Define
`SemistableConditions K f` (de Jong 2.16 (a)–(d) without integrality): the generic fibre is smooth
over `K`, the special fibre is the divisor of a transverse `SNCData` all of whose strata are
smooth over the residue field of the expected codimension; `IsStrictlySemistable K f := IsSVariety f
∧ SemistableConditions K f` (de Jong 1996, 2.16, pp. 59–60; 2.8, p. 55). API:
*IsStrictlySemistable.isRegular*, `.snc_specialFiber` (with perfect residue field, strict
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
`S_1`-varieties `j : X_1 → X̄_1`, where `X̄_1` is proper over `S_1` with geometrically
irreducible generic fibre. The reduced boundary with support
`B = (X̄_1 ∖ j(X_1)) ∪ j(φ⁻¹(Z))` makes `(X̄_1, B)` a strict semistable pair. In the horizontal
`SNCData H` convention, require the exact equality
`support(X̄_{1,s_1}) ∪ support(H) = (X̄_1 ∖ j(X_1)) ∪ j(φ⁻¹(Z))`.
With `g : X̄_1 → S_1` and `f_1 : X_1 → S_1`, both `j ≫ g = f_1` and
`f_1 ≫ (S_1 → S) = φ ≫ f` must hold (A. J. de Jong 1996, Theorem 6.5 and Diagram 6.6,
p. 83; strict pairs: 6.2–6.4, pp. 82–83). This is the properness consequence of the source
theorem. Its stronger projectivity conclusion is outside this statement; both the prose and
`semistable_alteration_theorem` use properness. *Needs:* §0.21,
§4.11, §4.13, §4.15, §4.16, §4.17, §4.18, §4.19; Tau Ceti `FiniteDVRExtension`, `genericFiber`, `specialFiberι`, `Model`;
StableReduction Layers 0, 2–3; Mathlib `IsDiscreteValuationRing`, `IsAdicComplete`, `Smooth`.

In the curve-family step, apply §4.18 with its fibrewise dimension and smooth-locus hypotheses,
obtained on the modified source by the relative projection in de Jong §6.13, after the
finite trait extensions and normalization of §§6.8–6.12. This uses the relative argument,
not the algebraically closed field helper over the original fraction field. Enlarge `D₁` by the discriminant and apply induction to the base pair.
The pulled-back family is still split (de Jong 1996, 2.22, p. 61). So `nodal_family_resolution`
applies over the regular base of the strict semistable pair, with its strict normal crossings
boundary, and carries the inverse image of `D₁` and the disjoint smooth sections through
(de Jong, §§6.14–6.16, pp. 85–87). The special-fibre boundary remains part of the resulting pair.

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
- *isTrait_padicInt*: `ℤ_p` is a trait with uniformiser `p`.
- `not_isTrait_localization`: `ℤ_{(p)}` is a DVR and not a trait (not complete).
- `isTrait_powerSeries`: `k[[t]]` is a trait with uniformiser `t`.
- `not_isTrait_field`: a field is not a trait: its maximal ideal is zero, so it is not a discrete
  valuation ring.
- `ramification_sqrt`: the injective local map `ℤ_p → ℤ_p[x]/(x² − p)` has ramification index `2`.
- *isSVariety_genericOnly*: `Spec ℚ_p` is a `ℤ_p`-variety with empty special fibre.
- `not_isSVariety_specialPoint`: `Spec 𝔽_p → Spec ℤ_p` is not flat, hence not an `S`-variety.
- *baseChange_component_test_vertical_excluded*: `ℤ_p → 𝔽_p` is not a `FiniteDVRExtension`, so
  *baseChange_component* does not apply to it; for `ℤ_p → ℤ_p[√p]` the base change of a smooth
  `S`-variety is a component dominating it.
- `strictlySemistable_xy` (`Spec ℤ_p[x, y]/(xy − p)`), `strictlySemistable_smooth` (`𝔸¹_{ℤ_p}`),
  `not_strictlySemistable_xy_sq` (`xy − p²` is not regular at the node),
  `not_strictlySemistable_ramified` (`x² − p`: the special fibre is nonreduced),
  `strictlySemistable_ramified_basechange` (`xy − p` becomes `xy − ϖ²` over `ℤ_p[ϖ]`, `ϖ² = p`,
  and is no longer strictly semistable until blown up).
- `pair_specialFiber` (`(X, X_s)` with `H = ∅`), `pair_with_horizontal` (`X = Spec ℤ_p[x, y,
  z]/(xy − p)` with `H = V(z)`), `not_pair_diagonal` (`H = V(x − y)` on `xy − p` is not transverse to
  the special fibre).

*Lean:* `Formal.DeJong.IsTrait`, `Formal.DeJong.IsSVariety`, `Formal.DeJong.SemistableConditions`,
`Formal.DeJong.IsStrictlySemistable`, `Formal.DeJong.IsStrictSemistablePair`,
`Formal.DeJong.semistable_alteration_theorem`, with `not_isSVariety_specialPoint`,
`isTrait_powerSeries` and `not_isTrait_field` as `example`s.

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
The characteristic-zero degree realization, numerical quotient and finiteness input, and
Nakai–Moishezon criterion are supplied by AbundanceStatement §§4A–4B and §4D through the exact
supplier contracts and the comparisons in §§5.9–5.10.

**Conventions of this layer.** The geometric Chow API uses schemes locally of finite
type over one fixed field `k`, with morphisms over `Spec k`. Properness, separation
and finite type are added on targets that require them;
`Z_k(X)` is Mathlib's `AlgebraicCycle X ℤ` graded by dimension; `CH_k(X)` is its quotient by rational
equivalence using locally finite families of supporting integral closed subschemes (§5.1); on a smooth variety of pure dimension `n`, `CH^p(X) := CH_{n−p}(X)` and `A(X) = ⊕
CH^p(X)`, and the two gradings are never mixed on a singular scheme. Rational coefficients are the
separate carrier `CH_k(X)_ℚ := CH_k(X) ⊗ ℚ`, named on every target that uses them; nothing proved
with `ℚ`-coefficients is exported integrally. Degrees of zero-cycles are taken on proper schemes
only. `ℙ(E) := relativeProj (Sym E^∨)` (§0.3 on AlgebraicVectorBundles L2A's graded symmetric
algebra) with `O(1)` the tautological quotient of `p^* E^∨`: `ℙ(E)` parametrises lines in `E`, the
convention of Fulton 1998, Appendix B.5; the Grothendieck convention `ℙ(E) = Proj Sym E`
parametrising rank-one quotients of `E` is ModularCurves 0G's for its Grassmannians, and the two are
related by `E ↔ E^∨`, recorded in `projectiveBundle_dual_convention`.

### 5.1 Rational equivalence, Chow groups and the divisor class comparison

For a fixed field `κ` and a scheme `X → Spec κ` locally of finite type,
the carrier `cyclesOfDimension κ X k` is the subgroup of `AlgebraicCycle X ℤ` supported in
dimension `k`: every point with nonzero coefficient has `Order.height x = n` for a natural
number `n` with `k = n`. In Mathlib's scheme order, `x ≤ y ↔ y ⤳ x`, so height is the dimension
of the closure of `x`, while coheight measures codimension. This is the dimension grading of
[Stacks, Definition 42.8.1](https://stacks.math.columbia.edu/tag/02QR), using the closure-dimension
comparison of [Lemma 42.7.5](https://stacks.math.columbia.edu/tag/02QO).
`RatEquiv κ X k` is a subgroup of this carrier, and `ChowGroup κ X k` is its quotient.
**Checks:** `cycles_zero` includes zero; `cycles_negative` computes degree `−1` as the zero
subgroup; `cycles_support_agreement` identifies membership with the support condition in Mathlib's
cycle carrier. The rational graded group uses a direct sum over degrees. Flat pullback requires
that every irreducible component of every fibre has dimension `d`; external products in this
section are over a field. The input is Tau Ceti's native `PureRelativeDimension d f`;
`pureRelativeDimension_iff_fiber_components` identifies it with the expanded
fibre condition for locally finite type `f`.

Define `Chow.RatEquiv κ X k ≤ Z_k(X)` by the following contract: a cycle is in this subgroup
iff it is `Σ_j (i_j)_* div(r_j)` for a family of integral closed subschemes
`i_j : W_j ↪ X` of dimension `k+1`, nonzero rational functions `r_j ∈ κ(W_j)ˣ`, and a **locally
finite family of closed supports** `|W_j|` in `X`. Thus each point has a neighbourhood meeting
only finitely many `|W_j|`. Local finiteness of the principal divisors alone is insufficient.
*ratEquiv_mem_iff* states this contract on the native cycle carrier, with coefficients given by
Mathlib's `Scheme.ord`. Define `CH_k(X) := Z_k(X) / RatEquiv κ X k`
([Stacks, Definition 42.19.1 and Remark 42.19.6](https://stacks.math.columbia.edu/tag/02RV)).
No quasi-compactness or separation is imposed on these two definitions. For quasi-compact `X`,
the family of nonempty supports is finite, recovering the finite-sum convention.
API: *Chow.div*, `div_mul` (`div(rs) = div r + div s`), `Chow.cycleClass` (the class of a cycle),
`equiv_iff_pone` (for separated finite-type `X`, `α ∼ 0` iff
`α = Σ p_*([V_i(0)] − [V_i(∞)])` for finitely many integral `V_i ⊆ X × P¹` dominating `P¹`;
Fulton, Proposition 1.6), `CH_top_free` (for finite-type `X` of dimension `n`, `CH_n(X)` is free
on its `n`-dimensional irreducible components), `CH_of_isIso`, `CH_coprod`
(`CH_k(∐_i X_i) ≃ ∏_i CH_k(X_i)` for any small family; for a finite family this is also a direct
sum), and `CH_rat` (the `Q`-carrier with `CH_k(X) → CH_k(X)_Q`). The coproduct comparison follows
componentwise from the locally finite support contract; it uses a product for infinitely many
components. All schemes remain locally of finite type over `κ`. Prove
`chow_divisorClass_comparison`: for `X` integral separated of finite type of dimension `n`, Tau Ceti's divisor class group
(`SchemeWeilDivisor` modulo principal divisors) is `CH_{n−1}(X)` through
`SchemeWeilDivisor.toAlgebraicCycle`. For normal such `X`, compose the map
`picardToClassGroup` of §3.4 with this isomorphism: it sends `L` to
`c₁(L) ∩ [X] ∈ CH_{n−1}(X)` and is an isomorphism for locally factorial `X`.
The pinned reverse map `classGroupToLineBundleClass` is compared only on regular curves
(Fulton 1998, §2.1; Stacks, Section 42.24 (02SI)). *Needs:* §3.4's Cartier comparison
and `picardToClassGroup`; Mathlib `AlgebraicCycle`, `Scheme.ord`; Tau Ceti
`SchemeWeilDivisor`.

**Checks.**
- *RatEquiv_countable_lines*: on `E = ∐_{n∈N} A¹_κ`, the locally finite cycle
  `α = Σ_n [0_n]` belongs to `RatEquiv κ E 0`, using the coordinate function on each component,
  and `cycleClass α = 0`. Indeed `CH_0(E) = ∏_n CH_0(A¹) = 0`.
- *RatEquiv_supports_not_divisors*: infinitely many copies of one nonempty integral subscheme
  do not form a locally finite supporting family, even if all functions are `1` and all their
  divisors vanish. This rejects the weaker support test.
- `CH_coprod_countable_points`: `CH_0(∐_n Spec κ) ≃ ∏_n Z`, whereas its degree `−1` group is zero.
  Rank-one homotopy invariance identifies the latter with `CH_0(E)` above.
- *cycleClass_surjective*: every class has a cycle representative.
- `cycles_dvr_closed_point`: on a DVR, the closed point has closure dimension and height zero,
  and coheight one.
- `chow_dvr_generic_open_rejected`: for a DVR `R` with fraction field `K`,
  `Spec K → Spec R` is an open immersion with zero-dimensional fibres, but its
  generic point has closure dimension zero in `Spec K` and one in `Spec R`.
  Absolute dimension therefore cannot give the stated degree-zero pullback on
  this general base. A positive-dimensional local DVR is not locally of finite
  type over a field; the geometric Chow API excludes it. Arithmetic pairings in
  §5.9 are separate and do not extend this grading to DVR bases.
- `test_pone_points`: two `k`-points of `ℙ¹` are rationally equivalent and `CH_0(ℙ¹) ≅ ℤ` by degree.
- `test_elliptic_points`: on an elliptic curve over `k̄`, `[P] − [Q] ∼ 0` iff `P = Q`.
- `test_affine_line`: `CH_0(𝔸¹) = 0`.
- `test_divisorClass_curve`: on a regular curve `CH_0 = Cl`, Tau Ceti's `classGroupAddEquivLineBundleClass`
  composed with the comparison.
- `test_top_free`: `CH_2(𝔸²) = ℤ`, `CH_1(𝔸²) = 0`.

- *RatEquiv_point*, *RatEquiv_empty*, *RatEquiv_affine_line*: respectively `RatEquiv = 0` for
  zero-cycles on a field point, `RatEquiv = 0` on the empty scheme in every degree, and
  `RatEquiv = all zero-cycles` on the affine line over a field (Fulton, §1.3).
- `chow_point`, `chow_empty`, `chow_negative`: `CH₀(Spec K) ≃ ℤ`, all groups of the empty scheme
  vanish, and `CH₋₁(X) = 0` (Fulton, §1.3).
- *cycleClass_point*, *cycleClass_affine_line*, *cycleClass_zero*: the cycle-class quotient is
  bijective on a field point, is not injective on zero-cycles of the affine line, and sends zero
  to zero, agreeing with `QuotientAddGroup.mk'` (Fulton, §1.3).

*Lean:* `Chow.cyclesOfDimension` (graded by `Order.height`), `Chow.RatEquiv`, `Chow.ChowGroup`,
`Chow.cycleClass`, `Chow.CH_coprod`; `cycles_dvr_closed_point`, `chow_point`,
*RatEquiv_countable_lines* and *RatEquiv_supports_not_divisors* are `example`s.

### 5.2 Proper pushforward, flat pullback and the localisation sequence

Construct *Chow.properPushforward*: for `f : X → Y` proper, Mathlib's `AlgebraicCycle.map` with
residue-degree weights (`f_*[V] = [K(V) : K(f(V))][f(V)]` when `dim f(V) = dim V`, `0` otherwise)
preserves rational equivalence and gives `f_* : CH_k(X) → CH_k(Y)` with `(g f)_* = g_* f_*`; for
`X` proper over `k`, `deg : CH_0(X) → ℤ` is well defined and `deg f_* = deg` (Fulton 1998, Theorem
1.4; Stacks, Sections 42.12, 42.20, 42.41 (02R3, 02S0, 0AZ0)); without properness pushforward fails
(`𝔸¹ → Spec k`: the point class is `∼ 0` on `𝔸¹` and has degree `1`). Construct
*Chow.flatPullback*: for
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
(02RV)). This subsection owns `chow_affine_bundle`: for the total space `p : E → X` of a finite
locally free sheaf of constant rank `r` (AlgebraicVectorBundles L2B; *Chow.totalSpace*, *Chow.HasRank*),
`p^* : CH_k(X) → CH_{k+r}(E)` is an isomorphism. Construct surjectivity here by localization and
the affine case (Fulton 1998, Proposition 1.9); construct injectivity using the projective
completion `ℙ(E ⊕ 1)` and §5.4's projective bundle theorem (Theorem 3.3(a); Stacks,
Lemma 42.36.3 (02TY), with the dual convention of this layer). This construction
precedes and uses no Gysin map. §5.5 consumes this isomorphism and identifies its inverse with
zero-section Gysin. *Needs:* §5.1 and, for injectivity, §5.4 (which uses only the pushforward,
flat-pullback and localization targets here); Mathlib `AlgebraicCycle.map`, `IsProper`, `Flat`,
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
free of constant finite rank. The projective-bundle formula for Segre classes applies to positive
rank. In rank zero define `s₀(0)=c₀(0)=id` and `s_i(0)=c_i(0)=0` for `i>0`;
`ℙ(0)=∅` does not compute the constant term by pushforward. Chern classes of coherent sheaves
are defined only on smooth quasi-projective schemes through §5.7's `K_0`. API: `vanishing` (`c_i(E) = 0` for `i > rank`),
`commutativity`, `projection_formula`, `pullback`, `whitney_sum` (`c(E) = c(E') c(E'')` for a short
exact sequence), `splitting_principle` (there is a flat `f : X' → X` with `f^*` injective on `CH_*`
and `f^* E` carrying a filtration with invertible quotients; Fulton, §3.2), `chernCharacterOp` and
`toddClassOp` (`ch(E) = Σ e^{x_i}`, `td(E) = ∏ x_i/(1 − e^{−x_i})` as operators on `CH_*(X)_ℚ` by
the splitting principle, graded by degree, with `td_1 = c_1/2` and `td_2 = (c_1² + c_2)/12`),
`c1_eq` (agreement with §5.3 in rank one). *Needs:* §0.3, §5.2, §5.3; AlgebraicVectorBundles
L0B–L0C, L2A–L2B; StableReduction Layer 2.

**Checks.**
- `test_rank_zero_chern`: on `Spec k`, `ℙ(0)=∅`, `s₀(0)=c₀(0)=id` and all positive
  classes vanish; Whitney sum with `0` gives `c(E ⊕ 0)=c(E)`.
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

- `rank_free`, `rank_empty`, `rank_unique`: the native free sheaf on `Fin r` has rank `r`;
  all ranks hold on the empty scheme; a sheaf cannot have two different constant ranks on a
  nonempty scheme. These test `HasRank` against `SheafOfModules.free` (Stacks, Section 17.14).
- `totalSpace_rank_zero`, `totalSpace_empty`, `totalSpace_line_over_field`: the rank-zero projection
  is an isomorphism, the total space on the empty scheme is empty, and a rank-one bundle on
  `Spec K` is `Spec K[t]` over `Spec K` (Fulton, §3.3). Both `totalSpace` and its projection are
  tested as objects over the base.

### 5.5 Normal cones, deformation to the normal cone and refined Gysin maps

Define the normal cone `normalCone i := Spec_X (⊕ I^n/I^{n+1})` of a closed immersion `i : X → Y`
with ideal `I` (relative Spec of the Rees quotient algebra, §0.2 and Mathlib's `reesAlgebra`), the
conormal sheaf `conormal i = I/I²` on the native quasicoherent carrier, and the
normal bundle `normalBundle i := ((AlgebraicVectorBundles.linearSpecScheme X).obj (op (conormal i))).obj`
with its projection in `Over X`, for `i` a regular immersion (`I` locally generated by a
regular sequence, Mathlib's `RingTheory.Sequence.IsRegular`). Prove `conormal_regular`
and `normalBundle_dual_conormal`: this relative spectrum is canonically the owner's
`totalSpaceScheme` of `(I/I²)∨`, by finite locally free biduality. Prove `normalCone_eq_normalBundle` for
regular immersions and `normalCone_pullback` for the base change `X' = X ×_Y Y'` (`C_{X'} Y' ⊆ f^*
N_X Y`). Here `N` as a sheaf always means `(I/I²)∨`; the excess sheaf is
`f^*((I/I²)∨) / (I'/I'²)∨`. The determinant and top Chern class in self-intersection
are those of this normal sheaf. In particular `c₁(N) = −c₁(I/I²)` for a Cartier divisor.
These conventions also identify the normal sheaf of the zero section of `E` with `E`
(Fulton, §4.1 and Theorems 6.2–6.3). Construct `deformationToNormalCone i`: the blow-up `M := Bl_{X × {∞}} (Y × ℙ¹)` minus the
strict transform of `Y × {∞}`, flat over `ℙ¹`, with fibre `Y` over `0` and `C_X Y` over `∞`
(StableReduction Layer 4's blow-up). The construction inside this subsection has the
following order (Fulton 1998, §5.2; Stacks, §42.29 (02T7)):

1. Construct `cartierIntersection` on supported Chow groups from divisor orders,
   using the restricted divisor line on components lying in the divisor. Prove
   descent through rational equivalence and `cartierIntersection_supported_zero`
   for a Cartier divisor with trivial normal line, independently of general Gysin.
2. Pull `α ∈ CH_k(Y)` back along the flat projection `Y × A¹ → Y` on the
   complement of the special fibre. This class lies in `CH_{k+1}(Y × A¹)`.
3. Use §5.2's localization surjectivity to choose a lift in `CH_{k+1}(M)`.
4. Intersect the lift with the special Cartier fibre. Prove
   `specialization_independent_lift`: replacing a lift by `lift + (i_∞)_*β`
   has no effect, since the special fibre's normal line is trivial.
5. Define general refined Gysin only after this specialization, the normal-cone
   embedding and vector-bundle homotopy invariance are available.

The equivalent cycle construction `specializationCycle` takes each integral
support `W` to the special fibre of the closure of `W × A¹` in `M`, with
scheme-theoretic multiplicities, and extends to locally finite cycles.
`specializationCycle_ratEquiv` proves descent; `specialization` is the induced
quotient homomorphism, with `specialization_cycleClass` and
`specialization_pullback` for flat morphisms of fixed pure relative dimension.
Prove `specialization_eq_cartier_lift` for every lift of the open flat pullback,
`specialization_pushforward` for proper maps of closed pairs, and
`specializationCycle_locallyFinite` for locally finite input supports. No pullback along `M → Y`
is used: that morphism need not be flat. Use the locally finite rational equivalence of §5.1
throughout. Here `homotopy_invariance` is an alias for §5.2's `chow_affine_bundle`, on the same
*Chow.totalSpace* and *Chow.HasRank* carriers; its inverse is supplied before Gysin is defined.
After constructing Gysin, prove *zeroSection_gysin_eq_homotopy_inverse*: for the zero section of
a constant-rank vector bundle, its Gysin map is this inverse (Fulton 1998, Chapter 6). Define the
external product `Chow.externalProduct : CH_k(X) ⊗ CH_l(Y) → CH_{k+l}(X ×_{Spec κ} Y)` over the fixed field `κ`, with
`external_product_pushforward` and `_pullback` (Fulton 1998, §1.10). Define `Chow.IsRegularImmersion
i d` for a closed immersion `i`: around every point the ideal of `i` is generated by a regular sequence of length `d`, and the
refined Gysin map `Chow.gysin i f : CH_k(Y') → CH_{k−d}(X')` for such a closed `i : X → Y` with normal
bundle `N` and any `f : Y' → Y`, `X' := X ×_Y Y'`: specialise to the normal cone `C_{X'} Y' ⊆ f^* N`
and apply the inverse of `homotopy_invariance` for `f^* N` (Fulton 1998, §6.1; Stacks, Section 42.54
(0FBI)); `i^* := i^!` for `f = 𝟙`. Hypotheses: `i` regular of constant codimension `d`; no
hypothesis on `f`. API: `pushforward_compat` (`i^! g_* = g'_* i^!` for `g` proper),
`pullback_compat` (for `g` flat), `commutes_with_c1`, `excess_intersection` (`i^! α = c_{d−d'}(f^* N
/ N') ∩ i'^* α` when `i' : X' → Y'` is regular of codimension `d'`; Fulton, Theorem 6.3),
`functoriality` (`(j i)^! = i^! j^!`; Theorem 6.5), *divisor_case* (agreement with §5.3 for `d =
1`), `gysin_self_intersection` (`i^! i_* α = c_d(N) ∩ α` for `α ∈ CH_*(X)` and
`N = N_{X/Y}` on `X`) (Fulton 1998, Theorems 6.2, 6.3, 6.5). *Needs:*
§0.2, §0.3, §5.2, §5.3, §5.4; Mathlib `reesAlgebra`, `RingTheory.Sequence.IsRegular`; StableReduction Layer
4; AlgebraicVectorBundles L2B.

A regular immersion need not be closed. It is an immersion `i : X → Y` that is a closed regular
immersion into some open `U ⊆ Y`, and the condition does not depend on `U` (Stacks, Definition
31.22.1 (063J)). The diagonal of a smooth scheme that is not separated, and the graph of a morphism
to such a scheme, are of this kind (§5.6). Extend `Chow.gysin i f` to such `i` of constant
codimension `d` as follows.
- Choose an open `U ⊆ Y` in which `i(X)` is closed, for instance the complement of
  `closure(i(X)) ∖ i(X)`, and let `i_U : X → U` be the induced closed regular immersion.
- Put `U' := f⁻¹(U)`, so that `X' = X ×_U U'`, and set
  `Chow.gysin i f := Chow.gysin i_U (f|_{U'}) ∘ res`. Here `res : CH_k(Y') → CH_k(U')` is flat
  pullback along the open immersion (§5.2).
- The normal bundle of `i` is that of `i_U`.

Prove `gysin_open_independent`: two such opens `U_1`, `U_2` give the same map. Indeed `U_1 ∩ U_2`
is a third such open, `i_{U_j}` base changes to `i_{U_1 ∩ U_2}` along `U_1 ∩ U_2 → U_j`, and
`pullback_compat` for that open immersion identifies the composites. For `U = Y` the extension is
the closed construction.

Prove `gysin_immersion_api`: `pushforward_compat`, `pullback_compat`, `commutes_with_c1`,
`excess_intersection` and `functoriality` hold for regular immersions. Each identity is checked on
an open of the ambient scheme in which every immersion of the statement is closed. For
`X → Y → Z`, take `Z` minus `closure(Y) ∖ Y` and `closure(X) ∖ X`. Restriction to an open is flat
pullback, which commutes with proper pushforward in cartesian squares, with flat pullback and with
`c_1` (§§5.2–5.3). `gysin_self_intersection` stays a statement about closed immersions, since `i_*`
needs `i` proper. Source: Stacks, Section 42.59 (0FEZ), whose regular immersions are these
immersions; Definition 42.59.4 (0FF3); Lemma 42.59.3 (0FF2).

**Checks.**
- `gysin_open_immersion`: `j : 𝔾_m = A¹ ∖ {0} → A¹` is a regular immersion of codimension zero
  and is not closed. With `U = 𝔾_m`, `j^!` is restriction `CH_*(A¹) → CH_*(𝔾_m)`, sending `[A¹]`
  to `[𝔾_m]` and `[0]` to `0`.
- `gysin_open_independent_double_cover`: take the origin `i : {0} → A¹`, refined along
  `f : A¹ → A¹`, `z ↦ z²`, so that `X' = Spec k[z]/(z²)`. The opens `U = A¹` and `U = A¹ ∖ {1}`
  give the same `i^![A¹] = [X'] = 2[pt]` in `CH_0(X')`. In the second case the preimage `U'` omits
  the roots of `z² = 1`.
- `gysin_open_functoriality`: for `{1} → 𝔾_m → A¹`, the composite is the closed point and
  `(j i)^![A¹] = [1]`. Also `i^! j^![A¹] = i^![𝔾_m] = [1]`, an instance of `functoriality` with a
  factor that is not closed.
- `cartierIntersection_supported_lift`: adding `i_*β` to a lift leaves the
  intersection unchanged when the Cartier normal line is trivial.
- `cartierIntersection_empty`: the supported map for the empty divisor is zero.
- `cartierIntersection_affine_origin`: intersection with the origin of `A¹_κ`
  identifies `CH₁(A¹_κ)` with `CH₀(Spec κ)` with positive multiplicity one.
- `specializationCycle_identity`, `specialization_identity`: specialization for
  the identity immersion is bijective on cycles and Chow groups.
- `specializationCycle_empty`, `specialization_empty`: an empty centre gives zero maps.
- `specializationCycle_affine_origin`, `specialization_affine_origin`: the fundamental
  one-cycle of `A¹_κ` specializes nontrivially to its normal line and induces an
  isomorphism on `CH₁`.
- `deformation_origin_plane_not_flat`: in the origin-in-`A²` deformation chart,
  `κ[x,y] → κ[t,a,b]`, `x ↦ ta`, `y ↦ tb`, induces a nonflat morphism.
  Modulo `x`, the nonzero class of `a` annihilates `y`; there is no flat
  pullback along this projection.

- `conormal_identity`, `normalBundle_identity`: the identity has zero conormal sheaf
  and the normal-bundle projection is an isomorphism.
- `conormal_hyperplane`, `normalBundle_hyperplane`: for the standard line
  `D = ℙ¹ ⊂ ℙ²` cut out by the third homogeneous coordinate, `I/I² = O_D(−1)`
  and the normal sheaf is `O_D(1)`. The Check uses the graded coordinate
  quotient, checks that the conormal has no nonzero global section while its
  dual does, rejects self-duality, and compares the normal bundle
  over `D` with the owner's total space of its dual. Thus its determinant has
  degree `+1` and its first Chern class is the positive hyperplane class.
- `conormal_zero_section`, `normalBundle_zero_section`: for a non-self-dual line
  bundle `L`, the zero section of `totalSpace(L)` has conormal `L∨` and normal
  bundle `totalSpace(L)` over the base, including the example `L = O_{ℙ¹}(1)`.

- `test_normal_bundle_hypersurface`: for a hypersurface `D ⊆ Y`, `N = O(D)|_D`.
- `test_specialization_point`: for `X` a point of a curve `Y`, `σ[Y] = [N]`.
- `native_bundle_all_consumers`: a single finite locally free `E : X.Modules` on a proper curve over `κ`, with
  the owner’s constant-rank hypothesis, supplies `vectorBundleDegree`, the
  owner’s `totalSpaceScheme` projection, `homotopy_invariance` and `chernClass`.
  The rank predicates in Layers 3 and 5 are definitionally the owner’s predicate.
- `native_bundle_sections`: the total-space points are exactly the owner’s
  `totalSpaceHomEquiv`, with the same base projection and pullback of `E`.

- `test_homotopy_affine_line`: `CH_*(X × 𝔸¹) = CH_{*−1}(X)`.
- `test_transverse`: for transversal smooth `X, Y'` in `Y`, `i^! [Y'] = [X ∩ Y']`.
- `test_self_intersection_curve`: `deg i^* [C] = C · C` for a smooth curve on a smooth surface.
- `test_excess`: `i^! [X] = c_d(N) ∩ [X]`, not `[X]`.
- `test_zero_section`: for the zero section of a bundle, `s^!` is the inverse of flat pullback.

- `regularImmersion_identity`, `regularImmersion_empty`, `regularImmersion_nilpotent_point`:
  identity is regular of codimension zero; the condition on an empty source is vacuous; the
  residue point of `Spec K[ε]/ε²` is not a regular immersion of codimension one because `ε` is
  a zero divisor (Fulton, Appendix B.7).
- `normalCone_identity`, `normalCone_empty`, `normalCone_regular_point`: the cone projection of
  identity is an isomorphism, the cone on an empty source is empty, and the cone of a regular
  codimension-one `K`-point is the affine line over `K` (Fulton, §4.1). The last comparison is
  an isomorphism over the point and tests the projection as well as the scheme.

### 5.6 Intersection products on smooth varieties

Define *Chow.intersect*: for `Y` smooth of pure dimension `n` over `k` and `X, X' → Y` locally of
finite type over `k`, `α · β :=
δ^!(α × β) ∈ CH_{a+b−n}(X ×_Y X')` for `α ∈ CH_a(X)`, `β ∈ CH_b(X')`. Here `δ : Y → Y × Y` is the
diagonal, a regular immersion of codimension `n` because `Y` is smooth (Stacks, Lemma 37.62.18
(0FDP)). It is closed exactly when `Y` is separated over `k`, and `δ^!` is the extended Gysin map
of §5.5 (Stacks, Section 42.60 (0FBR)). `×` is the external
product of §5.5. For `X = X' = Y`, `A(Y) = ⊕ CH^p(Y)` is a commutative graded ring with unit `[Y]`
(Fulton 1998, §8.1, Proposition 8.1.1; Stacks, Section 42.62 (0FC0), which defines the product
`Δ^!(α × β)` for schemes locally of finite type over the smooth `Y`). Hypotheses: `Y` smooth over
`k`, `X` and `X'` locally of finite type over `k`; no separatedness is assumed. Without
smoothness the diagonal is not regular and the product is undefined.

Define `Chow.graphPullback f : CH_a(Y) → CH_{a+m−n}(X)`, that is `CH^p(Y) → CH^p(X)`, for a
morphism `f : X → Y` over `k` of smooth `k`-schemes of pure dimensions `m` and `n`.
- The graph `γ_f : X → X ×_k Y` is a section of the smooth projection to `X`, hence a regular
  immersion of codimension `n` (Stacks, Lemma 31.23.8 (067R)). It is closed when `Y` is separated
  over `k`, and in general only an immersion.
- Put `f^* y := γ_f^!(pr_Y^* y)`. Here `pr_Y : X ×_k Y → Y` is flat of relative dimension `m`,
  `pr_Y^* y = [X] × y`, and `γ_f^!` is the extended Gysin map of §5.5.
- This is the Gysin map `γ_f^! ∘ pr_Y^*` of the local complete intersection morphism `f` (Stacks,
  Definition 42.59.4 (0FF3)). It does not depend on the smooth factorization (Lemma 42.59.3
  (0FF2)), and for flat `f` it is flat pullback (Lemma 42.59.5 (0FF4)).
- Fulton 1998, §8.1, builds the refined product through the same graph.

API: `assoc`, `comm`, `one`, `pullback_ring_hom` (`Chow.graphPullback f : A(Y) → A(X)` is a ring
map; Proposition 8.3 (a)), `projection_formula` (`f_*(f^* x · y) = x · f_* y` for `f` proper;
Proposition 8.3 (c)), `c1_eq_mul` (`c_1(L) ∩ α = c_1(L) · α`), `proper_intersection` (for `V`, `W`
meeting properly, `[V] · [W] = Σ_Z i(Z; V · W)[Z]` with positive multiplicities; Proposition 8.2),
`intersect_gysin` (for a regular immersion `i : X → Y` of smooth `k`-schemes,
`Chow.graphPullback i = i^*`; Lemma 42.59.3 compares the factorizations `𝟙_Y ∘ i` and
`pr_Y ∘ γ_i`). *Needs:* §5.1, §5.2, §5.3, §5.4, §5.5; Mathlib `Smooth`.

**Checks.**
- `test_pn_ring`: `A(ℙ^n) = ℤ[h]/(h^{n+1})` with `deg h^n = 1`.
- `test_bezout`: plane curves of degrees `d`, `e` without common components meet in `de` points
  counted with multiplicity.
- `test_graph_diagonal`: on `C × C` for a smooth proper curve of genus `g`, `Δ² = 2 − 2g`, and for a
  morphism `f : C → C` with transversal fixed points, `Γ_f · Δ = #Fix(f)` (Fulton, §8.1).
- `test_cone`: on the cone over a smooth quadric surface, no ring structure on `CH_*` extends the
  intersections of the two rulings integrally (`CH_*` of a non-smooth variety has no product).
- `diagonal_doubled_origin_not_closed`: let `L` be `A¹_k` glued to itself along `A¹ ∖ {0}`, with
  origins `0₁` and `0₂`. It is smooth of pure dimension one and not separated. On the chart
  `A¹ × A¹` of `L × L` given by the two copies, the diagonal is `{(t, t) : t ≠ 0}`, and its
  closure contains `(0₁, 0₂)`. So `δ_L` is a regular immersion of codimension one that is not
  closed, and the closed construction of §5.5 does not apply to it. It is closed in
  `U = L × L ∖ {(0₁, 0₂), (0₂, 0₁)}`, through which `Chow.intersect` on `L` is defined.
- `diagonal_doubled_origin_unit`: `[0₁] · [L] = [0₁]` in `CH_0({0₁})`. The product cycle
  `{0₁} × L` passes through `(0₁, 0₂)`, a point of the closure of the diagonal that is not on it.
  Restriction to `U` removes that point. What remains meets the diagonal transversally at
  `(0₁, 0₁)`.
- `diagonal_line_closed`: for the separated `A¹_k` the diagonal `V(x − y) ⊆ A²` is closed. The
  open `U = A¹ × A¹` is allowed, and the extension is the closed construction of §5.5. Here
  `[0] · [A¹] = [0]` and `[A¹] · [A¹] = [A¹]`.
- `graphPullback_flat_projection`: for `pr_1 : ℙ¹ × ℙ¹ → ℙ¹`, `Chow.graphPullback pr_1 [p]` is
  `[{p} × ℙ¹]`, the flat pullback.
- `graphPullback_constant`: for the constant map `f : ℙ¹ → ℙ¹` with value `p`, `f^*[p] = 0` in
  `CH^1(ℙ¹)`, although `f⁻¹(p) = ℙ¹`. The excess normal bundle is `f^*T_pℙ¹`, which is trivial,
  so `excess_intersection` gives `c_1(O) ∩ [ℙ¹] = 0`. This agrees with `f^*[q] = 0` for `q ≠ p`,
  since `[p] = [q]`.
- `graphPullback_nonseparated_target`: for the inclusion `j_1 : A¹ → L` of the first chart, the
  graph `γ_{j_1} : A¹ → A¹ × L` is not closed: its closure contains `(0, 0₂)`. So
  `Chow.graphPullback j_1` needs the extended Gysin map. It is restriction to the chart. On
  cycles it sends `[L]` to `[A¹]`, `[0₁]` to `[0]` and `[0₂]` to `0`.

### 5.7 Coherent and perfect classes: `K_0`, `G_0` and the K-theoretic pushforward

Define `Chow.K0 X` and `Chow.G0 X` by specialization of
[GrothendieckEulerForms](../GrothendieckEulerForms/README.md) Layer 2's exact Grothendieck group,
using the induced exact structures on the extension-closed full subcategories of finite locally
free and finitely presented module sheaves, respectively. Use AlgebraicVectorBundles L0B's
`FiniteLocallyFreeSheaf X` and the native finitely presented sheaf carrier; on Noetherian `X`
the latter is the abelian category of coherent sheaves. Conflations are exactly the ambient
short exact sequences with terms in the chosen subcategory. The Lean interfaces
`Chow.finitelyPresentedExact` and `Chow.finiteLocallyFreeExact` specialize
`TauCeti.ExactStructure.abelian` via `ExactStructure.fullSubcategory`; `K0` and `G0` are
`TauCeti.ExactK0` of these structures, with no second quotient presentation.
Compare the Noetherian `G0` specialization with the owner's abelian-category construction,
identifying sheaf classes and exact-sequence relations. Consume GrothendieckEulerForms Layer 3
for finite-resolution comparison, with the finite locally free resolutions built here under
the regularity and resolution-property hypotheses below. The geometric API here gives `K0`
a commutative ring under `⊗`, with `[O_X]=1`, and `G0` a `K0`-module. API: *K0.pullback* (`f^* : K_0(Y) → K_0(X)`, a ring map), *K0.rank*,
*K0.det* (the determinant homomorphism to the additive form of `Pic(X)`, using Tau Ceti's
`LineBundleClass X`, taking a line-bundle generator to its isomorphism class), `K0.toG0` (the natural map `[E] ↦ [E]` on a Noetherian `X`), *G0.additivity* (short
exact sequences), *Chow.kPushforward* (`f_! [F] := Σ (−1)^i [R^i f_* F]` for `f` proper with
Noetherian target, well defined by additivity and the finiteness of `R^i f_*` (§2.6), with
`(g f)_! = g_! f_!` by the Leray spectral sequence (§2.2); the higher direct images are coherent,
not assumed locally free, and a torsion coherent sheaf is a valid input), *G0.projection_formula*
(`f_!(f^* a · b) = a · f_! b` for `a ∈ K_0(Y)`), *G0.localization_sequence* (`G_0(Z) → G_0(X) →
G_0(U) → 0`), *G0.flat_pullback*. Define `Chow.HasResolutionProperty X`: every finitely presented
module is a quotient of a finite locally free one, and prove `resolutionProperty_of_quasiProjective`
(for `X` quasi-projective over `k`, from §2.6's `ample_serre_vanishing`). Prove
`K0.toG0_bijective`: for `X` Noetherian, regular (§4.13) and with the resolution property, every
coherent sheaf has a finite resolution by finite locally free sheaves (Stacks, Lemma 36.37.4), and
`K_0(X) → G_0(X)` is an isomorphism; hence for `f : X → Y` proper
between smooth quasi-projective varieties, `f_! : K_0(X) → K_0(Y)` is defined by transport, and for
`E` locally free `f_! [E] = Σ (−1)^i [R^i f_* E]` lands in `K_0(Y)` through that isomorphism, not in
the locally free sheaves themselves (SGA 6, Exposé 0, Appendice; Fulton 1998, §15.1, Example
15.1.8). Prove `K0.toG0_not_injective_of_det`: for Noetherian `X`, a class `a ∈ K_0(X)` with
`K0.toG0(a) = 0` and nontrivial determinant proves this map is not injective (the determinant
homomorphism of Fulton 1998, §15.1). Define `chernCharacter : K_0(X) → A(X)_ℚ` for `X` smooth of finite pure dimension (a ring map, by the splitting
principle, §5.4). For arbitrary smooth schemes locally of finite type use the degreewise
`chernCharacterOp` of §5.4. Define `chernClass_coherent` for coherent sheaves on smooth quasi-projective `X` as
`c(F) := c(Σ (−1)^i [E_i])` for a locally free resolution, independent of the resolution by
`K0.toG0_bijective` (Fulton 1998, §15.1, Example 15.1.5). *Needs:* §2.2, §2.6, §4.13, §5.4;
AlgebraicVectorBundles L0B; JacobianChallenge Layer B; StableReduction Layer 2;
GrothendieckEulerForms Layers 2–3 (`TauCeti.ExactK0` and finite-resolution comparison).

**Checks.**
- `test_K0_point`: `K_0(Spec k) = ℤ` by rank; `test_K0_pone`: `K_0(ℙ¹) = ℤ²` with basis `[O]`,
  `[O(−1)]`.
- `test_G0_nodal`: take the split irreducible cubic `C : y²z = x²(x + z)` over `ℂ`, with node
  `q`, normalization `ν : ℙ¹ → C` and the two points over `q`. For `λ ∈ ℂˣ`, `λ ≠ 1`, glue the
  fibres of `O_{ℙ¹}` at those points by `λ` to obtain `L_λ`. It is nontrivial: automorphisms of
  `O_{ℙ¹}` are constant scalars and cannot change `λ` (Stacks, Lemma 53.15.5 (0C1M)). The
  normalization sequences
  `0 → O_C → ν_*O_{ℙ¹} → k(q) → 0` and
  `0 → L_λ → ν_*O_{ℙ¹} → k(q) → 0` give `[L_λ] = [O_C]` in `G_0(C)`. In `K_0(C)` the
  difference has determinant `L_λ ≠ O_C`; it is a nonzero kernel class, so `K0.toG0` is not
  injective and not an isomorphism.
- `test_G0_nodal_skyscraper_image`: for `a` over `q` and `b` over a smooth point `p`,
  `[k(a)] = [k(b)]` in `G_0(ℙ¹)` by the rational-point divisor sequences. Finite pushforward
  gives `[k(q)] = [k(p)] = [O_C] − [O_C(−p)]` in `G_0(C)`, so the node's skyscraper class is
  in the image of `K0.toG0`.
- `test_G0_nodal_nonperfect`: the completed local ring at the node is `ℂ[[u,v]]/(uv)`.
  Its residue field has a minimal free resolution starting with `(u v)` and continuing with
  alternating `diag(v,u)` and `diag(u,v)`. This infinite minimal tail precludes finite projective
  dimension, in agreement with Stacks, Proposition 10.110.5 (00OC). Faithfully flat completion
  thus rules out a finite locally free resolution of the skyscraper on `C`, despite the
  preceding class equality.
- `test_K0_G0_skyscraper`: on a smooth curve the skyscraper at a point is `[O] − [O(−P)]` in
  `K_0`, and its Chern character does not depend on the resolution.
- `test_pushforward_pone`: for `f : ℙ¹ → Spec k`, `f_! [O(n)] = n + 1` in `K_0(Spec k) = ℤ`.
- `test_chernCharacter_line`: on a smooth scheme of finite pure dimension, `ch(L) = e^{c_1(L)}`.
- `test_chernCharacter_unbounded_dimension`: on `X=⨿_{n≥0} ℙⁿ_k`, with `L|_{ℙⁿ}=O(1)`,
  each degree `ch_i(L)` is nonzero on some component. These degreewise classes do not give an
  element of the uncompleted direct sum over all degrees.
- `resolutionProperty_doubled_plane_rejected`: glue two copies of `A²_k` away from the origin.
  For any vector bundle, its restrictions `E₁,E₂` to the two planes are identified on
  the punctured plane. Their finite locally free Hom sheaves have depth two at the origin;
  §0.6's coherent Hartogs extends the identification and its inverse to the whole plane.
  The compositions are identity by the same uniqueness. A morphism to the coherent ideal
  of only the first origin is, on that plane, a morphism `E₁ → (x,y) ⊂ O`.
  Transport it through the extended identification. Hartogs uniqueness for `E₂^∨` forces
  the morphism on the second plane to have image in `(x,y)` as well. It cannot surject
  onto the stalk `O` at the second origin, so this ideal is no quotient of any vector bundle.
  This regular Noetherian scheme fails the resolution property (Thomason–Trobaugh,
  *Higher algebraic K-theory of schemes and of derived categories*, Exercise 8.6;
  [Hoyois, Algebraic K-theory, Lecture 21](https://hoyois.app.uni-regensburg.de/SS20/ktheory/lect21.pdf)).
- `resolutionProperty_affine`: `Spec A` has the resolution property for every ring `A`: a finitely
  presented module is `M~` with `M` a finitely presented `A`-module, a quotient of some `A^n`.
- `resolutionProperty_empty`: the empty scheme has the resolution property, every module on it
  being zero.
- `resolutionProperty_quasiProjective`: `ℙ¹_k`, which is not affine, has the resolution property:
  a finitely presented `F` is a quotient of `O(−n)^m` for `n ≫ 0` (the case of
  `resolutionProperty_of_quasiProjective`).

*Lean:* `Chow.HasResolutionProperty`, `Chow.G0`, `Chow.K0` (as additive groups), `Chow.K0.toG0`
(defined by `[E] ↦ [E]`), `Chow.K0.det`, `Chow.K0.toG0_not_injective_of_det`,
`Chow.K0.toG0_bijective` (for `X` Noetherian with regular local rings
and the resolution property), with `resolutionProperty_affine`, `resolutionProperty_empty` and
`resolutionProperty_quasiProjective` as `example`s.

**Chow blow-up decomposition — `chow_blowup_formula`.**
For smooth quasi-projective `Y` over `k` and a smooth closed centre `i:X↪Y` of constant
positive codimension `d`, let `p:Bl_X Y→Y`, `j:E↪Bl_X Y`, `q:E→X`, and
`ξ=c₁(O_E(1))`. Construct the isomorphism
`CH_k(Y) ⊕ ⨁_{i=1}^{d−1} CH_{k−i}(X) ≃ CH_k(Bl_X Y)` sending
`(α,(β_i))` to `p^*α + Σ_i j_*(ξ^(d−1−i) ∩ q^*β_i)`.
Here `p^*` is §5.6's pullback between smooth schemes, not flat pullback;
`q^*` is flat of relative dimension `d−1`. The first inverse component is `p_*`;
extract the exceptional components by the projective bundle decomposition of `j^*`
with `j^*j_*=-ξ`, subtracting components in descending powers of `ξ`.
Prove these maps are inverse, using localization, the excess formula and the
projective bundle relation. Source: Fulton 1998, Theorem 6.7, combined with
§3.3's projective bundle formula. *Needs:* §§5.2–5.6; StableReduction Layer 4's blow-up.

**Checks.**
- For `d=1` the exceptional sum is empty and blowing up a Cartier divisor is an
  isomorphism; the map is `p^*` with inverse `p_*`.
- Blowing up a rational point of `ℙ²` gives `CH₁=ℤ·H ⊕ ℤ·E` and
  `E²=−1`; the exceptional generator is exactly `j_*[E]`.
- Blowing up a rational point of `ℙ³` adds one `ℤ` in each of dimensions one and two;
  its exceptional terms are `j_*(ξ∩[ℙ²])` and `j_*[ℙ²]`, respectively.

### 5.8 Grothendieck–Riemann–Roch and Hirzebruch–Riemann–Roch

Prove `grothendieck_riemann_roch`: for `f : X → Y` projective between smooth quasi-projective
varieties over `k` and `α ∈ K_0(X)`, `ch(f_! α) · td(T_Y) = f_*(ch(α) · td(T_X))` in `A(Y)_ℚ`, with
`f_!` the K-theoretic pushforward of §5.7, `ch` and `td` the Chern character and Todd class of
§5.4 (through the splitting principle and `K_0(X) = G_0(X)`), and `f_*` the proper pushforward of
§5.2 on `A(Y)_ℚ`; proof halves: projective bundles `ℙ^n_Y → Y` and closed immersions through
deformation to the normal cone (§5.5) and §5.7's `chow_blowup_formula` (Fulton 1998, Theorem 15.2, §15.2;
Stacks, Section 42.66 (02UO), states the case of a proper smooth `f` and a locally free `E` whose
higher direct images are locally free, with the relative tangent bundle `T_{X/Y}`). Prove `hirzebruch_riemann_roch`: for `X` smooth projective of dimension
`n` and `E` locally free, `χ(X, E) = deg (ch(E) · td(T_X))_n` (Fulton 1998, Corollary 15.2.1), and
its instances: Riemann–Roch for curves (§3.3) and for surfaces (§5.10). Hypotheses: `X`, `Y` smooth
quasi-projective; `f` projective; `ℚ`-coefficients. *Needs:* §2.2, §2.6, §4.11, §5.2, §5.4, §5.5,
§5.7, including `chow_blowup_formula`; StableReduction Layers 2, 4.

**Checks.**
- `test_grr_point`: for `X → Spec k` and `E` locally free, GRR is HRR.
- `test_hrr_curve`: `χ(E) = deg E + r(1 − g)` on a curve (§3.3).
- `test_hrr_pn`: `χ(ℙ^n, O(d)) = binom(n + d, n)`.
- `test_grr_closed_immersion_divisor`: for a smooth divisor `i : D → X`, `ch(i_* O_D) = 1 −
  e^{−[D]}`.

### 5.9 Surfaces: the relative intersection pairing and the comparison with arithmetic surfaces

**Surface pairing.** *surface_pairing*
Provides the characteristic-zero divisor/curve intersection as the degree of the restricted
line bundle on the normalization.
Supplied by AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)).
The supplier uses integral projective curves over an algebraically closed characteristic-zero
field and normalized degree; compare that degree with §3.3's Euler degree before using the
surface pairing, and retain arbitrary-field local-length and arithmetic formulas here.

Define `Chow.intersectionNumber C D := deg(c_1(O(C)) ∩ c_1(O(D)) ∩ [S]) ∈ ℤ` for `S` smooth
projective over a field `k` and `C`, `D` divisors (through `Pic(S)`, §5.3), and prove
that it is the unique symmetric bilinear form on `Pic(S)` with `C · D = Σ_{P ∈ C ∩ D}
[κ(P) : k]` for transversal smooth curves, and `C · D = Σ_P [κ(P) : k] · length
O_{S,P}/(f, g)` for curves without common components (Hartshorne 1977, V.1, Theorem 1.1).
For integral `C`, identify `C · D` with §3.3's residue-weighted Euler degree
`deg_C(O(D)|_C)`: in the algebraically closed characteristic-zero case consume
AbundanceStatement §4A / items 2–4 through the Euler/normalized-degree bridge above;
over other fields prove the retained degree comparison (Hartshorne 1977, V.1, Proposition 1.4).
Define the **relative intersection pairing** on a regular scheme `S` of dimension two proper
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

- `intersection_trivial`, `intersection_inverse`: the trivial bundle pairs to zero, and
  inversion negates the pairing, in agreement with bilinearity on `LineBundleClass`
  (Fulton, §2.5). Together with symmetry these test the surface pairing.

### 5.10 Adjunction, Riemann–Roch on surfaces, Noether's formula, numerical equivalence, Hodge index

For `S` smooth projective over an algebraically closed field `k` with canonical class `K` (the
class of `Ω²_S`, `ω_S` of §2.20): prove `adjunction`: `2p_a(C) − 2 = C · (C + K)` for an integral
curve `C ⊆ S` with `p_a` its arithmetic genus (Hartshorne 1977, V.1, Proposition 1.5 for smooth `C`,
Exercise 1.3 for the `p_a` form); `surface_riemann_roch`: `χ(O(D)) = ½ D · (D − K) + χ(O_S)` with
Serre duality `h²(D) = h⁰(K − D)` from §2.20 (Hartshorne 1977, V.1, Theorem 1.6, Remark 1.6.1); and
**Noether's formula** in the form `12 χ(O_S) = K² + deg c_2(T_S)` with `c_2(T_S)` the second Chern
class of §5.4, an instance of Hirzebruch–Riemann–Roch (§5.8) for `E = O_S` (Fulton 1998, §15.2,
Example 15.2.2); the identification of `deg c_2(T_S)` with the ℓ-adic Euler characteristic `Σ (−1)^i
dim H^i(S, ℚ_ℓ)` is a downstream étale Gauss–Bonnet comparison, for a smooth proper surface over algebraically closed `k`
and `ℓ` invertible in `k`. Noether's algebraic formula here uses §5.8 independently of this
étale comparison.

**Numerical equivalence.** *Chow.NumericallyEquivalent* / *Num*
Provides one numerical divisor quotient and its induced pairing for smooth projective surfaces
`S` over algebraically closed fields of any characteristic (Fulton 1998, §19.1).
This subsection owns `Chow.NumericallyEquivalent D D' := ∀ C, D · C = D' · C` on `Pic(S)` and
`Num S := Pic(S)/≡`, with the descended pairing. Testing on all divisor classes agrees with
testing on integral curves, since on a smooth surface these curves are Cartier divisors and
generate the divisor group. The definitions do not depend on characteristic, and both
`hodge_index` and `hodge_index_signature` use this single carrier.

AbundanceStatement §4B / item 1 supplies the characteristic-zero Cartier quotient and its
integral, rational and real comparisons. Here prove *numericalQuotient_abundanceComparison*:
identify Cartier divisors modulo principal divisors with `Pic(S)` and compare numerical
relations through §5.9's bridge to AbundanceStatement §4A / items 2–4; the induced isomorphism
from `Num S` to the supplier's integral quotient commutes with the pairing and rational/real
scalar extension (AbundanceStatement §4B / item 1; Fulton 1998, §19.1). The characteristic-zero
import is transported along this comparison; it does not define a second surface quotient.

**Numerical Néron–Severi finiteness.** *Num.free_finiteRank*
Provides finite generation of the characteristic-zero numerical divisor group and
finite-dimensionality of its real span.
Supplied by AbundanceStatement §4B / item 2 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)).
The supplier proves finite generation for projective varieties over algebraically closed
characteristic-zero fields; torsion-freeness, integral freeness and positive-characteristic
surface finiteness are separate targets here.

Prove torsion-freeness of `Num S`: if `nD ≡ 0` with `n ≠ 0`, cancel `n` in each integer
intersection number to obtain `D ≡ 0`.
Prove finite generation for smooth projective surfaces over algebraically closed fields of
positive characteristic (the Néron–Severi theorem, Lang–Néron 1959, as cited in Hartshorne 1977,
V, the note to Exercise 1.7).
Combine this with torsion-freeness, using AbundanceStatement §4B / item 2 for finite generation
in characteristic zero, to obtain `Num.free_finiteRank`: `Num S` is free abelian of finite
rank, the Picard number `ρ`; `hodge_index` does not use this finiteness input.

Prove `hodge_index`: for `H` ample and `D` with `D · H = 0`, `D² ≤ 0`, with
equality iff `D ≡ 0`; hence on the real span of any finite set of classes orthogonal to `H` the
form is negative definite. Prove `hodge_index_signature`, which takes `Num.free_finiteRank` as an
input, assembled from AbundanceStatement §4B / item 2 and torsion-freeness in characteristic zero,
and from the retained finiteness theorem and torsion-freeness in positive characteristic:
on `Num S ⊗ ℝ` the intersection form has signature `(1, ρ − 1)`. Proof inputs:
`surface_riemann_roch` with Serre duality, giving `h⁰(nD) + h⁰(K − nD) ≥ ½ n² D² + O(n)`, and the
ample-section estimate of Lemma 1.7 controlling the duality term `H⁰(K − nD)`.
For `D · H = 0`, `(K − nD) · H = K · H` is constant, so growing `n` does not
justify a vanishing claim (Hartshorne 1977, V.1, Lemma 1.7, Corollary 1.8, Theorem 1.9); the Hodge
inequality `(D · H)² ≥ D² H²` for `H` ample follows (Exercise 1.9).

**Nakai–Moishezon.** *nakai_moishezon*
Provides the Nakai–Moishezon ampleness criterion on characteristic-zero smooth projective surfaces.
Supplied by AbundanceStatement §4D / item 1 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)).
Specialize the supplier's subvariety intersection criterion to `D² > 0` and `D · C > 0`
using §5.9's intersection bridge and StableReduction Layer 2's ampleness convention,
retaining the positive-characteristic surface theorem here.

In positive characteristic prove `nakai_moishezon` afterwards and independently:
a divisor `D` on `S` is ample iff `D² > 0` and `D · C > 0` for every
integral curve `C ⊆ S` (Hartshorne 1977, V.1, Theorem 1.10; Kleiman 1966), with ampleness
StableReduction Layer 2's notion ("some power is very ample"); it is not an input to
`hodge_index`. *Needs:* §2.20, §3.3,
§5.4, §5.8, §5.9; StableReduction Layer 2.

**Checks.**
- `test_adjunction_plane_curve`: a smooth plane curve of degree `d` has genus `(d − 1)(d − 2)/2`.
- `test_rr_pone_times_pone`: on `ℙ¹ × ℙ¹`, `χ(O(a, b)) = (a + 1)(b + 1)`.
- `test_noether_pone_times_pone`: `12 · 1 = 8 + 4`; `test_noether_p2`: `12 · 1 = 9 + 3`.
- `test_num_p2`: the single quotient on `ℙ²` identifies with `ℤ` and, in characteristic zero,
  with AbundanceStatement §4B / item 1's integral numerical group; `test_num_elliptic_product`:
  in characteristic zero, the same quotient of `E × E` over `k̄` agrees with that supplier's
  quotient of Picard number `3` or `4`; in positive characteristic a supersingular product has
  Picard number `6`, and `Num ≠ Pic`.
- `test_nakai_pone_times_pone`: in positive characteristic, `O(a, b)` is ample iff `a, b > 0`,
  testing the retained surface criterion.
- `test_hodge_pone_times_pone`: `D = (1, −1)` has `D · H = 0` for `H = (1, 1)` and `D² = −2 < 0`.
- `test_hodge_numerically_trivial`: a numerically trivial class gives equality `D² = 0` although it
  need not be trivial in `Pic`.
- `test_nakai_negative_ample`: in positive characteristic, `−H` for `H` ample has `(−H)² > 0`
  and fails the curve condition, testing the retained surface criterion.

- `numericalQuotient_scalarExtensions`: in characteristic zero, on `ℙ¹ × ℙ¹` the comparison
  identifies the fibre-class basis and the intersection matrix `[[0,1],[1,0]]` over `ℤ`, `ℚ`
  and `ℝ`, testing both scalar-extension squares and preservation of the pairing.
- `numerical_inverse`, `numerical_nonzero_pairing`: a numerically trivial class has numerically
  trivial inverse, whereas any nonzero pairing detects failure of numerical triviality
  (Fulton, §19.1). Together with `test_num_principal` these test `NumericallyEquivalent`.

### 5.11 The Weil bound via surfaces

Prove `weil_bound_via_surfaces`: for `C` a smooth projective geometrically irreducible curve of
genus `g` over `𝔽_q`, with `C̄ = C ×_{𝔽_q} 𝔽̄_q`, `S = C̄ × C̄`, `Γ ⊆ S` the graph of the `q`-power
Frobenius `F : C̄ → C̄` (§0.29 /
`qPowerFrobenius`, base-changed from `C/𝔽_q` so it fixes algebraic-closure scalars), `Δ` the
diagonal, and for a point `P ∈
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
one of its two routes; the curve-cohomological route is a downstream comparison retaining
smooth proper geometric connectedness and invertible `ℓ`. *Needs:* §5.6, §5.9, §5.10, §3.3;
§0.29 / `qPowerFrobenius`,
`iteratedSchemeFrobenius` (the relative `q`-power map after base change from `𝔽_q`);
Tau Ceti `WeierstrassCurve.hasse_bound`; AlgebraicCurves Layer 8.

**Checks.**
- `weilBound_intersection_table`: all products in (i)–(iv) as separate equalities. This geometric
  table needs a construction of `O(Γ)`, `O(Δ)` and the two fibre classes from a curve and its
  relative Frobenius, with Cartier-divisor and degree comparisons, which `intersectionNumber` (a
  pairing on line-bundle classes) does not supply. Those constructions are targets of
  §5.6, using the scheme map §0.29 /
  `qPowerFrobenius` after base change from the finite field. The statement `weilBound_normalized_intersections` checks
  the signed normalization on the surface pairing conditional on the geometric table; it does
  not assert that arbitrary four line-bundle classes come from this geometry.
- `weilBound_test_genus_zero`: at `g = 0`, the inequality `(N − (q + 1))² ≤ 0` forces
  `N = q + 1`; this is the arithmetic edge-case example, conditional on the geometric inequality.
- `weilBound_test_projective_line`: `g = 0`, `#ℙ¹(𝔽_q) = q + 1`.
- `weilBound_test_elliptic_hasse`: for `g = 1` the bound is `WeierstrassCurve.hasse_bound`.
- `weilBound_test_transversality`: at a rational point `(P, P)`, `T Γ = graph(dF) = graph(0)` and
  `T Δ` are complementary in `T_P C̄ ⊕ T_P C̄`.
- `weilBound_test_sharp`: the Hermitian curve `y^q + y = x^{q+1}` over `𝔽_{q²}` attains the bound.

*Lean:* `weil_bound` (the inequality `|#C(𝔽_q) − (q + 1)| ≤ 2g√q` for a smooth proper geometrically
integral curve over a finite field, with Tau Ceti's `X.genus k` and the rational points as sections
of the structure map). The intersection-theoretic proof and its tables are specified in this README only.

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
- `test_bezout_plane_curves`: two plane curves of degrees `d`, `e` with no common component meet in
  at most `de` closed points (the intersection is then finite and every closed point has degree `≥ 1`).
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
§0.29 / `qPowerFrobenius`,
`iteratedSchemeFrobenius` (§5.11 uses the finite-field map after base change);
AbundanceStatement §§4A–4B and §4D for the characteristic-zero
inputs identified in §§5.9–5.10.

## Downstream consumers

The perfectoid and adic roadmaps import henselization of pairs (§0.12), the excellence package
(§0.21) and the pro-étale site foundations (§2.17). EtaleCohomologyFoundations §§F.0–F.4 /
`VanishingCycles.constructibleEtale`, `VanishingCycles.etaleTateTwists`,
`VanishingCycles.universalHomeomorphismEtaleEquivalence`,
`VanishingCycles.finiteCoefficientCohomology`, `VanishingCycles.etaleBaseChange`,
`VanishingCycles.etaleProetaleAdicComparison` consume our sites and abelian D⁺ functors
(§§2.1–2.2), coefficient sheaves and Kummer theorem (§§2.9–2.11), universal-homeomorphism geometry
(§§0.23–0.23a) and pro-étale foundations (§2.17), retaining their finite/adic coefficient hypotheses.
FiniteFlatGroupsAndIntegralPadicHodgeTheory
consumes §0.29 for scheme Frobenius and constructs the group-specific Frobenius and Verschiebung.
DerivedModuleAlgebra constructs the full cotangent complex and derived module algebra downstream;
§4.6 here uses Mathlib's two-term complex. EtaleCohomologyFoundations constructs scheme
compactifications, Nagata existence and common refinements downstream.
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T2 /
`VanishingCycles.curveEndomorphismTrace` consumes
§§2.11, 2.16, 5.6 and 5.9 for smooth proper geometrically connected curves and invertible `ℓ`;
`VanishingCycles.etaleTraceFormulaFinite` uses our Noether normalization and dimension geometry.
ComplexComparisonPartII §§C6.3–C6.6 / `artinComparison`, `artinComparisonCompactSupport`,
`relativeArtinComparison`, `adicArtinComparison` consume the generic site/D⁺ foundations with
their finite-type complex, ctf and compact-support separatedness hypotheses.
AlgebraicModuliForArithmeticGeometry imports torsors and their classes (§1.15), algebraic stacks
(§§1.18–1.23), the Picard torsors of curves (§3.6) and projective bundles (§5.4).
NeronModelsAndSemistableAbelianVarieties imports formal functions and algebraization (§§4.9–4.10)
and the semistable alteration theorem (§4.20). EtaleDualityAndPerverseSheaves imports coherent
duality (§§2.18–2.21) and the pro-étale foundations. AbelianSchemesAndArithmeticModuli imports Chow
groups (§§5.1–5.8) and numerical equivalence through §5.10's comparison with
AbundanceStatement §4B / item 1 in characteristic zero and its retained positive-characteristic
extension. The Weil-conjectures roadmap imports the Weil bound
(§5.11). IntegralHeckeAndGaloisDeterminants imports `Ring.IsJapanese.of_complete_local` and
`Ring.IsNagata.of_complete_local` (§0.20) and `IsAzumaya.exists_etale_matrix_splitting` with its
finite-cover form (§2.22). JacobianChallenge Layer C's Grothendieck Picard construction consumes
`Scheme.Modules.Cohomology.formalFunctionsIso` from §4.9, after its own
proper-cohomology finiteness and coherent-pushforward prerequisites. The same
completion and coherent-cohomology carriers serve both sides. StableReduction
consumes nothing from this roadmap.

## References

- Stacks: *The Stacks Project*, https://stacks.math.columbia.edu (tags in parentheses).
- Cheng–Lian–Murayama: R. Cheng, C. Lian and T. Murayama,
  [*Projectivity of the Moduli of Curves*](https://par.nsf.gov/servlets/purl/10585475),
  Stacks Project Expository Collection, Chapter 1, especially §§1.5–1.7.
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
- Deligne 1985: *Le lemme de Gabber*, Astérisque 127,
  [§§3.3–3.7, pp. 137–140](https://www.numdam.org/item/AST_1985__127__131_0.pdf).
- Knudsen 1983, II: *The projectivity of the moduli space of stable curves, II:
  The stacks M_{g,n}*, Math. Scand. 52, 161–199,
  [Corollary 2.6 and Theorem 2.7, p. 179](https://journals.msp.org/mscand/article/download/1622/1621/1653).
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
- Milne, *Algebraic Groups* (2017), https://www.jmilne.org/math/Books/iAG2017.pdf.
- Milne LEC: *Lectures on Étale Cohomology* (v2.21),
  https://www.jmilne.org/math/CourseNotes/LEC.pdf.
- Milne 2008: *Abelian Varieties* (course notes v2.00),
  https://www.jmilne.org/math/CourseNotes/AV.pdf.
- The Tau Ceti roadmaps cited by name are those of https://github.com/TauCetiProject/TauCetiRoadmap.
