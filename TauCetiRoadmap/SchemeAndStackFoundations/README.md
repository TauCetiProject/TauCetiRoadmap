# Scheme, stack, cohomology and intersection foundations

This roadmap builds the general algebraic geometry that the arithmetic roadmaps of Tau Ceti
stand on and that neither Mathlib nor an existing Tau Ceti roadmap owns: relative Spec and Proj,
henselization of pairs and excellent rings, the morphism theory of schemes locally of finite
type; descent, algebraic spaces, torsors, quotients and algebraic stacks; sheaf cohomology on
sites, the comparison of the Zariski, Nisnevich, étale, fppf and pro-étale topologies, Brauer
groups, coherent Grothendieck duality and equivariant cohomology; the curve, divisor and Picard
theory that glues the existing curve roadmaps together; infinitesimal deformations, formal
schemes and algebraization, modifications, the moduli stack of stable pointed curves and de
Jong's alterations; and Chow groups with intersection products, Chern classes, Riemann–Roch and
the Hodge index theorem. Every object is defined on Mathlib's `AlgebraicGeometry.Scheme`;
every theorem names its hypotheses.

| Layer | Title | What it builds |
|---|---|---|
| [SF.0](#sf0) | Schemes and morphisms | relative Spec and Proj, coherent extension, finite-type morphisms, henselization, excellence, perfect schemes, ideal sheaves |
| [SF.1](#sf1) | Descent, algebraic spaces and stacks | fpqc/fppf descent, algebraic spaces, group spaces and torsors, quotients, algebraic and Deligne–Mumford stacks, moduli, Galois gerbs |
| [SF.2](#sf2) | Sites and scheme cohomology | site cohomology, quasi-coherent cohomology and supports, topology comparisons, ℓ-adic and pro-étale cohomology, coherent duality, Brauer groups, equivariant cohomology |
| [SF.3](#sf3) | Curves, divisors and Picard objects | models of curves, genus checks, degrees and duality on curves, Picard groups, groupoids and torsors, Abel maps, Tate modules |
| [SF.4](#sf4) | Deformations, formal schemes, models and alterations | lifting, deformation functors, formal schemes and algebraization, modifications, stable pointed curves, alterations |
| [SF.5](#sf5) | Intersection theory and Riemann–Roch | Chow groups, pushforward and pullback, Chern classes, intersection products, Riemann–Roch, surfaces and the Hodge index theorem |

```text
Mathlib schemes, Tau Ceti curves/models  →  SF.0  →  SF.1  →  SF.2  →  SF.3  →  SF.4
                                               SF.3, SF.2 (coherent duality)  →  SF.5
```

## Prerequisites and boundaries

- **Libraries.** Mathlib `6b7abb3c76` and Tau Ceti `a91d3aaf`. Mathlib supplies schemes, affine
  schemes, quasi-coherent modules, gluing, fibre products, the named morphism classes with
  their base-change stability, the fpqc/fppf/étale topologies with pseudofunctor descent, sheaf
  cohomology `Sheaf.H`, the small étale and pro-étale sites with ℓ-adic cohomology, algebraic
  cycles with pushforward, Azumaya algebras and the field Brauer group, formally smooth and étale
  algebras with the naive cotangent complex, adic completion, Proj and the Rees algebra. Tau Ceti
  supplies cohomology of `O_X`-modules, invertible sheaves and line-bundle classes, Weil and
  Cartier divisors on integral schemes, models over discrete valuation rings, fppf quotients of
  affine groups, continuous Galois cohomology with Hilbert 90 and the group structure on field
  Brauer groups. Items of either library are cited by declaration name and never rebuilt.
- **Tau Ceti roadmaps consumed.** AlgebraicVectorBundles (sheaves of modules and internal Hom,
  quasi-coherent algebras, relative Spec with its anti-equivalence, symmetric and graded algebras),
  AlgebraicCurves (function-field divisors, genus, Riemann–Roch,
  Hurwitz, constant-field extensions, the dictionary with regular projective curves),
  JacobianChallenge (line bundles, coherent curve cohomology, the Picard functor with a rational
  point, Jacobians, Abel–Jacobi), StableReduction (relative curves, nodal families, coherent
  curve theory and relative Proj of finitely generated algebras, blow-ups, intersection theory on
  arithmetic surfaces, stable and pointed stable reduction), ModularCurves (strict henselization,
  effective descent of affine schemes, finite quotients, Weil restriction, coarse schemes of finite
  quotient problems), ClassFieldTheory and ProfiniteCohomology (Brauer groups of fields and
  continuous cohomology), QuadraticFormInvariants (the field Brauer group as H²), and the
  following étale-cohomology inputs, which are explicit prerequisites expected from the pending
  CohomologicalPointCounting roadmap (TauCetiRoadmap pull request 196, not yet merged) and are not
  targets here: finite-coefficient étale cohomology, proper and smooth base change, cohomology
  with compact support, the ℓ-adic realization, Frobenius, the Artin comparison with Betti
  cohomology, and the Lefschetz trace formula.
- **Not built here.** Étale supports, the étale `f^!`, absolute purity and perverse sheaves
  (EtaleDualityAndPerverseSheaves); banded gerbes, Picard schemes over general bases and
  characteristic-zero resolution (AlgebraicModuliForArithmeticGeometry); Néron models
  (NeronModelsAndSemistableAbelianVarieties); the full cotangent complex (DerivedDeRhamCohomology);
  Néron–Severi groups (AbelianSchemesAndArithmeticModuli); perfect-site quotient stacks
  (GeometricSatakeAndFusion). These roadmaps import from this one and are never cited as inputs.
- **Interfaces consumed by the arithmetic roadmaps.** The crystalline, prismatic, analytic and
  ℓ-adic roadmaps consume this roadmap through comparison maps whose theorems they own; this
  roadmap fixes only its side of each interface. (i) Cohomology is Mathlib's `Sheaf.H` on the named
  site; the pro-étale ℓ-adic coefficient is `Scheme.ellAdicSheaf`, not a discrete constant sheaf;
  `Br′(X)` is the torsion of `H²_ét(X, G_m)`, distinct from the Azumaya Brauer group until SF.2f's
  comparison applies (Bhatt–Scholze 2014, Def. 6.8.1, Lemma 6.8.2). (ii) Over ℂ, algebraic de Rham to
  Betti cohomology (Grothendieck 1966, Thm. 1′) and finite-coefficient étale to Betti cohomology with
  its relative form (SGA 4 XVI, Thm. 4.1) are taken on SF.2's sites; over ℝ the Galois-equivariant Betti groups carry
  the sign twist (Benoist–Wittenberg 2020, §1.1; Benoist 2019, (1.1) and (2.16)). (iii) For `f : X → Y`
  proper and locally of finite type and torsion `Λ`, the comparisons `(Rf_*K)^ad ≅ Rf^ad_* K^ad` with
  adic spaces (Huber 1996, Thm. 3.7.2) and, in characteristic `p`, with diamonds (Scholze 2017,
  §§26–27) are taken on scheme–adic fibre products. (iv) `R lim_n RΓ_ét(X, Z/ℓⁿ)` with its Galois action is compared with
  pro-étale `Z_ℓ`-cohomology by derived completeness, and `lim H^q` replaces `H^q R lim` only under
  a stated `lim¹` vanishing (Bhatt–Scholze 2014, Def. 3.4.1, Prop. 3.4.2, Cor. 5.1.6). (v) Prismatic,
  crystalline and `A_inf` specializations (Bhatt–Scholze 2022, Thm. 1.8; Bhatt–Morrow–Scholze 2018,
  Thms. 14.3–14.5) and the `B_dR` comparison with its trace-normalized period line (Betts–Stix,
  Props. 3.19–3.21) are consumed with derived tensor products and Frobenius twists written out.
  (vi) Cycle classes `cl^r : CH^r(X) → H^{2r}_ét(X, Λ(r))`, `X` smooth over a perfect field and `n`
  invertible, are defined by the ℓ-adic roadmaps on T421 and T430 (Milne LEC, §23, Thm. 23.4),
  compatible with products, proper pushforward and Gysin maps.
- **Already stated or built elsewhere (removed from this roadmap).** A duplication sweep against
  the current roadmaps and the pinned Tau Ceti library removed the following targets; each is
  cited where it lives instead of being restated. T001, T004–T008, T011, T013 (quasi-coherent
  algebras, relative Spec with its universal property, anti-equivalence, pullback and base change,
  symmetric and graded algebras): Tau Ceti `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`,
  `CategoryTheory.CommMon.relativeSpec`, `TauCeti.AlgebraicGeometry.relativeSpec` (modules
  `TauCeti.AlgebraicGeometry.RelativeSpec.*`) and AlgebraicVectorBundles Layers L1A, L1B and L2A.
  T012: `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`. T024:
  `SheafOfModules.dual`, `SheafOfModules.monoidalClosed`
  (`TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed`) and AlgebraicVectorBundles
  L0B. T040: Mathlib `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing`,
  `LocallyOfFiniteType.jacobsonSpace`. T094: Mathlib `PerfectClosure`. T187:
  `TauCeti.AffineInvariantQuotient` (`TauCeti.AlgebraicGeometry.Quotient.Affine`,
  `TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine`) and ModularCurves Layer 0C. T306:
  `TauCeti.brauerCohomologyEquiv` (`TauCeti.Algebra.CrossedProduct.Comparison`) and
  QuadraticFormInvariants Layer 7B. T354: JacobianChallenge Layer D. T356:
  `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`,
  `weightedDegreeZeroQuotientAddEquivPicZero`, `picQuotientPicZeroAddEquivInt`
  (`TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero`) and StableReduction contract J-D.
  T396: ModularCurves Layer 0G. The finite-field case of T308 is
  `TauCeti.subsingleton_brauerGroup_of_finite` (`TauCeti.Algebra.BrauerGroup.Trivial`).
  Targets kept because only a piece exists, with that piece cited: T368 (ModularCurves 7D's
  `ArtinianTestAlgebra` is the case Λ = W(k)); T122 (Mathlib
  `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`); T218 and T228 (their helper lemmas are
  Mathlib's `Functor.relativelyRepresentable.of_diag`, `diag_iff`, `respectsIso`,
  `MorphismProperty.relative.rep`, `relative_map_iff` and `GroupExtension.rightHom_inl`); T236 and
  T238 (`CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH`,
  `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`); T338 (AlgebraicCurves 12B–12C own the
  regular projective model); T343
  (`SchemeWeilDivisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one`); T345–T347 and T349 (the
  rank-one, line-bundle and curve cases: `InvertibleSheaf.eulerDegree`,
  `InvertibleSheaf.eulerCharBelow_eq_relativeDegree_add_one_sub_genus`,
  `InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`,
  `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`); T388
  (`Module.dense_interior_freeLocus_of_finiteType`); T392
  (`TauCeti.AlgebraicGeometry.isRegularRing_iff_isRegularLocalRing_stalk_Spec`,
  `isRegularLocalRing_stalk_of_smooth`); T409 (`TauCeti.NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`);
  T422, T423, T432 and T435 (`SchemeWeilDivisor.classGroupAddEquivLineBundleClass`,
  `SchemeWeilDivisor.relativeDegree_principalDivisor`, `TauCeti.length_quotient_span_pair_comm`,
  `WeierstrassCurve.hasse_bound`).
- **Owned here for others.** Henselization of pairs (T113), the catenary and Cohen–Macaulay
  package (T069–T077), site-cohomology functoriality and étale cohomology of limits (SF.2a, SF.2d),
  Picard torsors (SF.3c), formal schemes and
  algebraization (SF.4b), deformation functors and Schlessinger's theorem (SF.4a), Hilbert and Quot
  schemes and Chow's lemma (SF.4c), the moduli stack of stable pointed curves with its finite
  projective cover (SF.4d), de Jong's alterations (SF.4e) and projective bundles with the splitting
  principle (T427) are planned here for the roadmaps that import them.

## Conventions

1. Rings are commutative with identity; the zero ring is allowed unless a target excludes it.
   Schemes, morphisms and opens are Mathlib's `Scheme`, `Scheme.Hom`, `Scheme.Opens` in a fixed
   universe; "Noetherian", "separated", "proper" and "smooth" are hypotheses written on the target
   that needs them, never folded into a definition.
2. Big sites are Mathlib's `zariskiTopology ≤ etaleTopology ≤ fppfTopology ≤ fpqcTopology` on
   the category of schemes (slices `Over S` for a base); small sites are `X.Etale` and `X.ProEt`.
   Cohomology is Mathlib's `Sheaf.H`; for `O_X`-modules it is Tau Ceti's `Scheme.Modules.Cohomology`.
   Every cohomological statement says which coefficient regime it is in (finite with torsion
   invertible, torsion without invertibility, p-torsion in characteristic p, G_m and smooth groups,
   quasi-coherent, ℓ-adic/rational) and never transports a result across regimes without a named
   comparison.
3. Stacks are pseudofunctors with Mathlib's `IsStack`; representability of a morphism of
   presheaves means by schemes, of stacks by algebraic spaces; torsors are fppf torsors; group
   actions are on the left.
4. The genus of a proper curve is `dim H¹(X, O_X)`; the degree of an invertible sheaf is
   `χ(L) − χ(O_X)`. Thickenings are closed immersions surjective on points; modifications are
   proper birational, alterations proper dominant and generically finite. Chow groups are graded
   by dimension; intersection products on smooth varieties by codimension.
5. **How targets are written.** Targets are numbered T001–T436 in build order; "Needs" lists the
   earlier targets, the Mathlib and Tau Ceti declarations, and the Tau Ceti roadmap layers a
   target rests on. Each definition names its carrier, its API and three or more checks a wrong
   definition would fail; API and check names are written relative to the carrier's namespace
   (`.unit` under `AlgebraicGeometry.Scheme.QCohAlg`). A *lemma strand* is a module of
   declaration-sized lemmas whose titles are listed; each lemma is an item of that target. A
   target given by a title and a source locator is specified by that locator exactly; its
   hypotheses are the cited statement's. The lemmas of a strand are the declarations of
   `Suggested.lean` under the strand's module; a unit test is identified by its name, and its
   complete statement is the `example` of that name in `Suggested.lean` wherever the carrier
   exists at the pins. Nothing in this roadmap is optional.
6. Names live under `TauCeti.SchemeFoundations` for new carriers, under the Mathlib namespace
   `AlgebraicGeometry` only for direct extensions of Mathlib objects (relative Spec and Proj,
   thickenings, formal schemes, alterations), and under `TauCeti.Henselization`,
   `TauCeti.AlgebraicGeometry.Curve` and `TauCeti.AlgebraicGeometry.Picard` for the ring-theoretic
   and curve strands.

<a id="sf0"></a>

## SF.0. Schemes and morphisms

The scheme-theoretic base of the roadmap. Mathlib already provides schemes, affine schemes,
quasi-coherent modules, gluing, fibre products and the morphism classes `Flat`, `Smooth`, `Etale`,
`IsProper`, `IsSeparated`, `LocallyOfFinitePresentation`, `IsFinite`, `IsClosedImmersion` with their
base-change stability; those are cited, not planned, as are the quasi-coherent algebras, relative
spectrum and graded algebras of Tau Ceti and AlgebraicVectorBundles Layers L1A–L2A. SF.0 adds what
is missing: the sheaf comparison and direct-image algebras, the general relative Proj (compared
with StableReduction Layer 2's finitely generated case), extension of coherent sheaves and Hartogs statements, the local structure of morphisms
locally of finite type, henselization of pairs (T111–T118, with `key/henselization` as T113; the
perfectoid roadmap imports it), catenary, Cohen–Macaulay, Nagata and excellent rings, perfect schemes and universal homeomorphisms, and the ideal-sheaf comparisons that closed
immersions need. The first eight sub-sections follow the Stacks Project's chapters on
constructions, morphisms and commutative algebra; the remaining strands are declaration-sized
developments on the same carriers (henselization as a small colimit of residue-preserving étale
neighbourhoods, flat base change of annihilators and cokernels, quotient presheaves of ideal
sheaves, and the excellence package).

**Conventions.** `S_aff` is Mathlib's small affine Zariski site `S.AffineZariskiSite`; a
quasi-coherent algebra is Tau Ceti's `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra` (a commutative
monoid in `S.Modules` with quasi-coherent underlying module, AlgebraicVectorBundles L1A), and a
graded one is AlgebraicVectorBundles L2A's `GradedQuasicoherentAlgebra`; the coequifibered presheaf
of rings on `S_aff` that Mathlib's relative gluing consumes is its restriction (T002). Gradings are indexed by ℕ with `O_S` in degree zero.
Henselian pairs are Mathlib's `HenselianRing R I`; regular rings are `IsRegularRing`; regular
sequences are `RingTheory.Sequence.IsRegular`. Perfection of an 𝔽_p-algebra is Mathlib's
colimit-along-Frobenius `PerfectClosure`, not its inverse-limit `Perfection`. **Boundaries.** Weil restriction is Tau Ceti
ModularCurves 0F and ReductiveGroupsPartII; strict henselization, miracle flatness and openness of
the regular locus are ModularCurves 4D; coherent sheaves are JacobianChallenge Layer B.

### 1. Quasi-coherent algebras and the relative spectrum

**T001** (removed). Quasi-coherent `O_S`-algebras are Tau Ceti `TauCeti.AlgebraicGeometry.QuasicoherentAlgebra` (module `TauCeti.AlgebraicGeometry.RelativeSpec.Functor`: commutative monoids in `S.Modules` with quasi-coherent underlying module, with `CategoryTheory.CommMon.isLocalization_basicOpen` for the basic-open localisations) and Tau Ceti AlgebraicVectorBundles Layer L1A; see the boundaries section.

**T002** `SF.0/qcoh-algebra-sheaf-comparison`: Quasi-coherent algebras as sheaves of algebras. Stacks, Situation 27.3.1 (tag 01LM) and Lemma 27.3.2 (tag 01LN), Section 27.3 (tag 01LL).

**T003** `SF.0/pushforward-algebra`: The direct image of the structure sheaf as a quasi-coherent algebra. Stacks, Lemma 26.24.1 (tag 01LC), Schemes.

**T004** (removed). The relative spectrum with its structure map, affineness and affine-cover description is Tau Ceti `CategoryTheory.CommMon.relativeSpec`, `relativeSpecToBase`, `isAffineHom_relativeSpecToBase` and `isPullback_relativeSpecCover` (module `TauCeti.AlgebraicGeometry.RelativeSpec.Basic`), functorially `TauCeti.AlgebraicGeometry.relativeSpec` (`TauCeti.AlgebraicGeometry.RelativeSpec.Functor`), and AlgebraicVectorBundles Layer L1A; see the boundaries section.

**T005** (removed). The universal property of the relative spectrum is AlgebraicVectorBundles Layer L1B (`relativeSpecHomEquiv`).

**T006** (removed). The anti-equivalence between quasi-coherent algebras and affine schemes over `S` is AlgebraicVectorBundles Layer L1B (`relativeSpecEquiv`), with the affine-base comparison `TauCeti.AlgebraicGeometry.relativeSpecAffineIso` (`TauCeti.AlgebraicGeometry.RelativeSpec.Affine`).

**T007** (removed). Pullback of quasi-coherent algebras is AlgebraicVectorBundles Layer L1A (`pullbackQuasicoherentAlgebra`, `pullbackAlgebraCompOverIso`, `pullbackStructureSheafAlgebraIso`).

**T008** (removed). Base change of the relative spectrum is AlgebraicVectorBundles Layer L1B (`relativeSpecBaseChangeIso`).

**T009** `SF.0/relative-spec-morphism-properties`: Morphism properties of relative spectra. Stacks, Lemma 29.45.3 (tag 01WI).

**T010** `SF.0/affine-pushforward-qcoh-equivalence`: Quasi-coherent modules on a relative spectrum. Stacks, Lemma 29.11.7 (tag 01SB).

**T011** (removed). The symmetric algebra of a quasi-coherent module is AlgebraicVectorBundles Layer L2A (`symmetricAlgebra`, `gradedSymmetricAlgebraForgetIso`); its graded pieces are Tau Ceti `SheafOfModules.symmetricPower`.

**T012** (removed). A connected locally Noetherian scheme with domain stalks is irreducible, Tau Ceti `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` (module `TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk`), which with Mathlib's `isReduced_of_isReduced_stalk` and `isIntegral_of_irreducibleSpace_of_isReduced` gives the integral case without the integral-closure hypothesis.


### 2. Graded quasi-coherent algebras and the relative Proj

**T013** (removed). ℕ-graded quasi-coherent `O_S`-algebras are AlgebraicVectorBundles Layer L2A (`GradedQuasicoherentAlgebra`, a commutative monoid in `GradedObject ℕ S.Modules` with quasi-coherent pieces, and `gradedSymmetricAlgebra`); see the boundaries section.

**T014** `SF.0/proj-base-change`: Proj of a graded ring commutes with base change. Stacks, Lemma 27.11.6 (tag 01N2), Constructions, Section 27.11.

**T015** `SF.0/relative-proj`: The relative homogeneous spectrum. Stacks, Lemmas 27.15.2–27.15.4 (tags 01NO, 01NP, 01NQ), Section 27.15.

**T016** `SF.0/relative-proj-base-change`: Relative Proj commutes with base change. Stacks, Lemma 27.16.10 (tag 01O3).

**T017** `SF.0/relative-proj-affine-comparison`: Relative Proj over an affine base is Mathlib's Proj. Stacks, Lemma 27.15.4 (tag 01NQ).

**T018** `SF.0/relative-proj-stable-reduction-compatibility`: Compatibility with the finitely generated relative Proj of Stable reduction. Stacks, Lemma 27.15.4 (tag 01NQ).


### 3. Extension of coherent sheaves, Hartogs, reflexive hulls and vector schemes

**T019** `SF.0/qcoh-pushforward`: Kernels, cokernels and quasi-compact quasi-separated direct images of quasi-coherent modules. Stacks, Section 26.24 (tag 01LA), Schemes, the enumerated list of properties of QCoh(X) and Lemma 26.24.1 (tag 01LC).

**T020** `SF.0/qcoh-extension`: Extending quasi-coherent modules, submodules and finitely presented modules across a quasi-compact open. Stacks, Section 28.23 (tag 01PD), Properties: Lemma 28.23.1 (tag 01PE), Lemma 28.23.2 (tag 01PF), Lemma 28.23.4 (tag 01PI), Lemma 28.23.5 (tag 0G41).

**T021** `SF.0/coherent-extension`: Coherent extension across an open of a Noetherian scheme (EGA I 9.4.7). Stacks, Section 28.23 (tag 01PD): Lemma 28.23.2 (tag 01PF) and Lemma 28.23.5 (tag 0G41).

**T022** `SF.0/pseudo-coherent-module` (definition; `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent`). Let A be a commutative ring. An A-module M is pseudo-coherent if it has a resolution ⋯ → A^{a_2} → A^{a_1} → A^{a_0} → M → 0 by finite free A-modules, that is, a chain complex of finite free modules in degrees ≥ 0, exact in positive degrees, whose zeroth homology is isomorphic to M.
- Hypotheses: A an arbitrary commutative ring; X an arbitrary scheme;
- API: `Module.IsPseudoCoherent`, `Module.IsPseudoCoherent.finitePresentation`, `Module.isPseudoCoherent_iff_finite`, `Module.IsPseudoCoherent.baseChange_of_flat`, `.IsPseudoCoherent` (+3)
- Tests: `.test_free` [degenerate] For every scheme X and n ∈ ℕ, the free O_X-module …; `.test_dual_numbers` [computation] For A = k[ε]/(ε²) and M = A/(ε) = k, the periodic …; `.test_not_finitely_presented` [non-example] For A = k[x_1, x_2, …] in countably many …
- Source: Stacks, Section 15.66 (tag 064N), More on Algebra: Definition 15.66.1 (tag 064Q), Lemma 15.66.4 (tag 064T), Lemma 15.66.14 (tag 066D), Lemma 15.66.17 (tag 066E).
- Needs: Mathlib `Module.FinitePresentation`, `Module.Finite` (+7); Tau Ceti `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`; Tau Ceti roadmap JacobianChallenge Layer B

**T023** `SF.0/locally-free-coherent-extension`: Finite locally free sheaves on an open of a Noetherian scheme extend to coherent sheaves. Stacks, Lemma 28.23.5 (tag 0G41).

**T024** (removed). The sheaf of homomorphisms and the dual of an `O_X`-module are Tau Ceti `SheafOfModules.monoidalClosed` and `SheafOfModules.dual` (module `TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed`) with `SheafOfModules.ihomObjEquiv` and `ihomStalkEquiv` (`TauCeti.Algebra.Category.ModuleCat.Sheaf.InternalHom.Basic`, `.FinitePresentation`); quasi-coherence of the internal Hom from a finitely presented source is AlgebraicVectorBundles Layer L0B.

**T025** `SF.0/reflexive-sheaf` (definition; `AlgebraicGeometry.Scheme.Modules.IsReflexive`). Let X be a locally Noetherian scheme and F a coherent O_X-module (an object of Tau Ceti's FinitelyPresentedSheaf X). F is reflexive if the evaluation map ev_F : F → F^∨∨ of SF.0/sheaf-hom-dual is an isomorphism.
- Hypotheses: X locally Noetherian; F coherent; the hull statements assume X integral.
- API: `.IsReflexive`, `.isReflexive_iff_forall_affine`, `.reflexiveHull`, `.reflexiveHull_isReflexive`, `.reflexiveHull.lift` (+4)
- Tests: `.test_unit` [degenerate] For every locally Noetherian X the unit module …; `.test_torsion` [computation] On X = Spec Z the tilde of Z/2Z has zero double …; `.test_maximal_ideal` [non-example] On X = Spec k[x, y] the ideal sheaf of the origin …
- Source: Stacks, Section 31.13 (tag 0AVT), Divisors: Definition 31.13.1 (tag 0AVU), Lemmas 31.13.2, 31.13.4, 31.13.5, 31.13.8 (tags 0AY0, 0AY2, 0AY3, 0AY4), Remark 31.13.9 (tag 0EBH).
- Needs: Tau Ceti `SheafOfModules.dual`; Mathlib `Module.IsReflexive`, `Module.Dual.eval` (+5); Tau Ceti `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`; Tau Ceti roadmap JacobianChallenge Layer B

**T026** `SF.0/reflexive-extension-normal`: Reflexive sheaves across depth-two complements and the S_2-hull on a normal scheme. Stacks, Section 31.13 (tag 0AVT): Lemma 31.13.11 (tag 0EBI), Lemma 31.13.12 (tag 0EBJ), Lemma 31.13.13 (tag 0AY6), Lemma 31.13.14 (tag 0AY7).

**T027** `SF.0/coherent-hartogs`: Algebraic Hartogs for coherent sheaves of depth at least two. Stacks, Lemma 31.5.11 (tag 0E9I), Divisors.


### 4. Morphisms locally of finite type

**T028** `SF.0/local-dimension` (definition; `TauCeti.topologicalKrullDimAt`). Let X be a topological space and x a point of X. The Krull dimension of X at x is dim_x(X) = inf { dim(U) : U open in X, x in U }, where dim(U) is the Krull dimension of the subspace U (supremum of lengths of chains of irreducible closed subsets, Mathlib topologicalKrullDim, valued in WithBot of the extended naturals, i.e.
- Hypotheses: X is a topological space (for schemes: the underlying topological space).
- API: `.topologicalKrullDimAt`, `.topologicalKrullDimAt_le`, `.iSup_topologicalKrullDimAt`, `.topologicalKrullDimAt_of_isOpenEmbedding`, `.topologicalKrullDimAt_of_isHomeomorph` (+2)
- Tests: `.topologicalKrullDimAt_sum_affineSpace` [non-example] For X = Spec(k[s,t] x k[u]) with k a field, …; `.topologicalKrullDimAt_of_isOpen_singleton` [degenerate] If {x} is an open subset of X then dim_x(X) = 0.; `fiberDimAt_affineLine_projection` [computation] For the projection A^2_k -> A^1_k over a field k …
- Source: Stacks, Topology, Definition 5.10.1 (tag 0055).
- Needs: Mathlib `topologicalKrullDim`, `topologicalKrullDim_subspace_le` (+4)

**T029** `SF.0/algebraic-scheme-dimension`: Dimension theory of schemes locally of finite type over a field. Stacks, Algebra, Section 10.116 (tag 07NB): Lemmas 10.116.1 (00P0), 10.116.2 (06RP), 10.116.3 (00P1), 10.116.5 (00P3), 10.116.6 (00P4).

**T030** `SF.0/geometric-irreducible-components`: Irreducible components after extending the ground field. Stacks, Varieties, Section 33.8 (tag 0364): Lemmas 33.8.3 (020J), 33.8.6 (054Q), 33.8.8 (038H), 33.8.11 (04KX), 33.8.14 (04KY), 33.8.16 (054R).

**T031** `SF.0/fibre-dimension-semicontinuity`: Chevalley semicontinuity of fibre dimension. Stacks, Morphisms, Section 29.29 (tag 02FW): Lemmas 29.29.3 (02FY), 29.29.4 (02FZ), 29.29.5 (0A3V), 29.29.6 (02G0).

**T032** `SF.0/fibre-dimension-formula`: Fibre dimension for morphisms of algebraic schemes. Stacks, Varieties, Section 33.20 (tag 06LF), Lemma 33.20.4 (0B2L).

**T033** `SF.0/flat-over-dedekind`: Dominant maps to Dedekind schemes are flat with pure fibres. Stacks, More on Algebra, Lemma 15.22.11 (tag 0AUW).

**T034** `SF.0/generic-fibre-spreading`: Spreading fibre properties from the generic fibre; constructibility of fibre loci. Stacks, More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.2 (0576), 37.26.4 (0578), 37.26.5 (0579).

**T035** `SF.0/flat-proper-fibre-loci`: Openness of geometrically reduced and geometrically integral fibre loci. EGA IV₃, EGA IV_3, Theorem 12.2.4 (v) and (viii), p. 183.

**T036** `SF.0/fibre-power-irreducible`: Fibre powers of flat maps with geometrically irreducible fibres. Stacks, Morphisms, Lemma 29.26.10 (tag 01UA).

**T037** `SF.0/etale-coordinates`: Etale coordinates at smooth points. Stacks, Morphisms, Lemma 29.37.21 (tag 054L).

**T038** `SF.0/rational-point-component`: Connected smooth schemes with a rational point are geometrically integral. Stacks, Varieties, Lemma 33.7.14 (tag 04KV).

**T039** `SF.0/quasi-sections`: Etale quasi-sections of smooth morphisms. Stacks, More on Morphisms, Section 37.38 (tag 055S): Lemmas 37.38.5 (057G) and 37.38.6 (055U).

**T040** (removed). The Jacobson property of finite type algebras and the finiteness of residue fields of closed points are Mathlib `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing` (`Mathlib.RingTheory.Jacobson.Ring`) and `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` (`Mathlib.AlgebraicGeometry.Morphisms.FiniteType`), with Tau Ceti `Scheme.finite_Γevaluation_of_isClosed` (`TauCeti.AlgebraicGeometry.Scheme.ClosedPoint`).

**T041** `SF.0/affine-transition-limits`: Limits of cofiltered diagrams of schemes with affine transition maps. Stacks, Limits, Section 32.2 (tag 01YV): Lemmas 32.2.1 (01YW), 32.2.2 (01YX), 32.2.3 (01YZ).

**T042** `SF.0/noetherian-approximation`: Absolute Noetherian approximation. Stacks, Limits, Section 32.5 (tag 01Z1): Lemmas 32.5.1 (01Z7), 32.5.2 (01Z9), 32.5.3 (07RN), Proposition 32.5.4 (01ZA).

**T043** `SF.0/finite-presentation-limits`: Finitely presented objects and their properties over cofiltered limits (EGA IV 8). Stacks, Limits, Section 32.6 (tag 01ZB), Proposition 32.6.1 (01ZC).

**T044** `SF.0/spreading-out-models`: Spreading out finitely presented data over a dense open of the base. Stacks, Limits, Lemma 32.10.1 (tag 01ZM).

**T045** `SF.0/integral-point-descent`: Integral points of separated models descend from integral closures. Klevdal–Patrikis 2024, Lemma 3.9, footnote 8, p. 21 (arXiv v2).

**T046** `SF.0/projective-line-to-affine`: Maps from the relative projective line to affine schemes are constant. Stacks, Cohomology of Schemes, Lemma 30.8.1 (tag 01XT), the case q = 0, d = 0.

**T047** `SF.0/geometrically-unibranch` (definition; `AlgebraicGeometry.Scheme.IsGeometricallyUnibranch`). A local ring A is unibranch if its reduction A_red is a domain and the integral closure A' of A_red in its fraction field is a local ring; A is geometrically unibranch if moreover the residue field of A' is purely inseparable over the residue field of A.
- Hypotheses: A is a local ring; X a scheme and x a point of X.
- API: `IsLocalRing.IsUnibranch`, `IsLocalRing.IsGeometricallyUnibranch`, `.IsGeometricallyUnibranchAt`, `.IsGeometricallyUnibranch`, `IsLocalRing.IsGeometricallyUnibranch.of_isIntegrallyClosed` (+4)
- Tests: `IsLocalRing.not_isUnibranch_node` [non-example] For a field k of characteristic not 2, the …; `IsLocalRing.isGeometricallyUnibranch_cusp` [computation] The localisation of k[x,y]/(y^2 - x^3) at (x,y) …; `IsLocalRing.isUnibranch_not_isGeometricallyUnibranch_real` [non-example] The localisation of R[x,y]/(x^2 + y^2) at (x,y) …
- Source: Stacks, More on Algebra, Definition 15.108.1 (tag 0BPZ).
- Needs: Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.Scheme.Hom.normalizationObjIso` (+2); Tau Ceti roadmap ModularCurves Layer 4D

**T048** `SF.0/unibranch-finite-components`: Connected components of etale-locally constant schemes over geometrically unibranch bases. Česnavičius 2020, Proof of Lemma 5.1, p. 16 (arXiv v7), citing SGA 3 X 5.14 and EGA I 6.1.9.

**T049** `SF.0/jacobian-etale-algebra`: The Jacobian-open part of r equations in r variables is finite etale. Couveignes 2019, Theorem 1 (p. 1) and Proposition 2 (p. 7), arXiv v2.

**T050** `SF.0/field-extension-descent`: Descent of global sections and properties along a field extension. Stacks, Descent, Section 35.23 (tag 02YJ): Lemmas 35.23.1 (02KQ), 35.23.2 (02KR), 35.23.3 (02KS), 35.23.6 (02KU), 35.23.12 (02KX), 35.23.14 (02KZ), 35.23.16 (02L1).

**T051** `SF.0/absolute-integral-closure`: Absolute integral closure of an integral scheme. Bhatt–Ma–Patakfalvi et al. 2020, Convention 4.1, p. 35 (arXiv v3).

**T052** `SF.0/unramified-criteria`: Unramified morphisms: quasi-finiteness and fibre criteria. Stacks, Morphisms, Section 29.36 (tag 02G3): Lemmas 29.36.10 (02V5), 29.36.11 (02G7), 29.36.12 (02G8), 29.36.14 (02GF), 29.36.13 (02GE).


### 5. Henselization of pairs and henselian pairs

**T053** `SF.0/ind-etale-algebra` (definition; `TauCeti.IndEtale`). Let R be a commutative ring and S a commutative R-algebra, both with carriers in one universe u. S is ind-etale over R if there are a small filtered category J (Mathlib IsFiltered), a functor D from J to the category CommAlgCat R of commutative R-algebras all of whose values D(j) are etale R-algebras (Mathlib Algebra.Etale), and a colimit cocone of D in CommAlgCat R whose apex is S with its given R-algebra structure.
- Hypotheses: R commutative with identity, zero ring allowed; S a commutative R-algebra;
- API: `.IndEtale`, `.of_etale`, `.of_algEquiv`, `.flat`, `.weaklyEtale` (+4)
- Tests: `.test_localization_atPrime` [computation] The localization of Z at the prime ideal (5) is …; `.test_zmod_two` [non-example] Z/2Z is not ind-etale over Z: it is not a flat …; `.test_polynomial_not_indEtale` [non-example] The polynomial ring Q[T] is not ind-etale over Q: …
- Source: Stacks, Lemma 10.39.3 (tag 05UT).
- Needs: T118; Mathlib `CommAlgCat`, `CategoryTheory.IsFiltered` (+16)

**T054** `SF.0/henselization-flat`: The henselization is flat and ind-etale. Stacks, Lemma 15.12.2 (tag 0AGU) and its proof.

**T055** `SF.0/henselization-quotient-pow`: Ideal-power quotients and completions are unchanged. Stacks, Lemma 15.12.2 (tag 0AGU) and its proof.

**T056** `SF.0/henselization-noetherian`: Noetherian pairs: Noetherian henselization and the completion. Stacks, Lemma 15.12.4 (tag 0AGV) and its proof.

**T057** `SF.0/henselization-recognition`: Recognition of the henselization. Clausen–Mathew–Morrow 2021, Remark 3.19, p. 22, arXiv v2.

**T058** `SF.0/henselization-filtered-colimit`: Henselization commutes with filtered colimits of pairs. Stacks, Lemma 15.12.5 (tag 0A04) and proof.

**T059** `SF.0/henselization-integral-base-change`: Quotients, integral base change, radicals and coprime products. Stacks, Lemma 15.12.6 (tag 0F0L).

**T060** `SF.0/henselization-local-ring`: Henselization of a local ring. Stacks, Lemma 15.12.3 (tag 0A03).

**T061** `SF.0/henselization-at-prime`: Henselization at a prime and at a point of a scheme. Stacks, Lemma 10.155.7 (tag 04GV), Lemma 10.155.1 (tag 04GN), Definition 10.155.3, Section 10.155.

**T062** `SF.0/henselian-finite-etale-equivalence`: Finite etale algebras over a henselian pair. Stacks, Lemmas 15.13.1 (tag 0D4A) and 15.13.2 (tag 09ZL), Section 15.13.

**T063** `SF.0/henselian-local-finite-algebras`: Finite and quasi-finite algebras over a henselian local ring. Stacks, Lemma 10.153.3 (tag 04GG), items (1), (8), (10), (11), (13) and the proofs of (8) implies (10), (8) implies (11), (10) implies (1).

**T064** `SF.0/henselian-pair-characterisations`: Equivalent characterisations of henselian pairs. Stacks, Lemma 15.11.6 (tag 09XI) and its proof.

**T065** `SF.0/henselian-pair-permanence`: Permanence properties of henselian pairs. Stacks, Lemmas 15.11.2-15.11.4 and 15.11.7-15.11.16, Example 15.11.14, Section 15.11.

**T066** `SF.0/henselian-smooth-lifting`: Lifting along smooth algebras over a henselian pair (Elkik). Stacks, Lemma 15.13.3 (tag 0H74).

**T067** `SF.0/henselization-padic-example`: The henselization of Z at p: algebraic p-adic integers. Stacks, Lemma 10.155.7 (tag 04GV), Section 10.155.


### 6. Catenary, Cohen–Macaulay, Nagata and excellent rings

**T068** `SF.0/popescu-desingularization`: Néron–Popescu desingularization. Stacks, Theorem 16.12.1 (tag 07GC), Popescu.

**T069** `SF.0/catenary-ring` (definition; `Ring.IsCatenary`). A commutative ring R is catenary when, for every pair of prime ideals p ⊆ q of R, (i) some natural number bounds the length e of every strict chain of primes p = p_0 ⊊ p_1 ⊊ … ⊊ p_e = q, and (ii) any two saturated chains from p to q have the same length, a chain being saturated when no prime lies strictly between two consecutive members.
- Hypotheses: R is a commutative ring; no Noetherian, local or dimension hypothesis.
- API: `.exists_length_le`, `.length_eq_of_covBy`, `.isCatenary_iff_of_isNoetherianRing`, `.of_ringEquiv`, `.localization` (+5)
- Tests: `.test_field` [computation] Every field is catenary: its only prime is 0.; `.test_int` [computation] ℤ is catenary: every strict chain of primes of ℤ …; `.test_zero` [degenerate] The zero ring is catenary (it has no primes).
- Source: Stacks, Section 10.105: Definition 10.105.1 (tag 00NI), Lemmas 10.105.2 (02IH), 10.105.4 (00NJ), 10.105.6 (0AUN), 10.105.7 (00NK), 10.105.8 (0AUP).
- Needs: Mathlib `LTSeries`, `CovBy` (+14)

**T070** `SF.0/universally-catenary` (definition; `Ring.IsUniversallyCatenary`). A commutative ring R is universally catenary when R is Noetherian and every R-algebra of finite type is catenary (SchemeAndStackFoundations:SF.0/catenary-ring);
- Hypotheses: The Noetherian clause belongs to the ring predicate (Stacks restricts the notion to Noetherian rings).
- API: `.isNoetherianRing`, `.isCatenary_of_finiteType`, `.isUniversallyCatenary_iff_mvPolynomial`, `.of_essFiniteType`, `.quotient` (+6)
- Tests: `.test_field` [computation] Every field is universally catenary.; `.test_int` [computation] ℤ is universally catenary.; `.test_dim_one_domain` [characterisation] Every Noetherian domain of Krull dimension at …
- Source: Stacks, Definition 10.105.3 (tag 00NL) and the remark after it.
- Needs: T069; Mathlib `Algebra.FiniteType`, `Algebra.FiniteType.iff_quotient_mvPolynomial` (+6)

**T071** `SF.0/depth` (definition; `Module.depth`). Let R be a commutative ring, I ⊆ R an ideal and M an R-module. The I-depth depth_I(M), an element of ℕ ∪ {∞}, is the supremum of the lengths r of finite sequences f_1, …, f_r of elements of I that are weakly M-regular, i.e.
- Hypotheses: The I-depth is defined for any ring, ideal and module; the comparison statements assume R Noetherian and M finite.
- API: `IsLocalRing.depth`, `IsLocalRing.depth_eq_top_iff`, `IsLocalRing.depth_le_supportDim`, `IsLocalRing.depth_eq_zero_iff`, `IsLocalRing.depth_eq_iff_ext` (+5)
- Tests: `IsLocalRing.depth.test_residueField` [computation] For a Noetherian local ring R with residue field …; `IsLocalRing.depth.test_zero` [degenerate] The zero module has depth ⊤; a definition built …; `IsLocalRing.depth.test_dvr` [computation] A discrete valuation ring R has depth 1 as a …
- Source: Stacks, Definition 10.68.1 (tag 00LF).
- Needs: Mathlib `RingTheory.Sequence.IsWeaklyRegular`, `RingTheory.Sequence.IsRegular` (+11)

**T072** `SF.0/cohen-macaulay` (definition; `Module.IsCohenMacaulay`). Let (R, m) be a Noetherian local ring and M a finite R-module. M is Cohen–Macaulay when M = 0 or depth(M) = dim Supp(M), with depth as in SchemeAndStackFoundations:SF.0/depth and dim Supp(M) the Krull dimension of the support (Mathlib Module.supportDim);
- Hypotheses: R Noetherian (and local in the local clause); M a finite R-module.
- API: `.isCohenMacaulay_iff_of_isLocalRing`, `.localization`, `.isCohenMacaulay_iff_forall_isMaximal`, `.isCohenMacaulay_quotSMulTop_iff`, `Ring.IsCohenMacaulay.of_isRegularRing` (+5)
- Tests: `Ring.IsCohenMacaulay.test_field` [computation] Every field is a Cohen–Macaulay ring.; `.test_zero` [degenerate] The zero module is Cohen–Macaulay over every …; `.test_proper_support` [characterisation] For a field k, k[x]/(x) is a Cohen–Macaulay …
- Source: Stacks, Section 10.103: Definitions 10.103.1 (00N3), 10.103.8 (00NF), 10.103.12 (0AAH); Lemmas 10.103.5 (0C6G), 10.103.7 (0BUS), 10.103.9 (0AAE), 10.103.10 (0AAF), 10.103.11 (0AAG), 10.103.13 (0AAI).
- Needs: T071; Mathlib `Module.support`, `Module.supportDim` (+7)

**T073** `SF.0/cohen-macaulay-universally-catenary`: Cohen–Macaulay rings are universally catenary. Stacks, Lemma 10.105.9 (tag 00NM).

**T074** `SF.0/serre-condition-sn` (definition; `Module.SatisfiesSerreS`). Fix n ∈ ℕ. (1) A finite module M over a Noetherian ring R satisfies (S_n) when depth_{R_p}(M_p) ≥ min(n, dim Supp(M_p)) for every prime p of R, with the conventions depth(0) = ∞ and dim(∅) = −∞ of SchemeAndStackFoundations:SF.0/depth, so that primes outside the support and the zero module impose nothing (Stacks 031P);
- Hypotheses: R Noetherian and M finite; X locally Noetherian and F coherent.
- API: `.satisfiesSerreS_zero`, `.mono`, `.isCohenMacaulay_iff_forall_satisfiesSerreS`, `.satisfiesSerreS_one_iff`, `Ring.SatisfiesSerreR` (+5)
- Tests: `.test_zero` [degenerate] The zero module satisfies (S_n) for every n.; `Ring.SatisfiesSerreS.test_plane_and_line` [computation] R = k[[x, y, z]]/(xz, yz) satisfies (S_1), being …; `Ring.SatisfiesSerreS.test_embedded_point` [non-example] k[x, y]/(x², xy) does not satisfy (S_1): at (x, …
- Source: Stacks, Section 10.157: Definition 10.157.1 (031P), Lemmas 10.157.2 (031Q), 10.157.3 (031R), 10.157.4 (031S), 10.157.5 (0567).
- Needs: T071, T072; Mathlib `Module.supportDim`, `Ideal.height` (+10)

**T075** `SF.0/coherent-scheme-support`: Scheme-theoretic support of a coherent module. Stacks, Section 29.5: Lemmas 29.5.1 (056I), 29.5.3 (056J), 29.5.4 (05JU), Definition 29.5.5 (05JV).

**T076** `SF.0/cohen-macaulay-scheme` (definition; `AlgebraicGeometry.IsCohenMacaulay`). Let X be a locally Noetherian scheme and F a coherent O_X-module. F is Cohen–Macaulay when depth_{O_{X,x}}(F_x) = dim Supp(F_x) for every point x of the support of F;
- Hypotheses: X locally Noetherian; F coherent (quasi-coherent of finite type).
- API: `.Scheme.Modules.IsCohenMacaulay`, `.Scheme.Modules.isCohenMacaulay_iff_forall_satisfiesSerreS`, `.isCohenMacaulay_iff_stalks`, `.isCohenMacaulay_iff_affineOpens`, `.isCohenMacaulay_Spec_iff` (+3)
- Tests: `.test_field` [computation] Spec of a field is Cohen–Macaulay.; `.test_affinePlane` [computation] Spec k[x, y] is Cohen–Macaulay for every field k.; `.Scheme.Modules.IsCohenMacaulay.test_point_on_plane` [characterisation] On Spec k[x, y], the coherent module associated …
- Source: Stacks, Definition 28.8.1 (tag 02IO).
- Needs: T072, T074, T071, T073, T070, T075; Mathlib `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk` (+4)

**T077** `SF.0/cm-sn-quasi-excellent` (definition; `AlgebraicGeometry.IsCMQuasiExcellent`). Let X be a locally Noetherian scheme. For a Noetherian local ring (A, m) with completion Â = AdicCompletion(m, A), the formal fibres of A are the rings Â ⊗_A κ(p) = Ideal.Fiber p Â for the primes p of A;
- Hypotheses: Local Noetherianity of X is part of each predicate. Formal fibres are taken at every prime of each local ring O_{X,x}, not only at its maximal ideal.
- API: `.isLocallyNoetherian`, `.isCohenMacaulay_formalFibre`, `.exists_isCohenMacaulay_open`, `.isSnQuasiExcellent`, `.isCMQuasiExcellent_iff_of_openCover` (+1)
- Tests: `.IsCMExcellent.test_field` [computation] Spec of a field is CM-excellent.; `.IsCMExcellent.test_empty` [degenerate] The empty scheme is CM-excellent and …; `.IsSnQuasiExcellent.test_zero` [degenerate] A scheme is (S_0)-quasi-excellent iff it is …
- Source: Česnavičius 2021, Definition 1.2 and the sentence after it (p. 2), Example 1.3 (p. 2), §2.8 (pp. 6–7), §2.10 (p. 7).
- Needs: T072, T076, T074, T070; Mathlib `AdicCompletion`, `IsLocalRing.maximalIdeal` (+5)

**T078** `SF.0/quasi-excellent-cm-sn`: Quasi-excellent schemes are CM- and (S_n)-quasi-excellent. Česnavičius 2021, Example 1.3 (p. 2) and §2.10 (p. 7).

**T079** `SF.0/japanese-ring` (definition; `Ring.IsJapanese`). Let R be a domain with fraction field K (Mathlib FractionRing R). R is N-1 when the integral closure of R in K is a finite R-module. R is N-2, also called Japanese, when for every finite field extension L/K the integral closure of R in L (Mathlib integralClosure R L) is a finite R-module (Stacks 032F).
- Hypotheses: R is a domain. N-2 quantifies over all finite extensions of the fraction field, including inseparable ones.
- API: `.IsN1`, `.isN1`, `.isJapanese_iff_isN1_of_charZero`, `.isJapanese_iff_purelyInseparable`, `.of_isIntegrallyClosed_charZero` (+5)
- Tests: `.test_field` [computation] Every field is N-2.; `.test_int` [computation] ℤ is N-2.; `.IsN1.test_isIntegrallyClosed` [compatibility] Every domain satisfying Mathlib …
- Source: Stacks, Section 10.161: Definition 10.161.1 (032F), Example 10.161.2 (0350), Lemmas 10.161.3 (032G), 10.161.5 (032I), 10.161.8 (032L), 10.161.11 (032M), 10.161.12 (032N), 10.161.13 (032O), 10.161.15 (0333), 10.161.17 (032Q).
- Needs: Mathlib `integralClosure`, `IsIntegralClosure` (+6); Tau Ceti `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `TauCeti.IsIntegralClosure.finite_of_injective` (+1)

**T080** `SF.0/nagata-ring` (definition; `Ring.IsNagata`). A commutative ring R is universally Japanese when every finite-type R-algebra that is a domain is N-2 (SchemeAndStackFoundations:SF.0/japanese-ring); R is a Nagata ring when R is Noetherian and R/p is N-2 for every prime p of R (Stacks 032R).
- Hypotheses: The Nagata predicate includes Noetherianity; universally Japanese does not.
- API: `.isNoetherianRing`, `.IsUniversallyJapanese`, `.isNagata_iff_isUniversallyJapanese`, `.of_finiteType`, `.localization` (+6)
- Tests: `.test_field` [computation] Every field is a Nagata ring.; `.test_int` [computation] ℤ is a Nagata ring: ℤ/p is a field for p ≠ 0 and …; `.test_zero` [degenerate] The zero ring is Nagata: it is Noetherian and has …
- Source: Stacks, Section 10.162: Definition 10.162.1 (032R), Lemmas 10.162.2 (03GH), 10.162.3 (0351), 10.162.5 (032T), 10.162.6 (032U), 10.162.8 (032W), Proposition 10.162.15 (0334), Proposition 10.162.16 (0335), Example 10.162.17 (09E1).
- Needs: T079; Mathlib `Algebra.FiniteType`, `IsNoetherianRing` (+6)

**T081** `SF.0/quasi-excellent-nagata`: Quasi-excellent rings are Nagata. Stacks, Lemma 15.53.5 (tag 07QV).

**T082** `SF.0/nagata-normalization-finite`: Finiteness of normalization over a Nagata base. Stacks, Lemma 29.54.14 (tag 0AVK).

**T083** `SF.0/regular-map-completion`: Regular maps preserve reducedness and normality; completions of local G-rings. Stacks, Section 15.43: Lemmas 15.43.1 (07QK), 15.43.2 (0BFK), 15.43.3 (0H7S), 15.43.4 (0H7T).

**T084** `SF.0/excellent-examples`: Standard excellent rings. Stacks, Proposition 15.53.3 (tag 07QW).

**T085** `SF.0/non-japanese-dvr`: A regular, universally catenary DVR that is not Japanese. Stacks, Example 10.119.5 (tag 00PB).

**T086** `SF.0/non-catenary-local-domain`: Nagata's non-catenary Noetherian local domain. Stacks, Examples, Section 110.19 (tag 02JE).


### 7. Perfect schemes and universal homeomorphisms

**T087** `SF.0/perfect-scheme` (definition; `AlgebraicGeometry.Scheme.IsPerfect`). Let p be a prime and X a scheme over Spec F_p (equivalently p = 0 in Gamma(X, O_X)). X is perfect if its absolute Frobenius F_X (SF.0/absolute-frobenius) is an isomorphism.
- Hypotheses: p prime, X a scheme with p = 0
- API: `.IsPerfect`, `.isPerfect_iff_perfectRing`, `.isReduced`, `.pullback`, `.of_etale` (+1)
- Tests: `.isPerfect_Spec_perfection_polynomial` [computation] Spec of the direct-limit perfection of Polynomial …; `.isPerfect_empty` [degenerate] The empty scheme is perfect (its only ring of …; `.not_isPerfect_affineLine` [non-example] A^1 over F_p is not perfect (t has no p-th root); …
- Source: Bhatt–Scholze 2017, Definitions 3.1 and 3.2, p. 10 (arXiv v3).
- Needs: T088, T090; Mathlib `PerfectRing`, `AlgebraicGeometry.IsReduced` (+2)

**T088** `SF.0/absolute-frobenius`: Absolute and q-power Frobenius of a scheme over a finite field. Stacks, Definition 33.36.1 (tag 03SM), Varieties, Section 33.36 Frobenii.

**T089** `SF.0/relative-frobenius`: Frobenius twists and the relative Frobenius. Stacks, Definition 33.36.4 (tag 0CC9).

**T090** `SF.0/relative-frobenius-etale-and-smooth`: Relative Frobenius of etale and of smooth morphisms. Zhu 2017, Lemma A.2, p. 45 (arXiv v3).

**T091** `SF.0/universal-homeomorphism` (definition; `AlgebraicGeometry.IsUniversalHomeomorphism`). A morphism of schemes f : X -> Y is a universal homeomorphism if for every morphism Y' -> Y the base change X x_Y Y' -> Y' is a homeomorphism of underlying topological spaces (Stacks 04DD).
- Hypotheses: f : X -> Y a morphism of schemes, no finiteness hypotheses
- API: `.IsUniversalHomeomorphism`, `.isUniversalHomeomorphism_eq`, `.Scheme.Hom.homeomorphOfIsUniversalHomeomorphism`, `.isStableUnderBaseChange`, `.of_isIso`
- Tests: `.not_isUniversalHomeomorphism_Spec_F_p2` [non-example] Spec F_{p^2} -> Spec F_p is a homeomorphism of …; `.isUniversalHomeomorphism_cusp_normalization` [characterisation] For a field k, Spec k[t] -> Spec k[t^2, t^3] …; `.not_isUniversalHomeomorphism_node_normalization` [non-example] For a field k of characteristic not 2, Spec k[t] …
- Source: Stacks, Definition 29.46.1 (tag 04DD).
- Needs: Mathlib `CategoryTheory.MorphismProperty.universally`, `AlgebraicGeometry.topologically` (+2)

**T092** `SF.0/universal-homeomorphism-criteria`: Characterisations of universal homeomorphisms. Stacks, Lemma 29.46.5 (tag 04DF).

**T093** `SF.0/universal-homeomorphism-etale-site`: Topological invariance of the small etale site. Stacks, Section 59.45 (tag 04DY), including Proposition 59.45.4.

**T094** (removed). The colimit of an `𝔽_p`-algebra along Frobenius is Mathlib `PerfectClosure K p` (`Mathlib.FieldTheory.PerfectClosure`, for any ring with `CharP K p`; the zero ring is excluded) with `PerfectClosure.of`, `PerfectClosure.lift`, its `PerfectRing` instance and the characterisation `IsPerfectClosure` (`Mathlib.FieldTheory.IsPerfectClosure`).

**T095** `SF.0/scheme-perfection`: The perfection of an F_p-scheme. Bhatt–Scholze 2017, Definition 3.1, p. 10; proofs of Lemma 3.4 and Proposition 3.13, pp. 11, 13 (arXiv v3).

**T096** `SF.0/perfection-universal-homeomorphism`: Perfection is a universal homeomorphism; rigidity and etale invariance. Bhatt–Scholze 2017, Proof of Lemma 3.4, first sentence, p. 11 (arXiv v3).

**T097** `SF.0/perfection-reflects-morphism-properties`: Morphism properties detected by perfection. Bhatt–Scholze 2017, Lemma 3.4 (i)-(vii) and proof, pp. 10-11 (arXiv v3).

**T098** `SF.0/perfection-preserves-morphism-properties`: Morphism properties preserved by perfection; etale base change. Bhatt–Scholze 2017, Lemma 3.4 (viii)-(xii) and proof, pp. 10-11 (arXiv v3).

**T099** `SF.0/perfectly-finitely-presented` (definition; `AlgebraicGeometry.PerfectlyFinitelyPresented`). (a) Ring level: a ring map g : B -> A between perfect F_p-algebras is perfectly finitely presented (pfp) if there are a finitely presented B-algebra A_0 and a B-algebra isomorphism (A_0)_perf = A (SF.0/ring-perfection;
- Hypotheses: p prime; X, Y quasi-compact quasi-separated perfect F_p-schemes in (b)-(c);
- API: `RingHom.PerfectlyFinitePresentation`, `.PerfectlyFinitelyPresented`, `.perfection`, `.comp`, `.of_etale` (+2)
- Tests: `.perfection_polynomial` [computation] ZMod p -> (Polynomial (ZMod p))_perf is pfp with …; `.id` [degenerate] The identity of Spec k, k a perfect field, is pfp …; `.not_perfectlyFinitelyPresented_infinite` [non-example] ZMod p -> perfection of MvPolynomial N (ZMod p) …
- Source: Bhatt–Scholze 2017, Definition 3.10 and Proposition 3.11 (last sentence), p. 12; sentence before Proposition 3.12, p. 12; sentence after Proposition 3.13, p. 13 (arXiv v3).
- Needs: Mathlib `PerfectClosure`, T087, T095; Mathlib `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.QuasiCompact` (+2)

**T100** `SF.0/pfp-characterisations`: Local and limit characterisations of pfp morphisms; approximation in Perf. Bhatt–Scholze 2017, Proposition 3.11 and proof, p. 12 (arXiv v3).

**T101** `SF.0/pfp-models`: Finitely presented models of pfp morphisms. Bhatt–Scholze 2017, Proposition 3.13 and proof, p. 13 (arXiv v3).

**T102** `SF.0/perfectly-proper` (definition; `AlgebraicGeometry.PerfectlyProper`). A morphism f : X -> Y in Perf is perfectly proper if it is perfectly finitely presented (SF.0/perfectly-finitely-presented), separated and universally closed (BS17 Definition 3.14 calls such f proper;
- Hypotheses: X, Y quasi-compact quasi-separated perfect F_p-schemes
- API: `.PerfectlyProper`, `.perfection`, `.iff_model`, `.comp`, `.iff_valuativeCriterion`
- Tests: `.projectiveSpace` [computation] (P^1_{F_p})_perf -> Spec F_p is perfectly proper …; `.id` [degenerate] Every isomorphism in Perf, and every pfp closed …; `.not_perfectlyProper_affineLine` [non-example] (A^1_k)_perf -> Spec k is pfp and separated but …
- Source: Bhatt–Scholze 2017, Definition 3.14, p. 13 (arXiv v3).
- Needs: T099; Mathlib `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.UniversallyClosed` (+1)

**T103** `SF.0/perfect-valuative-criterion`: Valuative criterion with perfect valuation rings. Zhu 2017, Proposition A.20 and proof, p. 51 (arXiv v3).

**T104** `SF.0/perfectly-smooth` (definition; `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension`). Let f : X -> Y be a morphism of perfect F_p-schemes and d >= 0. f is perfectly smooth of relative dimension d at x in X if there are etale morphisms u : U -> X with x in u(U) and v : V -> Y, a morphism h : U -> V with v o h = f o u, and an etale morphism h' : U -> V x_{F_p} (A^d_{F_p})_perf whose composite with the projection to V is h (van Hoften Section 2.1.2, (2.1.2);
- Hypotheses: X, Y perfect schemes over F_p; d >= 0 an integer
- API: `.PerfectlySmoothAt`, `.PerfectlySmoothOfRelativeDimension`, `.WeaklyPerfectlySmoothOfRelativeDimension`, `.perfection`, `.etale_iff` (+2)
- Tests: `.perfectlySmooth_affineSpace` [computation] (A^2)_perf -> (A^1)_perf, the perfection of a …; `.perfectlySmooth_id` [degenerate] Identities and etale morphisms of perfect schemes …; `.not_perfectlySmooth_origin` [non-example] The closed immersion of the origin Spec F_p -> …
- Source: van Hoften 2024, Section 2.1.2, (2.1.2), p. 8, and Definition 2.1.9 with the definition after Lemma 2.1.11, pp. 10-11 (arXiv v4).
- Needs: T087, T095; Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.AffineSpace` (+1)

**T105** `SF.0/perfectly-smooth-properties`: Properties of perfectly smooth and weakly perfectly smooth morphisms. van Hoften 2024, Example 2.1.3, p. 8 (arXiv v4).

**T106** `SF.0/witt-scheme`: Truncated Witt schemes of a perfect scheme. Bhatt–Scholze 2017, Section 4 opening, p. 15 (arXiv v3).

**T107** `SF.0/weakly-normal-scheme` (definition; `AlgebraicGeometry.Scheme.IsWeaklyNormal`). Let k be a perfect field of characteristic p. A reduced scheme X of finite type over k is weakly normal if every finite, birational universal homeomorphism g : Y -> X with Y reduced is an isomorphism;
- Hypotheses: k a perfect field of characteristic p; X reduced, of finite type over k
- API: `.IsWeaklyNormal`, `.isWeaklyNormal_iff_pClosed`, `.of_normal`, `.restrict`
- Tests: `.not_isWeaklyNormal_cusp` [non-example] Spec k[t^2, t^3] is not weakly normal: its …; `.isWeaklyNormal_node` [computation] For p odd, Spec k[t^2 - 1, t^3 - t] (the node) is …; `.isWeaklyNormal_affineSpace` [degenerate] A^n_k and Spec k are weakly normal.
- Source: Zhu 2017, Section A.2.1, p. 49 (arXiv v3).
- Needs: T091; Mathlib `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.IsFinite` (+2)

**T108** `SF.0/weakly-normal-model`: Yanagihara's criterion and weakly normal models of pfp perfect schemes. Zhu 2017, Proposition A.15 with (A.2.1), (A.2.2) and Corollary A.16, p. 50 (arXiv v3).

**T109** `SF.0/frobenius-factors-through-universal-homeomorphism`: A power of Frobenius factors through a finite universal homeomorphism. Bhatt–Scholze 2017, Proof of Proposition 11.41, p. 53 (arXiv v3).


### 9. Coherence of the image-ideal quotient comparisons

**T110** `SF.0/quotient-tower/left-unit`: Left identity coherence of image-ideal quotients. Stacks, Lemma 26.17.6 (tag 01JU).


### Henselization of pairs: the étale-neighbourhood colimit

**T111** `SF.0/etale-neighbourhood` (definition; `TauCeti.Henselization.IsNeighbourhood`). For a commutative R and ideal I, an object is an existing CommAlgCat R algebra B satisfying Algebra.Etale R B and bijectivity of the canonical quotientMap R/I → B/(I.map(algebraMap R B)).
- Hypotheses: All rings are commutative with identity, including the zero ring;
- API: `.isNeighbourhood_self`, `.isNeighbourhood_localization`, `.isNeighbourhood_tensor`
- Tests: `.neighbourhood_identity` [degenerate] For every (R,I), the identity algebra R belongs …; `.neighbourhood_invert_two` [computation] For (Z,(5)), Z[1/2] satisfies the neighbourhood …; `.neighbourhood_reject_invert_five` [non-example] For (Z,(5)), Z[1/5] does not satisfy the …
- Source: Stacks, Lemma 15.12.1, indicated construction/proof paragraph.
- Needs: Mathlib `CommAlgCat`, `CommAlgCat.Hom` (+6)

**T112** `SF.0/filtered-neighbourhoods`: The neighbourhood category is filtered. Stacks, Lemma 15.12.1, indicated construction/proof paragraph.

**T113** `key/henselization`: Henselization of a ring and ideal. Stacks, Lemma 15.12.1, indicated construction/proof paragraph.

**T114** `SF.0/henselian-pair`: The colimit pair is henselian. Stacks, Lemma 15.12.1, indicated construction/proof paragraph.

**T115** `SF.0/etale-section-comparison`: Simple-root henselianity lifts étale sections. Stacks, Lemma 15.11.6, implication (5)⇒(2), with 15.11.5.

**T116** `SF.0/initial-henselian-pair`: The initial henselian pair. Stacks, Lemma 15.12.1, indicated construction/proof paragraph.

**T117** `SF.0/henselization-map`: Map induced by a morphism of pairs. Stacks, Lemma 15.12.1, complete construction and final factorization/uniqueness paragraphs; functorial consequences derived explicitly.

**T118** (lemma strand, 22 declarations; module `TauCeti/RingTheory/Henselization`). First three: Tensor products give common targets; Parallel algebra maps can be equalized; A small model for neighbourhoods. Sources: Stacks, Lemma 15.12.1, indicated construction/proof paragraph (+3).Needs: T111, Mathlib, T113, T116, T114, T117.


### Flat base change of annihilators

**T119** `SF.0/flat-annihilator`: Flat base change of annihilators. Stacks, Complete statement and proof of Lemma 10.40.4; the detailed native adapters are authored proof decompositions.

**T120** (lemma strand, 7 declarations; module `TauCeti/RingTheory/Flat/Annihilator`). First three: Ideal extension as a tensor image; Membership in an extended kernel; Annihilator from a generating family. Sources: Stacks, Complete statement and proof of Lemma 10.40.4 (+3).Needs: Mathlib.


### Flat base change of finite cokernels

**T121** `SF.0/flat-cokernel-annihilator`: Flat base change of finite cokernel annihilators. Stacks, Complete Lemma 10.40.4.

**T122** `SF.0/cokernel-basechange-comparison`: Canonical cokernel comparison. Stacks, Complete Lemma 10.12.10.

**T123** (lemma strand, 11 declarations; module `TauCeti/RingTheory/TensorProduct/Quotient`). First three: Canonical quotient square; Annihilator transport through the tensor quotient; Flat base change of quotient annihilators. Sources: Stacks, Complete Lemma 10.12.10 (+1).Needs: Mathlib, T119, T120, T122.


### Ideal sheaves: affine pullback of quotient presheaves

**T124** `SF.0/ideal-comap-quotient-comparison`: Sections of the inverse-image closed subscheme. Stacks, Lemma 26.17.6(1), complete statement and displayed proof.

**T125** `SF.0/quotient-restriction`: Restriction on the quotient section rings. Stacks, Lemma 26.17.6(1), complete displayed statement and proof.

**T126** `SF.0/affine-quotient-presheaf`: The affine quotient presheaf. Stacks, Lemma 26.17.6(1), complete displayed statement and proof.

**T127** `SF.0/closed-subscheme-quotient-natural-isomorphism`: The closed-subscheme quotient natural isomorphism. Stacks, Lemma 26.17.6(1), complete displayed statement and proof.

**T128** `SF.0/quotient-to-closed-sections`: Canonical quotient-to-closed-sections map. Stacks, Lemma 26.17.6(1), complete displayed statement and proof.

**T129** `SF.0/quotient-to-closed-natural-transformation`: Canonical natural transformation for arbitrary morphisms. Stacks, Lemma 26.17.6(1), complete displayed statement and proof.

**T130** (lemma strand, 29 declarations; module `TauCeti/AlgebraicGeometry/IdealSheaf/AffinePullback`). First three: Affine pullback of the full ideal; Restriction of the inverse-image ideal; Affine open section transport. Sources: Stacks, Lemma 26.17.6(1), complete statement and displayed proof (+2).Needs: Mathlib, T124, T125, T126, T127, T128, T129.


### Ideal sheaves: quotients on all opens

**T131** `SF.0/all-open-quotient-restriction`: All-open quotient restriction. Stacks, Example 26.4.3, complete displayed example.

**T132** `SF.0/all-open-quotient-presheaf`: All-open kernel quotient presheaf. Stacks, Example 26.4.3, complete displayed example.

**T133** `SF.0/all-open-to-closed`: All-open map to closed-subscheme sections. Stacks, Example 26.4.3, complete displayed example.

**T134** `SF.0/all-open-sheaf-comparison`: Canonical quotient-sheaf comparison. Stacks, Example 26.4.3, complete displayed example.

**T135** (lemma strand, 16 declarations; module `TauCeti/AlgebraicGeometry/IdealSheaf/AllOpenQuotient`). First three: Restriction preserves the section kernel; Restriction on quotient representatives; Identity quotient restriction. Sources: Stacks, Example 26.4.3, complete displayed example.Needs: Mathlib, T131, T132, T133, T134.


### Ideal sheaves: closed-immersion quotient comparisons

**T136** `SF.0/quotient-to-kernel`: Compare the image-ideal and section-kernel quotients. Stacks, Lemma 26.17.6 complete current statement/proof/comments; closed-section kernel context in Lemma 26.10.1.

**T137** `SF.0/quotient-to-kernel-natural-transformation`: Natural comparison of the two quotient presheaves. Stacks, Lemma 26.17.6 complete current statement/proof/comments; closed-section kernel context in Lemma 26.10.1.

**T138** `SF.0/quotient-comparison-squares/sheaf-map`: Image-ideal quotient to the actual quotient sheaf. Stacks, Lemma 26.17.6, whole displayed statement, proof and three page comments; exact comparison equations are authored deductions.

**T139** (lemma strand, 25 declarations; module `TauCeti/AlgebraicGeometry/IdealSheaf/QuotientComparison`). First three: The comparison preserves every representative; The comparison is always surjective; Factor the canonical closed-section map. Sources: Stacks, Lemma 26.17.6 complete current statement/proof/comments (+3).Needs: T136, Mathlib, T133, T128, T135, T130, T137, T129, T138, T142, T143, T144, T145, T140.


### Ideal sheaves: composite closed immersions

**T140** `SF.0/composite-quotient-isomorphism`: Composite pullback quotient isomorphism. Stacks, Lemma 26.17.6 complete displayed statement/proof and page comments.

**T141** `SF.0/composite-kernel-quotient-isomorphism`: Canonical transport of pullback kernel quotients. Stacks, Lemma 26.17.6 complete displayed statement/proof and page comments.

**T142** `SF.0/composite-quotient-natural-isomorphism`: Natural composite pullback quotient isomorphism. Stacks, Lemma 26.17.6 complete displayed statement/proof and page comments.

**T143** `SF.0/composite-kernel-presheaf-isomorphism`: Composite kernel quotient presheaf comparison. Stacks, Lemma 26.17.6 complete displayed statement, proof and page comments.

**T144** `SF.0/composite-closed-presheaf-isomorphism`: Composite closed-subscheme section comparison. Stacks, Lemma 26.17.6 complete displayed statement, proof and page comments.

**T145** `SF.0/composite-sheafification-isomorphism`: Composite quotient sheafification comparison. Stacks, Lemma 26.17.6 complete displayed statement, proof and page comments.

**T146** (lemma strand, 37 declarations; module `TauCeti/AlgebraicGeometry/IdealSheaf/QuotientComposition`). First three: Composite and iterated extended ideals; Composite quotient comparison on representatives; Inverse composite quotient comparison on representatives. Sources: Stacks, Lemma 26.17.6 complete displayed statement/proof and page comments (+3).Needs: T130, Mathlib, T140, T141, T139, T135, T142, T143, T145, T144, T132.


### Ideal sheaves: coherence of quotient comparisons

**T147** (lemma strand, 10 declarations; module `TauCeti/AlgebraicGeometry/IdealSheaf/QuotientCoherence`). First three: Left identity coherence of image-ideal quotients; Representatives under ideal-data transport; Extensionality on actual quotient representatives. Sources: Stacks, Stacks Lemma 26.17.6 whole statement/proof/three page comments (+1).Needs: T126, Mathlib, T142.


### Excellent rings and schemes

**T148** `SF.0/geometrically-regular-algebra` (definition). For a field k and a commutative k-algebra B, require B Noetherian and L tensor_k B a native regular ring for every finite purely inseparable field extension L/k.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.GeometricallyRegular.regular`, `Excellence.GeometricallyRegular.finite_extension`, `Excellence.GeometricallyRegular.algEquiv`
- Tests: `Excellence.GeometricallyRegular.test_field` [computation] k is geometrically regular over itself.; `Excellence.GeometricallyRegular.test_zero` [degenerate] The zero k-algebra k/(1) is geometrically …; `Excellence.GeometricallyRegular.test_dual_numbers` [non-example] The actual square-zero extension k ⋉ k is not …
- Source: Stacks, Definition 10.166.2 and Lemma 10.166.1.
- Needs: Mathlib `IsRegularRing`, `IsPurelyInseparable` (+1)

**T149** `SF.0/regular-algebra-map` (definition). For a specified R-algebra B, require native Module.Flat R B and, for every prime p of R, Noetherian geometric regularity of the actual fibre κ(p) tensor_R B over κ(p).
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.RegularAlgebraMap.flat`, `Excellence.RegularAlgebraMap.fibre`, `Excellence.RegularAlgebraMap.field_iff`
- Tests: `Excellence.RegularAlgebraMap.test_identity` [compatibility] The identity R-algebra R is regular for any …; `Excellence.RegularAlgebraMap.test_zero` [degenerate] R→R/(1) is regular: its fibres are zero and its …; `Excellence.RegularAlgebraMap.test_flat_not_regular` [non-example] k⋉k is flat as a k-module but its structural …
- Source: Stacks, Definition 15.42.1 and Lemma 15.42.6 (finite field case).
- Needs: T148; Mathlib `Module.Flat`, `Ideal.ResidueField` (+1)

**T150** `SF.0/regular-locus`: Regular locus of an affine scheme. Stacks, Opening paragraph of Section 15.48.

**T151** `SF.0/g-ring` (definition). R is Noetherian and, for every prime p, the canonical R_p-algebra AdicCompletion(m_p,R_p) is a regular algebra map, where R_p is native Localization.AtPrime p and m_p its native maximal ideal.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.IsGRing.noetherian`, `Excellence.IsGRing.completion_regular`, `Excellence.IsGRing.ringEquiv`
- Tests: `Excellence.IsGRing.test_field` [computation] Every field is a G-ring.; `Excellence.IsGRing.test_zero` [degenerate] The zero ring R/(1) is a G-ring: the …; `Excellence.IsGRing.test_complete_local` [compatibility] A native Noetherian local ring which is adically …
- Source: Stacks, Definition 15.51.1; Proposition 15.51.6; Proposition 15.51.12.
- Needs: T149; Mathlib `AdicCompletion`, `IsLocalRing.maximalIdeal`

**T152** `SF.0/j2-ring` (definition). R is Noetherian and the actual regular locus of every finite-type R-algebra B is Zariski open. Quantify over all specified finite-type algebras, rather than checking only R or only its localizations.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.IsJ2.noetherian`, `Excellence.IsJ2.regularLocus_open`, `Excellence.IsJ2.ringEquiv`
- Tests: `Excellence.IsJ2.test_field` [computation] Every field is J-2.; `Excellence.IsJ2.test_zero` [degenerate] The zero ring R/(1) is J-2.; `Excellence.IsJ2.test_singular_allowed` [non-example] k⋉k is J-2, although its regular locus is empty. …
- Source: Stacks, Definition 15.48.1(3).
- Needs: T150; Mathlib `Algebra.FiniteType`

**T153** `SF.0/quasi-excellent-ring` (definition). A commutative ring is quasi-excellent exactly when it is a G-ring and J-2. Noetherianity is retained through both predicates. Universal catenarity is not required in this definition.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.IsQuasiExcellentRing.gRing`, `Excellence.IsQuasiExcellentRing.j2`, `Excellence.IsQuasiExcellentRing.noetherian`
- Tests: `Excellence.IsQuasiExcellentRing.test_field` [computation] Every field is quasi-excellent.; `Excellence.IsQuasiExcellentRing.test_zero` [degenerate] The zero ring R/(1) is quasi-excellent.; `Excellence.IsQuasiExcellentRing.test_nilpotents_allowed` [non-example] k⋉k is quasi-excellent. Reducedness is not part …
- Source: Stacks, Definition 15.53.1(1).
- Needs: T151, T152

**T154** `SF.0/excellent-ring` (definition). A commutative R is excellent exactly when it is quasi-excellent and every finite-type R-algebra is catenary in the existing R03.3/catenary sense: lengths of strict prime chains between each fixed pair are bounded and all saturated chains between that pair have equal length.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.IsExcellentRing.quasiExcellent`, `Excellence.IsExcellentRing.finiteType`, `Excellence.IsExcellentRing.localization`
- Tests: `Excellence.IsExcellentRing.test_field` [computation] Every field is excellent.; `Excellence.IsExcellentRing.test_zero` [degenerate] The zero ring R/(1) is excellent.; `Excellence.IsExcellentRing.test_integers` [computation] The ring of integers Z is excellent.
- Source: Stacks, Definition 15.53.1(2), Lemma 15.53.2 and Proposition 15.53.3.
- Needs: T153, T069; Mathlib `Algebra.FiniteType`

**T155** `SF.0/quasi-excellent-scheme` (definition). For each point x of native Scheme X, there is an affine open U containing x whose actual section ring Γ(X,U) is quasi-excellent. Equivalence to checking every affine open and local Noetherianity are separate lemmas.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.IsQuasiExcellentScheme.affine_iff`, `Excellence.IsQuasiExcellentScheme.locallyNoetherian`, `Excellence.IsQuasiExcellentScheme.iso`
- Tests: `Excellence.IsQuasiExcellentScheme.test_spec` [compatibility] Spec R is quasi-excellent iff R is …; `Excellence.IsQuasiExcellentScheme.test_field` [computation] Spec k is quasi-excellent for every field k.; `Excellence.IsQuasiExcellentScheme.test_zero` [degenerate] The empty scheme Spec(R/(1)) is quasi-excellent.
- Source: Stacks, Definition 29.20.1(1) and Lemma 29.20.5.
- Needs: T153; Mathlib `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.IsAffineOpen`

**T156** `key/excellent-schemes` (definition). For every point x of native Scheme X, require an affine open U containing x with excellent actual section ring Γ(X,U). This is the main reserved excellent-schemes definition.
- Hypotheses: Commutative rings and their specified algebra structures;
- API: `Excellence.IsExcellentScheme.affine_iff`, `Excellence.IsExcellentScheme.quasiExcellent`, `Excellence.IsExcellentScheme.locallyNoetherian`
- Tests: `Excellence.IsExcellentScheme.test_spec` [compatibility] Spec R is excellent iff R is excellent.; `Excellence.IsExcellentScheme.test_field` [computation] Spec k is excellent for every field k.; `Excellence.IsExcellentScheme.test_empty` [degenerate] The empty scheme Spec(R/(1)) is excellent.
- Source: Stacks, Definition 29.20.1(2) and Lemmas 29.20.4–29.20.5.
- Needs: T154; Mathlib `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.IsAffineOpen`

**T157** (lemma strand, 22 declarations; module `TauCeti/AlgebraicGeometry/Excellent`). First three: Geometric regularity of B/k implies native IsRegularRing B; For every finite field extension L/k, L tensor_k B is regular if B is geometrically regular over k; A k-algebra equivalence B ≃ C identifies their geometric-regularity predicates. Sources: Stacks, Definition 10.166.2 and Lemma 10.166.1 (+2).Needs: T148, T149, Mathlib, T150, T151, T152, T153, T154, T155, T156.


<a id="sf1"></a>

## SF.1. Descent, algebraic spaces and stacks

Descent and the two-categorical geometry built on it. Mathlib supplies the fpqc, fppf and étale
topologies with subcanonicity, pseudofunctor descent (`DescentData`, `IsPrestack`, `IsStack`),
relative representability with the diagonal criterion and comonadicity of extension of scalars
along faithfully flat maps; Tau Ceti supplies fppf quotients of affine groups, faithfully flat
descent of Hopf-algebra points, line bundles and Galois descent of vector spaces. SF.1 proves fpqc
descent of quasi-coherent modules and affine morphisms as stacks, Galois descent of
quasi-projective schemes and gluing of sheaves; builds the category of algebraic spaces with
étale-equivalence-relation quotients, presentations, points, étale-local and separation
properties; group spaces, actions, groupoids, stabilizers, torsors, H¹, contracted products,
twisting, categorical and geometric quotients, finite-group quotients and Artin's bootstrap; stacks
in groupoids, stackification, 2-fibre products, representable morphisms, algebraic and
Deligne–Mumford stacks, inertia, quotient and root stacks and quasi-coherent modules on stacks;
moduli functors with fine and coarse moduli spaces, Keel–Mori and tame stacks; and the Galois
gerbs of Langlands–Rapoport (topological extensions, semilinear automorphisms, conjugator schemes,
projective systems). The strands at the end of the layer are the concrete representable-diagonal,
étale-atlas and algebraic-space predicates and the Galois-gerb carriers with their named lemmas.

**Conventions.** Presheaves are functors `Scheme.{u}ᵒᵖ ⥤ Type u`; where the Stacks Project bounds a
site by a cardinal, the universe takes its place. Algebraic spaces over S are algebraic spaces with
a map to `h_S`. Fibres of stacks need not be groupoids; stacks in groupoids are required where the
source requires them. A morphism of spaces or stacks is proper when separated, of finite type and
universally closed on the underlying spaces of the points target. **Imported, never rebuilt:**
ModularCurves 0E (effective descent of affine schemes along one faithfully flat morphism), 0C
(affine quotients by finite groups), 9D (coarse schemes of its quotient problems), StableReduction
Layer 2 (effective étale descent of polarized schemes). **Not here:** cohomology and site
comparisons (SF.2), Picard schemes (SF.3), formal geometry (SF.4), banded gerbes and their H²
classification (the algebraic-moduli roadmap), perfect-site variants (GeometricSatakeAndFusion).

### SF.1a. Descent

**T158** `SF.1/qcoh-pseudofunctor`: The quasi-coherent pullback pseudofunctor. Stacks, Lemma 17.10.4 (tag 01BG).

**T159** `SF.1/qcoh-fpqc-descent`: Fpqc descent for quasi-coherent sheaves. Stacks, Proposition 35.5.2 (tag 023T) and its proof.

**T160** `SF.1/affine-fpqc-descent`: Fpqc descent of affine morphisms. Stacks, Lemma 35.37.1 (tag 0245) with proof.

**T161** `SF.1/galois-descent-quasi-projective`: Descent of quasi-projective schemes along finite locally free coverings. Stacks, Lemma 39.25.3 (tag 0CCJ) and Lemma 39.25.2.

**T162** `SF.1/sheaf-stack`: Sheaves on a site form a stack. Stacks, Lemmas 7.26.1 (04TQ) and 7.26.4 (04TR), with proofs.

**T163** `SF.1/quasi-finite-descent`: Fppf descent of separated locally quasi-finite morphisms. Stacks, Lemma 37.57.1 (tag 02W8).

**T164** `SF.1/space-fppf-descent`: Fppf descent of algebraic spaces. Stacks, Lemmas 80.11.1 (04SK) and 80.11.3 (0ADV).


### SF.1b. Algebraic spaces

**T165** `SF.1/algebraic-space-category`: The category of algebraic spaces. Stacks, Definition 65.6.1 (tag 025Y).

**T166** `SF.1/etale-equivalence-relation` (definition). Let U be an algebraic space over a base S (in particular a scheme). A pre-relation on U is a morphism j = (t, s) : R -> U x_S U; it is an equivalence relation if j is a monomorphism and for every scheme T the image of R(T) in U(T) x U(T) is an equivalence relation.
- Hypotheses: U and R algebraic spaces (schemes in the scheme-level statements) over S;
- API: `Spaces.EtaleEquivRel.refl`, `Spaces.EtaleEquivRel.symm`, `Spaces.EtaleEquivRel.trans`, `Spaces.EtaleEquivRel.restrict`, `Spaces.EtaleEquivRel.ofAtlas`
- Tests: `Spaces.EtaleEquivRel.test_diagonal` [degenerate] For any scheme U the diagonal U -> U x_S U is an …; `Spaces.EtaleEquivRel.test_fold` [computation] For the fold map U ⊔ U -> U, the kernel pair is …; `Spaces.EtaleEquivRel.test_folded_line` [computation] For char k ≠ 2, R = Δ ⊔ Γ in A^1_k x A^1_k with Γ …
- Source: Stacks, Definition 39.3.1 (tag 022P).
- Needs: T217; Mathlib `AlgebraicGeometry.Etale`

**T167** `SF.1/quotient-sheaf`: The fppf quotient sheaf of a pre-relation. Stacks, Definition 39.20.1 (tag 02VG), Lemmas 39.20.3 (03C5) and 39.20.6 (02VH).

**T168** `SF.1/etale-quotient-theorem`: Quotients of schemes by etale equivalence relations. Stacks, Theorem 65.10.5 (tag 02WW) with proof; Lemma 65.10.4 (tag 0265).

**T169** `SF.1/space-presentation`: Presentations of algebraic spaces. Stacks, Lemma 65.9.1 (tag 0262) and Definition 65.9.3 (tag 0263).

**T170** `SF.1/space-points`: The topological space of an algebraic space or stack. Stacks, Definitions 66.4.1 (03BU) and 66.4.7 (03BY), Lemma 66.4.8 (03BZ).

**T171** `SF.1/etale-local-properties` (definition). Let P be a property of morphisms of schemes that is etale local on the source-and-target (local at the source and at the target for Mathlib's etale precoverage and stable under precomposition with etale morphisms;
- Hypotheses: P etale local on the source-and-target; squares with etale vertical maps from schemes and U -> X surjective.
- API: `Spaces.EtaleLocal.iff_forall_square`, `Spaces.EtaleLocal.ofScheme_iff`, `Spaces.EtaleLocal.iff_presheaf`, `Spaces.EtaleLocal.comp`, `Spaces.EtaleLocal.baseChange`
- Tests: `Spaces.EtaleLocal.test_identity` [degenerate] The identity of any algebraic space is etale.; `Spaces.EtaleLocal.test_scheme` [compatibility] A morphism of schemes is smooth as a morphism of …; `Spaces.EtaleLocal.test_atlas` [characterisation] For an etale equivalence relation R on U, the …
- Source: Stacks, Lemma 67.22.1 (03MJ) and Definition 67.22.2 (04RD).
- Needs: T169, T216; Mathlib `CategoryTheory.MorphismProperty.IsLocalAtSource`, `CategoryTheory.MorphismProperty.IsLocalAtTarget` (+6)

**T172** `SF.1/separation-properness-spaces` (definition). For a morphism f : X -> Y of algebraic spaces, the diagonal Δ_f : X -> X x_Y X is representable by schemes. Then f is separated, locally separated or quasi-separated if Δ_f is a closed immersion, an immersion, or quasi-compact (as a representable morphism, Mathlib relative).
- Hypotheses: X, Y algebraic spaces; |.| from SF.1/space-points; locally of finite type from SF.1/etale-local-properties.
- API: `Spaces.diagonal_representable`, `Spaces.IsSeparated.ofScheme_iff`, `Spaces.QuasiSeparated.iff_affine_charts`, `Spaces.IsSeparated.iff_affine_charts`, `Spaces.IsProper.baseChange`
- Tests: `Spaces.Separated.test_doubled_origin` [compatibility] The affine line with doubled origin is a scheme …; `Spaces.Separated.test_folded_line` [computation] The folded line is quasi-separated and not …; `Spaces.Separated.test_translation_quotient` [non-example] In characteristic zero A^1_k/Z is not …
- Source: Stacks, Definitions 67.4.2 (03HL), 67.9.2 (03HI), 67.40.1 (03ZM); Definition 65.13.2 (02X5); Lemmas 66.3.3 (0AHR) and 66.3.4 (0AHS).
- Needs: T170, T171, T215; Mathlib `CategoryTheory.MorphismProperty.relative`, `AlgebraicGeometry.IsClosedImmersion` (+7)

**T173** `SF.1/space-fibre-products`: Fibre products of algebraic spaces and chart products. Stacks, Lemmas 65.7.1 (02X0) and 65.7.3 (02X2).

**T174** `SF.1/small-etale-site`: The small etale ringed site of an algebraic space. Stacks, Definitions 66.18.1 (03ED), 66.18.2 (03G0), 66.21.2 (03G7).

**T175** `SF.1/space-quasi-coherent` (definition). For an algebraic space X, QCoh(X) is the full subcategory of O_X-modules on the ringed site (X_et, O_X) satisfying Mathlib's SheafOfModules.IsQuasicoherent. Pullback along morphisms of algebraic spaces preserves quasi-coherence.
- Hypotheses: X an algebraic space; quasi-coherence in the sense of Modules on Sites 18.23.1 on (X_et, O_X).
- API: `Spaces.QCoh`, `Spaces.QCoh.pullback`, `Spaces.QCoh.ofSchemeEquiv`, `Spaces.QCoh.presentationEquiv`, `Spaces.QCoh.invertible_aut`
- Tests: `Spaces.QCoh.test_scheme` [compatibility] For a scheme Y, QCoh(h_Y) is equivalent to …; `Spaces.QCoh.test_folded_line_structure_sheaf` [computation] For the folded line X (char k ≠ 2), O_X is …; `Spaces.QCoh.test_empty` [degenerate] QCoh of the empty algebraic space is equivalent …
- Source: Stacks, Definition 66.29.1 (03G9) and Proposition 66.32.1 (03M3).
- Needs: T174, T158, T159, T169; Mathlib `SheafOfModules.IsQuasicoherent`

**T176** `SF.1/folded-line-space`: The folded line is an algebraic space that is not a scheme. Stacks, Example 65.14.1 (tag 02Z1).

**T177** `SF.1/translation-quotient-space`: The quotient of the affine line by translations. Stacks, Lemma 66.34.1 (071S), Example 65.14.8 (02Z7), Lemma 66.3.3 (0AHR).


### SF.1c. Group spaces, torsors and quotients

**T178** `SF.1/group-action` (definition). Let B be an algebraic space over S (for instance a scheme). A group algebraic space over B is a group object (Mathlib GrpObj) in the cartesian monoidal category AlgSp/B;
- Hypotheses: Left actions, as in Stacks 39.10 and 78.8; a right action is converted by inversion.
- API: `Groups.GroupSpace`, `Groups.Action`, `Groups.Action.free_iff_mono`, `Groups.Action.baseChange`, `Groups.Action.constantEquiv`
- Tests: `Groups.Action.test_translation_free` [characterisation] G acting on itself by left translation is free.; `Groups.Action.test_scaling_not_free` [non-example] G_m acting on A^1 by scaling is not free: the …; `Groups.Action.test_constant_group` [compatibility] The action of the constant group scheme (Z/2)_k …
- Source: Stacks, Definitions 78.5.1 (043H), 78.8.1 (043Q), 78.8.2 and Lemma 78.8.3 (06P9).
- Needs: T173, T165; Mathlib `CategoryTheory.GrpObj`, `CategoryTheory.ModObj` (+3); Tau Ceti `TauCeti.ConstantGroup.groupScheme`

**T179** `SF.1/groupoid-space` (definition). A groupoid in algebraic spaces over B is a quintuple (U, R, s, t, c) of algebraic spaces and morphisms over B, with c : R x_{s,U,t} R -> R, such that for every scheme T the quintuple (U(T), R(T), s, t, c) is a groupoid;
- Hypotheses: U, R algebraic spaces over B; groupoid axioms tested on T-points.
- API: `Groups.Groupoid.e`, `Groups.Groupoid.i`, `Groups.Groupoid.ofAction`, `Groups.Groupoid.ofEquivRel`, `Groups.Groupoid.restrict` (+1)
- Tests: `Groups.Groupoid.test_trivial` [degenerate] (U, U, id, id, id) is a groupoid: the discrete …; `Groups.Groupoid.test_action_trivial_group` [compatibility] The action groupoid of the trivial group acting …; `Groups.Groupoid.test_indiscrete` [computation] (U, U x_B U, pr_2, pr_1, composition) is a …
- Source: Stacks, Definition 78.11.1 (043W).
- Needs: T178, T166, T173

**T180** `SF.1/stabilizer`: Stabilizer group spaces. Stacks, Definition 78.16.2 (0448).

**T181** `SF.1/torsor` (definition). Let G be a group algebraic space over B. A pseudo G-torsor is an algebraic space P over B with a G-action such that (a, pr_2) : G x_B P -> P x_B P is an isomorphism.
- Hypotheses: G a group algebraic space over B; for the fppf default G is flat and locally of finite presentation over B, for fpqc torsors G is flat and affine over B.
- API: `Groups.Torsor.trivial`, `Groups.Torsor.trivial_iff_section`, `Groups.Torsor.hom_isIso`, `Groups.Torsor.baseChange`, `Groups.Torsor.cechEquiv` (+1)
- Tests: `Groups.Torsor.test_trivial` [degenerate] The trivial torsor G is a G-torsor with the …; `Groups.Torsor.test_frobenius_mu_p` [computation] In characteristic p, G_m with μ_p acting by …; `Groups.Torsor.test_frobenius_twisted_action` [non-example] For a smooth group G of positive dimension over …
- Source: Stacks, Definition 78.9.3 (04TY) and Definition 78.9.1.
- Needs: T178, T171; Mathlib `CategoryTheory.PresheafOfGroups.H1`, `AlgebraicGeometry.Scheme.fppfTopology` (+2); Tau Ceti `TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor`

**T182** `SF.1/torsor-cohomology`: The pointed set of torsor classes. Poonen 2017, Section 5.12.4 (classification of torsors, Proposition 5.12.14) and Proposition 6.5.9, Example 6.5.5, pp. 154-181.

**T183** `SF.1/torsor-representability`: Representability of torsors. An fppf sheaf over `S` with a `G`-action that is a pseudo-torsor (`G × P ≅ P × P`) and trivial over an fppf cover of `S`, with no algebraicity assumed on it, is an algebraic space, hence a torsor in the sense of T181: it is fppf-locally the algebraic space `G ×_S S_i`, and the definition of an algebraic space is fppf local. Stacks, Lemma 80.11.1 (tag 04SK), Bootstrap, Section 80.11; Poonen 2017, Theorem 6.5.10(i) and Remark 6.5.11, pp. 181-182.

**T184** `SF.1/contracted-product`: Contracted products and twisting by torsors. Poonen 2017, Sections 5.12.5.2 (contracted products) and 6.5.6 (geometric operations over a base), pp. 155-183.

**T185** `SF.1/twisting-bijection`: Twisting torsors and forms. Poonen 2017, Theorem 4.5.2 with proof, Sections 5.12.5.1 and 6.5.6.4, pp. 105-183.

**T186** `SF.1/categorical-geometric-quotient` (definition). Let j = (t, s) : R -> U x_B U be a pre-relation of algebraic spaces over B (for instance a group action). A morphism φ : U -> X over B is R-invariant if φ s = φ t.
- Hypotheses: Invariance and quotients are taken in algebraic spaces over B;
- API: `Groups.IsInvariant`, `Groups.IsCategoricalQuotient`, `Groups.IsCategoricalQuotient.unique`, `Groups.IsGeometricQuotient`, `Groups.IsGeometricQuotient.isCategoricalQuotient`
- Tests: `Groups.Quotient.test_finite_affine` [computation] For a finite group G acting on Spec A over Spec …; `Groups.Quotient.test_scaling_plane` [non-example] For G_m acting on A^2_k by scaling, A^2 -> Spec k …; `Groups.Quotient.test_punctured_plane` [computation] For G_m acting on A^2_k minus the origin by …
- Source: Stacks, Definitions 83.3.1 (048E), 83.4.1 (048J), 83.10.1 (04AE).
- Needs: T179, T178, T170, T174, T165

**T187** (removed). Quotients of affine schemes by finite groups, with the universal property, integrality and surjectivity of the projection and the orbit description of its fibres, are Tau Ceti `TauCeti.AffineInvariantQuotient` (modules `TauCeti.AlgebraicGeometry.Quotient.Affine` and `TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine`) and Tau Ceti ModularCurves Layer 0C; see the boundaries section.

**T188** `SF.1/artin-bootstrap`: Artin's theorem on fppf quotients and fppf-local algebraic spaces. Stacks, Theorem 80.10.1 (04S6); Lemmas 80.11.1 (04SK), 80.11.6 (06PG), 80.11.7 (06PH).


### SF.1d. Algebraic stacks

**T189** `SF.1/stack-in-groupoids` (definition). A stack in groupoids over Sch (with the fppf topology) is a pseudofunctor X : LocallyDiscrete(Sch^op) -> Cat whose fibre categories X(T) are groupoids and which is a stack for Mathlib's fppfTopology (Mathlib IsStack: descent of morphisms and effective descent of objects, following Giraud).
- Hypotheses: Fibre categories in Cat.{u, u+1}; the fppf topology of Mathlib on Scheme.{u}.
- API: `Stacks.StackInGroupoids`, `Stacks.StackInGroupoids.ofSheaf`, `Stacks.StackInGroupoids.yonedaEquiv`, `Stacks.StackInGroupoids.isFiberedInGroupoids`, `Stacks.StackInGroupoids.limit`
- Tests: `Stacks.StackInGroupoids.test_scheme` [compatibility] For a scheme X the discrete pseudofunctor T |-> …; `Stacks.StackInGroupoids.test_torsors` [characterisation] For G flat and locally of finite presentation, T …; `Stacks.StackInGroupoids.test_qcoh_not_groupoid` [non-example] The quasi-coherent pseudofunctor is a stack but …
- Source: Stacks, Definitions 8.4.1 (026F) and 8.5.1 (02ZI); Lemma 8.6.3 (0432).
- Needs: Mathlib `CategoryTheory.Pseudofunctor`, `CategoryTheory.Pseudofunctor.IsStack` (+7)

**T190** `SF.1/stackification`: Stackification of prestacks in groupoids. Stacks, Lemma 8.9.1 (02ZP) and Section 8.9 (02ZO).

**T191** `SF.1/two-fibre-product`: 2-fibre products of stacks in groupoids. Stacks, Lemma 8.5.6 (02ZL); Chapter 4, Section 4.31 (003O).

**T192** `SF.1/representable-stack-morphism` (definition). A 1-morphism f : X -> Y of stacks in groupoids is representable by algebraic spaces if for every scheme T and every object y of Y(T) (a 1-morphism T -> Y) the 2-fibre product T x_Y X is equivalent to the stack of an algebraic space over T.
- Hypotheses: X, Y stacks in groupoids; algebraic spaces as in SF.1/algebraic-space-category.
- API: `Stacks.IsRepresentableBySpaces`, `Stacks.IsRepresentableBySpaces.baseChange`, `Stacks.IsRepresentableBySpaces.comp`, `Stacks.diag_representable_iff`, `Stacks.RepresentableProperty`
- Tests: `Stacks.Representable.test_identity` [degenerate] The identity of a stack in groupoids is …; `Stacks.Representable.test_spaces` [compatibility] Every morphism between (stacks of) algebraic …; `Stacks.Representable.test_point_to_BG` [computation] The morphism S -> BG of the trivial torsor is …
- Source: Stacks, Definition 94.9.1 (02ZW) and Section 94.10 (03YJ).
- Needs: T191, T189, T165, T173; Mathlib `CategoryTheory.Functor.relativelyRepresentable`, `CategoryTheory.Functor.relativelyRepresentable.diag_iff`

**T193** `SF.1/algebraic-stack` (definition). An algebraic (Artin) stack over S is a stack in groupoids X over Sch/S (fppf) such that the diagonal X -> X x_S X is representable by algebraic spaces and there is a scheme U with a 1-morphism U -> X that is smooth and surjective (as a representable morphism, by SF.1/representable-stack-morphism).
- Hypotheses: Stacks over S as in SF.1/stack-in-groupoids; smooth and surjective tested on base changes to schemes.
- API: `Stacks.IsAlgebraicStack`, `Stacks.IsAlgebraicStack.diagonal`, `Stacks.IsAlgebraicStack.atlas`, `Stacks.IsAlgebraicStack.ofSpace`, `Stacks.IsAlgebraicStack.twoFiberProduct` (+1)
- Tests: `Stacks.AlgebraicStack.test_scheme` [degenerate] The stack of a scheme is an algebraic stack.; `Stacks.AlgebraicStack.test_BGm` [computation] BG_m over Spec Z is an algebraic stack with …; `Stacks.AlgebraicStack.test_qcoh` [non-example] The quasi-coherent pseudofunctor is not an …
- Source: Stacks, Definition 94.12.1 (026O), Lemma 94.14.3 (04T2).
- Needs: T189, T192, T191, T217; Mathlib `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Surjective`

**T194** `SF.1/deligne-mumford-stack` (definition). An algebraic stack X is Deligne-Mumford if there is a scheme W and an etale surjective 1-morphism W -> X. Equivalently (Stacks Theorem 101.21.6) its diagonal is unramified, i.e.
- Hypotheses: X an algebraic stack; unramified = formally unramified and locally of finite type, for representable morphisms.
- API: `Stacks.IsDeligneMumford`, `Stacks.IsDeligneMumford.iff_unramified_diagonal`, `Stacks.IsDeligneMumford.isAlgebraic`, `Stacks.IsDeligneMumford.ofSpace`, `Stacks.IsDeligneMumford.twoFiberProduct`
- Tests: `Stacks.DM.test_space` [degenerate] The stack of an algebraic space is …; `Stacks.DM.test_finite_etale` [computation] For a finite constant group G over S, BG is …; `Stacks.DM.test_mu_p` [non-example] Over F_p, Bμ_p is algebraic but not …
- Source: Stacks, Definition 94.12.2 (03YO).
- Needs: T193, T192; Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.FormallyUnramified`

**T195** `SF.1/inertia`: Inertia stacks and automorphism group spaces. Stacks, Section 8.7 (036X), Lemmas 8.7.1 (036Y) and 8.7.2 (04ZM).

**T196** `SF.1/setoid-criterion`: Algebraic stacks with trivial inertia are algebraic spaces. Stacks, Proposition 94.13.3 (04SZ).

**T197** `SF.1/stack-morphism-properties` (definition). Let f : X -> Y be a morphism of algebraic stacks. (a) For P a property of morphisms of algebraic spaces smooth local on the source-and-target (smooth, flat, locally of finite presentation or type, surjective), f has P if for smooth atlases V -> Y and U -> X x_Y V the composite U -> V has P;
- Hypotheses: Algebraic stacks; |.| from SF.1/space-points; properties of morphisms of spaces from SF.1/etale-local-properties and SF.1/separation-properness-spaces.
- API: `Stacks.SmoothLocal`, `Stacks.SmoothLocal.atlas_independent`, `Stacks.IsSeparatedStack`, `Stacks.IsProperStack`, `Stacks.IsProperStack.of_representable` (+1)
- Tests: `Stacks.Properties.test_BG_finite` [computation] For a finite constant group G over S, BG -> S is …; `Stacks.Properties.test_BGm` [non-example] BG_m -> Spec Z is smooth and of finite type but …; `Stacks.Properties.test_doubled_origin` [non-example] The affine line with doubled origin over k is of …
- Source: Stacks, Definitions 101.4.1 (04YW), 101.13.2 (0513), 101.16.2 (06FN), 101.37.1 (0CL5).
- Needs: T193, T192, T170, T171, T172

**T198** `SF.1/stack-presentation`: Presentations of algebraic stacks and atlas independence. Stacks, Theorem 94.17.3 (04TK), Lemma 94.16.2 (04T5), Theorems 97.16.1 (06DC) and 97.17.2 (06FI).

**T199** `SF.1/quotient-stack`: Quotient stacks. Stacks, Definition 78.20.1 (044Q), Lemmas 78.22.2 (04M9), 78.23.2 (044U), 78.26.1 (06PB).

**T200** `SF.1/quotient-stack-algebraic`: Algebraicity of quotient stacks and stabilizer conditions. Stacks, Theorems 94.17.3 (04TK) and 97.17.2 (06FI).

**T201** `SF.1/line-bundle-section-stack`: The stack [A^1/G_m] classifies line bundles with a section. Cadman 2005, Section 2.2, p. 6 (identification of the CFG A with [A^1/G_m]).

**T202** `SF.1/root-stack`: Root stacks of line bundles with sections. Cadman 2005, Definitions 2.1, 2.3, 2.5; Theorem 2.2 with proof; Proposition 2.4 (Sections 2.1-2.2, pp. 3-6).

**T203** `SF.1/stack-quasi-coherent` (definition). For a stack in groupoids X over Sch, QCoh(X) is the category of quasi-coherent modules on the ringed site (X_fppf, O_X), equivalently compatible families (F_x in QCoh(T) for every x in X(T), with pullback isomorphisms for morphisms of X satisfying the cocycle condition).
- Hypotheses: X a stack in groupoids (algebraic for the presentation statement);
- API: `Stacks.QCoh`, `Stacks.QCoh.pullback`, `Stacks.QCoh.presentationEquiv`, `Stacks.QCoh.pushforward`, `Stacks.QCoh.ofSpaceEquiv`
- Tests: `Stacks.QCoh.test_scheme` [compatibility] For a scheme Y, QCoh of the stack of Y is …; `Stacks.QCoh.test_BG_representations` [computation] For an affine group scheme G over a field k, …; `Stacks.QCoh.test_pushforward_invariants` [computation] For a finite group G acting on Spec A and π : …
- Source: Stacks, Definition 96.11.1 (06WG) and Proposition 96.14.3 (06WT).
- Needs: T158, T159, T189, T199, T175; Mathlib `CategoryTheory.Pseudofunctor.CoGrothendieck`


### SF.1e. Moduli functors, fine and coarse moduli spaces

**T204** `SF.1/moduli-functor`: The moduli functor of a stack. Stacks, Lemma 8.6.3 (0432); Chapter 4, Section 4.39 (04S9).

**T205** `SF.1/fine-moduli-space` (definition). A fine moduli space for a stack in groupoids X over S is an algebraic space M over S together with an equivalence of stacks h_M ≃ X; the universal object is the object of X(M) corresponding to id_M.
- Hypotheses: X a stack in groupoids over S; M an algebraic space over S.
- API: `Moduli.FineModuliSpace`, `Moduli.FineModuliSpace.universal`, `Moduli.FineModuliSpace.unique`, `Moduli.FineModuliSpace.inertia_trivial`, `Moduli.FineModuliSpace.toCoarse`
- Tests: `Moduli.FineModuliSpace.test_space` [degenerate] An algebraic space M is a fine moduli space for …; `Moduli.FineModuliSpace.test_BG` [non-example] For a nontrivial finite group G over an …; `Moduli.FineModuliSpace.test_torsor_quotient` [computation] For a free action of a finite group G on a …
- Source: Stacks, Proposition 94.13.3 (04SZ).
- Needs: T204, T196, T189, T165

**T206** `SF.1/coarse-moduli-space` (definition). Let X be an algebraic stack. A morphism π : X -> M to an algebraic space is a categorical moduli space if every morphism X -> W to an algebraic space factors uniquely through π;
- Hypotheses: X an algebraic stack; M an algebraic space; k ranges over algebraically closed fields.
- API: `Moduli.IsCategoricalModuliSpace`, `Moduli.IsCoarseModuliSpace`, `Moduli.IsCoarseModuliSpace.unique`, `Moduli.IsCoarseModuliSpace.ofFine`, `Moduli.IsCategoricalModuliSpace.quotient_iff` (+1)
- Tests: `Moduli.Coarse.test_space` [degenerate] For an algebraic space X, id : X -> X is a coarse …; `Moduli.Coarse.test_BG` [computation] For a finite constant group G over an …; `Moduli.Coarse.test_finite_quotient` [computation] For a finite group G acting on Spec A, [Spec A/G] …
- Source: Stacks, Section 106.12 (0DUF): Definition 106.12.1, Lemmas 106.12.2-106.12.4.
- Needs: T193, T165, T186, T204

**T207** `SF.1/keel-mori`: The Keel-Mori theorem. Conrad 2005, Theorem 1.1 and the paragraph after it (pp. 1-2); Lemmas 2.1-2.2 and Remark 2.3 (pp. 2-3).

**T208** `SF.1/finite-quotient-coarse`: Coarse spaces of finite quotient stacks. Stacks, Lemmas 106.12.2 and 106.12.3.

**T209** `SF.1/tame-stack` (definition). Let M be an algebraic stack locally of finite presentation over S with finite inertia, and ρ : M -> M its coarse moduli space (SF.1/keel-mori). M is tame if ρ_* : QCoh(M) -> QCoh(M) is exact.
- Hypotheses: M lfp over S with finite inertia; QCoh and ρ_* from SF.1/stack-quasi-coherent.
- API: `Moduli.IsTame`, `Moduli.IsTame.classifying_iff`, `Moduli.IsTame.baseChange`, `Moduli.IsTame.geometric_fibres`
- Tests: `Moduli.Tame.test_space` [degenerate] An algebraic space with finite (trivial) inertia …; `Moduli.Tame.test_invertible_order` [computation] For a finite constant group G whose order is …; `Moduli.Tame.test_Z_mod_p` [non-example] For G = Z/p over F_p, BG is not tame: taking …
- Source: Abramovich–Olsson–Vistoli 2008, Definition 3.1 and the remark after it (Section 3).
- Needs: T207, T203, T195; Tau Ceti `TauCeti.linearlyReductiveAffineGroupSchemeProperty`

**T210** `SF.1/tame-local-structure`: Local structure and base change of tame stacks. Abramovich–Olsson–Vistoli 2008, Theorem 3.2, Corollaries 3.3-3.5 with proofs, Proposition 3.6 (Section 3).


### SF.1f. Galois gerbs: missing inputs

**T211** `SF.1/semilinear-automorphism` (definition). Let k'/k be a Galois extension with Γ = Gal(k'/k) (Krull topology), H a linear algebraic group over k' (an affine k'-group scheme of finite type, i.e. a finitely generated commutative Hopf k'-algebra O(H)), and σ in Γ.
- Hypotheses: k'/k Galois; H affine of finite type over k'; the semilinear structure is over the fixed embedding k -> k'.
- API: `GaloisGerbs.SemilinearAut`, `GaloisGerbs.SemilinearAut.toPointsAut`, `GaloisGerbs.SemilinearAut.comp`, `GaloisGerbs.SemilinearAut.standard`, `GaloisGerbs.SemilinearAut.linear_iff`
- Tests: `GaloisGerbs.SemilinearAut.test_gm_conjugation` [computation] For k'/k = C/R and H = G_m, the σ-semilinear …; `GaloisGerbs.SemilinearAut.test_identity_not_semilinear` [non-example] For C/R, H = G_m and σ complex conjugation, the …; `GaloisGerbs.SemilinearAut.test_trivial_extension` [degenerate] For k' = k, SemilinearAut(H) is the group of …
- Source: Kisin 2017, Section 3.1.1, condition (1), pp. 34-35.
- Needs: T221; Mathlib `CommHopfAlgCat`, `krullTopology` (+1); Tau Ceti `TauCeti.ScalarAut.instMulSemiringAction`

**T212** `SF.1/galois-descent-affine`: Galois descent for affine schemes and affine group schemes. Stacks, Section 35.6 (0CDQ).

**T213** `SF.1/conjugator-representability`: Representability of conjugator schemes of Galois-gerb morphisms. Kisin 2017, Section 3.1.1 (definition of Isom(f_1, f_2) and I_f) and Lemma 3.1.2 with proof, pp. 35-36.

**T214** `SF.1/crossed-module-category` (definition). A crossed module is a group homomorphism ∂ : H~ -> H together with an action of H on H~ by automorphisms such that ∂(h.x) = h ∂(x) h^{-1} and ∂(x).y = x y x^{-1}.
- Hypotheses: Groups H~ and H; action by group automorphisms; no topology.
- API: `GaloisGerbs.CrossedModule`, `GaloisGerbs.CrossedModule.quotientCategory`, `GaloisGerbs.CrossedModule.isGroupoid`, `GaloisGerbs.CrossedModule.isoClasses`, `GaloisGerbs.CrossedModule.aut` (+1)
- Tests: `GaloisGerbs.CrossedModule.test_identity` [computation] For ∂ = id : H -> H with conjugation, H/H~ has …; `GaloisGerbs.CrossedModule.test_trivial` [degenerate] For H~ = 1, H/H~ is the discrete category on H.; `GaloisGerbs.CrossedModule.test_center` [computation] For ∂ : H~ -> H with H~ = SL_2(C), H = PGL_2(C) …
- Source: Kisin 2017, Section 3.2.1, pp. 39-40.
- Needs: Mathlib `MonoidHom.ker`, `CategoryTheory.IsGroupoid` (+1)


### Algebraic spaces: representable diagonals and étale atlases

**T215** `SF.1/representable-diagonal` (definition). For a native Scheme-valued-domain presheaf F, the canonical native product diagonal F→F×F is relatively representable with respect to the native Yoneda functor.
- Hypotheses: Native Scheme.{u} and presheaves Scheme^{op}→Type u; all maps are actual natural transformations.
- API: `Spaces.RepresentableDiagonal.of_scheme`, `Spaces.RepresentableDiagonal.iso`, `Spaces.RepresentableDiagonal.from_scheme`
- Tests: `Spaces.RepresentableDiagonal.test_field` [computation] h_Spec(k) has representable diagonal for every …; `Spaces.RepresentableDiagonal.test_empty` [degenerate] The actual native empty scheme has representable …; `Spaces.RepresentableDiagonal.test_nonreduced` [compatibility] The actual scheme Spec(k⋉k) has representable …
- Source: Stacks, Definition 65.6.1 and Lemma 65.6.2; accompanying generality discussion.
- Needs: Mathlib `CategoryTheory.Functor.relativelyRepresentable`, `CategoryTheory.yoneda`

**T216** `SF.1/etale-atlas` (definition). For a native presheaf F, a scheme U and natural transformation a:h_U→F, require native relative etaleness and relative surjectivity. Thus every base change along h_T→F is represented by a scheme V, and the actual morphism V→T is etale and surjective.
- Hypotheses: Native Scheme.{u} and presheaves Scheme^{op}→Type u; all maps are actual natural transformations.
- API: `Spaces.EtaleAtlas.representable`, `Spaces.EtaleAtlas.etale`, `Spaces.EtaleAtlas.surjective`, `Spaces.EtaleAtlas.yoneda_iff`
- Tests: `Spaces.EtaleAtlas.test_identity` [compatibility] The identity of h_X is an atlas for every scheme …; `Spaces.EtaleAtlas.test_empty_identity` [degenerate] The identity of the actual empty scheme is an …; `Spaces.EtaleAtlas.test_empty_not_cover` [non-example] For every field k, no transformation from h_empty …
- Source: Stacks, Definition 65.6.1 and Lemma 65.6.2; accompanying generality discussion.
- Needs: Mathlib `CategoryTheory.MorphismProperty.presheaf`, `AlgebraicGeometry.Etale` (+1)

**T217** `SF.1/algebraic-space` (definition). A native scheme presheaf F is an absolute algebraic space when it is a sheaf for native Scheme.fppfTopology, has representable diagonal, and admits an etale scheme atlas.
- Hypotheses: Native Scheme.{u} and presheaves Scheme^{op}→Type u; all maps are actual natural transformations.
- API: `Spaces.IsAlgebraicSpace.sheaf`, `Spaces.IsAlgebraicSpace.diagonal`, `Spaces.IsAlgebraicSpace.atlas`, `Spaces.IsAlgebraicSpace.of_scheme`, `Spaces.IsAlgebraicSpace.iso`
- Tests: `Spaces.IsAlgebraicSpace.test_field` [computation] h_Spec(k) is an algebraic space for every field k.; `Spaces.IsAlgebraicSpace.test_empty` [degenerate] h_empty is an algebraic space.; `Spaces.IsAlgebraicSpace.test_nonreduced` [compatibility] h_Spec(k⋉k) is an algebraic space, without a …
- Source: Stacks, Definition 65.6.1 and Lemma 65.6.2; accompanying generality discussion.
- Needs: T215, T216; Mathlib `CategoryTheory.Presheaf.IsSheaf`, `AlgebraicGeometry.Scheme.fppfTopology`

**T218** (lemma strand, 12 declarations; module `TauCeti/AlgebraicGeometry/AlgebraicSpace`). First three: The Yoneda presheaf of every scheme has representable diagonal, without a quasi-separatedness hypothesis; An isomorphism F≅G of native presheaves identifies their representable-diagonal predicates; If F has representable diagonal, every natural transformation h_X→F from a scheme is relatively representable. Sources: Stacks, Definition 65.6.1 and Lemma 65.6.2 (+1).Needs: T215, T216, T217.


### Galois gerbs

**T219** `SF.1/topological-extension` (definition). For discrete group N and topological groups E,Γ, refine the native GroupExtension N E Γ by requiring the kernel inclusion to be a topological embedding and the quotient map to be continuous and a quotient map.
- Hypotheses: For the topological prefix use groups with the stated topologies and a discrete kernel.
- API: `GaloisGerbs.TopologicalExtension.kernel_iff`, `GaloisGerbs.TopologicalExtension.inl_project`, `GaloisGerbs.TopologicalExtension.continuous_projection`
- Tests: `GaloisGerbs.TopologicalExtension.test_kernel` [characterisation] For the neutral extension N⋊Γ, an element lies in …; `GaloisGerbs.TopologicalExtension.test_unit` [degenerate] The trivial-kernel identity extension Γ→Γ has the …; `GaloisGerbs.TopologicalExtension.test_wrong_topology` [non-example] Giving the embedded kernel a strictly coarser …
- Source: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.
- Needs: Mathlib `GroupExtension`, `Topology.IsEmbedding` (+1)

**T220** `SF.1/local-splitting-chart` (definition). For a topological extension T, a local splitting chart records an open subgroup U⊂Γ, a continuous homomorphism s:U→E with q∘s the inclusion U→Γ, and a homeomorphism N×U≅q⁻¹(U) sending (n,u) to i(n)s(u).
- Hypotheses: For the topological prefix use groups with the stated topologies and a discrete kernel.
- API: `GaloisGerbs.LocalSplitChart.section_one`, `GaloisGerbs.LocalSplitChart.section_mul`, `GaloisGerbs.LocalSplitChart.chart_value`
- Tests: `GaloisGerbs.LocalSplitChart.test_neutral` [computation] The neutral extension has U=Γ and s(γ)=(1,γ), …; `GaloisGerbs.LocalSplitChart.test_c4` [non-example] For C4→C2, the trivial open subgroup has a chart …; `GaloisGerbs.LocalSplitChart.test_unit_coordinate` [computation] The chart sends (1,1) to 1, and (n,1) to i(n).
- Source: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.
- Needs: T219; Mathlib `Homeomorph`

**T221** `key/galois-gerbs` (definition). Fix a characteristic-zero field k, a Galois extension k′/k inside an algebraic closure, and Γ=Gal(k′/k) with its Krull topology. A gerb consists of a linear algebraic group H/k′ and a topological extension 1→H(k′)→E→Γ→1 with discrete kernel.
- Hypotheses: For the topological prefix use groups with the stated topologies and a discrete kernel.
- API: `GaloisGerbs.GaloisGerb.kernel`, `GaloisGerbs.GaloisGerb.local_chart`, `GaloisGerbs.GaloisGerb.conjugation`, `GaloisGerbs.GaloisGerb.neutral`, `GaloisGerbs.GaloisGerb.base_extension`
- Tests: `GaloisGerbs.GaloisGerb.test_neutral` [computation] For H/k the neutral gerb is H(k′)⋊Gal(k′/k) with …; `GaloisGerbs.GaloisGerb.test_c4` [non-example] The C4 extension of Gal(C/R)=C2 by μ2(C) …; `GaloisGerbs.GaloisGerb.test_alg_closed` [degenerate] For k′=k algebraically closed the Galois quotient …
- Source: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.
- Needs: T219, T220

**T222** `SF.1/morphism` (definition). A morphism E→E′ of k′/k-gerbs is a continuous group homomorphism over id_Γ together with an algebraic k′-group homomorphism H→H′ whose point map agrees with the extension map on the kernel.
- Hypotheses: For the topological prefix use groups with the stated topologies and a discrete kernel.
- API: `GaloisGerbs.GaloisGerbMorphism.identity`, `GaloisGerbs.GaloisGerbMorphism.comp`, `GaloisGerbs.GaloisGerbMorphism.kernel_points`
- Tests: `GaloisGerbs.GaloisGerbMorphism.test_power` [computation] Over algebraically closed k, G_m kernel …; `GaloisGerbs.GaloisGerbMorphism.test_identity` [degenerate] The identity morphism has identity kernel and …; `GaloisGerbs.GaloisGerbMorphism.test_conjugation` [non-example] For the neutral G_m gerb over C/R, complex …
- Source: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.
- Needs: T221

**T223** `SF.1/conjugacy` (definition). For morphisms f1,f2:E→E′, kernel conjugacy means there is h∈H′(k′) with Int(i′(h))∘f1=f2. Retain the conjugators as data/sets when needed; do not identify conjugate morphisms before the application asks for a quotient.
- Hypotheses: For the topological prefix use groups with the stated topologies and a discrete kernel.
- API: `GaloisGerbs.GerbConjugacy.refl`, `GaloisGerbs.GerbConjugacy.symm`, `GaloisGerbs.GerbConjugacy.trans`
- Tests: `GaloisGerbs.GerbConjugacy.test_identity` [degenerate] Every morphism is conjugate to itself by 1.; `GaloisGerbs.GerbConjugacy.test_trivial_kernel` [computation] With trivial target kernel, conjugacy is equality …; `GaloisGerbs.GerbConjugacy.test_not_any_lift` [non-example] A target element projecting nontrivially to Γ is …
- Source: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.
- Needs: T222

**T224** `SF.1/neutral`: Neutral Galois gerb. Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.

**T225** `SF.1/conjugator-scheme`: Conjugator scheme of gerb morphisms. Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.

**T226** `SF.1/pro-gerb` (definition). A pro-gerb is a compatible projective system of finite-stage k′/k-gerbs with continuous extension transitions and algebraic kernel transitions. Pro-morphisms are compatible finite-stage maps.
- Hypotheses: For the topological prefix use groups with the stated topologies and a discrete kernel.
- API: `GaloisGerbs.ProGerb.stage`, `GaloisGerbs.ProGerb.transition`, `GaloisGerbs.ProGerb.stagewise_conjugate`
- Tests: `GaloisGerbs.ProGerb.test_constant` [degenerate] A constant system recovers the original gerb and …; `GaloisGerbs.ProGerb.test_kottwitz` [compatibility] The Kottwitz protorus has rational character …; `GaloisGerbs.ProGerb.test_wrong_global_conjugacy` [non-example] Stagewise nonempty conjugator sets alone do not …
- Source: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.
- Needs: T221, T222, T223

**T227** `SF.1/splitting-field-extension`: Enlarging a Galois splitting field. Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.

**T228** (lemma strand, 7 declarations; module `TauCeti/AlgebraicGeometry/GaloisGerbs`). First three: Kernel recognition in a topological extension; Projection of a kernel point; Unit of a local section. Sources: Kisin 2017, author 99-page PDF, §3.1.1–3.1.2, pp.34–36.Needs: T219, Mathlib, T220, T225, T224, T222, T223.


<a id="sf2"></a>

## SF.2. Sites and scheme cohomology

The cohomology layer. On top of Mathlib's `Sheaf.H` it provides the generic functoriality of
sheaf cohomology on sites (pullback, higher direct images, Leray and Čech spectral sequences,
torsors and nonabelian H¹, the H² class of a gerbe, Godement resolutions and Grothendieck
vanishing); quasi-coherent cohomology beyond the curve and proper-flat cases of the Tau Ceti
roadmaps, with local cohomology, depth and Cousin complexes; the comparison of cohomology across
the Zariski, Nisnevich, étale, fppf and pro-étale topologies with the coefficient sheaves G_a,
G_m, μ_n, Hilbert 90 and the Kummer and Artin–Schreier sequences; the Nisnevich site with
elementary distinguished squares; étale cohomology with non-torsion and non-invertible
coefficients (fields, limits, Galois coverings, henselian pairs, curves, proper hypercoverings)
and the Bhatt–Scholze pro-étale comparison; coherent Grothendieck duality in the generality of the
Stacks Project's chapter on duality for schemes; the Brauer group of a scheme by Azumaya algebras
with its map to H²(X_ét, G_m); and equivariant sheaf cohomology for a group acting semilinearly.
The three strands at the end of the layer (Brauer, coherent duality, equivariant cohomology) are
the declaration-sized carriers with their named API, which the sub-sections SF.2e–SF.2g complete.

**Conventions.** Abelian sheaves on the small étale site take values in `AddCommGrpCat.{u}`,
pro-étale sheaves in `AddCommGrpCat.{u+1}`, as in Mathlib's `EllAdicCohomology`. Complexes are
cohomologically indexed; `D_QCoh(O_X)` is the full subcategory with quasi-coherent cohomology;
`f^!` is defined on `D⁺_QCoh` for separated finite-type morphisms of Noetherian schemes. `G_K` is
Mathlib's `Field.absoluteGaloisGroup`. Coefficient regimes are stated on every target, as in the
roadmap conventions. **Imported, never rebuilt:** finite-coefficient étale theory, base change,
compact support, ℓ-adic realization, Frobenius, Artin comparison and the trace formula are the
prerequisites expected from the pending CohomologicalPointCounting roadmap (TauCetiRoadmap
pull request 196, not yet merged), never targets here; affine
acyclicity, Čech computation, flat base change and Jacobians are JacobianChallenge Layers A–D;
proper coherence and relative dualizing sheaves of curves are StableReduction Layer 2; Hilbert 90,
Kummer theory and continuous cohomology are ProfiniteCohomology Layers 9–10; the field Brauer
group as H² is QuadraticFormInvariants Layer 7. **Not here:** étale supports and the étale `f^!`,
absolute purity, purity for the Brauer group, the real and coniveau package, algebraic stacks
(SF.1), Chow groups (SF.5).

### SF.2a — Sheaf cohomology on sites

**T229** `SF.2/site-cohomology-pullback`: Pullback on sheaf cohomology along a morphism of sites. Stacks, Tag 072X (Section 21.14), Lemma 21.14.1; Tag 01FU (Section 21.7), Lemmas 21.7.1–21.7.4.

**T230** `SF.2/site-derived-pushforward`: Higher direct images for a morphism of sites. Stacks, Tag 072W (Lemma 21.7.4).

**T231** `SF.2/site-leray-spectral-sequence`: Leray spectral sequence for a morphism of sites. Stacks, Tag 072X (Section 21.14), Lemma 21.14.5 (Leray spectral sequence) and Lemma 21.14.7 (relative Leray).

**T232** `SF.2/cech-to-cohomology`: Čech-to-cohomology spectral sequence and Leray's acyclicity theorem. Stacks, Tag 03AV (Section 21.10), Lemmas 21.10.1–21.10.7; Tag 03OW (Theorem 59.19.2).

**T233** `SF.2/abelian-torsor-h1`: First cohomology classifies torsors. Stacks, Tag 03AG (Section 21.4), Definition 21.4.1, Lemmas 21.4.2–21.4.3.

**T234** `SF.2/nonabelian-torsor-h1`: Nonabelian first cohomology as torsor classes. Stacks, Tag 03AG (Section 21.4), Definition 21.4.1 and Lemma 21.4.2.

**T235** `SF.2/gerbe-h2-class`: Second cohomology class of a central extension boundary and of an abelian-banded gerbe. Stacks, Tag 0CJZ (Section 21.11), Lemma 21.11.1.

**T236** `SF.2/slice-site-cohomology`: Cohomology on a slice site. Stacks, Tag 03F3 (Lemma 21.7.1).

**T237** `SF.2/godement-resolution`: Godement resolution of a sheaf of modules. Stacks, Tag 0FKR (Section 20.30), Lemmas 20.30.1–20.30.2.

**T238** `SF.2/flasque-cech-vanishing`: Flasque sheaves have vanishing higher Čech cohomology. Stacks, Tag 09SV (Section 20.12), Lemmas 20.12.3–20.12.6.

**T239** `SF.2/noetherian-space-vanishing`: Grothendieck's vanishing theorem on Noetherian spaces. Stacks, Tag 02UZ (Proposition 20.20.7, Grothendieck).

**T240** `SF.2/cohomology-filtered-colimits`: Cohomology commutes with filtered colimits on coherent objects. Stacks, Tag 0737 (Section 21.16), Lemma 21.16.1.


### SF.2b — Quasi-coherent cohomology and cohomology with supports

**T241** `SF.2/qcoh-higher-direct-images`: Higher direct images of quasi-coherent sheaves along qcqs morphisms. Stacks, Tag 01XH (Section 30.4), Lemmas 30.4.1–30.4.6.

**T242** `SF.2/projective-space-cohomology`: Cohomology of line bundles on projective space. Stacks, Tag 01XS (Section 30.8), Lemmas 30.8.1–30.8.3.

**T243** `SF.2/ample-serre-vanishing`: Serre vanishing and finiteness for ample invertible sheaves. Stacks, Tag 01XO (Section 30.17), Lemma 30.17.1.

**T244** `SF.2/proper-fibre-dimension-vanishing`: Higher direct images vanish above the fibre dimension. Stacks, Tag 02V7 (Lemma 30.20.9).

**T245** `SF.2/serre-affineness-criterion`: Serre's cohomological criterion for affineness. Stacks, Tag 01XE (Section 30.3), Lemmas 30.3.1, 30.3.2 and 30.3.4.

**T246** `SF.2/sheaf-cohomology-with-supports`: Cohomology with supports in a closed subset. Stacks, Tag 0A39 (Section 20.21).

**T247** `SF.2/supports-localization-triangle`: Localization triangles for cohomology with supports. Stacks, Tag 0G6Y (Section 20.34), Lemmas 20.34.5–20.34.7.

**T248** `SF.2/local-cohomology-module-comparison`: Local cohomology of sheaves and of modules. Stacks, Tag 0A6R (Lemma 47.9.1).

**T249** `SF.2/local-cohomology-flat-base-change`: Flat base change and flat excision for local cohomology. Stacks, Tag 0ALZ (Lemma 47.9.3).

**T250** `SF.2/depth-local-cohomology-vanishing`: Depth controls vanishing of local cohomology. Stacks, Tag 0AVY (Section 47.11), Lemmas 47.11.1 and 47.11.3.

**T251** `SF.2/cousin-complex`: Cousin complex of a filtration by closed subsets. Boxer–Calegari–Gee–Pilloni 2021, §3.9.5 with (3.9.8), arXiv:1812.09269v3 pp.63–64.

**T252** `SF.2/kempf-cousin-resolution`: Cousin complexes of maximal Cohen–Macaulay sheaves are resolutions. Boxer–Calegari–Gee–Pilloni 2021, Theorem 3.9.6, Remark 3.9.7, Example 3.9.9, arXiv:1812.09269v3 pp.64–65.


### SF.2c — Topologies of a scheme, coefficient sheaves and the Nisnevich site

**T253** `SF.2/big-site-quasi-coherent-sheaf`: The big-site sheaf of a quasi-coherent module. Stacks, Tag 03DT (Lemma 35.8.1).

**T254** `SF.2/multiplicative-additive-group-sheaves` (definition). On the big site Sch/S with any topology τ coarser than fpqc, G_a(T) = Γ(T, O_T) (additive), G_m(T) = Γ(T, O_T)^× and, for every integer n ≥ 1, μ_n(T) = {t ∈ Γ(T,O_T)^× : t^n = 1};
- Hypotheses: S a scheme; n ≥ 1 any integer.
- API: `Topologies.Ga`, `Topologies.Gm`, `Topologies.mu`, `Topologies.Gm_obj`, `Topologies.mu_eq_ker_pow` (+2)
- Tests: `Topologies.test_mu_one` [degenerate] μ_1 is the zero sheaf.; `Topologies.test_Gm_field` [computation] G_m(Spec Q) = Q^×, and μ_2(Spec Q) = {±1}.; `Topologies.test_mu_p_not_etale_trivial` [non-example] Over S = Spec F_p, μ_p has trivial sections on …
- Source: Stacks, Tag 03PK (Section 59.28).
- Needs: T253; Mathlib `AlgebraicGeometry.Scheme.fpqcTopology`, `rootsOfUnity` (+1)

**T255** `SF.2/topology-comparison-morphisms`: Comparison morphisms between the topologies of a scheme. Stacks, Tag 0DDK (Section 59.100), Lemmas 59.100.1–59.100.2.

**T256** `SF.2/quasi-coherent-topology-comparison`: Quasi-coherent cohomology is the same in every topology. Stacks, Tag 03DW (Proposition 35.9.3).

**T257** `SF.2/etale-pullback-fppf-comparison`: Étale sheaves have the same fppf cohomology. Stacks, Tag 0DDK (Section 59.100), Lemmas 59.100.5–59.100.8.

**T258** `SF.2/smooth-group-fppf-etale-comparison`: Étale and fppf cohomology agree for smooth commutative group schemes. Česnavičius 2018, §2 (proof of Proposition 2.3 and Remark 2.7) and Appendix A, arXiv:1711.06456v4.

**T259** `SF.2/hilbert-90`: Hilbert's Theorem 90 for schemes. Stacks, Tag 03P8 (Theorem 59.24.1).

**T260** `SF.2/fppf-kummer-sequence`: Kummer sequences in the fppf and étale topologies. Stacks, Tag 03PK (Section 59.28), Lemmas 59.28.1, 59.28.3, Remark 59.28.4, Lemma 59.28.5.

**T261** `SF.2/artin-schreier-sequence`: The Artin–Schreier sequence and p-cohomological dimension in characteristic p. Stacks, Tag 0A3J (Section 59.63), Lemmas 59.63.1–59.63.6.

**T262** `SF.2/finite-pushforward-exact`: Finite and integral pushforward on étale sheaves. Stacks, Tag 03QN (Section 59.55), Lemma 59.55.1, Proposition 59.55.2, Lemmas 59.55.3–59.55.4.

**T263** `SF.2/nisnevich-covering` (definition). A family of étale morphisms {p_i : U_i → X} is a Nisnevich covering if for every point x ∈ X there are an index i and a point u ∈ U_i with p_i(u) = x inducing an isomorphism of residue fields κ(x) ≅ κ(u).
- Hypotheses: p_i étale (Mathlib's AlgebraicGeometry.Etale); residue fields via AlgebraicGeometry.Scheme.residueField and Hom.residueFieldMap.
- API: `Nisnevich.IsNisnevichCovering`, `Nisnevich.nisnevichPrecoverage`, `Nisnevich.isNisnevichCovering_of_zariski`, `Nisnevich.nisnevichPrecoverage_le_etale`, `Nisnevich.IsNisnevichCovering.pullback` (+2)
- Tests: `Nisnevich.test_covering_identity` [degenerate] The singleton family {id : X → X} is a Nisnevich …; `Nisnevich.test_not_covering_real_complex` [non-example] {Spec C → Spec R} is not a Nisnevich covering …; `Nisnevich.test_covering_quadratic_split` [computation] {Spec Z[1/10] → Spec Z[1/2], Spec …
- Source: Morel–Voevodsky 1999, §3.1, Proposition 1.1 and Definition 1.2, pp.95–96.
- Needs: T113; Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.Scheme.residueField` (+2)

**T264** `SF.2/nisnevich-topology`: The Nisnevich topology. Morel–Voevodsky 1999, §3.1, Definition 1.2 and the following paragraph, pp.95–96.

**T265** `SF.2/elementary-distinguished-square` (definition). An elementary distinguished square over a scheme X is a cartesian square U ×_X V → V, U ×_X V → U, j : U → X, p : V → X in which j is an open immersion, p is étale, and p restricts to an isomorphism p^{-1}(X ∖ U) → X ∖ U of reduced closed subschemes.
- Hypotheses: X a scheme; reduced induced structures on the closed complements.
- API: `Nisnevich.ElementaryDistinguishedSquare`, `Nisnevich.ElementaryDistinguishedSquare.isNisnevichCovering`, `Nisnevich.ElementaryDistinguishedSquare.ofZariski`, `Nisnevich.ElementaryDistinguishedSquare.pullback`, `Nisnevich.ElementaryDistinguishedSquare.isPullback`
- Tests: `Nisnevich.test_eds_zariski` [degenerate] For X = U ∪ V an open cover, ofZariski gives a …; `Nisnevich.test_eds_affine_line` [computation] X = A^1_Q, U = A^1 ∖ {0}, V = A^1 ∖ {−1, −2} with …; `Nisnevich.test_eds_not_distinguished` [non-example] X = Spec R, U = ∅, V = Spec C: p is étale and …
- Source: Morel–Voevodsky 1999, §3.1, Definition 1.3 and the following remark, p.96.
- Needs: T263; Mathlib `AlgebraicGeometry.IsOpenImmersion`, `AlgebraicGeometry.Etale` (+1)

**T266** `SF.2/distinguished-square-mayer-vietoris`: Distinguished squares are Mayer–Vietoris squares. Morel–Voevodsky 1999, §3.1, Lemma 1.6 and Remark 1.7, pp.97–98.

**T267** `SF.2/nisnevich-sheaf-criterion`: The Nisnevich sheaf condition is checked on distinguished squares. Morel–Voevodsky 1999, §3.1, Proposition 1.4 and Lemma 1.5 with proof, pp.96–98.

**T268** `SF.2/nisnevich-points-henselization`: Points of the Nisnevich topology are henselizations. Morel–Voevodsky 1999, §3.1, paragraph before Lemma 1.11, p.99.

**T269** `SF.2/nisnevich-cohomological-dimension`: Nisnevich cohomological dimension is bounded by Krull dimension. Morel–Voevodsky 1999, §3.1, Proposition 1.8 with sketch of proof, pp.98–99.

**T270** `SF.2/nisnevich-cech-comparison`: Čech and derived Nisnevich cohomology agree. Morel–Voevodsky 1999, §3.1, Proposition 1.9 and Example 1.10, p.99.

**T271** `SF.2/brown-gersten-vanishing`: Brown–Gersten vanishing for Nisnevich Mayer–Vietoris functors. Morel–Voevodsky 1999, §3.1, Definitions 1.12–1.13, Proposition 1.16, Lemmas 1.17–1.18, pp.100–102.


### SF.2d — Étale cohomology beyond finite coefficients, and the pro-étale comparison

**T272** `SF.2/gabber-affine-proper-base-change`: Gabber's affine analogue of proper base change. Stacks, Tag 09ZI (Theorem 59.82.7, Gabber); Tag 09Z8 (Section 59.82), Lemmas 59.82.1–59.82.6.

**T273** `SF.2/etale-galois-comparison`: Étale cohomology of a field is Galois cohomology. Stacks, Tag 03QQ (Section 59.59), Lemmas 59.59.1–59.59.2, Example 59.59.3.

**T274** `SF.2/etale-cohomology-limits`: Étale cohomology of limits of schemes. Stacks, Tag 09YQ (Theorem 59.51.3).

**T275** `SF.2/hochschild-serre-galois-covering`: Hochschild–Serre spectral sequences for Galois coverings. Milne LEC, §6, Definition 6.1 and Proposition 6.4, pp.42–43; §14, Theorem 14.9, p.96 and the application on p.99.

**T276** `SF.2/tsen-theorem`: Tsen's theorem and vanishing of Galois cohomology of G_m for function fields of curves. Stacks, Tag 0A2M (Section 59.67): Proposition 59.67.4, Definition 59.67.5, Theorem 59.67.8, Theorem 59.67.10 (Tsen), Lemmas 59.67.11–59.67.12.

**T277** `SF.2/curve-multiplicative-cohomology`: Étale cohomology of G_m on a smooth curve. Stacks, Tag 03RH (Section 59.68), Theorem 59.68.1, Lemmas 59.68.2–59.68.4, Theorem 59.68.5.

**T278** `SF.2/curve-roots-of-unity-cohomology`: Étale cohomology of μ_n on curves over an algebraically closed field. Stacks, Tag 03RN (Section 59.69), Lemmas 59.69.1–59.69.3.

**T279** `SF.2/proper-hypercover-descent`: Cohomological descent for proper hypercoverings. Stacks, Tag 0DHI (Section 85.36), Lemmas 85.36.1–85.36.5.

**T280** `SF.2/proetale-etale-morphism`: The morphism from the pro-étale to the étale topos. Bhatt–Scholze 2014, §5.1, Lemma 5.1.1, p.34; §5.4, Lemmas 5.4.1 and 5.4.3, p.39.

**T281** `SF.2/proetale-classical-comparison`: Bhatt–Scholze comparison: classical complexes embed fully faithfully in pro-étale complexes. Bhatt–Scholze 2014, Lemma 5.1.2 (p.34), Corollaries 5.1.5–5.1.6 and Remark 5.1.7 (p.35), Proposition 5.2.6 (p.37).

**T282** `SF.2/replete-topos` (definition). A topos T is replete if surjections are stable under sequential limits: for every inverse system … → F_{n+1} → F_n → … → F_0 in T with all F_{n+1} → F_n surjective, the maps lim_n F_n → F_m are surjective.
- Hypotheses: T a Grothendieck topos (here the topos of sheaves on Mathlib's ProEt.topology).
- API: `Proetale.IsReplete`, `Proetale.isReplete_of_locallyWeaklyContractible`, `Proetale.isReplete_proetale`, `Proetale.IsReplete.lim_epi`, `Proetale.IsReplete.derivedCategory_leftComplete`
- Tests: `Proetale.test_isReplete_types` [degenerate] The category of types (sheaves on the one-point …; `Proetale.test_isReplete_proetale_point` [computation] For X = Spec of an algebraically closed field, …; `Proetale.test_etale_not_replete` [non-example] For X = Spec Q the tower of surjections …
- Source: Bhatt–Scholze 2014, Definition 3.1.1 and Example 3.1.7 (p.16); Definition 3.2.1 and Proposition 3.2.3 (pp.17–18); Proposition 4.2.8 (p.29).
- Needs: T283; Mathlib `AlgebraicGeometry.Scheme.ProEt.topology`

**T283** `SF.2/w-contractible-cover`: Existence of w-contractible pro-étale covers. Bhatt–Scholze 2014, Definition 2.4.1 (p.13), Lemma 2.4.9 (p.14), Theorem 1.5 (p.3), Proposition 4.2.8 (p.29).

**T284** `SF.2/proetale-left-completeness`: Left-completeness of the pro-étale derived category and the unbounded comparison. Bhatt–Scholze 2014, Proposition 3.3.3 (p.19), Proposition 5.3.2 (p.38).

**T285** `SF.2/proetale-lisse-sheaves`: Lisse adic sheaves on the pro-étale site. Bhatt–Scholze 2014, Definition 6.8.1, Lemma 6.8.2 (p.58), Proposition 6.8.4 (p.59); Lemma 4.2.12 (p.30).


### SF.2e — Coherent duality

**T286** `SF.2/cm-serre-duality`: Serre duality for proper Cohen–Macaulay schemes. Stacks, Tag 0FVU (Section 48.27), Lemma 48.27.1, Remarks 48.27.2–48.27.3, Lemma 48.27.5, Remark 48.27.6.

**T287** `SF.2/derived-quasi-coherent-category` (definition). For a scheme X let D(O_X) be the (unbounded) derived category of the abelian category of O_X-modules (Mathlib's DerivedCategory of AlgebraicGeometry.Scheme.Modules X).
- Hypotheses: X a scheme; complexes unbounded; the affine equivalence uses Mathlib's tilde.
- API: `Coherent.DQCoh`, `Coherent.DQCoh.mem_iff`, `Coherent.DQCoh.isTriangulated`, `Coherent.DQCoh.hasCoproducts`, `Coherent.DQCoh.affineEquiv` (+1)
- Tests: `Coherent.test_DQCoh_structure_sheaf` [degenerate] O_X[0] belongs to D_QCoh(O_X) for every scheme X.; `Coherent.test_DQCoh_affine_free` [computation] Under DQCoh.affineEquiv for X = Spec Z, the …; `Coherent.test_DQCoh_extension_by_zero_not_qc` [non-example] For X = Spec of a DVR with generic point …
- Source: Stacks, Tag 06YZ (Section 36.3), Lemmas 36.3.1, 36.3.5, 36.3.8–36.3.9.
- Needs: Mathlib `DerivedCategory`, `AlgebraicGeometry.Scheme.Modules` (+2); Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`; Tau Ceti roadmap JacobianChallenge Layer B

**T288** `SF.2/derived-tensor-internal-hom`: Derived tensor product and derived internal Hom of O_X-modules. Stacks, Tag 08J7 (Section 21.35) and Tag 0B6E (Section 21.36).

**T289** `SF.2/derived-pullback-pushforward-qcoh`: Derived pullback and total direct image on quasi-coherent complexes. Stacks, Tag 06YZ (Section 36.3), Lemma 36.3.8.

**T290** `SF.2/perfect-generator`: D_QCoh of a qcqs scheme is generated by one perfect complex. Stacks, Tag 09IP (Section 36.15), Lemmas 36.15.1–36.15.2, Theorem 36.15.3.

**T291** `SF.2/tor-independent-base-change`: Tor-independent base change for quasi-coherent complexes. Stacks, Tag 08ET (Section 36.22), Definition 36.22.2, Lemmas 36.22.3 and 36.22.5.

**T292** `SF.2/pushforward-right-adjoint`: Right adjoint of pushforward on quasi-coherent complexes. Stacks, Tag 0A9D (Section 48.3), Lemma 48.3.1, Example 48.3.2, Lemmas 48.3.5–48.3.6 and 48.3.10.

**T293** `SF.2/upper-shriek-compactification-independence`: The upper shriek pseudofunctor is independent of compactifications. Stacks, Tag 0A9Y (Section 48.16), Situation 48.16.1, Lemmas 48.16.2–48.16.5.

**T294** `SF.2/upper-shriek-etale`: Upper shriek of étale morphisms and open immersions. Stacks, Tag 0ATZ (Section 48.17), Lemmas 48.17.1–48.17.2.

**T295** `SF.2/upper-shriek-flat-base-change`: Flat base change for upper shriek. Stacks, Tag 0BZX (Section 48.18), Lemmas 48.18.1 and 48.18.4.

**T296** `SF.2/upper-shriek-smooth`: Upper shriek of smooth morphisms. Stacks, Tag 0ATZ (Section 48.17), Lemmas 48.17.3 and 48.17.11.

**T297** `SF.2/lci-upper-shriek`: Upper shriek of local complete intersection and Gorenstein morphisms. Stacks, Tag 0ATZ (Section 48.17), Lemma 48.17.11.

**T298** `SF.2/relative-dualizing-complex` (definition). Let f : X → S be flat and locally of finite presentation, and W ⊂ X ×_S X an open through which the diagonal factors as a closed immersion Δ : X → W. A relative dualizing complex is a pair (K, ξ) with K ∈ D(O_X) S-perfect and ξ : Δ_*O_X → L pr_1^*K|_W a map in D(O_W) inducing an isomorphism Δ_*O_X ≅ RHom_{O_W}(Δ_*O_X, L pr_1^*K|_W).
- Hypotheses: f flat and locally of finite presentation (no Noetherian hypothesis in the definition).
- API: `Coherent.RelativeDualizingComplex`, `Coherent.RelativeDualizingComplex.unique`, `Coherent.RelativeDualizingComplex.exists`, `Coherent.RelativeDualizingComplex.baseChange`, `Coherent.RelativeDualizingComplex.homothety_iso` (+1)
- Tests: `Coherent.test_rdc_identity` [degenerate] For f = id_S, the relative dualizing complex is …; `Coherent.test_rdc_projective_line` [computation] For f : P^1_S → S, the relative dualizing complex …; `Coherent.test_rdc_base_change` [compatibility] For S' → S and f flat finitely presented, the …
- Source: Stacks, Tag 0E2S (Section 48.28), Definition 48.28.1, Lemmas 48.28.2–48.28.7 and 48.28.9.
- Needs: T295, T288, T292, T326

**T299** `SF.2/relative-dualizing-module` (definition). Let f : X → Y in FTS_S be flat and Cohen–Macaulay of relative dimension d (fibres Cohen–Macaulay of pure dimension d). Then f^!O_Y has a unique nonzero cohomology sheaf, in degree −d;
- Hypotheses: f flat, Cohen–Macaulay of relative dimension d, in FTS_S.
- API: `Coherent.relativeDualizingModule`, `Coherent.upperShriek_structureSheaf_iso_shift`, `Coherent.relativeDualizingModule_coherent`, `Coherent.relativeDualizingModule_baseChange`, `Coherent.relativeDualizingModule_invertible_iff` (+1)
- Tests: `Coherent.test_omega_smooth_curve_degree` [computation] For a smooth projective curve C of genus g over …; `Coherent.test_omega_identity` [degenerate] For f = id_Y (relative dimension 0), ω_{Y/Y} = …; `Coherent.test_omega_nodal_invertible` [compatibility] For the nodal cubic y^2 = x^3 + x^2 over k, ω is …
- Source: Stacks, Tag 0AWQ (Section 48.23), Lemmas 48.23.1, 48.23.3 and Remark 48.23.4.
- Needs: T298, T295, T297, T326

**T300** `SF.2/curve-dualizing-comparison`: General coherent duality restricts to the curve duality of StableReduction and JacobianChallenge. Stacks, Tag 0E31 (Section 53.4), Lemmas 53.4.1–53.4.2.

**T301** `SF.2/sheafified-grothendieck-duality`: Sheafified Grothendieck duality for proper morphisms. Stacks, Tag 0A9D (Section 48.3), Lemma 48.3.6, Example 48.3.9.


### SF.2f — Brauer groups of schemes

**T302** `SF.2/quasi-coherent-algebra-descent`: Descent of quasi-coherent algebras and of the Azumaya property. Stacks, Tag 023F (Section 35.3) and Tag 0A2J (Section 59.62).

**T303** `SF.2/azumaya-equivalent-conditions`: Equivalent characterisations of Azumaya algebras on a scheme. Grothendieck Brauer I, Théorème 5.1 with Propositions 5.4–5.5, pp.210–212.

**T304** `SF.2/azumaya-trivialization-gerbe`: The gerbe of trivialisations of an Azumaya algebra. Grothendieck Brauer I, §2, pp.204–205.

**T305** `SF.2/brauer-regular-injectivity`: Brauer groups of regular schemes: torsion and injectivity into the function field. Grothendieck Brauer II, Proposition 1.4, Lemme 1.9, Corollaires 1.8 and 1.10, pp.291–293.

**T306** (removed). The cohomological Brauer group of a field is the Brauer group: the Galois form `Additive (BrauerGroup K) ≃+ H²(Gal(K̄/K), K̄ˣ)` is Tau Ceti `TauCeti.brauerCohomologyEquiv` (module `TauCeti.Algebra.CrossedProduct.Comparison`), also stated by Tau Ceti QuadraticFormInvariants Layer 7B; the identification of `H²_ét(Spec k, G_m)` with that Galois group is T273. See the boundaries section.

**T307** `SF.2/brauer-kummer-sequence`: Kummer sequences for Brauer groups. Stacks, Tag 03PK (Section 59.28), Remark 59.28.4.

**T308** `SF.2/brauer-henselian-local`: Brauer groups of henselian local rings. Grothendieck Brauer I, Théorème 6.1 (Azumaya), p.214. The finite-field case `Subsingleton (BrauerGroup k)` is Tau Ceti `TauCeti.subsingleton_brauerGroup_of_finite` (module `TauCeti.Algebra.BrauerGroup.Trivial`) and is cited, not restated.

**T309** `SF.2/brauer-hochschild-serre-sequence`: The algebraic Brauer group sequence of a variety. Harpaz–Wittenberg 2023, §3, display (3.1) and Remark 3.1, p.8–9 (arXiv:1904.06512v2).


### SF.2g — Equivariant sheaf cohomology

**T310** `SF.2/equivariant-module-category`: The abelian category of semilinear equivariant modules. Grothendieck 1957, Chapitre V, §5.1 and Proposition 5.1.1, p.196 (Tôhoku Math. J. 9 (1957)).

**T311** `SF.2/equivariant-coinduction`: Induction and coinduction for equivariant modules. Grothendieck 1957, Chapitre V, §5.1 (construction of the generators L(U) and the reduction to modules), p.196.

**T312** `SF.2/coinduced-sections-acyclic`: Sections of injective equivariant modules are acyclic for invariants. Kings–Sprang 2019, Appendix A.1, display (A.1.1), p.80.

**T313** `SF.2/equivariant-ext-spectral-sequence`: Spectral sequence for equivariant Ext. Kings–Sprang 2019, Appendix A.1, Definition A.2 and (A.1.1), p.80.


### Brauer groups of schemes

**T314** `SF.2/sheaf-algebra` (definition). For a native scheme X, an associative unital O_X-algebra is a sheaf of rings A with a central structure map O_X→A. Require its underlying O_X-module to be quasi-coherent.
- Hypotheses: X is a scheme; algebra sheaves are associative unital with central O_X scalars.
- API: `Brauer.SheafAlgebra.sections`, `Brauer.SheafAlgebra.hom_ext`, `Brauer.SheafAlgebra.pullback`
- Tests: `Brauer.SheafAlgebra.test_matrix2` [computation] Mat_2(O_X) is such an algebra; for X=Spec(k), its …; `Brauer.SheafAlgebra.test_scalar` [degenerate] O_X itself is the rank-one algebra object.; `Brauer.SheafAlgebra.test_noncommutative` [non-example] For X=Spec(Q), Mat_2(Q) is admitted although …
- Source: Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.
- Needs: Mathlib `AlgebraicGeometry.Scheme.Modules`

**T315** `SF.2/azumaya` (definition). A quasi-coherent O_X-algebra A is Azumaya when there is a surjective étale covering U_i→X and O_{U_i}-algebra isomorphisms f_i* A≅Mat_{d_i}(O_{U_i}), with d_i≥1.
- Hypotheses: X is a scheme; algebra sheaves are associative unital with central O_X scalars.
- API: `Brauer.Azumaya.local_matrix`, `Brauer.Azumaya.degree`, `Brauer.Azumaya.pullback`
- Tests: `Brauer.Azumaya.test_matrix` [computation] Mat_n(O_X) is Azumaya for every n≥1.; `Brauer.Azumaya.test_scalar` [degenerate] O_X is degree-one Azumaya.; `Brauer.Azumaya.test_dual_numbers` [non-example] Over a field k, k[ε]/(ε²), though finite free, is …
- Source: Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.
- Needs: T314; Mathlib `IsAzumaya`

**T316** `SF.2/stabilized-equivalence` (definition). On X, A≈B means there exist finite locally free O_X-modules F,G of positive rank at every point and an O_X-algebra isomorphism A⊗End(F)≅B⊗End(G). Use this stabilization relation on Azumaya algebras;
- Hypotheses: X is a scheme; algebra sheaves are associative unital with central O_X scalars.
- API: `Brauer.StabilizedEquivalence.refl`, `Brauer.StabilizedEquivalence.symm`, `Brauer.StabilizedEquivalence.trans`
- Tests: `Brauer.StabilizedEquivalence.test_matrix` [computation] Mat_n(O_X)≈O_X for every n≥1.; `Brauer.StabilizedEquivalence.test_field` [compatibility] Over Spec(k), this is the usual stabilization …; `Brauer.StabilizedEquivalence.test_zero_rank` [non-example] Zero-rank F or G is excluded: allowing both would …
- Source: Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.
- Needs: T315, T314

**T317** `key/scheme-brauer`: Scheme Brauer group. Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.

**T318** `SF.2/cohomological-brauer` (definition). Br′(X) is the subgroup of H² on the native small étale site with coefficients in the units sheaf G_m consisting of elements killed by some positive integer. Do not redefine the cohomology carrier.
- Hypotheses: X is a scheme; algebra sheaves are associative unital with central O_X scalars.
- API: `Brauer.CohomologicalBrauer.inclusion`, `Brauer.CohomologicalBrauer.mem_iff`, `Brauer.CohomologicalBrauer.pullback`
- Tests: `Brauer.CohomologicalBrauer.test_complex` [computation] Br′(Spec(C))=0.; `Brauer.CohomologicalBrauer.test_real` [computation] Br′(Spec(R))≅Z/2 and the quaternion class maps to …; `Brauer.CohomologicalBrauer.test_nontorsion` [non-example] A nontorsion H² class, if present on X, is …
- Source: Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.
- Needs: Mathlib `CategoryTheory.Sheaf.H`

**T319** `SF.2/pullback`: Pullback homomorphism of Brauer groups. Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.

**T320** `SF.2/splitting-torsor`: Projective-frame torsor of an Azumaya algebra. Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.

**T321** `SF.2/delta`: Azumaya class in étale cohomology. Stacks, 59.62, definitions and Lemmas 59.62.1–2; final comparison discussion.

**T322** (lemma strand, 16 declarations; module `TauCeti/AlgebraicGeometry/Brauer`). First three: Affine Azumaya comparison; Tensor product of Azumaya algebras; Opposite Azumaya algebra. Sources: Stacks, 59.62, definitions and Lemmas 59.62.1–2 (+1).Needs: T315, Mathlib, T316, T319, T317, T321, T318.


### Coherent Grothendieck duality

**T323** `SF.2/affine-dualizing` (definition). For a Noetherian commutative ring A, a dualizing complex ω in D(A) has finite injective dimension, finite A-module cohomology in every degree, and the canonical homothety A→RHom_A(ω,ω) is a quasi-isomorphism.
- Hypotheses: Use native derived O-module categories and cohomological shifts H^i(K[r])=H^{i+r}(K).
- API: `Coherent.DualizingComplex.homothety`, `Coherent.DualizingComplex.cohomology_finite`, `Coherent.DualizingComplex.biduality`
- Tests: `Coherent.DualizingComplex.test_field` [computation] For a field k, k[0] is dualizing.; `Coherent.DualizingComplex.test_regular_shift` [compatibility] For a d-dimensional regular local ring, A[d] is …; `Coherent.DualizingComplex.test_non_cm` [non-example] For A=k[x,y]/(x²,xy) localized at (x,y), the …
- Source: Stacks, Definition 47.15.1.
- Needs: Mathlib `DerivedCategory`

**T324** `SF.2/scheme-dualizing` (definition). For a locally Noetherian X, a dualizing complex K in D(O_X) is affine-locally the sheafification of a ring dualizing complex: for every affine U=Spec(A), K|_U≅~ω_A with ω_A dualizing.
- Hypotheses: Use native derived O-module categories and cohomological shifts H^i(K[r])=H^{i+r}(K).
- API: `Coherent.SchemeDualizing.affine`, `Coherent.SchemeDualizing.cover_iff`, `Coherent.SchemeDualizing.restrict`
- Tests: `Coherent.SchemeDualizing.test_field` [computation] On Spec(k), ~k[0] is dualizing.; `Coherent.SchemeDualizing.test_disjoint` [degenerate] Dualizing complexes on a disjoint union are …; `Coherent.SchemeDualizing.test_projective_line` [computation] On P¹_k, O(-2)[1] is dualizing.
- Source: Stacks, Definition 48.2.2.
- Needs: T323; Mathlib `AlgebraicGeometry.Scheme.Modules`, `DerivedCategory`

**T325** `SF.2/normalized-dualizing` (definition). For a Noetherian local ring (A,m,κ), a dualizing ω is normalized when RHom_A(κ,ω)≅κ[0]; equivalently Ext^i_A(κ,ω) vanishes for i≠0 and Ext^0 is one-dimensional over κ.
- Hypotheses: Use native derived O-module categories and cohomological shifts H^i(K[r])=H^{i+r}(K).
- API: `Coherent.NormalizedDualizing.residue`, `Coherent.NormalizedDualizing.finite_local`, `Coherent.NormalizedDualizing.shift_unique`
- Tests: `Coherent.NormalizedDualizing.test_field` [computation] κ[0] is normalized over κ.; `Coherent.NormalizedDualizing.test_dvr` [computation] A[1] is normalized for a regular DVR A.; `Coherent.NormalizedDualizing.test_wrong_shift` [non-example] For a regular DVR, A[0] is dualizing but not …
- Source: Stacks, Lemma 47.16.1, finite local normalized-dualizing comparison.
- Needs: T323

**T326** `key/coherent-duality`: Coherent Grothendieck duality. Stacks, 48.19 properties (1)–(9) and cited proof leaves.

**T327** `SF.2/serre-proper`: Proper coherent Serre duality. Stacks, Lemma 48.27.1, especially (2), (5), (7), and displayed proof.

**T328** `SF.2/trace`: Proper coherent trace. Stacks, 48.19 properties (1)–(9) and cited proof leaves.

**T329** (lemma strand, 12 declarations; module `TauCeti/AlgebraicGeometry/Coherent`). First three: Affine-cover recognition of dualizing complexes; Coherent biduality; Composition of coherent upper shriek. Sources: Stacks, Lemma 48.2.1, complete displayed statement/proof and comments (+2).Needs: T324, T326, T328, T327.


### Equivariant sheaf cohomology

**T330** `SF.2/linearized-sheaf` (definition). For a ringed space X with a left action of a discrete group Γ by ringed-space automorphisms, a Γ-equivariant O_X-module F is an O_X-module together with a lift Γ→Aut(X,F) over the given action.
- Hypotheses: Γ is a discrete, possibly infinite group acting by ringed-space automorphisms.
- API: `Equivariant.EquivariantSheaf.forget`, `Equivariant.EquivariantSheaf.transport`, `Equivariant.EquivariantSheaf.hom_ext`
- Tests: `Equivariant.EquivariantSheaf.test_trivial_group` [degenerate] For Γ=1, the category is the ordinary O_X-module …; `Equivariant.EquivariantSheaf.test_point` [compatibility] On a one-point ringed space with ring R and …; `Equivariant.EquivariantSheaf.test_moving_base` [non-example] Z acting on R by translations transports an open …
- Source: Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.
- Needs: Mathlib `AlgebraicGeometry.Scheme.Modules`, `Action`

**T331** `SF.2/enough-injectives`: Enough injectives for equivariant sheaves. Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.

**T332** `SF.2/invariant-sections`: Invariant global-section functor. Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.

**T333** `key/equivariant-sheaf-cohomology`: Equivariant sheaf cohomology. Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.

**T334** `SF.2/ext`: Equivariant Ext groups. Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.

**T335** `SF.2/support`: Equivariant cohomology with support. Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.

**T336** `SF.2/spectral-sequence`: Equivariant sheaf cohomology spectral sequence. Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation (A.1.1), pp.79–80.

**T337** (lemma strand, 6 declarations; module `TauCeti/AlgebraicGeometry/Equivariant`). First three: Equivariant maps are invariant maps; Degree-zero equivariant cohomology; Trivial-group cohomology comparison. Sources: Kings–Sprang 2019, arXiv v4, Appendix A.1, Definitions A.1–A.3 and equation.Needs: T330, T333, T332, T331, T335.


<a id="sf3"></a>

## SF.3. Curves, divisors and Picard objects

The curve-and-Picard layer. Three Tau Ceti roadmaps already plan most of the theory of curves;
SF.3 states how they fit together and adds what none of them states but the arithmetic roadmaps
need: the nonsingular projective model and boundary of a normal curve, the affine-or-projective
dichotomy, invariance of the genus under field extension (with the inseparable contrast), the
scheme form of Riemann–Hurwitz, the characterizations of the projective line and of genus-one
curves; degrees, Riemann–Roch and Serre duality for vector bundles and coherent sheaves on curves;
the cohomological, divisorial and groupoid descriptions of Picard groups of schemes; Picard torsors
of curves without rational points with the Brauer obstruction separating rational divisor classes
from rational divisors; Abel maps from symmetric powers in high degree and norms of line bundles;
and the comparison of the Tate module of a Jacobian with degree-one étale cohomology under pinned
conventions. The layer's acceptance checks are genus zero, genus one, extension of scalars, degree
zero and the Tate module.

**Conventions.** `k` is a field, `k^s` a separable closure, `G_k = Gal(k^s/k)`. A curve over `k`
is an integral separated `k`-scheme of finite type of dimension one; smoothness, properness,
projectivity and geometric connectedness are hypotheses written where used, and regular is not
smooth over an imperfect field. `Br(k) = H²(G_k, k^{s×})`; `H²_ét(X, G_m)` is SF.2's cohomological
Brauer group. `Pic(X)` is the group of invertible sheaves, `Pic_{X/k}` the fppf Picard sheaf,
`Pic^d_{X/k}` its degree-`d` component; `T_ℓ J = lim J[ℓⁿ](k^s)` and `Z_ℓ(1) = lim μ_{ℓⁿ}(k^s)`.
Abel–Jacobi with a base point is JacobianChallenge Layer F; the Abel maps here need no base point.
**Imported:** JacobianChallenge Layers A–F, AlgebraicCurves Layers 3, 4, 7, 8, 10 and 12,
StableReduction Layers 0–2 (differentials, the single dualizing-sheaf interface for proper
Gorenstein curves, ampleness by degree), ClassFieldTheory Layers 5 and 10, and the
pending CohomologicalPointCounting roadmap (TauCetiRoadmap pull request 196) through SF.2 (μ_n,
Kummer, finite-coefficient cohomology, Tate modules of abelian varieties), as prerequisites. **Not here:** Néron–Severi groups and Picard numbers
(AbelianSchemesAndArithmeticModuli), coherent duality beyond curves (SF.2), positivity beyond
degree bounds (SF.5), Picard schemes over general bases, models of curves (SF.4).

### SF.3a. Curves, their models, and the genus checks

**T338** `SF.3/nonsingular-projective-model`: The nonsingular projective model of a normal curve and its boundary. Stacks, Algebraic Curves (tag 0BRV), Section 2 'Curves and function fields' (tag 0BXX): Lemmas 0BXZ, 0BY0, Theorem 0BY1, Definition 0BY2, Lemmas 0BY3, 0BY4; Varieties (tag 0209), Section 43: Lemmas 0A24, 0BXW, 0B8Y and Remark 0H1F.

**T339** `SF.3/curve-affine-or-projective`: A curve is affine or projective. Stacks, Varieties (tag 0209), Section 43 'Curves' (tag 0A22): Lemmas 0A24, 0A26, 0A27, 0A28.

**T340** `SF.3/genus-base-change`: The genus of a proper curve is invariant under every field extension. Stacks, Algebraic Curves (tag 0BRV), Section 8 'The genus of a curve' (tag 0BY6): Definition 0BY7, Lemma 0BY9; Section 18: Lemma 0CE4; Section 2: Lemma 0BY4.

**T341** `SF.3/scheme-riemann-hurwitz`: Riemann–Hurwitz for morphisms of smooth proper curves. Stacks, Algebraic Curves (tag 0BRV), Section 12 'Riemann–Hurwitz' (tag 0C1B): Lemmas 0C1C, 0C1D, 0C1F; Varieties (tag 0209), Section 44: Lemma 0AYZ.

**T342** `SF.3/projective-line-characterization`: Curves of genus zero and the characterization of the projective line. Stacks, Algebraic Curves (tag 0BRV), Section 10 'Curves of genus zero' (tag 0C6L): Lemmas 0C6M, 0C6T, 0C6N, Proposition 0C6U.

**T343** `SF.3/genus-one-curves`: Genus-one curves: degree-one bundles, rational points and torsors under the Jacobian. Stacks, Varieties (tag 0209), Section 44 'Degrees on curves': Lemma 0AYY; Algebraic Curves (tag 0BRV), Section 17: Lemma 0CDU(1).

**T344** `SF.3/line-bundle-degree-bounds`: Vanishing, global generation and very ampleness of line bundles on curves by degree. Stacks, Algebraic Curves (tag 0BRV), Section 22 'More vanishing results' (tag 0E39): Lemmas 0E3A, 0E3B, 0E3C, 0E3D, 0H2V; Section 6: Lemma 0B5E.


### SF.3b. Vector bundles and duality on curves

**T345** `SF.3/vector-bundle-degree` (definition). Let k be a field, X a proper k-scheme of dimension at most one, and E a locally free O_X-module of constant finite rank r. Its degree is deg(E) := χ(X, E) − r·χ(X, O_X) ∈ Z, where χ(X, F) = dim_k H⁰(X, F) − dim_k H¹(X, F) is computed with the coherent cohomology of JacobianChallenge Layer B (finite-dimensional, zero above degree one).
- Hypotheses: k is a field; X is proper over k with dim X ≤ 1; E is locally free of constant finite rank r ≥ 0.
- API: `AlgebraicGeometry.Curve.vectorBundleDegree`, `AlgebraicGeometry.Curve.vectorBundleDegree_rankOne`, `AlgebraicGeometry.Curve.vectorBundleDegree_of_iso`, `AlgebraicGeometry.Curve.vectorBundleDegree_add_of_shortExact`, `AlgebraicGeometry.Curve.vectorBundleDegree_det` (+6)
- Tests: `AlgebraicGeometry.Curve.vectorBundleDegree_trivial` [degenerate] deg(O_X^r) = 0 for every r ≥ 0, and the zero …; `AlgebraicGeometry.Curve.vectorBundleDegree_projectiveLine` [computation] On P¹_k, deg(O(a) ⊕ O(b)) = a + b for all …; `AlgebraicGeometry.Curve.vectorBundleDegree_divisor` [compatibility] On a regular proper curve X with Weil divisor D, …
- Source: Stacks, Varieties (tag 0209), Section 44 'Degrees on curves' (tag 0AYQ): Definition 0AYR, Lemmas 0B59, 0AYS, 0AYW, 0AYX, 0DJ5, 0AYY, 0AYZ.
- Needs: Mathlib `AlgebraicGeometry.Scheme.Modules`, `Module.finrank`; Tau Ceti `AlgebraicGeometry.Scheme.Modules.eulerCharBelow`, `AlgebraicGeometry.Scheme.Modules.finrank_cohomology_zero_sub_one_eq_add` (+1); Tau Ceti roadmap JacobianChallenge Layer A; JacobianChallenge Layer B

**T346** `SF.3/vector-bundle-riemann-roch`: Riemann–Roch for vector bundles on Gorenstein curves. Stacks, Algebraic Curves (tag 0BRV), Section 5 'Riemann-Roch' (tag 0B5B): Lemmas 0BS5, 0BS6.

**T347** `SF.3/curve-serre-duality`: Serre duality for coherent sheaves on proper Cohen–Macaulay curves. Stacks, Algebraic Curves (tag 0BRV), Section 4 'Duality' (tag 0E31): Lemmas 0BS2, 0BS3, Remark 0BS4; Section 8: Lemma 0C1A.


### SF.3c. Picard groups, groupoids and torsors

**T348** `SF.3/picard-cohomological`: The Picard group as first cohomology of the units (Hilbert 90 for schemes). Stacks, Étale Cohomology (tag 03N1), Section 24: Theorem 03P8.

**T349** `SF.3/class-group-picard-locally-factorial`: Weil divisor classes and the Picard group on normal and locally factorial schemes. Stacks, Divisors (tag 01WO), Sections 27–28 'Weil divisors' (tag 0BE0) and 'The Weil divisor class associated to an invertible module' (tag 02SE): Definitions 0BE4, 0BE6, Lemmas 02SL, 0BE8, 0BE9.

**T350** `SF.3/picard-excision-sequence`: The excision sequence for Picard groups along a boundary divisor. Stacks, Chow Homology (tag 02P3), Section 19: Lemma 02RX.

**T351** `SF.3/picard-groupoid`: Picard groupoids, and the Picard groupoid of a scheme. Bhatt–Scholze 2017, §4 opening, p. 15; Construction 5.1, p. 18; Definition 12.14 and Proposition 12.15, pp. 58–59.

**T352** `SF.3/line-bundle-norm`: Norms of invertible sheaves along finite locally free morphisms. Stacks, Divisors (tag 01WO), Section 18 'Norms' (tag 0BCX): Lemmas 0BCY, 0BCZ, 0BD2.

**T353** `SF.3/picard-scheme-without-point`: Picard schemes and Picard torsors of a curve without a rational point. Milne 2008, Part III 'Jacobian Varieties', §1: Theorem 1.6, Remarks 1.4(a)–(b), 1.10–1.12, Propositions 1.13–1.14, pp. 88–91.

**T354** (removed). The Picard–Brauer obstruction between `Pic(X_T)/Pic(T)` and `Pic_{X/k}(T)`, and its vanishing in the presence of a rational point, is Tau Ceti JacobianChallenge Layer D; see the boundaries section.

**T355** `SF.3/rational-divisor-classes`: Rational divisor classes versus rational divisors on hyperelliptic curves. Bhargava–Gross–Wang 2017, §3, Proposition 21 and the preceding paragraph, p. 10; the generalized-Jacobian reformulation, p. 11.

**T356** (removed). `Cl⁰(X) ≃ Pic⁰(X)`, `Pic⁰(X) ≃ (degree-zero divisors)/(principal divisors)` and `Pic(X)/Pic⁰(X) ≅ ℤ` are Tau Ceti `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`, `weightedDegreeZeroQuotientAddEquivPicZero` and `picQuotientPicZeroAddEquivInt` (module `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero`); the identification of the rational points of the Jacobian with degree-zero line bundles given a rational point is Tau Ceti StableReduction contract J-D; see the boundaries section.

**T357** `SF.3/picard-stack-curve`: The Picard stack of a curve and its degree components. Yun–Zhang 2017, §3.2.1, p. 16.


### SF.3d. Abel maps and Jacobian comparisons

**T358** `SF.3/universal-section-stack`: The stack of line bundles with a section over the Picard stack. Yun–Zhang 2017, §3.2.1, p. 16; proof of Proposition 3.1(2), p. 18.

**T359** `SF.3/abel-maps-high-degree`: Abel maps from symmetric powers: fibres, surjectivity and projective bundles. Stacks, Picard Schemes of Curves (tag 0B92), Section 6 (tag 0B9R): Lemma 0BA0.

**T360** `SF.3/picard-norm-sequence`: Norms on Picard schemes and stacks, and the double-cover exact sequence. Yun–Zhang 2017, §6.1, proof of Proposition 6.1(1), p. 40.

**T361** `SF.3/invariant-differentials`: Invariant differentials of a group scheme and global 1-forms on an abelian variety. Stacks, Groupoid Schemes (tag 022L), Section 6 'Properties of group schemes' (tag 045W): Lemma 047I.

**T362** `SF.3/abel-jacobi-differentials`: Pullback of 1-forms along the Abel–Jacobi map. Milne 2008, Part III, §2: Propositions 2.1 and 2.2, p. 91.

**T363** `SF.3/tate-module-etale-h1`: The Tate module of the Jacobian and degree-one étale cohomology of the curve. Stacks, Étale Cohomology (tag 03N1): Lemma 03PL (Kummer sequence), Theorem 03P8, Lemma 03RQ; Algebraic Curves (tag 0BRV): Lemma 0C1Z.


<a id="sf4"></a>

## SF.4. Deformations, formal schemes, models and alterations

The deformation-theoretic, formal and birational layer. Mathlib already provides formally smooth,
unramified and étale algebras with square-zero lifting, the naive cotangent complex, formally
unramified morphisms of schemes with uniqueness of lifts, adic completion with Artin–Rees, Proj,
the Rees algebra, rational and birational maps, relative normalization, Zariski's main theorem and
the Grassmannian functor; Tau Ceti provides models over a discrete valuation ring with their fibres
and finite extensions. SF.4 adds: thickenings and the lifting definitions of formally smooth,
unramified and étale morphisms of schemes with the infinitesimal lifting criterion and the torsor
of lifts; the Artinian coefficient category `C_Λ`, deformation functors with Schlessinger's
conditions, hulls, Schlessinger's theorem, obstruction theories, square-zero deformations
classified by the naive cotangent complex, deformations of smooth schemes and line bundles;
formal schemes, formal completion, coherent formal modules, the theorem on formal functions,
Grothendieck's existence theorem and algebraization; modifications, strict transforms of modules
and schemes, flattening by blow-up, domination and the resolution of curves by normalization;
Chow's lemma, Hilbert and Quot schemes; the moduli stack of stable pointed curves with its
algebraicity, properness, smoothness and finite projective cover; and de Jong's alteration theorems
over a field and over a trait, with the notions of strict normal crossings divisor, split prestable
family and S-variety they use.

**Conventions.** `Λ` is Noetherian with a finite map to the residue field `k`; objects of `C_Λ`
carry a fixed augmentation to `k`. Deformation functors are set-valued; a hull is never identified
with a prorepresenting ring. A formal scheme has locally a finitely generated ideal of definition;
locally Noetherian formal schemes carry the coherent theory. A modification is proper birational;
an alteration is proper, dominant and generically finite; de Jong's "semi-stable curve" is
StableReduction's prestable family. A trait is the spectrum of a complete discrete valuation ring.
**Imported, never rebuilt:** StableReduction Layers 0–4 and 7–9 (models, nodal families, coherent
curve theory, blow-ups and admissible blow-ups, stable and pointed stable reduction),
JacobianChallenge Layers C and E (cohomology and base change, finite étale multiplication on
Pic⁰), SF.0's excellence package, SF.1's spaces and stacks, SF.2's torsor and Ext classification,
SF.3's Picard schemes of curves. **Not here:** Néron models and abelian semistable reduction,
characteristic-zero resolution, the full cotangent complex and Ext² obstruction classes, prismatic
and crystalline deformation theory.

### SF.4a Infinitesimal lifting and deformation functors

**T364** `SF.4/first-order-thickening` (definition). A thickening of schemes is a closed immersion i : T → T′ whose underlying map of spaces is a bijection (equivalently, its ideal sheaf I = ker(O_T′ → i_*O_T) is locally nilpotent).
- Hypotheses: Schemes and morphisms are those of Mathlib's AlgebraicGeometry.Scheme;
- API: `IsFirstOrderThickening`, `IsFirstOrderThickening.isThickening`, `isFirstOrderThickening_specMap_iff`, `IsFirstOrderThickening.pullback`, `IsThickening.homeomorph` (+1)
- Tests: `isFirstOrderThickening_dualNumber` [computation] For a field k the map Spec k → Spec k[ε] induced …; `isFirstOrderThickening_id` [degenerate] The identity of any scheme is a first-order …; `not_isFirstOrderThickening_cube` [non-example] Spec k → Spec k[x]/(x³) is a thickening (x is …
- Source: Stacks, Tag 04EX, Definition 37.2.1 (More on Morphisms, Section 37.2 Thickenings).
- Needs: Mathlib `AlgebraicGeometry.IsClosedImmersion`, `AlgebraicGeometry.Scheme.Hom.ker` (+2)

**T365** `SF.4/formally-smooth-morphism` (definition). A morphism f : X → S of schemes is formally smooth (respectively formally unramified, formally étale) if for every first-order thickening T ⊂ T′ of affine schemes over S, every S-morphism T → X extends to at least one (respectively at most one, exactly one) S-morphism T′ → X.
- Hypotheses: No finiteness hypothesis on f. The test thickenings T ⊂ T′ are affine;
- API: `FormallySmooth`, `FormallyEtale`, `formallySmooth_specMap_iff`, `FormallySmooth.iff_affineLocally`, `FormallySmooth.comp` (+3)
- Tests: `formallySmooth_affineSpace` [computation] The structure morphism 𝔸(n; S) → S is formally …; `formallyEtale_id` [degenerate] The identity of any scheme is formally étale.; `not_formallySmooth_closedPoint` [non-example] For a field k, the closed immersion Spec k → Spec …
- Source: Stacks, Tags 02H0 (Definition 37.11.1), 02H8 (Definition 37.6.1), 02HG (Definition 37.8.1), 02HH (Lemma 37.11.4), 02H4 (Lemma 37.11.6), 0D0F (Lemma 37.11.10).
- Needs: T364; Mathlib `Algebra.FormallySmooth`, `Algebra.FormallySmooth.exists_lift` (+5)

**T366** `SF.4/infinitesimal-lifting-criterion`: Infinitesimal lifting criterion. Stacks, Tag 02H6, Lemma 37.11.7 (Infinitesimal lifting criterion); 02HM, Lemma 37.8.10; 02HE, Lemma 37.6.9; 00TN, Proposition 10.138.13.

**T367** `SF.4/smooth-lifting-torsor`: Torsor of infinitesimal lifts. Stacks, Section 37.9 (04BU): Tags 04FG (Lemma 37.9.1), 02H5 (Lemma 37.9.2), 04FH (Lemma 37.9.4), 04FJ (Lemma 37.9.5), 04FK (Remark 37.9.6); 02FQ (Lemma 20.4.3); 0D0E (Lemma 37.11.9); 06B5 (Lemma 37.11.8).

**T368** `SF.4/artinian-coefficient-category` (definition). Fix a Noetherian ring Λ and a finite ring map Λ → k to a field (the classical case: Λ a complete Noetherian local ring with residue field k). The category C_Λ has as objects Artinian local Λ-algebras A together with a Λ-algebra identification A/m_A ≅ k, and as morphisms local Λ-algebra homomorphisms compatible with the identifications.
- Hypotheses: Λ Noetherian; Λ → k finite (in the classical case, Λ complete local with residue field k).
- API: `Deformation.ArtinLocalAlg`, `Deformation.ArtinLocalAlg.toResidue`, `Deformation.ArtinLocalAlg.dualNumbers`, `Deformation.ArtinLocalAlg.pullback`, `Deformation.IsSmallExtension` (+2)
- Tests: `Deformation.zmod_prime_pow_mem` [computation] Z/p^n with its identification Z/p^n / (p) ≅ F_p …; `Deformation.residue_terminal` [degenerate] k itself is an object, and every object has …; `Deformation.not_mem_padicInt` [non-example] Z_p is in Ĉ_{Z_p} but is not an object of …
- Source: Stacks, Tags 06GC (Definition 90.3.1), 06GD (Definition 90.3.2), 06GE (Lemma 90.3.3), 06GH (Lemma 90.3.8), 06GW (Definition 90.4.1); convention of Section 90.2 (06G9).
- Needs: Mathlib `IsArtinianRing`, `IsLocalRing` (+5)

**T369** `SF.4/deformation-functor` (definition). A predeformation functor is a functor F : C_Λ → Set with F(k) a single point. For morphisms A′ → A and A″ → A in C_Λ consider the natural map θ : F(A′ ×_A A″) → F(A′) ×_{F(A)} F(A″).
- Hypotheses: F(k) a singleton. Conditions are stated for all objects of C_Λ;
- API: `Deformation.PredeformationFunctor`, `Deformation.PredeformationFunctor.H1`, `Deformation.PredeformationFunctor.tangentSpace`, `Deformation.PredeformationFunctor.tangentSpace.add_def`, `Deformation.prorep` (+2)
- Tests: `Deformation.prorep_tangent_powerSeries` [computation] For R = Λ[[t₁,…,t_n]], the tangent space of h_R …; `Deformation.point_functor` [degenerate] The constant one-point functor satisfies H1–H4 …; `Deformation.not_H2_quotient` [non-example] For char k ≠ 2 the functor A ↦ m_A/(x ~ −x) (the …
- Source: Stacks, Tags 06GS (Definition 90.6.2), 06HW (Definition 90.10.1), 06HY (Remark 90.10.3), 0D3G (Remark 90.13.5), 06IG (Definition 90.12.1), 06IH (Lemma 90.12.2), 06J2 (Definition 90.16.1), 06J6 (Remark 90.16.5), 06J7 (Lemma 90.16.6), 06J9 (Definition 90.16.8), 06JA (Remark 90.16.9), 06JI (Lemma 90.17.5).
- Needs: T368; Mathlib `DualNumber`; Tau Ceti `TauCeti.derivationToDualNumberEquivLift`

**T370** `SF.4/hull` (definition). A natural transformation F → G of functors C_Λ → Set is smooth if for every surjection A′ → A in C_Λ the map F(A′) → F(A) ×_{G(A)} G(A′) is surjective. For R ∈ Ĉ_Λ and a formal element ξ ∈ lim_n F(R/m_R^n), the pair (R, ξ) is versal if the induced transformation h_R → F is smooth, and it is a hull (minimal versal) if in addition the induced map on tangent spaces T_{h_R} → T_F is bijective.
- Hypotheses: Functors F with F(k) a point; Λ in the classical case for uniqueness statements.
- API: `Deformation.IsSmoothMorphism`, `Deformation.FormalElement`, `Deformation.IsVersal`, `Deformation.IsHull`, `Deformation.IsHull.unique` (+2)
- Tests: `Deformation.hull_prorep` [degenerate] For F = h_R the pair (R, id) is a hull and F is …; `Deformation.smooth_iff_powerSeries` [characterisation] h_R → h_Λ is smooth iff R ≅ Λ[[t₁,…,t_n]] (formal …; `Deformation.versal_not_hull` [non-example] For F = h_{k[[t]]}, the pair (k[[t, s]], t ↦ t) …
- Source: Stacks, Tags 06H3 (Definition 90.7.1), 06HG (Definition 90.8.1), 06HR (Definition 90.8.9), 06GX (Definition 90.6.1), 06T4 (Definition 90.14.4), 06T5 (Lemma 90.14.5).
- Needs: T369, T368; Mathlib `AdicCompletion`

**T371** `SF.4/schlessinger-theorem`: Schlessinger's theorem. Stacks, Tags 06IW (Lemma 90.13.4), 06IX (Theorem 90.15.5), 06IY (Remark 90.15.6), 06JM (Theorem 90.18.2).

**T372** `SF.4/obstruction-theory` (definition). Let F be a deformation functor on C_Λ. An obstruction theory for F with values in a finite-dimensional k-vector space O assigns to every small extension e : 0 → I → A′ → A → 0 and every ξ ∈ F(A) an element ob_e(ξ) ∈ O ⊗_k I, functorial in morphisms of small extensions, such that ob_e(ξ) = 0 iff ξ lifts to F(A′).
- Hypotheses: F satisfies (RS); obstruction maps are linear in I and compatible with base change of small extensions.
- API: `Deformation.ObstructionTheory`, `Deformation.ObstructionTheory.lift_iff`, `Deformation.ObstructionTheory.zero`, `Deformation.ObstructionTheory.relations_le`, `Deformation.ObstructionTheory.map`
- Tests: `Deformation.obstruction_powerSeries` [degenerate] h_{Λ[[t₁..t_n]]} has the zero obstruction theory.; `Deformation.obstruction_hypersurface` [computation] For R = Λ[[t]]/(t²) the functor h_R has a …; `Deformation.not_unobstructed_hypersurface` [non-example] h_R for R = k[[x,y]]/(xy) is not unobstructed: …
- Source: Stacks, Tags 07YG (Definition 98.22.1), 07YH (Example 98.22.3), 07YI (Example 98.22.4), 06HP (Definition 90.9.1).
- Needs: T369, T370, T368

**T373** `SF.4/algebra-deformation-classes`: Square-zero deformations of algebras and the naive cotangent complex. Stacks, Tags 08S3 (Section 91.2 setup), 0GPT (Lemma 91.2.3), 08S7 (Lemma 91.2.2), 08S5 (Lemma 91.2.1), 08S6 (Lemma 91.2.9), 0GPY (Remark 91.2.8), 0D14 (Lemma 91.8.1), 063Y (Lemma 37.10.1), 08SP (Lemma 92.16.1).

**T374** `SF.4/deformations-of-smooth-schemes`: Deformations of smooth schemes and of line bundles. Stacks, Tags 0DY7 (Example 93.9.1), 0DY8 (Lemma 93.9.2), 0DY9 (Lemma 93.9.3), 0DYA (Lemma 93.9.4), 0ET5 (Lemma 93.9.5), 0DZQ (Lemma 93.16.4), 0D14 (Lemma 91.8.1), 0D0N (Lemma 37.13.7), 0C6R (Lemma 37.4.1).

**T375** `SF.4/node-versal-deformation`: Versal deformation of a node. Deligne–Mumford 1969, §1, Proposition (1.5), Theorem (1.6), pp. 81–83.


### SF.4b Formal schemes and algebraization

**T376** `SF.4/formal-spectrum`: The formal spectrum of an adic ring. Stacks, Tag 0AHY (Section 87.2, Formal schemes à la EGA) with equations 0AHZ and 0AI0; 07E8 (Definition 15.37.1); 0AIF (Definition 87.9.9); 0AID (Definition 87.9.7).

**T377** `SF.4/formal-scheme` (definition). A formal scheme (of adic type with finitely generated ideals of definition) is a topologically locally ringed space 𝔛 that has an open cover by spaces isomorphic to Spf A for rings A complete and separated with respect to a finitely generated ideal.
- Hypotheses: Ideals of definition finitely generated (covers the Noetherian and the p-adically complete cases used by consumers).
- API: `FormalScheme`, `FormalScheme.Hom`, `FormalScheme.ofScheme`, `FormalScheme.IsLocallyNoetherian`, `FormalScheme.reduction` (+3)
- Tests: `FormalScheme.ofScheme_spf` [degenerate] A scheme viewed as a formal scheme has the zero …; `FormalScheme.padic_line` [computation] The completion of 𝔸¹_{Z_p} along its special …; `FormalScheme.not_adic_projection` [non-example] Spf k[[s,t]] → Spf k[[s]] (s ↦ s) is not adic: …
- Source: Stacks, Tag 0AHY (Section 87.2); 0AID (Definition 87.9.7); 0AKM (Lemma 87.10.5); 0AIM (Definition 87.11.1); 0AKY (Definition 87.20.7).
- Needs: T376; Mathlib `AlgebraicGeometry.Scheme.Modules`, `TopCommRingCat` (+1)

**T378** `SF.4/formal-completion`: Formal completion along a closed subscheme. Stacks, Tags 0AIZ (Lemma 87.14.2), 0AMC (Definition 87.14.3), 0GBA (Lemma 87.14.6).

**T379** `SF.4/coherent-formal-modules` (definition). Let X be a Noetherian scheme, Z = V(𝓘) a closed subscheme and X_n = V(𝓘ⁿ). The category Coh(X, 𝓘) of coherent formal modules consists of inverse systems (F_n)_{n≥1} with F_n a coherent O_X-module annihilated by 𝓘ⁿ and isomorphisms F_{n+1}/𝓘ⁿF_{n+1} ≅ F_n;
- Hypotheses: X Noetherian (or locally Noetherian); 𝓘 coherent.
- API: `Scheme.CoherentFormalModule`, `Scheme.completionFunctor`, `Scheme.completionFunctor_exact`, `Scheme.coherentFormalModuleEquivSpec`, `Scheme.coherentFormalModuleEquivFormal` (+1)
- Tests: `completion_structureSheaf_spec` [computation] For X = Spec A, the completion of O_X corresponds …; `completion_zero_ideal` [degenerate] If 𝓘 = 0 the completion functor is the identity …; `completion_not_full_affineLine` [non-example] For X = 𝔸¹_k and Z the origin, the completion …
- Source: Stacks, Tags 0EHN (Section 30.23), 087W (Lemma 30.23.1), 0880 (completion functor), 0881 (Lemma 30.23.4), 0EKN (Section 52.15).
- Needs: T378; Mathlib `AdicCompletion`, `AdicCompletion.map_exact` (+3)

**T380** `SF.4/theorem-on-formal-functions`: Theorem on formal functions. Stacks, Tags 02O5 (Proposition 30.19.1), 0897 (Lemma 30.19.3), 02OB (Lemma 30.20.4), 02OC (Theorem 30.20.5), 087U (Lemma 30.20.6), 02OD (Lemma 30.20.7).

**T381** `SF.4/stein-factorization`: Stein factorization and Zariski's connectedness. Stacks, Tags 03H0 (Theorem 37.53.4, Stein factorization, Noetherian case), 0AY8 (Lemma 37.53.6).

**T382** `SF.4/grothendieck-existence`: Grothendieck's existence theorem. Stacks, Tags 087V (Section 30.24), 0883 (Lemma 30.24.1), 0885 (Lemma 30.24.3), 0886 (Section 30.25), 088A, 088B (Lemmas 30.25.2–30.25.3), 088C (Proposition 30.25.4), 088E (Theorem 30.27.1), 088F (Remark 30.27.2).

**T383** `SF.4/algebraization-of-subschemes-and-morphisms`: Algebraization of closed formal subschemes and of morphisms. Stacks, Tags 0899 (Lemma 30.28.1), 09ZT (Lemma 30.28.2), 0A42 (Lemma 30.28.3).

**T384** `SF.4/grothendieck-algebraization`: Grothendieck's algebraization theorem. Stacks, Tag 089A (Theorem 30.28.4, Grothendieck's algebraization theorem); 0897 (Lemma 30.19.3).

**T385** `SF.4/effective-formal-deformations-of-curves`: Formal deformations of proper curves are effective. Stacks, Tag 089A (Theorem 30.28.4); 0DZQ (Lemma 93.16.4).


### SF.4c Modifications, flattening and resolution of curves

**T386** `SF.4/modification` (definition). Let S be an integral scheme. A modification of S is a proper morphism φ : S′ → S from an integral scheme S′ that is birational: there is a dense open U ⊆ S with φ⁻¹(U) dense in S′ and φ⁻¹(U) → U an isomorphism.
- Hypotheses: S, S′ integral; φ proper. Birationality is that of the morphism (an isomorphism over a dense open), which implies Mathlib's Scheme.Birational S′ S but is stronger: it is witnessed by φ itself.
- API: `IsModification`, `IsModification.comp`, `IsModification.toBirational`, `IsModification.centre`, `IsModification.isAlteration` (+2)
- Tests: `isModification_blowup_origin` [computation] The blowup of 𝔸²_k at the origin (Tau Ceti …; `isModification_id` [degenerate] The identity of an integral scheme is a …; `not_isModification_frobenius` [non-example] The absolute Frobenius of 𝔸¹_{F_p} is proper, …
- Source: Stacks, Tag 0AAZ (Definition 29.52.11); 0AB1 (Lemma 29.55.8).
- Needs: Mathlib `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsIntegral` (+2); Tau Ceti roadmap StableReduction Layer 4

**T387** `SF.4/strict-transform`: Strict transforms along blowups and modifications. Stacks, Tags 080D (Definition 31.34.1), 080E (Lemma 31.34.2).

**T388** `SF.4/generic-flatness`: Generic flatness. Stacks, Tags 052A (Proposition 29.28.1, generic flatness), 051R, 051S.

**T389** `SF.4/flattening-by-blowup`: Flattening by blowing up (Raynaud–Gruson). Stacks, Tags 0815 (Theorem 38.30.7), 081R (Lemma 38.31.1), 080K (Definition 31.35.1), 080L (Lemma 31.35.2).

**T390** `SF.4/modification-domination`: Modifications are dominated by admissible blowups. Stacks, Tags 081S (Lemma 38.31.3), 081T (Lemma 38.31.4), 081M (Lemma 38.11.5), 080B (Lemma 31.33.14).

**T391** `SF.4/chow-lemma`: Chow's lemma. Stacks, Tags 0200 (Lemma 30.18.1, Chow's lemma), 0201 (Remark 30.18.2), 0202 (Lemma 32.12.1).

**T392** `SF.4/regular-scheme` (definition). A scheme X is regular if it is locally Noetherian and every local ring O_{X,x} is a regular local ring (Mathlib's IsRegularLocalRing: Noetherian local with maximal ideal generated by dim O_{X,x} elements).
- Hypotheses: Locally Noetherian X.
- API: `IsRegular`, `isRegular_spec_iff`, `IsRegular.of_isOpenImmersion`, `IsRegular.of_smooth`, `IsRegular.isNormal` (+2)
- Tests: `isRegular_affineSpace` [computation] 𝔸ⁿ_k is regular (MvPolynomial over a field is a …; `isRegular_specInt` [computation] Spec Z is regular (Dedekind domain).; `not_isRegular_node` [non-example] Spec k[x,y]/(xy) is not regular at the origin: …
- Source: de Jong 1996, 2.4, 2.10 (pp. 55–56).
- Needs: T156; Mathlib `IsRegularLocalRing`, `IsRegularRing` (+3)

**T393** `SF.4/resolution-of-curves`: Resolution of curves by normalization. Stacks, Tags 0C45 (Lemma 33.41.1), 0BXR (Lemma 33.27.1), 035S (Lemma 29.55.11), 0BI4 (Lemma 54.15.1), 0B8Y (Lemma 33.43.8), 0BGK (Definition 54.14.1).

**T394** `SF.4/serre-normality-criterion`: Serre's criterion for normality. Stacks, Tag 031S (Lemma 10.157.4, Serre's criterion for normality).

**T395** `SF.4/bertini-smoothness`: Bertini's theorem for smooth hyperplane sections. Stacks, Tag 0FD4 (Section 33.47, Bertini theorems), 0FD5 (Lemma 33.47.1), 0FD6 (Lemma 33.47.3).


### SF.4d Moduli of stable pointed curves (input to alterations)

**T396** (removed). The Grassmannian scheme is Tau Ceti ModularCurves Layer 0G (the relative Grassmannian of locally free quotients, with its charts, gluing and universal property); see the boundaries section.

**T397** `SF.4/hilbert-scheme`: Hilbert and Quot schemes of projective morphisms. Nitsure 2005, §2 Theorem 2.3 (p. 11), §3 Theorems 3.3–3.7 (pp. 15–17), §4 Theorem 4.3 (p. 19), §5 Theorems 5.1–5.3 (p. 24) (arXiv v1).

**T398** `SF.4/stable-curve-stack` (definition). For integers g, n ≥ 0 with 2g − 2 + n > 0, M̄_{g,n} is the category fibred in groupoids over schemes whose objects over S are stable n-pointed curves of genus g: Tau Ceti StableReduction Layer 3's prestable families f : C → S with n pairwise disjoint sections σ₁,…,σ_n into the smooth locus such that ω_{C/S}(σ₁ + … + σ_n) is relatively ample and R¹f_*O_C is locally free of rank g;
- Hypotheses: 2g − 2 + n > 0; families in Tau Ceti StableReduction Layer 3's vocabulary;
- API: `StableCurves.Mbar`, `StableCurves.Mbar.isStack`, `StableCurves.Mbar.smooth`, `StableCurves.Mbar.pullback`, `StableCurves.Mbar.aut_finite` (+1)
- Tests: `StableCurves.Mbar_zero_three` [computation] Every stable 3-pointed genus-0 curve over S is …; `StableCurves.Mbar_one_one_aut` [computation] For an elliptic curve (E, O) over an …; `StableCurves.not_stable_zero_two` [non-example] (g, n) = (0, 2) is excluded: (P¹, 0, ∞) has …
- Source: de Jong 1996, 2.24, p. 62.
- Needs: [SF.1](#sf1); Mathlib `CategoryTheory.Pseudofunctor.IsStack`, `CategoryTheory.Functor.IsFibered`; Tau Ceti roadmap StableReduction Layer 3; StableReduction Layer 2

**T399** `SF.4/isom-stable-curves`: Isomorphism schemes of stable curves are finite and unramified. Deligne–Mumford 1969, §1, Theorem (1.11) and its proof, pp. 84–85.

**T400** `SF.4/stable-curve-stack-algebraic`: M̄_{g,n} is a proper Deligne–Mumford stack. Deligne–Mumford 1969, §5, Proposition (5.1) and Theorem (5.2), pp. 104–105; §1, pp. 76–78.

**T401** `SF.4/stable-curve-stack-smooth`: Smoothness of M̄_{g,n}. Deligne–Mumford 1969, Proposition (1.5) (p. 81), Theorem (1.6) and Corollaries (1.7)–(1.9) (p. 83), Theorem (5.2) (p. 104).

**T402** `SF.4/level-structure-cover`: Level structures and the finite projective cover of M̄_{g,n}. Deligne 1985, §3: 3.1–3.7, pp. 137–141 (Proposition 3.5, Lemma 3.5.7, Corollary 3.6, 3.7).

**T403** `SF.4/stable-extension-after-alteration`: Extending stable pointed curves after an alteration. de Jong 1996, 4.17 (pp. 71–72) and 5.13 (pp. 80–81).


### SF.4e Alterations

**T404** `SF.4/alteration` (definition). Let S be a Noetherian integral scheme. An alteration of S is a morphism φ : S′ → S from an integral scheme S′ that is proper, dominant, and finite over some nonempty open U ⊆ S.
- Hypotheses: S Noetherian integral, S′ integral.
- API: `IsAlteration`, `IsAlteration.functionFieldMap`, `IsAlteration.genericDegree`, `IsAlteration.genericDegree_comp`, `IsAlteration.IsGenericallyEtale` (+4)
- Tests: `isAlteration_frobenius` [computation] Absolute Frobenius of 𝔸¹_{F_p} is an alteration …; `isAlteration_gaussianIntegers` [computation] Spec Z[i] → Spec Z is a finite alteration of …; `isAlteration_id` [degenerate] The identity of an integral Noetherian scheme is …
- Source: Stacks, Tag 0AB0 (Definition 29.52.12); 0DMN (Lemma 72.8.5).
- Needs: T386, T391, T156, [SF.0](#sf0); Mathlib `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsDominant` (+6)

**T405** `SF.4/strict-normal-crossings` (definition). Let S be a Noetherian scheme and D ⊂ S an effective Cartier divisor (a closed subscheme locally cut out by one nonzerodivisor), with irreducible components D_i, i ∈ I, taken with reduced structure.
- Hypotheses: S Noetherian; effective Cartier divisors as closed subschemes.
- API: `IsStrictNormalCrossings`, `IsNormalCrossings`, `IsStrictNormalCrossings.local_equation`, `IsStrictNormalCrossings.isNormalCrossings`, `IsStrictNormalCrossings.pullback_smooth` (+2)
- Tests: `snc_axes` [computation] V(xy) ⊂ 𝔸²_k is a strict normal crossings divisor …; `snc_empty` [degenerate] The empty divisor is SNC.; `nodalCubic_nc_not_snc` [non-example] For char k ≠ 2, D = V(y² − x²(x + 1)) ⊂ 𝔸²_k is a …
- Source: de Jong 1996, 2.3–2.4, p. 55; 3.1, p. 62.
- Needs: T392; Mathlib `AlgebraicGeometry.Scheme.IdealSheafData`, `AlgebraicGeometry.Etale`; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`; Tau Ceti roadmap StableReduction Layer 2

**T406** `SF.4/nc-to-snc`: Making a normal crossings divisor strict by blowing up. de Jong 1996, 2.4 (p. 55) and 7.2 (p. 87); 4.28 (p. 76).

**T407** `SF.4/split-prestable-curve` (definition). In de Jong's terminology a semistable curve over a scheme S is a flat proper finitely presented f : X → S whose geometric fibres are connected curves with at most ordinary double points;
- Hypotheses: S any scheme; f prestable in the sense of Tau Ceti StableReduction Layer 3.
- API: `DeJong.IsSplitPrestable`, `DeJong.IsSplitPrestable.pullback`, `DeJong.IsSplitPrestable.singularLocus_section`, `DeJong.IsSplitPrestable.of_smooth`, `DeJong.IsSplitPrestable.of_sections`
- Tests: `DeJong.split_twoLines` [computation] V(xy) ⊂ P²_k (two lines meeting at a rational …; `DeJong.not_split_nodalCubic` [non-example] The nodal cubic y² = x²(x + 1) over k (char ≠ 2) …; `DeJong.split_after_extension` [compatibility] V(x² − a y²) ⊂ P²_k with a ∈ k not a square is …
- Source: de Jong 1996, 2.21–2.22, p. 61.
- Needs: Mathlib `AlgebraicGeometry.Flat`, `AlgebraicGeometry.IsProper` (+1); Tau Ceti roadmap StableReduction Layer 1; StableReduction Layer 3

**T408** `SF.4/node-local-structure`: Local structure of a nodal family over a Noetherian base. de Jong 1996, 2.23, pp. 61–62; 3.3, p. 63.

**T409** `SF.4/nodal-family-resolution`: Resolution of nodal families over a regular base (de Jong). de Jong 1996, §3: 3.1 (p. 62), Lemma 3.2 (p. 62), 3.3–3.5 (pp. 63–64), Proposition 3.6 (p. 64) and its proof (p. 65).

**T410** `SF.4/generic-projection`: Generic linear projections. de Jong 1996, 2.11, pp. 56–57.

**T411** `SF.4/curve-fibration`: Fibring a variety in curves (de Jong 4.11–4.12). de Jong 1996, Lemma 4.11 (pp. 67–68) and 4.12 (pp. 68–69).

**T412** `SF.4/three-point-divisor`: Adding sections meeting every fibre component three times. de Jong 1996, Lemma 4.13, pp. 69–70.

**T413** `SF.4/stable-model-domination`: A stable model dominates the original family after modification. de Jong 1996, 4.18–4.21, pp. 72–74.

**T414** `SF.4/curve-family-alteration`: Altering a curve fibration to a split semistable curve (de Jong 5.8). de Jong 1996, §5: 5.1–5.7 (pp. 76–79), Theorem 5.8 (p. 79), proof 5.9–5.17 (pp. 79–82).

**T415** `SF.4/de-jong-alteration-theorem`: de Jong's alteration theorem. de Jong 1996, Theorem 4.1 and Remark 4.2 (p. 66); proof 4.3–4.28 (pp. 66–76).

**T416** `SF.4/trait-and-varieties` (definition). A trait is S = Spec R with R a complete discrete valuation ring; η and s denote its generic and closed points and π a uniformiser. A morphism of traits Spec R′ → Spec R is given by a local homomorphism R → R′ of complete discrete valuation rings sending π to a nonzero element;
- Hypotheses: R complete DVR; X integral separated flat of finite type over S.
- API: `DeJong.IsTrait`, `DeJong.TraitHom.ramificationIndex`, `DeJong.IsSVariety`, `DeJong.isSVariety_iff_genericFiber_nonempty`, `DeJong.IsSVariety.baseChange_component` (+2)
- Tests: `DeJong.isTrait_padicInt` [computation] Spec Z_p is a trait with uniformiser p.; `DeJong.not_isTrait_localization` [non-example] Spec Z_(p) is not a trait: Z_(p) is a DVR but not …; `DeJong.ramification_sqrt` [computation] Z_p → Z_p[x]/(x² − p) is a finite extension of …
- Source: de Jong 1996, 2.12 (pp. 56–57), 2.15 (p. 59), 6.8 (p. 83).
- Needs: T404; Mathlib `IsDiscreteValuationRing`, `IsAdicComplete`; Tau Ceti `TauCeti.FiniteDVRExtension`, `TauCeti.genericFiber` (+2); Tau Ceti roadmap StableReduction Layer 0

**T417** `SF.4/strictly-semistable` (definition). Let S be a trait and X an S-variety; let X_i (i ∈ I) be the irreducible components of X_s and X_J = ⋂_{j∈J} X_j scheme-theoretically. X is strictly semistable over S if (a) X_η is smooth over κ(η);
- Hypotheses: S a trait; X an S-variety.
- API: `DeJong.IsStrictlySemistable`, `DeJong.IsStrictlySemistable.isRegular`, `DeJong.IsStrictlySemistable.local_form`, `DeJong.IsStrictlySemistable.smooth_over_model`, `DeJong.IsStrictlySemistable.snc_specialFiber` (+1)
- Tests: `DeJong.strictlySemistable_xy` [computation] Spec Z_p[x, y]/(xy − p) is strictly semistable …; `DeJong.strictlySemistable_smooth` [degenerate] A smooth S-variety with nonempty geometrically …; `DeJong.not_strictlySemistable_xy_sq` [non-example] Spec Z_p[x, y]/(xy − p²) is not strictly …
- Source: de Jong 1996, 2.16, pp. 59–60; 2.8, p. 55.
- Needs: T416, T405, T392, T365; Mathlib `AlgebraicGeometry.Smooth`; Tau Ceti roadmap StableReduction Layer 2

**T418** `SF.4/strict-semistable-pair` (definition). Let S be a trait, X an S-variety and Z ⊂ X a closed subset containing X_s, written Z = Z_h ∪ X_s with Z_h the union of the components flat over S. (X, Z) is a strict semistable pair if (a) X is strictly semistable over S;
- Hypotheses: S trait; Z ⊇ X_s.
- API: `DeJong.IsStrictSemistablePair`, `DeJong.IsStrictSemistablePair.local_form`, `DeJong.IsStrictSemistablePair.horizontal`, `DeJong.IsStrictSemistablePair.of_strictlySemistable`, `DeJong.IsStrictSemistablePair.restrict`
- Tests: `DeJong.pair_specialFiber` [degenerate] For X strictly semistable, (X, X_s) is a strict …; `DeJong.pair_with_horizontal` [computation] For X = Spec Z_p[x, y, z]/(xy − p), the pair (X, …; `DeJong.not_pair_diagonal` [non-example] For X = Spec Z_p[x, y]/(xy − p) and Z = X_s ∪ V(x …
- Source: de Jong 1996, 6.2–6.4, pp. 82–83.
- Needs: T417, T405, T416

**T419** `SF.4/faltings-formal-smoothness`: Reduced special fibres after finite extension (de Jong 2.13, Faltings). de Jong 1996, 2.12–2.14, pp. 56–59.

**T420** `SF.4/semistable-alteration-theorem`: Semistable alterations over a trait (de Jong 6.5). de Jong 1996, 6.1–6.16, pp. 82–87; Theorem 6.5 and Diagram 6.6, p. 83.


<a id="sf5"></a>

## SF.5. Intersection theory and Riemann–Roch

Intersection theory in the generality of Fulton's *Intersection Theory*, restricted to the
operations the arithmetic consumers use: Chow groups by rational equivalence, proper pushforward,
flat pullback, the first Chern class, Chern classes through projective bundles, refined Gysin maps
for regular immersions, the intersection product on smooth varieties with the projection and excess
formulas, Grothendieck–Riemann–Roch, and the surface theory (pairing, adjunction, Riemann–Roch,
Hodge index) with the product-of-curves route to the Weil bound. Inputs: Mathlib's algebraic cycles
with weighted pushforward, Tau Ceti's Weil and Cartier divisors and line-bundle classes, SF.3's
degrees and Riemann–Roch on curves, SF.2's coherent duality on surfaces, and StableReduction Layer
4's intersection numbers on arithmetic surfaces, which the surface pairing specializes to.

**Conventions.** Schemes are algebraic over a field `k` (separated, finite type); `Z_k(X)` is
Mathlib's `AlgebraicCycle X ℤ` graded by dimension; `CH_k(X)` is its quotient by rational
equivalence; on a smooth variety of pure dimension `n`, `CH^p = CH_{n−p}` and `A(X) = ⊕ CH^p(X)`.
Rational coefficients are the separate carrier `CH_k(X)_ℚ`, named on every target that uses them;
nothing proved with ℚ-coefficients is exported integrally. Degrees of zero-cycles are taken on proper
schemes only. `P(E) = Proj(Sym E^∨)` with `O(1)` the tautological quotient (Fulton 1998, Appendix B.5).

### Chow groups and the basic operations

**T421** `SF.5/rational-equivalence` (definition; `TauCeti.SchemeFoundations.Chow.RatEquiv`).
`Rat_k(X) ≤ Z_k(X)` is generated by the divisors `div r = Σ_V ord_V(r)[V]` of nonzero rational functions
on `(k+1)`-dimensional integral closed subschemes `W ⊆ X`, with `ord_V` Mathlib's `Scheme.ord`;
`CH_k(X) = Z_k(X)/Rat_k(X)`. Equivalent form: `α ∼ 0` iff `α = Σ p_*([V_i(0)] − [V_i(∞)])` for
subvarieties `V_i ⊆ X × P¹` dominant over `P¹`.
- Hypotheses: `X` separated of finite type over `k`; no smoothness.
- API: `.div`, `.div_mul`, `.mk`, `.equiv_iff_pone` (Fulton Prop. 1.6), `.CH_top_free` (`CH_n(X)` free on the `n`-dimensional components, `n = dim X`).
- Tests: `.test_pone_points` [computation] two `k`-points of `P¹` are equivalent, `CH_0(P¹) ≅ ℤ` by degree; `.test_elliptic_points` [non-example] on an elliptic curve over `k̄`, `[P] − [Q] ∼ 0` iff `P = Q`; `.test_affine_line` [degenerate] `CH_0(A¹) = 0`.
- Source: Fulton 1998, §1.3 and Proposition 1.6; Stacks, Section 42.19 (tag 02RV).
- Needs: Mathlib `AlgebraicGeometry.AlgebraicCycle`, `AlgebraicGeometry.Scheme.ord`; Tau Ceti `SchemeWeilDivisor`.

**T422** `SF.5/chow-divisor-class-comparison` (comparison). For `X` integral of dimension `n`, Tau Ceti's
divisor class group (`SchemeWeilDivisor` modulo principal divisors) is `CH_{n−1}(X)` through
`SchemeWeilDivisor.toAlgebraicCycle`; composed with `classGroupToLineBundleClass` it is the first Chern
class `Pic(X) → CH^1(X)` of T426, an isomorphism for `X` locally factorial. Source: Fulton 1998, §2.1;
Stacks, Section 42.24 (tag 02SI). Needs T421, T426; Tau Ceti `SchemeWeilDivisor.classGroupToLineBundleClass`.

**T423** `SF.5/proper-pushforward` (theorem). For `f : X → Y` proper, Mathlib's `AlgebraicCycle.map`
with residue-degree weights (`f_*[V] = deg(V/f(V))[f(V)]` when dimensions agree, `0` otherwise)
preserves rational equivalence and gives `f_* : CH_k(X) → CH_k(Y)` with `(gf)_* = g_*f_*`; for `X`
proper over `k`, `deg : CH_0(X) → ℤ` is well defined and `deg f_* = deg`.
- Hypotheses: `f` proper. Without properness pushforward fails (`A¹ → Spec k`: the point class is `∼ 0` on `A¹` but has degree 1).
- Source: Fulton 1998, Theorem 1.4; Stacks, Sections 42.12, 42.20 and 42.41 (tags 02R3, 02S0, 0AZ0). Needs T421; Mathlib `AlgebraicGeometry.AlgebraicCycle.map`, `IsProper`.

**T424** `SF.5/flat-pullback` (theorem). For `f : X → Y` flat of relative dimension `n`,
`f^*[V] = [f^{-1}(V)]` (multiplicities the lengths at generic points) gives `f^* : CH_k(Y) → CH_{k+n}(X)`,
`(gf)^* = f^*g^*`, and `f'^* g_* = g'_* f'^*` in a fibre square with `g` proper.
- Hypotheses: `f` flat with all fibres of pure dimension `n`.
- Source: Fulton 1998, Theorem 1.7 and Proposition 1.7; Stacks, Sections 42.14, 42.15 and 42.20 (tags 02RA, 02RF, 02S0). Needs T421, T423; Mathlib `AlgebraicGeometry.Flat`.

**T425** `SF.5/localization-sequence` (theorem). For a closed `Y ⊆ X` with complement `U`,
`CH_k(Y) → CH_k(X) → CH_k(U) → 0` is exact. Source: Fulton 1998, Proposition 1.8; Stacks, Section 42.19 (tag 02RV). Needs T423, T424.

### Divisors, Chern classes and Gysin maps

**T426** `SF.5/first-chern-class` (definition; `TauCeti.SchemeFoundations.Chow.c1`). For `L`
invertible on `X` and `V ⊆ X` integral of dimension `k`, `c_1(L) ∩ [V] := [C]` for `C` the Weil divisor of
any Cartier divisor on `V` representing `L|_V`, extended linearly; it descends to
`c_1(L) ∩ − : CH_k(X) → CH_{k−1}(X)`.
- Hypotheses: `X` algebraic over `k`; no smoothness.
- API: `.inter_additive` (`c_1(L ⊗ M) = c_1(L) + c_1(M)`), `.inter_comm` (Fulton Thm. 2.4), `.proper_pushforward` (projection formula, Prop. 2.5(c)), `.flat_pullback` (Prop. 2.5(d)), `.eq_cartier_divisor` (`c_1(O(D)) ∩ [V] = [D ∩ V]` when `V ⊄ D`).
- Tests: `.test_pone_degree` [computation] `deg(c_1(O(m)) ∩ [P¹]) = m`; `.test_trivial_bundle` [degenerate] `c_1(O_X) ∩ α = 0`; `.test_elliptic` [non-example] `c_1(O(P − Q)) ∩ [E] ≠ 0` for `P ≠ Q` on an elliptic curve over `k̄`; `.test_curve_degree` [compatibility] on a proper curve the degree is SF.3's `χ(L) − χ(O_C)`.
- Source: Fulton 1998, §§2.3–2.5, Theorem 2.4, Proposition 2.5; Stacks, Sections 42.25 and 42.28 (tags 02SN, 02TG). Needs T421, T423, T424; Tau Ceti `CartierDivisor`, `LineBundleClass`; SF.3 degree targets.

**T427** `SF.5/projective-bundle` (construction; `AlgebraicGeometry.projectiveBundle`). For `E`
locally free of rank `e+1` on `X`, `p : P(E) = Proj_X(Sym E^∨) → X` as a relative Proj (T015, on AlgebraicVectorBundles L2A's graded algebras) with `O(1)`
and `p^*E^∨ → O(1)`; `p` is flat and proper of relative dimension `e` with fibres `P^e_{κ(x)}`. Planned here
because the splitting principle and Chern classes need it; the algebraic-moduli roadmap imports it.
- API: `.structure_flat_proper`, `.fibre`, `.pullback` (`P(f^*E) = X' ×_X P(E)`), `.chow_basis` (`CH_k(P(E)) = ⊕_{i≤e} c_1(O(1))^i ∩ p^*CH_{k−e+i}(X)`, Fulton Thm. 3.3(b)).
- Tests: `.test_trivial` [degenerate] `P(O^{e+1}) = P^e × X`; `.test_point` [computation] `CH_*(P^e_k) = ℤ[h]/(h^{e+1})`; `.test_rank_one` [degenerate] `P(L) ≅ X`; `.test_hirzebruch` [non-example] `P(O ⊕ O(1))` over `P¹` has an intersection form different from `P¹ × P¹`.
- Source: Fulton 1998, Theorem 3.3 and Appendix B.5; Stacks, Section 42.36 (tag 02TV). Needs T015, T424, T426; Tau Ceti roadmap StableReduction Layer 2.

**T428** `SF.5/chern-classes` (definition; `TauCeti.SchemeFoundations.Chow.chernClass`). Segre classes
`s_i(E) ∩ α = p_*(c_1(O(1))^{e+i} ∩ p^*α)` on `P(E)`, and `c(E) = 1 + c_1(E) + ⋯` the inverse of the Segre
series, acting on `CH_*(X)`.
- Hypotheses: `E` locally free of constant finite rank; Chern classes of coherent sheaves are not defined here.
- API: `.vanishing` (`c_i(E) = 0`, `i > rank`), `.commutativity`, `.projection_formula`, `.pullback`, `.whitney_sum`, `.splitting_principle` (Fulton Thm. 3.2, §3.2).
- Tests: `.test_line_bundle` [compatibility] agrees with T426 in rank one; `.test_trivial` [degenerate] `c(O^n) = 1`; `.test_tangent_pn` [computation] `c(T_{P^n}) = (1+h)^{n+1}` (the Euler-sequence computation of Fulton §3.2); `.test_dual` [compatibility] `c_i(E^∨) = (−1)^i c_i(E)`.
- Source: Fulton 1998, Proposition 3.1, Theorem 3.2 and the splitting construction of §3.2; Stacks, Sections 42.37 and 42.43 (tags 02TZ, 02UK). Needs T423, T424, T426, T427.

**T429** `SF.5/refined-gysin-map` (construction; `TauCeti.SchemeFoundations.Chow.gysin`). For a regular
closed immersion `i : X → Y` of codimension `d` with normal bundle `N` and any `f : Y' → Y`, `X' = X ×_Y Y'`,
the map `i^! : CH_k(Y') → CH_{k−d}(X')`: specialize to the normal cone `C_{X'}Y' ⊆ f^*N` by deformation to the
normal cone, then intersect with the zero section (Fulton Thm. 3.3(a)). `i^* = i^!` for `f = id`.
- Hypotheses: `i` Koszul-regular of constant codimension `d`; no hypothesis on `f`.
- API: `.pushforward_compat`, `.pullback_compat`, `.commutes_with_c1`, `.excess_intersection` (`i^!α = c_{d−d'}(f^*N/N') ∩ i'^*α` when `i'` is regular, Thm. 6.3), `.functoriality` (Thm. 6.5), `.divisor_case` (agrees with T426 for `d = 1`).
- Tests: `.test_transverse` [computation] transversal smooth `X, Y'`: `i^![Y'] = [X ∩ Y']`; `.test_self_intersection_curve` [computation] `deg i^*[C] = C·C` for a smooth curve on a smooth surface; `.test_excess` [non-example] `i^![X] = c_d(N) ∩ [X]`, not `[X]`; `.test_zero_section` [degenerate] inverse of flat pullback for the zero section of a bundle.
- Source: Fulton 1998, §§5.1–5.2 and §6.1 (the construction), Theorems 6.2, 6.3 and 6.5; Stacks, Section 42.54 (tag 0FBI). Needs T423, T424, T426, T428; Mathlib `RingTheory.Sequence.IsRegular`; SF.4 blow-up targets.

### Intersection products, Riemann–Roch and surfaces

**T430** `SF.5/intersection-product` (definition; `TauCeti.SchemeFoundations.Chow.intersect`). For `Y`
smooth of pure dimension `n` over `k` and `X, X' → Y`, `α · β := δ^!(α × β) ∈ CH_{a+b−n}(X ×_Y X')` with `δ` the
diagonal (regular because `Y` is smooth); for `X = X' = Y`, `A(Y)` is a commutative graded ring with unit `[Y]`,
`f^*` is a ring map between smooth varieties and `f_*(f^*x · y) = x · f_*y` for `f` proper.
- Hypotheses: `Y` smooth over `k`; without smoothness the product is undefined.
- API: `.assoc`, `.comm`, `.one` (Fulton Prop. 8.1.1), `.pullback_ring_hom` (Prop. 8.3(a)), `.projection_formula` (Prop. 8.3(c)), `.c1_eq_mul`, `.proper_intersection` (`[V]·[W] = Σ i(Z; V·W)[Z]` with positive multiplicities, Prop. 8.2).
- Tests: `.test_pn_ring` [computation] `A(P^n) = ℤ[h]/(h^{n+1})`, `deg h^n = 1`; `.test_bezout` [computation] plane curves of degrees `d, e` meet in `de` points with multiplicity; `.test_graph_diagonal` [computation] on `C × C`, `Δ² = 2 − 2g` and `Γ_f · Δ = #Fix(f)` for transversal fixed points (Fulton §8.1, graph and diagonal); `.test_cone` [non-example] no ring structure on `CH_*` of the cone over a smooth quadric surface extends the ruling intersections integrally.
- Source: Fulton 1998, §§8.1–8.3, Propositions 8.1.1, 8.2 and 8.3; Stacks, Section 42.62 (tag 0FC0). Needs T421, T423, T424, T426, T429; Mathlib `AlgebraicGeometry.Smooth`.

**T431** `SF.5/grothendieck-riemann-roch` (theorem). For `f : X → Y` projective between smooth
quasi-projective varieties over `k` and `E` locally free on `X`, `ch(f_!E) · td(T_Y) = f_*(ch(E) · td(T_X))`
in `A(Y)_ℚ`, with `f_!E = Σ(−1)^i[R^if_*E]`, `ch` and `td` from T428 by the splitting principle;
Hirzebruch–Riemann–Roch `χ(X, E) = deg(ch(E) · td(T_X))_n` for `X` projective of dimension `n`.
- Hypotheses: `X, Y` smooth quasi-projective; `f` projective; ℚ-coefficients. Proof halves: projective bundles and closed immersions by blow-up (Fulton §15.2).
- Source: Fulton 1998, Theorem 15.2 and its corollaries in §15.2; Stacks, Section 42.66 (tag 02UO). Needs T423, T428, T429, T430; SF.2 quasi-coherent cohomology targets; SF.4 blow-up targets.

**T432** `SF.5/surface-intersection-pairing` (theorem). For `S` smooth projective over `k`,
`C·D := deg(c_1(O(C)) ∩ c_1(O(D)) ∩ [S])` on `Pic(S)` is the unique symmetric bilinear form with
`C·D = #(C ∩ D)` for transversal smooth curves; `C·D = deg_C(O(D)|_C)` for `C` integral; over `k̄`,
`C·D = Σ_P length O_{S,P}/(f,g)` without common components. On a regular proper model over a discrete
valuation ring the same formula restricted to vertical divisors is StableReduction Layer 4's matrix
(a comparison target, since that surface is not over a field).
- Source: Hartshorne 1977, V.1, Theorem 1.1 and Proposition 1.4. Needs T426, T430; Tau Ceti roadmap StableReduction Layer 4; SF.3 degree targets.

**T433** `SF.5/surface-adjunction-and-riemann-roch` (theorem). For `S` smooth projective over `k = k̄`
with canonical class `K`: `2p_a − 2 = C·(C + K)` for an integral curve `C ⊆ S`; `χ(O(D)) = ½D·(D − K) + χ(O_S)`;
and Noether's formula `12χ(O_S) = K² + c_2(T_S)` with `deg c_2(T_S)` the ℓ-adic Euler characteristic of
the pending CohomologicalPointCounting roadmap (a prerequisite), stated as a hypothesis of the formula.
- Hypotheses: `k` algebraically closed; `K` the class of `Ω²_S`; Serre duality `h²(D) = h⁰(K − D)` from SF.2.
- Source: Hartshorne 1977, V.1, Proposition 1.5 (nonsingular `C`), Exercise 1.3 (the `p_a` form), Theorem 1.6 and Remark 1.6.1; Fulton 1998, §15.2 (Noether's formula as an instance of Riemann–Roch). Needs T432; SF.2 coherent duality targets; SF.3 genus targets.

**T434** `SF.5/hodge-index-theorem` (theorem). For `S` smooth projective over `k = k̄` and `H` ample,
`D·H = 0` and `D ≢ 0` numerically imply `D² < 0`; equivalently, on every finitely generated subgroup of
`Num(S)` containing `H`, the form is negative definite on the orthogonal complement of `H`. Proof inputs: Riemann–Roch (T433) giving `h⁰(nD) + h⁰(−nD) ≥ ½n²D² + O(n)`, and
Nakai–Moishezon.
- Hypotheses: `k` algebraically closed; ampleness written out as "some power is very ample"; numerical equivalence by T432.
- Source: Hartshorne 1977, V.1, Lemma 1.7, Corollary 1.8, Theorem 1.9 (Hodge index), Theorem 1.10 (Nakai–Moishezon), Exercise 1.9 (the Hodge inequality). Needs T432, T433.

**T435** `SF.5/weil-bound-via-surfaces` (application). For `C` smooth projective geometrically irreducible
of genus `g` over `F_q`, with `Γ ⊆ C × C` (over `F̄_q`) the Frobenius graph and `Δ` the diagonal:
`Γ·Δ = #C(F_q)`, `Γ² = q(2 − 2g)`, `Δ² = 2 − 2g`, `Γ·(P × C) = 1`, `Γ·(C × P) = q`; the Hodge index theorem
applied to `aΓ + bΔ` orthogonal to `P × C + C × P` (Castelnuovo–Severi) gives `|#C(F_q) − (q+1)| ≤ 2g√q`.
Transversality of `Γ` and `Δ` at `F_q`-points is part of the target. The Weil-conjectures roadmap imports
this as one of its two routes.
- Source: Hartshorne 1977, V.1, Exercises 1.9 and 1.10; Fulton 1998, §8.1 (fixed points as the intersection of a graph with the diagonal). Needs T430, T432, T434; SF.3 genus targets; Tau Ceti roadmap AlgebraicCurves Layer 8.

**T436** `SF.5/bezout-inequality` (theorem). For equidimensional closed `V, W ⊆ P^n_k`,
`Σ_Z deg Z ≤ deg V · deg W` over the irreducible components `Z` of `V ∩ W`, with equality
`Σ_Z i(Z; V·W) deg Z = deg V deg W` when the intersection is proper; no smoothness and no properness
of the intersection is needed for the inequality, which is the form the height applications use.
- Source: Fulton 1998, Example 8.4.6 and §12.3 (Theorem 12.3, Example 12.3.1). Needs T423, T426, T430.

## Sources

- Stacks: *The Stacks Project*, https://stacks.math.columbia.edu.
- Fulton 1998: W. Fulton, *Intersection Theory*, 2nd ed., Ergebnisse 3/2, Springer 1998.
- Hartshorne 1977: R. Hartshorne, *Algebraic Geometry*, GTM 52, Springer 1977.
- EGA IV₃: Grothendieck–Dieudonné, *EGA IV, troisième partie*, Publ. IHÉS 28 (1966).
- EGA IV₄: *EGA IV, quatrième partie*, Publ. IHÉS 32 (1967).
- SGA 4 XVI: M. Artin, *Théorème de changement de base par un morphisme lisse, et applications*, SGA 4, Exposé XVI, LNM 305.
- Grothendieck 1957: *Sur quelques points d'algèbre homologique*, Tôhoku Math. J. 9 (1957).
- Grothendieck 1966: *On the de Rham cohomology of algebraic varieties*, Publ. IHÉS 29 (1966).
- Grothendieck Brauer I, II, III: *Le groupe de Brauer I–III*, Dix exposés sur la cohomologie des schémas (1968).
- Grothendieck 2005: *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et globaux (SGA 2)*.
- Deligne–Mumford 1969: *The irreducibility of the space of curves of given genus*, Publ. IHÉS 36.
- Deligne 1985: *Le lemme de Gabber*, Astérisque 127.
- de Jong 1996: *Smoothness, semi-stability and alterations*, Publ. IHÉS 83.
- Morel–Voevodsky 1999: *A¹-homotopy theory of schemes*, Publ. IHÉS 90.
- Huber 1996: *Étale cohomology of rigid analytic varieties and adic spaces*, Aspects of Mathematics E30, Vieweg.
- Scholze 2017: *Étale cohomology of diamonds*, https://arxiv.org/abs/1709.07343.
- Bhatt–Scholze 2014: *The pro-étale topology for schemes*, https://arxiv.org/abs/1309.1198v2.
- Bhatt–Scholze 2017: *Projectivity of the Witt vector affine Grassmannian*, https://arxiv.org/abs/1507.06490v3.
- Bhatt–Scholze 2022: *Prisms and prismatic cohomology*, Ann. of Math. 196, https://arxiv.org/abs/1905.08229.
- Bhatt–Morrow–Scholze 2018: *Integral p-adic Hodge theory*, Publ. IHÉS 128, https://arxiv.org/abs/1602.03148.
- Bhatt 2017: *On the direct summand conjecture and its derived variant*, https://arxiv.org/abs/1608.08882v2.
- Bhatt–Ma–Patakfalvi et al. 2020: *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*, https://arxiv.org/abs/2012.15801v3.
- Zhu 2017: *Affine Grassmannians and the geometric Satake in mixed characteristic*, https://arxiv.org/abs/1407.8519v3.
- Clausen–Mathew–Morrow 2021: *K-theory and topological cyclic homology of henselian pairs*, https://arxiv.org/abs/1803.10897v2.
- Clausen–Mathew 2021: *Hyperdescent and étale K-theory*, https://arxiv.org/abs/1905.06611v3.
- Česnavičius 2018: *Purity for the Brauer group*, https://arxiv.org/abs/1711.06456v4.
- Česnavičius 2020: *Grothendieck–Serre in the quasi-split unramified case*, https://arxiv.org/abs/2009.05299v7.
- Česnavičius 2021: *Macaulayfication of Noetherian schemes*, https://arxiv.org/abs/1810.04493v2.
- Gille–Parimala 2026: *A local-global principle for twisted flag varieties*, https://hal.science/hal-03938963v5.
- Hacon–Witaszek 2023: *On the relative minimal model program for fourfolds in positive and mixed characteristic*, https://doi.org/10.1017/fmp.2023.6.
- Witaszek 2022: *Keel's base point free theorem and quotients in mixed characteristic*, https://arxiv.org/abs/2002.11915v2.
- Boxer–Pilloni 2025: *Higher Hida theory for Siegel modular forms*, https://doi.org/10.1007/s00222-025-01393-2.
- Boxer–Calegari–Gee–Pilloni 2021: *Abelian surfaces over totally real fields are potentially modular*, https://arxiv.org/abs/1812.09269v3.
- Le–Le Hung–Levin–Morra 2020: *Serre weights and Breuil's lattice conjecture in dimension three*.
- Dimitrov–Gao–Habegger 2020: *Uniformity in Mordell–Lang for curves*, https://arxiv.org/abs/2001.10276v3.
- Klevdal–Patrikis 2024: *Compatibility of canonical ℓ-adic local systems on adjoint Shimura varieties*, https://arxiv.org/abs/2303.03863v2.
- Couveignes 2019: *Enumerating number fields*, https://arxiv.org/abs/1907.13617v2.
- Kisin 2017: *Mod p points on Shimura varieties of abelian type*, J. AMS 30.
- van Hoften 2024: *Mod p points on Shimura varieties of parahoric level*, https://arxiv.org/abs/2010.10496v4.
- Poonen 2017: *Rational points on varieties*, GSM 186, AMS.
- Cadman 2005: *Using stacks to impose tangency conditions on curves*, https://arxiv.org/abs/math/0312349v3.
- Conrad 2005: *The Keel–Mori theorem via stacks*.
- Abramovich–Olsson–Vistoli 2008: *Tame stacks in positive characteristic*, https://arxiv.org/abs/math/0703310v1.
- Nitsure 2005: *Construction of Hilbert and Quot schemes*, https://arxiv.org/abs/math/0504590v1.
- Kleiman 2005: *The Picard scheme*, https://arxiv.org/abs/math/0504020.
- Harpaz–Wittenberg 2019: *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*.
- Harpaz–Wittenberg 2023: *The Massey vanishing conjecture for number fields*, https://arxiv.org/abs/1904.06512v2.
- Kings–Sprang 2019: *Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation*, https://arxiv.org/abs/1912.03657v4.
- Yun–Zhang 2017: *Shtukas and the Taylor expansion of L-functions*, https://arxiv.org/abs/1512.02683.
- Bhargava–Gross–Wang 2017: *A positive proportion of locally soluble hyperelliptic curves over ℚ have no point over any odd degree extension*, arXiv:1310.7692.
- Betts–Stix: *Galois sections and p-adic period mappings*, https://www.math.uni-frankfurt.de/~stix/research/preprints/.
- Benoist–Wittenberg 2020: *On the integral Hodge conjecture for real varieties, I*, Invent. Math. 222.
- Benoist 2019: *The period-index problem for real surfaces*, Publ. IHÉS 130.
- Milne LEC: *Lectures on Étale Cohomology* (v2.21), https://www.jmilne.org/math/CourseNotes/LEC.pdf.
- Milne 2008: *Abelian Varieties* (course notes v2.00), https://www.jmilne.org/math/CourseNotes/AV.pdf.
- Kedlaya–Liu: *Relative p-adic Hodge theory: foundations*, Astérisque 371 (2015).
- Tau Ceti AlgebraicCurves: the Tau Ceti roadmap of that name, https://github.com/TauCetiProject/TauCetiRoadmap; Tau Ceti CohomologicalPointCounting: the pending roadmap of that name (TauCetiRoadmap pull request 196).
