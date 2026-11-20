# Roadmap: étale cohomology foundations

**Summary.** This roadmap builds reusable scheme étale cohomology with finite, integral adic and rational coefficients on Mathlib's small étale site. On Tau Ceti's compactification package it proves Nagata's compactification theorem and defines the canonical lower shriek of a compactifiable morphism without a chosen compactification. It then supplies finite-cover monodromy, localization and proper supports, proper and smooth base change, cohomological dimension, Artin vanishing and constructible finiteness, general henselian-trait inertia and the tame character, normalized adic realization through the pro-étale site, purity and duality, perverse sheaves, and the independent Frobenius and perfect-complex trace algebra used in arithmetic applications. Its end theorems are the six operations on bounded constructible complexes with their base-change, Künneth, purity and duality theorems; the dimension, vanishing and finiteness theorems for finite and `ℓ`-adic cohomology; and the arithmetic fundamental-group exact sequence. It also fixes the interface from which zeta series are formed: the point count of a scheme over the finite extensions of a finite field, on Tau Ceti's rational-point count, with its description by Frobenius fixed points.

## Scope and ownership

This roadmap owns Nagata existence of compactifications and the blow-up steps of its proof; constructible étale module sheaves, the étale fundamental groupoid on Tau Ceti's finite étale Galois category, effective descent of finite étale covers and the monodromy equivalence for lisse sheaves; finite Tate twists and topological invariance; coefficient and bounded-complex descent; étale extension by zero, localization, `D⁺` torsion lower shriek, finite traces and finite cycle classes; proper and smooth base change, local acyclicity, finite-coefficient Künneth, cohomological dimension, Artin vanishing and constructible finiteness; henselian-trait inertia and tame characters; saturation, dual lattices and the matrix form of stable lattices; the comparison morphism from the pro-étale to the étale site and normalized integral and rational adic realization through it; exceptional inverse image, duality, smooth Gysin maps, projective and blow-up formulas, weak Lefschetz and field perverse `t`-structures; finite-field descent, scheme/descent Frobenius comparison, perfect-complex trace algebra and free-torsor coefficient descent. It also owns the category of geometric points with its Galois and Frobenius actions on stalks, the invertibility class Scheme.IsInvertibleOn, the canonical lower shriek of a compactifiable morphism and the six-operation output structure, the abstract Verdier layer, rank-one lisse sheaves from torsors and characters, the canonical étale fundamental group `EtaleFundamentalGroup` with its functoriality `EtaleFundamentalGroup.map`, the arithmetic exact sequence `arithmeticExactSequence`, Frobenius classes and the Weil group MonoidHom.weilGroup, adic systems over a Noetherian pair `(Λ, I)`, pro-étale coefficient ring objects with their lattices, and the point counts Scheme.Hom.pointCount over finite extensions of a finite field.

The pinned Tau Ceti library already carries nine packages that this roadmap consumes as they stand and does not restate: the compactification carrier with its category, dense replacement, base change, common refinements, cofilteredness and comparison principle (§§G.1 and G.3); the finite étale Galois category of an arbitrary scheme, with base change, finite limits and coproducts, quotients by finite groups, geometric fibre functors, étale paths within connected components and the identification of the étale fundamental group of a field with its absolute Galois group (§§F.0.2 and F.0.A0); effective descent of schemes affine over the source of an affine flat morphism, and descent of finiteness along flat surjective quasi-compact morphisms (§F.0.2); the strict henselization of a local ring as a henselian local ring (§F.3a); jointly continuous representations, their integral models and the stable-lattice theorem (§F.4.0); the compactness and openness of a lattice over a nonarchimedean local field and of its stabilizer (§F.4.0); the trace of an endomorphism of a finite projective module (§F.10.3); the count of rational points of a scheme over a ring, with its Frobenius fixed-point description (§F.10.1); and the cardinality and degree of the fixed field of a power of Frobenius (§F.10.1). The supplier table names the declarations.

The generic derived enhancement, `K`-injective/`K`-flat replacements, coherent tensor–Hom and sheaf-level limits belong to EnhancedDerivedSheaves. Module-level derived tensor, towers, limits and completion belong to DerivedModuleAlgebra. Scheme sites, their universal-homeomorphism equivalences, scheme Frobenius and intersection geometry belong to SchemeAndStackFoundations; §F.0.4 supplies sheaf and cohomology transport along those equivalences. The pro-étale site foundations (repleteness, w-contractible covers, left completeness) are SchemeAndStackFoundations §2.17; the comparison morphism `ν` from the small pro-étale to the small étale site, its adjunction `ν^* ⊣ ν_*` and the single change of coefficient universe for étale coefficients are constructed here in §F.4.3 on those foundations and on Mathlib's inclusion of the étale in the pro-étale site (`MorphismProperty.Over.changeProp` along `etale_le_weaklyEtale`), together with the comparison of étale and pro-étale realizations through `ν`.

Nearby and vanishing cycles, absolute purity and Lefschetz pencils belong to LefschetzPencilsAndVanishingCycles; analytic support geometry and analytic cohomology belong to ClassicalAdicEtaleCohomology; Betti and analytic comparison belong to ComplexComparisonPartII. Hilbert irreducibility, tame specialization and the arithmetic trace formulas belong to InverseGaloisAndArithmeticFundamentalGroups. The stable-lattice theorem covers nonarchimedean local fields, with finite `E/ℚ_ℓ` used by the adic consumers; coefficient-field descent in `ℚ̄_ℓ` and building comparisons are arithmetic representation theory. Kernel transforms, the Artin–Schreier and Kummer sheaves and the Fourier–Deligne transform belong to FourierDeligneTransform, a downstream consumer of the six operations, twists and rank-one lisse sheaves built here. The zeta series of a scheme over a finite field belongs to WeilConjectures, a downstream consumer; the count of points over the degree-`r` extension of a finite field from which a zeta series is formed is Scheme.Hom.pointCount of §F.10.1, and no zeta series is defined here.

**Names carried by the libraries.** Target names of this roadmap that consumers cite and that the pinned libraries carry, written without code formatting, with the pinned declarations to cite in their place:

| Name in this roadmap | Section | Pinned declaration |
| --- | --- | --- |
| Compactification, Compactification.Hom | §G.1 | `TauCeti.Compactification` and its morphisms, a full subcategory of Mathlib's `CategoryTheory.Factorisation` |
| DenseCompactification | §G.1 | `TauCeti.DenseCompactification` |
| Compactification.identity | §G.1 | `TauCeti.Compactification.identity`, `TauCeti.DenseCompactification.identity` |
| Compactification.baseChange | §G.1 | `TauCeti.Compactification.baseChange` |
| Compactification.denseReplacement, Compactification.denseReplacementMap | §G.1 | `TauCeti.Compactification.denseReplacement`, `TauCeti.Compactification.denseReplacementMap` |
| Compactification.denseReplacement_dualNumber_section | §G.1 | `TauCeti.Compactification.denseReplacement_dualNumber_section` |
| Compactification.denseReplacement_specialFiber_empty | §G.1 | `TauCeti.Compactification.denseReplacement_specialFiber_empty` |
| HasCompactification f | §G.2 | `Nonempty (TauCeti.Compactification f)` |
| Compactification.Hom.proper | §G.3 | the instance `TauCeti.Compactification.Hom.proper` |
| compactificationCommonRefinement | §G.3 | `TauCeti.Compactification.commonRefinement` with `TauCeti.Compactification.commonRefinementFst` and `TauCeti.Compactification.commonRefinementSnd` |
| denseCompactification_hom_unique | §G.3 | `TauCeti.Compactification.hom_unique` |
| denseCompactification_cofiltered | §G.3 | the `IsCofiltered (TauCeti.DenseCompactification f)` instance of `TauCeti.AlgebraicGeometry.Compactification.Cofiltered`, given `nagataCompactification` |
| ContinuousRep, ContinuousRep.Iso, ContinuousRep.ofCharacter, ContinuousRep.baseChange | §F.4.0 | `TauCeti.ContinuousRep`, `TauCeti.ContinuousRep.Iso`, `TauCeti.ContinuousRep.ofCharacter`, `TauCeti.ContinuousRep.baseChange` |
| ContinuousRep.ofCharacter_iso_iff | §F.4.0 | `TauCeti.ContinuousRep.nonempty_iso_ofCharacter_iff` |
| ContinuousRep.baseChange_self_iso, ContinuousRep.baseChange_trans_iso | §F.4.0 | `TauCeti.ContinuousRep.baseChangeSelfIso`, `TauCeti.ContinuousRep.baseChangeTransIso` |
| ContinuousRep.exists_stable_lattice_iff | §F.4.0 | `Subgroup.isCompact_closure_iff_exists_stable_lattice` |
| GaloisLattice.IntegralModel, GaloisLattice.IntegralModel.isLattice, GaloisLattice.IntegralModel.toContinuousRep | §F.4.0 | `TauCeti.GaloisLattice.IntegralModel` (its `lattice` field is a full lattice), `TauCeti.GaloisLattice.IntegralModel.toContinuousRep` |
| GaloisLattice.IntegralModel.smul | §F.4.0 | the `MulAction Eˣ` instance on `TauCeti.GaloisLattice.IntegralModel`, with `TauCeti.GaloisLattice.IntegralModel.lattice_smul` |
| GaloisLattice.IntegralModel.nonempty_iso_genericFibre | §F.4.0 | `TauCeti.GaloisLattice.IntegralModel.genericFiberIso` |
| GaloisLattice.IntegralModel.nonempty, GaloisLattice.IntegralModel.exists_pow_le | §F.4.0 | `TauCeti.GaloisLattice.IntegralModel.nonempty`, `TauCeti.GaloisLattice.IntegralModel.exists_pow_le` |
| VanishingCycles.numberOfRationalPoints, VanishingCycles.numberOfRationalPoints_pullback | §F.10.1 | `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`, `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints_pullback` |
| VanishingCycles.frobeniusFixedField_card | §F.10.1 | `TauCeti.natCard_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow`, with `TauCeti.finrank_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow` for the degree |

## Conventions

Use Mathlib's scheme, morphism-class, sheaf, Galois-category, module and derived-category vocabulary, and adopt its API as it develops. Construct every specified missing interface in Tau Ceti. Names in this README are relative to `TauCetiRoadmap.EtaleCohomologyFoundations` in [Suggested.lean](Suggested.lean), which states the headline theorems expressible at the pins; implementation homes are the corresponding Tau Ceti algebraic-geometry, module and category-theory namespaces. A target name written without code formatting is a name for a target of this README that `Suggested.lean` does not declare.

**Carrier and universes.** Schemes are `X : Scheme.{u}` and coefficient rings `Λ : Type u` are commutative. An étale `Λ`-module sheaf is an object of `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` on Mathlib's small étale site `Scheme.smallEtaleTopology`. Its only essentially small model is Mathlib's `Scheme.AffineEtale` through `Scheme.AffineEtale.sheafEquiv`, which supplies sheafification and the Grothendieck abelian structure (`AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`) without enlarging the universe. Write `D(X,Λ)` for Mathlib's `DerivedCategory` of this category, with one global `HasDerivedCategory` instance obtained from its Grothendieck abelian structure (EnhancedDerivedSheaves §0.1). Boundedness, constructibility, finite Tor amplitude and torsion are `ObjectProperty`s of `D(X,Λ)`, never separate categories. No big étale site, cardinal-bounded site, second small étale site, lifted coefficient ring or universe-zero field `{k : Type}` occurs in a statement. The pro-étale coefficients of §§F.4.3–F.4.5 live in universe `u+1`, as Mathlib's `Scheme.EllAdicCohomology` does, where the pinned Grothendieck abelian structure on pro-étale sheaves (`Sheaf (Scheme.ProEt.topology X) Ab.{u+1}`) lives; Mathlib's `Scheme.ellAdicSheaf` itself is `Ab.{u}`-valued, and Mathlib lifts it once along `AddCommGrpCat.uliftFunctor.{u+1}` to define `Scheme.EllAdicCohomology`. Étale coefficients are reached from `D(X,Λ)` only through the comparison `ν^* ⊣ ν_*` of §F.4.3, and the `ℓ`-adic coefficient sheaf `ℤ_ℓ,X` of §F.4.3 is Mathlib's lift of `Scheme.ellAdicSheaf`: universes change in exactly these two places, and no statement lifts a coefficient ring.

**Geometric points.** A geometric point of `S` is a morphism `x : Spec (.of Ω) ⟶ S` with `Ω : Type u` a separably closed field (`IsSepClosed Ω`). The stalk at `x` is `(Scheme.pointSmallEtale x).sheafFiber`. Statements take such an unbundled `x`; the category of geometric points of §F.0.1 exists only to carry functoriality in the point: Galois actions on stalks, Frobenius at rational points and changes of path. Algebraically closed points are the case `IsAlgClosed Ω`; stalks do not change under extension of the separably closed field, a theorem of §F.0.1.

**Invertibility.** Invertibility of an integer `ℓ` on `X` is the single class Scheme.IsInvertibleOn ℓ X: `ℓ` is a unit in every residue field. Its field, `CharP` and unit forms are lemmas, among them Scheme.isInvertibleOn_iff_ne_zero: on a nonempty scheme over a field `k` it is `(ℓ : k) ≠ 0`. A headline statement over a field `k` takes the explicit hypothesis `(hℓ : (ℓ : k) ≠ 0)`. A finite field is `[Field k] [Finite k]`, never `[Fintype k]`.

**Statement shape.** Definitions carry no hypotheses: invertibility, finiteness and compactifiability are hypotheses of theorems or `Prop`-valued classes. Canonical maps are data with laws; a comparison is an isomorphism or `IsIso` of a named map, never `Nonempty (_ ≅ _)`, and no definition uses `Classical.choose`. Characterisations (`_iff`, `_eq`) are the API, and connectedness or properness is assumed only where the mathematics needs it.

Finite commutative coefficients `Λ` are killed by an integer `N≥1`. Invertibility of `N` (Scheme.IsInvertibleOn N X) is required only where stated: finite lissity, constructibility, finite-cover monodromy, localization and proper base change for torsion have no invertibility restriction. Constructibility is affine-local: every affine open admits a finite constructible stratification on whose pieces the sheaf is locally constant of finite type (§F.0.1). On a quasi-compact quasi-separated scheme (for instance one with Noetherian underlying space) this is equivalent to one global finite stratification; the equivalence is a theorem, not the definition. `Dᵇ_c` and `Dᵇ_ctf` differ by finite Tor amplitude. A noetherian coefficient ring in §§0.5–0.6 permits finitely generated infinite modules. Statements allowing an arbitrary ring retain that generality.

Complexes are cohomological: `Hⁱ(K[r])=Hⁱ⁺ʳ(K)`. Thus `Λ(−d)[−2d]` is concentrated in degree `2d`. The unit and tensor associativity, Koszul signs, connecting maps and finite-group actions live in the enhancement before passing to the homotopy category. A bounded adic system has common cohomological and Tor intervals and coherent derived coefficient reductions; its realization is `Rlim`, with Milnor terms retained. Ordinary inverse limits of cohomology are used only after the appropriate ML comparison is proved.

A trait is `Spec R` for a henselian DVR, with a chosen separable closure of its fraction field and its normalization; its geometric closed point is `Spec` of `SeparableClosure` of the residue field, and the closed point of the normalization, with algebraically closed residue field, has the same stalks (§F.0.1). Completeness is not assumed. Its residue characteristic is `p≥0`, and `ℓ` is a prime different from `p`. Tate twists are `Λ(1) = Λ ⊗_(ℤ/n) μ_n` with `n = ringChar Λ`, its tensor powers and its negative dual powers, defined on every scheme (§F.0.3). Arithmetic `q`-Frobenius acts on coordinates by `q`-th power; geometric Frobenius is its inverse and acts on `ℚ_ℓ(1)` by `q⁻¹`. Point and hyperplane trace classes have degree `+1`. Compact-support lower shriek `Rf_!` is defined once for a compactifiable `f`, without a chosen compactification (§0.8); every compactification `f = p∘j` computes it as `Rp_*j_!` through a canonical isomorphism, and its comparison to the right derived functor of the underived composite is explicitly retained.

## Exact supplier contracts

| Supplier | Exact interface consumed |
| --- | --- |
| Mathlib, pinned at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` | `AlgebraicGeometry.Scheme`, `Over`, pullbacks, `IsOpenImmersion`, `QuasiCompact`, `IsProper`, `IsSeparated`, `LocallyOfFiniteType`, `IsSchemeTheoreticallyDominant` and its flat-pullback API `IsSchemeTheoreticallyDominant.of_isPullback`; schematic images; `topologicalKrullDim`. Sites and points: `Scheme.smallEtaleTopology`, `Scheme.AffineEtale.sheafEquiv`, `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`, `Scheme.pointSmallEtale`, `AlgebraicGeometry.Scheme.isConservative_pointSmallEtale`, `GrothendieckTopology.HasEnoughPoints`, the category of points `GrothendieckTopology.Point` with `GrothendieckTopology.Point.sheafFiber`, `GrothendieckTopology.Point.comap` and `GrothendieckTopology.Point.sheafFiberComapIso`; `MorphismProperty.Over.map`, `MorphismProperty.Over.pullback`, `Functor.sheafPullback`, `Functor.IsDenseSubsite.sheafEquiv`, `constantSheaf`. Sheaves and derived categories: `ModuleCat`, `SheafOfModules`, `Sheaf.H`, `Sheaf.IsConstant`, `Topology.IsConstructible`, `ObjectProperty.IsSerreClass`, the closure classes `ObjectProperty.ContainsZero`, `ObjectProperty.IsClosedUnderIsomorphisms`, `ObjectProperty.IsClosedUnderKernels`, `ObjectProperty.IsClosedUnderCokernels` and `ObjectProperty.IsClosedUnderExtensions`, `ObjectProperty.isoModSerre`, `DerivedCategory`, `DerivedCategory.TStructure.t`, `Triangulated.TStructure.bounded`, `ObjectProperty.IsTriangulated`, `ObjectProperty.HasInducedTStructure`, `ShiftedHom`; `MonoidalCategory.tensorLeft` and `Functor.IsEquivalence`, for invertible objects; `Pseudofunctor`, `Bicategory.Adj`, `Scheme.Modules.pseudofunctor`, `TwoSquare`, `mateEquiv`. Galois theory: `CategoryTheory.GaloisCategory`, `CategoryTheory.PreGaloisCategory.FiberFunctor`, `PreGaloisCategory.functorToContAction`, `PreGaloisCategory.IsFundamentalGroup`, `PreGaloisCategory.IsConnected`, `PreGaloisCategory.has_decomp_connected_components`, `PreGaloisCategory.IsGalois`, `Aut` and the profinite topology on automorphisms of a functor to `FintypeCat`; `AlgHom.IsArithFrobAt`, `MonoidHom.eqLocus`, `zpowersHom`; `SeparableClosure`, `IsSepClosure`, `IsAlgClosure`, `HenselianLocalRing`, `IsLocalRing.ResidueField`, `ValuationSubring.inertiaSubgroup` (the kernel of `MulSemiringAction.toRingAut` on the decomposition subgroup), `Ideal.inertia`, `Ideal.Quotient.stabilizerHom_surjective`, `Ideal.Quotient.stabilizerHom_surjective_of_profinite`, `Ideal.Quotient.stabilizerQuotientInertiaEquiv`, `Ideal.card_inertia_eq_ramificationIdxIn`. Finite fields: `FiniteField.frobeniusAlgEquivOfAlgebraic`, `FiniteField.coe_frobeniusAlgEquivOfAlgebraic_iterate`, `Polynomial.SplittingField`, `FiniteField.isSplittingField_sub`, `Polynomial.IsSplittingField.algEquiv`. Pro-étale and adic: `Scheme.ProEt`, `Scheme.ProEt.topology`, `etale_le_weaklyEtale` and `MorphismProperty.Over.changeProp` (together the inclusion of `X.Etale` in `X.ProEt`), `Functor.sheafPushforwardContinuous`, `ModuleCat.uliftFunctor`, `AddCommGrpCat.uliftFunctor`, `sheafCompose`, `Scheme.ellAdicSheaf` (an `Ab.{u}`-valued sheaf), `Scheme.EllAdicCohomology` (the cohomology of its lift along `AddCommGrpCat.uliftFunctor.{u+1}`), `PadicAlgCl`, `AdicCompletion`, `ModObj`. Descent: `MorphismProperty.DescendsAlong` and its instance for `Etale` along flat surjective quasi-compact morphisms (`Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean`). Linear algebra: finite projective modules, matrices, `LinearMap.trace`, tensor products, `Submodule.IsLattice` (`Mathlib/Algebra/Module/Lattice.lean`), nonarchimedean local fields (`IsNonarchimedeanLocalField`). |
| Tau Ceti, pinned at `2fd255d997f47c0b5d834ee416c7015d55444ce5` | *Compactifications* (`TauCeti/AlgebraicGeometry/Compactification/`): the carrier `TauCeti.Compactification` and its morphisms (`Basic.lean`), `TauCeti.DenseCompactification`, `TauCeti.Compactification.identity`, `TauCeti.Compactification.isInitialIdentity`, `TauCeti.Compactification.isSeparated`, `TauCeti.Compactification.locallyOfFiniteType`, `TauCeti.Compactification.quasiCompact` and the instance `TauCeti.Compactification.Hom.proper`; `TauCeti.Compactification.baseChange` with `TauCeti.Compactification.baseChangeFunctor`, `TauCeti.Compactification.baseChangeFunctorIdIso`, `TauCeti.Compactification.baseChangeFunctorCompIso` and `TauCeti.Compactification.baseChange_isSchemeTheoreticallyDominant` (`BaseChange.lean`); `TauCeti.Compactification.denseReplacement`, `TauCeti.Compactification.denseReplacementMap`, `TauCeti.Compactification.denseReplacementAdjunction`, `TauCeti.Compactification.denseReplacementBaseChange` and `TauCeti.Compactification.isIso_denseReplacementBaseChange` (`DenseReplacement/Basic.lean`, `DenseReplacement/BaseChange.lean`); `TauCeti.Compactification.restrict`, `TauCeti.Compactification.prod`, `TauCeti.Compactification.precomp` (restriction along a quasi-compact open immersion of sources), `TauCeti.Compactification.sourceIsoEquivalence`, `TauCeti.Compactification.baseIsoEquivalence` (`Restrict.lean`, `Product.lean`, `SourceIso.lean`, `BaseIso.lean`); `TauCeti.Compactification.hom_unique` (`Uniqueness.lean`); `TauCeti.Compactification.commonRefinement`, `TauCeti.Compactification.commonRefinementFst`, `TauCeti.Compactification.commonRefinementSnd`, `TauCeti.Compactification.exists_forall_nonempty_hom` (`Refinement.lean`) and `TauCeti.Compactification.isIso_commonRefinementBaseChange` (`FlatRefinement.lean`); the cofiltered instances of `Cofiltered.lean`, which require `Nonempty (TauCeti.Compactification f)`; `TauCeti.Compactification.denseReplacement_dualNumber_section` and `TauCeti.Compactification.denseReplacement_specialFiber_empty`; and the comparison principle `CategoryTheory.Functor.cofilteredComparison` with `CategoryTheory.Functor.cofilteredComparison_refl`, `CategoryTheory.Functor.cofilteredComparison_trans`, `CategoryTheory.Functor.cofilteredComparison_symm` and `CategoryTheory.Functor.cofilteredComparison_hom_comp_app` (`TauCeti/CategoryTheory/Filtered/Comparison.lean`). *Blow-ups* (`TauCeti/AlgebraicGeometry/Blowup/`): `AlgebraicGeometry.Scheme.IdealSheafData.blowup` (`IdealSheaf.lean`), the strict-transform kernels `AlgebraicGeometry.Scheme.IdealSheafData.ker_blowupBaseChangeHom` and `AlgebraicGeometry.Scheme.IdealSheafData.ker_blowupMap` (`StrictTransform.lean`), extension from an open subscheme of a locally Noetherian scheme `AlgebraicGeometry.Scheme.IdealSheafData.exists_blowup_extension` (`Extension.lean`) and `AlgebraicGeometry.Scheme.IdealSheafData.isIso_blowupToBase_restrict_of_disjoint_support` (`Restriction.lean`). *Representations* (`TauCeti/RepresentationTheory/Continuous/`): `TauCeti.ContinuousRep` with `TauCeti.ContinuousRep.Iso`, `TauCeti.ContinuousRep.ofCharacter`, `TauCeti.ContinuousRep.nonempty_iso_ofCharacter_iff`, `TauCeti.ContinuousRep.baseChange`, `TauCeti.ContinuousRep.baseChangeSelfIso`, `TauCeti.ContinuousRep.baseChangeTransIso` and `TauCeti.ContinuousRep.baseChangeOfCharacterIso` (`ContinuousRep.lean`); `Subgroup.isCompact_closure_iff_exists_stable_lattice` and `TauCeti.ContinuousRep.exists_stable_lattice` (`StableLattice.lean`); `TauCeti.GaloisLattice.IntegralModel` with `TauCeti.GaloisLattice.IntegralModel.toContinuousRep`, its `MulAction Eˣ`, lattice and lattice-order instances, `TauCeti.GaloisLattice.IntegralModel.genericFiberIso`, `TauCeti.GaloisLattice.IntegralModel.nonempty` and `TauCeti.GaloisLattice.IntegralModel.exists_pow_le` (`IntegralModel.lean`); `Representation.baseChange` (`TauCeti/RepresentationTheory/BaseChange.lean`). *Traces* (`TauCeti/LinearAlgebra/Trace/Projective.lean`): `LinearMap.projectiveTrace`, `LinearMap.projectiveTrace_eq_trace`, `LinearMap.projectiveTrace_baseChange` and `LinearMap.projectiveTrace_cyclic` on finite projective modules over a commutative ring. *Finite étale schemes* (`TauCeti/AlgebraicGeometry/FiniteEtale/`): `TauCeti.FiniteEtaleScheme X` with its affine finite-étale-algebra anti-equivalence `TauCeti.FiniteEtaleScheme.finiteEtaleCommAlgCatOpEquivFiniteEtaleScheme` and separably closed field comparison `TauCeti.FiniteEtaleScheme.equivOfIsSepClosed` (`Basic.lean`); base change `TauCeti.FiniteEtaleScheme.pullback` with `TauCeti.FiniteEtaleScheme.pullbackId`, `TauCeti.FiniteEtaleScheme.pullbackComp`, the geometric fibre functor `TauCeti.FiniteEtaleScheme.fiber` and `TauCeti.FiniteEtaleScheme.pullbackCompFiberIso` (`Fiber.lean`); finite limits, finite coproducts, `Balanced`, `FinitaryExtensive`, direct summands of monomorphisms and `TauCeti.FiniteEtaleScheme.epi_iff_surjective` (`Limits.lean`); quotients by finite groups and the `PreGaloisCategory` instance over every base (`Quotient.lean`); exactness of base change and of the fibre functors (`Exactness.lean`); the `FiberFunctor` instance for preconnected and the `GaloisCategory` instance for connected bases, with `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso` (`Galois/Category.lean`); `TauCeti.FiniteEtaleScheme.isEmpty_fiber_iso_of_isClopen`, `TauCeti.FiniteEtaleScheme.nonempty_fiber_comp_iso`, `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso_of_mem_connectedComponent`, `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso_iff_mem_connectedComponent_of_isOpen` and `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso_iff_mem_connectedComponent` (`Galois/Component.lean`); `TauCeti.FiniteEtaleScheme.galoisEquivalence` (`Galois/Basic.lean`); `TauCeti.FiniteEtaleScheme.fiberIsoFiniteEtaleFiber`, `TauCeti.FiniteEtaleScheme.instIsFundamentalGroupFiber` and `TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber` (`Galois/FundamentalGroup.lean`). *Rational points over finite fields*: `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints` and `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints_pullback` (`TauCeti/AlgebraicGeometry/RationalPoint/Count.lean`), `AlgEquiv.fromSpecFixedFieldEquiv` and `AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard` (`RationalPoint/FixedField.lean`); `TauCeti.natCard_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow` and `TauCeti.finrank_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow` (`TauCeti/FieldTheory/Finite/SepClosedSubfield.lean`). *Lattices over a nonarchimedean local field* (`TauCeti/NumberTheory/LocalField/Lattice.lean`): `Submodule.IsLattice.isOpen`, `Submodule.IsLattice.isClosed`, `Submodule.IsLattice.isCompact`, `Submodule.IsLattice.isOpen_stabilizer` and `Submodule.IsLattice.isCompact_stabilizer`. *Descent* (`TauCeti/AlgebraicGeometry/Descent/`): `TauCeti.DescentDatum.descended`, `TauCeti.DescentDatum.isIso_toBaseChangeDescended_hom` and `TauCeti.DescentDatum.isPullback_toDescended` (`AffineMorphism.lean`: for an affine flat `p`, a descent datum on a scheme affine over the source of `p` is effective), and `AlgebraicGeometry.IsFinite.descendsAlong_surjective_inf_flat_inf_quasiCompact` (`MorphismProperty.lean`). *Strict henselization* (`TauCeti/RingTheory/StrictHenselization/`): `TauCeti.StrictHenselization.algebra` (`Algebra.lean`), `TauCeti.StrictHenselization.henselianLocalRing` (`Henselian.lean`) and `TauCeti.StrictHenselization.maximalIdeal_eq_map` (`MaximalIdeal.lean`). *Other*: `TauCeti.genericFiber` and `TauCeti.specialFiber` (`TauCeti/AlgebraicGeometry/Fibers.lean`); `TauCeti.Place.stabilizer_eq_decompositionSubgroup`, `TauCeti.Place.decompositionQuotientInertiaEquiv`, `TauCeti.Place.card_inertiaSubgroup`; `TauCeti.inertiaSubgroup`, `TauCeti.inertiaTameCharacter`, `TauCeti.inertiaPadicTameCharacter`, `TauCeti.coe_proj_inertiaTameCharacter_apply`; `CategoryTheory.Sheaf.Torsor` and `CategoryTheory.Sheaf.NonabelianH1`; existing affine blow-up charts and henselian roots of unity on their stated domains. |
| SchemeAndStackFoundations | Layer 0: §0.3 relative Proj, §0.8 étale coordinates, §0.9 limits/approximation, §§0.12–0.14 henselization, §0.21 excellence, §§0.23–0.23a universal homeomorphisms and their cover-preserving étale-site equivalences; §0.29 scheme Frobenius and its twists, iterates and base-change laws; §1.1 descent of sheaves along coverings (`sheaf_stack`); §§2.1–2.2 underlying abelian `D⁺` cohomology and Leray, §§2.5/2.7 derived and support foundations, §2.9 module sheaves and `muEtale`, §2.11 Hilbert 90 and Kummer, §2.15 continuity of étale cohomology along limits (`etale_cohomology_limits`), §2.16 Picard theory, §2.17 pro-étale repleteness, w-contractible covers and left completeness; §4.11 schematic strict transforms; Layer 5, especially §§5.3–5.5 projective bundles, Chern classes, normal bundles and deformation to the normal cone. |
| EnhancedDerivedSheaves | §§0.1–0.4: `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.tensorHom`, `ClassicalDerived.inverseLimits`, `ClassicalDerived.derivedCompletion`, `ClassicalDerived.functorCoherence` and coefficient-forgetting comparisons; E0–E1 supply enhancement foundations and comparisons, E2 replete-topos inverse limits, E4 derived completion. All geometric equivalences require their proved geometric hypotheses. |
| DerivedModuleAlgebra | §0.I.1 module replacements, §0.2 derived tensor, §1.1 coherent module limits, §§1.2–1.5 completeness, reflector, unit and Koszul/quotient-tower comparison, §1.T.1 tower `lim`/`lim¹`, ML and Milnor sequences, and §1.E.0 perfect module complexes, `DerivedDeRham.IsPerfect` with its alias `PerfectComplex.IsPerfect`, for §F.10.3. Quotient-tower completion retains bounded power-torsion or Noetherian hypotheses. EnhancedDerivedSheaves compares its sheaf constructions with these module inputs on the point site. |
| DGAInfinity | Layer 5 perfect/compact equivalence and finite semi-free retract description, specialized to the one-object DG category `R` in degree zero. |
| PadicMeasuresIwasawaAlgebras | §5.1 / `projectiveDeterminant`, `projectiveDeterminantMap` and their arbitrary-base-change API, including varying local rank. |
| StableReduction | Layer 4 Rees-algebra blow-ups, for the deformation to the normal bundle of §0.9 and the blow-up formula of §F.7. |
| ModularCurves | Layer 4D strict henselizations and their completions, in particular `isSepClosed_residueField_strictHenselization`, `isNoetherianRing_strictHenselization_iff`, `StrictHenselization.isDiscreteValuationRing_algebra` and `StrictHenselization.irreducible_algebraMap` for the strictly henselian traits of §F.3a. |
| AlgebraicCurves | Layers 8 and 12 normalization and the curve/place dictionary for decomposition and inertia groups. |
| BelyiMaps | Layers 12–13, including §§12.5–12.6, punctured-line finite covers used in §F.0.A0. |
| ProfiniteArithmetic | Layers 0–1 profinite integers, their units and continuous exponentiation. |
| GrothendieckEulerForms | Layer 2 triangulated `K₀` and Layer 5 Euler characteristics of bounded complexes, for the Euler characteristic in §F.6's Gauss–Bonnet formula. |
| PerfectoidSpaces | P5.10–P5.12 (qcqs étale 2-colimit and finite-stage detection) and P7.15 (étale-topos comparison for tilde-limits) only when instantiating §0.5's conditional analytic statement. The scheme descent theorem uses SchemeAndStackFoundations §0.9/§2.15. |

The scheme Frobenius contract is supplied by SchemeAndStackFoundations §0.29: `SchemeFrobenius.absoluteFrobenius`, `SchemeFrobenius.schemeFrobeniusTwist`, `SchemeFrobenius.relativeFrobenius`, `SchemeFrobenius.iteratedSchemeFrobenius` and `SchemeFrobenius.qPowerFrobenius`. A `p`-power map need not be `k`-linear; over finite `k` of cardinality `q` the `q`-power map is over `k`. Sections F.10.1–F.10.2b own its separate field-descent and cohomological comparison.

## How to read the build

The sections occur in prerequisite order and keep their labels, which other roadmaps cite. §§G.1–G.3 fix the compactification geometry: Tau Ceti supplies the carrier, dense replacement, refinements and the comparison principle, and §G.2 proves Nagata's theorem. §§F.0.1–F.0.A2 build constructible sheaves and geometric points, the fundamental groupoid and lisse monodromy on Tau Ceti's finite étale Galois categories, Tate twists, topological invariance, decomposition and inertia, the multiplicative group, the arithmetic exact sequence and the Weil group. §§0.5–0.7 and F.1 give coefficient descent, the bounded constructible derived categories, supports and the pseudofunctorial inverse and direct images. §§F.2.1–F.2.3 prove proper and smooth base change and local acyclicity; §0.8 defines the canonical lower shriek, which §§F.2.4–F.2.5 study; §F.3.0 bounds the cohomological dimension before §F.2.6 uses it for Künneth, and §F.2.7 follows the finiteness theorems of §F.3. §F.3a treats henselian traits. §§F.4.0–F.4.6, with §§F.10.1–F.10.2 placed among them and §F.10.2b after them, build stable lattices, normalized adic systems, the classical and pro-étale realizations and their comparison, and the Frobenius comparisons; §§0.9–0.11 and F.5–F.8 give cycle classes, purity, duality, the projective-bundle and blow-up formulas, weak Lefschetz and perverse `t`-structures. §§F.10.3–F.10.5 are the trace algebra and the torsor coefficient descent used by trace formulas. The labels F.2 and F.10 group interfaces whose proofs are interleaved with their algebraic support and realization inputs. Among the roadmap suppliers, §F.10.3 depends on EnhancedDerivedSheaves §§0.1–0.4 for the enhancement, DerivedModuleAlgebra §§0.2 and 1.E.0 for module-derived tensor and perfectness, DGAInfinity Layer 5 for the perfect/compact comparison and PadicMeasuresIwasawaAlgebras §5.1 for finite-projective determinants; PerfectoidSpaces P5.10–P5.12 and P7.15 enter only §0.5's conditional analytic instantiation.

## G.1 Scheme compactification objects

The compactification objects are Tau Ceti's (supplier table); this section fixes how the roadmap
uses them. For `f : X ⟶ S`, `TauCeti.Compactification f` is the full subcategory of Mathlib's
`CategoryTheory.Factorisation f` on the factorizations `f = j ≫ p` with `j` a quasi-compact open
immersion and `p` proper, as in Stacks §38.32 (tag 0ATT): density is not required, and no
hypothesis on `S` enters the definition. A morphism fixes `X` and lies over `S`.
`TauCeti.DenseCompactification f` is the full subcategory on which `j` is scheme-theoretically
dominant (Mathlib's `IsSchemeTheoreticallyDominant`), a condition that keeps the nilpotents of `X`.
The roadmap uses the identity compactification of a proper morphism, base change along any
`T ⟶ S`, dense replacement by the scheme-theoretic image of `j` with its comparison to base change
(an isomorphism for flat base change), restriction over opens of `S`, products over `S`, transport
along isomorphisms of source and base, and the dual-number and special-fibre computations, all
with the Tau Ceti declarations named in the supplier table.

A morphism `f` is *compactifiable* when `Nonempty (TauCeti.Compactification f)`. Tau Ceti shows
that a compactifiable morphism is separated, locally of finite type and quasi-compact
(`TauCeti.Compactification.isSeparated`, `TauCeti.Compactification.locallyOfFiniteType`,
`TauCeti.Compactification.quasiCompact`). Lower shriek, compact-support cohomology, exceptional
inverse image and dualizing complexes (§§0.8, F.2.4–F.2.5, F.5) take
`[Nonempty (TauCeti.Compactification f)]` as an instance argument and never take a
compactification as an argument; independence of the compactification is a theorem about the
canonical functor, not a property of a chosen one. *Needs:* Tau Ceti
`TauCeti.AlgebraicGeometry.Compactification` (supplier table).

## G.2 Nagata compactification over a qcqs base

**Nagata compactification over a qcqs base — `nagataCompactification`.**
For every qcqs scheme `S` and separated finite-type `f : X → S`, prove
`Nonempty (TauCeti.Compactification f)`; Tau Ceti's dense replacement then gives a dense
compactification, and Tau Ceti's `Cofiltered.lean` makes `TauCeti.DenseCompactification f` a
cofiltered category. No Noetherian, field, finite-presentation or complex-base hypothesis is added
to this theorem. Compactifiability is stable under arbitrary base change through
`TauCeti.Compactification.baseChange`, and, over a qcqs base, under composition, by this theorem.

Build the geometric steps of the Noetherian proof on Tau Ceti's blow-ups along ideal sheaves
(`AlgebraicGeometry.Scheme.IdealSheafData.blowup`), their strict transforms
(`AlgebraicGeometry.Scheme.IdealSheafData.ker_blowupMap`) and their extension from an open
subscheme of a locally Noetherian scheme
(`AlgebraicGeometry.Scheme.IdealSheafData.exists_blowup_extension`): composition of admissible
blowups, separation of the closures of disjoint constructible closed subsets by an admissible
blowup, and gluing across a dense common open after blowups. Establish enlargement of a
compactified dense open and the two-open compactifiability step. A finite affine cover with dense
total intersection reduces existence to affine embeddings and schematic closures in projective
space. For a qcqs base, first embed `X` as a closed subscheme of a separated finitely presented
`X' → S`, descend `X'` and separatedness through a Noetherian approximation of `S`, compactify at
that stage, and pull back. The schematic closure of `X` then supplies the compactification of the
original finite-type morphism; finite type must not be replaced by finite presentation.

*Source:* Stacks, §38.33, Lemmas 38.33.1–38.33.7 and Theorem 38.33.8
([0F41](https://stacks.math.columbia.edu/tag/0F41)); the reduction uses Limits,
Propositions 32.9.6 and 32.5.4, Lemmas 32.10.1 and 32.8.6.
*Needs:* §G.1; SchemeAndStackFoundations §0.9 (limits and approximation), scheme images and
gluing; Tau Ceti's blow-up declarations named above.

**Checks.**

- A proper morphism is compactifiable through `TauCeti.Compactification.identity`, without Nagata's
  theorem.
- `A¹_k → Spec k` admits `A¹_k ⊂ P¹_k` over any field `k` (Tau Ceti's
  `TauCeti.AlgebraicGeometry.projectiveLine.denseCompactification`); the open immersion of a
  nonproper morphism is not surjective, and here its boundary is the point `∞`.
- The affine line with doubled origin over a field is of finite type but not separated, hence not
  compactifiable: an open immersion followed by a proper map is separated.
- Pulling the compactifiable `A¹_k → Spec k` back to `Spec k[t]` gives the compactifiable
  `A¹_(k[t]) → Spec k[t]`, through the base change of `A¹ ⊂ P¹`.
- The disjoint union of countably many copies of `Spec k` over itself is separated and locally of
  finite type but not quasi-compact, so it is excluded; it has no compactification, since a
  compactifiable morphism is quasi-compact.

## G.3 Common refinements and coherent comparison

The refinement geometry is Tau Ceti's (supplier table). For compactifications `C₁`, `C₂` of `f`,
`TauCeti.Compactification.commonRefinement C₁ C₂` is the scheme-theoretic closure of `X` in
`C₁.Xbar ×_S C₂.Xbar`, a dense compactification with maps to both; every morphism of
compactifications is proper; two maps out of a dense compactification into any compactification
agree (`TauCeti.Compactification.hom_unique`, Stacks §29.7); finite families have a common
refinement; flat base change preserves the common refinement; and both
`TauCeti.Compactification f` and `TauCeti.DenseCompactification f` are cofiltered as soon as they
are nonempty (Stacks Lemma 38.32.1, tag 0ATU). The categorical comparison principle is Tau Ceti's
`CategoryTheory.Functor.cofilteredComparison`: a functor out of a cofiltered category that sends
every arrow to an isomorphism has canonical comparison isomorphisms between any two values,
computed through any common refinement, with the identity, inverse, cocycle and base-change laws.
Coherent and étale consumers construct their own coefficient functors and discharge its
hypotheses (Stacks §63.9, Lemma 63.9.1); §0.8 applies it to lower shriek. *Needs:* Tau Ceti
`TauCeti.AlgebraicGeometry.Compactification` and `TauCeti.CategoryTheory.Filtered.Comparison`
(supplier table).

## F.0.1 Finite and constructible étale module sheaves

**Finite and constructible étale module sheaves.** VanishingCycles.constructibleEtale.
Use the Conventions carrier `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` with `Λ : Type u`,
whose essentially small model is `Scheme.AffineEtale` through `Scheme.AffineEtale.sheafEquiv`.
The geometric stalk at `x : Spec (.of Ω) ⟶ X`, `Ω` separably closed, is
`(Scheme.pointSmallEtale x).sheafFiber`. Its exactness and conservativity are Mathlib's instances
for `GrothendieckTopology.Point.sheafFiber`, `AlgebraicGeometry.Scheme.isConservative_pointSmallEtale` and
`GrothendieckTopology.HasEnoughPoints`, used as they stand and not restated. Build the module
structure of stalks, the tensor/coefficient comparison, and stalk naturality under pullback: for
`f : X ⟶ Y` the stalk of `f^*F` at `x` is the stalk of `F` at `x ≫ f`, through Mathlib's
`GrothendieckTopology.Point.comap` and `GrothendieckTopology.Point.sheafFiberComapIso` for the
base-change functor of small étale sites and the identification of the comapped point with
`Scheme.pointSmallEtale (x ≫ f)`.
Integer invertibility is Scheme.IsInvertibleOn N X; prove its stalkwise, affine,
residue-characteristic and `ℤ[1/N]`-factorization criteria, together with pullback/restriction
and divisor stability. Finite lisse means locally constant (below) with finite module fibres. Build
the constructible stratifications below, their common refinements and the qcqs global versus
affine-local characterization. Prove pullback and étale descent, support
and restriction, open–closed gluing, quasi-compact extension by zero, coefficient change,
and closure under finite limits, colimits, extensions and tensor products. Internal Hom
and dual statements retain finite-projective stalk hypotheses where required. These
constructions do not require `N` invertible. (SGA 4 IX §§2–3; Stacks §§59.64–59.65, 59.71–59.74.)
*Needs:* SchemeAndStackFoundations §1.1 (`sheaf_stack`, for étale descent of sheaves), §§2.1, 2.9;
Mathlib module sheaves, geometric points and the small affine étale-site equivalence.

**Checks.**

- Over a separably closed point the finite coefficient category is finite `Λ`-modules.
- On `Spec ℝ`, the quadratic character yields a nonconstant rank-one `ℤ/3` local system.
- Affine-local stratifications on infinitely many components do not by themselves provide
  a single global finite stratification.

**Locally constant sheaves and constructible stratifications.** On any site `(C, J)` with
coefficient category `A`, define the class Sheaf.IsLocallyConstant J F: every object has a
covering sieve on each of whose members the restriction of `F` satisfies Mathlib's
`Sheaf.IsConstant` (Stacks 093Q). For `Λ`-module sheaves, the class
Sheaf.IsLocallyConstantOfFiniteType adds that the constant values are finitely generated
`Λ`-modules; finite lisse sheaves are those with finite values. Sets, abelian groups and
`Λ`-modules are instances of the one definition. For an open `U` of a scheme `X`, define the
structure ConstructibleStratification X U: finitely many immersions into `X` with pairwise
disjoint images covering `U`, each image a constructible subset of `U` in Mathlib's
`Topology.IsConstructible` sense. For Noetherian `Λ` define the object property
constructibleSheaf X Λ: every affine open `U` of `X` admits a constructible stratification on
whose pieces the pullback of `F` is locally constant of finite type (Stacks 03RW). This
affine-local form is the definition. Prove constructibleSheaf_iff_exists_global: when `X` is
quasi-compact and quasi-separated, `F` is constructible exactly when one finite stratification
of `X` works globally (Stacks 095E, 09YR); a scheme with Noetherian underlying space is such a
scheme. Prove stability under pullback,
refinement of stratifications, and agreement of the affine-local form with the
VanishingCycles.constructibleEtale statements above. No Noetherian hypothesis on `X` enters
the definition. *Needs:* Mathlib `Sheaf.IsConstant`, `Topology.IsConstructible`, scheme
immersions and affine opens; the carrier above.

**Checks.**

- The skyscraper `i_*Λ` at the origin of `𝔸¹_k`, `Λ ≠ 0`, is constructible through the
  stratification `{0} ⊔ (𝔸¹ ∖ {0})` and is not locally constant.
- For `j : 𝔾_m → 𝔸¹`, `j_!Λ` is constructible and not locally constant: its stalk at `0`
  is zero and its other stalks are `Λ`.
- Over an infinite field `k`, the sum of skyscrapers `Λ` at all `k`-points of `𝔸¹_k` has
  every stalk finite but is not constructible: on every dense open it is nonzero at
  infinitely many closed points and zero at the generic point.
- On `X = Spec k[x₁, x₂, …]`, quasi-compact and quasi-separated with non-Noetherian underlying
  space, the skyscraper `Λ ≠ 0` at the closed point `𝔪 = (x₁, x₂, …)` has finite stalks but is
  constructible in neither the affine-local nor the global form: its support `{𝔪}` is closed
  with complement `⋃ D(xᵢ)` not quasi-compact, so it is not a constructible subset. A
  characterization stated only for Noetherian spaces says nothing here.

**Constructible sheaves form a weak Serre class.** A weak Serre class of an abelian category
(Stacks 02MO) is an `ObjectProperty` that contains zero and is closed under isomorphisms, kernels,
cokernels and extensions; each clause is a Mathlib class, `ObjectProperty.ContainsZero`,
`ObjectProperty.IsClosedUnderIsomorphisms`, `ObjectProperty.IsClosedUnderKernels`,
`ObjectProperty.IsClosedUnderCokernels` and `ObjectProperty.IsClosedUnderExtensions`, and no class
bundling them is defined here. Mathlib's `ObjectProperty.IsSerreClass` provides all five. For
Noetherian `Λ`, prove these five instances for constructibleSheaf X Λ in
`Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` (Stacks 03RZ (3)), the input of §F.1's
triangulated `Dᵇ_c`. *Needs:* the stratifications above; Mathlib's abelian structure on the
carrier and the five closure classes.

**Checks.**

- Multiplication by `ℓ` on the constant sheaf `ℤ/ℓ²` has kernel and cokernel the constant
  `ℤ/ℓ`, both constructible.
- For `j : 𝔾_m → 𝔸¹` and `i` the origin, the extension `0 → j_!Λ → Λ → i_*Λ → 0` has all
  three terms constructible.
- The zero sheaf is constructible on every scheme, including the empty one.

**Geometric points and their functoriality.** Define the category GeometricPoint S of geometric
points of a scheme `S`: an object is a separably closed field `Ω : Type u` with a morphism
`Spec (.of Ω) ⟶ S`, and a morphism from `(Ω₁, s₁)` to `(Ω₂, s₂)` is a morphism
`φ : Spec (.of Ω₁) ⟶ Spec (.of Ω₂)` with `φ ≫ s₂ = s₁` (Stacks 04FN). Define the covariant
functor toPointFunctor from GeometricPoint S to Mathlib's category of points
`GrothendieckTopology.Point` of `Scheme.smallEtaleTopology S`, sending a geometric point `s` to
`Scheme.pointSmallEtale` of its morphism. The direction is Mathlib's: a morphism of points
`Φ₁ ⟶ Φ₂` is a natural transformation `Φ₂.fiber ⟶ Φ₁.fiber`, the fibre of
`Scheme.pointSmallEtale s` at an étale `U → S` is the set of lifts of `s` to `U`, and `φ` sends a
lift `u` of `s₂` to the lift `φ ≫ u` of `s₁`. The stalk at `s` is `sheafFiber` of that point; it
is contravariant in the geometric point, `φ` inducing the map of stalks at `s₂` to stalks at `s₁`
given on germs by `u ↦ φ ≫ u`. Define ofPoint x for a point `x : S` as `Spec` of
`SeparableClosure (S.residueField x)` with its canonical morphism; these points cover `S`, so they
form a conservative family by Mathlib's `AlgebraicGeometry.Scheme.isConservative_pointSmallEtale`,
which is the conservativity statement here. Prove isIso_toPoint_map: every morphism of geometric
points induces an isomorphism of points, so stalks do not change under extension of the separably
closed field; algebraically closed points give the same stalks. The automorphisms of a geometric
point `s` act on every stalk at `s` through toPointFunctor, naturally in the sheaf. For ofPoint x
they are the `Spec σ` for `σ ∈ Gal(κ(x)^sep/κ(x))`; since `Spec σ ≫ Spec τ = Spec (σ ∘ τ)`,
letting `σ` act by the stalk map of `Spec σ` is a left action, the natural Galois action: on the
stalk of a finite étale `V` it sends the point with coordinate map `v` to the point with
coordinate map `σ ∘ v`. For a rational point `a` of a scheme over a finite field `k` and the
geometric point given by an algebraic closure `k̄`, define the stalk Frobenius at `a` as the action
of `Spec Φ`, where `Φ` is the geometric Frobenius, the inverse of
`FiniteField.frobeniusAlgEquivOfAlgebraic` of `k̄` over `k` (Stacks, Definition 64.3.10, tag 03SW:
the action of the inverse of arithmetic Frobenius on the stalk). The arithmetic automorphism
`Spec` of `FiniteField.frobeniusAlgEquivOfAlgebraic` acts by the inverse of the stalk Frobenius.
This is the only stalk Frobenius: the cohomological Frobenius comparisons of §§F.10.2–F.10.2b and
the Weil-sheaf structures built downstream use it, and no separate stalk functor for Frobenius
structures is defined. (Stacks 03PO, 04FN, 03SW.) *Needs:* Mathlib `Scheme.pointSmallEtale`,
`GrothendieckTopology.Point` and its category, `SeparableClosure`,
`FiniteField.frobeniusAlgEquivOfAlgebraic`.

**Checks.**

- For `S = Spec k` with `k` separably closed, the stalk at the identity point is the module of
  global sections.
- For `S = Spec ℝ` and the geometric point `Spec ℂ`, the automorphism group is `Gal(ℂ/ℝ)`, acting
  by `−1` on the stalk of the nonconstant rank-one `ℤ/3` local system of the Checks above.
- For the finite étale `Spec 𝔽_(p²) → Spec 𝔽_p` viewed as a sheaf of sets, the stalk at the
  geometric point `Spec 𝔽̄_p` has two elements and the Frobenius at the rational point exchanges
  them; an involution cannot distinguish the stalk Frobenius from its inverse.
- On `μ_5` over `Spec 𝔽_2`, the stalk at the geometric point `Spec 𝔽̄_2` of the rational point is
  `μ_5(𝔽̄_2)`, and the stalk Frobenius is `ζ ↦ ζ³`, since geometric Frobenius is the inverse of
  `x ↦ x²` and `2 · 3 ≡ 1 mod 5`. A definition through the arithmetic automorphism would give
  `ζ ↦ ζ²`; this is the value that §F.0.A2's Frobenius class and §F.10.2's comparison with
  Stacks 03SW recompute.
- For `k = 𝔽_p(t)`, the morphism from `Spec` of an algebraic closure to `Spec` of the separable
  closure is a morphism of geometric points that is not an isomorphism of fields; it induces an
  isomorphism of stalks.

## F.0.2 Finite étale Galois categories and the étale fundamental groupoid

**Finite étale Galois categories and the étale fundamental groupoid.**
VanishingCycles.finiteEtaleGaloisCategory. For any scheme `X` the carrier is Tau Ceti's
`TauCeti.FiniteEtaleScheme X`, the finite étale full subcategory of `Over X`, with the package of
the supplier table, consumed as it stands and not restated: the affine finite-étale-algebra
anti-equivalence and the separably closed field comparison; base change
`TauCeti.FiniteEtaleScheme.pullback` with its identity and composition isomorphisms; finite
limits, finite coproducts, direct summands and quotients by finite groups over every base, which
make `TauCeti.FiniteEtaleScheme X` a `CategoryTheory.PreGaloisCategory`; exactness of base change
and of the geometric fibre functor `TauCeti.FiniteEtaleScheme.fiber x` at
`x : Spec (.of Ω) ⟶ X`, `Ω` separably closed; the `CategoryTheory.PreGaloisCategory.FiberFunctor`
instance for preconnected `X` and the `CategoryTheory.GaloisCategory` instance for connected `X`;
the identification `TauCeti.FiniteEtaleScheme.pullbackCompFiberIso` of the fibre at `x` of a base
change along `f` with the fibre at `x ≫ f`; and étale paths, which exist between any two
geometric points of one connected component
(`TauCeti.FiniteEtaleScheme.nonempty_fiber_iso_of_mem_connectedComponent`) and, when components
are open, only there (`TauCeti.FiniteEtaleScheme.nonempty_fiber_iso_iff_mem_connectedComponent_of_isOpen`).
Connected components, Galois objects and deck transformations are Mathlib's Galois-category API
(`PreGaloisCategory.IsConnected`, `PreGaloisCategory.has_decomp_connected_components`,
`PreGaloisCategory.IsGalois`, automorphisms of objects) applied to these instances.

This section adds what the pinned libraries lack. Prove that finite étale covers and their
morphisms satisfy effective descent along étale coverings: over each affine open of the base,
refine the covering to finitely many affines, whose disjoint union maps to that open by an
affine, flat and surjective morphism; Tau Ceti's descent of schemes affine over the source of
an affine flat morphism (`TauCeti.DescentDatum.descended`,
`TauCeti.DescentDatum.isIso_toBaseChangeDescended_hom`) descends the cover,
`AlgebraicGeometry.IsFinite.descendsAlong_surjective_inf_flat_inf_quasiCompact` and Mathlib's descent of étaleness
along flat surjective quasi-compact morphisms keep it finite étale, and the descended pieces glue
over the affine opens (Stacks 0245, 02LA, 02VN). Prove that they descend along limits of qcqs
schemes with affine transition maps (Stacks 01ZM, 01ZO, 07RP). Define `π₁` as
`EtaleFundamentalGroup x` (below) and paths as EtalePath x y, isomorphisms of geometric fibre
functors; neither definition assumes connectedness. Prove that `EtaleFundamentalGroup x` and
`EtaleFundamentalGroup y` act on EtalePath x y by composition of isomorphisms on the side of `x`
and of `y` respectively, each simply transitively when the path set is nonempty, and that
conjugation by a path `γ` is an isomorphism of topological groups from the first group to the
second. VanishingCycles.lisseMonodromyEquiv is an equivalence of categories, given as `≌`
data, between finite lisse `Λ`-modules and continuous finite `π₁`-module actions on connected `X`,
obtained by transporting module objects along Mathlib's `PreGaloisCategory.functorToContAction`
for Tau Ceti's fibre functor. No statement asserts such an equivalence inside `∃`. A chosen path
gives tensor/dual transport and basepoint conjugation. For disconnected `X` use the groupoid of
geometric fibre functors, with no global choice of basepoints; the connected-component
description applies when components are open. Retain VanishingCycles.fieldSheavesEquiv for all
sheaves on a field and continuous discrete Galois modules, also as `≌` data transported along
Tau Ceti's `TauCeti.FiniteEtaleScheme.galoisEquivalence` and Mathlib's
`PreGaloisCategory.functorToContAction`. No coefficient invertibility is required. (SGA 1 V
§§4–7; SGA 4 VIII §2; Stacks 58.6.2, tag 0BND.) *Needs:* §F.0.1 constructibleEtale;
SchemeAndStackFoundations §0.9 (`finite_presentation_limits`, for descent along limits); Mathlib
Galois categories and flat descent of étaleness; Tau Ceti's finite étale package and its descent
of affine morphisms and of finiteness (supplier table).

**Checks.**

- On `Spec ℝ` with the geometric point `Spec ℂ`, lisseMonodromyEquiv sends the nonconstant
  rank-one `ℤ/3` local system of §F.0.1's Checks to `ℤ/3` with complex conjugation acting by `−1`,
  and the constant sheaf to the trivial action; a construction that forgot the action would
  identify the two.
- For `X = Spec 𝔽_p` and `x = y` the point `Spec 𝔽̄_p`, EtalePath x x is the underlying set of
  `EtaleFundamentalGroup x ≅ Gal(𝔽̄_p/𝔽_p)`, the profinite completion of `ℤ`, and both actions are
  simply transitive; a definition of paths as isomorphisms of the separably closed fields would
  instead give the set `Aut(𝔽̄_p)`, on which `Gal(𝔽̄_p/𝔽_p)` acts by composition with the same
  result here but which is empty for `Spec 𝔽̄_p` and `Spec Ω`, `Ω` an algebraic closure of
  `𝔽_p(t)`, between which the fibre functors are isomorphic.
- On a separably closed point the monodromy equivalence is the identity of finite `Λ`-modules,
  the fundamental group being trivial.
- `Spec(k[x₁,x₂,…])` has the based finite-cover and path API despite not being locally Noetherian; finite étale covers and their maps over qcqs schemes descend through affine approximation (Stacks 01ZM, 07RP).

**The canonical fundamental group — `EtaleFundamentalGroup`, EtalePath.** For every scheme `S`
and geometric point `x : Spec (.of Ω) ⟶ S`, `EtaleFundamentalGroup x` is
`Aut (TauCeti.FiniteEtaleScheme.fiber x)`, with Mathlib's profinite topology on automorphisms of a
functor to `FintypeCat` (compact, Hausdorff, totally disconnected, a topological group). It lives
in universe `u+1`; prove EtaleFundamentalGroup.small, an instance `Small.{u}` of it, from the
essential smallness of the finite étale covers of `S` (instance search does not find it from the
definition). Downstream theorems are stated for any profinite `G` with
`[PreGaloisCategory.IsFundamentalGroup (fiber x) G]`, so that a Galois group or a chosen small
model can be used without transport. EtalePath x y is `fiber x ≅ fiber y`. For a morphism
`f : T ⟶ S` and a geometric point `x` of `T`, `EtaleFundamentalGroup.map f x` is the
homomorphism from `EtaleFundamentalGroup x` to `EtaleFundamentalGroup (x ≫ f)` that whiskers an
automorphism of the fibre functor by `TauCeti.FiniteEtaleScheme.pullback f` and transports it
along `TauCeti.FiniteEtaleScheme.pullbackCompFiberIso f x`; for a path `γ` from `x ≫ f` to a
geometric point `y` of `S`, composing with conjugation by `γ` gives the map to
`EtaleFundamentalGroup y`. Prove that `EtaleFundamentalGroup.map f x` is continuous, that it is
functorial in `f` (the identity of `S` gives the identity, a composite gives the composite through
`TauCeti.FiniteEtaleScheme.pullbackComp`), that composing paths composes the path versions, that
changing the path conjugates, and that for a morphism of spectra of fields it is the restriction
map of absolute Galois groups under Tau Ceti's
`TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber`. (SGA 1 V §§5–7; Stacks 0BMY, 0BND.)
*Needs:* the carrier and fibre functor above; Mathlib's topology on automorphisms of a fibre
functor and `PreGaloisCategory.IsFundamentalGroup`.

**Checks.**

- For a field `K` with separable closure `Ω`, `EtaleFundamentalGroup` of the point
  `Spec Ω → Spec K` is `Gal(Ω/K)` as a topological group, through
  `TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber`.
- For `S = S₁ ⊔ S₂` with `x` in `S₁`, the definition applies without a connectedness
  hypothesis, and `EtaleFundamentalGroup.map` along the inclusion of `S₁` is an isomorphism:
  covers of `S` restrict to covers of `S₁`, and every cover of `S₁` extends by the empty cover of
  `S₂`.
- Changing the path from `x ≫ f` to `y` by a loop `γ` at `y` conjugates the path version of
  `EtaleFundamentalGroup.map` by `γ`.
- For `f : Spec 𝔽_(p²) → Spec 𝔽_p` and the geometric point `Spec 𝔽̄_p`, `EtaleFundamentalGroup.map`
  is the inclusion of `Gal(𝔽̄_p/𝔽_(p²))` as the index-two subgroup of `Gal(𝔽̄_p/𝔽_p)`: injective,
  with image the stabilizer of the point of the fibre of the cover `f` through which the geometric
  point factors, so not surjective.

## F.0.3 Finite Tate twists on the canonical roots-of-unity sheaf

**Finite Tate twists on the canonical roots-of-unity sheaf.** VanishingCycles.etaleTateTwists.
For every scheme `X` and every finite commutative `Λ`, put `n = ringChar Λ` and define
`Λ(1) = Λ ⊗_(ℤ/n) μ_n` from SchemeAndStackFoundations' `muEtale`. Define the tensor powers
`Λ(m)`, `m ≥ 0`, the dual powers `Λ(−m) = ℋom(Λ(m), Λ)` and the twist `K ↦ K ⊗ Λ(m)` on
`D(X,Λ)` for every integer `m`. These definitions carry no hypothesis; the twist is this sheaf,
and no class of twist data is introduced. Under Scheme.IsInvertibleOn n X prove that `Λ(1)` is
finite lisse and invertible of rank one, twist addition `Λ(a) ⊗ Λ(b) ≅ Λ(a+b)`, independence of
`n`: for every `N` with `NΛ = 0` and Scheme.IsInvertibleOn N X the sheaf `Λ ⊗_(ℤ/N) μ_N` is
canonically `Λ(1)`, and the pullback/tensor/dual identities and all coefficient reductions,
using the Kummer sequence of SchemeAndStackFoundations §2.11. A primitive root over a
separably closed field gives a coordinate, whose change is multiplication by a unit. Integral
twists are systems realized in F.4. (Stacks 03PL; SGA 4 IX.) *Needs:* §F.0.1 constructibleEtale;
SchemeAndStackFoundations §§2.9, 2.11; Kummer remains that roadmap's theorem.

**Checks.**

- With `Λ = ℤ/ℓ`, `Λ(1)` is `μ_ℓ`.
- Replacing `ζ` by `ζᵘ` multiplies the parametrization by `u` and the coordinate of a fixed element by `u⁻¹`.
- Arithmetic `q`-Frobenius acts on `μ_(ℓⁿ)` by `q` and geometric Frobenius by `q⁻¹`.
- On `Spec 𝔽_p` with `Λ = ℤ/p`, `Λ(1)` is defined and is zero, since `μ_p` is trivial on
  separably closed fields of characteristic `p`; the invertibility theorems do not apply.
- With `Λ = ℤ/12` and `N = 24`, `Λ ⊗_(ℤ/24) μ_24` is canonically `Λ ⊗_(ℤ/12) μ_12` when `6` is
  invertible on `X`.

**Rank-one lisse sheaves from torsors and characters.** For a finite group `G`, a `G`-torsor `P`
on `X_et` (Tau Ceti's `CategoryTheory.Sheaf.Torsor` under the constant sheaf of groups `G`, a
finite étale Galois cover with group `G` by §F.0.2) and a character `χ : G →* Λˣ`, define the
contracted product `P ×^G Λ(χ)`: the sheaf of `Λ`-modules whose sections are the
`G`-equivariant maps from `P` to `Λ` twisted by `χ`. Prove that it is finite lisse of rank one;
that under VanishingCycles.lisseMonodromyEquiv its monodromy is `χ` composed with the
classifying map of `P` from `π₁` to `G`; tensor compatibility
`P ×^G Λ(χ) ⊗ P ×^G Λ(χ′) ≅ P ×^G Λ(χχ′)`; functoriality along a homomorphism `G → G′` with the
pushed-out torsor; pullback compatibility; and that isomorphic torsors and equal characters give
isomorphic sheaves, through Tau Ceti's `CategoryTheory.Sheaf.NonabelianH1`. No invertibility of
`|G|` or of `ringChar Λ` is assumed. FourierDeligneTransform, a downstream consumer, applies this
construction to Lang torsors to obtain the Artin–Schreier and Kummer sheaves, which belong to it.
(SGA 4½ [Sommes trig.] §1.) *Needs:* §F.0.2 finite étale torsors and
VanishingCycles.lisseMonodromyEquiv; Tau Ceti `CategoryTheory.Sheaf.Torsor`.

**Checks.**

- The trivial torsor gives the constant sheaf `Λ` for every character.
- The trivial character gives the constant sheaf `Λ` for every torsor.
- For the `C₂`-torsor `Spec ℂ → Spec ℝ` and the sign character into `(ℤ/3)ˣ`, the result is the
  nonconstant rank-one `ℤ/3` local system of §F.0.1's Checks.

## F.0.4 Étale topological invariance

**Scheme Frobenius interfaces.** Consume SchemeAndStackFoundations §0.29's
`SchemeFrobenius.absoluteFrobenius`, `SchemeFrobenius.schemeFrobeniusTwist`,
`SchemeFrobenius.relativeFrobenius`, `SchemeFrobenius.iteratedSchemeFrobenius` and
`SchemeFrobenius.qPowerFrobenius`, with their characteristic-`p` hypotheses, specified twists,
universal-homeomorphism properties and coherent composition/base-change laws. Sections
F.10.1–F.10.2b construct their field-descent and cohomological comparisons.

*Source:* Stacks §33.36, Definitions 33.36.1 and 33.36.4, Lemmas 33.36.2–33.36.6,
Remark 33.36.11 (03SM, 0CC9, 0CC7, 0CC8, 0CCA, 0CCB, 0CCG).
*Needs:* SchemeAndStackFoundations §0.29.

**Checks.**

- Absolute `p`-Frobenius on `Spec 𝔽_(p²)` is not over `𝔽_(p²)`; its square is.
- Relative Frobenius on `𝔸¹_k` has codomain the specified twist; over `k=𝔽_q` the `q`-power map sends `T` to `T^q` and fixes `k`.
- Base-changing that `q`-power map to `k̄` fixes its scalars; absolute `q`-Frobenius on the base-changed scheme also raises those scalars to `q`-th powers and is a different map.

**Étale topological invariance.** VanishingCycles.universalHomeomorphismEtaleEquivalence.
For every universal homeomorphism `f:X→Y` consume SchemeAndStackFoundations §0.23a's
`universalHomeomorphismEtaleEquivalence`: the cover-preserving base-change equivalence
`Y_et ≃ X_et`, with identity, composition and base-change coherence. Transport sheaves for
every target category satisfying Mathlib's sheaf assumptions through Mathlib's
`Functor.IsDenseSubsite.sheafEquiv` for this equivalence of sites. Include constants, module
coefficients, stalks and sections, with the induced coherence and no Noetherian, finite-type or
invertibility restriction. Cohomology is not transported by a construction of its own: the
invariance of `Sheaf.H` under `Functor.IsDenseSubsite.sheafEquiv` is SchemeAndStackFoundations
§2.1's `Sheaf.H.pullback` for the underlying morphism of sites, an isomorphism for such a
functor (Stacks 03YU), and it is applied here to §0.23a's equivalence. Apply this to the
absolute and relative scheme Frobenius of SchemeAndStackFoundations §0.29.
Prove that the equivalence restricts to an equivalence from `TauCeti.FiniteEtaleScheme Y` to
`TauCeti.FiniteEtaleScheme X`, compatible with the geometric fibre functors of §F.0.2: an étale
`V → Y` is finite exactly when its base change `V ×_Y X → X` is, because `f` is integral,
universally injective and surjective. Hence `EtaleFundamentalGroup.map f x̄` is an isomorphism
for every geometric point `x̄` of `X`; for connected `X` and `Y` this is Stacks, Proposition
58.8.4, tag 0BQN.
(Stacks §59.45, Theorem 59.45.2, 04DZ.)
*Needs:* SchemeAndStackFoundations §§0.23–0.23a, §0.29 and Layer 2; EnhancedDerivedSheaves §§0.1–0.4 for generic sheaf equivalences and derived transport; §F.0.2 (finite étale covers, fibre functors and `EtaleFundamentalGroup`).

**Checks.**

- A nilpotent thickening induces an equivalence of étale sites.
- The normalization of a cuspidal curve, a universal homeomorphism, induces the equivalence.
- Normalization of a nodal curve is not universally injective and does not meet the hypothesis.
- For `k = 𝔽_p(t)` and its perfection `k^perf`, the universal homeomorphism
  `Spec k^perf → Spec k` keeps the Artin–Schreier field `k[y]/(y^p − y − t)` a field of degree `p`
  after base change, as the equivalence on finite étale covers requires: `t` is not of the form
  `b^p − b` in `k^perf`. The homeomorphism `Spec 𝔽_(p²) → Spec 𝔽_p` is not universally injective,
  and base change along it splits the connected cover `Spec 𝔽_(p²)` into two points, so it is not
  an equivalence of finite étale covers.

## F.0.A1 Decomposition and inertia groups of a cover

**Decomposition and inertia groups of a cover.** Let `X` be a normal integral locally Noetherian
scheme, `L/K(X)` a finite Galois extension with group `G`, and `Y → X` the normalisation of `X` in
`L`, assumed finite (for instance `X` Nagata). For a point `y ∈ Y` over `x ∈ X` (or an extension of a
valuation), the decomposition group `D_y ⊂ G` is the stabiliser of `y` and the inertia group
`I_y ⊂ D_y` is the kernel of the action of `D_y` on the residue field `κ(y)`. Conjugating `y` by
`g ∈ G` conjugates `D_y` and `I_y` by `g`. When the residue extension `κ(y)/κ(x)` is separable, the
stabiliser of a geometric point lifting `y` is `I_y`, not `D_y`. For a curve, at a discrete valuation
with separable residue extension, `D_y/I_y ≅ Gal(κ(y)/κ(x))`; `|I_y| = e` holds under the defectless
hypotheses of the valuation theory, in particular for curves in characteristic zero. For an
intermediate cover with group `H ⊂ G`, the `D_y`-orbits on `G/H` index points of the intermediate normalization above `x`. For defectless discrete valuations with separable residue extensions, inertia-orbit lengths are ramification indices, and the numbers of inertia orbits within a decomposition orbit are residue degrees. No ramification-index formula is asserted at arbitrary higher-codimension scheme points. Define `SchemeInertia` with
SchemeInertia.decomposition, the stabiliser of the point or valuation, with the geometric lift
having inertia stabiliser under separability; SchemeInertia.inertia, the kernel of the
residue-field action inside `D_y`; SchemeInertia.conjugate, transport to `gy` by conjugation by
`g`; and SchemeInertia.intermediateOrbits, the orbit description on `G/H`, with orbit lengths of
inertia equal to ramification indices for defectless discrete valuations with separable residue extensions. For curves, that is for
places of a Galois extension of function fields, these groups and the
identities `D/I ≅ Aut(κ(y)/κ(x))` and `|I| = e` (separable residue extension) are Tau Ceti's
`TauCeti.Place.stabilizer_eq_decompositionSubgroup`, `TauCeti.Place.decompositionQuotientInertiaEquiv`
and `TauCeti.Place.card_inertiaSubgroup`; this target is their scheme-theoretic form, which must agree
with them on normal curves. *Proof sketch.* Use normalisation and integral closure, Mathlib's
decomposition and inertia groups of primes in a Galois extension of integral domains (the surjection
of the stabiliser onto the automorphisms of the residue extension and the order of inertia) and the
function-field results just named with the curve dictionary of AlgebraicCurves Layers 8 and 12, and
compute geometric fibres as coset spaces of the finite Galois action. Source:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé V, §2, pp. 92–96, for decomposition and
inertia groups and the orbit description of fibres; Stacks, More on Algebra, Lemmas 15.114.1,
15.114.2 and 15.114.4 and Definition 15.114.3 (tags 09EA, 09EB, 09ED, 09EC), for transitivity, the
equalities `e_i = e`, `f_i = f`, normality of the residue extension and surjectivity of
`D → Aut(κ(y)/κ(x))`, with the count `|D| = ef = |I|·|Aut(κ(y)/κ(x))|` in the proof of
Lemma 15.114.5 (tag 09EE), which gives `|I| = e` when `κ(y)/κ(x)` is separable. *Needs:* Supplied by §F.0.2 /
VanishingCycles.finiteEtaleGaloisCategory; SchemeAndStackFoundations Layer 0;
AlgebraicCurves Layers 8 and 12; Mathlib `Ideal.inertia`, `Ideal.Quotient.stabilizerHom_surjective`,
`Ideal.Quotient.stabilizerQuotientInertiaEquiv`, `Ideal.card_inertia_eq_ramificationIdxIn`; Tau Ceti
`TauCeti.Place.stabilizer_eq_decompositionSubgroup`,
`TauCeti.Place.decompositionQuotientInertiaEquiv`, `TauCeti.Place.card_inertiaSubgroup`.
Finite lisse coefficients require no invertibility; `π₁` and paths are §F.0.2's
`EtaleFundamentalGroup` and EtalePath, defined for every scheme and geometric point.

**Checks.**

- For the cover `z ↦ z^n` of `𝔸¹` in characteristic zero, the inertia group at `0` is the cyclic
  group of order `n` and the inertia group at a point over `1` is trivial.
- For an unramified extension of local fields `I = 1` and `D` is the Galois group of the residue
  extension.
- For `A=𝔽₂(u)[[t]]` and `L=Frac(A)(α)`, `α²−tα−u=0`, `A[α]` is a DVR with `e=1` and purely inseparable residue degree 2. The nontrivial automorphism sends `α` to `α+t`, so `I=C₂` has a regular orbit of length 2 despite defect 1; separability is essential.
- For the Artin–Schreier cover `y^p − y = x` of `𝔸¹` in characteristic `p`, the inertia group at
  infinity is a nontrivial `p`-group, so tame ramification fails there.

## F.0.A0 The fundamental groups of a field and of `𝔾_m`

**The fundamental groups of a field and of `𝔾_m`.** The field case is Tau Ceti's: for any field
`K` with a separable closure `K^sep`,
`TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber` identifies `Gal(K^sep/K)` with
`EtaleFundamentalGroup` of `Spec K^sep → Spec K` as topological groups, compatibly with the
equivalence `TauCeti.FiniteEtaleScheme.galoisEquivalence` between finite étale `K`-schemes and
finite continuous `Gal(K^sep/K)`-sets (`TauCeti.FiniteEtaleScheme.instIsFundamentalGroupFiber`),
and it is consumed here as it stands. This section adds the multiplicative group. For an
algebraically closed field `K` of characteristic zero, identify
`π₁^ét(𝔾_{m,K}, 1)` with the Tate module `lim_n μ_n(K)`, the limit taken along the `d`-th power maps
`μ_{nd}(K) → μ_n(K)`: the degree-`n` power cover `z ↦ z^n` has fibre `μ_n(K)` over `1`, and every
connected finite étale cover of `𝔾_{m,K}` is one of these. A compatible system of primitive roots of
unity `(ζ_n)` gives the parametrization `e_ζ : ẑ → T`, `a ↦ (ζ_n^a)_n`, where
`T = lim_n μ_n(K)`, and its inverse coordinate map `c_ζ : T → ẑ`. For a unit `u ∈ ẑ^×`, write
`[u] : ẑ → ẑ` for multiplication by `u`. Then `e_(ζ^u) = e_ζ ∘ [u]` and
`c_(ζ^u) = [u⁻¹] ∘ c_ζ`. The Tate-module identification is canonical, while these maps depend on
the chosen roots. The punctured-line instances used for the thrice-punctured
line are those of BelyiMaps Layers 12.5–12.6, and the profinite integers are the ring of
ProfiniteArithmetic Layer 0. *Proof sketch.* Match the power covers and their fibres with the
tower `μ_n(K)`, using that in characteristic zero every connected finite étale cover of `𝔾_m` over
an algebraically closed field is a Kummer cover. Source: [SGA 1](https://arxiv.org/pdf/math/0206203v2),
Exposé XIII, Corollary 2.12, p. 290; for the field case, Exposé V, Proposition 8.1, p. 117, which
is Tau Ceti's declaration above. *Needs:* Supplied by §F.0.2 /
VanishingCycles.finiteEtaleGaloisCategory; Tau Ceti
`TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber`; BelyiMaps Layers 12 and 13;
ProfiniteArithmetic Layer 0. Finite lisse coefficients require no invertibility; `π₁` and paths
are §F.0.2's `EtaleFundamentalGroup` and EtalePath, defined for every scheme and geometric point.

**Checks.**

- In characteristic `p > 0` the identification fails and is not asserted: over an algebraically
  closed field of characteristic `p`, the Artin–Schreier cover `y^p − y = 1/z` of `𝔾_m` is
  connected, finite étale and of degree `p`, but it is not a power cover, whose degree-`p` member
  `z ↦ z^p` is purely inseparable and not étale.
- Over `ℂ`, the fibre of the degree-`n` power cover of `𝔾_m` over `1` is `μ_n(ℂ)`, of cardinality
  `n`, with `π₁` acting through `ẑ → ℤ/n` once a primitive `n`-th root is fixed.
- Replacing `(ζ_n)` by `(ζ_n^u)` multiplies the forward parametrization by `u` and the coordinate
  of a fixed Tate-module element by `u⁻¹`, leaving the intrinsic identification unchanged.
- If `u ≡ 2 mod 5`, the fixed element `(ζ_n)_n` has coordinate `1` in the original basis and
  coordinate `3 mod 5` in the new basis, since `(ζ₅²)³ = ζ₅`; the residue `2` does not give its
  new coordinate. Complex conjugation alone cannot distinguish the formulas, since `−1` is its
  own inverse.

## F.0.A2 The arithmetic fundamental-group sequence

**The arithmetic fundamental-group sequence — `arithmeticExactSequence`.** Let `X` be a
quasi-compact quasi-separated scheme over a field `k` (`p : X ⟶ Spec k`, `[CompactSpace X]`,
`[QuasiSeparatedSpace X]`) that is geometrically connected, that is `X_{k̄} = X ×_k k̄` is
connected for an algebraic closure `k̄` of `k`, and let
`x̄ : Spec Ω ⟶ X_{k̄}` be a geometric point, `Ω` separably closed. Prove that the homomorphisms
`EtaleFundamentalGroup.map` induced by the projection `X_{k̄} → X` and by `p` form an exact
sequence of profinite groups

`1 → π₁^ét(X_{k̄}, x̄) → π₁^ét(X, x̄) → π₁^ét(Spec k, x̄) → 1`,

that is, the first map is injective, the second surjective, and the image of the first is the
kernel of the second; the last group is `Γ_k = Gal(k^sep/k)` by Tau Ceti's
`TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber`. Here `k̄` is an algebraic closure of
`k`; in positive characteristic an arbitrary algebraically closed overfield would not do. A `k`-rational point `a` of `X` gives a continuous section `s_a`, defined
after the choice of an étale path from `x̄` to the geometric point over `a`; for a fixed `a`, changing
the path changes `s_a` by conjugation by an element of `π₁^ét(X_{k̄}, x̄)`. Different rational points
can give sections that are not conjugate under `π₁^ét(X, x̄)`. Exactness alone chooses no section. The
induced outer action `Γ_k → Out(π₁^ét(X_{k̄}, x̄))` does not depend on any section, and is a separate
datum from the conjugacy class of a section. *Proof sketch.* Let `k^sep` be the separable
closure of `k` in `k̄`. Pass from `X_{k̄}` to `X_{k^sep}` first: the projection
`X_{k̄} → X_{k^sep}` is the base change of `Spec k̄ → Spec k^sep`, a universal homeomorphism
because `k̄/k^sep` is purely inseparable, so §F.0.4 identifies the finite étale covers of
`X_{k^sep}` with those of `X_{k̄}` and the two fundamental groups (Stacks, Proposition 58.8.4,
tag 0BQN). Stacks and SGA 1 instead reduce to a perfect `k` (Stacks, Lemma 58.14.2, tag 0BTW;
SGA 1, proof of Exposé IX, Theorem 6.1, p. 195, through Corollary 4.11, p. 187). Then descend finite
étale covers of `X_{k^sep}` and their morphisms to `X_{k'}` for finite separable `k'/k`, which is
where quasi-separatedness enters (descent along the limit `X_{k^sep} = lim X_{k'}` of qcqs
schemes with affine transition maps, Stacks, Lemma 58.14.1, tag 0BTV); apply the exact sequence
of the finite Galois cover `X_{k'} → X` and pass to the inverse limit; a rational point gives a
section of schemes and hence of groups. The limit over finite separable extensions is
`X_{k^sep}`, which is `X_{k̄}` only for perfect `k` (Checks).
Sources: Stacks, Lemma 58.14.3 (tag 0BTX), for qcqs `X`;
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé IX, Theorem 6.1 and Corollary 6.4,
pp. 195–196, where Theorem 6.1 is stated over an Artinian base with residue field `k` (the field
case is the one used here), assumes only that the closed fibre is quasi-compact and leaves the
descent of covers to the reader; that descent needs quasi-separatedness (Checks).
*Needs:* §F.0.A0; Supplied by §F.0.2 /
VanishingCycles.finiteEtaleGaloisCategory (fundamental groups, paths, functoriality, and descent
of finite étale covers along limits and étale coverings); §F.0.4 (finite étale covers along the
universal homeomorphism `X_{k̄} → X_{k^sep}`); SchemeAndStackFoundations §0.9 (limits).
Finite lisse coefficients require no invertibility; `π₁` and paths are §F.0.2's
`EtaleFundamentalGroup` and EtalePath, defined for every scheme and geometric point.

**Checks.**

- For `X = Spec k`, the geometric group is trivial and `π₁^ét(Spec k) → Γ_k` is the identification
  of §F.0.A0.
- For `X = 𝔾_{m,ℚ}` and the rational point `1`, the section exists, and conjugation through it acts
  on the geometric group `ẑ(1)` by the cyclotomic character; exactness alone does not choose this
  section, and a different rational point `a` gives the section twisted by the Kummer cocycle of
  `a`.
- The rational points `1` and `2` of `𝔾_{m,ℚ}` give nonconjugate sections. The connected double cover
  `z² = t` is a quotient `π₁^ét(𝔾_{m,ℚ}) ↠ C₂`; composed with `s_1` it is the trivial character of
  `Γ_ℚ`, the fibre over `1` being split, and composed with `s_2` it is the character of `ℚ(√2)`.
  Conjugate sections have equal composites with a map to the abelian group `C₂`.
- Over an imperfect field the descent step reaches `X_{k^sep}`, not `X_{k̄}`. Take `k = 𝔽_p(t)`,
  `L = k(t^(1/p))` and `X = Spec L`. The limit of the `X_{k'}` over finite separable `k'/k` is
  `Spec (L ⊗_k k^sep)`, the spectrum of the field `k^sep(t^(1/p))`, since `t` is not a `p`-th power
  in `k^sep`; but `X_{k̄} = Spec k̄[y]/((y − t^(1/p))^p)` is not reduced. Both are one point with
  trivial `π₁`, the map between them being a universal homeomorphism, and `π₁^ét(X) = Gal(L^sep/L)`
  maps isomorphically onto `Γ_k` because `L/k` is purely inseparable, so the sequence is exact.
- Quasi-separatedness cannot be dropped. Over `k = 𝔽_p` let `A` be the ring of sequences
  `(fₙ)_(n≥1)` with `fₙ ∈ 𝔽_(pⁿ)[t]`, all constant terms equal to one element of `k`, and `fₙ`
  constant for all but finitely many `n`. Its spectrum is one closed point together with the open
  `W = ⨆ₙ Spec 𝔽_(pⁿ)[t, t⁻¹]`, which is not quasi-compact. Glue two copies of `Spec A` along `W`
  to get `X`: it is quasi-compact, not quasi-separated, and `X_k̄` is connected, since
  `A ⊗_k k̄` has no idempotents other than `0` and `1`. Over `k̄` the piece of `W` with index `n`
  splits into `n` copies of `𝔾_m`, which the arithmetic Frobenius permutes cyclically. Reglue the
  trivial double covers of the two charts by the swap on one copy for each `n`. The result is a
  connected double cover `V` of `X_k̄`: by Mayer–Vietoris its class in `H¹(X_k̄, ℤ/2)` is a
  function on the components of `W_k̄` modulo constants, and that function is not constant. The
  `m`-th power of Frobenius, `m ≥ 1`, moves this class: for `n > m` it moves the swapped copy
  with index `n` to another copy, while it fixes the single copy with index `1`, so the two
  functions differ by a nonconstant function. Hence no open subgroup of `Gal(k̄/k)` fixes the
  isomorphism class of `V`. Injectivity of the first map would make `V` dominated by a component
  of the pullback of a finite étale cover of `X`, and the class of such a cover is fixed by an
  open subgroup; so the first map is not injective, and the statement with `[CompactSpace X]`
  alone is false.

**Frobenius classes and the Weil group — MonoidHom.weilGroup.** Let `X` be a scheme, `x̄` a
geometric point and `z` a point of `X` with finite residue field `κ(z)`. Define
IsGeometricFrobenius z g for `g` in `EtaleFundamentalGroup x̄`: `g` is the image of the geometric
Frobenius of `κ(z)`, the inverse of `FiniteField.frobeniusAlgEquivOfAlgebraic` on a separable
closure of `κ(z)`, under Tau Ceti's identification
`TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber` for `Spec κ(z)`, the map
`EtaleFundamentalGroup.map` induced by `Spec κ(z) → X` and transport along some EtalePath to
`x̄`. Define frobeniusClass z as the
conjugacy class of these elements; changing the path conjugates, so the class does not depend on
it. Prove the compatibility with Mathlib's `AlgHom.IsArithFrobAt`: for a finite Galois cover
`Spec B → Spec A` with group `G` inside `X`, `z` the image of a prime `Q` of `B`, the image of
frobeniusClass z in `G` is the class of the inverse of any `φ` with `φ.IsArithFrobAt Q`.
For `f : X ⟶ Spec k` with `k` finite and a geometric point over an algebraic closure `k̄`, the
Weil group is `MonoidHom.weilGroup π Φ` for `π` the map from `EtaleFundamentalGroup x̄` to
`Gal(k̄/k)` given by `EtaleFundamentalGroup.map` of `f` and Tau Ceti's identification for `Spec k` and `Φ` the geometric Frobenius: the pairs `(g, n)` with `π g = Φⁿ`, with
the subspace topology of `π₁ × ℤ` for discrete `ℤ`. The decomposition
`π₁(X_k̄, x̄) ⋊ ℤ` for geometrically connected qcqs `X` is a theorem from the exact sequence above, not
the definition. These Frobenius classes and this Weil group are the ones consumed by
InverseGaloisAndArithmeticFundamentalGroups and by the Weil-sheaf consumers; §F.10.1's
VanishingCycles.geometricFrobenius is the same automorphism `Φ`. (Stacks 03SU, 03SV;
SGA 4½ [Rapport] §1.) *Needs:* §§F.0.2, F.0.A0; Mathlib `FiniteField.frobeniusAlgEquivOfAlgebraic`,
`AlgHom.IsArithFrobAt`, `MonoidHom.eqLocus`.

**Checks.**

- For `X = Spec 𝔽_q`, the Weil group is the infinite cyclic group generated by `(Φ, 1)`, and
  frobeniusClass of the point is `{Φ}`.
- For `X = Spec 𝔽_2` and the geometric point `Spec 𝔽̄_2`, the Frobenius class acts on `μ_5(𝔽̄_2)` by
  `ζ ↦ ζ³`, the inverse of `ζ ↦ ζ²`; a definition using arithmetic Frobenius would give `ζ²`.
- For the cover `Spec ℤ[i, 1/2] → Spec ℤ[1/2]` with group `C₂`, the image of frobeniusClass at the
  point `(p)` is trivial exactly when `p ≡ 1 mod 4`.

## 0.5 Finite-presentation geometry and coefficient descent

**Finite diagrams with coefficients.** Provide ClassicalCoefficients.finitePresentationDescent: for `X=lim X_i` with `X_i` qcqs schemes and affine transition maps, finite diagrams of finitely presented `X`-spaces, their maps, finite covering families and finitely presented coefficient modules descend to a common stage; equalities are detected after enlargement. For geometric descent and noetherian approximation use `SchemeAndStackFoundations`, §0.9, `finite_presentation_limits` and `noetherian_approximation`. For a noetherian coefficient ring `Λ`, descend constructible `Λ`-sheaves by a finite constructible stratification, finite étale trivializations on each stratum and the finite gluing diagram. This includes infinite finite-type `Λ`-modules, not just finite sets. For analytic spaces use finite qcqs étale trivialization and gluing data; the coefficient descent assertion is conditional on a qcqs étale-site 2-colimit with finite covering detection, assumed as a proved site-continuity hypothesis (for example the domains supplied by PerfectoidSpaces P5.10–P5.12 (qcqs étale 2-colimit and finite-stage detection) and P7.15 (étale-topos comparison for tilde-limits)); no arbitrary analytic tilde-limit is asserted to have it. (Stacks, Limits of Schemes, Lemma 32.10.1, tag 01ZM; Étale Cohomology, §§59.51 and 59.73; SGA 4, Exposé VI, §8.)

**Checks.**

- A constant identity system descends the same finite diagram and coefficient sheaf.
- A finite collection of objects descending separately has a common stage by filteredness.
- A merely finite-type scheme over a nonnoetherian ring with infinitely generated relations is not covered by the finite-presentation assertion.

*Needs:* `SchemeAndStackFoundations`, §0.9 and §2.15 (`etale_cohomology_limits`); Mathlib's finite presentation and constructibility; a proved site-continuity hypothesis for analytic use.

**One essentially small model.** The sheaf categories of the descended data, at every stage and
in the limit, are those of Mathlib's small étale sites, and the only essentially small model used
for sheafification and the Grothendieck abelian structure is Mathlib's `Scheme.AffineEtale`
through `Scheme.AffineEtale.sheafEquiv`. No scheme target uses a cardinal-bounded site; the
analytic site-continuity hypothesis is a statement about the analytic sites themselves.

## 0.6 Constructible complexes and Hom descent

**Constructible derived continuity.** Under Section 0.5's hypotheses with fixed noetherian `Λ`, provide ClassicalCoefficients.constructibleDerivedDescent: every bounded complex with constructible cohomology descends to a bounded constructible complex at a stage. Descend its finite Postnikov diagram, attaching maps and relations together, by constructible sheaf descent and étale cohomology continuity. No assertion descends arbitrary unbounded complexes to one stage. (SGA 4, Exposé VI, §§8.5–8.7; Stacks, Theorem 59.51.3, tag 09YQ, and §59.73; Huber (1996), Proposition 2.4.4 and Corollary 2.4.6, pp. 127–129, for the classical analytic site input.)

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; §0.5; SchemeAndStackFoundations §2.15. Analytic instantiations require §0.5's proved site-continuity hypothesis.

**Checks.**

- Degree-zero complexes give constructible sheaf descent.
- A finite extension class descends with its two end terms after enlargement.
- A complex in a fixed interval `[a,b]` descends its finite Postnikov diagram; the theorem supplies no stage for an infinite sequence of independent attaching maps.

**Constructible Hom continuity.** Under the same hypotheses, for descended bounded constructible `K_i,L_i`, provide ClassicalCoefficients.constructibleHomContinuity: the filtered colimit of `Hom(K_j,L_j[r])` is `Hom(K,L[r])` for each fixed `r`. A finite set of maps, triangles and equalities descends simultaneously; equalities are detected at a stage. Prove the assertion by induction on cohomological amplitude and sheaf Ext continuity. (SGA 4, Exposé VI, §§8.5–8.7; Stacks, Theorem 59.51.3, tag 09YQ, and §59.73; Huber (1996), Proposition 2.4.4 and Corollary 2.4.6.)

**Checks.**

- For sheaves and `r=0`, this is descent of constructible sheaf morphisms.
- An extension class becoming zero on the limit is zero after some enlargement.
- A finite commutative triangle descends with its equality; infinitely many independently chosen maps have no asserted common stage.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; this roadmap §0.5; `SchemeAndStackFoundations`, §2.15 for scheme cohomology continuity; analytic use requires the proved site-continuity hypothesis of §0.5.

## 0.7 Derived localization with supports

For every open immersion `j:U→X` of schemes and every coefficient ring `Λ`, construct abelian extension by zero as the left adjoint of restriction, with the original stalks on `U` and zero stalks on its complement. Prove exactness, full faithfulness, composition, arbitrary scheme base change and agreement with abelian extension by zero after forgetting `Λ`. Its termwise action on complexes preserves quasi-isomorphisms and defines the enhanced derived `j_!` of EnhancedDerivedSheaves §0.4; identify its cohomology sheaves with `j_!Hⁱ(K)`, and its degree-zero restriction with the abelian functor. These are the extension-by-zero interfaces of ClassicalAlgebraic.supportLocalization. (Stacks, §59.70, tags 03S2 and 03S6; Modules on Sites, Remark 18.19.6, tag 08P4.)

**Finite-open Mayer–Vietoris and equivariant localization.** Provide ClassicalAlgebraic.supportLocalization: for any scheme `X`, a closed subscheme `i:Z→X`, its open complement `j:U→X` and `K` in the enhanced derived category of étale `Λ`-module sheaves, construct `i^!`, sections supported on `Z` and the natural triangles `i_*i^!K→K→Rj_*j^*K` and `j_!j^*K→K→i_*i^*K`. Here `Λ` is any ring; these constructions require no Noetherian or invertibility hypothesis. Prove nested-support compatibility, excision and naturality of the connecting maps. The support depends on the closed set; identify nilpotent thickenings using §F.0.4 (VanishingCycles.universalHomeomorphismEtaleEquivalence), whose general topological-invariance theorem supplies this special case (Stacks, tag 04DZ). Construct the support carrier on the small étale site from EnhancedDerivedSheaves §§0.1–0.4 and étale open–closed recollement. `SchemeAndStackFoundations`, §2.7, supplies the separate Zariski `O_X`-module support calculus. Analytic support geometry is a downstream application in ClassicalAdicEtaleCohomology. (Stacks, Étale Cohomology, §§59.46 and 59.79; SGA 4, Exposé XVII, §5.)

Provide ClassicalAlgebraic.supportLocalization.mayerVietoris: for `X=U∪V`, with open inclusions `j_U,j_V,j_(U∩V)`, construct the triangle `j_(U∩V)!K|_(U∩V)→j_U!K|_U⊕j_V!K|_V→K→`, using `(1,−1)` on the intersection and addition toward `K`. Also give ordinary cohomology descent `RΓ(X,K)→RΓ(U,K)⊕RΓ(V,K)→RΓ(U∩V,K)→` with difference of restrictions. Extend to the alternating finite-intersection complexes of every finite open cover and prove refinement coherence. Prove coherent finite group actions for actions preserving the support or permuting the cover, derived coefficient-change transformations and tensor compatibility for commutative `Λ`. Extension-by-zero localization commutes with arbitrary scheme pullback and derived scalar extension. For the `i^!` triangle use the canonical exchange and tensor transformations of EnhancedDerivedSheaves §0.4, asserting equivalences only under their proved hypotheses; tensoring by a perfect coefficient complex gives the tensor equivalence.

**Checks.**

- `Z=∅` gives the zero support functor and identity open restriction.
- `Z=X` gives the identity closed term and zero open complement.
- A two-open cover gives the intersection connecting map with the stated difference sign; exchanging `U` and `V` changes the intersection sign coherently.
- Replacing `(p)` by `(p²)` on `Spec ℤ_p` leaves the support functor and étale localization triangle unchanged without creating a scheme map in the wrong direction.
- For `j:𝔾_m→A¹` and a `Λ`-module sheaf `F` in degree zero, derived `j_!F` has only `H⁰=j_!F` and zero stalk at the origin; forgetting `Λ` gives the same abelian extension by zero.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; `SchemeAndStackFoundations`, §§2.1–2.2 for cohomology transport and Leray; §F.0.4 (VanishingCycles.universalHomeomorphismEtaleEquivalence) for nilpotent invariance.

**Extension by zero along étale maps, supports and the open–closed sequence.** Work with any
coefficient category `A` satisfying Mathlib's sheafification hypotheses whose sheaf categories
are Grothendieck abelian, with no Noetherian hypothesis on the schemes. For every étale
`h : U ⟶ X` define etaleExtensionByZero h from sheaves on `U_et` to sheaves on `X_et` as
Mathlib's `Functor.sheafPullback` along the site functor `MorphismProperty.Over.map`
(composition with `h`), left adjoint to restriction along `h`. Prove that it agrees with the
open-immersion extension by zero above, that it is compatible with composition and arbitrary
base change, and that its stalk at a geometric point `x` is the direct sum of the stalks at the
lifts of `x` to `U`; for finite étale `h` it agrees with `h_*`. For an open immersion `j` this
gives the adjoint triple `j_! ⊣ j^* ⊣ j_*`. For a closed immersion `i : Z ⟶ X` define the
predicate IsSupportedOn i F: the unit `F → i_*i^*F` is an isomorphism; prove that `i_*` is
fully faithful with essential image the sheaves supported on `Z`. For complementary `j` and `i`
define openClosedShortComplex j i F, the `ShortComplex` `j_!j^*F → F → i_*i^*F`, natural in
`F`, and prove it `ShortComplex.ShortExact`. The localization and Mayer–Vietoris triangles of
this section are data: their maps, natural in `K`, with distinguishedness as a theorem. (Stacks
§59.70, tags 03S2 and 03S6.) *Needs:* Mathlib `Functor.sheafPullback`,
`MorphismProperty.Over.map`, `MorphismProperty.Over.pullback`; SchemeAndStackFoundations §2.1.

**Checks.**

- For the étale double cover `h : Spec ℂ → Spec ℝ`, `h_!Λ = h_*Λ` is the induced Galois module
  `Λ[C₂]`.
- For `i` the origin of `𝔸¹`, the skyscraper `i_*Λ` is supported on the origin and the constant
  sheaf `Λ ≠ 0` is not.
- For `Z = ∅` the open–closed sequence is `F → F → 0` with the identity.

**Pseudofunctorial inverse and direct images.** Package `f^* ⊣ Rf_*` on the unbounded
`D(X,Λ)` as a pseudofunctor from `LocallyDiscrete Scheme.{u}ᵒᵖ` to `Bicategory.Adj Cat`
(Mathlib `Pseudofunctor`), in the shape of Mathlib's `Scheme.Modules.pseudofunctor`, with the
derived functors of EnhancedDerivedSheaves §0.4. The base-change map of a commutative square is
the `TwoSquare` mate (`mateEquiv`) of the identification `g'^*f^* ≅ f'^*g^*`; base-change maps
of pasted squares paste. The exchange theorems of §§F.2.1–F.2.2 and §F.2.4 are `IsIso`
statements for these mates. Compactifications enter no construction of §§0.7–0.8 or §F.2 as
arguments: lower shriek assumes `[Nonempty (TauCeti.Compactification f)]` (§G.1). *Needs:*
EnhancedDerivedSheaves §0.4; Mathlib `Pseudofunctor`, `Bicategory.Adj`, `TwoSquare`, `mateEquiv`.

**Checks.**

- The pseudofunctor sends `𝟙 X` to the identity adjunction up to its unit isomorphism.
- For a square whose two horizontal maps are identities, the mate is the identity
  transformation.
- Pasting two cartesian squares gives the mate of the composite square.

## F.1 Derived sheaves and coherent diagrams

**Bounded constructible and ctf categories.** VanishingCycles.constructibleDerivedCategory.
Specialize `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`,
`ClassicalDerived.tensorHom` and `ClassicalDerived.functorCoherence` to étale `Λ`-module
sheaves, with homotopy category Mathlib's `DerivedCategory`. Form `Dᵇ_c` and `Dᵇ_ctf` as
object properties of `D(X,Λ)` on every scheme, with §F.0.1's affine-local constructibility and
global cohomological/Tor bounds, as specified in the paragraph below. Tor amplitude `[a,b]` means
that derived tensor with every degree-zero module sheaf has cohomology in `[a,b]`; prove the
geometric-stalk criterion and invariance under quasi-isomorphism. Build shifts, cones,
finite sums, pullback and generic lissity of cohomology. `Dᵇ_c` admits truncations; its tensor
closure requires one finite-Tor factor, and bounded internal Hom requires the stated
perfectness of its source. `Dᵇ_ctf` is triangulated and symmetric monoidal; a truncation belongs
to it only after its Tor bound is verified. Use ClassicalAlgebraic.supportLocalization
for open–closed triangles. (Stacks §§59.76–59.77; SGA 4 VI; EnhancedDerivedSheaves §0.3.)
*Needs:* §§F.0.1–F.0.4; EnhancedDerivedSheaves §§0.1–0.4; §0.7; SchemeAndStackFoundations §§2.5, 2.7.

**Checks.**

- A finite free degree-zero sheaf has Tor amplitude `[0,0]`.
- On a point `ℤ/2` over `ℤ/4` is constructible but has unbounded Tor amplitude.
- Quasi-isomorphic representatives have identical `Dᵇ_c` and `Dᵇ_ctf` membership.

**`Dᵇ_c` and `Dᵇ_ctf` as object properties.** For Noetherian `Λ`, define cohomologyProperty P,
for an object property `P` of the abelian carrier, as the objects of `D(X,Λ)` all of whose
cohomology sheaves satisfy `P`, and boundedConstructible X Λ as
`DerivedCategory.TStructure.t.bounded ⊓ cohomologyProperty (constructibleSheaf X Λ)`, with
Mathlib's `DerivedCategory.TStructure.t` and `Triangulated.TStructure.bounded` (Stacks 095W). Prove that
cohomologyProperty P is triangulated (`ObjectProperty.IsTriangulated`) whenever `P` is a weak
Serre class, that is `[P.ContainsZero] [P.IsClosedUnderIsomorphisms] [P.IsClosedUnderKernels]
[P.IsClosedUnderCokernels] [P.IsClosedUnderExtensions]` (Stacks, Lemma 13.17.1, tag 06UQ), so
`Dᵇ_c` is triangulated by §F.0.1, and that it carries the induced `t`-structure
(`ObjectProperty.HasInducedTStructure` for `DerivedCategory.TStructure.t`), which supplies its
truncations and heart. `Dᵇ_ctf` is boundedConstructible X Λ intersected with finite Tor amplitude
(Stacks 03TQ, 03TT). One lisse predicate serves complexes: IsLisse K when every cohomology sheaf
of `K` is locally constant of finite type in §F.0.1's sense; lisse sheaves, lisse complexes and
the generic lissity statements of this roadmap all use it. *Needs:* §F.0.1 (constructibility and
its five closure instances); Mathlib `DerivedCategory.TStructure.t`, `ObjectProperty.IsTriangulated`,
`ObjectProperty.HasInducedTStructure` and the closure classes above.

**Checks.**

- `⊕_(n ≥ 0) Λ[n]` has constructible cohomology sheaves but is not in `Triangulated.TStructure.bounded`, so
  it is not in `Dᵇ_c`.
- The truncations of a `Dᵇ_c` object in the induced `t`-structure are its truncations in `D(X,Λ)`.
- For `j : 𝔾_m → 𝔸¹`, `j_!Λ` is in `Dᵇ_c` and is not lisse, while `Λ[3]` is lisse.

**Finite-coefficient cohomology and coherent actions.** VanishingCycles.finiteCoefficientCohomology.
Use the supplier's `RΓ` and `CategoryTheory.Sheaf.H` for F.1's objects, retaining `Λ`-module
structure. Build cup products, coefficient restriction and derived extension, scheme
pullbacks, long exact sequences and coherent finite-group actions. Identify the underlying
abelian `D⁺` cohomology and pullback with SchemeAndStackFoundations §2.1. For a finite étale
cover with acyclic finite intersections prove the Čech comparison through the Čech-to-derived
spectral sequence. Prove VanishingCycles.filteredColimit_cohomology on the qcqs scheme
étale domain: exact filtered colimits commute with cohomology; geometric stalks commute
with them on every scheme. Consume `ClassicalDerived.inverseLimits` and
`ClassicalDerived.derivedCompletion` for derived limits, Milnor sequences and completion.
(SGA 4 V–VI, VI §5, VII §5; Bhatt–Scholze §§3, 5–6.)
*Needs:* §§F.0.1–F.0.4, F.1 constructibleDerivedCategory; SchemeAndStackFoundations §§2.1–2.2, 2.17;
EnhancedDerivedSheaves §§0.3–0.4, especially tensorHom and functorCoherence.

**Checks.**

- A constant module on a separably closed point has only degree-zero cohomology.
- Identity pullback is the identity module map.
- An equivariant short exact sequence has an equivariant connecting map, even when the
  group order is not invertible in `Λ`.
- The cone of multiplication by `ℓ` on `ℤ/ℓ²` has both kernel and cokernel `ℤ/ℓ`.
- An infinite filtered sum of nonzero finite constant modules commutes with stalks and
  is not constructible on a point.

## F.2.1 Proper base change for arbitrary torsion

VanishingCycles.etaleBaseChange indexes §§F.2.1–F.2.2. EnhancedDerivedSheaves §0.4 supplies the canonical transformations and pasting; SchemeAndStackFoundations §§2.1–2.2 supplies underlying abelian `D⁺` functors.

**Proper base change for arbitrary torsion.** VanishingCycles.properBaseChange.
For proper `f:X→Y`, every cartesian square with `g:Y′→Y` and `g′:X′→X`, and every `K` in `D⁺` of
torsion abelian sheaves, prove `g*Rf*K ≅ Rf′*g′*K` by the canonical exchange. No Noetherian
or invertibility hypothesis is imposed. Include sheaf and geometric-stalk forms,
composition/pasting, products, group actions, coefficient change and coefficient forgetting.
(SGA 4 XII 5.1; Stacks §59.91.) *Needs:* SchemeAndStackFoundations §§2.1–2.2;
EnhancedDerivedSheaves §§0.1–0.4. This theorem precedes properSupports and adic realization.

**Checks.**

- A geometric stalk of `Rf*K` is the geometric fibre's cohomology.
- The exchange for a proper identity square is identity.
- Residue-characteristic torsion still satisfies this proper base-change theorem.

## F.2.2 Smooth base change in the rotated square

**Smooth base change in the rotated square.** VanishingCycles.smoothBaseChange.
Let `f:X→S` be smooth, `g:T→S` qcqs, `Y=X×_S T`, `h:Y→X` and `e:Y→T`. For every abelian sheaf
`F` on `T` whose stalks at geometric points are torsion of orders invertible on `S` (equivalently,
every section over a quasi-compact étale `U → T` is killed by an integer invertible on `S`), prove
`f*Rᵠg*F ≅ Rᵠh*e*F` (Stacks, Theorem 59.89.2, tag 0EYU) and the `D⁺` version for complexes all of
whose cohomology sheaves satisfy the same stalk condition.
Prove the cofiltered smooth-base-change limit corollary with affine transitions, and
invariance under extension of separably closed fields, retaining cup and twist maps.
(SGA 4 XVI 1.1–2.2; Stacks §§59.89–59.90.)
*Needs:* F.1 finiteCoefficientCohomology and generic `D⁺` functor calculus;
SchemeAndStackFoundations §0.9 (scheme limits).

**Checks.**

- Smooth identity base change gives identity exchange.
- Extending a separably closed ground field preserves geometric cohomology.
- An arbitrary nonsmooth base change does not meet the smooth hypothesis.
- For `S = T = ⨆_(n≥1) Spec ℚ`, `f = g = id` and `F` the constant sheaf `ℤ/n` on the `n`-th copy,
  every stalk is finite, so the theorem applies, although the global section equal to `1` on every
  copy is killed by no integer; a hypothesis on all sections would exclude this `F`.

## F.2.3 Local and universal local acyclicity

**Local and universal local acyclicity.** VanishingCycles.localAcyclicity.
For a scheme morphism and a bounded constructible complex with finite invertible
coefficients, define local acyclicity by the strict-local fibre comparison maps; ULA
requires these comparisons after every base change. Prove source/target locality,
base-change stability of ULA, smooth ULA for finite lisse coefficients, triangle closure
and the following tensor stability: if `K` is ULA for `f` and `L` is a locally constant
perfect `Λ`-complex on `X` with global Tor amplitude `[c,d]`, then `K⊗ᴸ_Λ L` is ULA.
If `K` has cohomological (respectively Tor) amplitude `[a,b]`, the tensor has the
corresponding amplitude bound `[a+c,b+d]`. Construct cospecialization with coherent
specialization and path composition. (SGA 4 XV–XVI; Stacks §§59.93–59.94,
Definition 59.93.1, tag 0GJP.) *Needs:* F.1, properBaseChange, smoothBaseChange;
geometric points and strict henselizations from SchemeAndStackFoundations and ModularCurves Layer 4D.

**Checks.**

- A smooth constant family with invertible coefficients is ULA.
- In characteristic different from two, `x↦x²` is locally acyclic away from zero but not at zero.
- Concatenated specialization/path data give the composite cospecialization map.
- For `f:𝔸²_(t,x)→𝔸¹_t` over `ℂ`, the sections `i(t)=(t,0)` and `j(t)=(t,t)`
  give ULA sheaves `i_*𝔽_ℓ` and `j_*𝔽_ℓ`, both of Tor amplitude `[0,0]`.
  Their derived tensor is the skyscraper at `(0,0)` and is not locally acyclic:
  its special stalk is `𝔽_ℓ` and its nearby geometric-fibre cohomology is zero.

## 0.8 Algebraic proper supports and finite traces

**Canonical lower shriek.** Provide ClassicalAlgebraic.properSupports: for every compactifiable `f : X ⟶ S`, that is `[Nonempty (TauCeti.Compactification f)]` (§G.1), define `Rf_!` once, without a choice of compactification, on `D⁺` of étale `Λ`-module sheaves with torsion cohomology, for any coefficient ring `Λ`. By `nagataCompactification` this includes every separated finite-type morphism to a qcqs scheme, the domain of Stacks 0F7H, and in particular every separated finite-type morphism between Noetherian schemes. For a compactification `C : TauCeti.Compactification f`, with open immersion `j` and proper `p`, put lowerShriekAt C = `Rp_*j_!`. A morphism of compactifications gives a transition map between these functors, an isomorphism by §F.2.1 (VanishingCycles.properBaseChange) on the proper factor without an invertibility condition; this is the functor lowerShriekDiagram f out of the opposite of `TauCeti.Compactification f`, which is cofiltered once nonempty (Tau Ceti's `Cofiltered.lean`), with invertible transition maps. Tau Ceti's comparison principle `CategoryTheory.Functor.cofilteredComparison` (§G.3) turns it into the canonical `Rf_!` with an isomorphism lowerShriekIso C between `Rf_!` and `Rp_*j_!` for every compactification `C`, and the `_eq` law: for a morphism `C ⟶ D`, lowerShriekIso C followed by the transition map is lowerShriekIso D. Independence of the compactification, with its identity and cocycle laws, is therefore functoriality of the diagram (Stacks 0F7I); consumers compute through lowerShriekIso and never unfold the definition. Prove composition `Rg_!Rf_! ≅ R(g∘f)_!` (lowerShriekComp) with its unit and associativity laws (Stacks 0F7J, 0F7K), proper agreement with `Rf_*` and open agreement with exact `j_!` as lowerShriekIso at the tautological compactifications, and the canonical forget-supports map `Rf_! → Rf_*`, compatible with composition. Prove compatibility with shifts, triangles, finite group actions and coefficient transformations, retaining the Tor bounds needed to stay in `D⁺` under derived scalar extension. For torsion `Λ`, killed by some `N ≥ 1`, make the same construction on the unbounded `D(X,Λ)`, using the finite cohomological dimension of `Rp_*` on torsion sheaves for proper finite-type `p` and the colimit hypotheses of EnhancedDerivedSheaves §0.4 (Stacks 0F7H, second construction, and 0G2A); the `D⁺` functor is its restriction, and `Dᵇ_c` and `Dᵇ_ctf` are properties preserved by it (§§F.2.4, F.3), not separate definitions. Only finite-presentation compactification diagrams descend by Section 0.5. Bounded ctf preservation and constructible exchange are the additional results of §§F.2–F.3, applied to this functor. (SGA 4, Exposé XVII, §§5–6; Stacks, More Étale Cohomology, *Derived lower shriek via compactifications*, tag 0F7H.)

Provide ClassicalAlgebraic.properSupports.derivedComparison: writing underived `f!` for the compactly supported pushforward, `p_*j_!` for every compactification and independent of it (Stacks 0F4Z), construct the canonical map `R(f!)→Rf_!`, computed through lowerShriekIso as `R(p_*j_!)→Rp_*j_!`, with `H⁰(Rf_!F)=f!F` for a sheaf `F`. The right-derived composite uses an injective resolution on `X`; `R⁺f!` instead resolves `j_!F` on the compactification. Exactness of `j_!` does not imply that it sends injectives to `p_*`-acyclic sheaves, so the comparison is generally noninvertible; preserve the identity comparisons in the proper and open cases. (Stacks, More Étale Cohomology, *Sections with compact support*, tag 0F4W, and *Compactly supported cohomology*, tag 0GJY; SGA 4, Exposé XVII, §§5–6.)

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; §§G.1–G.3 (Tau Ceti's compactification package), 0.7 and F.2.1; §0.5 for finite-presentation descent of compactification diagrams.

**Checks.**

- For proper `f`, lowerShriekIso at the identity compactification gives `Rf_! ≅ Rf_*`, and
  forget-supports is that isomorphism.
- An open immersion with tautological compactification into its target gives exact extension by zero.
- For `X=A¹_k` over an algebraically closed field with `ℓ` invertible and `Λ=ℤ/ℓ`, true `H²_c(X,Λ)=Λ(−1)`. In contrast `R²(Γ_c)(Λ)=⊕_(a∈k)Λ(−1)`: proper closed supports are finite sets, so the naive derived functor is the filtered colimit of local cohomology at those supports. The comparison adds the point classes and has a nonzero kernel. The open immersion `X⊂P¹` alone has exact `j_!` and identity derived comparison.
- Refining a compactification properly gives the same functor with the same forget-supports map, not just isomorphic cohomology groups.

Applying `Rf!` to §0.7's triangles gives compact-support localization and finite-open Mayer–Vietoris whenever `f` is compactifiable and `K` is bounded below with torsion cohomology; restriction to an open `U` of `X` whose inclusion is quasi-compact (every quasi-compact open when `X` is quasi-separated) keeps the map compactifiable (Tau Ceti's `TauCeti.Compactification.precomp`, which takes a quasi-compact open immersion). Quasi-compactness of `U` alone does not suffice: on the non-quasi-separated scheme `X` of §F.0.A2's Checks, `id_X` is compactifiable, but the inclusion of one affine chart is not quasi-compact, since its intersection with the other chart is the non-quasi-compact `W`, so that inclusion is not compactifiable. The connecting maps retain §0.7's signs, support naturality and refinement coherence.

**Algebraic finite traces.** Provide ClassicalAlgebraic.finiteTrace for finite locally free maps on abelian étale sheaves; for finite étale maps it is the adjunction counit. Its geometric-stalk map sums with the lengths of local Artinian fibre rings, and its composite with the unit is multiplication by rank. Prove naturality, composition, pullback compatibility and the norm description on Kummer classes when `n` is invertible. (SGA 4, Exposé XVII, §6; Stacks, Étale Cohomology, §59.66, tag 03SH.)

**Checks.**

- A split finite étale degree-`r` map has trace the sum of `r` components, including `r=0`.
- If `ℓ` divides `r`, coefficients `Z`/`ℓ` give zero after the diagonal unit; trace does not divide by `r`.
- For `T↦T²` on `A¹` in characteristic different from two, trace at zero is twice the value, despite the fibre having one geometric point.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; this roadmap §0.7; §F.2.1 (VanishingCycles.properBaseChange) on `D⁺` torsion complexes; §§G.1–G.3 (Tau Ceti's compactification package and `nagataCompactification`). Section 0.5 is used only for finite-presentation descent of chosen diagrams.

## F.2.4 Constructible lower shriek and arbitrary base change

**Constructible lower shriek and arbitrary base change.** VanishingCycles.etaleCompactSupports.
Use the canonical functor `Rf_!` of ClassicalAlgebraic.properSupports (§0.8), defined from the
diagram of compactifications of a compactifiable `f` and computed through lowerShriekIso; it is
the only lower shriek of the roadmap. The geometry is
supplied by §§G.1–G.3: Tau Ceti's compactification package, with `nagataCompactification` over
qcqs bases.
The base-change map `g^*Rf_! → Rf′_!g′^*` of a cartesian square is the mate of §0.7's
pseudofunctor packaging, compatible with §F.2.1's proper exchange and with pasting of squares.
Prove that it is an isomorphism (lowerShriekBaseChange) on `D⁺` with torsion cohomology for every
`Λ`, and on the unbounded `D(X,Λ)` for torsion `Λ`, for every cartesian square of qcqs schemes,
with no Noetherian or invertibility hypothesis (Stacks 0F7L, 0G2A), with composition,
coefficient and finite-group coherence and proper/open agreement. For separated finite-type
`f:X→S` between Noetherian schemes, finite `Λ` killed by `N` invertible on `S` and
`K∈Dᵇ_ctf(X,Λ)`, the exchange stays in `Dᵇ_ctf`: F.3 compactSupportFiniteness supplies bounded
ctf preservation; for a non-Noetherian base change assert boundedness only on its verified domain.
(SGA 4 XVII §§3–5.) *Needs:* F.1 constructibleDerivedCategory, properBaseChange;
EnhancedDerivedSheaves §0.4; §§0.7–0.8; §§G.1–G.3.

**Checks.**

- Proper `f` recovers the proper exchange theorem.
- Open immersions recover extension-by-zero base change.
- Two cartesian squares yield the same exchange as their pasted square.
- Base change of `A¹_ℤ → Spec ℤ` along `Spec 𝔽_p → Spec ℤ` with `Λ = ℤ/p` is an isomorphism
  on torsion complexes although `p` is not invertible; only the `Dᵇ_ctf` statements need
  invertibility.

## F.2.5 Compact-support cohomology

**Compact-support cohomology.** VanishingCycles.compactSupportCohomology.
For separated finite-type `a:X→Spec k` define `RΓc(X,K)=RΓ(Spec k,Ra!K)` with the canonical
lower-shriek functor of §0.8 on its torsion domain; `RΓc` takes no compactification argument,
and its computation through a chosen compactification is lowerShriekIso. Build forget-supports, proper comparison,
field-extension exchange, localization, finite-open Mayer–Vietoris, twists and coherent
group actions. This construction has no finiteness assertion built into its definition.
(SGA 4 XVII §§5–6.) *Needs:* etaleCompactSupports;
§§0.7–0.8 / supportLocalization, properSupports.

**Checks.**

- `H⁰c(𝔸¹,Λ)=0` for nonzero invertible `Λ`, whereas `H⁰(𝔸¹,Λ)=Λ`.
- On a proper scheme forget-supports is an equivalence.
- An open–closed decomposition gives the compact-support connecting map.

## F.3.0 Geometric étale dimension bound

**Geometric étale dimension bound — `VanishingCycles.etaleCohomologicalDimension`.**
Let `X` be of finite type over a separably closed field `k` and `F` a torsion abelian sheaf on
`X_et` whose torsion orders are invertible in `k`: every section over a quasi-compact étale
`U → X` is killed by an integer invertible in `k`. Prove `Hᵠ(X,F)=0` for `q > 2 dim X`, with
Mathlib's `Sheaf.H` on `Scheme.smallEtaleTopology` and `dim X = topologicalKrullDim X`; this is
`VanishingCycles.etaleCohomologicalDimension`. For `K` of cohomological amplitude `[a,b]` with such
cohomology sheaves deduce the upper bound `b+2 dim X`, and for sheaves of `Λ`-modules apply the
bound to the underlying abelian sheaf. Use Mathlib's Krull dimension interface and build the
finite-type and fibre-dimension lemmas needed here. (SGA 4 X, XIV; Stacks §59.95 for the affine
bound and §59.96 for finiteness of the cohomological dimension.) *Needs:* F.1 finiteCoefficientCohomology and its
underlying-abelian comparison, §F.2.2 smoothBaseChange; SchemeAndStackFoundations finite-type geometry.

**Checks.**

- `ℙ¹` has nonzero `H²` with nonzero invertible constant coefficients.
- A geometric point has no positive cohomology.
- `Spec 𝔽_q` is outside the separably closed hypothesis and can have `H¹`.
- The empty scheme has `topologicalKrullDim = ⊥`, so the bound asks for vanishing in every degree,
  including degree `0`, and its cohomology is zero.

## F.2.6 Ordinary finite-coefficient étale Künneth

**Ordinary finite-coefficient étale Künneth.** VanishingCycles.etaleKunneth.
Define `K⊠L=p_X*K⊗ᴸ_Λ p_Y*L` once. For finite-type `X,Y` over separably closed `k`, a finite
ring `Λ` killed by an integer `n` invertible in `k`, and all `K ∈ D(X,Λ)` and `L ∈ D(Y,Λ)`,
unbounded and without constructibility, prove `RΓ(X,K)⊗ᴸ_Λ RΓ(Y,L) ≅ RΓ(X×_k Y,K⊠L)`, without
properness, smoothness or constant-coefficient restrictions (Stacks Lemma 59.97.9, tag 0F1P, for
`Λ = ℤ/n`; the same projection-formula argument over `Λ`). For `K, L ∈ Dᵇ_ctf` the perfectness
of both sides over `Λ` is the finiteness of §F.3, not part of this theorem. Prove the projection/exchange lemmas needed for the nonproper case by the
field-base-change argument, not by proper base change alone. Apply §F.3.0's
`VanishingCycles.etaleCohomologicalDimension` to obtain finite cohomological dimension
for sheaves of `Λ`-modules on each factor; this supplies the coefficient-specific bound
in the global-sections projection formula (Stacks 0F12) used in the proof of 0F1P.
More generally the same
canonical map is an equivalence whenever the exchange
`underline(RΓ(X,K)) ≅ Rp_Y*(p_X*K)`, the derived projection formula for `p_Y` and the projection
formula for global sections against `RΓ(X,K)` hold, and the tensor/global-section expressions
are bounded below with the required Tor bounds. These are explicit sufficient hypotheses
on arbitrary `k`-schemes. Retain Tor terms, cup products, pullbacks, base change, Koszul
symmetry, associativity, finite groups and coefficient reductions. (Stacks §59.97,
Lemmas 59.97.6–59.97.9; SGA 4 XVII §5; Milne, Abelian
Varieties, §12, proof of Theorem 12.1, p. 55, which applies the formula with field coefficients to
`A × A`.)
*Needs:* F.1, properBaseChange, smoothBaseChange; finite-coefficient projection/exchange
lemmas built here; §F.3.0 etaleCohomologicalDimension;
`ClassicalDerived.tensorHom` and scheme limits.

**Checks.**

- A geometric point gives the tensor unit.
- Swapping degree-one factors gives the Koszul sign `−1`, including its reduction at `ℓ=2`.
- On `A×A` for an abelian variety, this is ordinary cohomology with addition pullback.
- For `X=Y=𝔸¹_k`, both factors are nonproper but the coefficient-specific dimension bounds
  still supply the global-sections projection step.
- For `X` a point and the unbounded `K = ⊕_(i≥0) Λ[i]`, which is not in `Dᵇ_ctf`, both sides are
  `⊕_(i≥0) RΓ(Y,L)[i]`, since `RΓ(Y,−)` commutes with direct sums when `cd(Y)` is finite.

## F.3 Finiteness, Artin vanishing and generic acyclicity

**Affine torsion vanishing — `VanishingCycles.affineArtinVanishing`.**
For affine finite-type `X` over separably closed `k` and every torsion abelian sheaf `F` on `X_et`
(every section over a quasi-compact étale `U → X` is killed by a positive integer) prove
`Hᵠ(X,F)=0` for `q > dim X`; no condition on the torsion orders is needed, since a separably closed
field has cohomological dimension `0` (Stacks, Proposition 59.95.6, tag 0F0V). This is
`VanishingCycles.affineArtinVanishing`. For constructible `F` retain the sharper bound
`a>dim Supp F`. Over a general field apply the geometric bound to `X_k̄`; arithmetic amplitude
also requires finite `ℓ`-cohomological dimension of `k` for every coefficient prime.
(SGA 4 XIV §3; Stacks, Proposition 59.95.6, tag 0F0V.) *Needs:* F.1; the dimension lemmas of
§F.3.0.

**Checks.**

- A finite lisse sheaf on an affine smooth curve has `H²=0`.
- `ℙ¹` fails the affine hypothesis and has nonzero `H²`.
- A constructible skyscraper at a closed point has support-dimension bound zero.
- `Spec ℝ` with `ℤ/2` has cohomology in every nonnegative degree.
- In characteristic `p` the Artin–Schreier sequence gives `H¹(𝔸¹, ℤ/p) = k[t]/{g^p − g}`, which is
  nonzero (the class of `t`), and `H²(𝔸¹, ℤ/p) = 0`: `p`-torsion obeys the same bound, so a
  hypothesis excluding it would be narrower than the theorem.

**Proper constructibility, finiteness and ctf preservation.** VanishingCycles.etaleFiniteness.
For proper `f:X→Y` between Noetherian schemes and finite `Λ` annihilated by `N` invertible on `Y`,
prove constructibility of `Rⁱf*F` for constructible `F` and `Rf*K∈Dᵇ_ctf(Y,Λ)` for `K∈Dᵇ_ctf(X,Λ)`.
For proper finite-type `X` over separably closed `k` prove that every `Hⁱ(X,K)` is a finite
`Λ`-module, with bounded cohomological amplitude. Retain ordinary constructible direct-image
and generic-base-change results for finite-type field schemes and the excellent-trait
forms on their invertible coefficient domains. (SGA 4½ [Th. finitude] §§1–2.)
*Needs:* F.1 constructibleDerivedCategory; §§F.2.1–F.2.3; etaleCohomologicalDimension; SchemeAndStackFoundations §§0.9, 0.21.

**Checks.**

- A finite scheme over separably closed `k` has finite degree-zero cohomology.
- A proper smooth genus-`g` curve has finite `H¹` at each finite coefficient level.
- An infinite sum of finite sheaves need not be constructible and is not an admissible input.

**Lisse direct images and path-aware transport.** VanishingCycles.lisseDirectImageTransport.
For smooth proper `f` and finite lisse coefficients with invertible annihilator prove lissity
of `Rⁱf*K` and the geometric fibre stalk formula. More generally, for proper `f:X→S`, bounded
constructible `K` with finite invertible coefficients and a connected locally closed Noetherian
stratum `T⊂S`, put `f_T:X×_S T→T` and `K_T=K|_(X×_S T)`. Require constructibility of
`R(f_T)_*K_T` and ULA of `(f_T,K_T)`; deduce lissity of `Rⁱ(f_T)_*K_T` and identify it
with `(Rⁱf_*K)|_T` by proper base change. A supplied étale path transports
fibre cohomology, with identity/inverse/composition, cup/twist/group/reduction compatibility.
(SGA 4 XVI; SGA 1 V; Stacks Lemma 59.94.3, tag 0GJW.)
*Needs:* §F.0.2 finiteEtaleGaloisCategory; §§F.2.1–F.2.3; etaleFiniteness.

**Checks.**

- In a constant smooth proper family, paths with trivial coefficient monodromy transport identically.
- Changing the chosen path can produce nontrivial monodromy.
- The theorem supplies no comparison between points of different strata.
- For `j:𝔾_m→𝔸¹` over `ℂ`, let `𝓛` be the rank-one `𝔽_3` Kummer sheaf with monodromy
  `T=−1` from the quadratic cover. Then `(j,𝓛)` is ULA and `Rj_*𝓛≅j_!𝓛` is bounded
  constructible with every original geometric-fibre comparison, but is not lisse: its
  rank drops from one to zero at the origin. Here `T−1=−2` is invertible on `𝔽_3`;
  after `t=z²` the sheaf becomes constant and the new direct image has a nonzero
  boundary stalk, so arbitrary base change fails.

**Constructible compact-support finiteness and perfectness.** VanishingCycles.compactSupportFiniteness.
For separated finite-type `f` between Noetherian schemes, finite `Λ` killed by `N` invertible
on the base and `K∈Dᵇ_ctf` prove `Rf!K∈Dᵇ_ctf`. For separated finite-type `X` over separably
closed `k` prove finite `Hⁱc`, bounded amplitude and perfect `RΓc(X,K)` over `Λ`. Also prove the
ordinary finite-coefficient finiteness/perfectness on this geometric domain needed by F.4,
using ordinary constructibility and cohomological dimension; in particular, for `X` of finite type
over separably closed `k` and a finite abelian group `M` whose order is invertible in `k`, every
`Hⁱ(X, M)` of the constant sheaf is finite (`VanishingCycles.finite_H_constantSheaf`).
Separatedness is not needed there: a finite-type `k`-scheme is Noetherian, and finiteness passes
from affine opens to `X` by Mayer–Vietoris over a finite affine cover. Finite `Λ`-modules alone do not
establish perfectness; prove the global Tor bound from the ctf hypothesis.
(SGA 4½ [Th. finitude] §§1–2; SGA 4 XVII.) *Needs:* F.1; §§F.2.1, F.2.4–F.2.5; etaleFiniteness and geometric dimension;
§§G.1–G.3; §§0.7–0.8.

**Checks.**

- On `𝔸¹`, `H⁰c=0` while `H⁰=Λ` for nonzero invertible coefficients.
- `ℙ¹` has the proper comparison between ordinary and compact support.
- `ℤ/2` over `ℤ/4` on a point is excluded by ctf, although its cohomology module is finite.
- In characteristic `p`, `H¹(𝔸¹, ℤ/p) = k[t]/{g^p − g}` is infinite, so the order of `M` must be
  invertible in `k` for nonproper `X`; over the nonseparably closed `ℚ`, `H¹(Spec ℚ, ℤ/2) = ℚ^×/ℚ^×²`
  is infinite.

**Generic local acyclicity.** VanishingCycles.genericLocalAcyclicity.
For finite-type `f:Y→B` over a field, integral `B`, and bounded constructible `K` with coefficients
invertible on `B`, construct a dense open on which `(f,K)` is ULA, with base-change compatibility.
Excellent-trait applications use constructibility and generic base change on the stated
finite-type domains. (SGA 4½ [Th. finitude] §§1–2; Weil II, proof of 6.2.11.)
*Needs:* §§F.0.1–F.0.4, F.1–F.2.6; SchemeAndStackFoundations §§0.9, 0.21, 2.15.

**Checks.**

- A smooth constant family may take the whole parameter space as its acyclic open.
- For `x↦x²` in characteristic different from two, the acyclic open excludes zero.
- Restricting an acyclic open to a smaller dense open preserves ULA.

## F.2.7 Compact-support projection and Künneth

**Compact-support projection and Künneth.** VanishingCycles.etaleKunnethCompactSupport.
For every compactifiable `f:X→S` between qcqs schemes and every torsion `Λ`, prove that the
canonical projection map `Rf_!K⊗ᴸL → Rf_!(K⊗ᴸf*L)` is an isomorphism (`IsIso` of the named map)
for all `K` in `D(X,Λ)` and `L` in `D(S,Λ)`, unbounded and with no invertibility or finiteness
hypothesis (Stacks 0GL5). For separated finite-type `f` between Noetherian schemes, finite `Λ`
with invertible annihilator, `K∈Dᵇ_ctf(X,Λ)` and `L∈Dᵇ_ctf(S,Λ)`, both sides lie in
`Dᵇ_ctf(S,Λ)`. For separated finite-type `X,Y` over separably closed `k` with these
coefficients prove `RΓc(X,K)⊗ᴸRΓc(Y,L) ≅ RΓc(X×_k Y,K⊠L)`, using etaleKunneth's external
product. Include cup/external products, symmetry, associativity, base-change, action and
reduction coherence. (SGA 4 XVII §5.) *Needs:* etaleKunneth, etaleCompactSupports,
compactSupportCohomology, F.3 compactSupportFiniteness; EnhancedDerivedSheaves §0.3; §§0.7–0.8.

**Checks.**

- A point gives the compact-support tensor unit.
- Two `𝔸¹` computations give `𝔸²` with degree-four twist `−2`.
- Localization for `𝔾_m` commutes with external products.
- The projection formula holds for `A¹_(𝔽_p) → Spec 𝔽_p` with `Λ = ℤ/p`, where `p` is not
  invertible; only the Künneth clause and the `Dᵇ_ctf` bounds use invertibility.

## F.3a Henselian traits, inertia and the tame character

**Henselian traits.** VanishingCycles.HenselianTrait. A henselian trait is `S = Spec R` for a henselian discrete valuation ring
`R`, with closed point `s`, generic point `η`, a chosen separable closure `k(η̄)` of `k(η)` (the
geometric generic point `η̄`), the normalization `S̄` of `S` in `k(η̄)`, its closed point `s̄` and the
inclusions `j̄ : η̄ → S̄`, `ī : s̄ → S̄`. Because `R` is henselian the valuation extends uniquely to
`k(η̄)`, so `S̄` is local, and the residue field `k(s̄)` is an algebraic closure of `k(s)` that may be
purely inseparable over the separable closure `k(s)^sep`. The inertia group `I` is the kernel of
the specialization map `Gal(η̄/η) → Gal(s̄/s)`, a closed normal subgroup, and the specialization map
is surjective (Stacks 09ED applied to every finite Galois subextension, and the henselian property
for the limit). In Mathlib's terms the specialization map is `Ideal.Quotient.stabilizerHom` for the
integral closure `B` of `R` in `k(η̄)` and its maximal ideal, whose stabilizer is all of
`Gal(η̄/η)` because `R` is henselian, so `B` is local; its surjectivity for the profinite group
`Gal(η̄/η)` is `Ideal.Quotient.stabilizerHom_surjective_of_profinite`, and the inertia group is
its kernel, which is Mathlib's `ValuationSubring.inertiaSubgroup` (the kernel of
`MulSemiringAction.toRingAut` on the decomposition subgroup) for the valuation ring of `k(η̄)`
over `R`. Define VanishingCycles.HenselianTrait as this structure, with the generic and
special fibres of an `S`-scheme taken as Tau Ceti's `TauCeti.genericFiber` and
`TauCeti.specialFiber`. Sheaves on `Spec k` are continuous `Gal(k^sep/k)`-sets, by the Galois
description of F.0.

- VanishingCycles.HenselianTrait: A henselian trait `S = Spec R` with closed point `s`, generic point `η`, a geometric generic point `η̄`, the geometric closed point `s̄` and `S̄ = Spec` of the normalisation of `R` in `k(η̄)`.
- VanishingCycles.HenselianTrait.inertia: `I = ker(Gal(η̄/η) → Gal(s̄/s))`, a closed normal subgroup.
- VanishingCycles.HenselianTrait.inertia_exact: `1 → I → Gal(η̄/η) → Gal(s̄/s) → 1` is exact; surjectivity uses that `R` is henselian.
- VanishingCycles.HenselianTrait.genericFiber: The trait-indexed generic fibre is TauCeti.genericFiber, with its canonical pullback projection.
- VanishingCycles.HenselianTrait.specialFiber: The trait-indexed closed fibre is TauCeti.specialFiber over the residue field.

The fibre squares `X_η̄ → X_{S̄} ← X_s̄` induce the inverse- and direct-image adjunctions between the
small étale sites (Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`, through
§§F.2–F.3), and `Gal(η̄/η)` acts on `ī^*Rj̄_*` by transport
of structure, coherently for identities and composites. The open map is `j̄` over `S̄`: replacing
it by `j : η → S` loses the inertia action. (SGA 7 II, Exposé XIII, 0.2.5, p. 5 and Rappel 1.1.3,
p. 7; Illusie 2006, §1.1, pp. 1–2.)

*Needs:* Mathlib henselian DVRs and valuation inertia, `Ideal.Quotient.stabilizerHom_surjective_of_profinite`; Tau Ceti generic and special fibres; §§F.0.2, F.2.1–F.2.3 and F.3.

**Checks.**

- If `R` is strictly henselian then `Gal(s̄/s) = 1` and `I = Gal(η̄/η)`.
- For `R` the henselisation of `k[t]` at `(t)`, `k` algebraically closed of characteristic 0, `I = Gal(η̄/η) ≅ Ẑ(1)`, acting on `t^{1/n}` through `μ_n`.
- `I` coincides with Mathlib's `ValuationSubring.inertiaSubgroup` for the valuation subring of `k(η̄)` over `R`, as a subgroup of the decomposition group, which here is all of `Gal(η̄/η)`.
- For `R` the henselisation of `𝔽̄_p[t]` at `(t)`, `I` is not procyclic: the Artin–Schreier extensions `x^p − x = t^{-a}` (`p ∤ a`) give infinitely many independent `ℤ/p` quotients.
- For `Y = Spec k` the equivalence recovers `Gal(k̄/k)`-sets.
- For `X = S` the geometric nearby stalk is the generic representation, not its inertia
  invariants; using `j` in place of `j̄` changes the answer.

**The tame character.** Let `p ≥ 0` be the characteristic of `k(s)` and `ℓ ≠ p` a prime. For
every finite Galois extension `L/k(η)` inside `k(η̄)`, Stacks 09EE and 0BU4 give the wild inertia
`P_L` (a `p`-group, trivial when `p = 0`) and the tame character `θ_L : I_L/P_L ≅ μ_e(k(s̄))`, with
`e` the prime-to-`p` part of the ramification index. Define the wild inertia `P ⊂ I` as the inverse
limit of the `P_L` and the tame character `t_ℓ : I → ℤ_ℓ(1) = lim μ_{ℓ^n}(k(s̄))` as the inverse
limit of the `ℓ`-power parts of the normalized characters `θ_{L,can}` of Stacks 0BU8. Prove:

- VanishingCycles.tameCharacter_kummer: for a uniformizer `π` and `σ ∈ I`, `t_ℓ(σ) mod ℓ^n` is
  `σ(π^{1/ℓ^n})/π^{1/ℓ^n}`, and this does not depend on `π` or on the chosen root;
- VanishingCycles.tameCharacter_surjective: `t_ℓ` is surjective and continuous, with kernel
  containing `P`, and `I/P ≅ ∏_{ℓ' ≠ p} ℤ_{ℓ'}(1)`;
- VanishingCycles.tameCharacter_conj: `t_ℓ(gσg⁻¹) = g · t_ℓ(σ)` for `g ∈ Gal(η̄/η)` acting on
  `ℤ_ℓ(1)` through `Gal(s̄/s)` (Stacks 0BU5);
- VanishingCycles.tameCharacter_restrict: for a finite extension of henselian traits with
  ramification index `e` and inertia `I' ⊂ I`, `t_ℓ|_{I'} = e · t'_ℓ`: write `π = uπ'^e` with `u` a unit
  and apply the Kummer description above, the roots of `u` being fixed by `I'` (the finite-level
  characters are compatible in towers by Stacks 0BU7);
- VanishingCycles.tameCharacter_eq_inertiaTameCharacter: for `R` the valuation ring of a nonarchimedean local field `K`, identify trait inertia with the pinned `TauCeti.inertiaSubgroup K` and identify the residue Tate module with the roots-of-unity Tate module in `K^sep` by henselian lifting. Under these identifications `t_ℓ` is the `ℓ`-component of `TauCeti.inertiaTameCharacter`, hence `TauCeti.inertiaPadicTameCharacter` for `ℓ` prime to the residue characteristic. The comparison follows levelwise from the positive Kummer ratio `σ(π^(1/ℓⁿ))/π^(1/ℓⁿ)`.

(Stacks Project, Section 15.114, Lemma 09EE, Definition 0BU4, Lemma 0BU5, Lemma 0BU7, Remark 0BU8.)
*Needs:* Mathlib `HenselianLocalRing`, `IsDiscreteValuationRing`, `ValuationSubring.inertiaSubgroup`;
Tau Ceti `TauCeti.genericFiber`, `TauCeti.specialFiber`; F.0 and F.2–F.3; for the local-field comparison, pinned `TauCeti.inertiaTameCharacter`, `TauCeti.inertiaPadicTameCharacter`, `TauCeti.coe_proj_inertiaTameCharacter_apply` and henselian prime-to-residue roots-of-unity lifting.

**Checks.**

- For `R` the henselization of `k[t]` at `(t)` with `k` algebraically
  closed of characteristic 0, `I = Gal(η̄/η)` and `t_ℓ` is the `ℓ`-component of the isomorphism
  `I ≅ Ẑ(1)` given by the action on the roots `t^{1/n}`.
- For `R' = R[π^{1/2}]` with `p ≠ 2`, `e = 2` and `t_ℓ` restricted
  to `I'` is twice the new character; a definition that ignored `e` would fail this.
- Over a local field, the comparison sends every `ℓⁿ`-level Kummer ratio to the pinned character with the same positive direction; changing the uniformizer by a unit leaves it unchanged.
- For `R` the henselization of `𝔽̄_p[t]` at `(t)`, every element of `P`
  has `t_ℓ = 0`, while `P` is nonzero (Artin–Schreier extensions).

**Ring structure and geometric points of a trait.** The ring hypotheses of
VanishingCycles.HenselianTrait are instance fields: a commutative ring `R` in universe `u` with
`IsDiscreteValuationRing R` and `HenselianLocalRing R` instances, and a separable closure of its
fraction field with Mathlib's `IsSepClosure` instance. Define genericGeometricPoint, the
geometric point of `S = Spec R` given by that separable closure, and closedGeometricPoint, given
by `SeparableClosure (IsLocalRing.ResidueField R)`. The closed point `s̄` of the normalization
`S̄`, with algebraically closed residue field, gives the same stalks as closedGeometricPoint by
§F.0.1's isIso_toPoint_map, and `Gal(k(s̄)/k(s))` restricts isomorphically to
`Gal(k(s)^sep/k(s))`, so the inertia group and the specialization map above are unchanged. A
strictly henselian trait is a henselian trait with `IsSepClosed (IsLocalRing.ResidueField R)`,
the strict henselianity of ModularCurves Layer 4D (`HenselianLocalRing` together with a
separably closed residue field). Define ofStrictHenselization: for a discrete valuation ring `R`
and a separable closure `Ω` of its residue field, Tau Ceti's strict henselization
`TauCeti.StrictHenselization.algebra R Ω` as a strictly henselian trait. Its fields are consumed,
not reproved: it is henselian local (`TauCeti.StrictHenselization.henselianLocalRing`), its
residue field is separably closed (ModularCurves Layer 4D,
`isSepClosed_residueField_strictHenselization`, Stacks 04GP), it is a discrete valuation ring,
and an irreducible element of `R` stays irreducible in it (ModularCurves Layer 4D,
`StrictHenselization.isDiscreteValuationRing_algebra` and
`StrictHenselization.irreducible_algebraMap`, Stacks 0AP3, whose route goes through
`isNoetherianRing_strictHenselization_iff`, Stacks 06LJ, and Tau Ceti's
`TauCeti.StrictHenselization.maximalIdeal_eq_map`, Stacks 04GP). This section adds only the
packaging as a trait with its separable closure of the fraction field. *Needs:* Mathlib
`IsDiscreteValuationRing`, `HenselianLocalRing`, `IsSepClosure`, `SeparableClosure`; §F.0.1
geometric points; Tau Ceti's strict henselization (supplier table); ModularCurves Layer 4D.

**Checks.**

- For `R` the henselization of `ℤ_(p)`, closedGeometricPoint has residue field `𝔽̄_p` and is the
  closed point of the normalization.
- For `R` the henselization of `𝔽_p(x)[t]` at `(t)`, the separable closure and the algebraic closure
  of the residue field `𝔽_p(x)` differ, and the two closed geometric points give isomorphic stalks.
- ofStrictHenselization of `ℤ_(p)` is a discrete valuation ring with residue field `𝔽̄_p` that is
  not complete; its inertia group is the whole Galois group, as for every strictly henselian
  trait in the Checks of the henselian traits above.

## F.4.0 Stable lattices and integral models

The representation carrier, the stable-lattice theorem and integral models are Tau Ceti's (supplier table). `TauCeti.ContinuousRep Γ A M` is a Mathlib `Representation A Γ M` whose action map `Γ × M → M` is jointly continuous, with equivariant continuous isomorphisms `TauCeti.ContinuousRep.Iso`, character lines `TauCeti.ContinuousRep.ofCharacter` and scalar extension `TauCeti.ContinuousRep.baseChange` along a continuous coefficient map, which uses Tau Ceti's `Representation.baseChange`. For `V` finite-dimensional with its module topology over a nonarchimedean local field `E` with valuation ring `O_E = 𝒪[E]`, `Subgroup.isCompact_closure_iff_exists_stable_lattice` says that a subgroup of `GL(V)` stabilizes an `O_E`-lattice exactly when its closure is compact (DDT, §2.1, p. 54, paragraph after Proposition 2.6; Ribet 1976, §2, p. 154). `TauCeti.GaloisLattice.IntegralModel O ρ` is a `Γ`-stable full lattice in Mathlib's sense (`Submodule.IsLattice`), with its restricted action `TauCeti.GaloisLattice.IntegralModel.toContinuousRep`, homothety by `Eˣ`, sums and intersections, the equivariant generic-fibre isomorphism `TauCeti.GaloisLattice.IntegralModel.genericFiberIso` as data, existence `TauCeti.GaloisLattice.IntegralModel.nonempty` for a compact group over a field with a valuative topology, and commensurability `TauCeti.GaloisLattice.IntegralModel.exists_pow_le` over a discrete valuation ring. This section adds what Tau Ceti lacks. Finite `E/ℚ_ℓ` with `O = O_E` is the case used by adic consumers.

**Matrix form of the stable-lattice theorem.** Tau Ceti proves that every lattice `Λ ⊂ V` is compact and open and that its stabilizer in `V ≃ₗ[E] V` is compact and open (`Submodule.IsLattice.isOpen`, `Submodule.IsLattice.isCompact`, `Submodule.IsLattice.isOpen_stabilizer`, `Submodule.IsLattice.isCompact_stabilizer`, in `TauCeti/NumberTheory/LocalField/Lattice.lean`); these are consumed as they stand. Prove that, in an `O_E`-basis of `Λ` of size `n = dim V`, this stabilizer is `GL_n(O_E)`, and that a jointly continuous action of a compact group `Γ` on `V` is, in a basis of a stable lattice supplied by Tau Ceti's `TauCeti.ContinuousRep.exists_stable_lattice`, a continuous homomorphism `Γ → GL_n(O_E)`. (DDT, §2.1, p. 54, paragraph after Proposition 2.6; BHKT, Theorem 4.8(ii), p. 16.) *Needs:* Tau Ceti `Subgroup.isCompact_closure_iff_exists_stable_lattice`, `TauCeti.ContinuousRep.exists_stable_lattice` and the lattice topology above; Mathlib finite-dimensional module topology and matrices.

**Checks.**

- Over `E = 𝔽_q((t))` the standard lattice `𝔽_q[[t]]ⁿ` has compact open stabilizer `GL_n(𝔽_q[[t]])`, including the equal-characteristic case.
- In dimension zero the zero lattice is the unique lattice, and the matrix form is the trivial homomorphism to `GL_0(O_E)`.
- The cyclic subgroup of `GL_1(ℚ_ℓ)` generated by `ℓ` has noncompact closure and stabilizes no lattice: `ℓ·ℓᵃℤ_ℓ = ℓᵃ⁺¹ℤ_ℓ ≠ ℓᵃℤ_ℓ` for every `a ∈ ℤ`.
- A nonzero `E`-vector space is not a lattice over `O_E`: it is not finitely generated over `O_E`.

**Saturation and dual lattices.** Let `O` be a discrete valuation ring with fraction field `E` and `Λ` an integral model of `ρ` over `O`. For a `Γ`-stable subspace `W ⊂ V`, prove that `W ∩ Λ` is an integral model of the restriction of `ρ` to `W` and that the image of `Λ` in `V/W` is an integral model of the quotient representation, with `Λ/(W ∩ Λ)` torsion-free, so that `0 → W ∩ Λ → Λ → Λ/(W ∩ Λ) → 0` splits over `O`. Define the dual lattice `Λ^∨ = {λ ∈ V^∨ : λ(Λ) ⊂ O}`; for a group `Γ`, prove that it is an integral model of the contragredient representation, that `Λ ↦ Λ^∨` reverses inclusion and sends `cΛ` to `c⁻¹Λ^∨` for `c ∈ Eˣ`, and that the biduality isomorphism `V ≅ V^∨∨` carries `Λ` onto `Λ^∨∨`. (Elementary arguments with lattice bases over a discrete valuation ring.) *Needs:* Tau Ceti `TauCeti.GaloisLattice.IntegralModel` and its instances; Mathlib `Submodule.IsLattice`, `Module.Dual` and finite free modules over a discrete valuation ring.

**Checks.**

- For a continuous character `χ : Γ → ℤ_ℓ^×`, the integral models of the line `ℚ_ℓ(χ)` are the `ℓᵏℤ_ℓ`, `k ∈ ℤ`, and the dual of `ℓᵏℤ_ℓ` is the model `ℓ⁻ᵏℤ_ℓ` of `ℚ_ℓ(χ⁻¹)`. The `ℚ_ℓ^×`-valued character `χ(n) = ℓⁿ` of the discrete group `ℤ` has no integral model.
- The additive group `ℤ_ℓ` acts on `ℚ_ℓ²` by `a ↦ [[1,a],[0,1]]`. The line `W = ℚ_ℓe₁` is stable, `W ∩ ℤ_ℓ² = ℤ_ℓe₁`, and the quotient model is `ℤ_ℓ·ē₂`. The stable lattices `ℤ_ℓ²` and `ℤ_ℓe₁ ⊕ ℓℤ_ℓe₂` are not homothetic; the dual of the second is `ℤ_ℓe₁^∨ ⊕ ℓ⁻¹ℤ_ℓe₂^∨`, stable under the contragredient matrices `[[1,0],[−a,1]]`. Allowing `a = ℓ⁻¹` would not preserve `ℤ_ℓ²`.
- The zero representation has only the zero model, whose dual is the zero model of the zero dual.

**Basis-free representations and their sheaf-level counterparts.** Representations of étale fundamental groups are `TauCeti.ContinuousRep Γ E V` on finite-dimensional `E`-vector spaces, never homomorphisms to `GL_n` with a separate continuity statement; a basis enters only through the matrix form above. The sheaf-level counterparts are targets of §F.4.5, where lisse `E`-sheaves exist: the lattice of a lisse `E`-sheaf corresponds to a `TauCeti.GaloisLattice.IntegralModel` of its monodromy representation, and lisseRepresentationEquiv identifies lisse `E`-sheaves admitting a global lattice with these representations of §F.0.2's `EtaleFundamentalGroup`.

**Checks.**

- The trivial representation of a profinite `Γ` on `E` has the integral models `ϖᵏ𝒪_E`, `k ∈ ℤ`, for a uniformizer `ϖ`, and no others.
- Restricting a continuous representation of `EtaleFundamentalGroup` along `EtaleFundamentalGroup.map` of §F.0.2 is again a `TauCeti.ContinuousRep`; the restriction is computed without choosing a basis.

## F.10.1 Finite-field descent and rational-point fixed points

Scheme Frobenius is supplied by SchemeAndStackFoundations §0.29, with the interface Checks in §F.0.4. Coefficient objects carry descent data over `k`. Geometric Frobenius is the inverse of arithmetic field Frobenius; cohomological traces use geometric Frobenius and compact support.

**Finite-field descent and rational-point fixed points.** VanishingCycles.frobeniusFixedPoints.
For a finite field `k` (`[Field k] [Finite k]`) of cardinality `q` with chosen algebraic closure
`k̄`, VanishingCycles.arithmeticFrobenius is Mathlib's `FiniteField.frobeniusAlgEquivOfAlgebraic`
of `k̄` over `k`, the `k`-automorphism `x ↦ x^q`, and VanishingCycles.geometricFrobenius is its
inverse. This is the only geometric Frobenius automorphism of the roadmap: §F.0.1's stalk
Frobenius, §F.0.A2's Frobenius classes and Weil group and the cohomological Frobenius of
§§F.10.2–F.10.2b are induced by it. The fixed field of the `r`-th power of arithmetic Frobenius,
`r ≥ 1`, is the degree-`r` field `k_r ⊂ k̄` with `qʳ` elements; this is Tau Ceti's
`TauCeti.natCard_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow` and
`TauCeti.finrank_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow`, consumed as they stand; for
`r = 0` the fixed field is all of `k̄`, which is infinite. Points are Tau Ceti's: the natural
equivalence `X(k_r) ≃ Fix(Frobʳ on X(k̄))`, `Frob` the arithmetic Frobenius, for every `k`-scheme `X` is
`AlgEquiv.fromSpecFixedFieldEquiv` for the `r`-th power of VanishingCycles.arithmeticFrobenius, and
its count is `AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard`; give the geometric
inverse-power formulation, which has the same fixed points. Coordinate action is `x↦x^q`; preserve
maps, products, coproducts and changes of algebraic closure. The number of points is Tau Ceti's
`Scheme.Hom.numberOfRationalPoints`, `Nat.card` of the over-`Spec k` morphism type with no
finiteness hypothesis on the definition, and its multiplicativity for fibre products over any
ground field is `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints_pullback`, with `Nat.card`
retaining its value zero on infinite point sets; neither is redefined here.
VanishingCycles.rationalPoints_finite gives point finiteness for finite-type `X` over finite `k`
and any finite extension `L/k`, by a finite affine cover. The power formula is Mathlib's
`FiniteField.coe_frobeniusAlgEquivOfAlgebraic_iterate` with `AlgEquiv.coe_pow`. (Mathlib
`FieldTheory/Finite/Basic.lean`, `FiniteField.frobeniusAlgEquivOfAlgebraic` and its iterate
theorem; Stacks, Definition 64.3.4 (03SQ) and the proof of Theorem 64.16.1 (03UG), step 2, for the
`k`-rational points as the points of `X_k̄` fixed by the geometric Frobenius of `X`.)
*Needs:* Mathlib finite fields, algebraic closures, `Nat.card`, scheme spectra and affine
covers; Tau Ceti `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`,
`AlgEquiv.fromSpecFixedFieldEquiv`, `AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard` and
the fixed-field theorems above; the supplied `qPowerFrobenius` only for conversion to scheme maps.

**Checks.**

- `Spec k_m` has `m` `k_r`-points when `m` divides `r`, and none otherwise.
- `𝔸¹` has `qʳ` fixed points of arithmetic `Frobeniusʳ`.
- The point equivalence for a product is the product of the two point equivalences; for finite-type factors the rational-point count is multiplicative.
- Arithmetic and geometric Frobenius compose to the identity in both orders.

**Point counts over finite extensions — Scheme.Hom.pointCount.** For `f : X ⟶ Spec k` with `k`
finite of cardinality `q` and `r : ℕ`, define Scheme.Hom.pointCount f r as
`Scheme.Hom.numberOfRationalPoints` of the splitting field of `X^(qʳ) − X` over `k`, a model of the
degree-`r` extension in the universe of `k`. Prove Scheme.Hom.pointCount_eq_numberOfRationalPoints:
for every finite extension `E/k` of degree `d`, the count at `d` is the number of `E`-points, so
the count does not depend on the model of the extension. Route: `E` has `q^d` elements, so it is a
splitting field of `X^(q^d) − X` over `k` (Mathlib's `FiniteField.isSplittingField_sub`) and is
`k`-isomorphic to the model (`Polynomial.IsSplittingField.algEquiv`), and the number of points is
invariant under `k`-isomorphisms of the field of values. Prove VanishingCycles.frobeniusFixedPoints:
for `r > 0` and an algebraic closure `k̄`, the count at `r` is the number of `k̄`-points fixed by
the `r`-th power of VanishingCycles.arithmeticFrobenius, with no finite-type hypothesis. Route:
apply the model independence to the fixed field of that power, which has degree `r` by
`TauCeti.finrank_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow`, and count its points by
`AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard`. The statements are for a morphism to
`Spec k`, with `[Finite k]`; they use no site and no lifted field. The zeta series of `X` is formed
from these counts; it belongs to WeilConjectures, a downstream consumer, and this roadmap defines
no zeta series. (Mathlib `FieldTheory/Finite/GaloisField.lean` for the uniqueness of the field
with `q^d` elements; Stacks, proof of Theorem 64.16.1 (03UG), step 2, for the fixed points.)
*Needs:* Tau Ceti `Scheme.Hom.numberOfRationalPoints`, `AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard`
and `TauCeti.finrank_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow`; Mathlib
`Polynomial.SplittingField`, `FiniteField.isSplittingField_sub`,
`Polynomial.IsSplittingField.algEquiv`, `Module.finrank`.

**Checks.**

- For `X = Spec k`, the count over the degree-`r` extension is `1` for every `r ≥ 1`.
- For `𝔸¹_k` the count at `r` is `qʳ`, and for `ℙ¹_k` it is `qʳ + 1`.
- For `X = Spec 𝔽_(q²)` over `𝔽_q`, the count at `r` is `2` for even `r` and `0` for odd `r`.
- At `r = 0` the model is the splitting field of `X − X = 0`, which is `k` itself, and the count is
  the number of `k`-points; the fixed-point formula is not asserted there, since the fixed field of
  the identity is the infinite field `k̄`.

## F.10.2 Scheme/descent Frobenius comparison, finite coefficients

**Scheme/descent Frobenius comparison.** VanishingCycles.frobeniusCohomology.
For finite-field `X` with a descended finite coefficient object, construct the canonical
coefficient identifications for `qPowerFrobenius` pullback and semilinear arithmetic descent
on `X_k̄`. Prove the comparison diagrams: after the universal-homeomorphism identification,
the `q`-power scheme pullback is the geometric cohomological action, inverse to arithmetic
Galois action. Carry the coefficient map as part of the statement, especially for twists;
there is no automatic action on an arbitrary complex given only on `X_k̄`. Prove all `r`-power,
Tate-twist, finite-group and coefficient-reduction compatibilities at finite level. (SGA 4½ [Rapport] §§1–2; Weil I §§1–2.)
*Needs:* F.1 finiteCoefficientCohomology; §F.0.4 universalHomeomorphismEtaleEquivalence;
frobeniusFixedPoints and the supplied absolute/relative/`q`-power scheme maps. The finite-level bridge uses only these inputs.

**Checks.**

- Arithmetic Frobenius on `μ_(ℓⁿ)` multiplies the Tate coordinate by `q`.
- Geometric Frobenius on `μ_(ℓⁿ)` acts by `q⁻¹` modulo `ℓⁿ`.
- On the finite constant sheaf of a geometric point, the scheme/descent comparison gives the identity action.

**The Frobenius comparisons as theorems.** The scheme map is SchemeAndStackFoundations'
`SchemeFrobenius.qPowerFrobenius`, reused and not redefined, and the Galois automorphism is
§F.10.1's VanishingCycles.geometricFrobenius. State the four comparisons as separate theorems
about these two maps, each with its coefficient identification: absolute Frobenius acts as the
identity on the étale site and on étale cohomology (Stacks 03SN); pullback along the `q`-power
Frobenius with its canonical coefficient isomorphism is the Frobenius descent action (Stacks
03SR); the geometric action on cohomology of `X_k̄` is the inverse of the arithmetic Galois action
(Stacks 03SV); and at a rational point it restricts on stalks to §F.0.1's stalk Frobenius
(Stacks 03SW). No second Frobenius on stalks or cohomology is defined. *Needs:* the comparison
above; §§F.0.1, F.10.1.

**Checks.**

- On `Spec 𝔽_q` with the constant coefficient `ℤ/ℓ`, all four comparisons are the identity.
- On `μ_ℓ` over `Spec 𝔽_q`, the stalk action of 03SW is multiplication by `q⁻¹` on the
  coordinate, in agreement with 03SV.

## F.4.1 Normalized bounded constructible systems

VanishingCycles.adicRealization indexes §§F.4.1–F.4.6. Generic limits and completion are EnhancedDerivedSheaves §0.3, with module comparisons supplied by DerivedModuleAlgebra §§1.1–1.5 and 1.T.1.

**Normalized bounded constructible systems.** VanishingCycles.normalizedAdicSystems.
The coefficients are a Noetherian pair `(Λ, I)`: a Noetherian commutative ring `Λ` and an ideal
`I` with `Λ/I` finite. For every scheme `X` form the adic systems AdicSystem X (Λ, I): objects
`K_n` of `D(X,Λ_n)`, `Λ_n=Λ/Iⁿ`, `n≥1`, with isomorphisms `K_(n+1)⊗ᴸ_(Λ_(n+1))Λ_n≅K_n` as data.
The definition carries no hypothesis; the theorems of §§F.4.1–F.4.6 that need it assume
Scheme.IsInvertibleOn (ringChar (Λ/I)) X, which makes every `ringChar Λ_n` invertible on `X`
because `Λ_n` is killed by a power of `ringChar (Λ/I)`. Completeness of `Λ` is not assumed: with
`Λ̂ = lim Λ/Iⁿ` the `I`-adic completion, `Λ_n = Λ̂/Iⁿ Λ̂`, so systems over `(Λ, I)` and over
`(Λ̂, IΛ̂)` coincide, and the pro-étale side of §F.4.3 uses the complete ring `Λ̂`. The pair `(ℤ_ℓ, (ℓ))` gives `Λ_n=ℤ/ℓⁿ`, and
`(𝒪_E, 𝔪_E)` for a finite `E/ℚ_ℓ` gives the `𝒪_E`-systems as the same kind of object, with no
separate definition. Normalization is a `Prop`-valued membership: every `K_n` lies in
`Dᵇ_ctf(X,Λ_n)` and the cohomological and Tor intervals are common to all `n`, rather than
bounds stored in the object. §F.4.3 compares these systems with the constructible complexes of
the pro-étale site (Bhatt–Scholze, Definition 6.5.1; Stacks, Definition 61.29.1, tag 09C1) and
with its module-object model of `E` and `ℚ̄_ℓ` coefficients. The sheaf-level notions, constructible
and adic constructible `Λ`-sheaves on the pro-étale site, are Stacks, Definition 61.28.1, tag 09BT.
Build morphisms, equivalences, shifts, cones, pullback, constant/lisse fixed-rank systems,
twists, finite groups, tensor with uniform bounds and internal Hom for uniformly perfect
sources. Admit ambient truncations only when their finite-Tor/uniform conditions hold.
(Bhatt–Scholze, Definition 5.5.2, for Ekedahl's adic systems with isomorphic reductions; SGA 5
VI.) *Needs:* §§F.0.1–F.0.4, F.1;
EnhancedDerivedSheaves §0.3 inverseLimits and derivedCompletion.

**Checks.**

- The constant tower `Λ_n` with its quotient transitions is normalized.
- Unrelated ranks at successive levels cannot satisfy derived normalization.
- All reductions detect zero for a derived-complete object.
- For `E = ℚ_ℓ(√ℓ)` the levels of the constant `(𝒪_E, 𝔪_E)`-system are `𝒪_E/𝔪_Eⁿ`, so
  `Λ_2 = 𝒪_E/ℓ` has length two over `Λ_1 = 𝔽_ℓ`; a definition indexed by powers of `ℓ` would
  skip the odd levels.

## F.4.2 Classical realization and finite-level cohomology limits

**Classical realization and finite-level cohomology limits.** VanishingCycles.classicalAdicRealization.
Define `K_Zℓ=Rlim_n K_n` in the enhanced small-étale sheaf category. Cohomology of the
realization is primitive; prove `RΓ(X,K_Zℓ)≅Rlim RΓ(X,K_n)`. Construct the adic lower-shriek
operation from the normalized finite-level operation, with its reduction/continuity maps,
and prove `RΓc(X,K_Zℓ)≅Rlim RΓc(X,K_n)` under the uniform finite-level bounds and finiteness/ML
conditions of F.3; §F.4.4 proves the resulting integral finiteness. On wider domains explicitly require that the
canonical derived-continuity maps for the relevant functors are equivalences. Keep Milnor
and `lim¹` terms, reductions, proper/`Rf!` comparison, cup/group/coefficient coherence.
Do not apply the torsion `D⁺` lower-shriek construction directly to a discrete `ℤ_ℓ` sheaf.
(Bhatt–Scholze §§5–6; Illusie 1994 §4.4.) *Needs:* normalizedAdicSystems;
F.2–F.3 finite-level operations and finiteness; EnhancedDerivedSheaves §0.3.

**Checks.**

- A separably closed point gives `ℤ_ℓ` in degree zero.
- The `μ_(ℓⁿ)` tower with its power transition maps realizes the Tate object.
- Without ML, the Milnor sequence retains a possibly nonzero `lim¹` term.

## F.4.3 Classical/pro-étale realization comparison

**Classical/pro-étale realization comparison.** VanishingCycles.etaleProetaleAdicComparison
consists of the comparison morphism `ν` and the comparison of realizations through it.

**The comparison morphism `ν`.** Every étale `U → X` is weakly étale (Mathlib's
`etale_le_weaklyEtale`), so it is an object of Mathlib's small pro-étale site `X.ProEt`. The
inclusion functor from `X.Etale` to `X.ProEt` is Mathlib's `MorphismProperty.Over.changeProp`
along that inequality, both sites being `MorphismProperty.Over` categories over `X`; it is fully
faithful there and is not defined again. Prove that it is continuous for `Scheme.smallEtaleTopology X` and `Scheme.ProEt.topology X`
and preserves finite limits; it gives the morphism of sites `ν : X_proet → X_et`. With pro-étale
coefficients `ModuleCat.{u+1} Λ`, define `ν_*` as Mathlib's `Functor.sheafPushforwardContinuous`
of the inclusion and `ν^*` as its left adjoint `Functor.sheafPullback`, with the adjunction
`ν^* ⊣ ν_*`; universe-`u` étale coefficients are first transported along `ModuleCat.uliftFunctor`,
the only change of universe for étale coefficients. Prove that `ν^*` is fully faithful on sheaves
(Bhatt–Scholze Lemma 5.1.2), exact and fully faithful on `D⁺(X_et, Λ)` with unit `K ≅ Rν_*ν^*K`
(Bhatt–Scholze Corollary 5.1.6); that `ν` is natural in `X`: for `f : X → Y` the inclusion
functors commute with base change along `f`, so the derived `ν^*` commutes with pullback along `f`
(Bhatt–Scholze Lemma 5.4.1); and that the constant pro-étale sheaf `ℤ/ℓⁿ`, the image of the
constant étale sheaf under `ν^*`, is `U ↦ C(U, ℤ/ℓⁿ)` (Bhatt–Scholze Lemma 4.2.12). *Needs:*
Mathlib `Scheme.ProEt`, `Scheme.ProEt.topology`, `MorphismProperty.Over.changeProp`,
`etale_le_weaklyEtale`, `Functor.sheafPushforwardContinuous`, `Functor.sheafPullback`, `ModuleCat.uliftFunctor` and `MorphismProperty.Over.pullback` (base change
of the étale and weakly étale slices); SchemeAndStackFoundations §2.17 (repleteness and
w-contractible covers).

**Checks.**

- For `X = Spec k` with `k` separably closed, `ν^*` of a finite set `T` is `U ↦ C(U, T)` on profinite
  sets; for `T = ℤ/ℓ` its global sections are `ℤ/ℓ`, the global sections of `T` on `X_et`.
- The unit `K → Rν_*ν^*K` is an isomorphism for `K ∈ D⁺(X_et)` and not for every unbounded `K`
  (Bhatt–Scholze Remark 5.1.8), so full faithfulness is asserted on `D⁺` only.
- For `X = Spec ℚ`, the tower `μ_(ℓⁿ)` with surjective transitions has limit `0` in `Sh(X_et)`,
  while `lim ν^*μ_(ℓⁿ)` has the nonzero sections `ℤ_ℓ(1)` over `Spec ℚ̄`: `ν^*` does not commute
  with inverse limits.

**Classical/pro-étale comparison.** Through `ν`, construct the finite-torsion comparison and the
adic comparison. For locally Noetherian `X` and normalizedAdicSystems' bounded objects, form
`K_pro=Rlim ν*K_n` and prove `Rν*K_pro≅K_Zℓ`, with ordinary and, on F.2's separated finite-type
domain, adic compact-support cohomology comparison. This is derived pushforward comparison;
it does not assert that `ν*` commutes with inverse limits on the small étale site.
Identify the constant pro-étale realization with `ℤ_ℓ,X` below, Mathlib's `Scheme.ellAdicSheaf`
lifted along `AddCommGrpCat.uliftFunctor.{u+1}`, and its degreewise cohomology with
`Scheme.EllAdicCohomology`, which is that lift's `Sheaf.H` by definition. The passage from universe
`u` to `u+1` is the transport along `ModuleCat.uliftFunctor` inside `ν^*` for étale coefficients
and Mathlib's lift for `ℤ_ℓ,X`, the only two changes of universe in the roadmap, and no statement
here lifts a coefficient ring. Prove reductions
and proper/smooth/`Rf!` exchange, cup/Künneth and group/Galois compatibility on their proved
domains. (Bhatt–Scholze §§5–6, especially §6.8; Mathlib Sites/ElladicCohomology.lean.)
*Needs:* normalizedAdicSystems, classicalAdicRealization;
SchemeAndStackFoundations §2.17 (repleteness, w-contractible covers, left completeness);
F.2 exchanges and EnhancedDerivedSheaves §0.3.

**Checks.**

- Constant pro-étale reductions recover `Λ_n` at every `n`.
- A nonconstant finite lisse system retains its monodromy under comparison.
- Each comparison square commutes with the `n+1→n` coefficient reduction.

**Pro-étale coefficient ring objects.** On `X_proet` define the coefficient ring objects:
the underlying abelian sheaf of `ℤ_ℓ,X` is
`(sheafCompose _ AddCommGrpCat.uliftFunctor.{u+1}).obj (X.ellAdicSheaf ℓ)`, the lift to `Ab.{u+1}`
of Mathlib's `Ab.{u}`-valued `Scheme.ellAdicSheaf ℓ` (`U ↦ C(U, ℤ_ℓ)`), by definition and not up
to isomorphism, so that its `Sheaf.H n` is `Scheme.EllAdicCohomology X ℓ n` by definition; for a finite `E/ℚ_ℓ`, `𝒪_E,X` is `U ↦ C(U, 𝒪_E)` and `E_X` is `U ↦ C(U, E)`; and
`ℚ̄_ℓ,X` is the sheaf of continuous maps to `PadicAlgCl ℓ` that locally take values in a finite
extension of `ℚ_ℓ`, the filtered colimit of the `E_X`. Coefficient objects are module objects
over these ring objects (Mathlib's `ModObj` on the monoidal category of `Ab.{u+1}`-valued sheaves
on `X_proet`); lisse objects are those locally free of finite rank and constructible objects are
defined by finite stratifications with lisse restrictions, one predicate each for every
coefficient ring object. Change of coefficients along `ℤ_ℓ → 𝒪_E → E → ℚ̄_ℓ` is scalar extension
of module objects. Extend the comparison above from `ℤ_ℓ` to every Noetherian pair `(Λ, I)` of
§F.4.1: with `Λ̂ = lim Λ/Iⁿ`, complete for the `I`-adic topology as in Bhatt–Scholze §6.5, and
for Noetherian `X`, normalized `(Λ, I)`-systems correspond to the constructible complexes of
`D(X_proet, Λ̂)` in the sense of Bhatt–Scholze Definition 6.5.1 (Stacks 09C1), which on a
Noetherian scheme are those locally constant along a finite stratification (Bhatt–Scholze
Proposition 6.6.11), through `ν^*` levelwise followed by derived limit, compatibly with reductions.
This classical/pro-étale comparison is the one theorem relating the two models of adic
coefficients. *Route.* Bhatt–Scholze Proposition 5.5.4 identifies Ekedahl's adic systems
(Definition 5.5.2) with the complete pro-étale complexes whose reduction has classical cohomology
(Definition 5.5.3) under condition (A) or (B) of Definition 5.5.1. Normalized systems need neither
condition. Their common cohomological interval bounds every `K_n` above and below uniformly. So the
derived limit is an equivalence from complete bounded-above systems to complete bounded-above
complexes (Bhatt–Scholze Lemma 3.5.7 (4)), and levelwise `ν^*` is fully faithful on bounded-below
complexes with essential image those with classical cohomology (Bhatt–Scholze Proposition 5.2.6).
This is the argument of the condition-(B) half of Proposition 5.5.4, with the uniform bound of the
definition in place of condition (B). (Bhatt–Scholze Definitions 5.5.1–5.5.3, Proposition 5.5.4,
Lemma 3.5.7, Proposition 5.2.6, Definition 6.5.1, Lemmas 6.5.3–6.5.4 and Proposition 6.6.11;
Stacks 09C1.) *Needs:* §F.4.1; the comparison morphism `ν` above; SchemeAndStackFoundations
§2.17; Mathlib `Scheme.ellAdicSheaf`, `AddCommGrpCat.uliftFunctor`, `sheafCompose`, `PadicAlgCl`,
`ModObj`.

**Checks.**

- `ℤ_ℓ,X` on `Spec 𝔽̄_p` has global sections `ULift ℤ_ℓ`, the group `ℤ_ℓ` in universe `u+1`, and
  `ℚ̄_ℓ,X` has global sections the algebraic closure `PadicAlgCl ℓ`, not its completion. On the
  empty scheme `ℤ_ℓ,X` is zero, in agreement with Mathlib's `Subsingleton` instance on
  `Scheme.EllAdicCohomology` of an empty scheme; taking the unlifted `Ab.{u}`-valued
  `Scheme.ellAdicSheaf ℓ` instead would leave the universe-`u+1` sheaf category in which
  `Scheme.EllAdicCohomology` and the module objects above are formed.
- On a profinite set `S` viewed as a pro-étale object over a separably closed field, a continuous
  map `S → PadicAlgCl ℓ` taking infinitely many values of unbounded degree over `ℚ_ℓ` is not a
  section of `ℚ̄_ℓ,X`.
- The tower `μ_(ℓⁿ)` corresponds under the comparison to the pro-étale Tate object `ℤ_ℓ(1)`.

## F.4.4 Integral finiteness, perfectness and derived reduction

**Integral finiteness, perfectness and derived reduction.** VanishingCycles.adicFiniteness.
For separated finite-type `X` over separably closed `k`, `ℓ` invertible in `k` and a normalized
constructible system with uniform cohomological and Tor bounds, prove finite generation
of `Hⁱ` and `Hⁱc` over `ℤ_ℓ`, bounded perfect `RΓ` and `RΓc`, and
`RΓ_(c)(X,K_Zℓ)⊗ᴸΛ_n≅RΓ_(c)(X,K_n)` for every `n`. These groups are computed in universe `u`
by the classical realization; their comparison with Mathlib's `Scheme.EllAdicCohomology` in
universe `u+1` goes through §F.4.3's `ν` and `ℤ_ℓ,X`. Prove the finite-level, ML and derived-completeness argument
from F.3, followed by geometric continuity; arithmetic field cohomological dimension is
an additional hypothesis on arithmetic versions. (Bhatt–Scholze §6.8; SGA 4½ [Th. finitude];
Illusie 1994 §4.4.) *Needs:* F.3 proper and compact-support finiteness, including ordinary
geometric finiteness; normalizedAdicSystems, classicalAdicRealization, etaleProetaleAdicComparison;
EnhancedDerivedSheaves §0.3.

**Vanishing of `ℓ`-adic cohomology — `VanishingCycles.subsingleton_ellAdicCohomology`.** For `X`
of finite type over a separably closed field `k` and a prime `ℓ` invertible in `k`, prove that
Mathlib's `Scheme.EllAdicCohomology X ℓ q` vanishes for `q > 2 dim X`. By Bhatt–Scholze
Proposition 5.6.2 the pro-étale cohomology of `ℤ_ℓ` is the cohomology of
`R lim RΓ(X, ℤ/ℓⁿ)`; the groups `Hᵠ(X, ℤ/ℓⁿ)` vanish for `q > 2 dim X` by
`VanishingCycles.etaleCohomologicalDimension` and are finite by
`VanishingCycles.finite_H_constantSheaf`, so the Milnor term
`lim¹ H^(2 dim X)(X, ℤ/ℓⁿ)` vanishes. *Needs:*
§§F.3.0, F.3 and §F.4.3's comparison through `ν` and `ℤ_ℓ,X`; Mathlib
`Scheme.EllAdicCohomology`.

**Checks.**

- A geometric point with the constant system gives a free rank-one `ℤ_ℓ`-module.
- Derived reduction of integral torsion retains the Tor group in the adjacent degree.
- A nonseparably closed field is not covered by this geometric boundedness theorem.
- For `X = ℙ¹` over separably closed `k` with `ℓ` invertible, `H²(X_proét, ℤ_ℓ) = lim ℤ/ℓⁿ = ℤ_ℓ` is
  nonzero in degree `2 = 2 dim X`, and the vanishing begins in degree `3`.
- For `X = Spec 𝔽_p` with `ℓ ≠ p`, the base is not separably closed: `H¹(X_proét, ℤ_ℓ) = ℤ_ℓ` is
  nonzero although `2 dim X = 0`.

## F.4.5 Rational realization and finite-dimensional cohomology

**Rational realization and finite-dimensional cohomology.** VanishingCycles.rationalAdicRealization.
On Noetherian `X` with invertible `ℓ` define lisse rational sheaves as locally free finite-rank
`ℚ_ℓ,X`-module sheaves on `X_proet`, where `ℚ_ℓ,X=ℤ_ℓ,X[1/ℓ]`. Prove pro-étale descent and
étale-local existence of lisse integral lattices. Separate the full subcategory admitting
a global lisse `ℤ_ℓ` lattice: rationalization of integral lisse systems is fully faithful
up to isogeny with precisely this essential image. On connected `X` with a geometric basepoint,
this subcategory corresponds to continuous finite-dimensional representations of F.0's
profinite `π₁`; compactness supplies a stable lattice. If `X` is geometrically unibranch
(in particular normal), every lisse rational sheaf is in this subcategory. No general
pro-étale fundamental-group construction is required.

Define the general bounded constructible rational category by finite stratifications with
lisse rational cohomology on the strata. Prove that each such object has a bounded
constructible integral model, whose derived reductions have the common cohomological and
Tor bounds of normalizedAdicSystems, and that rationalization gives an equivalence from
the integral constructible category up to isogeny. An integral model of a lisse rational
sheaf need only be constructible. Rationalizing etaleProetaleAdicComparison transports
this equivalence to the classical normalized constructible category; it preserves both
general rational lissity and the distinguished global-lattice subcategory without making
their essential images equal. This comparison uses integral derived realization followed
by rationalization, rather than an interchange of `ν*` with inverse limits.

On separated finite-type `X` over separably closed `k` with invertible `ℓ` prove
`RΓ_(c)(X,K_Qℓ)≅RΓ_(c)(X,K_Zℓ)⊗ᴸℚ_ℓ`, finite-dimensional `Hⁱ_(c)` and bounded amplitude
for a constructible integral model `K_Zℓ`. Prove independence of the integral model,
tensor/Hom/duality, ordinary/compact Künneth and trace/determinant scalar comparison.
Include finite `E/ℚ_ℓ` by scalar extension, using `O_E` lattices, and bounded constructible
`ℚ̄_ℓ` objects defined over finite `E`.
(Bhatt–Scholze Definition 6.8.3, Proposition 6.8.4(4)–(6), Lemma 6.8.13,
Proposition 6.8.14 and Lemma 7.4.10; flat scalar extension.) *Needs:* normalizedAdicSystems
through adicFiniteness; §F.0.2 finiteEtaleGaloisCategory; F.2 Künneth;
§F.4.0 (Tau Ceti `Subgroup.isCompact_closure_iff_exists_stable_lattice` and
`TauCeti.GaloisLattice.IntegralModel.nonempty`); Mathlib finite-dimensional trace/determinant.

**Checks.**

- `ℤ_ℓ/ℓ` rationalizes to zero; `ℤ_ℓ` rationalizes to a line over `ℚ_ℓ`.
- On the rational nodal curve `ℙ¹/(0∼∞)` over algebraically closed `k` of characteristic
  different from `ℓ`, descend the constant rational line on the infinite-chain cover with
  loop multiplier `ℓ`. It is lisse and has a constructible integral model, but no global
  lisse lattice: `ℓ·ℓᵃℤ_ℓ≠ℓᵃℤ_ℓ` for every `a`. Its monodromy does not come from profinite `π₁`.
- On a connected normal Noetherian scheme every lisse rational object has a global
  lisse lattice and recovers the ordinary continuous profinite-representation correspondence.
- `𝔾_m` has two finite-dimensional compact-support groups in degrees one and two,
  different from its ordinary groups in degrees zero and one.

**Rationalization, lattices and the representation dictionary.** Coefficients are §F.4.3's ring
objects. Rationalization from `𝒪_E` to `E` coefficients is derived scalar extension of module
objects along `𝒪_E,X → E_X`; the description of `E`-sheaves as the Serre quotient of
`𝒪_E`-sheaves by those killed by a power of `ℓ` (Mathlib's `ObjectProperty.isoModSerre`) is a
theorem about this functor, not its definition. For topologically Noetherian `X`, prove that
`Dᵇ_c(X, ℚ̄_ℓ)` is the 2-colimit of `Dᵇ_c(X, E)` over finite `E/ℚ_ℓ` inside `PadicAlgCl ℓ`, along
scalar extension (Bhatt–Scholze Proposition 6.8.14 (1) for the colimit of the integral categories
and (2) for their rationalization, in the topologically Noetherian setting of §6.8 from
Definition 6.8.6 on). Define the
structure Lattice F for an `E`-sheaf `F`: an `𝒪_E,X`-module object `L`, lisse when `F` is,
with an isomorphism from its rationalization to `F` as data; it is the sheaf-level counterpart of
`TauCeti.GaloisLattice.IntegralModel`. For connected `X` and a geometric point `x̄`, define
lisseRepresentationEquiv, an equivalence of categories given as `≌` data between lisse `E`-sheaves
admitting a global lisse lattice and continuous finite-dimensional representations
`TauCeti.ContinuousRep (EtaleFundamentalGroup x̄) E V`, obtained level by level from
VanishingCycles.lisseMonodromyEquiv through §F.4.1's systems and rationalization. Under it,
lattices of `F` correspond to integral models of the representation, homotheties of lattices to
the action of `Eˣ` on `TauCeti.GaloisLattice.IntegralModel`, and the generic fibre to Tau Ceti's
`TauCeti.GaloisLattice.IntegralModel.genericFiberIso`. Arithmetic consumers of the representation
dictionary use this equivalence. (Bhatt–Scholze Proposition 6.8.4 (1) for a lisse `𝒪_E`-sheaf as
the limit of its finite levels; Lemmas 7.4.3, 7.4.5 and 7.4.7 for the same dictionary through the
pro-étale fundamental group of a connected locally topologically Noetherian scheme, whose
profinite completion is the étale fundamental group by Lemma 7.4.3. On a general connected `X`
the level-by-level route applies, since on a connected scheme a section of `H[1/ℓ]`, for `H` a
lisse `𝒪_E`-sheaf, has bounded denominators: the locus where `ℓᵏ` times it is integral is open
and closed.) *Needs:* §§F.0.2, F.4.0, F.4.1, F.4.3; Mathlib
`ObjectProperty.isoModSerre`, `PadicAlgCl`.

**Checks.**

- The constant `E`-sheaf `E_X` has the lattices `ϖᵏ𝒪_E,X`, and under lisseRepresentationEquiv it is
  the trivial one-dimensional representation.
- An object killed by `ℓ` is zero in the Serre quotient and is sent to zero by rationalization.
- On `Spec 𝔽_q`, the rank-one lisse `ℚ̄_ℓ`-sheaf on which geometric Frobenius acts by the unit
  `1 + √ℓ` comes from `Dᵇ_c(Spec 𝔽_q, ℚ_ℓ(√ℓ))` and not from `Dᵇ_c(Spec 𝔽_q, ℚ_ℓ)`.

## F.4.6 Continuous actions and finite-level operation comparison

**Continuous actions and finite-level operation comparison.** VanishingCycles.adicFunctoriality.
For `X/k` and coefficient descent data in normalizedAdicSystems' category, construct the
continuous `G_k` action on geometric ordinary/compact cohomology and their complexes,
restriction along field extensions and conjugacy under change of separable closure.
Retain finite-group, tensor and twist coherence. Pass proper/smooth/`Rf!` exchange,
projection, lissity and both Künneth formulas through normalized systems and derived
completeness under the respective F.2–F.3 hypotheses and verified uniform bounds.
§F.10.2b specializes this action. (Stacks, Theorem 59.51.3, tag 09YQ, applied to
`X_(k^sep) = lim X_(k′)` over the finite separable extensions `k′/k`, for continuity of the action
on finite-level cohomology of a qcqs `X`; Bhatt–Scholze §§5–6 for passing the operations through
realization.)
*Needs:* normalizedAdicSystems through rationalAdicRealization; F.2–F.3 finite-level
operations; §F.0.4 universalHomeomorphismEtaleEquivalence and §F.10.2 finite-level Frobenius bridge.

**Checks.**

- Geometric `q`-Frobenius acts on `ℚ_ℓ(1)` by `q⁻¹`.
- Restriction to `𝔽_(qʳ)` takes Frobenius to its `r`-th power.
- A finite symmetry compatible with descent commutes with the Galois action.

## F.10.2b Scheme/descent Frobenius comparison, adic extension

**Scheme/descent Frobenius comparison through realization.** VanishingCycles.frobeniusCohomology. For `X` over a finite field `k` and a normalized bounded constructible system descended over `k`, extend §F.10.2's comparison through normalized realization and rationalization. With the coefficient identification retained, `q`-power scheme pullback is geometric cohomological Frobenius, inverse to arithmetic Galois action. Prove all `r`-power, Tate-twist, finite-group and coefficient-reduction compatibilities; an arbitrary complex on `X_k̄` without descent data has no asserted canonical action. (SGA 4½ [Rapport] §§1–2; Weil I §§1–2.)
*Needs:* §F.10.2; §§F.4.1–F.4.6 and their continuity, uniform-bound and ML hypotheses.

**Checks.**

- Arithmetic Frobenius on `μ_(ℓⁿ)` multiplies the Tate coordinate by `q` at every level.
- Geometric Frobenius on `ℚ_ℓ(1)` multiplies by `q⁻¹`.
- `H²c(𝔸¹,ℚ_ℓ)=ℚ_ℓ(−1)` has geometric trace `q`.
- Reduction of the realized comparison is the finite-level comparison.
- The twist `ℚ̄_ℓ(1)` on `X` over `𝔽_q`, with its descent datum, is the constant sheaf `ℚ̄_ℓ` on
  `X_k̄` with the constant descent datum multiplied by `q⁻¹` under geometric Frobenius. This is a
  comparison theorem about the twist of §F.0.3 realized through §F.4, not a definition of it; the
  Weil-sheaf structures built downstream use it.

**Compact-support Frobenius modules — compactFrobeniusModule.** For `f : X ⟶ Spec k` separated of
finite type over a finite field `k`, a finite extension `E/ℚ_ℓ`, the explicit hypothesis
`(hℓ : (ℓ : k) ≠ 0)` and `i : ℕ`, define compactFrobeniusModule f E hℓ i: the finite-dimensional
`E`-vector space `Hⁱ_c(X_k̄, E)` of §F.4.5 with the `E`-linear automorphism induced by
VanishingCycles.geometricFrobenius through this section's comparison, as data. Prove that it is
zero for `i > 2 dim X`: on a dense compactification `X ⊂ X̄`, which has the same dimension,
`Hⁱ_c(X_k̄, ·)` is `Hⁱ(X̄_k̄, j_!·)`, and §F.3.0 bounds it at finite level before realization.
Prove that its characteristic polynomial does not depend on the algebraic closure `k̄`, a
`k`-isomorphism of algebraic closures conjugating the Frobenius automorphisms, or on the integral
model used in §F.4.5, by §F.4.5's independence of the integral model; and that it is compatible
with finite extensions of `k` (Frobenius to the `r`-th power) and with extension of `E`.
Downstream trace-formula and weight statements take their cohomology from it. (Stacks,
Definition 64.3.8 and Theorem 64.3.9, tags 03SU and 03SV, for the Galois action on the cohomology
of `X_k̄` and its identification with the inverse of the pullback by the geometric Frobenius of
`X`; Theorem 64.16.1, tag 03UG, equation 03UH, for its use on compactly supported cohomology; SGA
4½ [Rapport] §§1–2.) *Needs:* §§F.3.0, F.4.5, F.10.1, F.10.2 and the comparison above; Mathlib
`LinearMap.charpoly`.

**Checks.**

- For `X = 𝔸¹_k`, compactFrobeniusModule is zero except in degree `2`, where it is `E(−1)` with
  Frobenius `q`.
- For `X = Spec 𝔽_(q²)` over `𝔽_q`, it is `E²` in degree `0` with Frobenius exchanging the two
  coordinates.
- Base change from `k` to its degree-`r` extension replaces the Frobenius by its `r`-th power.

## 0.9 Algebraic cycle classes and the projective bundle formula

**Normalized algebraic classes.** For `n>0` invertible on a qcqs scheme `X`, provide ClassicalAlgebraic.cycleClasses: the Kummer first Chern class of a line bundle and the localized class `cl_Z∈H_Z^(2c)(X,μ_n^⊗c)` for a regular immersion `Z→X` of codimension `c` between schemes smooth over a common base on which `n` is invertible. Construct the class by deformation to the normal bundle and prove transverse pullback, composition of regular immersions and Cartier-divisor agreement. Provide the étale projective bundle formula for a rank-`r` vector bundle, with summands indexed by `0≤i<r` generated by `c₁(O(1))ⁱ` and normalization by degree-one point classes. For `r=0` both the sum and projectivization are empty. No absolute purity for arbitrary singular schemes is included. (SGA 4½, *Cycle*, §§1–2; SGA 4, Exposé XVIII, §§2–3; Kummer sequence: Stacks, tag 03PL.)

For finite commutative `Λ` annihilated by `n`, use derived extension of scalars from `ℤ/n` for the same classes and projective-bundle decomposition, compatibly with pullback and coefficient reduction. Over a separably closed field this gives one `Λ(−i)` summand in degree `2i` for `P^m`, generated by the hyperplane powers for `0≤i≤m`. §F.6 (VanishingCycles.smoothPairGysin), consumes these finite classes for higher Gysin, self-intersection and adic extensions; §F.10 uses the same hyperplane generator and Tate orientation in its Frobenius calculations.

*Needs:* §§0.7–0.8 and F.0.3; SchemeAndStackFoundations §§2.11, 0.3, 5.5; StableReduction Layer 4.

**Checks.**

- On `P¹` over an algebraically closed field, `c₁(O(1))` has trace `+1`.
- The divisor `T=0` on `A¹` has localized class given by the Kummer connecting image of `T`.
- A rank-one bundle has projectivization `X` and only the degree-zero projective-bundle summand.
- The zero bundle has empty projectivization and zero cohomology, including over `Spec k`; there is no degree-zero basis vector.

**Regular-immersion classes.** Provide ClassicalAlgebraic.lciCycleClass: for a regular closed immersion `i:Z→X` of pure codimension `c` between locally noetherian schemes, with `n>0` invertible on `X`, construct `cl_Z∈H_Z^(2c)(X,Λ(c))`, `Λ=ℤ/n`. For `c>0`, use the exceptional divisor of `Bl_Z(X)`, the projective bundle formula for its normal bundle and the monic relation for the negative exceptional-divisor class; its constant term defines `cl_Z`. For `c=0`, use the coefficient unit on the open-and-closed support. Prove Cartier agreement, coefficient reduction `ℤ/n→ℤ/m` for `m>0` with `m|n`, transverse pullback when the pulled-back immersion remains regular of codimension `c`, and agreement with ClassicalAlgebraic.cycleClasses on locally noetherian pairs in its smooth-pair scope. This constructs a class without asserting purity for singular pairs. (Fujiwara, *A proof of the absolute purity conjecture (after Gabber)*, §1.1, Lemma 1.1.1 and Definition 1.1.2; Li–Reinecke–Zavyalov, §§3.2–3.3, Proposition 3.2.5 and Definition 3.3.2, pp. 24–25, and §3.4, Lemma 3.4.1, pp. 27–28.)

**Checks.**

- A Cartier divisor has the localized Kummer first Chern class; the class of `T=0` on `A¹` has the degree-one point normalization.
- In `A³_C` for `C=ℂ₃` and `n=2`, `Z=V(y²−x³,t)` is a codimension-two regular immersion with singular `Z`. Its degree-four, twist-two class exists; smooth-pair purity does not cover `Z`.
- Reduction from `ℤ/4` to `ℤ/2` carries the class of the coordinate origin in `A²` to the corresponding `ℤ/2` class, with degree 4 and twist 2.

*Needs:* Sections 0.7–0.8 and the projective bundle formula above; `SchemeAndStackFoundations`, §2.11 for Hilbert 90 and Kummer, §0.3 (`relativeProj`) for relative Proj and §5.5 (`normalBundle`, `deformationToNormalCone`) for normal-bundle and deformation geometry; `StableReduction`, Layer 4, for the Rees blow-up of a quasi-coherent finite-type ideal, using the pinned Tau Ceti affine blow-up charts. The analytification comparison consumes the algebraic class defined here. Finite `Λ`-Tate twists are supplied by §F.0.3 (VanishingCycles.etaleTateTwists); the cycle-class and projective-bundle normalization is owned here.

**Classes as shifted morphisms, cup products with supports and purity.** A cohomology class is a
morphism out of the unit: `Hⁿ(X,K) = ShiftedHom Λ_X K n` in `D(X,Λ)` (Mathlib's `ShiftedHom`),
with Yoneda composition. A class supported on a closed immersion `i : Z → X` is an element of
`ShiftedHom Λ_X (i_*i^!L) n`, with §0.7's `i^!`. Define the cup product
`Hᵃ(X,K) × Hᵇ(X,L) → Hᵃ⁺ᵇ(X,K⊗L)`, and the cup product with supports as the unique lift through
§0.7's localization triangle. The Kummer class of a unit, the first Chern class of a line bundle
and the classes `cl_Z` of ClassicalAlgebraic.cycleClasses and ClassicalAlgebraic.lciCycleClass
are these morphisms, built by the constructions above (Kummer boundary, deformation to the normal
bundle, blow-up); none is defined as the choice of a uniquely existing class, and their
characterizations are theorems. Define cycleClassMap i c, the morphism `Λ_Z → i^!Λ_X(c)[2c]`
adjoint to `cl_Z`, and the predicate IsPure i c as `IsIso (cycleClassMap i c)`. Smooth-pair
purity (§0.10) and absolute purity for regular pairs (LefschetzPencilsAndVanishingCycles §0.10,
downstream) are theorems about this one map. *Needs:* §0.7; the classes above; Mathlib
`ShiftedHom`.

**Checks.**

- Cup product is graded commutative with the Koszul sign: on `𝔾_m × 𝔾_m` over `ℂ` with
  `Λ = ℤ/3`, the Kummer classes `t₁, t₂` of the coordinates satisfy `t₁ ∪ t₂ = −(t₂ ∪ t₁)`, and
  this class is nonzero in `H²(𝔾_m², Λ(2))`, so a sign error is detected.
- For `Z = ∅`, every supported class is zero and IsPure holds trivially.
- The origin of `𝔸¹` with `c = 1` satisfies IsPure, and `cl_Z` is the Kummer connecting image of
  the coordinate.

## 0.10 Relative purity and normal-crossings restriction

**Smooth-boundary purity.** Provide ClassicalAlgebraic.smoothBoundaryPurity: for a closed immersion `i:Z→X` of codimension `c` between schemes smooth over a field `k` and `n>0` invertible in `k`, `i!Λ_X≅Λ_Z(−c)[−2c]` for `Λ=ℤ/n`, with its counit carrying the class of Section 0.9. For `j` the complement of a strict normal-crossings divisor in smooth `X` and `F` finite locally constant on `X`, give at a strict-local point with `r` branches the exterior algebra on the local Kummer equations: `(R^qj*j*F)_x=F_x⊗Λ∧^q(Λ(−1)^r)`, naturally in restriction maps. This is relative smooth-boundary purity, not a hypothesis-free assertion of absolute purity. (SGA 4, Exposé XVI, §3 and Exposé XVIII, §3; SGA 4½, *Cycle*, §2; Huber (1996), Theorem 3.9.1, p. 230, and proof, pp. 230–237, for its analytic comparison use.)

**Checks.**

- No branch gives `F_x` in degree zero and zero in positive degrees.
- One branch with `F=Λ²` gives rank two in both degrees zero and one.
- Two transverse branches give two degree-one Kummer generators and their degree-two product; a local system only on the complement with nontrivial boundary monodromy is outside this formula.

*Needs:* Sections 0.7–0.9; scheme strict localization, Kummer and smooth coordinates from `SchemeAndStackFoundations`.

In §0.9's terms, smooth-boundary purity is the statement IsPure i c for these smooth pairs: the
isomorphism `i^!Λ_X ≅ Λ_Z(−c)[−2c]` is §0.9's cycleClassMap i c after twisting, not an unnamed
isomorphism. Absolute purity for regular pairs, owned downstream by
LefschetzPencilsAndVanishingCycles §0.10, is the same predicate for the classes of
ClassicalAlgebraic.lciCycleClass.

## 0.11 Algebraic smooth trace and curve duality

**Algebraic smooth trace.** For a separated smooth finitely presented `f:X→S` of relative pure dimension `d` over a qcqs base `S`, compactifiable (`Nonempty (TauCeti.Compactification f)`, §G.1), `n>0` with Scheme.IsInvertibleOn n S and `Λ=ℤ/n`, provide ClassicalAlgebraic.smoothTrace: `Rf!Λ(d)[2d]→Λ`, with §0.8's canonical `Rf!`. Construct it by the diagonal argument, over the qcqs base and not over fields first: the trace of `𝔸¹_S` comes from the purity of its zero section, obtained from the Kummer boundary map of §0.9 and normalized so that `c₁(O(1))` on `ℙ¹_S` has trace `1`; smooth base change (§F.2.2) and étale-local coordinates (SchemeAndStackFoundations §0.8) extend it to `𝔸^d_S` and to every smooth `f`; the cycle class of the diagonal `X → X ×_S X`, a section of the first projection (§0.9's ClassicalAlgebraic.lciCycleClass), shows independence of the coordinates and descends the trace. Normalize by degree-one point classes and prove composition, open restriction, finite flat trace and arbitrary base-change compatibility. No Jacobian and no curve-specific construction is used. (SGA 4, Exposé XVIII, §§1–3, especially Theorem 3.2.5; SGA 4½, *Cycle*, §2; the analytic analogue is Li–Reinecke–Zavyalov, §6.1, Theorem 6.1.1, p. 66, where the trace of a separated smooth morphism of locally noetherian analytic adic spaces is characterized by compatibility with composition, with base change, with the étale trace and with the algebraic trace of `ℙ¹`.)

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; §§0.5–0.10 and F.2.2; §G.1 compactifiability; SchemeAndStackFoundations §§0.8, 2.11 (étale coordinates, Kummer).

**Checks.**

- The dimension-zero identity morphism has identity trace.
- The `P¹` trace sends `c₁(O(1))` to 1, fixing the sign on open curves by extension by zero.
- For `S=Spec C` with `C` algebraically closed and `n>1` invertible in `C`, `X=A¹_C⊔A¹_C` has `R²f_!μ_n=(ℤ/n)²` and trace is addition, with nonzero kernel. Both components lie over the same base point. For `S=Spec ℂ₃⊔Spec ℂ₃`, one `A¹` over each point and `n=2` instead give identity trace on both stalks.
- Over the non-field base `S = Spec ℤ[1/n]`, the trace of `ℙ¹_S` is defined without choosing a point and restricts at every geometric point of `S` to the field trace sending `c₁(O(1))` to `1`.

**Algebraic curve duality and effacement.** Under the same hypotheses with `d=1`, provide ClassicalAlgebraic.curveDuality: for constructible finite-Tor-amplitude `K`, the trace pairing identifies `Rf*Rℋom(K,Λ(1)[2])` with `Rℋom(Rf!K,Λ)`. It is a corollary of the smooth trace: the pairing is perfect because the diagonal class of the trace construction inverts it, and no curve-specific effacement is needed. The same argument gives the duality for every `d`, which §F.6 states as VanishingCycles.smoothPurity. (SGA 4, Exposé XVIII, §§1–3; SGA 4½, *Cycle*, §2; the formal argument from the trace is Li–Reinecke–Zavyalov, §6.4, Theorem 6.4.1 and Construction 6.4.2, pp. 81–82, in the analytic setting, for smooth proper morphisms and dualizable coefficients.)

**Checks.**

- For a proper smooth connected curve over an algebraically closed field, the pairing on `H⁰` and `H²` is the normalized degree pairing.
- For `A¹` over such a field, `RΓ_cΛ=Λ(−1)[−2]` pairs with `RΓΛ=Λ`.
- A finite direct sum of finite locally free coefficient sheaves has the direct sum of the duality pairings; finite Tor amplitude is retained.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4; this roadmap §§0.5–0.10 and the smooth-trace target above; `SchemeAndStackFoundations`, §2.11.

## F.5 Exceptional inverse image and duality

**Theorem.** Construct VanishingCycles.etaleExceptionalInverseImage `f^!` for every
compactifiable `f` (`Nonempty (TauCeti.Compactification f)`) and torsion `Λ`, as the right adjoint of §0.8's
unbounded `Rf_!` on `D(X,Λ)` (Stacks 0G2C), with its composition isomorphisms and, for every
cartesian square of quasi-compact quasi-separated schemes with `g : Y' → Y`, `g' : X' → X` and
`f' : X' → Y'`, the exchange isomorphism `Rf^! ∘ Rg_* ≅ Rg'_* ∘ R(f')^!`, adjoint to the base change
`g^* ∘ Rf_! ≅ Rf'_! ∘ g'^*` of §F.2.4 (Stacks 0GLE). The base-change map `g'^*f^! → f'^!g^*` is not
an isomorphism for a general `g` and is not asserted; on the finite-cohomological-dimension
domain of F.2 it restricts to the bounded-below functor. Construct VanishingCycles.etaleVerdierDuality.
For separated finite-type field schemes use `D_XK=RHom(K,a_X^!Λ)`; prove biduality on bounded
constructible finite-Tor complexes, tensor–Hom adjunction, proper duality and localization
with supports. Include the dualizing complexes and local biduality on excellent traits used
in trait-duality applications: construct the trait dualizing complex by its dimension-one Kummer calculation,
then finite-type exceptional pullback and local biduality. Retain finite-Tor hypotheses; this
construction supplies absolute-purity applications. Adic duality is the realization of F.4.
(SGA 4 XVIII §3; SGA 4½ [Th. finitude] §4; ILO XVII §§0–2.)
*Needs:* F.1–F.4, including §F.3a; §§0.7–0.11 (support localization,
finite trace, smooth trace and curve duality on their stated torsion domains);
SchemeAndStackFoundations §0.21. Higher-dimensional duality and trait dualizing complexes are built here.

**Checks.**

- On a geometric point with field coefficients, duality is ordinary linear duality.
- For a proper smooth curve it pairs `H⁰` with `H²(1)` and `H¹` with `H¹(1)`.
- With integral coefficients on a point, the dual of `ℤ_ℓ/ℓ` is `(ℤ_ℓ/ℓ)[−1]`.
- For the origin `i : {0} → 𝔸¹_k` over a separably closed field `k`, `Λ = ℤ/n` with `n > 1`
  invertible in `k`, and `g = i`, the square has `X' = {0}` and `f' = g' = id`. The base-change
  map `g'^*i^!Λ → f'^!g^*Λ` is `Λ(−1)[−2] → Λ` by purity, not an isomorphism (the two sides sit
  in degrees `2` and `0`), while the exchange isomorphism holds: both sides send `Λ` on `{0}` to
  `i^!i_*Λ = Λ`. A formalism that stored `g'^*f^! ≅ f'^!g^*` as a field would be inconsistent.

**The abstract Verdier layer and dualizing complexes.** Once, for closed symmetric monoidal
categories with adjunctions `F ⊣ G` and `P ⊣ S` and a projection morphism, construct the exchange
map, the trace, the Poincaré map and the biduality map, and prove biduality for dualizable
objects when the dualizing object is invertible. Invertibility of an object `T` of a monoidal
category is the hypothesis, in Mathlib's vocabulary, that tensoring with it is an equivalence,
`(MonoidalCategory.tensorLeft T).IsEquivalence`; no predicate for it is defined here. Every
formal duality lemma is stated for an arbitrary `T` with that hypothesis and an
isomorphism `T ≅ f^!𝟙`, so that §F.6's purity isomorphism and the twists of §F.0.3 instantiate
it. For every compactifiable `a : X ⟶ S` define dualizingComplex a as `a^!Λ_S`, with no
dimension or field hypothesis, and the duality functor `D_a K = RHom(K, dualizingComplex a)`;
the field-scheme duality above is the case `S = Spec k`. (Stacks, Definition 4.43.8 and
Lemma 4.43.9, tags 0FFP and 0FFQ, for dual objects in a monoidal category and the adjunction they
give; Li–Reinecke–Zavyalov, §6.4, Theorem 6.4.1 and Construction 6.4.2, p. 82, for the
evaluation, coevaluation and duality maps built from a trace and the formal proof of duality for
dualizable objects; Stacks, Lemmas 63.11.1 and 63.11.6, tags 0G2C and 0GLD, for `a^!` as the right
adjoint of `Ra_!` and the global form of the adjunction.) *Needs:* §0.8; the adjunction above;
EnhancedDerivedSheaves §0.3 (tensor and internal Hom).

**Checks.**

- For étale `a`, `a^! = a^*` and dualizingComplex a is `Λ_X`.
- For the identity of `S`, dualizingComplex is `Λ_S` and `D` is `RHom(−, Λ_S)`.
- On a nonempty `X` with `n > 1` invertible on `X`, tensoring with the twist `Λ(1)` is an
  equivalence, with inverse tensoring with `Λ(−1)`, while tensoring with `Λ ⊕ Λ` is not: it
  doubles ranks of lisse sheaves, so `Λ` itself is not in its essential image.

**The six-operation output structure.** Package `f^*`, `Rf_*`, `Rf_!`, `f^!`, `⊗ᴸ` and `RHom` with
their adjunctions, their composition isomorphisms, for every cartesian square the base-change
isomorphism `g^* ∘ Rf_! ≅ Rf'_! ∘ g'^*` and the exchange isomorphism
`Rf^! ∘ Rg_* ≅ Rg'_* ∘ R(f')^!`, and the projection formula as one
structure whose operations and isomorphisms are data fields and whose coherence laws are
`Prop` fields. It is an output, built once for torsion `Λ` from §§0.7–0.8, F.2 and this section,
and transported to adic coefficients by §F.4's realization rather than re-implemented per
coefficient ring. Consumers of formal trace and correspondence arguments use its fields. (Stacks,
More on Étale Cohomology, Lemmas 63.9.1–63.9.4, tags 0F7I, 0F7J, 0F7K and 0F7L, for `Rf_!`, its
composition and associativity isomorphisms and its base change; Lemma 63.10.7, tag 0GL5, for the
projection formula; Lemmas 63.11.1 and 63.11.7, tags 0G2C and 0GLE, for `f^!` and its exchange with `Rg_*`;
SGA 4, Exposé XVII, §5, for the formalism.) *Needs:* §§0.7–0.8, F.2, F.4 and this section.

**Checks.**

- For the identity morphism every field is the identity up to its unit isomorphism.
- Its projection-formula field is §F.2.7's isomorphism for every torsion `Λ`.
- For proper `f` its base-change field is §F.2.1's proper base-change isomorphism. For
  `f : ℙ¹_S → S` with `S = 𝔸¹` over an algebraically closed field `k`, `Λ = ℤ/n` with `n > 1`
  invertible in `k`, and `g` the inclusion of a closed point `s`, it identifies the stalk of
  `R²f_*Λ` at `s` with `H²(ℙ¹_s, Λ) ≅ Λ(−1)`, a group of order `n`, so a structure whose
  base-change field is the zero map is excluded; for `n = 1` both sides are zero and the Check
  says nothing.

## F.6 Smooth purity, Gysin maps and cycle classes

**Theorem.** Construct VanishingCycles.smoothPurity: for smooth separated finitely presented
compactifiable `f` of relative dimension `d` over a qcqs base on which `n` is invertible, the
named isomorphism `f^!Λ≅Λ(d)[2d]` adjoint to the normalized ClassicalAlgebraic.smoothTrace,
extending ClassicalAlgebraic.curveDuality to higher-dimensional Poincaré duality. It is data,
not an existence statement; prove that it is compatible with composition (through §F.0.3's twist
addition) and with arbitrary base change of the base. Define the Gysin map of a smooth pair
`i : Z → X` of codimension `c` from the purity isomorphism and §0.9's supported classes, and prove
its projection formula `i_*(a ∪ i^*b) = i_*a ∪ b`. Use
ClassicalAlgebraic.cycleClasses and ClassicalAlgebraic.smoothBoundaryPurity for smooth
field pairs with invertible finite coefficients. Extend them as VanishingCycles.smoothPairGysin
with projection and self-intersection formulas and the adic realizations of F.4. Construct
the additional Gysin morphism `Λ → f^!Λ(−d)[−2d]`, `d` the virtual relative dimension, for
local complete intersection morphisms `f` between quasi-compact `ℤ[1/n]`-schemes admitting an
ample line bundle, which are then smoothable, independent of the factorization of `f` as a
regular immersion followed by a smooth morphism (ILO XVI, Definitions 2.5.1–2.5.4 and
Theorem 2.5.5); no regularity is assumed. Its being an isomorphism for a closed immersion of
regular schemes is the absolute-purity theorem of LefschetzPencilsAndVanishingCycles §0.10.
(SGA 4 XVIII 3.2; SGA 5 VII; ILO XVI §§1–2.)
*Needs:* F.2, F.4–F.5; §§0.9–0.11; SchemeAndStackFoundations Layer 5 (Chow and Chern classes).

**Checks.**

- The point zero in `𝔸¹` has supported `H²(Λ(1))=Λ`, generated by its cycle class.
- For `𝔸¹_S → S`, smoothPurity is `Λ(1)[2]` and its adjoint trace is the normalization of
  §0.11; for `ℙ¹_S`, `c₁(O(1))` is sent to `1`.
- For `𝔸² → 𝔸¹ → S`, the composite of the two purity isomorphisms is the purity isomorphism of
  `𝔸²_S` through `Λ(1) ⊗ Λ(1) ≅ Λ(2)`.
- Base change of smoothPurity for `𝔸¹_ℤ[1/n]` to a geometric point is the field-level purity.
- A line in `ℙ²` has self-intersection one.
- On a smooth surface over a separably closed field, the exceptional curve of the blow-up at a rational point has self-intersection `−1`. Over a general field, a separable closed point of degree `d` gives exceptional intersection degree `−d` over the base: the point `y=0, x²−2=0` in an affine chart of `ℙ²_ℚ` gives `−2`.

**Étale Gauss–Bonnet.** VanishingCycles.etaleGaussBonnet. For smooth proper
pure-dimensional `X` of dimension `d` over algebraically closed `k` and `ℓ` invertible in `k`, prove

`deg c_d(T_X) = χ(RΓ(X_et,ℚ_ℓ))`,

where `χ` sends the perfect `ℚ_ℓ`-complex `RΓ(X_et,ℚ_ℓ)` to its class in the triangulated `K₀`
of perfect `ℚ_ℓ`-complexes, identified with `ℤ` by rank (GrothendieckEulerForms Layer 2); by
GrothendieckEulerForms Layer 5 this class is `Σ_i (−1)ⁱ dim_Qℓ Hⁱ_et(X,ℚ_ℓ)`. Stating the right
side through `K₀` makes it additive on distinguished triangles before any cohomology group is
computed. Use the diagonal's regular-immersion cycle class and its self-intersection to identify
the left side with the diagonal intersection. Compute the identity correspondence's trace by
ordinary Künneth and Poincaré duality, giving the right side. The identity holds over every
algebraically closed field of characteristic different from `ℓ`, of characteristic zero or `p`;
over a field `k` that is not algebraically closed it holds with the geometric cohomology
`RΓ(X_k̄, ℚ_ℓ)` on the right; with the arithmetic cohomology `RΓ(X_et, ℚ_ℓ)` it holds when `k`
is separably closed (§F.0.4) and can fail otherwise, as the last two Checks show. (SGA 5 III, VII, cycle-class and Lefschetz
formalism; F.6 projection/self-intersection formulas.) *Needs:* §F.2.6 etaleKunneth;
F.4 adicFiniteness and rationalAdicRealization; F.5–F.6 duality and diagonal Gysin;
§0.9 / cycleClasses; SchemeAndStackFoundations §5.4 Chern classes; GrothendieckEulerForms Layers 2
and 5 (triangulated `K₀` and Euler characteristics of bounded complexes).

**Checks.**

- `ℙ²` gives top Chern degree and Euler characteristic three.
- `ℙ¹×ℙ¹` gives four on both sides.
- A positive-dimensional abelian variety has trivial tangent bundle, top Chern degree
  zero and Euler characteristic zero.
- Over the non-closed field `𝔽_q`, `X = Spec 𝔽_q` has `d = 0` and `deg c_0(T_X) = 1`, while its
  arithmetic cohomology `RΓ(Spec 𝔽_q, ℚ_ℓ)` has `H⁰ = H¹ = ℚ_ℓ` (continuous cohomology of
  `Ẑ`) and Euler characteristic `0`; the geometric cohomology `RΓ(Spec 𝔽̄_q, ℚ_ℓ) = ℚ_ℓ` gives `1`.
  So the right side is geometric cohomology away from algebraically closed fields.
- Over `ℝ` the arithmetic identity depends on `X`. For `X = Spec ℝ` both sides are `1`: the
  cohomology of `Gal(ℂ/ℝ) ≅ ℤ/2` in positive degrees is killed by `2`, so it vanishes with
  `ℚ_ℓ`-coefficients. For `X = ℙ¹_ℝ` the left side is `2`, while `Hⁱ(X_et, ℚ_ℓ)` is the
  conjugation-invariant part of `Hⁱ(ℙ¹_ℂ, ℚ_ℓ)`, and conjugation acts on `H² = ℚ_ℓ(−1)` by `−1`,
  so the arithmetic Euler characteristic is `1`. For `X = Spec ℂ` over `ℝ` the left side is the
  degree `2` of the point and the arithmetic Euler characteristic is `1`.

## F.7 Projective bundles, blow-ups and weak Lefschetz

**Theorem.** Use the projective-bundle formula of ClassicalAlgebraic.cycleClasses with
its hyperplane generators, and realize it adically by F.4. Prove VanishingCycles.etaleBlowup
for a smooth separated finite-type `k`-scheme `X` and a smooth closed `k`-subscheme `Z` of pure
codimension `c≥1`:

`RΓ(Bl_Z X,Λ) ≅ RΓ(X,Λ) ⊕ ⨁_(1≤i<c) RΓ(Z,Λ)(−i)[−2i]`.

Construct this decomposition with exceptional Gysin maps and their inverse signs, and its
compact-support analogue with `RΓ_c` in every summand. Coefficients are finite `Λ` with
invertible annihilator in `k`, or integral/rational `ℓ`-adic coefficients with `ℓ≠char(k)`, using
F.4 for realization. The formula is valid over arbitrary `k`; geometric specialization uses
`X_k̄` and `Z_k̄`. Prove separately VanishingCycles.etaleWeakLefschetz for a smooth ample
hyperplane section of a smooth projective variety: isomorphism below the middle degree and
injection at the middle, on the same coefficient domain. (SGA 5 VII; SGA 4 XIV §3; SGA 7 XVIII §§2–5.)
*Needs:* F.3–F.4, F.6; §0.9; SchemeAndStackFoundations §§0.3, 5.4 (`relativeProj`, `projectiveBundle`, `projectiveBundle_dual_convention`);
StableReduction Layer 4 (Rees-algebra blow-ups).

**Checks.**

- For separably closed `k` and invertible finite `Λ`, or `ℓ`-adic coefficients with `ℓ≠char(k)`, `H^*(ℙ^r_k,Λ)` has one `Λ(−i)` in each degree `2i`, `0≤i≤r`, and no odd groups. Over arbitrary `k` use the projective-bundle formula over `RΓ(k,Λ)`; for `k=𝔽_q` and nonzero `Λ=ℤ/ℓ` with `ℓ∤q`, `H¹(Spec k,Λ)=Λ` survives on `ℙ^r_k`.
- Blowing up a smooth surface at a rational point over a separably closed field adds one middle Tate class of square `−1`. A separable closed point of degree `d` over a general field adds `d` geometric Tate classes and has exceptional intersection degree `−d` over the base. For `y=0, x²−2=0` in `ℙ²_ℚ` there are two classes after base change to `ℚ̄` and degree `−2`.
- Blowing up a smooth Cartier divisor (`c=1`) is the identity and adds no summands. For the nodal rational curve `X=ℙ¹_ℂ/(0∼∞)`, blowing up the node gives `ℙ¹_ℂ` and changes `H¹` from `ℚ_ℓ` to zero; its smooth centre does not satisfy the smooth-ambient hypothesis.
- For a smooth plane cubic `C⊂ℙ²` over an algebraically closed field with invertible nonzero finite field coefficients, `H¹(ℙ²)=0→H¹(C)=Λ²` is injective and is not an isomorphism.

## F.8 Perverse t-structures over a field

**Construction.** Let `X` be a finite-type scheme over a field `k`, with finite coefficients `Λ` whose annihilator is invertible in `k`, or integral/rational `ℓ`-adic coefficients with `ℓ≠char(k)`. Build VanishingCycles.fieldPerverseTStructure on the corresponding bounded constructible
complexes by the middle support and cosupport inequalities for `δ(x)=dim closure{x}`, both stated
through geometric points and never through Verdier duality: `ᵖD^{≤0}` consists of the `K` with
`Hᵐ` of the geometric stalk of `K` at `ofPoint x` (§F.0.1) zero for `m > −δ(x)` at every point
`x`, and `ᵖD^{≥0}` of the `K` with `Hᵐ` of the geometric costalk `i_x^!K` at `x` zero for
`m < −δ(x)`, where `i_x` is the inclusion of `x` through its closure. Prove the equivalent
support-dimension description `dim supp H^{−i}(K) ≤ i` for all `i` of `ᵖD^{≤0}`, and that Verdier
duality exchanges the two aisles for rational coefficients as a theorem about these definitions.
Prove the `t`-structure axioms, open–closed gluing, the abelian heart, perverse cohomology,
VanishingCycles.intermediateExtension as
`im(ᵖH⁰j_!→ᵖH⁰Rj_*)`, with its no-boundary-subobject/no-boundary-quotient characterization.
Include finite coefficients and the distinct integral perversities `p,p⁺`; integral duality
exchanges them, rational duality preserves the middle perversity. For affine `X` over
separably closed `k` and finite or rational coefficients, prove `Hⁱ(X,P)=0` for `i>0` and
`H_cⁱ(X,P)=0` for `i<0` for perverse `P`. For integral coefficients, the `p` heart has `Hⁱ(X,P)=0`
for `i>0`; the `p⁺` heart has `Hⁱ(X,P)=0` for `i>1` and torsion `H¹(X,P)`. Both have `H_cⁱ(X,P)=0`
for `i<0`, and `H_c⁰(X,P)` is torsion-free for `P` in the `p⁺` heart. Over arbitrary `k` apply
these statements to `X_k̄`; compute arithmetic cohomology through Galois cohomology of the
geometric complex. (BBD §§1.4, 2.2, 4.1.1, 4.4; Illusie 1994 §4; Juteau,
*Decomposition numbers for perverse sheaves*, §2.1, equations (2.4)–(2.7), for the integral
`p⁺` inequalities and torsion tilt.) *Needs:* F.1–F.6.

**Checks.** All schemes are finite type over `k` and coefficients have the preceding invertibility hypotheses.

- On a nonempty smooth curve with `Λ≠0`, `Λ[1]` is perverse, whereas `Λ` is not.
- On the empty scheme, or with the zero coefficient ring, both shifts are the zero perverse object.
- A skyscraper at a closed point is perverse with no shift.
- For a line `i : 𝔸¹ → 𝔸²`, `i_*Λ[1]` satisfies the support-dimension description
  (`H^{−1}` supported in dimension one) and the costalk condition at every point, so it is
  perverse; `i_*Λ` fails the support condition at the generic point of the line.
- For `j:𝔾_m→𝔸¹` over an algebraically closed field and invertible finite field coefficients, `j_!*Λ[1]=Λ_𝔸¹[1]`; it has no nonzero subobject or quotient supported at the origin.
- For the identity open immersion, intermediate extension is the identity.
- Restricting intermediate extension back to the open recovers its input, and applying it to zero gives zero.
- On a geometric point the integral torsion sheaf `ℤ_ℓ/ℓ` has dual `(ℤ_ℓ/ℓ)[−1]` in the `p⁺` heart, not the `p` heart; its `H¹` is nonzero torsion, testing the `p⁺` upper bound.
- On the affine arithmetic point `Spec ℝ` with `Λ=𝔽₂`, `Λ[0]` is perverse but `Hⁱ_et(Spec ℝ,Λ)=𝔽₂` for every `i≥0`. Its geometric point has no positive cohomology, so affine vanishing is asserted geometrically.
- For `j:𝔾_m→𝔸¹` over `𝔽̄_p`, coefficients `𝔽_p` are excluded: the independent Artin–Schreier classes `t^(−a)`, `p∤a`, in the strict-local fraction field give an infinite-dimensional `(R¹j_*𝔽_p)_0`, so `Rj_*` does not preserve constructibility.

## F.10.3 Perfect-complex traces and coherent additivity

**Perfect-complex traces and coherent additivity.** PerfectComplex.lefschetzNumber,
PerfectComplex.filteredTraceAdditivity. For a commutative ring `R` and an endomorphism
of a perfect derived `R`-module object, lift to a bounded finite-projective representative
and take the alternating termwise trace given by Tau Ceti's `LinearMap.projectiveTrace`, with its
finite-free comparison `LinearMap.projectiveTrace_eq_trace`, base change
`LinearMap.projectiveTrace_baseChange` and cross-object cyclicity `LinearMap.projectiveTrace_cyclic`. Prove representative, lift and homotopy
independence, shift sign, scalar extension, tensor/dual identities and agreement with
cohomology traces when cohomology is finite projective or `R` is a field. Identify the module
objects satisfying `DerivedDeRham.IsPerfect R K`, equivalently its alias
`PerfectComplex.IsPerfect R K` from DerivedModuleAlgebra §1.E.0, with the dualizable
objects for the tensor of DerivedModuleAlgebra §0.2, using Mathlib's existing notions
(Stacks, Tag 0FNS). Consume
DGAInfinity Layer 5's perfect/compact equivalence on the one-object DG category `R`
concentrated in degree zero. Construct `PerfectComplexInput(R)` as the realization
equivalence from these perfect DG objects onto the full subcategory of
`DerivedCategory (ModuleCat R)` defined by that
shared predicate, and prove the dualizable comparison through it. Its unit, counit and
comparisons are natural in module morphisms and coefficient maps and commute with shifts,
scalar extension, tensor, duals and finite filtered graded-piece maps. A bounded
finite-projective representative realizes to its usual derived object, and its trace to
the alternating termwise trace.
Construct filtered derived objects and endomorphisms before localization and prove
`L(u,K)=Σ_a L(grᵃu,grᵃK)` when the finite filtration and its graded pieces are perfect.
Use this coherent enhancement for open–closed additivity and devissage.

Build Hattori–Stallings trace for finite projective right modules over every ring `R` in the
additive quotient `R/[R,R]`, with cyclicity, complement independence, direct-sum/split-exact
additivity, scalar extension and the commutative tensor/dual/rank rules. Right modules
use left modules over the opposite ring. Prove that the commutative specialization of
Hattori–Stallings trace agrees with the supplied `LinearMap.projectiveTrace`. Over commutative
rings use PadicMeasuresIwasawaAlgebras §5.1's `projectiveDeterminant`,
`projectiveDeterminantMap` and base-change API. Define the scalar determinant of an
endomorphism through `End(det P)≅R`, and its characteristic polynomial by applying that
determinant to `T·id−u` after `R→R[T]`; prove agreement with the finite-free API. For finite `G` define `ε:Λ[G]/[Λ[G],Λ[G]]→Λ/[Λ,Λ]` by the identity coefficient and
`Tr^G=ε∘Tr_HS` on finite-projective `Λ[G]`-modules. For an extension
`1→G→Γ̃→ℤ→1` let `Γ` be the inverse image of `ℕ`. If `P` is a `Λ[Γ]`-module finite projective
as a `Λ[G]`-module and `γ∈Γ`, put `Z_γ={g∈G | gγ=γg}`; prove
`Tr_Λ(γ,P)=|Z_γ|Tr_Λ^(Z_γ)(γ,P)` and
`Tr_Λ(1,P_G)=Σ′_(γ↦1) Tr_Λ^(Z_γ)(γ,P)`, with one summand per `G`-conjugacy class.
For commutative `A` mapping centrally to `Λ`, `P` finite projective over `A[G]` with `Γ`-action,
and `M` a `Λ[Γ]`-module finite projective over `Λ`, prove diagonal tensor projectivity and
`Tr_Λ^(Z_γ)(γ,P⊗_A M)=Tr_A^(Z_γ)(γ,P)·Tr_Λ(γ,M)`. Build induction and the auxiliary
`A=ℤ/ℓⁿ` coefficient-descent argument used in the curve proof. These are the precise
monoid-extension identities of Stacks §64.15, Lemmas 64.15.1–64.15.9.
No division by `|G|` is used. Generic code belongs in module and category-theory namespaces,
outside algebraic geometry. The split-retract comparison
PerfectComplex.projectiveTraceOfRetract takes an inclusion `i : P → Rⁿ` and a retraction
`r : Rⁿ → P` with `r∘i=id` and is the Mathlib finite-free trace of `i∘u∘r`. Prove that it equals
Tau Ceti's `LinearMap.projectiveTrace R P u`, the contraction
`contractLeft R P ((dualTensorHomEquiv R P P).symm u)`, by `LinearMap.projectiveTrace_eq_trace`
and `LinearMap.projectiveTrace_cyclic`; independence of the chosen split retract follows. Every
finite projective admits such a finite-free retract.
(Stacks §§64.4–64.6, 64.15; finite-projective duality and filtered-complex trace formalism.)
*Needs:* EnhancedDerivedSheaves §§0.1–0.4 enhancement/tensor; the finite filtered enhanced objects constructed in this target before localization;
Mathlib projective modules, matrices and trace; DerivedModuleAlgebra §§0.2, 1.E.0 for
module-derived tensor and the shared ordinary-module perfectness predicate;
Tau Ceti's `LinearMap.projectiveTrace` for commutative projective trace; DGAInfinity Layer 5 for
perfect/compact equivalence; PadicMeasuresIwasawaAlgebras §5.1 for finite-projective
determinants and determinant maps.
Geometric uses verify coefficient-ring perfectness by §F.3 and group-ring perfectness by
§F.10.4; neither geometric assertion is a prerequisite of this algebraic trace construction.

**Checks.**

- A shift by one negates the Lefschetz number.
- An acyclic bounded projective representative has trace zero.
- The identity on `[ℤ/4 —2→ ℤ/4]` has Lefschetz number zero, although both cohomology
  modules are `ℤ/2` and their finite-projective traces are not defined.
- Group-ring identities remain meaningful when `|G|` is zero in `Λ`.
- For any finite-free split retract with `r∘i=id`, the zero endomorphism has split-retract trace zero.
- On the standard rank-`r` free retract the identity has trace `r`, including `r=0`.
- On `ℤ`, `i=0` and `r=id` do not satisfy `r∘i=id`, so they are excluded as retract data; their raw cyclic expression would give zero for the identity instead of one.
- On `R²`, `diag(a,b)` has trace `a+b`; adjoining a zero complement to the split retract leaves that value unchanged.
- For `R=k×k` and `P=(1,0)R` with `u` multiplication by `(a,b)`, the characteristic polynomial is `(T−a,1)` in `k[T]×k[T]`; the supplied determinant handles the ranks `(1,0)`.

## F.10.4 Free-torsor equivariant compact-support perfectness

**Free-torsor equivariant compact-support perfectness.**
VanishingCycles.freeTorsorEquivariantPerfectness. Let `U` be a smooth affine curve over a
field `k`, `ℓ` invertible in `k`, `A=ℤ/ℓ^ν` with `ν≥1`, and `q:V→U` a finite étale torsor under a
finite constant group `G` acting on the left. On the existing enhanced étale module-sheaf
carriers construct the actual deck-equivariant complex
`P_A=RΓc(V_k̄,A)≅RΓc(U_k̄,q_*A)` and prove `P_A∈D_perf(A[G])`. Use the left action
`g·s=(g⁻¹)*s` on `q_*A` and cohomology; right modules are left modules over the opposite ring,
with `p·g=g⁻¹·p`. `RΓc` is §F.2.5's, which takes no compactification argument; prove that the deck action is compatible with lowerShriekIso for every compactification, field-extension compatibility
and derived reduction `P_A⊗ᴸ_A A′≅P_A′` for `A′=ℤ/ℓ^μ`, `1≤μ≤ν`. If `q` and its `G`-action
are defined over finite `k`, retain the commuting Frobenius action of frobeniusCohomology.

Build the finite-ring perfectness argument needed here for the actual possibly
noncommutative ring `R=A[G]`: `q_*A` is locally free of rank one over `R`, and its extension
by zero to a projective compactification of `U` is constructible of Tor amplitude `[0,0]`
over `R`. Construct right–left derived tensor over `R` on these same enhancement carriers
using flat resolutions, with quasi-isomorphism invariance and associative coefficient
extension. Prove the projection comparison
`N⊗ᴸ_R RΓc(U_k̄,q_*A)≅RΓc(U_k̄,N⊗ᴸ_R q_*A)` for right `R`-modules `N`.
Finite cohomology and the uniform geometric cohomological bound then give finite Tor
amplitude and a bounded finite-projective `R`-representative. This is perfectness of the
total complex, without projectivity of its cohomology modules. No invertibility of `|G|`
is assumed. (Stacks §64.13, Proposition 64.13.1, tag 03TV, proof with right coefficient
modules; §64.16, Steps 4–7, tag 03UF.) *Needs:* §F.0.2 finite étale torsors;
F.1 enhanced module sheaves and coherent actions; F.2 compact-support construction;
F.3 geometric finiteness and cohomological dimension; EnhancedDerivedSheaves §§0.1–0.4; §§0.7–0.8 (enhancement and arbitrary-ring torsion lower shriek).
The noncommutative projection and Tor argument on this torsor domain are targets here.

**Checks.**

- The trivial torsor `V=G×U` gives `P_A≅A[G]⊗_A RΓc(U_k̄,A)`, perfect over `A[G]`.
- The free Kummer `C_ℓ`-torsor `t↦t^ℓ` on `𝔾_m` over `k` containing `μ_ℓ`, `char k≠ℓ`, satisfies
  the theorem with `A=𝔽_ℓ`, including when `ℓ` divides `|G|`.
- On a point with trivial `C₂`-action, `A=𝔽₂` is perfect over `A` but not over
  `A[C₂]=𝔽₂[ε]/(ε²)`: the resolution with differential `ε` gives `Tor_i(A,A)=A` for every `i≥0`.
  This action is not a torsor and does not satisfy the free-action hypothesis.
- Reducing from `ℤ/ℓ²` to `𝔽_ℓ` gives the same equivariant complex as constructing `P_𝔽ℓ` directly.

## F.10.5 Derived coefficient descent along a finite torsor

**Derived coefficient descent along a finite torsor.**
VanishingCycles.freeTorsorCoefficientDescent. On the preceding torsor domain let `Λ` be a
finite commutative `A`-algebra and `M` a finite projective `Λ`-module with left `Λ`-linear `G`-action.
Let `F_M` be the descended lisse sheaf, with `q*F_M` identified with the constant `M`-sheaf and
its given descent action. Give `q_*A⊗_A M` and `P_A⊗ᴸ_A M` the diagonal left `G`-action and
convert both to right `Λ[G]`-modules by `x·g=g⁻¹·x`; `Λ` is the trivial left `Λ[G]`-module.
Prove `(q_*A⊗_A M)⊗ᴸ_Λ[G]Λ≅F_M` on sheaves and the derived compact-support counterpart

`RΓc(U_k̄,F_M) ≅ (P_A⊗ᴸ_A M)⊗ᴸ_Λ[G]Λ`.

Construct these equivalences in the supplied enhancement, with naturality in `M`,
coefficient reduction, field extension and, over finite `k` with descended data,
Frobenius compatibility. The diagonal tensor of a finite-projective `A[G]`-representative
of `P_A` with `M` is termwise finite projective over `Λ[G]`, although `M` need not be projective
over `A`. Derive the comparison by finite-cover pushforward, the sheaf coinvariant
identification and the right-module projection formula above; no exactness of ordinary
coinvariants for arbitrary `G`-modules is used. (Stacks §64.16, Steps 4–7, tag 03UF;
§64.15, Lemma 64.15.8, tag 03UC.) *Needs:* freeTorsorEquivariantPerfectness;
§F.0.2 finite-cover descent; F.1 coherent derived tensor; PerfectComplex diagonal tensor
projectivity and trace algebra; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `G=1` gives `RΓc(U_k̄,M)≅RΓc(U_k̄,A)⊗ᴸ_A M`.
- On the free Kummer `C_ℓ`-torsor with `Λ=M=𝔽_ℓ` and trivial coefficient action,
  derived diagonal coinvariants recover `RΓc((𝔾_m)_k̄,𝔽_ℓ)`, including its degrees one and two.
- For `A=ℤ/ℓ²` and `Λ=M=𝔽_ℓ` the comparison still holds; `M` is `Λ`-free but not `A`-projective.
- Frobenius and reduction commute in the comparison square whenever the torsor and
  coefficient descent data are defined over the finite base field.

## Downstream consumers

The consumer roadmaps include FourierDeligneTransform, WeilConjectures, LefschetzPencilsAndVanishingCycles, ClassicalAdicEtaleCohomology, ComplexComparisonPartII, InverseGaloisAndArithmeticFundamentalGroups, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, NeronModelsAndSemistableAbelianVarietiesPartII, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, DeligneWeightsAndPurity, FiniteFlatGroupsAndIntegralPadicHodgeTheory, ArithmeticLocallySymmetricSpaces, ModularCurvesPartII, DiamondEtaleCohomology, AutomorphicLFunctionsAndLocalFactors and GL2AutomorphicRepresentationsAndTransfer. Consumers use each interface on its stated coefficient and geometric domain.

- Scheme targets ClassicalCoefficients and ClassicalAlgebraic in §§0.5–0.11 are the common algebraic interfaces; analytic instantiations use these interfaces.
- Sections F.0–F.8, F.3a and F.10 supply the finite/adic coefficient, trait and trace inputs to nearby-cycle and pencil constructions.
- Sections F.0.2–F.0.A2 supply `EtaleFundamentalGroup`, `EtaleFundamentalGroup.map`, `arithmeticExactSequence` and the multiplicative-group and SchemeInertia inputs to arithmetic fundamental-group applications; the field case is Tau Ceti's `TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber`, which they cite directly.
- Section F.4.0 supplies the matrix form of the stable-lattice theorem, saturation and dual lattices on Tau Ceti's `TauCeti.ContinuousRep` and `TauCeti.GaloisLattice.IntegralModel` to arithmetic representation applications, which cite those Tau Ceti declarations directly; coefficient-field descent and building comparisons belong to those applications.
- Section F.3a supplies VanishingCycles.tameCharacter_eq_inertiaTameCharacter, including the henselian inertia/residue-Tate identifications and positive Kummer direction, to arithmetic representation and Néron-model applications.
- Section F.10.1 supplies Scheme.Hom.pointCount, Scheme.Hom.pointCount_eq_numberOfRationalPoints and VanishingCycles.frobeniusFixedPoints to the zeta functions of WeilConjectures and to the point counts and zeta series of DeligneWeightsAndPurity §1.10, whose count over a field extension is Tau Ceti's `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`, and §§F.0.3, F.2 and F.5 supply the six operations, twists and rank-one lisse sheaves to FourierDeligneTransform.

## References

The individual targets give theorem, section, page and Stacks-tag locators.

- SGA 1, *Revêtements étales et groupe fondamental*, Exposés V, IX, X and XIII; [scan](https://arxiv.org/pdf/math/0206203v2).
- SGA 4, *Théorie des topos et cohomologie étale des schémas*, Exposés V–IX, XII and XIV–XVIII; SGA 4½, *Cohomologie étale*, [Th. finitude], [Cycle] and [Rapport]; SGA 5, *Cohomologie ℓ-adique et fonctions L*, Exposés III, VI and VII.
- P. Deligne, *La conjecture de Weil I*, and P. Deligne and N. Katz, directors, *SGA 7 II*, Exposé XIII, 0.2.5 and Rappel 1.1.3; [scan](https://publications.ias.edu/sites/default/files/Number12.pdf).
- L. Illusie, *Autour du théorème de monodromie locale* (1994), §4, and *Vanishing cycles over general bases* (2006), §1.1; [2006 text](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf).
- B. Bhatt and P. Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015), §§3, 5–7; [author PDF](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf).
- A. Beilinson, J. Bernstein and P. Deligne, *Faisceaux pervers* (BBD), §§1.4, 2.2, 4.1.1 and 4.4; L. Illusie, Y. Laszlo and F. Orgogozo, *Travaux de Gabber* (ILO), Exposés XVI–XVII.
- D. Juteau, *Decomposition numbers for perverse sheaves*, §2.1, equations (2.4)–(2.7), for integral perversities and the torsion tilt; [text](https://www.numdam.org/item/10.5802/aif.2461.pdf).
- R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces* (1996), Proposition 2.4.4 and Corollary 2.4.6, pp. 127–129, and Theorem 3.9.1, p. 230.
- K. Fujiwara, *A proof of the absolute purity conjecture (after Gabber)*, §1.1; S. Li, E. Reinecke and B. Zavyalov, *Relative Poincaré duality in nonarchimedean geometry*, §§3.2–3.4 (cycle classes), §6.1 (Theorem 6.1.1, the smooth trace) and §6.4 (Theorem 6.4.1, Poincaré duality); [preprint](https://arxiv.org/abs/2410.08200v1).
- H. Darmon, F. Diamond and R. Taylor (DDT), *Fermat’s Last Theorem*, §2.1, paragraph after Proposition 2.6, for stable-lattice existence; [text](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). K. Ribet, *A modular construction of unramified p-extensions of `ℚ(μ_p)`*, Invent. Math. 34 (1976), §2, pp. 153–154.
- G. Böckle, M. Harris, C. Khare and J. Thorne (BHKT), *Ĝ-local systems on smooth projective curves are potentially automorphic*, Theorem 4.8(ii).
- The Stacks Project: [compactifications](https://stacks.math.columbia.edu/tag/0F41), [lower shriek](https://stacks.math.columbia.edu/tag/0F7H), [torsor perfectness](https://stacks.math.columbia.edu/tag/03TV), and the individual locators in the targets.
